Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A535E53B900
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 14:33:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AD8610EBC4;
	Thu,  2 Jun 2022 12:33:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A64610E7A4;
 Thu,  2 Jun 2022 12:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654173185; x=1685709185;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YbVbPRUphGzCzlj5z6OZKuFC06OGTjdAO6hwdnKOYR4=;
 b=TcL4NkoHn02u2QqAi2cIzl2r+b+V/7pXju59ubYlt7wdBzxm+isAQTdz
 jXJxmgM65yXNeQV2oYDt9aII92t/Jln29fxQSeaWpI0QoVvad+opFD2cB
 S85bwDhkYyW03repcWyJx+slL5KFwaDmye3M6JrL0EYSG81MWq7d0MFPG
 56wYY1LZh2e5JF389iYGOe1WFcqVnyi+5oaXF6Z4lXBVLVHYiascUKNHs
 ovZZOKLsxT0cfvAtb48Ge4yvSI7/ZdRBQ/JESR1RjbLZIjFvi8H4TwohD
 /8XZ28KSZlWGambYyWXRXcV3cmrljxnKNo8FZLLPcP0fU9ttwE3nfybCq g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10365"; a="274734805"
X-IronPort-AV: E=Sophos;i="5.91,271,1647327600"; d="scan'208";a="274734805"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2022 05:33:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,271,1647327600"; d="scan'208";a="756966551"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP; 02 Jun 2022 05:33:04 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 2 Jun 2022 05:33:03 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 2 Jun 2022 05:33:03 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 2 Jun 2022 05:33:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=khhyDLbWAEu/2rtib86L/zesPLQJM0LFZzqwKO8oIH+RCBsCN3hwPUoi6pk7kmIezToW6sBapdip7DnF4Otf5rLbgXSvoQQgQsTrv8WsQHjt55f1tN6W93T84zYfmQ1B2RSZodOT4oFjHjhHHzh5DWM2eoa6GMMtrjezqGejK3c7Hvl6BCrwsgSY+qzKkqjDcRz7JpnvvGjfHI1MTVgB5fHJctCaQuT8YK3di8dH3KpLuqsxQBeJ0mZul+hrMzsUt23Sa0hOmOUqCORu4m8QvUIA4YokdUeW4V5smcL4DaG0J02YyTWENzYHCVU86TYrlGwYkDN4SN3ogBX1VhuTig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rBoE6pycBARD6wmG4GMoM70vVhohHyF+bF8VXetEnd8=;
 b=UkNM3BHDXOhFBo3onb0x2wz+bF0ci4CUcsidyAZmsuy/lgUzkzkZBND/yjwMbMpqpFlZB7DLMq2tKFjbnO0bopEyo3EThdl7pndeqTBi1noIhQfEVgKR44ogqFPI0Xp5BYLrKYIHJaJcqWnFDXGJXADrF5Me21cVXUMosIpoYm5u65GENpkVxiOLPFEVSsV9LrmCoGWVn2LoA01GpNqH5hyGQ++LhO0k4orsy78Ee8YhWWi+KCRRuWMnV1R7l7uS97Svb24eCfktTqlyQcAXGWOChDbH8PQc7mDSq5IMye24cYrD7W/v1u1UP/HTGw8nfjLY8JarmKvgN0gj19tb2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1897.namprd11.prod.outlook.com (2603:10b6:3:112::9) by
 MW5PR11MB5906.namprd11.prod.outlook.com (2603:10b6:303:1a0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.18; Thu, 2 Jun
 2022 12:32:57 +0000
Received: from DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::29a0:67ad:4b77:ce13]) by DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::29a0:67ad:4b77:ce13%8]) with mapi id 15.20.5314.013; Thu, 2 Jun 2022
 12:32:57 +0000
