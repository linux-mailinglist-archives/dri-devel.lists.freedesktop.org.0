Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 970CB2339CE
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 22:37:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E81456E968;
	Thu, 30 Jul 2020 20:37:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2070.outbound.protection.outlook.com [40.107.93.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 235196E968;
 Thu, 30 Jul 2020 20:37:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YJqR9kZkhcqCO8JwwwTXelWqyxnmNPBaokxLeJSkxaC0O0DeFbDrPn/9346OeTMjZVb5pGZEMqTzj2XGpX/g/wYMjxfoaq84xl5qUkDX0qoO0bS+IkyWD95oO+fbQt+hkw4TQMCSKB5K52NvqHSVPyDiRTdvFXFyxm/4ej9R1lIts7AKfzJmAyFncRHqpecVGvmOiRmiNyU4ZNF1QDvsTVL6gVPYkczuXJiq/eOtMessBXx+TBic00ZwrbwSK5WoxQx+5Dv3Cp+vrIm/r0sViLsm7G2NfxlwYREjqXmVmiaJ+gbdI+nDF8Wuu0uM4whOUFx+FAUodOpG4cICLVqYqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U8WVkK0B4fZvLwVomCw7YDgXkP8Ga+76xN2OM96rKOc=;
 b=EuupxSiYxT9IkicJfRXLL/w+f/AUQ3HrNXoiKYOBDdP8/XTpqH6IhSc4kPelAiRlun+4SlJfuwkc/P8ZB8GWtBQYFO0YLplLiZIMyc83u7PZs50ydsoNSXFuUbObhQujA60etHaVsHhOgHPpOQ13bWlhOo9wz10kSImdFC4OP/ETZ2zqvNzANF/js4y1zUrnUPHcNu64kNrZf13iLNyL0DUpvLlly3s9KGLp1soU1INbon83SwRws4RPdpeoOoWWh5tcY+ssBsV7DW4mZL65qOENa8yG+lyWFWsbyrr/l63aYSsJQuaMtAwkGTNUOLh5bWwRKeTWY4JfUErkLziTkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U8WVkK0B4fZvLwVomCw7YDgXkP8Ga+76xN2OM96rKOc=;
 b=vA7Mo/pKlcctaPeAyngVAwqw4qxeF9gQKiDYR8VgjOhqLbRCXFMbX7SlZVGPqAfey4gstECQA/TuTejUQrKn44cVvV1IBdUpsA2yt8u8RipoqMlSTJGTLGnRjtUP5quU1SSoZRhF479JxXUll23kCJg92zEYq0ohVU64GRqtz8g=
Received: from MWHPR19CA0085.namprd19.prod.outlook.com (2603:10b6:320:1f::23)
 by DM5PR12MB2408.namprd12.prod.outlook.com (2603:10b6:4:b9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23; Thu, 30 Jul
 2020 20:37:33 +0000
Received: from CO1NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2603:10b6:320:1f:cafe::59) by MWHPR19CA0085.outlook.office365.com
 (2603:10b6:320:1f::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend
 Transport; Thu, 30 Jul 2020 20:37:33 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 CO1NAM11FT025.mail.protection.outlook.com (10.13.175.232) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3239.17 via Frontend Transport; Thu, 30 Jul 2020 20:37:33 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 30 Jul
 2020 15:37:30 -0500
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 30 Jul
 2020 15:37:29 -0500
Received: from DESKTOP-3JO4JG6.localdomain (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Thu, 30 Jul 2020 15:37:29 -0500
From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/7] drm/amd/display: Reset plane when tiling flags change
Date: Thu, 30 Jul 2020 16:36:37 -0400
Message-ID: <20200730203642.17553-3-nicholas.kazlauskas@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200730203642.17553-1-nicholas.kazlauskas@amd.com>
References: <20200730203642.17553-1-nicholas.kazlauskas@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce1fe0fe-3422-4e0f-01c0-08d834c86324
X-MS-TrafficTypeDiagnostic: DM5PR12MB2408:
X-Microsoft-Antispam-PRVS: <DM5PR12MB24088146A0D4578A4D36D135EC710@DM5PR12MB2408.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qo8xm47dsBOVgYmpJkyOLksMxM0LdCoStUlfZyxaqUcQzch4ixodygxhCErTD2lpQRDJ976ajzN7/UEadJvlJWqHzkVMGnVt3FS6ER5lkSFdnM5msM0IRYq58AftKFhEihdVJT7qsj9l2rsXuWfKtcgm+5/0GQazf4OWh8LOp39e8XEJkzwxgr/8Ig5j1OU188mEmFKBhALN3wPjBRaR7xjWf3pSJa8MoJsvYscQXgh3CfNr39v8xVDxXvaBv/0kJDuhm6C2dw85rbjfp6se7wx0BHPWAEWi8vnl9HsgqJ81AvnHzw+vQzVPyNxsdmcjEC7nBXC4MqPTd84Q+EQD7MKEWWFhCBckvlmAMyNWePjUplk2FEVurf54THbVNZPwJdAwoPHj1ETZA+d3q/xCYw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB01.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(136003)(396003)(39860400002)(346002)(46966005)(356005)(70586007)(83380400001)(82310400002)(86362001)(2616005)(70206006)(426003)(44832011)(6666004)(186003)(1076003)(26005)(336012)(478600001)(4326008)(8936002)(8676002)(450100002)(316002)(54906003)(2906002)(82740400003)(81166007)(36756003)(47076004)(5660300002)(110136005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2020 20:37:33.2713 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce1fe0fe-3422-4e0f-01c0-08d834c86324
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT025.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2408
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
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Why]
Enabling or disable DCC or switching between tiled and linear formats
can require bandwidth updates.

They're currently skipping all DC validation by being treated as purely
surface updates.

[How]
Treat tiling_flag changes (which encode DCC state) as a condition for
resetting the plane.

Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Hersen Wu <hersenxs.wu@amd.com>
Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 7cc5ab90ce13..bf1881bd492c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -8332,6 +8332,8 @@ static bool should_reset_plane(struct drm_atomic_state *state,
 	 * TODO: Come up with a more elegant solution for this.
 	 */
 	for_each_oldnew_plane_in_state(state, other, old_other_state, new_other_state, i) {
+		struct dm_plane_state *old_dm_plane_state, *new_dm_plane_state;
+
 		if (other->type == DRM_PLANE_TYPE_CURSOR)
 			continue;
 
@@ -8342,9 +8344,20 @@ static bool should_reset_plane(struct drm_atomic_state *state,
 		if (old_other_state->crtc != new_other_state->crtc)
 			return true;
 
-		/* TODO: Remove this once we can handle fast format changes. */
-		if (old_other_state->fb && new_other_state->fb &&
-		    old_other_state->fb->format != new_other_state->fb->format)
+		/* Framebuffer checks fall at the end. */
+		if (!old_other_state->fb || !new_other_state->fb)
+			continue;
+
+		/* Pixel format changes can require bandwidth updates. */
+		if (old_other_state->fb->format != new_other_state->fb->format)
+			return true;
+
+		old_dm_plane_state = to_dm_plane_state(old_other_state);
+		new_dm_plane_state = to_dm_plane_state(new_other_state);
+
+		/* Tiling and DCC changes also require bandwidth updates. */
+		if (old_dm_plane_state->tiling_flags !=
+		    new_dm_plane_state->tiling_flags)
 			return true;
 	}
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
