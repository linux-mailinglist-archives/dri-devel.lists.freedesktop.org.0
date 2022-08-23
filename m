Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9EE59EDFB
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 23:06:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 311B410F9BB;
	Tue, 23 Aug 2022 21:06:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DB6C10F9BB
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 21:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661288796; x=1692824796;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=fJ9pjNm4NMYTgmupKFJ8FJfVgbI6Sq4DdpGtBCUttI8=;
 b=jyE6lm4XPCG9Z8FeR2sEI7FqNCzN7xDOeMcbYc15mGcEeO9OPDrdYaUW
 Grcre4CmwpzHuRvFoBoDgqFmRNW0tcbAtVU06Kmcrxxv49+HkSIW2j2/H
 Sko2HCjjSZ4z6KK0zWCbBZFqGiGoDa0+iuuQAe5kcqzDPOfkFjh4B57xv
 OfRGGfqG+VYRb47qXzRHD+bilNMmO9wtc8mxiNhM31MxoDkZntcea4Cjd
 wqTGkXyeMeJFcyrzMXIPCNT0qgOD8vTXlVYWAVULgmATRiluK5tS18eO6
 YPya+LiUdkH1NjqIdb0T+gDbklvRPEKkIkyf1bYcDCOSwMUgvevZNf37s g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10448"; a="273547894"
X-IronPort-AV: E=Sophos;i="5.93,258,1654585200"; d="scan'208";a="273547894"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2022 14:06:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,258,1654585200"; d="scan'208";a="605792502"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 23 Aug 2022 14:06:34 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 23 Aug 2022 14:06:33 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 23 Aug 2022 14:06:33 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 23 Aug 2022 14:06:33 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 23 Aug 2022 14:06:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j8V/YvLn0sZoX//ojguOsFVzBBWdX9SP65t/nRw5eRY63K5NfQk7VAb8xRwlMU7zt+igzJ3tZds1yL1LKpKDjqZuIGlPqFInUrpuvVp/1Dgpezg+gMENvprIAb+OHnEjKhGIlMmJzUEZ5IA3UQQ1l4Hro2A8SODK3wDEFfTEmLYtK/L1cXTFv4y0bQBXf/g4unmiRO6d8mk9M4VOAB9tRiaS+lFNulAgseBLbfskEP4NUr0pVqssDSqf0qB5iS0i/j67YVFzeH+7WDjD02zzGlK/7qiP7Im53/FyAPRGW5ZFUtimVlLzC62bscSZJcGIGibAT4nMK21b2HgAtmnJiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BDkLFHPmfsDohvcMf5kOhuH7rDPkqhTsb/4eTNUNr5Y=;
 b=O1yZbw0H5KwRpVJtzHdWF1T4s+89onqiNNlzZKRU1lMX3NzBKa/VSaLwbLlunBWdWKWL0HyoGm1gEax4qzn5AMlglM9/GS0wFkujhXplDOXYSU9XVIEIQnWxmtoWHKbvhMDzjEm8+tqmMoRE0LyY1VQzST09FOFc7XVXC1WPKvkc1A6gkTauXHqEV3Sc+fdQmypVJrIoHtt6xmn36TUm0fMRgtKUowvRFk6RICtYgQ3gj1qtwPwADf28Vt/zezA1v3I5HduX5H0ADiKks5E3dsAvpXWXkjNDSpyPqgWOPI3jIw9icYPnSkI/M9VGtNvcpMdDJnJxoQsdYQwzuyU2ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SA2PR11MB5130.namprd11.prod.outlook.com (2603:10b6:806:11d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Tue, 23 Aug
 2022 21:06:31 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e%9]) with mapi id 15.20.5566.014; Tue, 23 Aug 2022
 21:06:31 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 1/2] drm: Expand max DRM device number to full MINORBITS
Date: Tue, 23 Aug 2022 23:06:11 +0200
Message-ID: <20220823210612.296922-2-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220823210612.296922-1-michal.winiarski@intel.com>
References: <20220823210612.296922-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR04CA0055.eurprd04.prod.outlook.com
 (2603:10a6:20b:46a::11) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 621d0f55-39e0-4444-24fe-08da854b5a14
