Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 382AC59EDFC
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 23:07:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4483210FA0B;
	Tue, 23 Aug 2022 21:07:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DD9410F9E0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 21:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661288802; x=1692824802;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=KujRH62m/y9LLjIm7A/+vANhJ+0dH40vHXOXMFuACs4=;
 b=TtH8aTSCxkh0Xpfk70hFW6WJl/ENatO3n4fPGEAOF2b2w3rY7X2eKM4R
 vjxq7OgKAXeEtjoCVKsLC3IRj0ERxPSlIVdZ7e2fRoWorg6/Ke0A6Gq5x
 Z/QVMU3SPJpGmmNSWm35ZEHopA082JS8KuIia/T6aXUCjJGp6x5dK8Ln4
 ERtga+m54hEFtka9u9aTvdQwLTa312E37Dy/Ja18kr30zznjw+9vvbtjd
 1IyGxyfP07/VRj6HQW5dBeE7D5jxE8cLfdQr/c80Us1+Ffiodk6ln27ds
 Qm21QQC8ddFt7SwfiKDOr8/YCYHNZO0vBnh52HA+BDY+FAi7v4cn6TY1T Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10448"; a="293795846"
X-IronPort-AV: E=Sophos;i="5.93,258,1654585200"; d="scan'208";a="293795846"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2022 14:06:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,258,1654585200"; d="scan'208";a="785385316"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP; 23 Aug 2022 14:06:40 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 23 Aug 2022 14:06:40 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 23 Aug 2022 14:06:40 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 23 Aug 2022 14:06:40 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 23 Aug 2022 14:06:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ecI0bbsZlUlnb610N0x8j2ku1v7tXsyjuI66wi65vYVO+AFUX9a/w/NMHoDpjUr7FYxh/n8E5Vqw9zGjd+GpCCGOiFYWTeJRiwKRqDnKBQ82exO3ww4s2ZAAtJDi7eysRa+AKRGW6bvcXaX5q5PCRikuYv3RYym6XEvyHWhxyxWSKtu7glFDZaZ5dHnX+e/X3jpi1Jg4UqXJzsUEoEVHx9Y0imhOY/ResilIkdoyyoOGSrRnccu9L7OUcAqxXJNsv9hGiIlueaeQMNeym7C1IQF0J9NtJA0e0aYGK0lI1DjGAAviUSBtBN2q0GkIailx1c139PvcXL9vNouvT5POkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HHA4YXLTcRGi3zUCW+loQ82S4zIbXMM0MC4Hb1DVpDQ=;
 b=H9Lf31xlzGL72D6CcJlVk1vrb2f5tqIvVFzZmvONcRZDrfju/WKMvawauHSEosS8NereXbwKAddF4ny2/BFtPnMjXTf/bNUWO/X07/ec5sXsGyasBcyeGbf7M3NcAoQ90Dkrwy9cE7pXY0uhs0OERy0RQeiTA2gBOFAteARUIKCgUvAaq79w2dxChJtSGwhltr7N8rqVmb8FInq2ono1/3SXk8scXDa4/h3SX5SDuSXRkq6WyJTyCbmOX3UOSrV82aqCXjtZgIAF1WwT0vuGlTfaN/k6AWGx8ON8iPtgEs0hPWQXuE053l4SgrUQZsmURkeJ8J9h+wdbDQQVAawt5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SA2PR11MB5130.namprd11.prod.outlook.com (2603:10b6:806:11d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Tue, 23 Aug
 2022 21:06:38 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e%9]) with mapi id 15.20.5566.014; Tue, 23 Aug 2022
 21:06:37 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 2/2] drm: Use mutex for minors
