Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFD225B452
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 21:17:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDD896E03E;
	Wed,  2 Sep 2020 19:17:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B37236E03E;
 Wed,  2 Sep 2020 19:17:09 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id m6so608537wrn.0;
 Wed, 02 Sep 2020 12:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FTnbkSzz7kgNqg10h1VZ+YH+sXeE+6E0Z8N+CzppCK4=;
 b=OrtlTH1vWTZM82gTsJagIp8Kk/kE4o4MJ6/lwQmjmhg+G0A1rQFZ1X6MdYmKjscnBZ
 SHdAAqThSsoxX8XzDSeMh+B3UDxF5ljwRYnjBc/xjy7JMKgfWUtDf+avU8SwuAJw23/3
 bOTwBZkAJPjFiK+XYZo9DUx7E9SCJ8K337xL0vA0PSqsPrGwoBeYjXth4Wlecrh7uu1a
 0Ey6LnegTGMheJCtodXX+/WsosOPInl9JQWswIzR/2Gv2aklbZCe3cVPMBOl7e2GdGCo
 B8JitdZnfw4EP7vibdhNgVGZozahLifVFipWaUuVd/iUgfDM2cI7HMsIsIe6bcbfnsmo
 TqsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FTnbkSzz7kgNqg10h1VZ+YH+sXeE+6E0Z8N+CzppCK4=;
 b=QcV0AjaZVBcYN3rm8269SZReJS5qKwCQy5KInDm/7AuFgiBDmClnzZ21vvVRyQKPII
 i4EiWCj5bEdtJ4XtjVGZH1wc512Z31udiAW6ekNBbflh8PwY3iDTsYr4Q+krA0tV8ds4
 IccNSjmUA1UK9OrY0UxU1C01+TRBcO/ahIvO/KXUoBwzUPJNMgzspQG1gm5pXQ/seV3W
 mFkJUtITHJs8HRSbYgltXIII5h/2Q8ey9cdVy6ChAGIzOwo7Pk6wStIBsh4m+BbKOaKk
 CzvCuF76naAye0vUjIDp7yC04lpC/ePENx0F3qKdqo/d4j5VdPeCmVELoL2deYDzVvTm
 swMg==
X-Gm-Message-State: AOAM531tRbk6QIeVnVhVu1bqeehOM+6p7MZv7zbgeknxVjxbxXOz/TJ7
 JzngYvpPwY4D9EQ4gmfG4Gdf+7E5Jy/sQVIfJZg=
X-Google-Smtp-Source: ABdhPJznnYrFqcj0QOXSuQDBIuUEtC1JsxJFOnLp44BB8VlY3BmbTp8++4zIOs/dJiOaZxrZf4jt5rAaIVecd9NzF30=
X-Received: by 2002:adf:ef0a:: with SMTP id e10mr8474670wro.362.1599074228346; 
 Wed, 02 Sep 2020 12:17:08 -0700 (PDT)
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
In-Reply-To: <fc9b026c-e7d8-3cf6-92e8-7ef0c389e36c@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 2 Sep 2020 15:16:57 -0400
Message-ID: <CADnq5_PFuhe87tDuB7TMWOrYzo0O==UYJfqyauXK6Mmd7tFVpg@mail.gmail.com>
Subject: Re: [PATCH 0/3] Use implicit kref infra
To: Luben Tuikov <luben.tuikov@amd.com>
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 2, 2020 at 3:04 PM Luben Tuikov <luben.tuikov@amd.com> wrote:
>
> On 2020-09-02 11:51 a.m., Daniel Stone wrote:
> > Hi Luben,
> >
> > On Wed, 2 Sep 2020 at 16:16, Luben Tuikov <luben.tuikov@amd.com> wrote:
> >> Not sure how I can do this when someone doesn't want to read up on
> >> the kref infrastructure. Can you help?
> >>
> >> When someone starts off with "My understanding of ..." (as in the OP) you know you're
> >> in trouble and in for a rough times.
> >>
> >> Such is the nature of world-wide open-to-everyone mailing lists where
> >> anyone can put forth an argument, regardless of their level of understanding.
> >> The more obfuscated an argument, the more uncertainty.
> >>
> >> If one knows the kref infrastructure, it just clicks, no explanation
> >> necessary.
> >
> > Evidently there are more points of view than yours. Evidently your
> > method of persuasion is also not working, because this thread is now
> > getting quite long and not converging on your point of view (which you
> > are holding to be absolutely objectively correct).
> >
> > I think you need to re-evaluate the way in which you speak to people,
> > considering that it costs nothing to be polite and considerate, and
> > also takes effort to be rude and dismissive.
>
> Not sure how to help this:
>
> > My understanding of the drm core code is like something below.
> > struct B {
> >       strcut A
> > }
> > we initialize A firstly and initialize B in the end. But destroy B firstly and destory A in the end.
>

Luben, please tone it down a bit.  You are coming across very harshly.
You do make a good point though.  What is the point of having the drm
release callback if it's ostensibly useless?  We should either use it
as intended to release the structures allocated by the driver or the
drm core should handle it all.  With the managed resources there is an
incongruity between allocation and freeing which leads to confusion.
Even with the proposed updated documentation, it's not clear to me who
should use the managed resources or not.  My understanding was that it
was optional for drivers that wanted it.

Alex
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
