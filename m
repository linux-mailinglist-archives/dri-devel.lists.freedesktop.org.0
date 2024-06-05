Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DCF8FCBAB
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 14:04:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF48B10E78E;
	Wed,  5 Jun 2024 12:04:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="K67GihMb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48F3810E78E;
 Wed,  5 Jun 2024 12:04:36 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-4402823e1fbso1089621cf.2; 
 Wed, 05 Jun 2024 05:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717589075; x=1718193875; darn=lists.freedesktop.org;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tPuTc08wjjwpO86SOuNZKeHCnjPvY6giUw1ze6bOSPo=;
 b=K67GihMbRidRdN/RKjiUxufJMBQtb8kWzgmZTXJp+y7zM9ne1gtuyV7YqeDR+y/kML
 ViuRy7Rh2UQSA3/ff9YEBVd+wYxPueBldREUSK+OHPlR2OI2mB7Zy+2I2d92EOlOUgkf
 1S3Y6cABfIbAt46MtelgBZ2WC6CsIxLUSjw1UuvXVjBKpOOCyIfTxvFUgs6HrgdJpLU7
 ePfN/HPrhmFjjd6DJ5It4GzJ0POmjm813Y7o31Ghwg6Ji0w+HuPZlP/+GFVgWvftn6JX
 hkJbrE+o9rfsUFODEaSusIqfWhXlxNYeltolEoScUxUbhcZflVpOu32aQqbhvycEcD4J
 kGiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717589075; x=1718193875;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tPuTc08wjjwpO86SOuNZKeHCnjPvY6giUw1ze6bOSPo=;
 b=jEn3D8ym92dcN1q0BH0WKo7REgn4tp9gPNLIX5p4Fm6B7p5M47gCCbTgUkvfFZUEFc
 xwVm/5/Z96RRLiJ9plGu4KmYwRonXqPuX3RhA5l38OemxFMwGmwmJxoHb8mfpc8EuXTA
 oYN+AqyTB7v8LfqNhkjSP872Qk+D369M3BrApFuSfRrGyuW0bbcnXAV46zCwZrj1fXZC
 LK7cfhyfdmaAQFbCLB9KcAPuqNrg5kIK9viWhogI/wG7P9rHseWl8Fe1ziFdv935UPPC
 OvTkqzuWUr7I2vNOXvvjRG07zhLP8oSP+OcgGqf7J3kaI0FVNwnVmAeai8wlmn0lxj21
 8T1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOQQQZ5DFl4bYcbx6coV0hilrKCTGq5OH8y248CEgJ7m3QUbNai6KkHTNvt2jb3VEoKkYTgA+2ZRD24kR0qI8LiMWT96AzUtpAtqpUQZQAHNPoHOU3tggfD1H0hKsCcBknoSUpcVSpWd9D29QrDg==
X-Gm-Message-State: AOJu0Yx2vU9Q0+i67XvKNCSi8WgIEL2xomWZeGZCOtsDkT6kAIqvEjT8
 PlADEbZBgM5R7P1YBw1TYQqzQ2fVEb443pMFS8ljUhAvMn948w8wKaSLKc4SeS7enYbbEwTnO8+
 zcOK79xfD+9LDbma7TqhinHOEhmg=
X-Google-Smtp-Source: AGHT+IH08DASZwWkloRJgaFzndX3ohxbVhpChXg8kKGgMmIS7uWE00LXdMQ3IF+ghEagWVLqDXyH4FitBoiNT2IQTPQ=
X-Received: by 2002:a05:6214:765:b0:6ad:7a58:4e01 with SMTP id
 6a1803df08f44-6b030a489d7mr23866326d6.3.1717589074779; Wed, 05 Jun 2024
 05:04:34 -0700 (PDT)
MIME-Version: 1.0
References: <CABXGCsNptxsQO=5=qi-JYiFX=rX8Ok5inK80Gn0qrUFWbtBGng@mail.gmail.com>
In-Reply-To: <CABXGCsNptxsQO=5=qi-JYiFX=rX8Ok5inK80Gn0qrUFWbtBGng@mail.gmail.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Wed, 5 Jun 2024 17:04:23 +0500
Message-ID: <CABXGCsN=9UFvGgKztzkkAM1c8cVN-h=TKLLxWhKgTm11h+H-eg@mail.gmail.com>
Subject: Re: 6.10/bisected/regression - commits bc87d666c05 and 6d4279cb99ac
 cause appearing green flashing bar on top of screen on Radeon 6900XT and 120Hz
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, Rodrigo.Siqueira@amd.com, 
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, 
 Linux regressions mailing list <regressions@lists.linux.dev>
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

On Sun, May 26, 2024 at 7:06=E2=80=AFPM Mikhail Gavrilov
<mikhail.v.gavrilov@gmail.com> wrote:
>
> Hi,
> Day before yesterday I replaced 7900XTX to 6900XT for got clear in
> which kernel first time appeared warning message "DMA-API: amdgpu
> 0000:0f:00.0: cacheline tracking EEXIST, overlapping mappings aren't
> supported".
> The kernel 6.3 and older won't boot on a computer with Radeon 7900XTX.
> When I booted the system with 6900XT I saw a green flashing bar on top
> of the screen when I typed commands in the gnome terminal which was
> maximized on full screen.
> Demonstration: https://youtu.be/tTvwQ_5pRkk
> For reproduction you need Radeon 6900XT GPU connected to 120Hz OLED TV by=
 HDMI.
>
> I bisected the issue and the first commit which I found was 6d4279cb99ac.
> commit 6d4279cb99ac4f51d10409501d29969f687ac8dc (HEAD)
> Author: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Date:   Tue Mar 26 10:42:05 2024 -0600
>
>     drm/amd/display: Drop legacy code
>
>     This commit removes code that are not used by display anymore.
>
>     Acked-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
>     Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>     Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>
>  drivers/gpu/drm/amd/display/dc/inc/hw/stream_encoder.h         |  4 ----
>  drivers/gpu/drm/amd/display/dc/inc/resource.h                  |  7 ----=
---
>  drivers/gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.c         | 10 ----=
------
>  drivers/gpu/drm/amd/display/dc/resource/dcn21/dcn21_resource.c | 33
> +--------------------------------
>  4 files changed, 1 insertion(+), 53 deletions(-)
>
> Every time after bisecting I usually make sure that I found the right
> commit and build the kernel with revert of the bad commit.
> But this time I again observed an issue after running a kernel builded
> without commit 6d4279cb99ac.
> And I decided to find a second bad commit.
> The second bad commit has been bc87d666c05.
> commit bc87d666c05a13e6d4ae1ddce41fc43d2567b9a2 (HEAD)
> Author: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Date:   Tue Mar 26 11:55:19 2024 -0600
>
>     drm/amd/display: Add fallback configuration for set DRR in DCN10
>
>     Set OTG/OPTC parameters to 0 if something goes wrong on DCN10.
>
>     Acked-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
>     Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>     Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>
>  drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c | 15 ++++++++++++=
---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> After reverting both these commits on top of 54f71b0369c9 the issue is go=
ne.
>
> I also attach the build config.
>
> My hardware specs: https://linux-hardware.org/?probe=3Df25a873c5e
>
> Rodrigo or anyone else from the AMD team can you look please.
>

Did anyone watch?

--=20
Best Regards,
Mike Gavrilov.
