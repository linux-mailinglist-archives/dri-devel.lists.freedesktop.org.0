Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4ED81B3068
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 21:33:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 063896E329;
	Tue, 21 Apr 2020 19:33:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB9E86E329
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 19:33:26 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03LJWbR7057307;
 Tue, 21 Apr 2020 19:33:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=TfPCGAFcUDdGL+XJcTh5/DTnMS3ZeObUNYGdVKYo47E=;
 b=f86QhzGK9gsry8DK6RXoI/tkWT0W4WGhAW3WCHkgZsUJbIaZPbW0Z6nfOfKLdlzEmN2R
 N8yAnL+SS/PG0upm6nceWCppUox7EVb/TEv9x8cF87bJVqQuKAHWYWDEIkLfogDCQUW4
 E0T/ny8tS8388vMS0AQNZ9GUz4AZSUMEsYMKTHurtoN1k+YAb6oWJPkpo2OW19RWQojR
 TbwcOMTi3tTybJUFZEah2/iOPa4WoVxTuluBCG3Uiv+WTSDKf/WEtqQOFQNxK8qPpMFb
 tvFT0FR+CUtdowe1/4ZLGZ8HVXic5JljvLgav4ei+B4boBZVBBtwiclCd22QoB1IzUpw 5A== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 30ft6n6wbq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Apr 2020 19:33:21 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03LJWElK040860;
 Tue, 21 Apr 2020 19:33:21 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 30gb1gry0w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Apr 2020 19:33:21 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 03LJXKAA004999;
 Tue, 21 Apr 2020 19:33:20 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 21 Apr 2020 12:33:19 -0700
Date: Tue, 21 Apr 2020 22:33:12 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [bug report] drm/xen-front: Add support for Xen PV display
 frontend
Message-ID: <20200421193312.GG2659@kadam>
References: <20200421104522.GA86681@mwanda>
 <alpine.DEB.2.21.2004211728360.3118@hadrien>
 <20200421175220.GE2659@kadam>
 <alpine.DEB.2.21.2004212057070.3118@hadrien>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2004212057070.3118@hadrien>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9598
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 suspectscore=2 spamscore=0
 mlxlogscore=999 mlxscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004210146
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9598
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2
 bulkscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 mlxlogscore=999 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004210146
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
Cc: xen-devel@lists.xenproject.org, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, oleksandr_andrushchenko@epam.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 21, 2020 at 08:59:09PM +0200, Julia Lawall wrote:
> 
> 
> On Tue, 21 Apr 2020, Dan Carpenter wrote:
> 
> > On Tue, Apr 21, 2020 at 05:29:02PM +0200, Julia Lawall wrote:
> > >
> > >
> > > On Tue, 21 Apr 2020, Dan Carpenter wrote:
> > >
> > > > Hi Kernel Janitors,
> > > >
> > > > Here is another idea that someone could work on, fixing the
> > > > IS_ERR_OR_NULL() checks in the xen driver.
> > > >
> > > > The patch c575b7eeb89f: "drm/xen-front: Add support for Xen PV
> > > > display frontend" from Apr 3, 2018, leads to the following static
> > > > checker warning:
> > > >
> > > > 	drivers/gpu/drm/xen/xen_drm_front_gem.c:140 xen_drm_front_gem_create()
> > > > 	warn: passing zero to 'ERR_CAST'
> > > >
> > > > drivers/gpu/drm/xen/xen_drm_front_gem.c
> > > >    133  struct drm_gem_object *xen_drm_front_gem_create(struct drm_device *dev,
> > > >    134                                                  size_t size)
> > > >    135  {
> > > >    136          struct xen_gem_object *xen_obj;
> > > >    137
> > > >    138          xen_obj = gem_create(dev, size);
> > > >    139          if (IS_ERR_OR_NULL(xen_obj))
> > > >    140                  return ERR_CAST(xen_obj);
> > >
> > > Are the other occurrences of this also a possible problem?  There are a
> > > few others outside of xen.
> >
> > We sometimes check a parameter for IS_ERR_OR_NULL().
> >
> > void free_function(struct something *p)
> > {
> > 	if (IS_ERR_OR_NULL(p))
> > 		return;
> > }
> >
> > That's fine, absolutely harmless and not a bug.  But if we are checking
> > a return value like this then probably most of the time it's invalid
> > code.  Normally it's again like this code where we're dealing with an
> > impossible thing because the return is never NULL.  The common bugs are
> > that it returns NULL to a caller which only expects error pointers or it
> > returns success instead of failure.  But sometimes returning success can
> > be valid:
> >
> > 	obj = get_feature(dev);
> > 	if (IS_ERR_OR_NULL(obj))
> > 		return PTR_ERR(obj);
> >
> > It deliberately returns success because the rest of the function is
> > useless when we don't have the feature.
> 
> The other cases are also with ERR_CAST:

I bet these are less likely to be correct because probably the optional
feature doesn't translate to a different optional feature.

> 
> drivers/infiniband/hw/usnic/usnic_ib_qp_grp.c in create_udp_flow

This can never be NULL, but look at this code:

drivers/infiniband/hw/usnic/usnic_ib_qp_grp.c
   427                          if (trans_spec) {
   428                                  qp_flow = create_and_add_flow(qp_grp,
   429                                                                  trans_spec);
   430                                  if (IS_ERR_OR_NULL(qp_flow)) {
   431                                          status = qp_flow ? PTR_ERR(qp_flow) : -EFAULT;
   432                                          break;
   433                                  }
   434                          } else {

If the create_and_add_flow() returns NULL, that's a bug because it's not
an optional feature which can be disabled in the config etc.  But this
code has been future proofed in case future users decide to write buggy
code the NULL gets changed to an error code.

Is -EFAULT the correct way to handle bugs that future programmers are
going to introduce?  You have to very psychic to know the answer to
that.

> fs/overlayfs/namei.c in ovl_index_upper

This code is correct.  There are actually a bunch of functions in VFS
which only return NULL and error pointers, never valid pointers.  VFS
is weird like that.

> sound/soc/qcom/qdsp6/q6adm.c in q6adm_open

Never NULL.  It should be IS_ERR().

> drivers/clk/clk.c in clk_hw_create_clk

This is checking a parameter so it's fine.

regards,
dan carpenter

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
