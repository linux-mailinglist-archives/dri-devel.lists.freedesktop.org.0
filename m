Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3B53D79DA
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 17:33:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0BF06E938;
	Tue, 27 Jul 2021 15:33:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4207A6E938
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 15:33:04 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id q18so12400390ile.9
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 08:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2XSUgUmh1XmhyeIYFwsZM0972t6Q/ERgdKcfAvWCsXo=;
 b=WoBVP+ShhYBW3XIRtEoFeKDAxYRg7LAooItgUc/qCO5rbpT8S1SGveANY6QZow8HVV
 1+hIz1ESdPIESI7nrWboMNbTJ5mQMsx82jvKEW9JV8YQll6kJkdxKFKzVgHskt4HiTj0
 Ge3yAY65ZpFqupTShyti2NRxkrPatOLXsbYy4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2XSUgUmh1XmhyeIYFwsZM0972t6Q/ERgdKcfAvWCsXo=;
 b=aIUo2YwQCUqcYQs6lEveOJZYV2jPUlM51qSVNSO3/p7PHpMJwDbI4wCn2ogZQfivEj
 TT3UGSHWSN6CNEk+ESol/xh8BnivCzbSnr7uSkXMgO1xglpIiNgW1tr+F1GfIhuPV7z7
 0ZEJaTWrTHg+fYsNGqMafbnbH/aYVNnldLOurx5Q5RTRJ/BqdTkAqBp7AI5vmim0Yn8W
 SuqRZIojhnRqeCLA+TEaRB31u7DzObPB07hU+iChQ6BEdll/eL5s54ttwGsBNhIzjELZ
 L5u+Jk2n+qqy8zHPBPxb3oze3XQ0VNCIHSL/hjIDQkxWZ/LRhJmy1t/tnbKQWvFFDhJz
 PSrQ==
X-Gm-Message-State: AOAM531D8AdAUQnfPA61iT/gpbERsxvuhut2qrAggqtOYy1WdBdCIdPi
 v1v28XV5Msuesdhre4kNVwabkw4zE6zvPEYSrqzhrA==
X-Google-Smtp-Source: ABdhPJyp0rjZXaaLN68ns6YbN2+CaZ3yGgUttI6artx6AYKOdKEPRd2tdFT3EnbvCIWSuwrhGLn45TPUXvRSHT8R1Gk=
X-Received: by 2002:a92:6f0a:: with SMTP id k10mr16658190ilc.105.1627399983576; 
 Tue, 27 Jul 2021 08:33:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210726233854.2453899-1-robdclark@gmail.com>
 <28ca4167-4a65-0ccc-36be-5fb017f6f49d@daenzer.net>
 <CAF6AEGuhQ2=DSDaGGVwBz5O+FoZEjpgoVJOcFecpd--a9yDY1w@mail.gmail.com>
 <99984703-c3ca-6aae-5888-5997d7046112@daenzer.net>
In-Reply-To: <99984703-c3ca-6aae-5888-5997d7046112@daenzer.net>
From: Rob Clark <robdclark@chromium.org>
Date: Tue, 27 Jul 2021 08:37:13 -0700
Message-ID: <CAJs_Fx4O4w5djx3-q5zja51-ko_nQ0X2nEk3qoZB_axpBVSrKA@mail.gmail.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>, Jack Zhang <Jack.Zhang1@amd.com>,
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

On Tue, Jul 27, 2021 at 8:19 AM Michel D=C3=A4nzer <michel@daenzer.net> wro=
te:
>
> On 2021-07-27 5:12 p.m., Rob Clark wrote:
> > On Tue, Jul 27, 2021 at 7:50 AM Michel D=C3=A4nzer <michel@daenzer.net>=
 wrote:
> >>
> >> On 2021-07-27 1:38 a.m., Rob Clark wrote:
> >>> From: Rob Clark <robdclark@chromium.org>
> >>>
> >>> Based on discussion from a previous series[1] to add a "boost" mechan=
ism
> >>> when, for example, vblank deadlines are missed.  Instead of a boost
> >>> callback, this approach adds a way to set a deadline on the fence, by
> >>> which the waiter would like to see the fence signalled.
> >>>
> >>> I've not yet had a chance to re-work the drm/msm part of this, but
> >>> wanted to send this out as an RFC in case I don't have a chance to
> >>> finish the drm/msm part this week.
> >>>
> >>> Original description:
> >>>
> >>> In some cases, like double-buffered rendering, missing vblanks can
> >>> trick the GPU into running at a lower frequence, when really we
> >>> want to be running at a higher frequency to not miss the vblanks
> >>> in the first place.
> >>>
> >>> This is partially inspired by a trick i915 does, but implemented
> >>> via dma-fence for a couple of reasons:
> >>>
> >>> 1) To continue to be able to use the atomic helpers
> >>> 2) To support cases where display and gpu are different drivers
> >>>
> >>> [1] https://patchwork.freedesktop.org/series/90331/
> >>
> >> Unfortunately, none of these approaches will have the full intended ef=
fect once Wayland compositors start waiting for client buffers to become id=
le before using them for an output frame (to prevent output frames from get=
ting delayed by client work). See https://gitlab.gnome.org/GNOME/mutter/-/m=
erge_requests/1880 (shameless plug :) for a proof of concept of this for mu=
tter. The boost will only affect the compositor's own GPU work, not the cli=
ent work (which means no effect at all for fullscreen apps where the compos=
itor can scan out the client buffers directly).
> >>
> >
> > I guess you mean "no effect at all *except* for fullscreen..."?
>
> I meant what I wrote: The compositor will wait for the next buffer to bec=
ome idle, so there's no boost from this mechanism for the client drawing to=
 that buffer. And since the compositor does no drawing of its own in this c=
ase, there's no boost from that either.
>
>
> > I'd perhaps recommend that wayland compositors, in cases where only a
> > single layer is changing, not try to be clever and just push the
> > update down to the kernel.
>
> Even just for the fullscreen direct scanout case, that would require some=
 kind of atomic KMS API extension to allow queuing multiple page flips for =
the same CRTC.
>
> For other cases, this would also require a mechanism to cancel a pending =
atomic commit, for when another surface update comes in before the composit=
or's deadline, which affects the previously single updating surface as well=
.
>

Well, in the end, there is more than one compositor out there.. and if
some wayland compositors are going this route, they can also implement
the same mechanism in userspace using the sysfs that devfreq exports.

But it sounds simpler to me for the compositor to have a sort of "game
mode" for fullscreen games.. I'm less worried about UI interactive
workloads, boosting the GPU freq upon sudden activity after a period
of inactivity seems to work reasonably well there.

BR,
-R

>
> --
> Earthling Michel D=C3=A4nzer               |               https://redhat=
.com
> Libre software enthusiast             |             Mesa and X developer
