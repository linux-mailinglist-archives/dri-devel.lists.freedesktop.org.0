Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C98C86FCECA
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 21:53:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AAA010E119;
	Tue,  9 May 2023 19:53:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F16A10E119;
 Tue,  9 May 2023 19:53:25 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-966287b0f72so688500766b.0; 
 Tue, 09 May 2023 12:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683662001; x=1686254001;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W3WrRAi3384wFghozI17WE6ul9NCCM8HHVMXgLURGig=;
 b=ZQfgg80afrytOR7Remgs7b7RL/AIBUkMKFK/dJ5ifo83pAaN52WZ2+9iaRlqlPx/Uk
 Ig26a3Q2f9rqO4gYsuUyaegg1a0OtVfZ6tzwZ41owrMb38McbgX+RXUOhJPKQj1Pl+di
 E+R5Y1JTyPF3HHFf9Q3LsN/yIezwEXkBb6ODMA5Y7lRWd6GgjdD4W/ZYs8GxN0S3IyCE
 wOWrmGmt68KXHC570HTrubWmXVLEA0OdxwNe23wCJVKbEeHomVvPBuEovjWcsjz5cIF7
 BQ3w5EmggJfbTfUP6jqLRS5+v4GvjRmHSXaonHjzRQBvFDbEBnx19dNzxdShuK13m4//
 sslQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683662001; x=1686254001;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W3WrRAi3384wFghozI17WE6ul9NCCM8HHVMXgLURGig=;
 b=L9++jf5rEfWorh9tQLZRfnhk5NEcMq7S8nP+I6TKoLY1G9B8sUD/QHnwOik62PQBhv
 1n6HEPoO/qEctZUZzjUgmnYhE91ByIHx5322FcHS5329P4KEO0CU8lWGBNSeFXd7WMKn
 QFrYvU/AznyZ1iJ/3R2tNBMOjwUDzaprea6VrjTL02a3lS1b8cBrx3zPJilm6zuCA31f
 d/IwQ9oNwDsbvWC5Go+GA+IiljDjCDF7tXjT/MJRanJU/2fLfMilfzZTfzgYVJT83YgS
 4ELoQxBXMfmFf/CX+Pz0HFcAHzg+2lt0hvlybPiNMtztcgDbu1g/3kk9Vz3rMyuiHR4w
 kLiw==
X-Gm-Message-State: AC+VfDwJQD/P/e/Z9iv2j2adB35Q0INmmPa2+Y+s/YMUghfqdKv+F3HM
 6TPYlqwie3qhs7Eeskzf91JwW0gXFgb2ZRN8pPg=
X-Google-Smtp-Source: ACHHUZ6YOqiF9temZSPkJZtkjwLkgpY4R6/5qJ+t/HchTJizyg/DqaD7IxiS14dr2bFcfew5y8GKo5013eOnHkkjqCk=
X-Received: by 2002:a17:907:2cc7:b0:94e:d7b0:64d4 with SMTP id
 hg7-20020a1709072cc700b0094ed7b064d4mr14630823ejc.47.1683662000946; Tue, 09
 May 2023 12:53:20 -0700 (PDT)
MIME-Version: 1.0
References: <QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr>
 <CAPM=9tz54Jc1HSjdh5A7iG4X8Gvgg46qu7Ezvgnmj4N6gbY+Kw@mail.gmail.com>
 <CA+hFU4x++RDOxkc-_ZvDtQs3DtupwDV0KJyD3YAgrdh4daLotA@mail.gmail.com>
 <CAPM=9twjPr9fiJwbyNS9j=mCKmLhxbTjB5Vzq9F+Du8sdHac-A@mail.gmail.com>
 <e903d920-788f-7d70-c6f0-1faaac3c9843@amd.com>
In-Reply-To: <e903d920-788f-7d70-c6f0-1faaac3c9843@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 10 May 2023 05:53:08 +1000
Message-ID: <CAPM=9tyOFhE0zC8540KBOkDaZE1c3zTtke_vX=DEkMTmo04A4Q@mail.gmail.com>
Subject: Re: [RFC] Plane color pipeline KMS uAPI
To: Harry Wentland <harry.wentland@amd.com>
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>, Aleix Pol <aleixpol@kde.org>,
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

On Wed, 10 May 2023 at 00:31, Harry Wentland <harry.wentland@amd.com> wrote=
:
>
>
>
> On 5/7/23 19:14, Dave Airlie wrote:
> > On Sat, 6 May 2023 at 08:21, Sebastian Wick <sebastian.wick@redhat.com>=
 wrote:
> >>
> >> On Fri, May 5, 2023 at 10:40=E2=80=AFPM Dave Airlie <airlied@gmail.com=
> wrote:
> >>>
> >>> On Fri, 5 May 2023 at 01:23, Simon Ser <contact@emersion.fr> wrote:
> >>>>
> >>>> Hi all,
> >>>>
> >>>> The goal of this RFC is to expose a generic KMS uAPI to configure th=
e color
> >>>> pipeline before blending, ie. after a pixel is tapped from a plane's
> >>>> framebuffer and before it's blended with other planes. With this new=
 uAPI we
> >>>> aim to reduce the battery life impact of color management and HDR on=
 mobile
