Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E37A94C3239
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 17:53:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10C4D10E469;
	Thu, 24 Feb 2022 16:53:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E89110E469
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 16:53:01 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id t14so3747397ljh.8
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 08:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6rQxjXtpXu2yAb/jowAuwRKR0kniyxdOrLxDLFvi0yI=;
 b=pJ+/uf9rIZEsItagsr2tmkqzFW9yixs9CzyRhYdA+vydMSnQto9SssCtMdU+vGn217
 ufQTQTy9nXGhxAeyGHlQCDl625iYrmpROdqAnpSzZAbCxwHlEIzIbDYn+lp38PNEXH1N
 ZPSO3epfeS7e5sdxN9fhMvkSmQGSIJiSS2QwPeaCH6lfLGpjRLgtNS2vALMhPx82h8fq
 VFPVWFKsCNyBGdLQCEtIijK1NIP9GHyHVDfDR6embgmBulp/iXPspc/DhZwz9Kwy3gL3
 Y3H1CmkTs+LA4iAHRi+NO6h+mJ91nCXORA2FGH+WWZul2JSQr0eMt2lXnNrQym2hs1Cs
 2+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6rQxjXtpXu2yAb/jowAuwRKR0kniyxdOrLxDLFvi0yI=;
 b=XV4b5aakUxmwgeTZw97VnyLpmMg8cGB88Il4/T3N0oFk/8g7479EV6eNm61QmWu32C
 hEDJrs85gEKMOyWsxaSOlwtYBvKbacO9KBIRe//jMrBm9OrbylGikwjK3amv8HJ/MWgw
 69bq2RNlPa61djL5MNbKhFpzqee36Pduzm+cql3XoasGpblJFgwENDyoTz4aEN5zDoFX
 620ZBIE2nj+4H7SKRstaDWVx3Y0owsd9XxJSRQiJ1yvaPgeSv7RnbYij2nv7O51H7QqE
 rx6mfdtqYwtu/uWRshLg2BZF9VpjHrle3UlNDD8KJJrEtkwO0S1RtuhyeRTubn7yxloY
 BevQ==
X-Gm-Message-State: AOAM531dhmZ7oO7Y3WLHuoyOvHPVc0Tv4NKPGoo73a0tsAAaz4flcdu4
 SpFCM/kMdD7LRtTRADj4wlE=
X-Google-Smtp-Source: ABdhPJySeNUF9Se5vXIwdNTcbknxa5e1zw6LB0LqowdsG230BkAJogc8AqFWu/aXzHRkruaOnntzTg==
X-Received: by 2002:a2e:5c81:0:b0:246:3c1e:b4db with SMTP id
 q123-20020a2e5c81000000b002463c1eb4dbmr2527010ljb.292.1645721579401; 
 Thu, 24 Feb 2022 08:52:59 -0800 (PST)
Received: from [192.168.2.145] (109-252-137-194.dynamic.spd-mgts.ru.
 [109.252.137.194])
 by smtp.googlemail.com with ESMTPSA id a17sm250224lfb.41.2022.02.24.08.52.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 08:52:58 -0800 (PST)
Message-ID: <6392f6b1-c41a-b9b9-d3c4-29252b349d97@gmail.com>
Date: Thu, 24 Feb 2022 19:52:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH libdrm v2 02/25] tegra: Remove unused IOCTL implementations
Content-Language: en-US
To: Thierry Reding <thierry.reding@gmail.com>
References: <20220217191625.2534521-1-thierry.reding@gmail.com>
 <20220217191625.2534521-3-thierry.reding@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <20220217191625.2534521-3-thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

17.02.2022 22:16, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> The DRM_TEGRA_GEM_{GET,SET}_FLAGS and DRM_TEGRA_GEM_{GET,SET}_TILING
> IOCTLs were badly designed and have since been obsoleted by framebuffer
> modifiers. Remove these implementations to make it clear their usage is
> discouraged.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>

To me it's not a good idea to remove any function, you're breaking ABI.

I foresee that get/set flags should become useful.

Instead of the removal, you may mark functions deprecated to let
compiler produce a compile-time warning and add clarifying comments to
the code.
