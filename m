Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DB6730DED
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 06:08:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2460710E10F;
	Thu, 15 Jun 2023 04:07:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 465FA10E10F
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 04:07:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1686802073; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=joh/ENH8K6ZfoibALtegIvHavpd9F0BfvAfCYAXxdgEE8A7lig5TLwJn++snB4Xb1Pdscs+EvbL6IhF5jF6X2OM/rnzVr6EPrqKw7MDMYaWeT2MYQ8BPXFdCfBE5t2Q2N8Ib+d5y+frqkfNc7VdM86SjfBNgm5f1lkRCre2Y0f4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1686802073;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=HmeGikfZu0nuA/PO+VkjVh+UHtJtzsh/brohbIAMqjs=; 
 b=Y5eJbJ5WGQkh/5+Bljo42M6CCe1UAO4wRsQpjURMdIrha81sJqpdffCdHLEHzHWcuctvR7azvkCEfCLZi4oIQnYnAo4m/plbvI2QQnJ8xH96c/C5z6dbQn3eMAfMGeiFhCFyjwrn6rGUGEyb4m8k1QXHflpo1Lg2FgsrelCI3zU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1686802073; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=HmeGikfZu0nuA/PO+VkjVh+UHtJtzsh/brohbIAMqjs=;
 b=MRbt2I2VUuv+XdPw8rTKMIyZ0HUWUIKW5HS1emunIPnj7Dm7LtGO+sifhlFmD48N
 s9MPriNggFYUikj+SX+4yozKCBGrOJ5nhd0+LCQ/YYGeF2KDTTG4R7BC2+1lsU7I5m8
 aUgaIQAxFT5jmegUH5srb38qo1igAR+1Vznm6Wd2UjuK97cIaZaczo49OC14NbKjPe+
 PJzj888hZjR3/RNH3fdCg87fKYfcYWvlARFB93qI/nX/GWl8uf7bxvia6ViioKl3mbo
 amKBKhgmYxmrO8b3+CVlqSpy+4Z7W3W4P3+7ssQbx6yR+YiDZlf5E4TpR8sRV+Jhi2l
 q0UIBXtNYg==
Received: from edelgard.fodlan.icenowy.me (120.85.99.123 [120.85.99.123]) by
 mx.zohomail.com with SMTPS id 1686802071257256.8097883651021;
 Wed, 14 Jun 2023 21:07:51 -0700 (PDT)
Message-ID: <75b82b8a49f7640dc69b568eb46bede98f4c966e.camel@icenowy.me>
Subject: Re: [PATCH] drm/bridge: ps8640: Drop the ability of ps8640 to fetch
 the EDID
From: Icenowy Zheng <uwu@icenowy.me>
To: Doug Anderson <dianders@chromium.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Date: Thu, 15 Jun 2023 12:07:44 +0800
In-Reply-To: <CAD=FV=XGN7NEFjtAAr+y_Vfth0MKL875B1+mqzmy3yAfteNxuQ@mail.gmail.com>
References: <20230612163256.1.I7b8f60b3fbfda068f9bf452d584dc934494bfbfa@changeid>
 <86ad3ffb-fbe2-9bed-751d-684994b71e9d@collabora.com>
 <CAD=FV=XGN7NEFjtAAr+y_Vfth0MKL875B1+mqzmy3yAfteNxuQ@mail.gmail.com>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Pin-yen Lin <treapking@chromium.org>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

