Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C400997C71
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 07:33:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B10C10E867;
	Thu, 10 Oct 2024 05:33:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jckVqQwj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5528B10E866
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 05:33:03 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-5c876ed9c93so568799a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2024 22:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728538382; x=1729143182; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QLeJpOVnaXgVOcwq4oaCZwxfF9fcKYWEKk+MpXHkeY8=;
 b=jckVqQwjJ3r5EvjFv58ZF0GMC85ygWjkckKDoD7gJI/7zGOsAZfwrmS5c3F+DhvBPv
 2m5Uf/uGKhoFlNNhNx3qf2mtUjh2FIBvMUA+ldYw4c2W4q7XQXxucktXZ8E43337Kug9
 36vuY7AXSL10jcwsnIN6Ek2LWYFRQLhxFJKPDOoDeMm9upvhGo0DbcOvQoLknDtNdP9V
 ynhGwbtnJtujPslkSH0jkcNallGu/tSuGWfTaIeHD7GpWCnKqDkLhPMr4yh5R7dRm0lj
 1A7pyzYzQA7N3y0jURgvuvl+rN7Dj04eykHBJ6BQi6qL21BgZqYJZisgZjdVlxcVTbgw
 CqPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728538382; x=1729143182;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QLeJpOVnaXgVOcwq4oaCZwxfF9fcKYWEKk+MpXHkeY8=;
 b=M8kYP5aEl20slnbuEKSc8cVhx2KxVUaeqO+22iL2GvP7o2fcKsEVjR45DereX2cW1r
 rPG/8LxhU9/t1JEqE352TRH+B2OMepCy9ATceSWu9jRNIEoaRpShzltTKz4t6Iso6chr
 Wq/h0PFM92dOHCnvoMMBZ7mqbTqh76chvw+5VOb5KenAoftFHlrJEXVnOwaca3/Wtxwd
 V8EtIayvft48vilaOdobJEkZ8PiYreCnnaeKvXZjNcQC0ptro3G68JOFNkFx3oNHVEHh
 ZwFXbMccPWyKIuyz3UozIaywvW2f50AMxS1R8ox7w1/PjiTJJgYV58vajSnc4q4JjQsb
 0XQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+u2OkCOQPCYTnoRLoLpuvo8CdtdoD2uCmLMFlVZ+2k9x+nIcFN00lq27CKi2X/R5EjkV20cdI+IA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz2SKk45ccuZtSe2FG77Zp32jRcXddCCvPOOXYsjj7DqBduPVvy
 1b48ko1Fi6CfwSNlkri/Nc7J+qA9VwCqTjgn/zYPeomIepgfQBpL3RDVspEupQ++1seMMBHm3pL
 zN1ocWIsM1BIJU+mszUljJ3adt9o=
X-Google-Smtp-Source: AGHT+IFKUAguzyenCV4qtybKuD6WYqAQunGFYP7vn3PFEiqqB3Gh6EmfqyQza8duyB9kIZpAVqXRPE6V5VjbtN4Lhzo=
X-Received: by 2002:a05:6402:2116:b0:5c9:3451:498 with SMTP id
 4fb4d7f45d1cf-5c9345105b7mr1039423a12.25.1728538381414; Wed, 09 Oct 2024
 22:33:01 -0700 (PDT)
MIME-Version: 1.0
References: <20241005180955.6523-1-quic_pintu@quicinc.com>
In-Reply-To: <20241005180955.6523-1-quic_pintu@quicinc.com>
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Thu, 10 Oct 2024 11:02:48 +0530
Message-ID: <CAOuPNLjO6Kz0=1Nnb3REsttH=3bQoUx7D1dRQX9fjTf15hLRdQ@mail.gmail.com>
Subject: Re: [PATCH v2] dma-buf: fix S_IRUGO to 0444, block comments,
 func declaration
To: Pintu Kumar <quic_pintu@quicinc.com>
Cc: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com, 
 Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com, 
 christian.koenig@amd.com, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org, joe@perches.com, skhan@linuxfoundation.org
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

Hi,

On Sat, 5 Oct 2024 at 23:40, Pintu Kumar <quic_pintu@quicinc.com> wrote:
>
> These warnings/errors are reported by checkpatch.
> Fix them with minor changes to make it clean.
> No other functional changes.
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
>
> ---
> Changes in V1 suggested by Sumit Semwal:
> Change commit title, and mention exact reason of fix in commit log.
> V1: https://lore.kernel.org/all/CAOuPNLg1=YCUFXW-76A_gZm_PE1MFSugNvg3dEdkfujXV_5Zfw@mail.gmail.com/
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

Pushed V2 here. Any further comment on this ?

Thanks,
Pintu
