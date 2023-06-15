Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 115DA731298
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 10:47:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C963110E182;
	Thu, 15 Jun 2023 08:47:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86ABA10E182
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 08:46:59 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-33dae9244a1so1457625ab.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 01:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1686818818; x=1689410818;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M3N4xS19iiNzAfZG6+oX0xz2hD15R8Izsc9S3234U/0=;
 b=CHTPa0h6ltc+yR3piAhuVoU4l/6tQJGLjGnvKlLXVtnB8ky9yeCFEnkiDBB9u7M6iI
 TXT0k5apmt9i69eZ+JwiWh5FtQzZ4gk2geEk5MaqJCBn0vtzor6BkrxZX2JtT9OacDGZ
 aUR6CpIMp96OR6xnRwrBmPpKCYG5KdLb6lTdc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686818818; x=1689410818;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M3N4xS19iiNzAfZG6+oX0xz2hD15R8Izsc9S3234U/0=;
 b=VOUIJrKY9MMFrhHVOn1UkzhraBA932cBgYA8ncZQvB2PBO+e0xuIKorUVHCTaiHQUa
 6UQPmiYcJeZw85SmLZnibe1c70Xa1q87C/Iran8a+MZgkntwmAsW335LHWfSn1fWr9TQ
 7uzknyLV+Aju08VmOYCH72y6aAPgQRLC/+E3n11lmMBrI2RBB2OvFpCSC3txVqbw5Dc9
 q7vCoIJBXpFqyJAX+39drILbdxlQg0DnS/QUnW0or6HFwqzA92WvvbQPOdKYOa0t/Rs+
 U34FDHca+iReA7YuU9RFxeTq9NRfi+82PHg27Au9+qf1rd8RSHa90PxU6MmomFdQ+MTz
 p8oQ==
X-Gm-Message-State: AC+VfDye5LiWHYhJH21mFqNS/6lFZStLmC6qpWDdAv3YnIiEXvYnGJDu
 41KfyWZl9sQuLoGQ3/9icXHQWdJYekujmVJAxIlNGg==
X-Google-Smtp-Source: ACHHUZ6kqFa7q2VxCIcvIDPt2mhzc1zPK4cIQXDryLUZOAD5/VrLNO0VuDFIo8WNT1SHLoumGczuZP4OgrMsw4u9XEY=
X-Received: by 2002:a92:ce85:0:b0:340:81af:7c2c with SMTP id
 r5-20020a92ce85000000b0034081af7c2cmr3371382ilo.10.1686818818367; Thu, 15 Jun
 2023 01:46:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230612163256.1.I7b8f60b3fbfda068f9bf452d584dc934494bfbfa@changeid>
 <86ad3ffb-fbe2-9bed-751d-684994b71e9d@collabora.com>
 <CAD=FV=XGN7NEFjtAAr+y_Vfth0MKL875B1+mqzmy3yAfteNxuQ@mail.gmail.com>
In-Reply-To: <CAD=FV=XGN7NEFjtAAr+y_Vfth0MKL875B1+mqzmy3yAfteNxuQ@mail.gmail.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Thu, 15 Jun 2023 16:46:47 +0800
Message-ID: <CAEXTbpcaG1h-AD3SEkznefimMGmvEUtTwQBV9MQ9c+Q-Q+z6GA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ps8640: Drop the ability of ps8640 to fetch
 the EDID
To: Doug Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 Icenowy Zheng <uwu@icenowy.me>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Doug,

