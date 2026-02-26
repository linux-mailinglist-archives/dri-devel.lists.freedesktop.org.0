Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNwSEjk1oGkqgwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 12:57:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 626A41A571D
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 12:57:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCBE110E90D;
	Thu, 26 Feb 2026 11:57:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rx/XTseo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AB3010E8EB
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 11:57:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CDB0943396;
 Thu, 26 Feb 2026 11:57:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A02E1C19423;
 Thu, 26 Feb 2026 11:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772107058;
 bh=MqSJmu1uXT6iOqp2k37q1PgdWKfSaMyjLJfRuK9RPqw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=rx/XTseons2fHbfB9DcdbMfx02OEkrvjkSiDPtHMZSTPrEmuG9Qz9CvYlnBcMf9zJ
 HynLUBKWlqBfY5BkYlKY5D5Iy9HiMYb8NyGVe/EUMQmdy+mHgOw0PDUTW7Y573vcZ8
 v2BWiu6nYmaBfweiJGZHQEjJHjghY/SI71zRucSF6duxdnP58EcofQzUt0JjwdhmKQ
 F/PWYR1+Q+2lJXV1Ul+86F+MML33WqnHDAOfoisiYMbStxGEnecF7sNP01Q04gq/1d
 prK2hLqajdnWoTnX2KgDCXFtJyfc6pJm6v2A65H+LuwuJBlZfBxwpJ+IUR1O171lag
 /XJ0oYXM5EsZA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 95777FC593A;
 Thu, 26 Feb 2026 11:57:38 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 26 Feb 2026 12:57:36 +0100
Subject: [PATCH 1/4] drm/panel: Clean up SOFEF00 config dependencies
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-panel-clean-up-kconfig-dep-v1-1-bb28a2355b4c@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1352; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=S2VmpYOqwuL+0OJ8gYr+mbqdWnTXUGRv7C3ek1BRY3c=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpoDUwi1CjtxFs5Sj/rXK7pY5bi2RLpIoCFPyEq
 woAahnB0l6JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaaA1MAAKCRBgAj/E00kg
 csbJEACtWhRwtEV68IEUPumQ+0W9UDjFpTKqA8vLw/EGhDWAix7givziihyRR1aHGeHf/dKVy3O
 9pBRNgts4TpFp+BWpTRDvsbrbyMbPN/6/S3Ov0hZngQ6YEFxUtoFfk/N2iveGvjm69OZnvm+2Ef
 JcK6Q3y0EhevQUzu8iIuX+KL1TNO7TCphyA/fx7ij1+NW+u5Eh04hGK1a85wrpfEiPDtcgqJoU+
 X9uEt5lxwmtKtB8tHvNEwGe9sFJpm9RQSGrAz165iQrFLkuISl6SwUBy6Vq9boP04jCsCR1KQ34
 nMZ9u7Dg9BJRLiNhN1A44OItCJxNMS+ub9ewBb4ByTSQWVwiZS5ACHL9FqK561saFj0FGqSyJAH
 e/eZg/WcKOsBqj7r9X+V6TfpPKZR40Dlp7zDscBGkKleTPsusuC5susIwQpVcXSosn9XvSSPLFq
 zv4uxSljWYPJ8ZsJdOj0jUucRydhC/YHX2uGaAqEw6OKDPeT0fh7xoQWgMUIK41nMyB3Yie2jhW
 sxxhnhq9JaURXRZif4pcIgxHk/eh3yI6tt+mVxE7+9s26varnrOg73ZusLYpcryditqWCJx8PFf
 ilSm7nGXfu/5zOlE7QutiTJIi2N/MFVr9OEX4gMfu61fiRhjFDg4qJb5PJS7/eTHaoOHVFuBNow
 US66dQ3OiFT+CyQ==
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,ixit.cz:mid,ixit.cz:email,ixit.cz:replyto,somainline.org:email]
X-Rspamd-Queue-Id: 626A41A571D
X-Rspamd-Action: no action

From: Marijn Suijten <marijn.suijten@somainline.org>

As per the config name this Display IC features a DSI command-mode
interface (or the command to switch to video mode is not
known/documented) and does not use any of the video-mode helper
utilities, hence should not select VIDEOMODE_HELPERS.  In addition it
uses devm_gpiod_get() and related functions from GPIOLIB.

Fixes: 5933baa36e26 ("drm/panel/samsung-sofef00: Add panel for OnePlus 6/T devices")
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Casey Connolly <casey.connolly@linaro.org>
Reviewed-by: David Heidelberg <david@ixit.cz>
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/gpu/drm/panel/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 79264f7bbd0e2..2fd3222ba2e3b 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -909,10 +909,10 @@ config DRM_PANEL_SAMSUNG_S6E8AA5X01_AMS561RA01
 
 config DRM_PANEL_SAMSUNG_SOFEF00
 	tristate "Samsung SOFEF00 DSI panel controller"
+	depends on GPIOLIB
 	depends on OF
 	depends on DRM_MIPI_DSI
 	depends on BACKLIGHT_CLASS_DEVICE
-	select VIDEOMODE_HELPERS
 	help
 	  Say Y or M here if you want to enable support for the Samsung AMOLED
 	  panel SOFEF00 DDIC and connected panel.

-- 
2.51.0


