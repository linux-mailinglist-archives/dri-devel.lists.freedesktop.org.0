Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A9B3EAB81
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 22:08:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F9596E479;
	Thu, 12 Aug 2021 20:08:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 148EB6E471
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Aug 2021 20:08:27 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id r6so7305373ilt.13
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Aug 2021 13:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1bGQrduUL+m7VKRi0v0z85Q4dsnPpu6fOOpwbY1ffcA=;
 b=VkYCJom5pQdEVeQHfD3XlI4ousGOTHyxeSAvOpfTqiA6czSNTcbk54qIadf6AzTflf
 tuEyhtjXasOIcoOn/irN1qhAoj5mL8+7JP3Rmt1aqlq9OrRyvlUJ/JFa2Yo1lYJkNVUW
 aiVQWCBmqdke9ohe/yMCVhVBFLWk1Eag9+qWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1bGQrduUL+m7VKRi0v0z85Q4dsnPpu6fOOpwbY1ffcA=;
 b=HxkHpBAFtV3j1PJA9EApX5QXtMw1yuXVB43xSDwCqDaChAK2/zQf4T/HeRF4xzKb7l
 jdGXazRd8OD/Wlz0mT50DSZex3AvXPB+5y7CHcUCVBKw9kp+YCF+pqvAk3xS5NIlnwqz
 VMXV+nC0S1rbpHDtodRAuli3OF+WxkIvfzXbDl8+ovtgyG4KeWckREHUzW5znuGG4Bo5
 dWXlD+aKNVj3P38JrY5SsKDnHs1eZfAmn8x31ZMbilBK41gip1oiU1cPaQ1fr7wcAW8+
 qMB1Ic/OHHM8RtlfyFYFi6ol2L1YBFMeNrDkND5IpU/U2lXhAhgTsbZcKf6wntI+c2Yb
 FCsQ==
X-Gm-Message-State: AOAM531QDX42p4762F13pXWHG8RekRD8ECDgampfXQKlOPi4ZqOZqA2c
 kVhlXqyEm3e1xJd/mc6mWBWFc4pRd5Mt5w==
X-Google-Smtp-Source: ABdhPJwB8hgI048/FzE8/LHeBBkn7CmQ5qW4d39kepqxuYMt39W4srv1tYrRrDqEn58AeXYB91/f2Q==
X-Received: by 2002:a92:ad0d:: with SMTP id w13mr258201ilh.168.1628798906170; 
 Thu, 12 Aug 2021 13:08:26 -0700 (PDT)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com.
 [209.85.166.174])
 by smtp.gmail.com with ESMTPSA id e1sm2077815ils.76.2021.08.12.13.08.24
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Aug 2021 13:08:25 -0700 (PDT)
Received: by mail-il1-f174.google.com with SMTP id y3so8355227ilm.6
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Aug 2021 13:08:24 -0700 (PDT)
X-Received: by 2002:a05:6e02:d49:: with SMTP id
 h9mr223667ilj.229.1628798904325; 
 Thu, 12 Aug 2021 13:08:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210811235253.924867-1-robdclark@gmail.com>
 <20210811235253.924867-5-robdclark@gmail.com>
 <YRV10ew/Lr8GPzEv@pendragon.ideasonboard.com>
In-Reply-To: <YRV10ew/Lr8GPzEv@pendragon.ideasonboard.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 12 Aug 2021 13:08:11 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xd9fizYdxfXYOkpJ_1fZcHp3-ROJ7k4iPg0g0RQ_+A3Q@mail.gmail.com>
Message-ID: <CAD=FV=Xd9fizYdxfXYOkpJ_1fZcHp3-ROJ7k4iPg0g0RQ_+A3Q@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/bridge: ti-sn65dsi86: Add NO_CONNECTOR support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Rob Clark <robdclark@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>, 
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@chromium.org>, 
 Andrzej Hajda <a.hajda@samsung.com>, Neil Armstrong <narmstrong@baylibre.com>, 
 Robert Foss <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
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

Laurent,

On Thu, Aug 12, 2021 at 12:26 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Rob,
>
> Thank you for the patch.
>
> On Wed, Aug 11, 2021 at 04:52:50PM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Slightly awkward to fish out the display_info when we aren't creating
> > own connector.  But I don't see an obvious better way.
>
> We need a bit more than this, to support the NO_CONNECTOR case, the
> bridge has to implement a few extra operations, and set the bridge .ops
> field. I've submitted two patches to do so a while ago:
>
> - [RFC PATCH 08/11] drm/bridge: ti-sn65dsi86: Implement bridge connector operations ([1])

Rob asked me about this over IRC, so if he left it out and it's needed
then it's my fault. However, I don't believe it's needed until your
series making this bridge chip support full DP. For the the eDP case
the bridge chip driver in ToT no longer queries the EDID itself. It
simply provides an AUX bus to the panel driver and the panel driver
queries the EDID. I think that means we don't need to add
DRM_BRIDGE_OP_EDID, right?

I was also wondering if in the full DP case we should actually model
the physical DP jack as a drm_bridge and have it work the same way. It
would get probed via the DP AUX bus just like a panel. I seem to
remember Stephen Boyd was talking about modeling the DP connector as a
drm_bridge because it would allow us to handle the fact that some TCPC
chips could only support HBR2 whereas others could support HBR3. Maybe
it would end up being a fairly elegant solution?

> - [RFC PATCH 09/11] drm/bridge: ti-sn65dsi86: Make connector creation optional ([2])
>
> The second patch is similar to the first half of this patch, but misses
> the cleanup code. I'll try to rebase this and resubmit, but it may take
> a bit of time.

Whoops! You're right that Rob's patch won't work at all because we'll
just hit the "Fix bridge driver to make connector optional!" case. I
should have noticed that. :(

-Doug
