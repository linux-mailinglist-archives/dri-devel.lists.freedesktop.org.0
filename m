Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 733AD463AD4
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 17:00:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 761936E946;
	Tue, 30 Nov 2021 16:00:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2086.outbound.protection.outlook.com [40.107.244.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7878D6E939;
 Tue, 30 Nov 2021 15:59:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RjQEnNKAuLEGwTwVJqJapOTerYDJpQcVYLQEcCZD4OjFBEhGip2MNtadMd1bi+yLVbSSoYDh3LyMEoXFTxv5m2Y1zvZpHPEMsSbLgyo2y433SdcUpQ987tCTyn/EXJ3eKK2M9iIl90HQYjX1IAP9CboDlGBPJqiHztLJkKVcq/RAyIyCEqCA98KpApwS/punOp/J52E6naDuBYW8rVXdJMkT8unJz5iyayvzXUy8VdJu1/CS05z9kGeKhklU9jV1rAA+hvBTCdKIn+tRPH9GbcLr2sYUCoIMu3JTYCiQTuv8nXlUZwhKOGiH8KsBvw0uyGLL2tVhKxyqTYH0wM5aPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KskGefid/oGLjfWJ+WAu0oYpb17o6bs9DjrIJmjnMc8=;
 b=KDDCih8rd3WuDv82YBcF6UU1WXR0lf+/XBo2GCZBFGiMdp2GK8sjLhEKfGYWeGgxT5eyfRrRbzAqA+2za63OhTYs6+5W01qjAwk8Ex/R+/Qdsf02nITNxGSXyxDVpKnco4bF3VolZTWhJH/S0UW4kikBo9XKza6nQ5Pslu42qbHaPhQfbxzzVJ80Jy5uQdr/nWaio5GIYv9Com5sXkOMiAmePUPewtZerhz+jcaPxcdri6owR9VtP8LeHbHiADnrfBuGDNJedb3JbIA0alJY/cG3MvX0FGo9Ndpac2TOSrgJwKgLrLrC+vsIP+DrDSVXRF9sNppYTUc2zn2usLibfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KskGefid/oGLjfWJ+WAu0oYpb17o6bs9DjrIJmjnMc8=;
 b=CxeL5e4ZNUPpGKNDbhKhZOREtfzmjC7IuKeFtpKrlt0YF6oFW2zuUNmApriK4nMb0tVEX4r2mDd/mQCfLNbp6kQhmhwEQn6q7prHVkm/cToAd2gBLuI/eMIFup/5chuZA5KFgnN5TgiaKMoWNn++nVdPe8v6zL5HKHK1SF2M1RY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2896.namprd12.prod.outlook.com (2603:10b6:208:ab::22)
 by BL0PR12MB4881.namprd12.prod.outlook.com (2603:10b6:208:1c7::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Tue, 30 Nov
 2021 15:59:55 +0000
Received: from MN2PR12MB2896.namprd12.prod.outlook.com
 ([fe80::44f7:66fe:4419:d8d3]) by MN2PR12MB2896.namprd12.prod.outlook.com
 ([fe80::44f7:66fe:4419:d8d3%6]) with mapi id 15.20.4734.024; Tue, 30 Nov 2021
 15:59:54 +0000
Subject: Re: [PATCH 1/6] Documentation/gpu: Reorganize DC documentation
To: Harry Wentland <harry.wentland@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20211125153830.1352994-1-Rodrigo.Siqueira@amd.com>
 <20211125153830.1352994-2-Rodrigo.Siqueira@amd.com>
 <YaEAVV3Ka2lG/iOh@phenom.ffwll.local> <87k0grjhed.fsf@intel.com>
 <254992f1-9f40-b756-b324-8f45726ef823@amd.com>
 <507bfbc5-4be4-9681-c768-efea7c0541d8@amd.com>
From: Rodrigo Siqueira Jordao <rjordrigo@amd.com>
Message-ID: <24a1be4c-0186-96ac-b238-059754a9f856@amd.com>
Date: Tue, 30 Nov 2021 10:59:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <507bfbc5-4be4-9681-c768-efea7c0541d8@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0321.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::26) To MN2PR12MB2896.namprd12.prod.outlook.com
 (2603:10b6:208:ab::22)
MIME-Version: 1.0
Received: from [IPv6:2607:fea8:56e0:6d60:d1f5:d5c:27fc:61c]
 (2607:fea8:56e0:6d60:d1f5:d5c:27fc:61c) by
 BL1PR13CA0321.namprd13.prod.outlook.com (2603:10b6:208:2c1::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.9 via Frontend
 Transport; Tue, 30 Nov 2021 15:59:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1386bc2-d3a8-4e1e-779f-08d9b41a732d
X-MS-TrafficTypeDiagnostic: BL0PR12MB4881:
X-Microsoft-Antispam-PRVS: <BL0PR12MB488159AEE19F0D018DC2153D98679@BL0PR12MB4881.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +ZzLo7Kumkiy7mgiRjwdlqAls0gWTTxNtI9VTIUSHcc0QdjAewtDw2JFAnGeHFMAVnzcRtVlWJkpw+MCicEMa6h0gJ6EqYq1whA5F0J60BHiPdBalKff9hOKqsK3Q/2PSMyrRq+gA0Fx7iJi+KesgwhbrbAyr8+aSEyoZ+CQ39umYX6/QQq7en9GzSdLpwsPx1IhZe1Eom9lINzUMtb295zZDfscz2uQTBFlVOs4I6Ugi59/VGtYtSUL2HAomJcEoZo5kyxG9LApv4dftha6W6H/nq17oc2RDkqawLxWIcjhT4tLZvP7XoEAAGJLp0AIp/iOkPOQ/jHJ2XruVRFY/GaXVve4UPHlJYkD1KH5CshRbCSpPVn08LTJbAQ66z9z84spshGMs3idpJIlXv+eqgsmU4tHlu6rQvSsNX0VAliGcUpEk20ADzfWnqWZJ39bM/hDmIOMWNk7+7tImgsMwq8pwULEyouDUOwbmQ60O77h5ytKMlzoS2IzHrK6zE/oVxLMRqBuoODFP5GSu/50gMjdpCi0KCLMDVVRgW8GUxnBFmPe3FGEJ07dfUodOj+mvL1j48gRNd0zMBvvz5r5jV+QYmmGmJPADLe/2yfKzSOoojEaxQc2fxduGw+Qzu6c+CLuwe693g/Q4W63AVP6Pd69ngy8B+RkpJsyS4WsvrLA+ecmsfl78gfotEWZAF00T/Fykcsi/e/yzkGxYWqzYdfQRY4KP3CZloXx6wrORXvq/v2maEcub6QfPCpdai1j
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2896.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4001150100001)(508600001)(31686004)(6636002)(5660300002)(4326008)(53546011)(66476007)(66556008)(66946007)(54906003)(6486002)(2616005)(2906002)(83380400001)(8936002)(38100700002)(36756003)(8676002)(110136005)(31696002)(316002)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHorekN2Q09TaDU3UFJTNStETTVsOTJ3VHhMbDNjcUc1d2JOTE1EcHFLbHAx?=
 =?utf-8?B?UlJodmJqTlJQL3A2aHlkLzk3Zm9qYXNzNHdqWFE5bUhYNDVvNnNMWmc1SU1a?=
 =?utf-8?B?ekFEeTNINHJWdWlrZzhHdEhDdXphTmVMMFZ4RWxqLzVFUzhwN0dsenQ4OW53?=
 =?utf-8?B?NW02eCsva3pUZVIzS3pXMm5leWF1YVJ4K0VjVk5UakFqYmdSU0EzYzRYTjdv?=
 =?utf-8?B?bFMzOFQrUnhqZDBkVnppQjBDMWNsRXBSdHM5SVVsa29PQTRJaEhGalBldEs3?=
 =?utf-8?B?RFo3QS9mQ0hwK0Njd2lSaUZNTm00R0RFcHVTZktYYUNtQ0M5aEV2cm9oL241?=
 =?utf-8?B?NmExQityTjNibHRERWxPcWZmN24wMFNDRW9FeG4weTFuRkZ5Z2dlR2RTWTFK?=
 =?utf-8?B?a3FGc0RPRUFIUWVHZ3E5cXNGdXF4eDBjMHp2Rmd0UkdhQjRhYUQ5ek9UY2V2?=
 =?utf-8?B?QUJmMjFMelAxdXI3RUVhL3pXWThhaGlSOXRtNHZvN2h4alIvb1IxeU1DR25F?=
 =?utf-8?B?NGd6WXJYOFpyWUxvZ2Qra3hsZWd1V2JkdmdWRklSQVk3UGduYkxNU1IrM29Z?=
 =?utf-8?B?THFpaC9lQjQ4ako1QU90a1ROU3duUExKdG1SdG1pM3pBSDRQRFpjY0Q2Z0JV?=
 =?utf-8?B?b2lpVkRldmR6QWdjejdCdUxnakphRGdvTnc3anFpMVo5Ulc3WVo3ZzNrZGN0?=
 =?utf-8?B?ajJNWEsrVU9SaHM5U25rQjJGemkyMHZhWEVIa3IwQzFIZ3l1VVI5VmRmSzYx?=
 =?utf-8?B?RG5DRHdSMUJuRkFJMHF4VlRhTDhTYm1JYWFRa3doNEtRa2dGeHNnaTBKR2NO?=
 =?utf-8?B?MTFMaGo1K3lDdmdYVUhnbW9GZjhSR3oxYnBMK0NURmQ5ZTg2ajM0N0puOStU?=
 =?utf-8?B?QnVITEJCR0ZFUERIN0wvZElMTDgwOW91dUFPbmEvb01pdDA0WDlYSXB1ekkz?=
 =?utf-8?B?RUpyTnQ0Z1laWDJXTWVDNjJkVENnSUEvQnlINkdkMXZHUDZqRlhRVDZ4TXBU?=
 =?utf-8?B?TWQ5Z1d1eDBYSU1zQW52Yi9aT0JDbk9OWGtJSS91RS9Kc3ZsYmM3dnpNUmNa?=
 =?utf-8?B?dnlwUkU1bHRSUVlSbGovRmZtSXV0YmtRaU5BSU1Pb3BvbVUvSmV6eFZoS09B?=
 =?utf-8?B?blp4bkd1VU43aWdlK1BJTFB0R0krTTlFYnh1UzFkM1JsUWFMa054MEdoeUsv?=
 =?utf-8?B?cURRblZFV3pkVzZmTVcyN2pSdlkvREVtUWNzWTZ0TGxwWlA0ZnR0RExYQnJk?=
 =?utf-8?B?WmpEbldpb3lUZ2pvcURnUjMrUWZFeWNLMGZCd2xNeHdOUGxIczM4YzhOcW5I?=
 =?utf-8?B?b1BkWjRWTzRvcTVwWkhKNWREUnJXTnpnVFY5S1FpbG53SWRUR2ZyOW1xV2Zw?=
 =?utf-8?B?bGVqOHpMTUJ5WHpWMll5Y3lhZWl2c25pWW4yeFgxWHdjaTVnd1hmNUttcElq?=
 =?utf-8?B?dWxLc2VXK0owK2JZcCtiZExJSndoUGpQWkxiVWs2U2FZd05NbXo4ZmJzd0tX?=
 =?utf-8?B?QTRwMXFjVlR6NWRVUlZYSzBLb21RSU9kbjJveWlZcU84cnl1elJpTVM1U0li?=
 =?utf-8?B?Y0tRNWZqKzRsRzZTeDM0ejlIa2l1VDJoQkZQRUowWm05TkYraSsxU2g4ZkZF?=
 =?utf-8?B?SzdZaXhib2U0RWtqSU5Kb1JDWFh4MGJSN0FHYnNmeGxtV0M5ai9rb2xJVmlW?=
 =?utf-8?B?N3dhOFRYRlpLbTVaQnNZSjJxd05QMWs3Q0g1Q0tMeFN5TXpmaDR3MUh5NEhC?=
 =?utf-8?B?RTRvMllxMVpDd2tUbEJrK3l0ZDZUTzVvZnR3YU1lZnRqY0MrN2RxTjQrMjU4?=
 =?utf-8?B?aHpDa0ZjZzd1c1pHQ1hXOWVOeDNPcVZlMzNyZnlzY0Fsam1uWlZHazdONUEw?=
 =?utf-8?B?VHNiQnNjWXAwY3RZeU5zS1hBYldKZUxuR0c2dFFzcyt4R0NtMmFxM21zUjdx?=
 =?utf-8?B?eTVkcGJkK3pwV0Y2akdtNGp6clU0OWdHazY3SDcvQUlpRWJ0SkJLQy9oY1ds?=
 =?utf-8?B?ZmJXd2FudmFES2IzdVJ5OE93SnBhU1Z3ZEkxZ3VkdWRKU29wcm00WkQzeWhQ?=
 =?utf-8?B?ZmlrL29ObEpCMWxYSk12S2Z4UE96L3o0cnNNSEU3QWtneHZraHAvOEFURG40?=
 =?utf-8?B?aktYVlVWSENPUWhTMUtBc0g2czlMZGd5bW9nNmptOUloWVRtOXNqUnpVdTc4?=
 =?utf-8?B?eVNBTWRvQjlydkJJM0xqMFQyMEdNeXRFUmpSbjArSTQ0MktWTE1KektRTXhR?=
 =?utf-8?Q?ceHfUOuWH5YmzHz0cveMELp/lRRs9hofFIqKCFEZvc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1386bc2-d3a8-4e1e-779f-08d9b41a732d
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2896.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2021 15:59:54.6633 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N4gdxhqY8g03lcqSQ0Pqjj0upJKFlRxtabRm30ItIHnkeVaP2PGAnFf+/h+z+YWefHi3U3BY5U198Zmu3wt/OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4881
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
Cc: linux-doc@vger.kernel.org, Mark Yacoub <markyacoub@chromium.org>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>, roman.li@amd.com,
 amd-gfx@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>, aurabindo.pillai@amd.com,
 nicholas.choi@amd.com, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Sean Paul <seanpaul@chromium.org>,
 qingqing.zhuo@amd.com, bhawanpreet.lakha@amd.com,
 Roman Gilg <subdiff@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2021-11-30 10:48 a.m., Harry Wentland wrote:
> On 2021-11-30 10:46, Rodrigo Siqueira Jordao wrote:
>>
>>
>> On 2021-11-29 7:06 a.m., Jani Nikula wrote:
>>> On Fri, 26 Nov 2021, Daniel Vetter <daniel@ffwll.ch> wrote:
>>>> On Thu, Nov 25, 2021 at 10:38:25AM -0500, Rodrigo Siqueira wrote:
>>>>> Display core documentation is not well organized, and it is hard to find
>>>>> information due to the lack of sections. This commit reorganizes the
>>>>> documentation layout, and it is preparation work for future changes.
>>>>>
>>>>> Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>>>>> ---
>>>>>    Documentation/gpu/amdgpu-dc.rst               | 74 -------------------
>>>>>    .../gpu/amdgpu-dc/amdgpu-dc-debug.rst         |  4 +
>>>>>    Documentation/gpu/amdgpu-dc/amdgpu-dc.rst     | 29 ++++++++
>>>>>    Documentation/gpu/amdgpu-dc/amdgpu-dm.rst     | 42 +++++++++++
>>>>>    Documentation/gpu/drivers.rst                 |  2 +-
>>>>>    5 files changed, 76 insertions(+), 75 deletions(-)
>>>>>    delete mode 100644 Documentation/gpu/amdgpu-dc.rst
>>>>>    create mode 100644 Documentation/gpu/amdgpu-dc/amdgpu-dc-debug.rst
>>>>>    create mode 100644 Documentation/gpu/amdgpu-dc/amdgpu-dc.rst
>>>>>    create mode 100644 Documentation/gpu/amdgpu-dc/amdgpu-dm.rst
>>>>>
>>>>> diff --git a/Documentation/gpu/amdgpu-dc.rst b/Documentation/gpu/amdgpu-dc.rst
>>>>> deleted file mode 100644
>>>>> index f7ff7e1309de..000000000000
>>>>> --- a/Documentation/gpu/amdgpu-dc.rst
>>>>> +++ /dev/null
>>>>> @@ -1,74 +0,0 @@
>>>>> -===================================
>>>>> -drm/amd/display - Display Core (DC)
>>>>> -===================================
>>>>> -
>>>>> -*placeholder - general description of supported platforms, what dc is, etc.*
>>>>> -
>>>>> -Because it is partially shared with other operating systems, the Display Core
>>>>> -Driver is divided in two pieces.
>>>>> -
>>>>> -1. **Display Core (DC)** contains the OS-agnostic components. Things like
>>>>> -   hardware programming and resource management are handled here.
>>>>> -2. **Display Manager (DM)** contains the OS-dependent components. Hooks to the
>>>>> -   amdgpu base driver and DRM are implemented here.
>>>>> -
>>>>> -It doesn't help that the entire package is frequently referred to as DC. But
>>>>> -with the context in mind, it should be clear.
>>>>> -
>>>>> -When CONFIG_DRM_AMD_DC is enabled, DC will be initialized by default for
>>>>> -supported ASICs. To force disable, set `amdgpu.dc=0` on kernel command line.
>>>>> -Likewise, to force enable on unsupported ASICs, set `amdgpu.dc=1`.
>>>>> -
>>>>> -To determine if DC is loaded, search dmesg for the following entry:
>>>>> -
>>>>> -``Display Core initialized with <version number here>``
>>>>> -
>>>>> -AMDgpu Display Manager
>>>>> -======================
>>>>> -
>>>>> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>>> -   :doc: overview
>>>>> -
>>>>> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>>>>> -   :internal:
>>>>> -
>>>>> -Lifecycle
>>>>> ----------
>>>>> -
>>>>> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>>> -   :doc: DM Lifecycle
>>>>> -
>>>>> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>>> -   :functions: dm_hw_init dm_hw_fini
>>>>> -
>>>>> -Interrupts
>>>>> -----------
>>>>> -
>>>>> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
>>>>> -   :doc: overview
>>>>> -
>>>>> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
>>>>> -   :internal:
>>>>> -
>>>>> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>>> -   :functions: register_hpd_handlers dm_crtc_high_irq dm_pflip_high_irq
>>>>> -
>>>>> -Atomic Implementation
>>>>> ----------------------
>>>>> -
>>>>> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>>> -   :doc: atomic
>>>>> -
>>>>> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>>> -   :functions: amdgpu_dm_atomic_check amdgpu_dm_atomic_commit_tail
>>>>> -
>>>>> -Display Core
>>>>> -============
>>>>> -
>>>>> -**WIP**
>>>>> -
>>>>> -FreeSync Video
>>>>> ---------------
>>>>> -
>>>>> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>>> -   :doc: FreeSync Video
>>>>> diff --git a/Documentation/gpu/amdgpu-dc/amdgpu-dc-debug.rst b/Documentation/gpu/amdgpu-dc/amdgpu-dc-debug.rst
>>>>> new file mode 100644
>>>>> index 000000000000..bbb8c3fc8eee
>>>>> --- /dev/null
>>>>> +++ b/Documentation/gpu/amdgpu-dc/amdgpu-dc-debug.rst
>>>>> @@ -0,0 +1,4 @@
>>>>> +Display Core Debug tools
>>>>> +========================
>>>>> +
>>>>> +TODO
>>>>> diff --git a/Documentation/gpu/amdgpu-dc/amdgpu-dc.rst b/Documentation/gpu/amdgpu-dc/amdgpu-dc.rst
>>>>> new file mode 100644
>>>>> index 000000000000..3685b3b1ad64
>>>>> --- /dev/null
>>>>> +++ b/Documentation/gpu/amdgpu-dc/amdgpu-dc.rst
>>>>
>>>> While we bikeshed names, I think it'd would make sense to call this
>>>> overview.rst or intro.rst or similar, since it's meant to contain the
>>>> overall toctree for everything amdgpu related (maybe there will be more in
>>>> the future).
>>>
>>> index.rst?
>>>
>>>
>>
>> Hi,
>>
>> Thanks a lot for the suggestions; I will prepare a V2 that addresses all your comments.
>>
>> Ps.: If there is no objection, I'll rename amdgpu-dc to index as Jani suggested.
>>
> 
> SGTM, you mean amdgpu/index.rst, right?

Yeah, but I'm also thinking about this new organization:

1. Create an amdgpu folder.
2. Inside amdgpu folder, I want to create a display folder.
3. Move all display documentation to the display folder and keep other 
amdgpu generic things under amdgpu.
4. Finally, inside the amdgpu folder, I'll create the index.rst for 
amdgpu, and inside the display folder, I will create a similar file.

Does it make sense?
Thanks

> Harry
> 
>> Thanks.
>>
> 

