Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B75753B0ABC
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 18:55:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 525B06E5CD;
	Tue, 22 Jun 2021 16:55:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FC656E7D3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 16:55:02 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id k16so20821451ios.10
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 09:55:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Nst9vbRv3atdsjiAwZVyleOKg/gFLJsFk5FhmXQlxQw=;
 b=TrNd26dJkSOVaqjiSwEfPrphK1wVhQl5Sm6ejD4/W2dwMsKTiOmXGLOrMRpifcTDJ7
 TcOajeFosdX0MD1nz/PfYniddr+/CnWHgI2N9ax9IEFEKQ3I3hTO5s6mKmGLvVjsD1gR
 iWSh8xqAY5b0VJJ8EMC+hdMvszxOsZqExrfZNt6FmYMrxbhN0k1ane1wSU5a2UdzPUNS
 SrxwP/q/MAy0IMxrjZ5kbhsMZky/df54NJFIQqtHYJ6UySJAvoB8a2LKJq46LIZZDicS
 pBfUWk9Lgu5sIYXN3LzU5ODi9SN+TJ944z46Xvbl3bOiSfQBST22ri+7mGAm2Z1Vkxaw
 E3Ag==
X-Gm-Message-State: AOAM5331vtiQKTBc7emlkdcB6PcLAOJ6ScTQpSc/GNC2X+fnnCYYkGd1
 ohZGgGls5H5B9q7wAyY7Wg==
X-Google-Smtp-Source: ABdhPJwxes1QyEmFowKSsudJkkyqhfPKqc6A8x0/51AML0FVdLusi2ElghJUf8zau5B5LBuX3hvUjQ==
X-Received: by 2002:a05:6638:12cd:: with SMTP id
 v13mr4854440jas.104.1624380900931; 
 Tue, 22 Jun 2021 09:55:00 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id g4sm2282474ilk.37.2021.06.22.09.54.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 09:55:00 -0700 (PDT)
Received: (nullmailer pid 3837213 invoked by uid 1000);
 Tue, 22 Jun 2021 16:54:56 -0000
Date: Tue, 22 Jun 2021 10:54:56 -0600
From: Rob Herring <robh@kernel.org>
To: Tomohito Esaki <etom@igel.co.jp>
Subject: Re: [PATH 3/4] dt-bindings: display: Add virtual DRM
Message-ID: <20210622165456.GA3756306@robh.at.kernel.org>
References: <20210621064403.26663-1-etom@igel.co.jp>
 <20210621064403.26663-4-etom@igel.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210621064403.26663-4-etom@igel.co.jp>
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
Cc: devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 21, 2021 at 03:44:02PM +0900, Tomohito Esaki wrote:
> Add device tree bindings documentation for virtual DRM.

DRM is a Linuxism. What's virtual DRM? Why does it need to be in DT? 
What's the usecase? You're going to need a lot more reasoning to justify 
this for DT.

> 
> Signed-off-by: Tomohito Esaki <etom@igel.co.jp>
> ---
>  .../devicetree/bindings/display/vdrm.yaml     | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/vdrm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/vdrm.yaml b/Documentation/devicetree/bindings/display/vdrm.yaml
> new file mode 100644
> index 000000000000..6493bb0fc09f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/vdrm.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/vdrm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Virtual DRM Device Tree Bindings
> +
> +description:
> +  This document defines device tree properties virtual DRM. The initial
> +  position, size and z-position of the plane used in the virtual DRM is
> +  specified.
> +  The current limitation is that these settings are applied to all crtc.
> +
> +properties:
> +  compatible:
> +    const: virt-drm
> +
> +patternProperties:
> +  "^plane(@.*)?$":
> +    description: Information of the planes used in virtual DRM
> +    type: object
> +
> +    properties:
> +      x:
> +        type: int
> +        description: x-coordinate of the left-top of the plane in pixels
> +
> +      y:
> +        type: int
> +        description: y-coordinate of the left-top of the plane in pixels
> +
> +      width:
> +        type: int
> +        description: width of the plane in pixels
> +
> +      height:
> +        type: int
> +	description: height of the plane in pixels
> +
> +      zpos:
> +        type: int
> +        description: z-position of the plane
> +
> +    required:
> +      - x
> +      - y
> +      - width
> +      - height
> +      - zpos
> +
> +required:
> +  - compatible
> +  - "^plane(@.*)?$"
> +
> +examples:
> + - |
> +   vdrm@0 {
> +       compatible = "virt-drm";
> +       plane@0 {
> +           x = <200>;
> +	   y = <100>;
> +	   width = <800>;
> +	   height = <600>;
> +	   zpos = <1>;
> +       };
> +   };
> -- 
> 2.25.1
> 
> 
