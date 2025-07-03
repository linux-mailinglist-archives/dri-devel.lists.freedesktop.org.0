Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 443CCAF66C9
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 02:29:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CEDA10E7BD;
	Thu,  3 Jul 2025 00:29:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fbBzHgBJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC8E210E7BD;
 Thu,  3 Jul 2025 00:29:53 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-234bfe37cccso90098875ad.0; 
 Wed, 02 Jul 2025 17:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751502593; x=1752107393; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=U3btm0C+OgxQ5QEm2FQI37az+ANU6clMCCL/nrwET2o=;
 b=fbBzHgBJkvY4knfXzVyjT3VsCF62jNCCJBxnAGBLP9m9YDxsnKr+1/V7mNJ5Jty712
 8S8I3wY3vlkq6BselVHpPuZmexzdciJsuribP1/N/eLRkmsmEIoC59CwXqyy2Bvz81bM
 XUfDtvs4gV67m1wwCtQqv763xaZeUekOyEiEOVinzx8EAkLbM/hbWQvPIZPW+xiyW1EE
 jX+kTGzBt7/VTMb3zrmtpspKhPkTC218toC0Z1/C2ri6jAcBSLAh1GFkYxKQw+dZE2Gh
 HiYka1OgNO0TgCCwxoD4awOR923uKOrCRA18Df4RMdn9zH9+3+wekkHlzUG9dHA6eWw0
 95kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751502593; x=1752107393;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U3btm0C+OgxQ5QEm2FQI37az+ANU6clMCCL/nrwET2o=;
 b=UbipUYq3vfTCNclo2sIo82NTTJaZBD7RSqVtoJ/pDOSbTpMPu9jjmxJhauHeonscfc
 gvNeOG60oJYCeUbis6rVxogjouCy6YqH6b3e32blaRlzcTobO7Q1Vfms11rKeT3iKzmE
 GDldQ6xVSRtXWkkRVkBviNt2y7VKqwiD9Os6izvSx6JW7f1jqq6j/ldThlmr/cMvZilI
 txPf/j4Gd7nn8MOKhMPJl9WNBBTol1Pud3Rehy/Rz/qij5/Blhsbp+FY0H61kpo3knWc
 gQppisQKehe5B2D/x/yJivaPm19CU1YEOeIorEhkQbbm0wkI7dDGV0jGxe/u28sLIM3i
 JOxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWonJJKN0M+Im8qxN7lmNl2sQPWz3nFSjGHWWcjSHLfTqd0mB6TpWCv6etIWIW0iUaeFFJObLf0f60=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwwM4VC+Q0UaalNU1c8/kiuLn4kdXOXcJajJNf59TsmUStJNxrH
 W2ogTNuvbYU6PERcnEJCQmHDogR7FQUkBy8uvDzcydVykJb139aMBXWR
X-Gm-Gg: ASbGncuyKE4/RoJ1IjNtuxpGWEcqJwKydKzz6DDPwg6zU+zfArn8CunCfo7PrYHuWJN
 gNl8tVrcqzid7LstwK+39dwYcliE5ftIX724jceThZwzPDVtoyOzoL/x4ZmEbCIEP+F5ZLx877a
 Qw4x9FcbHXSlNVXA/dPV5ye52rop9sXNuufnfydlIINCGTs0oSpoVp0tbDtF4w9hbjLXw4dBfz5
 fZWeaCp7/sEvOemO3noywLzUThI9GUgHn8dbM0VEVFccjn4jIydrtvXCcqJ9u6JEo1ZCks+K7oP
 /MetEcLM5w003f8G228JyQ1pFFlQWjqHmHAn+p2qb2QeE36pQBpVaxsix+gexDnrWn3Nm+pb
X-Google-Smtp-Source: AGHT+IGaXUIDqbVoHXfydy5dOy7oCHo+S3QFh3Rub7jZRkYV5azpHyz/qCWKYAcEQmn75CBb9Ofogg==
X-Received: by 2002:a17:902:e886:b0:236:7050:74af with SMTP id
 d9443c01a7336-23c796a16bfmr20576375ad.9.1751502592903; 
 Wed, 02 Jul 2025 17:29:52 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb3c956asm136349465ad.237.2025.07.02.17.29.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 17:29:51 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id D9B3C4206887; Thu, 03 Jul 2025 07:29:48 +0700 (WIB)
Date: Thu, 3 Jul 2025 07:29:48 +0700
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
Subject: Re: [PATCH v3 7/7] Documentation: gpu: nova-core: Document basics of
 the Falcon
Message-ID: <aGXO_IHrEVOR2MwQ@archie.me>
References: <20250702-nova-docs-v3-0-f362260813e2@nvidia.com>
 <20250702-nova-docs-v3-7-f362260813e2@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="020yO6lyeKvFuC8W"
