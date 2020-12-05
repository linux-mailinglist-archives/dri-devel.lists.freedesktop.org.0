Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D342CFEA0
	for <lists+dri-devel@lfdr.de>; Sat,  5 Dec 2020 20:59:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED53889FCA;
	Sat,  5 Dec 2020 19:59:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6F3F89FCA
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Dec 2020 19:59:39 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 560CA804C8;
 Sat,  5 Dec 2020 20:59:36 +0100 (CET)
Date: Sat, 5 Dec 2020 20:59:35 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>
Subject: Re: [PATCH] drm/kmb: fix array bounds warning
Message-ID: <20201205195935.GJ332836@ravnborg.org>
References: <20201129200927.1854104-1-arnd@kernel.org>
 <BY5PR11MB4182B94E480EFACBF817DFFF8CF50@BY5PR11MB4182.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BY5PR11MB4182B94E480EFACBF817DFFF8CF50@BY5PR11MB4182.namprd11.prod.outlook.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Itgwjo3g c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=7gkXJVJtAAAA:8
 a=e5mUnYsNAAAA:8 a=XabvsrOi_kiJB9eJBZMA:9 a=CjuIK1q_8ugA:10
 a=AjGcO6oz07-iQ99wixmX:22 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Arnd Bergmann <arnd@kernel.org>, lkp <lkp@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>, "Dea,
 Edmund J" <edmund.j.dea@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Anitha,
On Mon, Nov 30, 2020 at 10:19:13PM +0000, Chrisanthus, Anitha wrote:
> Hi Arnd,
> Thanks for your patch.
> 
> > -----Original Message-----
> > From: Arnd Bergmann <arnd@kernel.org>
> > Sent: Sunday, November 29, 2020 12:09 PM
> > To: Chrisanthus, Anitha <anitha.chrisanthus@intel.com>; Dea, Edmund J
> > <edmund.j.dea@intel.com>; David Airlie <airlied@linux.ie>; Daniel Vetter
> > <daniel@ffwll.ch>; Sam Ravnborg <sam@ravnborg.org>
> > Cc: Arnd Bergmann <arnd@arndb.de>; lkp <lkp@intel.com>; dri-
> > devel@lists.freedesktop.org; linux-kernel@vger.kernel.org
> > Subject: [PATCH] drm/kmb: fix array bounds warning
> > 
> > From: Arnd Bergmann <arnd@arndb.de>
> > 
> > gcc warns about an out-of-bounds access when the using nonzero
> > values for 'plane_id' on kmb->plane_status:
...

> Looks good.
> 
> Reviewed-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>

You wanted a little time to get comforable with dim, so I picked up this
patch and pushed it to drm-misc-next.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
