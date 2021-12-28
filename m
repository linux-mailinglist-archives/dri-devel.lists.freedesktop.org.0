Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BBF48088C
	for <lists+dri-devel@lfdr.de>; Tue, 28 Dec 2021 11:48:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3009310E181;
	Tue, 28 Dec 2021 10:48:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AC5710E12A
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Dec 2021 10:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640688523; x=1672224523;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=47p0fjGowsHcq+UUWlfbsL4Ur7bBtTapnbwLYFY3KZk=;
 b=dE7wlmc54mDA5ku7c0j/T0fW49jimiaDTsdZ7i1Fn7L85SX6W9c7V3pB
 L7g5o5pJCRvMIQXDDlxstCpy+VIxR3TzFmlak+5FGqa5ReanNIJ++vmdO
 /eEe+hJibveJvN57XPsgl16piM9d7FM0zonvodAeGtQXnlWyFbuEnTWpS
 RBbDVv50LE2mW6IVfdD1evr3y4mhsKOhYRWIdhThDUNTsLgsF5EP90WwU
 Q8ebIdJ+bSrF2Xd6OrZ2fNya4LrYejLb0+gQ3xMfJd/8Uz51URwNstJC+
 JA49i/WVjmfLgy1Z2Jcaj01uSKsdFjVqkq2UYQUUcVpqVLDJKK44CwQP5 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10210"; a="222023025"
X-IronPort-AV: E=Sophos;i="5.88,242,1635231600"; d="scan'208";a="222023025"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Dec 2021 02:48:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,242,1635231600"; d="scan'208";a="588993859"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP; 28 Dec 2021 02:48:42 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 28 Dec 2021 02:48:42 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 28 Dec 2021 02:48:42 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 28 Dec 2021 02:48:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KCniAR6pjBwmObp1gzXW46lhg94PxCxQPgl8CO5QavxVVmSlpsyhy6dNHwuyhxbrEaSiMZWVmI0QbQC7mQExOXsAVh9I5A/dCV6ncH9IjAaSgr72WfNss/g6N01lj04o8TVs49GZwETaDv27MnZPmDL3TPWuPPCmGdQhXPyhHQivkOAeJWq/TguZRQrtue81uS0iKxTXpfty+Y5bF5FBC/dNWl7hSk2pI7MrfAtjDQNU3t7EI02IiN+pRBPO0Txhwd9Q4tdr5rVluZFThzy5a2H5kbYK9VSJWBzjgqAPxKWWhz9z4NeLEvce+vb3jqg7U51wZMNnunPzScIYD099kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=10bNrrtmPaGamujNpKuXCoLqgBOxswQEXsNBIcIlRQk=;
 b=NvGKCHwOBtO5XQxBpvbP6GDOcW9lVxCmmcP4KrJpJ5e/hVX74AdsVGOztiIUzAWTqot/nnA2OLJGh9SRN8zs1AuwpyXH0Gg/gf4/IvSTHsK3NxN5XjUjhzipSqWLj5p6ds/5+8OCavkGSj/UGv4Fs5HWmwIafOYyyTHt6C+PwyssTf8NMEwEJ4fN1Y3hiZBeGkugpNEPA2quSrep7smOcQXjBznAR6k2T47gJ9oDZEcyYRT1fmuTINLBgcqoYnpxTgKHEL47vBKOqFuS2EMo/wK+bbTS5iWybCz6Cc/jXHCmlz5hZ7aFJ+QAfnxiqB6wIMlcOJDZXOY25D8Og5jkKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3180.namprd11.prod.outlook.com (2603:10b6:5:9::13) by
 DM6PR11MB4396.namprd11.prod.outlook.com (2603:10b6:5:203::33) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4823.19; Tue, 28 Dec 2021 10:48:40 +0000
Received: from DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::b47a:6157:f9b5:b01d]) by DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::b47a:6157:f9b5:b01d%3]) with mapi id 15.20.4823.023; Tue, 28 Dec 2021
 10:48:40 +0000
