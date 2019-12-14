Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 153FF11F233
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2019 15:44:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86F4D6E388;
	Sat, 14 Dec 2019 14:43:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C00A6E32C;
 Sat, 14 Dec 2019 09:10:35 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 5407A9B8445EF6C57564;
 Sat, 14 Dec 2019 16:55:10 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.439.0; Sat, 14 Dec 2019
 16:55:03 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/3] drm/amdgpu: Remove unneeded semicolon in amdgpu_pmu.c
Date: Sat, 14 Dec 2019 17:02:22 +0800
Message-ID: <1576314144-27602-2-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576314144-27602-1-git-send-email-zhengbin13@huawei.com>
References: <1576314144-27602-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sat, 14 Dec 2019 14:42:54 +0000
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
Cc: zhengbin13@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes coccicheck warning:

drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c:110:3-4: Unneeded semicolon
drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c:133:2-3: Unneeded semicolon
drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c:163:2-3: Unneeded semicolon
drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c:191:2-3: Unneeded semicolon

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c
index 0e6dba9..cf21ad0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c
@@ -107,7 +107,7 @@ static void amdgpu_perf_read(struct perf_event *event)
 		default:
 			count = 0;
 			break;
-		};
+		}
 	} while (local64_cmpxchg(&hwc->prev_count, prev, count) != prev);

 	local64_add(count - prev, &event->count);
@@ -130,7 +130,7 @@ static void amdgpu_perf_stop(struct perf_event *event, int flags)
 		break;
 	default:
 		break;
-	};
+	}

 	WARN_ON_ONCE(hwc->state & PERF_HES_STOPPED);
 	hwc->state |= PERF_HES_STOPPED;
@@ -160,7 +160,7 @@ static int amdgpu_perf_add(struct perf_event *event, int flags)
 		break;
 	default:
 		return 0;
-	};
+	}

 	if (retval)
 		return retval;
@@ -188,7 +188,7 @@ static void amdgpu_perf_del(struct perf_event *event, int flags)
 		break;
 	default:
 		break;
-	};
+	}

 	perf_event_update_userpage(event);
 }
--
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
