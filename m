Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC07531F33
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 01:25:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2D4B10E5B2;
	Mon, 23 May 2022 23:25:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2080.outbound.protection.outlook.com [40.107.94.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55F0E10E5B2;
 Mon, 23 May 2022 23:25:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QPeX88uepCyPx2imyRxa/4lwcghGGGlrwtpIZw5zcWlGFgwsUPQQlAYnXESGPv+0TXKpzkLMhD+7SRTzzfv8CJWpwubip3BEqLoxhIkX8CYqzsTat3P8Z+mqw1Tcc4HGhTrubN/pGiJM3piPKPP5yAB1iVHO6Ufx4k87RvRtYy5d2ddSrn0SfpmIqQvQxY6aHnJBC5JUxesSmHjSyCUPuZxcPnxGta7edtzYp4WeLORqAVyEZi9JmZsmRG1qdfnKW/TS44MiSy1/uYcMffF/y3YvVntM4K+49pULFOVK3CWUYPVph1FGLPQ1DutFo6On+MBQhwOP2w49OqzxkajD1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VYVRXNP6jWK+N3Ui8L0FpA7wJ70ehdGppE4vSpo3Tzw=;
 b=V0yONSh2mZ/HIkl09VQsSZKonSW5Q2b+dJwqdbfCweC9tdAK76aVVlDQEgzEv9YgwhYIF4esWv3ekB/Op4ba3CvlSkaeblVN5X6g1Fe5l2pbqy/s77Sa9fdxDM1QWsjSc9xTUQ78N4SWu0Pi0bo1PAMLEmSpbJJhhDKLrASDq+nJ2ewp+P/j6m8urXlbR6Z49b6c0bIo7LIl9whvrVduhTVfUD1fewUSkVA7fKlNvRVP8UC/8egLrvMIIOWnhT9yIARxl4l81bMu6EaxBVvG4gMDlVS/yuHs4PmvuYgfJtCnuqwNouMnhst+pVPWcP2c/NK/ShN5zieXjvKU8vyE6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VYVRXNP6jWK+N3Ui8L0FpA7wJ70ehdGppE4vSpo3Tzw=;
 b=cvGVEKnnIiYDr3PDYS4tPAHcwcodvmdYkTbMvld//1lrDz202ZM72cG1PIJYW0ItAzWeE8GVodo84Wh9sVVFyLZ7/+Yaps5linfo5wi80p91b1Eu8FOa8x1laOS1pwty0g9bcYSpxYClUKGjhCz5q/L87GUVXgH0yiPRrJKyH5JhwLGqZXs4tUuh2LwvrpIZbro+4Dkb0fljtl9pS+IXCHy2fhx/DyJFwurZfROmuDeZe6BerY3lGFeU5bbmGS0nelK+CjgkTVOVw/kLXgFwF3awU4N0NPoKu8T3DB/tnqrzYo4ElLAWu3AGobfdhpwrGMWgPN58/0KKn1i6aSGH0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2763.namprd12.prod.outlook.com (2603:10b6:5:48::16) by
 IA1PR12MB6627.namprd12.prod.outlook.com (2603:10b6:208:3a1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.23; Mon, 23 May
 2022 23:25:08 +0000
Received: from DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::8d18:7673:ce09:c538]) by DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::8d18:7673:ce09:c538%5]) with mapi id 15.20.5273.023; Mon, 23 May 2022
 23:25:07 +0000
Content-Type: multipart/alternative;
 boundary="------------oHAqtxv0PhQ9UbMO5ubwLj97"
Message-ID: <c3741f32-87f8-5c7b-b505-4c3213774436@nvidia.com>
Date: Mon, 23 May 2022 18:25:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 09/14] ACPI: video: Make backlight class device
 registration a separate step
Content-Language: en-US
From: Daniel Dadap <ddadap@nvidia.com>
To: Hans de Goede <hdegoede@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Xinhui <Xinhui.Pan@amd.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Mark Gross <markgross@kernel.org>, Andy Shevchenko <andy@kernel.org>
References: <20220517152331.16217-1-hdegoede@redhat.com>
 <20220517152331.16217-10-hdegoede@redhat.com>
 <80fa1ee5-6204-6178-e7e2-ac98038cd8d8@nvidia.com>
