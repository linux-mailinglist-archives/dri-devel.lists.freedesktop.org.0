Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA1F8118BE
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 17:09:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C58E10E29B;
	Wed, 13 Dec 2023 16:09:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A37410E291;
 Wed, 13 Dec 2023 16:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702483763; x=1734019763;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=lPZG4b7Dkb/TyMiZ1lSMwq4huW9Mo1SX4OTvAuKAitg=;
 b=X8NNRiSATYcYiP277OY4SWdviXwhDf82b+zGwA2DjivKd/LYzJyaSaCe
 VORHNa6FPjaTedW8OQ3doOk3HyE3SmSOr1HbANZFBe8MaRkkBVkw1hO9s
 0HQWbFlp6xNvauWfniV56Z1g+JN1XdG+AvqrZLwyhO2oyXkuwkZ7fJmlG
 cd2840V5+tZwjse2ZDsyfmWvUKFckO96YZQdAVvdqHI2lVlnvxKQrDUyH
 wZr/gXADA7PKNZbZlHMXI2eKRVxNfQonKjur66l2EQPIohMwzfjqggNxq
 WUpN9JZBdgfCTRxHgpsbnEuVb64Oi7clqIUuHM8rAZ1v9ea5FLfysyUe4 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="375137042"
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; d="scan'208";a="375137042"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2023 08:09:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="844362945"
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; d="scan'208";a="844362945"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Dec 2023 08:09:22 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Dec 2023 08:09:22 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Dec 2023 08:09:22 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 13 Dec 2023 08:09:22 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 13 Dec 2023 08:09:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c1FXgLvy/OJ1F+O5fBtiWbsiNC6sIkVL5m6nhnFgI9Jm4TREH0K7lqWTFUZnH0lwc52rkgxFDuZ8UHEoiXSCmqYVADqfwJcMWcoHj7hUT69tDLFuZFoUVsfm9LLM3aTzudgtVc9z7hOFJFhn73CNYWSOSlxFLFiavoG5+SVsY+ng/e+v8kFwhT1yTPF9dAnQgkRe73rHp9caNYlzX3Zq345bkEwpMRGtqtv4CFLEySmIS73ZhTQ8rJd5y1by2JJCONDTm7uYT/860VroHctnTjPhWCtbFhT8cRlUGRukUxUb5c/jI8fnZi4CMfOdH/P2HemuYVY1jjFLQY7LOcH4oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vZRtVc/qR50yuypaKTy236lDtAC9GkGQBSm0sDEUUKo=;
 b=mzUZFgkCWPp/qUmNcAHwjQJiXvsygb1y9hXm18JV8YDRP0TiHddNPinMFtVLvONzsKAOAvg56/f2fq/uCtErA7buVERO++OACvhI3ROToDEnvtMECrbVSAsJP0fqZUgWX6h8zICcZoBEZTaa8MokwM0YXI4UExKEaI9LUZtj1hHCX3DUGQONHxXlD8lWKywzJWVK8ftg8PnwijHzR2GtQnrM4jYy2J7XuMZaa43D4iJ2VIagXM4dqyIivcEgVrVOHfBl2ulndhFunOLmmLG77uDreGt+kbmhZzOygIURcfVhl35acZOr3GFQT6PlHF1+X4F4Rmj+hUSMgkRteVg83Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB5123.namprd11.prod.outlook.com (2603:10b6:303:94::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Wed, 13 Dec
 2023 16:09:20 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7091.022; Wed, 13 Dec 2023
 16:09:20 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [PATCH] MAINTAINERS: Updates to Intel DRM
Date: Wed, 13 Dec 2023 11:09:15 -0500
Message-ID: <20231213160915.1414733-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR02CA0009.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::22) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB5123:EE_
X-MS-Office365-Filtering-Correlation-Id: db1c85ac-eea2-4fb8-0a60-08dbfbf5dd11
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aRJRX9Px7koCvCwRpT8z/KznFLG0uUeVdk1DRiklt9mvw/hqaPEFcRzdFPWpAe2eEG9jInXBKWP3YTe4aODn+KKfdxut90z6iXgQ5qMUPuLLoJtVPnA+OHLVD1EdOKDGugGNl3syUsaLloGL8jd6PC9mIAxa7jQuMt2rqpCUo5UFqz3B02OQWpC9yRTjPpMK6/ojX+SKQH1NBewlLzP24nQq8f5vcipQHbVqFmLrPZGhlALKzJ8rf4sVlPdtVTrt1UhjQV9MlYxh6BfcpsrrnKxwP2AXwQ/SoRpGJ1uQiYg7VEe33SRgY3kfUuhxcRTSztZLemW06tebeOqL1qHQ+wJALkMV8JpkNjBEaF0LzGTEEVkqrRUCHu9qAFTJawgHQTe+yLLVJYrFOotSTDIaMKTaJ9sgW4PagHpoT9fQbmqWtsmRPY53J17DyH3RjTGmj6vbOrnSHUM6i8CPpdV9pa5HELuGP6kvZ3AAaCrRz/0DcBmkaVu2UiF3nRK1Ej9mpaFdEwe5lu5RVJz59lZ8+Z3qdSOorhrgIOAP69LM6VjxTVpEddbz/zHhRxQ7Wqcx5vBhYszUNRNlsEQx76V1Gw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(39860400002)(366004)(396003)(376002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(36756003)(86362001)(2616005)(6666004)(6512007)(6506007)(66946007)(41300700001)(66556008)(6486002)(966005)(82960400001)(1076003)(66574015)(38100700002)(26005)(83380400001)(54906003)(2906002)(8676002)(4326008)(478600001)(66476007)(5660300002)(44832011)(8936002)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cG9CakVoVXFhMWVJd0RJVUttY1VCMGdFK0RnR0VPNUtscFNHc2Y3ajh4azJY?=
 =?utf-8?B?UTRTUEwzb3pKMkhjd1FPaXd0N0J2K0JDTDRMczBGVUhva0FleDN3MUkrUkkv?=
 =?utf-8?B?bjd4aWNIWUUrTURxWUFtdWVJRFNJVktOdi9nUXNaZWprcTg5MnViV2JFdkVh?=
 =?utf-8?B?VnJjZVZBcFdZb3hJR1hLZ1lneGdaOElxREdvWm1mbGtTL1o0MTZnL3V4TWZs?=
 =?utf-8?B?WlFLWWRaVC81enFyQXZhNGhqUHlSVGJEV1Z0djV4TkE0c3kzUkROUmQvYmZ0?=
 =?utf-8?B?TlMrWFQ0cXdadlhGY3ZxRHRpTGQyWWRyUnNnc21VRnNROTRzbUR1U05IL1pT?=
 =?utf-8?B?WTFpbXd4aXBpQmNKY1BCL1QwQVZ4TkthdGlZZERpdXI2VTRWbUpieUw5OS9t?=
 =?utf-8?B?bmdkYnl4MkxIUE9YVjhackprZVc1WFRRRGo2KzdTdUZrSlQ5YmJxQkI1N0Uy?=
 =?utf-8?B?bUdoUG42Vys0QWh2SDJzQ3g0QWl2dVloSHZ4YzVqSXZiZm0yZ3A3eFg4cXd0?=
 =?utf-8?B?NE9wa0NxOUg4UGFHdUljVW11Y1dBVnNBVjNkYi90aHgyYUZNNnRoTnpvTGJT?=
 =?utf-8?B?YjMrUWY2Y3poYXNScTgzTmRvMGFZQ3ZUSkM0djhLVWdrWVBPL0lFd3NRb3lZ?=
 =?utf-8?B?RjQ2TEthREF2NDBHRkdDR0R0ejVRekkxS2NRZno3NHNPU2kyRlRkdnd6ak00?=
 =?utf-8?B?dXVvSUhpQ0xrTWlFdUZJSVpCSXd4Z0o2ZGlOb1lTMFJMYm95VGhENUk0aVJm?=
 =?utf-8?B?SkkrSno0Q0drT1BOTS9kNWtnUXdRWm81dFg3ZlJnWSsxVGpWVGVPTkJWTytO?=
 =?utf-8?B?Q29rMVpzWWpIZ25yMDFKVnpVQUxZRU4rNG92ZmZMT2d0SDRGakZGOFArQjgw?=
 =?utf-8?B?OEoraXE2cXhrcDdVeDVvQkd5U2k0MmQyRXNxSnJMdnl3NVc3VlhBYWRHbzUv?=
 =?utf-8?B?MjRsbXpTOHFWMzBqMkNKWk04Y0VVRHJBWWZwZ2FVaFRZRnFLUDd5QTNiMVVx?=
 =?utf-8?B?VndQd2NuOVFwdVM0UVZxRUZndThvRjhjZ2hDNnpVL3A2dlFRZFpyc0lnbkV3?=
 =?utf-8?B?WmU5bU9JZXpzclNtTFI3RFB2M3pFeC9uUkEzYmZmOWNnYkIxcm1iVXh2cnBk?=
 =?utf-8?B?dUhXdFNaVjIreWZrUWVGYkZjWVZyallEM3ZmRnZhUmRoSkZ3L1dxdkQza3lN?=
 =?utf-8?B?cSs3ZUZOL1F4WWxXWG9MWmR1UU5IMmZpNFQ5MktHYnNtL1Fsb1RWUEU2QlRC?=
 =?utf-8?B?QUNMQ0NYb3Njc3Q2ZDcvU1Qzd1RBc1pUQjgxaUFLcWE1blJIWWpDa2QrMHN6?=
 =?utf-8?B?bGVwMng0eDhqcTdIaWpYUG9LQkNCWEJuSitoMTcvYXlmaFVJSmZqYVovbnJT?=
 =?utf-8?B?WHkyOXlZRGpIUGdmN0xxbUlCVDk0SjNyWWlFZFlMaDUzWk5YeU4zRzFENVNU?=
 =?utf-8?B?UEczdFJQR0RiRDFmTVgwckozak5qVnRzb2pycEFEeE96aDV3Ykk2LzJzSHlp?=
 =?utf-8?B?eW9GbU9mUFBwSXRXdW51NG1UNGIweWdFckJ5TDZtRzFvaWRidzlsZUJDZEV3?=
 =?utf-8?B?YS8zbGVaUjQrNWc1b1hBajhud1JlN1JQQ00ydnl4OEd2aW94VVh2L2d3a0R0?=
 =?utf-8?B?V29JTUswbDN2cFZBSFdhUWZtQmhUSXpua3NkWVpicG1iVGhQOWRpZE1uWkxy?=
 =?utf-8?B?R2YwTVk4by9QeTlvb1ozQ0o5YzI1UEFINGxtbE5PRVJZODBhaTNJTS9DVzVJ?=
 =?utf-8?B?VG5KYXpaRWRqM01oUE10dnMyRDg1eWZ6NEJ4Y0V3djYydnF3NnVrc2Z3Y0VI?=
 =?utf-8?B?ZDRhSEdMWW8yaU45L3hJZXNnS0Z4VVNvaHhDdXhGdHRzbVVkck1peHFMclRQ?=
 =?utf-8?B?cjByYjRyaFJLQWdIYnQwRG1vSUt3SWNRMm9tN24xbnVWNmRFUzFiWEMxYzZ5?=
 =?utf-8?B?cVlmbktucEtFdmRXTHlYaGY4S0oyZE84c2wycHlvY1lTc2gzMWNoak50RjYx?=
 =?utf-8?B?Sk1POE1TUDVMUGsxZlNIYkpRN0R5Ny82S2xRNWtaZEVmdStoNjV1QmNMakJH?=
 =?utf-8?B?encybUpOKzR3UkZLaDVCMDRmeXdNbnMyWjU4S2FlZjNXVm9PaFEvRFZpOEdW?=
 =?utf-8?B?dDd2SWEzVVZDd0gxcm9qL05XTDVFWkw5bmx2cXNSS0lmaWtocE5jNTZDbVg0?=
 =?utf-8?B?VVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: db1c85ac-eea2-4fb8-0a60-08dbfbf5dd11
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2023 16:09:20.0369 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VOI5+KZHG+ikPKMow86UhZU23M3rQB2ENoYOhEu+5g9od/iyzxkeskBkUJT0YbyaxOibd7YzAMxKOsG6/4kJ6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5123
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce the Maintainers of the new drm/xe driver for upcoming
Intel GPUs.

Since it has a shared display with drm/i915, let's also create a
dedicated block to group display related files. But without any
substantial change to the i915 side. The display patches will
continue to flow through i915 from drm-intel-next branches for now.

Acked-by: Jani Nikula <jani.nikula@intel.com>
Acked-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Acked-by: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>
Acked-by: Oded Gabbay <ogabbay@kernel.org>
Acked-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 MAINTAINERS | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d4b46b3db022..8b5e3c27bca6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10640,7 +10640,17 @@ L:	linux-kernel@vger.kernel.org
 S:	Supported
 F:	arch/x86/include/asm/intel-family.h
 
-INTEL DRM DRIVERS (excluding Poulsbo, Moorestown and derivative chipsets)
+INTEL DRM DISPLAY FOR XE AND I915 DRIVERS
+M:	Jani Nikula <jani.nikula@linux.intel.com>
+M:	Rodrigo Vivi <rodrigo.vivi@intel.com>
+L:	intel-gfx@lists.freedesktop.org
+L:	intel-xe@lists.freedesktop.org
+S:	Supported
+F:	drivers/gpu/drm/i915/display/
+F:	drivers/gpu/drm/xe/display/
+F:	drivers/gpu/drm/xe/compat-i915-headers
+
+INTEL DRM I915 DRIVER (Meteor Lake, DG2 and older excluding Poulsbo, Moorestown and derivative)
 M:	Jani Nikula <jani.nikula@linux.intel.com>
 M:	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
 M:	Rodrigo Vivi <rodrigo.vivi@intel.com>
@@ -10659,6 +10669,23 @@ F:	drivers/gpu/drm/i915/
 F:	include/drm/i915*
 F:	include/uapi/drm/i915_drm.h
 
+INTEL DRM XE DRIVER (Lunar Lake and newer)
+M:	Lucas De Marchi <lucas.demarchi@intel.com>
+M:	Oded Gabbay <ogabbay@kernel.org>
+M:	Thomas Hellström <thomas.hellstrom@linux.intel.com>
+L:	intel-xe@lists.freedesktop.org
+S:	Supported
+W:	https://drm.pages.freedesktop.org/intel-docs/
+Q:	http://patchwork.freedesktop.org/project/intel-xe/
+B:	https://gitlab.freedesktop.org/drm/xe/kernel/-/issues
+C:	irc://irc.oftc.net/xe
+T:	git https://gitlab.freedesktop.org/drm/xe/kernel.git
+F:	Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+F:	Documentation/gpu/xe/
+F:	drivers/gpu/drm/xe/
+F:	include/drm/xe*
+F:	include/uapi/drm/xe_drm.h
+
 INTEL ETHERNET DRIVERS
 M:	Jesse Brandeburg <jesse.brandeburg@intel.com>
 M:	Tony Nguyen <anthony.l.nguyen@intel.com>
-- 
2.43.0

