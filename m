Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A0A452DA9
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 10:14:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A860F6EA05;
	Tue, 16 Nov 2021 09:14:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA5546EE1E
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 08:55:15 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id q12so5314128pgh.5
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 00:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9wuK2JM7pYYK7PmRiy77xGnegksjiUGl/GD+82KJ9KA=;
 b=Rm01oHmLcVI99f59n7+IGw28B0Rc78Op12dy7tVzZi4kxvsJ1CAILkiXaIjkBOgtEz
 UN+SCki7wYJpTktfu9lBsi65z2SfwCUIbZ06kev5ddroesDxySGdmsFsvyJtQIRJFnAk
 wi9/LccrYn+H2BHaa4h0H0+JP8d1CKcOZVdd4pHj3Y0LkFx/Sx3BcaOE0Ea1cqxiqvhU
 MqYT9nepvdI+lUXvnof57jn/CAqjdHsk7pn/VaztRRQuQv4WxsqD0WKVmAxjckk3S/3a
 tqVOwC8fWaNGRDi59gRnt8/cNGm/svlj2WCaPBQ07WNWrMfFt4PH3AY5MeUbcKcC1ZJS
 Nqtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9wuK2JM7pYYK7PmRiy77xGnegksjiUGl/GD+82KJ9KA=;
 b=CfbFcFAYQQyEbjhD4LHngCLNZr0M9Ap8dSg4MWV0uUT0RfupqjyCnj+y449J/323+c
 eGAq14pbGBLBQZbu2uXpPM+UAJ1dzRhXafuzuP67NvTQg4cB0g874G1xySZRf+yisFeh
 4vMNVq9qvvmAB4Hb/EDz13zwcIh8yxhNgtY/9cfPbHh8dJxy5Yw567qQZGjWZDHyg5Ic
 aqJYPgMd4ruh8ZUVqpVSqVj7TQDYYqkG4h5NCdPXKYJzjwUl8hpR0EiaYh2mPUMFr4gC
 wCUVRVsxtYDHAld4DtOoIP+2ZnTdLj0FjTnd31PcxEkyqnJetXA6M/sclHRThTJafKT8
 9YvQ==
X-Gm-Message-State: AOAM530/MrERejHcV3C2S8ibOq6UqgfMLqyQ3U5WRDLLas+lPUzsoHGA
 HmFb49w/di0EOarDxnfDO8rgxquXJ2ZN4pyloSM=
X-Google-Smtp-Source: ABdhPJxz7J/5wr41dIgVdELYoASUX5KoLZMfrsXOIXE58Qew4a7xLyrP4bWVXmWoM2xBev3puPrNe9Un7aMisw7bZX8=
X-Received: by 2002:a63:584e:: with SMTP id i14mr3798329pgm.356.1637052915589; 
 Tue, 16 Nov 2021 00:55:15 -0800 (PST)
MIME-Version: 1.0
References: <20211115141925.60164-1-paul@crapouillou.net>
 <20211115141925.60164-7-paul@crapouillou.net>
In-Reply-To: <20211115141925.60164-7-paul@crapouillou.net>
From: Alexandru Ardelean <ardeleanalex@gmail.com>
Date: Tue, 16 Nov 2021 10:55:04 +0200
Message-ID: <CA+U=DspKfDmLhSg6fqz44w-BmmuP1Ju_RuMhS5+ZJXRUzq97fg@mail.gmail.com>
Subject: Re: [PATCH 06/15] iio: buffer-dmaengine: Enable write support
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

On Mon, Nov 15, 2021 at 4:20 PM Paul Cercueil <paul@crapouillou.net> wrote:
>
> Use the iio_dma_buffer_write() and iio_dma_buffer_space_available()
> functions provided by the buffer-dma core, to enable write support in
> the buffer-dmaengine code.
>

This is a bit related to the comment about
iio_dma_buffer_space_available() in patch 4

But otherwise:

Reviewed-by: Alexandru Ardelean <ardeleanalex@gmail.com>


> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/iio/buffer/industrialio-buffer-dmaengine.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/iio/buffer/industrialio-buffer-dmaengine.c b/drivers/iio/buffer/industrialio-buffer-dmaengine.c
> index ac26b04aa4a9..5cde8fd81c7f 100644
> --- a/drivers/iio/buffer/industrialio-buffer-dmaengine.c
> +++ b/drivers/iio/buffer/industrialio-buffer-dmaengine.c
> @@ -123,12 +123,14 @@ static void iio_dmaengine_buffer_release(struct iio_buffer *buf)
>
>  static const struct iio_buffer_access_funcs iio_dmaengine_buffer_ops = {
>         .read = iio_dma_buffer_read,
> +       .write = iio_dma_buffer_write,
>         .set_bytes_per_datum = iio_dma_buffer_set_bytes_per_datum,
>         .set_length = iio_dma_buffer_set_length,
>         .request_update = iio_dma_buffer_request_update,
>         .enable = iio_dma_buffer_enable,
>         .disable = iio_dma_buffer_disable,
>         .data_available = iio_dma_buffer_data_available,
> +       .space_available = iio_dma_buffer_space_available,
>         .release = iio_dmaengine_buffer_release,
>
>         .modes = INDIO_BUFFER_HARDWARE,
> --
> 2.33.0
>
