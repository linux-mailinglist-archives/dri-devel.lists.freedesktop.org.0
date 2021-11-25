Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F246545DDA9
	for <lists+dri-devel@lfdr.de>; Thu, 25 Nov 2021 16:40:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D04BE6E9C6;
	Thu, 25 Nov 2021 15:39:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2057.outbound.protection.outlook.com [40.107.94.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78F156E9A9;
 Thu, 25 Nov 2021 15:39:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bGe0m0FZ7O3zNmI1XmVtlOhiOMS6PjWG2KVRjM/j2WD8LJw/yf1grUg6u88ShYCzkh22R9z+/5vUhCrttPssZ0IugqRyCeXHfbfFc1QCVNFvSV2h6jVeYvO3i/PQCUkKJ0S4icze+3NgvxLZzEjhEsEvLiCgBEtl9a4Jdo0QCCMh4R2Ty33zLr5TVo3UrDYLPcaXTBm+/8L2RcFGroiOfPR49pplgeBan/zKub+6A9e42O9h2+oTmB8z6tRSM7551pKa3u4Jsl82HIHHYg/mmxWXyOP32aqJ+oLD7w/1GmWN/Sj0GWjzv7dH6CdG6uOrUrvji3ejMH3yW0U2tB8vxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8EegBR2Pqnsz+vVOkDV+uJ2XE85pA6KgmjrVhCSPzeo=;
 b=C66S1QwgSdq7C7N+Vl2wjfdhH/oSyCqYHUMqMpe2oeNrwiq/346DeBRXwpgUNC/siBuxhvhEH8SVkXxiACHI+zegbRFpmRpAIbK+XJ91DDRhNYsvoj84FJzUfLRANw2CbwX3EcEvkvtzIRSiQNNozC9CIXZsORmgsFn/a/gSpTxbVfEQsExO+CE+IuDLH61l6Hmi5dUAcEHgg9068KpYUKB63oaEj3SWDnOaMsLRngDTRZwrdsNaTDPnjFQCQYGieYKotXhsYbWoKpIq1E0GniuD2bx37lVPSe2bh1v5VJFyxYWNkTZqQhfkjI6YLtFRB+779wekJKVcXjB1sPLLag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=emersion.fr smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8EegBR2Pqnsz+vVOkDV+uJ2XE85pA6KgmjrVhCSPzeo=;
 b=k/QER9fBOwzNHBY3bC1g1gWEotUqsGldnS+vHiacWBg0WBGIAyctR3Et9+RN+1h9C8sFYETafCnChe1BvFY8psp+GFbAa8cxdORTiJ4MOUX1Va/AGKN4BSXtjN7oCH5wMSL0ch5klcyXaVS+6a2LTNWvr/eP1qlEzT9egJQCk7o=
Received: from BN6PR2001CA0037.namprd20.prod.outlook.com
 (2603:10b6:405:16::23) by DM8PR12MB5429.namprd12.prod.outlook.com
 (2603:10b6:8:29::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Thu, 25 Nov
 2021 15:39:36 +0000
Received: from BN8NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:16:cafe::76) by BN6PR2001CA0037.outlook.office365.com
 (2603:10b6:405:16::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.21 via Frontend
 Transport; Thu, 25 Nov 2021 15:39:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT066.mail.protection.outlook.com (10.13.177.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4734.22 via Frontend Transport; Thu, 25 Nov 2021 15:39:36 +0000
Received: from atma2.hitronhub.home (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 25 Nov
 2021 09:39:34 -0600
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Simon Ser <contact@emersion.fr>, =?UTF-8?q?Michel=20D=C3=A4nzer?=
 <michel@daenzer.net>, Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>, Roman Gilg
 <subdiff@gmail.com>, Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 "Harry Wentland" <Harry.Wentland@amd.com>, Mark Yacoub
 <markyacoub@chromium.org>, Sean Paul <seanpaul@chromium.org>, Pekka Paalanen
 <ppaalanen@gmail.com>
Subject: [PATCH 2/6] Documentation/gpu: Document amdgpu_dm_visual_confirm
 debugfs entry
Date: Thu, 25 Nov 2021 10:38:26 -0500
Message-ID: <20211125153830.1352994-3-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211125153830.1352994-1-Rodrigo.Siqueira@amd.com>
References: <20211125153830.1352994-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 62dcc467-2f5d-4bb5-73c4-08d9b029c90c
X-MS-TrafficTypeDiagnostic: DM8PR12MB5429:
X-Microsoft-Antispam-PRVS: <DM8PR12MB5429755C0382F2743A5CAD7998629@DM8PR12MB5429.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ch+ahmD2RIzRP+6gP/jd/5F1LE9CdUaVSw/h3Zt02xUvQH3sJWEEutH6rM2aABU3plRkCJ9lzCxq6AULOOyuAY9OZ+XI+ETdJjfXtekXenUMIwPur0I1RhuSfI1jbwG0cIrfOpW190ENQu/4TfNdSAvprhEM8K8FhxJ6ND0IRDGjgBjIR4B/j1pejYWmU2PrclJudz9g+jJjTV564T1ngxqoDH/UqfKRohNujLH9YTHpmXNQCuobFRBaOzrdtEVi1LN4M/LyJMZ5uGci9JbRe2xT19uZm82t7tcQ7IwVa2OTGyq4TIwYB/I6PqKYq+8mQFcPP5Mb8t7btnO1cSdR+OsKdvzb271QGTE79R2PDEEZQc0FKDzrsKNgsaMiZf/0B+5PFoHM9fS2at3I+att8MAFockGp6zxnbjyqEgEA9yBWILnytlO1sSR/gcu2jI9e0uo4lNHr6x9N2plmw2oOGD/QAd6oa3SagNeKqCUMFW5WKzHUy8Oxr5nSdUZqrmI/BewPix4OvTLAJxAkMmJOnJ+JRdVnQhuAlyJcsMUNhO0QOodzGAFwRGaDohcfK7/7ZQqdkfKwQI7LuaIATUpsHUHpJYFzcExgb5urFdq4Hm9jMxU9rDnhNpJVCz/IQVc1AJjz4+5ojIjjKv5y794JVAkzw9OXRrhkpDwzHbKnrPAWP5IWZ8050BdoTXnGjLU1T9tRhdS+/jtLQy2+Qn3GbEo54aV9ngBJtdLvPUMb8RkJ5nnXHboHvVTdeZlghuT
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(36860700001)(54906003)(110136005)(426003)(336012)(186003)(2616005)(8936002)(36756003)(6666004)(8676002)(1076003)(316002)(5660300002)(921005)(356005)(70586007)(7416002)(70206006)(86362001)(81166007)(82310400004)(47076005)(508600001)(4326008)(2906002)(16526019)(83380400001)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2021 15:39:36.2380 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62dcc467-2f5d-4bb5-73c4-08d9b029c90c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5429
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
Cc: linux-doc@vger.kernel.org, qingqing.zhuo@amd.com, roman.li@amd.com,
 amd-gfx@lists.freedesktop.org, aurabindo.pillai@amd.com, nicholas.choi@amd.com,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 bhawanpreet.lakha@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Display core provides a feature that makes it easy for users to debug
Multiple planes by enabling a visual notification at the bottom of each
plane. This commit introduces how to use such a feature.

Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 .../gpu/amdgpu-dc/amdgpu-dc-debug.rst         | 34 ++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/Documentation/gpu/amdgpu-dc/amdgpu-dc-debug.rst b/Documentation/gpu/amdgpu-dc/amdgpu-dc-debug.rst
index bbb8c3fc8eee..532cbbd64863 100644
--- a/Documentation/gpu/amdgpu-dc/amdgpu-dc-debug.rst
+++ b/Documentation/gpu/amdgpu-dc/amdgpu-dc-debug.rst
@@ -1,4 +1,36 @@
+========================
 Display Core Debug tools
 ========================
 
-TODO
+DC Debugfs
+==========
+
+Multiple Planes Debug
+---------------------
+
+If you want to enable or debug multiple planes in a specific user-space
+application, you can leverage a debug feature named visual confirm. For
+enabling it, you will need::
+
+  echo 1 > /sys/kernel/debug/dri/0/amdgpu_dm_visual_confirm
+
+You need to reload your GUI to see the visual confirmation. When the plane
+configuration changes or a full update occurs there will be a colored bar at
+the bottom of each hardware plane being drawn on the screen.
+
+* The color indicates the format - For example, red is AR24 and green is NV12
+* The height of the bar indicates the index of the plane
+* Pipe split can be observed if there are two bars with a difference in height
+  covering the same plane
+
+Consider the video playback case in which a video is played in a specific
+plane, and the desktop is drawn in another plane. The video plane should
+feature one or two green bars at the bottom of the video depending on pipe
+split configuration.
+
+* There should **not** be any visual corruption
+* There should **not** be any underflow or screen flashes
+* There should **not** be any black screens
+* There should **not** be any cursor corruption
+* Multiple plane **may** be briefly disabled during window transitions or
+  resizing but should come back after the action has finished
-- 
2.25.1

