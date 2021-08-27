Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA2D3F9655
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 10:40:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 572716E901;
	Fri, 27 Aug 2021 08:40:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D48206E901
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 08:40:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 80FC560F4F;
 Fri, 27 Aug 2021 08:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1630053628;
 bh=j/bvC5ghBJKRq1Y0rmHnVmWVXt7Kc05XHMvwhHOP9Es=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=c3/5ArBKyvqeoQb72FJuhHyh4O1iEIWOt1vqhP8VrZYyH1J5D2OvZf/Pbk0FKbkkb
 wQnhuuqjzHFXGXwoWeIVCrA/MRChK3q5yFN466Eh7ursILaPuDb0SDC8U8Zw5QOKEK
 dbktH/WwZxP2QtUwz/9Ym88oskF37LEJ8dcGl5lA=
Date: Fri, 27 Aug 2021 10:40:21 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Subject: Re: [PATCH] MAINTAINERS: Add dri-devel for component.[hc]
Message-ID: <YSik9dwTUV/mnX3A@kroah.com>
References: <20210826091343.1039763-1-daniel.vetter@ffwll.ch>
 <YSdzWthRL+C9/LMN@kroah.com> <YSfuANJ2ULizWfO6@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YSfuANJ2ULizWfO6@phenom.ffwll.local>
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

On Thu, Aug 26, 2021 at 09:39:44PM +0200, Daniel Vetter wrote:
> On Thu, Aug 26, 2021 at 12:56:26PM +0200, Greg Kroah-Hartman wrote:
> > On Thu, Aug 26, 2021 at 11:13:43AM +0200, Daniel Vetter wrote:
> > > dri-devel is the main user, and somehow there's been the assumption
> > > that component stuff is unmaintained.
> > > 
> > > References: https://lore.kernel.org/dri-devel/CAAEAJfDWOzCJxZFNtxeT7Cvr2pWbYrfz-YnA81sVNs-rM=8n4Q@mail.gmail.com/
> > > Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > ---
> > >  MAINTAINERS | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > > 
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index ac58d0032abd..7cdc19815ec4 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -5707,6 +5707,11 @@ F:	Documentation/admin-guide/blockdev/
> > >  F:	drivers/block/drbd/
> > >  F:	lib/lru_cache.c
> > >  
> > > +DRIVER COMPONENT FRAMEWORK
> > > +L:	dri-devel@lists.freedesktop.org
> > > +F:	drivers/base/component.c
> > > +F:	include/linux/component.h
> > 
> > Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> Will you merge this through your tree? I think merging component patches
> through driver core makes sense (or topic branch or whatever) still. This
> is just so that there's a wider reviewer pool than just you & Rafael.

Sure, now merged in my tree.

thanks,

greg k-h
