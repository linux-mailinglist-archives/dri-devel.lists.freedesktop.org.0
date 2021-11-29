Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5D1462649
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 23:46:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A302B6E0DA;
	Mon, 29 Nov 2021 22:46:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A91776E0DA
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 22:46:40 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id
 w6-20020a9d77c6000000b0055e804fa524so27604292otl.3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 14:46:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vlaUIuTpfkQHFZYUbKS4f3lFAsn1jJAs7KRU7cm0X2I=;
 b=j+csvo7cUevMNO6UxiLEZTbenXpUKpcMi68r5ZcVbaYoEIvZSzRCwE/0RMC9qM0nAA
 PKi9HORMFtPuSSDXVlV0oJRRPXDRXgEhVjxWNpi1LWOIwjvRSs+fNHfEbwy2z/C44umO
 MUEtixALeEikpPd4D27EtetXNwT4+zOdFyebLXa5MirYEbxD/IeqpjFn2Cs8cOmMsfJS
 zhq4fMe2C6y2vnc43btRHibPT2z/1YGxyuM+FMnj9gGnlHWv3qZE+JyT8sOVFphrUIcS
 UJMZQwEaRqmc8V1bEYqp6eVeoZC3gtl1NGD7+HpXrRwfuYkerfmch5SJV62vn/8XxxFj
 fZRA==
X-Gm-Message-State: AOAM532MXcdnLKowsnlU1QqSsLW2RZ/f0PLUCrYjzxy8F//htdYQH0iC
 a5/E4Pk2AQs7lbjnINhL5g==
X-Google-Smtp-Source: ABdhPJwjYUv7TStIwEgfVKtax+pxEAr4orFhSvEl5ThKh76p2DPoQYSgbkr5OqmDg1XgSEO47zntGA==
X-Received: by 2002:a05:6830:1e25:: with SMTP id
 t5mr48290837otr.291.1638225999927; 
 Mon, 29 Nov 2021 14:46:39 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id q44sm2927209otv.80.2021.11.29.14.46.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 14:46:39 -0800 (PST)
Received: (nullmailer pid 750903 invoked by uid 1000);
 Mon, 29 Nov 2021 22:46:38 -0000
Date: Mon, 29 Nov 2021 16:46:38 -0600
From: Rob Herring <robh@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 04/12] drm/rockchip: dw_hdmi: add regulator support
Message-ID: <YaVYTmvCQcs892Bh@robh.at.kernel.org>
References: <20211117143347.314294-1-s.hauer@pengutronix.de>
 <20211117143347.314294-5-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211117143347.314294-5-s.hauer@pengutronix.de>
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
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Peter Geis <pgwipeout@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 17, 2021 at 03:33:39PM +0100, Sascha Hauer wrote:
> The RK3568 has HDMI_TX_AVDD0V9 and HDMI_TX_AVDD_1V8 supply inputs needed
> for the HDMI port. add support for these to the driver for boards which
> have them supplied by switchable regulators.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  .../display/rockchip/rockchip,dw-hdmi.yaml    |  6 ++

Bindings should be a separate patch. Include this as part of adding 
RK3568 support to the binding.

>  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c   | 58 ++++++++++++++++++-
>  2 files changed, 61 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
> index 53fa42479d5b7..293b2cfbf739f 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
> @@ -28,6 +28,12 @@ properties:
>    reg-io-width:
>      const: 4
>  
> +  avdd-0v9-supply:
> +    description: A 0.9V supply that powers up the SoC internal circuitry.
> +
> +  avdd-1v8-supply:
> +    description: A 0.9V supply that powers up the SoC internal circuitry.

0.9V ???

> +
>    clocks:
>      minItems: 2
>      items:
