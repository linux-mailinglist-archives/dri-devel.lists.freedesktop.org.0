Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 212AA6F525B
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 09:54:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 200C110E1CF;
	Wed,  3 May 2023 07:54:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3058810E1CF;
 Wed,  3 May 2023 07:54:30 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2ac733b813fso4535061fa.1; 
 Wed, 03 May 2023 00:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683100468; x=1685692468;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=oef1NEFZBqv6KKJ251Ddqr/RYRBA1SecAlHl2Q1DCvA=;
 b=WZVCUfMrZIzBUbPYblCJvqCYjcW59tDNpcsDASp70Es+Y6GTjOnjYGkXbRyVSS0vqT
 NBw4Hy7ZIq9ogBC7EC8UiHYH+gJrgxMmYjxi2I1xtKYFmKZntujbmQAhY5BFkX1xGkbM
 QeM+IMiUeuUSNw+lignOwdmOp8R+h5aMufPWb/1CK3W8ketFyYsAMZJcHcmzJ4QVHnBX
 DNjtSgVRwYc1DwtwNkOwWQ8pnCKvfn6CvfVAxHOpyyNpzq24HdrOyaRuQebrhtHTa1/0
 mOiFnXNuCnGPuVMGclx/z21ArDcMfo/I39zFufDDFSn09NEU94UFGWb1ZhaT0jvAHn48
 7GGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683100468; x=1685692468;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oef1NEFZBqv6KKJ251Ddqr/RYRBA1SecAlHl2Q1DCvA=;
 b=K7ncYSHF9HVtq70MBQYqEYSEzl8W5cqna0nIqvG33gEqyeH7LFK3tRlERauu20THKj
 /yrDED6RAVIZRO+krrBP0dkThD0c3DOx7C1oO92zC3yTOGRb0I228lJuUKFpby5ZIS5P
 UYM74N9175mRdOytjUwK0aZxkteCu9V8PvRxcEyOJAsHdXf/GgBKDZQoJulsebPLzo4f
 DLOq22j2pgVESg70YD1BmCLjbvke/8P4G2pdBtoTwc0DJaF8mNlPzD6vKRTAfVH8aj2H
 HAklPrDsDaVmYk3SoRzM6xdU2fJsgXx7pbWsKf7Nqi8/tpfDRXl3jYVT30cH30wF5DiT
 OIqQ==
X-Gm-Message-State: AC+VfDws2hktKc7V5ZMAJmDdNhGFg4Dcz5cVSVwQqYDim0wrE513bDtl
 HHFbUe6OlQfZFYbvoVvQl60=
X-Google-Smtp-Source: ACHHUZ7fsyMRPzAAum5pRi45D4UciusBo61yxF3+WMfJZFonwiCZLUlcxIw1dQZmikhfzaq6hDSRpg==
X-Received: by 2002:a2e:9d42:0:b0:2ab:4bb3:e32c with SMTP id
 y2-20020a2e9d42000000b002ab4bb3e32cmr3975104ljj.31.1683100467290; 
 Wed, 03 May 2023 00:54:27 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 s19-20020a2e2c13000000b002a7a03e1c67sm5859042ljs.13.2023.05.03.00.54.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:54:26 -0700 (PDT)
Date: Wed, 3 May 2023 10:54:15 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Zack Rusin <zackr@vmware.com>
Subject: Re: [PATCH v2 1/8] drm: Disable the cursor plane on atomic contexts
 with virtualized drivers
Message-ID: <20230503105415.62aa7a8d@eldfell>
In-Reply-To: <0dd2fa763aa0e659c8cbae94f283d8101450082a.camel@vmware.com>
References: <20220712033246.1148476-1-zack@kde.org>
 <20220712033246.1148476-2-zack@kde.org>
 <YvPfedG/uLQNFG7e@phenom.ffwll.local>
 <87lei7xemy.fsf@minerva.mail-host-address-is-not-set>
 <0dd2fa763aa0e659c8cbae94f283d8101450082a.camel@vmware.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.24; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/M5oFo8/u3GbVxhsNiA4gva7";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "belmouss@redhat.com" <belmouss@redhat.com>,
 "javierm@redhat.com" <javierm@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "gurchetansingh@chromium.org" <gurchetansingh@chromium.org>,
 Martin Krastev <krastevm@vmware.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "spice-devel@lists.freedesktop.org" <spice-devel@lists.freedesktop.org>,
 "airlied@redhat.com" <airlied@redhat.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Maaz Mombasawala <mombasawalam@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/M5oFo8/u3GbVxhsNiA4gva7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 3 May 2023 03:35:29 +0000
Zack Rusin <zackr@vmware.com> wrote:

