Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2E6295151
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 19:09:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 242CF6EE20;
	Wed, 21 Oct 2020 17:09:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0C0E6EE20
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 17:09:17 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id n15so3996091wrq.2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 10:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pK+230oFdHH5Bmu1JYbySOQhpYniyN1ymz8lPDi53/I=;
 b=r5RxEqtjOTtNZCmb0s9xaAe1N+gXSMiL/xH8MMKQe6PXMa/3BiCwSSpFC9OlL0CHwb
 dYrN06iPkrMEoFdp/y5iQMnpoYk5LyvYLOwn+KgdugBmdIk+UJCTCLh0PRXfLHVjP8Ij
 Mx4U0jB1CdraW4Vt5kCmkq5E8nHzkWpueXLhSNMfRGYkEb9X/lYg2+7pNkQVKAdc7K9D
 HlAGyxk8i8AH4CZ+Vu4tLY7tjnoyFQN8Xik89J5lfDmaPkxQPK7G6TbTMVhpN4Nu1xbU
 vRsOdo4Lv5zBU/B/q+QGdchj15RCDfIpEAnYX6csDvy8tpj4/kIeVfDQI6dre0+Wd1XV
 aHdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pK+230oFdHH5Bmu1JYbySOQhpYniyN1ymz8lPDi53/I=;
 b=XDbwV0Qi0uMD9lslT8SWkLdru8ldG3xKaUyiZIdXS8ZZLTfa7a4ouNL4rDILcLJuoL
 pfg/YGLo1DBxrvW7OzJ4asRKmHJMk2+DPd9KogWhnYdgfJeIbWP2wPxziIQmKIGHuuPA
 KpGHPZtODVymWyDz3WoQV7aKSn9mloQ/CJztDdXd7YSYvfzWk0a1aVZLpSy9QbYWU3XC
 /l/wiMX7ifFIgJNxUlyTLHsLBWdGyTjsr3Zko857Hud6q4zLP+77BYpcY7SKlJwfyrLO
 dp5nHfEd7KDrtKry1+Zs4jHHGpbQfYE1txbW6fgzS9fnM3ltMueYGVNijypzJtCKFRt0
 LBFQ==
X-Gm-Message-State: AOAM532R+vLhD1A9P2yPyHpYEE/6VpX8WJcSWc3Mt1QV5df8kHZ9WBdX
 jFfaFo/Aoud1UOunM8VR/p4QzIWk7kFiVnlu22OkRw==
X-Google-Smtp-Source: ABdhPJzf75d0coitydzbq/7bGNhuKFBfzeO1Z1CnQzUe9i4r+Oe7/HEHQ0XLki00Kr3cW42XvFD/D40LWp654QfO2wg=
X-Received: by 2002:a05:6000:108:: with SMTP id
 o8mr5874410wrx.256.1603300156439; 
 Wed, 21 Oct 2020 10:09:16 -0700 (PDT)
MIME-Version: 1.0
References: <20201021065404.1336797-1-kenbshuang@google.com>
 <xyxxV-NdH-NcnbRURBYThCKj5j6VFLMi0twD2wptimtzrod1EyQ_Rp5BYQoQlVKUXsmZGxhrltrYBW4dgD4UDvgKSgW2CAzt_Q1e5bCNWlk=@emersion.fr>
 <20201021083415.GN401619@phenom.ffwll.local>
 <CAJxBc99xxc1S6CrE0KswPpY2Rf3KS0AQewNZQOfmOTbMWrtnTA@mail.gmail.com>
 <CAKMK7uECj12NaOeh3PzLM8C_oT=_bce515z-5rDGnjkKf92Htw@mail.gmail.com>
 <CAPj87rMc5=eBKRDJUg0VSCCWcvNk6_8vj1TZeJcK8oPdi=DVwQ@mail.gmail.com>
 <20201021163452.GP401619@phenom.ffwll.local>
In-Reply-To: <20201021163452.GP401619@phenom.ffwll.local>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 21 Oct 2020 18:09:05 +0100
Message-ID: <CAPj87rPTSOiFosCfq+LpFaM_++S6Pd150VFuxMWS3gLMNXCp-g@mail.gmail.com>
Subject: Re: [PATCH] drm: add client cap to expose low power modes
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Ken Huang <kenbshuang@google.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Adrian Salido <salidoa@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 21 Oct 2020 at 17:34, Daniel Vetter <daniel@ffwll.ch> wrote:
> On Wed, Oct 21, 2020 at 05:11:00PM +0100, Daniel Stone wrote:
> > It makes sense to me: some modes are annotated with a 'low-power'
> > flag, tucked away behind a client cap which makes clients opt in, and
> > they can switch into the low-power mode (letting the display/panel
> > save a lot of power) _if_ they only have at most 15% of pixels lit up.
> >
> > My worry is about the 15% though ... what happens when hardware allows
> > up to 20%, or only allows 10%?
>
> Yeah exactly, that's what I'm worried about too, these kind of details.
> Opt-in flag for special modes, no problem, but we need to make sure we
> agree on what flavour of special exactly they are.
>
> > If we can reuse the same modelines, then rather than create new
> > modelines just for low-power modes, I'd rather create a client CRTC
> > property specifying the number/percentages of pixels on the CRTC which
> > are lit non-zero. That would give us more wriggle room to change the
> > semantics, as well as redefine 'low power' in terms of
> > monochrome/scaled/non-bright/etc modes. But it does make the
> > switching-between-clients problem even worse than it already is.
>
> Yeah, that would make sense too. Or maybe even add read-only hint that
> says "if you're below 15% non-black we can do low power for your, please
> be nice".

If the hardware can actually do that autonomously then great, but I'm
guessing the reason we're talking about separate opt-in modes here is
that it can't.

Cheers,
Daniel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
