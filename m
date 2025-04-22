Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 492DCA97A69
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 00:24:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E82A10E63D;
	Tue, 22 Apr 2025 22:23:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EV9IOIhr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAE7F10E63D
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 22:23:39 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-43ce71582e9so45928145e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 15:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745360618; x=1745965418; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mpjNdoT0vNqdUgGK2l3zCpCt4Cszl2krvQ+lX887CvY=;
 b=EV9IOIhrKow3JeDU2tbBMUfvqUYFZwOG4XZ7VAo8jX3z0kjmemcmiGgUAWXiD2Raub
 1fiDmgiQhJrBAEgZWZWy+nEp3bTVgI+tKrrb4B5DlvrCfaMXAwaD9RnZJ6xnlsV1+t7k
 yYMINn70oos8EaOL81UwcRPXh8BfA75E+yvFAxaabwA4ATkSKbItUpFt/q0BdOVQdw1U
 kP/TVaROL77lNiL1cscj7i5btHgUNXP9JvkKPswJ9tIk6yVXfwqaJYu+72YNURk2Epe3
 vDBTwBRlg19wszvK5a3SNCvKeyV+0NmAFmFFoaGe1R4rgvXsHDNbx0Lah624vGNbLfaQ
 /q3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745360618; x=1745965418;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mpjNdoT0vNqdUgGK2l3zCpCt4Cszl2krvQ+lX887CvY=;
 b=lm6CZQ8Z1VpuLwktK4y0TKVUSe0Rc37xG2FRtJv+tL/PHrNmWdLRKUU8Biu4xTjRx/
 192DcqFa1rUjdWDInseoMDBJWn6VkxxxY62r48Ebw6oZgDatpK5XOpHXkm+q2TjTNxke
 /xnP+kQ/8CsKfuDcLhlsribyHAXtROBbMNh34Fh7hIMyLCDePI3zcKGzfpq908/uZeL9
 IO5J6GeiBlfBxscCnabprO1NDUZxa+GCsBCjGFGwuTjRB9+3x+sVGWkGeS2qZ6L8e52M
 cx8/cFLLftmUjEUg1gRiigx9Z7Aw8cnspQMqbUzGvnHNKRdMiTG6vjseIJA6pJRVarmO
 xZuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAun8YvdHckdJN9jJnxuSpKxAmCtO7ErIshTGtqdvM/Zy9atZZFxzPbAVo/By9lZtQByK0ZVsifeM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxoNQQ1yrR8+jSA7xS8ep2o0pR7nbNQzrPfuGAYmFUG4kyPizWv
 Q5U5G+YrtdVcucM2AEnXUbpHWmx0BrkCiT8aGlR4k7cVzFUdk9jZ
X-Gm-Gg: ASbGncsrUs1eF65M1c0lRuHXt98vR7j6gid7TUzQud0I4MH51m1lgRSVu79G9qAfQ3V
 B+pdvbgYG/mqf1aR/wwBkUXpzpj3YkAD8KaPLwncpUJ2n8xbGSy4wBDv6PWRiJsrak91uMoVeHT
 V61u4Gft4iGYh+NFEaPmCi/y2v2HTaN4Awg9fXajh0edwgHo8c6uxj9Lu13/VJ1Fw14Xo/idjCn
 BiSrR7xz0vj5UkWhTMBi7LFZgM5ZYxI/+oJpUXmBTbgNsOTNs4nRCmHRDaMfdK0/89XuAAfN20j
 QBXtTrX/XV0YLcmMmjVoQKNZ9xYWZTdKtyre+cJElg==
X-Google-Smtp-Source: AGHT+IFNDZhu8PiiePLkH2v9nNw6Q1B+/qYMU/BJuoKYhmX0pDLtcnAunVa0MgmlqxO7csezXTThXQ==
X-Received: by 2002:a05:600c:1990:b0:43e:afca:808f with SMTP id
 5b1f17b1804b1-4406ac3d219mr164938315e9.31.1745360617706; 
 Tue, 22 Apr 2025 15:23:37 -0700 (PDT)
Received: from localhost ([194.120.133.58])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-39efa43bee6sm16391632f8f.45.2025.04.22.15.23.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 15:23:37 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Dmitry Baryshkov <lumag@kernel.org>,
 dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/display: dp: remove duplicated check of ret < 0
Date: Tue, 22 Apr 2025 23:23:30 +0100
Message-ID: <20250422222330.90736-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.49.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is a redundant duplicated check for the condition of ret < 0 inside
an if block that also checks for ret < 0. The ternary check is always
true, so remove it and replace it with just return err.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 57828f2b7b5a..af62d99a0d94 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -4044,7 +4044,7 @@ int drm_edp_backlight_enable(struct drm_dp_aux *aux, const struct drm_edp_backli
 	if (ret < 0) {
 		drm_dbg_kms(aux->drm_dev, "%s: Failed to write aux backlight mode: %d\n",
 			    aux->name, ret);
-		return ret < 0 ? ret : -EIO;
+		return ret;
 	}
 
 	ret = drm_edp_backlight_set_level(aux, bl, level);
-- 
2.49.0

