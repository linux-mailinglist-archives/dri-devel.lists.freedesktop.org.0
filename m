Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D397C2C7B95
	for <lists+dri-devel@lfdr.de>; Sun, 29 Nov 2020 23:04:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91F4B6E027;
	Sun, 29 Nov 2020 22:04:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C07F6E027
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Nov 2020 22:04:14 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 1EF4120034;
 Sun, 29 Nov 2020 23:04:12 +0100 (CET)
Date: Sun, 29 Nov 2020 23:04:11 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>
Subject: Re: [PATCH] drm/kmb: Remove an unnecessary NULL check
Message-ID: <20201129220411.GG1162850@ravnborg.org>
References: <20201117072137.GB1111239@mwanda>
 <BY5PR11MB4182EBE4FD5F42AC625945998CFF0@BY5PR11MB4182.namprd11.prod.outlook.com>
 <20201120082146.GA314029@ravnborg.org>
 <460740bc-ffb8-91c1-47ec-94a38dd2308d@suse.de>
 <BY5PR11MB4182170E428502EF005B27E48CFF0@BY5PR11MB4182.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BY5PR11MB4182170E428502EF005B27E48CFF0@BY5PR11MB4182.namprd11.prod.outlook.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Ibmpp1ia c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8
 a=e5mUnYsNAAAA:8 a=yPCof4ZbAAAA:8 a=-5daY3v0RUpMMgDoOU4A:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=AjGcO6oz07-iQ99wixmX:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: David Airlie <airlied@linux.ie>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "Dea,
 Edmund J" <edmund.j.dea@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Anitha,

On Fri, Nov 20, 2020 at 05:28:59PM +0000, Chrisanthus, Anitha wrote:
> 
> 
> > -----Original Message-----
> > From: Thomas Zimmermann <tzimmermann@suse.de>
> > Sent: Friday, November 20, 2020 12:34 AM
> > To: Sam Ravnborg <sam@ravnborg.org>; Chrisanthus, Anitha
> > <anitha.chrisanthus@intel.com>
> > Cc: David Airlie <airlied@linux.ie>; Dea, Edmund J <edmund.j.dea@intel.com>;
> > kernel-janitors@vger.kernel.org; dri-devel@lists.freedesktop.org; Dan
> > Carpenter <dan.carpenter@oracle.com>
> > Subject: Re: [PATCH] drm/kmb: Remove an unnecessary NULL check
> > 
> > Hi
> > 
> > Am 20.11.20 um 09:21 schrieb Sam Ravnborg:
> > > Hi Anitha.
> > >
> > > On Fri, Nov 20, 2020 at 01:19:06AM +0000, Chrisanthus, Anitha wrote:
> > >> Looks good to me.
> > >
> > > Can we get either an "Acked-by:" or "Reviewed-by:"?
> > > Then we can use this while applying.
> Sorry, forgot that.
> Reviewed-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>

Thanks, patch is now pushed to drm-misc-next.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
