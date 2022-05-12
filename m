Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 546D252457E
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 08:18:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B8A910FE81;
	Thu, 12 May 2022 06:17:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2053.outbound.protection.outlook.com [40.107.101.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FF4910FE3D;
 Thu, 12 May 2022 06:17:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EFYrPYMRG4cTZzIEPKjiTXm0Kn23hRX42XOiPdnQd3XMTPUoVb7oHo81bFQVqdrP4JbBuCkUNxBxbtXonOZHn6gm0Zyut7sy3OuqTl12EgTla6cwbWITypsDConMpYxffLEB3/g9hLFifXBexoY9v1USLkTXf1A9eKSV3gzhgYnp74qo63gbrLwvAhT7Mut0PJl1puJ8agEjZYEQyFeKeAX+fz1bAESaQkxDDiNm3eSP0bwsZXYDkS4Z0IFLUCtMinZVR2okW/jzIulNg0dhpyMaC5YoeNyQ/zOaRZk003vm8pGVyeQIc35Aa/LHqAaZx9Y5DTeP8hfyHkudgASZfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u3RjInYZBHWdKjhxEbjU2gHVisuxzL7N8uK/YEVJTg4=;
 b=HHciG8vrOpc0MM7PAmguK78K+mU8MEDFCnZSC2mOX1TMsrtUF5JQxCgzsxUPK8yJW/0pdzxaRD2/6Q3BPWJRoh2IV4SGO1VNHb6lovPVla18Z+ITxLIPyruhQrrRjHsCmApl35RwOZ5uqrHNhfeLLV0/mxw2edZTqz36uRQSny5z2dbTXNOaIjJcYLQfyQivNQS0krqG6/QosM0xByRDtCQszFdtz35HvRd4oOsTdBVDWyT0fq7GSvie4Q29zRtqXfb8Yjw7qQ+wSZTAaNCAA/AerCYT/QDUWGfGJqxlaWOCWHSu6z24q1peTACi4q9qTeRGz9dR54/1+rwVd5MnOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u3RjInYZBHWdKjhxEbjU2gHVisuxzL7N8uK/YEVJTg4=;
 b=JY87c+K9oOyPflQPf+D+ifUmDvBWzM756avIw4Emtdy2dmOMnEFkV62XVCb3zmEBvyVIVWSfye4ghUm8GNC0VwKXVRprTEVybj+CEXPuQ33rq658/OWk7IP8mOPSeae/k6MbM5uinhmtaPU67LyPQO2fF56/m8xpFSGKxlTPxgg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN0PR12MB6222.namprd12.prod.outlook.com (2603:10b6:208:3c2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22; Thu, 12 May
 2022 06:17:55 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::fdba:2c6c:b9ab:38f]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::fdba:2c6c:b9ab:38f%4]) with mapi id 15.20.5227.024; Thu, 12 May 2022
 06:17:53 +0000
Message-ID: <beb6cbd2-445f-c864-3283-ebdacaed37ac@amd.com>
Date: Thu, 12 May 2022 08:17:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/amdgpu: Add 'modeset' module parameter
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>, Lyude Paul <lyude@redhat.com>
References: <20220511181935.810735-1-lyude@redhat.com>
 <CADnq5_OWH-Bat3OyCmHz6hTE++7hPLXqqMgg2=Nk6HB_Qk61JA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CADnq5_OWH-Bat3OyCmHz6hTE++7hPLXqqMgg2=Nk6HB_Qk61JA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0006.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64a0d01f-e4c7-4001-00a2-08da33df2568
