Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 724A5B1A899
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 19:25:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F8FC10E459;
	Mon,  4 Aug 2025 17:25:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EudmtMom";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3274C10E459;
 Mon,  4 Aug 2025 17:25:35 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id
 41be03b00d2f7-b3510c22173so520276a12.0; 
 Mon, 04 Aug 2025 10:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754328334; x=1754933134; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g690U9pQgSxTEWE6ATDJuvl7Gc0JomLmYetcHpxeY3M=;
 b=EudmtMomhisaq1lBGGDFyxbNjsFEsMG9HYNus5divjvr0BqusDvSkrrzI/fIlz0ahd
 KvNgESbD9M3NRgmheTYgGYF7r5FxZncvM1O94LIKw1muzhayThjih0OzFcSlI7uW5SQ1
 OsZ4t3vRmjdhVS/wqrl/BmJxgHtLOqHZGvd0IHTA/a0PFoc/D8PICFTDspGLPnCwTT6p
 t+qa4jA48K3Jy0ropOXkkUvAnydsjGYMJlI+PsBpJNT5nHzI11NwqQ4uBCl6oq0/Gc88
 0KtRqf53bC2fKaHZrLrIUrFGyPerZRzcoZLBw63vgocIMa1+XSIaVVGXjGMY+lJZs6v7
 P5Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754328334; x=1754933134;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g690U9pQgSxTEWE6ATDJuvl7Gc0JomLmYetcHpxeY3M=;
 b=OrY8eMwp8aZ78TDuvmLS8Wp97mvfp7dfFdVKOoGE2hU9wll+9v8eVBCdnB0ylGUNIw
 Q/ioxofHWkaWl1kNIRu40pSP+JiHbV7hgBfyFfqQtCNJRQk4NsyjJcGhZiSHmRNxnoIW
 NNOc8Rw41ZIbyVJH9RUVV/scTKXT1fDjpGdaU6xYWoV7h+9p23KVOJvBDjdwTrd2L7vr
 tVk4XP6RGP7zTkcOdwuDhDHaYy3IBCNGEVeJ3443wArXMGLLNalo68+Opc3s/Dfgff3H
 5vflBNXasCzbZHk9hDObHqV3HKb57pA+NSu5fJ+GIcl8BqaDwwG6ROiERDW8aaaFK2+l
 K6AQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXDfFCW+KfyS89vtqbXggCdFLZb95++vroWHpk9sYtA5RYWl1DO0p9YlBG2VgSI7keui2/a8N4@lists.freedesktop.org,
 AJvYcCW3/WELVfGNCIGFyijgf7sunXahKbwpeNeIyXm4kDXYSuded8ZyG48hED9XFJoW6y7EApQXdoxzYQSm@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yye8fbF8OwNemveWrwDJd+ky8k9qhKn/iOZvyZvzHyCqU9uSPIw
 di+A8MSKFaKZfK7MGze3kUae0qszfyMR7iXzH4WxTd6xp4raxt9cs013kziJ1rhA6IbILWR1LPX
 kkScXKbBhCSRsF97dSBpv2BrZqIxm5oq4+Q==
X-Gm-Gg: ASbGnct7pQb/kYCfDZL8J8nGMqbqhg1NhWE7Js0pw+4ODtXiTpuhlDS2AtnW+prTPnH
 a4X2KPvL2URPjqYKJU1T93INgq9BVtpD0D7QzumrksXFwSYlfr28YT74L70vSO+/1SKtxhgiiCw
 RPKhmRSMUFyoW3op9SowfO0fkXg986TktUnjgNnckJXTySKKIsVUo2ClF7AI3phsxAeOr0sSkiG
 tOk4nnxg4+0aa0B+7Q=
X-Google-Smtp-Source: AGHT+IEajlMeD6NqO5b1/eXYB83OKLA2Za5F+Hq1oKtZSBKe86RBYLYjaIscUGuv7UBB/vwGN7icLu9m0Gh4yj7DzII=
X-Received: by 2002:a17:90b:1d03:b0:31f:ea:ca84 with SMTP id
 98e67ed59e1d1-321161e12c3mr6481614a91.2.1754328334511; Mon, 04 Aug 2025
 10:25:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250801-amdgfx10-v1-1-e1dcbe18d84e@ethancedwards.com>
 <CADnq5_N+bQppUAD-qR8QC8M6nW+oRF8+7z=Qakcxc=a6Z8q4Gg@mail.gmail.com>
 <c82931b5-0de2-4e45-a80b-3a90b0cc98a2@suswa.mountain>
 <CADnq5_Mk3FO_tvxFo+fJgqskVc7qtGv74VM6EStx_BcVpahXEQ@mail.gmail.com>
 <fda8103d-cac8-4c00-a78e-6eb27141d9ea@suswa.mountain>
