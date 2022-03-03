Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D524CC9AC
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 00:02:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4185B10E342;
	Thu,  3 Mar 2022 23:02:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79CC810E342
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 23:02:34 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id s1so8505230edd.13
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Mar 2022 15:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QYz72xS4UEUEZyA/zmJjeRPqsPKoO6eSb+1q4FNlVR8=;
 b=l6FIj3aats2SLjz57UHUFzeX+1E7k3S4Dlpstfnlv80RVlxrN8PxjndVH7iYewpCSq
 Xyhxd+QRKRv3vVvSZb2z4KiSw3xMy1qgAriSSd2zu2wTAj9I5snO+A0DBK9Sv3Cr4A7n
 f39aaXyoc2P3YxjLzmAQQ0cYuuX07Cz/93Qug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QYz72xS4UEUEZyA/zmJjeRPqsPKoO6eSb+1q4FNlVR8=;
 b=oVvc0bwFq/TZSWMV6JeSUChtEKX1/JAOn0aPYxmk0WKponftq0Aup8cV+gOkctee0Z
 E7DZg9Rm9aN0FRWF02n45LnDnzz+eVLN2aXYlkNREbV0gvPMkzOjZyjtb16OlsHSL+nK
 PkEtRIVfGGRCui5IJCd2eucWXV9bbifs1LLz76nPbAjPgjTJGt0r/fR9zd7FLnt+bQgx
 UlesTLeWK1zJzFr9T2T2xb9dHMVSWXVik9f5bKsg99N7Cf+IavQzw0T06GmHUvYQGe7E
 qkiwt9QAGHerf4QSN5y9L2jYbxa+vEO+Kyk8UizimvyL94hDLcApJ803ziSZtyhAXVkm
 DnOw==
X-Gm-Message-State: AOAM533v4+FsUz33xdtoCk0zp82AMyuzcMyMUJevYJQEBIwyuaKo83GK
 d8jbELDu0yrCfhXE8jcGkcG6e8b9x9rf7w==
X-Google-Smtp-Source: ABdhPJxlT9C/aBSzl5eM7PQLGhp7YomLnBg0d9+pkeHXxGpVFa26qr5QUhAxLFKJdk5qQnnxf+FITA==
X-Received: by 2002:a05:6402:369c:b0:413:2bc0:3f00 with SMTP id
 ej28-20020a056402369c00b004132bc03f00mr36446785edb.126.1646348552667; 
 Thu, 03 Mar 2022 15:02:32 -0800 (PST)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com.
 [209.85.221.44]) by smtp.gmail.com with ESMTPSA id
 h30-20020a056402095e00b00412b81dd96esm1339830edz.29.2022.03.03.15.02.31
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Mar 2022 15:02:32 -0800 (PST)
Received: by mail-wr1-f44.google.com with SMTP id ay10so10037018wrb.6
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Mar 2022 15:02:31 -0800 (PST)
X-Received: by 2002:a5d:64ed:0:b0:1f0:6672:f10c with SMTP id
 g13-20020a5d64ed000000b001f06672f10cmr1270642wri.679.1646348551347; Thu, 03
 Mar 2022 15:02:31 -0800 (PST)
MIME-Version: 1.0
References: <20220301181107.v4.1.I773a08785666ebb236917b0c8e6c05e3de471e75@changeid>
 <20220301181107.v4.2.I48b18ab197c9b649d376cf8cfd934e59d338f86d@changeid>
In-Reply-To: <20220301181107.v4.2.I48b18ab197c9b649d376cf8cfd934e59d338f86d@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 3 Mar 2022 15:02:18 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X6jf-UbCzB23MjBWwfs0HcHuoE9ozd3FZxN1U-H_8Saw@mail.gmail.com>
Message-ID: <CAD=FV=X6jf-UbCzB23MjBWwfs0HcHuoE9ozd3FZxN1U-H_8Saw@mail.gmail.com>
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

On Tue, Mar 1, 2022 at 6:11 PM Brian Norris <briannorris@chromium.org> wrote:
>
> DP AUX transactions can consist of many short operations. There's no
> need to power things up/down in short intervals.
>
> I pick an arbitrary 100ms; for the systems I'm testing (Rockchip
> RK3399), runtime-PM transitions only take a few microseconds.
>
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
>
> Changes in v4:
>  - call pm_runtime_mark_last_busy() and
>    pm_runtime_dont_use_autosuspend()
>  - drop excess pm references around drm_get_edid(), now that we grab and
>    hold in the dp-aux helper
>
> Changes in v3:
>  - New in v3
>
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)

This looks great to me now, thanks.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Though I'm not a massive expert on the Analogix DP driver, I'm pretty
confident about the DP AUX stuff that Brian is touching. I just
checked and I see that this driver isn't changing lots and the last
change landed in drm-misc, which means that I can commit this. Thus,
unless someone else shouts, I'll plan to wait until next week and
commit these two patches to drm-misc.

The first of the two patches is a "Fix" but since it's been broken
since 2016 I'll assume that nobody is chomping at the bit for these to
get into stable and that it would be easier to land both in
"drm-misc-next". Please yell if someone disagrees.

-Doug
