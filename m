Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 569FC1EA5BD
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jun 2020 16:25:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57D9889701;
	Mon,  1 Jun 2020 14:25:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FEEF8923C
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 14:25:37 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id l10so12074wrr.10
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jun 2020 07:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OMf/0WAuD70wcdLb9A+olYE5SwA7tqyVBkYxZj8o4nI=;
 b=H7+bg400UzOQ/Fday2TDexITPydfFPjEFwo0QaApfFPWgR2DqUMIK4jz9w/VaK10/+
 RZBGez8sOOCOhA/UdkAHDp2pX19jG8yr/7SulnVCpDcA/k3DmCDBcrTs9x3th55dUegt
 mYQI7SuIBlXytMVygCj8g5L14K6rIU9tmbYakSAsAUPlTw1rI3WlgpwzpcrXrrw08kuA
 r6xk8ZcJD9pFSw0QIX+9shyzGp7He/jEr7JbsspJpsnpSSJt4GGxjj7Qpydtv+o5I0nw
 ZldS1jqzZ/VT8+oarfYZ5z7ZA74KdEpkvMiUM6NeU/EP/kmNWE0fSdneRTapeBmnanBH
 9ECg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OMf/0WAuD70wcdLb9A+olYE5SwA7tqyVBkYxZj8o4nI=;
 b=Dh1+D0/323G5DV8fpvwaCGzcPDbInYPlmPbel8ghSa2t/lOXqnWrFGRDkCi/X1L3sf
 exl3C8i/C0ITmZVLbLXV+kyGD9aj/3MTTuiDw24pNywweLLC2dVyDQJA8pO5v/4xINaA
 QIgLjaLx87BVSGX0e5Yu1H5oMEfVWAPRvOL0nm5g2AHmIrlbuMoTg7i8oyqv5Y9x6EXj
 pBAGxGJT1vtPU2a8lckQ2egJGsjFwd4nWkeFn6wFyr1y1Zk/Q+TVb9Q4E/esPciIKjrz
 2XzRDMG8rMq7CW73HPxWaW8Xstg7Viwb/QXBzVX37z/qz/ds3tiQpHm60wXWbA4k9x6x
 p5bw==
X-Gm-Message-State: AOAM533mw4a9qKAee2WLo5lBp4JGdu6iIndb3A3YlheOsDvzaREgYNY6
 L4BDyQkNcxp61p5Xo4RXAk2a9Fzp7lUhHfnl0oE=
X-Google-Smtp-Source: ABdhPJyjk5F9ArrML06XEkixBahrYXZhQTUCImKoTNioUeOw35PJArYxTgfZ1zvMIza+H1l4hfH0VozHNML21KjOHqI=
X-Received: by 2002:adf:fd41:: with SMTP id h1mr23049025wrs.374.1591021535718; 
 Mon, 01 Jun 2020 07:25:35 -0700 (PDT)
MIME-Version: 1.0
References: <WOsdNGp0dhyp8Modsrt7DYpd0fVk7Yk264FISQ1Yls30bhlSXbxzgKTpmOCJ9H2WV1XHyUjCXu7nwBOWQ6n1NCbIcVl1-1IZ4rMMGN1dN-U=@emersion.fr>
 <CAAxE2A4NCo_KMkemUOHKbZ7P=GR4p-zwhpmP7Get18x4Ydb-Gg@mail.gmail.com>
 <bbZABMxDckHUj5JW5DW0pSewqQ-rAIW0gvNnTlI4np7o1A2bDrpPGIeyk5tXGMDr_cAI1l_R9qw6ykJ8OEhQlbKruJ8IG579jqADaPAnUbA=@emersion.fr>
 <CADnq5_MEFM_2k_uboU6E9d3_j18K+tz=Axtie-80PSSwJ2vkYw@mail.gmail.com>
 <CAPj87rMrJLNNbFJVvf081=eRqPqAe1H7=+PM21N22Jdsg7FzVQ@mail.gmail.com>
 <CADnq5_OX9o5_Gc4SjU5M4B=fthT9++J-FjX3UqTS7x_u6cJHOQ@mail.gmail.com>
 <CAPj87rP+Hxhohb4dEjRwtZzy34fYk+hAdgVfCkLF1u4JufJ=CQ@mail.gmail.com>
 <CADnq5_Pzj+AWQZWOcwvf8WQDVJrpc2DyG6Z1ZYqgfHA-8AXpMA@mail.gmail.com>
 <CAPj87rNO62i5JmRLdMhAg9XbiJUyrrRO7fj1ruXRCh-oxHnifQ@mail.gmail.com>
