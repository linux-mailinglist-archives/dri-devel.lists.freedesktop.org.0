Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D211D602B
	for <lists+dri-devel@lfdr.de>; Sat, 16 May 2020 11:59:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 047276E1BC;
	Sat, 16 May 2020 09:59:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E70D6EBFA
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 07:26:28 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id z9so599210qvi.12
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 00:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yQ+8bQqVXCGgiMZpHhx8CRsJZ+7vvYouTuTdyPbncmE=;
 b=QDWBz3RUFZANTCfesmQRxLfudLR6lDXvkwQiP0JZK/Zi3SINJJlPUbU6EqOQgQFhj3
 jneZ5wcaAmgNP6xRm91oVntIzCcCm4+IDgxkpG7k2AMTSmKapOyCRKa6SzRWtAkIlknt
 3Vjoy1l/UAQSqOIQpSYl083UGeHjb01hQBypU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yQ+8bQqVXCGgiMZpHhx8CRsJZ+7vvYouTuTdyPbncmE=;
 b=oUJ2ykpmClMQqGUml795bjHtggopolOH/eddc1s2yViQck6YN7PLNd1XY6LgmKnTEw
 J1QOKgCLzc2aiSoAkkWnTlnrZkFE1SOrpa+tNqIALlOe6QKToMielVJmY4dOU9/cy2kz
 WiyAni3ctH/BghG1B5cMwFjiG4IzUbWi1eKRKTT7kubYpLatc5wfaME+b/nz2xng36+M
 +1yIbyamHmMmTUriob3bAg9xGfcSOMe5BMwc8bNjxtT+z5mOZ5Anokt4QlIdLNmluCQ3
 90sIswujCOY9Xd9ed5VrSv0DO2NeYr9IMnsAVSNQb1hEJFNGx0lyoVcsw0VuoiMZsL87
 /Fxg==
X-Gm-Message-State: AOAM532tlDc+YQ4xMlQsboembr/ZiArmD0ChuqPTu1nKgal3cJzWMnlm
 6DJ0ra/PNM9VY6AwAIWOy4kc8TWFJe68+/pUnlcUeg==
X-Google-Smtp-Source: ABdhPJx1EFKHl7a6Wvqqoe4z/fgmS4Q3vrumNb01ocuJbWu2dJGymSisslGXpi2Jk+BTqytlgb0JT5aqQU+B+OWZaAw=
X-Received: by 2002:ad4:580b:: with SMTP id dd11mr2192873qvb.145.1589527587111; 
 Fri, 15 May 2020 00:26:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200311112004.47138-1-stevensd@chromium.org>
 <20200311112004.47138-5-stevensd@chromium.org>
 <20200513123326-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200513123326-mutt-send-email-mst@kernel.org>
From: David Stevens <stevensd@chromium.org>
Date: Fri, 15 May 2020 16:26:15 +0900
Message-ID: <CAD=HUj5qcMLw__LfJizR6nzCR9Qmu21Sjk3i0j_8+=rxt1Hk=w@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] drm/virtio: Support virtgpu exported resources
To: "Michael S. Tsirkin" <mst@redhat.com>
X-Mailman-Approved-At: Sat, 16 May 2020 09:58:59 +0000
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

> > +     if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_RESOURCE_UUID)) {
> > +             vgdev->has_resource_assign_uuid = true;
> > +     }
>
>
> Just a question: this relies on DMA bufs so I assume it is
> not really assumed to work when DMA API is bypassed, right?
> Rather than worry what does it mean, how about just
> disabling  this feature without PLATFORM_DMA for now?

By PLATFORM_DMA, do you mean CONFIG_DMA_SHARED_BUFFER? Virtio-gpu
depends on DRM, which selects that feature. So I think DMA bufs should
always be available when virtio-gpu is present.

-David
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
