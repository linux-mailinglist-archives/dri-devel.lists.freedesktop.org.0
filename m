Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1D6454B60
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 17:50:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F65A6E0AC;
	Wed, 17 Nov 2021 16:50:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70C046E0AC
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 16:49:58 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id x10so4037122ioj.9
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 08:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=81zghY8ilRWKTudyGP6JsOkrppbpNH0CaOi9j8PUljw=;
 b=oLkzkYBuHoPUuoqD3iFsTInCMvKmSNBQa6shdWUG+EiqyJjtKk3ZohZ2+6L7h4YxLy
 CoXyJfD+sriT5aNAHjkwBBTMqUvnp63+rFblrFZ1M0uoYKRx8EAiSMwcbMOEWYHo2alw
 zQcypyVDn8l2+FyM3FVFUYp7TRvhTTFkrkLR4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=81zghY8ilRWKTudyGP6JsOkrppbpNH0CaOi9j8PUljw=;
 b=mJVQKmojS07nSkFvonbCZRAbfbNben+rshTtg88FIZkmK6rzBe2+mZSYwrvNdI3vh5
 T7h5tkKoga/RdaNAu1gVLIlokAf97H8WYJ2m9n5MXzATGlDWnrc+tejsOEKmbR40gV0c
 JExrD7vMZsmEADYSU20bP/pjRTbeyjTqk5uZbgPnSew/LSicXzeXios4iS6FHi8i3m0a
 RseztGIUSoySu++pN1kB8qDHepqLoIbw8Tw0J06MJA4lVwIaa/n79uis4hhRzZ2hHCPW
 BaS1w6SmWUrjWsDa0gLY3YRR64xObSLiWUKoOmpl8NkJBLv32xG3jZFsIwHqShZSMqjc
 KP1A==
X-Gm-Message-State: AOAM533xS+uHWSaIUekMV2rVCU4LAsoNT4E4dnQfHOg2QjivwC3XAngN
 VCjSQtMhnTVGJznGo+0kmz2JVZ5zyL33Wg==
X-Google-Smtp-Source: ABdhPJzTul54XJqARF4za9vV3DvEwdkAVHKcrHzoSTzr2e6WNS5q6rsrL/B6gGSOdzgT4jIcF9bLFg==
X-Received: by 2002:a05:6638:3891:: with SMTP id
 b17mr14234508jav.100.1637167797184; 
 Wed, 17 Nov 2021 08:49:57 -0800 (PST)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com.
 [209.85.166.54])
 by smtp.gmail.com with ESMTPSA id o10sm194292ilc.56.2021.11.17.08.49.55
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 08:49:55 -0800 (PST)
Received: by mail-io1-f54.google.com with SMTP id x10so4036967ioj.9
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 08:49:55 -0800 (PST)
X-Received: by 2002:a05:6602:2d84:: with SMTP id
 k4mr12229047iow.168.1637167794919; 
 Wed, 17 Nov 2021 08:49:54 -0800 (PST)
MIME-Version: 1.0
References: <20211117163239.529781-1-kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <20211117163239.529781-1-kieran.bingham+renesas@ideasonboard.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 17 Nov 2021 08:49:43 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VM9H8Fow49V2eLs2Jfv6DmPYpDGNyHicc_802RksTZYQ@mail.gmail.com>
Message-ID: <CAD=FV=VM9H8Fow49V2eLs2Jfv6DmPYpDGNyHicc_802RksTZYQ@mail.gmail.com>
Subject: Re: [PATCH] gpu: drm: panel-edp: Fix edp_panel_entry documentation
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Nov 17, 2021 at 8:32 AM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
>
> The edp_panel_entry members 'delay' and 'name' are documented, but
> without the correct syntax for kernel doc.
>
> This generates the following warnings:
>
> drivers/gpu/drm/panel/panel-edp.c:204: warning: Function parameter or member 'delay' not described in 'edp_panel_entry'
> drivers/gpu/drm/panel/panel-edp.c:204: warning: Function parameter or member 'name' not described in 'edp_panel_entry'
>
> Fix them accordingly.
>
> Fixes: 5540cf8f3e8d ("drm/panel-edp: Implement generic "edp-panel"s probed by EDID")
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Thanks! Pushed to drm-misc-next (though technically it's a fix, it
didn't seem urgent enough to go through -fixes. Hopefully this is OK).

1e66f04c14ab gpu: drm: panel-edp: Fix edp_panel_entry documentation

-Doug
