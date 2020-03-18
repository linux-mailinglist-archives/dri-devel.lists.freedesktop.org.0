Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8402118928E
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 01:16:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8F1B89DAB;
	Wed, 18 Mar 2020 00:16:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE42089DA8;
 Wed, 18 Mar 2020 00:16:16 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id r7so1066720wmg.0;
 Tue, 17 Mar 2020 17:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z0F8dcnw8GckOaa6ldpJ2ShvxTCMiGL5hWZMpwK3BII=;
 b=Nclc+5+7JU/rKvad0iuuFeK3/YT8Cv7bO70fBBL4uEJwscQjHClt/r9GVME3oXZuPH
 dfhCxFvVufIW1HuAFKAWR0waZwMTI58KQyFdErrHAUr+GgmoelaB/32vVYVrXGDM4OG2
 VYQZUf13g02uPcN+I7aPr61mTXEjaWxyVMpys3LFU2ocGHjELxqR5kkOXsAqr/pD6gop
 45Rz79Q/kvjQL8l5m2u8gkkVMzYE0NHNJTGRN7tMPc3qsTy5H9PEi0M7bI8WESr38DAK
 1s6+sWGpbRz0K30wYZUcheUQY4MCgwaKRNe8XnVGk8CVevErxi5MVfjpFkrjQGSJBto8
 dDqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z0F8dcnw8GckOaa6ldpJ2ShvxTCMiGL5hWZMpwK3BII=;
 b=qL5PXFJYsFlFXUSra2ztueDmVt6zZRnC1hPDK/crsckpdWFq1cHCcz/enjfPrkrEmn
 wloTu2nlhcSBQUipRXVFyKomHzoe83L6giQoqOHQyWdCPIGSwvn5S1z9eHADGw+d6V9n
 0vNMFNT7ss1/Xh3qhhDtjzhbmVTu4UhRuYvhZC3qMPYzSUButl1CPEQFkZ8EV4v3Rg/2
 /EortPw77f2MJqrpWAmxALM2vltpoSqsU2MKfYqroa7jb4dzz9WNx3pohuJ8gVhUahw2
 DFV8FRssgDCRW+GJAOPdMxfvsFk/xSGhLDnSr9zBMfnFhaGRvgebZQZde+mbNZFmsM7C
 4Frg==
X-Gm-Message-State: ANhLgQ3kZlt4zinL3CoPdD4FfC7snOxCuIR/Cp1WMWFcDHAcebMzgvfL
 oHs+n3MXZtkBTasR16oLRqYYfLM+nYaSo7cSMpo=
X-Google-Smtp-Source: ADFU+vtcc0P+wc74IAqBGJt6hqHUGqN4v8QezAbJPX1woPJdWN2w+eWwdQD1jg1dc8mZgWWHMeqAn0jjnsV00D54RNU=
X-Received: by 2002:a1c:b789:: with SMTP id h131mr1441454wmf.141.1584490575487; 
 Tue, 17 Mar 2020 17:16:15 -0700 (PDT)
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
In-Reply-To: <949b8373908a9895e97981e872d6e35dcaaba632.camel@lynxeye.de>
From: Jacob Lifshay <programmerjake@gmail.com>
Date: Tue, 17 Mar 2020 17:16:04 -0700
Message-ID: <CAC2bXD5+KwBXBo-qHWkGw+=cH_AytwS=jeDGbskXcmO0rfsREw@mail.gmail.com>
Subject: Re: [Mesa-dev] Plumbing explicit synchronization through the Linux
 ecosystem
To: Lucas Stach <dev@lynxeye.de>
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
 linux-media@vger.kernel.org,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "wayland-devel @ lists . freedesktop . org"
 <wayland-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jason Ekstrand <jason@jlekstrand.net>,
 ML mesa-dev <mesa-dev@lists.freedesktop.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 Discussion of the development of and with GStreamer
 <gstreamer-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 17, 2020 at 11:14 AM Lucas Stach <dev@lynxeye.de> wrote:
>
> Am Dienstag, den 17.03.2020, 10:59 -0700 schrieb Jacob Lifshay:
> > I think I found a userspace-accessible way to create sync_files and
> > dma_fences that would fulfill the requirements:
> > https://github.com/torvalds/linux/blob/master/drivers/dma-buf/sw_sync.c
> >
> > I'm just not sure if that's a good interface to use, since it appears
> > to be designed only for debugging. Will have to check for additional
> > requirements of signalling an error when the process that created the
> > fence is killed.
>
> Something like that can certainly be lifted for general use if it makes
> sense. But then with a software renderer I don't really see how fences
> help you at all. With a software renderer you know exactly when the
> frame is finished and you can just defer pushing it over to the next
> pipeline element until that time. You won't gain any parallelism by
> using fences as the CPU is busy doing the rendering and will not run
> other stuff concurrently, right?

There definitely may be other hardware and/or processes that can
process some stuff concurrently with the main application, such as the
compositor and or video encoding processes (for video capture).
Additionally, from what I understand, sync_file is the standard way to
export and import explicit synchronization between processes and
between drivers on Linux, so it seems like a good idea to support it
from an interoperability standpoint even if it turns out that there
aren't any scheduling/timing benefits.

Jacob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
