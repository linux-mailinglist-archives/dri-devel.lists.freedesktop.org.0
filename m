Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C3A4E5989
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 21:05:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99A4010E092;
	Wed, 23 Mar 2022 20:05:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93C9710E092
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 20:05:43 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id e4so2797087oif.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 13:05:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gR3650OK4Kk4y8p0bJ8B5cWOD9FNq9cookGajVqOgH8=;
 b=7GZ9RE4su70TRqQoZx2wo3HI0PEp0y59sk3KUSh26b3dLgb45phrJvuHBuAvvaM7Eu
 qF9n+1oGQL53xRCyB9EUZPWrsMVG9sIBDT3ZuZ4ulsC9/VW2JTe3yD9+XyMKnzRfFQZT
 wUvUi3xGUlfRAEK61qv5q2mJ9yw7CuG/SelBcP9HIhG2TgjszwFb4iBN4LbbKlZH8Rv9
 x2m4px091gUJiH2W/eppY+/LdrrrqnX7Yxtffoztu7bgMpsSnPayTcToPeax5FoGLZee
 daXpXzQnCG7mbvt4gZrixHkmhqzsAxoc0C8bIcB1H/wBm2rQiVjdcNodhud90C6W7OTP
 EpJA==
X-Gm-Message-State: AOAM533R3fPDNsOxMtp28/aQzUgwerTe8hx4mk+PUxsRFtuyQF/z2C5X
 oM3tBMV9dW74qD/q3wf6zxKJMeED6g==
X-Google-Smtp-Source: ABdhPJytsw/Iu8lzVzWw09sb/tW8nq9AKE1yUUK4QZT1ga++TGAD+SxkJPnMP8020ukMFZCVHMpfrg==
X-Received: by 2002:a05:6808:c:b0:2ef:8913:354 with SMTP id
 u12-20020a056808000c00b002ef89130354mr3422949oic.201.1648065941050; 
 Wed, 23 Mar 2022 13:05:41 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 n128-20020a4a4086000000b0032118eda64bsm418856ooa.38.2022.03.23.13.05.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 13:05:40 -0700 (PDT)
Received: (nullmailer pid 361968 invoked by uid 1000);
 Wed, 23 Mar 2022 20:05:39 -0000
Date: Wed, 23 Mar 2022 15:05:39 -0500
From: Rob Herring <robh@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: display: renesas,du: Document
 r9a07g044l bindings
Message-ID: <Yjt9kxLDLlJSB8sd@robh.at.kernel.org>
References: <20220316131100.30685-1-biju.das.jz@bp.renesas.com>
 <20220316131100.30685-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220316131100.30685-2-biju.das.jz@bp.renesas.com>
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
Cc: devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 16 Mar 2022 13:10:54 +0000, Biju Das wrote:
> Extend the Renesas DU display bindings to support the r9a07g044l
> DU module found on RZ/G2L LCDC.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Updated commit description.
>  * Removed LCDC references
>  * Changed clock name from du.0->aclk
>  * Changed reset name from du.0->du
> RFC->v1:
>  * Changed  minItems->maxItems for renesas,vsps.
> RFC:
>  https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220112174612.10773-18-biju.das.jz@bp.renesas.com/
> ---
>  .../bindings/display/renesas,du.yaml          | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
