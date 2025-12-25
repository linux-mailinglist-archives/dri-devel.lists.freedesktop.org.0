Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1CFCDD2A9
	for <lists+dri-devel@lfdr.de>; Thu, 25 Dec 2025 02:00:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0E21113E9D;
	Thu, 25 Dec 2025 00:59:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MyMQ2uLO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7659B113E9D
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Dec 2025 00:59:56 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-29f2676bb21so84092695ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 16:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766624396; x=1767229196; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=34ZWGlKeYAoBKfcSWnnSht52B70l+ENf2ADFK5Dgfo0=;
 b=MyMQ2uLOro3dLG3nHZcUGYwuahe3qrvYyTnm0DPAIuSDssChnhMtJzk+oGK1RORHAK
 R6RhDzEeEMmii8gtcQZXPekFI0xzjV7fdgIBATvBa+KGlTIbEjTerF2ghFEcH+5x/YHV
 zkePFdlMBFLS8i3KKPcwxhwnEAO8x0SXO+FIVKet3DJFFbCyITwJu8oE6vcQJCfJIRFi
 ZJf/abJ0oGdkLm+LyUolpm5jf/ckT+j2I0eJkK3euHSP4XNHiUhKIePxXsItA1J/MFO5
 wUOvF/RYKj4LVOlT8ILTeYzl566DFd5LRO+MajugyHE1IX3o5Luff4ROMMHDSHTZbc8Q
 kAKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766624396; x=1767229196;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=34ZWGlKeYAoBKfcSWnnSht52B70l+ENf2ADFK5Dgfo0=;
 b=Bx3wZYSM1CuVIEq6KFp9XBELgSUMZ88AjRh3TYjlFrPwp3Ogec4ePxy3GL/ePL3ONc
 Iw4gsiFlxB2qrbydO1hpaNPm3fUyKsL65jjV0v4GIgYBhmZVVqTn4MrzGW96MNV8lI+X
 R23LDZgl0KDGTrJVDVcf4GmgXDy/jh/FOXQhgwaSk97BWiXmCQh/bBnskVXmMjypLoUX
 +841oZmGQBrco0x27SQmyk/5jNYxVtHCrQmPlhGEr9Gy+fVNSS/emNxQ3ki7ynn2jL0r
 MwXFAbsdKWvAlHnViAskg0QYn08tBVSI/Dh+SIH7uoJY/6GyD/9SrYZUtxcVBXZ8j4/U
 NNSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWulXIpVu9kcJPVgyXqnNKcdgxi3DAaRCW5BrvrnVImR2Pb08DrwPF4lffzEgX4Xcl70emdhcpPir8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyzu0L/B17oQglwgpU1bQXmXBN9zM8qhYPAZEiBeqr1PGw6V1AR
 VenKyNHUDiD+oxdHs7z3RCvAiNI8Y0fEKbLulDXcFC8y27Sjg6fsz4m0
X-Gm-Gg: AY/fxX5AbGfy/ap5Q6Sbot3VYLJP4lcEOI3Ij0UuM78wV6Yx+67t/BI7KD76q7Tylza
 ZAQewXNAVp84D9oK+AXau/7pq/2oPyJirAYf7ecqQ0CppuRKk3ygzXRUaDr2fZOD2yMe/+pPJ1N
 F3xUKVkICBwd62AjNvwgyGIpSTsDpzvkd9yUGMPFjF/Lfb6kg32g5aI5+2WvTla6Gah744T7uXr
 7e4/kR1pqL07rKsAhukikHTY9xWdVE5zYOTqw5vCPZq/Vy77Zx9QKA3UTB+GoE3zr8y6Hh7zulz
 UPG1x+VzmTxkbPZIdvVk2Dfxcjc/xHehfrta6jt8mtCBKcIIvLPX3Lf0mO9F9pLUwm3hxTLznlR
 OH7hYcBSE+RjCFcky74VZt6U5SVRasploKDq1HcG49VHBnGsnnwaTdAuI5PVBpB6xXP0PAAeb96
 aNyY9vPs+K0gI=
X-Google-Smtp-Source: AGHT+IEkf9bcd4whUdPLA/3V9jA2iSPhImg4fMLlgrzr1cD29215lcKLqIOKPcjSlC6FRmStwRjSuQ==
X-Received: by 2002:a17:903:22c8:b0:295:425a:350e with SMTP id
 d9443c01a7336-2a2f220d13dmr169983355ad.8.1766624395785; 
 Wed, 24 Dec 2025 16:59:55 -0800 (PST)
Received: from archie.me ([210.87.74.117]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a3560ad15dsm26772225ad.86.2025.12.24.16.59.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 16:59:54 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
 id 6F72C420B572; Thu, 25 Dec 2025 07:59:52 +0700 (WIB)
Date: Thu, 25 Dec 2025 07:59:52 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com,
 Jonathan Corbet <corbet@lwn.net>
Cc: victoria@system76.com, sebastian.wick@redhat.com,
 thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 18/33] drm/vkms: Introduce configfs for plane format
Message-ID: <aUyMiJvJX1KhffVb@archie.me>
References: <20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com>
 <20251222-vkms-all-config-v3-18-ba42dc3fb9ff@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="jUhjHASxm1xFu7uC"
Content-Disposition: inline
In-Reply-To: <20251222-vkms-all-config-v3-18-ba42dc3fb9ff@bootlin.com>
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


--jUhjHASxm1xFu7uC
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 22, 2025 at 11:11:20AM +0100, Louis Chauvet wrote:
> +What:		/sys/kernel/config/vkms/<device>/planes/<plane>/supported_formats
> +Date:		Nov 2025
> +Contact:	dri-devel@lists.freedesktop.org
> +Description:
> +        List of supported formats for this plane. To add a new
> +        item, write its fourcc code prefixed with '+'. To remove,
> +        use '-' prefix. Use '+*' to add all formats, '-*' to
> +        remove all.
> +

Sphinx reports htmldocs warning:

Documentation/ABI/testing/configfs-vkms:199: WARNING: Inline emphasis start=
-string without end-string. [docutils]

I have to escape the wildcard:

---- >8 ----
diff --git a/Documentation/ABI/testing/configfs-vkms b/Documentation/ABI/te=
sting/configfs-vkms
index a7fce35fcf91d1..3839b6e3c9c935 100644
--- a/Documentation/ABI/testing/configfs-vkms
+++ b/Documentation/ABI/testing/configfs-vkms
@@ -202,7 +202,7 @@ Contact:	dri-devel@lists.freedesktop.org
 Description:
         List of supported formats for this plane. To add a new
         item, write its fourcc code prefixed with '+'. To remove,
-        use '-' prefix. Use '+*' to add all formats, '-*' to
+        use '-' prefix. Use '+*' to add all formats, '-\*' to
         remove all.
=20
 What:		/sys/kernel/config/vkms/<device>/planes/<plane>/zpos_enabled

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--jUhjHASxm1xFu7uC
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaUyMfwAKCRD2uYlJVVFO
ozZlAP9YzRS40bCbfXPH7OLewcsoN37fmZDIvxUWn17lwEDbdgEA+teKlutf5NRD
Ys2mASkyMQn/jubNeBeoNtuOzTQmEAY=
=bshF
-----END PGP SIGNATURE-----

--jUhjHASxm1xFu7uC--
