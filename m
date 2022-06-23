Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DEB557879
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 13:11:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A2BE10E42D;
	Thu, 23 Jun 2022 11:11:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2077.outbound.protection.outlook.com [40.107.244.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B13F10E42D
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 11:11:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FB45glYhqnmxg7bzoiVl8GTrcENo6VLlFoDKqGhgaMJGDQqoBHXjoXHtf3AXqIulgIUem+3UGjaYii6WpjAmjCvFQax9D761JiMa87nKlZn6NXGcMbTA6a8wCheHcwmcPytj5Nnd2GkiWYzOaXG7YGlVO/iGkh1Hk8f2nObR/AacsAXofljVxrnlK47pq8ONctVbTnvW1mgluDwoUfig71B+hoTiNzflaFvTqqlf41mZm6iWgMivznpAtREQlvTh0jbm+ADeGkJhjot9C0dbHoXnkpaKc/m5xQTwYg/aEE4FNwnwX/0GmhqvI1gUNYwOo9eQ6ANCfB8dFO1R88D+sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iZmPe9T8HYP/sRmJXJqUnt4rxmom/RAuzEcGG4HMJGY=;
 b=NVJl44R74PxHEX6CDA9u2PScl1jUGFIo83V8cmmz90Bmc+BpO8NQumqrlR5AouEw2vBEyIILVeCl2C+Xeqiv0eVj5JJuRi09PllMrfUk9Ihd6qLFYXneJQxYEzzeRCpBK6AMv4hjIyS3zQBQU7pWZWcsCYAU0b0mo3pEAMzCjjaZtCWKl3mLK1a2KJCQ7B5G5t/4H9LWyjZldMsJ2VnqNgoyVuCszF2jNpBIGHOqsr1mMfbPMT+rsRDzC4o6G6lZynqGOYpqQa3S7GMkvagVaDN7ykfStGSVx+zgRE6j0vUW8s1UvPWvDWDxE93N0a9TZsJkGN7ms98AslQEz5BSgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iZmPe9T8HYP/sRmJXJqUnt4rxmom/RAuzEcGG4HMJGY=;
 b=0XtsdkipG1fZWfK0k8kLsuUbDfANS27U8P3giV4+vzUT0IjUapB+OSEHheOSsjL7CTOVCO+lPGor9lt9ObVwjxaH4HKES9YZpbTS8W5TG5WHfOPTH15XFoSnqmg7IL0CUnJOkkWweS/pXeXTqnVXL5uKZEcudHrR+Ma6r3pDyOc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB4877.namprd12.prod.outlook.com (2603:10b6:5:1bb::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Thu, 23 Jun
 2022 11:11:04 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e0fd:45cf:c701:2731]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e0fd:45cf:c701:2731%6]) with mapi id 15.20.5373.015; Thu, 23 Jun 2022
 11:11:04 +0000
Message-ID: <6287f5f8-d9af-e03d-a2c8-ea8ddcbdc0d8@amd.com>
Date: Thu, 23 Jun 2022 13:10:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: DMA-buf and uncached system memory
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>, Pekka Paalanen <ppaalanen@gmail.com>
References: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com>
 <YCuPhOT4GhY3RR/6@phenom.ffwll.local>
 <9178e19f5c0e141772b61b759abaa0d176f902b6.camel@ndufresne.ca>
 <CAPj87rPYQNkgVEdHECQcHcYe2nCpgF3RYQKk_=wwhvJSxwHXCg@mail.gmail.com>
 <c6e65ee1-531e-d72c-a6a6-da7149e34f18@amd.com>
 <20220623101326.18beeab3@eldfell>
 <954d0a9b-29ef-52ef-f6ca-22d7e6aa3f4d@amd.com>
 <4b69f9f542d6efde2190b73c87096e87fa24d8ef.camel@pengutronix.de>
 <adc626ec-ff5a-5c06-44ce-09111be450cd@amd.com>
 <fbb228cd78e9bebd7e7921c19e0c4c09d0891f23.camel@pengutronix.de>
 <e691bccc-171d-f674-2817-13a945970f4a@amd.com>
 <95cca943bbfda6af07339fb8d2dc7f4da3aa0280.camel@pengutronix.de>
 <05814ddb-4f3e-99d8-025a-c31db7b2c46b@amd.com>
 <708e27755317a7650ca08ba2e4c14691ac0d6ba2.camel@pengutronix.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <708e27755317a7650ca08ba2e4c14691ac0d6ba2.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR04CA0001.eurprd04.prod.outlook.com
 (2603:10a6:206:1::14) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a482e23b-0270-4bae-2d9a-08da55091066
