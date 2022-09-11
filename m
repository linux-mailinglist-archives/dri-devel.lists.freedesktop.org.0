Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F4C5B5149
	for <lists+dri-devel@lfdr.de>; Sun, 11 Sep 2022 23:17:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE65A10E539;
	Sun, 11 Sep 2022 21:17:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DFB310E532;
 Sun, 11 Sep 2022 21:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662931050; x=1694467050;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=bPLXSt1pm/aLYOUXA2rtyWyj09IwpOs2VhXPRdNLwRU=;
 b=YwM7Oeg8UnKWg5KjNf1OPrAEQqzL4leZoHUINYUwmzQ1b2D8z0OHjhaK
 N20ghdqjQBQpm4ibSLcpm/Fb/3xlCfPrsLC9o9lEhCwGmWgyzmwbA0vgI
 R7HcrLvkDCTQaMg73hAvy1flvICI8b6dNu8wJFxn8P1matRLWABgalPPK
 DGPZMLOinHIXoPyNWSEotROQ2AotGKmpyMeEK+wRAQFemE4k1VyORFplr
 qSY8CssF6Bw69o0z/Kh3bBlyAm7ThiQE276mYnB5O3EGd2DwzJ0K792Zb
 otzRPph9criN35fquQLqHlHFCaIA0IxxMWlhMs+VMTYcEIeRMDlYpsZdG g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10467"; a="277487732"
X-IronPort-AV: E=Sophos;i="5.93,307,1654585200"; d="scan'208";a="277487732"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2022 14:17:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,307,1654585200"; d="scan'208";a="791356686"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP; 11 Sep 2022 14:17:29 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sun, 11 Sep 2022 14:17:29 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sun, 11 Sep 2022 14:17:28 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Sun, 11 Sep 2022 14:17:28 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Sun, 11 Sep 2022 14:17:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N9meTzF2RFyc2cElWbSRkdvdoS04F9Tz8/hY6u//PVpKTvhVcptcztgSMDZWtrQ2IujLr3hdRg/LNZUZAVt2AurHn1pw1puFiSRC3ejf9UONoT0hned+y9N41HSrrga5cGg2nPDwU2jluLHZL2cE1N4e2vmF8fcwgftgu5mnyq9wYOyEsrfeIx7v8nR76/tlbjCRdqriY0u4zQv2SjCZI4XEeuOaXPxHFks+WXHipbEUoPpQNxkQUm0ti1fDqJzOdGVtBFkqnKeT4H5aRtfdnJ70eHXfbll7HGrHCheeEiP6+X+dWvZ35Pcnn+OfZ8IcvIKicfBqPOJj2tb/C/iiFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fx9UFjBAsMM9Poo6R8mBv0u71VD2XvTy4QafzcE70Nw=;
 b=Q6FwgBAhnByyHSygiEIYjUhdHpc9PhlBleGSkTVng24YAhRcEpe6x86l/7doDCCmPRH8SnV9aFogul+W56c4+Lgq6AgoohVMdmYjtvkAmIyKGN+mF4ncKijoILdtuBBsVTziT3e9F7zaUGQkPf3XssmVWwFIWqBioriBKexj1ehXOwyWEMfxnCkPn9EYRg0m+n233W8em27fEJdySuy0QkydQ5uwzVyCSJtKD/hu2gWQ4RkUNemz4XDdDOjDZAeR91REpprD6VnAYRoeks8Hnxt32CAGiAfcTTXUOKFgMJNA/MiK88NqNh3cweE8J+3wOvy2GTLJOTQQhuf2H9TzyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM4PR11MB6065.namprd11.prod.outlook.com (2603:10b6:8:60::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.20; Sun, 11 Sep 2022 21:17:13 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::5145:64b6:db32:b424]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::5145:64b6:db32:b424%5]) with mapi id 15.20.5612.022; Sun, 11 Sep 2022
 21:17:13 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v5 1/3] drm: Use XArray instead of IDR for minors
