Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E75C84D3286
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 17:04:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 984DB10E2EC;
	Wed,  9 Mar 2022 16:04:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1876710E2EC
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 16:04:24 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id hw13so5780380ejc.9
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Mar 2022 08:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fZqCvAf0xgF95WkOEHDGm/vV6tt9EczTXGvjsdd1WwE=;
 b=OrxNHdDIFcqZV/a5MLxU2Ga+L+3AhRk/xIdWG4X6CSM8T9JSvLsWCzqG2gdhBVtm+w
 I2R5dYX3JEgvMByVLyxwG5LU9G7iMJGA2/St5e+WlHM3UHASFMB+Be4NEXN3uJRfKZt4
 fqSO0EYAd4ll6cQJ3PUK1BZcENVS1MwedBTio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fZqCvAf0xgF95WkOEHDGm/vV6tt9EczTXGvjsdd1WwE=;
 b=TgBjiun2Gly/vI2UFRGZO4QcvUxG3IXBOeJPqx+jI+zfkJRn2G0ghAH8abWJ2TxbV9
 vwB3x40s2ER0N1aKourBfvD+t4gsliVE+CH9k4cB0bAFSTMcL1mj7uoUtWgkrmtu0hH7
 oWmGXpkF80Y8I/BP6iZysimT1YZGyH3zDRhVU7jGKYF8EHxXurosg6Gy+s+9a8mMO8Ao
 Bgyil+7feJjAJbDzHyzWI0K8a1FGfAq05IJOR23ByNpMFAWYdZtaLEa/wcYCB+oPOrHn
 nZ1OLrAuR5r1euTWBExw2WRQrdH4TLRPmdnhUVDS7dmQzOxvLIUlsprruBk97JPXGUtc
 Qf8Q==
X-Gm-Message-State: AOAM531/9hqK0bwYiCm9aEOjx/dAJVNYRfXB8jmJurqmSEXnAN/erblG
 zAeVPl5D2R6j5VtxKEGkRbHwHmCahROyWOU1
X-Google-Smtp-Source: ABdhPJzQ0qDy2V7ik5dsm3tvLX1t+tjHuWuZaRu6Bm7H7t4uRApj78DXEfw17toc+JyeBCyywvMxZg==
X-Received: by 2002:a17:907:6ea1:b0:6d6:f910:5141 with SMTP id
 sh33-20020a1709076ea100b006d6f9105141mr405917ejc.123.1646841855271; 
 Wed, 09 Mar 2022 08:04:15 -0800 (PST)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com.
 [209.85.128.42]) by smtp.gmail.com with ESMTPSA id
 20-20020a17090601d400b006caff964e30sm906906ejj.19.2022.03.09.08.04.14
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 08:04:14 -0800 (PST)
Received: by mail-wm1-f42.google.com with SMTP id
 q7-20020a7bce87000000b00382255f4ca9so3726705wmj.2
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Mar 2022 08:04:14 -0800 (PST)
X-Received: by 2002:a1c:7518:0:b0:37c:7eb:f255 with SMTP id
 o24-20020a1c7518000000b0037c07ebf255mr8067411wmc.29.1646841853982; Wed, 09
 Mar 2022 08:04:13 -0800 (PST)
MIME-Version: 1.0
References: <20220301181107.v4.1.I773a08785666ebb236917b0c8e6c05e3de471e75@changeid>
 <20220301181107.v4.2.I48b18ab197c9b649d376cf8cfd934e59d338f86d@changeid>
 <CAD=FV=X6jf-UbCzB23MjBWwfs0HcHuoE9ozd3FZxN1U-H_8Saw@mail.gmail.com>
In-Reply-To: <CAD=FV=X6jf-UbCzB23MjBWwfs0HcHuoE9ozd3FZxN1U-H_8Saw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 9 Mar 2022 08:04:01 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V+HNSihpg+nMS52w9VWhfkbv+HR4F-XfS+GZ8JdSJBJw@mail.gmail.com>
Message-ID: <CAD=FV=V+HNSihpg+nMS52w9VWhfkbv+HR4F-XfS+GZ8JdSJBJw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] drm/bridge: analogix_dp: Enable autosuspend
To: Brian Norris <briannorris@chromium.org>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, Neil Armstrong <narmstrong@baylibre.com>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sean Paul <sean@poorly.run>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Mar 3, 2022 at 3:02 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Tue, Mar 1, 2022 at 6:11 PM Brian Norris <briannorris@chromium.org> wrote:
> >
> > DP AUX transactions can consist of many short operations. There's no
> > need to power things up/down in short intervals.
> >
> > I pick an arbitrary 100ms; for the systems I'm testing (Rockchip
> > RK3399), runtime-PM transitions only take a few microseconds.
> >
> > Signed-off-by: Brian Norris <briannorris@chromium.org>
> > ---
> >
> > Changes in v4:
> >  - call pm_runtime_mark_last_busy() and
> >    pm_runtime_dont_use_autosuspend()
> >  - drop excess pm references around drm_get_edid(), now that we grab and
> >    hold in the dp-aux helper
> >
> > Changes in v3:
> >  - New in v3
> >
> >  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
>
> This looks great to me now, thanks.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> Though I'm not a massive expert on the Analogix DP driver, I'm pretty
> confident about the DP AUX stuff that Brian is touching. I just
> checked and I see that this driver isn't changing lots and the last
> change landed in drm-misc, which means that I can commit this. Thus,
> unless someone else shouts, I'll plan to wait until next week and
> commit these two patches to drm-misc.
>
> The first of the two patches is a "Fix" but since it's been broken
> since 2016 I'll assume that nobody is chomping at the bit for these to
> get into stable and that it would be easier to land both in
> "drm-misc-next". Please yell if someone disagrees.

Pushed both to drm-misc-next:

f28dd5075675 drm/bridge: analogix_dp: Enable autosuspend
8fb6c44fe846 drm/bridge: analogix_dp: Grab runtime PM reference for DP-AUX

-Doug
