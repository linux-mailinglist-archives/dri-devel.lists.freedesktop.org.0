Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8A03CF0EE
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 02:49:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 568C089F77;
	Tue, 20 Jul 2021 00:49:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2044.outbound.protection.outlook.com [40.107.92.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47F6389F77;
 Tue, 20 Jul 2021 00:49:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NAyfM9kbajgeE3rfHdrjNQ3ISay/6mERHYsbcZcXVXB9ti31pc+9AOkjeQBS0uarba7CvGfp401gKZ76LrOWc0L08qZ+YN19Eb/7aU4NTfKJSa9OLxGirix806dvq45RZ2CTpoaOeqO85ARavvEUb1gx0qltzp/6qNzYdQ8EBbXwI9cJY7Gqm9VnfvD8bGdK7K3iXwcVrpaExj03a0X2iI7ITmmUDHnLg1WwgcAA/4YIToFsZ6Cq4pgGvAHVXIo6B1ZrXDbM/380e09RgtR1lWatzPuAc6ntZ3eihiViJuns4rllpTYuT7JLnFYBPv5Sqbf7KNN0rfebvxPAXUdp0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4CXVq3XxDw4hSPG8i9y5h8mZb6K3HL/RLIxBxwn7t2Y=;
 b=LgxB9ewqu4N+Cgh2pRDj6bi4zaACs9ZyNat6Fanfo3TWrw1CdRh2DkqClznp4sRg2npkM6GtgVtEp3Zs6LHuMBV6T4HBtdM7LXlPeVcU/+4JVgr8a6ZpcRxjhMlwzensPdpE3J91gT097r5uEta04aZnO2L3/39VnG3QKj6hrCwrLa1bAATAPqWp6h9bMzMjDNSXWKvQSVUndQBmFzQNXE3mFAZCmFmMZTwt3Qh+02roHDEE5ykXvenZfxu9U/eO7Q3MPNuiy4loY1I0WYnyFgu5/HhSxANxaveFJU/yXIaWLOLVAs28vS+6CDMJrruGq8Mu3QvtE/ZEk9/lYP0VVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4CXVq3XxDw4hSPG8i9y5h8mZb6K3HL/RLIxBxwn7t2Y=;
 b=F23MHPi0uKrNpcfmsAIhbbrZMwLYVAjE8Hs2kCkyd/QkGB/y7AXJ61EH4RLm2jco2b6uhKi24fs/ekw7WyXtkQ6EPzFj0klKYYkEcIzUDoT/ov+umzboyR/vaMpwN0vPUyt/okDn8Ap6GACOy7bl8D9fJTfneF1IXrAKrVt6RG0=
Received: from BN6PR1701CA0020.namprd17.prod.outlook.com
 (2603:10b6:405:15::30) by BL0PR12MB4849.namprd12.prod.outlook.com
 (2603:10b6:208:1c2::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Tue, 20 Jul
 2021 00:49:28 +0000
Received: from BN8NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:15:cafe::26) by BN6PR1701CA0020.outlook.office365.com
 (2603:10b6:405:15::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Tue, 20 Jul 2021 00:49:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT052.mail.protection.outlook.com (10.13.177.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Tue, 20 Jul 2021 00:49:28 +0000
Received: from atma2.hitronhub.home (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 19 Jul
 2021 19:49:27 -0500
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Peter Zijlstra <peterz@infradead.org>, Daniel Vetter <daniel@ffwll.ch>,
 <roman.li@amd.com>, <sunpeng.li@amd.com>
Subject: [PATCH v3 0/4] Base changes for isolating FPU operation in a single
 place
Date: Mon, 19 Jul 2021 20:49:10 -0400
Message-ID: <20210720004914.3060879-1-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03003ef1-f58e-4609-4cfc-08d94b183a9c
X-MS-TrafficTypeDiagnostic: BL0PR12MB4849:
X-Microsoft-Antispam-PRVS: <BL0PR12MB4849E5964FF07BA8BFA51FC898E29@BL0PR12MB4849.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UtzytfWFputjJy+NGooK28WPth0HaaO89lftJeeWgGCDkgKXOhEmHEZvEejKW0NDyT9fHHwv84ge+9Ak1nHejzSFuummQY+fkbSpdAI46xpzXVeFPY9FyO383patUoQRdpVJDjqi7BdM28yddNpyRBkKAXLHIXRu5WdDQyf1pyC90hCBCtH/q/VrZwLwladECYrFIdiJmuIYfhhZQ1QS/oTuge7e5vgctH6VWpOO0KZRcNk9puwJRiD1XOtm75j+6Vraq3TrH2espzYnMtoZzOdED/EGvN9xylZjKMl+/3QsTPhKo2h6LuNYy3irl3yj0xtdCRrg/FT9jLBhYxNejsGomEx4U2+Hkq2GgpRf8gfEFcEDqFKUw0/VyTYJ/gOTlozedPy00A9E/I6hJbfpZB2s3aHLCEjb4sp7oFhTfrN4d4EDo8OtY/hBSvSzkJ8WuaKnx9blUgBDQqy9Yv6mF8Szn/KWlvuSC4POiSk51wyvuiqjf/DqnJKt+4alMFL18JhwasVWnkBeCBzhkerPZzBVea6M5nU455SAJztVYLXL707e3FTkyWB+b5AubkgMVBwuZ4MOoYT2U8mqeM250Lwtm7d1oymLVUzfvZq5Su0FMfiA0VfLT8K/Uylpr8EbHmSjZfNiXbNHWphqLK0UetjJ/iSdmuCHn3pvk00KjAIo0wYP3BT2w+JJuDc+bxnG915t4iVDVuKpFz1Vxd0zIki5IpJRUSzKinV8/A/dEUM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(39860400002)(346002)(46966006)(36840700001)(356005)(4326008)(110136005)(81166007)(54906003)(82740400003)(16526019)(8676002)(6636002)(83380400001)(5660300002)(316002)(86362001)(70586007)(6666004)(36756003)(8936002)(70206006)(2616005)(478600001)(426003)(36860700001)(1076003)(47076005)(82310400003)(186003)(26005)(2906002)(336012)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 00:49:28.3166 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03003ef1-f58e-4609-4cfc-08d94b183a9c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4849
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

In the display core, we utilize floats and doubles units for calculating
modesetting parameters. One side effect of our approach to use double-precision
is the fact that we spread multiple FPU access across our driver, which means
that we can accidentally clobber user space FPU state.

# Challenges

1. Keep in mind that this FPU code is ingrained in our display driver and
performs several crucial tasks. Additionally, we already have multiple
architectures available in the kernel and a large set of users; in other words,
we prefer to avoid a radical approach that might break our user's system.

2. We share our display code with other OSs; thus, we need to maintain the
interoperability between these two systems.

3. We need a mechanism for identifying which function uses FPU registers;
fortunately, Peter Zijlstra wrote a series a couple of months ago where he
introduced an FPU check for objtool. I used the following command for
identifying the potential FPU usage:

 ./tools/objtool/objtool check -Ffa "drivers/gpu/drm/amd/display/dc/ANY_FILE.o"

4. Since our code heavily relies on FPU and the fact that we spread
kernel_fpu_begin/end across multiple functions, we can have some complex
scenarios that will require code refactoring. However, we want to avoid
complicated changes since this is a formula to introduce regressions; we want
something that allows us to fix it in small, safe, and reliable steps.

5. Unfortunately, for legacy reasons, we have some problems in how we program
our FPU access, which in some weird scenarios can generate situations where we
try to enter in the fpu mode multiple times or exit too early.

# Our approach

For trying to solve this problem, we came up with the following strategy:

1. Keep in mind that we are using kernel_fpu_begin/end spread in various areas
and sometimes across multiple functions. If we try to move some of the
functions to an isolated place, we can generate a situation where we can call
the FPU protection more than once, causing multiple warnings. We can deal with
this problem by adding a thin management layer around the kernel_fpu_begin/end
used inside the display.

2. We will need a trace mechanism for this FPU management inside our display
code.

3. After we get the thin layer that manages FPU, we can start to move each
function that uses FPU to a centralized place. Our DQE runs multiple tests in
different ASICs every week; we can take advantage of this to ensure that our
FPU patches work does not introduce any regression. The idea is to work on a
specific part of the code every week (e.g., week 1: DCN2, week 1: DCN2.1,
etc.).

4. Finally, after we can isolate the FPU operations in a single place, we can
altogether remove the FPU flags from other files and eliminate an unnecessary
code introduced to deal with this problem. We can also remove the thin layer
added in the step 3.

# This series

To maintain the interoperability between multiple OSes, we already have a
define named DC_FP_START/END, which is a straightforward wrapper to
kernel_fpu_begin/end in the Linux side. In this series, I decided to expand the
scope of this DC_FP_* wrapper to trace FPU entrance and exit in the display
code, but I also add a mechanism for managing the entrance and exit of
kernel_fpu_begin/end. You can see the details on how I did that in the last two
patches.

I also isolate a simple function that requires FPU access to demonstrate my
strategy for isolating this FPU access in a single place. If this series gets
accepted, the following steps consist of moving all FPU functions weekly until
we isolate everything in the fpu_operation folder.

Change Since V2:
- Make sure to compile FPU operation only when DCN is enabled
  (officially, we only enable it for x86).
- Check cross-compile with ARM and x86_32. Everything looks fine.
- Avoid call this_cpu_* operations between get/put_cpu_ptr.
- Fix GCC warnings.
- Update documentation.
- Update our assert mechanism.
- Remove unnecessary wrappers.

Changes since V1:
- Use a better name for variables.
- Update documentation.
- Avoid preemption.

* See update details per commit message

Best Regards
Rodrigo Siqueira

Rodrigo Siqueira (4):
  drm/amd/display: Introduce FPU directory inside DC
  drm/amd/display: Add FPU event trace
  drm/amd/display: Add control mechanism for FPU utilization
  drm/amd/display: Add DC_FP helper to check FPU state

 .../gpu/drm/amd/display/amdgpu_dm/Makefile    |   4 +
 .../amd/display/amdgpu_dm/amdgpu_dm_trace.h   |  24 ++++
 .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.c    | 111 ++++++++++++++++++
 .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.h    |  34 ++++++
 drivers/gpu/drm/amd/display/dc/Makefile       |   1 +
 drivers/gpu/drm/amd/display/dc/dc_trace.h     |   3 +
 .../drm/amd/display/dc/dcn20/dcn20_resource.c |  41 +------
 .../drm/amd/display/dc/dcn20/dcn20_resource.h |   2 -
 .../drm/amd/display/dc/dcn21/dcn21_resource.c |   2 +
 .../amd/display/dc/fpu_operations/Makefile    |  58 +++++++++
 .../drm/amd/display/dc/fpu_operations/dcn2x.c | 102 ++++++++++++++++
 .../drm/amd/display/dc/fpu_operations/dcn2x.h |  33 ++++++
 drivers/gpu/drm/amd/display/dc/os_types.h     |   6 +-
 13 files changed, 379 insertions(+), 42 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/fpu_operations/Makefile
 create mode 100644 drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/fpu_operations/dcn2x.h

-- 
2.25.1

