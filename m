Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F826366A32
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 13:56:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 060496E0AF;
	Wed, 21 Apr 2021 11:56:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 812BB6E0AF
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 11:56:01 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id c15so32136853wro.13
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 04:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eA2+GdzjmDlaKe1AeHTuApOJCWhzb0IRtZ0HZSP/vKQ=;
 b=YWDMmZhypQ8JPCGyjSkNop/VspTvOdvkPkaE7ZnMU0WqBQp/oWWCrL/y+4UkePHZOp
 FocKk2n+5bgqOrjULSwuk7620OjDaqDvjn0F4iuh0rXVTAhK/dC5uFfEfjY283EIWcUP
 pwvsNEwdTO39+ihKxjyZ+IC75WjTdHvjJRYP5Mi4AQA0Vdit5Dt25H8Sy0PBieBHvJwK
 mkVC5j6TKmiIG8hh8KQvUkTeFbSQOTRatMZ+CqHcEoc7rxr+jrP062DZh/TWM26dDN5i
 ir/IZ/Tg1AgAU9MFO82JvdqCjDyDddJmpzppnjH/9pAJ9K9xqtmolqI+dE5RdTnbKvUu
 canw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=eA2+GdzjmDlaKe1AeHTuApOJCWhzb0IRtZ0HZSP/vKQ=;
 b=roDHvUU/pGKT95iib3LfcnPBeDKAwiSX/KMbOPx/0goz7R+xZG2xtCamMtEEiXTBZq
 HvByvfed5NAKquod04gY31rhsRJFv4WelAYxjfPA7NcNpOKAr/UjoEBy5pAUMNZD2d6Y
 +b6NzMLGc03MpoPajTHtxAZdTFuvpOC42TNcjlRQbxyxTHkbdW9Arpib9gWdNhsQ/FL+
 iwc/Y5PRq0k2I9dXfyoqUKOa08spJlzU2Pl2uo6AsBNqVzC79vB+BomkppQxac/5flmc
 AkeiAIF7p7JcMvWoVH7M11R5OjpwAfn5e9iLv8TLJ3glJXVdzBDmUsjzPQA+K8+1FdER
 UB+A==
X-Gm-Message-State: AOAM531je7XAeNiEdmAjK4O67xpSE52l6Lixs6R9nw3hhHAptysUPP7A
 m+VyhoG0osU56l2CnE9jtAcdLw==
X-Google-Smtp-Source: ABdhPJwlaMDo/ZMBZlwU1omRxqUpT6BT0PXYg/69sx48gKsR+lWqcCCVom1+ar5AD5oJc2UCTpx5qQ==
X-Received: by 2002:adf:bc09:: with SMTP id s9mr26074732wrg.329.1619006160111; 
 Wed, 21 Apr 2021 04:56:00 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:f781:73d5:3127:752d?
 ([2a01:e0a:90c:e290:f781:73d5:3127:752d])
 by smtp.gmail.com with ESMTPSA id g132sm2161190wmg.42.2021.04.21.04.55.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Apr 2021 04:55:59 -0700 (PDT)
Subject: Re: [PATCH v4 0/3] drm/bridge: Add it66121 driver
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com,
 paul@crapouillou.net, robert.foss@linaro.org
References: <20210419071223.2673533-1-narmstrong@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <b2b8fef3-6a49-3884-8d06-99f6b8997e1f@baylibre.com>
Date: Wed, 21 Apr 2021 13:55:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210419071223.2673533-1-narmstrong@baylibre.com>
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
Cc: jernej.skrabec@siol.net, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jonas@kwiboo.se
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/04/2021 09:12, Neil Armstrong wrote:
> The IT66121 is a high-performance and low-power single channel HDMI
> transmitter, fully compliant with HDMI 1.3a, HDCP 1.2 and backward
> compatible to DVI 1.0 specifications.
> It supports pixel rates from 25MHz to 165MHz.
> 
> This series contains document bindings, add vendor prefix, Kconfig to
> enable or not.
> For now, the driver handles only RGB without color conversion.
> Audio, CEC and HDCP are not implemented yet.
> 
> Changes since v3 at [2]:
> - DT
>  - removed i2c reg description
>  - used 4 spaces indent in example
>  - added review tags
> - driver
>  - added missing includes
>  - added missing atomic bridge callbacks
>  - dropped connector creation completely, only supports NO_CONNECTOR
>  - moved single line helpers to inline
>  - some more indentation cleanups
> - MAINTAINER
>  - fixed order
>  - added review tags
> 
> Changes since v2 at [1]:
> - fixed DT bindings by:
>   - adding bus-width property to input port
>   - correctly defining ports
>   - other minor fixes
> - fixed bridge driver by:
>   - general cleanup following Andy's comments
>   - implemented support for NO_CONNECTOR
>   - makes basic usage of the bus width property
>   - add support for bus format negociation
>   - other minor fixes
> - fixed order of MAINTAINERS entries
> 
> [1] https://lore.kernel.org/r/20200311125135.30832-1-ple@baylibre.com
> [2] https://lore.kernel.org/r/20210412154648.3719153-1-narmstrong@baylibre.com
> 
> Phong LE (3):
>   dt-bindings: display: bridge: add it66121 bindings
>   drm: bridge: add it66121 driver
>   MAINTAINERS: add it66121 HDMI bridge driver entry
> 
>  .../bindings/display/bridge/ite,it66121.yaml  |  124 ++
>  MAINTAINERS                                   |    8 +
>  drivers/gpu/drm/bridge/Kconfig                |    8 +
>  drivers/gpu/drm/bridge/Makefile               |    1 +
>  drivers/gpu/drm/bridge/ite-it66121.c          | 1021 +++++++++++++++++
>  5 files changed, 1162 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
>  create mode 100644 drivers/gpu/drm/bridge/ite-it66121.c
> 

Applied to drm-misc-next !
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
