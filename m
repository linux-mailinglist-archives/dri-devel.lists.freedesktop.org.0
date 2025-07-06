Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A893AFA640
	for <lists+dri-devel@lfdr.de>; Sun,  6 Jul 2025 17:49:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B221010E2BE;
	Sun,  6 Jul 2025 15:49:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lz/iyNl/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D1B810E0A1
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Jul 2025 15:49:17 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 566Evmwx002822
 for <dri-devel@lists.freedesktop.org>; Sun, 6 Jul 2025 15:49:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ThkIhhBJ5fwEX1d3VOih6G8zDuT1c+BI7IZw68KecMw=; b=lz/iyNl/N9CHjE0p
 3apskZunHVG9s0rLAZRWu2ZJF2uszP8tCShA6f5IPW5x48s0jSl++5qLS+ryGluD
 86FPRQp0KaIQxIZO9xbzPZnsDifbzk0zM22nXQB1onxatgHh1f3l/oPzyCrTCVLw
 OuHGYJXBnk6vGiSlzph31Jm78bZEzTd1w44bb3vC+QPYzSVXvgFhpr2L00ZyvXlo
 llctYe5p/01s/78rcm5NtHFHwQDiu8lPj9ozI/6yJwiPlbW07fZSDz3nDKVTSOzy
 74SoNKMi5RlIFr4DUSZHx0/WpVO8Ti8595b5LQcSFrdR73vVqtTJP4SRpIjUAVHQ
 WBXbQw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pv974vu5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Jul 2025 15:49:16 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6fabd295d12so44314396d6.1
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Jul 2025 08:49:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751816956; x=1752421756;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ThkIhhBJ5fwEX1d3VOih6G8zDuT1c+BI7IZw68KecMw=;
 b=fDmXPO7Xmf2cb3MR/k/zxKVG0wkWOD/lxdYAsLiCSbu8oSqOciUPeE/ADHWegri/Ru
 r5A+Bcw4P0dmWE69wTUnGmNYbFJrK9NafpCX/CnY7tV4xXXZZq3lbNqYVewdST7JWj2e
 A1QVukPaqXbNzR5GdN5U3ENlXTpfkgjEoAgCFp9tghp2WFERJv0+NP0q5oqiD8GK23mc
 pm5L7GVYx1CpYvpXWDQKe/KwcK6hupsvBTSy8nicWKBuElJrxeSoEQnN4fX1GQlLqung
 3HngdOaO5kAQGKserW7YWFidcjQ+TzIOqdY/QC493+g0GXjGucyO+sBB7pY5efOPGKbk
 0Njw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWv4J9gWrCsgWxp9mcqqvje4mBa6JGVmi9wzzhAOJNZePO0J6RxUTZQZrFUt9JEY7aSKJtJjMAsfI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQ96Wkf/frdwHBSwbswKbCHMqA5t+KSXsVfcivB7lqbJ2vFwsu
 hiMnUTPK336y7A40aPeD8BMa9lVYEWxSNCIF7DFzAb3bf0D1y2vPhVUwi8zSkAbzEZUQd9+dKQB
 AMgvdPAhbnGBcwsYTomN+s8j/ZTg9xEA6OxNk9KitBnDeIRkbvTrNRGUHmkwVa51c8mVyoZE=
X-Gm-Gg: ASbGncupCtYO4sPLmLshENfwYtZ4Kym1RZ34BD/kvqBnhkrhXOByI7WSnTZJUtYl4iT
 bfWVVPdIgIMgfqjABTtyYu7qDXJf0ldAVd8DNf5k3ZQVcS78H4Xbt4eIFZ3b956/kBPRzMs2OZt
 Q+kBl0og71nBXKXjNIhaC/uSzwgPfxSp+jQBfYop8zCHO8ZXRMBGEtkAR/4W5RNoRs0zwqgqS/U
 X1sqJWRwKfZmFFV29dt7EUPVY81iptbQk57Xjk+zK9d/G5hlhcjekXsgSl/DAB2vJxFlVRZLBKS
 YxifWwnUAuUTKdpbwEVn6ICv7vHfSFY5FOrYDl2RqQ+FD8IdXjupemVj9jyeiemm1RVKIAN+nXj
 IJ78nbp+EW8C8ZmEbn4fzU45xdA==