Message-ID: <e541c52b-9751-933b-5eac-783dd0ed9056@intel.com>
Date: Tue, 28 Dec 2021 11:48:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.1
Subject: Re: [PATCH v4 0/6] drm: exynos: dsi: Convert drm bridge
Content-Language: en-US
To: Marek Szyprowski <m.szyprowski@samsung.com>, Jagan Teki
 <jagan@amarulasolutions.com>
References: <CGME20211215101548eucas1p2a7f4a64ae55364181eec3db3ad5d6ef7@eucas1p2.samsung.com>
 <20211215101534.45003-1-jagan@amarulasolutions.com>
 <39f646d7-9d49-045a-2cf5-3cdc12486cb3@samsung.com>
 <CAMty3ZBmZo3wqzj2Si4Ydm1RtzGs7f89aCktgVvD==appfSCPQ@mail.gmail.com>
 <fe49e59a-1df7-fcdc-8258-581509bb8fe2@samsung.com>
 <CAMty3ZCSrqcnO1i5ADJhQx_Dt5GbT+-eyhauJhqg=wJXOTWK-A@mail.gmail.com>
 <fc773566-760d-19ec-0879-3ee88c06b425@samsung.com>
 <012176de-a246-4dfe-1779-e15f498f1d72@samsung.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <012176de-a246-4dfe-1779-e15f498f1d72@samsung.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0379.eurprd06.prod.outlook.com
 (2603:10a6:20b:460::12) To DM6PR11MB3180.namprd11.prod.outlook.com
 (2603:10b6:5:9::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4194fd1f-5e1c-4445-2251-08d9c9ef9bf8
X-MS-TrafficTypeDiagnostic: DM6PR11MB4396:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM6PR11MB4396473BA938E93BCA0C792EEB439@DM6PR11MB4396.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J1nxOpqySlt37aj7YqrOUjS2hYWapvorREcA4rdOeGZAxvgAi0Qls3eZHxPj46XC2y+qKoNYuTT9lrfelfLdyYJg+jX1o1feEN2R087oLrjb0Cq491jA1rMRE6SZqylaYrMQ4E1B+yVZ/2PKofvwYlJmsusJUSWHC32T2m/JYWqbuZSWNjUxbrKSK2tOlHhRAExdT7LTz5WbOtDqp2q5qulKDv979tu8utXLLNIEDRC1uSv7x62yalHsTrsdRpgO8hEGP3sdUWn8Nk7WsKsZ5ckNEu63Izwnfsdv++kJbxwAHrXnjgrvVkR8o1YW0sroRYLDKrAgiaG3Asm2BKlILq7pQUSma/y2saNT6gbH+s8acfCO7DPU9lWUOpoEZ1j3weOkGzFPlBMnNfakLy/52crK+XjaKVtrIrBp98qmFkquObvOSHXsUjtbVvu2QPCBElDwJ35ClKHZa+7e7dMYYA0AEE/9URjVid0KeQHsGwM/xQVRVxX5wIjMptet8tDcx4uDhm6m9rEf5FpjbVScS5BAWkAdL3JUDcI0btGubAmFaHp6xWC0MPB+UMABZYL1iFwX5Uo5sSAx+mtmW/CobZVr3pP4bSrd3d9d1b6Gq/z3Pz5mw/vw2jUoFMLvaUcCrEYMmnwZf7aohW7/3o9BMDe7VllIaahjS0oepU5RpglIdmf6v2Dp/MvtlVZOBsArrgWDImS8GSwmVVEzlFm4ma9sswRV7/SM6gPeZIJzOEpyogCmhljiWsmYeHERe5ktitV41UVi69vtEjRNmMDY7WDk7WtUBN4/1AQMTXZj0RSCHdIAGIfD8E7OwuGJQfgj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(966005)(31686004)(2906002)(186003)(86362001)(4326008)(66556008)(83380400001)(36916002)(30864003)(110136005)(8676002)(26005)(44832011)(53546011)(6512007)(6486002)(6666004)(2616005)(6506007)(36756003)(82960400001)(66946007)(31696002)(66476007)(54906003)(38100700002)(8936002)(5660300002)(7416002)(316002)(508600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUdSTHFoODZKVGRvcnQxUzA3dzVJWkpWRmRJVUlGUnpkeGlNZUlKSlZQaENU?=
 =?utf-8?B?T1FyK3ZHNXlMRWZrOW5oR0RvRE1XQVcyY25iNDEzaWlrZWIvU1YrS3Fzakhh?=
 =?utf-8?B?RUlSeHJISlJrbzNCb0QvbzJCcDdWajdQTkIvYVVuVXdibDZFSThHNUZEL2My?=
 =?utf-8?B?M0hQV3lSd1NkTWlGanhKNEhxT3lPV1VOVUh3d1NXYTd2S2w2RXFCakJmWkhi?=
 =?utf-8?B?VEJoNkVuSXpiVUwvZ2pkME45Rno0MUt2eE9pV3dNd2ZOVnlnM0tsYkNuMzFz?=
 =?utf-8?B?SDRFRVpYZDgwc000Vm9yUi9kRi9YUUpqZFpFWm9LQi8wdG9zMnBaelA2cUM3?=
 =?utf-8?B?VlVuVDNiYzRJeE03TlRCOUptZDJmYkVJNDlCK1REWmRrY0JhdzZvZDd6VWo3?=
 =?utf-8?B?UFhWaTM5RGRRcTlEN0dnNWJTRjVHR2ROUG1zNVltY0dxR3pWVWwrTjFnVE5a?=
 =?utf-8?B?VDBEd044Wkx3bmQzMmMwblpHT1V0NlVyUTlKQ29LcWFvV1NWeE5rY1IrYXRk?=
 =?utf-8?B?eEhMaGorcDE4OWhsMWpiZkhKWFdBWVVRUldPTEE0VjlwbFlSazJTS0QvcFFx?=
 =?utf-8?B?bUV6THBqYnU2L3lCTHNhWFdXZGF5ZlF2V0pnZENZYVQ1SkxlTVMyMXJ0TmVW?=
 =?utf-8?B?ZDZlazdVdWdNRWF6R1F4NXVmVWppRTJyRHJJR0VxeUo2bHAyMDlHcjUvckxm?=
 =?utf-8?B?bVd4anFSLzhWTnh0SXBCanZNajhyT0lEaGlPa3U3SVRJcE5QeW82Yno0QU0z?=
 =?utf-8?B?Y25nMlNheWxvbHl1RWVjdEtqbkZqMUN5aE40bkpVSEx0cXN6RUZVc3IvVW1s?=
 =?utf-8?B?RlRDVUxjeDU2VElvNXdJM0NTcjdjVEM3SXphZUVSK3h5K08xV3hpSXpjZTF6?=
 =?utf-8?B?UGdWUlo3STJ3dzdWVVhUQ2FidUp3Y2k5V2xnNHFadzM1K0QvU0Z1cGF3UVUy?=
 =?utf-8?B?Ull0MXFnVVpJcE15U09NWThBN3RWcjArVlN2TVZYdy9CZmlPWDVsbjBqaE14?=
 =?utf-8?B?ZUVNU1JJdmxpUEtaMjZSTnduejFnbEdDektiek8rNUkyazI4YjZuYWZXeDIx?=
 =?utf-8?B?anNZQzFQMWJQbkV6ZjN0b28zZEVSZG9VN1orRDFKcW0xejMyNFNhL2ZzMjJj?=
 =?utf-8?B?bS9ib21aRXI5NmN2UXorWll6K1BvVlpQSWtvMk0yalJTQWVUOWlGY05IdTM1?=
 =?utf-8?B?MTlMS0lpQ3JLdDIrckNaREdobmRaT2swZTBXZDl0c1oxMldpbXpVcm9HREFT?=
 =?utf-8?B?dkdrT2xvQ2tmeDRianE2NkREOFNpcVMrNVdDUDdORGt1SVNGdHM1eDkxeW9U?=
 =?utf-8?B?TlpFd3IzUkQzR1RUeEJzNUszN0FTaERQejFnWndCTGhpbXlST2k0V2dqa01y?=
 =?utf-8?B?N3MrSGdOT05YNmtKeGVxV0JRaTBNTi9kMEN6NkNBTEQwT25CTXhQRWw1clAv?=
 =?utf-8?B?QXA0RHZmeS9JaTBVY1YrdFk1UWRSa2xjU1ZoVDNYaWVKbG5rUzhTVnpuUFdu?=
 =?utf-8?B?Nk05THVxYllKQW9FR3dHeE94aUtFK3kxQ3FmV3ozcEc2YVNGY09HVDdIN1V6?=
 =?utf-8?B?QUdXazhRVk5UMzFNa2MvZkxiMHFrVStKdlRXYUx0RzlZZWFyVGp2UDF5OGFT?=
 =?utf-8?B?N1Z6T2RnWENIcEk3eXNrN0ljb1FlT1NzOU5SL1ZUY1p3aXV1Y09mb3g2SlM1?=
 =?utf-8?B?QmEybzA1MWpweTlDZVAyNHpxeUprdU1qcDVYZFZDQjVnWEEya3JSNHhHeTFX?=
 =?utf-8?B?ZU5pWXhVRlBubGVqbGVCc0NPaEZIMWFWRmF3MHIxbElkMW1xS1FUWXVnSy95?=
 =?utf-8?B?eTVzYm53RXZxNHZzd2tIenNwNDFRd0VBdHpRWnE0T0FzcjZpRjF3clQzQVkz?=
 =?utf-8?B?TFFMcDBNL0Qza09RZ2E1dXF3VFRCOWs3Q2tkQXV4bm1RNnFjZHd6b1lnaFgy?=
 =?utf-8?B?T1g0N3hpSjJ4WXlCSmxqc3IrTlZQeVZJb2xjSzFHN3RTODQzVDBOZTZhVU9Y?=
 =?utf-8?B?djNSL3EyS2xJMU5lcjRYYnJGdjVBbUh5Y0dSUEZQa0dDQzR4bW5iVm02V0hy?=
 =?utf-8?B?SlN2MnBvcFFlK3ZzV2Z0TytIcXlDRm8yN3R0N29zYUp4TmFQY0hOb1pUSE1C?=
 =?utf-8?B?K24xc0xVNXNuWGZJL25lY2FKVC9wbUpPUElVTmEydTNyNFR2YldxZld2a0x5?=
 =?utf-8?Q?lRdccmuhWGeqbThsHOXwX3M=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4194fd1f-5e1c-4445-2251-08d9c9ef9bf8
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2021 10:48:40.2295 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GHcFTL8MuFDsj625WegTidX5n4FgvtU9jaBpXCz6IWzid6tcIrwsuliO8QBDEjHp/m95w4AGGnr/jgdUVhNM2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4396
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-amarula@amarulasolutions.com,
 dri-devel@lists.freedesktop.org, Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

On 23.12.2021 10:15, Marek Szyprowski wrote:
> Hi Jagan,
>
> On 18.12.2021 00:16, Marek Szyprowski wrote:
>> On 15.12.2021 15:56, Jagan Teki wrote:
>>> On Wed, Dec 15, 2021 at 7:49 PM Marek Szyprowski
>>> <m.szyprowski@samsung.com> wrote:
>>>> On 15.12.2021 13:57, Jagan Teki wrote:
>>>>> On Wed, Dec 15, 2021 at 5:31 PM Marek Szyprowski
>>>>> <m.szyprowski@samsung.com> wrote:
>>>>>> On 15.12.2021 11:15, Jagan Teki wrote:
>>>>>>> Updated series about drm bridge conversion of exynos dsi.
>>>>>>> Previous version can be accessible, here [1].
>>>>>>>
>>>>>>> Patch 1: connector reset
>>>>>>>
>>>>>>> Patch 2: panel_bridge API
>>>>>>>
>>>>>>> Patch 3: Bridge conversion
>>>>>>>
>>>>>>> Patch 4: Atomic functions
>>>>>>>
>>>>>>> Patch 5: atomic_set
>>>>>>>
>>>>>>> Patch 6: DSI init in enable
>>>>>> There is a little progress! :)
>>>>>>
>>>>>> Devices with a simple display pipeline (only a DSI panel, like
>>>>>> Trats/Trats2) works till the last patch. Then, after applying
>>>>>> ("[PATCH
>>>>>> v4 6/6] drm: exynos: dsi: Move DSI init in bridge enable"), I get no
>>>>>> display at all.
>>>>>>
>>>>>> A TM2e board with in-bridge (Exynos MIC) stops displaying anything
>>>>>> after
>>>>>> applying patch "[PATCH v4 2/6] drm: exynos: dsi: Use drm
>>>>>> panel_bridge API".
>>>>>>
>>>>>> In case of the Arndale board with tc358764 bridge, no much
>>>>>> progress. The
>>>>>> display is broken just after applying the "[PATCH v2] drm: bridge:
>>>>>> tc358764: Use drm panel_bridge API" patch on top of linux-next.
>>>>>>
>>>>>> In all cases the I had "drm: of: Lookup if child node has panel or
>>>>>> bridge" patch applied.
>>>>> Just skip the 6/6 for now.
>>>>>
>>>>> Apply
>>>>> -
>>>>> https://protect2.fireeye.com/v1/url?k=a24f3f76-fdd40659-a24eb439-0cc47a31cdf8-97ea12b4c5258d11&q=1&e=37a169bf-7ca5-4362-aad7-486018c7a708&u=https%3A%2F%2Fpatchwork.amarulasolutions.com%2Fpatch%2F1825%2F
>>>>> -
>>>>> https://protect2.fireeye.com/v1/url?k=a226360f-fdbd0f20-a227bd40-0cc47a31cdf8-ebd66aebee1058d7&q=1&e=37a169bf-7ca5-4362-aad7-486018c7a708&u=https%3A%2F%2Fpatchwork.amarulasolutions.com%2Fpatch%2F1823%2F
>>>>>
>>>>> Then apply 1/6 to 5/6.  and update the status?
>>>> Okay, my fault, I didn't check that case on Arndale.
>>>>
>>>> I've checked and indeed, Trats/Trats2 and Arndale works after the above
>>>> 2 patches AND patches 1-5.
>>>>
>>>> The only problem is now on TM2e, which uses Exynos MIC as in-bridge for
>>>> Exynos DSI:
>>>>
>>>> [    4.068866] [drm] Exynos DRM: using 13800000.decon device for DMA
>>>> mapping operations
>>>> [    4.069183] exynos-drm exynos-drm: bound 13800000.decon (ops
>>>> decon_component_ops)
>>>> [    4.128983] exynos-drm exynos-drm: bound 13880000.decon (ops
>>>> decon_component_ops)
>>>> [    4.129261] exynos-drm exynos-drm: bound 13930000.mic (ops
>>>> exynos_mic_component_ops)
>>>> [    4.133508] exynos-dsi 13900000.dsi: [drm:exynos_dsi_host_attach]
>>>> *ERROR* failed to find the bridge: -19
>>>> [    4.136392] exynos-drm exynos-drm: bound 13900000.dsi (ops
>>>> exynos_dsi_component_ops)
>>>> [    4.145499] rc_core: Couldn't load IR keymap rc-cec
>>>> [    4.145666] Registered IR keymap rc-empty
>>>> [    4.148402] rc rc0: sii8620 as /devices/virtual/rc/rc0
>>>> [    4.156051] input: sii8620 as /devices/virtual/rc/rc0/input1
>>>> [    4.160647] exynos-drm exynos-drm: bound 13970000.hdmi (ops
>>>> hdmi_component_ops)
>>>> [    4.169923] exynos-drm exynos-drm: [drm] Cannot find any crtc or
>>>> sizes
>>>> [    4.173958] exynos-drm exynos-drm: [drm] Cannot find any crtc or
>>>> sizes
>>>> [    4.182304] [drm] Initialized exynos 1.1.0 20180330 for
>>>> exynos-drm on
>>>> minor 0
>>>>
>>>> The display pipeline for TM2e is:
>>>>
>>>> Exynos5433 Decon -> Exynos MIC -> Exynos DSI -> s6e3ha2 DSI panel
>>> If Trats/Trats2 is working then it has to work. I don't see any
>>> difference in output pipeline. Can you please share the full log, I
>>> cannot see host_attach print saying "Attached.."
>> Well, there is a failure message about the panel:
>>
>> exynos-dsi 13900000.dsi: [drm:exynos_dsi_host_attach] *ERROR* failed
>> to find the bridge: -19
>>
>> however it looks that something might be broken in dts. The in-bridge
>> (Exynos MIC) is on port 0 and the panel is @0, what imho might cause
>> the issue.
>>
>> I've tried to change in in-bridge ('mic_to_dsi') port to 1 in
>> exynos5433.dtsi. Then the panel has been attached:
>>
>> exynos-dsi 13900000.dsi: [drm:exynos_dsi_host_attach] Attached s6e3hf2
>> device
>>
>> but the display is still not working, probably due to lack of proper
>> Exynos MIC handling. I will investigate it later and let You know.
>
> I've played a bit with the Exynos DRM code and finally I made it working
> on TM2(e). There are basically 3 different issues that need to be fixed
> to get it working with the $subject patchset:
>
> 1. Port numbers in exynos5433 dsi/dts are broken. For all pre-Exynos5433
> boards the panel was defined as a DSI node child (at 'reg 0'),


True, emphasis that it is reg 0 of DSI bus.


>   what
> means it used port 0.


And this does not seems true to me. Established practice is (unless I 
have not noticed change in bindings :) ) that in case of data bus shared 
with control bus the port node is optional. In such case host knows 
already who is connected to its data bus, it does not need port node. 
And if there is no port node there is no port number as well.

