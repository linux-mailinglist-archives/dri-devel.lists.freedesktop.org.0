Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BCECB9A34
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 20:28:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD98310E945;
	Fri, 12 Dec 2025 19:28:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HNoDQdsX";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E+opd/46";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F63A10E945
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 19:28:16 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BC9jrhY2456869
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 19:28:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=4iG8dDsSSuKdKDc0EjULhQtf
 uZmHQl5OwS9CIR2jEPc=; b=HNoDQdsXrM9rNYii9DI9/UxQ1oGs+b3BPCjqvDfk
 onAQeUZlwo/gRBCPIzFFsLMCfBUya8Ur+NW+8my6dZdMTDw7dVmBMN7YPADjSNQs
 1O50e5kDRJSc/GyRGIQ1OYJtHAp6d3S7LsWs/KAFfiDVGWDgwU88BP1+n61yMJ0R
 l0L3zAtunNNkGLoqtzBqWzDQ283IpfNjpfDcqASTe7PlhPoXzZy+Kkgfz0L6Yghh
 FnOa5zFXBceqtiaCr6niRNotIi7BzlFx/oAVFEAPNtOZjJ02+KpPS91V9aGQOiHS
 mSTokt3ZlKIxBHSNy4/2QD532OICqmz40Gh0X28vzenutA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b04r8tru9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 19:28:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ee0193a239so17450231cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 11:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765567695; x=1766172495;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4iG8dDsSSuKdKDc0EjULhQtfuZmHQl5OwS9CIR2jEPc=;
 b=E+opd/464WMxwNpU2AJPl/kRxsN8xpR+Yl7ttszHmZTPQE6QnDSEcis6eWXQXX/wFj
 Gmp6Ffa5HG6HMKXRmpqo1rcmwLatS95BrNemHVSbDhT8ajJMH5NOwET9f2ZA0X8i8TLp
 zyycFnDARDTqiNWnDX5MPn55/BWdYCzTbBedkrD+lDxTAojDfU726i+2jFtTjAt2SM8y
 b5DZ6HXV2rBhtVAvZgogltYhXdazKFtiswqM1Mb8AK6JJ5e4/gPHmSFYyNkWo80Aw1M/
 XECSdnK9Ck++QwDjZ9d5FuUR8EmLVq3cK/ML1YjVqMnp6OntWCoKsiLB1KcCMGT09XaH
 hPDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765567695; x=1766172495;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4iG8dDsSSuKdKDc0EjULhQtfuZmHQl5OwS9CIR2jEPc=;
 b=fwY6uoKfvvwOZSrfRC2g4EghdEEPeeuUC/BtiQsUYC5l0XYriLOFeRwGzF2PZgzrJK
 n8RA1YMrVdLZX0KabCmK9gE9kNajxqbeBDp7UdUfRsyKYXgNmX+pDYYREs7GKVJGtOpX
 BwSnmG8D9tRaeYwGbqvGGbhYjaIi5YwWYi97A+rc9Ffc0sy5glQjhbfnsmvJjxwp6NGn
 GLGZLGp5O9gkhi8rRYOUU8wgvKNY7dB1snPTNVZFIPX8MU38SrRfYh8eC2paocD1yeqZ
 7j2jOT86i7w6uPtlmdFDFUqyk13xzTZzDKEXbtyAQbe/VeXpemVvlf1GfUj5KtSLTK0x
 tjzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWY3OPW0RHseW6ygdsQPLbSpMYp6HdRbeg7lSNTmGEAwbnnVR4YCWAYfoU6dY5bTyFqUnbBHvo2kwo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzgiN7palofC0BkUllsYiiwGfOBrGFK57OXmuW6ht0oCOJitfyg
 SrhLqd9euKBJZSyN2undCy0QKb4+tDlDVUYv1j99Qk0k2RTvm0nfUW7wbzpi6ks3FHgb9BfOnRr
 KoxRbVOY2lwgi5twjPBa1JRZ7y3KJdOVbp6aV5VI+/radb51Xl+W44kmJJqt5ZRkpUrNVxM0=
X-Gm-Gg: AY/fxX6+RIPLmHYfI37KW0r07wGK1eojSPmvulHDwuAprP0829+XefxuUtl43q6bBOF
 B8kjhEbR0jY3ERMj6SXyO3rUoAuoVFbgAgv7F0+S/NwpoZ7+MRAnAglOLB5H2Zl7gUeT5RYdsDq
 vpwXrTViP6X7XO+5RQ47aGH9BJ49tVic70bwAwrYMr1zlcI57UeiUOCao4Fz1E3yNarO23B6z6X
 Xl5VvjqpEI8xcwhyOdzJuosEDzLht9E+ZmUdgPWjOFzu1EhvYKKgpyzP0rVoTcvk2y1KX92ED5S
 p43A8d71bjikbyji9oBvOvjMGmK0ArpEmyXNSzKe+WPXtcLZcX4oioLOgTyBJ5qCpihucjFfckN
 EdzZdxlu0oi52kK9ig4wzB/OxtqLkLcXXdh8s4qvWQB7HZfkj7+oRz0Ll679skfu3OGpbdGwCiD
 TtP1RqyQe6KkgNi9W1q1DmtXc=
