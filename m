Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A3267F507
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jan 2023 06:42:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A027110E2F5;
	Sat, 28 Jan 2023 05:42:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEBE110E1B7;
 Sat, 28 Jan 2023 05:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674884564; x=1706420564;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EFG8QD+YUglFgXiKSInr1ehJM0PwTNNMgruwV0l80nE=;
 b=ItMh4nT6y8cqzU8iC6a1loHryY05dBPbZmJdAWC5D869UVhUkBz/N37u
 25KqVIZPQ4i7UGZDZJeV8lMS/AEeoxNDdl0vjiSzmNsJkHqTupHp2gaOe
 UHonAInZOU4AnbIp1LX9NJGqWaiznXnZQ0vOF3Kbyg0eiLm7NmSPnUQ+H
 BTYLueAESLgZB713edCngkTPhthcXS0D6+027cOgbPPjP2lxLtz5fvC9w
 GN1HIbSAYc6//uAuq4O42aljn4u/9OY7ciXzZg7fNZRujOsS0zd+2a0ZC
 c9dERIlVKCXcPz7vhAgayHiOZmCgeuQfAdNo473B/fHxOfkn5UwpKeOqn w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="306915553"
X-IronPort-AV: E=Sophos;i="5.97,253,1669104000"; d="scan'208";a="306915553"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 21:42:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="992316972"
X-IronPort-AV: E=Sophos;i="5.97,253,1669104000"; d="scan'208";a="992316972"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP; 27 Jan 2023 21:42:44 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 27 Jan 2023 21:42:43 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 27 Jan 2023 21:42:43 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 27 Jan 2023 21:42:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hk//6aaOvotMtLFWp/K5o5rRFhloMzkyu2W6HOr/pXNZbl3u8Hk29pxZgbtPo4C821y9t5YVnwrKO4sYDel4kbMaSA9Tqc+W+uWwCsRfhzKTF/ZB72sHOWcHQ6PoetWpQkcDw6c9nVSh+VfS28uceHFGVKyug5eJ+xUIaQEb3fBpznDQ3Lzo8CIhr3BkoLzRkRAnWgzKtL80Dw3urV/tdelSSXs0MmCTzsRl8+GQI+r8/sr9dUqiR20YM1GJf4hrvFIq1f9folVUWZXAt5GgKCrBLDoJkaHqADsW0/4yaFIB+XwvtmquyKlypUvO9fd7Y1uwDN0J1OiLKRFSiK9XYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ttke8mPPvzIBfJfKnvz+M48At15GNJTSjPpaOPwehAc=;
 b=nIEH7X4zqtCrbOlXELlh435JJFKxI37rpaDmfF64co37i2zHsH4d1vHe+Fa+F0GRiXIlQwVcdtyJXaLrBiIuBAPlMAektEBrH8Y3BgnDtBYqUBecr50rlbtQFrbD3RapmrBUx2EoFDke/Xz7rvONOrMDMaxtCrKZFLh0lZ10tDewfod6NpbtSlwgxmU9sUFljjVe9ChaePbamWrNMz6cHMJ0GTheUuDn0h2zQ9t/Cisvi/U80ZSDqKLiBmd+sOSQ9mYzlHUE92gaxOF6/rCDNvv+ir8c5OVvsyPWglpW8I8qElUeefgXhT0Fh2Lb+WNBKXYFwt5FoKwfjnAQ+TE79A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5409.namprd11.prod.outlook.com (2603:10b6:610:d0::7)
 by CY8PR11MB7170.namprd11.prod.outlook.com (2603:10b6:930:91::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.28; Sat, 28 Jan
 2023 05:42:36 +0000
Received: from CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::5d07:eb02:7913:fce2]) by CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::5d07:eb02:7913:fce2%8]) with mapi id 15.20.6043.028; Sat, 28 Jan 2023
 05:42:36 +0000
