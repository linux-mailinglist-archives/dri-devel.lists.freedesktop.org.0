Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66787C76307
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 21:22:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60FDE10E7D2;
	Thu, 20 Nov 2025 20:22:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Kl30p+in";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9050610E7D2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 20:22:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id AB5EB60017;
 Thu, 20 Nov 2025 20:22:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81C1AC4CEF1;
 Thu, 20 Nov 2025 20:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763670173;
 bh=D4nR4AaepjgwbZ3lVY7RfDmYBfaka+Jn2iZsXq8hE8U=;
 h=From:Date:Subject:To:Cc:From;
 b=Kl30p+inpq2mHmQcIL1RIejwVOf55PNSFWxKiy5AgFAw/5LDhRWN/OLdTMC3fq3YI
 ZxAXY+LWkYbfVhfqfeKF2DRBIjtd5NdP/lSmn5qcW0pamzMnqFNAJELUq44JP7ki+8
 vPuY0E5MoLAK6y2P9jLGQTGm93D14nVs2fjgMiGWQ5LcOI0RqEkBI1gcAhh4wmv7kz
 YW4JfvrQdtBYdBhckq8YYf9QQcgVHukTSwznADVn0EMQRGqZDiBgReBSwTobNn5oXZ
 kl/k36C0WL68eI3LuU8WP5wQc0MXra9BaSpLlucIVlJ/DcjWfpXgx3Gm7TqhbOn+lW
 NYxR5RmTfd9+A==
From: Nathan Chancellor <nathan@kernel.org>
Date: Thu, 20 Nov 2025 13:22:46 -0700
Subject: [PATCH] backlight: aw99706: Fix unused function warnings from
 suspend/resume ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251120-backlight-aw99706-fix-unused-pm-functions-v1-1-8b9c17c4e783@kernel.org>
X-B4-Tracking: v=1; b=H4sIAJV4H2kC/yWNywrCMBAAf6Xs2YUktA31V8RDutm08RFLN1Gh9
 N+NehwYZjYQXiMLHJsNVn5GiY9UQR8aoNmliTH6ymCU6bQ2CkdH11uc5ozuNQxW9RjiG0sqwh6
 XO4aSKNeIYGBjbUetZ+qh9paVq/p7nc5/ljJemPJ3APv+AYV/7xCNAAAA
X-Change-ID: 20251120-backlight-aw99706-fix-unused-pm-functions-fe2775c4dec6
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, 
 Pengyu Luo <mitltlatltl@gmail.com>, Junjie Cao <caojunjie650@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 patches@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2470; i=nathan@kernel.org;
 h=from:subject:message-id; bh=D4nR4AaepjgwbZ3lVY7RfDmYBfaka+Jn2iZsXq8hE8U=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJnyFbO9UhiOJ9/hyQ2e4vlUSDUp6szMO6c+3Vyg4rxJb
 V7SJYHkjlIWBjEuBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjCRkHWMDEsnPbvjHiKul/Ym
 zEjVUmvBnxurJPMXCDy67bay+qxM0BFGhq28S8+l8V2Qv3/piaFg1rLPzzq4p15u694v8CBB+o2
 1IycA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
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

When building for a platform without CONFIG_PM_SLEEP, such as s390,
there are two unused function warnings:

  drivers/video/backlight/aw99706.c:436:12: error: 'aw99706_resume' defined but not used [-Werror=unused-function]
    436 | static int aw99706_resume(struct device *dev)
        |            ^~~~~~~~~~~~~~
  drivers/video/backlight/aw99706.c:429:12: error: 'aw99706_suspend' defined but not used [-Werror=unused-function]
    429 | static int aw99706_suspend(struct device *dev)
        |            ^~~~~~~~~~~~~~~

SET_SYSTEM_SLEEP_PM_OPS, used within SIMPLE_DEV_PM_OPS, expands to
nothing when CONFIG_PM_SLEEP is not set, so these functions are
completely unused in this configuration.

SIMPLE_DEV_PM_OPS is deprecated in favor of DEFINE_SIMPLE_DEV_PM_OPS,
which avoids this issue by using pm_sleep_ptr to make these callbacks
NULL when CONFIG_PM_SLEEP is unset while making the callback functions
always appear used to the compiler regardless of configuration. Switch
to DEFINE_SIMPLE_DEV_PM_OPS for aw99706_pm_ops to clear up the warning.

Additionally, wrap the pointer to aw99706_pm_ops in pm_ptr() in
aw99706_i2c_driver to ensure that the structure is completely eliminated
in configurations without CONFIG_PM.

Fixes: 88a8e9b49ee8 ("backlight: aw99706: Add support for Awinic AW99706 backlight")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/video/backlight/aw99706.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/backlight/aw99706.c b/drivers/video/backlight/aw99706.c
index b7c1d24b17ac..df5b23b2f753 100644
--- a/drivers/video/backlight/aw99706.c
+++ b/drivers/video/backlight/aw99706.c
@@ -440,7 +440,7 @@ static int aw99706_resume(struct device *dev)
 	return aw99706_hw_init(aw);
 }
 
-static SIMPLE_DEV_PM_OPS(aw99706_pm_ops, aw99706_suspend, aw99706_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(aw99706_pm_ops, aw99706_suspend, aw99706_resume);
 
 static const struct i2c_device_id aw99706_ids[] = {
 	{ "aw99706" },
@@ -461,7 +461,7 @@ static struct i2c_driver aw99706_i2c_driver = {
 	.driver = {
 		.name = "aw99706",
 		.of_match_table = aw99706_match_table,
-		.pm = &aw99706_pm_ops,
+		.pm = pm_ptr(&aw99706_pm_ops),
 	},
 };
 

---
base-commit: 1704e206cb98c5e43af1483e3b07450055a31008
change-id: 20251120-backlight-aw99706-fix-unused-pm-functions-fe2775c4dec6

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>

