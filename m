Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DD16EFC06
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 22:57:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF25910E33B;
	Wed, 26 Apr 2023 20:57:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BF6110E571;
 Wed, 26 Apr 2023 20:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682542654; x=1714078654;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=FuE1CQRzl7ekRzQhJ29y2W1GcwGdyL/Si0JfGIgZ/K4=;
 b=gZnQQg3GvtprKzN5fzsge2Oq+QG56lSFEhLbnNnU2WedZpLWHau5KUcF
 1Fo/1BbiHqxAeVoLf3rQoAgPO2+zp8Hij9wpiKa6QEDyqWx8UiO9pqFS/
 ZNyTIa6Uz94/EHqJuhXd8L9ZrZIHe4NPtQE3Yfj675fglvm8GVYUHfSmL
 dXRwr4CnKJ/j2qGe2dwi1co8L5VaFWvFdQe8oE4QkuFzsE2Qvu4zhTl58
 JB4z8UQi7XUCnZwNHNmGcEsVfj33IFHNLNMubH5sa8oDklyhywOBM9fMN
 pvYLrG3dyhsawSr4R4QcHbjbBMl8HEO74oOl8J58JTUr0XdNXpm30c4/U Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="375203521"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; d="scan'208";a="375203521"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 13:57:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="688105005"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; d="scan'208";a="688105005"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP; 26 Apr 2023 13:57:32 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 13:57:31 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 26 Apr 2023 13:57:31 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 26 Apr 2023 13:57:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jLPZ6gLInC+jDiZygq85blaSvmkR4tFSoVDwzixNsemDkPhY/4fg9I7nQLaWV03YLSXXe7c3WZYTv8pudfLQrVOKzqScBn/4EFc1gfi+VCW6SDZpCJp1N+23Dnd1fQLDsiZyZYvJQRxTAbAClaGoiNYRVNiWtlQOeC8QqLJUBGNvboUIcsbVk7xluH5ToPLNWbXc13iNvNTBtny6bxENcYbl8v9aw0cUfq8MIS0UWK61xcw4AbmrOmg15Z6hE5sNry3l43/O85JUzd7S/fJ1G+70KMW0bK/ZSnrD6xkHu8H2k8Y+4ieMzmSbByUGnkgj2TLtIRM/9YPfWwx5Tbv7lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dlWCYEAUPAi/XhGddmgjvW8ZMwpz7GwYGArdZqMF1j8=;
 b=KwO+QbsR81n7q1XOqMBRRl3MyhIYPvLcc0KyWVSPaqH80VzVRJDVGCGzY0cLbFRLJYuLx1z82JMrSZeLAWa8XFv39wVNu9VGmFEwfHbLkG8/nmmd3W7vgtrfjrmDNqVdalBSI0ldnx4Xk0cpuT7n/qskxnRo6dei/xaGoOmjlJBkRKgJHn0grjc5zjBrHHsVo0+mM6UynrynExWGz83GQUekQnBQmvz3SEoCkBxnODos+jncGYQeHmYxFw+kCTwss8kKEN1J67++UCP+BmC+cPJ/4KsDqsIcvSAb/nDAT0Nu6LnENKW9PQHeos1JVv7rggT2hk7zi+/tWe4nkAzdVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MN0PR11MB6182.namprd11.prod.outlook.com (2603:10b6:208:3c6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Wed, 26 Apr
 2023 20:57:30 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6319.033; Wed, 26 Apr 2023
 20:57:30 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH 03/14] drm/xe: Do not take any action if our device was
 removed.
Date: Wed, 26 Apr 2023 16:57:02 -0400
Message-ID: <20230426205713.512695-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230426205713.512695-1-rodrigo.vivi@intel.com>
References: <20230426205713.512695-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0161.namprd03.prod.outlook.com
 (2603:10b6:a03:338::16) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MN0PR11MB6182:EE_