As I quickly looked at the exynos bindings they seems generally OK to 
me, if there is something wrong/suspicious let me know.


>   Then, Exynos5433 introduced so called RGB-in at
> port 0 and panel at port 1 (as described in the dt bindings).However
> the committed Exynos5433 dtsi and TM2(e) dts still defined panel as a
> DSI child (with reg=0, so port 0) and Exynos MIC as of-graph at port 0.
> The Exynos DSI code however always searched for a panel as a DSI child
> node, so it worked fine, even though the panel and exynos mic used in
> fact the 'port 0'. IMHO this can be fixed by the following patch:
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> index bfe4ed8a23d6..2718c752d916 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> @@ -1046,8 +1046,8 @@
>                                   #address-cells = <1>;
>                                   #size-cells = <0>;
>
> -                               port@0 {
> -                                       reg = <0>;
> +                               port@1 {
> +                                       reg = <1>;
>                                           dsi_to_mic: endpoint {
>                                                   remote-endpoint =
> <&mic_to_dsi>;
>                                           };
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index d2933a70c01f..e8e2df339c5f 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -220,8 +220,8 @@ enum exynos_dsi_transfer_type {
>    };
>
>    enum {
> -       DSI_PORT_IN,
> -       DSI_PORT_OUT
> +       DSI_PORT_OUT,
> +       DSI_PORT_IN
>    };
>
>    struct exynos_dsi_transfer {
> --
>
> 2. (devm_)drm_of_get_bridge() ignores panel's 'reg' property and it is


I guess drm_of_get_bridge should not be used in exynos_dsi_host_attach 
at all - there are no ports here, only of_node of the sink.

Since there is no helper to workaround the dualism panel/bridge you 
should still use of_drm_find_bridge and of_drm_find_panel pair.


> unable to find a panel if there is a 'ports' child node (even if it
> describes completely different port than the one requested by the
> caller). I don't have time now to fix this, a simple and ugly workaround
> for that is to define the complete of-graph for the DSI child panel:
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts
> b/arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts
> index 22d26460f3dd..4726c325bd2c 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts
> +++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts
> @@ -58,6 +58,27 @@
>                   vci-supply = <&ldo28_reg>;
>                   reset-gpios = <&gpg0 0 GPIO_ACTIVE_LOW>;
>                   enable-gpios = <&gpf1 5 GPIO_ACTIVE_HIGH>;
> +
> +               ports {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +
> +                       port@0 {
> +                               reg = <0>;
> +                               panel_to_dsi: endpoint {
> +                                       remote-endpoint = <&dsi_to_panel>;
> +                               };
> +                       };
> +               };
> +       };
> +
> +       ports {
> +               port@0 {
> +                       reg = <0>;
> +                       dsi_to_panel: endpoint {
> +                               remote-endpoint = <&panel_to_dsi>;
> +                       };
> +               };
>           };
>    };
>
> --
>
> 3. Lack of proper handling of the 'in-bridge' in the Exynos DSI after
> Your conversion. Initially I thought that this could be fixed with the
> following simple patch:
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index e8e2df339c5f..2fe9c995549f 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -259,6 +259,7 @@ struct exynos_dsi {
>           struct mipi_dsi_host dsi_host;
>           struct drm_bridge bridge;
>           struct drm_bridge *out_bridge;
> +       struct drm_bridge *in_bridge;
>           struct device *dev;
>
>           void __iomem *reg_base;
> @@ -1535,7 +1536,7 @@ static int exynos_dsi_host_attach(struct
> mipi_dsi_host *host,
>
>           drm_bridge_add(&dsi->bridge);
>
> -       drm_bridge_attach(encoder, &dsi->bridge, NULL, 0);
> +       drm_bridge_attach(encoder, &dsi->bridge, dsi->in_bridge, 0);
>
>           /*
>            * This is a temporary solution and should be made by more
> generic way.
> @@ -1674,7 +1675,6 @@ static int exynos_dsi_bind(struct device *dev,
> struct device *master,
>           struct drm_encoder *encoder = &dsi->encoder;
>           struct drm_device *drm_dev = data;
>           struct device_node *in_bridge_node;
> -       struct drm_bridge *in_bridge;
>           int ret;
>
>           printk("drm: %s enter\n", __func__);
> @@ -1688,9 +1688,10 @@ static int exynos_dsi_bind(struct device *dev,
> struct device *master,
>           }
>           in_bridge_node = of_graph_get_remote_node(dev->of_node,
> DSI_PORT_IN, 0);
>           if (in_bridge_node) {
> -               in_bridge = of_drm_find_bridge(in_bridge_node);
> -               if (in_bridge)
> -                       drm_bridge_attach(encoder, in_bridge, NULL, 0);
> +               dsi->in_bridge = of_drm_find_bridge(in_bridge_node);
> +               if (dsi->in_bridge) {
> +                       drm_bridge_attach(encoder, dsi->in_bridge, NULL, 0);
> +               }
>                   of_node_put(in_bridge_node);
>           }
>
> --
>
> but it turned out that in such case the order of the bridge 'enable'
> calls is not correct for display pipeline operation. The one that
> actually works is (sorry for the hacky code):
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index e8e2df339c5f..51b568556fce 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -259,6 +259,7 @@ struct exynos_dsi {
>           struct mipi_dsi_host dsi_host;
>           struct drm_bridge bridge;
>           struct drm_bridge *out_bridge;
> +       struct drm_bridge *in_bridge;
>           struct device *dev;
>
>           void __iomem *reg_base;
> @@ -1424,6 +1425,9 @@ static void exynos_dsi_atomic_pre_enable(struct
> drm_bridge *bridge,
>
>           dsi->state |= DSIM_STATE_ENABLED;
>           printk("drm: %s finish: %d\n", __func__, 0);
> +
> +       if (dsi->in_bridge)
> + dsi->in_bridge->funcs->pre_enable(dsi->in_bridge);
>    }
>
>    static void exynos_dsi_atomic_enable(struct drm_bridge *bridge,
> @@ -1439,6 +1443,9 @@ static void exynos_dsi_atomic_enable(struct
> drm_bridge *bridge,
>
>           printk("drm: %s finish: %d\n", __func__, 0);
>
> +       if (dsi->in_bridge)
> + dsi->in_bridge->funcs->enable(dsi->in_bridge);
> +
>           return;
>    }
>
> @@ -1455,6 +1462,8 @@ static void exynos_dsi_atomic_disable(struct
> drm_bridge *bridge,
>           dsi->state &= ~DSIM_STATE_VIDOUT_AVAILABLE;
>           printk("drm: %s finish: %d\n", __func__, 0);
>
> +       if (dsi->in_bridge)
> + dsi->in_bridge->funcs->disable(dsi->in_bridge);
>    }
>
>    static void exynos_dsi_atomic_post_disable(struct drm_bridge *bridge,
> @@ -1470,6 +1479,8 @@ static void exynos_dsi_atomic_post_disable(struct
> drm_bridge *bridge,
>
>           printk("drm: %s finish: %d\n", __func__, 0);
>
> +       if (dsi->in_bridge)
> + dsi->in_bridge->funcs->post_disable(dsi->in_bridge);
>    }
>
>    static void exynos_dsi_mode_set(struct drm_bridge *bridge,
> @@ -1482,6 +1493,10 @@ static void exynos_dsi_mode_set(struct drm_bridge
> *bridge,
>
>           drm_mode_copy(&dsi->mode, adjusted_mode);
>           printk("drm: %s finish: %d\n", __func__, ret);
> +
> +       if (dsi->in_bridge)
> + dsi->in_bridge->funcs->mode_set(dsi->in_bridge, mode,
> +                                               adjusted_mode);
>    }
>
>    static int exynos_dsi_attach(struct drm_bridge *bridge,
>    @@ -1674,7 +1689,6 @@ static int exynos_dsi_bind(struct device *dev,
> struct device *master,
>           struct drm_encoder *encoder = &dsi->encoder;
>           struct drm_device *drm_dev = data;
>           struct device_node *in_bridge_node;
> -       struct drm_bridge *in_bridge;
>           int ret;
>
>           printk("drm: %s enter\n", __func__);
> @@ -1688,9 +1702,11 @@ static int exynos_dsi_bind(struct device *dev,
> struct device *master,
>           }
>           in_bridge_node = of_graph_get_remote_node(dev->of_node,
> DSI_PORT_IN, 0);
>           if (in_bridge_node) {
> -               in_bridge = of_drm_find_bridge(in_bridge_node);
> -               if (in_bridge)
> -                       drm_bridge_attach(encoder, in_bridge, NULL, 0);
> +               dsi->in_bridge = of_drm_find_bridge(in_bridge_node);
> +               if (dsi->in_bridge) {
> +                       drm_bridge_attach(encoder, dsi->in_bridge, NULL, 0);
> + INIT_LIST_HEAD(&encoder->bridge_chain);
> +               }
>                   of_node_put(in_bridge_node);
>           }
>
> --
>
> I hope the above findings helps somehow in finishing this patchset. I'm
> not deep in the DRM bridge development, but it looks that there is
> something seriously broken in the design or Exynos MIC and DSI should
> not be modeled as bridges.


I guess the most 'correct' way of handling mic would be dropping 
completely in_bridge from exynos_dsi, instead use bridge chain.

This would require touching decon driver and re-think the role of almost 
dummy 'encoder' code.

I suppose original author of mic bridge did this way because bridge 
framework did not supported attaching bridge between crtc and encoder, 
but now with exynos_dsi as a bridge it should be possible.

But this could be next step.


Regards

Andrzej



>
> I will be on holidays till 10th Jan 2022.
>
> Best regards
