Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E1B9EE5A9
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 12:54:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E827B10E226;
	Thu, 12 Dec 2024 11:54:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="gI1Jq+dw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64B7710E226
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 11:54:47 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-e3984b1db09so323127276.3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 03:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1734004486; x=1734609286;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QO/kWUsb4uL9LlTqLCCAldTNWq3Gj6otKLX1s/PNWac=;
 b=gI1Jq+dwRmzNnZdviPqSbxqHODQbwvNNu908Gq6OFtqJg1gKp/beBAybtzx9p/e0QP
 pK4uRyoc63qST3rplBtbBKRoZeeBAKFmGRhvBMRqtz4B4Ez/yIhIixetPFi7Z077Bq78
 cBW9rNzL5CnkQpPCInnoLiEqr86UJiGUU4/lh6fenn2hKAAiAwFmOjFqgOZLHHnrHOeV
 DhSn9UAYSgqJpq1NI1JtRWN3Fws0xcrNK6OgNt127lmu2HW2I0MH9Xgvp0p1rwtCtGHv
 zWWXxhPP5EPhnTWcmAc/8Pmya0PYlw0kUtQlFm2AolnMnkB08l0A45dWooKap8z+6yX9
 f1hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734004486; x=1734609286;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QO/kWUsb4uL9LlTqLCCAldTNWq3Gj6otKLX1s/PNWac=;
 b=novf3BRJ/+FT0FPcUt4CS+yuCiNCMOSDBvUOTI/GRkS25Gdi+DG2DjgpnND552eTKs
 l50IMlGhhsiKN0ngLPXcGvFjPo94Fmpukhf4cIySt1GQ951VDjcvTWi0boFzy+m982zs
 H1qXWmf4NS5BKv5F+8uV5caJ1sKW8OysNHeCAawVvQQune/qi//r3xjAx0Xvo30yuYd0
 eyNIWfPfVkoQKrodHkblAm2uy36unkQHiZPE98wmR08tpsgSA+f5MO8zw5BBw7GkkFIR
 zFOeTQHn7pbez4oKzK/wepMQyeHLJ7SnuwMFEmB/sEEzVqa4d+84RK3HJEkMS6Ye1QLS
 4dgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKii1xC9EPbLO1z+lU8zkBu5JCCL+Nu2ag5sqkjd5J2UJyWENZVfIdfhLDgnoZE4HU8tIvMJiOpR8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwU5KDn2+Dj4nQ/Io0zXwGHwuepavJjFMB+WbNM6wtNdbpgE58F
 L8jW345fpgws+HJCF2rOa4365LnVxmawimgiSBr7YbL80qUrLRkQCUqnSYcL1Kgj/PIvdN7zZCA
 itfPauiPV3Ehl+9Z5oj0n47Fn2ULrGd0bIxvNTA==
X-Gm-Gg: ASbGncvI78bwjQeDtORxds19WqUSr4ixtPoIlJ3+VesWZ+cxSGpiPm52IE4d0tbD6Ey
 8WkCKpE4aK3Lf2Gx+ycgW9D5FZVr+L2HeqozNHw==
X-Google-Smtp-Source: AGHT+IEZF99x3Z73R94L+ljBCygUUX+Knk3vSPh2S8Sa4SUHrFwCAM7NZhFFUD6/0ncFI/p+axz2uwCX+vrS2ZOL06w=
X-Received: by 2002:a05:6902:2701:b0:e38:87bf:8e65 with SMTP id
 3f1490d57ef6-e41b8dd9f38mr127426276.0.1734004486531; Thu, 12 Dec 2024
 03:54:46 -0800 (PST)
MIME-Version: 1.0
References: <02c87d9c-76b8-4d93-b0da-0e4f7d4952ae@stanley.mountain>
In-Reply-To: <02c87d9c-76b8-4d93-b0da-0e4f7d4952ae@stanley.mountain>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 12 Dec 2024 11:54:28 +0000
Message-ID: <CAPY8ntD9XzrzrhX=1XojjcZmRm60KLc39HZq0bJ9cEq0J7nQ9g@mail.gmail.com>
Subject: Re: [PATCH next] drm/vc4: unlock on error in
 vc4_hvs_get_fifo_frame_count()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dan

Thanks for the patch.

On Thu, 12 Dec 2024 at 11:31, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> Presumably the default path is never used.  However, if it were used for
> some reason then call drm_dev_exit() before returning.

Correct - the default path would mean something badly wrong.
Without it though, if you add an extra enum value it throws a compiler
warning of an unhandled case.

> Fixes: 8f2fc64773be ("drm/vc4: Fix reading of frame count on GEN5 / Pi4")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/vc4/vc4_hvs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
> index b42027636c71..4f524ec126e7 100644
> --- a/drivers/gpu/drm/vc4/vc4_hvs.c
> +++ b/drivers/gpu/drm/vc4/vc4_hvs.c
> @@ -522,7 +522,7 @@ u8 vc4_hvs_get_fifo_frame_count(struct vc4_hvs *hvs, unsigned int fifo)
>                 break;
>         default:
>                 drm_err(drm, "Unknown VC4 generation: %d", vc4->gen);
> -               return 0;
> +               field = 0;

field is initialised to 0 anyway to handle the cases where fifo is out of range.

Personally I'd like to see a break in there to ensure we don't
accidentally end up with a fall-through situation if another case got
added at the end. I don't know how others feel.

  Dave

>         }
>
>         drm_dev_exit(idx);
> --
> 2.45.2
>
