Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 085423D7961
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 17:08:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 647F66E82A;
	Tue, 27 Jul 2021 15:08:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75DC56E82A
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 15:08:38 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 m20-20020a05600c4f54b029024e75a15716so2573117wmq.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 08:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jcrbQyHbij430xaq02MbLiHj13M2J5t4Q3rA2r97S1M=;
 b=ePJAi2hbsieHla1MODd/uh8GFZVMnIlRscK3zkhUSDAUseRyYpSPaurjOwZmuhWBGO
 MVLE9fUHyMXt38vPDmeRkKhaXHcbOsKJPWXRAhyKmcE03F+3VylPtx87Fs6hlKFBwsGN
 ZQldGQHrQfR/QhlHKTR5J98f6um8tBLzTrOq26kC6v9/unY0IJjLyZRvx1fMOKwTo1c8
 kGQ75QJ9sHCE6+Pj6M0aPcLcaGILjjJlrWOOSluledtAN51fWnsi/3b9Y/GjSwiJleRa
 HFM9TAo5gLzMOIlXlRNOcdfTUoK+7JCdlv/FgSV4wHP0m5WcUD205WybKF592XZppJh+
 eIRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jcrbQyHbij430xaq02MbLiHj13M2J5t4Q3rA2r97S1M=;
 b=uQb2HQyCw8ckNoBsbycJy16766L3pkaL93Q0a/QbsDH617KUh90DkVLnQ70II+YpXW
 5Ai142+2XzTsMoE0D1y8778WFEdfp40xn3LKsAGgsUtP8Dfpmlq2zZtQUUchm+q6Pku/
 Tyc2K8GDb7M5ki4HzdvihrDcjnq/R7ziE1TLmxZgMiESwFKFNp9pwavDBuFMXsTJaBYs
 LmdFomg7PlZRsFOSe+DVhITuUv+029ljMCpmb1Spy0Qe1v0WezFkIohqZytEXIGlUG8d
 lplpN6CnjC6PUH9TnIJZC/787cAAmTW6zbbQLVkJEw7hbVnBPZxe+RlrJIrKuIBoEoRj
 U+GQ==
X-Gm-Message-State: AOAM532Lj3mX5P4EcN+ser+GarqzCWSBIBeCosSZH8PsMx6M20bzVC52
 zrrJX31K/mSukWYps0X3DlidwLbg/XfUVLlhVqY=
X-Google-Smtp-Source: ABdhPJyQHd8UqT9Ia3PL8c7l+eagsABe2zXZgvxuJGgX3d4FyLbIEBs//Pnd3H0g36dbX41lxRF0XyssNj+CA1b4ir4=
X-Received: by 2002:a7b:cc8b:: with SMTP id p11mr4622066wma.164.1627398516915; 
 Tue, 27 Jul 2021 08:08:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210726233854.2453899-1-robdclark@gmail.com>
 <28ca4167-4a65-0ccc-36be-5fb017f6f49d@daenzer.net>
In-Reply-To: <28ca4167-4a65-0ccc-36be-5fb017f6f49d@daenzer.net>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 27 Jul 2021 08:12:45 -0700
Message-ID: <CAF6AEGuhQ2=DSDaGGVwBz5O+FoZEjpgoVJOcFecpd--a9yDY1w@mail.gmail.com>
Subject: Re: [RFC 0/4] dma-fence: Deadline awareness
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
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
Cc: Matthew Brost <matthew.brost@intel.com>, Rob Clark <robdclark@chromium.org>,
 Jack Zhang <Jack.Zhang1@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Roy Sun <Roy.Sun@amd.com>,
 Gustavo Padovan <gustavo@padovan.org>,
 Alex Deucher <alexander.deucher@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 27, 2021 at 7:50 AM Michel D=C3=A4nzer <michel@daenzer.net> wro=
te:
>
> On 2021-07-27 1:38 a.m., Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Based on discussion from a previous series[1] to add a "boost" mechanis=
m
> > when, for example, vblank deadlines are missed.  Instead of a boost
> > callback, this approach adds a way to set a deadline on the fence, by
> > which the waiter would like to see the fence signalled.
> >
> > I've not yet had a chance to re-work the drm/msm part of this, but
> > wanted to send this out as an RFC in case I don't have a chance to
> > finish the drm/msm part this week.
> >
> > Original description:
> >
> > In some cases, like double-buffered rendering, missing vblanks can
> > trick the GPU into running at a lower frequence, when really we
> > want to be running at a higher frequency to not miss the vblanks
> > in the first place.
> >
> > This is partially inspired by a trick i915 does, but implemented
> > via dma-fence for a couple of reasons:
> >
> > 1) To continue to be able to use the atomic helpers
> > 2) To support cases where display and gpu are different drivers
> >
> > [1] https://patchwork.freedesktop.org/series/90331/
>
> Unfortunately, none of these approaches will have the full intended effec=
t once Wayland compositors start waiting for client buffers to become idle =
before using them for an output frame (to prevent output frames from gettin=
g delayed by client work). See https://gitlab.gnome.org/GNOME/mutter/-/merg=
e_requests/1880 (shameless plug :) for a proof of concept of this for mutte=
r. The boost will only affect the compositor's own GPU work, not the client=
 work (which means no effect at all for fullscreen apps where the composito=
r can scan out the client buffers directly).
>

I guess you mean "no effect at all *except* for fullscreen..."?  Games
are usually running fullscreen, it is a case I care about a lot ;-)

I'd perhaps recommend that wayland compositors, in cases where only a
single layer is changing, not try to be clever and just push the
update down to the kernel.

BR,
-R

>
> --
> Earthling Michel D=C3=A4nzer               |               https://redhat=
.com
> Libre software enthusiast             |             Mesa and X developer
