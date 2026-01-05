Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A000CF52BF
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 19:09:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12F7410E3E2;
	Mon,  5 Jan 2026 18:09:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="kMajOfcd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 336 seconds by postgrey-1.36 at gabe;
 Mon, 05 Jan 2026 18:09:33 UTC
Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com
 [95.215.58.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5997910E3E2
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 18:09:33 +0000 (UTC)
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
 s=key1; t=1767636235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cAA+oxavMgc4zkXOGFmiSvR8+PD1TtQP41ZqvlXUThs=;
 b=kMajOfcdtk45xWH0kGb3b41xCo1bO+xiDbACL0VyqrPG3w9btouiEBdZv+LwWEoIP7MJ8B
 USaCShheXrvb1lw/XI10J/HOyAnqobbaXhuxDOXAnuuUeAcKVeggBwiSxEICCQNPb8tpEB
 MaRwhBriswMcj17ycDs2ygwaOe4tlBRKJAm9VwhcKS6XhawGN33GGWsHUMhgJP26wCM6SF
 Mh717+XFhjTJ5JctfLAGzs3VQRutSF6GwyfYMJrKM+Ns1JPRf4hjYa0PYNncc4881I/BP+
 TtmkYBi+dp6ojwdq/YSbEKTNOR6am64xFn7uTFDk49IRSjkyC4fP8C8uZ8e1zQ==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 05 Jan 2026 19:03:32 +0100
Message-Id: <DFGUQPIJWYDR.2LEI3CON9X7GJ@cknow-tech.com>
Cc: <kernel@collabora.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>
Subject: Re: [PATCH 0/4] Add HDMI 2.0 support to DW HDMI QP TX
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Sandy Huang"
 <hjc@rock-chips.com>, =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 "Andy Yan" <andy.yan@rock-chips.com>
References: <20251203-dw-hdmi-qp-scramb-v1-0-836fe7401a69@collabora.com>
In-Reply-To: <20251203-dw-hdmi-qp-scramb-v1-0-836fe7401a69@collabora.com>
X-Migadu-Flow: FLOW_OUT
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

On Wed Dec 3, 2025 at 7:27 PM CET, Cristian Ciocaltea wrote:
> This patch series provides the missing support for high TMDS clock ratio
> and scrambling to DW HDMI QP TX library, required for handling HDMI 2.0
> display modes on RK3576 & RK3588 SoCs.

I tested this patch set with my 4K TV and Rock 5B and without it I did
not see 4K@60, only 4K@30. With this patch set also a number of 4K
related display settings appeared which were not there without it.
So thanks a lot for this patch set. Feel free to add:

Tested-by: Diederik de Haas <diederik@cknow-tech.com>

Cheers,
  Diederik

> In order to allow addressing the SCDC status lost on sink disconnects,
> it adds an atomic variant of the drm_bridge_funcs.detect callback and a
> new drm_bridge_detect_ctx() helper, which is further used in
> drm_bridge_connector to switch to ->detect_ctx hook.
>
> Furthermore, optimize HPD event handling in dw_hdmi_qp Rockchip platform
> driver to run the detect cycle on the affected connector only.
>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
> Cristian Ciocaltea (4):
>       drm/bridge: Add ->detect_ctx hook and drm_bridge_detect_ctx()
>       drm/bridge-connector: Switch to using ->detect_ctx hook
>       drm/bridge: dw-hdmi-qp: Add high TMDS clock ratio and scrambling su=
pport
>       drm/rockchip: dw_hdmi_qp: Do not send HPD events for all connectors
>
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c   | 174 +++++++++++++++++++=
++++--
>  drivers/gpu/drm/display/drm_bridge_connector.c |  73 ++++++-----
>  drivers/gpu/drm/drm_bridge.c                   |  58 +++++++++
>  drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c |  44 +++----
>  include/drm/drm_bridge.h                       |  30 +++++
>  5 files changed, 308 insertions(+), 71 deletions(-)
> ---
> base-commit: ac5b392a8c355001c4c3f230a0e4b1f904e359ca
> change-id: 20251203-dw-hdmi-qp-scramb-cdbd8b57ccf9
>
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

