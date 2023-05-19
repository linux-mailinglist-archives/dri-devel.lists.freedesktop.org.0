Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B537E709B27
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 17:21:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD46510E4BD;
	Fri, 19 May 2023 15:21:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 380BE10E4BD;
 Fri, 19 May 2023 15:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684509663; x=1716045663;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ppPstcR4Y9ITrLrU2EG++mF9avWQSeXTHRbFHlaPnIc=;
 b=bgoXI0Vk7mCqsj8KoVYZGn38jpmZJ6GY3ClKQT3mIs0pbRKXipSQG/O/
 cUTzElrCvitzkCHIAGa8fJlDWgiWkcW5/oSF9bY8MC88m8f28Ojn1HFfO
 I6orNnXkl/hh8Gy9O8QELHeklzaaSSm8wFcouxk9q49NhPtll5rUVoNSX
 e/CshIWryDmpTjy7Xr0Cd0ml65UM5FPxcjLezCJCIa0MWnFnep4fGSW3t
 G2wVhGKm6R/wQi5rYgLA+LkiXqT6u21wLixxGSV1lgvsxpdwCTJus2HHT
 YaulAlfoUC7+0S377d4g+thUMAaBt1MnGJU1TcGL3Wv/nt8p3bicxbjBY Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="336991759"
X-IronPort-AV: E=Sophos;i="6.00,177,1681196400"; d="scan'208";a="336991759"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 08:21:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="814769095"
X-IronPort-AV: E=Sophos;i="6.00,177,1681196400"; d="scan'208";a="814769095"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP; 19 May 2023 08:21:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 19 May 2023 08:21:01 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 19 May 2023 08:21:01 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 19 May 2023 08:21:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WTYV+5zwGO52/+FIz97rHc+Jr5yJi4Ez+8VtRihdpNRyuSY5sQp6kEDzUmQuY9ZFRgEvZxb25BSLBL+0yxZnEQywA29Jx9Et4FIduhKWGSAy68mmir+TSxY5EY9LsJbDqoFpuGNNHwpRrv/3wHqsInUk+HemgtLRtpzrRS2GSPY7f8ZStXO0cxo/cEi6LFK1CPj1zETsQLMZ4qV5JjuN/17U/ZnUhRMPa6gBKSBYnedNp852l4uJvdWBWDgc2m80812pKRtie55+CugAF+KxULz5/GHQGIpwfNfOxvqnyYo8obopXUwH1/VVtz+X2EbGqzvP9r/0P32AOTJBuoS3uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hOMFQE5sX0fPrF729600Q+cExTBspILiPBf5V3rFvC4=;
 b=gaCyl7Kv8AIxoad9rU5CrBQdnx/GrRjKvU8tA7G9hTsLA71qEHEy0Z0fmNB273Hirq6dlKAuDVe4TK1q9ENk2t1fmV7GcJpqTuBwEOC5khbNGjZFeFVAng9i3x2n7VlHVT4Jc0DRMPd3bnDki1St0ot05AXMXbQTTmdM3suLM+MwaaITHhkoUPLMmehlxAJfxMMCxw6L4OFmLLIBHuPWIfX3LvMSb+w7ig9pLw4oSiLFyQesOprsAcqOiYuqtE5Gf5cJHOKoCRsOzfnlIRsEI4/wz+eBYN1t3rGjHiYrvKHcmQiP5Fvl1yst66Z8lZ+eGM/55/DMCshjOBnZvRDvDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB5550.namprd11.prod.outlook.com (2603:10b6:5:38b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.20; Fri, 19 May
 2023 15:20:59 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6411.021; Fri, 19 May 2023
 15:20:59 +0000
Date: Fri, 19 May 2023 08:20:56 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [Intel-xe] [PATCH v2] drm: fix drmm_mutex_init()
Message-ID: <v6azbvjhp63jbjr5wm2r42mzqjunfd4e6u73xsqr3cbppgtogv@tiwkatnov6yi>
References: <20230519090733.489019-1-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230519090733.489019-1-matthew.auld@intel.com>
X-ClientProxiedBy: BY3PR10CA0002.namprd10.prod.outlook.com
 (2603:10b6:a03:255::7) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB5550:EE_
X-MS-Office365-Filtering-Correlation-Id: 42341e93-6f4f-4244-9aee-08db587ca653
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s8qoZTMmDoRciOljFZJ4VUwChemN6khTVzHq5vgrtcOXhg2Lb6J//67/L05Cetnb7V9K7/MTmM+XaGlqLZIKlm8/B9CgDH/UFX2I69C5PJXrW5E/hwumIYBgZlfhuSNNUWGGumNMIv9Dbrf7O1guEoQQPYUjfvMfcMaZtWSb3ADmaybSlCDDMeMBxEPT3qjTpdT9IATm0b3pw82yU8liq7l4gI2v820ilvHK12Z7qVebuX/T2JlwaRF18ll5uP7ysPlQoziHzezuSzUT410HUWbj0PR87AOGH7mRkd8vn/r8DkCUUYLh1lqoF3DJRdUcs6yMdZu8NehSC27PM4v9k5CcSimhacHATALwbtGefJ++H4Dm0cegmKbFwMRHPogiYPU9amnVairilPrDoX+HTp1KPLfQ6xWkpYBxCjrukPZHUrWT3QJ1nPvL5c0bYxfCeJUZtlTszIN849sXEhPJOMwKAkdqmol26N1dr2Qa7YD/9pxWlMroZ5W0k6oZTtzjYNpLavbzgBacV4fHxdDyE7Ads6ggifyeUrmHnIW45gLJuVCebUh+os7diC3X4NFy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(346002)(396003)(376002)(366004)(136003)(451199021)(6486002)(6666004)(26005)(66574015)(6506007)(83380400001)(186003)(6512007)(9686003)(33716001)(38100700002)(54906003)(86362001)(316002)(8936002)(8676002)(6862004)(41300700001)(82960400001)(6636002)(5660300002)(4326008)(66946007)(66556008)(66476007)(478600001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Xg6R0ouQUI41+Hj+jFIyMHYmzc3xE4ZCT6GmTVwy/618WH7ETdx7WknZAt?=
 =?iso-8859-1?Q?XA2LScj1TTzGEBdJD2L/i8xjl/jC5isuoOXJRGMznyuSVmPT+v3n1fp+zk?=
 =?iso-8859-1?Q?4HIO8YbPZ97fkFU8dAfmuNSdNSH7D0x8EXZVCtKshT1E5UFnBp8pk+bD3l?=
 =?iso-8859-1?Q?t8GkvxjVOrgMK49Kwq+qx1nGAkrZjfMJqMQ9wIv2yQ1OKICU4F5+mlIK3X?=
 =?iso-8859-1?Q?tM8HlIEMK4lG+yR4SV09IdJfZl/yNPUGL77vdZ3EblqmonwiHr78WYufHz?=
 =?iso-8859-1?Q?FteaKN1mNkmgd5BEDdWDBubIgG6Y05ptVyqp4enefnWHMAcndr9cdWKENb?=
 =?iso-8859-1?Q?Lf6IbP51OwWaCu28DanicqNoEEiHNZzTpOolbToJJHowlJ5VFsQdLhpzwN?=
 =?iso-8859-1?Q?mYN2d4wOG7W4iSx6/U2gSzL2MmpZVANt5kjoa1AYYEWMip1Rhm4LA+Oq+T?=
 =?iso-8859-1?Q?q5NSoxWm+eB3suihuigYxeSpQ4/wTKB6GZNQiTPKjnXHlmpFUhzGmEf3oh?=
 =?iso-8859-1?Q?Wt2kiVGY1l411ckkLbKU0vsiLgI9J++Hqarhhcwc6munde2Iwfwr5Ba+IK?=
 =?iso-8859-1?Q?4kesymI75vXkXrnjG0Hy8GywN4XpYsH7wti+X1aG78vROF1sN/oklrO4oE?=
 =?iso-8859-1?Q?UjCYL7yMVnC6czWyjk2714mP4dI84FiGDMRXb5lI3/p74WsEhUhkDQh/y3?=
 =?iso-8859-1?Q?KRFSiWYrQgLEfv+wjXOpnOEfX8XXDaM+w8HoE9C4+1jIUDg+MUaIjZMNJB?=
 =?iso-8859-1?Q?MA3jNrpHu4ZIFKFnv3jpmDPxtOuPrDqNcBMOIQTA3n/btsVnwiy0K9yPP1?=
 =?iso-8859-1?Q?vgWmCufJ5ISbgd207cArupCGZHIAUSi2iCU/XuJVT0JQ2cZuRCfpu/9BsO?=
 =?iso-8859-1?Q?BFvKjzSwEYzfQ9UHZ5MyRlA3GS1CXiCv2y4N8pJtcfK3z8vxZaXvx0BbgE?=
 =?iso-8859-1?Q?mNwHRxjutr8z+ura+Wu/eqGSXQ1i4QeROl7PWjaF3FiDaWbo4Y6t8536OM?=
 =?iso-8859-1?Q?wbkKcariq0U/JHgowSzGIB5Xz6Mb4Z5bFbuiZmuBk0Z4UvMe8SuVkwP3VE?=
 =?iso-8859-1?Q?o2nzEmY5HJIT8VpTWSr5YsHLD7QE0gV1Hz1rcIutadSI6QKBGFD7e6PNty?=
 =?iso-8859-1?Q?S3GJuOSnNh5MGzf85wroHSSfljtG9vYy1jbix/EtGTXZIXAbOoaIg9kxbH?=
 =?iso-8859-1?Q?RjC7m2aeIURFWZ/xOH1WY3exMWAQUl8xDjv5kIgceBVCrhmil9G4upq+9F?=
 =?iso-8859-1?Q?vDQcrIEtrHODyigKOovkVLrT3yjnhEaRq0JB4FjWyk0xhHpDLtn4UXkfTW?=
 =?iso-8859-1?Q?XENKZVlJtvWkV0JFm+x51ERLpjLlwrB9HQbUAfeZ6USB6CGgXW37EioOVq?=
 =?iso-8859-1?Q?6ejq+G8KYxK5Na+ujwl4ZpuSN/j+P9rGOLqviEvLt6WXxLoktwjmY91TeF?=
 =?iso-8859-1?Q?DA6UDwoFOVlJ5PJUbNeIyvz8Klu7q/7E7c0q/60Fp8xc1xvU5A+mh1rbVX?=
 =?iso-8859-1?Q?VlS/5teNOcQ5dKDTLR2q7X2+qzsphcfua4n3YjUc1ufSkLZWgR/rfc0TWx?=
 =?iso-8859-1?Q?vFrRxBgMZFxo7xnKBocDvPV6UcPDh86MmJdTdTHIJorwK5HX/3SmPHIocL?=
 =?iso-8859-1?Q?WQeYZqxDmGDMBEFRldO0oHCdLiZfBXUnJY2o7lSQlNuUZLc+6dkK4Nzg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 42341e93-6f4f-4244-9aee-08db587ca653
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 15:20:59.4421 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6SAYReIEA3V6fG+PliKMzguqsGGBFUO6am2XnQEq2+KEoO/kfb5JCFzo4pfxUFrwqUSLbhCGfIJYn9xBpRcHVvgWye/LYxctydK6sxfMS3Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5550
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>,
 Sarah Walker <sarah.walker@imgtec.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Stanislaw
 Gruszka <stanislaw.gruszka@linux.intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 19, 2023 at 10:07:33AM +0100, Matthew Auld wrote:
>In mutex_init() lockdep identifies a lock by defining a special static
>key for each lock class. However if we wrap the macro in a function,
>like in drmm_mutex_init(), we end up generating:
>
>int drmm_mutex_init(struct drm_device *dev, struct mutex *lock)
>{
>      static struct lock_class_key __key;
>
>      __mutex_init((lock), "lock", &__key);
>      ....
>}
>
>The static __key here is what lockdep uses to identify the lock class,
>however since this is just a normal function the key here will be
>created once, where all callers then use the same key. In effect the
>mutex->depmap.key will be the same pointer for different
>drmm_mutex_init() callers. This then results in impossible lockdep
>splats since lockdep thinks completely unrelated locks are the same lock
>class.
>
>To fix this turn drmm_mutex_init() into a macro such that it generates a
>different "static struct lock_class_key __key" for each invocation,
>which looks to be inline with what mutex_init() wants.
>
>v2:
>  - Revamp the commit message with clearer explanation of the issue.
>  - Rather export __drmm_mutex_release() than static inline.
>
>Reported-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>Reported-by: Sarah Walker <sarah.walker@imgtec.com>
>Fixes: e13f13e039dc ("drm: Add DRM-managed mutex_init()")
>Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
>Cc: Boris Brezillon <boris.brezillon@collabora.com>
>Cc: Thomas Zimmermann <tzimmermann@suse.de>
>Cc: Jocelyn Falempe <jfalempe@redhat.com>
>Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>Cc: dri-devel@lists.freedesktop.org
>Signed-off-by: Matthew Auld <matthew.auld@intel.com>


that explains well some splats we've been seeing on xe.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>---
> drivers/gpu/drm/drm_managed.c | 22 ++--------------------
> include/drm/drm_managed.h     | 18 +++++++++++++++++-
> 2 files changed, 19 insertions(+), 21 deletions(-)
>
>diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_managed.c
>index 4cf214de50c4..c21c3f623033 100644
>--- a/drivers/gpu/drm/drm_managed.c
>+++ b/drivers/gpu/drm/drm_managed.c
>@@ -264,28 +264,10 @@ void drmm_kfree(struct drm_device *dev, void *data)
> }
> EXPORT_SYMBOL(drmm_kfree);
>
>-static void drmm_mutex_release(struct drm_device *dev, void *res)
>+void __drmm_mutex_release(struct drm_device *dev, void *res)
> {
> 	struct mutex *lock = res;
>
> 	mutex_destroy(lock);
> }
>-
>-/**
>- * drmm_mutex_init - &drm_device-managed mutex_init()
>- * @dev: DRM device
>- * @lock: lock to be initialized
>- *
>- * Returns:
>- * 0 on success, or a negative errno code otherwise.
>- *
>- * This is a &drm_device-managed version of mutex_init(). The initialized
>- * lock is automatically destroyed on the final drm_dev_put().
>- */
>-int drmm_mutex_init(struct drm_device *dev, struct mutex *lock)
>-{
>-	mutex_init(lock);
>-
>-	return drmm_add_action_or_reset(dev, drmm_mutex_release, lock);
>-}
>-EXPORT_SYMBOL(drmm_mutex_init);
>+EXPORT_SYMBOL(__drmm_mutex_release);
>diff --git a/include/drm/drm_managed.h b/include/drm/drm_managed.h
>index 359883942612..ad08f834af40 100644
>--- a/include/drm/drm_managed.h
>+++ b/include/drm/drm_managed.h
>@@ -105,6 +105,22 @@ char *drmm_kstrdup(struct drm_device *dev, const char *s, gfp_t gfp);
>
> void drmm_kfree(struct drm_device *dev, void *data);
>
>-int drmm_mutex_init(struct drm_device *dev, struct mutex *lock);
>+void __drmm_mutex_release(struct drm_device *dev, void *res);
>+
>+/**
>+ * drmm_mutex_init - &drm_device-managed mutex_init()
>+ * @dev: DRM device
>+ * @lock: lock to be initialized
>+ *
>+ * Returns:
>+ * 0 on success, or a negative errno code otherwise.
>+ *
>+ * This is a &drm_device-managed version of mutex_init(). The initialized
>+ * lock is automatically destroyed on the final drm_dev_put().
>+ */
>+#define drmm_mutex_init(dev, lock) ({					     \
+	mutex_init(lock);						     \
>+	drmm_add_action_or_reset(dev, __drmm_mutex_release, lock);	     \
>+})									     \
>
> #endif
>-- 
>2.40.1
>