X-MS-Office365-Filtering-Correlation-Id: f5d1c93c-bfce-4c3f-812b-08db4698d96c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t98aBWJzr+/oujpJN2nhhDfLwv9Mm2If78zPy8dZ1UFHqHb4EYDR9Tnl3z+aS9w0ueW3PxgcKIeDrqsgaMSeg4DEZhe801pJdHlg7QWyh5zMpWXrDTrpyBLfLt4rXxVU1JzwwYf9AvpFUP5ekTvLYA1033RkcuSYBe/P+f2ubHW8pnAy1FKVFJBCEMgrpWfEtvyLdmKissG2Y41DgiNswz/nz67JTEuYJ3BBGemEf3H3NeLCl9a1VGClyuNhppKav1CDt6Vu+0rH0pQXyPiouoYecZBp99Gnmu7YIZTdX8T5dG4CgDIVXVwC2IbaJ/8UORKeb2AdO5dWTFSagd6xqeSUHVNxbTrDszNVRBOF15I5MlluHt6KMmDZHBp8GP1mxFeusmzTZ/X2RZuvYW/SMs0Xwm6E01rWG8bDtoFTct9O6WI1PkxpgOy+ifFtkANF9ctPmjYyeqwSFLhvN0xxZfBV+Va2w84BhH5jbNbGt62ul3KPFb6t6gdjINShEZZmhYU+aQPvmCpxQ+QlYfD3R0miBNbSWqeRTNSERboDwzJE5c9jzt65BQWjNca1ZpeM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(39860400002)(366004)(136003)(376002)(396003)(451199021)(2616005)(83380400001)(186003)(1076003)(26005)(6506007)(6512007)(316002)(6916009)(66476007)(86362001)(4326008)(450100002)(38100700002)(82960400001)(66556008)(66946007)(2906002)(44832011)(41300700001)(107886003)(478600001)(5660300002)(36756003)(8676002)(6486002)(6666004)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L9GY9+OpYZH0ilp+WieW0b/ZnOBH90a2Fk0w6/dCYQU0/K81uB+7p4wXcewV?=
 =?us-ascii?Q?B5Usbv+BY2bLID0hyTr7IX+WwmCt7JgLAYZ6h9r9IfXeNxBlRLtpfmoNQ1BR?=
 =?us-ascii?Q?Ax3LGl1eBwPwL06PP5A1BLDleM7ElFamiwEaHq4bx2ydmYas5HtzVCxT6ByY?=
 =?us-ascii?Q?/xcpm1jgEkdbDb/Zj/PKw4vC0DrvFZ8HJelrLYfU2thII+2L1LlsIKlJti7r?=
 =?us-ascii?Q?VYJcb3oe9JnLX7nkkhTbyPT6JVsjcUPT6CoI9Ao+sRHEPHh+qysaGSDMBCfu?=
 =?us-ascii?Q?avVdXr3oHBnEwE38LgcPahgLOEoknslW1GFGPgs8eHmf4AZgShmmwj5nDY7I?=
 =?us-ascii?Q?N7Iq7FwsYFaELTfp7tvFMXoe+Xfte7OrZceUTd38iI/0pXZeSQxbBJyceksC?=
 =?us-ascii?Q?IsYrpfPcWp7v/hXVmncPaxRwG8RtRBh5F10NRfmTXMj4vrfUByMe9CYs1NMQ?=
 =?us-ascii?Q?hFM5rtrq5R7I9uMwZ9VtEKy4EImqXLJbCMMsQojsxSTo3Dv9p0P9CQCEhl0o?=
 =?us-ascii?Q?G//fbUD76ql9AO9fgpihtcNCJS40Cm+9oPqK0N+AZIezcwLaftRJTCgqJho1?=
 =?us-ascii?Q?jG5B2FFcN+zdCIqg0y2WmnuO5mZyS5sZUSXM1yD63DKidPTv3vJkQ1JvGCTQ?=
 =?us-ascii?Q?c+FkubvuALtBd2uD/033M42qX8SniQ997eYMbkkGeSWJTKnc7hAPU0VSoC9t?=
 =?us-ascii?Q?Myz68uOoryJLC3oLjM5iLbCQV52Ef9TzGCuKzVl/aM2HhRW43Uyrp+wnrDI2?=
 =?us-ascii?Q?fOLcIqaWLLaCIHlw64Ent9b4bJcJH+cTja9+Ylb8V8Gkk0NzY9EPPGkMx/Tp?=
 =?us-ascii?Q?3RA5tDYQ3wfwdE5qHEfU+ifz0RQBndhwRkYm/LtkK3iZ8GjmRO6F18fKuWHt?=
 =?us-ascii?Q?ABRPfemi7g4Im+Ry8e5eu3Gx2LFSj0ua+8pzgKFKzou94jlPYq9tWfxhMB9F?=
 =?us-ascii?Q?zKLtVabosrHC88MXEj8/XksMhpIoGihqFoZwQJFQtaiSQ+FkS0Vb8hXwLOYQ?=
 =?us-ascii?Q?8et7pPDHrC7m2QJWLpDLhZihyynWNB0YPcBHVYKy4EAFhkJIULL/JZDO+5t7?=
 =?us-ascii?Q?p47qJW6/cpsLVrRuHCZRnYN4rhU1yBtNKS5BTjSbuuhI6EvsxhwVh2VuF0Wx?=
 =?us-ascii?Q?hLO/F1QgsYl8G1wAGczZWXCF+hRaeXXtMtqu2HJ3qmRHv39moiVZGAs0xYnS?=
 =?us-ascii?Q?M82017Ir2q9bwU+InOluFLh4PjSquvKhXO3BK6kANLbPe5eQ0214F4p+tfSh?=
 =?us-ascii?Q?UWZFD0i9rDdxk3SvfM1m6xg51OhsHPDII8Q7A9keUyEuBr1IDJm+SxCIWCpq?=
 =?us-ascii?Q?TSVMkqr+J7sjKMtxZgONTa58URED0B4RXFSOqWfY16UwCNOAOkdTxFOYJrdv?=
 =?us-ascii?Q?mP+KX3Drwb7Pu/BsyceQ+gUPtBljFIzAmDPL8J6NoylCiYcu5cZraDbJSMYa?=
 =?us-ascii?Q?fqFENccqUIvbBcN9UigilmHghsUayTaxJWaei2m7cO1M1VryfJDUJEnWeAn/?=
 =?us-ascii?Q?etrAltroY85eg9aziwPMJVqQ94dwu1fLhF2n3N5fvacTWez8ySsQdDXpvMHF?=
 =?us-ascii?Q?hGwfUrfOpTiYaUUETNNwpZQ4OYbS7ujx1iknz2xYJNEQr+dKQodxnwvjD4FX?=
 =?us-ascii?Q?4Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f5d1c93c-bfce-4c3f-812b-08db4698d96c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 20:57:30.3054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t4+4+0jMy96fxzgT6Cpxr0/eth5uV8COpqDq80njM5H7clyU5uztEuVE64iQKodKl9yJzIAb2aQVqB2k5zPaPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6182
