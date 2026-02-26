Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCSDAj01oGkqgwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 12:57:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A63F51A5724
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 12:57:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC69D10E8EC;
	Thu, 26 Feb 2026 11:57:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QhTAbd2G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ADAB10E8EC
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 11:57:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E58D543CC5;
 Thu, 26 Feb 2026 11:57:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BC932C19424;
 Thu, 26 Feb 2026 11:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772107058;
 bh=oiqFXpye5QOfNF+rTWMisr/wKccPtH9iwzgYoKSqE+Y=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=QhTAbd2GnGCaV+RCJEuSEAvpQiiOliZiJGVnurU643a9ZfaqWowET4GmtbnhQhYxe
 rPqel0HvKn4NkJsQWtlkemZf+RalYLFAA2JrjPpljTUKt3cXQP0P/bBV5iKD18y25C
 MPxFVWamQleHSghwAWWQh3EbTv0IAMlylq0yQsiY4OhNm9HB5VmwDPKJrWDAJOeqq2
 qJYKfKi+pbuXMmwdg/HFWiWrRyM+Yj5eTzcT3tnTVA/DnCjXUJmcxczQy6IGX5sdRV
 n+vuEHutBvqBsw8ntfXmqlNm9iShnmCgAR7fFBPHBRAG6FE3VA9JK0ernASDiEfCxu
 LPkJMnAERkv6w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id B51A4FC593D;
 Thu, 26 Feb 2026 11:57:38 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 26 Feb 2026 12:57:38 +0100
Subject: [PATCH 3/4] drm/panel: Clean up S6E3HA2 config dependencies and
 fill help text
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-panel-clean-up-kconfig-dep-v1-3-bb28a2355b4c@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1394; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=nGKahjQwI7znNkaaKEUb98XnwiAFL8M8zDm07QyoU9g=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpoDUxizewYKSUVv17EX53w6oLr13vJCfIH3gjN
 bgSVVVKjfyJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaaA1MQAKCRBgAj/E00kg
 cuWHEACMQ9RZP9Mj9N07PRukwKnM1NxsbM9ekbvTy6YBWoBMA7l6mzlza6rIZ8LYxoytR8kp5NQ
 R4QjlU2Fij9eA2GeoSdRqenK4/8nhj9E4yTC6pODN6eie46VZ43KmKna40EBOVdEiUKJm9ZjmR/
 SxGCwcIJvO24S91njglc9l8Z9fhtd223WYxHvRnRajL1bxFKw8jdIZuNTxbrHqmvYE7YSp0Z4uE
 FUtiQUJJcaHLwdCbdO2Q7JP8WPIrakzzj+PlKaZudhP9blkijZU2OZIYa3S4S0adjUUJaGMSyKE
 /9LnmMh1p/53K3wNtK8EcmvfL2XNSLcHcb8xYBBhig8MIUK1I9222Vn+UFL5DMR7kJHb1fBHa1Q
 +rrtZnG57jBsBPO7fbz6AeKk5PBHEMUBccWITD9oigGFekGgszQZdFJVkMUL4NaqNGty6vAcGPW
 QyAS3uHMWwZ0qqicJNl8iB/6MuuVw9KfJOe+VjRo9rtQxLKJdhwp8MVc1aTdKtjmnj3cEhFMyQi
 KDnL1HAs7lM15lkp6xkp4C7iPPdJ6k35kz15RjzbDA2R2yBynDaLcmSUBzrYuyFuI/aF3dGVN0V
 SrbVvdBahjFY0svjEaf9FSMC7u+0dSmKCDyG+xcFBwbqCXSwtHZjGAiaall7UCvze3hMOiLUetQ
 HWds9Gd7SzWzVYw==
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
X-Rspamd-Queue-Id: A63F51A5724
X-Rspamd-Action: no action

From: David Heidelberg <david@ixit.cz>

As per the config name this Display IC features a DSI command-mode
interface (or the command to switch to video mode is not
known/documented) and does not use any of the video-mode helper
utilities, hence should not select VIDEOMODE_HELPERS. In addition it
uses devm_gpiod_get() and related functions from GPIOLIB.

Fixes: 779679d3c164 ("drm/panel: Add support for S6E3HA8 panel driver")
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/panel/Kconfig | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index a81ea7755c03f..4e7b4808f6e7c 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -849,11 +849,17 @@ config DRM_PANEL_SAMSUNG_S6E3HA2
 
 config DRM_PANEL_SAMSUNG_S6E3HA8
 	tristate "Samsung S6E3HA8 DSI video mode panel"
-	depends on OF
+	depends on OF && GPIOLIB
 	depends on DRM_MIPI_DSI
 	depends on BACKLIGHT_CLASS_DEVICE
 	select DRM_DISPLAY_DSC_HELPER
-	select VIDEOMODE_HELPERS
+	help
+	  Say Y or M here if you want to enable support for the
+	  Samsung S6E3HA8 DDIC and connected MIPI DSI panel.
+	  Currently supported panels:
+
+	    Samsung AMB577PX01 (found in the Samsung S9 smartphone)
+
 
 config DRM_PANEL_SAMSUNG_S6E63J0X03
 	tristate "Samsung S6E63J0X03 DSI command mode panel"

-- 
2.51.0


