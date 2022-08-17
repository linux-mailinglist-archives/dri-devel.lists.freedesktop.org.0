Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9045979F7
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 01:09:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3640AFCC1;
	Wed, 17 Aug 2022 23:08:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A29499579
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 23:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660777720; x=1692313720;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=0oh4f2XqZmhZoOsOvCWOsLdj74DHgeEfOygawLb3HKI=;
 b=PjrNlg+Bp0kKt5hh9dQXwFNZ9Ajy9VC2p8F2VfSckuIuH/cLXuut0v8O
 XNxOkxp6kEVxgdFYxayrLTtodIVO7H3uCOh/n86umqWZE/LIs/83BXuMF
 krAeG9FeT6V7lNzMBNObL9OKzLB2NgAROxItPIZIaKuxvBdbeM8ydUNYi
 RnzF816O5rV2dnMS3I/eBmtt7u3N0jeCn8O8SR24OWHqXkSzqaSByW97H
 r3LIIQEYqdomcI4GwXn+LjP9JemvUdIeb2pePN5EUGUH47i3JETCu9rez
 dchbF6ntoidAeYwEOvtnotRQPjYH1c1KFjd5X0nTJAT0Bjq4cm2007dg3 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10442"; a="354361542"
X-IronPort-AV: E=Sophos;i="5.93,244,1654585200"; d="scan'208";a="354361542"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2022 16:08:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,244,1654585200"; d="scan'208";a="733849931"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP; 17 Aug 2022 16:08:38 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 17 Aug 2022 16:08:38 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 17 Aug 2022 16:08:37 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Wed, 17 Aug 2022 16:08:37 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Wed, 17 Aug 2022 16:08:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V4O29w07N1HxoprHsoASzx04JKqqYsf9tq6dufHnBb1h0c0Xw5TFesDG6YOYMG4fN4PvSl+GF1ym3W1R/4yzlq4DJr/84CBv4d13K8eO89LlcFYbvz09l1+L6W6+ZPnACeDw8bS+RE6EpZbZWHTv4lDGmqIxOX0iz45ehARLIMF8utOslx1aNTnZnuv5kZCRSLThPoCGX9zWMWCtEAK1526Li7om09RLi6FoDBrRRe/fQK/FLyOb/VTAwWNeLchinLgoPI2uUoVr+4MryGGpJm2BM2+Aydv9blPJ9LShNHCHjK2ifszMbyYRPQPh6tfdS2zfEj9270ofJ+Q4yubO1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K4gPzz544GfEVccZ8O50yxCUmK/af4XTBlcrwdMLxw8=;
 b=n1sWts1FzYOf9MNIvLy6PcrzlJcnzUq9bnvwg4MEqpbI1QiJpN4nchCQQllVdK68U0kJ1CyuiEGUKxZmKKnc+vVFig+Uavrcwmj2TxU1hnt+x0QLOBEYoDRbyF7yfbbCJg0Ctu8Qr6IvPvFfStWUK8vXjZBC2avOcpi+4D8rzY5yyX9uyPkMo2chrZgeP7ui71rqNV79VoYnln3zje6z6051SjTIRWk5a45LAuQHKpruwrIklp8dpt0QvCA9Br0xYF4M9tkSOroGPUHzRZnCt5yQeA6NtDLkbmSJ80bEH8lUwGBrM7nPnmW5RzpJbk7Gn6+nLXYrhEU6n8R6zSn5Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MN2PR11MB4190.namprd11.prod.outlook.com (2603:10b6:208:13e::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Wed, 17 Aug
 2022 23:08:36 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e%9]) with mapi id 15.20.5525.010; Wed, 17 Aug 2022
 23:08:36 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 3/3] drm: Use mutex for minors