Content-Disposition: inline
In-Reply-To: <20250702-nova-docs-v3-7-f362260813e2@nvidia.com>
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


--020yO6lyeKvFuC8W
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 02, 2025 at 08:00:44PM +0900, Alexandre Courbot wrote:
> diff --git a/Documentation/gpu/nova/core/falcon.rst b/Documentation/gpu/n=
ova/core/falcon.rst
> new file mode 100644
> index 0000000000000000000000000000000000000000..33137082eb6c14cecda2fbe6f=
db79e63ee9ca2e6
> --- /dev/null
> +++ b/Documentation/gpu/nova/core/falcon.rst
> @@ -0,0 +1,158 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> +Falcon (FAst Logic Controller)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> +The following sections describe the Falcon core and the ucode running on=
 it.
> +The descriptions are based on the Ampere GPU or earlier designs; however=
, they
> +should mostly apply to future designs as well, but everything is subject=
 to
> +change. The overview provided here is mainly tailored towards understand=
ing the
> +interactions of nova-core driver with the Falcon.
> +
> +NVIDIA GPUs embed small RISC-like microcontrollers called Falcon cores, =
which
> +handle secure firmware tasks, initialization, and power management. Mode=
rn
> +NVIDIA GPUs may have multiple such Falcon instances (e.g., GSP (the GPU =
system
> +processor) and SEC2 (the security engine)) and also may integrate a RISC=
-V core.
> +This core is capable of running both RISC-V and Falcon code.
> +
> +The code running on the Falcon cores is also called 'ucode', and will be
> +referred to as such in the following sections.
> +
> +Falcons have separate instruction and data memories (IMEM/DMEM) and prov=
ide a
> +small DMA engine (via the FBIF - "Frame Buffer Interface") to load code =
=66rom
> +system memory. The nova-core driver must reset and configure the Falcon,=
 load
> +its firmware via DMA, and start its CPU.
> +
> +Falcon security levels
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Falcons can run in Non-secure (NS), Light Secure (LS), or Heavy Secure (=
HS)
> +modes.
> +
> +Heavy Secured (HS) also known as Privilege Level 3 (PL3)
> +--------------------------------------------------------
> +HS ucode is the most trusted code and has access to pretty much everythi=
ng on
> +the chip. The HS binary includes a signature in it which is verified at =
boot.
> +This signature verification is done by the hardware itself, thus establi=
shing a
> +root of trust. For example, the FWSEC-FRTS command (see fwsec.rst) runs =
on the
> +GSP in HS mode. FRTS, which involves setting up and loading content into=
 the WPR
> +(Write Protect Region), has to be done by the HS ucode and cannot be don=
e by the
> +host CPU or LS ucode.
> +
> +Light Secured (LS or PL2) and Non Secured (NS or PL0)
> +-----------------------------------------------------
> +These modes are less secure than HS. Like HS, the LS or NS ucode binary =
also
> +typically includes a signature in it. To load firmware in LS or NS mode =
onto a
> +Falcon, another Falcon needs to be running in HS mode, which also establ=
ishes the
> +root of trust. For example, in the case of an Ampere GPU, the CPU runs t=
he "Booter"
> +ucode in HS mode on the SEC2 Falcon, which then authenticates and runs t=
he
> +run-time GSP binary (GSP-RM) in LS mode on the GSP Falcon. Similarly, as=
 an
> +example, after reset on an Ampere, FWSEC runs on the GSP which then load=
s the
> +devinit engine onto the PMU in LS mode.
> +
> +Root of trust establishment
> +---------------------------
> +To establish a root of trust, the code running on a Falcon must be immut=
able and
> +hardwired into a read-only memory (ROM). This follows industry norms for
> +verification of firmware. This code is called the Boot ROM (BROM). The n=
ova-core
> +driver on the CPU communicates with Falcon's Boot ROM through various Fa=
lcon
> +registers prefixed with "BROM" (see regs.rs).
> +
> +After nova-core driver reads the necessary ucode from VBIOS, it programs=
 the
> +BROM and DMA registers to trigger the Falcon to load the HS ucode from t=
he system
> +memory into the Falcon's IMEM/DMEM. Once the HS ucode is loaded, it is v=
erified
> +by the Falcon's Boot ROM.
> +
> +Once the verified HS code is running on a Falcon, it can verify and load=
 other
> +LS/NS ucode binaries onto other Falcons and start them. The process of s=
ignature
> +verification is the same as HS; just in this case, the hardware (BROM) d=
oesn't
> +compute the signature, but the HS ucode does.
> +
> +The root of trust is therefore established as follows:
> +     Hardware (Boot ROM running on the Falcon) -> HS ucode -> LS/NS ucod=
e.
> +
> +On an Ampere GPU, for example, the boot verification flow is:
> +     Hardware (Boot ROM running on the SEC2) ->
> +          HS ucode (Booter running on the SEC2) ->
> +               LS ucode (GSP-RM running on the GSP)
> +
> +.. note::
> +     While the CPU can load HS ucode onto a Falcon microcontroller and h=
ave it
> +     verified by the hardware and run, the CPU itself typically does not=
 load
