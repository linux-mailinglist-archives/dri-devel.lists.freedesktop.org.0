Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1735A05784
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 10:58:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEAC410E244;
	Wed,  8 Jan 2025 09:58:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LzpKC3hT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D76D110E244
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 09:58:22 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-aaee0b309adso2063693866b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2025 01:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736330241; x=1736935041; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UqzxWOab6evyJePUEZiyqiNeRR2ktAmye9JuSg0gIEo=;
 b=LzpKC3hT4GeuggofN7Vpd1inlNo3crri5A/u1GUpb8wnlNySrvsa52UGSizqx8HLmN
 blZvlFhrLZRF+EPvbnRmKXBKpTZkZXIqpJiiCZDbVQYbAptBK0WekAaU+oHfPAH3/38T
 M3qCzX+YZN36Ol8dmJwLu3P3s81H9lgMBCiXLpLyD1mVAqpOl4ps0IbgEXFUv7IViJyV
 8cHY4B4VIYSEjnulfnVsvVHtJDZfCn4MRQsxorLUkqrrcwD7DQ5xLbY6cgePKSLvjKCT
 rEoiJCJyUVaP+zV6Zk85qa5Un2rT49GbHkxaj6IJLis0H+bAx7ryX4elsFYjItKDg80i
 j6kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736330241; x=1736935041;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UqzxWOab6evyJePUEZiyqiNeRR2ktAmye9JuSg0gIEo=;
 b=bA+pkV+f5BWQCeOJgYO32VtTI6bqwI7sSFpbaJuDTJDpvffU4xnbAqIbAPOjCxwA2J
 /2+6L2rAtAuZPck48ujc/vv6YvN9OKNzms1UodFykglTs0g6hma7/shyXFzuTql7sAJw
 Fk2lfOSTbGzTulgZYxzgEZz4AwLKvjVKkMzhGMCk0OoakU3mHIl1fmD/igyQopAMpI8S
 3LKNxFNq++apRE5FyyF3qLh2Mkn++WfOu/6++PTPaTaaEDgK8vmWxnuISylLOGvbQNAq
 JLjSGp857bKsSIYtyk4DazKiZCKjrtjtmDpWVIGmBWSeGhVDmZIFTURAgqDQdguXxXRU
 UrXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXw6seM1+xjVZuOLhmEnDrVPZ7eb2knqtc0iAQXNVDMGa2XZpfbsZ89f61ZoLAI77O5GapYwFcbogI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1vzfhnuSVPBoydvY3xByr8zPopZ6YyxaCQcczJcCjJu2yxX3n
 athK6Ips3vWWA8KNrHwgTckLTUPL9tJASnKU2JZLtmyDvKvUlWTMkpn48KA4y09zgd6v+iGJoj0
 l
X-Gm-Gg: ASbGncuE5HifG46WdsFJC57evqAMsNdeZBDHFuwLtcCT32O7LdSLa9ZmFgISZyh3qJv
 hKVB+Gj8+aTIDcfzWGOT65y4cWTmdieGsfH6SUHiczjaHws7nrObzjaBsOidQipfnERogIoMAXT
 zFzOPaZ4BhgPaXrXvWMY3UeRfKwcX67T9mYtjqfk4vDTO462NHn+cZ5vDbfN+wVmfDiA+q3eLDp
 06WF4/ahLKOc610DZNlVWsMogrTag5ujHmlzDbCJt0RvCAB2GSphExnnor44Q==
X-Google-Smtp-Source: AGHT+IG5WSBhFOJisgYTUKeIhRXBAfvDEN8YKwZDJA2mb5m6FO3aJNoBZk/2i3G8RcBgch7B0HaYEw==
X-Received: by 2002:a05:6000:1acf:b0:386:4034:f9a6 with SMTP id
 ffacd0b85a97d-38a8735727fmr1340774f8f.57.1736328960701; 
 Wed, 08 Jan 2025 01:36:00 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2ddccf4sm14566785e9.19.2025.01.08.01.35.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 01:36:00 -0800 (PST)
Date: Wed, 8 Jan 2025 12:35:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Julien STEPHAN <jstephan@baylibre.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH RESEND] drm/mediatek: dsi: fix error codes in
 mtk_dsi_host_transfer()
Message-ID: <b754a408-4f39-4e37-b52d-7706c132e27f@stanley.mountain>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is a type bug because the return statement:

        return ret < 0 ? ret : recv_cnt;

The issue is that ret is an int, recv_cnt is a u32 and the function
returns ssize_t, which is a signed long.  The way that the type promotion
works is that the negative error codes are first cast to u32 and then
to signed long.  The error codes end up being positive instead of
negative and the callers treat them as success.

Fixes: 81cc7e51c4f1 ("drm/mediatek: Allow commands to be sent during video mode")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/r/202412210801.iADw0oIH-lkp@intel.com/
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
I sent this patch earlier:
https://lore.kernel.org/all/Y%2FyBC4yxTs+Po0TG@kili/
but it wasn't applied.  I've changed the commit message a bit and added
new tags.

 drivers/gpu/drm/mediatek/mtk_dsi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index d871b1dba083..0acfda47f002 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1015,12 +1015,12 @@ static ssize_t mtk_dsi_host_transfer(struct mipi_dsi_host *host,
 				     const struct mipi_dsi_msg *msg)
 {
 	struct mtk_dsi *dsi = host_to_dsi(host);
-	u32 recv_cnt, i;
+	ssize_t recv_cnt;
 	u8 read_data[16];
 	void *src_addr;
 	u8 irq_flag = CMD_DONE_INT_FLAG;
 	u32 dsi_mode;
-	int ret;
+	int ret, i;
 
 	dsi_mode = readl(dsi->regs + DSI_MODE_CTRL);
 	if (dsi_mode & MODE) {
@@ -1069,7 +1069,7 @@ static ssize_t mtk_dsi_host_transfer(struct mipi_dsi_host *host,
 	if (recv_cnt)
 		memcpy(msg->rx_buf, src_addr, recv_cnt);
 
-	DRM_INFO("dsi get %d byte data from the panel address(0x%x)\n",
+	DRM_INFO("dsi get %zd byte data from the panel address(0x%x)\n",
 		 recv_cnt, *((u8 *)(msg->tx_buf)));
 
 restore_dsi_mode:
-- 
2.45.2

