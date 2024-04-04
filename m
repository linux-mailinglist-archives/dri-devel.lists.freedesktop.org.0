Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B4B898A88
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 16:59:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59C9210E99B;
	Thu,  4 Apr 2024 14:59:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ijBujRFX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B9E810E99B;
 Thu,  4 Apr 2024 14:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712242792; x=1743778792;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oPxCY5ftTm1GDG7d1uZ7w8jHNYER/q2J+N+1Hu8xw+E=;
 b=ijBujRFXoWhRc4j42hJIUCiiRigU5nKkPfWpz+8VEwQVD6XWO1WxjyG7
 NBGPZwDnJZLxMOD3DhkVWzYJJ2Ca39ixLbJH3DSjmXt+IXL1R2eVFMIbb
 skhdk2E1oTipv4/NlK75A2zyOHPbH4PDMgKqNLsciSsp+xCflrmqOw0fi
 jdskIExMiG1gyqqG5Be972c+Z4NhZKYn+drtjaltiynOSLZbY3LfAXoUp
 EzJvW2DUmDtbP/u4QJiZ9buiKTXvrOKD55g/uXqs5nCdI0WFly96qDPlU
 +bSA1SXnZoE43/Ib2Aww1ofaoLuHfu8Z+NMuKMwTQICsVOrXpfs9EGj0G Q==;
X-CSE-ConnectionGUID: 2SOfJZEvRfe7GqVmrVcyVw==
X-CSE-MsgGUID: 3HCAxUdRRO615xqVjbtvwA==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="18886384"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="18886384"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 07:59:51 -0700
X-CSE-ConnectionGUID: cYg85ol1SF+eBuhobK3ngA==
X-CSE-MsgGUID: KbBPi6lTQz2CIrMujjqgFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="19267708"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Apr 2024 07:59:50 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 07:59:50 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Apr 2024 07:59:50 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Apr 2024 07:59:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lYILUO+blltOmym5Z8fGbnyqex5ER/iv0pt4MHjEslU8cFxEynZC2mBCZNBF8FF6SyyH3BI93c5t4GFahjcAjuVZPbzwKiYgHvKaD03EjZj2zRWHlRykeJTqnbKK6YmabcPlqlQFESOhFINtM56D3K68+G935t9jSjeVSYXGktfiaEENhvPp/KCZQxSF5PO/AuEZohHpydqklrzLkFndNVSHR7MWnyOUfkQQrFzAbhx06T9JWBbeXCtXoaK2cLVdZ23m7+J0JPjUIKaOJ5Se90nGR/9c8QnJbgqOEjCKjxEc8GKFIx075ozHZy1dSCfghvxOoUnYTMqtwvOtLDXvSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uCzsRrVxNc2lVhXVfm7q+RobdrgqLzoYc1822Gc57F0=;
 b=GJvtC3OnmCrQ8CAJ765ZIlno4OpQ4vFR6Ih5Xm+gsEMFnFWo5D8nu86EaLtaC4DnnO/8PMLZxZDeQa0oAH7/WPvm4gLsjGyJ907gVa3+key5GJA+2cMUf5gV8IPTELrmNOzgmVUYKueClkmfLj9uJJeTfoUqixE40iV17u4fss4oaG6dVK3W2jjOoHGptLLx/rmn+5NqniTJlkCGl/SDXNMJjygFl6/amZb3veh4VQZ3VRf/nXWXd/6ueRBCV+AWIR0SBkEsl5FMQsRBUA7KD0eboY12UcYdV8wBlToqVV6bdkvYIelmvqxL1ecFiudW1N6g252Gwydgw3+uaTVycg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by CO1PR11MB4865.namprd11.prod.outlook.com (2603:10b6:303:9c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Thu, 4 Apr
 2024 14:59:48 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::31a1:93ed:8501:f2c9]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::31a1:93ed:8501:f2c9%3]) with mapi id 15.20.7452.019; Thu, 4 Apr 2024
 14:59:48 +0000
