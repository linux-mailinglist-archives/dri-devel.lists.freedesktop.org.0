Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0990955122
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 20:56:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C79610E824;
	Fri, 16 Aug 2024 18:56:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="VvamEgFQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3DB910E824
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 18:56:31 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-e1161ee54f7so2495112276.2
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 11:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1723834591; x=1724439391;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q+RwyLKvh3UIcOVfcaxSgjkMZTMy6zOQrBzrBolUKbQ=;
 b=VvamEgFQFAwaJvMWc76XYs/Ncw9omzAC9miSN0J3Iu5b4ZuZzgEa95WkpiNG3iAYWW
 UIJMwzjMJlLSJ0LTR1fws0U5OCb8roXrpSb+tUgngyF1hqM4ATfkAZCEyLf6Q7BR2n6K
 wuXZ29b5WJuey+d30lJaywEWClCNh7ef9+oTE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723834591; x=1724439391;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q+RwyLKvh3UIcOVfcaxSgjkMZTMy6zOQrBzrBolUKbQ=;
 b=kjMsm5PdXQiVFvEou2y3uPPQD5AL32SBmEDefgPIQK40Q0Pfs10ZcJvlNSpU/EmpQ9
 vOTa6hyWw6Jzpsiz5VIvv3uf/KBSLqj8o+uuBOiMEOwJOR7t+Hph0DAkJ5oBcz/lSzWd
 fqkfhHZ+tKA1sbVIo8GEbgHPkzQBjlMA5tIZ7ndhnioGx8l5DtMpkT/cZd+7ntYEXadU
 Axszsz/ODj6mEpusArsHMZ8FzQK31Mv1pQWzGAT+y+hBOUQMJaPzlSijwM8MpJzWCDDh
 WbJGQxFLgfNMwpbzCxtOh7bo9uCXI/ERvl6X6Plu6KZnx5qGCBpvnToNVOeqLphozjAq
 o7eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2q8yQDjJjpADnWzsG5so6TWhgMY43YfdQiJLh6xKYoBthbUSk6vHEpZgKJHs6a6j9V6w3VW8UZvjCPln9+XZ/uQ5KSmrq0/uFvI/NTUcW
X-Gm-Message-State: AOJu0YwCNHFLUlvyIIJIcC/xJNDrtk19TmyOME7jzHvuDES4SScPdAYW
 MXmndFsGjZvq4aWEA12UA73qAoN36jD5AA04+jgDTnkDLwWOXNDGqFRnUNz2uuMf/AOQoM2kqdT
 JcRYRXj+Ov+KQCG8dInYYlyOrVNcfSpL53SVHi89clAzI9lhTqw==
X-Google-Smtp-Source: AGHT+IEJ86OUuUV6ntheKjcJx7UnZj41T2D1bjC3vczY0XJSYxj6wSoCZ/gigl4V7uSZxjWkRVAEVYMjOlVRqfJGhXw=
X-Received: by 2002:a05:6902:1546:b0:e0b:ab65:19c8 with SMTP id
 3f1490d57ef6-e11810032c4mr4637525276.48.1723834590550; Fri, 16 Aug 2024
 11:56:30 -0700 (PDT)
MIME-Version: 1.0
References: <CABQX2QM09V=+G=9T6Ax8Ad3F85hU0Cg4WqD82hTN=yhktXNDaQ@mail.gmail.com>
 <40cf01ab-73ad-4243-b851-a02c377bdbde@mailbox.org>
In-Reply-To: <40cf01ab-73ad-4243-b851-a02c377bdbde@mailbox.org>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Fri, 16 Aug 2024 14:56:19 -0400
Message-ID: <CABQX2QM1A9yWCuOHV6kgi3YbPvPHz-zazkOXM6Up9RWrZ-CgPQ@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] vmwgfx crashes with command buffer error
 after update
To: Andreas Piesk <a.piesk@mailbox.org>
Cc: bcm-kernel-feedback-list@broadcom.com, christian@heusel.eu, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 maaz.mombasawala@broadcom.com, martin.krastev@broadcom.com, rdkehn@gmail.com, 
 regressions@lists.linux.dev, spender@grsecurity.net
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

On Thu, Aug 15, 2024 at 4:30=E2=80=AFPM Andreas Piesk <a.piesk@mailbox.org>=
 wrote:
>
> Hello,
>
> the bug was first reported on VMware Workstation by rdkehn.
>
> On my setup (archlinux text mode only VM on ESXi 8.0U3 latest) the kernel=
 does NOT crash, the screen just goes dark after switching the console from
>
> [    2.745694] Console: switching to colour dummy device 80x25
>
> to
>
> [    2.771998] Console: switching to colour frame buffer device 160x50
>
> You see the VMware remote console resizing, then going black and from thi=
s point no more output.
>
> I have attached boot_journal and vmware.log from my setup. VM uses EFI bo=
ot and SVGA with defaults as display adapter, I attached the vmx file too.

Thanks! I see. I have a patch out that fixes it, but in general I
think those vm's with 16mb for graphics are very risky and I'd suggest
bumping them to at least 32mb. The vram portion can stay at 16mb, but
the graphicsMemoryKB can be safely set to fourth or even half of
memsize (in your config 256mb or even 512mb), which will make the vm's
a lot safer and allow actual ui usage because with console being
pinned we just don't have a lot of wiggle room otherwise and we just
can't migrate pinned framebuffers.
The patch that "regressed" this makes dumb buffers surface that
actually respect pinning, but as long as you don't have gpu host side
things will be ok. Otherwise we can't make a config with 16mb of
available graphics memory and graphics acceleration work.

z
