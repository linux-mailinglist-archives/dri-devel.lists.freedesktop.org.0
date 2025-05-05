Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E2CAA8B6A
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 06:14:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83F2A10E258;
	Mon,  5 May 2025 04:14:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UcVaDdX9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81E1110E253;
 Mon,  5 May 2025 04:14:05 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-22928d629faso36108845ad.3; 
 Sun, 04 May 2025 21:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746418444; x=1747023244; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=l1LpDnhLJgDU1QRp3lqDCTiCNSE9ok/7E/ZGoIZajrI=;
 b=UcVaDdX9H7wgg4x/S4Wf0+fHz79Go2LAC8SBj4fpu2NsNOxFlJxM+SQ3tgZ+SkMbQN
 ErTLVoeyfiBJrRtyMgdHeNtXzo9nV0quB/UC6tqk0De6KN7YGX4bWpdAO2zRDNEp93dX
 omEx0Refi/Q9Yr99inlM/I16Bcy9E/sSsVOAgASMSq2XAs5+yCwrTD1MDJYkjjey8whc
 js1alwA72hXQlsmmHU2H5WQapSW7UUt6xeUsWXH7QSH6d/qYhfAhu+QPf+ZI0M/p+Cgy
 5pJb3IhcbjCEfSd6Obpsb0OxMgrtjcprdvc7FIBZNInzc1DCanJ28wcP/25lTXm7UvWu
 3Tsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746418444; x=1747023244;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l1LpDnhLJgDU1QRp3lqDCTiCNSE9ok/7E/ZGoIZajrI=;
 b=LvHWU0D3U3ZB9Ea+59zCuVMW6zyZF+pJViu+iSvx7Wt5/LyJ5/cphbDdeEnX8kuTH9
 879Ir9JW/yWzqI7SA8YT1FqfZWAS8pZssnsPmceucTJeBJESDqlgSNmuw6W5ojPZle+1
 LEEKEn3Uo91qDsRgMumNAbluPqcuTTD/75jSNx9uxIMDa4Hp/GVxqBUiQAgVBmy5z6vQ
 NxB8cFGq3jOmBUAi5bPRgVCyTIMtFMKi5yJ5PC9PcnfKoEDOQ3HSjF2S1f5K6Hvw+fU0
 3sqnCfFtwrolZ/tx3el7VmxSVhO012DcxDbMtkFjCN3wPhHhaA/jwjaXXsdwKOtGn1n+
 2mmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+uXf8GU8uYN0LflpG5Diqnsp2O0quzvKbWAs9zX81mYszJXN9V8dBSFrAIygf53U91dG7tUn5I9A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzOWH2/bifHFBCCQ9BZwsxGFJJLAqhEc930d7369q5xDz0PLOco
 EjlwZUvQuNPLvmnVyNFj/H+NuQGngvBT5/11mXoodcUGqTE4qgxy
X-Gm-Gg: ASbGnctMSz0oE9dj83GQKKQPgRGpk2At1AJnpr6IPrn3gbwjjp3pGZ2WQZFecBK6Hvl
 RdeofMaZtfTKEZvRSmmI/f6Vfz+fMqfD055ng2NlO66bhB9ZSGp1CryCO2Xqk9vmCsl3y/decTX
 ktl4ADQU2n5O1nVoW0EeH1aBipm8or9vkCdCTlOC1ALm0ZoE29qw4X3U90SaiRiQTfSTw06LK4n
 cJG2S9XMLTfSI3Lc0neH5bOQgkfVv1fEbAvtMUXRXNsf9IxyPTH4Mc4fAOrz2n/dpWehm0roN1R
 YDEYKGSsjFxuK9oo0jcOSNdcRRkiKkITJvqQuIPS
X-Google-Smtp-Source: AGHT+IEK1O4aQEQhNSHHYVvpvpv0xPif9mmHoJQDOFHdu6HbE68r9NGJpzuixg3pzhEgwObGHD0OLg==
X-Received: by 2002:a17:903:32c9:b0:211:e812:3948 with SMTP id
 d9443c01a7336-22e1e6f03bfmr81066455ad.0.1746418444460; 
 Sun, 04 May 2025 21:14:04 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22e151ea17csm45304685ad.95.2025.05.04.21.14.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 May 2025 21:14:03 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id B2070423CC6A; Mon, 05 May 2025 11:14:01 +0700 (WIB)
Date: Mon, 5 May 2025 11:14:01 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alexandre Courbot <acourbot@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>,
 Shirish Baskaran <sbaskaran@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Ben Skeggs <bskeggs@nvidia.com>, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 6/7] docs: nova-core: Document basics of the Falcon
Message-ID: <aBg7CUoAo1xyYlo8@archie.me>
References: <20250503040802.1411285-1-joelagnelf@nvidia.com>
 <20250503040802.1411285-7-joelagnelf@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qL8Yt/S+SdYspBq8"
Content-Disposition: inline
In-Reply-To: <20250503040802.1411285-7-joelagnelf@nvidia.com>
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


--qL8Yt/S+SdYspBq8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 03, 2025 at 12:07:58AM -0400, Joel Fernandes wrote:
> +Conceptual diagram (not exact) of the Falcon and its memory subsystem is=
 as follows:
> +
> +           External Memory (Framebuffer / System DRAM)
> +                            =E2=96=B2  =E2=94=82
> +                            =E2=94=82  =E2=94=82
> +                            =E2=94=82  =E2=96=BC
> +=E2=94=8F=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=B3=E2=94=81=E2=94=81=E2=94=BB=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=93
> +=E2=94=83                           =E2=94=82                         =
=E2=94=83
> +=E2=94=83   =E2=94=8F=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=93       =E2=94=82                         =E2=94=83
> +=E2=94=83   =E2=94=83     FBIF      =E2=94=A3=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=9B                         =E2=
=94=83  FALCON
> +=E2=94=83   =E2=94=83 (FrameBuffer  =E2=94=83   Memory Interface        =
      =E2=94=83  PROCESSOR
> +=E2=94=83   =E2=94=83  InterFace)   =E2=94=83                           =
      =E2=94=83
> +=E2=94=83   =E2=94=83  Apertures    =E2=94=83                           =
      =E2=94=83
> +=E2=94=83   =E2=94=83  Configures   =E2=94=83                           =
      =E2=94=83
> +=E2=94=83   =E2=94=83  mem access   =E2=94=83                           =
      =E2=94=83
> +=E2=94=83   =E2=94=97=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=96=B2=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=9B                                 =E2=94=83
> +=E2=94=83           =E2=94=82                                         =
=E2=94=83
> +=E2=94=83           =E2=94=82 FBDMA uses configured FBIF apertures    =
=E2=94=83
> +=E2=94=83           =E2=94=82 to access External Memory
> +=E2=94=83           =E2=94=82
> +=E2=94=83   =E2=94=8F=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=96=BC=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=93      =E2=94=8F=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=93
> +=E2=94=83   =E2=94=83    FBDMA      =E2=94=83  cfg =E2=94=83     RISC   =
    =E2=94=83
> +=E2=94=83   =E2=94=83 (FrameBuffer  =E2=94=A3<=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80>=E2=94=AB     CORE       =E2=94=A3=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80>. Direct Core Access
> +=E2=94=83   =E2=94=83  DMA Engine)  =E2=94=83      =E2=94=83            =
    =E2=94=83      =E2=94=83
> +=E2=94=83   =E2=94=83 - Master dev. =E2=94=83      =E2=94=83 (can run bo=
th  =E2=94=83      =E2=94=83
> +=E2=94=83   =E2=94=97=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=96=B2=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=9B      =E2=94=83 Falcon and     =E2=94=83      =E2=94=83
> +=E2=94=83           =E2=94=82        cfg-->=E2=94=83 RISC-V code)   =E2=
=94=83      =E2=94=83
> +=E2=94=83           =E2=94=82        /     =E2=94=83                =E2=
=94=83      =E2=94=83
> +=E2=94=83           =E2=94=82        |     =E2=94=97=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=9B      =E2=94=83=
    =E2=94=8F=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=93
> +=E2=94=83           =E2=94=82        =E2=94=82                          =
   =E2=94=83    =E2=94=83   BROM     =E2=94=83
> +=E2=94=83           =E2=94=82        =E2=94=82                          =
   <=E2=94=80=E2=94=80=E2=94=80>=E2=94=AB (Boot ROM) =E2=94=83
> +=E2=94=83           =E2=94=82       /                              =E2=
=94=83    =E2=94=97=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=9B
> +=E2=94=83           =E2=94=82      =E2=96=BC                            =
   =E2=94=83
> +=E2=94=83   =E2=94=8F=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=93                              =E2=94=83
> +=E2=94=83   =E2=94=83    IO-PMP     =E2=94=83 Controls access by FBDMA  =
   =E2=94=83
> +=E2=94=83   =E2=94=83 (IO Physical  =E2=94=83 and other IO Masters      =
   =E2=94=83
> +=E2=94=83   =E2=94=83 Memory Protect)                              =E2=
=94=83
> +=E2=94=83   =E2=94=97=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=96=B2=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=9B                              =E2=94=83
> +=E2=94=83           =E2=94=82                                      =E2=
=94=83
> +=E2=94=83           =E2=94=82 Protected Access Path for FBDMA      =E2=
=94=83
> +=E2=94=83           =E2=96=BC                                      =E2=
=94=83
> +=E2=94=83   =E2=94=8F=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=93      =E2=94=83
> +=E2=94=83   =E2=94=83       Memory                          =E2=94=83   =
   =E2=94=83
> +=E2=94=83   =E2=94=83   =E2=94=8F=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=93  =E2=94=8F=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=93  =E2=94=83      =E2=94=83
> +=E2=94=83   =E2=94=83   =E2=94=83    IMEM       =E2=94=83  =E2=94=83    =
DMEM     =E2=94=83  =E2=94=83<=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=9B
> +=E2=94=83   =E2=94=83   =E2=94=83 (Instruction  =E2=94=83  =E2=94=83   (=
Data     =E2=94=83  =E2=94=83
> +=E2=94=83   =E2=94=83   =E2=94=83  Memory)      =E2=94=83  =E2=94=83   M=
emory)   =E2=94=83  =E2=94=83
> +=E2=94=83   =E2=94=83   =E2=94=97=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=9B  =E2=94=97=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=9B  =E2=94=83
> +=E2=94=83   =E2=94=97=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=9B
> +=E2=94=97=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81

Wrap the diagram in literal code block. Also, note that it can look messy in
htmldocs output with certain fonts due to box drawing characters. Consider =
using
ASCII constructs (dashes and vertical bars) instead.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--qL8Yt/S+SdYspBq8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaBg7CQAKCRD2uYlJVVFO
o2ooAP9EDkF20n/zrhDf903MO937RaMeOnqKk5pD0BdlUxaF/gD7Bacq7T46phOm
zX7FsWCdSWe2piN5J8ZWoFIws4kd3wQ=
=4DmV
-----END PGP SIGNATURE-----

--qL8Yt/S+SdYspBq8--
