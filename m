Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BD7393292
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 17:39:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76B7B6E073;
	Thu, 27 May 2021 15:39:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDEA36E046
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 15:39:21 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id v77so1292162ybi.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 08:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=0AJfGN9E24XOsXAh7WyvJAru8MAlsyAmbHYQ6ndEqGE=;
 b=n0F8zlpJx+uKh8o5Eb40GCmDKjYOcoc9/SENacxnC/hS7av8ZDuIP9s55YZ52hbKSX
 Ua4VyGj+eRrwUi9A0upW/MPR3aLyqYEJY1HE7kdLXY+voTKyQApuNOzyPxTB25cyS9ax
 HnVmFCK4cam/1mn/yEQ4O5I0WHFkzNjrfjijrTz4tHhMKws3PrgRdQd8XuB6mKMoCNt/
 HAr4GWpch/GCBG4d+3RaVHYAasUq8TPp3Y5VN646bDjxyzpsOkz7VJyijpIfcI1o/2M0
 N89koBjF/8LRSv3bN9PLjPhM8ihHR1mbvpIBL9eJT72DyiDFU43DQmcfvd614QQVJ+H4
 eMAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=0AJfGN9E24XOsXAh7WyvJAru8MAlsyAmbHYQ6ndEqGE=;
 b=P68JeU6lpgEtz3t/ElHAtslYXmCCc/lDUw2ja8NUW+JQ68wj3Rdv1eZYjm/5QZAnRm
 Qser5dq9MGPqa+9hnAOy2K0NaJVfOX8G2rprTUT/LJwc0OHhSYTYcz/vNFhgEdZs2vCS
 492JVJ7QxCpKCpi3GRwanZmb7SI79kAb1GK8dW5gOHhQgG4/KiweMaj72AZGfW4w7rKN
 Hyengy3UgeSOzdBc5lCH7fhMwdj2XVoyMnm2N7j5D/xpxpkAAtSMbfoc08ERN3lSoBEP
 4QPmcwfjx8JlJKQqtYCHzK0+5BzPIeWfdXFdwuTLo9LUUTaRnN00Mzx7HE3OPOANUxhu
 B9qg==
X-Gm-Message-State: AOAM5301z6bQaU26EVchN6IYCT62NAiV54Dv6KsYjvzeuBIQaJKvRblr
 Uv83Z7MeIj9hBOKscLYkg1slDvMKnoFztoesoVgr9Q==
X-Google-Smtp-Source: ABdhPJzqyepqasUorYM2LiZLA/CiqbdyPtZhS/6eEiDfwPJ6j4Mth3MU7LV/HlJqdQrbg4ptJQcVI1Ko+TLYRQ9kBvo=
X-Received: by 2002:a05:6902:705:: with SMTP id
 k5mr5504628ybt.241.1622129960996; 
 Thu, 27 May 2021 08:39:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210525211753.1086069-1-jason@jlekstrand.net>
 <20210525211753.1086069-6-jason@jlekstrand.net>
 <acc1737c-261d-9da5-7ea7-759063136c56@amd.com>
 <CAPj87rN_7vmmWcL1vqhvM=etaTjwts_L0vYbsgvYF0_qZw83gw@mail.gmail.com>
 <770eb698-1dde-9e46-da83-44911d96abec@amd.com>
 <CAPj87rPdMthO2Wv7QxMGnO__BiZVauMa9HaRk+35Sgvm69QSjw@mail.gmail.com>
 <a9de44fc-aa7c-60d7-d7ed-2229d41fb306@amd.com>
 <CAOFGe95Zdn8P3=sOT0HkE9_+ac70g36LxpmLOyR2bKTTeS-xvQ@mail.gmail.com>
 <fef50d81-399a-af09-1d13-de4db1b3fab8@amd.com>
In-Reply-To: <fef50d81-399a-af09-1d13-de4db1b3fab8@amd.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 27 May 2021 10:39:09 -0500
Message-ID: <CAOFGe96XX6Sg0htVExu0hv5bkq-++5+1tRG4Wb17PXb5aaCqEg@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 5/7] dma-buf: Add an API for exporting sync
 files (v11)
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Simon Ser <contact@emersion.fr>, 
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Daniel Stone <daniels@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 27, 2021 at 4:49 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 26.05.21 um 19:42 schrieb Jason Ekstrand:
> > On Wed, May 26, 2021 at 6:02 AM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >> Regarding that, why do we actually use a syncfile and not a drm_syncob=
j
> >> here?
> > A sync file is a userspace handle to a dma_fence which is exactly what
> > we're grabbing from the dma-buf so it's a better match.  A syncobj, on
> > the other hand, is a container for fences.  If we really want it in a
> > syncobj (which we may), we can use another ioctl to stuff it in there.
> > The only thing making this work in terms of syncobj would save us is a
> > little ioctl overhead.  In my Mesa patches, we do stuff it in a
> > syncobj but, instead of acting on the syncobj directly, we go through
> > vkSemaphoreImportFd() which is way more convenient for generic WSI
> > code.
>
> Yeah, that is a really good argument.
>
> > It also works nicer because a sync_file is a pretty generic construct
> > but a syncobj is a DRM construct.  This lets us do the export in an
> > entirely driver-generic way without even having access to a DRM fd.
> > It all happens as an ioctl on the dma-buf.
>
> Well that's an even better argument and I think the killer argument here.

