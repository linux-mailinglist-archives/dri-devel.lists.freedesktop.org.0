Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E064EDFA0
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 19:27:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8706410E4DF;
	Thu, 31 Mar 2022 17:27:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2066.outbound.protection.outlook.com [40.107.236.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55B6D10E4DF;
 Thu, 31 Mar 2022 17:27:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NU5yFE9cgBy9bl1nx3a/GJpUUpb+wWzM62SLXq5+tP2uKXACOmlnOEUyRz3dybYQs9jHHEnHBSPZeHYMm63Hc4vtXhUptnqVmWDEAggFXYUgzxfaA0hk31YIrHUoGfUlfayVdxK8V1zIzaOX2di9VGez3BFYg3YgqS8gfpxArpvbUlxnzxCLAa/IKvYuTxMo6Mxq1Gfx7X9a162phJ7FJo8kxabOjtXPSsRfcxnP8uHrXgpFTtrw+NdS1Li3N/tj1Bw+nAOu2vEANHEESIX8ICbxoFdDXPBvomlfrwKfZn5kLqwacAe/xrFglIYhIb7o92KQaNM96oVlhIlIAx3J7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IYuIHbe4G33cREYwoQh7/PYEUR1tQguKi6l9M/6gPSY=;
 b=FK9wKE6xH8IOgyNEoHdp+dBJ62mvO8E9voh6fAKWqBQu4Gwh9NQnwcY4YS8OwTHYyirE9Weccpq6Z/6Ck7ZvOzKEcejT6MZ5DCYh0PxSUstmpDzKdjfshP40cD7z3uVM6Bn0nNdN1a68pYLxBgRi9zg9QiWAn9eNIJ5h0FIv1ygfI63cxc/+RR67qCw06RHNOr+j/bZZf6CAMxCfsLHjiO0mfgSpakbHon5m6nzKcP8xjnKWqzrVGPpQKz0WNACcSeZBq+eNPqSfxjzA5w6Rc1pYnY9sHuyNYB432s9vZNwJnCFoOTiIYwKnSdrfWedp/l77HRpaAlH/a1RX6XClCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IYuIHbe4G33cREYwoQh7/PYEUR1tQguKi6l9M/6gPSY=;
 b=cXh3uLXLDC/oksm4RN0rBG1/sz43F4YN5secFwvj44kQJ7F8rxyKShfm+4opUBsE+fAZ99VB/O/f6d98LPNa2fowkiys72Aon7Yr0k0+OU3LcTnBG8ArMN2+/J+xnAvvYgGejVbYAYkmhZVToq7+jEaxMtRpygj51s0QiTU3tS0=
Received: from DM5PR22CA0020.namprd22.prod.outlook.com (2603:10b6:3:101::30)
 by PH0PR12MB5606.namprd12.prod.outlook.com (2603:10b6:510:141::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.19; Thu, 31 Mar
 2022 17:27:10 +0000
Received: from DM6NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:101:cafe::28) by DM5PR22CA0020.outlook.office365.com
 (2603:10b6:3:101::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.23 via Frontend
 Transport; Thu, 31 Mar 2022 17:27:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT055.mail.protection.outlook.com (10.13.173.103) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5123.19 via Frontend Transport; Thu, 31 Mar 2022 17:27:09 +0000
Received: from Gundam.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 31 Mar
 2022 12:27:07 -0500
From: David Zhang <dingchen.zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/1] drm: add PSR2 support and capability definition as per
 eDP 1.5
Date: Thu, 31 Mar 2022 13:26:52 -0400
Message-ID: <20220331172652.3445223-2-dingchen.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220331172652.3445223-1-dingchen.zhang@amd.com>
References: <20220331172652.3445223-1-dingchen.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 16b8fbe1-16e4-4e62-25d2-08da133bafa9
X-MS-TrafficTypeDiagnostic: PH0PR12MB5606:EE_
X-Microsoft-Antispam-PRVS: <PH0PR12MB56066C2CB5AA84F8430927E78DE19@PH0PR12MB5606.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: brmFvGxIOOn2vR91Y4t4KajUuDF653x0SALaxF57fgPpvUMpyUNq9XLST7acS+Phv1Ku8wnSiuVn+pT9RZGV6IvOX5vdKtOlt4hnJwN9ENsucW8f2pkpbfalBpPRJQllZ85Wd49k8EDaP9W2xMcRFz0ezYnIeyo+AnTecVt5aK2zwZnzZpiX6N33DKm2Dt97bjzGELuWNVqxLaLbRRnt4rmBfZksc23EXckV5G2LkOvGZJ4NTqonue8sBnTdxQC9nqqiXeOXmlVXzs3Eyu7PNgHoNLLBkUsNgiQiWcXXnJkBw/WxMEhWl6RdMHYLquvtFBaIzU5TmZn/k1aHGLz0wntNWxNe+YcigfqqUWiCWdYour20ah9+JmUXIah9Q7jwK8GCmW1CheCDZ11lPd0hBJHyYaVNcFUsvIRYO+MzOdRLly3iDfpTMTdtVnG1pDEsOduEttZzIC/9XqUavSZg1wDcoxrp1JrNR61Yv3tPlE0HWQ3QTormbblWc1F1whQhBk4HIgJM8ecmlCFbypO1tn3vevv0n6n1NiWC8sxLAk6P7Kn8Z5N2IJNW9cAEq83bvNx4+buRH55wAcuzRrub83m+8qAeOufKqAL3W5jG77dSaP2AkzrwsHEJuG9xR98zo/hntX3ggy1NUvf6CW8dpfhFgv+IComQT/q4JriYeWDW+7wbZtTMCS9jbt169YuRIIvhcFmlRBBVxxyTgEnGNpUNM75A5A14dT/J8uyqWYw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(26005)(186003)(6666004)(336012)(16526019)(426003)(86362001)(7696005)(1076003)(356005)(82310400004)(47076005)(36860700001)(2616005)(70586007)(36756003)(81166007)(5660300002)(54906003)(2906002)(8936002)(4326008)(8676002)(70206006)(316002)(508600001)(40460700003)(110136005)(21314003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 17:27:09.6349 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16b8fbe1-16e4-4e62-25d2-08da133bafa9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5606
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
Cc: stylon.wang@amd.com, airlied@linux.ie, Sunpeng.Li@amd.com,
 qingqing.zhuo@amd.com, Rodrigo.Siqueira@amd.com, roman.li@amd.com,
 solomon.chiu@amd.com, jerry.zuo@amd.com, Aurabindo.Pillai@amd.com,
 wayne.lin@amd.com, Bhawanpreet.Lakha@amd.com, agustin.gutierrez@amd.com,
 pavle.kotarac@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[why & how]
In eDP 1.5 spec, some new DPCD bit fileds are defined for PSR-SU
support.

Signed-off-by: David Zhang <dingchen.zhang@amd.com>
---
 include/drm/drm_dp_helper.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index 30359e434c3f..ac7b7571ae66 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -361,6 +361,7 @@ struct drm_panel;
 # define DP_PSR_IS_SUPPORTED                1
 # define DP_PSR2_IS_SUPPORTED		    2	    /* eDP 1.4 */
 # define DP_PSR2_WITH_Y_COORD_IS_SUPPORTED  3	    /* eDP 1.4a */
+# define DP_PSR2_WITH_Y_COORD_ET_SUPPORTED  4	    /* eDP 1.5, adopted eDP 1.4b SCR */
 
 #define DP_PSR_CAPS                         0x071   /* XXX 1.2? */
 # define DP_PSR_NO_TRAIN_ON_EXIT            1
@@ -375,6 +376,7 @@ struct drm_panel;
 # define DP_PSR_SETUP_TIME_SHIFT            1
 # define DP_PSR2_SU_Y_COORDINATE_REQUIRED   (1 << 4)  /* eDP 1.4a */
 # define DP_PSR2_SU_GRANULARITY_REQUIRED    (1 << 5)  /* eDP 1.4b */
+# define DP_PSR2_SU_AUX_FRAME_SYNC_NOT_NEEDED (1 << 6)/* eDP 1.5, adopted eDP 1.4b SCR */
 
 #define DP_PSR2_SU_X_GRANULARITY	    0x072 /* eDP 1.4b */
 #define DP_PSR2_SU_Y_GRANULARITY	    0x074 /* eDP 1.4b */
-- 
2.25.1

