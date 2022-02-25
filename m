Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F674C4E06
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 19:48:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF11710E923;
	Fri, 25 Feb 2022 18:48:10 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8CA210E8CB;
 Fri, 25 Feb 2022 18:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645814888; x=1677350888;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FF0/WONptS2rRg+mWmsIIXtp/81+PNg3XbF3Utfkb/4=;
 b=MKMvipqx9pNkbwytpakUDMwZRQ5ZP2ojPOS1tz2/IxATcr4wxfUBVsAe
 S6vvSo52j7dnuRNpxDSfPswcY/Es4hWtLduFoJF5ZomASxNzKNepkgLuC
 5TVTDaxB6JPQ0ffpJ/Q0/8nNeGfNqF8YnWXiF6MchjY0/YYIgjxMVMFdk
 QjwDIZyKu8hww33qSDPbZTZr86Pbu9+UL/876ss4LWfa3xSdYIK+vBKaC
 33EOYTLuYAK3g8VNiBlsVNVCeseG2bJMe1HyF6Bx4rK/gen+RrC76OuIl
 rWtk8naed0bJpqP0l4fjlc1isLRXdqc5Mhrvh6lfQvj0STWvPIt2DKOxp g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="338994598"
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; d="scan'208";a="338994598"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 10:48:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; d="scan'208";a="792854503"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by fmsmga005.fm.intel.com with ESMTP; 25 Feb 2022 10:48:08 -0800
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 25 Feb 2022 10:48:07 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 25 Feb 2022 10:48:07 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Fri, 25 Feb 2022 10:48:07 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 25 Feb 2022 10:48:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J3vjx3JIS0pUSJ1G/ScoCbtt3WAxhibwJlSmczUA7QXpvO7r17b6YbaD9+TIFUjEwRK1zuLhyYH3wzv4sR5ichmxce6eoS9bzQUQfV3TLvR0/PRpH6soiMVFco8ifQGDc01RuyDZ/UtBOHduwkCyc/YHA3XHkJB8M7xd3SahMT1STPXgb1pSW+Wan84d/W+nZ+2MSpHP3CwTtSzh489n9ZFRAU03jyPrMqQeHyZVOP2BaW/OIY+aLz9kr1IOvgqRasqvTF9yYeNIug0fbJXh/IZZTYWSHzNK4FoNAjXiyEX7Ihrl7A0YckQ6na8t8PdDfqb+s/Scw+Ykvko1wxtNnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hyky6VoTWY+iTzHRzv6fnomYRpvybMfKPFJGMN3CE9Y=;
 b=CxEgtIqKS0+0fMB5SDhIYhz8LnCzkJvp2L791Uhn/utUCeTAXPnhLdiLrR1AX3eDhuteJy+IP+i6mFsYQRDgO1jUfFgzCIfKZVkauJDTgXWuMe7+YFShEh1mniZZilX+eePxhNl9GZp8c8iX20yI1tAJRoDCMa73N7dTF3A5bIvwkEnf0ZGWUZ/UEfD91Dxff53Dv6S3tVk58iUM02avcbtwWUWFCAXG2G3wcWMyRLFJdAn3yhQZkkasTWD0VKu6I1JXzIOdtG1CT05nh/XyPB3JI+veOJ3/0pB0Z7qiwupQSFz8z7QP3Fgwf3AR+NVM8ELquTm8ZqNAxIOseu3gNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by CY4PR11MB0007.namprd11.prod.outlook.com (2603:10b6:910:79::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.26; Fri, 25 Feb
 2022 18:48:05 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7%4]) with mapi id 15.20.5017.022; Fri, 25 Feb 2022
 18:48:05 +0000
Message-ID: <f6c70184-121e-9a2b-6bbc-54a67af293cc@intel.com>
Date: Fri, 25 Feb 2022 10:48:02 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [Intel-gfx] [PATCH 2/3] drm/i915/gt: Make the heartbeat play nice
 with long pre-emption timeouts
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220218213307.1338478-1-John.C.Harrison@Intel.com>
 <20220218213307.1338478-3-John.C.Harrison@Intel.com>
 <2a486991-1bfd-9b23-0b43-9173d17b7e13@linux.intel.com>
 <e95e8710-8410-2869-dec1-7f7a9e9a74fb@intel.com>
 <18205069-1210-745f-3bcc-2eddb0d17da1@linux.intel.com>
 <94e9889d-d71a-1428-516d-2928807cbf43@intel.com>
 <6ee75384-2cf0-6b34-ed54-3c7dc9ca31a3@linux.intel.com>
 <d6624800-87b0-f992-bc83-868744e2839c@intel.com>
 <ed505a8e-2d2b-135b-aaab-7e4a0befd5ba@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <ed505a8e-2d2b-135b-aaab-7e4a0befd5ba@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MWHPR1601CA0010.namprd16.prod.outlook.com
 (2603:10b6:300:da::20) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab2c9748-9669-40fa-5883-08d9f88f5b68
