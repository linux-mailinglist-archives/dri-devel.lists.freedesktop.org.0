Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E056231C2
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 18:46:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A6FD10E608;
	Wed,  9 Nov 2022 17:46:42 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61CDF10E02C;
 Wed,  9 Nov 2022 17:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668015996; x=1699551996;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rCg0rh5RQsPpfW0ZmKepficXLa/vOc7jYHkZ5tjwZIg=;
 b=eUb0QGCMLln7Lx46Q+//ESLKREd8ywqGRiUVQRCAKGyDoJ6sBUBhYHLP
 4kU/Z36qEIjFabINL9Zsqn4t6Y66NGZUfkRqp79Sa+AVrVe3OOtI7xLl0
 pW6LLwWNgOda3IPhG6Fih33CH6MKkM4448JEjqLPxlDkv6gbSxx5SThiv
 eQYuKCS3QoSlEwqdQJL0CwFas3BnFg+ErQCC/KdhkNnxcuDh9eVRX6j2Y
 PMweZCJjhbPiuoA3Pf1VbF5aLM6eQwb3w32U13IjBY1PDyyjL9xj44Me9
 eBEoe3wPebn6mgDkcdhsZqhzb8qRBx9BQxMCdSbLTKYRxjFWB9faI0QA+ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="298574702"
X-IronPort-AV: E=Sophos;i="5.96,151,1665471600"; d="scan'208";a="298574702"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2022 09:46:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="587851284"
X-IronPort-AV: E=Sophos;i="5.96,151,1665471600"; d="scan'208";a="587851284"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP; 09 Nov 2022 09:46:26 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 9 Nov 2022 09:46:25 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 9 Nov 2022 09:46:25 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 9 Nov 2022 09:46:25 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 9 Nov 2022 09:46:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TFs8GFPSWuyW/Ipvr8fJwrP5FQ2Ul1Yug7LwfGjG4Glf0SrGoQ677JwBRNWSsJ4ROaAiVqvJdd3Y2sL8tTxpOoaNMApTSTSnxeel7NNA5ZE2Fi4EM/olb48KGZ1knT2gjDArmxXHr211oV7/nxDdf5EyMPE16NmXLYIIU47HVWjO3hs47GSU4PjH2Rl8byloKcVG4p7NocIgdrzqqdrDlPjDRpdyfvT0JycoZF1h1yiolOkkpbSJ7KZEFdM/80227YhfQc1qxZgST9WsghN3juPDF7jHQOE3X+KzSfLhwhEouZiUV/DWi8T1kU3LiTfrYMiskjQ5UTB6kzieTUfVjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sNyYJJSnQ0IA3Qd8RNtGglhv3xMdmTjlLCPhRgFpJxo=;
 b=Qb+foNxeFn516tvyxzm7IiOV3s4nHjYZOZDexo4H+ohfLLn+Zq8+RAaHsdzfGWyvHd4SZ+xZ9ClKYNkkLN3K//RMJFmaf4ZSd7pBg6yUAAc+H91ZFU9Eo/rXWhLEe2M40aBAjZezIjUuXHZV9c+speAxE5rkyPvzwcbZE//ApMLha2C0JNSy7pCwSaOhx+fUFbK97xHDAS0uc6eSlobH+0aAd4VHFMcHkUAmCJWjgW2EKq0+XSsy3LLdYJ6seV/pduj2t51kgNMe5G7MJDJLEAwVeG2HjSLy4Ze0+KTWWHyCOU+5sWlzAKblpuiQ0F5PXXxDFfX1/c0X5uXMkOINJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by BL1PR11MB5510.namprd11.prod.outlook.com (2603:10b6:208:31d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Wed, 9 Nov
 2022 17:46:22 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::87a1:bf2f:7377:3036]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::87a1:bf2f:7377:3036%7]) with mapi id 15.20.5791.026; Wed, 9 Nov 2022
 17:46:22 +0000
