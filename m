Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 026CB64A6FC
	for <lists+dri-devel@lfdr.de>; Mon, 12 Dec 2022 19:23:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D20410E27E;
	Mon, 12 Dec 2022 18:23:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2079.outbound.protection.outlook.com [40.107.220.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B53D110E269;
 Mon, 12 Dec 2022 18:22:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fP/K4vYFQN1GisIwcm2NHerVBLvbgwDNq2lDmP7KMCTD1bFlMrV2mlUc2aLhgJB3cxc+SqQDXiewq0BWb0Tz4cfFQvEgY+Yh40wETGsUAN/ilD5GKlxITMQHQ22yxNd0s8NKAESezvTttPkJL8oHZ12Kz1iZY4u8kAT1s6eAsbIlzKvBqOBqT2L1zuv4PaWy6A8oN8yA9/kESt2geir0IoZ9nKMLESEGGPnoLlk5Kqc7k6QGtM8NqpJ31K9ExfK4YlIE8ghcZprad7qIONHolYrixhfRiM015aEXPRiE3fjKwpbIBLCPm6PE0zR3V5eJsBeWHSjSKeMTJ7puVT3/Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j69fMfOL+PelgJvfYmIWOsfLIOxkqNoOjprsfR4XUdE=;
 b=cKwh+o2xR9mwoNn2F+r6komZmjOm/zzCobXcnEHRm15d1xRyE7ubxRqxGk2UY4JGf9Z3BXOKXgk96SVPOPZiqj1PvasEBb9YfiwNpgan5bItsf7QB2d1g5itjJ//oKH55IxZG+2rv4WFci1rE9yooKDBWjnj73uto0aeoIVAgn0QmziaYFm8iTWQeh+wF2VpnqXJP0Z+C0LhlvrTvqVQ/suQEUCMNCGLJb15LnnSu20xnaD5jHmdntLoe6o9YawlCHlfF5mVdcuVsM4NKiq0bV5r1ziYOnm0FFirZDwppqdY9xFLpNyD1j9EKZL71Veomvu+aX3/jvRmpS5yLmREKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j69fMfOL+PelgJvfYmIWOsfLIOxkqNoOjprsfR4XUdE=;
 b=TF270bnMarwzQ0hswjywonTr94FyTIkPQ0SrCtH9nrekUsghUznr0rubwZB4//ir7xhXya6ySxJFTESkKhRaCc2PloFmkR2924NNV0zRXbQOFZ/A0o7qdCYgbjjU+UYccBdKP/0GYnrjoLM1pQMxnIzQMCLsOyfnVIoAuJR6IkA=
Received: from BN9PR03CA0520.namprd03.prod.outlook.com (2603:10b6:408:131::15)
 by IA1PR12MB7662.namprd12.prod.outlook.com (2603:10b6:208:425::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Mon, 12 Dec
 2022 18:22:32 +0000
Received: from BN8NAM11FT013.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:131:cafe::3c) by BN9PR03CA0520.outlook.office365.com
 (2603:10b6:408:131::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19 via Frontend
 Transport; Mon, 12 Dec 2022 18:22:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT013.mail.protection.outlook.com (10.13.176.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5901.21 via Frontend Transport; Mon, 12 Dec 2022 18:22:32 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 12 Dec
 2022 12:22:27 -0600
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 12 Dec 2022 12:22:26 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 13/16] drm/amd/display: Add support for explicit BT601_YCC
Date: Mon, 12 Dec 2022 13:21:34 -0500
Message-ID: <20221212182137.374625-14-harry.wentland@amd.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212182137.374625-1-harry.wentland@amd.com>
References: <20221212182137.374625-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT013:EE_|IA1PR12MB7662:EE_
X-MS-Office365-Filtering-Correlation-Id: f8b71a90-bbc6-4b23-74e3-08dadc6dd616
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X5waaN2NE9KibYgyiYjUfdA5nGV1O3wwk/PB3xabXkelzepDxLDNOXUumLJ519HLtLGfftWA/DCY54yQ44ybBozIBKg0i2u2FsT9s0q0Hn6jtEjUWl0Cj5JTEShdFR8PEQvSdktowqtga1aw9tOUofqJw6NXTh25/aRMIglruNGzzNfpbdPczxe5l8wpz5+AW5/UUj3viKv44b8zxygd5bosmYha2aISlzq1EFoHXsb48bAcm5BVv3i7zVHbpRvatlLCTbKJ2EJi1Nlo2IircprdocybxWsV4AniNXyaBP+WQB8lZdCH34/4IVSiQKXKwuzjgJGxpshQJTVlxUL7ZEvka3wf7Rb8qWG9nGsZuW+Z7Be7ww1SWZXRt/cYpDAAituIBNczRvUdkOvn6RVVO2fQxMIPx/aQ71H3MeVLjjDzr0cqoJkrqMlsQfJrDLUFg8mB7OQW+HUI+Mt9+fRkbAIvaX5aak6VXf1apv6S7+fCOly0MZdjCueoGKk6enoqq6VD1ZfOwx1oeCT+rd6qIBhyqiPeYeFI9lNyWFpDNOiMNbXqEINbdtTwQObhLJyCsoHKvhxBCxh1nYdfbSVDbJTpoRx1DtJVNT4O0pCk9MJDxCODIW1A7F3ogl6+jZgYHMBrZLQxZE663df/vuYsJQUF5qd/tps3oSA0Pik5JzA6WfGiDxuQW52OVN3lmZqOxF9IszJalad/4mQoYRR0WzP8JSOIQ4sxk/W2fldpFYg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:CA; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(136003)(396003)(376002)(451199015)(36840700001)(40470700004)(46966006)(36756003)(81166007)(40480700001)(8936002)(478600001)(41300700001)(6666004)(82310400005)(356005)(82740400003)(86362001)(40460700003)(36860700001)(5660300002)(336012)(1076003)(44832011)(2616005)(316002)(70206006)(110136005)(4326008)(70586007)(8676002)(186003)(26005)(54906003)(426003)(83380400001)(47076005)(7696005)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 18:22:32.7219 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8b71a90-bbc6-4b23-74e3-08dadc6dd616
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT013.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7662
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <ppaalanen@gmail.com>, Uma Shankar <uma.shankar@intel.com>,
 Vitaly.Prosyak@amd.com, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We use this by default but if userspace passes this explicitly
we should respect it.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Vitaly.Prosyak@amd.com
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 5b347f8f4193..768c0c8fada1 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -5175,6 +5175,12 @@ get_output_color_space(const struct dc_crtc_timing *dc_crtc_timing,
 				color_space = COLOR_SPACE_YCBCR601;
 		}
 		break;
+	case DRM_MODE_COLORIMETRY_BT601_YCC:
+		if (dc_crtc_timing->flags.Y_ONLY)
+			color_space = COLOR_SPACE_YCBCR601_LIMITED;
+		else
+			color_space = COLOR_SPACE_YCBCR601;
+		break;
 	case DRM_MODE_COLORIMETRY_BT709_YCC:
 		if (dc_crtc_timing->flags.Y_ONLY)
 			color_space = COLOR_SPACE_YCBCR709_LIMITED;
-- 
2.38.1