X-MS-TrafficTypeDiagnostic: CY4PR11MB0007:EE_
X-Microsoft-Antispam-PRVS: <CY4PR11MB0007E1BA18D31BD3F3A61523BD3E9@CY4PR11MB0007.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gQEepY9DJaVD5FInbW7ee2Tgaq/Pjjz29oq18uxw8DvgmOIe4h1pK3KSow7eJtCEP1LsyYdqHXIC7DbbBaMMg/GgN7faRoILqDwpYfFXzKsr99DV7XL66zTlslcYyTMM73DKvgh6cuBs50S6SLhJsGBaZuJP+tWxAgYBmrbgSPOZcrY5lEp6unA1luLXMP/CC7cE+omZpxGUDU1U76klHmBpYlkZa58etWOYITBmoIeiuI+Yb6mFnk6z5LwaUF0CHjG12JDoEmsZk21UyAMtn4QocOSI0GYNlGC38HFOiizKsSn+qp7H7k7o75Ciw6DI1b5RhU70Mhz6sx/UQWTsUEftCvwCHVBj0gT6dj7e/QYRx+th1X8WPW5XaIxQRhwLrb/PyMv7B1SB0jAw8Je3ngQh0edLWWoXcIyZ9ohpEPU7OviBpkFTPxxPpTM06PzHtyHhUyUNChcXMT6OplQa0JzlFBgfJyCx0+bj4buDNRz1rK9zA+BEZdOMHRdfJxwgjWVc6JwD9PDamUGCS5Zz9fF17YeRlg120AvE3xeFZwpNI4a5B6naAi9lMUZIsAJUBS++o92tzBH7UjdrCRk7/j0/I/WoIFIkp/bXIMzYPwiEfIfYE6YU7GUf3+Zo5WSinEs8EuBNZb4fU4ya1yZY/HYOgluYZQ6QwtNzZxtTjMsxHF7u9MbW50KgwAMfuorPqt3jv5O6w8UFtA8lJKFRfStH1kdn6i7f0td8ln47uD8BpmjG3MFAC0/Tf/to15IC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(26005)(186003)(2616005)(316002)(4326008)(31686004)(66556008)(66946007)(8676002)(66476007)(36756003)(30864003)(83380400001)(6506007)(53546011)(2906002)(31696002)(6512007)(38100700002)(6486002)(508600001)(82960400001)(5660300002)(8936002)(6666004)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGdmaEliUmVYRjN4YzhWdDQrQTZsQW1uOEVuZ1ZKT1lyamZhQk05RFNJOGZK?=
 =?utf-8?B?RlczOWRvMDRJU01LeFg4alo5OXdORGI5VTYvNmRGazN3ZDQ5MXE5a3ZPMjFR?=
 =?utf-8?B?RWFKazB5N1h1TU53b3lrb1BtS3dINW5la1R6anVVTEZVTkhxcmF6SERrTVRJ?=
 =?utf-8?B?VVJtWHVsREhVTlFSWjZIUWlzMVRCR3FzNEo0bmZLeGRxbEEzZlMvNVBzQTlU?=
 =?utf-8?B?MnkzdmN2bENRQkhFa0R1ajdYTFJTWThJTjFDL1U3TUhkaGkza0hvVWhtY0Z3?=
 =?utf-8?B?YW56b2ZGbC8zV1kzOE5DOFJaMnZ1QzUwRVZQaDhES0ZQNW95OXdRdDlDTUdy?=
 =?utf-8?B?QWNUS2JRby9BNUhWNUkxdUc2Z2txUitRM0FRSmcrK0d1MjU4QkgvNzdhejNQ?=
 =?utf-8?B?dmtOaWNQa3hPQ0dSMXMxeEEyc0Ezd1NkR0UvK1RNTHpFWDBST3l0aFo3MFk0?=
 =?utf-8?B?Ri9IMXIzck0yejBEZ2pSQzVOSjNQUHNhMnU5M21QTi9vNG01MFFFOVRGU3lF?=
 =?utf-8?B?bFI3eDNvTzRFbjF1a1UzbGhUQlppY2VjZEFHTFpyVko5L1JtemZvNy9KUWh0?=
 =?utf-8?B?ZnVrYTE0STZWS0habzNzYmMxTDRwNEszeWFIdUFZR3BPOEFSUU1uR2I2SEQr?=
 =?utf-8?B?VWxHMmQwL0dVOTA5aGpCK0l1S3lVOTNMS2JIV2orYzZSdU04WklKREtUSTNE?=
 =?utf-8?B?UDBhZ3VXQVRwVjBYUkdsampkcGpjb2cxR1JCLzN0cDUxT29Xb21qRitCNURM?=
 =?utf-8?B?SkJLcC9hSGNTLys4OHl2eWd5cDMyUFdIeGpGc0ptVlVNUkRIdmx6bHJpNGIr?=
 =?utf-8?B?UWhrYkNsaXhWZmwzOHAyUWdYZzV1ZTQreXc2dkpudUUvdVVCcnpnMnozc0to?=
 =?utf-8?B?MHUybnZhUmpGajNmZUUyZVNubjBpZjdWR0cvVDVzMFJUZ2dpaEpTSGR1WlJ3?=
 =?utf-8?B?b2pqZG9vbGZKcHBVYVNwUUROdUtocndzT0tpdHBPKytpb2hRSzM4R295MXNS?=
 =?utf-8?B?Y3plcHBURlM0d2dERE9TeGNxV09xMHBvRnBic2p6QjdoMUhJZ1RLblVOdWw3?=
 =?utf-8?B?dWFYa1hzd01KSG5PYSs0NlBsbzNUOE1nMDhVMmgvM0NWODZqak1nTCtMRHBq?=
 =?utf-8?B?TjBlZDlTM3RiRThTRTNuOXZBT2R2bk92TnNVYzh6clJpTURjeko4c1dDWXYx?=
 =?utf-8?B?U252c2RtVzRIOEw1ZncrbFZVVTM3SG4xK1pBOW1QNjJWWGpBZVNzN2M2SVJI?=
 =?utf-8?B?TnRXZFJzeERxSmhIcU82UEFrdHhiQnBVYUtTRDFsWTdMV1F4cHZsTE9mSGpR?=
 =?utf-8?B?T2svOTc0YTBmdEVtdmlRT2FyY0x3WGNiVWNEdUpDQlAyaGdIcVJOQVhFK2lD?=
 =?utf-8?B?Q2I1bjl3R0h1MGVoM3lKb2tpSGg5bkQ1NzBTTytydWlFSGpkWmp2dkl1aVdr?=
 =?utf-8?B?SHhJanRIcDBNWVQ5SjB6SlM0cDZ5T00zKy9DU0lzSGFhdnoxM0FSc1lvZmFG?=
 =?utf-8?B?dE1Oc2xwQms2ODhhV0tVV0JaeXhZQnJvNFMvNnVtcnNwcTJmQkM0VGlkcWl6?=
 =?utf-8?B?WUZwcmpMODBRaEYvU3lRS2xrRTRpYzlERDBHL1VpOUR2MWFMTjVLUm13UkhW?=
 =?utf-8?B?VXhpSWhrdURwd2MxRU1kbTEzVWtFS3ZFcXlyaHVEeEd0WE5iSmxFQmRaYmFZ?=
 =?utf-8?B?NlRrYTcrR2o0TkhDMWFuYVBIVUtOTkVLNjdOSUU4ZEc1N2QxTUI1UU8xaXd0?=
 =?utf-8?B?dTVWMi8zMWJYb21lNTdjOHprUHZhUnV1U2RpSHBSY1QwMzVEWnM2WW5QSFlX?=
 =?utf-8?B?MTYvYnRCRFZCWGR3K3VVZXFoc285ek5UM3FyMXhHaXg4TWZrK2RjQTVBdDl1?=
 =?utf-8?B?NzF3Wlp6Nm1lZ3kvc3pXWUFsUkxYZ0RNUmtUTVRrNHZxSDZoMnU2dFFxYU9r?=
 =?utf-8?B?M1IwY2lxT3BsZEJNdEJ1d0w3U3I0bnUveVZHaU50S2R1QmdkcFRDT2duL2FL?=
 =?utf-8?B?UmZZYThwVGZ5dmRvcFI1WW5PemZOY0pzZ2VUSDRWcUhTeXhtSjZNSzd0ZEVS?=
 =?utf-8?B?clhNb1ppaWxWNFZBS0pJWHlJNGZUSk40R2htZnZUL1BDU0VqKzF5V3lWTDI5?=
 =?utf-8?B?U1ltbTN1MGdMT1BHMjdoaXh5WTVGdjNPRFMyNEw4M0dpRnlOWUJJVW5DbXk0?=
 =?utf-8?B?aWRVaWF4bGJseXl1MkZ1M2lyL2ZCMnQwcGpTakpta0IyeHZKUlMyNWxaR2d3?=
 =?utf-8?Q?M3pRwMVlHtOWR6rJPza6rehmWKUJnHMNz7hLJT88qY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab2c9748-9669-40fa-5883-08d9f88f5b68
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 18:48:04.9087 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NCVOyXRTf3xHNJ56TC5iZ7XbUQH22z6Kl971hy9bpxAVEbx+WrDgTwjCQ8tzcGCi1pvzh3ggqNYQRbulGUzXL5dFW4vlN0IhCvUBbEArvAY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB0007
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

