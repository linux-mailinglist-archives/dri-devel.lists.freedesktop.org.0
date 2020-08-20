Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5F224AD6F
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 05:46:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10CF36E898;
	Thu, 20 Aug 2020 03:46:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DCB76E899
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 03:46:56 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id i19so245395lfj.8
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 20:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MIchUN4tOHyQmoooHagLeI7lJ2WK7JXkWyfuUiGtb4U=;
 b=cdrzd8DIJ9+V4zbbpYRCDfD/ME6MRUgMWO1v+hngvJLZ6QUHqpxtZhfVChVn0KV1YI
 L16g+IBo/PcqaRGEJl1cra6LI2AVjcny64WifYbPZns6gz6+gFxxWmxtlYj9HZzTAjzi
 BLiUryBAwPeKKrJyDbZyYfUZn14Q00tasLilhAt3bb1/JduHvrKlC9mZ8Dy1D7L17NKj
 J/zdlCU1JZncuPj6GELWF7xGpoLwcnEEUUaZeVMFcp2KDqvBeq5sZJhL66J0DMYEsSH/
 4USCC9pPciz4YakEK4jaCTAAIs6B1to8yLLUVxaW6MFEgIPb3iymIqt865iHYfT68diA
 OPqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MIchUN4tOHyQmoooHagLeI7lJ2WK7JXkWyfuUiGtb4U=;
 b=gfD/Pt+aeDyaxwOxqt+WKyo5zFWEU4vbHksJwkykGXMcU5by9YMyzQnklF4z6MsCp+
 46aQXPe8BQQ3gbkilCmts+x15xDkBJyULGJLjWp4IWm+Q7geqxjDkzX8d8HQWz2OrPu4
 A46hsIyCpW4w3Xz4iyIOP3tlzrD5AbuPKs0SkmLAKeqvlpSOaq5vJxDYuLnd18lNyO2q
 vDaA6g+D4n2Y3/mOLiiV7frIkYe6UkwH0n9cvKP3gu6g20MOWskbTidrxkPNbJT/1Cng
 TzXds0gxTe3xbgdrkVE/x5nD9TLVhTrVprygDMmTvtI8eVJNS1A1bBrI6AxSHYBMGTvn
 4tNw==
X-Gm-Message-State: AOAM5327MOUtwKSbq/uoGajMSIYHwx1OA2PwfGl07klvdTIbyZH/aQXw
 gX/02U3AssQJokNIQ1TtyefYhTBpFAaKUi2kp2o2hA==
X-Google-Smtp-Source: ABdhPJyh8nJHRDA1mfQUy8hmEEmCfXfd0QzynbDBcUhoqQgBHFkqmr86v4MdYm3HWWb1KXvShlGfk8bos1w9MFj/vlw=
X-Received: by 2002:ac2:5383:: with SMTP id g3mr576386lfh.45.1597895214380;
 Wed, 19 Aug 2020 20:46:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200819175134.19261-1-krzk@kernel.org>
In-Reply-To: <20200819175134.19261-1-krzk@kernel.org>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Thu, 20 Aug 2020 09:16:40 +0530
Message-ID: <CAO_48GGjS6rAU1ojTDc9RA6e8nS4PRKOJEBzu-Vpc69x+7ykyg@mail.gmail.com>
Subject: Re: [RESEND PATCH 1/2] dma-buf: Fix kerneldoc of dma_buf_set_name()
To: Krzysztof Kozlowski <krzk@kernel.org>
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
Cc: Gustavo Padovan <gustavo@padovan.org>, LKML <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Linaro MM SIG <linaro-mm-sig@lists.linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Krzystof,

On Wed, 19 Aug 2020 at 23:21, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Fix W=1 compile warnings (invalid kerneldoc):
>
>     drivers/dma-buf/dma-buf.c:328: warning: Function parameter or member 'dmabuf' not described in 'dma_buf_set_name'

Thanks for the patch; I will apply it to drm-misc.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/dma-buf/dma-buf.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 1699a8e309ef..58564d82a3a2 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -316,9 +316,9 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
>   * name of the dma-buf if the same piece of memory is used for multiple
>   * purpose between different devices.
>   *
> - * @dmabuf [in]     dmabuf buffer that will be renamed.
> - * @buf:   [in]     A piece of userspace memory that contains the name of
> - *                  the dma-buf.
> + * @dmabuf: [in]     dmabuf buffer that will be renamed.
> + * @buf:    [in]     A piece of userspace memory that contains the name of
> + *                   the dma-buf.
>   *
>   * Returns 0 on success. If the dma-buf buffer is already attached to
>   * devices, return -EBUSY.
> --
> 2.17.1
>

Best,
Sumit
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
