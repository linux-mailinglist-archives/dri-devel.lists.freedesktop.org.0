Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E445B5144
	for <lists+dri-devel@lfdr.de>; Sun, 11 Sep 2022 23:17:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F3A210E531;
	Sun, 11 Sep 2022 21:17:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36D5110E531;
 Sun, 11 Sep 2022 21:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662931050; x=1694467050;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=jywupnv9VhdgAsr31Sg4CcaOa3sOFttqYpz4TqJ9Xco=;
 b=it3kGXNw7dNQGS7I0STprwc/NFJtwcMFz5r6B2HgHU0ZmaO+6zlHZFeN
 L0ZxJznKGLOURkw+EBf5Pc2imfoTw1revHLMgaxv0H4GGTWhni0rx1A2O
 Z6d8yb2/0J9EMfChXARBPEgiAE/Q5kNUNGN9rk6T2RqYPZJ+5Ih9HOj3f
 hRIa0q6mmXmtoj6JptlRmoo2FHzaYrLa8/VLTUOHf6508EkrUlzo8FuzY
 ABmrYh1jp+QVm+H6gGQHfPbWzxho2/0Xo+TaEQ8hcFaoCGR3VuichuVS+
 2P3lW4llyS7zZf+J9ClYdVjwdFjmYMTGt/B0MkdeiWyqmxIQAuUBlDuGR A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10467"; a="277487731"
X-IronPort-AV: E=Sophos;i="5.93,307,1654585200"; d="scan'208";a="277487731"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2022 14:17:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,307,1654585200"; d="scan'208";a="615853524"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP; 11 Sep 2022 14:17:29 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sun, 11 Sep 2022 14:17:29 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Sun, 11 Sep 2022 14:17:29 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Sun, 11 Sep 2022 14:17:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P3IJnw05UvyF6b1z7rlNFjV86DGMVGF6bCKzQscip6CFuhlJ3O0bT7uQIa7nsveZuFSg0xqK6ZMaX2tTJaoBj07rwpV6O6BvnvXX54r0dV5pLxnaScCezO5eL7orOo13++8B0KlwMxADg2BRykrhKAHNzEia8HCUyB+wNq+sOLGf0NkD+43iI2rB4Do1rXPQYnFhxw2N1Twe9dyYE7dhDSqcRarfDWZRh+brvHobngs/7rzD1Ejhu+QFOzZh84f4GJEKYiK0I7cw4iA76p6v+j0DYoxbMb1HRi/qinq+UR16dt0L/6+YnT0v5CU/stmfqRIctLJbuat+cQk0wQDUPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nWTLd9MTRbWNzjDin6e2/uKyO3adhW5rfCcTQM9KbY8=;
 b=dFqlCUVC/jztsAQWiLFKtnCjt9ymLW6tMT4bBY+aW+jOSO5rb7HqSZl1LwiKJFHvPdmTJEjawVSGQNHW+2Zm800/EeOIx15dm3feGafElM8E4b1TeeOlbQo0SX3NDdD8yYL999zKHXfAyeWM93vDFktnJFsUwW5hZ25OSB3ZDSLKDnkCTOAyfv1vuIJeXuwD66+caJ2gTR0YktkAMvtLdpf9Ki86/LM78NPbbAQ2vSLEg9FS8sV8WnT0fZTAhovWMu8KXFI4f2u36z1UxCgID3VU9xFydsa4/N2ejorSoBFDzn8r1AIT0DzpmEGcnwjirwxHottiaUwZj8KhXplKzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM4PR11MB6065.namprd11.prod.outlook.com (2603:10b6:8:60::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.20; Sun, 11 Sep 2022 21:17:18 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::5145:64b6:db32:b424]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::5145:64b6:db32:b424%5]) with mapi id 15.20.5612.022; Sun, 11 Sep 2022
 21:17:18 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v5 2/3] drm: Expand max DRM device number to full MINORBITS
