Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD2D48BC3A
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 02:12:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EF6D10E1A1;
	Wed, 12 Jan 2022 01:12:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CF8910E1A1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 01:12:23 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id n68so2007209ybg.6
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 17:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xjTRFSqJYxYJ0HsDKiZ54zl6ugx3DS6HwynO3TCtbWQ=;
 b=TVIjjtwN9h32YujM+MZEy4iUZ5h7ltDdZbZiPSD1vzeeFpazkfVIyITMKHz4pL194g
 ZmX9bNwdqz74RtIQ6tduewnJo8IZH1wqIeU24iy+nzkA/ky1H05wcUm5Nb15LCky1y8O
 zXYTzFtT/Z1Z7PIPWSCHiRUA9VtwffvzU7Y22P4+LXH1k7qfN2JA+cr6Q2HeD/i3NTEq
 xs+iCTqMbv3YfOi4xjlUrBDZtDOuhp8scfG0C2XDKV8qfb1NePWklVHI+K96tHKY/9Gu
 TWvIDMhK9rYbiqwfCOOSqdTVm5jnY/J4PotjEooSCHQN6VQcE9uDltv0X0nwFzUtyNt+
 3a5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xjTRFSqJYxYJ0HsDKiZ54zl6ugx3DS6HwynO3TCtbWQ=;
 b=ovxvtSmWvRiV+hrZYwQ4i4YBOCGSpXo8tKAVBH5+Baz5UHCxnvid2q1Yu0mUvYVTCJ
 Fv65fEs9OAxurGgtxXDm96toY7NbqSy8m+4H+plC3l8Z6TrHbspoSlBjMoAqBfQG5Msq
 yLcgZOiJTdZyvBD/PoA8WoiJvx/YF9cSx+CfvlSjZkCkcR2mIqjqsR6rJ5s9PVf7euO5
 5YztThynumkNk0OnVIe0R+z/kxMRrPmWtdGDMGMJWlOIIwxYGWLN7lgEaqJk4Tr4rXbZ
 pOCA793KglkbN+Odi/a1kF7/DaJHogmwY3eYURFWyQPvhxxy8Uf2T24O9IvnmMcFlAJh
 7q3g==
X-Gm-Message-State: AOAM531b0Yjp/vkvw9mh3bVauB6GNoo86piO8Es/0nx9va8i2L8Vflov
 COl23qsz3wBTbxlHdoOotxJqBcrFOabIjxS5utYg1A==
X-Google-Smtp-Source: ABdhPJzZvRCw98B6Izrbwi0vXW5WEsiulf6Jw5949i1tVCJKs6+A1LXAxYLEsQ5qpXuRxCROgZN5vKK18jern8XWoKo=
X-Received: by 2002:a25:c691:: with SMTP id k139mr9527616ybf.327.1641949942208; 
 Tue, 11 Jan 2022 17:12:22 -0800 (PST)
MIME-Version: 1.0
References: <20220104235148.21320-1-hridya@google.com>
 <49b29081-42df-ffcd-8fea-bd819499ff1b@amd.com>
 <CA+wgaPMWT0s0KNo_wM7jU+bH626OAVtn77f7_WX=E1wyU8aBzg@mail.gmail.com>
 <3a29914d-0c7b-1f10-49cb-dbc1cc6e52b0@amd.com>
 <CA+wgaPOmRTAuXiSRRmj-s=3d2W6ny=EMFtroOShYKrp0u+xF+g@mail.gmail.com>
 <CA+wgaPO81R+NckRt0nzZazxs9fqSC_V_wyChU=kcMqJ01WxXNw@mail.gmail.com>
 <5a6bd742-10ca-2e88-afaa-3744731c2c0c@amd.com>
 <CA+wgaPPdCMPi1t+ObyO4+cqsk7Xx3E=K5BOPM37=QAviQDAfmw@mail.gmail.com>
 <CAKMK7uGRUrP+0PcY-yxTweb_K_QacHJchgPoa0K9K_kwGO+K3g@mail.gmail.com>
 <934ac18c-d53e-beeb-48c1-015a5936e713@amd.com> <Yd1nJqmHXULnccNF@kroah.com>
 <3610ecd0-03c7-2cae-8f36-f8fd555757b0@amd.com>
In-Reply-To: <3610ecd0-03c7-2cae-8f36-f8fd555757b0@amd.com>
From: Hridya Valsaraju <hridya@google.com>
Date: Tue, 11 Jan 2022 17:11:45 -0800
Message-ID: <CA+wgaPP9DDSuOjJjK6F7XF_=UpP=Li+3-3Pa9Nr-c2qEUr=RBQ@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: Move sysfs work out of DMA-BUF export/release
 path
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: keescook@google.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 kaleshsingh@google.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tjmercier@google.com,
 linaro-mm-sig@lists.linaro.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 surenb@google.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 11, 2022 at 3:43 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
