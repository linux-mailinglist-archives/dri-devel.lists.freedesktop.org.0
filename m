Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFBB452DAD
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 10:14:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 912F66EDD6;
	Tue, 16 Nov 2021 09:14:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 786026EEB9
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 08:26:30 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id g19so17506096pfb.8
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 00:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rUkyXCVCQcML8mU+bt8DD4FB+5QBSOVSc/yYB2EHpFc=;
 b=Vv3cuUmrlkKpggK0A4S5Fw/fpL1GdDa4UJDK9d/JH7khq5ddZBUjqjkf8N5ZohL3Bd
 sAeX5g08DfWLVDHOZN1gI0lAl5hlJmyNHOnCdrtKGqpD3rPmJvMDIA2fc9Nprx7ZL4fo
 M+fTefDtyvEPGq5XrnzrqEdg2bfwTvRxEEoXCBEZyspVzL/DanuBVDQxpUjoRQMIMenv
 IZTf1yqUPxj5XYcVeqcHWToOgHOWTR/D5iSLSk/8+qufzQ+s3ljX+q6084X9q9POjYFR
 XwBjJE4Mchaxh7QcPq1ZTvd5IhqqT9GRJwLqaN/FT5RNMSmsE/75A5Xg7W0F9D5lUb+O
 eBkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rUkyXCVCQcML8mU+bt8DD4FB+5QBSOVSc/yYB2EHpFc=;
 b=XnTyWP436X8q4pL786+Gtc4+j7BXUFjPKw9mJf7tQu1LZA1NttFYLRzT3cIshoTSdO
 OoJdZSIGiVE0Nk0hN/q35Rmea/LyH4kGbn+mdyb0ndMVEDCNrJ6dCbrU8d1/yNtWh5mz
 jJ7Rafin/OyOHjgfaGkBGwzHjDrKHMe81pE8T/atVReZjUrOwxR2HWuvOTG4FPY6xtuX
 swNDpVzkH5dVq0pJRAnd+cDAlbljOVKxkuw2HNYyyIm2M/cZMnwOEKzRQCHtsdUMbHJC
 z1SXGtOb/jyJO78qcbjjbrMnCX7GSfriIwOMYkgSgTI7zCEXSz3rysFyu02YqLRQib71
 OkgA==
X-Gm-Message-State: AOAM531YvLCy3KP02bGNB/b6Cg5nKg/DatFJoXp/UPBngY2ZzylM2Fga
 b6I8eeHBkmaZcj4oM2JaiP+qOpEoJVacDNgSf4w=
X-Google-Smtp-Source: ABdhPJxgfh6Xgrp/tq7DgShkG7qFpZU22bNGSqLPVGAEnulBw2EuhE/eTEwyZUerfoJCNVCNPaICArCt8bkbPVRtYK4=
X-Received: by 2002:a63:4a63:: with SMTP id j35mr221510pgl.409.1637051190106; 
 Tue, 16 Nov 2021 00:26:30 -0800 (PST)
MIME-Version: 1.0
References: <20211115141925.60164-1-paul@crapouillou.net>
 <20211115141925.60164-4-paul@crapouillou.net>
In-Reply-To: <20211115141925.60164-4-paul@crapouillou.net>
From: Alexandru Ardelean <ardeleanalex@gmail.com>
Date: Tue, 16 Nov 2021 10:26:18 +0200
Message-ID: <CA+U=DsrCPQhe4pqC4RReDFno1pazJYq9D89wuMnsLubUz-ytTw@mail.gmail.com>
Subject: Re: [PATCH 03/15] iio: buffer-dma: Use round_down() instead of
 rounddown()
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
> We know that the buffer's alignment will always be a power of two;
> therefore, we can use the faster round_down() macro.
>

Reviewed-by: Alexandru Ardelean <ardeleanalex@gmail.com>

> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/iio/buffer/industrialio-buffer-dmaengine.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/iio/buffer/industrialio-buffer-dmaengine.c b/drivers/iio/buffer/industrialio-buffer-dmaengine.c
> index 1ac94c4e9792..f8ce26a24c57 100644
> --- a/drivers/iio/buffer/industrialio-buffer-dmaengine.c
> +++ b/drivers/iio/buffer/industrialio-buffer-dmaengine.c
> @@ -67,7 +67,7 @@ static int iio_dmaengine_buffer_submit_block(struct iio_dma_buffer_queue *queue,
>         dma_cookie_t cookie;
>
>         block->bytes_used = min(block->size, dmaengine_buffer->max_size);
> -       block->bytes_used = rounddown(block->bytes_used,
> +       block->bytes_used = round_down(block->bytes_used,
>                         dmaengine_buffer->align);
>
>         desc = dmaengine_prep_slave_single(dmaengine_buffer->chan,
> --
> 2.33.0
>
