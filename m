Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 036BC452B66
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 08:14:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76EA86E524;
	Tue, 16 Nov 2021 07:14:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70CF56E524;
 Tue, 16 Nov 2021 07:14:12 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id t30so35498767wra.10;
 Mon, 15 Nov 2021 23:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=iEgDbJ0TUFp+UkMI7veT+5D2sQqt3RbLdsuVCdYhsoo=;
 b=gVjT5x6w4uEIEBP3yHNrOYzqiPlNFBPFfSha0c/ogEgKyDM8v0Mla/L5oA8Jw+WgnK
 vBC9LFJgG4se1xIFF8ivACex8l4voNiW4lZLujCIBzk4/lfZTvIlQ3GGzV855PZFd3cD
 qGH79y4u4bqWYPEmZcJW8MC9Jwf96BvZRTmUgozohlMfvJiFleCB7FnZsAsDioxeptkc
 xtNVbzfKggerFORBzSkpt3fQnLJSTsalcBa769PdhqKNI0S9ut/naxlQOEV36cIcuHNB
 6Y1Z0FGaL4X+l08XH4EZj2YyNdoBIN8MvUir+VzjWnpY96CTSeuh7cxoK8jxn672Fa7s
 he8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=iEgDbJ0TUFp+UkMI7veT+5D2sQqt3RbLdsuVCdYhsoo=;
 b=IqhGgJnypLIZuQ6Et6Kv1TM4q3yt2ceSYOiavr2x3YivI2AdHjsPHYnQeg58ItX2A9
 OCM8f8BSERcSC/pQcSboXXV6qTdLc1VatwtbW3T+ma9aiXmF9LSRzjoslAvCn/+w753g
 JNr8xeDWNHsRCt0WJn9U1jmC6L/JTcpfOrD4/hEy9OEtzH/jUR4VTqIbKfxtxV6UHDVX
 b3b5SX32M/5VHwuN2SVOz83XbO8KNZlzNKzcSprumKpVwG3mAdoeXkLtjlBXLllH2tbW
 Fp0k2OkUoWU3HiGME1hBFq83lb6pQSbvUgldD1JXqnbbhD8nUWVYfV4BnPl02KjuOfEy
 Ky3Q==
X-Gm-Message-State: AOAM530uDxbWJH8NdZueiv+P5DL1wkupZcFTCs6Oh0kj18LKWysg5FwI
 ybDV/qiSIj3aezQCB6myiyY=
X-Google-Smtp-Source: ABdhPJyONNEmYa5pRAvhQPM1stXst6A+1hUxk8zVLr0w6f8C2kNpJZKBod/X6NNFXL9sETF/gbhPTw==
X-Received: by 2002:a05:6000:18a3:: with SMTP id
 b3mr6592053wri.343.1637046851083; 
 Mon, 15 Nov 2021 23:14:11 -0800 (PST)
Received: from [192.168.178.21] (p57b0b77b.dip0.t-ipconnect.de.
 [87.176.183.123])
 by smtp.gmail.com with ESMTPSA id u2sm19152373wrs.17.2021.11.15.23.14.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Nov 2021 23:14:10 -0800 (PST)
Subject: Re: Questions about KMS flip
To: Lang Yu <Lang.Yu@amd.com>, Michel DDDnzer <michel@daenzer.net>
References: <9a5b8470-d02d-71b4-4a89-6d6c32fdfa5d@daenzer.net>
 <88dfe9b4-e170-2d6b-604b-03af5d57152b@daenzer.net>
 <735f8781-982b-a09f-32fe-fded0024a587@gmail.com>
 <58097218-40dd-55fd-32d2-2a299d39230f@daenzer.net>
 <YZIA/dkvjuMsup24@lang-desktop>
 <cadb9503-b390-e254-ffba-5e2e11f100cc@daenzer.net>
 <YZIiqM6PKKL/ZMNy@lang-desktop>
 <f1b88742-b07e-5973-1e30-9674a5950bf3@daenzer.net>
 <YZJFHMEqm1oz7QJN@lang-desktop>
 <e44a237c-0073-2eec-1a47-c5faf99f77b4@daenzer.net>
 <YZMlGSA9iG3aVCUu@lang-desktop>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <391ee32e-f1b1-d92b-c9f3-17dbc0a9d690@gmail.com>
Date: Tue, 16 Nov 2021 08:14:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YZMlGSA9iG3aVCUu@lang-desktop>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Christian KKKnig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 16.11.21 um 04:27 schrieb Lang Yu:
> On Mon, Nov 15, 2021 at 01:04:15PM +0100, Michel DDDnzer wrote:
>> [SNIP]
>>> Though a single call to dce_v*_0_crtc_do_set_base() will
>>> only pin the BO, I found it will be unpinned in next call to
>>> dce_v*_0_crtc_do_set_base().
>> Yeah, that's the normal case when the new BO is different from the old one.
>>
>> To catch the case I described, try something like
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
>>
>> index 18a7b3bd633b..5726bd87a355 100644
>>
>> --- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
>>
>> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
>>
>> @@ -1926,6 +1926,7 @@ static int dce_v11_0_crtc_do_set_base(struct drm_crtc *crtc,
>>
>>                  return r;
>>
>>
>>
>>          if (!atomic) {
>>
>> +               WARN_ON_ONCE(target_fb == fb);
>>
>>                  r = amdgpu_bo_pin(abo, AMDGPU_GEM_DOMAIN_VRAM);
>>
>>                  if (unlikely(r != 0)) {
>>
>>                          amdgpu_bo_unreserve(abo);
>>
> I did some tests, the warning can be triggered.
>
> pin/unpin operations in *_crtc_do_set_base() and
> amdgpu_display_crtc_page_flip_target() are mixed.

Ok sounds like we narrowed down the root cause pretty well.

Question is now how can we fix this? Just not pin the BO when target_fb 
== fb?

Thanks,
Christian.

>
> Regards,
> Lang
>

