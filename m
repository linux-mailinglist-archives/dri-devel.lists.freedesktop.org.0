Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26288BF4FC2
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 09:34:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55CFD10E57A;
	Tue, 21 Oct 2025 07:34:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="f3czzneb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC8A10E579
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 07:34:34 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 9BABFC0B888;
 Tue, 21 Oct 2025 07:34:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 438DD606DC;
 Tue, 21 Oct 2025 07:34:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3855D102F23EB; 
 Tue, 21 Oct 2025 09:34:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1761032072; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=PC1XUfSkoPiTXud5UN9nIFVCHobGYNyM/zT3+Sp+npI=;
 b=f3czzneb3UJgh9z21GwhRV9zsGQc+FNmc0MG4ULvwukt7duajd9c+w9XCI908HDpqt85zW
 tHwx/vcmq/QsTupk2+EL7PoTtfgJmsn7KzieuqVEnoYHcjFeawFoFwW30oJzTtKV8+eRcV
 Lk8BHa7YfAhR5vJyJ/wSwv81byM7goiB0Y7ZItbZClq8zX+VTwZjOFjaAQYvVAjxT2sEPn
 eOCB3rfGYrfDI84GOXWzJWmlVAqPsVLJN6pkqsp36zzqzflrTozuHeUSgRM3SUQABE78Fs
 HH7sJDk/LrKMAdeOW1tsmWN3sQhO0zm5+Y87aQkSV4GPfY7j8ndGJVrYNxWQmA==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH 3/3] MAINTAINERS: Add the Leadtek LTK028QV25BYL panel driver
 entry
Date: Tue, 21 Oct 2025 09:34:05 +0200
Message-ID: <20251021073408.195959-4-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021073408.195959-1-herve.codina@bootlin.com>
References: <20251021073408.195959-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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

After contributing the driver, add myself as the maintainer for the
Leadtek LTK028QV25BYL panel driver.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 46126ce2f968..67c085cd1dae 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7811,6 +7811,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
 F:	drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
 
+DRM DRIVER FOR LEADTEK LTK028QV25BYL PANELS
+M:	Herve Codina <herve.codina@bootlin.com>
+S:	Maintained
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	Documentation/devicetree/bindings/display/panel/leadtek,ltk028qv25byl.yaml
+F:	drivers/gpu/drm/panel/panel-leadtek-ltk028qv25byl.c
+
 DRM DRIVER FOR LG SW43408 PANELS
 M:	Sumit Semwal <sumit.semwal@linaro.org>
 M:	Casey Connolly <casey.connolly@linaro.org>
-- 
2.51.0

