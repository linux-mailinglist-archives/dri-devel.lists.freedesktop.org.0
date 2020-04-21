Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D14071B2555
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 13:51:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD7C489E1D;
	Tue, 21 Apr 2020 11:51:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19D2189E3B
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 11:51:28 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03LBmYDu045551;
 Tue, 21 Apr 2020 11:51:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=4bRJ6HpveUYBF386I3U2/DJBFNbrJMpTxF/6PvkbQyY=;
 b=qL8jUlPcFKY0QYfc9jOK4O9NjJE4lHZ9bTqJAbG4cNbhIjeoccTV34xeMbe9+zeaH3Xi
 izBlyXs3x6FRVWxUlHqvHyC1DHA+QX7RjiAmBSUTdTaQtvIsoNDJeQnGHPU+71DfcLJw
 ljBQYZWWgEWuUePFxddjT5zDt5/avrrTjgPZQkmtJWOR4hbP1fNQTCwnjwlJPdmZexW1
 WMcWMukaeTRXyjXTji9aSW4n1rCwvxERs7CGnX53oxPoA+KnVclY3f8ckU+I2JK5ME7C
 rsdgF7KndudPUDXJ2XIT2K0kMFbIm9T72M/oH2cqcTY/dGiilA64IzZ5oGA7twE/rFW/ Pw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 30fsgkvha9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Apr 2020 11:51:27 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03LBgRMa006184;
 Tue, 21 Apr 2020 11:51:26 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 30gbbdjwbm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Apr 2020 11:51:26 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 03LBpP3D005889;
 Tue, 21 Apr 2020 11:51:25 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 21 Apr 2020 04:51:24 -0700
Date: Tue, 21 Apr 2020 14:51:12 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [bug report] drm/xen-front: Add support for Xen PV display
 frontend
Message-ID: <20200421115112.GB2682@kadam>
References: <20200421104522.GA86681@mwanda>
 <28cc7f7c-fe0a-fd06-d330-73531b818a79@epam.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <28cc7f7c-fe0a-fd06-d330-73531b818a79@epam.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9597
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 mlxscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004210094
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9597
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 clxscore=1015
 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004210094
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It turns out there aren't that many of these in xen.

$ grep IS_ERR_OR_NULL drivers/gpu/drm/xen/ -Rn
drivers/gpu/drm/xen/xen_drm_front_kms.c:63:     if (IS_ERR_OR_NULL(fb))
drivers/gpu/drm/xen/xen_drm_front_gem.c:86:     if (IS_ERR_OR_NULL(xen_obj))
drivers/gpu/drm/xen/xen_drm_front_gem.c:120:    if (IS_ERR_OR_NULL(xen_obj->pages)) {
drivers/gpu/drm/xen/xen_drm_front_gem.c:139:    if (IS_ERR_OR_NULL(xen_obj))
drivers/gpu/drm/xen/xen_drm_front_gem.c:197:    if (IS_ERR_OR_NULL(xen_obj))
drivers/gpu/drm/xen/xen_drm_front.c:403:        if (IS_ERR_OR_NULL(obj)) {

They're all wrong, because if the pointer was really NULL then it's
not handled correctly and would eventually lead to a runtime failure.

Normally Smatch is smart enough to know that the pointer isn't NULL so
it doesn't generate a warning but yesterday I introduced a bug in Smatch
by mistake.  It's fixed now.

regards,
dan carpenter

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
