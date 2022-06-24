Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9076155A085
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 20:10:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5631B10F1B6;
	Fri, 24 Jun 2022 18:10:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2086.outbound.protection.outlook.com [40.107.92.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFB8C10F1B4;
 Fri, 24 Jun 2022 18:10:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H4c2SokLjH5roxvqU5C97E5XPoTpUZNvj73kSVW1ZzkPtJby4kAvyovqRDChiOkfENnQJUnqnxy5XeMjF33NzjKUUnlCWdd17rZEkh4jMdFUO2q4Lg3BubSYEAu6oncGNKF/RUpern7MJl9qjw6ZEbU6gnCgH41YEHHqzKRTm5JZmAMeJW55qh4BYI+sFqHSHfmnWZ17PNAsqyiYLSA7gYW8u2yiaUcYcp1l1PlA8bC/Q6D8FUfMOKdaLC8fG1yR8HJXLeXap8dLM6N+kjkx7ykHiHfj1aNrgT+zdQ3ubL0KkwFhZu+VnuslVuZwvu/uvoExxRFZDuPwxRTxpUbf6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hcrmnARwx0zRAQf85Llee6neaY77ns7CvF2lNb0/V5k=;
 b=MmaofhNpS4D8BHwL/pQt0OPg/iYDG49sNmLsd+dol0hEL94q/TmlVoRX+G5DGoqjGs1GoD2DbVHoWKoyXCag+BWX00HBbZGXcdLVni7RDimcnwLRRpoNvGm08dZPb+eEEaNUd/naWtCuzHJcGlo30OxmURvkHodLu7W/ELWDljYaxgEyTO+xabOIMVybEYSFTwbrSl0EsLC2RklK2SwWYu5TAnejGxBUQuO8t8kq8EaJ7njcqpeax4nwq122KqpYSmjLRB+LFliev9fHGbvprwANwzifJsr7Tyk7Ul8ItbVh17CHo6Yg7H0exs70ieCrua2Cx9gX8vpJGe8fDIuc/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hcrmnARwx0zRAQf85Llee6neaY77ns7CvF2lNb0/V5k=;
 b=iORfFgeh3+rveuiwrdcWyIkbbUMYAh/boJgBgCQQ5/VH9uTu3GqarCCbqiOaF/WftsEbdueDrZNv0+ki3ww1Vq5RGAMgLLlmU9gcySHik0/cls8nys/1SGv0jkQBqtrYyKl+rZ++DrD36d6TmfOWl0JTDIQv7MEbbgDa1EerP08=
Received: from MWHPR04CA0069.namprd04.prod.outlook.com (2603:10b6:300:6c::31)
 by BYAPR12MB3383.namprd12.prod.outlook.com (2603:10b6:a03:dc::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.17; Fri, 24 Jun
 2022 18:10:09 +0000
Received: from CO1NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:6c:cafe::5f) by MWHPR04CA0069.outlook.office365.com
 (2603:10b6:300:6c::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15 via Frontend
 Transport; Fri, 24 Jun 2022 18:10:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT058.mail.protection.outlook.com (10.13.174.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5373.15 via Frontend Transport; Fri, 24 Jun 2022 18:10:08 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Fri, 24 Jun 2022 13:10:06 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 0/4] Rework amdgpu HW fence refocunt and update scheduler
 parent fence refcount.
Date: Fri, 24 Jun 2022 14:09:51 -0400
Message-ID: <20220624180955.485440-1-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 13165bb3-49ff-41f8-7ae4-08da560cc610
X-MS-TrafficTypeDiagnostic: BYAPR12MB3383:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 30CYHhogJUhdMLl+Pz5Wp2LIlN7dxa8atKSgDq2ljTmKCdBXFwHFkWJvtHdrUf5RWHHbH04ISYfIJRMyElF/jgj0/yNJ8wkNBrzK4UNgCc09RNkSuLPtAP3+PJvE+NI+D8FDS3Pan+iXm2lg6ZbzAKrsqofUwb4SnQOdHGEgbEj8bp5ZYpBzWS/1PZAruxKE8DM/++hnQxa9IDKpjCAfunwUY48bJPFyEAwHhLJ/l5LWmMkBkVkTxddW3O5dPR7jNKWvfJHHCM38hwdusaAq96a0wuGFA9e7qKqlCQcytW4zm45JQWVGJiArwtvNGOMZw5Xm9E8dJAZ3zX5tEn5rPhcH0NRgs7XRMZqFV6aJh6Tcyi22l56zUmWiFt/RST8ZLc6cbjtKEOkrF90HKeadMvC4xWKqCPSB3ayKFQdbM4sC5jso0HsHN+LACms6mPZLzDUagwTQzkULSgOm7dJtUu+eSxEUmMJ42vBolmAdak47tY7J01NV4Yc0PORjuQh5os7Z6mmKXcoOEo+60J2mXpdINCIeLLpuW0abd4+w9BFpEDtjlGdXm5r1hT9Fa88+ZwBZwVV6cJrJKIslaLBElj1/sAwEArYe45zukLv4tIcERRk6KoVK6GX2ODXkSGebMC6UYheeX/BCVBjpflDZWv3VLTAaqI6v3dgePcvvfDttStyoMeNQHSfZwS/XuKcMbjm//wNtTvAeWXW8fksUzPPSWo9lQ+AjwayEbBhxS7Dh1lWIpViW4eAhi3dalDEcc06qMIY0EOgol/6FBloBiTI5G5bR4RFdE32ojO3PpSp6ooA0rHkfnEJPJUVN12VefCdlNl8LgPgYx8puqiOt4mpF7exeJM1BIvpXgpBB7hVzQUMP8aAdTpPfOa+xz0ijbiw84eQiIM8RocMMMyd/HQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(39860400002)(136003)(396003)(376002)(40470700004)(46966006)(36840700001)(40460700003)(5660300002)(15650500001)(82310400005)(478600001)(356005)(336012)(86362001)(44832011)(41300700001)(2906002)(7696005)(54906003)(81166007)(26005)(8676002)(40480700001)(82740400003)(966005)(1076003)(36860700001)(450100002)(8936002)(16526019)(426003)(186003)(2616005)(70586007)(70206006)(110136005)(83380400001)(6666004)(316002)(4326008)(36756003)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2022 18:10:08.5943 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13165bb3-49ff-41f8-7ae4-08da560cc610
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3383
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
Cc: jingwen.chen2@amd.com, Christian.Koenig@amd.com, monk.liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Yiqing raised a problem of negative fence refcount for resubmitted jobs
in amdgpu and suggested a workaround in [1]. I took  a look myself and discovered
some deeper problems both in amdgpu and scheduler code.

Yiqing helped with testing the new code and also drew a detailed refcount and flow
tracing diagram for parent (HW) fence life cycle and refcount under various
cases for the proposed patchset at [2].

v2:
Update race preventionby fixing by swithing from amdgpu_irq_get/put to enable/desable_irq (Christian)
Drop refcount fix for amdgpu_job->external_hw_fence as it was causing underflow in direct submissions

TODO - Follow up cleanup to totally get rid of amdgpu_job->external_hw_fence 

[1] - https://lore.kernel.org/all/731b7ff1-3cc9-e314-df2a-7c51b76d4db0@amd.com/t/#r00c728fcc069b1276642c325bfa9d82bf8fa21a3
[2] - https://drive.google.com/file/d/1yEoeW6OQC9WnwmzFW6NBLhFP_jD0xcHm/view?usp=sharing


Andrey Grodzovsky (4):
  drm/amdgpu: Add put fence in amdgpu_fence_driver_clear_job_fences
  drm/amdgpu: Prevent race between late signaled fences and GPU reset.
  drm/sched: Partial revert of 'drm/sched: Keep s_fence->parent pointer'
  drm/amdgpu: Follow up change to previous drm scheduler change.

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 31 +++++++++++++++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c  | 29 ++++++++++++++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |  4 ---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h   |  1 +
 drivers/gpu/drm/scheduler/sched_main.c     | 13 ++++++---
 6 files changed, 65 insertions(+), 15 deletions(-)

-- 
2.25.1

