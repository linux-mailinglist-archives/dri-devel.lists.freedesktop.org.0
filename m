Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C226D55BFDB
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 11:46:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E81D812B1C5;
	Tue, 28 Jun 2022 09:46:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24C8912B1B7
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 09:46:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5B6B6617BD;
 Tue, 28 Jun 2022 09:46:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2580BC341CC;
 Tue, 28 Jun 2022 09:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656409590;
 bh=0NbCo+YW090Jj7w8/2xxoP/ojPkPgosUj8xMfRMxsao=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZZZBB3B2yZQo7yy3G4Geuz38zgBKXEW3Nrm02C58j4UcwkLy6kw988E2IoNArMmX7
 r+TJ5L6OXqthHeUEBTXoCkrGKHZjdBT6ZszKQzhma67ADFyzR0M0aAXbAC4CebXr9E
 0yAqdQPeZUMS2PJz+L18H8m5aLmykqgJCszCuz2AdfJ2MVcOWfEDFfZg3/Q/UUYCEo
 es7SZfiqAXXIneq1tgySVZHENjRumhMRY3u8BaAizyCxDyaUsGd31WdQALc6f6sy4D
 QN7oSmNrS/E3NcBm/vCdgUXM6ItvG20llGu6D9mfEIJUARqHdr6rG/H3bKwRZfzhx9
 LOiGJPLvTAQzw==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1o67nf-005HFN-SY;
 Tue, 28 Jun 2022 10:46:27 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH 12/22] drm: gpu_scheduler: fix a kernel-doc warning
Date: Tue, 28 Jun 2022 10:46:16 +0100
Message-Id: <0129fa0ffb8d418ab66f2ab0f1d525cb49f01f75.1656409369.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1656409369.git.mchehab@kernel.org>
References: <cover.1656409369.git.mchehab@kernel.org>
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
Cc: Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Mauro Carvalho Chehab <mchehab@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The dev field was not documented:

	include/drm/gpu_scheduler.h:463: warning: Function parameter or member 'dev' not described in 'drm_gpu_scheduler'

Document it.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/22] at: https://lore.kernel.org/all/cover.1656409369.git.mchehab@kernel.org/

 include/drm/gpu_scheduler.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index addb135eeea6..c7c487e0c40e 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -435,6 +435,7 @@ struct drm_sched_backend_ops {
  * @_score: score used when the driver doesn't provide one
  * @ready: marks if the underlying HW is ready to work
  * @free_guilty: A hit to time out handler to free the guilty job.
+ * @dev: pointer to struct device.
  *
  * One scheduler is implemented for each hardware ring.
  */
-- 
2.36.1

