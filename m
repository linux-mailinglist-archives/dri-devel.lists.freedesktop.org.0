Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5860811EBC9
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 21:23:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEDF46EDB0;
	Fri, 13 Dec 2019 20:23:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2078.outbound.protection.outlook.com [40.107.237.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4730D6EDB0;
 Fri, 13 Dec 2019 20:23:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cDRZjHqHJSYf/LcXlE63YIar8A3DFERy+m+bkOg+/ir0qLVLZnGvKZwVttJZFoUwD4rsiNZAWSMzmIdlAE+B6HYVek/vQfeLujp++IShuiJXlFsnhhK+DeWYb3MnV80dC9famINQKK76gpP+JeqsVetjcOs71YYo8OfE9m8iE5miDQQ6qKFiZpv4MEvcTGzWwJS2yb/gimmaYwtv3E6wh4hZJOjn07mU7DrNt5/2rYdnGck/d2QFaj0wQOcJizA6rN2Ic13CxbTRbD3/lIIJiuzsusGN8qjap4wNLQnAg1ETR3q8Dc+FO/EuibiHUbS/bvANlrRT2AClBOx1ax+Mag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hC5T8gOjaqiYqHg5t/D0+IFLxJ6m1tazoLdxzPODonE=;
 b=DliICrJVHn9jqvW2pMCm3pYcfAyp5HXmS1CfcgRBxB8Fs6wAQHDqrfb/c5thiZyZJKEeOq+j7uC5cJMQtZ1YLux9Ye7zbyPD/PrNU/D3HRB2b/3GQPtYQk08zRvsSh4KtOhIHpR6qLfX4UROKjqLpKj6gGg6SgOVSl0JzQKtdO34NYlqwnDkeWkj60SdSFV5e4yVgAXWln+JcfJo6lOSAq63El6neBZqkEK7B/54f6E03G0sLUefP75t0pG9TT7OExrL9v/XL2EYDWx8KToeyCOAp0TNLUI7XSeF7B+hDUiF6wGu25oknRLlD1NybNXV27fgqJDYAGDCNV/kVg0gtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hC5T8gOjaqiYqHg5t/D0+IFLxJ6m1tazoLdxzPODonE=;
 b=YpOB4ILoqGYLJ9twdwX/db0WPrvzxG9BNaTNBAWX2UPs0UvD03pEq5HYW/ZUF1QWk2OizohxG4skd067IH3EchmpbTn4zFsqum+VIFM8qG5pwg4dY8NmOCO6m/Zf5rVQX63G8g5PrWk99RXWBd5lwWHEhkRG1oQ24ugqg9G5m1g=
Received: from DM6PR12CA0034.namprd12.prod.outlook.com (2603:10b6:5:1c0::47)
 by MN2PR12MB4206.namprd12.prod.outlook.com (2603:10b6:208:1d5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.18; Fri, 13 Dec
 2019 20:09:06 +0000
Received: from DM6NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eaa::207) by DM6PR12CA0034.outlook.office365.com
 (2603:10b6:5:1c0::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.16 via Frontend
 Transport; Fri, 13 Dec 2019 20:09:06 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM6NAM11FT027.mail.protection.outlook.com (10.13.172.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2538.14 via Frontend Transport; Fri, 13 Dec 2019 20:09:06 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 13 Dec
 2019 14:09:05 -0600
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Fri, 13 Dec 2019 14:09:05 -0600
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v9 16/18] drm/amd/display: Recalculate VCPI slots for new DSC
 connectors
Date: Fri, 13 Dec 2019 15:08:52 -0500
Message-ID: <20191213200854.31545-17-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191213200854.31545-1-mikita.lipski@amd.com>
References: <20191213200854.31545-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(396003)(39860400002)(428003)(199004)(189003)(2906002)(1076003)(2876002)(5660300002)(450100002)(4326008)(54906003)(6916009)(8936002)(81166006)(81156014)(8676002)(426003)(70586007)(26005)(36756003)(2616005)(186003)(336012)(478600001)(6666004)(356004)(7696005)(70206006)(86362001)(316002)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4206; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e2ea679-6096-460a-5f4b-08d780084e7b
X-MS-TrafficTypeDiagnostic: MN2PR12MB4206:
X-Microsoft-Antispam-PRVS: <MN2PR12MB42069371DEF3F046A8000172E4540@MN2PR12MB4206.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 0250B840C1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aKjYsqEkd/nm8T+9z+MIfOA/fnWX3htVtCdF5SP0MU/LP+kztYXdKUrm2chP2IlsB86ipMaqsqCodQZkgD3EFPvLkg0Il5a5BuvjFn9dkxm/FEaC8UlyWiTsPct4CKB+W0J2bjEB9i0NSSAdZbDolpWm1TL9wnpC5nd4bkCgC/QGoSx3YG6PO26f4KOhZVfN1R6Pv+3PzuTMwtbZ5wvJfaiJZP4OZ2m3lE/nnx/5N7+Sx6NeIYOiTPJUSZPKr42cU01E95BQFEtGya89kN+eK09jGAd/8L3tLAEcQ0owZlJXfHVjDEB/LZ+QXAQ5l9ldH32Bm2hKnmP7Bqw4+P7YVU3RLqGsjGIjO6GZGPVIW7VMAOZ6h50zKvI8lrLpl5AklUJhk+wMFQ0oE/64OsT4y0FAHeH/Se/QFrb1TcrIt8BnFx6rLq3OwH+OinlZdgsAj3MFP6KH8nF6EL53VLdXD3rLRxIsGYPFjSa5d6S2mitl0pepQ3ha9FqVsdgskzkV
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2019 20:09:06.0165 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e2ea679-6096-460a-5f4b-08d780084e7b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4206
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
Cc: Mikita Lipski <mikita.lipski@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mikita Lipski <mikita.lipski@amd.com>

[why]
Since for DSC MST connector's PBN is claculated differently
due to compression, we have to recalculate both PBN and
VCPI slots for that connector.

[how]
The function iterates through all the active streams to
find, which have DSC enabled, then recalculates PBN for
it and calls drm_dp_helper_update_vcpi_slots_for_dsc to
update connector's VCPI slots.

v2: - use drm_dp_mst_atomic_enable_dsc per port to
enable/disable DSC

v3: - Iterate through connector states from the state passed
    - On each connector state get stream from dc_state,
instead CRTC state

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Mikita Lipski <mikita.lipski@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 76 +++++++++++++++++--
 1 file changed, 71 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 93a230d956ee..2ac3a2f0b452 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -4986,6 +4986,69 @@ const struct drm_encoder_helper_funcs amdgpu_dm_encoder_helper_funcs = {
 	.atomic_check = dm_encoder_helper_atomic_check
 };
 
+static int dm_update_mst_vcpi_slots_for_dsc(struct drm_atomic_state *state,
+					    struct dc_state *dc_state)
+{
+	struct dc_stream_state *stream = NULL;
+	struct drm_connector *connector;
+	struct drm_connector_state *new_con_state, *old_con_state;
+	struct amdgpu_dm_connector *aconnector;
+	struct dm_connector_state *dm_conn_state;
+	int i, j, clock, bpp;
+	int vcpi, pbn_div, pbn = 0;
+
+	for_each_oldnew_connector_in_state(state, connector, old_con_state, new_con_state, i) {
+
+		aconnector = to_amdgpu_dm_connector(connector);
+
+		if (!aconnector->port)
+			continue;
+
+		if (!new_con_state || !new_con_state->crtc)
+			continue;
+
+		dm_conn_state = to_dm_connector_state(new_con_state);
+
+		for (j = 0; j < dc_state->stream_count; j++) {
+			stream = dc_state->streams[j];
+			if (!stream)
+				continue;
+
+			if ((struct amdgpu_dm_connector*)stream->dm_stream_context == aconnector)
+				break;
+
+			stream = NULL;
+		}
+
+		if (!stream)
+			continue;
+
+		if (stream->timing.flags.DSC != 1) {
+			drm_dp_mst_atomic_enable_dsc(state,
+						     aconnector->port,
+						     dm_conn_state->pbn,
+						     0,
+						     false);
+			continue;
+		}
+
+		pbn_div = dm_mst_get_pbn_divider(stream->link);
+		bpp = stream->timing.dsc_cfg.bits_per_pixel;
+		clock = stream->timing.pix_clk_100hz / 10;
+		pbn = drm_dp_calc_pbn_mode(clock, bpp, true);
+		vcpi = drm_dp_mst_atomic_enable_dsc(state,
+						    aconnector->port,
+						    pbn, pbn_div,
+						    true);
+		if (vcpi < 0)
+			return vcpi;
+
+		dm_conn_state->pbn = pbn;
+		dm_conn_state->vcpi_slots = vcpi;
+	}
+	return 0;
+}
+
 static void dm_drm_plane_reset(struct drm_plane *plane)
 {
 	struct dm_plane_state *amdgpu_state = NULL;
@@ -8022,11 +8085,6 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 	if (ret)
 		goto fail;
 
-	/* Perform validation of MST topology in the state*/
-	ret = drm_dp_mst_atomic_check(state);
-	if (ret)
-		goto fail;
-
 	if (state->legacy_cursor_update) {
 		/*
 		 * This is a fast cursor update coming from the plane update
@@ -8098,6 +8156,10 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 		if (!compute_mst_dsc_configs_for_state(state, dm_state->context))
 			goto fail;
 
+		ret = dm_update_mst_vcpi_slots_for_dsc(state, dm_state->context);
+		if (ret)
+			goto fail;
+
 		if (dc_validate_global_state(dc, dm_state->context, false) != DC_OK) {
 			ret = -EINVAL;
 			goto fail;
@@ -8126,6 +8188,10 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 				dc_retain_state(old_dm_state->context);
 		}
 	}
+	/* Perform validation of MST topology in the state*/
+	ret = drm_dp_mst_atomic_check(state);
+	if (ret)
+		goto fail;
 
 	/* Store the overall update type for use later in atomic check. */
 	for_each_new_crtc_in_state (state, crtc, new_crtc_state, i) {
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
