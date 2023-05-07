Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 518196F9CA6
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 01:14:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C62810E08C;
	Sun,  7 May 2023 23:14:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43A6110E035;
 Sun,  7 May 2023 23:14:34 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-50bc22805d3so5982442a12.1; 
 Sun, 07 May 2023 16:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683501271; x=1686093271;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tlPsHoRGhEQ1xfo3LKMXY6To/ptJ7oVdctNoJleDC14=;
 b=PrWjXRG2GUL/UvX1Zb3E2anJwSKPhV3jxxXn1bWwQZw+UIGDYudHMqh8rjGJ6lxXbW
 4AKMSYWm2gDBHlSRa+bSZOIdyase6HZB9zzWTXyOSfBMOHIhJWpYDdRt8bebTaq10h0r
 A4RlTzAuaRT5sEN8y3DFLMcJrBz1vR29Q6PuY2kYijIkuLCcAdgymNn1iOV4e9mLBmyp
 oKCJJZ/Vkf+5+9HsWOm1zcwt7y1/utviNd5mBHDmmaxibfpjmGlVZHWSedTq9dR5WSug
 Q9RVYShVeQcZEmHq1cWI/TQUKsYYb11pOmAm4npW4NmTSIEPF4+l+VxVGOaTnHqjq6S0
 7WXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683501271; x=1686093271;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tlPsHoRGhEQ1xfo3LKMXY6To/ptJ7oVdctNoJleDC14=;
 b=f7fPlruMtOaUl58XqQfKAm8cAUxAItx6ILPl7Q40KNk536kU2jipIEgxJYGx5rqOiC
 QgF4Tip1/JkVGZTZuj1sospsmEunOfTf/YrYBlopFBur+fq/i+9MB2onVGL975LhBYSL
 2AJ815uk2M/WYZ5r11ULPIs5/bJ5YaGBzpb3DnDIS/L7hV+IJY1u1QKfKdcU5yot26Sp
 RZB4RsS+JTnDafGSLZ8xh7Y34aF7gPW5IVma+iRCbBj0LUWjshDWgWu9cP56W06nR4Yb
 JZHlILd5Uh9KeTl9exc37TxSiJ6HwWm6a42gU9ndJlowyNn2RwZ7Z5l8EWSbB4f0iBdL
 w77A==
X-Gm-Message-State: AC+VfDwte0kEo+UB/wKjmihTQEGlSWhYWYbwxjW67DtG8D7vIlJc89Ew
 kV3PN+uQDSf/GXfX9/LdHzx4JB+ycMRA8hgiqX0=
X-Google-Smtp-Source: ACHHUZ7SLgW5PdZlcoDLNpVE0HfuTTB6+2dg3g4+WN9FK/7zwKkoKpohSbmPpgJJyqU42TTjQzeoQH2uZU7pJ0+zseU=
X-Received: by 2002:a17:906:da8a:b0:930:f953:9614 with SMTP id
 xh10-20020a170906da8a00b00930f9539614mr7104947ejb.1.1683501270836; Sun, 07
 May 2023 16:14:30 -0700 (PDT)
MIME-Version: 1.0
References: <QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr>
 <CAPM=9tz54Jc1HSjdh5A7iG4X8Gvgg46qu7Ezvgnmj4N6gbY+Kw@mail.gmail.com>
 <CA+hFU4x++RDOxkc-_ZvDtQs3DtupwDV0KJyD3YAgrdh4daLotA@mail.gmail.com>
In-Reply-To: <CA+hFU4x++RDOxkc-_ZvDtQs3DtupwDV0KJyD3YAgrdh4daLotA@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 8 May 2023 09:14:18 +1000
Message-ID: <CAPM=9twjPr9fiJwbyNS9j=mCKmLhxbTjB5Vzq9F+Du8sdHac-A@mail.gmail.com>
Subject: Re: [RFC] Plane color pipeline KMS uAPI
To: Sebastian Wick <sebastian.wick@redhat.com>
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
Cc: Aleix Pol <aleixpol@kde.org>, Pekka Paalanen <pekka.paalanen@collabora.com>,
 "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 wayland-devel <wayland-devel@lists.freedesktop.org>,
 Melissa Wen <mwen@igalia.com>,
 =?UTF-8?B?Sm9uYXMgw4VkYWhs?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Victoria Brekenfeld <victoria@system76.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 6 May 2023 at 08:21, Sebastian Wick <sebastian.wick@redhat.com> wro=
