Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A27510478
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 18:49:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F75B10E2FA;
	Tue, 26 Apr 2022 16:49:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40FAB10E1A2;
 Tue, 26 Apr 2022 16:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650991786; x=1682527786;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=yGzvo8RV0/MGbHFXhw2a/0h8pKeLAmvB+BJdgRhm1gI=;
 b=lBvDaYzsYDQm8Ci9JggT81FhkK/154Do2MB7O/jIWEVOmrL+0DcWtv17
 Z0noaeeQMOX+OXmSf4OnbGjtkLcNsJIV32EmVTR3SQOhgBFscpyx5y3vV
 Y1YIf0o5nahjhsvO1rSGf2Nc7Ji5E1HcZAnG/cSbfswCbFRIH308yB099
 trh6fVWL+6Tp+66jPhXuT5N7zm/Ky6HrS81vg1vOfRTRu8D2OnHhFnoEu
 jOTA4Var7a4MTeMkZNU7osVZumlh+xJ2xWr+GMR9sUYaW/IwDGuaDFQZb
 4O6PWFlARzffYc96GUH0DpoAzxVi4JMTNK9Ea/w/3222L8X9uNpq8SQU1 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="247581610"
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="247581610"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 09:49:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="513249625"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP; 26 Apr 2022 09:49:29 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 26 Apr 2022 09:49:28 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 26 Apr 2022 09:49:28 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 26 Apr 2022 09:49:28 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 26 Apr 2022 09:49:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FLbcQDKK8gVBjznoIJUnsieUB+o/vN28rLoGUsn6cilvD4l/0HB1hhwAcHdLj1g3C53n+yEk9JSszF3arSOjBk70AfEw6/YcfCR16qZHIBaXAV1xHTvikLD3PZunyWxKU7JCxA+ZFG71PkklNYhlw8M2OliwCvYD4HNt76oTJMASccFQxFWeyAp9QeQ4FvKapH1yWULO1AK3+KDmXqgYuh2vbj47g8IQPZzMoc0Ee2NL42oVGYCtILQN12TWKmhEXJEiLmAmUQthJOQcqczgobpYEjy/lyuhuQ77Wlf6X8B9vv+joIMtV2YXA4tHRsq2+iSXS6aaIFRwbsQZtPGQ6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XAEbb9jUdek40yRhKk7YeMaQ8o602Q5O93ImyRiJYpM=;
 b=l4t149B0dl0T1I+LiOKEqC4nUcJSarMuGTe3JOFpPD8QFBetYUMsHnJvJQYynVGgIXrlPXpdGdmrsMgF2BJCy2uHnHr9CNknWjL5N7uPm/xcl2alBUy5FG4a5XbRQPKZym9X1kABxDbp5dcMpDH+bl2kuI/5LAtx86kMqh6wZRYxlngfjTAkPaj3QLJFt6pZyiJEh7ZqJ1sc6/X1piiALjbe5F+lWVkqIhavaQnEeJzg4bjrNS9DP6cev8fU39DadkgnX8UXPo5rANy7i/kaQn/7SgD8ETv/P76BWljjOVcsp2KqOLkyjlYnG6PEGX6DnV2T2itRggJCeX8sAdY3hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com (2603:10b6:a03:2d4::5)
 by MN2PR11MB4366.namprd11.prod.outlook.com (2603:10b6:208:190::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Tue, 26 Apr
 2022 16:49:25 +0000
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::3d83:3af5:c95f:e062]) by SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::3d83:3af5:c95f:e062%7]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 16:49:25 +0000
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 0/7] drm/i915: Use the memcpy_from_wc function from drm
Date: Tue, 26 Apr 2022 22:21:41 +0530
Message-ID: <20220426165148.1784-1-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN0PR01CA0044.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:49::19) To SJ0PR11MB4894.namprd11.prod.outlook.com
 (2603:10b6:a03:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53248f0d-d207-49d9-f96c-08da27a4b8c9
X-MS-TrafficTypeDiagnostic: MN2PR11MB4366:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtFwd,ExtAddr
X-Microsoft-Antispam-PRVS: <MN2PR11MB43662ED554F6587FB819FA9B9FFB9@MN2PR11MB4366.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2KOzUZswzqAGHldHh3s0mAO22LZygihsitHGZMnaJSvdgpMdGZLCQJ5jykZFL5JJhaI9hosazzS0+oLii5NYMWkk6m8Ow1fmQ90y7yDaopQiWlvDRdjdx4B/MpBs88rhOYI+ktyAOuyo/M6TIy5YR8GO1qyQ9EkiKfnP0UgRSMEkCfhVeMke6odbM2EBgJGkwUjynW37yhy/fMS8N8B5wN/oHvxNYMLQfiJpnafTercacT7sC5/HCAvzEjEfFwPBTgYbc9CT76AS6KSA+KRU87/WbvPaXbsEdSXlb8czT0ziDTTpLeGyz2aCIUGaYjbE4qI0j5ofdx+2HluRUQiXwoWaii/GE+nWhfVgz6tJ93Kg+oCNSSa/jtCRc9ZKR9/1fcKtaRS6Yrk1ySDliMKqhbSdFwm7LaV49Wwdy0ZKqZcP7K4uXp+6VFnibe8SFsm7aBx3SsCaWCV3CX1OkmwP8E0e9zhVPVoDqhz0TuZtsF5jNe47+ePuKZCZmccqQHQ9mlDsgeSSQS/kz2vzb0j56AqBRKzn4xbKxpKcZMsEnDw8u0NMcKa/J9qoTU9jUkU0RGtg62k+OWPNQQwbkLN3RK3wuI0mMT60nBXF5M2whS1jyWuYtxM0cQNmJteDKnAuVQdZp4F0YaEAYkGU45XN9g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4894.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6666004)(2616005)(66946007)(6512007)(5660300002)(82960400001)(26005)(8936002)(66556008)(54906003)(316002)(86362001)(2906002)(1076003)(38100700002)(44832011)(6486002)(966005)(508600001)(4326008)(8676002)(66476007)(83380400001)(186003)(6506007)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TW1Vc0tya0N4RHQ0Rmt2MzZWZW5IWjdQU0ZNcURyMlNkWlJCbGdVMStJVkhU?=
 =?utf-8?B?V1F4TXZRcXpJcEdFY1F2QmlnVWdLb1l0VkpzZys4TmdacUdWOHJ1UkZ5WnZJ?=
 =?utf-8?B?Mkc1dFcvMzk1b2NLbkFRZUFpZTNENUMxL2xTakNiWksxei84eWMvY1RPSzJ2?=
 =?utf-8?B?SVVJRjhraXFtekxjWGxDdFhrcE4ybzlYODVsVFhwTUgvU3NGa0o3UWhlSkJt?=
 =?utf-8?B?QVFOQXlKdUlIbjREcUs2U0RtL0Z6eWpnV0VrdUdsa25IQ1YzZytTVnFkUksz?=
 =?utf-8?B?Zm1jaG01NnVHUkw3Q01JNzFJdC9IME1jWjh6bzMrY2dCcjF6UWZTQndoaU85?=
 =?utf-8?B?MWtnWFJ3L3o0ckJJSVRmbG5WK2psV0lsNWtobU56L1F6RzNnVFNOS2JFQ0lv?=
 =?utf-8?B?bkhkYm0wZkliV0pIVHZBeUFiRVliVFVGSXdBOE5jWTNzeWpycTB0M29sN1NV?=
 =?utf-8?B?Sk1pSlNCM0Q5U3BlSWw4Nk4vTm96Sm5vTmZkdjgreS9YMUpYV3VnelZBdEM1?=
 =?utf-8?B?ZGV6SlZKejlZb3hGWmtPZzV4RmExcXZhNVR2MDJKb1BLZkdjWkxUZzAxTEI4?=
 =?utf-8?B?amZZdXhpYlhXK2RIb25YdjJLdldxQkwvNVhWbjdqdGNXWkpublp2U2wveE0x?=
 =?utf-8?B?NEp4cndmdHZ4OFhqei95UWFUT05XUWZzSEpWa002b2EzdUZqUkpuY0xoWTNo?=
 =?utf-8?B?S1Y3eDcxcDZTU1I5eHd6VnVFWk1xVW5ONjlIUWFFS2NrMEdrTHFOczQwczRz?=
 =?utf-8?B?RkZDZ1NFVGpwZHkxQno4YnZTcHowMjZBbnV4OWFHVmFNUWM2VlVwZlNXVFlq?=
 =?utf-8?B?eGFKZER2c2ttakQ5QmNsdDZGOTBQZ1JJK2hQd3VQeVJpQjB5WTUwZHAvcm41?=
 =?utf-8?B?ZTRYTmV3NVkxbjFJcXNSSm5FcmZYRUk1NVRhdmlwaEV3aUdFYmhpNnV5dEdQ?=
 =?utf-8?B?dU9rNkpoVU5CbXJFQXBBeWduRXJiekk2SkZ2SDZ5YWNiR1cwU0hNRmtIMTVG?=
 =?utf-8?B?djAzZEZqNzg0aWdrT05uOUk5UGV5cEwyRk5VSkF1TzRUa3dOZ0YvdFBjRnAz?=
 =?utf-8?B?ektIL1lRenRLcEVjajVXbVBoWmZubmIyZXdlUnZTa0VraE4rcTM2bnFJVEQ5?=
 =?utf-8?B?bFdjdXlHQ3pNNWM1NlhYWHp6UW5kQmQwVUVmc01GeGJpeVBFY0VsakVtTEtV?=
 =?utf-8?B?YUNQQ3BlSm8wQjh1WGJiRGU2U3czclB4aGdBamVheTdxOGNiSXllb29IY3FS?=
 =?utf-8?B?UDdEZ21pL2xXM3R2R2dOVjhBT3k2dlhYdnFST0JtMU1IdDA0M2JiaVhjRkdO?=
 =?utf-8?B?aGhnSWsvR3YrK2RVa2JxT05oMFM5Nm1TUnFSYzBoVXo1OUhoOUZLYmo0ZzRQ?=
 =?utf-8?B?azZFcUpsM0hYMGQ4ZFMwL2R4RzdCU0JKV2ZyOW1SaFlxancrSG9mOFpOWUtt?=
 =?utf-8?B?MzdXdDg4ajVVUjlCd1BNSGhEcGpNVEY3Q3pGbEJiMG92OEFHTFZmV1l6ZWJN?=
 =?utf-8?B?cTltTVpFVjdPeXBpVHZmWWNBMkRFR09uZnpySHQwdFU4VUU1MjlyZmQvTTVs?=
 =?utf-8?B?dEw1bmR0dUV6M2lPbHF0R2Y2RGdqM0ExRFduZVNWZncvaHVZcjF1SjhLRE0r?=
 =?utf-8?B?USs3M0xuYkFsMm1NTVZqNDZGSkF2N2gxdFVGZVQ0R3drM1dQUTRsOFNzK2hZ?=
 =?utf-8?B?bUwvWWh5L1dESmI1QUFWUUxMM21uY0xocHg2cktZZHlIalNXbTdYWXF1OUoy?=
 =?utf-8?B?UmdrRzlRaTVNb3Y4eEtCSzJvSklZVXRjR2xlcUxWVVU3bHBjQk9wNWpqd2c3?=
 =?utf-8?B?YldKT28xTmwyaHduckpOb28wNVFta21lNGE1Y3diR29LVDVNNHhNSk0zMTVY?=
 =?utf-8?B?anRIdlRzRUFFa0VjRHRYR0tKWVZTZUtLdHpxTUVmdEV6anZpc1V4RmJaeFlk?=
 =?utf-8?B?R2VXNjhlUi9DMytTQ3VFM3RTc0VMUzlOTlhxZ3g0MlBvTlR3bFFUNW5leVRw?=
 =?utf-8?B?YkkwWjZTcG9KZitvVlNBMjU1a2t3bDBIUURjV29WVW9oYjdmUUVsMlFidUlh?=
 =?utf-8?B?aTRLQVRJSzFNbzFRWFplKzIwZU1HUTJDNDFyNHVIelNwKzNoSnVvaFdTT1Bv?=
 =?utf-8?B?T0s5eG1SWncvNUprMEI2djBpUDR0U09OQVVoS05YTnFCMW1hcUg5K2hVcWpL?=
 =?utf-8?B?UjNRdjRIRG04dXVzTWozS0RhdG1QQ3BSWXZVdVZVS3R0RG5XRndWNXZnaE1T?=
 =?utf-8?B?VldsQmhUNlZxbVlEaEE4aHNZd0Faa1dQQnc0ZHJVL3pqQ1E2RnR5SGZYV2hK?=
 =?utf-8?B?QjhmaUR5bEYrZzRRM2U2eG9HYkUwZHYrdXY1ajFTY1BUM1g1eEh0N3V0UGZH?=
 =?utf-8?Q?q5htgq4iSWaDs+jEk8IYa8LV7Tqel5DQ4xqyw9++GX7Zh?=
