Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B844B030DB
	for <lists+dri-devel@lfdr.de>; Sun, 13 Jul 2025 13:34:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67FA710E16C;
	Sun, 13 Jul 2025 11:34:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="A7SbSsI2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7715A10E03C;
 Sun, 13 Jul 2025 11:34:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 86D5761130;
 Sun, 13 Jul 2025 11:34:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBD4BC4CEF8;
 Sun, 13 Jul 2025 11:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752406483;
 bh=3E86QT1RQXoKJncONVA3h+/7auEBcT28VLs3DwrCUJ4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=A7SbSsI2OR/9ZV0VZeg9IRYtBVuQUmq7g6rOrCjb7CQ2okLlA9HYkpdEUephz4Ptt
 aBe2ntH8E1vupFI8mDKe5n7PPDoJLcLrUjdqo99S2wqJetQ6ybo1VY3gVCd9vo/h75
 jPpI27ED7OyUpFMfaJ6r98O94KqK4XCCQ3kD9BfEekJrfRYFiPypw3iZhEKfwW5oqX
 /J7ikhA4dYrWZSBSkEy5+eNsm6zK8NMC0QwPLqk3cb83F+8hjRa64/mPe4AL4SJR7n
 1J2tO2eg9i01+rl/koJ9rogxC9j5g4/gB+cX13VGWo6BAdCdFNiCbrTmP66BF/dsnh
 bxGAQ6Px08eZA==
Received: by mail-oo1-f43.google.com with SMTP id
 006d021491bc7-6119cd1a154so1709371eaf.0; 
 Sun, 13 Jul 2025 04:34:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVGY6uU+zh3aaqB3n4MJcO58arppge/B5c5p+qqQxnwkfAd8pN13CX6WKzsrUp19yqrFYc5OQ6gGwD1@lists.freedesktop.org,
 AJvYcCXvncgxibgbbMZnuKIPdRAIWtZse1m0HoTVx/t8675haSlUYhM228+PUxj9mRaI+O54XQXrFOlt@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxeEXDaws2H+XhVrim1Hg932XwY+JlvuykYUzSd+O9WEyjlyUwq
 8FJQnW0um6BEpBzHPWv/ePCw1RM/z2mC4r7/Xyw75pYfXJumIVnZW3SzgcnwGEIqg6p1QAKsJyB
 XJXJQ9n9MvJI1ilfGucG4k4AtUK+1+ws=
X-Google-Smtp-Source: AGHT+IFuYADzEutbEFDy/gs33SAlKKQHOs/PwanKwOXzdQ3mwgrkBASnOMI/05PrG5u0tEDdh7iap+htCumpxf94JKI=
X-Received: by 2002:a05:6820:4409:b0:615:7c7f:4aa6 with SMTP id
 006d021491bc7-6157c7f622amr526377eaf.3.1752406482201; Sun, 13 Jul 2025
 04:34:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250711191014.12a64210@canb.auug.org.au>
 <49080a96-2c7a-4eea-a64c-deac0b7a665b@infradead.org>
 <CAJZ5v0h1CX+aTu7dFy6vB-9LM6t5J4rt7Su3qVnq1xx-BFAm=Q@mail.gmail.com>
 <35f0dd7e-f4c1-4042-bc85-19d277f4b1f9@kernel.org>
In-Reply-To: <35f0dd7e-f4c1-4042-bc85-19d277f4b1f9@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Sun, 13 Jul 2025 13:34:31 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0jejQBii9U+69PUjqzebrdWPky93ZoJ9wKuqeGDpK--JQ@mail.gmail.com>
X-Gm-Features: Ac12FXwM3thsZjq3fqSeZdk6Wyvn9W-4fbkxOYzhvQlR8d53h_Oxqxin_woNNr8
Message-ID: <CAJZ5v0jejQBii9U+69PUjqzebrdWPky93ZoJ9wKuqeGDpK--JQ@mail.gmail.com>
Subject: Re: linux-next: Tree for Jul 11 [drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
To: Mario Limonciello <superm1@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, 
 Mario Limonciello <mario.limonciello@amd.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, 
 Linux Next Mailing List <linux-next@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Samuel Zhang <guoqing.zhang@amd.com>, amd-gfx@lists.freedesktop.org
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

On Sat, Jul 12, 2025 at 9:02=E2=80=AFPM Mario Limonciello <superm1@kernel.o=
rg> wrote:
>
>
>
> On 7/12/25 3:11 AM, Rafael J. Wysocki wrote:
> > On Fri, Jul 11, 2025 at 11:25=E2=80=AFPM Randy Dunlap <rdunlap@infradea=
d.org> wrote:
> >>
> >>
> >>
> >> On 7/11/25 2:10 AM, Stephen Rothwell wrote:
> >>> Hi all,
> >>>
> >>> Changes since 20250710:
> >>>
> >>
> >> on x86_64, when
> >> # CONFIG_SUSPEND is not set
> >> # CONFIG_HIBERNATION is not set
> >> # CONFIG_PM is not set
> >>
> >> ERROR: modpost: "pm_hibernate_is_recovering" [drivers/gpu/drm/amd/amdg=
pu/amdgpu.ko] undefined!
> >>
> >> caused by commit
> >> 530694f54dd5e ("drm/amdgpu: do not resume device in thaw for normal hi=
bernation")
> >>
> >> Rafael, is a stub appropriate for this case?
> >
> > pm_hibernate_is_recovering() is not supposed to be called by code that
> > does not depend on CONFIG_HIBERNATE_CALLBACKS, but a stub returning
> > false would work for this.
>
> Thanks, I just sent out a fix for this.
>
> >
> > Mario, it would be good to fix this up in your tree.  Also, it would
> > be good to expose stuff to 0-day build testing before letting it go
> > into linux-next.  I use the bleeding-edge branch for this purpose.
> >
> Honestly; I'm surprised that 0-day didn't raise this on either dri-devel
> or amd-gfx.  I had expected at least one of those lists to raise this
> over the last week of patches.
>
> Anyone know the history why neither has 0-day?

Maybe they do, but it had too little time to get to testing  them.

That's why I asked 0-day to send success reports too for my
bleeding-edge branch.  When I get a report (either failure or success)
for it, I know that it has been tested.
