Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 417495A520B
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 18:44:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF67210E4D9;
	Mon, 29 Aug 2022 16:44:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2083.outbound.protection.outlook.com [40.107.92.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30AD110E35B;
 Mon, 29 Aug 2022 16:43:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RDuEEABTmEk9/Ipjus+G3kdtLajthbtC2J748WdSE1bBwjZmMIo/wEXTaocwgkd4/aYcYl4r3YDn3XWr3u99TK6znVbim26ADq7k4zAOJdk0fQmUN4glvvDFSjT4wbN4NvrOkvtTOa6QQZ1G9hVck9l9KBECutvhi3fBK+K1dCO6YCt38kRGyk52FTl7aQdtDfA8ArvWJxCj8Ge/pjshDVZMfwv7bvCMAlo1vzNgdFD4rZd2KHKZZmwXIUAsIs2IPizGAiDRJdekVnHtEnyyLN0yEHEYCTvxtch/cHDZuB2HTlQA2cEPtX2ieZey5fZw8FVtMILu9UJgbQU+vT1/pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qxiIFm03xL3/GpsmJObPURCsl0wkRkVr5dhO7LU+SqI=;
 b=nm/fSuY4aCUV4+7TM3moKAcWYnavyqzc0h85XYU92r2l2Ig4q3AyJ6KF08nNYkRNlXX/tLjONkwbEMR2j06UcEhm0eTSuTcdSGmedFx9ZrSuA04+9i9a284zleC8drMD68DLd529lhnlB3F4HOy0H7T9EFVq7UT57tv/zd+3qAL/uHlDeQNKQoSiTBXZWetiHgjU+J/ew+3o51O/AX7kqjEUwuQ2C61LujegnOQ6KzYI/sed+o//TVQD9u7Bvc1F9xixIRLyccxavfg2J0PDUnsawzQdvYG0cF+CjrfrePePV5x7Yb1FjvVgHHB37yDF39AjpacEmjnmpHH1C47jzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qxiIFm03xL3/GpsmJObPURCsl0wkRkVr5dhO7LU+SqI=;
 b=J404ElQRoh+wYQMXNtmqgnFdOz8zwgSDWebnl506XoT5TPq3+yWMOXaIL4EjcQpfXc9nTPUMNSvPEQnn/lLgjgehhKpmWdJLQm+cg8cjbkdEMdROAshGP8jjv/7OUBw/J2M6rPYsOS0wYtBqZMJc6Dax9/ZMC584xi8D92BjFHD68Sbh7JVj5bHcTWmeH74rOzw22ovAnLHaCD1kJ1B/q6aww60tzoa5+Jhjpvn2SWW3vuEZLgWRl8mOBtLsTc+FYHY0lhYnI8wO/zqdZozEpFb1nfbsGD4878TF11s61oXmngKIIHaXZ502MaS1l6b3Pw2DN+0AE2X2992BzqUw/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2763.namprd12.prod.outlook.com (2603:10b6:5:48::16) by
 BYAPR12MB2712.namprd12.prod.outlook.com (2603:10b6:a03:65::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.14; Mon, 29 Aug 2022 16:43:56 +0000
Received: from DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::6012:2e0d:2697:8b02]) by DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::6012:2e0d:2697:8b02%3]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 16:43:56 +0000
Message-ID: <d2661273-6854-2043-51c1-83f3513fb2c9@nvidia.com>
Date: Mon, 29 Aug 2022 11:43:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v5 17/31] ACPI: video: Add Nvidia WMI EC brightness
 control detection (v3)
Content-Language: en-US
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
 Lukas Wunner <lukas@wunner.de>, Mark Gross <markgross@kernel.org>,
 Andy Shevchenko <andy@kernel.org>
References: <20220825143726.269890-1-hdegoede@redhat.com>
 <20220825143726.269890-18-hdegoede@redhat.com>
 <a4d786a2-f2a2-fec7-df9d-18418c583301@nvidia.com>
 <cbbaee7f-8ac3-0a37-9c71-3667e832a6ec@redhat.com>
