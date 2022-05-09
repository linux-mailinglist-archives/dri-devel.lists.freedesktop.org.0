Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F9F5206F7
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 23:50:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F0BC10EF00;
	Mon,  9 May 2022 21:50:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D2A410EF00
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 21:50:03 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id l18so29324896ejc.7
 for <dri-devel@lists.freedesktop.org>; Mon, 09 May 2022 14:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aKEvNnMqJr+Ji3wzZ+kyxqDQgYFrf7j1orREUwNHbE8=;
 b=Gr/9HTJiYOlDX6fetpo8rWY8vmbwB2ZeETv9WvSLj426WRc41qKOI2DbQDQw8wYrzl
 VMkbaUCWqEmmuWQSf6QXc97xXftjTcTkNiUat2bVrWg6KDJXGw/3EnKvR23vtrc5ek2d
 Huti8ge5p5gr7z/EQS1UOwMrLB+8Lu6MhHhnjLpWSnbfclaxyHzXbK5+ay0dnHO1rWd4
 zn6yEsKKzT44KtGADaFlK2syri+0W8SljEmBB7/ZYrDE3Ubp9EhoqnPOcO8VAtgffMbT
 vxJMvDlQ8kCM7to3VeTwl0W7qseqYQC11parqS+l1gc0hV4AXHRC6AZMIGvKz12lcw7b
 0hOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aKEvNnMqJr+Ji3wzZ+kyxqDQgYFrf7j1orREUwNHbE8=;
 b=Xcx0H5mJoWsKJxGDvUBiCr4gFBSK4s+zaXR42lb+P4PNyYzOj02G9hmw1N8gehqPuX
 ShCBlToMhiSLjgmhajBnnlZNqpn8ykWElPEO7H7DghXpFxC6+6q/XPeV3AwqgYNTEGyY
 J8LXtxv/kmtKC+JFZ7pH6IBjznZnSyussGwH235ji46oTL/4mbp268sE5FXSt2oyfeh3
 5tDsh29oPqze7GAPIj2OCFNc+nydMsIBYbTtSUcFqFg93bxuCfSd6xDCaiITQGRUTl8E
 YPEMQBOBIfNmcpYIb/NLSjkW0GmnypMTUjr+ns43n8LYKGaySmNEL4QHpe8uaRoCxG6z
 wg3A==
X-Gm-Message-State: AOAM5328Rq+tzkZDm339KspMAAvLhK6i+XtzeZNUUEWcE28jMpRAVL1D
 rSSRGOMQjIAy/w/DOXWv3ZlJTMIGxcdq72Q00kwU6w==
X-Google-Smtp-Source: ABdhPJykPbx/03p5//2jQ4C7Er1AEW64JcawHsesvTbhr6ztpX0AZiQPHHfGXfUFyhECCsGvdqV3kvR9V0bNS63hXS4=
X-Received: by 2002:a17:907:9813:b0:6fa:78b0:9be2 with SMTP id
 ji19-20020a170907981300b006fa78b09be2mr6269780ejc.159.1652133001507; Mon, 09
 May 2022 14:50:01 -0700 (PDT)
MIME-Version: 1.0
References: <1652125797-2043-1-git-send-email-quic_charante@quicinc.com>
In-Reply-To: <1652125797-2043-1-git-send-email-quic_charante@quicinc.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Mon, 9 May 2022 14:49:50 -0700
Message-ID: <CABdmKX2V55tA-Or6Dd+bpbcv3fDHps_+zHHJQwhz819LX_2RSQ@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: call dma_buf_stats_setup after dmabuf is in
 valid list
To: Charan Teja Kalla <quic_charante@quicinc.com>
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
Cc: daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hridya Valsaraju <hridya@google.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 9, 2022 at 12:50 PM Charan Teja Kalla
<quic_charante@quicinc.com> wrote:
>
> From: Charan Teja Reddy <quic_charante@quicinc.com>
>
> When dma_buf_stats_setup() fails, it closes the dmabuf file which
> results into the calling of dma_buf_file_release() where it does
> list_del(&dmabuf->list_node) with out first adding it to the proper
> list. This is resulting into panic in the below path:
> __list_del_entry_valid+0x38/0xac
> dma_buf_file_release+0x74/0x158
> __fput+0xf4/0x428
> ____fput+0x14/0x24
> task_work_run+0x178/0x24c
> do_notify_resume+0x194/0x264
> work_pending+0xc/0x5f0
>
> Fix it by moving the dma_buf_stats_setup() after dmabuf is added to the
> list.
>
> Fixes: bdb8d06dfefd ("dmabuf: Add the capability to expose DMA-BUF stats in sysfs")
> Signed-off-by: Charan Teja Reddy <quic_charante@quicinc.com>

Tested-by: T.J. Mercier <tjmercier@google.com>
Acked-by: T.J. Mercier <tjmercier@google.com>

> ---
>  drivers/dma-buf/dma-buf.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 602b12d..a6fc96e 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -543,10 +543,6 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
>         file->f_mode |= FMODE_LSEEK;
>         dmabuf->file = file;
>
> -       ret = dma_buf_stats_setup(dmabuf);
> -       if (ret)
> -               goto err_sysfs;
> -
>         mutex_init(&dmabuf->lock);
>         INIT_LIST_HEAD(&dmabuf->attachments);
>
> @@ -554,6 +550,10 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
>         list_add(&dmabuf->list_node, &db_list.head);
>         mutex_unlock(&db_list.lock);
>
> +       ret = dma_buf_stats_setup(dmabuf);
> +       if (ret)
> +               goto err_sysfs;
> +
>         return dmabuf;
>
>  err_sysfs:
> --
> 2.7.4
>
