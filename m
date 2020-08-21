Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CD424D769
	for <lists+dri-devel@lfdr.de>; Fri, 21 Aug 2020 16:36:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 434AD6E158;
	Fri, 21 Aug 2020 14:36:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A4A16E158
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Aug 2020 14:36:50 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id s23so1311634qtq.12
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Aug 2020 07:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=yQN46lpyAPNNWWBfWTzHxvUthW1yTywU7QOASv0xQHA=;
 b=P2mEG0QSRfqmF/5mf3Pc4bSfnfh+X83ehFeeCItpOhrfEbDEqEx1K9zwldvvPIaJXT
 MZfxemkoiQd/M9qOO4a3s2rpdAnNcTwRYa3sYdsMyQrdHjaNWApbJe4Fipcq0PsNY0Ht
 OQ3+jhkbJoNExyhZZr8FA/jeCzVogxYDH0cyQAuwiEpGlMz7cqIyvwNI7R9Q0P9rv2cp
 mUSYu6f0WglQ//TDW+L5IihL079prZaZgD66xHqkMXJjcFFFZ2hKkSMsJCWKguYRfeqM
 //AM9xqxu6s5EZEHujWnWdedZcgHeoX5ihOA828RgaryyDGYXKV/eQP3crLELM3iayaJ
 k7Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=yQN46lpyAPNNWWBfWTzHxvUthW1yTywU7QOASv0xQHA=;
 b=XJgyMHoUkjIglEzcm3tp9ZXk54iENegP/L7cQd8+kmYrytDSQRfdOQARS/AEKMfnQo
 DHEy1G5oy055VOl27L2aqBxUiPaIfJVK1qZLYKRGgQH1CLGijcVnkjfg0ZC4vwcRrAod
 /QQt6rVa1Ofi8RX7Ml3wAIBdfx2yvdWQk0VWT1lLODXYf0WeqOqmJX/T9qcG1Iba6WfS
 zG889pddGp5fnrMN+si01RRmEqpr4rQXySpRe3U4UeHkU7XTZmWqXErmv5jpQ1DsIsVz
 H49pc7brkbEEKXsegzFVKa38V2pWh0fX9vJPJLeaYnQwpgcMNz7F9R6vOToRLINN4Pak
 2mWw==
X-Gm-Message-State: AOAM531ELacOJff+yGfWVq+jTdSSnCZHOuDCDNceRRZ8rmpxTe6KM+o9
 suluruW31rl2UewHF6eGIUE=
X-Google-Smtp-Source: ABdhPJzF6DHaEeXyhAkGsVu+5nq2M56IWGdwFLGqUBXsUXff9cDG42UsIW/ndAu80USr5e7loQl5aQ==
X-Received: by 2002:ac8:7152:: with SMTP id h18mr2937260qtp.44.1598020609170; 
 Fri, 21 Aug 2020 07:36:49 -0700 (PDT)
Received: from localhost.localdomain ([177.194.72.74])
 by smtp.gmail.com with ESMTPSA id e61sm2192205qtd.20.2020.08.21.07.36.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 07:36:48 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Subject: [PATCH] drm/rockchip: cdn-dp-core: Pass __maybe_unused for the
 suspend()/resume() hooks 
Date: Fri, 21 Aug 2020 11:34:29 -0300
Message-Id: <20200821143429.13083-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: hjc@rock-chips.com, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When building using a riscv allmodconfig the following build warning is
seen:

drivers/gpu/drm/rockchip/cdn-dp-core.c:1124:12: warning: 'cdn_dp_resume' defined but not used [-Wunused-function]

Pass __maybe_unused for the suspend()/resume() hooks to fix the build
warning when a defconfig does not select CONFIG_PM_SLEEP.

Reported-by: Olof's autobuilder <build@lixom.net>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/gpu/drm/rockchip/cdn-dp-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index a4a45daf93f2..18e4de116630 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -1107,7 +1107,7 @@ static const struct component_ops cdn_dp_component_ops = {
 	.unbind = cdn_dp_unbind,
 };
 
-static int cdn_dp_suspend(struct device *dev)
+static int __maybe_unused cdn_dp_suspend(struct device *dev)
 {
 	struct cdn_dp_device *dp = dev_get_drvdata(dev);
 	int ret = 0;
@@ -1121,7 +1121,7 @@ static int cdn_dp_suspend(struct device *dev)
 	return ret;
 }
 
-static int cdn_dp_resume(struct device *dev)
+static int __maybe_unused cdn_dp_resume(struct device *dev)
 {
 	struct cdn_dp_device *dp = dev_get_drvdata(dev);
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