On 2/25/2022 10:14, Tvrtko Ursulin wrote:
>
> I'll try to simplify the discussion here:
>
> On 24/02/2022 19:45, John Harrison wrote:
>> On 2/24/2022 03:41, Tvrtko Ursulin wrote:
>>> On 23/02/2022 20:00, John Harrison wrote:
>>>> On 2/23/2022 05:58, Tvrtko Ursulin wrote:
>>>>> On 23/02/2022 02:45, John Harrison wrote:
>>>>>> On 2/22/2022 03:19, Tvrtko Ursulin wrote:
>>>>>>> On 18/02/2022 21:33, John.C.Harrison@Intel.com wrote:
>>>>>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>>>>>
>>>>>>>> Compute workloads are inherantly not pre-emptible for long 
>>>>>>>> periods on
>>>>>>>> current hardware. As a workaround for this, the pre-emption 
>>>>>>>> timeout
>>>>>>>> for compute capable engines was disabled. This is undesirable 
>>>>>>>> with GuC
>>>>>>>> submission as it prevents per engine reset of hung contexts. 
>>>>>>>> Hence the
>>>>>>>> next patch will re-enable the timeout but bumped up by an order of
>>>>>>>> magnititude.
>>>>>>>
>>>>>>> (Some typos above.)
>>>>>> I'm spotting 'inherently' but not anything else.
>>>>>
>>>>> Magnititude! O;)
>>>> Doh!
>>>>
>>>> [snip]
>>>>
>>>>>> Whereas, bumping all heartbeat periods to be greater than the 
>>>>>> pre-emption timeout is wasteful and unnecessary. That leads to a 
>>>>>> total heartbeat time of about a minute. Which is a very long time 
>>>>>> to wait for a hang to be detected and recovered. Especially when 
>>>>>> the official limit on a context responding to an 'are you dead' 
>>>>>> query is only 7.5 seconds.
>>>>>
>>>>> Not sure how did you get one minute?
>>>> 7.5 * 2 (to be safe) = 15. 15 * 5 (number of heartbeat periods) = 
>>>> 75 => 1 minute 15 seconds
>>>>
>>>> Even ignoring any safety factor and just going with 7.5 * 5 still 
>>>> gets you to 37.5 seconds which is over a half a minute and likely 
>>>> to race.
>>>
>>> Ah because my starting point is there should be no preempt timeout = 
>>> heartbeat * 3, I just think that's too ugly.
>> Then complain at the hardware designers to give us mid-thread 
>> pre-emption back. The heartbeat is only one source of pre-emption 
>> events. For example, a user can be running multiple contexts in 
>> parallel and expecting them to time slice on a single engine. Or 
>> maybe a user is just running one compute task in the background but 
>> is doing render work in the foreground. Etc.
>>
>> There was a reason the original hack was to disable pre-emption 
>> rather than increase the heartbeat. This is simply a slightly less 
>> ugly version of the same hack. And unfortunately, the basic idea of 
>> the hack is non-negotiable.
>>
>> As per other comments, 'tP(RCS) = tH *3' or 'tP(RCS) = tP(default) * 
>> 12' or 'tP(RCS) = 7500' are the available options. Given that the 
>> heartbeat is the ever present hard limit, it seems most plausible to 
>> base the hack on that. Any of the others works, though. Although I 
>> think a explicit hardcoded value is the most ugly. I guess the other 
>> option is to add CONFIG_DRM_I915_PREEMPT_TIMEOUT_COMPUTE and default 
>> that to 7500.
>>
>> Take your pick. But 640ms is not allowed.
>>
>>>
>>>>> Regardless, crux of argument was to avoid GuC engine reset and 
>>>>> heartbeat reset racing with each other, and to do that by 
>>>>> considering the preempt timeout with the heartbeat interval. I was 
>>>>> thinking about this scenario in this series:
>>>>>
>>>>> [Please use fixed width font and no line wrap to view.]
>>>>>
>>>>> A)
>>>>>
>>>>> tP = preempt timeout
>>>>> tH = hearbeat interval
>>>>>
>>>>> tP = 3 * tH
>>>>>
>>>>> 1) Background load = I915_PRIORITY_DISPLAY
>>>>>
>>>>> <-- [tH] --> Pulse1 <-- [tH] --> Pulse2 <-- [tH] --> Pulse3 <---- 
>>>>> [2 * tH] ----> FULL RESET
>>>>>                                                        |
>>>>>                                                        \- 
>>>>> preemption triggered, tP = 3 * tH ------\
>>>>> \-> preempt timeout would hit here
>>>>>
>>>>> Here we have collateral damage due full reset, since we can't tell 
>>>>> GuC to reset just one engine and we fudged tP just to "account" 
>>>>> for heartbeats.
>>>> You are missing the whole point of the patch series which is that 
>>>> the last heartbeat period is '2 * tP' not '2 * tH'.
>>>> +        longer = READ_ONCE(engine->props.preempt_timeout_ms) * 2;
>>>>
>>>> By making the last period double the pre-emption timeout, it is 
>>>> guaranteed that the FULL RESET stage cannot be hit before the 
>>>> hardware has attempted and timed-out on at least one pre-emption.
>>>
>>> Oh well :) that probably means the overall scheme is too odd for me. 
>>> tp = 3tH and last pulse after 2tP I mean.
>> To be accurate, it is 'tP(RCS) = 3 * tH(default); tH(final) = 
>> tP(current) * 2;'. Seems fairly straight forward to me. It's not a 
>> recursive definition or anything like that. It gives us a total 
>> heartbeat timeout that is close to the original version but still 
>> allows at least one pre-emption event.
>>
>>>
>>>> [snip]
>>>>
>>>>
>>>>> <-- [tH] --> Pulse1 <-- [tH] --> Pulse2 <-- [tH] --> Pulse3 <---- 
>>>>> [2 * tH] ----> full reset would be here
>>>>>                |
>>>>>                \- preemption triggered, tP = 3 * tH ----------------\
>>>>> \-> Preempt timeout reset
>>>>>
>>>>> Here is is kind of least worse, but question is why we fudged tP 
>>>>> when it gives us nothing good in this case.
>>>>>
>>>> The point of fudging tP(RCS) is to give compute workloads longer to 
>>>> reach a pre-emptible point (given that EU walkers are basically not 
>>>> pre-emptible). The reason for doing the fudge is not connected to 
>>>> the heartbeat at all. The fact that it causes problems for the 
>>>> heartbeat is an undesired side effect.
>>>>
>>>> Note that the use of 'tP(RCS) = tH * 3' was just an arbitrary 
>>>> calculation that gave us something that all interested parties were 
>>>> vaguely happy with. It could just as easily be a fixed, hard coded 
>>>> value of 7.5s but having it based on something configurable seemed 
>>>> more sensible. The other option was 'tP(RCS) = tP * 12' but that 
>>>> felt more arbitrary than basing it on the average heartbeat 
>>>> timeout. As in, three heartbeat periods is about what a normal prio 
>>>> task gets before it gets pre-empted by the heartbeat. So using that 
>>>> for general purpose pre-emptions (e.g. time slicing between 
>>>> multiple user apps) seems reasonable.
>>>
>>> I think the fact you say tP fudge is not related to heartbeats and 
>>> then go to mention heartbeat even in the "formula" which uses no tH 
>>> is saying something (at least that's how I read the 7.5s option). :)
>> I said the tP fudge is not because of the heartbeat. It is obviously 
>> related.
>>
>> As per comment above, the fudge factor is based on the heartbeat 
>> because the heartbeat is the ultimate limit. But the *reason* for the 
>> fudge fact has nothing to do with the heartbeat. It is required even 
>> if heartbeats are disabled.
>>
>>>
>>>>> B)
>>>>>
>>>>> Instead, my idea to account for preempt timeout when calculating 
>>>>> when to schedule next hearbeat would look like this:
>>>>>
>>>>> First of all tP can be left at a large value unrelated to tH. Lets 
>>>>> say tP = 640ms. tH stays 2.5s.
>>>> 640ms is not 'large'. The requirement is either zero (disabled) or 
>>>> region of 7.5s. The 640ms figure is the default for non-compute 
>>>> engines. Anything that can run EUs needs to be 'huge'.
>>>>
>>>>
>>>>>
>>>>> 1) Background load = I915_PRIORITY_DISPLAY
>>>>>
>>>>> <-- [tH + tP] --> Pulse1 <-- [tH + tP] --> Pulse2 <-- [tH + tP] 
>>>>> --> Pulse3 <-- [tH + tP] --> full reset would be here
>>>> Sure, this works but each period is now 2.5 + 7.5 = 10s. The full 
>>>> five periods is therefore 50s, which is practically a minute.
>>>
>>> No, in my proposal it is 3 * (2.5s + 640ms) =~ 9.3s.
>> Not good enough. After 2.5s, we send a pulse. After a further 640ms 
>> we perform an engine reset. That means your compute workload had only 
>> 640ms after being told to pre-empt to reach a pre-emption point. That 
>> won't work. It needs to be multiple seconds.
>>
>>>
>>>> [snip]
>>>>
>>>>> Am I missing some requirement or you see another problem with this 
>>>>> idea?
>>>>>
>>>>>>> On a related topic, if GuC engine resets stop working when 
>>>>>>> preempt timeout is set to zero - I think we need to somehow let 
>>>>>>> the user know if they try to tweak it via sysfs. Perhaps go as 
>>>>>>> far as -EINVAL in GuC mode, if i915.reset has not explicitly 
>>>>>>> disabled engine resets.
>>>>>> Define 'stops working'. The definition of the sysfs interface is 
>>>>>> that a value of zero disables pre-emption. If you don't have 
>>>>>> pre-emption and your hang detection mechanism relies on 
>>>>>> pre-emption then you don't have a hang detection mechanism 
>>>>>> either. If the user really wants to allow 
>>>>>
>>>>> By stops working I meant that it stops working. :)
>>>>>
>>>>> With execlist one can disable preempt timeout and "stopped 
>>>>> heartbeat" can still reset the stuck engine and so avoid 
>>>>> collateral damage. With GuC it appears this is not possible. So I 
>>>>> was thinking this is something worthy a log notice.
>>>>>
>>>>>> their context to run forever and never be pre-empted then that 
>>>>>> means they also don't want it to be reset arbitrarily. Which 
>>>>>> means they would also be disabling the heartbeat timer as well. 
>>>>>> Indeed, this is what we 
>>>>>
>>>>> I don't think so. Preempt timeout is disabled already on TGL/RCS 
>>>>> upstream but hearbeat is not and so hangcheck still works.
>>>> The pre-emption disable in upstream is not a valid solution for 
>>>> compute customers. It is a worst-of-all-worlds hack for general 
>>>> usage. As noted already, any actual compute specific customer is 
>>>> advised to disable all forms of reset and do their hang detection 
>>>> manually. A slightly less worse hack for customers that are not 
>>>> actually running long compute workloads (i.e. the vast majority of 
>>>> end users) is to just use a long pre-emption timeout.
>>>
>>> If disabled preemption timeout is worst of all words and compute 
>>> needs to disable heartbeat as well then why did we put it in? 
>>> Perhaps it was not know at the time it would not be good enough. But 
>>> anyway, do I read you correct that current thinking is it would be 
>>> better to leave it at default 640ms?
>> No. We cannot have the RCS default to 640ms.
>>
>> Note that there is a difference between 'general end user who might 
>> run some compute' and 'compute focused customer'. The driver defaults 
>> (disabled or 7500ms) are for the general user who gets the 
>> out-of-the-box experience and expects to be able to run 'normal' 
>> workloads without hitting problems. I.e. they expect hung tasks to 
>> get reset in a timely manner and while they might run some AI or 
>> other compute workloads, they are not a HPC datacenter. Whereas the 
>> compute datacenter customer expects their workloads to run for 
>> arbitrarily long times (minutes, hours, maybe even days) without 
>> being arbitrarily killed. Those customers will be explicitly 
>> configuring their datacenter server for that scenario and thus don't 
>> care what the defaults are.
>
> Okay maybe I misunderstood what you were saying earlier about worst of 
> all worlds and all. But tell me this, if preemption timeout on RCS is 
> not directly related to hearbeats, but to some pessimistic expected 
> user workloads, what is wrong with my scheme of calculating the next 
> heartbeat pulse as tH + tP?
>
> We can leave tH as default 2.5s and tP you set for RCS to 12s if that 
> is what you say is required. Or whatever long value really.
>
> Your only objection is that ends up with too long total time before 
> reset? Or something else as well?
An unnecessarily long total heartbeat timeout is the main objection. 
(2.5 + 12) * 5 = 72.5 seconds. That is a massive change from the current 
12.5s.

