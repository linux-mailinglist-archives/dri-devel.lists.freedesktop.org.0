Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B88F925B4F3
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 21:59:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36CC86E065;
	Wed,  2 Sep 2020 19:59:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc42.google.com (mail-oo1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 943D76E065
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 19:59:47 +0000 (UTC)
Received: by mail-oo1-xc42.google.com with SMTP id k63so160525oob.1
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Sep 2020 12:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YuD82sKNacp8kiMKG8DhrxLE+yDvscONc/5BDPmWsvE=;
 b=T7LTvXOOxhzGQD5p/KrUNj47PRrZdIANmulyq4bDU2pkJeWxey26msMkjzTkE34fko
 HTUyELmWH01QUcJQlqqcoIfg40dyAEFh7ALu1RZuJMDujawqgIXfWkjrJIpx55mUfD41
 ImALVxaWabXgpnC7HAsdoSAvDGF2yArafzNWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YuD82sKNacp8kiMKG8DhrxLE+yDvscONc/5BDPmWsvE=;
 b=XHePZqo9PBYfG64SVgaXskG/j0ZDIhEYX8si5axPZsh6z1AyArutPDvy/yK/30Bqxa
 LhYthndw98Yuhemaz1+rBWPlXE7G8UfXo+y+1pQ2XrBwsy5O7xsmxjKILSAQRT6ET4xH
 cflXBt8YZLooHWxd9+CW/JAFyUPSE81JM+8Pnjzpa4lkiXGn5DyzDS5jMqHT+Vum4aWi
 yzCsbkimxIFTJEVppQ0bVAmVVRkji0izV1RkYmXVsVuamxdc/6RWM9MItI6gWRvlMgWV
 5mg5sm2YlgetrDoo9wpvmjUOQWMxaBB2Pr12QZBXtyqnbuCpA7jgAnm3smgn5U0w9Qku
 F58Q==
X-Gm-Message-State: AOAM532uze7oSu432sjvpvszyKj+7NsxvzTQuzanzHLhEwa9AwqTrCJk
 Ddf5asV0CLUA5LjINzQw45vnG4wUe9oEZiROFvU2o1kyKrp8VL25
X-Google-Smtp-Source: ABdhPJzh5CRsojCYCUfjrwxuqSghrksXxkp77fC/0LxMhQF9Ifw1wd4PT4q0KYqKV2A7+glhk008iKbCIWg1j2Zis1s=
X-Received: by 2002:a4a:e98e:: with SMTP id s14mr6713378ood.28.1599076786830; 
 Wed, 02 Sep 2020 12:59:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200902010645.26943-1-luben.tuikov@amd.com>
 <BDD53312-3A34-4761-A7C3-6FDFE66A6C1F@amd.com>
 <e6916b3b-60cd-e223-4f87-478aab3b2468@amd.com>
 <62D0EAA9-E3AD-4FA7-AC24-9F5F9C594EB2@amd.com>
 <0f336bb9-5d78-30ed-d217-c5905d1dc08a@amd.com>
 <CAPj87rMRemGSZGoPV-BYrAZCK26aB-rFsKL6hVPRsha_850SXQ@mail.gmail.com>
 <20a86ddb-df88-225d-a33d-7feec82a46c2@amd.com>
 <CAPj87rMKNZfP1=kfsHPbRaJtHMAEKY+87p6uTAt=Hh76FwZVcw@mail.gmail.com>
 <fc9b026c-e7d8-3cf6-92e8-7ef0c389e36c@amd.com>
 <CADnq5_PFuhe87tDuB7TMWOrYzo0O==UYJfqyauXK6Mmd7tFVpg@mail.gmail.com>
 <CAKMK7uEoUpMZRG9ey-us_CPWm+wr1hYRJJOT35=vvdRQYBh+ng@mail.gmail.com>
In-Reply-To: <CAKMK7uEoUpMZRG9ey-us_CPWm+wr1hYRJJOT35=vvdRQYBh+ng@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 2 Sep 2020 21:59:35 +0200
Message-ID: <CAKMK7uF9VRE8yoZtf9DA2Pyzi0PmE0MNJAT57T_Z_PpB2GqTWg@mail.gmail.com>
Subject: Re: [PATCH 0/3] Use implicit kref infra
To: Alex Deucher <alexdeucher@gmail.com>
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Luben Tuikov <luben.tuikov@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 2, 2020 at 9:55 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, Sep 2, 2020 at 9:17 PM Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > On Wed, Sep 2, 2020 at 3:04 PM Luben Tuikov <luben.tuikov@amd.com> wrote:
> > >
> > > On 2020-09-02 11:51 a.m., Daniel Stone wrote:
> > > > Hi Luben,
> > > >
> > > > On Wed, 2 Sep 2020 at 16:16, Luben Tuikov <luben.tuikov@amd.com> wrote:
> > > >> Not sure how I can do this when someone doesn't want to read up on
> > > >> the kref infrastructure. Can you help?
> > > >>
> > > >> When someone starts off with "My understanding of ..." (as in the OP) you know you're
> > > >> in trouble and in for a rough times.
> > > >>
> > > >> Such is the nature of world-wide open-to-everyone mailing lists where
> > > >> anyone can put forth an argument, regardless of their level of understanding.
> > > >> The more obfuscated an argument, the more uncertainty.
> > > >>
> > > >> If one knows the kref infrastructure, it just clicks, no explanation
> > > >> necessary.
> > > >
> > > > Evidently there are more points of view than yours. Evidently your
> > > > method of persuasion is also not working, because this thread is now
> > > > getting quite long and not converging on your point of view (which you
> > > > are holding to be absolutely objectively correct).
> > > >
> > > > I think you need to re-evaluate the way in which you speak to people,
> > > > considering that it costs nothing to be polite and considerate, and
> > > > also takes effort to be rude and dismissive.
> > >
> > > Not sure how to help this:
> > >
> > > > My understanding of the drm core code is like something below.
> > > > struct B {
> > > >       strcut A
> > > > }
> > > > we initialize A firstly and initialize B in the end. But destroy B firstly and destory A in the end.
> > >
> >
> > Luben, please tone it down a bit.  You are coming across very harshly.
> > You do make a good point though.  What is the point of having the drm
> > release callback if it's ostensibly useless?  We should either use it
> > as intended to release the structures allocated by the driver or the
> > drm core should handle it all.  With the managed resources there is an
> > incongruity between allocation and freeing which leads to confusion.
> > Even with the proposed updated documentation, it's not clear to me who
> > should use the managed resources or not.  My understanding was that it
> > was optional for drivers that wanted it.
>
> In an ideal world this would all be perfectly clean. In reality we
> have huge existing drivers which, if at all feasible, can only be
> converted over step by step.
>
> So with that there's a few ways we can make this happen:
> - drmm resources are cleaned up before ->release is called. This means
> doing auto-cleanup of the final steps like cleanup up drm_device
> resources is gated on all drivers first being converted completely
> over to drmm, which is never going to happen. And it's holding up
> removing all the fairly simple cleanup code from small driver, which
> is where managed resources (whether drmm or devm) have the most
> benefit, often they completely eliminate the need for any explicit
> teardown code.
> - start in the middle. That just oopses because the unwind order isn't
> the inverse of the setup order anymore, and generally that's required.
> - start at the end. Unfortunately this means that the drm_device
> cannot be freed in the driver's ->release callback, therefore for
> transition purposes I had to sprinkle drmm_add_final_kfree all over
> the place. But if you use devm_drm_dev_alloc (like the updated docs
> recommend) that's not needed anymore, so really not an eyesore for
> driver developers.
>
> Yes there's mildly tricky code in the core as a result, but given that
> you guys wont volunteer to fix up the entire subsystem either we just
> have to live with that I think. Also, the commit adding the
> drm_managed stuff does explain these implementation details and the
> reasons why.

Also note that tons of stuff in drm doesn't yet provide drmm_
versions, teardown-less drivers really only works for really simple
ones. So completely getting rid of the ->release callback will also
need lots of core work, like the currently in-flight series to add
more drmm_ helpers for kms objects:

https://lore.kernel.org/dri-devel/20200827160545.1146-1-p.zabel@pengutronix.de/

Help obviously very much welcome.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
