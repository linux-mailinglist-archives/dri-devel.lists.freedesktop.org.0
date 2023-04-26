Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7D46EFC14
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 22:58:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5714010EA33;
	Wed, 26 Apr 2023 20:58:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BAA610EA29;
 Wed, 26 Apr 2023 20:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682542695; x=1714078695;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=o1rcTlcoEtm7wapAzVpDanA0tOrNCFjUbgUwzCpB1UI=;
 b=dXkGsAhCIFH4utsEbifrOrJr9tmLA8Ma1A6KZZak/bvH1qmOCfozq0p0
 KoS2Dxv/puw25rZc31shRaQURa+eu38BLCvn0g7lAbcCqQ1IB8C6/fCz2
 3lmIPsdT6VD5yX/hm5nAyxfQXzetm/EVH7bS4YeBdOwinIIjOpX/1c5gq
 p1LTBfe7H+uP9oOZoQFsqoeluLxLZxEGNTg6VHO0REfAjcoYgpMEjFlUU
 KSink0g+loXR7Ef0MGvCX3u+sZwutd96pfx3+vk4n/WdsuVf2xtQIqMAM
 DyfVseVrw7uAn1Dj3JqBFtCb9c+WCSXAq5jY+TfcxkzQMqaIqQzt+Ylqp w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="375203781"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; d="scan'208";a="375203781"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 13:58:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="688105337"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; d="scan'208";a="688105337"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP; 26 Apr 2023 13:58:14 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 13:58:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 13:58:13 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 26 Apr 2023 13:58:13 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.44) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 26 Apr 2023 13:58:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Znqi3ga4VsA1DSRDmFsVCQtsJgIM/rXdp1VbFvvPcXnUiks/7/NbuzcUJNszo3ujqnXf7C2UPkSVud7L6n2DZsYPA4e1Vn7ELH9m43NnmQCQ9/pZ7hRqfHDez+SxBcFf8Emf/uBGE6sbnVii0rRaEkBp9fhmxOxEun6VTl7MsJZI2dYxFQIOtgORKZh41H8UuNvrfOskNTCvNFnkowVm7lRAi38lNPRIe0tEO5Na8/aR5wV0Tea/EPAtlRetl2SkQ3ik/n/Am00gldCCEOuUk3oLZBSJmy4uEDbU2w3wPE7fxc+eNDCDkXS8/dBbtrm5CRmcNO3MSIDjE3WTZDEn2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JeH1+nIpXj/NNdABSrv+pqx8li1daxxjxvnD2BLWr+E=;
 b=bHBWe1EZDiSAFBwcIPwtj6jrLvSiNlTb9PJNqWxRvge0jW3oHLwzqoSmgk4CJR9oHIopjSeIzqzGa7ZeGmoYTIu+bHpCD744xKjgAK/SDEs2gItJWuQCeXAAatxfrTPH5GuPptCqEKXQBKmtcgyhV/hiOcL7QmWKUmuL8LYUo6WZimhXoWjTVqWes6viO6ZXC8MBVTH/3mCLByDj78xmQYvXObx4l943wO5FWfHMVYo1DZtPI6BnHSYMCHaQA/BTk+Ynqxja+k9ON+oy0w6Wjn5jk7y6pciJCkqmTUFqkthglSc/b5bXlnpJ5cXmMT/whluJtLNg6sSomps8TZfZSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY5PR11MB6343.namprd11.prod.outlook.com (2603:10b6:930:3c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.34; Wed, 26 Apr
 2023 20:58:11 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6319.033; Wed, 26 Apr 2023
 20:58:11 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH 14/14] drm/xe: Add VM snapshot to xe_devcoredump.
