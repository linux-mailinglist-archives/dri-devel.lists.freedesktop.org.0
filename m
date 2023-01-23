Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 179376784FE
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 19:34:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 717F910E53E;
	Mon, 23 Jan 2023 18:34:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1630D10E541
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 18:33:58 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id z20so10341320plc.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 10:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=edgeble-ai.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KluKCAa6YX6SEiHCb+K0lwQ5ic13qC13jJxMxmSzcVI=;
 b=C4jpQxfSZ2yJHpLCVj+hAIMSrI8G2bP4HDxsiKHH2mhPlb5Qnr1iviECTqZm40OLHy
 ezBfDfzr18EBmIq9T9t27i0JJSbFiu0wM0N59v7EuBZGWulqDb4YDp4khewWVzFt6hee
 HAKSXPed8njQMqsB5tkiOe+Re9DRc2sPcTgqeIA9gWX6V+zxLaow9obF2oqLWKGuWgQ3
 AmiQIXvLrLOjPhMCzJknr8ClZn++nhJgBRu6zdGN+Xx/BmRV0u2suaReK4l4Gske6uoz
 Ph+0HntswzEzmVZhImQrY4ragWhlKvo/s/kXol7mZSkOCwoBPo0zQIKa9qEI+xfmzCOn
 EdCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KluKCAa6YX6SEiHCb+K0lwQ5ic13qC13jJxMxmSzcVI=;
 b=RltIVoOswh1upUaU0UKcIXXyxlioz6kQD+OO2LDymCKSpy6uUgnWxZMOeGLggiK4WK
 CjUJug7tHF9oNC45EH2gUcW5JQRb9QvQ81QR7nwXHTNxLEosyYGgl6hjMo+TOBc2jAZp
 lNR1FYYibg+F2frce1wcm8IHuJTK8NNsAYJTHpda2x6K3N+cpCerICVHMTIFVy8GHEbg
 JFB+eRONOLgFtVQ72o6LNQxPF65GDuXHXMKJ3QMt+dHW6KhekB6I4qT4Fz3GbyQ/PRFS
 8EMurXHbkYSept1IzNe31EWOr2MxNI3euM0PVeKdQqLwUK68080k3pCd4iLmt0+8QrLg
 qcfw==
X-Gm-Message-State: AFqh2koabJA7bgiYHnJym2A7hploiQu9aJjIHL0wdvg7Ven/oMti7One
 aYTGpSicPg4TDpZu/MjFks893g==
X-Google-Smtp-Source: AMrXdXsz8iCNIh7gclEAQl+79GWJSSgoEJ4TK4DV8KJTxYei/oYceOEYfjXppbNgZ9OQu0T2BUaicQ==
X-Received: by 2002:a17:90b:3586:b0:229:772c:a00b with SMTP id
 mm6-20020a17090b358600b00229772ca00bmr26415107pjb.14.1674498837606; 
 Mon, 23 Jan 2023 10:33:57 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a15f:2279:f361:f93b:7971])
 by smtp.gmail.com with ESMTPSA id
 b11-20020a17090a800b00b002291295fc2dsm7008684pjn.17.2023.01.23.10.33.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 10:33:57 -0800 (PST)
From: Jagan Teki <jagan@edgeble.ai>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Thierry Reding <thierry.reding@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 2/4] drm: panel: jd9365da-h3: Add Radxa Display 10HD
Date: Tue, 24 Jan 2023 00:03:10 +0530
Message-Id: <20230123183312.436573-2-jagan@edgeble.ai>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230123183312.436573-1-jagan@edgeble.ai>
References: <20230123183312.436573-1-jagan@edgeble.ai>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@edgeble.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Radxa Display 10HD is a family of DSI panels from Radxa that
uses jd9365da-h3 IC.

Add panel support for it.

Signed-off-by: Jagan Teki <jagan@edgeble.ai>
---
Changes for v2:
- new patch

 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
index 48c1702a863b..729a276e590c 100644
--- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
+++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
@@ -452,7 +452,14 @@ static void jadard_dsi_remove(struct mipi_dsi_device *dsi)
 }
 
 static const struct of_device_id jadard_of_match[] = {
-	{ .compatible = "chongzhou,cz101b4001", .data = &cz101b4001_desc },
+	{
+		.compatible = "chongzhou,cz101b4001",
+		.data = &cz101b4001_desc
+	},
+	{
+		.compatible = "radxa,display-10hd-ad001",
+		.data = &cz101b4001_desc
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, jadard_of_match);
-- 
2.25.1