X-MS-Exchange-AntiSpam-MessageData-1: ae408mcj77KMog==
X-MS-Exchange-CrossTenant-Network-Message-Id: 53248f0d-d207-49d9-f96c-08da27a4b8c9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4894.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 16:49:25.5960 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QXLMeZGCkAmfvqLmimLFvvODDLviiVNLUPF5ncQSw1vHo/6D2oM+d9DhyY76M8wBUOsxHFRVAeVuGnozsP1P+7jiUlBnS9fa6s8PvE28YNgdhaCicMaLwwL7RZdJHvEK
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
Cc: Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, lucas.demarchi@intel.com, Chris
 Wilson <chris.p.wilson@intel.com>, siva.mullati@intel.com,
 David Airlie <airlied@linux.ie>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_memcpy_from_wc() performs fast copy from WC memory type using
non-temporal instructions. Now there are two similar implementations of
this function. One exists in drm_cache.c as drm_memcpy_from_wc() and
another implementation in i915/i915_memcpy.c as i915_memcpy_from_wc().
drm_memcpy_from_wc() was the recent addition through the series
https://patchwork.freedesktop.org/patch/436276/?series=90681&rev=6

The goal of this patch series is to change all users of
i915_memcpy_from_wc() to drm_memcpy_from_wc() and a have common
implementation in drm and eventually remove the copy from i915.

