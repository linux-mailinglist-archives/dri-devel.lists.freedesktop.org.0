Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 992E651047F
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 18:50:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A43F10E8C1;
	Tue, 26 Apr 2022 16:50:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48DAC10E8C1;
 Tue, 26 Apr 2022 16:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650991822; x=1682527822;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=vsvsPqBsA2virfWAOHmkON3/lzwKrck4Co760IHJPro=;
 b=P9yX2jnqQqCmZLutf0muFqGvQQh1QIMS2lyFDjShh4CrJIvEHXBVmML7
 107VLA/k7kzBRqkitJlB5xyJu2YlpF1MQYxuguVRBxgL1XD93sVP3rOXk
 fTdQFjFnvrXH4scV3jRWadxle2DJJmzII3r//5BAJp2roHobuEF0+GCvz
 vGfu7Q1Ihqu0k0fI8ZpnEoOelHloNs5SCxFN2GtA96z0vKTVznpc/Orik
 lgLa5ZmsZQyVJm+eMCY1w5fd9G5YexO2kRlCQDq+KI9iYHY1wLWYsm6zH
 Bj7dr62G2avJmMaVQW+sUsff/+E/gnDRJvHfGlaFYDqTPU6OHDQpPrP/h w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="253028169"
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="253028169"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 09:50:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="650292550"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by FMSMGA003.fm.intel.com with ESMTP; 26 Apr 2022 09:50:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 26 Apr 2022 09:50:21 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 26 Apr 2022 09:50:20 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 26 Apr 2022 09:50:20 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.42) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 26 Apr 2022 09:50:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GA+cBgvJucvXt247guIBIyq7tlOWu0xNwQwkU9VAUDwg1YZgcZ0J8Xs3xxbrLtoFtBsS3FMhCrZi2rOvinlzermI6MvXvzXL6Bq2Waj3wDJNOf2ogP/xXpSy9LzMJ8GKue3t7i1w/4hxadLt0thLzci73s2Sc8YCDWmD4GAm2YLuk3ryjGVgYlTqt/PGFJJN1dOrQYsXTqz2qnfy994lmTzA+K3rrqulsNQSgr0CTgf4ayA+iVU1+jt44J7zDSvfFtJJLVzwqPzb0z4DOq22nMAcqpChnXrZXYU0PpWwHQ//N4YTJns0ovDLIXxr1+roP4TqIMsW8XTKnO4SEcUYqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zJJXTEs2YbxS0wDG/NHU5ZGxxcxvqXoiuZioj14kiL4=;
 b=BtJJ6kRFB4jDHzSQOvHmcQrJwnIONwIgtizf52QKE1BZ1EOCSeXLghNWIW7Q0ELvydZKbfrXCiwglql2f7p3twGw2xAeiXczgd4JyQ8UjEplpv31cVqMgiPh1ubStPhAqmpTMOwYK++goYMono9Tym5CNdMQP3XakdFmQjjSrwDn9CLGegdmhc22gA/2jsI1K8gGs5FrcKiHvhs8jKtcr7JMFkwFpyz8q0WnIBIRAhwAErdWJY9Dq1BVN//iYhgnR1F7geFhOI/DgBvT9cCOkCPO6Nzu0s/s5V3iTGyCMkhTjuRA/dbi2sG3ClxYUiS448ff16ml23UpUE9jfhxvrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com (2603:10b6:a03:2d4::5)
 by MN2PR11MB4366.namprd11.prod.outlook.com (2603:10b6:208:190::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Tue, 26 Apr
 2022 16:50:17 +0000
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::3d83:3af5:c95f:e062]) by SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::3d83:3af5:c95f:e062%7]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 16:50:17 +0000
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 6/7] drm/i915/gt: Avoid direct dereferencing of io memory
Date: Tue, 26 Apr 2022 22:21:47 +0530
Message-ID: <20220426165148.1784-7-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220426165148.1784-1-balasubramani.vivekanandan@intel.com>
References: <20220426165148.1784-1-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0074.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::18) To SJ0PR11MB4894.namprd11.prod.outlook.com
 (2603:10b6:a03:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a6a9d0c-0747-48bd-38b5-08da27a4d7cd
X-MS-TrafficTypeDiagnostic: MN2PR11MB4366:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtFwd,ExtAddr
X-Microsoft-Antispam-PRVS: <MN2PR11MB43666773D109BCE89F7266969FFB9@MN2PR11MB4366.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EoFwU3/nEIjnK1vc/tfx4jtEl9QjjRwIZ3LR/KlpzDDTRVD7GBCQUc3X5cA+7T7wjK+O22h+be56nZK3ROD83ckJN80kkYApC1lYnlwvrxSI05BuEdF1LrMvvhBTEaaKgmLlJ77Tyr4CIFPFkCASi5wGDuUm5siCkKrO1yn3+1cb2sZeLs+aOZuPLr4OkgTqzmEsqyy41v0AKvlMbW5Dj0kw0nQAwN0xNSu3dXUBr/OzsBjZOQMiDazmWPEBeIfpUhS4JbVyrEUz+1P4Ub1xQ7oog/+G+tWodc3KkkDmvxfWit3ZZAw1ljfeAxatbWRaSp1vVxlx10J2kmuJ/rk+oHEIYZ1rHHBPu16Zp8DzYdgShjjyURiwI8Z9+DkxdHco0jlMLEDFn4Ugq2CfEf8sKA8gZAmxgLKgj/zaKr4328ZJuCoD4eWGnpvqBQiRwRd8+Ozogp9dKHpTUZ559SZyNMtEBkyLsrMQ+Ml40uVARIcl4rfCea1WAWBTm7vymtvHe3Orm8wCCQkyabnLB/24Ah6yX2whWjqppAXQjDAQQcHLLwEtJnGDHg+Qv91AXU+0phcCr9gn9aYeptA3Og4XyQfoWSLqNATED90bU3whEZ3cUOAuQ84IgGcaVDQLUPtnTJv4cLGQmP899GJeGlWuvQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4894.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6666004)(2616005)(66946007)(6512007)(5660300002)(107886003)(82960400001)(450100002)(26005)(8936002)(66556008)(54906003)(316002)(86362001)(2906002)(1076003)(38100700002)(44832011)(6486002)(508600001)(4326008)(8676002)(66476007)(83380400001)(186003)(6506007)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlpvOFZNMUZmbzhKN29aOEpGY0RhV1hGOStHSDVtditOQWxPMXdhdnM3a0Vu?=
 =?utf-8?B?YlpVcjRKaGJkWW1pWE93RDZpRGx3NVZ5dWRwTVhNS3lwNmRVNVRuQ1BrbEVZ?=
 =?utf-8?B?RC91UVlDVzA5eDl3VkpjdGd5bGJZSXp5UlppaXZCYWQ0VzZzMEJaVU9CeGo3?=
 =?utf-8?B?R3JlTzYrc1hpdHZCWWIxdTBrallrYm9tSWFmamYxWlAzVG5uTFJaMHpLNzFy?=
 =?utf-8?B?R1NBVTllY2pLQmxmT2FOVzF2WFpZTHJ1d01hNkhqOVlvMmRaYmhVUkEvK3Za?=
 =?utf-8?B?SzZGQkxmcTM4SVFoUmdlWTh6ZjVBNE11WDd2SDRJYjlWeDF1Nm9leTJ1MDFP?=
 =?utf-8?B?dDhYU0p0eVRRc3B0NmFZTWJOdW52M29yNHNneldnTnYwN1NLQnJZR2VCcnlI?=
 =?utf-8?B?MDJESkNuQ1ZVSnF4VkdiU04vK0szSEdXWEJVL1JpQ2FYN0JpYitTdFg1Qk9W?=
 =?utf-8?B?czVwS0dKUXhGOStjWjdLbmRuWE5OR20wSU5RbTFxNTlPK1JMZ1hXK2Z6M0VI?=
 =?utf-8?B?S3VvSU9tM1FLYWt6amZJSWFHU3ZEYWF5KzVIVG5TcnZBREx6VmoxdUU3d2dG?=
 =?utf-8?B?ZUplSk9UT2crU280U0ljWWhPZ2VhNnRFRTFJeWxmdlBUSHFvaTFXUWl2N3N5?=
 =?utf-8?B?bGZyd2p1dzJWeEJTUFdkUTJLTXA5d3NXTUZ1MkZ3WTMyZy8xQmRjUlJkT1B0?=
 =?utf-8?B?ZU1MSXFSNGJBSllBclJwS1VNN3UxS3NTeGtyNHNhTlBqSlBUMlBlMGR6Mm0v?=
 =?utf-8?B?dHZXVzE2cE5ZVTB1Y1gxYlNEZnAvUVNUMVdONm9LZkIvcTc5SWxGbW9KNEhG?=
 =?utf-8?B?YkpLOVlSS2ZBazJ2bG42QkhqcmJGQzRaeVRLYWYrSUVxOUNuZ1FNSjQxODFa?=
 =?utf-8?B?M1lyenlxS1ZZblRxMmQzWU95Ulp5dlFablFud2tsUTVLMEJXbHA2bUUwSC9o?=
 =?utf-8?B?dXBjZW9WOGFYay8zRzdHZUJWSUZRMGY4b0pYZ3ZsTFpHdGgzREJCQ0YxeUhY?=
 =?utf-8?B?Mjh6cXJZYThLMVdpdzB5V2E3Uk5kNlk2dVZOU3dkSzdmall4Mm91SkQwbUts?=
 =?utf-8?B?K2Yycmt4eFlrTWJVOHlxRUNORkZZQXRyMVNXdENnZDhiRnhEWmwzOTd0Uncr?=
 =?utf-8?B?MkhBdGVBVDFzUkx2RW1RUHMydVhtdDBHYkVMalRHam9XalF0aW1KbWZ6bzlD?=
 =?utf-8?B?Rm1USkFxZG05QVhLUy80dC9LT3VZTU9ScThmcTZGcTQ0UktzR1hDa2hJbEFW?=
 =?utf-8?B?bFM2d2tRRTNmOGtaMVkzc0ZPeTkyNlNLVmhXS2tmWmpvVjBVOTNvamJEWVpZ?=
 =?utf-8?B?VTJReGY3bnU1UmtOczlsMGZNTW5lNUtCZUQ0Y3JGYVZ0aGtIYUVveUFpeWJk?=
 =?utf-8?B?ZkRrSEF5aEdVdmtxOHN6L3Q1UVNXZ2JjY2N3MlZWN3d3U014Mk9PN2pYbzAx?=
 =?utf-8?B?YmRrRldsQWExbTY0MzYzdnpka0MvODJ5T3c4d1g1ZDBhcGlWQVd5UVFWOVNV?=
 =?utf-8?B?NStPalZaY3BkNzB5RDJEb0ZYd3N3eTV4bk1oSFRyMDQzN0hob1I2VWhkTzdU?=
 =?utf-8?B?bXRMTkFIRkora2FuZkcwUkJjM2ZrTnQyeXFxU2hmVGxxdkdZMUVOTnlBSStj?=
 =?utf-8?B?azdiUTVHNkc1ZnpqZjUxM1JSVFpjYzFoSHdKdUJFVmNPVmZyTFk0WlBHc0gv?=
 =?utf-8?B?cktUR21IV0xyQk5DQ3pPK2Zzdk1NTGRvUjFuUDFjd3pTcUF3UlFWZDNWUHpR?=
 =?utf-8?B?M1cxSFFFQkV1dS9HT3dER21yMUQzeG9icEZHWVBDTnJwa0Y0eFhTbVlnRTU5?=
 =?utf-8?B?cTZCL1NtMUZqbkhGRDRGVzdIMk50VDN2K3BhV2FwUktGYjZBN0lRSE1raFlh?=
 =?utf-8?B?NXd4YW4rUHROMUNmR1RqOVJSV3I1eWxoeCtVV1loSFRZR09IcTdwTzRabGxB?=
 =?utf-8?B?QTB5Y0NpUjRiVm5RNnREeXYyRlFmeHpwZ0puZHJRRFczUFRnMHNnN3ZqazFk?=
 =?utf-8?B?WW80OCtMdDJ6bFBLaWlHTTljT1MwNkRORHlOZHpadk8xZ05ZNk1zRTU2Q0ZW?=
 =?utf-8?B?MmpCKy80endjRXQ4MHo3NWJXd1pJTHhTWnh2UHl3M2hLSllYdGlaY2Q1MVk0?=
 =?utf-8?B?L0hTcGxpVGNuN2NsU2ZKR1dHT0JFMy93RlR0c2c0VDJLRWhzaHFxcm1PZzFr?=
 =?utf-8?B?WVhJbGZxbTVMNUhsYmt1MHBsa2NoVVZ0Sm52S08wY2hsWmIvVTBZRlJpZ2Er?=
 =?utf-8?B?OVJwNVNjZlBZemRmVFhnU3dqZGE5V3lMNHZVK2ZnME9uT2tJdVNhem0rOEdQ?=
 =?utf-8?B?M2QreDFUV3FOQUgxYjhRbnB6VGREQS9HYWYzSzZUSFV3ZTZqTG5Ya0lIcHpB?=
 =?utf-8?Q?rqRxXdHCSaYlwKIb5Ri8yPN9okhDeRokfGR4q?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a6a9d0c-0747-48bd-38b5-08da27a4d7cd
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4894.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 16:50:17.5954 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wqaaQ+DoIZwEcatpzEmaZVM5D5XE3i91VVcic6SZxmH38fU/YbJ6uWeMR3cXh3j7B3W9nR75EmXVhDWs9pUIxmo0JwV5xuesLnCoVIY2PTqaIWAe8T4cEA5d51qPdG/C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4366
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 lucas.demarchi@intel.com, siva.mullati@intel.com,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

