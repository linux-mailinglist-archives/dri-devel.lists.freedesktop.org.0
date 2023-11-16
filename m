Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 171257EDD84
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 10:21:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96C7E10E257;
	Thu, 16 Nov 2023 09:21:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5989210E255
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 09:21:05 +0000 (UTC)
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested) (Authenticated sender: pq)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 594036607337;
 Thu, 16 Nov 2023 09:21:03 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1700126464;
 bh=EKb5mjUvI6GYf6RTMmKQvl6BYz+R65vKj0PGe7EYqY0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iQgbqLoDLSh5kczTuOEuRiaKb3C0qaRQCyxz/Zq2OeJ2Wip5bOiwco44b/1qZYw4T
 eLj69aABTjhYVttVovqfx9kT/u2ifGppNWBs9N+zY/iMzcU8Q+lxJo2vq1Y8ADQBC+
 u8JWqEo8I722GbNfzGjx87vY+0PtbfrArqxUXoXWIch3ySNlFMjtYTvwwjLHIIxlny
 EKGEXRnUlVvgmAfgflDanqtxKS8SFcL+NBaRRb1faArI+FzgLDhaXAg8RmLerjN1lO
 EsOME+Dbz0/782SdiGm1D7vTZFFtX0FiO9QEa3jPseezZLQZ9gWuKAP5YAbXTF88Nm
 aq5LqaZVMaemQ==
Date: Thu, 16 Nov 2023 11:20:52 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH 2/6] drm: Add
 drm_atomic_helper_buffer_damage_{iter_init, merged}() helpers
Message-ID: <20231116112052.16d4d234.pekka.paalanen@collabora.com>
In-Reply-To: <87zfzg5nif.fsf@minerva.mail-host-address-is-not-set>
References: <20231109172449.1599262-1-javierm@redhat.com>
 <20231109172449.1599262-3-javierm@redhat.com>
 <6e663e37-b735-47f7-a841-fa0f93fdddaf@suse.de>
 <87zfzg5nif.fsf@minerva.mail-host-address-is-not-set>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2sUMloWcoyab3bwki.cTd8D";
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
Cc: Maxime Ripard <mripard@kernel.org>,
 nerdopolis <bluescreen_avenger@verizon.net>,
 Sima Vetter <daniel.vetter@ffwll.ch>, Bilal Elmoussaoui <belmouss@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 stable@vger.kernel.org, Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/2sUMloWcoyab3bwki.cTd8D
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 14 Nov 2023 17:05:12 +0100
Javier Martinez Canillas <javierm@redhat.com> wrote:

> Thomas Zimmermann <tzimmermann@suse.de> writes:
>=20
> > Hi
> >
> > Am 09.11.23 um 18:24 schrieb Javier Martinez Canillas: =20
>=20
> [...]
>=20
> >>   	struct drm_rect src;
> >>   	memset(iter, 0, sizeof(*iter));
> >> @@ -223,7 +224,8 @@ __drm_atomic_helper_damage_iter_init(struct drm_at=
omic_helper_damage_iter *iter,
> >>   	iter->plane_src.x2 =3D (src.x2 >> 16) + !!(src.x2 & 0xFFFF);
> >>   	iter->plane_src.y2 =3D (src.y2 >> 16) + !!(src.y2 & 0xFFFF);
> >>  =20
> >> -	if (!iter->clips || !drm_rect_equals(&state->src, &old_state->src)) {
> >> +	if (!iter->clips || !drm_rect_equals(&state->src, &old_state->src) ||
> >> +	    (buffer_damage && old_state->fb !=3D state->fb)) { =20
> >
> > I'd assume that this change effectivly disables damage handling. AFAICT=
=20
> > user space often does a page flip with a new framebuffer plus damage=20
> > data. Now, with each change of the framebuffer we ignore the damage=20
> > information. It's not a blocker as that's the behavior before 6.4, but=
=20
> > we should be aware of it.
> > =20
>=20
> Yes, which is the goal of this patch since page flip with a new framebuff=
er
> attached to a plane plus damage information can't be supported by drivers
> that do per-buffer uploads.
>=20
> This was causing some weston and wlroots to have flickering artifacts, due
> the framebuffers being changed since the last plane update.
>=20
> For now it was decided with Sima, Simon and Pekka that is the best we can
> do and the reason why I add a TODO in patch #6.
>=20

Hi all,

this made me thinking...

The per-buffer damage accumulation that would be needed is per
upload-buffer, not per KMS FB from userspace. So it should not make any
difference whether userspace flips to another FB or not, the damage
will need to be accumulated per upload-buffer anyway if the driver is
flipping upload-buffers, in order to make the upload-buffer fully
up-to-date.

Why was that not more broken than it already was?

Is there a fixed 1:1 relationship between userspace KMS FBs and the
driver upload-buffers?

Userspace is already taking care that the KMS FB is always fully
up-to-date, FWIW, so the kernel can certainly read areas outside of
FB_DAMAGE_CLIPS if it wants to.


Thanks,
pq

--Sig_/2sUMloWcoyab3bwki.cTd8D
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmVV3vQACgkQI1/ltBGq
qqfB+A/+JFbdvfCh1ktxeGlmnuTRro8T3ArktRR8nAvkOnl31N41atMY/TacQZUO
oEwmgdxyqbjs0tTw7UH5OON051w/GtistMNhXJ0KPoHrrUfUca7wl4XG8FZ9BPAd
PzH1/paWneZWPe45/TkaMJE8HtZOjpuGQo61BLcCqo00fJCQ3G+QJ4JMixTuLJzL
Gtsx0RzXTxiwiDUInKbJwj0UIoNlHle3AA/xOShGYe8eTLsfmr7u1OG0BGtwPVSu
1IImxt/kH41g9/IFtMTqECxS0kILGGVMfJFpf/BnNf8pBXTwFf3kYz3Um6pXrnHD
GcfVkytMbIBf6P9bFvfZvZhlv1BtcIbW9QQTzCFqs63qyg75xkGjbo0zC9hUaGl1
8or7w5++ItvKF/KZJdD3uT38lgULaTgGFnO/AZfxzzOj3ueF+tmeMWzdGvKGWB7j
PbhCf4to71fcdkgUxTZ0YvQNvltXu52IFNYVvoW0bV27ZSh6K8XbRSSA9qqG9vBv
qPA5YDQf203/VaaFZCbzci7iwB3Zx4qMqhGNfvuO1UAyGG2ZPXchBE3d5hrJh6s5
A6E//IAWkaewj2E3bGitv8GI0xvn3m4q0BAMqRTgvMKe6Jy8I5xTxVzJSQGBxF5f
Mo2GaxdAnudxL0NkCGDn4HhvZJZvx/WJanI7Konp5An66OQrqD8=
=iWrr
-----END PGP SIGNATURE-----

--Sig_/2sUMloWcoyab3bwki.cTd8D--
