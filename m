Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E541E8122
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 17:03:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CDF06E925;
	Fri, 29 May 2020 15:03:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 294256E925
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 15:03:41 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id x6so3930195wrm.13
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 08:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=03FMsNXr6+sji79MISYEjdw77lKRx64tNyODjMEC8rI=;
 b=wb8af7Fh4K1LeZAPVqscHfDcLSfqve2rHXjN+ctZU8WMlNMgY9Q56tV7y/XDnCEbM2
 CD1BxRAIDxrHfNo542BWOD2iicSYwNApMQUauM0t8DbsJcIpKA68eUbDtrmR284s3npP
 JcPwU6mPfmdton4Awv27bO/g1eSydmR09wyfJi3Db+2nHim3vyDjOVoT0vBbYenDobAZ
 UOvPqNxS+fY0chvAKCgxw+HMGwsd0KlwJpcF7UlZVaGpOa7Bvr5IFUp9lmzJGHZRFsx/
 8tnUqDWw1F70bQDcoBqWrNLCJn3rCm8+w0biAMXrvJIVshBYiQu6QAL75jxeotxenumm
 oboA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=03FMsNXr6+sji79MISYEjdw77lKRx64tNyODjMEC8rI=;
 b=Qj/4JuCTScGJkOuZzso+SvkLd5ohKEzd8fKF3BBZYB75arjfQO9qbZTqmgiLcIyFFc
 +105QaqOLx8b5AVZOQS2aGzvKcEbH63v8yAqJNgES05h97OAnooNko+KSwkjctphWAYg
 o6LKBzc/3u3F+NW0a1rdI7jAew1lMtwYRdYRi0ybzFqII1th2uoot2Fs8YCxr2heH73q
 Sp5j+5//w63tCZTBUmPJal3qUeG+xj3W059QSydKIavfjntMyHR0ynYW7tBIXbN7nZzG
 vKlYJUG+n9O1Dn3SF4MN8GO+rXHOUMNNgECxAxl8qI7yjSyqmVVqKFdFaORQVfOaPYbX
 HyOQ==
X-Gm-Message-State: AOAM531hF8ztWEBS560BdjCqwuPw7TDAO5jJrYD2NXbbHO6Do+Ne+kgv
 U9MyPMidbEozs1zNgppm0JVe3oAFU48UyzVGILeZgQ==
X-Google-Smtp-Source: ABdhPJxG50BvTTLWrltJpdKKvA/5C1dE4A3uev1Q9fUh4uyyTP0/db4Va3LMvKaAYaxzFiiQywNelf/JjABn6GMIknk=
X-Received: by 2002:a5d:4245:: with SMTP id s5mr5963000wrr.6.1590764619658;
 Fri, 29 May 2020 08:03:39 -0700 (PDT)
MIME-Version: 1.0
References: <WOsdNGp0dhyp8Modsrt7DYpd0fVk7Yk264FISQ1Yls30bhlSXbxzgKTpmOCJ9H2WV1XHyUjCXu7nwBOWQ6n1NCbIcVl1-1IZ4rMMGN1dN-U=@emersion.fr>
 <CAAxE2A4NCo_KMkemUOHKbZ7P=GR4p-zwhpmP7Get18x4Ydb-Gg@mail.gmail.com>
 <bbZABMxDckHUj5JW5DW0pSewqQ-rAIW0gvNnTlI4np7o1A2bDrpPGIeyk5tXGMDr_cAI1l_R9qw6ykJ8OEhQlbKruJ8IG579jqADaPAnUbA=@emersion.fr>
 <CADnq5_MEFM_2k_uboU6E9d3_j18K+tz=Axtie-80PSSwJ2vkYw@mail.gmail.com>
 <CAPj87rMrJLNNbFJVvf081=eRqPqAe1H7=+PM21N22Jdsg7FzVQ@mail.gmail.com>
 <CADnq5_OX9o5_Gc4SjU5M4B=fthT9++J-FjX3UqTS7x_u6cJHOQ@mail.gmail.com>
 <CAPj87rP+Hxhohb4dEjRwtZzy34fYk+hAdgVfCkLF1u4JufJ=CQ@mail.gmail.com>
 <CADnq5_Pzj+AWQZWOcwvf8WQDVJrpc2DyG6Z1ZYqgfHA-8AXpMA@mail.gmail.com>
