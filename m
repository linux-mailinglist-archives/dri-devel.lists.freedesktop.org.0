Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 949CFCBC18D
	for <lists+dri-devel@lfdr.de>; Sun, 14 Dec 2025 23:53:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9721610E008;
	Sun, 14 Dec 2025 22:53:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jDjqsUqr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB36610E008
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Dec 2025 22:53:06 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-78c5b5c1eccso37675997b3.1
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Dec 2025 14:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765752785; x=1766357585; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qSuK8SW6pCjMUzOJ3wAt0gR5d4BCdSXZ6zhjvtWc1Yo=;
 b=jDjqsUqrafDmXDNiVEWKNi7Nw5f/kGBqTTln6RlU9CHCxrB5pSqzK+MBsnCQXgt573
 C7ufjG4YbI24VfBtZ4eDP1HHLJ3AipNvg6zyGmgjWGFV3NFgcdGfJazTB9g9vcoD1gB9
 ymst7Osf2HzFFaqyDmA5CitVYrM+IzVYt999ElXAJpsAFOoqIUwXVpMm6YRB6wA1Glzz
 tUW5LKecnaZQtT05OcvnH4PTSbpoYHjBhX9BlPuYUWe1GaiToH1wuuaZt8wpcUQeUcN+
 GwNn57ppWVvwCBhih0tlo8ZLfqicHRz5FEi8w2PMmMzw5ExINH0x4aUd4FkHp6Iss3TI
 RXJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765752786; x=1766357586;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qSuK8SW6pCjMUzOJ3wAt0gR5d4BCdSXZ6zhjvtWc1Yo=;
 b=VpwI1Wy1ve5hNVLcDzUpKTnvJRmzZZS3t3OM4YQ2Yqs7KEtylT4517M4HSaaLwNmn4
 dPtAZloqzzY3VyJr0T9CiB4O4X5ifORU9qkqvoVCFndwgBRtLYxAQcdJ33zhuwqneh1x
 pSO7pV2E1q9yCBOVeIxAyF66qGIXWLFJHBeYbpvcHEIWJnrx1p4EV2KAuarDr88XmzLu
 AD3nHhZelpj7l010EvRpfmKveYo5lUQR9F1sgLuPodjhyoSdoLg/kVnrpQoVduAAXNLV
 8wjHP2WM0uaUTZFDMnh2PHAjk7sGCe3jTjC3N4Fbil1VF3H4RMH+L1kWVrxKOtmJmgZ3
 +hLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQOqLxZiJSgEaN9tT3ZxNRwxmJ+PTVCl3IMjtW9Ipvwji04HNA9K7PAOrR8QpfhJ+wQPkOFt5yOq0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw5ar4AiAHYWLXsDAzJevz8OJSqFa8kzVNT2tVut3Iz9vo4j2Fp
 anZjPLfllj9X5OLttdMaTQtT1muUKjTLo5Y4OJAG9xtLubTgD0RC1wF9BiVq8yrfFe4hAC5JpeX
 3OR4LAlTkN4NBVsY9rTaJbZQD1rYB098=
X-Gm-Gg: AY/fxX6+p9s0JOBcLiOvTHuvwnC8RyLjZF9t602ssCgkgYy96hm4AsFEiYVnE+bbzPv
 PzRRKrqKjaw8qBAJeeOboCe0JOu0sxUUs/475EQANIbNfToHVnORE3hbElsj0ESlqGU6gEfeXST
 8Fj+HnYADNz9XxlHlJPkaL0rFBntdk7WSQC3GfD/mpTJhhjI9UQpveD5hOGrT36tlFkEcBgJhYP
 xTmCVGqIupZBwrZZ7egE9ydXDCiYCwvX/yFuN85PVF8YzstXo/+dPUGRPNM8fiaOy04+Bc=
X-Google-Smtp-Source: AGHT+IFtYdXbnNbpupm4QEH4/BSblx8ewfr7djUW0v7kdqsmHfxIgvSyKqOXUqb2xBAr1n5RX5ulv9vu5mcJlQG4w68=
X-Received: by 2002:a05:690c:ed5:b0:787:a126:5619 with SMTP id
 00721157ae682-78d6ded44bcmr114503467b3.11.1765752785575; Sun, 14 Dec 2025
 14:53:05 -0800 (PST)
MIME-Version: 1.0
References: <20251118201842.1447666-1-jim.cromie@gmail.com>
 <76038c97-39ca-4672-adc0-4e8fe0e39fc8@akamai.com>
 <CAJfuBxxFWD0rEjm-va+Bjmf-m2nfOD_+ZEqKy22WX6QdugQCUw@mail.gmail.com>
 <5b3d492c-7037-45a5-a001-0064f14d5f81@akamai.com>
 <CAJfuBxzW6TMmdS74ZPfPSe1w6S=oO17WYZc-Jgn_et=-Muw05A@mail.gmail.com>
 <20251214195420.GA791422@coredump.intra.peff.net>
