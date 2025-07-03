Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAE3AF6689
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 02:20:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA17E10E0D6;
	Thu,  3 Jul 2025 00:20:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kcEEzJUp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32CE110E0D6;
 Thu,  3 Jul 2025 00:20:09 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-23649faf69fso45561405ad.0; 
 Wed, 02 Jul 2025 17:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751502008; x=1752106808; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=74rKt+STDv8gvziFnmBUH7WzclmqAx6VBVFDifAftQU=;
 b=kcEEzJUpuqNn/IMfStNj5nel9CzQFBTyWO0xBLJJoZmpY3KLUmKblZhOZSbV1MNjud
 70wp1lp7NAU/SSPBSp7Cpo1AuGfWFLWdnnUMv1nz7HFfRpa4A9R+Q5F5zEiFtmnCiUR7
 zph0JkOWjpe1PF/ImnApH3zy8c9xTqfSoJ2hzlKhmDAODpIn7Hcvq5RYeAn4FxJdQO92
 +OsWrJwbMKecH3Rg605JeEw9v5ED9zz2L0J2j6rZmPPK7qdKaI/XoPe22Keu3oPJvMGz
 F8IUXBQZHR+sQ5XgKuA2QUXk01q04oBhKeiy2npzMleIg3wHx6vEg9jcyMPwfmqz+ZJ5
 4RHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751502008; x=1752106808;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=74rKt+STDv8gvziFnmBUH7WzclmqAx6VBVFDifAftQU=;
 b=izBGKmQ4+5Ycps8i7nb7W3CkaZzKp0kjVvY9S4OUYy/thBXezvI0u2zJ/lmw3skbvl
 pqL1Q6xudc24WDz5mNaGWtGaur4KqBc1TBnH2MdWprtVVD0v8yzHKHFZyYBjUFBmS8pF
 DHTVNqMlanTAMf0/3Q9Wl/RwK6SapDEfk8jKwJbNNXf5BY8BNA5igAQOrq1GDZm1B3kf
 mhJ18frzsAsv8wQVUcTAISQ7Yi16pDdLZKWCsbkbbOyT73clC0i410c87Q+3F4YtqeL1
 SE6zawTT9NHDpYR6iG53WIDTk0MmQNVFnprbUXYk6pOREmVzHuzdaqshqjqVcWrmcPw6
 EcfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjePNQWaIOkJ3zN6d3k041ZoQ8Zni2kqoCLf6xe4vKnLylGXTQfdyD5XJuADdKhXdAUNuye91/rVk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywsok/xYw8aDRTlTvg/bavqDvSjci7NGRcr6yVlwu7exMLvotwf
 TV8TIa/RHC2oJqeZ71zsBPuwfD1PFL76ltugu0chvmbp4Ud7byeEAGIL
X-Gm-Gg: ASbGncuqkybXxIl28v+bRbbpZetD3WDMLueCS7xwZ+wtYcCyjEx8dG9Wdb5ahIwGamF
 POQEx1T5DP8iAQgJK5Qfjmu/SfPuUxFbqkc3D/vaS8mOPsIFUwd/LhP0PVb2yOh4MBqS4J17CcZ
 k8eBvzJH/dZrfj8JS1KP2CPBrpI/zq+Xfrlh9Aa4kt9ECSbMhifBJprvo4EjCyJ1bTUTubNcASu
 h9EUQfYAly6eduUzs4Ge7lDbKqk2spJ7L2YymVxp9/8OcBhYdalVynUJYQ9wPrYQ2Gp5zpoTlHg
 KcojnzpKskNVvkqybvWgSHVJ0w4yukLZzOpbP3PyAgcT9TrFPl110xlqbR0QOA==
X-Google-Smtp-Source: AGHT+IFreKQK98FHtTd4csmo0TGyK/ccLa13EmASTbcqZiR2H8hgMzgT145WTD5dZuLeULY9C5CM+w==
X-Received: by 2002:a17:903:1b63:b0:235:e71e:a37b with SMTP id
 d9443c01a7336-23c6e550151mr82210355ad.34.1751502008326; 
 Wed, 02 Jul 2025 17:20:08 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb2f1814sm135737205ad.57.2025.07.02.17.20.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 17:20:07 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id 82C5E4206887; Thu, 03 Jul 2025 07:20:04 +0700 (WIB)
