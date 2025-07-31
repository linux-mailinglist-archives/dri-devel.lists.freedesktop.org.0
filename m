Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAD2B171C7
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 15:09:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCB1A10E475;
	Thu, 31 Jul 2025 13:09:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cpZATynX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 801A510E475
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 13:09:52 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-2400145aa5aso1255805ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 06:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753967392; x=1754572192; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=skC1kpnAhX6pq9GTj4XZsHRg2fh4hLUap6aEjnJ3AFE=;
 b=cpZATynXQTszO96yIEp3Q2Ir9zCdYoRW2WlVusViojQcCse+TJH9RM1J0h4yU7T3pn
 3f/ZVNEMVU5F2K03tJk4CK/mJoZT5WLWNRrexqbZCa7ntysVk0HhHjXYdbzEvXEuqBHL
 VmLaJ0E3chCn/vGeyURDkvdN4lYcYa7ScmpNvwIgDrUY70l1w4CcRdugKuoiDUFCWzIX
 2p46XNcXpQ1h/g4quxVVzRMSxY00qgGOk95ifaSDsosJRyAgObG9bV9Jf8M95Yda7xtL
 DLy6O14RGvSxrj8rt2/K8F0SNG8u1hJULpTJZo6U+jFJGXrJb18toC8VIktOJB0+Wi1A
 m//Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753967392; x=1754572192;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=skC1kpnAhX6pq9GTj4XZsHRg2fh4hLUap6aEjnJ3AFE=;
 b=ZLnuP2kReW0syhmHjJKawN4f4ROF5+jDcXZPoEFCQmp7DrIrneNFhFC1P9Bo7XD/32
 PSRhM246rzPe7TnyFY7WGc+dR+ZsPSt7UuYj0zSsPAREVlH/IG0ArgjHwv3nf4gwNlMZ
 //WLSteqyrsfpAniEwin1NKscsfn/UIDYNT4f3TjISWoZF9qfiISlhfabGr51Ss7NYQw
 liGTMyRLHSs6BeapVt849Lz8dTRNUaJaFQI8a+atN4+3AophIgCzaJCN3hhIdzqh/KMr
 OZqpwOx3gSm0KDVtEVqKwUdBpy2sQwycWa2HVCHd45ngOlBtUlkXn2/8+HeCNVmPwirp
 QhJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXORyjk4gKUkNMmnxlgOPzF/uzXIPalyWF341SgCFseuaVy0Cn1c5230py7bavKf2VkbDVrTuYhtVQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcMgAy18EvcltfV1b5IRYuzSbwttn6bs0pLgHvuUOcysd9sSIu
 KRE6S0qawHNvinurH48DQOhaFkAJX1d/Tv9mhGuuNFOBfdubCseqamEENzpjJau/Bn1XiVnF79E
 yGciAdW2j23mTA8FXUfd8/el+bi9SoPs=
X-Gm-Gg: ASbGncuvXD7RV/Z9ZEZH62AEu82+ghuBBUU0pr8rCR/ZofWnNOB/foEnO8uLZRCrf2X
 KZUqYf5zfuG/MSTYlojwUD42XUOOXxHJ19cP+7GOn9muyC7arRs+LYCmKo0cVTit1Z4PgJTYMX8
 KyqBGD4tvnAO31LcBrh4MRQnuS/tXE7FLIv2ixjpYROk7Y0T4ayTVLBawKhNww6gYKxbEF6XlC/
 FaRl+5F
X-Google-Smtp-Source: AGHT+IGb2h0p7tSKQCZxOROO7pa1QVA+WZ2y7Gt2WN+euz6liPbWeX4GsFFQgC/3PsoKMwRtpcrcu00V27Ky75dQf9w=
X-Received: by 2002:a17:90b:3ecd:b0:31f:3d6:6d98 with SMTP id
 98e67ed59e1d1-31f5dfad39amr4892346a91.5.1753967391953; Thu, 31 Jul 2025
 06:09:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzVm80-v6_5nt6kko3nR+aQLZ7R98i419FV8f4-ayQWUw@mail.gmail.com>
 <CAHk-=wirxHy+KU6jmtO2dzmGQ1BwaOdd5Mjtrc40fGvZVULQQg@mail.gmail.com>
 <CAHk-=wjn5Pg2Gp=o2NVv-nRKqE=E75AxUypWCCpQ7MDXuHx+YA@mail.gmail.com>
 <CAHk-=whnuRuQEky2GsCDRQSf1dZbpoqnK+puw=qdR-D7aap9SQ@mail.gmail.com>
 <CAPM=9tygJqtbmYzB5gktxp-7fBfv_9gNq9p9+SdZ6wiYE2-6PQ@mail.gmail.com>
 <CAHk-=whB1X1c6rWbY34wZVGcnaY=yfPGLOtjd5h3mMDGV9Lbkg@mail.gmail.com>
 <CAPM=9tyb1mELymOJv62KJom4mGF0UBifbVqLJUFdS1C7Eeu3jg@mail.gmail.com>
 <CAPM=9tzDWmYBKQGB0ybDzhYHkg0p98_6PJA8OuPahRep8+QPvQ@mail.gmail.com>
 <CAHk-=whOb_ebQQbnXeqb8uXf32WA32nrL3=HQ2y8hBm9hFgVOw@mail.gmail.com>
 <CAHk-=wh+79KkMXsNqyPxeU+c5U2h-n13ko6J_QzwtjyYCKhrSw@mail.gmail.com>
 <CAHk-=wgEGn0azq0n5BfWg4ZStrZYanLCX1a+quug7HKmjimhpw@mail.gmail.com>
In-Reply-To: <CAHk-=wgEGn0azq0n5BfWg4ZStrZYanLCX1a+quug7HKmjimhpw@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 31 Jul 2025 09:09:40 -0400
X-Gm-Features: Ac12FXw0EmQRRt1MKRO5jLab_Wal8G61JFd3QmymsPrv7WznOlUpDyX09UypSiQ
Message-ID: <CADnq5_NBM1Kso==+N=1xCjF+xiS7Vy4g47uvUN7sSWs8bontZQ@mail.gmail.com>
Subject: Re: [git pull] drm for 6.17-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Dave Airlie <airlied@gmail.com>, Dillon Varone <dillon.varone@amd.com>, 
 Ivan Lipski <ivan.lipski@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, Wenjing Liu <wenjing.liu@amd.com>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, 
 LKML <linux-kernel@vger.kernel.org>
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

On Thu, Jul 31, 2025 at 3:03=E2=80=AFAM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Wed, 30 Jul 2025 at 21:58, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > d7b618bc41ee3d44c070212dff93949702ede997 is the first bad commit
> >     drm/amd/display: Refactor DSC cap calculations
> >
> > Let me go see how painful it is to just revert it from top-of-tree.
>
> So with that reverted (didn't require a lot of fixing, only minor
> unrelated context added nearby later), current top-of-tree works for
> me again.
>
> The revert I used for testing attached just so people can see exactly
> what I did.
>
> It's late here, I wasn't getting any more work done today anyway, so
> I'll leave it like this for now.
>
> I can continue to do the merge window with this revert purely local
> for a while, so if somebody comes up with a proper fix, I can test
> that out.

I think it may be fixed here:
https://patchwork.freedesktop.org/patch/663973/

Alex

>
>             Linus
