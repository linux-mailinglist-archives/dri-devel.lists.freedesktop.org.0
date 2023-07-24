Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9857600F9
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 23:15:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58D4910E364;
	Mon, 24 Jul 2023 21:15:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3675C10E362;
 Mon, 24 Jul 2023 21:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690233333; x=1721769333;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ObQZPnTgYJctsRRFRwsoPbyiHauT+kzDucv7KMJN27k=;
 b=OQBXO8TIp4IU+aiCcxhXMHx8UzUj/ezh+CQjZ1He2CkVOB8KFZKhcKQS
 MQAJnYKn2C/QGNu2yWysESBVAFnTkCL3xDOwPAtuFUfApt5wxkz+OPI5N
 EMt2Jly8WAr7j8+oJfHDMr2YsfgQDbR9PbSlLRT+Z4I7jxy4TVIATzgc/
 4roXJdK00jnPWIK2dfpVBPz+NkLQrnrDUWUcVyn1xs40NQqK8xVVNTmLl
 slr3gj5XEoHGERDQGRbkAOly+OHjLHz2f9dLuTonvyPX2GywXDEbe7IYL
 sxlBJi7usparvadHC8moQb0Xm3Cd/SlKQqWKKRl0LSaRviG1R/yLV5o1S w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="365014832"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="365014832"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 14:15:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="899660532"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="899660532"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP; 24 Jul 2023 14:15:32 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 24 Jul 2023 14:15:31 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 24 Jul 2023 14:15:31 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 24 Jul 2023 14:15:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oA9rcH3JA8NnjP0JNMNfW6OJ0RmtLTLIUN+raHJoKOlfx3K3p97O6E0ucODaAxzePSb8on73FPve7QXPosqT3LFYVZ8yIy9R2u2aht90XRCze0SfJCaO2VcIaCk+5KpfPXIHVQ/c/x78pGBsIjsKYZvZv8sck7s2MnvR+Ufg2y3rrt9mI9qa7ZJidezyfOTIEcjqqMh2eYpis5DiI/A0MTmQC6JN4Da3vQnBjbKMOzpIuv/cHJNqBiZLsxQhz/MCBd62r/RiHeH8A/MD300hLqG8pADO33i4L7PLMBmPGjNAIqpsqBhjsXIyvzJL95HlkUR32vcOPoBNSANLrgbFQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p0RJm4ACZ5sQ7/Kawds8GvOcxSjjtxeRPVodKaexpq0=;
 b=DnXr948wRYYCzCCtr7F0WfPev+LjoSUctlpOOlwGwRG04kJ3ukKXpnDq6vfkKEsq0NfNjpfDEoTGOl5Tavo9eJp59dZg7taJerC+oxQH6qqRFTMd/+fIH7IQW6FQ58GY48W8JKusFZ2PPGr0/mGduXOAM71RdrDBFxqO/x8sWfBAWDMrulylew/ZeQvHVodZSp/ypYjGY3l9XYpm8fpbA2JhyIjcGef8hfP6N8iXNsddME2Y14FLwfP+AN3vYG1TJ9CSf8I45jG90F8KDdHzWQmKjLkjedBHKQcxyOCv5fdWLYDR/rdXnwo4gf+hkXBpKoofxK6js85vbI3HMvqkLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MW5PR11MB5809.namprd11.prod.outlook.com (2603:10b6:303:197::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6609.32; Mon, 24 Jul 2023 21:15:29 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::1127:c109:d888:f6d1]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::1127:c109:d888:f6d1%5]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 21:15:29 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v6 4/4] drm: Introduce force_extended_minors modparam
