Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C643D1597A
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 23:40:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC50810E2BB;
	Mon, 12 Jan 2026 22:40:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Sd439CFm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2670E10E43B
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 22:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1768257647;
 bh=36qLqTSDEnjJClGk7t0KNXMJeK/xpEkNJs2C1xB0rkQ=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=Sd439CFmcd/A+4IKZDBrmZby+gwWEWv71fOHlhPZG6pLWjdY8WSGBmXZ0IzGOgTBf
 dfD9iJBdpB5x3IhAx+QD3YflxcRkvACP+kwFzStbPD6zN7CLpecZwijbQDaw5eL2rT
 LyiKW62IKPCDG/N6+HgwihPc1XXQdOtzw1VdoLzqayp+Jkkv2QATnM56FRDn/xcZBS
 yfJVWAygvVbC19rITn8mwK1+7XU80CFOZwHIJHrHDiB50gy3opZ+IZipXWKJ143NNz
 CGe+VrZvG9FVgzTntJCvEv2vAB2VOr0kGOb0n/apKoo0nXGNb921j4XyWboh+xHRg9
 GD74FBHo2o64Q==
Received: from [192.168.1.90] (unknown [82.79.138.145])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id C146F17E0A49;
 Mon, 12 Jan 2026 23:40:46 +0100 (CET)
Message-ID: <0b28ae6d-295d-4958-9571-190fedd95efe@collabora.com>
Date: Tue, 13 Jan 2026 00:40:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Add HDMI 2.0 support to DW HDMI QP TX
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Chris Morgan <macromorgan@hotmail.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 Diederik de Haas <diederik@cknow-tech.com>,
 Maud Spierings <maud_spierings@hotmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>
References: <20260113-dw-hdmi-qp-scramb-v2-0-ae7b2c58d24d@collabora.com>
Content-Language: en-US
In-Reply-To: <20260113-dw-hdmi-qp-scramb-v2-0-ae7b2c58d24d@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 1/13/26 12:26 AM, Cristian Ciocaltea wrote:
> This patch series provides the missing support for high TMDS clock ratio
> and scrambling to DW HDMI QP TX library, required for handling HDMI 2.0
> display modes on RK3576 & RK3588 SoCs.
> 
> In order to allow addressing the SCDC status lost on sink disconnects,
> it adds an atomic variant of the drm_bridge_funcs.detect callback and a
> new drm_bridge_detect_ctx() helper, which is further used in
> drm_bridge_connector to switch to ->detect_ctx hook.
> 
> Furthermore, it optimizes HPD event handling in dw_hdmi_qp Rockchip
> platform driver to run the detect cycle on the affected connector only.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
> Changes in v2:
> - Collected Tested-by tags from Diederik and Maud
> - Rebased onto latest drm-misc-next
> - Ensured the recently introduced 'no-hpd' support for dealing with
>   unconnected/repurposed/broken HPD pin is limited to HDMI 1.4 rates

Chris, could you please confirm no-hpd is still functional with this series on
your Gameforce Ace board when testing with a HDMI 2.0 display?

Thanks,
Cristian

