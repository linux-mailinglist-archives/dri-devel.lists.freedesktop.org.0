Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E98137761
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2020 20:41:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CC7C6EA93;
	Fri, 10 Jan 2020 19:41:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060.outbound.protection.outlook.com [40.107.220.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D4706EA90;
 Fri, 10 Jan 2020 19:41:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GKA1iwhN8DnEtrJadJG67WTTtaEJsIofEWh3MIW3KANXeAFxB9ty+GG1CCoc3zDaAuKhl5sb1KRvh6gc5JxrNdpx+HHW8ZI8vTD7GG0BG0httbDeXviphtEaMZvP6GvDhF1lzYQId7KJNuZCm+rMVSRrDVWd4ksA3ZYymF+we7qyAPFAthtvMucDaD3W28lHy1ztJYucM3u6fAWY9CElROI/GyTw+vbP5ioZc+z6ttViLeO2nP4x3jaeHr8ABgSCEdq0Y3/gERTwD50vPLR1uEP0Kaz5B5rAEWVWnwce6cTiNV3KPp82NBDoCoaADf4np5m4nYip6ij3IZSW/429xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=813SYbI53qTRDw4EzNNi4A1l0vr86hRo8zAm3WOdWsg=;
 b=hVQ0VFNLNtzHye9TAjgItprvvEwP/D/Glry1VQr/PM1aZr/HiasCn/LvexPwnE+e8j12fp+Ul8zNGw/bXVSUv63ztwfNlWASrM2K709VOvFWKMr7lBdg5oVsJ2M+R8FP/2aooWyzRMwb1TbyKGRYTcluGN1tV5pS8rGgZxEU2GgKypH3uCqys78SMcVFPLiS2Imzr0iA+SPZiGlC1/GiUyPYKSPbkKaDZsQysxv7D4OTo8fnGq2VUl40hT0RuIiorCk3Y/+lS1f0NfSzgTiyp1KZPmH+fXvGID3iXQKKzDAEF3rzFCfXZZT6GF+H4vl4ZLeREL0zrVh/MFSmIancDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=infradead.org smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=813SYbI53qTRDw4EzNNi4A1l0vr86hRo8zAm3WOdWsg=;
 b=xhkz5gEFwkrll6xUGFRIQY4ve8mg9bln5LbfUKrDk357lKjw63Zekh5su5NyC7kO/y4w1SmOZDqFbV1hM3ODph5plhkpF7KYQgPFUC2Vc+8TLaqn+oLOMyZ9fz4ElhCSlUyOBAhnT4NCb7zOK5Gf7xGu79iOy+DZ7HB1ADvWCT8=
Received: from DM5PR12CA0016.namprd12.prod.outlook.com (2603:10b6:4:1::26) by
 CY4PR1201MB0181.namprd12.prod.outlook.com (2603:10b6:910:1f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2623.11; Fri, 10 Jan
 2020 19:41:34 +0000
Received: from CO1NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::205) by DM5PR12CA0016.outlook.office365.com
 (2603:10b6:4:1::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2623.9 via Frontend
 Transport; Fri, 10 Jan 2020 19:41:34 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; infradead.org; dkim=none (message not signed)
 header.d=none; infradead.org; dmarc=permerror action=none header.from=amd.com; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 CO1NAM11FT051.mail.protection.outlook.com (10.13.174.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2623.9 via Frontend Transport; Fri, 10 Jan 2020 19:41:34 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 10 Jan
 2020 13:41:33 -0600
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Fri, 10 Jan 2020 13:41:33 -0600
From: <mikita.lipski@amd.com>
To: <rdunlap@infradead.org>, <Alexander.Deucher@amd.com>,
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/display: Fix compilation warnings on i386
Date: Fri, 10 Jan 2020 14:41:23 -0500
Message-ID: <20200110194123.3718-1-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(346002)(136003)(396003)(428003)(189003)(199004)(8936002)(5660300002)(36756003)(54906003)(8676002)(2906002)(356004)(316002)(6666004)(1076003)(2876002)(7696005)(478600001)(81166006)(81156014)(336012)(426003)(2616005)(86362001)(186003)(110136005)(4326008)(70586007)(26005)(70206006)(2101003)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0181; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 727e4ad6-71e0-494d-4865-08d7960519a1
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0181:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB0181C5F9359373E6F7940DC0E4380@CY4PR1201MB0181.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1169;
X-Forefront-PRVS: 02788FF38E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kMb1XE/vjyJM2PNlEYiZQ8mqZGacqyBmMo6YTMTafZpF6ATG64hnlavoIEg+Hngr4LpRhu+P5T1Cv4r1aKZCYqRa63mDkOQccq1f0Csp1x1uAqs06ASk4hNhbYu1oCMDC7bVBLjwDOSP1vg/BeMbBrGqjCInavCSDRnpPa59OydggqESTsB5tWfo86ke48xtlE6N/hu63HUdOeDxIV3inGHuO0a8kpe+xJPlitTwrmmXzuprFLt2zzDv9JLO+g2sJkhnZlXlavG50VairLu3oQss5ysIFtOYmBdfvXU19uaYwq0LY1XKWZ8XA5mboJQzbSjSKUmRwKCJFlJpQKrFq1492/VLKPEBUGDUrwlEvlTrbrNe4lKx5iPpxBiDytTKHEofYBHjUGS72wUpV69rTD7jrnlpiDFBx3mmpU5F0p6B9jPfcb5mDnpxW1SlcS4Q0+cvyJUWj3wgBgOwibLCxl5rUO+uRINZljBP+aeiEc+9WRyd4iVn4OcrhLOmG39qBDt/CiIHnF0Ix0iNGgpshQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2020 19:41:34.3616 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 727e4ad6-71e0-494d-4865-08d7960519a1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0181
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
Cc: Mikita Lipski <mikita.lipski@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mikita Lipski <mikita.lipski@amd.com>

[why]
Compilation error "undefined reference to `__udivdi3'" was
thrown on i386 architecture.

[how]
Use div_u64 for unsigned long division instead of a divide operator.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Mikita Lipski <mikita.lipski@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 5a476028ee37..52fb207393ef 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -533,7 +533,7 @@ static int kbps_to_peak_pbn(int kbps)
 	u64 peak_kbps = kbps;
 
 	peak_kbps *= 1006;
-	peak_kbps /= 1000;
+	peak_kbps = div_u64(peak_kbps, 1000);
 	return (int) DIV_ROUND_UP(peak_kbps * 64, (54 * 8 * 1000));
 }
 
@@ -565,7 +565,7 @@ static int bpp_x16_from_pbn(struct dsc_mst_fairness_params param, int pbn)
 	struct dc_dsc_config dsc_config;
 	u64 kbps;
 
-	kbps = (u64)pbn * 994 * 8 * 54 / 64;
+	kbps = div_u64((u64)pbn * 994 * 8 * 54, 64);
 	dc_dsc_compute_config(
 			param.sink->ctx->dc->res_pool->dscs[0],
 			&param.sink->sink_dsc_caps.dsc_dec_caps,
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
