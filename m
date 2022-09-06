Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D98505AF5A9
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 22:17:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9167C10EA8C;
	Tue,  6 Sep 2022 20:17:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A253010EA86;
 Tue,  6 Sep 2022 20:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662495442; x=1694031442;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=+1+LnVzmjZLuT4xn8PzW65yv0ZishEmy63sB8z50MY0=;
 b=UMM6WUnJuRqfKZ3iBcfL/InLeeCLcmM08dhS+gd899OQ8OTTmtLJJb6b
 bnOYeeuPwa7OD+Zp2rJw9bSBufBR2ehod2rlcDwt7Bnid9B/BbsZYey3T
 rzcyxTpDmPPefWj3ZuUpeSlX5hkFXDcqTNWmVT2c4NV01roDCmOUANeFl
 3eWvDMnfgQ1ig7V6Lb4EB0e8T2Yks3+iNY+nwb8eKX0r8iJrfzP46071s
 GZm87tkPAKhQPQsgS6ECeiXifwLvYtLOFWWsPmRt0+zM4oWGrW6nYyreM
 9tecBDA2wfbKmxRaId5NYCKOg1MitDe91AMYWz5J/3uvurKydBFtEEn2y g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10462"; a="295429566"
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; d="scan'208";a="295429566"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2022 13:17:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; d="scan'208";a="610076412"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP; 06 Sep 2022 13:17:17 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 6 Sep 2022 13:17:16 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 6 Sep 2022 13:17:15 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 6 Sep 2022 13:17:15 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 6 Sep 2022 13:17:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h28KfABK1wl87sz/eXyI0U27Y7T4blx98FD2vHxYu4/SkdgFzvqcXAWjH2JhAogpZO0OkOVoi2uSyrfJe3rssJevi2djdyml/y+jeKFkR87bMoRGPSFFIW0THXZQhtuCPzDYnZlPHUUuqUpdPtH1u92T0XjIWtvCPdd0Cqv7kd7NBQCzieRh8wuXCaMUEBAUPtBwEhMSfM0emdVpnJLgrWF8qArKCfvwLHYnaqdO7EEzWBhlcIk+Won9SxGt/+F/pmy3vlgdgpEO75JaXZaWwxowSiitEe/NKrNoXvK8Oabe51TEtE+Xb+PPzGxbfxDBmX8g09VCndXhOrQIX5aC8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ve6QdgVn2HhUmYWGm9Qgx+/p/gLZiytkBQP39Am1k4c=;
 b=m2huJ1jpOg1CQ5V0MJc2jkR8Xp03L3Od7xJ1ng1zK7I+Lhsq2cW/JjYnhdCUF9AEkEjQX8Sea5UnZL0nZaV0dE1xqxLQ91BOyGINwcy/DuvHHQWcSIi7aZrFvcAm1MtB0lt+vBeMTWLRdNYvQ4FkjXW3BoP7KpBkw7H71+AwcCMGCEbPIsMld44g/pDU33rvlE94haIVPWgv1whIDfQrUWLvISLuGCXc68gDmiqvoDbuGj/cXXmHHdkZujsLRODEv3SovhaQIuayAvd6GXsWtwyUIOcyLCm0YzKPuRzZy7usJFxS17W4F/+ZnmfGsTuiJv+jtW2WAz7NACz9+yHQPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CH0PR11MB5396.namprd11.prod.outlook.com (2603:10b6:610:bb::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.12; Tue, 6 Sep 2022 20:17:13 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e%9]) with mapi id 15.20.5588.018; Tue, 6 Sep 2022
 20:17:13 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v4 3/3] drm: Introduce skip_legacy_minors modparam
