Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B461165FE6C
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 10:56:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1272910E84C;
	Fri,  6 Jan 2023 09:56:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A318E10E84C
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 09:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672998998; x=1704534998;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=IcXgErQEEVpD8dnUPPzeckeTWkgbJvwmFe3Dz70ZSkg=;
 b=ApxDdnkPckIC6VHf0qHoDJ8RNUMIbBL99jUBo6ujJY9y2hvreJB41oOt
 brLdyN8N3wF/Vb96MbRUsbn0dAX/NO9UFimFOQo92FcX2cCwyU7V17LIf
 QmbW2JmFsBTUnWYPmG1Ql95tuZwA1YjSPy23zA4n8MJOMrlvDHiO2rSQa
 tRXVHBooF5M7HjBkfffHiZoYJrZD7H4ABxrvczWlTlmTRz1HR7o0ISZXt
 sp8MjhS2Vca6tgRSGtaqTjiHlbU7MStihWS0zVC/pkzirksFODhrfdAfR
 vkJjWoo8gTHMMgmbY1UIuhupjFbt5loGmMuHDyzTN0dSO8lQOnXrr+UCM A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10581"; a="321151378"
X-IronPort-AV: E=Sophos;i="5.96,304,1665471600"; d="scan'208";a="321151378"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2023 01:56:38 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10581"; a="901239953"
X-IronPort-AV: E=Sophos;i="5.96,304,1665471600"; d="scan'208";a="901239953"
Received: from joe-255.igk.intel.com (HELO localhost) ([172.22.229.67])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2023 01:56:36 -0800
Date: Fri, 6 Jan 2023 10:56:34 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v4 1/7] accel/ivpu: Introduce a new DRM driver for Intel
 VPU
Message-ID: <20230106095634.GB1586324@linux.intel.com>
References: <20221208110733.5498-1-jacek.lawrynowicz@linux.intel.com>
 <20221208110733.5498-2-jacek.lawrynowicz@linux.intel.com>
 <Y7bJLkXF7xFYX4Qe@phenom.ffwll.local>
 <ff231f90-9b67-7f47-b543-e8194f3cdec6@quicinc.com>
 <CAFCwf13uupxNxc+Ru3zEa_Wn1asJ9UgpnyDgyFQKhEPC8qVtbQ@mail.gmail.com>
 <Y7fpr69AXYYo2O25@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y7fpr69AXYYo2O25@phenom.ffwll.local>
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
Cc: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, dri-devel@lists.freedesktop.org,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>, tzimmermann@suse.de,
 andrzej.kacprowski@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 06, 2023 at 10:28:15AM +0100, Daniel Vetter wrote:
> On Thu, Jan 05, 2023 at 07:38:26PM +0200, Oded Gabbay wrote:
> > On Thu, Jan 5, 2023 at 6:25 PM Jeffrey Hugo <quic_jhugo@quicinc.com> wrote:
> > >
> > > On 1/5/2023 5:57 AM, Daniel Vetter wrote:
> > > > On Thu, Dec 08, 2022 at 12:07:27PM +0100, Jacek Lawrynowicz wrote:
> > > >> +static const struct drm_driver driver = {
> > > >> +    .driver_features = DRIVER_GEM | DRIVER_COMPUTE_ACCEL,
> > > >
> > > > So I was wondering whether this is a bright idea, and whether we shouldn't
> > > > just go ahead and infuse more meaning into accel vs render nodes.
> > > >
> > > > The uapi relevant part of render nodes is that they're multi-user safe, at
> > > > least as much as feasible. Every new open() gives you a new private
> > > > accelerator. This also has implications on how userspace drivers iterate
> > > > them, they just open them all in turn and check whether it's the right
> > > > one - because userspace apis allow applications to enumerate them all.
> > > > Which also means that any devicie initialization at open() time is a
> > > > really bad idea.
> > > >
> > > > A lot of the compute accelerators otoh (well habanalabs) are single user,
> > > > init can be done at open() time because you only open this when you
> > > > actually know you're going to use it.
> > > >
> > > > So given this, shouldn't multi-user inference engines be more like render
> > > > drivers, and less like accel? So DRIVER_RENDER, but still under
> > > > drivers/accel.
> > > >
> > > > This way that entire separate /dev node would actually become meaningful
> > > > beyond just the basic bikeshed:
> > > > - render nodes are multi user, safe to iterate and open() just for
> > > >    iteration
> > > > - accel nodes are single user, you really should not ever open them unless
> > > >    you want to use them
> > > >
> > > > Of course would need a doc patch :-)
> > > >
> > > > Thoughts?
> > > > -Daniel
> > >
> > > Hmm.
> > >
> > > I admit, I thought DRIVER_ACCEL was the same as DRIVER_RENDER, except
> > > that DRIVER_ACCEL dropped the "legacy" dual node setup and also avoided
> > > "legacy" userspace.
> > >
> > > qaic is multi-user.  I thought habana was the same, at-least for
> > > inference.  Oded, am I wrong?
> > Habana's devices support a single user at a time acquiring the device
> > and working on it.
> > Both for training and inference.
> > >
> > > So, if DRIVER_ACCEL is for single-user (training?), and multi-user ends
> > > up in DRIVER_RENDER, that would seem to mean qaic ends up using
> > > DRIVER_RENDER and not DRIVER_ACCEL.  Then qaic ends up over under
> > > /dev/dri with both a card node (never used) and a render node.  That
> > > would seem to mean that the "legacy" userspace would open qaic nodes by
> > > default - something I understood Oded was trying to avoid.
> > >
> > > If there really a usecase for DRIVER_ACCEL to support single-user?  I
> > > wonder why we can't default to multi-user, and if a particular
> > > user/driver has a single-user usecase, it enforces that in a driver
> > > specific manner?
> > >
> > > -Jeff
> > 
> > Honestly, Daniel, I don't like this suggestion. I don't understand why
> > you make a connection between render/accel to single/multi user.
> > 
> > As Jeff has said, one of the goals was to expose accelerator devices
> > to userspace with new device char nodes so we won't be bothered by
> > legacy userspace graphics software. This is something we all agreed on
> > and I don't see why we should change it now, even if you think it's
> > bike-shedding (which I disagree with).
> > 
> > But in any case, creating a new device char nodes had nothing to do
> > with whether the device supports single or multi user. I can
> > definitely see in the future training devices that support multiple
> > users.
> > 
> > The common drm/accel ioctls should of course not be limited to a
> > single user, and I agree with Jeff here, if a specific driver has such
> > a limitation (e.g. Habana), then that driver should handle it on its
> > own.
> > Maybe if there will be multiple drivers with such a limitation, we can
> > make that "handling" to be common code.
> > 
> > Bottom line, I prefer we keep things as we all agreed upon in LPC.
> 
> The problem is going to happen as soon as you have cross-vendor userspace.
> Which I'm kinda hoping is at least still the aspiration. Because with
> cross-vendor userspace you generally iterate & open all devices before you
> select the one you're going to use. And so we do kinda need a distinction,
> or we need that the single-user drivers also guarantee that open() is
> cheap.

FWIW we had good support in ivpu for probe open's in form of lazy context
allocation. It was removed recently due to review feedback that this is
unnecessary, but we can add it back.

Regards
Stanislaw

