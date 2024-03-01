Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB3A86DD54
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 09:44:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ACB810E252;
	Fri,  1 Mar 2024 08:44:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="UoFYyOsX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAF7410E252
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Mar 2024 08:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1709282693;
 bh=bXBAHFeGCu5O4TJ5J4wr9CD9SH6dew1YR9J2IBlw2SQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=UoFYyOsXGvP6eOUCadzQZ6Dd1dR37f30iYer+MbmQhzQUIgDLHaBp2Yo5fjZigkHx
 c56yxoEMhemHzOK0STONN90KbX3X/pRg0/EXYcgnLIrv8Xoo0HML36lxcHpSJYDdGj
 Ex9xsUY+rpxun87oQpnpuZQM4sGesFWuB7E3Pvcbq8WAityzJUgBtGeiXFRaPo46ea
 pRHsGY1x8yLzA/PEtLmz6g8OZ7HpA5oxJSPJW4rNlMj67dDe8ok//bUzNGd89vID8d
 k4erXZOHANTm3z3NBjni0DRROwUlo1Xrm9AdiGF62Yoot875zmLjDRWV2YPrrjGl2B
 lB4QqUtkSOUoQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id D938837814A4;
 Fri,  1 Mar 2024 08:44:51 +0000 (UTC)
Message-ID: <924fdd72-93ef-47dc-bd7f-37ccba2f83f1@collabora.com>
Date: Fri, 1 Mar 2024 09:44:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/9] drm/panel: novatek-nt35950: Don't log an error
 when DSI host can't be found
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 owen <qwt9588@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Marek Vasut <marex@denx.de>, Adrien Grassein <adrien.grassein@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Bjorn Andersson <andersson@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Vinay Simha BN <simhavcs@gmail.com>,
 Christopher Vollo <chris@renewoutreach.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240229-anx7625-defer-log-no-dsi-host-v2-0-00506941049a@collabora.com>
 <20240229-anx7625-defer-log-no-dsi-host-v2-8-00506941049a@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240229-anx7625-defer-log-no-dsi-host-v2-8-00506941049a@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Il 01/03/24 01:12, Nícolas F. R. A. Prado ha scritto:
> Given that failing to find a DSI host causes the driver to defer probe,
> make use of dev_err_probe() to log the reason. This makes the defer
> probe reason available and avoids alerting userspace about something
> that is not necessarily an error.
> 
> Fixes: 623a3531e9cf ("drm/panel: Add driver for Novatek NT35950 DSI DriverIC panels")
> Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>   drivers/gpu/drm/panel/panel-novatek-nt35950.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35950.c b/drivers/gpu/drm/panel/panel-novatek-nt35950.c
> index 648ce9201426..028fdac293f7 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt35950.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt35950.c
> @@ -556,10 +556,8 @@ static int nt35950_probe(struct mipi_dsi_device *dsi)
>   		}
>   		dsi_r_host = of_find_mipi_dsi_host_by_node(dsi_r);
>   		of_node_put(dsi_r);
> -		if (!dsi_r_host) {
> -			dev_err(dev, "Cannot get secondary DSI host\n");
> -			return -EPROBE_DEFER;
> -		}
> +		if (!dsi_r_host)
> +			return dev_err_probe(dev, -EPROBE_DEFER, "Cannot get secondary DSI host\n");

Nicolas, this is going over 100 columns, which is not ok.
Please fix.


>   
>   		nt->dsi[1] = mipi_dsi_device_register_full(dsi_r_host, info);
>   		if (!nt->dsi[1]) {
> 