> +     LS or NS ucode and run it. Loading of LS or NS ucode is done mainly=
 by the
> +     HS ucode. For example, on an Ampere GPU, after the Booter ucode run=
s on the
> +     SEC2 in HS mode and loads the GSP-RM binary onto the GSP, it needs =
to run
> +     the "SEC2-RTOS" ucode at runtime. This presents a problem: there is=
 no
> +     component to load the SEC2-RTOS ucode onto the SEC2. The CPU cannot=
 load
> +     LS code, and GSP-RM must run in LS mode. To overcome this, the GSP =
is
> +     temporarily made to run HS ucode (which is itself loaded by the CPU=
 via
> +     the nova-core driver using a "GSP-provided sequencer") which then l=
oads
> +     the SEC2-RTOS ucode onto the SEC2 in LS mode. The GSP then resumes
> +     running its own GSP-RM LS ucode.
> +
> +Falcon memory subsystem and DMA engine
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Falcons have separate instruction and data memories (IMEM/DMEM)
> +and contains a small DMA engine called FBDMA (Framebuffer DMA) which does
> +DMA transfers to/from the IMEM/DMEM memory inside the Falcon via the FBIF
> +(Framebuffer Interface), to external memory.
> +
> +DMA transfers are possible from the Falcon's memory to both the system m=
emory
> +and the framebuffer memory (VRAM).
> +
> +To perform a DMA via the FBDMA, the FBIF is configured to decide how the=
 memory
> +is accessed (also known as aperture type). In the nova-core driver, this=
 is
> +determined by the `FalconFbifTarget` enum.
> +
> +The IO-PMP block (Input/Output Physical Memory Protection) unit in the F=
alcon
> +controls access by the FBDMA to the external memory.
> +
> +Conceptual diagram (not exact) of the Falcon and its memory subsystem is=
 as follows::
> +
> +               External Memory (Framebuffer / System DRAM)
> +                              ^  |
> +                              |  |
> +                              |  v
> +     +-----------------------------------------------------+
> +     |                           |                         |
> +     |   +---------------+       |                         |
> +     |   |     FBIF      |-------+                         |  FALCON
> +     |   | (FrameBuffer  |   Memory Interface              |  PROCESSOR
> +     |   |  InterFace)   |                                 |
> +     |   |  Apertures    |                                 |
> +     |   |  Configures   |                                 |
> +     |   |  mem access   |                                 |
> +     |   +-------^-------+                                 |
> +     |           |                                         |
> +     |           | FBDMA uses configured FBIF apertures    |
> +     |           | to access External Memory
> +     |           |
> +     |   +-------v--------+      +---------------+
> +     |   |    FBDMA       |  cfg |     RISC      |
> +     |   | (FrameBuffer   |<---->|     CORE      |----->. Direct Core Ac=
cess
> +     |   |  DMA Engine)   |      |               |      |
> +     |   | - Master dev.  |      | (can run both |      |
> +     |   +-------^--------+      | Falcon and    |      |
> +     |           |        cfg--->| RISC-V code)  |      |
> +     |           |        /      |               |      |
> +     |           |        |      +---------------+      |    +----------=
--+
> +     |           |        |                             |    |   BROM   =
  |
> +     |           |        |                             <--->| (Boot ROM=
) |
> +     |           |       /                              |    +----------=
--+
> +     |           |      v                               |
> +     |   +---------------+                              |
> +     |   |    IO-PMP     | Controls access by FBDMA     |
> +     |   | (IO Physical  | and other IO Masters         |
> +     |   | Memory Protect)                              |
> +     |   +-------^-------+                              |
> +     |           |                                      |
> +     |           | Protected Access Path for FBDMA      |
> +     |           v                                      |
> +     |   +---------------------------------------+      |
> +     |   |       Memory                          |      |
> +     |   |   +---------------+  +------------+   |      |
> +     |   |   |    IMEM       |  |    DMEM    |   |<-----+
> +     |   |   | (Instruction  |  |   (Data    |   |
> +     |   |   |  Memory)      |  |   Memory)  |   |
> +     |   |   +---------------+  +------------+   |
> +     |   +---------------------------------------+
> +     +-----------------------------------------------------+

The wording LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--020yO6lyeKvFuC8W
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaGXO/AAKCRD2uYlJVVFO
o30tAPj2OirzElzOU7jnaff+3cI7ewT77HSFpgReywWOS/AsAQCeoTuIZdUMVWb2
LkqPz8Waim5p1YxyJF/CNBA6cc70Cw==
=cIhU
-----END PGP SIGNATURE-----

--020yO6lyeKvFuC8W--
