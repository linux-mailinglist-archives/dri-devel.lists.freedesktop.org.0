Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8344D871F
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 15:43:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70ABD10E618;
	Mon, 14 Mar 2022 14:43:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B85FC10E617
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 14:43:04 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id d62so18407224iog.13
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 07:43:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=hGkgQaSJozIUZNI68rSI5QT1a7TzoZpCAUHSpxilDZg=;
 b=atREk7KG1KIhOBT5xI5IifvdHIJ9FlXGrI5iM9Dk6NZKCGrNO8Vgl6H0WKcfEadAyu
 sjoxqfx+A+yv7v9NMEwHyp7UlTz54BxlJWYIT0oDdC6PTG4OamSWk5BQTNC2pVvueObS
 JLEgyvMDhfTrlOgNKRcXSU7lsjK7z6mSuhooHu5bvmGe7feWQuA53KyJQPgA+9G5DTQ0
 2B7n4upkbf0TP2NPzI8fr1seWKfLnyvDHLgU50ksZlfbktiDFkMEjOHHHegM9dzvNTju
 y9RIi6e+0CciDOpR+K34zryAjZOPzF3unn2v8Wx+LfZRDjKOMLyNNnRGXtfZvjukQvng
 VMiw==
X-Gm-Message-State: AOAM531IksSqHTTQufBh85oAKUb3nPD5fmZDpCRjOSo4WN1IC9PlX5Vm
 JeOX9z3Lc2WBRkP9UCwUcB7K9reZ0A==
X-Google-Smtp-Source: ABdhPJxYhgivZ4xYvnFQ019i20pFcHvRbZpwKauyaJmeNR7dgy2QvIq6NWVSt8MIOHsZAl6J8M5kPA==
X-Received: by 2002:a02:604f:0:b0:30f:e6f1:3883 with SMTP id
 d15-20020a02604f000000b0030fe6f13883mr20955024jaf.266.1647268982613; 
 Mon, 14 Mar 2022 07:43:02 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id
 c12-20020a056e02058c00b002c63f71c7dbsm8665092ils.56.2022.03.14.07.43.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 07:43:01 -0700 (PDT)
Received: (nullmailer pid 12509 invoked by uid 1000);
 Mon, 14 Mar 2022 14:42:49 -0000
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
In-Reply-To: <20220313123852.207257-1-marex@denx.de>
References: <20220313123852.207257-1-marex@denx.de>
Subject: Re: [PATCH 1/2] dt-bindings: display: bridge: ldb: Implement simple
 NXP i.MX8M LDB bridge
Date: Mon, 14 Mar 2022 08:42:49 -0600
Message-Id: <1647268969.328444.12508.nullmailer@robh.at.kernel.org>
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
Cc: devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
 dri-devel@lists.freedesktop.org, Robert Foss <robert.foss@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Robby Cai <robby.cai@nxp.com>,
 Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 13 Mar 2022 13:38:51 +0100, Marek Vasut wrote:
> The i.MX8MP contains two syscon registers which are responsible
> for configuring the on-SoC DPI-to-LVDS serializer. Add DT binding
> which represents this serializer as a bridge.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Robby Cai <robby.cai@nxp.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> To: dri-devel@lists.freedesktop.org
> ---
>  .../bindings/display/bridge/nxp,ldb.yaml      | 99 +++++++++++++++++++
>  1 file changed, 99 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/nxp,ldb.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/bridge/nxp,ldb.example.dt.yaml:0:0: /example-0/lvds-ldb: failed to match any schema with compatible: ['fsl,imx8mp-ldb']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1604767

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