>
> Am 11.01.22 um 12:16 schrieb Greg Kroah-Hartman:
> > On Tue, Jan 11, 2022 at 11:58:07AM +0100, Christian K=C3=B6nig wrote:
> >>>> This is also not a problem due to the high number of DMA-BUF
> >>>> exports during launch time, as even a single export can be delayed f=
or
> >>>> an unpredictable amount of time. We cannot eliminate DMA-BUF exports
> >>>> completely during app-launches and we are unfortunately seeing repor=
ts
> >>>> of the exporting process occasionally sleeping long enough to cause
> >>>> user-visible jankiness :(
> >>>>
> >>>> We also looked at whether any optimizations are possible from the
> >>>> kernfs implementation side[1] but the semaphore is used quite extens=
ively
> >>>> and it looks like the best way forward would be to remove sysfs
> >>>> creation/teardown from the DMA-BUF export/release path altogether. W=
e
> >>>> have some ideas on how we can reduce the code-complexity in the
> >>>> current patch. If we manage to
> >>>> simplify it considerably, would the approach of offloading sysfs
> >>>> creation and teardown into a separate thread be acceptable Christian=
?
> >> At bare minimum I suggest to use a work_struct instead of re-inventing=
 that
> >> with kthread.
> >>
> >> And then only put the exporting of buffers into the background and not=
 the
> >> teardown.
> >>
> >>>> Thank you for the guidance!
> >>> One worry I have here with doing this async that now userspace might
> >>> have a dma-buf, but the sysfs entry does not yet exist, or the dma-bu=
f
> >>> is gone, but the sysfs entry still exists. That's a bit awkward wrt
> >>> semantics.


Thank you all for your thoughts and guidance. You are correct that we
will be trading accuracy for performance here. One precedence we could
find was in the case of RSS accounting where SPLIT_RSS_COUNTING caused
the accounting to have less overhead but also made it less accurate.
If you would prefer that it not be the default case, we can make it
configurable by putting it behind a config instead.


> >>>
> >>> Also I'm pretty sure that if we can hit this, then other subsystems
> >>> using kernfs have similar problems, so trying to fix this in kernfs
> >>> with slightly more fine-grained locking sounds like a much more solid
> >>> approach. The linked patch talks about how the big delays happen due
> >>> to direct reclaim, and that might be limited to specific code paths
> >>> that we need to look at? As-is this feels a bit much like papering
> >>> over kernfs issues in hackish ways in sysfs users, instead of tacklin=
g
> >>> the problem at its root.
> >> Which is exactly my feeling as well, yes.
> > More and more people are using sysfs/kernfs now for things that it was
> > never designed for (i.e. high-speed statistic gathering).  That's not
> > the fault of kernfs, it's the fault of people thinking it can be used
> > for stuff like that :)
>
> I'm starting to get the feeling that we should maybe have questioned
> adding sysfs files for each exported DMA-buf a bit more. Anyway, to late
> for that. We have to live with the consequences.
>
> > But delays like this is odd, tearing down sysfs attributes should
> > normally _never_ be a fast-path that matters to system throughput.  So
> > offloading it to a workqueue makes sense as the attributes here are for
> > objects that are on the fast-path.
>
> That's what is puzzling me as well. As far as I understood Hridya
> tearing down things is not the problem, because during teardown we
> usually have a dying task where it's usually not much of a problem if
> the corpse is around for another few milliseconds until everything is
> cleaned up.


We have seen instances where the last reference to the buffer is not
dropped by the dying process but by Surfaceflinger[1].


>
> The issue happens during creation of the sysfs attribute and that's
> extremely odd because if this waits for reclaim then drivers will
> certainly wait for reclaim as well. See we need a few bytes for the
> sysfs attribute, but drivers usually need a few megabytes for the
> DMA-buf backing store before they can even export the DMA-buf.


We have been working off of traces collected from the devices of end
users to analyze the issue and currently don't have sufficient
information to understand why exactly direct reclaim affects sysfs the
way we are seeing it on the traces. We are actively trying to
reproduce the issue consistently to perform more experiments to
understand it. The DMA-BUF system heap on the Android Common Kernel
keeps a pool of pre-allocated pages in reserve and we are guessing
that it could possibly be the reason why we have not seen similar
issues with direct reclaim earlier. We will update the thread once we
have more information.

We are also working on a leaner version of the patch that uses
work_struct instead.

Regards,
Hridya

[1] : https://source.android.com/devices/graphics/surfaceflinger-windowmana=
ger


>
> So something doesn't add up in the rational for this problem.
>
> Regards,
> Christian.
>
> >
> > thanks,
> >
> > greg k-h
>
