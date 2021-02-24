Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 398F232429B
	for <lists+dri-devel@lfdr.de>; Wed, 24 Feb 2021 17:57:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE3D16EAF0;
	Wed, 24 Feb 2021 16:57:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDF466E059;
 Wed, 24 Feb 2021 16:57:52 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id y202so2735897iof.1;
 Wed, 24 Feb 2021 08:57:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DiuNOE/QvBBAAkdvrkp6oqtC/Rkbc4OlZHXegrcpQ3k=;
 b=ZnmEDEvVDM6XRsWQSBQbWX5C1BDWIOWZlkam8UB+1bkGBb9HnT6wcHdiPCzBBerXIo
 3AhE3qlyjkNzMz59JM7YMfgqct3FnURfsG09g3x9nMP3YYxZx6NKD6/4S3xnSYJvvCo7
 NPMk/Fh9uMpE8SxQyt9gRvvowPeplx8Y/Wba22mXPoQ8OnDSajRUN+rZrsnfFq3SXpi5
 wj1JPP4sWdTPbf78KKlTgPtg+lHDxevEUK8ZAQPYE22mEL0GhnaHHiVc0MHJFmq5OKzc
 rOMWnQMo0gVh2L8n8pnLNlMys+sv6odq87I8fX1C4TFbBoPP0UqUjg+7uW7wR4ZmGEVN
 vfEw==
X-Gm-Message-State: AOAM533ksFa2ZuTd3xwEnh/HGymvNxcoIILBIQ6KPlDqHzRCOAHF1FM1
 /juH/pWS9V1S5dowmLwQpJmrIzZuQik8jFLyhmE=
X-Google-Smtp-Source: ABdhPJw++YnGjDUbRz7Umw0dRjch4OKZuF/xdsdZfeYsxt4hJT0NeF07vjqNmm+BhKOMs+dTDiyAM8l3Cl6vzzfveAk=
X-Received: by 2002:a6b:f206:: with SMTP id q6mr25020073ioh.143.1614185872201; 
 Wed, 24 Feb 2021 08:57:52 -0800 (PST)
MIME-Version: 1.0
References: <CAKb7UvhFkw23so-a4JKLzpQLhphzjzarOy-9h+FiKP-aAC=4xw@mail.gmail.com>
 <YDUg/9fjsvTkRUqr@pflmari>
 <CAKb7Uvji_+N+b8HghZckU-uSBWn-=BZwNAiUff2oitbVuNUE2Q@mail.gmail.com>
 <YDUkfjDA4xLJlxE5@pflmari> <YDUr2OGDsxDyC0l2@pflmari>
 <CAKb7UvjmdgS536tNzisomi_oXOGk3Q+anp0AfPvA8OruU_9m5Q@mail.gmail.com>
 <YDYXiTm7MDXgYT7H@pflmari>
 <CAKb7UvgQXXThAfqJo+FEfUbgLtGzb2kvg9aSFXZn_XWivsv48Q@mail.gmail.com>
 <YDaAQts9LIb5h3xd@pflmari>
 <CAKb7Uvi8GUe+F3oMOwtAxOAi5ffF=b=9XYv+fZf742frroXfSA@mail.gmail.com>
 <YDaEiDkTiqhy/r+i@pflmari>
In-Reply-To: <YDaEiDkTiqhy/r+i@pflmari>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Wed, 24 Feb 2021 11:57:41 -0500
Message-ID: <CAKb7UviFdgqqSrFvZJzfenaKa_0P6hJ4SaDrwA39Lz8jVigDGw@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/nouveau/kms/nv50-: Report max cursor size to
 userspace
To: Alex Riesen <alexander.riesen@cetitec.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>, nouveau <nouveau@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 24, 2021 at 11:53 AM Alex Riesen
<alexander.riesen@cetitec.com> wrote:
>
> Ilia Mirkin, Wed, Feb 24, 2021 17:48:39 +0100:
> > On Wed, Feb 24, 2021 at 11:35 AM Alex Riesen <alexander.riesen@cetitec.com> wrote:
> > > Ilia Mirkin, Wed, Feb 24, 2021 16:10:57 +0100:
> > > > The fact that you're getting lines with modetest means there's
> > > > something wrong with 256x256. What if you do 128x128 -- does that work
> > > > OK?
> > >
> > > Yes. Unfortunately in both cases.
> >
> > Just to be crystal clear -- are you saying that 128x128 works or does
> > not work? (You said "yes", which would imply it works OK, but then you
> > said both cases, which would imply doesn't work since 256x256 doesn't
> > work?)
>
> Modetest with 128x128 cursor works. Without damage to the cursor: modetest
> shows normal cursor in vanilla v5.11. Modetest also shows normal cursor in
> vanilla v5.11 with the commit reverted.

But modetest with 256x256 doesn't work (correctly) right? Or did I
misunderstand?

All the patch does is allow those large cursors to be used, which gets
reported via drm APIs and modesetting picks the largest cursor
available. (And actually I think it's even not required to use the
large cursors, it just controls what's reported in the defaults to
userspace.)

Thanks,

  -ilia
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
