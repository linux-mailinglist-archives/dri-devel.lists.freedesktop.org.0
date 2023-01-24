Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5F6678F6E
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 05:45:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18B9C10E22F;
	Tue, 24 Jan 2023 04:45:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FF5E10E22F
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 04:45:55 +0000 (UTC)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-4d59d518505so202369177b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 20:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vpDuDoUmAharZ6gl8wrxfOGmWcIqGpZbtAgCtCtKKLE=;
 b=Tvm51t9nJyP5NJhhaS/ZGI0R/NlPYvz5bpxgJfthc8I6LZbmT3ZTAU6Js9JosvVmNH
 C0PKQYWKkkaGDJNQZ/v6SVtKE8git3A7oLNETlGr8cpXpDmldcZ5YArR6++7eQ1X1cur
 L9uy07Q/qOMNBp9/SrYYRTMo+1y25L4w6kKCLqzXY3uaKXFcY4HpxV9xU7EnmuyA0j0A
 JDHkQTSJEYsrqAHhFkSWNERYxM5eVX53LgWbNhyxzaJuViBiVE/Y+xRp1/+a03u8+nfW
 cMI2u31cFbxCpNR1QfOdeoTutka9CIu8Oj4CsVENc59YK8AlA9pC00pVmR1uiuKoJnp5
 bxRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vpDuDoUmAharZ6gl8wrxfOGmWcIqGpZbtAgCtCtKKLE=;
 b=aIz0OYqSSG2SRroisD4UTiVcD6rvScFdXUjwRBlAE1h8ieSTliOTxC76fdUpoUHgNe
 CRqj75U6UHxI8mvR9p+6grFK/j2Rv6DGrwCcyYEvAKATagLcViTxthZEMMef+NZtJH9f
 itx1XqjEB0jw+rDv6CTDFhQLG+381yGA8+ckGgku/fpAqbKR5r4nAuWLHVQyHxieQ6MG
 HbbnrxlOF+tnXO9dbljvE9pHMjIToNoI/yn9b9SLAnItehNMxwyf+6uTmJkdZY4bGv2x
 iJdu0uiHfxztKfsNJREIe0zbUFk6gD4mnHRDCZT7mwNLyDk6JV2suwrLgX/Nm9PTIjlY
 dlqg==
X-Gm-Message-State: AFqh2kpq61NsWpJT0SyVSvwhMXDrWL6NGF2ACiRyRoAn5RF3S2SVQc5j
 Hu1nKwBUAF5VFEgNKzS+tMOfKqN1N42KOBzvIiI/
X-Google-Smtp-Source: AMrXdXtWz4zPSzmzj1jg67d48nmLGEWV/YMdXmAzJach/udjMYLSlzxrS/AMfRarkB5p7ok+TfCRWhh2bFqBa/fVwVE=
X-Received: by 2002:a81:9ace:0:b0:4ed:5f50:1a43 with SMTP id
 r197-20020a819ace000000b004ed5f501a43mr3696499ywg.291.1674535554577; Mon, 23
 Jan 2023 20:45:54 -0800 (PST)
MIME-Version: 1.0
References: <20230123123756.401692-1-christian.koenig@amd.com>
 <20230123123756.401692-2-christian.koenig@amd.com>
In-Reply-To: <20230123123756.401692-2-christian.koenig@amd.com>
From: John Stultz <jstultz@google.com>
Date: Mon, 23 Jan 2023 20:45:43 -0800
Message-ID: <CANDhNCoxiX7Lc0qECEQOn3c2gP26ju5zdYuQfoTbPjqpjwebsA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dma-heap: add device link and unlink functions
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linaro-mm-sig@lists.linaro.org, sebastian.wick@redhat.com,
 benjamin.gaignard@collabora.com, linux-media@vger.kernel.org,
 mchehab@kernel.org, ppaalanen@gmail.com, dri-devel@lists.freedesktop.org,
 nicolas@ndufresne.ca, hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
 tfiga@chromium.org, sumit.semwal@linaro.org,
 "T.J. Mercier" <tjmercier@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 23, 2023 at 4:38 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> This allows device drivers to specify a DMA-heap where they want their
> buffers to be allocated from. This information is then exposed as
> sysfs link between the device and the DMA-heap.
>
> Useful for userspace when in need to decide from which provider to
> allocate a buffer.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Hey Christian!
  Thanks so much for sending this out and also thanks for including me
(Adding TJ as well)!

This looks like a really interesting approach, but I have a few thoughts be=
low.

> ---
>  drivers/dma-buf/dma-heap.c | 41 ++++++++++++++++++++++++++++++--------
>  include/linux/dma-heap.h   | 35 ++++++++++++++++++++++++++++++++
>  2 files changed, 68 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> index c9e41e8a9e27..0f7cf713c22f 100644
> --- a/drivers/dma-buf/dma-heap.c
> +++ b/drivers/dma-buf/dma-heap.c
> @@ -31,6 +31,7 @@
>   * @heap_devt          heap device node
>   * @list               list head connecting to list of heaps
>   * @heap_cdev          heap char device
> + * @dev:               heap device in sysfs
>   *
>   * Represents a heap of memory from which buffers can be made.
>   */
> @@ -41,6 +42,7 @@ struct dma_heap {
>         dev_t heap_devt;
>         struct list_head list;
>         struct cdev heap_cdev;
> +       struct device *dev;
>  };
>
>  static LIST_HEAD(heap_list);
> @@ -49,6 +51,33 @@ static dev_t dma_heap_devt;
>  static struct class *dma_heap_class;
>  static DEFINE_XARRAY_ALLOC(dma_heap_minors);
>
> +int dma_heap_create_device_link(struct device *dev, const char *heap)
> +{
> +       struct dma_heap *h;
> +
> +       /* check the name is valid */
> +       mutex_lock(&heap_list_lock);
> +       list_for_each_entry(h, &heap_list, list) {
> +               if (!strcmp(h->name, heap))
> +                       break;
> +       }
> +       mutex_unlock(&heap_list_lock);
> +
> +       if (list_entry_is_head(h, &heap_list, list)) {
> +               pr_err("dma_heap: Link to invalid heap requested %s\n", h=
eap);
> +               return -EINVAL;
> +       }
> +
> +       return sysfs_create_link(&dev->kobj, &h->dev->kobj, DEVNAME);
> +}

So, one concern with this (if I'm reading this right) is it seems like
a single heap link may be insufficient.

There may be multiple heaps that a driver could work with (especially
if the device isn't very constrained), so when sharing a buffer with a
second device that is more constrained we'd have the same problem we
have now where userspace just needs to know which device is the more
constrained one to allocate for.

So it might be useful to have a sysfs "dma_heaps" directory with the
supported heaps linked from there? That way userland could find across
the various devices the heap-link that was common.

This still has the downside that every driver needs to be aware of
every heap, and when new heaps are added, it may take awhile before
folks might be able to assess if a device is compatible or not to
update it, so I suspect we'll have eventually some loose
constraint-based helpers to register links. But I think this at least
moves us in a workable direction, so again, I'm really glad to see you
send this out!

thanks
-john
