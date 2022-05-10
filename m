Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BEF522209
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 19:11:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38E2510E53B;
	Tue, 10 May 2022 17:11:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64D2910E53B
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 17:11:21 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id t5so20763911edw.11
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 10:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yyNHCsFHssjn3zbR0NR3ZZ0sgxAdJxbsIG3gfIjrUV8=;
 b=ACHfeTA70D1ZNAnMiNJhLU/Opraxgv/jvpBeBpQ1DYMiU8lGPSxaGVKXIO9oDmCIt+
 tE0ry69/0T+lGoRbjQVS9V6mDOdSbOCkItBIMFqgU4g5y4A8nBHO4mz5iXjzFezUd1uA
 nYb9UgFSq/W/F0Nf8QYN9YGL0/vISFxA1SyWp424FRaKmm29MQMGnF7nUW2tQUAZWufW
 RGm+N42Z6YTjqSzS3wMSwcAceRxlQZqcxmi7fcLtk8PNc6kSI8EC786t0jcYIKr5YWL6
 78KZHB8qywucOwUwGA6kYo6mX2yBqTKO0EFYg2YFNkRil4DZNyEFj8flEj8S5CqZzAmr
 M9YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yyNHCsFHssjn3zbR0NR3ZZ0sgxAdJxbsIG3gfIjrUV8=;
 b=mPs5+aHDyEBWscc7jwTLxKobW23Uslej1w8LaQLLWaAXVb9rDIZP7yj2pmHf/c1D+J
 FCE1CyAd4nS8kEE4MwozdoRLxcLZP6xwzEOlTQWR3EFnzuSRqr5zwMhE7YWJ8lQ66Y66
 ouvkU6eRSEyy5EQ2ST/UG6oqb52z7Qnfy+M89EA6yiQxXzSd0K/pRQZWLoNE5qiDrRK/
 Q6n+4Fr3v5D5R0X9O70ZOf4GnejhLyvksI7Nt5bHADxHMiZdhyiGrt5Birr3VCDO8/QT
 PN6cYzw9EXLzH2NQj8Az6C2id71DMH+adKCBx4H2TUdt0J18HYLaxbKJAZ6FLmbx3+zj
 +ZSA==
X-Gm-Message-State: AOAM531tfPbxaHGMSU5lFv/zkUrg59qMRRz6b1TdYKGYZDVtyee6KFi6
 pWNGKHvKtHXxhUpYV/eOKy+BjKZ/ZAWEOjHQ2RRkZA==
X-Google-Smtp-Source: ABdhPJwsfwv5eCPLQc/uzvs1bAR2eSnYRw+cAYOUkXo2dBciN+5iqf8VYiLI6m+03pLF7oV9DEfjscfDjzk4xZzawXQ=
X-Received: by 2002:a05:6402:2c4:b0:427:f4a3:2e94 with SMTP id
 b4-20020a05640202c400b00427f4a32e94mr23955650edx.138.1652202679663; Tue, 10
 May 2022 10:11:19 -0700 (PDT)
MIME-Version: 1.0
References: <1652191562-18700-1-git-send-email-quic_charante@quicinc.com>
In-Reply-To: <1652191562-18700-1-git-send-email-quic_charante@quicinc.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 10 May 2022 10:11:08 -0700
Message-ID: <CABdmKX3A1dMwByum1dzbFzjTgq44dquZMzFXXQbzpfGGm2hCJQ@mail.gmail.com>
Subject: Re: [PATCH V2] dmabuf: ensure unique directory name for dmabuf stats
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linaro-mm-sig@lists.linaro.org,
 daniel.vetter@ffwll.ch, Hridya Valsaraju <hridya@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 10, 2022 at 7:07 AM Charan Teja Kalla
<quic_charante@quicinc.com> wrote:
>
> The dmabuf file uses get_next_ino()(through dma_buf_getfile() ->
> alloc_anon_inode()) to get an inode number and uses the same as a
> directory name under /sys/kernel/dmabuf/buffers/<ino>. This directory is
> used to collect the dmabuf stats and it is created through
> dma_buf_stats_setup(). At current, failure to create this directory
> entry can make the dma_buf_export() to fail.
>
> Now, as the get_next_ino() can definitely give a repetitive inode no
> causing the directory entry creation to fail with -EEXIST. This is a
> problem on the systems where dmabuf stats functionality is enabled on
> the production builds can make the dma_buf_export(), though the dmabuf
> memory is allocated successfully, to fail just because it couldn't
> create stats entry.
>
> This issue we are able to see on the snapdragon system within 13 days
> where there already exists a directory with inode no "122602" so
> dma_buf_stats_setup() failed with -EEXIST as it is trying to create
> the same directory entry.
>
> To make the directory entry as unique, append the unique_id for every
> inode. With this change the stats directory entries will be in the
> format of: /sys/kernel/dmabuf/buffers/<inode_number-unique_id>.
>
> Signed-off-by: Charan Teja Kalla <quic_charante@quicinc.com>
> ---
> Changes in V2:
>   -- Used the atomic64_t variable to generate a unique_id to be appended to inode
>      to have an unique directory with name <inode_number-unique_id> -- Suggested by christian
>   -- Updated the ABI documentation -- Identified by Greg.
>   -- Massaged the commit log.
>
> Changes in V1:
>   -- Used the inode->i_ctime->tv_secs as an id appended to inode to create the
>      unique directory with name <inode_number-time_in_secs>.
>   -- https://lore.kernel.org/all/1652178212-22383-1-git-send-email-quic_charante@quicinc.com/
>
>  Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers | 10 +++++-----
>  drivers/dma-buf/Kconfig                               |  6 +++---
>  drivers/dma-buf/dma-buf-sysfs-stats.c                 |  8 +++++---
>  3 files changed, 13 insertions(+), 11 deletions(-)
>
> diff --git a/Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers b/Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers
> index 5d3bc99..9fffbd3 100644
> --- a/Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers
> +++ b/Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers
> @@ -4,19 +4,19 @@ KernelVersion:        v5.13
>  Contact:       Hridya Valsaraju <hridya@google.com>
>  Description:   The /sys/kernel/dmabuf/buffers directory contains a
>                 snapshot of the internal state of every DMA-BUF.
> -               /sys/kernel/dmabuf/buffers/<inode_number> will contain the
> -               statistics for the DMA-BUF with the unique inode number
> -               <inode_number>
> +               /sys/kernel/dmabuf/buffers/<inode_number-unique_id> will
> +               contain the statistics for the DMA-BUF with the unique
> +               pair <inode_number-unique_id>

