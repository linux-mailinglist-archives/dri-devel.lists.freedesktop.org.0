Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FF958D565
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 10:32:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89049CB9B6;
	Tue,  9 Aug 2022 08:31:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC139CB984;
 Tue,  9 Aug 2022 08:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660033890; x=1691569890;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=R9o9+EkKFjd1BfNmCyOUlnu8UnxI8h9WZd/KupyXZf0=;
 b=XIdzjvXT7tgNDqwYz3A5OxfzVdu2pdMFnY09IYMfO6uFIK/0uJIsM4ln
 MgFS20K02MJrZOBpvxW5MkEIzgeadHK7Swk1HxXPxW84q4ifUowES+em5
 2MdTY88UYA2RsdWlrxFZa9YtvJnS43V792IEcFdOqyuTlAeqqTHt9BhKA
 DnQ59/trOHsjlVQ4mcn31cziwqOh8MwQzYHtXGj6J4qi/lOlrs368C0sQ
 HKNaS1s+a6gA+0mvRDRnOnfwkqkEZu2bCjBIbIfpSuWFfOFFm9XKa4Agc
 P9Ksj9uuSEcHWTjLzFuOFjS/23qskRNLiBFsJcQH+QZtPUTfF8cVshHTe A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10433"; a="271171245"
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; d="scan'208";a="271171245"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2022 01:31:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; d="scan'208";a="637634648"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP; 09 Aug 2022 01:31:28 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 9 Aug 2022 01:31:28 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 9 Aug 2022 01:31:28 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Tue, 9 Aug 2022 01:31:28 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Tue, 9 Aug 2022 01:31:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nVtShciaG3KSmZCunP8b/ogfiY0nBqkMg9vaKaE0SsoevFZURZhqV0lB6yYLJx8grGbzfzUUxrCrpBkH2B719TgAULKHwePnl0OWvvFmRw8PPTIxF3l9zXmMySpPZBFQEysrvyX/oOkvivs5Ob8LIHShmGvbWVnFjKZQOy7FOf0qMf7GXqaAuWOfYo01tQDkQFnomN9DgiaYL+dUKT23DKsVktWDoocWvP0LRPBweIftzeg5UlMGmnw4rWpsJxzaMNzaIve6WavSOsCmgVB2Y1eJegY7UGJ0Og8xBaTvw8kWIs9fqMXyCT6DzvXz+qu3wPlIiwlj1dtJR0S6APU8/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jYopbuA2FzLFROw6VPy21f/xcJl8UQ2nts8xWRCnMpw=;
 b=BvXCEE0qQGtYHxSrmYLsJcre8QBul6h3RuJaMiiDaHiCmaBr+NC6BVzP+ATQSobFIrEr4oauS4nV2jLemlmoH8wxf5hcEQqozHiUqTqnH4Bj8N0YiVvM02xFch2i94U+yb+ipbtqYK5VmGoiSOoKyjW+tC/ot7M4ft7BDFt9xa95H7pJ6wLQUFLshcEUynpqjQe6npDZTWdCNNFr1LUfoQTjcRE1dRZlAS7Esu2/SBH5i7XixXtNIw4dN/TeDIxz034iVDLER9XRzD3LuLEpQqsUyJOSVl6iafaxspefpx07CEfnKf3QqnyoBc6BOUzcf4e8XZVvf2VK/9gNRBegyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5409.namprd11.prod.outlook.com (2603:10b6:610:d0::7)
 by BYAPR11MB3414.namprd11.prod.outlook.com (2603:10b6:a03:85::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15; Tue, 9 Aug
 2022 08:31:24 +0000
Received: from CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::70e4:76ca:fc65:df73]) by CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::70e4:76ca:fc65:df73%3]) with mapi id 15.20.5504.020; Tue, 9 Aug 2022
 08:31:24 +0000
Message-ID: <3d333af5-456f-3328-4e51-5057364be2c1@intel.com>
Date: Tue, 9 Aug 2022 11:31:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [Intel-gfx] [PATCH v5 1/7] drm: Move and add a few utility macros
 into drm util header
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>, Jani Nikula
 <jani.nikula@intel.com>
