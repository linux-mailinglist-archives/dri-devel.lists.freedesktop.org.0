Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A376C2DB12B
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 17:21:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 531686E3FE;
	Tue, 15 Dec 2020 16:20:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9309E6E3FE
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 16:20:57 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id 11so19902053oty.9
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 08:20:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=34KtQrwQPQdUruOS7IGSVnCyYoZ5bhkan6tsIdf2DjA=;
 b=I8dQz1bw62hmuG85VfpZ9Uo1GfVQCC54lAiuvvc0OoN0q+8GdgD/pv1kfj7Zl3BS2O
 FhCv2lAN0Fahhy0v4fyvAFY3r1NE6GDmYRHS8/M7BE/qrqK2HNwImRwbjNxwNj0EyKnH
 q+Nw8vN7hz20WUQd1g8kJ7fqJSY5+/eYv1L5hREd3OKtNEYUvWlLe7AqDRxAE8OFtC7w
 oSl+uXc6i24lehCmggiEh4T4cXqbMHrZfCVqeitbWDgYkYK9CBjx1SVGXIsOp2jPz/RD
 +0n12co453kzyJKRgimeq930s3GCkAoHSGhFE1CXS1nh8BiOE8IvfuUFPRnDH/DkNwXG
 keOA==
X-Gm-Message-State: AOAM532YR1pQ0Aa1rVfDfWVCeJuPmrzUj4r6EAWGYPGdQ5kbkXK+QBMs
 D45h7p2gFaAnFByFgQs1uQ==
X-Google-Smtp-Source: ABdhPJyfBYjhmmyDBWsWA9jqIzDpzF3wFmtV6wV/5vM6bJ5lRmDO0ZaiwF6fL3eFbbxqacgg+LoBPw==
X-Received: by 2002:a9d:2941:: with SMTP id d59mr16101017otb.232.1608049256919; 
 Tue, 15 Dec 2020 08:20:56 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id i24sm4783779oot.42.2020.12.15.08.20.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 08:20:56 -0800 (PST)
Received: (nullmailer pid 3962283 invoked by uid 1000);
 Tue, 15 Dec 2020 16:20:55 -0000
Date: Tue, 15 Dec 2020 10:20:55 -0600
From: Rob Herring <robh@kernel.org>
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Subject: Re: [PATCH v2, 01/17] dt-bindings: mediatek: add description for
 postmask
Message-ID: <20201215162055.GA3958446@robh.at.kernel.org>
References: <1607746317-4696-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607746317-4696-2-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1607746317-4696-2-git-send-email-yongqiang.niu@mediatek.com>
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
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Dec 12, 2020 at 12:11:41PM +0800, Yongqiang Niu wrote:
> add description for postmask
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> index 5ca693a..1972fa7 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> @@ -37,6 +37,7 @@ Required properties (all function blocks):
>  	"mediatek,<chip>-disp-aal"   		- adaptive ambient light controller
>  	"mediatek,<chip>-disp-gamma" 		- gamma correction
>  	"mediatek,<chip>-disp-merge" 		- merge streams from two RDMA sources
> +	"mediatek,<chip>-disp-postmask" 	- post mask

Needs a better explanation. What's the type? Constraints on the values?

>  	"mediatek,<chip>-disp-split" 		- split stream to two encoders
>  	"mediatek,<chip>-disp-ufoe"  		- data compression engine
>  	"mediatek,<chip>-dsi"        		- DSI controller, see mediatek,dsi.txt
> -- 
> 1.8.1.1.dirty
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