Date: Tue, 6 Sep 2022 22:16:29 +0200
Message-ID: <20220906201629.419160-4-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220906201629.419160-1-michal.winiarski@intel.com>
References: <20220906201629.419160-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0138.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::17) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 601a84de-af16-4228-777e-08da9044c924
X-MS-TrafficTypeDiagnostic: CH0PR11MB5396:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HEOJ0k4NMriI/VrGLW1ONpsqKrYFto2gy3nsFbOHPosO6kuMgUfKMIwzPiOSTFc0HAbggyGUwmUAZMhqFnfXVIify6cGkOy8yYruC6lXb9WvzTadR57HlZDXcplDLxREstsXOGPesUkkeVGYhJbIkk1LbwwLWvA7mlWTxf84wk22+1yB8vfaH1lsHNiFRUNauWemiNq9jeHl5TwW2Yxz1X/++BNcWtYy8ECJ0sv1CBGJLs6rOTtbtJ2pFc3gzKD9WMdVnROCtZsaAxYaVpB4jk0XMn9kNS2t0l72ahNbX3AugN+xpLLpwEGAYtYlTsisIoVYr5ybHJA9XHPrWrv7XbKfXpw3U38cHqd76QN20lhzwD6+XEx9Rqd5LLL2a5WN0RCd6zZT4pvoR+YxNNP8NWzRIFxqvCKsYPtOYjArr+JWDSzqBzecVfrFngbVDDtOdS2GueXuz8G95l4t2iUFO8a7r13FNymJjUhpc/oi/+I5P4YhIH/DlVaQg0DX3cnOgjN8NA4AFYfeiIezAuhXq/SipDYRoD0IQVZ9PE4+aB19NOm78ViprnUOE3cgIAaiFmRQ4H/KfaLvgPVrKeJbru66n+LAUpDXQPKvos2VJ4wcF/YwyDqiX1qvKYqRt8kZShgch5V+WXJFA3vMvym5EJhkb6+P9XFE+lrUIH+pC7rf1VJkUuSYua6/HOwi1tavM+w1yNehPmkGgAAmHJbEPQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(396003)(346002)(136003)(39860400002)(366004)(316002)(54906003)(86362001)(82960400001)(36756003)(2906002)(38100700002)(5660300002)(8936002)(7416002)(66946007)(4326008)(66476007)(83380400001)(8676002)(6512007)(6486002)(2616005)(6666004)(186003)(1076003)(6506007)(478600001)(66556008)(41300700001)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTIwalE0Y0h0UTRDWURKUjJKZng4bTI4Z05wTm9BTjExSURjbTZHMlhwbFJG?=
 =?utf-8?B?UEQ3SGRGaVVWR3l4K3gxWEt6Tk84aFNVbndaNTQ0TTRmNXF6clZRNEtKVHRt?=
 =?utf-8?B?WTlQcjdQanNWT1FlbHdEMGYwOEVRaHpUQjJvMTkwUXRIMjR4Y2dSZElmanQ0?=
 =?utf-8?B?bktJRDVIN0xOcTRleUFBSUJHUksrRm1tUzROWHBkRU92ZnR1Ym8vdTZlbWxU?=
 =?utf-8?B?bmJLY1NxdEdRbXFSRGk4VFR4SnUrSVRqbTEveDlXSndIRzBPQkRRTjJlcno4?=
 =?utf-8?B?bUQydm00Q2VnUytGUTJsRk5LNXN3ZzQzTndCdWxrSzlKTk5VWVhrMmR6NzZw?=
 =?utf-8?B?b2VYUW1URGJSNmk3L3VoTk95RFFxWUllRnBqWlYvK0kvbHJSQzZEYVJPYVBL?=
 =?utf-8?B?NmM5UFEvVXd0YjZvdFVOVE16UzZPUE1vVVlScEdCaXVsRy9pbXRTVnJGeUJE?=
 =?utf-8?B?dFhON3E1aDJ5WDNWa0syZnA4OWlNK0pQbFU1ODM4ZExqUzlSV0lFeDBUbDVr?=
 =?utf-8?B?SG1UMGJqNXV1VDZyaFQrczBVVzlTZXdjMENWK20vOHpINi9BZ1Nvb1p5VWRm?=
 =?utf-8?B?a21pWElxTTNTVndyUS9jMWFhMklJQW9sK3kvMnRVK0JtWCtIZ3hXMS9KelMr?=
 =?utf-8?B?Q3E2ZUI2NUhUNGhhMSt1Z3liL3Jvc2JQcnhuVHRRcHRqSXJUbGtmU004Nm8v?=
 =?utf-8?B?NWJNWkJ3VXR3bldCS3hPY3dTd3I5YVMvRm1BQzhwTFBCcHFETlNHeUdZeWlB?=
 =?utf-8?B?L0F6bDRGMXpNS0dYdHV0RmRtZXVsSDgySEMxbVN6dC9KUEQ5REt4SmhjMmRW?=
 =?utf-8?B?WEQxWWVsYVNMbmxtWTZldG9RaVhEbDUwcytybklqZWIvakhXejd3SmxMOHdt?=
 =?utf-8?B?bHR6YzhHV0R5cWZpTkVCMkRKTmlNK05xekJyRjlRb0Z6djFNWGt0NUhSZk00?=
 =?utf-8?B?SHdvVzFORGpER0JaY1JlbGR4YjM5MVNKNjFvVGpwQnhCVEtjTE5TcnA3WXpX?=
 =?utf-8?B?a1NkKzk1SjVheVhpc09EWTJrNmVXaEdrQnVlWUprVjRxWEM2ZW82VkZJV29o?=
 =?utf-8?B?WEpaa24zTjJZaUc2MXp1WGRydmdIRS83cVJXZjlZSzNsendiZ3pwbXRNczNS?=
 =?utf-8?B?YzB5eXNqM25iS3hJQWFwYTlTdWtYWnZIcWpaQXA2MzBEdS9COE11d3hIM1Vh?=
 =?utf-8?B?QWFpYStOckRwakhhdjFyZ0QyOVY4M2hKN2x4MmR1eU1QVTFjNWFucXo5L0c5?=
 =?utf-8?B?RytwVDl5T2RSbWVsK0RvN3doNlpTYzcxR24rTW0yRDZPOXZOSDV2Y1ptSTZh?=
 =?utf-8?B?S2dRQm1paWZZZkF2VVhRZ1BzUjg4ellXTUgzR3BxNWgwaGI1b29xUU56d2dI?=
 =?utf-8?B?QWxtcnpDeVhEVmg0RCtDbnhOTU9Cc2pKRkRMWUhKZTYvUEtsNUNaemJWd0Rj?=
 =?utf-8?B?UFZ2bmpqaGNuS2lTQzJGRVgzczBLTDNnYzNyRzJlWVMrZWYxVGdoeTZVNS9j?=
 =?utf-8?B?dTdQSzVzaStXdVB1OUpPeU5kYkpoWklQcnhyR3pTUXpKZXpWM3ZIbUtpVzBQ?=
 =?utf-8?B?R29CdVd1cE1Ua1RYNURiNno2aHlIVUNVdEpZQkl2enZKbXA3dzV6Z1hZTHhq?=
 =?utf-8?B?TGxvR3VhWkV6dDhXa1lsMCt1WTB3U1ZHdGkzR1RTdWQxQ1ZMZGFWQzhPTExP?=
 =?utf-8?B?TE5UWE9RZ2F0ZTBzQkhqc0RGU2lSUjllL3JNRFhuRFBXV0VVcWJEU0dNUkpn?=
 =?utf-8?B?VEtKR3pURFFIT3FINlE2OWM5c2pXb1pGSGFodGswVkR6M1gvMEwydG9Za05L?=
 =?utf-8?B?dTRoaVRPUTdYemxVZjFHTExzREFycktCM2U4U1NCaHV4YjZaUlhzN0t5Tmpp?=
 =?utf-8?B?OHJEeUdRMWZJdmVjdDdqZGFTaE9ncHdTcjA2amNBTXFBQUpOa1lUUUJwd3Ay?=
 =?utf-8?B?Qm5manZ1N2RXN0N1ekd2V0FpQjdkQXErY3RsYmpBd3pEUVVYWUhCcC9VUjMy?=
 =?utf-8?B?V1BJL0lxREpSTFFBTGZBaEEvT3l6SHI2UU0rVE9wK3czbXlZNVFTazdYeUN0?=
 =?utf-8?B?M2VyNHRnSi9BYU15bFNlUXNIdzNTNjdnWFE3MTU3cFR5cDRQL3ZWTUZtUUsx?=
 =?utf-8?B?dXFNWU8vbHo0cTVTeGJHbU5CTUI2TTVBSGV4RVZyUVhLNWpGVnJ4MXlVWHJ4?=
 =?utf-8?B?N1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 601a84de-af16-4228-777e-08da9044c924
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 20:17:13.4694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JhQHx25MuAlcJFKmjRr5eI3U5mvbxxd51BP1j+li5JQ/Hb7Q+LF+Ehk1lUCxZIBjI1svX24lBsDidYYODMpBa6PD6c9bJ3yeHb1vdRgJUQU=
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

