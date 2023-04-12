Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAE66DF511
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 14:24:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44FC810E7AC;
	Wed, 12 Apr 2023 12:24:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2051.outbound.protection.outlook.com [40.107.93.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 472ED10E225;
 Wed, 12 Apr 2023 12:24:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jIlV6KmQ5lul4nNIBGoanQQ8kiphiVDNlwFbiro8SCgbymfgHcvlWix7TtBf2ITKTmmd751aAr9rYYUMW1vQhjJRbtZ3c16dy8NOO6VgKu40L8+GWqnb5OLunqeJNbScznecv3zg09qTNUbQog2TWw/e+sS3+GVhU0QiTIaQ0sjKNsqdwHrf40adxNH10JqbTZJDstGBqV0cCum0teuug6NNqOz+MYNVWZ28BN5o76rGM1ecpKaZcAB2ztiUfFBuCP0O1u/U8csng0cC3AEy5xGuNYica6vMRCBsfSMikCk8oZ6Do0wrz7g19UNXfegumd9YkLLUx6Tww58evsZ7ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=heg35P71C/DU03bOC8umryfXh1DUcNpzxNoVgNqfVnk=;
 b=jK5C2JnazPXxSqRUKYWRum+EpyCLkpf4MiN7X2m7i5ZefICv3p9TFYg+b+OWbUHKi19X6wlx9H+gYQAZ+2OV7dDoPQcd94A6UYUHsuhd3UkN4SX3XFuFC3P9qBhgfDt2U3n934iqv3uw0A3WCYWA/6dmgodS0SrES69Z/Mtm/xQzrwnr6Q1x9cWtyOq6mAQFq0JhijEmG4oHlCz2a5jscqV19Hxu2XbjP+Ofsg8j4Y9veZCO/OLbUyvUXB+Iy90/bnKQv8rqRjdcRzFOilH+kaDlSZp/kko993ccBCBIhmkwsqke4UkREW3pmN/T/Jw9cDC5yVpQiuFAS98lKtn29g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=heg35P71C/DU03bOC8umryfXh1DUcNpzxNoVgNqfVnk=;
 b=wgnukGl5Qn3MVrA/hUvq8RRXW1ujzvwLjVVR2Z1Zb5V2InCmJTm2OLaH9PEKNCZ55RH+kFBVBlmFcyEvJkKvIu6It4UpoWCY3AJmArSCsXNufMVE0N0DEQSqp03IorDs9PojrCokG4S4UkBg4EGunPHc6cdMDDtt/n0W3ed3S68=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SN7PR12MB8819.namprd12.prod.outlook.com (2603:10b6:806:32a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.36; Wed, 12 Apr
 2023 12:24:08 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae%5]) with mapi id 15.20.6277.036; Wed, 12 Apr 2023
 12:24:08 +0000
Message-ID: <53c2e18b-48ec-fded-e1d8-7b345dea49ba@amd.com>
Date: Wed, 12 Apr 2023 14:22:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 0/7] drm: fdinfo memory stats
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230411225725.2032862-1-robdclark@gmail.com>
 <bbbbbf34-2ea5-5344-30db-f976c5198d75@amd.com>
 <98bb3388-d671-dcf3-0247-649a702b5e11@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <98bb3388-d671-dcf3-0247-649a702b5e11@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0163.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::6) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SN7PR12MB8819:EE_
