Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A536E11AB
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 18:05:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B433A10EB8B;
	Thu, 13 Apr 2023 16:04:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 095B110EB70;
 Thu, 13 Apr 2023 16:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681401897; x=1712937897;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=H5hy6R5Lyl0AJpZYyEwwbGw/WcAl0i0O5xfH/30rXyo=;
 b=geo+MzyZ72HEDEputSPIxrc5xeKJrCMHrGk0JeuOB3FgYLbq6WJxLp7W
 6tPo9b0B7NwUDX2alFsGVJFtVFGIl8zWf8AxvBp6QW9CpBAA7W04341I1
 meklYNj1acVeAWXia+Uc9+uhpv9+Be+z2L5v45mFrqY/z3gjzetdD/JhL
 MXZDDKl/1KeJZQsHkL7cbgN9gCID4nA4awQ7+idNx/p8HlTUzRG0Dxbsj
 1qUVAr94www8Z/b29guyS5OnwV3hA71MWWhBizm3N10wmo4PBnwcQiT40
 /mkc6q4QwwpJfi8HoaOGq1q3ARb5bxmBGrsQ+vwIJMIt+kXurggub/BPL g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="323848999"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; d="scan'208";a="323848999"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 09:03:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="666828228"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; d="scan'208";a="666828228"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 13 Apr 2023 09:03:35 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 13 Apr 2023 09:03:34 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 13 Apr 2023 09:03:34 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 13 Apr 2023 09:03:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kKZxAl6KagV/hSpM1t0P/ULyVXLOfpDvIFGjO54Z39694hBae7EERg4yvHB/E79t/8S4fHC42dKxCruDxzU10F4lUHlItpL+GaxDyj7LGZDR456tOLfcCCWlsl0amUmK+s6YbegmuEF4MZsDTVJ2pw+ieeUndBguXKjIOt6SVW6olu6xQUPqa/YU0qzZGYeZOI9VSdFg6R/n8aqXIS3WQjPYJCuFm+FzvCYENM01i3436dAmtGkddsyJyQFEChNaapn5XnMIUewQ3FGX+jlqHWiWSJ3vw/CH6KJ6Hp/xS2iePZ+PGRGM/1bRxvqS3v2Zr/liO8fwvz1Xo5zY2So4zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Az0B4Jsv5tME+2cejOy3YNOqUTjhtvhNVqzxF+OoB10=;
 b=hoaXbMVDiEXhzJZ0mcP0RVBMO2eNMz1TCdxM2cOrBzDs3vGj+8EMAdT3bWGEb4bLWSeRZeNk2JKw2zbguUsRSTrApE9Ikw7eR0lAM55Wx72rRWnzhoGDVIG2+thuZm4XQHVzqXYQ4SyDzDIXk26HhB35qQ7o1bhQ94t/dpjn9ZWVR7tLultkHLMjpNlagi3IwRTQ5QXl4O1US8orXgENiTWWHBalX5qrci7HmZhG5DPzILw75JUnyYTK6pgnwU6dVMXdkxgIDXdgMDoLCybmBmxKzVg9MC/leQKQ6X4gnhG+nEfn/LWQIon2yJ/AXwPjc8dWzIzvNd9f/6dg6aHNAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DS0PR11MB6327.namprd11.prod.outlook.com (2603:10b6:8:d1::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6277.38; Thu, 13 Apr 2023 16:03:32 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4ae6:750e:a237:4eb0]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4ae6:750e:a237:4eb0%7]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 16:03:32 +0000
Message-ID: <8279ae61-f24e-b7f9-464d-86a29562122f@intel.com>
Date: Thu, 13 Apr 2023 09:03:29 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915: Make IRQ reset and postinstall
 multi-gt aware
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>, Andi Shyti
 <andi.shyti@linux.intel.com>
