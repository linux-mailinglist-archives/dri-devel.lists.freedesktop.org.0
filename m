Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D8220B04C
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 13:16:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D026EC6E;
	Fri, 26 Jun 2020 11:16:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CC6E6EC6E
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 11:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593170183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HkhDlOlW15GcjS67EXQs7c+Yrqk9uWab/aSSjGFcGHQ=;
 b=bSYaXgIRLmBL60VPIpXBQ0gFmPEVejP1Vxv7tGvsTsU/A29uw+N7dTnQ1Xk3ay4J73CL0R
 oH0lDxmGHKLs/ADzaWmtSXBfXi/gkIPx8msFGi6/aALr98kQ67Lmt2TrJq/PQ2dBiGPF1h
 mdsjFD07Rk/6W7mOgivuwMmdIp3FcpU=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-axHjHxNWNsq9XbW-qFGDcw-1; Fri, 26 Jun 2020 07:16:22 -0400
X-MC-Unique: axHjHxNWNsq9XbW-qFGDcw-1
Received: by mail-qt1-f198.google.com with SMTP id z26so6259796qto.15
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 04:16:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HkhDlOlW15GcjS67EXQs7c+Yrqk9uWab/aSSjGFcGHQ=;
 b=O7WhxwAH1e8QYjagKEXOlDQJhLG6GezzlnwQwXHtsKqWjrLeErRVjYrRbGTldPkZ5o
 w7174OfZJqRvl0LO8EMsHQvxmCDl+mUicuBE+qWL9SB6bXYdge3uiqNl5VkCblu31CCL
 N0j35TZ2Who5GyiiGcVsRNtGAP/DXQ+vo4WiQBvl6rSqKtrqXNghUu0MGBaqJ4TtKwOF
 JhkePOmu8Wx6Qu3CySPWItoM/zJ3gBb/i7ZMIKn1/UER/WYw+aU9t0pbuxh+HVNQQiIB
 GKmZp9PJuPXbtqyVwzgqVPtfDMeNa70/4QynrJlw7oMBXAIQn/mmoC1joUeK6Cg/11hh
 5GdQ==
X-Gm-Message-State: AOAM530LRjvuOaroUPZeFj1vvKeimMJxK0lHJlbYTrEpI1WPGqEPP5wl
 M5YzdbsFGhgG8U/a+f0VYEbTyoJJL/HvP3CpRQB/GhLsTXfz7C4NvyIYkHKYsYs8JZ6YvEMe8ox
 CvndnyZDJmFjbCrbAhzJbhUbHMqqYlu/GzWfFyxu6RVod
X-Received: by 2002:a37:5c04:: with SMTP id q4mr2246196qkb.192.1593170182040; 
 Fri, 26 Jun 2020 04:16:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxomVJsOcRLn/iwujMFquBZjYpNN0p2Dht5n6r/Fh8IScZIZzSYQnDQd46u9pQeeJBFRRlp8olv6TkrJKGc8dY=
X-Received: by 2002:a37:5c04:: with SMTP id q4mr2246168qkb.192.1593170181820; 
 Fri, 26 Jun 2020 04:16:21 -0700 (PDT)
MIME-Version: 1.0
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
 <CACO55ttfwQDwnO8ep=YKBgo+HYBg=zLDLfBKtH67MrqKzMWw_w@mail.gmail.com>
 <cb935527-2eb9-23f3-a823-d6b849fc3c94@kapsi.fi>
In-Reply-To: <cb935527-2eb9-23f3-a823-d6b849fc3c94@kapsi.fi>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 26 Jun 2020 13:16:10 +0200
Message-ID: <CACO55tstj7owhL_Go+ZFLZW4TnzN_GtnKn5iKQOSqWP5bJw_sA@mail.gmail.com>
Subject: Re: [RFC] Host1x/TegraDRM UAPI
To: Mikko Perttunen <cyndis@kapsi.fi>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: David Airlie <airlied@linux.ie>, gustavo@padovan.org,
 dri-devel <dri-devel@lists.freedesktop.org>, Jon Hunter <jonathanh@nvidia.com>,
 talho@nvidia.com, bhuntsman@nvidia.com,
 Thierry Reding <thierry.reding@gmail.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 26, 2020 at 1:13 PM Mikko Perttunen <cyndis@kapsi.fi> wrote:
>
> On 6/26/20 2:06 PM, Karol Herbst wrote:
> > On Tue, Jun 23, 2020 at 3:03 PM Mikko Perttunen <cyndis@kapsi.fi> wrote:
> >>
> >> # Host1x/TegraDRM UAPI proposal
> >>
> >> This is a proposal for a stable UAPI for Host1x and TegraDRM, to replace
> >> the current TegraDRM UAPI that is behind `STAGING` and quite obsolete in
> >> many ways.
> >>
> >> I haven't written any implementation yet -- I'll do that once there is
> >> some agreement on the high-level design.
> >>
> >> Current open items:
> >>
> >> * The syncpoint UAPI allows userspace to create sync_file FDs with
> >> arbitrary syncpoint fences. dma_fence code currently seems to assume all
> >> fences will be signaled, which would not necessarily be the case with
> >> this interface.
> >> * Previously present GEM IOCTLs (GEM_CREATE, GEM_MMAP) are not present.
> >> Not sure if they are still needed.
> >>
> >
> > Hi, as this wasn't addressed here (and sorry if I missed it): is there
> > an open source userspace making use of this UAPI? Because this is
> > something which needs to be seen before it can be included at all.
> >
>
> Hi Karol,
>
> not currently, but once we have hashed out the design a little bit (and
> I'm back from vacation), I'll work on open source userspace and
> converting existing code using the staging UAPI to this one.
>
> Mikko
>

okay, cool, sounds good!

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
