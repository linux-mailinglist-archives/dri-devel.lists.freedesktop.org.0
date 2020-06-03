Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 602F71ECC9A
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jun 2020 11:32:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BC0789CF4;
	Wed,  3 Jun 2020 09:32:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E525089CF4
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jun 2020 09:32:09 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id n23so1833575ljh.7
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jun 2020 02:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=FXa6kMPD+LcLuPZ1/BUHi5Aak26maZkvovlvnBzW8fk=;
 b=bl0LgvHcxY24bPl/PaQqxxVBPSrVMhw49xf+87QomzEh1NJ51SZNVxxSuznLFQCx0S
 qRM1V1fNvLYto3oS3sf+gF0Sr44I9DNc+6M303CNlgIulocpIZbekcFoJ+eglVQAZTem
 AkttiySfzllm04GgSxsr50NkUXU0rH7hsfJvQYeD5inGL/O/tyjjaiB0KZYe/yRlPAH8
 CCzTATvmx5uoKu1EztTkqNk3pI6pCdnrP96lagWx3TXPZWIE11FDQoHsnnQtheA5Gfhu
 3xzO2NuDct7O/49+zvhFuRnks/SS79vuK4H93yTKel93IsZnqVNEcVJwutrtKsJbirk6
 XDMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=FXa6kMPD+LcLuPZ1/BUHi5Aak26maZkvovlvnBzW8fk=;
 b=ZyZJWgWc7Vf5HYu11IPFtObnIGnEM+CBfeT299q2NhIXzJ0hrHTOF7xbgHa7r0B5Ul
 n8WHjcmHPSnahTFhMX7nAKobeWVlAT2mVkRBTHJbGLMGTJRuX6W0+lgwtIqSeWg9vII/
 Q0DD5FeJqyw/25e1HpNBkr+tziEM1rKxwA3sxBbg4jFIZcQw/iE2i5D5RRf0+32yCWuI
 e3Se2jj3n3QKbOrKvpFTInZT5Or2b1m9MTZNFaPv31X8k6DeM4u7aLjGJOKlM2u3g7M2
 AgwdB8s8iVBX/PvfdZB/tndC7qbtfkaM1Mf5I1obdaErYbPyPWFwyi21ePkLPK+Hr/MP
 NA7g==
X-Gm-Message-State: AOAM531zYpmZOEorJznyiWjcCIP8EUY5EtKou9u03XS15at7XjJXBggE
 kmHRIx7d9xK32Md4JPtroVQ=
X-Google-Smtp-Source: ABdhPJwWn5WA6k0Coojj54XEH0rpIiKAB/OEGWOufs98h4HlRAbBtAOVQy/MN3cIi14/UiRTCTHpng==
X-Received: by 2002:a2e:b5d9:: with SMTP id g25mr1461056ljn.285.1591176728202; 
 Wed, 03 Jun 2020 02:32:08 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id y20sm327091lji.31.2020.06.03.02.32.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2020 02:32:07 -0700 (PDT)
Date: Wed, 3 Jun 2020 12:32:04 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2] drm: document how user-space should use link-status
Message-ID: <20200603123204.6ef5f6b1@eldfell.localdomain>
In-Reply-To: <a3tPhSgOvV4Vn3if_Bqhg-QDwCIVZfHc99EeOVWLRkxOWQoF2tL3QSz-6SLEv3pIJRg2VANaS5rmZUkTkyqi3y0PO9qY84oOa7v_yNFpauY=@emersion.fr>
References: <a3tPhSgOvV4Vn3if_Bqhg-QDwCIVZfHc99EeOVWLRkxOWQoF2tL3QSz-6SLEv3pIJRg2VANaS5rmZUkTkyqi3y0PO9qY84oOa7v_yNFpauY=@emersion.fr>
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
Content-Type: multipart/mixed; boundary="===============1452434018=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1452434018==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/nCRuKY5XAD2MpvxxYSCn29w"; protocol="application/pgp-signature"

--Sig_/nCRuKY5XAD2MpvxxYSCn29w
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 02 Jun 2020 19:18:15 +0000
Simon Ser <contact@emersion.fr> wrote:

