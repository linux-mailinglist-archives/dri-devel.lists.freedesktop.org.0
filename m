Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A273668EF34
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 13:41:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8783510E771;
	Wed,  8 Feb 2023 12:41:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20604.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::604])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 653FA10E76C
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Feb 2023 12:41:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F7Sa37reFbouHBFdTJ2n5G/1CWKrZtZY7fm9wkdjmxMNsqb5mzsQHsElakDuaIbqJNFIhMLSL86QGpaV7aid8h4wJ8303KB5qZijQdJ2k58fG/QFE36IAbMl0YHGeQhhtnf+msNLVZntIDLczuybj1rFkLVsHy687edhh6iiEFP5f4rXxNCj3b3mjHfcc5g7DbIJ9KJFZWEXTsoAIC0xUBN0NvmThTdpQlXpFDcIzS+Dxfa6pO7lEjmZ0atVbqZVrbp4HvXUp11MxXBlxx2ihVHEZfzjrWxJgi3ZWvvdBpilCGyM32QmjsEm45xmxOSxHBmEBEpRFxzHkGm4ub5wgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gKjQkL98cMUfLGUK/lqyDpyGC4YGnUuDMHGeh/mh2nI=;
 b=YioqFl3pAjQQdrerdGsp+hLCJBfkCFPJjyk2CZcSQWt+dqBYsu9+cB71h0uQ7nxTqbCPYf6Gu1HWD2vj9wV6tc8H5sx/tb8KdI2QVWr9b5OsucBYiakgbdFSED5GDh4KixEQs4s000GaXc3rh09CGZDQGhxAyIAtH+dSuh6DxTgx1jOecG99Bb3IauN/ZoTh5fF255Dk7+f8e6qOoox2MsguszkQJsaf53319neL8If1u/EgwpNtqZViwY4U9Q2SKRw1/4a4QVzoIZABRpx5F1CRAi9jZPetIyZOzEJrswJcDLtCY4xcjuL28tUB4cMnJVMEWQ7bUxsCbh7KgJ+9bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gKjQkL98cMUfLGUK/lqyDpyGC4YGnUuDMHGeh/mh2nI=;
 b=YpH4CVu0Ny4zBwe7RwgVvbKyApFMfYnCCTfp6oFJqBg4ENXnmCGxnFZpkr8RC6VSFKJTOjxgAnNNiiB3gnMG9lf0Zgq1bOxXbkek/COzIN3SOF2K9TZkWcv0IhvR8XlImgbMVLcqvgoZxsqjz7eQYbTy93mtKzaesi2CMUo/gA4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by IA1PR12MB6626.namprd12.prod.outlook.com (2603:10b6:208:3a2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.36; Wed, 8 Feb
 2023 12:41:33 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6064.032; Wed, 8 Feb 2023
 12:41:33 +0000
Message-ID: <ac595020-df15-6a33-ed18-d71afa2dd816@amd.com>
Date: Wed, 8 Feb 2023 13:41:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [drm-misc:drm-misc-next] [drm/ttm] 1802537820:
 WARNING:at_drivers/gpu/drm/drm_gem_vram_helper.c:#drm_gem_vram_offset
Content-Language: en-US
To: Matthew Auld <matthew.william.auld@gmail.com>
References: <202302081038.984b8c1-oliver.sang@intel.com>
 <92630398-efd1-24a4-be2b-9e4e7a577f13@amd.com>
 <CAM0jSHOcvZoyv-y6bnvFaUybRQsDx_mfOydL1uaNM4T4PgcA=A@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAM0jSHOcvZoyv-y6bnvFaUybRQsDx_mfOydL1uaNM4T4PgcA=A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::20) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|IA1PR12MB6626:EE_
