Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF604C362B
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 20:51:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB23710E1A1;
	Thu, 24 Feb 2022 19:51:15 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1C3610E190;
 Thu, 24 Feb 2022 19:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645732273; x=1677268273;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mk4z1ENG2RuNfT20gd7lYR2dS9AKEskGET+OXPzwPvg=;
 b=Bg3cQm8017ZInYVIcbcXOu//DXG0p56X83BUk66cg8jpQaE6H5RDSGf0
 qEb3eZ1u7PgXC6VMQpfwTgvu4PiiBCK3a+oLI0bf414JgefxMQ0ZHKmSX
 Xjtb+evwzczvX/bPe8//4Gytw6mPrhWlW7ycVeq8gR9EKiUvHwx0rc6Pd
 wNt0XNuMD5+97R88FGom5P3kYxOn9LIrSvZjifoylBvS8s/LwXIyhlNZw
 3ql2KQy49YoAL1AQ3zBNGr39yEHzJKFs4XNdZKwl/G+ltKYmrNboWD0ZI
 i90J3HMWwdWEmhdoHJpbYtMnPIs4/2+b/jaGsOsQNYbiy5MogDgk28sFM Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="252256297"
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="252256297"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 11:51:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="628600256"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by FMSMGA003.fm.intel.com with ESMTP; 24 Feb 2022 11:51:12 -0800
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 24 Feb 2022 11:51:12 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 24 Feb 2022 11:51:12 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 24 Feb 2022 11:51:12 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 24 Feb 2022 11:51:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=esq7lrNJyIKkH72pD4AGArs+LLRdZwq95YIWdiTVFID1spwDCngHciIE8S5IdTTdlVu6/cNW3RtB+2RnW3Ji6qoE7/8Q71maM1u5dqYT6r0/4rfott6cz8KCF5Oa0bon0XFzwOSdINT7vtdUG1qCPPoSTRCtfIalknjqBj4y4xxgo6ANVgg+WSTzgl/bo18kSRTW8ceIp5aV9fdLYqXrwVJtwfO5v3t874hu48nImftAF5o4Du796QWnu1ROmVZA0RwF+iNBld5ZIbn/+CAucGj3g+41gkjvd2QCE8zRX2zJrZ6ZrB2Z1dpeU0l8m6kMYeiCD+/kawL0GsZKvz3njg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mk4z1ENG2RuNfT20gd7lYR2dS9AKEskGET+OXPzwPvg=;
 b=hReKSJ/cMTFR6j9We5mm9oYdv79BrbEoGSkHQ+QNDwk/+Xf3SeyBgD9KO8KeBJo46VhfOJlSCRMBZXTpSwmN897K33DA/24LDH0avrBGhExUl98wkttKhKJEwdTq2tR1GKAh2Fh1/VXaFVPPZUYlXobMgbVKY5wsC2RKzbjJnZ3PyXsbwK7U8bJ5Le5rZHF4Kn7qH04x2pXx+/B5CcDAkyCUTsH4Szi18m8I/BNc+ASLb5+mAHh887aLoF0UNeQ5hBJen+Nn5P0/py6gDidjtejhb4UHWTn3o39R4cJp3mimwkfcui/DgIGWOYZeZWKNPSbMwcNyLh8XjV9rQWUY1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by MWHPR11MB1326.namprd11.prod.outlook.com (2603:10b6:300:21::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Thu, 24 Feb
 2022 19:51:10 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7%4]) with mapi id 15.20.5017.022; Thu, 24 Feb 2022
 19:51:10 +0000
Message-ID: <77a7da0d-4cea-00c5-0073-44c9779b14a5@intel.com>
Date: Thu, 24 Feb 2022 11:51:07 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [Intel-gfx] [PATCH 1/3] drm/i915/guc: Limit scheduling properties
 to avoid overflow
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220218213307.1338478-1-John.C.Harrison@Intel.com>
 <20220218213307.1338478-2-John.C.Harrison@Intel.com>
 <0d0c5a79-1285-0830-3794-e9f0644811a5@linux.intel.com>
 <94c3184e-c1e2-668f-5824-00fd55797736@intel.com>
 <17e69f0c-8084-10dc-b20f-7d5108260180@linux.intel.com>
 <85105590-a8be-f4e1-69bc-cd34cad108e2@intel.com>
 <16a2687b-4996-8d40-456e-019a112f0fb6@linux.intel.com>
 <c1472196-260a-d2c8-c508-10fe58d4cd47@intel.com>
In-Reply-To: <c1472196-260a-d2c8-c508-10fe58d4cd47@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MWHPR11CA0046.namprd11.prod.outlook.com
 (2603:10b6:300:115::32) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 775af702-3d6e-4bf3-9b46-08d9f7cf0153
