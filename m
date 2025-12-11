Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E42CB603E
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 14:26:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 922BB10E2D9;
	Thu, 11 Dec 2025 13:26:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NuAMXTtm";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jdAl+Su+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D80110E2D9
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 13:26:46 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BBAXpi51597454
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 13:26:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=/IRQR4smN+uy1iULqb5RWAOO
 kyZInu1DUFc5g6QCkr0=; b=NuAMXTtmcTJloaRbJNWC9onC6eggaFFUgzro7t3K
 YeU4kTejVafOkerIHUZhzEkgK2Zy2psA1kClTsvVTORNjJ7ECxAKM0WygJHMV9LN
 xk4rbxQlQiXWzC4qd9PBVzNXn6ISmo2Sm46Kr8+lvYS4r4xNwPBC31fOaMW/R3SD
 jZoI5iA2KxvLcWTxBkvaP5CBvtnZe5gre3e1GTp2f6zuUzvesGZpQRtdLedcA1yG
 1E3rArCRAqyrwaRVnQ4g9ksiwMl5JzfeUsyrO6lMt503I2qnt9hivNDNEKcdfwZk
 mBjDUqUdrsEVjzVnrkVuTvw/3WlsGsuS8fH5Rp2WaKvGcg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aybhpbsp2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 13:26:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ee0995fa85so2181421cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 05:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765459605; x=1766064405;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/IRQR4smN+uy1iULqb5RWAOOkyZInu1DUFc5g6QCkr0=;
 b=jdAl+Su+gnrpuZ3ceq5HlORh65j2+UaBo/9uP0mkdC+HzravpLhjv11qa1SWyF7Ej5
 2HlqhTJClaHPooWEGaMyz9ce7c9SoutEJ0Vkstbg0PldRMGHeDJJwDnUbvuyx7IGou+y
 BB4t9yrQ2vF1Bw6RV63Boni8i0NB0H76NQEJ56GTuryQau24Za2PSG7ZoUapng5GLeyN
 KHxv9u6n9sCdxIOeeOGYHV4xjo49WEiZwYqOtTF4FZf5gGk2pRw4jLLQn0Z5ts2U+n2a
 s5pnJVHZxFeooM6OcXiN6j5PKkH9AC6nM5l4OQw0DxTF5S5w0/scMTFyAmBIBcBRZREU
 pFDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765459605; x=1766064405;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/IRQR4smN+uy1iULqb5RWAOOkyZInu1DUFc5g6QCkr0=;
 b=V52x/WOuMuQwQW0PqwWYKUgX2vzPaKphotNts1Ax3wONozCAYDH7iVH2HqdDyunyOU
 SOY69YOKy37mwM76qt+JuvsHabXxuwkPX21iwVz/5CBNJatVFDySdtGeXCMP/lYZzyYP
 /f+AT59WfCMceNCbSq839yp75qk+e39oU90iMwVDvsGF6wLf+1YCnNmoIyQayC5R0Pq5
 8IJq3QhPzIJys7bTc229j40bBlul8o8fQxnsFWGXifkj46uBrxrSasrgBxtoDKyIofRb
 sv2LnQ/ysvjtZCcBpU2gYlflk9IWhybBHjpMpAxB7SfEL075KS5r5DwOdwWkZQ2kANya
 sRbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYrsbwO20rSUQwkg4qxOvcBD9T/5tFQokD70fUkqRKLa4I8aSwVsc5JtBJwUH4RmAnxMFmyxDh17E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzz4Vy1asEvArvDNsYZ0OF8FdyVmA5t/uIG2+Xe/X+v80FF6E35
 nt9pOf9RqMio2IIcTq22n6L78IPReOWfUyh8rvccjq08MZYfk/qDm2AzQwOS7APbqEWNWIiAqnB
 uqYbxg4+PqBfbMKK2EEDqZ5HEP9g4geE4FvfR4jV8ICFaG0L80MzgSK5L/UwH1RDyU1PlhdE=
