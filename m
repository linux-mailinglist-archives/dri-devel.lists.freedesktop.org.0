Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCCB403FD3
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 21:31:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 987FE6E28B;
	Wed,  8 Sep 2021 19:31:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E4CF6E28B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Sep 2021 19:31:19 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 4fb18110-10db-11ec-a02a-0050568c148b;
 Wed, 08 Sep 2021 19:31:06 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 52FBB194BC4;
 Wed,  8 Sep 2021 21:31:08 +0200 (CEST)
Date: Wed, 8 Sep 2021 21:31:14 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Dea, Edmund J" <edmund.j.dea@intel.com>
Subject: Re: [PATCH 13/14] drm/kmb: Enable alpha blended second plane
Message-ID: <YTkPguPS+DR/uHXP@ravnborg.org>
References: <20210728003126.1425028-1-anitha.chrisanthus@intel.com>
 <20210728003126.1425028-13-anitha.chrisanthus@intel.com>
 <YQEHQ56Qwl0GzvKg@ravnborg.org>
 <BY5PR11MB41821BFC25FECD3D9834C7D58CEF9@BY5PR11MB4182.namprd11.prod.outlook.com>
 <YQjP1e+XrYrrsggB@ravnborg.org>
 <82bffd36-130a-48b3-69c2-20479daa35f5@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <82bffd36-130a-48b3-69c2-20479daa35f5@suse.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Wed, Sep 08, 2021 at 07:50:42PM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 03.08.21 um 07:10 schrieb Sam Ravnborg:
> > Hi Anitha,
> > 
> > On Mon, Aug 02, 2021 at 08:44:26PM +0000, Chrisanthus, Anitha wrote:
> > > Hi Sam,
> > > Thanks. Where should this go, drm-misc-fixes or drm-misc-next?
> > 
> > Looks like a drm-misc-next candidate to me.
> > I may improve something for existing users, but it does not look like it
> > fixes an existing bug.
> 
> I found this patch in drm-misc-fixes, although it doesn't look like a
> bugfix. It should have gone into drm-misc-next. See [1]. If it indeed
> belongs into drm-misc-fixes, it certainly should have contained a Fixes tag.

The patch fixes some warnings that has become errors the last week.
Anitha pinged me about it, but I failed to followup. So in the end it
was applied to shut up the warning => errors.

	Sam
