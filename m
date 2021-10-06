Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E03F424875
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 23:07:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EB996EE77;
	Wed,  6 Oct 2021 21:07:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0AFD6EE77
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 21:07:22 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id i24so15012733lfj.13
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Oct 2021 14:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TflpwPZE9QDA5GXWczKBZDym4osUpjQCVJ+bbBsqiE0=;
 b=nr8IPaGR1dE28DEaaKLAuVRaakV/rT8o2sub72N4Vzwem33US+OZ7pRqFAGpsv2b+i
 lI1rER4JJusEF+6mm4DL/JFQ+c8vjYTakgRkk8StkAmvPx8iVagXD12N8eOMSjvPujB/
 GReojgRxWsTnoVGdH0LFU+t3QJiN6Nzxd7+VDIOJscDBMK/K+smxLe77tvD+SxZ265C7
 36pkNhYiQL1xmOPs6W5FJDZoo0rOz5LOPbmjEzLto19t7MTdAHvRFohyKA6WcUu/QVkm
 eH937ELGYfEyA7CUukGQgofCi0SuIIxds6vA/F+2kxMSSD+HuXSmW/UfnzXii39GRf2R
 STVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TflpwPZE9QDA5GXWczKBZDym4osUpjQCVJ+bbBsqiE0=;
 b=1bP0WEH7/03s+aFLYck8e6n+NZudhs1sUT69xSLl4aBTVCx5cSkFwUOhb3YrpmO67M
 nQ+YOgYi5wOvNMdiecQckU/utOr5JlqvkYRRG7Y7fCEk4LvT3qU7Dj56s5QObHtz0Ot/
 1nzmoRSOl9+qGM9fladIo6T7ck9fNIDhCDxeHQZPchXQRE72DTTVawMri9Pzvqyn3Ojd
 UjhBee/qZWkzIWCAIAhj5ehsgT4O9/uqQ0aziSmW/TmqojZPVAJVxQJXSpBVTh49rni5
 NTRHWoBsmSmwxpRYJyUk7BCzmXaoza1bUiVmvcAUt58DNJYd2GBJkWVftVdAvoixlD4l
 /zyA==
X-Gm-Message-State: AOAM532qf3vwicbsRQeDGKQdMc8jsb+5zEE2HpMSc+b838g+BmPOiPdx
 gXtEs6SidX8o46zfoDDb4+0=
X-Google-Smtp-Source: ABdhPJxH3M3UiC/acM65+VrH5JGJnrQ/jXtTLT/Et40R0BaNG9dEoR4GmjTFe9pdwQITkdGBSbWWqQ==
X-Received: by 2002:a2e:7311:: with SMTP id o17mr296029ljc.267.1633554441149; 
 Wed, 06 Oct 2021 14:07:21 -0700 (PDT)
Received: from [192.168.2.145] (79-139-163-57.dynamic.spd-mgts.ru.
 [79.139.163.57])
 by smtp.googlemail.com with ESMTPSA id p5sm155845lfk.282.2021.10.06.14.07.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 14:07:20 -0700 (PDT)
Subject: Re: [PATCH v1 2/2] drm/tegra: dc: rgb: Allow changing PLLD rate on
 Tegra30+
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>,
 Maxim Schwalm <maxim.schwalm@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org
References: <20210929222805.16511-1-digetx@gmail.com>
 <20210929222805.16511-3-digetx@gmail.com> <YV3nQuo7eG6dkl0f@orome.fritz.box>
 <b858348a-698e-c22b-da9a-83cd2f00e668@gmail.com>
Message-ID: <b43c8e99-ba34-d853-c052-b9e7212d117e@gmail.com>
Date: Thu, 7 Oct 2021 00:07:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <b858348a-698e-c22b-da9a-83cd2f00e668@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

06.10.2021 21:27, Dmitry Osipenko пишет:
> 06.10.2021 21:13, Thierry Reding пишет:
>> On Thu, Sep 30, 2021 at 01:28:05AM +0300, Dmitry Osipenko wrote:
>>> Asus Transformer TF700T is a Tegra30 tablet device which uses RGB->DSI
>>> bridge that requires a precise clock rate in order to operate properly.
>>> Tegra30 has a dedicated PLL for each display controller, hence the PLL
>>> rate can be changed freely. Allow PLL rate changes on Tegra30+ for RGB
>>> output. Configure the clock rate before display controller is enabled
>>> since DC itself may be running off this PLL and it's not okay to change
>>> the rate of the active PLL that doesn't support dynamic frequency
>>> switching since hardware will hang.
>>>
>>> Tested-by: Maxim Schwalm <maxim.schwalm@gmail.com> #TF700T
>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>> ---
>>>  drivers/gpu/drm/tegra/dc.c  | 27 ++++++++++++--------
>>>  drivers/gpu/drm/tegra/dc.h  |  1 +
>>>  drivers/gpu/drm/tegra/rgb.c | 49 +++++++++++++++++++++++++++++++++++--
>>>  3 files changed, 65 insertions(+), 12 deletions(-)
>>
>> This seems overly complicated. I especially don't like the way how
>> clocks are looked up with clk_get_sys() and then used in the comparison.
>> Could this not be achieved by using assigned-clocks and friends
>> properties in DT?
> 
> Assigned-clocks have nothing to do with this patch. We need to check
> whether PLLD *is* already pre-assigned as the parent.
> 
> Adding properties for describing the clk parents is overly complicated,
> clk_get_sys() is a much simpler solution that doesn't involve extra DT
> changes.
> 
> BTW, assigned-clocks can't be used for display controller  because
> controller is usually turned on during boot and reparenting of active DC
> will hang machine.
> 

To make it more clear, we change the DC's "parent" in TF700T device-tree
to PLLD [1] to match the bootloader's configuration, otherwise it will
hang on boot since default "parent" in tegra30.dtsi is PLLP, and thus,
tegra_dc_rgb_probe() will try to reparent it to PLLP. Display of TF700T
won't work with PLLP anyways since it needs a specific clock rate.

[1]
https://github.com/grate-driver/linux/blob/master/arch/arm/boot/dts/tegra30-asus-tf700t.dts#L13
