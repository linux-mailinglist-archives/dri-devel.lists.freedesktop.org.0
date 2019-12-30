Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E60E12CD3B
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2019 08:06:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC06E8994D;
	Mon, 30 Dec 2019 07:05:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2089.outbound.protection.outlook.com [40.107.92.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD10C8994D;
 Mon, 30 Dec 2019 07:05:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ql0+yMY6K48JEA3vNv2Qj4CObzh8NbnbViU3qPNIxG2FlIepXU4J4TKCKrqBlitI0wovD9qQ6pr72rXjqKCLpZEicP8Qvz12/dR3/WDSDjWxs+jaYSGn8vZQ8hWGYHdATHYpGltvAAaAHX7PQU/buT8ukz6H94jguOh00nNW9lEi4RtSEB1EivAoxDl3SrfZ50RKcd97X0un2UqjQypklUzc2IZic9MV0HUA1BiEA747UWISCXbs7MRuS1L+UN22HiVds3yTI0FqR7fIW54f8oLUCjGiUwirNJ6u1t9BzwsFG6xMLKMZY9mpuMR946cDCorCiOdPuMnwu3kNTBXosw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SPXHfHhL8dgN+PDXOXC5e3as7rRVt9+i3hKUhO1FG4A=;
 b=PqcydoVMl+EpNiQdMdFu/gVeHD2okbMOuXCVIfUJFJWEF0CoDeb9a+nFJhMDja3n1IRdBbapW+L0AQTMP8lV1PQLwQCyCNA2hoJtrcU3XZF9LkfF/4JmNuDJibQjikfdDq/4EUkeP0wT7b1O5+gI1SLttFlw7n7NtsxS2AZNCqMyhtffBjsgZ+1AXxmo4QkiIMZUoZ3ejNMA7gSp/ny4NamH244YTDl2QSakRj+WdWY6mp7wyVLzkaHbm+Vbu+5qsYED9JcVPUZMo+16ePaYup+gv1AaLWK8gR3OcB+ln02M/Pi08bwf4finnBOYQMVU+fquZXWz1AnmA3iXI9+zIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SPXHfHhL8dgN+PDXOXC5e3as7rRVt9+i3hKUhO1FG4A=;
 b=uWK9RKqB4QOiHne60Ok6TQplJY2GGVdVuQlHeP0Xzyba1Ds0hJgptqLXUPiT07htAphrqB7pdmQhyxVbOFIRu+QcV9ZzXeFr3xoMEcMsRZn0vkdpjoOHDIr18GpGxsjodQMxYZ4NatpmpVcZq8Z8VhBqdHRzuuo8QiNy1zWktXg=
Received: from SN1PR12CA0063.namprd12.prod.outlook.com (2603:10b6:802:20::34)
 by SN6PR12MB2606.namprd12.prod.outlook.com (2603:10b6:805:6e::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2581.11; Mon, 30 Dec
 2019 07:05:54 +0000
Received: from DM6NAM11FT040.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eaa::201) by SN1PR12CA0063.outlook.office365.com
 (2603:10b6:802:20::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2581.12 via Frontend
 Transport; Mon, 30 Dec 2019 07:05:54 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM6NAM11FT040.mail.protection.outlook.com (10.13.173.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2581.11 via Frontend Transport; Mon, 30 Dec 2019 07:05:53 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 30 Dec
 2019 01:05:53 -0600
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 30 Dec
 2019 01:05:53 -0600
Received: from wayne-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Mon, 30 Dec 2019 01:05:51 -0600
From: Wayne Lin <Wayne.Lin@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/dp_mst: correct the shifting in DP_REMOTE_I2C_READ
Date: Mon, 30 Dec 2019 15:05:16 +0800
Message-ID: <20191230070516.4760-1-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(136003)(39860400002)(396003)(428003)(199004)(189003)(110136005)(426003)(26005)(186003)(8676002)(36756003)(478600001)(86362001)(2906002)(316002)(2616005)(70586007)(70206006)(1076003)(54906003)(336012)(8936002)(5660300002)(81156014)(4326008)(7696005)(81166006)(356004)(6666004)(70780200001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2606; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d63b7e63-1494-4322-4375-08d78cf6b5f4
X-MS-TrafficTypeDiagnostic: SN6PR12MB2606:
X-Microsoft-Antispam-PRVS: <SN6PR12MB2606133BEAC8CD8433C3346CFC270@SN6PR12MB2606.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:451;
X-Forefront-PRVS: 0267E514F9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0ZGxYuFVubgWsJcegeh7tKA20xT25Xt91rCqqvSXYa6nY9DGoKdgdb+gOTsTut5sKDHuEKVcU8f3kmtyIoyyVLqo3Kig2l4JtkEJ1i2WNBgdI6oRcn5WNpW7Ev8L9qb+8ykrHWiE+6sMVm3zwaFsdIT6K0GFclHPuVGcv8kTanl/ejCjG1OpTyfZx4onAjtm30MLrkXERAvVEEybIFlPHV8U9rxenLmB4sqUmx1Ny00ob3XPw46fmtpbqAU2ABhjq1UHPmLVCvs3TdSJkujMKvqiTbFy3vlqhNDLuT/yNx7IZ0/Kif4PD5cPkC07qhnEXjO0cXDuRHIH/P3ZUDScGXwjwmWuOwvLcOqnrZxwtti881V9oVFfTnkEpT5zc46HgS6xwuXLQVEo8hnXnLcdkLL5N9VjtvMKF1hlCtAoxOgEiMdWlgmOYuygA2uIbWBKSwaQ4bFGhHpg+Bq7n2brDc+pCGXA+55/ZTT7TUY8+1sdBlnMqDIEdRP08+4qDFkZ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2019 07:05:53.7911 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d63b7e63-1494-4322-4375-08d78cf6b5f4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2606
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
According to DP spec, it should shift left 4 digits for NO_STOP_BIT
in REMOTE_I2C_READ message. Not 5 digits.

[How]
Correct the shifting value of NO_STOP_BIT for DP_REMOTE_I2C_READ case in
drm_dp_encode_sideband_req().

Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 1d1bfa49ca2b..0557e225ff67 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -393,7 +393,7 @@ drm_dp_encode_sideband_req(const struct drm_dp_sideband_msg_req_body *req,
 			memcpy(&buf[idx], req->u.i2c_read.transactions[i].bytes, req->u.i2c_read.transactions[i].num_bytes);
 			idx += req->u.i2c_read.transactions[i].num_bytes;
 
-			buf[idx] = (req->u.i2c_read.transactions[i].no_stop_bit & 0x1) << 5;
+			buf[idx] = (req->u.i2c_read.transactions[i].no_stop_bit & 0x1) << 4;
 			buf[idx] |= (req->u.i2c_read.transactions[i].i2c_transaction_delay & 0xf);
 			idx++;
 		}
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
