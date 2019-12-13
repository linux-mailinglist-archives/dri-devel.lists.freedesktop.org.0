Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 028F311EBA7
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 21:09:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE10D6ED92;
	Fri, 13 Dec 2019 20:09:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2051.outbound.protection.outlook.com [40.107.94.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D08626ED63;
 Fri, 13 Dec 2019 20:09:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XiGjUQF6rR47f6tmvi2xoO0iNOrt/MLFha0aCKahl2Go3vL106DmRssZpqKOdUpthvQSK4cFJCtM1PzO3nM4+4YdKnOD4rPDcvYa18+uNP+4HiK5ijOMfw5XGPGQ0XrVe8rgGOfeve63ztWISr8QjJ+oW2XUFsqrfKAkJJQgiObPEEDQWov1B4gjK0aq1u9AXk4pqhRRPNDDBFUWcmrdBFacdH5ZKsVSGbkm+nCmH5JLCuUw5llzx5+ceyS9v3IEj16rHyKx5AbSpaPFrfZ2NIuzP2jF57Zvu293BoG+f7LBcuZz32S5e2+l7eWN1yrcH1BaBS9kpwfL5jp+3Wx9vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Qxmh81cGGgV1+/eN9+5ycItWE5g1y3JwjAK0IdoxJg=;
 b=IBnzIfYbJxiKkQRia7I/wF+Q6naepdrrfZfD3Tw5p9HovjwbjPVUtl6NQTnuD9HbjftJ9xeHe/CZMD3YTtzpLEcLzg7gRJQTjdBkmYOkzGUV+bTWJCGgungwfO1WyFaDhEZlcrnIX62PY5ZE5rMxlgDq1rCM1zx+uqvQc+fP1X7n0wkRDp6Y7sM1UZBX4AIbccZfcECDc/PGFSuwYb3vleaWEz+5TcoXDdKiWHXyUFCtl6lTKzQ0XR1BHwEoe3zejM8lj+tRdBHqGnA/UyPm+KWHb1i1AM7tNfh5HFRdRpl9bkDakCgS/Kw+2rJBf4r3I3emVS3hkxSaP1EhHJfulA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Qxmh81cGGgV1+/eN9+5ycItWE5g1y3JwjAK0IdoxJg=;
 b=MSTIJsrACZ/lGttdcQ4FIFZyw6kCxwefYS1NCTh+coMsISrdS/B5b4iSf2PbxLPb1KbVm8mL/0O1/zQD0BNaIhiCy6mO9tUYrLqwkoiMc+u0ocp6MWiAmHi1yZKAu7i2NC7/oVNKFrpa2DxhdJVpxoZqlEc0cMtR4cYwWaBhnlA=
Received: from BN6PR12CA0047.namprd12.prod.outlook.com (2603:10b6:405:70::33)
 by DM6PR12MB2873.namprd12.prod.outlook.com (2603:10b6:5:18a::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.17; Fri, 13 Dec
 2019 20:09:08 +0000
Received: from BN8NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eae::204) by BN6PR12CA0047.outlook.office365.com
 (2603:10b6:405:70::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.17 via Frontend
 Transport; Fri, 13 Dec 2019 20:09:08 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BN8NAM11FT024.mail.protection.outlook.com (10.13.177.38) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2538.14 via Frontend Transport; Fri, 13 Dec 2019 20:09:08 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 13 Dec
 2019 14:09:04 -0600
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Fri, 13 Dec 2019 14:09:04 -0600
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v9 15/18] drm/amd/display: MST DSC compute fair share
Date: Fri, 13 Dec 2019 15:08:51 -0500
Message-ID: <20191213200854.31545-16-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191213200854.31545-1-mikita.lipski@amd.com>
References: <20191213200854.31545-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(346002)(376002)(396003)(428003)(189003)(199004)(6666004)(5660300002)(8936002)(36756003)(316002)(6916009)(356004)(4326008)(2876002)(54906003)(2906002)(70586007)(70206006)(478600001)(2616005)(186003)(30864003)(7696005)(8676002)(336012)(26005)(1076003)(86362001)(81156014)(81166006)(426003)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2873; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18a100a1-d362-497b-b799-08d780084fe4
X-MS-TrafficTypeDiagnostic: DM6PR12MB2873:
X-Microsoft-Antispam-PRVS: <DM6PR12MB2873D82CC4B36645397EF3F8E4540@DM6PR12MB2873.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1265;
X-Forefront-PRVS: 0250B840C1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +kmiyzNqdanDpygyNs6TmEn6OjYdAs4GHbDJukEIz/WektrPxCilmMGuta0MMFN/80GjLKjBZnx+EPAKhJhAuZXoWXZTD/yH/1r1i+SsACsHyypy6ZUmiCDASOBQFoEaE6JV3XaeqbDz98oItTzS1CbWPfLefB0YxsqYLAaU6FgNTNiaX62mOb+wcCfmlvZ12XKBVqUlHgIEr/W8JoOXfzT1Umt4pSvEcwgjfEGTggZ6BkFxfqNuUcBrC1xiPMABUZxZFiiQnK6iysoSpk//Pd6pe1P5TNmOe2738Fkq7ysoiwrD/+BEFDpvZm06DXu60YRXc5eJtVKzwg0x4lXWp03Kit6SYAnle6ZCrUCMwHj9uKPBpUAUWdB3Aiv8DaTs+2mDSsu8OlaoAEgXrVWQVWkC6eQJRve1GFbc/ts6M46jS+QOwL0b1ZPyuzNYG1aPbHCt4ojM1gILXRD6VqvR6DGcCtutuorCHixYjcF01VPWNWqj6pv+WVP6zkpsJsZ2
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2019 20:09:08.4257 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18a100a1-d362-497b-b799-08d780084fe4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2873
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
Cc: Manasi Navare <manasi.d.navare@intel.com>,
 David Francis <David.Francis@amd.com>, Mikita Lipski <mikita.lipski@amd.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: David Francis <David.Francis@amd.com>

If there is limited link bandwidth on a MST network,
it must be divided fairly between the streams on that network

Implement an algorithm to determine the correct DSC config
for each stream

The algorithm:
This
     [                   ]          ( )
represents the range of bandwidths possible for a given stream.
The [] area represents the range of DSC configs, and the ()
represents no DSC. The bandwidth used increases from left to right.

First, try disabling DSC on all streams
     [                  ]          (|)
     [                     ]            (|)
Check this against the bandwidth limits of the link and each branch
(including each endpoint). If it passes, the job is done

Second, try maximum DSC compression on all streams
that support DSC
     [|         ]        ( )
     [|                ]         ( )
If this does not pass, then enabling this combination of streams
is impossible

Otherwise, divide the remaining bandwidth evenly amongst the streams
     [        |  ]         ( )
     [        |      ]        ( )

If one or more of the streams reach minimum compression, evenly
divide the reamining bandwidth amongst the remaining streams
     [    |] ( )
     [       |]   ( )
     [                 |   ]               ( )
     [                 |      ]                  ( )

If all streams can reach minimum compression, disable compression
greedily
     [      |]  ( )
     [        |]    ( )
     [                 ]                                (|)

Perform this algorithm on each full update, on each MST link
with at least one DSC stream on it

After the configs are computed, call
dcn20_add_dsc_to_stream_resource on each stream with DSC enabled.
It is only after all streams are created that we can know which
of them will need DSC.

Do all of this at the end of amdgpu atomic check.  If it fails,
fail check; This combination of timings cannot be supported.

v2: Use drm_dp_mst_atomic_check to validate bw for certain dsc
configurations

v3: Use dc_dsc_policy structure to get min and max bpp rate
for DSC configuration

Cc: Lyude Paul <lyude@redhat.com>
Cc: Manasi Navare <manasi.d.navare@intel.com>
Reviewed-by: Wenjing Liu <Wenjing.Liu@amd.com>
Signed-off-by: David Francis <David.Francis@amd.com>
Signed-off-by: Mikita Lipski <mikita.lipski@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   3 +
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   | 364 ++++++++++++++++++
 .../display/amdgpu_dm/amdgpu_dm_mst_types.h   |   3 +
 .../drm/amd/display/dc/dcn20/dcn20_resource.c |   7 +-
 .../drm/amd/display/dc/dcn20/dcn20_resource.h |   1 +
 5 files changed, 376 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 753a79734817..93a230d956ee 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -8095,6 +8095,9 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 		if (ret)
 			goto fail;
 
+		if (!compute_mst_dsc_configs_for_state(state, dm_state->context))
+			goto fail;
+
 		if (dc_validate_global_state(dc, dm_state->context, false) != DC_OK) {
 			ret = -EINVAL;
 			goto fail;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index c376c8ccd391..6d13d1c33530 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -40,6 +40,10 @@
 #if defined(CONFIG_DEBUG_FS)
 #include "amdgpu_dm_debugfs.h"
 #endif
+
+
+#include "dc/dcn20/dcn20_resource.h"
+
 /* #define TRACE_DPCD */
 
 #ifdef TRACE_DPCD
@@ -499,3 +503,363 @@ int dm_mst_get_pbn_divider(struct dc_link *link)
 	return dc_link_bandwidth_kbps(link,
 			dc_link_get_link_cap(link)) / (8 * 1000 * 54);
 }
+
+struct dsc_mst_fairness_params {
+	struct dc_crtc_timing *timing;
+	struct dc_sink *sink;
+	struct dc_dsc_bw_range bw_range;
+	bool compression_possible;
+	struct drm_dp_mst_port *port;
+};
+
+struct dsc_mst_fairness_vars {
+	int pbn;
+	bool dsc_enabled;
+	int bpp_x16;
+};
+
+static int kbps_to_peak_pbn(int kbps)
+{
+	u64 peak_kbps = kbps;
+
+	peak_kbps *= 1006;
+	peak_kbps /= 1000;
+	return (int) DIV_ROUND_UP(peak_kbps * 64, (54 * 8 * 1000));
+}
+
+static void set_dsc_configs_from_fairness_vars(struct dsc_mst_fairness_params *params,
+		struct dsc_mst_fairness_vars *vars,
+		int count)
+{
+	int i;
+
+	for (i = 0; i < count; i++) {
+		memset(&params[i].timing->dsc_cfg, 0, sizeof(params[i].timing->dsc_cfg));
+		if (vars[i].dsc_enabled && dc_dsc_compute_config(
+					params[i].sink->ctx->dc->res_pool->dscs[0],
+					&params[i].sink->sink_dsc_caps.dsc_dec_caps,
+					params[i].sink->ctx->dc->debug.dsc_min_slice_height_override,
+					0,
+					params[i].timing,
+					&params[i].timing->dsc_cfg)) {
+			params[i].timing->flags.DSC = 1;
+			params[i].timing->dsc_cfg.bits_per_pixel = vars[i].bpp_x16;
+		} else {
+			params[i].timing->flags.DSC = 0;
+		}
+	}
+}
+
+static int bpp_x16_from_pbn(struct dsc_mst_fairness_params param, int pbn)
+{
+	struct dc_dsc_config dsc_config;
+	u64 kbps;
+
+	kbps = (u64)pbn * 994 * 8 * 54 / 64;
+	dc_dsc_compute_config(
+			param.sink->ctx->dc->res_pool->dscs[0],
+			&param.sink->sink_dsc_caps.dsc_dec_caps,
+			param.sink->ctx->dc->debug.dsc_min_slice_height_override,
+			(int) kbps, param.timing, &dsc_config);
+
+	return dsc_config.bits_per_pixel;
+}
+
+static void increase_dsc_bpp(struct drm_atomic_state *state,
+			     struct dc_link *dc_link,
+			     struct dsc_mst_fairness_params *params,
+			     struct dsc_mst_fairness_vars *vars,
+			     int count)
+{
+	int i;
+	bool bpp_increased[MAX_PIPES];
+	int initial_slack[MAX_PIPES];
+	int min_initial_slack;
+	int next_index;
+	int remaining_to_increase = 0;
+	int pbn_per_timeslot;
+	int link_timeslots_used;
+	int fair_pbn_alloc;
+
+	for (i = 0; i < count; i++) {
+		if (vars[i].dsc_enabled) {
+			initial_slack[i] = kbps_to_peak_pbn(params[i].bw_range.max_kbps) - vars[i].pbn;
+			bpp_increased[i] = false;
+			remaining_to_increase += 1;
+		} else {
+			initial_slack[i] = 0;
+			bpp_increased[i] = true;
+		}
+	}
+
+	pbn_per_timeslot = dc_link_bandwidth_kbps(dc_link,
+			dc_link_get_link_cap(dc_link)) / (8 * 1000 * 54);
+
+	while (remaining_to_increase) {
+		next_index = -1;
+		min_initial_slack = -1;
+		for (i = 0; i < count; i++) {
+			if (!bpp_increased[i]) {
+				if (min_initial_slack == -1 || min_initial_slack > initial_slack[i]) {
+					min_initial_slack = initial_slack[i];
+					next_index = i;
+				}
+			}
+		}
+
+		if (next_index == -1)
+			break;
+
+		link_timeslots_used = 0;
+
+		for (i = 0; i < count; i++)
+			link_timeslots_used += DIV_ROUND_UP(vars[i].pbn, pbn_per_timeslot);
+
+		fair_pbn_alloc = (63 - link_timeslots_used) / remaining_to_increase * pbn_per_timeslot;
+
+		if (initial_slack[next_index] > fair_pbn_alloc) {
+			vars[next_index].pbn += fair_pbn_alloc;
+			drm_dp_atomic_find_vcpi_slots(state,
+						      params[next_index].port->mgr,
+						      params[next_index].port,
+						      vars[next_index].pbn,
+						      dm_mst_get_pbn_divider(dc_link));
+			if (!drm_dp_mst_atomic_check(state)) {
+				vars[next_index].bpp_x16 = bpp_x16_from_pbn(params[next_index], vars[next_index].pbn);
+			} else {
+				vars[next_index].pbn -= fair_pbn_alloc;
+				drm_dp_atomic_find_vcpi_slots(state,
+						      params[next_index].port->mgr,
+						      params[next_index].port,
+						      vars[next_index].pbn,
+						      dm_mst_get_pbn_divider(dc_link));
+			}
+		} else {
+			vars[next_index].pbn += initial_slack[next_index];
+			drm_dp_atomic_find_vcpi_slots(state,
+						      params[next_index].port->mgr,
+						      params[next_index].port,
+						      vars[next_index].pbn,
+						      dm_mst_get_pbn_divider(dc_link));
+			if (!drm_dp_mst_atomic_check(state)) {
+				vars[next_index].bpp_x16 = params[next_index].bw_range.max_target_bpp_x16;
+			} else {
+				vars[next_index].pbn -= initial_slack[next_index];
+				drm_dp_atomic_find_vcpi_slots(state,
+						      params[next_index].port->mgr,
+						      params[next_index].port,
+						      vars[next_index].pbn,
+						      dm_mst_get_pbn_divider(dc_link));
+			}
+		}
+
+		bpp_increased[next_index] = true;
+		remaining_to_increase--;
+	}
+}
+
+static void try_disable_dsc(struct drm_atomic_state *state,
+			    struct dc_link *dc_link,
+			    struct dsc_mst_fairness_params *params,
+			    struct dsc_mst_fairness_vars *vars,
+			    int count)
+{
+	int i;
+	bool tried[MAX_PIPES];
+	int kbps_increase[MAX_PIPES];
+	int max_kbps_increase;
+	int next_index;
+	int remaining_to_try = 0;
+
+	for (i = 0; i < count; i++) {
+		if (vars[i].dsc_enabled && vars[i].bpp_x16 == params[i].bw_range.max_target_bpp_x16) {
+			kbps_increase[i] = params[i].bw_range.stream_kbps - params[i].bw_range.max_kbps;
+			tried[i] = false;
+			remaining_to_try += 1;
+		} else {
+			kbps_increase[i] = 0;
+			tried[i] = true;
+		}
+	}
+
+	while (remaining_to_try) {
+		next_index = -1;
+		max_kbps_increase = -1;
+		for (i = 0; i < count; i++) {
+			if (!tried[i]) {
+				if (max_kbps_increase == -1 || max_kbps_increase < kbps_increase[i]) {
+					max_kbps_increase = kbps_increase[i];
+					next_index = i;
+				}
+			}
+		}
+
+		if (next_index == -1)
+			break;
+
+		vars[next_index].pbn = kbps_to_peak_pbn(params[next_index].bw_range.stream_kbps);
+		drm_dp_atomic_find_vcpi_slots(state,
+					      params[next_index].port->mgr,
+					      params[next_index].port,
+					      vars[next_index].pbn,
+					      0);
+
+		if (!drm_dp_mst_atomic_check(state)) {
+			vars[next_index].dsc_enabled = false;
+			vars[next_index].bpp_x16 = 0;
+		} else {
+			vars[next_index].pbn = kbps_to_peak_pbn(params[next_index].bw_range.max_kbps);
+			drm_dp_atomic_find_vcpi_slots(state,
+					      params[next_index].port->mgr,
+					      params[next_index].port,
+					      vars[next_index].pbn,
+					      dm_mst_get_pbn_divider(dc_link));
+		}
+
+		tried[next_index] = true;
+		remaining_to_try--;
+	}
+}
+
+static bool compute_mst_dsc_configs_for_link(struct drm_atomic_state *state,
+					     struct dc_state *dc_state,
+					     struct dc_link *dc_link)
+{
+	int i;
+	struct dc_stream_state *stream;
+	struct dsc_mst_fairness_params params[MAX_PIPES];
+	struct dsc_mst_fairness_vars vars[MAX_PIPES];
+	struct amdgpu_dm_connector *aconnector;
+	int count = 0;
+
+	memset(params, 0, sizeof(params));
+
+	/* Set up params */
+	for (i = 0; i < dc_state->stream_count; i++) {
+		struct dc_dsc_policy dsc_policy = {0};
+
+		stream = dc_state->streams[i];
+
+		if (stream->link != dc_link)
+			continue;
+
+		stream->timing.flags.DSC = 0;
+
+		params[count].timing = &stream->timing;
+		params[count].sink = stream->sink;
+		aconnector = (struct amdgpu_dm_connector *)stream->dm_stream_context;
+		params[count].port = aconnector->port;
+		params[count].compression_possible = stream->sink->sink_dsc_caps.dsc_dec_caps.is_dsc_supported;
+		dc_dsc_get_policy_for_timing(params[count].timing, &dsc_policy);
+		if (!dc_dsc_compute_bandwidth_range(
+				stream->sink->ctx->dc->res_pool->dscs[0],
+				stream->sink->ctx->dc->debug.dsc_min_slice_height_override,
+				dsc_policy.min_target_bpp,
+				dsc_policy.max_target_bpp,
+				&stream->sink->sink_dsc_caps.dsc_dec_caps,
+				&stream->timing, &params[count].bw_range))
+			params[count].bw_range.stream_kbps = dc_bandwidth_in_kbps_from_timing(&stream->timing);
+
+		count++;
+	}
+	/* Try no compression */
+	for (i = 0; i < count; i++) {
+		vars[i].pbn = kbps_to_peak_pbn(params[i].bw_range.stream_kbps);
+		vars[i].dsc_enabled = false;
+		vars[i].bpp_x16 = 0;
+		drm_dp_atomic_find_vcpi_slots(state,
+					      params[i].port->mgr,
+					      params[i].port,
+					      vars[i].pbn,
+					      0);
+	}
+	if (!drm_dp_mst_atomic_check(state)) {
+		set_dsc_configs_from_fairness_vars(params, vars, count);
+		return true;
+	}
+
+	/* Try max compression */
+	for (i = 0; i < count; i++) {
+		if (params[i].compression_possible) {
+			vars[i].pbn = kbps_to_peak_pbn(params[i].bw_range.min_kbps);
+			vars[i].dsc_enabled = true;
+			vars[i].bpp_x16 = params[i].bw_range.min_target_bpp_x16;
+			drm_dp_atomic_find_vcpi_slots(state,
+					      params[i].port->mgr,
+					      params[i].port,
+					      vars[i].pbn,
+					      dm_mst_get_pbn_divider(dc_link));
+		} else {
+			vars[i].pbn = kbps_to_peak_pbn(params[i].bw_range.stream_kbps);
+			vars[i].dsc_enabled = false;
+			vars[i].bpp_x16 = 0;
+			drm_dp_atomic_find_vcpi_slots(state,
+					      params[i].port->mgr,
+					      params[i].port,
+					      vars[i].pbn,
+					      0);
+		}
+	}
+	if (drm_dp_mst_atomic_check(state))
+		return false;
+
+	/* Optimize degree of compression */
+	increase_dsc_bpp(state, dc_link, params, vars, count);
+
+	try_disable_dsc(state, dc_link, params, vars, count);
+
+	set_dsc_configs_from_fairness_vars(params, vars, count);
+
+	return true;
+}
+
+bool compute_mst_dsc_configs_for_state(struct drm_atomic_state *state,
+				       struct dc_state *dc_state)
+{
+	int i, j;
+	struct dc_stream_state *stream;
+	bool computed_streams[MAX_PIPES];
+	struct amdgpu_dm_connector *aconnector;
+
+	for (i = 0; i < dc_state->stream_count; i++)
+		computed_streams[i] = false;
+
+	for (i = 0; i < dc_state->stream_count; i++) {
+		stream = dc_state->streams[i];
+
+		if (stream->signal != SIGNAL_TYPE_DISPLAY_PORT_MST)
+			continue;
+
+		aconnector = (struct amdgpu_dm_connector *)stream->dm_stream_context;
+
+		if (!aconnector || !aconnector->dc_sink)
+			continue;
+
+		if (!aconnector->dc_sink->sink_dsc_caps.dsc_dec_caps.is_dsc_supported)
+			continue;
+
+		if (computed_streams[i])
+			continue;
+
+		mutex_lock(&aconnector->mst_mgr.lock);
+		if (!compute_mst_dsc_configs_for_link(state, dc_state, stream->link)) {
+			mutex_unlock(&aconnector->mst_mgr.lock);
+			return false;
+		}
+		mutex_unlock(&aconnector->mst_mgr.lock);
+
+		for (j = 0; j < dc_state->stream_count; j++) {
+			if (dc_state->streams[j]->link == stream->link)
+				computed_streams[j] = true;
+		}
+	}
+
+	for (i = 0; i < dc_state->stream_count; i++) {
+		stream = dc_state->streams[i];
+
+		if (stream->timing.flags.DSC == 1)
+			dcn20_add_dsc_to_stream_resource(stream->ctx->dc, dc_state, stream);
+	}
+
+	return true;
+}
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.h
index a553ea046185..d451ce9cecc0 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.h
@@ -34,4 +34,7 @@ int dm_mst_get_pbn_divider(struct dc_link *link);
 void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
 				       struct amdgpu_dm_connector *aconnector);
 
