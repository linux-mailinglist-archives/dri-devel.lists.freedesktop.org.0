Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7021CA9D14D
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 21:17:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E96A10E9A8;
	Fri, 25 Apr 2025 19:17:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="j/Z0vcEy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA10110E9A7
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 19:16:59 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJtXn012822
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 19:16:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AvM+02wHKQUUk7PA7Mt2UgaPJ57vrere5Ms7BkW9B8I=; b=j/Z0vcEyWcQcdfKe
 tQH6rGJ0IjjjqbKQoer2edUDnY0/djYpqywKNHBhTYgQo+U1lPaE4GO4+TaDBvBv
 7BWgLmNKwM0ebitgBqbBIRNZN5DK/ZKJuvsJaX+P5WBBvfwM8cSAZTyn8mUvt6pE
 4sfLjIq2F7SlZhM+ENM8EZ5jYoCkbqkPCoauKmGee55Q3ntEqUdMgfb7hh8A5xVJ
 LuhULkZ8RNdR2QImBQQ5EfseG5Fwe8JiV9K4Fgbac0kRrsYGz1N2zvO7zRNcqu6i
 Rf47di1mRAqqTW2OqhR13bH5D8Hq9CDoHFHj9ZgpHxnBD5dBZl5aA+K/D2ZUf9gR
 QIgJpQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh1t4n7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 19:16:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c5d608e6f5so699370685a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 12:16:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745608618; x=1746213418;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AvM+02wHKQUUk7PA7Mt2UgaPJ57vrere5Ms7BkW9B8I=;
 b=SAmBBBxpj4OEE6fcmondmW/2vnEacKfp1ZTkKI5s6aG4CyHXYv/WJvfvE63fDeCHPJ
 FMMjZowlWGe6N0uRrKkGch3yopsAw1iwlAOtpaju2xDRnVcf3HbO4S/l2/l5qoFWgIZh
 V2QWUjiQndKQ1t1pdiMdjeg+XwlIPqrqZS2po/udHTCtJ4XmUiDO5Fljvp/UMoWuHCX7
 tuXjKnVifCVCcAo5Mq8hJwZ9xYE/Hm9o/MRFVaiJfjub52xYdEc8XZExrVGoc5L+3jPw
 sjJvkCNyoPyVZhseT3eUxwAb2ChuXcy/+wilu8bqvb4jIQWjTWU59cRMxBO4X9L7t495
 AP1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUee7UQ9eOnVVeJ2pFno/FX3p8rtxbJpp8kj4/OjDkeSgdacZzKoHN5ngoVV17dEBu6fmT0DsZZtVk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzTsXRxObA5rUq0DVjUYQT3N1nRmrUQdJ6bBon7Y4Mkh1imBk04
 9b0QTsBPlGnClJPfzafYHAoSyYNJGIveWznMuq9xuAWQ4sxsG3ST4BwVPqjbEnBYBfi+Rgwn9HX
 unnHbrj/vjPI0ouJ+O6r7M6MyLjho3y1cTsBBfvx1czwRPUum8LDGFPWdvWhrGsOSZ7s=
X-Gm-Gg: ASbGncvoAp4rh/J6KSyn6vFMXrMVBwD22uumu8u0QwknKt0te5DPJ6mlw/VSIf5IuTu
 jVQcBg7rJibApL3sU4C8EWauwJReQuJ9BbOMVm//ptz+P49WGLbDvqdChwVrg+dhpDoVwofbyF4
 aIlIVi7YKxjS/MoJvJfGzVnbA98+QUIFvVE4P/dTjCC5AFMpsvhia185VmIbf1y517gP82XNQ9s
 rfYsg6q+sCnuLYEf2d621TDjfgeEm6LfDBDlSrffLApfXnf+YYVwARy2egO7v2I3s/Arrdz51Qe
 IF3QDVzAIUS6qswHcDuXFTHM/VORRp7ACrEE/NcZRo/mg82Hyk27HwUpePAX51vr7CkPGY9851A
 =
X-Received: by 2002:a05:620a:439b:b0:7c7:b60f:ebd8 with SMTP id
 af79cd13be357-7c9668711bdmr135700385a.24.1745608617668; 
 Fri, 25 Apr 2025 12:16:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLvVYIuCfd7N47SYf7k0yis4BdYavV24mRBREqRBvjDFmYGO5KeapM1HaXCAvzIXJi0HNW8A==
X-Received: by 2002:a05:620a:439b:b0:7c7:b60f:ebd8 with SMTP id
 af79cd13be357-7c9668711bdmr135694085a.24.1745608617219; 
 Fri, 25 Apr 2025 12:16:57 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7cb3983fsm706745e87.60.2025.04.25.12.16.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 12:16:55 -0700 (PDT)
