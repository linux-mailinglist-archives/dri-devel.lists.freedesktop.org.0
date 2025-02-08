Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E796BA2D368
	for <lists+dri-devel@lfdr.de>; Sat,  8 Feb 2025 04:07:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF2D610EBC6;
	Sat,  8 Feb 2025 03:07:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="D54758/c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EB7510EBC1
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Feb 2025 03:06:52 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-21f53ad05a0so21294315ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Feb 2025 19:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738984012; x=1739588812; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=DdgvWheqjT5pXT4I1T07lINQhy5JHRq7w0nHepie99s=;
 b=D54758/c1WDABKaV+E/Y9HURcOTkxCfRowX8VYfqdryVgObJIaCYUR2dDffsVHPKqk
 S++MuNbGK8tYwc2GCKdmN5O3Fn/rspv6kPmrjqyfnXv0pdrJ/Tssq/KIq4gVFWZ0Ganh
 c2f92z4ZhHLDMrwy+iAUQfNnIUHVdHoJObLF/+i1Xb6xwe/nMOeojDfgEmFO3wyYJT4h
 LZYRgIyZtxDt+47O1/rnwJIhsGQOru244wCGBJQZNxzmYfaFQrWf4t9Vg+wmizBaJK45
 o1pvCqw1qdIVb9ih+VXYxf/n0QTc7/eK+XsKjjzMr/hbPY56tjR7zBCBruuREEcWknhy
 9/qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738984012; x=1739588812;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DdgvWheqjT5pXT4I1T07lINQhy5JHRq7w0nHepie99s=;
 b=puoLUQnTToyJ54rsz3iv+37PR9sOkTxEtV3ygIYOiGWDmz9iwAdEwbiSg1riCg7z5j
 bqLSgkj5Rj3Hp7qty6AnBN/upw3RVlZPI5d9Mrk3V0D2aT4YbdEtiB+K6KQWBolsMuZD
 XaK0OMZt+uGl6GjA2Ya5jsvytmgLTAJPcllPPQS1keaWEQiqQuEkMrR4zutg82rMM4mp
 AAXFwsRCDQ5gC08bF+Lz3SJgpLkz6p46qUkIRbAkC5TJFA8lUtrJTccaEvyxpOLjlwpk
 RrjBRo2J6ryxWC93/DEpYVmMD65CoE37GTOI6/7KrKGHq+tK1fzT/VI0y9Tv/EtoB704
 IwAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVezlJ6maId9eLdrFc6cWVOwXE4P/oD7i9IreQgZgGEtKN5kCPqdOhJEeHtzQTTLJ6Fu8HEuNi/eUs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRFUJ1DEYDZMMRrk4XD/Br6GjV1VQ1h251eAlNDiIDVEQOa9Z2
 J1+va6l6snq8Oo8XmfN2qhXlxbq155MJdNaAsR+GcL6hh/EdIpCS
X-Gm-Gg: ASbGncsrtALCNTK0uYhSVS9SwtlDx2fWHJQK2gQPBqqa5q8fF3FHZ58+l9KYa6l+vt3
 nUoT63kHP2YHbQ3D4dGpX8DY2uxOkk0RyQDRrlBoO3WvVlXgcoa7E1pa6BO2QGud1XuHH/7prIE
 sNHwgv46OIl5Qe2M517dcSxoVLWLlV8bkL1yxXKZW8VL062gqWE6L74mz+AkdDv9zgoJCmI9+Xz
 NLMv0gAx9T/6M4ALKTX1mk8owJsdb4OLTQGdcSnjBftF1ggQfowWWkXw4gQgBb5rITxavwHkYxv
 L44QrZ6m8zEcziQ=
X-Google-Smtp-Source: AGHT+IFJLSCXQpLWVjygO2ryT8UBN9/TQaLw2cpmwi5QB34TSe8wHW0JRe80FNHslqUQ/LyOyYDIWg==
X-Received: by 2002:a17:903:2f84:b0:212:63c0:d9e7 with SMTP id
 d9443c01a7336-21f4e110a0bmr88071015ad.0.1738984011623; 
 Fri, 07 Feb 2025 19:06:51 -0800 (PST)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21f3687dddasm38069655ad.203.2025.02.07.19.06.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 19:06:50 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
 id D25224208F47; Sat, 08 Feb 2025 10:06:47 +0700 (WIB)
Date: Sat, 8 Feb 2025 10:06:47 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Pranav Tyagi <pranav.tyagi03@gmail.com>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] vgaarbiter: documentation grammar correction
Message-ID: <Z6bKR9K16-oYMLFl@archie.me>
References: <20250207165325.3998-1-pranav.tyagi03@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Zw9znROb1LsOQG2j"
Content-Disposition: inline
In-Reply-To: <20250207165325.3998-1-pranav.tyagi03@gmail.com>
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


--Zw9znROb1LsOQG2j
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 07, 2025 at 10:23:25PM +0530, Pranav Tyagi wrote:
> Corrects the following grammatical issues in the VGA Arbiter documentatio=
n:
> - Fixes subject-verb agreement by changing "co-exists" to "co-exist"
> - Corrects pluralization by changing "server" to "servers"
> - Improves sentence structure for clarity
>=20

+Cc: DRM folks.

> Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
> ---
>  Documentation/gpu/vgaarbiter.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/gpu/vgaarbiter.rst b/Documentation/gpu/vgaarbi=
ter.rst
> index bde3c0afb059..d1e953712cc2 100644
> --- a/Documentation/gpu/vgaarbiter.rst
> +++ b/Documentation/gpu/vgaarbiter.rst
> @@ -11,9 +11,9 @@ Section 7, Legacy Devices.
> =20
>  The Resource Access Control (RAC) module inside the X server [0] existed=
 for
>  the legacy VGA arbitration task (besides other bus management tasks) whe=
n more
> -than one legacy device co-exists on the same machine. But the problem ha=
ppens
> +than one legacy device co-exist on the same machine. But the problem hap=
pens
>  when these devices are trying to be accessed by different userspace clie=
nts
> -(e.g. two server in parallel). Their address assignments conflict. Moreo=
ver,
> +(e.g. two servers in parallel). Their address assignments conflict. More=
over,
>  ideally, being a userspace application, it is not the role of the X serv=
er to
>  control bus resources. Therefore an arbitration scheme outside of the X =
server
>  is needed to control the sharing of these resources. This document intro=
duces
> @@ -106,7 +106,7 @@ In-kernel interface
>  libpciaccess
>  ------------
> =20
> -To use the vga arbiter char device it was implemented an API inside the
> +To use the vga arbiter char device, an API was implemented inside the
>  libpciaccess library. One field was added to struct pci_device (each dev=
ice
>  on the system)::
> =20

The diff looks OK.

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--Zw9znROb1LsOQG2j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZ6bKPwAKCRD2uYlJVVFO
o2EnAP9KXpy/sNMRD07GgHf0CZ34bJcFE7NvYEFNIzeNQDcgiQEA3gktCvb0ofFa
SL7vz+ybdAw6ceg4vF/hhZ8ZdbitVgA=
=VhPf
-----END PGP SIGNATURE-----

--Zw9znROb1LsOQG2j--
