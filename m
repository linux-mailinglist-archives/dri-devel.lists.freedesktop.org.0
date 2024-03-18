Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2F387E9E3
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 14:11:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E39810F31B;
	Mon, 18 Mar 2024 13:11:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KYj7rxBS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2048.outbound.protection.outlook.com [40.107.94.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C073310F6F5
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 13:10:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q9hFvBjGlAGiP0U5xfhrtjPNHtVYkQs8qn4i5LSLYGYr4IVvdk9b4JIwzIDZXzZt3oK7rCg6Pgr1mFe3Mrd+pp/DmBqVsWSoBtHO6vekBQPYePoWQ9cp4E00B3w8otar+uvWdwCxvw7NR3QEiAgqbDRg8rgJGvzEBCOKJFQ3cvfxWhGWx6ZLwiGpsHAlxe2fFxIfYJXHOhAW27WxkSUzd/juh+a0BnxuaakWqPkPnINZLrgzpDr6XhJHN9Bs8oRsEazTqMMYbl+kAzoHu06gJBcskcpqR4cIcCB0mBqeBRNG3TXhPnrS+27ALJgEldLrPIhxmxwK8v4qkEk4c0tV1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CTNl7IzjnvvCSYfZMDViV/3ltHlgRMZpBS4Wzu8ux/0=;
 b=UG2E6EC039Esw0OhAm8wTIVNYf5n+xveiStoBXYT7X4fcTVMFIOuiQNfsJdAUWVdHtew6qH9YAlwctor6THSyGFKbx7u3iMvPP2XriMx0qPQD5gthJESpcKbtohfBpSU41fyBzPQB1Gewoq12cTlCSJM4Q9pHEolBiMgKCi7AxxZCOyVrzmR7MWP194nLJjA0PhYiU3Pm4zDjjnYkElM5N15Nl/x7dGEnLiFAQzt5dMd3+MRXUitmjHfwRqlLhmSo+QZB5ldHi1s6RGnaXW0AwRId4SVxD9XIb3Pi2j2j9+eaIzpIWZ217oUZR68qv96KhJpQVTycl53AUzvGRmOag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CTNl7IzjnvvCSYfZMDViV/3ltHlgRMZpBS4Wzu8ux/0=;
 b=KYj7rxBS/hLSgAEye/fIIG0GZ+DnmljBMVe50cQ4Ds6pywYU9LrRo6vl5SoxBcTPjRzBVQr4F2VIyy+sJ40q4wsGVjROMoiaWfVOqLsgPxnN2DbgHylHSnolUreC+dfo6t0rVBOYNsmgf9sLob1gXOpo4zA2MkaM3ru4PymQbWc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB8859.namprd12.prod.outlook.com (2603:10b6:806:37c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.26; Mon, 18 Mar
 2024 13:10:55 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7386.023; Mon, 18 Mar 2024
 13:10:55 +0000
Message-ID: <68452c6c-12d7-4e60-9598-369acc9fc360@amd.com>
Date: Mon, 18 Mar 2024 14:10:42 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] drm/gem: Add a mountpoint parameter to
 drm_gem_object_init()
Content-Language: en-US
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Melissa Wen <mwen@igalia.com>,
 Iago Toral <itoral@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 Russell King <linux@armlinux.org.uk>, Lucas Stach <l.stach@pengutronix.de>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Sui Jingfeng <suijingfeng@loongson.cn>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Thierry Reding
 <thierry.reding@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Huang Rui <ray.huang@amd.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
References: <20240311100959.205545-1-mcanal@igalia.com>
 <20240311100959.205545-3-mcanal@igalia.com>
 <30a7f20b-1f2c-41cb-b193-03429c160b63@igalia.com>
 <3a5d07c0-120f-47f9-a35a-31f3bfcc9330@amd.com>
 <07885e3b-ee7b-456b-9fad-17d9009a4cb7@igalia.com>
 <a0ac2e10-f5f5-4fbb-b591-bd188967ce53@amd.com>
 <e8165baa-9ded-4149-aaa6-6713d112b621@igalia.com>
 <69576e6d-9704-42b9-905f-289f9f9017b9@amd.com>
 <ed7ecd56-0b5e-4543-80f6-7d28ddf8e2ec@igalia.com>
 <9cfb7f83-2d76-4e8d-9052-5975da71e0dc@amd.com>
 <2118492c-f223-41e9-8c1e-3c03d976301e@igalia.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <2118492c-f223-41e9-8c1e-3c03d976301e@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0181.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB8859:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b3c60ec-5233-495d-b886-08dc474cd878
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Rcit8ha4E3muKYvZF2TMEOAaZNaEemZP4nYQMhTTU6CH7ILhrfr0PEh4nC8ySRdQRDbNgWEc1TyybU0H5jKv0YesvrXJkQXSNhnL85t1F+UhM/nPKNEIly73TlyT2jzwPX1x7okTyLCTGmkWlT6wuGJtrO5rdoOGEtvm/QNDKnTDahajarKyPVAoaDKOY/HESXLNMxLcR5Iyb4fUXONVCxo2pYd2HUBBo3y43Y5NvWhJT8zQrWREcP4HX0YP3oxiF3/l1cibbRFTPsXEfAXRMqZTh967Anet1zORk4EKbkLdcB6l8/yDhdVr2tG9CWxJkXK1AF3VjSo+GLqyV/WPvq5zVI9zDxhjX47bAaQ2wqiWo3KjDjOYh2AXv3uhp5zteOP8TPilJrajYnChB20HEL+eGbmqUiBZndxuu42NMCN/DLnEBjkYWDpxAW1LTwYviZWLpqTRQeu7j/9KFbs0w119Bjwtq+Y3tan/ufbDeNUwSaY2WVReOu9d9gVCF0VSoJtSHuU5AZruGDn7jOzdiMLxPZVcZ1+xttuQ9oIr2dGGuwQPclTd9oSaC4FxNs5KYVjhj378SWxaGp2syPWxq7xq6FkMChK5r96GLTWz4G9yN8uXcER7EyUEoD0xBnRoUXnOCnxigvi8OZG1+jJbf69bv70+6SW1NJpP/sNdh64=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(7416005)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkFodE1yWDF6dC9DTno3bkRTS3dlK2YyajRkTStBZ05TbnRSTVRLZitZaGxy?=
 =?utf-8?B?cUNtai9raHU4QS9IallDb3ZjODdNNkZ5dHFEcWdEVWF5Wms1eWRWWUJ2MU04?=
 =?utf-8?B?RmxhQ0xMS2lVVGM1ckRmT3REK2k0S3E4bytWdlcwSFQ1N0VPM3dyV3lWTjFs?=
 =?utf-8?B?MmkrU0Q2Yk1BaHdFTUo0cDZYaVpvRW1xUkNxWjB0R0g3V3RJMmdDemszZ0VX?=
 =?utf-8?B?TlRXcXNLelh4MytPeVMyb3ZjejRyR0VncHNuMi9LVjJZK0RTUVJMT0gxd0Ni?=
 =?utf-8?B?d3ovdFdtUzloSkxhYVpJT1BoQ1ppNmVDWG5pc2gwU1U5UGJmTG9tSURjUDJQ?=
 =?utf-8?B?ak9zM1VMamVJVlovanV3Wk04Q0hIN2p0Njhpa1RGMEtNVXRCTmhJNmUrV3BC?=
 =?utf-8?B?V0VQRW91b2tscmxabWdoN2NDQW8zUUR1bVpsa0NPeEJNYm11aEt3YzhwdU10?=
 =?utf-8?B?K2NCTVFieDdYNmxtcWl5L29uL05ubDV0UjhIS1R3UjFud1VqSVlzZzdLU3h1?=
 =?utf-8?B?WHU2c0xPR2Joc2R4VFl5VktmRGUzZThNeE5od2txU1RGUlFlRDdueWVFWkp1?=
 =?utf-8?B?a3Y4eS84czlCeGZLSmxZeEN2T2xyQS9oaFZLV1J6TUJnK0lwczF6aGdCeCtC?=
 =?utf-8?B?Y292RUdoTWpqWUs5V2ZrTG5SSzV5VjZvdDNjcXNVTXZNZkVVcU1qSkJpajdp?=
 =?utf-8?B?R2V3NTQzbkMyZ2dnMy93YmVlYmo2Ym0vSW1vTlU1Uzc1M0p1eGIyV1pmN2lT?=
 =?utf-8?B?YnU2MmhmY2tsVHdTL3lqT1djUDZSZnp5QTR1SENQQjRzb3VDaUR3U09MWk1q?=
 =?utf-8?B?YkRMd2svNXNXQXJJL3lhM2Nqb29FNFNxT2lqSjFScXRkdVR0UEgrYzZ5Slda?=
 =?utf-8?B?LzcvZDhXTmFSampjY2NoVFh3STZVM0JDOVZaZjdQTDlSWmUzU0NuMUZWNFcy?=
 =?utf-8?B?cXA5anlOeGZyZE0vdzUzTVhLSWQ4cWlkbXZsQUdQak9TbFZOSFhqRXdBRlBC?=
 =?utf-8?B?S25rQ295Z1NBcUgvcUsrUU9tN3hqVmdPZUcyVkhnRERDa2h3OENwVnZnMXFJ?=
 =?utf-8?B?UFNSVjd1ZDVtcUR3WGtqS0VPQ1Nwcy9oQXhOVGtETGJHcG45ZE8xNEwyRkpy?=
 =?utf-8?B?SVhxeFliNWRPcXd6OVQ2RlB5SnBKUlhRZFQ4eE1WZHEvWUFtNGVVeHMwWHFn?=
 =?utf-8?B?d09tandOVkJyU2pWTVdHdksvdkd3TjVyZFdnNW0yWmRGc1FMS3M4WCtMVm9l?=
 =?utf-8?B?T0Z3WXF3TTQ2R09MUytEWkJxUmhjck00WlNmMXRXWEZwYXRsaFM5dDRITlV5?=
 =?utf-8?B?Wnp6ZTdEczZ0bXdodUVqcmQ5NzlLRnB2VHN6VDJHa3hvMWc5NlUwZ01jTlhO?=
 =?utf-8?B?citkTXRCWDFXSkdCcU1nZGJrL0VOc1BIcXpnL0p0dG1LK0lwdjJFR2hGT0JR?=
 =?utf-8?B?RHhuYWVDcFlScS8vR01ZUkZVTXAvbjQ1VXZSZ0YzMGsrWS93ZmoxNHhzTmMw?=
 =?utf-8?B?d1I3djl0YWJ5dENTYUVwdnlqaWZFcEFoelp5RkU2dlh2Y3ViMHpRNTAxbGph?=
 =?utf-8?B?alFGNlhFNzUrbnlQSENzWGJ2Q1V5ejdIVmlCSklneWhFTFJiV1ptTjBWRkt2?=
 =?utf-8?B?SktTMmRtTC9WclFsS0ZuZ1BQOFhaWENRRmdpQUxJZGpQQXI5a211RklxQXhL?=
 =?utf-8?B?ZmRsVWpaZ1M4dlRVVHFtWVgxbm5IdW1XK2RiQVl6YTF6N1lsbVN0WlJ3RHdu?=
 =?utf-8?B?VEVSdFZhRm5uU1hobTYrMk40K09BUkRmUWdHOFpqNzlacTBVNVRBcmxLSyt5?=
 =?utf-8?B?SnpCN0JWT0NFOWVLYnhabnBPQ2dXeit5ZHJ5STY0bGkzbE5OdDI4TnlhVVRY?=
 =?utf-8?B?S2s5YmZqT2hiTXpzV2ordUNFd0lzQlhKb1l5Y2ZVUnZUNFBBekJvMW56S1po?=
 =?utf-8?B?TXVscVIzdlJ4K0xUa0tBNlhKYnlTbFBXNWk0cjNqWEo2dkN5UDRUQ0ozYm1V?=
 =?utf-8?B?VC9ORHdZTTJQMWVRSGdLb1VkSzJUN2U1Znh4SlZLOWdQWjNkQ05DbnVRLzhT?=
 =?utf-8?B?R3JRNWt3YXMrcGFxUEwrVzM1NU9ndmZRTkxISVA2ejZKN0o4blRyNDNEdTFq?=
 =?utf-8?Q?eL+Lcac38r1FIeoOOzBBoYYtM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b3c60ec-5233-495d-b886-08dc474cd878
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 13:10:55.6992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wnfLbGLgRPKKTwKgDHQxbjJnowK2m5NZbZuv21Tcr46mo+o+v5o8uvOICJxgwt/T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8859
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 18.03.24 um 13:42 schrieb Maíra Canal:
> Hi Christian,
>
> On 3/12/24 10:48, Christian König wrote:
>> Am 12.03.24 um 14:09 schrieb Tvrtko Ursulin:
>>>
>>> On 12/03/2024 10:37, Christian König wrote:
>>>> Am 12.03.24 um 11:31 schrieb Tvrtko Ursulin:
>>>>>
>>>>> On 12/03/2024 10:23, Christian König wrote:
>>>>>> Am 12.03.24 um 10:30 schrieb Tvrtko Ursulin:
>>>>>>>
>>>>>>> On 12/03/2024 08:59, Christian König wrote:
>>>>>>>> Am 12.03.24 um 09:51 schrieb Tvrtko Ursulin:
>>>>>>>>>
>>>>>>>>> Hi Maira,
>>>>>>>>>
>>>>>>>>> On 11/03/2024 10:05, Maíra Canal wrote:
>>>>>>>>>> For some applications, such as using huge pages, we might 
>>>>>>>>>> want to have a
>>>>>>>>>> different mountpoint, for which we pass in mount flags that 
>>>>>>>>>> better match
>>>>>>>>>> our usecase.
>>>>>>>>>>
>>>>>>>>>> Therefore, add a new parameter to drm_gem_object_init() that 
>>>>>>>>>> allow us to
>>>>>>>>>> define the tmpfs mountpoint where the GEM object will be 
>>>>>>>>>> created. If
>>>>>>>>>> this parameter is NULL, then we fallback to shmem_file_setup().
>>>>>>>>>
>>>>>>>>> One strategy for reducing churn, and so the number of drivers 
>>>>>>>>> this patch touches, could be to add a lower level 
>>>>>>>>> drm_gem_object_init() (which takes vfsmount, call it 
>>>>>>>>> __drm_gem_object_init(), or drm__gem_object_init_mnt(), and 
>>>>>>>>> make drm_gem_object_init() call that one with a NULL argument.
>>>>>>>>
>>>>>>>> I would even go a step further into the other direction. The 
>>>>>>>> shmem backed GEM object is just some special handling as far as 
>>>>>>>> I can see.
>>>>>>>>
>>>>>>>> So I would rather suggest to rename all drm_gem_* function 
>>>>>>>> which only deal with the shmem backed GEM object into 
>>>>>>>> drm_gem_shmem_*.
>>>>>>>
>>>>>>> That makes sense although it would be very churny. I at least 
>>>>>>> would be on the fence regarding the cost vs benefit.
>>>>>>
>>>>>> Yeah, it should clearly not be part of this patch here.
>>>>>>
>>>>>>>
>>>>>>>> Also the explanation why a different mount point helps with 
>>>>>>>> something isn't very satisfying.
>>>>>>>
>>>>>>> Not satisfying as you think it is not detailed enough to say 
>>>>>>> driver wants to use huge pages for performance? Or not satisying 
>>>>>>> as you question why huge pages would help?
>>>>>>
>>>>>> That huge pages are beneficial is clear to me, but I'm missing 
>>>>>> the connection why a different mount point helps with using huge 
>>>>>> pages.
>>>>>
>>>>> Ah right, same as in i915, one needs to mount a tmpfs instance 
>>>>> passing huge=within_size or huge=always option. Default is 
>>>>> 'never', see man 5 tmpfs.
>>>>
>>>> Thanks for the explanation, I wasn't aware of that.
>>>>
>>>> Mhm, shouldn't we always use huge pages? Is there a reason for a 
>>>> DRM device to not use huge pages with the shmem backend?
>>>
>>> AFAIU, according to b901bb89324a ("drm/i915/gemfs: enable THP"), 
>>> back then the understanding was within_size may overallocate, 
>>> meaning there would be some space wastage, until the memory pressure 
>>> makes the thp code split the trailing huge page. I haven't checked 
>>> if that still applies.
>>>
>>> Other than that I don't know if some drivers/platforms could have 
>>> problems if they have some limitations or hardcoded assumptions when 
>>> they iterate the sg list.
>>
>> Yeah, that was the whole point behind my question. As far as I can 
>> see this isn't driver specific, but platform specific.
>>
>> I might be wrong here, but I think we should then probably not have 
>> that handling in each individual driver, but rather centralized in 
>> the DRM code.
>
> I don't see a point in enabling THP for all shmem drivers. A huge page
> is only useful if the driver is going to use it. On V3D, for example,
> I only need huge pages because I need the memory contiguously allocated
> to implement Super Pages. Otherwise, if we don't have the Super Pages
> support implemented in the driver, I would be creating memory pressure
> without any performance gain.

Well that's the point I'm disagreeing with. THP doesn't seem to create 
much extra memory pressure for this use case.

As far as I can see background for the option is that files in tmpfs 
usually have a varying size, so it usually isn't beneficial to allocate 
a huge page just to find that the shmem file is much smaller than what's 
needed.

But GEM objects have a fixed size. So we of hand knew if we need 4KiB or 
1GiB and can therefore directly allocate huge pages if they are 
available and object large enough to back them with.

If the memory pressure is so high that we don't have huge pages 
available the shmem code falls back to standard pages anyway.

So THP is almost always beneficial for GEM even if the driver doesn't 
actually need it. The only potential case I can think of which might not 
be handled gracefully is the tail pages, e.g. huge + 4kib.

But that is trivial to optimize in the shmem code when the final size of 
the file is known beforehand.

Regards,
Christian.

>
> Best Regards,
> - Maíra
>
>>
>> Regards,
>> Christian.
>>
>>
>>>
>>> Te Cc is plenty large so perhaps someone else will have additional 
>>> information. :)
>>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>>>
>>>> I mean it would make this patch here even smaller.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>
>>>>>
>>>>> Regards,
>>>>>
>>>>> Tvrtko
>>>>
>>