Another benefit of using memcpy functions from drm is that
drm_memcpy_from_wc() is available for non-x86 architectures.
i915_memcpy_from_wc() is implemented only for x86 and prevents building
i915 for ARM64.
drm_memcpy_from_wc() does fast copy using non-temporal instructions for
x86 and for other architectures makes use of memcpy() family of
functions as fallback.

Another major difference is unlike i915_memcpy_from_wc(),
drm_memcpy_from_wc() will not fail if the passed address argument is not
alignment to be used with non-temporal load instructions or if the
platform lacks support for those instructions (non-temporal load
instructions are provided through SSE4.1 instruction set extension).
Instead drm_memcpy_from_wc() continues with fallback functions to
complete the copy.
This relieves the caller from checking the return value of
i915_memcpy_from_wc() and explicitly using a fallback.

Follow up series will be created to remove the memcpy_from_wc functions
from i915 once the dependency is completely removed.

v2: Fixed missing check to find if the address is from system memory or
    io memory and use the right initialization function to construct the
    iosys_map structure (Review feedback from Lucas)

v3: "drm/i915/guc: use the memcpy_from_wc call from the drm" replaced by
    patch "drm/i915/guc: use iosys_map abstraction to access GuC log".
    New patch does a wider change compared to the old patch. It
    completely changes the access to GuC log using iosys_map
    abstraction, in addition to using drm_memcpy_from_wc.

Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: David Airlie <airlied@linux.ie> 
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Chris Wilson <chris.p.wilson@intel.com>
Cc: Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>

Balasubramani Vivekanandan (7):
  drm: Relax alignment constraint for destination address
  drm: Add drm_memcpy_from_wc() variant which accepts destination
    address
  drm/i915: use the memcpy_from_wc call from the drm
  drm/i915/guc: use iosys_map abstraction to access GuC log
  drm/i915/selftests: use the memcpy_from_wc call from the drm
  drm/i915/gt: Avoid direct dereferencing of io memory
  drm/i915: Avoid dereferencing io mapped memory

 drivers/gpu/drm/drm_cache.c                   | 99 +++++++++++++++++--
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |  8 +-
 drivers/gpu/drm/i915/gt/selftest_reset.c      | 21 ++--
 drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h |  2 +-
 .../gpu/drm/i915/gt/uc/intel_guc_capture.c    | 52 +++++++---
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c    | 77 +++++++++++----
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.h    |  3 +-
 drivers/gpu/drm/i915/i915_gpu_error.c         | 45 +++++----
 .../drm/i915/selftests/intel_memory_region.c  | 41 +++++---
 include/drm/drm_cache.h                       |  3 +
 10 files changed, 261 insertions(+), 90 deletions(-)

-- 
2.25.1

