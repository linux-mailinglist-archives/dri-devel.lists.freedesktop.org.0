Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E418ADA43
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 02:09:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 379A610F95A;
	Tue, 23 Apr 2024 00:09:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XVRbFaSD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7992910F95A;
 Tue, 23 Apr 2024 00:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713830950; x=1745366950;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kZ47ZVN1jww+aBpdAduOUIEB82tPq7IamCiGAWwTZnc=;
 b=XVRbFaSD2s/SZPxaz1j6f1mVWdS+Voxi562eFRZWzzR0EjxYxpfyUEIK
 pYnxIL9pkWPAdh2YsgoPPfzviUbOgJDu9ModyS/HC+pWNQo3xizIwBY2V
 WVuH1HOmw5tIqwF1cKdQMt86vffSlYdpv5u/zfKm/cL8klQZr0Jl13CDA
 +HA2AoU2VCVHVRjPe7f7T9nH5zSNo5qko07Wlgj+4XY+oNGXuok0iPQCg
 MVJR0FZWaKUQGMLaGDJdD9NA1p1EACb1ESKSa4cD9ZbIUulE5lPJiZfj9
 xyjXGNeaX5n/plSU2c9oUmvoiJvqt9tXPhufVqoUEldG6MeGuyUk79CUc w==;
X-CSE-ConnectionGUID: 49e636VPSHCoImmmUFTdPg==
X-CSE-MsgGUID: sAjlCBpRROiBKKVvkxUPdw==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="31885217"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="31885217"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 17:09:09 -0700
X-CSE-ConnectionGUID: qya9f9OZTfmVV/ME7SKdmA==
X-CSE-MsgGUID: Z2l/xKGGQ96t7xsB1hBd6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="24254079"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Apr 2024 17:09:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 17:09:08 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Apr 2024 17:09:08 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Apr 2024 17:09:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PJRq1m0GQQBFoYZdPWUyzzzR4v2XLUfZmreTAX4CeXsGEWGA7o9VBRuX/8pSGB8i8DFG1copsXqncpa07F97BAlhw74LGPFaVYjg0J6fIY168t052A+VqEPm48uPSFI26TGMhAybEOAN02YMWDMQjh6DIkKETX+YIQGNjvvHunHz1IOlZpDXk4HYWcYZUgBzDLjxqdA5mEFbF74hviBycDJ/kMTUWxQmo5wvuUPtK2Gs5uZkioHA4c0Wjb8vx55CUo4KkEKp4y9tS6Cng70J25rU38OsS8gTXG7+2bQGuvGE35kAcXlYH4MLrLSAE8u1LyFne1re0lr0YnOBkirrJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5jUw6bkIswdWYiXDmxz+uXHLcaecpf1jyaaadjlGpQY=;
 b=kPvpKpKnzVjiexcjwmregzpB8GSA+78Jm5sm8NUkx5rYw2AEp08t229fyWUBlpnaki9c8aL1WRdLyoXrnyBWyem51Ye0/gVv87UQaNuX3hzNlGRxPcR7+uCiRGDhTFCrqmdTdcS6GBbQ+FLXqp1FQUE5kIlZf9GNYNxi21cMzKvwf8uX3++u/vhw7G47+8vS4HtKhNG7jELHSzQ2ardUvxG6AZ8A6jUqNIHFFpJJ2BIxlLL4kJu+hYn6wFCytK+qxV6qnpN1zjrr49BQFX7jdncmWF3LAjcvSjCxZ9FvruxhvNNbH392a36FyTnO+9r/BEazTpjGJhwCY2wZDt+Y8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.20; Tue, 23 Apr
 2024 00:09:06 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b%4]) with mapi id 15.20.7519.018; Tue, 23 Apr 2024
 00:09:06 +0000
Message-ID: <f09af7b9-90a0-47a8-917d-c028d9a9c1fa@intel.com>
Date: Mon, 22 Apr 2024 17:09:02 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/i915: Fix gt reset with GuC submission is
 disabled
To: Nirmoy Das <nirmoy.das@intel.com>, <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>
References: <20240422201951.633-1-nirmoy.das@intel.com>
 <20240422201951.633-2-nirmoy.das@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240422201951.633-2-nirmoy.das@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0057.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::32) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|CH0PR11MB5249:EE_
