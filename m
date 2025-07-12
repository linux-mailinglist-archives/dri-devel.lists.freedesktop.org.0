Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4FBB029EC
	for <lists+dri-devel@lfdr.de>; Sat, 12 Jul 2025 10:11:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77E3B10E00B;
	Sat, 12 Jul 2025 08:11:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="W9ugBNdf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C553A10E00B;
 Sat, 12 Jul 2025 08:11:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A596B44B60;
 Sat, 12 Jul 2025 08:11:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 859EDC4CEF5;
 Sat, 12 Jul 2025 08:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752307899;
 bh=M0n92FcTqzxD9YeHFJxTHRvgITvHYvvbH72QN1CTSu8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=W9ugBNdfydbOLIKlk+6K5EhZDOCPSx18O63LZLq5cbLg6UnzExylj3HscqNYMbJ+8
 ruiQvMxK096vWfsGSJzLi5BDfPLtKIU2o5yCvrpVmYhOiUki0Jqpo2YbP2tN91rpq/
 eUZKlzqzBdMGXiC+hFJnwvL+jC6AtVyTmcF4NvFjlEZv9xD8ywznmgMSIcZpGb43n1
 Tj7i/8iGH0+ArQ5XQaylOuz+8oiTfHRbPVANuLnoMhBhbZMPFo2zKey0GhHxyvQsgu
 IP98kdNscLYTqY2cgrziuWf5/n21utwFD/osmjPST0dmktPPcOV6/GvqJkwFPyHhvp
 /OTItteBnUFzw==
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-2eacb421554so1122603fac.1; 
 Sat, 12 Jul 2025 01:11:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVHDi6QiOivAirVpGuK4CPomveoDSh1Qd4A2YVnTkD78kSFxAc9D9sWs9d1aq34LmYZSn7vVr9OgKps@lists.freedesktop.org,
 AJvYcCWwJzjI0Xx7eiDzHR31mJpxHukYxjo+yyLou1zAfHAMmANeibFQZdh77n5JcgJMkIkSJaYjmPKv@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydN/ylC1mtHp+aaTcdlWlHaEyDDBOWb74brXEEFJyExot8QmvK
 bNMuDrzIn+U6FBAu958URXj/VHN/cii4ZTwJBohikw/Gss+EFQE5Q+0RmJGmIuBufpV77mXyLaU
 DkvwNElk8QerrZaLl1km5zrHzdMV/NAU=
X-Google-Smtp-Source: AGHT+IEiN2LU02BAfA89Hs/UW06NBjK2j7kH08irqWESSxDDvgGoIPpqaacKXmE76Z5kG+oGme02fcs3FuX9z1+G08A=
X-Received: by 2002:a05:6870:b4a5:b0:2e8:7953:ece7 with SMTP id
 586e51a60fabf-2ff26a255ddmr4426856fac.24.1752307898784; Sat, 12 Jul 2025
 01:11:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250711191014.12a64210@canb.auug.org.au>
 <49080a96-2c7a-4eea-a64c-deac0b7a665b@infradead.org>
In-Reply-To: <49080a96-2c7a-4eea-a64c-deac0b7a665b@infradead.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Sat, 12 Jul 2025 10:11:27 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0h1CX+aTu7dFy6vB-9LM6t5J4rt7Su3qVnq1xx-BFAm=Q@mail.gmail.com>
X-Gm-Features: Ac12FXx4LfQ6l-D4lPteNJxpkOdlBcXTlnxfu1w13kDAC4KLOvvFfs5hIbBsH7o
Message-ID: <CAJZ5v0h1CX+aTu7dFy6vB-9LM6t5J4rt7Su3qVnq1xx-BFAm=Q@mail.gmail.com>
Subject: Re: linux-next: Tree for Jul 11 [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
To: Randy Dunlap <rdunlap@infradead.org>,
 Mario Limonciello <mario.limonciello@amd.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
 Linux Next Mailing List <linux-next@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Samuel Zhang <guoqing.zhang@amd.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, amd-gfx@lists.freedesktop.org
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

On Fri, Jul 11, 2025 at 11:25=E2=80=AFPM Randy Dunlap <rdunlap@infradead.or=
g> wrote:
>
>
>
> On 7/11/25 2:10 AM, Stephen Rothwell wrote:
> > Hi all,
> >
> > Changes since 20250710:
> >
>
> on x86_64, when
> # CONFIG_SUSPEND is not set
> # CONFIG_HIBERNATION is not set
> # CONFIG_PM is not set
>
> ERROR: modpost: "pm_hibernate_is_recovering" [drivers/gpu/drm/amd/amdgpu/=
amdgpu.ko] undefined!
>
> caused by commit
> 530694f54dd5e ("drm/amdgpu: do not resume device in thaw for normal hiber=
nation")
>
> Rafael, is a stub appropriate for this case?

pm_hibernate_is_recovering() is not supposed to be called by code that
does not depend on CONFIG_HIBERNATE_CALLBACKS, but a stub returning
false would work for this.

Mario, it would be good to fix this up in your tree.  Also, it would
be good to expose stuff to 0-day build testing before letting it go
into linux-next.  I use the bleeding-edge branch for this purpose.
