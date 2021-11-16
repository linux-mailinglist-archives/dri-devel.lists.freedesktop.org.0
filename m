Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09AF6452C6D
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 09:09:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1E5B6E213;
	Tue, 16 Nov 2021 08:09:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F3026E213;
 Tue, 16 Nov 2021 08:09:14 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id p18so6732404wmq.5;
 Tue, 16 Nov 2021 00:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=aGBZk8gTfQGCLicjsCXmXtl4JymR9yPdWumY2S8vuHM=;
 b=DhKvVcIGRnxNR5rULkwrnXv0X6nbAaknmGfsDAL9UhrprDcbdtaPYQ2f2D4p2JJJa2
 N0CLnUsRydvGLZ8T0kWW84iUQuVrxIk9XBqdw+/2sGXiSV4wZyzcvw9TAywjxnU62RjE
 9U3P3f2455lJc/F1Anx5OmFx0uTUJ64w8YyofTbJ4j6KVyCjvBNRoNdw3xYYj4S/LD/z
 b+IOGh3e7OWhoXWHXLfErf21BU8ElSj3K0jjZw3E9/xfN7hm99/Gl6+lEkwdhFIWeqOS
 dcflenUF2MZtH9Y17aIom/btFcqLA8+gfWIgz0BN/dfd9KIKWxtmD8b+vKAzU0MRcVSm
 sXZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=aGBZk8gTfQGCLicjsCXmXtl4JymR9yPdWumY2S8vuHM=;
 b=WrRFkcuL+Wmv8NdIbQ1s88pmNJG5BtY85mx17JP7qkPSY1iyhvtvdPVdB9QYaoua4/
 EgYyRRWx08DxAofyL5vHWzLQoHDBm98VU4hHp8p3EY8ojpb9jDKVkZwH7HUQ7E2rqUYH
 mxKbCjYym+YsrYtOGvnEATQYCYTDbvGzFpEG2cef6re6Dz9steun3ZpIysPxjoRDVmBb
 FBLqve9/2ymSM9OZFE29nWT5T1wo/yagNtdjbERXTqmwO8hiCfSCJsxcTTcl0Me37r6N
 UWpKlTjE1cwvA+wEsfiOZFeWDCSjyzZEhNPmahPZ5j10wHMwkkICPPLzYapQzIvrYBtU
 7PPg==
X-Gm-Message-State: AOAM532xoctpLHhBLg7qgEOCVcIFXpiQcqf6V/WT08rAf45RmBRKNcRk
 eGCo8n1Ht+3ghPv4WmRFEss=
X-Google-Smtp-Source: ABdhPJx/a5DOIpzn+Z14aEoPOg77NS54BM2humiPMKXGjUG9tx6v65Pd/VdP8ObW6pkIRrVNpoTIMQ==
X-Received: by 2002:a05:600c:4154:: with SMTP id
 h20mr65322935wmm.189.1637050152945; 
 Tue, 16 Nov 2021 00:09:12 -0800 (PST)
Received: from [192.168.178.21] (p57b0b77b.dip0.t-ipconnect.de.
 [87.176.183.123])
 by smtp.gmail.com with ESMTPSA id t8sm16666557wrv.30.2021.11.16.00.09.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 00:09:12 -0800 (PST)
Subject: Re: Questions about KMS flip
To: Lang Yu <Lang.Yu@amd.com>
References: <735f8781-982b-a09f-32fe-fded0024a587@gmail.com>
 <58097218-40dd-55fd-32d2-2a299d39230f@daenzer.net>
 <YZIA/dkvjuMsup24@lang-desktop>
 <cadb9503-b390-e254-ffba-5e2e11f100cc@daenzer.net>
 <YZIiqM6PKKL/ZMNy@lang-desktop>
 <f1b88742-b07e-5973-1e30-9674a5950bf3@daenzer.net>
 <YZJFHMEqm1oz7QJN@lang-desktop>
 <e44a237c-0073-2eec-1a47-c5faf99f77b4@daenzer.net>
 <YZMlGSA9iG3aVCUu@lang-desktop>
 <391ee32e-f1b1-d92b-c9f3-17dbc0a9d690@gmail.com>
 <YZNlE9bZSJmTvS6d@lang-desktop>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <52cc2823-35b3-0cb1-2119-82a3677e9b99@gmail.com>
