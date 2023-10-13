Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3537C8758
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 16:04:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1484910E04E;
	Fri, 13 Oct 2023 14:04:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F62510E056
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 14:04:17 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-50435a9f800so2794793e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 07:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697205856; x=1697810656; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pnbO+/OHP/lwsjQ1LK2Q7rZgS7pFZgVzeXibKR7haqo=;
 b=IIRJg8o/p/ywvT32ofPFHfuRdZKVTwwly2SdUEye7c1WN3UsVc4WBoFQF9qyHqoxCl
 6YioIoNn485JYTtm+a4H/pZ99CaRt7WFPRFEf+HCSLF9vqsOnkPE7dffY7517FEvo29q
 NEXwALY2lfpZAaDJGVtYowqBMg/4Qt1z0eleq5EKirECgwEL/ffeS1jtuBQtmZg57DCW
 Q0nj686omBhJs9pIGyYa4hN1gNXUwFUbUBAqp/pXKXHsp/rvvL4v3YXTy80pJgSdR8nM
 J2EuaLlPzUbYemLgw6QbLWK77f+qH0ah3Vy1cT+xKhsVM4Niri7V1TAt4OeAnAJg1bAV
 qu9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697205856; x=1697810656;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pnbO+/OHP/lwsjQ1LK2Q7rZgS7pFZgVzeXibKR7haqo=;
 b=CuBRCaRytzOquQ0c57T5V6y4PQ48mjbf7p+9G9V1goM/rYxnYGV4nCTbOwRD03PZfu
 2QpznYHO6/OtAyj/Vbw6DqIxSBVjuZYIL5I45I18Ow7I18eIsq2euvhbEnQqNXyqmxEx
 8yNiIuk1NZj/WnkgdPrpFsFzp2Muhf4NquZjXg3a+lWQjKcdAUHEsvW37qgkeG6RVbzU
 EHXv2CtIxrKmdlGJ38z+sVfCPZ6+mI6z9WmhMETm4yePQOzQKX/Yo21MiAjO9Ij/egR3
 RNZr8XbiyEWYopEXEoFEBxS4IkUOAo0e1NOoOcSD6QGX/0od4iVz57EEdP4DJhgw31Sj
 gvwQ==
X-Gm-Message-State: AOJu0YwgaXhW6WWcMcG+OLDmYl1Z4dcfyVeGQiMZWyJ9lvE6WBy9+uev
 JKsvBV16XOn061FFC5hI3keF8rQiC0vGdiyivrg=
X-Google-Smtp-Source: AGHT+IFZthIiKNJz0qlMn11a8mUerOf8ZNMgJboQO/rJuPvjHabXcRW9SVx8XrC3cY/FwGXhzpRSZmAYhG3MYqRey/k=
X-Received: by 2002:ac2:48a8:0:b0:507:97ca:ec60 with SMTP id
 u8-20020ac248a8000000b0050797caec60mr2122151lfg.3.1697205855362; Fri, 13 Oct
 2023 07:04:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230926170549.2589045-1-halfline@gmail.com>
 <ZR6IlVR-A5KtIHEU@phenom.ffwll.local>
 <CAA_UwzL=2PjeH_qW2GJa_XzJCeWkz9NcokPQX3-qn2f0iPz+Rw@mail.gmail.com>
 <90e7f66f-96bf-4e90-88c8-75019bc506a4@amd.com>
 <CAA_UwzJ7q8aq_iw3wimeQXmvKp8Z253J7oqi3UQqcKdkRmAcAA@mail.gmail.com>
 <9f9b50fa-8bad-4e96-ac60-21c48f473fc6@amd.com> <ZSPv1iAwJMgnsDu3@intel.com>
 <dc0c733e-df75-42f8-a920-cca8eebfa0dc@amd.com>
 <ZSU4aGnYsqUvz1ry@phenom.ffwll.local>
 <CAA_UwzJF3Smi_JSQ4S3B1kG23MEXppVfm0Sc1ftVktaoumymuA@mail.gmail.com>
 <ZSkQxEL4596_pQW1@phenom.ffwll.local>