References: <20230413092006.931861-1-andi.shyti@linux.intel.com>
 <dc0042e0-8a4e-5c3d-922f-bd65402a154a@linux.intel.com>
 <ZDgKBUIV9nGcfQqF@ashyti-mobl2.lan>
 <20230413155210.GH4085390@mdroper-desk1.amr.corp.intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230413155210.GH4085390@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0135.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::20) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|DS0PR11MB6327:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cb38523-a046-4d18-2af4-08db3c38a118
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aby2P93lzSWecBje4aazEPHet4ZVp53x341LLOexXy1Qb7tz9l7Ltercnux+vFIrgIUk51zLFP5gZzTIMkayZlQN5Ug35N7WXyX8i6bb8pfqseSAn893DLMnhxsddoa+RZ9tUiXvHiSOoHFAGA3KVxcJ5r6ZWmEtFvhH8nougxuThs3GnocoOmxYW8xXdOz3MEldx5D21OFa/fLJudlgqrjWFXwJAml4XvtnUkRJxLgzW4Aypyf+t/9Hh8xSuJoOdi407wb17Qu/oLps4WSJB1FBlR3drYk8CEogIm5/P01zX6Wd90nN6L/EJx1w9HhmB0PL0ktf5P1gSC2wpHj0J02fv/TU0I59Oq0qIuD0WWlbke+Tw2i+grgV7DJjEmQjwzQCnm8YeXh7uDwHPKPJjrc2KSFa+PgpT/LX1g4Tk4Pa6lZ/SZ3+rhA43ymH5rCXrG1P/moTWhI1X2IhZCNXu6y0jfIxakNqiWmjSpzK06rvh8kDqspXFPL3fZYjQ3jMmx348DlHbApOBwEh9KeQ3PFR5mM6alAE7FDmTawfYO6WTa0MxPjwBn/W9E8t2ckCE5a3Ft2h50zvmNYP3fxQcTtpg6WQ2zG275MFu4yg1dsYX7qo3AHQUhWf+nJlRqiwexOVu4rRnQ7FrW3CulWwKw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(376002)(136003)(396003)(346002)(366004)(451199021)(53546011)(66556008)(86362001)(66946007)(6506007)(66476007)(110136005)(316002)(6512007)(26005)(4326008)(6666004)(36756003)(6486002)(54906003)(41300700001)(478600001)(8936002)(186003)(2616005)(8676002)(38100700002)(5660300002)(31686004)(2906002)(83380400001)(31696002)(82960400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RkI2Q0Zhdkt4RnVxajg2QjZodW9VdHhiUWR1RjRzYStuNWZvY0pZanpXUkFs?=
 =?utf-8?B?dW56Z2drckxWeVE5dkZKTGNRbmUrRkJSdk41RWhrbkF6aHFGcW5pQm5MWmMv?=
 =?utf-8?B?Ui9zYm1VV3I2bTNRQzBVN2x4YUg0ZGZMb0s3U0piT2lwTkNNUERDalFvOCtm?=
 =?utf-8?B?Z29UTURxV0JuQjBpaHZlNDQrbHQwZWFydG9mUjdQcVJtUE1STHppQWpsZW5S?=
 =?utf-8?B?WXVFM0ladXV1d3c5cEg3T2swbkkwcEtoK2M2TnRkZVRkQWtNYUhwM1gzcnNm?=
 =?utf-8?B?QVh1TW4ySHpPc3NSSGRCOEtNdVVBUUZUVVZ3OE9qejJ1NlFScEtUU2VNSmZx?=
 =?utf-8?B?SXdpTGdZS1dFL1FXU0ttT0xXWVZIbk5XeHc2R2Zza3I1MmxkaU5vdUNrUEk1?=
 =?utf-8?B?aS9lZDRQZG45U3VpdEhZUHU4RHkrTUJ5MDNmSDhxUVJFZnMwb1VXa0pHd2Zq?=
 =?utf-8?B?Wk9HQUlkLzRsMENzbnI2K3pBb0lNbGxGUzNoWlZLZm0vbndmblZrdDZObnpk?=
 =?utf-8?B?aVdpcG5Zb0RET1VuT0VoK281MnlmN3VPa3I5YkxPcHArVVI0RFhRR3hXemJw?=
 =?utf-8?B?aktUbFJvU253aHZjNUhkcUlqOEk0OVgzazZkRnJiSnIyV0pBODZrRXkwKy9M?=
 =?utf-8?B?TFM4M0ZlTTEzMEZoT09DK3M3YW43L2M4YWF1allTa3gzcGlwdzdUWGhDOW9O?=
 =?utf-8?B?dFFtaDUyR2hxak1WVXBzNGMxc2xmVjdyNUhBU05EWEwwTzlCY3czekVDc3Rs?=
 =?utf-8?B?QU9xazVMV1M4YmVkYlh1NWRSRjhRSmhJK0xORG5IWC9BN3ZZTjlkOCtRSEFR?=
 =?utf-8?B?VktBZ2ZFYUdUVHhQdXdDZnYrODcybW84eU5oT0FXQmI1RGlJMVZmM0REalFo?=
 =?utf-8?B?TFhyRlBNSlF3OHh6ak9WYUJ5dmpjM2pRRmdtTDBzVkcwVmdLb3dtNkF1ak5n?=
 =?utf-8?B?blErQW05WSszTnZ1ejVoUzkvbHpYOWZZSk9ZNnZmYVZ3ckJTNWh0dWVSN3pz?=
 =?utf-8?B?SW1hOVR2VzM2OVNBQnQ0akg0bWI3bCsrTVcxTjdLZUw5Zm5xTHRteUd0NUJ0?=
 =?utf-8?B?NWo0cm9QZlZ5dmcrdkNNZ0FWeXZCYk1HVVJKelJoRmM2cE1QTnlsVVR1ZEJI?=
 =?utf-8?B?VWtPZkdkdHNlR05TbFByTnRLQ3FuSVE2ZGV1enJDUlhxalBvOGNkM1FYNzQ5?=
 =?utf-8?B?M0w4SUJWWFdjM2cxUGZaNjE1UElsVGRkK2xDRkdLWm1XdGEzVk5hMURlbWo3?=
 =?utf-8?B?eUpYbTI0dkpmeHZUZFArbE1EVXR0c2syb3ZZNDljU0Z4ZWw2NGRtT2IwSUdo?=
 =?utf-8?B?NjdTaWo2cFUyWmY0d1pmZmJLRy9WbkFvYXMrYjlUU2xzVzVKN0F5UE5wN09R?=
 =?utf-8?B?MEdBS0dpdDVJZHFrNGJlb1N4b21BOTU3YnJSeVV2VWsxc1RPQjR2NHJCY2tq?=
 =?utf-8?B?M3JQUVVPMTdvRG1GVWlyRDlrM1R0VW1ITjBXem9SUlhQU3pJc1dRQWVzdDI0?=
 =?utf-8?B?K0VtbTZES2NjRlAvalBuZnovSTdaM0I4MEovWWZvU2FFVUpWN0FFNW5oTHM0?=
 =?utf-8?B?di8vdEs2K2hKNkZja2JVWU9seEZCa3FtdmNSVGtzMWVyT2RsZUllOFZ5YlVN?=
 =?utf-8?B?RXdmUFBldGJ0eDJVQytDT0ZlSE1BOFA3bkk2MHNvTE5nK1V2Zys1UEVMU0hT?=
 =?utf-8?B?cmtINUFXcGpTMUtkblltNGRsUnFyYUJESHh6ay84L3dDV2M2RXZNWjdBZXg5?=
 =?utf-8?B?ZWpUMW5Ka3UxSzZlOWxHVGEzT2dJUjhUT2NqRzBwcDlhbFd5dHg3MG1xWURX?=
 =?utf-8?B?SkcrUXAzOHdQdy93WmFQMUFhUkJzZWVLQ0FndHpkSzlWcW81YjBJMUh4OW16?=
 =?utf-8?B?QlVSbVRPQzE2WlRETDFldDZYM2YyVUQxU0RPZnB6MzZsUE9jd0s4a21kWXph?=
 =?utf-8?B?WDNPZDdXcENaYTVWYlNpMzZLclpBMlZESWl2SDlMa2JHaHBINy9hN1BRQnlG?=
 =?utf-8?B?T0N4KzR0Mnc0OVYrWHljUUQ4Z3l4cTZ1Sml2Q0lvR29RUEhGVDhNT2hWd3Ux?=
 =?utf-8?B?TEt1ZkhGT2NucFZLWDVzcHp6Y2R1Nm9oQ29oL0p5bVNaSHlVUHZNalRVSXNG?=
 =?utf-8?B?MmhMR254S3ptMlR2WXZhVXlBb0RFZEw5NmRZa0N3WFQ2NmxKMHlaMFE2UkNY?=
 =?utf-8?B?OEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cb38523-a046-4d18-2af4-08db3c38a118
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 16:03:32.3485 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KqN2YJ4l9qW5AIDpz1UfZ8N8RIWuG+6NLL2SJl1yLDpAhBJOCvJyqP6sYncFOyR5LXl8fP7qB/yQVJ83YrPnUT6MNHzxwaRoDnHDBQdK9sc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6327
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Paulo
 Zanoni <paulo.r.zanoni@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@kernel.org>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/13/2023 8:52 AM, Matt Roper wrote:
> On Thu, Apr 13, 2023 at 03:56:21PM +0200, Andi Shyti wrote:
>> Hi Tvrtko,
>>
>> (I forgot to CC Daniele)
>>
>> On Thu, Apr 13, 2023 at 11:41:28AM +0100, Tvrtko Ursulin wrote:
>>> On 13/04/2023 10:20, Andi Shyti wrote:
>>>> From: Paulo Zanoni <paulo.r.zanoni@intel.com>
>>>>
>>>> In multitile systems IRQ need to be reset and enabled per GT.
>>>>
>>>> Although in MTL the GUnit misc interrupts register set are
>>>> available only in GT-0, we need to loop through all the GT's
>>>> in order to initialize the media engine which lies on a different
>>>> GT.
>>>>
>>>> Signed-off-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
>>>> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>>>> ---
>>>> Hi,
>>>>
>>>> proposing again this patch, apparently GuC needs this patch to
>>>> initialize the media GT.
>>> What is the resolution for Matt's concern that this is wrong for MTL?
>> There are two explanations, one easy and one less easy.
>>
>> The easy one: without this patch i915 doesn't boot on MTL!(*)
>>
>> The second explanation is that in MTL the media engine has it's
>> own set of misc irq's registers and those are on a different GT
>> (Daniele pointed this out).
> Assuming you're talking about MTL_GUC_MGUC_INTR_MASK, that's not true;
> it's just a single sgunit register (0x1900e8) that has different
> bitfields for the primary GuC and the media GuC.  So I still think we
> should avoid looping over GTs; it's actually much simpler to handle
> things in a single pass since we can just determine the single register
> value once (all fields) and write it directly, instead of doing two
> separate RMW updates to the same register to try to avoid clobbering
> the other GuC's settings.
>
> For pre-MTL platforms, it's the same register, except that the bitfield
> now devoted to the media GuC was previously used for something else
> (scatter/gather).

It's not just the GuC, the VCS/VECS engine programming is also tied to 
the media GT (via the HAS_ENGINE checks). It looks like we 
unconditionally program VCS 0 and 2, so it'll still work for MTL, but if 
we get a device with more VCS engines it'll break. Maybe we can add a 
MTL version of the function that just programs everything 
unconditionally? Going forward it should be ok to program things for 
engines that don't exist, but I'm not sure we can do that for older 
platforms that came before the extra engines were ever defined in HW.

Daniele

>
>
> Matt
>
>> I sent this patch not to bypass any review, but to restart the
>> discussion as this patch was just dropped.
>>
>> Thanks,
>> Andi
>>
>>
>> (*)
>> [drm] *ERROR* GT1: GUC: CT: No response for request 0x550a (fence 7)
>> [drm] *ERROR* GT1: GUC: CT: Sending action 0x550a failed (-ETIMEDOUT) status=0X0
>> [drm] *ERROR* GT1: GUC: Failed to enable usage stats: -ETIMEDOUT
>> [drm] *ERROR* GT1: GuC initialization failed -ETIMEDOUT
>> [drm] *ERROR* GT1: Enabling uc failed (-5)
>> [drm] *ERROR* GT1: Failed to initialize GPU, declaring it wedged!

