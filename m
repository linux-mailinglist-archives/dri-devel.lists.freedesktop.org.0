Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE62269F82
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 09:19:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 789B66E866;
	Tue, 15 Sep 2020 07:19:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2045.outbound.protection.outlook.com [40.107.220.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0E386E861;
 Tue, 15 Sep 2020 07:19:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jRdGd3EWR3TpHnZF7eDWO+6xpySPkBzcUT17lE996/HEXdmw1RZqnXEXHi1wRQW5oGAgKV9PaokoMCCdEYYmqr53I+fPk9+Cv7LOYPakBRYe6JKIFp433webN6PaQ1QfWx+nOoHpYlz3DHVk/ILxXUZX5+gPx+JkohF5n/IF16j5l4czBdZJ7eUbgq8EkgO1efFpOXtv/RpznPgiMlCxguWV0MQRhuhyXw0D9W6a5mYPESgDUeXF6axGXjcRhYByapUMStfrDRFd8LT5L+rEwvAI0eglTCQkqybhFovy6qYCQqsVLxt7mqFYC9dJmFvCYA9VH2iJVbmK4ltutnVzaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MN0h4db/wY5OVp9uE290/zx+FNKxz/12u3RtAXaYHCo=;
 b=dqkcpnLZkVzBLcU+/zmDP41pWJ9lKJLZ0FyMiKDWN/rbAZsHTzxr55WrHxHJUXhnHNbVZwTZOgppxwe812hsPtEbzf/6cL8JiIpQWOsKyzVij0rTD2zZr67ZRjY6TBZTwMhKKFiAZyjY0KD++wpVvyMA8XpwgfGI5O6kVUheIsOb1ShlpELUsU5Hv2piGAaYX68ThZfmzYh+5XeZHei+hv6hWk5/Rbd+5CNllMR3gnj3BQMdQL/0MVXvRTspV4rIaNT1olci3xDLHykd5tsqQUaFUbPa7RyQIvpe+lBubClEfdyqVUzcplzZkAnOCMY7PHB83CE/HBpmXTuFx2qsBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MN0h4db/wY5OVp9uE290/zx+FNKxz/12u3RtAXaYHCo=;
 b=gpL3vbRx3rKcGDwx+UQJy1gQGHlIaCuhHyLS3hC9fj17hmWSip4AnJwF9K2zCXMmxubz8mB+RErO6plVkpUX/O7Bxaj14+2tzS4kAGlqSMIAfaP0Xu97HhbTYmzySURcibfMF9VdVcAXgXSywYn6DS7AVSe+tZ6NWwHIt4ZoQGE=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3196.namprd12.prod.outlook.com (2603:10b6:5:187::27)
 by DM6PR12MB4073.namprd12.prod.outlook.com (2603:10b6:5:217::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Tue, 15 Sep
 2020 07:19:04 +0000
Received: from DM6PR12MB3196.namprd12.prod.outlook.com
 ([fe80::1457:9fc7:8208:a58d]) by DM6PR12MB3196.namprd12.prod.outlook.com
 ([fe80::1457:9fc7:8208:a58d%3]) with mapi id 15.20.3370.019; Tue, 15 Sep 2020
 07:19:04 +0000
From: Sudheesh Mavila <sudheesh.mavila@amd.com>
To: sudheesh.mavila@amd.com, evan.quan@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 nicholas.kazlauskas@amd.com, zhengbin13@huawei.com, yanaijie@huawei.com,
 tom.stdenis@amd.com, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: =?UTF-8?q?=5BPATCH=20v1=C2=A0=5D=20drm/amd/pm=3A=20Removed=20fixed=20clock=20in=20auto=20mode=20DPM?=
Date: Tue, 15 Sep 2020 12:48:20 +0530
Message-Id: <20200915071820.76620-1-sudheesh.mavila@amd.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: MAXPR0101CA0030.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:d::16) To DM6PR12MB3196.namprd12.prod.outlook.com
 (2603:10b6:5:187::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yocto-build.amd.com (165.204.156.251) by
 MAXPR0101CA0030.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11 via Frontend
 Transport; Tue, 15 Sep 2020 07:19:01 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [165.204.156.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 27bb21b2-fd68-4d6d-61f1-08d85947a0a1
X-MS-TrafficTypeDiagnostic: DM6PR12MB4073:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB407351E97BD845BDCBF0FAC7FC200@DM6PR12MB4073.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SVuIcD2bJA4MZgGRTzW+169QGMt6/R+KdVef7YMgG2nIoiZVZ/iwBbuWs1ZQIWSIPkE5S7b74EPWkWd62uDMaU8UsH9Pn+wHshaNCok501/5VsA7CVH5tYhdxAjVPf5f7JWRtM0kHkGsZ/1GET+i82/ZW28rkrn0VS9rgZKujNHUmjIXKo8zmevFLmZJrPmCvhWXqUbhSVQGzCHzKFCbDTj/BO4ssHtYr6MBlWTLCqFS3w9SJUb63IeRTZqx/aNDkuNHOz5Maa/2rin1q7j9ORJ4KbYZ6YRZuP8O2nS7xhukg5UNGDIG4FJS6l1M9ZfkihMTbfDNQS/xylQaEOxKETBYRcA0dz6AD3a3UNok6jA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3196.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(396003)(346002)(366004)(39860400002)(5660300002)(6486002)(186003)(44832011)(956004)(36756003)(2616005)(86362001)(2906002)(316002)(1076003)(66946007)(66556008)(66476007)(26005)(16526019)(83380400001)(478600001)(8936002)(6666004)(52116002)(7696005)(921003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: wQPb+jGoWxwQ42eP2RpZM9iKHsx4WET+tSgy7gK+j65852D/s1iWCsUU/vl92sFXFEB/fmYdU4gVvN73utRmCP5WHtUtU4mqmcqpXya27GSiP4LMQXrysNkPcXhy6blGcTBdBsQ7EWII2mb2mVgWO35xq4GyzmnBYpq+EkwH+dhPC19oh4zjaSkR1Ehlq4A5QEGXYW+p/eiZ0SPwH+t5rVAUwFlkovhEWsVbUmNNCqCN4vrAwAXuUVq9OhUE8ty8yrOUbbpgOvdxBqfDzeCr5r/InNXDKi6eUk4N/UVVxY2kzgmCAkeupKl5WuagPaMLk8EZdX/VSMlntywdFeuCr/TuYEu5jk/uBOJT/8KnV2KLr3FUHCm13ztibXasPBoiIjfqnuVwaxqtZsFogrHiSq3pseN5UpNqsb6l0WUM3qL97B2zsScVxle3GTX1f+qXdsMTU6NLiSatwaU2hAlYaxrJurRyQzhwx9oXsN3Zl9Mm40Ddazx4acedORxZHWsGYvDyc+aA6UOMxLacOM1hG2Qb4rDCMQwxgb5soCM6M6N0NBMxgKnQztG9YlXOnL/PTLL1BOrbMaXKUNqb4niwE5ZZMwzT9SJr82d8qNur7mWYN1l31Ki78OE19kqubdRqihCz1sh7X+SrWxlm7ioXRw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27bb21b2-fd68-4d6d-61f1-08d85947a0a1
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3196.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2020 07:19:04.7455 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GHfEpPzW7CkoY4uc8I/XdQt0RkaesKJHrd9YGuDkY7j0/Mbzd9otpRqv2Lq7fG7W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4073
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

    SMU10_UMD_PSTATE_PEAK_FCLK value should not be used to set the DPM.

    Change  suggested by Evan.Quan@amd.com

Signed-off-by: Sudheesh Mavila <sudheesh.mavila@amd.com>
---
 drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c b/drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c
index c9cfe90a2947..081cb9b1b7c8 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c
@@ -566,6 +566,8 @@ static int smu10_dpm_force_dpm_level(struct pp_hwmgr *hwmgr,
 	struct smu10_hwmgr *data = hwmgr->backend;
 	uint32_t min_sclk = hwmgr->display_config->min_core_set_clock;
 	uint32_t min_mclk = hwmgr->display_config->min_mem_set_clock/100;
+	uint32_t index_fclk = data->clock_vol_info.vdd_dep_on_fclk->count - 1;
+	uint32_t index_socclk = data->clock_vol_info.vdd_dep_on_socclk->count - 1;
 
 	if (hwmgr->smu_version < 0x1E3700) {
 		pr_info("smu firmware version too old, can not set dpm level\n");
@@ -679,13 +681,13 @@ static int smu10_dpm_force_dpm_level(struct pp_hwmgr *hwmgr,
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 						PPSMC_MSG_SetHardMinFclkByFreq,
 						hwmgr->display_config->num_display > 3 ?
-						SMU10_UMD_PSTATE_PEAK_FCLK :
+					data->clock_vol_info.vdd_dep_on_fclk->entries[0].clk :
 						min_mclk,
 						NULL);
 
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 						PPSMC_MSG_SetHardMinSocclkByFreq,
-						SMU10_UMD_PSTATE_MIN_SOCCLK,
+					data->clock_vol_info.vdd_dep_on_socclk->entries[0].clk,
 						NULL);
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 						PPSMC_MSG_SetHardMinVcn,
@@ -698,11 +700,11 @@ static int smu10_dpm_force_dpm_level(struct pp_hwmgr *hwmgr,
 						NULL);
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 						PPSMC_MSG_SetSoftMaxFclkByFreq,
-						SMU10_UMD_PSTATE_PEAK_FCLK,
+				data->clock_vol_info.vdd_dep_on_fclk->entries[index_fclk].clk,
 						NULL);
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 						PPSMC_MSG_SetSoftMaxSocclkByFreq,
-						SMU10_UMD_PSTATE_PEAK_SOCCLK,
+				data->clock_vol_info.vdd_dep_on_socclk->entries[index_socclk].clk,
 						NULL);
 		smum_send_msg_to_smc_with_parameter(hwmgr,
 						PPSMC_MSG_SetSoftMaxVcn,
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
