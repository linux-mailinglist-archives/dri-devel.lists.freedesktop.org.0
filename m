Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F345AE5B5
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 12:44:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A949410E614;
	Tue,  6 Sep 2022 10:44:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2557510E611;
 Tue,  6 Sep 2022 10:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662461080; x=1693997080;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RKchZDmp3VAtKGBh3uBzAnKgVz5mkC7YhRGImOAvv7A=;
 b=kLi5MoGiQJtUD/Wk+LRjJ/HzSrWhZccvicZa6GINMKWzvKy6w/srbk6S
 1L3QQEdr5tRsXbWo0kN181tpBelZbhqL9T0nd7MTZDHhodW4TWmxSaoU+
 A9bh+MhWxi7P5JtYM/qSDWxNwmttJwtNGhhfiYtMTMEIFa4/qUzEJJTLd
 OK4Pd08mqxDHTflErIN30NCmGZyx/2wMqaMdhU3wvBR/bUFRF46DFxZPY
 aORJGLAF27RQrUtHkmxzbcegfnZdtZXGCkO2SIkTg3wJ2GGOWq4jwtt1Q
 5DcCXjdeB3QLMubDImRvBH7T6H2tzcHD7FcJelKkcBud9bQQrrNRBPrDZ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10461"; a="297874681"
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; d="scan'208";a="297874681"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2022 03:44:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; d="scan'208";a="859218639"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 06 Sep 2022 03:44:33 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 6 Sep 2022 03:44:33 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 6 Sep 2022 03:44:33 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 6 Sep 2022 03:44:33 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 6 Sep 2022 03:44:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CQkIHBX6ytzOsoOHZJ+bWebyU+5sJ6WoauIJRiFLXuRCETtZf5H5ERbKKYYxONeUZF9RN0cefDGoM7+5muNf1MawUjjOfaUCdGqv/3P2w049wzFyi2w2qnUdVooEpJjZZLqU5oCxygPcdQgFId6TASyoS2fFpDyq+6RpmQ+YrCCmdSYsx10aiVnxUJ3bJnvCVnzf/JWkUWHg2ISEf11/YE3JLd0CI49aOfjzYYO2do1W9gniiipumieeFiuBq7tdW9D5E6TsCNrV0JOvHYn3bDe21S8bA09l4hfiXpH7jU6ueZ4ACtgQlOiXrXk+g4U14s1hwMDTPfOJk4el2y5/Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n0XOFBLlx9M5Bdl7hu721eo7rPRgllqa4cdpxTbLWWM=;
 b=cfc5ayZYlERSeCKuMsm8tjzte83i1SICwAD7tMJZXl1ASaWYyvM5WWKfbnzibME5UzEHLT3RmQhcb19c1RREdc0jqyENFEK+IWnbhy6di6C7n2tdJ0EME4StLTF/6bA45Ob5LxFove9UDxzaFm0lFRRsDaujMvc9nrfeFCLh0U7V7bbrGeOmsUvuaa+oEFm7E3zAkRsymUlMrGOpSWwTgxCWChAVacF/KoIWj7cBd1mfiNzo3TSk0/dEmotoLq160mUIAPYhGIsZXfOdw8G0zmiq6rilTY5aH7eGV6NAkDZ/re/O43KGEf5/rNjAMRaaC7yC7eoMCVhmWsSPqe0oeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by SA2PR11MB5195.namprd11.prod.outlook.com (2603:10b6:806:11a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Tue, 6 Sep
 2022 10:44:31 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::2002:c040:4ffa:48a7]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::2002:c040:4ffa:48a7%4]) with mapi id 15.20.5588.018; Tue, 6 Sep 2022
 10:44:31 +0000
Message-ID: <678e32f7-e4e6-3f75-09f9-9d61675cb3ba@intel.com>
Date: Tue, 6 Sep 2022 16:14:21 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.0
Subject: Re: [Intel-gfx] [PATCH v2 09/12] drm/i915/uncore: Add GSI offset to
 uncore
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
References: <20220902233257.3088492-1-matthew.d.roper@intel.com>
 <20220902233257.3088492-10-matthew.d.roper@intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <20220902233257.3088492-10-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0193.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::22) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 01aaf87d-9095-4d7a-808b-08da8ff4c78e
