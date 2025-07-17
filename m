Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EB2B0964C
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 23:10:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2E1710E8AC;
	Thu, 17 Jul 2025 21:10:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TXOrs4di";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E14010E8A0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 21:10:24 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HCXW7M000572
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 21:10:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8ldNEIALVCE8XNEzWAt9SINrTSS3as+SspmXHlLaDBs=; b=TXOrs4dib/Gxqxkx
 KltjMvnvAVbEzK1LeiSKna4NJfoxFwewPxkfsOw1/niszEfEPhuZJxVnBBs2HXvJ
 E49mESdGWjkTiXOcorXnvxk2el9AfNww+WpJMgcWPKQ9ffhT0Bh99V0Egq51yIQo
 q7pqQ3JgJ/vGMZYxw2oAy7M+Jggu5AMCTikdCRrLjwWOIIZTHFkWj/6Pb50I/zbb
 B0r12Tlcds3driRrMN3cF/K5pN0HDZQAqeTiahN/VG4UjR61wlQ3R4AjoXv/G40O
 A01TBqmtkdM+q1OgjeanVYXjdq0fD+4C71vPIAZFfa9xFY+xKoRR8fL74zszkD3l
 F9n9tw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5drv8e2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 21:10:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7e33e133f42so30887785a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 14:10:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752786622; x=1753391422;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8ldNEIALVCE8XNEzWAt9SINrTSS3as+SspmXHlLaDBs=;
 b=lC5l3TXnlodmSJrwexSdZL67Khdi+T2MyDqwpyevOSlQSKX2cOw7u4CH7hzByhdnsP
 qvcyqob1yMZo7QwHXrlpzZKn4YX+8vERRsBFbeBD+GhsQlULB4d1tYQIxOrDGKgv7/yn
 hZOo2PERsIOXVcdPPUABo/87+AsNor2psduwrG5X9eZWay/jnEPXrOkYau8NIGE/kg0x
 qjZCZr7aXKaS060iVPrxT5I7dxKK20+uj/kRaF4JoZqmNXvi7PNrqKcDcW+vPzzy4FsP
 X+93GIab1pw9KwKs6bETXDsXMlnzWTGmuKwK5RjKBTA8Yn+nXUS0gYtnqTG1//NCGX8L
 2NaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrIiNHLr7dh/yMsXwjkx+Pyjvzoo2eY50OFqltAr8oXbSocW0popSHgQ2Z+tIKpKvafYHhS/u1eIM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXZW4ZyL4jrx1E0o88GQ2d8G6eM5I+Sc+a5V6nci34/p8EgMfH
 a/yp8lsJbm7v4+7dwFESBZH+E2LyZnvWy6DzS71eaF3nwlRLhmpeFNsMVYS87PTvYn3J2sK+eOl
 QMPThifs9tre/At9Q4d2M8plUJIR7LBnVjZ9LrVcxs8eGkg/OTMXzX0gA5PqDqoCdZ6fXsp4=
X-Gm-Gg: ASbGncvzheKPrJ2YTCUrJz4QicNQXqer4FB23m5yTh+CCawaQMClBkfAQU8G0047tDC
 JQe1FNFgFaB1/Bbj+GE619L8G1uj8eykVaaZqaYsmwBkpid1WpsqFwGihwsNwZeea3WQ2U8newS
 2n4/BrDwDmZFJX16MH5msm22JTOolB44MnGCdiMePqh1aqBOxPqOOeJe1wyieJtik44yvyndUC3
 5NIT/vHqfxDkPBEopgc2zYQfwIlOf3GNUtnDkTTfMnNhwvpM/QQeHb2SFIlsakBccFF9arU1ULX
 ILuDrYnwaEwsJ5QToHEfgkzuCvYdwtUgIwGt/Ewv2dIk52XRpdyGJHYqrlILPOjejHMAGNFzfu/
 6ii4A8gl92YQHCTvg/1VM
X-Received: by 2002:a05:620a:84c1:b0:7e3:3029:44c with SMTP id
 af79cd13be357-7e342aebd89mr515760785a.7.1752786622235; 
 Thu, 17 Jul 2025 14:10:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVTebp2sXm1zQJMaQUIUz460FvBUXOo4sBrkg5PyJ5Ii2pC0RKVIfE3V/DxUtak4hYNe7EDA==
X-Received: by 2002:a05:620a:84c1:b0:7e3:3029:44c with SMTP id
 af79cd13be357-7e342aebd89mr515757185a.7.1752786621660; 
 Thu, 17 Jul 2025 14:10:21 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e826469asm1413336666b.85.2025.07.17.14.10.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 14:10:20 -0700 (PDT)
Message-ID: <eb0f5be5-3a6f-4969-affd-c01a6216ad0c@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 23:10:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] drm/msm/dp: Work around bogus maximum link rate
To: =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
 Xilin Wu <sophon@radxa.com>
Cc: Dale Whinham <daleyo@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250714173554.14223-1-daleyo@gmail.com>
 <20250714173554.14223-7-daleyo@gmail.com>
 <A9DB4AE061FD8BB9+3519a519-1a29-49c1-a07d-28a0577677cc@radxa.com>
 <CA+kEDGGaKrYO9Pu3un_Nq_6AOZC5L9sG+CEwh2ZEzWFeHGqtEA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CA+kEDGGaKrYO9Pu3un_Nq_6AOZC5L9sG+CEwh2ZEzWFeHGqtEA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: w2Lv6mceeI7BoLUgmedb7zgiSJtM0HJM
