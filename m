Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEDC188F02
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 21:32:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9068A89E33;
	Tue, 17 Mar 2020 20:32:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37E9989E33
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 20:32:36 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id v3so22525977iom.13
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 13:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VrS9C3IZxKyoBCQ3Rk/A9DYkASncibCkp6b8/UIfrLo=;
 b=fev5dJibBNWDmWNlafH/nMNdF2riSYIWdtdFZwdm3ORjmQWJzifwBywYuOEr71ygZ4
 LQ+k/9trxUJfUCNYxYdkDHHKOWs8ZAfGCsNSI3eD57oLJ9cXLoGuzgauIueASJpBZekY
 gCKSEdHO9k4dNhxI0dWhtl7Y9olSAf59raq54smlQMi7ap5nq9/a9Rw+lU4u+jqqK69b
 Z5/rPWQBaICL3zqRNM7l99ogJLBtLIdQRh8ExV+px44ISvt44jq7ajdxD/Pb2hLSRyOu
 0BneQoDQOfQI3hHARZCDF9aPn5F3SFcDE7xLNuNoKn3ZfM5jwce1rB+oEYEJpyG+pPo1
 /lZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VrS9C3IZxKyoBCQ3Rk/A9DYkASncibCkp6b8/UIfrLo=;
 b=WOSzKQ+CrOQ4U01a8kmOX1jcGhZ01ZDfCGmKWttWcl9m8hBQEVhBTvBOFPgYk8N3yR
 r8s9toWXtN2yIPoerKJvFCPfG2boKO3jFp+3TK6Tbmq+6XXfwRl5s/Vi5/g2/N1DECp4
 J1VYD5uSAski7lUfMF81VMvGHyFfZ6v277Iebi2ymotz7Lpl3yoqZ53NlTmlddYG8+du
 5JfE673mbYKBV4Fyoyd2ioclozVOW05N7/NEjyLdJ2ZWApnxkwppaFPUKuw/hJg7wrPu
 /FzuGRZkpOLePTk35w7Hqn2XwaRN8N/DY5b6sjg280SwKcAojziCExTSJ6CGP1x7cZ3S
 FcaQ==
X-Gm-Message-State: ANhLgQ3oM+HFyBRhTVFVxE3eHnKIKtamt0toyFCgOOZSCBTDKm2jPXGl
 yVCO3oqDqxr89G5q/KsdQHMJyQveNSnuQMrCJH0=
X-Google-Smtp-Source: ADFU+vuzPAqK4ah9KVXwVfeMcuulYCzflCTDkxJ0H81BUPQ5Q4SWzHynI17S9NQ22dymxGlzlrBINJXS19VltiluRA8=
X-Received: by 2002:a6b:d609:: with SMTP id w9mr575226ioa.41.1584477155411;
 Tue, 17 Mar 2020 13:32:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200310010818.569-1-gurchetansingh@chromium.org>
 <20200310074302.yx6anlvqvsg37yzs@sirius.home.kraxel.org>
 <CAAfnVB=sw=u80mHnZUPf_+WDW-hGNTDSBWLfV+7y3KFN=s6beQ@mail.gmail.com>
 <20200311103609.ei446gelkvbqrdzm@sirius.home.kraxel.org>
 <CAAfnVBm1eoGZY7yB8eqEC1eLk=v4dq--O2biQOnWDHCkmguOeA@mail.gmail.com>
 <20200312092940.xioyjloil3f25ccv@sirius.home.kraxel.org>
 <CAAfnVBkTWy2pohv5kWWYwAa1yq14fRJrtN4GD7sF-h4inabH6Q@mail.gmail.com>
 <CAPaKu7SgkdBaFcDU1O7T+mMyzqO5iR8qYJxFJmcYGp_Hfe3S0g@mail.gmail.com>
 <20200316074404.z4xbta6qyrm74oxo@sirius.home.kraxel.org>
In-Reply-To: <20200316074404.z4xbta6qyrm74oxo@sirius.home.kraxel.org>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Wed, 18 Mar 2020 04:32:24 +0800
Message-ID: <CAPaKu7S=fmsGDY+txgFBcYDaBE9VaBubtEvVMEWj2yQ_UL04bQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/8] *** Per context fencing ***
To: Gerd Hoffmann <kraxel@redhat.com>
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
 Gurchetan Singh <gurchetansingh@chromium.org>,
 David Stevens <stevensd@chromium.org>, John Bates <jbates@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 16, 2020 at 3:44 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
> > >> At virtio level it is pretty simple:  The host completes the SUBMIT_3D
> > >> virtio command when it finished rendering, period.
> > >>
> > >>
> > >> On the guest side we don't need the fence_id.  The completion callback
> > >> gets passed the virtio_gpu_vbuffer, so it can figure which command did
> > >> actually complete without looking at virtio_gpu_ctrl_hdr->fence_id.
> > >>
> > >> On the host side we depend on the fence_id right now, but only because
> > >> that is the way the virgl_renderer_callbacks->write_fence interface is
> > >> designed.  We have to change that anyway for per-context (or whatever)
> > >> fences, so it should not be a problem to drop the fence_id dependency
> > >> too and just pass around an opaque pointer instead.
> >
> > I am still catching up, but IIUC, indeed I don't think the host needs
> > to depend on fence_id.  We should be able to repurpose fence_id.
>
> I'd rather ignore it altogether for FENCE_V2 (or whatever we call the
> feature flag).

That's fine when one assumes each virtqueue has one host GPU timeline.
But when there are multiple (e.g., multiplexing multiple contexts over
one virtqueue, or multiple VkQueues), fence_id can be repurposed as
the host timeline id.

>
> > On the other hand, the VIRTIO_GPU_FLAG_FENCE flag is interesting, and
> > it indicates that the vbuf is on the host GPU timeline instead of the
> > host CPU timeline.
>
> Yep, we have to keep that (unless we do command completion on GPU
> timeline unconditionally with FENCE_V2).

I think it will be useful when EXECBUFFER is used for metadata query
and write the metadata directly to a guest BO's sg list.  We want the
query to be on the CPU timeline.




> cheers,
>   Gerd
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
