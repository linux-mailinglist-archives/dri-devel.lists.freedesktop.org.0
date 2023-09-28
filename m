Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DF17B1D28
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 14:59:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C88B110E083;
	Thu, 28 Sep 2023 12:59:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 221BE10E642
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 12:59:52 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-50306b2920dso15379177e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 05:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695905990; x=1696510790; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fuxiJwAP2X/mxskweilqNBpbKX+FEDl/GPshrHY3GBQ=;
 b=GJYnflMp8G74IFfvfqslHzRGxvQI0rReXXxHyUh/UzGj8/K/bmNcvsRwTx9kInBxrv
 3JnEXogaotOdDPSzfBChQN37r2SbUdfKNx13kVemzM/d+p8hLJzwEme4ZlNx5PNhdNgV
 SOOK5/i9dwZEAzsQ0FBNwrHNf+4QL2wRAWWhq/UxcvZw/j5CQp+n/cmUBubUuaq9QijQ
 OSVPxVGxBJA+3UVINEO8pOOyo0sOt/zeUjU0C8rIgLoSVHmDexhFphtkUZGyCwoiKooT
 CY8GpaCuUQx/nNMJ3tUUttBIqE1QWn3Qip05AWKa2sofKaT1VlMlLyn363bVapKHwM7T
 tiig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695905990; x=1696510790;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fuxiJwAP2X/mxskweilqNBpbKX+FEDl/GPshrHY3GBQ=;
 b=bvlLCch0E1zW3GIAXjyuh071yoJSVIRZ6nLALWxoWh4sUX0aMo8PxdVXCDaNcHWGrJ
 dvcBRxySmR2XVgtSHW1OXP7IqpWqgn5CSBfx+MPwmQ5A4O02cjvNWLk23vMis7S0V7d/
 +8yGBqu1HbLzcFfSbQCGCCP+fgqRhE9xQaX0LpWSCTxXqiynhZu8lziFtbUtFqAgxkJd
 vXOysNe0e4wupCgAYafkt4orIMNoTC7JwYmggaVmUKeZf/58qrbXdSZezmT2lgE/Yf7K
 NCoyMqvuV0gWGWke2EbfVwAmyV+Cft8zSqJZ9jxlpB9tz6GDhJ4025Eo7M/unuKKw2HS
 bgag==
X-Gm-Message-State: AOJu0YwYEreb7g+cfNWg7kuiQh65Gy8Cxg6AQedjrIoiUYHJOL58ARUZ
 9lqOAqwKY2ctpd7hycaTCyU1Z0U032WOiBGZrzk=
X-Google-Smtp-Source: AGHT+IFwRmds9DGXCfWRfXYRKf0tSaDje4NZB54eFziUWa0uk+Hf739LJkptKuHUTOM5wyLSM4Iwir1tLLj2ey+i558=
X-Received: by 2002:a05:6512:3d21:b0:4ff:62a4:7aaf with SMTP id
 d33-20020a0565123d2100b004ff62a47aafmr1024526lfv.2.1695905989961; Thu, 28 Sep
 2023 05:59:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230926170549.2589045-1-halfline@gmail.com>
 <c2ffc21e-bf92-81f6-aa9b-233e3475025f@amd.com>
 <CAA_UwzKiNJe6hjbAo7SK7-OB7sb_ieV_DcQ_8vf6UYw2gppGcA@mail.gmail.com>
 <a1316597-e91b-32f8-78d3-13977438149b@amd.com>
 <dbed4fe6-e99b-a31e-5715-7bd594fc22fb@mailbox.org>
In-Reply-To: <dbed4fe6-e99b-a31e-5715-7bd594fc22fb@mailbox.org>
From: Ray Strode <halfline@gmail.com>
Date: Thu, 28 Sep 2023 08:59:38 -0400
Message-ID: <CAA_UwzLpRsNHK7yFWP3tzLFgeZMMpq_AiWBEHW5Om6hfBxyYbA@mail.gmail.com>
Subject: Re: [PATCH] drm/atomic: Perform blocking commits on workqueue
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
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
Cc: daniel.vetter@ffwll.ch, Xinhui.Pan@amd.com, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, airlied@redhat.com,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

hi,

On Thu, Sep 28, 2023 at 5:43=E2=80=AFAM Michel D=C3=A4nzer
<michel.daenzer@mailbox.org> wrote:
> >>> When it's really not desirable to account the CPU overhead to the
> >>> process initiating it then you probably rather want to use an non
> >>> blocking commit plus a dma_fence to wait for the work to end from use=
rspace.
> >> Well, first I don't think that's very convenient. You're talking about
> >> a per-plane property, so there would need to be a separate file
> >> descriptor allocated for every plane, right? and user-space would have
> >> to block on all of them before proceeding?
>
> OUT_FENCE_PTR is a per-CRTC property, not per-plane.

Okay, sure.

> Also, at least in this particular case, a single sync file (not dma_fence=
) for any CRTC might suffice.

I don't see how we could rely on that given the provided api and
multitude of drivers. It might
work and then break randomly.

> >> Is the code really going to allocate a vblank_event when all the
> >> crtc's are disabled ? I guess it's possible, but that's
> >> counterintuitive to me. I really don't know. You're confident a set of
> >> fences will actually work?
> >
> > No when you disable everything there is of course no fence allocated.
>
> I don't see why not. "new_crtc_in_state" in this code means the atomic
> commit contains some state for the CRTC (such as setting the
> OUT_FENCE_PTR property), it could disable or leave it disabled though.
> I can't see any other code which would prevent this from working with a
> disabled CRTC, I could be missing something though.

So I'll concede it's possible it works, and the fact it's using a vblank
type event is just technical debt (though Christian says he doesn't think i=
t
works, so I think it's possible it doesn't work as well.)

Having said that, this whole argument of "the dysfunctional blocking api
is actually functioning as designed, but don't use it, since it doesn't wor=
k,
use the non-blocking api instead, because maybe it might work or it might n=
ot,
not sure" is pretty non-convincing to me.

> Handling modesets asynchronously does seem desirable in mutter to me.

Sure, fine. That doesn't mean we shouldn't fix the blocking call to behave =
like
almost all other blocking system calls.

--Ray
