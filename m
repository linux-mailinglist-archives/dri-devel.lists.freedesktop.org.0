Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCF15AF5A5
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 22:17:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E277710EA89;
	Tue,  6 Sep 2022 20:17:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C56A10EA82;
 Tue,  6 Sep 2022 20:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662495428; x=1694031428;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=sbKfQTg+CFMo3FiMihv9YnajB9h+ql7gf2rY835FJg0=;
 b=MeX+pEnh9lQ9R52/38dMgFRVVOzYhoZC2CeVAMMoen+8AqRfzLALhoyi
 Ia3tLdlweayygU9E6ABp+UgyxBUVMAbwM0/nuJDwyHBDaMLtU/olIyRKJ
 aCC2TE2xB9siadpVsN02vo6qD+J8h4vFuYfeiSIMVHbgW2NgBcYP1dCJO
 9L4swSKiKSIeBtXXx/WvcvhyPKWe2rIqjJbSKTKKAJkCjkmiXr1GPPjpB
 COijN/StCQse5jQJMkw193IMGlCjhVhCEmtPcLGSqHRJ02i27Ou7yYm4T
 C8JhcgW5GVpUKvdrtHQmjIWJTmWH2MXA3+y9I2lqv4RcR8x+bEPLV6/KQ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10462"; a="297479848"
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; d="scan'208";a="297479848"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2022 13:17:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; d="scan'208";a="610076379"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP; 06 Sep 2022 13:17:07 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 6 Sep 2022 13:17:07 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 6 Sep 2022 13:17:06 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 6 Sep 2022 13:17:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FCBn+AoGF39gpxOtZ+N+GJD+X8I6PVRd9Pn/O+ZnXQyA5zI0aw9olIepRRaU/p83+L8e+RNLWjvWoRWztbG2nVwb5690QppOxy1/xLFe1vaPR2kHOJ8aP0YjGz1PApM2VIbqYC7W5+n8pxWHaJVuRQSixkeAPOaYFu4WNVJHXbkUyAkb+wZKMOgV0j2O0RBo6iRnGvbY7s6FtjTYa40/22Dbhe9qPe5eQdxF/aUotFfbucu2951SX9tjoMhRWrhMPHY9sRNbxHkwdIxVPMTTebF9vUctTKkMuooZ9109LpatSkW8zXdkVh/f5nla9xvwxjKlu1JirMbfIJnDpKll/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Os1VZYkjqlvvGr86DKSKUwsxFEaQ4MP+zgd8BGaa3do=;
 b=Li0RRzu+GxP4onMcHgj8vwXs6Q2STyi704tsBQQ5VeExu7GWaa17cP96Hqr76hRH1OMEx+IMdDj7QeFVF1a52icOrTya44rVpYUEMdz/kWUK9Z413Fsd3VJZrArCOxXtB+wb5Hb4FKrHjzKlOXD/agYGumkbcpvofeAoHpo9VZYQBGPmCR91YhY62JIenuftsuX5or15IjcS4lDjru9EQm2h9165U+rUUmwMpE0EoqQXgK0ueIXdJaSqaUQHm+fMtRHjSdtrrVN6dAG7N5/yGIz3bG1d2Dwa0Mv1nnBZxPUywj73O0T9sNSOMHBXGZj55zlYBmnggKNYD7f1two9lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CH0PR11MB5396.namprd11.prod.outlook.com (2603:10b6:610:bb::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.12; Tue, 6 Sep 2022 20:17:04 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e%9]) with mapi id 15.20.5588.018; Tue, 6 Sep 2022
 20:17:04 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v4 1/3] drm: Use XArray instead of IDR for minors