In-Reply-To: <80fa1ee5-6204-6178-e7e2-ac98038cd8d8@nvidia.com>
X-ClientProxiedBy: DM6PR02CA0068.namprd02.prod.outlook.com
 (2603:10b6:5:177::45) To DM6PR12MB2763.namprd12.prod.outlook.com
 (2603:10b6:5:48::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef3c02a6-8fc5-4445-62fe-08da3d137957
X-MS-TrafficTypeDiagnostic: IA1PR12MB6627:EE_
X-Microsoft-Antispam-PRVS: <IA1PR12MB6627545D5C47062F190083D4BCD49@IA1PR12MB6627.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A68AsJiJzbXicy6S2VRKltBYYOo9OFY3NwI4KlIZS/jxe3rqIIAHw0ThOUrMOfOLAUkRCP8JU/yk8vP+9JOlJ7DlJ61Jl4Qin4+k+Dmcd1uMYlvu0RFRybTVo0Yle3dzV0x7UvcQGu2EZ4fOir2//ut8Y20zI+XMx37zUvKZNO1l32zo2r033XpCqpeEl2E7Pe/TueYJoZdf3kaB72WgD7NrPVK3cegRalGd6hGVA9GEucXGf3fP2wYO2ISDi88+aUbA8YS+vWTbc7JiO8QVnsAsTXghFFPcpLyi2a4U8AY83iDfvQnHU3JN+PjXBdtqY+6I9FV5oNbrNSK9GyoHMTjk9yPntSg/FMT1oY5md63efOrASxQ9rlFDI8/3DGWfRpRiO3u1EpUR6ORnasNO/MVLhmMzHYGSqw1a1ZgMjqjEAVxWmI7+USZ0OE+7z9SAkklD04BZQ3523//lceMjSb6eU6KTYEnybbk2TpfLe7xwRZUD6DonkGXGyeStywWIJnVHJh0EtDGc2vJp9vh5tkjTv77a2/ZV+AqlUhYQ9vk2PXrnCmbS3NxB9xWTj/AXAymyUS/+Jl9zPm8s76498i6kGJVXHf84VjMU311I6YrKZq+H5lHnfazkzrVYFo1PljNrrRdQw5oxC0qlj1kdZQlMWlnc3zY+NBS7jli/U8d8EH3jtTsclbr5eBg6JyEmw2bvj9kbwAe9NhfMsqOWBJY2uq+Lks4KClwzwik9lXAinhN9f0eMkDUO9pRvBXwZGEbgN++lIGu8mWuROlAjFBYDaZvI1si0zvwTBkUiJnhIfFDQz9vDwT6jSxIFR7SIzzjkOOYYZfDfi8U0h/63Pw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2763.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(36756003)(31686004)(2906002)(54906003)(6506007)(316002)(166002)(33964004)(53546011)(38100700002)(16799955002)(921005)(110136005)(508600001)(30864003)(6666004)(8676002)(66946007)(66476007)(4326008)(83380400001)(66556008)(31696002)(86362001)(5660300002)(186003)(966005)(2616005)(6486002)(8936002)(6512007)(7416002)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnJELzlMUVhHSzY4a1dYSkdjNDhvRjFRbXB6UjUrQTdNSDYwVnl2a3l5VjNh?=
 =?utf-8?B?SG9hbmFPSWcvcXJkTkQ4K05UcFUra2RBbFhlZjZocTM0MzlLYUc4eGFDM3dL?=
 =?utf-8?B?V0Q2UkVVOUZNWkZTZ0lza1JjbkovUjM3bTVVcEVWVS9PSXVnNkpobmtPU1NM?=
 =?utf-8?B?NXJEZkNNU3FJOWRYSTZVMHhrY25YcW5WdkVBTGM1N09hNlB6K2ZSZzcwWmZM?=
 =?utf-8?B?T0VrSVp1Wnk4dFNaTmR3RUJHbHEwS0NBUGUwVXltZUxWMTEySUo0L05hVkVo?=
 =?utf-8?B?bDFhZi9oMUlHMk9vSmN2aThlWCsyMVZoYko2R3V2dU1ZQi9MbXl4akpNdlB3?=
 =?utf-8?B?ZlJLTkg0QnJlcHV2cGlEWmltS2p3cEtOODFIazQrNkJncTA1MjI3LzNuMHZM?=
 =?utf-8?B?d1prK0lMT0NiYk9hcElDT2RtYUZSWmFIbHNXVWVJU2UyVThlaXRXS3F2aGR6?=
 =?utf-8?B?RkNEQk5EMUJES0t0TndyU0xhMEFKL2ZMaXpuQStpc2JGRkozaUFBbnA2alh1?=
 =?utf-8?B?ODgvSXV3UDlDaWZPc250andMbENtV1lndi9ZNUlkN01VZGo3ZVBhVi8vWnRI?=
 =?utf-8?B?QVRYTjAxRGJqYkpXaVlRbzl5OW53RlJJMWgvUFI3VGNBRTY0cVdCZnlCdFlF?=
 =?utf-8?B?ZDZQV3QzSkovRGhVUXIvbElySzZzYkwwOStKTkI4Z0lDdFEybit2bTFvdEJh?=
 =?utf-8?B?VUQ5bVRhU080cGRPVGpiQU5SSFNZbHpXVTFqeld3cDMzMGVGSmVDNHpGWERp?=
 =?utf-8?B?UTg5T0wzK0UxNDA1Qld6WkVnd042blFLS3BacDJiN1M5V1VXRGVqc0lvbVMx?=
 =?utf-8?B?ZzZEVklBTXNBN3JqUW4yNkgxVmxXdHBpR2NVMXJyQWJlMmVoQndmVm5nR1Bi?=
 =?utf-8?B?M09HeHliOGJydE5xZDdSNlNqVk0rZVJjMTNTUldqRURuVC9QY0tuOUNHbncr?=
 =?utf-8?B?WXdXTnZieUV2dGxnU3BiTTg0MGdnbUJ6WXgwc2xnOXZkUEJpZWpmam8yblNv?=
 =?utf-8?B?MkMvUThPQTlFY1VCd1BkM2hKNDR4Uk81K1AzUHJXRnhlZ3hFbTFmcC84NHcy?=
 =?utf-8?B?UUFNUVdXUGlEOE5tSXdWd0tJcllOaG90ZmZLM0ViM1ZWcDMwL3VWQW0zcjZz?=
 =?utf-8?B?b0d1eUpDak9oNzVMWjFJWU1KeHZJK2pwVzY1aFVET09WRXpmRWlPRUE5OVln?=
 =?utf-8?B?MmxRbElqMGx3bTh2N2ZNL0NoMDFDMWJCL2xwcko1ZDdmY05UNU1oM0dHVTRz?=
 =?utf-8?B?c2NzNnRjMEYweG5WdXlrTXFlOCs5TFRWZ2NJWXI2WmM4a1l4eWNYSkMwWjhm?=
 =?utf-8?B?WE90dkpTZ1dORnMzSG14Mis0UHdzeXRBU0h1RjlwNGIzT1l6SllZVmIyRDcz?=
 =?utf-8?B?bmZ3ZUFaSXZXZTJDVjdFWVp3VkdxUzQ2aHAwZHh6SkpLSVdmRjIyLzJEWTZK?=
 =?utf-8?B?S0dBNEY2WHQrajVtd2RSRkxwaGJ0WFk5eGhScTJRWllYdUhiaHZrc1RwdDFN?=
 =?utf-8?B?bE5hZnY4NzYxVjFzMkVWbHZmcytJNitKci9lRWVyWm5SdmRsNEo2ckRJb0ha?=
 =?utf-8?B?NlVtbDYrWVdjbE1RazBBS1FEVm8rWTVjNzZ4d0tVazFYOVZNWWdSaFkwT25C?=
 =?utf-8?B?WlU1T2FoSEZjK1hpd1BObmNlNjZHeU9Ba0FydXcwL2VOTXc1UUFqNi9TQjA2?=
 =?utf-8?B?T09QWHcreFovNWFpak1VZzlQamVUVno4UTZ0Y1pFSnZSUWxsSjYreVJOQVNB?=
 =?utf-8?B?aUVsYTVyY1g3Mm0wbkFhQnBaWGhWWGRpYWw2WGtQN2NqZWtUYWM0bGVwb1Vw?=
 =?utf-8?B?R3FMQllobUxRb1hJR052cVg5Q0xxeUc4MUp6RGFGM0Z2bDNkcElGUDJLUmpN?=
 =?utf-8?B?Z255VmtCWlg5ZXVyTVpKcUU2UzEwNzExUTNOQW1qZGllV3Uyem1Ncy9pM2xp?=
 =?utf-8?B?eGtNZU5jNE5MMjdHMEVZMUFyblVxL1dxNHBuWGorQmFub2duSGlHVm9hRlA4?=
 =?utf-8?B?eFhTaitkZjhYS1FOeUd5bXNvd1BBQ1ZPbHpPL0V5TlRJQlVSaWtsb25aSzFQ?=
 =?utf-8?B?Q2VsenN3bEtXUThOK0ZNWXdxaU1uS0QwNW1uenhGakZzMmFic1Vqa0dsd2xG?=
 =?utf-8?B?SjVNZVREcGhkYmJvamhrS3pCTWU4WDVEbGdiZitWcWVkQUZtL01uZERSeHBm?=
 =?utf-8?B?QXI2WlVaRmprUHA1NHdISkFoQSthVVBNaENhK1FJckEvNGg1NUxTRkZVYzVY?=
 =?utf-8?B?MDQ4Tmx2aFMreGtZc2RkWkUwaVhIY3lsTEgxaTJmVThmd29FRFhEeVBHZml1?=
 =?utf-8?B?OUFCZHpJTUt6Z2ZuaERlOHorcGFSdVQ3ZEZ3cWtHRGpPWWpDNzA4QT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef3c02a6-8fc5-4445-62fe-08da3d137957
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2763.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 23:25:07.7508 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wVmaxGRtIe2GApv/2P73f663/eCqvtBi0aJKXXimOWp4DbnriyWZV+W1OByR3wvFBJaJQOBa2MCbqWouRv1RRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6627
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 intel-gfx <intel-gfx@lists.freedesktop.org>, amd-gfx@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Len Brown <lenb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------oHAqtxv0PhQ9UbMO5ubwLj97
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/20/22 16:41, Daniel Dadap wrote:
>
> On 5/17/22 10:23, Hans de Goede wrote:
>> On x86/ACPI boards the acpi_video driver will usually initializing 
>> before
>> the kms driver (except i915). This causes 
>> /sys/class/backlight/acpi_video0
>> to show up and then the kms driver registers its own native backlight
>> device after which the drivers/acpi/video_detect.c code unregisters
>> the acpi_video0 device (when acpi_video_get_backlight_type()==native).
>>
>> This means that userspace briefly sees 2 devices and the disappearing of
>> acpi_video0 after a brief time confuses the systemd backlight level
>> save/restore code, see e.g.:
>> https://bbs.archlinux.org/viewtopic.php?id=269920
>>
>> To fix this make backlight class device registration a separate step
>> done by a new acpi_video_register_backlight() function. The intend is 
>> for
>> this to be called by the drm/kms driver *after* it is done setting up 
>> its
>> own native backlight device. So that acpi_video_get_backlight_type() 
>> knows
>> if a native backlight will be available or not at acpi_video backlight
>> registration time, avoiding the add + remove dance.
>
>
> If I'm understanding this correctly, it seems we will want to call 
> acpi_video_register_backlight() from the NVIDIA proprietary driver in 
> a fallback path in case the driver's own GPU-controlled backlight 
> handler either should not be used, or fails to register. That sounds 
> reasonable enough, but I'm not sure what should be done about drivers 
> like nvidia-wmi-ec-backlight, which are independent of the GPU 
> hardware, and wouldn't be part of the acpi_video driver, either. There 
> are a number of other similar vendor-y/platform-y type backlight 
> drivers in drivers/video/backlight and drivers/platform/x86 that I 
> think would be in a similar situation.
>
> From a quick skim of the ACPI video driver, it seems that perhaps 
> nvidia-wmi-ec-backlight is missing a call to 
> acpi_video_set_dmi_backlight_type(), perhaps with the 
> acpi_backlight_vendor value? But I'm not familiar enough with this 
> code to be sure that nobody will be checking 
> acpi_video_get_backlight_type() before nvidia-wmi-ec-backlight loads. 
> I'll take a closer look to try to convince myself that it makes sense.
>
>
>> Note the new acpi_video_register_backlight() function is also called 
>> from
>> a delayed work to ensure that the acpi_video backlight devices does get
>> registered if necessary even if there is no drm/kms driver or when it is
>> disabled.
>
>
> It sounds like maybe everything should be fine as long as 
> nvidia-wmi-ec-backlight (and other vendor-y/platform-y type drivers) 
> gets everything set up before the delayed work which calls 
> acpi_video_register_backlight()? But then is it really necessary to 
> explicitly call acpi_video_register_backlight() from the DRM drivers 
> if it's going to be called later if no GPU driver registered a 
> backlight handler, anyway? Then we'd just need to make sure that the 
> iGPU and dGPU drivers won't attempt to register a backlight handler on 
> systems where a vendor-y/platform-y driver is supposed to handle the 
> backlight instead, which sounds like it has the potential to be quite 
> messy.
>

Ah, I see you addressed this concern in your RFC (sorry for missing 
that, earlier):

> The above only takes native vs acpi_video backlight issues into
> account, there are also a couple of other scenarios which may
> lead to multiple backlight-devices getting registered:
>
> 1) Apple laptops using the apple_gmux driver
> 2) Nvidia laptops using the (new) nvidia-wmi-ec-backlight driver
> 3) drivers/platform/x86 drivers calling acpi_video_set_dmi_backlight_type()
>     to override the normal acpi_video_get_backlight_type() heuristics after
>     the native/acpi_video drivers have already loaded
>
> The plan for 1) + 2) is to extend the acpi_backlight_type enum with
> acpi_backlight_gmux and acpi_backlight_nvidia_wmi_ec values and to add
> detection of these 2 to acpi_video_get_backlight_type().