While there is support for >64 DRM devices on kernel side, existing
userspace may still have some hardcoded assumptions and it's possible
that it will require changes to be able to use more than 64 devices.
Add a modparam to simplify testing and development of >64 devices
support on userspace side by allocating minors from the >=192 range
(without the need of having >64 physical devices connected).

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/drm_drv.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 2c6e0b8d3b7a..11c691543fec 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -56,6 +56,11 @@ MODULE_LICENSE("GPL and additional rights");
 
 static DEFINE_XARRAY_ALLOC(drm_minors_xa);
 
+static bool skip_legacy_minors;
+module_param_unsafe(skip_legacy_minors, bool, 0400);
+MODULE_PARM_DESC(skip_legacy_minors,
+		 "Don't allocate minors in 0-192 range. This can be used for testing userspace support for >64 drm devices (default: false)");
+
 /*
  * If the drm core fails to init for whatever reason,
  * we should prevent any drivers from registering with it.
@@ -110,7 +115,7 @@ static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
 {
 	struct drm_minor *minor;
 	u32 id;
-	int r;
+	int r = -EBUSY;
 
 	minor = drmm_kzalloc(dev, sizeof(*minor), GFP_KERNEL);
 	if (!minor)
@@ -125,8 +130,9 @@ static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
 	 * and 128-191 are render nodes.
 	 * After reaching the limit, we're allocating minors dynamically - first-come, first-serve.
 	 */
-	r = xa_alloc(&drm_minors_xa, &id, NULL,
-		     XA_LIMIT(64 * type, 64 * (type + 1) - 1), GFP_KERNEL);
+	if (!skip_legacy_minors)
+		r = xa_alloc(&drm_minors_xa, &id, NULL,
+			     XA_LIMIT(64 * type, 64 * (type + 1) - 1), GFP_KERNEL);
 	if (r == -EBUSY)
 		r = xa_alloc(&drm_minors_xa, &id, NULL,
 			     XA_LIMIT(192, (1 << MINORBITS) - 1), GFP_KERNEL);
-- 
2.37.3

