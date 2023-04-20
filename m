Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5FC6E9B80
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 20:21:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A07BD10E104;
	Thu, 20 Apr 2023 18:21:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44C3110E0C6;
 Thu, 20 Apr 2023 18:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682014879; x=1713550879;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ICFwj3LSsnneqRC8pBvtL0nGndzJnsGniMtGw1uWFDc=;
 b=UNOOti/UQuvNIMcG5LpazZeV0fIZh7MHtXD+Zh7fJkadwY3bkKQPN/pT
 SbVXDkhVlDlv8aP0VbfKukMP+Sn3X9a6bCfzRP1zOEvW+MH/9FQ8qHggS
 f5E6K1rjlQqVRqA3K6ET95ONm1vPGf22kPeOzXMK+jR996fiOd8A5QrRR
 doBJr8gTXDkByc0jsPiuu+BnH/3/xyxbql5/0YHccp5JkPbI5yR2LzGKs
 IUoEuFwD2HETELZoOyqocd6TLmz3K/2DQoBlUMTRlCXQyR1KSwdNnHVER
 z0rwOsKe8yZUCb3I/QM1m35r7RAIOoVm/0ecQVQp7cwWJDVlbCseWtic9 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="330014337"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; d="scan'208";a="330014337"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 11:21:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="816132848"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; d="scan'208";a="816132848"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP; 20 Apr 2023 11:21:18 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 20 Apr 2023 11:21:18 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 20 Apr 2023 11:21:18 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 20 Apr 2023 11:21:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N8/X1NAze3XZgotqUb2XmR031ngPe8vA8w02tAgtF8ZimmKsQUcUV8kaxlzMD1tJCqDwWGSjP9xtxFzaVKciCUcgGeWy/mS308CJ047FyECS40ho50WpqIR2bhI0aV/Q47FUPQFMatvlgPAlZYyCkaZOAz/saepiX/NnoS0Vdb6V/65raUeQ3u/fnsvyEFp5kDMS3Z+yHpvixFkDtOOG3Zfmxq9A9pNoYxTGG/9Rw4L3GhSeFRj7q1ScZD2ic2W+v7DPStjvYR8dgHJO8iiBNCi32Hbe9j6iJplazX+vZ5i6t7zt619sj5J70bAg3+0kRLMdOAol/orKEAqG020BXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OReqnnuDOxM/MPo2msDlv9YaNzhSmj+JzVI+Dr2b9y0=;
 b=Vd7EtMt4sfyYJPJBWyay351jTr/65zhmWoh/vryxf1PcIYDqYC6ZCZ7jrIUVJlRPW9aO9RZWd4wdnha0NIT76lQwaBj6vyccQnyxy76lzbkeJ1KzjixWK14NUXstYkThFRMwfTdJ3sP3gVsyRxiDwkLdxF+KlS4k0LPZk3iHpWAFgMnEj0JLREOhGF6hCkzR5i4pxB4Jxgkqp6P7lNjEjP04DX51oPHw4RaU+x4Tpa/38lLWF2AXMoEjY000LJ6IQsRlgtkU6PVoy1UygkhR1hrUZKq6+WKponE6wlxu7v8CsGXzyuWkZBueyoZBR0PYdIB4tUb8jP6b7nYHGw0zHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5389.namprd11.prod.outlook.com (2603:10b6:5:394::17)
 by DM4PR11MB7184.namprd11.prod.outlook.com (2603:10b6:8:110::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Thu, 20 Apr
 2023 18:21:17 +0000
Received: from DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::31f7:5096:35b0:b458]) by DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::31f7:5096:35b0:b458%2]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 18:21:17 +0000
From: Francois Dugast <francois.dugast@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH v4 2/3] drm_exec: fix double dma_resv unlock
Date: Thu, 20 Apr 2023 20:21:01 +0200
Message-ID: <20230420182102.3302646-3-francois.dugast@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230420182102.3302646-1-francois.dugast@intel.com>
References: <20230420182102.3302646-1-francois.dugast@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0348.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::11) To DM4PR11MB5389.namprd11.prod.outlook.com
 (2603:10b6:5:394::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5389:EE_|DM4PR11MB7184:EE_
X-MS-Office365-Filtering-Correlation-Id: 296cbce8-c6db-409a-a8d7-08db41cc0831
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7KEPXV6NY46+75XCDUw/tYwB/JaSfMFcCWVbrc10zePWk9UhgGSAvjh2ElQkM31Q5bmDpus27eoGJvdHoMyMAW7TP8EzWqxkqX48TawtjoZm/vLnPUPn+ucQdaB6V/TA5mwvGaljBrEHZlBGn95r+avmM2O4XHTGzZGOVeALsl8NsLYKAbXzsT1Dl+C+R+DOLK9BPtRQa+Nwvy8eKQe7DnQrYP8vhYcvC3lFWjCojDirrC6PfcmooSHnhgfTSRCWP+qSVPBW4+gv/7/obzeFwr4cNOpxyuBaKsUqFq7vEhqE+IgNxl3qh0LXMZ6ZkPliqTyHKd/TPv2t7qt1zslh2eW2TBkumHAvAu50PCd7/ADpMElaCQkCHm8JnEGhjqLWDQJ/dr1zGtW2ZEys2nYs2UHYu3ZRJziLSmf3rQe4UloADd84HQw6T0XvqXjr2HTBBH4YV+jbmQIT6PVFMU5u7bKbhZnLQpRWT/QQdorGrqvMaVWtzytyr9cQ49rjdl3gj/9tJyOJVaIIBliuxrmcJlUR4LqSVbFlvqXXwP/q/+PUiDXhk8bf3HsVkrcqh4V0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5389.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(376002)(396003)(366004)(346002)(136003)(451199021)(38100700002)(41300700001)(5660300002)(44832011)(8676002)(2906002)(8936002)(4744005)(36756003)(86362001)(6486002)(6666004)(6512007)(1076003)(26005)(6506007)(107886003)(478600001)(2616005)(83380400001)(186003)(66556008)(66476007)(66946007)(316002)(6916009)(4326008)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PxtZHxILVtLE95U827XzEoXQdWB7PNKl8XVMJCRKw+MBIUfrs+auyFYDvrXI?=
 =?us-ascii?Q?gyjpj0ZPoHH2agGRWDMPV03Khe6H50VNI08OA2Kg+baoqVH9nOegUGnk+usa?=
 =?us-ascii?Q?1o/Q09tZuV8ERklEzD2nJc42zw068FLLaXABujlS7Yu6yxUmwJVYy7xOWJQK?=
 =?us-ascii?Q?hcTUK/mkdeWIgqMECE9//9oE2+qk0GbYa7Il6Dw+tzi2igMqODocjwAmzHNC?=
 =?us-ascii?Q?kIeUzOlLKgY0m2mE0jzEzNhFN8C3IoB+RlfUv5q7TjGTj0flRx7wk8nC4Vei?=
 =?us-ascii?Q?StsxcTST0CRHPUgG7SmY5e4DnpwNBdvrYG9HhtWR5i+aYYwP5QEIZLTRuTUP?=
 =?us-ascii?Q?V8zTTOb+CV44tKPY1nx9GpFUOOxBSeoO4FA5/Yeae++LMw7ZemsnoA/GPKvG?=
 =?us-ascii?Q?k3FGSjOi0xo/0cTRbpAAlOeeapgxwHZFu53+/ZjbMPo/bGT/iuC97RIFCSBP?=
 =?us-ascii?Q?sFYNf/dRUQTIYcBcRSlsVYI05tthl2CcGMzLjT7Mhhg07rpdbVcrZxW+J+0K?=
 =?us-ascii?Q?F8auoQElQA8gxNfGAgQUmYiJB8aq+XDShYx3IE0F2f9VBKs6yNZMf1Q+Q846?=
 =?us-ascii?Q?7zcB0dO2bHHIuIG4Fo/YMxDCd6MF+fE4IrjzlOAut2jkWtWV53He7Uh0GZrJ?=
 =?us-ascii?Q?kX2ispUbO6rHooDvw3TkYDCHKXPZKfbe8UMXMxLmWn+1gFI0l6mFlD405TXt?=
 =?us-ascii?Q?Km/PC2f9EHycjY5a2iJv5PXr9XDvwzZUwthcyPc0awnePusD0KkBK7IXEfxj?=
 =?us-ascii?Q?7jFgSp+0Ay6IAVV2mBJc1ViPGEEXxkU6Kb4cHsukogiZu0HE5dPdlNEB24Fc?=
 =?us-ascii?Q?2cv8mmSCRc0s8WEPSOaQmRo00NJna3pU/w9tMKrsJVoncxt05g3PtblGDavf?=
 =?us-ascii?Q?XPkliwX/VQ1YH/u9kE5zIkNZkBv5GYGiklTVQ6U6IPl0RgC5/dkmThRq8fo5?=
 =?us-ascii?Q?4ajsSQsMYkBGdpEpc5AfbpHBngf/zPkw0UrSBwaDTjqixEqXlJvTWEi/2hVY?=
 =?us-ascii?Q?heRcdtHjCyd51QTiiljhZnMvqezGzcUMuAr/yg+EwTmfW54h3o+v4RZmCLY1?=
 =?us-ascii?Q?S7VRQdVvrajr2epfqPZbPbOkyAU6ThZoSUXU44QWfYZgk4IyWHP7IFHBOsgm?=
 =?us-ascii?Q?lIHWSYGHkC60O7GLXeTKSDZF6Y2tcA+pwXpDkduqgRfk0k0zsOegzrsnszs+?=
 =?us-ascii?Q?MtrAGfLEQ8RGD4q7m6r/vjJH/rx1dgVAjAtyZe1MNOCCjItEf5/fMpZHpfj8?=
 =?us-ascii?Q?kzPT5j+a2TVlpEsHjYZO+dKFNDDo0VVE18SB0PyEPDXH1La+W7uLLi/6tUgo?=
 =?us-ascii?Q?tg/hy52KYOJ1wnjc5sN+UV6+tPG7RNQ8OoDRiZW/7BBHTVBw/SNOXMmGc2lJ?=
 =?us-ascii?Q?iiLZv09WbL+pgL/JlWbX7R3bC7xcIZoCknNvGbCmFK0ogA89O9DY1qa2RiPo?=
 =?us-ascii?Q?OzmOLyLGTvReV+xliG2uiBS4/4g29JaTCYGoBjcy13WCeOrsf9EW50587zbc?=
 =?us-ascii?Q?XL8kHHge3swr5VnuVYup0tgZm8/nyYYm968B4003ZLTLPkbGlN0gGcxodLi+?=
 =?us-ascii?Q?Bd1zncopcUz/q7kKC7YCmnnjmSId1tZkn5No1Wf17gFTQXgaXKnhKu5wsrOS?=
 =?us-ascii?Q?hQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 296cbce8-c6db-409a-a8d7-08db41cc0831
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5389.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 18:21:17.2333 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Counren5WUdD1WmoLFwjdaUbqaF/pxR6GVr81aTlITkIDohmjwmMaPMuKrlqyPP8QDnf08O1EIZYjQOG+nvf1v0On70HnHN5e/Js3dkQu6Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7184
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
Cc: matthew.brost@intel.com, lucas.demarchi@intel.com, dakr@redhat.com,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Danilo Krummrich <dakr@redhat.com>

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/drm_exec.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
index df546cc5a227..f645d22a0863 100644
--- a/drivers/gpu/drm/drm_exec.c
+++ b/drivers/gpu/drm/drm_exec.c
@@ -62,7 +62,6 @@ static void drm_exec_unlock_all(struct drm_exec *exec)
 	}
 
 	if (exec->prelocked) {
-		dma_resv_unlock(exec->prelocked->resv);
 		drm_gem_object_put(exec->prelocked);
 		exec->prelocked = NULL;
 	}
-- 
2.25.1

