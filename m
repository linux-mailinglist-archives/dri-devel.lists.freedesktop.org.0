Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24ACD1D464E
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 08:54:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 017E86EBFB;
	Fri, 15 May 2020 06:53:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C3206EADF
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 08:19:52 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id p12so2119166qtn.13
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 01:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nV+pjnxNzhUaIVaL0d+Q+czgaVh94PJJNBtyQf89HuA=;
 b=bwqQu7dsz6fMq5SL+sSD61OzDG6vFt+sG+Dtmn2KHQEXyvruCjQJRVMO0rcUkWbR4U
 3sBG2XIUE/tDcJxqlcxCKRZwVtTGXiqQqrz1W1j1VCo+pamFrLGrbNEVowY6fZeWz3dF
 lP8o4i0KqfUWhOHYFoa1pol4Wf7ScVyeR1jFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nV+pjnxNzhUaIVaL0d+Q+czgaVh94PJJNBtyQf89HuA=;
 b=HMX/+YGXbvobkuAoX5Joox6iciSGVQvm455iqehgHwgmjOj5QteRn4QMCD9WW6Ul8m
 RXpFLiulqJ23I/+CVfTvMTy03AKjyLRpuMqcpx2UlntzOvgSLr8zDoAKqAHCtYq3Rccf
 VDTcOKtHqynRTWJFeaI+R+RIjwMZX06qFLxr80StHJS5kshDf9qrVrqKtPd8HuUFfLY9
 gDG/2srTxjE0TrogbtEMhPqhqfY/xF+/phD0DhJ2LfCZuanwrwt/HlIhfCdZ2O4pJFbt
 9ErGiT1o4THItCV0N/dvuukBvqI8Lru+tiFF5YrQyl51/HWSXi3pKpoWLX091ZWMERF2
 8AxQ==
X-Gm-Message-State: AOAM533s7SJAj2XsBnLA8iHGoeCHFMEpLeAkmOF5WxvenSAxhA2+qP7s
 YUjO6iqTpx+xeq+WYC77gGTFwyqpD7n8OW9C10CyGQ==
X-Google-Smtp-Source: ABdhPJy6BMxSQgw3762kK+QUyfrMZlOFJwduKjgq+7fX+Y9LnDP2guRYrUbaIterDx66ZYtt4hHEjjuKFL7NsBC5yw0=
X-Received: by 2002:aed:24a6:: with SMTP id t35mr3208654qtc.72.1589444391477; 
 Thu, 14 May 2020 01:19:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200311112004.47138-1-stevensd@chromium.org>
 <20200311112004.47138-2-stevensd@chromium.org>
 <CAKMK7uHFgiHLe9oiFBr-VR-6rU9-hLTpBTEVNh0ezyj54u70jw@mail.gmail.com>
In-Reply-To: <CAKMK7uHFgiHLe9oiFBr-VR-6rU9-hLTpBTEVNh0ezyj54u70jw@mail.gmail.com>
From: David Stevens <stevensd@chromium.org>
Date: Thu, 14 May 2020 17:19:40 +0900
Message-ID: <CAD=HUj6k-y1=64zY8ZFOQBZ7WSUWiQfvkiTpXXt10JB_CGqk1A@mail.gmail.com>
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

Sorry for the duplicate reply, didn't notice this until now.

> Just storing
> the uuid should be doable (assuming this doesn't change during the
> lifetime of the buffer), so no need for a callback.

Directly storing the uuid doesn't work that well because of
synchronization issues. The uuid needs to be shared between multiple
virtio devices with independent command streams, so to prevent races
between importing and exporting, the exporting driver can't share the
uuid with other drivers until it knows that the device has finished
registering the uuid. That requires a round trip to and then back from
the device. Using a callback allows the latency from that round trip
registration to be hidden.

-David
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