Date: Mon, 24 Jul 2023 23:14:28 +0200
Message-ID: <20230724211428.3831636-5-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230724211428.3831636-1-michal.winiarski@intel.com>
References: <20230724211428.3831636-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0132.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::6) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|MW5PR11MB5809:EE_
X-MS-Office365-Filtering-Correlation-Id: f9106c75-42f6-481f-0320-08db8c8b1b64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 460Li8QNaRhIJlVVYiATDiKjl/mPbHsjsyopBhK+tkMbQm7crmN7p/gxqjuSdyEv3pT9IUJJcsVFjZBdFiMJnHNP9zJMFeECl7zs1Ycve8EVNjYIXgFBpznxHMuHM/gte8gnHRK5e4WGpQBiPKH7pKbvDDK2gnLXPW+bx8cxjreoIgYsIos8iNQ/q+91NhZ0LjYgvWYL3BeqjQJ9vA04qXIcwIzykufacw3R184gC8m3L3FDAK3n+f9gS1XEgP6G9mfQH9aykQPHVJQCr/xddVdFvV1jC3sg/bKo1bguczZ8eQ/vPvbhq/OdFT03uO8pOPwNSCS8J3Y3/Wi/06E0occ+vfLc43U4eeYujs3ZsogidLBt4uKKwWfVP8EF+mrqBss6rDjGFYJ1YsAAsE1NVyM8p7fXsvH54LnIrILubG0nMTLSACGvbheh1eM6S0IvJyhLh2MlIEDCsSdz3+ucnEzFauQ6YvrqsxouEgDDbOAt60VdVQxMqB8YdIDBBZQcpjP8tKShybk2dGja87vCUsfPYKn5Nypaw+FbmhVh131FhuM3CvICP46YX9iTo0ND
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(376002)(39860400002)(396003)(366004)(451199021)(83380400001)(38100700002)(36756003)(82960400001)(86362001)(54906003)(2906002)(186003)(6506007)(1076003)(26005)(6512007)(6486002)(8936002)(5660300002)(8676002)(7416002)(478600001)(316002)(41300700001)(66476007)(66946007)(66556008)(4326008)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVdQK1c4NFR5NWgrZTJWbDNGRXN5UTFQVDcrZWkzSXd5NUpELzJyczR6ODA4?=
 =?utf-8?B?UFhHMjVXb1NabnZvUmNnNG5FbENGSE1zak40Y3N5eGJ6TVNyQkVPMEpJWm5J?=
 =?utf-8?B?MHhJSmtBV2VDSURiVjNWcjhGZEFOUC92ZDdxRmc5T0hIWlpYdU0zOGRaWUIv?=
 =?utf-8?B?RUVrekFNMDdUOTVwaEF0SDlnZk1ReUhHVGRFYTdlTFhSbHdCRFdqbFl4K2g3?=
 =?utf-8?B?TGNudjEzVW0yZWNodVdmUEdBWDJ6cVRyU2cxNGxYLyt1K2dWVVdSN1g3YmRC?=
 =?utf-8?B?TUIxYU5PdlVWaGI0eWR3ajZ1M0w1U1RjMEI5bjZ2cFN1YXVwV0FsbDZYcjFJ?=
 =?utf-8?B?WTBrS1NMZHpHaW1HR1ZNVUF5L3dDU21EOEhoQ1pjWEZqekFzaGo3cVl4YVpV?=
 =?utf-8?B?UDJLbytCYk0rU1BaWHdXVGVyazZXcjN6b3RSYml2bzBDb0JDMnRqUXdjVXhk?=
 =?utf-8?B?anBVQVcweW1hcElNRG5iWlU1MVp6aWJWajhTbHdEUU9IRmd5VVFlYytGWEJo?=
 =?utf-8?B?VUZOdGVMdENsUzFDbmVpQVpUeXlIbXJwQkZ3OFZHN1VLNFRoVVI4OUVwTjR1?=
 =?utf-8?B?dnd5SnlWYzBiZzZSdE4vZEcvaUJIbExMb1NXVnozYWk2LzFFMlkzMWs0c3Jz?=
 =?utf-8?B?SS9pdjhUMTZiZmZja2pIb21JZU1hZ0EvVnVMTWVTTEk5bi9XTXIzdDJpKzQz?=
 =?utf-8?B?ZzBuVW1wTENtMlkvbTY5Um1wY2ljbmMxbnFCcHZiQjBLa254ZStmNEVQZ1BQ?=
 =?utf-8?B?RGFWQndKcFp2YjFUS1ZLUkpFNmhIekRhTzRQclRIMVpLQ2UvcmJZN2ZTUW1s?=
 =?utf-8?B?N2IwckpIU0NIVTRPOVp5STdwQjVsSG83VmQyeW9VY09aWTdaZVZpZ2Q0RFR5?=
 =?utf-8?B?bXhqaldHaW90N0I3dzJ3VGNUNHNobzl2KzFPRUNMRnpqbkxsbUUxTk1tdWlG?=
 =?utf-8?B?d09DSHFVSE5SQWg4WUgxbkdyZkRhelJmaTZrcE52S1AxQkdnVXpyL1IwYnAv?=
 =?utf-8?B?NHQrOGM5OHdaQy8zT1VDU2ZHcDBWZXRtMHJDaVNwMGpXQVVSbmt5Qk5CWXFx?=
 =?utf-8?B?RVg3d1lVYzV1bitWdkI0TFlZaWMyMHBvaGxoTEFnZEtoRlBBQUxxYjQwbHJx?=
 =?utf-8?B?bFNKL3grNVlWbHl3eXNNc3NsUzdqNjNHaCszTHY3RmlleGMwa2RJSFBHK3Ay?=
 =?utf-8?B?aUdYZUh2OEs5bGZ2V1pBV0lMbzNwZ21Bd2hiRjR4elNuczBEcFM1VnBENEdE?=
 =?utf-8?B?bHZqcUFmNXJpZDVzellyR1hCWFhGclhIa2YxeTRRNDlZTW5iaUhrTzNnNWxW?=
 =?utf-8?B?ZE9WRWZld1h1TnV3djJISnUybGlGdEYvNkpBYnp5TE80cVV1YWlQeHlSRG5B?=
 =?utf-8?B?QUtrZjRkNlc3cGlqNlZ0bWRXaExBN2VhUnhhRkV2ZGZkYWJuN1Q1a0NpRnFD?=
 =?utf-8?B?YzBCc2RmZ1dKeE1mU2NYdllwS2JEOFRqbjJFYUE1QzlIaW05cGtXcW9DL0Rp?=
 =?utf-8?B?aTdhTmR4UzBNaC9UaHlYbU52U2NIekZ6eXZMeXFOUDNjQmo3WG94YzU4REZP?=
 =?utf-8?B?VzlNRHY3NjgrN2I1ZndzV0U5b2gycjdkcjFBbDFDZEhHOEdJQnlWc0g0OFUx?=
 =?utf-8?B?cDlKMVNCRjBEemRmS0w2Ukg4eThnR3ZVS05OK3NVV2hhWm1tQnBPRmtxV3Vs?=
 =?utf-8?B?MHp3U3YyQVN4UmQ3bTloc2g3am0vYjBkaHhSTUxqaVUzRmRGblp2NnIrR2l3?=
 =?utf-8?B?azQzUEdhWUlRVVBDYitkUVlzRlgvblJ2Q3lZUFFqcDNNUTYxRnowZVBCR29M?=
 =?utf-8?B?bGlUWmtLcUVYSG1tVFJKVlI4SUdsMllMUGQ5dGNQQVhMUUM2OUJ5MjU3dEZ6?=
 =?utf-8?B?eGRBbmFPVTVrM3lEVmRSdG9pUjlJQ2J3SkVFK3FzTDR2STAxRG5YSzVOakdp?=
 =?utf-8?B?RkJTWVFFeWM0YnNFZm9YSk91cXIvZDFFNXA1ZmQ1S3VOeG9JQzlzSmllRVQ5?=
 =?utf-8?B?YUxKc0ZMcHNJT1FxRlliYlcvQWZ1MktaRUxjWENLa1Q3ajk1Z0VTeHYxMzFw?=
 =?utf-8?B?TjN0SFJJMlBmK3lkK1A3YklJMEYrcGZHbWRiaFRwenluUnB1TVJERnYwczB2?=
 =?utf-8?B?VUtac0VIa0tLWnM3bTlhNlJPN0RzM3c4Q1NhcnlaN0x1MlhZRG04Smw3TVlh?=
 =?utf-8?B?ZkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f9106c75-42f6-481f-0320-08db8c8b1b64
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 21:15:29.2023 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UA/g8e58F49tcl/CsOVYBMorCL2mo3kzePvE0frBw5NNXnrGFixDsOn75g5nOzDNbzqkkXTvkQ8lmXJFeV9Um8ugr9LI7I4lGBtF+RYuYv4=
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
index c2c6e80e6b31..ef6d7b498784 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -57,6 +57,11 @@ MODULE_LICENSE("GPL and additional rights");
 
 DEFINE_XARRAY_ALLOC(drm_minors_xa);
 
