Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 238DD4AF8CC
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 18:53:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8E4910E383;
	Wed,  9 Feb 2022 17:53:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9631510E383
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 17:53:02 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id t199so3240352oie.10
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 09:53:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jjLEFWIWQKYzTsSeUGIWjYdkxGer3/xMi2PwBJGGpJ0=;
 b=mMgzi9qSnQ/HlLsrgWrUef6geI7sXzN85G2WLGB0ff+roNkL/xOdeGH4rr+BnEdSnU
 HUQuw0RlEfFvro05MmrWqgWVn7KFwbpO2WcKEWLn7Ol8s0YBm9gY8Z1jWhghVbWrOZsx
 Lt1tUP8MAeqxIXEvtkEfrcNjpxtfA2AUUnqVL8eJ0rqvvVZ+SH1JwcbCVfljNuwGpKGS
 DdXRresQxUAXiJ2Wmn6YnT32oAR9YIiUMAvzmauHzVLzsVfhYN0THVVTWb7GHpyGOkm6
 Pc1czpKMT5gvUmgQH/0KgjlMfuT2GhSI9H2kN0OLz3ZZ9BaOm8tiRdChSmYLwt8e1U4X
 RUPg==
X-Gm-Message-State: AOAM532m13N+TTsEHsiIwG9anvYWxpK5JLomihLdIHSUo+XQG5xpmdbz
 oa9+/ZNkmE4BPTKWi1o9Wg==
X-Google-Smtp-Source: ABdhPJyYraVR9hcwF5D1ZdgFnfaKFpusUnkRjrgrPoeG09rhPI5ujkyyR5lkg6pf8bCg0abLwyG8DQ==
X-Received: by 2002:a05:6808:2196:: with SMTP id
 be22mr1460341oib.210.1644429181680; 
 Wed, 09 Feb 2022 09:53:01 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id n13sm7669693ooj.34.2022.02.09.09.53.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 09:53:00 -0800 (PST)
Received: (nullmailer pid 587746 invoked by uid 1000);
 Wed, 09 Feb 2022 17:52:59 -0000
Date: Wed, 9 Feb 2022 11:52:59 -0600
From: Rob Herring <robh@kernel.org>
To: Michael Riesch <michael.riesch@wolfvision.net>
Subject: Re: [PATCH v5 1/5] dt-bindings: gpu: mali-bifrost: describe clocks
 for the rk356x gpu
Message-ID: <YgP/e29ZPgBW/c05@robh.at.kernel.org>
References: <20220209085110.3588035-1-michael.riesch@wolfvision.net>
 <20220209085110.3588035-2-michael.riesch@wolfvision.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220209085110.3588035-2-michael.riesch@wolfvision.net>
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
 linux-rockchip@lists.infradead.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Peter Geis <pgwipeout@gmail.com>, Liang Chen <cl@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 09, 2022 at 09:51:06AM +0100, Michael Riesch wrote:
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
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> index 63a08f3f321d..21409c8d3813 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> @@ -159,6 +159,21 @@ allOf:
>          power-domains:
>            maxItems: 1
>          sram-supply: false
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: rockchip,rk3568-mali
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +        clock-names:
> +          items:
> +           - const: core
> +           - const: bus

Please don't invent new names. We already have 'gpu' and 'bus' defined. 
'core' and 'gpu' sound like the same thing to me, and the h/w doesn't 
have different clocks from vendor to vendor.

Rob
