Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C4B47AB45
	for <lists+dri-devel@lfdr.de>; Mon, 20 Dec 2021 15:27:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C8C1112125;
	Mon, 20 Dec 2021 14:27:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9DB41120F8
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 14:27:49 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id q25so16127964oiw.0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 06:27:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=0HF1/eEs4uNXgGgZaGJCwogk1k1+OMvFCdkf2UqV7d0=;
 b=WZ97S3qmiiiCGkFTSGgl7k6a6YU00+9bbPtcS4M2GF1ct6hTUoBGSZuMQ9fcqB9y4i
 XBMdnYSDcT5LlVvDzbScIhhuuE1YlR5GtxyTJAJMSHZKcS16hVZ3V6A46nVkvN58n7LM
 K8T+CJYSjzyzOBi7udl9Wc/j3+1udWg/aPPnRYjTrrfpQIfkVTWM2xSptvHrZ7gWiuCJ
 JezpaYtq6jypjTn4g7RxebMkTnJpVrRqMUQYD9THNpTZ0uIqRQzR0br15OkAU5CwfmtX
 HpoTTnNmok7J4UeVS8PyJ1z4HoUQNbqNc9YMNsGHhaKGNgXXBWNUsTDynY/ZisHdCWvI
 fkmw==
X-Gm-Message-State: AOAM533EoV6aKz490wuw+q4xOhM7aTZCCUsXaJLtvWu18Sdn3I6a+AIy
 rc7Q7w/jEzzucHKwQs7IAg==
X-Google-Smtp-Source: ABdhPJwPZtPxdqBpHNVXFuZ1adLYUpT5JTnct7AZ2huqm1Mfpvpf7plLuN0/gFVgnqB2QKMqArVi4Q==
X-Received: by 2002:a54:4019:: with SMTP id x25mr18152692oie.116.1640010469050; 
 Mon, 20 Dec 2021 06:27:49 -0800 (PST)
Received: from robh.at.kernel.org ([12.252.7.226])
 by smtp.gmail.com with ESMTPSA id z12sm3072301oor.45.2021.12.20.06.27.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 06:27:48 -0800 (PST)
Received: (nullmailer pid 3388822 invoked by uid 1000);
 Mon, 20 Dec 2021 14:27:43 -0000
From: Rob Herring <robh@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
In-Reply-To: <20211220110630.3521121-12-s.hauer@pengutronix.de>
References: <20211220110630.3521121-1-s.hauer@pengutronix.de>
 <20211220110630.3521121-12-s.hauer@pengutronix.de>
Subject: Re: [PATCH 11/22] dt-bindings: display: rockchip: Add binding for VOP2
Date: Mon, 20 Dec 2021 08:27:43 -0600
Message-Id: <1640010463.860879.3388821.nullmailer@robh.at.kernel.org>
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
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Peter Geis <pgwipeout@gmail.com>, Andy Yan <andy.yan@rock-chips.com>,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 20 Dec 2021 12:06:19 +0100, Sascha Hauer wrote:
> The VOP2 is found on newer Rockchip SoCs like the rk3568 or the rk3566.
> The binding differs slightly from the existing VOP binding, so add a new
> binding file for it.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  .../display/rockchip/rockchip-vop2.yaml       | 146 ++++++++++++++++++
>  1 file changed, 146 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.example.dt.yaml: vop@fe040000: ports: Unevaluated properties are not allowed ('port@0', 'port@1', 'port@2' were unexpected)
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1570971

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