Date: Tue, 23 Aug 2022 23:06:12 +0200
Message-ID: <20220823210612.296922-3-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220823210612.296922-1-michal.winiarski@intel.com>
References: <20220823210612.296922-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0130.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::17) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4faab57-ee35-4600-7ec9-08da854b5e40
X-MS-TrafficTypeDiagnostic: SA2PR11MB5130:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FnUEiFP3tjSLTxtan/8I8PoWCEZ3m1z4/EazfhmDVxpw0cvlgPDJzNlSoCfZ4uuQzNzPkPn8kc+RuwOYgaKxDZCoyXlBeKmcfiTkZ6a6qxNcmXlv5ZFhyaRiLfO05Z5HoTsrhZhT8fTxQhmnCkKupMYwaltXGj91P9hvhY065dJzoOrueiT+wIX0AlgqM/qCp83qG4mhFTyH8ODCf1DR41lQT3/YkESSnfqPY3uauqPtkplnHCKycGWv3c8GX/gtRmyFIDwzOXENnNIVb8sLCdZjdfiEJHPucRGLIyywgiMKoT/BuNDLMc48w80o65uUMbK+m+D51YozQqXS5jSLdnG00TrbD8YQWr45k1Dssusxzm2ZJHhViAfG0XZUXKsxe/u1SlwNdKhu8bsq/Q6C8AnnWdDFtzH1uKYWHh5wqlCwMb5MgLaqFD8wjDI+BTRSIVqiS9RHAq6E8ZKy4HAgY/1+U8uTUlGvj0XtKCScHSP0DWYAuzLiG9EccIoDCkLi0OAtnjssqU5yE7RoZJEQG5eTlD+UTiGix0e5LC2quI9j6rDg2hG3gnnE6OtaHC6sdo51COWrlEL3UAwd0QtHRjpdqBAZIeVG877AMyZNRkZUYHoVBXqTwxtkYOPj9BhgrbpwQMVX6vUaRWfr9KEChNdYc5+IJeiDu/LnT90QaTi6MaCCvH7IF4xll0UrHYG+M5IZLXk8myhjg7NQLwX+HQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(39860400002)(136003)(346002)(366004)(396003)(6512007)(6666004)(5660300002)(186003)(1076003)(6506007)(2616005)(8936002)(36756003)(26005)(86362001)(41300700001)(83380400001)(478600001)(6486002)(38100700002)(82960400001)(6916009)(316002)(54906003)(2906002)(4326008)(66476007)(66556008)(66946007)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDVQOVZucDlkYjhXazNET0IwcUhoakxOcUNtTlcwVFBhdHlvL3l0Q2dFaWJX?=
 =?utf-8?B?TFZmNENPMFRYUWJvM1JKcDgwc0hVMDVza0pyK1NiV0JVMHBVZkpKTXBGMHVJ?=
 =?utf-8?B?aDlwNllQalZyM2RRZTk3UURUcHJYamdmTTdqOWRsaFA5SHp6TE4wTnROMURr?=
 =?utf-8?B?VEFkcG40N3JrbCtFSmJzWndHc0ZUcHlYcEd0Q2w5b3JKVW8xUmc5amIyNndB?=
 =?utf-8?B?cDdUSHUzYldpUG5XTGRCOTJyT2dlTmxQT0xvMDZsbTZzMy9acTh6a1JPelho?=
 =?utf-8?B?Qm95WGhMdFFlb0dma3RadGZwT0htWGZ4Z0hPTEU4UXhvNytoUnh2MnZ4OFhV?=
 =?utf-8?B?ZE0wd0dRY0gzMDE5OTFqZDZpcm1KakNkQmUyQ29PTjJUV083UTJQb2Evdis3?=
 =?utf-8?B?TzZsUlMxNzVRUklQbm1oU3dmUmtmMlpPdUlJVWxNbVYvZWFkazNWdkxIMTBL?=
 =?utf-8?B?U3o4RFNsWEpKMmc5N3E2YXhSd3dQcGVEanhvdE9ZZG51OU1VS2Y0U3hqT2xN?=
 =?utf-8?B?NDlHNVIzeStDU0FRdFc5TzB3R0xCTDQveFk5YWhUQSt6Nlhtb1ZibjArSGRz?=
 =?utf-8?B?RjgyMFFwbTdTZkoyTFBwQ0wweXZSMktkM0hDaHBrLzBObGhBK1hiSGI0NmlP?=
 =?utf-8?B?NTRBTGNJUXYxd3M4anhaeW5QQ25sLzV1QUZGT1dyYlc2NWhrTE80KzQwblh4?=
 =?utf-8?B?bE9za1VmMHdjSUtSeU5vRGtwYVFYSVc5Y3RtMks0TTB0RTROK1E2MCtkdFIy?=
 =?utf-8?B?eUpXbzZEeTF5UXBxb3JEQ2FvQ1c2M0ZLQTVTM01lRkFKWVJ5Znc2anI4WjBM?=
 =?utf-8?B?UDE0NkY5eloxSDVITEhLL1RYOTZzNjZqbkJWYW1mVjJ3dkx5Y0FVbCtHVXVN?=
 =?utf-8?B?VWJDY0UrNGRmd2VBbjRQS3hISDRjZE9OMU5jYUVSMWtoejdYbkRjTTFwOFNp?=
 =?utf-8?B?UkFHNTFhRit1NDZQNU5zSFFCTzNicGlwdUJ1dVAzWlhLaFZ2RGdEbjY1THhh?=
 =?utf-8?B?c1FzZ3dtcUtWNnRLbWFUblpWUDdZMFFpc1dTV2d2V010aXRDRVQ2R1pqM3Q3?=
 =?utf-8?B?bDhvcStPZ2xmZnlxRUtsSGcvRXVlQVJpTGd5bVpOMUVvNHRqMHZMbmNPUHpx?=
 =?utf-8?B?UTBaZlA2dGpZak0xVWJoU3N4ZGZYRkd4RjNKak5NSTVVNEFpVjlDaVV5RXVp?=
 =?utf-8?B?Qm5lOXlzd2NmdnljSGpaMkUwWk1GeUxWMGlMaUgzTjJ1TFZJTVB2czNNRVMv?=
 =?utf-8?B?QWdIUk9HT3dTUEV3R0hQK2k2SjZZTUxoMmJTYmozcjAxK1hLcFVvaWdTcDh1?=
 =?utf-8?B?dHRhdGhmdys1dUJaS0tGckFkSVVuVnJDSFA5d2d2bnZRRkMvdzRUQjFva1dT?=
 =?utf-8?B?VjFXVmNkNEZTbm43VFpFUEdGbmM0OFNOWmxGdVpUN3NwZ1FyYmQ0a3VSSHVU?=
 =?utf-8?B?Sng3QlE5RmI2cmVsTitzQXpPL3pUWUJEVVVodlFhQTNQcUhkTlVmeEhScGQy?=
 =?utf-8?B?SkdBeXliZCt4a2hpTHJuczZOZWw0YXhVRjZQTUhRQjB3d2pCaE1kUHFUMFFT?=
 =?utf-8?B?c2hSUFdDZW56VFZsYmJ3TkRMMHpycGROSVRJd1FZekdYbXg0MXFsczhLTXk5?=
 =?utf-8?B?dm5FZVhwUTNWU2pOaWZGZ0hVc21uY0pqelV1MnpwUUVvNnFRU0ltOG53bVg4?=
 =?utf-8?B?SVVodWhjSE01ZEdOenM2NVoyb1Q4QkkrT0lYZ0k3UWFiN0xqZ0l4WXJhandN?=
 =?utf-8?B?d0RZZ1dFbkN3Sll3QlU5ZmJucTRBVWVNR0Q1KzY3RE50NkRxNjNBeUZuNXA0?=
 =?utf-8?B?ZTA1eEVkYU5za3lJS2lOWVRHNUNjb3FCelZ4MGo5QUNpeHlCNDU1RHROMWUx?=
 =?utf-8?B?SHo0TStPWlN4a0JrVW5zK211cnpyRytpR2ltWnRoQWNWS0Uycm1JaitPbENn?=
 =?utf-8?B?Q2xiT1FRRG41RnY0QkcvVkdCZjByWldvNTArS3d2ZGVsNUV6V2dhcWQvUXRx?=
 =?utf-8?B?Y0ExeDNLOXMvTmJ5cEdESGd2TVJNSUljVTJTL2pZSW43NHRWVnp0b08rRlhq?=
 =?utf-8?B?Rm0xMjJma3djSEEyajFIVDNIT2pkaUFza09wWThFR2FPMDRIQ1NXc3F5c1Iw?=
 =?utf-8?B?bG1aQzZIbllKeENKRUl4eEUzczV0dEF4ZkJwaFZsUUN6aGJFV0M5Wi9tTnlQ?=
 =?utf-8?B?TEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d4faab57-ee35-4600-7ec9-08da854b5e40
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 21:06:37.8703 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BGnadXsI9Df3rmWHLHzAaxSGVfbtstmnzNuWkEoSDiT/MkTjjLaTeayX7Gk+NaHQHuz9qaiO+sUTQbGmmZSL38S+poLc/dt7E2x/jAS1Nj0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5130
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
 David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Operating on drm minor is not done in IRQ context, which means that we
