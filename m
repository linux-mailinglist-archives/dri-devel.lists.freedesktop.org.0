Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BE765277E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 21:01:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0755C10E3E3;
	Tue, 20 Dec 2022 20:00:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com
 [209.85.160.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77F2A10E3E3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 20:00:57 +0000 (UTC)
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-1445ca00781so16766083fac.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 12:00:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m7rQADosS+b3+803ppmC4G5l6lsD7QIny2Q7opGqliM=;
 b=eSBKSXHLqrar23DW+ZrhjllUE70Fb0CUBKJ31ou8twPMBazT2dchjd1A1HwM6thTVp
 FM5IQx6xg2tQ0rmMfP4x2rGqR3h2YL2Q8Xa53YB1XS0CEFFBZLxe6hlMo0VO9HUd2pZN
 uIh7pPx+XJK9jSRQX7VkzemetDg+FJWY2P76kmprAqiKXXyZurO+HUx7B7d2bN8hBMDM
 MpdBeiAXkGBsg1mM5hZS61wrQVKmiWxpyx7ZmkUGyUXvMXCz0QI0WPXjEh+QlEwbgeeX
 72v7Grhew9at1k3ncYEG3lHTvahHb48NpbWliNPfB9MW8rORoK/PEI2dMX7N13OFAQZ1
 4JBw==
X-Gm-Message-State: AFqh2kr+T/sLeGJ6UjhU6Pzmh13WI26i8k1XK5nVWXU2UnGhRbpTZdl6
 Jt+Fqc8giMdnFdYMgR6kng==
X-Google-Smtp-Source: AMrXdXt9sEtEqgQZhotj9V3mZGPtA+Z0Jj7vkU5jn2um2dvY3ioakyoO6JU+NnthNj+8BzLMwIRf8g==
X-Received: by 2002:a05:6870:c991:b0:148:500d:c6fb with SMTP id
 hi17-20020a056870c99100b00148500dc6fbmr7635185oab.38.1671566456641; 
 Tue, 20 Dec 2022 12:00:56 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 y29-20020a056870459d00b0011d02a3fa63sm6504888oao.14.2022.12.20.12.00.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 12:00:55 -0800 (PST)
Received: (nullmailer pid 990414 invoked by uid 1000);
 Tue, 20 Dec 2022 20:00:54 -0000
Date: Tue, 20 Dec 2022 14:00:54 -0600
From: Rob Herring <robh@kernel.org>
To: Johan Jonker <jbx6244@gmail.com>
Subject: Re: [PATCH v4 3/5] dt-bindings: phy: add port node to
 phy-rockchip-inno-usb2.yaml
Message-ID: <20221220200054.GA953433-robh@kernel.org>
References: <7f38e245-4fc0-1754-e75c-10c1e31bbd4d@gmail.com>
 <e54f7b52-3530-59c4-90c6-1fb5a17d6491@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e54f7b52-3530-59c4-90c6-1fb5a17d6491@gmail.com>
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
Cc: kishon@kernel.org, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, vkoul@kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 19, 2022 at 05:56:55PM +0100, Johan Jonker wrote:
> On Rockchip rk3399 a port node with one endpoint can be connected
> to a USB Type-C connector node.
> Add a port node to the phy-rockchip-inno-usb2.yaml file.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  .../devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml      | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml
> index f71920082..ffc7e7560 100644
> --- a/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml
> +++ b/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml
> @@ -115,6 +115,11 @@ properties:
>      required:
>        - "#phy-cells"
> 
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description:
> +      Port node with one endpoint connected to a USB Type-C connector node.
> +

This doesn't make sense. First, this phy has an otg and host phy, so 
which one is it? Second, the USB connector graph is supposed to be 
connected to the USB controllers, not a phy.

But I guess we already have this in use, so I guess just mark it 
deprecated to discourage more usage..

Rob
