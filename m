Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 023A78B987D
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 12:08:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4974E10F45A;
	Thu,  2 May 2024 10:08:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="T+JKSvy9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63F4610F061
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 10:08:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9250B61A2A;
 Thu,  2 May 2024 10:08:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D08CC113CC;
 Thu,  2 May 2024 10:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714644507;
 bh=6gRnDTDd9REkJXW+GkcBSk8o1rA+zFVylF5o6wzaZjY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T+JKSvy9CVQzbimOFktsp6xGEfB+mJGpdHBvLaCCPgzmx0BdnL6YS0S1W/SVcmHjh
 jpWrlci1P48V0XgFuzEfXtJaJYyNMCXeY1CHDT4oPnJBjDtp2Ubo0BjGCMGwAmqGkN
 79t9DFvpI5CB2CMcWgcWreTsrdqmO3kuYkcDF93QbS+cDjfI2uL2IbacENBYMOUIT6
 0WSwJIaj6vaQBv2VrCnVYD2V1QTuNxyYKG2E2nNnEaSt8lj8KBE5uXe652gA1vc8FT
 LzRbzkDRBFPgiQPvpIkvUzEyHN2WWygIx8KKliw3A3BOAJXvfLfN15xZdWfG4Zv6Va
 3plA5bgYT1zxg==
Date: Thu, 2 May 2024 11:08:22 +0100
From: Lee Jones <lee@kernel.org>
To: Shresth Prasad <shresthprasad7@gmail.com>
Cc: daniel.thompson@linaro.org, jingoohan1@gmail.com, deller@gmx.de,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, javier.carrasco.cruz@gmail.com,
 skhan@linuxfoundation.org, julia.lawall@inria.fr
Subject: Re: [PATCH v3][next] backlight: sky81452-backlight: Remove
 unnecessary call to of_node_get
Message-ID: <20240502100822.GS5338@google.com>
References: <20240502063621.65687-2-shresthprasad7@gmail.com>
 <20240502093623.GJ5338@google.com>
 <CAE8VWiLP-QR_KaHBPYjA=UVJ8SShpKseB5Xp9Hpkd1RMcvt-qw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAE8VWiLP-QR_KaHBPYjA=UVJ8SShpKseB5Xp9Hpkd1RMcvt-qw@mail.gmail.com>
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

On Thu, 02 May 2024, Shresth Prasad wrote:

> On Thu, May 2, 2024 at 3:06 PM Lee Jones <lee@kernel.org> wrote:
> >
> > On Thu, 02 May 2024, Shresth Prasad wrote:
> >
> > > `dev->of_node` already has a reference to the device_node and calling
> > > of_node_get on it is unnecessary. All conresponding calls to
> > > of_node_put are also removed.
> > >
> > > Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> > > Signed-off-by: Shresth Prasad <shresthprasad7@gmail.com>
> > > ---
> > > Changes in v3:
> > >     - Remove unnecessary braces
> > >
> > >  drivers/video/backlight/sky81452-backlight.c | 8 ++------
> > >  1 file changed, 2 insertions(+), 6 deletions(-)
> >
> > No idea what you're talking about.
> >
> > This patch/version doesn't exist in either my inbox or LORE:
> >
> >   https://lore.kernel.org/all/?q=%22%5BPATCH+v3%5D%5Bnext%5D+backlight%3A+sky81452-backlight%3A+Remove+unnecessary+call+to+of_node_get%22
> >
> > --
> > Lee Jones [李琼斯]
> 
> I'm not sure what you mean.
> The patches show up just fine:
> https://lore.kernel.org/all/?q=backlight%3A+sky81452-backlight%3A+Remove+unnecessary+call+to+of_node_get
> 
> If you mean that the first version doesn't show up, it's because the
> commit message
> was changed to better reflect changes.

Those are v2

You replied to a non-existent v3 which started a new thread.

-- 
Lee Jones [李琼斯]