X-Gm-Gg: AY/fxX7CI/i6UiXTyi0Fs/DNt0n5RcCzU9DnmvkeJZGdpOUQpvHKMa0wIZKle/87D5Y
 hz4C0arfVYxBIL7f/lJnctWhkLZLh88XO4xzbMo5am8TEFkNlBG3EldfkdWsRtoCFtSzo9hEg8l
 g2kaKgnJcs0j0JsFY7xhD005Ose9zjwbgtT4zB6CdQVtbkSGJNPoRPgSKPbE+TE7fi+qqc9mUJL
 saR7vluBxS3WMMBFY2/tBNHTPEfcAmfvMIF00haGMMsFdpgkTWElYoImim+QbYmYNDBjK+qZhVo
 gIbwmUoAKgg9sSvIsQNwg31uP5xV+CiMkiC8L/jirgAFnXSm3wQCGdjQjHaRAclxHcfQIaPLGLA
 TPHP9fSyjheUNn6dV5DW/u+4XpX0xisZrMxm/f+S1veXyf5gHGF5S1XTOqAsBznMu1xBAGqlwr0
 xN3wh5O3EP4R3id9mfvdsupv8=
X-Received: by 2002:ac8:57d6:0:b0:4f0:2777:55c2 with SMTP id
 d75a77b69052e-4f1b19b8b33mr75336481cf.10.1765459604500; 
 Thu, 11 Dec 2025 05:26:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEMhykz6Ew8bA21aFvGlpOsS2rOr+FcEfspZn7Jc0WDl8ec4ZVtbWADVWFnmmpqSOzCT/28zw==
X-Received: by 2002:ac8:57d6:0:b0:4f0:2777:55c2 with SMTP id
 d75a77b69052e-4f1b19b8b33mr75335771cf.10.1765459603614; 
 Thu, 11 Dec 2025 05:26:43 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-598f3194dbcsm864481e87.78.2025.12.11.05.26.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 05:26:42 -0800 (PST)
Date: Thu, 11 Dec 2025 15:26:41 +0200
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
Message-ID: <6agidc2r2d2jevtiizj77mtlytoo3raxaoe6b53rvk3obmmiha@x7pqjco4ulhg>
References: <8560ad26-4756-4c2a-97c3-2c5c0695172c@oss.qualcomm.com>
 <z4gqro2bx6oq2ht75m2klogo5dsirb74tmc3u3shjyalxmaxil@5sy7ufmqhdgw>
 <6fa1da5d-9ea7-4d72-a03a-82edc4bef099@oss.qualcomm.com>
 <3gqq3w6ovy5srgvabyeugsjbwrhaxmjvicykhjmlcxd74gtsaf@5u6wvvzeq52z>
 <90bc84e7-19ca-450d-b41f-fd96367e8cce@oss.qualcomm.com>
 <2e5sqv2gnxdfwnfsepzdkchxip5zdeamp6bzbamq6kbk77kr3p@u5i4rrnrywno>
 <9971bd9b-88db-4628-b36b-de50c1619396@oss.qualcomm.com>
 <raj276z7euq7skvhsw7prwzlgsdy6ay7bhm4wgb64mt63q4ot4@eyvhcou7qwgg>
 <57706b2e-becf-47ac-a874-79ce17d12b74@oss.qualcomm.com>
 <812cfa55-269d-4b19-8e18-4815608b6bbb@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <812cfa55-269d-4b19-8e18-4815608b6bbb@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDEwNSBTYWx0ZWRfX8UefbGiuXDoo
 9q8DsIk7JE1o19g05Fgthoj9L/6p2XapsyD62WXXitIxuOy+U+IzLnLMhGvw1a37q/MG7XmxeVo
 enQOr7lBalBuqr7kPIGY4ShTqEbPKEWHO8i88+0B0lWgcO6y/78LhXoPihOYmXK6xI164nLh22K
 xFPhLS5CylhGjXHL1/2ft/JY/Ttjdo71jeKnLjqXoIKvlJ3Tt8FowityJ12szoavwepTqW0qCZ0
 8+CHUNH8Mbyem++wNBW+eIg/OlMu8PdHjRDDlaLbPkjRSaX5AMsdceX+S5jkA+wuB/YnZKY0gFI
 T0yGVNk47UJUVeUfqq0afxWRTicM0LeyTnZDj1oiMG88hPk4mdk/669JUzg03kV/ffj2aw4b+e/
 ZH1yk8LZKSO1fZby3E+9A2LuAHKSMw==