Date: Tue, 6 Sep 2022 22:16:27 +0200
Message-ID: <20220906201629.419160-2-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220906201629.419160-1-michal.winiarski@intel.com>
References: <20220906201629.419160-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0121.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::8) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 972bfaa2-37df-47e1-f1a7-08da9044c383
X-MS-TrafficTypeDiagnostic: CH0PR11MB5396:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DzWShhHTdeEcSa0Mk1C7uSM7/xek/XtdBqlXCis+miUwV7LCCl9e8qKUmzbhs35+2+nuLgJImUSy+iIu7KwRnC64e4l+SKC04P2JSI3KzEnl1whgefOGfjkDMeMtm3bgi4VcC04j5S9JXNuyTJiHm/bUCAzaB3uJtj3Ib9Qq7TU3SwX/EuZx7glm5mm06iNoikeUBCy7o0SZuATT+RNQjTTDJQ+otuq3+q/wXg1RAPCltBurU1YEHMSN6F1pNc1WW3YQJFTbQrxGO8f8WcgipqCQmr21v8fz5DK6E1d/K69QmIWhq8py8xV3INM0JyWkf05z9Zg+Mg8tGpVEprJS3/sxbrl+OxdWrlcMP7blsLzayzhfbmGdF5WRRKuZsjbFpxomd65k2mSCDFB+Y3zW2+AXb1cATPay2WBhzhxpBYWyVVqOu52UH5gU7XxRwDtchm0GrWNDW9jHtr21rjqDMi5cuW++Ppod/4wXbUc5JA0hCBxIvPFNWSaqct2ExqLB63tv9iYv0pWtR8yi9W5YJ1C/8uXrJMRP9oD8FgUed4LZ3rkzJLMdFnwnzGlusn0prnKzBunmIH/MxHDrGkx23uCeRxxxDIvnuY7ssFtgmQxHGboZK0zXHjSNiC7eDW9qbjA3jezkHTcZmWSksmoL21R+UGWgr6owgNZqt2R5LGYDqqjH+Xq/MjQZ4it6bhFw1Q9bmGSnzOzRJQ+2sHRo7g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(396003)(346002)(136003)(39860400002)(366004)(316002)(54906003)(86362001)(82960400001)(36756003)(2906002)(38100700002)(5660300002)(8936002)(7416002)(66946007)(4326008)(66476007)(83380400001)(8676002)(6512007)(6486002)(2616005)(6666004)(186003)(1076003)(6506007)(478600001)(66556008)(41300700001)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzZNbXJnVmNyZVJmTDFzYWl6d0syRDVxY0RhVnQwWjM4VkMvSFl4SHRrUmJl?=
 =?utf-8?B?dDR3dUZJekVsWEVnWEYyYVVGcHR1dDdCdVNsbndYRWYwQlV6Rjl3M3BuYjRz?=
 =?utf-8?B?ZUQyMDhWSTRQWENqa1RkVEZwVUdpTW5mejNUeWxGQ1NXTmVPZU1kUjZycjdO?=
 =?utf-8?B?NDZ0dUEwNnB0NnQ4cmtHVWtMNHp2Skl5REVkT1ZHNkdPVUJSS1hGVnNuNTBi?=
 =?utf-8?B?b1VmWjNJaUQ4RzRpb1NtVFltMk8zY09pL0x5OUhrZDVCbjVLaVRFUGVPSENV?=
 =?utf-8?B?WFJSR1cvcEFabDFqbnJWb3NydStkbnVNSzVhN1M0TmlYdnpFVGlqYmFYUlZx?=
 =?utf-8?B?M0hscGo5OFhxRVZIeDU4eUNweWlOMWZEOUh5d2REMndENzJoZXdMVHVZc1dV?=
 =?utf-8?B?bG9WNUVZWFZVTHVWZG1WMDFQRzYrT3h5c0x1N251VjBqVzBDbWhXb240OThu?=
 =?utf-8?B?cE5CSkJRa3Q5SUZ5SHZXWDBpbnNLN3licU1UdC9KWU85NThTeDIwbldOQlND?=
 =?utf-8?B?YnFDSXdkRkpjTHRDVXZXZWJueFdxZEh5TEVsWWNIT3YwbmQ2M0NGc0tXdlFm?=
 =?utf-8?B?VHlkRi9hcG9NSjRxY29EdmY5ZENpNDVVYmYzVDlkRnpuOHJ2OXJRbjhBWjNj?=
 =?utf-8?B?K0ZNam1RV1hqQ0lvWW5VR1Z1bmlQY1lnb2RqQW5PQ1FRdHpTOWh1K2JRd1Nn?=
 =?utf-8?B?NkdxWGI1NjVwWkk3alVObTlQbXdKeTBXc2dZV0p5N1Z3OXBWWmpoLzdzWWM5?=
 =?utf-8?B?bHVPYzZNWUNYS2tUZlJhOTh0cHV5elZuSTFRaTFBemVaRm44OUpuNWZVYlN4?=
 =?utf-8?B?eU9mZkI1K3pYT09JdUIvSGhCcmYrb2hnZm16TVdyTEVGQ21MMXpOdkpvZWpI?=
 =?utf-8?B?SHZNcElOM1JpakpRaE51K2NHUE5kQTNFdkt3Mk5BWmFiUWZ6VjBuN001dXFD?=
 =?utf-8?B?MkJFcWxTd2pjdGJBMXBoanFXNFJPaVl4bEI0WWcvYzZOK3B1bEVzbVB0VG4w?=
 =?utf-8?B?dGRjNkhPUStiZ3B4UUR2MjhpYnRYK0JUZGZLSnVwYnh5QzVWbHVMRWZqL0I4?=
 =?utf-8?B?bTd5T3JQZllPenhsK3hwY2JsWENtdUhPRHorZS9Oc0hRcnVLVlBkSmRWMjhT?=
 =?utf-8?B?Y3dDQSswa1V1dndtRW85aEZOdGRIRE1mQUpGOFJJcjltZkRiSXF0V3Fqb3pS?=
 =?utf-8?B?dlhJanZzeXJZeGxmS1lNdy96NE45OWxmRHFpNXI2d2wrZVltUndIRHp5NVhZ?=
 =?utf-8?B?ZGZNVUZkdDhhdERFYXVuY3k5M3JnY3pHaE0waWluN3NJRHhMRjRpRExselk5?=
 =?utf-8?B?UFYxc3UvcmdsNnh0aDhjbE1sRmlVSi9ybjZiblpDbDMzZzgwaG51VlNJL1JO?=
 =?utf-8?B?RENETmVZbmEzcE9MTEIrdDVCUk5NS1dqN3hXTVRlaEo5WFVBS2ZTQWU2NXh0?=
 =?utf-8?B?ejVGaVBVdEljM3N2UkgrVHRaSHJ0NDRWRmluZVRsWXYwYmtJVEhpT1lBYkhZ?=
 =?utf-8?B?ODIyQjk5eXZSeW5CaHhHOHZKSEtsM0lENDJlY20wZWpoOEFJSm5KaVhxNEJj?=
 =?utf-8?B?VlBEMGNmbnBlc1JuTjFkTFA4cVBoa1NRWXh4aXRoSkMzZ2RQTzRYbEhLRito?=
 =?utf-8?B?b0huNHBnLzlCTlFJcURVSGpYSzdzaFZZeG1WZURFeVExUHJzWkFqS1daQlMy?=
 =?utf-8?B?UCtBYmROcHcwKy9ZcTVyckhGSVZtY2NzYlI1RlA2WS80KzBNVnphVExkWlJn?=
 =?utf-8?B?S0tJTVdNVG40eW9jZVpMQTg1UHQwVUd6eGlsTzlNbGxjRGpkSlVQR2Z0YU1w?=
 =?utf-8?B?OWNiNTNhckhFSXRxZDVjZVowT3A1ejZBSk1aWFAvNHhXZUtUelFjbEZVUkc1?=
 =?utf-8?B?Q2pXQzZqeHdRbitCd2krY1hQMHF3T3pOTVdtTGFWNmVTUGEwUmlUSGV6a2FU?=
 =?utf-8?B?T05jRXYvRTBJK243UGdXaStKdjI1cm5IK05MeVdLKzNVdFlMQk00Rk5zTldV?=
 =?utf-8?B?RXhpQjRndEZRVERwTlFxcndoN0tnYXQ3SnlUSk9YTlJweFVkRVluTVJGajd2?=
 =?utf-8?B?VXFHdytDQzVvZ0JNYkNxYnRzTVNPZm5wK2tXVk9vSktZMkJubnZRdmI4dzZ4?=
 =?utf-8?B?S2lGZEtnUzFjdG14ZzlXUmU2QSs0bnNpbnE4Q05FOTZFN0VHcWxSOVkrMUVN?=
 =?utf-8?B?dVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 972bfaa2-37df-47e1-f1a7-08da9044c383
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 20:17:04.1069 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hAUHbuah5dWnGGWtMWAW6MdOQWAoOLnppcnpXoNG7XIr+jTWXZjZtjkzMmZDg0XTWRWbttP4OWLzsY4Fm6ksVMdYpzrNwBVs5RDckeOgwLY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5396
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 David Airlie <airlied@linux.ie>, Matthew Wilcox <willy@infradead.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

