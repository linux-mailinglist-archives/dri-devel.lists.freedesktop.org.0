Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A84B211EBA5
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 21:09:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A236ED33;
	Fri, 13 Dec 2019 20:09:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770057.outbound.protection.outlook.com [40.107.77.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D2E36ED19;
 Fri, 13 Dec 2019 20:09:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NN94RZEixWjOIlSPokb7WAXclOGs+8HZpT5CMLs9dYrgaMrjLOWfYhzjfl7+pfLtNoiFSt97+l1MEYhviODzPunEzsO2mDC1DLxlhDE/58PRZFgYLAmllk3lvP7cbTBIe3oKkyX3dAsYi6UJBEbCHXOsyQFaT2ZBXeTGyomsRBIc7fZMO6nyrqQOdi0S4PGdZnipA/a8pogfcVZq2Qxo7oHIA+1qgtKyGFKjThQ0VBcR9nkbc+lhLvnOWQse9HCeCUTtMBtnwi+qLdxMSVTne1yQgIT8hAcpxH6GWROoOghrY3PXGHZhhjr509tX0NJRbW1i9BmdInYGA0QAtt6fBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nuZwBT4FSXONYSwg9FxTogn0x2cofHmYJ0uSUzdGln4=;
 b=G0VusRa3ImtSZDbySVwaVNbCwe8mMmkdtRYbyj6GX9Gjp80pHgaa3oE3ekXBE8CHdmy8TlGdRuGFYNFqnvFx0pBCdFbHfLQXwQTGuIORNioqmt56rpAlWplnw0FQ1N9xmItyXSQAXc38W7NjCuvbDS1NVR8PqplsqMTqFOcwLoGvxRkJtNtW1XRJ52c9jp7S/pp5omaWDB2pJucYz5xLJ2YqWcYS+XkHf2bK7Psa4HYEx8LxBHQWUepshBPdFjQ9FQnKmaUVzSN/lVtBMEH/BruaJakwRPCdZdWwkTy5J/ToPDy2ZV3pG7TH20Xc1/SNTGX2pEyxL4Qk2w04UkfbLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nuZwBT4FSXONYSwg9FxTogn0x2cofHmYJ0uSUzdGln4=;
 b=Ek5602wt50gssJeeAnDLUu8kpM0FiuyY2dUwxVRGgi7v0KVdvONRii1tiHop+b6XH8wuDXpST5m4T2bgJKsS6uYq6zJehj89vhyVUz/lnAnpzVEN0tPzFQOwIufIxGeJiwqHYnRClernPXKQ/ByTjGfExJbPhcVfCS2PbhhvLLU=
Received: from SN1PR12CA0100.namprd12.prod.outlook.com (2603:10b6:802:21::35)
 by DM6PR12MB4218.namprd12.prod.outlook.com (2603:10b6:5:21b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.18; Fri, 13 Dec
 2019 20:09:03 +0000
Received: from BN8NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eae::208) by SN1PR12CA0100.outlook.office365.com
 (2603:10b6:802:21::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.17 via Frontend
 Transport; Fri, 13 Dec 2019 20:09:03 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BN8NAM11FT003.mail.protection.outlook.com (10.13.177.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2538.14 via Frontend Transport; Fri, 13 Dec 2019 20:09:03 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 13 Dec
 2019 14:09:01 -0600
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Fri, 13 Dec 2019 14:09:01 -0600
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v9 07/18] drm/amd/display: Initialize DSC PPS variables to 0
Date: Fri, 13 Dec 2019 15:08:43 -0500
Message-ID: <20191213200854.31545-8-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191213200854.31545-1-mikita.lipski@amd.com>
References: <20191213200854.31545-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(396003)(376002)(136003)(428003)(189003)(199004)(2906002)(316002)(186003)(54906003)(6916009)(81166006)(2876002)(8676002)(356004)(8936002)(5660300002)(6666004)(7696005)(86362001)(426003)(336012)(4326008)(26005)(81156014)(450100002)(36756003)(70206006)(1076003)(478600001)(70586007)(2616005)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB4218; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1efcef31-0f51-4618-773a-08d780084cda
X-MS-TrafficTypeDiagnostic: DM6PR12MB4218:
X-Microsoft-Antispam-PRVS: <DM6PR12MB4218B1A1D28D19C56A4F993BE4540@DM6PR12MB4218.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:345;
X-Forefront-PRVS: 0250B840C1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qEYxg1nUXPYACwg2yX0UM3lKo0d2M8tb35Fsy2zfzQhe+hrqWBm+wFNaxXdaX9mOSCkoJ5maI/wH9SBLNKFoMtZx1GeJYt3qRFaf3ULj1Ucu7Zkq659wE96NXoNHgfqOBnpZT+Fmx/B37T1JZOTPVx8Xnp7++U4OQ0ppnPKYbqoh3DAmDTAUYBOe/L21hVkQ21LSGHG9HfT7zwUHGnT3P6ovsxPSr9I+uCMytjeFg9DFuSCv75an+UP+X+YNeXaF9FpkJTu+FtUpCO2pQIyWTPilBqU+A3PS/tA397f0eaq1LkJ4FQ/2mmuIwWsOmadppzVln08e07CzrePEZUzS9N6s1kwuyvmdwbauruycODtTVuS724fKhJLgyllXRwccd5f5zr1/68/hlU5FsrjbCeRkSFgivAIIdpMj31vK1ofIaGC43KK5UoL20JB7J0EY5O2EgO399/TJ5eE82516l9HEcI9TGSOiPZeUM2cs0sa3iGvz/i9QAHcrNYvHjQLd
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2019 20:09:03.3253 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1efcef31-0f51-4618-773a-08d780084cda
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4218
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
Cc: David Francis <David.Francis@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: David Francis <David.Francis@amd.com>

For DSC MST, sometimes monitors would break out
in full-screen static. The issue traced back to the
PPS generation code, where these variables were being used
uninitialized and were picking up garbage.

memset to 0 to avoid this

Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Signed-off-by: David Francis <David.Francis@amd.com>
Signed-off-by: Mikita Lipski <mikita.lipski@amd.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c | 3 +++
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.c   | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c
index 548aac02ca11..4fd51c76317a 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c
@@ -518,6 +518,9 @@ bool dp_set_dsc_pps_sdp(struct pipe_ctx *pipe_ctx, bool enable)
 		struct dsc_config dsc_cfg;
 		uint8_t dsc_packed_pps[128];
 
+		memset(&dsc_cfg, 0, sizeof(dsc_cfg));
+		memset(dsc_packed_pps, 0, 128);
+
 		/* Enable DSC hw block */
 		dsc_cfg.pic_width = stream->timing.h_addressable + stream->timing.h_border_left + stream->timing.h_border_right;
 		dsc_cfg.pic_height = stream->timing.v_addressable + stream->timing.v_border_top + stream->timing.v_border_bottom;
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.c
index 0111545dac75..6bdfee20b6a7 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.c
@@ -206,6 +206,9 @@ static bool dsc2_get_packed_pps(struct display_stream_compressor *dsc, const str
 	struct dsc_reg_values dsc_reg_vals;
 	struct dsc_optc_config dsc_optc_cfg;
 
+	memset(&dsc_reg_vals, 0, sizeof(dsc_reg_vals));
+	memset(&dsc_optc_cfg, 0, sizeof(dsc_optc_cfg));
+
 	DC_LOG_DSC("Getting packed DSC PPS for DSC Config:");
 	dsc_config_log(dsc, dsc_cfg);
 	DC_LOG_DSC("DSC Picture Parameter Set (PPS):");
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