Date: Wed, 26 Apr 2023 16:57:13 -0400
Message-ID: <20230426205713.512695-15-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230426205713.512695-1-rodrigo.vivi@intel.com>
References: <20230426205713.512695-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::33) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY5PR11MB6343:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b048cec-8564-4c63-c928-08db4698f208
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OyNbgQF2YmzfsTNx2MJ69pJ/q4TbbW1RgsmUyiBex6i0KfFriyXBk/mzytD5scMoUIoECN/ckYn1oY6MuDGf6gVkJSQCgNqGojJ8QmaEtJVibxK9zIwSIcScQQ3U5AyWESA96waCLfA9MOYM45T8MZWENugjqmHpeTjqxTQGVvQQw1zYC6vxQtIIEXNjYwpRB3tjiDVpDNbTLAVtGtr7bZ6PY2A/17WcpqhAC4UKZ7bcJByHRIcTAGrlVzoDddAytjbu/G4beT8DbmVFnkHDvhcN/0Bf7dxsE/6Zd9haF1htzUn7u/sAfbgkVPUoJiYse805H+BRA5iDjtnZjBQyAcTFHVi0yPzs1Ht0AJak77W4ypKWVCkU96c75V6KFP818gEmD68KRu8uXKYHQSM8is+drAFKsRtNS9RBAcYGtBxbLz3rN9vBVeBes6ddqKk/EIsZoPNVD4mitFG3jdCLty/bzuW/9gU1Qfslef6sCg9/Flo17VLAPUSWfH0dUlnoecEm0jcf9CuckWDrqa+myLU1BoljVesy+ZWvMKA3gHuhDifSU2C98vBrn33pf0BE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(396003)(39860400002)(366004)(136003)(451199021)(83380400001)(450100002)(107886003)(478600001)(2616005)(1076003)(6506007)(26005)(186003)(6512007)(6486002)(5660300002)(44832011)(36756003)(82960400001)(66946007)(2906002)(38100700002)(41300700001)(86362001)(66556008)(66476007)(4326008)(6916009)(8676002)(8936002)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F5+CiYPMjV1a4jh2Nbi9swwmCTgvx3/yvlGwAMjqhyhLyKbWvf19yCD7sBa6?=
 =?us-ascii?Q?bI6sk5Uau7bW16t+F32k3yU3jzW2Q9Fhsz0wk3RkDnol9xhXCHslVS5uPyGE?=
 =?us-ascii?Q?9UJi2S6oK8YcVw511y8bOkciqSihaCTDxL6J0E6VqUV0HhA+E7dC+6KWLQG1?=
 =?us-ascii?Q?qAm0IK+zXqFKEcEffeNY9FdvYlpvLYHWwOEyPFVEAroIn2sXgnqm3063h0Ze?=
 =?us-ascii?Q?9fbd8h/iAmpAB16Rbn1xLsoclCr1/74IBgVE/eR7w4hFoMrgmEgL1d6lmFWa?=
 =?us-ascii?Q?Ank8FRpOGF1UQK56cW84JIkIAAim9XSe3CQH3dq/VlSmT8zsFiHagYSz1+mI?=
 =?us-ascii?Q?g+JaXa/wzegh4ucl+d6clOJgr5zf2TRm0yn2l940bQKoZbFBWI7Sy4w1nOfj?=
 =?us-ascii?Q?xYWd2cwsTXeK4vTXBr/55AnX63wnI+lA6eKnLkjNHKL1PMmcEN2JPN74hCDn?=
 =?us-ascii?Q?vInM60B39VWXgFWP4K1LYHSZZEJhd7Np25enSCt1BrAHQKb29ixJy0u3EzPk?=
 =?us-ascii?Q?qGhL5o0h/P4WyogtGhcXJRFbuQDhIMMYdy7N1r+LidfQyY4IVUHFOqLyHSL6?=
 =?us-ascii?Q?PmJBT6cDjpWfyc9BI+PzDnq4UUuYOELBzQk9G1z11VnHKZ8ohg+J3a4Uz9TQ?=
 =?us-ascii?Q?dp1WJJOzXYRsf+9brx9huV4J5wbeNZwNi20biUZQLmNGYLKNdW/ixnoycmcq?=
 =?us-ascii?Q?KfcxhGszQldPAKkxBy0CotFh0lV2KKE1OyujMTjkrujTSL7B71apB9SD+Ry6?=
 =?us-ascii?Q?VFQQ4kjrLsrD1qG0x4xNestoXwMSXPhPe0OAWqxrl56wcHeQLvLIx0PfiOJj?=
 =?us-ascii?Q?a9NzbGd3jCPTiSYoSeITVHvDXFQTYqX4UQerDmcmdhz83XJRjUwX7o/etmSx?=
 =?us-ascii?Q?Y/f7mQZ9mfVPlWjGoCSDpUS9cFjPo8YEiNyfYT74xZw9f7c82hiQkDVu7UdJ?=
 =?us-ascii?Q?pIoiKQPkFNle9zFt2GmXEr3lyPz0Pn7/g0gdMlj5cij8K0tdtI/PctRhpNzY?=
 =?us-ascii?Q?HZapFEOO1hmPOnh8q/d2holAGehjcM0J73kZ7FGA88B4oHapxZPyr72DcBYo?=
 =?us-ascii?Q?e4D8IL3MZb3jayd+usue8K6IkIdxxz6TzC5viRJcq8XPcJKPE08SmOQaxn4Z?=
 =?us-ascii?Q?lmKrcGH9YtunWghnDM7KBG/DXvF+RBLfwjzgytVRaYflXvkycIF+wlz34Wwm?=
 =?us-ascii?Q?NmR9CDGUiwsI96MLNsvZ/05l5rvPr7V7QsF+WPWLZUfjLMWfx+aKBzePxKvv?=
 =?us-ascii?Q?UNF4mgleJA1Oi1sgRUEjuEPl7usiy0JZdAVm66NJa/wil7N0e2mdchMj6dnH?=
 =?us-ascii?Q?gk/6UWJr9nUBhosi6Mw1+yA2cubHqryYqjCuUHhcp2hUavcKGIEnFtYZOw/h?=
 =?us-ascii?Q?aYhZvpZx9hvQfl3oaXqwGN2hIHDSejx+tO4yEmH1z2hzBHRAVVqs+4QG2QjO?=
 =?us-ascii?Q?laSW+y5HDGS8jyQkovFBOLbX1AD5G7q66kxC464k2F0p260wmfFrHp52CZUz?=
 =?us-ascii?Q?PnY+yU0vQflpuvY1+Xbt6jh+aEdCnLdHCtvOfJLH5uTg5lWbMvOc4QJxXqOL?=
 =?us-ascii?Q?UJ5GEmRQpymEom7lwxSQ+X8jheAJP6MwYDRz/pTz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b048cec-8564-4c63-c928-08db4698f208
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 20:58:11.6195 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KDepgED9VMJ+Eo+KwlbnWy4nSOcF4c3DA5jdjd0oojaHjxkyHc7woWledtunk3t2Bh1r6uVmoDeAHw3Im4rppA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6343
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

