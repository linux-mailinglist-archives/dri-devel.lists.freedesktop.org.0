Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F60C4D03C8
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 17:15:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E121910E04E;
	Mon,  7 Mar 2022 16:15:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2048.outbound.protection.outlook.com [40.107.93.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FF0410E04E
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 16:15:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ERuxyhokhmblI9duNXjS5rQpm25iP6IKigqqCvRkqIuPwED7fNdBN2YsuAtKuNH2W9i2jFtcBRZr3Pb8C/VDXCfoKlDIciEmRf20Jgxkgffu9vk/lFmujsFE2oyNttU3ugyLgvMvIRq7ks9fA5X+s1Gh0LVXouFkwT0fCKT5ZwS71P4DhBqwNNGnXTjc6nWpmXpY4HLwzTwG3MDI3ybndCCvg9FuYnJuUcEBB8pxaKa/hBjo92595T7O9AXbQecFSO8fR4Vddt9nVu4wvgNlwBrBrVCp48WhjV/mGDLT0+0DMReXHqRMuw9DAQGBJCxxW1Y4PrwnV8AOLavcAZrroA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5KG9+JPIEW5C2uR0dk1Nvts1P13DPVTGF1r+cNJiS14=;
 b=mqQZUA7kAf6IhgmjOosJqfCSwqTMN+FXaYX/jUtPDtO1QTX4EEemSXSEkkmqARlqZ2T4H1sZGOL++8Skv8rgw9FQj0KhlHPqKDeMyOmMag97t2Sc5n66Zo5NbaSKCbFHJpbegkOnMKBQE5VJPPem7l3ZLfPzkesctq7HisMOA3Ka5Mb/ZMuoaRipurYaVkaAG1Hw6AcQ5ND4EtpwVpyQ4lEBZOUwSB8fatQMphXx4mCJEJu/ieGoh5RJkpRnVVn9tGXh9LB8dIQtvlRL6ng7MB34c2ix3KKu6t2FePhgOAMOLWNaxksu72qQjfHC+oGtr0vSCPC1zQjchYSuZOgvEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5KG9+JPIEW5C2uR0dk1Nvts1P13DPVTGF1r+cNJiS14=;
 b=D23cza7X1aZ5C79/Tc2Z0NTNwZTdK8YWqRc8XuWKxcg9eB6RscnhXyPQ6arRJG0HwrepXvlrA6Yd+esYdbKwMKlQBQcyiHtuyWKYDgahhieYSbIuY6pMXmiQhiCS+AIA8K+oU1IHlMXVMhyzEKVvuC2mdJwOUAO1Lg5MVvJiyac=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB4139.namprd12.prod.outlook.com (2603:10b6:5:214::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Mon, 7 Mar
 2022 16:15:05 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e03f:901a:be6c:b581]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e03f:901a:be6c:b581%6]) with mapi id 15.20.5038.027; Mon, 7 Mar 2022
 16:15:05 +0000
Message-ID: <091af126-751a-82fb-9a5c-9a7c4d614c4a@amd.com>
Date: Mon, 7 Mar 2022 17:14:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/selftests: missing error code in
 igt_buddy_alloc_smoke()
Content-Language: en-US
To: Arunpravin <arunpravin.paneerselvam@amd.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, David Airlie <airlied@linux.ie>
References: <20220307125458.GA16710@kili>
 <883bee2e-bca0-e0d1-613d-d744574ffde8@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <883bee2e-bca0-e0d1-613d-d744574ffde8@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0058.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::35) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4919a243-b6b3-4193-a8be-08da0055a3e3