From: Daniel Dadap <ddadap@nvidia.com>
In-Reply-To: <cbbaee7f-8ac3-0a37-9c71-3667e832a6ec@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:806:20::9) To DM6PR12MB2763.namprd12.prod.outlook.com
 (2603:10b6:5:48::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a88f17e2-f678-484f-6d53-08da89ddaa03
X-MS-TrafficTypeDiagnostic: BYAPR12MB2712:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D7jd3aBES7j8Fkf+fzsLorQUsrGsALTN++H9Bi2gud3pDfVDtggiIPX6I1V52HBjmLgXqaDIFOkseuki2vRWmOoR4OgrK+9Vm7SRb4UlQ6/iVMpVatJfVLYh4agNDMpd3uuwmamCIAmRfhWEThMyarwBQw88Xra4+g8kd6mtvywc4gT5ZFA7SDJHUlAR/tTHDQg3r5Qt2ZRZWYdrcMUtwnBGJSX5xDX09yTDjKDc7BW2kkw+QyjTabPuUH1UmwSWinfKMoo+dDf/5g5/pIt6G7ttL+APPfV1x/uGwDuGXG04jyWO1bRrYi1lJYoyUHejpu4xPW/DY2/mIYhW6kB7KXOaW2Fhs6wEFrTpn+WyURmYdqtDd9KNN9ozUjqdOMZp4QBsi/EPtDJ8idsF3leXTAfZE3/NPk+dgLdtr72g2YDNZzhwwciMMmxcI1D3M/IfqaE2xLxJqhVBvTMaL3KP/sie0vUyjLqShMWtqiHGXGtN5zEH2Wckn0l03LTNja6/cXAqP/2gEb9z9NtjtgBYuNju4DjYJ6R3zWew2HW29XmC1TNhZ4GbMj3Wz1h5zewuadne2m4eHP9Rlq3WXUAXwv57Prf8zsGPCQptQXa2GNfuFpQCkySvLVuoGp8m/iFEo6SHTVofudJtap7bwIU49efjiqi7mcqM++cDY0t6mtwnKWE+pgDj5KnuKcJOamUqCvj/RFcl282XV30GBuIEIZ3j0UdB7OEKnwMSxhH63rDgLjaIQNt6wmrEF5TN4Uqs4YbigDzUiFvPxIqL3uzxqTgyeE04QS2AD2wXLpVzU4duwFYYNOTsp0sVRipgV8Wh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2763.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(136003)(396003)(39860400002)(346002)(376002)(6512007)(921005)(31686004)(110136005)(54906003)(38100700002)(36756003)(316002)(26005)(478600001)(31696002)(8936002)(6506007)(8676002)(6486002)(41300700001)(7416002)(66946007)(66556008)(6666004)(53546011)(86362001)(2906002)(186003)(83380400001)(4326008)(66476007)(5660300002)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWlyRTRtQi9PMHArS05XZGloRlltQmdIVGVjdHNXUzhrRUxlZXM4Uzh6aWdw?=
 =?utf-8?B?UVZ5N3NYMWVXZVZ0Sjl0S1RzUG1aZUsyU3NGUEQvbkVnWXdud3d3NXVwOTZj?=
 =?utf-8?B?OHN1ZnNmc3dBNzFZamdNVVJCVjEzVUdxdFErN2lHWHQ3bEFkR29SR3p0Z1RY?=
 =?utf-8?B?SEpadFdGNU1CbzJrbWYyWEhqMnFtZGViQnhuamV0eWJnRlE4eFhDcnZFc3A3?=
 =?utf-8?B?eUNtSUFoZlYzTUhCSkN0dXVwR09VdDVEcUN3RlVsOFROc1V5QkhteGc3NWRx?=
 =?utf-8?B?WjlOdFF1MkZsa01oYTZraDB5WjBlK3U2RWJJMitERVhsTHdSR2FRWm0zYUtH?=
 =?utf-8?B?NjF2SWd3aGJRb0U3QkcyWHVOdlBzeFY5TWYrT3lzcGFMY0pRRU9RWHc5Rnk1?=
 =?utf-8?B?OU1OVGF2UTNhRnZqSjBnOHc5SnNVaVNsYUFZb0tsejJPbmZHSUxyUmxvSFRO?=
 =?utf-8?B?WEpxUWRlV3d4Y05najJPK3Bya2JWQUZxV2Q0d0dsdDY1YWRpeVNoeGJKU213?=
 =?utf-8?B?WGpvNEt4S2xVNXB0RTFpZjA3c2xhZmxqbmx4SitiZ0YxK0FldndaMEl4MzJY?=
 =?utf-8?B?VkRtV1dmeHJxalNGZk94Rk1LczM4RjV0QlZ6RkJqTkZHcUhiNEtvRnNlY1c5?=
 =?utf-8?B?M3RYZXFHZTlSNlZ1M0dSZjgxamtRYXBBSDkzRk1EUkFhRFphV3JOVEp1VUU1?=
 =?utf-8?B?MEdiWWY3QnJ6eGtZNW80Mk9Jb3ViejlMcE9oVW1iaVhxTkpRRWpSV01yRzQ4?=
 =?utf-8?B?SjVFTDdzNHVIeFFoWW1NczczZzM2Vlg5Q0VIZ0c1b3pXVXliMmpGTG93a3h4?=
 =?utf-8?B?YzBpdzBzSmV2UW1aRWM1ZityWHU1aUNLYTdVcVlYVi9LMHN6RER0dWgvYjhD?=
 =?utf-8?B?VmE2WVByQUt5UzRuVUlZQTEwaFFZTHNlcFlTS0RIUzNtT2hheXVkK011NXRB?=
 =?utf-8?B?SjgzY2xNdHZwVXR6OFo4SS9zVnBDMDh0ajRiQmRaNjJHbWt4ZThCcXV1bjdI?=
 =?utf-8?B?YlU3VGNRdHBxdDNUdi9FaVR4eXAvU1Y5MWVKcGVmdmZGa2JOUG1ZeHZ3UkZv?=
 =?utf-8?B?STNOVDFvbWphaXI4V2tIcFBwS2FCdkwwS044cXczbzZHR01ZM0VxM0FIV1N1?=
 =?utf-8?B?Y1g3ZXFQckUvalRIcWhwSk1PQ2dsUjFrallJOG42MHVORmRBMmdLZHNvSVIx?=
 =?utf-8?B?RUVNNllsZ0VWQWxQOXpSelV2SFMySVp2bXByUy82dFczbkpkY3BidTNVRndr?=
 =?utf-8?B?WDZIbldmWWRTTkpwWHFJaDR3aGlJQlBuZkNZd1VXVzNUS2VtakcrTWpuOTFu?=
 =?utf-8?B?cTU1TVQ1ZDNKRWQ2Q0J4WXNkdzUwa3dESEFqWnQ2Ym9KTi9MblFuVnQxVFJJ?=
 =?utf-8?B?RmIvWmtVTEk1VUFnL2poZm4veDk2Yjd0Y1RTVS8yU3N3T0h6WWZJcmsrV0lo?=
 =?utf-8?B?ZDkzVlM5N2tTdlFIRFVPVng0UzNmZ2tHT0ZEb0NINmVXOUhISTdkVWFzWnVo?=
 =?utf-8?B?YnVzQ1NOUWhWam1uVit5cmc3UXdzYXV4WStFVVk1RXZWaDQ4MjU3ekNpMTJB?=
 =?utf-8?B?Yk1zdE9RWFlMVXF4TTVUQTQ3TmxTVnlENit6NndndnJPZ2Y5aC96b2hlWCtw?=
 =?utf-8?B?eURtQWtzVGhhbFMrYU5vMGYzZ0d3QmtOZlY0dCtWUStrRDJwUWx6anlVRExu?=
 =?utf-8?B?YUFtT0xaNlNPS3hoYzlmRURqSVEveXhrZ1RweTJreVk2Yngzb2UvWFIzazFJ?=
 =?utf-8?B?Mk1uc2w2MTRGdHNDVHFHWGh6Z3NvQXg4d0ZlSGJmNUhWQ2N0cFdIU3JXa3VS?=
 =?utf-8?B?N0pyaG5WRFIxemtxQXZSaUwrZEYwQisvNnBBQ3VNcFJvNW1OQW10bWJuU2FH?=
 =?utf-8?B?MWgwckpORmNjcWhGTUNaSWc4M1RHZUtnWmFZVk12ck9ES1hNbExvRmtXZ1lZ?=
 =?utf-8?B?OUJUa0VmaFhNTW9jNGVnQm9QcWIrTTB4ajNHeVZ6MG1BZ2IwWmhOK1hxd0tP?=
 =?utf-8?B?UU4wVDB1ZDd0SFpNVkI2eXBUbFhqL09rTG9EckJKT0JYUXVMdm5zUTJoc25v?=
 =?utf-8?B?T1JGeXZJclYwdTVpRXRkR01rOWYvZjhSQjZoUzZzbWpxNjZBUXY2S3FQRmRQ?=
 =?utf-8?Q?v8KTKraVb049mLoe2559jNG8l?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a88f17e2-f678-484f-6d53-08da89ddaa03
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2763.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 16:43:56.1819 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RH0i/4qohglu5jIsVpDUKZhFqcRh5mHKHCjrMHB8VnUuDxJIrrEtYmd4E+9AZeSw2WB4gdPZAMS5TE5Hr1593A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2712
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
Cc: nouveau@lists.freedesktop.org, intel-gfx <intel-gfx@lists.freedesktop.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 amd-gfx@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 linux-acpi@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@redhat.com>, Len Brown <lenb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 8/29/22 06:41, Hans de Goede wrote:
> Hi,
>
> On 8/26/22 00:21, Daniel Dadap wrote:
>> On 8/25/22 9:37 AM, Hans de Goede wrote:
>>> On some new laptop designs a new Nvidia specific WMI interface is present
>>> which gives info about panel brightness control and may allow controlling
>>> the brightness through this interface when the embedded controller is used
>>> for brightness control.
>>>
>>> When this WMI interface is present and indicates that the EC is used,
>>> then this interface should be used for brightness control.
>>>
>>> Changes in v2:
>>> - Use the new shared nvidia-wmi-ec-backlight.h header for the
>>>     WMI firmware API definitions
>>> - ACPI_VIDEO can now be enabled on non X86 too,
>>>     adjust the Kconfig changes to match this.
>>>
>>> Changes in v3:
>>> - Use WMI_BRIGHTNESS_GUID define
>>>
>>> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>> ---
>>>    drivers/acpi/Kconfig           |  1 +
>>>    drivers/acpi/video_detect.c    | 37 ++++++++++++++++++++++++++++++++++
>>>    drivers/gpu/drm/gma500/Kconfig |  2 ++
>>>    drivers/gpu/drm/i915/Kconfig   |  2 ++
>>>    include/acpi/video.h           |  1 +
>>>    5 files changed, 43 insertions(+)
>>>
>>> diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
>>> index 7802d8846a8d..44ad4b6bd234 100644
>>> --- a/drivers/acpi/Kconfig
>>> +++ b/drivers/acpi/Kconfig
>>> @@ -212,6 +212,7 @@ config ACPI_VIDEO
>>>        tristate "Video"
>>>        depends on BACKLIGHT_CLASS_DEVICE
>>>        depends on INPUT
>>> +    depends on ACPI_WMI || !X86
>>>        select THERMAL
>>>        help
>>>          This driver implements the ACPI Extensions For Display Adapters
>>> diff --git a/drivers/acpi/video_detect.c b/drivers/acpi/video_detect.c
>>> index cc9d0d91e268..4dc7fb865083 100644
>>> --- a/drivers/acpi/video_detect.c
>>> +++ b/drivers/acpi/video_detect.c
>>> @@ -32,6 +32,7 @@
>>>    #include <linux/dmi.h>
>>>    #include <linux/module.h>
>>>    #include <linux/pci.h>
>>> +#include <linux/platform_data/x86/nvidia-wmi-ec-backlight.h>
>>>    #include <linux/types.h>
>>>    #include <linux/workqueue.h>
>>>    #include <acpi/video.h>
>>> @@ -75,6 +76,36 @@ find_video(acpi_handle handle, u32 lvl, void *context, void **rv)
>>>        return AE_OK;
>>>    }
>>>    +/* This depends on ACPI_WMI which is X86 only */
>>> +#ifdef CONFIG_X86
>>
>> This could probably also provide the { return false; } stub which you have for non-x86 if the kernel is built without nvidia-wmi-ec-backight, e.g.:
>>
>> #if defined(CONFIG_X86) && (defined(CONFIG_NVIDIA_WMI_EC_BACKLIGHT) || defined(CONFIG_NVIDIA_WMI_EC_BACKLIGHT_MODULE))
>>
>> Although I suppose that would break things if somebody has a kernel that originally had NVIDIA_WMI_EC_BACKLIGHT=n in Kconfig, and then builds the nvidia-wmi-ec-backlight driver out-of-tree later. I don't know whether that's intended to be a supported use case, so I guess it is fine either way.
> The video-detect code is about detecting what interface should be used.
> So far it does this independently of the driver implementing that interface
> actually being enabled or not.
>
> If someone has a system which needs the nvidia-wmi-ec-backlight driver,
> but it is disabled then they / their distro should enable that driver,
> rather then trying to fallback on e.g. acpi_video.
>
> Taking which drivers are enabled into account would both make
> the code more complicated and would also explode the test matrix.
>
> All of this is already somewhat fragile, so lets not make it
> extra complicated :)


