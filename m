Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC3C83EBF4
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jan 2024 09:05:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 075801122D0;
	Sat, 27 Jan 2024 08:04:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D1411122D0
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jan 2024 08:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1706342657;
 bh=+d1HJV+oqtFs0bU0G8OR0uyzqJEoUv2JpT9jgd5+H9g=;
 h=From:To:Cc:Subject:Date:From;
 b=wPfzTSnLgE243uMUO/04o1rnKkcyQ2UWnpzYf/9yjiOTmzJ/8KLPl9oxXsOa27LRw
 rgaxS1cpwFxMSw8l66MISWkRX7jfzi0sDL5C3JTUgwFupvGLW+ygPvBXZN9ppFk+xb
 sMZwRqQCbpZ+bKDKzT0XnAXPcYakDh7nUe5fWcG6n0No/g9eMWFg+VVfYCb2R11r98
 B7cYDVpQbYW3svxLKHAt/fSVF4usjjmy3g0TUo/ErVkh3Qwmltx0haqvJ1fLVcYFAo
 UuEOGRA1Hg8bmiw8Hq3zagB8xMF8cmoFt9wHn8hVT4Yq+FJbaZXBqtiYfaafs0efFi
 meIvOmP0Ph/jw==
Received: from eugen-station.. (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: ehristev)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id A1FA53780629;
 Sat, 27 Jan 2024 08:04:15 +0000 (UTC)
From: Eugen Hristev <eugen.hristev@collabora.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: dw-hdmi: fix trivial typo in comment
Date: Sat, 27 Jan 2024 10:03:55 +0200
Message-Id: <20240127080355.65770-1-eugen.hristev@collabora.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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
Cc: neil.armstrong@linaro.org, kernel@collabora.com,
 Eugen Hristev <eugen.hristev@collabora.com>, andrzej.hajda@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

s/Initializateion/Initialization

Fixes: 9aaf880ed4ee ("imx-drm: Add mx6 hdmi transmitter support")
Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index aca5bb0866f8..2fc7dae7b8f8 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2288,7 +2288,7 @@ static int dw_hdmi_setup(struct dw_hdmi *hdmi,
 	/* HDMI Initialization Step B.1 */
 	hdmi_av_composer(hdmi, &connector->display_info, mode);
 
-	/* HDMI Initializateion Step B.2 */
+	/* HDMI Initialization Step B.2 */
 	ret = hdmi->phy.ops->init(hdmi, hdmi->phy.data,
 				  &connector->display_info,
 				  &hdmi->previous_mode);
-- 
2.34.1

