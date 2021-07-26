Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9066B3D67D3
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 22:03:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C662773031;
	Mon, 26 Jul 2021 20:03:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E70A73031
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 20:03:25 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id gt31so18157617ejc.12
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 13:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=v27CdrSuMsKdqxpH5RpPxjgZZy4Tg8c8Sk0xIzWL3lQ=;
 b=ExYqWFubr7BLC6MWykuP0s5JtHo3DDn1g9kc2XkWfYJvGPpPeWa3+WZOcquvsKfBA2
 xgkY/xB9RX+sFryQPBK8fA+MkZ2QuFX/8Zr1MUS3JtAW3ATpDvqiKvovqh7iwWhf99as
 bWcSlymbBa5qt3TFomBhl5xdMtrbwfYfRZPqtF0iJFebKRJeUDE3fpMDLSLfFHSnlccb
 R8DlQZkIdvlz9Dc6UKaYOqdQbRfscVOBh7tXMRqxoxQtcqoP3Bhjdffb2D8Ndw5wUK9A
 iYG/W4f9a3UIQ87hHAD1UMdYpuve5sVnVqQI+iAjRDJ1PkwHxIox9bevN/SuF+yxD0In
 EJEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=v27CdrSuMsKdqxpH5RpPxjgZZy4Tg8c8Sk0xIzWL3lQ=;
 b=osI5NlmQ0J/pfB1kGYJPLhfZfwmBUSayZvX3r34UTJS7dsIu8ILRap6lAxaS0r++na
 AN5DWPqbZmaT2jaP4lCGHPhkqpyF8nZvHsemThgd+C+cq1+ozPnntuw1Fpulx/WChg8G
 EgAtAT4aVmSuRKG7pJwFyh8tP3R3V4wZxKL1oiTTac7/64xo4qX0ZbNQUVw38jU62cn4
 bov0+KY/J1KAHOKxixkT8Vxst8pa8j6NY+Em+4840giW0cKz/G0kKIJIGv0+fHiXRom8
 BbkfQe5/O8FcmFSoa+iu5+HB73IwXDtcg3J7SzutshqgeMsA9Qpqn3Vb8Bu9DV5hvod6
 Rfaw==
X-Gm-Message-State: AOAM531emqJVRaC/+sUS3IuGGU3zQp7YhU3UoIQK361Os5X/wbn1NCL9
 EWCa1avYH5oR6xAVm8slkD4qgeNhUjSzgWqj4nk=
X-Google-Smtp-Source: ABdhPJxZOX4TkCOp9UFf6RhtOZTeQZZcoXbyoC/ZGgsstsf4Czh/hGw2cH2Z9mZslWewyy2MY7lJAZlmsa3eilsjy6k=
X-Received: by 2002:a17:906:c155:: with SMTP id
 dp21mr5089402ejc.9.1627329803794; 
 Mon, 26 Jul 2021 13:03:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210722124127.17901-1-christian.koenig@amd.com>
 <YPqCBUDiibBWUs2/@phenom.ffwll.local>
 <c83ebc42-567c-4f4c-d6da-53ff21739222@gmail.com>
 <CAKMK7uGVPnsw2o=9E295CobiY_qYdCg5fZQN4Q8Bu22r9E3WUw@mail.gmail.com>
 <4c30a961-0a73-3f69-7733-2491549a8743@gmail.com>
 <CAPM=9txffDPERe_iZ2obsekJcbjfph32bca-18ROCJqEPByQWg@mail.gmail.com>
 <1dd69d33-4b58-e3dd-5598-ed78f2a18ef5@gmail.com>
In-Reply-To: <1dd69d33-4b58-e3dd-5598-ed78f2a18ef5@gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 27 Jul 2021 06:03:12 +1000
Message-ID: <CAPM=9twfAQV60+vmn3WdiS6o4C7GajWS7_a0wLDo6zyBw_kBsA@mail.gmail.com>
Subject: Re: [PATCH 1/5] drm/vmwgfx: unbind in vmw_ttm_unpopulate
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: Dave Airlie <airlied@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 27 Jul 2021 at 05:35, Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 26.07.21 um 02:03 schrieb Dave Airlie:
> > [SNIP]
> >> But you know, normal human: Only equipped with one head and two hands
> >> and not cloneable.
> > I'm the same, but I'm not seeing where this problem happens at all, do
> > we have any backtraces or demos for this?
>
> I've stumbled over this while working on some patches which accidentally
> broke delayed delete and caused random memory corruption and was
> wondering how that even happened in the first place.
>
> Having stale PTEs in the GART isn't a problem unless you break other
> things. Which is also the reason why I haven't added a CC stable yet.
>
> > I split bind/unbind into the driver, but the driver should still
> > always be moving things to unbound states before an unpopulate is
> > called, is there a driver doing something unexpected here?
>
> Possible, I was only testing with amdgpu and the GART handling is rather
> special there (which was one of the reasons why we did that in the first
> place).
>
> > at worst I'd like to see a WARN_ON put in first and a test in igt that
> > triggers it, because right now I'm not see that path through the
> > drivers/ttm that leads to unpopulated pages ending up happening while
> > bound.
> >
> >  From 5.14-rc3 unpopulate is called from ttm_bo_pipeline_gutting in
> > non-ghost path and there is no unbind,
> > pipeline gutting is called from evict/validate, when there is no
> > placement suggested for the object, is this case getting hit somewhere
> > without the driver having previously unbound things?
>
> Yes, that will hit absolutely. Most likely with VM page tables for
> amdgpu which uses this.

My thing is here we moved binding/unbinding to the driver, if the
driver has a bug
I'd expect the fix to be in the driver side here. I think giving
drivers control over something
and enforcing it in the core/helpers is fine, but I don't think we
should be adding back
the midlayering.

> > ttm_tt_destroy_common: calls unpopulate, everyone calls this directly
> > after unbinding
> > ttm_tt_swapout: calls unpopulate, we don't swapout objects from TT
> > directly, we should always unbind first, this used to have an assert
> > against that,
> > ttm_tt_populate: call unpopulate in failure path
>
> unbinding was moved into the driver, so ttm_tt_swapout() won't unbind
> anything before calling unpopulate as far as I can see.

But we won't call swapout on BOs that aren't in SYSTEM and to be in SYSTEM,
the bo would have to go through the driver move function which will unbind =
it.

>
> > So any place I can see unpopulate getting called with a bound TT
> > should be a bug, and fixed, we could protect against it better but I'm
> > not seeing the need for this series to outright revert things back as
> > helping.
>
> I'm not reverting this because it is offhand wrong, but making sure the
> GART is clear before unpopulating the TT object sounds like the much
> more natural thing to do and the state machine is something I certainly
> don't see in the backend.
>

I don't think that's the core's responsibility anymore, I'm fine with
adding code and
even an flag that says if the the TT is bound/unbound that unpopulate
can WARN_ON()
against so we get a backtrace and track down where something is
getting unpopulated
without going through the driver move function to be unbound.

Dave.
