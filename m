Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EB6491256
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 00:25:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC74811254E;
	Mon, 17 Jan 2022 23:24:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BC79112550
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 23:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642461896; x=1673997896;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=jEPKgMh3k4IVfr7/FQbu0bJJzFHjNDfFfVVOAqwByDM=;
 b=U3fxly/gxDnysX0Q9xE5NRdVU8YNQf717fxOvF4Jj+7RL264yXf9VQl/
 O43bItqIab9H1zP1vuX1MibgBWS/m04Y32B7pL6JQ6jK+IlfUZZiRG/wN
 0FeT0EF+kXEazbgKiqo6fUNgiw4mpqrbpYnsrAjH+OAKK/IIlqYWX3h/5
 /frWXoox59AZ6ybL1Rwc8gtqS5xBLWRd9T69yvu+vLQnZCsbR9pcNa6F6
 jj6CJveCLgNgPBnj6L+Km60CGKUHXPpB6SxZ656npQyve05YAjVx4fSSQ
 MaDIgj7jq6laXbtqWlz25UGvMOWUnel7bhqj29MIkxaHh76nZBGK7U2wL A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10230"; a="308043724"
X-IronPort-AV: E=Sophos;i="5.88,296,1635231600"; d="scan'208";a="308043724"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2022 15:24:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,296,1635231600"; d="scan'208";a="474580704"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga003.jf.intel.com with ESMTP; 17 Jan 2022 15:24:55 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 17 Jan 2022 15:24:55 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 17 Jan 2022 15:24:54 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Mon, 17 Jan 2022 15:24:54 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 17 Jan 2022 15:24:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jcwXeGD69pTEQCGRRUejjydXUzDE6HvVbv2TpxdFY+eMCK/krUnuz8vjwGjdvre/DF02i4GhFpZMY3t0oQRo9qpBFqg8QBYOrrM+jOGCV7jOZgv/SGYJ2RZyEIURb6fjeXd0p71g3aSaom6cAcpyd97CXREv5QY/3ybQR9P6vxjk4RoRrWqMydDA1KMljxYVHevYSQy4Fe5AS7Y3/hkv4GwSP3Uey93hNB9dxaTh4ParWHd05lQuLB2C2EfsPMn6/mMf+rDRajYGkW9FFGJSlvpLl5rOCuwGWTgGeXCa2jjxVsBgtXLydrIrGxqxS1GlCrZlNawGvrP1kyTtz0+3ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=po5keolcRjxsUkhoyTRHmzxZIdvLaBhoA/+mtn7L90Q=;
 b=W11etkxKUh0+8k7xumsvLKouV+j7Poy9fAOF3lx4OmJXzLzGw9MKwqs+Cs4eiyD2izqDY294OZpYE6mIsamFCEwabuGftU/dS/H8Hf0SsJ4N6tsemcJljSMSgCA/9pQQPIYDBIZMzPbAN3l8fyCZMBzcUPvb2U1kGpbOsa/+FpjQvtFhpYCDprkcWWOQW9XCUFfns9C9YI6Hfwl4qCWp0fG5G9GcuUm6YdFHhvfhymN/Ruy6EWOPH/FWHP2sKlWGpNrUTzOhqQ9IT9DsykKjObGvaAsT9kuuWKx0pu8TVh0TN66OjvRRyg+V1/NeNls8aKc6aaIK71naGbwagH3/gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM4PR11MB5550.namprd11.prod.outlook.com (2603:10b6:5:38b::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.9; Mon, 17 Jan 2022 23:24:49 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::fc15:bd26:128a:f5f5]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::fc15:bd26:128a:f5f5%8]) with mapi id 15.20.4888.014; Mon, 17 Jan 2022
 23:24:49 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <dri-devel@lists.freedesktop.org>, <linux-kselftest@vger.kernel.org>
