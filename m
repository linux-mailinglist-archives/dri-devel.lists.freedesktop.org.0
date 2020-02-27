Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE73F1721C6
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 16:04:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE24A6ECCF;
	Thu, 27 Feb 2020 15:04:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2088.outbound.protection.outlook.com [40.107.92.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F8FB6ECD0;
 Thu, 27 Feb 2020 15:04:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kJXfCli3uVQLaxqevQnNLUuD8t7KG4z0QxbTo194vjyErHn5Gsmr/4p8CbszX/DSQMPLv52SiIJggIatRjIGTX/8jnEGeknN21+At4Ma4eMY+2IEjO+A0g4YRe2zfN8q+apC8rdhbOYILlgUgpov5T4fxFN2GneSlKc96F8CZVXgBlC/9bLho+S3Hx5CU66WVB4/fCAjr/cMzdXQGFEtnpB8fYNfOEGUEIUY55Y7I1QoNOnzuXcCiifGX64CpNaytfohM3JlWV9MmBHAfN83JBe4uRq4MnRGb8lx8k+IhCt9gTPbt6mdXa4fhRai2gDu1HoqAYnzeAnua2FA43Nzlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+vq3vwzdZAhroNcvfspZOUwAqgljQrvZe9oxFIxVB2s=;
 b=Ny9gfTlrxW6TmTumhORQlCw4ZejcjmUm190Y+X578m5wHnWwJaJHLMZWSU+nZ9UZ1PraYktM/XPONvpQIKTtXqcMRkk9VIDEJqRtrnUUOTckdAd1CMQahQ6H4iOVwuuy+3eQ2oqLS/MJUD5YKDqoe0MwbEsly/D1QmAf8RaZusygUmUTHD/YrnO5vDFdJSw2yPZYoIoRtcLG9XJEc+MkPjlr9vFrN+nGWdeJdQ4712OhCJjp4v71lK2ERAq29VI4frk/cjdBrQp3ilT3JLkZ5AI71h+DsqYQtq3ueH57SL/AYVSBMLtQcgx4J1noRb8qP8VFoaLvOZdW1KE3orHuEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+vq3vwzdZAhroNcvfspZOUwAqgljQrvZe9oxFIxVB2s=;
 b=dvXkvMs35SfIIbHi72EJcK955O7zpFTwAwcc8tgd46s6u7Vkr9/f5aRo2Q00E908SBGhzQngKucQQQ+hWNWRh9bDsXVe/32R3J9wal8d8kteJTW1u13Hs+HQl+aVlLbo9Mqw2Ifh05DEehXyApqLTg5lzuRIL/z9YGG3GyGZMMQ=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mikita.Lipski@amd.com; 
Received: from BYAPR12MB2903.namprd12.prod.outlook.com (2603:10b6:a03:139::22)
 by BYAPR12MB3639.namprd12.prod.outlook.com (2603:10b6:a03:db::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.21; Thu, 27 Feb
 2020 15:04:25 +0000
Received: from BYAPR12MB2903.namprd12.prod.outlook.com
 ([fe80::153:48c3:6714:53ee]) by BYAPR12MB2903.namprd12.prod.outlook.com
 ([fe80::153:48c3:6714:53ee%6]) with mapi id 15.20.2772.012; Thu, 27 Feb 2020
 15:04:25 +0000
Subject: Re: 5.6 DP-MST regression: 1 of 2 monitors on TB3 (DP-MST) dock no
 longer light up
To: "Souza, Jose" <jose.souza@intel.com>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "mikita.lipski@amd.com" <mikita.lipski@amd.com>,
 "alexdeucher@gmail.com" <alexdeucher@gmail.com>,
 "Lin, Wayne" <Wayne.Lin@amd.com>
References: <99213368-5025-8435-502b-3d23b875ca60@redhat.com>
 <CADnq5_OUt5XaJ_Nf23F2zsKeuPgoka8p2S6ny-H2WK==Ncg7vA@mail.gmail.com>
 <b0181c20-017b-7e3f-13c0-3ea5b98cadaa@redhat.com>
 <CADnq5_MjaOD+QrupjQwjdu-MgVZm1sg1x9=4uxdv92u1xuSdvQ@mail.gmail.com>
 <77b812d5-5b87-49b7-87dc-16d50a5666df@redhat.com>
 <06d506c1449a59a422fd9f246c7ed9d299139cf9.camel@intel.com>
From: Mikita Lipski <mlipski@amd.com>
Organization: AMD
Message-ID: <00510d21-f308-a75e-c0b6-3fd3b1ad4a13@amd.com>
Date: Thu, 27 Feb 2020 10:04:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
In-Reply-To: <06d506c1449a59a422fd9f246c7ed9d299139cf9.camel@intel.com>
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0034.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::47)
 To BYAPR12MB2903.namprd12.prod.outlook.com
 (2603:10b6:a03:139::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.29.224.72] (165.204.55.250) by
 YT1PR01CA0034.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::47) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.14 via Frontend Transport; Thu, 27 Feb 2020 15:04:24 +0000
