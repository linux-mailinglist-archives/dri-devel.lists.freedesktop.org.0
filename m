Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1433133D84
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 09:45:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C29A889C07;
	Wed,  8 Jan 2020 08:45:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20628.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::628])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB8BE89BF5;
 Wed,  8 Jan 2020 08:45:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OytobmJPZFSmE99MuD0VL8LLwRMC+FIwSIZXnYrNeyCSucxyBxo15VjlB5OaD3LZDIRAUR0r3wKNE7qVHwK8F2LGrtpmQuZpMyevI6vrbUGECulPn79YrHnyLN1MxLuycuTVSO291jH4ahtMrB7MWpXrpcMv331Y6twpC5J0JZ3NXi+SVG/AD63aZxFFPePcVJ07cRdwkF7Cvqd3QpSWSs1eNhiEz/ZAan5hVqLf99wN2tzaOFfUHcld71rL3qpR0oi7ZvxjOj4xfbFU4dW189TrEJRatdQcqKmqfOnngeaA43ppaGSN3QCfoTCPqjPgiKEhcf0PMnnKsj6cGD4cQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kYHOVDtgKjC/1Pje9fTTtFmpzpV2Sxpg8elqex5FiLY=;
 b=OLlDirB7XwoVDUU6/RzGvODmCyrtma07XLzspfWspeX/KeEWDAdGTrRjNO74XbbzlmBnzoR0sqq5VO486dfKvRLQTb9FBLRJoXU2HX12EBLTKZIVjRs1f1J66gK5Yq4h/YR3g2uaGJ7TvAkbts/URdif+D6qf0HC8kSknt6SwfF2mE8qWF6g60E34quVEzi/hZ5LyJobp6pNACNGdOgB9KEl/5FtvRaiEy6Q9qkOuaxysDP0Uv3p8UaDL1tJvbCZwvtEH8+HWaZ8BitrrMQQJ0WO3YcLYu1a1sB2/A0rrZRyTxR6ypZSLhJVOz0yVrqRIxSi/wy/own1GEkQiDcMZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kYHOVDtgKjC/1Pje9fTTtFmpzpV2Sxpg8elqex5FiLY=;
 b=ij+bdVpMJi4u/fiAOn7FmFns8eEnN2EKYp6cGYnw4jLbd5ivgerJzmn79zoR0CVmSrqNhG3gNoYR5JJAPgDgiTj8uO1S1vJMpskGrBiE38aNN0flO7+zDWLDWusYieLgz936fQCursA3i2gQwooGFIUgb/hrZ076MdbZw8AwPXI=
Received: from CY4PR12CA0042.namprd12.prod.outlook.com (2603:10b6:903:129::28)
 by BN6PR12MB1649.namprd12.prod.outlook.com (2603:10b6:405:5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.13; Wed, 8 Jan
 2020 08:45:21 +0000
Received: from DM6NAM11FT062.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eaa::201) by CY4PR12CA0042.outlook.office365.com
 (2603:10b6:903:129::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2623.9 via Frontend
 Transport; Wed, 8 Jan 2020 08:45:21 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 DM6NAM11FT062.mail.protection.outlook.com (10.13.173.40) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2623.9 via Frontend Transport; Wed, 8 Jan 2020 08:45:21 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 8 Jan 2020
 02:45:20 -0600
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 8 Jan 2020
 02:45:20 -0600
Received: from wayne-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Wed, 8 Jan 2020 02:45:18 -0600
From: Wayne Lin <Wayne.Lin@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/dp_mst: Add a function to determine the mst end device
Date: Wed, 8 Jan 2020 16:44:15 +0800
Message-ID: <20200108084416.6296-2-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200108084416.6296-1-Wayne.Lin@amd.com>
References: <20200108084416.6296-1-Wayne.Lin@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(396003)(346002)(376002)(428003)(189003)(199004)(36756003)(70206006)(426003)(356004)(8936002)(5660300002)(1076003)(6666004)(26005)(8676002)(86362001)(7696005)(81156014)(81166006)(4326008)(2906002)(316002)(2616005)(186003)(54906003)(478600001)(336012)(70586007)(110136005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1649; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50605cdc-c2c2-4f1a-5165-08d7941718a0
X-MS-TrafficTypeDiagnostic: BN6PR12MB1649:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1649AD141DE94795C22AEC7CFC3E0@BN6PR12MB1649.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-Forefront-PRVS: 02760F0D1C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O4OaTsJYyvD8xrRejsSrw7hOSkM3qHQ6881q7tGVivMMiIhxE6VNg3riLOmaBMij4AjZOrVgqoT2pbA90JwKtgmCDku59GndZoWCWhEWYoPLy+tC0q681yTdCg+t39eAUBAmCUM1AaKgyFdUsGZ8+pLzADwFfD6FXQXYUxN4DAw9giURzVc6DEZ27CKd8nF+IoHlzStNgmt0ag52uqtamXi1Y+UqXcNYMqkHreB9T0rw876Uo/G7DoEfyKgZHAU/Ul/vK2R8qKx5iF7Q1hQNOaK6Lo9AnLGEThTx2+bzi3Fr6filc5RMfripaKgvG1cccEP7jzMoTSo9ZWurmWuB82Qfl3uMJq5FFFJuVtSBHEyQbctwH5Ma63p560h94Fgi6wQf7SoUwGM1Mpb0v60up0mpzTcXzO81lsIyoh50giBczT2WtaqRH9fz+QZmGQNT
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2020 08:45:21.3686 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50605cdc-c2c2-4f1a-5165-08d7941718a0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1649
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
Cc: jerry.zuo@amd.com, Nicholas.Kazlauskas@amd.com,
 Wayne Lin <Wayne.Lin@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Why]
For later usage convenience, add the function
drm_dp_mst_is_dp_mst_end_device() to decide whether a peer device
connected to a DFP is mst end device. Which also indicates if the peer
device is capable of handling message or not.

Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index eebf325d7f48..8f54b241db08 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -1918,6 +1918,22 @@ static u8 drm_dp_calculate_rad(struct drm_dp_mst_port *port,
 	return parent_lct + 1;
 }
 
+static bool drm_dp_mst_is_dp_mst_end_device(u8 pdt, bool mcs)
+{
+	switch (pdt) {
+	case DP_PEER_DEVICE_DP_LEGACY_CONV:
+	case DP_PEER_DEVICE_SST_SINK:
+		return true;
+	case DP_PEER_DEVICE_MST_BRANCHING:
+		/* For sst branch device */
+		if (!mcs)
+			return true;
+
+		return false;
+	}
+	return true;
+}
+
 static int drm_dp_port_set_pdt(struct drm_dp_mst_port *port, u8 new_pdt)
 {
 	struct drm_dp_mst_topology_mgr *mgr = port->mgr;
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