Date: Thu, 3 Jul 2025 07:20:04 +0700
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
Subject: Re: [PATCH v3 4/7] Documentation: gpu: nova-core: Document vbios
 layout
Message-ID: <aGXMtB7sN1FJOXAL@archie.me>
References: <20250702-nova-docs-v3-0-f362260813e2@nvidia.com>
 <20250702-nova-docs-v3-4-f362260813e2@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dcvzE3w8GZbsAc7N"
Content-Disposition: inline
In-Reply-To: <20250702-nova-docs-v3-4-f362260813e2@nvidia.com>
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


--dcvzE3w8GZbsAc7N
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 02, 2025 at 08:00:41PM +0900, Alexandre Courbot wrote:
> diff --git a/Documentation/gpu/nova/core/vbios.rst b/Documentation/gpu/no=
va/core/vbios.rst
> new file mode 100644
> index 0000000000000000000000000000000000000000..55d7dd4a6658c2a20cc5617f9=
6b278bc4ec2ba17
> --- /dev/null
> +++ b/Documentation/gpu/nova/core/vbios.rst
> @@ -0,0 +1,180 @@
> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +VBIOS
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +This document describes the layout of the VBIOS image which is a series =
of concatenated
> +images in the ROM of the GPU. The VBIOS is mirrored onto the BAR 0 space=
 and is read
> +by both Boot ROM firmware (also known as IFR or init-from-rom firmware) =
on the GPU to
> +boot strap various microcontrollers (PMU, SEC, GSP) with critical initia=
lization before
   bootstrap
> +the driver loads, as well as by the nova-core driver in the kernel to bo=
ot the GSP.
> +
> +The format of the images in the ROM follow the "BIOS Specification" part=
 of the
> +PCI specification, with Nvidia-specific extensions. The ROM images of ty=
pe FwSec
> +are the ones that contain Falcon ucode and what we are mainly looking fo=
r.
> +
> +As an example, the following are the different image types that can be f=
ound in the
> +VBIOS of an Ampere GA102 GPU which is supported by the nova-core driver.
> +
> +- PciAt Image (Type 0x00) - This is the standard PCI BIOS image, whose n=
ame
> +  likely comes from the "IBM PC/AT" architecture.
> +
> +- EFI Image (Type 0x03) - This is the EFI BIOS image. It contains the UE=
FI GOP
> +  driver that is used to display UEFI graphics output.
> +
> +- First FwSec Image (Type 0xE0) - The first FwSec image (Secure Firmware)
> +
> +- Second FwSec Image (Type 0xE0) - The second FwSec image (Secure Firmwa=
re)
> +  contains various different microcodes (also known as an applications) =
that do
              various microcodes?
> +  a range of different functions. The FWSEC ucode is run in heavy-secure=
 mode and
> +  typically runs directly on the GSP (it could be running on a different=
 designated
> +  processor in future generations but as of Ampere, it is the GSP). This=
 firmware
> +  then loads other firmware ucodes onto the PMU and SEC2 microcontroller=
s for gfw
> +  initialization after GPU reset and before the driver loads (see devini=
t.rst).
> +  The DEVINIT ucode is itself another ucode that is stored in this ROM p=
artition.
> +
> +Once located, the Falcon ucodes have "Application Interfaces" in their d=
ata
> +memory (DMEM). For FWSEC, the application interface we use for FWSEC is =
the
> +"DMEM mapper" interface which is configured to run the "FRTS" command. T=
his
> +command carves out the WPR2 (Write-Protected Region) in VRAM. It then pl=
aces
> +important power-management data, called 'FRTS', into this region. The WP=
R2
> +region is only accessible to heavy-secure ucode.
> +
> +.. note::
> +   It is not clear why FwSec has 2 different partitions in the ROM, but =
they both
> +   are of type 0xE0 and can be identified as such. This could be subject=
 to change
> +   in future generations.
> +
> +VBIOS ROM Layout
> +----------------
> +The VBIOS layout is roughly a series of concatenated images as follows:
> +(For more explanations of acronyms, see the detailed descriptions in vbi=
os.rs).

