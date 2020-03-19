Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4404E18AB26
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 04:25:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E32086E988;
	Thu, 19 Mar 2020 03:25:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 137F46E988
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 03:25:34 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id c25so797002ioi.5
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 20:25:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=S5anLZMsOzXiKSI2Q9qRVRtZTctavZWErUY+Qb7ZPsA=;
 b=QBTkzAjsVJWNUW1I/uwqYzbG/j3Q7Y8RkJ8PFobwcGodUQjnqiAdTaGYSycadEPqcS
 RYOvsCQZzpL/PsFG3RUoT0ktVdoZia+v8xpiFf5xpnAAqrTY1sb7Drpj43fIcHu8qoku
 N09ZvFm3qRyon+NhVSWlaAy2c9mXFl9yvNe2epOCIVBSikbS9U+5zEEXbp79xHDlTfzR
 bNd7as2wy58i3OA5dNCNrROZlJCQqKs5wztZ2sYrtmMfIes8vrPkDup9/zJEHZ48LnLz
 tsGswuyP61v0lSHuzxsnOqeTVUvynxC8bsMgk5oH+ehWLKd6jaN1K+1gSSISMU/tdXUw
 +I2g==
X-Gm-Message-State: ANhLgQ1xKeg2QgWUV5JfKYP2rCmTOO0DuSpRRnqNGKi4eOCzeuvmpbIv
 j4nCdfh8HN7inw9TMH+IMQ==
X-Google-Smtp-Source: ADFU+vtb+ZlxkqiuBeBUxhCr8h7Qq0fvdiDR6y3QBh9G3qX9Tx4a1iQ8P++RaCdhLuk3JsPDPmjTEA==
X-Received: by 2002:a02:ac90:: with SMTP id x16mr1231418jan.12.1584588333327; 
 Wed, 18 Mar 2020 20:25:33 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id t86sm335763ili.82.2020.03.18.20.25.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2020 20:25:32 -0700 (PDT)
Received: (nullmailer pid 31095 invoked by uid 1000);
 Thu, 19 Mar 2020 03:25:28 -0000
Date: Wed, 18 Mar 2020 21:25:28 -0600
From: Rob Herring <robh@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 0/36] dt-bindings: display: convert remaning panel
 bindings to DT Schema
Message-ID: <20200319032528.GL29911@bogus>
References: <20200315134416.16527-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200315134416.16527-1-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Nikolaus Schaller <hns@goldelico.com>, Jonathan Bakker <xc-racer2@live.ca>,
 Sandeep Panda <spanda@codeaurora.org>, dri-devel@lists.freedesktop.org,
 Paul Cercueil <paul@crapouillou.net>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chris Zhong <zyw@rock-chips.com>, Marco Franchi <marco.franchi@nxp.com>,
 Stefan Mavrodiev <stefan@olimex.com>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>, Tony Lindgren <tony@atomide.com>,
 Nickey Yang <nickey.yang@rock-chips.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Robert Chiras <robert.chiras@nxp.com>,
 Vinay Simha BN <simhavcs@gmail.com>, Marek Belisko <marek@goldelico.com>,
 Heiko Schocher <hs@denx.de>, Brian Masney <masneyb@onstation.org>,
 devicetree@vger.kernel.org, Guido Gunther <agx@sigxcpu.org>,
 Mark Brown <broonie@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Werner Johansson <werner.johansson@sonymobile.com>,
 Purism Kernel Team <kernel@puri.sm>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Lin Huang <hl@rock-chips.com>, Douglas Anderson <dianders@chromium.org>,
 linux-spi@vger.kernel.org, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Mar 15, 2020 at 02:43:40PM +0100, Sam Ravnborg wrote:
> Convert remaining(*) panel bindings to DT Schema.
> 
> To prepare for the migration a few preparations
> patches was required:
> 
> - te-gpios is now added to panel-common - as this
>   property is used by a few bindings.
> 
> - The slave part of spi-controller.yaml was migrated to a
>   new file spi-slave.yaml.
>   This was done so spi slaves in panel/ could include
>   this file rather than duplicate property names.
>   => Please review this carefully!
> 
> 
> The original author of the panel bindings are listed as maintainer
> in the DT Schema. In the few cases the panel binding was also
> listed in MAINTAINERS I checked that there was a match.
> It was done manually so I may have missed someone.
> 
> All bindings pass dt_binding_check with no warnings.
> 
> - "dt-bindings: display: convert ilitek,ili9322 to DT"
>   The .txt file listed some constrains that I did not manage
>   to capture in the DT Schema.
>   And some properties looks like that could be dropped.
>   => Please take a closer look.
> 
> - "dt-bindings: display: convert sharp,lq101r1sx01 to DT Schema"  
>   The .txt file describes some constrains, as some properties
>   are mandatory for the main challen, but not allowed
>   for the secondary channel.
>   These constraints are not matched in the DT Schema.
>   => Any hints how to do this would be appreciated.
> 
> 
> Patches made on top of drm-misc-next as of today with no other patches.
> 
> (*) Two .txt files reamins:
> - display-timing.txt, points to display-timings.yaml
> - panel-dsi-cm.txt, conversion is included in another patch-set
> 
> 	Sam
> 
> Sam Ravnborg (36):
>       dt-bindings: display: add te-gpios to panel-common
>       dt-bindings: spi: support non-spi bindings as SPI slaves
>       dt-bindings: display: convert samsung,s6e63m0 to DT Schema
>       dt-bindings: display: convert arm,versatile-tft-panel to DT Schema
>       dt-bindings: display: convert boe,himax8279d to DT Schema
>       dt-bindings: display: convert ilitek,ili9322 to DT Schema
>       dt-bindings: display: convert ilitek,ili9881c to DT Schema
>       dt-bindings: display: convert feiyang,fy07024di26a30d to DT Schema
>       dt-bindings: display: convert innolux,p079zca to DT Schema
>       dt-bindings: display: convert innolux,p097pfg to DT Schema
>       dt-bindings: display: convert innolux,p120zdg-bf1 to DT Schema
>       dt-bindings: display: convert jdi,lt070me05000 to DT Schema
>       dt-bindings: display: convert kingdisplay,kd035g6-54nt to DT Schema
>       dt-bindings: display: convert kingdisplay,kd097d04 to DT Schema
>       dt-bindings: display: convert simple lg panels to DT Schema
>       dt-bindings: display: convert lg,lg4573 to DT Schema
>       dt-bindings: display: convert osddisplays,osd101t2587-53ts to DT Schema
>       dt-bindings: display: convert raydium,rm67191 to DT Schema
>       dt-bindings: display: convert rocktech,jh057n00900 to DT Schema
>       dt-bindings: display: convert samsung AMOLED to DT Schema
>       dt-bindings: display: convert samsung,s6d16d0 to DT Schema
>       dt-bindings: display: convert samsung,ld9040 to DT Schema
>       dt-bindings: display: convert samsung,s6e8aa0 to DT Schema
>       dt-bindings: display: convert toppoly panels to DT Schema
>       dt-bindings: display: convert startek,startek-kd050c to DT Schema
>       dt-bindings: display: convert sony,acx565akm to DT Schema
>       dt-bindings: display: convert sitronix,st7701 to DT Schema
>       dt-bindings: display: convert sitronix,st7789v to DT Schema
>       dt-bindings: display: drop unused simple-panel.txt
>       dt-bindings: display: convert sharp,ls043t1le01 to DT Schema
>       dt-bindings: display: convert sharp,lq101r1sx01 to DT Schema
>       dt-bindings: display: convert sharp,ls037v7dw01 to DT Schema
>       dt-bindings: display: convert sharp,lq150x1lg11 to DT Schema
>       dt-bindings: display: convert seiko,43wvf1g to DT Schema
>       dt-bindings: display: convert lgphilips,lb035q02 to DT Schema
>       dt-bindings: display: convert olimex,lcd-olinuxino to DT Schema

I've gone rather quickly thru the series. Other than what I commented 
on, the rest look fine generally. There may be a couple with similar 
comments.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
