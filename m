Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE449A07F78
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 19:06:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E88610E47D;
	Thu,  9 Jan 2025 18:06:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hXJVC9TE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E482110E47D;
 Thu,  9 Jan 2025 18:06:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 373A65C5CC9;
 Thu,  9 Jan 2025 18:05:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3492C4CEE8;
 Thu,  9 Jan 2025 18:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736445963;
 bh=rp9xKD+8m1msQ0xxbCs9oZzFyU1GURrqUZhq3NbpvyQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hXJVC9TEna9TWYKbS9F02aIUvOHalq4E7m1+cvMk0ArDdbnyNkOQeESQ7Ur7QTEYq
 oV3fJnNHiU6ugTU9/tuOjHdJ9qaR831jsML8BcJ2B2+uzRQfA4kpmr3AmZ+XqRvw70
 BTN8HX8ggLtR2WOIhN2X2Ipa4OKa5qs1wwTNGfy1p+9su4jHqsiWIAwGFmgaxU7Nfw
 H9Abn1fQ/2SPP2QU6lVw0EYHITfjtwSWp9wIQJbaVZRVNv4TDYE1jWwRNuescPEqI8
 vYK392uOFALwuMqP1HoC1bERclFcBuYV7fmAeGJqkaXECHPwUoHQw9LVho0fFgK9tk
 fJ+fXn+JQWXLQ==
Received: by mail-il1-f173.google.com with SMTP id
 e9e14a558f8ab-3a7e108b491so8157905ab.3; 
 Thu, 09 Jan 2025 10:06:03 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVJJUpdVY3NSSZBUKGOxG8JAAna+Lk57SOsNEOVPyujmQHPsDHunPKH+yhco60fb3OD35KnRUVrybk=@lists.freedesktop.org,
 AJvYcCWLLgR5xJ8OfHe5zSRYQ+oVZ+UcHLusVBuBBNR8TXMFFehO17rfbUTggunrY1CGrQYStVDnVE7zhEk=@lists.freedesktop.org,
 AJvYcCWRcCwxI05f+/ogv0+ueiqzs9M9gLAtheWGyPzh6v4U2aPs80BYUB8UARVM/SldzRqIscTg+ezyrWSQ@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxC++vBrHXUiYnNMkyq73/Nxni22kgmj/5aJXQoreSR86/iomtB
 lrryWPTXqELS9KWDtHQG7S89pynGARy4/pPm3EaU+WBAM1T375qyg06vByCEuIt6a89l2Dz2Xf0
 xTGpdnBxHgXgKTXVPLD2p7vuve0w=
X-Google-Smtp-Source: AGHT+IHw82IqZn0L3vIWI2GRAE2/Fu1vkOzFuTOkK3ccul7HxPp7E2ac95iMCNTUN8mztI4YyZ2Kf9FZUsicSlonzfg=
X-Received: by 2002:a05:6e02:3048:b0:3a7:6a98:3fdf with SMTP id
 e9e14a558f8ab-3ce3a9da817mr60484875ab.14.1736445963152; Thu, 09 Jan 2025
 10:06:03 -0800 (PST)
MIME-Version: 1.0
References: <20250109-jag-ctl_table_const-v1-1-622aea7230cf@kernel.org>
In-Reply-To: <20250109-jag-ctl_table_const-v1-1-622aea7230cf@kernel.org>
From: Song Liu <song@kernel.org>
Date: Thu, 9 Jan 2025 10:05:51 -0800
X-Gmail-Original-Message-ID: <CAPhsuW5zpA28gkBQYMMuYCUbnDzdeq4pHsd0Mx=PBnDPiHKqHw@mail.gmail.com>
X-Gm-Features: AbW1kvZZD8oqcdTZ9DXv7tEUC7bpyqeBsuw6nnhXboAE2kNg_1eTiibnv93HXj8
Message-ID: <CAPhsuW5zpA28gkBQYMMuYCUbnDzdeq4pHsd0Mx=PBnDPiHKqHw@mail.gmail.com>
Subject: Re: [PATCH] treewide: const qualify ctl_tables where applicable
To: Joel Granados <joel.granados@kernel.org>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Kees Cook <kees@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
 linux-s390@vger.kernel.org, linux-crypto@vger.kernel.org, 
 openipmi-developer@lists.sourceforge.net, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-hyperv@vger.kernel.org, linux-rdma@vger.kernel.org, 
 linux-raid@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-serial@vger.kernel.org, xen-devel@lists.xenproject.org, 
 linux-aio@kvack.org, linux-fsdevel@vger.kernel.org, netfs@lists.linux.dev, 
 codalist@coda.cs.cmu.edu, linux-mm@kvack.org, linux-nfs@vger.kernel.org, 
 ocfs2-devel@lists.linux.dev, fsverity@lists.linux.dev, 
 linux-xfs@vger.kernel.org, io-uring@vger.kernel.org, bpf@vger.kernel.org, 
 kexec@lists.infradead.org, linux-trace-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, apparmor@lists.ubuntu.com, 
 linux-security-module@vger.kernel.org, keyrings@vger.kernel.org
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

On Thu, Jan 9, 2025 at 5:16=E2=80=AFAM Joel Granados <joel.granados@kernel.=
org> wrote:
>
[...]
>  drivers/base/firmware_loader/fallback_table.c | 2 +-
>  drivers/cdrom/cdrom.c                         | 2 +-
>  drivers/char/hpet.c                           | 2 +-
>  drivers/char/ipmi/ipmi_poweroff.c             | 2 +-
>  drivers/char/random.c                         | 2 +-
>  drivers/gpu/drm/i915/i915_perf.c              | 2 +-
>  drivers/gpu/drm/xe/xe_observation.c           | 2 +-
>  drivers/hv/hv_common.c                        | 2 +-
>  drivers/infiniband/core/iwcm.c                | 2 +-
>  drivers/infiniband/core/ucma.c                | 2 +-
>  drivers/macintosh/mac_hid.c                   | 2 +-
>  drivers/md/md.c                               | 2 +-

For md bits:

Reviewed-by: Song Liu <song@kernel.org>

Thanks,
Song

[...]
