Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E0B32B64D
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 10:47:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3462289E11;
	Wed,  3 Mar 2021 09:47:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2068.outbound.protection.outlook.com [40.107.93.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3BB589E11
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 09:47:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=if++5pUzBNp/CDVjeffkJn2KCEgDmPQgGV77vQI9+AhYbF1gP/kOTwCTSRsg7zI2Rh34nybO5HiSsyiPzteRMZmUylMf0dW5f82QZevvHIQVHmpP0NkOuyN32UoIzzbjftn0p/KqcNO9s3J5WsuPRfZ0tECGScJapcAo1SKamwueXeyDxmweSHay5U6+5G1Hk5QArmEh0Hh9Ns3tWa7PmyhFMv4hIt/tjysBjBntAmk0oc26s8HSwldbVCuN0WilI66yhMejc6sbuWXOvas/chh4gTU7mWUnlYAC8F5uwN1nASoQ7wE7MCL52tJDFGySplC25gA4RvNlWnosHBnPxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bkx5/fMF+LMoohs55T7Q0ECIM3r2BeFlAa2lRiaoTRU=;
 b=ZoMKs8KccG+i6c92f31BXD7QSI+RgjkQK90BS6Pl1IrqPpQPKpdIvDtQk3e4h8KTSqX45GIMfNcLMD70WM6HezTd/UaCCRXH+HQ38y5+buiqyfxVRc0oqZKjeHvMbVoY8rbASFUeMrfThF1vOBgcnJeD6Hduhpo51YIYE4wPoS3CRv8nUiufU11l4NzRfDjwDzc+uHCgJKPXDAnDABF76R3ck5+ygnX0hgS7ffPqe6DURumXB/uInYdNTZcpfK+tYatFcJs/zX/TNnxSi88r3NTXFGIvga7FReTId+DRNx01/vdd+NdGOV7x5+jMzz2xytOb9/IUY3wAvm7yZat58A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bkx5/fMF+LMoohs55T7Q0ECIM3r2BeFlAa2lRiaoTRU=;
 b=DDRQoZ1TiGeHtTioZG81ds/YhKuqu7R3I2+aNmK0e3mNv1WOnYM2Hbq888WJwwKEuFuYIgju+viY48MLijAcH8FKsJTTasHeuLlLeb4zaw1YhHbHGlbRo0oTDYo8qNtuhhtIXp6pIJcLGfuZ6py/saXHFfn6Q+QCr7i9NNS7JLY=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from CY4PR12MB1463.namprd12.prod.outlook.com (2603:10b6:910:e::19)
 by CY4PR12MB1239.namprd12.prod.outlook.com (2603:10b6:903:3d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Wed, 3 Mar
 2021 09:47:50 +0000
Received: from CY4PR12MB1463.namprd12.prod.outlook.com
 ([fe80::6504:7fc4:d02f:77f2]) by CY4PR12MB1463.namprd12.prod.outlook.com
 ([fe80::6504:7fc4:d02f:77f2%3]) with mapi id 15.20.3890.030; Wed, 3 Mar 2021
 09:47:49 +0000
From: Nirmoy Das <nirmoy.das@amd.com>
To: Christian.Koenig@amd.com
Subject: [PATCH 1/1] drm/scheduler: fix typos
Date: Wed,  3 Mar 2021 10:47:37 +0100
Message-Id: <20210303094737.119725-1-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.30.1
X-Originating-IP: [93.229.59.224]
X-ClientProxiedBy: AM4PR05CA0018.eurprd05.prod.outlook.com (2603:10a6:205::31)
 To CY4PR12MB1463.namprd12.prod.outlook.com
 (2603:10b6:910:e::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from brihaspati.fritz.box (93.229.59.224) by
 AM4PR05CA0018.eurprd05.prod.outlook.com (2603:10a6:205::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Wed, 3 Mar 2021 09:47:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b2d54c13-0f93-4081-0529-08d8de2967c5
X-MS-TrafficTypeDiagnostic: CY4PR12MB1239:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR12MB12396A02C8A7D1287CB6766F8B989@CY4PR12MB1239.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NySCG9gIw7Pu+BN204EWfrs6qQY7/javk0dJduKkExeVcyiD2qm9TTy4KeMN9sLunlcfN//W+yEcy4RPoA8IQ5ysqj7vQ1qVJqOftiUXhKhacbjpldUVCqgFyFGh+KFxwYcg63k5bF0dc3V0SGECioeGVipIiVMvFlA8KVoitxZY7uNkQvxAHS9+leTrm7p8sG2CBv8VcW0W1OaAMIc7o9ugPGbVvIXPG+0T9RqUpTPH5f4oP6q8g8ewZy4jjw9CFRqlymxFxlTHKSRqXjCrzRmn7eSRKqPJPqF41EsRPoG4EF9pKcBwYqXvcjeKGHR/mFdgvgqVBTImc7Lr1t/RakuIulqsjTeUrVI8Q3G9asXtnaMzhDX8oVip7jhxgZTN7OLq8y/RWLEbC6SFWiRtXu/yHWewKGfS55rNzmknBoAze+hEAqMMtZ9C03+lgUm30j2jGr3hNoN5impo73y/o2ZUHWmN04cWjRT2fnZe6iVKxw6deh8IJpTcZY1pCWkeFGzMur4QrB5IqdvYfAJfdA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR12MB1463.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39850400004)(346002)(376002)(366004)(8676002)(86362001)(2906002)(6666004)(66476007)(186003)(956004)(6512007)(2616005)(66556008)(16526019)(44832011)(66946007)(1076003)(8936002)(6506007)(26005)(52116002)(36756003)(478600001)(37006003)(6636002)(34206002)(83380400001)(316002)(4326008)(6486002)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?R2F3R4p1cClIUmL85CYfls6h7by+KNmxU403TT5ymBvGvyshLOdggOvYa13L?=
 =?us-ascii?Q?QkQI7U5rQb1Ubs/VIwSDufi7FTpmwmpvGh5Msmtl3mwonPR+VLFHGwPrMtnp?=
 =?us-ascii?Q?0jvHaT66l7b47EF9WwI4XA8i9ka71bado1t6UaQV5M2z6femtwq/NGQsZdvw?=
 =?us-ascii?Q?KTJcALtQkqZ00PuY2olIUlTZofTqq3itPfaXw0mZq61c77kCG4lGnKr1kz8a?=
 =?us-ascii?Q?iwBmn3QkMgHQW7kGrU59TGj8ZLbI5UV9A8QxfrxP/5oxXCh8Tx0Aj4F5/eWk?=
 =?us-ascii?Q?Ove/kwdcN19Vq1kWJxiwFA9p2x2KXeQS6lgR5oT23J5KARrkJ4NFszke/UGf?=
 =?us-ascii?Q?bg0GuGVFkS6PR5jVPe+D88kr0doiG6ErrdyP8qcv5SWVYfLadgFO6GCc/p+a?=
 =?us-ascii?Q?QLbar57P3ArAjSoHD0XLsnMfpfEiBNioUyrhmgVtxM6Ht/YwV7t6hFH4OvrL?=
 =?us-ascii?Q?31Xb3K0ChV6EyFzzh49itnCdrH4YbhYSCd0A5k2CI3Qv0O8/yEtq9VsS5Hwh?=
 =?us-ascii?Q?n8M/T9Z0GY2s0lvUndggWdOedEheE+URlW2KGFAyc0Ztuv8vXSN5PwFfCI2+?=
 =?us-ascii?Q?DK/HcljCpl/kQp2d1g6OeBcAaO82UbfST/4uiYX/EGfu5PoL9h+etYqa3hGY?=
 =?us-ascii?Q?uYz5w687yVg6HCIYYIgatVA8WA0slJxO0Fu52DrNL6Umw9qtq18evKierVoM?=
 =?us-ascii?Q?1IFqBXonpDEVkbVDhZfS+T4MRTlov8eb5qV5s7G0iDeldTZo7dPqD0WriloB?=
 =?us-ascii?Q?OHrOxnz7VrYIHqlWmljRW9f2rO3Gti+Lp7DjCvHORyA/8KfrklIxLEzS2LNn?=
 =?us-ascii?Q?r4ElocwTkCEnVlCvijm1VtOBmEANSoomgyIg7tX6pyr6DzasDEm8wam9uTpU?=
 =?us-ascii?Q?l3rv4i9AFB8RMUUnVYKq6Mfv7Gczm+tym6icVvigQXbbWDTACiTY4AMYamle?=
 =?us-ascii?Q?RE/OJ3SVWNiX8GWadVcffQVhuMglz6d4aWmhYD3AGi3PAF8jjRixL0WDD5GP?=
 =?us-ascii?Q?EXY/e7nuAfT+T//wQP0fpqu6DlNFjWIgqeW73ye/TBES9v61NyKe/DuwCcK+?=
 =?us-ascii?Q?CblwR/pmb3hg8LLDRm+3ZNmAZxHWwW+oUqECg+prX5hiaZgxDhMzhrV8ZITR?=
 =?us-ascii?Q?NQ1S8hqInEJqSjLZAR638DPdkNrHhse6OqQjPRCNXXEsXsbC23B6Us3TGw0s?=
 =?us-ascii?Q?4xKBFjXiIwZ6riRA2t2mtwj9EI9zgMhZLdrd/PBME/tH6F4QUxmCutzxZMri?=
 =?us-ascii?Q?eK65xrLmtR1Iw5wYAdLK64V4qawzUhaG6kKULHHsvF+C1wGgWpG8I7Hick3o?=
 =?us-ascii?Q?a1rNYGE2jybYV38fQwfal7tE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2d54c13-0f93-4081-0529-08d8de2967c5
X-MS-Exchange-CrossTenant-AuthSource: CY4PR12MB1463.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2021 09:47:49.6332 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TxEQLaJFTZU68BpDTGyYHecN8rAjifNgJltr8DLjRbdEnLrhsCC2hSg4unk7hJ0/SyRdUfhLRaVF7ec8Dz9HOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1239
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
Cc: Nirmoy Das <nirmoy.das@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix two typos in struct drm_sched_entity doc

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 include/drm/gpu_scheduler.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 1c815e0a14ed..3782a49568b0 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -74,8 +74,8 @@ enum drm_sched_priority {
  * @fini_status: contains the exit status in case the process was signalled.
  * @last_scheduled: points to the finished fence of the last scheduled job.
  * @last_user: last group leader pushing a job into the entity.
- * @stopped: Marks the enity as removed from rq and destined for termination.
- * @entity_idle: Signals when enityt is not in use
+ * @stopped: Marks the entity as removed from rq and destined for termination.
+ * @entity_idle: Signals when entity is not in use
  *
  * Entities will emit jobs in order to their corresponding hardware
  * ring, and the scheduler will alternate between entities based on
-- 
2.30.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
