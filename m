Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3454506C0
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 15:24:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4FB86E2E3;
	Mon, 15 Nov 2021 14:24:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71E706E2E3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 14:24:53 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id x15so72776921edv.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 06:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=XzW2ROAlPRz9ydv9L/AshSNhxbtWQbbcjLTS7Atescc=;
 b=jqY7XD2SmwV3T9FBCXsO0foOKIJt8O1+RCuaDdyjfa0As1sIs2dZbe7iyhw2GZXnNX
 eTdf11/29Tly1vIeVz9wOAo82uVZaUcTq59iK9BDv9EaQSfmSPqd2D2sW9xIJatoMnkf
 5eZqw7jyTM8ju/xQp+bpGviSfGYQzviLspbrs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=XzW2ROAlPRz9ydv9L/AshSNhxbtWQbbcjLTS7Atescc=;
 b=Iw4+Z5aBQIr4I7jWdi0REndFcL7ZGcZn7MMKaABkPJvODhwSUhE4xQviqXahbk3Ita
 f8KpCpMuVYvGCoAjaHtAJDtPx54QESxMjfJDqWbBdyXSvP4MUi3HMG4u7jn1DphIUCIz
 sAlk9GKy4vLdDgSXscbx/9ndlTZsOE+mqhHp5z5aTI9AurMWO2oUOTgPqakOpYcGpQ5V
 klcmAxOtL0wsuOxvD/sgAzXBkXk8DfjPwmzOC+ZxJQTjSVHgeqSdaFXZQN6CA9wGnesE
 IZp3ry1TAMUbdZZjoVCikNnfroiaEKbC9S8+VLp/cSlQLtXN9UGTTsKpYCsaqGrwSWa5
 7pWQ==
X-Gm-Message-State: AOAM530oCujLcI7h004DA5vegJrfb9xQp9UjatvMlIOAloyRDBeBjcKr
 Zt0YL34++IyLuIg6ZAn0U/2P7w==
X-Google-Smtp-Source: ABdhPJw5ZxU4iCIzOsNPKcXBw6KrI77E95CzPk/ozBQVETPduv7gf3e6d9dDX1FVXIzpayyJ7jBTzg==
X-Received: by 2002:a05:6402:5158:: with SMTP id
 n24mr19430190edd.230.1636986292018; 
 Mon, 15 Nov 2021 06:24:52 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l11sm7651319edb.28.2021.11.15.06.24.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 06:24:51 -0800 (PST)
Date: Mon, 15 Nov 2021 15:24:49 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: regression with mainline kernel
Message-ID: <YZJtsV15k6mrBt1f@phenom.ffwll.local>
Mail-Followup-To: Linus Torvalds <torvalds@linux-foundation.org>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Nicholas Verne <nverne@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
References: <CADVatmOuOk6RoZF=M9sZm2L=9NuDDsSNNCJJbAtkgScG0og1Ww@mail.gmail.com>
 <CADVatmP_Sn+SS5Yu5+7sJJ5SVpcaZcW8Z_Bj5vmYz9g3kJD86g@mail.gmail.com>
 <CAADWXX80QGk7MwZ7A-n+1+GHv=yrA0qrw-70Z=pFSEsc3UXfgQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAADWXX80QGk7MwZ7A-n+1+GHv=yrA0qrw-70Z=pFSEsc3UXfgQ@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 Nicholas Verne <nverne@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Nov 13, 2021 at 09:06:57AM -0800, Linus Torvalds wrote:
> [ Hmm. This email was marked as spam for me. I see no obvious reason
> for it being marked as spam, but it happens.. ]
> 
> On Thu, Nov 11, 2021 at 12:52 PM Sudip Mukherjee
> <sudipm.mukherjee@gmail.com> wrote:
> >
> > # first bad commit: [cd7f5ca33585918febe5e2f6dc090a21cfa775b0]
> > drm/virtio: implement context init: add virtio_gpu_fence_event
> 
> Hmm. Judging from your automated screenshots, the login never appears.

Greg also reported a regression, plus I looked at the commit and had
questions too.

> > And, indeed reverting cd7f5ca33585 on top of debe436e77c7 has fixed
> > the problem I was seeing on my qemu test of x86_64. The qemu image is
> > based on Ubuntu.
> 
> Presumably either that commit is somehow buggy in itself - or it does
> exactly what it means to do, and the new poll() semantics just
> confuses the heck out of the X server (or wayland or whatever).
> 
> And honestly, if I read that thing correctly, the patch is entirely
> broken. The new poll function (virtio_gpu_poll()) will unconditionally
> remove the first event from the event list, and then report "Yeah, I
> had events".
> 
> This is completely bogus for a few reasons:
> 
>  - poll() really should be idempotent, because the poll function gets
> called multiple times
> 
>  - it doesn't even seem to check that the event that it removes is the
> new VIRTGPU_EVENT_FENCE_SIGNALED_INTERNAL kind of event, so it will
> unconditionally just remove random events.
> 
>  - it does seem to check the "vfpriv->ring_idx_mask" and do the old
> thing if that is zero, but I see absolutely no reason for that (and
> that check itself has caused problems, see below)
> 
> Honestly, my reaction to this all is that that commit is fundamentally
> broken and probably should be reverted regardless as "this commit does
> bad things".
> 
> HOWEVER - it has had a fix for a NULL pointer dereference in the
> meantime - can you check whether the current top of tree happens to
> work for you? Maybe your problem isn't due to "that commit does
> unnatural things", but simply due to the bug fixed in d89c0c8322ec
> ("drm/virtio: Fix NULL dereference error in virtio_gpu_poll").
> 
> And if it's still broken with that commit, I'll happily revert it and
> people need to go back to the drawing board.
> 
> In fact, I would really suggest that people look at that
> virtio_gpu_poll() function regardless. That odd "let's unconditionally
> just drop events in the poll function is really REALLY broken
> behavior.

Tbh I haven't looked at the poll implementation, but it's fishy on
principles as in drm drivers shouldn't reinvent them. The commit message
cites vmwgfx as example for a private driver drm_event, but that works
perfectly fine with standard drm_poll (and is meant to work perfectly fine
with standard drm_poll).

So if it's buggy on top of questionable I think revert might be the right
choice irrespective of whether there's some fixes in-flight.

So if you end up pushing that revert:

References: https://lore.kernel.org/dri-devel/YZJrutLaiwozLfSw@phenom.ffwll.local/
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Plus credit Greg too and all that ofc.

But lets wait a bit for virtio folks to chime in, it's only Monday :-)

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