could safely downgrade to regular non-irq spinlock.
But we can also go further and drop the idr_preload tricks by just using
a mutex.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/drm_drv.c | 31 ++++++++++++-------------------
 1 file changed, 12 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index b64b5c45cd80..8706d846abb7 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -53,7 +53,7 @@ MODULE_AUTHOR("Gareth Hughes, Leif Delgass, José Fonseca, Jon Smirl");
 MODULE_DESCRIPTION("DRM shared core routines");
 MODULE_LICENSE("GPL and additional rights");
 
-static DEFINE_SPINLOCK(drm_minor_lock);
+static DEFINE_MUTEX(drm_minor_lock);
 static struct idr drm_minors_idr;
 
 /*
@@ -98,21 +98,19 @@ static struct drm_minor **drm_minor_get_slot(struct drm_device *dev,
 static void drm_minor_alloc_release(struct drm_device *dev, void *data)
 {
 	struct drm_minor *minor = data;
-	unsigned long flags;
 
 	WARN_ON(dev != minor->dev);
 
 	put_device(minor->kdev);
 
-	spin_lock_irqsave(&drm_minor_lock, flags);
+	mutex_lock(&drm_minor_lock);
 	idr_remove(&drm_minors_idr, minor->index);
-	spin_unlock_irqrestore(&drm_minor_lock, flags);
+	mutex_unlock(&drm_minor_lock);
 }
 
 static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
 {
 	struct drm_minor *minor;
-	unsigned long flags;
 	int r, start, end;
 
 	minor = drmm_kzalloc(dev, sizeof(*minor), GFP_KERNEL);
@@ -126,11 +124,9 @@ static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
 	end = 64 * (type + 1);
 
 	do {
-		idr_preload(GFP_KERNEL);
-		spin_lock_irqsave(&drm_minor_lock, flags);
-		r = idr_alloc(&drm_minors_idr, NULL, start, end, GFP_NOWAIT);
-		spin_unlock_irqrestore(&drm_minor_lock, flags);
-		idr_preload_end();
+		mutex_lock(&drm_minor_lock);
+		r = idr_alloc(&drm_minors_idr, NULL, start, end, GFP_KERNEL);
+		mutex_unlock(&drm_minor_lock);
 
 		start += 192;
 		end += 192;
@@ -156,7 +152,6 @@ static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
 static int drm_minor_register(struct drm_device *dev, unsigned int type)
 {
 	struct drm_minor *minor;
-	unsigned long flags;
 	int ret;
 
 	DRM_DEBUG("\n");
@@ -176,9 +171,9 @@ static int drm_minor_register(struct drm_device *dev, unsigned int type)
 		goto err_debugfs;
 
 	/* replace NULL with @minor so lookups will succeed from now on */
