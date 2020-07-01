Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 527BE211183
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 19:04:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F39BB6E962;
	Wed,  1 Jul 2020 17:04:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FB7C6E95F
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 17:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593623073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NiOy7ZAOZwRJYpQTDCr66D5MQt2g8hiPsepvJGe2kJ4=;
 b=Zc9sSm5TRkD3yuT2SRMBkSZmyh+oZChMRsBw8w/b7MzMgXgADfwi6P9hjjRjxnpJH0dkyX
 CNEkHXYQieo7nYFfZSgEam5Kz4sE6pRKVJurv6c4bvQfUposH0CURn3IG+SrpOyr5dpPFM
 DD4WiyF2rtPipjZN5LW/F2VTFzWJs90=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-ku8TaF5uMvWqZHgXVFGR-g-1; Wed, 01 Jul 2020 13:04:27 -0400
X-MC-Unique: ku8TaF5uMvWqZHgXVFGR-g-1
Received: by mail-qk1-f199.google.com with SMTP id w27so17573902qkw.2
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jul 2020 10:04:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NiOy7ZAOZwRJYpQTDCr66D5MQt2g8hiPsepvJGe2kJ4=;
 b=ly/sFMrKflJqN493WQB/PCKwyCB7+j4LOusFQMdwsNTiswOy5++jkc2wohISpqFxvl
 A22xisqHg5TDPyM3st3ZZMBQScUSapHcJ0DgcYH7U8Ugk54NDGKRio4W/3fdjKPmuiV+
 Da/WbJw3L0E03BX3QhqP/p6F1hlrqNRrEYpriIbUaW74qPTLf5HKKM3M/NnsJWu6xDIF
 DMjjbdDxOXJ8U+ITJiD7ChWX+7kyOMK4WnWZMoRsThcvcEMtMHkq0YarAS8O9GVuFuGN
 PyHzt2n0QtNkNIFjBsQpoxueyEdKZsl57xJ6iNa2fEaIzkZPTjPty6psd8wKhv+5nFYS
 FVaQ==
X-Gm-Message-State: AOAM533IZ8LkIUe8bFFDTEUOAsHrZ8wiTz9Jyhi4WugdzIaj2p3GkV5Y
 FTMyl+CiiPdncSxe9CjZjJC8onfqMCj8mkENK0LCtawMMfZ1kkwG2vgag/wgSHttvU4K/tlK0os
 /8+36KbrOm7Dch4HriYQubNWKmHUQ0GHI+hmlBaH6OEe0
X-Received: by 2002:a37:6d4:: with SMTP id 203mr25884095qkg.62.1593623067106; 
 Wed, 01 Jul 2020 10:04:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2SUbbP+OsUxjyYRtHACYvHGVw89nPS0TjNrzdSgrgE8daRe/4deg3Lx3x6BzmbwLwLKGzVpZhckvrDz9TsIE=
X-Received: by 2002:a37:6d4:: with SMTP id 203mr25884064qkg.62.1593623066788; 
 Wed, 01 Jul 2020 10:04:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9txGww+omvateOTizZRV9_wLdAbq6uAz3DRa_S6bn1jQuQ@mail.gmail.com>
 <20200630230808.wj2xlt44vrszqfzx@box>
 <ef7816b4-72ee-9e0e-8cac-4d80d8343f9f@nvidia.com>
 <CACO55tvT0fOMai7k7oAP1TL42YAuMwJocxk2seNgjYibs+h5oA@mail.gmail.com>
 <11e5ee1d-8b5e-2721-091e-ffbf9e1271d1@nvidia.com>
 <CAKMK7uEzoFyW6o1gP6xszWH7fKHrVSR32JLs73KeFfYgD=BHPQ@mail.gmail.com>