If we are happy with that huge increase then fine. But I'm pretty sure 
you are going to get a lot more bug reports about hung systems not 
recovering. 10-20s is just about long enough for someone to wait before 
leaning on the power button of their machine. Over a minute is not. That 
kind of delay is going to cause support issues.

>
> It's long but it is correct in a way. Because we can't expect hearbeat 
> to react quicker than the interval + preempt timeout (or timeslice for 
> equal priority) + some scheduling latency.
>
> I conceptually disagree with the last hearbeat pulse being special. If 
> the user concept is "after N heartbeats you are out" and you want to 
> make it "after N-1 heartbeats plus 2 preemption periods you are out", 
> where preemption period actually depends on heartbeat period, then 
> that sounds really convoluted to me.
>
> And we don't know which of the pulses will trigger preemption since 
> user priority we don't control. So low priority compute task gets 
> reset after 5s, normal priority gets to run for 12s. Effectively 
> making context priority a variable in hangcheck.
It already is. That is no different. The pre-emption is not triggered 
until the pulse is of equal or higher priority than the busy task. That 
is the case no matter whether you are running GuC or execlist, whether 
you have the original driver or an updated one.

And it doesn't matter which pulse triggers the pre-emption. All that 
matters is that once a pre-emption is attempted, if the busy context 
fails to relinquish the hardware within the pre-emption timeout limit 
then it will be forcibly evicted.


