Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E12C76A613
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 03:12:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E29B10E205;
	Tue,  1 Aug 2023 01:12:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out28-171.mail.aliyun.com (out28-171.mail.aliyun.com
 [115.124.28.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89A0910E205;
 Tue,  1 Aug 2023 01:12:49 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07465538|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_alarm|0.0922483-0.000575133-0.907177;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047192; MF=sunran001@208suo.com; NM=1;
 PH=DS; RN=8; RT=8; SR=0; TI=SMTPD_---.U5BYNI3_1690852358; 
Received: from localhost.localdomain(mailfrom:sunran001@208suo.com
 fp:SMTPD_---.U5BYNI3_1690852358) by smtp.aliyun-inc.com;
 Tue, 01 Aug 2023 09:12:41 +0800
From: Ran Sun <sunran001@208suo.com>
To: apw@canonical.com,
	joe@perches.com,
	alexander.deucher@amd.com
Subject: [PATCH] drm/amd/pm: Clean up errors in smu_v11_0.h
Date: Tue,  1 Aug 2023 01:12:37 +0000
Message-Id: <20230801011237.3913-1-sunran001@208suo.com>
X-Mailer: git-send-email 2.17.1
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
Cc: bpf@vger.kernel.org, Ran Sun <sunran001@208suo.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: that open brace { should be on the previous line
ERROR: code indent should use tabs where possible

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v11_0.h |  7 +++---
 scripts/checkpatch.pl                        | 23 --------------------
 2 files changed, 3 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v11_0.h b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v11_0.h
index d466db6f0ad4..1b4e0e4716ea 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v11_0.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v11_0.h
@@ -67,8 +67,7 @@ static const __maybe_unused uint16_t link_width[] = {0, 1, 2, 4, 8, 12, 16};
 static const __maybe_unused uint16_t link_speed[] = {25, 50, 80, 160};
 
 static const
-struct smu_temperature_range __maybe_unused smu11_thermal_policy[] =
-{
+struct smu_temperature_range __maybe_unused smu11_thermal_policy[] = {
 	{-273150,  99000, 99000, -273150, 99000, 99000, -273150, 99000, 99000},
 	{ 120000, 120000, 120000, 120000, 120000, 120000, 120000, 120000, 120000},
 };
@@ -96,8 +95,8 @@ struct smu_11_0_dpm_table {
 };
 
 struct smu_11_0_pcie_table {
-        uint8_t  pcie_gen[MAX_PCIE_CONF];
-        uint8_t  pcie_lane[MAX_PCIE_CONF];
+	uint8_t  pcie_gen[MAX_PCIE_CONF];
+	uint8_t  pcie_lane[MAX_PCIE_CONF];
 };
 
 struct smu_11_0_dpm_tables {
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 85a0598bf723..528f619520eb 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -7449,23 +7449,6 @@ sub process {
 		}
 
 # Complain about RCU Tasks Trace used outside of BPF (and of course, RCU).
-<<<<<<< HEAD
-<<<<<<< HEAD
-		if ($line =~ /\brcu_read_lock_trace\s*\(/ ||
-		    $line =~ /\brcu_read_lock_trace_held\s*\(/ ||
-		    $line =~ /\brcu_read_unlock_trace\s*\(/ ||
-		    $line =~ /\bcall_rcu_tasks_trace\s*\(/ ||
-		    $line =~ /\bsynchronize_rcu_tasks_trace\s*\(/ ||
-		    $line =~ /\brcu_barrier_tasks_trace\s*\(/ ||
-		    $line =~ /\brcu_request_urgent_qs_task\s*\(/) {
-			if ($realfile !~ m@^kernel/bpf@ &&
-			    $realfile !~ m@^include/linux/bpf@ &&
-			    $realfile !~ m@^net/bpf@ &&
-			    $realfile !~ m@^kernel/rcu@ &&
-			    $realfile !~ m@^include/linux/rcu@) {
-=======
-=======
->>>>>>> d7b3af5a77e8d8da28f435f313e069aea5bcf172
 		our $rcu_trace_funcs = qr{(?x:
 			rcu_read_lock_trace |
 			rcu_read_lock_trace_held |
@@ -7482,14 +7465,8 @@ sub process {
 			kernel/rcu/ |
 			include/linux/rcu
 		)};
-<<<<<<< HEAD
-		if ($line =~ /\b$rcu_trace_funcs\s*\(/) {
-			if ($realfile !~ m@^$rcu_trace_paths@) {
->>>>>>> 4d2c646ac07cf4a35ef1c4a935a1a4fd6c6b1a36
-=======
 		if ($line =~ /\b($rcu_trace_funcs)\s*\(/) {
 			if ($realfile !~ m{^$rcu_trace_paths}) {
->>>>>>> d7b3af5a77e8d8da28f435f313e069aea5bcf172
 				WARN("RCU_TASKS_TRACE",
 				     "use of RCU tasks trace is incorrect outside BPF or core RCU code\n" . $herecurr);
 			}
-- 
2.17.1

