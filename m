Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6F46DF503
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 14:23:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC20910E7B3;
	Wed, 12 Apr 2023 12:22:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E769210E7B3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 12:22:57 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id j1so14698280wrb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 05:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681302176; x=1683894176;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=uDG7f1yDz4lWGnYCJ1OLohNHXoKMd8vyIkP7lFvnnqE=;
 b=MNCDLtaBY6+HWxSLdUl/gKMV/kyECIIu+OrLK4rrrFCX2qgrobS0PbgEpaz3YgMMXr
 XLIP2KDCJ796YTaTVeNHUZhDoYUeu5O/ZcniNpPGHF2M0Jg18nki/H0t5KI9yxrpwuaq
 z3SRygCY5ZAM7bCH62iaFw8fN+k3Fl+DDDbZmiTMBxUrB8O6B5I2pG2+2ALShiSr0xdI
 03T3SDSJv6nM0uKPZFgiX2ydHGtCn3ltZEH21qo7OOyWFDRC25xP7mDdf0D05c2O3dlX
 XX9r+wPqoy+1bPMwHPiel37v26oiWSJsvgI0GPiN+7NLlp23pgSQi+ncXtb38m3YJDdY
 /uDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681302176; x=1683894176;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uDG7f1yDz4lWGnYCJ1OLohNHXoKMd8vyIkP7lFvnnqE=;
 b=p1ZusFlPjtjJ4Cle2snAZLQGZHRvKPVxGYh2ezewAGsE/pcihr/owTMjdwvmLjGQCv
 0hCS6Px2ERdTf/nT2egjTdKbEuJSdeQ3ekZUsbMiFWQIW5DTl3oFhKVyBSxtWTLNkqH3
 /EbqkdBsHEA46wLbR9XXHhQvCbLn9CQ/lgYOVCUHIEH5ZNMFaWIIZMZKNo2/RTUvS0tc
 YkBhkbXqbBRmAIYZ8RqVc6JEPE/wUXzIPjkGBfcyKMQ0qZDFMQa29onTHJ+3aOwwp3m/
 1MopxcY62w9dUI22uFFh0JdyjAQ4ukxpeVfaLtmHFiwXPaOt6w3KZCKYf76aowA7PzoX
 RiSQ==
X-Gm-Message-State: AAQBX9eCzJN24mgS2mu8ET9nxRsQZaoweAAT0WuYRpC+dk5m3KnQaucp
 tS6IeSmyv+fG2LqLdYoW6Y/X/w==
X-Google-Smtp-Source: AKy350bVClFpEmC+KSuG1kq11gTkEmAXgcewcjUjcgJQSGlrZ8iFcDCxwLZQFIUHs6ny+IZQllfe1A==
X-Received: by 2002:a5d:4d4d:0:b0:2ef:bb9f:e9e1 with SMTP id
 a13-20020a5d4d4d000000b002efbb9fe9e1mr1543635wru.56.1681302175721; 
 Wed, 12 Apr 2023 05:22:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:b777:4c24:cbcf:795f?
 ([2a01:e0a:982:cbb0:b777:4c24:cbcf:795f])
 by smtp.gmail.com with ESMTPSA id
 m13-20020a056000180d00b002efac42ff35sm14926410wrh.37.2023.04.12.05.22.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 05:22:55 -0700 (PDT)
Message-ID: <740789f8-7f60-d6d7-35a1-127efd04468f@linaro.org>
Date: Wed, 12 Apr 2023 14:22:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] MAINTAINERS: add drm_bridge for drm bridge maintainers
Content-Language: en-US
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20230412080921.10171-1-daniel.vetter@ffwll.ch>
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

Hi,

On 12/04/2023 10:09, Daniel Vetter wrote:
> Otherwise core changes don't get noticed by the right people. I
> noticed this because a patch set from Jagan Teki seems to have fallen
> through the cracks.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

I'm applying it but I get:
WARNING: From:/Signed-off-by: email address mismatch: 'From: Daniel Vetter <daniel.vetter@ffwll.ch>' != 'Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>'

I can fix it to Daniel Vetter <daniel.vetter@ffwll.ch> while applying like for the alphabetic order

Neil

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

