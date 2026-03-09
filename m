Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LdEEKcMr2lzMQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 19:08:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CC723E45F
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 19:08:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3A6A10E09E;
	Mon,  9 Mar 2026 18:08:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="HAdeC2+t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8984010E09E
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 18:08:35 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 1B34F4E425D9;
 Mon,  9 Mar 2026 18:08:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D851E5FFB8;
 Mon,  9 Mar 2026 18:08:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A5272103696F1; Mon,  9 Mar 2026 19:08:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773079712; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ZeeNq0JFNd6Am0oaqdotsWmrKWspMXuBmcxKfMr1dFs=;
 b=HAdeC2+tQMb2tKyQGYBDRcFxSo0gmDHIxsVRGCXBfxA6Iqdbg68aQHBWhkU2L4O73u8H5l
 Ji+USyW20zbbmKbfFYKuti7SxBNIRapLi3dtVlQqRZO/9IzW7nAxXS9rBHj65WekllFyWv
 pJHHAsysMio+7qhjIAp8qLvdAPctBi5BhLKOErz1JzPRyC7iaDxQE3SE1tE+8Q4cZjXqoX
 JURF9M+3E4Hkr9B7hqstCw8pU7cbqR2crrNaP4IkjRMrCtfxuxgAJ2sJL6L/aOuX/x3yMe
 6lMp2sSyJGzsTRUJlWXZdIvjXv9HmQ4GZGBL2+rTsfUbPZe0g2a8QPgMNPVy6A==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Laurent.pinchart@ideasonboard.com, airlied@gmail.com, 
 andrzej.hajda@intel.com, andy.yan@rock-chips.com, aradhya.bhatia@linux.dev, 
 devarsht@ti.com, dianders@chromium.org, dri-devel@lists.freedesktop.org, 
 javierm@redhat.com, jernej.skrabec@gmail.com, jonas@kwiboo.se, 
 linux-kernel@vger.kernel.org, linux@treblig.org, lumag@kernel.org, 
 lyude@redhat.com, maarten.lankhorst@linux.intel.com, mordan@ispras.ru, 
 mripard@kernel.org, neil.armstrong@linaro.org, rfoss@kernel.org, 
 s-jain1@ti.com, simona@ffwll.ch, tomi.valkeinen@ideasonboard.com, 
 tzimmermann@suse.de, u-kumar1@ti.com, Harikrishna Shenoy <h-shenoy@ti.com>
In-Reply-To: <20251209120332.3559893-1-h-shenoy@ti.com>
References: <20251209120332.3559893-1-h-shenoy@ti.com>
Subject: Re: [PATCH v10 0/6] MHDP8546 fixes related to
 DRM_BRIDGE_ATTACH_NO_CONNECTOR usecase
Message-Id: <177307970347.95910.792345214802051392.b4-ty@bootlin.com>
Date: Mon, 09 Mar 2026 19:08:23 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
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
X-Rspamd-Queue-Id: C4CC723E45F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[26];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Laurent.pinchart@ideasonboard.com,m:airlied@gmail.com,m:andrzej.hajda@intel.com,m:andy.yan@rock-chips.com,m:aradhya.bhatia@linux.dev,m:devarsht@ti.com,m:dianders@chromium.org,m:javierm@redhat.com,m:jernej.skrabec@gmail.com,m:jonas@kwiboo.se,m:linux-kernel@vger.kernel.org,m:linux@treblig.org,m:lumag@kernel.org,m:lyude@redhat.com,m:maarten.lankhorst@linux.intel.com,m:mordan@ispras.ru,m:mripard@kernel.org,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:s-jain1@ti.com,m:simona@ffwll.ch,m:tomi.valkeinen@ideasonboard.com,m:tzimmermann@suse.de,m:u-kumar1@ti.com,m:h-shenoy@ti.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[ideasonboard.com,gmail.com,intel.com,rock-chips.com,linux.dev,ti.com,chromium.org,lists.freedesktop.org,redhat.com,kwiboo.se,vger.kernel.org,treblig.org,kernel.org,linux.intel.com,ispras.ru,linaro.org,ffwll.ch,suse.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[luca.ceresoli@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,bootlin.com:dkim,bootlin.com:email,bootlin.com:mid]
X-Rspamd-Action: no action


On Tue, 09 Dec 2025 17:33:26 +0530, Harikrishna Shenoy wrote:
> With the DRM_BRIDGE_ATTACH_NO_CONNECTOR framework, the connector is
> no longer initialized in  bridge_attach() when the display controller
> sets the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag.
> This causes a null pointer dereference in cdns_mhdp_modeset_retry_fn()
> when trying to access &conn->dev->mode_config.mutex.
> Observed on a board where EDID read failed.
> (log: https://gist.github.com/Jayesh2000/233f87f9becdf1e66f1da6fd53f77429)
> 
> [...]

Applied, thanks!

[1/6] drm/bridge: cadence: cdns-mhdp8546-core: Set the mhdp connector earlier in atomic_enable()
      commit: 43d6508ddbf9fb974fbc359a033154f78c9d4c8b
[2/6] drm/bridge: cadence: cdns-mhdp8546-core: Add mode_valid hook to drm_bridge_funcs
      commit: 6dbff34016052b099558b76632e4983e2df13fed
[3/6] drm/bridge: cadence: cdns-mhdp8546-core: Handle HDCP state in bridge atomic check
      commit: 4a8edd658489ec2a3d7e20482fa9e8d366153d8d
[4/6] drm/bridge: cadence: cdns-mhdp8546-core: Remove legacy support for connector initialisation in bridge
      commit: 35cf2554520c8ec59f12e08ded72ed11895fffc6
[5/6] cadence: cdns-mhdp8546*: Change drm_connector from structure to pointer
      commit: 0d9e84d304575029815681e06f755075c64ee85d
[6/6] drm/bridge: cadence: cdns-mhdp8546-core: Reduce log level for DPCD read/write
      commit: bfb18fd193e2413f02ad934e46887f415f0ce4ec

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