Date: Sun, 11 Sep 2022 23:14:42 +0200
Message-ID: <20220911211443.581481-3-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220911211443.581481-1-michal.winiarski@intel.com>
References: <20220911211443.581481-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P191CA0083.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8a::24) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM4PR11MB6065:EE_
X-MS-Office365-Filtering-Correlation-Id: 9324ec8c-1bae-4626-ea4d-08da943b01e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5ynywRp5uHUFGYNil3RpV8p5+x20/mOjQ2lEOIZDZMHFIUwKTrF25d88QvP7HvH18d8jMV1mH5784QFTyCdi2KpuctFRXFS0nJaTHr9HHs6ZW4JbKqTkaTqgqdrnmp+lux8wOGL9LJApRpPd7YxeZ0JxeSN/HfiSJjPYiIGBD1PNVPj+ZSdfcP49UoQmi1eBpkhOUh6jezgByviYyk/mzjjrgJXNZjCgI6EF04CzoOuXt6ZSo8nsU2XzFyxUl7QSzD88SO2qfuhB4bkQTiztgqdCvdd6I0LXRciXqUT3Dc6FWYq/gKYpaWc5RJYeSy8c3d0Oi/Kn4Cm5bAoE6cFKUUbYSL1djNb3WFI00Iall+/ON4dImHUgdIFSvlNzvrAlEeUOvu1a7Rau4My0I5GzKeybjLoLLwc6U1UZFgqfnEMVpNhikopyBPWfkskXA0hy0WIx9ePArxduCds4Bhyk00x7WJLNWGiv4Xi7EShn8hbu3ThawnhChqPtsm3tLLWcB/pel47SgW+i8DUDp3fvziebIQ9pm3UwRw/yEil91wAPCn/x3mc7N658rueDWBl7emvlA3WrQdPqiPxGqUC/7S80ZVfTyvwCax8vVwBS4FA4W7dkbVq36IfMxBTqjUuL+xawBbHhXuLMYox8kEx32o6Bs3BAq63mpHl12MlOi7RLGwJLTUYWhz6d6615jLIO21Pck8FhhFYkDxqg7K8nOA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(366004)(396003)(136003)(376002)(39860400002)(186003)(6512007)(26005)(41300700001)(6506007)(83380400001)(6486002)(1076003)(478600001)(2616005)(6666004)(316002)(4326008)(8936002)(8676002)(7416002)(2906002)(82960400001)(5660300002)(38100700002)(86362001)(66556008)(66476007)(54906003)(66946007)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUpNa0lqTDAwNVQzVnFwZmlxclBoZ1ZiZmhQc2ZqdDhMTDFKWjJtNXBTclNY?=
 =?utf-8?B?K1NtUG1ZQ0tpN1hENWd0WTVVSFE1RXAwSEpLWDhIaE50NEdDUDBseWlkZFJa?=
 =?utf-8?B?aUY2cUZ6RDIzbldFS0EyK0d6dzhIWTROMzhvRG9MemNPWVlLL2RVQXJqcEV3?=
 =?utf-8?B?TUkvSWlnK0F1R2JrUTE2VjVpMlBkbkdtNy9CQlJKcU5QaktHVldqcVN4Q3R0?=
 =?utf-8?B?by9Xb2tyQkx6VDZYZTlUR21BT0wzeUVDR2xad0oxZlRUdmUrWmNjUkhzOFN4?=
 =?utf-8?B?bitCbko2K0hJVG5FRWF0OE8veUxvT3hwcVF1Yzhsd2h2dEhFTklUQ3YzUFRl?=
 =?utf-8?B?NGlEdjAyMysrL0FBQndrQVNxZW5SdVF2MXVIcUxkU3Vwb0JNYWtjUGkybnZa?=
 =?utf-8?B?c0ZjNFczZUpSTWd6YmpQUUdBYU1wakNoUkZjTkplSkh6M2FNaGp3Q1RqUjRt?=
 =?utf-8?B?N2JSQVE3LzFERG50cXJWTmdTd3RCU1M3WVpjQWkxRDNIZG92UmsyZE1XMEJp?=
 =?utf-8?B?VU5KVzhPM01La1Z2NWtGMEhaZXNuenN6UTFsVVFnWmdjc0ZVREY3NjE3K2Fr?=
 =?utf-8?B?MWxqMFZ6UFRZRVVpVVFTczlwZmMyS3M3eGxpYXRjYzM0K2NyZUJHMTlPZ2JH?=
 =?utf-8?B?THlBVXhlUThwMGZxYUVJSG12Mm9VUi9IcVFYN1NtNlo4RGJuQ3lyalVvWDk5?=
 =?utf-8?B?MkRZR2lPK0dyeXdJYnVIVzk5YXFuT0dwS1BLREJVbGNXdmNnZ0FJTjN4NUQ0?=
 =?utf-8?B?bVBuZ2F0V29xVnZqS05BMkxjdGNqdExtVmg5Q0s2Wm90azVWNGFseFNmWU9l?=
 =?utf-8?B?SlM1R0pOQ1JkdWtYOWo0UnhObHZ4SXk2WlZZRWRLYThROXJNSWNza2I0VkF0?=
 =?utf-8?B?UEcxamtqZG1ZZFVSZU5vc0VZYnlWK055QWlBUVlwcG5rNDlXS2E5b2hNOE1Q?=
 =?utf-8?B?N1F6UmROOGpXUGtHTEtRR0liU1FaZG4zZFAxSnRsOWduT2ZpWXpOeUxvb1J0?=
 =?utf-8?B?aEgrTVRRQmVIaDVJUE1td2FLemNVL3I3M1czK01RNzFVak9NRG82MitrWUgx?=
 =?utf-8?B?M3B2UHYvTHNOTG9vWlhwV05Bamc5NGZoV3JBRnMwaEJLYlRDTDRqQTIzQ29u?=
 =?utf-8?B?ZHBwcm5WY0FhREZzTmVZQzRnRmorZDIycG1FcVVzamdRMnpoSGcvdzJWQzYz?=
 =?utf-8?B?UVR0Mm15ZjYzRWlndC9pbU85ZmR0WVZZQmxDN0RENGtpQ0lEakIzdWFrSy9E?=
 =?utf-8?B?YUVIdnFmSFlYMmhWcDZLVnNreFQzbklKaDh4UzNrcVZtYnNBS1pVTVlFMmRz?=
 =?utf-8?B?MDczU2FITGo3RGJaWVp0YWVnRFFqWnBya3RlZi9rbUhNdnJiSWJJTFZSeEtY?=
 =?utf-8?B?OXZCUGJramo0NTVobHQ1cWcxbUxVMXhsTVA2N1hvR2JsRkl3OXBKMEhCNFhL?=
 =?utf-8?B?QVFzSmdTR2ZwQ0FrUnBMZWIvc21VNnNveHVSY3ZUUDVoTWQrMnk2blUvbVNY?=
 =?utf-8?B?TzlNSkxjMDNGalRyTTZ1WVJtditTNVVLSHNnVkcyQUFZWjcrRjhCUnJ2N3Vq?=
 =?utf-8?B?U28zVGlqZ25qL3JVQnJlaElHREt6WmgzUTlZMkcranMrOEVnc1FseGNOQmQ4?=
 =?utf-8?B?aUh6TTAzekRSalk4cXlyamtqRUU5UmNmSlU3ZGZpRmFGajQwcFZTNlNvNXBk?=
 =?utf-8?B?SVp0dE9iVVdyRWlOajhyT1JZV2Qxb04xOU1KMktBdGRrN21xOCtTQ2VxbXVh?=
 =?utf-8?B?MDRVT1F4YlBvUklXUmNmWWU4OHZybTlWWG9mS2FRb25SNFplZm1iQ0xXRy83?=
 =?utf-8?B?SloyVjZKNlBNQ2x5cUY0RWVpQ1NGMExVVm1UWkh4OEFMWUtYdXZJWldEWWF2?=
 =?utf-8?B?UmFUTVRTN0dXbEhCUklIMEFOd0NnaTA4K3Vzbjg5VXBBSlpsb0FSK09reEZ2?=
 =?utf-8?B?eUhLc0tObnRaSFZ1U3o0THRXNW9idHpXc2NjSTB2bzVPTEVUU3BrcEp4VWpR?=
 =?utf-8?B?WGNEck13M29qblBjOXFQbWV3bC8zcndEQ21IaXZ1ZVRKWnN5WWpMTmNCQk9v?=
 =?utf-8?B?R1dhYTRPWFdmWUoxR2NPNndVY0RRRmYxMGpBVHQ4ZGFtZlBnbUc1eVppWjZ2?=
 =?utf-8?B?UGhvcWx4YmE2YTVWYWFqRlFZVHV0Y05BNzN1TW90Wkh2bi9CSThvb0wxVTZh?=
 =?utf-8?B?UGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9324ec8c-1bae-4626-ea4d-08da943b01e4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2022 21:17:18.3044 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /p+2gu7tO/gOmcWpzcjrAwBNZfIAcozEUB179dWLw3BQOB66jRj54/pF9AGHXKXFBe41OXc3amiAS9Htu4CP1WGnOX4Bd/Bst1y8/5wcn10=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6065
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