> On Tue, 2023-05-02 at 11:32 +0200, Javier Martinez Canillas wrote:
> > !! External Email
> >=20
> > Daniel Vetter <daniel@ffwll.ch> writes:
> >  =20
> > > On Mon, Jul 11, 2022 at 11:32:39PM -0400, Zack Rusin wrote: =20
> > > > From: Zack Rusin <zackr@vmware.com>
> > > >=20
> > > > Cursor planes on virtualized drivers have special meaning and requi=
re
> > > > that the clients handle them in specific ways, e.g. the cursor plane
> > > > should react to the mouse movement the way a mouse cursor would be
> > > > expected to and the client is required to set hotspot properties on=
 it
> > > > in order for the mouse events to be routed correctly.
> > > >=20
> > > > This breaks the contract as specified by the "universal planes". Fi=
x it
> > > > by disabling the cursor planes on virtualized drivers while adding
> > > > a foundation on top of which it's possible to special case mouse cu=
rsor
> > > > planes for clients that want it.
> > > >=20
> > > > Disabling the cursor planes makes some kms compositors which were b=
roken,
> > > > e.g. Weston, fallback to software cursor which works fine or at lea=
st
> > > > better than currently while having no effect on others, e.g. gnome-=
shell
> > > > or kwin, which put virtualized drivers on a deny-list when running =
in
> > > > atomic context to make them fallback to legacy kms and avoid this i=
ssue.
> > > >=20
> > > > Signed-off-by: Zack Rusin <zackr@vmware.com>
> > > > Fixes: 681e7ec73044 ("drm: Allow userspace to ask for universal pla=
ne list
> > > > (v2)") =20
> >=20
> > [...]
> >  =20
> > > > diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> > > > index f6159acb8856..c4cd7fc350d9 100644
> > > > --- a/include/drm/drm_drv.h
> > > > +++ b/include/drm/drm_drv.h
> > > > @@ -94,6 +94,16 @@ enum drm_driver_feature {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * synchronization of command submiss=
ion.
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 DRIVER_SYNCOBJ_TIMELINE=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D BIT(6),
> > > > +=C2=A0=C2=A0=C2=A0 /**
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * @DRIVER_VIRTUAL:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 *
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * Driver is running on top of virtual har=
dware. The most significant
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * implication of this is a requirement of=
 special handling of the
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * cursor plane (e.g. cursor plane has to =
actually track the mouse
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * cursor and the clients are required to =
set hotspot in order for
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * the cursor planes to work correctly).
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > +=C2=A0=C2=A0=C2=A0 DRIVER_VIRTUAL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D B=
IT(7), =20
> > >=20
> > > I think the naming here is unfortunate, because people will vonder why
> > > e.g. vkms doesn't set this, and then add it, and confuse stuff comple=
tely.
> > >=20
> > > Also it feels a bit wrong to put this onto the driver, when really it=
's a
> > > cursor flag. I guess you can make it some kind of flag in the drm_pla=
ne
> > > structure, or a new plane type, but putting it there instead of into =
the
> > > "random pile of midlayer-mistake driver flags" would be a lot better.
> > >=20
> > > Otherwise I think the series looks roughly how I'd expect it to look.
> > > -Daniel
> > >  =20
> >=20
> > AFAICT this is the only remaining thing to be addressed for this series=
 ? =20
>=20
> No, there was more. tbh I haven't had the time to think about whether the=
 above
> makes sense to me, e.g. I'm not sure if having virtualized drivers expose=
 "support
> universal planes" and adding another plane which is not universal (the on=
ly
> "universal" plane on them being the default one) makes more sense than a =
flag that
> says "this driver requires a cursor in the cursor plane". There's certain=
ly a huge
> difference in how userspace would be required to handle it and it's way u=
glier with
> two different cursor planes. i.e. there's a lot of ways in which this cou=
ld be
> cleaner in the kernel but they all require significant changes to userspa=
ce, that go
> way beyond "attach hotspot info to this plane".

> I'd like to avoid approaches that
> mean running with atomic kms requires completely separate paths for virtu=
alized
> drivers because no one will ever support and maintain it.

Hi Zack,

you'd like to avoid that, but fundamentally that really is what has to
happen in userspace for *nested* KMS drivers (VKMS is a virtual driver
but not part of the interest group here) to reach optimality.

It really is a different path. I see no way around that. But if you
accept that fact, then you could possibly gain a lot more benefits by
asking userspace to handle nested KMS drivers differently. What those
benefits are exactly I'm not sure, but I have a feeling there should be
some, where the knowledge of running on a nested KMS driver allows for
better decisions that are not possible if the nested KMS driver just
pretends to be like any other KMS hardware driver.

You can get up to some level of interoperability by pretending to be
just like any other KMS driver, but if you want to optimize things, I
feel that's a whole different story. It's a trade-off.

I think frame timing is one thing. A nested KMS driver increases
the depth of the "swapchain" between the guest KMS app and the actual
hardware. This is unexpected if userspace does not know it is running
on a nested KMS driver.

The existing KMS uAPI, both legacy and atomic, have been written for
classic hardware. One fundamental result of that is the page flip
completion event, it signals two things simultaneously: the new
framebuffer is in use, and a new flip can be programmed.
On a nested driver, these two are not the same thing: the nested driver
can take another flip before the new framebuffer is actually being used
in the host. More importantly, the nested driver can take a new flip
before the old replaced framebuffer has actually been retired.

(The above can tie into the question of making the KMS swapchain deeper
in general, also for classic scanout design, in connection to
present-not-before-timestamp queueing at KMS level.)

However, as long as these two are the same event, it can decimate the
framerate on a nested driver, because userspace is not prepared for a
swapchain depth of greater than one. Or, the nested KMS driver gives up
on zero-copy. Or, you need a fragile timing arrangement that
essentially needs to be hand-configured in at least one display system,
guest or host.

Somewhat related, there is also the matter of KMS drivers (hardware,
nested, and virtual) that do not lock their page flip events to a
hardware scanout cycle (because there is none) but "complete" any flip
immediately. That too requires explicit handling in userspace, because
you simply do not have a scanout cycle to lock on to.

We already have an example where userspace is explicitly helping
"unusual" KMS drivers: FB_DAMAGE_CLIPS. While educating userspace does
take considerable effort, I'd like to believe it is doable, and it is
also necessary for optimality. Excellent KMS documentation is key,
naturally.

Of course, it is up to you and other people to decide to want to do the
work or not. I just feel you could potentially gain a lot if you decide
to take on that fight.

> It's not a trivial thing because it's fundamentally hard to untangle the =
fact the
> virtualized drivers have been advertising universal plane support without=
 ever
> supporting universal planes. Especially because most new userspace in gen=
eral checks
> for "universal planes" to expose atomic kms paths.

That's not just userspace, it's built into the kernel UAPI design that
you cannot have atomic without universal planes.


Thanks,
pq

> The other thing blocking this series was the testing of all the edge case=
s, I think
> Simon and Pekka had some ideas for things to test (e.g. run mutter with s=
upport for
> this and wayland without support for this in at the same time in differen=
t consoles
> and see what happens). I never had the time to do that either.
>=20
> > Zack, are you planning to re-spin a v3 of this patch-set? Asking because
> > we want to take virtio-gpu out of the atomic KMS deny list in mutter, b=
ut
> > first need this to land.
> >=20
> > If you think that won't be able to do it in the short term, Bilal (Cc'e=
d)
> > or me would be glad to help with that. =20
>=20
> This has been on my todo for a while I just never had the time to go thro=
ugh all the
> remaining issues. Fundamentally it's not so much a technical issue anymor=
e, it's
> about picking the least broken solution and trying to make the best out o=
f a pretty
> bad situation. In general it's hard to paint a bikeshed if all you have i=
s a million
> shades of gray ;)
>=20
> z
>=20


--Sig_/M5oFo8/u3GbVxhsNiA4gva7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmRSEycACgkQI1/ltBGq
qqfLUw/+KaAQ6lmTQ71T/aYabS+7S2iGhAxA3z81G9QthNLS56DAdKpLdtgqxmS6
YyUMuPOIHqoPifBWsv8sh5ZEx6BMwScwixrfChSe9vq8DliHT4Q2EH2PURwcxChx
HHb63HdUrqoL/mwKqgejbFV3zwS8inOwtLe2jH1k34CMGqfaFSA/JMKrXZeWwHHQ
r9DAR9dWGgpiPGIaU8cKkQvl8lk737ES8gfQLbAboNqRHh/2jk+pSco6UKHtWFnu
dL+eokXd72Ve/Iz0Mx3GTjPDFAdh1q/NW3OLJ/4a2cw1EYFvnZ+rs/sBtiYtNXBd
KVhgio3vWvRnmBTclJMbJgp6rpe7niCkEJDOugU7zGZVPTs30xui5UUQaD72WG2/
nMoloO90Omsw7Ih0SKoRblWxyHSrH42PFw5pEZtN6hhS9dDmbim2j2R5tTipH6we
aczytg6BwCNSM6+iS3l/R3gwddd5AIIt+IkXpqSbMqENXNvKCzbX384677dIK3bn
2c5gi7UyMKx0ZgLobQTIUaWlIR5q8V0ZZFUy1M+Z/wzzdtauBST0gGDIFz+1IVp+
CPpCVj4TEi5UTtwBr3EM58a7d/v83TQmuo7HGaa/S+w7RIh3ZSLWJMcOlrPbii6q
URC75o58Msowo8y0pIEsRUNjVQ7kLgRnYs/NI/yUR3i+/7Zq0XQ=
=Xl7M
-----END PGP SIGNATURE-----

--Sig_/M5oFo8/u3GbVxhsNiA4gva7--
