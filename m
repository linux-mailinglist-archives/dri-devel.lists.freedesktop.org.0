Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F9C900B4D
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 19:35:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C05D10ECC5;
	Fri,  7 Jun 2024 17:35:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cmU3V2Gf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2081.outbound.protection.outlook.com [40.107.220.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C453B10EC1A;
 Fri,  7 Jun 2024 17:35:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eHSZDkyetj+J3Akg913XuFZY50kejJUp1kWuehI6pStV+DmLStSwU41l+BBOG6sxf4dEy8llzQ3Q1mlOgGVDfOgSULVzFMTHyLJvTl71Iv6+pm568TXSgzFibWX3rak02aPQvqH8BUq+feLvvNakRq7TRKkfQuoydc72jX70icHmeGhP16OjlDQluCF6kehFGjdACVv8ZHsXsL1mNoNCSt0+sQsOBqWCPUSX2s72Lslhl2sO1nLSzi9z8+FK1oU7LCq20aUiPTAXXMC29e1mV62tI5qcdtbL3VOr02UuGn9hyaezxbt7L/dI5Hsoh/g94KhVAJN5uYGQoUZlgD074A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KJKiVIZoDyzySarIDKWQ17GejvZF6X6eAk2dvhVhRts=;
 b=RtvuRneYpG8kOkRO77fryKF8Eo95UPaRNSNCCsgiup5g0tU37RcrGKuMwLjEyXx4aIuZskzvmuCMLndsyYAOkkIod/5Vr0hTuvDC346tnGtx4al9tR62KNYNZSuAXJ5kYEc65nMRmzFs6vwylLf1pZN0piLbuWJb/fhkWajb0H9/g+bjgJuKgKQ4WO5KQetpwnEPNgt5Yofc7yeuZCAtSzRGk+tqGXQBYE8eIk43826EOaBw7/Km81tpoG10QSurnTXZ7sHpEDMfwRpscpjpo2Tm70KRsgedXkvRBLCrvylRtdenr9MWwpG4iC5zNHMKKRbMFKKnvLib+6QOz1PwMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KJKiVIZoDyzySarIDKWQ17GejvZF6X6eAk2dvhVhRts=;
 b=cmU3V2GfmnulyZiiOt9oA80QKtRckRxDY25u8V7ilsoYO1rYHufFiIJaX6D0GCtRD9UByxXUPH47jCUdqKsODGpkxRj3eI4Sad/sMXmOX4imm4uQwyltOd4sb08eCY8c6xoG5SoApJ/yBWa6OeMQn9nEe5p+PmMbKqV+kHzz7So=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by LV8PR12MB9357.namprd12.prod.outlook.com (2603:10b6:408:1ff::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Fri, 7 Jun
 2024 17:35:40 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.7633.021; Fri, 7 Jun 2024
 17:35:40 +0000
Message-ID: <771fdb3f-79ed-4c1d-b979-d1e8d046832d@amd.com>
Date: Fri, 7 Jun 2024 19:35:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/radeon: remove load callback
To: Hoi Pok Wu <wuhoipok@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, "Pan, Xinhui"
 <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20240607011413.8839-1-wuhoipok@gmail.com>
 <dd92e946-144a-4624-aac9-c516b2417208@amd.com>
 <CANyH0kCyZsZaEaGb3cweD_KD8JB1v+1Xekz78p4my1FSdZDAxA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CANyH0kCyZsZaEaGb3cweD_KD8JB1v+1Xekz78p4my1FSdZDAxA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0147.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|LV8PR12MB9357:EE_
X-MS-Office365-Filtering-Correlation-Id: fbb6096a-5674-414b-69d1-08dc87183ff0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YWFRdklaVlB4SEdQMEc5S1Y2N0cwY2ZDcThRbEUwTnFLY2pIaHV1WWNVMUVI?=
 =?utf-8?B?RnhCc04wampLRHRURndDQWxjdU9QRHRpWU9yWThyaTZaS1RNdGUxTXh6WHVM?=
 =?utf-8?B?dC9DWThlNXNJK1dtWXZJQ0k4Z0RpcTJwcU5GK1dhWFZVejZYeGV1Tlp5WnRB?=
 =?utf-8?B?ZGVXWEQrRjdqWXNCTHlnUFo0V1BXUzdUbldhUE84czNQZndkRmRaQWVQTDdv?=
 =?utf-8?B?ZlYyeCtmbWdvZ1Z5Q2dUSElzV3Q5K0hYV0FSeXBST1FONWZYUDB5Qkdhd25I?=
 =?utf-8?B?Uk5PUCt5cDBQZzN2TnRjbEp5TTVHcUpQeEVXUFl6MEROMDZWbUR3bTl6cnVQ?=
 =?utf-8?B?ZDR1MnlpWk1JcFdrcDJURW5jNyszV1BCbzdjRjNVdkhUOUhzc041V202WWEv?=
 =?utf-8?B?VUJHMEwvN2h0OXJ5M2ljSjFpVko5WTY5a21sRHJtU200ZXFGOFdOWGtybzFi?=
 =?utf-8?B?ZTEyVkFCVFBrOFA0SFJiLzU0Q0NyY0NRdTN3WVBZd3JRb0E5WGNBZlMwWUY5?=
 =?utf-8?B?azhRd0Jud3Z1SGJMUjMwQXA1NXcxd0JRR1B5bWhWSS92cUVVcDBIVGVXZzNQ?=
 =?utf-8?B?bCtKekZqWmljTVRmUWZuWTQ1QjA1VGdsSVczN1pPVlJxeHdQMVVuTXlRNmh6?=
 =?utf-8?B?M2szYi9lVnlkZU5nMTVlVVBHSWpVNzQ2RFkrTTVBd3RnM01WbUFlajRNTlRq?=
 =?utf-8?B?THNwT0Ywam0zOUllNXFlWnNWTDhTUGtmcEZWN3F4VFR6c2JjZHFJenhpbi8x?=
 =?utf-8?B?UHlyVUpkbkN3Z3FJakxWYWJ4R3N4QXJSQzZpSEt1VGcvb2R6amV0MTg1Z2Ry?=
 =?utf-8?B?bnBQdm9Lcm8vMVFiTmVlRWtnZHZSUlpPZkMrU2o5TWRaVndCOGlYaW5SbWlF?=
 =?utf-8?B?MDVxRnpXOFR6VUxNc2hVYUwvaVd2TG1hNVlFK2o1THdJbldZbmhrYkhpR0JD?=
 =?utf-8?B?TGd0V2tDUS8xd0hkSjc4OTBrT0p4VnhlZlpOWEJ1L3d6UXhxcjA0QkNiUVZm?=
 =?utf-8?B?bE5rbEcrZ1h4TU1UZldnM3VEUWFZejBvendZQUdpdTkzb2NTTVRBOHZPdTFm?=
 =?utf-8?B?Q3JjS1VWTmhDNVcyS2FWZE9Db1kvaEFNcGlPUmh6RUl6SFc1MDJlRU94M1F5?=
 =?utf-8?B?KzhybWsyOUQzUkppaTFOTnRUZEE5dnJQVW8xMXVqd3pvOUNRV1dCOFViQUVy?=
 =?utf-8?B?aDlGNk96YVIreXlQSlVsMlhEemtRZ2tqSUtWV1hwNnl4VGU2YktzWUJyRUI2?=
 =?utf-8?B?TFlsWXRYNEtuZ0tyNnBGNGg0ZzdURmU3U2haaE41U3AwcXQycHlDaXVwMVJ3?=
 =?utf-8?B?R0tqWll1ZDJ4ZXU4Tm1pSDhpWUVleFh0N3F4SWhUK1JyMFo4U1RNUGhDbnor?=
 =?utf-8?B?NzlPU0VxNlltZVd6blpNTDBZeFkxV21KbS9kMkd3OXdRTFJ2bDhPWjBQbGpj?=
 =?utf-8?B?V3lBN2lHeEQ5d0RZeWpmcUoyWTc2a0FVcWdQNjBlQXpHNnEvaGtQN2gwc0ZC?=
 =?utf-8?B?Tmw5RFlSVWtqUWh6bXVSemROUkMweEM0Q21yKzRtSXdWYnE0T0NBU2hIdERC?=
 =?utf-8?B?VEUzc3dodW0vSC9Md2o1YVFyazJtNTJxOHJWN2t3NThGanBmZmZ5NGZtaWxO?=
 =?utf-8?B?Nk43TWRHcEs5SUFncU9BR1I5K3Fta0Uxa1ZreTRDa1RQWXNxTUdkVmFEeEty?=
 =?utf-8?B?RTRIN0phbVZWQUpubWtrMFRsVzNsWnVWb09NSm9yWEo2dytkb2RodUx6cDJH?=
 =?utf-8?Q?F8PwJQ9qrR4rXctTdrYuQiCb/Nw8Jkx2M8grvWl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a253Rm8wSnFqTks2UU1pSGtuSHlEWTVIa3MveFlaLzZWRlEwaGJ5UWhQQlpF?=
 =?utf-8?B?VERpeEY0Rm50OXprWTZ6MGNJUExxWnZmTzVtalVYQnBCOHk2YVkxbjZ4TFI0?=
 =?utf-8?B?a2p4MG1rbHdQb1hpZG1oOTcrMWJBMWRYV3pEUTVGbThXUWxOK2Y4R2RMb0VI?=
 =?utf-8?B?cnJzQTR3WCs5OHljR3VQSENKWWZ0b0h1TGtsV3FVdGFDTmFOSDlzbkd1Z0xt?=
 =?utf-8?B?U3BTM0VKZDNqZHYveThnMEFZUzdMMk1qY3BRM1dOeGhobzIrVlFSVVEwelho?=
 =?utf-8?B?ZWovRkNyamVKWnE5SEFvTGlCMHNtM1lsUm5ISVExVmZFWGxPbkNiUjRBaXQ3?=
 =?utf-8?B?d3JxN1dHN2hNa0p0R2IzOUZOZmkvN0ZFZFl0TGZLdkE2bis5RC9ZSUs5LzlH?=
 =?utf-8?B?WWdCakFhWmVLWUdSaTJxWWdyZlliaDBHVlBRaTBmYmhCMmc2Vklwc2RhNmgz?=
 =?utf-8?B?NUlFaW9xRFdONy9zYkMvbkNPUkdYOTZJUklyS29ZSHJkeHFDQ0hCRkFva3Z2?=
 =?utf-8?B?WkFyU2ROdC9UQjFjWXZ6OFdYcHdadW8xZHBQWjVNMkpyTnNvSFFZMSt3eWNW?=
 =?utf-8?B?dlpLcUwyWlVhZkxzSUpQcGcyS3Z1NG1PYkdkd1NXM283aS9qVURXVGo5SXh6?=
 =?utf-8?B?MzRwZ3NJQllTQ1gyME91NXh6YVAzb2pnRFlTOXM5MW1VdmRRQmlmbFlsOERy?=
 =?utf-8?B?bWpuYU50RGw1aXVNNEQxK05XOVZJdTN2c1JTNlQvMmtJei8xZ0Fkd2tkK1Nl?=
 =?utf-8?B?YnBQRXBjb3FxRVZQZHZyY1pBSmFGMEQxNzVzVjJuWlFUNlIwblVONGd0c2or?=
 =?utf-8?B?UzJHT0JPQWdHR0Y3Y09GcGpyUUwwZ3lza2hueUZzazVacHNzcklubWxPWTFm?=
 =?utf-8?B?eVJXVVY3TlFoOStZUXZJYml1WjJheTJ1R2tTcnhEZCs1S3Z4NkxaUnNKWkNB?=
 =?utf-8?B?aWJNckZDaDczTnRKMU1FZTRwS3BUUjlwb25RcjltTDdLZTBoSEFJaStLd2Rs?=
 =?utf-8?B?M013WjljU3hydkc3VE4vczVYM1BQalBpZjduQUkvU3VxUGlRRTdHVGo0OGNn?=
 =?utf-8?B?TVBvVlVoemZNeWlXbzkxVk13VGFXcWZXNE52dTlaWHJSNnJXS0wrMm5sQ3hG?=
 =?utf-8?B?K2hUMHFEdjVhenp2TDJFdHlnUkpOQndEdnZhbyttcEttb2tyRzNlT2N6cFNy?=
 =?utf-8?B?dDQrSUhmSE5rY1Jpcit3bXBVMnlzWnY0SXJ1WTdwNEVmcldxU1JuTWhLVHJD?=
 =?utf-8?B?Z2xWNCtBS0ZZNXZKZkd0L1J4ckJzT1dtR2c2bWovcW9oWjlHek5xbDk5YnNh?=
 =?utf-8?B?L3pwWFpjd1VDNVF3QTZNTlRCWUFoS3Q0S2dsakpVbnY2c1lVNXRXS2N0K3hl?=
 =?utf-8?B?MGloMHNJRjlCQmJyM3JMNmNwUEFIcFN0YXNsOXJXYzJuK2Y1Z0FGQ1VaeVN0?=
 =?utf-8?B?ZDdCMEs4YnFOam5VZ1BuNEVjNFk2OVBmbGRXZG5Ya2xtL1ZWRGtpMEhhd3pt?=
 =?utf-8?B?QjNxdGhBWEl1TnlCZkJjVGRIMzhaK1NJcERDQ0Y3RCs0Q2JIWjJLYUtxeENj?=
 =?utf-8?B?eVVTbm5QNVEzOGQvQWVHaUxaU0lvWGg2MkxlaVpuSHJjVGUrbGx6eWw4VzBX?=
 =?utf-8?B?K2tDSkJVbzBBRlhuUExNaHg0VVBmb2dRU3ljbjN5RUxvUy95ekluT0lWZThk?=
 =?utf-8?B?ekU4T0tUMnJZeCsrWlB6R2Vha0l5OWFXVngwaDBwdllMVXFhY0IvbnRPUmtz?=
 =?utf-8?B?N2hmakdycGN4SXBQWHpISnFLTHA3d3l1Smd3U0NTaytycmRMb2x5NnNTa1pq?=
 =?utf-8?B?cjBrZ0xOM3pGU1FxbUhmb2RKNzlJL3NBdEx3UjFZd016VWlCbGpTd09IZWs3?=
 =?utf-8?B?VlRvNEJZV1hYcUxySWtaM0QzaGRiWURRbFFwWGc4RkVJaXIvZ2o5Vk9TSjZB?=
 =?utf-8?B?OEFOa1FGTy8xbDJFWVdXb0lQMTNESUtJOEZQNjg1UFBBaG43SFd0QVZCZVZv?=
 =?utf-8?B?T0RDcDVDWEVpTnVCa2tTQTVaK0ROeUJpeHVIdGYrMjVCMFlGclp2aWNYcVZl?=
 =?utf-8?B?UEViSG1aZms5WGJYQjBNSDMyK0FmMmhscDA0bmF1cXFmMHNzWWlpTXE4Tklv?=
 =?utf-8?Q?6z6U5NA86qyUIpAHtKDZt7vwf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbb6096a-5674-414b-69d1-08dc87183ff0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 17:35:40.5447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lkAQB2zasN41pW6B2+TDmvHog3x0AKT9pNPmXy7puZeuBJgmyoGdmoxIOMlN198K
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9357
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

In general thanks for looking into this, but when you don't have 
hardware to at least briefly validate your work we probably can't accept 
that.

I can see if I can get anybody looking into this, but the odds that 
somebody has time and hardware are pretty low.

Christian.

Am 07.06.24 um 16:15 schrieb Hoi Pok Wu:
> i do it because it is part of the todo list
> where the task is to remove load/unload callback
> there are only 2 drm_driver that still uses thats why
> i thought my amdgpu could test radeonsi but no, i still send it anyway
>
> regards,
> wu
>
>
> On Fri, Jun 7, 2024 at 3:51 AM Christian König <christian.koenig@amd.com> wrote:
>> Am 07.06.24 um 03:14 schrieb wu hoi pok:
>>> this patch is to remove the load callback from the kms_driver,
>>> following closly to amdgpu, radeon_driver_load_kms and devm_drm_dev_alloc
>>> are used, most of the changes here are rdev->ddev to rdev_to_drm,
>>> which maps to adev_to_drm in amdgpu. however this patch is not tested on
>>> hardware, so if you are free and have a gcn1 gcn2 card please do so.
>> What is the motivation to do that?
>>
>> When the old interface is going to be removed the patch is probably
>> justified, but in general we don't really accept any larger changes like
>> this for radeon any more.
>>
>> Especially without some testing of it.
>>
>> Regards,
>> Christian.
>>
>>> Signed-off-by: wu hoi pok <wuhoipok@gmail.com>
>>> ---
>>>    drivers/gpu/drm/radeon/atombios_encoders.c |  2 +-
>>>    drivers/gpu/drm/radeon/cik.c               | 14 ++--
>>>    drivers/gpu/drm/radeon/dce6_afmt.c         |  2 +-
>>>    drivers/gpu/drm/radeon/evergreen.c         | 12 ++--
>>>    drivers/gpu/drm/radeon/ni.c                |  2 +-
>>>    drivers/gpu/drm/radeon/r100.c              | 24 +++----
>>>    drivers/gpu/drm/radeon/r300.c              |  6 +-
>>>    drivers/gpu/drm/radeon/r420.c              |  6 +-
>>>    drivers/gpu/drm/radeon/r520.c              |  2 +-
>>>    drivers/gpu/drm/radeon/r600.c              | 12 ++--
>>>    drivers/gpu/drm/radeon/r600_cs.c           |  2 +-
>>>    drivers/gpu/drm/radeon/r600_dpm.c          |  4 +-
>>>    drivers/gpu/drm/radeon/r600_hdmi.c         |  2 +-
>>>    drivers/gpu/drm/radeon/radeon.h            | 11 +++-
>>>    drivers/gpu/drm/radeon/radeon_acpi.c       | 10 +--
>>>    drivers/gpu/drm/radeon/radeon_agp.c        |  2 +-
>>>    drivers/gpu/drm/radeon/radeon_atombios.c   |  2 +-
>>>    drivers/gpu/drm/radeon/radeon_audio.c      |  4 +-
>>>    drivers/gpu/drm/radeon/radeon_combios.c    | 12 ++--
>>>    drivers/gpu/drm/radeon/radeon_device.c     | 17 ++---
>>>    drivers/gpu/drm/radeon/radeon_display.c    | 74 +++++++++++-----------
>>>    drivers/gpu/drm/radeon/radeon_drv.c        | 27 +++++---
>>>    drivers/gpu/drm/radeon/radeon_drv.h        |  1 -
>>>    drivers/gpu/drm/radeon/radeon_fbdev.c      | 26 ++++----
>>>    drivers/gpu/drm/radeon/radeon_fence.c      |  8 +--
>>>    drivers/gpu/drm/radeon/radeon_gem.c        |  2 +-
>>>    drivers/gpu/drm/radeon/radeon_i2c.c        |  2 +-
>>>    drivers/gpu/drm/radeon/radeon_ib.c         |  2 +-
>>>    drivers/gpu/drm/radeon/radeon_irq_kms.c    | 12 ++--
>>>    drivers/gpu/drm/radeon/radeon_kms.c        | 16 ++---
>>>    drivers/gpu/drm/radeon/radeon_object.c     |  2 +-
>>>    drivers/gpu/drm/radeon/radeon_pm.c         | 20 +++---
>>>    drivers/gpu/drm/radeon/radeon_ring.c       |  2 +-
>>>    drivers/gpu/drm/radeon/radeon_ttm.c        |  6 +-
>>>    drivers/gpu/drm/radeon/rs400.c             |  6 +-
>>>    drivers/gpu/drm/radeon/rs600.c             | 14 ++--
>>>    drivers/gpu/drm/radeon/rs690.c             |  2 +-
>>>    drivers/gpu/drm/radeon/rv515.c             |  4 +-
>>>    drivers/gpu/drm/radeon/rv770.c             |  2 +-
>>>    drivers/gpu/drm/radeon/si.c                |  4 +-
>>>    40 files changed, 192 insertions(+), 188 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/radeon/atombios_encoders.c b/drivers/gpu/drm/radeon/atombios_encoders.c
>>> index 7b11674f5d45..05f34efd7fd0 100644
>>> --- a/drivers/gpu/drm/radeon/atombios_encoders.c
>>> +++ b/drivers/gpu/drm/radeon/atombios_encoders.c
>>> @@ -2179,7 +2179,7 @@ int radeon_atom_pick_dig_encoder(struct drm_encoder *encoder, int fe_idx)
>>>    void
>>>    radeon_atom_encoder_init(struct radeon_device *rdev)
>>>    {
>>> -     struct drm_device *dev = rdev->ddev;
>>> +     struct drm_device *dev = rdev_to_drm(rdev);
>>>        struct drm_encoder *encoder;
>>>
>>>        list_for_each_entry(encoder, &dev->mode_config.encoder_list, head) {
>>> diff --git a/drivers/gpu/drm/radeon/cik.c b/drivers/gpu/drm/radeon/cik.c
>>> index b5e96a8fc2c1..11a492f21157 100644
>>> --- a/drivers/gpu/drm/radeon/cik.c
>>> +++ b/drivers/gpu/drm/radeon/cik.c
>>> @@ -7585,7 +7585,7 @@ int cik_irq_process(struct radeon_device *rdev)
>>>                                        DRM_DEBUG("IH: IH event w/o asserted irq bit?\n");
>>>
>>>                                if (rdev->irq.crtc_vblank_int[0]) {
>>> -                                     drm_handle_vblank(rdev->ddev, 0);
>>> +                                     drm_handle_vblank(rdev_to_drm(rdev), 0);
>>>                                        rdev->pm.vblank_sync = true;
>>>                                        wake_up(&rdev->irq.vblank_queue);
>>>                                }
>>> @@ -7615,7 +7615,7 @@ int cik_irq_process(struct radeon_device *rdev)
>>>                                        DRM_DEBUG("IH: IH event w/o asserted irq bit?\n");
>>>
>>>                                if (rdev->irq.crtc_vblank_int[1]) {
>>> -                                     drm_handle_vblank(rdev->ddev, 1);
>>> +                                     drm_handle_vblank(rdev_to_drm(rdev), 1);
>>>                                        rdev->pm.vblank_sync = true;
>>>                                        wake_up(&rdev->irq.vblank_queue);
>>>                                }
>>> @@ -7645,7 +7645,7 @@ int cik_irq_process(struct radeon_device *rdev)
>>>                                        DRM_DEBUG("IH: IH event w/o asserted irq bit?\n");
>>>
>>>                                if (rdev->irq.crtc_vblank_int[2]) {
>>> -                                     drm_handle_vblank(rdev->ddev, 2);
>>> +                                     drm_handle_vblank(rdev_to_drm(rdev), 2);
>>>                                        rdev->pm.vblank_sync = true;
>>>                                        wake_up(&rdev->irq.vblank_queue);
>>>                                }
>>> @@ -7675,7 +7675,7 @@ int cik_irq_process(struct radeon_device *rdev)
>>>                                        DRM_DEBUG("IH: IH event w/o asserted irq bit?\n");
>>>
>>>                                if (rdev->irq.crtc_vblank_int[3]) {
>>> -                                     drm_handle_vblank(rdev->ddev, 3);
>>> +                                     drm_handle_vblank(rdev_to_drm(rdev), 3);
>>>                                        rdev->pm.vblank_sync = true;
>>>                                        wake_up(&rdev->irq.vblank_queue);
>>>                                }
>>> @@ -7705,7 +7705,7 @@ int cik_irq_process(struct radeon_device *rdev)
>>>                                        DRM_DEBUG("IH: IH event w/o asserted irq bit?\n");
>>>
>>>                                if (rdev->irq.crtc_vblank_int[4]) {
>>> -                                     drm_handle_vblank(rdev->ddev, 4);
>>> +                                     drm_handle_vblank(rdev_to_drm(rdev), 4);
>>>                                        rdev->pm.vblank_sync = true;
>>>                                        wake_up(&rdev->irq.vblank_queue);
>>>                                }
>>> @@ -7735,7 +7735,7 @@ int cik_irq_process(struct radeon_device *rdev)
>>>                                        DRM_DEBUG("IH: IH event w/o asserted irq bit?\n");
>>>
>>>                                if (rdev->irq.crtc_vblank_int[5]) {
>>> -                                     drm_handle_vblank(rdev->ddev, 5);
>>> +                                     drm_handle_vblank(rdev_to_drm(rdev), 5);
>>>                                        rdev->pm.vblank_sync = true;
>>>                                        wake_up(&rdev->irq.vblank_queue);
>>>                                }
>>> @@ -8581,7 +8581,7 @@ int cik_init(struct radeon_device *rdev)
>>>        /* Initialize surface registers */
>>>        radeon_surface_init(rdev);
>>>        /* Initialize clocks */
>>> -     radeon_get_clock_info(rdev->ddev);
>>> +     radeon_get_clock_info(rdev_to_drm(rdev));
>>>
>>>        /* Fence driver */
>>>        radeon_fence_driver_init(rdev);
>>> diff --git a/drivers/gpu/drm/radeon/dce6_afmt.c b/drivers/gpu/drm/radeon/dce6_afmt.c
>>> index 4c06f47453fd..d6ab93ed9ec4 100644
>>> --- a/drivers/gpu/drm/radeon/dce6_afmt.c
>>> +++ b/drivers/gpu/drm/radeon/dce6_afmt.c
>>> @@ -91,7 +91,7 @@ struct r600_audio_pin *dce6_audio_get_pin(struct radeon_device *rdev)
>>>                        pin = &rdev->audio.pin[i];
>>>                        pin_count = 0;
>>>
>>> -                     list_for_each_entry(encoder, &rdev->ddev->mode_config.encoder_list, head) {
>>> +                     list_for_each_entry(encoder, &rdev_to_drm(rdev)->mode_config.encoder_list, head) {
>>>                                if (radeon_encoder_is_digital(encoder)) {
>>>                                        radeon_encoder = to_radeon_encoder(encoder);
>>>                                        dig = radeon_encoder->enc_priv;
>>> diff --git a/drivers/gpu/drm/radeon/evergreen.c b/drivers/gpu/drm/radeon/evergreen.c
>>> index c634dc28e6c3..bc4ab71613a5 100644
>>> --- a/drivers/gpu/drm/radeon/evergreen.c
>>> +++ b/drivers/gpu/drm/radeon/evergreen.c
>>> @@ -1673,7 +1673,7 @@ void evergreen_pm_misc(struct radeon_device *rdev)
>>>     */
>>>    void evergreen_pm_prepare(struct radeon_device *rdev)
>>>    {
>>> -     struct drm_device *ddev = rdev->ddev;
>>> +     struct drm_device *ddev = rdev_to_drm(rdev);
>>>        struct drm_crtc *crtc;
>>>        struct radeon_crtc *radeon_crtc;
>>>        u32 tmp;
>>> @@ -1698,7 +1698,7 @@ void evergreen_pm_prepare(struct radeon_device *rdev)
>>>     */
>>>    void evergreen_pm_finish(struct radeon_device *rdev)
>>>    {
>>> -     struct drm_device *ddev = rdev->ddev;
>>> +     struct drm_device *ddev = rdev_to_drm(rdev);
>>>        struct drm_crtc *crtc;
>>>        struct radeon_crtc *radeon_crtc;
>>>        u32 tmp;
>>> @@ -1763,7 +1763,7 @@ void evergreen_hpd_set_polarity(struct radeon_device *rdev,
>>>     */
>>>    void evergreen_hpd_init(struct radeon_device *rdev)
>>>    {
>>> -     struct drm_device *dev = rdev->ddev;
>>> +     struct drm_device *dev = rdev_to_drm(rdev);
>>>        struct drm_connector *connector;
>>>        unsigned enabled = 0;
>>>        u32 tmp = DC_HPDx_CONNECTION_TIMER(0x9c4) |
>>> @@ -1804,7 +1804,7 @@ void evergreen_hpd_init(struct radeon_device *rdev)
>>>     */
>>>    void evergreen_hpd_fini(struct radeon_device *rdev)
>>>    {
>>> -     struct drm_device *dev = rdev->ddev;
>>> +     struct drm_device *dev = rdev_to_drm(rdev);
>>>        struct drm_connector *connector;
>>>        unsigned disabled = 0;
>>>
>>> @@ -4753,7 +4753,7 @@ int evergreen_irq_process(struct radeon_device *rdev)
>>>                                event_name = "vblank";
>>>
>>>                                if (rdev->irq.crtc_vblank_int[crtc_idx]) {
>>> -                                     drm_handle_vblank(rdev->ddev, crtc_idx);
>>> +                                     drm_handle_vblank(rdev_to_drm(rdev), crtc_idx);
>>>                                        rdev->pm.vblank_sync = true;
>>>                                        wake_up(&rdev->irq.vblank_queue);
>>>                                }
>>> @@ -5211,7 +5211,7 @@ int evergreen_init(struct radeon_device *rdev)
>>>        /* Initialize surface registers */
>>>        radeon_surface_init(rdev);
>>>        /* Initialize clocks */
>>> -     radeon_get_clock_info(rdev->ddev);
>>> +     radeon_get_clock_info(rdev_to_drm(rdev));
>>>        /* Fence driver */
>>>        radeon_fence_driver_init(rdev);
>>>        /* initialize AGP */
>>> diff --git a/drivers/gpu/drm/radeon/ni.c b/drivers/gpu/drm/radeon/ni.c
>>> index 77aee99e473a..3890911fe693 100644
>>> --- a/drivers/gpu/drm/radeon/ni.c
>>> +++ b/drivers/gpu/drm/radeon/ni.c
>>> @@ -2360,7 +2360,7 @@ int cayman_init(struct radeon_device *rdev)
>>>        /* Initialize surface registers */
>>>        radeon_surface_init(rdev);
>>>        /* Initialize clocks */
>>> -     radeon_get_clock_info(rdev->ddev);
>>> +     radeon_get_clock_info(rdev_to_drm(rdev));
>>>        /* Fence driver */
>>>        radeon_fence_driver_init(rdev);
>>>        /* initialize memory controller */
>>> diff --git a/drivers/gpu/drm/radeon/r100.c b/drivers/gpu/drm/radeon/r100.c
>>> index 0b1e19345f43..d7d7d23bf9a1 100644
>>> --- a/drivers/gpu/drm/radeon/r100.c
>>> +++ b/drivers/gpu/drm/radeon/r100.c
>>> @@ -459,7 +459,7 @@ void r100_pm_misc(struct radeon_device *rdev)
>>>     */
>>>    void r100_pm_prepare(struct radeon_device *rdev)
>>>    {
>>> -     struct drm_device *ddev = rdev->ddev;
>>> +     struct drm_device *ddev = rdev_to_drm(rdev);
>>>        struct drm_crtc *crtc;
>>>        struct radeon_crtc *radeon_crtc;
>>>        u32 tmp;
>>> @@ -490,7 +490,7 @@ void r100_pm_prepare(struct radeon_device *rdev)
>>>     */
>>>    void r100_pm_finish(struct radeon_device *rdev)
>>>    {
>>> -     struct drm_device *ddev = rdev->ddev;
>>> +     struct drm_device *ddev = rdev_to_drm(rdev);
>>>        struct drm_crtc *crtc;
>>>        struct radeon_crtc *radeon_crtc;
>>>        u32 tmp;
>>> @@ -603,7 +603,7 @@ void r100_hpd_set_polarity(struct radeon_device *rdev,
>>>     */
>>>    void r100_hpd_init(struct radeon_device *rdev)
>>>    {
>>> -     struct drm_device *dev = rdev->ddev;
>>> +     struct drm_device *dev = rdev_to_drm(rdev);
>>>        struct drm_connector *connector;
>>>        unsigned enable = 0;
>>>
>>> @@ -626,7 +626,7 @@ void r100_hpd_init(struct radeon_device *rdev)
>>>     */
>>>    void r100_hpd_fini(struct radeon_device *rdev)
>>>    {
>>> -     struct drm_device *dev = rdev->ddev;
>>> +     struct drm_device *dev = rdev_to_drm(rdev);
>>>        struct drm_connector *connector;
>>>        unsigned disable = 0;
>>>
>>> @@ -798,7 +798,7 @@ int r100_irq_process(struct radeon_device *rdev)
>>>                /* Vertical blank interrupts */
>>>                if (status & RADEON_CRTC_VBLANK_STAT) {
>>>                        if (rdev->irq.crtc_vblank_int[0]) {
>>> -                             drm_handle_vblank(rdev->ddev, 0);
>>> +                             drm_handle_vblank(rdev_to_drm(rdev), 0);
>>>                                rdev->pm.vblank_sync = true;
>>>                                wake_up(&rdev->irq.vblank_queue);
>>>                        }
>>> @@ -807,7 +807,7 @@ int r100_irq_process(struct radeon_device *rdev)
>>>                }
>>>                if (status & RADEON_CRTC2_VBLANK_STAT) {
>>>                        if (rdev->irq.crtc_vblank_int[1]) {
>>> -                             drm_handle_vblank(rdev->ddev, 1);
>>> +                             drm_handle_vblank(rdev_to_drm(rdev), 1);
>>>                                rdev->pm.vblank_sync = true;
>>>                                wake_up(&rdev->irq.vblank_queue);
>>>                        }
>>> @@ -1471,7 +1471,7 @@ int r100_cs_packet_parse_vline(struct radeon_cs_parser *p)
>>>        header = radeon_get_ib_value(p, h_idx);
>>>        crtc_id = radeon_get_ib_value(p, h_idx + 5);
>>>        reg = R100_CP_PACKET0_GET_REG(header);
>>> -     crtc = drm_crtc_find(p->rdev->ddev, p->filp, crtc_id);
>>> +     crtc = drm_crtc_find(rdev_to_drm(p->rdev), p->filp, crtc_id);
>>>        if (!crtc) {
>>>                DRM_ERROR("cannot find crtc %d\n", crtc_id);
>>>                return -ENOENT;
>>> @@ -3059,7 +3059,7 @@ DEFINE_SHOW_ATTRIBUTE(r100_debugfs_mc_info);
>>>    void  r100_debugfs_rbbm_init(struct radeon_device *rdev)
>>>    {
>>>    #if defined(CONFIG_DEBUG_FS)
>>> -     struct dentry *root = rdev->ddev->primary->debugfs_root;
>>> +     struct dentry *root = rdev_to_drm(rdev)->primary->debugfs_root;
>>>
>>>        debugfs_create_file("r100_rbbm_info", 0444, root, rdev,
>>>                            &r100_debugfs_rbbm_info_fops);
>>> @@ -3069,7 +3069,7 @@ void  r100_debugfs_rbbm_init(struct radeon_device *rdev)
>>>    void r100_debugfs_cp_init(struct radeon_device *rdev)
>>>    {
>>>    #if defined(CONFIG_DEBUG_FS)
>>> -     struct dentry *root = rdev->ddev->primary->debugfs_root;
>>> +     struct dentry *root = rdev_to_drm(rdev)->primary->debugfs_root;
>>>
>>>        debugfs_create_file("r100_cp_ring_info", 0444, root, rdev,
>>>                            &r100_debugfs_cp_ring_info_fops);
>>> @@ -3081,7 +3081,7 @@ void r100_debugfs_cp_init(struct radeon_device *rdev)
>>>    void  r100_debugfs_mc_info_init(struct radeon_device *rdev)
>>>    {
>>>    #if defined(CONFIG_DEBUG_FS)
>>> -     struct dentry *root = rdev->ddev->primary->debugfs_root;
>>> +     struct dentry *root = rdev_to_drm(rdev)->primary->debugfs_root;
>>>
>>>        debugfs_create_file("r100_mc_info", 0444, root, rdev,
>>>                            &r100_debugfs_mc_info_fops);
>>> @@ -3947,7 +3947,7 @@ int r100_resume(struct radeon_device *rdev)
>>>                        RREG32(R_0007C0_CP_STAT));
>>>        }
>>>        /* post */
>>> -     radeon_combios_asic_init(rdev->ddev);
>>> +     radeon_combios_asic_init(rdev_to_drm(rdev));
>>>        /* Resume clock after posting */
>>>        r100_clock_startup(rdev);
>>>        /* Initialize surface registers */
>>> @@ -4056,7 +4056,7 @@ int r100_init(struct radeon_device *rdev)
>>>        /* Set asic errata */
>>>        r100_errata(rdev);
>>>        /* Initialize clocks */
>>> -     radeon_get_clock_info(rdev->ddev);
>>> +     radeon_get_clock_info(rdev_to_drm(rdev));
>>>        /* initialize AGP */
>>>        if (rdev->flags & RADEON_IS_AGP) {
>>>                r = radeon_agp_init(rdev);
>>> diff --git a/drivers/gpu/drm/radeon/r300.c b/drivers/gpu/drm/radeon/r300.c
>>> index 1620f534f55f..05c13102a8cb 100644
>>> --- a/drivers/gpu/drm/radeon/r300.c
>>> +++ b/drivers/gpu/drm/radeon/r300.c
>>> @@ -616,7 +616,7 @@ DEFINE_SHOW_ATTRIBUTE(rv370_debugfs_pcie_gart_info);
>>>    static void rv370_debugfs_pcie_gart_info_init(struct radeon_device *rdev)
>>>    {
>>>    #if defined(CONFIG_DEBUG_FS)
>>> -     struct dentry *root = rdev->ddev->primary->debugfs_root;
>>> +     struct dentry *root = rdev_to_drm(rdev)->primary->debugfs_root;
>>>
>>>        debugfs_create_file("rv370_pcie_gart_info", 0444, root, rdev,
>>>                            &rv370_debugfs_pcie_gart_info_fops);
>>> @@ -1452,7 +1452,7 @@ int r300_resume(struct radeon_device *rdev)
>>>                        RREG32(R_0007C0_CP_STAT));
>>>        }
>>>        /* post */
>>> -     radeon_combios_asic_init(rdev->ddev);
>>> +     radeon_combios_asic_init(rdev_to_drm(rdev));
>>>        /* Resume clock after posting */
>>>        r300_clock_startup(rdev);
>>>        /* Initialize surface registers */
>>> @@ -1538,7 +1538,7 @@ int r300_init(struct radeon_device *rdev)
>>>        /* Set asic errata */
>>>        r300_errata(rdev);
>>>        /* Initialize clocks */
>>> -     radeon_get_clock_info(rdev->ddev);
>>> +     radeon_get_clock_info(rdev_to_drm(rdev));
>>>        /* initialize AGP */
>>>        if (rdev->flags & RADEON_IS_AGP) {
>>>                r = radeon_agp_init(rdev);
>>> diff --git a/drivers/gpu/drm/radeon/r420.c b/drivers/gpu/drm/radeon/r420.c
>>> index a979662eaa73..9a31cdec6415 100644
>>> --- a/drivers/gpu/drm/radeon/r420.c
>>> +++ b/drivers/gpu/drm/radeon/r420.c
>>> @@ -322,7 +322,7 @@ int r420_resume(struct radeon_device *rdev)
>>>        if (rdev->is_atom_bios) {
>>>                atom_asic_init(rdev->mode_info.atom_context);
>>>        } else {
>>> -             radeon_combios_asic_init(rdev->ddev);
>>> +             radeon_combios_asic_init(rdev_to_drm(rdev));
>>>        }
>>>        /* Resume clock after posting */
>>>        r420_clock_resume(rdev);
>>> @@ -414,7 +414,7 @@ int r420_init(struct radeon_device *rdev)
>>>                return -EINVAL;
>>>
>>>        /* Initialize clocks */
>>> -     radeon_get_clock_info(rdev->ddev);
>>> +     radeon_get_clock_info(rdev_to_drm(rdev));
>>>        /* initialize AGP */
>>>        if (rdev->flags & RADEON_IS_AGP) {
>>>                r = radeon_agp_init(rdev);
>>> @@ -493,7 +493,7 @@ DEFINE_SHOW_ATTRIBUTE(r420_debugfs_pipes_info);
>>>    void r420_debugfs_pipes_info_init(struct radeon_device *rdev)
>>>    {
>>>    #if defined(CONFIG_DEBUG_FS)
>>> -     struct dentry *root = rdev->ddev->primary->debugfs_root;
>>> +     struct dentry *root = rdev_to_drm(rdev)->primary->debugfs_root;
>>>
>>>        debugfs_create_file("r420_pipes_info", 0444, root, rdev,
>>>                            &r420_debugfs_pipes_info_fops);
>>> diff --git a/drivers/gpu/drm/radeon/r520.c b/drivers/gpu/drm/radeon/r520.c
>>> index 6cbcaa845192..08e127b3249a 100644
>>> --- a/drivers/gpu/drm/radeon/r520.c
>>> +++ b/drivers/gpu/drm/radeon/r520.c
>>> @@ -287,7 +287,7 @@ int r520_init(struct radeon_device *rdev)
>>>                atom_asic_init(rdev->mode_info.atom_context);
>>>        }
>>>        /* Initialize clocks */
>>> -     radeon_get_clock_info(rdev->ddev);
>>> +     radeon_get_clock_info(rdev_to_drm(rdev));
>>>        /* initialize AGP */
>>>        if (rdev->flags & RADEON_IS_AGP) {
>>>                r = radeon_agp_init(rdev);
>>> diff --git a/drivers/gpu/drm/radeon/r600.c b/drivers/gpu/drm/radeon/r600.c
>>> index 087d41e370fd..8b62f7faa5b9 100644
>>> --- a/drivers/gpu/drm/radeon/r600.c
>>> +++ b/drivers/gpu/drm/radeon/r600.c
>>> @@ -950,7 +950,7 @@ void r600_hpd_set_polarity(struct radeon_device *rdev,
>>>
>>>    void r600_hpd_init(struct radeon_device *rdev)
>>>    {
>>> -     struct drm_device *dev = rdev->ddev;
>>> +     struct drm_device *dev = rdev_to_drm(rdev);
>>>        struct drm_connector *connector;
>>>        unsigned enable = 0;
>>>
>>> @@ -1017,7 +1017,7 @@ void r600_hpd_init(struct radeon_device *rdev)
>>>
>>>    void r600_hpd_fini(struct radeon_device *rdev)
>>>    {
>>> -     struct drm_device *dev = rdev->ddev;
>>> +     struct drm_device *dev = rdev_to_drm(rdev);
>>>        struct drm_connector *connector;
>>>        unsigned disable = 0;
>>>
>>> @@ -3280,7 +3280,7 @@ int r600_init(struct radeon_device *rdev)
>>>        /* Initialize surface registers */
>>>        radeon_surface_init(rdev);
>>>        /* Initialize clocks */
>>> -     radeon_get_clock_info(rdev->ddev);
>>> +     radeon_get_clock_info(rdev_to_drm(rdev));
>>>        /* Fence driver */
>>>        radeon_fence_driver_init(rdev);
>>>        if (rdev->flags & RADEON_IS_AGP) {
>>> @@ -4136,7 +4136,7 @@ int r600_irq_process(struct radeon_device *rdev)
>>>                                        DRM_DEBUG("IH: D1 vblank - IH event w/o asserted irq bit?\n");
>>>
>>>                                if (rdev->irq.crtc_vblank_int[0]) {
>>> -                                     drm_handle_vblank(rdev->ddev, 0);
>>> +                                     drm_handle_vblank(rdev_to_drm(rdev), 0);
>>>                                        rdev->pm.vblank_sync = true;
>>>                                        wake_up(&rdev->irq.vblank_queue);
>>>                                }
>>> @@ -4166,7 +4166,7 @@ int r600_irq_process(struct radeon_device *rdev)
>>>                                        DRM_DEBUG("IH: D2 vblank - IH event w/o asserted irq bit?\n");
>>>
>>>                                if (rdev->irq.crtc_vblank_int[1]) {
>>> -                                     drm_handle_vblank(rdev->ddev, 1);
>>> +                                     drm_handle_vblank(rdev_to_drm(rdev), 1);
>>>                                        rdev->pm.vblank_sync = true;
>>>                                        wake_up(&rdev->irq.vblank_queue);
>>>                                }
>>> @@ -4358,7 +4358,7 @@ DEFINE_SHOW_ATTRIBUTE(r600_debugfs_mc_info);
>>>    static void r600_debugfs_mc_info_init(struct radeon_device *rdev)
>>>    {
>>>    #if defined(CONFIG_DEBUG_FS)
>>> -     struct dentry *root = rdev->ddev->primary->debugfs_root;
>>> +     struct dentry *root = rdev_to_drm(rdev)->primary->debugfs_root;
>>>
>>>        debugfs_create_file("r600_mc_info", 0444, root, rdev,
>>>                            &r600_debugfs_mc_info_fops);
>>> diff --git a/drivers/gpu/drm/radeon/r600_cs.c b/drivers/gpu/drm/radeon/r600_cs.c
>>> index 6cf54a747749..1b2d31c4d77c 100644
>>> --- a/drivers/gpu/drm/radeon/r600_cs.c
>>> +++ b/drivers/gpu/drm/radeon/r600_cs.c
>>> @@ -884,7 +884,7 @@ int r600_cs_common_vline_parse(struct radeon_cs_parser *p,
>>>        crtc_id = radeon_get_ib_value(p, h_idx + 2 + 7 + 1);
>>>        reg = R600_CP_PACKET0_GET_REG(header);
>>>
>>> -     crtc = drm_crtc_find(p->rdev->ddev, p->filp, crtc_id);
>>> +     crtc = drm_crtc_find(rdev_to_drm(p->rdev), p->filp, crtc_id);
>>>        if (!crtc) {
>>>                DRM_ERROR("cannot find crtc %d\n", crtc_id);
>>>                return -ENOENT;
>>> diff --git a/drivers/gpu/drm/radeon/r600_dpm.c b/drivers/gpu/drm/radeon/r600_dpm.c
>>> index 64980a61d38a..81d58ef667dd 100644
>>> --- a/drivers/gpu/drm/radeon/r600_dpm.c
>>> +++ b/drivers/gpu/drm/radeon/r600_dpm.c
>>> @@ -153,7 +153,7 @@ void r600_dpm_print_ps_status(struct radeon_device *rdev,
>>>
>>>    u32 r600_dpm_get_vblank_time(struct radeon_device *rdev)
>>>    {
>>> -     struct drm_device *dev = rdev->ddev;
>>> +     struct drm_device *dev = rdev_to_drm(rdev);
>>>        struct drm_crtc *crtc;
>>>        struct radeon_crtc *radeon_crtc;
>>>        u32 vblank_in_pixels;
>>> @@ -180,7 +180,7 @@ u32 r600_dpm_get_vblank_time(struct radeon_device *rdev)
>>>
>>>    u32 r600_dpm_get_vrefresh(struct radeon_device *rdev)
>>>    {
>>> -     struct drm_device *dev = rdev->ddev;
>>> +     struct drm_device *dev = rdev_to_drm(rdev);
>>>        struct drm_crtc *crtc;
>>>        struct radeon_crtc *radeon_crtc;
>>>        u32 vrefresh = 0;
>>> diff --git a/drivers/gpu/drm/radeon/r600_hdmi.c b/drivers/gpu/drm/radeon/r600_hdmi.c
>>> index f3551ebaa2f0..661f374f5f27 100644
>>> --- a/drivers/gpu/drm/radeon/r600_hdmi.c
>>> +++ b/drivers/gpu/drm/radeon/r600_hdmi.c
>>> @@ -116,7 +116,7 @@ void r600_audio_update_hdmi(struct work_struct *work)
>>>    {
>>>        struct radeon_device *rdev = container_of(work, struct radeon_device,
>>>                                                  audio_work);
>>> -     struct drm_device *dev = rdev->ddev;
>>> +     struct drm_device *dev = rdev_to_drm(rdev);
>>>        struct r600_audio_pin audio_status = r600_audio_status(rdev);
>>>        struct drm_encoder *encoder;
>>>        bool changed = false;
>>> diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
>>> index 0999c8eaae94..69bb30ced189 100644
>>> --- a/drivers/gpu/drm/radeon/radeon.h
>>> +++ b/drivers/gpu/drm/radeon/radeon.h
>>> @@ -2297,7 +2297,7 @@ typedef void (*radeon_wreg_t)(struct radeon_device*, uint32_t, uint32_t);
>>>
>>>    struct radeon_device {
>>>        struct device                   *dev;
>>> -     struct drm_device               *ddev;
>>> +     struct drm_device               ddev;
>>>        struct pci_dev                  *pdev;
>>>    #ifdef __alpha__
>>>        struct pci_controller           *hose;
>>> @@ -2440,10 +2440,13 @@ struct radeon_device {
>>>        u64 gart_pin_size;
>>>    };
>>>
>>> +static inline struct drm_device *rdev_to_drm(struct radeon_device *rdev)
>>> +{
>>> +     return &rdev->ddev;
>>> +}
>>> +
>>>    bool radeon_is_px(struct drm_device *dev);
>>>    int radeon_device_init(struct radeon_device *rdev,
>>> -                    struct drm_device *ddev,
>>> -                    struct pci_dev *pdev,
>>>                       uint32_t flags);
>>>    void radeon_device_fini(struct radeon_device *rdev);
>>>    int radeon_gpu_wait_for_idle(struct radeon_device *rdev);
>>> @@ -2818,6 +2821,8 @@ struct radeon_device *radeon_get_rdev(struct ttm_device *bdev);
>>>
>>>    /* KMS */
>>>
>>> +int radeon_driver_load_kms(struct radeon_device *dev, unsigned long flags);
>>> +
>>>    u32 radeon_get_vblank_counter_kms(struct drm_crtc *crtc);
>>>    int radeon_enable_vblank_kms(struct drm_crtc *crtc);
>>>    void radeon_disable_vblank_kms(struct drm_crtc *crtc);
>>> diff --git a/drivers/gpu/drm/radeon/radeon_acpi.c b/drivers/gpu/drm/radeon/radeon_acpi.c
>>> index 603a78e41ba5..22ce61bdfc06 100644
>>> --- a/drivers/gpu/drm/radeon/radeon_acpi.c
>>> +++ b/drivers/gpu/drm/radeon/radeon_acpi.c
>>> @@ -405,11 +405,11 @@ static int radeon_atif_handler(struct radeon_device *rdev,
>>>        if (req.pending & ATIF_DGPU_DISPLAY_EVENT) {
>>>                if ((rdev->flags & RADEON_IS_PX) &&
>>>                    radeon_atpx_dgpu_req_power_for_displays()) {
>>> -                     pm_runtime_get_sync(rdev->ddev->dev);
>>> +                     pm_runtime_get_sync(rdev_to_drm(rdev)->dev);
>>>                        /* Just fire off a uevent and let userspace tell us what to do */
>>> -                     drm_helper_hpd_irq_event(rdev->ddev);
>>> -                     pm_runtime_mark_last_busy(rdev->ddev->dev);
>>> -                     pm_runtime_put_autosuspend(rdev->ddev->dev);
>>> +                     drm_helper_hpd_irq_event(rdev_to_drm(rdev));
>>> +                     pm_runtime_mark_last_busy(rdev_to_drm(rdev)->dev);
>>> +                     pm_runtime_put_autosuspend(rdev_to_drm(rdev)->dev);
>>>                }
>>>        }
>>>        /* TODO: check other events */
>>> @@ -736,7 +736,7 @@ int radeon_acpi_init(struct radeon_device *rdev)
>>>                struct radeon_encoder *target = NULL;
>>>
>>>                /* Find the encoder controlling the brightness */
>>> -             list_for_each_entry(tmp, &rdev->ddev->mode_config.encoder_list,
>>> +             list_for_each_entry(tmp, &rdev_to_drm(rdev)->mode_config.encoder_list,
>>>                                head) {
>>>                        struct radeon_encoder *enc = to_radeon_encoder(tmp);
>>>
>>> diff --git a/drivers/gpu/drm/radeon/radeon_agp.c b/drivers/gpu/drm/radeon/radeon_agp.c
>>> index a3d749e350f9..89d7b0e9e79f 100644
>>> --- a/drivers/gpu/drm/radeon/radeon_agp.c
>>> +++ b/drivers/gpu/drm/radeon/radeon_agp.c
>>> @@ -161,7 +161,7 @@ struct radeon_agp_head *radeon_agp_head_init(struct drm_device *dev)
>>>
>>>    static int radeon_agp_head_acquire(struct radeon_device *rdev)
>>>    {
>>> -     struct drm_device *dev = rdev->ddev;
>>> +     struct drm_device *dev = rdev_to_drm(rdev);
>>>        struct pci_dev *pdev = to_pci_dev(dev->dev);
>>>
>>>        if (!rdev->agp)
>>> diff --git a/drivers/gpu/drm/radeon/radeon_atombios.c b/drivers/gpu/drm/radeon/radeon_atombios.c
>>> index 10793a433bf5..97c4e10d0550 100644
>>> --- a/drivers/gpu/drm/radeon/radeon_atombios.c
>>> +++ b/drivers/gpu/drm/radeon/radeon_atombios.c
>>> @@ -187,7 +187,7 @@ void radeon_atombios_i2c_init(struct radeon_device *rdev)
>>>
>>>                        if (i2c.valid) {
>>>                                sprintf(stmp, "0x%x", i2c.i2c_id);
>>> -                             rdev->i2c_bus[i] = radeon_i2c_create(rdev->ddev, &i2c, stmp);
>>> +                             rdev->i2c_bus[i] = radeon_i2c_create(rdev_to_drm(rdev), &i2c, stmp);
>>>                        }
>>>                        gpio = (ATOM_GPIO_I2C_ASSIGMENT *)
>>>                                ((u8 *)gpio + sizeof(ATOM_GPIO_I2C_ASSIGMENT));
>>> diff --git a/drivers/gpu/drm/radeon/radeon_audio.c b/drivers/gpu/drm/radeon/radeon_audio.c
>>> index 74753bb26d33..31f032295497 100644
>>> --- a/drivers/gpu/drm/radeon/radeon_audio.c
>>> +++ b/drivers/gpu/drm/radeon/radeon_audio.c
>>> @@ -196,7 +196,7 @@ static void radeon_audio_enable(struct radeon_device *rdev,
>>>                return;
>>>
>>>        if (rdev->mode_info.mode_config_initialized) {
>>> -             list_for_each_entry(encoder, &rdev->ddev->mode_config.encoder_list, head) {
>>> +             list_for_each_entry(encoder, &rdev_to_drm(rdev)->mode_config.encoder_list, head) {
>>>                        if (radeon_encoder_is_digital(encoder)) {
>>>                                radeon_encoder = to_radeon_encoder(encoder);
>>>                                dig = radeon_encoder->enc_priv;
>>> @@ -759,7 +759,7 @@ static int radeon_audio_component_get_eld(struct device *kdev, int port,
>>>        if (!rdev->audio.enabled || !rdev->mode_info.mode_config_initialized)
>>>                return 0;
>>>
>>> -     list_for_each_entry(encoder, &rdev->ddev->mode_config.encoder_list, head) {
>>> +     list_for_each_entry(encoder, &rdev_to_drm(rdev)->mode_config.encoder_list, head) {
>>>                if (!radeon_encoder_is_digital(encoder))
>>>                        continue;
>>>                radeon_encoder = to_radeon_encoder(encoder);
>>> diff --git a/drivers/gpu/drm/radeon/radeon_combios.c b/drivers/gpu/drm/radeon/radeon_combios.c
>>> index 6952b1273b0f..41ddc576f8f8 100644
>>> --- a/drivers/gpu/drm/radeon/radeon_combios.c
>>> +++ b/drivers/gpu/drm/radeon/radeon_combios.c
>>> @@ -372,7 +372,7 @@ bool radeon_combios_check_hardcoded_edid(struct radeon_device *rdev)
>>>        int edid_info, size;
>>>        struct edid *edid;
>>>        unsigned char *raw;
>>> -     edid_info = combios_get_table_offset(rdev->ddev, COMBIOS_HARDCODED_EDID_TABLE);
>>> +     edid_info = combios_get_table_offset(rdev_to_drm(rdev), COMBIOS_HARDCODED_EDID_TABLE);
>>>        if (!edid_info)
>>>                return false;
>>>
>>> @@ -642,7 +642,7 @@ static struct radeon_i2c_bus_rec combios_setup_i2c_bus(struct radeon_device *rde
>>>
>>>    static struct radeon_i2c_bus_rec radeon_combios_get_i2c_info_from_table(struct radeon_device *rdev)
>>>    {
>>> -     struct drm_device *dev = rdev->ddev;
>>> +     struct drm_device *dev = rdev_to_drm(rdev);
>>>        struct radeon_i2c_bus_rec i2c;
>>>        u16 offset;
>>>        u8 id, blocks, clk, data;
>>> @@ -670,7 +670,7 @@ static struct radeon_i2c_bus_rec radeon_combios_get_i2c_info_from_table(struct r
>>>
>>>    void radeon_combios_i2c_init(struct radeon_device *rdev)
>>>    {
>>> -     struct drm_device *dev = rdev->ddev;
>>> +     struct drm_device *dev = rdev_to_drm(rdev);
>>>        struct radeon_i2c_bus_rec i2c;
>>>
>>>        /* actual hw pads
>>> @@ -812,7 +812,7 @@ bool radeon_combios_get_clock_info(struct drm_device *dev)
>>>
>>>    bool radeon_combios_sideport_present(struct radeon_device *rdev)
>>>    {
>>> -     struct drm_device *dev = rdev->ddev;
>>> +     struct drm_device *dev = rdev_to_drm(rdev);
>>>        u16 igp_info;
>>>
>>>        /* sideport is AMD only */
>>> @@ -915,7 +915,7 @@ struct radeon_encoder_primary_dac *radeon_combios_get_primary_dac_info(struct
>>>    enum radeon_tv_std
>>>    radeon_combios_get_tv_info(struct radeon_device *rdev)
>>>    {
>>> -     struct drm_device *dev = rdev->ddev;
>>> +     struct drm_device *dev = rdev_to_drm(rdev);
>>>        uint16_t tv_info;
>>>        enum radeon_tv_std tv_std = TV_STD_NTSC;
>>>
>>> @@ -2637,7 +2637,7 @@ static const char *thermal_controller_names[] = {
>>>
>>>    void radeon_combios_get_power_modes(struct radeon_device *rdev)
>>>    {
>>> -     struct drm_device *dev = rdev->ddev;
>>> +     struct drm_device *dev = rdev_to_drm(rdev);
>>>        u16 offset, misc, misc2 = 0;
>>>        u8 rev, tmp;
>>>        int state_index = 0;
>>> diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
>>> index afbb3a80c0c6..36444d739b41 100644
>>> --- a/drivers/gpu/drm/radeon/radeon_device.c
>>> +++ b/drivers/gpu/drm/radeon/radeon_device.c
>>> @@ -760,7 +760,7 @@ bool radeon_boot_test_post_card(struct radeon_device *rdev)
>>>                if (rdev->is_atom_bios)
>>>                        atom_asic_init(rdev->mode_info.atom_context);
>>>                else
>>> -                     radeon_combios_asic_init(rdev->ddev);
>>> +                     radeon_combios_asic_init(rdev_to_drm(rdev));
>>>                return true;
>>>        } else {
>>>                dev_err(rdev->dev, "Card not posted and no BIOS - ignoring\n");
>>> @@ -980,7 +980,7 @@ int radeon_atombios_init(struct radeon_device *rdev)
>>>                return -ENOMEM;
>>>
>>>        rdev->mode_info.atom_card_info = atom_card_info;
>>> -     atom_card_info->dev = rdev->ddev;
>>> +     atom_card_info->dev = rdev_to_drm(rdev);
>>>        atom_card_info->reg_read = cail_reg_read;
>>>        atom_card_info->reg_write = cail_reg_write;
>>>        /* needed for iio ops */
>>> @@ -1005,7 +1005,7 @@ int radeon_atombios_init(struct radeon_device *rdev)
>>>
>>>        mutex_init(&rdev->mode_info.atom_context->mutex);
>>>        mutex_init(&rdev->mode_info.atom_context->scratch_mutex);
>>> -     radeon_atom_initialize_bios_scratch_regs(rdev->ddev);
>>> +     radeon_atom_initialize_bios_scratch_regs(rdev_to_drm(rdev));
>>>        atom_allocate_fb_scratch(rdev->mode_info.atom_context);
>>>        return 0;
>>>    }
>>> @@ -1049,7 +1049,7 @@ void radeon_atombios_fini(struct radeon_device *rdev)
>>>     */
>>>    int radeon_combios_init(struct radeon_device *rdev)
>>>    {
>>> -     radeon_combios_initialize_bios_scratch_regs(rdev->ddev);
>>> +     radeon_combios_initialize_bios_scratch_regs(rdev_to_drm(rdev));
>>>        return 0;
>>>    }
>>>
>>> @@ -1276,18 +1276,15 @@ static const struct vga_switcheroo_client_ops radeon_switcheroo_ops = {
>>>     * Called at driver startup.
>>>     */
>>>    int radeon_device_init(struct radeon_device *rdev,
>>> -                    struct drm_device *ddev,
>>> -                    struct pci_dev *pdev,
>>>                       uint32_t flags)
>>>    {
>>> +     struct pci_dev *pdev = rdev->pdev;
>>> +     struct drm_device *ddev = rdev_to_drm(rdev);
>>>        int r, i;
>>>        int dma_bits;
>>>        bool runtime = false;
>>>
>>>        rdev->shutdown = false;
>>> -     rdev->dev = &pdev->dev;
>>> -     rdev->ddev = ddev;
>>> -     rdev->pdev = pdev;
>>>        rdev->flags = flags;
>>>        rdev->family = flags & RADEON_FAMILY_MASK;
>>>        rdev->is_atom_bios = false;
>>> @@ -1847,7 +1844,7 @@ int radeon_gpu_reset(struct radeon_device *rdev)
>>>
>>>        downgrade_write(&rdev->exclusive_lock);
>>>
>>> -     drm_helper_resume_force_mode(rdev->ddev);
>>> +     drm_helper_resume_force_mode(rdev_to_drm(rdev));
>>>
>>>        /* set the power state here in case we are a PX system or headless */
>>>        if ((rdev->pm.pm_method == PM_METHOD_DPM) && rdev->pm.dpm_enabled)
>>> diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
>>> index 5f1d24d3120c..4b9473852c1f 100644
>>> --- a/drivers/gpu/drm/radeon/radeon_display.c
>>> +++ b/drivers/gpu/drm/radeon/radeon_display.c
>>> @@ -302,13 +302,13 @@ void radeon_crtc_handle_vblank(struct radeon_device *rdev, int crtc_id)
>>>        if ((radeon_use_pflipirq == 2) && ASIC_IS_DCE4(rdev))
>>>                return;
>>>
>>> -     spin_lock_irqsave(&rdev->ddev->event_lock, flags);
>>> +     spin_lock_irqsave(&rdev_to_drm(rdev)->event_lock, flags);
>>>        if (radeon_crtc->flip_status != RADEON_FLIP_SUBMITTED) {
>>>                DRM_DEBUG_DRIVER("radeon_crtc->flip_status = %d != "
>>>                                 "RADEON_FLIP_SUBMITTED(%d)\n",
>>>                                 radeon_crtc->flip_status,
>>>                                 RADEON_FLIP_SUBMITTED);
>>> -             spin_unlock_irqrestore(&rdev->ddev->event_lock, flags);
>>> +             spin_unlock_irqrestore(&rdev_to_drm(rdev)->event_lock, flags);
>>>                return;
>>>        }
>>>
>>> @@ -334,7 +334,7 @@ void radeon_crtc_handle_vblank(struct radeon_device *rdev, int crtc_id)
>>>         */
>>>        if (update_pending &&
>>>            (DRM_SCANOUTPOS_VALID &
>>> -          radeon_get_crtc_scanoutpos(rdev->ddev, crtc_id,
>>> +          radeon_get_crtc_scanoutpos(rdev_to_drm(rdev), crtc_id,
>>>                                        GET_DISTANCE_TO_VBLANKSTART,
>>>                                        &vpos, &hpos, NULL, NULL,
>>>                                        &rdev->mode_info.crtcs[crtc_id]->base.hwmode)) &&
>>> @@ -347,7 +347,7 @@ void radeon_crtc_handle_vblank(struct radeon_device *rdev, int crtc_id)
>>>                 */
>>>                update_pending = 0;
>>>        }
>>> -     spin_unlock_irqrestore(&rdev->ddev->event_lock, flags);
>>> +     spin_unlock_irqrestore(&rdev_to_drm(rdev)->event_lock, flags);
>>>        if (!update_pending)
>>>                radeon_crtc_handle_flip(rdev, crtc_id);
>>>    }
>>> @@ -370,14 +370,14 @@ void radeon_crtc_handle_flip(struct radeon_device *rdev, int crtc_id)
>>>        if (radeon_crtc == NULL)
>>>                return;
>>>
>>> -     spin_lock_irqsave(&rdev->ddev->event_lock, flags);
>>> +     spin_lock_irqsave(&rdev_to_drm(rdev)->event_lock, flags);
>>>        work = radeon_crtc->flip_work;
>>>        if (radeon_crtc->flip_status != RADEON_FLIP_SUBMITTED) {
>>>                DRM_DEBUG_DRIVER("radeon_crtc->flip_status = %d != "
>>>                                 "RADEON_FLIP_SUBMITTED(%d)\n",
>>>                                 radeon_crtc->flip_status,
>>>                                 RADEON_FLIP_SUBMITTED);
>>> -             spin_unlock_irqrestore(&rdev->ddev->event_lock, flags);
>>> +             spin_unlock_irqrestore(&rdev_to_drm(rdev)->event_lock, flags);
>>>                return;
>>>        }
>>>
>>> @@ -389,7 +389,7 @@ void radeon_crtc_handle_flip(struct radeon_device *rdev, int crtc_id)
>>>        if (work->event)
>>>                drm_crtc_send_vblank_event(&radeon_crtc->base, work->event);
>>>
>>> -     spin_unlock_irqrestore(&rdev->ddev->event_lock, flags);
>>> +     spin_unlock_irqrestore(&rdev_to_drm(rdev)->event_lock, flags);
>>>
>>>        drm_crtc_vblank_put(&radeon_crtc->base);
>>>        radeon_irq_kms_pflip_irq_put(rdev, work->crtc_id);
>>> @@ -408,7 +408,7 @@ static void radeon_flip_work_func(struct work_struct *__work)
>>>        struct radeon_flip_work *work =
>>>                container_of(__work, struct radeon_flip_work, flip_work);
>>>        struct radeon_device *rdev = work->rdev;
>>> -     struct drm_device *dev = rdev->ddev;
>>> +     struct drm_device *dev = rdev_to_drm(rdev);
>>>        struct radeon_crtc *radeon_crtc = rdev->mode_info.crtcs[work->crtc_id];
>>>
>>>        struct drm_crtc *crtc = &radeon_crtc->base;
>>> @@ -1401,7 +1401,7 @@ static int radeon_modeset_create_props(struct radeon_device *rdev)
>>>
>>>        if (rdev->is_atom_bios) {
>>>                rdev->mode_info.coherent_mode_property =
>>> -                     drm_property_create_range(rdev->ddev, 0 , "coherent", 0, 1);
>>> +                     drm_property_create_range(rdev_to_drm(rdev), 0, "coherent", 0, 1);
>>>                if (!rdev->mode_info.coherent_mode_property)
>>>                        return -ENOMEM;
>>>        }
>>> @@ -1409,57 +1409,57 @@ static int radeon_modeset_create_props(struct radeon_device *rdev)
>>>        if (!ASIC_IS_AVIVO(rdev)) {
>>>                sz = ARRAY_SIZE(radeon_tmds_pll_enum_list);
>>>                rdev->mode_info.tmds_pll_property =
>>> -                     drm_property_create_enum(rdev->ddev, 0,
>>> +                     drm_property_create_enum(rdev_to_drm(rdev), 0,
>>>                                            "tmds_pll",
>>>                                            radeon_tmds_pll_enum_list, sz);
>>>        }
>>>
>>>        rdev->mode_info.load_detect_property =
>>> -             drm_property_create_range(rdev->ddev, 0, "load detection", 0, 1);
>>> +             drm_property_create_range(rdev_to_drm(rdev), 0, "load detection", 0, 1);
>>>        if (!rdev->mode_info.load_detect_property)
>>>                return -ENOMEM;
>>>
>>> -     drm_mode_create_scaling_mode_property(rdev->ddev);
>>> +     drm_mode_create_scaling_mode_property(rdev_to_drm(rdev));
>>>
>>>        sz = ARRAY_SIZE(radeon_tv_std_enum_list);
>>>        rdev->mode_info.tv_std_property =
>>> -             drm_property_create_enum(rdev->ddev, 0,
>>> +             drm_property_create_enum(rdev_to_drm(rdev), 0,
>>>                                    "tv standard",
>>>                                    radeon_tv_std_enum_list, sz);
>>>
>>>        sz = ARRAY_SIZE(radeon_underscan_enum_list);
>>>        rdev->mode_info.underscan_property =
>>> -             drm_property_create_enum(rdev->ddev, 0,
>>> +             drm_property_create_enum(rdev_to_drm(rdev), 0,
>>>                                    "underscan",
>>>                                    radeon_underscan_enum_list, sz);
>>>
>>>        rdev->mode_info.underscan_hborder_property =
>>> -             drm_property_create_range(rdev->ddev, 0,
>>> +             drm_property_create_range(rdev_to_drm(rdev), 0,
>>>                                        "underscan hborder", 0, 128);
>>>        if (!rdev->mode_info.underscan_hborder_property)
>>>                return -ENOMEM;
>>>
>>>        rdev->mode_info.underscan_vborder_property =
>>> -             drm_property_create_range(rdev->ddev, 0,
>>> +             drm_property_create_range(rdev_to_drm(rdev), 0,
>>>                                        "underscan vborder", 0, 128);
>>>        if (!rdev->mode_info.underscan_vborder_property)
>>>                return -ENOMEM;
>>>
>>>        sz = ARRAY_SIZE(radeon_audio_enum_list);
>>>        rdev->mode_info.audio_property =
>>> -             drm_property_create_enum(rdev->ddev, 0,
>>> +             drm_property_create_enum(rdev_to_drm(rdev), 0,
>>>                                         "audio",
>>>                                         radeon_audio_enum_list, sz);
>>>
>>>        sz = ARRAY_SIZE(radeon_dither_enum_list);
>>>        rdev->mode_info.dither_property =
>>> -             drm_property_create_enum(rdev->ddev, 0,
>>> +             drm_property_create_enum(rdev_to_drm(rdev), 0,
>>>                                         "dither",
>>>                                         radeon_dither_enum_list, sz);
>>>
>>>        sz = ARRAY_SIZE(radeon_output_csc_enum_list);
>>>        rdev->mode_info.output_csc_property =
>>> -             drm_property_create_enum(rdev->ddev, 0,
>>> +             drm_property_create_enum(rdev_to_drm(rdev), 0,
>>>                                         "output_csc",
>>>                                         radeon_output_csc_enum_list, sz);
>>>
>>> @@ -1578,29 +1578,29 @@ int radeon_modeset_init(struct radeon_device *rdev)
>>>        int i;
>>>        int ret;
>>>
>>> -     drm_mode_config_init(rdev->ddev);
>>> +     drm_mode_config_init(rdev_to_drm(rdev));
>>>        rdev->mode_info.mode_config_initialized = true;
>>>
>>> -     rdev->ddev->mode_config.funcs = &radeon_mode_funcs;
>>> +     rdev_to_drm(rdev)->mode_config.funcs = &radeon_mode_funcs;
>>>
>>>        if (radeon_use_pflipirq == 2 && rdev->family >= CHIP_R600)
>>> -             rdev->ddev->mode_config.async_page_flip = true;
>>> +             rdev_to_drm(rdev)->mode_config.async_page_flip = true;
>>>
>>>        if (ASIC_IS_DCE5(rdev)) {
>>> -             rdev->ddev->mode_config.max_width = 16384;
>>> -             rdev->ddev->mode_config.max_height = 16384;
>>> +             rdev_to_drm(rdev)->mode_config.max_width = 16384;
>>> +             rdev_to_drm(rdev)->mode_config.max_height = 16384;
>>>        } else if (ASIC_IS_AVIVO(rdev)) {
>>> -             rdev->ddev->mode_config.max_width = 8192;
>>> -             rdev->ddev->mode_config.max_height = 8192;
>>> +             rdev_to_drm(rdev)->mode_config.max_width = 8192;
>>> +             rdev_to_drm(rdev)->mode_config.max_height = 8192;
>>>        } else {
>>> -             rdev->ddev->mode_config.max_width = 4096;
>>> -             rdev->ddev->mode_config.max_height = 4096;
>>> +             rdev_to_drm(rdev)->mode_config.max_width = 4096;
>>> +             rdev_to_drm(rdev)->mode_config.max_height = 4096;
>>>        }
>>>
>>> -     rdev->ddev->mode_config.preferred_depth = 24;
>>> -     rdev->ddev->mode_config.prefer_shadow = 1;
>>> +     rdev_to_drm(rdev)->mode_config.preferred_depth = 24;
>>> +     rdev_to_drm(rdev)->mode_config.prefer_shadow = 1;
>>>
>>> -     rdev->ddev->mode_config.fb_modifiers_not_supported = true;
>>> +     rdev_to_drm(rdev)->mode_config.fb_modifiers_not_supported = true;
>>>
>>>        ret = radeon_modeset_create_props(rdev);
>>>        if (ret) {
>>> @@ -1618,11 +1618,11 @@ int radeon_modeset_init(struct radeon_device *rdev)
>>>
>>>        /* allocate crtcs */
>>>        for (i = 0; i < rdev->num_crtc; i++) {
>>> -             radeon_crtc_init(rdev->ddev, i);
>>> +             radeon_crtc_init(rdev_to_drm(rdev), i);
>>>        }
>>>
>>>        /* okay we should have all the bios connectors */
>>> -     ret = radeon_setup_enc_conn(rdev->ddev);
>>> +     ret = radeon_setup_enc_conn(rdev_to_drm(rdev));
>>>        if (!ret) {
>>>                return ret;
>>>        }
>>> @@ -1639,7 +1639,7 @@ int radeon_modeset_init(struct radeon_device *rdev)
>>>        /* setup afmt */
>>>        radeon_afmt_init(rdev);
>>>
>>> -     drm_kms_helper_poll_init(rdev->ddev);
>>> +     drm_kms_helper_poll_init(rdev_to_drm(rdev));
>>>
>>>        /* do pm late init */
>>>        ret = radeon_pm_late_init(rdev);
>>> @@ -1650,11 +1650,11 @@ int radeon_modeset_init(struct radeon_device *rdev)
>>>    void radeon_modeset_fini(struct radeon_device *rdev)
>>>    {
>>>        if (rdev->mode_info.mode_config_initialized) {
>>> -             drm_kms_helper_poll_fini(rdev->ddev);
>>> +             drm_kms_helper_poll_fini(rdev_to_drm(rdev));
>>>                radeon_hpd_fini(rdev);
>>> -             drm_helper_force_disable_all(rdev->ddev);
>>> +             drm_helper_force_disable_all(rdev_to_drm(rdev));
>>>                radeon_afmt_fini(rdev);
>>> -             drm_mode_config_cleanup(rdev->ddev);
>>> +             drm_mode_config_cleanup(rdev_to_drm(rdev));
>>>                rdev->mode_info.mode_config_initialized = false;
>>>        }
>>>
>>> diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
>>> index 7bf08164140e..89941a90e17f 100644
>>> --- a/drivers/gpu/drm/radeon/radeon_drv.c
>>> +++ b/drivers/gpu/drm/radeon/radeon_drv.c
>>> @@ -259,7 +259,8 @@ static int radeon_pci_probe(struct pci_dev *pdev,
>>>                            const struct pci_device_id *ent)
>>>    {
>>>        unsigned long flags = 0;
>>> -     struct drm_device *dev;
>>> +     struct drm_device *ddev;
>>> +     struct radeon_device *rdev;
>>>        int ret;
>>>
>>>        if (!ent)
>>> @@ -300,28 +301,36 @@ static int radeon_pci_probe(struct pci_dev *pdev,
>>>        if (ret)
>>>                return ret;
>>>
>>> -     dev = drm_dev_alloc(&kms_driver, &pdev->dev);
>>> -     if (IS_ERR(dev))
>>> -             return PTR_ERR(dev);
>>> +     rdev = devm_drm_dev_alloc(&pdev->dev, &kms_driver, typeof(*rdev), ddev);
>>> +     if (IS_ERR(rdev))
>>> +             return PTR_ERR(rdev);
>>> +
>>> +     rdev->dev  = &pdev->dev;
>>> +     rdev->pdev = pdev;
>>> +     ddev = rdev_to_drm(rdev);
>>>
>>>        ret = pci_enable_device(pdev);
>>>        if (ret)
>>>                goto err_free;
>>>
>>> -     pci_set_drvdata(pdev, dev);
>>> +     pci_set_drvdata(pdev, ddev);
>>> +
>>> +     ret = radeon_driver_load_kms(rdev, flags);
>>> +     if (ret)
>>> +             goto err_agp;
>>>
>>> -     ret = drm_dev_register(dev, ent->driver_data);
>>> +     ret = drm_dev_register(ddev, flags);
>>>        if (ret)
>>>                goto err_agp;
>>>
>>> -     radeon_fbdev_setup(dev->dev_private);
>>> +     radeon_fbdev_setup(ddev->dev_private);
>>>
>>>        return 0;
>>>
>>>    err_agp:
>>>        pci_disable_device(pdev);
>>>    err_free:
>>> -     drm_dev_put(dev);
>>> +     drm_dev_put(ddev);
>>>        return ret;
>>>    }
>>>
>>> @@ -569,7 +578,7 @@ static const struct drm_ioctl_desc radeon_ioctls_kms[] = {
>>>    static const struct drm_driver kms_driver = {
>>>        .driver_features =
>>>            DRIVER_GEM | DRIVER_RENDER | DRIVER_MODESET,
>>> -     .load = radeon_driver_load_kms,
>>> +     // .load = radeon_driver_load_kms,
>>>        .open = radeon_driver_open_kms,
>>>        .postclose = radeon_driver_postclose_kms,
>>>        .unload = radeon_driver_unload_kms,
>>> diff --git a/drivers/gpu/drm/radeon/radeon_drv.h b/drivers/gpu/drm/radeon/radeon_drv.h
>>> index 02a65971d140..6c1eb75a951b 100644
>>> --- a/drivers/gpu/drm/radeon/radeon_drv.h
>>> +++ b/drivers/gpu/drm/radeon/radeon_drv.h
>>> @@ -117,7 +117,6 @@
>>>    long radeon_drm_ioctl(struct file *filp,
>>>                      unsigned int cmd, unsigned long arg);
>>>
>>> -int radeon_driver_load_kms(struct drm_device *dev, unsigned long flags);
>>>    void radeon_driver_unload_kms(struct drm_device *dev);
>>>    int radeon_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv);
>>>    void radeon_driver_postclose_kms(struct drm_device *dev,
>>> diff --git a/drivers/gpu/drm/radeon/radeon_fbdev.c b/drivers/gpu/drm/radeon/radeon_fbdev.c
>>> index 02bf25759059..fb70de29545c 100644
>>> --- a/drivers/gpu/drm/radeon/radeon_fbdev.c
>>> +++ b/drivers/gpu/drm/radeon/radeon_fbdev.c
>>> @@ -67,7 +67,7 @@ static int radeon_fbdev_create_pinned_object(struct drm_fb_helper *fb_helper,
>>>        int height = mode_cmd->height;
>>>        u32 cpp;
>>>
>>> -     info = drm_get_format_info(rdev->ddev, mode_cmd);
>>> +     info = drm_get_format_info(rdev_to_drm(rdev), mode_cmd);
>>>        cpp = info->cpp[0];
>>>
>>>        /* need to align pitch with crtc limits */
>>> @@ -148,15 +148,15 @@ static int radeon_fbdev_fb_open(struct fb_info *info, int user)
>>>        struct radeon_device *rdev = fb_helper->dev->dev_private;
>>>        int ret;
>>>
>>> -     ret = pm_runtime_get_sync(rdev->ddev->dev);
>>> +     ret = pm_runtime_get_sync(rdev_to_drm(rdev)->dev);
>>>        if (ret < 0 && ret != -EACCES)
>>>                goto err_pm_runtime_mark_last_busy;
>>>
>>>        return 0;
>>>
>>>    err_pm_runtime_mark_last_busy:
>>> -     pm_runtime_mark_last_busy(rdev->ddev->dev);
>>> -     pm_runtime_put_autosuspend(rdev->ddev->dev);
>>> +     pm_runtime_mark_last_busy(rdev_to_drm(rdev)->dev);
>>> +     pm_runtime_put_autosuspend(rdev_to_drm(rdev)->dev);
>>>        return ret;
>>>    }
>>>
>>> @@ -165,8 +165,8 @@ static int radeon_fbdev_fb_release(struct fb_info *info, int user)
>>>        struct drm_fb_helper *fb_helper = info->par;
>>>        struct radeon_device *rdev = fb_helper->dev->dev_private;
>>>
>>> -     pm_runtime_mark_last_busy(rdev->ddev->dev);
>>> -     pm_runtime_put_autosuspend(rdev->ddev->dev);
>>> +     pm_runtime_mark_last_busy(rdev_to_drm(rdev)->dev);
>>> +     pm_runtime_put_autosuspend(rdev_to_drm(rdev)->dev);
>>>
>>>        return 0;
>>>    }
>>> @@ -236,7 +236,7 @@ static int radeon_fbdev_fb_helper_fb_probe(struct drm_fb_helper *fb_helper,
>>>                ret = -ENOMEM;
>>>                goto err_radeon_fbdev_destroy_pinned_object;
>>>        }
>>> -     ret = radeon_framebuffer_init(rdev->ddev, fb, &mode_cmd, gobj);
>>> +     ret = radeon_framebuffer_init(rdev_to_drm(rdev), fb, &mode_cmd, gobj);
>>>        if (ret) {
>>>                DRM_ERROR("failed to initialize framebuffer %d\n", ret);
>>>                goto err_kfree;
>>> @@ -374,12 +374,12 @@ void radeon_fbdev_setup(struct radeon_device *rdev)
>>>        fb_helper = kzalloc(sizeof(*fb_helper), GFP_KERNEL);
>>>        if (!fb_helper)
>>>                return;
>>> -     drm_fb_helper_prepare(rdev->ddev, fb_helper, bpp_sel, &radeon_fbdev_fb_helper_funcs);
>>> +     drm_fb_helper_prepare(rdev_to_drm(rdev), fb_helper, bpp_sel, &radeon_fbdev_fb_helper_funcs);
>>>
>>> -     ret = drm_client_init(rdev->ddev, &fb_helper->client, "radeon-fbdev",
>>> +     ret = drm_client_init(rdev_to_drm(rdev), &fb_helper->client, "radeon-fbdev",
>>>                              &radeon_fbdev_client_funcs);
>>>        if (ret) {
>>> -             drm_err(rdev->ddev, "Failed to register client: %d\n", ret);
>>> +             drm_err(rdev_to_drm(rdev), "Failed to register client: %d\n", ret);
>>>                goto err_drm_client_init;
>>>        }
>>>
>>> @@ -394,13 +394,13 @@ void radeon_fbdev_setup(struct radeon_device *rdev)
>>>
>>>    void radeon_fbdev_set_suspend(struct radeon_device *rdev, int state)
>>>    {
>>> -     if (rdev->ddev->fb_helper)
>>> -             drm_fb_helper_set_suspend(rdev->ddev->fb_helper, state);
>>> +     if (rdev_to_drm(rdev)->fb_helper)
>>> +             drm_fb_helper_set_suspend(rdev_to_drm(rdev)->fb_helper, state);
>>>    }
>>>
>>>    bool radeon_fbdev_robj_is_fb(struct radeon_device *rdev, struct radeon_bo *robj)
>>>    {
>>> -     struct drm_fb_helper *fb_helper = rdev->ddev->fb_helper;
>>> +     struct drm_fb_helper *fb_helper = rdev_to_drm(rdev)->fb_helper;
>>>        struct drm_gem_object *gobj;
>>>
>>>        if (!fb_helper)
>>> diff --git a/drivers/gpu/drm/radeon/radeon_fence.c b/drivers/gpu/drm/radeon/radeon_fence.c
>>> index 4fb780d96f32..daff61586be5 100644
>>> --- a/drivers/gpu/drm/radeon/radeon_fence.c
>>> +++ b/drivers/gpu/drm/radeon/radeon_fence.c
>>> @@ -150,7 +150,7 @@ int radeon_fence_emit(struct radeon_device *rdev,
>>>                       rdev->fence_context + ring,
>>>                       seq);
>>>        radeon_fence_ring_emit(rdev, ring, *fence);
>>> -     trace_radeon_fence_emit(rdev->ddev, ring, (*fence)->seq);
>>> +     trace_radeon_fence_emit(rdev_to_drm(rdev), ring, (*fence)->seq);
>>>        radeon_fence_schedule_check(rdev, ring);
>>>        return 0;
>>>    }
>>> @@ -489,7 +489,7 @@ static long radeon_fence_wait_seq_timeout(struct radeon_device *rdev,
>>>                if (!target_seq[i])
>>>                        continue;
>>>
>>> -             trace_radeon_fence_wait_begin(rdev->ddev, i, target_seq[i]);
>>> +             trace_radeon_fence_wait_begin(rdev_to_drm(rdev), i, target_seq[i]);
>>>                radeon_irq_kms_sw_irq_get(rdev, i);
>>>        }
>>>
>>> @@ -511,7 +511,7 @@ static long radeon_fence_wait_seq_timeout(struct radeon_device *rdev,
>>>                        continue;
>>>
>>>                radeon_irq_kms_sw_irq_put(rdev, i);
>>> -             trace_radeon_fence_wait_end(rdev->ddev, i, target_seq[i]);
>>> +             trace_radeon_fence_wait_end(rdev_to_drm(rdev), i, target_seq[i]);
>>>        }
>>>
>>>        return r;
>>> @@ -995,7 +995,7 @@ DEFINE_DEBUGFS_ATTRIBUTE(radeon_debugfs_gpu_reset_fops,
>>>    void radeon_debugfs_fence_init(struct radeon_device *rdev)
>>>    {
>>>    #if defined(CONFIG_DEBUG_FS)
>>> -     struct dentry *root = rdev->ddev->primary->debugfs_root;
>>> +     struct dentry *root = rdev_to_drm(rdev)->primary->debugfs_root;
>>>
>>>        debugfs_create_file("radeon_gpu_reset", 0444, root, rdev,
>>>                            &radeon_debugfs_gpu_reset_fops);
>>> diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
>>> index 2ef201a072f1..9dd4ff09d562 100644
>>> --- a/drivers/gpu/drm/radeon/radeon_gem.c
>>> +++ b/drivers/gpu/drm/radeon/radeon_gem.c
>>> @@ -899,7 +899,7 @@ DEFINE_SHOW_ATTRIBUTE(radeon_debugfs_gem_info);
>>>    void radeon_gem_debugfs_init(struct radeon_device *rdev)
>>>    {
>>>    #if defined(CONFIG_DEBUG_FS)
>>> -     struct dentry *root = rdev->ddev->primary->debugfs_root;
>>> +     struct dentry *root = rdev_to_drm(rdev)->primary->debugfs_root;
>>>
>>>        debugfs_create_file("radeon_gem_info", 0444, root, rdev,
>>>                            &radeon_debugfs_gem_info_fops);
>>> diff --git a/drivers/gpu/drm/radeon/radeon_i2c.c b/drivers/gpu/drm/radeon/radeon_i2c.c
>>> index 3d174390a8af..1f16619ed06e 100644
>>> --- a/drivers/gpu/drm/radeon/radeon_i2c.c
>>> +++ b/drivers/gpu/drm/radeon/radeon_i2c.c
>>> @@ -1011,7 +1011,7 @@ void radeon_i2c_add(struct radeon_device *rdev,
>>>                    struct radeon_i2c_bus_rec *rec,
>>>                    const char *name)
>>>    {
>>> -     struct drm_device *dev = rdev->ddev;
>>> +     struct drm_device *dev = rdev_to_drm(rdev);
>>>        int i;
>>>
>>>        for (i = 0; i < RADEON_MAX_I2C_BUS; i++) {
>>> diff --git a/drivers/gpu/drm/radeon/radeon_ib.c b/drivers/gpu/drm/radeon/radeon_ib.c
>>> index 63d914f3414d..1aa41cc3f991 100644
>>> --- a/drivers/gpu/drm/radeon/radeon_ib.c
>>> +++ b/drivers/gpu/drm/radeon/radeon_ib.c
>>> @@ -309,7 +309,7 @@ DEFINE_SHOW_ATTRIBUTE(radeon_debugfs_sa_info);
>>>    static void radeon_debugfs_sa_init(struct radeon_device *rdev)
>>>    {
>>>    #if defined(CONFIG_DEBUG_FS)
>>> -     struct dentry *root = rdev->ddev->primary->debugfs_root;
>>> +     struct dentry *root = rdev_to_drm(rdev)->primary->debugfs_root;
>>>
>>>        debugfs_create_file("radeon_sa_info", 0444, root, rdev,
>>>                            &radeon_debugfs_sa_info_fops);
>>> diff --git a/drivers/gpu/drm/radeon/radeon_irq_kms.c b/drivers/gpu/drm/radeon/radeon_irq_kms.c
>>> index c4dda908666c..9961251b44ba 100644
>>> --- a/drivers/gpu/drm/radeon/radeon_irq_kms.c
>>> +++ b/drivers/gpu/drm/radeon/radeon_irq_kms.c
>>> @@ -80,7 +80,7 @@ static void radeon_hotplug_work_func(struct work_struct *work)
>>>    {
>>>        struct radeon_device *rdev = container_of(work, struct radeon_device,
>>>                                                  hotplug_work.work);
>>> -     struct drm_device *dev = rdev->ddev;
>>> +     struct drm_device *dev = rdev_to_drm(rdev);
>>>        struct drm_mode_config *mode_config = &dev->mode_config;
>>>        struct drm_connector *connector;
>>>
>>> @@ -101,7 +101,7 @@ static void radeon_dp_work_func(struct work_struct *work)
>>>    {
>>>        struct radeon_device *rdev = container_of(work, struct radeon_device,
>>>                                                  dp_work);
>>> -     struct drm_device *dev = rdev->ddev;
>>> +     struct drm_device *dev = rdev_to_drm(rdev);
>>>        struct drm_mode_config *mode_config = &dev->mode_config;
>>>        struct drm_connector *connector;
>>>
>>> @@ -197,7 +197,7 @@ static void radeon_driver_irq_uninstall_kms(struct drm_device *dev)
>>>
>>>    static int radeon_irq_install(struct radeon_device *rdev, int irq)
>>>    {
>>> -     struct drm_device *dev = rdev->ddev;
>>> +     struct drm_device *dev = rdev_to_drm(rdev);
>>>        int ret;
>>>
>>>        if (irq == IRQ_NOTCONNECTED)
>>> @@ -218,7 +218,7 @@ static int radeon_irq_install(struct radeon_device *rdev, int irq)
>>>
>>>    static void radeon_irq_uninstall(struct radeon_device *rdev)
>>>    {
>>> -     struct drm_device *dev = rdev->ddev;
>>> +     struct drm_device *dev = rdev_to_drm(rdev);
>>>        struct pci_dev *pdev = to_pci_dev(dev->dev);
>>>
>>>        radeon_driver_irq_uninstall_kms(dev);
>>> @@ -322,9 +322,9 @@ int radeon_irq_kms_init(struct radeon_device *rdev)
>>>        spin_lock_init(&rdev->irq.lock);
>>>
>>>        /* Disable vblank irqs aggressively for power-saving */
>>> -     rdev->ddev->vblank_disable_immediate = true;
>>> +     rdev_to_drm(rdev)->vblank_disable_immediate = true;
>>>
>>> -     r = drm_vblank_init(rdev->ddev, rdev->num_crtc);
>>> +     r = drm_vblank_init(rdev_to_drm(rdev), rdev->num_crtc);
>>>        if (r) {
>>>                return r;
>>>        }
>>> diff --git a/drivers/gpu/drm/radeon/radeon_kms.c b/drivers/gpu/drm/radeon/radeon_kms.c
>>> index a16590c6247f..171f8e9fce88 100644
>>> --- a/drivers/gpu/drm/radeon/radeon_kms.c
>>> +++ b/drivers/gpu/drm/radeon/radeon_kms.c
>>> @@ -101,24 +101,18 @@ void radeon_driver_unload_kms(struct drm_device *dev)
>>>     * (crtcs, encoders, hotplug detect, etc.).
>>>     * Returns 0 on success, error on failure.
>>>     */
>>> -int radeon_driver_load_kms(struct drm_device *dev, unsigned long flags)
>>> +int radeon_driver_load_kms(struct radeon_device *rdev, unsigned long flags)
>>>    {
>>> -     struct pci_dev *pdev = to_pci_dev(dev->dev);
>>> -     struct radeon_device *rdev;
>>> +     struct pci_dev *pdev = rdev->pdev;
>>> +     struct drm_device *dev = rdev_to_drm(rdev);
>>>        int r, acpi_status;
>>>
>>> -     rdev = kzalloc(sizeof(struct radeon_device), GFP_KERNEL);
>>> -     if (rdev == NULL) {
>>> -             return -ENOMEM;
>>> -     }
>>> -     dev->dev_private = (void *)rdev;
>>> -
>>>    #ifdef __alpha__
>>>        rdev->hose = pdev->sysdata;
>>>    #endif
>>>
>>>        if (pci_find_capability(pdev, PCI_CAP_ID_AGP))
>>> -             rdev->agp = radeon_agp_head_init(dev);
>>> +             rdev->agp = radeon_agp_head_init(rdev_to_drm(rdev));
>>>        if (rdev->agp) {
>>>                rdev->agp->agp_mtrr = arch_phys_wc_add(
>>>                        rdev->agp->agp_info.aper_base,
>>> @@ -147,7 +141,7 @@ int radeon_driver_load_kms(struct drm_device *dev, unsigned long flags)
>>>         * properly initialize the GPU MC controller and permit
>>>         * VRAM allocation
>>>         */
>>> -     r = radeon_device_init(rdev, dev, pdev, flags);
>>> +     r = radeon_device_init(rdev, flags);
>>>        if (r) {
>>>                dev_err(dev->dev, "Fatal error during GPU init\n");
>>>                goto out;
>>> diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
>>> index a955f8a2f7fe..450ff7daa46c 100644
>>> --- a/drivers/gpu/drm/radeon/radeon_object.c
>>> +++ b/drivers/gpu/drm/radeon/radeon_object.c
>>> @@ -150,7 +150,7 @@ int radeon_bo_create(struct radeon_device *rdev,
>>>        bo = kzalloc(sizeof(struct radeon_bo), GFP_KERNEL);
>>>        if (bo == NULL)
>>>                return -ENOMEM;
>>> -     drm_gem_private_object_init(rdev->ddev, &bo->tbo.base, size);
>>> +     drm_gem_private_object_init(rdev_to_drm(rdev), &bo->tbo.base, size);
>>>        bo->rdev = rdev;
>>>        bo->surface_reg = -1;
>>>        INIT_LIST_HEAD(&bo->list);
>>> diff --git a/drivers/gpu/drm/radeon/radeon_pm.c b/drivers/gpu/drm/radeon/radeon_pm.c
>>> index 2d9d9f46f243..b4fb7e70320b 100644
>>> --- a/drivers/gpu/drm/radeon/radeon_pm.c
>>> +++ b/drivers/gpu/drm/radeon/radeon_pm.c
>>> @@ -282,7 +282,7 @@ static void radeon_pm_set_clocks(struct radeon_device *rdev)
>>>
>>>        if (rdev->irq.installed) {
>>>                i = 0;
>>> -             drm_for_each_crtc(crtc, rdev->ddev) {
>>> +             drm_for_each_crtc(crtc, rdev_to_drm(rdev)) {
>>>                        if (rdev->pm.active_crtcs & (1 << i)) {
>>>                                /* This can fail if a modeset is in progress */
>>>                                if (drm_crtc_vblank_get(crtc) == 0)
>>> @@ -299,7 +299,7 @@ static void radeon_pm_set_clocks(struct radeon_device *rdev)
>>>
>>>        if (rdev->irq.installed) {
>>>                i = 0;
>>> -             drm_for_each_crtc(crtc, rdev->ddev) {
>>> +             drm_for_each_crtc(crtc, rdev_to_drm(rdev)) {
>>>                        if (rdev->pm.req_vblank & (1 << i)) {
>>>                                rdev->pm.req_vblank &= ~(1 << i);
>>>                                drm_crtc_vblank_put(crtc);
>>> @@ -671,7 +671,7 @@ static ssize_t radeon_hwmon_show_temp(struct device *dev,
>>>                                      char *buf)
>>>    {
>>>        struct radeon_device *rdev = dev_get_drvdata(dev);
>>> -     struct drm_device *ddev = rdev->ddev;
>>> +     struct drm_device *ddev = rdev_to_drm(rdev);
>>>        int temp;
>>>
>>>        /* Can't get temperature when the card is off */
>>> @@ -715,7 +715,7 @@ static ssize_t radeon_hwmon_show_sclk(struct device *dev,
>>>                                      struct device_attribute *attr, char *buf)
>>>    {
>>>        struct radeon_device *rdev = dev_get_drvdata(dev);
>>> -     struct drm_device *ddev = rdev->ddev;
>>> +     struct drm_device *ddev = rdev_to_drm(rdev);
>>>        u32 sclk = 0;
>>>
>>>        /* Can't get clock frequency when the card is off */
>>> @@ -740,7 +740,7 @@ static ssize_t radeon_hwmon_show_vddc(struct device *dev,
>>>                                      struct device_attribute *attr, char *buf)
>>>    {
>>>        struct radeon_device *rdev = dev_get_drvdata(dev);
>>> -     struct drm_device *ddev = rdev->ddev;
>>> +     struct drm_device *ddev = rdev_to_drm(rdev);
>>>        u16 vddc = 0;
>>>
>>>        /* Can't get vddc when the card is off */
>>> @@ -1692,7 +1692,7 @@ void radeon_pm_fini(struct radeon_device *rdev)
>>>
>>>    static void radeon_pm_compute_clocks_old(struct radeon_device *rdev)
>>>    {
>>> -     struct drm_device *ddev = rdev->ddev;
>>> +     struct drm_device *ddev = rdev_to_drm(rdev);
>>>        struct drm_crtc *crtc;
>>>        struct radeon_crtc *radeon_crtc;
>>>
>>> @@ -1765,7 +1765,7 @@ static void radeon_pm_compute_clocks_old(struct radeon_device *rdev)
>>>
>>>    static void radeon_pm_compute_clocks_dpm(struct radeon_device *rdev)
>>>    {
>>> -     struct drm_device *ddev = rdev->ddev;
>>> +     struct drm_device *ddev = rdev_to_drm(rdev);
>>>        struct drm_crtc *crtc;
>>>        struct radeon_crtc *radeon_crtc;
>>>        struct radeon_connector *radeon_connector;
>>> @@ -1826,7 +1826,7 @@ static bool radeon_pm_in_vbl(struct radeon_device *rdev)
>>>         */
>>>        for (crtc = 0; (crtc < rdev->num_crtc) && in_vbl; crtc++) {
>>>                if (rdev->pm.active_crtcs & (1 << crtc)) {
>>> -                     vbl_status = radeon_get_crtc_scanoutpos(rdev->ddev,
>>> +                     vbl_status = radeon_get_crtc_scanoutpos(rdev_to_drm(rdev),
>>>                                                                crtc,
>>>                                                                USE_REAL_VBLANKSTART,
>>>                                                                &vpos, &hpos, NULL, NULL,
>>> @@ -1918,7 +1918,7 @@ static void radeon_dynpm_idle_work_handler(struct work_struct *work)
>>>    static int radeon_debugfs_pm_info_show(struct seq_file *m, void *unused)
>>>    {
>>>        struct radeon_device *rdev = m->private;
>>> -     struct drm_device *ddev = rdev->ddev;
>>> +     struct drm_device *ddev = rdev_to_drm(rdev);
>>>
>>>        if  ((rdev->flags & RADEON_IS_PX) &&
>>>             (ddev->switch_power_state != DRM_SWITCH_POWER_ON)) {
>>> @@ -1955,7 +1955,7 @@ DEFINE_SHOW_ATTRIBUTE(radeon_debugfs_pm_info);
>>>    static void radeon_debugfs_pm_init(struct radeon_device *rdev)
>>>    {
>>>    #if defined(CONFIG_DEBUG_FS)
>>> -     struct dentry *root = rdev->ddev->primary->debugfs_root;
>>> +     struct dentry *root = rdev_to_drm(rdev)->primary->debugfs_root;
>>>
>>>        debugfs_create_file("radeon_pm_info", 0444, root, rdev,
>>>                            &radeon_debugfs_pm_info_fops);
>>> diff --git a/drivers/gpu/drm/radeon/radeon_ring.c b/drivers/gpu/drm/radeon/radeon_ring.c
>>> index 8d1d458286a8..581ae20c46e4 100644
>>> --- a/drivers/gpu/drm/radeon/radeon_ring.c
>>> +++ b/drivers/gpu/drm/radeon/radeon_ring.c
>>> @@ -550,7 +550,7 @@ static void radeon_debugfs_ring_init(struct radeon_device *rdev, struct radeon_r
>>>    {
>>>    #if defined(CONFIG_DEBUG_FS)
>>>        const char *ring_name = radeon_debugfs_ring_idx_to_name(ring->idx);
>>> -     struct dentry *root = rdev->ddev->primary->debugfs_root;
>>> +     struct dentry *root = rdev_to_drm(rdev)->primary->debugfs_root;
>>>
>>>        if (ring_name)
>>>                debugfs_create_file(ring_name, 0444, root, ring,
>>> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
>>> index 5c65b6dfb99a..69d0c12fa419 100644
>>> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
>>> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
>>> @@ -682,8 +682,8 @@ int radeon_ttm_init(struct radeon_device *rdev)
>>>
>>>        /* No others user of address space so set it to 0 */
>>>        r = ttm_device_init(&rdev->mman.bdev, &radeon_bo_driver, rdev->dev,
>>> -                            rdev->ddev->anon_inode->i_mapping,
>>> -                            rdev->ddev->vma_offset_manager,
>>> +                            rdev_to_drm(rdev)->anon_inode->i_mapping,
>>> +                            rdev_to_drm(rdev)->vma_offset_manager,
>>>                               rdev->need_swiotlb,
>>>                               dma_addressing_limited(&rdev->pdev->dev));
>>>        if (r) {
>>> @@ -890,7 +890,7 @@ static const struct file_operations radeon_ttm_gtt_fops = {
>>>    static void radeon_ttm_debugfs_init(struct radeon_device *rdev)
>>>    {
>>>    #if defined(CONFIG_DEBUG_FS)
>>> -     struct drm_minor *minor = rdev->ddev->primary;
>>> +     struct drm_minor *minor = rdev_to_drm(rdev)->primary;
>>>        struct dentry *root = minor->debugfs_root;
>>>
>>>        debugfs_create_file("radeon_vram", 0444, root, rdev,
>>> diff --git a/drivers/gpu/drm/radeon/rs400.c b/drivers/gpu/drm/radeon/rs400.c
>>> index d4d1501e6576..d6c18fd740ec 100644
>>> --- a/drivers/gpu/drm/radeon/rs400.c
>>> +++ b/drivers/gpu/drm/radeon/rs400.c
>>> @@ -379,7 +379,7 @@ DEFINE_SHOW_ATTRIBUTE(rs400_debugfs_gart_info);
>>>    static void rs400_debugfs_pcie_gart_info_init(struct radeon_device *rdev)
>>>    {
>>>    #if defined(CONFIG_DEBUG_FS)
>>> -     struct dentry *root = rdev->ddev->primary->debugfs_root;
>>> +     struct dentry *root = rdev_to_drm(rdev)->primary->debugfs_root;
>>>
>>>        debugfs_create_file("rs400_gart_info", 0444, root, rdev,
>>>                            &rs400_debugfs_gart_info_fops);
>>> @@ -474,7 +474,7 @@ int rs400_resume(struct radeon_device *rdev)
>>>                        RREG32(R_0007C0_CP_STAT));
>>>        }
>>>        /* post */
>>> -     radeon_combios_asic_init(rdev->ddev);
>>> +     radeon_combios_asic_init(rdev_to_drm(rdev));
>>>        /* Resume clock after posting */
>>>        r300_clock_startup(rdev);
>>>        /* Initialize surface registers */
>>> @@ -552,7 +552,7 @@ int rs400_init(struct radeon_device *rdev)
>>>                return -EINVAL;
>>>
>>>        /* Initialize clocks */
>>> -     radeon_get_clock_info(rdev->ddev);
>>> +     radeon_get_clock_info(rdev_to_drm(rdev));
>>>        /* initialize memory controller */
>>>        rs400_mc_init(rdev);
>>>        /* Fence driver */
>>> diff --git a/drivers/gpu/drm/radeon/rs600.c b/drivers/gpu/drm/radeon/rs600.c
>>> index 5c162778899b..88c8e91ea651 100644
>>> --- a/drivers/gpu/drm/radeon/rs600.c
>>> +++ b/drivers/gpu/drm/radeon/rs600.c
>>> @@ -321,7 +321,7 @@ void rs600_pm_misc(struct radeon_device *rdev)
>>>
>>>    void rs600_pm_prepare(struct radeon_device *rdev)
>>>    {
>>> -     struct drm_device *ddev = rdev->ddev;
>>> +     struct drm_device *ddev = rdev_to_drm(rdev);
>>>        struct drm_crtc *crtc;
>>>        struct radeon_crtc *radeon_crtc;
>>>        u32 tmp;
>>> @@ -339,7 +339,7 @@ void rs600_pm_prepare(struct radeon_device *rdev)
>>>
>>>    void rs600_pm_finish(struct radeon_device *rdev)
>>>    {
>>> -     struct drm_device *ddev = rdev->ddev;
>>> +     struct drm_device *ddev = rdev_to_drm(rdev);
>>>        struct drm_crtc *crtc;
>>>        struct radeon_crtc *radeon_crtc;
>>>        u32 tmp;
>>> @@ -408,7 +408,7 @@ void rs600_hpd_set_polarity(struct radeon_device *rdev,
>>>
>>>    void rs600_hpd_init(struct radeon_device *rdev)
>>>    {
>>> -     struct drm_device *dev = rdev->ddev;
>>> +     struct drm_device *dev = rdev_to_drm(rdev);
>>>        struct drm_connector *connector;
>>>        unsigned enable = 0;
>>>
>>> @@ -435,7 +435,7 @@ void rs600_hpd_init(struct radeon_device *rdev)
>>>
>>>    void rs600_hpd_fini(struct radeon_device *rdev)
>>>    {
>>> -     struct drm_device *dev = rdev->ddev;
>>> +     struct drm_device *dev = rdev_to_drm(rdev);
>>>        struct drm_connector *connector;
>>>        unsigned disable = 0;
>>>
>>> @@ -797,7 +797,7 @@ int rs600_irq_process(struct radeon_device *rdev)
>>>                /* Vertical blank interrupts */
>>>                if (G_007EDC_LB_D1_VBLANK_INTERRUPT(rdev->irq.stat_regs.r500.disp_int)) {
>>>                        if (rdev->irq.crtc_vblank_int[0]) {
>>> -                             drm_handle_vblank(rdev->ddev, 0);
>>> +                             drm_handle_vblank(rdev_to_drm(rdev), 0);
>>>                                rdev->pm.vblank_sync = true;
>>>                                wake_up(&rdev->irq.vblank_queue);
>>>                        }
>>> @@ -806,7 +806,7 @@ int rs600_irq_process(struct radeon_device *rdev)
>>>                }
>>>                if (G_007EDC_LB_D2_VBLANK_INTERRUPT(rdev->irq.stat_regs.r500.disp_int)) {
>>>                        if (rdev->irq.crtc_vblank_int[1]) {
>>> -                             drm_handle_vblank(rdev->ddev, 1);
>>> +                             drm_handle_vblank(rdev_to_drm(rdev), 1);
>>>                                rdev->pm.vblank_sync = true;
>>>                                wake_up(&rdev->irq.vblank_queue);
>>>                        }
>>> @@ -1133,7 +1133,7 @@ int rs600_init(struct radeon_device *rdev)
>>>                return -EINVAL;
>>>
>>>        /* Initialize clocks */
>>> -     radeon_get_clock_info(rdev->ddev);
>>> +     radeon_get_clock_info(rdev_to_drm(rdev));
>>>        /* initialize memory controller */
>>>        rs600_mc_init(rdev);
>>>        r100_debugfs_rbbm_init(rdev);
>>> diff --git a/drivers/gpu/drm/radeon/rs690.c b/drivers/gpu/drm/radeon/rs690.c
>>> index 14fb0819b8c1..016eb4992803 100644
>>> --- a/drivers/gpu/drm/radeon/rs690.c
>>> +++ b/drivers/gpu/drm/radeon/rs690.c
>>> @@ -845,7 +845,7 @@ int rs690_init(struct radeon_device *rdev)
>>>                return -EINVAL;
>>>
>>>        /* Initialize clocks */
>>> -     radeon_get_clock_info(rdev->ddev);
>>> +     radeon_get_clock_info(rdev_to_drm(rdev));
>>>        /* initialize memory controller */
>>>        rs690_mc_init(rdev);
>>>        rv515_debugfs(rdev);
>>> diff --git a/drivers/gpu/drm/radeon/rv515.c b/drivers/gpu/drm/radeon/rv515.c
>>> index bbc6ccabf788..1b4dfb645585 100644
>>> --- a/drivers/gpu/drm/radeon/rv515.c
>>> +++ b/drivers/gpu/drm/radeon/rv515.c
>>> @@ -255,7 +255,7 @@ DEFINE_SHOW_ATTRIBUTE(rv515_debugfs_ga_info);
>>>    void rv515_debugfs(struct radeon_device *rdev)
>>>    {
>>>    #if defined(CONFIG_DEBUG_FS)
>>> -     struct dentry *root = rdev->ddev->primary->debugfs_root;
>>> +     struct dentry *root = rdev_to_drm(rdev)->primary->debugfs_root;
>>>
>>>        debugfs_create_file("rv515_pipes_info", 0444, root, rdev,
>>>                            &rv515_debugfs_pipes_info_fops);
>>> @@ -636,7 +636,7 @@ int rv515_init(struct radeon_device *rdev)
>>>        if (radeon_boot_test_post_card(rdev) == false)
>>>                return -EINVAL;
>>>        /* Initialize clocks */
>>> -     radeon_get_clock_info(rdev->ddev);
>>> +     radeon_get_clock_info(rdev_to_drm(rdev));
>>>        /* initialize AGP */
>>>        if (rdev->flags & RADEON_IS_AGP) {
>>>                r = radeon_agp_init(rdev);
>>> diff --git a/drivers/gpu/drm/radeon/rv770.c b/drivers/gpu/drm/radeon/rv770.c
>>> index 9ce12fa3c356..7d4b0bf59109 100644
>>> --- a/drivers/gpu/drm/radeon/rv770.c
>>> +++ b/drivers/gpu/drm/radeon/rv770.c
>>> @@ -1935,7 +1935,7 @@ int rv770_init(struct radeon_device *rdev)
>>>        /* Initialize surface registers */
>>>        radeon_surface_init(rdev);
>>>        /* Initialize clocks */
>>> -     radeon_get_clock_info(rdev->ddev);
>>> +     radeon_get_clock_info(rdev_to_drm(rdev));
>>>        /* Fence driver */
>>>        radeon_fence_driver_init(rdev);
>>>        /* initialize AGP */
>>> diff --git a/drivers/gpu/drm/radeon/si.c b/drivers/gpu/drm/radeon/si.c
>>> index 15759c8ca5b7..6c95575ce109 100644
>>> --- a/drivers/gpu/drm/radeon/si.c
>>> +++ b/drivers/gpu/drm/radeon/si.c
>>> @@ -6277,7 +6277,7 @@ int si_irq_process(struct radeon_device *rdev)
>>>                                event_name = "vblank";
>>>
>>>                                if (rdev->irq.crtc_vblank_int[crtc_idx]) {
>>> -                                     drm_handle_vblank(rdev->ddev, crtc_idx);
>>> +                                     drm_handle_vblank(rdev_to_drm(rdev), crtc_idx);
>>>                                        rdev->pm.vblank_sync = true;
>>>                                        wake_up(&rdev->irq.vblank_queue);
>>>                                }
>>> @@ -6839,7 +6839,7 @@ int si_init(struct radeon_device *rdev)
>>>        /* Initialize surface registers */
>>>        radeon_surface_init(rdev);
>>>        /* Initialize clocks */
>>> -     radeon_get_clock_info(rdev->ddev);
>>> +     radeon_get_clock_info(rdev_to_drm(rdev));
>>>
>>>        /* Fence driver */
>>>        radeon_fence_driver_init(rdev);

