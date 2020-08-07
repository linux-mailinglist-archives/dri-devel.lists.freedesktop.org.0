Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8B323E7E8
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 09:26:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D65356E97F;
	Fri,  7 Aug 2020 07:26:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A36516E03D
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Aug 2020 00:27:54 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id d14so258283qke.13
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Aug 2020 17:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DGA8+gwrB3sAonXBmChAGNY7ZvvzV2hTqZrY8zZK8EE=;
 b=Xso+VvmrMIUE21k+VszWrrK9Wx9Dkz6fhw6UZwNM31KX0l0YZsv4hPHNk6NsBhrO4/
 EhySBd8R4ixubMzTBx47NcLptPEQcc9nhOQRSp68KR5MF7H5V+wmK/wQWIIHDavV0fkZ
 SBKvHvdritZ9w4z/GVNAyhuj5yZkOHVWHB5YiuwjLvq9gihTrGRPhgrFnz6kLD7KFFmc
 hyuKGOnA8rf9hKzlwP+5JbQlcQvsg8aQEn+cF8l1n95oGqvimoPoe8kUzqyAJdVU/T6M
 VFIfkNNn2/SGiyNeFabIps/1SCSDV1oMpNeo24un+tlqQ9PIyRVW8Wu29+Ri2l+HBok/
 n9Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DGA8+gwrB3sAonXBmChAGNY7ZvvzV2hTqZrY8zZK8EE=;
 b=itjR8NyipVbJPU0s8OUC01X+PWhCkLtGOWZUMz2vHWDnW6SP5Qe8ai246qP+A62FET
 MvjyouXa85NhOJF2VlqL3kJ6Db0JBNlrQJgzSX+RVAchOo2MSVhA3DCvr3mH9ByVkFq4
 ZY3xBRUMfYnZ0G8XPtgk/xVnTJPEfnTbqTBPRfp3unoHvFr14He9i4tVXGCCO8OFJ3Xk
 ncD/j3lLWBqaD8IMKjeQ/aRn2VCXV/4Z3Hs8CMN42Dr3QwSGzaHO0XeUBD5tO/rtFpzx
 3j6UMLX8xxBa4UB2KLYAV9jAo22ZpyPFbjLv8G/G9cjWFsQFhOPRSb0mHUBg4LRRjx+h
 GzgQ==
X-Gm-Message-State: AOAM533KnwLk+mFK5M2zbN/Z8bVU6mvcXM2Iq3NFdWz4zhpJj1T7Notx
 z4QhESk2UmJ9fg/D3OtvfckKqo4uiLfdW8UzboixJg==
X-Google-Smtp-Source: ABdhPJxYSpi1BHzeBCHwCIqOzLWVTcTjGnDSiBqngNyrcb+IxPDN8WOHCv0iGeIsP7xXL3Opes7weirBZfL8IM+8VEk=
X-Received: by 2002:a37:a088:: with SMTP id
 j130mr11365723qke.147.1596760073565; 
 Thu, 06 Aug 2020 17:27:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200805112655.17696-1-colin.king@canonical.com>
In-Reply-To: <20200805112655.17696-1-colin.king@canonical.com>
From: Hridya Valsaraju <hridya@google.com>
Date: Thu, 6 Aug 2020 17:27:17 -0700
Message-ID: <CA+wgaPPL_sdo+fkQa3pqNmTadg9X6mfJZy5nyR5YTt4L6pHWtg@mail.gmail.com>
Subject: Re: [PATCH] staging: ion: fix spelling mistake in function name
 "detatch" -> "detach"
To: Colin King <colin.king@canonical.com>
X-Mailman-Approved-At: Fri, 07 Aug 2020 07:25:55 +0000
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
Cc: "open list:ANDROID DRIVERS" <devel@driverdev.osuosl.org>,
 linaro-mm-sig@lists.linaro.org, Todd Kjos <tkjos@android.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Suren Baghdasaryan <surenb@google.com>,
 =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>,
 Joel Fernandes <joel@joelfernandes.org>, Laura Abbott <labbott@redhat.com>,
 Martijn Coenen <maco@android.com>, Christian Brauner <christian@brauner.io>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 5, 2020 at 4:26 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in the function name ion_dma_buf_detatch.
> Fix it by removing the extraneous t.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---

Thanks Colin!
Acked-by: Hridya Valsaraju <hridya@google.com>

>  drivers/staging/android/ion/ion.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/staging/android/ion/ion.c b/drivers/staging/android/ion/ion.c
> index 3c9f09506ffa..e1fe03ceb7f1 100644
> --- a/drivers/staging/android/ion/ion.c
> +++ b/drivers/staging/android/ion/ion.c
> @@ -205,8 +205,8 @@ static int ion_dma_buf_attach(struct dma_buf *dmabuf,
>         return 0;
>  }
>
> -static void ion_dma_buf_detatch(struct dma_buf *dmabuf,
> -                               struct dma_buf_attachment *attachment)
> +static void ion_dma_buf_detach(struct dma_buf *dmabuf,
> +                              struct dma_buf_attachment *attachment)
>  {
>         struct ion_dma_buf_attachment *a = attachment->priv;
>         struct ion_buffer *buffer = dmabuf->priv;
> @@ -331,7 +331,7 @@ static const struct dma_buf_ops dma_buf_ops = {
>         .mmap = ion_mmap,
>         .release = ion_dma_buf_release,
>         .attach = ion_dma_buf_attach,
> -       .detach = ion_dma_buf_detatch,
> +       .detach = ion_dma_buf_detach,
>         .begin_cpu_access = ion_dma_buf_begin_cpu_access,
>         .end_cpu_access = ion_dma_buf_end_cpu_access,
>  };
> --
> 2.27.0
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