X-Received: by 2002:ac8:6f05:0:b0:4ed:6dde:4573 with SMTP id
 d75a77b69052e-4f1d05defe5mr42633471cf.52.1765567694561; 
 Fri, 12 Dec 2025 11:28:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGzyr9/RXsJkVGr07JI30zn5AtzYTW2vr9z9xYxGmBwaQ2xPKZMLmJQAJgtcPN2kJ0FP8aDSg==
X-Received: by 2002:ac8:6f05:0:b0:4ed:6dde:4573 with SMTP id
 d75a77b69052e-4f1d05defe5mr42632881cf.52.1765567693969; 
 Fri, 12 Dec 2025 11:28:13 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-598f2f42215sm2300593e87.33.2025.12.12.11.28.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Dec 2025 11:28:13 -0800 (PST)
Date: Fri, 12 Dec 2025 21:28:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: sm6150: Add gpu and rgmu nodes
Message-ID: <wwrc637p5nkz6ptuef2hrhyjgqnyifcztlkjrqyw4764vg6jpf@wso4tp6onb5l>
References: <6fa1da5d-9ea7-4d72-a03a-82edc4bef099@oss.qualcomm.com>
 <3gqq3w6ovy5srgvabyeugsjbwrhaxmjvicykhjmlcxd74gtsaf@5u6wvvzeq52z>
 <90bc84e7-19ca-450d-b41f-fd96367e8cce@oss.qualcomm.com>
 <2e5sqv2gnxdfwnfsepzdkchxip5zdeamp6bzbamq6kbk77kr3p@u5i4rrnrywno>
 <9971bd9b-88db-4628-b36b-de50c1619396@oss.qualcomm.com>
 <raj276z7euq7skvhsw7prwzlgsdy6ay7bhm4wgb64mt63q4ot4@eyvhcou7qwgg>
 <57706b2e-becf-47ac-a874-79ce17d12b74@oss.qualcomm.com>
 <812cfa55-269d-4b19-8e18-4815608b6bbb@oss.qualcomm.com>
 <6agidc2r2d2jevtiizj77mtlytoo3raxaoe6b53rvk3obmmiha@x7pqjco4ulhg>
 <030a8eb3-c79e-4be0-8305-7c9bb2005785@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <030a8eb3-c79e-4be0-8305-7c9bb2005785@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=e/ULiKp/ c=1 sm=1 tr=0 ts=693c6ccf cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=mj4UdRjbQG8oDJo-2FUA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: -yFF1SVTt7Lth3VzQ_xrjvpp0-gPUVqY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEyMDE1NSBTYWx0ZWRfX0HOshUkumSsI
 7vKZWgMq1wssmsuSABGAAdV1xXlj9CRLRrzYp75zflSgSv/u9EH1vVUq/JpDhiRwE1DfNhrvaJl
 AD3uQRXDUDm7ONwT+5do7rzIKEdAfJa8LJgHJvJ45Do+EgKfj0h499u1UGItgMkAbmapPhz9vbn
 v92OC3FD1kLeEEe/fgyMQ211NnvGSMRNdEj4iaSIycsHb+NiWGToqJ9i8A9zpOI0oHto0QnUCM5
 ocXvTJ7IGaBg072Xk8/Dwuv/FrGgyR0bWsR/uOc3kioRvWrK1yiP7kQKJ+V5o11Xhn4R48LTH7l
 xXbyZW96z/xGY9YGUWukHHcCGLT1j9bdgxnkMFGbXf/1hbA4hqOFLStDMA3gTBunoqwATnBnDTu
 NHi2rkXyeO4rqDc3e7VEG5ExfP38lQ==
