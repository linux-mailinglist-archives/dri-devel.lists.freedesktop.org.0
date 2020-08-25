Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AE8251793
	for <lists+dri-devel@lfdr.de>; Tue, 25 Aug 2020 13:30:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDB8B6E8D7;
	Tue, 25 Aug 2020 11:30:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB3EF6E8D7
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Aug 2020 11:30:12 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07PBTRQL013682;
 Tue, 25 Aug 2020 11:30:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=UqDjDyOFD5s/5uXIADX8Dpka3IW+YvF8qQ+1D4vK4aY=;
 b=D6X+46Lfg42KFMBE7f6v+4WZs8Dfoz4mIkq9nxew+ZFlt43MIjQ42NPU2UHp8K6nSNqr
 ormaQDBjJRqkXs1xPf0CJZRlyC8XcVVbJhNbydvztUE06h+wEHgg76to6IjCB6ygy9J5
 1KjxbL5vYR/l3rv6SxdRuyKetLtIUI2CXWR3I2/jos9o3EiF6fkp3DhNvqZJEmGFC1SH
 TzUZ+bvwjIGawNI4ALW7qmePhVukCTmKIRrO6hz4f0jkqNTLEP6J+6j4lpT1L3KNqB/j
 Ys+cm8yKc3AGv13Q0DmJb+9zlhxc5B6Wraj2SCWEF1l203gL9EFn9CT2mScL8oFtwlp9 WQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 333w6trecb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 25 Aug 2020 11:30:07 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07PBQAf6147196;
 Tue, 25 Aug 2020 11:28:06 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 333ru79rja-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Aug 2020 11:28:06 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 07PBS5Rx027760;
 Tue, 25 Aug 2020 11:28:05 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 25 Aug 2020 04:28:04 -0700
Date: Tue, 25 Aug 2020 14:27:59 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: malat@debian.org
Subject: [bug report] drm/dp: annotate implicit fall throughs
Message-ID: <20200825112759.GA287100@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9723
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 bulkscore=0 suspectscore=3 spamscore=0 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008250087
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9723
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 impostorscore=0
 mlxlogscore=999 suspectscore=3 phishscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 clxscore=1011 mlxscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008250087
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

Hello Mathieu Malaterre,

The patch e9c0c874711b: "drm/dp: annotate implicit fall throughs"
from Jan 14, 2019, leads to the following static checker warning:

	drivers/gpu/drm/drm_dp_helper.c:495 drm_dp_downstream_max_bpc()
	warn: ignoring unreachable code.

drivers/gpu/drm/drm_dp_helper.c
   467  int drm_dp_downstream_max_bpc(const u8 dpcd[DP_RECEIVER_CAP_SIZE],
   468                                const u8 port_cap[4])
   469  {
   470          int type = port_cap[0] & DP_DS_PORT_TYPE_MASK;
   471          bool detailed_cap_info = dpcd[DP_DOWNSTREAMPORT_PRESENT] &
   472                  DP_DETAILED_CAP_INFO_AVAILABLE;
   473          int bpc;
   474  
   475          if (!detailed_cap_info)
   476                  return 0;
   477  
   478          switch (type) {
   479          case DP_DS_PORT_TYPE_VGA:
   480          case DP_DS_PORT_TYPE_DVI:
   481          case DP_DS_PORT_TYPE_HDMI:
   482          case DP_DS_PORT_TYPE_DP_DUALMODE:
   483                  bpc = port_cap[2] & DP_DS_MAX_BPC_MASK;
                                            ^^^^^^^^^^^^^^^^^^
This is 0x3.

   484  
   485                  switch (bpc) {
   486                  case DP_DS_8BPC:
   487                          return 8;
   488                  case DP_DS_10BPC:
   489                          return 10;
   490                  case DP_DS_12BPC:
   491                          return 12;
   492                  case DP_DS_16BPC:
   493                          return 16;
   494                  }
   495                  fallthrough;

This fallthrough is impossible.  Probably the way to work around the
bogus warning is the change the fallthough to "return 0; /* impossible */"
otherwise the fallthrough is sort of misleading...

   496          default:
   497                  return 0;
   498          }
   499  }

regards,
dan carpenter
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