Date: Fri, 25 Apr 2025 22:16:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Connor Abbott <cwabbott0@gmail.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 linux-hardening@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 3/4] drm/msm/a6xx: Get HBB dynamically, if available
Message-ID: <dhn55tynono5lvk7sxhcrww37mfty6pyzn52oaoyefmbm3ivh4@6qzhjyte6ntv>
References: <20911703-ab4e-4eb2-8611-294730a06d2f@quicinc.com>
 <CACu1E7HDmQXDNtEQCXpHXsOKPCOgrWgo+_kcgizo9Mp1ntjDbA@mail.gmail.com>
 <1282bf58-e431-4a07-97e5-628437e7ce5f@quicinc.com>
 <CACu1E7GwMCt6+JJQGgSvJObTMMWYLPd69owyFo7S=sxu_EEsUw@mail.gmail.com>
 <16845de2-a40a-4e3d-b3aa-c91e7072b57f@quicinc.com>
 <CAF6AEGvyeRLHFBYmxkevgT+hosXGiH_w8Z+UjQmL+LdbNfVZ+w@mail.gmail.com>
 <acd1c8dd-286b-40b7-841d-e53e2d155a61@oss.qualcomm.com>
 <CAF6AEGts5rWvgyZy8RtAaUOsad362AG-uNjxF9vyj4szg=b5Bw@mail.gmail.com>
 <6233171a-2964-4d57-986c-d3f1725eacd6@oss.qualcomm.com>
 <eac33841-4796-43bf-affe-31901344c5ff@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eac33841-4796-43bf-affe-31901344c5ff@oss.qualcomm.com>
X-Proofpoint-GUID: c-nno5TPcQMC7YHaCnXgmq7z0b_kvv8K
X-Proofpoint-ORIG-GUID: c-nno5TPcQMC7YHaCnXgmq7z0b_kvv8K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzNyBTYWx0ZWRfX6J6tXBQ3ifBA
 ND76CNfzD2sZiscNAGzWYblSpqJdnxQ701wzN1P4QpzZHcjXEiKM3iJuw/o2PD1tnGbO4pvjSnN
 q1jlaFW1KtdKo7reuiiqXxLOSwkgTqJC6mUx/zekTRH0vdn9QotM/+qIj8fy6AmfdTJOtJ51x5P
 0XVlj9SYWi3S1oo6EljnxjmGyaXKr0YMOG2dRs+mWLkBplSUQQXJjHoE08VQqdHn2hH+hbLQLSK
 PnD3dmHuwMhevSOLFhXB/5EzXPLwoKlzPsvzqaV/qjeLacWAIhaqekeRjGk8qMKs2gFQNypRjMX
 5QCjbOOyP16sqUQ9vDW8WlQ9ABROjCYpL3/k/+N4uaTqKqiWRyf8LjX83gp0mAUCxwsPh+cllLV
 qELlziuL2vyzahSIhDadFQca9xKKMvE+fKhzmzGhFlzJS/CdgNsIuH4C6pvlSlqrwZcX1t8D
X-Authority-Analysis: v=2.4 cv=ZpjtK87G c=1 sm=1 tr=0 ts=680bdfab cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=qLch0_GepN5255_xqOIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 mlxlogscore=999 spamscore=0 impostorscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250137
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

