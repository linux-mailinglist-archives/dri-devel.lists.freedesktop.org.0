Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C066029D9
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 13:06:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99B7510E69A;
	Tue, 18 Oct 2022 11:06:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41B8510E69A
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 11:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666091205; x=1697627205;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=UwAX34Op19tFRg7S0n6wgOC8pOT0c3ngVDWJiuz+AHw=;
 b=OVmAc7RqUvfx8TkIsqi8/OBXLdHHMtjK56dSG+eLbaD9gLI8GYHquhwN
 GkMaor1KRcsbtiXRQsCfUReZktTB4skY3b9qc503R/Hg/MtUD/e84EcXu
 S1gvUgC5jfPlzvGB7Is0WS/PNlzgqsfhv5eOv34wXG9YfwDkf2YRy8h1B
 NgsiBt1b3Mfx5KUKjL1f2UWB/gjNAnv0511daUhA6edH2pxiL0RyeNX/M
 WloqKAAZEJ7HtzxrQt0tL5cmvHf0r/fgy67Hr+2J4HeVVXQ71p7q+fwPR
 8M6X8dtMUPjyHb/q2n66MNtfOKr3k6mCeP3tq5pZOHBJhoRX+PThgEwuK g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="332614074"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="332614074"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 04:06:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="659742110"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="659742110"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by orsmga008.jf.intel.com with SMTP; 18 Oct 2022 04:06:41 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 18 Oct 2022 14:06:40 +0300
Date: Tue, 18 Oct 2022 14:06:40 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@redhat.com>
Subject: Re: [PATCH 1/2] Revert "drm: hide unregistered connectors from
 GETCONNECTOR IOCTL"
Message-ID: <Y06IwB5jxyvgwe9c@intel.com>
References: <20221017153150.60675-1-contact@emersion.fr>
 <Y05uYUPoYB25JVpX@intel.com> <Y05xdzMB51BnEw9U@redhat.com>
 <Y0543Y/iiZC6Bdw1@intel.com> <Y05671TEjdLcQyXj@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y05671TEjdLcQyXj@redhat.com>
X-Patchwork-Hint: comment
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
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 18, 2022 at 12:07:43PM +0200, Jonas Ådahl wrote:
> On Tue, Oct 18, 2022 at 12:58:53PM +0300, Ville Syrjälä wrote:
> > On Tue, Oct 18, 2022 at 11:27:19AM +0200, Jonas Ådahl wrote:
> > > On Tue, Oct 18, 2022 at 12:14:09PM +0300, Ville Syrjälä wrote:
> > > > On Mon, Oct 17, 2022 at 03:31:57PM +0000, Simon Ser wrote:
> > > > > This reverts commit 981f09295687f856d5345e19c7084aca481c1395.
> > > > > 
> > > > > It turns out this breaks Mutter.
> > > > 
> > > > A bit more detail would be a good to help future archaeologists.
> > > 
> > > Perhaps a better explanation is
> > > 
> > > It turns out this causes logically active but disconnected MST display
> > > port connectors to disappear from the drmModeGetResources() list,
> > 
> > That was the whole point was it not? So I'd drop the
> > "it turns out" part.
> > 
> > > meaning userspace is made to believe the connector is already disabled.
> > 
> > That wording to me implies its a generic issue affecting all
> > userspace when so far it looks like only mutter is affected.
> 
> Maybe other userspace was? I only found out by testing drm-next, and
> only tried using mutter when bisecting.
> 
> > So apparently mutter (for some reason) assumes that the
> > connector has somehow magically been disabled by someone
> > else if it disappears from the list of resources?
> 
> Mutter makes the assumption that connectors it can interact with are the
> ones that drmModeGetResources() return

I agree that on the face of it that assumption does seem
perfectly reasonable.

> - nothing magic about that.

Well it's expecting a bit magic from the kernel if it decides
that it doesn't need to disable what it already enabled.
But I guess it's more of a case that the code just never
expected this specific situation to happen, and thus the
results are what they are.

I suppose the only concern with the change is what happens
when you replug something back in before the old stuff has
disappeared and you now have two connectors for the same
thing on the list. IIRC the ddxen at least try to reuse
the same xrandr output for the connector when the path
prop matches. I suspect it might work by accident due
to the new connector appearing (hopefully) later in the
list than the old connector. But would probably need to
test this to make sure.

-- 
Ville Syrjälä
Intel
