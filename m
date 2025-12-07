Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F368CAB53E
	for <lists+dri-devel@lfdr.de>; Sun, 07 Dec 2025 14:20:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8271910E02A;
	Sun,  7 Dec 2025 13:20:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=murena.io header.i=@murena.io header.b="LmoPTIxC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 336 seconds by postgrey-1.36 at gabe;
 Sun, 07 Dec 2025 13:18:03 UTC
Received: from mail3.ecloud.global (mail3.ecloud.global [135.181.139.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72B7310E02E
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Dec 2025 13:18:03 +0000 (UTC)
Received: from authenticated-user (mail3.ecloud.global [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail3.ecloud.global (Postfix) with ESMTPSA id 76EBC88A4F7;
 Sun,  7 Dec 2025 13:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=murena.io; s=mail3;
 t=1765113144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uNmttoZBb+AmmImllk7mg1Urvpz8Hb7rx7gqLHPpR3c=;
 b=LmoPTIxCDp2SYHWZutaQNq4xYe4r4ND2/Q1MdbEynCgwK8yfWdbVod3SSmnFBBFDEJJ6Iw
 pRE5dNemLjluJtqsl5GhB0W97/qlqAVkY/YiPvMstSZ1Hv8rcQX7ocfEH6aAnaMbJhpvld
 SY4WHO6Bm2pkE/nq6/WT+IRqfj203Uk=
ARC-Seal: i=1; s=mail3; d=murena.io; t=1765113144; a=rsa-sha256; cv=none;
 b=smGA9w9PFF+/gbSVgtGafCoAEgMO+wEtEf4DodTeTlq8qMsFwhYzF4IINaWz/rUPl7w9FV
 Dcp7Pz7lIAZEVrCEUqQf5ZwRzjDQqW2ZaKtQdUAS+yTvY9hmA50gyA4pRqXnX2GanhECSZ
 khbLX65DbR4CYPcqJCsjUjHNjgqCfgg=
ARC-Authentication-Results: i=1; mail3.ecloud.global;
 auth=pass smtp.mailfrom=maud_spierings@murena.io
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=murena.io;
 s=mail3; t=1765113144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uNmttoZBb+AmmImllk7mg1Urvpz8Hb7rx7gqLHPpR3c=;
 b=ENdafcUl/jjUwtIynTFMGLNY++AfxfEc276XitZomRdX8uEKreyNmdWN6+0XBgEbgLt/Fv
 4zCtMpJdXkQ3kSWexpNQUK32bchH1djarW7gjIpW/Ba3/dlV4S9B23Leh8fhVndpmEjdf1
 H0aDbdplojg98A3gNMRFJwCcxy14r8g=
Content-Type: multipart/alternative;
 boundary="------------MeTBar4zmMe2b5ajsXOQ424X"
Message-ID: <3358709d-c8e4-4e91-9121-5c6ddd9501c1@murena.io>
Date: Sun, 7 Dec 2025 14:12:22 +0100
MIME-Version: 1.0
To: cristian.ciocaltea@collabora.com
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
 andrzej.hajda@intel.com, andy.yan@rock-chips.com,
 dri-devel@lists.freedesktop.org, heiko@sntech.de, hjc@rock-chips.com,
 jernej.skrabec@gmail.com, jonas@kwiboo.se, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, neil.armstrong@linaro.org, rfoss@kernel.org,
 simona@ffwll.ch, tzimmermann@suse.de
References: <20251203-dw-hdmi-qp-scramb-v1-0-836fe7401a69@collabora.com>
Subject: Re: [PATCH 0/4] Add HDMI 2.0 support to DW HDMI QP TX
Content-Language: en-US
From: Maud Spierings <maud_spierings@murena.io>
In-Reply-To: <20251203-dw-hdmi-qp-scramb-v1-0-836fe7401a69@collabora.com>
X-Mailman-Approved-At: Sun, 07 Dec 2025 13:20:30 +0000
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

This is a multi-part message in MIME format.
--------------MeTBar4zmMe2b5ajsXOQ424X
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Awesome work! I've been waiting for this feature!

I can now actually get 1440p100 on my display and 4k60 on my tv over HDMI.

Tested-by: Maud Spierings <maud_spierings@hotmail.com>

Kind regard,
Maud

> This patch series provides the missing support for high TMDS clock ratio
> and scrambling to DW HDMI QP TX library, required for handling HDMI 2.0
> display modes on RK3576 & RK3588 SoCs.
>
> In order to allow addressing the SCDC status lost on sink disconnects,
> it adds an atomic variant of the drm_bridge_funcs.detect callback and a
> new drm_bridge_detect_ctx() helper, which is further used in
> drm_bridge_connector to switch to ->detect_ctx hook.
>
> Furthermore, optimize HPD event handling in dw_hdmi_qp Rockchip platform
> driver to run the detect cycle on the affected connector only.
>
> Signed-off-by: Cristian Ciocaltea<cristian.ciocaltea@collabora.com>
> ---
> Cristian Ciocaltea (4):
>        drm/bridge: Add ->detect_ctx hook and drm_bridge_detect_ctx()
>        drm/bridge-connector: Switch to using ->detect_ctx hook
>        drm/bridge: dw-hdmi-qp: Add high TMDS clock ratio and scrambling support
>        drm/rockchip: dw_hdmi_qp: Do not send HPD events for all connectors
>
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c   | 174 +++++++++++++++++++++++--
>   drivers/gpu/drm/display/drm_bridge_connector.c |  73 ++++++-----
>   drivers/gpu/drm/drm_bridge.c                   |  58 +++++++++
>   drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c |  44 +++----
>   include/drm/drm_bridge.h                       |  30 +++++
>   5 files changed, 308 insertions(+), 71 deletions(-)
> ---
> base-commit: ac5b392a8c355001c4c3f230a0e4b1f904e359ca
> change-id: 20251203-dw-hdmi-qp-scramb-cdbd8b57ccf9

--------------MeTBar4zmMe2b5ajsXOQ424X
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Awesome work! I've been waiting for this feature!<br>
      <br>
      I can now actually get 1440p100 on my display and 4k60 on my tv
      over HDMI.<br>
      <br>
      Tested-by: Maud Spierings <a class="moz-txt-link-rfc2396E" href="mailto:maud_spierings@hotmail.com">&lt;maud_spierings@hotmail.com&gt;</a></p>
    <p>Kind regard,<br>
      Maud
      <blockquote type="cite">
        <pre id="b">This patch series provides the missing support for high TMDS clock ratio
and scrambling to DW HDMI QP TX library, required for handling HDMI 2.0
display modes on RK3576 &amp; RK3588 SoCs.

In order to allow addressing the SCDC status lost on sink disconnects,
it adds an atomic variant of the drm_bridge_funcs.detect callback and a
new drm_bridge_detect_ctx() helper, which is further used in
drm_bridge_connector to switch to -&gt;detect_ctx hook.

Furthermore, optimize HPD event handling in dw_hdmi_qp Rockchip platform
driver to run the detect cycle on the affected connector only.

Signed-off-by: Cristian Ciocaltea <a class="moz-txt-link-rfc2396E" href="mailto:cristian.ciocaltea@collabora.com">&lt;cristian.ciocaltea@collabora.com&gt;</a>
---
Cristian Ciocaltea (4):
      drm/bridge: Add -&gt;detect_ctx hook and drm_bridge_detect_ctx()
      drm/bridge-connector: Switch to using -&gt;detect_ctx hook
      drm/bridge: dw-hdmi-qp: Add high TMDS clock ratio and scrambling support
      drm/rockchip: dw_hdmi_qp: Do not send HPD events for all connectors

 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c   | 174 +++++++++++++++++++++++--
 drivers/gpu/drm/display/drm_bridge_connector.c |  73 ++++++-----
 drivers/gpu/drm/drm_bridge.c                   |  58 +++++++++
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c |  44 +++----
 include/drm/drm_bridge.h                       |  30 +++++
 5 files changed, 308 insertions(+), 71 deletions(-)
---
base-commit: ac5b392a8c355001c4c3f230a0e4b1f904e359ca
change-id: 20251203-dw-hdmi-qp-scramb-cdbd8b57ccf9</pre>
      </blockquote>
      <br>
    </p>
  </body>
</html>

--------------MeTBar4zmMe2b5ajsXOQ424X--
