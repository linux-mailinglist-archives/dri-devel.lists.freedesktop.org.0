Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C22830CBD
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 19:31:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77E5C10E7B9;
	Wed, 17 Jan 2024 18:30:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E935810E7B9;
 Wed, 17 Jan 2024 18:30:31 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-33728f82a71so2413898f8f.1; 
 Wed, 17 Jan 2024 10:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705516170; x=1706120970; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9QFL3eWOWcPqZNo2s58S+9S3xnanXM1ein8C5AjX/+0=;
 b=XCgODB/jpdymBm9LAF6UB27eqXVHOGOWMd6u5bn1uyH7FFpgcrS9FqfaB4ZGEzX0Zc
 bWND/RZFG51aKqDrrn5pk0zTRAYHJkCJgHDNKT7gv89PC2e8c2jcmqi03OKqSFA3gZzo
 kUDsOdNxq+zHOs7fTC/uCT5aWh4CsKzVrtQ/5wjZsFyg+InMm0IvGu6oKwgarght6jFD
 Fw/l+6xMGXLW+3N+a1KpxvQ1MmBBbb55bOr1luxUIhiMTsF2sRG6CqcWPL0GTRQWyohy
 67c2ehAKDqn30RiDjXnR43jMuX3MWzFFMMISb/a8LW24UyfiV0sFyyokwjDnN+0Uc5HU
 8bkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705516170; x=1706120970;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9QFL3eWOWcPqZNo2s58S+9S3xnanXM1ein8C5AjX/+0=;
 b=POWxhH2f7Nhl+JDKtFxgOzHfDoImK2j+2u7dpDlmD+vLib1G0thC8V+WDnxF1UbEBW
 6DE8rQkCYYx+WspXwhFrjBvsjn1KfYcmjYVmjVRei0dL9qsgzFvVY3vGuEMXYndkqto1
 SHX9m76cKFacppQRp/g60mIyy0Wmr8q2VXu75LsS3Cjp/D56o8JZDARe1oc+p6N785rr
 Vi4lI578graaM1b2b3ULT9eCTgTWH4NrQuyTsHyaQNf23pvcMSY5jR5FETF5KOabzNxy
 1qsgT6/Lrt5CURS6VYQOzqU1XUyuKRQwJakPSnjwNICB2hTdEEKU+myZbqedthQlwpK7
 e6OQ==
X-Gm-Message-State: AOJu0Yz29bcFL0mFKBv8Y3QeK2aw/iq63UyvTzEpZt4MXBTV3V34UPPi
 O/A7vLkDq8zynd6FnVG/jS7s+CqvgSnBvXIJK8c=
X-Google-Smtp-Source: AGHT+IHNqXM7o/4tSHP3xjfmLSIh27KUOvlRAHgM25oVq7qUlilsjoyTf814/vbyM3nqrWk6rINUoNESV6QUI8xbRfI=
X-Received: by 2002:adf:f0c3:0:b0:337:b74b:76ee with SMTP id
 x3-20020adff0c3000000b00337b74b76eemr153013wro.7.1705516170355; Wed, 17 Jan
 2024 10:29:30 -0800 (PST)
MIME-Version: 1.0
References: <20240117031212.1104034-1-nunes.erico@gmail.com>
 <20240117031212.1104034-7-nunes.erico@gmail.com>
In-Reply-To: <20240117031212.1104034-7-nunes.erico@gmail.com>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Wed, 17 Jan 2024 10:29:02 -0800
Message-ID: <CA+E=qVccx7XOMUJ04ZVefhNHrNjxCL=-dFHAcmOKMR+aYOJmcQ@mail.gmail.com>
Subject: Re: [PATCH v1 6/6] drm/lima: improve some pp debug messages
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
> Make the messages more consistent by showing the pp name.
>
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
Reviewed-by: Vasily Khoruzhick <anarsoul@gmail.com>

> ---
>  drivers/gpu/drm/lima/lima_pp.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/lima/lima_pp.c b/drivers/gpu/drm/lima/lima_p=
p.c
> index ac097dd75072..d9e178d6645d 100644
> --- a/drivers/gpu/drm/lima/lima_pp.c
> +++ b/drivers/gpu/drm/lima/lima_pp.c
> @@ -197,7 +197,7 @@ static int lima_pp_hard_reset(struct lima_ip *ip)
>         pp_write(LIMA_PP_CTRL, LIMA_PP_CTRL_FORCE_RESET);
>         ret =3D lima_poll_timeout(ip, lima_pp_hard_reset_poll, 10, 100);
>         if (ret) {
> -               dev_err(dev->dev, "pp hard reset timeout\n");
> +               dev_err(dev->dev, "pp %s hard reset timeout\n", lima_ip_n=
ame(ip));
>                 return ret;
>         }
>
> @@ -423,8 +423,8 @@ static void lima_pp_task_error(struct lima_sched_pipe=
 *pipe)
>         for (i =3D 0; i < pipe->num_processor; i++) {
>                 struct lima_ip *ip =3D pipe->processor[i];
>
> -               dev_err(ip->dev->dev, "pp task error %d int_state=3D%x st=
atus=3D%x\n",
> -                       i, pp_read(LIMA_PP_INT_STATUS), pp_read(LIMA_PP_S=
TATUS));
> +               dev_err(ip->dev->dev, "pp %s task error int_state=3D%x st=
atus=3D%x\n",
> +                       lima_ip_name(ip), pp_read(LIMA_PP_INT_STATUS), pp=
_read(LIMA_PP_STATUS));
>
>                 lima_pp_hard_reset(ip);
>         }
> --
> 2.43.0
>
