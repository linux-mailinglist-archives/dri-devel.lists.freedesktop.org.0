Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B477500E3B
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 15:00:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 044F310F20A;
	Thu, 14 Apr 2022 13:00:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com
 [209.85.160.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 818C810F20A
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 13:00:33 +0000 (UTC)
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-d6e29fb3d7so5144352fac.7
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 06:00:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NBHcw6JeGXAP/4GusoH91XnOTRObIe9CkFkL3mCbYg8=;
 b=FTE8q5cQKZgRUC01BvcuuJe0OV+4k0pXZsstiM89qWdhKfgOk5PnbtzVUzNNzXEf9S
 gK25OthWPrpjZdLnIO4YRKPa6pR4Run8CDftM+xS6kIQTHG6k/7uo4aFkOftpBBNT7pC
 0ff8JQDjIz2rTLzrWtgnc+nIwFm7xYFNfBKaQmh72uKlW6cjRpG1jtcVlflayUS9BnTo
 sJX7qoc768bR5QQMejiUxrCpUM+xCRYvyT/ZkeFw9ILvcRPSRSusBBDRK24S+WGAYoVU
 GWnf/D+2HvKDIW/BMo35SjrGgv3KoHQGDsG2uj1/Pj5F3QIYMyu6qXQamiBgEolBFrAJ
 7S4w==
X-Gm-Message-State: AOAM532woIA32B7nn+xmwqAzoedw5ae1VE9xXkX1quWIu3Sw+JSmYics
 8jLnk6kZO9sGL6xoOZdMQg==
X-Google-Smtp-Source: ABdhPJxn5+pUNbFlHlXi8f4P1KZwuQKUmPXxTi5iN7R5Ln4s8z+F1mCA5m1OfUiIcMQt9zJfTe8JJg==
X-Received: by 2002:a05:6871:88d:b0:e2:9d93:730c with SMTP id
 r13-20020a056871088d00b000e29d93730cmr1211227oaq.216.1649941232558; 
 Thu, 14 Apr 2022 06:00:32 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 a17-20020a4ae931000000b0032933be7230sm656536ooe.4.2022.04.14.06.00.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 06:00:31 -0700 (PDT)
Received: (nullmailer pid 1755133 invoked by uid 1000);
 Thu, 14 Apr 2022 13:00:30 -0000
Date: Thu, 14 Apr 2022 08:00:30 -0500
From: Rob Herring <robh@kernel.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v4 1/5] dt-bindings: display: ssd1307fb: Deprecate "-i2c"
 compatible strings
Message-ID: <Ylga7jYPaAav05gg@robh.at.kernel.org>
References: <20220413162359.325021-1-javierm@redhat.com>
 <20220413162359.325021-2-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220413162359.325021-2-javierm@redhat.com>
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
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 dri-devel@lists.freedesktop.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 13 Apr 2022 18:23:54 +0200, Javier Martinez Canillas wrote:
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

Reviewed-by: Rob Herring <robh@kernel.org>