io mapped memory should not be directly dereferenced to ensure
portability. io memory should be read/written/copied using helper
functions.
i915_memcpy_from_wc() function was used to copy the data from io memory to
a temporary buffer and pointer to the temporary buffer was passed to CRC
calculation function.
But i915_memcpy_from_wc() only does a copy if the platform supports fast
copy using non-temporal instructions. Otherwise the pointer to io memory
was passed for CRC calculation. CRC function will directly dereference
io memory and would not work properly on non-x86 platforms.
To make it portable, it should be ensured always temporary buffer is
used for CRC and not io memory.
drm_memcpy_from_wc_vaddr() is now used for copying instead of
i915_memcpy_from_wc() for 2 reasons.
- i915_memcpy_from_wc() will be deprecated.
- drm_memcpy_from_wc_vaddr() will not fail if the fast copy is not
supported but uses memcpy_fromio as fallback for copying.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Acked-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/gt/selftest_reset.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_reset.c b/drivers/gpu/drm/i915/gt/selftest_reset.c
index 37c38bdd5f47..7a455583c687 100644
--- a/drivers/gpu/drm/i915/gt/selftest_reset.c
+++ b/drivers/gpu/drm/i915/gt/selftest_reset.c
@@ -3,6 +3,7 @@
  * Copyright © 2018 Intel Corporation
  */
 