X-MS-TrafficTypeDiagnostic: MWHPR11MB1326:EE_
X-Microsoft-Antispam-PRVS: <MWHPR11MB132644A18CD34D09893162CABD3D9@MWHPR11MB1326.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FPz8aMmYTc6q4PPT5JYIP8my9tsWVuLbq0VuZd6dP1f31AFrgOl+6CSu58k0voJkcTwcssIZR6FlOHdJhFLbGDpyUlUI5MZIR2cja1K4HICVaYd2pY56dr3gxqqneyVU3bMpiPQ6+/rWnuyxKl0AlYsKXk51zEoFF+6LDx925Qj+PXHOTjZPNYX5SYEtTJmZTWUFtRj2Zz9RUdNV/SiXi/sVJ4G8EP78LYuziQj/2pGmeOYimvWyfdJ0azzSxBNKTMeVDUim5No+czJYGkaP3Sy44vOTOBzswde8S8jlA5OzaIr1yZabE52cgvgNo1yhcF1hxaTsufJmyiB8N+saMpo04FFM3uz38ooxoiY+gPf1KDu9h63rXxlzed+xEaYrAeAtnRTAc6d1MhzrYaNSZqdE9QIUKjVNijF4Hymg9pshScmiwU7xIVAVpfIBNvzV36nymAe+1dTcwvFvTNzr9UtHeJx/bh8RCijzaolq6P5hL4JJCf5S0OhpV8Ah0QNUzGcQ/erRbiuXxo8Y0Y5et2Oa5/P9hdV965NF6zgGwZkOBY0xV68KaC2ZOoK2TEZ+2N8/cFq8HWJROHU3d8CBxKLVDvHeBvBDYM/fa99pC/9btYGn5p1gHu0BW+WIsjb8uknv+u7dZSw+R5Lurayxxz7qDDy6yiG+roL/qNUMU1d2IjziGSOEb21JJ1fku9tMEDJiNqEQ4dvbWp/6/SxWThCn89fylkLAfTBKjiqGx9rETyfyBI586gPjPz8m5i0e
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8936002)(86362001)(31696002)(316002)(6506007)(53546011)(8676002)(4326008)(66476007)(66946007)(558084003)(66556008)(6666004)(2616005)(6512007)(2906002)(5660300002)(38100700002)(26005)(186003)(82960400001)(31686004)(36756003)(6486002)(508600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bThTRHhqWSs4TFkza0YweU1GdGVZbTkzSldqVE9kT21RMEJnSmhwRXdlSERu?=
 =?utf-8?B?NVRVQklGQkNXdjNWKzJSMlVDdXUzQjQ4UkdmL2xVVy9KSUE1ZFBLRUZUTGJI?=
 =?utf-8?B?dllKR1lmcHNHQWNsUTRjQVR3YWFoQnR5Z0wwc2wwTE11NmNnaHFQcUc4MjMr?=
 =?utf-8?B?VEpqcUlBeTFKVHczMmQ0VHQ4Q1QzMVdCSTdrRWpKNHpjYXBZc0x6dFhPcitQ?=
 =?utf-8?B?NTRoU3d0Uzh4WG9FYm5HUjdmK2RrQmhyOWxWd0tnSFovcDhEaWc5UlRkamZz?=
 =?utf-8?B?Y29DOHI2Tkt6dlZabzgzYWVQZ1JTSzdlV2gxeVB3akc0ZmJ4OVdqYWZuWVhJ?=
 =?utf-8?B?ZXJGR1l2a05PR0xBOHE2cUxxTzhUTkRsN09lUjR0R3gvOS82TlpPQjNBSHg0?=
 =?utf-8?B?RUdXZjRUOThRV25YMU41WEdUOS9OU3BBSExvcmNmb0JlTTY0dlQ0dmQrVWhE?=
 =?utf-8?B?dmdHZldweXJvWEY5ckRqY0g0Y2tCcHk4L2tvZjFMU2NQZ0RQaGp5SHd2bm9x?=
 =?utf-8?B?NnJWZ0pOK2hGTjVGeFJjblZZOVlNdWpUMnZYS1IwdUdnYkZjQUpVYytKd00x?=
 =?utf-8?B?TVVLWkk4bUM0cCtLNWxQdzk5WWNPOWc0NFpzdm8rNTN1WkszV3A3R2ZPSjBF?=
 =?utf-8?B?RlgyeUswSW45cGhzbVRMc3FQKzdjR1NFMEVwZS9oa09RVmllOGxsTG9paVJC?=
 =?utf-8?B?ai9WKys3TjkybmpOVk92REZ1WWIvMFZjZ3RlTzV1a2FZK1dQVnVxaFVZSGxH?=
 =?utf-8?B?SWFDRVZDZkR3UHNuSXp2Kzg4dWx5ZUVsTVJHWnRUczA2a0R3emd1Q20rbEVa?=
 =?utf-8?B?L1hKamgwd2FCSm1sU3lKdUlXWnVHVjg3V1l1bEk4Wjl2ZGN5bVNHeURhT1o0?=
 =?utf-8?B?YXpQMjRvM3lYV2psVTgzb0JEV1dGOUdEdXF4TzdXYTkyYnhJTk95NU1ISzVE?=
 =?utf-8?B?TnRmQnlOZGJLeVNlRG1UaS9QZjFUVW1PaTZqOUdMNEJLaGxmdHJQRit3a2Fa?=
 =?utf-8?B?L0kvSlZGbkJnZWxoUVk4M0haU2VsSEtQSnlvMGRVZDIwTjJNbDhtd0hwK2hN?=
 =?utf-8?B?OG9nM1psZWFrbXNWK1hRMm9HUGVrTmNndFdyWWJqejUyYU1peWNVMkJ4SkJz?=
 =?utf-8?B?dTFuaHlWY0VaSVJCam5RMG9LU2h5Q05uNUo4MHNERHVvNFAybUZYWE5PMlpE?=
 =?utf-8?B?T1NHUTEzVXVXYjR1Q25OQ1ZMTWV0enNxVkcwYXdtRVU0ZllPN01lbG11cDN0?=
 =?utf-8?B?MkFMT2g0RFFKRS9wTEVwRmQ5Q0s1S1gyZHUydmkvcWZQRHVyVWxHRDVQRlFH?=
 =?utf-8?B?YVFldjkwM3EwWlZhSEZENGhsSjBSdHJYR3Y0bnJaQmJEbWU4aHFjTFczZkYz?=
 =?utf-8?B?cklWSFdKcE1sbmtBMHhLd292Sm1zek1VblU4cVlVNjNFVmZoU0VpN1pUVnZm?=
 =?utf-8?B?MWtMOGJKdkFBTzlNOXZLNEhiVGRwaTlUMVUyMk1yaWZucFJKcjRYRy9BeGpG?=
 =?utf-8?B?dGJFVmRvRllaRlZnQ2xGN3Jta2JXdm9ZWTl3WnpnOXQrOHh0eTZTZllNd2R6?=
 =?utf-8?B?bGpEUGIzdE1pS1hrZUQvN3JxRWZLWVU5RGFYbE1YNzhrL1VhQXhOOEJBeUpE?=
 =?utf-8?B?SE04d0tYVVV3K29QMkVhSFluWDNydjZLMGd1SDZlM25ueitPQWg3S0o2STJw?=
 =?utf-8?B?eDR2c1NVQnJYSVVzS0lJSHZmS0txNVhaMXZscU9tNFgrVERxbERqOW4vTGlx?=
 =?utf-8?B?Vis1R0NxVXpsd3RjRDFHQUNMdTVCazZxb2VIdndwSEExSjYvRGozK3hwZmdr?=
 =?utf-8?B?UFlVZXFrUFUzTHdsUXlOc29TcnpIMWxYYVFZUU5GOXF3c2lMUFM2Z2ZLZ01C?=
 =?utf-8?B?VGwvakIxNVprZ1lHbXFPd1hJUVhSRU1KOXJORTZqc0s0VEg4dStlUHNxQUVZ?=
 =?utf-8?B?SXcxVkMyQjR5R0x4T2NGenYwR3hTSDdpckJUL2wxVW5wRFBaS0VnalJScXVo?=
 =?utf-8?B?alVMVnJySFdHMmNCMGRoTU45WEJXQWpSdUphSDhxZ3Jvc2JXQnRid1BmMVJS?=
 =?utf-8?B?SXdJNUF3TzFTdHBzam5HUDNxaE0wVVFPL08yS2Z2V3kzbUJoQ0l6TVBJU1Nj?=
 =?utf-8?B?STNQQ2lGNzJLYmw2eWk5MlRpTVRiTEtvK0ptT1J4Y1hPWURXazZOUWVUUmRm?=
 =?utf-8?B?YWVtbkt5RDZFODlyV2NXQkpmZG5Gd0M5VmNLckxTREM3a0tVTTFMR1N5dk5I?=
 =?utf-8?Q?Fw8grLxboNpSbHGASsjNl2WcAaxASUbZ/sB1Xys6f4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 775af702-3d6e-4bf3-9b46-08d9f7cf0153
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 19:51:10.4370 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B61lGQ4YoxQ/iIvG8OAKbTRjZT3DpAnRyGl1TQk61vo9UNQnF9S4JylG+AVwNKkrDN0hvvx2Sv4EO1h9PK2ZC6RM1miO0HsgF6CjJGO0P+Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1326
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/24/2022 11:19, John Harrison wrote:
> [snip]
>
> I'll change it to _uses_ and repost, then.
>
[    7.683149] kernel BUG at drivers/gpu/drm/i915/gt/uc/intel_guc.h:367!

Told you that one went bang.

John.

