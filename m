Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0441D649580
	for <lists+dri-devel@lfdr.de>; Sun, 11 Dec 2022 19:02:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E50410E14A;
	Sun, 11 Dec 2022 18:02:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB61910E11A;
 Sun, 11 Dec 2022 14:09:11 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id p24so9520694plw.1;
 Sun, 11 Dec 2022 06:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nhSojJ9yRAAYuIv29QcWwuo3qzXukFj1p0NiP/vbUAU=;
 b=KgvzcVH6VhLTX0T0yUhpBIYGBPo5c7zDiH5COSkrWoYp1cWtEJ1oCv1Da9OuEROKXx
 2FJOkLlt/C1oCwA/Vl2yzKYEZ9Ziyrh0Jkyi+zk7Gq/dFHfC6id/u4wpOVXH6RUjOcUJ
 FATR08gCW+6VmuvkdFB5xqmpbA9/9j022gFPev+CIzk7axVyc+MSQu5oSZ4Mz5AT0f+i
 SU37RfpmD3hLVp6B8jWuNMYQR3q2JPaCdMQ5YsoTll9HG+psE9HrVQgKSWDxYlY0IwW7
 fzqeDvLPg0zTGszU2TnTHMVfXZl7G8NsAVKO21MxEgZ52X3zK/SjYMdjLcQ0uWQcMrLU
 5KsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nhSojJ9yRAAYuIv29QcWwuo3qzXukFj1p0NiP/vbUAU=;
 b=CSZcCHbIEF9GZAZjKd5Eqi3Q6w9Qaaa3c7GgGxe+rHGqqlDeecP+rkZFtQ92qyVYe1
 uYjW/vUlCaMa297dozwzlz5Be14FXPSG7s+xa6WrrVl+1MSNtUljR5kRIFMk5eQf+V+G
 4rb8d3oLYSNSeqZmHEQVdv4e3ush5aA/A08O3N6y3Fs8slDo1IzGNt/kFy6VNJ/I7BGF
 1mCRwKQQCwBzOBXR6xYjZ02dnZSlzM6bOnKjBTpBads85I36zugKqgnRhYHY5RacyPqN
 +eSfQ7xyXcA5YasMoOs03HhWA2q7g2rYV8aW/dkgClIqIfqvN84In5E8AobnwB06Kon5
 N+JQ==
X-Gm-Message-State: ANoB5pksD09k0Y2ryJBJZFhiiTyh07n2FEJ1jHUj3xQl8W2/dsTvkf8B
 rwutGmz3OigurIUjhngpvy8nsX/JB8WIL02qxJY=
X-Google-Smtp-Source: AA0mqf6zImP1+m963p8Iku+ggiohU+Xgzv3zEPE29G5VfW7nDYqOiGwm9V6ehWybc9wu/Y1IqyzQZw==
X-Received: by 2002:a17:902:da8c:b0:189:da3b:17a4 with SMTP id
 j12-20020a170902da8c00b00189da3b17a4mr17818599plx.18.1670767751142; 
 Sun, 11 Dec 2022 06:09:11 -0800 (PST)
Received: from localhost.localdomain ([14.5.161.132])
 by smtp.gmail.com with ESMTPSA id
 d6-20020a170902654600b00186b8752a78sm4390118pln.80.2022.12.11.06.09.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Dec 2022 06:09:10 -0800 (PST)
From: Kang Minchul <tegongkang@gmail.com>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/etnaviv: Remove redundant dev_err()
Date: Sun, 11 Dec 2022 23:09:05 +0900
Message-Id: <20221211140905.752805-1-tegongkang@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 11 Dec 2022 18:02:33 +0000
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
Cc: Kang Minchul <tegongkang@gmail.com>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Function dev_err() is redundant because platform_get_irq()
already prints an error.

Signed-off-by: Kang Minchul <tegongkang@gmail.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index a31eeff2b297..097fa9034ee8 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1771,7 +1771,6 @@ static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
 	/* Get Interrupt: */
 	gpu->irq = platform_get_irq(pdev, 0);
 	if (gpu->irq < 0) {
-		dev_err(dev, "failed to get irq: %d\n", gpu->irq);
 		return gpu->irq;
 	}
 
-- 
2.34.1

