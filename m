Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0B4CAB56E
	for <lists+dri-devel@lfdr.de>; Sun, 07 Dec 2025 14:30:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16DD010E02E;
	Sun,  7 Dec 2025 13:30:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=murena.io header.i=@murena.io header.b="9PJS8J3K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail3.ecloud.global (mail3.ecloud.global [135.181.139.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D81410E02E
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Dec 2025 13:23:03 +0000 (UTC)
Received: from authenticated-user (mail3.ecloud.global [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail3.ecloud.global (Postfix) with ESMTPSA id A9C4888A4FD;
 Sun,  7 Dec 2025 13:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=murena.io; s=mail3;
 t=1765113393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d0IbB4IpT2dhEZpT6CaDcHvBq0pv4VvNOc552hzZKFw=;
 b=9PJS8J3KiYwGjrzjnyvJj/Wju65uEr/T7O6SNiRoctM41u2iwXEQe/hrMjfashVRh5gZ4S
 SzqtOgrrh4Wd6kRM5XGPzq8A3KgQR9aMeLdKTfCWOQGhlCWTTdZkCddit/0pOoFkep75z7
 5GkqLqGm5JF953YWgwSwgbUNzjgn+aw=
ARC-Seal: i=1; s=mail3; d=murena.io; t=1765113393; a=rsa-sha256; cv=none;
 b=hwZ1FpDC7gjiD1v+0BN+zKNNdXOTQAoRseG4tf8dTWmT/t7Nxczb2086lF4np1TFeSrpol
 HQxmrOvXohepCNsCdGFEGZCJ/EG5ar9X1U3nQXZd4aURPet1IGALQLZo9HRDDgZASowlyh
 NoQtfcc3+jU7ofOQy8LC7ATPslQSbgY=
ARC-Authentication-Results: i=1; mail3.ecloud.global;
 auth=pass smtp.mailfrom=maud_spierings@murena.io
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=murena.io;
 s=mail3; t=1765113393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d0IbB4IpT2dhEZpT6CaDcHvBq0pv4VvNOc552hzZKFw=;
 b=S3oXMaax5JrDFkjCRm2vN6zoxq52asX6UADz4fXgY1KdE6uXAVmBoc0ux9MEfE7te37kVq
 YfUL0pFa/rD7UwDElrl8pw9hF9eS8txaqNHia4ewb70rizDkihQeiAN0ECtzDOAdrrMuoz
 nHLcAYorXVLJ3da5IYEKFHiPjxyv0pw=
Message-ID: <4ec78537-5184-4e6b-9ada-ff268fbe9c3e@murena.io>
Date: Sun, 7 Dec 2025 14:16:32 +0100
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
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sun, 07 Dec 2025 13:30:09 +0000
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

Awesome work! I've been waiting for this feature!

I can now actually get 1440p100 on my display and 4k60 on my tv over HDMI.

Tested-by: Maud Spierings <maud_spierings@hotmail.com>

Kind regards,
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
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
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

