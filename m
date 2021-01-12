Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8567E2F2A57
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 09:51:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB5E56E150;
	Tue, 12 Jan 2021 08:51:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50CD56E150
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 08:51:21 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id r4so1272064wmh.5
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 00:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=CHrgvduLuh/y/Trjb8YLZG+qg2yslFRY2p0fMBK0jm4=;
 b=eCl9ZJM+C8oDSXjkxJkWbiZpT3uKmCpLayfW8Tis8IeB2ZwOHntGGgMF6ExqNCGTYB
 hHwbsOyxGR4w+INrs7yjUNo8womY8EMGIAbO8L1O/f5rgxNrIE1ck6k35+s85gDa/mL4
 JfGlmVTQNclSIAE3hCMbsuVfGiQZSpcI50N2WJHk+mipvkLSdEPa2t9jSOi2CwDVqC7V
 zV1THkv7saROODY31G3Fk/ER51c84r2RonlsAjvimLf6VN/mh7GUBLvD/5wyxifODYWn
 Vnu2NPWHb5COXaDv63aR9EF5c21hKeiVCy289+Y+nxSW1XDlOBOxk315z86X4zAzoIIe
 pexw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CHrgvduLuh/y/Trjb8YLZG+qg2yslFRY2p0fMBK0jm4=;
 b=UJijZG+123X2GbXfR6mH4bKm8Zh+vkIzB8PaigoxYdREd8I5rUVIW5zqoXYsxcPebC
 9I9E6Jb0/QBbSGZkm6IoetSzlvgtR/JIoRJZ7fW8G26HwJP3E0yHMUgRh+swA8HDgZGP
 +wef+32Y8WF4Ds5rflmOu6pD8cSYv8EsT/Gm/wIaS+Mrk0H4SeMRA8M0yt6agulXl5Ti
 dwxCF9/qsNiLPJ+C6P2+FNX/Tpfbvaha/UGXQibwHDZ4JMXPaxqv2wxxuUQ7wf+aP2tP
 ZHFj+67961j0rDS+L81RhGI0JEDOkEg78xzCUciiVBO7U1N3P8PS9Bf8l6n4HIaLXmh/
 JfBA==
X-Gm-Message-State: AOAM533ufLtZvAcVUINY4MS4Lh65+x4lSl1dXLA+sw6GbHMOk4NhbhvV
 kfH9PjNuYKmI+Hee1GWO/4JVhO/SVRg=
X-Google-Smtp-Source: ABdhPJy7JGMTAgiLi92gfoJvitm9TWEhKcb3Rz885f6cihDoSGBnH3/yNrOvUd0orvufnXt8BDvzsg==
X-Received: by 2002:a1c:a501:: with SMTP id o1mr2476286wme.44.1610441480086;
 Tue, 12 Jan 2021 00:51:20 -0800 (PST)
Received: from gmail.com ([2a01:e35:2fb2:a0d0:3697:f6ff:fe76:2bcd])
 by smtp.gmail.com with ESMTPSA id a13sm3752154wrt.96.2021.01.12.00.51.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 00:51:19 -0800 (PST)
Date: Tue, 12 Jan 2021 09:51:18 +0100
From: Anthoine Bourgeois <anthoine.bourgeois@gmail.com>
To: Chia-I Wu <olvaffe@gmail.com>
Subject: Re: [PATCH] drm/virtio: fix prime export for vram objects
Message-ID: <20210112085118.GB59439@gmail.com>
References: <20210107210743.269885-1-olvaffe@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210107210743.269885-1-olvaffe@gmail.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 07, 2021 at 01:07:43PM -0800, Chia-I Wu wrote:
>commit 16845c5d5409 ("drm/virtio: implement blob resources: implement
>vram object") and commit c6069a02fa55 ("drm/virtgpu: Set PRIME export
>function in struct drm_gem_object_funcs") landed from different trees,
>resulting in prime export never working for vram objects.
>
>Cc: Gurchetan Singh <gurchetansingh@chromium.org>
>Cc: Thomas Zimmermann <tzimmermann@suse.de>
>Cc: Gerd Hoffmann <kraxel@redhat.com>
>Signed-off-by: Chia-I Wu <olvaffe@gmail.com>

Reviewed-by: Anthoine Bourgeois <anthoine.bourgeois@gmail.com>

>---
> drivers/gpu/drm/virtio/virtgpu_vram.c | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/drivers/gpu/drm/virtio/virtgpu_vram.c b/drivers/gpu/drm/virtio/virtgpu_vram.c
>index d6f215c4ff8d..5cc34e7330fa 100644
>--- a/drivers/gpu/drm/virtio/virtgpu_vram.c
>+++ b/drivers/gpu/drm/virtio/virtgpu_vram.c
>@@ -69,6 +69,7 @@ static const struct drm_gem_object_funcs virtio_gpu_vram_funcs = {
> 	.close = virtio_gpu_gem_object_close,
> 	.free = virtio_gpu_vram_free,
> 	.mmap = virtio_gpu_vram_mmap,
>+	.export = virtgpu_gem_prime_export,
> };
>
> bool virtio_gpu_is_vram(struct virtio_gpu_object *bo)
>-- 
>2.29.2.729.g45daf8777d-goog
>
>_______________________________________________
>dri-devel mailing list
>dri-devel@lists.freedesktop.org
>https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
