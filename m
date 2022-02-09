Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D11674AF55C
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 16:35:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03C938997A;
	Wed,  9 Feb 2022 15:35:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3878E8997A
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 15:35:11 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id m10so2858466oie.2
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 07:35:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=rue2p+rxxRzTcpzXBjAx6Nrna1JsJ4CzugHpoyHjtrM=;
 b=fWFTNAK5Sp6yPV3EinRPowEfzOqwQkrBbsXlP65s4bAZsAI5MXPVkGQ7WvJIvG2Qho
 GmHK9q3jJ7o90u29f1xdzvRNSWjVJB8vTiKGva7l9s1pqDBMxFZEnRfaCJIdOA42Qmy2
 GvYKdTJYu++J6CpNAAuwjJDEUXliNNIAvjR1u6BX1IgS4KtgjdUOIIhfi/szpLauNoKI
 1jLkk1Im1EbWWdn77VHZlrOIRKqf1v2bMPrmOmpf/ce1Z6DmgcO8Ok+aTIvz8YXJBg8E
 0bKs5BAEu/xKrR4iL28fbcY1SacxYAlAes6mjV6FcLl7OeCV7FU+m5OxAGVNNO3avLfw
 vYAg==
X-Gm-Message-State: AOAM530hNsXbAG1QW250RM83BzxKtEqNWKlWvkjFow6g6sv83qZh+GHP
 SysfogsM/98Cu1Bk3Tu5Sg==
X-Google-Smtp-Source: ABdhPJxWKdE43poQgnWFP4/5cT7wgQczeGULboq8vh/fIH2TWeERikdANfIAYgAS4jESe/UbnkGqnw==
X-Received: by 2002:aca:1a0f:: with SMTP id a15mr1226523oia.61.1644420910248; 
 Wed, 09 Feb 2022 07:35:10 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id m26sm6845473ooa.36.2022.02.09.07.35.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 07:35:09 -0800 (PST)
Received: (nullmailer pid 391812 invoked by uid 1000);
 Wed, 09 Feb 2022 15:35:08 -0000
From: Rob Herring <robh@kernel.org>
To: Michael Riesch <michael.riesch@wolfvision.net>
In-Reply-To: <20220209085110.3588035-2-michael.riesch@wolfvision.net>
References: <20220209085110.3588035-1-michael.riesch@wolfvision.net>
 <20220209085110.3588035-2-michael.riesch@wolfvision.net>
Subject: Re: [PATCH v5 1/5] dt-bindings: gpu: mali-bifrost: describe clocks
 for the rk356x gpu
Date: Wed, 09 Feb 2022 09:35:08 -0600
Message-Id: <1644420908.380944.391811.nullmailer@robh.at.kernel.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alex Bee <knaerzche@gmail.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Peter Geis <pgwipeout@gmail.com>, Liang Chen <cl@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 09 Feb 2022 09:51:06 +0100, Michael Riesch wrote:
> From: Alex Bee <knaerzche@gmail.com>
> 
> The Bifrost GPU in Rockchip RK356x SoCs has a core and a bus clock.
> Reflect this in the SoC specific part of the binding.
> 
> Signed-off-by: Alex Bee <knaerzche@gmail.com>
> [move the changes to the SoC section]
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> ---
>  .../devicetree/bindings/gpu/arm,mali-bifrost.yaml | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml:173:12: [warning] wrong indentation: expected 12 but found 11 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1590238

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