te:
>
> On Fri, May 5, 2023 at 10:40=E2=80=AFPM Dave Airlie <airlied@gmail.com> w=
rote:
> >
> > On Fri, 5 May 2023 at 01:23, Simon Ser <contact@emersion.fr> wrote:
> > >
> > > Hi all,
> > >
> > > The goal of this RFC is to expose a generic KMS uAPI to configure the=
 color
> > > pipeline before blending, ie. after a pixel is tapped from a plane's
> > > framebuffer and before it's blended with other planes. With this new =
uAPI we
> > > aim to reduce the battery life impact of color management and HDR on =
mobile
> > > devices, to improve performance and to decrease latency by skipping
> > > composition on the 3D engine. This proposal is the result of discussi=
ons at
> > > the Red Hat HDR hackfest [1] which took place a few days ago. Enginee=
rs
> > > familiar with the AMD, Intel and NVIDIA hardware have participated in=
 the
> > > discussion.
> > >
> > > This proposal takes a prescriptive approach instead of a descriptive =
approach.
> > > Drivers describe the available hardware blocks in terms of low-level
> > > mathematical operations, then user-space configures each block. We de=
cided
> > > against a descriptive approach where user-space would provide a high-=
level
> > > description of the colorspace and other parameters: we want to give m=
ore
> > > control and flexibility to user-space, e.g. to be able to replicate e=
xactly the
> > > color pipeline with shaders and switch between shaders and KMS pipeli=
nes
> > > seamlessly, and to avoid forcing user-space into a particular color m=
anagement
> > > policy.
> >
> > I'm not 100% sold on the prescriptive here, let's see if someone can
> > get me over the line with some questions later.
> >
> > My feeling is color pipeline hw is not a done deal, and that hw
> > vendors will be revising/evolving/churning the hw blocks for a while
> > longer, as there is no real standards in the area to aim for, all the
> > vendors are mostly just doing whatever gets Windows over the line and
> > keeps hw engineers happy. So I have some concerns here around forwards
> > compatibility and hence the API design.
> >
> > I guess my main concern is if you expose a bunch of hw blocks and
> > someone comes up with a novel new thing, will all existing userspace
> > work, without falling back to shaders?
> > Do we have minimum guarantees on what hardware blocks have to be
> > exposed to build a useable pipeline?
> > If a hardware block goes away in a new silicon revision, do I have to
> > rewrite my compositor? or will it be expected that the kernel will
> > emulate the old pipelines on top of whatever new fancy thing exists.
>
> I think there are two answers to those questions.

These aren't selling me much better :-)
>
> The first one is that right now KMS already doesn't guarantee that
> every property is supported on all hardware. The guarantee we have is
> that properties that are supported on a piece of hardware on a
> specific kernel will be supported on the same hardware on later
> kernels. The color pipeline is no different here. For a specific piece
> of hardware a newer kernel might only change the pipelines in a
> backwards compatible way and add new pipelines.
>
> So to answer your question: if some hardware with a novel pipeline
> will show up it might not be supported and that's fine. We already
> have cases where some hardware does not support the gamma lut property
> but only the CSC property and that breaks night light because we never
> bothered to write a shader fallback. KMS provides ways to offload work
> but a generic user space always has to provide a fallback and this
> doesn't change. Hardware specific user space on the other hand will
> keep working with the forward compatibility guarantees we want to
> provide.

In my mind we've screwed up already, isn't a case to be made for
continue down the same path.

The kernel is meant to be a hardware abstraction layer, not just a
hardware exposure layer. The kernel shouldn't set policy and there are
cases where it can't act as an abstraction layer (like where you need
a compiler), but I'm not sold that this case is one of those yet. I'm
open to being educated here on why it would be.

>
> The second answer is that we want to provide a user space library
> which takes a description of a color pipeline and tries to map that to
> the available KMS color pipelines. If there is a novel color
> operation, adding support in this library would then make it possible
> to offload compatible color pipelines on this new hardware for all
> consumers of the library. Obviously there is no guarantee that
> whatever color pipeline compositors come up with can actually be
> realized on specific hardware but that's just an inherent hardware
> issue.
>

Why does this library need to be in userspace though? If there's a
library making device dependent decisions, why can't we just make
those device dependent decisions in the kernel?

This feels like we are trying to go down the Android HWC road, but we
aren't in that business.

My thoughts would be userspace has to have some way to describe what
it wants anyways, otherwise it does sound like I need to update
mutter, kwin, surfaceflinger, chromeos, gamescope, every time a new HW
device comes out that operates slightly different to previously
generations. This isn't the kernel doing hw abstraction at all, it's
the kernel just opting out of designing interfaces and it isn't
something I'm sold on.

Dave.
