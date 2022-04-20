Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A552C508CF9
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 18:15:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE5B010E238;
	Wed, 20 Apr 2022 16:15:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6D3410E238
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 16:15:38 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id t15so2608040oie.1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 09:15:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mMtqLmkNBwbaTgADKyEBhTC53U6B2x21wOWtV99B4Jk=;
 b=USXc6D4RaCTsrSRUvnwKNqVqKUozFaigAW+PeEYec6MVEa0z3JsTjzeN6dMOE6Hp9E
 ErttlSD9n+xbyXwcpJ0d3TZ4kBb1wV1wfdFzVv/vcXLYvH+T5yLkxBVqdRk/yqCkFeSi
 ffhXkFUoTZ78hmKD88G7XJ7DGsp5LaEbUAa7zh49BOqQJywHjt52Yv9H3hJZnkq26muo
 QVGH85lKkgyP58LyhuWDNkfZh8T1Tko3FdxVLGUodAUQfV/A/Ind5lJRpbyZtlNh5ZEe
 HL8HBoQtH9DcRA/hsl2WYQ+blm3ieOcefnIA0tiUOGpteo11LbPF+EhRt/Qi3DQqh8OZ
 otrQ==
X-Gm-Message-State: AOAM530E/BIs3Kc9a1h80x/AYv30CHQhqK11zGaYEdlYfQCzUopuFR8L
 zIG93AO8jWdtgAY+ietl4g==
X-Google-Smtp-Source: ABdhPJwUNQ7FBgit0u+Y1WJjPH+rXvzlqZYthoA9oJQSfjV65Mp88v/mECrK91YMRuCQXkqpzFo9lA==
X-Received: by 2002:a05:6808:3009:b0:2f9:6119:d676 with SMTP id
 ay9-20020a056808300900b002f96119d676mr2108712oib.205.1650471337926; 
 Wed, 20 Apr 2022 09:15:37 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 l14-20020a4ac60e000000b0032993003287sm6845329ooq.38.2022.04.20.09.15.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 09:15:37 -0700 (PDT)
Received: (nullmailer pid 1410409 invoked by uid 1000);
 Wed, 20 Apr 2022 16:15:36 -0000
Date: Wed, 20 Apr 2022 11:15:36 -0500
From: Rob Herring <robh@kernel.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v5 1/5] dt-bindings: display: ssd1307fb: Deprecate "-i2c"
 compatible strings
Message-ID: <YmAxqNb7nKlypkqD@robh.at.kernel.org>
References: <20220419214824.335075-1-javierm@redhat.com>
 <20220419214824.335075-2-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220419214824.335075-2-javierm@redhat.com>
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
Cc: devicetree@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 dri-devel@lists.freedesktop.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 19 Apr 2022 23:48:19 +0200, Javier Martinez Canillas wrote:
> The current compatible strings for SSD130x I2C controllers contain both an
> "fb" and "-i2c" suffixes. It seems to indicate that are for a fbdev driver
> and also that are for devices that can be accessed over an I2C bus.
> 
> But a DT is supposed to describe the hardware and not Linux implementation
> details. So let's deprecate those compatible strings and add new ones that
> only contain the vendor and device name, without any of these suffixes.
> 
> These will just describe the device and can be matched by both I2C and SPI
> DRM drivers. The required properties should still be enforced for old ones.
> 
> While being there, just drop the "sinowealth,sh1106-i2c" compatible string
> since that was never present in a released Linux version.
> 
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> Acked-by: Mark Brown <broonie@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> 
> (no changes since v3)
> 
> Changes in v3:
> - Drop the "sinowealth,sh1106-i2c", wasn't in a released version (Chen-Yu Tsai)
> - Continue enforcing required properties for deprecated strings (Maxime Ripard)
> 
> Changes in v2:
> - Drop the -i2c suffixes from the compatible strings too (Geert Uytterhoeven)
> 
>  .../bindings/display/solomon,ssd1307fb.yaml   | 44 +++++++++++++------
>  1 file changed, 31 insertions(+), 13 deletions(-)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

