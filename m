Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3441F3751
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 11:53:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E50F26E04E;
	Tue,  9 Jun 2020 09:53:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D69966E04E
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 09:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591696394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oMvGLtRSljs2Zi0kyxH/VTEK52jN8HKOE/cbjLGX1jw=;
 b=Hvmov3eTQsuJf+60AnjStn1j0WCfLaGp5JO1klR5ap1FISeHHsz0TrJ8WPkA7FB1ekSWD9
 weD2aLJ7c3yrPcs5I+bjrweqgsyDpjrDDl95YzNISq64aB2KNtutJ343yLmhK1VJw9b1+3
 CcNDVbCys6WCNE5j+cl4zR7WlUa+TnA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-rGdFNBRlNEqRB_9PkESWVQ-1; Tue, 09 Jun 2020 05:53:03 -0400
X-MC-Unique: rGdFNBRlNEqRB_9PkESWVQ-1
Received: by mail-wr1-f70.google.com with SMTP id m14so8379880wrj.12
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jun 2020 02:53:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oMvGLtRSljs2Zi0kyxH/VTEK52jN8HKOE/cbjLGX1jw=;
 b=ppxuIdrRH63T/hGp+o9kyrDjBKEHQu5RLPp9bMd1kcZJJoBPaMazicG/oYHek0yZ1G
 sYO4WElX8kvZtJNkNm69yyh4SEJsL+QWYyt7RcWZfrcrUs772Kbw+lfdvptgugeoqtam
 SbILNt3P2sug5NJ9sQE0DAB3Iiuy6fg1uz5MkJXmXRrkgrvPff1FhqUk2RZzJ9d1lFkv
 jv8eysYI9OD6C3Pjf6k0yt71V/57j2l8HgwY2N3MiiV9YPxY8KZHBxr5TJVzH2lI74qJ
 ab9CrYPN9EXR+WNx/zPyfh5XhOMF1K2bt7vuQmVb3ZURjgdn+WxImBVZHdJpsCQLIAwk
 4Gdg==
X-Gm-Message-State: AOAM530Ekq+VH2mKEb1n9uz/Wti1GqwrH14zSSq5KNCQzapHkbYqq3pv
 in4w18yhAYAqQ1ro9dy43h3oIyyH03isuKYwdwVhibJjPLV8SyWfFJkuj9L+Nh0wRNJuH2NpQKn
 R86rzNn5iikdcV2lIofoK1R6RABD/
X-Received: by 2002:a5d:6b8c:: with SMTP id n12mr3491095wrx.61.1591696382275; 
 Tue, 09 Jun 2020 02:53:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTG/Rft+RF7BlhKs9JeSNR5jpou7mamttZASGBrZIBust8+KQxMGXJalHNlqYd1izJlcOHBg==
X-Received: by 2002:a5d:6b8c:: with SMTP id n12mr3491075wrx.61.1591696382101; 
 Tue, 09 Jun 2020 02:53:02 -0700 (PDT)
Received: from redhat.com (bzq-79-181-55-232.red.bezeqint.net. [79.181.55.232])
 by smtp.gmail.com with ESMTPSA id 67sm2834452wrk.49.2020.06.09.02.52.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 02:53:01 -0700 (PDT)
Date: Tue, 9 Jun 2020 05:52:58 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v5 0/3] Support virtio cross-device resources
Message-ID: <20200609055021-mutt-send-email-mst@kernel.org>
References: <20200609012518.198908-1-stevensd@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20200609012518.198908-1-stevensd@chromium.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
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
Cc: dri-devel@lists.freedesktop.org, virtio-dev@lists.oasis-open.org,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linaro-mm-sig@lists.linaro.org,
 alex.williamson@redhat.com, Gerd Hoffmann <kraxel@redhat.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 09, 2020 at 10:25:15AM +0900, David Stevens wrote:
> This patchset implements the current proposal for virtio cross-device
> resource sharing [1]. It will be used to import virtio resources into
> the virtio-video driver currently under discussion [2]. The patch
> under consideration to add support in the virtio-video driver is [3].
> It uses the APIs from v3 of this series, but the changes to update it
> are relatively minor.
> 
> This patchset adds a new flavor of dma-bufs that supports querying the
> underlying virtio object UUID, as well as adding support for exporting
> resources from virtgpu.

Gerd, David, if possible, please test this in configuration with
virtual VTD enabled but with iommu_platform=off
to make sure we didn't break this config.


Besides that, for virtio parts:

Acked-by: Michael S. Tsirkin <mst@redhat.com>


> [1] https://markmail.org/thread/2ypjt5cfeu3m6lxu
> [2] https://markmail.org/thread/p5d3k566srtdtute
> [3] https://markmail.org/thread/j4xlqaaim266qpks
> 
> v4 -> v5 changes:
>  - Remove virtio_dma_buf_export_info.
> 
> David Stevens (3):
>   virtio: add dma-buf support for exported objects
>   virtio-gpu: add VIRTIO_GPU_F_RESOURCE_UUID feature
>   drm/virtio: Support virtgpu exported resources
> 
>  drivers/gpu/drm/virtio/virtgpu_drv.c   |  3 +
>  drivers/gpu/drm/virtio/virtgpu_drv.h   | 20 ++++++
>  drivers/gpu/drm/virtio/virtgpu_kms.c   |  4 ++
>  drivers/gpu/drm/virtio/virtgpu_prime.c | 96 +++++++++++++++++++++++++-
>  drivers/gpu/drm/virtio/virtgpu_vq.c    | 55 +++++++++++++++
>  drivers/virtio/Makefile                |  2 +-
>  drivers/virtio/virtio.c                |  6 ++
>  drivers/virtio/virtio_dma_buf.c        | 82 ++++++++++++++++++++++
>  include/linux/virtio.h                 |  1 +
>  include/linux/virtio_dma_buf.h         | 37 ++++++++++
>  include/uapi/linux/virtio_gpu.h        | 19 +++++
>  11 files changed, 321 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/virtio/virtio_dma_buf.c
>  create mode 100644 include/linux/virtio_dma_buf.h
> 
> -- 
> 2.27.0.278.ge193c7cf3a9-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
