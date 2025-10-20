Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5FBBF1C5F
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 16:15:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA93210E450;
	Mon, 20 Oct 2025 14:15:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PJUZLJik";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 963B810E450
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 14:15:23 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KC7u1D028857
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 14:15:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LDmy2GELi7gtK/8jzxwGBbx8R1YBxICNIb8VNFsE1t4=; b=PJUZLJikmWQP3BlF
 519kMTMz74gHVVnCpksl8pQUEKNqaYAYhqquCzDaIwYoi1bL1Nl/2mKVdCQDg27+
 skeVLrdlFK9D3ZsItTdTKGMjYQGX3W3I+7e6DURs3uLlSJELCdnDKAg1fwrwL6PU
 MI0ss15A6EXJtv5Pvk3kxyg/EPbBhGQTq7H9Fx7cRd4NJWIPsD2GX+Ii6kceXBOA
 7f3R9REKSTyyqqC8t8mqLYQ0FAXz56YAHOePkbokpvLVOEeiFwt4bBkudJLTZOjb
 EVu6y3l92CHT6xQppMYSSu9Wl+RDhyJgz0SPJ7xw6T9TvSsTHK6kh4HsP9Qc1pYp
 blQmCQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v3984wjb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 14:15:22 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-850553dfef2so15739726d6.0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 07:15:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760969722; x=1761574522;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LDmy2GELi7gtK/8jzxwGBbx8R1YBxICNIb8VNFsE1t4=;
 b=fjg0tN9SKPKU+H2DDRgOIQoFcoUZc67vgmO/zV1LHvlA3PHQrQVKP4ndz65Q391ajS
 uYNo2IRAB/ScsCLG3Z2mL+mLg93QdoLPtdyMR9BrF4CveiuKrI8tWphyffeLvImixrs3
 ZG46nIHOrr21HMD1Hi4r139608VHZ6B3WpwIhELFND+af2klznZpanGLkFS/NRPFSAyU
 2BfiXRNhbe+kPDu9zEbvFraIvimQtjstArG+msdN7PKNMXmoiUhUNAsCACRJEDNwyOcc
 5JdBr6o3tVvz5dYSQwPLVN36RbZDZPEU6uYG5soDUxM+r6vBDMYvBFi3pT2/2RCNf0LQ
 tm4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUl5XAPYJ0lLPdlOTrig6LbzP9Icd3L8kzZ4xRE0mnSbT3ew3bZp3fDCZAo3Floj3Uraoy4HWCNDNg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWkxjfjnEd/RLdb0fLt6RqVDaFmDgO+PYeD459/h4AOTVq8HAF
 1Swg2asHX8enhx/zVnQjPvvdimxS5qFpNh2rHEMt/q40bbcktHOJ/vevoIW5+Y3fOyrGfw/2afJ
 8eR55TA5Mv7SHridxiUu5CTP6rbU1y1SgylLIg+gLrl1u8uw20PRwqKrraeKsNl0YNyKeKvE=
X-Gm-Gg: ASbGncsclI69QOkE2v5I0UURSOCmLsyM2VWnME6+RukP2gdC0UTgKXLw5dk6I7CoJ9D
 6nQbG2EiVcto2TEBzcHmWOKljTdM7geF4GQxxfBdNCAQbh7Valcwss3gG1F8QJA1k3Ib82Q2/nN
 YUJg4qBkG7KsQPYy7I5WfiIBowwqVaUgo0w8cPbui0ekipETKLFianbK5f5sJp96zedouUweeLb
 f+yxnSZFBuN15ybFpHK5twJwWIY4tm3OKYXIl+AlzVjOUjt9qh89Hx6SMbLpE2rYDUIsUbsEgja
 guLFynm0Ujj4y7z8hQ2WLUPS2RLF8aJZC6eEiVnaWy2Jvq9UChOF8i+FJRppMzk+b/8vuVWINEx
 2Y2ZQbWnlGnifJPx+AR+E3nGTfaeNbF7SDnNOTgQAycar4EEJ7/RfkmYB
X-Received: by 2002:a05:622a:430c:b0:4e8:9ed2:78fa with SMTP id
 d75a77b69052e-4e89ed27b1amr70538581cf.1.1760969721850; 
 Mon, 20 Oct 2025 07:15:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgFJIAqpM19kvrDWGwCuBgqCdJgurbW+8pv+OyXQ/fhgIZbl4A99RK4rC5R2fhCALO5DvG/g==
