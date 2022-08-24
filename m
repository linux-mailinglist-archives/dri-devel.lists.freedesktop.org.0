Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C7159FFF8
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 19:02:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FB80BC328;
	Wed, 24 Aug 2022 17:00:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32B8DBCFCD
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 16:59:20 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id z6so24826185lfu.9
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 09:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc;
 bh=G82ihWj63KmrZTbNAM/UHivXSnuDSm1fupsjpoYLhDQ=;
 b=ftQ5CKHIBQWfNPo5g81XGiva+GwFlrcerSnJrQBQCJJeoaidvCPKD6uXoTh/koiu2i
 IJMMx3aVbOysnPqfl8kMWBhLA0YYhCEdMwB6db5hAcjW6KG31Q6CvL3nSbLrkrMBOu6m
 KQNymPiBiKVm3hs6kVoF0nCKXmyRBEQT1+7X1MSCGyIRK4fM1mZVzooY6bu3fIP+o+Pq
 uVO0e6XYDC8GXCtTIfEZkjhEtcvE7BJTJg/aCByHvv3hMnCoaKFm85qay6Fp9JCzyLMu
 qiEJ6OUFKRQeVmhhCoOVhb4GNPttwjvS0pIocjNxF74S8pp45y4eQ40da0WCDzUJosWj
 VJUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc;
 bh=G82ihWj63KmrZTbNAM/UHivXSnuDSm1fupsjpoYLhDQ=;
 b=4BTxF3rIE5LQIGOeb4jwhW5JNhsdoVTw4kOnOBdi1CZLZLdF0fTtoEf3wiBs//pdb1
 c3ZVMjYBCLGDkiyi7pElCGmkIUAO4EGZyS0SbUYr9B/54nWBDJFlmT9YNkj6uKGsqxmT
 tbfpLbSEWIoJJqnqV3/8EdwCChc9c9U9mOfzPrmQtsa+q13I1/wN7MPlIftLLL3X3qcU
 oMLoYgok/w6hQt+86vylRKMM/eeyef3E6U7cUaxNl0JB4/jaXRlWs8wZLVEt+ZYqMJQI
 s5SvDUHuyoYzVoLNcR+jVNte6eMSLcsETCvpRNiEJ+ZndsfLnl4hu4FTOwgB6smk4s0c
 F2LA==
X-Gm-Message-State: ACgBeo1jMF2gNgFnl/R2sQITAJoGUw0QgsTbfzCB7781zcL7L3kXJrg3
 vB8iwzhYndJQzVtOC52Qj0A=
X-Google-Smtp-Source: AA6agR7fnL/ZvcDcHwypYRSYkpoEHzQlH2Kbb9U7WlU6MfPD9bSoUMZqe83drqSNUCrLLqJYv5uOuQ==
X-Received: by 2002:a05:6512:3e09:b0:492:f8e5:5eb5 with SMTP id
 i9-20020a0565123e0900b00492f8e55eb5mr2552048lfv.498.1661360358306; 
 Wed, 24 Aug 2022 09:59:18 -0700 (PDT)
Received: from [10.10.53.53] (81-18-220-16.static.chello.pl. [81.18.220.16])
 by smtp.googlemail.com with ESMTPSA id
 k4-20020a05651210c400b0048d1101d0d6sm3941lfg.121.2022.08.24.09.59.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 09:59:17 -0700 (PDT)
From: Mateusz Kwiatkowski <kfyatek@gmail.com>
X-Google-Original-From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Message-ID: <b5b458bd-ec4b-0144-5ae2-378fda723ecf@gmail.com>
Date: Wed, 24 Aug 2022 18:59:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 24/35] drm/vc4: vec: Add support for more analog TV
 standards
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-24-3d53ae722097@cerno.tech>
 <0e7bebe2-3f45-0a1b-a4b6-bb783f8de7b6@gmail.com>
 <20220815083702.ipcmdwzkh2fxvdp7@houat>
In-Reply-To: <20220815083702.ipcmdwzkh2fxvdp7@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Emma Anholt <emma@anholt.net>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-sunxi@lists.linux.dev,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

W dniu 15.08.2022 o 10:37, Maxime Ripard pisze:
> Hi,
>
> On Fri, Jul 29, 2022 at 07:55:30PM +0200, Mateusz Kwiatkowski wrote:
>> Hi Maxime,
>>
>> I think that declaring PAL-B and SECAM-B as the only supported 576i
>> norms is a bit random.
>
> Starting with this patch, PAL-N should be supported as well, right?

Oh, sure. I forgot about it. My brain was too focused on the "standard PAL"
modes, which excludes PAL-N.

>
>> Norms B, D, G, H, I, K, K1 and L (for both PAL and SECAM) are
>> essentially identical if we're talking about baseband signals, AFAIK
>> they only differ when those are modulated as RF signals. I'm not sure
>> if there's a point to differentiating those (that's more about patch
>> 05/35) unless we need to deal with some device that actually features
>> an RF modulator.
>
> What I was aiming for is to have all the cases we have in all the
> drivers covered so that we can make that property generic. i915
> declares and uses all those variants:
>
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/i915/display/intel_sdvo.c#L68
>
> Especially since it's i915 and it's pretty much the standard as far as
> the uAPI goes, I'd rather avoid any regression there.

OK, if there are already drivers that differentiate those, then it doesn't make
sense to introduce regressions. And yes, there is plenty of software already out
there that differentiate between those modes in the context of composite video.
It still doesn't make much sense from the engineering point of view, though.

>
>> But if we do want to have all those norms separate, then I'd say that
>> VC4 should declare support for all of those, and all should map to the
>> same VEC settings. Some users from e.g. the UK might think that they
>> won't get proper picture if PAL-I is not on the list of supported
>> norms. Same goes for e.g. SECAM-D/K in the former Soviet territories,
>> and so on.
>
> I'd be open to it, but we can always extend vc4 to support those modes
> later on. The work you did to make that easier should make it trivial.

Doing that in the future is OK as well. I just wanted to point out that
PAL-B/D/G/H/I/K/K1/L (and same for SECAM) is the same exact thing as far as
baseband composite video is concerned, so declaring only one of those as
supported is potentially misleading for anybody who is not aware of that fact.

>
> Maxime

Best regards,
Mateusz Kwiatkowski
