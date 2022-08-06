Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CC958B554
	for <lists+dri-devel@lfdr.de>; Sat,  6 Aug 2022 14:07:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0E8EBF294;
	Sat,  6 Aug 2022 12:00:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48F3ABF316;
 Sat,  6 Aug 2022 11:47:05 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id s9so5481616ljs.6;
 Sat, 06 Aug 2022 04:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc;
 bh=Ak9qEMDclc16qocwwAbPfTmGERRT1gLNz2WMJkKDPic=;
 b=Qlt6pqDQPgwoPkH1P5ysFoYyBCmJ9BV4qUMK68DdeDkz4JvP7BhuNGme3klLB7QTuq
 ZGmkz+SHZ2fGH3MFUgJBNrBSIjdbFqfS8HgaR2zpZ/Qwv6XtbRJOGe7P2hl9RSiBnMZ3
 GUjOjhDWA7XELPYDywPQmtfAKR1ljJBWYn7/1kyYVNDgpRMOwFiwtJWKAlFSTsAWZYlZ
 KiEU9WF/o7JKFiIQmgyMHVgpLCzzin6iGy71TYJslavkyuqPb01y3sRtJVCfzPDFDV7G
 mS0iznf2EQWiHxEzr7Kef5LmlOIqz7SGnG5nJecK1d8F31cSh+HqdLwvxQ4enP7a5Uom
 CA4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc;
 bh=Ak9qEMDclc16qocwwAbPfTmGERRT1gLNz2WMJkKDPic=;
 b=FE0+58aTyVhQi1mYt/BPiL5uGo6lunFduy6zKDx07qjJpII3SiajrXb3wwDdtKWwqr
 5n70p4ytQQDfpO0ewr1qadkKjE2oF9Yd9b0jRaJLcXjHqrkvFIgKg0ugj56RYhQEltl0
 5ylDM2t4OrrJwW6t90+ls1/tl8OEVlhm/8+TeFnH98rQzUhLR3L6yQeIvUwwm6hjUChB
 wTaGT7ZSdHeE8AaWrnKElXeBoQsAK8kDzS2ekhpCJ+bDxGDYop+n34FriG3j/O3MZ4Cb
 vT3rHNtc2t6DffLUq5RvxLPnSpKZMbAdyD5fZ2U0bSJRSJqhMLFj8omgOnC6J2SiGB2a
 ceZg==
X-Gm-Message-State: ACgBeo296hmglgI0x9VgoftgWCQjFyAs5CUGpwB0eVtqgkBjil41o/h7
 77gwzQ5eA1bvKWifug3kr0w=
X-Google-Smtp-Source: AA6agR7F45034HlzUShM54O6KFakjo4oOPwYrBBViuYO4f54fI40IO2mAacb6IWYk0bty6yhWW0Xgg==
X-Received: by 2002:a2e:81d8:0:b0:25e:4ede:6d61 with SMTP id
 s24-20020a2e81d8000000b0025e4ede6d61mr3023898ljg.410.1659786423260; 
 Sat, 06 Aug 2022 04:47:03 -0700 (PDT)
Received: from ferris.localdomain (85-156-247-210.elisa-laajakaista.fi.
 [85.156.247.210]) by smtp.gmail.com with ESMTPSA id
 j5-20020a056512344500b0048b17ecee71sm752353lfr.302.2022.08.06.04.47.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Aug 2022 04:47:02 -0700 (PDT)
Date: Sat, 6 Aug 2022 14:47:00 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: "Hoosier, Matt" <Matt.Hoosier@garmin.com>
Subject: Re: How to test whether a buffer is in linear format
Message-ID: <20220806144700.0519b70c@ferris.localdomain>
In-Reply-To: <491b09b4dd40404c8559513713bdb17a@garmin.com>
References: <491b09b4dd40404c8559513713bdb17a@garmin.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ojqn16MObKBjhN/aALRr3Zo";
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/ojqn16MObKBjhN/aALRr3Zo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 5 Aug 2022 12:32:01 +0000
"Hoosier, Matt" <Matt.Hoosier@garmin.com> wrote:

> Suppose that I want to map a GPU buffer to the CPU and do image
> analysis on it. I know all the usual cautions about this being a
> poor performance option, etc. But suppose for the moment that the
> use-case requires it.
>=20
> What's the right set of preconditions to conclude that the buffer
> is in vanilla linear representation? In other words: no
> compression, tiling, or any other proprietary GPU tricks that
> would prevent accessing the pixel data in the same way you would
> for a dumb buffer.
>=20

Hi Matt,

whoever produced the buffer must *explicitly* tell you that the
buffer is using the DRM format modifier DRM_FORMAT_MOD_LINEAR.

> I think that requiring the modifiers to be 0x0 would suffice. But
> is that overkill? Maybe there are situations when some modifiers
> are set, but they don't affect the interpretation of the pixel
> data.

It is not overkill, it is strictly necessary. It is not sufficient
though, you must know things like stride and offset for each plane
as well in addition to width, height and pixel format. All those
together should be enough. Note, that DRM_FORMAT_MOD_LINEAR must be
explicit. If you lack a modifier, you cannot assume it is linear.

No modifier can ever be ignored. If there is no modifier, or it is
invalid, then you must use some originating-driver specific means
to figure out what the "real modifier" is.


Thanks,
pq

--Sig_/ojqn16MObKBjhN/aALRr3Zo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmLuVLQACgkQI1/ltBGq
qqecyxAAnD3kRYzZC+KkeTOEuLfWV3NVLY4YERYZhpSY4tWbiJDrJdP8E3j9dFm0
qslMevZPUxEiABsjBM7ZMBsdCf7rAO+7sXmMxzbofU4FcfSk8TmofgTWYy7pKMwq
CHzQh2g6wpMxCcMe8rUlARbdbnmaRNtobt6mJuYub5aBlEijk12g2orD/REaEgwP
iGR14x5i2B+JY1C0F/XlUzllWKKz4J2JuxEPf6ofTug2Av7tHlsFu1mpDyJ+/hmq
HQ2dvLiqUWgAZ2PPE2SddCiyyiEpZAU5pltXFkQAM5H7JKwouerDkUhxdxpMEb0b
PJ8NZftR0JZfg080qZw4hf4hh18d7HFp+LKLdufyR4HbSaTdioyflX34fYQQdXE+
2qujwNEpokduCSoX81i0tWorf81hbKSSDlF3JImtf7TsNl0IJXcmXu05vfzTG4KO
27YwHay1sNDFIFACreaTHYdKBgagqmuREzqCnpAHMHbMIVsTzExokbKuhYBdHbKn
QJm6pweeULDAZwvWleKe8uFIcOGcRwCeaXq1AEhcL1euokUgci5djcVTbn0SMmPL
Dkmn9I7EuQOEotWUJ/gdWCoZ6epAWCyEUsTAr+ElJD5iYZt5LTWtBGiEMHXgKaCT
NCYHnVPKlAu096Jc7qKC3OswNpW52rT0Sjc0x6pko/6xtRF53FY=
=Glhr
-----END PGP SIGNATURE-----

--Sig_/ojqn16MObKBjhN/aALRr3Zo--
