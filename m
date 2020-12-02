Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30ACD2CB71E
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 09:29:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 601C46EA15;
	Wed,  2 Dec 2020 08:29:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAB566EA15
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Dec 2020 08:29:25 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id d8so2920438lfa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Dec 2020 00:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=biK7JJVrreau9v60BgcXO3v9ensQ2L5LMNNBA6JmLGw=;
 b=vJsHOZE1VGNGGjXjAMFMN2aYZJwJR+ZOuokoECcXK5H/ZFVBbjSZGdLT57a+9H/CpW
 IWrmh8mJ9xAHDaTGBDjDoO2lJs0ihc+dvgLh07ra1kVbsDNDVv6hLRg3Hq6yBJkIEGFH
 Pd4bRalZQ/mJ91nkKmhULTLLPzWZvgVH4xByoIo82lBuS6WH9btpULOhvLgMHqOM/RWA
 MFo1UyjRMWSEDA+htq4ftjm5Zq8cflN9VQEjAmu0ASQA15pOuK4Tt4gFVrlLLroOtmpt
 wwyzp0wsSZD7WQi2PmnH2ZrJvjpom9090eexqyKynWWcanuC/lBp/cPi2bf/mqzA5Rn2
 sMkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=biK7JJVrreau9v60BgcXO3v9ensQ2L5LMNNBA6JmLGw=;
 b=fqVdgfd/AwtfgIYTS4+jsRO5m9tcBggTL9USRMuhRMHjhshgQt6CUW5Wk2eilJdDDG
 UKpHlRWQimXcnl/ixYGppoYtGNjvO7TLGHT2ktCGBqF21iets3fg+OL/4MX8jHp4ZXQt
 TZIOt1QBdyOeGtXh4zJjs8SVcTv76C5KCnyFMxrwX960pXVEscbbPpX6rJKtka6gZ9fj
 Q4PVh2r1qkD959r1kVtMpKvZAg2af0/lJXXmBfzq3S35B6rtI0p4oNYBGWiH9AVJP9dK
 Wz7rb5N4gITw+ViIm4GT0t8/mkgPbWNlk1ow65aM47nah1Mw/nClFHXIQIiQj9Yf5yXp
 5aQg==
X-Gm-Message-State: AOAM533U8yW9mGKcXoWnFyg8HrkSdXns/iIbQyDNvaFQM+cSbZaAPhbq
 FtVABYDjAqmhdEMXi8JUVI4=
X-Google-Smtp-Source: ABdhPJz4+SJ0A3xVoyju4k3W66QVlnXZ9Z0cwsNeOmZftsdzyArYcaYS75SUI9RkA6V2MLnCefXsvg==
X-Received: by 2002:a19:c191:: with SMTP id r139mr783336lff.258.1606897764254; 
 Wed, 02 Dec 2020 00:29:24 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id y14sm269379ljy.29.2020.12.02.00.29.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 00:29:23 -0800 (PST)
Date: Wed, 2 Dec 2020 10:29:13 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Mikulas Patocka <mpatocka@redhat.com>
Subject: Re: [PATCH] fbdev: Remove udlfb driver
Message-ID: <20201202102913.56baa457@eldfell>
In-Reply-To: <9e7cad29-a9c0-2e02-04a9-3149d7e15838@suse.de>
References: <20201130125200.10416-1-tzimmermann@suse.de>
 <alpine.LRH.2.02.2011300843270.29199@file01.intranet.prod.int.rdu2.redhat.com>
 <20201130154147.GT401619@phenom.ffwll.local>
 <alpine.LRH.2.02.2011301241470.21432@file01.intranet.prod.int.rdu2.redhat.com>
 <ac639546-d97e-b197-8998-180b0535fae2@suse.de>
 <alpine.LRH.2.02.2012010615080.1371@file01.intranet.prod.int.rdu2.redhat.com>
 <9e7cad29-a9c0-2e02-04a9-3149d7e15838@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, geert+renesas@glider.be, corbet@lwn.net,
 daniel.vetter@ffwll.ch, linux-doc@vger.kernel.org, bernie@plugable.com,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 sam@ravnborg.org
