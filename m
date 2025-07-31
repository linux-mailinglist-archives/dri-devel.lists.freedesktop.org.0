Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF13B17668
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 21:04:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC32410E2BF;
	Thu, 31 Jul 2025 19:04:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZptMs5Ze";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FCCE10E2BF
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 19:04:28 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-31ec291f442so180375a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 12:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753988668; x=1754593468; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d9hLQS1Qj2wO2t6Q4M7+LSgEvKKDPESGAJRbvOUbOkk=;
 b=ZptMs5ZeIew0SuXtnLHqBCMAa39PTW8ZH0RM3Af5MgnC8OLi4yi+Qi7afC1/whiCI1
 +649txtf/Lgcge0cUyywZE/namVAp4lNqC+JdBD1zEcl12S4RK/c9BKv6jKZP0sHrFTv
 01aYAh+8t9YL3CkPPgVE+KUlENR6RfvzIhQpk3eSx5uGSx+JDZ6lAFuarr349aDVpDMG
 UdxPnHdhMbhwH6jyuIqkAexApYlRIcsDXvgu9HsVF85zfKl+dGTDhCOs3D5MfJZvz3AX
 jnvtjaeFFXHd3Ktzr2mJeUrhQee+sHsxoPTLX27s2lElkvJYE+Zipf7YpMILDe01k6W7
 ERvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753988668; x=1754593468;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d9hLQS1Qj2wO2t6Q4M7+LSgEvKKDPESGAJRbvOUbOkk=;
 b=IrcKxOUIvxlifWFITaPRwSSTN4eDR9YHh6DmAWm6A4MWxhoypDq9jGBCMNKt/SJWxW
 RXHQv5Pjj+EHrlkvo9KumybCRYMEPfeHxEbm13RYJxKAexG8wGeVSRBPVe1xdjMhNaxY
 Q/1os8RUjLzPJYgFBgM4bAZdQcUNv/J2al2xXVgHCFOURab47XKsQZ3eLXf54VBhaH2i
 6+BU8iTT1byut6unqZzjpiI2YyOWwKjWxI1ZPbGFN2TrSwKzKlxnRys3+A7M+X+DSoRJ
 O5DXYnUrzsfiYuHKqQxl7SSa0u2q/WgwTBzux1N9wx1mQkTvYbIBpN/Vwe63Qm6RgyUI
 1WHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6BdXeQ+U5zC/A7MQuU3/Y3Shk8YUxcORwAMsQJESugfJyXkNsyhrrelnsMm9nmT99qTSGHzwT4iE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YycmFuv9uFb+eSi0TdyrCCXChhY0mt7FpB28qjWQsI3ZRFTWo0X
 4RP/yXnMg0tPFQIouXCqrefMuv9ANBnWrEawPdd9Z8reQjfVV//fa3v/+RJ7LDwExL4g8WeWFYE
 dMauX2JJDrpOO2yOjJZ0wq0+E90eQFaqvMw==
X-Gm-Gg: ASbGncukSQOoEF8OaZ6mSNYUU0dIIaibLfTYRvEf+Jle/wW7BtowoHl4kG/JBrEqRYI
 vjKB8Q1ZEU3FieUTgTGKeB6qsLpoZxRmBFpmZcQ7vI+6sqHT5kR0cGx4ed1FXycPltpfznpwBRJ
 B6TrFsFmk7byiLlfRnN6jEev9JsnQoKQRxtp8VWcr78q7QPsVSKUtjQDS7/2aRMDl1cqQi//V9v
 4alqZI/
X-Google-Smtp-Source: AGHT+IF2bYEl2+BEOAeHiljf3vUKpTyZm8+ers0QVY/s0tVH7OkxrGDLUBtiEkAByU+NxHzaKfQ59C63xqQyq7UvwYc=
X-Received: by 2002:a17:90b:380a:b0:31f:ea:ca84 with SMTP id
 98e67ed59e1d1-31f5dda82d5mr633555a91.2.1753988667626; Thu, 31 Jul 2025
 12:04:27 -0700 (PDT)
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
 <CAHk-=wiN+0FBwxwj1UiKsfHgW=C_aWy20F6PPt5M_ACnfukehQ@mail.gmail.com>
In-Reply-To: <CAHk-=wiN+0FBwxwj1UiKsfHgW=C_aWy20F6PPt5M_ACnfukehQ@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 31 Jul 2025 15:04:16 -0400
X-Gm-Features: Ac12FXzIgbuFXPjEc5kXfIQBbe_eDpBAwA8exmzuGM7zNQzkl_SPo-Foyl2jwFI
Message-ID: <CADnq5_MjQbDYZYvSi5D5sVN1oeaLdxRPCQdt99LkMW=FWdcOQQ@mail.gmail.com>
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

On Thu, Jul 31, 2025 at 2:01=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Thu, 31 Jul 2025 at 06:09, Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > I think it may be fixed here:
> > https://patchwork.freedesktop.org/patch/663973/
>
> Yes, this patch fixes the problem for me.
>
> I don't know if it's due to the pointer validation (ie this part):
>
> -       if (!dsc)
> +       if (!dsc || !dsc->ctx || !dsc->ctx->dc ||
> dsc->ctx->dc->debug.disable_dsc)
>                 return;
>
> or whether it's the divide-by-zero that the commit talks about.
>
> Should I just apply this directly, or expect a pull request in the
> next day or two?

Just typing up the PR now to send to Dave and Simona.

Thanks,

Alex
