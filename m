Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C58698E9E9
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 08:57:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC59F10E0F3;
	Thu,  3 Oct 2024 06:57:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="reKTNdEG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55A9910E0F3
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 06:57:47 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-5c881aa669fso604610a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Oct 2024 23:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727938666; x=1728543466; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JGecQKR7ZoIYH4vaHNJNV/6/ajVJtBZfvfEOkIG81WE=;
 b=reKTNdEGaq9oUXFKYWekz/hMoMrWrXDOOVeuImGLI7MES0lDAqxcRDqvJgY4aln9PP
 6pkQt+jULamS2ME+0y80FKalP6QPQquzJ3Xsn8xosxOtd+SSP/IrbYKxTS61/DSNI6WG
 v4WEFP167Gwk/doj5PWGIPAa3lTwCsXdhAbG8LzprJiMqSz0r63+4Q1us2eeiqpbZg/b
 uj+ks30NKpW1cY5g8qne/OgXXSJ8bgtW2y9z7r34KYBAgmNsiQSerBRyluFx4lz5hOiz
 /knyAAEn7hEOqMZFpvDJgck2uUegCFWgHLwuqWVrtFgGbrvW3zLqwO6m7hzMjRdUgICQ
 OZhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727938666; x=1728543466;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JGecQKR7ZoIYH4vaHNJNV/6/ajVJtBZfvfEOkIG81WE=;
 b=DLfX4zvmSdNlfObRG9o3FUoSLlhznAIl6ihQq547RlwedebueIxHxW0B/1TflKMz8/
 WszicqPRkeipGjAIujqDOGLTzpOnDf/I9j/lqJLMGGNxQ9JsMZOGOjtoeFh4leJ5T1cx
 Q3uAyTvmK/RecnmgWBFnicSM7grODy94dmS1CaFPN9+kzs8hQGddCAzH8Vy7CLWsCJaV
 gE+01M60zHXO6xa8oKnuaMBY1iZizQo0Smwywh/+tYeQNnC+d3FcY4ky/Il4rXW6KKiR
 +1P1s8CcvTJlFGC04YPAulWiSIZ8VtfaTMTqt786HZNioxgON71sC6k0y4yVBxeZ7+G2
 m1Og==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnGQeE3nMdANo1QzsBE/9Xr9qD2aoBdk4887Grz4eHPlpjJJwl0XQJIFdCy5Jbti9qU5fRsCyEqwU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yysgz+WOXBQFRlUgZ+FopKE/4+QtG7oizj88ki8b2U+DGW6wfHJ
 ziv6yUtqpaHu50QidEH0KpoqoBkTNWu8I4btLOAXn+7I86uO21IrhXvNh4F+ave4znNs7g21dj3
 0R2t6GiUKJBGGuE2caB9gHqlO2M3rnPdCzyMNwQ==
X-Google-Smtp-Source: AGHT+IH4QGNNGP1NJcTcHJDWHlXA92zW2AJIpIf/rMuRfbu+fTqO/rDiEJy3cDA2artuxJKreIShbOnY5J0XVGAbl6I=
X-Received: by 2002:a05:6402:5108:b0:5c2:4cbe:ac1c with SMTP id
 4fb4d7f45d1cf-5c8b18eed8fmr3645435a12.4.1727938665602; Wed, 02 Oct 2024
 23:57:45 -0700 (PDT)
MIME-Version: 1.0
References: <20241001174611.12155-1-quic_pintu@quicinc.com>
In-Reply-To: <20241001174611.12155-1-quic_pintu@quicinc.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Thu, 3 Oct 2024 12:27:34 +0530
Message-ID: <CAO_48GFPg=R4JaSZtgTKjh0TLKTrw24AF0nRMvFRXxwYCP28fg@mail.gmail.com>
Subject: Re: [PATCH 1/3] dma-buf: replace symbolic permission S_IRUGO with
 octal 0444
To: Pintu Kumar <quic_pintu@quicinc.com>
Cc: christian.koenig@amd.com, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org, joe@perches.com, skhan@linuxfoundation.org, 
 pintu.ping@gmail.com
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

Hello Pintu,

On Tue, 1 Oct 2024 at 23:16, Pintu Kumar <quic_pintu@quicinc.com> wrote:
>
> Symbolic permissions are not preferred, instead use the octal.
> Also, fix other warnings/errors as well for cleanup.
>
> WARNING: Block comments use * on subsequent lines
> +       /* only support discovering the end of the buffer,
> +          but also allow SEEK_SET to maintain the idiomatic
>
> WARNING: Block comments use a trailing */ on a separate line
> +          SEEK_END(0), SEEK_CUR(0) pattern */
>
> WARNING: Block comments use a trailing */ on a separate line
> +        * before passing the sgt back to the exporter. */
>
> ERROR: "foo * bar" should be "foo *bar"
> +static struct sg_table * __map_dma_buf(struct dma_buf_attachment *attach,
>
> WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.
> +       d = debugfs_create_file("bufinfo", S_IRUGO, dma_buf_debugfs_dir,
>
> total: 1 errors, 4 warnings, 1746 lines checked
>
> Signed-off-by: Pintu Kumar <quic_pintu@quicinc.com>

Thanks for this patch - could you please also mention in the commit
log how did you find this? It looks like you ran checkpatch, but it's
not clear from the commit log.

Since this patch does multiple things related to checkpatch warnings
(change S_IRUGO to 0444, comments correction, function declaration
correction), can I please ask you to change the commit title to also
reflect that?
> ---
>  drivers/dma-buf/dma-buf.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 8892bc701a66..2e63d50e46d3 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -176,8 +176,9 @@ static loff_t dma_buf_llseek(struct file *file, loff_t offset, int whence)
>         dmabuf = file->private_data;
>
>         /* only support discovering the end of the buffer,
> -          but also allow SEEK_SET to maintain the idiomatic
> -          SEEK_END(0), SEEK_CUR(0) pattern */
> +        * but also allow SEEK_SET to maintain the idiomatic
> +        * SEEK_END(0), SEEK_CUR(0) pattern.
> +        */
>         if (whence == SEEK_END)
>                 base = dmabuf->size;
>         else if (whence == SEEK_SET)
> @@ -782,13 +783,14 @@ static void mangle_sg_table(struct sg_table *sg_table)
>         /* To catch abuse of the underlying struct page by importers mix
>          * up the bits, but take care to preserve the low SG_ bits to
>          * not corrupt the sgt. The mixing is undone in __unmap_dma_buf
> -        * before passing the sgt back to the exporter. */
> +        * before passing the sgt back to the exporter.
> +        */
>         for_each_sgtable_sg(sg_table, sg, i)
>                 sg->page_link ^= ~0xffUL;
>  #endif
>
>  }
> -static struct sg_table * __map_dma_buf(struct dma_buf_attachment *attach,
> +static struct sg_table *__map_dma_buf(struct dma_buf_attachment *attach,
>                                        enum dma_data_direction direction)
>  {
>         struct sg_table *sg_table;
> @@ -1694,7 +1696,7 @@ static int dma_buf_init_debugfs(void)
>
>         dma_buf_debugfs_dir = d;
>
> -       d = debugfs_create_file("bufinfo", S_IRUGO, dma_buf_debugfs_dir,
> +       d = debugfs_create_file("bufinfo", 0444, dma_buf_debugfs_dir,
>                                 NULL, &dma_buf_debug_fops);
>         if (IS_ERR(d)) {
>                 pr_debug("dma_buf: debugfs: failed to create node bufinfo\n");
> --
> 2.17.1
>

Best,
Sumit.
