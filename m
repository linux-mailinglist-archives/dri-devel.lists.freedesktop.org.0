Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAD953C0B0
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 00:18:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 271C589939;
	Thu,  2 Jun 2022 22:18:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F72488503
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 22:18:30 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id f21so12557823ejh.11
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 15:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XcPEK0q3mt1ouHTWeNMQyYJ2QS2WLPCsci1x61vNTCo=;
 b=WrJVHTcfJLoL6zkwaUyGcH/jZkhVT5MYScztQxaxeuqyAXvuQ1DqBnZJlHxOSQwPiE
 C9w6a7IuWkfQ8VQm04IOYyfBadLWtG1DrSjYfzagsmIPc/pUTODWRQvJXcuEwtVg/6/P
 k3tfDSbYDhw0Sv1e+nUPKxMFJoo5OxybVavpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XcPEK0q3mt1ouHTWeNMQyYJ2QS2WLPCsci1x61vNTCo=;
 b=fT7zym5sv9umdhHX2faWlNTpVcs4EAJIuGf+iYddzUmhhsLTXBexDIoDl5Z0+hShxt
 CJC3GXNPL3fc4xHkRmQpMcYDWeRnB8nPQjCBZwMKy5P3Pko4tPA2QiSFuy2AcfW4YvDP
 XTRTmhtzXUMHI6OejuVUswBt+tIdo7zb5pmDZVP762ZDbJB4hkkDBmYQotK6KeAsggMh
 e2MR7O0e/jigaec4HBvNszQ9UDt00jxfhSfvSYaGIzpEeyFG/8PxYi3PimhjgVkHkOUF
 4UIvsxB3huuWHJzeuR+ZOQdLAYAFej8QGNpk8+FMtYsKrBdCq8WtBgwXWuLYkyW/2giz
 bPmA==
X-Gm-Message-State: AOAM532yzN6njNlHuFYPZCcIzJ4H7aThrcxySRv3G65EYBRwAnefpqIl
 lOQME2eedUUwkOUPhQZUOxCO130e0cXb52XR
X-Google-Smtp-Source: ABdhPJxaBmUoRUNfPF8wfitTePMWX96MYNMyo4H40/CTvuLwMY4dEF4I4jsjzkRv0EdaIdNtHMs2Sg==
X-Received: by 2002:a17:907:1c25:b0:6fe:e07a:9d4d with SMTP id
 nc37-20020a1709071c2500b006fee07a9d4dmr5919569ejc.310.1654208308392; 
 Thu, 02 Jun 2022 15:18:28 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com.
 [209.85.221.46]) by smtp.gmail.com with ESMTPSA id
 bk2-20020a170906b0c200b006fef557bb7asm2126606ejb.80.2022.06.02.15.18.21
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jun 2022 15:18:24 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id s24so8124322wrb.10
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 15:18:21 -0700 (PDT)
X-Received: by 2002:a5d:68d2:0:b0:210:31cc:64a6 with SMTP id
 p18-20020a5d68d2000000b0021031cc64a6mr5200892wrw.679.1654208301046; Thu, 02
 Jun 2022 15:18:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220510192944.2408515-1-dianders@chromium.org>
In-Reply-To: <20220510192944.2408515-1-dianders@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 2 Jun 2022 15:18:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XK5KsR51YnSks8sHy+hzfm6xRqUa7mPkCpRO4XDTzYHg@mail.gmail.com>
Message-ID: <CAD=FV=XK5KsR51YnSks8sHy+hzfm6xRqUa7mPkCpRO4XDTzYHg@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] drm/dp: Make DP AUX bus usage easier;
 use it on ps8640
To: dri-devel <dri-devel@lists.freedesktop.org>
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
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
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

I'd previously pushed patch #1. Now I've pushed the rest of the
patches to drm-misc-next with Dmitry's review:

10e619f1f31c drm/bridge: parade-ps8640: Handle DP AUX more properly
50e156bd8a9d drm/bridge: Add devm_drm_bridge_add()
3800b1710946 drm/dp: Add callbacks to make using DP AUX bus properly easier

-Doug
