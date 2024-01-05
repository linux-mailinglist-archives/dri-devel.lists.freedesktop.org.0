Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 307F7825193
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 11:13:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D24A610E5C3;
	Fri,  5 Jan 2024 10:13:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3628310E5AF;
 Fri,  5 Jan 2024 10:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704449623; x=1735985623;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=st5f0YlL88bWvM/DTkJaGPbw7YBOquFZiHWTV3Fc0yo=;
 b=CPBTtTTQa8tTzurLkFc2aL7lMkPYr/I/Dg9AT5gGTz6Zw+bAdjdaqwy4
 JVpNrnwwR64wmhlHb+5sE9gbVT9m5VSIG2oztisGghHerE5TvWEZS+T+d
 vM987lvuOdoD6UtOyoSGZEoG5bDNi6D91n0LdZfM8VF/4enirXr1a4bca
 OKY6aEdIu3JofxLmydjjgAETEK81ac8+n1Z3u60MkJr5ImWJGuGh2AN09
 MHao4Zbi/UqbUJXzA7BF3e/9iACdSeEEVgQfhlwUYuGwvSG1Jxjj/h7SL
 hkFDG6OBEQ06OBn7QSUeLKXJqyUl93ALV6hOgZgSb7AvEo50bnQHZemn7 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="376967367"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; d="scan'208";a="376967367"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 02:13:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="904113841"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; d="scan'208";a="904113841"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jan 2024 02:13:42 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Jan 2024 02:13:41 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Jan 2024 02:13:41 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 5 Jan 2024 02:13:41 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 5 Jan 2024 02:13:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kaBnn510mFZDB2AD6vDS87D2hS3x3XvWD00mIDneBlRbi0/2F14O4+SVUekhbOV136HcqsUhLL4NK0W663XYqoPkKFhJt3yDod/ZTwaBHGLM4In8wv3XFfhyVUBcnO7w97bWiLqvA0Z+joPVDmEBdEO9eq1coGoaVDhWZkTr0aQMRsYxnAKnXV4K+/20s95AIVeYRNAAmWQOx9A+CDNw0mUQ4sYeX/Tgc6umqrJC/n5kxSs9JqwzFGEwVGLweYbyQhF8YGaBA6V3wihn7nevCTtCcGSs8f8iTpnAzK3SXbfNTPfJX1oZFQQk4zwasp+xHOC+Mtz0HG7g7WfjGRyL+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OrNEy63RS/s+NA+SUvDkd4opujoahiFy5yQbnP+yksk=;
 b=Wbc2PcOcTrzJTgiQbanhYVQKK5VCD7WLuIn29XLk7ejWwoHryXKFNyEeSf85Y/gyXvExMXvcjapecxe0cW9y65c48BZsHNLdyb1VzAdmsbYlES8jZ97tIqV2UCQ/3eH6i9kYoEaLJUmNPn2e9E8DXLeNOqoCeqxo/XlmHWS+FtsvuaXwzsriUP4em5DTFG+NNqNkAEAhn4IYspc1XFoOY9bF3YuVoG/2MGI8QUTLUJ8YXN2C3I3Skyj1ipNI0EJsfvulrN5wdgq4Ivo4GrkC4GmISFICCagCKTMZqQfAVDbcNm52myijLD0nLBtbVlvImApIvFmIigY8YdlU7eilSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 LV3PR11MB8483.namprd11.prod.outlook.com (2603:10b6:408:1b0::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7159.14; Fri, 5 Jan 2024 10:13:38 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7159.015; Fri, 5 Jan 2024
 10:13:38 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 2/6] drm/tests: managed: Rename the suite name to match
 other DRM tests
Date: Fri, 5 Jan 2024 11:13:20 +0100
Message-ID: <20240105101324.26811-3-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240105101324.26811-1-michal.winiarski@intel.com>
References: <20240105101324.26811-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR09CA0110.eurprd09.prod.outlook.com
 (2603:10a6:803:78::33) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|LV3PR11MB8483:EE_