X-MS-TrafficTypeDiagnostic: MN0PR12MB6222:EE_
X-Microsoft-Antispam-PRVS: <MN0PR12MB6222149E620874B5A8BC081083CB9@MN0PR12MB6222.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C3Vrxe/60FAD6N2c87ZEGyVnPlTPu5qBFQUo9IvfO3oyhjyhfv3opxbmkqug+OrA0UZBYvSKvN1+N+/SqwOsbT9EweFiUVIyjoAVwWHyfh1edgaBBc6yNepLVbKA4L7w2GsKwgTYr4CmsnWKOxjVUzmaZMckXMoN9ncYlTniMvHJ4aq8QpM6o2r2oVt97PW0e/KQ4JxqxU6TOf9a9ump3WcfSU40oUHVWmf9lwkrexzABvO1dU0gr9E0F4mMAhf7oKxhsLyviEvaEDj9h6v38lPHfwlhi7ed0+s0oECUJqZSN+XoVduPdNWgEPERdrEuZaNT1CdOVcaH+fGqLLAwZCzkb9HcV7ffk2V+tONYNZpTteDh5Eas0edpfNnOmHA0JIszfluiZSZTvW+8u6n90MdAgr/Ym1RllSkxDjs6QfGBkYO8N2N7/2cka9PG+KFYSPOFRx9+gvqtiz6ZRl/VmtjSG824bNHigN285B2lDNOPxLOsR/Ul5pS2CnyTOlkqRvoZUPA9MkAhBdBrMBdXSIRTiQEmIBQJ4L6h16jQ70UHWPO+8/YJ2pref4zJR3B62oV/JoJkEbuXyQloOO4x8YWXo9hs9HcZETTbWs8SFNYcXTx6CzzH+kU7yeziNAHKOfMP5iCvsU0JhUSZIc3pGR20/XcAO9AXg0hn2p7noUnBfP0CZWhgXyw21Md5tLHZMS9bPeyPwn6OR6AehRt8zEvG9tD729HIRhSaW46wsfg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(36756003)(316002)(6666004)(54906003)(2616005)(186003)(31686004)(5660300002)(110136005)(83380400001)(31696002)(86362001)(4326008)(66476007)(66556008)(6512007)(26005)(8676002)(38100700002)(66946007)(53546011)(508600001)(2906002)(6486002)(6506007)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXBDc0dac0VnakFHSk92WE1kL2l5NmpOQVNVa3ZlVVdva3dNUnZiamt3YWJr?=
 =?utf-8?B?aTFFZkNLZVYzdjh4cHIvZWd3YWFhVDhtSUdyejdmeTEzaCtpcDB5a3QwcHNH?=
 =?utf-8?B?UHYzUzdEZWpMajBtT1UvTVpURzVrZEpFOHFYUnRKNTZBNFFUYXZiOWJxK3M3?=
 =?utf-8?B?M1NPUUd0NnFldFMwQnc4ZGFzQ1VJaTVHWHErZVZUR3Q1OHpXUy95QVF6ZHpS?=
 =?utf-8?B?WjloRmNMSGoyakN3QStuWXlDZGErNWU0NnJ6QzgzSWVVSVZISXQxT1NMSUtB?=
 =?utf-8?B?NmRmOVEwL014eUhtREp3Qm16SmlucXdQaEZlTUtrOHNtNUhQcHhQd1JFWDVS?=
 =?utf-8?B?SnI5ZnliS3g0TGNTNk40ZVZRZWpmN1I3L2hIRDVNVERVUzVGVjhSWXR4Zm5G?=
 =?utf-8?B?Q0ZQQ2ZqNUV0UUZvMXBweUcvVmdFMmZIM0d5b3RFbEpNYVVaTEtmNGE5eTMz?=
 =?utf-8?B?Yi8rQUtiRXlsT2F5YzdUNFdWaW9IL0o5RG93ZFBhRGVGTmxSeFZwdVFMSUhu?=
 =?utf-8?B?K1lyTE1pOGZRQ0JoeUE4OUhPcmdPTjY0S0lJVWkwTThPUDZoUS9kZHgra1hr?=
 =?utf-8?B?aGd4V3ZLMXBMdUVhdlhVcG9GeERGYk1zOUlFSnFvZUNLazZZWUtpbmxZYnZH?=
 =?utf-8?B?MkNhRlJuVUQxUHNHbTZGeXhJMUFRVjhTakFTeXMycVpHTjI3ekFpcUltNlJO?=
 =?utf-8?B?eGovUzFDZlFFUWR1VzJrQk5NS3FoTStrbUd0QVh5NlBpcVhHRjBUeG1RSkM2?=
 =?utf-8?B?VytXYUdPK2dwVU8yY2J1WFhDTlpVYnJqbEE1N0FFUUV4bGlOOGprdWVvcUNp?=
 =?utf-8?B?N0tZODdPaFhDQ1dvUDdhMkVOc3FHbmhEWldTWFRBYkExZU1tMUR2SmVXcUZZ?=
 =?utf-8?B?UUZsa2x3c0F1cUJWZmxETmg3Vkh6MWlTTTR6WjdQMUZCV1IrVTZJaDN6S1M0?=
 =?utf-8?B?aE9IYmlBTUh5Q2x2ZjBQUFkxWCt5c0lYc3pkMVFQTERmSGEzSG91Y3RabjRp?=
 =?utf-8?B?Q01vc0hPZUpDemsySTF1YndkWUNuWEgyUDh6RkcxeWpnLzRsUk9sWWhTblU1?=
 =?utf-8?B?eTRRcGNIdktUUFdJZ1RoUFppVjRsK0RMRVFIRDFEaW95WTlVUUVYalIxWUFs?=
 =?utf-8?B?WGM4bWN5TWV0V0t6bC9zOG1ET2JKbHdZSTR1dFR1TTZWN0ZMa1lUTlZYU2RM?=
 =?utf-8?B?dGJsTnYxbjMrYUhJK0RIdExtd1VXd2k2NFExc0Izc2pPaUdTbFNSYVRUN3U3?=
 =?utf-8?B?S2VWYVVKR2t5Zm5BREZoUEJWSG80OTdtTWh2VS9yU3RwQmVhKzEydlQvQUht?=
 =?utf-8?B?WXI5b3J2S244b0pVOWZzUFBzeFRPU2ZzSFdjR1hjQUNxRHlHVWMxN1JrNFBj?=
 =?utf-8?B?YWs2dnY5MjFYMUFrWEJuK2R1cnVlYzJtN1hQZ0tTY2FXL243TE9ScFEyUENk?=
 =?utf-8?B?a2hoUnJveW1iT3BsREFCZTdjUmZJbG4zTGxRK0JmdFB6NlQxaWhZMHlIUjVY?=
 =?utf-8?B?Um5aMEpacTY4bXBEajlyQUE1YzJUM0t6Q053ZGZXS3BjcGJucVVldDhHL0Qv?=
 =?utf-8?B?SzZwSHJZVWF5eEg5TjNaUm5UZkFHS2xqOSt3aUtDRHFFT3lXN0lrRGorbHl5?=
 =?utf-8?B?WnpLQTdRejVkOG5vTUV6aGNSSW9oRzNrdjJ4MlpvWjZqMmVJT1UzbkhiRGdu?=
 =?utf-8?B?QVluT1dzT0VNcGc0YTRpOUlzYkl4akJqY1FWaTROZkF6b0Q2UitPdW9WL3dW?=
 =?utf-8?B?OU5LdGlKeWhGM25TazMvaHE0MFRpMy9idEZidjNXMGRJUTBJM1VISTFMRzM4?=
 =?utf-8?B?amtramV3bm00cTVaUzV0OTNWcjVSckFQUUZsSUtDSElBZTBmeUFJRmV2Y3RF?=
 =?utf-8?B?NG9hZnlrREkyZWZUT2gzdkJQSDdpT3FlcFZuU1BSZ2prRHYvS3JIbVNhYWxj?=
 =?utf-8?B?ckZ4TWtaTTI3OVhmVDE4ZUxJaGs0YTlaWi9vQWJRazRMcTY4NnhTYzNHSjVv?=
 =?utf-8?B?TDJISzBEckJOc0FuVDhvVlZjK3pUN1JxdXo0M2UvUlR1MklSSjdEbnA4enZR?=
 =?utf-8?B?blA4WW5WOFpoM2p6RjFXN1M4V3dwclVyNTJvUVBMaFgxdEU3ZDNZR21kamtC?=
 =?utf-8?B?V1RkL0wvTkhiUGJpTnRJVTlHSkhPRkYwMnI1VCt5WWtxUGxlZWladzNBWisv?=
 =?utf-8?B?UGk0d2U1THNCOVVMRnFMWk85eVl2alRCdFE3ZHZZMXNxZFBYRkxjbm9ZZnJU?=
 =?utf-8?B?T2dja282Z0xkaUF6aXA2TitJUEJoM2hlWTRjTkNPRjd6LzFDamhiSlZDQWox?=
 =?utf-8?B?SHJXckdqTm5aR1NvR1VBM2toMHRuaFRSVFpTY1NDcjYvM3MzS3JyUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64a0d01f-e4c7-4001-00a2-08da33df2568
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2022 06:17:52.7611 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jkLcLrl6ISU4fTc4XPaOYplxmc0h3NuWTu7wFuCAyd2NSK0C+6s5BcrNhaHH/IWs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6222
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Solomon Chiu <solomon.chiu@amd.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 11.05.22 um 20:36 schrieb Alex Deucher:
> On Wed, May 11, 2022 at 2:20 PM Lyude Paul <lyude@redhat.com> wrote:
>> Many DRM drivers feature a 'modeset' argument, which can be used to
>> enable/disable the entire driver (as opposed to passing nomodeset to the
>> kernel, which would disable modesetting globally and make it difficult to
>> load amdgpu afterwards). Apparently amdgpu is actually missing this
>> however, so let's add it!
> You can already do that by passing modprobe.blacklist=amdgpu on the
> kernel command line.  I don't think we need another option to do that.

