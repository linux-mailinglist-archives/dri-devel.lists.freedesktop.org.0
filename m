Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9CC7600F5
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 23:15:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC75210E35F;
	Mon, 24 Jul 2023 21:15:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E342110E35D;
 Mon, 24 Jul 2023 21:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690233325; x=1721769325;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=xxxbPCzILB+ORtjnLQS237W707qJrozmzmmQety2tGA=;
 b=V1u8+GLbEo5IetJRxYiyT2042MT+2frtHQ7zwSe7OM6bwUFpXs6T2tBP
 BMmHPPZicnIED45v0lmRTTBNjAG7TZkceHoNnCLv+gFgsn2ZE0zz8i6eF
 Vd+QvTw3Jd7XeFDgR+KKPjWOzXU8KI3b0QlLHlizNfsUTANmKIrc13Eyv
 hp3F+V7tWLP+t0A5CyMiyCWR8D49GaqCHdpP8L6pZGsQN+TjfVrXF85M7
 h+MajIrJFr5iDvdpidDamIhvMvymSk1Hv9oFoImYAhwaeyxl41rNajvLf
 a6G8U50rwLBNE/ZTulIHft7CaQxGO+MKLvnZh/M5xY2Hy7z30fmi4qX8X g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="347830085"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="347830085"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 14:15:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="719815887"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="719815887"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP; 24 Jul 2023 14:15:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 24 Jul 2023 14:15:24 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 24 Jul 2023 14:15:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 24 Jul 2023 14:15:23 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 24 Jul 2023 14:15:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FklTcyXx9LsfuaaPQ7vfSxDnpr2oc8PZvoYZgSkQGq+tfv0w8lQBxMy6J9DLVbWhmRRmak9o2Eysj3bU8v5I7F1iNoKI22A728XEheRnIig4t+Az70vp8cS5KSCn496l8WOg01ZmuNgbDShbJ7J4ItKYiUeBbNiTlN/gXrBwQCqzKCgnNuwC/PFN7ZA6vVL2ZIfgFY91qv6zj35rWTgnJVqKO9dMVpNNNBghch/ufl5swNpDjg45LGRP56Ej1rELLdPmwmiG7sbJnCWQ5SBBVXaH/kpYuR/78wwzMlvzHdQ8HSghQj8Qu5zA967nDxglb+8mg5ALYn6iZqTM5p6kDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+EA3oS/E2UCW5sP165cfWbyMjvpO7ndnK3w1c7wQzx4=;
 b=kcSw+Ub1h3Xc5edXbHAjgFw24vsnrZkEqHlEQW3VHWPedQ8azJ6/aKqsDbE58wEFo0mHHiUPwB7k66oJlZjXKPCnxmYgDDLw3ogpaBPmfiq9ZuttJld4t00Ctg8ing0URxd3atUG5S1z5VbtnRtpd4XUz6GnSbyc+QAVJwHvnbwQVuYazJ4Msy6H7HyICboGpFbvKDFMH7iiSHDVWxszTPd4kAaYd5g14TB18vd7h7YJ16lw3TVC382pJPnta1fsG6iITJj6MEiWePaZ5YdLJ9A9iX4kHqjv9uTlWgu6GT0m2G4WC9ltxA9HCYMMvRMyQx+A+EviVSSvAvRLijsEqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MW5PR11MB5809.namprd11.prod.outlook.com (2603:10b6:303:197::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6609.32; Mon, 24 Jul 2023 21:15:20 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::1127:c109:d888:f6d1]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::1127:c109:d888:f6d1%5]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 21:15:20 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v6 2/4] accel: Use XArray instead of IDR for minors
