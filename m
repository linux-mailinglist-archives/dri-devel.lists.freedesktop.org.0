Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3ED4B172A9
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 16:01:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 410F810E27D;
	Thu, 31 Jul 2025 14:01:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kNyM2eDG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA93D10E27D
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 14:00:58 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-312a806f002so141658a91.3
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 07:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753970458; x=1754575258; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8157ZS3tYeHtH6rijRBK7OcIVWChQfvpSllS+EZouUI=;
 b=kNyM2eDGi3lFXGDAofI7N4S8I83c51mLgyKQNtfI1tBF9HlNgZiFOt1TkbWr0ZeihB
 BNfEhm+syL4AwqtTp9khjOx0AJBmelpotAjf7WrFyOb2MRCil1aGrRrFVjZ7zl4qQMJc
 BlsD1NcTqwbqIalNTd61yTGcOPzCJFtt0wlEx0cRtyFIfJHIKgCWz7noVIhkPlw+mF2e
 d2Ygb1144THZviu4Xfc2V2XvboyvlqbNXk58SJ8TB2udPUKB4ZeWfovxFpsoqmI5IC3Q
 cvxGaN0meo/JeG/7ZLbsPPraK5V7ub87An6OnMS4k4P8nSTDqPMsOUTxPKeYElepnDor
 juZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753970458; x=1754575258;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8157ZS3tYeHtH6rijRBK7OcIVWChQfvpSllS+EZouUI=;
 b=onifVHA1Ii2slwV2aTG5vNIRqqpWrlVCa+0/mEQ9n+0uJNA4T6Hz21oBWRPdI/mvYf
 3mIhz2vhoSMYY5qEDDbypQR+MW8JU2SsmB2ZDDq/PzVXJAd951/dZp3QjdDQaN7z+UUI
 7G0N/JiAQEI0Bf8DGnDNjzRVZOUR4uk5/en9kXm0yAn+gyc2gnJu3yharbT8UfXIc/Qn
 Mc5RLWhiTnHcHuUZvD4CfCEZ/o3CUuNKzL+gm+vtfsBtkIhT7jOjt5/kEB6ha8EGPb6R
 74f4s7IVp+cLAvUaRP+WVmq5rZMZnlbgoBhJ0vqP6DouwMXmfMDIAUrcW57X0XOZHR/V
 et6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuH9aUatTsu4QAvbmjSF65qRR6bcKLfO+WeNCRBfadinT2DTmpm5NoLdY+n3F1g/W+b/8ZHkLatKI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4zj0xX5v+3uWtiCLvv5DvDO4NkoZVrXwmr5fPKPQUOX45qr1T
 uj0nPzYfKf53uykf8Yfwe08NusosShbgbzUo8OYx21AE5g+yb4TtvIL3h4i5C3QbK5TfqcbmDmO
 qnOVthqXOkr52H1Qw5DRBC4a0075UdJ8=
X-Gm-Gg: ASbGncsi3vzfsT2PB5cP4Vn7L6OQLIt7UnYsSdawonOg8GYBVhSKlMiuPaY1sN7aKCt
 jkzKkDKiY20K6/Xyb+fQOyJS5mTqbHCdYArVSXJ5DywSzAg8ub2VQLrrSLfGwJmgGol3ivbA8Hg
 E3RkOVFO4rdsvGreIbWu+Q8VTXaNEh2+kSNhU7B6idf52/Sp729ShmvqjCEDR5kTsi/w5sZs+Pd
 bAamdDN
X-Google-Smtp-Source: AGHT+IHmeHWZpcZnnZ3kXgdMZ5YyCy7CsMUcHBLKicsRETzXtCN9pdf52HCE2POOb92QpUFR8CCNPcVZOGClLpCOnww=
X-Received: by 2002:a17:90b:1d88:b0:312:e9d:4001 with SMTP id
 98e67ed59e1d1-31f5de88251mr1992896a91.8.1753970458039; Thu, 31 Jul 2025
 07:00:58 -0700 (PDT)
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
 <CADnq5_NBM1Kso==+N=1xCjF+xiS7Vy4g47uvUN7sSWs8bontZQ@mail.gmail.com>
In-Reply-To: <CADnq5_NBM1Kso==+N=1xCjF+xiS7Vy4g47uvUN7sSWs8bontZQ@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 31 Jul 2025 10:00:45 -0400
X-Gm-Features: Ac12FXxuuoZ1YWI8UmgU_FrhbQ3mMkgX2KF3Bcm21SS1tJ08teC8t0_OYzwfXfM
Message-ID: <CADnq5_MWxd7WHi6=aY2ckHNOvRvT1e_rDPU_0xEma1cbaGa2Yg@mail.gmail.com>
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

On Thu, Jul 31, 2025 at 9:09=E2=80=AFAM Alex Deucher <alexdeucher@gmail.com=
> wrote:
>
> On Thu, Jul 31, 2025 at 3:03=E2=80=AFAM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > On Wed, 30 Jul 2025 at 21:58, Linus Torvalds
> > <torvalds@linux-foundation.org> wrote:
> > >
> > > d7b618bc41ee3d44c070212dff93949702ede997 is the first bad commit
> > >     drm/amd/display: Refactor DSC cap calculations
> > >
> > > Let me go see how painful it is to just revert it from top-of-tree.
> >
> > So with that reverted (didn't require a lot of fixing, only minor
> > unrelated context added nearby later), current top-of-tree works for
> > me again.
> >
> > The revert I used for testing attached just so people can see exactly
> > what I did.
> >
> > It's late here, I wasn't getting any more work done today anyway, so
> > I'll leave it like this for now.
> >
> > I can continue to do the merge window with this revert purely local
> > for a while, so if somebody comes up with a proper fix, I can test
> > that out.
>
> I think it may be fixed here:
> https://patchwork.freedesktop.org/patch/663973/

That patch is in my fixes branch that I was just about to send to Dave
and Simona.

Alex

>
> Alex
>
> >
> >             Linus
