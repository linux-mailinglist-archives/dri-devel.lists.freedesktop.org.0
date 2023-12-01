Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2BD8007BF
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 10:57:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31B4410E834;
	Fri,  1 Dec 2023 09:57:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9108310E832
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 09:57:16 +0000 (UTC)
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested) (Authenticated sender: pq)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id E2C3F66028F5;
 Fri,  1 Dec 2023 09:57:13 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1701424635;
 bh=PdPq0DB/c6iOx69HlAQ2be1/MewAImn65LjY2QpKCFY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jNXQgo2dpIXE72796wTfVzD5hmiKn76moO9e26J3IOH8lnsdi75U+reb9Uh5I4kQd
 f154rmmN6A+UdBXnSVQGJnc4fWwy9tNLigvu7JFK9AEskeuDPC+qvdkUUgnM5KLSVi
 jdnDTYf9hhCOV+ki95OjIBMpRx49bpT3xuhTAiQEqQTb1t225OXFEg2lxIEsmRUS0x
 XvFCdzel9bTlHJHK7LwZh6Y+gUpg11cxE9wqhXnGJKZ7wiLE0RCuJ9OLlPQQDPEulO
 dxaIGSkVz6pp7GaoJ/yEwVE5rAY4K2HPKaRueEMTV8aNaPNmHDeCXhuqxSAlC0jvhV
 O4LKW47TYHgFw==
Date: Fri, 1 Dec 2023 11:57:09 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/doc: Define KMS atomic state set
Message-ID: <20231201115709.61c0817e.pekka.paalanen@collabora.com>
In-Reply-To: <40gonZRoP7FjDn_ugL_LpXsqwoSCZtypIe7jiWg0t8lkTx94-gESc60Cuu5eWxivJoZCNg3i-cUG9kNpKQZeYdCJPawDpTSIXivJ_t_a87E=@emersion.fr>
References: <20231130200740.53454-1-andrealmeid@igalia.com>
 <40gonZRoP7FjDn_ugL_LpXsqwoSCZtypIe7jiWg0t8lkTx94-gESc60Cuu5eWxivJoZCNg3i-cUG9kNpKQZeYdCJPawDpTSIXivJ_t_a87E=@emersion.fr>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Usvah.9E_GuBxISP7sKNNvI";
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
Cc: Maxime Ripard <mripard@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 =?UTF-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
 'Marek =?UTF-8?B?T2zFocOhayc=?= <maraeo@gmail.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <michel.daenzer@mailbox.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Randy Dunlap <rdunlap@infradead.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/Usvah.9E_GuBxISP7sKNNvI
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 01 Dec 2023 09:31:23 +0000
Simon Ser <contact@emersion.fr> wrote:

> Thanks for writing these docs! A few comments below.
>=20
> On Thursday, November 30th, 2023 at 21:07, Andr=C3=A9 Almeida <andrealmei=
d@igalia.com> wrote:
>=20
> > +KMS atomic state
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +An atomic commit can change multiple KMS properties in an atomic fashi=
on,
> > +without ever applying intermediate or partial state changes.  Either t=
he whole
> > +commit succeeds or fails, and it will never be applied partially. This=
 is the
> > +fundamental improvement of the atomic API over the older non-atomic AP=
I which is
> > +referred to as the "legacy API".  Applying intermediate state could un=
expectedly
> > +fail, cause visible glitches, or delay reaching the final state.
> > +
> > +An atomic commit can be flagged with DRM_MODE_ATOMIC_TEST_ONLY, which =
means the =20
>=20
> It would be nice to link DRM_MODE_ATOMIC_TEST_ONLY to the actual docs her=
e.
> This can be done with markup such as:
>=20
>     :c:macro:`DRM_MODE_ATOMIC_TEST_ONLY`
>=20
> Same applies to other #defines.
>=20
> > +complete state change is validated but not applied.  Userspace should =
use this =20
>=20
> I'd s/should/can/ here, because there are valid cases where user-space do=
esn't
> really need to test before applying. Applying a state first validates it =
in the
> kernel anwyays.

Those cases a very much an exception. If you want to explain in what
cases testing is not necessary, that's fine to add, but without it I do
want to always recommend testing first. There is no harm in testing too
much, but there is harm in not testing which implies that there is
likely no fallback either. Without fallbacks, the kernel developers
have less room to change things, and the userspace itself is probably
too fragile to be generally useful.

Or, if you think this concern is moot, then why would userspace ever
use testing?

However, I have understood from past kernel discussions that userspace
really does need to test and fall back on test failure in almost all
cases. Otherwise userspace becomes too driver/hardware dependent.

In general, I think recommending best practices with "should" is a good
idea.

> > +flag to validate any state change before asking to apply it. If valida=
tion fails
> > +for any reason, userspace should attempt to fall back to another, perh=
aps
> > +simpler, final state.  This allows userspace to probe for various conf=
igurations
> > +without causing visible glitches on screen and without the need to und=
o a
> > +probing change.
> > +
> > +The changes recorded in an atomic commit apply on top the current KMS =
state in
> > +the kernel. Hence, the complete new KMS state is the complete old KMS =
state with
> > +the committed property settings done on top. The kernel will try to av=
oid
> > +no-operation changes, so it is safe for userspace to send redundant pr=
operty
> > +settings.  However, not every situation allows for no-op changes, due =
to the
> > +need to acquire locks for some attributes. Userspace needs to be aware=
 that some
