Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA47163319
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2020 21:31:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E006D6EA87;
	Tue, 18 Feb 2020 20:31:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A20E6EA85
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 20:31:54 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id d62so21445180oia.11
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 12:31:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=J/VxJ3xiwdS6/BWNfUPWpgIlaLG5DINnCPtjKZgxKdM=;
 b=mvOHIWy746hFi/efZxjLgS4LBFo/6Bd2CTeHVq/BfaxqQAazjwwsIgQ6EsTlHaAw1C
 ccC9M9HBQEbebSc5/G8wLj+7hGMCRTpknLnqDQAIbAKXr5ztV1iwhwtd3Jg1ncom2dPb
 jLjJft4nB7YuYtR0+zz3OE4caNruSMHxvYxmbhl5fhr3/tk7Br8s1VEkJBps98b+gzmG
 48Pj1+M9LkJRBMHEgwZbznHRkp+m48Q4wNUJ3BHeAKciYtzkLjh9M3O02VQM7HnrkSul
 JZR1xIUQIodXw/Ed/4GgxBjjK9DUfQVwKGpRK7IEK5ptykl7MTteQb/ZLoEBo46m4QMJ
 eAMQ==
X-Gm-Message-State: APjAAAXTtfcaZKrZt/iEiz1DCqWWgRs8nk+VUb1IiR00iie5UZbpR4ej
 wCPXPV7IhtOR5/CGvj6Usg==
X-Google-Smtp-Source: APXvYqz4+tMO0xRMFlD+Nj7EMFcqW+z3eblcWmDWok4aK303S3lbrgXPLQt5ovOmoCv1EkypuhWhDA==
X-Received: by 2002:aca:af50:: with SMTP id y77mr2515745oie.8.1582057913671;
 Tue, 18 Feb 2020 12:31:53 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id y25sm1716518oto.27.2020.02.18.12.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 12:31:52 -0800 (PST)
Received: (nullmailer pid 19094 invoked by uid 1000);
 Tue, 18 Feb 2020 20:31:51 -0000
Date: Tue, 18 Feb 2020 14:31:51 -0600
From: Rob Herring <robh@kernel.org>
To: matthias.bgg@kernel.org
Subject: Re: [PATCH v7 02/13] dt-bindings: display: mediatek: Add mmsys
 binding description
Message-ID: <20200218203151.GA15948@bogus>
References: <20200213201953.15268-1-matthias.bgg@kernel.org>
 <20200213201953.15268-3-matthias.bgg@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200213201953.15268-3-matthias.bgg@kernel.org>
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
Cc: mark.rutland@arm.com, airlied@linux.ie, mturquette@baylibre.com,
 dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com,
 ulrich.hecht+renesas@gmail.com, linux-clk@vger.kernel.org,
 drinkcat@chromium.org, wens@csie.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, frank-w@public-files.de, sean.wang@mediatek.com,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Matthias Brugger <mbrugger@suse.com>,
 sboyd@kernel.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 enric.balletbo@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 13, 2020 at 09:19:42PM +0100, matthias.bgg@kernel.org wrote:
> From: Matthias Brugger <mbrugger@suse.com>
> 
> The MediaTek DRM has a block called mmsys, which sets
> the routing and enables the different blocks.
> This patch adds one line for the mmsys bindings description and changes
> the mmsys description to use the generic form of referring to a specific
> Soc.
> 
> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> 
> ---
> 
> Changes in v7:
> - add hint to the mmsys binding document
> - make mmsys description generic
> - fix typo in commit message
> 
> Changes in v6: None
> Changes in v5: None
> Changes in v4: None
> Changes in v3: None
> Changes in v2: None
> 
>  .../bindings/display/mediatek/mediatek,disp.txt          | 3 +++
>  .../bindings/display/mediatek/mediatek,mmsys.txt         | 9 +--------
>  2 files changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> index b91e709db7a4..8e453026ef78 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> @@ -24,6 +24,7 @@ connected to.
>  For a description of the display interface sink function blocks, see
>  Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt and
>  Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt.
> +Documentation/devicetree/bindings/display/mediatek/mediatek,mmsys.txt.
>  
>  Required properties (all function blocks):
>  - compatible: "mediatek,<chip>-disp-<function>", one of
> @@ -43,7 +44,9 @@ Required properties (all function blocks):
>  	"mediatek,<chip>-dpi"        		- DPI controller, see mediatek,dpi.txt
>  	"mediatek,<chip>-disp-mutex" 		- display mutex
>  	"mediatek,<chip>-disp-od"    		- overdrive
> +	"mediatek,<chip>-mmsys", "syscon"	- provide clocks and components management
>    the supported chips are mt2701, mt2712 and mt8173.
> +
>  - reg: Physical base address and length of the function block register space
>  - interrupts: The interrupt signal from the function block (required, except for
>    merge and split function blocks).
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mmsys.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,mmsys.txt
> index 301eefbe1618..7bbadee820e3 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,mmsys.txt
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mmsys.txt
> @@ -5,14 +5,7 @@ The Mediatek mmsys controller provides various clocks to the system.
>  
>  Required Properties:
>  
> -- compatible: Should be one of:
> -	- "mediatek,mt2701-mmsys", "syscon"
> -	- "mediatek,mt2712-mmsys", "syscon"
> -	- "mediatek,mt6779-mmsys", "syscon"
> -	- "mediatek,mt6797-mmsys", "syscon"
> -	- "mediatek,mt7623-mmsys", "mediatek,mt2701-mmsys", "syscon"

You've lost this information about the fallback...

> -	- "mediatek,mt8173-mmsys", "syscon"
> -	- "mediatek,mt8183-mmsys", "syscon"
> +- compatible: "mediatek,<chip>-mmsys"

You are just going to have to add these all back when this is converted 
to schema.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
