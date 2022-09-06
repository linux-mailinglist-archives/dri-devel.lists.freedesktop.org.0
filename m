Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABF75ADD55
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 04:30:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5759310E228;
	Tue,  6 Sep 2022 02:30:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B538510E228
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 02:30:01 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id
 t8-20020a9d5908000000b0063b41908168so7223229oth.8
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 19:30:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=message-id:date:subject:references:in-reply-to:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date;
 bh=62aXNAbn2VJJU9bSVwGuWx0YLMR84OQttybG88JiBOs=;
 b=2R3u6XKr0xb33CDAq55TU6UVwLrUDwCUVOzUKuBIijIMhkuBtjDjjTJYrNzUMRbg2t
 MbcjkYZJ4WCbqRrBfjvjnstanZHH2npfHtPQ+jDP/YOnCcXKCNy6LlqiySjfluaa+bNn
 F1SfaKqTqZV5+YBtV0kjKffqeZZRF3vEonmpHrFj6gr8fcHSvYHAmSlesKaBBpL8Ejag
 0d8fNvtr1y7AibNEJNhGNdRHee7GeOFLdktSWeg5DUqeX4HJktKFxWQQw1R4NetQpzQk
 n90Xm+uKHk/vCxOwiMfloMlBTo0B4hSBh/5zqS74gECddKoqcydJXBe8Gc3pKGEJLdgM
 J/SA==
X-Gm-Message-State: ACgBeo0w0xLrXBFyMf58/kosVu/Whw0vDsytoQueyYkut/iMyvNYjm1w
 jDqw8eHB3KnzUEd54Qn4cQ==
X-Google-Smtp-Source: AA6agR4MAOUUpkDCrbdyOjhtwgxGL7uIHYDE+QmdBjiX5nPXz0w3Jz7VEKY6TdkBgbb60EYww7KImA==
X-Received: by 2002:a05:6830:24b7:b0:636:ef3f:86c with SMTP id
 v23-20020a05683024b700b00636ef3f086cmr20334163ots.145.1662431400934; 
 Mon, 05 Sep 2022 19:30:00 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 128-20020aca0686000000b003442d74e8a5sm4884656oig.45.2022.09.05.19.29.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 19:30:00 -0700 (PDT)
Received: (nullmailer pid 3334461 invoked by uid 1000);
 Tue, 06 Sep 2022 02:29:58 -0000
From: Rob Herring <robh@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
In-Reply-To: <20220905163300.391692-3-thierry.reding@gmail.com>
References: <20220905163300.391692-1-thierry.reding@gmail.com>
 <20220905163300.391692-3-thierry.reding@gmail.com>
Subject: Re: [PATCH 2/6] dt-bindings: reserved-memory: Support framebuffer
 reserved memory
Date: Mon, 05 Sep 2022 21:29:58 -0500
Message-Id: <1662431398.296852.3334460.nullmailer@robh.at.kernel.org>
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
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>,
 linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 05 Sep 2022 18:32:56 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Document the "framebuffer" compatible string for reserved memory nodes
> to annotate reserved memory regions used for framebuffer carveouts.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../bindings/reserved-memory/framebuffer.yaml | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reserved-memory/framebuffer.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/reserved-memory/framebuffer.example.dts:18.16-23.11: Warning (chosen_node_is_root): /example-0/chosen: chosen node must be at root node

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

