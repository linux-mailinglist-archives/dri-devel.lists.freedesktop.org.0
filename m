Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC9066BAD
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2019 13:39:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 754FF6E352;
	Fri, 12 Jul 2019 11:39:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D41FD6E352;
 Fri, 12 Jul 2019 11:39:10 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id m8so9007754lji.7;
 Fri, 12 Jul 2019 04:39:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=UVlIsFC9AuUzfjb5knpPxIG8z+vyVRlBjY4WecG9MvU=;
 b=HslWzu0J3Cb/bCfrsvMCnVYC154vP07gx7pjBglSJZepmGxMlNU7A/jmcaK6gG3WNW
 hgV9BIBEsXLnMvCt4pZ/upf20z4lKiZADaOnq51qpGWMmXQUL+Qz0ytRjdiMwEQAErb7
 X6q3IPVisrbK6WTpkRaNMZcT0DcdRoyosEtE3aE9LmUpYruFYPVwjwOWSd/R0qycXIat
 jQGLrhpc8zdPYgUww+dMTB2x4rSi3byWlhQm7g2/Uq0B4fxKoYESd1LRYYbW5jBcX2OG
 d/+wSW/6LHegQOQEurQvdMDkVwADx5cJCHcloC3z0qMpRrjHvbKz3m1uGkv5ao7/UJXS
 VmEA==
X-Gm-Message-State: APjAAAXvulTNM5tVgZO/1r/jyg8j+fyhIXCGia4SkM41c0kSC0pn+xiE
 4nGwgtK/8yG/QDuwZKJY/cw=
X-Google-Smtp-Source: APXvYqxYjA24mkI8C6SwtnFA7pmTfzE4mxAwHs2zJzzy9a7rmYAcqa7jDo4DQYc/bUExBTThUGF4bA==
X-Received: by 2002:a2e:730d:: with SMTP id o13mr5348219ljc.81.1562931549183; 
 Fri, 12 Jul 2019 04:39:09 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id 199sm1444081ljf.44.2019.07.12.04.39.08
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 12 Jul 2019 04:39:08 -0700 (PDT)
Date: Fri, 12 Jul 2019 14:39:05 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [Intel-gfx] [PATCH v9 1/6] drm: Add Content protection type
 property
Message-ID: <20190712143905.12b51ad2@eldfell.localdomain>
In-Reply-To: <20190711141822.GA136584@art_vandelay>
References: <20190708112116.1780-1-ramalingam.c@intel.com>
 <20190708112116.1780-2-ramalingam.c@intel.com>
 <20190711141822.GA136584@art_vandelay>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=UVlIsFC9AuUzfjb5knpPxIG8z+vyVRlBjY4WecG9MvU=;
 b=FqJZIDrICzwJgEWOxZRkSRl9q5/ZDNDIm27t7zg4ibDrYMf82t4eBLzDBdkeR1sMRo
 ZDp+pmZjr75AOrC7c/o0xntjrCOwp2OLU7WcWTcQ9ObbG8BorbyQb3YgvMTKFUCH20UT
 +ZqIFOvxYjcO5+ghtGqRD5LNyn2iT1FzLuDBDlxuPkHoQ+wRUaNF9ylbIWVst4fn2eUv
 hR4MHqJnvA/SMBRt/yw/0tgjg3m8mKJDYjGtpzJDwNQDeXzXV9v5IVjiGyaqbmdD0tsO
 07I6VgoBrsUnPm9IoP9/XJsKnMnULJrcvsYCPinf4I8zCAGwgWbCQlHLC+qXCsza6eZM
 /+3g==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1108611158=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1108611158==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/.M5iZqOkDPYKSkj8Gpdrnxg"; protocol="application/pgp-signature"

--Sig_/.M5iZqOkDPYKSkj8Gpdrnxg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 11 Jul 2019 10:18:22 -0400
Sean Paul <sean@poorly.run> wrote:

> On Mon, Jul 08, 2019 at 04:51:11PM +0530, Ramalingam C wrote:
> > This patch adds a DRM ENUM property to the selected connectors.
> > This property is used for mentioning the protected content's type
> > from userspace to kernel HDCP authentication.
> >=20
> > Type of the stream is decided by the protected content providers.
> > Type 0 content can be rendered on any HDCP protected display wires.
> > But Type 1 content can be rendered only on HDCP2.2 protected paths.
> >=20
> > So when a userspace sets this property to Type 1 and starts the HDCP
> > enable, kernel will honour it only if HDCP2.2 authentication is through
> > for type 1. Else HDCP enable will be failed.
> >=20
> > Need ACK for this new conenctor property from userspace consumer.

...

> > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_conn=
ector.c
> > index 068d4b05f1be..732f6645643d 100644
> > --- a/drivers/gpu/drm/drm_connector.c
> > +++ b/drivers/gpu/drm/drm_connector.c
> > @@ -952,6 +952,45 @@ static const struct drm_prop_enum_list hdmi_colors=
paces[] =3D {
> >   *	  is no longer protected and userspace should take appropriate acti=
on
> >   *	  (whatever that might be).
> >   *
> > + * HDCP Content Type:
> > + *	This Enum property is used by the userspace to declare the content =
type
> > + *	of the display stream, to kernel. Here display stream stands for any
> > + *	display content that userspace intended to render with HDCP encrypt=
ion.
> > + *
> > + *	Content Type of a stream is decided by the owner of the stream, as
> > + *	"HDCP Type0" or "HDCP Type1".
> > + *
> > + *	The value of the property can be one the below:
> > + *	  - "HDCP Type0": DRM_MODE_HDCP_CONTENT_TYPE0 =3D 0
> > + *	  - "HDCP Type1": DRM_MODE_HDCP_CONTENT_TYPE1 =3D 1
> > + *
> > + *	When kernel starts the HDCP authentication upon the "DESIRED" state=
 of
> > + *	the "Content Protection", it refers the "HDCP Content Type" property
> > + *	state. And perform the HDCP authentication with the display sink for
> > + *	the content type mentioned by "HDCP Content Type".
> > + *
> > + *	Stream classified as HDCP Type0 can be transmitted on a link which =
is
> > + *	encrypted with HDCP 1.4 or higher versions of HDCP(i.e HDCP2.2
> > + *	and more).
> > + *
> > + *	Streams classified as HDCP Type1 can be transmitted on a link which=
 is
> > + *	encrypted only with HDCP 2.2. In future, HDCP versions >2.2 also mi=
ght
> > + *	support Type1 based on their spec.
> > + *
> > + *	HDCP2.2 authentication protocol itself takes the "Content Type" as a
> > + *	parameter, which is a input for the DP HDCP2.2 encryption algo.
> > + *
> > + *	Note that the HDCP Content Type property is introduced at HDCP 2.2,=
 and
> > + *	defaults to type 0. It is only exposed by drivers supporting HDCP 2=
.2.
> > + *	Based on how next versions of HDCP specs are defined content Type c=
ould
> > + *	be used for higher versions too.
> > + *
> > + *	If content type is changed when "Content Protection" is not UNDESIR=
ED,
> > + *	then kernel will disable the HDCP and re-enable with new type in the
> > + *	same atomic commit. And when "Content Protection" is ENABLED, it me=
ans
> > + *	that link is HDCP authenticated and encrypted, for the transmission=
 of
> > + *	the Type of stream mentioned at "HDCP Content Type".
> > + *
> >   * HDR_OUTPUT_METADATA:
> >   *	Connector property to enable userspace to send HDR Metadata to
> >   *	driver. This metadata is based on the composition and blending =20
>=20
> Do we actually need an entirely new property? Can't we just add a new
> entry to the existing Content Protection property which is "Desired Type1=
" or
> similar? The kernel will then either attempt 2.2 auth or it will ignore i=
t the
> request if it's not supported.

Hi,

IMHO the existing "Content Protection" property is already complicated
enough that one should not add anything new to it.

If you added "desired-type-1", the readback of it would become
ambiguous if it was "ENABLED", userspace would not know if the value
written was "DESIRED" or "desired-type-1". Sure, it's not a problem
when a display server knows what it just wrote into it, but shouldn't
we try to keep KMS state readable as well, if for nothing but debugging?

I think using the same property for communicating in both directions
between the kernel and userspace (value can be set by both userspace and
kernel at times) was a mistake to begin with. It has already caused
long discussions on what the readback actually should reflect and
whether there are races for a given userspace implementation.


Thanks,
pq

--Sig_/.M5iZqOkDPYKSkj8Gpdrnxg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl0ocVkACgkQI1/ltBGq
qqfSfQ//Ux51fHvTCTohygpHteOu3pV18LJASwk0nn9iRsCW2R2PXQYkfWx9l5c8
uJkY6QpBlFOhuhACkr9vKPrPWURUr3d66K8JPgrnZZ1QeJBKcJXJmzuKZxvz3VZ+
TrhxD84gZmlf2PO/tWwuLXE7+BweXyud8lOVTnbMoYevJsyDb8iGCnJLFXCN3f+5
+5DQZhGFwNwwMnh1JNnn0uXGMREqqH46t5BDjtqSrO/B/HfHSQ/RICvE1kFYnNNz
wISNBXAQelw1mub4jJWI1LtW1S/Cu0nvpdx8zU/cq3xXJmBj6QFzOVD6iLLq03Zs
EzQT08tX1EAdRZEHDBU3fgsayuPuqttMHLoMw6CIVIjy1cgS0unrAPNjaMUupnul
HdV4F2sLSjE8rMFhV0PizQfjITt6zFJUXFaNPCX0cr3RjpZNq4LGHf8JYi8KueJ9
Bueen9HXD2+ikk6Rq/+XurTckE/wcFyv0/gK9TM7AVUJi9qcu+HTyi/KM23dLlSy
ifJzGMxOeToXkYZZAjetOsqTFZFrH+IYuI65u3g2HbGt3t4t8vEebcTEDQCGlg7Z
mOwaGXIbDDXrxwdWY9gqDqAPN//L3UQsD3bnhWBZnyU1kkuUM2JUtSMJ8ZJw+vAB
LWUvOMipFZlKVnCI6lC/4qUhrip1N8p3YCZFIjclU0I04zMwRac=
=RJm/
-----END PGP SIGNATURE-----

--Sig_/.M5iZqOkDPYKSkj8Gpdrnxg--

--===============1108611158==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1108611158==--
