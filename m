Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C645A84F7F
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 00:06:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48A6810E1AA;
	Thu, 10 Apr 2025 22:06:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="A1XbxLvv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com
 [209.85.166.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1144310E1AA
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 22:06:42 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id
 e9e14a558f8ab-3d46fddf357so5246555ab.2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 15:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744322801; x=1744927601; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E7ICNZV18cZHr2vbkLA3GpRwRAJQKYpv6Yp1RF0PmOc=;
 b=A1XbxLvvg5UsbcivzWspYBzShTdgX43RxU3P/2PooCfmd8oNANKfpVslMPS+zsvq2F
 fSCSLzruBWCz5nQBgYpXcusvcaxgsw2YccMUpl2vtfSx7xamEjExmu+mspS3V/O/4gAs
 EWJT9D+ou1ykG4lNsYOp6rXO2o9m8j2GPKckxM6WeKIdSKDCOqrtoeT6MGXpH45FecFz
 pxGwde3wJKIBquMzx+cwyxiHIxYlZ3ZLHQfkNuOR8qI6CQagAsPrN7BM4kG38h1cUzwc
 jecrUUvsWIBnjOQEfgnKD4tycNNyA8PkatF+Xmak6FOLP6Wna6Whrt1z4YbhWrDTWJUh
 qXrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744322801; x=1744927601;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E7ICNZV18cZHr2vbkLA3GpRwRAJQKYpv6Yp1RF0PmOc=;
 b=EYspCSgNFp62YcV8xvDuBZGCGbii8NS9ZrqMdlCywQd1aGDOehYjJv52wCiQ3CfrSV
 JGPwvkBCahXtEak87VYI0qVSdn+ueU8TY9aY50ungQbC68KSv7nAwrx005dISo7/uKdh
 TmkSbIq2iHhXthlsULYEvHbsSgn/2pt+uFSWB76Vb+V2e32O1WyiJLaqGk8PPEwgk8Tb
 86iDVXqwclrYpfW7zKJ32hk4PwxQfrZQ8WfBPa3/YxaDNcMKdJBC8FpDr/eupwQPD7iq
 4BbOd7kP5D6n+HmgHMVeiA8ZOHgBLaJYqkgzHuDrith20dZEaNKPghmjxn70l6W4/7Zd
 Crlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWd76MS7ewfxPb84SCpzua8g+3ouwoY93DQqtlA7JTHSL8Hz4ZlIa9l+Q4l2oj3mq+7EjB1j90HO+A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzEvgMzgYdVg7qIHdNSpWWZT2T/369/Yg6RViQpneH3re4C390Q
 EomCpWVZnSOf9lOHOlUyo59fp/c2m20sdYy0P86DEOMJA+WDjbzUZuF8gSP8na1UmrEzAYC8SXu
 iZD4e8houyYCRxghD9FIGUjSAanI=
X-Gm-Gg: ASbGncuFpIYhqKGCp5WU3TpH+yXF9UMKozfELAZ4vSi4MH0zIq7ok2YmOwebK/g1fO9
 M9iqhawLgGB5hiLkj4+9I9BYN27pfLgcm1fPG0Lx05Fb/Q98EafcAlO0sdG/N8v6AXD55d2GxG3
 p55BlgIr+AOk9Z6FiUzcW2bmtPSpOeNxTLWV9u+9jElETODEOHWCvmLCA6
X-Google-Smtp-Source: AGHT+IEPRpH3UqQvP2ZHQTbc4I7CWqGnc1U/KINkDJ4Z6Yy1t8pFZOhHpeJPZSPZN4Ye+gf4xD7+v/NgFyUWDrafl80=
X-Received: by 2002:a92:c261:0:b0:3d3:e284:afbb with SMTP id
 e9e14a558f8ab-3d7ec2276f9mr6044675ab.11.1744322801057; Thu, 10 Apr 2025
 15:06:41 -0700 (PDT)
MIME-Version: 1.0
References: <c715ef30-9d91-46f3-8a0f-1039f3d25e7d@stanley.mountain>
In-Reply-To: <c715ef30-9d91-46f3-8a0f-1039f3d25e7d@stanley.mountain>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 10 Apr 2025 15:06:28 -0700
X-Gm-Features: ATxdqUGor6TYjFwFif4Nt2sCrEKfvSFfALNnIVB1JHLShlwtHgWuM9y-gnK_g3U
Message-ID: <CAF6AEGshmGO0AAD3ndz-gN32r+xf2u=7gyf9aXbkZyb97AUXdA@mail.gmail.com>
Subject: Re: [PATCH next] drm/syncobj: Fix leak in
 drm_syncobj_import_sync_file_fence()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Rob Clark <robdclark@chromium.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
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

On Thu, Apr 10, 2025 at 9:33=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> We need to cleanup if the chain =3D dma_fence_chain_alloc() allocation
> fails.  Now that we have multiple error returns in this function, switch
> to using an unwind ladder for cleanup.
>
> Fixes: c2d3a7300695 ("drm/syncobj: Extend EXPORT_SYNC_FILE for timeline s=
yncobjs")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/drm_syncobj.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.=
c
> index 636cd83ca29e..c136d0c772dc 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -745,21 +745,24 @@ static int drm_syncobj_import_sync_file_fence(struc=
t drm_file *file_private,
>  {
>         struct dma_fence *fence =3D sync_file_get_fence(fd);
>         struct drm_syncobj *syncobj;
> +       int ret;
>
>         if (!fence)
>                 return -EINVAL;
>
>         syncobj =3D drm_syncobj_find(file_private, handle);
>         if (!syncobj) {
> -               dma_fence_put(fence);
> -               return -ENOENT;
> +               ret =3D -ENOENT;
> +               goto err_put_fence;
>         }
>
>         if (point) {
>                 struct dma_fence_chain *chain =3D dma_fence_chain_alloc()=
;
>
> -               if (!chain)
> -                       return -ENOMEM;
> +               if (!chain) {
> +                       ret =3D -ENOMEM;
> +                       goto err_put_syncobj;
> +               }
>
>                 drm_syncobj_add_point(syncobj, chain, fence, point);
>         } else {
> @@ -769,6 +772,13 @@ static int drm_syncobj_import_sync_file_fence(struct=
 drm_file *file_private,
>         dma_fence_put(fence);
>         drm_syncobj_put(syncobj);
>         return 0;
> +
> +err_put_syncobj:
> +       drm_syncobj_put(syncobj);
> +err_put_fence:
> +       dma_fence_put(fence);
> +
> +       return ret;

I suppose you could just initialize ret to zero and collapse the two
return paths?  Either way,

Reviewed-by: Rob Clark <robdclark@gmail.com>

>  }
>
>  static int drm_syncobj_export_sync_file(struct drm_file *file_private,
> --
> 2.47.2
>
