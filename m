Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 452431EB6A4
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 09:39:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A6236E356;
	Tue,  2 Jun 2020 07:38:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4E0B6E088
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jun 2020 07:38:57 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id 9so9880150ljc.8
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jun 2020 00:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=FyY9g3rE6d7jeI4oMwjordBGJw88y+ZoYd2bE3N1PPU=;
 b=OVBFXHtdP9Xv2na5YDE7Nyno+ULA/rufSgq+rSFa8XMfDtQG4WT7fM7XkxWXjIFyg9
 8pwXXEP8U4HHYHSI3LiNLr5UOdQQDRpjVnPJAurHr6cRSgXJoD1UQ38MTcZZZiuUHpZF
 J142mnFxNH/CYJo6UAq1mQ+B93uXRtjHf4RJA0AWuuPVYrQJiYCy0ZTcdZWfcQzvm6Lw
 PDsg1/eUlYlGi3LINzeJ0NTAYG0490DJQx23zkd3D7mzElJm05UWA3mAf41HMYy0epUT
 d8ZSzA8F86sIQcg+4GOW4nQZ17k3HwxGnZxyvlemXt+JQIT/vGvIuSuS/IdbvoYtNt/p
 89Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=FyY9g3rE6d7jeI4oMwjordBGJw88y+ZoYd2bE3N1PPU=;
 b=FtduOar/EZribgn2W76SfnWEWke+C8tLR8Zm5FEkJhH5f5W375uG6CAXUWQjIPMCg9
 8NoyPCS7a3NTK5O0rBPexz6wA+6G9aFfVMepL7WdqMuNH/XHbCCpyfyhFFtueTGeef0l
 VAbeSmPUrtEtDiPgfwhj2g6oKGUbr52X/bCdHzUo//X96zP8UaDdtcrBXUOCuT04/w1V
 uBpWQCQU3QmTc759lQj6iAqvGJAIp2NjROpZnpwSDR0Zpn2icX425qp/tXrcP3NloZQ8
 s4+GiMy/6S7Gj63KG/Y+v/ssol+YqW/yOIUhA0JNb0CWBXcJrcFcnPYKxHfjjtTN/XSD
 U6iA==
X-Gm-Message-State: AOAM531XJKJFehr+R49N+7eMaoDltLIUrWWkrAwdwwlQOLLlGAtnAoyG
 MrdgTu0REiPvdSIf1s0x/JY=
X-Google-Smtp-Source: ABdhPJya1vhH6fozbFYsuo08HkXGMVKB6L9j93PBjrYnaFAipOTxGejI1tKDSsiopZnTzU7AqGLwKg==
X-Received: by 2002:a05:651c:1195:: with SMTP id
 w21mr4876686ljo.464.1591083536084; 
 Tue, 02 Jun 2020 00:38:56 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id m11sm491548lfl.70.2020.06.02.00.38.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 00:38:55 -0700 (PDT)
Date: Tue, 2 Jun 2020 10:38:46 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: document how user-space should use link-status
Message-ID: <20200602103846.5c38d080@eldfell.localdomain>
In-Reply-To: <krnCwRP0UCcVJbY-8ILP_gEFf4EaUdKPSuuHisFkphFaoOl2EAnU032oOWAeJi2xlsFsA7qeR8lypXs71-SoULZnd2gP5C7ohDEfsWTB5-A=@emersion.fr>
References: <krnCwRP0UCcVJbY-8ILP_gEFf4EaUdKPSuuHisFkphFaoOl2EAnU032oOWAeJi2xlsFsA7qeR8lypXs71-SoULZnd2gP5C7ohDEfsWTB5-A=@emersion.fr>
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
Cc: Manasi Navare <manasi.d.navare@intel.com>, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0264519735=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0264519735==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/2WzM81Y6B59YhO9UHz832sv"; protocol="application/pgp-signature"

