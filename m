Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6FC1893E8
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 03:08:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D9A86E855;
	Wed, 18 Mar 2020 02:08:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F38286E03A
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 02:08:48 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id a20so29157662edj.2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 19:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KtCtESfP2RJ+UQlTlsgfDLNuleLeMxvn/M3hDuKDuVA=;
 b=iJncB9kDMcFuKy8eH656PL3+cXSsYGca9R2gvOHn2e1PEsamTeIU5Um3/AGbAuHmu2
 NP69qsPm0RFg3dCBe0i8KGVJmw4h9RutvvbOgk2H88l3uyWOhz1jmEJs9b/Fg+7bMOV0
 IqWQz+RTuT3Ixy1Gr6juLU5w8zXQoJsXZmY6qh2STjKg3yruTJwNG2+R4Nioug7y/0NG
 UIipgHUMk03uCmZQfzQzku2isIkCNnF6Ii1zMpcG3uLbPTdw9E+et7mQcfSsjGmYOTIa
 4B4ylrN1BnKAvDVe++cmKV7cotGNugP7L353v8/rNcI/IIhTTsQTmpdiZqua8tSl99UO
 RNYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KtCtESfP2RJ+UQlTlsgfDLNuleLeMxvn/M3hDuKDuVA=;
 b=LlXGA1K/eIscclnzopSOp+olu53LouiHeCtmDGjYyR0/NRTwajL/79SLlQgKFVTu3D
 VYzmSXyp6jvyozYINPOR+6LDQP1HymVKeXUDrd7TOWj7q7cQNZj3Ru9jQBRdlbVfX1OM
 jp6Al1fWqx89Ag2WK2nQvSgnlx8dSn1U+AZ8pscimFKiDv4oT2FB6Un9CIPhI9AiyAg1
 oY+DYk0XLZQIbv45GwVYRTgB+R1UucIK65rD9fK9KLNwirdW17tHp84UQfehX8jcgSzR
 XqmRO1n7r2L6Pilc0d3k2cli8cxHVg9cQI/gzR8DdQEovcz8K9EbGnJKkcao+H5DK02l
 UGfQ==
X-Gm-Message-State: ANhLgQ2OBjVtlsW9zAO5X+Uqnkhe+F8hKO3SenDenmZx8gkkoHgxPjBl
 D+wpku3stuFR+MuH+Cj4EAPCKPKQkRb2wYpmDzMCYw==
X-Google-Smtp-Source: ADFU+vvV879DJuRGC0jOx87R5v3zXTm9Oujnnjf+ruLLjoLML15NWofQWkwPHN/olW8IhOFsKgIDp2tJMAADasGvZ9o=
X-Received: by 2002:aa7:d585:: with SMTP id r5mr1595130edq.241.1584497327435; 
 Tue, 17 Mar 2020 19:08:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAOFGe94jy2VYDPbkMW8ZuNdAeM+HS8sM1OAYFGd9JKc1V7PVOQ@mail.gmail.com>
 <CAOFGe97LnmEHVoitgKdo+hbw9rYacofkzkt3pPcQSaw9BaKyaA@mail.gmail.com>
 <33d1749d876a83416c44671efcb37c74f87d1bd4.camel@ndufresne.ca>
 <20200316102034.GA30883@pendragon.ideasonboard.com>
 <CAOFGe95JUUBCuE=dWKtZVXjTLqxyf2oybpqAZ7hZhpBEKQ=Y-Q@mail.gmail.com>
 <20200316211502.GW4732@pendragon.ideasonboard.com>
 <74477a20fa78758dd6cf8c32d7a77d1cccf2646f.camel@ndufresne.ca>
 <CAOFGe963WUB+rkA=FURuXEk6BVjsP18yk4sJ3y_7VxKmscShrA@mail.gmail.com>
 <CAC2bXD5qJgT9sWJgL_ej5OY42a-xzYaeLrwioKUreQuPJ1idpg@mail.gmail.com>
 <3e522876ec0287b69483c65aa1e7ba1ded536ec6.camel@lynxeye.de>
 <CAC2bXD6f2LiJ9_S0V8gZdrczRzH8oNqyLprzzFnGYTMzGe5gUQ@mail.gmail.com>
 <949b8373908a9895e97981e872d6e35dcaaba632.camel@lynxeye.de>
 <CAC2bXD5+KwBXBo-qHWkGw+=cH_AytwS=jeDGbskXcmO0rfsREw@mail.gmail.com>
In-Reply-To: <CAC2bXD5+KwBXBo-qHWkGw+=cH_AytwS=jeDGbskXcmO0rfsREw@mail.gmail.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Tue, 17 Mar 2020 21:08:36 -0500
Message-ID: <CAOFGe94gmWZOA7sB0jDXoZyj=i1id25gR2-kX87GA+fB=AJ2RQ@mail.gmail.com>
Subject: Re: [Mesa-dev] Plumbing explicit synchronization through the Linux
 ecosystem
To: Jacob Lifshay <programmerjake@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, xorg-devel <xorg-devel@lists.x.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "wayland-devel @ lists . freedesktop . org"
 <wayland-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 ML mesa-dev <mesa-dev@lists.freedesktop.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 Discussion of the development of and with GStreamer
 <gstreamer-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 17, 2020 at 7:16 PM Jacob Lifshay <programmerjake@gmail.com> wrote:
>
> On Tue, Mar 17, 2020 at 11:14 AM Lucas Stach <dev@lynxeye.de> wrote:
> >
> > Am Dienstag, den 17.03.2020, 10:59 -0700 schrieb Jacob Lifshay:
> > > I think I found a userspace-accessible way to create sync_files and
> > > dma_fences that would fulfill the requirements:
> > > https://github.com/torvalds/linux/blob/master/drivers/dma-buf/sw_sync.c
> > >
> > > I'm just not sure if that's a good interface to use, since it appears
> > > to be designed only for debugging. Will have to check for additional
> > > requirements of signalling an error when the process that created the
> > > fence is killed.

It is expressly only for debugging and testing.  Exposing such an API
to userspace would break the finite time guarantees that are relied
upon to keep sync_file a secure API.

> > Something like that can certainly be lifted for general use if it makes
> > sense. But then with a software renderer I don't really see how fences
> > help you at all. With a software renderer you know exactly when the
> > frame is finished and you can just defer pushing it over to the next
> > pipeline element until that time. You won't gain any parallelism by
> > using fences as the CPU is busy doing the rendering and will not run
> > other stuff concurrently, right?
>
> There definitely may be other hardware and/or processes that can
> process some stuff concurrently with the main application, such as the
> compositor and or video encoding processes (for video capture).
> Additionally, from what I understand, sync_file is the standard way to
> export and import explicit synchronization between processes and
> between drivers on Linux, so it seems like a good idea to support it
> from an interoperability standpoint even if it turns out that there
> aren't any scheduling/timing benefits.

There are different ways that one can handle interoperability,
however.  One way is to try and make the software rasterizer look as
much like a GPU as possible:  lots of threads to make things as
asynchronous as possible, "real" implementations of semaphores and
fences, etc.  Another is to let a SW rasterizer be a SW rasterizer: do
everything immediately, thread only so you can exercise all the CPU
cores, and minimally implement semaphores and fences well enough to
maintain compatibility.  If you take the first approach, then we have
to solve all these problems with letting userspace create unsignaled
sync_files which it will signal later and figure out how to make it
safe.  If you take the second approach, you'll only ever have to
return already signaled sync_files and there's no problem with the
sync_file finite time guarantees.

--Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