X-Proofpoint-ORIG-GUID: nkzWHhYZp3AtE-0MZigSwTNd75Emy--h
X-Proofpoint-GUID: nkzWHhYZp3AtE-0MZigSwTNd75Emy--h
X-Authority-Analysis: v=2.4 cv=LJ9rgZW9 c=1 sm=1 tr=0 ts=693ac695 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=LE2o2ln4a_ku5-eNlCgA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-11_01,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110105
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

On Thu, Dec 11, 2025 at 05:22:40PM +0530, Akhil P Oommen wrote:
> On 12/11/2025 4:42 PM, Akhil P Oommen wrote:
> > On 12/11/2025 6:06 AM, Dmitry Baryshkov wrote:
> >> On Thu, Dec 11, 2025 at 02:40:52AM +0530, Akhil P Oommen wrote:
> >>> On 12/6/2025 2:04 AM, Dmitry Baryshkov wrote:
> >>>> On Fri, Dec 05, 2025 at 03:59:09PM +0530, Akhil P Oommen wrote:
> >>>>> On 12/4/2025 7:49 PM, Dmitry Baryshkov wrote:
> >>>>>> On Thu, Dec 04, 2025 at 03:43:33PM +0530, Akhil P Oommen wrote:
> >>>>>>> On 11/26/2025 6:12 AM, Dmitry Baryshkov wrote:
> >>>>>>>> On Sat, Nov 22, 2025 at 03:03:10PM +0100, Konrad Dybcio wrote:
> >>>>>>>>> On 11/21/25 10:52 PM, Akhil P Oommen wrote:
> >>>>>>>>>> From: Jie Zhang <quic_jiezh@quicinc.com>
> >>>>>>>>>>
> >>>>>>>>>> Add gpu and rgmu nodes for qcs615 chipset.
> >>>>>>>>>>
> >>>>>>>>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> >>>>>>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >>>>>>>>>> ---
> >>>>>>>>>
> >>>>>>>>> [...]
> >>>>>>>>>
> >>>>>>>>>> +			gpu_opp_table: opp-table {
> >>>>>>>>>> +				compatible = "operating-points-v2";
> >>>>>>>>>> +
> >>>>>>>>>> +				opp-845000000 {
> >>>>>>>>>> +					opp-hz = /bits/ 64 <845000000>;
> >>>>>>>>>> +					required-opps = <&rpmhpd_opp_turbo>;
> >>>>>>>>>> +					opp-peak-kBps = <7050000>;
> >>>>>>>>>> +				};
> >>>>>>>>>
> >>>>>>>>> I see another speed of 895 @ turbo_l1, perhaps that's for speedbins
> >>>>>>>>> or mobile parts specifically?
> >>>>>>>>
> >>>>>>>> msm-4.14 defines 7 speedbins for SM6150. Akhil, I don't see any of them
> >>>>>>>> here.
> >>>>>>>
> >>>>>>> The IoT/Auto variants have a different frequency plan compared to the
> >>>>>>> mobile variant. I reviewed the downstream code and this aligns with that
> >>>>>>> except the 290Mhz corner. We can remove that one.
> >>>>>>>
> >>>>>>> Here we are describing the IoT variant of Talos. So we can ignore the
> >>>>>>> speedbins from the mobile variant until that is supported.
> >>>>>>
> >>>>>> No, we are describing just Talos, which hopefully covers both mobile and
> >>>>>> non-mobile platforms.
> >>>>>
> >>>>> We cannot assume that.
> >>>>>
> >>>>> Even if we assume that there is no variation in silicon, the firmware
> >>>>> (AOP, TZ, HYP etc) is different between mobile and IoT version. So it is
> >>>>> wise to use the configuration that is commercialized, especially when it
> >>>>> is power related.
> >>>>
> >>>> How does it affect the speed bins? I'd really prefer if we:
> >>>> - describe OPP tables and speed bins here
> >>>> - remove speed bins cell for the Auto / IoT boards
> >>>> - make sure that the driver uses the IoT bin if there is no speed bin
> >>>>   declared in the GPU.
> >>>>
> >>>
> >>> The frequency plan is different between mobile and IoT. Are you
> >>> proposing to describe a union of OPP table from both mobile and IoT?
> >>
> >> Okay, this prompted me to check the sa6155p.dtsi from msm-4.14... And it
> >> has speed bins. How comes we don't have bins for the IoT variant?
> >>
> >> Mobile bins: 0, 177, 187, 156, 136, 105, 73
> >> Auto bins:   0, 177,      156, 136, 105, 73
> >>
> >> Both Mobile and Auto chips used the same NVMEM cell (0x6004, 8 bits
> >> starting from bit 21).
> >>
> >> Mobile freqs:
> >> 0:         845M, 745M, 700M,       550M,       435M,       290M
> >> 177:       845M, 745M, 700M,       550M,       435M,       290M
> >> 187: 895M, 845M, 745M, 700M,       550M,       435M,       290M
> >> 156:             745M, 700M,       550M,       435M,       290M
> >> 136:                         650M, 550M,       435M,       290M
> >> 105:                                     500M, 435M,       290M
> >> 73:                                                  350M, 290M
> >>
> >> Auto freqs:
> >> 0:         845M, 745M, 650M, 500M, 435M
> >> 177:       845M, 745M, 650M, 500M, 435M
> >> 156:             745M, 650M, 500M, 435M
> >> 136:                   650M, 500M, 435M
> >> 105:                         500M, 435M
> >> 73:                                      350M
> >>
> >> 290M was a part of the freq table, but later it was removed as "not
> >> required", so probably it can be brought back, but I'm not sure how to
> >> handle 650 MHz vs 700 MHz and 500 MHz vs 550 MHz differences.
> >>
> >> I'm a bit persistent here because I really want to avoid the situation
> >> where we define a bin-less OPP table and later we face binned QCS615
> >> chips (which is possible since both SM and SA were binned).
> > 
> > Why is that a problem as long as KMD can handle it without breaking
> > backward compatibility?
> 
> I replied too soon. I see your point. Can't we keep separate OPP tables
> when that happen? That is neat-er than complicating the driver, isn't it?

I have different story in mind. We ship DTB for IQ-615 listing 845 MHz
as a max freq without speed bins. Later some of the chips shipped in
IQ-615 are characterized as not belonging to bin 0 / not supporting 845
MHz. The users end up overclocking those chips, because the DTB doesn't
make any difference.

> 
> > 
> >>
> >> Also I don't see separate QFPROM memory map definitions for Mobile, IoT
> >> and Auto SKUs. If you have access to the QCS615 hardware, what is the
> >> value written in that fuse area?
> >>
> >>> Another wrinkle we need to address is that, so far, we have never had a
> >>> dt binding where opp-supp-hw property exist without the speedbin cells.
> >>> And that adds a bit of complexity on the driver side because, today, the
> >>> KMD relies on the presence of speed bin cells to decide whether to
> >>> select bin via opp_supp_hw API or not. Also, we may have to reserve this
> >>> combination (opp bins without speedbin cells) to help KMD detect that it
> >>> should use socinfo APIs instead of speedbin cells on certain chipsets.\
> 
> > If it is a soft fuse, it could fall into an unused region in qfprom. On
> > other IoT chipsets like Lemans, Product teams preferred a soft fuse
> > instead of the hard fuse. The downside of the hard fuse that it should
> > be blown from factory and not flexible to update from software later in
> > the program.
> 
> This response is for your comment above. Adding to that, the value for
> the hard fuse is mostly likely to be '0' (unfused), but all internal
> parts are always unfused. Maybe it is 'practically' harmless to use the
> freq-limiter hard fuse for now, because 845Mhz is the Fmax for '0' on
> mobile, Auto and IoT. I am not sure.
> 
> I am trying to play safe here as this is dt. We don't want to configure
> the wrong thing now and later struggle to correct it. It is safe to
> defer things which we don't know.

What is "soft fuse"? Why do we need an extra entity in addition to the
one that was defined for auto / mobile units?

> 
> -Akhil.
> 
> > 
> > -Akhil.
> > 
> >>
> >> We already have "machine" as another axis in the GPU catalog. I'd
> >> suggest defining separate speed bins for mobile and auto/IoT in the DT
> >> (0x1 - 0x20 for mobile, 0x100 - 0x1000 for auto) and then in the driver
> >> mapping those by the machine compat.
> >>
> > 
> 

-- 
With best wishes
Dmitry
