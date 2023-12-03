Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC96802070
	for <lists+dri-devel@lfdr.de>; Sun,  3 Dec 2023 03:47:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D40B710E14C;
	Sun,  3 Dec 2023 02:47:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45A1D10E037;
 Sun,  3 Dec 2023 02:47:20 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-285c3512f37so3326757a91.3; 
 Sat, 02 Dec 2023 18:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701571640; x=1702176440; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hwi4CkSiHiuyV9keGcRs+cQrmHpIxi0CgRaI9b36kXc=;
 b=iA7rCQnoJgGxyp+16DRpP8yg50VfNmUHEJnmzhG04dycaVGaKZU9vnqZE5KCmhA09f
 Y/AkSeH+ad0Aa3NPKzS1DFJQUwBSB9487PtZD9DHfNfHL4Z/Ie50SDo54B4dTOlgaO+P
 Z8B1m/3zq24DLCSJOccQjAHb4ahQ5hzDPNkO/LJIXzR/Sts6dAZ3eOJtC7U2QXBNdDdI
 aaH9OHb/6bofPVC6p1i9VAOXhjhLHmlu5wM/jRJWp/bd6JYXYy6lCpyCOIDUgMtP2JcF
 qhxxju7sV/4t+zLLnUaB51ymd9W4RH2EdD+g/cdnIrLKVQH0qryjcNdui5rvmz2lGWUl
 +tNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701571640; x=1702176440;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hwi4CkSiHiuyV9keGcRs+cQrmHpIxi0CgRaI9b36kXc=;
 b=QXsubeuJhPG2Ao0nZbLPNM4KdnOHoaCA9gc8uKpovrpIirqpokgDxXWRuGkrNbSGob
 QcKkgCD9rA1ptjhz8VPIfDPRVJuEqm9r07qx0hyLUOKT0cHGt+pVXYiw66WHSO8pzGyP
 BtMWOkstbYPuPwE+uumwUF/EOyV5x0Y8WMtfUJJ0i7O/iBZ3l//xQtaemTxKhPNa8Dzr
 bkc2UWodo0mK+g+5cLdjQ5FVj0tISZ5bgrrBaD+FfnuMhUN5dj/j1kRfA8jGrFGgJHEf
 uRZy4AUaXFosOVWcgq0Zf4oejx0g3CODkTo78s65fNE7UpYEC+bCTu0UlKYvGzDh/loZ
 iERw==
X-Gm-Message-State: AOJu0YwYdcWFTUAZ74nN2za6t1I+MjMefasTKRwYiPzm6bN4jocGNl9q
 WwGez+Hv0vHfWflFRiY1ICKJ/9+zDef5xw==
X-Google-Smtp-Source: AGHT+IGIXMzatFr8BevACKg6pkv/MY315sB+5R85kFeOtEyUxFZmmJ5AtiWsRRxreZOPKdonOMUgYw==
X-Received: by 2002:a17:902:dacd:b0:1d0:6b95:9c0d with SMTP id
 q13-20020a170902dacd00b001d06b959c0dmr2339798plx.65.1701571639739; 
 Sat, 02 Dec 2023 18:47:19 -0800 (PST)
Received: from archie.me ([103.131.18.64]) by smtp.gmail.com with ESMTPSA id
 ip1-20020a17090b314100b00285d330ae8bsm7273256pjb.57.2023.12.02.18.47.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 18:47:19 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
 id 64344102894F8; Sun,  3 Dec 2023 09:47:16 +0700 (WIB)
Date: Sun, 3 Dec 2023 09:47:16 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Timur Tabi <ttabi@nvidia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "gert.vanhaerents@hotmail.com" <gert.vanhaerents@hotmail.com>
Subject: Re: [Nouveau] Kernel problem with multiseat on one card
Message-ID: <ZWvsNOMjONfYGeUF@archie.me>
References: <AM7PR10MB39235DD53D163910E88FDB938E82A@AM7PR10MB3923.EURPRD10.PROD.OUTLOOK.COM>
 <AM7PR10MB3923E07D6024434077E95EBA8E82A@AM7PR10MB3923.EURPRD10.PROD.OUTLOOK.COM>
 <ZWsuiq7zrYS-pDli@archie.me>
 <655a02097e9b49c2da7a2be60d7c154a48a916f4.camel@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="OZ2h1VyjMrmlXfbI"
Content-Disposition: inline
In-Reply-To: <655a02097e9b49c2da7a2be60d7c154a48a916f4.camel@nvidia.com>
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


--OZ2h1VyjMrmlXfbI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 02, 2023 at 03:28:25PM +0000, Timur Tabi wrote:
> On Sat, 2023-12-02 at 20:18 +0700, Bagas Sanjaya wrote:
> >=20
>=20
> > > When i install the proprietary Nvidia drivers, i have the following:
> > >=20
> > > [MASTER] pci:0000:08:00.0
> > > =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =E2=94=82 =E2=94=9C=E2=
=94=80/sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0/drm/card0
> > > =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =E2=94=82 =E2=94=82 [MAS=
TER] drm:card0
> > > =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =E2=94=82
> > > =E2=94=94=E2=94=80/sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0/d=
rm/renderD128
> > > =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =E2=94=82=C2=A0=C2=A0 dr=
m:renderD128
> > >=20
> > > =E2=94=80/sys/devices/platform/efi-framebuffer.0/graphics/fb0
> > > =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =E2=94=82 graphics:fb0 "=
EFI VGA"
> > >=20
> > > So no VGA, DVI or HDMI items.
> >=20
> > Then report to the GitHub tracker [1].
> >=20
> > Thanks.
> >=20
> > [1]: https://github.com/NVIDIA/open-gpu-kernel-modules/issues
> >=20
>=20
> No, do NOT report this on the Github tracker!
>=20
> That github tracker is ONLY for bugs that occur with OpenRM (the "Open GPU
> Kernel Module") but not with the the proprietary driver.  If you have a b=
ug
> with the the Nvidia proprietary driver, that must be reported on the Nvid=
ia
> forum instead:=20
>=20
> https://forums.developer.nvidia.com/c/gpu-graphics/linux/148
>=20

Thanks for the correct pointer!

Sorry for inconvenience.

--=20
An old man doll... just what I always wanted! - Clara

--OZ2h1VyjMrmlXfbI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZWvsLwAKCRD2uYlJVVFO
oxtcAP4u3ez3E31bsckuQz8FiVqspKTnc2sOAd+RVV7YAVfXPgEA8h3/OoMBej3D
APZPK5cv/DozHoLIuoOTGBY+IfCdkAc=
=kWBj
-----END PGP SIGNATURE-----

--OZ2h1VyjMrmlXfbI--