Date: Sun, 11 Sep 2022 23:14:41 +0200
Message-ID: <20220911211443.581481-2-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220911211443.581481-1-michal.winiarski@intel.com>
References: <20220911211443.581481-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0004.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::23) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM4PR11MB6065:EE_
X-MS-Office365-Filtering-Correlation-Id: 76301df8-9415-4a71-e135-08da943aff27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uzU4OoR4SYOTaN4e2IqfIyLFufuPnOT3b+WiCvArtt2QAvJnQp2T8nbs7Ac3331CA9ioGtwGMPuH71V5G0CRAfMNWbJHKJEfNnb7qZvERvPjOlvBvWQ897vHEvnJ/mobpiUCxWJHwnRett+TuHpYoF/oN0naumocEww9JU2D+MZO/8h4elsa5SD9kM5q2AfHNI0YbnDzdnsdy0L3nStG1xRyJRtPG/OvrXFU6QgfggTagsgdY39LUdZs9qpUE5QVemTdeNl7ad7XeZcJcPh9a4tNAlEnbPVEhzNSC5DF9tpUJkoCLzka1L1SG/UJ+cWO6ClcCVE9Hv+K8ld/k/dNvxSQFHOdOwSYfVPBNTYtgt3VWXyMMqPH0S1vmGII9xdMuovN+oLw9kvG0ndijvNOV48Y/GwCKKz1Mhkd6Sjb0xGuvq5XdcAnhwffSyF9h4HrF8unhdNlD59HLttpM2uraM60DbiiQ8eq5ujcqltIP36+bvDQWbuwPz77MSgONyudqAugMQcC9Ey9AJXE11VwQ3bXPYZSUAPKfIYm2Vlt9jJweahq8+wSEoPoJCtnDVVwiRqnFERV7nJ1e7daEXTZLnJBQl3ArXGbO0m98vaJ2wlBFX5zYf9rEKrebo8wSwCzRGiSDm7HjY1YRQ/u3bbc1xynW7M73EnPx6tc5aYfj8IzJJOS0dS+nRiPiGS9uXYrdYoKX77GV4Hqli4sKIlFnQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(366004)(396003)(136003)(376002)(39860400002)(186003)(6512007)(26005)(41300700001)(6506007)(83380400001)(6486002)(1076003)(478600001)(2616005)(6666004)(316002)(4326008)(8936002)(8676002)(7416002)(2906002)(82960400001)(5660300002)(38100700002)(86362001)(66556008)(66476007)(54906003)(66946007)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q215V2NqS2w4b3BJVGpDYmhSZnp2Vklra0RxeWdjN25YL1VtcVRLVFR1RmxS?=
 =?utf-8?B?TER1Sm5QcmxHQzZXODUvSmc2eXdIei9uTVA2UnVKT0ZVWVlhbEJ2bHNYc1Jo?=
 =?utf-8?B?TXZROUltbElUMFNwbjd1MUpNTG1kRitaSmh1bDBxOWhzcHlQNHp5b2tUZ3Bm?=
 =?utf-8?B?NXhwMU9QVVdQcXlEMTJFOE9YQU0xcWxFOUtoazJBZDE3WE93SCtPTHFPWklB?=
 =?utf-8?B?REREakFuK0lYTFJPdXdlSlBXSDJObktWWGthYTZuQkZheTNwU3c2WkhNMG1m?=
 =?utf-8?B?bnlFWVdwU0hvWXo1RUYvaE1zUTVxVk1RWnlqa1Jja24raldHblEyTmNicnF4?=
 =?utf-8?B?MjFxQjlSK0U4VjFzZ3dISFEzVnVuN25XN2J2MitSdks5akRiU3BKNHg5M1Z3?=
 =?utf-8?B?VmtvSlJmM3lWeXQvaVYwYW11aEMvRjFUY1NxejZYczNJanFpdlBJODBXM05p?=
 =?utf-8?B?dW1ZOGlLckVZTnZlY1hWMFNwOUVOb2J6MzBTVWVvSXJZNnhSS0RpTDMrd1hx?=
 =?utf-8?B?Mkh6NEFGY0FRM0dhVzZvYlQwWFAveVI1U1RsS2hteWs1RWVyZ21FSGtHSWd3?=
 =?utf-8?B?bGRWOWxPcWFRdHhDTUtvLzRIUmYweW1EYjhlckFYOVFVRkFzNjlRVlZUd3Vz?=
 =?utf-8?B?QWZmZlpBL3dvNmJzd28zRjRiZnFGb0I1b2pNTE5YN3hyTWtESXpJL3VUWGJp?=
 =?utf-8?B?ZlRGalhxQTNIYXZET0IrMXVGM0ttMS9sRFoxMFV3Ukl1eS9KbkwrU3JoSmlm?=
 =?utf-8?B?eUtMMXZzaTRaZGF1SmhucTVINVlnUnY5R094WU1mSjdUWVNGZmZYOEJyL3Fy?=
 =?utf-8?B?cENvUUcwaTNKZzR3cHBsSmd5blY5cFcyMWFuc0lTS0E1Nnp4K3ZlVjRaajVh?=
 =?utf-8?B?TC9Wa3ROUnVweUtOK2dVVzZEWWJ3Yzg1ZXRJVWhRYmpNZEJQNVNxb01TYStj?=
 =?utf-8?B?MmY0S1YvOFRRQ1N5c0p2N241N3FBejFrWU1XRS9ad0g5NkdsSDdkQ3k1ODJi?=
 =?utf-8?B?VE8xbFoyU293OEtuUjdCWkx6K1hHaERiSXdYbWtEMThPQTRXMXhMNDNERjI2?=
 =?utf-8?B?WGxwdXJqMndHU0kwU2JLTm9NSDJDVzhRRmVaOXpxSDBiUW5iWnoycVdNSEx0?=
 =?utf-8?B?N2dzQUVFd3dmMEFXTG5Ub0JVRXlERVBPekxOdU1VaEI0U2EzaE15M3JZZXFX?=
 =?utf-8?B?VmtjSnhFaW44YTUrNnNzUTZrZHJqa2oxUTNweEdxZW5NRDlsYnJWdE0yTE5o?=
 =?utf-8?B?RU1nK0F5UG1Qb0NRMGdXQ0h6WjNvbjd4QWpVK0tCbUNER3o1eUY4eGZzcU50?=
 =?utf-8?B?TXo1eUFtMlEvV0dYdlEwRW1lVFNyYlNXRkFINVBTUUJVWWVBelVNdzh3SmFn?=
 =?utf-8?B?THZDaTU1ME9KeExnajdRUUJqMzRpY2RVamx0L3RKOGFIenNHcDFOWTBlS0Zy?=
 =?utf-8?B?OXluamZPMEVjZEdhMG5uTXM2V1kwWmIwbENsYjVnbmNhMWc3MFBYeEJ2c2E4?=
 =?utf-8?B?ZU9kcndWdkFLTzVGN1dkQmRha1pnWFM2WjA5YnZNajV5MWFUQ2dNcVNZeW16?=
 =?utf-8?B?RjluRmo3TEVzTFR5bEVBdGtsTTBZMXpacGxoUDdLbkJqTDhXanBpeFFlRDkv?=
 =?utf-8?B?cWRjZ1ZKMUxNSnpsaEZyaVJYc0RHdG5FeGtEcW85SFpFMFoyRXMxbVAwYnFR?=
 =?utf-8?B?YlFiTUtWTU5LclZlY2YrUzZ0VUMrYURkZEVrN0xxOXVxN2VZYlRYaGVSVFJ1?=
 =?utf-8?B?bWpscitqWForSGVmVzRkc2VUMGFRNVpHZVNmSnlUVi9Yb0JsNGUvNXBORW1B?=
 =?utf-8?B?b3Yrb1BLTWR4RVZ2YTdINFZnQ2dDM3F6Ym9tbXJzUzRFU1ZWdnJLNVdqNlZQ?=
 =?utf-8?B?N1NYeXpsd2N0dS8yd01XMjNsb2lnZUhjcWxPRlNUaTMrNVNreUZDQzdDOG9y?=
 =?utf-8?B?dXJIV2t0T3Myc2RWaEtMcFphRFBzeTlIZ0JRVmlJUkFPay9vYU9GR0tGbVFU?=
 =?utf-8?B?d0pVMmVPSlVubVI0WHZDcnhyRXNsVTNMSDF6WVFtVzcwZnl5VVlkZGhJYy9B?=
 =?utf-8?B?WTBneHZjbmdsZzFhNWdzQmRIYWgvT05nOFNBWDE1elIyazhsQmZFNjZTaFhw?=
 =?utf-8?B?dG82NGViN1ZrWWJLWFFkOG9lRjA3dDNlT1V5c1hPL2o2bkIxenorSk1mTjY5?=
 =?utf-8?B?cHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 76301df8-9415-4a71-e135-08da943aff27
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2022 21:17:13.7101 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cEtUsDVqkIZHemli3VY03qJdtjUYkl2ANR4l4s7jLZATOWb/ZIY5b/mF2hzNRCmXPqGda8IJfAsuiokC0sLS03lfDp9Juc1jUwyRyQfleWY=
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

