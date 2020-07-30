Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A78FC2339CF
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 22:37:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BD5F6E970;
	Thu, 30 Jul 2020 20:37:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2046.outbound.protection.outlook.com [40.107.243.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 934416E967;
 Thu, 30 Jul 2020 20:37:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Us10SLwZMQQ8zodDG+/f5f7j2tI2kOYNkbBy6IN9WuO/ZeIYEAvbtIU742gvTA8D1z2kqfGJLlm2qzLziPROjvBqMAP+4CLkxKKBqyvYHtVR9SSf1sUt/XH1MxxIwtUo8MhoRGaP8gMvKSfaWsI33TNzELKF6Ssx/e2OWUS3dhMZ+rtpo/FEOXuWPIPzqDzFloSsYywhptNcT3mBa6eQMdWBU3awafaSwatIO0YWXDzRBipxj1592s1c2F1A5VNftvTkoxA4R6TYt57SWKkdC9nTQURK2NF2dvnW49ehvKK0TaU0O6J2lMZoGt+WskZ+6gWW8510p6t4FJS0lBS7Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GF0OwY5H9q+6V2tAxWB5b0Pe8xUd77HhnIMjZCsb+7U=;
 b=QcxGcYNIEzPsd6o8c1kH8Tu1eZ95AOlGpj+l7DoJClHuOqOjvPcQm0wb8aToXxbJgvii9/oSwfQGwFFJTa/lQG1UtK+sLSJ+V+OmfRfbHbXi2RLugg0eFDtr8TvoTlnv5zjk5bzxpKHqUa14F5tKRs3JgEqs9LDFBR2IQS6kcvsSI8fGgfRWcIC8Iw8nFcSxrLkmbxfYgD80awTYUm1jCXDdCFkzXBGSWBm8yJualzghQfWZRZdEO0wzjMR3OFTxDWlXb6YiNllDX1Ms0AV/AKi+WcSvG/+65Y+FDtn2zbZVC1h8TxdPOMlHF6pYqH0lyH4mV23ukqQ4XHVxnqHmDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GF0OwY5H9q+6V2tAxWB5b0Pe8xUd77HhnIMjZCsb+7U=;
 b=K5ZapqBvz/q/nK7PL1aZOi8dTicxDF6dmxI73JUekYbPKtzClkroDZWTJPWi/60FrJj5X+IvpJvBNislXzFAgfrX5t1wUph7LRn0lFELcXsQjkoCoqemiLRGSzVEiTV4tQp0xCmhrUipzIPBGKXLnKqUM5ebXNmJ/7vcdJa6m+A=
Received: from MWHPR19CA0094.namprd19.prod.outlook.com (2603:10b6:320:1f::32)
 by MW2PR12MB2570.namprd12.prod.outlook.com (2603:10b6:907:a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Thu, 30 Jul
 2020 20:37:35 +0000
Received: from CO1NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2603:10b6:320:1f:cafe::17) by MWHPR19CA0094.outlook.office365.com
 (2603:10b6:320:1f::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17 via Frontend
 Transport; Thu, 30 Jul 2020 20:37:34 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 CO1NAM11FT025.mail.protection.outlook.com (10.13.175.232) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3239.17 via Frontend Transport; Thu, 30 Jul 2020 20:37:34 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 30 Jul
 2020 15:37:32 -0500
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 30 Jul
 2020 15:37:32 -0500
Received: from DESKTOP-3JO4JG6.localdomain (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Thu, 30 Jul 2020 15:37:31 -0500
From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 5/7] drm/amd/display: Reset plane for anything that's not a
 FAST update
Date: Thu, 30 Jul 2020 16:36:40 -0400
Message-ID: <20200730203642.17553-6-nicholas.kazlauskas@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200730203642.17553-1-nicholas.kazlauskas@amd.com>
References: <20200730203642.17553-1-nicholas.kazlauskas@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c912bef-2eab-4e8b-ff6f-08d834c863fe
X-MS-TrafficTypeDiagnostic: MW2PR12MB2570:
X-Microsoft-Antispam-PRVS: <MW2PR12MB257067E7C08C1481B140157CEC710@MW2PR12MB2570.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lsDqLDZUSLJDGFB6zyRUTAFcEra2UNyYF1IMnH5z7e7xvMgA/Iy7HfTWT/YTLFtLgFkwTYLzj1QNjCOWjHVhWWey3NI9YKuGkZjV2hB1XtAg/fgXFSn/UnhC2H87TRW35ycxB0bJUTWYbVFo/UD64WoA7u6SqKooFNirFQdysXoGb/nw0/or25pu3x0WnT0y2tPM4IGq5Y9hUl3MVfEM89606fWoEDk1BFYg9qEpPt+bICe4ZeXjvApjQbKKnHyL2xiF6cn4wqpIROk76MpV4sm2HQZMkKFZzjCw/MqNDDj8Ed/vmkJ2KMPNx8KBC7VHO6p7iT54BAwTF9j7MDUDXYm+mGC5m4TzxhNMXc7l+xvEbxMrUHRxpQMxj4kwATuT6uvizyMpIgkpN3bLaptYlA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB01.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(39860400002)(346002)(396003)(136003)(46966005)(478600001)(8936002)(36756003)(316002)(86362001)(6666004)(1076003)(450100002)(4326008)(44832011)(83380400001)(2616005)(54906003)(186003)(70206006)(82740400003)(356005)(336012)(81166007)(15650500001)(47076004)(426003)(82310400002)(70586007)(2906002)(110136005)(5660300002)(8676002)(26005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2020 20:37:34.7045 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c912bef-2eab-4e8b-ff6f-08d834c863fe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT025.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2570
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
Cc: Hersen Wu <hersenxs.wu@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Why]
MEDIUM or FULL updates can require global validation or affect
bandwidth. By treating these all simply as surface updates we aren't
actually passing this through DC global validation.

[How]
There's currently no way to pass surface updates through DC global
validation, nor do I think it's a good idea to change the interface
to accept these.

DC global validation itself is currently stateless, and we can move
our update type checking to be stateless as well by duplicating DC
surface checks in DM based on DRM properties.

We wanted to rely on DC automatically determining this since DC knows
best, but DM is ultimately what fills in everything into DC plane
state so it does need to know as well.

There are basically only three paths that we exercise in DM today:

1) Cursor (async update)
2) Pageflip (fast update)
3) Full pipe programming (medium/full updates)

