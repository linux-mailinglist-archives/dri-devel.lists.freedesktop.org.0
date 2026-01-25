Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +L/2AHlidWl+EwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 01:23:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA03A7F5C4
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 01:23:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83BD610E352;
	Sun, 25 Jan 2026 00:23:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="PY83B9r4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AB1B10E0BA
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 00:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1769300589;
 bh=61a/xXLH/MfXCWDs29dssZLNdRSXxubVmLLmNkYSvyc=;
 h=From:Subject:Date:To:Cc:From;
 b=PY83B9r4lZry6De6E/tVN38W3Nkeo3vv9w+uLsGY7vIQ9ZiO81l50KdtI0az6+E2m
 wrZuGdBWJ9KuwXhDRUuxuSyoPASBANIN/QCvO0/GimhLN5EI4Q/qyj7dh65+cnKSR6
 0ozUrVvtK4e9TcM0v++ij4w5JO+8mx+Vb9CLxKjay4T4YhObJYCRoca4s44zBCfBk2
 WPPIhuiCGPQagFYGQIl5/3DCP1zws4CYGNaOWLVSb3dvs+Q0NtVUt28C7a/uwAlxGZ
 I/AAXyRKl/5ay1x5MjvWpCAd3i66Jx8UB2fAwy4wPvCUkdZPE2daRSghB82QvPCl2T
 AUQHXA7CqfEBA==
Received: from localhost (unknown [82.79.138.145])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 6BA5417E01E7;
 Sun, 25 Jan 2026 01:23:09 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH 0/5] Provide HDMI VSI & SPD InfoFrames to DW HDMI QP TX
Date: Sun, 25 Jan 2026 02:22:58 +0200
Message-Id: <20260125-dw-hdmi-qp-iframe-v1-0-e0f7649ecc4b@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGJidWkC/x3MQQqAIBBA0avIrBtIwciuEi0kx5qFZgoVSHdPW
 r7F/xUKZaYCk6iQ6eLCR2yQnYB1t3EjZNcMqldDL5VGd+PuAuOZkH22gdCsepQ0GO8dQetSJs/
 P/5yX9/0AsdBtL2MAAAA=
X-Change-ID: 20260125-dw-hdmi-qp-iframe-9c581e69ffde
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
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
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:kernel@collabora.com,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch];
	FORGED_SENDER(0.00)[cristian.ciocaltea@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[cristian.ciocaltea@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:dkim,collabora.com:mid]
X-Rspamd-Queue-Id: CA03A7F5C4
X-Rspamd-Action: no action

This patch series provides the missing support for sending HDMI
Vendor-Specific Infoframes and Source Product Description InfoFrames in
dw-hdmi-qp library.

Additionally, it improves the existing AVI, DRM and Audio infoframes
handling by getting rid of some boilerplate and/or redundant code.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Cristian Ciocaltea (5):
      drm/bridge: dw-hdmi-qp: Provide HDMI Vendor Specific InfoFrame
      drm/bridge: dw-hdmi-qp: Provide SPD InfoFrame
      drm/bridge: dw-hdmi-qp: Rework AVI InfoFrame handler
      drm/bridge: dw-hdmi-qp: Rework DRM InfoFrame handler
      drm/bridge: dw-hdmi-qp: Rework Audio InfoFrame handler

 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 247 ++++++++++++++-------------
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h |   3 +
 2 files changed, 129 insertions(+), 121 deletions(-)
---
base-commit: 2cb217301e0df17f7107a1b0941b28d4053eae8b
change-id: 20260125-dw-hdmi-qp-iframe-9c581e69ffde