IDR is deprecated, and since XArray manages its own state with internal
locking, it simplifies the locking on DRM side.
Additionally, don't use the IRQ-safe variant, since operating on drm
minor is not done in IRQ context.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Suggested-by: Matthew Wilcox <willy@infradead.org>
---
 drivers/gpu/drm/drm_drv.c | 49 ++++++++++++++-------------------------
 1 file changed, 17 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 8214a0b1ab7f..41799e4d0432 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -34,6 +34,7 @@
 #include <linux/pseudo_fs.h>
 #include <linux/slab.h>
 #include <linux/srcu.h>
+#include <linux/xarray.h>
 
 #include <drm/drm_cache.h>
 #include <drm/drm_client.h>
@@ -53,8 +54,7 @@ MODULE_AUTHOR("Gareth Hughes, Leif Delgass, José Fonseca, Jon Smirl");
 MODULE_DESCRIPTION("DRM shared core routines");
 MODULE_LICENSE("GPL and additional rights");
 
-static DEFINE_SPINLOCK(drm_minor_lock);
-static struct idr drm_minors_idr;
+static DEFINE_XARRAY_ALLOC(drm_minors_xa);
 
 /*
  * If the drm core fails to init for whatever reason,
@@ -98,21 +98,18 @@ static struct drm_minor **drm_minor_get_slot(struct drm_device *dev,
 static void drm_minor_alloc_release(struct drm_device *dev, void *data)
 {
 	struct drm_minor *minor = data;
-	unsigned long flags;
 
 	WARN_ON(dev != minor->dev);
 
 	put_device(minor->kdev);
 
-	spin_lock_irqsave(&drm_minor_lock, flags);
-	idr_remove(&drm_minors_idr, minor->index);
-	spin_unlock_irqrestore(&drm_minor_lock, flags);
+	xa_release(&drm_minors_xa, minor->index);
 }
 
 static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
 {
 	struct drm_minor *minor;
-	unsigned long flags;
+	u32 id;
 	int r;
 
 	minor = drmm_kzalloc(dev, sizeof(*minor), GFP_KERNEL);
@@ -122,20 +119,12 @@ static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
 	minor->type = type;
 	minor->dev = dev;
 
-	idr_preload(GFP_KERNEL);
-	spin_lock_irqsave(&drm_minor_lock, flags);
-	r = idr_alloc(&drm_minors_idr,
-		      NULL,
-		      64 * type,
-		      64 * (type + 1),
-		      GFP_NOWAIT);
-	spin_unlock_irqrestore(&drm_minor_lock, flags);
-	idr_preload_end();
-
+	r = xa_alloc(&drm_minors_xa, &id, NULL,
+		     XA_LIMIT(64 * type, 64 * (type + 1) - 1), GFP_KERNEL);
 	if (r < 0)
 		return r;
 
-	minor->index = r;
+	minor->index = id;
 
 	r = drmm_add_action_or_reset(dev, drm_minor_alloc_release, minor);
 	if (r)
@@ -152,7 +141,7 @@ static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
 static int drm_minor_register(struct drm_device *dev, unsigned int type)
 {
 	struct drm_minor *minor;
-	unsigned long flags;
+	void *entry;
 	int ret;
 
 	DRM_DEBUG("\n");
@@ -172,9 +161,12 @@ static int drm_minor_register(struct drm_device *dev, unsigned int type)
 		goto err_debugfs;
 
 	/* replace NULL with @minor so lookups will succeed from now on */