Date: Mon, 24 Jul 2023 23:14:26 +0200
Message-ID: <20230724211428.3831636-3-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230724211428.3831636-1-michal.winiarski@intel.com>
References: <20230724211428.3831636-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::13) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|MW5PR11MB5809:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f495a29-fec7-4165-8fd7-08db8c8b1642
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JHSnb+Gf3K2so5Ct2tasrkBwUmDOGKeuI7lGA7vCloJJ30oQNG6kFLK0UmIO+7U7nD6oAgbcuYw2p+60AHd9awkuUqqR8YIntKNpD4DBio7v+lI/3hAnEpbvnfWxxoS3ODW+WXQbzeQlN0m62RrjkqbC0UPbHCkMpclc7LTDotlWhFIMOgpJGqeDu9GiKqd+g+88aVa+wAUS3sWyILklVclH7WVeiedX3R1GTw9kUg1LZ2aQXioq2SACfEUIOwmEHpwi9NqSIrxJY13MyCA1iUXT/NITnRsgcbWl4wUNiDjCzbffniyhUbU+SRIkz+qQlgdUNLhPegylmD0cyqaBNsMviWEmRSQBk4hHaWqlxplcoS/zE0QEVgHNtNMAQI/J81WMgZEO5PK3XG2EkdSjv3gW15ChW9TEHGBpWHn/0lCQPjKJuLjsSsdfjELA7IzSOO85SnvXf4ILd7aXrmvSdGyHHZShkY5QF6L3ZmkGopo833iTg4de66zFAoFQPaH8EPTODV/owlMFL7KR3NXj5JFMRzR2qkJ5YpDXw3jE+GCXK1FHApI09LYDFCkjErQB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(376002)(39860400002)(396003)(366004)(451199021)(83380400001)(38100700002)(36756003)(82960400001)(86362001)(54906003)(30864003)(2906002)(186003)(6506007)(1076003)(26005)(6512007)(6486002)(8936002)(5660300002)(8676002)(7416002)(478600001)(316002)(41300700001)(66476007)(66946007)(66556008)(4326008)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2pNbXB3emw0akFYekpQaFBpSWV0U3NEL2NKUkdtNXMzNGlGbUlYOHkxVU5v?=
 =?utf-8?B?ZDhZQzFYT0I4akY2eDBzSDdBb3ByejRvQkJvTUNuSi9FalBpQllDUXh1b0Jt?=
 =?utf-8?B?K1g4ZDk2Qmczcm9Sekx3aDFhbUVmbTd0cXcrSjdMWVNaOE91b2JmSXJJWUll?=
 =?utf-8?B?OVducEw4SVBLUElSWkJWNlcxNHdSeFBGNjRwQVZzaTZ1SVBhd1dyNXVSY0NK?=
 =?utf-8?B?NExoZS8wdFBPZ0thOW14Rml0aVFVMzExSDZaNEpBQVNpWnRiQ2lFV2RSNTQ1?=
 =?utf-8?B?Y1JQSGJDWkVpZEhCbmNXdFc5M1NXUzM0T2tlQlJtZDE5VVREYVNhRFI4K01B?=
 =?utf-8?B?c0svTlVSME85dlVzZEJXQzY0VzVnbFZVZVlOOUN0bTdVR2RtcVEzbEdOL0d6?=
 =?utf-8?B?aVdQZlN0V2dlUUgyZ20yY09HKzd5b3VKVmdsY0Z6TEtuVEw3disrNzJiTmdk?=
 =?utf-8?B?K3lmR0FQVkIxc1pPRTNpRkN6c3E4b044N0w4Wk0vTGUyT3RGNk43ZCsxaXFx?=
 =?utf-8?B?djhtc2lyWWtJSS9Yc21iNGJoQStyWkFEdHJuV1dNelUxcllYT08yMmROR1dq?=
 =?utf-8?B?bEJUQXJXa2N1WDVNM3dmc1hpL0x0Zjk5QzJBSWZmd2dUNzhvcEhqRWhqblZH?=
 =?utf-8?B?ejRKcjBBKzhuUmtLcVhSWEp0SjR6MGExQndvMkpqMFZuQytPZ2NMb0M3RXN6?=
 =?utf-8?B?YWErNVlZdHNBVDNwSlRSRStoWkQ3SW5iMWhReGlBTEFoL1l1R1NZLzlyNmZy?=
 =?utf-8?B?UTBmNm9HSVhKeUFwK1l3eWxjMUJmWGo3THVnQVZ1TmFES1JPdnJpY0hLS1Zp?=
 =?utf-8?B?a2RldjdrWW53STN0M2R3MitseXJyYmd4Z09vRld1eXpWOFRVYm15ajQ5ZTli?=
 =?utf-8?B?YlBuWWRWWHc4dEcxYVFWSFB5S1owNElTZHBIYXZ0Y2JvMzhSOWM5citRUmdi?=
 =?utf-8?B?YlNFdFI1bEpDYXEyeG93Q1JOUXl0ZmxzRllWSm5zcmJXQ1Y4Ulcrei9mOTNl?=
 =?utf-8?B?OHJkYVplcDdjN0c3L1Vib2xCKzJvWm1NNzVSaDdGZEhrK2JzTE5VWlVaZ3JO?=
 =?utf-8?B?RWZXR0hwRFRCbit5SGtVeW9RZlVROFFDS2N2amtlbFA2TTg3bFVRaFZyaGFU?=
 =?utf-8?B?U1Q4eDY1WTVMU3VoYXRpM1E3a3FyVEhNNVY0UUNidzRrUGMvcXpsN25aQmtI?=
 =?utf-8?B?MkkzZFUwV3RSS1p1RkYxRDBuMjEydGc2WmwzU2ZLTWwyUnhIUGt4czhUUVV4?=
 =?utf-8?B?eVVQZG84N1RHenZlUkEvaEhrcUw3NVVsWjN1cFJXbWtOdGtqY0J6TG4rdWlF?=
 =?utf-8?B?bHNicXJkbjB3VXJPKzJQdzRDSTFLUWw3VEYyU3BLbEZWM1dHQTRYWDArdlhG?=
 =?utf-8?B?YjVIaUd6dzNiUTZqVjNsR0Vxd3ZRQ1BubFBlWDc0NUlJaEdRazRzRnhnT3dJ?=
 =?utf-8?B?YjZ0VUZsR2diK254Y3A5eGsxZml3S1dVeFRZbUxFd0wwZExLWGl6OTlXVDhx?=
 =?utf-8?B?QkJWWXRKWWR4bUlKWEVWS21hdmNSbDFXcExsRVp0TThhS3hnS3pvYmFOcHlC?=
 =?utf-8?B?eXIrdktnTVZyUm1VaDZabm1ydUtUZExHZlRNVUlWUTFGSkxrcEhFb0JBQUVF?=
 =?utf-8?B?dGNsWFl2T3QvVC8zZ05MSTNCVHhKNzVwTXQ0UHNuVWtoU3lGaDdhcXY1ei9v?=
 =?utf-8?B?VmpkYWNYMUhnVnNsdllFSTRNNmRPOGlrR2hpQUduQ0tsYTArRHNSUkhDczVz?=
 =?utf-8?B?ZlE2N0d3eGFzNUhiV1RDbWJTU09PNFdsY28xdlRNY2FKdjdFZWpkWHlmV1Vi?=
 =?utf-8?B?K1Rtcm44REVnSlN2bHpPRTB5QkFoWktDN1ZZRHRPVXJNMVpDTVFMSExVT0JD?=
 =?utf-8?B?R2ZkU00vZ1Y4bldNdXJDQWRCSXJZeTZiVGtPL0Q5L29wZy90dDlyNUJLUk1n?=
 =?utf-8?B?V0c0ejhqYlhIbkFkOU12TVZ1azUrSGUyWWVqZEVMZ1VkWFpyTjJON2ZyT2N2?=
 =?utf-8?B?RmtiamN0OGxBUkkvQ09xTnNWUnpQeEsyNEVGYmNmUzFZajkvaW4yZlpzTFdF?=
 =?utf-8?B?dGY3d1I4V1dTVXhNZUQ4anJ3dmhkVkRSRFY0Uk5PVFpRU3pVSFJobVRuMTVr?=
 =?utf-8?B?OUVUR3dCazN6czN1cTNSTlJ2NitjcVkrTS83eDhsNzFZK0dTaW5pcGE0Tk5Z?=
 =?utf-8?B?ZXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f495a29-fec7-4165-8fd7-08db8c8b1642
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 21:15:20.7168 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7MrdX5LpfXpd9nKQtAfBUegXyfO18W3Pf/WUyKVmR9DUol+giVARQwjutK059Q9kflDT0uhymK6iydkOsoNL7ItQU2DIRL1ygsoGatS+dUo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5809
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 David Airlie <airlied@linux.ie>, Oded Gabbay <ogabbay@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Emil Velikov <emil.l.velikov@gmail.com>,
 Matthew Wilcox <willy@infradead.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 James Zhu <James.Zhu@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Accel minor management is based on DRM (and is also using struct
drm_minor internally), since DRM is using XArray for minors, it makes
sense to also convert accel.
As the two implementations are identical (only difference being the
underlying xarray), move the accel_minor_* functionality to DRM.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/accel/drm_accel.c      | 110 +++------------------------------
 drivers/gpu/drm/drm_drv.c      |  66 ++++++++++----------
 drivers/gpu/drm/drm_file.c     |   2 +-
 drivers/gpu/drm/drm_internal.h |   4 --
 include/drm/drm_accel.h        |  18 +-----
 include/drm/drm_file.h         |   5 ++
 6 files changed, 47 insertions(+), 158 deletions(-)

