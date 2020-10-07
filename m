Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAA5286293
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 17:50:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 003CE6E0DC;
	Wed,  7 Oct 2020 15:50:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CCF36E0DC
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 15:50:18 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id 26so2931909ois.5
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Oct 2020 08:50:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=D5KWBh7Ei3kmnrVZuM450juFCzki8BlotX/BN8/qul0=;
 b=Prd4Zz7SdPG5vyq4BxKUaS8ja8YMik06yON+FELPlNs/oZW+2Nh2LXHpoJ2dIJATwY
 wWHRNc02Ee183qIhTdx06UC7KY1ekpW7+TNbXQ37iThmu+oAjTrsnTDTJnGsruAeWuWk
 hwbHe1pqMomOMTA7zHVQyjQ32BTJq4+GsTTthWFvdZBrzZxKtP/Be/2N+vMECa8fmyaT
 0pjEUbBLHI20GK0qrvCwqeZBZm7LgsNBOGB7Leq8sGMRIcysmAZLlmTdgttUV0dCUeXS
 zitTnsA/ccfTNbFFKAnLP5UfiYwlrMxuwTis0OIgZmYw+qq+wLq639IBVU2wf0YIiBUW
 Vmlw==
X-Gm-Message-State: AOAM5316JP0E4skfKSMs/xCrEFLCZsB3zYdYdDvxGhYDK79KKia6A7/M
 ucsZMO4MmhPB6ZDtBuHMiQ==
X-Google-Smtp-Source: ABdhPJyl7BipVAGLelkc9Q7hU5yKjIoyNaSSYdipMgfJ93hqu78A/Bx52m6isWRUHb4rHFet/6YLQg==
X-Received: by 2002:aca:30d4:: with SMTP id w203mr2197032oiw.64.1602085817319; 
 Wed, 07 Oct 2020 08:50:17 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id j75sm2175630oih.10.2020.10.07.08.50.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 08:50:16 -0700 (PDT)
Received: (nullmailer pid 283939 invoked by uid 1000);
 Wed, 07 Oct 2020 15:50:15 -0000
Date: Wed, 7 Oct 2020 10:50:15 -0500
From: Rob Herring <robh@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH RESEND v3 2/6] dt-bindings: display: sun4i: Add LVDS
 Dual-Link property
Message-ID: <20201007155015.GA281983@bogus>
References: <cover.6cdb798a6b393c8faa9c1297bbdfb8db81238141.1601910923.git-series.maxime@cerno.tech>
 <2bc93c7c1d3121730239a01dda9c30dcf4e353b0.1601910923.git-series.maxime@cerno.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2bc93c7c1d3121730239a01dda9c30dcf4e353b0.1601910923.git-series.maxime@cerno.tech>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Chen-Yu Tsai <wens@csie.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 05, 2020 at 05:15:40PM +0200, Maxime Ripard wrote:
> The Allwinner SoCs with two TCONs and LVDS output can use both to drive an
> LVDS dual-link. Add a new property to express that link between these two
> TCONs.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
> index e5344c4ae226..ce407f5466a5 100644
> --- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
> +++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
> @@ -115,6 +115,12 @@ properties:
>          - const: edp
>          - const: lvds
>  
> +  allwinner,lvds-companion:

We already have 1 vendor property for this. How about 'link-companion' 
for something common.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