In-Reply-To: <20251214195420.GA791422@coredump.intra.peff.net>
From: jim.cromie@gmail.com
Date: Mon, 15 Dec 2025 11:52:38 +1300
X-Gm-Features: AQt7F2oF9KYX_NOYyJRdpuYbe94jvmSjXRbCv5mEmYXa2feu5Fj7bdBNw1hYX-0
Message-ID: <CAJfuBxx-_Z_hCoqdj2Lma7oP6LhCM6Pz=afe2P=wKO41T7R3mA@mail.gmail.com>
Subject: Re: [PATCH v6 00/31] drm/dyndbg: Fix dynamic debug classmap regression
To: Jeff King <peff@peff.net>
Cc: Jason Baron <jbaron@akamai.com>, git@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org, 
 ukaszb@chromium.org, louis.chauvet@bootlin.com
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

On Mon, Dec 15, 2025 at 8:54=E2=80=AFAM Jeff King <peff@peff.net> wrote:
>
> On Mon, Dec 15, 2025 at 07:24:34AM +1300, jim.cromie@gmail.com wrote:
>
> > for some reason I cannot grasp,
> > git am fails to process this mbox.
> >
> > It entirely misses 13/31,
> > then fails to apply 14, which needs 13
>
> Can you show the exact input you fed to git-am?
>

in the 1st report, I got mbox.gz from:
https://lore.kernel.org/lkml/20251118201842.1447666-1-jim.cromie@gmail.com/

using the mbox.gz from your link, I get a different failure, this time
on patch 11


jimc@frodo:~/projects/lx/linux.git$ git am --abort
jimc@frodo:~/projects/lx/linux.git$ git describe
v6.18
jimc@frodo:~/projects/lx/linux.git$  cksum
~/Downloads/PATCH-v6-00-31-drm-dyndbg-Fix-dynamic-debug-classmap-regression=
.mbox.gz
540358004 206558
/home/jimc/Downloads/PATCH-v6-00-31-drm-dyndbg-Fix-dynamic-debug-classmap-r=
egression.mbox.gz

jimc@frodo:~/projects/lx/linux.git$ gunzip
~/Downloads/PATCH-v6-00-31-drm-dyndbg-Fix-dynamic-debug-classmap-regression=
.mbox.gz
gzip: /home/jimc/Downloads/PATCH-v6-00-31-drm-dyndbg-Fix-dynamic-debug-clas=
smap-regression.mbox
already exists; do you wish to overwrite (y or n)? y
jimc@frodo:~/projects/lx/linux.git$ git am --empty=3Ddrop
~/Downloads/PATCH-v6-00-31-drm-dyndbg-Fix-dynamic-debug-classmap-regression=
.mbox
Skipping: drm/dyndbg: Fix dynamic debug classmap regression
Applying: dyndbg: factor ddebug_match_desc out from ddebug_change
Applying: docs/dyndbg: explain flags parse 1st
Applying: test-dyndbg: fixup CLASSMAP usage error
Applying: dyndbg: add stub macro for DECLARE_DYNDBG_CLASSMAP
Applying: dyndbg: make ddebug_class_param union members same size
Applying: dyndbg: tweak pr_fmt to avoid expansion conflicts
Applying: dyndbg: refactor param_set_dyndbg_classes and below
Applying: dyndbg: reduce verbose/debug clutter
Applying: dyndbg: drop NUM_TYPE_ARRAY
Applying: dyndbg: hoist classmap-filter-by-modname up to ddebug_add_module
error: patch failed: lib/dynamic_debug.c:170
error: lib/dynamic_debug.c: patch does not apply
Patch failed at 0011 dyndbg: hoist classmap-filter-by-modname up to
ddebug_add_module
hint: Use 'git am --show-current-patch=3Ddiff' to see the failed patch
hint: When you have resolved this problem, run "git am --continue".
hint: If you prefer to skip this patch, run "git am --skip" instead.
hint: To restore the original branch and stop patching, run "git am --abort=
".
hint: Disable this message with "git config set advice.mergeConflict false"
jimc@frodo:~/projects/lx/linux.git$

Upon closer inspection, it misses several patches, and reorders others ??

in particular, the reported 0011 patch above is numbered 16 in the mbox.


2025-11-18 20:18 ` [PATCH v6 02/31] dyndbg: add stub macro for
DECLARE_DYNDBG_CLASSMAP Jim Cromie
2025-11-18 20:18 ` [PATCH v6 03/31] docs/dyndbg: update examples \012
to \n Jim Cromie
2025-11-20  9:30   ` Bagas Sanjaya
2025-11-18 20:18 ` [PATCH v6 06/31] dyndbg: reword "class unknown," to
"class:_UNKNOWN_" Jim Cromie
2025-11-18 20:18 ` [PATCH v6 09/31] dyndbg: tweak pr_fmt to avoid
expansion conflicts Jim Cromie
2025-11-18 20:18 ` [PATCH v6 12/31] dyndbg: tighten fn-sig of
ddebug_apply_class_bitmap Jim Cromie
2025-11-18 20:18 ` [PATCH v6 13/31] dyndbg: replace classmap list with
a vector Jim Cromie
2025-11-18 20:18 ` [PATCH v6 14/31] dyndbg: macrofy a 2-index for-loop
pattern Jim Cromie
2025-11-18 20:18 ` [PATCH v6 15/31] dyndbg,module: make proper
substructs in _ddebug_info Jim Cromie

2025-11-18 20:18 ` [PATCH v6 16/31] dyndbg: hoist
classmap-filter-by-modname up to ddebug_add_module Jim Cromie

jimc@frodo:~/projects/lx/linux.git$ git --version
git version 2.52.0
Im using fedora packaged git.
