Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F261D663D8B
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 11:09:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26CF710E584;
	Tue, 10 Jan 2023 10:09:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AA2110E584
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 10:09:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C07F561588;
 Tue, 10 Jan 2023 10:09:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB743C433D2;
 Tue, 10 Jan 2023 10:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673345366;
 bh=wbyd3dtAWj+DS0fcJULsfdTl+t+d2B5Uw2ZuQAp6tpM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XKJ7hEZZUPaCSNrB26CzNsDjquQbBentUhlmtWHZJjjl5ajSRsc2cY1J6TlsbuK52
 UoeGdRXnxLZ8mTjHgbPSqEmh732Odonfjc467CustS3+5wXOJ8G7sxPOOj5OmOUNRy
 w0kKUTLk2m70RapGM9Y4KlCXmcVOjK/OPWsBagysaySfqoZm82qlsKdYmxswDYrer+
 TbB8sWFTiUPd3iYuGD/0RfH2xQw1GdiwwQtq6XoVkDXuGvwSpzZu+xjIKPR/5OQlxm
 16rTc6Mfdvm4x7QdvW8p5nVL1YDBiVFkf6NsLekUIa2pYUR8HMFXdeiKexpKNRNiyO
 ttG8j2EPjTphQ==
Date: Tue, 10 Jan 2023 10:09:18 +0000
From: Lee Jones <lee@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 15/15] backlight: backlight: Drop the deprecated fb_blank
 property
Message-ID: <Y705TvBPWkHzeMrp@google.com>
References: <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org>
 <20230107-sam-video-backlight-drop-fb_blank-v1-15-1bd9bafb351f@ravnborg.org>
 <Y7v1OxdowGdxgvUj@aspen.lan> <Y7xAgHgg0sfh32Ga@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y7xAgHgg0sfh32Ga@ravnborg.org>
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Stephen Kitt <steve@sk2.org>,
 Antonino Daplas <adaplas@gmail.com>, Robin van der Gracht <robin@protonic.nl>,
 Helge Deller <deller@gmx.de>, linux-staging@lists.linux.dev,
 Nicolas Ferre <nicolas.ferre@microchip.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Paul Mackerras <paulus@samba.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-fbdev@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, linux-omap@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 09 Jan 2023, Sam Ravnborg wrote:

> Hi Daniel.
> 
> On Mon, Jan 09, 2023 at 11:06:35AM +0000, Daniel Thompson wrote:
> > On Sat, Jan 07, 2023 at 07:26:29PM +0100, Sam Ravnborg via B4 Submission Endpoint wrote:
> > > From: Sam Ravnborg <sam@ravnborg.org>
> > >
> > > With all users gone remove the deprecated fb_blank member in
> > > backlight_properties.
> > >
> > > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > > Cc: Lee Jones <lee@kernel.org>
> > > Cc: Daniel Thompson <daniel.thompson@linaro.org>
> > > Cc: Jingoo Han <jingoohan1@gmail.com>
> > 
> > 
> > Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> 
> Thanks for the follow-up on all the backlight related patches.
> 
> > 
> > 
> > PS Please don't treat this like a maintainer Acked-by: and merge it
> >    (Lee's not on holiday so work with Lee to figure out the merge
> >    strategy ;-) ).
> Nope, I am aware that the usual pattern here and wait for Lee to show
> up.

It's on the list.  Only 50 more reviews in the backlog now!

> For this patch there is a bug as I need to update a comment.
> I will fix this when I resend after all the patches in flight has
> landed. So likely after the next merge window,

-- 
Lee Jones [李琼斯]
