Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D92011A05A
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 02:07:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 404A26E120;
	Wed, 11 Dec 2019 01:06:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DDFF6E120
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 01:06:56 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id y19so15255967lfl.9
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 17:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T3U5Ton5GkI2QD9NYugFaf5BRq2pqUxCkGGQRfb840Q=;
 b=R5p8cM1REpNhwNG/S5JozlDrfWJgObKwfHJFLWfvYis1Ng08mRoAMlI0ycQSAeEcd6
 zeaPJeZGj7VhZvnEdIa+scrFuK0MppI/lpyBTfgIMcgTtliSBQrIhjZP5YFFE3kQCxWM
 fnMjAPdttTJzRAwTscCs7zhgii0RJlQ54lIy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T3U5Ton5GkI2QD9NYugFaf5BRq2pqUxCkGGQRfb840Q=;
 b=jhDUNaZpki4TiBaNba1I9b1uuUnt23Gg0DxuvRIT+qkJT4SsmYk8F+rKnWexabsY8m
 OAv1uKaq0KdDsZJwJiLzEBofQ+P33E3x8VSqEU8GH3b0yJpOocKWeC0hJwIRQ1f2QJgd
 020F28zkCMj7AjcmuV1mBypu8S3sg63zoAsvpCqK1rPhg73xjNehuKiy47v3TJD8ahcD
 sFwoJrWwDUqM0FGE80ET51o8Y5RzEtNxcwfv6NjQQUMtQIbpwPBEcVTRxhAmvPMjGg03
 n1upYZ2FwhRLd/nwUhU+jh9JhZSdbwDAtY5y7YMDpXOsMP6KFHK3nNV3LtRWmLbarGsp
 PDEA==
X-Gm-Message-State: APjAAAWn8F1z4eViDeIIow0bulFDbLWlv49aC7KA+De1H0D9MvSIdHlz
 v52jid44oZ9L0Qi1XlqZdqQ0Qt2UxVk=
X-Google-Smtp-Source: APXvYqyL4lF992z6P33IfWmdZ12tPlvuuJDdpzA8oADNDgQSL2j4embIzkCMxBTIlW8OQpwO0GOilQ==
X-Received: by 2002:a19:4208:: with SMTP id p8mr443511lfa.160.1576026414553;
 Tue, 10 Dec 2019 17:06:54 -0800 (PST)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com.
 [209.85.167.46])
 by smtp.gmail.com with ESMTPSA id a12sm102003ljk.48.2019.12.10.17.06.53
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2019 17:06:54 -0800 (PST)
Received: by mail-lf1-f46.google.com with SMTP id i23so2834944lfo.7
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 17:06:53 -0800 (PST)
X-Received: by 2002:a05:6512:1dd:: with SMTP id
 f29mr478455lfp.106.1576026413534; 
 Tue, 10 Dec 2019 17:06:53 -0800 (PST)
MIME-Version: 1.0
References: <20191210085759.14763-1-kraxel@redhat.com>
In-Reply-To: <20191210085759.14763-1-kraxel@redhat.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Tue, 10 Dec 2019 17:06:42 -0800
X-Gmail-Original-Message-ID: <CAAfnVB=prUDgkPjZdB9QcA9XHdcBCQSPcf4mBL75LG8QJ4D=0Q@mail.gmail.com>
Message-ID: <CAAfnVB=prUDgkPjZdB9QcA9XHdcBCQSPcf4mBL75LG8QJ4D=0Q@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: fix mmap page attributes
To: Gerd Hoffmann <kraxel@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 10, 2019 at 12:58 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> virtio-gpu uses cached mappings.  shmem helpers use writecombine though.
> So roll our own mmap function, wrapping drm_gem_shmem_mmap(), to tweak
> vm_page_prot accordingly.
>
> Reported-by: Gurchetan Singh <gurchetansingh@chromium.org>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_object.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
> index 017a9e0fc3bb..158610902054 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_object.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_object.c
> @@ -75,6 +75,22 @@ static void virtio_gpu_free_object(struct drm_gem_object *obj)
>         drm_gem_shmem_free_object(obj);
>  }
>
> +static int virtio_gpu_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
> +{
> +       pgprot_t prot;
> +       int ret;
> +
> +       ret = drm_gem_shmem_mmap(obj, vma);
> +       if (ret < 0)
> +               return ret;
> +
> +       /* virtio-gpu needs normal caching, so clear writecombine */
> +       prot = vm_get_page_prot(vma->vm_flags);
> +       prot = pgprot_decrypted(prot);
> +       vma->vm_page_prot = prot;
> +       return 0;
> +}
> +
>  static const struct drm_gem_object_funcs virtio_gpu_gem_funcs = {
>         .free = virtio_gpu_free_object,
>         .open = virtio_gpu_gem_object_open,
> @@ -86,7 +102,7 @@ static const struct drm_gem_object_funcs virtio_gpu_gem_funcs = {
>         .get_sg_table = drm_gem_shmem_get_sg_table,
>         .vmap = drm_gem_shmem_vmap,

Do we need vmap/vmunap?  It seems optionable and also uses non-cacheable memory?

>         .vunmap = drm_gem_shmem_vunmap,
> -       .mmap = &drm_gem_shmem_mmap,
> +       .mmap = &virtio_gpu_gem_mmap,

Why the &virtio_gpu_gem_mmap?  Shouldn't just virtio_gpu_gem_mmap work?



>  };
>
>  struct drm_gem_object *virtio_gpu_create_object(struct drm_device *dev,
> --
> 2.18.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