diff --git a/drivers/accel/drm_accel.c b/drivers/accel/drm_accel.c
index 4a9baf02439e..8827cb78ca9d 100644
--- a/drivers/accel/drm_accel.c
+++ b/drivers/accel/drm_accel.c
@@ -8,7 +8,7 @@
 
 #include <linux/debugfs.h>
 #include <linux/device.h>
-#include <linux/idr.h>
+#include <linux/xarray.h>
 
 #include <drm/drm_accel.h>
 #include <drm/drm_debugfs.h>
@@ -17,8 +17,7 @@
 #include <drm/drm_ioctl.h>
 #include <drm/drm_print.h>
 
-static DEFINE_SPINLOCK(accel_minor_lock);
-static struct idr accel_minors_idr;
+DEFINE_XARRAY_ALLOC(accel_minors_xa);
 
 static struct dentry *accel_debugfs_root;
 static struct class *accel_class;
@@ -120,99 +119,6 @@ void accel_set_device_instance_params(struct device *kdev, int index)
 	kdev->type = &accel_sysfs_device_minor;
 }
 
-/**
- * accel_minor_alloc() - Allocates a new accel minor
- *
- * This function access the accel minors idr and allocates from it
- * a new id to represent a new accel minor
- *
- * Return: A new id on success or error code in case idr_alloc failed
- */
-int accel_minor_alloc(void)
-{
-	unsigned long flags;
-	int r;
-
-	spin_lock_irqsave(&accel_minor_lock, flags);
-	r = idr_alloc(&accel_minors_idr, NULL, 0, ACCEL_MAX_MINORS, GFP_NOWAIT);
-	spin_unlock_irqrestore(&accel_minor_lock, flags);
-
-	return r;
-}
-
-/**
- * accel_minor_remove() - Remove an accel minor
- * @index: The minor id to remove.
- *
- * This function access the accel minors idr and removes from
- * it the member with the id that is passed to this function.
- */
-void accel_minor_remove(int index)
-{
-	unsigned long flags;
-
-	spin_lock_irqsave(&accel_minor_lock, flags);
-	idr_remove(&accel_minors_idr, index);
-	spin_unlock_irqrestore(&accel_minor_lock, flags);
-}
-
-/**
- * accel_minor_replace() - Replace minor pointer in accel minors idr.
- * @minor: Pointer to the new minor.
- * @index: The minor id to replace.
- *
- * This function access the accel minors idr structure and replaces the pointer
- * that is associated with an existing id. Because the minor pointer can be
- * NULL, we need to explicitly pass the index.
- *
- * Return: 0 for success, negative value for error
- */
-void accel_minor_replace(struct drm_minor *minor, int index)
-{
-	unsigned long flags;
-
-	spin_lock_irqsave(&accel_minor_lock, flags);
-	idr_replace(&accel_minors_idr, minor, index);
-	spin_unlock_irqrestore(&accel_minor_lock, flags);
-}
-
-/*
- * Looks up the given minor-ID and returns the respective DRM-minor object. The
- * refence-count of the underlying device is increased so you must release this
- * object with accel_minor_release().
- *
- * The object can be only a drm_minor that represents an accel device.
- *
- * As long as you hold this minor, it is guaranteed that the object and the
- * minor->dev pointer will stay valid! However, the device may get unplugged and
- * unregistered while you hold the minor.
- */
-static struct drm_minor *accel_minor_acquire(unsigned int minor_id)
-{
-	struct drm_minor *minor;
-	unsigned long flags;
-
-	spin_lock_irqsave(&accel_minor_lock, flags);
-	minor = idr_find(&accel_minors_idr, minor_id);
-	if (minor)
-		drm_dev_get(minor->dev);
-	spin_unlock_irqrestore(&accel_minor_lock, flags);
-
-	if (!minor) {
-		return ERR_PTR(-ENODEV);
-	} else if (drm_dev_is_unplugged(minor->dev)) {
-		drm_dev_put(minor->dev);
-		return ERR_PTR(-ENODEV);
-	}
-
-	return minor;
-}
-
-static void accel_minor_release(struct drm_minor *minor)
-{
-	drm_dev_put(minor->dev);
-}
-
 /**
  * accel_open - open method for ACCEL file
  * @inode: device inode
@@ -230,7 +136,7 @@ int accel_open(struct inode *inode, struct file *filp)
 	struct drm_minor *minor;
 	int retcode;
 
-	minor = accel_minor_acquire(iminor(inode));
+	minor = drm_minor_acquire(&accel_minors_xa, iminor(inode));
 	if (IS_ERR(minor))
 		return PTR_ERR(minor);
 
@@ -249,7 +155,7 @@ int accel_open(struct inode *inode, struct file *filp)
 
 err_undo:
 	atomic_dec(&dev->open_count);
-	accel_minor_release(minor);
+	drm_minor_release(minor);
 	return retcode;
 }
 EXPORT_SYMBOL_GPL(accel_open);
@@ -260,7 +166,7 @@ static int accel_stub_open(struct inode *inode, struct file *filp)
 	struct drm_minor *minor;
 	int err;
 
-	minor = accel_minor_acquire(iminor(inode));
+	minor = drm_minor_acquire(&accel_minors_xa, iminor(inode));
 	if (IS_ERR(minor))
 		return PTR_ERR(minor);
 
@@ -277,7 +183,7 @@ static int accel_stub_open(struct inode *inode, struct file *filp)
 		err = 0;
 
 out:
-	accel_minor_release(minor);
+	drm_minor_release(minor);
 
 	return err;
 }
@@ -293,15 +199,13 @@ void accel_core_exit(void)
 	unregister_chrdev(ACCEL_MAJOR, "accel");
 	debugfs_remove(accel_debugfs_root);
 	accel_sysfs_destroy();
-	idr_destroy(&accel_minors_idr);
+	WARN_ON(!xa_empty(&accel_minors_xa));
 }
 
 int __init accel_core_init(void)
 {
 	int ret;
 
-	idr_init(&accel_minors_idr);
-
 	ret = accel_sysfs_init();
 	if (ret < 0) {
 		DRM_ERROR("Cannot create ACCEL class: %d\n", ret);
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 3faecb01186f..34b60196c443 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -55,7 +55,7 @@ MODULE_AUTHOR("Gareth Hughes, Leif Delgass, José Fonseca, Jon Smirl");
 MODULE_DESCRIPTION("DRM shared core routines");
 MODULE_LICENSE("GPL and additional rights");
 
-static DEFINE_XARRAY_ALLOC(drm_minors_xa);
+DEFINE_XARRAY_ALLOC(drm_minors_xa);
 
 /*
  * If the drm core fails to init for whatever reason,
@@ -83,6 +83,18 @@ DEFINE_STATIC_SRCU(drm_unplug_srcu);
  * registered and unregistered dynamically according to device-state.
  */
 