X-MS-Office365-Filtering-Correlation-Id: 810ce7a9-04d1-4691-3d5f-08dc6329971a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eUlHc3pWbERVTkJEcGZsbVZRRWxHQ0JRMUpVNGt3Qk5rajBOZXZYRUVzQjJW?=
 =?utf-8?B?MkdGZktxQ0hSQTV4alhTZWhGekw1dlUrdHV0ZUxGQnRrdXVjdkdObE9NVjJw?=
 =?utf-8?B?cEdpN0R1YjA4LytxcWkrWWFkYXFRUW83ZFNOSnIvNmgxdHJjKzdoQXkwQVhk?=
 =?utf-8?B?OVVOWmJHQWU4Z2N4NUR0S0pyUUVpVUhhdlpxZVNvWXNieUs0bVl3RGJLQmRx?=
 =?utf-8?B?Y3FsZEhoU20rbjRhQ2Z3N2syeGlRN0dUcm96ZXlhbjQyUGhzQXlBSmNMVE93?=
 =?utf-8?B?dTNJTkJVM3RYb09QaXhQSjBXb0k3NGhFdm01ZjZlcHRtNUtOTnpDcmQwRFZm?=
 =?utf-8?B?TmtVay9raEVXbXYxSExhaVBBaDhLR21wNTF0aHRuVWNmSnZQeFJYNzFFOU12?=
 =?utf-8?B?NnVNQ0tBN0x2VHFDeEN6d0hMQUlhNUQ4ZGdKYXpvLytXSFVYU0xwWDY5eWVQ?=
 =?utf-8?B?SzlxeGRleC94QXMyTVFpcERSdFp3aUp5OTE2REFYQndScUtmZkhUN1U0Z3Jm?=
 =?utf-8?B?MUpsc2lMcjE5TzN1QVd5Y0VKa3pkQi9hc1R5WHplbjBpZWF0WHZjSzZFeEpo?=
 =?utf-8?B?dXVEaUNKdS9LM0I5MkMyNzZRaEh5NnJCSHV4TkdzbmZHRmNCMVEzQVhyKzBl?=
 =?utf-8?B?MjMycTJ3SXgxbWNkczkwUXF1OVpLdHlUcU9qUHRhZnRCRzBvNlY0Rys3QzFh?=
 =?utf-8?B?QVV6OWhMa0JUQmFNK0FkcEgwSzJKL3N5QTVCVFZUdmQ0RUdZT1dCMDFTcGRO?=
 =?utf-8?B?L0NQL1lYNzlMZjhFcDQ2cERQSmlRU2l0ZmRORzc3Q3AvVkM3WWJhM0FvOWcv?=
 =?utf-8?B?VmNBRUVMYkpKMHNxbkwxOWwxUzlTUDlhanJsUlNXeXMzOEFzN0pqTUtBc1FD?=
 =?utf-8?B?WGo0Z2JjQ0lkQlQ1NGtSZEZDT09lcXQzSzZUby95QXhNdzZHeGlIaFl4YzNP?=
 =?utf-8?B?R3k0WmlrZlhGZGU5TUFBOTdUNVZIdk81TlN4MjMxUGkxTU1vQjRxL0pBeHhG?=
 =?utf-8?B?U2EwZy9yK2FBZnFiSTVZVUE3K3Z3QUNINUxKLy9LWHMrSzFEdk9wTEFmK0NC?=
 =?utf-8?B?aFFZSlVRSzFaU1JkN1pBNUdsVGNsQUdzR1lGWDMrOWpnaWVNdFc5SFE0Z2NX?=
 =?utf-8?B?WXNOKzNCb2t2WGxTbko2VWdBQkRHVGtjWDYvNmhHRDRRd2RsdkZISklsVnVN?=
 =?utf-8?B?VzQ4UCtpZE1BM2t5OUJCbmhrM0hMajJwaEVuQ3FkZWt5V29IdjRUWWU5U3lF?=
 =?utf-8?B?NlprK3VUT00xVTgwR25Cdm9XdHNncFdZVGtkOTVjUVdnMWVHVUNtZ3RpcGhK?=
 =?utf-8?B?N0trdGdTeWppY3ZaOG92RlVIRGZxVjNoeGdlbHgyV3N6SkRJZkl6VGFON2px?=
 =?utf-8?B?WW9QbDcyYW1IdmJMUGpvVjRqUmhDWHJHVjI0VGtBM24xSVBqakZEYXpzbGtP?=
 =?utf-8?B?K1lmaWdxdnVjaEpYQkRUZjVrd0ducCt6WlBQQUhDcXpYakU2WW1FRzVYTjBz?=
 =?utf-8?B?RnkwalkzdlNUR0F6cEZuNkdwMjJBVDdJZ3dNREZOazdlaVB5VW9ZRW83MWFy?=
 =?utf-8?B?TlAwZG9GUG1QenNOYjU3VGUwRTV1Tis1YU5WVFArVFVrNTlTbGhHcUMrR0Zo?=
 =?utf-8?B?QWgwQlNqTjNFZTJRNlkvVFJ6ci8xMzB0b1F5cjI4SWpXSm91RHdQeXU4Y0p1?=
 =?utf-8?B?SDU4UHc5bko2MStjVFhzeDlHVWtnNE9mRDVVOXRyRGpZbld0bnBQRjBBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnhENUJLWDE4bzdMQk9BOHNjV1BFcFFkOUFlTEpkSXhtTGNPdXhZemphMkhQ?=
 =?utf-8?B?NzRpdXV3Rk5raTZpQmhVL29uY2ZSMWVOaTFYaDJnejdXcUlvMHVUUkpGRDNF?=
 =?utf-8?B?YXhud3NLVms3UzNkRUNLd2ZUeHVWL1lVa0JkZFR0SUdXV3dLT1h1YTBBR3Rp?=
 =?utf-8?B?dHpWUko5b1RmaCtmTGQvSWlMUm9iS0I1aHRUYUxqZUdnRTZwb1A5MlJsMS9M?=
 =?utf-8?B?c09xOGExek4wSWNJY2d1NGZON0YyeGZ2S1I3cmhRTlZXdXJmcDNIS0tKQXZh?=
 =?utf-8?B?RHYxVm90WHIycHBJL1ovUGZVdTZGQUdPYjlITXJ2V2hEamRyemVadFFDd01X?=
 =?utf-8?B?TDIyUGJoZkVnYXp3U0djK3hwNVNsVlhoRExUa3BDTFkyRmtTZE0ra0FONm1u?=
 =?utf-8?B?TzZvUVdBYndnKzU0STdDbUl3dy9qRUlISUlmYzBwbENhV3AvR1R2bEtDbnE4?=
 =?utf-8?B?VFhBV1hhYXlLU0NlbnVPeXlaN2ZMa0VzVkhzZ0VRMm03MTc2ZFFuUm96eVYx?=
 =?utf-8?B?dVZzNnlGbTRvcHlvTlczZTdXYnJMY1M5dW9ib1l0Ritib1hKWXRFanV5SGdo?=
 =?utf-8?B?RWhaUmEycTBtVTE4T3NYRVluM3dwcVBmYzhtSTNJdzJQbnl4UmtzQmRLVUtj?=
 =?utf-8?B?NkNPTDVBVFN0WlppMnNML0VURE5BZG5samZ3a2VDYkxsaEgwYmlFalFrcVU3?=
 =?utf-8?B?a3NvaGQ0cXZodjJhMm9mYjdaNFViL0R5M1RmSkFzTmg4ZTBrc2dUYUE1c3M0?=
 =?utf-8?B?djlPTWpxK0lhNDRPMmVDQ3NlQklUNTB4UVd4VWU3bnZSUWlvd0xrY2l0S1ZD?=
 =?utf-8?B?SjJTVm9lZlBSREpScjFMR2tLUlVhVTJkdDBGck9rZmRkQjMxZklGQXk3bktw?=
 =?utf-8?B?bU0yRkMzYWhvZklLU0NETHlKR2ZwVjRTMTFWNlFQSG14YVd5TmpIVXNCZkNM?=
 =?utf-8?B?bFZ1TW9ncFhxYU9aeWV0eWxpWVFpMG1NOFpDdTBCUmhRVzlScTUvSGxINExZ?=
 =?utf-8?B?VHQ3MndpeHM1UXFnMkxiL3N5Q0ZaR1pHYmh1Wlg5R25ZZmVHMEtuZStUOWZO?=
 =?utf-8?B?MnB1U3I3V21QKzFmQm10RTl2OEYrOTZSMTRtQXczVGZudnJiK2EwVUVwTHhv?=
 =?utf-8?B?MENOQzM4M1pGUFpKZUhpczN3L0lrUzBEWUF3ZnlLRzFiWHRFdE0vV0JvQVNw?=
 =?utf-8?B?UDlkMjBnUXlTNThsYkFHTFUwWGJVSFJCRzVaT0JtRGxuOTJDL3RQeVNzbDlO?=
 =?utf-8?B?ak0yVmZUdURJNUJnZlVzK1hhbU9NZk5iN0VtaW9RMlloejNxTTN6cVBjZXdz?=
 =?utf-8?B?K25sMVhORHduQ3RyTGpqK2VPeCsvVStXVkpxb1VYQkNKQjFHMWxkLy9TNkI4?=
 =?utf-8?B?V3MzanljTC9rbVhzT1VrTDlwWUdsVjJmU3krZnRmQy9BMmlFa0kxRGo1RXJ6?=
 =?utf-8?B?bEt0WGx6dThaK0lVa28wcHFIYk5qay9YcUUvY2g3dmFtVVVnTVAySDFXbkQ0?=
 =?utf-8?B?NERGaGEvQTZNUXdPSkk2NWUrSTFGV1gvYmpnQjhCejcycTJOSytxc0NFT3NU?=
 =?utf-8?B?TFpRM1NDVmhCM2pqWnI3L3luMHBVY2ZNMStqVHlTdmpVa21nU2hGWDZ0V2g1?=
 =?utf-8?B?bHpyY2xFY3JSUXVLdjN1a1Y0RFozci84cCs3TlFNL0E3VThGSjF2WHVqQ043?=
 =?utf-8?B?S1hObXYvZnpGdHNYd05INmVvdVlYRjJxUExLa0pnYk5vWmFuYklLd01WMVhN?=
 =?utf-8?B?L0R5ZHVsaVZ3YysrNTkvVjFackl3R01zbzJDTHNoTEJpaXd4VWQrN0ZNN3Jy?=
 =?utf-8?B?QWs4ZEgwV256VDNxNit3VDgvWUZMclJYQ2U5ZjBHRnc1b2o0ck9Pbm1qK3l4?=
 =?utf-8?B?QU5paWVsVEZzQWFyQjcrelBYdjBBcVpFdUowN0pBVTlPd0tKR28rWlRrK2ZL?=
 =?utf-8?B?R0JVNjlMN3I4L2JmSnI2TThWVU50R09OSzdRN0hSMVozdDZYYXVSY204VmVP?=
 =?utf-8?B?NnJzY3ZPOHdBTEhyakZtV1U2MHQxaEZlYTdkV01NZzdrYlFidGNiLzZHRDVX?=
 =?utf-8?B?dXN3Wlo2citmck5ZVnovQlc3endVelh2cndTeERQcndaRTFHR2dxTzhlMmF1?=
 =?utf-8?B?Q3htdGxxZ2R2U1VpZDdiMjg0cG5yVWZoNlJaUkczVjlTVlhHTS85djIrdEtl?=
 =?utf-8?B?ZWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 810ce7a9-04d1-4691-3d5f-08dc6329971a
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 00:09:06.1203 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JCfoCdWVO/vgFKpkM9Tqrkj/owd/dlasmTe7kaFja8ZrjC9sZ25ZTPIbJirbhvLIrydTi36eeCigcsjbsiaE/LW5+t2YiicroyHeiPqzO6Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5249
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/22/2024 13:19, Nirmoy Das wrote:
> Currently intel_gt_reset() kills the GuC and then resets requested
> engines. This is problematic because there is a dedicated CSB FIFO
> which only GuC can access and if that FIFO fills up, the hardware
> will block on the next context switch until there is space that means
> the system is effectively hung. If an engine is reset whilst actively
> executing a context, a CSB entry will be sent to say that the context
> has gone idle. Thus if reset happens on a very busy system then
> killing GuC before killing the engines will lead to deadlock because
> of filled up CSB FIFO.
>
> To address this issue, the GuC should be killed only after resetting
> the requested engines and before calling intel_gt_init_hw().
>
> v2: Improve commit message(John)
>
> Cc: John Harrison <john.c.harrison@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/i915/gt/intel_reset.c | 16 ++++++++++++++--
>   1 file changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
> index b1393863ca9b..6161f7a3ff70 100644
> --- a/drivers/gpu/drm/i915/gt/intel_reset.c
> +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
> @@ -879,8 +879,17 @@ static intel_engine_mask_t reset_prepare(struct intel_gt *gt)
>   	intel_engine_mask_t awake = 0;
>   	enum intel_engine_id id;
>   
> -	/* For GuC mode, ensure submission is disabled before stopping ring */
> -	intel_uc_reset_prepare(&gt->uc);
> +	/**
> +	 * For GuC mode with submission enabled, ensure submission
> +	 * is disabled before stopping ring.
> +	 *
> +	 * For GuC mode with submission disabled, ensure that GuC is not
> +	 * sanitized, do that after engine reset. reset_prepare()
> +	 * is followed by engine reset which in this mode requires GuC to
> +	 * process any CSB FIFO entries generated by the resets.
> +	 */
> +	if (intel_uc_uses_guc_submission(&gt->uc))
> +		intel_uc_reset_prepare(&gt->uc);
>   
>   	for_each_engine(engine, gt, id) {
>   		if (intel_engine_pm_get_if_awake(engine))
> @@ -1227,6 +1236,9 @@ void intel_gt_reset(struct intel_gt *gt,
>   
>   	intel_overlay_reset(gt->i915);
>   
> +	/* sanitize uC after engine reset */
> +	if (!intel_uc_uses_guc_submission(&gt->uc))
> +		intel_uc_reset_prepare(&gt->uc);
>   	/*
>   	 * Next we need to restore the context, but we don't use those
>   	 * yet either...

