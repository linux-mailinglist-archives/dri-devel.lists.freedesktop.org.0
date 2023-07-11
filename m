Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F189774EC65
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 13:12:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47DE810E373;
	Tue, 11 Jul 2023 11:12:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E594B10E370
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 11:12:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1245F6147B;
 Tue, 11 Jul 2023 11:12:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99987C433C7;
 Tue, 11 Jul 2023 11:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689073953;
 bh=k2yzZjnww519gu9iIyHbPqTALZQ1a3wjTHoUAY8fwUg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gJiKVuuJHvuU7SoqgqLtldcZVkpg2h/W4E7mIDkC30p28lwHzKWBlzD4sqswwdfW0
 fT081yYoSVTjRLt8YH33/Gm1kOcytWpR+N3sHbhGfo+42ja9MzQPlMxIefIEcDl5Y0
 AhyntJSEhTY8ash1G4d/P2XQnS5a7ACMSVlm8w9EmwhlOtnn78lonkBYG+SmrEo/rN
 4j7Q0L6Tt2Kv+nK0kc5i/zXGOMPFdIcaelYrrLpExR+1yI+tLGsUH0BzkaAdApJspE
 /MuErtt//4qjG/D8u7Sy4EbzfnQqgo3PGQm539NJ454wWNVn2a+zyEOaRh8Jaz8PYb
 aeTdfV8lcKBJg==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 02/12] accel/habanalabs/gaudi2: unsecure tpc count registers
Date: Tue, 11 Jul 2023 14:12:16 +0300
Message-Id: <20230711111226.163670-2-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230711111226.163670-1-ogabbay@kernel.org>
References: <20230711111226.163670-1-ogabbay@kernel.org>
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
Cc: Ofir Bitton <obitton@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ofir Bitton <obitton@habana.ai>

As TPC kernels now must use those registers we unsecure them.

Signed-off-by: Ofir Bitton <obitton@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/gaudi2/gaudi2_security.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2_security.c b/drivers/accel/habanalabs/gaudi2/gaudi2_security.c
index d08267e59303..34bf80c5a44b 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2_security.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2_security.c
@@ -1601,6 +1601,7 @@ static const u32 gaudi2_pb_dcr0_tpc0_unsecured_regs[] = {
 	mmDCORE0_TPC0_CFG_KERNEL_SRF_30,
 	mmDCORE0_TPC0_CFG_KERNEL_SRF_31,
 	mmDCORE0_TPC0_CFG_TPC_SB_L0CD,
+	mmDCORE0_TPC0_CFG_TPC_COUNT,
 	mmDCORE0_TPC0_CFG_TPC_ID,
 	mmDCORE0_TPC0_CFG_QM_KERNEL_ID_INC,
 	mmDCORE0_TPC0_CFG_QM_TID_BASE_SIZE_HIGH_DIM_0,
-- 
2.34.1

