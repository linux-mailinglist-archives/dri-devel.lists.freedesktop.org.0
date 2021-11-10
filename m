Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F6944C930
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 20:44:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6FD96E524;
	Wed, 10 Nov 2021 19:44:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DD996E524
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 19:44:25 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id
 l7-20020a0568302b0700b0055ae988dcc8so5489052otv.12
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 11:44:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=LwMY7yGoVHRADsH1iBdmXQvs2eZecM5ZTPN7Dz6EBk8=;
 b=vwCY98WDj3GM4F5tNrIsg3sYsJwYgvGqvR1ptUFNzlo2PLPl2x6+zDk8yQFqfgucuk
 5sSqqBUbJEMRnXDx3DWY2nhzb/Jw5pYhhVwRNH5KF9l1TkGpiVq1lTtPj3gx+kEF2LBI
 y1JNrpA2YGrpXq+xrxSCxk+QAJoGPDr0YulN7qgiN8Eohnjxhp337bGWRx9gZsas7BcY
 Dobam7LtdH8pr6usIPgSl7R2gR6Fv7lrcXc+fApZRno5qDDLxotegIeJ6VDonvdwtYPf
 hlLQQfDzHDmPN3UmhkVtvJNPr3CVMmFR8LlfRL3nxjZ4j8KHj48Lycr5XoKo2Ip0Rn9u
 93nA==
X-Gm-Message-State: AOAM531ehKhwQUmLIup+UfCyBTBOZWVvMX33I1LkmQ0GKlX3sL6tbNM3
 1ntMGNpMkEGj7ZwW77Mriw==
X-Google-Smtp-Source: ABdhPJwhKGD3zE5gwHgBoQy1rxHWG/g8Q1BHdfqtTlTJi1rNu2B51GVLx0DXi7o9Y8ZiTLEAs3H9uQ==
X-Received: by 2002:a9d:8e9:: with SMTP id 96mr1491465otf.192.1636573464270;
 Wed, 10 Nov 2021 11:44:24 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id t12sm169197oth.21.2021.11.10.11.44.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 11:44:23 -0800 (PST)
Received: (nullmailer pid 1783741 invoked by uid 1000);
 Wed, 10 Nov 2021 19:44:20 -0000
From: Rob Herring <robh@kernel.org>
To: Guillaume Ranquet <granquet@baylibre.com>
In-Reply-To: <20211110130623.20553-3-granquet@baylibre.com>
References: <20211110130623.20553-1-granquet@baylibre.com>
 <20211110130623.20553-3-granquet@baylibre.com>
Subject: Re: [PATCH v6 2/7] dt-bindings: mediatek, dp: Add Display Port binding
Date: Wed, 10 Nov 2021 13:44:20 -0600
Message-Id: <1636573460.915903.1783740.nullmailer@robh.at.kernel.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao shi <jitao.shi@mediatek.com>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Markus Schneider-Pargmann <msp@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 10 Nov 2021 14:06:18 +0100, Guillaume Ranquet wrote:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> This controller is present on several mediatek hardware. Currently
> mt8195 and mt8395 have this controller without a functional difference,
> so only one compatible field is added.
> 
> The controller can have two forms, as a normal display port and as an
> embedded display port.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../display/mediatek/mediatek,dp.yaml         | 87 +++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/mediatek/mediatek,dp.example.dts:20:18: fatal error: dt-bindings/power/mt8195-power.h: No such file or directory
   20 |         #include <dt-bindings/power/mt8195-power.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:385: Documentation/devicetree/bindings/display/mediatek/mediatek,dp.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1441: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1553428

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