Cool.

> We should probably mention that on the commit message as a single
> sentence somewhere.

Happy to do so.  How does this sound:

By making this an ioctl on the dma-buf itself, it allows this new
functionality to be used in an entirely driver-agnostic way without
having access to a DRM fd. This makes it ideal for use in
driver-generic code in Mesa or in a client such as a compositor where
the DRM fd may be hard to reach.

> BTW: You replied exclusively to me. Was that intentionally? I don't
> think so :)

Oops...  I've re-added the whole lot in this reply.

--Jason

> Regards,
> Christian.
>
> >
> > On Wed, May 26, 2021 at 8:23 AM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >
> >> Am 26.05.21 um 15:12 schrieb Daniel Stone:
> >>> On Wed, 26 May 2021 at 13:46, Christian K=C3=B6nig <christian.koenig@=
amd.com> wrote:
> >>>> Am 26.05.21 um 13:31 schrieb Daniel Stone:
> >>>>> How would we insert a syncobj+val into a resv though? Like, if we p=
ass
> >>>>> an unmaterialised syncobj+val here to insert into the resv, then an
> >>>>> implicit-only media user (or KMS) goes to sync against the resv, wh=
at
> >>>>> happens?
> >>>> Well this is for exporting, not importing. So we don't need to worry
> >>>> about that.
> >>>>
> >>>> It's just my thinking because the drm_syncobj is the backing object =
on
> >>>> VkSemaphore implementations these days, isn't it?
> >>> Yeah, I can see that to an extent. But then binary vs. timeline
> >>> syncobjs are very different in use (which is unfortunate tbh), and
> >>> then we have an asymmetry between syncobj export & sync_file import.
> >>>
> >>> You're right that we do want a syncobj though.
> > I'm not convinced.  Some people seem to think that we have a direct
> > progression of superiority: sync_file < syncobj < timeline syncobj.  I
> > don't think this is true.  They each serve different purposes.  A
> > sync_file is a handle to a single immutable fence operation (a
> > dma_fence*).  A syncobj is a container for a fence and is, by
> > definition, mutable (a dma_fence**).  A timeline syncobj is a
> > construct that lets us implement VK_KHR_timeline_semaphore with only
> > immutable finite-time (not future) fences.
> >
> >  From a WSI protocol PoV, it's sometimes nicer to pass a container
> > object once and then pass a serial or a simple "I just updated it"
> > signal every time instead of a new FD.  It certainly makes all the
> > "who closes this, again?" semantics easier.  But we shouldn't think of
> > syncobj as being better than sync_file.  With binary syncobj, it
> > really is the difference between passing a dma_fence* vs. a
> > dma_fence**.  Sometimes you want one and sometimes you want the other.
> > The real pity, IMO, is that the uAPI is scattered everywhere.
> >
> >>> This is probably not
> >>> practical due to smashing uAPI to bits, but if we could wind the cloc=
k
> >>> back a couple of years, I suspect the interface we want is that expor=
t
> >>> can either export a sync_file or a binary syncobj, and further that
> >>> binary syncobjs could transparently act as timeline semaphores by
> >>> mapping any value (either wait or signal) to the binary signal. In
> >>> hindsight, we should probably just never have had binary syncobj. Oh
> >>> well.
> >> Well the later is the case IIRC. Don't ask me for the detail semantics=
,
> >> but in general the drm_syncobj in timeline mode is compatible to the
> >> binary mode.
> >>
> >> The sync_file is also import/exportable to a certain drm_syncobj
> >> timeline point (or as binary signal). So no big deal, we are all
> >> compatible here :)
> >>
> >> I just thought that it might be more appropriate to return a drm_synco=
bj
> >> directly instead of a sync_file.
> > Maybe.  I'm not convinced that's better.  In the current Mesa WSI
> > code, it'd actually be quite a pain.
> >
> > --Jason
>
