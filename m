Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D25D9591B4E
	for <lists+dri-devel@lfdr.de>; Sat, 13 Aug 2022 17:17:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E8CB2BCFA;
	Sat, 13 Aug 2022 15:17:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg4.exmail.qq.com [43.154.221.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51760BCD20;
 Sat, 13 Aug 2022 15:16:47 +0000 (UTC)
X-QQ-mid: bizesmtp74t1660403795twerpap8
Received: from localhost.localdomain ( [110.188.55.240])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Sat, 13 Aug 2022 23:16:28 +0800 (CST)
X-QQ-SSF: 0100000000200080H000B00A0000020
X-QQ-FEAT: DRnj/z+Sqac7eaaRnRxjohl0DEvoOesJDpkPKa5FAiUeCIb4HB4wRQobyKARc
 2u+3PVZtiijWZKitdsaVoddTICob6JL/nXE4UWivOeUdM7x8N4dpy7bz7LH9RKmBLCJBW6K
 RREVCUsjGcsmpzf54Ur9zgspPaB8cgvxCEtbjJUdA+IvMCFeOj1VdCSrfJ8tRQ/HJZLXJRL
 bmoZTZYSRxZReH0vbmnl1tHXZ+r2nQJ2NObg92HN+G+NhbR6n7ysmYA6q0DMz7VNZN//p+L
 A9zKhfcPkMGYP4duw4yLuEFtH32np6SoL5RUnRdfRpCNiYrf4M/T45q9AmJzIXvRMNOF7Ay
 21zLIE84pSggkGo3SrGIu/Fhf1mfUk16ICswMPbkYhRpq4hE6EmjWmdIoji8A==
X-QQ-GoodBg: 0
From: min tang <tangmin@cdjrlc.com>
To: airlied@linux.ie,
	daniel@ffwll.ch,
	srinivas.pandruvada@linux.intel.com
Subject: [PATCH] drm/i915/gt: Unneeded semicolon
Date: Sat, 13 Aug 2022 23:16:16 +0800
Message-Id: <20220813151616.4193-1-tangmin@cdjrlc.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr6
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
Cc: min tang <tangmin@cdjrlc.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, dan.carpenter@oracle.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is no semicolon after '}' in line 648.

Signed-off-by: min tang <tangmin@cdjrlc.com>
---
 drivers/gpu/drm/i915/gt/intel_migrate.c         | 2 +-
 tools/power/x86/intel-speed-select/hfi-events.c | 2 +-
 tools/testing/selftests/timers/nanosleep.c      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
index 2c35324b5f68..a69b244f14d0 100644
--- a/drivers/gpu/drm/i915/gt/intel_migrate.c
+++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
@@ -645,7 +645,7 @@ static int scatter_list_length(struct scatterlist *sg)
 	while (sg && sg_dma_len(sg)) {
 		len += sg_dma_len(sg);
 		sg = sg_next(sg);
-	};
+	}
 
 	return len;
 }
diff --git a/tools/power/x86/intel-speed-select/hfi-events.c b/tools/power/x86/intel-speed-select/hfi-events.c
index 761375062505..f0ed69721308 100644
--- a/tools/power/x86/intel-speed-select/hfi-events.c
+++ b/tools/power/x86/intel-speed-select/hfi-events.c
@@ -144,7 +144,7 @@ static int family_handler(struct nl_msg *msg, void *arg)
 			continue;
 		res->id = nla_get_u32(tb2[CTRL_ATTR_MCAST_GRP_ID]);
 		break;
-	};
+	}
 
 	return 0;
 }
diff --git a/tools/testing/selftests/timers/nanosleep.c b/tools/testing/selftests/timers/nanosleep.c
index 71b5441c2fd9..433a09676aeb 100644
--- a/tools/testing/selftests/timers/nanosleep.c
+++ b/tools/testing/selftests/timers/nanosleep.c
@@ -72,7 +72,7 @@ char *clockstring(int clockid)
 		return "CLOCK_BOOTTIME_ALARM";
 	case CLOCK_TAI:
 		return "CLOCK_TAI";
-	};
+	}
 	return "UNKNOWN_CLOCKID";
 }
 
-- 
2.17.1