X-MS-TrafficTypeDiagnostic: SA2PR11MB5130:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QQEZa12bS/rCvxmxmYA736rDROkTrsCzJfso3y2gm/spF75dQEiIOJUmg++M5EJ7Z0AYxDhk13PEx5MQc2XM7S142z2sttU8Oo2ydl5EMgujo8WcMqJOOfdn5exveA6VJF+h2VtS464rRUGUR1VE4NniKPy3zk9z4HIb16ungmVb2+yfU55WaoWVLNwGs1ZqYm4kBbxWpxRxgcllAnhSqAxBEiHGJl8I7d1PF/zVSh6lJxIqwG/0NC9XF31Bv46TuxOlQyIdE9e6DzvTihhy5WGxc3gO1VpcQszT3eV+HzfVzEELQd/GHxMeyuRcp3eny5ybqBsBMMZ/wLv92VTlR0I76SA+0rrcxis60TELnsaFqUaYl/5mUJg5c/0xAuiAg3dCXNfnSHSREDW02XmiW3fhZpSpQoEBiYXyfjVttVSJfdqDSUgsOyvIK6IjOfBwHBFn2B2i+vVcs+w1JDNSu58KKFwlEJwEWfum/enSXaTxoC+SShg+mdMZcP4c2MsBzFr/yMxaFEdwtQQ6+8psjp+x0tE7smkql8Bmgk+3kghrwwGgnz4bRrR5xxp0PocVtI1ZquOIW1lEpmgq3MuF5nROY0cIw6mue5UlEOIojzi5Ngjng9B8aZ7z18WZLS8LxVXtoGBMisprfGQeagQg9YydSB0rNJfg2OEQAhmcPqmPpbYXP3D+lAkFafMR4Q9yHM25sVksiWAM7IWeQnEJdg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(39860400002)(136003)(346002)(366004)(396003)(6512007)(6666004)(5660300002)(186003)(1076003)(6506007)(2616005)(8936002)(36756003)(26005)(86362001)(41300700001)(83380400001)(478600001)(6486002)(38100700002)(82960400001)(6916009)(316002)(54906003)(2906002)(4326008)(66476007)(66556008)(66946007)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmNaVHB4OThiRFJZVko2dWlTdVFRVS90bVZWbEltTlBnVldCVHkzM1dPNUYz?=
 =?utf-8?B?NmRYWGdacmhDL3NSeDUrRFZlN1h4Y3dwSG9wNnRhMFJweldWK3NMUlh0TXVt?=
 =?utf-8?B?azBlaE8xTGZtOHRRRHNJV0ExeERPaGJtbHFkMEpyODFmL0FxWEtxdTIvcmY5?=
 =?utf-8?B?bXBScERqd2FZL0xOclBCNTBEWkZGMXozenRQZlg4TkZEK0lvUWVudXN4NVJ2?=
 =?utf-8?B?ZS9qM01YdFhSQ1JROGE1UFdIZ0h0dUZENmNiQVNGclZTdDJsVEd6T3ZaSzZM?=
 =?utf-8?B?TkcxYUEzVDFLcG1Oa1lNeXBwVDEzcFN0V1Z5S2s4VnoxYnFkckFxa3BReVJH?=
 =?utf-8?B?MktYd05aM1RheU54aUt3WW0xWFhWVFVFWStJNVdWdHhva0sxKy83T01DampP?=
 =?utf-8?B?M3lFVWcvaGZES1ZENGNFbHJxWjV1MnBTZ0JMUnNwOVM3OFhBd2l3OGZXZGlU?=
 =?utf-8?B?MmJJRDZhVjQ1eC9Cb3NOdm1USDV4aXhJY0ZyQmlPMjdiajl3SjVrMUl3alNH?=
 =?utf-8?B?azRHdHhvZkhEc2JGM09KVC9mUy9sTE0xa0QwTWcrcGEvd3RvenJ0ZjFFK2Z2?=
 =?utf-8?B?TFlkRDZTNEV0RklqbE8zbjhBMVovVGFqTWlMSGVtNVhwTWhMVVhRRWtLMFN2?=
 =?utf-8?B?S2ZjOTNRYmcrNUJqWjJaKzJRbHRqNm1zc0JHejhNVWFSY3I3ejIrMU9QeGRM?=
 =?utf-8?B?NlZ1aEpsM2pHNGNCTmxka2I0UGIvcXZQeDNXZU1wbGhKdnIraHI4aTlRTzRI?=
 =?utf-8?B?dlIxckhLdEJEZjZhcHBSOXdjdGgyK1dCb0o0L25YcGVXa21mcThTWWl2Y0lF?=
 =?utf-8?B?cy9RRlhSTDVTOE9yQThBdzBObG9zdm1EdkM5L0hKcTdSQVh6Z2s1dkN0eG5Z?=
 =?utf-8?B?bUIyTVJZbUdOcUgydTdMUS9qVVlGTi80Z1l5WWtqQ2J3M290R2o2c1JjdTJx?=
 =?utf-8?B?NnVGdXNsRnpIb0RmUnplQXJmcnd2T0UzRURLdzJJay9vUnlEOGpQRnFzQXZR?=
 =?utf-8?B?Y2hrZGJIV1FHRUZLNkxFbzlQRUVmQzZyNzlWSDhFN0xkRm4zUmg5UGZ0dWxV?=
 =?utf-8?B?eU1xZko0bHVtcUdoM09UTUw5S25oOE5lQXVPVlJLRlFwajJ3eXRaTVUvYnNo?=
 =?utf-8?B?aW02QlFUbjdVZ08rSFdTazY2NnhMRE4rM0lsSlFjN3draTZOVUpheU9OUldT?=
 =?utf-8?B?N1BnNXJuY1BHMithdGRUSUgxZFlURHl0VlNnN2pzd29Id1Z3RklHS0VseWg4?=
 =?utf-8?B?NG5BMXE1Z3pkaGJQS1Z5dVVGTUd4UnlWR0l4TnIzTFAvTGl1dmdpYkdta3dT?=
 =?utf-8?B?TmlHWHJVR0p5eE5tbXJvL3E4VmFVU3RVS212NTU2UktweXFncGdZYmdSb09F?=
 =?utf-8?B?akh1QmduZVFWZENyUWZqNU5QUHhocnlKczBhNklQNEh0RlV2TDlqOXNUZWhh?=
 =?utf-8?B?Mkhyc2tVSjMrTlNrN0w1dlA0SExYSW11bjVEUGhHYVZIZ2tYQjUrK0lMdlNL?=
 =?utf-8?B?OVhPcU5uUExjQTRQTFhzbUxDOVBNZm5Fa3V0SEFVSnpxaVpuNmZQeThESk5G?=
 =?utf-8?B?RXMxY3ArVFcxb2VFZEpGdWlRVXJJZUNsWGl2dGwwRnJvekVnZE5qZUYvTkE0?=
 =?utf-8?B?V3VTVyttVG90THk5a2ttU3FYQzlYYllTV0FZOWVFWkRGTVBVNm9jWTNIRy9O?=
 =?utf-8?B?d2lVcG5ra0FtdWJYMnRlc2g4RTNxaGpIeHVWd3l2NGJCb1oxOG10T3Yzekhs?=
 =?utf-8?B?elRiNFExanp1LzcyMzN6OURKdjhBcDR5cTIrMHR0VVZjbjYzdCs3NE9KbkpP?=
 =?utf-8?B?YXBVa2ZmV1BSK0hCT3o5dEg3T2hvbWRBWnBVcVZCMWIycmxSWGFkN0xTUith?=
 =?utf-8?B?SXovdlpJVXZDRXhlSWpRRmZldkJ6TEFEc2dBRk03VWxBT0QxQzZUYTNLNTdC?=
 =?utf-8?B?aEpNS3VSenJPSUlaQlZKMSs2N2lVNHo4SjMxL0N4MWJXTG80WkNRR2wyWml1?=
 =?utf-8?B?TUlrdTA5MXJtbis1U1o0SWh3cU5vVmhHNTlLZm0rL05PUXhJT3gxRmZYNE05?=
 =?utf-8?B?VzZVbmZSTXlScVluVGRvR0ZqckpYWkZzSFBESCtFbmsxL3NqbW81TkRFMTYv?=
 =?utf-8?B?akQ3dHpQOHJnN3RKUkViUGk0amxpWHRVOE5HL1RFMXA5Smh3MG9CaFQyREwr?=
 =?utf-8?B?N2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 621d0f55-39e0-4444-24fe-08da854b5a14
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 21:06:31.2750 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X8xIYZ91YHSOql6Mck0HcN5XeMlTS2ITs5JflCWmoTJnCM7J8vKEckeI24XSDKuqMhk/wZaaaxuzY868u6gVhDnO1CRXO5f1YfB36uIoMBs=
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