X-Authority-Analysis: v=2.4 cv=D4xHKuRj c=1 sm=1 tr=0 ts=687966bf cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8
 a=ksxQWNrZAAAA:8 a=pGLkceISAAAA:8 a=LffbBSGFapktDZBAnWwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-GUID: w2Lv6mceeI7BoLUgmedb7zgiSJtM0HJM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDE4NyBTYWx0ZWRfXxrldSR8YxF1Z
 kYxpFHo9cqFmNho7XBLxUTkIfeOXh1xczVIKJInLP7LSIPH5cCuXz/y8O3ONdc5OCYNGWQITOd8
 FDraAfkbJb49gTzFREW3k1PmYntBRkAdDKuwThJf/ANQVIvU2XkW6uk4My8LECfyCtmJ8gJeiTR
 xLCEV+8xpUN/flOQwmpB0SgvzecvgC26LYqXbLNzCdPd5YMZnHbQT1tvxQmUvgeKCm5GA1abqYf
 Au3MFrM+Ef6t6AzdFLUSqsy0dHCHDPJgZ2MUySThkXtDH2s2CdTMzTVxl/ZAK7ep2ufk9RfYwX0
 hP3PNvEcJGkALzbYqYVgiwHXugR0+87nDzZSgsOWgAxmni1cATl2lNa0M+fBjOECOFious8ai0l
 x3dkwtin7nvbwZcD5iEh24bE2liUhtEO/A2KJzx6R8nCKiOm0EFX8kL7KCXC50j7laj6lNGU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_04,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 impostorscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507170187
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

On 7/17/25 10:27 PM, Jérôme de Bretagne wrote:
> On 2025/7/17 04:21, Xilin Wu <sophon@radxa.com> wrote :
>>
>> On 2025/7/15 01:35:42, Dale Whinham wrote:
>>> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
>>>
>>> The OLED display in the Surface Pro 11 reports a maximum link rate of
>>> zero in its DPCD, causing it to fail to probe correctly.
>>>
>>> The Surface Pro 11's DSDT table contains some XML with an
>>> "EDPOverrideDPCDCaps" block that defines the max link rate as 0x1E
>>> (8.1Gbps/HBR3).
>>>
>>> Add a quirk to conditionally override the max link rate if its value
>>> is zero specifically for this model.
>>>
>>> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
>>> Signed-off-by: Dale Whinham <daleyo@gmail.com>
>>> ---
>>>   drivers/gpu/drm/msm/dp/dp_panel.c | 13 +++++++++++++
>>>   1 file changed, 13 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
>>> index 4e8ab75c771b..b2e65b987c05 100644
>>> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
>>> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
>>> @@ -11,6 +11,8 @@
>>>   #include <drm/drm_of.h>
>>>   #include <drm/drm_print.h>
>>>
>>> +#include <linux/dmi.h>
>>> +
>>>   #define DP_MAX_NUM_DP_LANES 4
>>>   #define DP_LINK_RATE_HBR2   540000 /* kbytes */
>>>
>>> @@ -58,6 +60,17 @@ static int msm_dp_panel_read_dpcd(struct msm_dp_panel *msm_dp_panel)
>>>       if (rc)
>>>               return rc;
>>>
>>> +     /*
>>> +      * for some reason the ATNA30DW01-1 OLED panel in the Surface Pro 11
>>> +      * reports a max link rate of 0 in the DPCD. Fix it to match the
>>> +      * EDPOverrideDPCDCaps string found in the ACPI DSDT
>>> +      */
>>> +     if (dpcd[DP_MAX_LINK_RATE] == 0 &&
>>> +         dmi_match(DMI_SYS_VENDOR, "Microsoft Corporation") &&
>>> +         dmi_match(DMI_PRODUCT_NAME, "Microsoft Surface Pro, 11th Edition")) {
>>> +             dpcd[1] = DP_LINK_BW_8_1;
>>> +     }
>>> +
>>
>> My Galaxy Book4 Edge with the ATNA60CL07-0 panel also reports a max link
>> rate of 0. But I think eDP v1.4 panels need a different way to retrieve
>> supported links rates, which could be found in the amdgpu [1], i915 [2]
>> and nouveau [3] drivers.
> 
> Thanks Xilin for the sharing and pointers into 3 other drivers, that
> would explain the current limitation for Adreno GPUs. Fixing it would
> require a big contribution independent of the actual SP11 enablement.

FWIW Adreno is a wholly separate (from DPU - the display engine) block

> 
> Is it a feature planned in the short-medium term within the MSM driver?
> If not, would a quirk like [4] be acceptable upstream in the meanwhile?

I'm not a display guy, but this looks like yet another block of code
begging to be commonized across DP drivers, so I wouldn't expect it to
be a big blocker.

Adding a panel quirk doesn't seem in order, as the panel is /probably/
very much in spec, and it's the driver bit that's missing.

Konrad

> 
> [4] https://github.com/JeromeDeBretagne/linux-surface-pro-11/commit/d265cfb
> 
> Thanks a lot,
> Jérôme
> 
> 
> 
>> [1]:
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c#n2098
>> [2]:
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/gpu/drm/i915/display/intel_dp.c#n4281
>> [3]:
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/gpu/drm/nouveau/nouveau_dp.c#n101
>>
>>
>>>       msm_dp_panel->vsc_sdp_supported = drm_dp_vsc_sdp_supported(panel->aux, dpcd);
>>>       link_info = &msm_dp_panel->link_info;
>>>       link_info->revision = dpcd[DP_DPCD_REV];
>>
>>
>> --
>> Best regards,
>> Xilin Wu <sophon@radxa.com>
> 
