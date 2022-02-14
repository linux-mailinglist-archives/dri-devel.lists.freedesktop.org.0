Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F212D4B5C56
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 22:15:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF89110E227;
	Mon, 14 Feb 2022 21:15:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 144A210E227
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 21:15:28 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id c6so50091051ybk.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 13:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=koOwKzeH7/Gb78FEuOvCok9kPJwObv2S7DVJdDdOgNA=;
 b=Pb5dbCHSbOY7B3ORjcQJ4tOqYQjm9jFUDuW4A8Uw3ddfl/KioQspJ7vPApWeypuuyQ
 AbdlnFPPC52dg3yNb0beEJdpRbmFdEDeTuxJF39E+eg6ecEa/6ji0TduWQr0JYt33wqk
 F00WTtwEQGRE8fkzuYE19P4BzBBNjs+GOqaHl31cAznCEZMsRqDikQkTwDJclPuKCvxV
 kmxmrEI4FfjSSPAK5el+JyX7Hj1ZqafjYSIjdKPhGDhpAMZDyhpvvBv0wjDJRI2gXsaV
 ekGOhI3vLetimUVdXqmZTzeAxc7HUExrhEQoRc2Vs4Ips6kQQ/pBnxkN2I0ZLJPdeW+t
 EH2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=koOwKzeH7/Gb78FEuOvCok9kPJwObv2S7DVJdDdOgNA=;
 b=td5/o3SCOm4uRXgs7O3LlGMjc3etJmRa5fexi9e0FdE026iDxvFaiaQ+91Py3SOrga
 m8tjixAlyXS0fOC8Yq8QiMS+DRVLp84J+twkUJzpCVE4ZHRT5xId2x5y6At6C1HWQ1Vz
 6g6txEePM3z/GnKW5hGOtlDlcKw1p2DSkJp9XxRkjWHmsXp5zb0/jAJJEdDSjcxXv/XX
 kpuuLm7kM0P+UGsRI7MAvnwtuz4vceSohFEUUancWx89gptQGe8jBaDWHk9l/myK6OkH
 KVBhSy6NX1lTOZov0d8vE+5NR05C2V+cvSCR0nh4jjcBpvZF0unBGNokBo/JD8I0OW8M
 hHFw==
X-Gm-Message-State: AOAM531UD+BFrOkDWp09YEPPxUGGYy9q1yqCQktWw+/B68nR4YU1HmWY
 h+bmrRTfcDdkMjZa512Qyq6dgY84+SN8rTh95vhLQA==
X-Google-Smtp-Source: ABdhPJxYpCGSJ97h8+PYs4ql8r4Wi52kEXKqBk5pvfZj6f9b/g73lOi4fZfqGVy147NfKJkJXNKE6/edp4TkHfyblNY=
X-Received: by 2002:a25:ad18:: with SMTP id y24mr1012325ybi.420.1644873327127; 
 Mon, 14 Feb 2022 13:15:27 -0800 (PST)
MIME-Version: 1.0
References: <20220211161831.3493782-1-tjmercier@google.com>
 <20220211161831.3493782-7-tjmercier@google.com> <Ygdfe3XSvN8iFuUc@kroah.com>
 <CAHRSSEwoJ67Sr_=gtSaP91cbpjJjZdOo57cfAhv3r-ye0da7PA@mail.gmail.com>
 <CAJuCfpHf=Ewm0e9kguY3MEGVHU_cyviVXByi0oQtq7kTtOOD=A@mail.gmail.com>
 <CAHRSSEzsn-EVKXTRfmpbPR9u0wNpdvdZoX64Tm_mB1DQMRSUPQ@mail.gmail.com>
 <CALAqxLVeLsv9ESCL2EoZQ8-tRgp0V+tmdYbkyakFetf=ewTH+A@mail.gmail.com>
In-Reply-To: <CALAqxLVeLsv9ESCL2EoZQ8-tRgp0V+tmdYbkyakFetf=ewTH+A@mail.gmail.com>
From: Hridya Valsaraju <hridya@google.com>
Date: Mon, 14 Feb 2022 13:14:51 -0800
Message-ID: <CA+wgaPM8AmQ4g6pDSwRABtc7hq11XMw+kH-rRkB8xNGJhM3OKA@mail.gmail.com>
Subject: Re: [RFC v2 6/6] android: binder: Add a buffer flag to relinquish
 ownership of fds
To: John Stultz <john.stultz@linaro.org>
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
 Sumit Semwal <sumit.semwal@linaro.org>, Kenny.Ho@amd.com,
 Jonathan Corbet <corbet@lwn.net>, Suren Baghdasaryan <surenb@google.com>,
 Laura Abbott <labbott@redhat.com>, linux-media <linux-media@vger.kernel.org>,
 Todd Kjos <tkjos@android.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 cgroups mailinglist <cgroups@vger.kernel.org>,
 Martijn Coenen <maco@android.com>, "T.J. Mercier" <tjmercier@google.com>,
 Christian Brauner <brauner@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>,
 Todd Kjos <tkjos@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 14, 2022 at 12:37 PM John Stultz <john.stultz@linaro.org> wrote:
>
> On Mon, Feb 14, 2022 at 12:19 PM Todd Kjos <tkjos@google.com> wrote:
> > On Mon, Feb 14, 2022 at 11:29 AM Suren Baghdasaryan <surenb@google.com> wrote:
> > > On Mon, Feb 14, 2022 at 10:33 AM Todd Kjos <tkjos@google.com> wrote:
> > > >
> > > > Since we are creating a new gpu cgroup abstraction, couldn't this
> > > > "transfer" be done in userspace by the target instead of in the kernel
> > > > driver? Then this patch would reduce to just a flag on the buffer
> > > > object.
> > >
> > > Are you suggesting to have a userspace accessible cgroup interface for
> > > transferring buffer charges and the target process to use that
> > > interface for requesting the buffer to be charged to its cgroup?
> >
> > Well, I'm asking why we need to do these cgroup-ish actions in the
> > kernel when it seems more natural to do it in userspace.

This was our plan originally i.e. to create a cgroup interface that
userspace could use for explicit charge transfer. However, in our
initial discussions with all interested parties and cgroup maintainers
we reached a conclusion that an explicit charge transfer UAPI for the
cgroup controller did not fit in with the current cgroup
charge/uncharge mechanisms. Like John mentioned, the charge transfer
during binder IPC was suggested by Daniel during LPC.

Regards,
Hridya

> >
>
> In case its useful, some additional context from some of the Linux
> Plumber's discussions last fall:
>
> Daniel Stone outlines some concerns with the cgroup userland handling
> for accounting:
>   https://youtu.be/3OqllZONTiQ?t=3430
>
> And the binder ownership transfer bit was suggested here by Daniel Vetter:
>   https://youtu.be/3OqllZONTiQ?t=3730
>
> thanks
> -john