>
>>>
>>> If so, if we went with my proposal, would everyone be happy? If yes, 
>>> isn't it a simpler scheme? No special casing when setting the 
>>> preempt timeout, no special casing of the last heartbeat pulse. 
>>> Works predictably regardless of the priority of the hypothetical 
>>> non-preemptible workload.
>> No, we have to have the increased pre-emption timeout. And that has 
>> ripple effects of making very long heartbeats or risking races with 
>> the heartbeat beating the per engine reset.
>>
>>
>>>
>>>>>> advise compute customers to do. It is then up to the user 
>>>>>> themselves to spot a hang and to manually kill (Ctrl+C, kill ###, 
>>>>>> etc.) their task. Killing the CPU task will automatically clear 
>>>>>> up any GPU resources allocated to that task (excepting context 
>>>>>> persistence, which is a) broken and b) something we also tell 
>>>>>> compute customers to disable).
>>>>>
>>>>> What is broken with context persistence? I noticed one patch 
>>>>> claiming to be fixing something in that area which looked suspect. 
>>>>> Has it been established no userspace relies on it?
>>>> One major issue is that it has hooks into the execlist scheduler 
>>>> backend. I forget the exact details right now. The implementation 
>>>> as a whole is incredibly complex and convoluted :(. But there's 
>>>> stuff about what happens when you disable the heartbeat after 
>>>> having closed a persistence context's handle (and thus made it 
>>>> persisting). There's also things like it sends a super high 
>>>> priority heartbeat pulse at the point of becoming persisting. That 
>>>> plays havoc for platforms with dependent engines and/or compute 
>>>> workloads. A context becomes persisting on RCS and results in your 
>>>> unrealted CCS work being reset. It's a mess.
>>>>
>>>> The comment from Daniel Vetter is that persistence should have no 
>>>> connection to the heartbeat at all. All of that dynamic behaviour 
>>>> and complexity should just be removed.
>>>
>>> Dependent engines is definitely a topic on it's own, outside 
>>> hearbeats, persistence and all.
>> Except that it has implications for persistence which the current 
>> driver does not take into account.
>
> Well current driver does not take RCS+CCS dependency into account so 
> that should come first, or all in one package at least.
Not sure what you are arguing for here? Simplifying persistence as 
described will fix all the problems in one easy go. There is no point in 
adding yet more hideously complex code to make one corner case work when 
the real fix is to rip it all out.

