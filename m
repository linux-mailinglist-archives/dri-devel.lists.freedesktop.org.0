Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 898E7452DAA
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 10:14:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 191A86EDD0;
	Tue, 16 Nov 2021 09:14:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC006E3AA
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 08:23:11 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 o6-20020a17090a0a0600b001a64b9a11aeso2190754pjo.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 00:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3+vKQR2yjsr4EpvmyaU72REwMRnHBJTnUozWbZ4+OkE=;
 b=cBuE7Usu1jQbcBJMZKMLs7FbU7IGjsBMIpTOA2j2S4GoI8Ks0C7VsFzJqeAzPk3S/c
 gun3rgx7ykHpO2INlKwu5qY6x933MZqNwW/idwm4bI15InCICTmbeB9KL4OUGS+xt6IQ
 hiYZ2+3xFWnYzXT+dtXst5y/WUx5ZJUVoS1V16BEwiKDIHgimE79zAR4M6up0Yc7xorb
 CjVYYkymFZAzc5c3lsrKRPu0udULmHG0QylJmywi2ZQRexr3gWjVZQxtZMXanoHlSkiP
 wOHLT1FJag2QBjKOD9NwfmvomENUzhMIMeJY6sDVCSNkc1ZfpFiRZl9c2Y2+HknyvRAb
 E5nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3+vKQR2yjsr4EpvmyaU72REwMRnHBJTnUozWbZ4+OkE=;
 b=vv2dlkBVpeOZbwPB0UYtIJ1wxdtM5eqrg/GRJ178arVaLf5WSeffkn7gvmMeRonkUu
 X0zdnfVeO+ZrEb3zsE2SiMK4upeWeR3f8XPSaa75CmJ9GwGX+Kd+DE93FBJQN9t+LcOI
 MTESaOUzZ6D/KkyafWotN+6Ilg109eFmd0k2mbApPS3Cu+CCa0m24yC7WChT9cmYgx0a
 K8dH0+HUxQShUckfXE0yhZskhX5hmCwP6RfHjS1nYMfyRRQ6wdwnhL4KKiLCnkc2u/IV
 xbS6YiXOz9wZPStohoSNTE7lkYrv4LWhmG7w1OmcuE+L/sg7eWOjuo5yGjVXp0lq29nU
 lbsg==
X-Gm-Message-State: AOAM530AxUwk+FqPtzny7uTWRtsHhJ+S0MbyGOgXJY8aOtAtd8dYrdqF
 LEdiPFqmrCVDdBYe+QAxr6UGTsy3hW3OqQnnMbs=
X-Google-Smtp-Source: ABdhPJxKZE+MWVQYmW3TQ0WM6WxO4BDm1lvKTnO98Ys/xKMCj83AX9173FQ5v5JK7vIKCh+0yQ0SvV40PcqU1lVdg3w=
X-Received: by 2002:a17:90b:4b83:: with SMTP id
 lr3mr73448586pjb.98.1637050991159; 
 Tue, 16 Nov 2021 00:23:11 -0800 (PST)
MIME-Version: 1.0
References: <20211115141925.60164-1-paul@crapouillou.net>
 <20211115141925.60164-3-paul@crapouillou.net>
In-Reply-To: <20211115141925.60164-3-paul@crapouillou.net>
From: Alexandru Ardelean <ardeleanalex@gmail.com>
Date: Tue, 16 Nov 2021 10:22:59 +0200
Message-ID: <CA+U=DsqGZvCdVcEyTW7YpQOaPG7RMUzziN83d_ChnvNeFv3Paw@mail.gmail.com>
Subject: Re: [PATCH 02/15] iio: buffer-dma: Remove unused iio_buffer_block
 struct
To: Paul Cercueil <paul@crapouillou.net>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 16 Nov 2021 09:14:41 +0000
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
 linux-iio <linux-iio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jonathan Cameron <jic23@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 15, 2021 at 4:19 PM Paul Cercueil <paul@crapouillou.net> wrote:
>
> This structure was never used anywhere, so it can safely be dropped.
>
> It will later be re-introduced as a different structure in a
> different header.

Reviewed-by: Alexandru Ardelean <ardeleanalex@gmail.com>

>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  include/linux/iio/buffer-dma.h | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/include/linux/iio/buffer-dma.h b/include/linux/iio/buffer-dma.h
> index d4ed5ff39d44..a65a005c4a19 100644
> --- a/include/linux/iio/buffer-dma.h
> +++ b/include/linux/iio/buffer-dma.h
> @@ -17,11 +17,6 @@ struct iio_dma_buffer_queue;
>  struct iio_dma_buffer_ops;
>  struct device;
>
> -struct iio_buffer_block {
> -       u32 size;
> -       u32 bytes_used;
> -};
> -
>  /**
>   * enum iio_block_state - State of a struct iio_dma_buffer_block
>   * @IIO_BLOCK_STATE_DEQUEUED: Block is not queued
> --
> 2.33.0
>