+static bool force_extended_minors;
+module_param_unsafe(force_extended_minors, bool, 0400);
+MODULE_PARM_DESC(force_extended_minors,
+		 "Don't allocate minors in 0-192 range. This can be used for testing userspace support for >64 drm devices (default: false)");
+
 /*
  * If the drm core fails to init for whatever reason,
  * we should prevent any drivers from registering with it.
@@ -138,7 +143,7 @@ static void drm_minor_alloc_release(struct drm_device *dev, void *data)
 static int drm_minor_alloc(struct drm_device *dev, enum drm_minor_type type)
 {
 	struct drm_minor *minor;
-	int r;
+	int r = -EBUSY;
 
 	minor = drmm_kzalloc(dev, sizeof(*minor), GFP_KERNEL);
 	if (!minor)
@@ -147,8 +152,9 @@ static int drm_minor_alloc(struct drm_device *dev, enum drm_minor_type type)
 	minor->type = type;
 	minor->dev = dev;
 
-	r = xa_alloc(drm_minor_get_xa(type), &minor->index,
-		     NULL, DRM_MINOR_LIMIT(type), GFP_KERNEL);
+	if (type == DRM_MINOR_ACCEL || !force_extended_minors)
+		r = xa_alloc(drm_minor_get_xa(type), &minor->index,
+			     NULL, DRM_MINOR_LIMIT(type), GFP_KERNEL);
 	if (r == -EBUSY && (type == DRM_MINOR_PRIMARY || type == DRM_MINOR_RENDER))
 		r = xa_alloc(&drm_minors_xa, &minor->index,
 			     NULL, DRM_EXTENDED_MINOR_LIMIT, GFP_KERNEL);
-- 
2.41.0