Date: Tue, 16 Nov 2021 09:09:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YZNlE9bZSJmTvS6d@lang-desktop>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Michel DDDnzer <michel@daenzer.net>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Christian KKKnig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 16.11.21 um 09:00 schrieb Lang Yu:
> On Tue, Nov 16, 2021 at 08:14:08AM +0100, Christian KKKnig wrote:
>> Am 16.11.21 um 04:27 schrieb Lang Yu:
>>> On Mon, Nov 15, 2021 at 01:04:15PM +0100, Michel DDDnzer wrote:
>>>> [SNIP]
>>>>> Though a single call to dce_v*_0_crtc_do_set_base() will
>>>>> only pin the BO, I found it will be unpinned in next call to
>>>>> dce_v*_0_crtc_do_set_base().
>>>> Yeah, that's the normal case when the new BO is different from the old one.
>>>>
>>>> To catch the case I described, try something like
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
>>>>
>>>> index 18a7b3bd633b..5726bd87a355 100644
>>>>
>>>> --- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
>>>>
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
>>>>
>>>> @@ -1926,6 +1926,7 @@ static int dce_v11_0_crtc_do_set_base(struct drm_crtc *crtc,
>>>>
>>>>                   return r;
>>>>
>>>>
>>>>
>>>>           if (!atomic) {
>>>>
>>>> +               WARN_ON_ONCE(target_fb == fb);
>>>>
>>>>                   r = amdgpu_bo_pin(abo, AMDGPU_GEM_DOMAIN_VRAM);
>>>>
>>>>                   if (unlikely(r != 0)) {
>>>>
>>>>                           amdgpu_bo_unreserve(abo);
>>>>
>>> I did some tests, the warning can be triggered.
>>>
>>> pin/unpin operations in *_crtc_do_set_base() and
>>> amdgpu_display_crtc_page_flip_target() are mixed.
>> Ok sounds like we narrowed down the root cause pretty well.
>>
>> Question is now how can we fix this? Just not pin the BO when target_fb ==
>> fb?
> That worked. I did a few simple tests and didn't observe ttm_bo_release warnings
> any more.
>
> The pin/unpin logic,
>
> 1, fist crtc_mode_set, dce_v*_0_crtc_do_set_base() pins crtc->primary->fb(new),
> old_fb is NULL.
>
> 2, second crtc_mode_set, dce_v*_0_crtc_do_set_base() pins crtc->primary->fb(new),
> unpins old fb.
>
> 3, amdgpu_display_crtc_page_flip_target() pin/unpin operations.
>
> 4, third crtc_mode_set, dce_v*_0_crtc_do_set_base() pins crtc->primary->fb(new),
> unpins old fb (it is pinned in last call to amdgpu_display_crtc_page_flip_target)
>
> 5, amdgpu_display_crtc_page_flip_target() pin/unpin operations.
>
> .....
>
> x, reboot, amdgpu_display_suspend_helper() is called, the last pinned fb was unpinned.
>
> And I didn't observe amdgpu_bo_unpin() in dce_v*_0_crtc_disable() is called.
>
> If the logic is wrong, please correct me.

I can't fully judge because I'm not that deep with my head in the old 
display code, but from a ten mile high view it sounds sane to me. Michel 
what do you think?

BTW: Nicholas are there any plans to get rid of all that stuff? It would 
be a really nice cleanup of rather flaky code I think.

Thanks,
Christian.

>
> Regards,
> Lang
>
>> Thanks,
>> Christian.
>>
>>> Regards,
>>> Lang
>>>