Message-ID: <67d18d17-8a01-32a1-1ff6-099c708ab290@intel.com>
Date: Wed, 9 Nov 2022 09:46:18 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.1
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/i915/gt: Add GT oriented dmesg output
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20221104172525.569913-1-John.C.Harrison@Intel.com>
 <20221104172525.569913-2-John.C.Harrison@Intel.com>
 <6a4d1ac0-a1a0-e1d4-7d83-54b43d226371@intel.com>
 <fabaf9ee-f3fc-c18f-56b3-6d073618da41@linux.intel.com>
 <82055e8f-9bee-2b03-3dce-dcf66c30c903@linux.intel.com>
 <2583bccd-82fd-967a-aec9-e6d3837dbbed@intel.com>
 <1ad6bce7-9626-afa6-d73e-6d8f7a9c4d2a@linux.intel.com>
 <c9742b0f-546f-cccc-021a-7bad68410838@intel.com>
 <ad19d7ce-4102-4f8f-903d-7390b004b2e9@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <ad19d7ce-4102-4f8f-903d-7390b004b2e9@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0195.namprd04.prod.outlook.com
 (2603:10b6:303:86::20) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|BL1PR11MB5510:EE_
X-MS-Office365-Filtering-Correlation-Id: a6f7a6c3-59c8-4d56-0fbd-08dac27a50df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xma0/T+M89pqmH4c1LSiHkwe+GjSiqE30je+ycbB7ov6ybwDp2QyWTfMSx4MKv9oVZ1T/mu46uG3fF7W8BeDyXjC5nbcsdtjuOshu4dQzLijLz1kYLOJKHCICc7mE6gjJFGKPv5ndOcgTc8AhhuzBbPP19XaAez6TAIp/2BHLrPT37USETF9mxGULXOYJArhcZvoRy6vCgkRzr+Tyu3kJp8MLREZP9qShNaWf9+oK+hdRWf7+7EF3iPzAnd05Ez5p7sdBRc190GlUZyoAOP7n5vmODnpkzIv/ohE7ZPh9mGNFYnJMHDKYAyAEASaKPc/KY+/FsEO84QXBLXY/mFUz2X6MQIkSPRK50XN9SLMC9UPh1awipnzhRyxUYn6udOKqFrYqr+maqala5WSlq+dbfzWedMXCNzjn6Ayz/UOADKzaeVCnwO+pNEcJnKD19SR3o/tZbnwImUG13RZPoGthS7AOWFeLu75SMpmBLu5T7eDw13RbFdw5dltJ6FXEt5juqqgTeXgrNlxIRMiRN7qP9qsFwAhGlJe+vQCBd2jGWQOOZCV4mcXseglWYJnHECxSSNH3U0KjyogrhkKSXGdEk+dZsMdVlAUZZk9u63ZHQZhwRF27m00ZocxgQMUIfko5k48gPBsp9W2hXChxuWcwi8wWwFuHjYZrQjtRzDrUJZBE2oFSgLWqcBKwpmQ+c1qwBHJ2HIzJ0X3TvEhe/gT1/QCQsl4w+omxHSeascbv0+V/Cg6ez7e7kYoBcfGkq0Iqb7s+mp/1o9njHTaSF4hdJA+m9VJ7PdGXXQoKb3lSUh7NoL8f0LJmnIr5ZcCnSQz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(396003)(136003)(39860400002)(376002)(366004)(451199015)(36756003)(31686004)(31696002)(82960400001)(86362001)(38100700002)(83380400001)(30864003)(2906002)(6512007)(53546011)(186003)(26005)(6506007)(66476007)(66556008)(8676002)(66946007)(54906003)(6666004)(2616005)(110136005)(4326008)(478600001)(316002)(41300700001)(5660300002)(6486002)(8936002)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmsrVkMwYkhWYjBpTFZwNEJvdXJWSXpzK0dOSGtTcGlJeEpIS3YxWEZIR2w5?=
 =?utf-8?B?dXMyNWlVWXYvWG4xa0NEd2srTk12Vm01MmRvS25zczhSbkNoVjJqN3NvblRR?=
 =?utf-8?B?WHd3V2Z4ZW8rMXh1dkQ1bmFpN0YxS2JSTVFvb0FkU01IMmNqQ2NTMFB5cG5D?=
 =?utf-8?B?WVNVQkV2Rk84c0poRUxneGxXZEYyMWRWSFhqbEhBVDlxNE9FSHlaTmtNZDlO?=
 =?utf-8?B?ZFI0QXk5SkZLS0tDQmV4a1lrSVNQOTJmUjZoM2xuR0dSRWVOeURkNjdIbTV2?=
 =?utf-8?B?NVUxa0p1U2hwMVlLM0NCL2NUVytpM2tVSmpSYml2blNVZ1JrL25RWmJ1dEkx?=
 =?utf-8?B?ZmUyVmZwWWFtbW1PYVBFTm1ZaGlxMmJ4eG9OZG1RKzRPVEdXcjRZdTlvdFVq?=
 =?utf-8?B?QnBTeEcxcGFSWkR2SDZJVjlZSDZSUjg5VXZjQjNveHhobU9WR04zT1hTc1R0?=
 =?utf-8?B?YTI0dUw2YWFvbjlRUW9YU2oyd0phWm9laldhY1BkYTVBRnpPc3lIUkRDYmxi?=
 =?utf-8?B?c0JoZG91R0JJOEY1dmQxbE5kdTJEVUtoMGp0ejB5REFoN3FTTHRXdG5NQXph?=
 =?utf-8?B?YlNSTnVkeTlDVDYrNEUwZTdld0t1WUQ1QVVNU2JYUDZZcFpBME5iUnFQNUp6?=
 =?utf-8?B?bHpmLy9wbXhoSURlY2NiTUpzUXg2SkhEaXVXT0tBcm5BNjk4Ky96N0xEV2lm?=
 =?utf-8?B?SjJpMjBSY1dON2lUbUFtczlYdGFtbjdBRmJmazFEUkI0MkJUYkVaRjFSRFJp?=
 =?utf-8?B?RmUvNDlmcGR0NE5RVC9FU0F3VVN3b1FZT3hPMWxpZHN2UHV2dVlRYmxRTS9h?=
 =?utf-8?B?a2xlc2s0UlV0WWsyN3JUVUlKY1BaV25WMktBL0Y2MlNORkh4dmlPQUtYRnUr?=
 =?utf-8?B?MzVmNjg3RXVUQnVEOVNVZHdMUXRYNmd5S3owWjI3aXZiRnNRQWZtbW5GcmRj?=
 =?utf-8?B?MmxmWkQxZlFZSTg0UTcxempWaXJwc1hrSVo2OG9uYkVKZEJ5eVpHMjVHajVG?=
 =?utf-8?B?cG8wTktQQ2ZSMnJyS3NKVHZncGxFN2g3Q2FHOUVtRERqYk02WVhPNDM5d2xV?=
 =?utf-8?B?QzNUaUo2azVzRFQvVWUzZktIVE9wUFh4UVZIaE1JSmF0ZDladlYyMENrRy92?=
 =?utf-8?B?RzNmRElyN2ZFWm5NaEd1OEJ3aFIzVy9SNzNEaDJmbHd5OVg2bW5BYXRXMEQ4?=
 =?utf-8?B?bURGaG0vTmJPekRJQ1UvTTd6bCs5SGNTNVNaQXhaSVJmUEd1OXB4YW50WjFT?=
 =?utf-8?B?NUI0OSt0b0t5alRRWnBISnVFcms1SkZZVVNSaTgremFxb2JwTVk1WXlPaWhu?=
 =?utf-8?B?K1JNUGZZOC9udWJCM1Yzc2V2OVRNdnkrL0pBYXg2RXhTekdrOHdXMFhWU1Ew?=
 =?utf-8?B?VlcxVU5IYVRRSktBU0prdFFEV2huRG5wdmp2WTBzbzl6T0wzTDBzeFRPdjRy?=
 =?utf-8?B?ZzZPU2dya25XYlNPd1ZYVkFhRWJRT29vTkg5UTZwdDJOMDBhV0h2WVI4OXVq?=
 =?utf-8?B?TXBURmx3TURvOHpLK0ZCU2xyMXpVWE50SkxzQUIydjMrSmF4bVZ2QVpTSWs1?=
 =?utf-8?B?UytDdERjd1liaEVaZlg5a3Nhb25QdDUzUm5kUkRoNzZBL2FJTHl0SUdEaCtx?=
 =?utf-8?B?eG9DZWtQYlBTUVFhRWlVNGxkSEh3WUYzU21nVUFKZ3QzaUVwRkFDbGFyMENI?=
 =?utf-8?B?dmlRM2lJc3NXNTdEb3J1cmtWRDg0WU13cGNrSnRyeVpBR3lSSWJGRVpxanhu?=
 =?utf-8?B?SnpLRlMxc09JSEFDRXBMbkd4bzBINyt2V0g1SERzWm1qLytBeVRSMjlHUTJG?=
 =?utf-8?B?dFRhak9hdWZrTVNVNEU1djFvVDVPVDIyamdyS2sycUdhTGlGcmd2U0xWN2xZ?=
 =?utf-8?B?eG9tcTRLNEpYLzF3R0taNmRhak1IWVdvZDZWN3FZVXBmK2IwZS9iR0QyTlA4?=
 =?utf-8?B?dlMzckY3ODFkbXppUDEyZk4zNVNkNkJCV2dZTlQ5bDQzY05BV2FYZHNRSEtX?=
 =?utf-8?B?Umo2N1ZOcGtCNDhwZ0lMRDN3V3l2L2lTS056cUVBQXpMN1hXSG9XZ1hxU1E4?=
 =?utf-8?B?QkcvNmpqdkFyLzJVbzhZWHZJRzU4TWQwMWZHbnNmWUg5Y3ZKaklPeG93WGNm?=
 =?utf-8?B?a0tERHhscGk3eEhTOHlVQWpXbzBaT1NqQzhVbnJnaEdPVHpTY3A2eW9IT2Nt?=
 =?utf-8?B?OGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a6f7a6c3-59c8-4d56-0fbd-08dac27a50df
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2022 17:46:22.6034 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FyvtVWWaGhE4ap+6NJ/AOx8BajilkCQaXMq/Iaq6b1bv/QcxU5sYaIzgm0BXBr/lGbzi8P+f/UiS2rVowwMXtKIDHQe/1FYYJStllDDfHFw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5510
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
Cc: "Ewins, Jon" <jon.ewins@intel.com>, DRI-Devel@Lists.FreeDesktop.Org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/9/2022 03:05, Tvrtko Ursulin wrote:
> On 08/11/2022 20:15, John Harrison wrote:
>> On 11/8/2022 01:01, Tvrtko Ursulin wrote:
>>> On 07/11/2022 19:14, John Harrison wrote:
>>>> On 11/7/2022 08:17, Tvrtko Ursulin wrote:
>>>>> On 07/11/2022 09:33, Tvrtko Ursulin wrote:
>>>>>> On 05/11/2022 01:03, Ceraolo Spurio, Daniele wrote:
>>>>>>> On 11/4/2022 10:25 AM, John.C.Harrison@Intel.com wrote:
>>>>>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>>>>>
>>>>>>>> When trying to analyse bug reports from CI, customers, etc. it 
>>>>>>>> can be
>>>>>>>> difficult to work out exactly what is happening on which GT in a
>>>>>>>> multi-GT system. So add GT oriented debug/error message 
>>>>>>>> wrappers. If
>>>>>>>> used instead of the drm_ equivalents, you get the same output 
>>>>>>>> but with
>>>>>>>> a GT# prefix on it.
>>>>>>>>
>>>>>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>>>>>
>>>>>>> The only downside to this is that we'll print "GT0: " even on 
>>>>>>> single-GT devices. We could introduce a gt->info.name and print 
>>>>>>> that, so we could have it different per-platform, but IMO it's 
>>>>>>> not worth the effort.
>>>>>>>
>>>>>>> Reviewed-by: Daniele Ceraolo Spurio 
>>>>>>> <daniele.ceraolospurio@intel.com>
>>>>>>>
>>>>>>> I think it might be worth getting an ack from one of the 
>>>>>>> maintainers to make sure we're all aligned on transitioning to 
>>>>>>> these new logging macro for gt code.
>>>>>>
>>>>>> Idea is I think a very good one. First I would suggest 
>>>>>> standardising to lowercase GT in logs because:
>>>>>>
>>>>>> $ grep "GT%" i915/ -r
>>>>>> $ grep "gt%" i915/ -r
>>>>>> i915/gt/intel_gt_sysfs.c: gt->i915->sysfs_gt, "gt%d", gt->info.id))
>>>>>> i915/gt/intel_gt_sysfs.c:                "failed to initialize 
>>>>>> gt%d sysfs root\n", gt->info.id);
>>>>>> i915/gt/intel_gt_sysfs_pm.c:                     "failed to 
>>>>>> create gt%u RC6 sysfs files (%pe)\n",
>>>>>> i915/gt/intel_gt_sysfs_pm.c: "failed to create gt%u RC6p sysfs 
>>>>>> files (%pe)\n",
>>>>>> i915/gt/intel_gt_sysfs_pm.c:                     "failed to 
>>>>>> create gt%u RPS sysfs files (%pe)",
>>>>>> i915/gt/intel_gt_sysfs_pm.c:                     "failed to 
>>>>>> create gt%u punit_req_freq_mhz sysfs (%pe)",
>>>>>> i915/gt/intel_gt_sysfs_pm.c: "failed to create gt%u throttle 
>>>>>> sysfs files (%pe)",
>>>>>> i915/gt/intel_gt_sysfs_pm.c: "failed to create gt%u 
>>>>>> media_perf_power_attrs sysfs (%pe)\n",
>>>>>> i915/gt/intel_gt_sysfs_pm.c:                     "failed to add 
>>>>>> gt%u rps defaults (%pe)\n",
>>>>>> i915/i915_driver.c: drm_err(&gt->i915->drm, "gt%d: 
>>>>>> intel_pcode_init failed %d\n", id, ret);
>>>>>> i915/i915_hwmon.c: snprintf(ddat_gt->name, sizeof(ddat_gt->name), 
>>>>>> "i915_gt%u", i);
>>>>>>
>>>>
>>>> Just because there are 11 existing instances of one form doesn't 
>>>> mean that the 275 instances that are waiting to be converted should 
>>>> be done incorrectly. GT is an acronym and should be capitalised.
>>>
>>> Okay just make it consistent then.
>>>
>>>> Besides:
>>>> grep -r "GT " i915 | grep '"'
>>>> i915/vlv_suspend.c:             drm_err(&i915->drm, "timeout 
>>>> disabling GT waking\n");
>>>> i915/vlv_suspend.c:                     "timeout waiting for GT 
>>>> wells to go %s\n",
>>>> i915/vlv_suspend.c:     drm_dbg(&i915->drm, "GT register access 
>>>> while GT waking disabled\n");
>>>> i915/i915_gpu_error.c:  err_printf(m, "GT awake: %s\n", 
>>>> str_yes_no(gt->awake));
>>>> i915/i915_debugfs.c:    seq_printf(m, "GT awake? %s [%d], %llums\n",
>>>> i915/selftests/i915_gem_evict.c: pr_err("Failed to idle GT (on 
>>>> %s)", engine->name);
>>>> i915/intel_uncore.c:                  "GT thread status wait timed 
>>>> out\n");
>>>> i915/gt/uc/selftest_guc_multi_lrc.c: drm_err(&gt->i915->drm, "GT 
>>>> failed to idle: %d\n", ret);
>>>> i915/gt/uc/selftest_guc.c: drm_err(&gt->i915->drm, "GT failed to 
>>>> idle: %d\n", ret);
>>>> i915/gt/uc/selftest_guc.c: drm_err(&gt->i915->drm, "GT failed to 
>>>> idle: %d\n", ret);
>>>> i915/gt/intel_gt_mcr.c: * Some GT registers are designed as 
>>>> "multicast" or "replicated" registers:
>>>> i915/gt/selftest_rps.c:                 pr_info("%s: rps counted %d 
>>>> C0 cycles [%lldns] in %lldns [%d cycles], using GT clock frequency 
>>>> of %uKHz\n",
>>>> i915/gt/selftest_hangcheck.c:                   pr_err("[%s] GT is 
>>>> wedged!\n", engine->name);
>>>> i915/gt/selftest_hangcheck.c:           pr_err("GT is wedged!\n");
>>>> i915/gt/intel_gt_clock_utils.c:                 "GT clock frequency 
>>>> changed, was %uHz, now %uHz!\n",
>>>> i915/gt/selftest_engine_pm.c:           pr_err("Unable to flush GT 
>>>> pm before test\n");
>>>> i915/gt/selftest_engine_pm.c: pr_err("GT failed to idle\n");
>>>> i915/i915_sysfs.c:                       "failed to register GT 
>>>> sysfs directory\n");
>>>> i915/intel_uncore.h:     * of the basic non-engine GT registers 
>>>> (referred to as "GSI" on
>>>> i915/intel_uncore.h:     * newer platforms, or "GT block" on older 
>>>> platforms)?  If so, we'll
>>>>
>>>>
>>>>
>>>>>> Then there is a question of naming. Are we okay with GT_XXX or, 
>>>>>> do we want intel_gt_, or something completely different. I don't 
>>>>>> have a strong opinion at the moment so I'll add some more folks 
>>>>>> to Cc.
>>>>>
>>>> You mean GT_ERR("msg") vs intel_gt_err("msg")? Personally, I would 
>>>> prefer just gt_err("msg") to keep it as close to the official drm_* 
>>>> versions as possible. Print lines tend to be excessively long 
>>>> already. Taking a 'gt' parameter instead of a '&gt->i915->drm' 
>>>> parameter does help with that but it seems like calling the wrapper 
>>>> intel_gt_* is shooting ourselves in the foot on that one. And 
>>>> GT_ERR vs gt_err just comes down to the fact that it is a macro 
>>>> wrapper and therefore is required to be in upper case.
>>>>
>>>>> There was a maintainer level mini-discussion on this topic which I 
>>>>> will try to summarise.
>>>>>
>>>>> Main contention point was the maintenance cost and generally an 
>>>>> undesirable pattern of needing to add many 
>>>>> subsystem/component/directory specific macros. Which then 
>>>>> typically need extra flavours and so on. But over verbosity of the 
>>>> How many versions are you expecting to add? Beyond the tile 
>>>> instance, what further addressing requirements are there? The card 
>>>> instance is already printed as part of the PCI address. The only 
>>>> other reason to add per component wrappers would be to wrap the 
>>>> mechanism for getting from some random per component object back to 
>>>> the intel_gt structure. But that is hardware a new issue being 
>>>> added by this wrapper. It is also not a requirement. Much of the 
>>>> code has a gt pointer already. For the parts that don't, some of it 
>>>> would be a trivial engine->gt type dereference, some of it is a 
>>>> more complex container_of type construction. But for those, the 
>>>> given file will already have multiple instances of that already 
>>>> (usually as the first or second line of the function - 'intel_gt 
>>>> *gt = fancy_access_method(my_obj)' so adding one or two more of 
>>>> those as necessary is not making the code harder to read.
>>>>
>>>>> code is obviously also bad, so one compromise idea was to add a 
>>>>> macro which builds the GT string and use drm logging helpers 
>>>>> directly. This would be something like:
>>>>>
>>>>>  drm_err(GT_LOG("something went wrong ret=%d\n", gt), ret);
>>>>>  drm_info(GT_LOG(...same...));
>>>> Seriously? As above, some of these lines are already way too long, 
>>>> this version makes them even longer with no obvious benefit. Worse, 
>>>> it makes it harder to read what is going on. It is much less 
>>>> intuitive to read than just replacing the drm_err itself. And 
>>>> having two sets of parenthesis with some parameters inside the 
>>>> first and some only inside the second is really horrid! Also, 
>>>> putting the 'gt' parameter in the middle just confuses it with the 
>>>> rest of the printf arguments even though there is no %d in the 
>>>> string for it. So now a quick glances tells you that your code is 
>>>> wrong because you have three format specifiers but four parameters.
>>>>
>>>> Whereas, just replacing drm_err with gt_err (or GT_ERR or 
>>>> intel_gt_err) keeps everything else consistent. The first parameter 
>>>> changes from 'drm' to 'gt' but is still the master object parameter 
>>>> and it matches the function/macro prefix so inherently looks 
>>>> correct. Then you have your message plus parameters. No confusing 
>>>> orders, no confusing parenthesis, no excessive macro levels, no 
>>>> confusion at all. Just nice simple, easy to read, easy to maintain 
>>>> code.
>>>
>>> I am personally okay with gt_err/GT_ERR some other folks might 
>>> object though. And I can also understand the argument why it is 
>>> better to not have to define gt_err, gt_warn, gt_info, gt_notice, 
>>> gt_debug, gt_err_ratelimited, gt_warn_once.. and instead have only 
>>> one macro.
>> A small set of trivial macro definitions vs a complicated and 
>> unreadable construct on every single print? Erm, isn't that the very 
>> definition of abstracting to helpers as generally required by every 
>> code review ever?
>>
>> And what 'other folks might object'? People already CC'd? People 
>> outside of i915?
>>
>>
>>>
>>> Because of that I was passing on to you the compromise option.
>>>
>>> It maybe still has net space savings since we wouldn't have to be 
>>> repeating the gt->i915->drm whatever and gt->info.id on every line.
>>>
>>> You are free to try the most compact one and see how hard those 
>>> objections will be.
>> Um. I already did. This patch. And you are the only person to have 
>> objected in any manner at all.
>
> Where I have objected?
Only in everything you have written. Or are you saying that actually I 
could have just taken the r-b from Daniele and merged it while 
completely ignoring everything you have said because you didn't say 
'NACK' at the top of your email?

>
> I was a) asking to convert all gt/ within one kernel release, b) 
> transferring the maintainer discussion from IRC to this email chain to 
> outlay one alternative, for which I said I could see the pros and cons 
> of both, and c) raised the naming question early since that can 
> usually become a churn point later on when we have large scale code 
> transformations.
>
> As said, FWIW you have my ack for GT_XXX naming and approach, but 
> please do convert the whole of gt/ so we don't ship with a mish-mash 
> of log messages.
>
That sounds like a quite a lot of objections to me - don't do it that 
way, do it this way; fine do it that way but expect lots of complaints 
when you do; oh all right, do it that way but re-write the entire driver 
all at once.

I really don't get the 'we must not ship with a mish-mash of log 
messages' argument. It's hardly like the current total mish-mash of 
DRM_DEBUG, DRM_DEBUG_DRIVER, pr_dbg, drm_dbg, ... is even remotely 
consistent. It's also not like the patch is massively changing the 
format of the output messages. So some prints get a useful extra three 
characters in advance of others. Does anyone care? Would anyone except 
us even notice?

Is it really a problem to merge this patch now to get the process 
started? And other sub-components get updated as and when people get the 
time to do them? You could maybe even help rather than posting 
completely conflicting patch sets that basically duplicate all the 
effort for no actual benefit.

John.


> Regards,
>
> Tvrtko