-	spin_lock_irqsave(&drm_minor_lock, flags);
-	idr_replace(&drm_minors_idr, minor, minor->index);
-	spin_unlock_irqrestore(&drm_minor_lock, flags);
+	entry = xa_store(&drm_minors_xa, minor->index, &minor, GFP_KERNEL);
+	if (xa_is_err(entry)) {
+		ret = xa_err(entry);
+		goto err_debugfs;
+	}
+	WARN_ON(entry);
 
 	DRM_DEBUG("new minor registered %d\n", minor->index);
 	return 0;
@@ -187,16 +179,13 @@ static int drm_minor_register(struct drm_device *dev, unsigned int type)
 static void drm_minor_unregister(struct drm_device *dev, unsigned int type)
 {
 	struct drm_minor *minor;
-	unsigned long flags;
 
 	minor = *drm_minor_get_slot(dev, type);
 	if (!minor || !device_is_registered(minor->kdev))
 		return;
 
 	/* replace @minor with NULL so lookups will fail from now on */
-	spin_lock_irqsave(&drm_minor_lock, flags);
-	idr_replace(&drm_minors_idr, NULL, minor->index);
-	spin_unlock_irqrestore(&drm_minor_lock, flags);
+	xa_erase(&drm_minors_xa, minor->index);
 
 	device_del(minor->kdev);
 	dev_set_drvdata(minor->kdev, NULL); /* safety belt */
@@ -215,13 +204,10 @@ static void drm_minor_unregister(struct drm_device *dev, unsigned int type)
 struct drm_minor *drm_minor_acquire(unsigned int minor_id)
 {
 	struct drm_minor *minor;
-	unsigned long flags;
 
-	spin_lock_irqsave(&drm_minor_lock, flags);
-	minor = idr_find(&drm_minors_idr, minor_id);
+	minor = xa_load(&drm_minors_xa, minor_id);
 	if (minor)
 		drm_dev_get(minor->dev);
-	spin_unlock_irqrestore(&drm_minor_lock, flags);
 
 	if (!minor) {
 		return ERR_PTR(-ENODEV);
@@ -1037,7 +1023,7 @@ static void drm_core_exit(void)
 	unregister_chrdev(DRM_MAJOR, "drm");
 	debugfs_remove(drm_debugfs_root);
 	drm_sysfs_destroy();
-	idr_destroy(&drm_minors_idr);
+	xa_destroy(&drm_minors_xa);
 	drm_connector_ida_destroy();
 }
 
@@ -1046,7 +1032,6 @@ static int __init drm_core_init(void)
 	int ret;
 
 	drm_connector_ida_init();
-	idr_init(&drm_minors_idr);
 	drm_memcpy_init_early();
 
 	ret = drm_sysfs_init();
-- 
2.37.3