> >>>> devices, to improve performance and to decrease latency by skipping
> >>>> composition on the 3D engine. This proposal is the result of discuss=
ions at
> >>>> the Red Hat HDR hackfest [1] which took place a few days ago. Engine=
ers
> >>>> familiar with the AMD, Intel and NVIDIA hardware have participated i=
n the
> >>>> discussion.
> >>>>
> >>>> This proposal takes a prescriptive approach instead of a descriptive=
 approach.
> >>>> Drivers describe the available hardware blocks in terms of low-level
> >>>> mathematical operations, then user-space configures each block. We d=
ecided
> >>>> against a descriptive approach where user-space would provide a high=
-level
> >>>> description of the colorspace and other parameters: we want to give =
more
> >>>> control and flexibility to user-space, e.g. to be able to replicate =
exactly the
> >>>> color pipeline with shaders and switch between shaders and KMS pipel=
ines
> >>>> seamlessly, and to avoid forcing user-space into a particular color =
management
> >>>> policy.
> >>>
> >>> I'm not 100% sold on the prescriptive here, let's see if someone can
> >>> get me over the line with some questions later.
> >>>
> >>> My feeling is color pipeline hw is not a done deal, and that hw
> >>> vendors will be revising/evolving/churning the hw blocks for a while
> >>> longer, as there is no real standards in the area to aim for, all the
> >>> vendors are mostly just doing whatever gets Windows over the line and
> >>> keeps hw engineers happy. So I have some concerns here around forward=
s
> >>> compatibility and hence the API design.
> >>>
> >>> I guess my main concern is if you expose a bunch of hw blocks and
> >>> someone comes up with a novel new thing, will all existing userspace
> >>> work, without falling back to shaders?
> >>> Do we have minimum guarantees on what hardware blocks have to be
> >>> exposed to build a useable pipeline?
> >>> If a hardware block goes away in a new silicon revision, do I have to
> >>> rewrite my compositor? or will it be expected that the kernel will
> >>> emulate the old pipelines on top of whatever new fancy thing exists.
> >>
> >> I think there are two answers to those questions.
> >
> > These aren't selling me much better :-)
> >>
> >> The first one is that right now KMS already doesn't guarantee that
> >> every property is supported on all hardware. The guarantee we have is
> >> that properties that are supported on a piece of hardware on a
> >> specific kernel will be supported on the same hardware on later
> >> kernels. The color pipeline is no different here. For a specific piece
> >> of hardware a newer kernel might only change the pipelines in a
> >> backwards compatible way and add new pipelines.
> >>
> >> So to answer your question: if some hardware with a novel pipeline
> >> will show up it might not be supported and that's fine. We already
> >> have cases where some hardware does not support the gamma lut property
> >> but only the CSC property and that breaks night light because we never
> >> bothered to write a shader fallback. KMS provides ways to offload work
> >> but a generic user space always has to provide a fallback and this
> >> doesn't change. Hardware specific user space on the other hand will
> >> keep working with the forward compatibility guarantees we want to
> >> provide.
> >
> > In my mind we've screwed up already, isn't a case to be made for
> > continue down the same path.
> >
> > The kernel is meant to be a hardware abstraction layer, not just a
> > hardware exposure layer. The kernel shouldn't set policy and there are
> > cases where it can't act as an abstraction layer (like where you need
> > a compiler), but I'm not sold that this case is one of those yet. I'm
> > open to being educated here on why it would be.
> >
>
> Thanks for raising these points. When I started out looking at color
> management I favored the descriptive model. Most other HW vendors
> I've talked to also tell me that they think about descriptive APIs
> since that allows HW vendors to map that to whatever their HW supports.
>
> Sebastian, Pekka, and others managed to change my mind about this
> but I still keep having difficult questions within AMD.
>
> Sebastian, Pekka, and Jonas have already done a good job to describe
> our reasoning behind the prescriptive model. It might be helpful to
> see how different the results of different tone-mapping operators
> can look:
>
> http://helgeseetzen.com/wp-content/uploads/2017/06/HS1.pdf
>
> According to my understanding all other platforms that have HDR now
> have a single compositor. At least that's true for Windows. This allows
> driver developers to tune their tone-mapping algorithm to match the
> algorithm used by the compositor when offloading plane composition.
>
> This is not true on Linux, where we have a myriad of compositors for
> good reasons, many of which have a different view of how they want color
> management to look like. Even if we would come up with an API that lets
> compositors define their input, output, scaling, and blending space in
> detail it would still not be feasible to describe the minutia of
> the tone-mapping algorithms, hence leading to differences in output
> when KMS color management is used.
>
> I am debating whether we need to be serious about a userspace library
> (or maybe a user-mode driver) to provide an abstraction from the
> descriptive to the prescriptive model. HW vendors need a way to provide
> timely support for new HW generations without requiring updates to a
> large number of compositors.

There are also other vendor side effects to having this in userspace.

Will the library have a loader?
Will it allow proprietary plugins?
Will it allow proprietary reimplementations?
What will happen when a vendor wants distros to ship *their*
proprietary fork of said library?

How would NVIDIA integrate this with their proprietary stack?

Dave.