X-Originating-IP: [165.204.55.250]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6400b6d3-1b43-4db8-fbdb-08d7bb965566
X-MS-TrafficTypeDiagnostic: BYAPR12MB3639:|BYAPR12MB3639:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR12MB363963B1068A99E1A671F9B5E4EB0@BYAPR12MB3639.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 03264AEA72
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(199004)(189003)(36916002)(4326008)(36756003)(52116002)(31696002)(5660300002)(45080400002)(81166006)(66556008)(66946007)(478600001)(31686004)(966005)(2906002)(81156014)(8676002)(66476007)(16526019)(54906003)(316002)(16576012)(8936002)(186003)(6486002)(6636002)(53546011)(956004)(26005)(2616005)(110136005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3639;
 H:BYAPR12MB2903.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sZRre4kHhznrO3vP4Ny7qL1TSqsFYSlDO4ISwGBND5hgorl8ZwjOP2e8Nd/7+tptE48bV4qwpF3Lum7Ci+r5NPSWvH3Y5tPFmhdAs+is+lb+WglFR+ZGahB+7wcSn+wBoMZzvXI4KSvquBZRyfMLpDIZVQPLMtqlA55F1uKwP4LUoEaOBZj/rQY184FbxNvjv/5qu0uMeJC70nnjjWxUKfTW2duq2lq/JdwhPdHWOGQZ+XgGXJXd1kA/VaublgvpO89duvCeTGDYou4QAZX1AV6uvCzlefhwzhBtEdIyzGKOEbfesBUmgLU2MJRhMxlfpePMHTFmS78PgDFaAdoKEoG4NjhAHxHgrUnXkHbkl3c/6PfwJgFavCcmhqc6QQAKf50Vat6fpV5NL5i7qxxm9+79w67afFoQwF8LE2s0IempNYSb0CTTw0HhrvE7J/zTU0Z4WuKiCOSos1iSlwlWVb0wTBYeSuRPs5KE4bQuP2vXlLFRBFqSDf3Z1CRI6PImMRi4faO49yFVY9jBkCP5Xg==
X-MS-Exchange-AntiSpam-MessageData: zpQPxVLflf1s7E/7N29xNV38aCxeB27TgmOkBJ6reuli2L/mOSGEKXtTeVNMxMvhcEHo5uxPrWGYNb3on8kNBNfjVysxBSq0bDsxUS3GzrhIcKpPp2lF3hq8rAWwm97u1aK3vK/QvVmXvkHqZKdxcw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6400b6d3-1b43-4db8-fbdb-08d7bb965566
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2020 15:04:24.9844 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vSa8tWoY4L2rmKwS+7ZFit0owlQxFFMPeBdCae4K7cRmGwDwmZB+5N0VhhVFNPNj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3639
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/26/20 6:41 PM, Souza, Jose wrote:
> Hi Hans
> 
> Just commenting in the "[    3.309061] [drm:intel_dump_pipe_config
> [i915]] MST master transcoder: <invalid>" message, it is the expected
> behaviour for anything older than Tigerlake, from TGL+ this will be set
> in MST mode.
> 
> On Wed, 2020-02-26 at 18:52 +0100, Hans de Goede wrote:
>> Hi,
>>
>> On 2/26/20 5:05 PM, Alex Deucher wrote:
>>> On Wed, Feb 26, 2020 at 10:43 AM Hans de Goede <hdegoede@redhat.com
>>>> wrote:
>>>> Hi,
>>>>
>>>> On 2/26/20 4:29 PM, Alex Deucher wrote:
>>>>> On Wed, Feb 26, 2020 at 10:16 AM Hans de Goede <
>>>>> hdegoede@redhat.com> wrote:
>>>>>> Hi Lyude and everyone else,
>>>>>>
>>>>>> Lyude I'm mailing you about this because you have done a lot
>>>>>> of
>>>>>> work on DP MST, but if this rings a bell to anyone else feel
>>>>>> free to weigh in on this.
>>>>>
>>>>> Might be a duplicate of:
>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fdrm%2Famd%2Fissues%2F1052&amp;data=02%7C01%7Cmikita.lipski%40amd.com%7Ca48e7470afee41cb208508d7bb155ad0%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637183572706454329&amp;sdata=AKmPhCqvvKtgzDBaobU4g74bErQQ7O3aL%2FJ8Al2Ey2I%3D&amp;reserved=0
>>>>
>>>> Looks like you are right, reverting the commit which the bisect
>>>> from that issue points to:
>>>>
>>>> cd82d82cbc04 ("drm/dp_mst: Add branch bandwidth validation to MST
>>>> atomic check")
>>>>
>>>> Fixes the issue for me. I will add a comment to the issue.
>>>>
>>>> Note I'm using integrated Intel gfx, so that means that this
>>>> issue
>>>> definitely is not amdgpu specific.
>>>>
>>>
>>> I'm not too familiar with the mst code, but I wonder if we were
>>> exceeding the bandwidth limits in some setups and it just happened
>>> to
>>> work, but now that we enforcing them, they don't which is correct,
>>> but
>>> a regression from some users' perspective?
>>
>> I seriously doubt that is the case according to:
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fsupport.lenovo.com%2Fnl%2Fen%2Fsolutions%2Fpd029622&amp;data=02%7C01%7Cmikita.lipski%40amd.com%7Ca48e7470afee41cb208508d7bb155ad0%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637183572706454329&amp;sdata=64uP50QojK2HkemDq3EGNKCVEgVl1ZxucyI%2F%2Bkk2Ng0%3D&amp;reserved=0
>>
>> The gen 2 tb3 dock can handle 2 external
>> displays at 3840*2160@60Hz together with the internal
>> panel being on and both my external displays run at
>> 1920x1080@60 so I'm consuming less then half of the
>> maximum bandwidth.
>>
>> There definitely is a bug somewhere in the
>> cd82d82cbc04 ("drm/dp_mst: Add branch bandwidth validation to MST
>> atomic check")
>> commit (or somewhere else and triggered by that commit).
>>
>> Regards,
>>
>> Hans

+ Lin Wyane, Lyude Paul

Hi,

Sorry I'm late responding to the thread.
The reason why this issue could have missed is because this patch was 
pushed as a part of DSC MST patch series and with DSC the pbn is much 
lower so it wouldn't fail this check.

Anyways this check might have exposed a different bug in DRM. It seems 
like the variable of available_pbn doesn't get updated on the ports in 
the topology so the calculation of branch's bandwidth limit is not 
correct, which would cause a branch bandwidth to be bottle-necked by 
pbn_limit variable.
 From DP 1.4 standart it seems like DRM should update available_pbn on 
each port, when processing RESOURCE_STATUS_NOTIFY sideband message when 
topology changes. Right now DRM doesn't seem to be doing anything about 
it. Was it the intention, or has it just never implemented? If it the 
intention, then the patch should be reverted till a new solution is 
delivered, otherwise it should be treated as a bug exposed by a branch 
bandwidth check.
I would appreciate any suggestions.

Thanks,
Mikita

>>
>>
>>
>>
>>
>>
>>
>>> Alex
>>>
>>>
>>>> Regards,
>>>>
>>>> Hans
>>>>
>>>>
>>>>
>>>>
>>>>>> I'm currently using a Lenovo X1 7th gen + a Lenovo TB3 gen 2
>>>>>> dock
>>>>>> as my daily rider for testing purposes. When 5.6-rc1 came out
>>>>>> I
>>>>>> noticed that only 1 of the 2 1920x1080@60 monitors on the
>>>>>> dock
>>>>>> lights up.
>>>>>>
>>>>>> There are no kernel errors in the logs, but mutter/gnome-
>>>>>> shell says:
>>>>>>
>>>>>> gnome-shell[1316]: Failed to post KMS update: Page flip of 93
>>>>>> failed
>>>>>>
>>>>>> With 93 being the crtc-id of the crtc used for the monitor
>>>>>> which is
>>>>>> displaying black. Since then I've waited for 5.6-rc3 hoping
>>>>>> that a
>>>>>> fix was already queued up, but 5.6-rc3 still has this
>>>>>> problem.
>>>>>>
>>>>>> gnome-shell does behave as if all monitors are connected, so
>>>>>> the
>>>>>> monitor is seen, but we are failing to actually send any
>>>>>> frames
>>>>>> to it.
>>>>>>
>>>>>> I've put a log collected with drm.debug=0x104 here:
>>>>>> https://nam11.safelinks.protection.outlook.com/?url=https:%2F%2Ffedorapeople.org%2F~jwrdegoede%2Fdrm-debug.log&amp;data=02%7C01%7Cmikita.lipski%40amd.com%7Ca48e7470afee41cb208508d7bb155ad0%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637183572706454329&amp;sdata=eHPlfCRZXIPp9O%2B9CHvwb1kg5ffIhO%2FFFgwTcuWFKHM%3D&amp;reserved=0
>>>>>>
>>>>>> This message stands out as pointing to the likely cause of
>>>>>> this problem:
>>>>>>
>>>>>> [    3.309061] [drm:intel_dump_pipe_config [i915]] MST master
>>>>>> transcoder: <invalid>
>>>>>>
>>>>>> Regards,
>>>>>>
>>>>>> Hans
>>>>>>
>>>>>> _______________________________________________
>>>>>> dri-devel mailing list
>>>>>> dri-devel@lists.freedesktop.org
>>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=02%7C01%7Cmikita.lipski%40amd.com%7Ca48e7470afee41cb208508d7bb155ad0%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637183572706454329&amp;sdata=im2LrBE%2BgjCL%2FN4%2B%2BZOOu6Eci5SuaZrT8l3mOuDRQH0%3D&amp;reserved=0
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=02%7C01%7Cmikita.lipski%40amd.com%7Ca48e7470afee41cb208508d7bb155ad0%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637183572706454329&amp;sdata=im2LrBE%2BgjCL%2FN4%2B%2BZOOu6Eci5SuaZrT8l3mOuDRQH0%3D&amp;reserved=0

-- 
Thanks,
Mikita Lipski
Software Engineer 2, AMD
mikita.lipski@amd.com
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
