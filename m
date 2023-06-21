Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE73E738FFD
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 21:24:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A19610E34F;
	Wed, 21 Jun 2023 19:24:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5679110E352
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 19:24:28 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id
 5614622812f47-3a04e5baffcso586475b6e.3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 12:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1687375467; x=1689967467;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3U/QVAcqafkSNVhY1lWQzZCl4SRVhE5bPBjfKlpQ8Pk=;
 b=ohqyLjyj3sePxyXy1PsG7sE32dVzhextzF1VCRFgF9hi6WmLhRM7JxacUR2oArMILn
 1UNZ8ufLZ2uyUoKHdIFxhhl7j1sSfdvAEtccccgKimWbvfdZQbtrLMZKcrP3gAd/nlO+
 zPVVB+cKijH3DYkEDWnsyCSXyNF9iRj0L2lubKyMyr8b6vfTQCm7/mkQlixLPe8S2B5V
 ey3Ahmo9UeqQi4c42wQyFTPhSKbf26RzGbX3Nr8GZnIYDcC4iG8zv1FLFK9y7vsboLbo
 drN5YjmK6Kkgo+1tsNrD5QYgDaOCzq85c0qOA+PVBpocfAtG6jvvCyI4Fe1Jk4erzZL5
 2x0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687375467; x=1689967467;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3U/QVAcqafkSNVhY1lWQzZCl4SRVhE5bPBjfKlpQ8Pk=;
 b=OTAEmCXupjWjRzcVVCSkO7JqgHt0lnehIncvdmZYS10q/KSUaIsqeMzo4UP4xzoald
 n97cEaozwIRvRJvVkJyOlrruKphuJftGSPZt/wGxVsclGby9OLSYCtF2HSG+ZpTMACL2
 lMiqv9Vvbk0miFGDGAUdy8JGiC5z41oOW1prHkDXyl1jOeIZoovTw/bGGFbpibe2rPD0
 enB52PFJlDbrGz/arfnONTeCcb5Jc+gAHhOeJD7Ws6TMHl46d/jBEYGDz0KaJiIehyBl
 XrWiE5KXqGUMkQZKBsRp85o8D45zEAhbDBUe3NHZufdluElaPusqiIWRNGUH0Cz7mHrr
 GvCg==
X-Gm-Message-State: AC+VfDz/r08G1xP4/O8EPE2wdzM78NZkZxdyCajYV8SOA6yk4bpaSVGG
 PskTI65RGRTjxLDz4mvx1xVLRx3KbrRIZz5p20XyWQ==
X-Google-Smtp-Source: ACHHUZ63c9VKGQPwrxlmnGSKM+PWQK9x+DysUQbbBYaDfelOmNODcRzkOZdsEmMV5VhtSDgSqYOgfcdGJy5fkttcu2g=
X-Received: by 2002:a05:6359:a26:b0:12c:9960:ec1e with SMTP id
 el38-20020a0563590a2600b0012c9960ec1emr10367224rwb.19.1687375466725; Wed, 21
 Jun 2023 12:24:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230529223935.2672495-1-dmitry.osipenko@collabora.com>
 <20230529223935.2672495-3-dmitry.osipenko@collabora.com>
 <CABdmKX2RU2iYyUssBpwS17zA1dfegjzdo4pxp0r8cOCWcY9=kg@mail.gmail.com>
 <106bc72b-9358-de06-6f3f-06fdfa3859cd@collabora.com>
In-Reply-To: <106bc72b-9358-de06-6f3f-06fdfa3859cd@collabora.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 21 Jun 2023 12:24:15 -0700
Message-ID: <CABdmKX0SJvW30PEriUhW9kmKQuhrEHHPiVbyUYPbgYCyh40hFg@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] dma-buf/heaps: Don't assert held reservation lock
 for dma-buf mmapping
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
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
Cc: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 John Stultz <jstultz@google.com>, Gerd Hoffmann <kraxel@redhat.com>,
 kernel@collabora.com, Sumit Semwal <sumit.semwal@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 linux-media@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 intel-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Tomi Valkeinen <tomba@kernel.org>,
 Emil Velikov <emil.l.velikov@gmail.com>, linux-kernel@vger.kernel.org,
 Tomasz Figa <tfiga@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 21, 2023 at 11:16=E2=80=AFAM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> Hi,
>
> On 6/21/23 20:21, T.J. Mercier wrote:
> > On Mon, May 29, 2023 at 3:46=E2=80=AFPM Dmitry Osipenko
> > <dmitry.osipenko@collabora.com> wrote:
> >>
> >> Don't assert held dma-buf reservation lock on memory mapping of export=
ed
> >> buffer.
> >>
> >> We're going to change dma-buf mmap() locking policy such that exporter=
s
> >> will have to handle the lock. The previous locking policy caused deadl=
ock
> >> problem for DRM drivers in a case of self-imported dma-bufs once these
> >> drivers are moved to use reservation lock universally. The problem
> >> solved by moving the lock down to exporters. This patch prepares dma-b=
uf
> >> heaps for the locking policy update.
> >>
> > Hi Dmitry,
> >
> > I see that in patch 6 of this series calls to
> > dma_resv_lock/dma_resv_unlock have been added to the
> > drm_gem_shmem_helper functions and some exporters. But I'm curious why
> > no dma_resv_lock/dma_resv_unlock calls were added to these two dma-buf
> > heap exporters for mmap?
>
> DMA-buf heaps are exporters, drm_gem_shmem_helper is importer. Locking
> rules are different for importers and exporters.
>
> DMA-heaps use own locking, they can be moved to resv lock in the future.
>
> DMA-heaps don't protect internal data in theirs mmap() implementations,
> nothing to protect there.
>
Thanks.
