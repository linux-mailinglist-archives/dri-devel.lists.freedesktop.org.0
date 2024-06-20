Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F20F0910A38
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 17:43:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24AD810EA6C;
	Thu, 20 Jun 2024 15:43:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="afFb/Dpy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41A0B10EA67;
 Thu, 20 Jun 2024 15:43:03 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-1f9c6e59d34so9171815ad.2; 
 Thu, 20 Jun 2024 08:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718898183; x=1719502983; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k6+cRiKVZO9FUYX5aSKkhl/XU8fhmFH+Uqj0NqNLjzY=;
 b=afFb/Dpy9zqub2HdeVwHqPYygmnmDcI3O/lx3twOPFHj6S9dzXURow4Ut07rGKTf9x
 xjq9jUrEopZ2AmWHrf3+/GrJPZ7/McdEWF0czs/hl71gUe4k41GMXXwCRkTHpaRRk21Y
 BG89b2IoQDSOtY7FqVtbqEmTT/hiXa9ow/zFiWSVBL3G3QSEacvpFDsF95PKNIQrqbYA
 S9FLRCRuFSSCTQvMXSaO9HDKAt9IFMMgQFSzLBMYi3F2u4PvCK4aAx6tbZ/Umhyd26hT
 N4eep7/K8CgvVjUTGmc9rIeCU/5vpbeuq90l4mVbZiYs7xh2JeZEOqsM9eOyKiJRfOn4
 CcPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718898183; x=1719502983;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k6+cRiKVZO9FUYX5aSKkhl/XU8fhmFH+Uqj0NqNLjzY=;
 b=OKBAnyG5snh2yh763sV1kKPwvTbuR3c+CQ287ju/xSN51GPn7FfeU6xCBXgbTAT+fG
 qJ0G3mcgx+EneMTBqyjk09AV97LgXbovkntjH7tbcG7DR7guAI+0Q2ZJG1ZgE2OFmyMV
 WH9HIlPnqxf4I8XUavpaWbfwuZJaJ23TqoF1kGUEymGbTxd5gpGafDH8kzao0PaprDSm
 1gQuAMO5+d+3OoAMYi3qY7DazrIcAcd0aQygAtMW+qyLTj4wz04TU8GJF3PGxiVofarf
 NgdCJINkMAXvEIGJkewXUgO7axDh92XyzF78DALUmGn86YoTG+tmHDafGjCoi/1gNEH9
 0eew==
X-Forwarded-Encrypted: i=1;
 AJvYcCUD783HWQ9qoA/BvgVn48GLNchmV1fEuOrQTcGKPhIg4wJ6WvvZ/4hBlaO/rQgOi23b6T0VlWgXlUFh/l5QEIKlPbw9vg5iJF85hl1tRuOlegDlXAUIDQstcCueU5H9L9Z7jnMlFMQWNmOtvF27qg==
X-Gm-Message-State: AOJu0YxkONXun44Xx7xYn1fHnCqu3Xfu4on+zH/Ri4Ou8AndiSS+U0XI
 ZrtJ9uBie2S4+ZnssbPG6p4+FF3b7ggFVHU4ZcDQLvKoHXzJE/t34DVwGpxWqBAPPc4L7XN4vSo
 ChK7o8EIWRgmMVutRBivSokSxy28=
X-Google-Smtp-Source: AGHT+IH/qGtmd25WWTOZkSnnwAfm5sy2oxl3ao2SCrYKmj2x13c+PTut6ES6liqOyIzzDab8A2DfeKmumSKaGaV3ZlQ=
X-Received: by 2002:a17:903:1cf:b0:1f9:8cd9:96c9 with SMTP id
 d9443c01a7336-1f9aa45a571mr60134705ad.46.1718898182576; Thu, 20 Jun 2024
 08:43:02 -0700 (PDT)
MIME-Version: 1.0
References: <10510733-a59a-4419-afb5-e75fdd802794@moroto.mountain>
In-Reply-To: <10510733-a59a-4419-afb5-e75fdd802794@moroto.mountain>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 20 Jun 2024 11:42:51 -0400
Message-ID: <CADnq5_PsUNMG6FmH40fb_AetaGjhBf6S0Yd41ewAaai=eec_nQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/kfd: Add unlock() on error path to
 add_queue_mes()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Yunxiang Li <Yunxiang.Li@amd.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
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

Applied.  Thanks!

Alex

On Thu, Jun 20, 2024 at 5:07=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> We recently added locking to add_queue_mes() but this error path was
> overlooked.  Add an unlock to the error path.
>
> Fixes: 1802b042a343 ("drm/amdgpu/kfd: remove is_hws_hang and is_resetting=
")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/driv=
ers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> index d2fceb6f9802..4f48507418d2 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> @@ -230,6 +230,7 @@ static int add_queue_mes(struct device_queue_manager =
*dqm, struct queue *q,
>         if (queue_type < 0) {
>                 dev_err(adev->dev, "Queue type not supported with MES, qu=
eue:%d\n",
>                         q->properties.type);
> +               up_read(&adev->reset_domain->sem);
>                 return -EINVAL;
>         }
>         queue_input.queue_type =3D (uint32_t)queue_type;
> --
> 2.43.0
>
