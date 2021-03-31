Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 070DA350288
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 16:42:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA69E6EAB2;
	Wed, 31 Mar 2021 14:42:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DACE76EAB2
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 14:42:42 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12VEcekQ011355;
 Wed, 31 Mar 2021 14:42:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=YW/GUA7+QalZc0WEPbdokBPA6v9Q8yFebGJ0Y56MID0=;
 b=sK4n+klsanB4lBCOJGqFzeYE5jJhug4lDMIaEiy43ZAp7mSxtftUkbtZme9ueH3PVoOM
 DtQO9CS445LwGWXtLoezI/KXTGkGj9k66s5LQnzJSgISWHq72ZThPpKvSkdtWUvw385m
 73cwS71/Y/tBVTSvMeEm40mI5oH9tzHLqbYcaX6i0ypQblJ0Xuahm+6EMxhWP7t0x74h
 43/D6oPqmPWaGYHsP8XP3X3ci1OomeJ8W6q1o60GDtOvFoMqIdYYKyzfSVDWzcllkyYD
 4bmqHd6Vvi6jMCKgtYv6P/TaBAuL/Td5uGXq7KUcenyR1dVubPvbQXqASernDQZlK0vq tg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2130.oracle.com with ESMTP id 37mafv2fjb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 31 Mar 2021 14:42:40 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12VEdWqW015652;
 Wed, 31 Mar 2021 14:42:38 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 37mabmacge-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 31 Mar 2021 14:42:38 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 12VEgboD029038;
 Wed, 31 Mar 2021 14:42:37 GMT
Received: from kadam (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 31 Mar 2021 07:42:37 -0700
Date: Wed, 31 Mar 2021 17:42:30 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Adrien Grassein <adrien.grassein@gmail.com>
Subject: Re: [PATCH v5 1/1] drm/bridge: lt8912b: fix incorrect handling of
 of_* return values
Message-ID: <20210331144230.GP2088@kadam>
References: <20210331133313.411307-1-adrien.grassein@gmail.com>
 <20210331133313.411307-2-adrien.grassein@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210331133313.411307-2-adrien.grassein@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9940
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103300000 definitions=main-2103310106
X-Proofpoint-ORIG-GUID: xIc-aqfSxROMth17Ob5-AxumlHwB1mhX
X-Proofpoint-GUID: xIc-aqfSxROMth17Ob5-AxumlHwB1mhX
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9940
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 adultscore=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=999
 priorityscore=1501 phishscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103300000
 definitions=main-2103310106
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
Cc: a.hajda@samsung.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 31, 2021 at 03:33:13PM +0200, Adrien Grassein wrote:
> A static analysis shows several issues in the driver code at
> probing time.
> 
> DT parsing errors were bad handled and could lead to bugs:
>   - Bad error detection;
>   - Bad release of ressources
> 
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Suggested-by: Dan Carpenter  <dan.carpenter@oracle.com>
> Signed-off-by: Adrien Grassein <adrien.grassein@gmail.com>
> Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

Great!  Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>

regards,
dan carpenter

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
