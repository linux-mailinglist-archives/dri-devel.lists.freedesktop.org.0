Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5FD25788B
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 13:39:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 936886E119;
	Mon, 31 Aug 2020 11:39:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E41306E119
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 11:39:15 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07VBYuln067752;
 Mon, 31 Aug 2020 11:39:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=3qWGGsIM17FPRW20+RuS/el1UajKdz626ywpt0DVbyk=;
 b=sPU4kpO2jk0psUplooi95qyw/osB2uaL0cn02KrDMeyotTEss0jT/WupmJcB+y6NyERu
 52P58Pvla/K3gRfFfTYOptl3EIqB9qcLcL3xZ5PwVrsfWRl2xeSdj2FYBhuMVMBWt+oR
 s51CMwpqlbN8MWP4Jci5HWRVfiVmPJhpJEQ+3Lhk6E+EjLfuKd+EiP2/SiGKQONxUhwk
 /sx4ds7Q3xMtxDRokcPFp0H4e5f7l5gNh5XuM0A9i7d8snjK2TAMwXuTVmvUWdRYGVdn
 Sqyxp4DI/zjajQgiHtl8NM0O+aSJwdwk2NdLSHc5ZvyLDmuFN7GoyNczkYZqnRkRs60V uw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 337eeqnsnq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 31 Aug 2020 11:39:13 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07VBZ9xA146390;
 Mon, 31 Aug 2020 11:39:13 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 3380kkh6gr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 Aug 2020 11:39:13 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 07VBdCYw006335;
 Mon, 31 Aug 2020 11:39:12 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 31 Aug 2020 04:39:12 -0700
Date: Mon, 31 Aug 2020 14:39:07 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: linus.walleij@linaro.org
Subject: [bug report] drm/mcde: Add new driver for ST-Ericsson MCDE
Message-ID: <20200831113907.GA514373@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9729
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 adultscore=0
 mlxscore=0 suspectscore=3 malwarescore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008310066
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9729
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0 mlxscore=0
 phishscore=0 impostorscore=0 mlxlogscore=967 bulkscore=0 suspectscore=3
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008310066
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

Hello Linus Walleij,

The patch 5fc537bfd000: "drm/mcde: Add new driver for ST-Ericsson
MCDE" from May 24, 2019, leads to the following static checker
warning:

	drivers/gpu/drm/mcde/mcde_display.c:570 mcde_configure_channel()
	error: uninitialized symbol 'val'.

drivers/gpu/drm/mcde/mcde_display.c
   552          case MCDE_VIDEO_TE_FLOW:
   553                  val = MCDE_CHNLXSYNCHMOD_SRC_SYNCH_HARDWARE
   554                          << MCDE_CHNLXSYNCHMOD_SRC_SYNCH_SHIFT;
   555                  val |= MCDE_CHNLXSYNCHMOD_OUT_SYNCH_SRC_TE0
   556                          << MCDE_CHNLXSYNCHMOD_OUT_SYNCH_SRC_SHIFT;
   557                  break;
   558          case MCDE_VIDEO_FORMATTER_FLOW:
   559                  val = MCDE_CHNLXSYNCHMOD_SRC_SYNCH_HARDWARE
   560                          << MCDE_CHNLXSYNCHMOD_SRC_SYNCH_SHIFT;
   561                  val |= MCDE_CHNLXSYNCHMOD_OUT_SYNCH_SRC_FORMATTER
   562                          << MCDE_CHNLXSYNCHMOD_OUT_SYNCH_SRC_SHIFT;
   563                  break;
   564          default:
   565                  dev_err(mcde->dev, "unknown flow mode %d\n",
   566                          mcde->flow_mode);

"val" not initialized on this path.

   567                  break;
   568          }
   569  
   570          writel(val, mcde->regs + sync);
   571  
   572          /* Set up pixels per line and lines per frame */

regards,
dan carpenter
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
