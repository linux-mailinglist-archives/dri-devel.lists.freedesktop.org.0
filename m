Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F2EA782F0
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 21:53:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 519C910E475;
	Tue,  1 Apr 2025 19:53:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JYsNsSym";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAC1110E475
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 19:53:38 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id
 ca18e2360f4ac-85e73562577so508285539f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Apr 2025 12:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743537218; x=1744142018; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gc7B5TWF5E7dS0lIFexpVCDTxyXmK4Y/wIY/rEIEhGo=;
 b=JYsNsSymzQMUfhcsIwLqXCr4n72V9RHWEsLW5I8n9GilywuyHa+lJ5+Fg4hYG+Ze/U
 i09//Bx8SB/V7ZD4Jo0e9njC8A+YGPqSbp+BQuKcKCmeZLSTtiBINOUluf2ZI2ETq57+
 T+BuvYBuUmG7SaX36ilOq0Bi4HTbUxCXEICC19crBe8xl1jmItRTig/0uNsnbYJvPCWl
 24edw3q2BbXZDeOqW5pZGp9TmaV1s+++SmZyK4wY+um4K5i1JdiruIJ6FeU2lR5cAaCu
 hhOnbn+pIPfr2R5dugbB4FmZ0U9aCtd0/qibxtWjH6IQbNyQY/q0fgHjTGkE8A8iNlO7
 m4LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743537218; x=1744142018;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gc7B5TWF5E7dS0lIFexpVCDTxyXmK4Y/wIY/rEIEhGo=;
 b=A1h2wBzQe7ZLNL2qmfB1g8GqkrdDJ5eXDI79AwBsLPFSsvtuLoJ3N1PKyFJp7OE1Rn
 qiJ2lFkbH0MVEVq1jTjs4qwGV16YF7C9g/tqhrsUhppJE6GEqXAGXapd87wT6bw201Ri
 fGDZVUDwkngbBUgawoUc7zD8hTFBcXXhMyMUyUCmMNBD36LYByXK0yhV4dd8BO7KzhSI
 SH0GBWioMfS1eB3OEkRysTb1YqcFcQI7uuiG165regsUa7gW1g8f0nOdRokSyWFP885g
 9BLP+y5eY2xbV0KA7DeSASZys9D7D7hpfnROefTdTIMsBUmoFMfTQsjpx9XZ148fw2ec
 wbdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvougXNPRGaGE+YLFwi7KUqVYIprecNManUgU65lACE/t7br8tp1lSFOZGPumu+XE/BlDtGdTaTno=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxIeMQ8xDP4CWSbXCtwqC/X8dDg4UNBVXJA8p8YFAJ0qeEMvjiu
 vsHnkOnF8oi8EeNa5QnhkutoJHBawYdA2W4Snmy5Er4XlwDLpnvBdHDQxbdqFbcHO74o8THQITL
 xDxlUve0OdvB0m081gy8nx0rcRuM=
X-Gm-Gg: ASbGncumCniCriUJoAg/zZw08ErQk3nEzYrsiNarphtW96OiSw/usnusTCJHQkZ+0TK
 lAkf6o7iQuMoxCS0HOJQ9vvneCdEL0IO5g9g8YXdnumV8LLg2ziFZvszRh5gkHfujWTopuozYbG
 GuD6gW1PznHBssv24N71KxXLj3jhRSaKxlCPOBjL68kdiCWiRHcaJoUYiO
X-Google-Smtp-Source: AGHT+IH3S71OAEwFMQD4R/OEKTAMcAKSmJhwYs7vzK+zU99RQKuLFvb95AfvxDZWWU8kud8NGXbifBK7Do0dL2fI2Sw=
X-Received: by 2002:a05:6e02:4401:10b0:3d1:9999:4f62 with SMTP id
 e9e14a558f8ab-3d6ca5b1852mr42452585ab.2.1743537217735; Tue, 01 Apr 2025
 12:53:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250401123842.2232205-1-dmitry.osipenko@collabora.com>
In-Reply-To: <20250401123842.2232205-1-dmitry.osipenko@collabora.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 1 Apr 2025 12:53:25 -0700
X-Gm-Features: AQ5f1JoQHRRLbQWDkENOEX3GOQ6LDd-52WdH18mm3il4tRiQyy7pyqd6guv7zl8
Message-ID: <CAF6AEGu8XZktM9Y0t=KEF68uGLz7D_+9H1GnAPnZqc1YsT8iGA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/virtio: Don't attach GEM to a non-created
 context in gem_object_open()
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
 Vivek Kasireddy <vivek.kasireddy@intel.com>, 
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel@lists.freedesktop.org, 
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
 kernel@collabora.com
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

On Tue, Apr 1, 2025 at 5:39=E2=80=AFAM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> The vfpriv->ctx_id is always initialized to a non-zero value. Check wheth=
er
> context was created before attaching GEM to this context ID. This left
> unnoticed previously because host silently skips attachment if context
> doesn't exist, still we shouldn't do that for consistency.
>
> Fixes: 086b9f27f0ab ("drm/virtio: Don't create a context with default par=
am if context_init is supported")
> Cc: <stable@vger.kernel.org> # v6.14+
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/gpu/drm/virtio/virtgpu_gem.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virti=
o/virtgpu_gem.c
> index 5aab588fc400..3d6aa26fdb53 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_gem.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
> @@ -115,13 +115,14 @@ int virtio_gpu_gem_object_open(struct drm_gem_objec=
t *obj,
>         if (!vgdev->has_context_init)
>                 virtio_gpu_create_context(obj->dev, file);
>
> -       objs =3D virtio_gpu_array_alloc(1);
> -       if (!objs)
> -               return -ENOMEM;
> -       virtio_gpu_array_add_obj(objs, obj);
> +       if (vfpriv->context_created) {
> +               objs =3D virtio_gpu_array_alloc(1);
> +               if (!objs)
> +                       return -ENOMEM;
> +               virtio_gpu_array_add_obj(objs, obj);
>
> -       if (vfpriv->ctx_id)
>                 virtio_gpu_cmd_context_attach_resource(vgdev, vfpriv->ctx=
_id, objs);
> +       }
>
>  out_notify:
>         virtio_gpu_notify(vgdev);
> --
> 2.49.0
>
