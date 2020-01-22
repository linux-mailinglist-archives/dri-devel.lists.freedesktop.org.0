Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F44145D7C
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 22:06:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73AB46F8E5;
	Wed, 22 Jan 2020 21:06:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760053.outbound.protection.outlook.com [40.107.76.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B75136F8DF;
 Wed, 22 Jan 2020 21:06:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Or8NJOSjuVPPpctgI2l242jkbAqnbTPcln8sULKk5txwIlN++9GB12DGwGF+oROkcG4te+Q08zub4RUyOuhFqmcfqScMvNn7y8yluDilJZ/uKiAxyobrp9sDuiHzbKP0F3hK1q9LVKbEPc9TEoRZfK/9RpnetewseFzLPAMou+C9ZZD5FF2mM42MQ3njokSo7D7ZeJ9mbWNe8lucEklmRvtcP6UAuLcpX3Nx7V5jhK+GWSkWXbH2s/U+HSHTnC7p5KNGEPvf0BNHYcroPLg7+kVt41ct00bWB5cSUzjDiMu5/ALdZfrRN6OPpp1LdIMBtRCxWPE1iDzERAlDhxVuPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rmn56F2jxxDQmRDGPwE/Dydpk3mBmcropMybQUHGnd4=;
 b=DKi4opoRIoian1iBldj8yg7JVC7YMXhs8qO34AEwtRi2XKtZhOo70gbfpQBZPh9KdxC0GvidZ2+vF37upEU/1AoNc1a0hbfg9fefPuE04ujxv55mMxfustK+uAfWW68M89LCmN+OFH8DGbXflPkHleyeqv4bB+TOiGXr6Js20T80kIE3WS7B+mtK0+Kd0RBOR8GQXmErC+HVx4XVDzgLqyWrWMw7WmFfIFv3y6mWcNRD9v51BoeDJWc4yAKE+P28dlXJwo38qWfbOzbKww4FWXYanKYoJiXKCsObe9qTjpbcwjby8KeZYhidBh9pxCED3+d2XqwEh4iWt21jyo8R+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rmn56F2jxxDQmRDGPwE/Dydpk3mBmcropMybQUHGnd4=;
 b=0UVDVIk0IluTWQ5DC3eEuswjjLNRsc/LA0eIOaWfxLczieV/BtnjX9cEWJwTwlk6pDGBVXIxewvPNtQpqAv+FqyzPL4Ws3ksCw4ZhOyoFllMHKILQU1V0IHdESejQ4iW98913e5zl1W9k7HhdgDH60kdPDiDmI1KK1ia8lozu28=
Received: from DM3PR12CA0092.namprd12.prod.outlook.com (2603:10b6:0:55::12) by
 CH2PR12MB4181.namprd12.prod.outlook.com (2603:10b6:610:a8::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.19; Wed, 22 Jan 2020 21:06:00 +0000
Received: from CO1NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::205) by DM3PR12CA0092.outlook.office365.com
 (2603:10b6:0:55::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.18 via Frontend
 Transport; Wed, 22 Jan 2020 21:06:00 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM11FT051.mail.protection.outlook.com (10.13.174.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2644.19 via Frontend Transport; Wed, 22 Jan 2020 21:05:59 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 22 Jan
 2020 15:05:58 -0600
Received: from blakha.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Wed, 22 Jan 2020 15:05:57 -0600
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <harry.wentland@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <Alexander.Deucher@amd.com>
Subject: [PATCH 2/6] drm/amd/display: update psp interface header
Date: Wed, 22 Jan 2020 16:05:44 -0500
Message-ID: <20200122210548.2647-3-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200122210548.2647-1-Bhawanpreet.Lakha@amd.com>
References: <20200122210548.2647-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(39860400002)(396003)(428003)(199004)(189003)(356004)(6666004)(186003)(7696005)(450100002)(4326008)(6636002)(81156014)(26005)(8936002)(8676002)(81166006)(478600001)(70206006)(2906002)(2616005)(5660300002)(1076003)(70586007)(15650500001)(110136005)(86362001)(336012)(316002)(426003)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB4181; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d990fc57-436d-47ad-8ea1-08d79f7ee1ea
X-MS-TrafficTypeDiagnostic: CH2PR12MB4181:
X-Microsoft-Antispam-PRVS: <CH2PR12MB41812A8A8EF22A5EE6AB06C1F90C0@CH2PR12MB4181.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-Forefront-PRVS: 029097202E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7jANEhhG1AOFCyT6RKnadn6g2yb/8qGd/dPBw1gICSfjhepHQmlZp70wvrAnvEo+v8tyukC3ASp+d4cyccZGSmp3aRhdcfTzU+2ZTHE7YggJFfCtbq6sJ5gVuxjKEFf4Tm3zQHl0a3Nf7lanZ7Z4zF4ee/6bv+pOPMoZdaJ5K9SZ4wqu3xlBqGz2ShzDR02kegy3b4UuVN9uZ8WxNCAewDTLHPYSagtqy7XUWalZnG4geT4tNN0G0yjfb4tBKpxD2C4qo0/qj2ofTWO58LppEkQPz7Kjmc2BN2eW5Qm49kSJV+loKZvQva7kAA+V6tT7dbJuEwe4A0v22G1sfe5iKFifv0UPFem/Yu5sbtamnHq0TE2pAkd2q2QFiWU+ZJmXHledUmqhhGtmS7mY8hLK0x7RgtuO3cncmJkUsnIbXgk5ufF0Y4sCmefUinmrPYzg
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2020 21:05:59.9564 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d990fc57-436d-47ad-8ea1-08d79f7ee1ea
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4181
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
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Why]
We need to support SRM(System Renewability Message)
As per hdcp spec (5.Renewability) SRM needs to be storage in a non-volatile
memory.

PSP owns the checking of SRM but doesn't have the ability to store it in a
non-volatile memory. So we need the kernel driver to facilitate it using the
interface provided by PSP

[How]
Add the interface to the header file, so the driver can use them

v2: update commit description

Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 .../drm/amd/display/modules/hdcp/hdcp_psp.h   | 26 ++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_psp.h b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_psp.h
index 82a5e997d573..d5cb3f46606f 100644
--- a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_psp.h
+++ b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_psp.h
@@ -117,6 +117,8 @@ struct ta_dtm_shared_memory {
 int psp_cmd_submit_buf(struct psp_context *psp, struct amdgpu_firmware_info *ucode, struct psp_gfx_cmd_resp *cmd,
 		uint64_t fence_mc_addr);
 
+enum { PSP_HDCP_SRM_FIRST_GEN_MAX_SIZE = 5120 };
+
 enum ta_hdcp_command {
 	TA_HDCP_COMMAND__INITIALIZE,
 	TA_HDCP_COMMAND__HDCP1_CREATE_SESSION,
@@ -134,7 +136,10 @@ enum ta_hdcp_command {
 	TA_HDCP_COMMAND__UNUSED_3,
 	TA_HDCP_COMMAND__HDCP2_CREATE_SESSION_V2,
 	TA_HDCP_COMMAND__HDCP2_PREPARE_PROCESS_AUTHENTICATION_MSG_V2,
-	TA_HDCP_COMMAND__HDCP2_ENABLE_DP_STREAM_ENCRYPTION
+	TA_HDCP_COMMAND__HDCP2_ENABLE_DP_STREAM_ENCRYPTION,
+	TA_HDCP_COMMAND__HDCP_DESTROY_ALL_SESSIONS,
+	TA_HDCP_COMMAND__HDCP_SET_SRM,
+	TA_HDCP_COMMAND__HDCP_GET_SRM
 };
 
 enum ta_hdcp2_msg_id {
@@ -415,6 +420,22 @@ struct ta_hdcp_cmd_hdcp2_enable_dp_stream_encryption_input {
 	uint32_t display_handle;
 };
 
+struct ta_hdcp_cmd_set_srm_input {
+	uint32_t srm_buf_size;
+	uint8_t srm_buf[PSP_HDCP_SRM_FIRST_GEN_MAX_SIZE];
+};
+
+struct ta_hdcp_cmd_set_srm_output {
+	uint8_t valid_signature;
+	uint32_t srm_version;
+};
+
+struct ta_hdcp_cmd_get_srm_output {
+	uint32_t srm_version;
+	uint32_t srm_buf_size;
+	uint8_t srm_buf[PSP_HDCP_SRM_FIRST_GEN_MAX_SIZE];
+};
+
 /**********************************************************/
 /* Common input structure for HDCP callbacks */
 union ta_hdcp_cmd_input {
@@ -432,6 +453,7 @@ union ta_hdcp_cmd_input {
 	struct ta_hdcp_cmd_hdcp2_process_prepare_authentication_message_input_v2
 		hdcp2_prepare_process_authentication_message_v2;
 	struct ta_hdcp_cmd_hdcp2_enable_dp_stream_encryption_input hdcp2_enable_dp_stream_encryption;
+	struct ta_hdcp_cmd_set_srm_input hdcp_set_srm;
 };
 
 /* Common output structure for HDCP callbacks */
@@ -444,6 +466,8 @@ union ta_hdcp_cmd_output {
 	struct ta_hdcp_cmd_hdcp2_create_session_output_v2 hdcp2_create_session_v2;
 	struct ta_hdcp_cmd_hdcp2_process_prepare_authentication_message_output_v2
 		hdcp2_prepare_process_authentication_message_v2;
+	struct ta_hdcp_cmd_set_srm_output hdcp_set_srm;
+	struct ta_hdcp_cmd_get_srm_output hdcp_get_srm;
 };
 /**********************************************************/
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
