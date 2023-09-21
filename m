Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8567A92E2
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 10:57:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90A1E10E58F;
	Thu, 21 Sep 2023 08:57:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AAD410E58F
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 08:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1695286668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GD0I7DelIklg6Wdyz3YyitDbVlTesItMu2ytbmOwkrg=;
 b=sO74B/ZFgF4/vEPfJNv43mrEoSJnOC5dCBHqiLcwhVBAd/joa7zpr01ERQq5kTc3z6si02
 jelbxffpbsn3AIMFtUCuv3LCqwHGqZFwoHUPA/mqfTObvFphdaET4SMn1i6RJwDUv5ZuVV
 KJ0p3UxZIxec/LBCgsLfCX7d8XPh1us=
Message-ID: <c07432575d33184eef2461f1c22510e9a8ab770f.camel@crapouillou.net>
Subject: Re: MAINTAINERS: Update drm-misc entry to match all drivers
From: Paul Cercueil <paul@crapouillou.net>
To: Maxime Ripard <mripard@kernel.org>, suijingfeng <suijingfeng@loongson.cn>
Date: Thu, 21 Sep 2023 10:57:46 +0200
In-Reply-To: <enobmyvbv5rw5uvdlcznttqxnh4d5674agh4x6aqcbrlcxvryg@vbzdomlyleyx>
References: <20230919131235.759959-1-mripard@kernel.org>
 <afc3da23-81ce-edcf-6ea6-8fd8711e17b0@loongson.cn>
 <enobmyvbv5rw5uvdlcznttqxnh4d5674agh4x6aqcbrlcxvryg@vbzdomlyleyx>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Le jeudi 21 septembre 2023 =C3=A0 10:47 +0200, Maxime Ripard a =C3=A9crit=
=C2=A0:
> Hi,
>=20
> Adding Paul in Cc
>=20
> On Thu, Sep 21, 2023 at 04:25:50PM +0800, suijingfeng wrote:
> > On 2023/9/19 21:12, Maxime Ripard wrote:
> > > We've had a number of times when a patch slipped through and we
> > > couldn't
> > > pick them up either because our MAINTAINERS entry only covers the
> > > framework and thus we weren't Cc'd.
> > >=20
> > > Let's take another approach where we match everything, and remove
> > > all
> > > the drivers that are not maintained through drm-misc.
> > >=20
> > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > Acked-by: Jani Nikula <jani.nikula@intel.com>
> > > ---
> > > =C2=A0 MAINTAINERS | 23 ++++++++++++++++++++---
> > > =C2=A0 1 file changed, 20 insertions(+), 3 deletions(-)
> > >=20
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 90f13281d297..757d4f33e158 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -6860,12 +6860,29 @@ M:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Thomas =
Zimmermann
> > > <tzimmermann@suse.de>
> > > =C2=A0 S:=C2=A0=C2=A0=C2=A0=C2=A0Maintained
> > > =C2=A0
> > > W:=C2=A0=C2=A0=C2=A0=C2=A0https://01.org/linuxgraphics/gfx-docs/maint=
ainer-tools/drm-
> > > misc.html
> > > =C2=A0 T:=C2=A0=C2=A0=C2=A0=C2=A0git git://anongit.freedesktop.org/dr=
m/drm-misc
> > > +F:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Documentation/devicetree/bindings/di=
splay/
> > > +F:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Documentation/devicetree/bindings/gp=
u/
> > > =C2=A0 F:=C2=A0=C2=A0=C2=A0=C2=A0Documentation/gpu/
> > > -F:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drivers/gpu/drm/*
> > > +F:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drivers/gpu/drm/
> > > =C2=A0 F:=C2=A0=C2=A0=C2=A0=C2=A0drivers/gpu/vga/
> > > -F:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0include/drm/drm*
> > > +F:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0include/drm/drm
> > > =C2=A0 F:=C2=A0=C2=A0=C2=A0=C2=A0include/linux/vga*
> > > -F:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0include/uapi/drm/drm*
> > > +F:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0include/uapi/drm/
> > > +X:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drivers/gpu/drm/amd/
> > > +X:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drivers/gpu/drm/armada/
> > > +X:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drivers/gpu/drm/etnaviv/
> > > +X:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drivers/gpu/drm/exynos/
> > > +X:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drivers/gpu/drm/gma500/
> > > +X:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drivers/gpu/drm/i915/
> > > +X:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drivers/gpu/drm/imx/
> > > +X:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drivers/gpu/drm/ingenic/
> > > +X:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drivers/gpu/drm/kmb/
> > > +X:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drivers/gpu/drm/mediatek/
> > > +X:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drivers/gpu/drm/msm/
> > > +X:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drivers/gpu/drm/nouveau/
> > > +X:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drivers/gpu/drm/radeon/
> > > +X:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drivers/gpu/drm/renesas/
> > > +X:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drivers/gpu/drm/tegra/
> > > =C2=A0 DRM DRIVERS FOR ALLWINNER A10
> > > =C2=A0 M:=C2=A0=C2=A0=C2=A0=C2=A0Maxime Ripard <mripard@kernel.org>
> >=20
> >=20
> > Nice patch!
> >=20
> > Well, I'm just curious about why the drm/ingenic and drm/gma500 are
> > not maintained through drm-misc?
> >=20
> > As far as I know:
> > 1) the drm/ingenic driver don't have a "T" annotation (location of
> > the link).
>=20
> Yeah, I wasn't sure about that one indeed. I remained conservative
> since it's a
> sensitive topic for some.
>=20
> Paul, is drm/ingenic supposed to be maintained through drm-misc?
> Either way,
> could you clarify which git tree is supposed to merge those patches
> in
> MAINTAINERS?

drm/ingenic is maintained through drm-misc, yes.

Looking at the MAINTAINERS file, it seems to be one of the only DRM
drivers without its own entry. I'll add one then.

Cheers,
-Paul

>=20
> > 2) the "T" of drm/gma500 is "git git://github.com/patjak/drm-
> > gma500", but the
> =C2=A0 code for this link is not up to date.
>=20
> For gma500, I think it's mostly historical since it was there before
> drm-misc
> was a thing.
>=20
> > I think at least the drm/ingenic and drm/gma500 drivers are
> > *actually*
> > maintained through drm-misc, So perhaps, these two drivers should
> > not be
> > excluded. Am I correct?
>=20
> It's likely :)
>=20
> Either way, I think it can be solved/clarified later on
>=20
> Maxime

