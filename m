Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F85C96F789
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 16:56:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80F5F10EA7F;
	Fri,  6 Sep 2024 14:56:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.b="dPOKfUUi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com
 [209.85.221.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0149710EA80
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 14:56:45 +0000 (UTC)
Received: by mail-vk1-f172.google.com with SMTP id
 71dfb90a1353d-5010c0e16baso719182e0c.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Sep 2024 07:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore.com; s=google; t=1725634605; x=1726239405;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z8DQFAISHS7i5IP3gsOeV2GhBMoOIKb1H2ynRnefFiA=;
 b=dPOKfUUi8Tx0Nq6pweEnDfvrHsWvhRo3Z3V5jcYoJ9cNUHhta69WTc4w9BAco4grqk
 kH7yjkWRJuE8JX4pEa2pCZQamABXZv6TCdY1rwmx5DYGv+2RYN5OKQM5Rxnjw/IoYsPL
 s6ImEYCAisN8i/bcFOKemZOL2Y+cnIzonz/IOPjBiF5MNOMEygDoUYfzIUZvmoTbTgcM
 STPVCkKsAArA72Ong+TU5636QPRMP96fkS4P4nZL0az84jpvnqh8bfLBDWSziOAUeIBS
 l1OC3DL9DBKKnSq58CTuvTiHDtK+01U/ICUSZeukB4FfnlVE3sRFOXT2DqAQCwo7x6cr
 AQOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725634605; x=1726239405;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z8DQFAISHS7i5IP3gsOeV2GhBMoOIKb1H2ynRnefFiA=;
 b=Ur12Avk7uo1lJeQVY6sjBtkFSi2Hzkq3o72dePr2E4irk1PYr7Dp6mhXZ7Ev0fXvH8
 X4yzYZeScHtwuzeWkv/hqKE6oSS3fpx8vJtQxBwCkaTpbnygMz4uO5BbZqxkw9VNE7VF
 UrrCI9luhYLr31uPl4pTfFsK+MQKut9JhdwdnCPaO4DKyhQbVE1nksO2Jz5L2lxpl/G1
 BsUCKv53lqJEU+ljDxWMy8R6VpvZwVjTPB/hiFKvSTW97tfajqLVGIbe52Jp0/bSDTW/
 D0fBHTqtcabqhoZ4bx+WdxVKIhyh0+sgWhJPZRB6r1OTxfY507xcE3iwiIM40ooPgYPB
 KTtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVt//UXfRT+TlcKIl8ndiql45s2c8vipohnXSw4BZCjsiM3BVLzrXiLAW1UJrMtajXgbXPpq6btV8Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2o51hhP/Au/LH20AjC/XlXmLq8NP09zU2KZGDqZwjDOQaMf3E
 yLjzx8Eysa8gv0W1Uwa0we++YtvEZKipVb/jcuuSqg/CK+w3QQd268bGY9AZ4tDn2GOJI8tS0FE
 RvetBczkoMWHXBNKRfldwNOC6PCmCza7VJdHh
X-Google-Smtp-Source: AGHT+IHq7ZiORKnHJ7OGW0/x1cWaLstSbHVVP69Jhc2KtxHBDUWP5W0/AltVyanWWqQY/QWC4tnW0snbDbe3WIJv/jg=
X-Received: by 2002:a05:6122:3b17:b0:501:2842:428a with SMTP id
 71dfb90a1353d-50128425272mr4021883e0c.8.1725634604866; Fri, 06 Sep 2024
 07:56:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240906-macos-build-support-v2-0-06beff418848@samsung.com>
 <20240906-macos-build-support-v2-6-06beff418848@samsung.com>
In-Reply-To: <20240906-macos-build-support-v2-6-06beff418848@samsung.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 6 Sep 2024 10:56:33 -0400
Message-ID: <CAHC9VhRpHgqN2fp1J3x9=zBqNr3QHsSDgUnoZ7M-SuOQ6hQ4nw@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] selinux: do not include <linux/*.h> headers from
 host programs
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
> Commit bfc5e3a6af39 ("selinux: use the kernel headers when building
> scripts/selinux") is not the right thing to do.
>
> It is clear from the warning in include/uapi/linux/types.h:
>
>   #ifndef __EXPORTED_HEADERS__
>   #warning "Attempt to use kernel headers from user space, see https://ke=
rnelnewbies.org/KernelHeaders"
>   #endif /* __EXPORTED_HEADERS__ */
>
> If you are inclined to define __EXPORTED_HEADERS__, you are likely doing
> wrong.
>
> Adding the comment:
>
>   /* NOTE: we really do want to use the kernel headers here */
>
> does not justify the hack in any way.
>
> Currently, <linux/*.h> headers are included for the following purposes:
>
>  - <linux/capability.h> is included to check CAP_LAST_CAP
>  - <linux/socket.h> in included to check PF_MAX
>
> We can skip these checks when building host programs, as they will
> be eventually tested when building the kernel space.
>
> I got rid of <linux/stddef.h> from initial_sid_to_string.h because
> it is likely that NULL is already defined. If you insist on making
> it self-contained, you can add the following:
>
>   #ifdef __KERNEL__
>   #include <linux/stddef.h>
>   #else
>   #include <stddef.h>
>   #endif
>
> scripts/selinux/mdp/mdp.c still includes <linux/kconfig.h>, which is
> also discouraged and should be fixed by a follow-up refactoring.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>  scripts/selinux/genheaders/Makefile              |  4 +---
>  scripts/selinux/genheaders/genheaders.c          |  3 ---
>  scripts/selinux/mdp/Makefile                     |  2 +-
>  scripts/selinux/mdp/mdp.c                        |  4 ----
>  security/selinux/include/classmap.h              | 19 ++++++++++++------=
-
>  security/selinux/include/initial_sid_to_string.h |  2 --
>  6 files changed, 14 insertions(+), 20 deletions(-)

Similar to patch 7/8, please read my comments on your previous posting
of this patch, it doesn't appear that you've made any of the changes I
asked for in your previous posting.

https://lore.kernel.org/selinux/317c7d20ab8a72975571cb554589522b@paul-moore=
.com

--=20
paul-moore.com
