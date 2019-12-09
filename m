Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7AD118278
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 09:40:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E9DF6E82F;
	Tue, 10 Dec 2019 08:40:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEB77899D6;
 Mon,  9 Dec 2019 20:32:40 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id d62so7577557oia.11;
 Mon, 09 Dec 2019 12:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QcDMXx7JLbsJ2UCoZNJKLtfB+ZkWm+OkWxKRuqwbsNs=;
 b=ii5EIKHBMaUVjEe/pz16DIxXm7wIOI19PiJzZ/jRWPQdu6FJoVjJ0CDB9uIbNL4bhT
 B+rmUwsjdnM2DJtFKideItEvY2CMBK4T3nHz780Don2HA/9AaYPso9dyQbR5SUcHq3JX
 DNgFjgLNLcjaMR44m6YmsQZWcYZ+y8sobtakx0B+rV8O9haEKPhcG+p0HcED+hMfw42b
 2Ci7tVAleD761wJTbclrhtNiWcs1HAkGMLdIOXbXzYElCdYa3Z8DM9A4XPGaD8On7uqS
 th3RknfkyGEL09MbE6gt382YWYtvPpxrUVO0vcp8hRazfg5L+22guUXO3hfiasrzmIHZ
 aVqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QcDMXx7JLbsJ2UCoZNJKLtfB+ZkWm+OkWxKRuqwbsNs=;
 b=h3AkFUGNi2LfqhBHtDWQ/xZjxVPGnpyh78exf64XWWhn1RhzwHyseEgsalq6KuayCV
 XogylTGpQ9evJ8RlCgP7pUk4OvJ6pO3yZhDla955syUOpozNn7vfnm5xjvhd98AQ9UjJ
 waoGtJX5pHWim1Xi26EYQDUWGC2FTYn1ZEYJaHYRRr5IhRBId3nEOzpfTx4HK5DGrmpz
 PEV9Yu6fKPM9adngSPbK+dzW5PUjHnxomaiWkzKy7F2pzrSedlvVgsXmi9guqX8jwV6D
 m0o/mMCSDxymLUiLo1Btisn32XTgsAnviBjI1+xL56SOCbDw5yOSLEuhdf4G0+XE4xOk
 oX7Q==
X-Gm-Message-State: APjAAAVGrCkh7Kf8GCwnygE3Dr7USGQojI1tAdyHqTS0x9gOkNTwFerr
 qIlLkuds27zp8OpOKCcA/yg=
X-Google-Smtp-Source: APXvYqwQiJRdqznvLkCjZMRsuRjsUdi2zEVecgF+rxwnBIHpEw9DLBMn1AR7VjFqiDCXnvZTVFexsg==
X-Received: by 2002:aca:570f:: with SMTP id l15mr917514oib.120.1575923559992; 
 Mon, 09 Dec 2019 12:32:39 -0800 (PST)
Received: from localhost.localdomain ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id f3sm368332oto.57.2019.12.09.12.32.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2019 12:32:39 -0800 (PST)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>
Subject: [PATCH] drm: msm: mdp4: Adjust indentation in mdp4_dsi_encoder_enable
Date: Mon,  9 Dec 2019 13:32:30 -0700
Message-Id: <20191209203230.1593-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-Mailman-Approved-At: Tue, 10 Dec 2019 08:40:04 +0000
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, clang-built-linux@googlegroups.com,
 Nathan Chancellor <natechancellor@gmail.com>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Clang warns:

../drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c:124:3: warning:
misleading indentation; statement is not part of the previous 'if'
[-Wmisleading-indentation]
         mdp4_crtc_set_config(encoder->crtc,
         ^
../drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c:121:2: note:
previous statement is here
        if (mdp4_dsi_encoder->enabled)
        ^

This warning occurs because there is a space after the tab on this line.
Remove it so that the indentation is consistent with the Linux kernel
coding style and clang no longer warns.

Fixes: 776638e73a19 ("drm/msm/dsi: Add a mdp4 encoder for DSI")
Link: https://github.com/ClangBuiltLinux/linux/issues/792
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c
index 772f0753ed38..aaf2f26f8505 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c
@@ -121,7 +121,7 @@ static void mdp4_dsi_encoder_enable(struct drm_encoder *encoder)
 	if (mdp4_dsi_encoder->enabled)
 		return;
 
-	 mdp4_crtc_set_config(encoder->crtc,
+	mdp4_crtc_set_config(encoder->crtc,
 			MDP4_DMA_CONFIG_PACK_ALIGN_MSB |
 			MDP4_DMA_CONFIG_DEFLKR_EN |
 			MDP4_DMA_CONFIG_DITHER_EN |
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
