Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BCB2A25ED
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 09:17:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEDF26E436;
	Mon,  2 Nov 2020 08:17:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12D7D6E436
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 08:17:20 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0A28Dvo0135221;
 Mon, 2 Nov 2020 08:17:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=MmObIF0XUmwT+siAQPOkeYMKPxVpzm0mHy1uhJ5BUcs=;
 b=CdDARyyMsKyRAkEgDtHttr6OCI5cXbd+RxLPIFJ0e7r2Cn081JrWMeZQLvHEy/NdkOTM
 iNoxT3GNyAAPDaPD4efveJwrncDmnEPP/RK7FCCKflmyrJz2jap2cSq5CjWbhL/MFIIM
 e3p3QcUfPa78G3WS2Tzxwip3D/ztfvW5pP1W+f/N4gj4Z7lkA/jKH6yW3gLbdJ/hHy8X
 HYyDA37JxuuIPgzNVSr/izHNhJquhWdRWTrUv+TOOxY41P1KxaV+IjQ4/nI1qiuFHfTK
 DERH5eTIGrPEC4zyxGav0dacqC8rm32/yfEgHPk7rCHHCbTCb/Qc+HBg3enX+TmcxbIT Jg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 34hhb1thu7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 02 Nov 2020 08:17:17 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0A28EiYw139697;
 Mon, 2 Nov 2020 08:15:16 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 34hvrmyexg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 02 Nov 2020 08:15:16 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0A28FEIH022068;
 Mon, 2 Nov 2020 08:15:15 GMT
Received: from mwanda (/10.175.190.96) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 02 Nov 2020 00:15:13 -0800
Date: Mon, 2 Nov 2020 11:15:08 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: jianxin.xiong@intel.com
Subject: [bug report] dma-buf: Clarify that dma-buf sg lists are page aligned
Message-ID: <20201102081508.GA104814@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9792
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=972
 adultscore=0
 malwarescore=0 mlxscore=0 suspectscore=3 spamscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011020065
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9792
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 suspectscore=3
 clxscore=1011 mlxlogscore=972 impostorscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011020065
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Jianxin Xiong,

The patch ac80cd17a615: "dma-buf: Clarify that dma-buf sg lists are
page aligned" from Oct 14, 2020, leads to the following static
checker warning:

	drivers/dma-buf/dma-buf.c:917 dma_buf_map_attachment()
	error: 'sg_table' dereferencing possible ERR_PTR()

drivers/dma-buf/dma-buf.c
   897          sg_table = attach->dmabuf->ops->map_dma_buf(attach, direction);
   898          if (!sg_table)
   899                  sg_table = ERR_PTR(-ENOMEM);
   900  
   901          if (IS_ERR(sg_table) && dma_buf_is_dynamic(attach->dmabuf) &&
   902               !IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY))
   903                  dma_buf_unpin(attach);
   904  
   905          if (!IS_ERR(sg_table) && attach->dmabuf->ops->cache_sgt_mapping) {
                    ^^^^^^^^^^^^^^^^^

   906                  attach->sgt = sg_table;
   907                  attach->dir = direction;
   908          }
   909  
   910  #ifdef CONFIG_DMA_API_DEBUG
   911          {
   912                  struct scatterlist *sg;
   913                  u64 addr;
   914                  int len;
   915                  int i;
   916  
   917                  for_each_sgtable_dma_sg(sg_table, sg, i) {
                                                ^^^^^^^^^
Not checked here.

   918                          addr = sg_dma_address(sg);
   919                          len = sg_dma_len(sg);
   920                          if (!PAGE_ALIGNED(addr) || !PAGE_ALIGNED(len)) {
   921                                  pr_debug("%s: addr %llx or len %x is not page aligned!\n",
   922                                           __func__, addr, len);
   923                          }
   924                  }
   925          }
   926  #endif /* CONFIG_DMA_API_DEBUG */

regards,
dan carpenter
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
