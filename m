Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 635AC15F709
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 20:44:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E1DE6E867;
	Fri, 14 Feb 2020 19:44:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 082456E867
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 19:44:17 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id h8so11814840iob.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 11:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9656NPJQCAi/7N6pZg/qHCUnoXKXecyLMkbc+C8RBsk=;
 b=vh5RzW0RMZzPmVBAXmrhON3+Fao+48JLks/ddd6LbGztSRA9hrahsdqi+6SguBXZbN
 BA1MRz9hdnvTZCzlLlFp75VGGN7ud+nyEt5bvRVEYG9OIPK6D56+E23lsAzatLiI7qIA
 l+plOZQebLJqa8HWhAgzr31UJfcVl/QmtN8Wu0P4sEKLwAZ6KarC3Yt+4062pJFPOwHC
 EZjenKjnAqwS4CpNcUBhYvNtx2UX0O/0bL0cfcSTOdHQeVyI8CdxP/89kT36Dd5cXHo5
 8H95Np3jmB2Uz3sDyhY/dlNZ9yTi9ECbWbHtICdgPTGTIOi5vHrfRrux9lEHcYrET/Lu
 WcwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9656NPJQCAi/7N6pZg/qHCUnoXKXecyLMkbc+C8RBsk=;
 b=hTkSBnnVd9jG/DoQeNZjbx8k1aG+He38EduMG/WlKu8ACzH1lonXn2AgED+82XS6SM
 z2AKq+xZ6SvOBSCS/rvoTx6yzwuJvpb/xr0xMQkiAkwUrx68T3AGAA5Frzg8RiDoPU1+
 f8lJ2b/mKW6+9AIGDIl9XGWnYIJWQACFd6jjMx2Dg2Y4eeWI0+bS/y6Vngj3eAksasFc
 QgfqSLxPxq5Eyfl0nvBqmk7RIBJb58ToGWlsIbHWK2+du9sl3+85ILo0QQvEjMGVKy4S
 1zkiQ5RwT7QUzVg3Gwez5qffJge2tGVs286hvwSRDXdVUMnxc1VJUdOFyBOrFqYWPSvx
 NCaA==
X-Gm-Message-State: APjAAAUvuRztc/7ZzcF0QpsMPXXbUChEJzajFDXsEJSz0sR2/k/NkYXy
 qVSK6rZ6RW9BZwuvcCn4VYbWYPJ/Tra+XMVrmM0=
X-Google-Smtp-Source: APXvYqxR+yixSxvwuxeLeRQ8K20ml8M9nmSbABrFam2F+B8rmhxWTubUUKPzfnfUmSH9kU60jd34OL1dUfIKRRP3qYA=
X-Received: by 2002:a02:9f06:: with SMTP id z6mr3769717jal.2.1581709455037;
 Fri, 14 Feb 2020 11:44:15 -0800 (PST)
MIME-Version: 1.0
References: <20200214125535.26349-1-kraxel@redhat.com>
In-Reply-To: <20200214125535.26349-1-kraxel@redhat.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Fri, 14 Feb 2020 11:44:04 -0800
Message-ID: <CAPaKu7RkB8W2n+G_+vwKQuYkKF6vrwQfaiE_SHn-PccTJcfg0w@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] drm/virtio: rework batching
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Series is

Reviewed-by: Chia-I Wu <olvaffe@gmail.com>

Thanks!

On Fri, Feb 14, 2020 at 4:55 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> v4:
>  - add patches #2 + #6.
> v3:
>  - split into multiple patches.
>
> Gerd Hoffmann (6):
>   drm/virtio: rework notification for better batching
>   drm/virtio: notify before waiting
>   drm/virtio: batch plane updates (pageflip)
>   drm/virtio: batch resource creation
>   drm/virtio: batch display query
>   drm/virtio: move remaining virtio_gpu_notify calls
>
>  drivers/gpu/drm/virtio/virtgpu_drv.h     |  6 ++---
>  drivers/gpu/drm/virtio/virtgpu_display.c |  2 ++
>  drivers/gpu/drm/virtio/virtgpu_gem.c     |  2 ++
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c   |  4 +++
>  drivers/gpu/drm/virtio/virtgpu_kms.c     |  5 ++++
>  drivers/gpu/drm/virtio/virtgpu_object.c  |  2 ++
>  drivers/gpu/drm/virtio/virtgpu_plane.c   |  7 +++--
>  drivers/gpu/drm/virtio/virtgpu_vq.c      | 33 ++++++++++--------------
>  8 files changed, 34 insertions(+), 27 deletions(-)
>
> --
> 2.18.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
