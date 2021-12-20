Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7276247AB41
	for <lists+dri-devel@lfdr.de>; Mon, 20 Dec 2021 15:27:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BFA710FFE5;
	Mon, 20 Dec 2021 14:27:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com
 [209.85.161.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A030610FFD5
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 14:27:46 +0000 (UTC)
Received: by mail-oo1-f49.google.com with SMTP id
 p2-20020a4adfc2000000b002c2676904fdso3091072ood.13
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 06:27:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=Y1Fcs4t+UtdLO20EaOlKh13hRPU6qA8it6kK1OWCPEY=;
 b=Xio4Wg0AwxiG1lczqNtAVm5pEL+qF+z4YxSqGkty5jRiLOVk6gSPVrDN9w0WYMn7Tn
 c+CaFT+OnE52qtO039lSYqd03f0vwcItgg4VbeWlvM6nbSeJlTfhX9U1RWgL2xSNh855
 w1DQeL42BTgkCplnp94+NzsVgnFiux8BBp4dvs5DW57t36immAD5ajPO6UwAU8DiyCw7
 d4D7Qz3zuLMEmp2bR3RJxg/bEYH0Usr2rprCLYH/h2gS9YtVSa7gqkhS47RAxUVPtwws
 JJWIwbiCMsKXm4MeJZ+ODphtXmI6N/Y6Ao4xRXnWrqFT0uJbUVZ6H4sNOvGj4JEmvaAY
 ZRKg==
X-Gm-Message-State: AOAM533nUDvXxaHMbtBCxC+hErDkZp/Z8Yx2YeSp8ZRThvJJuHhuLFHi
 555+S1G+3UdoF9yj5s/N4g==
X-Google-Smtp-Source: ABdhPJyOpmklZ25MWSq9fd1Qj1gymdAdTprfXup4FhgZ3KkOBjlSDYRAuJTWwm2JMIlitSZ80VgO3g==
X-Received: by 2002:a4a:e288:: with SMTP id k8mr10224338oot.23.1640010465884; 
 Mon, 20 Dec 2021 06:27:45 -0800 (PST)
Received: from robh.at.kernel.org ([12.252.7.226])
 by smtp.gmail.com with ESMTPSA id bq5sm3544930oib.55.2021.12.20.06.27.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 06:27:45 -0800 (PST)
Received: (nullmailer pid 3388819 invoked by uid 1000);
 Mon, 20 Dec 2021 14:27:43 -0000
From: Rob Herring <robh@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
In-Reply-To: <20211220110630.3521121-9-s.hauer@pengutronix.de>
References: <20211220110630.3521121-1-s.hauer@pengutronix.de>
 <20211220110630.3521121-9-s.hauer@pengutronix.de>
Subject: Re: [PATCH 08/22] dt-bindings: display: rockchip: dw-hdmi: use "ref"
 as clock name
Date: Mon, 20 Dec 2021 08:27:43 -0600
Message-Id: <1640010463.847707.3388818.nullmailer@robh.at.kernel.org>
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

On Mon, 20 Dec 2021 12:06:16 +0100, Sascha Hauer wrote:
> "vpll" is a misnomer. A clock input to a device should be named after
> the usage in the device, not after the clock that drives it. On the
> rk3568 the same clock is driven by the HPLL.
> To fix that, this patch renames the vpll clock to ref clock.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  .../bindings/display/rockchip/rockchip,dw-hdmi.yaml        | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml: properties:clock-names:items: 'oneOf' conditional failed, one must be fixed:
	[{}, {}, {'enum': ['cec', 'grf', 'ref']}, {'enum': ['grf', 'ref']}, {'const': ['ref']}] is not of type 'object'
	['ref'] is not of type 'string'
	from schema $id: http://devicetree.org/meta-schemas/string-array.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml: ignoring, error in schema: properties: clock-names: items
warning: no schema found in file: ./Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.example.dt.yaml:0:0: /example-0/hdmi@ff980000: failed to match any schema with compatible: ['rockchip,rk3288-dw-hdmi']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1570972

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

