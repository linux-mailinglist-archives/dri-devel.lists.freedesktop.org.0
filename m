Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA181F34EF
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 09:35:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47B306E262;
	Tue,  9 Jun 2020 07:35:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94CAD6E1F7
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jun 2020 10:37:07 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id y9so8048123qvs.4
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jun 2020 03:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=37datdXl0TF4cHt39unBvjQQpavQ7FoeHgZeTkd6cVo=;
 b=jWuBi3gBOqpp71BpWC1WbZEGMxzH3MTotBqy+CTTW/ii1+t6JbNX14i+Didnl9fYdQ
 Lx0RoE/Q0B9pQPdESBuGWf8PRHudkFPbAcjQedMq516IZ67SaJAww/fKkHBB/Kvfcjck
 9dJZvpSfyrEnPN5YuRX7giecTXFlZnZXkJ1vY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=37datdXl0TF4cHt39unBvjQQpavQ7FoeHgZeTkd6cVo=;
 b=CNOows26l0nq5MmuPttN2XFRyjLKEqdqDTOZiiXPEWL5x6Y2x3ldtPIee6Gazzyf2p
 i8deQBgolHhZiQLM+Zob1OHSeMAF7X8VQaLPmSe3E6Dzipmes0/sY/pHOREPmL+oy322
 k6fF6Acb1gJCg1POtJXDFyphgPpQFilrur+HVj9nWBokihIcknu2owV5lr50qFVbdP5U
 qPSkUMulUUGkwhTSYeCR4OUEmV9hhyaiO9H45m+1ELLKli8ZCIp+Yl1nr5e62GE2jA28
 UYYiQKUoD4530doYvtgU9692HYhlSbNjc3eN8e1YArF9ngpZN0AzNYIJgB8nvnjc/lFS
 6OXQ==
X-Gm-Message-State: AOAM532ZLet/SGaixTpYzF/qU08k0PtBshYAbyn0z1RkNoLGJUWFSgwu
 GIerTH4Ko5WH9aqRb6ljh74q3As5fXI+PFqL/DsWsA==
X-Google-Smtp-Source: ABdhPJx0Js9UlOjOlvsu2+uMuuX1LzgiViihJEZNtsxnEp5BP9jZ39vgEHbdMa7JtxuwcBbI76XV/X/JfEUXZ0ddD1Q=
X-Received: by 2002:a0c:aed6:: with SMTP id n22mr1149105qvd.70.1591612626754; 
 Mon, 08 Jun 2020 03:37:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200311112004.47138-1-stevensd@chromium.org>
 <20200311112004.47138-5-stevensd@chromium.org>
 <20200513123326-mutt-send-email-mst@kernel.org>
 <CAD=HUj5qcMLw__LfJizR6nzCR9Qmu21Sjk3i0j_8+=rxt1Hk=w@mail.gmail.com>
 <20200608054234-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200608054234-mutt-send-email-mst@kernel.org>
From: David Stevens <stevensd@chromium.org>
Date: Mon, 8 Jun 2020 19:36:55 +0900
Message-ID: <CAD=HUj6kF2JFyC9c0CY5_f-cv6r97501Z2f8D9x0VhQpRen+bw@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] drm/virtio: Support virtgpu exported resources
To: "Michael S. Tsirkin" <mst@redhat.com>
X-Mailman-Approved-At: Tue, 09 Jun 2020 07:35:06 +0000
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
 Gerd Hoffmann <kraxel@redhat.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 8, 2020 at 6:43 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Fri, May 15, 2020 at 04:26:15PM +0900, David Stevens wrote:
> > > > +     if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_RESOURCE_UUID)) {
> > > > +             vgdev->has_resource_assign_uuid = true;
> > > > +     }
> > >
> > >
> > > Just a question: this relies on DMA bufs so I assume it is
> > > not really assumed to work when DMA API is bypassed, right?
> > > Rather than worry what does it mean, how about just
> > > disabling  this feature without PLATFORM_DMA for now?
> >
> > By PLATFORM_DMA, do you mean CONFIG_DMA_SHARED_BUFFER?
>
> Sorry, no. I mean VIRTIO_F_IOMMU_PLATFORM which in the
> future will be renamed to VIRTIO_F_PLATFORM_ACCESS.

Shouldn't things work independent of whether or not that feature is
set? If a virtio driver properly uses the dma_buf APIs (which virtgpu
seems to), then that should take care of any mapping/synchronization
related to VIRTIO_F_IOMMU_PLATFORM. If anything, the case where
VIRTIO_F_IOMMU_PLATFORM isn't set is easier, since then we know that
the "the device has same access [sic] to memory addresses supplied to
it as the driver has", according to the specification.

-David
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
