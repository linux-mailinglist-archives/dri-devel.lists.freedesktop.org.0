Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EF7A3380E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 07:42:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFF3810E9FD;
	Thu, 13 Feb 2025 06:42:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="b3dESKbn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com
 [209.85.217.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 327D510E9F5
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 06:42:04 +0000 (UTC)
Received: by mail-vs1-f53.google.com with SMTP id
 ada2fe7eead31-4bbb91481deso133395137.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 22:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739428923; x=1740033723; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oTmB7Ig1eQii2PQt8Vq5KK5KdLNWvxjjdgsBUW1hd1Q=;
 b=b3dESKbnlVE/rYVcj5DeebAEInYBL3kIG6n6xs/zdfsJ9MFm+pc4ze8vZt/2C3ws8h
 +FAcxltaiZml5r13w32gkY1aVQXNULQVzFiNJ36EIDNuNhOtzJBIhQqyI5hEr7GGAyTk
 QJAzpdGuVG1jIx4BvbGnCCZwLYJi9lI7Ow9/6ZNVk+nn9AI64WXCJxUfMybkKkklVu1P
 25ZRGHaaJ76jVjkIkcMsLmYzKux3TtVSYIx06S4905WHBlQa3/PSfYKwWeTlCqTpn9y9
 fj59oLbdXYoQyrA3u4i+AwOQEaSI6iUlM+fWtWr/xabPnY2HIyv1IxK8fxmRA9/V43d1
 DAaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739428923; x=1740033723;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oTmB7Ig1eQii2PQt8Vq5KK5KdLNWvxjjdgsBUW1hd1Q=;
 b=HomNRZfbG2kqF2XsG3y6CiQHP6sSmKM4VvjKvUo9tIogvVMlUsJmGVjjJpxAJfLMpG
 ihPu4idMNENfp/B7dkXouY+gCjk5sH/TxPU5p8LN5aVt+fXaPmJWWoG1/H9NuhLO8hpX
 v5ILoMa2SVP5ifIqdoJujZq1tX2Oy5MZ2+03guo/nPF+/jJksGHYUsic/USfA86oytn7
 J0BkCVdwb+pKwiDL74pdlzxNboWe2CqQXUsP2CxjY+qLNuJik8wEr98gbYxvtmt0lDgQ
 T5CKoQkgaBnxrDRe0k9LiVgDNcQ9ZkVK9xbiwbP2agC96pOByVCMvoyW0wN+Uu0a2WSw
 QK8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzIqc9uMmgG1iw6XW7XT36yyIT5QL39OIEPITiSkdHLWLgdg8/2/+UmpW8Q0aeV2ouYRw3NhT8vK4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywp37CmwPEVGe5E6nDviK/wUxrLGKevbHadvtBF6HBzEVx8EkSB
 ttadD4+rNJQ25LcGnio71WhWCYQVeV5+jWR562esxXe/CaaWU14Tfj84APNWQWGvcbSz6FpZdO7
 wjBlIisZcwKP7RAU0vu0t3oFvQ8emha6rlBjO2A==
X-Gm-Gg: ASbGncsIX3gpcyAQQrl41Op1NQ/zKOlMe6E6UObsyhSE52tEwYH/FmoPpQ+Uf3iIOuk
 3u2xYsUVtaDeHtWF7+yaxPtybAdQUKGr8iUqp17XXVWxC7TTc8iNU38NwxnsyhhZW99CE8imVCb
 M=
X-Google-Smtp-Source: AGHT+IFhSui+oRYa0yiUwlfe4d8Dd+KjfAVoX7QGNMnwQAifah82de3Os5iBk5Pb0QFnrRe9uhZGgxrDA5ujKbbjaVg=
X-Received: by 2002:a05:6102:2c08:b0:4ba:eb24:fb06 with SMTP id
 ada2fe7eead31-4bc03562833mr2668789137.6.1739428923140; Wed, 12 Feb 2025
 22:42:03 -0800 (PST)
MIME-Version: 1.0
References: <20241217100809.3962439-1-jens.wiklander@linaro.org>
 <20250212205613.4400a888@collabora.com>
In-Reply-To: <20250212205613.4400a888@collabora.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Thu, 13 Feb 2025 12:11:52 +0530
X-Gm-Features: AWEUYZkoZwXb13fMynlvth-g3hUZ-u2ftHq4Gn9B-5c6gMjO7S6PRx1iL7ELE6c
Message-ID: <CAFA6WYOaGEPj0xNEDBCoEmjJreEHChjQ2hyXRJ_CYoGhiBonfw@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org, 
 linux-arm-kernel@lists.infradead.org, Olivier Masse <olivier.masse@nxp.com>, 
 Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, Florent Tomasin <florent.tomasin@arm.com>
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Boris,

On Thu, 13 Feb 2025 at 01:26, Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> +Florent, who's working on protected-mode support in Panthor.
>
> Hi Jens,
>
> On Tue, 17 Dec 2024 11:07:36 +0100
> Jens Wiklander <jens.wiklander@linaro.org> wrote:
>
> > Hi,
> >
> > This patch set allocates the restricted DMA-bufs via the TEE subsystem.
>
> We're currently working on protected-mode support for Panthor [1] and it
> looks like your series (and the OP-TEE implementation that goes with
> it) would allow us to have a fully upstream/open solution for the
> protected content use case we're trying to support. I need a bit more
> time to play with the implementation but this looks very promising
> (especially the lend rstmem feature, which might help us allocate our
> FW sections that are supposed to execute code accessing protected
> content).

Glad to hear that, if you can demonstrate an open source use case
based on this series then it will help to land it. We really would
love to see support for restricted DMA-buf consumers be it GPU, crypto
accelerator, media pipeline etc.

>
> >
> > The TEE subsystem handles the DMA-buf allocations since it is the TEE
> > (OP-TEE, AMD-TEE, TS-TEE, or perhaps a future QCOMTEE) which sets up the
> > restrictions for the memory used for the DMA-bufs.
> >
> > I've added a new IOCTL, TEE_IOC_RSTMEM_ALLOC, to allocate the restricted
> > DMA-bufs. This IOCTL reaches the backend TEE driver, allowing it to choose
> > how to allocate the restricted physical memory.
>
> I'll probably have more questions soon, but here's one to start: any
> particular reason you didn't go for a dma-heap to expose restricted
> buffer allocation to userspace? I see you already have a cdev you can
> take ioctl()s from, but my understanding was that dma-heap was the
> standard solution for these device-agnostic/central allocators.

This series started with the DMA heap approach only here [1] but later
discussions [2] lead us here. To point out specifically:

- DMA heaps require reliance on DT to discover static restricted
regions carve-outs whereas via the TEE implementation driver (eg.
OP-TEE) those can be discovered dynamically.
- Dynamic allocation of buffers and making them restricted requires
vendor specific driver hooks with DMA heaps whereas the TEE subsystem
abstracts that out with underlying TEE implementation (eg. OP-TEE)
managing the dynamic buffer restriction.
- TEE subsystem already has a well defined user-space interface for
managing shared memory buffers with TEE and restricted DMA buffers
will be yet another interface managed along similar lines.

[1] https://lore.kernel.org/lkml/mzur3odofwwrdqnystozjgf3qtvb73wqjm6g2vf5dfsqiehaxk@u67fcarhm6ge/T/
[2] https://lore.kernel.org/lkml/CAFA6WYPtp3H5JhxzgH9=z2EvNL7Kdku3EmG1aDkTS-gjFtNZZA@mail.gmail.com/

-Sumit

>
> Regards,
>
> Boris
>
> [1]https://lwn.net/ml/all/cover.1738228114.git.florent.tomasin@arm.com/#t
