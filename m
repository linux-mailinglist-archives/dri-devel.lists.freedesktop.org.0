Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BD32F4D85
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 15:50:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 709466EA12;
	Wed, 13 Jan 2021 14:50:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AFED6EA4A
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 14:50:17 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id a12so2391149wrv.8
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 06:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9f2BPaI0FPEfwHACkMCkRxYDyaBt02TKR4D8xELwApI=;
 b=zc9ZOpEUI+Nh6Qla1WDfrb2vnRL2q84hQM50XEQXQr0xU371apuDwreUQOZKKSgAr5
 g7a1pROIkw2JAlYrfbUiig2HWLqwWHy8HZ/XWWBHtiDNKwj55UxEgroLjJuCBw18hlHe
 92MAeh9s6TSYlS6N3UHBcggv18NhVPSGxCug7FAilAYfafpZsRbkQDlYTKiORivlccUP
 9LS1k+4OMMbCziBfn3XobchtVgfVFJZSPwFyAo4AnK1qxUYR+KRpOnUOlfLckY0T7SBh
 WIy1YBvftA/oJxDxlPln0TX3wEE3MMUxIU12tVxKSgY+5mviYsZit9GALu0OnFxLsu+0
 HhzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9f2BPaI0FPEfwHACkMCkRxYDyaBt02TKR4D8xELwApI=;
 b=LDSQlpwt13xktI1vkYMDDN8lY3Af6TYpxPOlpnxH1fgNL7b/HdVqgaqiyy3101BAGI
 HdocZ1Fa0FVbkxcv1yUb9CdkhRWfPAUPf9T3PGEbhXoT39rfmuePr/RwrG4BAVcqtdDx
 vo6/Hz+AmDt7E8WNS25TvpGdYnbn4PtaTaTxcbl9LFAlwiSGpVn6EJFdHCrJkwrEP2xr
 gpowk11n0WzrvyIMgoQWgH611cQKmrbujxpYrck4Y6FqKzQn4CboE/yVXwDzz80OwtPt
 ZX2j1U2TGeVKv7j//8A7iYQnQFC4N7g4BblUwdA9CjK12IJbRqb2r3t0WXedJC/ieD/2
 g8fg==
X-Gm-Message-State: AOAM530D5xlliO/bnFJtM6gkYFzt206cPsZTXIJZInex6qFtpLG63vyq
 zUx3z/fvLQqQpRsOzXr5ciIWzg==
X-Google-Smtp-Source: ABdhPJzvNk0my33Gw7zgd1XA3cpG4wONGFNN2ELceKXzyI59SQd9sR/5sbIBr/pV5XoFHhHHEN2b3g==
X-Received: by 2002:adf:f4d0:: with SMTP id h16mr3060914wrp.30.1610549416231; 
 Wed, 13 Jan 2021 06:50:16 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id t188sm3273433wmf.9.2021.01.13.06.50.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 06:50:15 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 02/31] video: of_display_timing: Provide missing description
 for 'dt'
Date: Wed, 13 Jan 2021 14:49:40 +0000
Message-Id: <20210113145009.1272040-3-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210113145009.1272040-1-lee.jones@linaro.org>
References: <20210113145009.1272040-1-lee.jones@linaro.org>
MIME-Version: 1.0
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
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
 Steffen Trumtrar <s.trumtrar@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/video/of_display_timing.c:58: warning: Function parameter or member 'dt' not described in 'of_parse_display_timing'

Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-fbdev@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/video/of_display_timing.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/of_display_timing.c b/drivers/video/of_display_timing.c
index abc9ada798ee8..9f21f7dc85292 100644
--- a/drivers/video/of_display_timing.c
+++ b/drivers/video/of_display_timing.c
@@ -52,6 +52,7 @@ static int parse_timing_property(const struct device_node *np, const char *name,
 /**
  * of_parse_display_timing - parse display_timing entry from device_node
  * @np: device_node with the properties
+ * @dt: Display timing information
  **/
 static int of_parse_display_timing(const struct device_node *np,
 		struct display_timing *dt)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