Having a limit of 64 DRM devices is not good enough for modern world
where we have multi-GPU servers, SR-IOV virtual functions and virtual
devices used for testing.
Let's utilize full minor range for DRM devices.
To avoid regressing the existing userspace, we're still maintaining the
numbering scheme where 0-63 is used for primary, 64-127 is reserved
(formerly for control) and 128-191 is used for render.
This is continued for minors >= 192 (192-255 for primary, 256-319
reserved, 320-383 for render, and so on).

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/drm_drv.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 8214a0b1ab7f..b64b5c45cd80 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -113,7 +113,7 @@ static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
 {
 	struct drm_minor *minor;
 	unsigned long flags;
-	int r;
+	int r, start, end;
 
 	minor = drmm_kzalloc(dev, sizeof(*minor), GFP_KERNEL);
 	if (!minor)
@@ -122,15 +122,19 @@ static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
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
+	start = 64 * type;
+	end = 64 * (type + 1);
+
+	do {
+		idr_preload(GFP_KERNEL);
+		spin_lock_irqsave(&drm_minor_lock, flags);
+		r = idr_alloc(&drm_minors_idr, NULL, start, end, GFP_NOWAIT);
+		spin_unlock_irqrestore(&drm_minor_lock, flags);
+		idr_preload_end();
+
+		start += 192;
+		end += 192;
+	} while ((r == -ENOSPC) && end <= (1 << MINORBITS));
 
 	if (r < 0)
 		return r;
-- 
2.37.2

