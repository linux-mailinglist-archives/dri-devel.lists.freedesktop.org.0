Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBF2324352
	for <lists+dri-devel@lfdr.de>; Wed, 24 Feb 2021 18:48:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FA6A6EB16;
	Wed, 24 Feb 2021 17:48:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F5006EAC3;
 Wed, 24 Feb 2021 17:48:10 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id f20so2885018ioo.10;
 Wed, 24 Feb 2021 09:48:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Bv5RQcdIfShLFylSDZtYk4PaZOVGAzg45snN8Ej9HqI=;
 b=IXgN3HdenaZtyVyP5PIcEQ5pneHizqeN2xeGZEUGllHe03pqB9VgGu/ME2gzmLVBLF
 oC1RELM/RVYlQpdd2IaXnMkWyJq2GLgBknQksbGip953xudV1WP90mnJvHfpgzsh73mC
 Yg5yKkpZKTEJNZCdv03pjuVM7ngoEn+aEvCR1ShYGJPzEq8xP+in6KG94mlsvfMNidnL
 Fdyic+4+uj7aKHoZopPdt6AJC5Z+cIUzzQsM28Oh/IVzUCSCT5uQ0mhkG0OKcdiTpKy5
 aKTrPv+GVzrMHlipvzz9ewhsyvJPPkm06MFXS2ov8PjeoxKkG9ialKvWVreqZgLm2yrE
 qLcw==
X-Gm-Message-State: AOAM5305PyId52JuZwft/KyGB5T56BJyF0kI/IiB3PLqq4SPCDqa//gz
 gCg8nICOq//eUJpGOAlfMnWJA/QWMu44DdbQkho=
X-Google-Smtp-Source: ABdhPJyPsqeDDT52Q4AE9Ft31pyz1XZ8gSO1OiAoqFS2of8Tjt9qlj27WdIV8SzQtua/v9tE6qDWNcMAbmesEzZHX8k=
X-Received: by 2002:a05:6638:2a3:: with SMTP id
 d3mr5867570jaq.42.1614188889711; 
 Wed, 24 Feb 2021 09:48:09 -0800 (PST)
MIME-Version: 1.0
References: <CAKb7Uvji_+N+b8HghZckU-uSBWn-=BZwNAiUff2oitbVuNUE2Q@mail.gmail.com>
 <YDUkfjDA4xLJlxE5@pflmari> <YDUr2OGDsxDyC0l2@pflmari>
 <CAKb7UvjmdgS536tNzisomi_oXOGk3Q+anp0AfPvA8OruU_9m5Q@mail.gmail.com>
 <YDYXiTm7MDXgYT7H@pflmari>
 <CAKb7UvgQXXThAfqJo+FEfUbgLtGzb2kvg9aSFXZn_XWivsv48Q@mail.gmail.com>
 <YDaAQts9LIb5h3xd@pflmari>
 <CAKb7Uvi8GUe+F3oMOwtAxOAi5ffF=b=9XYv+fZf742frroXfSA@mail.gmail.com>
 <YDaEiDkTiqhy/r+i@pflmari>
 <CAKb7UviFdgqqSrFvZJzfenaKa_0P6hJ4SaDrwA39Lz8jVigDGw@mail.gmail.com>
 <YDaGtzRDUIbErYDY@pflmari>
In-Reply-To: <YDaGtzRDUIbErYDY@pflmari>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Wed, 24 Feb 2021 12:47:58 -0500
Message-ID: <CAKb7UvjBQeb84sitYUTLOd6EJo_+_9hXjmT=8r5V1onxtUMh7g@mail.gmail.com>
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

On Wed, Feb 24, 2021 at 12:03 PM Alex Riesen
<alexander.riesen@cetitec.com> wrote:
>
> Ilia Mirkin, Wed, Feb 24, 2021 17:57:41 +0100:
> > On Wed, Feb 24, 2021 at 11:53 AM Alex Riesen <alexander.riesen@cetitec.com> wrote:
> > > Ilia Mirkin, Wed, Feb 24, 2021 17:48:39 +0100:
> > > > Just to be crystal clear -- are you saying that 128x128 works or does
> > > > not work? (You said "yes", which would imply it works OK, but then you
> > > > said both cases, which would imply doesn't work since 256x256 doesn't
> > > > work?)
> > >
> > > Modetest with 128x128 cursor works. Without damage to the cursor: modetest
> > > shows normal cursor in vanilla v5.11. Modetest also shows normal cursor in
> > > vanilla v5.11 with the commit reverted.
> >
> > But modetest with 256x256 doesn't work (correctly) right? Or did I
> > misunderstand?
>
> Right. That's why I was asking if I did everything right: it was just corrupted
> in both kernels.

OK. So 128x128 works, 256x256 does not. Interesting.

>
> > All the patch does is allow those large cursors to be used, which gets
> > reported via drm APIs and modesetting picks the largest cursor
> > available. (And actually I think it's even not required to use the
> > large cursors, it just controls what's reported in the defaults to
> > userspace.)
>
> Maybe something in X code is not prepared to handle the kernel reporting
> large cursor support? Even though 128x128 is pretty large, and I don't think
> I even use that large cursors in X configuration. How can I check?

Yes, 64x64 is enough for anyone (or was it 640kb?) But it's unlikely
to be an issue. I believe that AMD also exposes 256x256 cursors
depending on the gen:

display/dc/dce100/dce100_resource.c:    dc->caps.max_cursor_size = 128;
display/dc/dce110/dce110_resource.c:    dc->caps.max_cursor_size = 128;
display/dc/dce112/dce112_resource.c:    dc->caps.max_cursor_size = 128;
display/dc/dce120/dce120_resource.c:    dc->caps.max_cursor_size = 128;
display/dc/dce60/dce60_resource.c:      dc->caps.max_cursor_size = 64;
display/dc/dce60/dce60_resource.c:      dc->caps.max_cursor_size = 64;
display/dc/dce60/dce60_resource.c:      dc->caps.max_cursor_size = 64;
display/dc/dce80/dce80_resource.c:      dc->caps.max_cursor_size = 128;
display/dc/dce80/dce80_resource.c:      dc->caps.max_cursor_size = 128;
display/dc/dce80/dce80_resource.c:      dc->caps.max_cursor_size = 128;
display/dc/dcn10/dcn10_resource.c:      dc->caps.max_cursor_size = 256;
display/dc/dcn20/dcn20_resource.c:      dc->caps.max_cursor_size = 256;
display/dc/dcn21/dcn21_resource.c:      dc->caps.max_cursor_size = 256;
display/dc/dcn30/dcn30_resource.c:      dc->caps.max_cursor_size = 256;

which should have the equivalent effect.

But since you're seeing issues with modetest as well (which uses the
ioctl's pretty directly), presumably Xorg is not to blame.

It's easy enough to adjust the kernel to report a lower size (and
reject the larger cursors), I just want to understand which gens are
affected by this.

Cheers,

  -ilia
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
