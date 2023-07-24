Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC18375EA12
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 05:30:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23D5110E0AD;
	Mon, 24 Jul 2023 03:30:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D5E310E0AD
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 03:30:21 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4R8Qf271LMzBRx4P
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 11:30:18 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-transfer-encoding:content-type:message-id:user-agent
 :references:in-reply-to:subject:to:from:date:mime-version; s=
 dkim; t=1690169418; x=1692761419; bh=Aih9b3mm0L/W57ewzfZK0Mk2HMM
 uvyf31AvjFkXi8+I=; b=l/VAKTIcjlyWOGKtifjZLmhWFCSY+xtgf4nSre0R708
 Kd/+LemFANnznhlFN8fdLbFXK5NQiSK4+8GTcwULPjHRW8Ew2tPLFZYxQeH1ykNU
 paqOravr1Sd+9X84AOm1BlwHEQ+jZP7Kh++gvbGmQegIgNNk/eZmczkmQDbAUNsd
 fgCx/ntDUu6XreMbX+YBrc2nbLMeWUMXd2ssbGuL8jxonzh+uNhb0umnU3ExdHrV
 JWGOkFehD0U4H604jww6wf8PWWbcUPdVm4AZXQWM//BkkBXQY6AYAM/vtrOGzgEY
 Y3Ue41AP8vFcm5aBkD3dmc3MuN1Ak96bHpgJi6LlCGw==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id sD0FjlcSYO2L for <dri-devel@lists.freedesktop.org>;
 Mon, 24 Jul 2023 11:30:18 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4R8Qf24pbszBRDrF;
 Mon, 24 Jul 2023 11:30:18 +0800 (CST)
MIME-Version: 1.0
Date: Mon, 24 Jul 2023 11:30:18 +0800
From: sunran001@208suo.com
To: alexander.deucher@amd.com
Subject: [PATCH] drm/radeon: add missing spaces after ',' and else should
 follow close brace '}'
In-Reply-To: <20230724032920.7892-1-xujianghui@cdjrlc.com>
References: <20230724032920.7892-1-xujianghui@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <d88773902f7a8536a8be83ead18981b3@208suo.com>
X-Sender: sunran001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ERROR: else should follow close brace '}'

ERROR: space required after that ',' (ctx:VxV)

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
  drivers/gpu/drm/radeon/radeon_connectors.c | 5 ++---
  1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c 
b/drivers/gpu/drm/radeon/radeon_connectors.c
index 07193cd0c417..4ceceb972e8d 100644
--- a/drivers/gpu/drm/radeon/radeon_connectors.c
+++ b/drivers/gpu/drm/radeon/radeon_connectors.c
@@ -198,8 +198,7 @@ int radeon_get_monitor_bpc(struct drm_connector 
*connector)
  				DRM_DEBUG("%s: HDMI deep color 10 bpc exceeds max tmds clock. Using 
%d bpc.\n",
  						  connector->name, bpc);
  			}
-		}
-		else if (bpc > 8) {
+		} else if (bpc > 8) {
  			/* max_tmds_clock missing, but hdmi spec mandates it for deep color. 
*/
  			DRM_DEBUG("%s: Required max tmds clock for HDMI deep color missing. 
Using 8 bpc.\n",
  					  connector->name);
@@ -1372,7 +1371,7 @@ radeon_dvi_detect(struct drm_connector *connector, 
bool force)
  					/* assume digital unless load detected otherwise */
  					radeon_connector->use_digital = true;
  					lret = encoder_funcs->detect(encoder, connector);
-					DRM_DEBUG_KMS("load_detect %x returned: 
%x\n",encoder->encoder_type,lret);
+					DRM_DEBUG_KMS("load_detect %x returned: %x\n", 
encoder->encoder_type, lret);
  					if (lret == connector_status_connected)
  						radeon_connector->use_digital = false;
  				}
