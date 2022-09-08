Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A69BD5B299D
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 00:53:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9127B10E79D;
	Thu,  8 Sep 2022 22:53:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F2A710E73A;
 Thu,  8 Sep 2022 22:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662677598; x=1694213598;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vN4sSSn647xZTMKYRA1yePVA8bSe+vAaekBjOexo2B8=;
 b=PgMRhHEWGDtta0b0yZ/QVg/cGhiNTgsYq3IDYTEhbGH05vFN0H7v8jzJ
 AOOO6MsxQdoFrJOYikcaCWg0oudHmSQZ1+iS1kjpj0kqiojo7GRe3cEhe
 aM5UEg7xpEkVA0gkO+2p/9YeLLLP11B2mtHuUCCEiXJHAvPQ6jfChKtlv
 tZvObJig1agoYC68/iiEtlmN7ku2xXAYxn85ezDGMzdkOhobuGBDwxKe/
 6PnzQjVE3caFvYeaCP8idafEzoj1JUmvgD6aJWW97fytzyF6TdO+dHyBw
 qxg/6DvlfhpphYD3HH/fs29RLPZ5U9Ek7KFjzz7tjKso+9QcGCNWm/RNq Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="361300891"
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="361300891"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 15:53:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="683417219"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP; 08 Sep 2022 15:53:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 15:53:16 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 15:53:15 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 8 Sep 2022 15:53:15 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 8 Sep 2022 15:53:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G88SafhKJtbwEpPQxMVeXCetl1xE8YFM+qecrw2/aCB9AW7PH5S/QMq7TSW5j70NPA8ZxNmHopNDsR3CkT26Ifa3z3xCs/rJ1b7iQLU3njBLQQmSVaf1Lo7zMvIWKRCZIRXhZAScIzekO/g2+csbP6OKhOz4fbim37QgnBXVefgvQr365Tj6l/OjTq9LgSCQdwP23n/U0wd8/ORYi2L4f2ry9tqQadE6ysp/MNvq//vzRhH0UtjvZUcwmhBJcBBn01YomxYYhMj9/Nc7rUtFHub3TT9U4JsJmSPWh3QRIO8CRP3aNMWLET2byKpnahi2hXe2roaX4zbzCd1ZMdIy8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ppdo4HCyJggFxlaIt21qfAahB93uWu/iRRAaqpy//E=;
 b=XOhy5rQyPzCJjZySSyyoJ+GxnGfW0DRHHAibp8hCKYQwi6ei5mn2C3c66YR9bJP9b0i8XG9jH4KHybN1mbB3J052gm80a/rpzpLArF32vED2+3Uj7d6mu34E7BCgsAa5CjWVeOpMvid/2RKWuchYEjFy5d1CwW/3aSfDC53HvO7CjDiJIKR7QXAPXzE48vcPGremnWRflfNtQfMN8iS80Xnq017+kf+/l5dbmoWAVDaXAnF4UWX9TQI2b2PTs9iVJBJ0RdHa0e4xutBxPUwesh6hJRhAHpRq9fZyiuY8ZL45UtcG8O/ltqcmNMImmBDneYu4WYFQTZJTo4YIgH8fOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 MN2PR11MB3949.namprd11.prod.outlook.com (2603:10b6:208:138::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.14; Thu, 8 Sep
 2022 22:53:13 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::1977:59e7:5a28:24e1]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::1977:59e7:5a28:24e1%9]) with mapi id 15.20.5588.017; Thu, 8 Sep 2022
 22:53:13 +0000
Message-ID: <0c41e953-b90e-e4ac-24da-4573fe2c175e@intel.com>
Date: Thu, 8 Sep 2022 15:53:11 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3.1 10/14] drm/i915/uncore: Add GSI offset to uncore
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
References: <20220906234934.3655440-11-matthew.d.roper@intel.com>
 <20220908224550.821257-1-matthew.d.roper@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20220908224550.821257-1-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0097.namprd05.prod.outlook.com
 (2603:10b6:a03:334::12) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f33f538-35cf-413c-3cb3-08da91ece907