> > +redundant information might result in oversynchronization issues.  No-=
operation
> > +changes do not count towards actually needed changes, e.g.  setting MO=
DE_ID to a
> > +different blob with identical contents as the current KMS state shall =
not be a
> > +modeset on its own. As a special exception for VRR needs, explicitly s=
etting
> > +FB_ID to its current value is not a no-op. =20
>=20
> I'm not sure talking about FB_ID is the right thing to do here. There is
> nothing special about FB_ID in particular. For instance, setting CRTC_ID =
to the
> same value as before has the same effect. Talking specifically about FB_I=
D here
> can be surprising for user-space: reading these docs, I'd assume setting
> CRTC_ID to the same value as before is a no-op, but in reality it's not.

Whoa, I never knew that! That's a big surprise!

People have always been talking only about FB_ID so far.

> Instead, I'd suggest explaining how referencing a plane/CRTC/connector in=
 an
> atomic commit adds it to the new state, even if there are no effective pr=
operty
> value changes.

So, if a CRTC object is pulled into drm_atomic_state(?) at all, on VRR
it will trigger a new scanout cycle always, avoiding the front porch
timeout?

Yikes.

> > +A "modeset" is a change in KMS state that might enable, disable, or te=
mporarily
> > +disrupt the emitted video signal, possibly causing visible glitches on=
 screen. A
> > +modeset may also take considerably more time to complete than other ki=
nds of
> > +changes, and the video sink might also need time to adapt to the new s=
ignal
> > +properties. Therefore a modeset must be explicitly allowed with the fl=
ag
> > +DRM_MODE_ATOMIC_ALLOW_MODESET.  This in combination with
> > +DRM_MODE_ATOMIC_TEST_ONLY allows userspace to determine if a state cha=
nge is
> > +likely to cause visible disruption on screen and avoid such changes wh=
en end
> > +users do not expect them.
> > +
> > +An atomic commit with the flag DRM_MODE_PAGE_FLIP_ASYNC is allowed to
> > +effectively change only the FB_ID property on any planes. No-operation=
 changes
> > +are ignored as always. Changing any other property will cause the comm=
it to be
> > +rejected. Each driver may relax this restriction if they have guarante=
es that
> > +such property change doesn't cause modesets. Userspace can use TEST_ON=
LY commits
> > +to query the driver about this. =20
>=20
> This doesn't 100% match reality at the moment, because core DRM now rejec=
ts any
> async commit which changes FB_ID on a non-primary plane. And there is no =
way
> for drivers to relax this currently.
>=20
> I'm not sure this is a good place to state such a rule. In the end, it's =
the
> same as always: the kernel will reject commits it can't perform.
> DRM_MODE_PAGE_FLIP_ASYNC does not need to be a special case here. Even wh=
en
> changing only FB_ID, the kernel might reject the commit (e.g. i915 does i=
n some
> cases).

I think the paragraph is good to drop here, if it's documented in a
more appropriate place.


Thanks,
pq

--Sig_/Usvah.9E_GuBxISP7sKNNvI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmVprfUACgkQI1/ltBGq
qqdwBw/8DbQXXFIcSV5Jo6udnUvuEyhBA/dpYBwUDy+51gWJYkow2yq7LD6ljNYZ
+F3wXthzTD82gfs4pMjiAzCnGG3mktAEJd+jpsOQ8yEMiw7HNCMLVognXrjkKJcU
GkXAh7gqIRHrcJsebRR+R42KMlih0degXVhxv7IyrIQWPYzzM9dopkJs+gUZygeh
TH2hDAPnYDuP4PIDI20ZsujgfxUWQDdVnuKilJv14jZ9RbpTUVkPV6XWC4lvEyrv
un+pLBrtWSg6kjC20x5hYMsLmJkEiRJEjfiXwZSW7eaxvlQkw5CVlGS07C7XQ4db
xWsPzh1tW+bewbOFOQ7LLxHnJSAMEAThvimd9Zk1cpd9ngnvyZdBL8HNcvY7Wah2
T0srMSn1ELxjaimgSWRtWFuGBHKcOgnRsBFNoYT91Olw8ScFUbb8sYKOL30zNNw+
8FYy8h8M/ATos3Ut7cu+T66117QuJWeZoEEqe4vDURXxFPKYQiupP44VUWa6KOih
l61TuIMbO6eXnwhvjBXCYVhJDwob24wgUfA7Ai2nrgMTzMgzR1hWUTUMsjpZL1At
mdVrSLsTBPsIiHTin3YtKbFmcAJfr1aVSTfY+/gLy1FpDbfyqZn1Rw2Bm9+SvoSz
763rCp8JxvliCk6KwfUXEtCcFoGwEGWL6ZCOA2iFgOmc99vonps=
=WyN9
-----END PGP SIGNATURE-----

--Sig_/Usvah.9E_GuBxISP7sKNNvI--
