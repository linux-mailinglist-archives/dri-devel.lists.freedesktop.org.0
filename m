Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6D47812AD
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 20:16:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D410610E558;
	Fri, 18 Aug 2023 18:16:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1153710E55B
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 18:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692382592; x=1723918592;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=DTNR/AbAHfBKqPODinHAdqrv3j/DDjp37DYuTZ4am7I=;
 b=AlT27pUhnjK9zQayRmuVoyCzLAHDGtxKaXuFEPcWhFjHZHRB+/2iZfq3
 08Efy9pdvKte/sw16a3z5nir7fbERBvRUD7S7e02us919EkQt4LW5QVIv
 V0RidbjdPSWXM8Rtbibzu62XMUg5+wTPa+GnMJ6yhfjyq5oZVHQ8eXiDn
 YkRyd6M4As0VMz12E53Z0ZjxSQUktXc4/wKyGzz3h/yw4i2+S4cPGXWHS
 u30HpwLqIgnnC0+cZB2b97uPOcuWYO6M/QcLpK4nNuhQNl5ykVP/18Uei
 7VmVHAOuQ+P5WQT9tH+zt1Ht7hr/BZtaD+i2oRLKvhd/9mIdJpuXDMZzO g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="358139566"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="358139566"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 11:16:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="770210329"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="770210329"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP; 18 Aug 2023 11:16:30 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 18 Aug 2023 11:16:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 18 Aug 2023 11:16:30 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 18 Aug 2023 11:16:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HTqbP4znjsy/zrg8eS+ftPJpHsZy039TkLGSeUTfeuBLKhOOKlwKWAEDJH/Np8C2g6deR8D8mzVeSfzwCYGU8BVJcb7XnQy6+zx5twLnQpLv1lfAaol1pgkHc5EXeHO7iPdpD/N0qudQ8KuJDuTyje35BUqLjRfq68P3aV6aR4tj8m2hD4bRFTHiN5d3BaN+15m8TUiclKVv8ANr41S1Bg89CZDm+S5hnR2y/c2rKkMYmUbyxOYXiHfGXEuo0LjkUSupaE9GGJQsiFexqNSlncH2vSu3jqkkRpIm+vT0Lvr+T/6lNbLu5gw4tEoXJvA2rESeeC5HpXI98GDt1FcqMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f4YLpIKNDNk/zuVv+tn+D4T+oruZE+JUrtWiy9w7FcA=;
 b=XDiQ3YoeYLCHZTvpzs3It3EGBo2AU+RAHBOjRtIKQTATvZjV25P4koJwHUWYBIeRcOFXUuAUZqfGifX2hUcjzyN3Uxlklnb2ZqpfI7/TB/oVT+XTL5nDBtZaiogx9qzXnqzDuTFinRgNvAPvFvx6T0GHGAWgGJrQa4z/u0g8fsphC0XVLQ7Xo1hr56+4WdlfWnki58lDap11ogk37i195eDGmiuWD31BzT8AJmyht+bWC2SxB2JZrmMfKsvbaOFHvvpyLBR60Vp3F+XGA0JufbWkXPmgjQrJh1wxlofJm9BhZnpWwNtPKXuTXsGtlJmqqbk5kIBLgWu2d6PDBnP1fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB7109.namprd11.prod.outlook.com (2603:10b6:806:2ba::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Fri, 18 Aug
 2023 18:16:28 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6699.020; Fri, 18 Aug 2023
 18:16:28 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <dri-devel@lists.freedesktop.org>, <airlied@gmail.com>,
 <daniel.vetter@ffwll.ch>
Subject: [PATCH 5/5] drm/doc/rfc: Mark long running workload as complete.
Date: Fri, 18 Aug 2023 14:16:02 -0400
Message-ID: <20230818181604.507051-5-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230818181604.507051-1-rodrigo.vivi@intel.com>
References: <20230818181604.507051-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0023.namprd07.prod.outlook.com
 (2603:10b6:a03:505::9) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB7109:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f7c8d2b-d189-4b9c-9837-08dba0173d98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8tfy7UezRpPvLe4u93kjCfROvhGgrVMEpMwDiU2dAUmtMkeemk9zp6srhMSl5ifTDpr+x5IsUf0/SpKTi77R1Wp08f5OpUxA6UjmSPdiQBnnsfZcOxa2+UPJOKTwuM9SVej56tB9V+a8sObxDVSSNAg/eysscySfg6XmoWgEvtZgB09wdBGn79FYk3QXD+LhyMXTszw1QrdfEYuQya5MrEUFJlBvM6MkTs0hArhljBaV8Pk6gO+vdaaaE66h2BIwejPHl1hwUf/mUx1re7jpTJMrxm4yooU1nGK4MEYHtU1GVPzZHHS339bvzgepAHzc5Du3NdjufZ8n96Ea2wrbnEw7wT37yaOo+c7+/u6XXWyZlaIgTa6F+VZA2L3OIqcTDu2vGXCcVkkn1WW/C8aUgPxoRbTAdHzloobzFxva1kZ7KRL9/pUttkxdVzINJWjVp3xqPZd4Jw3w2BiuiO8OvDZpOeZjkjqPMj0ISi1D4qVJ+E6Astezgr0oEcHKPGGKqI9hf6Muf9Kvs5wai678pqTReuhY4RKbxVtq8xKn5drGeWNDs62Yn6AAQDnnHz3L
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(396003)(376002)(346002)(136003)(1800799009)(186009)(451199024)(66899024)(2906002)(83380400001)(66556008)(66946007)(478600001)(6666004)(316002)(6486002)(6506007)(66476007)(44832011)(2616005)(5660300002)(107886003)(6512007)(1076003)(8676002)(8936002)(41300700001)(4326008)(26005)(86362001)(36756003)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P9yTn615jdNjdwaPITYsMmqdNAxdJw8bApU7hksEHVx0y9fvF+/OzOX8VUyI?=
 =?us-ascii?Q?cUooUpPgEmVTfeXDyF1QTL9Hmb8HRsQi1BUOi/f9sSEpivq7c1IyxsRcww2M?=
 =?us-ascii?Q?tslsOV/+Lp5r7/DZ/s5arao+cwXCFGEtga8duVyKoqtgVIUJhjYK9qkgS3Ib?=
 =?us-ascii?Q?rCGdaIvzntOUJf11lARM/r0OCEvgCoi1rNk3wMqn5rE/rqxE5BZi4La5kXPV?=
 =?us-ascii?Q?teEs6yyHXDLzRTbKQu1czr9CJjzbbRl9duso8FeHGgOuMTavfdybQDh7U88w?=
 =?us-ascii?Q?mfLDIWAdQPfekIbNIwWCV8l2yphohygbLFbSWWwHL7CXB6ze1/zGpIA3ZcaM?=
 =?us-ascii?Q?tGqB9SXCVGRpLKnp6SG7epQYt+prMZ1znDh6zTNP4vc17LvW2vC3NpRWkhQv?=
 =?us-ascii?Q?0STth6u9FHEqUrqVbpF77fyUoEYT8JH9K/Gk0M5fU4Q9K0HoFyfUe2s3Jk48?=
 =?us-ascii?Q?hapvDk0lSXQAX9So4gGPE3rEZtvG7uLCHnW73b1dH39OABunL3qjkNsbI3DT?=
 =?us-ascii?Q?EhXaMQ34wYV5sHROs2u1nWt6xivwuKm4HgzDE08UhENjoHW8N70dzIljrVhF?=
 =?us-ascii?Q?MM6jAMyDlSRxXZIDm91s0ZWfxthldsOw5gy14ug+neLg/x6hRa+3mXiJ7pRE?=
 =?us-ascii?Q?JiN8IumOQlU3RClkq6XT4HZqs+Y2cI0DEvDsK6CS2eTk0OXmIN/88LEi3cbs?=
 =?us-ascii?Q?iUwwENYJx4j8l+xPdyW4np2QsChjfs2ioCgk8YBa4RXkS6hrdIwHZk5+mq6M?=
 =?us-ascii?Q?GOQgh200RkJbSJeMG8hU7QqUxnMKYQ8ltXCIu3orxza9qeTq+tshW2keU/4j?=
 =?us-ascii?Q?lcbfXkxF5x4InKaNHuURn4/piaZm2kUay5bF9HaeHaTdIO6uy2Bln5HZIru1?=
 =?us-ascii?Q?j0AizqyXG8E3rbrhJEZn2jVKRPo8tz4+NTEC16NCJ+F2jR8h4KAQWQm9an8g?=
 =?us-ascii?Q?RCOaK7OsCI48yfZU/MhfCLPACEL6dOLB/h81wb2eUjnnC4qTtY4UFNUQGOny?=
 =?us-ascii?Q?L/u1kiXWFQR9DYJsrKz+Dp5KBbCk0zYlBfGlrgricn5Sg5cOxg8Khtht3trT?=
 =?us-ascii?Q?a5++yU/xguodpvCKO+OP008EaLUrilG1QoYmDuk7aa0o1efRaFzBj56lwSdN?=
 =?us-ascii?Q?GNGMMWEzHoG+L0SwLvP0xPh0LPmYfrX/pT3Y6vXyMb1r/cICxLsIthNDJ/sZ?=
 =?us-ascii?Q?/nvSsYS1kJE69pfd8oMl8BuFrjgzjesBH50yGGXw4b3FKB2bEM/Afq7WxQUh?=
 =?us-ascii?Q?IqnNiWXaz+hncCm7p8vjO+HxQTLHB6ERV6VDuEppYva8FZffXnKV+++mqckC?=
 =?us-ascii?Q?k9omLQPrmoylUnqZj7EGwCl8nOG7XF4ajtn5A7go+u02echU64Ku2T4WSVaU?=
 =?us-ascii?Q?+Y97QpfPpYFUXj/d/gdPkeYMWskwxGCPzJiaRiM0YEi7NO4RXl9E0kKHlH30?=
 =?us-ascii?Q?12c2QwUlIO/RU1Vk1W21pW8Yep+foidNbVsEXZ4Srp+vZYo1bIlwu9T8S9X7?=
 =?us-ascii?Q?sIibIBVN5btvhBBKWfLo4Wxh4c7P+lUCcWVVCoSLYoiIf+ONyjYDLcxAl45+?=
 =?us-ascii?Q?zqAZeNFjVgIwGotOvEnrrcTnHx42T4gK1m18Y8b5++TSnVzsjT5Qzm//kVw3?=
 =?us-ascii?Q?aA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f7c8d2b-d189-4b9c-9837-08dba0173d98
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 18:16:28.4643 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2/9L3hGGC4SZ5AW+6HBPRxzW7sYgCANFNiD0vwdHIvbj8/H5h6viZgp1RMPOi2X8MVsRTjz0hiwl2Z7x+zXsPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7109
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
Cc: Matthew Brost <matthew.brost@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Matthew Brost <matthew.brost@intel.com>

No DRM scheduler changes required, drivers just return NULL in run_job
vfunc.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 Documentation/gpu/rfc/xe.rst | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/Documentation/gpu/rfc/xe.rst b/Documentation/gpu/rfc/xe.rst
index b67f8e6a1825..1e1dd6202438 100644
--- a/Documentation/gpu/rfc/xe.rst
+++ b/Documentation/gpu/rfc/xe.rst
@@ -127,21 +127,6 @@ Some parts of userptr like mmu_notifiers should become GPUVA or DRM helpers when
 the second driver supporting VM_BIND+userptr appears. Details to be defined when
 the time comes.
 
-Long running compute: minimal data structure/scaffolding
---------------------------------------------------------
-The generic scheduler code needs to include the handling of endless compute
-contexts, with the minimal scaffolding for preempt-ctx fences (probably on the
-drm_sched_entity) and making sure drm_scheduler can cope with the lack of job
-completion fence.
-
-The goal is to achieve a consensus ahead of Xe initial pull-request, ideally with
-this minimal drm/scheduler work, if needed, merged to drm-misc in a way that any
-drm driver, including Xe, could re-use and add their own individual needs on top
-in a next stage. However, this should not block the initial merge.
-
-This is a non-blocker item since the driver without the support for the long
-running compute enabled is not a showstopper.
-
 Display integration with i915
 -----------------------------
 In order to share the display code with the i915 driver so that there is maximum
@@ -230,3 +215,15 @@ As a key measurable result, Xe needs to be aligned with the GPU VA and working i
 our tree. Missing Nouveau patches should *not* block Xe and any needed GPUVA
 related patch should be independent and present on dri-devel or acked by
 maintainers to go along with the first Xe pull request towards drm-next.
+
+Long running compute: minimal data structure/scaffolding
+--------------------------------------------------------
+The generic scheduler code needs to include the handling of endless compute
+contexts, with the minimal scaffolding for preempt-ctx fences (probably on the
+drm_sched_entity) and making sure drm_scheduler can cope with the lack of job
+completion fence.
+
+The goal is to achieve a consensus ahead of Xe initial pull-request, ideally with
+this minimal drm/scheduler work, if needed, merged to drm-misc in a way that any
+drm driver, including Xe, could re-use and add their own individual needs on top
+in a next stage. However, this should not block the initial merge.
-- 
2.41.0

