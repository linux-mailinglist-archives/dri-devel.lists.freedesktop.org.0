Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8B484015E
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 10:25:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 825301127A4;
	Mon, 29 Jan 2024 09:24:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DA921127BE;
 Mon, 29 Jan 2024 09:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706520268; x=1738056268;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=30NCwSdDNG+iZlWBnxjxAJV00r3nuVljz+yxj7OJ4MI=;
 b=aBs6Tff3ozZGocgHAseH7ycn5JzrI36HEi/6M0WATU31y1I8QlYA8r/M
 uYyL43KsQc7/7OFaGoo7Xpg5MiAA5mI2iX4LxQE9XPdwlMfuZKvs7Es4r
 +kK95lnUkHp6ravb1VuSc2FyqCdV+qKpHwb6tBT72vRNsJJkigu1O6QGm
 jYSXu4pFdJ11dfEE3QNRljb4zQyIpO5klpwjCIHDKK/U3hnQJNs4rWeDn
 Tvh9CelsDRe33A/mUa5zcs/tDCHwxvr7EFMYUnXrb3SQxUdRD8uh/R581
 b20Ld+NLjFpH08rtNVG/GG9cYy5NCnoeSDmni3XSuukZmFL/JoChkSGtU A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="434065148"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; d="scan'208";a="434065148"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 01:24:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="931034744"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; d="scan'208";a="931034744"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jan 2024 01:24:24 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Jan 2024 01:24:23 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Jan 2024 01:24:23 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Jan 2024 01:24:23 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Jan 2024 01:24:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BeltPw1OYUkPmvAsQSiMUX5JcZuSiIB/qhIhKBcCse/AZKB7lwy8lPiNEG7WU31w8f4NRrOGZuHNi1LoGrCAWcOolJ52Smnq1s780uPa7NVXCFo3qjQZSP6VSMTo3u5s4Ic9Q/sxp0+nUZpVbSUYNCLfdqiWC8JS7ARsVxwRB0OmB9rXhNu+8S+oMhwF0SSjEbJLegn2ATvwiA8uTEpWdsYmoULzgB5cGX1FcZL22Df99yomqtAnUCQxyllJtm4nFns3Acn75BI9nWlezEi0uSAnidrWtQVberNOLr/1T9jCpC8ZZnQnVAFGL1oTuFiWbvhluKpeJGkF03l/Ld7g1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XUh0smvhF2t9QKql9IBy0s1ap5lZtkeA/iocIip/32w=;
 b=JqW6ek+6qvSmkwIh7QtxO0U7gimKr6CSuAQ00cIZmBhnp5fuA7phvAhiFmD7th/qqtcyEGAGaMnvpTh4RD8unE176Zf7Q0Dtl+n/iknDf1MlGjVASnzQ6Bl3vC+0cZnZkkY9GFHv39jd1I7DT87Ui3pFVjglZOcAvG+ud3r4geNLjFyQEzFRBWg5RK1qGP08X4xp99yOf8GVIf5xUBToarMFt2XolOmWihEWlW5qgDp2iQFcA3JxG/LZZlhLyEhwRPr9MHYOTZghIIOesewUIJWvu3OE7yJrSdGoNQG70qaIGCGtDuMGuxlzjuPzfHx4q34AhPmi9wxiiaJ+qQVh/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 BL3PR11MB6459.namprd11.prod.outlook.com (2603:10b6:208:3be::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Mon, 29 Jan
 2024 09:24:18 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::a8f5:a774:62a3:dd1e]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::a8f5:a774:62a3:dd1e%7]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 09:24:18 +0000
Message-ID: <7c180429-4d1c-4e7e-a769-088271508760@intel.com>
Date: Mon, 29 Jan 2024 14:54:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] drm/i915: Fix VMA UAF on destroy against
 deactivate race
