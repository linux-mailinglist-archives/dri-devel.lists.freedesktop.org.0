Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F21F611EB96
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 21:09:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A49356ED14;
	Fri, 13 Dec 2019 20:09:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690042.outbound.protection.outlook.com [40.107.69.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7507F6ED0F;
 Fri, 13 Dec 2019 20:09:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fhQ8ZKrtQidd+o5BkShzK5O0qmnUv1PttAs4/phQBw8t78CnTQ4Sysp5Sovt6a+E/57C06AmQyJaSpG6/aWv2FquUb/7NfbQu+YWQTiy9kTmU+S+pTwMf8UCIeY/Mld5tk/wvbnKUpMapSZdNNdME+XNXiNeZgevl5G8lnIM4z2C1xsXNNw+OFVa0NnJFkwNaRul3SoQcJdNJsAhVRfyPPlsXsODtFi9e2z6X6dA/zMeRPxdPV7Js+oB7iGP5fi42Zf8fagwz8DdyoVLGtNznHrt6Y9E06e/dhb9eQSiD3HlUBwYA1H9Z0H+hgAcdSLaLLvVRiTDBemM13x4gQ3Okg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=idnSUgedqbjh17H5s41ce4IQl78C+tWnR7w6QXB9vWc=;
 b=bJL3p+2SoN2UHAUv8VfSIxfNUFyL0MjQOJUz1M+YUWZhgZy6SWq3TCnWUAGOzruqk2M+Qu6P2hmpxfsA6wtTINkdjhOzApQtRTpxvQ5e92O5th3SkrD1Ync5NbN4J5RW7d0CinQzH4SbzVsvbBzWOT06by/2PCA/3jE4DNTonqVYZm6hkFVmDXYlMDYlo6/wrl8bYdWrr9Acwjz3WT3Oe82GLvA6SYM3GOyUl9FRDdABQgI7J8ylQF+uooWGLlcfcrCq8FGUaCGwY8Yq5f4RuJmO2sKT3D+H79rC7hEaNJJrTnSogRYdzW4SeL3fAqYuhbrGFrdht3kgAsU7zHhvBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=idnSUgedqbjh17H5s41ce4IQl78C+tWnR7w6QXB9vWc=;
 b=g+Ogohkgn/oPDBbPI+ymLzKd7Y8Xz0B0BTkipfXToG7NJUcqzaYYhnlD2bDaOMYtkMV2OhNoHsHzFG7A09WO1cGMDf4GIqqz0IT/CmMK4kSDtHI975sHHc9CNyOOfvXb7+9ZJ99d8L4VYHrDtC8onTBAVnZ8ZJYGzCTyUcYNbR8=
Received: from SN1PR12CA0093.namprd12.prod.outlook.com (2603:10b6:802:21::28)
 by BN8PR12MB3348.namprd12.prod.outlook.com (2603:10b6:408:47::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.14; Fri, 13 Dec
 2019 20:09:02 +0000
Received: from BN8NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eae::208) by SN1PR12CA0093.outlook.office365.com
 (2603:10b6:802:21::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.17 via Frontend
 Transport; Fri, 13 Dec 2019 20:09:02 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BN8NAM11FT003.mail.protection.outlook.com (10.13.177.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2538.14 via Frontend Transport; Fri, 13 Dec 2019 20:09:02 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 13 Dec
 2019 14:09:00 -0600
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Fri, 13 Dec 2019 14:09:00 -0600
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v9 06/18] drm/dp_mst: Add new quirk for Synaptics MST hubs
Date: Fri, 13 Dec 2019 15:08:42 -0500
Message-ID: <20191213200854.31545-7-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191213200854.31545-1-mikita.lipski@amd.com>
References: <20191213200854.31545-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(39860400002)(136003)(376002)(428003)(199004)(189003)(426003)(356004)(2906002)(186003)(70586007)(7696005)(70206006)(86362001)(54906003)(26005)(6666004)(4326008)(450100002)(336012)(2616005)(316002)(8676002)(8936002)(81166006)(81156014)(2876002)(1076003)(36756003)(478600001)(6916009)(5660300002)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3348; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bdf290ee-6967-4c0c-b868-08d780084c66
X-MS-TrafficTypeDiagnostic: BN8PR12MB3348:
X-Microsoft-Antispam-PRVS: <BN8PR12MB3348EE7E9452EA16BAAC6633E4540@BN8PR12MB3348.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0250B840C1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mrWqUBdWSrxpzcalxLrcwcwKTVycnbBgS8947zsZYQg3ll2hvKZLwh89iUqw2YheAQBMn5reBqqgtgvSzkjhs5oUdNvXa5h4/+6FX8XTFP0/zZl1x07NpN2kCR0MWogoL9+t3XhCrTH8SrszTt0u8RnimefQ+EL40qRRDc/82ZyTqOZT7Fn2KkbSnQjCZgqagX4p3UST/BBhga5dROPJU5oGJHn21b9BmqPfxuJr85Jbvry2nKXqgQvWQbP4XJdqEB23eTZIuDi4ZO6ldPdzqJAr2symd3POoIbk3/HnsnTRYfnEKQyGWPssG5S6dy2orVl50RJf5jd1eLDkVAcoSuNNiGrHzRrs3jQRhS98wr83zZWWS8iGdtWT4DZ9UdfKUvdPWaAAQ9201XTiKZmw6m9bRfIsTwCOi52SbOA5m/M4eqIMX1YPNpxjMmk3L6eN82eksBRqYy/WbkTh7bAqUi98h4fQbTNuPiTNHNx5OoMgpc1sHavSA6lNVQD3OsEv
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2019 20:09:02.5678 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bdf290ee-6967-4c0c-b868-08d780084c66
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3348
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

From: Mikita Lipski <mikita.lipski@amd.com>

Synaptics DP1.4 hubs (BRANCH_ID 0x90CC24) do not
support virtual DPCD registers, but do support DSC.
The DSC caps can be read from the physical aux,
like in SST DSC. These hubs have many different
DEVICE_IDs.  Add a new quirk to detect this case.

v2: Fix error when checking return of drm_dp_read_desc

Reviewed-by: Wenjing Liu <Wenjing.Liu@amd.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: David Francis <David.Francis@amd.com>
Signed-off-by: Mikita Lipski <mikita.lipski@amd.com>
---
 drivers/gpu/drm/drm_dp_helper.c       |  2 ++
 drivers/gpu/drm/drm_dp_mst_topology.c | 27 +++++++++++++++++++++++++++
 include/drm/drm_dp_helper.h           |  7 +++++++
 3 files changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index 2faef8bd911f..374cedc6c2ac 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -1165,6 +1165,8 @@ static const struct dpcd_quirk dpcd_quirk_list[] = {
 	{ OUI(0x00, 0x10, 0xfa), DEVICE_ID_ANY, false, BIT(DP_DPCD_QUIRK_NO_PSR) },
 	/* CH7511 seems to leave SINK_COUNT zeroed */
 	{ OUI(0x00, 0x00, 0x00), DEVICE_ID('C', 'H', '7', '5', '1', '1'), false, BIT(DP_DPCD_QUIRK_NO_SINK_COUNT) },
+	/* Synaptics DP1.4 MST hubs can support DSC without virtual DPCD */
+	{ OUI(0x90, 0xCC, 0x24), DEVICE_ID_ANY, true, BIT(DP_DPCD_QUIRK_DSC_WITHOUT_VIRTUAL_DPCD) },
 };
 
 #undef OUI
diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index d58adcde8d72..74bed71f7315 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -5075,6 +5075,7 @@ struct drm_dp_aux *drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *port)
 {
 	struct drm_dp_mst_port *immediate_upstream_port;
 	struct drm_dp_mst_port *fec_port;
+	struct drm_dp_desc desc = { 0 };
 	u8 endpoint_fec;
 	u8 endpoint_dsc;
 
@@ -5127,6 +5128,32 @@ struct drm_dp_aux *drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *port)
 	if (drm_dp_mst_is_virtual_dpcd(port))
 		return &port->aux;
 
+	/*
+	 * Synaptics quirk
+	 * Applies to ports for which:
+	 * - Physical aux has Synaptics OUI
+	 * - DPv1.4 or higher
+	 * - Port is on primary branch device
+	 * - Not a VGA adapter (DP_DWN_STRM_PORT_TYPE_ANALOG)
+	 */
+	if (drm_dp_read_desc(port->mgr->aux, &desc, true))
+		return NULL;
+
+	if (drm_dp_has_quirk(&desc, DP_DPCD_QUIRK_DSC_WITHOUT_VIRTUAL_DPCD) &&
+	    port->mgr->dpcd[DP_DPCD_REV] >= DP_DPCD_REV_14 &&
+	    port->parent == port->mgr->mst_primary) {
+		u8 downstreamport;
+
+		if (drm_dp_dpcd_read(&port->aux, DP_DOWNSTREAMPORT_PRESENT,
+				     &downstreamport, 1) < 0)
+			return NULL;
+
+		if ((downstreamport & DP_DWN_STRM_PORT_PRESENT) &&
+		   ((downstreamport & DP_DWN_STRM_PORT_TYPE_MASK)
+		     != DP_DWN_STRM_PORT_TYPE_ANALOG))
+			return port->mgr->aux;
+	}
+
 	/*
 	 * The check below verifies if the MST sink
 	 * connected to the GPU is capable of DSC -
diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index b2057009aabc..7972c8bf97cf 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -1522,6 +1522,13 @@ enum drm_dp_quirk {
 	 * The driver should ignore SINK_COUNT during detection.
 	 */
 	DP_DPCD_QUIRK_NO_SINK_COUNT,
+	/**
+	 * @DP_DPCD_QUIRK_DSC_WITHOUT_VIRTUAL_DPCD:
+	 *
+	 * The device supports MST DSC despite not supporting Virtual DPCD.
+	 * The DSC caps can be read from the physical aux instead.
+	 */
+	DP_DPCD_QUIRK_DSC_WITHOUT_VIRTUAL_DPCD,
 };
 
 /**
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
