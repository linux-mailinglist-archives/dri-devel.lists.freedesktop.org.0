Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4049700EC
	for <lists+dri-devel@lfdr.de>; Sat,  7 Sep 2024 10:34:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41F7710E208;
	Sat,  7 Sep 2024 08:34:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MKwpQEll";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D5310E205;
 Sat,  7 Sep 2024 08:33:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6A649A403C8;
 Sat,  7 Sep 2024 08:33:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F111C4CED8;
 Sat,  7 Sep 2024 08:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725698037;
 bh=28Hazu9X3gNJl3G8MxXIbEf04c6aPW6n4xtnOcKil40=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=MKwpQEllnQB/o8CNMzuyJtbtiSGA+c5UZDrKGjDxHolsbO1UhCd4PmE1n6r5WOdDA
 aLy+2o9C8YF5F/xgPJ4eXT93pMOt8VR5rY62KJd77ozp/lijD7K/hpeIOOyAzloBRM
 DuT33ZzmWKzdksD+17/mPMmpfoCnwxp1ZJkctGIbbknkfH6YVGpY7IDRG5SfkA6bSi
 sasFCTcByKHpiVYyalHp4Qii6QkesPzs3eD8fJ/EKuw4BxDl7+v8NOY+cISIeep8cl
 USjETT0gIF5DsrL4trTRk8waMzX2ibQg9a8xMzpyqVqP9wJyeVTsEr5XCX6nHP5toK
 QTBAYBcP7A5jQ==
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-535be093a43so3513826e87.3; 
 Sat, 07 Sep 2024 01:33:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVpoE8y9+rn8tLH/CaDtzOv6ZIQ4ghaVsVeQAk7fmWfGq+dmc7zfW1sAQtiyXqfbQJNOXMnhBKMdnE=@lists.freedesktop.org,
 AJvYcCX+MES2MSU+gHFrbLhbEIVWjsrLq8Ea19wKgdeaiDbZG5FgkAeQnhPpdaICJRZEVwWzb53Aw+uDToo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzb0VBmoHQF83gXOVpGqFO3br/LHvgYvzjL3vHDr7lncL2CgD8z
 Zu71SYpNJVmsISQD+xHf/q0tKTkNhXxU7suBlr5TO0cltwBm/GlhP/qAC5DYLsevi1RgGlCcKM/
 9aNhVzuZqUYNRDyzto2eceCYV1rA=
X-Google-Smtp-Source: AGHT+IGiO0grfYCPThFgBWdbGnh5ywWPEfhApDWuSp1Dpho+N3p8He+DadB7u7HS7zJcZD43BZdwwTxPjh5NmXNMfjQ=
X-Received: by 2002:a05:6512:e97:b0:533:3fc8:9ac0 with SMTP id
 2adb3069b0e04-536587c6a50mr3459219e87.34.1725698035371; Sat, 07 Sep 2024
 01:33:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240906-macos-build-support-v2-0-06beff418848@samsung.com>
 <20240906-macos-build-support-v2-8-06beff418848@samsung.com>
In-Reply-To: <20240906-macos-build-support-v2-8-06beff418848@samsung.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 7 Sep 2024 17:33:18 +0900
X-Gmail-Original-Message-ID: <CAK7LNASpWSXbjF_7n0MhosNism=BpvHOnKsa344RPM_wmC9dGA@mail.gmail.com>
Message-ID: <CAK7LNASpWSXbjF_7n0MhosNism=BpvHOnKsa344RPM_wmC9dGA@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] Documentation: add howto build in macos
To: da.gomez@samsung.com
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 William Hubbs <w.d.hubbs@gmail.com>, Chris Brannon <chris@the-brannons.com>, 
 Kirk Reiser <kirk@reisers.ca>, Samuel Thibault <samuel.thibault@ens-lyon.org>, 
 Paul Moore <paul@paul-moore.com>,
 Stephen Smalley <stephen.smalley.work@gmail.com>, 
 Ondrej Mosnacek <omosnace@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, 
 James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, speakup@linux-speakup.org, 
 selinux@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, linux-serial@vger.kernel.org, llvm@lists.linux.dev, 
 Finn Behrens <me@kloenk.dev>, "Daniel Gomez (Samsung)" <d+samsung@kruces.com>,
 gost.dev@samsung.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Sep 6, 2024 at 8:01=E2=80=AFPM Daniel Gomez via B4 Relay
