Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB93C8CC65C
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 20:33:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A0DC10E454;
	Wed, 22 May 2024 18:33:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="13/oTxT9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED68610E454
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 18:33:51 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-de462979e00so1365415276.3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 11:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1716402831; x=1717007631;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7EbhQWdOoh78Q/g/fDhY/dpoBbFrko5oWqLo7rk8/U0=;
 b=13/oTxT9z1mS+tfRFqVK0hXgw37xAnPjRab3l/btSU++2F7ffD9DvLSteBp3hLDDU6
 MdtkduPesFJ5OioqHYMexB+f8SBDrzrEw1Ema6A62WfVPOVcvJc8XKecR1UbpEKOpFDF
 5tBUDMcdE6WMDTeER3bmZVtPm3JwYdJh0oajb07rLnQkVNLM+vcjXzCAFyDGw91zo5Ql
 tAsuaU5pQ134Q6+kpLlnqnR61fY/9Y/hB062HtqZrY+5eBSasUgJz50K1oA9QFccpBxe
 E3rZlqd47fLFelnYtwSyUYFD1XHrdpfuYq73fm4CYeJt5teUrcqBLJU78CFaBRwwfshM
 mlHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716402831; x=1717007631;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7EbhQWdOoh78Q/g/fDhY/dpoBbFrko5oWqLo7rk8/U0=;
 b=T9cA6/MI40FoV8PAcoEd60x6D6q8VYTFHEU7+vt1og3sUD3YCVFM8zvwRqI0XDrLeo
 oI7/llPNBMxloy3pOpqTrOqfghDwOH79hPVla96oHrkwLfTEGA9i/UV9kIijBcJJUJir
 zoIPlAEB/PtpmcJJjAHfIvBr+GDNUyT4zjIay5+ExZ8vAznA6htaV5P9pB/D3Y5Pw+ti
 IUyx3q7V+e/JIDjmzQfI7k7SgZ/5944qYTou5ewbEpjm4/+2vXgbVnQI33iGjYe1iyL1
 /EiRsgYJ9K7wO5Xvhb5GTQLEJerOJb8UOQqPTBXvC74tbCxkXJwAXnD589y74o1seD40
 ANdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeOkOeU1fd+5G4K0udBYIsfuAe0TUVyhyW97JZ1IPl5e8lP335M1jaXqh6NrURCviZ6JlSDruw2IPoa8YL/iZhcqfHEogntkwnWJdUxHkY
X-Gm-Message-State: AOJu0Yx2sEtLvM8uaMl/Az5qd8FyTTGRYa+2fNwzEBfOvdskxod7p/1+
 QYZKb7//uboSZE2UDOpWd+L0ZcVAD/0HyRMLFlYP1SajHqNWXPqYI9keBcxjvd3b7wqAFWcqJpg
 B7Qxj4/d9YMCBeVXctGbQygOyH6Iv6irDGigg
X-Google-Smtp-Source: AGHT+IGN47Nmo4f4RGiZUu/PPp/jTEE3uqbIMeUgnJAorz3ApRFTFuY2uRHKB4JKQhH3PzXLlW1bM1uS2dJXihd38dY=
X-Received: by 2002:a25:a2c4:0:b0:de5:51a1:d47a with SMTP id
 3f1490d57ef6-df4e0c1d0dbmr2686142276.28.1716402830630; Wed, 22 May 2024
 11:33:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240522181308.841686-1-pchelkin@ispras.ru>
In-Reply-To: <20240522181308.841686-1-pchelkin@ispras.ru>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 22 May 2024 11:33:38 -0700
Message-ID: <CABdmKX2qdT0HvkX0B6kcxALwxZsLFOtgPsOP_rY0AXM1eAtAtA@mail.gmail.com>
Subject: Re: [PATCH v2] dma-buf: handle testing kthreads creation failure
To: Fedor Pchelkin <pchelkin@ispras.ru>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Chris Wilson <chris@chris-wilson.co.uk>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org, Alexey Khoroshilov <khoroshilov@ispras.ru>, 
 lvc-project@linuxtesting.org, stable@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 22, 2024 at 11:14=E2=80=AFAM Fedor Pchelkin <pchelkin@ispras.ru=
> wrote:
>
> kthread creation may possibly fail inside race_signal_callback(). In
> such a case stop the already started threads, put the already taken
> references to them and return with error code.
>
> Found by Linux Verification Center (linuxtesting.org).
>
> Fixes: 2989f6451084 ("dma-buf: Add selftests for dma-fence")
> Cc: stable@vger.kernel.org
> Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>
Reviewed-by: T.J. Mercier <tjmercier@google.com>
> ---
> v2: use kthread_stop_put() to actually put the last reference as
>     T.J. Mercier noticed;
>     link to v1: https://lore.kernel.org/lkml/20240522122326.696928-1-pche=
lkin@ispras.ru/
>
>  drivers/dma-buf/st-dma-fence.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/dma-buf/st-dma-fence.c b/drivers/dma-buf/st-dma-fenc=
e.c
> index b7c6f7ea9e0c..6a1bfcd0cc21 100644
> --- a/drivers/dma-buf/st-dma-fence.c
> +++ b/drivers/dma-buf/st-dma-fence.c
> @@ -540,6 +540,12 @@ static int race_signal_callback(void *arg)
>                         t[i].before =3D pass;
>                         t[i].task =3D kthread_run(thread_signal_callback,=
 &t[i],
>                                                 "dma-fence:%d", i);
> +                       if (IS_ERR(t[i].task)) {
> +                               ret =3D PTR_ERR(t[i].task);
> +                               while (--i >=3D 0)
> +                                       kthread_stop_put(t[i].task);
> +                               return ret;
> +                       }
>                         get_task_struct(t[i].task);
>                 }
>
> --
> 2.39.2
>