Content-Language: en-US
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20240124125643.590072-5-janusz.krzysztofik@linux.intel.com>
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <20240124125643.590072-5-janusz.krzysztofik@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0131.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::16) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|BL3PR11MB6459:EE_
X-MS-Office365-Filtering-Correlation-Id: 78ba4114-765b-4526-3f32-08dc20ac11be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ju8Eor5OGTHxJL78bcnYmwisP98c1wfTp1hKvc+30sHOSyQ1ZShPbVO/S4t1KjzbExqanC9VfRXwtmSkZ3JbjQpk6avqRyq/pQOoXuv0dqzQbIBx3HrKmsDcOppjl4rHiPNnnF8kcBo0sR2XuP4goui3aox35qnL6qQf8LrWNlxxwzDZjisOgEMoq1gT2bTogycVz/l0D6rO/Ir+uQn03lA6QXU95q+n0K2UqIs7BVMg+dX8AxHAM/fFvPQg8WPJZOsCyqqzlniGpiXL31WttFMemyShymxDxx0hougv4fYP4Jxo5EJF9AMcvUETGoxViMDgOV3Ij/X0HC6ghi9gWKZ4AaX55lwb9hLZKw2yUzyPeDaClnFUQ5GD+4W/cEA93hdOgoKB9H003geYFLO7Ml/11bY9R0QA1EwLulLmp638Q/w5DCMsrtkkmHJ9AuozyDefn7727ivmQBqXpIaCuA8q7RqtnVPKpW+wkaio0aZbXMLabg3V7LcL4uXYDPoLRYsL00+++xKRRRDyMZWTuTZSRwK8w9zHGEvgHcbBDXaCVzgfFYNLF6EqayY++fS1yeVj4884k38bTydY9THu7PYRRq6MyZ/r9Pg38b2u/uyoHXAb3kje3mEbRe7wsoHHltnbwgRxb1IR+oOITBXoSCNLa8519QPScvCh3tU3T1w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(39860400002)(136003)(396003)(376002)(230173577357003)(230273577357003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(66946007)(7416002)(4326008)(54906003)(66556008)(316002)(66476007)(8936002)(8676002)(26005)(83380400001)(31686004)(478600001)(82960400001)(6666004)(31696002)(38100700002)(6486002)(86362001)(2906002)(5660300002)(44832011)(966005)(6506007)(6512007)(2616005)(53546011)(36756003)(41300700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZE9KWGxuTzBtY0ZMVVBuU3BMMFVuaDN2OUJwSmFjTlN4SjRGdWVkU1hXeURE?=
 =?utf-8?B?UkF3NmFOVk1oeEJTWU5rUmo4cVRHZHJNbnlkV0FjdFBjTDkzdHBsUEVXa2RH?=
 =?utf-8?B?ZFdNbTJTT3NvWWZTcS9TK25QdG1NbU1GTjBxZlRTVDRXMTRxUmV3OEtlR2hX?=
 =?utf-8?B?Q3pnYXVHeGFEVjIxUlQvRW9NRmZwSnFYQzlOczNvUThZOVRxUEZuRm0vV1hI?=
 =?utf-8?B?QUM5alROQit2NVRVUG1kTFM2WnZ0NWVoWnFXeG5RVVo4Y2IvQzdaaHlzclht?=
 =?utf-8?B?bmhvQTdkOGZkNllUZkx4UVl3T3dudmV2U0EvNktJcG9RaVJ3VkM1NWYxWkNu?=
 =?utf-8?B?bmpIeXE2STRxL1VZWVloM0dVN25WY2crNFZibGdRZThBS0MzNUpueFNRWU92?=
 =?utf-8?B?VzVtNEZRd2NxYTJkZDFEQkVYT2NFb2Flb0NPc0lIMUJ6R1g4S0UyRmZ1dmZt?=
 =?utf-8?B?c1FLdktsUVB6MitjdW1BckN0NVFlU01UUTRhUG56L256R3RiTTJWS0FMZURS?=
 =?utf-8?B?d21UVXV5dTAxS1oydktSUTlvYjVYWnoxZ3VlOCs3UHpnZHJYZGhOcjk0a1RO?=
 =?utf-8?B?a3g2aWNyaFNHZ1dmSHpHWFpkb3MzRVEzVUpub3ZaTHFWMDYrcTZ4UWNmcjhH?=
 =?utf-8?B?RTNmanl0NzdRTjhmK2xCaFJja0I3YzZIbk4zVFJLNlhXYmtLR015Zit3b0NS?=
 =?utf-8?B?aDlFb0xISDhMQ2luNDI2bkRkbUdZWnlmYXNRYmR3VUt5TVV6Tk83L3VkdzFJ?=
 =?utf-8?B?UWdEZ0d4cjRSNC9xYjZlWUtDQVhSUXVBTnhyMjQyTmxRTU5IbzFIcVMrK0tG?=
 =?utf-8?B?SUg5UTM1SktRSWd5dWVpMzl2cTAwUzZJNEtCNnlnOVI5bjdVUmxFN3lkcmo5?=
 =?utf-8?B?dnJLUzh6UUlZdjIxODJrcTVPbG9lblFoc2ZHOE84bjhTalFnT01VU1MxcVRK?=
 =?utf-8?B?UHBQK2hIOXRBSjA5Qy8xMmowVkY2bUl5aFExVDYzNndIbk53a1ZjdXdXNkN5?=
 =?utf-8?B?cFVGZmNmbFBTY0xpTGxJbmhsOXRsNUtDMTRHWVoyZFlVdnc4WWZibktwek9x?=
 =?utf-8?B?THZsNGF6MW9LSHgvYU9Ubm5JMFJSWndYc1FzZGdDa1FxdFA3ZktNdUt3dzZj?=
 =?utf-8?B?UEtEMzN5QUxxSFBDd01GNG1WbithNGdNME1pNkZxSUphVVlVQ2VJT3hSTFNT?=
 =?utf-8?B?K1lxclJUcS9oUmZRVHJMNDRYOE00NndNVUdCRjBBMGhsSGRkZlpNaHl3UU9p?=
 =?utf-8?B?MHlrcTQyeE44U1pocnZWWTZIK3kyMktzbnl2d2ZqaDR6MFJpQVArckR1VENR?=
 =?utf-8?B?a3VOSVoveWVNRnl6aEttdk9FWmxzbWtJc2QyQnEybGlOTGpTYlBpVWZvWWNY?=
 =?utf-8?B?V3pYZVlodUdaN2R0a2t4NTdtLyszdTFsUWx1R0JQS2loNzI3WitOeWtWak5Y?=
 =?utf-8?B?YU42d2NtRjNETjJPOTlkUTE0YnpuUHZXVWJJWUFqVEhvWm15QUthM1MzaXRL?=
 =?utf-8?B?RDExb0hOWUUwcE0zMTRLTUhiOTk1by9KZFc2M1hBVGl1bEt3Q1d1OXN2U01m?=
 =?utf-8?B?ajJ2MlNPZkEramFFaXFUdkZxTjE3NUkrMHN0R2REczZCU090cmUzVUFXc3ho?=
 =?utf-8?B?SUVteGVKaDJiREN1ZU82RlZCdXozUWVFbmx1LzJIMzZJcW5WcU1qQjlNdnc5?=
 =?utf-8?B?QWNtdXY5QUY2RkhpYlZWeW1qeDNhelpSd3I1bStKdTVuOFRFTU1KSFZ5SVF4?=
 =?utf-8?B?U3hQYndGTmllY1NzSUY0U0txOVlkU2ZaRFJVN05wWkpVcGUyeEVsQnl4aGZp?=
 =?utf-8?B?Vmt4K2xkbUcvbWdSSWtqWnFuWEFTMFhrZ1JIb2ZqRHBZUnBrT1A0RkhYL29D?=
 =?utf-8?B?NTQ3NHRpUEg0L1k2SEh6RXU5dk1JL3laUzE1U1VUTWVWWWpZcUFWR213dnVS?=
 =?utf-8?B?RStqTmtWcjM3aGJWVGJPczg1cDhIaHpJRzFNVkFIV3N1eVBQSFNkbDFTM1ND?=
 =?utf-8?B?ZUNIQVAyV2lTM2dYZVZEU2poZkFmNGZBMHFlbUNnZVJ0Q1JxNnluSys1d3RC?=
 =?utf-8?B?VnA4K3JvV2hRNG9XVWkzUjlhWURGWDQ4U2ZKR3UwM0JGeXh4SW15ZFJXZ1p5?=
 =?utf-8?Q?rFgZ1NraYR55fNDE85n1Ous5b?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 78ba4114-765b-4526-3f32-08dc20ac11be
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 09:24:18.7493 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HuBh9wDoJtiDpELgU0SOAY8JhYxOC39X74ReOmHYc32rVnFWvNA86Kcf2F2Bncf9VUvQW378ZfTRU62AxlHZjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6459
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
 Andi Shyti <andi.shyti@linux.intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Janusz,

There seems to be a regression in CI related to this:

https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129026v2/bat-dg1-7/igt@gem_lmem_swapping@random-engines@lmem0.html#dmesg-warnings1053

Please have a look.


Regards,

Nirmoy

On 1/24/2024 6:13 PM, Janusz Krzysztofik wrote:
> Object debugging tools were sporadically reporting illegal attempts to
> free a still active i915 VMA object when parking a GT believed to be idle.
>
> [161.359441] ODEBUG: free active (active state 0) object: ffff88811643b958 object type: i915_active hint: __i915_vma_active+0x0/0x50 [i915]
> [161.360082] WARNING: CPU: 5 PID: 276 at lib/debugobjects.c:514 debug_print_object+0x80/0xb0
> ...
> [161.360304] CPU: 5 PID: 276 Comm: kworker/5:2 Not tainted 6.5.0-rc1-CI_DRM_13375-g003f860e5577+ #1
> [161.360314] Hardware name: Intel Corporation Rocket Lake Client Platform/RocketLake S UDIMM 6L RVP, BIOS RKLSFWI1.R00.3173.A03.2204210138 04/21/2022
> [161.360322] Workqueue: i915-unordered __intel_wakeref_put_work [i915]
> [161.360592] RIP: 0010:debug_print_object+0x80/0xb0
> ...
> [161.361347] debug_object_free+0xeb/0x110
> [161.361362] i915_active_fini+0x14/0x130 [i915]
> [161.361866] release_references+0xfe/0x1f0 [i915]
> [161.362543] i915_vma_parked+0x1db/0x380 [i915]
> [161.363129] __gt_park+0x121/0x230 [i915]
> [161.363515] ____intel_wakeref_put_last+0x1f/0x70 [i915]
>
> That has been tracked down to be happening when another thread is
> deactivating the VMA inside __active_retire() helper, after the VMA's
> active counter has been already decremented to 0, but before deactivation
> of the VMA's object is reported to the object debugging tool.
>
> We could prevent from that race by serializing i915_active_fini() with
> __active_retire() via ref->tree_lock, but that wouldn't stop the VMA from
> being used, e.g. from __i915_vma_retire() called at the end of
> __active_retire(), after that VMA has been already freed by a concurrent
> i915_vma_destroy() on return from the i915_active_fini().  Then, we should
> rather fix the issue at the VMA level, not in i915_active.
>
> Since __i915_vma_parked() is called from __gt_park() on last put of the
> GT's wakeref, the issue could be addressed by holding the GT wakeref long
> enough for __active_retire() to complete before that wakeref is released
> and the GT parked.
>
> A VMA associated with a request doesn't acquire a GT wakeref by itself.
> Instead, it depends on a wakeref held directly by the request's active
> intel_context for a GT associated with its VM, and indirectly on that
> intel_context's engine wakeref if the engine belongs to the same GT as the
> VMA's VM.  Those wakerefs are released asynchronously to VMA deactivation.
>
> In case of single-GT platforms, at least one of those wakerefs is usually
> held long enough for the request's VMA to be deactivated on time, before
> it is destroyed on last put of its VM GT wakeref.  However, on multi-GT
> platforms, a request may use a VMA from a GT other than the one that hosts
> the request's engine, then it is protected only with the intel_context's
> VM GT wakeref.
>
> There was an attempt to fix the issue on 2-GT Meteor Lake by acquiring an
> extra wakeref for a Primary GT from i915_gem_do_execbuffer() -- see commit
> f56fe3e91787 ("drm/i915: Fix a VMA UAF for multi-gt platform").  However,
> that fix occurred insufficient -- the issue was still reported by CI.
> That wakeref was released on exit from i915_gem_do_execbuffer(), then
> potentially before completion of the request and deactivation of its
> associated VMAs.  Moreover, CI reports indicated that single-GT platforms
> also suffered sporadically from the same race.
>
> I believe the issue was introduced by commit d93939730347 ("drm/i915:
> Remove the vma refcount") which moved a call to i915_active_fini() from
> a dropped i915_vma_release(), called on last put of the removed VMA kref,
> to i915_vma_parked() processing path called on last put of a GT wakeref.
> However, its visibility to the object debugging tool was suppressed by a
> bug in i915_active that was fixed two weeks later with commit e92eb246feb9
> ("drm/i915/active: Fix missing debug object activation").
>
> Fix the issue by getting a wakeref for the VMA's GT when activating it,
> and putting that wakeref only after the VMA is deactivated.  However,
> exclude global GTT from that processing path, otherwise the GPU never goes
> idle.  Since __i915_vma_retire() may be called from atomic contexts, use
> async variant of wakeref put.  Also, to avoid circular locking dependency,
> take care of acquiring the wakeref before VM mutex when both are needed.
>
> Having that fixed, stop explicitly acquiring the extra GT0 wakeref from
> inside i915_gem_do_execbuffer(), and also drop an extra call to
> i915_active_wait(), introduced by commit 7a2280e8dcd2 ("drm/i915: Wait for
> active retire before i915_active_fini()") as another insufficient fix for
> this UAF race.
>
> v5: Replace "tile" with "GT" across commit descriptions (Rodrigo),
>    - reword commit message and description of patch 2 reusing relevant
>      chunks moved there from commit description of patch 1 (Rodrigo),
>    - explain why we take a temporary wakeref unconditionally inside
>      i915_vma_pin_ww() (Rodrigo).
> v4: Refresh on top of commit 5e4e06e4087e ("drm/i915: Track gt pm
>      wakerefs") (Andi),
>    - for more easy backporting, split out removal of former insufficient
>      workarounds and move them to separate patches (Nirmoy).
>    - clean up commit message and description a bit.
> v3: Identify root cause more precisely, and a commit to blame,
>    - identify and drop former workarounds,
>    - update commit message and description.
> v2: Get the wakeref before VM mutex to avoid circular locking dependency,
>    - drop questionable Fixes: tag.
>
> Janusz Krzysztofik (3):
>    drm/i915/vma: Fix UAF on destroy against retire race
>    drm/i915: Remove extra multi-gt pm-references
>    Revert "drm/i915: Wait for active retire before i915_active_fini()"
>
>   .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 17 -----------
>   drivers/gpu/drm/i915/i915_vma.c               | 28 +++++++++++++------
>   drivers/gpu/drm/i915/i915_vma_types.h         |  1 +
>   3 files changed, 20 insertions(+), 26 deletions(-)
>
