Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D448869094E
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 13:53:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 163BB10E218;
	Thu,  9 Feb 2023 12:53:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 750F310E218;
 Thu,  9 Feb 2023 12:53:33 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so3793696wmb.2; 
 Thu, 09 Feb 2023 04:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0h7PVwX7xOWVpu8EJbubLGeuc2859Qjp2vbcmTCnktc=;
 b=fbnHjjgQI3X7zo0eXFOg5iKisI9B4oh8x8/1bKMPzb8ZMzuB3Mj6Hzyc8BxBl2sThs
 BcZM8fyPY0WexE7gv/xmhq+ltHvewwaZNonHfp4NdDRRZDZfzHhSaqWMI7FmJ31mzSQ0
 3W724Yt0qFOA+KgHgrujZvpA0/U3vUMYzEmkYhqLsEXOdHW/Xj0kkVcPOs1/Bczf5ZX/
 5DC9wLJv5BvfP45faMQ+/jBHfeEdJNxiHLZMt7MP5CCxNzE25yiZ18Nxnl5AAzSkWtoM
 pVJnuIp8bI+8Diot6gTt1nbAUp6dLqsfkHyw2rHC7VsxcEJsd81YezxgnkdvsktZN68n
 081A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0h7PVwX7xOWVpu8EJbubLGeuc2859Qjp2vbcmTCnktc=;
 b=RZR9NbxaZ0LLO/4mPRkcrOTbJiC349fOhSQd1h3V4706TjVZihDiIF53ADEcei1HZF
 XvYGooBXCwTM/aW4tLHxBkORTes+jri7DGTa9pPRx2nwvNfzbYRQuFVrO94Oa/gNr/JB
 wQavJ2TkogAcAlATzaZ6AFBAKk/tsROYEyRiZAiq7n0ZHQeCf3P5LNHCW/chVVjYIeg0
 uf+PuZVCJhGaCjdVuKQCZgser01QPaXm9hjVtkYIcWnSB1BOzP2pgVs14afaqeW3x4WV
 yi1O/th7B9SkmfQTClkalD+rOowJ0Ybxp8UHZlW3zSBiw+cRyhv01ok+EypZ0cGyXRL3
 q/vw==
X-Gm-Message-State: AO0yUKXCpmJzVklVojJBws9rU1+f8Ri4rNZW7HVtOlzDWxDa8crO3lDp
 vEWIm2PfJwZkbwoUqO1eSD0=
X-Google-Smtp-Source: AK7set/e2dVQryskil9JvOXwCVkJylpvCnVrdI6FrmQzPl4/BLKQd9oGbNtLBKUjWNQWYnRrE1z8IQ==
X-Received: by 2002:a05:600c:164a:b0:3df:1673:90b6 with SMTP id
 o10-20020a05600c164a00b003df167390b6mr9442829wmn.39.1675947211990; 
 Thu, 09 Feb 2023 04:53:31 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 k21-20020a05600c1c9500b003e01493b136sm5128690wms.43.2023.02.09.04.53.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 04:53:31 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui.Pan@amd.com, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/amd/display: Fix spelling mistakes of function name
 in error message
Date: Thu,  9 Feb 2023 12:53:30 +0000
Message-Id: <20230209125330.1433481-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The function name is being reported as dc_link_contruct when it is
actually dc_link_construct_phy. Fix this by using %s and the __func__
for the function name.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/link/link_factory.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/link/link_factory.c b/drivers/gpu/drm/amd/display/dc/link/link_factory.c
index 13a766273755..3fc93fc593fb 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_factory.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_factory.c
@@ -452,7 +452,7 @@ static bool dc_link_construct_phy(struct dc_link *link,
 	link->psr_settings.psr_vtotal_control_support = false;
 	link->psr_settings.psr_version = DC_PSR_VERSION_UNSUPPORTED;
 
-	DC_LOG_DC("BIOS object table - dc_link_contruct finished successfully.\n");
+	DC_LOG_DC("BIOS object table - %s finished successfully.\n", __func__);
 	return true;
 device_tag_fail:
 	link->link_enc->funcs->destroy(&link->link_enc);
@@ -469,7 +469,7 @@ static bool dc_link_construct_phy(struct dc_link *link,
 		link->hpd_gpio = NULL;
 	}
 
-	DC_LOG_DC("BIOS object table - dc_link_contruct failed.\n");
+	DC_LOG_DC("BIOS object table - %s failed.\n", __func__);
 	return false;
 }
 
-- 
2.30.2

