Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B257AAA8B67
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 06:04:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A288210E035;
	Mon,  5 May 2025 04:04:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iiSXwBho";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2145010E035;
 Mon,  5 May 2025 04:04:20 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-7390d21bb1cso3964868b3a.2; 
 Sun, 04 May 2025 21:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746417860; x=1747022660; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gK0oUnlhk0xQS6gfCO1+tbdbmqMk/aeI5m31soEvVPQ=;
 b=iiSXwBhojlIp/3lbQqbkLubpRwwkdcYJYPy4+hy9d8yCtmtv1FA05/P2DPUI/ZSkEP
 eOuch94HMydGXcOLiNBAhOqtOo/rm9ORWTnSNQlz9tdvqKJ5dkBie6kyTc5aWWxQGVHs
 AQsA/RsRPqn6bmcP9XgXDpE1u6j6ZbmmneotHtE/LR7cyqJFqvl/EQYkgRaj4RCsMdzs
 8kX4tGqdLqVofddtGlnwe2AG0qG6CD+ZGiyncdOt8zg+Ov9/c+SJjhpeJkWTOGpSfyUQ
 aU1OJ9LTPrXHxOW7avnCfL3HHayXqp0kMV4yssqgCDF0FacfxhQ3XXuHaqAW6pJ2XlcQ
 ShRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746417860; x=1747022660;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gK0oUnlhk0xQS6gfCO1+tbdbmqMk/aeI5m31soEvVPQ=;
 b=mENXQabnyMby6AoEeF/YIPYZOmHbEw3P98hPQCpx6VtpIcrLstygfkGxpReFlct3sH
 LcbgroPOtojzm21ZXreMYgvMqHo9gamNDf4PkY710EqJmV5srPR+wxHt+YND6WbIntm4
 v/SHx6S7dFSjwE3GsKtaMT0p92BruLqE7vP883/JCSkk+n4I0xRddAXdL2btzPRO7vT5
 JorH1f0EOdbLPn98YC9c3d/Btac5i9JNcPM7uyFktq8RfHIHS/MUFWB67byPrGULniPs
 8idQ2QaQj1fWL3UhGPD+j3K3JTSWklCAStMEodHefA/69h8pr1YwHgh2FQNb/OwwZ7EH
 D6GQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWd7WthBvHQrLG8dJ/zvFn853g1H02Zio+mpjqnLOyN21bEAAn/04AMUvsFOsIbx7X7gN592RxOfkM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxCWuX5uifdldWz3GL4+IRW8U82y/egfnWUdcx9lUsBu8k0/aP8
 tOdNbq+VTJ/dIBnLKqXLiJmpFTvWAw0rB5FsWzQcROIe2rlGOJY7
X-Gm-Gg: ASbGnctaT+jtY3E11uLxHnI+TL91Jj6W/uIIFDRCs4qvFP+cGdThf5F6qAUL1ywYsxE
 NzazQflnQcVUaZONwO/a0IgQVOhk7bs/e4FS4Pjp0igLRZ4fHbFBF4EhYFTPOMpJIYpHIhPKRFL
 wGDDIxQ7KmelT20qpRPSs2s0eT9/adNP/gIK1/rUYfi0uUAk1LBgMjZBnP4JKvo8FAghwRpvVK4
 zp+3v2RMu0a+4wMLjz17W6cMrtJ5NDau82zpFw2G5pyIMPqwzzN7U85Tjs83XVOdSrHKG0LzRY6
 0/FudXt05zoHqjK1I1sd6XWMTS2miQt+P4x/QMr4
X-Google-Smtp-Source: AGHT+IH4zF9L7zy3QfMIAIAAGNtwxpqx4wl4oSEMzfDCKzMJyIxHn4OFP+beI5OEKHOC8jno8TXaFg==
X-Received: by 2002:a05:6a20:3d85:b0:1f5:77bd:ecbc with SMTP id
 adf61e73a8af0-20cde951f95mr16724233637.16.1746417859836; 
 Sun, 04 May 2025 21:04:19 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b1fb3c439f2sm4553060a12.53.2025.05.04.21.04.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 May 2025 21:04:18 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id 2799B423CC6A; Mon, 05 May 2025 11:04:16 +0700 (WIB)
Date: Mon, 5 May 2025 11:04:15 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alexandre Courbot <acourbot@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>,
 Shirish Baskaran <sbaskaran@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Ben Skeggs <bskeggs@nvidia.com>, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 5/7] docs: nova-core: Document devinit process
Message-ID: <aBg4v1N6R3ryOiLj@archie.me>
References: <20250503040802.1411285-1-joelagnelf@nvidia.com>
 <20250503040802.1411285-6-joelagnelf@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ZGvKDiwG6ZHKPkk2"
Content-Disposition: inline
In-Reply-To: <20250503040802.1411285-6-joelagnelf@nvidia.com>
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


--ZGvKDiwG6ZHKPkk2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 03, 2025 at 12:07:57AM -0400, Joel Fernandes wrote:
> +.. SPDX-License-Identifier: GPL-2.0
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Device Initialization (devinit)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Separate SPDX line from title heading.

> +These low-level GPU firmware components are typically:
> +1. Located in the VBIOS ROM in the same ROM partition (see vbios.rst and=
 fwsec.rst).
> +2. Executed in sequence on different microcontrollers:
> +   - The devinit engine typically but not necessarily runs on the PMU.
> +   - On an Ampere GPU, the FWSEC typically runs on the GSP (GPU System P=
rocessor) in
> +     heavy-secure mode.

Please separate numbered list from preceding sentence, and the bullet subli=
st
=66rom parent numbered list by a line.

> +Runtime Considerations
> +---------------------
> <snipped>...
> +Security and Access Control
> +--------------------------

Match section underline length with the text.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--ZGvKDiwG6ZHKPkk2
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaBg4vwAKCRD2uYlJVVFO
o3anAQCb2dsZAHf+GyS2JomBvsALFHIJndX3uTSqBg0K+xrfMQD7BiYBQ5cTMcf0
W4c0tLhQPadH6gGQM8L862yUMgNpIwI=
=+dDA
-----END PGP SIGNATURE-----

--ZGvKDiwG6ZHKPkk2--
