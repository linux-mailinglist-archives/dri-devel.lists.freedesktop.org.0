Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 197EE398057
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 06:30:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C53EF6EB3A;
	Wed,  2 Jun 2021 04:30:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BBA66EA8D;
 Wed,  2 Jun 2021 04:30:27 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id dj8so1266408edb.6;
 Tue, 01 Jun 2021 21:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rDgbnII0J7gO9tnOuLMgPFZW1dZJ4Js1Fyu0nkizAZs=;
 b=kOza2yUMbdTnkMaoNxQ9zT6DZfFI610gHbMElXI+9oTTvP8zz0XhKrD2o6zhGguIEj
 fc2LTr0Z8qdHKfZsCfpC+RnVe2bqHS4nWSRor/kQ/YLqgBxpKI3LgBF8steOQgdJlMml
 59fn7w9FNBx872J8nZ+T/7JtZP8zu9Q7No99sABX8uLMEAtpTIi3HHBckvjRsy/HT9Bz
 aqiqSglTz+7AEPAV48KwAFETGQa8I41Cax9aRv2v3B5GrmfgHH40TqzHcBq7tft6ywI5
 8ziaSdBNqCO4hoo3EWMc4qdmxXPY+IIt9F7HcjULk5Q4ifWv8oeDfzk3o1ybRR0s5uDD
 fzrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rDgbnII0J7gO9tnOuLMgPFZW1dZJ4Js1Fyu0nkizAZs=;
 b=HBxcTKVyepvdLvhvwmOa2yr/5m//dFbHdlcKv1TcLApXthuwuxuRiAw/f72odAVl5M
 HoG6mRy0V4dbBpbA+sfV5Bh9R8pyOcDS6z6noSytF8IYMT0bxe9nSRQFsyzNQPMNpoxb
 R/T4JbsBnchpm8K5qxgcDgqwaF1t3gXKbou4Oisj3qEaznPckrz1/hPDa1uxpr2zwJgT
 DFNZqlKeOrcS5tuBf0Ih4qy0MNxHck5ER7OTFIJvHYFBKC1gyl5ZPsT5bv8dolFEKVn9
 GA2wtrL0RnFO3HuxaVtT100DCvMK+gkBdBfCEY+KeME3m8TzvO2SOp5ndYESUJK8zcQ3
 CNEw==
X-Gm-Message-State: AOAM5312f1dV8E2zP8d3i0+g7QLJVVAAm5aEV3RloVmhqDdLVrX4V/43
 xBAfMUiz24dNc+gv1gRa5p35Lqf2N2uV6EQ9V6w=
X-Google-Smtp-Source: ABdhPJz0sUNsqiGAt2+H8cIT/QxMAZvx+Gbq3eO90RRbU8SMLhmUs506Cn1jeyCHiGVC8yqClzx/N7wLT7j7DfFiFX4=
X-Received: by 2002:aa7:c545:: with SMTP id s5mr23095567edr.113.1622608225894; 
 Tue, 01 Jun 2021 21:30:25 -0700 (PDT)
MIME-Version: 1.0
References: <YLCbBR22BsQ/dpJB@jlahtine-mobl.ger.corp.intel.com>
 <162218682866.9100.50543809230103499@jlahtine-mobl.ger.corp.intel.com>
 <CAPM=9twwritR-5-iN-D4AvMMnng9PkCfZmsU3zhZZBFkGGx9Ww@mail.gmail.com>
 <CAPM=9tyb-PffapqXE4c1Ow0wVeT2a-r88VkEurUox5AFsQrfbA@mail.gmail.com>
In-Reply-To: <CAPM=9tyb-PffapqXE4c1Ow0wVeT2a-r88VkEurUox5AFsQrfbA@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 2 Jun 2021 14:30:14 +1000
Message-ID: <CAPM=9tzAO4yoinKoUbFsWcQyLY_naqY-T-meLwc09Pkn+ZroFA@mail.gmail.com>
Subject: Re: [PULL] drm-intel-gt-next
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
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
Cc: "DRM maintainer tools announcements, discussion,
 and development" <dim-tools@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2 Jun 2021 at 14:17, Dave Airlie <airlied@gmail.com> wrote:
>
> On Wed, 2 Jun 2021 at 10:28, Dave Airlie <airlied@gmail.com> wrote:
> >
> > This has these two patches applied, and it doesn't build.
> >
> >   drm/i915: drop the __i915_active_call pointer packing
> >   drm/i915: Fix crash in auto_retire
> >
> > The latter patch shouldn't be necessary after the former, please fix
> > that up and resend and please build test trees before I get them in
> > future.
>
> Oh maybe this is an unresolved conflict, not sure why drm-tip doesn't
> catch this though, or is this next tree not in next?

Oh looks like tip did catch it, I just didn't see it was done with a fixup.

Dave.