=E5=9C=A8 2023-06-14=E6=98=9F=E6=9C=9F=E4=B8=89=E7=9A=84 14:31 -0700=EF=BC=
=8CDoug Anderson=E5=86=99=E9=81=93=EF=BC=9A
> Hi,
>=20
> On Wed, Jun 14, 2023 at 1:22=E2=80=AFAM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
> >=20
> > Il 13/06/23 01:32, Douglas Anderson ha scritto:
> > > In order to read the EDID from an eDP panel, you not only need to
> > > power on the bridge chip itself but also the panel. In the ps8640
> > > driver, this was made to work by having the bridge chip manually
> > > power
> > > the panel on by calling pre_enable() on everything connectorward
> > > on
> > > the bridge chain. This worked OK, but...
> > >=20
> > > ...when trying to do the same thing on ti-sn65dsi86, feedback was
> > > that
> > > this wasn't a great idea. As a result, we designed the "DP AUX"
> > > bus. With the design we ended up with the panel driver itself was
> > > in
> > > charge of reading the EDID. The panel driver could power itself
> > > on and
> > > the bridge chip was able to power itself on because it
> > > implemented the
> > > DP AUX bus.
> > >=20
> > > Despite the fact that we came up with a new scheme, implemented
> > > in on
> > > ti-sn65dsi86, and even implemented it on parade-ps8640, we still
> > > kept
> > > the old code around. This was because the new scheme required a
> > > DT
> > > change. Previously the panel was a simple "platform_device" and
> > > in DT
> > > at the top level. With the new design the panel needs to be
> > > listed in
> > > DT under the DP controller node. The old code allowed us to
> > > properly
> > > fetch EDIDs with ps8640 with the old DTs.
> > >=20
> > > Unfortunately, the old code stopped working as of commit
> > > 102e80d1fa2c
> > > ("drm/bridge: ps8640: Use atomic variants of drm_bridge_funcs").
> > > There
> > > are cases at bootup where connector->state->state is NULL and the
> > > kernel crashed at:
> > > * drm_atomic_bridge_chain_pre_enable
> > > * drm_atomic_get_old_bridge_state
> > > * drm_atomic_get_old_private_obj_state
> > >=20
> > > A bit of digging was done to see if there was an easy fix but
> > > there
> > > was nothing obvious. Instead, the only device using ps8640 the
> > > "old"
> > > way had its DT updated so that the panel was no longer a simple
> > > "platform_deice". See commit c2d94f72140a ("arm64: dts: mediatek:
> > > mt8173-elm: Move display to ps8640 auxiliary bus") and commit
> > > 113b5cc06f44 ("arm64: dts: mediatek: mt8173-elm: remove panel
> > > model
> > > number in DT").
> > >=20
> > > Let's delete the old, crashing code so nobody gets tempted to
> > > copy it
> > > or figure out how it works (since it doesn't).
> > >=20
> > > NOTE: from a device tree "purist" point of view, we're supposed
> > > to
> > > keep old device trees working and this patch is technically
> > > "against
> > > policy". Reasons I'm still proposing it anyway:
> > > 1. Officially, old mt8173-elm device trees worked via the "little
> > > =C2=A0=C2=A0=C2=A0 white lie" approach. The DT would list an
> > > arbitrary/representative
> > > =C2=A0=C2=A0=C2=A0 panel that would be used for power sequencing. The=
 mode
> > > information
> > > =C2=A0=C2=A0=C2=A0 in the panel driver would then be ignored / overri=
dden by the
> > > EDID
> > > =C2=A0=C2=A0=C2=A0 reading code in ps8640. I don't feel too terrible =
breaking
> > > DTs that
> > > =C2=A0=C2=A0=C2=A0 contained the wrong "compatible" string to begin w=
ith. NOTE
> > > that
> > > =C2=A0=C2=A0=C2=A0 any old device trees that _didn't_ lie about their=
 compatible
> > > will
> > > =C2=A0=C2=A0=C2=A0 still work because the mode information will come =
from the
> > > =C2=A0=C2=A0=C2=A0 hardcoded panels in panel-edp.
> > > 2. The only users of the old code were Chromebooks and
> > > Chromebooks
> > > =C2=A0=C2=A0=C2=A0 don't bake their DTs into the BIOS (they are bundl=
ed with the
> > > =C2=A0=C2=A0=C2=A0 kernel). Thus we don't need to worry about breakin=
g someone
> > > using
> > > =C2=A0=C2=A0=C2=A0 an old DT with a new kernel.
> > > 3. The old code was crashing anyway. If someone wants to fix the
> > > old
> > > =C2=A0=C2=A0=C2=A0 code instead of deleting it then they have my bles=
sing, but
> > > without
> > > =C2=A0=C2=A0=C2=A0 a proper fix the old code isn't useful.
> > >=20
> > > I'll list this as "Fixing" the code that made the old code start
> > > failing. There's not lots of reason to bring this back any
> > > further
> > > than that.
> >=20
> > Hoping to see removal of non-aux EDID reading code from all drivers
> > that can
> > support aux-bus is exactly why I moved Elm to the proper... aux-
> > bus.. so...
> >=20
> > Yes! Let's go!
> >=20
> > >=20
> > > Fixes: 102e80d1fa2c ("drm/bridge: ps8640: Use atomic variants of
> > > drm_bridge_funcs")
> >=20
> > ...but this Fixes tag will cause this commit to be backported to
> > kernel versions
> > before my commit moving Elm to aux-bus, and break display on those.
> >=20
> > I would suggest to either find a different Fixes tag, or don't add
> > any, since
> > technically this is a deprecation commit. We could imply that the
> > old technique
> > is deprecated since kernel version X.Y and get away with it.
> >=20
> > Otherwise, if you want it backported *anyway*, the safest way would
> > be to Cc it
> > to stable and explicitly say which versions should it be backported
> > to.
>=20
> The problem is that, as I understand it, as of commit 102e80d1fa2c
> ("drm/bridge: ps8640: Use atomic variants of drm_bridge_funcs"),
> things are broken anyway and you'll get a crash at bootup. However,
> if
> you start at that commit and apply ${SUBJECT} patch, things actually
> end up being less broken. It won't crash anymore and on any boards
> that actually have the display that's specified in the DT compatible
> the screen should actually work. Thus even without your patch to move
> things over to the aux-bus it's still an improvement to take
> ${SUBJECT} patch on any kernels that have that commit.
>=20
> I don't have an 'elm' device easily accessible, but I can figure out
> how to get one if needed to confirm that's true. However, maybe it's
> easy for you or Pin-Yen to confirm.

Well I think hana also works in this situation, and elm is indeed
broken because the DT compatible is not the correct panel (I assume the
panel is used on some hana instead of elm).

>=20
> If my understanding is incorrect, I have no objection to removing the
> Fixes tag. I'd probably have to update the commit message a bunch too
> because that was part of my justification for landing the patch in
> the
> first place.