X-MS-Office365-Filtering-Correlation-Id: aaed1567-eaf1-4253-0933-08db09d1cf04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R3W5CsCPjE7EvvG+C/+STSA6ZmA9Sz+xuKR6y7OtzbhW0LlzUykBR1T3St7REm9lz6uEgHT3IyXZ2IQIfeR/mfuuTCEAbyk2mRgSzs5qJE6C5AWxMHRFp67to91HoJLLDGIao/D6Xn7Hj5Cf/rgCuOKQCDMvCqxEOTNeEn7stX7TE7WlttXhvUfVk9L07/qAEn59U7O2hjlKp5UDCFw5MnRl4TOxzw2EOM8EFIyjOScmskyPlVo6SzAckBNsmNcoKkdRdOa9altY6yIWCmHnejkZsO8CR7OxBhhMdCbHtodLC124Wh8sxH7WZl8Yr7Ikb5ZWQG4AOLTYaoe0Kr6Fj8T5IwovPk7qG9D0I2QpgoN0nxcyW+V5UFc38ubdrhMmauwF8p0cA2+g/6aG6zvhaYEGrrW6ea7GAV2NiHDCchHZjniCRi8CMMl7R/83Fgh1H82oiKiDz7qqFPyOr7erPWRsGZWbc4c6epIC3v38ayZ2d1N+Pnlrn2+rAPHtHCjpnPGdbiDbhBkNFT3wNDwZ4XWwsCt6Kguhapcu7V7RaoDFGrMz+3pTPxkWYx7lxv7KNwv8wAChKADFqmbC600lTHS6iEdX8OWTqMkY72Gq+TdBQ62axR6XNCeowchUhHI9O+peMsjnBbEnRKm4fQfS7q3QtQaDkyWFSbyGHmBS9jIWOfFDw2DPB1vnrbYwgTGCet437d3WkUWQYJ9AWPyXSAZ2qy25ne6liXgDiCpOwG3hz2vx7Kyou9N91YNYx9jgbuv1kU+4GenmKKtAWgzpBOMa3Yry4/h1Ql1X6KFhtCwYeFdF3Tnf5cI+Xlgeg/PA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(396003)(346002)(39860400002)(136003)(376002)(451199018)(38100700002)(31686004)(6506007)(41300700001)(6512007)(186003)(8936002)(6916009)(8676002)(4326008)(66556008)(66476007)(66946007)(66574015)(30864003)(5660300002)(36756003)(7416002)(2616005)(316002)(86362001)(54906003)(31696002)(6666004)(478600001)(6486002)(966005)(45080400002)(83380400001)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGJmQ1p3VnZMd3AwUGVsMUE5RWt1aU1lVCtPM1V0Y3daTVo4WVliTlAwYTdp?=
 =?utf-8?B?NnVYNU0vblFQd1FVcTVRdnFUSk1ZMSswdU5ta2NmK1VERDZaMlF0K1pQSDNW?=
 =?utf-8?B?RkMwbTBGbXhuaUpIVTFqQ3R1b2UrOWlQbkcyWnhUVDJybVhRUkdPTVJZNExt?=
 =?utf-8?B?MmJqQ0hSc21xbHV0aE1tMHRkc3YyOG1WQ0tQUVM4a1RDK3ZnaWVXOUlISGJI?=
 =?utf-8?B?U3dDRHdJOHhjNm0wMGNidUhtNitUbzhDMWkxSDZkQUpvdm9ENFlRbTNXVUpL?=
 =?utf-8?B?R3kvM2w2c1ZXTUU0NEp3bW5hN0hPUFVtS0lZU3E1eEVpQlNseVFxQ2dhcUM4?=
 =?utf-8?B?ZVlpSEpoM2FVZ1J4enF5UGtoY0paUzBxYmQxVlJEYXZwOGkvT1BzTjRhVit1?=
 =?utf-8?B?YlBuejNNT0pwd1N4bjBuRHNnT1YvWi9zSnAvYmR4Sy9OcDdtTXMzQmh1VGMr?=
 =?utf-8?B?MnkzZkxSem8wejU2S25oR3ByY3BIWVNZNzJQTkxhc0d1UzdRZFRZWHpMOW5V?=
 =?utf-8?B?OXdhUE5HSzdGTWhHVDJRTGw4SFF5bzNLZWV4alE2WUFwajE1Y2ZyMlFCQWQ1?=
 =?utf-8?B?WkRHQU9UY0FkbG1KemhxbW9oSmFPd0EwNWFwWW5VZElnVUQ5Q0hQK09YOTJQ?=
 =?utf-8?B?N0VFSkcxc25nSExYc1VybUdoa0dzbTdQeFRnMytJV2RzQUNuK0F5K25TdlJS?=
 =?utf-8?B?STN4RlBOaUdydExleS9TVE1CcUxIdDd2ekRJUVVrMnYwOGxaUkE4elR5OExT?=
 =?utf-8?B?aTBmQzlpOXdtaWpTUXZQVnBHdy9pQTN5WHk4UE9NVGFQNnF2bUE4N0tBTER0?=
 =?utf-8?B?a0RCUVlpaUR2QU4wVXA1ZlJPUEJQZTJ2QlF1V2FQeVF3QmFxYUxQSnJncE14?=
 =?utf-8?B?OFh6MS9aRlZXR2Q2YjV2UDVyNzFGUkcrSUNjS3lQa2I0eHNSYUNIcWNHbEJw?=
 =?utf-8?B?RldDMkxrVVFOK0d2OUNzMGFFZnl5UU1wMmNTbVVBN0pGbVZRdkN1aUFrb1do?=
 =?utf-8?B?aTVJRE5OTHpZN2VlZnFMRGI1Z1F6QnpxcWkwRmttVWdZQ2ZsMzF6eFhOQTND?=
 =?utf-8?B?dHMybnFNR0N5My9sU2QyR3gvVVNCcHYxR0hBYTQrdWtiaW1DVjkwT1JjdHBK?=
 =?utf-8?B?a1VhejlmUW0vQ3d5V3dseG9JQzk3V3NvaWxLMHJJZHErbmVpamd4N0RIZ2o5?=
 =?utf-8?B?ZFFwV1Q3YUFUMU9hT0VkT0hIaFJyeHZ5eTV4SGpRaUxVWjRuOVpEU1p3WWQw?=
 =?utf-8?B?WlV1V2tOaWtZMDVDa0JoMUNNbVl1YlVLN0M0NnM2Q09XNFMrSVRGNCtiOGRu?=
 =?utf-8?B?cEU1TjFmQ2dBQ1NYSmtqaHBtVFI3NjNKYm9lRktyQ1o5dGdDMEJDNXp1TFlG?=
 =?utf-8?B?ODFCVlZveVB0QjhlY1FNQnVjam1JeklBeXhubGxwTDdELzJmemFHOGxkL05s?=
 =?utf-8?B?T3lPTk9SWXNoVTZETmdyUmtEckJBYkoxU2c3dmFhNk1sT0cxcUJVOFhMalJB?=
 =?utf-8?B?Rzk1dHgwVWVEWXpWNlNGN2dLTU9RdVVCWlh6K1RYRE1hQXZWUTY4QUxVU3pJ?=
 =?utf-8?B?Y2k1ckdCM1FWeTlMSEROVUtYdW5vZE9hWXBDdEdmUmVmN1pVWTlhbGQ4VFli?=
 =?utf-8?B?STJpL2syOWJoT0hESUdEai9RbUMydnhqWm04aWpJb3FyTzUwbmtKeTFkYTFw?=
 =?utf-8?B?cVlxME5NWlVkYVJ0SW9lTDAzUzRtWmREMitQOGxFdG9IV09remhWMWRLUW9W?=
 =?utf-8?B?NEhXbnF6VE1odWlOYVBMNmZjK081U290V3BrNHVaYTZWZEZxY2dxNjdOdHFo?=
 =?utf-8?B?OUhDcDB1TFRkVGNtcGtFZlhSYkV1aTU4aTJsTU0rdENtZW5vbzJxaWt5TFJO?=
 =?utf-8?B?U2p6YUJWRnlvUUFZV3UydWs4M20zQmlOMTQrNDVmNW9VLzB4NVcyNGxDcDVH?=
 =?utf-8?B?L1NEMEtsdHpsTlZVdmtQbzNQSTVvTjJUNU5DdVRzLzZIM0lpeXBDc2dpN0Rt?=
 =?utf-8?B?ZDdSZEFKOXlVYmU5OUUvdFJ5SkxFYmxnbnhMNmxvWjJNaTB6RUFDVDd3UTFK?=
 =?utf-8?B?OHBZek9TSHlTajNPSDJMSFBubkluZ0xtNmN0b0JqeHdJWHRMMFJJQUFwV01m?=
 =?utf-8?B?dFlUR2FuNU1CTlRiNGVvN0x5eGpIamtQY1pQWEJ2eGlaM29WaXhacitSUWFL?=
 =?utf-8?Q?cgP+UWa/sXRt1rEV84gSf/lcZQB9bH5pPVLR0XM4bVXz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aaed1567-eaf1-4253-0933-08db09d1cf04
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 12:41:33.1207 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ivnz2oCXLlU9wa/rlpJBml5j00s6vKpoHsNLHoN/6da3UGDJhDLOqHgEh6eiD1RC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6626
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
Cc: lkp@intel.com, Matthew Auld <matthew.auld@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, Gerd Hoffmann <kraxel@redhat.com>,
 oe-lkp@lists.linux.dev, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 08.02.23 um 10:38 schrieb Matthew Auld:
> On Wed, 8 Feb 2023 at 08:32, Christian König <christian.koenig@amd.com> wrote:
>> Hey guys,
>>
>> I'm pretty sure this is a bug in bochs which happens to surface because
>> of a recent TTM change, we have seen similar problems in the past with
>> this driver.
>>
>> What happens is that userspace tries to bind a BO to a CRTC before the
>> BO has even a backing store.
>>
>> Any idea how to fix this? I can just remove the warning, but that's not
>> really a good solution.
> IIUC this driver is just using ttm_bo_move_memcpy() underneath for its
> bo_move callback, which looks to be doing:
>
> if (!bo->resource)
>      return 0;
>
> Which doesn't make any sense to me.There should at least be a
> move_null(), and maybe also a multi-hop to handle clearing. Otherwise
> bo->resource is likely always NULL (and we hit the above warning),
> even after the dummy move. What do you think?

Oh, good point. That should indeed be move_null().

Do you want to write a patch or should I take care of this?

Thanks for pointing that out,
Christian.

>
>> Regards,
>> Christian.
>>
>> Am 08.02.23 um 05:32 schrieb kernel test robot:
>>> Greeting,
>>>
>>> FYI, we noticed WARNING:at_drivers/gpu/drm/drm_gem_vram_helper.c:#drm_gem_vram_offset due to commit (built with gcc-11):
>>>
>>> commit: 1802537820389183dfcd814e0f6a60d1496a75ef ("drm/ttm: stop allocating dummy resources during BO creation")
>>> git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
>>>
>>> in testcase: boot
>>>
>>> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G
>>>
>>> caused below changes (please refer to attached dmesg/kmsg for entire log/backtrace):
>>>
>>>
>>> If you fix the issue, kindly add following tag
>>> | Reported-by: kernel test robot <oliver.sang@intel.com>
>>> | Link: https://lore.kernel.org/oe-lkp/202302081038.984b8c1-oliver.sang@intel.com
>>>
>>>
>>> [   25.994992][    T1] ------------[ cut here ]------------
>>> [ 25.995050][ T1] WARNING: CPU: 0 PID: 1 at drivers/gpu/drm/drm_gem_vram_helper.c:255 drm_gem_vram_offset (??:?)
>>> [   25.995080][    T1] Modules linked in:
>>> [   25.995100][    T1] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G                T  6.2.0-rc6-01191-g180253782038 #1 a8db67375c3ac749313dafaec43f39836e38fae9
>>> [   25.995117][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.0-debian-1.16.0-5 04/01/2014
>>> [ 25.995128][ T1] RIP: 0010:drm_gem_vram_offset (??:?)
>>> [ 25.995144][ T1] Code: 02 00 00 b8 ff ff 37 00 48 89 fa 48 c1 e0 2a 48 c1 ea 03 80 3c 02 00 74 05 e8 7f 1f eb fe 48 8b 9b 20 02 00 00 48 85 db 75 06 <0f> 0b 31 c0 eb 4b 48 8d 7b 10 b8 ff ff 37 00 48 89 fa 48 c1 e0 2a
>>> All code
>>> ========
>>>      0:        02 00                   add    (%rax),%al
>>>      2:        00 b8 ff ff 37 00       add    %bh,0x37ffff(%rax)
>>>      8:        48 89 fa                mov    %rdi,%rdx
>>>      b:        48 c1 e0 2a             shl    $0x2a,%rax
>>>      f:        48 c1 ea 03             shr    $0x3,%rdx
>>>     13:        80 3c 02 00             cmpb   $0x0,(%rdx,%rax,1)
>>>     17:        74 05                   je     0x1e
>>>     19:        e8 7f 1f eb fe          callq  0xfffffffffeeb1f9d
>>>     1e:        48 8b 9b 20 02 00 00    mov    0x220(%rbx),%rbx
>>>     25:        48 85 db                test   %rbx,%rbx
>>>     28:        75 06                   jne    0x30
>>>     2a:*       0f 0b                   ud2             <-- trapping instruction
>>>     2c:        31 c0                   xor    %eax,%eax
>>>     2e:        eb 4b                   jmp    0x7b
>>>     30:        48 8d 7b 10             lea    0x10(%rbx),%rdi
>>>     34:        b8 ff ff 37 00          mov    $0x37ffff,%eax
>>>     39:        48 89 fa                mov    %rdi,%rdx
>>>     3c:        48 c1 e0 2a             shl    $0x2a,%rax
>>>
>>> Code starting with the faulting instruction
>>> ===========================================
>>>      0:        0f 0b                   ud2
>>>      2:        31 c0                   xor    %eax,%eax
>>>      4:        eb 4b                   jmp    0x51
>>>      6:        48 8d 7b 10             lea    0x10(%rbx),%rdi
>>>      a:        b8 ff ff 37 00          mov    $0x37ffff,%eax
>>>      f:        48 89 fa                mov    %rdi,%rdx
>>>     12:        48 c1 e0 2a             shl    $0x2a,%rax
>>> [   25.995156][    T1] RSP: 0000:ffffc9000001f028 EFLAGS: 00210246
>>> [   25.995174][    T1] RAX: dffffc0000000000 RBX: 0000000000000000 RCX: 0000000000000000
>>> [   25.995186][    T1] RDX: 1ffff11026dee544 RSI: ffff8881372d4b10 RDI: ffff888136f72a20
>>> [   25.995196][    T1] RBP: ffffc9000001f030 R08: 0000000000000000 R09: 0000000000000000
>>> [   25.995206][    T1] R10: 0000000000000000 R11: 0000000000000000 R12: ffff8881372d4b00
>>> [   25.995215][    T1] R13: ffff888136e9ee00 R14: ffff888136f4a060 R15: 0000000000000500
>>> [   25.995225][    T1] FS:  0000000000000000(0000) GS:ffff8883aee00000(0000) knlGS:0000000000000000
>>> [   25.995236][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>> [   25.995247][    T1] CR2: 00000000f7fa1cd4 CR3: 0000000006015000 CR4: 00000000000406b0
>>> [   25.995262][    T1] Call Trace:
>>> [   25.995271][    T1]  <TASK>
>>> [ 25.995287][ T1] bochs_plane_update (bochs.c:?)
>>> [ 25.995308][ T1] ? rcu_read_lock_bh_held (??:?)
>>> [ 25.995337][ T1] ? bochs_pci_probe (bochs.c:?)
>>> [ 25.995352][ T1] ? srcu_read_unlock (blk-mq.c:?)
>>> [ 25.995396][ T1] bochs_pipe_enable (bochs.c:?)
>>> [ 25.995410][ T1] ? drm_dev_printk (??:?)
>>> [ 25.995435][ T1] ? bochs_pipe_update (bochs.c:?)
>>> [ 25.995454][ T1] ? bochs_plane_update (bochs.c:?)
>>> [ 25.995473][ T1] ? bochs_pipe_update (bochs.c:?)
>>> [ 25.995487][ T1] ? bochs_pipe_update (bochs.c:?)
>>> [ 25.995507][ T1] drm_simple_kms_crtc_enable (drm_simple_kms_helper.c:?)
>>> [ 25.995533][ T1] drm_atomic_helper_commit_modeset_enables (??:?)
>>> [ 25.995570][ T1] drm_atomic_helper_commit_tail (??:?)
>>> [ 25.995591][ T1] commit_tail (drm_atomic_helper.c:?)
>>> [ 25.995631][ T1] drm_atomic_helper_commit (??:?)
>>> [ 25.995652][ T1] ? commit_work (??:?)
>>> [ 25.995670][ T1] drm_atomic_commit (??:?)
>>> [ 25.995689][ T1] ? drm_atomic_nonblocking_commit (??:?)
>>> [ 25.995703][ T1] ? __drm_atomic_helper_set_config (??:?)
>>> [ 25.995716][ T1] ? malformed_message+0xe0/0xe0
>>> [ 25.995741][ T1] ? update_output_state (??:?)
>>> [ 25.995757][ T1] ? malformed_message+0xe0/0xe0
>>> [ 25.995804][ T1] drm_client_modeset_commit_atomic (drm_client_modeset.c:?)
>>> [ 25.995836][ T1] ? kmalloc_array (core.c:?)
>>> [ 25.995894][ T1] ? mutex_trylock (mutex.c:?)
>>> [ 25.995910][ T1] ? mark_lock+0x67/0x227
>>> [ 25.995951][ T1] ? drm_fb_helper_lastclose (??:?)
>>> [ 25.995966][ T1] drm_client_modeset_commit_locked (??:?)
>>> [ 25.995988][ T1] drm_client_modeset_commit (??:?)
>>> [ 25.996008][ T1] __drm_fb_helper_restore_fbdev_mode_unlocked (drm_fb_helper.c:?)
>>> [ 25.996032][ T1] drm_fb_helper_set_par (??:?)
>>> [ 25.996054][ T1] set_con2fb_map (fbcon.c:?)
>>> [ 25.996090][ T1] do_fb_registered (fbcon.c:?)
>>> [ 25.996119][ T1] fbcon_fb_registered (??:?)
>>> [ 25.996138][ T1] do_register_framebuffer (fbmem.c:?)
>>> [ 25.996158][ T1] ? get_fb_info+0xaa/0xaa
>>> [ 25.996218][ T1] register_framebuffer (??:?)
>>> [ 25.996241][ T1] __drm_fb_helper_initial_config_and_unlock (drm_fb_helper.c:?)
>>> [ 25.996268][ T1] ? __drm_fb_helper_find_sizes (drm_fb_helper.c:?)
>>> [ 25.996321][ T1] drm_fb_helper_initial_config (??:?)
>>> [ 25.996341][ T1] drm_fbdev_client_hotplug (drm_fbdev_generic.c:?)
>>> [ 25.996363][ T1] drm_fbdev_generic_setup (??:?)
>>> [ 25.996389][ T1] bochs_pci_probe (bochs.c:?)
>>> [ 25.996413][ T1] ? bochs_hw_init (bochs.c:?)
>>> [ 25.996429][ T1] ? trace_hardirqs_on (??:?)
>>> [ 25.996456][ T1] ? bochs_hw_init (bochs.c:?)
>>> [ 25.996477][ T1] local_pci_probe (pci-driver.c:?)
>>> [ 25.996507][ T1] pci_call_probe (pci-driver.c:?)
>>> [ 25.996520][ T1] ? rcu_read_lock_bh_held (??:?)
>>> [ 25.996543][ T1] ? local_pci_probe (pci-driver.c:?)
>>> [ 25.996563][ T1] ? __kasan_check_read (??:?)
>>> [ 25.996830][ T1] ? pci_match_id (??:?)
>>> [ 25.996854][ T1] ? pci_match_device (pci-driver.c:?)
>>> [ 25.996882][ T1] pci_device_probe (pci-driver.c:?)
>>> [ 25.996904][ T1] really_probe (dd.c:?)
>>> [ 25.996933][ T1] __driver_probe_device (dd.c:?)
>>> [ 25.996955][ T1] ? __device_attach_driver (dd.c:?)
>>> [ 25.996970][ T1] driver_probe_device (dd.c:?)
>>> [ 25.996992][ T1] __driver_attach (dd.c:?)
>>> [ 25.997014][ T1] ? __device_attach_driver (dd.c:?)
>>> [ 25.997030][ T1] bus_for_each_dev (??:?)
>>> [ 25.997050][ T1] ? next_device (core.c:?)
>>> [ 25.997069][ T1] ? do_raw_spin_unlock (??:?)
>>> [ 25.997107][ T1] driver_attach (??:?)
>>> [ 25.997127][ T1] bus_add_driver (??:?)
>>> [ 25.997158][ T1] driver_register (??:?)
>>> [ 25.997182][ T1] __pci_register_driver (??:?)
>>> [ 25.997202][ T1] ? etnaviv_init (bochs.c:?)
>>> [ 25.997221][ T1] bochs_pci_driver_init (bochs.c:?)
>>> [ 25.997240][ T1] do_one_initcall (??:?)
>>> [ 25.997260][ T1] ? rcu_lock_acquire (??:?)
>>> [ 25.997277][ T1] ? lock_is_held (signal.c:?)
>>> [ 25.997293][ T1] ? rcu_read_lock_sched_held (??:?)
>>> [ 25.997311][ T1] ? rcu_read_lock_bh_held (??:?)
>>> [ 25.997325][ T1] ? ____kasan_kmalloc (common.c:?)
>>> [ 25.997348][ T1] ? __kasan_check_read (??:?)
>>> [ 25.997376][ T1] do_initcalls (main.c:?)
>>> [ 25.997419][ T1] kernel_init_freeable (main.c:?)
>>> [ 25.997434][ T1] ? rest_init (main.c:?)
>>> [ 25.997461][ T1] kernel_init (main.c:?)
>>> [ 25.997481][ T1] ret_from_fork (??:?)
>>> [   25.997537][    T1]  </TASK>
>>> [   25.997547][    T1] irq event stamp: 177845
>>> [ 25.997555][ T1] hardirqs last enabled at (177851): console_trylock_spinning (printk.c:?)
>>> [ 25.997573][ T1] hardirqs last disabled at (177856): console_trylock_spinning (printk.c:?)
>>> [ 25.997589][ T1] softirqs last enabled at (176444): __do_softirq (??:?)
>>> [ 25.997608][ T1] softirqs last disabled at (176437): __irq_exit_rcu (softirq.c:?)
>>> [   25.997623][    T1] ---[ end trace 0000000000000000 ]---
>>> [   26.013462][   T14] general protection fault, probably for non-canonical address 0xdffffc0000000004: 0000 [#1] SMP KASAN
>>> [   26.013480][   T14] KASAN: null-ptr-deref in range [0x0000000000000020-0x0000000000000027]
>>> [   26.013490][   T14] CPU: 0 PID: 14 Comm: kworker/0:1 Tainted: G        W       T  6.2.0-rc6-01191-g180253782038 #1 a8db67375c3ac749313dafaec43f39836e38fae9
>>> [   26.013503][   T14] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.0-debian-1.16.0-5 04/01/2014
>>> [   26.013509][   T14] Workqueue: events drm_fb_helper_damage_work
>>> [ 26.013528][ T14] RIP: 0010:ttm_mem_io_reserve (??:?)
>>> [ 26.013544][ T14] Code: f6 31 ff 45 31 c0 c3 55 b8 ff ff 37 00 48 c1 e0 2a 48 89 e5 41 55 49 89 fd 48 8d 7e 20 48 89 fa 41 54 49 89 f4 48 c1 ea 03 53 <80> 3c 02 00 74 05 e8 05 60 e5 fe 49 83 7c 24 20 00 74 07 31 c0 e9
>>> All code
>>> ========
>>>      0:        f6 31                   divb   (%rcx)
>>>      2:        ff 45 31                incl   0x31(%rbp)
>>>      5:        c0 c3 55                rol    $0x55,%bl
>>>      8:        b8 ff ff 37 00          mov    $0x37ffff,%eax
>>>      d:        48 c1 e0 2a             shl    $0x2a,%rax
>>>     11:        48 89 e5                mov    %rsp,%rbp
>>>     14:        41 55                   push   %r13
>>>
>>>
>>> To reproduce:
>>>
>>>           # build kernel
>>>        cd linux
>>>        cp config-6.2.0-rc6-01191-g180253782038 .config
>>>        make HOSTCC=gcc-11 CC=gcc-11 ARCH=x86_64 olddefconfig prepare modules_prepare bzImage modules
>>>        make HOSTCC=gcc-11 CC=gcc-11 ARCH=x86_64 INSTALL_MOD_PATH=<mod-install-dir> modules_install
>>>        cd <mod-install-dir>
>>>        find lib/ | cpio -o -H newc --quiet | gzip > modules.cgz
>>>
>>>
>>>           git clone https://github.com/intel/lkp-tests.git
>>>           cd lkp-tests
>>>           bin/lkp qemu -k <bzImage> -m modules.cgz job-script # job-script is attached in this email
>>>
>>>           # if come across any failure that blocks the test,
>>>           # please remove ~/.lkp and /lkp dir to run from a clean state.
>>>
>>>
>>>

