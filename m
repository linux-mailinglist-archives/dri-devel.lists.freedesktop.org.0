Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF53AF6691
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 02:22:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76A8410E7BA;
	Thu,  3 Jul 2025 00:22:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JjONP0+L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85BA810E7B5;
 Thu,  3 Jul 2025 00:22:42 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-74b56b1d301so763847b3a.1; 
 Wed, 02 Jul 2025 17:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751502162; x=1752106962; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=sJK1LPZmNSj7O82pl3GniJn8DVrIh6bpo36MpNcOU/E=;
 b=JjONP0+LYGMs9Ws9taGrt1yQJJP9B7FDXAlC31km4l+1BGYWV9CY4KkTrjZdtuD8ZC
 X025IJy+jk2i+usdEhnRTAvU7GLS0mlryx0ArtjBeHsGMFbOUM36kXi5ehvIqqpBBPKy
 wvXNAjr6hzYbK4wmdYwpilTMI6IXe/UFYJVEQbsvCSRebNoTBcfjfGQ705i9tRMfkaEP
 GCc3hJZtuUFE74fkJfeII+aVd0dhz1EHd1aZd205O5K3kGy8zFevMUCY2s1orwAGw4fz
 876bE/4LHCO19OdUjh7bU68M1YU+cTjxQCqNUcajJAJdSSmxZTNSF14TN2dqLhWySeoN
 iJ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751502162; x=1752106962;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sJK1LPZmNSj7O82pl3GniJn8DVrIh6bpo36MpNcOU/E=;
 b=Vy/UarKWuLzxTR3uvoqsgihmZJIlRJ/rf+ZA9/Oo54XjePoZ+W40mbiIBxjwu/ccIt
 XOYGzrrm/TLKx4PC9TG3d6H3aQpOFiBCrBHF1uKfKBTMm1ZELG8fx2SjXzD/MpJ+tXT/
 GhCDCeZLkTt9E5UynL1XAopLsWoGDPeZivChEzFr3i+/2hXG5pJboiG6d1V8Q+yAuEht
 N5+TQMCKCF7E15KCUSy6MASDd77kEFnhMWjosBHSZWU/hD0lVI57PvwRXNRUG6dbZe1+
 fVmq/OYqFBJHJCTR05RRtAOAyy0Auk4ku2RB1bGMDIp3K98hB8cLd5+jTBe6XdX1kF/F
 UHOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtwJHBRVmJ9b/tijqepawui+DFo1fgnj8BKTvGJU5DYjiBOuG0X3r69dN06RK3xYeH1oqgxC9jF34=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNOq2JGq/EeBx/48kzHzFZcSF9PrVxsyVrqfIjJEmcdXspiyRh
 pcB9GuH/aoUPsW4gn7+F8OhOzL8L4H8YEJuonnQr+xjBQM69H9zZu2Bi
X-Gm-Gg: ASbGncso3noyql8uMGk+VHgAoXSPVP2Z0WhYpF4gHggwiWA9Zx5C2DxZlRJmF8IXwLQ
 CljrECNMsGDDayyQo0WQsq6jkKKauqeAHiOU3HhSN9lnrx6126eeLNCV5dFk39ypnXp1z7HSwzl
 w+Qz0nFSS86j47TdKNw4ZESxHlA1xTi5k1cvD6zt6kBh5S4hTOqL/18e+JGcScW9hzG8iGH5e/B
 Ggx+1y8L4MxxFEhdtkyd+9WiF5KUGuEU48rC4pqF2T0XGr6yS7I57/D8AVYm66DdSANoIr8QHQd
 2J+d4hLpYAKxwehvxqirR+MdLcISEHdDINYHgumHLvveqEMTghZK8mH+2V6hIg==
X-Google-Smtp-Source: AGHT+IG11pZFCQC1d8dXNiTO0PVlbDjh04PIJgu8i7Ochf4Cz2KpROCLMxUu4ZKBPbCLWTWpScLMew==
X-Received: by 2002:a05:6a00:194e:b0:748:e1e4:71de with SMTP id
 d2e1a72fcca58-74b50f29f08mr6358988b3a.14.1751502161863; 
 Wed, 02 Jul 2025 17:22:41 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af57ee836sm15934075b3a.152.2025.07.02.17.22.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 17:22:40 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id A043E4206887; Thu, 03 Jul 2025 07:22:38 +0700 (WIB)
Date: Thu, 3 Jul 2025 07:22:38 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Alexandre Courbot <acourbot@nvidia.com>,
 Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Joel Fernandes <joelagnelf@nvidia.com>
