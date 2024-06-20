Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 485DB910DF7
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 19:03:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E63210EB68;
	Thu, 20 Jun 2024 17:03:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.b="DvXoN3df";
	dkim=permerror (0-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b="kBoXqgO+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay5-1.pub.mailoutpod3-cph3.one.com
 (mailrelay5-1.pub.mailoutpod3-cph3.one.com [46.30.211.244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A4B710E2B0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 17:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=yODHSliSOdGvA36YUaNQLn6aeqU+d5cX1WV7EBvEMn0=;
 b=DvXoN3dfA1Q4PpiiQ5J2PL6TL4TX2iC/Lga8K4MuQdXfR7EpesohBdET5luJpKAQ2xtpnyFotvVv9
 P0FU+s57as3ta7D05P1nxkaP+4+NmvJ0hyxHciDHnkyiKGevdUheqFoP2UWuDe2zCaQnCIbz6TJ96/
 rCJc2xeiWZ//NAXoWHYxWYiTwRl2KENsPC51ZJil0ldHYPrs2f7AltkZIpl0Ls8eLgR1kw2yD1NQV8
 nL9D4u46O9c5OBXKTk4NZozucixTJfmbN7TxaUQSbpiFwZWJ6KxO2TOCKszxAZp8tDHr+NQugYw7wj
 U08kZKESyI1T/6L5+44yvxmmw5KzZ7g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=yODHSliSOdGvA36YUaNQLn6aeqU+d5cX1WV7EBvEMn0=;
 b=kBoXqgO+DJM2gDv+5KYqjxCK+4GTkIY8bkN8a+y+PWgLxzqqK1xBmvPmk0mSxdpx1Lv/AcfGAFLRx
 1N+Rh0ZDQ==
X-HalOne-ID: e22047f2-2f26-11ef-bd94-e973630cf47d
Received: from ravnborg.org (2-105-16-150-cable.dk.customer.tdc.net
 [2.105.16.150])
 by mailrelay5.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
 id e22047f2-2f26-11ef-bd94-e973630cf47d;
 Thu, 20 Jun 2024 17:02:34 +0000 (UTC)
Date: Thu, 20 Jun 2024 19:02:33 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Hari.PrasathGE@microchip.com, Dharma.B@microchip.com,
 bbrezillon@kernel.org, nicolas.ferre@microchip.com
Subject: Re: [PATCH] MAINTAINERS: update Microchip's Atmel-HLCDC driver
 maintainers
Message-ID: <20240620170233.GA1091389@ravnborg.org>
References: <20240620095856.777390-1-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240620095856.777390-1-manikandan.m@microchip.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Manikandan and Dharma.

On Thu, Jun 20, 2024 at 03:28:56PM +0530, Manikandan Muralidharan wrote:
> Drop Sam Ravnborg and Boris Brezillon as they are no longer interested in
> maintaining the drivers. Add myself and Dharma Balasubiramani as the
> Maintainer and co-maintainer for Microchip's Atmel-HLCDC driver.
> Thanks for their work.

Glad you are picking up the ball, good luck and happy hacking!
Acked-by: Sam Ravnborg <sam@ravnborg.org>

Unless you beat me to it I will get the patch applied in a few days.

	Sam


> 
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
>  MAINTAINERS | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d1566c647a50..8f2a40285544 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7290,8 +7290,8 @@ F:	drivers/gpu/drm/ci/xfails/meson*
>  F:	drivers/gpu/drm/meson/
>  
>  DRM DRIVERS FOR ATMEL HLCDC
> -M:	Sam Ravnborg <sam@ravnborg.org>
> -M:	Boris Brezillon <bbrezillon@kernel.org>
> +M:	Manikandan Muralidharan <manikandan.m@microchip.com>
> +M:	Dharma Balasubiramani <dharma.b@microchip.com>
>  L:	dri-devel@lists.freedesktop.org
>  S:	Supported
>  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> -- 
> 2.25.1
