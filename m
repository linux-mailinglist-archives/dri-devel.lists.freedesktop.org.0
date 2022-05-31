Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3622539864
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 23:04:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D31C10E028;
	Tue, 31 May 2022 21:04:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F040E10E028
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 21:04:13 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id z7so8344262edm.13
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 14:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KHYrrg1OiYZowD6aPazdTTV7Ju3sH7vUcubOYj24fu4=;
 b=UtRwpwucfDR8gD3L7SaGmezgIA5eG73xQodHXxNq0JxfaLvad7Zzy+Lt8+nRFoDSEz
 cDnX8R6alvDMA8xggJQdl89Yyl40Pi+iiv/q9jVII2cMZt/1qu/TD1lCliPIdELSeYqP
 7hpayhSqZL9lkCIf9aX7v909SxUuQrV+NkdbU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KHYrrg1OiYZowD6aPazdTTV7Ju3sH7vUcubOYj24fu4=;
 b=KICK8lvKQnBXujWoKbnxll48X8959BNDqNBO9uoFkUF8cU0O2p8N37lKCvYBAISBMz
 diCSDw9NGR+GnMS2E7qwUYcDLY9UDiSyqvH+0HWIcnNk3cZLfkD49pxk+Ivq5EzxcEwP
 gio9Tnlvn9K5BerufLw86366AQdqYBg1IIyCShIMYzqk/+Wgo133ID9BzzvwtTjWBY4+
 ub2ayxyEhZLa+kf4a0fyjeFENVz0+ZaAZg92wwNTXXAwZpgIxpqbPx33uP+GMlLwx98a
 rBTwl6vNlpoCtbLSYkcKgg9/4iVRWDeMlgTFjdabVM634ZJtx9EDT68vP0TNklpLFNGl
 d2OA==
X-Gm-Message-State: AOAM532Fiq8kPW8SA0Gp0rj/uVO+59w0KhGbH3S51gg21HamolRZw1FK
 R8ikNm9F1kLDPm3vOJJh9++a6uDLFJlLOz08
X-Google-Smtp-Source: ABdhPJyIT9Y/x0id6n9oKmokYtCBJunvAgFYKn0voVki3hMcvUUrSV+mF/DN3W8Xi5GulmPqGc47ug==
X-Received: by 2002:a05:6402:84c:b0:428:4cc4:8212 with SMTP id
 b12-20020a056402084c00b004284cc48212mr7969411edz.171.1654031052114; 
 Tue, 31 May 2022 14:04:12 -0700 (PDT)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com.
 [209.85.128.41]) by smtp.gmail.com with ESMTPSA id
 y10-20020a50bb0a000000b00428bb4c952bsm9111753ede.31.2022.05.31.14.04.09
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 May 2022 14:04:10 -0700 (PDT)
Received: by mail-wm1-f41.google.com with SMTP id
 m32-20020a05600c3b2000b0039756bb41f2so1980wms.3
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 14:04:09 -0700 (PDT)
X-Received: by 2002:a05:600c:acf:b0:397:345f:fe10 with SMTP id
 c15-20020a05600c0acf00b00397345ffe10mr25847322wmr.15.1654031047944; Tue, 31
 May 2022 14:04:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220510192944.2408515-1-dianders@chromium.org>
In-Reply-To: <20220510192944.2408515-1-dianders@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 31 May 2022 14:03:56 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W-gW_TMKKJA-5bCETp+KB4sAUDnMuGJMMTwAixb7Ho6w@mail.gmail.com>
Message-ID: <CAD=FV=W-gW_TMKKJA-5bCETp+KB4sAUDnMuGJMMTwAixb7Ho6w@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] drm/dp: Make DP AUX bus usage easier;
 use it on ps8640
To: dri-devel <dri-devel@lists.freedesktop.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Stephen Boyd <swboyd@chromium.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Philip Chen <philipchen@chromium.org>,
 LKML <linux-kernel@vger.kernel.org>, Robert Foss <robert.foss@linaro.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, May 10, 2022 at 12:30 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> This patch is v3 of the first 2 patches from my RFC series ("drm/dp: Improvements
> for DP AUX channel") [1]. I've broken the series in two so we can make
> progress on the two halves separately.
>
> v2 of this series tries to incorporate all the feedback from v1. Hopefully
> things are less confusing and simpler this time around. The one thing that got
> slightly more confusing is that the done_probing() callback can't return
> -EPROBE_DEFER in most cases so we have to adjust drivers a little more.
>
> v3 takes Dmitry's advice on v2. This now introduces
> devm_drm_bridge_add() (in an extra patch), splits some fixups into
> their own patch, uses a new name for functions, and requires an
> explicit call to done_probing if you have no children.
>
> The idea for this series came up during the review process of
> Sankeerth's series trying to add eDP for Qualcomm SoCs [2].
>
> This _doesn't_ attempt to fix the Analogix driver. If this works out,
> ideally someone can post a patch up to do that.
>
> NOTE: I don't have any ps8640 devices that _don't_ use the aux panel
> underneath them, so I'm relying on code inspection to make sure I
> didn't break those. If someone sees that I did something wrong for
> that case then please yell!
>
> [1] https://lore.kernel.org/r/20220409023628.2104952-1-dianders@chromium.org/
> [2] https://lore.kernel.org/r/1648656179-10347-2-git-send-email-quic_sbillaka@quicinc.com/
>
> Changes in v3:
> - Adapt to v3 changes in aux bus.
> - Don't call done_probing() if there are no children; return -ENODEV.
> - Patch ("drm/bridge: Add devm_drm_bridge_add()") new for v3.
> - Patch ("drm/dp: Export symbol / kerneldoc fixes...") split for v3.
> - Split out EXPORT_SYMBOL and kerneldoc fixes to its own patch.
> - Use devm_drm_bridge_add() to simplify.
> - Used Dmitry's proposed name: of_dp_aux_populate_bus()
>
> Changes in v2:
> - Change to assume exactly one device.
> - Have a probe callback instead of an extra sub device.
> - Rewrote atop new method introduced by patch #1.
>
> Douglas Anderson (4):
>   drm/dp: Export symbol / kerneldoc fixes for DP AUX bus
>   drm/dp: Add callbacks to make using DP AUX bus properly easier
>   drm/bridge: Add devm_drm_bridge_add()
>   drm/bridge: parade-ps8640: Handle DP AUX more properly
>
>  drivers/gpu/drm/bridge/parade-ps8640.c   |  74 +++++---
>  drivers/gpu/drm/display/drm_dp_aux_bus.c | 211 +++++++++++++++--------
>  drivers/gpu/drm/drm_bridge.c             |  23 +++
>  include/drm/display/drm_dp_aux_bus.h     |  34 +++-
>  include/drm/drm_bridge.h                 |   1 +
>  5 files changed, 238 insertions(+), 105 deletions(-)

I'm hoping to get some review for this series. Anyone? Dmitry: I know
you looked at earlier versions of this series. I guess you're happy
enough with it now but don't feel enough ownership to give a full
Reviewed-by?

-Doug
