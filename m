Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBD330B99E
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 09:27:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F9DC6E09C;
	Tue,  2 Feb 2021 08:27:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B0FD6E857
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 17:47:33 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id l23so12843532qtq.13
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Feb 2021 09:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AgfUeIVe1jpb/M6F0P7bbhlcNBnqRJlGtPeSWlWrNwg=;
 b=H3FaZxxzyZuwtJZDw+X2VKJudCQdCMJ2ygYLi0Qf5V//mVWO6L7WqlcwQ9U8E9ond5
 RUDoDd46ns28Shvs5MmoCtde6j5hHJ8Rvk7xGfNqpMMeePmV6Q/98InzgoTcUVbVfEBi
 3HV9cQ6j/cTZM1ylVBX6OIA/aYVXfC5kUr2sh8swHJiuN7SOrhRitf9VHgyq4m8Mxmdr
 I1/lArVNRLNw0LfAk+Zce4cLwosv1bpImH2f2WQFNnVEMz5WS8LigXq7/PvsCEua1ofq
 4Ezuedv9Dm5gK6d7zUQvV6d3N4IjLBqaHWNK3+qVtk1QTWLB6DsmEdChP31AH4xxmITJ
 ZeZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AgfUeIVe1jpb/M6F0P7bbhlcNBnqRJlGtPeSWlWrNwg=;
 b=PSWC0w618scBtMMmCBzSDQDuKU/cRpdKGGSIBTZcPZKrma3QT6mAQGyYRAfoZCwNo9
 zzwWirsmpuqgmIPYNgyXR2v8zSL8C3QuqPMpw5LxpRx24ImTEr3i1ExMT72ksdj4rARs
 Ub6/ZlGYALmJ6MyOWC7IPM8GA+mI6yRJflN2293GhGZceh2SLah0O+y2Y6GU5wmXy9gT
 C1LIJmtkH2toJx7go/Ffbj5NM1PRpY/QOyW9IQJHCJnW4Z4O3edrrHx1WA8Ztb3a3AcI
 JeUQr1Sri5suwHIT/9oTlpNgkwx34naI6HhIpK/9sPd4kBSygLzGej9NtjUkPGXBia7z
 2z1w==
X-Gm-Message-State: AOAM53151I+f03Uoo5gK91OeNcksIGnBUqIi8Xnkf0Ikf5U8KlAYmvnA
 vb6on4TxRtb0zhDbX99HapqwX7/qDSn8pmx6Y2VP3A==
X-Google-Smtp-Source: ABdhPJxMOaZ0yLi1yAK38wxAgfwraVY6iPAY9diM58gAjj5k0njFutl/YoK2inviAy8R2Ly4etp6FDp3dTzQV9acQjM=
X-Received: by 2002:ac8:6f0f:: with SMTP id g15mr2486401qtv.322.1612201652050; 
 Mon, 01 Feb 2021 09:47:32 -0800 (PST)
MIME-Version: 1.0
References: <20210126204240.418297-1-hridya@google.com>
 <YBFXPbePURupbe+y@kroah.com>
 <CAO_48GHrpi9XxPhP2evwH_ZJmbVSWqxCvsYg6S2Syh-mrWBHzA@mail.gmail.com>
 <c0684400-c1e2-0ebd-ad09-cb7b24db5764@gmail.com>
 <CAO_48GGsOTLdqAQMO9vrLtWAKG6spByMC-GXwDv_f3ENvpemfA@mail.gmail.com>
 <Fu3J-fHQvkd_umZraMnhxQhFJR_JCDmgUssMBA4GJgRwo4UpIPKvVSh51Os9FQkABkhSL6tmEAV4vwBZa7hFWFTgujmjaBmrgqJJ75KM8ZU=@emersion.fr>
 <CAO_48GEzi2b5M8Gv2E2L1s76VcPksA812ZqY1ihbpxkDkwb5_A@mail.gmail.com>
In-Reply-To: <CAO_48GEzi2b5M8Gv2E2L1s76VcPksA812ZqY1ihbpxkDkwb5_A@mail.gmail.com>
From: Hridya Valsaraju <hridya@google.com>
Date: Mon, 1 Feb 2021 09:46:54 -0800
Message-ID: <CA+wgaPPfUcNGnW-GKZxtkzniMZcM=sNG7AHS+tUu=B2jCStOzw@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH v3] dmabuf: Add the capability to expose
 DMA-BUF stats in sysfs
To: Sumit Semwal <sumit.semwal@linaro.org>
X-Mailman-Approved-At: Tue, 02 Feb 2021 08:27:00 +0000
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
Cc: kernel test robot <lkp@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Linaro MM SIG <linaro-mm-sig@lists.linaro.org>,
 Hyesoo Yu <hyesoo.yu@samsung.com>, Greg KH <gregkh@linuxfoundation.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Android Kernel Team <kernel-team@android.com>,
 Christian Koenig <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 28, 2021 at 6:35 AM Sumit Semwal <sumit.semwal@linaro.org> wrote:
>
> Hi Simon,
>
> On Thu, 28 Jan 2021 at 20:01, Simon Ser <contact@emersion.fr> wrote:
> >
> > On Thursday, January 28th, 2021 at 1:03 PM, Sumit Semwal <sumit.semwal@linaro.org> wrote:
> >
> > > Since he didn't comment over Hridya's last clarification about the
> > > tracepoints to track total GPU memory allocations being orthogonal to
> > > this series, I assumed he agreed with it.
> >
> > IIRC he's away this week. (I don't remember when he comes back.)
> >
> > > Daniel, do you still have objections around adding this patch in?
> >
> > (Adding him explicitly in CC)
> Thanks for doing this!
>
> Best,
> Sumit.

Thank you all for the help :)

Regards,
Hridya
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
