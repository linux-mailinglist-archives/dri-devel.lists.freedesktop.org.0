Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACD7B220A6
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 10:23:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88A4A10E5BB;
	Tue, 12 Aug 2025 08:23:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="kB2VM+Rd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28C3310E5BB
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 08:23:20 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-76bde897110so4239979b3a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 01:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1754987000; x=1755591800;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P3fGk8RPNzlwTE0goRde9z6mNNC5qXPF4Mfc5wZS3Lc=;
 b=kB2VM+Rdlm6zeGqFq3FNoPmJTfbNI12f5LZohjMxvLPHo4WE9Pdt2oVSx2UN0awdLt
 VasPrGHpvnq//4izyv08Mi0SmaFOL8WAoA/tTVz71gu5edKTvUJ4GngljPvVjiVBsoBo
 GCnz9jrWwVoD02wTcNgUL5WIoQHPlK77Hfiaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754987000; x=1755591800;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P3fGk8RPNzlwTE0goRde9z6mNNC5qXPF4Mfc5wZS3Lc=;
 b=BktlrwIo2kE9sJDUPAj5tnz8UsfIU5urwqr8jswUGQap6B4LVQBcqbZHvadU+ZrGHp
 86lG/+b4fTMxXdtK/kGYkNFxg+Ju6E7Z4x7KGOOnjuhY1bfh3IWMPRqPs5MLiaWdEKUs
 0XJ9wpiF0Aei5fbfyS7qLk2T7jkjyf4FRTM0kyEiAmGXmlu03pPJ4OaseQ1dQIbP6E6c
 s3eh1BsK/8shl6XgoqabGZNos31/8NmTew0BSbqCuVWJdTmOhFyi0kdeH0c+1+cWox0W
 n1sLgL2Y0+eehBSx1SHvmVBpuoLiTI56MUrvHTddLtLHL7q0NI8qLJY1+uQlyOkTfEim
 4ZqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnqT0VARDJ/kdtMdJ4meqq/sOWd1e1q0gmidSOLVwIqrBo6cZn9QRs4ukYdHTgPLjKjN86jzXfjsY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1tqFfg0+JNu21S/7vm8bCtLBCEKq8hSucADdRyn5gPAEjLdtI
 2mpkGKHhS1r5oMiESY9As36ST6YeHELCwxyeEYa2FonPyI0KafPeim2fPMGwDBgCqiVALKlYOgN
 GySI=
X-Gm-Gg: ASbGncvqLoPeDh/ub5qHyG+rhstlLxFfUsN2lAVUU6uTXZbVjvTCZWX4tJK8o2qsGPg
 nupfOJXao25UkAzj/RhmIHTJG804BW+PFzZ6KeYdLQF23WOntJ8pihaUUw8xl2+HKMq7ZlLiDox
 THsyAolQRyu0ydqUvy+/zrG4jZgZHcpkj4sxL3zxq+Ff+5jRSAllWpH9A/WUzJ3r8AnZKHDn0M0
 JuQyqmVHMXKkwQLvjF63dWIHrn3bpy+wgf80FR0SJsrOZ0mymnU7ItFI8QVJM7G5DNfB5Fm0llJ
 Li6qFEywp6Ted6Cqr43QY/QeOKqHZajKg80Ij2Pgo7uy4alPYF72/8PnUmEC5S9ayXvipOFIa+c
 cUbRXu5zLbR4v4aX0gEo1gzPBLSsnMMxEAoSvOFMr
X-Google-Smtp-Source: AGHT+IFIaVxtQml0iOhHXxPcsA5eLK+goYa9RCC9q5Wljt2PSVohymFqS5Fc861BFUfuo2dZnQ70DQ==
X-Received: by 2002:a05:6a00:1491:b0:740:aa31:fe66 with SMTP id
 d2e1a72fcca58-76c460d2c66mr20874497b3a.4.1754986999650; 
 Tue, 12 Aug 2025 01:23:19 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com
 ([2401:fa00:1:10:8e8:f5ef:865c:a4fa])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bf77210aesm22722064b3a.113.2025.08.12.01.23.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Aug 2025 01:23:19 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Hubert Mazur <hmazur@google.com>, Sean Paul <seanpaul@chromium.org>,
 Fei Shao <fshao@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v8 2/2] drm/bridge: anx7625: register content protect property
Date: Tue, 12 Aug 2025 16:17:59 +0800
Message-ID: <20250812082135.3351172-3-fshao@chromium.org>
X-Mailer: git-send-email 2.51.0.rc0.205.g4a044479a3-goog
In-Reply-To: <20250812082135.3351172-1-fshao@chromium.org>
References: <20250812082135.3351172-1-fshao@chromium.org>
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

From: Hsin-Yi Wang <hsinyi@chromium.org>

Set the `support_hdcp` bit to enable the connector to register content
protection during initialization.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Signed-off-by: Fei Shao <fshao@chromium.org>
Reviewed-by: Sean Paul <seanpaul@chromium.org>
---

Changes in v8:
- rebase on top of next-20250731

 drivers/gpu/drm/bridge/analogix/anx7625.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index c0ad8f59e483..609cdb9d371e 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -2604,6 +2604,7 @@ static int anx7625_link_bridge(struct drm_dp_aux *aux)
 	platform->bridge.type = platform->pdata.panel_bridge ?
 				    DRM_MODE_CONNECTOR_eDP :
 				    DRM_MODE_CONNECTOR_DisplayPort;
+	platform->bridge.support_hdcp = true;
 
 	drm_bridge_add(&platform->bridge);
 
-- 
2.51.0.rc0.205.g4a044479a3-goog