Having a limit of 64 DRM devices is not good enough for modern world
where we have multi-GPU servers, SR-IOV virtual functions and virtual
devices used for testing.
Let's utilize full minor range for DRM devices.
To avoid regressing the existing userspace, we're still maintaining the
numbering scheme where 0-63 is used for primary, 64-127 is reserved
(formerly for control) and 128-191 is used for render.
For minors >= 192, we're allocating minors dynamically on a first-come,
first-served basis.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/drm_drv.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 61d24cdcd0f8..3718bd6bbef6 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -106,7 +106,8 @@ static void drm_minor_alloc_release(struct drm_device *dev, void *data)
 	xa_erase(&drm_minors_xa, minor->index);
 }
 
-#define DRM_MINOR_LIMIT(t) ({ typeof(t) _t = (t); XA_LIMIT(64 * _t, 64 * _t + 63); })
+#define DRM_LEGACY_MINOR_LIMIT(t) ({ typeof(t) _t = (t); XA_LIMIT(64 * _t, 64 * _t + 63); })
+#define DRM_MINOR_LIMIT XA_LIMIT(192, (1 << MINORBITS) - 1)
 
 static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
 {
@@ -120,7 +121,15 @@ static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
 	minor->type = type;
 	minor->dev = dev;
 
-	r = xa_alloc(&drm_minors_xa, &minor->index, NULL, DRM_MINOR_LIMIT(type), GFP_KERNEL);
+	/*
+	 * DRM used to support 64 devices, for backwards compatibility we need to maintain the
+	 * minor allocation scheme where minors 0-63 are primary nodes, 64-127 are control nodes,
+	 * and 128-191 are render nodes.
+	 * After reaching the limit, we're allocating minors dynamically - first-come, first-serve.
+	 */
+	r = xa_alloc(&drm_minors_xa, &minor->index, NULL, DRM_LEGACY_MINOR_LIMIT(type), GFP_KERNEL);
+	if (r == -EBUSY)
+		r = xa_alloc(&drm_minors_xa, &minor->index, NULL, DRM_MINOR_LIMIT, GFP_KERNEL);
 	if (r < 0)
 		return r;
 
-- 
2.37.3

