Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2114C765EE2
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 00:02:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 644AE10E621;
	Thu, 27 Jul 2023 22:02:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from qs51p00im-qukt01080101.me.com (qs51p00im-qukt01080101.me.com
 [17.57.155.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B27610E621
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 22:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1690494761; bh=kgGzA4dJRcbkTCFkI8WKFmpxvWUvUAQu2bilJrVHeBw=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=lOgjzsYj3O24lMtX7deLh2NMJOaknYNi4dG3G7pJAlC2tpYVbUbR89MwUBNYxLyGo
 bxakESUnPGEprmHFo768pGBNc73smnhJsu8d+3BnRBYNKPFlS+AMbCoChH1tm2cy1P
 AceGT2ZVSXqewMUfTbfk27YcaknLlYejy/cclN4tShbUWy4K8CxTxBmZZzzu3nFJvQ
 kWaDcag4Rt7ChsHhulbej5p8VZOwMovG/ZDunwnaqJEezXdQ3Wp0r4trdEzd7K4I5o
 3DWMfSw1kn6ZIOc3aF3IWiF0PwvoGWNChpBCUsANuXph75mOXTONN+RHsOPeM2VzoA
 Tmjz3rDCz3q/g==
Received: from localhost (qs51p00im-dlb-asmtp-mailmevip.me.com [17.57.155.28])
 by qs51p00im-qukt01080101.me.com (Postfix) with ESMTPSA id
 5BC196180164; Thu, 27 Jul 2023 21:52:40 +0000 (UTC)
From: Alain Volmat <avolmat@me.com>
To: Alain Volmat <alain.volmat@foss.st.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 07/14] drm/sti: add more possible GDP / VID planes entries in
 sti_plane
Date: Thu, 27 Jul 2023 21:51:31 +0000
Message-Id: <20230727215141.53910-8-avolmat@me.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230727215141.53910-1-avolmat@me.com>
References: <20230727215141.53910-1-avolmat@me.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: wpH9KuNuuv4dX_dTTxW3ntkSM4BIxeZ0
X-Proofpoint-GUID: wpH9KuNuuv4dX_dTTxW3ntkSM4BIxeZ0
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.790,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2022-01-12=5F02:2020-02-14=5F02,2022-01-12=5F02,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 suspectscore=0
 spamscore=0 mlxlogscore=771 adultscore=0 mlxscore=0 phishscore=0
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2307270199
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Alain Volmat <avolmat@me.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to address the STiH418, add more entries in sti_plane

Signed-off-by: Alain Volmat <avolmat@me.com>
---
 drivers/gpu/drm/sti/sti_plane.c | 8 ++++++++
 drivers/gpu/drm/sti/sti_plane.h | 8 +++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sti/sti_plane.c b/drivers/gpu/drm/sti/sti_plane.c
index 29e669ccec5b..f8d65d608b64 100644
--- a/drivers/gpu/drm/sti/sti_plane.c
+++ b/drivers/gpu/drm/sti/sti_plane.c
@@ -28,8 +28,16 @@ const char *sti_plane_to_str(struct sti_plane *plane)
 		return "GDP2";
 	case STI_GDP_3:
 		return "GDP3";
+	case STI_GDP_4:
+		return "GDP4";
+	case STI_GDP_5:
+		return "GDP5";
 	case STI_HQVDP_0:
 		return "HQVDP0";
+	case STI_HQVDP_1:
+		return "HQVDP1";
+	case STI_HQVDP_2:
+		return "HQVDP2";
 	case STI_CURSOR:
 		return "CURSOR";
 	default:
diff --git a/drivers/gpu/drm/sti/sti_plane.h b/drivers/gpu/drm/sti/sti_plane.h
index 2c0156bede9c..51fc25ed0287 100644
--- a/drivers/gpu/drm/sti/sti_plane.h
+++ b/drivers/gpu/drm/sti/sti_plane.h
@@ -25,7 +25,9 @@ enum sti_plane_id_of_type {
 	STI_ID_0 = 0,
 	STI_ID_1 = 1,
 	STI_ID_2 = 2,
-	STI_ID_3 = 3
+	STI_ID_3 = 3,
+	STI_ID_4 = 4,
+	STI_ID_5 = 5,
 };
 
 enum sti_plane_desc {
@@ -33,7 +35,11 @@ enum sti_plane_desc {
 	STI_GDP_1       = STI_GDP | STI_ID_1,
 	STI_GDP_2       = STI_GDP | STI_ID_2,
 	STI_GDP_3       = STI_GDP | STI_ID_3,
+	STI_GDP_4       = STI_GDP | STI_ID_4,
+	STI_GDP_5       = STI_GDP | STI_ID_5,
 	STI_HQVDP_0     = STI_VDP | STI_ID_0,
+	STI_HQVDP_1     = STI_VDP | STI_ID_1,
+	STI_HQVDP_2     = STI_VDP | STI_ID_2,
 	STI_CURSOR      = STI_CUR,
 	STI_BACK        = STI_BCK
 };
-- 
2.34.1