In-Reply-To: <CAKMK7uEzoFyW6o1gP6xszWH7fKHrVSR32JLs73KeFfYgD=BHPQ@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 1 Jul 2020 19:04:15 +0200
Message-ID: <CACO55tu8z_Rt50QXUr+MBKV_vtxZfVgz8Cfoj2xbinbtTYM3WQ@mail.gmail.com>
Subject: Re: [git pull] drm for 5.8-rc1
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
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
Cc: James Jones <jajones@nvidia.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 1, 2020 at 6:01 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> On Wed, Jul 1, 2020 at 5:51 PM James Jones <jajones@nvidia.com> wrote:
> >
> > On 7/1/20 4:24 AM, Karol Herbst wrote:
> > > On Wed, Jul 1, 2020 at 6:45 AM James Jones <jajones@nvidia.com> wrote:
> > >>
> > >> This implies something is trying to use one of the old
> > >> DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK format modifiers with DRM-KMS without
> > >> first checking whether it is supported by the kernel.  I had tried to
> > >> force an Xorg+Mesa stack without my userspace patches to hit this error
> > >> when testing, but must have missed some permutation.  If the stalled
> > >> Mesa patches go in, this would stop happening of course, but those were
> > >> held up for a long time in review, and are now waiting on me to make
> > >> some modifications.
> > >>
> > >
> > > that's completely irrelevant. If a kernel change breaks userspace,
> > > it's a kernel bug.
> >
> > Agreed it is unacceptable to break userspace, but I don't think it's
> > irrelevant.  Perhaps the musings on pending userspace patches are.
> >
> > My intent here was to point out it appears at first glance that
> > something isn't behaving as expected in userspace, so fixing this would
> > likely require some sort of work-around for broken userspace rather than
> > straight-forward fixing of a bug in the kernel logic.  My intent was not
> > to shift blame to something besides my code & testing for the
> > regression, though I certainly see how it could be interpreted that way.
> >
> > Regardless, I'm looking in to it.
>

I assume the MR you were talking about is
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/3724 ? I am
also aware of the tegra driver being broken on my jetson nano and I am
now curious if this MR could fix this bug as well... and sorry for the
harsh reply, I was just a annoyed by the fact that "everything
modifier related is just breaking things", first tegra and that nobody
is looking into fixing it and then apparently the userspace code being
quite broken as well :/

Anyway, yeah I trust you guys on figuring out the keeping "broken"
userspace happy from a kernel side and maybe I can help out with
reviewing the mesa bits. I am just wondering if it could help with the
tegra situation giving me more reasons to look into it as this would
solve other issues I should be working on :)

> If we do need to have a kernel workaround I'm happy to help out, I've
> done a bunch of these and occasionally it's good to get rather
> creative :-)
>
> Ideally we'd also push a minimal fix in userspace to all stable
> branches and make sure distros upgrade (might need releases if some
> distro is stuck on old horrors), so that we don't have to keep the
> hack in place for 10+ years or so. Definitely if the hack amounts to
> disabling modifiers on nouveau, that would be kinda sad.
> -Daniel
>
> >
> > Thanks,
> > -James
> >
> > >> Are you using the modesetting driver in X?  If so, with glamor I
> > >> presume?  What version of Mesa?  Any distro patches?  Any non-default
> > >> xorg.conf options that would affect modesetting, your X driver if it
> > >> isn't modesetting, or glamour?
> > >>
> > >> Thanks,
> > >> -James
> > >>
> > >> On 6/30/20 4:08 PM, Kirill A. Shutemov wrote:
> > >>> On Tue, Jun 02, 2020 at 04:06:32PM +1000, Dave Airlie wrote:
> > >>>> James Jones (4):
> > >>> ...
> > >>>>         drm/nouveau/kms: Support NVIDIA format modifiers
> > >>>
> > >>> This commit is the first one that breaks Xorg startup for my setup:
> > >>> GTX 1080 + Dell UP2414Q (4K DP MST monitor).
> > >>>
> > >>> I believe this is the crucial part of dmesg (full dmesg is attached):
> > >>>
> > >>> [   29.997140] [drm:nouveau_framebuffer_new] Unsupported modifier: 0x300000000000014
> > >>> [   29.997143] [drm:drm_internal_framebuffer_create] could not create framebuffer
> > >>> [   29.997145] [drm:drm_ioctl] pid=3393, ret = -22
> > >>>
> > >>> Any suggestions?
> > >>>
> > >> _______________________________________________
> > >> dri-devel mailing list
> > >> dri-devel@lists.freedesktop.org
> > >> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > >>
> > >
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > >
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