Message-ID: <bfe11cf8-87a5-3768-92d5-3415145d8c8f@intel.com>
Date: Sat, 28 Jan 2023 07:41:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] drm/i915/pcode: Wait 10 seconds for pcode to settle
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20230111104447.338136-1-andi.shyti@linux.intel.com>
 <87a62pi501.fsf@intel.com> <Y77XmlzOCuOg8YVZ@ashyti-mobl2.lan>
 <b3d4b882-cb0b-a3c1-2609-6065f379ed15@intel.com>
 <Y9OSyhWHWu8iliP5@ashyti-mobl2.lan>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <Y9OSyhWHWu8iliP5@ashyti-mobl2.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HE1P191CA0001.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::11)
 To CH0PR11MB5409.namprd11.prod.outlook.com
 (2603:10b6:610:d0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5409:EE_|CY8PR11MB7170:EE_
X-MS-Office365-Filtering-Correlation-Id: 539ed9af-2c80-4cb2-3aae-08db00f2758e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YqokjOG7CMa/RQRsSodeMaroyeGYjtaV98rBrzlkKB43JkHKOm9rP0idnFAyuZUxBy5Pg9dWiYWVliG2gBlWvVOeSEgG2EfGS78ZwEdVmeJrA+OW7FgO1Ne6PBSkgcG1CRXAxtaFUr9wo4eWD414su/4XhO/DwSGFSCt+K9oNAdk2EAOmtIN4Qp8JNks2XScEXJAc61gwRwBYj6w1iE01lOJHqFIQeYfZ5AQedt/lkh7dvj2ndNkZqxvR51y3jO4TsIAfNVZXhLNhrGg3hM70FdzDv3HQuICfFFllgbXiMJYdUmOtSt1775lYk+eZXcSIHoDAcgRLa8rb6GZo9jO0J3BE5tOAbE/g7M8ResQLB/55yqmHQocTyjgiIzAs08sUKbm5dSomlOy1ZY4bqxWXbUwkxK5tpe2TL/wbbEYvyWG2JMYWeMkXXpN9V2IJGbwMrmmdMvfEiW98lcmkENSENRNxizJuow9KCC5KmMd7zMVILI14+hpj9KVcbvyBQELbX2JbHUSNz6t+q3q+NsStaAi6J2y5n7c5JzPu9YOEgmD6wgrD8jPEmlJqtgr9ltOq27M5tq7D9tnnYtWseZKTk0X0QjPogirlzTxHvvmfsTbTGSC68D3GraDLwxn7e0WFGIPU+evttLaRa8ef+B95nO+kdXqjSwI2quQ5fNTuP+8oZ9f0R3S76btygqYmOvlyzTP8gp9pXjYs8GlpZ2eKdFDTO60ZFJmxjBybsDcsaU/i+C4j12pyERqo7GuGZ0aczQzeQyisapLPnb3EMQvyA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5409.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(136003)(346002)(376002)(396003)(366004)(451199018)(41300700001)(36756003)(5660300002)(66476007)(66556008)(66946007)(86362001)(8676002)(6916009)(31696002)(30864003)(4326008)(8936002)(2616005)(2906002)(6486002)(966005)(478600001)(186003)(26005)(6512007)(6506007)(53546011)(38100700002)(82960400001)(83380400001)(316002)(54906003)(31686004)(226643001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODJDTWNuR1VENXdEQmdodzMyd05XUXlia09jK2xGbXBnTTFEcEhqMDZSZWxQ?=
 =?utf-8?B?cFBSZ2gweWhpTUQ5M1NRUThZWTM3SkVISk5ZZ2pDL1NVUTFzU2htaTlCVjgy?=
 =?utf-8?B?ZUJaTXh0RnVMcXlTUHB5U3F1Z0t1TmZWTTVOZ2M0Q0xxSGFTWmpxcnFaVUt4?=
 =?utf-8?B?VWVXUG5qUWZoeXZmRW1VMVMvRXhzaGcwalkxSzduWmJBSU1MYmFNK0gvL3JB?=
 =?utf-8?B?T0VZQ2JRV1UrUnRQOHg5blAvWE5pcmRwSFVkeEZnRUw1WWovRHNRNk0vc2VC?=
 =?utf-8?B?bERLSnRCVzJDZWw0OEwyOWdjZGpmamxBRTNnMWRDUnZzdkYxUFF1WHNhRnhi?=
 =?utf-8?B?UTZ4WUsvN1h6TVpZYU95aVdMQkltQkQ1OS9qblEzUlE5dkw4SitOQW9aalNK?=
 =?utf-8?B?SlVmR1NBU3JEQy9uRFJRUkdDcm9QZ2tTb0dXYXlFOFlVcmEyNHc3SzVPRmxL?=
 =?utf-8?B?dEZKcGJzOHFiN003a1FCOHFza3ZUaWVLR3JsRUs0MGFWREdBdGcvM3BtL0E3?=
 =?utf-8?B?VDNGN0t3VzdRNU9uOUtsd1hTNktKQy9PZjBWdjhYSDhwb1VMSm9KRDd0emNN?=
 =?utf-8?B?VTNPWnpZbkY0SWY4a3VCTnNsYUJtZVF2MDhkb3d6MFJJQkNad1VrUEFCYkt2?=
 =?utf-8?B?V3ErN0swS3NFQU9Ua2ZSU1dmZVFERzVMYkZlUXdOSEprWnQ1Z1l1Q3JSZmlO?=
 =?utf-8?B?MlloeUsva0piaFF5RTZYUGdsYTRyaGZiWjI0ajN3TWVYekE4bjBJcTZqQUJZ?=
 =?utf-8?B?VGE2aEJjL2dEd3lxVlVIWjlYcDNRaTFxbzVOV084K055QmloNXdyQ0tkSjUr?=
 =?utf-8?B?WURweG5Tck93UVhZNU5ONFpWcG5EL1Z5NVlmb2daLytNUE9nK21RYzlQWW9q?=
 =?utf-8?B?a1FFSVpWcmw3YVVreWUvQTdGRGRVd1pIaDNia0lXSjBtZXdWMjV6VzBubzRZ?=
 =?utf-8?B?cXNJTTN3L3lTUmtMdnU3SFZITDdHcTVFSENUbEVVRUYwT002U2xKemFCRXNw?=
 =?utf-8?B?STBHVFBLdG1OM1ZIcy9oVVd5VWErSEFkNHFJeGcxcmVqNGlNZURSRWU4aHF1?=
 =?utf-8?B?NVdDRHZlNGhGRDVzLythRmtCWW14NVVzaGowOWZOR3JnRUhSV3h4R2pNMjY2?=
 =?utf-8?B?R0s2WWorWHBCYWVvaloxQnFZN3lSUC9kQmJqV2xPRGhkQnVSU0ZRdHVieWFG?=
 =?utf-8?B?WENIM0NZOFlvOWtkKy95dDYwbldHTFdpb2xXaWswT1JnanFjaVg0aEFGd09Z?=
 =?utf-8?B?TGtOdWxtL2xMcEFIa1FnZzJITkhMVHlXcGRHU3o1MzY1QzROSGlsU1UxajBX?=
 =?utf-8?B?WUZ4VlVsM1M0anFiemc5QmJiSnlCekNNQkErOUlJTFJDRDY2b29GSWtZYVl5?=
 =?utf-8?B?UFBhRjJ1TlJ2WUtZQUNLSTRyc2lCOEpTQzl6VURENzBsbmVLZ01ZSDhwNzhG?=
 =?utf-8?B?Ymk0a1IzeXpIbzFUWFdPVjk1ZEd3VVRsYnhobXlhdFpxZktTMExyK3JINkw0?=
 =?utf-8?B?OC80N2sySHFCQXNub08wS0d2cTVMM2xvVHV0REFFSDlrSWRGY0hxV2RubjIw?=
 =?utf-8?B?RTM1RGthYTB0Z09XWWlLWEFhWk5WcXlhM3poSWJzK0FUOHk3T2N1VGVpRWJx?=
 =?utf-8?B?WjFidEliYjZjMkZkdEdxVG5ZalFlcXY1TUVBVjlYMWV1Q056WGFrcklDcVN4?=
 =?utf-8?B?ZCs1Z3lHeUdYakVubkxqNFlsdi9GbHhUeUM0QmIwdit6MmhMdUd4ZlNpMlBJ?=
 =?utf-8?B?K0VFN1VESzVFUzNpcWFWVjFoSlBnQnlRR001dVgxSXBzQS8vS2lsM1Z5eEFi?=
 =?utf-8?B?emFjVTNqbVVIQWM5YWJaeVF5QjJWdVZhWUQzMmhiRlg0VDJLaGhXSzRQdkw5?=
 =?utf-8?B?M2prVERzdmxXdXprenFOT0llb1NXT3E1SXYwS2V4dVFWY1haRno5anZjcGw3?=
 =?utf-8?B?T0dmWW1taVBFQU5wdWhRMnlQWEVXRFZuTllsTkMzTzRkYi9RVGs4U3lMTnh6?=
 =?utf-8?B?MzYzV1l5QXpWMEVrUWd5ZTBqZEVFVWVQSWttbHBnYzZHTFdYM2V5cnRRZUdE?=
 =?utf-8?B?K1R3WkErdkpOdWFZQ3ZRenNQMjgwT0ZNSFNocW0rcHA5MGJZMjVBeUtRY2Rl?=
 =?utf-8?B?QktSV0t1czByRy9Ha0FuT3pleGE0WkVJYXhGbE83V1VWb3dZVC83endlSzhH?=
 =?utf-8?B?RlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 539ed9af-2c80-4cb2-3aae-08db00f2758e
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5409.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2023 05:42:36.1784 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q3J4mMlyd/sVa5kxRvx6fP/oOdbK5h7G4ShSInBuIzcas8LtxreWrfQUeE1tebBXRgWENhGL5IIgbhRuO51gmqGHPwDBGz1QG/vJkZ2ryBA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7170
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
Cc: Andi Shyti <andi@etezian.org>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>, Rodrigo
 Vivi <rodrigo.vivi@intel.com>, Chris
 Wilson <chris.p.wilson@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/27/23 11:00 AM, Andi Shyti wrote:
> Hi Gwan-gyeong,
> 
> thanks for the review and the thorough explanation.
> 
> On Fri, Jan 27, 2023 at 08:50:26AM +0200, Gwan-gyeong Mun wrote:
>>
>>
>> On 1/11/23 5:36 PM, Andi Shyti wrote:
>>> On Wed, Jan 11, 2023 at 03:18:38PM +0200, Jani Nikula wrote:
>>>> On Wed, 11 Jan 2023, Andi Shyti <andi.shyti@linux.intel.com> wrote:
>>>>> From: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>>>>
>>>>> During module load not all the punit transaction have completed
>>>>> and we might end up timing out, as shown by the following
>>>>> warning:
>>>>
>>>> Root cause?
>>
>> Hi Andi, looking at the log where this problem is reported,
>>
>> https://gitlab.freedesktop.org/drm/intel/-/issues/7814
>>
>> https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_1294/bat-atsm-1/igt@i915_module_load@resize-bar.html#dmesg-warnings17324
>>
>> <4> [268.276908] i915 0000:4d:00.0: drm_WARN_ON_ONCE(timeout_base_ms > 3)
>>
>> In the code above, the call stack is output, and the return value of
>> intel_pcode_init() returns -11 (-EAGAIN).
>>
>> <3> [268.329058] i915 0000:4d:00.0: [drm] *ERROR* gt0: intel_pcode_init
>> failed -11
>>
>>
>> If you simplify the function call flow, you can see it as below. (The call
>> of _wait_for(COND, timeout_base_ms * 1000, 10, 10) in skl_pcode_request() is
>> omitted)
>>
>> -------------------------------------------------------------------------
>> intel_pcode_init()
>>   |
>>   +-> skl_pcode_request(uncore, DG1_PCODE_STATUS,
>>                         DG1_UNCORE_GET_INIT_STATUS,
>>                         DG1_UNCORE_INIT_STATUS_COMPLETE,
>>                         DG1_UNCORE_INIT_STATUS_COMPLETE, 180000);
>>         |
>>         +-> skl_pcode_try_request()
>>               |
>>               +->  *status = __snb_pcode_rw(uncore, mbox, &request, NULL,
>>                                             500, 0, true);
>>
>> -------------------------------------------------------------------------
>> static int __snb_pcode_rw(struct intel_uncore *uncore, u32 mbox,
>> 		          u32 *val, u32 *val1,
>> 			  int fast_timeout_us, int slow_timeout_ms,
>> 			  bool is_read)
>> {
>> ...
>>
>> 	if (intel_uncore_read_fw(uncore, GEN6_PCODE_MAILBOX) & GEN6_PCODE_READY)
>> 		return -EAGAIN;
>>
>> 	intel_uncore_write_fw(uncore, GEN6_PCODE_DATA, *val);
>> 	intel_uncore_write_fw(uncore, GEN6_PCODE_DATA1, val1 ? *val1 : 0);
>> 	intel_uncore_write_fw(uncore,
>> 			      GEN6_PCODE_MAILBOX, GEN6_PCODE_READY | mbox);
>>
>> 	if (__intel_wait_for_register_fw(uncore,
>> 					 GEN6_PCODE_MAILBOX,
>> 					 GEN6_PCODE_READY, 0,
>> 					 fast_timeout_us,
>> 					 slow_timeout_ms,
>> 					 &mbox))
>> 		return -ETIMEDOUT;
>>
>> ...
>> }
>> -------------------------------------------------------------------------
>>
>> The case where skl_pcode_request() returns -EAGAIN can be considered as the
>> following scenario.
>> 1. 1. When checking the GEN6_PCODE_MAILBOX register status before writing
>> the value to the GEN6_PCODE_DATA register in __snb_pcode_rw(), it is always
>> BUSY
> 
> correct! We fail with EAGAIN because we are not able to
> communicate with the punit because the punit is busy.
> 
> Talking about this case we are in boot time and the gpu is
> performing its boot routine, the punit as well. While the punit
> is working we try communicate with it, but unfortunately, being
> busy, we fail with -EAGAIN exactly where you pointed.
> 
> Adding an extra wait_for_register_fw, i.e. waiting until the
> PCODE_READY register tells that the punit is ready, makes sure
> that the read/write will succeed.
> 
> Thus Chris has added a 10 seconds wait before the very first read
> and write. If the punit is not ready we don't fail with -EAGAIN
> and give up the driver loading as it happens now. But we give it
> another chance trying to probe it again later.
> 
>> 2. _wait_for(COND, timeout_base_ms * 1000, 10, 10) of skl_pcode_request()
>> returns -EAGAIN if the GEN6_PCODE_MAILBOX register indicates BUSY even after
>> waiting 500us after writing a value to the GEN6_PCODE_DATA register in
>> __snb_pcode_rw()
> 
> Isn't it the same as '1'?
> 
>> (Even if skl_pcode_request() gives a timeout of 180 seconds, the time used
>> each time __snb_pcode_rw() is called is up to 500us. The rest of the time is
>> used for sleep.)
> 
> There is one big, massive, huge difference... the timeout in
> skl_pcode_request() after the read/write, not before. So that at
> the first communication we fail, return -EAGAIN and give up
> probing without starting any timer.
> 
> Be aware of the fact that the timeout is not for the current
> communication, but for the next one. De facto we start the
> timeout after communicating, this makes sure that the next
> communication will work.
> 
> But no one makes sure that the very first communication works
> during probe. Thus the extra wait.
>
Hi Andi,
In the call flow invoked by intel_pcode_init(), I've added brief 
comments where further clarification is needed in this scenario, and a 
description of the suspicious scenario at the bottom.

-------------------------------------------------------------------------
intel_pcode_init()
  |
  +-> skl_pcode_request(uncore, DG1_PCODE_STATUS,
                        DG1_UNCORE_GET_INIT_STATUS,
                        DG1_UNCORE_INIT_STATUS_COMPLETE,
                        DG1_UNCORE_INIT_STATUS_COMPLETE, 180000);
        |
        +-> skl_pcode_try_request()
              |
              +->  *status = __snb_pcode_rw(uncore, mbox, &request, NULL,
                                            500, 0, true);

-------------------------------------------------------------------------
static int __snb_pcode_rw(struct intel_uncore *uncore, u32 mbox,
		          u32 *val, u32 *val1,
			  int fast_timeout_us, int slow_timeout_ms,
			  bool is_read)
{
...
         /* Before writing a value to the GEN6_PCODE_DATA register,
            check if the bit in the GEN6_PCODE_MAILBOX register indicates
            BUSY. */
	if (intel_uncore_read_fw(uncore, GEN6_PCODE_MAILBOX) & GEN6_PCODE_READY)
		return -EAGAIN;

         /* write value to GEN6_PCODE_DATA register */
	intel_uncore_write_fw(uncore, GEN6_PCODE_DATA, *val);

	intel_uncore_write_fw(uncore, GEN6_PCODE_DATA1, val1 ? *val1 : 0);

         /* In this scenario, the value
            "DG1_PCODE_STATUS | GEN6_PCODE_READY"
            is written to the GEN6_PCODE_MAILBOX register,
            so that the Busy status of the GEN6_PCODE_MAILBOX register
            can be checked later.
            (When the value of the GEN6_PCODE_READY bit of the
             GEN6_PCODE_MAILBOX register changes to 0, the operation can
             be considered completed.) */
	intel_uncore_write_fw(uncore,
			      GEN6_PCODE_MAILBOX, GEN6_PCODE_READY | mbox);

         /* In this scenario, verify that the BUSY status bit in the
            GEN6_PCODE_MAILBOX register turns off for up to 500us. */
	if (__intel_wait_for_register_fw(uncore,
					 GEN6_PCODE_MAILBOX,
					 GEN6_PCODE_READY, 0,
					 fast_timeout_us,
					 slow_timeout_ms,
					 &mbox))
		return -ETIMEDOUT;
         /* If there is a failure here, it may be considered that the
            "DG1_PCODE_STATUS | GEN6_PCODE_READY" operation was not
            completed within 500us */
...
}

int skl_pcode_request(struct intel_uncore *uncore, u32 mbox, u32 request,
		      u32 reply_mask, u32 reply, int timeout_base_ms)
{
	u32 status;
	int ret;

	mutex_lock(&uncore->i915->sb_lock);

#define COND \
	skl_pcode_try_request(uncore, mbox, request, reply_mask, reply, &status)

         /* the first trial for skl_pcode_try_request() can return
            -EAGAIN or -ETIMEDOUT. And the code did not check the error
            code here, so we don't know how far the __snb_pcode_rw()
            function went. It is not known whether the pcode_mailbox
            status was busy before writing the value to the
            GEN6_PCODE_DATA register or after.*/
	if (COND) {
		ret = 0;
		goto out;
	}

         /* In this scenario, skl_pcode_try_request() is invoked every
            10us for 180 seconds. When skl_pcode_try_request() returns
            -EAGAIN and -ETIMEDOUT by _wait_for(),
            -ETIMEDOUT is returned to a variable ret. */

	ret = _wait_for(COND, timeout_base_ms * 1000, 10, 10);

	if (!ret)
		goto out;

	/*
	 * The above can time out if the number of requests was low (2 in the
	 * worst case) _and_ PCODE was busy for some reason even after a
	 * (queued) request and @timeout_base_ms delay. As a workaround retry
	 * the poll with preemption disabled to maximize the number of
	 * requests. Increase the timeout from @timeout_base_ms to 50ms to
	 * account for interrupts that could reduce the number of these
	 * requests, and for any quirks of the PCODE firmware that delays
	 * the request completion.
	 */
	drm_dbg_kms(&uncore->i915->drm,
		    "PCODE timeout, retrying with preemption disabled\n");
	drm_WARN_ON_ONCE(&uncore->i915->drm, timeout_base_ms > 3);
	preempt_disable();
	ret = wait_for_atomic(COND, 50);

	preempt_enable();

out:
	mutex_unlock(&uncore->i915->sb_lock);
	return status ? status : ret;
#undef COND
}

---------------------------------------------------------

If you try skl_pcode_try_request() for 180 seconds in 
skl_pcode_request(), and the first "intel_uncore_read_fw(uncore, 
GEN6_PCODE_MAILBOX) & GEN6_PCODE_READY)" call in __snb_pcode_rw() that 
skl_pcode_try_request() invokes always fails. if then it does not make 
sense to me why this patch fixes it by just waiting 10 seconds.This is 
because if it was called with the flow described above, 180 seconds is 
longer than 10 seconds, so the scenario you mentioned is also covered in 
the existing code.

