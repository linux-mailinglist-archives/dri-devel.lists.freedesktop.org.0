Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BADBD0D934
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jan 2026 17:48:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F4A510E1BE;
	Sat, 10 Jan 2026 16:48:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Zk1QTtEM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4F9E10E1BE
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 16:48:12 +0000 (UTC)
Received: by mail-dl1-f50.google.com with SMTP id
 a92af1059eb24-121a0bcd364so5508267c88.0
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jan 2026 08:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768063692; x=1768668492; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Pymo/XHo3xN1Q0UiU9ynvWIgTsVpB73mCjCSizmghhM=;
 b=Zk1QTtEM98iY61FnsGjypVPQy8rh3Oq11P6aotsTzubGBjiUcTdbC1NW8QPrfF5P5+
 vAXaetwkpGfuI5PzuHOJCEIBNfaqZWDDSsqu6b4iSlZuIudml9yP0G8tgBHwi4H/hAgX
 r6GFMdfEaKYgI4lhHlsyIfT49gQmSXtsjO5zEaFYNQFk0oC9yxWBZ5zk0TuNj9MTisEj
 ZBtwZHT9anLPuTU3KPbACts19VlSYcBjFiskS925udCA3+Q2eURN11ndWTv4O6JEsp3r
 NEumARc7JSNIXBFgWCRmJ/MyhIIJJRjnhCswQXm1TwX2jeA5vM1elSOLKQXGjIK5oVB7
 mNGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768063692; x=1768668492;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pymo/XHo3xN1Q0UiU9ynvWIgTsVpB73mCjCSizmghhM=;
 b=UHL9ACs0hnbCd6ZbSETjW0fOrJqve781akuGoIxtgQIQTDOAFmLLhhm2pajWM7NezO
 OHN3wlfpaQlBlmLNK5DZ2+sqEyfTYUbt5/MestG+MQVAsQ3CFvRB8Y2mqaiwRMtqw2xr
 HARldGC09JnZAbUb53QAMTXJPPJPXczjxSuWB2soxqkaAqe+iafOtBckcacizOC+zP25
 KQ9VQMLSaUPw1ixjW8RotoIAa2RKVWwA7I18DU/JhzbrAhCgEHtKigilVGtwr+tkS+t1
 oFW3DjpmCXeFQjaAHKcDFpuoqEVD59sYsxqq1J4BkXOswX3Ge9QONJLwbfO9ncDI+ZHR
 9VDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMYMxenmFh349IKIqeTvX/w6SB4UraEdYBnP1nQPKiISJ9D3TJ/mvSWFptckWxX1swR9OQz6IGYJg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzifWB98BOHyUAuJg8HAgaHdwh7Ij1Yu3UdpWDiOnhld0kui7sQ
 gc8s1/krXvADVnojrDMh3BQU9rTBy/IHbHjrhF34/Ri1uJorJ5SEfdEp
X-Gm-Gg: AY/fxX5mFbs4CHjoOWHPysj/5c7fLfcWvPYrBv+1j1R+x6A+/+2RpAjTl6cWF4Jobeg
 poS+EzyjmvC06b7lAYkWSLrw1QpZQMSi6wqy75RNAJGGnNYKW8hngWxfOqzXphcuDdX885auZwu
 vxY19IvTqF+ydGM95f/zT8vkZAPDMr2FXiOBTNbSQ3EPRsq2qKK62AN7dAcJ6HSsXyLUiX9xhK8
 blRWM0vezSYsH8EoAW7SaLKP3rhCx0fpKzDldE2yCwxOQRDKmBizn/aO8g0OJ7H1TVhZ1FCqCxF
 7EDEilipQaF4RFXeFhD/e2BgY1HJFXkCpKK36qknSE4OHntBubwlg+3JzJuOSZqzGsrSDbJ5dhu
 eq8pSMKe5wCBWDkPQQW585/iVY0bPNKmHUmduZVR4i0PPO6mv6QC9uVLS8RefUU6aVCT3uOpMWS
 smAqNsrPAOVs4Vj0+ABCbMM/8=
X-Google-Smtp-Source: AGHT+IEkR+HFL1Nq5SpvTf3AgMFECL3jz/y0NxbGAy5WuzwF5WmF+0vXkeRJ3kFSqnA+wrIjSWB1Lg==
X-Received: by 2002:a05:7022:ef07:b0:119:e56c:18a7 with SMTP id
 a92af1059eb24-121f8b14920mr9924771c88.15.1768063691770; 
 Sat, 10 Jan 2026 08:48:11 -0800 (PST)
Received: from localhost.localdomain ([202.120.237.35])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-121f248bb6esm19509083c88.12.2026.01.10.08.48.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 10 Jan 2026 08:48:11 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 YiPeng Chai <YiPeng.Chai@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH] drm/amd/ras: use proper error checking for kthread_run return
Date: Sun, 11 Jan 2026 00:47:55 +0800
Message-Id: <20260110164800.39203-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
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

kthread_run() returns an error pointer on failure, not NULL.
Replace NULL check with IS_ERR and use PTR_ERR to
propagate the real error from kthread_run.

Fixes: ea61341b9014 ("drm/amd/ras: Add thread to handle ras events")
Cc: stable@vger.kernel.org
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/gpu/drm/amd/ras/rascore/ras_process.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/ras/rascore/ras_process.c b/drivers/gpu/drm/amd/ras/rascore/ras_process.c
index 3267dcdb169c..c001074c8c56 100644
--- a/drivers/gpu/drm/amd/ras/rascore/ras_process.c
+++ b/drivers/gpu/drm/amd/ras/rascore/ras_process.c
@@ -248,9 +248,10 @@ int ras_process_init(struct ras_core_context *ras_core)
 
 	ras_proc->ras_process_thread = kthread_run(ras_process_thread,
 							(void *)ras_core, "ras_process_thread");
-	if (!ras_proc->ras_process_thread) {
+	if (IS_ERR(ras_proc->ras_process_thread)) {
 		RAS_DEV_ERR(ras_core->dev, "Failed to create ras_process_thread.\n");
-		ret =  -ENOMEM;
+		ret = PTR_ERR(ras_proc->ras_process_thread);
+		ras_proc->ras_process_thread = NULL;
 		goto err;
 	}
 
-- 
2.39.5 (Apple Git-154)

