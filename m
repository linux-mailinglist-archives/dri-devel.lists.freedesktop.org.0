Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 592CD7917A7
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 14:57:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87CFF10E1D3;
	Mon,  4 Sep 2023 12:57:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD15710E1D3
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 12:57:33 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0F895128D;
 Mon,  4 Sep 2023 14:56:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1693832166;
 bh=C9icZMS0QHJ0RqYuqERzAofohYDpAdWWdpcM4Gh1MGw=;
 h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
 b=vYbLngxlixvsHqW8TScRwp861DS9XAJH9Dv4K9RQrgOZgMFwoCnmC+W/YYgflpjtu
 RG8m8RizPLnQ0UimbHp+xDF9wdUjAbWP0kfsOo935K0IbZEOFACsS3CowSCyqC7wbd
 oLK0INeHAEEOtkQ2X9trRZpIqi404yqjDXKsZPJI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <169375462648.1779741.7610374659365330420@ping.linuxembedded.co.uk>
References: <20230903133709.8049-1-adiupina@astralinux.ru>
 <169375462648.1779741.7610374659365330420@ping.linuxembedded.co.uk>
Subject: Re: [PATCH] drm/rcar-du: fix comment to rcar_du_group_get()
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Alexandra Diupina <adiupina@astralinux.ru>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Mon, 04 Sep 2023 13:57:29 +0100
Message-ID: <169383224922.277971.15400887308406098634@ping.linuxembedded.co.uk>
User-Agent: alot/0.10
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
Cc: Alexandra Diupina <adiupina@astralinux.ru>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, lvc-project@linuxtesting.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kieran Bingham (2023-09-03 16:23:46)
> Hi Alexandra
>=20
> Quoting Alexandra Diupina (2023-09-03 14:37:09)
> > rcar_du_group_get() never returns a negative
> > error code (always returns 0), so change
> > the comment about returned value
>=20
> If so, then perhaps this may as well become a void return and remove the
> return 0.
>=20
> That could then clean up some redundant error path handling in
> drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c too ?
>=20
> Still, this does correct the documentation to match the implementation
> as it stands so... for that ...
>=20
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Reading Geert's reply here, I'll retract this RB tag, and instead agree
that the emphasis should either be on a full clean up - or that this
does document the intent that if there is an error it will be returned.

--
Kieran


>=20
> But removing an unused error path seems like a worthy clean up
> opportunity too.
>=20
> >=20
> > Fixes: cb2025d2509f ("drm/rcar-du: Introduce CRTCs groups")
>=20
> Hrm ... well the documented behaviour was the same even before this
> commit in rcar_du_get(), so perhaps it was documenting the intent... But
> it does seem that the return code has been redundant for quite some time
> so perhaps it's just not required.
>=20
>=20
> --
> Kieran
>=20
>=20
> > Signed-off-by: Alexandra Diupina <adiupina@astralinux.ru>
> > ---
> >  drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c b/drivers/=
gpu/drm/renesas/rcar-du/rcar_du_group.c
> > index 2ccd2581f544..499d4e56c32d 100644
> > --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
> > +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
> > @@ -200,7 +200,7 @@ static void rcar_du_group_setup(struct rcar_du_grou=
p *rgrp)
> >   *
> >   * This function must be called with the DRM mode_config lock held.
> >   *
> > - * Return 0 in case of success or a negative error code otherwise.
> > + * Always return 0.
> >   */
> >  int rcar_du_group_get(struct rcar_du_group *rgrp)
> >  {
> > --=20
> > 2.30.2
> >
