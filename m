Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9817AE7AB
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 10:14:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2315910E370;
	Tue, 26 Sep 2023 08:14:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F251A10E0D0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 08:13:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 7323FB80C66
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 08:13:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3A31C433C7;
 Tue, 26 Sep 2023 08:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695716035;
 bh=kovFpRcan5fPXYAx/LeKp5+4tn0cbVZMFIjVCi84H3s=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=DauZIdmLV6XvDKn1Zi6JhgBVcEwwstjxEzXkni7SQtCzFA01YKgc823ARNkcV4Tfn
 7lYtiexYQ6BhD+BvBLNGfqqR9H5ksaUZPMbftwrw4ev855iqAa+uQ+DxWnn4rb4qJ/
 pg0SQ6quqkTvIz5nwfxSRpiCpPsTReUXWHKW8ulQAvPw5Xw8A+RIeY6cVTIkaPd4Ob
 Vgw6YSp7N9Mzklzr27CE+t/kUWbCQYmGahVjVD7cqBOGgHTLFbr2Tba4nFsKNsRZ0E
 6V/NY/BCHNR7tnJbCeDfXX/c1WMSemJm1vaJ4DUYJjho9FmzEkdQ0qLSAMpPEP7j0A
 CJrr6/r4tdAag==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/9] accel/habanalabs: remove unused field
Date: Tue, 26 Sep 2023 11:13:41 +0300
Message-Id: <20230926081345.240927-5-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230926081345.240927-1-ogabbay@kernel.org>
References: <20230926081345.240927-1-ogabbay@kernel.org>
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

flags in struct wait_interrupt_data is not used anywhere so remove it.

Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/command_submission.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/accel/habanalabs/common/command_submission.c b/drivers/accel/habanalabs/common/command_submission.c
index 751d2c7d3fb8..e5ca490b7fca 100644
--- a/drivers/accel/habanalabs/common/command_submission.c
+++ b/drivers/accel/habanalabs/common/command_submission.c
@@ -47,7 +47,6 @@ struct wait_interrupt_data {
 	u64 cq_offset;
 	u64 target_value;
 	u64 intr_timeout_us;
-	unsigned long flags;
 };
 
 static void job_wq_completion(struct work_struct *work);
-- 
2.34.1

