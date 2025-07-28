Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DDCB13DCE
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 17:02:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0115410E046;
	Mon, 28 Jul 2025 15:01:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fvQ1Dr4Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C655210E046
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 15:01:56 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-451dbe494d6so51229425e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 08:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753714915; x=1754319715; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=flhQz+oKLnZT94KLuCojRHNjvO6btRHcQ6GrLs4QzHk=;
 b=fvQ1Dr4YQMQMN2IgZaKkQ1brxkVdqs0a+kXv6IJVB2pp4QljeUe4r3V9V2nu7jIa4O
 bbFfg0LiMBzK5kdHfUyO/9mIDEHGSy/aXkvXK15N1I3URHzAy5fnjaS7gFqn57q4ZpKW
 SG++eky9iVQRNi51d9p5Z/u3wne27HVIHR4otttNweJ9cpB3it1TRLLxMah8JaALrNQy
 978DnMI47DbsJxGu02IDxm+s4UjSEC/6sxOJrUp6JB6MnDSc7DaMYOm9N0yRbdAOifuK
 lS7jQV0s6yCsLOyt3XKJYG+8yIUaItqk2NpJoeDS82c8mN9m66+Nl8Is2UNFnVuKbbcm
 pFkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753714915; x=1754319715;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=flhQz+oKLnZT94KLuCojRHNjvO6btRHcQ6GrLs4QzHk=;
 b=ExEFctGjZyJi4Z5vx93aduTFUvbRohjt15tYZtPnNLAuwS/sTjxzAvPc9SwAFNIxie
 o7FHt4YxT5pGilsPlFGHbNGRgFv/4xxlI9K98dFP/xEbh2Yb6TbnGF+8oirXywJu6gme
 0KtnOcLYBXdUl32PYEmzWbL+/kSuU+FJipNDrJoPdb1IJRe5Ler7dkUnVZVdu/KrQGNQ
 8AItW1ZkeSZz4ObDECKTjkTFcaZmDgeGxHJ4Goo+ynb+X53YuVzgNPthtTXftDBUHFL7
 T8VRLw3/gRggG07ME8muORHd0WCkxD49M3qohMaF4f/N4E52uQDbI3QrX53DfULomSZJ
 fo4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqUEaspLdmrjMZrKedNswHbvLLpE6HVANa0n9U3LV/Uhvq8ppmOcvpli9W+qFLsLjg/F8I6SOxUTk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yztr7ajeEi8/vE4tMK1TTwo+C6E75hCbvzFLYveG8b6ucdlEiv/
 HpdsGFSX6DGZo0WxYm6H2Bdb882gTu2bsd+KgDUWsSa8I9zyzuwaLM+o
X-Gm-Gg: ASbGnctQhA1rhJSfm8HaprvqfygTuUNoZ6ME3VObrOS5SnXCCxObwJwf81NX31BVOsV
 QvrbtkYK9Xn3gMY6GXJdOGeQ7fTNmvqz8klB8eOnbGM0hM51UI5/LSE1NozR4NRx8fc82+h9GVl
 Iom2y3H5ZOJs9W1RxrLJehgOVC1yN51yM8KhiwQp2N9LuasHykyUsqlD4teI2ll89ESqlnpXCb/
 PyHsTRqHrIC8IfXV4hlGmVeQbPmQkSFVm0iGxKBqOOJWwUCSSX7G9c3ualn/ASIFkCRrEZQmyxL
 ucJmK1FY42Ar2F2pCvp/buAoNcwrmtVxeGwu03wxkHQ1KvMtzvdscgy4hsW2m2YcmBc570h5tGd
 GPjbJ4pT3xLunLREwIXPX1lGpXh/BCc7hzKiih0nNTRi2I92WHVb8oVzR5JSM3LwX2oXXTorBrw
 5j7VlKechuz8jFXQiKgpFBsq7M
X-Google-Smtp-Source: AGHT+IGZdP8e3c/rD63Cm6B4McS6Zx6BBew5GRV14fuATFodAREoxJWCcZE+w7O/EVkJ+OGcfwpBZw==
X-Received: by 2002:a05:600c:3ace:b0:456:1611:ce85 with SMTP id
 5b1f17b1804b1-45876549d0dmr93503725e9.21.1753714914738; 
 Mon, 28 Jul 2025 08:01:54 -0700 (PDT)
Received: from toolbox.int.toradex.com
 (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4587abc2798sm102590355e9.7.2025.07.28.08.01.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 08:01:54 -0700 (PDT)
From: max.oss.09@gmail.com
To: Max Krummenacher <max.krummenacher@toradex.com>
Cc: Adrien Grassein <adrien.grassein@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: lontium-lt8912b: Do not generate HFP
Date: Mon, 28 Jul 2025 17:00:50 +0200
Message-ID: <20250728150059.2642055-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Max Krummenacher <max.krummenacher@toradex.com>

The datasheet of lontium-lt8912b doesn't require blanking during
the HFP period. Thus use LP during HFP.

Tested with a samsung-dsim (i.MX8 MM) and a tc358768 DPI to DSI bridge
as the DSI host.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>

---

 drivers/gpu/drm/bridge/lontium-lt8912b.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
index 3e49d855b364..760d89493276 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
@@ -494,6 +494,7 @@ static int lt8912_attach_dsi(struct lt8912 *lt)
 
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO |
 			  MIPI_DSI_MODE_LPM |
+			  MIPI_DSI_MODE_VIDEO_NO_HFP |
 			  MIPI_DSI_MODE_NO_EOT_PACKET;
 
 	ret = devm_mipi_dsi_attach(dev, dsi);
-- 
2.42.0