X-MS-TrafficTypeDiagnostic: MN2PR11MB3949:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6KGPDK19eQflta4XMgzBet06I0etQ9s2GKPLNnR1JAFv7i2aVmY9ZBt1hvbfRrFtKdW7L3SVNuSvocNUBkDGnHugn1KvMJvZIuPNSIPC8+zzairXc83OsnVM+lcwICRBDfVGPHtBMal5QQoNaJA+TSrIEYF9xuy5RUHI4KeFMVcEqAODyl2KkdhjBmQZGMn9Gu6He7pqSJmrToGgr5e3jm5J92r38U0Pyx8+TrkAEsegBy8jLLJY0juQhmBMbDZjI2T1PBtlL1bej+oRZVTsS9uH6V3kXpE0Vm1jIQix3Zo6+5tupga3qpwt7gBY4h+Cz9903IL+OM7LX+HfaIqzbaUovsKzJe/fPOShrHiARfY3ciYkkyUVwv3rM1jeabPLoK5jfAQSFMiwIVmmrDg465e3XFOcse1D+iRJYX239ChoWb4eFDNp+4N5Go2N2D5WOOnD9OcqMKFwIArGoqs6Ljolp4jHDQ1698OBXFnhYH+mYsTDfrsWL9O2SfzEqLZ7oEKurwPNez/NoZtNUz7tmxG1ylMvj36GGAo7V/FLdLHNJd3+RkCYbd/ByjygZvXpXVmwv3aCBbLnbBVGgMFCVJGY5yZd0kClzPkuR1WZtfP4T7Wc73sxmEqVBwPwX0zRJmpeZzfJVDd7pZfYq++vrRmF8Bdl7v2LxsgOPWHttg/RKOFbS8CI7uQ1QSSLf7ayNpXUrXA/9F7bCkF0pZlmXh80FJ1LaG7OKqwqTDpHoFizmltPXPpBgx1X3BvXAENSdm+cvpg7Dypg/Nzv9lFls/2r3UmJdSbpPxcX63wHqlg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(39860400002)(346002)(136003)(396003)(366004)(26005)(8936002)(316002)(66476007)(66556008)(36756003)(450100002)(2906002)(4326008)(66946007)(31686004)(5660300002)(8676002)(478600001)(53546011)(6506007)(41300700001)(6486002)(186003)(31696002)(2616005)(38100700002)(82960400001)(6512007)(83380400001)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eEYwMmlNdjMrQkx3dnBuMlE2WXVjekpIUHE3UWNkSU5CYXRsYURVTkxVNWNr?=
 =?utf-8?B?V0RRaVZvZFVGMmxXQXlLanFlb3pQMURjblhkYkNMdFhaa1lScWpia1JERDZj?=
 =?utf-8?B?U1UxMWJyaHV3K05ya2FTZVNnV2JpdGtoVzNRZnJGUzY1azZlbFlBaWhWakJE?=
 =?utf-8?B?clJHUWN4TVcxVExHOG9mM0sxV1FkMUFuVFNBc0EyYUlkR1hmbzYyK1hMU2F3?=
 =?utf-8?B?QUdwbWlZWlJmRTlvQXEwRUo3aHFjc3doK0hGOHQxU0RzN0d2VVN0ajU5WlFG?=
 =?utf-8?B?aHFzTWEvZnQ1WGdQWmpqWWpIcVh2bE1RZzAzL0JJczR4SEN6YWdhR0d6dDJH?=
 =?utf-8?B?aTMyOTgzNXh3WWNMNDVFdU1ENzJ4VDBxNC9FSnAyaG9iMjZ0TzBMRWNJSVZ3?=
 =?utf-8?B?MFBCdlhNK1NzbmdWMW40UHpRNzNnSDlVam02dDh0VDRSUThNQkY1ZzlrMFFp?=
 =?utf-8?B?K1AyT05VZ25rRC9zYVNLaGRyTXRISkRYd2hncVRhMnZzRktrZi9qUzh5THFy?=
 =?utf-8?B?bXZIZVBKblNiaU4vUXl3d3UxUjVPaU9udlZsWjVscUJ3dVovU25ib0xaL2E3?=
 =?utf-8?B?c2hHR05TQzRIMVdmNDJZd2lkMUVoOGlRR0NUNWpWcEM5RTEvd3RMYy9KQnhT?=
 =?utf-8?B?Q2FNNko2YnB2REdBbDE4Z2R4V3BndTdQUllyTDBEOVdubU50RjF3U25HZWdk?=
 =?utf-8?B?Qlp4ckpHRzRoaEI2TkNncjR2REx3ekJzdjFhbnpmTHNMWnRpZHVnVkE2QVZM?=
 =?utf-8?B?dm5aTVBXZktWVU9MY3dJWFp5RXcrVTdBd3B2dEJja1p4M2xQNEJWNDR6QVhM?=
 =?utf-8?B?MHBwU0lYTkg4bnZOdS81eG9IYXlYNzBnYWxyWGdvYVM3cStIdG5KWDcwRjVT?=
 =?utf-8?B?bGxnOTh6V0NVTWgyUjA2QlA1ejRERnNGeXFtdFg5d3ROVENSbVR5SlJlMXRw?=
 =?utf-8?B?MCs3UTMzYlY1U0xRWlNiK1puQ0d3ZmdBcmZ5Y00xZkVxQks4eVZESkFDVFF6?=
 =?utf-8?B?ZDVsTUNKdGlNc1IvdmcwdStGdW9SU29ETFJoeXREeS81aTVPS2kyMmE4R1RQ?=
 =?utf-8?B?OHhUQjd5ckFSeGRxYXdKY0FFNlJteFRBeFBtbldZekpKSWxsT2pFQmdPZUFQ?=
 =?utf-8?B?YjdyRmVuNHhsS3dEa0xDY3pvVEg1eWg1QmJyWERneWtkbnVMdlZXNklOaXcy?=
 =?utf-8?B?SWhHTHFRQUJScHdZNWtpYlhkTWxVUEJJVTZkUms0eWNuMG1uTnhmc2Jlc2Zh?=
 =?utf-8?B?UlJ4K3g5WE9taFYxMWpYdjZ4dmRXclV4Yis0U01yUk5mN3d0S0szMXBKcXUr?=
 =?utf-8?B?NEloRnQ1NG5ObDhnTW8wYzBYdnF2Y3R4b1dKbFRsYWE1cmJ3R3loUC9xWW54?=
 =?utf-8?B?L05yczV0M0Y0T0xxMGtLeGIxVVd3RXdBZVdrUHZ2eU5tZEdvZ2tKNFVsODg4?=
 =?utf-8?B?L2lPd2JVcmE5Mm1zWGdwSENrTVd5RDVvUDRvcUNQWDRxeXIyUVhlMjhWRTV2?=
 =?utf-8?B?d0lxSU1nWVR4UFpBWUUrOUc5SjFBVXNxMENKZ0pQS1RiRGJxWnE3Y0UwZkxS?=
 =?utf-8?B?dnZxdHBtc29rcXJuM2ZqY0pRVEkzWVpDb0VEdmhDeWZGbDFqMWpBSUEydktW?=
 =?utf-8?B?SmhjQjdZT2VuMmNvSVI3NEtLZkNWVXNnUEttMDloYlRXUHF1ZzVuT2IySjR3?=
 =?utf-8?B?YmRveS94bmNqaEZhcndyZTNaTG5NZnNDSXBRSmpzaVR4T2hQTDNpdkJZeEtm?=
 =?utf-8?B?SGJPamNTaGR2TDY5RGFhQ1NhcEsrSXVkQXZ1UUFRSnNUeEJpSWdTczErVUFR?=
 =?utf-8?B?c3FZUG03ODA5d2F5U0Mva01nZHQrUzFLQ3J5dVFhcnp0SHl0aGZTa0QyU2FZ?=
 =?utf-8?B?ei8xVXV2UlVyM3BsRFVCL2x6MHYrcncybld1ZFFCemV3ZlN1NjNrenA1NVMy?=
 =?utf-8?B?cmcrNTNlWG93TWk1QVovM3dRUDJzaHFKVWpZZjFSSGY2QUR3SDJRK2cvaEx6?=
 =?utf-8?B?a3JINGd3eFc0SExLR3RSR2tiNko1UlQ4TFlMdFhpMTZTcGZONlFTTUJqTlhz?=
 =?utf-8?B?ZGVndU1CMFcwK0RLTVpVV0w5Z04yTGIrZmZ0VFVEaTh5VnFhRzFzL0ZVckx0?=
 =?utf-8?B?S0Yzc2VCdWJua2I4ZFFWTFdFTUVJZmNQU3FlWnVvSGNDWmxhQms2QWFjaGo1?=
 =?utf-8?Q?D5NH1sQmcMJjC3lrsUc+Caw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f33f538-35cf-413c-3cb3-08da91ece907
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 22:53:13.5627 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fdld3b1HIHbdK2eQY8BopToDBmI9hbb34toDCDTiK4mLe3l7q4sRv0zg9tJVLpzSbiz8KgWBCe/pm1qMacv8XGUUPgwRLiWuzaHWT8Su10g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3949
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



