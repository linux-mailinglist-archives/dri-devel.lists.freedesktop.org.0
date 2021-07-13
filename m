Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 076E43C7123
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 15:21:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 904E86E09A;
	Tue, 13 Jul 2021 13:21:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 097396E092
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 13:21:11 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 f93-20020a9d03e60000b02904b1f1d7c5f4so21619884otf.9
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 06:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kdpFilVG5TXmh38Qx9BIPBfF1X+JzE5ROTCr6BlXwgA=;
 b=Fwg2SHr2yp+pkT/nR3CsSwV0aVO1sH7RaLMxJ+2G0tYtseOkHQtTzkbotRYz/drs/D
 5DiBLZ9LnMkNK3nOfKZUQmhxqw4BttJSf88b08Bi+bKSsYf8WHNgkkgf71hs5Ksqt3t3
 HXQ15TMQgdauzfhnZbVo8rVgSwGTYxMpi5/D9jr7s6e5O2D3FMbPgaMoUu2E9xxnlkKu
 F5U0P+bjz/mttGkYC5yEAByea626fA5W+07zeALUr0T630X6t1SzO4kLFv5DQsXqqF5u
 OxZ/zw7rSJXcpUgrKHhyOTEvRmu2wkrK4wVZ147rjS0crHZQRYpix6aGTx9S7IzxUd2a
 3jKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kdpFilVG5TXmh38Qx9BIPBfF1X+JzE5ROTCr6BlXwgA=;
 b=HDg4Yf3G9dx6SNAb9EYrjG+I8Em1JEpL0BNC7yW+HlVFtUVkkaZy1aqWikb+8+t+cb
 mBYErDWRtyzjhMvP0qDD1bc2iufNZ255y4v2PN25f4SrRwXTv1LLHuOifsW5OEt0QgbZ
 A7IKj79LFymF68WVax/YsoMszRTWGhGs5P9e0fwvF+TflgSX77bqthl8AE/Uu4koqRo4
 2KcBlZUJMyA2l9Vd8D9qrgBHn90rbB61hStBRcxH3dAv0hyb8Wym38Uk5AjF+DkNajOs
 i5N6YiJwZ7fkTUEqyrKz81GCDbxTixiHhx99gyUJdGXGspumsiuqC1SlFbvkVy4RoIx3
 Ytmw==
X-Gm-Message-State: AOAM530NEup8MXQigvY+hUJHJ5/xeyI3tcVU2k6Vyx7DWScGj1iFsRf3
 RuH4RWtJwEI3N1guP9972F+3e/NebV1ruRNUq9E=
X-Google-Smtp-Source: ABdhPJzdUywi6Zcn01BcK81PlNUigJdVIW+LyVOJf2f8AlJplFa9ZxozIuTRgXLkYNGYTM2g5mWhgplR5D7L7hyy8Pg=
X-Received: by 2002:a05:6830:1f3b:: with SMTP id
 e27mr3555174oth.311.1626182470396; 
 Tue, 13 Jul 2021 06:21:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210712224440.GA1830070@pc>
In-Reply-To: <20210712224440.GA1830070@pc>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 13 Jul 2021 09:20:59 -0400
Message-ID: <CADnq5_PKSPAPXxBjAw39fMXsDsvyd4sHWByAzmA4mb71=rnPcw@mail.gmail.com>
Subject: Re: [PATCH] use swap()
To: Salah Triki <salah.triki@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 13, 2021 at 3:09 AM Salah Triki <salah.triki@gmail.com> wrote:
>
> Use swap() instead of implementing it since it makes code more clean.
>
> Signed-off-by: Salah Triki <salah.triki@gmail.com>

Patches for this driver generally have the following prefix in the subject:
gpu: ipu-v3:

Alex

> ---
>  drivers/gpu/ipu-v3/ipu-image-convert.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/ipu-v3/ipu-image-convert.c b/drivers/gpu/ipu-v3/ipu-image-convert.c
> index aa1d4b6d278f..5f730cd6009d 100644
> --- a/drivers/gpu/ipu-v3/ipu-image-convert.c
> +++ b/drivers/gpu/ipu-v3/ipu-image-convert.c
> @@ -1021,11 +1021,8 @@ static int calc_tile_offsets_planar(struct ipu_image_convert_ctx *ctx,
>
>                         u_off = y_size - y_off + uv_off;
>                         v_off = (fmt->uv_packed) ? 0 : u_off + uv_size;
> -                       if (fmt->uv_swapped) {
> -                               tmp = u_off;
> -                               u_off = v_off;
> -                               v_off = tmp;
> -                       }
> +                       if (fmt->uv_swapped)
> +                               swap(u_off, v_off);
>
>                         image->tile[tile].offset = y_off;
>                         image->tile[tile].u_off = u_off;
> --
> 2.25.1
>
