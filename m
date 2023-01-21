Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0176768AC
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 21:07:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D05F410E3DB;
	Sat, 21 Jan 2023 20:07:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D8C410E3C1
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 20:07:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1F2F760B65;
 Sat, 21 Jan 2023 20:07:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 76E62C4339B;
 Sat, 21 Jan 2023 20:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674331670;
 bh=U+74BdjwnUvW/uCovDWZoQnlN8NicPj3CfcUkpXSdtc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=BAehxUqv5tiYHmdRE4R3oPuiAH9RvOVOsvq7zzSyU5VDGg59smGQ5vQtCRGThxx05
 HecUGCUbOLC9x8hitH2hliq3jrkZeRTTrpdvvZAhNu26Mz3XzafeSp4neoPGsrtQt9
 wvCmUfUkYefJhYwAHuG8Sbv9/24779BVxSaoLo+EYUfpxuzLKactaDUtz3Y8CVqeDk
 jVoMoBlCK62z4aiBSIJw6X2/ql+2rRWkZ12amHpjF9uDmJOaquzJqLjHFkvLi0QVPr
 CqrXcsbGmLwwfHUoGF1Mep6g5A7BoA336HYumsUMRusdG6BpSSCanDFZ0R0hamX2K7
 r0zkWXvLaIvQA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 58953C38A23;
 Sat, 21 Jan 2023 20:07:50 +0000 (UTC)
From: Sam Ravnborg via B4 Submission Endpoint
 <devnull+sam.ravnborg.org@kernel.org>
Date: Sat, 21 Jan 2023 21:07:39 +0100
Subject: [PATCH 01/86] drm/komeda: Direct include headers from drm_print
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230113-drm-include-v1-v1-1-c5cf72d8a5a2@ravnborg.org>
References: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
In-Reply-To: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
To: dri-devel@lists.freedesktop.org
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1674331666; l=1273;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=/YryTtZUbqmnAxzUz3X6U0yYG0gnWZZ+IgEvDOZWomQ=; =?utf-8?q?b=3D0wM9i60X0sTl?=
 =?utf-8?q?OjpJSxM7vpyjlYEbnO5xWmx4eG25Q/qOZPPFLbiYbeftJQwdho1CC3rrwEm5Qn/w?=
 tv+rxIWMCr8kV82mi8DNYUa/UiI5Tmd2c2wuuj86vRyDjUxBP9H2
X-Developer-Key: i=sam@ravnborg.org; a=ed25519;
 pk=R0+pqV7BRYOAeOIGkyOrSNke7arx5y3LkEuNi37YEyU=
X-Endpoint-Received: by B4 Submission Endpoint for sam@ravnborg.org/20230107
 with auth_id=22
X-Original-From: Sam Ravnborg <sam@ravnborg.org>
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
Reply-To: sam@ravnborg.org
Cc: Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sam Ravnborg <sam@ravnborg.org>

Direct include the headers that otherwise comes indirect from
drm_print.h, because drm_print.h will be reduced to
include only the minimal set of headers.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/arm/display/komeda/d71/d71_component.c | 2 ++
 drivers/gpu/drm/arm/display/komeda/komeda_pipeline.c   | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c b/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c
index 42510fdea27e..875731a8ae90 100644
--- a/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c
+++ b/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c
@@ -4,6 +4,8 @@
  * Author: James.Qian.Wang <james.qian.wang@arm.com>
  *
  */
+#include <linux/seq_file.h>
+
 #include "d71_dev.h"
 #include "komeda_kms.h"
 #include "malidp_io.h"
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.c b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.c
index 4b7d94961527..00f5864a0495 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.c
@@ -5,6 +5,7 @@
  *
  */
 #include <linux/of.h>
+#include <linux/seq_file.h>
 
 #include <drm/drm_print.h>
 

-- 
2.34.1