That is fair.

Reviewed-by: Daniel Dadap <ddadap@nvidia.com>


> Regards,
>
> Hans
>
>
>
>>
>>> +static bool nvidia_wmi_ec_supported(void)
>>> +{
>>> +    struct wmi_brightness_args args = {
>>> +        .mode = WMI_BRIGHTNESS_MODE_GET,
>>> +        .val = 0,
>>> +        .ret = 0,
>>> +    };
>>> +    struct acpi_buffer buf = { (acpi_size)sizeof(args), &args };
>>> +    acpi_status status;
>>> +
>>> +    status = wmi_evaluate_method(WMI_BRIGHTNESS_GUID, 0,
>>> +                     WMI_BRIGHTNESS_METHOD_SOURCE, &buf, &buf);
>>> +    if (ACPI_FAILURE(status))
>>> +        return false;
>>> +
>>> +    /*
>>> +     * If brightness is handled by the EC then nvidia-wmi-ec-backlight
>>> +     * should be used, else the GPU driver(s) should be used.
>>> +     */
>>> +    return args.ret == WMI_BRIGHTNESS_SOURCE_EC;
>>> +}
>>> +#else
>>> +static bool nvidia_wmi_ec_supported(void)
>>> +{
>>> +    return false;
>>> +}
>>> +#endif
>>> +
>>>    /* Force to use vendor driver when the ACPI device is known to be
>>>     * buggy */
>>>    static int video_detect_force_vendor(const struct dmi_system_id *d)
>>> @@ -541,6 +572,7 @@ static const struct dmi_system_id video_detect_dmi_table[] = {
>>>    static enum acpi_backlight_type __acpi_video_get_backlight_type(bool native)
>>>    {
>>>        static DEFINE_MUTEX(init_mutex);
>>> +    static bool nvidia_wmi_ec_present;
>>>        static bool native_available;
>>>        static bool init_done;
>>>        static long video_caps;
>>> @@ -553,6 +585,7 @@ static enum acpi_backlight_type __acpi_video_get_backlight_type(bool native)
>>>            acpi_walk_namespace(ACPI_TYPE_DEVICE, ACPI_ROOT_OBJECT,
>>>                        ACPI_UINT32_MAX, find_video, NULL,
>>>                        &video_caps, NULL);
>>> +        nvidia_wmi_ec_present = nvidia_wmi_ec_supported();
>>>            init_done = true;
>>>        }
>>>        if (native)
>>> @@ -570,6 +603,10 @@ static enum acpi_backlight_type __acpi_video_get_backlight_type(bool native)
>>>        if (acpi_backlight_dmi != acpi_backlight_undef)
>>>            return acpi_backlight_dmi;
>>>    +    /* Special cases such as nvidia_wmi_ec and apple gmux. */
>>> +    if (nvidia_wmi_ec_present)
>>> +        return acpi_backlight_nvidia_wmi_ec;
>>> +
>>>        /* On systems with ACPI video use either native or ACPI video. */
>>>        if (video_caps & ACPI_VIDEO_BACKLIGHT) {
>>>            /*
>>> diff --git a/drivers/gpu/drm/gma500/Kconfig b/drivers/gpu/drm/gma500/Kconfig
>>> index 0cff20265f97..807b989e3c77 100644
>>> --- a/drivers/gpu/drm/gma500/Kconfig
>>> +++ b/drivers/gpu/drm/gma500/Kconfig
>>> @@ -7,6 +7,8 @@ config DRM_GMA500
>>>        select ACPI_VIDEO if ACPI
>>>        select BACKLIGHT_CLASS_DEVICE if ACPI
>>>        select INPUT if ACPI
>>> +    select X86_PLATFORM_DEVICES if ACPI
>>> +    select ACPI_WMI if ACPI
>>>        help
>>>          Say yes for an experimental 2D KMS framebuffer driver for the
>>>          Intel GMA500 (Poulsbo), Intel GMA600 (Moorestown/Oak Trail) and
>>> diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
>>> index 7ae3b7d67fcf..3efce05d7b57 100644
>>> --- a/drivers/gpu/drm/i915/Kconfig
>>> +++ b/drivers/gpu/drm/i915/Kconfig
>>> @@ -23,6 +23,8 @@ config DRM_I915
>>>        # but for select to work, need to select ACPI_VIDEO's dependencies, ick
>>>        select BACKLIGHT_CLASS_DEVICE if ACPI
>>>        select INPUT if ACPI
>>> +    select X86_PLATFORM_DEVICES if ACPI
>>> +    select ACPI_WMI if ACPI
>>>        select ACPI_VIDEO if ACPI
>>>        select ACPI_BUTTON if ACPI
>>>        select SYNC_FILE
>>> diff --git a/include/acpi/video.h b/include/acpi/video.h
>>> index 0625806d3bbd..91578e77ac4e 100644
>>> --- a/include/acpi/video.h
>>> +++ b/include/acpi/video.h
>>> @@ -48,6 +48,7 @@ enum acpi_backlight_type {
>>>        acpi_backlight_video,
>>>        acpi_backlight_vendor,
>>>        acpi_backlight_native,
>>> +    acpi_backlight_nvidia_wmi_ec,
>>>    };
>>>      #if IS_ENABLED(CONFIG_ACPI_VIDEO)
