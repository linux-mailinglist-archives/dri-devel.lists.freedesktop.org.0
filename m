Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B604424FC78
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 13:24:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D50346E20A;
	Mon, 24 Aug 2020 11:24:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AB4B6E20B
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Aug 2020 11:24:27 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07OBJgk0172786;
 Mon, 24 Aug 2020 11:24:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=J6R/swvCnK5txRBjST+3K6KEsXxD3IeucsUqBi1sJ3c=;
 b=BkFus4155CmC0M5+7SsXANPoPn0ADzXBuQ119ROhasv6JWxm9gDpHfOwrVrdSk5hOH0g
 2qunoeEDvf0Bw1p2OQxIb/1M79hTpGUMxaxnnuP/2/q9EzZEwmzl0j14uZdjNxwenkdr
 Wd+kvOUAe25fjQeBQtV1G5f2H1KfCYXIkF/lcGVHi/kWqAEuWZxUBBUnko0sfsKaYdnU
 0ZWimti6VLbo0LboIAgLPR4a3AoPAcPU3nHW0Bih8fGe+QNzVl7gkmsKcW7Uwhw3F1OQ
 QpOdg9Sp9sae+H6uy7YiNvRw9Nqeudyuo/T9k3fyvMHVfwkW1Mu9tMvOi6B6qOwZxgCI zQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 333dbrkygj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 24 Aug 2020 11:24:18 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07OBK7WW152237;
 Mon, 24 Aug 2020 11:22:18 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 333ru4gysk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Aug 2020 11:22:18 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 07OBMGZe000343;
 Mon, 24 Aug 2020 11:22:16 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 24 Aug 2020 04:22:15 -0700
Date: Mon, 24 Aug 2020 14:22:06 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Tomer Samara <tomersamara98@gmail.com>
Subject: Re: [PATCH v4 1/2] staging: android: Remove BUG_ON from
 ion_page_pool.c
Message-ID: <20200824112206.GH1793@kadam>
References: <cover.1598023523.git.tomersamara98@gmail.com>
 <32ea3b6d840cb56ea927400e1875d9d4db38e926.1598023524.git.tomersamara98@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <32ea3b6d840cb56ea927400e1875d9d4db38e926.1598023524.git.tomersamara98@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9722
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 bulkscore=0 suspectscore=0 spamscore=0 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008240090
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9722
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 clxscore=1015
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008240090
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
Cc: devel@driverdev.osuosl.org, Todd Kjos <tkjos@android.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Joel Fernandes <joel@joelfernandes.org>,
 Riley Andrews <riandrews@android.com>, Martijn Coenen <maco@android.com>,
 Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
 Hridya Valsaraju <hridya@google.com>, Laura Abbott <labbott@redhat.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 21, 2020 at 06:27:37PM +0300, Tomer Samara wrote:
> BUG_ON() is removed at ion_page_pool.c
> 
> Fixes the following issue:
> Avoid crashing the kernel - try using WARN_ON & recovery code ratherthan BUG() or BUG_ON().
> 
> Signed-off-by: Tomer Samara <tomersamara98@gmail.com>
> ---

You should put a note here about what changed between v3 vs v4. Like so:
---
v4: Just remove the BUG_ON()s instead of adding new returns.
v3: Hand the new return paths or whatever.

Anyway, looks good.

Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>

regards,
dan carpenter

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