X-MS-Office365-Filtering-Correlation-Id: 87a7b358-7976-478c-ea8e-08db3b50d053
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sPOVcqrF9OUzZsU0fwu5CotOmYZ/zE+0sQwxjRBnrxh0AQBswsJvpxElRt1zcgzPLBuxAq+usDbfkBFJLbASqwkbj8QXOpyYYAYUd/96zhUyXTxL9Bi7Zw9MQknIcOOIvRoTqFiXW2ehC76P8QksebF6vcywSQZLIKUMgY9EJxGSozEGphgHLc2MnTRAFmYTQqvYvpfxCIh42ZCj0iiIqaNw3Ms7CZYSG8NQXTKw+el5GdymX/kguqmRPuk9cHedLIncdec4bmdaxuuc9tRhVgAXvOIhy0a5JCyS9VYB+ezRR1cRRmWMUjK2jDcuXkGQlCFFSWu5JQcGYTxqNXFSltpZarvL+7W9BA/G7FwQPlThCdQIiaL3ueIxoWHHydCSuX1W9OFqh/rgWNK1dEDiraphPzfVT/PwQKbhgiR1q4k4cfDamcnZIhtKQ4zibwNbjcAm7vRDGASg0mJnWGM6oAFF8Si4Rr5BBbO9MbIwczlbfTWFsrGHEETX5P4696y5/uynitoO4Fj0JH0AV4Ph06311jIzPX7qiJHZK4c3Uq3sN9vFoYoBcRlkHjSG8Dprh9gZO2O7ebjom/jzU2Oek7F4IZ6wKDKRCjRsv8pqy5e10ZD/r9jvaLQZflUix4HtNoJ8IMEkRoVNGPri86lcDQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(346002)(136003)(376002)(39860400002)(366004)(451199021)(478600001)(110136005)(53546011)(6506007)(186003)(5660300002)(54906003)(316002)(2906002)(966005)(66946007)(4326008)(6666004)(6486002)(7416002)(66476007)(41300700001)(8676002)(8936002)(66556008)(31696002)(86362001)(6512007)(36756003)(2616005)(38100700002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2orY1g5QUt2YUEyT2wwZ1BlM050MVpaVkNvRnZxTnJmYXk5V3JTTjZRTUJw?=
 =?utf-8?B?cnRlblB6T01EYVRRWk9RWUdOMERDUHlFWlJmVDE1Z3diWFBWN3ZiQnZBcEJX?=
 =?utf-8?B?MUFHOFNNVi85UlczWWUrNS8yWllvQy92U3NMMUl6T3Z1NlU0eG0rVjN4RzhS?=
 =?utf-8?B?cStRQ0NoVHUxcDlkeEVpVE9YblBkZ3l6SXZMTmF2NEtFbEgwNjgyY2JSRS9x?=
 =?utf-8?B?U2ZFbW1pREJQakw0Q2Q3cjhKVTZtQ2pxKzR6ekpXSVdkMlZydWluTGVQanUx?=
 =?utf-8?B?aHV5ejExeDFJajBvQlozaGVYSjIzMkNuNWpNSGloMENCYTdrUHVaZk9BQlc5?=
 =?utf-8?B?eSsySjhwZlhzMkVKb0NPeGMvRnduMjVNVkJIQjA2ZmZSVU05ZjZoVG00YkJF?=
 =?utf-8?B?Y0xwRlREQUhwamFsYUhTZmlWc0syRFRBZGhPcEhENm55NWJiWGNTbHcyME1V?=
 =?utf-8?B?OUVuN0lVYmViTTVTZ0tkMG5uK1VPU3dDbmMvcElJa1duQ2c3RW9xODM0bEph?=
 =?utf-8?B?QXNBdmNCUTFTQlpSSzJYN0FCVjlBWGxqWisyczU2a1VrczUwNTgwUE9qUzVR?=
 =?utf-8?B?Y04zV3Uxakw1ekFHVkJjclJDZ1ZaYlVTUkhFdVZyVnFnMTFHdTEycnR4RzEy?=
 =?utf-8?B?SVlCU3JzL3g1TEhMaGJuUE0zVXpEK3FZMU1LdU93SytpRWw0b05PZVhYZVc5?=
 =?utf-8?B?OWJHMVFpMmxUaG5mTUVLT0h2VlQrM2hlTzBiUytQTENnTzdlT0RpSkZpenpS?=
 =?utf-8?B?WGRVRG5nb29aV2FWa3RzSHIzbklYaEN1eUdPV2NSUWhQbXBzMVJzR1djWncx?=
 =?utf-8?B?WndIUFZYaUUwUDA0bUdTd1kreWZvMFVqQ2swZUhoRGp1dklpelMydEpidldF?=
 =?utf-8?B?ODhPUE9UVEt3MU4ySjFKNzVHOTEzcWhoMmgrdDBxREFkMXl6SDRDaFpEV3NE?=
 =?utf-8?B?WGRibXF1WGtWZnM3MTFoaHBsYU56ajRaMHdBVFRqQk5jbUhTSFVEVkdFY2pa?=
 =?utf-8?B?VVlBTW5OUkRiUmE4SnZJbTBDY1dhUE5EMG1ZL2p6U09CY09UVnl6K25YY3FV?=
 =?utf-8?B?cklZRGVGclgrVGF1bmQxQ3IxWXVEYzM3NHFKZ0NpdFQ5WjVRUmI2NnJoZ0Fa?=
 =?utf-8?B?cGIzQnIzRWdFYk1NVVNaZVVPaTgzckxXZU1FbTFVaTYrZG9Odm5FTkVvcUlN?=
 =?utf-8?B?Z2JseVN0ODV3KzFTYVRWb0lmSWo0U2xieDA4WXc0VGFsdDBhZTMvZXR6cmgz?=
 =?utf-8?B?YUVBVjRGdDdvemNwMEd3d3RaUjVZRDJSKyttRmRJdmxFRVZKMDdiWWxFcmJ2?=
 =?utf-8?B?TTgvTEs1TlpRTWh0a21ZQVpBNFNNQk5YbWw3QU1jWGRnbCs5Q2dZWHcrY3ps?=
 =?utf-8?B?R3AzMUwxbjB1S3k2NitMaUJmUUhTZlVpeWlJVlcvekI4K1loUktjU0NkdXV5?=
 =?utf-8?B?QW8rQkFOMkNuN1VibkNtN2Q4TW5YMUVoc2c3VkdtSGJncVVISkRYYnZOcEZl?=
 =?utf-8?B?bm1USDMzY0pmM09MazNWT3NKeGhzc0RrNjhLTXNIMlNGNHhLbzhZMVg2N3NR?=
 =?utf-8?B?RXhDdExEZzFYYzBvd1BYcUF5MGI0ZE5HMmUxUXMzY1NEN0dXeVNXdEpRTzEx?=
 =?utf-8?B?b1AwTFVHOURMMk5xZ3JDYWRJU2N1V0dxQVpyM08vZnNJTzYxWDZWanZTODlM?=
 =?utf-8?B?WWZvdTlSbzU2WlpRZ2k3eVNjajh1Mm82ZmVrUGhlcW5xTUZFOU5mNzcrZW9W?=
 =?utf-8?B?THpzNks1NWFMdFdTZ2Z3eXBnRFlqSFZSdk5DY2lkZUZqb1FFMEJpUnhXd3N1?=
 =?utf-8?B?dlRaZmUxd1pJdWJINUdHUmZyWS9lS3dwWTJJUVNnYTlLUmhtSkpYb2NCUjZl?=
 =?utf-8?B?ZGNsK1EzSFJTeHlONnVZQ3YweEJXUWRXTmZFU2Fxb3M5YUxMZ0hFYjRVWVBv?=
 =?utf-8?B?V3NQcVJyQjBNT3NWUERaT0tZWFN2MkFPQ0p1bG5XalRDa0xpOE9Rd1V2TlBk?=
 =?utf-8?B?cDJKaFN6SDl4WFNadTFycTRSNHJ0S3BFZXIweFhZOEFjWXNmcHBpNlI1c2NG?=
 =?utf-8?B?NmltN1l0b21CajdienBPbjY0ZThsWWpkS29jWUxXbGhYbUdiZWlOc1JSSEhx?=
 =?utf-8?B?ekhvLzZvUVU1cHczUmVGaTBIOEU4M3YzNGVXbWVPQTJ5YzFTb1JabEhXNFN4?=
 =?utf-8?Q?G+03p8kojsoqeXwpoNtzuFMPrei37BL+aUBnXbpteV2U?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87a7b358-7976-478c-ea8e-08db3b50d053
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2023 12:24:08.3843 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: damCiX+BEHrJgH1SDR1v9UrtPgkV3U4R1pBye3XQbhUDE6ZVVMyZfrWaFwkt+N+h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8819
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
Cc: "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <mdaenzer@redhat.com>,
 YiPeng Chai <YiPeng.Chai@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Rob Clark <robdclark@chromium.org>, Guchun Chen <guchun.chen@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 "moderated list:DRM DRIVERS FOR VIVANTE GPU IP"
 <etnaviv@lists.freedesktop.org>, Evan Quan <evan.quan@amd.com>,
 Sean Paul <sean@poorly.run>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Christopher Healy <healych@amazon.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 12.04.23 um 14:10 schrieb Tvrtko Ursulin:
>
> On 12/04/2023 10:34, Christian König wrote:
>> Am 12.04.23 um 00:56 schrieb Rob Clark:
>>> From: Rob Clark <robdclark@chromium.org>
>>>
>>> Similar motivation to other similar recent attempt[1].  But with an
>>> attempt to have some shared code for this.  As well as documentation.
>>>
>>> It is probably a bit UMA-centric, I guess devices with VRAM might want
>>> some placement stats as well.  But this seems like a reasonable start.
>>>
>>> Basic gputop support: https://patchwork.freedesktop.org/series/116236/
>>> And already nvtop support: https://github.com/Syllo/nvtop/pull/204
>>>
>>> [1] https://patchwork.freedesktop.org/series/112397/
>>
>> I think the extra client id looks a bit superfluous since the ino of 
>> the file should already be unique and IIRC we have been already using 
>> that one.
>
> Do you mean file_inode(struct drm_file->filp)->i_ino ? That one would 
> be the same number for all clients which open the same device node so 
> wouldn't work.

Ah, right. DMA-buf used a separate ino per buffer, but we don't do that 
for the drm_file.

>
> I also don't think the atomic_add_return for client id works either, 
> since it can alias on overflow.

Yeah, we might want to use a 64bit number here if any.

Christian.

>
> In i915 I use an xarray and __xa_alloc_cyclic.
>
> Regards,
>
> Tvrtko