IDR is deprecated, and since XArray manages its own state with internal
locking, it simplifies the locking on DRM side.
Additionally, don't use the IRQ-safe variant, since operating on drm
minor is not done in IRQ context.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Suggested-by: Matthew Wilcox <willy@infradead.org>
---
 drivers/gpu/drm/drm_drv.c | 51 ++++++++++++++-------------------------
 1 file changed, 18 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 8214a0b1ab7f..61d24cdcd0f8 100644
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
@@ -98,21 +98,19 @@ static struct drm_minor **drm_minor_get_slot(struct drm_device *dev,
 static void drm_minor_alloc_release(struct drm_device *dev, void *data)
 {
 	struct drm_minor *minor = data;
-	unsigned long flags;
 
 	WARN_ON(dev != minor->dev);
 
 	put_device(minor->kdev);
 
-	spin_lock_irqsave(&drm_minor_lock, flags);
-	idr_remove(&drm_minors_idr, minor->index);
-	spin_unlock_irqrestore(&drm_minor_lock, flags);
+	xa_erase(&drm_minors_xa, minor->index);
 }
 
+#define DRM_MINOR_LIMIT(t) ({ typeof(t) _t = (t); XA_LIMIT(64 * _t, 64 * _t + 63); })
+
 static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
 {
 	struct drm_minor *minor;
-	unsigned long flags;
 	int r;
 
 	minor = drmm_kzalloc(dev, sizeof(*minor), GFP_KERNEL);
@@ -122,21 +120,10 @@ static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
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
+	r = xa_alloc(&drm_minors_xa, &minor->index, NULL, DRM_MINOR_LIMIT(type), GFP_KERNEL);
 	if (r < 0)
 		return r;
 
-	minor->index = r;
-
 	r = drmm_add_action_or_reset(dev, drm_minor_alloc_release, minor);
 	if (r)
 		return r;
@@ -152,7 +139,7 @@ static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
 static int drm_minor_register(struct drm_device *dev, unsigned int type)
 {
 	struct drm_minor *minor;
-	unsigned long flags;
+	void *entry;
 	int ret;
 
 	DRM_DEBUG("\n");
@@ -172,9 +159,12 @@ static int drm_minor_register(struct drm_device *dev, unsigned int type)
 		goto err_debugfs;
 
 	/* replace NULL with @minor so lookups will succeed from now on */
-	spin_lock_irqsave(&drm_minor_lock, flags);
-	idr_replace(&drm_minors_idr, minor, minor->index);
-	spin_unlock_irqrestore(&drm_minor_lock, flags);
+	entry = xa_cmpxchg(&drm_minors_xa, minor->index, NULL, &minor, GFP_KERNEL);
+	if (xa_is_err(entry)) {
+		ret = xa_err(entry);
+		goto err_debugfs;
+	}
+	WARN_ON(entry);
 
 	DRM_DEBUG("new minor registered %d\n", minor->index);
 	return 0;
@@ -187,16 +177,13 @@ static int drm_minor_register(struct drm_device *dev, unsigned int type)
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
+	xa_store(&drm_minors_xa, minor->index, NULL, GFP_KERNEL);
 
 	device_del(minor->kdev);
 	dev_set_drvdata(minor->kdev, NULL); /* safety belt */
@@ -215,13 +202,12 @@ static void drm_minor_unregister(struct drm_device *dev, unsigned int type)
 struct drm_minor *drm_minor_acquire(unsigned int minor_id)
 {
 	struct drm_minor *minor;
-	unsigned long flags;
 
-	spin_lock_irqsave(&drm_minor_lock, flags);
-	minor = idr_find(&drm_minors_idr, minor_id);
+	xa_lock(&drm_minors_xa);
+	minor = xa_load(&drm_minors_xa, minor_id);
 	if (minor)
 		drm_dev_get(minor->dev);
-	spin_unlock_irqrestore(&drm_minor_lock, flags);
+	xa_unlock(&drm_minors_xa);
 
 	if (!minor) {
 		return ERR_PTR(-ENODEV);
@@ -1037,7 +1023,7 @@ static void drm_core_exit(void)
 	unregister_chrdev(DRM_MAJOR, "drm");
 	debugfs_remove(drm_debugfs_root);
 	drm_sysfs_destroy();
-	idr_destroy(&drm_minors_idr);
+	WARN_ON(!xa_empty(&drm_minors_xa));
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