In-Reply-To: <CAPj87rNO62i5JmRLdMhAg9XbiJUyrrRO7fj1ruXRCh-oxHnifQ@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 1 Jun 2020 10:25:24 -0400
Message-ID: <CADnq5_PVZ_DS65SCS=OFW0m7Dz10pMAZVZ33pWf86KBwg4oQKw@mail.gmail.com>
Subject: Re: [PATCH v3] drm/fourcc: document modifier uniqueness requirements
To: Daniel Stone <daniel@fooishbar.org>
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

On Fri, May 29, 2020 at 11:03 AM Daniel Stone <daniel@fooishbar.org> wrote:
>
> On Fri, 29 May 2020 at 15:36, Alex Deucher <alexdeucher@gmail.com> wrote:
> > On Fri, May 29, 2020 at 10:32 AM Daniel Stone <daniel@fooishbar.org> wrote:
> > > On Fri, 29 May 2020 at 15:29, Alex Deucher <alexdeucher@gmail.com> wrote:
> > > > Maybe I'm over thinking this.  I just don't want to get into a
> > > > situation where we go through a lot of effort to add modifier support
> > > > and then performance ends up being worse than it is today in a lot of
> > > > cases.
> > >
> > > I'm genuinely curious: what do you imagine could cause a worse result?
> >
> > As an example, in some cases, it's actually better to use linear for
> > system memory because it better aligns with pcie access patterns than
> > some tiling formats (which are better aligned for the memory
> > controller topology on the dGPU).  That said, I haven't been in the
> > loop as much with the tiling formats on newer GPUs, so that may not be
> > as much of an issue anymore.
>
> Yeah, that makes a lot of sense. On the other hand, placement isn't
> explicitly encoded for either modifiers or non-modifiers, so I'm not
> sure how it would really regress.
>
> In case it was missed somewhere, there is no generic code doing
> modifier selection for modifier optimality anywhere. The flow is:
>   - every producer/consumer advertises a list of modifier + format
> pairs, declaring what they _can_ support
>   - for every use where a buffer needs to be allocated, the generic
> code intersects these lists of modifiers to determine the set of
> modifiers mutually acceptable to all consumers
>   - the buffer allocator is always handed a _list_ of modifiers, and
> makes its own decision based on ??
>
> For a concrete end-to-end example:
>   - KMS declares which modifiers are supported for scanout
>   - EGL declares which modifiers are supported for EGLImage import
>   - Weston determines that one of its clients could be directly
> scanned out rather than composited
>   - Weston intersects the KMS + EGL set of modifiers to come up with
> the optimal modifier set (i.e. bypassing composition)
>   - Weston sends this intersected list to the client via the Wayland
> protocol (mentioned in previous MR)
>   - the client is using EGL, so Mesa receives this list of modifiers,
> and passes this on to amdgpu
>   - amdgpu uses magic inscrutable heuristics to determine the most
> optimal modifier to use, and allocates a buffer based on that
>
> Weston (or GNOME Shell, or Chromium, or whatever) will never be in a
> position as a generic client to know that on Raven2 it should use a
> particular supertiled layout with no DCC if width > 2048. So we
> designed the entire framework to explicitly avoid generic code trying
> to reason about the performance properties of specific modifiers.
>
> What Weston _does_ know, however, is that display controller can work
> with modifier set A, and the GPU can work with modifier set B, and if
> the client can pick something from modifier set A, then there is a
> much greater probability that Weston can leave the GPU alone so it can
> be entirely used by the client. It also knows that if the surface
> can't be directly scanned out for whatever reason, then there's no
> point in the client optimising for direct scanout, and it can tell the
> client to select based on optimality purely for the GPU.

Just so I understand this correctly, the main reason for this is to
deal with display hardware and render hardware from different vendors
which may or may not support any common formats other than linear.  It
provides a way to tunnel device capabilities between the different
drivers.  In the case of a device with display and rendering on the
same device or multiple devices from the same vendor, it not really
that useful.  It doesn't seem to provide much over the current EGL
hints (SCANOUT, SECURE, etc.).  I still don't understand how it solves
the DCC problem though.  Compression and encryption seem kind like
meta modifiers.  There is an under laying high level layout, linear,
tiled, etc. but it could also be compressed and/or encrypted.  Is the
idea that those are separate modifiers?  E.g.,
0: linear
1: linear | encrypted
2. linear | compressed
3: linear | encrypted | compressed
4: tiled1
5: tiled1 | encrypted
6: tiled1 | compressed
7: tiled1 | encrypted | compressed
etc.
Or that the modifiers only expose the high level layout, and it's then
up the the driver(s) to enable compression, etc. if both sides have a
compatible layout?

Thanks,

Alex

>
> So that's the thinking behind the interface: that the driver still has
> exactly as much control and ability to use magic heuristics as it
> always has, but that system components can supplement the driver's
> heuristics with their own knowledge, to increase the chance that the
> driver's heuristics arrive at a configuration that a) will definitely
> work, and b) have a much greater chance of working optimally.
>
> Does that help at all?
>
> Cheers,
> Daniel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