Subject: [RFC 08/10] drm: test-drm_mm: Convert to KUnit
Date: Tue, 18 Jan 2022 00:22:57 +0100
Message-ID: <20220117232259.180459-9-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220117232259.180459-1-michal.winiarski@intel.com>
References: <20220117232259.180459-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0089.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::22) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65f001e8-663c-406b-ed7e-08d9da108e6b
X-MS-TrafficTypeDiagnostic: DM4PR11MB5550:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM4PR11MB555036F136FA77F301F234F798579@DM4PR11MB5550.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: plL73FbcA93G4G5U565WTSVPlftHvGt8Ec8QAENOve5/QFGVo/vECLx/15dBJ9wvk6WeIl1HwfzKSwfcvZmQjrdMABLcDb+mO7/hvloIs/NQO3cjwSqH06Lq01ucS+UKoFlTbZEYkLbDe9Y+WnUU4BPKEjAsYsxtPs6Rps97sIZdLXr7KQcNKhQWRCofaCzSiwNzhmSj8fJdEq4Rx+Q+xEJc1SmyYwit44euQCb+6RGN5MVLhZNOKNAzTRb9wLQoUc9BEaLhGy8/PrID0TewoWdE3Vtjqy6DeOrybnNgQltyTrQ7JXsQZklIM23MuecJODMygLKpQlwfIvdr7JvJJqzxdt635jCCQqfgn7C9hzPkMIzz1z+y1akUJeI0em9erfmimbRK6pZYdFqGwDXprlg4OQOZpRyBcKNRlGXId0ueyFXC36e39lHZSRK6sm6V6utgiatKdEtdKevEN/ljcsB4dpLfv9UgDcqCJqxE7rs8uFZFI8LE7b3IMT1TrsnMhfrVeof4AJ7CP4xSagVAXmjA2y0jvK21/Fq8C/ZevibgU8ndAAZMZ1w/+9h0e/z2JnBnGlGDOLohhv0q2pmc5kPJr6Y5AFYMWuLb91KUy61GJ2sE5I+HozbDULjfYG/JN1sWEeD914maf/p/vXxKtQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(86362001)(82960400001)(4326008)(5660300002)(36756003)(186003)(6506007)(7416002)(40140700001)(1076003)(54906003)(6512007)(83380400001)(26005)(66946007)(66476007)(66556008)(316002)(6486002)(38100700002)(8936002)(508600001)(2906002)(30864003)(6666004)(8676002)(2616005)(559001)(579004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VktGQjJ5MUM2NVRuMy9XcUNvcmpDSkhsS1UzMDMvYVdmb09ZL0RZRlVYb3FB?=
 =?utf-8?B?ZlE2NTExUVVTd3FIZUdKdGVKUWVYYjF1djFETTNHYmt6MFc1ZmUzb0dkWlJ5?=
 =?utf-8?B?ZEtqRDg0Z1dOS001SGNrQk1qaklKUGMyTzZDdFhxYWRFU3BhL0lQRFRVMlZa?=
 =?utf-8?B?bnhNMlFQejJ2eTN3UVRNK0JZYnJYd09hbVlCWjJydVJiaTFHby9uZG42U09V?=
 =?utf-8?B?SHdJRUNPWlJpUDcwMmJURjBrNmNTakJOc2ZxV2oxWVF5SFpISWZ5ZldnWDZv?=
 =?utf-8?B?a1IwOWZERjl0amdkaTZNYXdCS3R5OFllSDFLaUdtY1lDNzBwdDNVZXVLKzdr?=
 =?utf-8?B?cHB4ZXI1V2kweXlhU0t6TkgrdUpGWFZKWWN3RkFhNEgyd0RJL2lhL1NWa2po?=
 =?utf-8?B?V0NOQnkvM3pKWjdBR2lzcVBhRnd0T0d5QTd6VnRSUGF2SVp1WjFaNXhJVG9x?=
 =?utf-8?B?aFlua1oxeWt3ZG5Lam9BdUVpTFFLcVo3WTloNyt3SDVXMEovaUxBTXFEWlJ2?=
 =?utf-8?B?Q2MrUGM1MG9hWGZyUlpoVDZmSFV6VUtkbUY4MHhNMnlCb3o0TWczZnFGVjZn?=
 =?utf-8?B?RlFwM1g3VmpNQWZnSEpYcUg2MlRYSmxqWjRLb3NFOHBnKzR3SVZYQzhVanFZ?=
 =?utf-8?B?TVhFekNnam5QV2FMSkRUOFdLR3BhdXgvc1JkRFljbGlSckh4TEE2NDhSaG4w?=
 =?utf-8?B?VHRUMlhFL2VJQ0dHTGNSbWJsYkhEZnN4cVJmUy9NcGlZZ3BhQVJhSklJaEIx?=
 =?utf-8?B?MEhiMERxZmM0Z1k2QW9QL1ZtYkQvbkRsbW1rYWxMYlI0cWJHZk1HZ25udUND?=
 =?utf-8?B?aXMxblBNenJpekVuU0d2V1RjL0wwQUVwcUxMNVhXblNXZzNIcGs5Y1pZaUh3?=
 =?utf-8?B?Nng3MVRTZkJwaUdZM0VSVnF4dDFtcVFyS0dBTm1zZlFaK1d0aWZQQStOeG1w?=
 =?utf-8?B?cU42cEwxVSsvVUJWbk9qNTFiWE45SGUzYmIrTjlJZExHSjRCRXBKczF1MWFG?=
 =?utf-8?B?dDZMY1kweERhWHhlMFpDS2w1NW5LR2NTZ0xlR2xCYmk1MTRGMEpSRkpUejdY?=
 =?utf-8?B?WmZTbGhneGRaNHU0QVlqd1psZmJKRWM2YnVIQ1d0VWsyYUhES0NwSGJPeWtG?=
 =?utf-8?B?VFVWalJkdnBYbVBtNStlc1NQekVNRmJiQjR3SGpyMFAwbzFWd0NEWUI4M3k4?=
 =?utf-8?B?R3N5MjNTS3hoUFN1dnZBS21YNGVuQVBoUDFDQk5Yd3JodW0wOHBGZTV5OXJY?=
 =?utf-8?B?dHhWd016cmNXNEZ3VStMZTFQM0EzVmVVK08yMHhZWjRkclgxRDY3bU9NYUdH?=
 =?utf-8?B?bXFYaXhVQTJYRXVEell0NlhUYlNLbitTSldsRnFvbG1FTjVWT2ZzZmdXS2Zq?=
 =?utf-8?B?VFY2ZVJra0I5c2l4dlZKallRTERQbm9HQUlMRzJTbkl2cEJXc09obW5sWjl6?=
 =?utf-8?B?QXVseERmRlgyeWYzWm9iSlc5aE5TWEFQZEE3MG9JRWFmSVBaY0laWk1raU5Z?=
 =?utf-8?B?VTV5dU9ERkl5MXYwMDJITGZtWWNFakZCSUFtT1FtZEpndmtJYjA4Z3U1eCtR?=
 =?utf-8?B?S0JhTHJkQ1lXOFRJTUlkWXlrcElTS1IzVVRmUUNhakkrdWY0TG5zM0VkSVFG?=
 =?utf-8?B?YWlQRnV5YkNCamhhdWE5UW5JTVVaWkhTVWx1KzZNK3FGUGRZbm1jL3VnL0pq?=
 =?utf-8?B?eVQ2dWVSSW1EbnoydG1YSHlJWXFjVWpRK2tsUVhuZWZsYnUrVUR4SitGbk1V?=
 =?utf-8?B?clZKT1VCRCtkSk5TQVFZY0ZRV2hJL2JzWEdkUVhXa2gwNnJFbWlyYnFacmMz?=
 =?utf-8?B?S1dnNFNlYVdDVldrS003cU5YTXJhWWdqY0ZqRVdNRzEyQnEvRGpxOG1hK0lH?=
 =?utf-8?B?aWNGcldSSmJUd2lod0Jra3RsLzhzUVgxUWF3VGJwdXZ6Nml4ZnpPWXNqYzNC?=
 =?utf-8?B?Q2NLMm5kdTNvMkd1a3orYmFJTjZvUkZHS3NycGFUVDlDSEh5YlFxUmxkdmpo?=
 =?utf-8?B?V3M0eEtlVTk2RzZ2QzltY2VlcElPdWZ0YVd1SGhXNWpkRjdNd3JFOU1jWHoy?=
 =?utf-8?B?aWZFNlJUWmhrUHEvcVFzelZNVGtzTExWQWlqeDBaMGQxQU5EeFV4eE9sUHVr?=
 =?utf-8?B?SEpWMy8vdnYvK0ZOUkwvcFU5V3NSZlFrT0dDZzhUY3NqeDEzV0gvdWlTajBS?=
 =?utf-8?B?dTU2ejloUDJqWElrSEZqanAxOHkrbnU5NzYxYUQreGZEQUppMktmYzREWCtG?=
 =?utf-8?B?N1p5MnAyQUx3Y01YRnIyNmxGYTR3PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 65f001e8-663c-406b-ed7e-08d9da108e6b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 23:24:49.6999 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Si/O7/ldwS1sLn/TgbiZS2JS930x9enfbLQem1A/wjiQ64l5vPGfTn/cl7F2k5K0W2MgzNjz4uVmcIbHsiWPk2ngktR5f2IhMzNlyctw1M=
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Brendan Higgins <brendanhiggins@google.com>,
 Daniel Latypov <dlatypov@google.com>, Arkadiusz Hiler <arek@hiler.eu>,
 Petri Latvala <petri.latvala@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tests that were looping over param (or combination of params) were
converted to parameterized test cases.

While the conversion should be roughly functionally equivalent, there
are changes in the test content and organization:
* sanitycheck was dropped (as it was only testing the test framework)
* both evict and color got a "sanitycheck" extracted as a separate test
* insert_outside_range was extracted as a separate test
* evict_range and color_evict_range were removed and expressed as
  input parameters to evict and color_evict

It's still possible to use modparams to change the number of iterations,
or force specific seed e.g. by passing the following to kunit.py:
--kernel_args 'test_drm_mm.random_seed=X'

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/Kconfig                      |    2 +
 drivers/gpu/drm/selftests/Makefile           |    4 +-
 drivers/gpu/drm/selftests/drm_mm_selftests.h |   28 -
 drivers/gpu/drm/selftests/test-drm_mm.c      | 3187 +++++++++---------
 4 files changed, 1566 insertions(+), 1655 deletions(-)
 delete mode 100644 drivers/gpu/drm/selftests/drm_mm_selftests.h

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 89be0df7b0e9..c567324c96b9 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -84,6 +84,8 @@ config DRM_KUNIT_TEST
 	bool "DRM tests" if !KUNIT_ALL_TESTS
 	depends on DRM=y && KUNIT=y
 	select DRM_KMS_HELPER
+	select PRIME_NUMBERS
+	select DRM_LIB_RANDOM
 	default KUNIT_ALL_TESTS
 	help
 	  Enables unit tests for DRM. Only useful for kernel devs running KUnit.
diff --git a/drivers/gpu/drm/selftests/Makefile b/drivers/gpu/drm/selftests/Makefile
index 2d524eddb4e3..3bc89b71f9f9 100644
--- a/drivers/gpu/drm/selftests/Makefile
+++ b/drivers/gpu/drm/selftests/Makefile
@@ -1,9 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-obj-$(CONFIG_DRM_DEBUG_SELFTEST) += test-drm_mm.o
-
 obj-$(CONFIG_DRM_KUNIT_TEST) := \
 	test-drm_cmdline_parser.o test-drm_plane_helper.o \
 	test-drm_format.o test-drm_framebuffer.o \
 	test-drm_damage_helper.o test-drm_dp_mst_helper.o \
-	test-drm_rect.o
+	test-drm_rect.o test-drm_mm.o
diff --git a/drivers/gpu/drm/selftests/drm_mm_selftests.h b/drivers/gpu/drm/selftests/drm_mm_selftests.h
deleted file mode 100644
index 8c87c964176b..000000000000
--- a/drivers/gpu/drm/selftests/drm_mm_selftests.h
+++ /dev/null
@@ -1,28 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/* List each unit test as selftest(name, function)
- *
- * The name is used as both an enum and expanded as igt__name to create
- * a module parameter. It must be unique and legal for a C identifier.
- *
- * Tests are executed in order by igt/drm_mm
- */
-selftest(sanitycheck, igt_sanitycheck) /* keep first (selfcheck for igt) */
-selftest(init, igt_init)
-selftest(debug, igt_debug)
-selftest(reserve, igt_reserve)
-selftest(insert, igt_insert)
-selftest(replace, igt_replace)
-selftest(insert_range, igt_insert_range)
-selftest(align, igt_align)
-selftest(frag, igt_frag)
-selftest(align32, igt_align32)
-selftest(align64, igt_align64)
-selftest(evict, igt_evict)
-selftest(evict_range, igt_evict_range)
-selftest(bottomup, igt_bottomup)
-selftest(lowest, igt_lowest)
-selftest(topdown, igt_topdown)
-selftest(highest, igt_highest)
-selftest(color, igt_color)
-selftest(color_evict, igt_color_evict)
-selftest(color_evict_range, igt_color_evict_range)
diff --git a/drivers/gpu/drm/selftests/test-drm_mm.c b/drivers/gpu/drm/selftests/test-drm_mm.c
index b768b53c4aee..66eca33c8e2f 100644
--- a/drivers/gpu/drm/selftests/test-drm_mm.c
+++ b/drivers/gpu/drm/selftests/test-drm_mm.c
@@ -3,8 +3,8 @@
  * Test cases for the drm_mm range manager
  */
 
-#define pr_fmt(fmt) "drm_mm: " fmt
-
+#include <kunit/test.h>
+#include <linux/bitfield.h>
 #include <linux/module.h>
 #include <linux/prime_numbers.h>
 #include <linux/slab.h>
@@ -16,13 +16,152 @@
 
 #include "../lib/drm_random.h"
 
-#define TESTS "drm_mm_selftests.h"
-#include "drm_selftest.h"
-
 static unsigned int random_seed;
 static unsigned int max_iterations = 8192;
 static unsigned int max_prime = 128;
 
+static struct kunit_suite drm_mm_test_suite;
+
+#define DRM_MM_PARAM0_MASK GENMASK(7, 0)
+#define DRM_MM_PARAM1_MASK GENMASK(15, 8)
+#define DRM_MM_PARAM2_MASK GENMASK(23, 16)
+#define DRM_MM_PARAM_VALID BIT(31)
+
+static bool param_valid(const unsigned long param)
+{
+	return param & DRM_MM_PARAM_VALID;
+}
+
+#define DRM_MM_PRIME_MASK (DRM_MM_PARAM0_MASK)
+static const unsigned long prime_gen_param(const unsigned long param,
+					   const unsigned long prime_limit)
+{
+	unsigned int prime = FIELD_GET(DRM_MM_PRIME_MASK, param);
+
+	BUILD_BUG_ON(prime_limit > FIELD_MAX(DRM_MM_PRIME_MASK));
+
+	if (!param_valid(param))
+		prime = 1;
+	else
+		prime = next_prime_number(prime);
+
+	if (prime > min_t(unsigned int, prime_limit, max_prime))
+		return 0;
+
+	return FIELD_PREP(DRM_MM_PRIME_MASK, prime) | DRM_MM_PARAM_VALID;
+}
+
+#define DRM_MM_OP_MASK (DRM_MM_PARAM1_MASK)
+static const unsigned long ops_gen_param(const unsigned long param,
+					 const unsigned long ops_limit)
+{
+	unsigned int index = FIELD_GET(DRM_MM_OP_MASK, param);
+
+	BUILD_BUG_ON(ops_limit > FIELD_MAX(DRM_MM_OP_MASK));
+
+	if (!param_valid(param))
+		index = 0;
+	else
+		index++;
+
+	if (index >= ops_limit)
+		return 0;
+
+	return FIELD_PREP(DRM_MM_OP_MASK, index) | DRM_MM_PARAM_VALID;
+}
+
+#define DRM_MM_MODE_MASK (DRM_MM_PARAM2_MASK)
+static const unsigned long mode_gen_param(const unsigned long param,
+					  const unsigned int mode_limit)
+{
+	unsigned int mode = FIELD_GET(DRM_MM_MODE_MASK, param);
+
+	BUILD_BUG_ON(mode_limit > FIELD_MAX(DRM_MM_MODE_MASK));
+
+	if (!param_valid(param))
+		mode = 0;
+	else
+		mode++;
+
+	if (mode >= mode_limit)
+		return 0;
+
+	return FIELD_PREP(DRM_MM_MODE_MASK, mode) | DRM_MM_PARAM_VALID;
+}
+
+static const unsigned long prime_ops_gen_param(const unsigned long param,
+					       const unsigned int prime_limit,
+					       const unsigned int ops_limit)
+{
+	unsigned int prime_param;
+	unsigned int ops_param;
+
+	if (!param_valid(param))
+		prime_param = prime_gen_param(param, prime_limit);
+	else
+		prime_param = (param & DRM_MM_PRIME_MASK) | DRM_MM_PARAM_VALID;
+
+	ops_param = ops_gen_param(param, ops_limit);
+	if (!param_valid(ops_param)) {
+		prime_param = prime_gen_param(param, prime_limit);
+		ops_param = ops_gen_param(ops_param, ops_limit);
+	}
+
+	if (!param_valid(prime_param))
+		return 0;
+
+	return prime_param | ops_param;
+}
+
+static const unsigned long mode_ops_gen_param(const unsigned long param,
+					      const unsigned int mode_limit,
+					      const unsigned int ops_limit)
+{
+	unsigned int mode_param;
+	unsigned int ops_param;
+
+	if (!param_valid(param))
+		mode_param = mode_gen_param(param, mode_limit);
+	else
+		mode_param = (param & DRM_MM_MODE_MASK) | DRM_MM_PARAM_VALID;
+
+	ops_param = ops_gen_param(param, ops_limit);
+	if (!param_valid(ops_param)) {
+		mode_param = mode_gen_param(param, mode_limit);
+		ops_param = ops_gen_param(ops_param, ops_limit);
+	}
+
+	if (!param_valid(mode_param))
+		return 0;
+
+	return mode_param | ops_param;
+}
+
+static const unsigned long mode_prime_ops_gen_param(const unsigned long param,
+						    const unsigned int mode_limit,
+						    const unsigned int prime_limit,
+						    const unsigned int ops_limit)
+{
+	unsigned int mode_param;
+	unsigned int prime_ops_param;
+
+	if (!param_valid(param))
+		mode_param = mode_gen_param(param, mode_limit);
+	else
+		mode_param = (param & DRM_MM_MODE_MASK) | DRM_MM_PARAM_VALID;
+
+	prime_ops_param = prime_ops_gen_param(param, prime_limit, ops_limit);
+	if (!param_valid(prime_ops_param)) {
+		mode_param = mode_gen_param(param, mode_limit);
+		prime_ops_param = prime_ops_gen_param(prime_ops_param, prime_limit, ops_limit);
+	}
+
+	if (!param_valid(mode_param))
+		return 0;
+
+	return mode_param | prime_ops_param;
+}
+
 enum {
 	BEST,
 	BOTTOMUP,
@@ -38,20 +177,34 @@ static const struct insert_mode {
 	[BOTTOMUP] = { "bottom-up", DRM_MM_INSERT_LOW },
 	[TOPDOWN] = { "top-down", DRM_MM_INSERT_HIGH },
 	[EVICT] = { "evict", DRM_MM_INSERT_EVICT },
-	{}
 }, evict_modes[] = {
 	{ "bottom-up", DRM_MM_INSERT_LOW },
 	{ "top-down", DRM_MM_INSERT_HIGH },
-	{}
 };
 
-static int igt_sanitycheck(void *ignored)
+static void kunit_drm_mm_print_params(void)
 {
-	pr_info("%s - ok!\n", __func__);
-	return 0;
+	kunit_log(KERN_INFO, &drm_mm_test_suite,
+		  "Testing DRM range manager (struct drm_mm), with random_seed=%#x max_iterations=%u max_prime=%u",
+		  random_seed, max_iterations, max_prime);
+}
+
+static void
+drm_mm_printfn(struct drm_printer *p, struct va_format *vaf)
+{
+	struct kunit *test = p->arg;
+
+	kunit_info(test, "%pV", vaf);
 }
 
-static bool assert_no_holes(const struct drm_mm *mm)
+#define show_mm(test, mm) \
+	do { \
+		struct drm_printer __p = { .printfn = drm_mm_printfn, .arg = (test) }; \
+		drm_mm_print((mm), &__p); \
+	} while (0)
+
+static bool
+has_no_holes(struct kunit *test, const struct drm_mm *mm)
 {
 	struct drm_mm_node *hole;
 	u64 hole_start, __always_unused hole_end;
@@ -61,13 +214,17 @@ static bool assert_no_holes(const struct drm_mm *mm)
 	drm_mm_for_each_hole(hole, mm, hole_start, hole_end)
 		count++;
 	if (count) {
-		pr_err("Expected to find no holes (after reserve), found %lu instead\n", count);
+		show_mm(test, mm);
+		kunit_err(test,
+			  "Expected to find no holes (after reserve), found %lu instead\n",
+			  count);
 		return false;
 	}
 
 	drm_mm_for_each_node(hole, mm) {
 		if (drm_mm_hole_follows(hole)) {
-			pr_err("Hole follows node, expected none!\n");
+			show_mm(test, mm);
+			kunit_err(test, "Hole follows node, expected none!\n");
 			return false;
 		}
 	}
@@ -75,7 +232,8 @@ static bool assert_no_holes(const struct drm_mm *mm)
 	return true;
 }
 
-static bool assert_one_hole(const struct drm_mm *mm, u64 start, u64 end)
+static bool
+has_one_hole(struct kunit *test, const struct drm_mm *mm, u64 start, u64 end)
 {
 	struct drm_mm_node *hole;
 	u64 hole_start, hole_end;
@@ -89,62 +247,64 @@ static bool assert_one_hole(const struct drm_mm *mm, u64 start, u64 end)
 	drm_mm_for_each_hole(hole, mm, hole_start, hole_end) {
 		if (start != hole_start || end != hole_end) {
 			if (ok)
-				pr_err("empty mm has incorrect hole, found (%llx, %llx), expect (%llx, %llx)\n",
-				       hole_start, hole_end,
-				       start, end);
+				kunit_err(test,
+					  "incorrect hole, found (%#llx, %#llx), expect (%#llx, %#llx)\n",
+					  hole_start, hole_end, start, end);
 			ok = false;
 		}
 		count++;
 	}
 	if (count != 1) {
-		pr_err("Expected to find one hole, found %lu instead\n", count);
+		show_mm(test, mm);
+		kunit_err(test, "Expected to find one hole, found %lu instead\n", count);
 		ok = false;
 	}
 
 	return ok;
 }
 
-static bool assert_continuous(const struct drm_mm *mm, u64 size)
+static bool is_continuous(struct kunit *test, const struct drm_mm *mm, u64 size)
 {
 	struct drm_mm_node *node, *check, *found;
 	unsigned long n;
 	u64 addr;
 
-	if (!assert_no_holes(mm))
+	if (!has_no_holes(test, mm))
 		return false;
 
 	n = 0;
 	addr = 0;
 	drm_mm_for_each_node(node, mm) {
 		if (node->start != addr) {
-			pr_err("node[%ld] list out of order, expected %llx found %llx\n",
-			       n, addr, node->start);
+			kunit_err(test, "node[%ld] list out of order, expected %#llx found %#llx\n",
+				  n, addr, node->start);
 			return false;
 		}
 
 		if (node->size != size) {
-			pr_err("node[%ld].size incorrect, expected %llx, found %llx\n",
-			       n, size, node->size);
+			kunit_err(test, "node[%ld].size incorrect, expected %llu, found %llu\n",
+				  n, size, node->size);
 			return false;
 		}
 
 		if (drm_mm_hole_follows(node)) {
-			pr_err("node[%ld] is followed by a hole!\n", n);
+			kunit_err(test, "node[%ld] is followed by a hole!\n", n);
 			return false;
 		}
 
 		found = NULL;
 		drm_mm_for_each_node_in_range(check, mm, addr, addr + size) {
 			if (node != check) {
-				pr_err("lookup return wrong node, expected start %llx, found %llx\n",
-				       node->start, check->start);
+				kunit_err(test,
+					  "lookup return wrong node, expected start %#llx, found %#llx\n",
+					  node->start, check->start);
 				return false;
 			}
 			found = check;
 		}
 		if (!found) {
-			pr_err("lookup failed for node %llx + %llx\n",
-			       addr, size);
+			kunit_err(test, "lookup failed for node %#llx + %llu\n",
+				  addr, size);
 			return false;
 		}
 
@@ -166,107 +326,199 @@ static u64 misalignment(struct drm_mm_node *node, u64 alignment)
 	return rem;
 }
 
-static bool assert_node(struct drm_mm_node *node, struct drm_mm *mm,
-			u64 size, u64 alignment, unsigned long color)
+static bool check_node(struct kunit *test, struct drm_mm_node *node, struct drm_mm *mm,
+		       u64 size, u64 alignment, unsigned long color)
 {
 	bool ok = true;
 
 	if (!drm_mm_node_allocated(node) || node->mm != mm) {
-		pr_err("node not allocated\n");
+		kunit_err(test, "node not allocated\n");
 		ok = false;
 	}
 
 	if (node->size != size) {
-		pr_err("node has wrong size, found %llu, expected %llu\n",
-		       node->size, size);
+		kunit_err(test, "node has wrong size, found %llu, expected %llu\n",
+			  node->size, size);
 		ok = false;
 	}
 
 	if (misalignment(node, alignment)) {
-		pr_err("node is misaligned, start %llx rem %llu, expected alignment %llu\n",
-		       node->start, misalignment(node, alignment), alignment);
+		kunit_err(test, "node is misaligned, start %#llx rem %llu, expected alignment %llu\n",
+			  node->start, misalignment(node, alignment), alignment);
 		ok = false;
 	}
 
 	if (node->color != color) {
-		pr_err("node has wrong color, found %lu, expected %lu\n",
-		       node->color, color);
+		kunit_err(test, "node has wrong color, found %lu, expected %lu\n",
+			  node->color, color);
 		ok = false;
 	}
 
 	return ok;
 }
 
-#define show_mm(mm) do { \
-	struct drm_printer __p = drm_debug_printer(__func__); \
-	drm_mm_print((mm), &__p); } while (0)
+struct kunit_drm_mm_context {
+	u64 start;
+	u64 size;
+};
+
+static int __drm_mm_init(struct kunit_resource *res, void *context)
+{
+	struct kunit_drm_mm_context *ctx = context;
+	struct drm_mm *mm = kzalloc(sizeof(*mm), GFP_KERNEL);
+
+	drm_mm_init(mm, ctx->start, ctx->size);
+	res->data = mm;
+
+	return 0;
+}
+
+static void __drm_mm_destroy(struct kunit_resource *res)
+{
+	struct drm_mm *mm = res->data;
+	struct drm_mm_node *node, *next;
+
+	drm_mm_for_each_node_safe(node, next, mm)
+		drm_mm_remove_node(node);
+
+	drm_mm_takedown(mm);
+}
+
+static struct drm_mm *kunit_drm_mm(struct kunit *test, u64 start, u64 size)
+{
+	struct kunit_drm_mm_context context = {
+		.start = start,
+		.size = size
+	};
+
+	return kunit_alloc_resource(test, __drm_mm_init, __drm_mm_destroy, GFP_KERNEL, &context);
+}
+
+struct kunit_drm_random_order_context {
+	unsigned int count;
+	struct rnd_state *state;
+};
+
+static int __drm_random_order_init(struct kunit_resource *res, void *context)
+{
+	struct kunit_drm_random_order_context *ctx = context;
+
+	res->data = drm_random_order(ctx->count, ctx->state);
+
+	return 0;
+}
+
+static void __drm_random_order_destroy(struct kunit_resource *res)
+{
+	kfree(res->data);
+}
+
+static unsigned int *
+kunit_drm_random_order(struct kunit *test, unsigned int count, struct rnd_state *state)
+{
+	struct kunit_drm_random_order_context context = {
+		.count = count,
+		.state = state
+	};
+
+	return kunit_alloc_resource(test, __drm_random_order_init, __drm_random_order_destroy,
+				    GFP_KERNEL, &context);
+}
+
+struct kunit_vmalloc_params {
+	unsigned long size;
+	gfp_t gfp;
+};
+
+static int __kunit_vmalloc_init(struct kunit_resource *res, void *context)
+{
+	struct kunit_vmalloc_params *params = context;
+
+	res->data = __vmalloc(params->size, params->gfp);
+	if (!res->data)
+		return -ENOMEM;
+
+	return 0;
+}
+
+static void __kunit_vmalloc_destroy(struct kunit_resource *res)
+{
+	vfree(res->data);
+}
+
+static void *
+__kunit_vmalloc(struct kunit *test, unsigned long size, gfp_t gfp)
+{
+	struct kunit_vmalloc_params params = {
+		.size = size,
+		.gfp = gfp
+	};
+
+	return kunit_alloc_resource(test, __kunit_vmalloc_init, __kunit_vmalloc_destroy,
+				    GFP_KERNEL, &params);
+}
+
+static void *
+kunit_vmalloc(struct kunit *test, unsigned long size)
+{
+	return __kunit_vmalloc(test, size, GFP_KERNEL);
+}
+
+static void *
+kunit_vzalloc(struct kunit *test, unsigned long size)
+{
+	return __kunit_vmalloc(test, size, GFP_KERNEL | __GFP_ZERO);
+}
+
+static unsigned long *
+kunit_bitmap_alloc(struct kunit *test, unsigned int nbits, gfp_t flags)
+{
+	return kunit_kmalloc_array(test, BITS_TO_LONGS(nbits), sizeof(unsigned long),
+				   flags);
+}
+
+static unsigned long *
+kunit_bitmap_zalloc(struct kunit *test, unsigned int nbits, gfp_t flags)
+{
+	return kunit_bitmap_alloc(test, nbits, flags | __GFP_ZERO);
+}
 
-static int igt_init(void *ignored)
+static void test_init(struct kunit *test)
 {
 	const unsigned int size = 4096;
 	struct drm_mm mm;
 	struct drm_mm_node tmp;
-	int ret = -EINVAL;
 
 	/* Start with some simple checks on initialising the struct drm_mm */
 	memset(&mm, 0, sizeof(mm));
-	if (drm_mm_initialized(&mm)) {
-		pr_err("zeroed mm claims to be initialized\n");
-		return ret;
-	}
+	KUNIT_EXPECT_FALSE_MSG(test, drm_mm_initialized(&mm), "zeroed mm claims to be initialized");
 
 	memset(&mm, 0xff, sizeof(mm));
 	drm_mm_init(&mm, 0, size);
-	if (!drm_mm_initialized(&mm)) {
-		pr_err("mm claims not to be initialized\n");
-		goto out;
-	}
-
-	if (!drm_mm_clean(&mm)) {
-		pr_err("mm not empty on creation\n");
-		goto out;
-	}
-
-	/* After creation, it should all be one massive hole */
-	if (!assert_one_hole(&mm, 0, size)) {
-		ret = -EINVAL;
-		goto out;
-	}
+	KUNIT_EXPECT_TRUE_MSG(test, drm_mm_initialized(&mm), "mm claims not to be initialized");
+	KUNIT_EXPECT_TRUE_MSG(test, drm_mm_clean(&mm), "mm not empty on creation");
+	KUNIT_EXPECT_TRUE_MSG(test, has_one_hole(test, &mm, 0, size),
+			      "after creation, it should all be one massive hole");
 
 	memset(&tmp, 0, sizeof(tmp));
 	tmp.start = 0;
 	tmp.size = size;
-	ret = drm_mm_reserve_node(&mm, &tmp);
-	if (ret) {
-		pr_err("failed to reserve whole drm_mm\n");
-		goto out;
-	}
-
-	/* After filling the range entirely, there should be no holes */
-	if (!assert_no_holes(&mm)) {
-		ret = -EINVAL;
-		goto out;
-	}
+	KUNIT_ASSERT_EQ_MSG(test, drm_mm_reserve_node(&mm, &tmp), 0,
+			    "failed to reserve whole drm_mm");
+	KUNIT_EXPECT_TRUE_MSG(test, has_no_holes(test, &mm),
+			      "after filling the range entirely, there should be no holes");
 
-	/* And then after emptying it again, the massive hole should be back */
 	drm_mm_remove_node(&tmp);
-	if (!assert_one_hole(&mm, 0, size)) {
-		ret = -EINVAL;
-		goto out;
-	}
+	KUNIT_EXPECT_TRUE_MSG(test, has_one_hole(test, &mm, 0, size),
+			      "after emptying it again, the massive hole should be back");
 
-out:
-	if (ret)
-		show_mm(&mm);
 	drm_mm_takedown(&mm);
-	return ret;
 }
 
-static int igt_debug(void *ignored)
+static void test_debug(struct kunit *test)
 {
 	struct drm_mm mm;
 	struct drm_mm_node nodes[2];
-	int ret;
 
 	/* Create a small drm_mm with a couple of nodes and a few holes, and
 	 * check that the debug iterator doesn't explode over a trivial drm_mm.
@@ -277,24 +529,17 @@ static int igt_debug(void *ignored)
 	memset(nodes, 0, sizeof(nodes));
 	nodes[0].start = 512;
 	nodes[0].size = 1024;
-	ret = drm_mm_reserve_node(&mm, &nodes[0]);
-	if (ret) {
-		pr_err("failed to reserve node[0] {start=%lld, size=%lld)\n",
-		       nodes[0].start, nodes[0].size);
-		return ret;
-	}
+	KUNIT_ASSERT_EQ_MSG(test, drm_mm_reserve_node(&mm, &nodes[0]), 0,
+			    "failed to reserve node[0] {start=%lld, size=%lld)",
+			    nodes[0].start, nodes[0].size);
 
 	nodes[1].size = 1024;
 	nodes[1].start = 4096 - 512 - nodes[1].size;
-	ret = drm_mm_reserve_node(&mm, &nodes[1]);
-	if (ret) {
-		pr_err("failed to reserve node[1] {start=%lld, size=%lld)\n",
-		       nodes[1].start, nodes[1].size);
-		return ret;
-	}
+	KUNIT_ASSERT_EQ_MSG(test, drm_mm_reserve_node(&mm, &nodes[1]), 0,
+			    "failed to reserve node[1] {start=%lld, size=%lld)",
+			    nodes[1].start, nodes[1].size);
 
-	show_mm(&mm);
-	return 0;
+	show_mm(test, &mm);
 }
 
 static struct drm_mm_node *set_node(struct drm_mm_node *node,
@@ -305,7 +550,8 @@ static struct drm_mm_node *set_node(struct drm_mm_node *node,
 	return node;
 }
 
-static bool expect_reserve_fail(struct drm_mm *mm, struct drm_mm_node *node)
+static bool
+check_reserve_fail(struct kunit *test, struct drm_mm *mm, struct drm_mm_node *node)
 {
 	int err;
 
@@ -314,19 +560,18 @@ static bool expect_reserve_fail(struct drm_mm *mm, struct drm_mm_node *node)
 		return true;
 
 	if (!err) {
-		pr_err("impossible reserve succeeded, node %llu + %llu\n",
-		       node->start, node->size);
+		kunit_err(test, "impossible reserve succeeded, node %llu + %llu\n",
+			  node->start, node->size);
 		drm_mm_remove_node(node);
 	} else {
-		pr_err("impossible reserve failed with wrong error %d [expected %d], node %llu + %llu\n",
-		       err, -ENOSPC, node->start, node->size);
+		kunit_err(test, "impossible reserve failed with wrong error %d [expected %d], node %llu + %llu\n",
+			  err, -ENOSPC, node->start, node->size);
 	}
 	return false;
 }
 
-static bool check_reserve_boundaries(struct drm_mm *mm,
-				     unsigned int count,
-				     u64 size)
+static bool
+check_reserve_boundaries(struct kunit *test, struct drm_mm *mm, unsigned int count, u64 size)
 {
 	const struct boundary {
 		u64 start, size;
@@ -339,29 +584,29 @@ static bool check_reserve_boundaries(struct drm_mm *mm,
 		B(size * count, 0),
 		B(-size, size),
 		B(-size, -size),
-		B(-size, 2*size),
+		B(-size, 2 * size),
 		B(0, -size),
 		B(size, -size),
-		B(count*size, size),
-		B(count*size, -size),
-		B(count*size, count*size),
-		B(count*size, -count*size),
-		B(count*size, -(count+1)*size),
-		B((count+1)*size, size),
-		B((count+1)*size, -size),
-		B((count+1)*size, -2*size),
+		B(count * size, size),
+		B(count * size, -size),
+		B(count * size, count * size),
+		B(count * size, -count * size),
+		B(count * size, -(count + 1) * size),
+		B((count + 1) * size, size),
+		B((count + 1) * size, -size),
+		B((count + 1) * size, -2 * size),
 #undef B
 	};
 	struct drm_mm_node tmp = {};
 	int n;
 
 	for (n = 0; n < ARRAY_SIZE(boundaries); n++) {
-		if (!expect_reserve_fail(mm,
-					 set_node(&tmp,
-						  boundaries[n].start,
-						  boundaries[n].size))) {
-			pr_err("boundary[%d:%s] failed, count=%u, size=%lld\n",
-			       n, boundaries[n].name, count, size);
+		if (!check_reserve_fail(test, mm,
+					set_node(&tmp,
+						 boundaries[n].start,
+						 boundaries[n].size))) {
+			kunit_err(test, "boundary[%d:%s] failed, count=%u, size=%lld\n",
+				  n, boundaries[n].name, count, size);
 			return false;
 		}
 	}
@@ -369,13 +614,48 @@ static bool check_reserve_boundaries(struct drm_mm *mm,
 	return true;
 }
 
-static int __igt_reserve(unsigned int count, u64 size)
+static const u64 simple_size_less(const unsigned int prime)
+{
+	return BIT_ULL(prime) - 1;
+}
+
+static const u64 simple_size_equal(const unsigned int prime)
+{
+	return BIT_ULL(prime);
+}
+
+static const u64 simple_size_more(const unsigned int prime)
+{
+	return BIT_ULL(prime) + 1;
+}
+
+static const u64 (*simple_size_ops[])(const unsigned int) = {
+	simple_size_less,
+	simple_size_equal,
+	simple_size_more,
+};
+
+struct reserve_test {
+	const u64 size;
+};
+
+static const struct reserve_test param_to_reserve_test(const unsigned long param)
+{
+	unsigned int prime = FIELD_GET(DRM_MM_PRIME_MASK, param);
+	const u64 (*op)(const unsigned int) = simple_size_ops[FIELD_GET(DRM_MM_OP_MASK, param)];
+
+	return (const struct reserve_test) { .size = op(prime) };
+}
+
+static void test_reserve(struct kunit *test)
 {
+	const struct reserve_test t = param_to_reserve_test((unsigned long)test->param_value);
+	const unsigned int count = min_t(unsigned int, BIT(10), max_iterations);
+	const u64 size = t.size;
 	DRM_RND_STATE(prng, random_seed);
-	struct drm_mm mm;
-	struct drm_mm_node tmp, *nodes, *node, *next;
+	struct drm_mm *mm;
+	struct drm_mm_node tmp, *nodes, *node;
 	unsigned int *order, n, m, o = 0;
-	int ret, err;
 
 	/* For exercising drm_mm_reserve_node(), we want to check that
 	 * reservations outside of the drm_mm range are rejected, and to
@@ -383,83 +663,59 @@ static int __igt_reserve(unsigned int count, u64 size)
 	 * the tree and nodes should be intact.
 	 */
 
-	DRM_MM_BUG_ON(!count);
-	DRM_MM_BUG_ON(!size);
+	KUNIT_ASSERT_GT(test, count, 0);
+	KUNIT_ASSERT_GT(test, size, 0);
 
-	ret = -ENOMEM;
-	order = drm_random_order(count, &prng);
-	if (!order)
-		goto err;
+	order = kunit_drm_random_order(test, count, &prng);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, order);
 
-	nodes = vzalloc(array_size(count, sizeof(*nodes)));
-	if (!nodes)
-		goto err_order;
+	nodes = kunit_vzalloc(test, array_size(count, sizeof(*nodes)));
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, nodes);
 
-	ret = -EINVAL;
-	drm_mm_init(&mm, 0, count * size);
+	mm = kunit_drm_mm(test, 0, count * size);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, mm);
 