On Thu, Apr 24, 2025 at 10:28:58PM +0200, Konrad Dybcio wrote:
> On 4/23/25 5:23 PM, Dmitry Baryshkov wrote:
> > On 23/04/2025 17:55, Rob Clark wrote:
> >> On Tue, Apr 22, 2025 at 4:57 PM Konrad Dybcio
> >> <konrad.dybcio@oss.qualcomm.com> wrote:
> >>>
> >>> On 4/21/25 10:13 PM, Rob Clark wrote:
> >>>> On Fri, Apr 18, 2025 at 9:00 AM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
> >>>>>
> >>>>> On 4/18/2025 6:40 AM, Connor Abbott wrote:
> >>>>>> On Thu, Apr 17, 2025, 1:50 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
> >>>>>>>
> >>>>>>> On 4/17/2025 9:02 PM, Connor Abbott wrote:
> >>>>>>>> On Thu, Apr 17, 2025 at 3:45 AM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
> >>>>>>>>>
> >>>>>>>>> On 4/10/2025 11:13 PM, Konrad Dybcio wrote:
> >>>>>>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>>>>>>>
> >>>>>>>>>> The Highest Bank address Bit value can change based on memory type used.
> >>>>>>>>>>
> >>>>>>>>>> Attempt to retrieve it dynamically, and fall back to a reasonable
> >>>>>>>>>> default (the one used prior to this change) on error.
> >>>>>>>>>>
> >>>>>>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>>>>>>> ---
> >>>>>>>>>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 15 ++++++++++++++-
> >>>>>>>>>>   1 file changed, 14 insertions(+), 1 deletion(-)
> >>>>>>>>>>
> >>>>>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>>>>>>>>> index 06465bc2d0b4b128cddfcfcaf1fe4252632b6777..a6232b382bd16319f20ae5f8f5e57f38ecc62d9f 100644
> >>>>>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>>>>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>>>>>>>>> @@ -13,6 +13,7 @@
> >>>>>>>>>>   #include <linux/firmware/qcom/qcom_scm.h>
> >>>>>>>>>>   #include <linux/pm_domain.h>
> >>>>>>>>>>   #include <linux/soc/qcom/llcc-qcom.h>
> >>>>>>>>>> +#include <linux/soc/qcom/smem.h>
> >>>>>>>>>>
> >>>>>>>>>>   #define GPU_PAS_ID 13
> >>>>>>>>>>
> >>>>>>>>>> @@ -587,6 +588,8 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
> >>>>>>>>>>
> >>>>>>>>>>   static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
> >>>>>>>>>>   {
> >>>>>>>>>> +     int hbb;
> >>>>>>>>>> +
> >>>>>>>>>>        gpu->ubwc_config.rgb565_predicator = 0;
> >>>>>>>>>>        gpu->ubwc_config.uavflagprd_inv = 0;
> >>>>>>>>>>        gpu->ubwc_config.min_acc_len = 0;
> >>>>>>>>>> @@ -635,7 +638,6 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
> >>>>>>>>>>            adreno_is_a690(gpu) ||
> >>>>>>>>>>            adreno_is_a730(gpu) ||
> >>>>>>>>>>            adreno_is_a740_family(gpu)) {
> >>>>>>>>>> -             /* TODO: get ddr type from bootloader and use 2 for LPDDR4 */
> >>>>>>>>>>                gpu->ubwc_config.highest_bank_bit = 16;
> >>>>>>>>>>                gpu->ubwc_config.amsbc = 1;
> >>>>>>>>>>                gpu->ubwc_config.rgb565_predicator = 1;
> >>>>>>>>>> @@ -664,6 +666,13 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
> >>>>>>>>>>                gpu->ubwc_config.highest_bank_bit = 14;
> >>>>>>>>>>                gpu->ubwc_config.min_acc_len = 1;
> >>>>>>>>>>        }
> >>>>>>>>>> +
> >>>>>>>>>> +     /* Attempt to retrieve the data from SMEM, keep the above defaults in case of error */
> >>>>>>>>>> +     hbb = qcom_smem_dram_get_hbb();
> >>>>>>>>>> +     if (hbb < 0)
> >>>>>>>>>> +             return;
> >>>>>>>>>> +
> >>>>>>>>>> +     gpu->ubwc_config.highest_bank_bit = hbb;
> >>>>>>>>>
> >>>>>>>>> I am worried about blindly relying on SMEM data directly for HBB for
> >>>>>>>>> legacy chipsets. There is no guarantee it is accurate on every chipset
> >>>>>>>>> and every version of firmware. Also, until recently, this value was
> >>>>>>>>> hardcoded in Mesa which matched the value in KMD.
> >>>>>>>>
> >>>>>>>> To be clear about this, from the moment we introduced host image
> >>>>>>>> copies in Mesa we added support for querying the HBB from the kernel,
> >>>>>>>> explicitly so that we could do what this series does without Mesa ever
> >>>>>>>> breaking. Mesa will never assume the HBB unless the kernel is too old
> >>>>>>>> to support querying it. So don't let Mesa be the thing that stops us
> >>>>>>>> here.
> >>>>>>>
> >>>>>>> Thanks for clarifying about Mesa. I still don't trust a data source that
> >>>>>>> is unused in production.
> >>>>>>
> >>>>>> Fair enough, I'm not going to argue with that part. Just wanted to
> >>>>>> clear up any confusion about Mesa.
> >>>>>>
> >>>>>> Although, IIRC kgsl did set different values for a650 depending on
> >>>>>> memory type... do you know what source that used?
> >>>>>
> >>>>> KGSL relies on an undocumented devicetree node populated by bootloader
> >>>>> to detect ddrtype and calculates the HBB value based on that.
> >>>>
> >>>> Would it be reasonable to use the smem value, but if we find the
> >>>> undocumented dt property, WARN_ON() if it's value disagrees with smem?
> >>>>
> >>>> That would at least give some confidence, or justified un-confidence
> >>>> about the smem values
> >>>
> >>> The aforementioned value is populated based on the data that this
> >>> driver reads out, and only on the same range of platforms that this
> >>> driver happens to cater to
> >>
> >> Did I understand that correctly to mean that the dt property is based
> >> on the same smem value that you are using?  In that case, there should
> >> be no argument against using the smem value as the source of truth.
> > 
> > It is, but is done by the bootloader that knows exact format of the data.
> 
> Right, so the only point of concern here is the handwavy matching-by-size
> logic.

Kind of. The other issue is several cases where GPU and MDSS drivers
disagree about UBWC config. I think the plan might be:
- Introduce UBWC config database, ruling out incoherences between these
  drivers
- Parse SMEM and the non-standard OF property, verify both against each
  other and against the UBWC database
- One-by-one drop entries from UBWC database as they are verified
  against the readout values.

I understand that it is a long-term plan, but granted the issues we've
had before (tiling screen corruptions, which was fixed / worked around
by lowering HBB) I think this is the most viable path forward.

-- 
With best wishes
Dmitry
