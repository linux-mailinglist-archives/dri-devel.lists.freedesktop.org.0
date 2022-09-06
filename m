Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A52C5AF5A4
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 22:17:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37F5210EA87;
	Tue,  6 Sep 2022 20:17:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CDDF10EA84;
 Tue,  6 Sep 2022 20:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662495432; x=1694031432;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=iK6yPR25uATbMq3cTWOhf01aAfkZS5uJ1mbTY5RiIY8=;
 b=Grx9gtgc1zAA4ESiFtY4wfa/2zqXFjxok9tQunwpq/9clQwFdJQMFyt5
 g2fVX8J+BGjdebhQ1SdeG+k2vUU4ivG+HVSLlnZUb8BUUnHnnLOmo1HHf
 TBDsbA4QAAjVeSwxQKMTpe0LsYZTJwoaGVke3ukibUoysb6qyoRKH3fux
 ih8IDT8+67w9v7f2NEpokaswXQ74nViUKtfJw8cmZghq8G+OReLFnnZqS
 OpPbEzL+Xs6uxBUKffxeQmfV8HOQj3jU96J5FiABGN07R7zmevBtUJV+m
 lE+lzmK9YNEg1AEJqH9u3ENCkBMNJLWdjGlcan4t9E0KjDEE0RSydnyij Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10462"; a="297479864"
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; d="scan'208";a="297479864"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2022 13:17:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; d="scan'208";a="644310318"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 06 Sep 2022 13:17:11 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 6 Sep 2022 13:17:11 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 6 Sep 2022 13:17:11 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 6 Sep 2022 13:17:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vmr4KAVsCQF0K86gc1O8Kp5BovAJhu3VQBcRnc2YGqS8gX23ASLCztSW9vPJyBIub+lAqVzLuWFc90iyxd4Gfa2wzjUsXb6ZLIBQUmZxndTbn5TnROxNOBKHJpvXmOViISl7GK9rWb4Bb9PT0aNdLEuHDm+5KfQqLqWMbHvsZyYuohLYlD3+7rvAfLLdJjwDOadITYCts6CJBWrtGN7BR2NJrVisGS3ZAHsN500cfEplFbXYdGBoRaF+B+uD9Vm7HPldYGXvYeUH/wL6rf4UoWsiYX2hRNdPIeHMnQQgviStkdDjPuGKBGx8ErFH4tEGCewy7M1BEeZJlK4dnG6xVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jNpp4W7B+QMMucoL1cm/W+GrHno4Qa9i5upw4eTjxa8=;
 b=Q/eUAxI6E2qniOTe/SnFVmG7k2xxNJGJA5DCKBTpnQzNg0P+1PtWK90QQvwxmGGxBo2WhUXZidbVXoJNHGRJQBkAl68AGptASpgvdfA0O+9VS3aW51azWREum9wK8sulVPWEokJ3wpPaJsjEZJSfpvAZu25FnjfMmt1/6mCn/N6I2jIPKrcvMR8WGKH9mtyKBzvkC9tqOr0eAQbRdFVhCm8K5tWG8GkoiJjKj9PzpUffkQe9kCLPyUUfLPkrgUbfM/VAgiLd0Zg5Yfo6pP9n9iV1yt1CYt8V8Uad9Obgy40qgbf3ykeFginuc8k6VImL4i4EtDnbjgktNQY4sIwuGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CH0PR11MB5396.namprd11.prod.outlook.com (2603:10b6:610:bb::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.12; Tue, 6 Sep 2022 20:17:08 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e%9]) with mapi id 15.20.5588.018; Tue, 6 Sep 2022
 20:17:08 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v4 2/3] drm: Expand max DRM device number to full MINORBITS
