Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C61404EA1A4
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 22:39:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8224910E092;
	Mon, 28 Mar 2022 20:39:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F23910E092
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 20:39:15 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id x34so18315270ede.8
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 13:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xw6/eHXGYfyQo41MlHn2HdfwjJIHINXKEO94qSppq28=;
 b=b9iImZGKfs3WXC8l0oFuFZaIT4EL8lWv990T7tzJDZ/JCoZfmiHuaQdc0wBbjADKgP
 pz9RoVFnLZtDqu7juxQR8eaS+NrrHwSFtVfQnijQAPH7NQqVwEKLMFwF6KCJnha01cku
 ZjxUGFM7SRxzSdQ05IFVG9EOK7WDaJ/nAVrd++ogw+D7GI52yQ4rkQ7SdzBX+DjMEH+o
 A1nKxj05unPlW0bLqxImCIf4qHc+PnsNdSxmO/Vak6uZtNRINsHJxAVyoY8TDxEFTy/w
 NGcv1jpMb8yBJGbzyXpIApg/IrNqwllJ310kyJZd3kogLQT8ziLRofCJhNUjSmwSm2Jk
 pdBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xw6/eHXGYfyQo41MlHn2HdfwjJIHINXKEO94qSppq28=;
 b=sQ+dRt5Eto/tT6fO9JElcMY2ZEntPBZw212NRjeJBIZewCLGKVVPxz7uDyIEsXWbic
 6ia7YU7pl7S/+CqwgIOy4LZD9g1Wv32qLHE3KOUGbUfuc5fjk480Op0n+I8DrdswnAIG
 W9IpIPM8kKXPH0iqsASwjnsDIpzr8KNqiMHymJcgTBipDHizBuNEliFZx58+l+eV3fM5
 5k1DYR8/UErvA3/llwek/tL5IkgoICk4cQkxamam2aMr8aQ7vKirytqNzHNGNVPnZqCF
 KvL5tA9gEIa31zZ7nO8p16m2+Cac1/Rb7/GNvJcdThhHjNqTqREVMsV6j6dPCZDlx0hP
 03lQ==
X-Gm-Message-State: AOAM530tqB3oGOV6YanXbOZJglEV7u+n39ubGFe12okcifKM4Lnsy5te
 fBydZljtpdAV4FlaELuzn6evDsacXv6P0Whe2ry7dtkKacU8/g==
X-Google-Smtp-Source: ABdhPJxNcNGSt0E34cJpbJ65P1lTtbFVtcXgaCXAMxqv38Y+bWSTAANcprjUbbcH+2VeLvdVtVd+xFb4arFR+965IIg=
X-Received: by 2002:a05:6402:27d1:b0:419:1b02:4a04 with SMTP id
 c17-20020a05640227d100b004191b024a04mr18437384ede.218.1648499953845; Mon, 28
 Mar 2022 13:39:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220207125933.81634-1-paul@crapouillou.net>
 <20220207125933.81634-3-paul@crapouillou.net>
In-Reply-To: <20220207125933.81634-3-paul@crapouillou.net>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 28 Mar 2022 23:38:38 +0300
Message-ID: <CAHp75VeE2_D39X3gWidPTd49v=bdkgnMeoSBh60enp2hKJ-KPw@mail.gmail.com>
Subject: Re: [PATCH v2 02/12] iio: buffer-dma: Enable buffer write support
To: Paul Cercueil <paul@crapouillou.net>
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
Cc: Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-iio <linux-iio@vger.kernel.org>,
 Linux Documentation List <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Alexandru Ardelean <ardeleanalex@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 9, 2022 at 9:10 AM Paul Cercueil <paul@crapouillou.net> wrote:
>
> Adding write support to the buffer-dma code is easy - the write()
> function basically needs to do the exact same thing as the read()
> function: dequeue a block, read or write the data, enqueue the block
> when entirely processed.
>
> Therefore, the iio_buffer_dma_read() and the new iio_buffer_dma_write()
> now both call a function iio_buffer_dma_io(), which will perform this
> task.
>
> The .space_available() callback can return the exact same value as the
> .data_available() callback for input buffers, since in both cases we
> count the exact same thing (the number of bytes in each available
> block).
>
> Note that we preemptively reset block->bytes_used to the buffer's size
> in iio_dma_buffer_request_update(), as in the future the
> iio_dma_buffer_enqueue() function won't reset it.

...

> v2: - Fix block->state not being reset in
>       iio_dma_buffer_request_update() for output buffers.
>     - Only update block->bytes_used once and add a comment about why we
>       update it.
>     - Add a comment about why we're setting a different state for output
>       buffers in iio_dma_buffer_request_update()
>     - Remove useless cast to bool (!!) in iio_dma_buffer_io()

Usual place for changelog is after the cutter '--- ' line below...

> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Reviewed-by: Alexandru Ardelean <ardeleanalex@gmail.com>
> ---

...somewhere here.

>  drivers/iio/buffer/industrialio-buffer-dma.c | 88 ++++++++++++++++----
>  include/linux/iio/buffer-dma.h               |  7 ++

...

> +static int iio_dma_buffer_io(struct iio_buffer *buffer,
> +                            size_t n, char __user *user_buffer, bool is_write)

I believe there is a room for size_t n on the previous line.

...

> +       if (is_write)

I would name it is_from_user.

> +               ret = copy_from_user(addr, user_buffer, n);
> +       else
> +               ret = copy_to_user(user_buffer, addr, n);

...

> +int iio_dma_buffer_write(struct iio_buffer *buffer, size_t n,
> +                        const char __user *user_buffer)
> +{
> +       return iio_dma_buffer_io(buffer, n, (__force char *)user_buffer, true);

Why do you drop address space markers?

> +}

-- 
With Best Regards,
Andy Shevchenko
