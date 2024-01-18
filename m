Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D4F83112B
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 02:57:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA28F10E072;
	Thu, 18 Jan 2024 01:57:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12A0810E0DC;
 Thu, 18 Jan 2024 01:57:24 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a2c67be31edso800040666b.0; 
 Wed, 17 Jan 2024 17:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705542982; x=1706147782; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4sMKLwhhWm9+j1ob9vaGlonXEkVtE5eNqda4+zT2k6s=;
 b=ewaUFjMEmLdKz7zl6OQT+TKDN0ZDbzVZeNdPrmuUqkqEM3jvSyYpzSryz48331dz5W
 ksDCwNEjFZtLoVcrwHq999QWm0o6QEpBke1ZSIZlK34agXXK4bKb4KeQs0yXS0vZd1I+
 LgMC+UTnwGCLBipE4SI43QjR2nXaw1j+FW0bXRb+IDaPSxfmoKLXbolyFgoLyzcNS2Dq
 9BjiMpL8I2tDp53G3kmW76PbDVHoeB1GPnLLS9oofx3xVMdDaH/C6uMl1K1FBYDB8p4X
 6Wwl66+yl2YeJ2qvPU34Qq3hpaX6MngHsorML1bErieI7AMyC56vK3YtdD5pMotU9Hgx
 dE6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705542982; x=1706147782;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4sMKLwhhWm9+j1ob9vaGlonXEkVtE5eNqda4+zT2k6s=;
 b=JqlE5Emj/U6GtgXu/asljTF1+Pw2ErKHCFC30l6C6V0IwIEZrdVy8UIzo6i2deHOpG
 mDZQIg/Kh0oxuYOD5dNEWjabIIUbMbhmGeWh9TpNZwSbNo1GkJk2ESa/XuSeX6nTOzdK
 Ixv+/gpsuz4u7tHoJnUClFB4c65RqedeKJpQIEe28MxCMRRJCs9EkRuLx0BjmcMB1AQ6
 xZkFtfjDs/yb9RSg9DR5IEbkCEVO9iu/6pvesE+9s2BKQwuUpDTSr6fWx4zYnuM1wy6G
 95cfHFgfRTL/V6sIcc9Kvc0byCmbLGeERdhZFashDsmE9xI1BGn+x2/e3mljZ2AcIFtn
 IscA==
X-Gm-Message-State: AOJu0YxAy7s78P72bC2Uytl0RDVRb/p7U7PvBJBwITznjjQ28DV5Xt/F
 X9lWTswkDO8jj0+yUr6fojgAMSGGvXA6sJugBoNOWQY7qo5LcddrkkY3CQyY14Fdo2/vtK9T4Ro
 BMpJHXT8TXQAHgiRoGX2iNeUwFKA=
X-Google-Smtp-Source: AGHT+IExyadU6u2dEU08U1gT/xsHu6doWuX+IR7Am3UJ+nlqGITJiJqfEPa0d6e6E59TzEXbtAtmGfiZD+ZkYqrbgU8=
X-Received: by 2002:a17:906:b117:b0:a2e:d378:7612 with SMTP id
 u23-20020a170906b11700b00a2ed3787612mr25597ejy.133.1705542982435; Wed, 17 Jan
 2024 17:56:22 -0800 (PST)
MIME-Version: 1.0
References: <20240117031212.1104034-1-nunes.erico@gmail.com>
 <20240117031212.1104034-3-nunes.erico@gmail.com>
In-Reply-To: <20240117031212.1104034-3-nunes.erico@gmail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Thu, 18 Jan 2024 09:56:10 +0800
Message-ID: <CAKGbVbsc7KHFLr9bxZzzuK4tkv2JpSnW4vTCpHBU-nP8Fbshnw@mail.gmail.com>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, anarsoul@gmail.com,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

GP should also need this.

Regards,
Qiang

On Wed, Jan 17, 2024 at 11:12=E2=80=AFAM Erico Nunes <nunes.erico@gmail.com=
> wrote:
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