X-Received: by 2002:a05:620a:2705:b0:7d3:9012:75b7 with SMTP id
 af79cd13be357-7d5f28776d5mr604201985a.31.1751816955610; 
 Sun, 06 Jul 2025 08:49:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGmoz2irg953lfmYPzSg/oryohS4RfR4eZsTBB966t6LMzMt5vdU+OciSZSHFurHT6z3Gtzw==
X-Received: by 2002:a05:620a:2705:b0:7d3:9012:75b7 with SMTP id
 af79cd13be357-7d5f28776d5mr604199085a.31.1751816955160; 
 Sun, 06 Jul 2025 08:49:15 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::4c9?
 (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-556384a9123sm974422e87.168.2025.07.06.08.49.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Jul 2025 08:49:14 -0700 (PDT)
Message-ID: <fad0bbf0-e229-4614-9b68-e3e49ea1f801@oss.qualcomm.com>
Date: Sun, 6 Jul 2025 18:49:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/msm/mdp4: use msm_kms_init_vm() instead of
 duplicating it
To: rob.clark@oss.qualcomm.com
Cc: Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250706-msm-no-iommu-v1-0-9e8274b30c33@oss.qualcomm.com>
 <20250706-msm-no-iommu-v1-3-9e8274b30c33@oss.qualcomm.com>
 <CACSVV00Cdwjhta+ozoQAy0QQ81LM8Skf8RcnFGKscbc03xBA=w@mail.gmail.com>
 <CAO9ioeV47NAo=j=QHdZPSZT_f31jTT=cFSN=EjihboTr4Pmzkw@mail.gmail.com>
 <CACSVV01QLz40_sU4-jD6EHpnZ8ECRgxqQTaRjNdtRtgrDbAMCA@mail.gmail.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <CACSVV01QLz40_sU4-jD6EHpnZ8ECRgxqQTaRjNdtRtgrDbAMCA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FrUF/3rq c=1 sm=1 tr=0 ts=686a9afd cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=cS33hYv70hVWqaF04D4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDEwMSBTYWx0ZWRfX3YIY/NrJ9+Zd
 rpMWjqdqETT8HfacDDvyrWfPUYpf3NfHJFFYve2zFePZlYDyihQ0aOApVoSpN/4K6EKBrENO9MG
 THK2Kw5P++YC7GAb2gAIvWkb/bBYYyAFJh4Lgn9AMHBNu39Y6n2qGjpK7+SOFqUmE7WNXjhTmYU
 k51BQC6oagLn7EjiJorrl1c3fJKhJxlH+u8CF32mEfp77COfHRxbO+89hskBO0Egf0me/geX1T6
 IEI3E03wGiUmL+wP9/pWfKLiE6/Yh5gUpQADhZlGS5k0i02HiUA+z8LWGBZXAmewjRLApIL0PQy
 fQLroF0/2S/zo+f66h352P79ByPxWRxrixKnO+2mmAcvp2K1EIP6m2fXFOhqwV4924rc/80KkTb
 Wf68V9SN7WhvaMbHh7NiT5bubifFBZkQXFUYXUSiVuqhdjnZm7k4etHEzeZSU4teGyMNR9Nt
X-Proofpoint-GUID: qZNX8yIKGdarvuSnwcSsXQK16ILMjwDs
X-Proofpoint-ORIG-GUID: qZNX8yIKGdarvuSnwcSsXQK16ILMjwDs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 mlxscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507060101
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

On 06/07/2025 18:11, Rob Clark wrote:
> On Sun, Jul 6, 2025 at 7:02 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>
>> On Sun, 6 Jul 2025 at 16:11, Rob Clark <rob.clark@oss.qualcomm.com> wrote:
>>>
>>> On Sun, Jul 6, 2025 at 3:50 AM Dmitry Baryshkov
>>> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>>>
>>>> Use the msm_kms_init_vm() function to allocate memory manager instead of
>>>> hand-coding a copy of it. Although MDP4 platforms don't have MDSS
>>>> device, it's still safe to use the function as all MDP4 devices have
>>>> IOMMU and the parent of the MDP4 is the root SoC device.
>>>
>>> So, originally the distinction was that mdp4 didn't have the mdss
>>> wrapper.  Maybe it works out because device_iommu_mapped(mdp_dev)
>>> returns true?
>>
>> Yes, as expressed in the cover letter.
> 
> Right, but with this patch, I think nothing is enforcing that, so we
> could end up dereferencing mdp_dev->parent if the device did not have
> an iommu.
> 
> I guess you could solve that with an extra device_iommu_mapped() in
> mdp4_kms_init()

... or adding have_mdss arg to msm_kms_init_vm().

Anyway, let's probably get first two patches in, I'll repost the third 
patch later on.

> 
> BR,
> -R
> 
>>>
>>> BR,
>>> -R
>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>> ---
>>>>   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 27 +++++----------------------
>>>>   1 file changed, 5 insertions(+), 22 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
>>>> index 88296c41d1a5eb0e16cb6ec4d0475000b6318c4e..41d236d30e71ebb6ac8a59052529f36fadf15cd7 100644
>>>> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
>>>> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
>>>> @@ -391,11 +391,9 @@ static void read_mdp_hw_revision(struct mdp4_kms *mdp4_kms,
>>>>
>>>>   static int mdp4_kms_init(struct drm_device *dev)
>>>>   {
>>>> -       struct platform_device *pdev = to_platform_device(dev->dev);
>>>>          struct msm_drm_private *priv = dev->dev_private;
>>>>          struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(priv->kms));
>>>>          struct msm_kms *kms = NULL;
>>>> -       struct msm_mmu *mmu;
>>>>          struct drm_gpuvm *vm;
>>>>          int ret;
>>>>          u32 major, minor;
>>>> @@ -458,29 +456,14 @@ static int mdp4_kms_init(struct drm_device *dev)
>>>>          mdp4_disable(mdp4_kms);
>>>>          mdelay(16);
>>>>
>>>> -       mmu = msm_iommu_new(&pdev->dev, 0);
>>>> -       if (IS_ERR(mmu)) {
>>>> -               ret = PTR_ERR(mmu);
>>>> +       vm = msm_kms_init_vm(mdp4_kms->dev);
>>>> +       if (IS_ERR(vm)) {
>>>> +               ret = PTR_ERR(vm);
>>>>                  goto fail;
>>>> -       } else if (!mmu) {
>>>> -               DRM_DEV_INFO(dev->dev, "no IOMMU configuration is no longer supported\n");
>>>> -               ret = -ENODEV;
>>>> -               goto fail;
>>>> -       } else {
>>>> -               vm  = msm_gem_vm_create(dev, mmu, "mdp4",
>>>> -                                       0x1000, 0x100000000 - 0x1000,
>>>> -                                       true);
>>>> -
>>>> -               if (IS_ERR(vm)) {
>>>> -                       if (!IS_ERR(mmu))
>>>> -                               mmu->funcs->destroy(mmu);
>>>> -                       ret = PTR_ERR(vm);
>>>> -                       goto fail;
>>>> -               }
>>>> -
>>>> -               kms->vm = vm;
>>>>          }
>>>>
>>>> +       kms->vm = vm;
>>>> +
>>>>          ret = modeset_init(mdp4_kms);
>>>>          if (ret) {
>>>>                  DRM_DEV_ERROR(dev->dev, "modeset_init failed: %d\n", ret);
>>>>
>>>> --
>>>> 2.39.5
>>>>
>>
>>
>>
>> --
>> With best wishes
>> Dmitry


-- 
With best wishes
Dmitry