+
+bool compute_mst_dsc_configs_for_state(struct drm_atomic_state *state,
+				       struct dc_state *dc_state);
 #endif
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
index 47adcd4555ec..b1935f5d9cb8 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
@@ -1564,7 +1564,7 @@ static void release_dsc(struct resource_context *res_ctx,
 
 
 
-static enum dc_status add_dsc_to_stream_resource(struct dc *dc,
+enum dc_status dcn20_add_dsc_to_stream_resource(struct dc *dc,
 		struct dc_state *dc_ctx,
 		struct dc_stream_state *dc_stream)
 {
@@ -1579,6 +1579,9 @@ static enum dc_status add_dsc_to_stream_resource(struct dc *dc,
 		if (pipe_ctx->stream != dc_stream)
 			continue;
 
+		if (pipe_ctx->stream_res.dsc)
+			continue;
+
 		acquire_dsc(&dc_ctx->res_ctx, pool, &pipe_ctx->stream_res.dsc, i);
 
 		/* The number of DSCs can be less than the number of pipes */
@@ -1627,7 +1630,7 @@ enum dc_status dcn20_add_stream_to_ctx(struct dc *dc, struct dc_state *new_ctx,
 
 	/* Get a DSC if required and available */
 	if (result == DC_OK && dc_stream->timing.flags.DSC)
-		result = add_dsc_to_stream_resource(dc, new_ctx, dc_stream);
+		result = dcn20_add_dsc_to_stream_resource(dc, new_ctx, dc_stream);
 
 	if (result == DC_OK)
 		result = dcn20_build_mapped_resource(dc, new_ctx, dc_stream);
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.h b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.h
index 840ca66c34e1..f5893840b79b 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.h
@@ -157,6 +157,7 @@ void dcn20_calculate_dlg_params(
 
 enum dc_status dcn20_build_mapped_resource(const struct dc *dc, struct dc_state *context, struct dc_stream_state *stream);
 enum dc_status dcn20_add_stream_to_ctx(struct dc *dc, struct dc_state *new_ctx, struct dc_stream_state *dc_stream);
+enum dc_status dcn20_add_dsc_to_stream_resource(struct dc *dc, struct dc_state *dc_ctx, struct dc_stream_state *dc_stream);
 enum dc_status dcn20_remove_stream_from_ctx(struct dc *dc, struct dc_state *new_ctx, struct dc_stream_state *dc_stream);
 enum dc_status dcn20_get_default_swizzle_mode(struct dc_plane_state *plane_state);
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