Message-ID: <f3ec8e22-1963-47e0-8c5d-53a7e6fc73ae@intel.com>
Date: Thu, 4 Apr 2024 20:29:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 0/9] Enable Adaptive Sync SDP Support for DP
To: Maxime Ripard <mripard@kernel.org>, Jani Nikula <jani.nikula@intel.com>
CC: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>
References: <20240311094238.3320888-1-mitulkumar.ajitkumar.golani@intel.com>
 <87a5mvppvd.fsf@intel.com> <20240319-devious-natural-rook-df5f43@houat>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240319-devious-natural-rook-df5f43@houat>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2P287CA0008.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:21b::13) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|CO1PR11MB4865:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LjfU+rKjocmhlRg/4kP/L6zI2vmGvvJ5DpLsrhVe44dIf/ByAkQeagHjKqbOfow8i8UYDvAOCMKbeTLtRJm7anqto/mjDRvRsXB2kYknE+4y4qRq0t89/ERQ40PZjPmjaXLgMNkQSNE6HGv8aP57iPdScvI6pCcZ4fn9HKUKEN418Fr2LR0XXXWszgpQQ7/ANUrTD/cwKoNPeFQI4YHee3d9hnKjY3yvJJubV/bUOpQaWawuN4rI9+HUV5av4pDDX8pZP4/SnMVEcVLqWuxXF2XW5tdmbmtOtFm6Opx1b0g++Yq+0pbLe2YjU9mYN+UegKmkfKoP/fYenIhPy8SC4tai7QxGlgZ9WZkiBb7qoYLm78tR/Ydj7cHvSnUFb6IR6oH7Cdr6xndeRAaa7svbK+BxD8usBDkJ3/d9MSucU71lwia524V+eyhOZVKgJxLGYlSbCzva3z0aO0FBUjPTO9/h9GMgkfa2Qp5QlFh/JqJEfxUMm9XKpI9GfjxQoxmEP1q/h5dQ0OCHicViDnhDcb+nFhWkMUDHc9XXs8uTLjwlNY/Sk8mIlvou8CXKYYWj5Zh+WayHekMt6Zs5qFQAdKuir5bl0u5ju+0TV/COLfZZZ0jcOHkocW3OyXjqz0E5Z/XwGW3rh9NPWCpzjFU9a18Mh8mYG14vPatQmtp8fro=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXdyczJHNlRYL3F1eDR5R2VKb1ZmOFMvcW1tQXc0OHNyOW0vVDAvQXRDdTlM?=
 =?utf-8?B?MFNtL1JZUlV5U2U5b3NNbll0cklYY3VDT3FGcUF5T3FJRUxuWko0MkJMZ0l0?=
 =?utf-8?B?cmJYeXplVUJsUXB1R0dNVlNOZnAwRWRNTnBkWEZtZjBCdzd6c3hIdktiQlFJ?=
 =?utf-8?B?SE05b05CQ1Rmb3F0TFdBVWd3c21Yck85eEVjMU5zcVBDMnQzL1BSandMWU1L?=
 =?utf-8?B?ZDZkNndmTUoyZHFiRW40L2lMTFhZZUwzRzBFY1FzNWhreDgvOU1OVlBtZi9m?=
 =?utf-8?B?V00wSm92N0diT2Zwb3hiZDlHdDZNakNNR3dKdjJzUTZXVDJIUDExUTFYRHVC?=
 =?utf-8?B?a0MrL0dyWFkwVGlRZGZNdkpES1h6S3YxUnBRY1RSUFBGS2svekN2M2Fqb2Ju?=
 =?utf-8?B?a2xsdVp5aHRQYVJLUGo1bWQrb0FUc1FFeXpwMHZpOThlTTZTL1VFODlpNUFB?=
 =?utf-8?B?L21ha1NiZEEwOUlKUkFiU2dEZVhMK0J4NU4venVlbE8xMXdDYVB2dlNTYXNz?=
 =?utf-8?B?ZWpmNnZzRFJkdTd0SEtrUkhSS0t0eCtjMTdqRnkvQTVISzdqVmQ2Z0dwOGNa?=
 =?utf-8?B?WWZ1U1V1L0ZLS3pJT0FxWDNoenRyR2NIQkwvcnlCdFpISkw3TE1odzN6aXdx?=
 =?utf-8?B?NGRDekRCVG9ZWUlweUtrWS8vU1FBeUU4QThBWnZ6QUNHMHpvSkhvYjlMVC9Z?=
 =?utf-8?B?WERmdFRZVjh5WkJEeStqMUdGcUtJVlVJMmtJckwwQ1JCSG9mSGZWVjBrU3FL?=
 =?utf-8?B?dGhoUTVxVGFNZFJQeDZBd2MvOTd0eGlhYjJicWFoQ0JTbXd5dFBxWmdYL1FQ?=
 =?utf-8?B?NDZMVysyejNXSnplcC9NV3MxOVpjeDBMaVMxcU43K292WkN4dXZrQ0ovV1Bn?=
 =?utf-8?B?cUZSM0RBVDdTU3hBZGk2UFpaWnFlR2crWEd4c0ZobXpkazl5Uk9ZY3oxKzV5?=
 =?utf-8?B?R3pISXBmdTV4UVY4TkUza0FldHF2amkvTjZzcXN0NkhMbmh5ZWVhU0I1SnZI?=
 =?utf-8?B?L1d5M203R0poRzBkWllSak5NVEN2dU1xaTUzSTErQlZyZkc0bFlneHZrbnVq?=
 =?utf-8?B?enhTSmtmOU5wUm53NlY1NEZuU2J5ODZnaDBUZnd0cHdPR084dC9vUHRwMmVD?=
 =?utf-8?B?Mk4xMmVLQWswbVpLOFB1UnRPRW5tSFVJYjMwdC9ld1dBRHZGcHNiUUpBbUlz?=
 =?utf-8?B?dUR4RkhmRWlLY0NTM1FDWXQ5cXhhWmR5blJiNWJpS0RHbi8xMTArZjdidkw1?=
 =?utf-8?B?Z0NZOVorVXgvc1lmVytTbFRMTzBJNmNJeHZ6ZnFDMzFaeXF4QlphV0V0QmJR?=
 =?utf-8?B?VjYrK1duOU9JNUJ3ejBRUkROKzdEeFNaZmZoYTM4T3pCUUJtbXJ6Q0lhZ2tW?=
 =?utf-8?B?eHFBeW1lckJVeWgzNDZyRGUzMDUvcG5pRUZuZFpOOWozN1RnYURWcEdGOTJW?=
 =?utf-8?B?bkFTRUdpSmEwbnpBK3YxY3RIb0VLVWYxQmZGUkJMMENWS3o2NElGZWtLZDNB?=
 =?utf-8?B?cW1NQm5HV25ZQXVicktpMXJneldJQWpyNms1blBiNlFFaFE2a1NBeHF4aElz?=
 =?utf-8?B?ZVA5dXpCS3VkbFliOUpXaHdBaTlpY1ZEUGU4NCtxWXdWMXhucWpnRlI1UjNY?=
 =?utf-8?B?NDJJbm4rNHRMTTZOVUpBUk5Yb1FoaDdMaWtBN2VUNXJ3RTliTzBkNGNSYzg4?=
 =?utf-8?B?L21xb2ZqKzgwN1FPVHdkZHZMWnMzY01udklhYXk4Y1FvVTBtWko4YW9TWG0v?=
 =?utf-8?B?S0FOVnBOTm1uWi9mamROd3dhdmJXZ1BMK0FnSklxUmxNa3dIUm1ZSTNoNm84?=
 =?utf-8?B?cnUxN1dUL1FEMCtiNFczZFh2dWo2YzVDYkNtTFpmRENPOUZycjBWSjJUM2pq?=
 =?utf-8?B?YzlWNTRaUkJKV3JweWNJMmlZZWo0Q3AxUUpVWEZDS09zYTRJN24vUTJUb0lw?=
 =?utf-8?B?dzd2S2dkL3hsQitPd2NtWjlhWmR4eVFFYWFxTGJ3SzdEbWpIRiszZ2Nxb0ZZ?=
 =?utf-8?B?UlBCVE5qWmc4ajR3NTF0b2FqZVFoQTBrNy9yMWI3VE13WVhxT3g3YS80TnRZ?=
 =?utf-8?B?TUJuejY5RHdWeFAwemRMWWhYV3l5dHhXOXpWNXprTDZnT0ViR1k4SVg3YUw5?=
 =?utf-8?B?V2I3QkcvSXk1S0t2Y1BKbk9kWW81WHhMc2loWENDVEY4OEhaSEpDV0wwT3Fx?=
 =?utf-8?B?MUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 16e81f83-64a8-4f95-c35b-08dc54b7df51
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 14:59:48.5495 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dfEz/cG7iKXFzMJBXeMNzTV/KeYX3yG/eKv6hg1BhkAUyzx36LjTFmD0Wju010tnG1zE37EscQsZRVgDpu2bwbPasNuIPSB6yQkVgusIQ0s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4865
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


On 3/19/2024 3:16 PM, Maxime Ripard wrote:
> On Mon, Mar 18, 2024 at 04:37:58PM +0200, Jani Nikula wrote:
>> On Mon, 11 Mar 2024, Mitul Golani <mitulkumar.ajitkumar.golani@intel.com> wrote:
>>>   An Adaptive-Sync-capable DP protocol converter indicates its
>>> support by setting the related bit in the DPCD register. This
>>> is valid for DP and edp as well.
>>>
>>> Computes AS SDP values based on the display configuration,
>>> ensuring proper handling of Variable Refresh Rate (VRR)
>>> in the context of Adaptive Sync.
>> [snip]
>>
>>> Mitul Golani (9):
>>>    drm/dp: Add support to indicate if sink supports AS SDP
>>>    drm: Add Adaptive Sync SDP logging
>> Maarten, Maxime, Thomas, ack for merging these two patches via
>> drm-intel-next?
> Ack
>
> Maxime

Thanks for the patch, ack and reviews, pushed to drm-intel-next.

Regards,

Ankit

