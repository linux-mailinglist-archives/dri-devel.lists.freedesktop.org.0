Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9737198D3C
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 09:42:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D36A6E580;
	Tue, 31 Mar 2020 07:42:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13C236E2BC;
 Tue, 31 Mar 2020 07:42:13 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id r24so20951834ljd.4;
 Tue, 31 Mar 2020 00:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=N9QpK/ItyTAxowsy1TIOtOpzig8vysrETNeagGxVa6Q=;
 b=W8roYyTU85e6yzrj/8C8bUmC4uXnu4X+2BNC/SWemwpUDMfLBxmujxS+Ni3KALrR8w
 3sBPDwoty5Pcmr2cA8XNXq33rlnViJ8+B8MmtDNKZ0HvDv1B75gN3vA1mvKq26qHGxU3
 jNYE5l7ztKu2Xo7SnGsxXDvSVmlGFBmY9VI1BpTykV9Y5hPY4k10Rl9Cskuwg+aw9gWe
 zsE/ix+yqun11YwKI7CM9QU1/1iTk6kauCMFmdrqOGtgjx7cmR0x/cRyn/yinvf2OAdz
 P7brYNFoSqM0PI0LpL2alBeP4tLGoG9QcQvxty+35OhDzXNlXLfnALUxM0gWEe6BCLVt
 OHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=N9QpK/ItyTAxowsy1TIOtOpzig8vysrETNeagGxVa6Q=;
 b=P0DNxVPbj4LPTkBl/z6aRUTU7wcdNcSd1S56gpjenfMquFRNKA6HvYoi7TSinkN52v
 N/hUdFKq9HbLkNE/7TovwY9vof2wON5GOO5WqAHnoaD09SirDtHBKv7KjiwL4iWPxj2q
 KWcCcs1KaZ+OsLQ6o5VyL09ZbE9Cke9NHKHKQV0lpjunvytlA+WVgLGsBcOgF45Pojlj
 1Ui3kjQ0hdDv3pqJOh1HcITVzdiI6NWsHpHoo4a7yNVW41GlGuXXugydq1zHV7vTOtPz
 jL3xzVWf6OVLKNOue3sWcpHSaYgsW42JvqSfGtC8A32WRzzK+hy8IkGBISryxX82C0X1
 1Stg==
X-Gm-Message-State: AGi0PuZaJ7qbvvfviBIShj6bNQiub5yegEbPuuAowls79oKaOXpELAO1
 HbzPdfWQRKGgUqPyRntVPNA=
X-Google-Smtp-Source: APiQypKgm5ZX7fHZoqpqt1huzOGegg2k+hwd8YARG2GGYrtejQX1Vg6cZ6vJUU7sEwzKnP4M9p4flw==
X-Received: by 2002:a2e:2a03:: with SMTP id q3mr9313397ljq.216.1585640531380; 
 Tue, 31 Mar 2020 00:42:11 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id m12sm8025450lji.50.2020.03.31.00.42.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 00:42:11 -0700 (PDT)
Date: Tue, 31 Mar 2020 10:41:59 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
Subject: Re: [PATCH v3 0/5] Introduce drm scaling filter property
Message-ID: <20200331104159.74612c6f@eldfell.localdomain>
In-Reply-To: <E3R30o5qjRxRLwfN8lAXK7vOlsZquoDyWBCyOM-vMFydzPZRwt7eooF86fBNKECvvLAzSsFWC-jWfu5RXyxIIAAwJmcGS3HULQvvYO8m0X4=@emersion.fr>
References: <20200330183857.13270-1-pankaj.laxminarayan.bharadiya@intel.com>
 <E3R30o5qjRxRLwfN8lAXK7vOlsZquoDyWBCyOM-vMFydzPZRwt7eooF86fBNKECvvLAzSsFWC-jWfu5RXyxIIAAwJmcGS3HULQvvYO8m0X4=@emersion.fr>
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "daniels@collabora.com" <daniels@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1284975231=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1284975231==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/e.3EtJf/VLD6KJ.kUi_KInM"; protocol="application/pgp-signature"

--Sig_/e.3EtJf/VLD6KJ.kUi_KInM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 30 Mar 2020 19:30:27 +0000
Simon Ser <contact@emersion.fr> wrote:

> Hi,
>=20
> On Monday, March 30, 2020 8:38 PM, Pankaj Bharadiya <pankaj.laxminarayan.=
bharadiya@intel.com> wrote:
>=20
> > Userspace patch series link: https://github.com/lrusak/xbmc/pull/24 =20
>=20
> This pull request is against a fork, not the official Kodi repository.
> Are there any plans to upstream the change so that users can benefit
> from it? Is there a reason why this pull request hasn't been opened
> against the official repo?

That is an excellent observation. Merge requests against forks do not
count:
https://www.kernel.org/doc/html/latest/gpu/drm-uapi.html#open-source-usersp=
ace-requirements


Thanks,
pq

--Sig_/e.3EtJf/VLD6KJ.kUi_KInM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl6C9EcACgkQI1/ltBGq
qqdCuA/+LzHCFS35Dde8svqqD7u7y5ZYsdWq7IL3umgU8jS7FICLYDeCJNYMQncm
k+WPvkPvLYLjIRjmjaC3JpDl8wlzuShUdaXku2prnK/CmBmuSS/TYo5S8j+FBUIf
gPqP4/1weWgmwuUaY5ditOBzQqfTD5KODbZu7jskumDEaZBN2OGVrIkfLimRCIEm
f3BxdDcBhoi3hH0eYumptkqmCaKFk7XbIR0tzdn+XKinWeJNLTrNkIv7tuUVPyoM
tqTU4Z6lsua82YPUVCyMpg1XZSfIHwJM85aZWffmtzhtMuTPrPbtdeJyWC+Ly+fV
arRlFADkz2ev88oObzQMywX1GLhSbTEMFX+J2xC5agl5XQZg24brvjFZy28SIKRo
XHxztU6dqTCCPHAgATgQPO3wwGaiRoWO8ePQ+D8+NZ560srZPiCljBdtafwRsliW
5HlM+pWXT+SVh33iVnJaM82261xtb998TBvdLYSVA5zFae1+VGKP2uFjuMORgvLc
bNPuZcYIcc09D9LMPrsMPiWrnoDQF2HQn0zUsDrRmA63Ixs/cP7C/iH4MpbKJc0u
PU4VtNv+UjkAWOi0Rw7U1aAkoc1PZI3L42dbU3qYWOnTPR7C6xAraS40jUEE/Gez
/eAk6UqL8gtA7l3Hm/DISabpkKysGZeonQDgzmqTgfL8FusXcMs=
=CiKo
-----END PGP SIGNATURE-----

--Sig_/e.3EtJf/VLD6KJ.kUi_KInM--

--===============1284975231==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1284975231==--
