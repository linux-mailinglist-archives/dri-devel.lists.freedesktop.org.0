Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0129126A5F4
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 15:10:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71F9D6E297;
	Tue, 15 Sep 2020 13:10:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 649C66E297
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 13:10:20 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id o5so3197544wrn.13
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 06:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PzwaoGAaAw3eToudCX8zu6LBf47xuCGh+c0p3NOi0HQ=;
 b=O77E75MwpshPpyRvgZbs1KH0Ie00TjiGkb+7RbnZDbNSDDoALLFBhSRHebRtqSGs8D
 Zxm8PbLM1juVfN4p0ufOt3a1NJv55ntc8gZMmUfx3MWhs5TnyR3FGsO+oetAS4/nIQ3G
 CRxCd8MWs8UJx8Rldbt94js8QyT4lknuIv4aNVJRW1r3KDcmGVUfb4YrJXmrkgkdJD1j
 KVbT7mXnSe5Qj9ZSjSw19i4EQPFnUMB6fZeYhdlHvGhJpyB9p8oXsX2CCqqsziaA8il1
 25FtF0wqJMWq7wxbKxIJMZy2HLhy2AvH4/GkDTtPE/eOGe8Xb39as8lD4ByV9ykbompf
 9H5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=PzwaoGAaAw3eToudCX8zu6LBf47xuCGh+c0p3NOi0HQ=;
 b=ecgyLlXa/rL62IWMW+BJsqvN9Y9v8MOIm1pMLrXnMrNdaVHmZZPjgpx9wd5cQgyWUw
 yRIjLc+kA7L/o0NPrL/K6182VqbtRBgJU5mVu4SwSFWh+exDpPNc8qymGvYq+ZtY+Ssr
 OSUo7jsVoixC6YtK4CmpwTZZjWq9Qz3McBhFh12rVzmHSoG9jz/Cdjm8kTKr1SbIiJsF
 Rg8q3GAB/eN2+3lU7CyzV+92Au04q+pMLfEBv+PLicVDGcA+qzYqGrYhPab6Ank/Zie4
 rVrPjlb9APY7Vg9xVAJUmvbKeSHJBGOdT0KpbScQ1dFwb0BMiYxdPLSlMzhKAMhB2ItH
 aVHA==
X-Gm-Message-State: AOAM533u+vcLKUm/fLTr0raprp8Y0kn5CNEkzk66NykvITUzf5I6Cvdg
 iC0Err3reI7lgP8fnYCrg6n1duhxJTnPOt6j
X-Google-Smtp-Source: ABdhPJxmDszpPlM0dwv9rTgr5Cybx+UD6IkijdeDQd+qBhPuO2WproqNINLF4Wzhb1s0cTUjqnPhyw==
X-Received: by 2002:a5d:6283:: with SMTP id k3mr22138255wru.191.1600175418350; 
 Tue, 15 Sep 2020 06:10:18 -0700 (PDT)
Received: from [192.168.1.23] (home.beaume.starnux.net. [82.236.8.43])
 by smtp.gmail.com with ESMTPSA id a15sm28521436wrn.3.2020.09.15.06.10.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Sep 2020 06:10:17 -0700 (PDT)
Subject: Re: [PATCH v3 0/1] drm/bridge: ps8640: Make sure all needed is
 powered to get the EDID
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-kernel@vger.kernel.org
References: <20200827085911.944899-1-enric.balletbo@collabora.com>
 <68d6a409-39fb-0aa8-7d21-d6afc7b51aab@collabora.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <3a711997-65d4-91ab-1613-c0746d003dcd@baylibre.com>
Date: Tue, 15 Sep 2020 15:10:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <68d6a409-39fb-0aa8-7d21-d6afc7b51aab@collabora.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, drinkcat@chromium.org,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 laurent.pinchart@ideasonboard.com, hsinyi@chromium.org, matthias.bgg@gmail.com,
 Collabora Kernel ML <kernel@collabora.com>, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 15/09/2020 14:40, Enric Balletbo i Serra wrote:
> Hi Sam,
> 
> On 27/8/20 10:59, Enric Balletbo i Serra wrote:
>> The first 4 patches of the series version 2:
>>   - drm/bridge_connector: Set default status connected for eDP connectors
>>   - drm/bridge: ps8640: Get the EDID from eDP control
>>   - drm/bridge: ps8640: Return an error for incorrect attach flags
>>   - drm/bridge: ps8640: Print an error if VDO control fails
>>
>> Are already applied to drm-misc-next, so I removed from this series. The
>> pending patch is part of the original series and is a rework of the power
>> handling to get the EDID. Basically, we need to make sure all the
>> needed is powered to be able to get the EDID. Before, we saw that getting
>> the EDID failed as explained in the third patch.
>>
>> [1] https://lkml.org/lkml/2020/6/15/1208
>>
>> Changes in v3:
>> - Make poweron/poweroff and pre_enable/post_disable reverse one to each other (Sam Ravnborg)
>>
>> Changes in v2:
>> - Use drm_bridge_chain_pre_enable/post_disable() helpers (Sam Ravnborg)
>>
>> Enric Balletbo i Serra (1):
>>   drm/bridge: ps8640: Rework power state handling
>>
>>  drivers/gpu/drm/bridge/parade-ps8640.c | 68 ++++++++++++++++++++++----
>>  1 file changed, 58 insertions(+), 10 deletions(-)
>>
> 
> A gentle ping on this patch. Would be nice land this together with the already
> accepted patches.

Applying it to drm-misc-next

Thanks,
Neil

> 
> Thanks,
>   Enric
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
