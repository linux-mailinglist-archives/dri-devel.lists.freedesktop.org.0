Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C5E9E9419
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 13:32:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF1FE10E717;
	Mon,  9 Dec 2024 12:32:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="M1T0Hge8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F42C10E717;
 Mon,  9 Dec 2024 12:32:27 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-5cfa1ec3b94so5455729a12.2; 
 Mon, 09 Dec 2024 04:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733747545; x=1734352345; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HB4h5xGYBYj3eCi9b2ZJAMbBJzOGVJksJuXFxsMtAq8=;
 b=M1T0Hge8VQwsGcQoQ9ByAsF7Kx1P66W4N6sCKZUl1H7G1v+OculqMUz1a04Ss/Ofre
 czr7d97mauCvMEM6oFPACrfW1/WHJJBvwYKcLowZ5+LYoxL/UK4Vl623eg1tiOTgI9gO
 6k+jvlW3ojzdXBoxrDCH9cHg6r/SN8AWYeg9MnllSIFzLckiySRLmwvI+bGOPz2YC+s2
 fGGtVxnxSu+ZLPgmqas7ggk9a8cNrgqMh76ei3INd6rjCgVQ5SiXYL343VZPeBkpHoHI
 RWbJQgmeiQpFGetOAGOdtYBA3xkIx4O0CiWJ35xrAd5sEOTn3X7k8cVSPFC+9b4Yafgh
 lIxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733747545; x=1734352345;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HB4h5xGYBYj3eCi9b2ZJAMbBJzOGVJksJuXFxsMtAq8=;
 b=NvdnXK4GAZk5eVCSg1SZbJcCId4PO145t5iojB3nUnuIMrlDxHWOgWuYQ35kx6cvmw
 OiTWufMJf02liNh+/d+9i6lHhs+gUAHY9YtNQIr5VV2Rg/t3TvH3OPfQFnlCSGPqb1XE
 TGhmkNijWS7tXg5W7YOPCV7HSExbYTRdy8XWHUC+EjihiYYaxbH/RZ++hp+lM5N9DO0z
 7CAnXD4a1sqJ7bEAa/pmv90oJ1Gmxkz51Q1Vukt6/sw+vOnL7xVzczTS9rrJ5pMaZk+i
 Q2IPv7ED3wROx/PYWhS9reSBj/VUW839TPzG/7amtJPUcBk9d4TIAtKSfe8fR14jDQbj
 OVKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnSD9FKylxePZsBELRUBaJHBNH7nC/dDHSzbytLyXCSLyJEW2gHz1mrHqNXOMM6dNsvtICdQ9U7aA7@lists.freedesktop.org,
 AJvYcCX6uOI8iKYl8L8kqIpurQUpdCONYo1xKSrrq7JtnGR0tdDhHt+CkqIHqMYyuU7UJzNf14gIAG4IZn0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyCgzrUSP/nqSrJYfmDhkMVozBmE/gJMRmBhTqI/JLmnKYe+9FJ
 i/RXIcFGDf23xZIHL5GjHUBuEmQqmWUGYpZnqRChb30uy56vsIEtpYplIHJplhXipovxKi22nFh
 fKN8AqYVV5iQLgg/T+Eoy7uJAmxE=
X-Gm-Gg: ASbGnctQRDnafncnaZJdPLlOWlA/RtMeOgiPadauPfzT7PqEz7sZ0XBdObglu9NSfxt
 mocH0y2Rghph0B69I7Qj+MxYCOc+pVyA=
X-Google-Smtp-Source: AGHT+IFjelp5b6CRvlamva7li7ksyULJr/ZURZRaVo1idystYOkChGCfpprPWdYOncNMp0luUAJecmb6PSVS5WPpxr0=
X-Received: by 2002:a17:906:3145:b0:aa6:7cae:db98 with SMTP id
 a640c23a62f3a-aa67caedcf6mr431164766b.10.1733747545303; Mon, 09 Dec 2024
 04:32:25 -0800 (PST)
MIME-Version: 1.0
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-5-4e4cbaecc216@wanadoo.fr>
 <8b8262389bd6484586007d749132346f@AcuMS.aculab.com>
 <CAMZ6RqJPvbSr5i8N4Dm=2N6D8uSzefCM3TyK8HBNNNrybo5f2Q@mail.gmail.com>
In-Reply-To: <CAMZ6RqJPvbSr5i8N4Dm=2N6D8uSzefCM3TyK8HBNNNrybo5f2Q@mail.gmail.com>
From: Vincent Mailhol <vincent.mailhol@gmail.com>
Date: Mon, 9 Dec 2024 21:32:14 +0900
Message-ID: <CAMZ6RqLMXaAej75eXrLgvt-Co1yyEg0QNJSxPovzLzb7vdxmdQ@mail.gmail.com>
Subject: Re: [PATCH 05/10] minmax: simplify __clamp_once() by using
 is_const_false()
To: David Laight <David.Laight@aculab.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
 Justin Stitt <justinstitt@google.com>, Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Rikard Falkeborn <rikard.falkeborn@gmail.com>, 
 Martin Uecker <Martin.Uecker@med.uni-goettingen.de>, 
 "linux-sparse@vger.kernel.org" <linux-sparse@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "llvm@lists.linux.dev" <llvm@lists.linux.dev>, 
 "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "coresight@lists.linaro.org" <coresight@lists.linaro.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
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

On Fri. 6 Dec. 2024 at 00:52, Vincent Mailhol
<mailhol.vincent@wanadoo.fr> wrote:
> On Thu. 5 Dec. 2024 at 03:54, David Laight <David.Laight@aculab.com> wrote:
> > From: Vincent Mailhol
> > > Sent: 02 December 2024 17:33
> > >
> > > In __clamp_once(),
> > >
> > >   __builtin_choose_expr(__is_constexpr((lo) > (hi)), (lo) <= (hi), true)
> > >
> > > is equivalent to:
> > >
> > >   !is_const_false((lo) <= (hi))
> > >
> > > Apply is_const_false() to simplify __clamp_once().
> >
> > There is already a patch 'for next' that changes it use BUILD_BUG_ON_MSG()
> > and statically_true().
>
> Found it!
>
>   https://lore.kernel.org/all/34d53778977747f19cce2abb287bb3e6@AcuMS.aculab.com/

I picked up your patch and got two build errors on an allyesconfig.

You already sent a patch for the first one:

  https://lore.kernel.org/all/33893212b1cc4a418cec09aeeed0a9fc@AcuMS.aculab.com/

For the second one, I submitted a patch here:

  https://lore.kernel.org/all/20241209-nfs4state_fix-v1-1-7a66819c60f0@wanadoo.fr/

I will wait for those two to appear in Andrew's mm tree first, and
only then, I will send a v2 (that will be rebased on the mm tree to
get your change).

Meanwhile, I think this series will be on hiatus.


Yours sincerely,
Vincent Mailhol