X-MS-TrafficTypeDiagnostic: SA2PR11MB5195:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pUFoKKZIM+aV8pgF7cq4z+G+TYiHk4AjGmP+m9FfG57AkTsaWnRc35c9EW6Y0dSxqJgArHGGbNH9jGGSlnfOPRv/gCDGX+WufZ0QfS7TrXYQo5XPbKGWcAKCSQrr0t2WjWYMP5sFUrUXGjUIPONtqT1KLEGalYJwdo5bNj3k0a6ll5BgfXNKVnhXl+whEy8CIV2aDccx035i4EdAX33K5htWcnsezXy7xWf1ZZnHl1SxeWIeyg8XR0SexWEpm9zb6ExDgCEnIFc3uYH2zRjbhPedzODMV6W8P/eCwySCrPuQTSSrjxHqnRx4xhBM3U9iZ48pu5WTKhS/Z/ozRyPh6/RZQ+/sNrTd+n8M5h4aIoqx02zC6jT1oQw/V102xttT470nH2BNrzPTBcfea3qHf9W4S8CoGlxjo35EMWkys4NvH7HD2f9oWM9vkUM8wQN6+XAiqkGPwsS9EwjKhXmWKbMpjbFq13A8cz3L7a4cKCBLWuwaS8dmVVuMbCgHefpwapErHc/owYHwzisQadgP2cK9vCaUnaIcdWYqJmAj/PwdWuNbdrbu/mCJLon9ibHL6EaDHAIb6ZkvBpdW91f17Cu6zVfbnZK5rwD9rKE97SKZ7xHldqYcJjerjZ4eIGAaJbAcXmFh6oWkIUe5isvGrWA1yW3X45z2BAHP4yztEgO9ssroK9RzmcEgGqOmnfFt+f/rjCYrsXV+YCTIfE6e2O+CMzJncFe5HY2ai4onAgYIdpwAF/SOqf3vuNFB2hkvMDOvHLLF7zpah7b2d0cvmJUHP8gwqlITOykot7pelzA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(396003)(346002)(136003)(39860400002)(376002)(2906002)(5660300002)(36756003)(4326008)(8676002)(66476007)(8936002)(66556008)(450100002)(316002)(66946007)(6666004)(6506007)(86362001)(31686004)(478600001)(41300700001)(31696002)(6486002)(38100700002)(186003)(2616005)(53546011)(6512007)(26005)(83380400001)(82960400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEdhaFQ2Vm91WkZ1UjVKZ0E3VWVpaTZCWWxTb2U0Zmp2dWNaU0g0aU5BNW4x?=
 =?utf-8?B?RFVPTXpMRXFuMHpIeTNiaEEvWkwxaWtuNTYzaFYrMmJ1SUJHM1RUYUpyUjBz?=
 =?utf-8?B?d05ROUtQcXl5OUZERUV4SHZaTlNLT0NFbjhvaUFVemtQL2t4QW1PbzhZczR2?=
 =?utf-8?B?bU1ORkJyTGFVNldyNmoycURDa3JSdjhtT2s3OTdSWEIvZUYxQTF3ZVY0Yk9z?=
 =?utf-8?B?L0ZwcTA3Si9tRnhBZ2x2ZEpOd1FiUU5uQVh5SlNGSUdIZUt4cy9NMFlzT3Uw?=
 =?utf-8?B?MS9XRmU3V1ZzVmQ2TUVMR2VBNmdyN3VXcko5c1IvQlQwMGZ3ZjdtMnlGMGxF?=
 =?utf-8?B?bXJuNU5QcUdZVnJLSTRzdjdYVWNaMXZ1ek5XaHV5Ni9pUmxsR2ltVHlqUmZX?=
 =?utf-8?B?TlBidTFUNWVQdmV2SkFPQm1sSklVbHJUMkUxRnJSUHNQa2o3ZUU3K2RyM2Zv?=
 =?utf-8?B?MGMyRjJ0T3MzK2tCeWE0VzBsUXVpUFBrM25MeTVlRml2dElkL2E2ZVhiMHE3?=
 =?utf-8?B?M21yb1djaStTcndMNWtjaEZkdEJYTHZJa0VtSTN3NmdoQUZqZy9HUTVaNW14?=
 =?utf-8?B?R0VlZnFsRzNQVW9ubXJNK2ZPQmJLZ1podGZqNjhNWGp4QnlmNW9JN05SLzlT?=
 =?utf-8?B?cStOZGRqeW9GUkpXdWtZYjdrUTZkTlZWVForM0lhMzFEZkIzVitkQTByT2dT?=
 =?utf-8?B?b05kdytSMkFGUVE1SVZLSTRSSWZVK1VQZjVvU0tNc3FFOTJpL083a05qN1Ev?=
 =?utf-8?B?NUxzeDdLOVJ6VjUwMzhscGNPTFVRcVR1MGsvc2JLVGZZK1ZsQmJ4cHVLREhE?=
 =?utf-8?B?cDhScjZVYXNJb01tMjI3ZjhXK2lIME5LQnFBVE9WOEh6TWwwS0JyRkxHdWtY?=
 =?utf-8?B?L2xWdm9RcjZSbnMxeFdKOE9aRmRLR3BaRnhQTzMxUlV5clEzbjNLM01rc29Q?=
 =?utf-8?B?QTE4N2hzczVSYloyNDJzbjVJamJXM3ZVL2haRzhlcjRIRVhxcG9Ta2RET1Ew?=
 =?utf-8?B?MzVTZWQ2NXlqUTJtVTN6UXhldjJxcGl5cmVOYlM5Q3RpMTZOeE5YaE1EcXNB?=
 =?utf-8?B?a0FLTzJjWTJhYjY1V1Qzbk9aSFR5NHJtOEo1d0g3NVhjdzczYUE0K0hGS1FL?=
 =?utf-8?B?TDR3eENwQ0I1Z1BLSTBhbXE3VkNQbDhLamJWTlZ4ZEJjSkFyd2lIWThVRGtR?=
 =?utf-8?B?aVFGTi9QazlyT1I3Tm5sdnZ0aW9vWkZ5RlViRkRJR05WU0s2b2Q0d0dJTUo1?=
 =?utf-8?B?Nmo1b0VUdWt1WWJnY0xuekkyVnZ6bG03ZHJVRDAxNE5HWDBzUHFoNnlzZXZr?=
 =?utf-8?B?ZGJvQUZlOG1QSFc1am1wWEFzQ1g1bFhRUXgxVFFFR1VlcUZRdEIvWDlEOXVH?=
 =?utf-8?B?cjF3SGxrWHFtNHRaYWVVRmpXWFRSNXVvcEVXb0hiZXdadFVGSDVmKytLSGNx?=
 =?utf-8?B?clBpeVZrRlI1R3cyWmhmdDZuQXhObjFhbzZwQVNUS2ZVc3RobGRJNlU2M0E0?=
 =?utf-8?B?ODVvdUNJQmZSYjFLRlM1YWxTcVFnak9XbWdDOUJaTlBNQmxWR2hTQUF0Q29o?=
 =?utf-8?B?ZzdBNnYvdTR5eWdKWW80c2ZnWjFFRGpWa2RZY0dGVExjTWgrUHNUd3hDZnda?=
 =?utf-8?B?UDhlWkxkYSs5V1k3M3BnaUt2UEZFbDcyYXZZVzhNNHFrWlA0YUZoQzhrTkNV?=
 =?utf-8?B?aGl2TW9hcWk3NjFqL01kcmVFZEVUSWMzTUpQVFJxdzFHVC9kWU00WG9adVo3?=
 =?utf-8?B?SGhSS2l4WVhENGI2cmRkbnR6MkJMZy9YdXNrM2JTY3MwQVBycXA4a2tNL1VN?=
 =?utf-8?B?S2NXV0FrSkFseSs4eERBR0JzeGZaNThPVGdoVXVWWG9VeUhNeEVvOUtSR09W?=
 =?utf-8?B?dWRML0hvK0pEOVJmNldwN0JMVk9BR2YwMThFV1BsMHdhNmE4YlJ6U0lHMm5N?=
 =?utf-8?B?a2RaZWlHVjF2bEUzQVMvbW9yWGhFaE9xWTQxZmlrOXlTbE1sR0JmL0hUMUJH?=
 =?utf-8?B?N1ViUHY5a2J5eEdDSXpVQjVaZnZsTFJtYUVlVzRVMG4rWmZ1K1BVMUNORXoz?=
 =?utf-8?B?ODJuWGNqWnNaSlFBU1k5ajREdnhOd3dQVDI4Q293MmtFRSt0QlNydVRvQVc5?=
 =?utf-8?B?aEpzMmdwWjRNci9ZRVZmWXlYendoMUVhYXRlUkRYM0EwOUlDQmJvRHdMZVQr?=
 =?utf-8?B?Nmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 01aaf87d-9095-4d7a-808b-08da8ff4c78e
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 10:44:31.2749 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fltscFc5uM8Rx57/5SdsBHib1ZB7KL8X3E96J+1Cr6xO4QZh5MFFA+F7RF853gLb2RI3i9Vgr5gtlDWpwcdmepwuoeA+tby9BvGuc5I3u0U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5195
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 03-09-2022 05:02, Matt Roper wrote:
> GT non-engine registers (referred to as "GSI" registers by the spec)
> have the same relative offsets on standalone media as they do on the
> primary GT, just with an additional "GSI offset" added to their MMIO
> address.  If we store this GSI offset in the standalone media's
> intel_uncore structure, it can be automatically applied to all GSI reg
> reads/writes that happen on that GT, allowing us to re-use our existing
> GT code with minimal changes.
> 
> Forcewake and shadowed register tables for the media GT (which will be
> added in a future patch) are listed as final addresses that already
> include the GSI offset, so we also need to add the GSI offset before
> doing lookups of registers in one of those tables.
> 
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt.c       | 17 ++++++++++++++---
>  drivers/gpu/drm/i915/intel_device_info.h |  4 +++-
>  drivers/gpu/drm/i915/intel_uncore.c      | 10 ++++++++--
>  drivers/gpu/drm/i915/intel_uncore.h      | 22 ++++++++++++++++++++--
>  4 files changed, 45 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index fbb5e32979a4..a6ed11b933eb 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -776,10 +776,20 @@ void intel_gt_driver_late_release_all(struct drm_i915_private *i915)
>  	}
>  }
>  
> -static int intel_gt_tile_setup(struct intel_gt *gt, phys_addr_t phys_addr)
> +/*
> + * Note: the gsi_offset parameter here isn't used, but we want to keep the
> + * function signature equivalent to gtdef->setup() so that it can be plugged
> + * in when we enabled remote tiles in the future.
> + */
> +static int intel_gt_tile_setup(struct intel_gt *gt,
> +			       phys_addr_t phys_addr,
> +			       u32 gsi_offset)
>  {
>  	int ret;
>  
> +	/* GSI offset is only applicable for media GTs */
> +	drm_WARN_ON(&gt->i915->drm, gsi_offset);
> +
>  	if (!gt_is_root(gt)) {
>  		struct intel_uncore *uncore;
>  
> @@ -832,7 +842,7 @@ int intel_gt_probe_all(struct drm_i915_private *i915)
>  	gt->info.engine_mask = RUNTIME_INFO(i915)->platform_engine_mask;
>  
>  	drm_dbg(&i915->drm, "Setting up %s\n", gt->name);
> -	ret = intel_gt_tile_setup(gt, phys_addr);
> +	ret = intel_gt_tile_setup(gt, phys_addr, 0);
>  	if (ret)
>  		return ret;
>  
> @@ -865,7 +875,8 @@ int intel_gt_probe_all(struct drm_i915_private *i915)
>  			goto err;
>  		}
>  
> -		ret = gtdef->setup(gt, phys_addr + gtdef->mapping_base);
> +		ret = gtdef->setup(gt, phys_addr + gtdef->mapping_base,
> +				   gtdef->gsi_offset);
>  		if (ret)
>  			goto err;
>  
> diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
> index b408ce384cd7..85e0ef0e91b1 100644
> --- a/drivers/gpu/drm/i915/intel_device_info.h
> +++ b/drivers/gpu/drm/i915/intel_device_info.h
> @@ -254,8 +254,10 @@ struct intel_gt_definition {
>  	enum intel_gt_type type;
>  	char *name;
>  	int (*setup)(struct intel_gt *gt,
> -		     phys_addr_t phys_addr);
> +		     phys_addr_t phys_addr,
> +		     u32 gsi_offset);
>  	u32 mapping_base;
> +	u32 gsi_offset;
>  	intel_engine_mask_t engine_mask;
>  };
>  
> diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
> index 33bdcbc77ab2..ecb02421502d 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.c
> +++ b/drivers/gpu/drm/i915/intel_uncore.c
> @@ -927,6 +927,9 @@ find_fw_domain(struct intel_uncore *uncore, u32 offset)
>  {
>  	const struct intel_forcewake_range *entry;
>  
> +	if (IS_GSI_REG(offset))
> +		offset += uncore->gsi_offset;
> +
>  	entry = BSEARCH(offset,
>  			uncore->fw_domains_table,
>  			uncore->fw_domains_table_entries,
> @@ -1142,6 +1145,9 @@ static bool is_shadowed(struct intel_uncore *uncore, u32 offset)
>  	if (drm_WARN_ON(&uncore->i915->drm, !uncore->shadowed_reg_table))
>  		return false;
>  
> +	if (IS_GSI_REG(offset))
> +		offset += uncore->gsi_offset;
> +
>  	return BSEARCH(offset,
>  		       uncore->shadowed_reg_table,
>  		       uncore->shadowed_reg_table_entries,
> @@ -1994,8 +2000,8 @@ static int __fw_domain_init(struct intel_uncore *uncore,
>  
>  	d->uncore = uncore;
>  	d->wake_count = 0;
> -	d->reg_set = uncore->regs + i915_mmio_reg_offset(reg_set);
> -	d->reg_ack = uncore->regs + i915_mmio_reg_offset(reg_ack);
> +	d->reg_set = uncore->regs + i915_mmio_reg_offset(reg_set) + uncore->gsi_offset;
> +	d->reg_ack = uncore->regs + i915_mmio_reg_offset(reg_ack) + uncore->gsi_offset;
>  
>  	d->id = domain_id;
>  
> diff --git a/drivers/gpu/drm/i915/intel_uncore.h b/drivers/gpu/drm/i915/intel_uncore.h
> index 4acb78a03233..7f1d7903a8f3 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.h
> +++ b/drivers/gpu/drm/i915/intel_uncore.h
> @@ -136,6 +136,16 @@ struct intel_uncore {
>  
>  	spinlock_t lock; /** lock is also taken in irq contexts. */
>  
> +	/*
> +	 * Do we need to apply an additional offset to reach the beginning
> +	 * of the basic non-engine GT registers (referred to as "GSI" on
> +	 * newer platforms, or "GT block" on older platforms)?  If so, we'll
> +	 * track that here and apply it transparently to registers in the
> +	 * appropriate range to maintain compatibility with our existing
> +	 * register definitions and GT code.
> +	 */
> +	u32 gsi_offset;
> +
>  	unsigned int flags;
>  #define UNCORE_HAS_FORCEWAKE		BIT(0)
>  #define UNCORE_HAS_FPGA_DBG_UNCLAIMED	BIT(1)
> @@ -294,19 +304,27 @@ intel_wait_for_register_fw(struct intel_uncore *uncore,
>  					    2, timeout_ms, NULL);
>  }
>  
> +#define IS_GSI_REG(reg) ((reg) < 0x40000)
> +
>  /* register access functions */
>  #define __raw_read(x__, s__) \
>  static inline u##x__ __raw_uncore_read##x__(const struct intel_uncore *uncore, \
>  					    i915_reg_t reg) \
>  { \
> -	return read##s__(uncore->regs + i915_mmio_reg_offset(reg)); \
> +	u32 offset = i915_mmio_reg_offset(reg); \
> +	if (IS_GSI_REG(offset)) \
> +		offset += uncore->gsi_offset; \
> +	return read##s__(uncore->regs + offset); \
>  }
>  
>  #define __raw_write(x__, s__) \
>  static inline void __raw_uncore_write##x__(const struct intel_uncore *uncore, \
>  					   i915_reg_t reg, u##x__ val) \
>  { \
> -	write##s__(val, uncore->regs + i915_mmio_reg_offset(reg)); \
> +	u32 offset = i915_mmio_reg_offset(reg); \
> +	if (IS_GSI_REG(offset)) \
> +		offset += uncore->gsi_offset; \
> +	write##s__(val, uncore->regs + offset); \
>  }
>  __raw_read(8, b)
>  __raw_read(16, w)

Looks like the gsi_offset shall be added in gen12_emit_flush_xcs for
aux_inv case as well.

Thanks,
Aravind.
