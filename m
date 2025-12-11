Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FB4CB45AD
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 01:37:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D88510E095;
	Thu, 11 Dec 2025 00:37:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="D97jvr7v";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QCrr3Dr9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87A3910E28F
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 00:37:06 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BALPLPv4126716
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 00:37:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=pZzAZ1zm1N4FbJQbSE80XG/1
 cSHskcB/DOZCdQCyfNQ=; b=D97jvr7vxEW/ywGpKeSi/HiLaUijYq8OHC7xgWxm
 MgNDqf/tbXfgpmXrPB9v2Y9PdNqVOLKB2jWDnJ8gSfPwiPxR1sIjRyHOFoDqWtoy
 /0il/5G1q4UBlRAVapJ7Bn0ETj9mBnAwXvwxD/CfUtU+4HiSksTh+G+5aP886S+L
 edVF3g5WAHOV/8VjbekHyd85XRT7sJ1OI0a3IYptnZrkRqQLn79q7XjHABDEMSvr
 PrchPTfpfzw9IRgJD82T5tsQ6kdIQeZCrmZjyXBS7LfhobmZ0FekdG5iOynaKH1/
 mHWsXLqdb7YsGDhTMNsGNFwMb3iFcde5SQT3c1xyw9AS+A==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aybhp9mfq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 00:37:05 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id
 71dfb90a1353d-55fc4204d3cso833407e0c.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 16:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765413425; x=1766018225;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=pZzAZ1zm1N4FbJQbSE80XG/1cSHskcB/DOZCdQCyfNQ=;
 b=QCrr3Dr9iatSzadkyDGXh/xtpiXsV9BJaSOST4oL66TIzuwVzisuuqj742lxB+MC5N
 NxSgYc4w1qLXv4iwxtdix7YVKgqLkDcfPLIrRl3masujmabjkVAtC8+kH7TMBWLKZz1/
 kFIv2a94/3IIVJdAKMN7uB6el6OsoG003QGrHj63PoTjrm+VaIx3fwjtv/2MfnEafBGj
 NubkbURTiDGpxhUlpQhKVSR5AIeHpd6HsUqBocTAcVkUpK23svUscO8EGehPafMfhPzR
 BywMQh6vBxG6bOOsL/e8BCLpOOuAOIPqMEffPFOKVpJ7wbKcppHHw99M7XUxcWKNwgZK
 07xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765413425; x=1766018225;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pZzAZ1zm1N4FbJQbSE80XG/1cSHskcB/DOZCdQCyfNQ=;
 b=Nd3UEkeiP6bpV462BmCXl8OtUeKcRU7ikm8u7Vv1tIQ52Y3z3+hpstq1T6v01ClW2j
 pz/iEEAA+nPhFKiGoc8S9YtxsUlRE7rA817V480AWKLu+tGsNfkJMzG76USgLav6USAH
 I3pxlXHLiFa0JVdpESjDULUHzTkpnLqye1JxYs/hHLIuBIyLMWsp0cjMu8uOvRZ0Ohb/
 4RSipxMEYoeW1XEOwJoaIOgKZnBSDRqZ6ktxCol/A486B1HzYNKXpCStns1UbNe97Zqi
 8ygFe8iDf4q3Jt3s/lzQIu7EKlxBWxgnNv5uinxuubeQ+wMvFiC6K5pmS6QzYarDgnFl
 hinA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPQWvYQzpxT+l+cEe+u7U7uHu5Bp/MJ+XkDsY5W+fPK9v8X1CN9Xk3dWrf9Q9HjAwGxCcM+i1MBOc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwAjrfCxjec6lETsK577C3wwlfoxPBHJEYCrm0PbFKOiL+U7sJR
 TQn2Lj6abF5TIiKalIQftHY65c4ieDE8sbCuaJ9vVZUR4Cxq0sX6F8YJqkJdouC5AVYKgi1cNVR
 GLhohKO1x6Vqom0mCdHwANbeGyBxEoXAZwMS/VNXurmO1n0Nxsp3j8n5r12cKFTulzg15Eqg=
X-Gm-Gg: AY/fxX40Z2r5FN6bJEmNO8a4Zk3b04YfXa6MKGrwBmpFyF1OJBduDApTU2pigudo2BF
 INGx6RZfv48vut6iWsJOJBSCkuaAi+f/B7LTiiBnDbQqRqqPDjWkRIhxnJZ6nqrSgAQR4wCLpMp
 7sZ0T/f/7vJNahIsgFMaQtxujc71vrlEanFZQCUZE3kpPYY8NfdO/zottsRJCWXzmyBUGM+A8ir
 XBxHwE6GfJgwaaAIFIrLWbz08HZCTs9IZFCSgtkdYm4s5lBdqQemeRfjJfVX76kNzpK1fHgUgDa
 qvmOozF5DZEHt+CK+a1tB8jeGP8kMBx3voYNZChl/jS6l/2reOiIPYeFsSIMj2MUlx99+mN51JX
 RLwDDzlJmmqCKprBfU4zlnqMbf8QoF/kfvpqjki3oUEIeaZEixmvsJIsTjsi1HjmuxiEnIcGNky
 bEzTLM12z49YfQldlZ9X3exwk=