-	if (!check_reserve_boundaries(&mm, count, size))
-		goto out;
+	KUNIT_EXPECT_TRUE(test, check_reserve_boundaries(test, mm, count, size));
 
 	for (n = 0; n < count; n++) {
 		nodes[n].start = order[n] * size;
 		nodes[n].size = size;
 
-		err = drm_mm_reserve_node(&mm, &nodes[n]);
-		if (err) {
-			pr_err("reserve failed, step %d, start %llu\n",
-			       n, nodes[n].start);
-			ret = err;
-			goto out;
-		}
-
-		if (!drm_mm_node_allocated(&nodes[n])) {
-			pr_err("reserved node not allocated! step %d, start %llu\n",
-			       n, nodes[n].start);
-			goto out;
-		}
-
-		if (!expect_reserve_fail(&mm, &nodes[n]))
-			goto out;
+		KUNIT_ASSERT_EQ_MSG(test, drm_mm_reserve_node(mm, &nodes[n]), 0,
+				    "reserve failed, step %d, start %llu",
+				    n, nodes[n].start);
+		KUNIT_EXPECT_TRUE_MSG(test, drm_mm_node_allocated(&nodes[n]),
+				      "reserved node not allocated! step %d, start %llu",
+				      n, nodes[n].start);
+		KUNIT_EXPECT_TRUE(test, check_reserve_fail(test, mm, &nodes[n]));
 	}
 
 	/* After random insertion the nodes should be in order */
-	if (!assert_continuous(&mm, size))
-		goto out;
+	KUNIT_EXPECT_TRUE(test, is_continuous(test, mm, size));
 
 	/* Repeated use should then fail */
 	drm_random_reorder(order, count, &prng);
 	for (n = 0; n < count; n++) {
-		if (!expect_reserve_fail(&mm,
-					 set_node(&tmp, order[n] * size, 1)))
-			goto out;
+		KUNIT_EXPECT_TRUE(test,
+				  check_reserve_fail(test, mm, set_node(&tmp, order[n] * size, 1)));
 
 		/* Remove and reinsert should work */
 		drm_mm_remove_node(&nodes[order[n]]);
-		err = drm_mm_reserve_node(&mm, &nodes[order[n]]);
-		if (err) {
-			pr_err("reserve failed, step %d, start %llu\n",
-			       n, nodes[n].start);
-			ret = err;
-			goto out;
-		}
+		KUNIT_ASSERT_EQ_MSG(test, drm_mm_reserve_node(mm, &nodes[order[n]]), 0,
+				    "reserve failed, step %d, start %llu",
+				    n, nodes[n].start);
 	}
 
-	if (!assert_continuous(&mm, size))
-		goto out;
+	KUNIT_EXPECT_TRUE(test, is_continuous(test, mm, size));
 
 	/* Overlapping use should then fail */
-	for (n = 0; n < count; n++) {
-		if (!expect_reserve_fail(&mm, set_node(&tmp, 0, size*count)))
-			goto out;
-	}
-	for (n = 0; n < count; n++) {
-		if (!expect_reserve_fail(&mm,
-					 set_node(&tmp,
-						  size * n,
-						  size * (count - n))))
-			goto out;
-	}
+	for (n = 0; n < count; n++)
+		KUNIT_EXPECT_TRUE(test,
+				  check_reserve_fail(test, mm, set_node(&tmp, 0, size * count)));
+	for (n = 0; n < count; n++)
+		KUNIT_EXPECT_TRUE(test,
+				  check_reserve_fail(test, mm, set_node(&tmp, size * n,
+									size * (count - n))));
 
 	/* Remove several, reinsert, check full */
 	for_each_prime_number(n, min(max_prime, count)) {
@@ -470,62 +726,38 @@ static int __igt_reserve(unsigned int count, u64 size)
 
 		for (m = 0; m < n; m++) {
 			node = &nodes[order[(o + m) % count]];
-			err = drm_mm_reserve_node(&mm, node);
-			if (err) {
-				pr_err("reserve failed, step %d/%d, start %llu\n",
-				       m, n, node->start);
-				ret = err;
-				goto out;
-			}
+			KUNIT_ASSERT_EQ_MSG(test, drm_mm_reserve_node(mm, node), 0,
+					    "reserve failed, step %d/%d, start %llu",
+					    m, n, node->start);
 		}
 
 		o += n;
 
-		if (!assert_continuous(&mm, size))
-			goto out;
+		KUNIT_EXPECT_TRUE(test, is_continuous(test, mm, size));
 	}
-
-	ret = 0;
-out:
-	drm_mm_for_each_node_safe(node, next, &mm)
-		drm_mm_remove_node(node);
-	drm_mm_takedown(&mm);
-	vfree(nodes);
-err_order:
-	kfree(order);
-err:
-	return ret;
 }
 
-static int igt_reserve(void *ignored)
+#define IGT_RESERVE_MAX_PRIME 54
+static const void *reserve_gen_params(const void *prev, char *desc)
 {
-	const unsigned int count = min_t(unsigned int, BIT(10), max_iterations);
-	int n, ret;
-
-	for_each_prime_number_from(n, 1, 54) {
-		u64 size = BIT_ULL(n);
-
-		ret = __igt_reserve(count, size - 1);
-		if (ret)
-			return ret;
+	unsigned long param = (unsigned long)prev;
 
-		ret = __igt_reserve(count, size);
-		if (ret)
-			return ret;
+	if (!prev)
+		kunit_drm_mm_print_params();
 
-		ret = __igt_reserve(count, size + 1);
-		if (ret)
-			return ret;
+	param = prime_ops_gen_param(param,
+				    IGT_RESERVE_MAX_PRIME,
+				    ARRAY_SIZE(simple_size_ops));
 
-		cond_resched();
-	}
+	if (param_valid(param))
+		sprintf(desc, "size = %llu", param_to_reserve_test(param).size);
 
-	return 0;
+	return (void *)param;
 }
 
-static bool expect_insert(struct drm_mm *mm, struct drm_mm_node *node,
-			  u64 size, u64 alignment, unsigned long color,
-			  const struct insert_mode *mode)
+static bool check_insert(struct kunit *test, struct drm_mm *mm, struct drm_mm_node *node,
+			 u64 size, u64 alignment, unsigned long color,
+			 const struct insert_mode *mode)
 {
 	int err;
 
@@ -533,12 +765,12 @@ static bool expect_insert(struct drm_mm *mm, struct drm_mm_node *node,
 					 size, alignment, color,
 					 mode->mode);
 	if (err) {
-		pr_err("insert (size=%llu, alignment=%llu, color=%lu, mode=%s) failed with err=%d\n",
-		       size, alignment, color, mode->name, err);
+		kunit_err(test, "insert (size=%llu, alignment=%llu, color=%lu, mode=%s) failed with err=%d\n",
+			  size, alignment, color, mode->name, err);
 		return false;
 	}
 
-	if (!assert_node(node, mm, size, alignment, color)) {
+	if (!check_node(test, node, mm, size, alignment, color)) {
 		drm_mm_remove_node(node);
 		return false;
 	}
@@ -546,7 +778,7 @@ static bool expect_insert(struct drm_mm *mm, struct drm_mm_node *node,
 	return true;
 }
 
-static bool expect_insert_fail(struct drm_mm *mm, u64 size)
+static bool check_insert_fail(struct kunit *test, struct drm_mm *mm, u64 size)
 {
 	struct drm_mm_node tmp = {};
 	int err;
@@ -556,214 +788,158 @@ static bool expect_insert_fail(struct drm_mm *mm, u64 size)
 		return true;
 
 	if (!err) {
-		pr_err("impossible insert succeeded, node %llu + %llu\n",
-		       tmp.start, tmp.size);
+		kunit_err(test, "impossible insert succeeded, node %llu + %llu\n",
+			  tmp.start, tmp.size);
 		drm_mm_remove_node(&tmp);
 	} else {
-		pr_err("impossible insert failed with wrong error %d [expected %d], size %llu\n",
-		       err, -ENOSPC, size);
+		kunit_err(test, "impossible insert failed with wrong error %d [expected %d], size %llu\n",
+			  err, -ENOSPC, size);
 	}
 	return false;
 }
 
-static int __igt_insert(unsigned int count, u64 size, bool replace)
+struct insert_replace_test {
+	const u64 size;
+	const struct insert_mode *mode;
+};
+
+static const struct insert_replace_test param_to_insert_replace_test(unsigned long param)
+{
+	unsigned int prime = FIELD_GET(DRM_MM_PRIME_MASK, param);
+	unsigned int mode = FIELD_GET(DRM_MM_MODE_MASK, param);
+	const u64 (*op)(const unsigned int) = simple_size_ops[FIELD_GET(DRM_MM_OP_MASK, param)];
+
+	return (const struct insert_replace_test) { .size = op(prime),
+						    .mode = &insert_modes[mode] };
+}
+
+static void __test_insert(struct kunit *test, bool replace)
 {
+	const struct insert_replace_test t =
+		param_to_insert_replace_test((unsigned long)test->param_value);
+	const unsigned int count = min_t(unsigned int, BIT(10), max_iterations);
+	const struct insert_mode *mode = t.mode;
+	const u64 size = t.size;
 	DRM_RND_STATE(prng, random_seed);
-	const struct insert_mode *mode;
-	struct drm_mm mm;
+	struct drm_mm *mm;
 	struct drm_mm_node *nodes, *node, *next;
 	unsigned int *order, n, m, o = 0;
-	int ret;
 
 	/* Fill a range with lots of nodes, check it doesn't fail too early */
 
-	DRM_MM_BUG_ON(!count);
-	DRM_MM_BUG_ON(!size);
+	KUNIT_ASSERT_GT(test, count, 0);
+	KUNIT_ASSERT_GT(test, size, 0);
 
-	ret = -ENOMEM;
-	nodes = vmalloc(array_size(count, sizeof(*nodes)));
-	if (!nodes)
-		goto err;
+	nodes = kunit_vmalloc(test, array_size(count, sizeof(*nodes)));
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, nodes);
 
-	order = drm_random_order(count, &prng);
-	if (!order)
-		goto err_nodes;
+	order = kunit_drm_random_order(test, count, &prng);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, order);
 
-	ret = -EINVAL;
-	drm_mm_init(&mm, 0, count * size);
+	mm = kunit_drm_mm(test, 0, count * size);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, mm);
 