<devnull+da.gomez.samsung.com@kernel.org> wrote:
>
> From: Daniel Gomez <da.gomez@samsung.com>
>
> Add documentation under kbuild/llvm to inform about the experimental
> support for building the Linux kernel in macOS hosts environments.
>
> Signed-off-by: Daniel Gomez <da.gomez@samsung.com>


Instead, you can add this instruction to:

https://github.com/bee-headers/homebrew-bee-headers/blob/main/README.md





> ---
>  Documentation/kbuild/llvm.rst | 78 +++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 78 insertions(+)
>
> diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rs=
t
> index 6dc66b4f31a7..de3bde925793 100644
> --- a/Documentation/kbuild/llvm.rst
> +++ b/Documentation/kbuild/llvm.rst
> @@ -186,6 +186,84 @@ yet. Bug reports are always welcome at the issue tra=
cker below!
>       - Supported
>       - ``LLVM=3D1``
>
> +Experimental Build in macOS
> +---------------------------
> +
> +Building on macOS with LLVM is experimental. This section provides steps=
 to
> +install dependencies via Homebrew, set up the environment, and start the=
 build
> +process.
> +
> +1. **Create a Case-Sensitive Volume**
> +
> +   For fetching and building the project, you need a case-sensitive volu=
me. Use the following
> +   command to create one:
> +
> +   .. code-block:: shell
> +
> +      diskutil apfs addVolume /dev/disk<N> "Case-sensitive APFS" linux
> +
> +   Replace `/dev/disk<N>` with the appropriate disk identifier.
> +
> +2. **Install Build Dependencies**
> +
> +Use Homebrew to install the required build dependencies.
> +
> +- **Core Utilities**: `coreutils`, `findutils`, `gnu-sed`, `gnu-tar`, `g=
rep`,
> +  `llvm`, `make`, and `pkg-config`.
> +
> +   .. code-block:: shell
> +
> +      brew install coreutils findutils gnu-sed gnu-tar grep llvm make pk=
g-config
> +
> +- **Bee Headers**: Install byteswap, elf and endian headers using the
> +  `Bee Headers Project <https://github.com/bee-headers/headers>`_.
> +
> +   .. code-block:: shell
> +
> +      brew tap bee-headers/bee-headers
> +      brew install bee-headers/bee-headers/bee-headers
> +
> +   After installation, verify the `CFLAGS` with `pkg-config`:
> +
> +   .. code-block:: shell
> +
> +      pkg-config --cflags bee-headers
> +      -I/opt/homebrew/Cellar/bee-headers/0.1/include
> +
> +3. **Configure the PATH**
> +
> +   Include all the required GNU tools and LLVM in your `PATH`. This ensu=
res that
> +   the necessary tools are available during the build process.
> +
> +   .. code-block:: shell
> +
> +      PATH=3D"/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
> +      PATH=3D"/opt/homebrew/opt/findutils/libexec/gnubin:$PATH"
> +      PATH=3D"/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
> +      PATH=3D"/opt/homebrew/opt/gnu-tar/libexec/gnubin:$PATH"
> +      PATH=3D"/opt/homebrew/opt/grep/libexec/gnubin:$PATH"
> +      PATH=3D"/opt/homebrew/opt/make/libexec/gnubin:$PATH"
> +      PATH=3D"/opt/homebrew/opt/llvm/bin:$PATH"
> +
> +Building the Project
> +--------------------
> +
> +Once the environment is set up, you can start the build process using LL=
VM. Run
> +the following commands to initiate the build:
> +
> +.. code-block:: shell
> +
> +   make LLVM=3D1 allyesconfig
> +   make LLVM=3D1 -j$(nproc)
> +
> +Supported in macOS
> +~~~~~~~~~~~~~~~~~~
> +
> +At the moment, only arm64 is supported and tested with `allyesconfig` Ma=
kefile
> +configuration target. Other Kconfig options not included in `allyesconfi=
g`
> +target and architectures may be supported as well as support in macOS is=
 based
> +on LLVM effort and maintenance.
> +
>  Getting Help
>  ------------
>
>
> --
> 2.46.0
>
>


--
Best Regards
Masahiro Yamada