X-MS-TrafficTypeDiagnostic: DM6PR12MB4139:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB4139C1ED8B2B8C1BF023A33D83089@DM6PR12MB4139.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rRuwS63AEsRhdDb3GnZpaWgvdZ/MvqXovM5Vqn6ny+M8fKtY7/vIB9NAqV3gGU6LUeiytql0A+R5JZ082V7ODd2cW4A8blRtqmMt1asNOhSknh5lAS+2R5RXPLs8QlguOflYhnRag7IFl0OYnHsWzOxyI+j5xcHbUMtbnxLbqhv1dgA8HSsd2b4oPx0ktuuWqMdnLmB5OnRx5geb6VWBsvs0K7RrcsXMfAIIWYnmAL+TmAXkUHa/C3bceS/IzNk8uT5Z3nfmULd6oGJOYin4Yq/8StVHwKkgTwq0XOg3jELON8mUW7MKjne4SYQT5UADai+ibTFIJyN0z6hdUS5w/OLgKMhLxWUfNbvzusFa8cmVe63u6qSjEWlKLF6pG9B8k369m4Q8MF2FhYTW2HpxOcPqbw+wu/gmW7Im6WONaEY4bHX0eNzLevHHu8C8HIoOyDxU7Nh3dc3jdRMNhH+3KkZ0nIrPGZ4LKxgXQhMzHDWKSoZP9cmjeXu+hrOlWue6dkTJ+Vx9UndYXrFdlCezG1M217TCaoZEeOeXaoBUUoFe/hg/yJh315pr872v6bhonjSsLXNzPlfJ5VdN2hk1lhTtpCbBYHQVX//OQZ56W2eCZBID/6mF9UvyNJ39G4t2OukNcijn8evFdXr/h58evCoix8vgLhrqwv6p5nR1Mreae/DDlnmduJKcy/aWBxMb7W+uJ7VfVRn4HzFreXwDiFpTBfzr3Op4XDTXL9R50AWPvzWyT7sFrieFxFFzd6pa
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(31686004)(8676002)(4326008)(66946007)(66556008)(66476007)(38100700002)(8936002)(5660300002)(110136005)(54906003)(316002)(36756003)(2906002)(2616005)(186003)(6512007)(53546011)(86362001)(6486002)(31696002)(6666004)(508600001)(83380400001)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L0orOTR4aDh5eGc4UWZzMDFqNkI0UmxCalhnRmM3UUlMOXJlb0kxRzdvUTJ4?=
 =?utf-8?B?NTgvUG1ZckMrMUQ2bURwS0xteWozVXNKdDhVTkVTODRKWXl6cXlLMVFLOVU1?=
 =?utf-8?B?a09UdURGbGhXVXJrRTJnaERmcHNkL1hNUDFVNEZBUnVqWlluZkdxQlZ1bWxL?=
 =?utf-8?B?d0dFTnpla3kyNUNudTE0aUFvT3ZzVGhQWHg0ZCs2bnFOcVpLUXg5SEZnWlRK?=
 =?utf-8?B?Ym1kOUwzOUk3a1RZWkJZUnpHTWdmRUttT0t5MWdYczlickdlVG1JcGJmUE1t?=
 =?utf-8?B?YkI5UWRnaVI3a0xtUWZhbWJEYUJ6VjJnZlAxSFp6OWxtMUJlU0k5STJkZHhn?=
 =?utf-8?B?aXZ1Umw1K0p2VmpRMkk2YVRGTE9naXNoeEh2dFFRSUN4cUQwbHllSmp6ZDZH?=
 =?utf-8?B?TEdWMWdqUFNpeVBuVXdGeE8rSWlLT1RsQXVZeEs5WU1UVG13MkxYVEhyaGNR?=
 =?utf-8?B?YWIxS1BNdFZGMVJNQUsyMy9DRlFOR1VrNzNOWWo2Sk1rN2d2NVc2YXA2MFVL?=
 =?utf-8?B?U0JmWHVoOUtVV2VUSjBWUVhOQXpHRkQrM0xUK05Wc3g0TzB4enVibVYwUVRT?=
 =?utf-8?B?S25uWkRUNFZmREJ2NVhwa0k4V3NrbjhPV0hQdytreXlMMm1HendWeWdrVnRQ?=
 =?utf-8?B?UjB6a1RyWFYxN0F2ZVNaZ3ltaUVMLzBicjFLeUEwZGZjVGFhODNkTk1iNHpw?=
 =?utf-8?B?aExZMUQ5WG81Q1luc2RDZDRXTWtCQ0ZPcEMvOEtlMGFvV2paNkhGajM4aVox?=
 =?utf-8?B?M0hxTVVqKytjNlA0V1FLNTFySkhjODJJZW9uTnA0c2dqWXljWFA1aXMzaEh4?=
 =?utf-8?B?WThWWndwSmRFa04yc2s5UDJSdTQzak1zTkZqU1dWZDB4ZEV3ekFUUFZQejl5?=
 =?utf-8?B?MXNyUTVKWFF5VjZXZmZudndCVDBhZjYveEJrbk93b3UyN1BJWDdJVGtLa3Z2?=
 =?utf-8?B?Z29PVm5uQmRLS1pEUVlLd012VmV3clU1VmEra1RPbGh6RmpEZForR0NPTEJP?=
 =?utf-8?B?b1lXR1NCL3hsT3pJYmczZTU4TnNHOTdyL3BuRnZ1czNXOG4rT2NzNHpFRmJL?=
 =?utf-8?B?RW5yaWh2cUJ5c3NVV256VlZnVENrSUk4dGhsTUFPd2ZLTXk2MmJXeVFkcFd0?=
 =?utf-8?B?MXIybHRmSGhTRDVENWlOWjdZMUgzTCt4a0QydkVUY0U0VVoyQ3M2dTZDS0xX?=
 =?utf-8?B?YVNFRWJXS3hnOENJcHUwSUNkOFlsUWxTb2UxRXhDMTMzUHNOTWc3MWwyY1Iy?=
 =?utf-8?B?b2EybXV6VmZzeG95VmcwcFN3clNYclpramE3WmtlMUpYVmVGbEdyT0luUnRl?=
 =?utf-8?B?R2NxUEtKL296eDBtT3ZFRFB4U081dSt4bVh2L213VUZPbmRXSzBWaWlkNGF4?=
 =?utf-8?B?R21NVVluQlNNekRCNU5Fa1AyMkNyQk5hbmYyR0x5SVBPODhYOFcxS2VNYWYz?=
 =?utf-8?B?QjF2VUpickk5UzJSc0FvQ0F6dTFHRkRyMWxZaW1BT2ZOMDU2Z1Z1MUthUTdw?=
 =?utf-8?B?TWQzVndRZHNKdG1WUGN2V3ZKRDlYaW5vM1l5NVpmN0xOVWQyQThpZzJ1bVRL?=
 =?utf-8?B?d0R4bFhZdGNlTzBEVGsxUWh3cHBhS0RnRGljR2lPVnp5SUdzQmM2bHNQeTFp?=
 =?utf-8?B?azVqbGwyU0RTOUNDOU1TRzZEdVB2M2VFQlNBcFh5NVhwWEZ1clhEWVBWaTNH?=
 =?utf-8?B?UGExUng1ZG5uSG9lTnd2ZlRWN2FiTlVKR2R1U1oxUEttQXhJZmpXMjl5bDBQ?=
 =?utf-8?B?bEtGNGQxY2VxZ0R0a1IxM245R2JjUTJsaEVjZEV1dkV6R2FpSWZ5bHBiS3Nj?=
 =?utf-8?B?ek5PdG9lOXk1R3J4M2d6SXhIdkVZYVIrVW5kaVQycHoybnJxQXJVckx5dDJh?=
 =?utf-8?B?dTdmMHluS1hIblhFaCtNVVpJZStGQituc0tCMWxNTDZ3dU9mbzNPWWlKZ08r?=
 =?utf-8?B?SnhuNTBRUzB0d3paRnNQdlhVUXBlZjJBc3R2VjBKR0tQU1JDWnU5WC9FeXE2?=
 =?utf-8?B?dEFlYlNFdXAxQ1daNGt0U1RDMWw3VjllYWNZSUhCK0J6MmVpdXdMMitOVlJt?=
 =?utf-8?B?M25TajU3bmc0K05VZnBVSTJsMy9CWU1qZ2Y5NHBzT1hmWGdJdTJXY256R21V?=
 =?utf-8?B?emhrcWhlTE5kOTZRWWk3RFo5MEJLRTJjZmJOM29Yc1VBV1JKUWNtRkRIbkdq?=
 =?utf-8?Q?Q5/2ym/NNXbNk7p+4YIkLSQ=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4919a243-b6b3-4193-a8be-08da0055a3e3
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 16:15:05.0516 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1pcDSJC/vdE27qgfj1WYskZL0+8Vq4HWOwK5zH8U2aynHhBiK8WMg2JjJByChvfY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4139
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
Cc: dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pushed to drm-misc-next. Just one nit below.

