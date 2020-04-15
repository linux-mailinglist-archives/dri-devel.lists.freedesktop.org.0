Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA48D1AABBF
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 17:24:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C404A6EA17;
	Wed, 15 Apr 2020 15:24:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9446E6EA17;
 Wed, 15 Apr 2020 15:24:41 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id b7so11208131oic.2;
 Wed, 15 Apr 2020 08:24:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=jhBF/0NDo7VWagdd1bbsqqHnNKZNs8SZkRbVtCJaHvo=;
 b=Wu117w9tAyHUwL5QgehtBsiidq1XchbGc6hrmhCz2fXW8ww0s5KImzrku9GE+4GyeO
 W2M3jhrjdgMHdRa/mN3MK7BKLIhyu2IQzGZIqttUnYP09hsgCpaN9EeM3x7Ofs/32Vuv
 X4h0081lcQ+yv1xJENfEzTzRTJt73UvzpmuSqdDEhwQGmwvDPZpbRrN6V6vLTWUUbFQr
 xS0LL0cPRMdwU7jBHuj2s71GUXN03OkMYOuLp+j5WVdr87kH6Lach9xcjDPtm4Fuyavj
 stXvCcny3Bx7s5TJm9dP890U67C8dO7ZTFs30EmL/PGXmj8J1sxur9oxFBO1zMDOByYa
 m21g==
X-Gm-Message-State: AGi0Pubx/7zFq+SyEnVX7Ry9M6UA2BGO7cFUsd+hByz/Yjx6Uk4exOg9
 qtXY3o2U9+Z8GyLzaVgcBA==
X-Google-Smtp-Source: APiQypK60RgLEmAsFyOZF/N+fWwAL92n4oq7mY6wF7D/JLdoeMdx6S6XMdXiReUTulsqlMeSpxJPaw==
X-Received: by 2002:aca:dd55:: with SMTP id u82mr19163342oig.27.1586964280896; 
 Wed, 15 Apr 2020 08:24:40 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w6sm402075ooa.6.2020.04.15.08.24.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 08:24:40 -0700 (PDT)
Received: (nullmailer pid 14651 invoked by uid 1000);
 Wed, 15 Apr 2020 15:24:39 -0000
Date: Wed, 15 Apr 2020 10:24:39 -0500
From: Rob Herring <robh@kernel.org>
To: Tanmay Shah <tanmay@codeaurora.org>
Subject: Re: [PATCH 1/2] dt-bindings: msm: disp: Add Display Port HPD GPIO
 bindings
Message-ID: <20200415152439.GA9882@bogus>
References: <1586299709-14222-1-git-send-email-tanmay@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1586299709-14222-1-git-send-email-tanmay@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 abhinavk@codeaurora.org, varar@codeaurora.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 07, 2020 at 03:48:28PM -0700, Tanmay Shah wrote:
> Add Display Port HPD GPIO description in bindings
> 
> This Patch depends on:
> 	https://patchwork.kernel.org/patch/11468505/

This belongs below the '---' and probably means you should send all this 
as one series.

> 
> Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml
> index 761a01d..003f5f7 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml
> @@ -155,6 +155,11 @@ properties:
>       data-lanes:
>         description: Maximum number of lanes that can be used for Display port.
>  
> +     dp-hpd-gpio:

We already have a standard property for this. Use it. 

It belongs in the connector node as HPD is part of the connector.

> +       maxItems: 1
> +       description: Specifies HPD gpio for DP connector without
> +                    USB PHY or AUX switch.
> +
>       usbplug-cc-gpio:

Note that this too should be in a connector node.

>         maxItems: 1
>         description: Specifies the usbplug orientation gpio.
> @@ -282,6 +287,8 @@ examples:
>          aux-sel-gpio = <&msmgpio 110 1>;
>          usbplug-cc-gpio = <&msmgpio 90 1>;
>  
> +        dp-hpd-gpio = <&msmgpio 117 0>;
> +
>          ports {
>              #address-cells = <1>;
>              #size-cells = <0>;
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
