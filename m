Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0612915BBC8
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 10:37:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3408C6F58C;
	Thu, 13 Feb 2020 09:37:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DB4F6E1B4;
 Thu, 13 Feb 2020 09:37:46 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id v17so5798992ljg.4;
 Thu, 13 Feb 2020 01:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=x1uTFITKhLxzVzee+k3tQ8V59oEPfPCP93q7/PxjW3s=;
 b=I4OMJuI3Nm+eJXqs8pHkLkaTsBQvDeYWIMRKp9jFQS3XP6nOjD72BNLQ0J1kgZVAHB
 Km2z6QgBEacpFpJEIiuyodgBFFZnqta94SNopy61V8G7c4WeHoCuLZ5u1hhAVtgmHGmB
 9ePbYihOD183kc4TZL2nL2VS9ifkh4nkAUQOu20zByE1ZuxrzwGlR3GlGLaVZoL5+TgI
 2H8e28XsHA9qYnfYs3M9JElg7npi6d/6IY8Xw1zyx6c0PYr+XtHRsMBEUpZzVl3bs/k+
 ljPndOoZiZ/ED2ZBqnPFcjT9l+dXyIVs4geFKKXJ1hbxnySF9I2S2279d2aos21BNCKV
 tBgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=x1uTFITKhLxzVzee+k3tQ8V59oEPfPCP93q7/PxjW3s=;
 b=YIvumFad7pshMtLfoggaSx3IZeyKDutlSxcxJOoJjLvtSjvdF1eGSeqtESFwhaElhf
 1YmZwIGfKx6yWUmo/SmyjlfV5wPUQsCDS9e7VYRgGX48QhJG36vy7CVRsMddtuXH+BT4
 hMhzp1/YIDV3UxDXQnFzXRaNPKfrOy9Id9Qg80w7mmxeYdenOsZ6ILC8ePzEhDni2yYZ
 geKhtw6KtC4m04tWMkIcIFGoKDCd6jeFNu+thezKjJUMOrwWyBFusGlHWYQC9nJTNMnq
 d6MIZD73HRX605nIUaqKI+0Og8nIrcr+LB7ZPDGUjpfBgx4Ka+B6qpIiqkUMDwShnXE4
 NbnQ==
X-Gm-Message-State: APjAAAUpd9YC4ENGRpQ0UMmFYXqX3J4eCYcsw3HsblUB+JCtTs6I2QH/
 H0V8KspI6fOTnrywTuiDzkA=
X-Google-Smtp-Source: APXvYqzIYE2WKOubneNRJiahMwmdQ/HXGAhodg4hWIQI5vknFxHJAHcCeKRyHDKx7f0X+AOBQIVYlA==
X-Received: by 2002:a05:651c:1bb:: with SMTP id
 c27mr10930475ljn.277.1581586664785; 
 Thu, 13 Feb 2020 01:37:44 -0800 (PST)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id g15sm1060755ljl.10.2020.02.13.01.37.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 01:37:44 -0800 (PST)
Date: Thu, 13 Feb 2020 11:37:40 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Xiaowen Wu <wxiaowen@codeaurora.org>
Subject: Re: backend-drm and scanning really large resolutions
Message-ID: <20200213113740.07af1263@eldfell.localdomain>
In-Reply-To: <20d5d2e0af60ca486fc31fb09e6f4aa4@codeaurora.org>
References: <20d5d2e0af60ca486fc31fb09e6f4aa4@codeaurora.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 wayland-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1249462657=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1249462657==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/6wt5tjYq/+7Vt=rtZK6e6ou"; protocol="application/pgp-signature"

--Sig_/6wt5tjYq/+7Vt=rtZK6e6ou
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Adding Rob back in CC, I don't know if he is subscribed to
wayland-devel@. You forgot to CC dri-devel@ too.


On Tue, 11 Feb 2020 17:18:52 -0500
Xiaowen Wu <wxiaowen@codeaurora.org> wrote:

> Hi Rob,
>=20
> If the vendor driver doesn't have the hwpipe sub-object and kms plane is=
=20
> one-to-one mapped to hwpipe (sspp),
> do you think if below approach is acceptable if we still want to=20
> virtualize the kms plane to support 4K/8K scanout?
>=20
> 1. At kms atomic check before calling drm_atomic_helper_check, depending=
=20
> on scanout width of plane A in state, add idle planes B (C,D,...)
> into the same atomic state, backup and then modify=20
> src_x/src_w/crtc_x/crtc_w of plane A and the affected planes B (C,D,...)=
=20
> to meet scanout
> width limits, and set crtc/fb of the affected planes B (C,D,...) same as=
=20
> plane A.
>=20
> 2. At plane's state duplicate function, check if plane's=20
> src_x/src_w/crtc_x/crtc_w are updated at step 1), if so revert the=20
> change to
> plane A's backup value to allow plane A's scanout to update again. These=
=20
> value will again be updated in step 1) so nothing really changes
> if plane A continues updating.
>=20
> 3. If plane A's scanout is updated or detached from crtc, detach=20
> affected planes B (C,D,...) in the same atomic state in step 1) and then=
=20
> run step 1) again.
>=20
> 4. If user want to commit plane B (C,D,...), the commit/test will fail=20
> if planes are already used as sister plane of plane A. This failure is=20
> same
> as insufficient hwpipe from plane B (C,D,...).
>=20
> With above change, any downstream driver can support virtualized plane.=20
> Also as the above approach is generic and not h/w specific, we can make
> it a helper function and it's up to vendor to choose if they want to use=
=20
> or not, if they don't have logic like drm/msm/disp/mdp5/mdp5_plane in
> their downstream driver.
>=20
> Conceptional above changes didn't borrow hwpipe resources from other=20
> plane but borrow planes themselves directly, however from user point of=20
> view
> they should not feel any difference.
>=20
> What do you think?
>=20
> BR,
> Xiaowen Wu
>=20
>=20
> On Tue Jan 21, 2020 at 4:12 PM Rob Clark <robdclark at gmail.com> wrote:
> > On Fri, Jan 17, 2020 at 8:52 AM Matt Hoosier <matt.hoosier at  =20
> > gmail.com> wrote:
> >>=20
> >> Hi all,
> >>=20
> >> I'm confronting a situation where the hardware with which I work is=20
> >> capable of driving connectors at 4K or 8K, but doing so requires=20
> >> bonding the scanning of multiple planes together.
> >>=20
> >> The scenario is that you'd have a big primary framebuffer whose size=20
> >> is too large for an individual hardware scanning pipeline on the=20
> >> display controller to traverse within its maximum allowed clock rate.
> >>=20
> >> The hardware supplier's approach is to assign multiple planes, which=20
> >> in the KMS driver map to hardware scanning pipelines, to each be=20
> >> responsible for scanning a smaller section of the framebuffer. The=20
> >> planes are all assigned to the same CRTC, and in concert with each=20
> >> other they cover the whole area of the framebuffer and CRTC.
> >>=20
> >> This sounds a little bit wild to me. I hadn't been aware it's even=20
> >> legal to have more than one plane treated a the source of scanout for=
=20
> >> a single framebuffer. Maybe that distinction isn't really relevant=20
> >> nowadays with universal plane support.
> >>  =20
> >=20
> > fwiw, have a look at drm/msm/disp/mdp5/mdp5_plane, which will allocate
> > one or two hwpipe's from the devices global atomic state, depending on
> > scanout width.. the hwpipe (sspp) is the physical resource behind a
> > plane, so essentially the kms planes are virtualized.  At some point
> > if you have too many wide layers, the atomic test step will fail due
> > to insufficient hwpipe's.  But this sort of scenario is the reason for
> > the test step.
> >=20
> > BR,
> > -R
> >  =20
> >> I'm wondering if anybody here knows whether this a legit approach for=
=20
> >> a compositor's DRM backend to take?
> >>  =20
> _______________________________________________
> wayland-devel mailing list
> wayland-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/wayland-devel


--Sig_/6wt5tjYq/+7Vt=rtZK6e6ou
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl5FGOUACgkQI1/ltBGq
qqdNqRAApfGEmOL9ghGVz2cJ0gOIYrodZiWFryKQ4IUeXEnViBdIHdXDb3TDnjcq
Ka0nBiX7I6f+z3eKV9vNj60ttvd9sktLfIWqm/znQXYuRJaU2En3PKxTVWOS8/fq
RsIqlkeBMLT8+z8HhT66MrJuMxteyYIHS/SiqUlqnxlvXDYiB/dmvD+Ux5yzV1Zi
XzEO8WdeKHccLrQmJT1kZXP2GPqsIQE7hlQkLj32k+07x5c3U5JvONnjkfUPgIa8
zPgGesQ+pV2WKrmf66HWW+WLF1zpE1cNT0AJtDcEdeaJtPGQOr/3i6Quc8d7GhZt
OD6NoPvH2GMgxdo3cdf7XGKXvJLBF6D/GXa2h4idLKoaRgr2tkEx1EfGt4QaDcdX
Vir5RTwruglptqu7vlKhi4RgHnoBoPcutvXQhIwvNb2BmbhZFAJRCcwDz042bvQG
sR1avVqVz6PC59eimGh0Ogv7ftTS6H55aM0zdcRbAxyDTO/YB04s8RWBp0cmfVFN
Nyk2JKIOyqOoZ+Tq2REq9doKzN9Q1pBOz/0eKm7TfMGRwIsbxYtQpRFTzda8Safm
584pT3OFkM7oVbhvG7LuleOop4T9tF4cnEodTxEYjOiap39SXoh7baFXcXpSjdMY
vfNLyoVJDqEDemF+mMiDM14J+Z/9Y2GFm07beB+xJo0s7sY49xE=
=sfYA
-----END PGP SIGNATURE-----

--Sig_/6wt5tjYq/+7Vt=rtZK6e6ou--

--===============1249462657==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1249462657==--
