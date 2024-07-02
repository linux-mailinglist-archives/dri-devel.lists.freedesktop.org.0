Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEAF924B51
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 00:14:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34B3D10E6AB;
	Tue,  2 Jul 2024 22:14:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iqiM73dq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com
 [209.85.217.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8286F10E6AB;
 Tue,  2 Jul 2024 22:14:29 +0000 (UTC)
Received: by mail-vs1-f53.google.com with SMTP id
 ada2fe7eead31-48fdb1791b6so153768137.3; 
 Tue, 02 Jul 2024 15:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719958468; x=1720563268; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9sD8orU3RBfAf2hoz6apBJzmcU2qvSOHNCAhe0iXUBY=;
 b=iqiM73dqlDSWn2me3sgqn8O31YhIEyCiJg9ZC0h1pkTeQhdLqvZBb98AqrqSU5H2un
 8NP+Xu4JfxeAPeCX1e0fnNMAPa1ThZtwsmdURs2VX4MyBVQooSAZoxWnJTPHD91j92GU
 +MyQgnuRhAh8QAbaAQkJpSYKI0VFi3n2pkPrbBBA2M76Wz8GymFySFFUExAh0aE03l1n
 UgnahQWQbieCpDYaJsaLRUeowvS0rQ+0g6bakv0Q0N3ZMVsYzx0Ox6vW776H8ZQzcKFo
 1roGM77dtVFDkO+ATXYLFY7q9OW29+aLm1X/DWWXMUH9dLIlUV6ZGBDl7pWgJx30Nxu6
 Zvaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719958468; x=1720563268;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9sD8orU3RBfAf2hoz6apBJzmcU2qvSOHNCAhe0iXUBY=;
 b=ME1RqxijJOQK7LKqFHUOtSGUjl6N5fcgfZiem+AUQqfXS7P5yJbXOUbbGyW0E5ixlv
 sS1lt3G1rfLeaSomgSxvfaftU2Tl2bjh40+4LVhSDZrKiQ5rj/cBFPQ6Wre9kSdtNxW7
 Cj+ZhI5BXSwJf/lyp3Qm38LaI2Eb7enGPZMhfChps8E2E9buYIHKVEF2T+TRLOptOrWD
 PEaA4c2V18xng8KItePVkV7/6EVy3PbGUEFPr5WEdcINXZjFZt7iDxulqr724nPBuBG4
 Ah19QZ37+3i7rdN2E6d5tsAY3MoRgE5SUXljlX4qOqlXBYdoeaf5hRwYfEyiQwdHAOtz
 9dxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3ReOgviUESVnizOffRc2BvpH1QZgvCsroU8XKFCSTQL3iz4ggZyYxh2jc4RKI+FyRJd5DWSk/Z6waGm6MXZ1aXvrU/+rbjDQt8E4Q4VXZqij0VOUkZy5WjKKoiXWe+KToEq+xOfHVWGs6rf9tHIDo7BybVPgBdx0H9hTZ7uyqwTTqxJCRH4gKHhgMWHgXVq9WNKPP1B7u1pIZbdTZsSp6BJJ563gbg6uOhxQG41dCUIAcpzw=
X-Gm-Message-State: AOJu0YyzSpLYR3Qn5XfA/jqVrWA0/MM3+L0xaMuCKejwlntodLZ08aoJ
 M/rnJUYailSOCTg8Oa943HPuNzgQcBZLJgcmI5/nKwDr4VSvftP5XVwcDAQfBb2k3SmS3YdRV/E
 gqpWH+Kc4vQ3e7/NPebVUv/XAEoM=
X-Google-Smtp-Source: AGHT+IFXhbMOr7DzwzYNNyCsqRINNrgPdR0zpixK3ln2x5FkwZHpp8LDhrs2Je7fcFc10Y+XcQgRdrAqwBXhcj1xmd8=
X-Received: by 2002:a67:cb16:0:b0:48f:a93b:502 with SMTP id
 ada2fe7eead31-48faf133971mr11356498137.26.1719958468275; Tue, 02 Jul 2024
 15:14:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240702215804.2201271-1-jim.cromie@gmail.com>
 <ZoR40nWmpEV2Ly_6@bombadil.infradead.org>
In-Reply-To: <ZoR40nWmpEV2Ly_6@bombadil.infradead.org>
From: jim.cromie@gmail.com
Date: Tue, 2 Jul 2024 16:14:01 -0600
Message-ID: <CAJfuBxyxamRhOyz8WuL+7=eJkEKSw8jnAWjyAuqU2i7gvg-rsQ@mail.gmail.com>
Subject: Re: [PATCH v9 00/53] fix CONFIG_DRM_USE_DYNAMIC_DEBUG=y
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com, 
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com, 
 gregkh@linuxfoundation.org, ukaszb@chromium.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 linux@rasmusvillemoes.dk, joe@perches.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 2, 2024 at 4:01=E2=80=AFPM Luis Chamberlain <mcgrof@kernel.org>=
 wrote:
>
> On Tue, Jul 02, 2024 at 03:56:50PM -0600, Jim Cromie wrote:
> > This fixes dynamic-debug support for DRM.debug, added via classmaps.
> > commit bb2ff6c27bc9 (drm: Disable dynamic debug as broken)
> >
> > CONFIG_DRM_USE_DYNAMIC_DEBUG=3Dy was marked broken because drm.debug=3D=
val
> > was applied when drm.ko was modprobed; too early for the yet-to-load
> > drivers, which thus missed the enablement.  My testing with
> > /etc/modprobe.d/ entries and modprobes with dyndbg=3D$querycmd options
> > obscured this omission.
> >
> > The fix is to replace invocations of DECLARE_DYNDBG_CLASSMAP with
> > DYNDBG_CLASSMAP_DEFINE for core, and DYNDBG_CLASSMAP_USE for drivers.
> > The distinction allows dyndbg to also handle the users properly.
> >
> > DRM is the only current classmaps user, and is not really using it,
> > so if you think DRM could benefit from zero-off-cost debugs based on
> > static-keys, please test.
> >
> > HISTORY
> >
> > 9/4/22  - ee879be38bc8..ace7c4bbb240 commited - classmaps-v1 dyndbg par=
ts
> > 9/11/22 - 0406faf25fb1..16deeb8e18ca commited - classmaps-v1 drm parts
> >
> > https://lore.kernel.org/lkml/Y3XUrOGAV4I7bB3M@kroah.com/
> > greg k-h says:
> > This should go through the drm tree now.  The rest probably should also
> > go that way and not through my tree as well.
>
> Can't this just be defined as a coccinelle smpl patch? Must easier
> to read than 53 patches?
>

perhaps it could - Im not sure that would be easier to review
than a file-scoped struct declaration or reference per driver

Also, I did it hoping to solicit more Tested-by:s with drm.debug=3D0x1ff

Jim

>   Luis
>