-	spin_lock_irqsave(&drm_minor_lock, flags);
+	mutex_lock(&drm_minor_lock);
 	idr_replace(&drm_minors_idr, minor, minor->index);
-	spin_unlock_irqrestore(&drm_minor_lock, flags);
+	mutex_unlock(&drm_minor_lock);
 
 	DRM_DEBUG("new minor registered %d\n", minor->index);
 	return 0;
@@ -191,16 +186,15 @@ static int drm_minor_register(struct drm_device *dev, unsigned int type)
 static void drm_minor_unregister(struct drm_device *dev, unsigned int type)
 {
 	struct drm_minor *minor;
-	unsigned long flags;
 
 	minor = *drm_minor_get_slot(dev, type);
 	if (!minor || !device_is_registered(minor->kdev))
 		return;
 
 	/* replace @minor with NULL so lookups will fail from now on */
-	spin_lock_irqsave(&drm_minor_lock, flags);
+	mutex_lock(&drm_minor_lock);
 	idr_replace(&drm_minors_idr, NULL, minor->index);
-	spin_unlock_irqrestore(&drm_minor_lock, flags);
+	mutex_unlock(&drm_minor_lock);
 
 	device_del(minor->kdev);
 	dev_set_drvdata(minor->kdev, NULL); /* safety belt */
@@ -219,13 +213,12 @@ static void drm_minor_unregister(struct drm_device *dev, unsigned int type)
 struct drm_minor *drm_minor_acquire(unsigned int minor_id)
 {
 	struct drm_minor *minor;
-	unsigned long flags;
 
-	spin_lock_irqsave(&drm_minor_lock, flags);
+	mutex_lock(&drm_minor_lock);
 	minor = idr_find(&drm_minors_idr, minor_id);
 	if (minor)
 		drm_dev_get(minor->dev);
-	spin_unlock_irqrestore(&drm_minor_lock, flags);
+	mutex_unlock(&drm_minor_lock);
 
 	if (!minor) {
 		return ERR_PTR(-ENODEV);
-- 
2.37.2

