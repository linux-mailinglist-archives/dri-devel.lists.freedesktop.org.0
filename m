Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FA6801CFF
	for <lists+dri-devel@lfdr.de>; Sat,  2 Dec 2023 14:18:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93F4810E1EE;
	Sat,  2 Dec 2023 13:18:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AECE010E1EB;
 Sat,  2 Dec 2023 13:18:09 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-5c21e185df5so1118558a12.1; 
 Sat, 02 Dec 2023 05:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701523089; x=1702127889; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jNVEJdsKmtNdAZNQabZKbCjHnVndczD1cYDvKeqA9lU=;
 b=fIrByutifUeIqmRTwoDxxmiu8GWiwaCpWjVyc2W/DSsfji2d9WU358ab+8B9G2gGJi
 AjYGbq69Lr2s+HHQUJGN37nosqg478HcgAnZPIOYjrGJYmORXw0aTY68B+7uLHNM9BA8
 2E3mbNlZAQBQen/zg0SNdrs7SlDuYElp2nXzOEALXNVLFJfrHzXFzWp47TjYel8x8V3Z
 lAHNVRzshcYfzzPdLEKLILmRE2epKGwuhw/lEsD5e2ZGw1+acKfkMtmYjTDR62T6rYBr
 9iWRsovDvTGns0r4fkTA3+7tZQqMRfCbCITnbjPKrwH0CvbafxxIyWH8SDjz8fB3XLFR
 Gtyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701523089; x=1702127889;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jNVEJdsKmtNdAZNQabZKbCjHnVndczD1cYDvKeqA9lU=;
 b=AQD8p/kTSH/0H1g84qTtWYoX6OPY8eCVRDmjlcwLi/UqxoN9IN6sAlXLD4oKjwaBZV
 yudXqQyfMH+ZGmUdv3gMs2PJ0LSTE2n6R2BcSdYUHSoW0H9dNhqs7pHCou+lcgo/C5Uw
 h/sBewiQAk2N/7FTEMaveYAwZpJzlYGKFvJrp4F7D5KJJL2KTv1xfuxH/tGyHdYbxaba
 XpjJ56oVLNxaakNgCZef1dUSq7aFR51JI37HRZLrXWsMS8CHCgQVgYkeBfRjmi8hGlOE
 kp2f4L9FfaiViqiJKWtSzuU6UGRKFnY6rSBk2tvJViTWAaKJb52+tF/3k55Ai7CxhvWE
 +w5Q==
X-Gm-Message-State: AOJu0YxlhUbJwuhnQHgCVYZnS1YW5KuJOusMoBeLQzZIEG1LpuLTQBV2
 LjLCIm3gp3b9Tf7cT2neJQc=
X-Google-Smtp-Source: AGHT+IFOq0d0LRMXn8YCPuRoNoCReXQ3iXZt40M5xeNoz63J9Dvc2qGv1phScVe1QzgEMsvzDh1eKw==
X-Received: by 2002:a17:90b:314b:b0:285:bc16:6135 with SMTP id
 ip11-20020a17090b314b00b00285bc166135mr786807pjb.30.1701523089140; 
 Sat, 02 Dec 2023 05:18:09 -0800 (PST)
Received: from archie.me ([103.131.18.64]) by smtp.gmail.com with ESMTPSA id
 ei11-20020a17090ae54b00b002864f7464a0sm3583519pjb.31.2023.12.02.05.18.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 05:18:08 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
 id 10BD61033DCD7; Sat,  2 Dec 2023 20:18:02 +0700 (WIB)
Date: Sat, 2 Dec 2023 20:18:02 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Gert Vanhaerents <gert.vanhaerents@hotmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Nouveau <nouveau@lists.freedesktop.org>
Subject: Re: Kernel problem with multiseat on one card
Message-ID: <ZWsuiq7zrYS-pDli@archie.me>
References: <AM7PR10MB39235DD53D163910E88FDB938E82A@AM7PR10MB3923.EURPRD10.PROD.OUTLOOK.COM>
 <AM7PR10MB3923E07D6024434077E95EBA8E82A@AM7PR10MB3923.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dTlN31Mink/VwRIe"