With this patch, we now have some parity between xe_devcoredump
and the simple_error_capture. The only difference is that
xe_devcoredump will only stash the 'first' hang, which is the one
that we care most and should analyze first, while
simple_error_capture will dump them all the kernel log.

But this is just a start point to start building a useful and
organized crash dump, using standard infrastructure. Later this
will be changed to have output that can be parsed by tools and
used for error replay.

Also, it is important to highlight that the goal is not to replace
the simple_error_capture which is still useful for some cases.
But simple_error_capture should be protected under DEBUG and
EXPERT flags, while the devcoredump has its own production config
and will be useful for bug reporting and for error replay.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c       | 6 ++++++
 drivers/gpu/drm/xe/xe_devcoredump_types.h | 3 +++
 2 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 1ffd12646a99..9dbafd586fbd 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -16,6 +16,7 @@
 #include "xe_guc_ct.h"
 #include "xe_guc_submit.h"
 #include "xe_hw_engine.h"
+#include "xe_vm.h"
 
 /**
  * DOC: Xe device coredump
@@ -103,6 +104,9 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 	for_each_hw_engine(hwe, e->gt, id)
 		xe_hw_engine_snapshot_print(coredump->snapshot.hwe[id], &p);
 
+	drm_printf(&p, "\n**** VM ****\n");
+	xe_vm_snapshot_print(coredump->snapshot.vm, &p);
+
 	mutex_unlock(&coredump->lock);
 
 	return count - iter.remain;
@@ -124,6 +128,7 @@ static void xe_devcoredump_free(void *data)
 	xe_guc_engine_snapshot_free(coredump->snapshot.ge);
 	for_each_hw_engine(hwe, coredump->faulty_engine->gt, id)
 		xe_hw_engine_snapshot_free(coredump->snapshot.hwe[id]);
+	xe_vm_snapshot_free(coredump->snapshot.vm);
 
 	coredump->faulty_engine = NULL;
 	drm_info(&coredump_to_xe(coredump)->drm,
@@ -172,6 +177,7 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump)
 		coredump->snapshot.hwe[id] = xe_hw_engine_snapshot_capture(hwe);
 	}
 
+	coredump->snapshot.vm = xe_vm_snapshot_capture(e->vm, e->gt->info.id);
 	xe_force_wake_put(gt_to_fw(e->gt), XE_FORCEWAKE_ALL);
 	dma_fence_end_signalling(cookie);
 }
diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
index 8b17ecf1b6e6..f508eca292f7 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
@@ -31,8 +31,11 @@ struct xe_devcoredump_snapshot {
 	struct xe_guc_ct_snapshot *ct;
 	/** @ge: Guc Engine snapshot */
 	struct xe_guc_submit_engine_snapshot *ge;
+
 	/** @hwe: HW Engine snapshot array */
 	struct xe_hw_engine_snapshot *hwe[XE_NUM_HW_ENGINES];
+	/** @vm: VM snapshot */
+	struct xe_vm_snapshot *vm;
 };
 
 /**
-- 
2.39.2