Which means that anything that's more than a pageflip really needs to
go down path #3.

So this change duplicates all the surface update checks based on DRM
state instead inside of should_reset_plane().

Next step is dropping dm_determine_update_type_for_commit and we no
longer require the old DC state at all for global validation.

Optimization can come later so we don't reset DC planes at all for
MEDIUM udpates and avoid validation, but we might require some extra
checks in DM to achieve this.

Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Cc: Hersen Wu <hersenxs.wu@amd.com>
Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 0d5f45742bb5..2cbb29199e61 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -8336,6 +8336,31 @@ static bool should_reset_plane(struct drm_atomic_state *state,
 		if (old_other_state->crtc != new_other_state->crtc)
 			return true;
 
+		/* Src/dst size and scaling updates. */
+		if (old_other_state->src_w != new_other_state->src_w ||
+		    old_other_state->src_h != new_other_state->src_h ||
+		    old_other_state->crtc_w != new_other_state->crtc_w ||
+		    old_other_state->crtc_h != new_other_state->crtc_h)
+			return true;
+
+		/* Rotation / mirroring updates. */
+		if (old_other_state->rotation != new_other_state->rotation)
+			return true;
+
+		/* Blending updates. */
+		if (old_other_state->pixel_blend_mode !=
+		    new_other_state->pixel_blend_mode)
+			return true;
+
+		/* Alpha updates. */
+		if (old_other_state->alpha != new_other_state->alpha)
+			return true;
+
+		/* Colorspace changes. */
+		if (old_other_state->color_range != new_other_state->color_range ||
+		    old_other_state->color_encoding != new_other_state->color_encoding)
+			return true;
+
 		/* Framebuffer checks fall at the end. */
 		if (!old_other_state->fb || !new_other_state->fb)
 			continue;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