Date: Thu, 18 Aug 2022 01:06:00 +0200
Message-ID: <20220817230600.272790-4-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220817230600.272790-1-michal.winiarski@intel.com>
References: <20220817230600.272790-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0118.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::13) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6661d225-6c0a-4dfd-9a2f-08da80a569c0
X-MS-TrafficTypeDiagnostic: MN2PR11MB4190:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ILrjiChi2jKbUlqZCwOVnUJl3tbEUw0yjZgmSBXLkFy0Q1hGVeWb0hf+D7BbkCakb9PyV0cUjUQYAA3K5EWRZOShxApuaKUShjR/SZnfuq2mSycvP1NyC/ZlMWFDDJ9XLP9EQkA9dzUKk64BuvkCRUebpgp+6TRhKadYpPbOaCbgJE4raPuMvDpuUi8csAmLDhn2GCsfI3dhOBe9ccDDf0sY3L/cw+vHFzwwFSwg3flWybdaPVtg+VJOOJLyrHXc5dqZ2yR8SiEVg9Uc2nj4hZeWlAySGV4805NKF7MPV5kG0FPhbO5+J01jCbBC74NzbnV2Tdf9AQ4qR8dnK0LtnXspox3rla1HfdTNgRRd9v/n2ec/XrLf0XXSlrduGkhrxnw8jvpzR/dV6yX3ZFolOYaABlSXqBumRkt7KYFhB2WnEEwOoi12KpCaSWt1ToaA0tVkOU0OQNXFMwLhm4vpCzyQ+EIX3H4pNZDJfwXcpKBpIXhAP00lPIygTZovN+C5pc95umzpYoFjMxjto1+JQiBn3bNhuBN0CRXHn47Bq1idK5NjfmHhNoPeQsdDCKb+4fY3WpriLxHA5jTVh64w81daWDHEeDqBJBqVgJUTyi4EzLtQtz2m9a/ZaBPUxEeOA2mlhdfIbs6rknkh3lBUotxkhLeXMWtFdvQ0ReqSssMFX6p2bjx3v2KTqhp/C5yF9HXkw33uvTyJkhYyZ6h2TA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(136003)(396003)(366004)(346002)(376002)(86362001)(82960400001)(38100700002)(316002)(54906003)(6916009)(2906002)(66476007)(66556008)(66946007)(4326008)(8676002)(8936002)(5660300002)(2616005)(1076003)(186003)(83380400001)(478600001)(6486002)(41300700001)(6666004)(6512007)(6506007)(26005)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RkVwNDhUdUVJUUhlZ1B6N0ZXYkJlOUFPVWpPSzRvNTdNNElobHJJOUZDakZS?=
 =?utf-8?B?cExvWldqTWhZYlFabVEzZGxOU1R4SXdSd3lTaktvcEdTR2thZ0ZrVERlNWp4?=
 =?utf-8?B?ekdlWVFUbEExYlc4VEpsdHZBVjlLdDR1QnQ4TU12R1NRRDZtbS9BNnlKdElj?=
 =?utf-8?B?cWw5SFFoamtKMnlibXZYYy9kQ2toamdYT0JBT0JOcjFhaWRRUU13OEl4UEkx?=
 =?utf-8?B?MzdCVXhTVzY3NlQ0WFRUc0o3OEFqMEdwUGY3eEtRUWFqdER1OEtBUG4wZXRv?=
 =?utf-8?B?MVNtU0lpNk9HcVZXUWJLWUtTWmQ5eThPM1l0UHJpUm1TbUZrZzBJaHRHSEUy?=
 =?utf-8?B?S3kvWUpGVkJsZE5qUlY5MnJBUEkxSXI4ZDJPb1ViblVvMGFqMVZtcUdqbmw4?=
 =?utf-8?B?WnAya1VzRkFsTWw3VVRRWUhyNDFpcVBaMXRqN0N1Y0JaOGJjUHlZOCtaMFpt?=
 =?utf-8?B?RUtQK1RjZmFwQm9odDFZWHYyUWZkUnRtVHBRS3dlQnJ3MmNwSlg5ZjBUK1dS?=
 =?utf-8?B?cUt3cHhackNycEFNdkR3alVJMjlhSUZnVVQyTitsdmdUN0M4aVRaWXJNVEZG?=
 =?utf-8?B?dVVrNG9NTmNnTU5mbm10SW1oTFRjTDBqTEQ0ZWk0UE9Bb1lRMVZuY1cwcWNW?=
 =?utf-8?B?TzNIVklQcGlLLzNFa25vOFR3SEhvY2hhUHE4V2hJSE8yN2czQ0VnNmx4SlAr?=
 =?utf-8?B?RWIrRkFDR3FqbUxGNFR5bWY4ZklyUGRPMHZMekdRbktWMU9QV2NMVnBvREwy?=
 =?utf-8?B?VUVpS0pKVTZNRC9FTE9ZcWdTWHFBZ3BQbDJacm5ydjlYMnYweklsMkxQWmI0?=
 =?utf-8?B?NEtHdUxrQkxrQUN1V091aGUxaE1lM3RHYVNOWk9qL29Fem9XSWU1VGxQM0dZ?=
 =?utf-8?B?S3FhdDBPWVNmenV3U3M2VGN6cVBMMldNVFdsQjEyN3ZxbTJUQ3ZQL1pueW5r?=
 =?utf-8?B?VFNzcXFKUVpxc3FpL3ZTdWZOOUVTRDVhRlQxZjFHcEY3cGcvczB5dUhUY2pJ?=
 =?utf-8?B?b0NHQkdjaytZNEw2eTJEaTlnOWhFd0xzOUVNc09FRVB4M0s0TWM1UnhKMVdI?=
 =?utf-8?B?YUJEU3hoeFdUV2JmQkVxdDd5bXd1UFlYU0tBTE9iODZQd2pSUzRxRVduak9a?=
 =?utf-8?B?QkJCZFo1a25NdW43a29KTlVlK1dNcjV0SzJnVmFibU1jT2lOK01WMVY5bzl5?=
 =?utf-8?B?NFAxMWJ2R3lRRTJabTQ2bEIrVHJ2cHVCTTBPeDg0dk1LbTRVT2lCV01lUms0?=
 =?utf-8?B?eE9KSEJVQ0ltMnpsWkZxdExZLzJsUEZMMEhJWGtiMEM1M2ZCbmVFVWdCUWZC?=
 =?utf-8?B?WDFFcXhLMElnMndGaEdtcEE1SDdGNjh1b2UzQURkNjV2MFFIQmVFUUpZRVNs?=
 =?utf-8?B?SEhJQUdrbzVqZjZHcHpWUE9HNG5vSUNjemtNNGo1V0RNZlQxNjBwU3grMEFY?=
 =?utf-8?B?MXQvZXNPd0lmODUrdkw4TkpvQ1N4WWxxNmR6OXdTaXRBQzFFWjh0WG90UTZu?=
 =?utf-8?B?N29qcmJLb1M3bHUwVlkwamxIcEUrZG1wcWg2VDNva2NIUXJwb0pMMGI3SmZs?=
 =?utf-8?B?SGM2Q09wUjZBaEtZaWNOK3NQQVpmMm43cElVN2dTd3o2UXhYS2NBcnVSMkpZ?=
 =?utf-8?B?NytINXltN05QM2dQQjNPcG1HYzRsUUFFbEVxWWxaRm4yckVVT3BxcWY1Nm9O?=
 =?utf-8?B?V0Q2ejZHZlBvS1haNmVSWUk3S1kvejM2ZEJqSllGVUdtQ09UQm4zbW1CclNT?=
 =?utf-8?B?UzdzZHNxSWFEMmI0WUluYXkvRWdKTjNZTVhpa1VJUUJhdlVJRjR4SlM0UHdx?=
 =?utf-8?B?OU9tdjhqVURDdTNCSlZzVlJucnFLcW5PYUlpK09udC9XeFBDS09KRis2WVBQ?=
 =?utf-8?B?YmFPZGlEUWJxTUdpRnRhbEhnbTZNVEphRnRvUGlvTSt1dmdYaXhoZFFSN1Yw?=
 =?utf-8?B?bjRVZTJJUStSdENVdzlMdDBzYmVjMmsyckRLOUtHSXk2RXZzSGp3MFVYT2hR?=
 =?utf-8?B?dzFRNUJHTzBJeW8zMHN0Q01jRncvZWhlc3k2eDlmdnpYa2l6Sk9UTjhIK01z?=
 =?utf-8?B?WTBGVWhyVUpRNktGWTRnWDJibGY5OEx1ZzduN1dWU29KZk9ONWtlYzV2Q1Zo?=
 =?utf-8?B?QkF4OThVclpLYk1FUlZlY214K0JtaVZLdVAwWkpSdEpuZDlCT1NKM1JsOUV0?=
 =?utf-8?B?NlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6661d225-6c0a-4dfd-9a2f-08da80a569c0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 23:08:36.0422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vvHsh5nW+vQExEIMy4B3eaDmfhpJ8MuKGRA55VtjNg/dJYBhn3/fcdmKFncwclqJxcsePJeQXRmPGYMfhqpfgePYT6JlpiTnc9/3imMXFoE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4190
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
index 0dab1ef8a98d..b31497e28e6a 100644
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
 	end = 128 * (type + 1);
 
 	do {
-		idr_preload(GFP_KERNEL);
-		spin_lock_irqsave(&drm_minor_lock, flags);
-		r = idr_alloc(&drm_minors_idr, NULL, start, end, GFP_NOWAIT);
-		spin_unlock_irqrestore(&drm_minor_lock, flags);
-		idr_preload_end();
+		mutex_lock(&drm_minor_lock);
+		r = idr_alloc(&drm_minors_idr, NULL, start, end, GFP_KERNEL);
+		mutex_unlock(&drm_minor_lock);
 
 		start += 256;
 		end += 256;
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

