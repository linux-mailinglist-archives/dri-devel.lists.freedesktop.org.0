Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 588776DF3D9
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 13:36:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B97510E7AA;
	Wed, 12 Apr 2023 11:36:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50F8C10E794
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 11:36:25 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id j11so14198955wrd.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 04:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681299383; x=1683891383;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=S8BFR8AVgPS2QYGOohorLBlsx1T7B+KgsXDilsI77iY=;
 b=FVaOusrvG8+tO8XLfRkjzpO9MbhXan/wD6ka3h0NyKsVGArbBHWbpw2xVQlQFEZgPM
 QzUcn0NqGlwiduOj/0TrT1TqupkDyaA76L4y+55rqyNxXhxu8c0s1VCZ8R5q3xJYPcq4
 GEsUnQkrL6ELREePWeykFlYlZjJSv5schlkgVHuvPo7rVMXQDq1rRTev7354EPdfvbmv
 AMebHH9544qX+Nmf1xdmJ8fJtSavrRe2Srx9pGAG2xpNqwj5e4aowZZsvJ/GsaUDCte9
 Bx8uOB0UkD5yJ1eKbyJARHEpnh9pOKvijI78A5mcGjtIAkJI9rxMT/rm2nduByP1KiSG
 3YNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681299383; x=1683891383;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S8BFR8AVgPS2QYGOohorLBlsx1T7B+KgsXDilsI77iY=;
 b=dfJ5mavzKyu2c4krr1MNodSQG3oEAiq7ucU/P1RF8yA4ywjZJ25wyaRn8ibOdAMQ4a
 Sx9biDr+GPVYnBfZGRVyh4vh1SW+sZ8gwQetzwjEvnqKIUduLDt+brmg/+G+HekVTvBR
 HE4lNLRYHqoQ+7nxP3btD9qx4L4jQ0382P4HO1l5JeuLg7oRUw6gx7m3pYYPq8knafVc
 hmuNKl8YiGLuv2Pl7p27xgE0c0Q9ixMlfzsZwgVNbkxDhFEYKmT6L/pF7y5fRsyKwQTD
 UErFGy7vHhtsFLHaJpoYysx+MZ+37SpDsiEjAJ4TPJXmwM7Eg3nVhOiVqnJ2ReoskqZ6
 i4ig==
X-Gm-Message-State: AAQBX9eJO7DzhhCH8iBJOfLis57PWmVPisEZDgn2mpTz4YqF2BjeOYHX
 2m7io1h4VkcslAyJ9HHMhw7Ayw==
X-Google-Smtp-Source: AKy350aoHIXNxxlI9Ttapv30eVixQuDhlAiHxMIwXGTZMaZRmAY5p2tY8FHp1547mN6H+xoiBNs0nA==
X-Received: by 2002:a05:6000:550:b0:2d5:39d:514f with SMTP id
 b16-20020a056000055000b002d5039d514fmr1549498wrf.65.1681299382793; 
 Wed, 12 Apr 2023 04:36:22 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:b777:4c24:cbcf:795f?
 ([2a01:e0a:982:cbb0:b777:4c24:cbcf:795f])
 by smtp.gmail.com with ESMTPSA id
 c4-20020a5d5284000000b002d1801018e2sm16958010wrv.63.2023.04.12.04.36.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 04:36:22 -0700 (PDT)
Message-ID: <2d6a07ec-5094-62d5-9767-d8119ffd9eb4@linaro.org>
Date: Wed, 12 Apr 2023 13:36:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] MAINTAINERS: add drm_bridge for drm bridge maintainers
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20230412080921.10171-1-daniel.vetter@ffwll.ch>
Content-Language: en-US
Organization: Linaro Developer Services
In-Reply-To: <20230412080921.10171-1-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Reply-To: neil.armstrong@linaro.org
Cc: Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/04/2023 10:09, Daniel Vetter wrote:
> Otherwise core changes don't get noticed by the right people. I
> noticed this because a patch set from Jagan Teki seems to have fallen
> through the cracks.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> --
> Jagan, with this your bridge series should find the right people!
> 
> Cheers, Daniel
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6a4625710f25..cf2add900c8b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6843,6 +6843,7 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
>   F:	Documentation/devicetree/bindings/display/bridge/
>   F:	drivers/gpu/drm/bridge/
>   F:	include/drm/drm_bridge.h
> +F:	drivers/gpu/drm/drm_bridge.c
>   
>   DRM DRIVERS FOR EXYNOS
>   M:	Inki Dae <inki.dae@samsung.com>

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
