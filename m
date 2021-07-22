Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 338D83D1BC5
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 04:29:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B6336E9BC;
	Thu, 22 Jul 2021 02:29:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D36B6E9BC
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 02:29:51 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id k11so4668918ioa.5
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 19:29:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Vbm9yduWjMJY5Qu5YDirMHSu1+ek7W9mcXgmGCm0CPU=;
 b=Q5sJQgSXXwMtDXuOHxaxlZ4gKpqbq0yUt8qDw1A8yeJFTlVUME3Qbl3sgKstay8YN1
 QMTx5Vm6di3tQX0nLk9j4pffT9nrG2t81qv5v9UpYPb1RWmtBfUpzh9aRw4eNBBXkD55
 xqWoWeuUh5MoY40T/SarI/i3zHnEiaOgzuvzPJavNgZhvdHpzhbIEKQ3Hw1EiwwJ+HRZ
 gmC2D/fzMaxNWHmeil/qXyQdJTY8yDS800X0zhvYVgJY53mGJYUUf1ayQADiXunTRqAE
 N9t1YC9ykYLctymPszALB5LHLtZckIB5ef/qnt3rw9JjIIxC169/2ErvaxGf/3ZGXuwd
 Nklw==
X-Gm-Message-State: AOAM5319ZekBTrWD/6XFLDUEuPFWJ730f/f6+Ad/XGbxNZVNRZmSqmvY
 j7/eRM65SCvMu2yLKTeZEw==
X-Google-Smtp-Source: ABdhPJzKaG8Ei8yk6jblQllxcE3R6XvpisIpEnt3aFcCAx4LPObvRjHA51fMIi6L9FSCHTmaPWwQUA==
X-Received: by 2002:a02:aa15:: with SMTP id r21mr10880858jam.37.1626920990785; 
 Wed, 21 Jul 2021 19:29:50 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id b8sm13978039ilh.74.2021.07.21.19.29.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 19:29:50 -0700 (PDT)
Received: (nullmailer pid 3172014 invoked by uid 1000);
 Thu, 22 Jul 2021 02:29:47 -0000
Date: Wed, 21 Jul 2021 20:29:47 -0600
From: Rob Herring <robh@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 10/54] dt-bindings: display: panel-lvds: Document panel
 compatibles
Message-ID: <20210722022947.GA3168293@robh.at.kernel.org>
References: <20210721140424.725744-1-maxime@cerno.tech>
 <20210721140424.725744-11-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210721140424.725744-11-maxime@cerno.tech>
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>, linux-sunxi@googlegroups.com,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 21, 2021 at 04:03:40PM +0200, Maxime Ripard wrote:
> The binding mentions that all the drivers using that driver must use a
> vendor-specific compatible but never enforces it, nor documents the
> vendor-specific compatibles.
> 
> Let's make we document all of them, and that the binding will create an
> error if we add one that isn't.
> 
> Cc: dri-devel@lists.freedesktop.org
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  .../bindings/display/panel/lvds.yaml           | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/lvds.yaml b/Documentation/devicetree/bindings/display/panel/lvds.yaml
> index 49460c9dceea..d1513111eb48 100644
> --- a/Documentation/devicetree/bindings/display/panel/lvds.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/lvds.yaml
> @@ -31,12 +31,18 @@ allOf:
>  
>  properties:
>    compatible:
> -    contains:
> -      const: panel-lvds
> -    description:
> -      Shall contain "panel-lvds" in addition to a mandatory panel-specific
> -      compatible string defined in individual panel bindings. The "panel-lvds"
> -      value shall never be used on its own.
> +    items:
> +      - enum:
> +          - advantech,idk-1110wr

At least this one is documented elsewhere. You can add 'minItems: 2' if 
you want to just enforce having 2 compatibles. Or do:

items:
  - {}
  - const: panel-lvds

Which also enforces the order.

> +          - advantech,idk-2121wr
> +          - auo,b101ew05
> +          - innolux,ee101ia-01d
> +          - mitsubishi,aa104xd12
> +          - mitsubishi,aa121td01
> +          - sgd,gktw70sdae4se
> +          - sharp,lq150x1lg11
> +          - tbs,a711-panel
> +      - const: panel-lvds
>  
>    data-mapping:
>      enum:
> -- 
> 2.31.1
> 
> 
