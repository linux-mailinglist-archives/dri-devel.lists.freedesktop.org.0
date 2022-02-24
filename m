Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9EA4C33EE
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 18:44:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05BC510E991;
	Thu, 24 Feb 2022 17:44:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE3CC10E991
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 17:44:15 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id j2so3746106oie.7
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 09:44:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=sYEc3J8zhC4BTua/moVP8jL+dOHmRDJ9+6cNZnEjbMo=;
 b=cxESHiioKaKLsa1++PejuJxnELwP4N4G0aghtFiSIWcd+7SPejdIAaWWgA2TwM4QrB
 D8PhNJ++IqNuRPONosyei9Dua7S63Poz8S3MAd6ttHJbR5THvKDG+9XbLvSRPFoJuURa
 ZnnAw//Ngia3Nm791HcoL2Rj9O3iu75po3lY7uoPNA/0KHf7Z9dOTROTp/1mTHAOhq6E
 A54W8PUsUUFv/ToAj0T3zUtkzzaY+TrWVpNDqPOP8qkKFQNAcX0enZxYVbcmIboq9VZa
 Oz1/sF55h9JyaKC2lSSuKB0tA9aInY6y9orSe0zxaJGxEU2FQQhHpuEYGvqC3Jncg8nJ
 2fRA==
X-Gm-Message-State: AOAM530WCs5uLRy9jfa57FFfKFBoBVrBQilCNemIxFB5GEhDOUzlcK9q
 XnZmWssBUZLnvLxGvhRC3A==
X-Google-Smtp-Source: ABdhPJzQ5DKFRUfqSFUZ7AFRBvDPVyRCvdQMDJU/tWT4VSDwr6TxKmwQR3Bsq6G4d4TmAUfM5gmQJw==
X-Received: by 2002:a05:6808:1495:b0:2d5:1cf2:4379 with SMTP id
 e21-20020a056808149500b002d51cf24379mr1963315oiw.230.1645724654741; 
 Thu, 24 Feb 2022 09:44:14 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 p16-20020a05680811d000b002d72ec3a921sm30847oiv.21.2022.02.24.09.44.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 09:44:13 -0800 (PST)
Received: (nullmailer pid 3297706 invoked by uid 1000);
 Thu, 24 Feb 2022 17:44:13 -0000
From: Rob Herring <robh@kernel.org>
To: =?utf-8?q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220224152708.14459-2-noralf@tronnes.org>
References: <20220224152708.14459-1-noralf@tronnes.org>
 <20220224152708.14459-2-noralf@tronnes.org>
Subject: Re: [PATCH v5 1/5] dt-bindings: display: add bindings for MIPI DBI
 compatible SPI panels
Date: Thu, 24 Feb 2022 11:44:13 -0600
Message-Id: <1645724653.137826.3297705.nullmailer@robh.at.kernel.org>
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

On Thu, 24 Feb 2022 16:27:04 +0100, Noralf Trønnes wrote:
> Add binding for MIPI DBI compatible SPI panels.
> 
> v5:
> - Add sainsmart18 to compatible items (Rob)
> - Expand write-only description (Sam)
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
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
> ---
>  .../display/panel/panel-mipi-dbi-spi.yaml     | 127 ++++++++++++++++++
>  1 file changed, 127 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml:68:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1597203

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

