Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD3E1D462F
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 08:53:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF88789D9B;
	Fri, 15 May 2020 06:52:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B1186E05A
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 02:09:04 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id z5so980386qvw.4
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 19:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iwY0Acbl9lzYaC/I7H5xpC4oYprSXfs6U4SArioBGuQ=;
 b=P3DlHD88DQf0dE0yDif2sw8Rynd10kLlNJTPW+b9QzdH57TyxXfF5ZNS/0Fw6PFJCG
 QW3kwdavSpCzJ1MTCu5QDGOqFbkR1lWztvohYFPSV6iT0JGQlY5iifKdUt621KTCAsGm
 9eeWjr+VlkkDTRsgo5ySgNBAgv+vYZS8h+BUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iwY0Acbl9lzYaC/I7H5xpC4oYprSXfs6U4SArioBGuQ=;
 b=KaNfOUGGbHxXQCB9q5YizYxe3CbcX2PxQl6TQ0Qco0ykpw9fTDgiSunab6wz0afcFk
 49gJXP67tyfDxWJF8PvKCHuQClqoAz8JGTUmkkJmnkM8Q7EkVIQ0hUqoQ3s+TfutPDx2
 u6MMQ6xXiYv4qxxaVAz4AFRnUpZgIiWXUJA0copv0hEhoPirxolblGp0jzKV6ZXnKx5y
 Df3LLaqzooE+ZsBhHcRpYruOpwU4/fvZxoSA3etPBtd6Esmi6NGg2GDFknlQ1sFStfDK
 rhPatrqX7YdUAdkRmH1Rl/Mv4fWcTCGlsSOSyjJ+fxvlVA2yhy0pxDnd8F9dXrYxuwlb
 iorg==
X-Gm-Message-State: AOAM530sAm20GIf/p8GMY50i1NR8R42zE8TAkZ4kuIVjNvDtM2rpqJ6x
 h9M+gxdYOAFn0KbHFEyr8s5ZusD38lOfH2u2TvWtRg==
X-Google-Smtp-Source: ABdhPJx+twxQTtW8B+vhkz+0GPec5WaIV3J1v01kZlo95nTGu9ZPy4033fzgt5ebh+V0OgPHFEM+9syC1+lXQmTric4=
X-Received: by 2002:a05:6214:506:: with SMTP id
 v6mr2657680qvw.70.1589422143646; 
 Wed, 13 May 2020 19:09:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200311112004.47138-1-stevensd@chromium.org>
 <20200311112004.47138-2-stevensd@chromium.org>
 <CAKMK7uHFgiHLe9oiFBr-VR-6rU9-hLTpBTEVNh0ezyj54u70jw@mail.gmail.com>
In-Reply-To: <CAKMK7uHFgiHLe9oiFBr-VR-6rU9-hLTpBTEVNh0ezyj54u70jw@mail.gmail.com>
From: David Stevens <stevensd@chromium.org>
Date: Thu, 14 May 2020 11:08:52 +0900
Message-ID: <CAD=HUj6d9gdZegTGad6thKdHv5b+qOZnkCv5VcWo9AcHifR9uA@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dma-buf: add support for virtio exported objects
To: Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Approved-At: Fri, 15 May 2020 06:52:55 +0000
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
Cc: virtio-dev@lists.oasis-open.org,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Jason Wang <jasowang@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tomasz Figa <tfiga@chromium.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 "open list:VIRTIO CORE, NET..." <virtualization@lists.linux-foundation.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 14, 2020 at 12:45 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> On Wed, Mar 11, 2020 at 12:20 PM David Stevens <stevensd@chromium.org> wrote:
> >
> > This change adds a new dma-buf operation that allows dma-bufs to be used
> > by virtio drivers to share exported objects. The new operation allows
> > the importing driver to query the exporting driver for the UUID which
> > identifies the underlying exported object.
> >
> > Signed-off-by: David Stevens <stevensd@chromium.org>
>
> Adding Tomasz Figa, I've discussed this with him at elce last year I
> think. Just to make sure.
>
> Bunch of things:
> - obviously we need the users of this in a few drivers, can't really
> review anything stand-alone

Here is a link to the usage of this feature by the currently under
development virtio-video driver:
https://markmail.org/thread/j4xlqaaim266qpks

> - adding very specific ops to the generic interface is rather awkward,
> eventually everyone wants that and we end up in a mess. I think the
> best solution here would be if we create a struct virtio_dma_buf which
> subclasses dma-buf, add a (hopefully safe) runtime upcasting
> functions, and then a virtio_dma_buf_get_uuid() function. Just storing
> the uuid should be doable (assuming this doesn't change during the
> lifetime of the buffer), so no need for a callback.

So you would prefer a solution similar to the original version of this
patchset? https://markmail.org/message/z7if4u56q5fmaok4
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