Android userspace does have a dependency on this being an inode
number. Or at least, a single unsigned int. Not the end of the world,
but still... this will break.
https://cs.android.com/android/platform/superproject/+/master:system/memory/libmeminfo/libdmabufinfo/dmabuf_sysfs_stats.cpp;l=76-77;drc=6951984bbefb96423970b82005ae381065e36704

>  Users:         kernel memory tuning/debugging tools
>
> -What:          /sys/kernel/dmabuf/buffers/<inode_number>/exporter_name
> +What:          /sys/kernel/dmabuf/buffers/<inode_number-unique_id>/exporter_name
>  Date:          May 2021
>  KernelVersion: v5.13
>  Contact:       Hridya Valsaraju <hridya@google.com>
>  Description:   This file is read-only and contains the name of the exporter of
>                 the DMA-BUF.
>
> -What:          /sys/kernel/dmabuf/buffers/<inode_number>/size
> +What:          /sys/kernel/dmabuf/buffers/<inode_number-unique_id>/size
>  Date:          May 2021
>  KernelVersion: v5.13
>  Contact:       Hridya Valsaraju <hridya@google.com>
> diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
> index 541efe0..5bcbdb1 100644
> --- a/drivers/dma-buf/Kconfig
> +++ b/drivers/dma-buf/Kconfig
> @@ -81,9 +81,9 @@ menuconfig DMABUF_SYSFS_STATS
>            Choose this option to enable DMA-BUF sysfs statistics
>            in location /sys/kernel/dmabuf/buffers.
>
> -          /sys/kernel/dmabuf/buffers/<inode_number> will contain
> -          statistics for the DMA-BUF with the unique inode number
> -          <inode_number>.
> +          /sys/kernel/dmabuf/buffers/<inode_number-unique_id> will contain
> +          statistics for the DMA-BUF with the unique pair
> +          <inode_number-unique_id>.
>
>  source "drivers/dma-buf/heaps/Kconfig"
>
> diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.c b/drivers/dma-buf/dma-buf-sysfs-stats.c
> index 2bba0ba..29e9e23 100644
> --- a/drivers/dma-buf/dma-buf-sysfs-stats.c
> +++ b/drivers/dma-buf/dma-buf-sysfs-stats.c
> @@ -38,8 +38,8 @@
>   *
>   * The following stats are exposed by the interface:
>   *
> - * * ``/sys/kernel/dmabuf/buffers/<inode_number>/exporter_name``
> - * * ``/sys/kernel/dmabuf/buffers/<inode_number>/size``
> + * * ``/sys/kernel/dmabuf/buffers/<inode_number-unique_id>/exporter_name``
> + * * ``/sys/kernel/dmabuf/buffers/<inode_number-unique_id>/size``
>   *
>   * The information in the interface can also be used to derive per-exporter
>   * statistics. The data from the interface can be gathered on error conditions
> @@ -172,6 +172,7 @@ int dma_buf_stats_setup(struct dma_buf *dmabuf)
>  {
>         struct dma_buf_sysfs_entry *sysfs_entry;
>         int ret;
> +       static atomic64_t unique_id = ATOMIC_INIT(0);
>
>         if (!dmabuf || !dmabuf->file)
>                 return -EINVAL;
> @@ -192,7 +193,8 @@ int dma_buf_stats_setup(struct dma_buf *dmabuf)
>
>         /* create the directory for buffer stats */
>         ret = kobject_init_and_add(&sysfs_entry->kobj, &dma_buf_ktype, NULL,
> -                                  "%lu", file_inode(dmabuf->file)->i_ino);
> +                                  "%lu-%lu", file_inode(dmabuf->file)->i_ino,
> +                                  atomic64_add_return(1, &unique_id));
>         if (ret)
>                 goto err_sysfs_dmabuf;
>
> --
> 2.7.4
>