X-OriginatorOrg: intel.com
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
Cc: dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Unfortunately devcoredump infrastructure does not provide and
interface for us to force the device removal upon the pci_remove
time of our device.

The devcoredump is linked at the device level, so when in use
it will prevent the module removal, but it doesn't prevent the
call of the pci_remove callback. This callback cannot fail
anyway and we end up clearing and freeing the entire pci device.

Hence, after we removed the pci device, we shouldn't allow any
read or free operations to avoid segmentation fault.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index d9531183f03a..a08929c01b75 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -42,6 +42,11 @@
  * hang capture.
  */
 
+static struct xe_device *coredump_to_xe(const struct xe_devcoredump *coredump)
+{
+	return container_of(coredump, struct xe_device, devcoredump);
+}
+
 static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 				   size_t count, void *data, size_t datalen)
 {
@@ -51,6 +56,10 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 	struct drm_print_iterator iter;
 	struct timespec64 ts;
 
+	/* Our device is gone already... */
+	if (!data || !coredump_to_xe(coredump))
+		return -ENODEV;
+
 	iter.data = buffer;
 	iter.offset = 0;
 	iter.start = offset;
@@ -80,12 +89,16 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 static void xe_devcoredump_free(void *data)
 {
 	struct xe_devcoredump *coredump = data;
-	struct xe_device *xe = container_of(coredump, struct xe_device,
-					    devcoredump);
+
+	/* Our device is gone. Nothing to do... */
+	if (!data || !coredump_to_xe(coredump))
+		return;
+
 	mutex_lock(&coredump->lock);
 
 	coredump->faulty_engine = NULL;
-	drm_info(&xe->drm, "Xe device coredump has been deleted.\n");
+	drm_info(&coredump_to_xe(coredump)->drm,
+		 "Xe device coredump has been deleted.\n");
 
 	mutex_unlock(&coredump->lock);
 }
-- 
2.39.2

