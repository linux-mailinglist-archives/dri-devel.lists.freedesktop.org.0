Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F48D19D6A4
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 14:24:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC0336E1F4;
	Fri,  3 Apr 2020 12:24:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08FDF6E1F4
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 12:24:12 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id q19so6668815ljp.9
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Apr 2020 05:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=+XPddyv0HPpF21iFf7rbp/kJemoboHde+25necOVp/4=;
 b=sKp160mnK+V+ouZlnHT5w9qXC0MiDzl2Ab+bAwkpCP9Apwe+aM3JthiJF1qQDpCdDN
 ET/vxjnG7apMzAvFATSt2AwOWp+X2nbRqxCwJGXpNqSh5fcWLQUIdoVRRLvCxU7EUFxy
 K3q+pvpY1acyRugtaqhOZXmcmrfPNM3QjJwh0IpQmJNmd6Mkf8Ca0dTmqtf86fpICxoK
 j54e1S5NjFiEBvA+oOnRbpiJrFfM3As7EpHOweHnBhvyq58XOCXqrJ3ApcPiiZX4H9fh
 ZAabnJRcgaW1PoEP1URV+7YzMQ8bYqT7jEEmas/Q2FMCDa6ErcFaNkGiH9t7Of0G8u2u
 4Oaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=+XPddyv0HPpF21iFf7rbp/kJemoboHde+25necOVp/4=;
 b=ca813sEUcjXpXkyxNwaXY7kKZqscTT/oLWp1FDqZrKoXue4elN0Sm+y1irqmjEhLlJ
 Zr7yGYNDB+/3lz9uwcCPqaN8DrRf1VeFQn1FeEnT3R6nTc1gvw9coLQC1FDspX/h+e6/
 lFuaNBQrCq+JQjp3LOFzqRjxzbHrKFbqf/3Imvwp/BSYqNTHdtaVXRODt0lXvOyB/ArU
 v7eHO30325U3m8Qvc9bF6ynGBDqSr72SqnnDNdq4/nW+i9Jt6+UMxAadJuMR5rVZQglX
 hmNruae9I0VF1EvOGsleHMWG+jEeMh37jOVjCd1jECCU/BBpG3mgteCss7OiYUtkR+g/
 zpNA==
X-Gm-Message-State: AGi0PuYv4NwHD6m9paj/8ntUPgnsRlvPIx6wD4jzGA7YnSjUfowMWXHF
 uYevV5efiG5Uv19myiLO6/A=
X-Google-Smtp-Source: APiQypKqR4A2DrqH4c0jPtPC+YhNLw0CJu9T5lJUpD0Eb28+5appGWLq9m8zkuncdNB6v4rOq5/yqA==
X-Received: by 2002:a2e:8e99:: with SMTP id z25mr4687036ljk.72.1585916650278; 
 Fri, 03 Apr 2020 05:24:10 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id r2sm5775986lfn.35.2020.04.03.05.24.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 05:24:09 -0700 (PDT)
Date: Fri, 3 Apr 2020 15:24:00 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: KMS enums and bitfields UAPI
Message-ID: <20200403152400.55fe5eac@eldfell.localdomain>
In-Reply-To: <VmzN-pGfjaXAFb8aZXOnS2ibasRIsvB-EbfvxyvjLs07m-PBv4pTcX5hsB7yyrt78pxQQ6Bbu3I-hTtFSXEadxm8CkS60FLccIsZycguSfA=@emersion.fr>
References: <VmzN-pGfjaXAFb8aZXOnS2ibasRIsvB-EbfvxyvjLs07m-PBv4pTcX5hsB7yyrt78pxQQ6Bbu3I-hTtFSXEadxm8CkS60FLccIsZycguSfA=@emersion.fr>
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============2048827680=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2048827680==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/xQsGl=iab9RywS+4rWDzQXY"; protocol="application/pgp-signature"

--Sig_/xQsGl=iab9RywS+4rWDzQXY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 03 Apr 2020 10:15:21 +0000
Simon Ser <contact@emersion.fr> wrote:

> Hi all,
>=20
> I've been working on a library called libliftoff [1]. This library allows=
 users
> to set KMS properties on a hardware planes abstraction called layers.
> Basically, library users create as many layers as they want with the KMS
> properties they want, and libliftoff will map layers to actual hardware p=
lanes
> when possible. The layer-to-plane mapping is dynamic. In other words, when
> setting a layer's properties, the library user can't guess which KMS plan=
e will
> be used (if any).
>=20
> This works fine for many properties, but doesn't work for enums and bitfi=
elds [2].
> The KMS UAPI expects clients to retrieve the list of enum entries for each
> object via drmModeGetProperty. The KMS UAPI allows a lot of freedom here:=
 each
> driver and even each plane can assign a different meaning to a given enum
> value. For instance, in theory a plane could expose a "rotation" property=
 where