Date: Thu, 2 Jun 2022 18:02:46 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v5 0/6] i915: SSEU handling updates
Message-ID: <Ypit7jcHGqDZ/0Kn@bvivekan-mobl.gar.corp.intel.com>
References: <20220601150725.521468-1-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20220601150725.521468-1-matthew.d.roper@intel.com>
X-ClientProxiedBy: PN3PR01CA0013.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::9) To DM5PR11MB1897.namprd11.prod.outlook.com
 (2603:10b6:3:112::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eaa60490-0c3f-4b32-6c05-08da449405b6
X-MS-TrafficTypeDiagnostic: MW5PR11MB5906:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <MW5PR11MB5906FC43DF3A97C6D12073759FDE9@MW5PR11MB5906.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vHPXLsG3nvh7sZZ6X7hNwR9y6SKzzK3x/R+ie3XUEj5iogWaRU1lJQy0Qx86vmDdBdiGVr+6jN01N8z+RthYxctdF3tKvCo17/2QC3vAgX2RXdipuTdMFagPT4MnBspgMsWftwJ1FhO+3i07vQte+3MYQ9YAFm5r2P7UUmeU+F72YbC7Jn/GUBlEiY89e804U5TcQy1yWLIJ72mpwyLSjEQy+ffcqA5va1RmU1QkJqKAJ/lemV2JT1+bkIzgBb/WqCLALWbiYivDXhKvA6L1QQT2i1p7Zdxe0v/aFJZbRBcEPvwmdW5s0YR2DR43XMNhRBxHCYSRYe/0Zv7X5XoAUlEq5fcqaaQJ3h8BA2e8jyHOYlyGQZm7WTbTAHauguEfKVKTWAdBoACLCDTzMzqg356ERx1462DlutAW0jRaaKI/If7I8pukH+Lv3sr/bnYXTxlf5keT12v2s4mxwOGVrZIZHVVsluD12ByGS+1Wflfk4Frryi+9AhjI3joSbz5ZBk4NWU2NfEW/1YxGl9/+2W8lRRjwhPVN4UXBi//yoKdspDcoYpZBiSh+zxBEbmmLnjwqDIfTeFhwr7HBXVTRIw5BJLlYNGudpbvNj7Phf6abkQrfMpsyaCV9Np6/IWgTMlRbVwxzL2cVkNufMJB/lQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(86362001)(508600001)(53546011)(6506007)(316002)(186003)(4326008)(6486002)(38100700002)(8936002)(82960400001)(5660300002)(66476007)(8676002)(450100002)(66946007)(66556008)(2906002)(44832011)(6666004)(6512007)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3RqUitXNWZyckhoVTdMYkpLZG9Za1lTWStOVUt6RG9EZjlVRUtjSnhvaUJX?=
 =?utf-8?B?UmFsbm03cjNqc2NrRk9acHB2RTloL1E0RU9pdVI3TWswMFp5ZUhOWkVOUE0w?=
 =?utf-8?B?Y1RLanRaWkliZWJWVWQ1dk9uTHdiTU5jVDJmTHJWdCtrK1A0NEQxM2c2ZUhu?=
 =?utf-8?B?Zm5BSDFrZHhzcmkyM29PYWdGd2g1aHZlOElzU2w0blhUZmNSQ29HeTkxSVA0?=
 =?utf-8?B?bEJDYzZad3AydEF1b3ZQTi92QWRWalFYRm1KMGNOTTIxMXBoTnhaU0pXeEFZ?=
 =?utf-8?B?UVN2SEFxVGFBT1FFZlc4Nks3REZpSGp6ZFBrYUdxRWphb2RPS3JaODVCcW5K?=
 =?utf-8?B?M0h5RjQvVHM5SDR1cUpxajNuVnNiNWVWc1dWWXZqby9TUWtQd0tjamYwdEFW?=
 =?utf-8?B?Wk9GV3ltOGo3UXpsMXZ4NXNYdkw1ZWRWK1VHTDcyWG9sQU1OdlZzMzg4VURK?=
 =?utf-8?B?b0lWdmVNeU9RUWx4MEkyZmttMWJsdGVZeW9sSkljRUVKRmVneDdoN1lsTVFu?=
 =?utf-8?B?aGFuUFlnRGpOVEVVR2EzY3ZuL25yMVhMbjdoZG01YkFGYnhqYnZ1ZE9qekFr?=
 =?utf-8?B?TDZ0ZXNQVnRRVlpvZUgzSmhOekUxTklaNW1PT2FWWkE0Q2FxQTluM2RwOVJx?=
 =?utf-8?B?dys2ZDJ2MzdQVHhSRFZxMUNpVWZ1NWE2TmxIYkRyVXY2S2tmZDIwRVhDSm5v?=
 =?utf-8?B?ZGo1b3RQcEl6c1EzdnRsSHRQVjJvQkpkcnBjWFErYkNQdWszYnNBTnl3V0hw?=
 =?utf-8?B?Mys0Z1VHcGpQQzV6VVVFem5ZSEhUUUJnNUdhemlLeGpSVFB4K2dlQ3lTR0pv?=
 =?utf-8?B?TENOMlYwa1gvK2pOOHRpQWp3R0NKMW0rRy9YYmZWU2o4VjhwQVlRY1ZpWmNn?=
 =?utf-8?B?bHBGT3JjcEZVaVRvKy9KbGJaK1FvMVdrUlJoVnlXbW1jZWlkVm9YRTBwV1JN?=
 =?utf-8?B?ck9PSEhxcTUwbTJaSVd2RzJSaXRaOUNYbFhQK3ovbFp5d2tneDROOWFWZllM?=
 =?utf-8?B?Y1RHb3I2TVRYQWpkeHFMYkVjcGVCTVI4cGFIVDJQalp0dUJXKzBIWkVmeVJz?=
 =?utf-8?B?ZVlGbjBidTREeVp5UjAvN1M2aDQyblFvNElxMGxrQTVCVUVwdjh4KzdtS1hV?=
 =?utf-8?B?NVZCN0ExY0NQV25KVVBGTm1EQXgyNFhBWlY1bWMxaXhHczRtYW5RMGUrWlFr?=
 =?utf-8?B?a0EyRmNrZXVqempPV2l5Mmo3WUtxK3V6MUJ1c1NWMGQxazJWV2dPMlMvbkFs?=
 =?utf-8?B?Ui9hek5kdWs3VXNVMjZ1NHppT2ZneTRuRUhHMzMrUFhaSzdvNEpmRU1VNk5T?=
 =?utf-8?B?UGZ5VnRlZklvdDd4c0RZQWY0V1VOdS9zeE9qc0pRWUY5eStLbFYreDVlOExK?=
 =?utf-8?B?bFg0WG02YkFSekN5YVhKVmNRTlBTYUZQaUUvais1blB6WFNyY1pMeERSaXBn?=
 =?utf-8?B?OHE3bFovSStXQmtWS0tZQzQxTHhZSDRNekljRjN4M0NCUm94dXBFMWpqRXFi?=
 =?utf-8?B?QnVwT0VFdHJwVk1qaUFSWFFROEFzU2o1dzZ1Mm5QUXFONjk2THJkZWp1NlUw?=
 =?utf-8?B?dnQ4TjZSS081eTAwOGd1YUZ6N2hmVkRKUVlHYUtJRFB6OUUrenpXNUNKbGlM?=
 =?utf-8?B?WkZSVUdJdklTckZGbWlKUFIyRTVXalZ5ek5CVTk3OWR6VG9TQnkvN29VMFc0?=
 =?utf-8?B?V3BsYU1Qb1YvUFhMb2ovNkNSS0daTzZlQ3g2UjEyYWxJOTIzR01NRlFvbDJs?=
 =?utf-8?B?VWorN2NhVTRLc0ptTjNKVHgxSW9yM1M5SG9ROW9TalY2WlFLNzVOMDFUa3NQ?=
 =?utf-8?B?bVhNR0dVdWpkMkVYOWdFRytxbkxzbnhmZ3NaWU1qdGhaUlVwSGpJREhGQTRz?=
 =?utf-8?B?am50SzZlQ1lMckpSSi85Y3h0QXYrYjZxc1d6bnlQMTNEcTk3Y0ZIY0w5M1B5?=
 =?utf-8?B?bmVVZVBFV2p3VWtkdVZhaEhkb3dRV051NDhobTRiMVd3T1doSjlRVGo0K1RS?=
 =?utf-8?B?TDdNNjRoVVdMOUpRcmpZL2NrVjdKcWthQWJsaXRFTVFQYkJIelk0dXdSVTBJ?=
 =?utf-8?B?K3Q5cFVPOEhUV3BaL05WdnFEVnlQbUhmT2JzMmR0emhsSlBWc2ZlcXFsNHVU?=
 =?utf-8?B?WHlTQStla3VmcXI5RHRpM3c5eW9Ba2RQR0VRZWVBVVk3ZVRvTnlKM05uS09O?=
 =?utf-8?B?cnlvTWNVMVlOTEVWSCtiWStBMnBqeUIxRXJJa3ZKM092enFPM3VKUnNUZ3BR?=
 =?utf-8?B?VXZ2aGdMVFM4OVRCcE5CNlZqbHEzMVZiS05SZlVoS285ejM0MWdWUVhwbnFR?=
 =?utf-8?B?T1hUd1VDL2pDQUlWalZRRDhpS2QrQllkMURsYVJ3aEV5SkNOeXg1Vldjbnhv?=
 =?utf-8?Q?E0V9lGM1yZLkKe8q0hd7AG339+EXuTsc8gb5p?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eaa60490-0c3f-4b32-6c05-08da449405b6
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2022 12:32:57.2410 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cYYEMxXiVLA8sBfFEjZuFSLGS0fTTcwKt6ttRvkoZ7CdchWtxN6y56UrBDC7TbZdK8oZGdZj53kDNLoDCoj1ehgiWNU54bZrdX9s9KEj//z25G+Ta8R0oEn/I5sgphyt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5906
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

On 01.06.2022 08:07, Matt Roper wrote:
> This series reworks i915's internal handling of slice/subslice/EU (SSEU)                                                                             
> data to represent platforms like Xe_HP in a more natural manner and to                                                                               
> prepare for future platforms where the masks will need to grow in size.                                                                              
> One key idea of this series is that although we have a fixed ABI to                                                                                  
> convey SSEU data to userspace (i.e., multiple u8[] arrays with data                                                                                  
> stored at different strides), we don't need to use this cumbersome                                                                                   
> format for the driver's own internal storage.  As long as we can convert                                                                             
> into the uapi form properly when responding to the I915_QUERY ioctl,                                                                                 
> it's preferable to use an internal storage format that's easier for the                                                                              
> driver to work with.                                                                                                                                 
>                                                                                                                                                      
> Another key point here is that we're reaching the point where subslice                                                                               
> (DSS) masks will soon not fit within simple u32/u64 integer values.                                                                                  
> Xe_HP SDV and DG2 platforms today have subslice (DSS) masks that are 32                                                                              
> bits, which maxes out the current storage of a u32.  With PVC the masks                                                                              
> are represented by a pair of 32-bit registers, requiring a bump up to at                                                                             
> least 64-bits of storage internally.  We could switch to u64 for that in                                                                             
> the short term, but since we already know that upcoming architectures                                                                                
> intend to provide DSS fuse bits via three or more registers it's best to                                                                             
> switch to a representation that's more future-proof but still easy to                                                                                
> work with in the driver code.  To accomodate this, we start storing our                                                                              
> subslice mask for Xe_HP and beyond in a new typedef that can be                                                                                      
> processed by the linux/bitmap.h operations.                                                                                                          
>                                                                                                                                                      
> Finally, since no userspace for Xe_HP or beyond is using the legacy                                                                                  
> I915_GETPARAM ioctl lookups for I915_PARAM_SLICE_MASK and                                                                                            
> I915_PARAM_SUBSLICE_MASK (since they've migrated to the more flexible                                                                                
> I915_QUERY ioctl that can return more than a simple u32 value), we take                                                                              
> the opportunity to officially drop support for those GETPARAM lookups on                                                                             
> modern platforms.  Maintaining support for these GETPARAM lookups don't                                                                              
> make sense for a number of reasons:                                                                                                                  
>                                                                                                                                                      
>  * Traditional slices no longer exist, and newer ideas like gslices,                                                                                 
>    cslices, mslices, etc. aren't something userspace needs to query                                                                                  
>    since it can be inferred from other information.                                                                                                  
>  * The GETPARAM ioctl doesn't have a way to distinguish between geometry                                                                             
>    subslice masks and compute subslice masks, which are distinct on                                                                                  
>    Xe_HP and beyond.                                                                                                                                 
>  * The I915_GETPARAM ioctl is limited to returning a 32-bit value, so                                                                                
>    when subslice masks begin to exceed 32-bits (on PVC), it simply can't                                                                             
>    return the entire mask.                                                                                                                           
>  * The GETPARAM ioctl doesn't have a way to give sensible information                                                                                
>    for multi-tile devices.                                                                                                                           
>                                                                                                                                                      
> v2:                                                                                                                                                  
>  - Switch to union of hsw/xehp formats to keep the representation in a                                                                               
>    natural format for different types of hardware.                                                                                                   
>  - Avoid accessing internals of intel_sseu_ss_mask_t directly outside of                                                                             
>    intel_sseu.[ch].                                                                                                                                  
>  - Include PVC SSEU which needs the larger SS mask storage enabled by                                                                                
>    this series.                                                                                                                                      
>                                                                                                                                                      
> v3:                                                                                                                                                  
>  - Correct a BIT(s) typo that should have been BIT(ss), causing                                                                                      
>    incorrect handling on gen9 platforms.                                                                                                             
>                                                                                                                                                      
> v4:                                                                                                                                                  
>  - Eliminate sseu->{ss,eu}_stride fields and just calculate the proper                                                                               
>    value in the UAPI code that needs them.                                                                                                           
>  - Handle unwanted ~u8 sign extension at the callsite instead of inside                                                                              
>    sseu_set_eus.                                                                                                                                     
>  - Use BITMAP_BITS() macro rather than passing I915_MAX_SS_FUSE_BITS                                                                                 
>    around directly to bitmap operations.                                                                                                             
>  - Improved debugfs / dmesg reporting for Xe_HP dumps                                                                                                
>  - Various assertion check improvements.                                                                                                             
>                                                                                                                                                      
> v5:
>  - Rebase to latest drm-tip (resolve trivial conflicts)
>  - Move XEHP_BITMAP_BITS() to the header so that we can also replace a usage of
>    I915_MAX_SS_FUSE_BITS in one of the inline functions.  (Bala)
>  - Change the local variable in intel_slicemask_from_xehp_dssmask() from u16 to
>    'unsigned long' to make it a bit more future-proof.
>  - Incorporate ack's received from Tvrtko and Lionel.
> 
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Patch looks good to me. I do not have any comments except for the
request to please check the checkpatch warnings.

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> 
> Matt Roper (6):
>   drm/i915/xehp: Use separate sseu init function
>   drm/i915/xehp: Drop GETPARAM lookups of I915_PARAM_[SUB]SLICE_MASK
>   drm/i915/sseu: Simplify gen11+ SSEU handling
>   drm/i915/sseu: Don't try to store EU mask internally in UAPI format
>   drm/i915/sseu: Disassociate internal subslice mask representation from
>     uapi
>   drm/i915/pvc: Add SSEU changes
> 
>  drivers/gpu/drm/i915/gem/i915_gem_context.c  |   5 +-
>  drivers/gpu/drm/i915/gt/intel_engine_cs.c    |   4 +-
>  drivers/gpu/drm/i915/gt/intel_gt.c           |  12 +-
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h      |   1 +
>  drivers/gpu/drm/i915/gt/intel_sseu.c         | 450 ++++++++++++-------
>  drivers/gpu/drm/i915/gt/intel_sseu.h         |  92 ++--
>  drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c |  30 +-
>  drivers/gpu/drm/i915/gt/intel_workarounds.c  |  24 +-
>  drivers/gpu/drm/i915/i915_drv.h              |   2 +
>  drivers/gpu/drm/i915/i915_getparam.c         |  11 +-
>  drivers/gpu/drm/i915/i915_pci.c              |   3 +-
>  drivers/gpu/drm/i915/i915_query.c            |  26 +-
>  drivers/gpu/drm/i915/intel_device_info.h     |   1 +
>  13 files changed, 397 insertions(+), 264 deletions(-)
> 
> -- 
> 2.35.3
> 
