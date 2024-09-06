Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 535B496F77D
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 16:54:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A0B410EA7C;
	Fri,  6 Sep 2024 14:54:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.b="DBdZlxtf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com
 [209.85.221.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F3F410EA7C
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 14:54:29 +0000 (UTC)
Received: by mail-vk1-f175.google.com with SMTP id
 71dfb90a1353d-502b8d7033cso37419e0c.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Sep 2024 07:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore.com; s=google; t=1725634468; x=1726239268;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MsXB+HsGxSbnX/oa3Y2+uGuA8knOAtnaTuSxqQBTqAQ=;
 b=DBdZlxtfyqyk7H9tLxCcwB+Ly2qkI1umaPwPQbyn8SydOm557zNqigexNFA7+ZgpyT
 pw4k0E64xWJGtGgeXvEkL4Fefhi4Z+wuWgX0oeLmmL1C44EeB3C68GpX/wfiSpupDHnD
 KnIhC3EqHzZliYFyud0Pv9diYSX4RMZ84pgDE9tZS+3sXsrGf+vl8oYU7grwT1N0f7+D
 YcWvty3N3YswXRqTAMWD75VW1vL2QDhGfOF0uwQsfaXU7lOVKz/jZdb9YjFhXkKLtlfj
 fjCGdwe5JxzZ9BfB12Z9aXNB/eXTc4D0n6BRv0FRK32qWynLEqkHlvUX57U00sIokD+a
 VJow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725634468; x=1726239268;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MsXB+HsGxSbnX/oa3Y2+uGuA8knOAtnaTuSxqQBTqAQ=;
 b=qpttVGmelSHT8D0lFwVudI7GBXOPHtbjC41OicCv41ux33aoJPJMPj7MUycK3KeuUu
 /dQKR1SQmrrpJq+AsvaXMzw4iVkdjzf1mG/dMbk3XegLQAJXjFqxP3VPkysePi1xKF+N
 jDIr/ayBCtk8eQOrwhz+Cy20BgaHCgzs6G3c6siCtX0UfxHhEvDouwaC8bEyKdwBaApp
 r41JPb1dk5sWnhYXfq3KIbIqW4wsWyiGw6WGxfGnweLWZgN1Z6ewXqmXQAtowHJ/aL+0
 sZP+MjrmITK0W+teW7TXRcujOr2354dJGBZMcPXbgaKV3PcKPiNCLnHhl8Gy4n5vxqP4
 tkGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFYu0KmRRW7CrCOELDrTb2gbD9ADxIB/L9ldgar/Nm3tTzjJ7Ib89hwmLF/TWr4HLFM5/DSIvJjqg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+14F4vaPTP/Allucvk3zOSEzRX5GIpnalpyj+GH1iEX1aCSgs
 qh7vfGjdBzoFvLLRgUYjBJ7y4ru18K6ArF0yqP8p5P1+aqygRYC26CaYXP4edLoDYO4CH3TkpI0
 OHmdGQNEmqtO0tqfrmUJIlLLXcTfkcNz/cKh0
X-Google-Smtp-Source: AGHT+IE2ETqS8j5INGhOJuEC0LfB5JoY7mno+WUbnlfQDVox+nEHO2zDE8qlvEGgTlm1b5qEJlJi4b2dA1AvozrG+1Y=
X-Received: by 2002:a05:6122:318d:b0:4f6:c44b:2504 with SMTP id
 71dfb90a1353d-502143c9c06mr2840417e0c.10.1725634467954; Fri, 06 Sep 2024
 07:54:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240906-macos-build-support-v2-0-06beff418848@samsung.com>
 <20240906-macos-build-support-v2-7-06beff418848@samsung.com>
In-Reply-To: <20240906-macos-build-support-v2-7-06beff418848@samsung.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 6 Sep 2024 10:54:16 -0400
Message-ID: <CAHC9VhQkstJ8Ox-T+FLU34s9U0gezRba6bMA-tUPs80u6sVh2g@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] selinux: move genheaders to security/selinux/
To: da.gomez@samsung.com
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas@fjasle.eu>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 William Hubbs <w.d.hubbs@gmail.com>, Chris Brannon <chris@the-brannons.com>, 
 Kirk Reiser <kirk@reisers.ca>, Samuel Thibault <samuel.thibault@ens-lyon.org>, 
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Ondrej Mosnacek <omosnace@redhat.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
 Justin Stitt <justinstitt@google.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 speakup@linux-speakup.org, selinux@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-serial@vger.kernel.org, llvm@lists.linux.dev, 
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

On Fri, Sep 6, 2024 at 7:01=E2=80=AFAM Daniel Gomez via B4 Relay
<devnull+da.gomez.samsung.com@kernel.org> wrote:
>
> From: Masahiro Yamada <masahiroy@kernel.org>
>
> This tool is only used in security/selinux/Makefile.
>
> There is no reason to keep it under scripts/.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>  scripts/remove-stale-files                                    | 3 +++
>  scripts/selinux/Makefile                                      | 2 +-
>  scripts/selinux/genheaders/.gitignore                         | 2 --
>  scripts/selinux/genheaders/Makefile                           | 3 ---
>  security/selinux/.gitignore                                   | 1 +
>  security/selinux/Makefile                                     | 7 +++++-=
-
>  {scripts/selinux/genheaders =3D> security/selinux}/genheaders.c | 0
>  7 files changed, 10 insertions(+), 8 deletions(-)

Did you read my comments on your previous posting of this patch?  Here
is a lore link in case you missed it or it was swallowed by your
inbox:

https://lore.kernel.org/selinux/3447459d08dd7ebb58972129cddf1c44@paul-moore=
.com

Unless there is an serious need for this relocation, and I don't see
one explicitly documented either in this patchset or the previous, I
don't want to see this patch go upstream.

--=20
paul-moore.com