+#include <drm/drm_cache.h>
 #include <linux/crc32.h>
 
 #include "gem/i915_gem_stolen.h"
@@ -82,7 +83,7 @@ __igt_reset_stolen(struct intel_gt *gt,
 	for (page = 0; page < num_pages; page++) {
 		dma_addr_t dma = (dma_addr_t)dsm->start + (page << PAGE_SHIFT);
 		void __iomem *s;
-		void *in;
+		struct iosys_map src_map;
 
 		ggtt->vm.insert_page(&ggtt->vm, dma,
 				     ggtt->error_capture.start,
@@ -98,10 +99,9 @@ __igt_reset_stolen(struct intel_gt *gt,
 					     ((page + 1) << PAGE_SHIFT) - 1))
 			memset_io(s, STACK_MAGIC, PAGE_SIZE);
 
-		in = (void __force *)s;
-		if (i915_memcpy_from_wc(tmp, in, PAGE_SIZE))
-			in = tmp;
-		crc[page] = crc32_le(0, in, PAGE_SIZE);
+		iosys_map_set_vaddr_iomem(&src_map, s);
+		drm_memcpy_from_wc_vaddr(tmp, &src_map, 0, PAGE_SIZE);
+		crc[page] = crc32_le(0, tmp, PAGE_SIZE);
 
 		io_mapping_unmap(s);
 	}
@@ -122,7 +122,7 @@ __igt_reset_stolen(struct intel_gt *gt,
 	for (page = 0; page < num_pages; page++) {
 		dma_addr_t dma = (dma_addr_t)dsm->start + (page << PAGE_SHIFT);
 		void __iomem *s;
-		void *in;
+		struct iosys_map src_map;
 		u32 x;
 
 		ggtt->vm.insert_page(&ggtt->vm, dma,
@@ -134,10 +134,9 @@ __igt_reset_stolen(struct intel_gt *gt,
 				      ggtt->error_capture.start,
 				      PAGE_SIZE);
 
-		in = (void __force *)s;
-		if (i915_memcpy_from_wc(tmp, in, PAGE_SIZE))
-			in = tmp;
-		x = crc32_le(0, in, PAGE_SIZE);
+		iosys_map_set_vaddr_iomem(&src_map, s);
+		drm_memcpy_from_wc_vaddr(tmp, &src_map, 0, PAGE_SIZE);
+		x = crc32_le(0, tmp, PAGE_SIZE);
 
 		if (x != crc[page] &&
 		    !__drm_mm_interval_first(&gt->i915->mm.stolen,
@@ -146,7 +145,7 @@ __igt_reset_stolen(struct intel_gt *gt,
 			pr_debug("unused stolen page %pa modified by GPU reset\n",
 				 &page);
 			if (count++ == 0)
-				igt_hexdump(in, PAGE_SIZE);
+				igt_hexdump(tmp, PAGE_SIZE);
 			max = page;
 		}
 
-- 
2.25.1