> 0x01 means "rotate-180", while another plane could expose a "rotation" pr=
operty
> where 0x01 means "rotate-90".
>=20
> This makes things complicated for all KMS clients, not only for libliftof=
f. All
> clients need to have an internal enum for e.g. "rotation", then when appl=
ying
> properties to a plane needs to convert their internal value enum to the
> per-plane enum value.
>=20
> However, this isn't true for all properties. A bunch of properties have
> hardcoded values in the UAPI headers. Looking at my copy of drm_mode.h I =
can
> see DRM_MODE_SCALE_*, DRM_MODE_DITHERING, DRM_MODE_LINK_STATUS_*,
> DRM_MODE_ROTATE_*, DRM_MODE_REFLECT_* and DRM_MODE_CONTENT_PROTECTION_*.
> (That's why I said "in theory" when I referred to the "rotation" property
> above.)
>=20
> I understand the intent is to allow adding new KMS properties without hav=
ing to
> update the UAPI headers. However having a nice KMS UAPI for dynamically l=
isting
> all enum entries for a property doesn't forbid us from also exposing the =
values
> in the UAPI header to make things easier and simpler for user-space.
>=20
> Additionally, I've heard Pekka saying that it would be nice to have const=
ants
> for property names in the UAPI headers. Indeed, this would prevent
> hard-to-debug typo issues. I have a very good example of such a typo issu=
e that
> took literally hours to debug, with X11 atoms which also use free-form st=
rings
> like KMS properties [3].
>=20
> If we have constants for property names in UAPI headers, it wouldn't be a=
 big
> hurdle to also have constants for enum values alongside.

To clarify, the property names would be of the form

#define DRM_KMS_PROPERTY_KERBLAH "KerBlah"

while enum values would be integers, i.e. the raw values.

Daniel Stone did have a good counter-argument to defining property
names: userspace would be full of

#ifndef DRM_KMS_PROPERTY_KERBLAH
#define DRM_KMS_PROPERTY_KERBLAH "KerBleh"
#endif

anyway as long as they cannot rely on the headers to be recent enough.
(The typo is intentional.)

> Are there any use-cases for defining a standard property which uses diffe=
rent
> enum values depending on the driver/device/object (ie. the same enum value
> can have a different meaning depending on the driver/device/object)?
>=20
> At the very least, having a clear policy for both kernel public headers a=
nd
> user-space would help a lot. Right now it's unclear for both parties what=
 to do
> regarding enum values.
>=20
> What do you think?

I do not think it is unclear at all. You have to query the kernel for
value by string names. Maybe it's not clearly communicated though?

But I also don't have anything against changing that policy, if kernel
maintainers agree.


Thanks,
pq

>=20
> Thanks,
>=20
> Simon
>=20
> [1]: https://github.com/emersion/libliftoff
> [2]: https://github.com/emersion/libliftoff/issues/39
> [3]: https://github.com/swaywm/wlroots/pull/1335


--Sig_/xQsGl=iab9RywS+4rWDzQXY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl6HKuAACgkQI1/ltBGq
qqfHHBAAj4ljQaPfRVVg2PdYUs6qaxQszAuQGwLrQtMBElKXv8U7b5LkvEjaNuHj
rKkpOwxqbVN1uCbdGbBnl2Gw3GgtQ82RZNJTMAmfVJ2eR9nDHC0Cw6aVsIUpm/tc
wjsW8CETyLZPf+hMAuaWsTg3wZN+08Wa5MMlg/fPw09VOKEZp362nYJRkC9YF6uU
jzB2xffF/0pjxSKqRN4Xe8nRCMtty0TRlhzVMVO731ZbdhSONmhUVrXji+aU/4Rm
JzBPER7UccMl99aQAyR0pKhh2QYNb8LsX0Oj+k0Ok7XfJwZHpf98VkpQzezm4XrU
jRk/rmTQLY2+SK/42jcd9zxisiUtPHTo4aQqPBvUpBr5K+MAGj66U6/JZdYN75qI
RYpvEI1X6NIBeoxX+KdxM0ZPF6L6zaqw7jJjygF45CyBqFyoC3OHR9hBmtR16659
hjWVkn620T4GxzECYw6sU9QGczhp4wnJKqvffO02H6BtrauJcUB9wbwNSDBKDgDF
5d6tWv9DvTR6CgGb+tuvZq4jVSD1+PpJf3YmhhYJ2TzVvf5QlAFClHOyTSM4mTUU
vAu4ND/quXPgL+lPqfvUhl3E8NiLd3IkTeqCRboLokZrK5MOF0JDx50K5sYZv0Hi
QbziNk2oSBYWRRXcCkTgz8Wj7ApU61DUarJJLKcl3QBKJTlPc0I=
=qWST
-----END PGP SIGNATURE-----

--Sig_/xQsGl=iab9RywS+4rWDzQXY--

--===============2048827680==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2048827680==--
