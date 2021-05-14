Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D5A380CA2
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 17:13:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD0C66EEB4;
	Fri, 14 May 2021 15:13:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com
 [IPv6:2607:f8b0:4864:20::933])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 366846EEB4
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 15:13:51 +0000 (UTC)
Received: by mail-ua1-x933.google.com with SMTP id 14so2590741uac.9
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 08:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YID/JHjHbpT7lL7SZu/q8+CUZ7jzSngDYn/BwwGhQx8=;
 b=kFpN6/SJ8uu30nlJJrgM+MBQ7MB7Du1neZvjJGv/ZS5cpD0Wufcaxv2eC/U0/t3kOR
 rqxPNbvjPTrlLOp9i96tbvBnT9KWQGGn3RHUQonCSWovWhz0J87UTyeSq23uOEFEiXJH
 31dFiYLAvYgFTVHvO54lCPUkxKjzpmu3e5cjfFThRR4PCLpjx/xFRlvky/pwEkPElOtN
 zyTkqnJ5sIg1EeoUZacy1hJ2wnjl2N4l/xw4CAAMY86245vrtmt/wOYSzdtDEZf+r9P4
 fmFcmXbWIbARaMjgmbfKDNraBfSZsdl2Qx2f4lEQYpZ7s7O6YBgEgE+xTgIKfkZdnWZo
 f5tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YID/JHjHbpT7lL7SZu/q8+CUZ7jzSngDYn/BwwGhQx8=;
 b=QXAypF+Wga+VkPR8zK7FIRJRzsx1Dhh76y/FK7tg1P/oYoH8A9Z5jxaeRc0BziDYW5
 LJ45A4H4IRsBuS9Qji7nvrOG1HQFYN/nA8y/HxwGp6khzK2AGu7y4aQE0E1MZL/vh5uP
 KR+SIHrSGRKFsyLcrCUctavoJgrhHtKPvtHXDEk0c3Kk02CNuRpPa1j4nkon8dE3Wgss
 MAYLmbmopMiVpEqRaKl5MIimnMngpn1jDAnQGGM6t7zmfcvnRuqQBCPYY3c7L+pgnwXG
 n70VMvmRVAVThK6jb/dVyRhdoe2lMjNyNKkLc4nFpRtFIHB4LKkhaH5JEgSrAQ3bFc+q
 Fbhw==
X-Gm-Message-State: AOAM533ZnPREMZo1fu05KLECvXpHF2J9KduJlu7INxs1X6aGXvJ9V/AH
 z0zyylVMWIc+pPfv3L1Dv1upD8pZTXrDpOKhn28=
X-Google-Smtp-Source: ABdhPJxXdz52ZO1tKKhaQJFQthCkyUbx8514AovbO720cCU0osbzsyhGJOr2Eo4y2690k74ScSVHq1lkrW+AG7oy7yg=
X-Received: by 2002:ab0:40e:: with SMTP id 14mr3251254uav.42.1621005230444;
 Fri, 14 May 2021 08:13:50 -0700 (PDT)
MIME-Version: 1.0
References: <YJ6BJBgS0HnPgzsJ@mwanda>
In-Reply-To: <YJ6BJBgS0HnPgzsJ@mwanda>
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Fri, 14 May 2021 08:13:15 -0700
Message-ID: <CAMWSM7gBU9VOZovOB29ZGKNvL_tXxWk1z0GD44n0=wYk+eAXUA@mail.gmail.com>
Subject: Re: [bug report] drm: remove usage of drm_pci_alloc/free
To: Dan Carpenter <dan.carpenter@oracle.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dan,

On Fri, May 14, 2021 at 6:54 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> Hello Joseph Kogut,
>
> The patch 70556e24e18e: "drm: remove usage of drm_pci_alloc/free"
> from Apr 22, 2021, leads to the following static checker warning:
>
>     drivers/gpu/drm/drm_bufs.c:1090 drm_legacy_addbufs_pci()
>     warn: inconsistent returns '&dev->struct_mutex'.
>       Locked on  : 988
>       Unlocked on: 938,944,951,959,973,1005,1042,1060,1090
>
> drivers/gpu/drm/drm_bufs.c
>    965          temp_pagelist = kmalloc_array(dma->page_count + (count << page_order),
>    966                                        sizeof(*dma->pagelist),
>    967                                        GFP_KERNEL);
>    968          if (!temp_pagelist) {
>    969                  kfree(entry->buflist);
>    970                  kfree(entry->seglist);
>    971                  mutex_unlock(&dev->struct_mutex);
>    972                  atomic_dec(&dev->buf_alloc);
>    973                  return -ENOMEM;
>
> There is a bunch of clean up happenning on the existing returns.
>
>    974          }
>    975          memcpy(temp_pagelist,
>    976                 dma->pagelist, dma->page_count * sizeof(*dma->pagelist));
>    977          DRM_DEBUG("pagelist: %d entries\n",
>    978                    dma->page_count + (count << page_order));
>    979
>    980          entry->buf_size = size;
>    981          entry->page_order = page_order;
>    982          byte_count = 0;
>    983          page_count = 0;
>    984
>    985          while (entry->buf_count < count) {
>    986                  dmah = kmalloc(sizeof(drm_dma_handle_t), GFP_KERNEL);
>    987                  if (!dmah)
>    988                          return -ENOMEM;
>
> This new return has no clean up.  We a mutex_unlock(&dev->struct_mutex).
>
>    989
>    990                  dmah->size = total;
>    991                  dmah->vaddr = dma_alloc_coherent(dev->dev,
>    992                                                   dmah->size,
>    993                                                   &dmah->busaddr,
>    994                                                   GFP_KERNEL);
>    995                  if (!dmah->vaddr) {
>    996                          kfree(dmah);
>    997
>    998                          /* Set count correctly so we free the proper amount. */
>    999                          entry->buf_count = count;
>   1000                          entry->seg_count = count;
>   1001                          drm_cleanup_buf_error(dev, entry);
>   1002                          kfree(temp_pagelist);
>   1003                          mutex_unlock(&dev->struct_mutex);
>   1004                          atomic_dec(&dev->buf_alloc);
>   1005                          return -ENOMEM;
>   1006                  }
>   1007                  entry->seglist[entry->seg_count++] = dmah;
>   1008                  for (i = 0; i < (1 << page_order); i++) {
>   1009                          DRM_DEBUG("page %d @ 0x%08lx\n",
>
> regards,
> dan carpenter

Thanks for the report, I'll follow up with a patch to fix this.

Best,
Joseph