On 9/8/2022 3:45 PM, Matt Roper wrote:
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
> v2:
>   - Add comment on raw_reg_*() macros explaining why we don't bother with
>     GSI offsets in them.  (Daniele)
>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/i915/gt/intel_gt_types.h |  1 +
>   drivers/gpu/drm/i915/intel_uncore.c      | 10 +++++--
>   drivers/gpu/drm/i915/intel_uncore.h      | 34 ++++++++++++++++++++++--
>   3 files changed, 41 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> index 0e139f7d75ed..82dc28643572 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> @@ -274,6 +274,7 @@ struct intel_gt_definition {
>   	enum intel_gt_type type;
>   	char *name;
>   	u32 mapping_base;
> +	u32 gsi_offset;
>   	intel_engine_mask_t engine_mask;
>   };
>   
> diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
> index 452b3a31e965..5cd423c7b646 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.c
> +++ b/drivers/gpu/drm/i915/intel_uncore.c
> @@ -928,6 +928,9 @@ find_fw_domain(struct intel_uncore *uncore, u32 offset)
>   {
>   	const struct intel_forcewake_range *entry;
>   
> +	if (IS_GSI_REG(offset))
> +		offset += uncore->gsi_offset;
> +
>   	entry = BSEARCH(offset,
>   			uncore->fw_domains_table,
>   			uncore->fw_domains_table_entries,
> @@ -1143,6 +1146,9 @@ static bool is_shadowed(struct intel_uncore *uncore, u32 offset)
>   	if (drm_WARN_ON(&uncore->i915->drm, !uncore->shadowed_reg_table))
>   		return false;
>   
> +	if (IS_GSI_REG(offset))
> +		offset += uncore->gsi_offset;
> +
>   	return BSEARCH(offset,
>   		       uncore->shadowed_reg_table,
>   		       uncore->shadowed_reg_table_entries,
> @@ -1995,8 +2001,8 @@ static int __fw_domain_init(struct intel_uncore *uncore,
>   
>   	d->uncore = uncore;
>   	d->wake_count = 0;
> -	d->reg_set = uncore->regs + i915_mmio_reg_offset(reg_set);
> -	d->reg_ack = uncore->regs + i915_mmio_reg_offset(reg_ack);
> +	d->reg_set = uncore->regs + i915_mmio_reg_offset(reg_set) + uncore->gsi_offset;
> +	d->reg_ack = uncore->regs + i915_mmio_reg_offset(reg_ack) + uncore->gsi_offset;
>   
>   	d->id = domain_id;
>   
> diff --git a/drivers/gpu/drm/i915/intel_uncore.h b/drivers/gpu/drm/i915/intel_uncore.h
> index 4acb78a03233..5022bac80b67 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.h
> +++ b/drivers/gpu/drm/i915/intel_uncore.h
> @@ -136,6 +136,16 @@ struct intel_uncore {
>   
>   	spinlock_t lock; /** lock is also taken in irq contexts. */
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
>   	unsigned int flags;
>   #define UNCORE_HAS_FORCEWAKE		BIT(0)
>   #define UNCORE_HAS_FPGA_DBG_UNCLAIMED	BIT(1)
> @@ -294,19 +304,27 @@ intel_wait_for_register_fw(struct intel_uncore *uncore,
>   					    2, timeout_ms, NULL);
>   }
>   
> +#define IS_GSI_REG(reg) ((reg) < 0x40000)
> +
>   /* register access functions */
>   #define __raw_read(x__, s__) \
>   static inline u##x__ __raw_uncore_read##x__(const struct intel_uncore *uncore, \
>   					    i915_reg_t reg) \
>   { \
> -	return read##s__(uncore->regs + i915_mmio_reg_offset(reg)); \
> +	u32 offset = i915_mmio_reg_offset(reg); \
> +	if (IS_GSI_REG(offset)) \
> +		offset += uncore->gsi_offset; \
> +	return read##s__(uncore->regs + offset); \
>   }
>   
>   #define __raw_write(x__, s__) \
>   static inline void __raw_uncore_write##x__(const struct intel_uncore *uncore, \
>   					   i915_reg_t reg, u##x__ val) \
>   { \
> -	write##s__(val, uncore->regs + i915_mmio_reg_offset(reg)); \
> +	u32 offset = i915_mmio_reg_offset(reg); \
> +	if (IS_GSI_REG(offset)) \
> +		offset += uncore->gsi_offset; \
> +	write##s__(val, uncore->regs + offset); \
>   }
>   __raw_read(8, b)
>   __raw_read(16, w)
> @@ -447,6 +465,18 @@ static inline int intel_uncore_write_and_verify(struct intel_uncore *uncore,
>   	return (reg_val & mask) != expected_val ? -EINVAL : 0;
>   }
>   
> +/*
> + * The raw_reg_{read,write} macros are intended as a micro-optimization for
> + * interrupt handlers so that the pointer indirection on uncore->regs can
> + * be computed once (and presumably cached in a register) instead of generating
> + * extra load instructions for each MMIO access.
> + *
> + * Given that these macros are only intended for non-GSI interrupt registers
> + * (and the goal is to avoid extra instructions generated by the compiler),
> + * these macros do not account for uncore->gsi_offset.  Any caller that needs
> + * to use these macros on a GSI register is responsible for adding the
> + * appropriate GSI offset to the 'base' parameter.
> + */
>   #define raw_reg_read(base, reg) \
>   	readl(base + i915_mmio_reg_offset(reg))
>   #define raw_reg_write(base, reg, value) \