X-Proofpoint-GUID: -yFF1SVTt7Lth3VzQ_xrjvpp0-gPUVqY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_05,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512120155
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 12, 2025 at 01:01:44AM +0530, Akhil P Oommen wrote:
> On 12/11/2025 6:56 PM, Dmitry Baryshkov wrote:
> > On Thu, Dec 11, 2025 at 05:22:40PM +0530, Akhil P Oommen wrote:
> >> On 12/11/2025 4:42 PM, Akhil P Oommen wrote:
> >>> On 12/11/2025 6:06 AM, Dmitry Baryshkov wrote:
> >>>> On Thu, Dec 11, 2025 at 02:40:52AM +0530, Akhil P Oommen wrote:
> >>>>> On 12/6/2025 2:04 AM, Dmitry Baryshkov wrote:
> >>>>>> On Fri, Dec 05, 2025 at 03:59:09PM +0530, Akhil P Oommen wrote:
> >>>>>>> On 12/4/2025 7:49 PM, Dmitry Baryshkov wrote:
> >>>>>>>> On Thu, Dec 04, 2025 at 03:43:33PM +0530, Akhil P Oommen wrote:
> >>>>>>>>> On 11/26/2025 6:12 AM, Dmitry Baryshkov wrote:
> >>>>>>>>>> On Sat, Nov 22, 2025 at 03:03:10PM +0100, Konrad Dybcio wrote:
> >>>>>>>>>>> On 11/21/25 10:52 PM, Akhil P Oommen wrote:
> >>>>>>>>>>>> From: Jie Zhang <quic_jiezh@quicinc.com>
> >>>>>>>>>>>>
> >>>>>>>>>>>> Add gpu and rgmu nodes for qcs615 chipset.
> >>>>>>>>>>>>
> >>>>>>>>>>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> >>>>>>>>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >>>>>>>>>>>> ---
> >>>>>>>>>>>
> >>>>>>>>>>> [...]
> >>>>>>>>>>>
> >>>>>>>>>>>> +			gpu_opp_table: opp-table {
> >>>>>>>>>>>> +				compatible = "operating-points-v2";
> >>>>>>>>>>>> +
> >>>>>>>>>>>> +				opp-845000000 {
> >>>>>>>>>>>> +					opp-hz = /bits/ 64 <845000000>;
> >>>>>>>>>>>> +					required-opps = <&rpmhpd_opp_turbo>;
> >>>>>>>>>>>> +					opp-peak-kBps = <7050000>;
> >>>>>>>>>>>> +				};
> >>>>>>>>>>>
> >>>>>>>>>>> I see another speed of 895 @ turbo_l1, perhaps that's for speedbins
> >>>>>>>>>>> or mobile parts specifically?
> >>>>>>>>>>
> >>>>>>>>>> msm-4.14 defines 7 speedbins for SM6150. Akhil, I don't see any of them
> >>>>>>>>>> here.
> >>>>>>>>>
> >>>>>>>>> The IoT/Auto variants have a different frequency plan compared to the
> >>>>>>>>> mobile variant. I reviewed the downstream code and this aligns with that
> >>>>>>>>> except the 290Mhz corner. We can remove that one.
> >>>>>>>>>
> >>>>>>>>> Here we are describing the IoT variant of Talos. So we can ignore the
> >>>>>>>>> speedbins from the mobile variant until that is supported.
> >>>>>>>>
> >>>>>>>> No, we are describing just Talos, which hopefully covers both mobile and
> >>>>>>>> non-mobile platforms.
> >>>>>>>
> >>>>>>> We cannot assume that.
> >>>>>>>
> >>>>>>> Even if we assume that there is no variation in silicon, the firmware
> >>>>>>> (AOP, TZ, HYP etc) is different between mobile and IoT version. So it is
> >>>>>>> wise to use the configuration that is commercialized, especially when it
> >>>>>>> is power related.
> >>>>>>
> >>>>>> How does it affect the speed bins? I'd really prefer if we:
> >>>>>> - describe OPP tables and speed bins here
> >>>>>> - remove speed bins cell for the Auto / IoT boards
> >>>>>> - make sure that the driver uses the IoT bin if there is no speed bin
> >>>>>>   declared in the GPU.
> >>>>>>
> >>>>>
> >>>>> The frequency plan is different between mobile and IoT. Are you
> >>>>> proposing to describe a union of OPP table from both mobile and IoT?
> >>>>
> >>>> Okay, this prompted me to check the sa6155p.dtsi from msm-4.14... And it
> >>>> has speed bins. How comes we don't have bins for the IoT variant?
> >>>>
> >>>> Mobile bins: 0, 177, 187, 156, 136, 105, 73
> >>>> Auto bins:   0, 177,      156, 136, 105, 73
> >>>>
> >>>> Both Mobile and Auto chips used the same NVMEM cell (0x6004, 8 bits
> >>>> starting from bit 21).
> >>>>
> >>>> Mobile freqs:
> >>>> 0:         845M, 745M, 700M,       550M,       435M,       290M
> >>>> 177:       845M, 745M, 700M,       550M,       435M,       290M
> >>>> 187: 895M, 845M, 745M, 700M,       550M,       435M,       290M
> >>>> 156:             745M, 700M,       550M,       435M,       290M
> >>>> 136:                         650M, 550M,       435M,       290M
> >>>> 105:                                     500M, 435M,       290M
> >>>> 73:                                                  350M, 290M
> >>>>
> >>>> Auto freqs:
> >>>> 0:         845M, 745M, 650M, 500M, 435M
> >>>> 177:       845M, 745M, 650M, 500M, 435M
> >>>> 156:             745M, 650M, 500M, 435M
> >>>> 136:                   650M, 500M, 435M
> >>>> 105:                         500M, 435M
> >>>> 73:                                      350M
> >>>>
> >>>> 290M was a part of the freq table, but later it was removed as "not
> >>>> required", so probably it can be brought back, but I'm not sure how to
> >>>> handle 650 MHz vs 700 MHz and 500 MHz vs 550 MHz differences.
> >>>>
> >>>> I'm a bit persistent here because I really want to avoid the situation
> >>>> where we define a bin-less OPP table and later we face binned QCS615
> >>>> chips (which is possible since both SM and SA were binned).
> >>>
> >>> Why is that a problem as long as KMD can handle it without breaking
> >>> backward compatibility?
> >>
> >> I replied too soon. I see your point. Can't we keep separate OPP tables
> >> when that happen? That is neat-er than complicating the driver, isn't it?
> > 
> > I have different story in mind. We ship DTB for IQ-615 listing 845 MHz
> > as a max freq without speed bins. Later some of the chips shipped in
> > IQ-615 are characterized as not belonging to bin 0 / not supporting 845
> > MHz. The users end up overclocking those chips, because the DTB doesn't
> > make any difference.
> 
> That is unlikely, because the characterization and other similiar
> activities are completed and finalized before ramp up at foundries.
> Nobody likes to RMA tons of chipsets.
> 
> Anyway, this hypothetical scenarios is a problem even when we use the
> hard fuse.

So, are you promising that while there were several characterization
bins for SM6150 and SA6155P, there is only one bin for QCS615, going up
to the max freq?

> 
> > 
> >>
> >>>
> >>>>
> >>>> Also I don't see separate QFPROM memory map definitions for Mobile, IoT
> >>>> and Auto SKUs. If you have access to the QCS615 hardware, what is the
> >>>> value written in that fuse area?
> >>>>
> >>>>> Another wrinkle we need to address is that, so far, we have never had a
> >>>>> dt binding where opp-supp-hw property exist without the speedbin cells.
> >>>>> And that adds a bit of complexity on the driver side because, today, the
> >>>>> KMD relies on the presence of speed bin cells to decide whether to
> >>>>> select bin via opp_supp_hw API or not. Also, we may have to reserve this
> >>>>> combination (opp bins without speedbin cells) to help KMD detect that it
> >>>>> should use socinfo APIs instead of speedbin cells on certain chipsets.\
> >>
> >>> If it is a soft fuse, it could fall into an unused region in qfprom. On
> >>> other IoT chipsets like Lemans, Product teams preferred a soft fuse
> >>> instead of the hard fuse. The downside of the hard fuse that it should
> >>> be blown from factory and not flexible to update from software later in
> >>> the program.
> >>
> >> This response is for your comment above. Adding to that, the value for
> >> the hard fuse is mostly likely to be '0' (unfused), but all internal
> >> parts are always unfused. Maybe it is 'practically' harmless to use the
> >> freq-limiter hard fuse for now, because 845Mhz is the Fmax for '0' on
> >> mobile, Auto and IoT. I am not sure.
> >>
> >> I am trying to play safe here as this is dt. We don't want to configure
> >> the wrong thing now and later struggle to correct it. It is safe to
> >> defer things which we don't know.
> > 
> > What is "soft fuse"? Why do we need an extra entity in addition to the
> > one that was defined for auto / mobile units?
> 
> The hard fuse (freq limiter one) has to be blown at a very early stage
> in the chip manufacturing. Instead of that, a soft fuse region which is
> updated by the firmware during the cold boot is used to provide a hint
> to KMD about the supported GPU fmax. I was told that this provides
> better operational flexibility to the Product team.

Do you have an upstream example by chance?

> 
> -Akhil
> 
> > 
> >>
> >> -Akhil.
> >>
> >>>
> >>> -Akhil.
> >>>
> >>>>
> >>>> We already have "machine" as another axis in the GPU catalog. I'd
> >>>> suggest defining separate speed bins for mobile and auto/IoT in the DT
> >>>> (0x1 - 0x20 for mobile, 0x100 - 0x1000 for auto) and then in the driver
> >>>> mapping those by the machine compat.
> >>>>
> >>>
> >>
> > 
> 
> 

-- 
With best wishes
Dmitry
