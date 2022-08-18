Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BFA597A78
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 02:05:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A073D9059F;
	Thu, 18 Aug 2022 00:05:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A918196A64
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 00:05:20 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 o5-20020a17090a3d4500b001ef76490983so284411pjf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 17:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=9NPHiwtqPNxre28yxS9d6mP+OzEpWsKHpFGaBIQfFHo=;
 b=c+DJzCuX9b6UWy6q7vk0GytTDEQMUQyzBFnpcsDiJ9tCy1ABA43FcTGNlAIPnVqPMr
 QaWw66gDAEQTgLy3/0VfJ/04Z1K6nN9aaW4pTRhqT67BTeSJxgbBGXKw+20Voq541cRj
 ODOwicIGH/Mx7CEEKBuzJ8CGkQn8XZ+Tm1UMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=9NPHiwtqPNxre28yxS9d6mP+OzEpWsKHpFGaBIQfFHo=;
 b=7UtLe0y8GLNi2Eqdbbse2uJ7NrJTdP2KWQnJ7PWgtPKux/GjCSapOMeDJN3q+kiql3
 X1MMG81wMQt5tuWUTNKixwP9tXErdZ7l7mhXDo37NV5UQ3Yzr66v+ZFqoCgJKrzGZzPQ
 tLDgC/nCymhqcMqOr+SgVWOpxyT6USojkVvrOFIdEUUYTS/Ha1RnMWs41OIy92p0/kSB
 E/GejRhC1ydYIO6opbp6tLSQ5jw4glMZ0G8/pa4raMf2LQmePiLuy65pZeXwTvMhT0Gr
 zkyw1hhapqR/2+/YOG/+vKn7SgY5p1nYoQOoOiPNDHFhfysIHHDvCHumac3UZrmj8tlE
 ZvQA==
X-Gm-Message-State: ACgBeo089eg1hwG1uqRD/IuP9eFK9haWbAbOw7enhhogQdgGAsim0PdO
 8jk7DEBo03JUD1hpe94hV6m0Bg==
X-Google-Smtp-Source: AA6agR7/+tWwxFjVP+riQJr2uC9V324WisdRiSzdK+MoNM0HMBujlY6r7A39hGMOzongkyP5xfr1jQ==
X-Received: by 2002:a17:902:d50b:b0:172:a41f:b204 with SMTP id
 b11-20020a170902d50b00b00172a41fb204mr384268plg.70.1660781119748; 
 Wed, 17 Aug 2022 17:05:19 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:d8a:a33:bbd8:836e])
 by smtp.gmail.com with ESMTPSA id
 g4-20020aa79f04000000b0052516db7123sm112413pfr.35.2022.08.17.17.05.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 17:05:19 -0700 (PDT)
Date: Wed, 17 Aug 2022 17:05:16 -0700
From: Brian Norris <briannorris@chromium.org>
To: Zhang Zekun <zhangzekun11@huawei.com>
Subject: Re: [PATCH -next] drm/bridge: Add missing clk_disable_unprepare() in
 analogix_dp_resume()
Message-ID: <Yv2CPBD3Picg/gVe@google.com>
References: <20220816064231.60473-1-zhangzekun11@huawei.com>
 <CA+ASDXMGbJSJ2PC_4_2HL_01hO2aDoiWyxmosvtOze43aaeWpw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+ASDXMGbJSJ2PC_4_2HL_01hO2aDoiWyxmosvtOze43aaeWpw@mail.gmail.com>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Doug Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>, xuqiang36@huawei.com,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 17, 2022 at 01:34:13PM -0700, Brian Norris wrote:
> On Mon, Aug 15, 2022 at 11:46 PM Zhang Zekun <zhangzekun11@huawei.com> wrote:
> >
> > Add the missing clk_disable_unprepare() before return from
> > analogix_dp_resume() in the error handling case.
> >
> > Fixes: 211f276ed3d9 ("drm: bridge: analogix/dp: add panel prepare/unprepare in suspend/resume time")
> > Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
> 
> Reviewed-by: Brian Norris <briannorris@chromium.org>

Hmm, actually I'm going to have to retract that now that I've given it
some more testing locally. I happen to have a system where I commonly
hit this error case, and I'm thinking commit 211f276ed3d9 is actually
wrong, and so we shouldn't be "fixing" its error handling -- we should
be reverting it.

In particular, drm_panel_prepare()/drm_panel_unprepare() are *not*
reference-counted APIs, and this is already managed by
analogix_dp_bridge_disable(), which is called by the core DRM helpers
during suspend. Thus, analogix_dp_suspend()/analogix_dp_resume() is
serving to be an unwanted *second* client trying to {un,}prepare the
panel.

The panel drivers tend to handle this OK to some extent, as they (e.g.,
panel-edp.c) guard against redundant operations, but *we* don't --
notice that analogix_dp_suspend() ignores drm_panel_unprepare() errors
for one.

Also, I don't believe device management really handles resume() failures
quite right; in the end, this patch ends up un-balancing the clk count
on the RK3399 Gru-Bob systems I'm testing.

(Side note: every other bridge driver seems to ignore
drm_panel_prepare() failures.)

It's possible this was correct (or at least, not terribly broken) back
when it was written, but then, the DRM core frameworks have evolved
since then. Today, I think we do not need to manage the panel state
directly in suspend()/resume().

All in all:

Nacked-by: Brian Norris <briannorris@chromium.org>
Tested-and-failed-by: Brian Norris <briannorris@chromium.org>

Now separately, I have to figure out why I'm hitting this error case in
the first place...
