Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F5743E62B
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 18:34:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 604F26E05F;
	Thu, 28 Oct 2021 16:34:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 604B86E05F
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 16:33:59 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id y207so9038982oia.11
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 09:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nem2XTY5QU11TIb5tpm+rntM/cfQ1YaYLiw0IXoaZ+w=;
 b=Y3qFNcE15hVggRrMhiAeClG/Hnfm+SplZEeWKDF6zQdWbTj1BeHIubrS60YhBSk9FD
 6NshmXy756/SwcXKW7YKdIa1eKHzXYn7Sv0sCtio1Rc0MsZxsVULUDOTwj2Vue+T+FMI
 C0cChZdf1dEZGcbEFPab7NJ153OsC19SbmM88Xd5Zpe89W49OIEiFs4G8p3/Uui7TuXM
 e/F4QKlhelC1nXa0FSH5uWEaREI7Pg6Jhof/tmCZRqlp5X4XCAqpYVB8AiHqzG6LBzVu
 qhMe8xxNj6xIa1xQjFM3vadRTjG8vKWDaarULUoL6E1jbwVrc/sn9hdJGg0jBl/UKOaV
 e+Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nem2XTY5QU11TIb5tpm+rntM/cfQ1YaYLiw0IXoaZ+w=;
 b=vJK0JPtiCy73y5o55iEMx2S78LwBCwje5YAZULeG5JBoKgbIikv9HFRWy+G/FCI1dY
 jLplXyjLs/Zx4hcuC308WX5zs/jIO3JJn3qw4+hO8KJD9DSCDedw6cnfAR+CVrOd4NLu
 JQsNYh4Wd4WzSJ5yP7h/J76STPnX9ZlsoaQl2bEYYsXsHOYGLXMgrJjXynKgL7eMoM2m
 4RRoxMIR9lVsOPrgZP/zp/UpVzD5t9Erhkb70fvBGG3N38dqInssSebOt/ptOVApSmZY
 0OlTe0mET5Ew3af0OOd6yi2x6sxOE0hibV9E6y2vuTarok6PoVCOJ+FD/01M3UQ0dDAy
 RhEA==
X-Gm-Message-State: AOAM533zdgtK6lI6yDZ737glrVs+TfgeAvd68PjfF0w3jr5MMJr2yKcz
 hjZ4HZRXolf3ZFoZTikQgGlnyQ==
X-Google-Smtp-Source: ABdhPJwtlHeKphy+Nfalit6/5el3VVG+6AjCVfyW9NdfXB5zsE959C+I2Txn2mrMSl4H3Eauhv3f4Q==
X-Received: by 2002:a05:6808:1a0c:: with SMTP id
 bk12mr3929768oib.48.1635438838563; 
 Thu, 28 Oct 2021 09:33:58 -0700 (PDT)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id x13sm1058721ooj.37.2021.10.28.09.33.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 09:33:58 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Robert Foss <robert.foss@linaro.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: [PATCH] drm/bridge: sn65dsi86: ti_sn65dsi86_read_u16() __maybe_unused
Date: Thu, 28 Oct 2021 09:35:48 -0700
Message-Id: <20211028163548.273736-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.33.1
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

When built without CONFIG_PWM there are no references to
ti_sn65dsi86_read_u16(), avoid the W=1 build warning by marking the
function as __maybe_unused.

__maybe_unused is used insted of a #ifdef guard as it looks slighly
cleaner and it avoids issues if in the future other permutations of the
config options would use the function.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Robert, I believe you pushed out the driver patch introducing this issue
yesterday. Can you please add the relevant Fixes?

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 430067a3071c..e1f43b73155b 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -215,8 +215,8 @@ static const struct regmap_config ti_sn65dsi86_regmap_config = {
 	.cache_type = REGCACHE_NONE,
 };
 
-static int ti_sn65dsi86_read_u16(struct ti_sn65dsi86 *pdata,
-				 unsigned int reg, u16 *val)
+static int __maybe_unused ti_sn65dsi86_read_u16(struct ti_sn65dsi86 *pdata,
+						unsigned int reg, u16 *val)
 {
 	u8 buf[2];
 	int ret;
-- 
2.33.1