Date: Tue, 6 Sep 2022 22:16:28 +0200
Message-ID: <20220906201629.419160-3-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220906201629.419160-1-michal.winiarski@intel.com>
References: <20220906201629.419160-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0104.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::20) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b7766d86-eaa8-4c91-e8d8-08da9044c664
X-MS-TrafficTypeDiagnostic: CH0PR11MB5396:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PZmdh0lMpwED6tUD/c7qwyqcCcy+Ur6edetyEtXCGWB68Gf5jhyow1qQD4s8noEO0V7papYtL5wjfVi/Sbk+C9v/X78j5BnVbBLSvDqAz35iyU3wpgNTl/Iarl1SN1Tz0OWkzt+YbQzz1OeombVQ2n3N0rmvA2R6qwvAHc9eFy77jvY78/n0OdGNRQHqUFR27ZLaHjxIcw2/Qay7bOy0eCD1iSN9pnqlF7pL7vAgMJ8WDGJlbM+2yvmwFyLoB6vGmcBKfybf6Um/4GcL/jVVsfJeEV+lBguXd9pKkAY8ZpZb9skLyd7IVg6lWDsNGtqNN8GgyUGwQpK0GHpTqrnpa01bYKwDgzz+KJqDSv5jYRbk8lp+7a5PDPQALH52HpwRrxH5pSCDFZIRP4BsiakpAQOSQCnMSydhmGyQl2fL3jctqXEzHvLLVqIprn7Mumv/VkDyRJLiuNmLDqs0/keLVT+h9Hyuubooj+1l7NG/I4ijUcMmhZQF0bkZuGhH23st4QxRXUIyYhq44ZW0+iUyGP2HeaIWYitfH6H/rOpehPASSioxybnPFTGqUlSQkHoYMHVo2jEF6wk7uQzHFt8iFi5ihmEKAoRUeUY7w7CFIN2bDO2om8fPuePOKwoJz0cpOoRBDdTCX1MNc5/588ClsavsPqIvR/O9wwBn3U0th0yxp1bB36JW5TaDAJw/eq/N+OiellFuip0hFCv/nNGBBg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(396003)(346002)(136003)(39860400002)(366004)(316002)(54906003)(86362001)(82960400001)(36756003)(2906002)(38100700002)(5660300002)(8936002)(7416002)(66946007)(4326008)(66476007)(83380400001)(8676002)(6512007)(6486002)(2616005)(6666004)(186003)(1076003)(6506007)(478600001)(66556008)(41300700001)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGFJVDZnS0FmV2VHc0hLQTZuOGVxa2ovWWJ6UzVvNmNIcHlOdFpxWHhBQzZ3?=
 =?utf-8?B?bWZGQTVQc1pHTmxCcnBrcDdab2pvK2J5Zkd4WVVnbjIxaGp4WUVVbEp6RWxy?=
 =?utf-8?B?cmU1TzNRbk9JazZQSnVPVG1yUDc4dXJkdytWTnE1UWFrdTFOM0xNVzRrLzFM?=
 =?utf-8?B?MytwamxqRFJDMFBZM2t5dDluanNldDRzbGhVdXdXN05FSHl2L2cyR29rRWlo?=
 =?utf-8?B?ZTF4VEs2WlJjdnhtcmFLd0NDRm9NY1lUU0JGNzdpdmR0RDhYb2hzOGE0TXpG?=
 =?utf-8?B?eWhKQTMwSmg4cGVIYzJlVkJvV09GNEx6VlhBUm5EaWZrdnM2aTl2SjBDQXJn?=
 =?utf-8?B?WkdaRzFPd1hRZjdKU002aXFiSDFaUW5DZS9GS21vb1d2VXpGOSt3dFhTVkt3?=
 =?utf-8?B?bUJlbTJ6S0t0ZjhVVnF5WXNxaU5TRFJNUVpkTitROUVJb0pLL2llYnZiczNi?=
 =?utf-8?B?S2YzMm1NSlFZTmozdy9pNTdybU1FdFRDZCtqWFpQbnpJYnZ0TmxFNWtRcGdv?=
 =?utf-8?B?UDRYUEtiSkZiZDlhSWMweGpzdVlkaS9BRmtxMW9aSHVISW9oNU56N3pzVkZO?=
 =?utf-8?B?RSt4M3VSMFdPK2NnUllzYUE0VW4wVkRQeStzQ0NHVG9kbHJvMHIraCtKS2Jj?=
 =?utf-8?B?czFqU2I5S3hxR1JWWC8zOVRqaXg0TkxqbzcwcUVvMWNLeDNubk1TeEVuSmp3?=
 =?utf-8?B?WW1xa3l3OEFNbEg1bGJkdUlDc3hZUUNQNU9VWTJVWnRVVytSMzd0RkMwdzVN?=
 =?utf-8?B?c3dXT2JDL25rdkdDSWRNbk4wbVBTQVMwVHJNNEYwM2IwbW5SeXQxcHUrekZs?=
 =?utf-8?B?QjJwVmVvRi84QU91WkFQZDJjakI2dy83bnVUcEdmTWZWQjlHMmRrT3o1K0cz?=
 =?utf-8?B?VS9YRWxsREhqS1VGTnpCWW10ZVhzaEFNd3ZneXppdVdtSlhyMG5NbXlLV1Rv?=
 =?utf-8?B?Z3Ryby9yaFE1Z3hObW1ISVJ4d3dKSU1lSDJpdTBKdXVBVEIwUHgwVlhFNFRn?=
 =?utf-8?B?NEl2bDdXbDNidDE4dVB3RmZ6NzZxV0cxRVMwTXhQYmRNOEFvRWxjU2VyZ0pt?=
 =?utf-8?B?WXJ5OFp4b2JHOWxSakhJZ0p6N1lUVEJjMWNSK0VSeWdxS3ZKVWRsazFPcXpi?=
 =?utf-8?B?TWRmR2cxS0FmOWRZQVBVOWhFSzU0OEI2dVRtd05XNDZHRjZrRE1aV090cUVL?=
 =?utf-8?B?RnJCVXZSYUNXcGxiUG9SamRrS0RUNTZxSzZQSlhQN1kxdE1OaDNoMkJzSFlL?=
 =?utf-8?B?emU3U3ppRGlVQWd5bTgxNUxaUGl4NkVXYjlzUEFkMVNRR1RndGFqN3JoYkNs?=
 =?utf-8?B?c3pKelNDRlJOekp5aGJIelhtTytwaDUrcExHZU5nTmg5dXZBbzJEeUZvUjlM?=
 =?utf-8?B?dEdCbzZEckNyYWtMNnNpK0FtRFJEU0h2S3pHa2w3WXJkWmJSV3d5aVhHSDls?=
 =?utf-8?B?QzdWZy9NWFJhQkxzRVEwSitac2o0dUJNanFONFhiVFR1a2QvV3BGMXp1WFhP?=
 =?utf-8?B?WkpBOENKdG1LdDlVbWkxUjRyTlM0aDBrL29OZ0taR0ZNSXVNY2FzdDNjeWNu?=
 =?utf-8?B?dWRhK25oZGlzN2NWU00vSmlzTS81SURxMjlKZjdDamtBOWZTaDhnSWtEbkQ2?=
 =?utf-8?B?REhMUmZ5YklzQXQxT3paT1B0Y08zN0cxb0sxM0pSUnppV3pEWkNwVnVQeW85?=
 =?utf-8?B?WWFPblNTZGVFdk40YVh0Rk9lUkdkVGw0YnhKTm8xWlFETEFjZmVEdER5VllM?=
 =?utf-8?B?ViticzVsRlhsWGU0OFpQaWZYMVBFU0VKenpLbUJPdGdSV3Z3NGcxTSszUmF3?=
 =?utf-8?B?bTRUeWZXWExBUGw3NUJhbWorY3JOaDlsMnBSZnRVYVBFdjB5Y0lOTlhORXN0?=
 =?utf-8?B?YkNIc1M4TUN5Tk5FQ3J6dmNKejNFcmRReVVPU2NsZno1UnBON2tZeTZzNkpk?=
 =?utf-8?B?QXVyTmpuVklZZDAxV3RDMW1SUEtZZnhyYTFMMllaaVJHaC90djVlU256cVh2?=
 =?utf-8?B?N1hHcFhBN3BDay9CRmNEY2dlTkUrTm0rcUZ3MHZxN3lvbENNWmpkeENyRjNZ?=
 =?utf-8?B?Wk1lWVR4RGE2Vk1sK1ZIVUhUTlNQZ0gxdjRRSHMxVHhVSVNzS3pkWENmMmpQ?=
 =?utf-8?B?c0RnMGc0NHNNUDFtZG9Pdks5QUJDcWgrT2ZWdTVRclQrNVNuVmxqVjdKRFli?=
 =?utf-8?B?Rmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b7766d86-eaa8-4c91-e8d8-08da9044c664
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 20:17:08.8274 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CdEI5dOPnaXmGTrjwQEVdOH7gZHr58tqC7wdmp+9uRVzmb5dZe1ZMuckcl+nb2H5z8pMJO73TlD6ZDdqvXqK4UwcjIUvAymhs7kO/gaQK0M=
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
 drivers/gpu/drm/drm_drv.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 41799e4d0432..2c6e0b8d3b7a 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -119,8 +119,17 @@ static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
 	minor->type = type;
 	minor->dev = dev;
 
+	/*
+	 * DRM used to support 64 devices, for backwards compatibility we need to maintain the
+	 * minor allocation scheme where minors 0-63 are primary nodes, 64-127 are control nodes,
+	 * and 128-191 are render nodes.
+	 * After reaching the limit, we're allocating minors dynamically - first-come, first-serve.
+	 */
 	r = xa_alloc(&drm_minors_xa, &id, NULL,
 		     XA_LIMIT(64 * type, 64 * (type + 1) - 1), GFP_KERNEL);
+	if (r == -EBUSY)
+		r = xa_alloc(&drm_minors_xa, &id, NULL,
+			     XA_LIMIT(192, (1 << MINORBITS) - 1), GFP_KERNEL);
 	if (r < 0)
 		return r;
 
-- 
2.37.3

