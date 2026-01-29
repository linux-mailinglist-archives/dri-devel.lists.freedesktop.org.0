Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0AJzKPZOe2n9DgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 13:13:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3DFAFF42
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 13:13:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E087510E244;
	Thu, 29 Jan 2026 12:13:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="LGlCLnH+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F13410E244
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 12:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1769688817;
 bh=GKuqR9FxhtW7SiWuGuK4fq6wZFRzLeOz/cESfbrmQeI=;
 h=From:Subject:Date:To:Cc:From;
 b=LGlCLnH+GA5QO9v9Km94YVqtksxKdFi1F/ZwEWIHb7ANHQOduw/E5mrlxdsj/u0JN
 Oz0G2Pv7N5fRjY8kTC3LQeUnjyWkuWdwHKujR/hghyG9HawG1se9FAjhXuwrZRhix4
 Li5kC+YH2blzN2MY6FcG+0HZxixy1DBN4ZIGCWe/0zF5opC6xjpM1GB8O83520VuyQ
 MvC/DSvprB8abDvUBxsutMAPBwuWM3S5wRV5Ft/qlXDjq3H8LU3o/9EfELv9LylmZP
 R7dUvhYgb9D11lwpvymDjZ/fD/ZK+A4yqUKvL7B0pVab0ybTOQcyem2wq4W4voFnIi
 LS6iRK/pw87iA==
Received: from localhost (unknown [82.79.138.145])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id D68F617E0E3F;
 Thu, 29 Jan 2026 13:13:36 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH v2 0/5] Provide HDMI VSI & SPD InfoFrames to DW HDMI QP TX
Date: Thu, 29 Jan 2026 14:13:31 +0200
Message-Id: <20260129-dw-hdmi-qp-iframe-v2-0-0157ad05232c@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NQQ6CMBBFr0Jm7Zi2gSquvIdhUdqpnQQotgY1h
 LtbOYDL95L//gqZElOGS7VCooUzx6mAOlRgg5nuhOwKgxJKC6kadC8MbmR8zMg+mZGwtc1Zkm6
 9dwRlNyfy/N6bt65w4PyM6bNfLPJn/9UWiQJJ+JOuW7K27q82DoPpYzJHG0fotm37AtNfQji2A
 AAA
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:kernel@collabora.com,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch];
	FORGED_SENDER(0.00)[cristian.ciocaltea@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[cristian.ciocaltea@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 2F3DFAFF42
X-Rspamd-Action: no action

This patch series provides the missing support for sending HDMI
Vendor-Specific Infoframes and Source Product Description InfoFrames in
dw-hdmi-qp library.

Additionally, it improves the existing AVI, DRM and Audio infoframes
handling by getting rid of some boilerplate and/or redundant code.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Changes in v2:
- Introduced new helper dw_hdmi_qp_write_infoframe() to allow further
  code simplification (Daniel)
- Rebased series on top of latest drm-misc-next
- Link to v1: https://lore.kernel.org/r/20260125-dw-hdmi-qp-iframe-v1-0-e0f7649ecc4b@collabora.com

---
Cristian Ciocaltea (5):
      drm/bridge: dw-hdmi-qp: Provide HDMI Vendor Specific InfoFrame
      drm/bridge: dw-hdmi-qp: Provide SPD InfoFrame
      drm/bridge: dw-hdmi-qp: Rework AVI InfoFrame handler
      drm/bridge: dw-hdmi-qp: Rework DRM InfoFrame handler
      drm/bridge: dw-hdmi-qp: Rework Audio InfoFrame handler

 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 224 ++++++++++++---------------
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h |   3 +
 2 files changed, 106 insertions(+), 121 deletions(-)
---
base-commit: 3aecd55af5b83d16d84e3c333d4163999ee8ff51
change-id: 20260125-dw-hdmi-qp-iframe-9c581e69ffde

