Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8EE65F2EA
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 18:38:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82FD410E7E2;
	Thu,  5 Jan 2023 17:38:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F21A10E7E2
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 17:38:54 +0000 (UTC)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-4a2f8ad29d5so186507927b3.8
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jan 2023 09:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uOrfDvmeT1k8/iecK4WdGeuFMbQ0QL961xKN6yPWvEw=;
 b=obEzLP3KOiTtjSY2OLhghsjICt2PftWMaz2z2u1ovsZzev76vvOHQ7fqixQUfqYySJ
 dCHmXN7fgxHTBhSbBNT+UZlNFpQY8JohxFn1pvAtuImAp8tMWe95a2kClj7kANWItk8n
 F5sL7amOwNsVVUJgqdwDRBUZTsMzxDJ3wiikL/ZqQt27D1a+ABwMhD4x29K3ENTFAnyp
 OzrH/EtYDs6bJ1BxO36kQYrRWJZtetvNb/pyVWmettub90Z8PcRFKpRRbSUkHoLYwOUG
 3xMuD9ESVNKMLVwIMyoGVURe4PRz8LOVv+yWlqclnwAVdcvnlEtMuwpdvhwfNhodd3G3
 ks/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uOrfDvmeT1k8/iecK4WdGeuFMbQ0QL961xKN6yPWvEw=;
 b=21lRYBLn8VeqAjbBqPnrXHf+baLYo6W4o1mLArY4kJB/ydA1bhzaaNtAi66WbsKhzg
 JgpuiWiZ268oxFNxOH/zUBdLWDiKimUfJbjMfFjmx2SYRV0dQAp672KcHYqnTOJLZ3FD
 1r1A5M2Rbfww7Q8s1l4cnnOh+HUsar/d9tDls7AZBKm3USQVDlmKls71/IXYpel0fN/u
 MQhOXitWZyqfcobewxk1Rwt8A85b8rjtFoB/GnsES/PlVPcVUeKXVv2iDNR7uQBuBbKd
 don0m7VeDa7LDHG5vedmK0SKHSNjzO3hVWal1xYMSqVB/mxdIGRSa+PDHKTMyWx6Olmu
 +bBQ==
X-Gm-Message-State: AFqh2koFesx1qTyA+RFv3DDAvipZF5Htj32s5pEhqIGW468jQ+Dcr94E
 XNq6iY3OBHsVUx+ZylKPjhMFXcVMuPfh45JpO24=
X-Google-Smtp-Source: AMrXdXtwNZKfpqQhGa0G6hDldraDUA7CkACPXnIgPdLuz/vT8Qj/deifpls7K8tdfdhsi4VMo/NIkTBKlbyHl1cGMH0=
X-Received: by 2002:a0d:d609:0:b0:459:ef5d:529c with SMTP id
 y9-20020a0dd609000000b00459ef5d529cmr8946812ywd.211.1672940333038; Thu, 05
 Jan 2023 09:38:53 -0800 (PST)
MIME-Version: 1.0
References: <20221208110733.5498-1-jacek.lawrynowicz@linux.intel.com>
 <20221208110733.5498-2-jacek.lawrynowicz@linux.intel.com>
 <Y7bJLkXF7xFYX4Qe@phenom.ffwll.local>
 <ff231f90-9b67-7f47-b543-e8194f3cdec6@quicinc.com>
In-Reply-To: <ff231f90-9b67-7f47-b543-e8194f3cdec6@quicinc.com>
From: Oded Gabbay <oded.gabbay@gmail.com>
Date: Thu, 5 Jan 2023 19:38:26 +0200
Message-ID: <CAFCwf13uupxNxc+Ru3zEa_Wn1asJ9UgpnyDgyFQKhEPC8qVtbQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] accel/ivpu: Introduce a new DRM driver for Intel
 VPU
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
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
 dri-devel@lists.freedesktop.org, stanislaw.gruszka@linux.intel.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>, tzimmermann@suse.de,
 andrzej.kacprowski@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 5, 2023 at 6:25 PM Jeffrey Hugo <quic_jhugo@quicinc.com> wrote:
>
> On 1/5/2023 5:57 AM, Daniel Vetter wrote:
> > On Thu, Dec 08, 2022 at 12:07:27PM +0100, Jacek Lawrynowicz wrote:
> >> +static const struct drm_driver driver = {
> >> +    .driver_features = DRIVER_GEM | DRIVER_COMPUTE_ACCEL,
> >
> > So I was wondering whether this is a bright idea, and whether we shouldn't
> > just go ahead and infuse more meaning into accel vs render nodes.
> >
> > The uapi relevant part of render nodes is that they're multi-user safe, at
> > least as much as feasible. Every new open() gives you a new private
> > accelerator. This also has implications on how userspace drivers iterate
> > them, they just open them all in turn and check whether it's the right
> > one - because userspace apis allow applications to enumerate them all.
> > Which also means that any devicie initialization at open() time is a
> > really bad idea.
> >
> > A lot of the compute accelerators otoh (well habanalabs) are single user,
> > init can be done at open() time because you only open this when you
> > actually know you're going to use it.
> >
> > So given this, shouldn't multi-user inference engines be more like render
> > drivers, and less like accel? So DRIVER_RENDER, but still under
> > drivers/accel.
> >
> > This way that entire separate /dev node would actually become meaningful
> > beyond just the basic bikeshed:
> > - render nodes are multi user, safe to iterate and open() just for
> >    iteration
> > - accel nodes are single user, you really should not ever open them unless
> >    you want to use them
> >
> > Of course would need a doc patch :-)
> >
> > Thoughts?
> > -Daniel
>
> Hmm.
>
> I admit, I thought DRIVER_ACCEL was the same as DRIVER_RENDER, except
> that DRIVER_ACCEL dropped the "legacy" dual node setup and also avoided
> "legacy" userspace.
>
> qaic is multi-user.  I thought habana was the same, at-least for
> inference.  Oded, am I wrong?
Habana's devices support a single user at a time acquiring the device
and working on it.
Both for training and inference.
>
> So, if DRIVER_ACCEL is for single-user (training?), and multi-user ends
> up in DRIVER_RENDER, that would seem to mean qaic ends up using
> DRIVER_RENDER and not DRIVER_ACCEL.  Then qaic ends up over under
> /dev/dri with both a card node (never used) and a render node.  That
> would seem to mean that the "legacy" userspace would open qaic nodes by
> default - something I understood Oded was trying to avoid.
>
> If there really a usecase for DRIVER_ACCEL to support single-user?  I
> wonder why we can't default to multi-user, and if a particular
> user/driver has a single-user usecase, it enforces that in a driver
> specific manner?
>
> -Jeff

Honestly, Daniel, I don't like this suggestion. I don't understand why
you make a connection between render/accel to single/multi user.

As Jeff has said, one of the goals was to expose accelerator devices
to userspace with new device char nodes so we won't be bothered by
legacy userspace graphics software. This is something we all agreed on
and I don't see why we should change it now, even if you think it's
bike-shedding (which I disagree with).

But in any case, creating a new device char nodes had nothing to do
with whether the device supports single or multi user. I can
definitely see in the future training devices that support multiple
users.

The common drm/accel ioctls should of course not be limited to a
single user, and I agree with Jeff here, if a specific driver has such
a limitation (e.g. Habana), then that driver should handle it on its
own.
Maybe if there will be multiple drivers with such a limitation, we can
make that "handling" to be common code.

Bottom line, I prefer we keep things as we all agreed upon in LPC.

Oded