>
>>> Otherwise there is definitely complexity in the execlists backend 
>>> but I am not sure if logic persistence and heartbeats are so very 
>>> connected. It does send a pulse when heartbeat interval is changed, 
>>> which if going to zero, it will kick of closed contexts if it can:
>>>
>>> static struct intel_engine_cs *
>>> __execlists_schedule_in(struct i915_request *rq)
>>> {
>>>     struct intel_engine_cs * const engine = rq->engine;
>>>     struct intel_context * const ce = rq->context;
>>>
>>>     intel_context_get(ce);
>>>
>>>     if (unlikely(intel_context_is_closed(ce) &&
>>>              !intel_engine_has_heartbeat(engine)))
>>>         intel_context_set_banned(ce);
>>>
>>>     if (unlikely(intel_context_is_banned(ce) || bad_request(rq)))
>>>         reset_active(rq, engine);
>>>
>>> Is this what you mean? The point of this is to make sure persistent 
>>> context does not hog the engine forever if hangcheck has been disabled.
>>>
>>> Reminds me of my improvement to customer experience which never got 
>>> in 
>>> (https://patchwork.freedesktop.org/patch/451491/?series=93420&rev=2). 
>>> Point of that one was to avoid engine reset (or worse) after user 
>>> presses "Ctrl-C" if something takes just over 1ms to cleanly complete.
>> The plan is that the persistent contexts would still get the default 
>> grace period (pre-emption timeout at least) to finish but Ctrl+C will 
>> kill it within a timely manner if it does not finish.
>
> Yes my patch does that. ;) Currently non-persistent is killed to 
> quickly triggering pointless and alarming engine resets. Users 
> reported this last year and I tried to fix it.
Except that your patch is adding yet more complexity to an already 
complex feature. The desire is to simplify the driver and make it more 
maintainable not complicated it further.

>
>>>> Persistence itself can stay. There are valid UMD use cases. It is 
>>>> just massively over complicated and doesn't work in all corner 
>>>> cases when not using execlist submission or on newer platforms. The 
>>>> simplification that is planned is to allow contexts to persist 
>>>> until the associated DRM master handle is closed. At that point, 
>>>> all contexts associated with that DRM handle are killed. That is 
>>>> what AMD and others apparently implement.
>>>
>>> Okay, that goes against one recent IGT patch which appeared to work 
>>> around something by moving the position of _context_ close.
>> No it does not. The context close is not the trigger. The trigger is 
>
> Well patch says:
> """
> The spin all test relied on context persistence unecessarily by trying
> to destroy contexts while keeping spinners active.
> The current implementation of context persistence in i915 can cause
> failures with GuC enabled, and persistence is not needed for this test.
>
> Moving intel_ctx_destroy after igt_spin_end.
> """
>
> Implying moving context close to after spin end fixes things for GuC, 
> not fd close.
That's because persistence is currently a big pile of poo and does not 
work in all the corner cases. The correct solution is to leave the IGT 
alone and just fix the implementation of persistence. However, the IGT 
update to not use the broken feature is a trivial test change (two 
lines?) whereas fixing the broken feature is a significant KMD re-work. 
It needs to be done but no-one currently has the time to do it. But 
trivially changing the test allows the test to work and test the 
features it is meant to be testing (which is not persistence).

John.

>
> Regards,
>
> Tvrtko
>
>> closing the top level DRM handle. If your context has persistence 
>> enabled (the default) then closing the context handle will have no 
>> effect. No pulse, no pre-emption, no kill, nothing. But when the top 
>> level handle is closed (application exit through whatever mechanism) 
>> then all GPU resources will be cleaned up. As above, with at least a 
>> pre-emption timeout grace period, but after that it is termination time.
>>
>> The media use cases for persistence are all happy with this scheme. I 
>> don't actually recall if we got a reply back from the OGL people. 
>> They were definitely on the email thread/Jira task and did not 
>> complain. OCL obviously don't care as their first action is to 
>> explicitly disable persistence.
>>
>> John.
>>
>>>
>>> Regards,
>>>
>>> Tvrtko
>>