Looks OK, but...

> +
> +.. note::
> +   This diagram is created based on an GA-102 Ampere GPU as an example a=
nd could
> +   vary for future or other GPUs.
> +
> +Here is a block diagram of the VBIOS layout::

Above sentence (but not the note directive) is redundant, though.

> +
> +    +-------------------------------------------------------------------=
---------+
> +    | VBIOS (Starting at ROM_OFFSET: 0x300000)                          =
         |
> +    +-------------------------------------------------------------------=
---------+
> +    | +-----------------------------------------------+                 =
         |
> +    | | PciAt Image (Type 0x00)                       |                 =
         |
> +    | +-----------------------------------------------+                 =
         |
> +    | | +-------------------+                         |                 =
         |
> +    | | | ROM Header        |                         |                 =
         |
> +    | | | (Signature 0xAA55)|                         |                 =
         |
> +    | | +-------------------+                         |                 =
         |
> +    | |         | rom header's pci_data_struct_offset |                 =
         |
> +    | |         | points to the PCIR structure        |                 =
         |
> +    | |         V                                     |                 =
         |
> +    | | +-------------------+                         |                 =
         |
> +    | | | PCIR Structure    |                         |                 =
         |
> +    | | | (Signature "PCIR")|                         |                 =
         |
> +    | | | last_image: 0x80  |                         |                 =
         |
> +    | | | image_len: size   |                         |                 =
         |
> +    | | | in 512-byte units |                         |                 =
         |
> +    | | +-------------------+                         |                 =
         |
> +    | |         |                                     |                 =
         |
> +    | |         | NPDE immediately follows PCIR       |                 =
         |
> +    | |         V                                     |                 =
         |
> +    | | +-------------------+                         |                 =
         |
> +    | | | NPDE Structure    |                         |                 =
         |
> +    | | | (Signature "NPDE")|                         |                 =
         |
> +    | | | last_image: 0x00  |                         |                 =
         |
> +    | | +-------------------+                         |                 =
         |
> +    | |                                               |                 =
         |
> +    | | +-------------------+                         |                 =
         |
> +    | | | BIT Header        | (Signature scanning     |                 =
         |
> +    | | | (Signature "BIT") |  provides the location  |                 =
         |
> +    | | +-------------------+  of the BIT table)      |                 =
         |
> +    | |         | header is                           |                 =
         |
> +    | |         | followed by a table of tokens       |                 =
         |
> +    | |         V one of which is for falcon data.    |                 =
         |
> +    | | +-------------------+                         |                 =
         |
> +    | | | BIT Tokens        |                         |                 =
         |
> +    | | |  ______________   |                         |                 =
         |
> +    | | | | Falcon Data |   |                         |                 =
         |
> +    | | | | Token (0x70)|---+------------>------------+--+              =
         |
> +    | | | +-------------+   |  falcon_data_ptr()      |  |              =
         |
> +    | | +-------------------+                         |  V              =
         |
> +    | +-----------------------------------------------+  |              =
         |
> +    |              (no gap between images)               |              =
         |
> +    | +-----------------------------------------------+  |              =
         |
> +    | | EFI Image (Type 0x03)                         |  |              =
         |
> +    | +-----------------------------------------------+  |              =
         |
> +    | | Contains the UEFI GOP driver (Graphics Output)|  |              =
         |
> +    | | +-------------------+                         |  |              =
         |
> +    | | | ROM Header        |                         |  |              =
         |
> +    | | +-------------------+                         |  |              =
         |
> +    | | | PCIR Structure    |                         |  |              =
         |
> +    | | +-------------------+                         |  |              =
         |
> +    | | | NPDE Structure    |                         |  |              =
         |
> +    | | +-------------------+                         |  |              =
         |
> +    | | | Image data        |                         |  |              =
         |
> +    | | +-------------------+                         |  |              =
         |
> +    | +-----------------------------------------------+  |              =
         |
> +    |              (no gap between images)               |              =
         |
> +    | +-----------------------------------------------+  |              =
         |
> +    | | First FwSec Image (Type 0xE0)                 |  |              =
         |
