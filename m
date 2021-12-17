Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF57647970B
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 23:25:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B3E310E591;
	Fri, 17 Dec 2021 22:25:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F56110E591
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 22:25:12 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id bj13so5721320oib.4
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 14:25:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=U9aFf023EtS7bYXuPYeb5jcWZtC9rXcMEmjg022T/GI=;
 b=3npSOp/bcAnJxu+O4oYHrklg0sdk1Fzale8oUDBpLYdlzidJMgGD5j+O3qC284BhQ0
 LFWdPJA3TyPkbDVed1IY6oPKhAGYFslgV7R0nfZuQUaa43ghEr+ectIxawffY7j5ix4b
 mOnOeDsDAAyb3EupmgTDdtdduvU3F93oponQ11oZxZM8NfION8Ijf3X1lDCNi5nb0+BH
 hKoQtYKKj3+vvFSWE0iy5/36u0sEmwZ2ldGTPAykGaJVa7NH+/wIMR2zNzc66+7ceDHG
 JUfdCPTFuGqONQEzfnVP85derrJtMxNtCKy17/Nko7v8TZm3oAsxLq9fjStpj6WsXi0s
 1mWQ==
X-Gm-Message-State: AOAM530mCxIjpEKfFnJD3Hve9KUdZtCSRroJwlx4yJe6XmeAc+7f+1GC
 fmVELSsC67hTY3LdWUWn8A==
X-Google-Smtp-Source: ABdhPJwLzRcCLzNUvJFhPi5MNnKwuPTUbgZzGPSNDn7nPA1/EtvNX7X/MV8AtNV28hgMlRxOVmyVvA==
X-Received: by 2002:a05:6808:124d:: with SMTP id
 o13mr3929342oiv.91.1639779911700; 
 Fri, 17 Dec 2021 14:25:11 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id e4sm1897343oiy.12.2021.12.17.14.25.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 14:25:10 -0800 (PST)
Received: (nullmailer pid 3686969 invoked by uid 1000);
 Fri, 17 Dec 2021 22:25:06 -0000
From: Rob Herring <robh@kernel.org>
To: Guillaume Ranquet <granquet@baylibre.com>
In-Reply-To: <20211217150854.2081-3-granquet@baylibre.com>
References: <20211217150854.2081-1-granquet@baylibre.com>
 <20211217150854.2081-3-granquet@baylibre.com>
Subject: Re: [PATCH v7 2/8] dt-bindings: mediatek, dp: Add Display Port binding
Date: Fri, 17 Dec 2021 16:25:06 -0600
Message-Id: <1639779906.584489.3686968.nullmailer@robh.at.kernel.org>
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
 Markus Schneider-Pargmann <msp@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 17 Dec 2021 16:08:48 +0100, Guillaume Ranquet wrote:
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
make[1]: *** [scripts/Makefile.lib:373: Documentation/devicetree/bindings/display/mediatek/mediatek,dp.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1413: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1570103

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

