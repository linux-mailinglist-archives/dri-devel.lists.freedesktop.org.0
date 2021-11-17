Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76335454B86
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 18:02:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 967A66E41B;
	Wed, 17 Nov 2021 17:02:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD4026E153
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 17:02:42 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3A8DCE7;
 Wed, 17 Nov 2021 18:02:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1637168561;
 bh=o22ULqTwaYVqhi4MuajTZOxo0Y+YXB95Tev8CMJcCMk=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=hOJFfAdFL7OEJsEpm9GwJvQ+zqASWx2gHglkOOhnWoph6KoAyxvTjjoWSKI00D1yK
 3tnmfT+DRr0DfIO1JBUISqd+srJy0gO2ymZ+WqG5pSkXjgJXyj4txWjRFdSqmvZB0f
 rZz2f9IJ7p2vifg7apWMAWCCDA2zltyzhq06cij4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAD=FV=VM9H8Fow49V2eLs2Jfv6DmPYpDGNyHicc_802RksTZYQ@mail.gmail.com>
References: <20211117163239.529781-1-kieran.bingham+renesas@ideasonboard.com>
 <CAD=FV=VM9H8Fow49V2eLs2Jfv6DmPYpDGNyHicc_802RksTZYQ@mail.gmail.com>
Subject: Re: [PATCH] gpu: drm: panel-edp: Fix edp_panel_entry documentation
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Doug Anderson <dianders@chromium.org>
Date: Wed, 17 Nov 2021 17:02:38 +0000
Message-ID: <163716855845.420308.7037966419706240111@Monstersaurus>
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Doug Anderson (2021-11-17 16:49:43)
> Hi,
>=20
> On Wed, Nov 17, 2021 at 8:32 AM Kieran Bingham
> <kieran.bingham+renesas@ideasonboard.com> wrote:
> >
> > The edp_panel_entry members 'delay' and 'name' are documented, but
> > without the correct syntax for kernel doc.
> >
> > This generates the following warnings:
> >
> > drivers/gpu/drm/panel/panel-edp.c:204: warning: Function parameter or m=
ember 'delay' not described in 'edp_panel_entry'
> > drivers/gpu/drm/panel/panel-edp.c:204: warning: Function parameter or m=
ember 'name' not described in 'edp_panel_entry'
> >
> > Fix them accordingly.
> >
> > Fixes: 5540cf8f3e8d ("drm/panel-edp: Implement generic "edp-panel"s pro=
bed by EDID")
> > Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > ---
> >  drivers/gpu/drm/panel/panel-edp.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> Thanks! Pushed to drm-misc-next (though technically it's a fix, it
> didn't seem urgent enough to go through -fixes. Hopefully this is OK).
>=20

Certainly, I agree it's not urgent. I wasn't even sure if I should add
the Fixes tag, but I figured if I left it out someone would jump in with
it ;-)

> 1e66f04c14ab gpu: drm: panel-edp: Fix edp_panel_entry documentation
>=20
> -Doug

Thanks

Kieran
