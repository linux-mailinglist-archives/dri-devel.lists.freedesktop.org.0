Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F18511EB99
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 21:09:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81B6A6ED1E;
	Fri, 13 Dec 2019 20:09:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680046.outbound.protection.outlook.com [40.107.68.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A48D6ED05;
 Fri, 13 Dec 2019 20:09:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PJi00fWLGtiD6VPt12iz+SFktxBbp9ioznsordz9pidxUxuU5iTWrpy+0mo5yUrPS24ETcMCvBkwWhyhvvdEogErIyfwmIoAcugZh25IsL/FYBy6LMIKTTKeCzomrKweVyY4MwT7kCZi3OtuAAZNGiScLvyzUjvEdEjzHfji+EQi5W4S0YiUt5kV5O9SmwPSnlfWrtsIVLR7MrVFcp3qriU9lmOBZZFltIIQwRGsDejgzvOhuTnzCMDPYyOo6OyVCGoJrClONoc4JQgFjacZWnidDcT+ewZ9oFddHjy+KsprRLt9iL4nT47okqaJ96QBef+Cq6geGqcFpYZ6LHIfJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oa/rigW/XStSC7qoKmCPMJfLMGySJa3qKMpWWxDPN+g=;
 b=cgQ6gvPJ8VJAUFzcNmU5s5K3mU0An63NNF/RSdOa6T2rebAaTn2sHRvzn0af+8oqM3OCjde3GLidY5zJm8iRrfXEgoit76dIHzlydzzoF2zeJPCw43J4jqCjSVcHlPW/nXsh8ukhPUGy/ftKKPPJvKCBE5yw4ZWLkaHRyNRmcL7+ALh/1VryN9eW2pHtTZgyiJUZ+ekRVMWi+IJpIh6VKWwIcfTbS51pWvIepij1STwKzY3ltwmR5jGREsGvGsynOhsI8nez3x97Lb73wmfsp7go6MaEaLNkS4PPpI/u8bktg+Q/mLwQOQtFax75FM2O286KoKi6YOuEYEr+zsJ6pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oa/rigW/XStSC7qoKmCPMJfLMGySJa3qKMpWWxDPN+g=;
 b=KkTez9mVzS6bpADa+JT2QaUeqinx+Mupf/ZhWGrwRFvoocNTNS1P4Ipro8gPnNQv+jT1C1PqwwlIaxR8lU5ASwsEotwt7QSQx7FmLkYLfUkqjHInhOnfOfoaBMdldXL60WuUN8c2hdiu4PoNNUrraaHvqQ2s9rKn6Puj7gzjVM0=
Received: from SN1PR12CA0069.namprd12.prod.outlook.com (2603:10b6:802:20::40)
 by BYAPR12MB2854.namprd12.prod.outlook.com (2603:10b6:a03:135::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.15; Fri, 13 Dec
 2019 20:09:00 +0000
Received: from DM6NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eaa::207) by SN1PR12CA0069.outlook.office365.com
 (2603:10b6:802:20::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.17 via Frontend
 Transport; Fri, 13 Dec 2019 20:09:00 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM6NAM11FT023.mail.protection.outlook.com (10.13.173.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2538.14 via Frontend Transport; Fri, 13 Dec 2019 20:08:59 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 13 Dec
 2019 14:08:59 -0600
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 13 Dec
 2019 14:08:58 -0600
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Fri, 13 Dec 2019 14:08:58 -0600
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v9 02/18] drm/dp_mst: Parse FEC capability on MST ports
Date: Fri, 13 Dec 2019 15:08:38 -0500
Message-ID: <20191213200854.31545-3-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191213200854.31545-1-mikita.lipski@amd.com>
References: <20191213200854.31545-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(39860400002)(376002)(346002)(428003)(199004)(189003)(86362001)(6916009)(8936002)(81156014)(70206006)(186003)(70586007)(26005)(8676002)(2616005)(81166006)(356004)(336012)(5660300002)(6666004)(2906002)(36756003)(2876002)(1076003)(54906003)(426003)(450100002)(7696005)(4326008)(478600001)(316002)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2854; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd7844c6-c777-461b-ea66-08d780084adc
X-MS-TrafficTypeDiagnostic: BYAPR12MB2854:
X-Microsoft-Antispam-PRVS: <BYAPR12MB285416D2C306AFC840C5F82FE4540@BYAPR12MB2854.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 0250B840C1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZItS2u6JGqJFJhr43HvheaQZ9IEfrba8EkKJWYgpcvtcXdGqLQEe5ouwfPTM67tcEFhBGVMOnZdTTtD+VxtxTsM+UWqlnI7aQ2LB3WnmFQhA+LmceJcLJkK2tolQmT6AReiTr8lBndzzOk6JI9j7rJU4eWa/Yy/lNH/Rucfm0Fj8Kj0HrSI94v/tlgLd8G4SD6Yb0qdXWbbJmMM2gKjdePN1ZmuKs9E5aXA2KAfKx+GXuVgUMc+FgMyi3NSHhE8NCVGBI5MmmdzWzAbNOyhxiXfE1WNzVH/JuNXrIXjU6vOGA56OhsIOrLfFkal+qszErVFkEgKk0sYpUbhyFHOx7HYLt1HVjsjFKLjUMisFOKA5NzAR9Lkyh/T+JD4oB2uqn4tZlxikRy8vLQ9z+gjRTQN1ZTNipi66/pTRQrXGL1arIl1kTqqcqLw3TukUtqFHtRuaaxHgF2B9q4B7IodZnouPHzRq3vjEhqwXtcqcyPiADyqIh+2OfxUx1WYaEIoU
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2019 20:08:59.9449 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd7844c6-c777-461b-ea66-08d780084adc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2854
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

As of DP1.4, ENUM_PATH_RESOURCES returns a bit indicating
if FEC can be supported up to that point in the MST network.

The bit is the first byte of the ENUM_PATH_RESOURCES ack reply,
bottom-most bit (refer to section 2.11.9.4 of DP standard,
v1.4)

That value is needed for FEC and DSC support

Store it on drm_dp_mst_port

Reviewed-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: David Francis <David.Francis@amd.com>
Signed-off-by: Mikita Lipski <mikita.lipski@amd.com>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 2 ++
 include/drm/drm_dp_mst_helper.h       | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 363e7e58e7e7..ba5328cdc853 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -846,6 +846,7 @@ static bool drm_dp_sideband_parse_enum_path_resources_ack(struct drm_dp_sideband
 {
 	int idx = 1;
 	repmsg->u.path_resources.port_number = (raw->msg[idx] >> 4) & 0xf;
+	repmsg->u.path_resources.fec_capable = raw->msg[idx] & 0x1;
 	idx++;
 	if (idx > raw->curlen)
 		goto fail_len;
@@ -2894,6 +2895,7 @@ drm_dp_send_enum_path_resources(struct drm_dp_mst_topology_mgr *mgr,
 				      path_res->avail_payload_bw_number);
 			port->available_pbn =
 				path_res->avail_payload_bw_number;
+			port->fec_capable = path_res->fec_capable;
 		}
 	}
 
diff --git a/include/drm/drm_dp_mst_helper.h b/include/drm/drm_dp_mst_helper.h
index 68656913cfe5..0cada01e8139 100644
--- a/include/drm/drm_dp_mst_helper.h
+++ b/include/drm/drm_dp_mst_helper.h
@@ -156,6 +156,8 @@ struct drm_dp_mst_port {
 	 * audio-capable.
 	 */
 	bool has_audio;
+
+	bool fec_capable;
 };
 
 /**
@@ -383,6 +385,7 @@ struct drm_dp_port_number_req {
 
 struct drm_dp_enum_path_resources_ack_reply {
 	u8 port_number;
+	bool fec_capable;
 	u16 full_payload_bw_number;
 	u16 avail_payload_bw_number;
 };
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