Content-Disposition: inline
In-Reply-To: <AM7PR10MB3923E07D6024434077E95EBA8E82A@AM7PR10MB3923.EURPRD10.PROD.OUTLOOK.COM>
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
Cc: Danilo Krummrich <dakr@redhat.com>, Karol Herbst <kherbst@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--dTlN31Mink/VwRIe
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2023 at 11:48:24AM +0100, Gert Vanhaerents wrote:
> Hi Kernel list,
> I'm the IT person of a school, earlier we used multiseatcomputers for the
> school, i have maded with a XGL implementation and it works fine but not =
so
> fantastic. The school wants that i build new computers but the XGL project
> is too outdated so i can't use it anymore.
>=20
> How can i make a multiseatcomputer with more then one user on one card wi=
th
> systemd? I have asked already to the makers of systemd but they said it's=
 a
> kernel problem.
>=20
> With Systemd loginctl and the nouveau drivers you have this:
>=20
> =E2=94=80/sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0/drm/card0
> =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =E2=94=82 [MASTER] drm:card0
> =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =E2=94=82
> =E2=94=9C=E2=94=80/sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0/drm/c=
ard0/card0-DVI-D-1
> =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =E2=94=82 =E2=94=82 [MASTER]=
 drm:card0-DVI-D-1
> =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =E2=94=82
> =E2=94=9C=E2=94=80/sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0/drm/c=
ard0/card0-HDMI-A-1
> =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =E2=94=82 =E2=94=82 [MASTER]=
 drm:card0-HDMI-A-1
> =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =E2=94=82
> =E2=94=94=E2=94=80/sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0/drm/c=
ard0/card0-VGA-1
> =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =E2=94=82=C2=A0=C2=A0 [MASTE=
R] drm:card0-VGA-1
> =E2=94=9C=E2=94=80/sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0/drm/r=
enderD128
> =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =E2=94=82 drm:renderD128
> =E2=94=9C=E2=94=80/sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0/graph=
ics/fb0
> =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =E2=94=82 graphics:fb0 "nouv=
eaudrmfb"
>=20
> So it will be:
>=20
> loginctl attach seat1 /sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0/d=
rm/card0/card0-VGA-1
>=20
> For the seat1 (the VGA d-sub output for seat1 and the other HDMI output f=
or
> seat0) and of course the mouse and keyboard.
>=20
> When you do this, all the graphics outputs are on the second seat (seat1)
> and not anymore on the first seat. So i need to move only the VGA output =
to
> seat1 and not all the outputs.

Do you expect that GUI output is on both seats?

>=20
>=20
> When i install the proprietary Nvidia drivers, i have the following:
>=20
> [MASTER] pci:0000:08:00.0
> =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =E2=94=82 =E2=94=9C=E2=94=80=
/sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0/drm/card0
> =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =E2=94=82 =E2=94=82 [MASTER]=
 drm:card0
> =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =E2=94=82
> =E2=94=94=E2=94=80/sys/devices/pci0000:00/0000:00:03.1/0000:08:00.0/drm/r=
enderD128
> =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =E2=94=82=C2=A0=C2=A0 drm:re=
nderD128
>=20
> =E2=94=80/sys/devices/platform/efi-framebuffer.0/graphics/fb0
> =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =E2=94=82 graphics:fb0 "EFI =
VGA"
>=20
> So no VGA, DVI or HDMI items.

Then report to the GitHub tracker [1].

Thanks.

[1]: https://github.com/NVIDIA/open-gpu-kernel-modules/issues

--=20
An old man doll... just what I always wanted! - Clara

--dTlN31Mink/VwRIe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZWsugwAKCRD2uYlJVVFO
o8SXAP40JF/AVn0kN+P4FxuS8TLOMzBdftMsgeJceZxUMDf1owD9HKB78T3Y1KDl
oR6PGTObbun/lktLQhn3njU9pKzoWAs=
=mBNE
-----END PGP SIGNATURE-----

--dTlN31Mink/VwRIe--
