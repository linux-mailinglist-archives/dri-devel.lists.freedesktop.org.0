Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B302B36E0A0
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 22:57:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A2476EC44;
	Wed, 28 Apr 2021 20:57:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18DD96EC3D;
 Wed, 28 Apr 2021 20:57:38 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 d3-20020a9d29030000b029027e8019067fso57716678otb.13; 
 Wed, 28 Apr 2021 13:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VoBUWBPezbfw1+PHsV6WbVogGOVLqLK1utShMT7jZyQ=;
 b=kb7PWEuPoP2PB1Dqtqixz76QI+0O2hSranUuSrbIvnu7tZGncGJHavE0rMNW4XDEqC
 FUt+F6rwrOJjpUH3ldXHiDZxuao6Y1raL4LnkQYiHX68st7qv9ES6HOL+LA9NlwOvKDK
 ffoYogHSSc4qVONkEcMg9qzbERkFz4aOPZwlF8xgd1nCJKRvjzsMyIbynqm+RalPaHBa
 m7W8IBIEhnn7Kc64M4hbHskRMm6SwJn6pUoVW3wW0Ibj8oi5Slr9dp8ML3M60U6HaAlA
 9tsbtZOMAnCdCOZlY0056nytEgopmU28NZXYt3hEJ/Hl2Mu3mg2oVAfClsqpdAluzLa6
 3W3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VoBUWBPezbfw1+PHsV6WbVogGOVLqLK1utShMT7jZyQ=;
 b=TIz7DAoJs55M8/AXqETA63+RKSJfzS1yPoZqSO6G6uIRSmBhbU36agNinYCnk2Y677
 8NBUu8Brsq8JV3KqbLv2rhQsm7vNQbhb5bt5jHRrww27M6+DlPPuGN1Y7BCuF/4NKgBJ
 +r2YOJBQkES+fYEoB8oCFl4HmZK3Dawgq/easJdsG+ss8GzoSctav0knu8WtwXjXx76C
 uGNgbOQK1AmP+LE91WFgSnhMAT6Afm0UOO7PIoXu1aYrfO6tEt82Z4XeOAPRSWPY+elb
 TyOUhepv33HzRQ/wxWksni4upl5BRcX40aHCG4DABrvb63bFjRJM0avPGIMtj+F5Txcd
 /F7A==
X-Gm-Message-State: AOAM53277nudcDHJJFS/cZmZxBY5l/NRVBLKoKso2n1dnAbpxZ8tZJxK
 PvpJX5b8OR6lmBNd52OFJKvD6/JIUVO3WuuneH4=
X-Google-Smtp-Source: ABdhPJwCgaYaoQxLAz19mr4AuV1Q4aWFt4y0HaY3/SfOjfkx1IppE3zZ2ThNotUDsuMO3HGnc+Kr9l9WPLkcrwMlaSU=
X-Received: by 2002:a9d:8d1:: with SMTP id 75mr7740925otf.23.1619643457474;
 Wed, 28 Apr 2021 13:57:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210422163329.dvbuwre3akwdmzjt@gilmour>
 <CADnq5_O39XAV+EF=CeKGK3UEG6E_6Gt_goW6u1+5siC5ROtz4Q@mail.gmail.com>
 <20210426073515.5lxw64eota7usaq4@gilmour>
In-Reply-To: <20210426073515.5lxw64eota7usaq4@gilmour>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 28 Apr 2021 16:57:26 -0400
Message-ID: <CADnq5_MqQo95FQvz2Mj3G7LoMGNkyu=5cLqKpfm01E_0Uywa5w@mail.gmail.com>
Subject: Re: [PULL] drm-misc-next-fixes
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: dim-tools@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 26, 2021 at 3:35 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi Alex,
>
> On Thu, Apr 22, 2021 at 12:40:10PM -0400, Alex Deucher wrote:
> > On Thu, Apr 22, 2021 at 12:33 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > Hi Dave, Daniel,
> > >
> > > Here's this week drm-misc-next-fixes PR, for the next merge window
> > >
> >
> > Can we also cherry-pick this patch:
> > https://cgit.freedesktop.org/drm/drm-misc/commit/?id=d510c88cfbb294d2b1e2d0b71576e9b79d0e2e83
> > It should have really gone into drm-misc-next-fixes rather than
> > drm-misc-next, but I misjudged the timing.
>
> Yeah, just cherry-pick it, I'll keep sending PR during the merge window :)

Thanks, I cherry-picked it yesterday.

Alex
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
