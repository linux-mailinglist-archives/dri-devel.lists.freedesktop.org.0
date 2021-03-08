Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D9233094A
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 09:21:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC77789F97;
	Mon,  8 Mar 2021 08:20:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8049789F97
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Mar 2021 08:20:55 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id e7so19704041lft.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Mar 2021 00:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=J/JMbWCZWM0J0pDDJfDbT7bWfcrsMBFXdhvoxd656+s=;
 b=O+Otr76QVAvorl3+hTnyjNLJVYViq5lki841jAtD2zWMBBvbAl4on2HYagQEdOk8/L
 hezQioBt7Sd2v4e51yEGE8ssoks9Kkso02USaSllvDreu95jUJsRiW3o+d4s9e/t7MUg
 QuBKa1ELqKyJXFDWKlkCxEAL/LPRuu2DfkDvl9R5aOVY13izEzJjTY6nqQ6y5ledu/oG
 own2Fjg+pzRZxXZpvO7BMhrg3b2ZQGSV7W2c5Ezks2GPGrNO6/Kzb8IDkKz7whmcnYfK
 1C1ibiK8M/keQ5us3f9SsqQ+lmNS6fwS9u3LDjQ+3FnNv5sOTwkaGKIBMaMtt3yXWj0W
 Y+Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=J/JMbWCZWM0J0pDDJfDbT7bWfcrsMBFXdhvoxd656+s=;
 b=mp73aBDKUM6Bv3XCVnJfHYoc04IkW4dP0ot2gx95Fn1HfdCaRsPFAYhOxwUDGN4C3O
 Do22Tx75CtRKgXxee53gvdx/zpxcuszEucp6lIqDMHdebBdgtyDKIFg2lGOuoebessIs
 GNNQH9c4gcCef6HeXFijFW2UizsfB/8qfgsKXlCg5KcFs5zij9UFxwyfuJccj3i2O4n4
 OK1hJkW5UaVRh/cITht5CYbNe3ueP1wxxp5ZGewVTxchEYaJx/fLVSx0KHWTnVmtm+eK
 7+94qm29guxr0uj5Az7QMWD9n96fEdaNeefb9Iv0nvBoijXnYHDvGxXuNqUpMxHOsS10
 YxqQ==
X-Gm-Message-State: AOAM530YLQlgxly5gM1qeOJrgFec1Fz5nrQ0fIM9X4l2TufYL1841EK9
 y2bafyDhL/a+M/09PI1wm1w=
X-Google-Smtp-Source: ABdhPJyIUejB9zcnxxpslI99HAy6rYbuB58cdacymgkRN53Q7KOxNHqBivVxLnK7Inr/923ukCV37w==
X-Received: by 2002:a05:6512:2083:: with SMTP id
 t3mr13397920lfr.590.1615191653880; 
 Mon, 08 Mar 2021 00:20:53 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id e2sm1424660ljp.135.2021.03.08.00.20.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 00:20:53 -0800 (PST)
Date: Mon, 8 Mar 2021 10:20:43 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/uapi: document kernel capabilities
Message-ID: <20210308102043.7246e484@eldfell>
In-Reply-To: <zaAAWSkCocn-BDN-fR6Oi8EA0pCVhc3gwthb6JWi84iyYmdyCJ1sWiYgtw6POBH6TseYGQ9x-NWTPAJ-9gKfCFFWv9lyt6s0F7sRrEQW-yI=@emersion.fr>
References: <20210304221057.657146-1-contact@emersion.fr>
 <20210305102850.769bf34d@eldfell>
 <zaAAWSkCocn-BDN-fR6Oi8EA0pCVhc3gwthb6JWi84iyYmdyCJ1sWiYgtw6POBH6TseYGQ9x-NWTPAJ-9gKfCFFWv9lyt6s0F7sRrEQW-yI=@emersion.fr>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1881096099=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1881096099==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/+0T1YJEkuqwBYMpMbhDGEsn"; protocol="application/pgp-signature"

--Sig_/+0T1YJEkuqwBYMpMbhDGEsn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Sat, 06 Mar 2021 10:56:49 +0000
Simon Ser <contact@emersion.fr> wrote:

> On Friday, March 5th, 2021 at 9:28 AM, Pekka Paalanen <ppaalanen@gmail.co=
m> wrote:
>=20
> > > +/**
> > > + * DRM_CAP_DUMB_PREFERRED_DEPTH
> > > + *
> > > + * The preferred depth (in bits) for dumb buffers. =20
> >
> > this is literally depth, not bits per pixel, right? =20
>=20
> "Depth" is pretty ambiguous [1]. Maybe we should be more explicit here an=
d say
> that it's the number of bits used to indicate the color of a single pixel=
? And
> maybe add a note that it's different from bits per pixel?

Yes, indeed.  I was already assuming the meaning of "depth" in drmModeAddFB=
().

> [1]: https://en.wikipedia.org/wiki/Color_depth
>=20

> > > +/**
> > > + * DRM_CAP_PRIME
> > > + *
> > > + * Bitfield of supported PRIME sharing capabilities. See &DRM_PRIME_=
CAP_IMPORT
> > > + * and &DRM_PRIME_CAP_EXPORT.
> > > + */
> > >  #define DRM_CAP_PRIME			0x5
> > > +/**
> > > + * DRM_PRIME_CAP_IMPORT
> > > + *
> > > + * If this bit is set in &DRM_CAP_PRIME, the driver supports importi=
ng PRIME
> > > + * buffers. =20
> >
> > What are PRIME buffers? =20
>=20
> Will add something like:
>=20
>     PRIME buffers are exposed as dma-buf file descriptors. See
>     Documentation/gpu/drm-mm.rst, section "PRIME Buffer Sharing".

Sounds good.

> > > + */
> > >  #define  DRM_PRIME_CAP_IMPORT		0x1
> > > +/**
> > > + * DRM_PRIME_CAP_EXPORT
> > > + *
> > > + * If this bit is set in &DRM_CAP_PRIME, the driver supports exporti=
ng PRIME
> > > + * buffers. =20
> >
> > What's the export API? HandleToFD()? =20
>=20
> Yes. Will add a note about it. Same for import.

Cool.


> > > +/**
> > > + * DRM_CAP_CRTC_IN_VBLANK_EVENT
> > > + *
> > > + * If set to 1, the kernel supports reporting the CRTC ID in
> > > + * &drm_event_vblank.crtc_id. =20
> >
> > Does this not apply also to the pageflip / atomic completion event? =20
>=20
> Both DRM_EVENT_VBLANK and DRM_EVENT_FLIP_COMPLETE use the struct
> drm_event_vblank, so yes. I'll mention these two events explicitly.

They do? Seems like I have been spoiled by the libdrm API that uses
drmEventContext with different callbacks for these things.


Thanks,
pq

--Sig_/+0T1YJEkuqwBYMpMbhDGEsn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmBF3lsACgkQI1/ltBGq
qqcvZBAAhN6hT9+62sE6pc9Yr31Hf5lGw0jb9NbKMPqbVO0A1iTS4P9S49zoM6oi
u9qdLIe5D4xgBzSNpfnWrZvDsx9mv4/hVTkv/nIJoTsa+rKFxALO4I78yo1xLwHx
/gG0V7wjCtIt1yXat3p4Xqz3v05CjcxnTJ1d0RJVtugrrWiyXTjZ+nBOxUlqHA0m
hpOTpvk23vOyY/L6VeHubKsxivz8S7AEZ2wnPr9G9PCKGo1HtHn/skjES2J+Q0oy
xhHoBnjJTV/fK/iQpT8xWmr+PbuCsKr39ZonFq4FCDgCD/wiXO14YzdVKuOKWZDe
licPedx11rWhrO5h02/sYTOfe6iamLLzWxT6/v7vrsIKJteXGsXxNcJ6+mngYyPj
Apldi5OlHNmjrxQAquuEBAK05t4nl01Awl2oN4gdMyUdW7fUiywKxhERf5SYJ2p1
D8oXXK8+kEWIUSRb8ZkAFp7O2GaqHywKSB+wguobcARF+NggSAyESf6lKeW4srre
BCLlLbfZ95ArfsBlNkaWqfRbtif2MSBhh3aNCSqaRVlrvdRbmhuJgQPCSdTGrkYa
U5jLc/tYPXToKwXtGxsdW16qlQ/J+yYWekqOgiUIsAozU3PoXqXNjophRKPEO943
2FvJzStOTr5pxN0Up3qE+BIT4BRYZ6n231Bckwt7YscgIUrzqhk=
=arkZ
-----END PGP SIGNATURE-----

--Sig_/+0T1YJEkuqwBYMpMbhDGEsn--

--===============1881096099==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1881096099==--