> +    | +-----------------------------------------------+  |              =
         |
> +    | | +-------------------+                         |  |              =
         |
> +    | | | ROM Header        |                         |  |              =
         |
> +    | | +-------------------+                         |  |              =
         |
> +    | | | PCIR Structure    |                         |  |              =
         |
> +    | | +-------------------+                         |  |              =
         |
> +    | | | NPDE Structure    |                         |  |              =
         |
> +    | | +-------------------+                         |  |              =
         |
> +    | | | Image data        |                         |  |              =
         |
> +    | | +-------------------+                         |  |              =
         |
> +    | +-----------------------------------------------+  |              =
         |
> +    |              (no gap between images)               |              =
         |
> +    | +-----------------------------------------------+  |              =
         |
> +    | | Second FwSec Image (Type 0xE0)                |  |              =
         |
> +    | +-----------------------------------------------+  |              =
         |
> +    | | +-------------------+                         |  |              =
         |
> +    | | | ROM Header        |                         |  |              =
         |
> +    | | +-------------------+                         |  |              =
         |
> +    | | | PCIR Structure    |                         |  |              =
         |
> +    | | +-------------------+                         |  |              =
         |
> +    | | | NPDE Structure    |                         |  |              =
         |
> +    | | +-------------------+                         |  |              =
         |
> +    | |                                               |  |              =
         |
> +    | | +-------------------+                         |  |              =
         |
> +    | | | PMU Lookup Table  | <- falcon_data_offset <----+              =
         |
> +    | | | +-------------+   |    pmu_lookup_table     |                 =
         |
> +    | | | | Entry 0x85  |   |                         |                 =
         |
> +    | | | | FWSEC_PROD  |   |                         |                 =
         |
> +    | | | +-------------+   |                         |                 =
         |
> +    | | +-------------------+                         |                 =
         |
> +    | |         |                                     |                 =
         |
> +    | |         | points to                           |                 =
         |
> +    | |         V                                     |                 =
         |
> +    | | +-------------------+                         |                 =
         |
> +    | | | FalconUCodeDescV3 | <- falcon_ucode_offset  |                 =
         |
> +    | | | (FWSEC Firmware)  |    fwsec_header()       |                 =
         |
> +    | | +-------------------+                         |                 =
         |
> +    | |         |   immediately followed  by...       |                 =
         |
> +    | |         V                                     |                 =
         |
> +    | | +----------------------------+                |                 =
         |
> +    | | | Signatures + FWSEC Ucode   |                |                 =
         |
> +    | | | fwsec_sigs(), fwsec_ucode()|                |                 =
         |
> +    | | +----------------------------+                |                 =
         |
> +    | +-----------------------------------------------+                 =
         |
> +    |                                                                   =
         |
> +    +-------------------------------------------------------------------=
---------+
> +
> +Falcon data Lookup
> +------------------
> +A key part of the VBIOS extraction code (vbios.rs) is to find the locati=
on of the
> +Falcon data in the VBIOS which contains the PMU lookup table. This looku=
p table is
> +used to find the required Falcon ucode based on an application ID.
> +
> +The location of the PMU lookup table is found by scanning the BIT (`BIOS=
 Information Table`_)
> +tokens for a token with the id `BIT_TOKEN_ID_FALCON_DATA` (0x70) which i=
ndicates the
> +offset of the same from the start of the VBIOS image. Unfortunately, the=
 offset
> +does not account for the EFI image located between the PciAt and FwSec i=
mages.
> +The `vbios.rs` code compensates for this with appropriate arithmetic.
> +
> +.. _`BIOS Information Table`: https://download.nvidia.com/open-gpu-doc/B=
IOS-Information-Table/1/BIOS-Information-Table.html

The rest looks good.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--dcvzE3w8GZbsAc7N
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaGXMrwAKCRD2uYlJVVFO
o/gJAP9jlcd/JgjSS+ZtfVD1Ol3IKve2PGOU8NWjOZb3riPbKAD/fKtPOiNkS/Xk
V8jmP5oeb2MVjpif7ckRWNLTom80Fw0=
=9m7c
-----END PGP SIGNATURE-----

--dcvzE3w8GZbsAc7N--
