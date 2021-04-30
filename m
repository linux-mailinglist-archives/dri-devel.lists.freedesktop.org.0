Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 303A8370135
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 21:31:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 402A26F5A5;
	Fri, 30 Apr 2021 19:31:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 581EC6F5A6
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 19:31:10 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id m12so9345345pgr.9
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 12:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8eS/xTlMU4yanK78QhNrvQNifSXibqIFiplWt/q5L1k=;
 b=KCXSN9D4oQS7LHvR+QV4DLjbh3wWT+E5DDO6o26+KJeDhdxp3/oabXgJ6JLWM/ITAk
 m32+aWrMwB/v67k1x0CqhUfGPA0nCw8TKpMvQAxE5LLuOKLTIp7Xqml50JqzlH+WMewS
 c1JYcYUdemrC5LWNQ4Wgik+63DHfGDjQ/AN9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8eS/xTlMU4yanK78QhNrvQNifSXibqIFiplWt/q5L1k=;
 b=I/U6c/AaKqU5q6Py8JljDr1tYIscnScTcz5GabOfST0QoU45VTjRymSUDkCV9iuyy/
 IEHTR3vLqhTSdPgEa3Npi8M1MQZ3cCgcf+SZYLgDzTXLKNGkhvahA87cqaQxQxL9AvjD
 S4Fxv+8QhY09XLChteiQBtKjKmossNFImA37Q8VSCDOrdPNAUVXd1y7yW+B5CnDUaXZr
 xVW4NBCfGz1qxkKvG2TpHylCysvz7jykl41KGk7W5GY9j/EIa7FIYYtV5WCJyiKJrT1J
 s9ND0MU3Std12P+65uN9uZgCwXwEEIrLbeI+3adZLjr3Yg3jtwSr7jC7yEo+TlRN6w/c
 pZnw==
X-Gm-Message-State: AOAM530LKeoVqnAf+XcZqIs7IzHJGxr+9mzi779xa2nCOzPnkuyR4xC3
 v/i8Lsx3KQySNjEYqbT8ewACww==
X-Google-Smtp-Source: ABdhPJw7m54lXAmk14ck5GErFdHIHCneNa/To8KxUQnr1t8xPgf4X7+p/TbfUiaShg6zqh7RyFnTcw==
X-Received: by 2002:a63:e443:: with SMTP id i3mr6203308pgk.114.1619811069954; 
 Fri, 30 Apr 2021 12:31:09 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:dacb:8fee:a41f:12ac])
 by smtp.gmail.com with ESMTPSA id t6sm3143500pjl.57.2021.04.30.12.31.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 12:31:09 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Rob Clark <robdclark@gmail.com>
Subject: [PATCH 3/6] drm/msm/dp: Drop malformed debug print
Date: Fri, 30 Apr 2021 12:31:01 -0700
Message-Id: <20210430193104.1770538-4-swboyd@chromium.org>
X-Mailer: git-send-email 2.31.1.527.g47e6f16901-goog
In-Reply-To: <20210430193104.1770538-1-swboyd@chromium.org>
References: <20210430193104.1770538-1-swboyd@chromium.org>
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
Cc: Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <khsieh@codeaurora.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This print is missing a newline, and doesn't really provide any value.
Drop it.

Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Kuogee Hsieh <khsieh@codeaurora.org>
Cc: aravindh@codeaurora.org
Cc: Sean Paul <sean@poorly.run>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/dp/dp_panel.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 9cc816663668..88196f7e4406 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -141,7 +141,6 @@ static int dp_panel_update_modes(struct drm_connector *connector,
 			return rc;
 		}
 		rc = drm_add_edid_modes(connector, edid);
-		DRM_DEBUG_DP("%s -", __func__);
 		return rc;
 	}
 
-- 
https://chromeos.dev

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
