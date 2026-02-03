Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFnEF512gmm+UwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 23:28:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D32DF3D6
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 23:28:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EA6810E28D;
	Tue,  3 Feb 2026 22:28:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="o2mZa+JW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13A8A10E28D
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 22:28:40 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4f5J6X4jHQz9tjW;
 Tue,  3 Feb 2026 23:28:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1770157716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f1o9nsF9YwvZWpGmMUWR2zMYlmkS0PV7dw8KDeOPo2k=;
 b=o2mZa+JWIjUtAWsm8GylAKwi0CRpo3hyrPxMhO7TDg4u1bN5fTRifX4Uor/7P0crcyCQGy
 fwS3CzFz2uOBprnGT3dtkrxcRfSys4g+KnEq5mlQXK9OAAeP/wyRI1abrsAfm4aDGcNQVK
 wDfTAKg795QMinjfaja7WDNYt142oGAR/kGNbFLD0Ri0SP0xX61MM0CJGByNn4EKxMB4L8
 hDNGhp6nqMObwR2VXqOQixA9hVygnyijRXfDTkGSd0QevKWZvEsEisJ7fR1jd6s2o2Xafz
 ofuXIBttfQQ7RI91Xg7Jk4/su1OJ+3hBMSBU0F4FfJA+NW+lz6gQDmhbV8H+9Q==
Message-ID: <ffd8b675-687e-457b-bbd0-88e91ee3520c@mailbox.org>
Date: Tue, 3 Feb 2026 23:28:32 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] drm/bridge: waveshare-dsi: Register and attach our DSI
 device at probe
To: dri-devel@lists.freedesktop.org, Joseph Guo <qijian.guo@nxp.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie
 <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260112234726.226092-1-marek.vasut+renesas@mailbox.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20260112234726.226092-1-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 8b8c1e99ae5774b79aa
X-MBO-RS-META: fkiwtde55yfuoi81otfpjf4mqimdbpc1
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[intel.com,gmail.com,kwiboo.se,ideasonboard.com,linux.intel.com,kernel.org,linaro.org,ffwll.ch,suse.de,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,linaro.org:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,kwiboo.se:email]
X-Rspamd-Queue-Id: 53D32DF3D6
X-Rspamd-Action: no action

On 1/13/26 12:47 AM, Marek Vasut wrote:
> In order to avoid any probe ordering issue, the best practice is to move
> the secondary MIPI-DSI device registration and attachment to the
> MIPI-DSI host at probe time.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Note that this is similar to e.g. commit
> 6ef7ee48765f ("drm/bridge: sn65dsi83: Register and attach our DSI device at probe")
> and pretty much what every other DSI-to-DPI bridge does.
> ---
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>   drivers/gpu/drm/bridge/waveshare-dsi.c | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/waveshare-dsi.c b/drivers/gpu/drm/bridge/waveshare-dsi.c
> index 43f4e7412d722..9254446f54958 100644
> --- a/drivers/gpu/drm/bridge/waveshare-dsi.c
> +++ b/drivers/gpu/drm/bridge/waveshare-dsi.c
> @@ -80,11 +80,6 @@ static int ws_bridge_bridge_attach(struct drm_bridge *bridge,
>   				   enum drm_bridge_attach_flags flags)
>   {
>   	struct ws_bridge *ws = bridge_to_ws_bridge(bridge);
> -	int ret;
> -
> -	ret = ws_bridge_attach_dsi(ws);
> -	if (ret)
> -		return ret;
>   
>   	return drm_bridge_attach(encoder, ws->next_bridge,
>   				 &ws->bridge, flags);
> @@ -179,7 +174,7 @@ static int ws_bridge_probe(struct i2c_client *i2c)
>   	ws->bridge.of_node = dev->of_node;
>   	devm_drm_bridge_add(dev, &ws->bridge);
>   
> -	return 0;
> +	return ws_bridge_attach_dsi(ws);
>   }
>   
>   static const struct of_device_id ws_bridge_of_ids[] = {

Is there anything that should be done with this patch ?