Yeah, this already came up multiple times and so far we have always 
rejected it.

Stuffing that into drivers is not a good approach I think. If we want to 
prevent some device from exposing it's display functionalities we should 
rather push that into the drm layer.

Regards,
Christian.

>
>
>> Keep in mind that this currently just lets one enable or disable amdgpu, I
>> haven't bothered adding a headless mode like nouveau has - however I'm sure
>> someone else can add this if needed.
> You can do this as well by passing an IP block mask which disables the
> display IP, or media IP, etc.
>
> Alex
>
>> Signed-off-by: Lyude Paul <lyude@redhat.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> index ebd37fb19cdb..24e6fb4517cc 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> @@ -872,6 +872,15 @@ MODULE_PARM_DESC(smu_pptable_id,
>>          "specify pptable id to be used (-1 = auto(default) value, 0 = use pptable from vbios, > 0 = soft pptable id)");
>>   module_param_named(smu_pptable_id, amdgpu_smu_pptable_id, int, 0444);
>>
>> +/**
>> + * DOC: modeset (int)
>> + * Used to enable/disable modesetting for amdgpu exclusively.
>> + */
>> +bool amdgpu_enable_modeset = true;
>> +MODULE_PARM_DESC(modeset,
>> +                "Enable or disable display driver (1 = on (default), 0 = off");
>> +module_param_named(modeset, amdgpu_enable_modeset, bool, 0444);
>> +
>>   /* These devices are not supported by amdgpu.
>>    * They are supported by the mach64, r128, radeon drivers
>>    */
>> @@ -2003,6 +2012,11 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
>>          bool is_fw_fb;
>>          resource_size_t base, size;
>>
>> +       if (!amdgpu_enable_modeset) {
>> +               DRM_INFO("modeset=0 passed to amdgpu, driver will not be enabled\n");
>> +               return -ENODEV;
>> +       }
>> +
>>          /* skip devices which are owned by radeon */
>>          for (i = 0; i < ARRAY_SIZE(amdgpu_unsupported_pciidlist); i++) {
>>                  if (amdgpu_unsupported_pciidlist[i] == pdev->device)
>> --
>> 2.35.1
>>