X-Received: by 2002:a05:6122:3c93:b0:55b:305b:4e35 with SMTP id
 71dfb90a1353d-55fcfc75df0mr1515218e0c.21.1765413424701; 
 Wed, 10 Dec 2025 16:37:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGKkw0sCxCLy8yx7BA6u+OWcK0baof+gmuLoAvEjnlXyvNsyZ4djMWZObTKNZnEHvIN617ngA==
X-Received: by 2002:a05:6122:3c93:b0:55b:305b:4e35 with SMTP id
 71dfb90a1353d-55fcfc75df0mr1515204e0c.21.1765413424120; 
 Wed, 10 Dec 2025 16:37:04 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37fbc9a3b77sm2759181fa.10.2025.12.10.16.37.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Dec 2025 16:37:02 -0800 (PST)
Date: Thu, 11 Dec 2025 02:36:58 +0200
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
Message-ID: <raj276z7euq7skvhsw7prwzlgsdy6ay7bhm4wgb64mt63q4ot4@eyvhcou7qwgg>
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-qcs615-spin-2-v3-5-9f4d4c87f51d@oss.qualcomm.com>
 <8560ad26-4756-4c2a-97c3-2c5c0695172c@oss.qualcomm.com>
 <z4gqro2bx6oq2ht75m2klogo5dsirb74tmc3u3shjyalxmaxil@5sy7ufmqhdgw>
 <6fa1da5d-9ea7-4d72-a03a-82edc4bef099@oss.qualcomm.com>
 <3gqq3w6ovy5srgvabyeugsjbwrhaxmjvicykhjmlcxd74gtsaf@5u6wvvzeq52z>
 <90bc84e7-19ca-450d-b41f-fd96367e8cce@oss.qualcomm.com>
 <2e5sqv2gnxdfwnfsepzdkchxip5zdeamp6bzbamq6kbk77kr3p@u5i4rrnrywno>
 <9971bd9b-88db-4628-b36b-de50c1619396@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9971bd9b-88db-4628-b36b-de50c1619396@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDAwMyBTYWx0ZWRfX61M2GwV+60QB
 NEpmPyxeCjVh08Qv3z+cIAY2MD+OnHMhApz3l6Vwht8sfo6t3OHOin7rdA39aZDW5L8B3EG3iMs
 7nLG1+yCBG3xGqHTjNldw2HDpwvWGn8JW/xxIVKHStTDbi2tY5QKSY7Aj7l2OFSmprTmUx3Wew6
 JYFzUV49wDqDZ4wFQMFXY5LwrG7dIoJF2XlCDliQD7nJAVte/4IQXC9AO+hZyQ2e7OCOh4o/wo2
 QZA8hFa6kvI8KvfQBIGMGwl8GhT+fkiqMxtemfDprNQ6h6LJCTk9CgvxIs1rvPLhzLNVgOE9an7
 w5XhvTMdzKYKrMODX8aXbjTo07xChr17ZFtyVDuLW7Gpja+xNdCzW1EmZ1BzGsJsauytdaGZM2M
 Wb45uGV+XZqvHVTRyN30EgBRdVcatw==
X-Proofpoint-ORIG-GUID: OYSdCPMxXGofK1Uj-adYzp83OjCCI6vU
X-Proofpoint-GUID: OYSdCPMxXGofK1Uj-adYzp83OjCCI6vU
X-Authority-Analysis: v=2.4 cv=LJ9rgZW9 c=1 sm=1 tr=0 ts=693a1231 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=1kFrs4HfXbbYKCOWPsIA:9 a=CjuIK1q_8ugA:10
 a=XD7yVLdPMpWraOa8Un9W:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110003
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

