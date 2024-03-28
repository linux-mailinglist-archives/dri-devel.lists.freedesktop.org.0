Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DDB88FCC3
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 11:18:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA7D610ECBD;
	Thu, 28 Mar 2024 10:18:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rcPQ9Qyn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A2B710ECBD;
 Thu, 28 Mar 2024 10:18:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DAA7C60670;
 Thu, 28 Mar 2024 10:18:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D80EC433C7;
 Thu, 28 Mar 2024 10:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711621134;
 bh=fllq40obke4yqmFFH/hGjhHGyAfQokx4uFEG/x3BhtE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rcPQ9Qynni8fz9X4waD3XEQuC3TBb59cX/QCxy82usfAKOhzvj4v2pe5SGQi/+l87
 f/NmRhWwqyp5X775DPbkx/rjnWv3CEDLFRjyJqiaOgBWC/K6FBcZ1Ze2m54vceKUn+
 vtp08QMbRcfDH+eRer3Rm/BKVxbHnksrXleG+FGCUsf4ELL7oc0ynz9floguu+wUMv
 uvB3bXRCyiQs1PyhUdPsBuPgUHg3jXOSA8svMGMh8ppCcxkbUTZY7gamm3xqJlO5DI
 z2oa7L91udPTPjDyMY1/NbdcT5faUq41AD0ptjrKj/m1581NNMTPCvqvYCG4a7AuZx
 bfjY841r65seQ==
Date: Thu, 28 Mar 2024 11:18:51 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Dave Airlie <airlied@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Alon Levy <alevy@redhat.com>, 
 Frediano Ziglio <fziglio@redhat.com>, virtualization@lists.linux.dev, 
 spice-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
 Colin Ian King <colin.i.king@gmail.com>
Subject: Re: [PATCH 1/2] drm/qxl: remove unused `count` variable from
 `qxl_surface_id_alloc()`
Message-ID: <20240328-quantum-bettong-of-contentment-7c7841@houat>
References: <20240327175556.233126-1-ojeda@kernel.org>
 <CANiq72=kGWSQR7TgKDnAaef+FS3VGQeo3ri5vv1wxpW_88vdqA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ciytvnzm6i4uvloj"
Content-Disposition: inline
In-Reply-To: <CANiq72=kGWSQR7TgKDnAaef+FS3VGQeo3ri5vv1wxpW_88vdqA@mail.gmail.com>
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


--ciytvnzm6i4uvloj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 27, 2024 at 07:14:12PM +0100, Miguel Ojeda wrote:
> On Wed, Mar 27, 2024 at 6:56=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> w=
rote:
> >
> > Closes: https://lore.kernel.org/lkml/CANiq72mjc5t4n25SQvYSrOEhxxpXYPZ4p=
PzneSJHEnc3qApu2Q@mail.gmail.com/
>=20
> Should have a [1] at the end.

I added it while committing

> > Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> > ---
> > Given there is a loop going on here, it would be good to double-check w=
hether
> > this variable was supposed to be used for something useful or if it was=
 just a
> > remnant of a version previous to v1.4.
>=20
> Also, I see Nathan sent meanwhile a message about these two that were
> also mentioned/reported a while ago [1].

"a while ago" here being 2 hours before your message :)

I've added a Closes tag for that report too.

I've applied both patches to drm-misc-fixes, thanks!
Maxime

--ciytvnzm6i4uvloj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZgVECwAKCRDj7w1vZxhR
xUBYAQC+f5qGWArfgMTJlTCdd+YDHQUdIGEO8Z0XTD7rNl0dAwD/d/mmblBxzwbp
0MrWW5gDzAsnFQV6rh7iIpJtTC8MyAs=
=4QIQ
-----END PGP SIGNATURE-----

--ciytvnzm6i4uvloj--