Content-Type: multipart/mixed; boundary="===============1862813034=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1862813034==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Ub9bu0HMJ.BX_LoHkrBsRqE"; protocol="application/pgp-signature"

--Sig_/Ub9bu0HMJ.BX_LoHkrBsRqE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 2 Dec 2020 08:55:52 +0100
Thomas Zimmermann <tzimmermann@suse.de> wrote:

> Hi
>=20
> Am 01.12.20 um 12:20 schrieb Mikulas Patocka:
> >=20
> >=20
> > On Tue, 1 Dec 2020, Thomas Zimmermann wrote:
> >  =20

...

> >> And why can links not run as DRM master mode? If it renders to the ter=
minal,
> >> it should act like a composer. In that case it almost certainly wants =
master
> >> status.
> >>
> >> Best regards
> >> Thomas =20
> >=20
> > How can a userspace program acquire master mode without being suid? =20
>=20
> For my understanding, there's no easy solution to that. :/

Hi,

there are several ways, though whether they are "easy" depends on your
mindset.

The best thing is to connect to logind D-Bus API and ask that for
session control, set up your session, and logind will open all input
and DRM devices for you, and logind will even handle most of the
complicated setup, DRM master and VT-switching for you.

Or, if no-one else has the DRM device open and you open it, you
automatically become DRM master. AFAIU, after recent kernel changes, it
is even possible to use dropMaster and setMaster after this without
being root, as long as you once in the file description lifetime had
DRM master.

Since this is about switching from fbdev to KMS API, you already have
all the tricky, complicated, arcane code to deal with tty setup and
VT-switching.

However, doing all that patching to all apps you want to use is such an
effort, that I'd ask if it would not be easier to just run a
light-weight Wayland compositor and run your apps in Wayland mode. Of
course, that requires choosing apps that run on Wayland to begin with,
so maybe it's not for you.


Thanks,
pq

--Sig_/Ub9bu0HMJ.BX_LoHkrBsRqE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl/HUFkACgkQI1/ltBGq
qqddsw/+KxYidO3CAHQE+G+VtuSREAtDTVDUxAGMOzOlIue7rYw8Ldf+YJnbQ/VT
vH7ssslBy3mfYEjAPlYPQW2MbFAFjiFyIcJ/qk42QmOagrdBsFJBIK19tT7nJobb
4E7MuLo2EYZNAyAaVg+qtRUFuZ/Cy5HedAVb9f8Nvka7exEXOW+UMaUPvTxz2ai5
SQBvZXU6rgmudc1Yo1BRvBPBg1dRzixgS43jAMV3TnrJ4y9lASlpfntYjugsELln
h0sA6RYgW7H6WsdiAwaRnMgq3UU4L1dM0QoOGViI9cM3tXgveQ++EYebRZ0dDd4B
ByTp1fl+ULY0STvWRx02Beddz1b4FvpoU5p2WABCD6yDKzEzIlNwnNejFeDtMBME
9FUBZoFPXSUuj1J/ol4dOW6zK4ua/8g2Fxmltvg4+MB0+LCZLR0N95gB9iyAtX8U
bAzbrY2vHxxLVjrYXHY+pieTrhAku76CPlBtpZuKdlbJT0ZdEiz8FuHupSI8qm2C
WFFzEXSIweA/6KX4W7j4WSP6cr8u/Uxy3Q6PExUkV7hBDy3mZqjDwiGnnB0uLKrn
Z0GKiUt9ATq1B2XiSq40qs0xxroJgsRaeApI6AttFLQFxa4AumrWRWiAsqIxpbkB
cekof+u1hUPt6UlKpuRE4fAW1ILO8I3ekb7oqcKiR64cCHGm96M=
=L5KJ
-----END PGP SIGNATURE-----

--Sig_/Ub9bu0HMJ.BX_LoHkrBsRqE--

--===============1862813034==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1862813034==--
