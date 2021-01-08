Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B430A2EFF3B
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jan 2021 12:47:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A04076E93D;
	Sat,  9 Jan 2021 11:46:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C429F6E7D4
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 09:24:01 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id A9B541B8A;
 Fri,  8 Jan 2021 04:23:58 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 08 Jan 2021 04:23:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm1; bh=X
 ezxI66DVa2Vq2r2ORvKcDbZ2d0VwNOxit/rB2l+Gz4=; b=YeDSvLPSfPk2KDSry
 56D9e3nPmG0SfXc9ycjD8RANjOdCA9Gp91uLJb/LW4liUxPWYglivzeD33p4pGmK
 3bWwx0ixNJY8gopJ4dU5Ev1pR/KMqFWbCTac5vpb52JgJMfLFzc3oJQ2znQJ+JnI
 Sei9svkAru7Ulv/5KpjOp1JOsXsmpLnhscUSXdoDcdm/n8VpVBVfrj+E5f4b/ltn
 mH7WoRwghSrbkoZn48HUN4snADUNR+QtrtktIiDXFV+IPNXSiH26hqGbzjFjsSku
 fA6P59BHFxc278y2gIh+6VcAZrjbzEd6sWVXTo3HvfFd4qyfTJ5oWgrjnZloTQEJ
 5Uvsw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=XezxI66DVa2Vq2r2ORvKcDbZ2d0VwNOxit/rB2l+G
 z4=; b=Uc17II23Km/dRnxKq/B/k5SbaEaShqXrcNDKRDSs9Q8st0AVs2cEFkogJ
 12FDJCFgbwNwF0sp9XhLagKcpkGh3Jxl18EMKo7PZAbB6XYPH2z8DRAwTU5dJ+AU
 b1DQS/YR4DuOETenyW/Is3BSZ8K1NsSqh1VvmBMsxTAOF7EXHt8brlJUKaMWjDZk
 LfSOm/O/ZSOsuupnrf4Z1KHg8CdXkxIwkrIL7kXh0RlSdzpJRY+t3ToLu6hbjS44
 4J9A0OJ7fzEOElKsmJr8n2ngq2TZUdqveCbIRSem7npylWKIgbjHHkqbWmcsTu+x
 BO4kB4EEp/KP1k44pejOdPROnIouw==
X-ME-Sender: <xms:rST4XyluvJ8iqCHhEOlsLAY3lRApYHXxOse-RdZQjoRxvhxcCFGgew>
 <xme:rST4X53Z9bEeLFe42mkGCf1-rB5NvzBzQwQurXjB6YI7_A5WwRZKRsKRJU26jBVc-
 dj_DATI3cs0q-1DUB4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdeggedgtdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtugfgjgesthhqredttddtudenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeehledvhfeklefgveelkeeludevffethfdukedvfffhhfegfeeugfehgeef
 jeevtdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:rST4XwoOTWGNLHKyvTr0n-7bBHmN7cR-xpilSg3KNs2aRIb76E1DFA>
 <xmx:rST4X2lih4o94A66y6qhiuTEjSg4gIYI8qa3edzuULfoJ0kkz2jQPw>
 <xmx:rST4Xw0BH6GntyNiIFZ7X-Lzg_I4o5nsu25mWZ8T4uTJduaCmvuZKQ>
 <xmx:riT4XxKN46JQRuCi_QuTKkvQdnQ67BkTn0eltEdr_-S4FOnGfQqZx0e1qRE>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8F56724005E;
 Fri,  8 Jan 2021 04:23:56 -0500 (EST)
Date: Fri, 8 Jan 2021 10:23:55 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Subject: Re: [PATCH v2 2/2] drm/sun4i: tcon: improve DCLK polarity handling
Message-ID: <20210108092355.7p5uakxt7lpdu3bn@gilmour>
References: <3685133.SLcexNTYsu@kista>
 <20210107023032.560182-1-giulio.benetti@benettiengineering.com>
 <20210107023032.560182-3-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210107023032.560182-3-giulio.benetti@benettiengineering.com>
X-Mailman-Approved-At: Sat, 09 Jan 2021 11:46:48 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, wens@csie.org,
 linux-arm-kernel@lists.infradead.org, treding@nvidia.com,
 Giulio Benetti <giulio.benetti@micronovasrl.com>,
 Marjan Pascolo <marjan.pascolo@trexom.it>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Thanks for those patches

On Thu, Jan 07, 2021 at 03:30:32AM +0100, Giulio Benetti wrote:
> From: Giulio Benetti <giulio.benetti@micronovasrl.com>
> =

> It turned out(Maxime suggestion) that bit 26 of SUN4I_TCON0_IO_POL_REG is
> dedicated to invert DCLK polarity and this makes thing really easier than
> before. So let's handle DCLK polarity by adding
> SUN4I_TCON0_IO_POL_DCLK_POSITIVE as bit 26 and activating according to
> bus_flags the same way is done for all the other signals.
> =

> Cc: Maxime Ripard <maxime@cerno.tech>

Suggested-by would be nice here :)

> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>  drivers/gpu/drm/sun4i/sun4i_tcon.c | 20 +-------------------
>  drivers/gpu/drm/sun4i/sun4i_tcon.h |  1 +
>  2 files changed, 2 insertions(+), 19 deletions(-)
> =

> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/s=
un4i_tcon.c
> index 52598bb0fb0b..30171ccd87e5 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> @@ -569,26 +569,8 @@ static void sun4i_tcon0_mode_set_rgb(struct sun4i_tc=
on *tcon,
>  	if (info->bus_flags & DRM_BUS_FLAG_DE_LOW)
>  		val |=3D SUN4I_TCON0_IO_POL_DE_NEGATIVE;
>  =

> -	/*
> -	 * On A20 and similar SoCs, the only way to achieve Positive Edge
> -	 * (Rising Edge), is setting dclk clock phase to 2/3(240=B0).
> -	 * By default TCON works in Negative Edge(Falling Edge),
> -	 * this is why phase is set to 0 in that case.
> -	 * Unfortunately there's no way to logically invert dclk through
> -	 * IO_POL register.
> -	 * The only acceptable way to work, triple checked with scope,
> -	 * is using clock phase set to 0=B0 for Negative Edge and set to 240=B0
> -	 * for Positive Edge.
> -	 * On A33 and similar SoCs there would be a 90=B0 phase option,
> -	 * but it divides also dclk by 2.
> -	 * Following code is a way to avoid quirks all around TCON
> -	 * and DOTCLOCK drivers.
> -	 */
>  	if (info->bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE)
> -		clk_set_phase(tcon->dclk, 0);
> -
> -	if (info->bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
> -		clk_set_phase(tcon->dclk, 240);
> +		val |=3D SUN4I_TCON0_IO_POL_DCLK_POSITIVE;

I'm not really sure why we need the first patch of this series here?
That patch only seem to undo what you did in patch 1

Maxime
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