On Thu, Dec 11, 2025 at 02:40:52AM +0530, Akhil P Oommen wrote:
> On 12/6/2025 2:04 AM, Dmitry Baryshkov wrote:
> > On Fri, Dec 05, 2025 at 03:59:09PM +0530, Akhil P Oommen wrote:
> >> On 12/4/2025 7:49 PM, Dmitry Baryshkov wrote:
> >>> On Thu, Dec 04, 2025 at 03:43:33PM +0530, Akhil P Oommen wrote:
> >>>> On 11/26/2025 6:12 AM, Dmitry Baryshkov wrote:
> >>>>> On Sat, Nov 22, 2025 at 03:03:10PM +0100, Konrad Dybcio wrote:
> >>>>>> On 11/21/25 10:52 PM, Akhil P Oommen wrote:
> >>>>>>> From: Jie Zhang <quic_jiezh@quicinc.com>
> >>>>>>>
> >>>>>>> Add gpu and rgmu nodes for qcs615 chipset.
> >>>>>>>
> >>>>>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> >>>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >>>>>>> ---
> >>>>>>
> >>>>>> [...]
> >>>>>>
> >>>>>>> +			gpu_opp_table: opp-table {
> >>>>>>> +				compatible = "operating-points-v2";
> >>>>>>> +
> >>>>>>> +				opp-845000000 {
> >>>>>>> +					opp-hz = /bits/ 64 <845000000>;
> >>>>>>> +					required-opps = <&rpmhpd_opp_turbo>;
> >>>>>>> +					opp-peak-kBps = <7050000>;
> >>>>>>> +				};
> >>>>>>
> >>>>>> I see another speed of 895 @ turbo_l1, perhaps that's for speedbins
> >>>>>> or mobile parts specifically?
> >>>>>
> >>>>> msm-4.14 defines 7 speedbins for SM6150. Akhil, I don't see any of them
> >>>>> here.
> >>>>
> >>>> The IoT/Auto variants have a different frequency plan compared to the
> >>>> mobile variant. I reviewed the downstream code and this aligns with that
> >>>> except the 290Mhz corner. We can remove that one.
> >>>>
> >>>> Here we are describing the IoT variant of Talos. So we can ignore the
> >>>> speedbins from the mobile variant until that is supported.
> >>>
> >>> No, we are describing just Talos, which hopefully covers both mobile and
> >>> non-mobile platforms.
> >>
> >> We cannot assume that.
> >>
> >> Even if we assume that there is no variation in silicon, the firmware
> >> (AOP, TZ, HYP etc) is different between mobile and IoT version. So it is
> >> wise to use the configuration that is commercialized, especially when it
> >> is power related.
> > 
> > How does it affect the speed bins? I'd really prefer if we:
> > - describe OPP tables and speed bins here
> > - remove speed bins cell for the Auto / IoT boards
> > - make sure that the driver uses the IoT bin if there is no speed bin
> >   declared in the GPU.
> > 
> 
> The frequency plan is different between mobile and IoT. Are you
> proposing to describe a union of OPP table from both mobile and IoT?

Okay, this prompted me to check the sa6155p.dtsi from msm-4.14... And it
has speed bins. How comes we don't have bins for the IoT variant?

Mobile bins: 0, 177, 187, 156, 136, 105, 73
Auto bins:   0, 177,      156, 136, 105, 73

Both Mobile and Auto chips used the same NVMEM cell (0x6004, 8 bits
starting from bit 21).

Mobile freqs:
0:         845M, 745M, 700M,       550M,       435M,       290M
177:       845M, 745M, 700M,       550M,       435M,       290M
187: 895M, 845M, 745M, 700M,       550M,       435M,       290M
156:             745M, 700M,       550M,       435M,       290M
136:                         650M, 550M,       435M,       290M
105:                                     500M, 435M,       290M
73:                                                  350M, 290M

Auto freqs:
0:         845M, 745M, 650M, 500M, 435M
177:       845M, 745M, 650M, 500M, 435M
156:             745M, 650M, 500M, 435M
136:                   650M, 500M, 435M
105:                         500M, 435M
73:                                      350M

290M was a part of the freq table, but later it was removed as "not
required", so probably it can be brought back, but I'm not sure how to
handle 650 MHz vs 700 MHz and 500 MHz vs 550 MHz differences.

I'm a bit persistent here because I really want to avoid the situation
where we define a bin-less OPP table and later we face binned QCS615
chips (which is possible since both SM and SA were binned).

Also I don't see separate QFPROM memory map definitions for Mobile, IoT
and Auto SKUs. If you have access to the QCS615 hardware, what is the
value written in that fuse area?

> Another wrinkle we need to address is that, so far, we have never had a
> dt binding where opp-supp-hw property exist without the speedbin cells.
> And that adds a bit of complexity on the driver side because, today, the
> KMD relies on the presence of speed bin cells to decide whether to
> select bin via opp_supp_hw API or not. Also, we may have to reserve this
> combination (opp bins without speedbin cells) to help KMD detect that it
> should use socinfo APIs instead of speedbin cells on certain chipsets.

We already have "machine" as another axis in the GPU catalog. I'd
suggest defining separate speed bins for mobile and auto/IoT in the DT
(0x1 - 0x20 for mobile, 0x100 - 0x1000 for auto) and then in the driver
mapping those by the machine compat.

-- 
With best wishes
Dmitry
