Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8E24BD3D5
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 03:36:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5471810E1F5;
	Mon, 21 Feb 2022 02:36:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A756510E1F5
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 02:36:22 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id c14so10639370ioa.12
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Feb 2022 18:36:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=umQRAksOlDGR71CV/7q8w3UM9RPs0j8wImc8BhPZ9oA=;
 b=KJLkjKsWpeKB87f64N7jwNQkQPkgNoHvQVL9CRSvGJB7H719L03dMkpg4sDL5faI7p
 nlsH2ZZgeoBzt+D7Fxaou1MyQtLiMGIQGsRqG/56SPxhyHMEB2EnMMGCbvFkGQV4RSzh
 7CCpgyKJu9sZb0ibjKaNZnI6igCCAnfTZDBErywl3Lgjx+7F+kQSBjKz0s2e2cX4tamA
 or7kRxjQlfOxy5+T7rl7bvlJmUnFGLKLFLIVJ807sCAzQUiCpZF8ZVXOm04JV+PSB1WB
 wkMSXWhGJPivcuNd6Mbmfe7SdcKvJYISzxkPsLuONs4RLVe7ksRCma/Y0aKai5SOHOgU
 bdIQ==
X-Gm-Message-State: AOAM530oVbv5qZVkW1p2IraZKGvJI2gTGo5diXK6tng6qrglrZV9FHOz
 DwVXqgBi2HvFNKTw2XSfNw==
X-Google-Smtp-Source: ABdhPJw1h2mEAUBdneBklmT2HDnqcAjjIDQwaAGq4wonwL7aiRSmCIhy3XOEfVzhxs8L8TNj/DL/ig==
X-Received: by 2002:a05:6602:2dcd:b0:63e:914f:a690 with SMTP id
 l13-20020a0566022dcd00b0063e914fa690mr13988950iow.87.1645410981908; 
 Sun, 20 Feb 2022 18:36:21 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id v23sm2969814ioq.2.2022.02.20.18.36.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Feb 2022 18:36:21 -0800 (PST)
Received: (nullmailer pid 2041541 invoked by uid 1000);
 Mon, 21 Feb 2022 02:36:09 -0000
From: Rob Herring <robh@kernel.org>
To: =?utf-8?q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220218151110.11316-2-noralf@tronnes.org>
References: <20220218151110.11316-1-noralf@tronnes.org>
 <20220218151110.11316-2-noralf@tronnes.org>
Subject: Re: [PATCH v4 1/3] dt-bindings: display: add bindings for MIPI DBI
 compatible SPI panels
Date: Sun, 20 Feb 2022 20:36:09 -0600
Message-Id: <1645410969.355343.2041540.nullmailer@robh.at.kernel.org>
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
Cc: devicetree@vger.kernel.org, david@lechnology.com,
 dave.stevenson@raspberrypi.com, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, thierry.reding@gmail.com, maxime@cerno.tech,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 18 Feb 2022 16:11:08 +0100, Noralf Trønnes wrote:
> Add binding for MIPI DBI compatible SPI panels.
> 
> v4:
> - There should only be two compatible (Maxime)
> - s/panel-dbi-spi/panel-mipi-dbi-spi/in compatible
> 
> v3:
> - Move properties to Device Tree (Maxime)
> - Use contains for compatible (Maxime)
> - Add backlight property to example
> - Flesh out description
> 
> v2:
> - Fix path for panel-common.yaml
> - Use unevaluatedProperties
> - Drop properties which are in the allOf section
> - Drop model property (Rob)
> 
> Acked-by: Maxime Ripard <maxime@cerno.tech>
> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
> ---
>  .../display/panel/panel-mipi-dbi-spi.yaml     | 125 ++++++++++++++++++
>  1 file changed, 125 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.example.dt.yaml:0:0: /example-0/spi/display@0: failed to match any schema with compatible: ['sainsmart18', 'panel-mipi-dbi-spi']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1594817

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

