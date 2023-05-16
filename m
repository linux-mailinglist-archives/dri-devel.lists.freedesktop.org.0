Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC02704949
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 11:30:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3418910E330;
	Tue, 16 May 2023 09:30:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CEFF10E32D
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 09:30:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 19F0661943
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 09:30:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7C33C4339B
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 09:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684229437;
 bh=lO/xF8qPB7bRjrjMk1aaJ+uyYYfDgmdYOiT4Tp6boq4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=cqhLIdGyG1ebNgOKSBbdySE/phggHgCg08+JMZUt0Aos3KlLQFa5OzfbJgATJi4Oa
 6wOqppBzUVYfa6GGvotQq5AeaFXbgPqr4nK3Lx23z8M2q5GX0ytb9hIC2D4FGz1xNE
 HojWtzPR7tgMwjf5Owiy3qM+Q6P1LUAiytyXCWJfGJ8Y6xIGuWZ7pbQq/x6sKLsDgT
 XswxYEftvPG2A1umZOSZUuIx4sI1+CX7tYIcz/T80HAPkECwPGieHVPtrPmQaqpDxv
 lLS6Gx4kg+gYeS9d6nDmQVbgF60JFnNXX4hCCKzVc4Fh8p/X+zT/HMJmneRH3Jr97T
 VTzaWlCZcj3ig==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 02/12] accel/habanalabs: set unused bit as reserved
Date: Tue, 16 May 2023 12:30:20 +0300
Message-Id: <20230516093030.1220526-2-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230516093030.1220526-1-ogabbay@kernel.org>
References: <20230516093030.1220526-1-ogabbay@kernel.org>
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

Get latest f/w gaudi2 interface file which marks unused
bist_need_iatu_config bit in cold_rst_data structure as reserved bit.

Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/include/gaudi2/gaudi2_fw_if.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/habanalabs/include/gaudi2/gaudi2_fw_if.h b/drivers/accel/habanalabs/include/gaudi2/gaudi2_fw_if.h
index 8522f24deac0..18ca147b1c86 100644
--- a/drivers/accel/habanalabs/include/gaudi2/gaudi2_fw_if.h
+++ b/drivers/accel/habanalabs/include/gaudi2/gaudi2_fw_if.h
@@ -62,7 +62,7 @@ struct gaudi2_cold_rst_data {
 			u32 fake_security_enable : 1;
 			u32 fake_sig_validation_en : 1;
 			u32 bist_skip_enable : 1;
-			u32 bist_need_iatu_config : 1;
+			u32 reserved1 : 1;
 			u32 fake_bis_compliant : 1;
 			u32 wd_rst_cause_arm : 1;
 			u32 wd_rst_cause_arcpid : 1;
-- 
2.40.1

