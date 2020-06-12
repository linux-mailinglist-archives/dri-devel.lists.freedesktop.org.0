Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D80D1F7D3A
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jun 2020 20:55:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 771346E169;
	Fri, 12 Jun 2020 18:55:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2C326E169
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jun 2020 18:55:09 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id i27so12210295ljb.12
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jun 2020 11:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dd5fQxcNz+xLvw9LJ/ThJExbj+jfC4L+qHsACuh71B8=;
 b=Z2PbndIV49qk1Lvig/1M++OvCOzo132HUN96ZDc9Xq23iiGlRP956vBXNbcGGpi3Zy
 z68gcUIDk/7kS098yqTQdoVRdsDMh00sVjGIqyIIGi1MSOuM0OS1Y1rfeBiv8hHHr5kv
 tf/pBKbhSUIPRrt2VWTf7NApN/MGRoOoYvt0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dd5fQxcNz+xLvw9LJ/ThJExbj+jfC4L+qHsACuh71B8=;
 b=Y2Hl1AaDMFgMMGUR1q/u6upqg70ajyBnWmg9W5zGyMf5u2VJ7RTCESEhZ/U1YDQPiv
 kcGJZFJjvH94wKa/75J5BhGWwBXvniIK7cj2Xinkp7miPcilbmd1PM39dpS21uLSR2Tw
 2yJxKKaIaRK1746OAz4ybL6fgKfieSVg13Cn2KW3/TMIvek15ukUZTHrbI5jURkyyNfJ
 bRxEOnFF3ZAwFaMeQ41TsEp0gaSfqHQGzxJSuq/9nWaIdp+KwzQp8tVjcUy7jW/kIKQi
 dHxYdvF7DX3uquYQkslvCaI+Q/m/5mKPLOma4YkkQ8PRlRMIy+xyu/XOhy3OHIxAO1Dp
 epRQ==
X-Gm-Message-State: AOAM530A2XODfcFnN7DbJBOmwAGMzo9VaWUFbDlg7GKyBYijrDRm/OCc
 EiKMX9yd+8DGZGnpJaSxKDZLfa+EXXA=
X-Google-Smtp-Source: ABdhPJxEfp7RlpIMDwO8rw9Pv1NMkNdO7OZp3r5HJA8yD/udGuCdt/p7bMCk+qXJjpzqysyYWHnXog==
X-Received: by 2002:a2e:3a04:: with SMTP id h4mr2827402lja.103.1591988107977; 
 Fri, 12 Jun 2020 11:55:07 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com.
 [209.85.208.173])
 by smtp.gmail.com with ESMTPSA id n20sm2170283lfe.60.2020.06.12.11.55.07
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jun 2020 11:55:07 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id e4so12275637ljn.4
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jun 2020 11:55:07 -0700 (PDT)
X-Received: by 2002:a2e:9ac2:: with SMTP id p2mr8113599ljj.223.1591988106615; 
 Fri, 12 Jun 2020 11:55:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200612013625.547-1-gurchetansingh@chromium.org>
 <b1b26b94-b0a5-6af8-a151-ad6310358708@suse.de>
 <20200612101650.2kp7wvpz5gfv3vyg@sirius.home.kraxel.org>
In-Reply-To: <20200612101650.2kp7wvpz5gfv3vyg@sirius.home.kraxel.org>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Fri, 12 Jun 2020 11:54:54 -0700
X-Gmail-Original-Message-ID: <CAAfnVBn=3_ekqKXoUKMGMHw+VWxL2RK0mJO72vx79RvvUa8cPw@mail.gmail.com>
Message-ID: <CAAfnVBn=3_ekqKXoUKMGMHw+VWxL2RK0mJO72vx79RvvUa8cPw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/shmem: add support for per object dma api
 operations
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 12, 2020 at 3:17 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Fri, Jun 12, 2020 at 11:47:55AM +0200, Thomas Zimmermann wrote:
> > Hi
> >
> > Am 12.06.20 um 03:36 schrieb Gurchetan Singh:
> > > This is useful for the next patch.  Also, should we only unmap the
> > > amount entries that we mapped with the dma-api?
> >
> > It looks like you're moving virtio code into shmem.
>
> Well, not really.
>
> virtio has -- for historical reasons -- the oddity that it may or may
> not need to dma_map resources, depending on device configuration.
> Initially virtio went with "it's just a vm, lets simply operate on
> physical ram addresses".  That shortcut turned out to be a bad idea
> later on, especially with the arrival of iommu emulation support in
> qemu.  But we couldn't just scratch it for backward compatibility
> reasons.  See virtio_has_iommu_quirk().
>
> This just allows to enable/disable dma_map, I guess to fix some fallout
> from recent shmem helper changes

Yes, the main goal is to fix the double free.

diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c
b/drivers/gpu/drm/virtio/virtgpu_object.c
index 346cef5ce251..2f7b6cd25a4b 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -78,7 +78,6 @@ void virtio_gpu_cleanup_object(struct virtio_gpu_object *bo)
                                shmem->mapped = 0;
                        }

-                       sg_free_table(shmem->pages);
                        shmem->pages = NULL;
                        drm_gem_shmem_unpin(&bo->base.base);
                }

Doing only that on it's own causes log spam though

[   10.368385] virtio_gpu virtio5: swiotlb buffer is full (sz: 4096
bytes), total 0 (slots), used 0 (slots)
[   10.384957] virtio_gpu virtio5: swiotlb buffer is full (sz: 4096
bytes), total 0 (slots), used 0 (slots)
[   10.389920] virtio_gpu virtio5: swiotlb buffer is full (sz: 4096
bytes), total 0 (slots), used 0 (slots)
[   10.396859] virtio_gpu virtio5: swiotlb buffer is full (sz: 4096
bytes), total 0 (slots), used 0 (slots)
[   10.401954] virtio_gpu virtio5: swiotlb buffer is full (sz: 4096
bytes), total 0 (slots), used 0 (slots)
[   10.406694] virtio_gpu virtio5: swiotlb buffer is full (sz: 8192
bytes), total 0 (slots), used 0 (slots)
[   10.495744] virtio_gpu virtio5: swiotlb buffer is full (sz: 4096
bytes), total 0 (slots), used 0 (slots)

Plus, I just realized the virtio dma ops and ops used by drm shmem are
different, so virtio would have to unconditionally have to skip the
shmem path.  Perhaps the best policy is to revert d323bb44e4d2?

> (Gurchetan, that kind of stuff should
> be mentioned in cover letter and commit messages).

Good tip.

>
> I'm not sure virtio actually needs that patch though.  I *think* doing
> the dma_map+dma_unmap unconditionally, but then ignore the result in
> case we don't need it should work.  And it shouldn't be a horrible
> performance hit either, in case we don't have a (virtual) iommu in the
> VM dma mapping is essentially a nop ...
>
> take care,
>   Gerd
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
