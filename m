Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFF47AE7AA
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 10:14:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72FA610E36D;
	Tue, 26 Sep 2023 08:14:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2020610E0D0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 08:13:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1DA4ACE1266
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 08:13:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87DD9C433C8;
 Tue, 26 Sep 2023 08:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695716034;
 bh=pKML1Q84Z5SEjVT09kSvwqPgs9xlFPfVVJN4cdzzSiI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=WTZoA1A8l5GpeHggQBfByHd8MQSCG+dENDaAe1zxWoBY1epfBYB/7vbP7rzTPeYOD
 EC83++RQYMu2YtgMQJIJ4FlscHLj/Pnx+KBJY7ZU1hYTYZQskF6W1xUE6jddFG2sil
 RjdI/NBF7VfPZKF+DF5kAAYwImHD7Cp3BWh56L2eg3ial5iARtjJCojyVxWf+2pgOC
 VMC8tf3O9rncz8iS4uUb2PorvgNYXjFi04o0iwlGENge74rpp9Yb+sNlRLj2ngYXLg
 nROBqpk5n9J7/Z1XMUmzjfgbKA1idMdZaSLB5DlKyjCDcNC09aaUBSjGHWlIZkOHVX
 wnLlzppIhj9kw==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/9] accel/habanalabs/gaudi: remove unused structure definition
Date: Tue, 26 Sep 2023 11:13:40 +0300
Message-Id: <20230926081345.240927-4-ogabbay@kernel.org>
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

struct gaudi_nic_status is not used anywhere in the code.

Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 .../habanalabs/include/gaudi/gaudi_fw_if.h    | 32 -------------------
 1 file changed, 32 deletions(-)

diff --git a/drivers/accel/habanalabs/include/gaudi/gaudi_fw_if.h b/drivers/accel/habanalabs/include/gaudi/gaudi_fw_if.h
index 2dba02757d37..a2547f306750 100644
--- a/drivers/accel/habanalabs/include/gaudi/gaudi_fw_if.h
+++ b/drivers/accel/habanalabs/include/gaudi/gaudi_fw_if.h
@@ -44,38 +44,6 @@ struct eq_nic_sei_event {
 	__u8 pad[6];
 };
 
-/*
- * struct gaudi_nic_status - describes the status of a NIC port.
- * @port: NIC port index.
- * @bad_format_cnt: e.g. CRC.
- * @responder_out_of_sequence_psn_cnt: e.g NAK.
- * @high_ber_reinit_cnt: link reinit due to high BER.
- * @correctable_err_cnt: e.g. bit-flip.
- * @uncorrectable_err_cnt: e.g. MAC errors.
- * @retraining_cnt: re-training counter.
- * @up: is port up.
- * @pcs_link: has PCS link.
- * @phy_ready: is PHY ready.
- * @auto_neg: is Autoneg enabled.
- * @timeout_retransmission_cnt: timeout retransmission events
- * @high_ber_cnt: high ber events
- */
-struct gaudi_nic_status {
-	__u32 port;
-	__u32 bad_format_cnt;
-	__u32 responder_out_of_sequence_psn_cnt;
-	__u32 high_ber_reinit;
-	__u32 correctable_err_cnt;
-	__u32 uncorrectable_err_cnt;
-	__u32 retraining_cnt;
-	__u8 up;
-	__u8 pcs_link;
-	__u8 phy_ready;
-	__u8 auto_neg;
-	__u32 timeout_retransmission_cnt;
-	__u32 high_ber_cnt;
-};
-
 struct gaudi_cold_rst_data {
 	union {
 		struct {
-- 
2.34.1