In-Reply-To: <fda8103d-cac8-4c00-a78e-6eb27141d9ea@suswa.mountain>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 4 Aug 2025 13:25:23 -0400
X-Gm-Features: Ac12FXy5S9_TzHUM3Kpfu9ojzbDCloPuhMA2gBarDK5IhPP2L8syh5vot1HwA9Y
Message-ID: <CADnq5_PdgH7yPZ9UNw3iXvuQAAUmuKpMh-E8NLri_q5Zn8deWQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/gfx10: remove redundant repeated null checks
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Ethan Carter Edwards <ethan@ethancedwards.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
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

On Mon, Aug 4, 2025 at 1:15=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro.=
org> wrote:
>
> On Mon, Aug 04, 2025 at 11:08:57AM -0400, Alex Deucher wrote:
> > On Mon, Aug 4, 2025 at 10:49=E2=80=AFAM Dan Carpenter <dan.carpenter@li=
naro.org> wrote:
> > >
> > > On Mon, Aug 04, 2025 at 10:32:43AM -0400, Alex Deucher wrote:
> > > > On Sat, Aug 2, 2025 at 4:22=E2=80=AFAM Ethan Carter Edwards
> > > > <ethan@ethancedwards.com> wrote:
> > > > >
> > > > > The repeated checks on grbm_soft_reset are unnecessary. Remove th=
em.
> > > > >
> > > >
> > > > These are not NULL checks and they are necessary.  The code is
> > > > checking if any bits are set in that register.  If not, then we can
> > > > skip that code as there is nothing to do.
> > > >
> > >
> > > It's not a null check, but it is a nested check and it's a local
> > > variable so the patch is correct enough.  At this point we know that
> > > grbm_soft_reset can't be zero.
> >
> > It can be 0 as far as I can see.  If none of the GRBM_STATUS bits are
> > set, then we never set any of the bits in grbm_soft_reset.
> >
>
> You're missing the first check...
>
> drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
>   7657          if (grbm_soft_reset) {
>                     ^^^^^^^^^^^^^^^
> Checked.
>
>   7658                  /* stop the rlc */
>   7659                  gfx_v10_0_rlc_stop(adev);
>   7660
>   7661                  /* Disable GFX parsing/prefetching */
>   7662                  gfx_v10_0_cp_gfx_enable(adev, false);
>   7663
>   7664                  /* Disable MEC parsing/prefetching */
>   7665                  gfx_v10_0_cp_compute_enable(adev, false);
>   7666
>   7667                  if (grbm_soft_reset) {
>                             ^^^^^^^^^^^^^^^
> Unnecessary.

Yes, sorry, my brain processed this as the first check.

Alex

>
>   7668                          tmp =3D RREG32_SOC15(GC, 0, mmGRBM_SOFT_R=
ESET);
>   7669                          tmp |=3D grbm_soft_reset;
>   7670                          dev_info(adev->dev, "GRBM_SOFT_RESET=3D0x=
%08X\n", tmp);
>   7671                          WREG32_SOC15(GC, 0, mmGRBM_SOFT_RESET, tm=
p);
>   7672                          tmp =3D RREG32_SOC15(GC, 0, mmGRBM_SOFT_R=
ESET);
>   7673
>   7674                          udelay(50);
>   7675
>   7676                          tmp &=3D ~grbm_soft_reset;
>   7677                          WREG32_SOC15(GC, 0, mmGRBM_SOFT_RESET, tm=
p);
>   7678                          tmp =3D RREG32_SOC15(GC, 0, mmGRBM_SOFT_R=
ESET);
>   7679                  }
>   7680
>   7681                  /* Wait a little for things to settle down */
>   7682                  udelay(50);
>   7683          }
>   7684          return 0;
>
> regards,
> dan carpenter
>