-	for (mode = insert_modes; mode->name; mode++) {
-		for (n = 0; n < count; n++) {
-			struct drm_mm_node tmp;
+	for (n = 0; n < count; n++) {
+		struct drm_mm_node tmp;
 
-			node = replace ? &tmp : &nodes[n];
-			memset(node, 0, sizeof(*node));
-			if (!expect_insert(&mm, node, size, 0, n, mode)) {
-				pr_err("%s insert failed, size %llu step %d\n",
-				       mode->name, size, n);
-				goto out;
-			}
+		node = replace ? &tmp : &nodes[n];
+		memset(node, 0, sizeof(*node));
+		KUNIT_ASSERT_TRUE_MSG(test,
+				      check_insert(test, mm, node, size, 0, n, mode),
+				      "insert failed, size %llu step %d", size, n);
 
-			if (replace) {
-				drm_mm_replace_node(&tmp, &nodes[n]);
-				if (drm_mm_node_allocated(&tmp)) {
-					pr_err("replaced old-node still allocated! step %d\n",
-					       n);
-					goto out;
-				}
-
-				if (!assert_node(&nodes[n], &mm, size, 0, n)) {
-					pr_err("replaced node did not inherit parameters, size %llu step %d\n",
-					       size, n);
-					goto out;
-				}
-
-				if (tmp.start != nodes[n].start) {
-					pr_err("replaced node mismatch location expected [%llx + %llx], found [%llx + %llx]\n",
-					       tmp.start, size,
-					       nodes[n].start, nodes[n].size);
-					goto out;
-				}
-			}
+		if (replace) {
+			drm_mm_replace_node(&tmp, &nodes[n]);
+			KUNIT_EXPECT_FALSE_MSG(test, drm_mm_node_allocated(&tmp),
+					       "replaced old-node still allocated! step %d", n);
+			KUNIT_EXPECT_TRUE_MSG(test, check_node(test, &nodes[n], mm, size, 0, n),
+					      "replaced node did not inherit parameters, size %llu step %d",
+					      size, n);
+			KUNIT_EXPECT_EQ_MSG(test, tmp.start, nodes[n].start,
+					    "replaced node mismatch location expected [%#llx + %#llx], found [%#llx + %#llx]",
+					    tmp.start, size, nodes[n].start, nodes[n].size);
 		}
+	}
 
-		/* After random insertion the nodes should be in order */
-		if (!assert_continuous(&mm, size))
-			goto out;
-
-		/* Repeated use should then fail */
-		if (!expect_insert_fail(&mm, size))
-			goto out;
-
-		/* Remove one and reinsert, as the only hole it should refill itself */
-		for (n = 0; n < count; n++) {
-			u64 addr = nodes[n].start;
+	KUNIT_EXPECT_TRUE_MSG(test, is_continuous(test, mm, size),
+			      "After random insertion the nodes should be in order");
+	KUNIT_EXPECT_TRUE_MSG(test, check_insert_fail(test, mm, size),
+			      "After random insertion, repeated use should fail");
 
-			drm_mm_remove_node(&nodes[n]);
-			if (!expect_insert(&mm, &nodes[n], size, 0, n, mode)) {
-				pr_err("%s reinsert failed, size %llu step %d\n",
-				       mode->name, size, n);
-				goto out;
-			}
+	/* Remove one and reinsert, as the only hole it should refill itself */
+	for (n = 0; n < count; n++) {
+		u64 addr = nodes[n].start;
 
-			if (nodes[n].start != addr) {
-				pr_err("%s reinsert node moved, step %d, expected %llx, found %llx\n",
-				       mode->name, n, addr, nodes[n].start);
-				goto out;
-			}
+		drm_mm_remove_node(&nodes[n]);
+		KUNIT_ASSERT_TRUE_MSG(test, check_insert(test, mm, &nodes[n], size, 0, n, mode),
+				      "reinsert failed, size %llu step %d", size, n);
+		KUNIT_EXPECT_EQ_MSG(test, nodes[n].start, addr,
+				    "reinsert node moved, step %d, expected %#llx, found %#llx",
+				    n, addr, nodes[n].start);
+		KUNIT_EXPECT_TRUE(test, is_continuous(test, mm, size));
+	}
 
-			if (!assert_continuous(&mm, size))
-				goto out;
+	/* Remove several, reinsert, check full */
+	for_each_prime_number(n, min(max_prime, count)) {
+		for (m = 0; m < n; m++) {
+			node = &nodes[order[(o + m) % count]];
+			drm_mm_remove_node(node);
 		}
 
-		/* Remove several, reinsert, check full */
-		for_each_prime_number(n, min(max_prime, count)) {
-			for (m = 0; m < n; m++) {
-				node = &nodes[order[(o + m) % count]];
-				drm_mm_remove_node(node);
-			}
-
-			for (m = 0; m < n; m++) {
-				node = &nodes[order[(o + m) % count]];
-				if (!expect_insert(&mm, node, size, 0, n, mode)) {
-					pr_err("%s multiple reinsert failed, size %llu step %d\n",
-					       mode->name, size, n);
-					goto out;
-				}
-			}
-
-			o += n;
-
-			if (!assert_continuous(&mm, size))
-				goto out;
-
-			if (!expect_insert_fail(&mm, size))
-				goto out;
+		for (m = 0; m < n; m++) {
+			node = &nodes[order[(o + m) % count]];
+			KUNIT_ASSERT_TRUE_MSG(test, check_insert(test, mm, node, size, 0, n, mode),
+					      "multiple reinsert failed, size %llu step %d",
+					      size, n);
 		}
 
-		drm_mm_for_each_node_safe(node, next, &mm)
-			drm_mm_remove_node(node);
-		DRM_MM_BUG_ON(!drm_mm_clean(&mm));
+		o += n;
 
-		cond_resched();
+		KUNIT_EXPECT_TRUE(test, is_continuous(test, mm, size));
+		KUNIT_EXPECT_TRUE(test, check_insert_fail(test, mm, size));
 	}
 
-	ret = 0;
-out:
-	drm_mm_for_each_node_safe(node, next, &mm)
+	drm_mm_for_each_node_safe(node, next, mm)
 		drm_mm_remove_node(node);
-	drm_mm_takedown(&mm);
-	kfree(order);
-err_nodes:
-	vfree(nodes);
-err:
-	return ret;
+	KUNIT_ASSERT_TRUE(test, drm_mm_clean(mm));
 }
 
-static int igt_insert(void *ignored)
+static void test_insert(struct kunit *test)
 {
-	const unsigned int count = min_t(unsigned int, BIT(10), max_iterations);
-	unsigned int n;
-	int ret;
-
-	for_each_prime_number_from(n, 1, 54) {
-		u64 size = BIT_ULL(n);
-
-		ret = __igt_insert(count, size - 1, false);
-		if (ret)
-			return ret;
-
-		ret = __igt_insert(count, size, false);
-		if (ret)
-			return ret;
-
-		ret = __igt_insert(count, size + 1, false);
-		if (ret)
-			return ret;
-
-		cond_resched();
-	}
-
-	return 0;
+	__test_insert(test, false);
 }
 
-static int igt_replace(void *ignored)
+static void test_replace(struct kunit *test)
 {
-	const unsigned int count = min_t(unsigned int, BIT(10), max_iterations);
-	unsigned int n;
-	int ret;
-
-	/* Reuse igt_insert to exercise replacement by inserting a dummy node,
-	 * then replacing it with the intended node. We want to check that
-	 * the tree is intact and all the information we need is carried
-	 * across to the target node.
-	 */
+	__test_insert(test, true);
+}
 
-	for_each_prime_number_from(n, 1, 54) {
-		u64 size = BIT_ULL(n);
+#define IGT_INSERT_REPLACE_MAX_PRIME 54
+static const void *insert_replace_gen_params(const void *prev, char *desc)
+{
+	unsigned long param = (unsigned long)prev;
 
-		ret = __igt_insert(count, size - 1, true);
-		if (ret)
-			return ret;
+	if (!prev)
+		kunit_drm_mm_print_params();
 
-		ret = __igt_insert(count, size, true);
-		if (ret)
-			return ret;
+	param = mode_prime_ops_gen_param(param,
+					 ARRAY_SIZE(insert_modes),
+					 IGT_INSERT_REPLACE_MAX_PRIME,
+					 ARRAY_SIZE(simple_size_ops));
 
-		ret = __igt_insert(count, size + 1, true);
-		if (ret)
-			return ret;
+	if (param_valid(param)) {
+		const struct insert_replace_test t = param_to_insert_replace_test(param);
 
-		cond_resched();
+		sprintf(desc, "size = %llu %s", t.size, t.mode->name);
 	}
 
-	return 0;
+	return (void *)param;
 }
 
-static bool expect_insert_in_range(struct drm_mm *mm, struct drm_mm_node *node,
-				   u64 size, u64 alignment, unsigned long color,
-				   u64 range_start, u64 range_end,
-				   const struct insert_mode *mode)
+static bool check_insert_in_range(struct kunit *test, struct drm_mm *mm, struct drm_mm_node *node,
+				  u64 size, u64 alignment, unsigned long color,
+				  u64 range_start, u64 range_end,
+				  const struct insert_mode *mode)
 {
 	int err;
 
@@ -772,13 +948,13 @@ static bool expect_insert_in_range(struct drm_mm *mm, struct drm_mm_node *node,
 					  range_start, range_end,
 					  mode->mode);
 	if (err) {
-		pr_err("insert (size=%llu, alignment=%llu, color=%lu, mode=%s) nto range [%llx, %llx] failed with err=%d\n",
-		       size, alignment, color, mode->name,
-		       range_start, range_end, err);
+		kunit_err(test, "insert (size=%llu, alignment=%llu, color=%lu, mode=%s) into range [%#llx, %#llx] failed with err=%d\n",
+			  size, alignment, color, mode->name,
+			  range_start, range_end, err);
 		return false;
 	}
 
-	if (!assert_node(node, mm, size, alignment, color)) {
+	if (!check_node(test, node, mm, size, alignment, color)) {
 		drm_mm_remove_node(node);
 		return false;
 	}
@@ -786,10 +962,11 @@ static bool expect_insert_in_range(struct drm_mm *mm, struct drm_mm_node *node,
 	return true;
 }
 
-static bool expect_insert_in_range_fail(struct drm_mm *mm,
-					u64 size,
-					u64 range_start,
-					u64 range_end)
+static bool check_insert_in_range_fail(struct kunit *test,
+				       struct drm_mm *mm,
+				       u64 size,
+				       u64 range_start,
+				       u64 range_end)
 {
 	struct drm_mm_node tmp = {};
 	int err;
@@ -802,51 +979,53 @@ static bool expect_insert_in_range_fail(struct drm_mm *mm,
 		return true;
 
 	if (!err) {
-		pr_err("impossible insert succeeded, node %llx + %llu, range [%llx, %llx]\n",
-		       tmp.start, tmp.size, range_start, range_end);
+		kunit_err(test, "impossible insert succeeded, node %#llx + %llu, range [%#llx, %#llx]\n",
+			  tmp.start, tmp.size, range_start, range_end);
 		drm_mm_remove_node(&tmp);
 	} else {
-		pr_err("impossible insert failed with wrong error %d [expected %d], size %llu, range [%llx, %llx]\n",
-		       err, -ENOSPC, size, range_start, range_end);
+		kunit_err(test,
+			  "impossible insert failed with wrong error %d [expected %d], size %llu, range [%#llx, %#llx]\n",
+			  err, -ENOSPC, size, range_start, range_end);
 	}
 
 	return false;
 }
 
-static bool assert_contiguous_in_range(struct drm_mm *mm,
-				       u64 size,
-				       u64 start,
-				       u64 end)
+static bool check_contiguous_in_range(struct kunit *test,
+				      struct drm_mm *mm,
+				      u64 size,
+				      u64 start,
+				      u64 end)
 {
 	struct drm_mm_node *node;
 	unsigned int n;
 
-	if (!expect_insert_in_range_fail(mm, size, start, end))
+	if (!check_insert_in_range_fail(test, mm, size, start, end))
 		return false;
 
 	n = div64_u64(start + size - 1, size);
 	drm_mm_for_each_node(node, mm) {
 		if (node->start < start || node->start + node->size > end) {
-			pr_err("node %d out of range, address [%llx + %llu], range [%llx, %llx]\n",
-			       n, node->start, node->start + node->size, start, end);
+			kunit_err(test, "node %d out of range, address [%#llx + %llu], range [%#llx, %#llx]\n",
+				  n, node->start, node->start + node->size, start, end);
 			return false;
 		}
 
 		if (node->start != n * size) {
-			pr_err("node %d out of order, expected start %llx, found %llx\n",
-			       n, n * size, node->start);
+			kunit_err(test, "node %d out of order, expected start %#llx, found %#llx\n",
+				  n, n * size, node->start);
 			return false;
 		}
 
 		if (node->size != size) {
-			pr_err("node %d has wrong size, expected size %llx, found %llx\n",
-			       n, size, node->size);
+			kunit_err(test, "node %d has wrong size, expected size %#llx, found %#llx\n",
+				  n, size, node->size);
 			return false;
 		}
 
 		if (drm_mm_hole_follows(node) &&
 		    drm_mm_hole_node_end(node) < end) {
-			pr_err("node %d is followed by a hole!\n", n);
+			kunit_err(test, "node %d is followed by a hole!\n", n);
 			return false;
 		}
 
@@ -856,8 +1035,8 @@ static bool assert_contiguous_in_range(struct drm_mm *mm,
 	if (start > 0) {
 		node = __drm_mm_interval_first(mm, 0, start - 1);
 		if (drm_mm_node_allocated(node)) {
-			pr_err("node before start: node=%llx+%llu, start=%llx\n",
-			       node->start, node->size, start);
+			kunit_err(test, "node before start: node=%#llx+%llu, start=%#llx\n",
+				  node->start, node->size, start);
 			return false;
 		}
 	}
@@ -865,8 +1044,8 @@ static bool assert_contiguous_in_range(struct drm_mm *mm,
 	if (end < U64_MAX) {
 		node = __drm_mm_interval_first(mm, end, U64_MAX);
 		if (drm_mm_node_allocated(node)) {
-			pr_err("node after end: node=%llx+%llu, end=%llx\n",
-			       node->start, node->size, end);
+			kunit_err(test, "node after end: node=%#llx+%llu, end=%#llx\n",
+				  node->start, node->size, end);
 			return false;
 		}
 	}
@@ -874,181 +1053,183 @@ static bool assert_contiguous_in_range(struct drm_mm *mm,
 	return true;
 }
 
-static int __igt_insert_range(unsigned int count, u64 size, u64 start, u64 end)
-{
+struct insert_range_test {
+	const unsigned int count;
+	const u64 size;
+	const u64 start;
+	const u64 end;
 	const struct insert_mode *mode;
-	struct drm_mm mm;
+};
+
+#define __insert_range_test(name, __start, __end) \
+const struct insert_range_test insert_range_test##name(const unsigned int prime, \
+						       const unsigned int mode) \
+{ \
+	const unsigned int count = min_t(unsigned int, BIT(13), max_iterations); \
+	const u64 size = BIT_ULL(prime); \
+	const u64 max = count * size; \
+	return (const struct insert_range_test) { \
+		.count = count, \
+		.size = size, \
+		.start = (__start), \
+		.end = (__end), \
+		.mode = &insert_modes[mode] \
+	}; \
+}
+
+__insert_range_test(0, 0, max);
+__insert_range_test(1, 1, max);
+__insert_range_test(2, 0, max - 1);
+__insert_range_test(3, 0, max / 2);
+__insert_range_test(4, max / 2, max);
+__insert_range_test(5, max / 4 + 1, 3 * max / 4 - 1);
+
+static const struct insert_range_test
+(*insert_range_tests[])(const unsigned int, const unsigned int) = {
+	insert_range_test0,
+	insert_range_test1,
+	insert_range_test2,
+	insert_range_test3,
+	insert_range_test4,
+	insert_range_test5,
+};
+
+static const struct insert_range_test param_to_insert_range_test(const unsigned long param)
+{
+	unsigned int prime = FIELD_GET(DRM_MM_PRIME_MASK, param);
+	unsigned int mode = FIELD_GET(DRM_MM_MODE_MASK, param);
+	const struct insert_range_test (*op)(const unsigned int, const unsigned int) =
+		insert_range_tests[FIELD_GET(DRM_MM_OP_MASK, param)];
+
+	return op(prime, mode);
+}
+
+static void test_insert_range(struct kunit *test)
+{
+	const struct insert_range_test t =
+		param_to_insert_range_test((unsigned long)test->param_value);
+	const unsigned int count = t.count;
+	const u64 size = t.size;
+	const u64 start = t.start;
+	const u64 end = t.end;
+	const struct insert_mode *mode = t.mode;
+	struct drm_mm *mm;
 	struct drm_mm_node *nodes, *node, *next;
 	unsigned int n, start_n, end_n;
-	int ret;
 
-	DRM_MM_BUG_ON(!count);
-	DRM_MM_BUG_ON(!size);
-	DRM_MM_BUG_ON(end <= start);
+	KUNIT_ASSERT_GT(test, count, 0);
+	KUNIT_ASSERT_GT(test, size, 0);
+	KUNIT_ASSERT_GT(test, end, start);
 
-	/* Very similar to __igt_insert(), but now instead of populating the
+	/* Very similar to test_insert(), but now instead of populating the
 	 * full range of the drm_mm, we try to fill a small portion of it.
 	 */
 
-	ret = -ENOMEM;
-	nodes = vzalloc(array_size(count, sizeof(*nodes)));
-	if (!nodes)
-		goto err;
+	nodes = kunit_vzalloc(test, array_size(count, sizeof(*nodes)));
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, nodes);
 
-	ret = -EINVAL;
-	drm_mm_init(&mm, 0, count * size);
+	mm = kunit_drm_mm(test, 0, count * size);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, mm);
 
 	start_n = div64_u64(start + size - 1, size);
 	end_n = div64_u64(end - size, size);
 
-	for (mode = insert_modes; mode->name; mode++) {
-		for (n = start_n; n <= end_n; n++) {
-			if (!expect_insert_in_range(&mm, &nodes[n],
-						    size, size, n,
-						    start, end, mode)) {
-				pr_err("%s insert failed, size %llu, step %d [%d, %d], range [%llx, %llx]\n",
-				       mode->name, size, n,
-				       start_n, end_n,
-				       start, end);
-				goto out;
-			}
-		}
+	for (n = start_n; n <= end_n; n++)
+		KUNIT_EXPECT_TRUE_MSG(test,
+				      check_insert_in_range(test, mm, &nodes[n],
+							    size, size, n, start, end, mode),
+				      "insert failed, size %llu, step %d [%d, %d], range [%#llx, %#llx]",
+				      size, n, start_n, end_n, start, end);
 
-		if (!assert_contiguous_in_range(&mm, size, start, end)) {
-			pr_err("%s: range [%llx, %llx] not full after initialisation, size=%llu\n",
-			       mode->name, start, end, size);
-			goto out;
-		}
 
-		/* Remove one and reinsert, it should refill itself */
-		for (n = start_n; n <= end_n; n++) {
-			u64 addr = nodes[n].start;
+	KUNIT_EXPECT_TRUE_MSG(test, check_contiguous_in_range(test, mm, size, start, end),
+			      "range [%#llx, %#llx] not full after initialisation, size=%llu",
+			      start, end, size);
 
-			drm_mm_remove_node(&nodes[n]);
-			if (!expect_insert_in_range(&mm, &nodes[n],
-						    size, size, n,
-						    start, end, mode)) {
-				pr_err("%s reinsert failed, step %d\n", mode->name, n);
-				goto out;
-			}
+	/* Remove one and reinsert, it should refill itself */
+	for (n = start_n; n <= end_n; n++) {
+		u64 addr = nodes[n].start;
 
-			if (nodes[n].start != addr) {
-				pr_err("%s reinsert node moved, step %d, expected %llx, found %llx\n",
-				       mode->name, n, addr, nodes[n].start);
-				goto out;
-			}
-		}
+		drm_mm_remove_node(&nodes[n]);
+		KUNIT_EXPECT_TRUE_MSG(test,
+				      check_insert_in_range(test, mm, &nodes[n],
+							    size, size, n, start, end, mode),
+				      "reinsert failed, step %d", n);
 
-		if (!assert_contiguous_in_range(&mm, size, start, end)) {
-			pr_err("%s: range [%llx, %llx] not full after reinsertion, size=%llu\n",
-			       mode->name, start, end, size);
-			goto out;
-		}
-
-		drm_mm_for_each_node_safe(node, next, &mm)
-			drm_mm_remove_node(node);
-		DRM_MM_BUG_ON(!drm_mm_clean(&mm));
-
-		cond_resched();
+		KUNIT_EXPECT_EQ_MSG(test, nodes[n].start, addr,
+				    "reinsert node moved, step %d, expected %#llx, found %#llx",
+				    n, addr, nodes[n].start);
 	}
 
-	ret = 0;
-out:
-	drm_mm_for_each_node_safe(node, next, &mm)
+	KUNIT_EXPECT_TRUE_MSG(test, check_contiguous_in_range(test, mm, size, start, end),
+			      "range [%#llx, %#llx] not full after reinsertion, size=%llu",
+			      start, end, size);
+
+	drm_mm_for_each_node_safe(node, next, mm)
 		drm_mm_remove_node(node);
-	drm_mm_takedown(&mm);
-	vfree(nodes);
-err:
-	return ret;
+	KUNIT_ASSERT_TRUE(test, drm_mm_clean(mm));
 }
 
-static int insert_outside_range(void)
+#define IGT_INSERT_RANGE_MAX_PRIME 50
+static const void *insert_range_gen_params(const void *prev, char *desc)
 {
-	struct drm_mm mm;
-	const unsigned int start = 1024;
-	const unsigned int end = 2048;
-	const unsigned int size = end - start;
-
-	drm_mm_init(&mm, start, size);
+	unsigned long param = (unsigned long)prev;
 
-	if (!expect_insert_in_range_fail(&mm, 1, 0, start))
-		return -EINVAL;
+	if (!prev)
+		kunit_drm_mm_print_params();
 
-	if (!expect_insert_in_range_fail(&mm, size,
-					 start - size/2, start + (size+1)/2))
-		return -EINVAL;
+	param = mode_prime_ops_gen_param(param,
+					 ARRAY_SIZE(insert_modes),
+					 IGT_INSERT_RANGE_MAX_PRIME,
+					 ARRAY_SIZE(insert_range_tests));
 
-	if (!expect_insert_in_range_fail(&mm, size,
-					 end - (size+1)/2, end + size/2))
-		return -EINVAL;
+	if (param_valid(param)) {
+		const struct insert_range_test t = param_to_insert_range_test(param);
 
-	if (!expect_insert_in_range_fail(&mm, 1, end, end + size))
-		return -EINVAL;
+		sprintf(desc, "count = %d, size = %llu, start = %#llx, end = %#llx %s",
+			t.count, t.size, t.start, t.end, t.mode->name);
+	}
 
-	drm_mm_takedown(&mm);
-	return 0;
+	return (void *)param;
 }
 
-static int igt_insert_range(void *ignored)
+static void test_insert_outside_range(struct kunit *test)
 {
-	const unsigned int count = min_t(unsigned int, BIT(13), max_iterations);
-	unsigned int n;
-	int ret;
-
-	/* Check that requests outside the bounds of drm_mm are rejected. */
-	ret = insert_outside_range();
-	if (ret)
-		return ret;
-
-	for_each_prime_number_from(n, 1, 50) {
-		const u64 size = BIT_ULL(n);
-		const u64 max = count * size;
-
-		ret = __igt_insert_range(count, size, 0, max);
-		if (ret)
-			return ret;
+	struct drm_mm mm;
+	const unsigned int start = 1024;
+	const unsigned int end = 2048;
+	const unsigned int size = end - start;
 
-		ret = __igt_insert_range(count, size, 1, max);
-		if (ret)
-			return ret;
+	drm_mm_init(&mm, start, size);
 
-		ret = __igt_insert_range(count, size, 0, max - 1);
-		if (ret)
-			return ret;
+	/* Check that requests outside the bounds of drm_mm are rejected. */
 
-		ret = __igt_insert_range(count, size, 0, max/2);
-		if (ret)
-			return ret;
+	KUNIT_EXPECT_TRUE(test, check_insert_in_range_fail(test, &mm, 1, 0, start));
 
-		ret = __igt_insert_range(count, size, max/2, max);
-		if (ret)
-			return ret;
+	KUNIT_EXPECT_TRUE(test, check_insert_in_range_fail(test, &mm, size,
+							   start - size / 2,
+							   start + (size + 1) / 2));
 
-		ret = __igt_insert_range(count, size, max/4+1, 3*max/4-1);
-		if (ret)
-			return ret;
+	KUNIT_EXPECT_TRUE(test, check_insert_in_range_fail(test, &mm, size,
+							   end - (size + 1) / 2,
+							   end + size / 2));
 
-		cond_resched();
-	}
+	KUNIT_EXPECT_TRUE(test, check_insert_in_range_fail(test, &mm, 1, end, end + size));
 
-	return 0;
+	drm_mm_takedown(&mm);
 }
 
-static int prepare_igt_frag(struct drm_mm *mm,
-			    struct drm_mm_node *nodes,
-			    unsigned int num_insert,
-			    const struct insert_mode *mode)
+static void prepare_test_frag(struct kunit *test,
+			      struct drm_mm *mm,
+			      struct drm_mm_node *nodes,
+			      unsigned int num_insert,
+			      const struct insert_mode *mode)
 {
 	unsigned int size = 4096;
 	unsigned int i;
 
-	for (i = 0; i < num_insert; i++) {
-		if (!expect_insert(mm, &nodes[i], size, 0, i,
-				   mode) != 0) {
-			pr_err("%s insert failed\n", mode->name);
-			return -EINVAL;
-		}
-	}
+	for (i = 0; i < num_insert; i++)
+		KUNIT_ASSERT_TRUE(test, check_insert(test, mm, &nodes[i], size, 0, i, mode));
 
 	/* introduce fragmentation by freeing every other node */
 	for (i = 0; i < num_insert; i++) {
@@ -1056,11 +1237,10 @@ static int prepare_igt_frag(struct drm_mm *mm,
 			drm_mm_remove_node(&nodes[i]);
 	}
 
-	return 0;
-
 }
 
-static u64 get_insert_time(struct drm_mm *mm,
+static u64 get_insert_time(struct kunit *test,
+			   struct drm_mm *mm,
 			   unsigned int num_insert,
 			   struct drm_mm_node *nodes,
 			   const struct insert_mode *mode)
@@ -1070,201 +1250,193 @@ static u64 get_insert_time(struct drm_mm *mm,
 	unsigned int i;
 
 	start = ktime_get();
-	for (i = 0; i < num_insert; i++) {
-		if (!expect_insert(mm, &nodes[i], size, 0, i, mode) != 0) {
-			pr_err("%s insert failed\n", mode->name);
-			return 0;
-		}
-	}
+	for (i = 0; i < num_insert; i++)
+		KUNIT_ASSERT_TRUE(test, check_insert(test, mm, &nodes[i], size, 0, i, mode));
 
 	return ktime_to_ns(ktime_sub(ktime_get(), start));
 }
 
-static int igt_frag(void *ignored)
-{
-	struct drm_mm mm;
+struct frag_test {
 	const struct insert_mode *mode;
-	struct drm_mm_node *nodes, *node, *next;
+};
+
+static const struct frag_test param_to_frag_test(const unsigned long param)
+{
+	unsigned int mode = FIELD_GET(DRM_MM_MODE_MASK, param);
+
+	return (const struct frag_test) { .mode = &insert_modes[mode] };
+}
+
+static void test_frag(struct kunit *test)
+{
+	const struct frag_test t = param_to_frag_test((unsigned long)test->param_value);
+	const struct insert_mode *mode = t.mode;
 	unsigned int insert_size = 10000;
 	unsigned int scale_factor = 4;
-	int ret = -EINVAL;
+	struct drm_mm_node *nodes;
+	struct drm_mm *mm;
+	u64 insert_time1, insert_time2;
 
 	/* We need 4 * insert_size nodes to hold intermediate allocated
 	 * drm_mm nodes.
-	 * 1 times for prepare_igt_frag()
+	 * 1 times for prepare_test_frag()
 	 * 1 times for get_insert_time()
 	 * 2 times for get_insert_time()
 	 */
-	nodes = vzalloc(array_size(insert_size * 4, sizeof(*nodes)));
-	if (!nodes)
-		return -ENOMEM;
+	nodes = kunit_vzalloc(test, array_size(insert_size * 4, sizeof(*nodes)));
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, nodes);
 
 	/* For BOTTOMUP and TOPDOWN, we first fragment the
-	 * address space using prepare_igt_frag() and then try to verify
+	 * address space using prepare_test_frag() and then try to verify
 	 * that that insertions scale quadratically from 10k to 20k insertions
 	 */
-	drm_mm_init(&mm, 1, U64_MAX - 2);
-	for (mode = insert_modes; mode->name; mode++) {
-		u64 insert_time1, insert_time2;
-
-		if (mode->mode != DRM_MM_INSERT_LOW &&
-		    mode->mode != DRM_MM_INSERT_HIGH)
-			continue;
-
-		ret = prepare_igt_frag(&mm, nodes, insert_size, mode);
-		if (ret)
-			goto err;
-
-		insert_time1 = get_insert_time(&mm, insert_size,
-					       nodes + insert_size, mode);
-		if (insert_time1 == 0)
-			goto err;
-
-		insert_time2 = get_insert_time(&mm, (insert_size * 2),
-					       nodes + insert_size * 2, mode);
-		if (insert_time2 == 0)
-			goto err;
-
-		pr_info("%s fragmented insert of %u and %u insertions took %llu and %llu nsecs\n",
-			mode->name, insert_size, insert_size * 2,
-			insert_time1, insert_time2);
-
-		if (insert_time2 > (scale_factor * insert_time1)) {
-			pr_err("%s fragmented insert took %llu nsecs more\n",
-			       mode->name,
-			       insert_time2 - (scale_factor * insert_time1));
-			goto err;
-		}
+	mm = kunit_drm_mm(test, 1, U64_MAX - 2);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, mm);
 
-		drm_mm_for_each_node_safe(node, next, &mm)
-			drm_mm_remove_node(node);
-	}
+	prepare_test_frag(test, mm, nodes, insert_size, mode);
 
-	ret = 0;
-err:
-	drm_mm_for_each_node_safe(node, next, &mm)
-		drm_mm_remove_node(node);
-	drm_mm_takedown(&mm);
-	vfree(nodes);
+	insert_time1 = get_insert_time(test, mm, insert_size,
+				       nodes + insert_size, mode);
+	KUNIT_EXPECT_NE(test, insert_time1, 0);
+
+	insert_time2 = get_insert_time(test, mm, (insert_size * 2),
+				       nodes + insert_size * 2, mode);
+	KUNIT_EXPECT_NE(test, insert_time2, 0);
 
-	return ret;
+	kunit_info(test, "fragmented insert of %u and %u insertions took %llu and %llu nsecs\n",
+		   insert_size, insert_size * 2, insert_time1, insert_time2);
+
+	KUNIT_EXPECT_LE_MSG(test, insert_time2, scale_factor * insert_time1,
+			    "fragmented insert took %llu nsecs more",
+			    insert_time2 - (scale_factor * insert_time1));
 }
 
-static int igt_align(void *ignored)
+static const void *frag_gen_params(const void *prev, char *desc)
 {
+	unsigned long param = (unsigned long)prev;
+	struct frag_test t;
+
+	param = mode_gen_param(param, ARRAY_SIZE(insert_modes));
+	while (param_valid(param)) {
+		t = param_to_frag_test(param);
+		if (t.mode->mode != DRM_MM_INSERT_LOW && t.mode->mode != DRM_MM_INSERT_HIGH)
+			param = mode_gen_param(param, ARRAY_SIZE(insert_modes));
+		else
+			break;
+	}
+
+	if (param_valid(param))
+		sprintf(desc, "%s", param_to_frag_test(param).mode->name);
+
+	return (void *)param;
+}
+
+struct align_test {
 	const struct insert_mode *mode;
+};
+
+static const struct align_test param_to_align_test(const unsigned long param)
+{
+	unsigned int mode = FIELD_GET(DRM_MM_MODE_MASK, param);
+
+	return (const struct align_test) { .mode = &insert_modes[mode] };
+}
+
+static void test_align(struct kunit *test)
+{
+	const struct align_test t = param_to_align_test((unsigned long)test->param_value);
+	const struct insert_mode *mode = t.mode;
 	const unsigned int max_count = min(8192u, max_prime);
-	struct drm_mm mm;
-	struct drm_mm_node *nodes, *node, *next;
+	unsigned int i = 0;
+	struct drm_mm_node *nodes;
 	unsigned int prime;
-	int ret = -EINVAL;
+	struct drm_mm *mm;
 
 	/* For each of the possible insertion modes, we pick a few
 	 * arbitrary alignments and check that the inserted node
 	 * meets our requirements.
 	 */
 
-	nodes = vzalloc(array_size(max_count, sizeof(*nodes)));
-	if (!nodes)
-		goto err;
+	nodes = kunit_vzalloc(test, array_size(max_count, sizeof(*nodes)));
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, nodes);
 
-	drm_mm_init(&mm, 1, U64_MAX - 2);
+	mm = kunit_drm_mm(test, 1, U64_MAX - 2);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, mm);
 
-	for (mode = insert_modes; mode->name; mode++) {
-		unsigned int i = 0;
+	for_each_prime_number_from(prime, 1, max_count) {
+		u64 size = next_prime_number(prime);
 
-		for_each_prime_number_from(prime, 1, max_count) {
-			u64 size = next_prime_number(prime);
+		KUNIT_EXPECT_TRUE_MSG(test, check_insert(test, mm, &nodes[i], size, prime, i, mode),
+				      "insert failed with alignment=%d", prime);
 
-			if (!expect_insert(&mm, &nodes[i],
-					   size, prime, i,
-					   mode)) {
-				pr_err("%s insert failed with alignment=%d",
-				       mode->name, prime);
-				goto out;
-			}
+		i++;
+	}
+}
 
-			i++;
-		}
+static const void *align_gen_params(const void *prev, char *desc)
+{
+	unsigned long param = (unsigned long)prev;
 
-		drm_mm_for_each_node_safe(node, next, &mm)
-			drm_mm_remove_node(node);
-		DRM_MM_BUG_ON(!drm_mm_clean(&mm));
+	param = mode_gen_param(param, ARRAY_SIZE(insert_modes));
 
-		cond_resched();
-	}
+	if (param_valid(param))
+		sprintf(desc, "%s", param_to_align_test(param).mode->name);
 
-	ret = 0;
-out:
-	drm_mm_for_each_node_safe(node, next, &mm)
-		drm_mm_remove_node(node);
-	drm_mm_takedown(&mm);
-	vfree(nodes);
-err:
-	return ret;
+	return (void *)param;
 }
 
-static int igt_align_pot(int max)
+struct align_pot_test {
+	const unsigned int max;
+};
+
+static const struct align_pot_test align_pot_tests[] = {
+	{ .max = 32 },
+	{ .max = 64 },
+};
+
+static void test_align_pot(struct kunit *test)
 {
-	struct drm_mm mm;
-	struct drm_mm_node *node, *next;
+	const struct align_pot_test *t = test->param_value;
+	unsigned int max = t->max;
+	struct drm_mm *mm;
+	struct drm_mm_node *nodes;
 	int bit;
-	int ret = -EINVAL;
 
 	/* Check that we can align to the full u64 address space */
 
-	drm_mm_init(&mm, 1, U64_MAX - 2);
+	nodes = kunit_kzalloc(test, array_size(max, sizeof(*nodes)), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, nodes);
+
+	mm = kunit_drm_mm(test, 1, U64_MAX - 2);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, mm);
 
 	for (bit = max - 1; bit; bit--) {
 		u64 align, size;
 
-		node = kzalloc(sizeof(*node), GFP_KERNEL);
-		if (!node) {
-			ret = -ENOMEM;
-			goto out;
-		}
-
 		align = BIT_ULL(bit);
 		size = BIT_ULL(bit-1) + 1;
-		if (!expect_insert(&mm, node,
-				   size, align, bit,
-				   &insert_modes[0])) {
-			pr_err("insert failed with alignment=%llx [%d]",
-			       align, bit);
-			goto out;
-		}
-
-		cond_resched();
-	}
-
-	ret = 0;
-out:
-	drm_mm_for_each_node_safe(node, next, &mm) {
-		drm_mm_remove_node(node);
-		kfree(node);
+		KUNIT_EXPECT_TRUE_MSG(test,
+				      check_insert(test, mm, &nodes[bit],
+						   size, align, bit, &insert_modes[0]),
+				      "insert failed with alignment=%#llx [%d]", align, bit);
 	}
-	drm_mm_takedown(&mm);
-	return ret;
 }
 
-static int igt_align32(void *ignored)
+static void align_pot_desc(const struct align_pot_test *t, char *desc)
 {
-	return igt_align_pot(32);
+	sprintf(desc, "%d", t->max);
 }
 
-static int igt_align64(void *ignored)
-{
-	return igt_align_pot(64);
-}
+KUNIT_ARRAY_PARAM(align_pot, align_pot_tests, align_pot_desc);
 
-static void show_scan(const struct drm_mm_scan *scan)
+static void show_scan(struct kunit *test, const struct drm_mm_scan *scan)
 {
-	pr_info("scan: hit [%llx, %llx], size=%lld, align=%lld, color=%ld\n",
-		scan->hit_start, scan->hit_end,
-		scan->size, scan->alignment, scan->color);
+	kunit_info(test, "scan: hit [%#llx, %#llx], size=%lld, align=%lld, color=%ld\n",
+		   scan->hit_start, scan->hit_end,
+		   scan->size, scan->alignment, scan->color);
 }
 
-static void show_holes(const struct drm_mm *mm, int count)
+static void show_holes(struct kunit *test, const struct drm_mm *mm, int count)
 {
 	u64 hole_start, hole_end;
 	struct drm_mm_node *hole;
@@ -1275,15 +1447,15 @@ static void show_holes(const struct drm_mm *mm, int count)
 
 		if (drm_mm_node_allocated(hole))
 			node1 = kasprintf(GFP_KERNEL,
-					  "[%llx + %lld, color=%ld], ",
+					  "[%#llx + %lld, color=%ld], ",
 					  hole->start, hole->size, hole->color);
 
 		if (drm_mm_node_allocated(next))
 			node2 = kasprintf(GFP_KERNEL,
-					  ", [%llx + %lld, color=%ld]",
+					  ", [%#llx + %lld, color=%ld]",
 					  next->start, next->size, next->color);
 
-		pr_info("%sHole [%llx - %llx, size %lld]%s\n",
+		pr_info("%sHole [%#llx - %#llx, size %lld]%s\n",
 			node1,
 			hole_start, hole_end, hole_end - hole_start,
 			node2);
@@ -1296,897 +1468,749 @@ static void show_holes(const struct drm_mm *mm, int count)
 	}
 }
 
-struct evict_node {
-	struct drm_mm_node node;
-	struct list_head link;
-};
+static unsigned int node_index(const struct drm_mm_node *node)
+{
+	return div64_u64(node->start, node->size);
+}
 
-static bool evict_nodes(struct drm_mm_scan *scan,
-			struct evict_node *nodes,
-			unsigned int *order,
-			unsigned int count,
-			bool use_color,
-			struct list_head *evict_list)
+static void test_topdown(struct kunit *test)
 {
-	struct evict_node *e, *en;
-	unsigned int i;
+	const unsigned long size = (unsigned long)test->param_value;
+	const struct insert_mode *topdown = &insert_modes[TOPDOWN];
+	const unsigned int count = 8192;
+	unsigned long *bitmap;
+	struct drm_mm *mm;
+	struct drm_mm_node *nodes, *node;
+	unsigned int *order, n, m, o = 0;
 
-	for (i = 0; i < count; i++) {
-		e = &nodes[order ? order[i] : i];
-		list_add(&e->link, evict_list);
-		if (drm_mm_scan_add_block(scan, &e->node))
-			break;
-	}
-	list_for_each_entry_safe(e, en, evict_list, link) {
-		if (!drm_mm_scan_remove_block(scan, &e->node))
-			list_del(&e->link);
-	}
-	if (list_empty(evict_list)) {
-		pr_err("Failed to find eviction: size=%lld [avail=%d], align=%lld (color=%lu)\n",
-		       scan->size, count, scan->alignment, scan->color);
-		return false;
-	}
+	DRM_RND_STATE(prng, random_seed);
 
-	list_for_each_entry(e, evict_list, link)
-		drm_mm_remove_node(&e->node);
+	/* When allocating top-down, we expect to be returned a node
+	 * from a suitable hole at the top of the drm_mm. We check that
+	 * the returned node does match the highest available slot.
+	 */
 
-	if (use_color) {
-		struct drm_mm_node *node;
+	nodes = kunit_vzalloc(test, array_size(count, sizeof(*nodes)));
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, nodes);
 
-		while ((node = drm_mm_scan_color_evict(scan))) {
-			e = container_of(node, typeof(*e), node);
-			drm_mm_remove_node(&e->node);
-			list_add(&e->link, evict_list);
-		}
-	} else {
-		if (drm_mm_scan_color_evict(scan)) {
-			pr_err("drm_mm_scan_color_evict unexpectedly reported overlapping nodes!\n");
-			return false;
-		}
-	}
+	bitmap = kunit_bitmap_zalloc(test, count, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, bitmap);
 
-	return true;
-}
+	order = kunit_drm_random_order(test, count, &prng);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, order);
 
-static bool evict_nothing(struct drm_mm *mm,
-			  unsigned int total_size,
-			  struct evict_node *nodes)
-{
-	struct drm_mm_scan scan;
-	LIST_HEAD(evict_list);
-	struct evict_node *e;
-	struct drm_mm_node *node;
-	unsigned int n;
+	mm = kunit_drm_mm(test, 0, size * count);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, mm);
 
-	drm_mm_scan_init(&scan, mm, 1, 0, 0, 0);
-	for (n = 0; n < total_size; n++) {
-		e = &nodes[n];
-		list_add(&e->link, &evict_list);
-		drm_mm_scan_add_block(&scan, &e->node);
+	for (n = 0; n < count; n++) {
+		KUNIT_ASSERT_TRUE_MSG(test, check_insert(test, mm, &nodes[n], size, 0, n, topdown),
+				      "insert failed, size %u step %d", size, n);
+
+		KUNIT_EXPECT_FALSE_MSG(test, drm_mm_hole_follows(&nodes[n]),
+				       "hole after topdown insert %d, start=%#llx, size=%u",
+				       n, nodes[n].start, size);
+		KUNIT_EXPECT_TRUE(test, has_one_hole(test, mm, 0, size * (count - n - 1)));
 	}
-	list_for_each_entry(e, &evict_list, link)
-		drm_mm_scan_remove_block(&scan, &e->node);
 
-	for (n = 0; n < total_size; n++) {
-		e = &nodes[n];
+	KUNIT_EXPECT_TRUE(test,	is_continuous(test, mm, size));
 
-		if (!drm_mm_node_allocated(&e->node)) {
-			pr_err("node[%d] no longer allocated!\n", n);
-			return false;
+	drm_random_reorder(order, count, &prng);
+
+	for_each_prime_number_from(n, 1, min(count, max_prime)) {
+		for (m = 0; m < n; m++) {
+			node = &nodes[order[(o + m) % count]];
+			drm_mm_remove_node(node);
+			__set_bit(node_index(node), bitmap);
 		}
 
-		e->link.next = NULL;
-	}
+		for (m = 0; m < n; m++) {
+			unsigned int last;
 
-	drm_mm_for_each_node(node, mm) {
-		e = container_of(node, typeof(*e), node);
-		e->link.next = &e->link;
-	}
+			node = &nodes[order[(o + m) % count]];
+			KUNIT_ASSERT_TRUE_MSG(test,
+					      check_insert(test, mm, node, size, 0, 0, topdown),
+					      "insert failed, step %d/%d", m, n);
 
-	for (n = 0; n < total_size; n++) {
-		e = &nodes[n];
+			KUNIT_EXPECT_FALSE_MSG(test, drm_mm_hole_follows(node),
+					       "hole after topdown insert %d/%d, start=%#llx",
+					       m, n, node->start);
 
-		if (!e->link.next) {
-			pr_err("node[%d] no longer connected!\n", n);
-			return false;
+			last = find_last_bit(bitmap, count);
+			KUNIT_EXPECT_EQ_MSG(test, node_index(node), last,
+					    "node %d/%d, size %d, not inserted into upmost hole, expected %d, found %d",
+					    m, n, size, last, node_index(node));
+			__clear_bit(last, bitmap);
 		}
-	}
 
-	return assert_continuous(mm, nodes[0].node.size);
+		KUNIT_ASSERT_EQ(test, find_first_bit(bitmap, count), count);
+
+		o += n;
+	}
 }
 
-static bool evict_everything(struct drm_mm *mm,
-			     unsigned int total_size,
-			     struct evict_node *nodes)
+static void test_bottomup(struct kunit *test)
 {
-	struct drm_mm_scan scan;
-	LIST_HEAD(evict_list);
-	struct evict_node *e;
-	unsigned int n;
-	int err;
+	const unsigned long size = (unsigned long)test->param_value;
+	const struct insert_mode *bottomup = &insert_modes[BOTTOMUP];
+	const unsigned int count = 8192;
+	unsigned long *bitmap;
+	struct drm_mm *mm;
+	struct drm_mm_node *nodes, *node;
+	unsigned int *order, n, m, o = 0;
 
-	drm_mm_scan_init(&scan, mm, total_size, 0, 0, 0);
-	for (n = 0; n < total_size; n++) {
-		e = &nodes[n];
-		list_add(&e->link, &evict_list);
-		if (drm_mm_scan_add_block(&scan, &e->node))
-			break;
+	DRM_RND_STATE(prng, random_seed);
+
+	/* Like test_topdown, but instead of searching for the last hole,
+	 * we search for the first.
+	 */
+
+	nodes = kunit_vzalloc(test, array_size(count, sizeof(*nodes)));
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, nodes);
+
+	bitmap = kunit_bitmap_zalloc(test, count, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, bitmap);
+
+	order = kunit_drm_random_order(test, count, &prng);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, order);
+
+	mm = kunit_drm_mm(test, 0, size * count);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, mm);
+
+	for (n = 0; n < count; n++) {
+		KUNIT_ASSERT_TRUE_MSG(test, check_insert(test, mm, &nodes[n], size, 0, n, bottomup),
+				      "bottomup insert failed, size %u step %d", size, n);
+
+		KUNIT_EXPECT_TRUE(test, has_one_hole(test, mm, size * (n + 1), size * count));
 	}
 
-	err = 0;
-	list_for_each_entry(e, &evict_list, link) {
-		if (!drm_mm_scan_remove_block(&scan, &e->node)) {
-			if (!err) {
-				pr_err("Node %lld not marked for eviction!\n",
-				       e->node.start);
-				err = -EINVAL;
-			}
+	KUNIT_EXPECT_TRUE(test,	is_continuous(test, mm, size));
+
+	drm_random_reorder(order, count, &prng);
+	for_each_prime_number_from(n, 1, min(count, max_prime)) {
+		for (m = 0; m < n; m++) {
+			node = &nodes[order[(o + m) % count]];
+			drm_mm_remove_node(node);
+			__set_bit(node_index(node), bitmap);
 		}
-	}
-	if (err)
-		return false;
 
-	list_for_each_entry(e, &evict_list, link)
-		drm_mm_remove_node(&e->node);
+		for (m = 0; m < n; m++) {
+			unsigned int first;
 
-	if (!assert_one_hole(mm, 0, total_size))
-		return false;
+			node = &nodes[order[(o + m) % count]];
+			KUNIT_ASSERT_TRUE_MSG(test,
+					      check_insert(test, mm, node, size, 0, 0, bottomup),
+					      "insert failed, step %d/%d", m, n);
 
-	list_for_each_entry(e, &evict_list, link) {
-		err = drm_mm_reserve_node(mm, &e->node);
-		if (err) {
-			pr_err("Failed to reinsert node after eviction: start=%llx\n",
-			       e->node.start);
-			return false;
+			first = find_first_bit(bitmap, count);
+			KUNIT_EXPECT_EQ_MSG(test, node_index(node), first,
+					    "node %d/%d not inserted into bottom hole, expected %d, found %d",
+					    m, n, first, node_index(node));
+			__clear_bit(first, bitmap);
 		}
+
+		KUNIT_ASSERT_EQ(test, find_first_bit(bitmap, count), count);
+
+		o += n;
 	}
+}
+
+static const void *topdown_bottomup_gen_params(const void *prev, char *desc)
+{
+	unsigned long param = (unsigned long)prev;
+
+	if (param == 0)
+		param = 1;
+	else if (param <= 64)
+		param <<= 1;
+	else
+		param = 0;
+
+	sprintf(desc, "size = %ld", param);
 
-	return assert_continuous(mm, nodes[0].node.size);
+	return (void *)param;
 }
 
-static int evict_something(struct drm_mm *mm,
-			   u64 range_start, u64 range_end,
-			   struct evict_node *nodes,
-			   unsigned int *order,
-			   unsigned int count,
-			   unsigned int size,
-			   unsigned int alignment,
-			   const struct insert_mode *mode)
+static void __once(struct kunit *test, unsigned int mode)
 {
-	struct drm_mm_scan scan;
-	LIST_HEAD(evict_list);
-	struct evict_node *e;
-	struct drm_mm_node tmp;
+	struct drm_mm *mm;
+	struct drm_mm_node *nodes, *rsvd_lo, *rsvd_hi, *node;
 	int err;
 
-	drm_mm_scan_init_with_range(&scan, mm,
-				    size, alignment, 0,
-				    range_start, range_end,
-				    mode->mode);
-	if (!evict_nodes(&scan,
-			 nodes, order, count, false,
-			 &evict_list))
-		return -EINVAL;
+	nodes = kunit_kzalloc(test, array_size(3, sizeof(*nodes)), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, nodes);
 
-	memset(&tmp, 0, sizeof(tmp));
-	err = drm_mm_insert_node_generic(mm, &tmp, size, alignment, 0,
-					 DRM_MM_INSERT_EVICT);
-	if (err) {
-		pr_err("Failed to insert into eviction hole: size=%d, align=%d\n",
-		       size, alignment);
-		show_scan(&scan);
-		show_holes(mm, 3);
-		return err;
-	}
+	mm = kunit_drm_mm(test, 0, 7);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, mm);
 
-	if (tmp.start < range_start || tmp.start + tmp.size > range_end) {
-		pr_err("Inserted [address=%llu + %llu] did not fit into the request range [%llu, %llu]\n",
-		       tmp.start, tmp.size, range_start, range_end);
-		err = -EINVAL;
-	}
+	rsvd_lo = &nodes[0];
+	rsvd_hi = &nodes[1];
+	node = &nodes[2];
 
-	if (!assert_node(&tmp, mm, size, alignment, 0) ||
-	    drm_mm_hole_follows(&tmp)) {
-		pr_err("Inserted did not fill the eviction hole: size=%lld [%d], align=%d [rem=%lld], start=%llx, hole-follows?=%d\n",
-		       tmp.size, size,
-		       alignment, misalignment(&tmp, alignment),
-		       tmp.start, drm_mm_hole_follows(&tmp));
-		err = -EINVAL;
-	}
+	rsvd_lo->start = 1;
+	rsvd_lo->size = 1;
+	err = drm_mm_reserve_node(mm, rsvd_lo);
+	KUNIT_ASSERT_EQ_MSG(test, err, 0, "Could not reserve low node");
 
-	drm_mm_remove_node(&tmp);
-	if (err)
-		return err;
+	rsvd_hi->start = 5;
+	rsvd_hi->size = 1;
+	err = drm_mm_reserve_node(mm, rsvd_hi);
+	KUNIT_ASSERT_EQ_MSG(test, err, 0, "Could not reserve high node");
 
-	list_for_each_entry(e, &evict_list, link) {
-		err = drm_mm_reserve_node(mm, &e->node);
-		if (err) {
-			pr_err("Failed to reinsert node after eviction: start=%llx\n",
-			       e->node.start);
-			return err;
-		}
-	}
+	KUNIT_EXPECT_TRUE_MSG(test, drm_mm_hole_follows(rsvd_lo),
+			      "Expected a hole after low node");
+	KUNIT_EXPECT_TRUE_MSG(test, drm_mm_hole_follows(rsvd_hi),
+			      "Expected a hole after high node");
 
-	if (!assert_continuous(mm, nodes[0].node.size)) {
-		pr_err("range is no longer continuous\n");
-		return -EINVAL;
-	}
-
-	return 0;
+	err = drm_mm_insert_node_generic(mm, node, 2, 0, 0, mode);
+	KUNIT_ASSERT_EQ_MSG(test, err, 0, "Could not insert the node into the available hole!");
 }
 
-static int igt_evict(void *ignored)
+static void test_lowest(struct kunit *test)
 {
-	DRM_RND_STATE(prng, random_seed);
-	const unsigned int size = 8192;
-	const struct insert_mode *mode;
-	struct drm_mm mm;
-	struct evict_node *nodes;
-	struct drm_mm_node *node, *next;
-	unsigned int *order, n;
-	int ret, err;
+	__once(test, DRM_MM_INSERT_LOW);
+}
 
-	/* Here we populate a full drm_mm and then try and insert a new node
-	 * by evicting other nodes in a random order. The drm_mm_scan should
-	 * pick the first matching hole it finds from the random list. We
-	 * repeat that for different allocation strategies, alignments and
-	 * sizes to try and stress the hole finder.
-	 */
+static void test_highest(struct kunit *test)
+{
+	__once(test, DRM_MM_INSERT_HIGH);
+}
 
-	ret = -ENOMEM;
-	nodes = vzalloc(array_size(size, sizeof(*nodes)));
-	if (!nodes)
-		goto err;
+static void separate_adjacent_colors(const struct drm_mm_node *node,
+				     unsigned long color,
+				     u64 *start,
+				     u64 *end)
+{
+	if (drm_mm_node_allocated(node) && node->color != color)
+		++*start;
 
-	order = drm_random_order(size, &prng);
-	if (!order)
-		goto err_nodes;
+	node = list_next_entry(node, node_list);
+	if (drm_mm_node_allocated(node) && node->color != color)
+		--*end;
+}
 
-	ret = -EINVAL;
-	drm_mm_init(&mm, 0, size);
-	for (n = 0; n < size; n++) {
-		err = drm_mm_insert_node(&mm, &nodes[n].node, 1);
-		if (err) {
-			pr_err("insert failed, step %d\n", n);
-			ret = err;
-			goto out;
-		}
+static bool colors_abutt(struct kunit *test, const struct drm_mm_node *node)
+{
+	if (!drm_mm_hole_follows(node) &&
+	    drm_mm_node_allocated(list_next_entry(node, node_list))) {
+		kunit_err(test, "colors abutt; %ld [%#llx + %#llx] is next to %ld [%#llx + %#llx]!\n",
+			  node->color, node->start, node->size,
+			  list_next_entry(node, node_list)->color,
+			  list_next_entry(node, node_list)->start,
+			  list_next_entry(node, node_list)->size);
+		return true;
 	}
 
-	/* First check that using the scanner doesn't break the mm */
-	if (!evict_nothing(&mm, size, nodes)) {
-		pr_err("evict_nothing() failed\n");
-		goto out;
-	}
-	if (!evict_everything(&mm, size, nodes)) {
-		pr_err("evict_everything() failed\n");
-		goto out;
-	}
-
-	for (mode = evict_modes; mode->name; mode++) {
-		for (n = 1; n <= size; n <<= 1) {
-			drm_random_reorder(order, size, &prng);
-			err = evict_something(&mm, 0, U64_MAX,
-					      nodes, order, size,
-					      n, 1,
-					      mode);
-			if (err) {
-				pr_err("%s evict_something(size=%u) failed\n",
-				       mode->name, n);
-				ret = err;
-				goto out;
-			}
-		}
+	return false;
+}
 
-		for (n = 1; n < size; n <<= 1) {
-			drm_random_reorder(order, size, &prng);
-			err = evict_something(&mm, 0, U64_MAX,
-					      nodes, order, size,
-					      size/2, n,
-					      mode);
-			if (err) {
-				pr_err("%s evict_something(size=%u, alignment=%u) failed\n",
-				       mode->name, size/2, n);
-				ret = err;
-				goto out;
-			}
-		}
+static void test_color_sanity(struct kunit *test)
+{
+	const unsigned int count = min(4096u, max_iterations);
+	struct drm_mm_node *nodes, *node, *nn;
+	struct drm_mm *mm;
+	unsigned int n;
 
-		for_each_prime_number_from(n, 1, min(size, max_prime)) {
-			unsigned int nsize = (size - n + 1) / 2;
-
-			DRM_MM_BUG_ON(!nsize);
-
-			drm_random_reorder(order, size, &prng);
-			err = evict_something(&mm, 0, U64_MAX,
-					      nodes, order, size,
-					      nsize, n,
-					      mode);
-			if (err) {
-				pr_err("%s evict_something(size=%u, alignment=%u) failed\n",
-				       mode->name, nsize, n);
-				ret = err;
-				goto out;
-			}
-		}
+	nodes = kunit_vzalloc(test, array_size(count, sizeof(*nodes)));
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, nodes);
 
-		cond_resched();
-	}
+	mm = kunit_drm_mm(test, 0, U64_MAX);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, mm);
 
-	ret = 0;
-out:
-	drm_mm_for_each_node_safe(node, next, &mm)
-		drm_mm_remove_node(node);
-	drm_mm_takedown(&mm);
-	kfree(order);
-err_nodes:
-	vfree(nodes);
-err:
-	return ret;
+	for (n = 1; n <= count; n++)
+		KUNIT_ASSERT_TRUE_MSG(test,
+				      check_insert(test, mm, &nodes[n - 1],
+						   n, 0, n, &insert_modes[0]),
+				      "insert failed, step %d", n);
+
+	drm_mm_for_each_node_safe(node, nn, mm)
+		KUNIT_EXPECT_EQ_MSG(test, node->color, node->size,
+				    "invalid color stored: expected %lld, found %ld",
+				    node->size, node->color);
 }
 
-static int igt_evict_range(void *ignored)
-{
-	DRM_RND_STATE(prng, random_seed);
-	const unsigned int size = 8192;
-	const unsigned int range_size = size / 2;
-	const unsigned int range_start = size / 4;
-	const unsigned int range_end = range_start + range_size;
+struct color_test {
 	const struct insert_mode *mode;
-	struct drm_mm mm;
-	struct evict_node *nodes;
-	struct drm_mm_node *node, *next;
-	unsigned int *order, n;
-	int ret, err;
-
-	/* Like igt_evict() but now we are limiting the search to a
-	 * small portion of the full drm_mm.
-	 */
-
-	ret = -ENOMEM;
-	nodes = vzalloc(array_size(size, sizeof(*nodes)));
-	if (!nodes)
-		goto err;
-
-	order = drm_random_order(size, &prng);
-	if (!order)
-		goto err_nodes;
+};
 
-	ret = -EINVAL;
-	drm_mm_init(&mm, 0, size);
-	for (n = 0; n < size; n++) {
-		err = drm_mm_insert_node(&mm, &nodes[n].node, 1);
-		if (err) {
-			pr_err("insert failed, step %d\n", n);
-			ret = err;
-			goto out;
-		}
-	}
+static const struct color_test param_to_color_test(const unsigned long param)
+{
+	unsigned int mode = FIELD_GET(DRM_MM_MODE_MASK, param);
 
-	for (mode = evict_modes; mode->name; mode++) {
-		for (n = 1; n <= range_size; n <<= 1) {
-			drm_random_reorder(order, size, &prng);
-			err = evict_something(&mm, range_start, range_end,
-					      nodes, order, size,
-					      n, 1,
-					      mode);
-			if (err) {
-				pr_err("%s evict_something(size=%u) failed with range [%u, %u]\n",
-				       mode->name, n, range_start, range_end);
-				goto out;
-			}
-		}
+	return (const struct color_test) { .mode = &evict_modes[mode] };
+}
 
-		for (n = 1; n <= range_size; n <<= 1) {
-			drm_random_reorder(order, size, &prng);
-			err = evict_something(&mm, range_start, range_end,
-					      nodes, order, size,
-					      range_size/2, n,
-					      mode);
-			if (err) {
-				pr_err("%s evict_something(size=%u, alignment=%u) failed with range [%u, %u]\n",
-				       mode->name, range_size/2, n, range_start, range_end);
-				goto out;
-			}
-		}
+static void test_color(struct kunit *test)
+{
+	const struct color_test t = param_to_color_test((unsigned long)test->param_value);
+	const struct insert_mode *mode = t.mode;
+	const unsigned int count = min(4096u, max_iterations);
+	struct drm_mm_node *nodes, *node, *nn;
+	struct drm_mm *mm;
+	unsigned int n;
+	u64 last;
+	int err;
 
-		for_each_prime_number_from(n, 1, min(range_size, max_prime)) {
-			unsigned int nsize = (range_size - n + 1) / 2;
+	/* Color adjustment complicates everything. First we just check
+	 * that when we insert a node we apply any color_adjustment callback.
+	 * The callback we use should ensure that there is a gap between
+	 * any two nodes, and so after each insertion we check that those
+	 * holes are inserted and that they are preserved.
+	 */
 
-			DRM_MM_BUG_ON(!nsize);
+	nodes = kunit_vzalloc(test, array_size(count * 2, sizeof(*nodes)));
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, nodes);
 
-			drm_random_reorder(order, size, &prng);
-			err = evict_something(&mm, range_start, range_end,
-					      nodes, order, size,
-					      nsize, n,
-					      mode);
-			if (err) {
-				pr_err("%s evict_something(size=%u, alignment=%u) failed with range [%u, %u]\n",
-				       mode->name, nsize, n, range_start, range_end);
-				goto out;
-			}
-		}
+	node = kunit_kzalloc(test, sizeof(*node), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, node);
 
-		cond_resched();
-	}
+	mm = kunit_drm_mm(test, 0, U64_MAX);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, mm);
 
-	ret = 0;
-out:
-	drm_mm_for_each_node_safe(node, next, &mm)
-		drm_mm_remove_node(node);
-	drm_mm_takedown(&mm);
-	kfree(order);
-err_nodes:
-	vfree(nodes);
-err:
-	return ret;
-}
+	/* Now, let's start experimenting with applying a color callback */
+	mm->color_adjust = separate_adjacent_colors;
 
-static unsigned int node_index(const struct drm_mm_node *node)
-{
-	return div64_u64(node->start, node->size);
-}
+	node->size = 1 + 2 * count;
+	node->color = node->size;
 
-static int igt_topdown(void *ignored)
-{
-	const struct insert_mode *topdown = &insert_modes[TOPDOWN];
-	DRM_RND_STATE(prng, random_seed);
-	const unsigned int count = 8192;
-	unsigned int size;
-	unsigned long *bitmap;
-	struct drm_mm mm;
-	struct drm_mm_node *nodes, *node, *next;
-	unsigned int *order, n, m, o = 0;
-	int ret;
+	err = drm_mm_reserve_node(mm, node);
+	KUNIT_EXPECT_EQ_MSG(test, err, 0, "initial reserve failed!");
 
-	/* When allocating top-down, we expect to be returned a node
-	 * from a suitable hole at the top of the drm_mm. We check that
-	 * the returned node does match the highest available slot.
-	 */
+	last = node->start + node->size;
 
-	ret = -ENOMEM;
-	nodes = vzalloc(array_size(count, sizeof(*nodes)));
-	if (!nodes)
-		goto err;
-
-	bitmap = bitmap_zalloc(count, GFP_KERNEL);
-	if (!bitmap)
-		goto err_nodes;
-
-	order = drm_random_order(count, &prng);
-	if (!order)
-		goto err_bitmap;
-
-	ret = -EINVAL;
-	for (size = 1; size <= 64; size <<= 1) {
-		drm_mm_init(&mm, 0, size*count);
-		for (n = 0; n < count; n++) {
-			if (!expect_insert(&mm, &nodes[n],
-					   size, 0, n,
-					   topdown)) {
-				pr_err("insert failed, size %u step %d\n", size, n);
-				goto out;
-			}
+	for (n = 1; n <= count; n++) {
+		int rem;
 
-			if (drm_mm_hole_follows(&nodes[n])) {
-				pr_err("hole after topdown insert %d, start=%llx\n, size=%u",
-				       n, nodes[n].start, size);
-				goto out;
-			}
+		node = &nodes[n - 1];
 
-			if (!assert_one_hole(&mm, 0, size*(count - n - 1)))
-				goto out;
-		}
+		node->start = last;
+		node->size = n + count;
+		node->color = node->size;
 
-		if (!assert_continuous(&mm, size))
-			goto out;
+		err = drm_mm_reserve_node(mm, node);
+		KUNIT_ASSERT_EQ_MSG(test, err, -ENOSPC,
+				    "reserve %d did not report color overlap! err=%d", n, err);
 
-		drm_random_reorder(order, count, &prng);
-		for_each_prime_number_from(n, 1, min(count, max_prime)) {
-			for (m = 0; m < n; m++) {
-				node = &nodes[order[(o + m) % count]];
-				drm_mm_remove_node(node);
-				__set_bit(node_index(node), bitmap);
-			}
+		node->start += n + 1;
+		rem = misalignment(node, n + count);
+		node->start += n + count - rem;
 
-			for (m = 0; m < n; m++) {
-				unsigned int last;
+		err = drm_mm_reserve_node(mm, node);
+		KUNIT_ASSERT_EQ_MSG(test, err, 0, "reserve %d failed, err=%d", n, err);
 
-				node = &nodes[order[(o + m) % count]];
-				if (!expect_insert(&mm, node,
-						   size, 0, 0,
-						   topdown)) {
-					pr_err("insert failed, step %d/%d\n", m, n);
-					goto out;
-				}
+		last = node->start + node->size;
+	}
 
-				if (drm_mm_hole_follows(node)) {
-					pr_err("hole after topdown insert %d/%d, start=%llx\n",
-					       m, n, node->start);
-					goto out;
-				}
+	for (n = 1; n <= count; n++) {
+		node = &nodes[count + n - 1];
 
-				last = find_last_bit(bitmap, count);
-				if (node_index(node) != last) {
-					pr_err("node %d/%d, size %d, not inserted into upmost hole, expected %d, found %d\n",
-					       m, n, size, last, node_index(node));
-					goto out;
-				}
+		KUNIT_ASSERT_TRUE_MSG(test, check_insert(test, mm, node, n, n, n, mode),
+				      "insert failed, step %d", n);
+	}
 
-				__clear_bit(last, bitmap);
-			}
+	drm_mm_for_each_node_safe(node, nn, mm) {
+		u64 rem;
 
-			DRM_MM_BUG_ON(find_first_bit(bitmap, count) != count);
+		KUNIT_EXPECT_EQ_MSG(test, node->color, node->size,
+				    "invalid color stored: expected %lld, found %ld",
+				    node->size, node->color);
 
-			o += n;
-		}
+		KUNIT_EXPECT_FALSE(test, colors_abutt(test, node));
 
-		drm_mm_for_each_node_safe(node, next, &mm)
-			drm_mm_remove_node(node);
-		DRM_MM_BUG_ON(!drm_mm_clean(&mm));
-		cond_resched();
+		div64_u64_rem(node->start, node->size, &rem);
+		KUNIT_EXPECT_EQ_MSG(test, rem, 0,
+				    "colored node misaligned, start=%#llx expected alignment=%lld [rem=%lld]",
+				    node->start, node->size, rem);
 	}
-
-	ret = 0;
-out:
-	drm_mm_for_each_node_safe(node, next, &mm)
-		drm_mm_remove_node(node);
-	drm_mm_takedown(&mm);
-	kfree(order);
-err_bitmap:
-	bitmap_free(bitmap);
-err_nodes:
-	vfree(nodes);
-err:
-	return ret;
 }
 
-static int igt_bottomup(void *ignored)
+static const void *color_gen_params(const void *prev, char *desc)
 {
-	const struct insert_mode *bottomup = &insert_modes[BOTTOMUP];
-	DRM_RND_STATE(prng, random_seed);
-	const unsigned int count = 8192;
-	unsigned int size;
-	unsigned long *bitmap;
-	struct drm_mm mm;
-	struct drm_mm_node *nodes, *node, *next;
-	unsigned int *order, n, m, o = 0;
-	int ret;
+	unsigned long param = (unsigned long)prev;
 
-	/* Like igt_topdown, but instead of searching for the last hole,
-	 * we search for the first.
-	 */
+	param = mode_gen_param(param, ARRAY_SIZE(evict_modes));
+	if (param_valid(param))
+		sprintf(desc, "%s", param_to_color_test(param).mode->name);
 
-	ret = -ENOMEM;
-	nodes = vzalloc(array_size(count, sizeof(*nodes)));
-	if (!nodes)
-		goto err;
-
-	bitmap = bitmap_zalloc(count, GFP_KERNEL);
-	if (!bitmap)
-		goto err_nodes;
-
-	order = drm_random_order(count, &prng);
-	if (!order)
-		goto err_bitmap;
-
-	ret = -EINVAL;
-	for (size = 1; size <= 64; size <<= 1) {
-		drm_mm_init(&mm, 0, size*count);
-		for (n = 0; n < count; n++) {
-			if (!expect_insert(&mm, &nodes[n],
-					   size, 0, n,
-					   bottomup)) {
-				pr_err("bottomup insert failed, size %u step %d\n", size, n);
-				goto out;
-			}
+	return (void *)param;
+}
 
-			if (!assert_one_hole(&mm, size*(n + 1), size*count))
-				goto out;
-		}
+struct evict_node {
+	struct drm_mm_node node;
+	struct list_head link;
+};
 
-		if (!assert_continuous(&mm, size))
-			goto out;
+static bool evict_nodes(struct kunit *test,
+			struct drm_mm_scan *scan,
+			struct evict_node *nodes,
+			unsigned int *order,
+			unsigned int count,
+			bool use_color,
+			struct list_head *evict_list)
+{
+	struct evict_node *e, *en;
+	unsigned int i;
 
-		drm_random_reorder(order, count, &prng);
-		for_each_prime_number_from(n, 1, min(count, max_prime)) {
-			for (m = 0; m < n; m++) {
-				node = &nodes[order[(o + m) % count]];
-				drm_mm_remove_node(node);
-				__set_bit(node_index(node), bitmap);
-			}
+	for (i = 0; i < count; i++) {
+		e = &nodes[order ? order[i] : i];
+		list_add(&e->link, evict_list);
+		if (drm_mm_scan_add_block(scan, &e->node))
+			break;
+	}
+	list_for_each_entry_safe(e, en, evict_list, link) {
+		if (!drm_mm_scan_remove_block(scan, &e->node))
+			list_del(&e->link);
+	}
+	if (list_empty(evict_list)) {
+		kunit_err(test, "Failed to find eviction: size=%lld [avail=%d], align=%lld (color=%lu)\n",
+			  scan->size, count, scan->alignment, scan->color);
+		return false;
+	}
 
-			for (m = 0; m < n; m++) {
-				unsigned int first;
-
-				node = &nodes[order[(o + m) % count]];
-				if (!expect_insert(&mm, node,
-						   size, 0, 0,
-						   bottomup)) {
-					pr_err("insert failed, step %d/%d\n", m, n);
-					goto out;
-				}
-
-				first = find_first_bit(bitmap, count);
-				if (node_index(node) != first) {
-					pr_err("node %d/%d not inserted into bottom hole, expected %d, found %d\n",
-					       m, n, first, node_index(node));
-					goto out;
-				}
-				__clear_bit(first, bitmap);
-			}
+	list_for_each_entry(e, evict_list, link)
+		drm_mm_remove_node(&e->node);
 
-			DRM_MM_BUG_ON(find_first_bit(bitmap, count) != count);
+	if (use_color) {
+		struct drm_mm_node *node;
 
-			o += n;
+		while ((node = drm_mm_scan_color_evict(scan))) {
+			e = container_of(node, typeof(*e), node);
+			drm_mm_remove_node(&e->node);
+			list_add(&e->link, evict_list);
+		}
+	} else {
+		if (drm_mm_scan_color_evict(scan)) {
+			kunit_err(test, "drm_mm_scan_color_evict unexpectedly reported overlapping nodes!\n");
+			return false;
 		}
-
-		drm_mm_for_each_node_safe(node, next, &mm)
-			drm_mm_remove_node(node);
-		DRM_MM_BUG_ON(!drm_mm_clean(&mm));
-		cond_resched();
 	}
 
-	ret = 0;
-out:
-	drm_mm_for_each_node_safe(node, next, &mm)
-		drm_mm_remove_node(node);
-	drm_mm_takedown(&mm);
-	kfree(order);
-err_bitmap:
-	bitmap_free(bitmap);
-err_nodes:
-	vfree(nodes);
-err:
-	return ret;
+	return true;
 }
 
-static int __igt_once(unsigned int mode)
+static bool evict_nothing(struct kunit *test,
+			  struct drm_mm *mm,
+			  unsigned int total_size,
+			  struct evict_node *nodes)
 {
-	struct drm_mm mm;
-	struct drm_mm_node rsvd_lo, rsvd_hi, node;
-	int err;
-
-	drm_mm_init(&mm, 0, 7);
+	struct drm_mm_scan scan;
+	LIST_HEAD(evict_list);
+	struct evict_node *e;
+	struct drm_mm_node *node;
+	unsigned int n;
 
-	memset(&rsvd_lo, 0, sizeof(rsvd_lo));
-	rsvd_lo.start = 1;
-	rsvd_lo.size = 1;
-	err = drm_mm_reserve_node(&mm, &rsvd_lo);
-	if (err) {
-		pr_err("Could not reserve low node\n");
-		goto err;
+	drm_mm_scan_init(&scan, mm, 1, 0, 0, 0);
+	for (n = 0; n < total_size; n++) {
+		e = &nodes[n];
+		list_add(&e->link, &evict_list);
+		drm_mm_scan_add_block(&scan, &e->node);
 	}
+	list_for_each_entry(e, &evict_list, link)
+		drm_mm_scan_remove_block(&scan, &e->node);
 
-	memset(&rsvd_hi, 0, sizeof(rsvd_hi));
-	rsvd_hi.start = 5;
-	rsvd_hi.size = 1;
-	err = drm_mm_reserve_node(&mm, &rsvd_hi);
-	if (err) {
-		pr_err("Could not reserve low node\n");
-		goto err_lo;
+	for (n = 0; n < total_size; n++) {
+		e = &nodes[n];
+
+		if (!drm_mm_node_allocated(&e->node)) {
+			kunit_err(test, "node[%d] no longer allocated!\n", n);
+			return false;
+		}
+
+		e->link.next = NULL;
 	}
 
-	if (!drm_mm_hole_follows(&rsvd_lo) || !drm_mm_hole_follows(&rsvd_hi)) {
-		pr_err("Expected a hole after lo and high nodes!\n");
-		err = -EINVAL;
-		goto err_hi;
+	drm_mm_for_each_node(node, mm) {
+		e = container_of(node, typeof(*e), node);
+		e->link.next = &e->link;
 	}
 
-	memset(&node, 0, sizeof(node));
-	err = drm_mm_insert_node_generic(&mm, &node, 2, 0, 0, mode);
-	if (err) {
-		pr_err("Could not insert the node into the available hole!\n");
-		err = -EINVAL;
-		goto err_hi;
+	for (n = 0; n < total_size; n++) {
+		e = &nodes[n];
+
+		if (!e->link.next) {
+			kunit_err(test, "node[%d] no longer connected!\n", n);
+			return false;
+		}
 	}
 
-	drm_mm_remove_node(&node);
-err_hi:
-	drm_mm_remove_node(&rsvd_hi);
-err_lo:
-	drm_mm_remove_node(&rsvd_lo);
-err:
-	drm_mm_takedown(&mm);
-	return err;
+	return is_continuous(test, mm, nodes[0].node.size);
 }
 
-static int igt_lowest(void *ignored)
+static bool evict_everything(struct kunit *test,
+			     struct drm_mm *mm,
+			     unsigned int total_size,
+			     struct evict_node *nodes)
 {
-	return __igt_once(DRM_MM_INSERT_LOW);
-}
+	struct drm_mm_scan scan;
+	LIST_HEAD(evict_list);
+	struct evict_node *e;
+	unsigned int n;
+	int err;
 
-static int igt_highest(void *ignored)
-{
-	return __igt_once(DRM_MM_INSERT_HIGH);
-}
+	drm_mm_scan_init(&scan, mm, total_size, 0, 0, 0);
+	for (n = 0; n < total_size; n++) {
+		e = &nodes[n];
+		list_add(&e->link, &evict_list);
+		if (drm_mm_scan_add_block(&scan, &e->node))
+			break;
+	}
 
-static void separate_adjacent_colors(const struct drm_mm_node *node,
-				     unsigned long color,
-				     u64 *start,
-				     u64 *end)
-{
-	if (drm_mm_node_allocated(node) && node->color != color)
-		++*start;
+	err = 0;
+	list_for_each_entry(e, &evict_list, link) {
+		if (!drm_mm_scan_remove_block(&scan, &e->node)) {
+			if (!err) {
+				kunit_err(test, "Node %lld not marked for eviction!\n",
+					  e->node.start);
+				err = -EINVAL;
+			}
+		}
+	}
+	if (err)
+		return false;
 
-	node = list_next_entry(node, node_list);
-	if (drm_mm_node_allocated(node) && node->color != color)
-		--*end;
-}
+	list_for_each_entry(e, &evict_list, link)
+		drm_mm_remove_node(&e->node);
 
-static bool colors_abutt(const struct drm_mm_node *node)
-{
-	if (!drm_mm_hole_follows(node) &&
-	    drm_mm_node_allocated(list_next_entry(node, node_list))) {
-		pr_err("colors abutt; %ld [%llx + %llx] is next to %ld [%llx + %llx]!\n",
-		       node->color, node->start, node->size,
-		       list_next_entry(node, node_list)->color,
-		       list_next_entry(node, node_list)->start,
-		       list_next_entry(node, node_list)->size);
-		return true;
+	if (!has_one_hole(test, mm, 0, total_size))
+		return false;
+
+	list_for_each_entry(e, &evict_list, link) {
+		err = drm_mm_reserve_node(mm, &e->node);
+		if (err) {
+			kunit_err(test, "Failed to reinsert node after eviction: start=%#llx\n",
+				  e->node.start);
+			return false;
+		}
 	}
 
-	return false;
+	return is_continuous(test, mm, nodes[0].node.size);
 }
 
-static int igt_color(void *ignored)
+static int evict_something(struct kunit *test,
+			   struct drm_mm *mm,
+			   u64 range_start, u64 range_end,
+			   struct evict_node *nodes,
+			   unsigned int *order,
+			   unsigned int count,
+			   unsigned int size,
+			   unsigned int alignment,
+			   const struct insert_mode *mode)
 {
-	const unsigned int count = min(4096u, max_iterations);
-	const struct insert_mode *mode;
-	struct drm_mm mm;
-	struct drm_mm_node *node, *nn;
-	unsigned int n;
-	int ret = -EINVAL, err;
+	struct drm_mm_scan scan;
+	LIST_HEAD(evict_list);
+	struct evict_node *e;
+	struct drm_mm_node tmp;
+	int err;
 
-	/* Color adjustment complicates everything. First we just check
-	 * that when we insert a node we apply any color_adjustment callback.
-	 * The callback we use should ensure that there is a gap between
-	 * any two nodes, and so after each insertion we check that those
-	 * holes are inserted and that they are preserved.
-	 */
+	drm_mm_scan_init_with_range(&scan, mm,
+				    size, alignment, 0,
+				    range_start, range_end,
+				    mode->mode);
+	if (!evict_nodes(test, &scan,
+			 nodes, order, count, false,
+			 &evict_list))
+		return -EINVAL;
 
-	drm_mm_init(&mm, 0, U64_MAX);
+	memset(&tmp, 0, sizeof(tmp));
+	err = drm_mm_insert_node_generic(mm, &tmp, size, alignment, 0,
+					 DRM_MM_INSERT_EVICT);
+	if (err) {
+		kunit_err(test, "Failed to insert into eviction hole: size=%d, align=%d\n",
+			  size, alignment);
+		show_scan(test, &scan);
+		show_holes(test, mm, 3);
+		return err;
+	}
 
-	for (n = 1; n <= count; n++) {
-		node = kzalloc(sizeof(*node), GFP_KERNEL);
-		if (!node) {
-			ret = -ENOMEM;
-			goto out;
-		}
+	if (tmp.start < range_start || tmp.start + tmp.size > range_end) {
+		kunit_err(test, "Inserted [address=%llu + %llu] did not fit into the request range [%llu, %llu]\n",
+			  tmp.start, tmp.size, range_start, range_end);
+		err = -EINVAL;
+	}
 
-		if (!expect_insert(&mm, node,
-				   n, 0, n,
-				   &insert_modes[0])) {
-			pr_err("insert failed, step %d\n", n);
-			kfree(node);
-			goto out;
-		}
+	if (!check_node(test, &tmp, mm, size, alignment, 0) ||
+	    drm_mm_hole_follows(&tmp)) {
+		kunit_err(test, "Inserted did not fill the eviction hole: size=%lld [%d], align=%d [rem=%lld], start=%#llx, hole-follows?=%d\n",
+			  tmp.size, size,
+			  alignment, misalignment(&tmp, alignment),
+			  tmp.start, drm_mm_hole_follows(&tmp));
+		err = -EINVAL;
 	}
 
-	drm_mm_for_each_node_safe(node, nn, &mm) {
-		if (node->color != node->size) {
-			pr_err("invalid color stored: expected %lld, found %ld\n",
-			       node->size, node->color);
+	drm_mm_remove_node(&tmp);
+	if (err)
+		return err;
 
-			goto out;
+	list_for_each_entry(e, &evict_list, link) {
+		err = drm_mm_reserve_node(mm, &e->node);
+		if (err) {
+			kunit_err(test, "Failed to reinsert node after eviction: start=%#llx\n",
+				  e->node.start);
+			return err;
 		}
-
-		drm_mm_remove_node(node);
-		kfree(node);
 	}
 
-	/* Now, let's start experimenting with applying a color callback */
-	mm.color_adjust = separate_adjacent_colors;
-	for (mode = insert_modes; mode->name; mode++) {
-		u64 last;
-
-		node = kzalloc(sizeof(*node), GFP_KERNEL);
-		if (!node) {
-			ret = -ENOMEM;
-			goto out;
-		}
-
-		node->size = 1 + 2*count;
-		node->color = node->size;
+	if (!is_continuous(test, mm, nodes[0].node.size)) {
+		kunit_err(test, "range is no longer continuous\n");
+		return -EINVAL;
+	}
 
-		err = drm_mm_reserve_node(&mm, node);
-		if (err) {
-			pr_err("initial reserve failed!\n");
-			ret = err;
-			goto out;
-		}
+	return 0;
+}
 
-		last = node->start + node->size;
+static void test_evict_sanity(struct kunit *test)
+{
+	const unsigned int size = 8192;
+	struct drm_mm *mm;
+	struct evict_node *nodes;
+	unsigned int n;
+	int err;
 
-		for (n = 1; n <= count; n++) {
-			int rem;
+	nodes = kunit_vzalloc(test, array_size(size, sizeof(*nodes)));
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, nodes);
 
-			node = kzalloc(sizeof(*node), GFP_KERNEL);
-			if (!node) {
-				ret = -ENOMEM;
-				goto out;
-			}
+	mm = kunit_drm_mm(test, 0, size);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, mm);
 
-			node->start = last;
-			node->size = n + count;
-			node->color = node->size;
+	for (n = 0; n < size; n++) {
+		err = drm_mm_insert_node(mm, &nodes[n].node, 1);
+		KUNIT_ASSERT_EQ_MSG(test, err, 0, "insert failed, step %d", n);
+	}
 
-			err = drm_mm_reserve_node(&mm, node);
-			if (err != -ENOSPC) {
-				pr_err("reserve %d did not report color overlap! err=%d\n",
-				       n, err);
-				goto out;
-			}
+	/* Check that using the scanner doesn't break the mm */
+	KUNIT_EXPECT_TRUE(test, evict_nothing(test, mm, size, nodes));
+	KUNIT_EXPECT_TRUE(test, evict_everything(test, mm, size, nodes));
+}
 
-			node->start += n + 1;
-			rem = misalignment(node, n + count);
-			node->start += n + count - rem;
+struct evict_test {
+	const u64 size;
+	const u64 range_start;
+	const u64 range_end;
+	const u64 range_size;
+	const struct insert_mode *mode;
+};
 
-			err = drm_mm_reserve_node(&mm, node);
-			if (err) {
-				pr_err("reserve %d failed, err=%d\n", n, err);
-				ret = err;
-				goto out;
-			}
+static const struct evict_test evict(const unsigned int mode)
+{
+	const u64 size = 8192;
+	const u64 range_size = size;
+	const u64 range_start = 0;
+	const u64 range_end = U64_MAX;
+
+	return (const struct evict_test) {
+		.size = size,
+		.range_start = range_start,
+		.range_end = range_end,
+		.range_size = range_size,
+		.mode = &evict_modes[mode],
+	};
+}
 
-			last = node->start + node->size;
-		}
+static const struct evict_test evict_range(const unsigned int mode)
+{
+	const u64 size = 8192;
+	const u64 range_size = size / 2;
+	const u64 range_start = size / 4;
+	const u64 range_end = range_start + range_size;
+
+	return (const struct evict_test) {
+		.size = size,
+		.range_start = range_start,
+		.range_end = range_end,
+		.range_size = range_size,
+		.mode = &evict_modes[mode],
+	};
+}
 
-		for (n = 1; n <= count; n++) {
-			node = kzalloc(sizeof(*node), GFP_KERNEL);
-			if (!node) {
-				ret = -ENOMEM;
-				goto out;
-			}
+static const struct evict_test (*evict_tests[])(const unsigned int) = {
+	evict,
+	evict_range,
+};
 
-			if (!expect_insert(&mm, node,
-					   n, n, n,
-					   mode)) {
-				pr_err("%s insert failed, step %d\n",
-				       mode->name, n);
-				kfree(node);
-				goto out;
-			}
-		}
+static const struct evict_test param_to_evict_test(const unsigned long param)
+{
+	unsigned int mode = FIELD_GET(DRM_MM_MODE_MASK, param);
+	const struct evict_test (*op)(const unsigned int) =
+		evict_tests[FIELD_GET(DRM_MM_OP_MASK, param)];
 
-		drm_mm_for_each_node_safe(node, nn, &mm) {
-			u64 rem;
+	return op(mode);
+}
 
-			if (node->color != node->size) {
-				pr_err("%s invalid color stored: expected %lld, found %ld\n",
-				       mode->name, node->size, node->color);
+static void test_evict(struct kunit *test)
+{
+	const struct evict_test t = param_to_evict_test((unsigned long)test->param_value);
+	const unsigned int size = t.size;
+	const unsigned int range_size = t.range_size;
+	const unsigned int range_start = t.range_start;
+	const unsigned int range_end = t.range_end;
+	const struct insert_mode *mode = t.mode;
+	struct drm_mm *mm;
+	struct evict_node *nodes;
+	unsigned int *order, n;
+	int err;
 
-				goto out;
-			}
+	/*
+	 * Here we populate a full drm_mm and then try and insert a new node
+	 * by evicting other nodes in a random order. The drm_mm_scan should
+	 * pick the first matching hole it finds from the random list. We
+	 * repeat that for different allocation strategies, alignments and
+	 * sizes to try and stress the hole finder.
+	 */
 
-			if (colors_abutt(node))
-				goto out;
+	DRM_RND_STATE(prng, random_seed);
 
-			div64_u64_rem(node->start, node->size, &rem);
-			if (rem) {
-				pr_err("%s colored node misaligned, start=%llx expected alignment=%lld [rem=%lld]\n",
-				       mode->name, node->start, node->size, rem);
-				goto out;
-			}
+	nodes = kunit_vzalloc(test, array_size(size, sizeof(*nodes)));
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, nodes);
 
-			drm_mm_remove_node(node);
-			kfree(node);
-		}
+	order = kunit_drm_random_order(test, size, &prng);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, order);
 
-		cond_resched();
-	}
+	mm = kunit_drm_mm(test, 0, size);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, mm);
 
-	ret = 0;
-out:
-	drm_mm_for_each_node_safe(node, nn, &mm) {
-		drm_mm_remove_node(node);
-		kfree(node);
+	for (n = 0; n < size; n++) {
+		err = drm_mm_insert_node(mm, &nodes[n].node, 1);
+		KUNIT_ASSERT_EQ_MSG(test, err, 0, "insert failed, step %d", n);
+	}
+
+	for (n = 1; n <= range_size; n <<= 1) {
+		drm_random_reorder(order, size, &prng);
+		err = evict_something(test, mm, range_start, range_end,
+				      nodes, order, size,
+				      n, 1,
+				      mode);
+		KUNIT_EXPECT_EQ_MSG(test, err, 0,
+				    "evict_something(size=%u) failed with range [%u, %u]",
+				    n, range_start, range_end);
+	}
+
+	for (n = 1; n <= range_size; n <<= 1) {
+		drm_random_reorder(order, size, &prng);
+		err = evict_something(test, mm, range_start, range_end,
+				      nodes, order, size,
+				      range_size / 2, n,
+				      mode);
+		KUNIT_EXPECT_EQ_MSG(test, err, 0,
+				    "evict_something(size=%u, alignment=%u) failed with range [%u, %u]",
+				    range_size / 2, n, range_start, range_end);
+	}
+
+	for_each_prime_number_from(n, 1, min(range_size, max_prime)) {
+		unsigned int nsize = (range_size - n + 1) / 2;
+
+		KUNIT_ASSERT_GT(test, nsize, 0);
+
+		drm_random_reorder(order, size, &prng);
+		err = evict_something(test, mm, range_start, range_end,
+				      nodes, order, size,
+				      nsize, n,
+				      mode);
+		KUNIT_EXPECT_EQ_MSG(test, err, 0,
+				    "evict_something(size=%u, alignment=%u) failed with range [%u, %u]",
+				    nsize, n, range_start, range_end);
 	}
-	drm_mm_takedown(&mm);
-	return ret;
 }
 
-static int evict_color(struct drm_mm *mm,
+static int evict_color(struct kunit *test, struct drm_mm *mm,
 		       u64 range_start, u64 range_end,
 		       struct evict_node *nodes,
 		       unsigned int *order,
@@ -2206,7 +2230,7 @@ static int evict_color(struct drm_mm *mm,
 				    size, alignment, color,
 				    range_start, range_end,
 				    mode->mode);
-	if (!evict_nodes(&scan,
+	if (!evict_nodes(test, &scan,
 			 nodes, order, count, true,
 			 &evict_list))
 		return -EINVAL;
@@ -2215,26 +2239,28 @@ static int evict_color(struct drm_mm *mm,
 	err = drm_mm_insert_node_generic(mm, &tmp, size, alignment, color,
 					 DRM_MM_INSERT_EVICT);
 	if (err) {
-		pr_err("Failed to insert into eviction hole: size=%d, align=%d, color=%lu, err=%d\n",
-		       size, alignment, color, err);
-		show_scan(&scan);
-		show_holes(mm, 3);
+		kunit_err(test,
+			  "Failed to insert into eviction hole: size=%d, align=%d, color=%lu, err=%d\n",
+			  size, alignment, color, err);
+		show_scan(test, &scan);
+		show_holes(test, mm, 3);
 		return err;
 	}
 
 	if (tmp.start < range_start || tmp.start + tmp.size > range_end) {
-		pr_err("Inserted [address=%llu + %llu] did not fit into the request range [%llu, %llu]\n",
-		       tmp.start, tmp.size, range_start, range_end);
+		kunit_err(test,
+			  "Inserted [address=%llu + %llu] did not fit into the request range [%llu, %llu]\n",
+			  tmp.start, tmp.size, range_start, range_end);
 		err = -EINVAL;
 	}
 
-	if (colors_abutt(&tmp))
+	if (colors_abutt(test, &tmp))
 		err = -EINVAL;
 
-	if (!assert_node(&tmp, mm, size, alignment, color)) {
-		pr_err("Inserted did not fit the eviction hole: size=%lld [%d], align=%d [rem=%lld], start=%llx\n",
-		       tmp.size, size,
-		       alignment, misalignment(&tmp, alignment), tmp.start);
+	if (!check_node(test, &tmp, mm, size, alignment, color)) {
+		kunit_err(test,
+			  "Inserted did not fit the eviction hole: size=%lld [%d], align=%d [rem=%lld], start=%#llx\n",
+			  tmp.size, size, alignment, misalignment(&tmp, alignment), tmp.start);
 		err = -EINVAL;
 	}
 
@@ -2245,239 +2271,152 @@ static int evict_color(struct drm_mm *mm,
 	list_for_each_entry(e, &evict_list, link) {
 		err = drm_mm_reserve_node(mm, &e->node);
 		if (err) {
-			pr_err("Failed to reinsert node after eviction: start=%llx\n",
-			       e->node.start);
+			kunit_err(test, "Failed to reinsert node after eviction: start=%#llx\n",
+				  e->node.start);
 			return err;
 		}
 	}
 
-	cond_resched();
 	return 0;
 }
 
-static int igt_color_evict(void *ignored)
+static void test_color_evict(struct kunit *test)
 {
+	const struct evict_test t = param_to_evict_test((unsigned long)test->param_value);
+	const unsigned int size = t.size;
+	const unsigned int range_size = t.range_size;
+	const unsigned int range_start = t.range_start;
+	const unsigned int range_end = t.range_end;
+	const struct insert_mode *mode = t.mode;
 	DRM_RND_STATE(prng, random_seed);
-	const unsigned int total_size = min(8192u, max_iterations);
-	const struct insert_mode *mode;
 	unsigned long color = 0;
-	struct drm_mm mm;
+	struct drm_mm *mm;
 	struct evict_node *nodes;
-	struct drm_mm_node *node, *next;
 	unsigned int *order, n;
-	int ret, err;
+	int err;
 
-	/* Check that the drm_mm_scan also honours color adjustment when
+	/*
+	 * Check that the drm_mm_scan also honours color adjustment when
 	 * choosing its victims to create a hole. Our color_adjust does not
 	 * allow two nodes to be placed together without an intervening hole
 	 * enlarging the set of victims that must be evicted.
 	 */
 
-	ret = -ENOMEM;
-	nodes = vzalloc(array_size(total_size, sizeof(*nodes)));
-	if (!nodes)
-		goto err;
-
-	order = drm_random_order(total_size, &prng);
-	if (!order)
-		goto err_nodes;
-
-	ret = -EINVAL;
-	drm_mm_init(&mm, 0, 2*total_size - 1);
-	mm.color_adjust = separate_adjacent_colors;
-	for (n = 0; n < total_size; n++) {
-		if (!expect_insert(&mm, &nodes[n].node,
-				   1, 0, color++,
-				   &insert_modes[0])) {
-			pr_err("insert failed, step %d\n", n);
-			goto out;
-		}
-	}
-
-	for (mode = evict_modes; mode->name; mode++) {
-		for (n = 1; n <= total_size; n <<= 1) {
-			drm_random_reorder(order, total_size, &prng);
-			err = evict_color(&mm, 0, U64_MAX,
-					  nodes, order, total_size,
-					  n, 1, color++,
-					  mode);
-			if (err) {
-				pr_err("%s evict_color(size=%u) failed\n",
-				       mode->name, n);
-				goto out;
-			}
-		}
-
-		for (n = 1; n < total_size; n <<= 1) {
-			drm_random_reorder(order, total_size, &prng);
-			err = evict_color(&mm, 0, U64_MAX,
-					  nodes, order, total_size,
-					  total_size/2, n, color++,
-					  mode);
-			if (err) {
-				pr_err("%s evict_color(size=%u, alignment=%u) failed\n",
-				       mode->name, total_size/2, n);
-				goto out;
-			}
-		}
-
-		for_each_prime_number_from(n, 1, min(total_size, max_prime)) {
-			unsigned int nsize = (total_size - n + 1) / 2;
-
-			DRM_MM_BUG_ON(!nsize);
-
-			drm_random_reorder(order, total_size, &prng);
-			err = evict_color(&mm, 0, U64_MAX,
-					  nodes, order, total_size,
-					  nsize, n, color++,
-					  mode);
-			if (err) {
-				pr_err("%s evict_color(size=%u, alignment=%u) failed\n",
-				       mode->name, nsize, n);
-				goto out;
-			}
-		}
-
-		cond_resched();
+	nodes = kunit_vzalloc(test, array_size(size, sizeof(*nodes)));
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, nodes);
+
+	order = kunit_drm_random_order(test, size, &prng);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, order);
+
+	mm = kunit_drm_mm(test, 0, 2 * size - 1);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, mm);
+
+	mm->color_adjust = separate_adjacent_colors;
+	for (n = 0; n < size; n++)
+		KUNIT_ASSERT_TRUE_MSG(test,
+				      check_insert(test, mm, &nodes[n].node, 1, 0,
+						   color++, &insert_modes[0]),
+				      "insert failed, step %d", n);
+
+	for (n = 1; n <= range_size; n <<= 1) {
+		drm_random_reorder(order, range_size, &prng);
+		err = evict_color(test, mm, range_start, range_end,
+				  nodes, order, size,
+				  n, 1, color++,
+				  mode);
+		KUNIT_EXPECT_EQ_MSG(test, err, 0, "evict_color(size=%u) failed for range [%x, %x]",
+				    n, range_start, range_end);
+	}
+
+	for (n = 1; n < range_size; n <<= 1) {
+		drm_random_reorder(order, size, &prng);
+		err = evict_color(test, mm, range_start, range_end,
+				  nodes, order, size,
+				  range_size / 2, n, color++,
+				  mode);
+		KUNIT_EXPECT_EQ_MSG(test, err, 0,
+				    "evict_color(size=%u, alignment=%u) failed for range [%x, %x]",
+				    size / 2, n, range_start, range_end);
+	}
+
+	for_each_prime_number_from(n, 1, min(range_size, max_prime)) {
+		unsigned int nsize = (range_size - n + 1) / 2;
+
+		KUNIT_ASSERT_GT(test, nsize, 0);
+
+		drm_random_reorder(order, size, &prng);
+		err = evict_color(test, mm, range_start, range_end,
+				  nodes, order, size,
+				  nsize, n, color++,
+				  mode);
+		KUNIT_EXPECT_EQ_MSG(test, err, 0,
+				    "evict_color(size=%u, alignment=%u) failed for range [%x, %x]",
+				    nsize, n, range_start, range_end);
 	}
-
-	ret = 0;
-out:
-	if (ret)
-		show_mm(&mm);
-	drm_mm_for_each_node_safe(node, next, &mm)
-		drm_mm_remove_node(node);
-	drm_mm_takedown(&mm);
-	kfree(order);
-err_nodes:
-	vfree(nodes);
-err:
-	return ret;
 }
 
-static int igt_color_evict_range(void *ignored)
+static const void *evict_gen_params(const void *prev, char *desc)
 {
-	DRM_RND_STATE(prng, random_seed);
-	const unsigned int total_size = 8192;
-	const unsigned int range_size = total_size / 2;
-	const unsigned int range_start = total_size / 4;
-	const unsigned int range_end = range_start + range_size;
-	const struct insert_mode *mode;
-	unsigned long color = 0;
-	struct drm_mm mm;
-	struct evict_node *nodes;
-	struct drm_mm_node *node, *next;
-	unsigned int *order, n;
-	int ret, err;
+	unsigned long param = (unsigned long)prev;
 
-	/* Like igt_color_evict(), but limited to small portion of the full
-	 * drm_mm range.
-	 */
+	if (!prev)
+		kunit_drm_mm_print_params();
 
-	ret = -ENOMEM;
-	nodes = vzalloc(array_size(total_size, sizeof(*nodes)));
-	if (!nodes)
-		goto err;
+	param = mode_ops_gen_param(param,
+				   ARRAY_SIZE(evict_modes),
+				   ARRAY_SIZE(evict_tests));
 
-	order = drm_random_order(total_size, &prng);
-	if (!order)
-		goto err_nodes;
+	if (param_valid(param)) {
+		const struct evict_test t = param_to_evict_test(param);
 
-	ret = -EINVAL;
-	drm_mm_init(&mm, 0, 2*total_size - 1);
-	mm.color_adjust = separate_adjacent_colors;
-	for (n = 0; n < total_size; n++) {
-		if (!expect_insert(&mm, &nodes[n].node,
-				   1, 0, color++,
-				   &insert_modes[0])) {
-			pr_err("insert failed, step %d\n", n);
-			goto out;
-		}
+		sprintf(desc, "size = %llu, [%#llx, %#llx] range_size = %llu, %s",
+			t.size, t.range_start, t.range_end, t.range_size, t.mode->name);
 	}
 
-	for (mode = evict_modes; mode->name; mode++) {
-		for (n = 1; n <= range_size; n <<= 1) {
-			drm_random_reorder(order, range_size, &prng);
-			err = evict_color(&mm, range_start, range_end,
-					  nodes, order, total_size,
-					  n, 1, color++,
-					  mode);
-			if (err) {
-				pr_err("%s evict_color(size=%u) failed for range [%x, %x]\n",
-				       mode->name, n, range_start, range_end);
-				goto out;
-			}
-		}
-
-		for (n = 1; n < range_size; n <<= 1) {
-			drm_random_reorder(order, total_size, &prng);
-			err = evict_color(&mm, range_start, range_end,
-					  nodes, order, total_size,
-					  range_size/2, n, color++,
-					  mode);
-			if (err) {
-				pr_err("%s evict_color(size=%u, alignment=%u) failed for range [%x, %x]\n",
-				       mode->name, total_size/2, n, range_start, range_end);
-				goto out;
-			}
-		}
-
-		for_each_prime_number_from(n, 1, min(range_size, max_prime)) {
-			unsigned int nsize = (range_size - n + 1) / 2;
-
-			DRM_MM_BUG_ON(!nsize);
+	return (void *)param;
+}
 
-			drm_random_reorder(order, total_size, &prng);
-			err = evict_color(&mm, range_start, range_end,
-					  nodes, order, total_size,
-					  nsize, n, color++,
-					  mode);
-			if (err) {
-				pr_err("%s evict_color(size=%u, alignment=%u) failed for range [%x, %x]\n",
-				       mode->name, nsize, n, range_start, range_end);
-				goto out;
-			}
-		}
+static struct kunit_case drm_mm_tests[] = {
+	KUNIT_CASE(test_init),
+	KUNIT_CASE(test_debug),
+	KUNIT_CASE_PARAM(test_reserve, reserve_gen_params),
+	KUNIT_CASE_PARAM(test_insert, insert_replace_gen_params),
+	KUNIT_CASE_PARAM(test_replace, insert_replace_gen_params),
+	KUNIT_CASE_PARAM(test_insert_range, insert_range_gen_params),
+	KUNIT_CASE(test_insert_outside_range),
+	KUNIT_CASE_PARAM(test_frag, frag_gen_params),
+	KUNIT_CASE_PARAM(test_align, align_gen_params),
+	KUNIT_CASE_PARAM(test_align_pot, align_pot_gen_params),
+	KUNIT_CASE_PARAM(test_topdown, topdown_bottomup_gen_params),
+	KUNIT_CASE_PARAM(test_bottomup, topdown_bottomup_gen_params),
+	KUNIT_CASE(test_lowest),
+	KUNIT_CASE(test_highest),
+	KUNIT_CASE(test_color_sanity),
+	KUNIT_CASE_PARAM(test_color, color_gen_params),
+	KUNIT_CASE(test_evict_sanity),
+	KUNIT_CASE_PARAM(test_evict, evict_gen_params),
+	KUNIT_CASE_PARAM(test_color_evict, evict_gen_params),
+	{}
+};
 
-		cond_resched();
-	}
+static struct kunit_suite drm_mm_test_suite = {
+	.name = "drm_mm_tests",
+	.test_cases = drm_mm_tests,
+};
 
-	ret = 0;
-out:
-	if (ret)
-		show_mm(&mm);
-	drm_mm_for_each_node_safe(node, next, &mm)
-		drm_mm_remove_node(node);
-	drm_mm_takedown(&mm);
-	kfree(order);
-err_nodes:
-	vfree(nodes);
-err:
-	return ret;
-}
+static struct kunit_suite *drm_mm_test_suite_array[] = { &drm_mm_test_suite, NULL };
 
-#include "drm_selftest.c"
+static struct kunit_suite **drm_mm_test_suites
+	__used __section(".kunit_test_suites") = drm_mm_test_suite_array;
 
 static int __init test_drm_mm_init(void)
 {
-	int err;
-
 	while (!random_seed)
 		random_seed = get_random_int();
 
-	pr_info("Testing DRM range manager (struct drm_mm), with random_seed=0x%x max_iterations=%u max_prime=%u\n",
-		random_seed, max_iterations, max_prime);
-	err = run_selftests(selftests, ARRAY_SIZE(selftests), NULL);
-
-	return err > 0 ? 0 : err;
-}
-
-static void __exit test_drm_mm_exit(void)
-{
+	return 0;
 }
-
 module_init(test_drm_mm_init);
-module_exit(test_drm_mm_exit);
 
 module_param(random_seed, uint, 0400);
 module_param(max_iterations, uint, 0400);
-- 
2.34.1

