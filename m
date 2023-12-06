Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98490807349
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 16:05:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF9F210E736;
	Wed,  6 Dec 2023 15:05:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 449B810E736
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 15:05:21 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3332fc9b9b2so802241f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Dec 2023 07:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701875119; x=1702479919; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hwMf7u3p+RDwOM148aayiXMLKhs7CLyC1S19yofYD4k=;
 b=SZkt+wizLoliGHEGvqkG18ZDVaRm9E8a8jYJZJOYDzgT/4J6zED3uMIQqhORrsj65q
 798VPELhaROLXVQFtRtujZ2kPdb9E1WPBN4tIQ2oPrFZ/HhaAC41GaHpTwmmcJnfBqrb
 Xn78JO/98UL3JwF4r7nc17pQIEivfTCkT02ehCZx9aeY2/+Yf4Ah0B++7pG9S6/xzAbL
 LGvsRjZRc4hFoUouqFEBW648DIj4l6b9ZueNQ1BsRgcV5waCU7SRXHmk4i1B15bpwdkC
 SehAveNfK3kLuREe6U06Zs+uiZTSMy3Fh4a6Y1zABtirfW1YuEfW/Egpy0D5zhG/UQ4J
 zuOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701875119; x=1702479919;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hwMf7u3p+RDwOM148aayiXMLKhs7CLyC1S19yofYD4k=;
 b=srZKxfxc7O1C727Xt22+U2FZdh2ilyyWiAuV69O1eZibH5rA32e4EnEIjkyY8GwT4M
 te9jEtiR1GrItqKK+SaYHVAb75Z7YVKMWXbgX583yotpQtY+zvkYLXGPf6ipmNODDv+Z
 wQkrk+5ecxIBOW//MS36gx0Qd7tjCncxv3gjq+BzemrLFMaB8fcce0gQyfoujcC4r+KL
 UlBX86X34vwMZlEx/wwRsZuzyFQ4jxyLC57s0P4EIjVz7B5gDMQWNv/+xlkoH0hQPXI6
 N7lKId4I6RPVoffAsgITm4Wen9vK8a/T64tNG+eFYDsFcu1nu5DMv/BfXHwL/vlqouIR
 TGRA==
X-Gm-Message-State: AOJu0YwpCqElmzwup2vLVDNo6d/yaUdgRW/f56g9XctqqiGeQkkjgU+Z
 2zMuiOsc1xqNvJ3xISAWpgKNgQ==
X-Google-Smtp-Source: AGHT+IHxmKeit4iuxsVLMovMf5KGrF2Z3fWMEQdwveHfUOweVd3Xp0JZ1c0kBbI5qx1jEzp8P/Navw==
X-Received: by 2002:a5d:564a:0:b0:333:387b:687a with SMTP id
 j10-20020a5d564a000000b00333387b687amr280196wrw.199.1701875119471; 
 Wed, 06 Dec 2023 07:05:19 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 o14-20020a056000010e00b00333359b522dsm12772792wrx.77.2023.12.06.07.05.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Dec 2023 07:05:19 -0800 (PST)
Date: Wed, 6 Dec 2023 18:05:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH] drm/bridge: nxp-ptn3460: simplify some error checking
Message-ID: <04242630-42d8-4920-8c67-24ac9db6b3c9@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The i2c_master_send/recv() functions return negative error codes or
they return "len" on success.  So the error handling here can be written
as just normal checks for "if (ret < 0) return ret;".  No need to
complicate things.

Btw, in this code the "len" parameter can never be zero, but even if
it were, then I feel like this would still be the best way to write it.

Fixes: 914437992876 ("drm/bridge: nxp-ptn3460: fix i2c_master_send() error checking")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
This is not really a bug fix but I added a Fixes tag because I don't
want people to pull my other commit without also applying this.

 drivers/gpu/drm/bridge/nxp-ptn3460.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/nxp-ptn3460.c b/drivers/gpu/drm/bridge/nxp-ptn3460.c
index 9b7eb8c669c1..7c0076e49953 100644
--- a/drivers/gpu/drm/bridge/nxp-ptn3460.c
+++ b/drivers/gpu/drm/bridge/nxp-ptn3460.c
@@ -54,15 +54,15 @@ static int ptn3460_read_bytes(struct ptn3460_bridge *ptn_bridge, char addr,
 	int ret;
 
 	ret = i2c_master_send(ptn_bridge->client, &addr, 1);
-	if (ret <= 0) {
+	if (ret < 0) {
 		DRM_ERROR("Failed to send i2c command, ret=%d\n", ret);
-		return ret ?: -EIO;
+		return ret;
 	}
 
 	ret = i2c_master_recv(ptn_bridge->client, buf, len);
-	if (ret != len) {
+	if (ret < 0) {
 		DRM_ERROR("Failed to recv i2c data, ret=%d\n", ret);
-		return ret < 0 ? ret : -EIO;
+		return ret;
 	}
 
 	return 0;
@@ -78,9 +78,9 @@ static int ptn3460_write_byte(struct ptn3460_bridge *ptn_bridge, char addr,
 	buf[1] = val;
 
 	ret = i2c_master_send(ptn_bridge->client, buf, ARRAY_SIZE(buf));
-	if (ret != ARRAY_SIZE(buf)) {
+	if (ret < 0) {
 		DRM_ERROR("Failed to send i2c command, ret=%d\n", ret);
-		return ret < 0 ? ret : -EIO;
+		return ret;
 	}
 
 	return 0;
-- 
2.42.0

