Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9AB5F6990
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 16:26:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EC1710E827;
	Thu,  6 Oct 2022 14:25:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A39610E087
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Oct 2022 14:25:54 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id qw20so4317928ejc.8
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Oct 2022 07:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1lyE1S0BBlUdzGxqVV9j+DAQ7jyYRX7ZKVQ+CxZBHQM=;
 b=H1aE+fuMpx8vvECH4iJqUWbd5cwXYcTlng+uU/xKMBp5l0Yuwj1/MIF2QLWL1fMpMq
 neQx9LQxZdx4YqG22as2RKxSq+mlxKs3jFgReqvMJFZcP3cNdNfyBshy441dKIwEJQIe
 gg813NiYzs44cvTLAqLmVrKzXH1S8rQbzaTgI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1lyE1S0BBlUdzGxqVV9j+DAQ7jyYRX7ZKVQ+CxZBHQM=;
 b=5VR2Q6dG0H+xt5wqwIhYRTp+6EU8kXuTE13K3CsZJQwJXr8J4c+kHWr9pEAPTmILj1
 4f5Y1PhjGTFuXCN0kpkniTO/ptaBmVUzLbLUJP2zOj5A54VrV9UN5CqDsuyCk4pGmmGu
 4gkduBU0YOIIFUSEPsRjyHjKXuGbwvdJ3F5w++1qrPM340t//4mjmEukwjdab+96bYvI
 CBJVyYtZRdk9OoDd5i6s/Zl/oQTIU9whaYRFto0D4Bl0b6T/5vjNsJ1E6+ICitq1DbbW
 z+/sFxZi5fNK+Fvq5Ic2X6HCC1fu0DbKkucSvqVWFvAvyTaHSPs5ahbtlePPI0p2Nk5K
 8LkA==
X-Gm-Message-State: ACrzQf0StSNommAqB8kYe1L6q+eoqUeiuJf+odq2yN0SEnEv3tBxmq+a
 vM8t6U9bJ497GOjIcoROv78I4jW8z7sdg1+V+uVbo2+mSUc3/w==
X-Google-Smtp-Source: AMsMyM4IZZ02B8hwmv9JWWGZJIwI+5J7uZ0vzVp7TTRB0gsLKnaUzUtdTLCprJSd4evbmGgaIVGIX1rDhccDx+Br3AU=
X-Received: by 2002:a17:907:97d2:b0:787:a9ee:8ced with SMTP id
 js18-20020a17090797d200b00787a9ee8cedmr65625ejc.335.1665066352898; Thu, 06
 Oct 2022 07:25:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1646406653.git.dave.stevenson@raspberrypi.com>
 <a593a187fe3e6fc1ca5bf3db001ed87457e3d4ee.1646406653.git.dave.stevenson@raspberrypi.com>
In-Reply-To: <a593a187fe3e6fc1ca5bf3db001ed87457e3d4ee.1646406653.git.dave.stevenson@raspberrypi.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 6 Oct 2022 19:55:42 +0530
Message-ID: <CAMty3ZAGX-tJyQCOrE3SYAD6EiGSexGfU1-Q3Ow294XOpxnY4w@mail.gmail.com>
Subject: Re: [PATCH V2 3/4] drm/panel: Add prepare_upstream_first flag to
 drm_panel
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
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
Cc: Marek Vasut <marex@denx.de>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 andrzej.hajda@gmail.com, Andrzej Hajda <andrzej.hajda@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 4, 2022 at 8:48 PM Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Mapping to the drm_bridge flag pre_enable_upstream_first,
> add a new flag prepare_upstream_first to drm_panel to allow
> the panel driver to request that the upstream bridge should
> be pre_enabled before the panel prepare.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/gpu/drm/bridge/panel.c |  3 +++
>  include/drm/drm_panel.h        | 10 ++++++++++
>  2 files changed, 13 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> index 5be057575183..2ea08b3ba326 100644
> --- a/drivers/gpu/drm/bridge/panel.c
> +++ b/drivers/gpu/drm/bridge/panel.c
> @@ -234,6 +234,9 @@ struct drm_bridge *drm_panel_bridge_add_typed(struct drm_panel *panel,
>         panel_bridge->bridge.ops = DRM_BRIDGE_OP_MODES;
>         panel_bridge->bridge.type = connector_type;
>
> +       panel_bridge->bridge.pre_enable_upstream_first =
> +                                               panel->prepare_upstream_first;
> +

panel_bridge is common for bridge users who used panel and those who
might not need upstream first, so better to handle per bridge user
whoever needs this.

Thanks,
Jagan.
