Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 330E21FAF96
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jun 2020 13:55:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A39D76E12B;
	Tue, 16 Jun 2020 11:55:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67E866E0DA;
 Tue, 16 Jun 2020 11:55:28 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05GBpulM014486;
 Tue, 16 Jun 2020 11:55:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=zXKmGqBgVfd/oRfTCZp+ZNOmz8ApTYrOEDY7rqEojb4=;
 b=A/dby861BGAp/7q1CQTGlDwIhW8VhVnxKwoWVVueI8C6Rg9aygu+LQSNoxUDc1wg1oxf
 HCiAolu7pUyHod0qTTIxJEnFHcZcIXNtacxPU4U4q0kEnIhkn30NrxGOc1OC6Q9Tr6Fn
 QDFhFKSKw70k6V6xXVdWllUI9K7lpaTSPbNhACRptQ8JDFBtTrRPUMGCE2y2bC9ikU4g
 7L8msHxiO8K9lV89QKyEctwxzBfp2PL6EubYV/4a0CwXMOZN6LnnAJsQ8AOYSXsnX6hA
 Bkn7JKSdkDT37u06uvyUaVcINV0FKvmDSQQb7nszR/bKCevTgTVc6jt0wmeDgrgvvL14 aQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 31p6s268tb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 16 Jun 2020 11:55:16 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05GBrJSi033107;
 Tue, 16 Jun 2020 11:55:16 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 31p6dgcvwx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Jun 2020 11:55:15 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 05GBt8Fp000378;
 Tue, 16 Jun 2020 11:55:08 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 16 Jun 2020 04:55:07 -0700
Date: Tue, 16 Jun 2020 14:54:59 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Colin King <colin.king@canonical.com>
Subject: Re: [PATCH] drm/i915/display: fix missing null check on allocated
 dsb object
Message-ID: <20200616115459.GN4151@kadam>
References: <20200616114221.73971-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200616114221.73971-1-colin.king@canonical.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9653
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 bulkscore=0
 phishscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006160089
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9653
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 impostorscore=0
 clxscore=1011 mlxscore=0 mlxlogscore=999 priorityscore=1501 phishscore=0
 malwarescore=0 suspectscore=0 spamscore=0 cotscore=-2147483648 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006160089
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
Cc: David Airlie <airlied@linux.ie>, Animesh Manna <animesh.manna@intel.com>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 16, 2020 at 12:42:21PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently there is no null check for a failed memory allocation
> on the dsb object and without this a null pointer dereference
> error can occur. Fix this by adding a null check.
> 
> Note: added a drm_err message in keeping with the error message style
> in the function.

Don't give in to peer pressure!  That's like being a lemming when Disney
film makers come to push you off the cliff to create the 1958 nature
film "White Wilderness".

regards,
dan carpenter

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