References: <20220725092528.1281487-1-gwan-gyeong.mun@intel.com>
 <20220725092528.1281487-2-gwan-gyeong.mun@intel.com>
 <YuESy0q5X9pksg9M@alfio.lan> <875yj9qv62.fsf@intel.com>
 <YuuMLN4jDnCrE0hq@alfio.lan>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <YuuMLN4jDnCrE0hq@alfio.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FRYP281CA0009.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::19)
 To CH0PR11MB5409.namprd11.prod.outlook.com
 (2603:10b6:610:d0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56b9510c-c481-4508-45b8-08da79e18b86
X-MS-TrafficTypeDiagnostic: BYAPR11MB3414:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BtzyWYnmmUq8D+kvd1Z7rHWrzDHKPTVguBaH4BXVAvKsbTfskw23GBt0LLJd3HJ+ZBRqp80D/g+Wn3mF/mLpqDWLjKbVUG4/oq00C4nurUS80MmgrUBa4DN1LPrwvC0wyXyrvbSfQdQ0yW26nGYxPpo9k6Bc0snA/kevq/f43gk8OCWK5ehpQRVQivMEJIgx6ICYcYbSsbUyb6V7bOL/540JU6MGSDw/h6eXEiQ6UM8L9DUBv23BTvHIXfJDFkGaQ0QJIK6iTVBzMRTG6ZoKXCEVkHWauOQLl5vdYZWsIIahiyPwBX1rskuBiPHMR7Bic+OKKgFS2aKCgrYHbxZHNuE7BR4ihp/du+0TCeYXNApZOhWRjdd0Vv95mELW967+EU+USGLX518641Smx27/sUg4x+SjmlmK86PC7YtWWiRT3xQJzV0psQFmpJ/gn6lQnHyxPLTQNxMhoCDFN0sceMg7hVXSB1ZOsH3IXDMOHV0JnoPnyxDV9eMCQrdFNUEZr2YH2EK5BETLrzXjktv95tklH44cl2PzGcxltmPJq3JD24hT4RTkkeF0bo+iHvXt9Hd+U2Gl7yk6I0r73hFCH11PLMkX4TZYchHf1dE4g4CIlFVvQNZQNDrIuXLeqjXHjawECQFiKjDtRgCdMSs4Ij2tlhJ4mossQhpgZrLR9L1pNtUxVMZszwBJ9xcJ4q09GXdjDVf70rWNVtVknR5wHMaUz7XCpV6Y3c+k92F22XGEiz3hS/CC9ojKlgrjTYQ/qgnQzVjMJ6lvaPF/WD5LIdjK5fM8regEO6GO924TFHr5x7mcdY4MlPwL7mpffMVbcNL8rQUr9h5dv4FCb99oNA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5409.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(366004)(346002)(39860400002)(136003)(376002)(66476007)(8936002)(66556008)(4326008)(31686004)(66946007)(5660300002)(36756003)(8676002)(6512007)(83380400001)(2616005)(66574015)(7416002)(2906002)(478600001)(6486002)(53546011)(26005)(31696002)(6666004)(110136005)(6636002)(86362001)(54906003)(41300700001)(6506007)(82960400001)(186003)(316002)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3BhczhUUHBidjNSY3BkWWJ1MlpNZzkzdWNPcW1LZUhrbGphb0F2c1VHVW8z?=
 =?utf-8?B?OUJuYmJDSEhrQ0hhY2oxalNoRW1XaWwwQmI4M1VZTmFjSlkzTjdKU3JBWTRp?=
 =?utf-8?B?SXlrU2J4Y3U5UlRVa29tNVovTUZCQjh1MEF2a3pWM1JQNUc0NFNwZWl5TmxO?=
 =?utf-8?B?N3g3cmkvWUYvOUoyTHE5R1dyUWh4Q2ZKVzgvRjNQdytkdGFrUnhwVG5sVlFM?=
 =?utf-8?B?bXYvN0pyQmQzSkljQWVtc1ZoRklJckdYYWtyRkdYUGdWUTc4alQvd0VnQXRP?=
 =?utf-8?B?cDJtMThoaFlybVF0TFhSbnhvQXFQRWxJN2tHTHVnLzR1bFVYVVphNVpaUWFR?=
 =?utf-8?B?VktEWnJOaHcwZ3NlRFl1U0xRN0RWUzgxTTVaOTVFcUdUUXFycjdrcHQ5UThM?=
 =?utf-8?B?czFIMW1lamw5RlhBWFQzTXovdjdxOU9KMFRZbGQ5R01qbmkvUHNWSHZzNXhC?=
 =?utf-8?B?NEkrQnVXWDZBbWZSSHYvV0hzZFhuSElhVUY1U1FWS0dla0pFN0FCTVFXcmJs?=
 =?utf-8?B?VTNLZmJUdzgydDR5NGRjWHkwdS9YczRmbDFJZ0sxbzdBSURtMGhNald4TmdO?=
 =?utf-8?B?c2hhZlJteHBUVFJUdnY4aURFV2lBUmVIOUtidjd6U2VZbVhTNzk2ZDV1bHdy?=
 =?utf-8?B?NGM0UWZMcDY5ak9lZTVOb3FZY0ZBb2cwZTUydTkvUGpuaEp3WmYwL0k3dlRI?=
 =?utf-8?B?dHo3cWFQQU5Cam9jNldLYVNaQUIxS0I4WmJxVHBZMlNQM1pQTkcvYXJ3M20z?=
 =?utf-8?B?OTMvdWdUVXZxaFdLSFVYQ1JPb0F2RS9xTlAybXBUa2ZXUjhaSHNHWGM3TTJm?=
 =?utf-8?B?NVh2anhxb2s5Mkh5Tm1Rc1dxbFVvL1Ewa1RtODdBVnpSUVRDcnJoK3NXeEpG?=
 =?utf-8?B?VXBvWGozUndoODJRNU05dnZrYjhjc29BM1N6UUM3dEtVZVZhK1BPelRvVkJL?=
 =?utf-8?B?ODJlNytPNitVL2FBYmpnU0Z5UzBucEszdC9ueGRUVFpuR0lxbkdXY3dNVEJB?=
 =?utf-8?B?M2ZsK3luZjBZRnFFemo3RkYzRk9MU3JGZW84WU5MYmRaUHJtd3V4dmlSalNV?=
 =?utf-8?B?cUtnZzdHV1JJUkdiU2V0S3BoZUFvVGFZZjZKeTZ2MW16bk1NVnNOWWJ0cUta?=
 =?utf-8?B?Z29aMmorN2NiV3ZEMklMbVpNcTlYUmtsbVZWejRNUFVTa1UxalZqdzhEb2RO?=
 =?utf-8?B?ZStPOFVHcHE1cDNHaUNFejkvS3pkSC93TWMxNWFubXMrdWVxcHV6dUNkaDJ1?=
 =?utf-8?B?RklUQ3gvcUVlRnJCYXVJRVJjTVhzME9mQ01Ld3pDZzZBUklrUnVXSG5pczZJ?=
 =?utf-8?B?VkJVb0RLa3lCUktMV1gyVGdnalJVRUtzT3RWNzYrdjN5Skl2QUxUTEJ4dDRk?=
 =?utf-8?B?NWtkYTNrNCtETXVzdExNMDBvLzkwMC93NHN3ZGlybUlMMmpjMGNFM202aEMz?=
 =?utf-8?B?UytRQkpuUmYvcjR3OEZ2VzRnZUxJcThOV1k3eVNHSlVpeXlKMjNONVcvb0xt?=
 =?utf-8?B?QVpzUDBkb2hwOVNnQnBKV3UzOEs4WUEwUXQyL29qMTFsQVFVRlQ5czJOYUt1?=
 =?utf-8?B?NmZFYXNYb2dKNFFxdEF6S29nZW5IVTdkcFRSTXhLVUhabU1rQnY5elM0N2t2?=
 =?utf-8?B?UlI4TFlCVU5IK1JsM0d1RjJMQ0tNTE5RS2J0T21RdGw4NWRoZG1YQnFERkJZ?=
 =?utf-8?B?ZTRwZXN5Z2hNUGMxd3pVa1oyZG1YZUJCV2EwY3FDRDFQSnNaNzRXMzFiNjk3?=
 =?utf-8?B?MFNVOFhZYVhicCtNeTJuMkNLdGNYMCsvNjVqUkVJbHhWYkU2aWRYR3ZDVUVp?=
 =?utf-8?B?WEkxMXJocGQvMXVQYVpOYkRQazRFOXBTN0R2SlJsRHhPUXh2bmFrU2h5K2Q5?=
 =?utf-8?B?SWZiaWVXVDV3dFBnTkRSMFdhYWd0TllORmNPWThDUllvbzVFU3lQdVQ0aWtJ?=
 =?utf-8?B?QjM0TnRldkRSbUxzNHhob2ZOaVJhVGZOYll0dSs5dkUwcFVIR0xNdEtFUEFq?=
 =?utf-8?B?MnJBdFByRGNFaUFKa29ZN1FOdHRVOUxBY2ViNGw5eXVUdFh6Ri8rZFZMaThF?=
 =?utf-8?B?NG1IcGlBSTQwQzRLbXdDYW9ZNGM2SmR3Wk9RVTdjRlZSUjBVN0pQWWRXVFIz?=
 =?utf-8?B?MXI0T0s1UUMwSmZ1Q25qS1ZwSFdOUjY5Z2d4UHJzd2VBYVpjUVlYZjVyd2hs?=
 =?utf-8?B?cGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 56b9510c-c481-4508-45b8-08da79e18b86
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5409.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2022 08:31:24.5374 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8WCaUc07mEEEsYMGGlixz3yuIsqFRaqOYni4KE+ENOYM9eUXsdXJWDqzifLQca+ZdExPOxBNgLuTGDG31idF/G3zWyZwrmRCj8puRdOoLdc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3414
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
Cc: thomas.hellstrom@linux.intel.com,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, airlied@linux.ie,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, matthew.auld@intel.com,
 Thomas Zimmermann <tzimmermann@suse.de>, mchehab@kernel.org,
 nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/4/22 12:06 PM, Andi Shyti wrote:
> Hi Jani,
> 
>>>> It moves overflows_type utility macro into drm util header from i915_utils
>>>> header. The overflows_type can be used to catch the truncation between data
>>>> types. And it adds safe_conversion() macro which performs a type conversion
>>>> (cast) of an source value into a new variable, checking that the
>>>> destination is large enough to hold the source value.
>>>> And it adds exact_type and exactly_pgoff_t macro to catch type mis-match
>>>> while compiling.
>>>>
>>>> v3: Add is_type_unsigned() macro (Mauro)
>>>>      Modify overflows_type() macro to consider signed data types (Mauro)
>>>>      Fix the problem that safe_conversion() macro always returns true
>>>> v4: Fix kernel-doc markups
>>>>
>>>> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>>>> Cc: Jani Nikula <jani.nikula@intel.com>
>>>> Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
>>>> ---
>>>>   drivers/gpu/drm/i915/i915_utils.h |  5 +-
>>>>   include/drm/drm_util.h            | 77 +++++++++++++++++++++++++++++++
>>>>   2 files changed, 78 insertions(+), 4 deletions(-)
>>>
>>> Jani and Mauro suggested to have this macro in
>>> include/drm/drm_util.h.
>>
>> I can't recall suggesting such a thing. The macros in question have
>> nothing specifically to do with i915 *or* drm. They are generic, and
>> should be in generic kernel headers.
>>
>> We must stop piling up generic and generally useful stuff in our own
>> headers.
> 
> Yes, I agree with you and I think there was already such
> discussion whether to move this into generic kernel headers or in
> drm header.
> 
> Gwan-gyeong, any thoughts or further plans to move this to a
> different place? It's been already three people (and I'm
> including myself here) recommending to have this in a different
> place.
> 
> Andi
> 

Yes, except for the i915, there was no use case in the code, so I moved 
the header file here, but thanks to many people's comments, I will move 
these utility macros to a more generic place and send a new patch.

Thank you for checking again and for your comments.

Many thanks, Andi, Jani, Mauro.

G.G.

>> I thought I've been clear about this all along.
> 
> Thanks, Jani!
> 
> Andi
> 
