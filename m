Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D24075AD779
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 18:32:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0198710E44F;
	Mon,  5 Sep 2022 16:32:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD7B710E44F;
 Mon,  5 Sep 2022 16:32:18 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id by6so9717067ljb.11;
 Mon, 05 Sep 2022 09:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc:subject:date;
 bh=8JQHR0mNkkvaucEp4HNFvrtWVwipxgdCyYirWkcxCuc=;
 b=Ee8/zXiC17K5Rmn0dM8r0JytBnfg1FnzFfKZcmoJMYt08MtgAEUEjpKH7+0UHsqlkK
 BZrCCHBnA1Je5o+/sxNlA3yrl0TxM37U7XpZXjbsaVxHKMl2x7PzYQchiiwPobO+z7V/
 tYJCFJd1YCvEbeeLM6BvAS/M1DUr6tpSFJVdgoRwA8WStFNY9E6PPHdk4RZZCOrggakT
 xyQ8/6DOwLr6S51gainQauwtIl7r4PsEHnn/94yga+F5jpf0cp7C0OxDPl+JWqQDMoGv
 UZySK3bX2kiLPPNYAc06FY4U1q0dxZf5LlWu/claShZQeiMPrvC2bab0MTV9I+5YA40i
 L12g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc:subject:date;
 bh=8JQHR0mNkkvaucEp4HNFvrtWVwipxgdCyYirWkcxCuc=;
 b=EE4eyaTrT0YQ5eN2QI+aVkhSCvGriBL7Kr/8sPd5LUHF2br+9OTfonZPfwxDxAVCJm
 Ou+fkmKti7Sl8VWRdlmvWzMBQQ40JPCgZhwg5rfrFrVMxm3lpeqQIoRFbM/O3wMzFqOh
 Vmt9Cj1AAVFTD2UQ3N+lWH7hg3CgGmRRakbD4THiXGrOWClIying5TkVd1E1l30Q0DIK
 iwypk5HinwUNQQgjK5NUYHNrqeNwm+QR95UTKZVSojZfpLlsTl6wrqjRphpkwXVInUxY
 uUsgjjMLb+peTkl0EWHXHaCjHe7660+9i80xzuhgNN0bzBziyl1T0lTquxYU/IvDKioJ
 11IA==
X-Gm-Message-State: ACgBeo0+JGE2T9EPArA2/pYbDW2rCj0iDc2LbDFEAAc4IY/yYfK4imyc
 NU07X8EDG/nrN+IqipiwiEz15JwPPcrdbg==
X-Google-Smtp-Source: AA6agR47yvdHHgnlIjy9Ip2njnz0g5/SwgXMzTGVjcmNgzpxzvtvdxNNmmfmzBYcTnu1KYoufiDMaA==
X-Received: by 2002:a2e:88d2:0:b0:263:2c63:d784 with SMTP id
 a18-20020a2e88d2000000b002632c63d784mr11481762ljk.12.1662395536908; 
 Mon, 05 Sep 2022 09:32:16 -0700 (PDT)
Received: from ?IPV6:2a02:a31a:a240:1700:9c45:8fa1:8ce7:8852?
 ([2a02:a31a:a240:1700:9c45:8fa1:8ce7:8852])
 by smtp.googlemail.com with ESMTPSA id
 q13-20020a056512210d00b004946a758d21sm1235189lfr.161.2022.09.05.09.32.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 09:32:16 -0700 (PDT)
From: Mateusz Kwiatkowski <kfyatek@gmail.com>
X-Google-Original-From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Message-ID: <6ac67d1f-e5b5-2687-372f-4146eed5cc5d@gmail.com>
Date: Mon, 5 Sep 2022 18:32:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH v2 10/41] drm/modes: Add a function to generate analog
 display modes
Content-Language: pl
To: Maxime Ripard <maxime@cerno.tech>,
 Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-10-459522d653a7@cerno.tech>
 <242d272b-5b79-986c-9aaf-64e62f6b37ff@gmail.com>
 <CAMuHMdWq3aOO4-2AReDeaC2VBJb=QJF2dTMZP=DGmwCg6ZOffA@mail.gmail.com>
 <20220905133251.js26hxdosibx4r4i@houat>
In-Reply-To: <20220905133251.js26hxdosibx4r4i@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 Nouveau Dev <nouveau@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Phil Elwell <phil@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Ben Skeggs <bskeggs@redhat.com>, linux-sunxi@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

W dniu 5.09.2022 o 15:32, Maxime Ripard pisze:
> Hi,
>
> On Wed, Aug 31, 2022 at 10:14:28AM +0200, Geert Uytterhoeven wrote:
>>>> +enum drm_mode_analog {
>>>> +    DRM_MODE_ANALOG_NTSC,
>>>> +    DRM_MODE_ANALOG_PAL,
>>>> +};
>>>
>>> Using "NTSC" and "PAL" to describe the 50Hz and 60Hz analog TV modes is common,
>>> but strictly speaking a misnomer. Those are color encoding systems, and your
>>> patchset fully supports lesser used, but standard encodings for those (e.g.
>>> PAL-M for 60Hz and SECAM for 50Hz). I'd propose switching to some more neutral
>>> naming scheme. Some ideas:
>>>
>>> - DRM_MODE_ANALOG_60_HZ / DRM_MODE_ANALOG_50_HZ (after standard refresh rate)
>>> - DRM_MODE_ANALOG_525_LINES / DRM_MODE_ANALOG_625_LINES (after standard line
>>>   count)
>>
>> IMHO these are bad names, as e.g. VGA640x480@60 is also analog, using
>> 60 Hz and 525 lines.  Add "TV" to the name?
>>
>>> - DRM_MODE_ANALOG_JM / DRM_MODE_ANALOG_BDGHIKLN (after corresponding ITU System
>>>   Letter Designations)
>>
>> Or DRM_MODE_ITU_*?
>> But given the long list of letters, this looks fragile to me.
>
> Does it matter at all? It's an internal API that isn't exposed at all.
> I'd rather have a common name that everyone can understand in this case
> rather than a *perfect* name where most will scratch their head
> wondering what it's about.

You may have a point. But in that case, maybe it'd make sense to at least add
a short comment explaining what do you mean by "NTSC" and "PAL" in this context?

Best regards,
Mateusz Kwiatkowski
