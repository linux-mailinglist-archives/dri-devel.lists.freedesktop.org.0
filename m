Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 028004904F4
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 10:35:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1AD810E507;
	Mon, 17 Jan 2022 09:35:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9165D10E507
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 09:35:38 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id t9so22531711oie.12
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 01:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/TWot+GBT255Kn595XxLRRlEGzkpc6u0aEZt1sgu9nQ=;
 b=brYMghhNpV3UtW8Pry19jIqkr5UG+1u8w9vx0wfpPtB+68SvTVhWt23hZ5fvWzMuMB
 +Z91zQpxcQt0ofra67Y98j4cXwUJJQ5TTn+6MvOkrK+75hiuxdXjddoZf8Wr684vAOpE
 8UnIwlhCxGWTDfkszaoL7H5a/hLEqSd4JWVfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/TWot+GBT255Kn595XxLRRlEGzkpc6u0aEZt1sgu9nQ=;
 b=vkU75OunxdHnrzwkvOJKf6b+6B6dwIZT7X8+3LCAAcEoCjAVuRGzgPhpF2qY1yobIU
 a7J6pubTnaZyzHjZnBgeVlfkpKpCwWP7GYWDnOX972h7ah0Xzb+kzFjFI3m9Pj3j9QAs
 uXYp4bkCdggPPMQ0mAiiygmHe6BSbG8RkqaREsjxQBavn/KLrZsC2OvOr1d2R+0k81/v
 BbB4IOjf80uOK2z/XSoqknFG4ZOSptNkmiyqPqLXHqtAfirlU1NxnOjx+kNI2zfqb/n0
 ZNqo3mbNbJ8bnaRpCw6PILxI+ZOjHk8NiimmwarNnlVL+9mnBwgiJttrdGc/Q7WGRy/8
 Gdxg==
X-Gm-Message-State: AOAM533njhxMhLWAVBIdZytTwO01Jmfa70f9D0IvgKAZ4jxRdonFbdzB
 GxqqkbY+INGU11c6rxFRFuBBD8w9C7N2yVN7hUjmgQ==
X-Google-Smtp-Source: ABdhPJz+YSLdpmoOtNsknZdTmAXVEU/lG790KmndstiDSVOMX6wDaiiteQoHLkfyHIGmn3VOmtjiL595km39p9G6Ono=
X-Received: by 2002:a05:6808:1188:: with SMTP id
 j8mr21930539oil.101.1642412137479; 
 Mon, 17 Jan 2022 01:35:37 -0800 (PST)
MIME-Version: 1.0
References: <cover.1641937419.git.iourit@linux.microsoft.com>
 <e04c8e820bc166d9d4fe8e388aace731bb3255b0.1641937420.git.iourit@linux.microsoft.com>
 <YeG6+Crv/Bg4h3u1@phenom.ffwll.local>
 <e472cbe8-44ec-110a-1ad7-bc561cd0be88@linux.microsoft.com>
In-Reply-To: <e472cbe8-44ec-110a-1ad7-bc561cd0be88@linux.microsoft.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 17 Jan 2022 10:35:26 +0100
Message-ID: <CAKMK7uFkVvfXM7QsgSfP4OLk9b_cSwNsi3s3_7EFuL+Pa1s7eQ@mail.gmail.com>
Subject: Re: [PATCH v1 9/9] drivers: hv: dxgkrnl: Implement DXGSYNCFILE
To: Iouri Tarassov <iourit@linux.microsoft.com>
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
Cc: wei.liu@kernel.org, sthemmin@microsoft.com, gregkh@linuxfoundation.org,
 haiyangz@microsoft.com, linux-hyperv@vger.kernel.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 linux-kernel@vger.kernel.org, spronovo@microsoft.com, jenatali@microsoft.com,
 kys@microsoft.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 17, 2022 at 9:34 AM Iouri Tarassov
<iourit@linux.microsoft.com> wrote:
>
>
> On 1/14/2022 10:03 AM, Daniel Vetter wrote:
> > Hi all,
> >
> > On Wed, Jan 12, 2022 at 11:55:14AM -0800, Iouri Tarassov wrote:
> > > Implement the LX_DXCREATESYNCFILE IOCTL (D3DKMTCreateSyncFile).
> > >
> > > dxgsyncfile is built on top of the Linux sync_file object and
> > > provides a way for the user mode to synchronize with the execution
> > > of the device DMA packets.
> > >
> > > The IOCTL creates a dxgsyncfile object for the given GPU synchronization
> > > object and a fence value. A sync_object file descriptor is returned to
> > > the caller. The caller could wait for the object by using poll().
> > > When the GPU synchronization object is signaled on the host, the host
> > > sends a message to the virtual machine and the sync_file object is
> > > signaled.
> > >
> > > Signed-off-by: Iouri Tarassov <iourit@linux.microsoft.com>
> >
> > Adding dri-devel, which get_maintainers.pl should have done automatically
> > with the dma_fence wildcard match. Not sure why that didn't happen.
> >
> > > +struct dxgsyncpoint {
> > > +   struct dxghostevent     hdr;
> > > +   struct dma_fence        base;
> >
> > This doesn't work unfortuntately. For better or worse memory fences like
> > monitored fences from wddm have completely different semantics from
> > dma_fence. You could probably hack this to be self-consistent for hyper-v,
> > but the problem is that then hv would have incompatible locking/nesting
> > rules compared to everything else, and dma_fence matter for memory
> > management so this includes whether you're allowed to kmalloc(GFP_KERNEL)
> > or not, and that's just a bit too much.
> >
> > I discussed this quickly with Jesse on irc and it sounds like the reason
> > you want the dma_fence is just to emulate the sync_file interface for
> > android. I think the correct solution here is to create a hv_dxg_sync_file
> > fd, which emulates the exact ioctls that Android needs, but with a wddm
> > monitored fence underneath instead of a dma_fence underneath.
> >
> > This way we guarantee that no one ever accidentally mixes these
> > incompatible concepts up in the kernel, and Android should still be able
> > to happily run under hyperv.
> >
> > Thoughts?
> >
> > Also pls cc me on this sync work since even if you drop dma_fence use
> > completely I'd like to follow this a bit.
>
> Hi Daniel,
>
> Thank you for the review and feedback.
> I will get this addressed.

btw another idea I had over the w/e: Another option might be to allow
different backends for sync_file, and then making sure that you cannot
ever mix dma_fence and hv_dxg_fence type sync_file up (in e.g. the
merge ioctl).

The issue is that fundamentally dma_fence and memory fences (or umf
for userspace memory fences as we tend to call them) aren't
compatible, but some of the interop plans we have is to allow stuffing
either of them into fence container objects like sync_file. So going
that route for wddm monitored fence support too could be a really
future-proof approach, plus it'd allow you to still share the
sync_file interface code. Not that it's going to be much code sharing,
since all the implementation code needs to be distinct.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