In-Reply-To: <CADnq5_Pzj+AWQZWOcwvf8WQDVJrpc2DyG6Z1ZYqgfHA-8AXpMA@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 29 May 2020 16:01:48 +0100
Message-ID: <CAPj87rNO62i5JmRLdMhAg9XbiJUyrrRO7fj1ruXRCh-oxHnifQ@mail.gmail.com>
Subject: Re: [PATCH v3] drm/fourcc: document modifier uniqueness requirements
To: Alex Deucher <alexdeucher@gmail.com>
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
Cc: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 29 May 2020 at 15:36, Alex Deucher <alexdeucher@gmail.com> wrote:
> On Fri, May 29, 2020 at 10:32 AM Daniel Stone <daniel@fooishbar.org> wrote:
> > On Fri, 29 May 2020 at 15:29, Alex Deucher <alexdeucher@gmail.com> wrote:
> > > Maybe I'm over thinking this.  I just don't want to get into a
> > > situation where we go through a lot of effort to add modifier support
> > > and then performance ends up being worse than it is today in a lot of
> > > cases.
> >
> > I'm genuinely curious: what do you imagine could cause a worse result?
>
> As an example, in some cases, it's actually better to use linear for
> system memory because it better aligns with pcie access patterns than
> some tiling formats (which are better aligned for the memory
> controller topology on the dGPU).  That said, I haven't been in the
> loop as much with the tiling formats on newer GPUs, so that may not be
> as much of an issue anymore.

Yeah, that makes a lot of sense. On the other hand, placement isn't
explicitly encoded for either modifiers or non-modifiers, so I'm not
sure how it would really regress.

In case it was missed somewhere, there is no generic code doing
modifier selection for modifier optimality anywhere. The flow is:
  - every producer/consumer advertises a list of modifier + format
pairs, declaring what they _can_ support
  - for every use where a buffer needs to be allocated, the generic
code intersects these lists of modifiers to determine the set of
modifiers mutually acceptable to all consumers
  - the buffer allocator is always handed a _list_ of modifiers, and
makes its own decision based on ??

For a concrete end-to-end example:
  - KMS declares which modifiers are supported for scanout
  - EGL declares which modifiers are supported for EGLImage import
  - Weston determines that one of its clients could be directly
scanned out rather than composited
  - Weston intersects the KMS + EGL set of modifiers to come up with
the optimal modifier set (i.e. bypassing composition)
  - Weston sends this intersected list to the client via the Wayland
protocol (mentioned in previous MR)
  - the client is using EGL, so Mesa receives this list of modifiers,
and passes this on to amdgpu
  - amdgpu uses magic inscrutable heuristics to determine the most
optimal modifier to use, and allocates a buffer based on that

Weston (or GNOME Shell, or Chromium, or whatever) will never be in a
position as a generic client to know that on Raven2 it should use a
particular supertiled layout with no DCC if width > 2048. So we
designed the entire framework to explicitly avoid generic code trying
to reason about the performance properties of specific modifiers.

What Weston _does_ know, however, is that display controller can work
with modifier set A, and the GPU can work with modifier set B, and if
the client can pick something from modifier set A, then there is a
much greater probability that Weston can leave the GPU alone so it can
be entirely used by the client. It also knows that if the surface
can't be directly scanned out for whatever reason, then there's no
point in the client optimising for direct scanout, and it can tell the
client to select based on optimality purely for the GPU.

So that's the thinking behind the interface: that the driver still has
exactly as much control and ability to use magic heuristics as it
always has, but that system components can supplement the driver's
heuristics with their own knowledge, to increase the chance that the
driver's heuristics arrive at a configuration that a) will definitely
work, and b) have a much greater chance of working optimally.

Does that help at all?

Cheers,
Daniel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