> Describe what a "BAD" link-status means for user-space and how it should
> handle it. The logic described has been implemented in igt [1].
>=20
> v2:
>=20
> - Change wording to avoid "enabled" (Daniel)
> - Add paragraph about multiple connectors sharing the same CRTC (Pekka)
> - Add paragraph about performing an atomic commit on a connector without
>   updating the link-status property (Daniel)
>=20
> [1]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/fbe61f5297=
37191d0920521946a575bd55f00fbe
>=20
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Manasi Navare <manasi.d.navare@intel.com>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> ---
>  drivers/gpu/drm/drm_connector.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index f2b20fd66319..829b21124048 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -994,6 +994,21 @@ static const struct drm_prop_enum_list dp_colorspace=
s[] =3D {
>   *      after modeset, the kernel driver may set this to "BAD" and issue=
 a
>   *      hotplug uevent. Drivers should update this value using
>   *      drm_connector_set_link_status_property().
> + *
> + *      When user-space receives the hotplug uevent and detects a "BAD"
> + *      link-status, the sink doesn't receive pixels anymore. The list of
> + *      available modes may have changed. User-space is expected to pick=
 a new
> + *      mode if the current one has disappeared and perform a new modese=
t with
> + *      link-status set to "GOOD" to re-enable the connector.
> + *
> + *      If multiple connectors share the same CRTC and one of them gets =
a "BAD"
> + *      link-status, the other are unaffected (ie. the sinks still conti=
nue to
> + *      receive pixels).
> + *

Hi,

looks good up to here.

> + *      When user-space performs an atomic commit on a connector with a =
"BAD"
> + *      link-status without resetting the property to "GOOD", it gets
> + *      implicitly reset. This might make the atomic commit fail if the =
modeset
> + *      is unsuccessful.

I think this was what Daniel was saying that the kernel should require
ALLOW_MODESET to be set for the automatic reset, right?

I'm fine with how the doc is written now. But if ALLOW_MODESET becomes
a requirement for the automatic reset, I suspect there is a risk to
regress Weston, assuming the automatic reset used to be successful.

I understand this doc describes the current situation and it answers my
questions, so:

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>

Thanks,
pq

>   * non_desktop:
>   * 	Indicates the output should be ignored for purposes of displaying a
>   * 	standard desktop environment or console. This is most likely because


--Sig_/nCRuKY5XAD2MpvxxYSCn29w
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl7XbhQACgkQI1/ltBGq
qqdOGg/6AomYrPIsC00LIUiCYDnJtOLT6xaktiNH/On5sgbDHEpno8kiow8pmGvx
vL3YTh4mlz/vpezUM932T/pmLPPbo/Sb0jYwKesZ063kZ4esN8JYOoHAhcEBrM3/
DrEADEwRn3aAYFcNPMAWg5IjdPjvQQexv6GVCcpBkuW28V1N/WlB5nwDIxY++voA
s+vVhq5qzUexmctcC26cMfKjVndi0u2NRkndFV39gIXcCGf2fRVCvIOhZQuoJxgf
Q5NaftIbcKFvs1WlN8qHdp48YSgRsnLC1Yc8lYbRn9vhkiViFVEWJ5m61+JCg0X5
tC5gPlJvcwsHX8kiLcwfOONx+0P3oi9z3cM93TnWZyvuqVejh5FYnWVQcbwcEpT4
N+i2sSkN6weRi70pTywc/xNpHJ31OwVqMIokuu3qOY6f2FP7x4uYiGCEK3vubtQG
X54yM+uLO1yL2NY1k6ETV4zaYtFQNM1lFDv/9rkxUkMtnRABW9icH7I940Ou/4pb
94viR1FeHa2Bj7kWfupSvghxORet0dGDVnYQqUKPv6LoBmmrzSpUKbseg9Li1nqt
xIQZ7SPHuJc5g85SdmL+P+Q2Fu/ENrw2cRumuxG5u/obz6P0IUDXIzPU8qzdYG4k
8K6jHB24SNwlBWwKFr7NNU6rdFrV2DptKjjxA6FRR6P1HF/ZOvg=
=tUP4
-----END PGP SIGNATURE-----

--Sig_/nCRuKY5XAD2MpvxxYSCn29w--

--===============1452434018==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1452434018==--
