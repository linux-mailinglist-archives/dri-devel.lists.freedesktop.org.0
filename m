Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3158149D50C
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 23:11:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6E9E10E487;
	Wed, 26 Jan 2022 22:11:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F290710E487
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 22:11:00 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id w133so2326246oie.7
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 14:11:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=u1H8zRHkM4TlSBs3WPMSl8FmOXRRvPSkQ8QlzX+j8Ug=;
 b=DuYst/jBNbCFT6kjDQHPK8s6LYICLc3LfzCi7wwMCc+LzC0m4UjzxyTlk1xv0iO3Fi
 qh/8akdXUGfG+vfnof4HfaSDlpbzXQECY5QaQy6utWPUaDqgdlRMs2zgCBcgO6DIswrx
 LYPsH5jkCpzPZYqvSn1gKHFdyo6vCtRzLNmagLek59yNIK8jMSv0lwAkfxoVAYVU9oqK
 ImCr8Bh8zt52NlFsUmiIwmW6cBtqQiVmZHQKh2S5MNzadz1yn2emaLZmbieiKy1Lc/2a
 UqwTXAgLaLTEpzfvzcDk9SzdcgWfglN9SHxqtovzHn305W+eqgOvO6FW5qFs911iektn
 L3Og==
X-Gm-Message-State: AOAM532vHQJSiWAp3H7lmJQD9fYhjFuDogSHBLKMmHVYwTyy6Jj1ABsM
 nA+cnB4GYhA4ZcUJTlMnzg==
X-Google-Smtp-Source: ABdhPJzRlKVnlXBnp9LIHNhl9lMVOLOxenluy535Ix5S6IlmC8DC2FgmzzOLihP7JVQPOqttxL/Ngg==
X-Received: by 2002:a05:6808:21a4:: with SMTP id
 be36mr5290595oib.85.1643235059959; 
 Wed, 26 Jan 2022 14:10:59 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id i13sm9005588otl.46.2022.01.26.14.10.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 14:10:59 -0800 (PST)
Received: (nullmailer pid 1535096 invoked by uid 1000);
 Wed, 26 Jan 2022 22:10:52 -0000
From: Rob Herring <robh@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
In-Reply-To: <20220126145549.617165-18-s.hauer@pengutronix.de>
References: <20220126145549.617165-1-s.hauer@pengutronix.de>
 <20220126145549.617165-18-s.hauer@pengutronix.de>
Subject: Re: [PATCH 17/27] dt-bindings: display: rockchip: Add binding for VOP2
Date: Wed, 26 Jan 2022 16:10:52 -0600
Message-Id: <1643235052.852354.1535095.nullmailer@robh.at.kernel.org>
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
 Peter Geis <pgwipeout@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 26 Jan 2022 15:55:39 +0100, Sascha Hauer wrote:
> The VOP2 is found on newer Rockchip SoCs like the rk3568 or the rk3566.
> The binding differs slightly from the existing VOP binding, so add a new
> binding file for it.
> 
> Changes since v3:
> - drop redundant _vop suffix from clock names
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
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.example.dt.yaml: vop@fe040000: clock-names:0: 'aclk' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.example.dt.yaml: vop@fe040000: clock-names:1: 'hclk' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1584511

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

