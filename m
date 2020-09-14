Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9162698D4
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 00:31:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40A046E7D7;
	Mon, 14 Sep 2020 22:31:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BDC76E7D7;
 Mon, 14 Sep 2020 22:31:34 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id d190so1937861iof.3;
 Mon, 14 Sep 2020 15:31:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/pD/h9E35swAdheWUiJTW2U8mtD3mvR4TbFwObgRqNQ=;
 b=MnxgaQHu0T86ocDDXOR6jRMJRLD4ofiyzPkcr/dEiM80b7hhAURGmjnKIC2XSE9Twk
 XMpkpcztBAryujOtAKz17krr8QqelVtIvCmmtkOy71nfrwwlt/k0Yws5U8hKuY/YM3s9
 C+RsUClSTx5X1gBU8lJNwNhOIB2rVQRrxFTF3XG22h1l/1zkuqSKKo6RcPB7YO94wfHd
 3yW0OIwC+q88vkSmmHonJ9FiRsrsmU1NdgFK78a1pbJEqje5eZNqgNPIRQojTD8Jo6E2
 4i2IBzlBWkasASJBzDuCCan8hlaieVmqk/d0rjWLrJ2HPIenYtxQjmgVfd690dWRj/oi
 T0mQ==
X-Gm-Message-State: AOAM531Ml7/tUd65i96XfaiDfrNeq07roW/wAxENyc0JgyYgsOw6welY
 iWB6kFbqW8uIN5WOhRfNUA==
X-Google-Smtp-Source: ABdhPJxo23QcjWKVaJTELcfH6zvKBCo6gLwUuumBxvcGYu10LcMbvle/m6Ht8hvnRhQrVk6QQijdPw==
X-Received: by 2002:a02:6043:: with SMTP id d3mr15339291jaf.122.1600122694328; 
 Mon, 14 Sep 2020 15:31:34 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id z10sm6559662ioi.13.2020.09.14.15.31.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 15:31:33 -0700 (PDT)
Received: (nullmailer pid 383796 invoked by uid 1000);
 Mon, 14 Sep 2020 22:31:32 -0000
Date: Mon, 14 Sep 2020 16:31:32 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 02/13] dt-bindings: display: bridge: nwl-dsi: Add common
 properties
Message-ID: <20200914223132.GA383744@bogus>
References: <20200904145312.10960-1-krzk@kernel.org>
 <20200904145312.10960-3-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200904145312.10960-3-krzk@kernel.org>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Robert Chiras <robert.chiras@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 04 Sep 2020 16:53:01 +0200, Krzysztof Kozlowski wrote:
> Add common properties appearing in DTSes (assigned-clocks and others) to
> fix dtbs_check warnings like:
> 
>   arch/arm64/boot/dts/freescale/imx8mq-evk.dt.yaml: mipi-dsi@30a00000:
>     'assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' do not match any of the regexes: '^panel@[0-9]+$', 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Applied, thanks!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