Subject: Re: [PATCH v3 5/7] Documentation: gpu: nova-core: Document devinit
 process
Message-ID: <aGXNTjw-VPTNYrH2@archie.me>
References: <20250702-nova-docs-v3-0-f362260813e2@nvidia.com>
 <20250702-nova-docs-v3-5-f362260813e2@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xHavB6NUYjLSItap"
Content-Disposition: inline
In-Reply-To: <20250702-nova-docs-v3-5-f362260813e2@nvidia.com>
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


--xHavB6NUYjLSItap
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 02, 2025 at 08:00:42PM +0900, Alexandre Courbot wrote:
> diff --git a/Documentation/gpu/nova/core/devinit.rst b/Documentation/gpu/=
nova/core/devinit.rst
> new file mode 100644
> index 0000000000000000000000000000000000000000..70c819a96a00a0a27846e7e96=
525470d07721a10
> --- /dev/null
> +++ b/Documentation/gpu/nova/core/devinit.rst
> @@ -0,0 +1,61 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Device Initialization (devinit)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +The devinit process is complex and subject to change. This document prov=
ides a high-level
> +overview using the Ampere GPU family as an example. The goal is to provi=
de a conceptual
> +overview of the process to aid in understanding the corresponding kernel=
 code.
> +
> +Device initialization (devinit) is a crucial sequence of register read/w=
rite operations
> +that occur after a GPU reset. The devinit sequence is essential for prop=
erly configuring
> +the GPU hardware before it can be used.
> +
> +The devinit engine is an interpreter program that typically runs on the =
PMU (Power Management
> +Unit) microcontroller of the GPU. This interpreter executes a "script" o=
f initialization
> +commands. The devinit engine itself is part of the VBIOS ROM in the same=
 ROM image as the
> +FWSEC (Firmware Security) image (see fwsec.rst and vbios.rst) and it run=
s before the
> +nova-core driver is even loaded. On an Ampere GPU, the devinit ucode is =
separate from the
> +FWSEC ucode. It is launched by FWSEC, which runs on the GSP in 'heavy-se=
cure' mode, while
> +devinit runs on the PMU in 'light-secure' mode.
> +
> +Key Functions of devinit
> +------------------------
> +devinit performs several critical tasks:
> +
> +1. Programming VRAM memory controller timings
> +2. Power sequencing
> +3. Clock and PLL (Phase-Locked Loop) configuration
> +4. Thermal management
> +
> +Low-level Firmware Initialization Flow
> +--------------------------------------
> +Upon reset, several microcontrollers on the GPU (such as PMU, SEC2, GSP,=
 etc.) run GPU
> +firmware (gfw) code to set up the GPU and its core parameters. Most of t=
he GPU is
> +considered unusable until this initialization process completes.
> +
> +These low-level GPU firmware components are typically:
> +
> +1. Located in the VBIOS ROM in the same ROM partition (see vbios.rst and=
 fwsec.rst).
> +2. Executed in sequence on different microcontrollers:
> +
> +  - The devinit engine typically but not necessarily runs on the PMU.
> +  - On an Ampere GPU, the FWSEC typically runs on the GSP (GPU System Pr=
ocessor) in
> +    heavy-secure mode.
> +
> +Before the driver can proceed with further initialization, it must wait =
for a signal
> +indicating that core initialization is complete (known as GFW_BOOT). Thi=
s signal is
> +asserted by the FWSEC running on the GSP in heavy-secure mode.
> +
> +Runtime Considerations
> +----------------------
> +It's important to note that the devinit sequence also needs to run durin=
g suspend/resume
> +operations at runtime, not just during initial boot, as it is critical t=
o power management.
> +
> +Security and Access Control
> +---------------------------
> +The initialization process involves careful privilege management. For ex=
ample, before
> +accessing certain completion status registers, the driver must check pri=
vilege level
> +masks. Some registers are only accessible after secure firmware (FWSEC) =
lowers the
> +privilege level to allow CPU (LS/low-secure) access. This is the case, f=
or example,
> +when receiving the GFW_BOOT signal.

The wording LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--xHavB6NUYjLSItap
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaGXNTgAKCRD2uYlJVVFO
oyaYAP9dYPzPZJL4k8IbXaAQtRvwo3hRmPlPJlB7ltR0JkTvWQEA7+RK8r3cbs8g
jtqTlDMdRiku8fBY+ztaUKmS/DfOvg8=
=+EEX
-----END PGP SIGNATURE-----

--xHavB6NUYjLSItap--