X-MS-TrafficTypeDiagnostic: DM6PR12MB4877:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB4877CA46FDFD8CD8330826F683B59@DM6PR12MB4877.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZWnYly2+OBpRyqlmsOeF+I2xM1x1hiAmgWCRjv1fu8NGr/upjA4HIMsFRZicSUXDGAm2BC2Vd2HenRjdNktWLiE1gWih7Xjgi+nlfyVlvKYGbwE+Y647U+SDMESQEIb2kEJ7mS607flCV/5DJFVxdRSZWayiFjmh1azbJWFNUL1yibjZDTkkrF4DdA0ulfSJmeEChG6pw/LETnsSg8wVhedF31tpxckjUVGhQAJvK0lHu9nZoqs/+MAP0Nlhubma9wSnjBiNopqawzYUmfP/+SQl7MMqS22hlr7mX6eINEfysLcKEHIF/sHstMR9xa0eDcBhbBAqcidTEPziRShNbEIClMhFlyqVjVcERAgimRHe8TsH7ro1H6GImHX0vFqwmVRWK7OJhrhZ98/34BPpuPVFND13T9OOh2vonOnvZhD/OwWW46ye2HCjBC/mZRaCS/hIIytTpYADOvPbwnP0VVTpgMELsM6s/MnlgtqNreivC7185Jqlu52Uu79gpLroEpNccE49GJfItwCxIt7O7U77i0g+txk6gD3+r4JYsgoQgGArrMYQePc5JUx4fL1YX90vHaRv3wwlvhDgfjECqXD9FH4UqS/fhjB/w8fRe/zSzqUVot4WfveqBV8vUtjwpusS7usQNmK5JvdC42PVvZ1U82pxJmbjaYHcJ8OegywmN9uMuig4Qns1/TkUcca+A6L2Hqjr6I3hYTL3Ke7xC9XfNpSAN3c2dQVVvtk/tsULMPpDAYU0oAqs6r4mW2wepHwyxsdBF1SsVIezTxXmPjDreDIGBTp/4qUdTr/tJdY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(346002)(136003)(366004)(39860400002)(376002)(6486002)(478600001)(6666004)(186003)(6506007)(54906003)(26005)(8936002)(2616005)(31696002)(5660300002)(6512007)(86362001)(66476007)(4326008)(316002)(83380400001)(41300700001)(8676002)(66946007)(66556008)(38100700002)(31686004)(36756003)(2906002)(110136005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enF3SHNpTkVFeEdqeWFYVlZ3YkpjU3paY1BvWWRMblFSWWpzYU9jZlMxemdi?=
 =?utf-8?B?VVFhRm9BdjNlMDhZaWkxdXY2WHZMTTcraG96MUlXZmRFMFJqSU1SVnBSNys0?=
 =?utf-8?B?c1RORGJoVDBibjNZeThJU0lVbUUvcTA4Ui92NWs0R3pHeWNaTm5RZDk0ajR1?=
 =?utf-8?B?YVFhUG80ZGEvMGRzb2VlK3EzcUM1SXh6UzhTdmExTVV6cnNYSS9OTE1jZnV3?=
 =?utf-8?B?OGNic2c4NUx5c0pmd09Id2RqUjhhamZlRGp2d3hNRGVkb3U5d3E0KzBxcDJt?=
 =?utf-8?B?WWN2NktURjFSLy82ekQwRnV3RXdFd0JHWGRvVlBiZURQWlJmYVNsbXRWUHhi?=
 =?utf-8?B?L3NnWllPVXFmcEFjR2FJNkE2WktGQU5RV1E0aXM1ME5Gd3RzcUNyTXQvMUJz?=
 =?utf-8?B?TzNtcVYrb2psaTB2cE8vd2l6a0ZOczZGK3U3T3M4VHJ0T015Y0xlQ0IwWWx2?=
 =?utf-8?B?ZXhmZjBLSlRLKy9Jd0xJM2RDYzdQdHlhQ2h1L3BrTm9sWjdnbm44WFZOWUdC?=
 =?utf-8?B?TFRqelpYUWk1czVuYk1kcjQ3aGFObEVQRFJXU2x0QkRaejZsWlFxMDcwSzZN?=
 =?utf-8?B?UVMvVnNCVEZTT2xwQ05OYzZhZkZzdFV6VTBjazRlMk9YR3NCRkRYSWhISWVx?=
 =?utf-8?B?RjR6NGxrMkxETjU1OGtMTEwrTnlWRXFBRU5GYmRqSzh3QWJUQzVqelJONFpz?=
 =?utf-8?B?aEhYbldNVG41c1ZuTVFWakM2MFlxRmNyS1BERytRWjlldTV2dVFNdXB5TzE2?=
 =?utf-8?B?d0FqMFhWZ01VOHptZUNaQnlXRjIxUXpwaGo5c3BWaWVQeVBlSnVseXVNWm5y?=
 =?utf-8?B?WnMxWlZHTkVhRWZnQXI2MFNqaElqNjZrY3ViekFhUkpUbUNEM09XbERTNTN1?=
 =?utf-8?B?WkVhQ2ExeXZFTmgzRnpTc3hIWXBoUVJuY1BSWmprWkkxZUU3ZGRDZDVrdmFv?=
 =?utf-8?B?MG9NUXp2N2pqMzljdWVXdTc5aFlUR1lrR3dmcnNaUzV5Ri9PY3o3MERYbHpQ?=
 =?utf-8?B?QWljNWhLaEh5eDJmSmtOL1c0TWJ6OXkzaytlbzZLN2lhcXhTbUZjcmkxWmRX?=
 =?utf-8?B?TkZkY1ZwNURlS1IxZHFWRnUxcEo5YklDRFd6NWNicVVYZklZbkF0Qy8rcDl4?=
 =?utf-8?B?azJaZHRFZ1liVG0vU25uRTluU3lVMEtwYld0OTZOOVNpeVhWL1dXZVJHT1c2?=
 =?utf-8?B?MFU5Z3JQcHE3azFXT0k0b0RIUFZ4NnFBNUpFbDNVcWdRa1A2b3FFSXp5anhV?=
 =?utf-8?B?aGFEdmZUbUxWLzNHRkdKbFhtcDJRUVpjSkw2VmswZHhzN2Y5Sk1xWXNIRzRn?=
 =?utf-8?B?WjBNWS9DOVpWUTlNY0lpUEN0dmFrb0ViL2w2RjJBdDh1b2wwZU1zL29iZlNj?=
 =?utf-8?B?bjg1RlRNN1JIcE82VE5NL1BiVzJ2MTZUb3huclJlM1hONmJRdnhmY1RCRStC?=
 =?utf-8?B?VmVMejZ3Ly8wL1lXNTc5dFZzNkRHK09aMjB5S3htbHJ1TFlnSTR6emh0aVh2?=
 =?utf-8?B?QWxvMU5JdnBVa3pwbE5oRnBDMHo1VEZ0NkJnYzlyLzFSWEhVWWZTamVUMHpt?=
 =?utf-8?B?REVHYksyNzhDTnI1ME95YVplbDloOFlObkZKQWRuOGRib24xdWhoSWFwZlRn?=
 =?utf-8?B?Q05lb3NmZm5tYVFQeXd4cTZLTG1sNEJNNkV5OGN2YkJsdHFncDdyWko5V2sz?=
 =?utf-8?B?eURaajZYRWt0dkJJeWdndmk4elZPQkVOM0ZnNm1NOUh0d3d5VGU0My8vd3RZ?=
 =?utf-8?B?elNzQjNzWmhyZS9CMFNNcktFckprQkhnQzY1cmRKWEZib0xNaDBYd0g4OUhw?=
 =?utf-8?B?eXMwNU9aaVk5U3pxczhNOWY2UlFUQkMwNHlmeGYrSXlzbU5jNUdIMllCRjBW?=
 =?utf-8?B?enlvQnp5WGV5elNvK0QyOVRlcHdYZ1lMMDVzMTM5Z2IyNkl5MndjZHEyWTJl?=
 =?utf-8?B?K0tmVmMyY0lRbk01TzRFVFFxcmJuazN0aHZwQytpTm1NNGdvbWRqWmNPeEMw?=
 =?utf-8?B?NERWb1NhWnQ3M1E2MG5hbTdQb3NqMHlEU3pHdmxTWWZ6c0g1Z2J5SjBINVdo?=
 =?utf-8?B?WnBOUlExa1EvVEMzVkU5d3dxQlNuY05PRE1qTlZSNlJFRXhPdk5xMmNrU0U1?=
 =?utf-8?Q?njyMa5CXnnkMy31/5rgX3/z07?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a482e23b-0270-4bae-2d9a-08da55091066
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 11:11:04.6888 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vhMi7gSCjWF3f23AzBSmGTUiP04FF2A3E6L/5L5aC2v4WvIiV8Eayb2II58gOeLo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4877
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
Cc: "Sharma, Shashank" <Shashank.Sharma@amd.com>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>, linaro-mm-sig@lists.linaro.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 23.06.22 um 12:13 schrieb Lucas Stach:
> [SNIP]
>>> On most of the multimedia
>>> targeted ARM SoCs being unable to snoop the cache is the norm, not an
>>> exception.
>>>
>>>> See for example on AMD/Intel hardware most of the engines can perfectly
>>>> deal with cache coherent memory accesses. Only the display engines can't.
>>>>
>>>> So on import time we can't even say if the access can be coherent and
>>>> snoop the CPU cache or not because we don't know how the imported
>>>> DMA-buf will be used later on.
>>>>
>>> So for those mixed use cases, wouldn't it help to have something
>>> similar to the dma_sync in the DMA-buf API, so your scanout usage can
>>> tell the exporter that it's going to do non-snoop access and any dirty
>>> cache lines must be cleaned? Signaling this to the exporter would allow
>>> to skip the cache maintenance if the buffer is in CPU uncached memory,
>>> which again is a default case for the ARM SoC world.
>> Well for the AMD and Intel use cases we at least have the opportunity to
>> signal cache flushing, but I'm not sure if that counts for everybody.
>>
> Sure, all the non-coherent arches have some way to do the cache
> maintenance in some explicit way. Non coherent and no cache maintenance
> instruction would be a recipe for desaster. ;)
>
>> What we would rather do for those use cases is an indicator on the
>> DMA-buf if the underlying backing store is CPU cached or not. The
>> importer can then cleanly reject the use cases where it can't support
>> CPU cache snooping.
>>
>> This then results in the normal fallback paths which we have anyway for
>> those use cases because DMA-buf sharing is not always possible.
>>
> That's a very x86 centric world view you have there. 99% of DMA-buf
> uses on those cheap ARM SoCs is non-snooping. We can not do any
> fallbacks here, as the whole graphics world on those SoCs with their
> different IP cores mixed together depends on DMA-buf sharing working
> efficiently even when the SoC is mostly non coherent.
>
> In fact DMA-buf sharing works fine on most of those SoCs because
> everyone just assumes that all the accelerators don't snoop, so the
> memory shared via DMA-buf is mostly CPU uncached. It only falls apart
> for uses like the UVC cameras, where the shared buffer ends up being
> CPU cached.

Well then the existing DMA-buf framework is not what you want to use for 
this.

> Non-coherent without explicit domain transfer points is just not going
> to work. So why can't we solve the issue for DMA-buf in the same way as
> the DMA API already solved it years ago: by adding the equivalent of
> the dma_sync calls that do cache maintenance when necessary? On x86 (or
> any system where things are mostly coherent) you could still no-op them
> for the common case and only trigger cache cleaning if the importer
> explicitly says that is going to do a non-snooping access.

Because DMA-buf is a framework for buffer sharing between cache coherent 
devices which don't signal transitions.

We intentionally didn't implemented any of the dma_sync_* functions 
because that would break the intended use case.

You can of course use DMA-buf in an incoherent environment, but then you 
can't expect that this works all the time.

This is documented behavior and so far we have bluntly rejected any of 
the complains that it doesn't work on most ARM SoCs and I don't really 
see a way to do this differently.

Regards,
Christian.

>
> Regards,
> Lucas
>

