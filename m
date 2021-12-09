Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BD546EF4F
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 18:00:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE74010EB0C;
	Thu,  9 Dec 2021 16:54:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2071.outbound.protection.outlook.com [40.107.236.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D91E210E120;
 Thu,  9 Dec 2021 14:21:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dLAZatXWiUtbcouV2g75r3YWge6NjkA6Mk6jaVi334qYa7cMwDHHT/zyuOIY/H+9bHj8G7RiiNcenm0KTWlk40mHQtMMvTS3gSWjyDShlsZ7Hi/aQpkx+Bnn0IPQIRMaM4WcBD4DBxddJRcVhFc/g6k1VDHqxixXl/58+IZDu/c+Gp3ajX0rVyAJ0PDhRvJRH8Dt6XDbK1qVzl8Q6XiuWxo4Ow38tyvn7dm5ZHDEV4wEv++xK6vBdFpOCpcOrAUFa0QjA0p19YD7Pds1xTP6zZxkFLsy11E7bZk+cFarzR1YDKD3gPHGZL9cm63/xTJ766Du5vUlj/y/LVMM915cPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LXPkcDirSVzKYjWAnrUMru1Nl3TdMk9JwLK6zJZ6VfY=;
 b=fvNzuN5QkOLsRTSNHDhCBaYQAKyxmbVBWwG0Di9kEag5UZAImoIlUZ6CrUhtlJPsLI0Hl13MK/dZN/rdFdRKwmcjHEzjRn+jj78eU5Si5axERm5FhAq1oNGm0NunempyX3uHa7AE8PrtnMn6OjLCXRs+yFjHd4fXUM2njbykqlAPMag7ScqLmar2lz6++IKg6ebkjWTn6gKiR4Zrc1X3YgiNPjF9pwiiTV9FeOYQW8bo7EUrEmxoKBf40xqLA4+YYflDI+tWnyj2TTVqDf2KTVozFZOIQ1FaUV0qZt00aa1OneDicjqOd3RrQbYjchqbYh47c1+ExZPfgb8KKXkpCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=emersion.fr smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LXPkcDirSVzKYjWAnrUMru1Nl3TdMk9JwLK6zJZ6VfY=;
 b=y0WE7Ovo6YKkp3NtIa+QHNJgKfhPaVjbfNl3m31F7XFA2RT3YqNkeU531kqXOsft6VwNHcuxMVSNCSoPMpCs0hIMjQAKHcKbAbXw1r+588nV+yjIxGGU0FYWxupL9dpAaRtzoxh8Mz166k+nv7JCDnujXcxY8mKrZjUXax8eWWk=
Received: from MWHPR1601CA0020.namprd16.prod.outlook.com
 (2603:10b6:300:da::30) by BY5PR12MB4049.namprd12.prod.outlook.com
 (2603:10b6:a03:201::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Thu, 9 Dec
 2021 14:21:08 +0000
Received: from CO1NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:da:cafe::b3) by MWHPR1601CA0020.outlook.office365.com
 (2603:10b6:300:da::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12 via Frontend
 Transport; Thu, 9 Dec 2021 14:21:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT012.mail.protection.outlook.com (10.13.175.192) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4755.13 via Frontend Transport; Thu, 9 Dec 2021 14:21:08 +0000
Received: from atma2.hitronhub.home (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 9 Dec
 2021 08:21:06 -0600
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Simon Ser <contact@emersion.fr>, Michel Daenzer <michel@daenzer.net>, "Bas
 Nieuwenhuizen" <bas@basnieuwenhuizen.nl>, Marek Olsak <marek.olsak@amd.com>,
 Roman Gilg <subdiff@gmail.com>, Nicholas Kazlauskas
 <nicholas.kazlauskas@amd.com>, Harry Wentland <Harry.Wentland@amd.com>, "Mark
 Yacoub" <markyacoub@chromium.org>, Sean Paul <seanpaul@chromium.org>, "Pekka
 Paalanen" <ppaalanen@gmail.com>, Yann Dirson <ydirson@free.fr>, Daniel Vetter
 <daniel@ffwll.ch>
Subject: [PATCH v4 4/6] Documentation/gpu: How to collect DTN log
Date: Thu, 9 Dec 2021 09:20:45 -0500
Message-ID: <20211209142047.728572-5-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211209142047.728572-1-Rodrigo.Siqueira@amd.com>
References: <20211209142047.728572-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1712ae65-bb29-422d-3d5e-08d9bb1f249e
X-MS-TrafficTypeDiagnostic: BY5PR12MB4049:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB404977444700032A0836E42198709@BY5PR12MB4049.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7i8ed25bOnirF+yDFjnNT+GC/ZJJrkeOLZjmBZCkyRfnH5vyFTqs/wP8PCeE+JE7wg0kTQiIQiTizANxUu95/yjSlMEOthKXwGtlQMMH7m1l73R7YCv1UzqWSgvJREg1NQyyR40ZE9og/EPKVotNJFSguYjykXCR8fKUGRO/XQxwbIaV0cK+0PYqlf1SEFMiSvnUD1DfVTtgxDgN1cFX+2IEDhCprJKfOEe9C+NRtOz4OkM/GCXhX+uhnt0yQxjWiDmY37brsmQowzYoOZ/po9cK1PSuD7XAJ67I3rcsLEKtoawPql3cRBUmtgl3YXH+hNXuRcx4Vsqm5wcrjHS0GUfx/g4XfZ9flgwZal5DHHHrR9wQKe2ce1atYTJHlBFT6vYXD314KRuPSMSxEC9BBPXf/xLczSPdAgJqEK9/LXNyIFNisBlYJsVAd0eYKDxAtPhwSxXKV0iZCDVoOneATYdYV6H5pxo5D9U3VRydbXte8xQXzYIOoVZ2v2xy8IIN+qZ5TZNLWFxiTSzuw5wCcikW7FRY8p5i8hvYrQDli0ZiQMbnmU/yslFewv5vrIatrMTkdRKlPO7Fzy2ZfpPcCVVhyCkds1xCNJajon39HFiZfv8jeawAVqPgo5GcZnPPROPxem+FzRn4kwyZpMFyB6hR8Dgnx0QSb9q/4TQxbijMYFSsFgrDjQ/FjM7zKpLJt4JO3TUYg8zxME+qKyqX0oJGmcC0IQWEqKPiHO/6dyHUoQSt8M/GqyvgZKmhYmNqt3T3MEJIaRrkWidOpKDGlw0Fxe0J80fZHtkJkJoi1x33fDhdlA4MXuCSd0ld/Foe
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700001)(54906003)(70586007)(8936002)(2906002)(40460700001)(36860700001)(6666004)(2616005)(82310400004)(426003)(36756003)(7416002)(47076005)(86362001)(336012)(316002)(8676002)(110136005)(921005)(186003)(5660300002)(70206006)(4326008)(26005)(356005)(81166007)(1076003)(83380400001)(16526019)(508600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 14:21:08.0819 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1712ae65-bb29-422d-3d5e-08d9bb1f249e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4049
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
Cc: linux-doc@vger.kernel.org, qingqing.zhuo@amd.com, roman.li@amd.com,
 amd-gfx@lists.freedesktop.org, aurabindo.pillai@amd.com, nicholas.choi@amd.com,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 bhawanpreet.lakha@amd.com, Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce how to collect DTN log from debugfs.

Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 Documentation/gpu/amdgpu/display/dc-debug.rst | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/gpu/amdgpu/display/dc-debug.rst b/Documentation/gpu/amdgpu/display/dc-debug.rst
index 6dbd21f7f59e..40c55a618918 100644
--- a/Documentation/gpu/amdgpu/display/dc-debug.rst
+++ b/Documentation/gpu/amdgpu/display/dc-debug.rst
@@ -58,3 +58,20 @@ In this case, if you have a pipe split, you will see one small red bar at the
 bottom of the display covering the entire display width and another bar
 covering the second pipe. In other words, you will see a bit high bar in the
 second pipe.
+
+DTN Debug
+=========
+
+DC (DCN) provides an extensive log that dumps multiple details from our
+hardware configuration. Via debugfs, you can capture those status values by
+using Display Test Next (DTN) log, which can be captured via debugfs by using::
+
+  cat /sys/kernel/debug/dri/0/amdgpu_dm_dtn_log
+
+Since this log is updated accordingly with DCN status, you can also follow the
+change in real-time by using something like::
+
+  sudo watch -d cat /sys/kernel/debug/dri/0/amdgpu_dm_dtn_log
+
+When reporting a bug related to DC, consider attaching this log before and
+after you reproduce the bug.
-- 
2.25.1

