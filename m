Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1760F4B32CC
	for <lists+dri-devel@lfdr.de>; Sat, 12 Feb 2022 04:04:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 487F710E1EF;
	Sat, 12 Feb 2022 03:04:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2076.outbound.protection.outlook.com [40.107.92.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D79410E1EF;
 Sat, 12 Feb 2022 03:04:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VjI5GZggSTyIOfNc1SkNZhsXvChXiX09l+ssXEX+Z8aKZRmZ7gPP6Ppklo29vAn7bzI9DlkSDCWoY9wJKeBxgkA+UuYaWZn1wM/ulqIbHqHZw9AWBWCzRiC0J2hw/BHyKUsJOOZ3J/Fkje4c4Ei2Qrk9F4CSTYIRsHb5X2uqcOms3mY0g4bHOflXxfOfUQGMbFNuwJqV/7yTvllE5Rahfws0rtkBciHcru6kgKSVlzQAbEoNtYQI1NMnc0hFi8u0HktoOJ/cEr/gCzr+aIyEL3TwxSD9g1NT2HoC3uyj5hydlVz5naWvhAst+Ehv3eF50b3n1ugI2dXUhJBe0MDNUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r2fs60AJhChM/IVMw9KKj+fx7wtc0f0LV9wEAMnfnPY=;
 b=Tm9eR04kSpqtlnt9jEJVZZgh0qdpn5TA3QZxB9hGiRKPW9DusaucIDeYYhXmfsCNlZoJbm+cLP8tgugKmQBFkYclZ9FlSVDF4GTQZ+D5hS2EKpL12Vzujo6e2JmYU6o3Z/x3yAA4dsgAolj6v9JdGfd4ejdCdA1s4f/Lw4acCI1MEOdeWQU3kmKQApBmvT9gIOiyixRJyizzyWuQez54IdMW6t5oHekjF4/7ikPvFNB/wNE7lqtgUChPOqA97eC8cIRUe+8IP7Y6Rpai7G2SQqIC/W0b1NZPbTEk1eIP+pjN+/ASk7SwdpRF75MghandaA8vYBvzihcv5muIzhsDCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r2fs60AJhChM/IVMw9KKj+fx7wtc0f0LV9wEAMnfnPY=;
 b=e7lnL8m1WjE1FTBAxUpc7RJs4/vYZ3mNYWWwn7aTeN8E7HQKI+0f4TYqSyEGWiyl67Lkxy4jpLGHTh+89CiMM/D1m8ghA7wDlSj7L8GIyz/uUcjVV1mPGkEcTzga6/RhfBYubCGtKYA1TV6HH2JGnef9k3WjsXCinxSjAbew7zTLgcRa6ukV6cEWrxZ8y8JU8LUYkA7dI6KUkaPFOD1XpGLQfK7nYe5SDheGWFNEH7W893sa2NYptAseLPdYIFRkKaG9xoGCYeYV2KbPXz8nvV+Ajaa6fVDuA66vxH3HVaO5ma6bHG6WUF5oAiyd8rhD7pRwNLWrxhpLknpqGjb+bw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4130.namprd12.prod.outlook.com (2603:10b6:a03:20b::16)
 by DM6PR12MB3737.namprd12.prod.outlook.com (2603:10b6:5:1c5::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.14; Sat, 12 Feb
 2022 03:04:20 +0000
Received: from BY5PR12MB4130.namprd12.prod.outlook.com
 ([fe80::498:6469:148a:49c7]) by BY5PR12MB4130.namprd12.prod.outlook.com
 ([fe80::498:6469:148a:49c7%5]) with mapi id 15.20.4975.014; Sat, 12 Feb 2022
 03:04:20 +0000
Message-ID: <0c7b50d3-9bca-9462-05ca-b4ef846cc49a@nvidia.com>
Date: Fri, 11 Feb 2022 19:04:18 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 2/3] mm/gup.c: Migrate device coherent pages when
 pinning instead of failing
Content-Language: en-US
To: Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org
References: <cover.0d3c846b1c6c294e055ff7ebe221fab9964c1436.1644207242.git-series.apopple@nvidia.com>
 <dd9960b327ca49a9103d9f97868ea7b0b81186c4.1644207242.git-series.apopple@nvidia.com>
 <4b6b472d-07b6-0c96-22ed-9a77a878cf61@nvidia.com>
 <2315725.OX4gP1S1Nc@nvdebian>
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <2315725.OX4gP1S1Nc@nvdebian>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0037.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::12) To BY5PR12MB4130.namprd12.prod.outlook.com
 (2603:10b6:a03:20b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2b77376-650a-4304-4525-08d9edd45d46
X-MS-TrafficTypeDiagnostic: DM6PR12MB3737:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB3737042ECE0E4F7D326325CAA8319@DM6PR12MB3737.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sCB3/PSqSvIQUg6vBO4i8QYUsdhiI2suEUKOnyQn+QhOEDXY+lVqyyZka0JBGDCxqB+Tbe/jJbZbc+ej2WxvXErVXk80Aiqe6Unn0n4Tb1c7PgfCLX8Ihh0G6uTvg8JeH0lImdbaq5bFmYyClAdfns89XcUbhKqtYsMhBKbvxfEmy11gCceTTimDyo/rW3BTg51pfbWgzyjks9Qbbejmr/HU/1jWtaqdybcbvmrpmyRWXvM5SiItXiTp2XmEAF8IWwfX0rAbTLwVczwN8VW/G8v2sZ5imVc0tgIp5KMufgdo7yArcQRYD11WewhjJIzENZ5P8HYIEBZ2LlslueJZT+6G5v/+8Z6f3JxVJPpqB2IlfEGNdsUj8NdBm1CyOdx1S6ZNuMTCbo+5ylTk4o+t8rJ+D2UPVo+IJymjgQwNH+F0j3/E5zenszwid+a+8OENtvy/NKyzl5ITQIKt2N8CWeu9+3K7RFjXpFaS9E28zDLL69rVpSynsNVCgt1nb/+xFZdqwBBshX3ztdChqIGXDFGDI9zhUaAQNfCIeNwHg1869xTbXfkz5TotWFjk9iZFbt7J2dI6raFD0ZVJf+8QKnqbXSp4cza+0dK9SAj44lRJEwuFioiVwIZ8PGe0tstZ4Hoy1rYgGLYx9l34VRsXsq/Ki2tbWY9C+DY6dj6l3V3GJFOIShaMnvlw4mm+6zUgDVll0Zo5d+msyU4vxyVJnMdjou0Lux3dnOolR/P8xK4UrsCTy41oC50AaRbttG+P
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4130.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(186003)(6512007)(6506007)(53546011)(508600001)(6486002)(86362001)(26005)(66946007)(2906002)(83380400001)(31686004)(4326008)(7416002)(38100700002)(66476007)(5660300002)(66556008)(36756003)(8936002)(2616005)(31696002)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWpYZ1FJYXdxQzFydTZ4Vk4xRXF3M0VKMUpzSVhoL1R5WFZVSkFoa1Ria2xK?=
 =?utf-8?B?cmhkYlZGUHdYWkRIQjdPNXQ0T0krZVZyekRnRTJEQmthQi9hV2RZSTl6aWxp?=
 =?utf-8?B?clN3eXlsdVpYeElsVjZXUitlenR1UHdnaVFXUmxaWDBNMDNFM1BOQ0RzZGRZ?=
 =?utf-8?B?NThvckVqRzNOZFhKYVljbEc1S1pZTytkaWg5OGt2R1d6TStWYmYzdVJ0L3VL?=
 =?utf-8?B?aWdaT2JYWGt0NW9VRFdWeGJZNkcyRGNUNGR6UVdaVjRKNFR1VFpHSCtPLzlm?=
 =?utf-8?B?KytxQXBFQ3BrRjZNd0YvYk1DSEFRNXRCRE5Nd1QwVVRFK0VlUUt1TEZsb0xL?=
 =?utf-8?B?Z1g1ZHdXWGZkVUl6YTRXOHFldFVXV1BYZFRSOVBENWJGWnhaQTZqZkZWWHIy?=
 =?utf-8?B?cDRjWnVWNnhiZkZsaEVTYXF0R01vRkc0L2h6c0FOWGJIYXdjZTgzVi9ENmJP?=
 =?utf-8?B?cXU1WEUrMTdFTWxFMGNGQkV4YVc1TzM3ZWpuUTRrNXlCM1YzUE5UUUR6NWpR?=
 =?utf-8?B?ZHBXUktqeStoSkkvVzZ1WERZVlJrMDlWN1AvZXQ1MzhmdDd2dFdybG85SWFk?=
 =?utf-8?B?WElQNjNaWEFuTk1yTGRUWnpENXowSmRsYm1TTnE5WDR6VkpKWXlWSFFQR3Rz?=
 =?utf-8?B?c3BLQ2hmSkh4dHdGNXpkaS9DWU9wUllyRnQvYjltaTl6azJoRlJxdDhkZnp2?=
 =?utf-8?B?QmxvbjVCcVpWbjR2b0ZaOWFHWGFHYldXRDJkNlVYT2pGSjZhSCttWiswZXJm?=
 =?utf-8?B?bGZjZnZXVWVTcjVMMi9XOERjaWhYRkxsbmxrbGVrSENneGNLT0c0VmxQelNE?=
 =?utf-8?B?RjlFK2FGZTU3aHlNR1ZERTZ4cWxmQVAvcDNUNnY5amZ3cldHVi9UR1BQVlFp?=
 =?utf-8?B?aTZodkh5ZmEyRmdhV0NRMURrc3BBZkpzVnh6UXBVSEQ3VHlZYlNEVXRsZTZR?=
 =?utf-8?B?aE9xbHY1clZRc1NDUEJjMEFnNmpjWTk4Mm5ZRCsrV2RoUXYwQU0rUUVzVEF6?=
 =?utf-8?B?NmhNa2lwd0RLTitNWU1NWWhoVXgxa2FGTG9xMUFrNVEvYUhDdU93K2RWN1lx?=
 =?utf-8?B?UkkvZkJ4WURqbHNEcWNpaStBNUkrUFZqMWpQQzdVbURCTzVJR2FOeGJSd3BE?=
 =?utf-8?B?TFVRY0tJczVIbXlSVUd0YWFKMFVoWnVaRmJ3UUVDNkhqcFNXU1NVd0o3aDF5?=
 =?utf-8?B?aVIrTUpMeEhlMW96TFJZMHpqMmRZckhzN3gxbFhzN2tTamQ4SWNQSU9EejJ4?=
 =?utf-8?B?QUtHcG1Nd2tsT0k3UzdyUGR3MmQ5bTdKcEpoRG5OTXNvS1NOWmltVzl2bHY2?=
 =?utf-8?B?cVVjZ1M1ai9WT25hWTdYRHFLNUFRazRycVorNTJZa2huZmFJRGdBNDROVXlo?=
 =?utf-8?B?V0JCZ2VmWElmSnVPQjRiUkRSbUdoVjBKTFhnMlZjOE5zd1R5MFMrTHQ2OTAx?=
 =?utf-8?B?cUNKNjRnL1JkSnFQMXFRRlYvbXE2WGZzZFYyM3FBVlU1bFhUWDQ0VDVjREU5?=
 =?utf-8?B?ZDA5VXlMUlZzR3NiVjYwUVFVL3ZZbk80eW9vVXdjeXFCM0oyNFV3ZUFFa2Jk?=
 =?utf-8?B?MnVUUnB0elFrNDNYUTduZkhEU2hNeFZsdFl1VDh1TUkxVkZGZGt3bWRvZEwz?=
 =?utf-8?B?MVV1ZENZbEtSeTBQMWUxNmo1OGZJMUI1UzNSaWZlS3g2OVI5YitlcDJ0TTFY?=
 =?utf-8?B?Yy85OVZVZHNvazg4TEVlMEpVdVdQUXI5NThVU3RMZ2lZbW83bjJDc2pTazU5?=
 =?utf-8?B?SFlHWmJMN2lvRCt1ckFnMllTa3JDMzdzcGc3M1JleWVVNnBJRVR2T0UrY1RN?=
 =?utf-8?B?QnY2ejE1Z2lyMGRPYWpiVEdvM2dYNDJaQmRSWU1tQ0pVY1VpVGhMS3I5Q1hL?=
 =?utf-8?B?R1E3dWxtWGNsdWNkQ0pPMWJONjRrT3V3OHcyS1c2QjM1WVd6YVJ0YTdsZTAv?=
 =?utf-8?B?T0M5aWtMYW1JV092NzFVUnJRanBHZVpTdnJrSEoyeHgzRmJxSnM3M1d1b0JM?=
 =?utf-8?B?VVFwNkhBT0FUaU1SV3RzdXhGNW1SWmNtM2NySkhET1E4S2E3K2J1TWVmcEJz?=
 =?utf-8?B?SzNtRmo3UThZRUU0Z0JNb21KWjY0WHJwaUhVRGY5MmFNRjFpYVNBbDZqa0Zq?=
 =?utf-8?B?L2FYd2tKTmhVMTRnYlUwK3JtQ1FqSGIreUJrN0lLT1o4a0hyNlk3aXZnUXVM?=
 =?utf-8?Q?GChuqf3qxxCZbVLJ6ki1ovU=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2b77376-650a-4304-4525-08d9edd45d46
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4130.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2022 03:04:20.5258 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8kdpmNOuYWG2v2FERjvMZM3OP5I2Fn3Rljd9ATWmR/bz32F0MJZrWtY9oo0fbiCDc2HJS4hVOAGDvV9l6RC7JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3737
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
Cc: alex.sierra@amd.com, rcampbell@nvidia.com, willy@infradead.org,
 Felix.Kuehling@amd.com, dri-devel@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, jglisse@redhat.com, amd-gfx@lists.freedesktop.org,
 jgg@nvidia.com, linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/11/22 18:51, Alistair Popple wrote:
...
>>> @@ -1888,15 +1942,40 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
>>>    			continue;
>>>    		prev_head = head;
>>>    		/*
>>> -		 * If we get a movable page, since we are going to be pinning
>>> -		 * these entries, try to move them out if possible.
>>> +		 * Device coherent pages are managed by a driver and should not
>>> +		 * be pinned indefinitely as it prevents the driver moving the
>>> +		 * page. So when trying to pin with FOLL_LONGTERM instead try
>>> +		 * migrating page out of device memory.
>>>    		 */
>>>    		if (is_dev_private_or_coherent_page(head)) {
>>> +			/*
>>> +			 * device private pages will get faulted in during gup
>>> +			 * so it shouldn't be possible to see one here.
>>> +			 */
>>>    			WARN_ON_ONCE(is_device_private_page(head));
>>> -			ret = -EFAULT;
>>> -			goto unpin_pages;
>>> +			WARN_ON_ONCE(PageCompound(head));
>>> +
>>> +			/*
>>> +			 * migration will fail if the page is pinned, so convert
>>> +			 * the pin on the source page to a normal reference.
>>> +			 */
>>> +			if (gup_flags & FOLL_PIN) {
>>> +				get_page(head);
>>> +				unpin_user_page(head);
>>
>> OK...but now gup_flags can no longer be used as a guide for how to
>> release these pages, right? In other words, up until this point,
>> FOLL_PIN meant "call unpin_user_page() in order to release". However,
>> now this page must be released via put_page().
> 
> This is the source page (head). We are unpinning it because we can't migrate a
> pinned page, however we still need a reference on it for migrate_vma hence the
> get_page followed by unpin. In the non-FOLL_PIN case we already have a
> reference from gup.
> 
>> See below...
>>
>>> +			}
>>> +
>>> +			pages[i] = migrate_device_page(head, gup_flags);
> 
> migrate_device_page() will return a new page that has been correctly pinned
> with gup_flags by try_grab_page(). Therefore this page can still be released
> with unpin_user_page() or put_page() as appropriate for the given gup_flags.
> 
> The reference we had on the source page (head) always gets dropped in
> migrate_vma_finalize().

OK. Good.

The above would be good to have in a comment, right around here, imho.
Because we have this marvelous mix of references for migration (get_page())
and other, and it's a bit hard to see that it's all correct without a
hint or two.

...
> 
> Which unless I've missed something is still the correct thing to do.
> 
>> This reminds me: out of the many things to monitor, the FOLL_PIN counts
>> in /proc/vmstat are especially helpful, whenever making changes to code
>> that deals with this:
>>
>> 	nr_foll_pin_acquired
>> 	nr_foll_pin_released
>>
>> ...and those should normally be equal to each other when "at rest".
>>

I hope this is/was run, just to be sure?


thanks,
-- 
John Hubbard
NVIDIA