X-Received: by 2002:a05:622a:430c:b0:4e8:9ed2:78fa with SMTP id
 d75a77b69052e-4e89ed27b1amr70538361cf.1.1760969721351; 
 Mon, 20 Oct 2025 07:15:21 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63c4949bfd3sm6749303a12.41.2025.10.20.07.15.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 07:15:20 -0700 (PDT)
Message-ID: <88f04334-8d73-4ced-9c46-e69c3e6cbc72@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 16:15:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm/dpu: Filter modes based on adjusted mode clock
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250506-filter-modes-v2-1-c20a0b7aa241@oss.qualcomm.com>
 <1b783a60-39c7-49b5-8932-e77230f6cddd@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1b783a60-39c7-49b5-8932-e77230f6cddd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KcvfcAYD c=1 sm=1 tr=0 ts=68f643fa cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P-IC7800AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=QfOM7-ESXlBk_NPiMl4A:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=cvBusfyB2V15izCimMoJ:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyNSBTYWx0ZWRfX7KwA/lp2u5Ep
 VgLCoM0pM4OFpRwJs4DrIixcFNy0SYQ+noedRpio4+hqpuFW98dQzpcVgDPLFxHT2xG2hCLo3lA
 bRBIVZpaf9L3Rg3KW2JirPwNGO+3X/9FcNNMRmf23PU2WBgzMkbuKEuEcN/lctn48xtpO643PRF
 8pf7wnNyfoLlyPb1CpyJ3UKCn38QU1aEdZA/+DxrchqKi4uDgq4WrzyQpW6Oe0NuLDgzZa3C1nN
 I+cOU6mLy9F5YPry1Jp49GZaeSfJbu2hQonH0O4PK9YEGxzzTQ/snUmEyzf/ft7/5RANGMHJibK
 0Xesxss5wR2Y6TBjAaJru5OHb+JhvXGKTzMjdK5zCOlsglCMLWo2l3NRfasu2ObhYLTJux37EA1
 48lO/XNiVGJmvCFJ5xP2y8kmGASTTg==
X-Proofpoint-GUID: 9LolACkQ2xk_hOYO1RyW5kD5Nbi5yc6N
X-Proofpoint-ORIG-GUID: 9LolACkQ2xk_hOYO1RyW5kD5Nbi5yc6N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180025
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

On 10/20/25 4:05 PM, neil.armstrong@linaro.org wrote:
> Hi,
> 
> On 5/7/25 03:38, Jessica Zhang wrote:
>> Filter out modes that have a clock rate greater than the max core clock
>> rate when adjusted for the perf clock factor
>>
>> This is especially important for chipsets such as QCS615 that have lower
>> limits for the MDP max core clock.
>>
>> Since the core CRTC clock is at least the mode clock (adjusted for the
>> perf clock factor) [1], the modes supported by the driver should be less
>> than the max core clock rate.
>>
>> [1] https://elixir.bootlin.com/linux/v6.12.4/source/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c#L83
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> 
> This change breaks the T14s OLED display, no modes are reported on the eDP connector.
> msm_dpu ae01000.display-controller: [drm:update_display_info.part.0 [drm]] [CONNECTOR:41:eDP-1] Assigning EDID-1.4 digital sink color depth as 10 bpc.
> msm_dpu ae01000.display-controller: [drm:update_display_info.part.0 [drm]] [CONNECTOR:41:eDP-1] ELD monitor
> msm_dpu ae01000.display-controller: [drm:update_display_info.part.0 [drm]] [CONNECTOR:41:eDP-1] ELD size 20, SAD count 0
> [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 113 (1)
> msm_dpu ae01000.display-controller: [drm:drm_mode_prune_invalid [drm]] Rejected mode: "2880x1800": 120 652260 2880 2912 2920 2980 1800 1808 1816 1824 0x48 0x9 (CLOCK_HIGH)
> msm_dpu ae01000.display-controller: [drm:drm_mode_prune_invalid [drm]] Rejected mode: "2880x1800": 60 652260 2880 2888 2920 2980 1800 1808 1816 3648 0x40 0x9 (CLOCK_HIGH)
> 
> With this reverted on v6.18-rc, display works again.

https://lore.kernel.org/linux-arm-msm/20250923-modeclk-fix-v2-1-01fcd0b2465a@oss.qualcomm.com/

Konrad
