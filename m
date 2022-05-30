Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D065380D8
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 16:27:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A494210E53E;
	Mon, 30 May 2022 14:27:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E88DE10E909
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 14:27:03 +0000 (UTC)
Received: from mail-yb1-f171.google.com ([209.85.219.171]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MZAvp-1oHuC42KTh-00V6aj for <dri-devel@lists.freedesktop.org>; Mon, 30 May
 2022 16:27:01 +0200
Received: by mail-yb1-f171.google.com with SMTP id i11so19266463ybq.9
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 07:27:01 -0700 (PDT)
X-Gm-Message-State: AOAM532EVd41xH1hQm+V6vfnv2S0CaW9lc0bmIdqJJNHMYP0KOVONNAZ
 XqbFEoFGYRCNzMH0VXnELNXcMVRzvSJTa3NSDHM=
X-Google-Smtp-Source: ABdhPJx5T8sAy2mpNYpXUMEEXXq3paGLe37RJlBPWUL37w/VrSqmqA+dX26yPRFsA+fHHAhbaULTIG1qF0gAbTdb1Dw=
X-Received: by 2002:a25:4f0a:0:b0:64f:6a76:3d8f with SMTP id
 d10-20020a254f0a000000b0064f6a763d8fmr43544693ybb.134.1653920820404; Mon, 30
 May 2022 07:27:00 -0700 (PDT)
MIME-Version: 1.0
References: <YpCUzStDnSgQLNFN@debian>
 <CAHk-=wg0uGAX5DYZq+tY2KeUAR8DtR91YE1y9CkPMKkKOyE4jg@mail.gmail.com>
 <CADVatmNGPbSdRNQuwJEWAaPtqb3vBYRjvsuBpoRUnhEHj=X5GQ@mail.gmail.com>
 <CAHk-=wisQd8yiPX=SsK3eFiakKo713hq4SyqPWsJ-oyAmLFefQ@mail.gmail.com>
 <YpIR67FMtTGCwARZ@debian>
 <CAHk-=wjuyHE=1wLgHncub8FfgeyYqfWYsy4-YrhAvq9991h_Aw@mail.gmail.com>
 <CAHk-=wi_hJV0V=Ecg2dzbe2P_H1XKTu6VP_AtCH6u=tis31ayg@mail.gmail.com>
 <CAK8P3a0-QyOQiieEvM0yQb43XbCtPmeao8UvoAsdFnjCxYPz7Q@mail.gmail.com>
 <CAHk-=whfmwzjF4eBPYS6pHFqHVzJF3m=2h=gRWSRyHks8V=ABA@mail.gmail.com>
 <87a6aztli2.fsf@intel.com> <877d63tleq.fsf@intel.com>
 <CAK8P3a0-S77QLR1dK3NT6ot7JTAD5AdojAZJr-Xi112-v5EOdw@mail.gmail.com>
 <87czfvrwsv.fsf@intel.com>
 <CAK8P3a0HNOCOSx9UONw6gf1UUU8J4iAOmMFP8-DtJ3O7XAACsQ@mail.gmail.com>
 <874k17ru44.fsf@intel.com>
In-Reply-To: <874k17ru44.fsf@intel.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 30 May 2022 16:26:43 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2Zg2QDS1_Ysn8-Zqqd+K7bbTFS7JV7gPabp6nvPiKaog@mail.gmail.com>
Message-ID: <CAK8P3a2Zg2QDS1_Ysn8-Zqqd+K7bbTFS7JV7gPabp6nvPiKaog@mail.gmail.com>
Subject: Re: mainline build failure due to f1e4c916f97f ("drm/edid: add EDID
 block count and size helpers")
To: Jani Nikula <jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:8kje5LZFzyB57RWUJEda4bC96HfeRKt4sLNkSXUnHL0XQ6kkJo4
 zTnVc++pKpp4HE/bo8KaIAH/6Xiz0Vn9zifeu6kkBvzCA2VXdWYUNgv0tUYwSkvD5aHCMdM
 Eef037+jJYHG//AfCrIvCbp6g8aP113MNFbgYMLkSw0Z7SXrV+cVzXbXNMElapunpy2UDBH
 t0ygniIedT/POYqp46YLw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:SR41uckSuR8=:lWMKvmZZLiD8exF/Rr1Cl4
 DWJj/9+bXhbjx/qk78JAUIqIVLL8NHtj2/x9KKm0MWOvPafcCzt9vkhy3GnbO35v2kBUizs4+
 zIWMf0eikgVBbOnljxQ6LLM31irAi+RD/KOcWJnb09fMPOou1DiWbCZu7nM5MFHlCVJVe+bc+
 NJeNBaPfeyzMfTX+F3NxcbZFZIJoWMt2pftQmh+TstC5/fTHTMSBLFO0nCtqfLncgacL52nQg
 5tgio41w/CvsdFfrOIlSlFLZTHBfC4DjxDUcBeqfZhGUFPa4+mfBKEmLg8beQZ9GkFp1IHKS4
 EItJG2A3K8KF/CENECVA9Mm/03gx05/jPsGTjl/OVQWlcBz9ZAfb3u3wk1/xuYVZ936LrAuK+
 IlHjU2Koh0joV5Yw01VkklbsajNV5qlEAULDulyksVsF+fcuofl65386a3fIq23vg++k3OpFL
 u6/FEX9eyscgw6gEPD6w6OGCWUS0vDoeNU6Cz2EVyymel9GCdKLf8h3t6r5wwvVfRqnQAczbW
 KtvY1VzLPMDr7fwSCwM3ywtmQrUqOLd7GWY3IIdC4BMSz9Jvj66Mkfy8kCpUWbDmTosZ7v72S
 CzHdTZOzWUEEOttZ9iC5ZA5hTkeLQP2PCKCOEfJJ/4xPJuVHZs8NvS2cp+pdoiVt1yL76TgS8
 aQLF/9Z3voTkjHEEh92IE3tEGhLlOlptVxPRyIDK73xLLsjf3VjccXQPnd9aKOl2L2gi7o6UK
 DksXDjj4mKqSK4bazQ6MxmUuYfeWYoAMzOvwDbumtjmSygHs9G6AVFGBmOt+wIdjJhAN2Ne2T
 I/x0Q3jDBY6O3VKgILsC6110zToOJCth1t0HJd3X0+dYVVtFar290cLBCofh0OV0KKfJHz9gU
 5An6CGgtL81FHEzE4+lizRbbZhip8m6+I4bXRhJjI=
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 Viresh Kumar <vireshk@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Julia Lawall <Julia.Lawall@inria.fr>,
 Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 30, 2022 at 4:08 PM Jani Nikula <jani.nikula@intel.com> wrote:
> On Mon, 30 May 2022, Arnd Bergmann <arnd@arndb.de> wrote:
> > struct my_driver_priv {
> >        struct device dev;
> >        u8 causes_misalignment;
> >        spinlock_t lock;
> >        atomic_t counter;
> > } __packed; /* this annotation is harmful because it breaks the atomics */
>
> I wonder if this is something that could be caught with coccinelle. Or
> sparse. Are there any cases where this combo is necessary? (I can't
> think of any, but it's a low bar. ;)
>
> Cc: Julia.

I think one would first have to make a list of data types that are not
meant to be in a packed structure. It could be a good start to
search for any packed aggregates with a pointer, atomic_t or spinlock_t
in them, but there are of course many more types that you won't
find in hardware structures.

> > or if the annotation does not change the layout like
> >
> > struct my_dma_descriptor {
> >      __le64 address;
> >      __le64 length;
> > } __packed; /* does not change layout but makes access slow on some
> > architectures */
>
> Why is this the case, though? I'd imagine the compiler could figure this
> out.

When you annotate the entire structure as __packed without an
extra __aligned() annotation, the compiler has to assume that the
structure itself is unaligned as well. On many of the older architectures,
this will result in accessing the values one byte at a time. Marking
the structure as "__packed __aligned(8)" instead would be harmless.

When I have a structure with a few misaligned members, I generally
prefer to only annotate the members that are not naturally aligned,
but this approach is not very common.

         Arnd