--Sig_/2WzM81Y6B59YhO9UHz832sv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 01 Jun 2020 14:48:58 +0000
Simon Ser <contact@emersion.fr> wrote:

> Describe what a "BAD" link-status means for user-space and how it should
> handle it. The logic described has been implemented in igt [1].
>=20
> [1]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/fbe61f5297=
37191d0920521946a575bd55f00fbe
>=20
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Manasi Navare <manasi.d.navare@intel.com>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> ---
>  drivers/gpu/drm/drm_connector.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index f2b20fd66319..08ba84f9787a 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -994,6 +994,12 @@ static const struct drm_prop_enum_list dp_colorspace=
s[] =3D {
>   *      after modeset, the kernel driver may set this to "BAD" and issue=
 a
>   *      hotplug uevent. Drivers should update this value using
>   *      drm_connector_set_link_status_property().
> + *
> + *      When user-space receives the hotplug uevent and detects a "BAD"
> + *      link-status, the connector is no longer enabled. The list of ava=
ilable
> + *      modes may have changed. User-space is expected to pick a new mod=
e if
> + *      the current one has disappeared and perform a new modeset with
> + *      link-status set to "GOOD" to re-enable the connector.
>   * non_desktop:
>   * 	Indicates the output should be ignored for purposes of displaying a
>   * 	standard desktop environment or console. This is most likely because

Hi,

makes sense to me. Can it happen that there will be no modes left in
the list?

What if userspace is driving two connectors from the same CRTC, and only
one connector gets link-status bad, what does it mean? Is the other
connector still running as normal, as if the failed connector didn't
even exist?

That is mostly a question about what happens if userspace does not fix
up the link-status=3Dbad connector and does not detach it from the CRTC,
but keeps on flipping or modesetting as if the failure never happened.
I guess I could ask it about both a CRTC that has another connector
still good, and a CRTC where the failed connector was the only one.

Can I trust that if the other connector is in any way affected, it too
will get link-status bad?


Thanks,
pq

--Sig_/2WzM81Y6B59YhO9UHz832sv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl7WAgYACgkQI1/ltBGq
qqcV3g/5AeX8KX/Y72U8PeswmNsnkFIQaVVXpul7w9EqRXQAvANNK7FKi0B2DBDJ
U6UXW2NVu9vxUebxYD0y66mpuS3WuIXYfOylpWT8+ogf+taPSq/BHj6/bs/GnVoA
mrt7lxfZg67W/sQpTgrg60PODm9RiWjpVkfsJIY49Clz7IWvOH7txWoyu4NIPeU0
XePPKmbKDvULkkfxIf2/6qFG3dTz+g37RuBwimSB0RlXwkPGmTfO6Lb9WmQKOhMF
UqactxM5gxE7/1/wTw0lAaLdUqa3EncUUdtBzZJvyAG8fcKPOG5oSRxpUGfJvgqL
2l0AQnrBRhrsZbOi/T2KIxPCC8cXPjunYt9cEfB0dV+GgdyP2Ztz3yvKYs1/aX3M
AoKGZpPbNKfzw1XjfM9hBeAGGNN6LqlOCCvAUR4Xpl+n1Rerqrnb9SNKuSKWGgL2
fN66P508cStTG8SJnoH24wFZULNF0prAFmcitintbBz3avZb3o7R2dZCL7Wnp7WG
4iUeN3eND5Cr/1USgbDoPt3xLs34Nb9vGxM8DR80j/OWBVEcZKFSzjvn+hjte5CT
Z8leQuVcYGhxumFwwPvN/QjaDNHNj0s3KVq1bSIDWQxOHHvptls76QQ34GjyhpGn
mHSDoUlc+UJARNKOp7FJLiNuvLWSFTymiaknlHDo++Guz0mQ2cw=
=EkL5
-----END PGP SIGNATURE-----

--Sig_/2WzM81Y6B59YhO9UHz832sv--

--===============0264519735==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0264519735==--
