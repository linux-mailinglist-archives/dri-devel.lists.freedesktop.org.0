Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A35F887E167
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 01:48:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8727C10E613;
	Mon, 18 Mar 2024 00:48:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nok1Jjnq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8DDF10E613
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 00:48:43 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-6e6eb891db9so3442225b3a.3
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Mar 2024 17:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710722923; x=1711327723; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=iyhAj/AvbT+q5Wdign8jYwMPfExPCS0AeB8ioPb/dKg=;
 b=nok1Jjnqy9lsBFACxEQvHn1tjJkVuoMDyeWTzA9Ahyntm00EXOvQ92FcAo9+muvnS3
 /1FoJ+ep3dbeCOG3Zf/rl/FPyWpV5EdAdGZozygllPXhzkX9PeeF9h29kGZNc4CamBMH
 o2UhWKMFchavyoz2Otzg8dteqakieDc/85Gh4fDyjK4mofs40yFH8eybqwbzwP0KBN+a
 u2/AppUxkiCjVbc9GXOqWit2W8Pd6QK8LuWsw1epAmYGYaAA3WGEuamoEsSFeH366Rdc
 9XVR/Nbhx/0oUUNO4EiloEWH6WCN+YqG2+xzoKYjmZoDHaQhe1454GpRNt9MpzjNT2b5
 ywKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710722923; x=1711327723;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iyhAj/AvbT+q5Wdign8jYwMPfExPCS0AeB8ioPb/dKg=;
 b=GAec/DBGFzTJyBsRwo3X4suvjXtw7esZgVV7STzCnvt7CzzFGnEaIF3sv5t1j+lmr5
 YWcuVBhCRkaCrgAMIDyZd//ytnSLWFHnsIYhydpkYTsxwkgOab8ArDQ89+oANWuk11zQ
 51o+YbZW4iVGL/hm/j0SvLb0L/BMXQgdSfR6FbpnxoyNNFk4kVQK8+9NiApmE0LtQ4/Q
 aSX3K/hZiM1YVh7/ebLFIxj+OnuyErMmYNTnOrpK+GxHvmLYRNSxs6Vrw8b+d4WiCltv
 XqI939SbLC7MNKEKqpTAdL3Hxdf3aIQ2Pio4w/b7tsca+EumGxkwP6hFCpoz5YGsmh5M
 mUSQ==
X-Gm-Message-State: AOJu0YzX9nK8IJXANiSKgDss5xKYicHYbES3JDLzY5i5uCPCplUnPFB0
 LxrYL60M8Jgpfd7ZIRhe8X+Ndh9HFODhWQvVLdgRcAyHq4FDvxR/
X-Google-Smtp-Source: AGHT+IHnxcskTNtxo+8XW9jL7ZjKauVnn6LkWq5NdVGj63Q9WCHu6AOL2hk20VjTBhCPsLJSJHbEPg==
X-Received: by 2002:a05:6a00:a0c:b0:6e6:99b0:1813 with SMTP id
 p12-20020a056a000a0c00b006e699b01813mr15162428pfh.17.1710722922711; 
 Sun, 17 Mar 2024 17:48:42 -0700 (PDT)
Received: from pek-khao-d3 (unknown-105-121.windriver.com. [147.11.105.121])
 by smtp.gmail.com with ESMTPSA id
 t188-20020a625fc5000000b006e6f8e9ab6asm5071479pfb.15.2024.03.17.17.48.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Mar 2024 17:48:42 -0700 (PDT)
Date: Mon, 18 Mar 2024 08:48:32 +0800
From: Kevin Hao <haokexin@gmail.com>
To: Frej Drejhammar <frej.drejhammar@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH] drm/tilcdc: Set preferred depth
Message-ID: <ZfePYNWY5_1XwS_A@pek-khao-d3>
References: <20240317033918.535716-1-haokexin@gmail.com>
 <kh6h4bra6.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="BcEVanaY6uj6gpFy"
Content-Disposition: inline
In-Reply-To: <kh6h4bra6.fsf@gmail.com>
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


--BcEVanaY6uj6gpFy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 17, 2024 at 08:18:57PM +0100, Frej Drejhammar wrote:
> Hi Kevin,
>=20
> Kevin Hao <haokexin@gmail.com> writes:
>=20
> > But after kernel commit c91acda3a380, the FB will not be created
> > successfully due to the check of the valid pixel format. Then the bpp
> > is set to 24, but the 'depth =3D 16' and 'bpp =3D 24' combo is not a va=
lid
> > pixel format.
> >
> > Fix this issue by explicitly setting the preferred_depth in this driver.
> > With this change, the modesetting driver would choose the correct
> > depth/bpp combo based on our setting in xorg.conf.
>=20
> Check the fix in [1], with it not only does the X-server work with a
> color depth of 16 bits, it also enables the use of a 24 bit color depth.

Thank you, Frej. I didn't notice your patch before sending mine.

>=20
> As I'm the author of the solution in [1] I'm partial to it as it is a
> more general solution to the regression.

Agreed.

>I have no standing in this
> community as [1] is my first contribution to the DRM system, but if I
> had, I would NAK this patch as it only fixes the regression for one
> driver and does not enable the use of a 24 bit color depth which is
> something the hardware is capable of.

I had also thought about a similar modification before, but personally,
I considered such changes a bit aggressive for a patch that needs to be
backported to a stable kernel (especially for a LTS kernel such as v6.6
which I am working on). That's why I opted for minimal changes to fix this
regression, reducing the risk when we backport it to the stable kernel.
Additionally, my patch and your patch don't conflict semantically, and
setting a driver's preferred_depth shouldn't cause any other issues.

Thanks,
Kevin

--BcEVanaY6uj6gpFy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEHc6qFoLCZqgJD98Zk1jtMN6usXEFAmX3j2AACgkQk1jtMN6u
sXEc7wf/U2EZkqX3Qg6R0JvblbnqtIfm+CEBmfGfy/CsFdNm7OlCn+xmC2e/pKGQ
y5NDcQ0SD/wWcHKBwAsPOGnTl6bRzQ4awBZnkayGgJAqAntX7vBwtjvxutj9zZBP
IwU+sZ2aKJBR/9KEyM0+0x7IFJf3G3R4GquauEBAwLrf4JqvISjDtEdKk3RQ+59y
r4QIAiGVCZ2A3cWr/usEGWo5y67nRdX0gWwxQ5J8XrE2SYiLMiomPZ4BtUu2FbxM
WKhkpt9/geB6CYzxPPJKFQfTdVca/MI/5rxaIULynzyRcQ+s9uHKhCAY+l/qIHt4
f8UoJubn2fU7D9t3oHWhQvEeBDGfUA==
=0sp8
-----END PGP SIGNATURE-----

--BcEVanaY6uj6gpFy--
