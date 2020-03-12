Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC93182C7D
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 10:29:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC3DF6E0BA;
	Thu, 12 Mar 2020 09:29:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A86A6E0BA
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 09:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584005386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3DAZEl9KGgXpi+WksFH0F7ooorjJZcyrtuQNt0i1HFc=;
 b=NAs6LM994YmXUOfyzkeapTP39iNjBrV0Z65BARveuEqFkxms/FONAoq6gPLydfiFIqa+4R
 SAuR5G4gTyUhB9S17QUMSQdnAGSlcAG6e1fg00VmVcDtvZbUoXaJvQ8+HLaIourEZvJGiR
 2/JkD6WxsTcrFKPiMlxbr+6EQXN4Kpg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-pmAZrmc4MX6PsHQ2RxSHww-1; Thu, 12 Mar 2020 05:29:43 -0400
X-MC-Unique: pmAZrmc4MX6PsHQ2RxSHww-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 494068010F0;
 Thu, 12 Mar 2020 09:29:42 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-117.ams2.redhat.com
 [10.36.116.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E81485D9E5;
 Thu, 12 Mar 2020 09:29:41 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D82B217449; Thu, 12 Mar 2020 10:29:40 +0100 (CET)
Date: Thu, 12 Mar 2020 10:29:40 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>
Subject: Re: [RFC PATCH 0/8] *** Per context fencing ***
Message-ID: <20200312092940.xioyjloil3f25ccv@sirius.home.kraxel.org>
References: <20200310010818.569-1-gurchetansingh@chromium.org>
 <20200310074302.yx6anlvqvsg37yzs@sirius.home.kraxel.org>
 <CAAfnVB=sw=u80mHnZUPf_+WDW-hGNTDSBWLfV+7y3KFN=s6beQ@mail.gmail.com>
 <20200311103609.ei446gelkvbqrdzm@sirius.home.kraxel.org>
 <CAAfnVBm1eoGZY7yB8eqEC1eLk=v4dq--O2biQOnWDHCkmguOeA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAfnVBm1eoGZY7yB8eqEC1eLk=v4dq--O2biQOnWDHCkmguOeA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
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
Cc: Chad Versace <chadversary@chromium.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 John Bates <jbates@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 11, 2020 at 04:36:16PM -0700, Gurchetan Singh wrote:
> On Wed, Mar 11, 2020 at 3:36 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
> 
> >   Hi,
> >
> > > I should've been more clear -- this is an internal cleanup/preparation
> > and
> > > the per-context changes are invisible to host userspace.
> >
> > Ok, it wasn't clear that you don't flip the switch yet.  In general the
> > commit messages could be a bit more verbose ...
> >
> > I'm wondering though why we need the new fence_id in the first place.
> > Isn't it enough to have per-context (instead of global) last_seq?
> >
> 
> Heh, that was to leave open the possibility of multiple timelines per
> context.  Roughly speaking,
> 
> V2 -- multiple processes
> V3 -- multiple processes and multiple threads (due to VK multi-threaded
> command buffers)
> 
> I think we all agree on V2.  It seems we still have to discuss V3
> (multi-queue, thread pools, a fence context associated with each thread) a
> bit more before we start landing pieces.

While thinking about the whole thing a bit more ...
Do we need virtio_gpu_ctrl_hdr->fence_id at all?

At virtio level it is pretty simple:  The host completes the SUBMIT_3D
virtio command when it finished rendering, period.

On the guest side we don't need the fence_id.  The completion callback
gets passed the virtio_gpu_vbuffer, so it can figure which command did
actually complete without looking at virtio_gpu_ctrl_hdr->fence_id.

On the host side we depend on the fence_id right now, but only because
that is the way the virgl_renderer_callbacks->write_fence interface is
designed.  We have to change that anyway for per-context (or whatever)
fences, so it should not be a problem to drop the fence_id dependency
too and just pass around an opaque pointer instead.

cheers,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
