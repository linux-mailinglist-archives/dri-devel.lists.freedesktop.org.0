Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9630E4B6428
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 08:19:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4794D10E1E2;
	Tue, 15 Feb 2022 07:19:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DE1910E1E2
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 07:19:47 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id c6so53367940ybk.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 23:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A6Vt6yUnPEpX+Sv2rGVstxQvcH1UBHN+lyF7dCbw5Wg=;
 b=Nz1swxY2TPAOOH/d1/tUe5H0WXsil0iMonbnPxAEWPHYDqHdExDnTYI87V6DuusLdZ
 alks65Ggqq1yRT/z2+zdbOhihQ6XHcD1ogET1iqj1sDd2buLYiVO/euXlajJ5iZEDOFC
 g2F7g3fGTwHi4KACmtxBLr7rEtbS7teDNcyCU4I+YH+Yu56OyhFllkiZYFrE7EbwhOzi
 crWCACfzkQ1HuJZ/Zf8iQ582qUh9/mcdfsP0PEAXdnARf13gFalHNAzTFOp50QjI54s3
 zxlCQmi2c3kFY3oqRuexTDezSuj2yGpkhuu4s+uoXOtfwBbyNXCJU7K627hhwo6SEA+6
 1Y1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A6Vt6yUnPEpX+Sv2rGVstxQvcH1UBHN+lyF7dCbw5Wg=;
 b=tx/hzsA6svkOfAwEIzA7TTbsPt0ZkUykT9YVwerzCow1EsSPD81NuMKd7C/Zb0pLXw
 hst5Lj2PTnaS/wfrEGxC7dWiDX9loS3qESF4czw0Ibysp/Pzzq2Ncq9VjvzDqhgZSmdi
 Exly+YfQoBoQbYxmKvxH3QyDDBByJJhfWwFgJ/uFyhm96yogUV0luLEVAvNnbji9Lw5g
 qGPxyQSo2XE8F+34z8tt7wVEZQLjmqFgoAdBbLnG6L4ENPdkguun0e3WFvmeyCa+o+1d
 KokkBdgSxTACrEv4SbjuT+1m5Y5J93mNDvxk5j+SiTszViVwbRoAhmi4I5n1A6vCNbee
 NJjA==
X-Gm-Message-State: AOAM530/dYL+u2LjVYKOZV85PNUyRczETaMgRZAzakkxynRUUrRZPuvU
 EmUeGkp2tQeObUrG7BwvEFYKwrhkYN6S7fntiu2XCg==
X-Google-Smtp-Source: ABdhPJyo0FZoWsxXSo1Q1MhH67Kj+X4mUmgs7t1VhjD05V8j/coMY2GXPnHaTNpcj6+x4Rh5Mz9cODoyYdHVvQL4imk=
X-Received: by 2002:a25:aac6:: with SMTP id t64mr2615071ybi.602.1644909586308; 
 Mon, 14 Feb 2022 23:19:46 -0800 (PST)
MIME-Version: 1.0
References: <20220211161831.3493782-1-tjmercier@google.com>
 <20220211161831.3493782-7-tjmercier@google.com> <Ygdfe3XSvN8iFuUc@kroah.com>
 <CABdmKX1eKZZ9809uxnzT_Bm+mdNuK2AObLRxyBpdDF3yE76Hrg@mail.gmail.com>
 <YgtPzXUmSOVyplnm@kroah.com>
In-Reply-To: <YgtPzXUmSOVyplnm@kroah.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 14 Feb 2022 23:19:35 -0800
Message-ID: <CAJuCfpG0V2qZVVUPRmw3fZP-bQmp+w36nOUe9iHtgmuHb7PemQ@mail.gmail.com>
Subject: Re: [RFC v2 6/6] android: binder: Add a buffer flag to relinquish
 ownership of fds
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Cc: Zefan Li <lizefan.x@bytedance.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Kalesh Singh <kaleshsingh@google.com>, Joel Fernandes <joel@joelfernandes.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Laura Abbott <labbott@redhat.com>, linux-media <linux-media@vger.kernel.org>,
 Todd Kjos <tkjos@android.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Tejun Heo <tj@kernel.org>, cgroups mailinglist <cgroups@vger.kernel.org>,
 Martijn Coenen <maco@android.com>, "T.J. Mercier" <tjmercier@google.com>,
 Christian Brauner <brauner@kernel.org>, Kenny.Ho@amd.com,
 LKML <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Hridya Valsaraju <hridya@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 14, 2022 at 11:01 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Feb 14, 2022 at 02:25:47PM -0800, T.J. Mercier wrote:
> > On Fri, Feb 11, 2022 at 11:19 PM Greg Kroah-Hartman
> > > > --- a/include/uapi/linux/android/binder.h
> > > > +++ b/include/uapi/linux/android/binder.h
> > > > @@ -137,6 +137,7 @@ struct binder_buffer_object {
> > > >
> > > >  enum {
> > > >       BINDER_BUFFER_FLAG_HAS_PARENT = 0x01,
> > > > +     BINDER_BUFFER_FLAG_SENDER_NO_NEED = 0x02,
> > > >  };
> > > >
> > > >  /* struct binder_fd_array_object - object describing an array of fds in a buffer
> > > > --
> > > > 2.35.1.265.g69c8d7142f-goog
> > > >
> > >
> > > How does userspace know that binder supports this new flag?
> >
> > Sorry, I don't completely follow even after Todd's comment. Doesn't
> > the presence of BINDER_BUFFER_FLAG_SENDER_NO_NEED in the header do
> > this?
>
> There is no "header" when running a new kernel on an old userspace,
> right?  How about the other way around, old kernel, new userspace?

1. new kernel + old userspace = kernel supports the feature but
userspace does not use it. The old userspace won't even mount the new
cgroup controller, accounting is not performed, charge is not
transferred.
2. old kernel + new userspace = the new cgroup controller is not
supported by the kernel, accounting is not performed, charge is not
transferred.
3. old kernel + old userspace = same as #2
4. new kernel + new userspace = cgroup is mounted, feature is
supported and used.
Does that work or do we need a separate indication of whether binder
driver supports the charge transfer feature?

>
> > So wouldn't userspace need to be compiled against the wrong
> > kernel headers for there to be a problem? In that case the allocation
> > would still succeed, but there would be no charge transfer and
> > unfortunately no error code.
>
> No error code is not good.  People upgrade their kernels all the time,
> and do not do a "rebuild the world" when doing so.
>
> > > And where is the userspace test for this new feature?
> >
> > I tested this on a Pixel after modifying the gralloc implementation to
> > mark allocated buffers as not used by the sender. This required
> > setting the BINDER_BUFFER_FLAG_SENDER_NO_NEED in libhwbinder. That
> > code can be found here:
> > https://android-review.googlesource.com/c/platform/system/libhwbinder/+/1910752/1/Parcel.cpp
> > https://android-review.googlesource.com/c/platform/system/libhidl/+/1910611/
> >
> > Then by inspecting gpu.memory.current files in sysfs I was able to see
> > the memory attributed to processes other than the graphics allocator
> > service. Before this change, several megabytes of memory were
> > attributed to the graphics allocator service but those buffers are
> > actually used by other processes like surfaceflinger, the camera, etc.
> > After the change, the gpu.memory.current amount for the graphics
> > allocator service was 0 and the charges showed up in the
> > gpu.memory.current files for those other processes like this:
> >
> > PID: 764 Process Name: zygote64
> > system 8192
> > system-uncached 23191552
> >
> > PID: 529 Process Name: /system/bin/surfaceflinger
> > system-uncached 109535232
> > system 92196864
> >
> > PID: 530 Process Name:
> > /vendor/bin/hw/android.hardware.graphics.allocator@4.0-service
> > system-uncached 0
> > system 0
> > sensor_direct_heap 0
> >
> > PID: 806 Process Name:
> > /apex/com.google.pixel.camera.hal/bin/hw/android.hardware.camera.provider@2.7-service-google
> > system 1196032
> >
> > PID: 4608 Process Name: com.google.android.GoogleCamera
> > system 2408448
> > system-uncached 38887424
> > sensor_direct_heap 0
> >
> > PID: 32102 Process Name: com.google.android.googlequicksearchbox:search
> > system-uncached 91279360
> > system 20480
> >
> > PID: 2758 Process Name: com.google.android.youtube
> > system-uncached 1662976
> > system 8192
> >
> > PID: 2517 Process Name: com.google.android.apps.nexuslauncher
> > system-uncached 115662848
> > system 122880
> >
> > PID: 2066 Process Name: com.android.systemui
> > system 86016
> > system-uncached 37957632
> >
> > >  Isn't there a binder test framework somewhere?
> >
> > Android has the Vendor Test Suite where automated tests could be added
> > for this. Is that what you're thinking of?
>
> tools/testing/selftests/ is a good start.  VTS is the worst-case as no
> one can really run that on their own, but it is better than nothing.
> Having no test at all for this is not ok.
>
> thanks,
>
> greg k-h
