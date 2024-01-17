Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0283830C96
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 19:18:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3543510E797;
	Wed, 17 Jan 2024 18:18:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E786E10E78F;
 Wed, 17 Jan 2024 18:18:54 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-3379e942685so849663f8f.0; 
 Wed, 17 Jan 2024 10:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705515471; x=1706120271; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mu6LdrycNNgQ08y3UW6a9CSmx2uDyBWPruWDy4r8EMA=;
 b=QRbNvFLWUw0Tsyh/LGzzsIK0bymACBZNOm+KXWSj7IFqxL7AHbL1qB/wMVo4OJW3Ky
 tIR7cor6f72NcUD/aFoLYBJZ9E0+6kkkNOdA5paZGfbfTf02Ac1sIuSpbofgvvvDZnCW
 aSVz8fZTuOOiogR9bk2sxaKfOpjnFBBAAsgoUutIIZcANiO3xxzCZNactwIL2rCQxw0s
 jqzUcsm7i0y0H2YI71AkFTwElembYyaegMYaycFfrp6VZJT1dLdR1eqgGFG1GGrAJIki
 EkyHqfhTp4dhLADnTGzidtx5nEhjaqp1t5Mfh+zZiB1NhW+IdLgfd2sCsQZh1MjC6mBc
 Rr8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705515471; x=1706120271;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mu6LdrycNNgQ08y3UW6a9CSmx2uDyBWPruWDy4r8EMA=;
 b=s8xkdbRjydrBCIX3V9+VgJect/nY2c5i7ZpnVsaOQ/Jo/l1dGHD6qJaZb2Uwg/eTuO
 kLKx1y9Z9G5kr67IjGsULy3G2Qlf4rSIcIbCOsH+CwGnM73hNUpR6EfymC9OGf7QmPn9
 v+nRayVVEvWKI8Ji2FmikqP53uWcsx5e4TXpE289lhNPbKKNbeBTDz5NIfKs8ma7BVBp
 nKQYAJz13kqIxQixrI/cGWmLIEB8ajlcb4Xz965ePqkmRHf1AWuqxfo0CMBgYrx+413j
 BN67++XUOm0VsSFZlJt0I27o2naC4qYWPmbiA3gX2L3BZs9zh+79zrjbmwjR945pREY7
 GhCA==
X-Gm-Message-State: AOJu0YyoQNs0ZD87FoDXIfTHmkXsWhcjXwjCkcXh0CfpZd6bkS0ip9b/
 hgG1utr6aeIJEEnP51aVNrmFGW1RWjt5K9/dvbM=
X-Google-Smtp-Source: AGHT+IEmrIoZhd1MvIESvU6Yko91IWdxVx2oC+8IxhhdJadrZ5NjRPWqIvMY3kKddOVb1AmvsJizybm09U2UO8cIEAM=
X-Received: by 2002:adf:fec8:0:b0:337:c50c:27df with SMTP id
 q8-20020adffec8000000b00337c50c27dfmr1311116wrs.4.1705515470923; Wed, 17 Jan
 2024 10:17:50 -0800 (PST)
MIME-Version: 1.0
References: <20240117031212.1104034-1-nunes.erico@gmail.com>
 <20240117031212.1104034-3-nunes.erico@gmail.com>
In-Reply-To: <20240117031212.1104034-3-nunes.erico@gmail.com>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Wed, 17 Jan 2024 10:17:24 -0800
Message-ID: <CA+E=qVe2NB+Bj07JmKVdxreVw0bCuv31xzXng=qPX17spBjDWQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/6] drm/lima: reset async_reset on pp hard reset
To: Erico Nunes <nunes.erico@gmail.com>
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
Cc: Daniel Vetter <daniel@ffwll.ch>, lima@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, christian.koenig@amd.com,
 Qiang Yu <yuq825@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 16, 2024 at 7:12=E2=80=AFPM Erico Nunes <nunes.erico@gmail.com>=
 wrote:
>
> Lima pp jobs use an async reset to avoid having to wait for the soft
> reset right after a job. The soft reset is done at the end of a job and
> a reset_complete flag is expected to be set at the next job.
> However, in case the user runs into a job timeout from any application,
> a hard reset is issued to the hardware. This hard reset clears the
> reset_complete flag, which causes an error message to show up before the
> next job.
> This is probably harmless for the execution but can be very confusing to
> debug, as it blames a reset timeout on the next application to submit a
> job.
> Reset the async_reset flag when doing the hard reset so that we don't
> get that message.
>
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
Reviewed-by: Vasily Khoruzhick <anarsoul@gmail.com>

> ---
>  drivers/gpu/drm/lima/lima_pp.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/lima/lima_pp.c b/drivers/gpu/drm/lima/lima_p=
p.c
> index a5c95bed08c0..a8f8f63b8295 100644
> --- a/drivers/gpu/drm/lima/lima_pp.c
> +++ b/drivers/gpu/drm/lima/lima_pp.c
> @@ -191,6 +191,13 @@ static int lima_pp_hard_reset(struct lima_ip *ip)
>         pp_write(LIMA_PP_PERF_CNT_0_LIMIT, 0);
>         pp_write(LIMA_PP_INT_CLEAR, LIMA_PP_IRQ_MASK_ALL);
>         pp_write(LIMA_PP_INT_MASK, LIMA_PP_IRQ_MASK_USED);
> +
> +       /*
> +        * if there was an async soft reset queued,
> +        * don't wait for it in the next job
> +        */
> +       ip->data.async_reset =3D false;
> +
>         return 0;
>  }
>
> --
> 2.43.0
>