X-MS-Office365-Filtering-Correlation-Id: d763c947-e00f-4c58-aa07-08dc0dd6fc58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Va3YUQtwnIUFjW8wlWEf2REUh1QZxpOdyeJoJDo5yOukxdU0dDoBClg06OmF0mf3EP89acc+3ljK11s2biNoOfzwWJs7zWJoSCwuWoAE9yFD1snSxQe2GI3J+k0XPuOtegmOKjgVvmOqVQvDnGnAltnaZu5zq8MXCY1q/ql9vDwaA6WJ9iFHi/Rjk12uTugG661ZtkoV/+Kbj7Oag9LFPFsHfOkVkiiIXvUAchGFMzZxKMD2Sk0yj+TRRdo2LKwrxgIvMN7ypHgreSRmpUpJhUQpkDTVTo6nMe1pwG3+gYGE95CcaSlR7zk6LxxWqqr+T0B5IZzDC1NtTpog7D7huacmuap8HhTszjL9YTaJqxBKoQJR2xNNEOpvKbVQA1J3lMYZL2DuD9jPQ+TReDEQOPSax8flLPYp7mkZe0yG7Xdt11enitpumLYEkPjjKHSMxOEgHPpZPPfH2ZeKKCt6zdRhRvl8Pg/hsnPvGW658P6frS3RsZltdrPV0FI5wJTIXGzLqhuUnQ74hn/aWw+qvAirD/PJpK/bvCGVUlbfu0CBKLf+aTROj4Qiuzgjp5jB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(396003)(366004)(346002)(39860400002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(6506007)(6512007)(6666004)(66476007)(478600001)(66556008)(66946007)(8676002)(8936002)(316002)(54906003)(2906002)(6486002)(26005)(1076003)(83380400001)(2616005)(41300700001)(5660300002)(7416002)(4744005)(4326008)(36756003)(38100700002)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzRXMXBST21uSzVOb0FTK1FqdW5objUvNGhrNUxxN2NKd296YktTNEFWTDVq?=
 =?utf-8?B?ZEkrM0pPTmRZeFpwYTFqelRFM3V6VEY1TzBQc0k0SWxPcU4veVRINE5yS1c0?=
 =?utf-8?B?cnZpYy96Ly9Wa0VLSjhlTmZRUmxUN1hYV1Z0N3ZQNlRvUkUzcFV3cDVpL1JS?=
 =?utf-8?B?TlFxSW0rcFpPZGJyMU9nMllMbExmWkdCWnBWcGlESTEzRGlWUTdFTHFraW5B?=
 =?utf-8?B?c01kYk5INzN2SGkreGxibFIwbWNSNWI5am0xSUQ3QldYODY2Nmx2T294bUh5?=
 =?utf-8?B?K21Ib0hXVGE2WVhVMkQ2a0lzK3lLNDRtZDgrL09MNTl3RzlkYkhGMEJLY2hC?=
 =?utf-8?B?L0pkcnduNzJXKytsMlRKc2ViOXdzbG90ZVd1THBtM2llWGV5SERrNjBUSm5I?=
 =?utf-8?B?UlM1Q1JyZXZFbWtoOEQraUdxdGw2Z0lKSElLYkd2bVNLQm0rZ1hmVlYwTzNP?=
 =?utf-8?B?UjRsK2NxUTlsdU9VTGZLbjRTSXc2QzJWVG43NDZhUloxeTJMckJuanRFTnNP?=
 =?utf-8?B?Ym4rZGlsUldXaWhYY1FQMmVIWmFOWUtDWm5sYjJHbkZ1YnVFaFpXeDFENmxu?=
 =?utf-8?B?RnNnd3gxbVREb2g0ak5GMlkxVXZhU0F1MTVZZ0xQSGUvSUdON0xsSm12UmhI?=
 =?utf-8?B?S29VMzVYUGpVTHQyanZaZ0JOaVRaK2I1R25vaitWSTFxQXhyUTZHK3JBMjdr?=
 =?utf-8?B?aXd5QjREZWdDRENXakJGd3ZlUGFWMFB1MUJOVDEwai94YUpidnM2ckgyWW5L?=
 =?utf-8?B?UDhuMVdPQjBhKy93Q2t5QVhBaW0yWHJiejN5YkRKRGlTbW8rdC9ORlRFRGJh?=
 =?utf-8?B?eEptMjhrRVphTkdtTzZ6d1YzMjEwYWZUTmx1RkIvV0NQd2hZb0ZsMW5NY2V4?=
 =?utf-8?B?T0gxRkMxNThVeUV4RVZoeXlVbjNteUQzS1M2MXVzUmpNSTIraGZyTFJOcjBF?=
 =?utf-8?B?NlNhaW9CODRVUGtnb1RUbXRUN0gzMGdzYjBhakVBU0Rnd2x1Y1lCL0JXdXNV?=
 =?utf-8?B?U3V5MlRLQkptaUNHaURxUllmeHJBeW1YTU8xMTRJVCswTHNPbEZEdHd6WmE2?=
 =?utf-8?B?RW5CUW9BQXNBYVJ6cGRNdHlTdUdxK0g2Y2VSNjB6OUxaNWQyU3ZXLytjOXU0?=
 =?utf-8?B?VXNxa2ZjT0RPS1p0dDc0T0FPcUxSVjRJa2V2cFNOQkxqRmNPK3U4VWNYblh2?=
 =?utf-8?B?L1VkeFN3enRJUnA5TUJNUjQ0SHBUQlN3R2RSVVRIUGFrSnRmSlFrUDFrMThY?=
 =?utf-8?B?cDBVNmxYbFJRK2dDaTNJZDdPRkpaak9hZmJMdjcxazJlNi9nLzBCVFpKZXpm?=
 =?utf-8?B?cDVNdDludDVvMi8rMkRBQi9GQ0lIZ1FFSVRwb1VzRlNKUGtDTDdCeHZ4Qkhx?=
 =?utf-8?B?dkpZWjZ1c1dZcExzam5uNHkyVk1CeUdKYURkMDlORHlQY0h0YlNRSkZmcENy?=
 =?utf-8?B?UC9zeFNFS3czc0JXSk8yeWRpaC84Yk9vSEgyYzdQbVVrbHg1T01wTlRvUmdC?=
 =?utf-8?B?YkNHaEQwM09SOHZHUGRxUkVrQ0xlVFRFQnNadFZKUEN5VllndnlWRHVZMzBi?=
 =?utf-8?B?bkZkZWNMdUFCYUFtKzI0RjhmNCtYaTBEMklhTHRZQ0pIYXRWRzd5OThNci83?=
 =?utf-8?B?d3ZtVVVXbjJRT1ovek9ISld4QUpjWEdaREk5a2laaWxZcUpPMHIvbFRMRkFj?=
 =?utf-8?B?M2liQUpjUkZJTzJnWi9YejByT2djSllISVAyNjRFdzRhdER5Rm4ydDhEakJr?=
 =?utf-8?B?dHNGdVlXN1JJYU56UElnc2lQNWJOMkRrbUdsRWg3V2F4M1pNelh1Z0MxMTY4?=
 =?utf-8?B?VHdwY3ZNUldFMnM3MlR4TDZ6cDNVMGJHS2UyYmVkd2F3czFGT3dFY0lQakdB?=
 =?utf-8?B?TFljL2ZPeGhWdkJKbzgyaFJaVUluL1hLQ1RPTUhVRmdHcVJ2cG9Ba3JRM3M4?=
 =?utf-8?B?a0JvdGVDVjVaWVFaU3ZuaTFNNEhCTmMxeVNQREJjTFNRQlg1NG1YU0MxS0Fx?=
 =?utf-8?B?cUFYVGc1aWpaSUpwQy9tK0NTclo1ajZMeko1cW0zaktxamlrcmJOWWJBajA2?=
 =?utf-8?B?MEtUWnhiK3A5N3prWXppdjN2WThLNlZodXNzRDRsL2ZDK3F6bnF5UkVKd3hn?=
 =?utf-8?B?WW1INWpxdS80c0F1UEdwRVVySWRPV3NOczFWQW8vVFplU0FoTHZUOEFOTEsv?=
 =?utf-8?B?VXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d763c947-e00f-4c58-aa07-08dc0dd6fc58
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2024 10:13:38.8870 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mC5eGwEeMrDQrZtptERj83B1kxpJ8z3hnEg52jiMcbJG3lUZmJkl+Q3mKdx6tR8cEk1T+QemnA+boQnIJU7M7DgaTireywgSsFBNFDIvnSA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8483
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
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DRM tests use "_" rather than "-" as word separator. Rename the test
suite to match other tests.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/tests/drm_managed_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tests/drm_managed_test.c b/drivers/gpu/drm/tests/drm_managed_test.c
index 1652dca11d30c..659af5abb8014 100644
--- a/drivers/gpu/drm/tests/drm_managed_test.c
+++ b/drivers/gpu/drm/tests/drm_managed_test.c
@@ -61,7 +61,7 @@ static struct kunit_case drm_managed_tests[] = {
 };
 
 static struct kunit_suite drm_managed_test_suite = {
-	.name = "drm-test-managed",
+	.name = "drm_test_managed",
 	.test_cases = drm_managed_tests
 };
 
-- 
2.43.0