To describe in more detail the second scenario I previously commented on:
skl_pcode_request() tries skl_pcode_try_request() for 180 seconds
  1) In skl_pcode_try_request(), the GEN6_PCODE_MAILBOX register bit is 
not BUSY, so the value is written to the GEN6_PCODE_DATA1 register.
  2) skl_pcode_try_request() returns -ETIMEDOUT value because the 
operation of 1) does not complete within 500us.
  3) Scenario in which the GEN6_PCODE_MAILBOX register bit is checked as 
BUSY and returns -EAGAIN in the last call of skl_pcode_try_request() 
invoked by skl_pcode_request()

If the reason why this problem occurred is because of this scenario, 
shouldn't there be an attempt to increase fast_timeout_us used as an 
argument of __snb_pcode_rw() to 500us or more when 
skl_pcode_try_request() returns -ETIMEDOUT?

Br,
G.G.
>> In the situation where the problem is reported, it is not possible to
>> confirm exactly which scenario code causes the problem with the current log
>> information, and it seems that additional analysis is needed to confirm it.
>> If the hardware takes more than 500us to succeed after PCODE_MAILBOX write
>> under certain circumstances, it is thought that the root problem causing the
>> problem should be fixed.
> 
> Actually I have tested it and indeed the extra check on the
> PCODE_READY is needed and makes the driver probe correctly.
> 
> Thanks,
> Andi
