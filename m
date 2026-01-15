Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9373D25D9D
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 17:51:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB75610E7AF;
	Thu, 15 Jan 2026 16:51:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XZ8fTsSX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDD3510E7AF
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 16:51:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 227F460123;
 Thu, 15 Jan 2026 16:51:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74A90C116D0;
 Thu, 15 Jan 2026 16:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768495865;
 bh=B1wUz/mpBe/fg4rNrP8IB1N8p3wpTvtskTTQXOf2//8=;
 h=From:To:Cc:Subject:Date:From;
 b=XZ8fTsSXvGrF92ldzigs8Ve5cL39TSNveTwpqOBSZHN4hFWtJdaRg2+3TnkL16EGd
 t9CXMotN26Ydg04EehPM1clq1zH545LhDngNA+pKlRWU+CdY/RDdufo5A/zmFFZ3nl
 GNlkMWbExOeviRLfzSGZaY+AlFj+VD1X4BVD9Jy+qXjYIhmFvUOtXUleJ/Ngcuc8Ae
 tsfx9nQmWrX2X6VcqsH4gffB1TbD1hrIO1vZCHHk6cYvoU1F88k/9gFZemjT3FYBda
 YwYj5GoeixbklXHTd70DNbZw9s4mAruB8MP+k7nusIwGoGiCut70t+TJcN3DTKqq6B
 fWzJzoX3wvZ3g==
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: linux-pwm@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, linux-gpio@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] pwm: Update MAINTAINER entry
Date: Thu, 15 Jan 2026 17:50:54 +0100
Message-ID: <20260115165055.1739004-2-ukleinek@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1246; i=ukleinek@kernel.org;
 h=from:subject; bh=B1wUz/mpBe/fg4rNrP8IB1N8p3wpTvtskTTQXOf2//8=;
 b=owGbwMvMwMXY3/A7olbonx/jabUkhsxMqffFyz6ULRA9PNPKb15W4ZeuiamRzolPjPOtTXeWR
 DquOObUyWjEwsDIxSArpshi37gm06pKLrJz7b/LMINYmUCmMHBxCsBEDHawfzOLT7ZICXygyGJq
 w/7QpGy+w6F5idov7uhvlhO+VPyfbduBh84rFv/9omXedZFpV0Lxb+6GsF2nMpVPbm1luXl94f7
 +ZzKNx294lIqo/bF+a/hbmefjYp+VUaLN67e2hHyVK2LdLlpzteL88Y0l09cd4qz7YJNatVgh2f
 7kG+lmZ1HeUJ9lFxXN9dpmufOWZTzQ2n/571lRr6sP7xcJHHP6uih0iuv1Gss9s5VT7qx7Jl3Pq
 ajIz/Iu3NjV3rDW9mAse4DF1bwJ/Y3F23qzFVKfrW/nZlJqOmQ75/SOIj9VHY+ac75LXAolrewc
 a1bcN5tn+C40IkMmPU23//nnBz+0bbjYPz1RE/0b/QsA
X-Developer-Key: i=ukleinek@kernel.org; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
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

There is little sense in having gpio-mvebu and pwm-backlight explicitly
listed in the PWM entry. Drop these and add the keywords that actually
identify a driver as PWM related.

Signed-off-by: Uwe Kleine-König <ukleinek@kernel.org>
---
 MAINTAINERS | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5b11839cba9d..1ab3b6a2c29b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21070,16 +21070,14 @@ L:	linux-pwm@vger.kernel.org
 S:	Maintained
 Q:	https://patchwork.ozlabs.org/project/linux-pwm/list/
 T:	git https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git
-F:	Documentation/devicetree/bindings/gpio/gpio-mvebu.yaml
 F:	Documentation/devicetree/bindings/pwm/
 F:	Documentation/driver-api/pwm.rst
-F:	drivers/gpio/gpio-mvebu.c
 F:	drivers/pwm/
-F:	drivers/video/backlight/pwm_bl.c
 F:	include/dt-bindings/pwm/
 F:	include/linux/pwm.h
-F:	include/linux/pwm_backlight.h
 K:	pwm_(config|apply_might_sleep|apply_atomic|ops)
+K:	(devm_)?pwmchip_(add|alloc|remove)
+K:	pwm_(round|get|set)_waveform
 
 PWM SUBSYSTEM BINDINGS [RUST]
 M:	Michal Wilczynski <m.wilczynski@samsung.com>

base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
-- 
2.47.3

