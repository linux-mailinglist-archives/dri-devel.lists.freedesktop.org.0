Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0664AE09E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 19:22:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4276910E9DF;
	Tue,  8 Feb 2022 18:22:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 865B310E9B9
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 18:22:07 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 2ab33094-890c-11ec-ac19-0050568cd888;
 Tue, 08 Feb 2022 18:23:09 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 0133D194BAE;
 Tue,  8 Feb 2022 19:22:05 +0100 (CET)
Date: Tue, 8 Feb 2022 19:22:03 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: DRI Development <dri-devel@lists.freedesktop.org>,
 linux-fbdev@vger.kernel.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Helge Deller <deller@gmx.de>
Subject: Re: [PATCH 10/21] fb: Delete fb_info->queue
Message-ID: <YgK0y1S0PKb1E3RV@ravnborg.org>
References: <20220131210552.482606-1-daniel.vetter@ffwll.ch>
 <20220131210552.482606-11-daniel.vetter@ffwll.ch>
 <YfxJlH2NDnLk/GUw@ravnborg.org>
 <YgJ0OQxt4KIPD9uz@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YgJ0OQxt4KIPD9uz@phenom.ffwll.local>
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

Hi Daniel,

On Tue, Feb 08, 2022 at 02:46:33PM +0100, Daniel Vetter wrote:
> On Thu, Feb 03, 2022 at 10:31:00PM +0100, Sam Ravnborg wrote:
> > On Mon, Jan 31, 2022 at 10:05:41PM +0100, Daniel Vetter wrote:
> > > It was only used by fbcon, and that now switched to its own,
> > > private work.
> > > 
> > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > Cc: Helge Deller <deller@gmx.de>
> > > Cc: linux-fbdev@vger.kernel.org
> > I would merge this with the patch that drops the usage
> 
> Yeah, but I like to split these out so that if this does break something,
> it's much easier to revert. In case I overlooked something somewhere.
> 
> It's imo different if the cleanup is directly related to the preceeding
> prep work, but this is a generic workqueue, and the cursor logic is rather
> unrelated. And if I remember my history digging right, there were actually
> other uses of this.

So you basically say that because in the past there may have been other
users, this deserves a dedicated removal commit.

That works for me too.
Acked-by: Sam Ravnborg <sam@ravnborg.org>

	Sam