+static struct xarray *drm_minor_get_xa(enum drm_minor_type type)
+{
+	if (type == DRM_MINOR_PRIMARY || type == DRM_MINOR_RENDER)
+		return &drm_minors_xa;
+#if IS_ENABLED(CONFIG_DRM_ACCEL)
+	else if (type == DRM_MINOR_ACCEL)
+		return &accel_minors_xa;
+#endif
+	else
+		return ERR_PTR(-EOPNOTSUPP);
+}
+
 static struct drm_minor **drm_minor_get_slot(struct drm_device *dev,
 					     enum drm_minor_type type)
 {
@@ -106,18 +118,18 @@ static void drm_minor_alloc_release(struct drm_device *dev, void *data)
 
 	put_device(minor->kdev);
 
-	if (minor->type == DRM_MINOR_ACCEL)
-		accel_minor_remove(minor->index);
-	else
-		xa_erase(&drm_minors_xa, minor->index);
+	xa_erase(drm_minor_get_xa(minor->type), minor->index);
 }
 
-#define DRM_MINOR_LIMIT(t) ({ typeof(t) _t = (t); XA_LIMIT(64 * _t, 64 * _t + 63); })
+#define DRM_MINOR_LIMIT(t) ({ \
+	typeof(t) _t = (t); \
+	_t == DRM_MINOR_ACCEL ? XA_LIMIT(0, ACCEL_MAX_MINORS) : XA_LIMIT(64 * _t, 64 * _t + 63); \
+})
 
 static int drm_minor_alloc(struct drm_device *dev, enum drm_minor_type type)
 {
 	struct drm_minor *minor;
-	int index, r;
+	int r;
 
 	minor = drmm_kzalloc(dev, sizeof(*minor), GFP_KERNEL);
 	if (!minor)
@@ -126,18 +138,11 @@ static int drm_minor_alloc(struct drm_device *dev, enum drm_minor_type type)
 	minor->type = type;
 	minor->dev = dev;
 
-	if (type == DRM_MINOR_ACCEL) {
-		r = accel_minor_alloc();
-		index = r;
-	} else {
-		r = xa_alloc(&drm_minors_xa, &index, NULL, DRM_MINOR_LIMIT(type), GFP_KERNEL);
-	}
-
+	r = xa_alloc(drm_minor_get_xa(type), &minor->index,
+		     NULL, DRM_MINOR_LIMIT(type), GFP_KERNEL);
 	if (r < 0)
 		return r;
 
-	minor->index = index;
-
 	r = drmm_add_action_or_reset(dev, drm_minor_alloc_release, minor);
 	if (r)
 		return r;
@@ -177,16 +182,12 @@ static int drm_minor_register(struct drm_device *dev, enum drm_minor_type type)
 		goto err_debugfs;
 
 	/* replace NULL with @minor so lookups will succeed from now on */
-	if (minor->type == DRM_MINOR_ACCEL) {
-		accel_minor_replace(minor, minor->index);
-	} else {
-		entry = xa_store(&drm_minors_xa, minor->index, minor, GFP_KERNEL);
-		if (xa_is_err(entry)) {
-			ret = xa_err(entry);
-			goto err_debugfs;
-		}
-		WARN_ON(entry);
+	entry = xa_store(drm_minor_get_xa(type), minor->index, minor, GFP_KERNEL);
+	if (xa_is_err(entry)) {
+		ret = xa_err(entry);
+		goto err_debugfs;
 	}
+	WARN_ON(entry);
 
 	DRM_DEBUG("new minor registered %d\n", minor->index);
 	return 0;
@@ -205,10 +206,7 @@ static void drm_minor_unregister(struct drm_device *dev, enum drm_minor_type typ
 		return;
 
 	/* replace @minor with NULL so lookups will fail from now on */
-	if (minor->type == DRM_MINOR_ACCEL)
-		accel_minor_replace(NULL, minor->index);
-	else
-		xa_store(&drm_minors_xa, minor->index, NULL, GFP_KERNEL);
+	xa_store(drm_minor_get_xa(type), minor->index, NULL, GFP_KERNEL);
 
 	device_del(minor->kdev);
 	dev_set_drvdata(minor->kdev, NULL); /* safety belt */
@@ -224,15 +222,15 @@ static void drm_minor_unregister(struct drm_device *dev, enum drm_minor_type typ
  * minor->dev pointer will stay valid! However, the device may get unplugged and
  * unregistered while you hold the minor.
  */
-struct drm_minor *drm_minor_acquire(unsigned int minor_id)
+struct drm_minor *drm_minor_acquire(struct xarray *minor_xa, unsigned int minor_id)
 {
 	struct drm_minor *minor;
 
-	xa_lock(&drm_minors_xa);
-	minor = xa_load(&drm_minors_xa, minor_id);
+	xa_lock(minor_xa);
+	minor = xa_load(minor_xa, minor_id);
 	if (minor)
 		drm_dev_get(minor->dev);
-	xa_unlock(&drm_minors_xa);
+	xa_unlock(minor_xa);
 
 	if (!minor) {
 		return ERR_PTR(-ENODEV);
@@ -1020,7 +1018,7 @@ static int drm_stub_open(struct inode *inode, struct file *filp)
 
 	DRM_DEBUG("\n");
 
-	minor = drm_minor_acquire(iminor(inode));
+	minor = drm_minor_acquire(&drm_minors_xa, iminor(inode));
 	if (IS_ERR(minor))
 		return PTR_ERR(minor);
 
diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 883d83bc0e3d..20c9afe0f5a5 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -413,7 +413,7 @@ int drm_open(struct inode *inode, struct file *filp)
 	int retcode;
 	int need_setup = 0;
 
-	minor = drm_minor_acquire(iminor(inode));
+	minor = drm_minor_acquire(&drm_minors_xa, iminor(inode));
 	if (IS_ERR(minor))
 		return PTR_ERR(minor);
 
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index d7e023bbb0d5..cb46f4c61991 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -77,10 +77,6 @@ void drm_prime_destroy_file_private(struct drm_prime_file_private *prime_fpriv);
 void drm_prime_remove_buf_handle(struct drm_prime_file_private *prime_fpriv,
 				 uint32_t handle);
 
-/* drm_drv.c */
-struct drm_minor *drm_minor_acquire(unsigned int minor_id);
-void drm_minor_release(struct drm_minor *minor);
-
 /* drm_managed.c */
 void drm_managed_release(struct drm_device *dev);
 void drmm_add_final_kfree(struct drm_device *dev, void *container);
diff --git a/include/drm/drm_accel.h b/include/drm/drm_accel.h
index d4955062c77e..f93e23985f4e 100644
--- a/include/drm/drm_accel.h
+++ b/include/drm/drm_accel.h
@@ -51,11 +51,10 @@
 
 #if IS_ENABLED(CONFIG_DRM_ACCEL)
 
+extern struct xarray accel_minors_xa;
+
 void accel_core_exit(void);
 int accel_core_init(void);
-void accel_minor_remove(int index);
-int accel_minor_alloc(void);
-void accel_minor_replace(struct drm_minor *minor, int index);
 void accel_set_device_instance_params(struct device *kdev, int index);
 int accel_open(struct inode *inode, struct file *filp);
 void accel_debugfs_init(struct drm_minor *minor, int minor_id);
@@ -72,19 +71,6 @@ static inline int __init accel_core_init(void)
 	return 0;
 }
 
-static inline void accel_minor_remove(int index)
-{
-}
-
-static inline int accel_minor_alloc(void)
-{
-	return -EOPNOTSUPP;
-}
-
-static inline void accel_minor_replace(struct drm_minor *minor, int index)
-{
-}
-
 static inline void accel_set_device_instance_params(struct device *kdev, int index)
 {
 }
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index 010239392adf..7fc09460051f 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -45,6 +45,8 @@ struct drm_printer;
 struct device;
 struct file;
 
+extern struct xarray drm_minors_xa;
+
 /*
  * FIXME: Not sure we want to have drm_minor here in the end, but to avoid
  * header include loops we need it here for now.
@@ -420,6 +422,9 @@ static inline bool drm_is_accel_client(const struct drm_file *file_priv)
 	return file_priv->minor->type == DRM_MINOR_ACCEL;
 }
 
+struct drm_minor *drm_minor_acquire(struct xarray *minors_xa, unsigned int minor_id);
+void drm_minor_release(struct drm_minor *minor);
+
 int drm_open(struct inode *inode, struct file *filp);
 int drm_open_helper(struct file *filp, struct drm_minor *minor);
 ssize_t drm_read(struct file *filp, char __user *buffer,
-- 
2.41.0

