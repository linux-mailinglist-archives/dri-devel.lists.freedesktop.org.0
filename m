Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A2D380ACA
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 15:54:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B3566EE8D;
	Fri, 14 May 2021 13:54:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B5186EE8D
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 13:54:54 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14EDsret010535; Fri, 14 May 2021 13:54:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=fCXF5ar98j9csdUl1svOMx+KiDeAiDdXumsT1m0FNvI=;
 b=DrGqjlr+cKBWs2JPCfKwWSRvROcTPObgofXFme3WylBVQY1Ln0gwplcYwgOjGVXbwP2e
 MWrRnbMP3S520DoKAnxt1atJ+ZxuRkvGYqy0ifaZMhSYaGxLRD0pFayTdG3Fs04gbvZ5
 EqG2gsAvn1FcR8I0IGzR/dMR3oHslcQF920ksjmOT02qYx6WRlMvi6GWEeYZnTKoiJ8g
 Q2b+MN4Jq9v0xcztE0KhRSn5z/lLvCkOBkpm8x+H6irODKV/4uGsuJ47tlzTUcgNbgQB
 FMKVkx5/8+wle02vtRJa985jWUxPH18ZV/AAHzFMIF/82X5z3vh5MQ+GKxy5/bM4bvFb 7A== 
Received: from oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 38gpphrpsk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 May 2021 13:54:53 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14EDsqji176198;
 Fri, 14 May 2021 13:54:52 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by userp3020.oracle.com with ESMTP id 38gpph8c97-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 May 2021 13:54:52 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14EDsqWX176185;
 Fri, 14 May 2021 13:54:52 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 38gpph8c91-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 May 2021 13:54:52 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 14EDso8K012847;
 Fri, 14 May 2021 13:54:51 GMT
Received: from mwanda (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 14 May 2021 06:54:49 -0700
Date: Fri, 14 May 2021 16:54:44 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: joseph.kogut@gmail.com
Subject: [bug report] drm: remove usage of drm_pci_alloc/free
Message-ID: <YJ6BJBgS0HnPgzsJ@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-ORIG-GUID: G2zbv3BoZYy5-w3nKyoHwUYLXdx_YG-5
X-Proofpoint-GUID: G2zbv3BoZYy5-w3nKyoHwUYLXdx_YG-5
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

Hello Joseph Kogut,

The patch 70556e24e18e: "drm: remove usage of drm_pci_alloc/free"
from Apr 22, 2021, leads to the following static checker warning:

    drivers/gpu/drm/drm_bufs.c:1090 drm_legacy_addbufs_pci()
    warn: inconsistent returns '&dev->struct_mutex'.
      Locked on  : 988
      Unlocked on: 938,944,951,959,973,1005,1042,1060,1090

drivers/gpu/drm/drm_bufs.c
   965          temp_pagelist = kmalloc_array(dma->page_count + (count << page_order),
   966                                        sizeof(*dma->pagelist),
   967                                        GFP_KERNEL);
   968          if (!temp_pagelist) {
   969                  kfree(entry->buflist);
   970                  kfree(entry->seglist);
   971                  mutex_unlock(&dev->struct_mutex);
   972                  atomic_dec(&dev->buf_alloc);
   973                  return -ENOMEM;

There is a bunch of clean up happenning on the existing returns.

   974          }
   975          memcpy(temp_pagelist,
   976                 dma->pagelist, dma->page_count * sizeof(*dma->pagelist));
   977          DRM_DEBUG("pagelist: %d entries\n",
   978                    dma->page_count + (count << page_order));
   979  
   980          entry->buf_size = size;
   981          entry->page_order = page_order;
   982          byte_count = 0;
   983          page_count = 0;
   984  
   985          while (entry->buf_count < count) {
   986                  dmah = kmalloc(sizeof(drm_dma_handle_t), GFP_KERNEL);
   987                  if (!dmah)
   988                          return -ENOMEM;

This new return has no clean up.  We a mutex_unlock(&dev->struct_mutex).

   989  
   990                  dmah->size = total;
   991                  dmah->vaddr = dma_alloc_coherent(dev->dev,
   992                                                   dmah->size,
   993                                                   &dmah->busaddr,
   994                                                   GFP_KERNEL);
   995                  if (!dmah->vaddr) {
   996                          kfree(dmah);
   997  
   998                          /* Set count correctly so we free the proper amount. */
   999                          entry->buf_count = count;
  1000                          entry->seg_count = count;
  1001                          drm_cleanup_buf_error(dev, entry);
  1002                          kfree(temp_pagelist);
  1003                          mutex_unlock(&dev->struct_mutex);
  1004                          atomic_dec(&dev->buf_alloc);
  1005                          return -ENOMEM;
  1006                  }
  1007                  entry->seglist[entry->seg_count++] = dmah;
  1008                  for (i = 0; i < (1 << page_order); i++) {
  1009                          DRM_DEBUG("page %d @ 0x%08lx\n",

regards,
dan carpenter
