Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D5D204B8C
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jun 2020 09:48:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC6FE6E958;
	Tue, 23 Jun 2020 07:48:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97F956E391
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jun 2020 01:31:39 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id q8so17399007qkm.12
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 18:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eHCbxa4yLLq+0pOhVBKweZwAtR1jWaAM46jnceQkpwE=;
 b=lzk/L5n62mkf/Wo6a6zH8O6wr3Zw88adM8VMgiuL8jPiS//Hx1thymfjN6+oEGvYz3
 3bAJFxPc+ArHIAW7wLZuNUJaKeeSdo4HxIYoAC6F64avprFgnqqC7pbUc4IFCsjrKAHh
 gKgi9bb6RSIig4GQna3l0IIkjp+zf3Z+VI2pY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eHCbxa4yLLq+0pOhVBKweZwAtR1jWaAM46jnceQkpwE=;
 b=JqYuIg9dHsKxwUxfF8IEGC79DjY3UP4efDeg573ZhVaPL4pE+k8NGJP9tSVn1ovZxS
 RnlgpWzubqIwyh5J6RE0fOiWCwsSOkRlfgezGBPruS/gjmgHKjwXAWS+1UkFnnsahF7f
 3cieryiE2e9nEhW1k5d+WD2jd9sdtrahFtm8K0ZGF2H1XHWgS5U7YLPSvAjOAm1qVCL5
 Ia1HeAdLKGHopB3YzAHOHqZ4Z+tCbyu2tVyQ914/ZOZ+sbzfmU3ghrQHoP7PdWHTwB0V
 QuAkvyrnBY8pUpev+W76cmm2Qcy3teGhOMF9hU0ZbA0zNDwZOGOydd/vYglOw6pcCjOt
 R/Yw==
X-Gm-Message-State: AOAM531hah53McCm2/U5bCJ2paYs5IBcFv7r2DAxsxwyKuV/JSy63+nI
 ry0LrbI7u6CzQ4Y555OaEOIN2sKSmZRpfwEoQiSzkw==
X-Google-Smtp-Source: ABdhPJwMJlxh1gtY97I2kVKm9OIAts8GWq+RuGfGOUmzRWY4SAjkUqzw8u1O4Yn7AgYcPbJZ0Vsm0B2frMtXAAEZyiE=
X-Received: by 2002:a05:620a:40c1:: with SMTP id
 g1mr12395512qko.391.1592875898709; 
 Mon, 22 Jun 2020 18:31:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200609012518.198908-1-stevensd@chromium.org>
 <20200609055021-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200609055021-mutt-send-email-mst@kernel.org>
From: David Stevens <stevensd@chromium.org>
Date: Tue, 23 Jun 2020 10:31:28 +0900
Message-ID: <CAD=HUj7wJfoKj_K44Cs9eEmh=OQHZ1+qz7ZHxoscHjYgOMXvZQ@mail.gmail.com>
Subject: Re: [virtio-dev] Re: [PATCH v5 0/3] Support virtio cross-device
 resources
To: "Michael S. Tsirkin" <mst@redhat.com>
X-Mailman-Approved-At: Tue, 23 Jun 2020 07:48:47 +0000
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
 virtio-dev@lists.oasis-open.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Jason Wang <jasowang@redhat.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 alex.williamson@redhat.com, Gerd Hoffmann <kraxel@redhat.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Unless there are any remaining objections to these patches, what are
the next steps towards getting these merged? Sorry, I'm not familiar
with the workflow for contributing patches to Linux.

Thanks,
David

On Tue, Jun 9, 2020 at 6:53 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Tue, Jun 09, 2020 at 10:25:15AM +0900, David Stevens wrote:
> > This patchset implements the current proposal for virtio cross-device
> > resource sharing [1]. It will be used to import virtio resources into
> > the virtio-video driver currently under discussion [2]. The patch
> > under consideration to add support in the virtio-video driver is [3].
> > It uses the APIs from v3 of this series, but the changes to update it
> > are relatively minor.
> >
> > This patchset adds a new flavor of dma-bufs that supports querying the
> > underlying virtio object UUID, as well as adding support for exporting
> > resources from virtgpu.
>
> Gerd, David, if possible, please test this in configuration with
> virtual VTD enabled but with iommu_platform=off
> to make sure we didn't break this config.
>
>
> Besides that, for virtio parts:
>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>
>
> > [1] https://markmail.org/thread/2ypjt5cfeu3m6lxu
> > [2] https://markmail.org/thread/p5d3k566srtdtute
> > [3] https://markmail.org/thread/j4xlqaaim266qpks
> >
> > v4 -> v5 changes:
> >  - Remove virtio_dma_buf_export_info.
> >
> > David Stevens (3):
> >   virtio: add dma-buf support for exported objects
> >   virtio-gpu: add VIRTIO_GPU_F_RESOURCE_UUID feature
> >   drm/virtio: Support virtgpu exported resources
> >
> >  drivers/gpu/drm/virtio/virtgpu_drv.c   |  3 +
> >  drivers/gpu/drm/virtio/virtgpu_drv.h   | 20 ++++++
> >  drivers/gpu/drm/virtio/virtgpu_kms.c   |  4 ++
> >  drivers/gpu/drm/virtio/virtgpu_prime.c | 96 +++++++++++++++++++++++++-
> >  drivers/gpu/drm/virtio/virtgpu_vq.c    | 55 +++++++++++++++
> >  drivers/virtio/Makefile                |  2 +-
> >  drivers/virtio/virtio.c                |  6 ++
> >  drivers/virtio/virtio_dma_buf.c        | 82 ++++++++++++++++++++++
> >  include/linux/virtio.h                 |  1 +
> >  include/linux/virtio_dma_buf.h         | 37 ++++++++++
> >  include/uapi/linux/virtio_gpu.h        | 19 +++++
> >  11 files changed, 321 insertions(+), 4 deletions(-)
> >  create mode 100644 drivers/virtio/virtio_dma_buf.c
> >  create mode 100644 include/linux/virtio_dma_buf.h
> >
> > --
> > 2.27.0.278.ge193c7cf3a9-goog
>
>
> ---------------------------------------------------------------------
> To unsubscribe, e-mail: virtio-dev-unsubscribe@lists.oasis-open.org
> For additional commands, e-mail: virtio-dev-help@lists.oasis-open.org
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
