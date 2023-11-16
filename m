Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2687EE428
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 16:25:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ACCD10E61B;
	Thu, 16 Nov 2023 15:25:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45F1610E61B
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 15:25:04 +0000 (UTC)
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested) (Authenticated sender: pq)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 2C8D8660734B;
 Thu, 16 Nov 2023 15:25:02 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1700148302;
 bh=KNKzR3AdYrcGsgvQ5hgYYumtewtEY9oprWir7jRod8g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XpByk+9s2bMzN6tEhHw2hV3ZhOTZv75dbBTGs5kkodE7sKIJ/UfYba760FJMlslJt
 jTrIQ+oly4RL5rdtaq4FOaAwmhGeH3529NWB5bRE7hf0bByZxumt6CHs8p6NfIgueb
 LBMye/6AXul0maQC+Zh95pS1tkTT1a+CY9uG7nKFPEyE9xrLwnOs5DkO7ZNmfOrGby
 WBF6FPebu57JNPEv44eUAEa9imsooyqANlfhrzxknp21PcZ27ZsPOiEcQ+0zhIK1m7
 I3u+9ppp++pTQNAHj0+cwK83tXhuYeCd5MMZPui7S/vuX2gIhhJjBtbXA/AlMxtAfk
 B7DpNTeXuzhtA==
Date: Thu, 16 Nov 2023 17:24:51 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 4/5] drm/plane: Extend damage tracking kernel-doc
Message-ID: <20231116172451.00a7ec9e.pekka.paalanen@collabora.com>
In-Reply-To: <3b799dee-c366-4c0b-9efe-c75d189fc24b@suse.de>
References: <20231115131549.2191589-1-javierm@redhat.com>
 <20231115131549.2191589-5-javierm@redhat.com>
 <abfd41c7-dc9f-4cd3-be83-97b2c2c96b62@suse.de>
 <vhshocGSkXgVLycHIcJIVPsN9OQokPA2NCgIBqOvIzpKRZXQjN1uEiFKVudwa-S4hpBnFPaxxYh8hCFxd-u_ahYKBamQxFzIhBkYGkND9Kc=@emersion.fr>
 <3b799dee-c366-4c0b-9efe-c75d189fc24b@suse.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/j+uUmYK70pFZfFAf/9klwKl";
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
Cc: Bilal Elmoussaoui <belmouss@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Sima Vetter <daniel.vetter@ffwll.ch>,
 Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/j+uUmYK70pFZfFAf/9klwKl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 16 Nov 2023 13:34:07 +0100
Thomas Zimmermann <tzimmermann@suse.de> wrote:

> Hi
>=20
> Am 16.11.23 um 13:14 schrieb Simon Ser:
> > On Thursday, November 16th, 2023 at 13:06, Thomas Zimmermann <tzimmerma=
nn@suse.de> wrote:
> >  =20
> >>> + * Note that there are two types of damage handling: frame damage an=
d buffer
> >>> + * damage. The type of damage handling implemented depends on a driv=
er's upload
> >>> + * target. Drivers implementing a per-plane or per-CRTC upload targe=
t need to
> >>> + * handle frame damage while drivers implementing a per-buffer uploa=
d target
> >>> + * need to handle buffer damage.
> >>> + *
> >>> + * The existing damage helpers only support the frame damage type, t=
here is no
> >>> + * buffer age support or similar damage accumulation algorithm imple=
mented yet.
> >>> + *
> >>> + * Only drivers handling frame damage can use the mentiored damage h=
elpers to =20
> >=20
> > Typo: mentioned
> >  =20
> >>> + * iterate over the damaged regions. Drivers that handle buffer dama=
ge, need to
> >>> + * set &struct drm_plane_state.ignore_damage_clips as an indication =
to
> >>> + * drm_atomic_helper_damage_iter_init() that the damage clips should=
 be ignored.
> >>> + * In that case, the returned damage rectangle is the &drm_plane_sta=
te.src since
> >>> + * a full plane update should happen.
> >>> + *
> >>> + * For more information about the two type of damage, see:
> >>> + * https://registry.khronos.org/EGL/extensions/KHR/EGL_KHR_swap_buff=
ers_with_damage.txt
> >>> + * https://emersion.fr/blog/2019/intro-to-damage-tracking/ =20
> >>
> >> One thought you might want to consider.
> >>
> >> These URLs are helpful. The only issue I have is that frame damage and
> >> buffer damage are user-space concepts. The kernel bug is that damage
> >> handling expects the backing storage/upload buffer not to change for a
> >> given plane. If the upload buffer changes between page flips, the new
> >> upload buffer has to be updated as a whole. Hence no damage handling t=
hen. =20
> >=20
> > Why would these concepts be specific to user-space? The kernel could
> > better handle buffer damage instead of forcing full damage, by doing
> > something similar to what user-space does. =20
>=20
> The terms 'frame damage' and 'buffer damage' do not exist in the kernel.=
=20
> The problem can be better described in wording that is common within the=
=20
> context of the kernel drivers.

What terms does the kernel use for these two different concepts of
damage?


Thanks,
pq

--Sig_/j+uUmYK70pFZfFAf/9klwKl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmVWNEMACgkQI1/ltBGq
qqd06RAAhfgSXquqYQp3UhAgvMrBtAt6PmgvhPU6+C+e8YHBIV6Q2GlLzHEAidAG
d0Hm1lxUIjGFtu9GC5wkPcIMR5UWYCCF4E3RGJrmWGs2IXYeR0tfpWVH2Wdb4KAg
oisO5yllQmhzuSixwK9QKkiCzpemaT5MNAIXLtGz6+u626kkTRzHuAoRwLhZOznF
K7xgm9Sx3kBAA0gBf6APAht+QRcjsZWI5fBu3RC2w20BXP137AtUAZdBbMV4KzpX
UNrkpAuxmMXvxjQP+PhHaJw2PaKgOi9gGSVZ6hL4wdmEoe9Y/Lyexvw0VAekrCbb
klXn+WRZWd094v2DjDkYputfWOX06h4eVupBd2DMiv/XXSe6g0hINIotp9uZg0IT
YeiR9nQE+HID99kRn5EZfw/R7WtVgT42IY7LCQfrPeq9CnqtrFG14lSFeloQwOGf
N+Oj3y0oiKzD4osuOn6sgJMWVGf+KVIKWzAq4E45UWBgi7ch8vNC7SLmyXILeqDT
stxQ2WhaLnF4lBYDVo7k2Bo93TqnOvWQfZoyA6cLaMPYjfOR7QqiCvJKG2vv7gob
1Z5FWHIyWeHPlu+f6FKTAJ3N9stSlV1tmSPVtCJ/JXuhOjqxVyYMYxROKjQ7Z7BE
Ir2Mp/FSZ3X5dEcyQwEP7Y4XMduiVBf7HEaRSacNmU5Sae0jSGc=
=AFrP
-----END PGP SIGNATURE-----

--Sig_/j+uUmYK70pFZfFAf/9klwKl--