On Thu, Jun 15, 2023 at 5:31=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Wed, Jun 14, 2023 at 1:22=E2=80=AFAM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
> >
> > Il 13/06/23 01:32, Douglas Anderson ha scritto:
> > > In order to read the EDID from an eDP panel, you not only need to
> > > power on the bridge chip itself but also the panel. In the ps8640
> > > driver, this was made to work by having the bridge chip manually powe=
r
> > > the panel on by calling pre_enable() on everything connectorward on
> > > the bridge chain. This worked OK, but...
> > >
> > > ...when trying to do the same thing on ti-sn65dsi86, feedback was tha=
t
> > > this wasn't a great idea. As a result, we designed the "DP AUX"
> > > bus. With the design we ended up with the panel driver itself was in
> > > charge of reading the EDID. The panel driver could power itself on an=
d
> > > the bridge chip was able to power itself on because it implemented th=
e
> > > DP AUX bus.
> > >
> > > Despite the fact that we came up with a new scheme, implemented in on
> > > ti-sn65dsi86, and even implemented it on parade-ps8640, we still kept
> > > the old code around. This was because the new scheme required a DT
> > > change. Previously the panel was a simple "platform_device" and in DT
> > > at the top level. With the new design the panel needs to be listed in
> > > DT under the DP controller node. The old code allowed us to properly
> > > fetch EDIDs with ps8640 with the old DTs.
> > >
> > > Unfortunately, the old code stopped working as of commit 102e80d1fa2c
> > > ("drm/bridge: ps8640: Use atomic variants of drm_bridge_funcs"). Ther=
e
> > > are cases at bootup where connector->state->state is NULL and the
> > > kernel crashed at:
> > > * drm_atomic_bridge_chain_pre_enable
> > > * drm_atomic_get_old_bridge_state
> > > * drm_atomic_get_old_private_obj_state
> > >
> > > A bit of digging was done to see if there was an easy fix but there
> > > was nothing obvious. Instead, the only device using ps8640 the "old"
> > > way had its DT updated so that the panel was no longer a simple
> > > "platform_deice". See commit c2d94f72140a ("arm64: dts: mediatek:
> > > mt8173-elm: Move display to ps8640 auxiliary bus") and commit
> > > 113b5cc06f44 ("arm64: dts: mediatek: mt8173-elm: remove panel model
> > > number in DT").
> > >
> > > Let's delete the old, crashing code so nobody gets tempted to copy it
> > > or figure out how it works (since it doesn't).
> > >
> > > NOTE: from a device tree "purist" point of view, we're supposed to
> > > keep old device trees working and this patch is technically "against
> > > policy". Reasons I'm still proposing it anyway:
> > > 1. Officially, old mt8173-elm device trees worked via the "little
> > >     white lie" approach. The DT would list an arbitrary/representativ=
e
> > >     panel that would be used for power sequencing. The mode informati=
on
> > >     in the panel driver would then be ignored / overridden by the EDI=
D
> > >     reading code in ps8640. I don't feel too terrible breaking DTs th=
at
> > >     contained the wrong "compatible" string to begin with. NOTE that
> > >     any old device trees that _didn't_ lie about their compatible wil=
l
> > >     still work because the mode information will come from the
> > >     hardcoded panels in panel-edp.
> > > 2. The only users of the old code were Chromebooks and Chromebooks
> > >     don't bake their DTs into the BIOS (they are bundled with the
> > >     kernel). Thus we don't need to worry about breaking someone using
> > >     an old DT with a new kernel.
> > > 3. The old code was crashing anyway. If someone wants to fix the old
> > >     code instead of deleting it then they have my blessing, but witho=
ut
> > >     a proper fix the old code isn't useful.
> > >
> > > I'll list this as "Fixing" the code that made the old code start
> > > failing. There's not lots of reason to bring this back any further
> > > than that.
> >
> > Hoping to see removal of non-aux EDID reading code from all drivers tha=
t can
> > support aux-bus is exactly why I moved Elm to the proper... aux-bus.. s=
o...
> >
> > Yes! Let's go!
> >
> > >
> > > Fixes: 102e80d1fa2c ("drm/bridge: ps8640: Use atomic variants of drm_=
bridge_funcs")
> >
> > ...but this Fixes tag will cause this commit to be backported to kernel=
 versions
> > before my commit moving Elm to aux-bus, and break display on those.
> >
> > I would suggest to either find a different Fixes tag, or don't add any,=
 since
> > technically this is a deprecation commit. We could imply that the old t=
echnique
> > is deprecated since kernel version X.Y and get away with it.
> >
> > Otherwise, if you want it backported *anyway*, the safest way would be =
to Cc it
> > to stable and explicitly say which versions should it be backported to.
>
> The problem is that, as I understand it, as of commit 102e80d1fa2c
> ("drm/bridge: ps8640: Use atomic variants of drm_bridge_funcs"),
> things are broken anyway and you'll get a crash at bootup. However, if
> you start at that commit and apply ${SUBJECT} patch, things actually
> end up being less broken. It won't crash anymore and on any boards
> that actually have the display that's specified in the DT compatible
> the screen should actually work. Thus even without your patch to move
> things over to the aux-bus it's still an improvement to take
> ${SUBJECT} patch on any kernels that have that commit.
>
> I don't have an 'elm' device easily accessible, but I can figure out
> how to get one if needed to confirm that's true. However, maybe it's
> easy for you or Pin-Yen to confirm.

The crash was there, but then commit 4fb912e5e190 ("drm/bridge:
Introduce pre_enable_prev_first to alter bridge init order") added a
NULL check on the state object in
drm_atomic_bridge_chain_pre_enable(), which prevents the kernel crash
on the latest kernel. And now the panel on "elm" Chromebook is
actually working without an "aux-bus" node seemingly because the
userspace is patient enough to keep retrying until the connector gets
its state initialized. My elm device crashes again after reverting
commit 4fb912e5e190.

However commit 4fb912e5e190 does not contain any fixes tag, so older
branches without it should be experiencing crashes without the
"aux-bus" node now.

Pin-yen

>
> If my understanding is incorrect, I have no objection to removing the
> Fixes tag. I'd probably have to update the commit message a bunch too
> because that was part of my justification for landing the patch in the
> first place.