In-Reply-To: <ZSkQxEL4596_pQW1@phenom.ffwll.local>
From: Ray Strode <halfline@gmail.com>
Date: Fri, 13 Oct 2023 10:04:02 -0400
Message-ID: <CAA_UwzLo+PHpVf2BtUC486_b+CUkt+Wm0RPJXhGkGmZzUAxDAQ@mail.gmail.com>
Subject: Re: [PATCH] drm/atomic: Perform blocking commits on workqueue
To: Daniel Vetter <daniel@ffwll.ch>
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
 mdaenzer@redhat.com, alexander.deucher@amd.com, airlied@redhat.com,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

On Fri, Oct 13, 2023 at 5:41=E2=80=AFAM Daniel Vetter <daniel@ffwll.ch> wro=
te:
> > I mean we're not talking about scientific computing, or code
> > compilation, or seti@home. We're talking about nearly the equivalent
> > of `while (1) __asm__ ("nop");`
>
> I don't think anyone said this shouldn't be fixed or improved.

Yea but we apparently disagree that it would be an improvement to stop
discrediting user space for driver problems.
You see, to me, there are two problems 1) The behavior itself is not
nice and should be fixed 2) The blame/accounting/attribution for a
driver problem is getting directed to user space. I think both issues
should be fixed. One brought the other issue to light, but both
problems, in my mind, are legitimate and should be addressed. You
think fixing the second problem is some tactic to paper over the first
problem. Christian thinks the second problem isn't a problem at all
but the correct design.  So none of us are completely aligned and I
don't see anyone changing their mind anytime soon.

> What I'm saying is that the atomic ioctl is not going to make guarantees
> that it will not take up to much cpu time (for some extremely vague value
> of "too much") to the point that userspace can configure it's compositor
> in a way that it _will_ get killed if we _ever_ violate this rule.
yea I find that strange, all kernel tasks have a certain implied
baseline responsibility to be good citizens to the system.
And how user space is configured seems nearly immaterial.

But we're talking in circles.

> Fixing the worst offenders I don't think will see any pushback at all.
Yea we all agree fixing this one busy loop is a problem but we don't
agree on where the cpu time blame should go.

> > But *this* feels like duct tape: You've already said there's no
> > guarantee the problem won't also happen during preliminary computation
> > during non-blocking commits or via other drm entry points. So it
> > really does seem like a fix that won't age well. I won't be surprised
> > if in ~3 years (or whatever) in some RHEL release there's a customer
> > bug leading to the real-time thread getting blocklisted for obscure
> > server display hardware because it's causing the session to tank on a
> > production machine.
>
> Yes the atomic ioctl makes no guarantees across drivers and hw platforms
> of guaranteed "we will never violate, you can kill your compositor if you
> do" cpu bound limits. We'll try to not suck too badly, and we'll try to
> focus on fixing the suck where it upsets the people the most.
>
> But there is fundamentally no hard real time guarantee in atomic. At leas=
t
> not with the current uapi.

So in your mind mutter should get out of the real-time thread business enti=
rely?

> The problem isn't about wasting cpu time. It's about you having set up th=
e
> system in a way so that mutter gets killed if we ever waste too much cpu
> time, ever.

mutter is not set up in a way to kill itself if the driver wastes too
much cpu time,
ever. mutter is set up in a way to kill itself if it, itself, wastes
too much cpu time, ever.
The fact that the kernel is killing it when a kernel driver is wasting
cpu time is the
bug that led to the patch in the first place!

> The latter is flat out not a guarantee the kernel currently makes, and I
> see no practical feasible way to make that happen. And pretending we do
> make this guarantee will just result in frustrated users filling bugs tha=
t
> they desktop session died and developers closing them as "too hard to
> fix".

I think all three of us agree busy loops are not nice (though maybe we
aren't completely aligned on severity). And I'll certainly concede
that fixing all the busy loops can be hard. Some of the cpu-bound code
paths may even be doing legitimate computation.  I still assert that
if the uapi calls into driver code that might potentially be doing
something slow where it can't sleep, it should be doing it on a
workqueue or thread. That seems orthogonal to fixing all the places
where the drivers aren't acting nicely.

> Maybe as a bit more useful outcome of this entire discussion: Could you
> sign up to write a documentation patch for the atomic ioctl that adds a
> paragraph stating extremely clearly that this ioctl does not make hard
> real time guarantees, but only best effort soft realtime, and even then
> priority of the effort is focused entirely on the !ALLOW_MODESET case,
> because that is the one users care about the most.

I don't think I'm the best positioned to write such documentation. I
still think what the kernel is doing is wrong here and I don't even
fully grok what you mean by best effort.

--Ray
