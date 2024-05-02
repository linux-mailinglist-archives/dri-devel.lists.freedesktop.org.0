Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 971C88B98E4
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 12:36:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DA0210F26E;
	Thu,  2 May 2024 10:36:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cb3nqeBe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BAA410E395
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 10:35:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 2A032CE1320;
 Thu,  2 May 2024 10:35:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A26A2C113CC;
 Thu,  2 May 2024 10:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714646153;
 bh=hK4ov6ylR1Ugfedc+gAwxkAdNe5nyfrosMJJf2M9fIY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cb3nqeBeoHrI93ndU1+kejrXRKY7tNaPbqH2m3ypYfQt0F/4BTck0UMCuoIeHgYzO
 L+k6qhX8BRSRJz68WWe2Z0jNKC4qFtCKrGox2WZjYASmRLNimgWfseXSZL4ZOhwY+I
 KqmXiUErpbUR91g/quYjA+Fno7sL06owszJxxZJmmok9aqu4MqTFzFXb7Hnv51TK2p
 5hElv0wJwHgqUJ2lm2zfjTotqInc38Tej28qhJrDZApzFJ2EFuMWhRnj6mFpPS+hhT
 h/iyHayqWeoFjCn5gzDi/BbSL7cmZcfetiU0OZj0y0XUvgNNCxZAs3fujWxvKFJONz
 Um35B46skZ3sw==
Date: Thu, 2 May 2024 11:35:48 +0100
From: Lee Jones <lee@kernel.org>
To: Shresth Prasad <shresthprasad7@gmail.com>
Cc: daniel.thompson@linaro.org, jingoohan1@gmail.com, deller@gmx.de,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, javier.carrasco.cruz@gmail.com,
 skhan@linuxfoundation.org, julia.lawall@inria.fr
Subject: Re: [PATCH v3][next] backlight: sky81452-backlight: Remove
 unnecessary call to of_node_get
Message-ID: <20240502103548.GU5338@google.com>
References: <20240502063621.65687-2-shresthprasad7@gmail.com>
 <20240502093623.GJ5338@google.com>
 <CAE8VWiLP-QR_KaHBPYjA=UVJ8SShpKseB5Xp9Hpkd1RMcvt-qw@mail.gmail.com>
 <20240502100822.GS5338@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240502100822.GS5338@google.com>
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

On Thu, 02 May 2024, Lee Jones wrote:

> On Thu, 02 May 2024, Shresth Prasad wrote:
> 
> > On Thu, May 2, 2024 at 3:06 PM Lee Jones <lee@kernel.org> wrote:
> > >
> > > On Thu, 02 May 2024, Shresth Prasad wrote:
> > >
> > > > `dev->of_node` already has a reference to the device_node and calling
> > > > of_node_get on it is unnecessary. All conresponding calls to
> > > > of_node_put are also removed.
> > > >
> > > > Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> > > > Signed-off-by: Shresth Prasad <shresthprasad7@gmail.com>
> > > > ---
> > > > Changes in v3:
> > > >     - Remove unnecessary braces
> > > >
> > > >  drivers/video/backlight/sky81452-backlight.c | 8 ++------
> > > >  1 file changed, 2 insertions(+), 6 deletions(-)
> > >
> > > No idea what you're talking about.
> > >
> > > This patch/version doesn't exist in either my inbox or LORE:
> > >
> > >   https://lore.kernel.org/all/?q=%22%5BPATCH+v3%5D%5Bnext%5D+backlight%3A+sky81452-backlight%3A+Remove+unnecessary+call+to+of_node_get%22
> > >
> > > --
> > > Lee Jones [李琼斯]
> > 
> > I'm not sure what you mean.
> > The patches show up just fine:
> > https://lore.kernel.org/all/?q=backlight%3A+sky81452-backlight%3A+Remove+unnecessary+call+to+of_node_get
> > 
> > If you mean that the first version doesn't show up, it's because the
> > commit message
> > was changed to better reflect changes.
> 
> Those are v2
> 
> You replied to a non-existent v3 which started a new thread.

Something funky is going on.  Your pokey emails are coming through
disconnected from the patches which is causing confusion.

The best thing going forward is to submit [RESEND]s instead of
contentless pokes.

Please submit a [RESEND] for v3 and we can start again.

-- 
Lee Jones [李琼斯]
