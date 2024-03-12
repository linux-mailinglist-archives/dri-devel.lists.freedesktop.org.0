Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7794879B26
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 19:16:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFBEC10F29E;
	Tue, 12 Mar 2024 18:16:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kElx5qNX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6373110E178
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 16:08:19 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2d28387db09so62775381fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 09:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710259697; x=1710864497; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0X3bh6regalLfza/VqXtw3dY8qNGGSgfK0NBO0mq7Yo=;
 b=kElx5qNXRNEe4Vh6VXUwevq8SL659x1QhVCCEQ2uaVJOxqHZoX9az+0anwFHJ/lVso
 1n49qN8iLdc6fS5Fv1G02Yl7jJgW2+L35jLvewE6cmMf8HAPL54cc4595k0tdqO8Al5p
 3dEP1iWUbmLuFvPLENUoOcS4RsKSyi5cLr77fZp82qpgTSiq5TH4GwRfdxOp8fetvWmp
 TB1+r7jvAP4AtoAFdq5cFfOyiy+0LDLyYOcAvo2fDL6r8z1SpR+fLLjbHvZYOaD7SgqC
 SGtCM11rraXWUE1P3L3WYut5MZUaAfkkM1fZbfY2PMqwSAAwG5nuNVciMQHZ/ehuvOX2
 3wHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710259697; x=1710864497;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0X3bh6regalLfza/VqXtw3dY8qNGGSgfK0NBO0mq7Yo=;
 b=lurpR7/l2ppKLD+h95WL1qeOLbEtUEymNW4X5Ho+SUzu4zDNRD6tbYqGAM8h3ZpUfF
 YYpE22zgYiqReVeT2zlDXb04yE0YMeUtGY73UEQcFlAuwsmNTEIz19+fUzAGuHi3bl+M
 qtUFpbRjC/cARBE+2prtDFlO8N6xyBAor+M42szPS55QSBGR/KjZUJS3PYVkDJHLcH4y
 VCmWRyqLJ3LmnOn+3ADeZIKqVyWgkbN2yO3+n1Nrbhq8yMqzihfnITywPRvu75svUAeO
 fUo3Pv40UAoQYpzJZI7behl3Uwp03pUg00jf+IH//PAE3uJYDe8ipc0zafseBRGNWcGc
 yylA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVINAypqpoJ37TtWA4eQfhVDTOUw9p7yJXpOjBvsswVeZHCQLMwxkahlD0CNCeewnsASqRNqvWLHO6pC6br3dFRjo6kc/YFCIks3lTwdkCn
X-Gm-Message-State: AOJu0YxQGQm9errK/AIwIdsPaqX3zgaHzXguqmEGgYiXefalnYD6rpLh
 hP28dj9gpcC4W2M7KhoMfoBmhY99qtcBdA8Oj3uGz/WG3j7dQwA0GqvRKkXfsV1DFUlxKxL71Zc
 CV2y3rovdYkSGF4brSW+pmKVfX0Q=
X-Google-Smtp-Source: AGHT+IGYIvZqarMg5Vm2nKOnutiSU8XvApjVKUHqujlgz1UN8eZq3ic9oExfiZabCfDqH/yPYDlMcbT3eWthw0T2HO8=
X-Received: by 2002:a05:651c:2207:b0:2d4:4777:e2d8 with SMTP id
 y7-20020a05651c220700b002d44777e2d8mr3555811ljq.13.1710259697156; Tue, 12 Mar
 2024 09:08:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240312154834.26178-1-tzimmermann@suse.de>
 <20240312154834.26178-12-tzimmermann@suse.de>
In-Reply-To: <20240312154834.26178-12-tzimmermann@suse.de>
From: Deepak Rawat <drawat.floss@gmail.com>
Date: Tue, 12 Mar 2024 09:08:06 -0700
Message-ID: <CAHFnvW2-QYRCXdYe47txBvpj4N=NNLsPqS0pkRAiJBJMsE+Ksg@mail.gmail.com>
Subject: Re: [PATCH 11/43] drm/hyperv: Use fbdev-shmem
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: daniel@ffwll.ch, airlied@gmail.com, deller@gmx.de, javierm@redhat.com, 
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 12 Mar 2024 18:16:28 +0000
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

Reviewed-by: Deepak Rawat <drawat.floss@gmail.com>

On Tue, Mar 12, 2024 at 8:48=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Implement fbdev emulation with fbdev-shmem. Avoids the overhead of
> fbdev-generic's additional shadow buffering. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Deepak Rawat <drawat.floss@gmail.com>
> ---
>  drivers/gpu/drm/hyperv/hyperv_drm_drv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c b/drivers/gpu/drm/hy=
perv/hyperv_drm_drv.c
> index cff85086f2d66..ff93e08d5036d 100644
> --- a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> +++ b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> @@ -11,7 +11,7 @@
>  #include <drm/drm_aperture.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_drv.h>
> -#include <drm/drm_fbdev_generic.h>
> +#include <drm/drm_fbdev_shmem.h>
>  #include <drm/drm_gem_shmem_helper.h>
>  #include <drm/drm_simple_kms_helper.h>
>
> @@ -149,7 +149,7 @@ static int hyperv_vmbus_probe(struct hv_device *hdev,
>                 goto err_free_mmio;
>         }
>
> -       drm_fbdev_generic_setup(dev, 0);
> +       drm_fbdev_shmem_setup(dev, 0);
>
>         return 0;
>
> --
> 2.44.0
>
