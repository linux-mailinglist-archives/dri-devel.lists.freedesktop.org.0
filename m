Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE2811EB97
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 21:09:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3FEE6ED18;
	Fri, 13 Dec 2019 20:09:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700078.outbound.protection.outlook.com [40.107.70.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 645A46ED0C;
 Fri, 13 Dec 2019 20:09:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SGjA+pFDTDvUKhfO1w76zFiTQxPr0TAXvjoxYjlKxTB7mXMs/877qVz/yn6plL4D0IZ1Zq5EBVTJ3s/6z6TLxelZ0B5g0nSYTDsGvJCZKyrtcGDiPbJjGIl1tJoRCLIvjdVyrRlostmACSm5uWrEtleB6BXtsr7alrvI1uxdi/5njMTY+MnA33OE2eAo5WeZofHrfF33DM4i2YVijqivm+1c6Q2RhdjHV2JKWTuQjeXLKvgD+ZgePSQA6wpLdFhu/kbKxlBWenDfM8GWr5Vgh+aRnnngAvy4QUj1w8YmmfW+/Z8ip10iSllC2N6Uam8+NWMywvgvxWEQFVGrI0+Qkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gTodLTZAP+8jfwQY0weyYwS8j96zYlC2FWxnAFndJHg=;
 b=DnHso7UW0gzQRTas+pX2uh+CkUz17EOy3WfH6KzUmMzzaWypQq2VDwIDPBufgAGqKWRlmmXKkho9d5CpSRCDrgg8b5iaAqPl2g6Hf7R3KtJKlTJWgvcVr3nLw/D7M7jcWE2j7C+lSL6NjopfpWFlMoZQ2EA/lA3IFW9H5U4hRqCfXu5AfMgafGRWi5H0MbB1pV1Oy8bqYbu7hPZR9YqSrNINb9ItPV6YSP4Y9PNp1UT/2zWg5qPWiXQw3AzzmTBQcQc3d/ihtb1ok7lh5mSjRGT0K5MXWkpJyyOq8Ov6qM0Lp7is/F19B3SpNUSIHWouEF4ydnZr7/sD82chCZpsXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gTodLTZAP+8jfwQY0weyYwS8j96zYlC2FWxnAFndJHg=;
 b=s+UwszHJh9wbSQbKArUX2u4bZ0Va1Alf18wLQAjXuudGw5+jz3XndaLQ+j0AxhmxyZelRuCR+2Q/3sfufLGNKZR5bAhR5yNqIoEVcDSIfyDK0m8Qhjcmu1U1Kr61p0efNQyGU1yRIq1Wh9+edF/yPDfGpwd1k9448AB8S9N6K50=
Received: from DM6PR12CA0017.namprd12.prod.outlook.com (2603:10b6:5:1c0::30)
 by DM5PR12MB1851.namprd12.prod.outlook.com (2603:10b6:3:109::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.18; Fri, 13 Dec
 2019 20:09:03 +0000
Received: from DM6NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eaa::203) by DM6PR12CA0017.outlook.office365.com
 (2603:10b6:5:1c0::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.15 via Frontend
 Transport; Fri, 13 Dec 2019 20:09:03 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM6NAM11FT025.mail.protection.outlook.com (10.13.172.197) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2538.14 via Frontend Transport; Fri, 13 Dec 2019 20:09:02 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 13 Dec
 2019 14:09:02 -0600
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 13 Dec
 2019 14:09:01 -0600
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Fri, 13 Dec 2019 14:09:01 -0600
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v9 09/18] drm/amd/display: Write DSC enable to MST DPCD
Date: Fri, 13 Dec 2019 15:08:45 -0500
Message-ID: <20191213200854.31545-10-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191213200854.31545-1-mikita.lipski@amd.com>
References: <20191213200854.31545-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(39860400002)(376002)(346002)(428003)(189003)(199004)(450100002)(426003)(186003)(2906002)(4326008)(5660300002)(478600001)(6666004)(356004)(2616005)(6916009)(8676002)(81166006)(81156014)(8936002)(26005)(316002)(36756003)(2876002)(70586007)(336012)(1076003)(86362001)(54906003)(70206006)(7696005)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1851; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38fafda8-aef7-43be-6eff-08d780084cae
X-MS-TrafficTypeDiagnostic: DM5PR12MB1851:
X-Microsoft-Antispam-PRVS: <DM5PR12MB185181292F99ED4B0B09CDAFE4540@DM5PR12MB1851.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-Forefront-PRVS: 0250B840C1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 68Nw1gSWfqk+jfYBA8LopgLfjAi45Bq0VFn3RFnImmWnKN4UWYmTDHUGto32uNqcB5DpXX4fZwEehKmB9NkKbcPib4zKCAVS2jXiguOioemY+QWtCBqyIPM+eNErllsXcrbEmaEUMliNuFfPnD/PuKlK0smSLj+5TxmD2SOiZKBhEAyj4A9QF+tuy7o+uPhlTK9l5up7IcAWXr0xsPLUk+LtU+KuKqU2cRz0JQQ9BmRCBywS9XxoB939XorcrfBUB57djdIkbtX5/AKm693aeNQLaLD7UmM1zCa7J1C6R7LgpVqKad5hdDvbcaNqGEQS4Dz+AGUQB9Gs+G2AjelY3WQ5enAhJ/NH2m5aXEohXwcwK65LWB9kQYqZTo/IQ5fntFvYz8lVQ+cQ7HBp+nfB0MoNtwLz/Pk5AAZkG9DDGFHsHIA96qDJWK+8i+j/Y6fyHuKy5D49kC0ZXDI6fRxDvBJZo8MUdGpmmEyhvNbxt401yjIbDJn5bW6G/wAKDrop
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2019 20:09:02.9977 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38fafda8-aef7-43be-6eff-08d780084cae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1851
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

Rework the dm_helpers_write_dsc_enable callback to
handle the MST case.

Use the cached dsc_aux field.

Reviewed-by: Wenjing Liu <Wenjing.Liu@amd.com>
Signed-off-by: David Francis <David.Francis@amd.com>
Signed-off-by: Mikita Lipski <mikita.lipski@amd.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index 66f266a5e10b..069b7a6f5597 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -37,6 +37,7 @@
 #include "dc.h"
 #include "amdgpu_dm.h"
 #include "amdgpu_dm_irq.h"
+#include "amdgpu_dm_mst_types.h"
 
 #include "dm_helpers.h"
 
@@ -516,8 +517,24 @@ bool dm_helpers_dp_write_dsc_enable(
 )
 {
 	uint8_t enable_dsc = enable ? 1 : 0;
+	struct amdgpu_dm_connector *aconnector;
+
+	if (!stream)
+		return false;
+
+	if (stream->signal == SIGNAL_TYPE_DISPLAY_PORT_MST) {
+		aconnector = (struct amdgpu_dm_connector *)stream->dm_stream_context;
+
+		if (!aconnector->dsc_aux)
+			return false;
+
+		return (drm_dp_dpcd_write(aconnector->dsc_aux, DP_DSC_ENABLE, &enable_dsc, 1) >= 0);
+	}
+
+	if (stream->signal == SIGNAL_TYPE_DISPLAY_PORT)
+		return dm_helpers_dp_write_dpcd(ctx, stream->link, DP_DSC_ENABLE, &enable_dsc, 1);
 
-	return dm_helpers_dp_write_dpcd(ctx, stream->sink->link, DP_DSC_ENABLE, &enable_dsc, 1);
+	return false;
 }
 
 bool dm_helpers_is_dp_sink_present(struct dc_link *link)
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
