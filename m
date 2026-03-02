Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OXmBHMCpmmzIwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 22:34:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 977821E3580
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 22:34:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF56189870;
	Mon,  2 Mar 2026 21:34:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="LAxHCE/S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E356289870
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 21:34:38 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4fPsdl6jx7z9sdH;
 Mon,  2 Mar 2026 22:34:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1772487276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xp8sg5gVtxoKedtyD9+EqXP+jjBRz+jOb9nPGoQLblA=;
 b=LAxHCE/SWju9DJ7RUefqhrCGp/HxEgKgZ+/Dn4G6+umv0DfVTRTARwej2JbHvjkbae3e86
 I7juJ3W6XjL5gZsRcp/14sFIcfOTsH3dr4SyM24H95VQbjAND8Y1vuz/o1Wv2zp36YbJPy
 vgtKGAiOJB0vWg6J/sLCWcOk+MNx+b7o8ezil2X2haqDe/TLBASWyRFLse+UxNdfVzF6uI
 oK35F4svLhLIpWYI2cetsGNsgKflH0y0DQdyypP34WcIJVUsRTeCuKEOcfg8dOLhWNWOt8
 WX5ao+JEpVJfNO8Q5eUge9km80LTrW72+GjwXWoMTZQZaiqqr8/kMiLGKkSbSA==
Message-ID: <e9c7f67d-bfba-411a-80fb-956fd96e1037@mailbox.org>
Date: Mon, 2 Mar 2026 22:34:31 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v2] drm/bridge: waveshare-dsi: Register and attach our DSI
 device at probe
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie
 <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260206125801.78705-1-marek.vasut+renesas@mailbox.org>
 <DG7YBVU2COFT.2JP8PKR4ZAKFT@bootlin.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <DG7YBVU2COFT.2JP8PKR4ZAKFT@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 0a60f08183c5a211308
X-MBO-RS-META: z3bdwrxqqkiyhhkwi8xtr3eyg31pu438
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
X-Rspamd-Queue-Id: 977821E3580
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:luca.ceresoli@bootlin.com,m:andrzej.hajda@intel.com,m:airlied@gmail.com,m:jernej.skrabec@gmail.com,m:jonas@kwiboo.se,m:Laurent.pinchart@ideasonboard.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[intel.com,gmail.com,kwiboo.se,ideasonboard.com,linux.intel.com,kernel.org,linaro.org,ffwll.ch,suse.de,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,mailbox.org:dkim,mailbox.org:email,mailbox.org:mid]
X-Rspamd-Action: no action

On 2/6/26 3:34 PM, Luca Ceresoli wrote:
> Hi Marek,
> 
> On Fri Feb 6, 2026 at 1:57 PM CET, Marek Vasut wrote:
>> In order to avoid any probe ordering issue, the best practice is to move
>> the secondary MIPI-DSI device registration and attachment to the
>> MIPI-DSI host at probe time.
>>
>> Besides solving the probe ordering problems, this makes the bridge work
>> with R-Car DU. The R-Car DU will attempt to locate the DSI host bridge in
>> its own rcar_du_probe()->rcar_du_modeset_init()->rcar_du_encoder_init()
>> by calling of_drm_find_bridge() which calls of_drm_find_and_get_bridge()
>> and iterates over bridge_list to locate the DSI host bridge.
>>
>> However, unless the WS driver calls mipi_dsi_attach() in probe(), the
>> DSI host bridge .attach callback rcar_mipi_dsi_host_attach() is not
>> called and the DSI host bridge is not added into bridge_list. Therefore
>> the of_drm_find_and_get_bridge() called from du_probe() will never find
>> the DSI host bridge and probe will indefinitelly fail with -EPROBE_DEFER.
>>
>> The circular dependency here is, that if rcar_du_encoder_init() would
>> manage to find the DSI host bridge, it would call the WS driver .attach
>> callback ws_bridge_bridge_attach(), but this is too late and can never
>> happen. This change avoids the circular dependency.
>>
>> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> 
> Thanks for the very clear description! R-by confirmed.
Can this be applied now ?
