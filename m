Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 469D765F6A7
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 23:23:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C1D10E296;
	Thu,  5 Jan 2023 22:23:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2070.outbound.protection.outlook.com [40.107.93.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C878710E14A;
 Thu,  5 Jan 2023 22:23:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jFEdLHtmZ5V3jYZn1IVyPRKj72mflmLD7OXo9G9oPvd8iWw9tD5pWjgPeY3RSdlXHG4POUbPvNFUweZ/rxdIzatlbSh5e5RuU4vi7tCeKV4IajmOAiYfZa3khs5mBrEBNBPtoPrKzM69O+MnkgYeSn6yp++46CHKdVov/G2C5tLYPN+PxDCkegwxbEZRq8/o6ZPD02avtym0hVM57uFBj/gDNYCRJz8gr5S4b60MRl1RGVmuRXZ2RphQKyJ3q6vOmwp1uCe2aVMmiwK73j5MD3JsTGHAphwrnTgoMujRUcVwyVk9JiE8tl9JOTcyUGzk06T19lLUSzfqFk6Zw+nksw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NaKkCcHeU+S0cGdYV80oratkCFKGzzOgevqOQ+K+xFs=;
 b=k+xcnxqOxa1LyW7ehItR8JZ0fex6FKfamvOAOcM7fBSCD2cHaOBoKyYVQNccGSQVNx79u8Qb9hsXZDKvre/+YlA7k/9NltC1Cb6KlE4FHdp5JFpXcvfRHab+BU9MeALfz0afAo797okYa57S93EHZ9libBJ77m44X2XgbMCPT1+DS+iYVE+h3N3Dnwr6+FwKWxftWOhBSLrBj5jwI/p2f+sHGzVpZWsraxPs3yWduB5RnHcwqB85l+5F6b6Ca2k1tPj9MJgT3uAnw2COrrHlPjWTRC8kLU8E+8XAM0f3X9q3ITQJTLZtK3EAglku54p5yJRszrJQV/6C9jC4q+9abw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NaKkCcHeU+S0cGdYV80oratkCFKGzzOgevqOQ+K+xFs=;
 b=lMNoV7QK1cYorm5SBM9PTXsvEuJ/r1aDkxQ+8OVc0vsH/IEN9c6qgenRIVVFqX2aqe1HVItbeiJby5Kq85OHxQOJy78LnJZdr5dvTb74ZfEWtg9EQhZFGnavYGJWrawk8i6gCsX+GUg4XDmib0PPVjpLqcScKW7lVmbfZO+hoAo=
Received: from MW4PR03CA0239.namprd03.prod.outlook.com (2603:10b6:303:b9::34)
 by IA1PR12MB6627.namprd12.prod.outlook.com (2603:10b6:208:3a1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 22:23:22 +0000
Received: from CO1NAM11FT099.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b9:cafe::f1) by MW4PR03CA0239.outlook.office365.com
 (2603:10b6:303:b9::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Thu, 5 Jan 2023 22:23:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT099.mail.protection.outlook.com (10.13.175.171) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.17 via Frontend Transport; Thu, 5 Jan 2023 22:23:21 +0000
Received: from hamza-pc.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 5 Jan
 2023 16:23:03 -0600
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v4] drm/amd/display: fix PSR-SU/DSC interoperability support
Date: Thu, 5 Jan 2023 17:23:44 -0500
Message-ID: <20230105222345.451217-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT099:EE_|IA1PR12MB6627:EE_
X-MS-Office365-Filtering-Correlation-Id: 41ad46bb-30cf-4c9b-cbd7-08daef6b742e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z/pDWzEfL60ofvBiws0Yjd/WU87OBPaGsagk6k3CXzfpYJqDldXAUmxo8q0pfakrGRbtCkennPl7gkwIdkj4Ah/COfnrdo5IMDL2vMW3S2Vkq8q4kwyOjm3YksPrxm3tFFSUBefosaSStk3qf7N3dSE3Vna+KHL6NB06A0VgXcIBWGKtshXITbv8Xi7shNFgaWR95aHRf9szZBZf7k6wFyPDx7Tte3O8ze27SehhxGiNO+DOdXwEBCn0l77oW4VREb1cmwKNpYiESb2H5gPmvAYuSVPk703NaP/R4CxkBszRizwNRW/PfF1X6rwCxzmA+uiU4p5+NlMSd5DVM/PHScY3S0f1WqUYV0g3sllEKD/0QRh3P4nv9J+9V3xvU988JyMN3R4dLHAT/YQHkv65QQ6tdcTefIkAuPzAUgHJfjVd+KNP8LrZu9Bvv6x3qgkt5Nd030l7tCxODy/qnfKA1n5YMLo3jgedMrzk3ilJ6Q+jEeT0lM5EcPdD8ksG8wWqsYK6H4YuuaGBqgWuGcsYquIHcCo3nL/5/O+oGD5sTgTyr0PGlBKbI4OD2qfosfxJ9dv4wWZzgM9foxX98oHrr25t9iv+XomV47Q21nMWJYJyUEl+EHwtFEQbe944pHROZ78zctbugGINIUKNfJis/vSJ0QvxdKhfGn+v4ddgGmRIEeSimzKR8N+eO3BIPQAytxUKnk9fPKqohHW4nFbyfxk21C7wF8WnWV1onoVVK00xw+3IgbltGL1x7CheOskEB248DIJJ9bDLgTkIljqR+w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(39860400002)(396003)(376002)(451199015)(40470700004)(36840700001)(46966006)(2906002)(36860700001)(82740400003)(356005)(36756003)(2616005)(40460700003)(40480700001)(316002)(70586007)(6916009)(16526019)(82310400005)(81166007)(54906003)(86362001)(1076003)(5660300002)(41300700001)(47076005)(83380400001)(426003)(8676002)(4326008)(336012)(8936002)(478600001)(186003)(44832011)(70206006)(6666004)(26005)(36900700001)(16060500005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 22:23:21.4703 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41ad46bb-30cf-4c9b-cbd7-08daef6b742e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT099.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6627
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
Cc: Brian Chang <Brian.Chang@amd.com>, Robin Chen <po-tchen@amd.com>,
 David Zhang <dingchen.zhang@amd.com>, Leo Li <sunpeng.li@amd.com>,
 dri-devel@lists.freedesktop.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Shirish S <shirish.s@amd.com>, Alex Hung <alex.hung@amd.com>,
 Camille Cho <Camille.Cho@amd.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Po Ting Chen <robin.chen@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Anthony Koo <Anthony.Koo@amd.com>, Tom Chung <chiahsuan.chung@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, there are issues with enabling PSR-SU + DSC. This stems from
the fact that DSC imposes a slice height on transmitted video data and
we are not conforming to that slice height in PSR-SU regions. So, pass
slice_height into su_y_granularity to feed the DSC slice height into
PSR-SU code.

Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
v2: move code to modules/power.
v3: use ASSERT() instead of WARN() and add a condition that clarifies
    that PSR-SU + DSC can only be enabled on an eDP connection.
v4: change the logic again to allow non-eDP links to pass the first
    filter in psr_su_set_y_granularity() (this allows us to maintain
    the v1/v2 behaviour, while still being clear as to the fact that we
    only care about eDP connections).
---
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c |  3 ++
 .../amd/display/modules/power/power_helpers.c | 31 +++++++++++++++++++
 .../amd/display/modules/power/power_helpers.h |  3 ++
 3 files changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c
index 26291db0a3cf..872d06fe1436 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c
@@ -122,6 +122,9 @@ bool amdgpu_dm_link_setup_psr(struct dc_stream_state *stream)
 		psr_config.allow_multi_disp_optimizations =
 			(amdgpu_dc_feature_mask & DC_PSR_ALLOW_MULTI_DISP_OPT);
 
+		if (!psr_su_set_y_granularity(dc, link, stream, &psr_config))
+			return false;
+
 		ret = dc_link_setup_psr(link, stream, &psr_config, &psr_context);
 
 	}
diff --git a/drivers/gpu/drm/amd/display/modules/power/power_helpers.c b/drivers/gpu/drm/amd/display/modules/power/power_helpers.c
index 9b5d9b2c9a6a..cf4fa87c7db6 100644
--- a/drivers/gpu/drm/amd/display/modules/power/power_helpers.c
+++ b/drivers/gpu/drm/amd/display/modules/power/power_helpers.c
@@ -916,3 +916,34 @@ bool mod_power_only_edp(const struct dc_state *context, const struct dc_stream_s
 {
 	return context && context->stream_count == 1 && dc_is_embedded_signal(stream->signal);
 }
+
+bool psr_su_set_y_granularity(struct dc *dc, struct dc_link *link,
+			      struct dc_stream_state *stream,
+			      struct psr_config *config)
+{
+	uint16_t pic_height;
+	uint8_t slice_height;
+
+	if ((link->connector_signal & SIGNAL_TYPE_EDP) &&
+	    (!dc->caps.edp_dsc_support ||
+	    link->panel_config.dsc.disable_dsc_edp ||
+	    !link->dpcd_caps.dsc_caps.dsc_basic_caps.fields.dsc_support.DSC_SUPPORT ||
+	    !stream->timing.dsc_cfg.num_slices_v))
+		return true;
+
+	pic_height = stream->timing.v_addressable +
+		stream->timing.v_border_top + stream->timing.v_border_bottom;
+	slice_height = pic_height / stream->timing.dsc_cfg.num_slices_v;
+
+	if (slice_height) {
+		if (config->su_y_granularity &&
+		    (slice_height % config->su_y_granularity)) {
+			ASSERT(0);
+			return false;
+		}
+
+		config->su_y_granularity = slice_height;
+	}
+
+	return true;
+}
diff --git a/drivers/gpu/drm/amd/display/modules/power/power_helpers.h b/drivers/gpu/drm/amd/display/modules/power/power_helpers.h
index 316452e9dbc9..bb16b37b83da 100644
--- a/drivers/gpu/drm/amd/display/modules/power/power_helpers.h
+++ b/drivers/gpu/drm/amd/display/modules/power/power_helpers.h
@@ -59,4 +59,7 @@ void mod_power_calc_psr_configs(struct psr_config *psr_config,
 		const struct dc_stream_state *stream);
 bool mod_power_only_edp(const struct dc_state *context,
 		const struct dc_stream_state *stream);
+bool psr_su_set_y_granularity(struct dc *dc, struct dc_link *link,
+			      struct dc_stream_state *stream,
+			      struct psr_config *config);
 #endif /* MODULES_POWER_POWER_HELPERS_H_ */
-- 
2.38.1

