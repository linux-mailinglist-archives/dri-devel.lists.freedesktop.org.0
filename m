Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C129560BC22
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 23:27:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC5E410E06A;
	Mon, 24 Oct 2022 21:27:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2053.outbound.protection.outlook.com [40.107.94.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E5F410E052
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 21:27:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zhp0NcOoDmBYcHEGnu07EWEfHElvRgNvJG6p2SPlbUpcHgrIeIkkcZVuY6v1t0Ydhw/axUXK8sS5oEbUaOsUUU6E9PYLDr9U24vDPhejcbmu+ZsNxliCF86WF3Da8LQojYQwiaRWgNoIMdS00O9Y6cQ4Yrtx5xMoWbHpBwDS09F56wriTvB5IDy61+qYD1iIeLJwVLDUPrjzhacKTnjc9fJF9SJF+u2+B4K6ISZ0CvkCgZ+px/3h7s7QG4lvjqD1hbFiRwhZmIVL9cGJenHdbg23xG0V16ePxACyo8rtZV+90vAF8U/CyMpauSU8EwIQruOUTSdJjq/4o5qmCjS65A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uRToRllvjXZSF9alI5MbFce+aK7CQ2zTiSvi/g41U1c=;
 b=Ti/AIvIrcfD3RBl9OrF62YbB/PXguG2MB/Je7KQ0FMf8B/Wj+La2zSr0eiQDc9rqBK/22TZm0qJ11hMEyRvsBYEoKCJlPvx+ppFlkY0a8g6pVqZh1D9RH8LsgY6XQaItsQHjBfpp7DU1furEzhAl/mksLeEWVWBhFYXboYb7BKxBRKu8ceOKE70ybJWkGADcAaJ3Qgvz8RzvCtWPU/bYCT9hWWclK8GP7ojX1aWPIhEk7EkO8c5JnSCg8wFoeEzte5UFJK/E/zyxCUVB2/wNMeazlESOXAK7Gp39mMu6R67shdqhKrffHWQabFeCbgBg8j4Lvc9MM7KBOXxRkx3iaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uRToRllvjXZSF9alI5MbFce+aK7CQ2zTiSvi/g41U1c=;
 b=d1DbBaq9pScPu4Z3YfUGTZ3b+HaLBEi0PeeLZBUx0vQYt9v/v6J0PrBVNzdfUS8hbgQezSeucaGsQSIo3gNEuNWuis8tIuRxrbNG0OeImWWTR4As63VD+0zKJvPcV4YxKTdlzZe6i4UrM6kB9bbgUHHNKEwWgRU33pjmVg10wYk=
Received: from MW2PR16CA0029.namprd16.prod.outlook.com (2603:10b6:907::42) by
 CH0PR12MB5140.namprd12.prod.outlook.com (2603:10b6:610:bf::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.26; Mon, 24 Oct 2022 21:27:05 +0000
Received: from CO1NAM11FT049.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:0:cafe::fb) by MW2PR16CA0029.outlook.office365.com
 (2603:10b6:907::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15 via Frontend
 Transport; Mon, 24 Oct 2022 21:27:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT049.mail.protection.outlook.com (10.13.175.50) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Mon, 24 Oct 2022 21:27:04 +0000
Received: from fedora.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 24 Oct
 2022 16:27:03 -0500
From: Luben Tuikov <luben.tuikov@amd.com>
To: Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v1] drm/scheduler: Set the FIFO scheduling policy as the
 default
Date: Mon, 24 Oct 2022 17:26:34 -0400
Message-ID: <20221024212634.27230-1-luben.tuikov@amd.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-check-string-leak: v1.0
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT049:EE_|CH0PR12MB5140:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d977d4f-fce1-418a-5afa-08dab6067f57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7ObubpkQcPl3SrQCoi11s5cmxJ5IyO6lVS2OCw+yAr7xVkRMBbodihG/v3gmo+nyd5o1+J4byID8TyeOoxEsH+TwG5shNVzc7sv0CNG4240QfcZT2BfG9VvJZuaUYYmZKV01PuRkL1+M67OzH+Ho3lFKOeS+dQylhMj7INpe1fe/2CIrK1InlWxV+CXwcBb5f4MV8mfRZVpXQ9zgbTH9kCoVj6drs2yett4h0Rcg9oJN4ENoRboliVf8ir/Ww0u4lnMr9jZaEVVY1HbzWo2SY7ysrgIkrG80IivHXQwE3OnBDiwB3g8bzt52zT05qUgj4DKy3P1HP3+ajaqnKUm/Euf+6eDtIb/2ASweL1SnwkKFHtXJoKQw8vu/G230LVsu4cJblZXrfSSvxABCfpyHWPNIDqUET/Ykc9WRO0FnXy8P2W6fPlWxltklPxg7g/T8ZCUhB1//wOQg1p1kGhJz5TRkkktC8inJ5i3SGf2nx4opEPk93IuN6V4xmm7zWmgSQzk/RB9y2xfkvZK5r5u1rwZ7QJwCJGHEAu2rw1tbMLIN8IlAqxlFJvEMlEG0m/5iymyUqAWuE44H+xlZ2xFgfinWxosl4ERoFfYccEirx924YvYA4qZ83VaEkSM8Iv2O9Bcwuur488F1HZfJyjoX/TUJrMYtZETWBkHV7USXFkK05pbBp1mHnwquQ0JvuBaAJ+SB6aiZGZQgN5co43Les15cxhfzrV7Ex+ZiQEq3fqJ9qBDzEG87E+FjSYewcWFkBBu3oJf+V0ru6/1gt3GfPdVU0BbiRKDHtNRPJrenYxMNdoqtqeS5HDknnAABNedL
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(136003)(346002)(39860400002)(396003)(451199015)(36840700001)(46966006)(40470700004)(8676002)(4326008)(40460700003)(336012)(6666004)(70586007)(70206006)(16526019)(1076003)(44832011)(26005)(36860700001)(5660300002)(86362001)(6916009)(356005)(41300700001)(36756003)(478600001)(81166007)(2616005)(186003)(7696005)(82740400003)(2906002)(47076005)(8936002)(316002)(66574015)(54906003)(82310400005)(426003)(40480700001)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 21:27:04.7118 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d977d4f-fce1-418a-5afa-08dab6067f57
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT049.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5140
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
Cc: Alex Deucher <Alexander.Deucher@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The currently default Round-Robin GPU scheduling can result in starvation
of entities which have a large number of jobs, over entities which have
a very small number of jobs (single digit).

This can be illustrated in the following diagram, where jobs are
alphabetized to show their chronological order of arrival, where job A is
the oldest, B is the second oldest, and so on, to J, the most recent job to
arrive.

    ---> entities
j | H-F-----A--E--I--
o | --G-----B-----J--
b | --------C--------
s\/ --------D--------

WLOG, assuming all jobs are "ready", then a R-R scheduling will execute them
in the following order (a slice off of the top of the entities' list),

H, F, A, E, I, G, B, J, C, D.

However, to mitigate job starvation, we'd rather execute C and D before E,
and so on, given, of course, that they're all ready to be executed.

So, if all jobs are ready at this instant, the order of execution for this
and the next 9 instances of picking the next job to execute, should really
be,

A, B, C, D, E, F, G, H, I, J,

which is their chronological order. The only reason for this order to be
broken, is if an older job is not yet ready, but a younger job is ready, at
an instant of picking a new job to execute. For instance if job C wasn't
ready at time 2, but job D was ready, then we'd pick job D, like this:

0 +1 +2  ...
A, B, D, ...

And from then on, C would be preferred before all other jobs, if it is ready
at the time when a new job for execution is picked. So, if C became ready
two steps later, the execution order would look like this:

......0 +1 +2  ...
A, B, D, E, C, F, G, H, I, J

This is what the FIFO GPU scheduling algorithm achieves. It uses a
Red-Black tree to keep jobs sorted in chronological order, where picking
the oldest job is O(1) (we use the "cached" structure), and balancing the
tree is O(log n). IOW, it picks the *oldest ready* job to execute now.

The implementation is already in the kernel, and this commit only changes
the default GPU scheduling algorithm to use.

This was tested and achieves about 1% faster performance over the Round
Robin algorithm.

Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <Alexander.Deucher@amd.com>
Cc: Direct Rendering Infrastructure - Development <dri-devel@lists.freedesktop.org>
Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 2fab218d708279..d0ff9e11cb69fa 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -62,13 +62,13 @@
 #define to_drm_sched_job(sched_job)		\
 		container_of((sched_job), struct drm_sched_job, queue_node)
 
-int drm_sched_policy = DRM_SCHED_POLICY_RR;
+int drm_sched_policy = DRM_SCHED_POLICY_FIFO;
 
 /**
  * DOC: sched_policy (int)
  * Used to override default entities scheduling policy in a run queue.
  */
-MODULE_PARM_DESC(sched_policy, "Specify schedule policy for entities on a runqueue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin (default), " __stringify(DRM_SCHED_POLICY_FIFO) " = use FIFO.");
+MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO (default).");
 module_param_named(sched_policy, drm_sched_policy, int, 0444);
 
 static __always_inline bool drm_sched_entity_compare_before(struct rb_node *a,

base-commit: 27b2ae654370e1a8e446b0e48c4e406abed12ca1
-- 
2.38.1

