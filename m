Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD0D45E3B0
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 01:32:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B6506E200;
	Fri, 26 Nov 2021 00:32:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D9576E19A
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 00:32:30 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id 207so15363340ljf.10
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 16:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9zxxPurAOayOI5k8xCP1c5Dwmp5PuzCyvgFFBlIyeu8=;
 b=B75/NmrMNxEa1jk+XqTYqmWFQwGwSRzSYogVYVlas6FZgcwF4ZmcgmMS581RJFUKdf
 PuNfI3MVlc5HeL+JiNRVuwHAxhHS/JVisWGKMNKKesZn5EWv9U73cdZRtmOZU4MFTvQo
 CG4EmkLn5Rl4n2Ce+xFBibNAYmNywCGTUfJEHcvNfVtqg0JN3mCiP5gxXOqDwxmkfyFf
 nrg4GCfesAiwVcEvuvqpD/jOskmaa0D/j177ZIiEXrEj5GwyXdyMKxKdU6GI/BUzcsu4
 YWapH7nmcs4uhfLzG1Q+sbz2zD3Gffach5QwV0sziXBU7JueFZHx79Tr9rtc/eYBfU3j
 olGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9zxxPurAOayOI5k8xCP1c5Dwmp5PuzCyvgFFBlIyeu8=;
 b=0WYSXC9yGvePzwyElUAnauMZBa9NYgNSSx4OZQHgynJCAqnRmItcpXEjJJlTRr8rQ1
 BOOf7jQAv0Nj9kgXH99XLCuuFLyVy+spsqtvC+GMLDGMA0yFMdPfC/7a2iEojjjMeghm
 ksAr6qXgv1foMl5/e6jt0qeiBnOyEBzBIGcFIseuhoE3pXPQC2yT3EGPvxPDRfo1Q8mB
 S1vkwD4P5txOMn3/pDkpZxo388ADugL2Zmfsnvdj8DVfEMcTocsC/dluFFPQUJhGw4xQ
 kSjsD0qOEiAmGcaLDmEh68zE9jSjjRuRETGOW+vnvax0ijVkEz+4f1TGl7kRcUDNRV0r
 F0/g==
X-Gm-Message-State: AOAM533pNl7pjzvwyzGh1nkM/SDNUzGvNYOVklrFW4oLPUmWyzk7jNsX
 VEd+IPx/+lZtpgKeQwdcRLSiZXNL0ZJNYQ==
X-Google-Smtp-Source: ABdhPJwtgkGmQFw8MHypVgwxcPXSz6OPwevU2ZFCZ5PdXKjzvDST7ym6kYJ7dKWaImbzOFWxheVuBg==
X-Received: by 2002:a2e:984f:: with SMTP id e15mr27903691ljj.427.1637886748722; 
 Thu, 25 Nov 2021 16:32:28 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id k13sm417812lfo.300.2021.11.25.16.32.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 16:32:28 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [PATCH 2/2] drm/ bridge: tc358762: drop connector field
Date: Fri, 26 Nov 2021 03:32:27 +0300
Message-Id: <20211126003227.1031347-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211126003227.1031347-1-dmitry.baryshkov@linaro.org>
References: <20211126003227.1031347-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The tc358762.connector field is unused. Remove it to save space.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/tc358762.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
index ebdf771a1e49..930e19dfb329 100644
--- a/drivers/gpu/drm/bridge/tc358762.c
+++ b/drivers/gpu/drm/bridge/tc358762.c
@@ -61,7 +61,6 @@
 struct tc358762 {
 	struct device *dev;
 	struct drm_bridge bridge;
-	struct drm_connector connector;
 	struct regulator *regulator;
 	struct drm_bridge *panel_bridge;
 	bool enabled;
-- 
2.33.0

