Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D53A7877C75
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 10:17:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74C7C10E2B4;
	Mon, 11 Mar 2024 09:17:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DHt1LppH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EFE110E1DB
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 09:17:37 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-dc745927098so3613164276.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 02:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710148657; x=1710753457; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M+1SkM0ODd2CKqsVxZGXnA9O/skjPPIIln7iOxk5hQM=;
 b=DHt1LppHs137g5nhlifBYaphgDDrI4mK80h8p2n4qv2xdAcNcjwsPuEmvliIJehHfI
 S+6DpLPHbTWDcuDOwKikF3Cqk+5a1ZilhtoDYleYCibzamJhw+NQLg+uni8+65xoir53
 X5mS+KPwq/fzfYExc+zqQ0rIBHzykrLGz8encSS9Ka2XBRXO/P/2g1t2btveCwsV7Sxh
 prFbSsQ647/nlIIvwiuiiNUc2GYzQaUOfm2IQGdC5zyysUSzRZvRQ+RulUzGFw575buJ
 Oe/a+2LZQDAl6j2l1tzKpOm7eOwiyObFGIg3Y5dBNcI5dE3pcfb6wQ9KhSjH7yNrijwx
 GPqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710148657; x=1710753457;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M+1SkM0ODd2CKqsVxZGXnA9O/skjPPIIln7iOxk5hQM=;
 b=jCbLT2NAFyJa98udfPqDcteO7qIgrjPslXbU9FKZFmh52INcTez+w/aH/SVojoXd7y
 xcM1TffeOSoLFHx0s5QHdUDt+r6hnnPL+2Dgty7+BrVeiBcJFoTx2+02/t87IjvNgC8X
 LFaWemKEkLWq983JOHfWMv+lj9Ftnd0AQAb+eXf5OLRJPh1SmL1SQJ76/CMxW8AX0+Vc
 RgvMeEphnGy9wZuBJ8ldLdRxcGAsCujgBjQN8B56ymm0i09DNovrKf84mPfzXc8Nmyws
 GKvBVP4NCU3Fem74wXijjgEODv+Rx58fUs88QSeSIVGX7eggvm39DBFNBULbR8NE/8BB
 1vBg==
X-Gm-Message-State: AOJu0YyWxnZTSfxxx/JJfMPcFcWqfL7NjITVjr7EagcOyNouo5FYVisu
 tRNe56PI9BH7LyYsC1C5Y8Rz87HJMfGlnui8aE3RXTtscL3mijILC4Ut9nxkBbYCdYUgau84tk7
 7YrYtl6CiMb6YTN/kXk+ky8RB9R4=
X-Google-Smtp-Source: AGHT+IFKKGTpBd3b/HphE+pp0f/oX3wCJ2i4qtFaoZ+Tiib1TohKa+wlIuvcEOog/K/bqRCdFei/1O6RYZg+7urpuJo=
X-Received: by 2002:a25:850d:0:b0:dcf:4793:9a25 with SMTP id
 w13-20020a25850d000000b00dcf47939a25mr4576097ybk.44.1710148656709; Mon, 11
 Mar 2024 02:17:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240305160902.1363835-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240305160902.1363835-1-andriy.shevchenko@linux.intel.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Mon, 11 Mar 2024 10:17:25 +0100
Message-ID: <CAMeQTsbbXxoAtYDPuUdByvBNgs=23tn7ZhYAanCyUtELJq7HBA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] drm/gma500: Remove unused intel-mid.h
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
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

On Tue, Mar 5, 2024 at 5:09=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> intel-mid.h is providing some core parts of the South Complex PM,
> which are usually are not used by individual drivers. In particular,
> this driver doesn't use it, so simply remove the unused header.
>

Applied to drm-misc-next

Thanks
Patrik

> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpu/drm/gma500/oaktrail_lvds.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/gma500/oaktrail_lvds.c b/drivers/gpu/drm/gma=
500/oaktrail_lvds.c
> index d974d0c60d2a..72191d6f0d06 100644
> --- a/drivers/gpu/drm/gma500/oaktrail_lvds.c
> +++ b/drivers/gpu/drm/gma500/oaktrail_lvds.c
> @@ -11,8 +11,6 @@
>  #include <linux/i2c.h>
>  #include <linux/pm_runtime.h>
>
> -#include <asm/intel-mid.h>
> -
>  #include <drm/drm_edid.h>
>  #include <drm/drm_modeset_helper_vtables.h>
>  #include <drm/drm_simple_kms_helper.h>
> --
> 2.43.0.rc1.1.gbec44491f096
>
