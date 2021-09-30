Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2526841D1C0
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 05:06:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E7686EB40;
	Thu, 30 Sep 2021 03:06:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 449AC6EB3E
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 03:06:00 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id u22so5551673oie.5
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 20:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sDTL0yxYT47N+0jjLEyGdD4ZajCQhNx8OZO23Bvom6A=;
 b=JmtbCmQrhYNDXZGRKfkIH0HRRStQuRwld6nSinEj6CMvOBT4R7SgwLdKRm7MQ+s5hk
 BHJ95SI6qznWSrrLE1GzHC4e7e0ElMKW+mFYfeg9+lqVuTTL9px+5xg+Je2MfUKFe+rO
 hUUcAJp6z370gj87PvvaOgH1Sii++lIJX60jgIUbq4PWXabEz7/XWF2H1eCKnojX4gdi
 KbWjuN0EJ60lQ+k5Cd7A8pR4F1fL9Ogu6x7MNC6htOvwrWwyZ4G6XDZPOsib/Wb1o+XA
 zo3xDDQIPPOyYITYmiqW8yi3U6JIv4FpdStnk3n8v7g87QRSymRD21DIhyvuMcK6ghPN
 C43Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sDTL0yxYT47N+0jjLEyGdD4ZajCQhNx8OZO23Bvom6A=;
 b=2yb/mhaRfuYpU15exV4zRtxIwCQw7w3/ZcDeqcqlxKhDLDS/jXM7ZDt3lZSbugMD7D
 oUzt3OGVgBt7Ckm+0MYUJNiPSPbbjaR5en4+Jke8IJ6o7q9i7bDFFdy4Pnr1mH8BBmWu
 QSOhUh/G1vFWdGPG3JmVEXwcEaqELN8kjlWdKlOwvEgIRL8qIlBQoUXohiCd8Ylh7T64
 R8N48Ea9MVgEANL/e+0lTa019psFsI4GF/FqDRMHDNzY7QX3dWtTl/0j+qK5ff5bz83T
 GVmwJvxIgJobA+fANliqBs0mpPuFZUu01cj2CQNDZx+a0p2uokuUylM8x8B7JjCj9oqq
 o6ew==
X-Gm-Message-State: AOAM532Jd61Navh5dpORYwGtozFI7xC8Jvk7B0hKRFMFgLF7ab69M8wA
 PrAKO+CGZBvc0Hk8O9CyTMkyyQ==
X-Google-Smtp-Source: ABdhPJyMU4NRNdVPX4VQVzdWBumOzePFbf0SAxWbaJBtT3aZzpWvEHxUtWR2iKwvTjKobDiRYR6iuw==
X-Received: by 2002:a54:4f1d:: with SMTP id e29mr880677oiy.179.1632971159696; 
 Wed, 29 Sep 2021 20:05:59 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id s16sm323358otq.78.2021.09.29.20.05.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 20:05:59 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Doug Anderson <dianders@google.com>
Subject: [PATCH v6 2/3] drm/bridge: ti-sn65dsi86: Use regmap_bulk_write API
Date: Wed, 29 Sep 2021 22:05:56 -0500
Message-Id: <20210930030557.1426-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210930030557.1426-1-bjorn.andersson@linaro.org>
References: <20210930030557.1426-1-bjorn.andersson@linaro.org>
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

The multi-register u16 write operation can use regmap_bulk_write()
instead of two separate regmap_write() calls.

It's uncertain if this has any effect on the actual updates of the
underlying registers, but this at least gives the hardware the
opportunity and saves us one transation on the bus.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v5:
- Extracted this hunk from patch 3.

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 41d48a393e7f..412fb6f564ea 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -193,8 +193,9 @@ static const struct regmap_config ti_sn65dsi86_regmap_config = {
 static void ti_sn65dsi86_write_u16(struct ti_sn65dsi86 *pdata,
 				   unsigned int reg, u16 val)
 {
-	regmap_write(pdata->regmap, reg, val & 0xFF);
-	regmap_write(pdata->regmap, reg + 1, val >> 8);
+	u8 buf[2] = { val & 0xff, val >> 8 };
+
+	regmap_bulk_write(pdata->regmap, reg, buf, ARRAY_SIZE(buf));
 }
 
 static u32 ti_sn_bridge_get_dsi_freq(struct ti_sn65dsi86 *pdata)
-- 
2.32.0

