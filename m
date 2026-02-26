Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aA8oGkI1oGkqgwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 12:57:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3041A5748
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 12:57:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D779110E8F3;
	Thu, 26 Feb 2026 11:57:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GCj1X1kA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B481C10E8EC
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 11:57:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0DFEA600CB;
 Thu, 26 Feb 2026 11:57:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AFDBAC19422;
 Thu, 26 Feb 2026 11:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772107058;
 bh=CjqHcKW4Zc60TOEH0FSOOPRjRVQ7cQn2MFyhUhnn/NQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=GCj1X1kA3YfP1LUuxGKSi3VXXo92KPFZOT7UhoKeg6hET6D1/sTvCczA3TrV6052k
 ZpZ/65PDJz514M29TVTALxMz+LYtL/r8VJAl4d2/XsVewNHW+aY5U1qDR22ZOkUkJ7
 Su4bN4TToTERHr4rGbTUmNb6Fx9Nf+NW4spyhQfwbPtt2jIZJoZCGZEkUBig+yA1E5
 24yMX/3TtDStGlHeILxsdGrUYq0uew1oNTta4fSobYb4PxZQPKc8dEUnyvF1UgB5jx
 g2nOwGLu5i+bnnzu8b87SV/NhmvKbid7v6fsgs9ftJXpBD8fEZ0CuDWk1rKamBetld
 2w7m7O3H0ErGQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id A548EFC592F;
 Thu, 26 Feb 2026 11:57:38 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 26 Feb 2026 12:57:37 +0100
Subject: [PATCH 2/4] drm/panel: Clean up S6E3FC2X01 config dependencies
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-panel-clean-up-kconfig-dep-v1-2-bb28a2355b4c@ixit.cz>
References: <20260226-panel-clean-up-kconfig-dep-v1-0-bb28a2355b4c@ixit.cz>
In-Reply-To: <20260226-panel-clean-up-kconfig-dep-v1-0-bb28a2355b4c@ixit.cz>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Dzmitry Sankouski <dsankouski@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: Casey Connolly <casey.connolly@linaro.org>, 
 marijn.suijten@somainline.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1170; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=1E7aVpRA10O6F1jEpxvHIj22BqTrWHJFHanlhtXUI1g=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpoDUwrjHompueBqEMEG/sPuQckQy/doRmtGAiM
 41Q6oUHSEWJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaaA1MAAKCRBgAj/E00kg
 coXXD/9c6tXLegZ5OTv375490elWzhRTjE0pplWcDDbaQgRxZVMvThHWQ8PEdK4Rje1OrCu8Yqw
 iZtf9lqajpg9ZOnqyslWLHMdQvyycbZVZJbkuV4dmg9M61csS3zvxzsSJKWPRtLdU/uctArl+VS
 +9viiYAYcjQPIKOVmMKJIr0K7LPHBdh/WxzPYpmbKxu9Ikzid4vUvVP4XE50GKWlQq+kHuvDgoQ
 OQFSdvDT9nUgc0/b2geRpHxeowDdG5sVV9EK/lahBumcVb/U+59W4Z8WsQooUgR34Q/6/2bED4n
 xONrDYoRPDpUAX1qWX141HnY1Rwtr2EsglFLDT14rXJRA9fKYd1iBimRiq4lVAJoxuK0g4PNr2u
 HCVv06mf8ivmbErJB8JnmWQIsYezZpiqUr/FgE8OBt9SVPBdf3f9MQkITYiATK6ofbPDHapShTo
 V42hIHKt3MMRSvhlK4prqVeeO6xasfjBRqPLJzy0cjz73awv+EAhYagcPr450xlNFvyfpl139Rf
 zzhNVwb1MQDxlpi0ebDy+e7EgOtO9/qTogcCN5Jzouszhx8b5+qvNiXGt+7L60BQFMO7oI+Ww2r
 xXoN7TOS90MlkCfqIObn5MzMwXpvVhy/D4ZPRViCUikgbnkioEglzJCFcs7pw8hw0lcdKabxQ7r
 HG0HJwtzPAcdyPg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
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
Reply-To: david@ixit.cz
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:dmitry.baryshkov@oss.qualcomm.com,m:dsankouski@gmail.com,m:sam@ravnborg.org,m:casey.connolly@linaro.org,m:marijn.suijten@somainline.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:david@ixit.cz,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,oss.qualcomm.com,ravnborg.org];
	FORGED_SENDER(0.00)[devnull@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[david.ixit.cz];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:mid,ixit.cz:email,ixit.cz:replyto,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: CD3041A5748
X-Rspamd-Action: no action

From: David Heidelberg <david@ixit.cz>

As per the config name this Display IC features a DSI command-mode
interface (or the command to switch to video mode is not
known/documented) and does not use any of the video-mode helper
utilities, hence should not select VIDEOMODE_HELPERS.  In addition it
uses devm_gpiod_get() and related functions from GPIOLIB.

Fixes: 88148c30ef26 ("drm/panel: Add Samsung S6E3FC2X01 DDIC with AMS641RW panel")
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/panel/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 2fd3222ba2e3b..a81ea7755c03f 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -830,10 +830,9 @@ config DRM_PANEL_SAMSUNG_S6D7AA0
 
 config DRM_PANEL_SAMSUNG_S6E3FC2X01
 	tristate "Samsung S6E3FC2X01 DSI panel controller"
-	depends on OF
+	depends on OF && GPIOLIB
 	depends on DRM_MIPI_DSI
 	depends on BACKLIGHT_CLASS_DEVICE
-	select VIDEOMODE_HELPERS
 	help
 	  Say Y or M here if you want to enable support for the
 	  Samsung S6E3FC2 DDIC and connected MIPI DSI panel.

-- 
2.51.0


