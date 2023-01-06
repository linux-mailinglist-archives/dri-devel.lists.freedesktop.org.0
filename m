Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DB865FDF8
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 10:28:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34FE110E83F;
	Fri,  6 Jan 2023 09:28:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 179B810E83F
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 09:28:20 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 b24-20020a05600c4a9800b003d21efdd61dso666658wmp.3
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Jan 2023 01:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rnov1WfdAhRJG++TveVXoq2UpnKNMOhdUJFCRkERo3g=;
 b=YswxTB3idFw3Qbotg4YKIEXNBJ9W9+7R3I4IhNPPCF6c1NPLjJv1tniVE3k2X/lmys
 12BNRocUHA4Jw1WfOrlrv/DemENOw2M9p8bRwKg5xk8BAq7wi6QatEO/a5S0T35eSN38
 bjVKfBWtSXsV5C1GURkjOdegEThRmOozQEe2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rnov1WfdAhRJG++TveVXoq2UpnKNMOhdUJFCRkERo3g=;
 b=KLsbCLuF9l+QRZqaY3vBu4gV18O8OVqEQkCQ4JHcwAjvYVqZUbeVS8c3eFTZ0KOrdZ
 P9PwGgW42Wgw5hHXUtf/G5WD/dyInzGEOq8xnGBzwCD6IN23XBVdIunKGXIIowjxdcOA
 fydBqF/BHCRhsDUAZ8zqHNIiAY3ALG2St/Y/U7QPLqvFP8qzBg4ieYgKfrtWCaXfqVxz
 KEQnxZuK94UH2WR44ihL7sxppTZx8nSrsZ3Ep2PeyiMpOf0+Zc2IKfg2qhPlfXYYbsms
 m0KSoaiHaZKFEvhNDhFJuxJjhSavRycXAe1REHNGLWfDXJQJCREUQ4D2VKHX0aks0A2d
 9hiA==
X-Gm-Message-State: AFqh2kpJ23c49U3UrGLA7MiPpTGOoh9ZB38XLAOAFR1YSuphCsubsAbd
 FX44zOpp21cHO1fYm3dCC88ocw==
X-Google-Smtp-Source: AMrXdXsZVPCuAXPksJPN0vdJVSYRw2jjO7xoE3ZfKaPVA5zhC6HIqrCiudrUja/YKlsxbHyixZhLkA==
X-Received: by 2002:a05:600c:6d3:b0:3cf:e91d:f263 with SMTP id
 b19-20020a05600c06d300b003cfe91df263mr41877872wmn.4.1672997298421; 
 Fri, 06 Jan 2023 01:28:18 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 r10-20020a05600c458a00b003d35acb0fd7sm5949827wmo.34.2023.01.06.01.28.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 01:28:17 -0800 (PST)
Date: Fri, 6 Jan 2023 10:28:15 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Oded Gabbay <oded.gabbay@gmail.com>
Subject: Re: [PATCH v4 1/7] accel/ivpu: Introduce a new DRM driver for Intel
 VPU
Message-ID: <Y7fpr69AXYYo2O25@phenom.ffwll.local>
References: <20221208110733.5498-1-jacek.lawrynowicz@linux.intel.com>
 <20221208110733.5498-2-jacek.lawrynowicz@linux.intel.com>
 <Y7bJLkXF7xFYX4Qe@phenom.ffwll.local>
 <ff231f90-9b67-7f47-b543-e8194f3cdec6@quicinc.com>
 <CAFCwf13uupxNxc+Ru3zEa_Wn1asJ9UgpnyDgyFQKhEPC8qVtbQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFCwf13uupxNxc+Ru3zEa_Wn1asJ9UgpnyDgyFQKhEPC8qVtbQ@mail.gmail.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
 stanislaw.gruszka@linux.intel.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>, tzimmermann@suse.de,
 andrzej.kacprowski@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 05, 2023 at 07:38:26PM +0200, Oded Gabbay wrote:
> On Thu, Jan 5, 2023 at 6:25 PM Jeffrey Hugo <quic_jhugo@quicinc.com> wrote:
> >
> > On 1/5/2023 5:57 AM, Daniel Vetter wrote:
> > > On Thu, Dec 08, 2022 at 12:07:27PM +0100, Jacek Lawrynowicz wrote:
> > >> +static const struct drm_driver driver = {
> > >> +    .driver_features = DRIVER_GEM | DRIVER_COMPUTE_ACCEL,
> > >
> > > So I was wondering whether this is a bright idea, and whether we shouldn't
> > > just go ahead and infuse more meaning into accel vs render nodes.
> > >
> > > The uapi relevant part of render nodes is that they're multi-user safe, at
> > > least as much as feasible. Every new open() gives you a new private
> > > accelerator. This also has implications on how userspace drivers iterate
> > > them, they just open them all in turn and check whether it's the right
> > > one - because userspace apis allow applications to enumerate them all.
> > > Which also means that any devicie initialization at open() time is a
> > > really bad idea.
> > >
> > > A lot of the compute accelerators otoh (well habanalabs) are single user,
> > > init can be done at open() time because you only open this when you
> > > actually know you're going to use it.
> > >
> > > So given this, shouldn't multi-user inference engines be more like render
> > > drivers, and less like accel? So DRIVER_RENDER, but still under
> > > drivers/accel.
> > >
> > > This way that entire separate /dev node would actually become meaningful
> > > beyond just the basic bikeshed:
> > > - render nodes are multi user, safe to iterate and open() just for
> > >    iteration
> > > - accel nodes are single user, you really should not ever open them unless
> > >    you want to use them
> > >
> > > Of course would need a doc patch :-)
> > >
> > > Thoughts?
> > > -Daniel
> >
> > Hmm.
> >
> > I admit, I thought DRIVER_ACCEL was the same as DRIVER_RENDER, except
> > that DRIVER_ACCEL dropped the "legacy" dual node setup and also avoided
> > "legacy" userspace.
> >
> > qaic is multi-user.  I thought habana was the same, at-least for
> > inference.  Oded, am I wrong?
> Habana's devices support a single user at a time acquiring the device
> and working on it.
> Both for training and inference.
> >
> > So, if DRIVER_ACCEL is for single-user (training?), and multi-user ends
> > up in DRIVER_RENDER, that would seem to mean qaic ends up using
> > DRIVER_RENDER and not DRIVER_ACCEL.  Then qaic ends up over under
> > /dev/dri with both a card node (never used) and a render node.  That
> > would seem to mean that the "legacy" userspace would open qaic nodes by
> > default - something I understood Oded was trying to avoid.
> >
> > If there really a usecase for DRIVER_ACCEL to support single-user?  I
> > wonder why we can't default to multi-user, and if a particular
> > user/driver has a single-user usecase, it enforces that in a driver
> > specific manner?
> >
> > -Jeff
> 
> Honestly, Daniel, I don't like this suggestion. I don't understand why
> you make a connection between render/accel to single/multi user.
> 
> As Jeff has said, one of the goals was to expose accelerator devices
> to userspace with new device char nodes so we won't be bothered by
> legacy userspace graphics software. This is something we all agreed on
> and I don't see why we should change it now, even if you think it's
> bike-shedding (which I disagree with).
> 
> But in any case, creating a new device char nodes had nothing to do
> with whether the device supports single or multi user. I can
> definitely see in the future training devices that support multiple
> users.
> 
> The common drm/accel ioctls should of course not be limited to a
> single user, and I agree with Jeff here, if a specific driver has such
> a limitation (e.g. Habana), then that driver should handle it on its
> own.
> Maybe if there will be multiple drivers with such a limitation, we can
> make that "handling" to be common code.
> 
> Bottom line, I prefer we keep things as we all agreed upon in LPC.

The problem is going to happen as soon as you have cross-vendor userspace.
Which I'm kinda hoping is at least still the aspiration. Because with
cross-vendor userspace you generally iterate & open all devices before you
select the one you're going to use. And so we do kinda need a distinction,
or we need that the single-user drivers also guarantee that open() is
cheap.

With just habana and vpu there's no problem because you'll never see
these in the same machine.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