Is there a reason these shouldn't have the same, generic, type, rather 
than separate, driver-specific ones? I don't foresee any situation where 
a system would need to use these two particular drivers simultaneously. 
Multiple DRM drivers can coexist on the same system, and even though the 
goal here is to remove the existing "multiple backlight interfaces for 
the same panel" situation, there shouldn't be any reason why more than 
one DRM driver couldn't register backlight handlers at the same time, so 
long as they are driving distinct panels. If we don't need separate 
backlight types for individual DRM drivers, why should we have them for 
apple_gmux and nvidia_wmi_ec_backlight?

I still think that relying on the GPU drivers to correctly know whether 
they should register their backlight handlers when a platform-level 
device is supposed to register one instead might be easier said than 
done, especially on systems where the same panel could potentially be 
driven by more than one GPU (but not at the same time).

> Recall that on at least one system, both amdgpu and the NVIDIA 
> proprietary driver registered a handler even when it shouldn't: 
> https://patchwork.kernel.org/project/platform-driver-x86/patch/20220316203325.2242536-1-ddadap@nvidia.com/ 
> - I didn't have direct access to this system, but the fact that the 
> NVIDIA driver registered a handler was almost certainly a bug in 
> either the driver or the system's firmware (on other systems with the 
> same type of backlight hardware, NVIDIA does not register a handler), 
> and I imagine the same is true of the amdgpu driver. In all likelihood 
> nouveau would have probably tried to register one too; I am not 
> certain whether the person who reported the issue to me had tested 
> with nouveau. I'm not convinced that the GPU drivers can reliably 
> determine whether or not they are supposed to register, but maybe 
> cases where they aren't, such as the system mentioned above, are 
> supposed to be handled in a quirks table somewhere.
>
>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   drivers/acpi/acpi_video.c | 45 ++++++++++++++++++++++++++++++++++++---
>>   include/acpi/video.h      |  2 ++
>>   2 files changed, 44 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/acpi/acpi_video.c b/drivers/acpi/acpi_video.c
>> index 95d4868f6a8c..79e75dc86243 100644
>> --- a/drivers/acpi/acpi_video.c
>> +++ b/drivers/acpi/acpi_video.c
>> @@ -31,6 +31,12 @@
>>   #define ACPI_VIDEO_BUS_NAME        "Video Bus"
>>   #define ACPI_VIDEO_DEVICE_NAME        "Video Device"
>>   +/*
>> + * Display probing is known to take up to 5 seconds, so delay the 
>> fallback
>> + * backlight registration by 5 seconds + 3 seconds for some extra 
>> margin.
>> + */
>> +#define ACPI_VIDEO_REGISTER_BACKLIGHT_DELAY    (8 * HZ)
>> +
>>   #define MAX_NAME_LEN    20
>>     MODULE_AUTHOR("Bruno Ducrot");
>> @@ -80,6 +86,9 @@ static LIST_HEAD(video_bus_head);
>>   static int acpi_video_bus_add(struct acpi_device *device);
>>   static int acpi_video_bus_remove(struct acpi_device *device);
>>   static void acpi_video_bus_notify(struct acpi_device *device, u32 
>> event);
>> +static void acpi_video_bus_register_backlight_work(struct 
>> work_struct *ignored);
>> +static DECLARE_DELAYED_WORK(video_bus_register_backlight_work,
>> +                acpi_video_bus_register_backlight_work);
>>   void acpi_video_detect_exit(void);
>>     /*
>> @@ -1862,8 +1871,6 @@ static int 
>> acpi_video_bus_register_backlight(struct acpi_video_bus *video)
>>       if (video->backlight_registered)
>>           return 0;
>>   -    acpi_video_run_bcl_for_osi(video);
>> -
>>       if (acpi_video_get_backlight_type(false) != acpi_backlight_video)
>>           return 0;
>>   @@ -2089,7 +2096,11 @@ static int acpi_video_bus_add(struct 
>> acpi_device *device)
>>       list_add_tail(&video->entry, &video_bus_head);
>>       mutex_unlock(&video_list_lock);
>>   -    acpi_video_bus_register_backlight(video);
>> +    /*
>> +     * The userspace visible backlight_device gets registered 
>> separately
>> +     * from acpi_video_register_backlight().
>> +     */
>> +    acpi_video_run_bcl_for_osi(video);
>>       acpi_video_bus_add_notify_handler(video);
>>         return 0;
>> @@ -2128,6 +2139,11 @@ static int acpi_video_bus_remove(struct 
>> acpi_device *device)
>>       return 0;
>>   }
>>   +static void acpi_video_bus_register_backlight_work(struct 
>> work_struct *ignored)
>> +{
>> +    acpi_video_register_backlight();
>> +}
>> +
>>   static int __init is_i740(struct pci_dev *dev)
>>   {
>>       if (dev->device == 0x00D1)
>> @@ -2238,6 +2254,17 @@ int acpi_video_register(void)
>>        */
>>       register_count = 1;
>>   +    /*
>> +     * acpi_video_bus_add() skips registering the userspace visible
>> +     * backlight_device. The intend is for this to be registered by the
>> +     * drm/kms driver calling acpi_video_register_backlight() 
>> *after* it is
>> +     * done setting up its own native backlight device. The delayed 
>> work
>> +     * ensures that acpi_video_register_backlight() always gets called
>> +     * eventually, in case there is no drm/kms driver or it is 
>> disabled.
>> +     */
>> + schedule_delayed_work(&video_bus_register_backlight_work,
>> +                  ACPI_VIDEO_REGISTER_BACKLIGHT_DELAY);
>> +
>>   leave:
>>       mutex_unlock(&register_count_mutex);
>>       return ret;
>> @@ -2248,6 +2275,7 @@ void acpi_video_unregister(void)
>>   {
>>       mutex_lock(&register_count_mutex);
>>       if (register_count) {
>> + cancel_delayed_work_sync(&video_bus_register_backlight_work);
>>           acpi_bus_unregister_driver(&acpi_video_bus);
>>           register_count = 0;
>>       }
>> @@ -2255,6 +2283,17 @@ void acpi_video_unregister(void)
>>   }
>>   EXPORT_SYMBOL(acpi_video_unregister);
>>   +void acpi_video_register_backlight(void)
>> +{
>> +    struct acpi_video_bus *video;
>> +
>> +    mutex_lock(&video_list_lock);
>> +    list_for_each_entry(video, &video_bus_head, entry)
>> +        acpi_video_bus_register_backlight(video);
>> +    mutex_unlock(&video_list_lock);
>> +}
>> +EXPORT_SYMBOL(acpi_video_register_backlight);
>> +
>>   void acpi_video_unregister_backlight(void)
>>   {
>>       struct acpi_video_bus *video;
>> diff --git a/include/acpi/video.h b/include/acpi/video.h
>> index e31afb93379a..b2f7dc1f354a 100644
>> --- a/include/acpi/video.h
>> +++ b/include/acpi/video.h
>> @@ -53,6 +53,7 @@ enum acpi_backlight_type {
>>   #if IS_ENABLED(CONFIG_ACPI_VIDEO)
>>   extern int acpi_video_register(void);
>>   extern void acpi_video_unregister(void);
>> +extern void acpi_video_register_backlight(void);
>>   extern int acpi_video_get_edid(struct acpi_device *device, int type,
>>                      int device_id, void **edid);
>>   extern enum acpi_backlight_type acpi_video_get_backlight_type(bool 
>> native);
>> @@ -68,6 +69,7 @@ extern int acpi_video_get_levels(struct acpi_device 
>> *device,
>>   #else
>>   static inline int acpi_video_register(void) { return -ENODEV; }
>>   static inline void acpi_video_unregister(void) { return; }
>> +static inline void acpi_video_register_backlight(void) { return; }
>>   static inline int acpi_video_get_edid(struct acpi_device *device, 
>> int type,
>>                         int device_id, void **edid)
>>   {
--------------oHAqtxv0PhQ9UbMO5ubwLj97
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 5/20/22 16:41, Daniel Dadap wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:80fa1ee5-6204-6178-e7e2-ac98038cd8d8@nvidia.com">
      <br>
      On 5/17/22 10:23, Hans de Goede wrote:
      <br>
      <blockquote type="cite">On x86/ACPI boards the acpi_video driver
        will usually initializing before
        <br>
        the kms driver (except i915). This causes
        /sys/class/backlight/acpi_video0
        <br>
        to show up and then the kms driver registers its own native
        backlight
        <br>
        device after which the drivers/acpi/video_detect.c code
        unregisters
        <br>
        the acpi_video0 device (when
        acpi_video_get_backlight_type()==native).
        <br>
        <br>
        This means that userspace briefly sees 2 devices and the
        disappearing of
        <br>
        acpi_video0 after a brief time confuses the systemd backlight
        level
        <br>
        save/restore code, see e.g.:
        <br>
        <a class="moz-txt-link-freetext" href="https://bbs.archlinux.org/viewtopic.php?id=269920">https://bbs.archlinux.org/viewtopic.php?id=269920</a>
        <br>
        <br>
        To fix this make backlight class device registration a separate
        step
        <br>
        done by a new acpi_video_register_backlight() function. The
        intend is for
        <br>
        this to be called by the drm/kms driver *after* it is done
        setting up its
        <br>
        own native backlight device. So that
        acpi_video_get_backlight_type() knows
        <br>
        if a native backlight will be available or not at acpi_video
        backlight
        <br>
        registration time, avoiding the add + remove dance.
        <br>
      </blockquote>
      <br>
      <br>
      If I'm understanding this correctly, it seems we will want to call
      acpi_video_register_backlight() from the NVIDIA proprietary driver
      in a fallback path in case the driver's own GPU-controlled
      backlight handler either should not be used, or fails to register.
      That sounds reasonable enough, but I'm not sure what should be
      done about drivers like nvidia-wmi-ec-backlight, which are
      independent of the GPU hardware, and wouldn't be part of the
      acpi_video driver, either. There are a number of other similar
      vendor-y/platform-y type backlight drivers in
      drivers/video/backlight and drivers/platform/x86 that I think
      would be in a similar situation.
      <br>
      <br>
      From a quick skim of the ACPI video driver, it seems that perhaps
      nvidia-wmi-ec-backlight is missing a call to
      acpi_video_set_dmi_backlight_type(), perhaps with the
      acpi_backlight_vendor value? But I'm not familiar enough with this
      code to be sure that nobody will be checking
      acpi_video_get_backlight_type() before nvidia-wmi-ec-backlight
      loads. I'll take a closer look to try to convince myself that it
      makes sense.
      <br>
      <br>
      <br>
      <blockquote type="cite">Note the new
        acpi_video_register_backlight() function is also called from
        <br>
        a delayed work to ensure that the acpi_video backlight devices
        does get
        <br>
        registered if necessary even if there is no drm/kms driver or
        when it is
        <br>
        disabled.
        <br>
      </blockquote>
      <br>
      <br>
      It sounds like maybe everything should be fine as long as
      nvidia-wmi-ec-backlight (and other vendor-y/platform-y type
      drivers) gets everything set up before the delayed work which
      calls acpi_video_register_backlight()? But then is it really
      necessary to explicitly call acpi_video_register_backlight() from
      the DRM drivers if it's going to be called later if no GPU driver
      registered a backlight handler, anyway? Then we'd just need to
      make sure that the iGPU and dGPU drivers won't attempt to register
      a backlight handler on systems where a vendor-y/platform-y driver
      is supposed to handle the backlight instead, which sounds like it
      has the potential to be quite messy.
      <br>
      <br>
    </blockquote>
    <p><br>
    </p>
    <p>Ah, I see you addressed this concern in your RFC (sorry for
      missing that, earlier):<br>
      <br>
    </p>
    <p>
      <blockquote type="cite">
        <pre id="b">The above only takes native vs acpi_video backlight issues into
account, there are also a couple of other scenarios which may
lead to multiple backlight-devices getting registered:

1) Apple laptops using the apple_gmux driver
2) Nvidia laptops using the (new) nvidia-wmi-ec-backlight driver
3) drivers/platform/x86 drivers calling acpi_video_set_dmi_backlight_type()
   to override the normal acpi_video_get_backlight_type() heuristics after
   the native/acpi_video drivers have already loaded

The plan for 1) + 2) is to extend the acpi_backlight_type enum with
acpi_backlight_gmux and acpi_backlight_nvidia_wmi_ec values and to add
detection of these 2 to acpi_video_get_backlight_type().</pre>
      </blockquote>
      <br>
      Is there a reason these shouldn't have the same, generic, type,
      rather than separate, driver-specific ones? I don't foresee any
      situation where a system would need to use these two particular
      drivers simultaneously. Multiple DRM drivers can coexist on the
      same system, and even though the goal here is to remove the
      existing &quot;multiple backlight interfaces for the same panel&quot;
      situation, there shouldn't be any reason why more than one DRM
      driver couldn't register backlight handlers at the same time, so
      long as they are driving distinct panels. If we don't need
      separate backlight types for individual DRM drivers, why should we
      have them for apple_gmux and nvidia_wmi_ec_backlight?<br>
      <br>
      I still think that relying on the GPU drivers to correctly know
      whether they should register their backlight handlers when a
      platform-level device is supposed to register one instead might be
      easier said than done, especially on systems where the same panel
      could potentially be driven by more than one GPU (but not at the
      same time).<br>
      <br>
    </p>
    <blockquote type="cite" cite="mid:80fa1ee5-6204-6178-e7e2-ac98038cd8d8@nvidia.com">Recall
      that on at least one system, both amdgpu and the NVIDIA
      proprietary driver registered a handler even when it shouldn't:
<a class="moz-txt-link-freetext" href="https://patchwork.kernel.org/project/platform-driver-x86/patch/20220316203325.2242536-1-ddadap@nvidia.com/">https://patchwork.kernel.org/project/platform-driver-x86/patch/20220316203325.2242536-1-ddadap@nvidia.com/</a>
      - I didn't have direct access to this system, but the fact that
      the NVIDIA driver registered a handler was almost certainly a bug
      in either the driver or the system's firmware (on other systems
      with the same type of backlight hardware, NVIDIA does not register
      a handler), and I imagine the same is true of the amdgpu driver.
      In all likelihood nouveau would have probably tried to register
      one too; I am not certain whether the person who reported the
      issue to me had tested with nouveau. I'm not convinced that the
      GPU drivers can reliably determine whether or not they are
      supposed to register, but maybe cases where they aren't, such as
      the system mentioned above, are supposed to be handled in a quirks
      table somewhere.
      <br>
      <br>
      <br>
      <blockquote type="cite">Signed-off-by: Hans de Goede
        <a class="moz-txt-link-rfc2396E" href="mailto:hdegoede@redhat.com">&lt;hdegoede@redhat.com&gt;</a>
        <br>
        ---
        <br>
        &nbsp; drivers/acpi/acpi_video.c | 45
        ++++++++++++++++++++++++++++++++++++---
        <br>
        &nbsp; include/acpi/video.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 2 ++
        <br>
        &nbsp; 2 files changed, 44 insertions(+), 3 deletions(-)
        <br>
        <br>
        diff --git a/drivers/acpi/acpi_video.c
        b/drivers/acpi/acpi_video.c
        <br>
        index 95d4868f6a8c..79e75dc86243 100644
        <br>
        --- a/drivers/acpi/acpi_video.c
        <br>
        +++ b/drivers/acpi/acpi_video.c
        <br>
        @@ -31,6 +31,12 @@
        <br>
        &nbsp; #define ACPI_VIDEO_BUS_NAME&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Video Bus&quot;
        <br>
        &nbsp; #define ACPI_VIDEO_DEVICE_NAME&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Video Device&quot;
        <br>
        &nbsp; +/*
        <br>
        + * Display probing is known to take up to 5 seconds, so delay
        the fallback
        <br>
        + * backlight registration by 5 seconds + 3 seconds for some
        extra margin.
        <br>
        + */
        <br>
        +#define ACPI_VIDEO_REGISTER_BACKLIGHT_DELAY&nbsp;&nbsp;&nbsp; (8 * HZ)
        <br>
        +
        <br>
        &nbsp; #define MAX_NAME_LEN&nbsp;&nbsp;&nbsp; 20
        <br>
        &nbsp; &nbsp; MODULE_AUTHOR(&quot;Bruno Ducrot&quot;);
        <br>
        @@ -80,6 +86,9 @@ static LIST_HEAD(video_bus_head);
        <br>
        &nbsp; static int acpi_video_bus_add(struct acpi_device *device);
        <br>
        &nbsp; static int acpi_video_bus_remove(struct acpi_device *device);
        <br>
        &nbsp; static void acpi_video_bus_notify(struct acpi_device *device,
        u32 event);
        <br>
        +static void acpi_video_bus_register_backlight_work(struct
        work_struct *ignored);
        <br>
        +static DECLARE_DELAYED_WORK(video_bus_register_backlight_work,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; acpi_video_bus_register_backlight_work);
        <br>
        &nbsp; void acpi_video_detect_exit(void);
        <br>
        &nbsp; &nbsp; /*
        <br>
        @@ -1862,8 +1871,6 @@ static int
        acpi_video_bus_register_backlight(struct acpi_video_bus *video)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (video-&gt;backlight_registered)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;
        <br>
        &nbsp; -&nbsp;&nbsp;&nbsp; acpi_video_run_bcl_for_osi(video);
        <br>
        -
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (acpi_video_get_backlight_type(false) !=
        acpi_backlight_video)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;
        <br>
        &nbsp; @@ -2089,7 +2096,11 @@ static int acpi_video_bus_add(struct
        acpi_device *device)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; list_add_tail(&amp;video-&gt;entry, &amp;video_bus_head);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_unlock(&amp;video_list_lock);
        <br>
        &nbsp; -&nbsp;&nbsp;&nbsp; acpi_video_bus_register_backlight(video);
        <br>
        +&nbsp;&nbsp;&nbsp; /*
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp; * The userspace visible backlight_device gets registered
        separately
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp; * from acpi_video_register_backlight().
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp; */
        <br>
        +&nbsp;&nbsp;&nbsp; acpi_video_run_bcl_for_osi(video);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; acpi_video_bus_add_notify_handler(video);
        <br>
        &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;
        <br>
        @@ -2128,6 +2139,11 @@ static int acpi_video_bus_remove(struct
        acpi_device *device)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;
        <br>
        &nbsp; }
        <br>
        &nbsp; +static void acpi_video_bus_register_backlight_work(struct
        work_struct *ignored)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; acpi_video_register_backlight();
        <br>
        +}
        <br>
        +
        <br>
        &nbsp; static int __init is_i740(struct pci_dev *dev)
        <br>
        &nbsp; {
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dev-&gt;device == 0x00D1)
        <br>
        @@ -2238,6 +2254,17 @@ int acpi_video_register(void)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; register_count = 1;
        <br>
        &nbsp; +&nbsp;&nbsp;&nbsp; /*
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp; * acpi_video_bus_add() skips registering the userspace
        visible
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp; * backlight_device. The intend is for this to be
        registered by the
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp; * drm/kms driver calling acpi_video_register_backlight()
        *after* it is
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp; * done setting up its own native backlight device. The
        delayed work
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp; * ensures that acpi_video_register_backlight() always gets
        called
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp; * eventually, in case there is no drm/kms driver or it is
        disabled.
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp; */
        <br>
        +&nbsp;&nbsp;&nbsp;
        schedule_delayed_work(&amp;video_bus_register_backlight_work,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ACPI_VIDEO_REGISTER_BACKLIGHT_DELAY);
        <br>
        +
        <br>
        &nbsp; leave:
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_unlock(&amp;register_count_mutex);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;
        <br>
        @@ -2248,6 +2275,7 @@ void acpi_video_unregister(void)
        <br>
        &nbsp; {
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_lock(&amp;register_count_mutex);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (register_count) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        cancel_delayed_work_sync(&amp;video_bus_register_backlight_work);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; acpi_bus_unregister_driver(&amp;acpi_video_bus);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; register_count = 0;
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        @@ -2255,6 +2283,17 @@ void acpi_video_unregister(void)
        <br>
        &nbsp; }
        <br>
        &nbsp; EXPORT_SYMBOL(acpi_video_unregister);
        <br>
        &nbsp; +void acpi_video_register_backlight(void)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; struct acpi_video_bus *video;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; mutex_lock(&amp;video_list_lock);
        <br>
        +&nbsp;&nbsp;&nbsp; list_for_each_entry(video, &amp;video_bus_head, entry)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; acpi_video_bus_register_backlight(video);
        <br>
        +&nbsp;&nbsp;&nbsp; mutex_unlock(&amp;video_list_lock);
        <br>
        +}
        <br>
        +EXPORT_SYMBOL(acpi_video_register_backlight);
        <br>
        +
        <br>
        &nbsp; void acpi_video_unregister_backlight(void)
        <br>
        &nbsp; {
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct acpi_video_bus *video;
        <br>
        diff --git a/include/acpi/video.h b/include/acpi/video.h
        <br>
        index e31afb93379a..b2f7dc1f354a 100644
        <br>
        --- a/include/acpi/video.h
        <br>
        +++ b/include/acpi/video.h
        <br>
        @@ -53,6 +53,7 @@ enum acpi_backlight_type {
        <br>
        &nbsp; #if IS_ENABLED(CONFIG_ACPI_VIDEO)
        <br>
        &nbsp; extern int acpi_video_register(void);
        <br>
        &nbsp; extern void acpi_video_unregister(void);
        <br>
        +extern void acpi_video_register_backlight(void);
        <br>
        &nbsp; extern int acpi_video_get_edid(struct acpi_device *device, int
        type,
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int device_id, void **edid);
        <br>
        &nbsp; extern enum acpi_backlight_type
        acpi_video_get_backlight_type(bool native);
        <br>
        @@ -68,6 +69,7 @@ extern int acpi_video_get_levels(struct
        acpi_device *device,
        <br>
        &nbsp; #else
        <br>
        &nbsp; static inline int acpi_video_register(void) { return -ENODEV;
        }
        <br>
        &nbsp; static inline void acpi_video_unregister(void) { return; }
        <br>
        +static inline void acpi_video_register_backlight(void) {
        return; }
        <br>
        &nbsp; static inline int acpi_video_get_edid(struct acpi_device
        *device, int type,
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int device_id, void **edid)
        <br>
        &nbsp; {
        <br>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------oHAqtxv0PhQ9UbMO5ubwLj97--
