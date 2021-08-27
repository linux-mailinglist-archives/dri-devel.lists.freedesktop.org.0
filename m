Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF703FA1FD
	for <lists+dri-devel@lfdr.de>; Sat, 28 Aug 2021 02:00:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 338D16E9E3;
	Sat, 28 Aug 2021 00:00:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2042.outbound.protection.outlook.com [40.107.92.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7BAE6E9E3
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Aug 2021 00:00:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iQPA7mtZf3A1aSBGPJO10P+2MO2abMSpQkUM1PDend7qi3I0QWeCDrtPl0zKzsHNFreEOF8ThYN8A7/s+K8pwmvxNtAyUNWu1OZarRvo5VXZbtC7OdqEfj6WombGgVJ+30vCzzO/umYCJCVq/qjJ76Qv3WUhGkUnDa5RYTLk/xhVioqEQjuxK3yx1zxWfe6eE5tkD703xCgqgTRfuGSBqBHVU6FPA4I1OLP/a2aTyxd7jXIkiMkUTcUNijg5BltXhPRRm4Z7djuF6/c7KArKGXzX62GtNSZmJP8Pja7Jjfu1avh9a1c8bylbHhxOWk+r/JPICShnk5f1atXXnbLUAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QFcOAkGSuEsQNz2W3sRNm3XIeFSUM/x1JNqkjT4RNWA=;
 b=CsKarWmYWsIG6ge6WgcIVNjNolrZN8vwTIOTposV0w6BYZuCHHDx5hzUPv9iFxR0B0AW1cQEBF57BfXvKUg5JYRpjcawipgr865hF/9BcE+j9VOu9LWluY3IudSk4JYdNL46k87gof/yDN9XUs5GoSNIkUASKwECPTZpAYTkVJnQE78wZ3qNXrxkGVyZMZyHCDL/PbsfZnoz76ZpSg6mXiS85JazTDHVUFzs3gSKD0fBF5cKYD8F7oZS/kKwY3V6uQA4MdgbWqwjki+HEDkPDCDUe4Rccj5mpy9aKYNEOIFm1DjwXMpJs4qesnrGgtYvTp4w+WIqKPLPlMMW1GF1Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QFcOAkGSuEsQNz2W3sRNm3XIeFSUM/x1JNqkjT4RNWA=;
 b=UlgucbCuIXznoJIiz6TcJD7OkQUgwbPJj+kLufzlXlYY55gkjm0qWD9L4g05q3KYMn+Es7OUX1Z3h9OQvtEWVi5R9QgGdDNJPEv1g40MUcnbMghEaq0cjn8jkz5PgV9WBpNtxIqndVdnXbodPLn0F2CUckNleZg5TQLfiqEv0IQ=
Received: from CO1PR15CA0098.namprd15.prod.outlook.com (2603:10b6:101:21::18)
 by BL0PR12MB4610.namprd12.prod.outlook.com (2603:10b6:208:84::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Fri, 27 Aug
 2021 23:45:24 +0000
Received: from CO1NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:101:21:cafe::e2) by CO1PR15CA0098.outlook.office365.com
 (2603:10b6:101:21::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Fri, 27 Aug 2021 23:45:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT058.mail.protection.outlook.com (10.13.174.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4457.17 via Frontend Transport; Fri, 27 Aug 2021 23:45:23 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Fri, 27 Aug
 2021 18:45:22 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Fri, 27 Aug
 2021 18:45:22 -0500
Received: from jzuo-linux.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.12 via Frontend
 Transport; Fri, 27 Aug 2021 18:45:21 -0500
From: Fangzhi Zuo <Jerry.Zuo@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <lyude@redhat.com>, <harry.wentland@amd.com>,
 <Nicholas.Kazlauskas@amd.com>, <wayne.lin@amd.com>, Fangzhi Zuo
 <Jerry.Zuo@amd.com>
Subject: [PATCH 0/2] Update 128b/132b MST Slot Information
Date: Fri, 27 Aug 2021 19:43:20 -0400
Message-ID: <20210827234322.2740301-1-Jerry.Zuo@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96ecd4e1-208c-42c0-5937-08d969b4bd12
X-MS-TrafficTypeDiagnostic: BL0PR12MB4610:
X-Microsoft-Antispam-PRVS: <BL0PR12MB4610DCCC36751A1AE7FDD139E5C89@BL0PR12MB4610.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OQ9EoJR/tI+bRMckrsJ04ByUmBf1sGhN8wX/LDoOMe1zSfXAkrhC9AsRAkNnDtb5wXo/WmHZPFLHrMxzak4gbHnPO3pkgVsEhz1QyStfe2e+Na82KnvdDapig5Kr139b3CAV9BqmsLfqkUQAi10miDLYs3X9duupZHmlE/7fLzOvS5bWG8f30peRAwkCWbCKPzKHApOB9C6q9UsWtSHyLE7KD8DGV2+0soLxD9oTpadsmr2G6nAUukyMvgPLM6MWgg4UtOa9HWpnFzXLHdZ05x+tTL1az9EKTidzJ3qsHe8ZrQxSkJwHU+4etSmeORVwc2WYxv7XKT1ghHAerbw7peZI7Uobm8kGrAHhrPbGq9LJfoKntFoa2jIGgI1VbBqkEa2dwdXEKE65cWvsdlSBFt1Te3fgeqEVwZWFw+Sdng0h3+ke4Wv+JS+LgW8C8SfW1ujzzWUr77Y8utuPLN/yebaRrO09cSyuvLLNDXF89TecueE33os0zMb6WRPIL6xK8SiZoekqlNub16WMAXfsu3JwI0zYAjgyk+2eU7b/NeY3vQwSlIO/67XdDHzXThyImkSU20ESSQhMgdjfdUH3XpClWdesYXQonGzOoLpVzITL29/1eGOtvaHC3m+bOCvsV+bu4zMJrYCZTsXiO8QTgFr+xvaeWaDGBP8kUSjHd+mU7+WWtVx9uNqiYd9Yxnb/faqhAdrNs43dqUXpMykUDsSo9pj2bkkD8L41oJvkIkM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(396003)(39860400002)(46966006)(36840700001)(6916009)(15650500001)(336012)(4326008)(86362001)(426003)(2616005)(82740400003)(83380400001)(26005)(1076003)(478600001)(82310400003)(8676002)(8936002)(316002)(54906003)(70206006)(70586007)(36860700001)(2906002)(356005)(5660300002)(4744005)(7696005)(81166007)(186003)(36756003)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 23:45:23.5072 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96ecd4e1-208c-42c0-5937-08d969b4bd12
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4610
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

128b/132b MST start slot information is not the same as 8b/10b.
Update based on encoding format after link detection or topology change.

Fangzhi Zuo (2):
  drm: Update MST First Link Slot Information Based on Encoding Format
  drm/amdgpu: Example Usage in AMDGPU

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  4 ++-
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   | 10 +++++++
 .../display/amdgpu_dm/amdgpu_dm_mst_types.h   |  2 ++
 drivers/gpu/drm/drm_dp_mst_topology.c         | 27 ++++++++++++++-----
 include/drm/drm_dp_mst_helper.h               |  9 +++++++
 5 files changed, 44 insertions(+), 8 deletions(-)

-- 
2.25.1