Am 07.03.22 um 15:54 schrieb Arunpravin:
> Reviewed-by:Arunpravin <Arunpravin.PaneerSelvam@amd.com>

Some people are picky about using the full name here.

And you I think we should volunteer you for maintaining that stuff :)

So you might want to get commit rights for drm-misc-next as well.

Christian.

>
> On 07/03/22 6:24 pm, Dan Carpenter wrote:
>> Set the error code to -ENOMEM if drm_random_order() fails.
>>
>> Fixes: e6ff5ef81170 ("drm/selftests: add drm buddy smoke testcase")
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>> ---
>>   drivers/gpu/drm/selftests/test-drm_buddy.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/selftests/test-drm_buddy.c b/drivers/gpu/drm/selftests/test-drm_buddy.c
>> index fa997f89522b..6eba590afa9b 100644
>> --- a/drivers/gpu/drm/selftests/test-drm_buddy.c
>> +++ b/drivers/gpu/drm/selftests/test-drm_buddy.c
>> @@ -488,8 +488,10 @@ static int igt_buddy_alloc_smoke(void *arg)
>>   	}
>>   
>>   	order = drm_random_order(mm.max_order + 1, &prng);
>> -	if (!order)
>> +	if (!order) {
>> +		err = -ENOMEM;
>>   		goto out_fini;
>> +	}
>>   
>>   	for (i = 0; i <= mm.max_order; ++i) {
>>   		struct drm_buddy_block *block;
>>

