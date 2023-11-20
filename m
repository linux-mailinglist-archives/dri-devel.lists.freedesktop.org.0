Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8137F18A7
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 17:32:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FD1E10E441;
	Mon, 20 Nov 2023 16:32:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2084.outbound.protection.outlook.com [40.107.220.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3388E10E440;
 Mon, 20 Nov 2023 16:32:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PrcLBxgssmKs978LuuZfAbkvhqOQ9A3cCVEQzE9QWVsRQQ11MJiebDnsEMC01oQVgCUyzXBin2Ydno7RX2eYla5eMSAPddChGN3LLAHS0ScvOpaLexvCVMt+ne651DD7D8a+pDvFRCWahsgojmVsg96F1k7sT/9TU3KpnrGwOT0xKwM0HvSXN0bdr8ODcCfwwGqxF9uKPKxvKVZVDYC1F5Px9MQ/35B81mtIrW5gfcsbIEw72x05h0aqI4qk6AY1E6OblV6jZqKb9gGgSgdMSC8huKXUFjm/6+klk1766KsfaEUdyBGrraaHmzFd5h9gGvRe+zbfQL7+ZAl981lWLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TrVMFEN4NSFXeWI0x66CQ6XvrKa739MehGKDnFX6h9M=;
 b=Ttk+o22jnWPK6HG8sAB4bfOMVf3LXH5gttb1NJHL8n7wl/zH8BMNFS0lFUuYu2neLZkKRxvxxWyT23PPxUh7kVlFu3qHPw9OAfqiC8m5jvE/hDNgpLcYmiEFoCz0TL7ItdRQVLLZoqusr79X767493wxmxiLFCiQQ+Bzt2jQ3dyaawI/1uh2lJ3axkQImMjhN1Lud8uIkPKRPSKfcbis6KE4NXYfDqQ12rLQhyOE4HPbnBpL4PCc8l9UfHKsWS3a09jAXyCCtHefLGIsE1F55imTRvwgLesw9HCRspeiUFpl7xc2WIrQqRKsZE0AbyOLN65IGHyz0WJ5KSMta1m0nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TrVMFEN4NSFXeWI0x66CQ6XvrKa739MehGKDnFX6h9M=;
 b=vOLhkL2A28fEM0moNW/l6YJ7zZV2wa00vTYyQRM5euZFkTN4zqiowRGhoYOVQwCSyvVHLX4h2maGntEgg3h231VqTP5z5ZRywiRn24PHCrhAPMe4a7J92CcbEdP9sAZoOclkkC5RrftAjlXJrR2wcZlzOsiu6iMuaCx4GIbE5Ns=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM4PR12MB5229.namprd12.prod.outlook.com (2603:10b6:5:398::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Mon, 20 Nov
 2023 16:32:06 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%7]) with mapi id 15.20.7002.027; Mon, 20 Nov 2023
 16:32:06 +0000
Message-ID: <8ca58669-9819-42d5-a5a9-a8fc35cb77bc@amd.com>
Date: Mon, 20 Nov 2023 17:32:02 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] Revert "drm/prime: Unexport helpers for fd/handle
 conversion"
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Felix Kuehling <felix.kuehling@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20231117214419.418556-1-Felix.Kuehling@amd.com>
 <73a16f1e-3556-49b3-bd19-8b510f6af3fd@suse.de>
 <7501fb58-9f34-4410-b529-c01e2e45e019@amd.com>
 <86a843ed-d286-4da0-9fa9-b777d783982f@suse.de>
 <c4e5254a-6c69-434a-8128-dd140ddba623@amd.com>
 <73722172-69e8-4bdf-bfe3-e7c5bbff7219@suse.de>
 <814430b0-38de-4fd5-9719-a2f7b217cb0d@amd.com>
 <5fee047e-2dfb-450d-839b-01fffb3c01d0@amd.com>
 <49164a90-c294-4a9c-9fed-516347583dde@suse.de>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <49164a90-c294-4a9c-9fed-516347583dde@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0038.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::7) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM4PR12MB5229:EE_
X-MS-Office365-Filtering-Correlation-Id: fcd870a1-6dda-49dc-f8bf-08dbe9e63c00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Eqe+EdtxHmCpiTicy7moRwpsUbJ4qhF7KSt8gZb01ELdNZjY14BEnHtDyLEcvn6mGtrYSYzmn/T9Jz6FnS9ozcBPQb+QHMi3sNaWwdl2syxOP9UlKRdZb5aPEBFbMHpJZ4X9jdGG0apHWjCfvj4HeMFM3JOznthc98LDPMxhoEqueKiUGL8anLQtj5lSZzT/PTN9lxsYq5e8MLzOtouyU4m6aFsJRkczH1poOBcghrn+oTcjPGGX9gNdlraOjZ3jWK2JLOisZDkAdnOeCXhD88Fb15vUhRTe330EEFk65+VinaqC3rNPQvA3RzG5dGNkrjPVmc0slL73xKIS0sw4YLht0YWcySelxhJDApbPfoBpWOBU4fctBbGTZpGT5tyWg+qbYHQAhKAPuuOfAr7Zi2WJVLWji8JUYVlNho+eUQpahpEaO7D1TGHVvJBaouP6Zu3rfj7T3/n9Mt4LetQ7SIEvXGDyKTlR7NZRQtjrn8caR9S4yI72E40ZZNFDwyP/bHkymJmPbuYttZFMRoMyKq/yquicpHLLWkUWNnjVVzq4jcC/fYK+McBT9NqP9QyWC7z6QHMTbuKRaGzohe2pgLrFjaI7s6cEsQaq+CNeX7h3bSYoqXmQmF4RxnA2uEsHlMVfwcx8DTDNsWJ/5uGUHQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(366004)(136003)(346002)(396003)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(6666004)(2616005)(6512007)(31686004)(66946007)(66476007)(66556008)(316002)(8676002)(110136005)(8936002)(478600001)(26005)(6506007)(53546011)(83380400001)(6486002)(66574015)(38100700002)(31696002)(5660300002)(2906002)(30864003)(41300700001)(86362001)(36756003)(4001150100001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2ZXUHlDWiszU3oyR0hJdkl5SnhJa1M1aElacnhBTEJDSUpNTjNSRjQ3cElM?=
 =?utf-8?B?c0VDTGJ3cmlUeGN5UnNuZGZNWUV1WEtlejlyejYxYTY0bFFBTWdKc3BOZHJi?=
 =?utf-8?B?N0xBVTk1NmRoUCtlSTVJdytZa2Nyb2xEZ1FhYVEvWm9uMWxaU1I1c1l3SXhN?=
 =?utf-8?B?MFo3MmtzUnh6OFU2S09zWVZyTlJiaTFkMUJiTVcwcldUNWt5elcrL3czUit5?=
 =?utf-8?B?VFN2R3Zwdnl0STVCRXlKak1kTWhLVlJKYit5MlYvWHRiZXZvOU9sWkdsRmVV?=
 =?utf-8?B?K2YzcXg4TzRSa09KcUxGVWxFWWJiZ2RmQTEwa0NCSTZ6emRqRlpmSlZ3blNI?=
 =?utf-8?B?c3hvL2hiV0h6K3RoUnpoTnoxYktMb1lMM1MyVkFKdVZzTVdRZG1aMC9NUU1O?=
 =?utf-8?B?cDF3Wlloc2hMdGVoZjNSblprREZUODIxZEpYVmMxSCtoNWdyUkt2VzV2M3dK?=
 =?utf-8?B?UytBWEZGZWZWWUhhWXZmaVZQQnhkd2YydTAzWS8zSWZFeEl2VmxIRm9keURy?=
 =?utf-8?B?eElQTzd5aVFNQVJXTEpGTXNvN2hHVy9sOTgzS2w4aTlaZ1drV1RYS2NKQVIy?=
 =?utf-8?B?c2g4YkRlbXgzTDFJNWhHQTRPZ1NpNnc4RGxPY1FYeUNidVJoYWdoSE05NjRF?=
 =?utf-8?B?ZS9LOUZtRUI3Mlo1YWIvYW92dkdBaGpoQkNxMUdpWTZOTlBpdnNmeVVXVSth?=
 =?utf-8?B?OGIreVp3NldhT0V6Y0dGTm1lSFp2M2o0VHV2N3BtZlg5c1RIUUF0TTdGV1dY?=
 =?utf-8?B?THNQaGFDWGtzRlVWSGdwTFpjeUp5OURaNGtWN3JtbmFwZjRuQ3FsWE9GTVQ3?=
 =?utf-8?B?c0lFZSs3NjZrYlg2cS9NZG9udlpmT3Q1c0VidjU4d0U5Ui9pTVp5dThmUkRv?=
 =?utf-8?B?bnk2MVBtNFh4YW91Ym14V0ZFWThCL0ZacFdHUThQYXllMSsydk9pTWpKZjZW?=
 =?utf-8?B?ODZUcXF4NmY0c1hJVFZQWFZGUmI1R0VmUWt1NUF2Nk1GcE9ENC9lK1dFdVBN?=
 =?utf-8?B?M3ZLaDB3NG5qbklXOGRNa3VQcW1KaHdLZ1VCYlVsTUpZUWQwOVFVZnlvRVc0?=
 =?utf-8?B?cS9KN3FlVmxLdVUyV2NRMG1WUFJ5bitOR29rSUZXYnAxTzExZ3kwYnppaFBG?=
 =?utf-8?B?OEtZeCs2VnB2K2lmWEdLWTdIOWJQUnFveUdCU0dwdW5rNE1iZnRlV0pQcDVh?=
 =?utf-8?B?TTJHY01TS2kwdDMzSEdWUFRhZm1HMEdCazJqOVorNkRZbWxhUkp5d2FZblJ2?=
 =?utf-8?B?bTdTYkg3bi9Xc0tlV0F3cVZHVE5TQzFuMGlFWGI4MlJOM0ZFMGtQSlB6d2dO?=
 =?utf-8?B?V3VDQml3Uk9pNjlibW1DaXFmV2xwR3YyRDgyQzFoSnhSWmg1c3hISER6WmQ1?=
 =?utf-8?B?NFRONFZKMWdBYjhid3VIUHNXYzJTaEFEOEEwazdHU0FmYWIxbTUxeDl6aHEz?=
 =?utf-8?B?VEoxWHoyTFhCRHNhMGgyWlFaSHpMZDVwOUhIdnlwK2Y4T2hYUWpzam1Bb0sz?=
 =?utf-8?B?WkRtZFdWK3JGSjh4L2lReXVtYUFRZ1VST04zanZsVjI4ZzF6ZGg2SFJnWUVn?=
 =?utf-8?B?dzBPOXFGbm9pWTFJQUtFSTZnS3VhWG96YWVvS3drbzdaKzFpaWIvZnIzSUpx?=
 =?utf-8?B?Z05lZGw2YWxwWTZPZWpVcFI1NDRvNGJBbnRUc1VCSlE3YUlUMlUwb3NYcEU3?=
 =?utf-8?B?bFF2SEVKaHhFWDE1WFRoNjJwVGd3YTNybDVBQmtlR052ZXNDb1ZMSkJ1THJV?=
 =?utf-8?B?OXF4eVNJOEplZWNzOEJjQlBSRVpMVHMwZlprNFdvK1hSRktLZE5GOUZzbmhG?=
 =?utf-8?B?TTlOeXlxK2d0cUJXU2ZTQTBDYkRSK3poK2RLR0NlbjFKd1BjYy84WjBCR0hJ?=
 =?utf-8?B?U2ZWR3dnTU5XQno3dGVqVVllaFhvS21QWWtnOThhdUJBMjVLVjJqMkFQRHh5?=
 =?utf-8?B?WFFWSFRUODg2NkFlYkhieFMxYnpPL1NCR1QxQ2JJT3dYVUc0RVdxeTlBTk5s?=
 =?utf-8?B?Y0VZWkMvQlJ2NUVONit4VVlVMHJvajQ5aWp1ZVdZQWpEYXFjUlcxUzBva0o3?=
 =?utf-8?B?WEJVL2k0aGtqTEZESFJ1dTBiZU1ySEdVVkNSRFV0TmxpYW5iN3RGNGJlVTIv?=
 =?utf-8?Q?/4CEXPMQ02oGdNUkpW+f49cfz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcd870a1-6dda-49dc-f8bf-08dbe9e63c00
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 16:32:06.2990 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YPhdiKm143sJSPG74WNYTO+mmSUgSajib1gnhGF9dOC1CPbcHkoIZtLgKx4lOvTs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5229
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

Am 20.11.23 um 17:28 schrieb Thomas Zimmermann:
> Hi
>
> Am 20.11.23 um 17:22 schrieb Christian König:
>> Am 20.11.23 um 17:15 schrieb Felix Kuehling:
>>>
>>> On 2023-11-20 11:02, Thomas Zimmermann wrote:
>>>> Hi Christian
>>>>
>>>> Am 20.11.23 um 16:22 schrieb Christian König:
>>>>> Am 20.11.23 um 16:18 schrieb Thomas Zimmermann:
>>>>>> Hi
>>>>>>
>>>>>> Am 20.11.23 um 16:06 schrieb Felix Kuehling:
>>>>>>> On 2023-11-20 6:54, Thomas Zimmermann wrote:
>>>>>>>> Hi
>>>>>>>>
>>>>>>>> Am 17.11.23 um 22:44 schrieb Felix Kuehling:
>>>>>>>>> This reverts commit 71a7974ac7019afeec105a54447ae1dc7216cbb3.
>>>>>>>>>
>>>>>>>>> These helper functions are needed for KFD to export and import 
>>>>>>>>> DMABufs
>>>>>>>>> the right way without duplicating the tracking of DMABufs
>>>>>>>>> associated with
>>>>>>>>> GEM objects while ensuring that move notifier callbacks are 
>>>>>>>>> working as
>>>>>>>>> intended.
>>>>>>>> I'm unhappy to see these functions making a comeback. They are the
>>>>>>>> boiler-plate logic that all drivers should use. Historically,
>>>>>>>> drivers did a lot one things in their GEM code that was only
>>>>>>>> semi-correct. Unifying most of that made the memory management 
>>>>>>>> more
>>>>>>>> readable. Not giving back drivers to option of tinkering with this
>>>>>>>> might be preferable. The rsp hooks in struct drm_driver,
>>>>>>>> prime_fd_to_handle and prime_handle_to_fd, are only there for 
>>>>>>>> vmwgfx.
>>>>>>>>
>>>>>>>> If you want to hook into prime import and export, there are
>>>>>>>> drm_driver.gem_prime_import and drm_gem_object_funcs.export. Isn't
>>>>>>>> it possible to move the additional code behind these pointers?
>>>>>>> I'm not trying to hook into these functions, I'm just trying to 
>>>>>>> call
>>>>>>> them. I'm not bringing back the .prime_handle_to_fd and
>>>>>>> .prime_fd_to_handle hooks in struct drm_driver. I need a clean 
>>>>>>> way to
>>>>>>> export and import DMAbuffers from a kernel mode context. I had
>>>>>>> incorrect or semi-correct ways of doing that by calling some
>>>>>>> driver-internal functions, but then my DMABufs aren't correctly
>>>>>>> linked with GEM handles in DRM and move notifiers in amdgpu aren't
>>>>>>> working correctly.
>>>>>> I understand that. But why don't you use drm_driver.gem_prime_import
>>>>>> and drm_gem_object_funcs.export to add the amdkfd-specific code? 
>>>>>> These
>>>>>> callbacks are being invoked from within 
>>>>>> drm_gem_prime_fd_to_handle() and
>>>>>> drm_gem_prime_handle_to_fd() as part of the importing and exporting
>>>>>> logic. With the intention of doing driver-specific things. Hence you
>>>>>> should not have to re-export the internal drm_gem_prime_*_to_*() 
>>>>>> helpers.
>>>>>>
>>>>>> My question is if the existing hooks are not suitable for your 
>>>>>> needs.
>>>>>> If so, how could we improve them?
>>>>> No no. You don't seem to understand the use case :) Felix doesn't 
>>>>> try to
>>>>> implement any driver-specific things.
>>>> I meant that I understand that this patchset is not about setting
>>>> drm_driver.prime_handle_to_fd, et al.
>>>>
>>>>> What Felix tries to do is to export a DMA-buf handle from kernel 
>>>>> space.
>>>> For example, looking at patch 2, it converts a GEM handle to a file
>>>> descriptor and then assigns the rsp dmabuf to mem, which is of type
>>>> struct kgd_mem. From my impression, this could be done within the
>>>> existing ->export hook.
>>>
>>> That would skip the call to export_and_register_object. I think 
>>> that's what I'm currently missing to set up gem_obj->dmabuf.
>>
>> I think we are talking past each other. kgd_mem is not part of the 
>> amdgpu driver, so it can't go into an ->export callback.
>>
>> What happens here is that a drm_client code uses the amdgpu driver to 
>> export some DMA-buf to file descriptors.
>>
>> In other words this is a high level user of drm_client and not 
>> something driver internal.
>>
>> If you don't want to export the drm_gem_prime_handle_to_fd() function 
>> directly we could add some drm_client_buffer_export() or similar.
>
> I think it's the fd that's bothering me. As I've mentioned in another 
> email, fb appears to be not required. So the overall interface looks 
> suboptimal. Something like drm_gem_prime_handle_to_dmabuf() would be 
> better. Such a helper would then also invoke the existing hooks.

Really good point. I think that should work for Felix as well.

Thanks,
Christian.

>
> But it's certainly not a blocker.
>
> Best regards
> Thomas
>
>>
>> Regards,
>> Christian.
>>
>>>
>>> Regards,
>>>   Felix
>>>
>>>
>>>>
>>>> Then there's close_fd(), which cannot go into ->export. It looks like
>>>> the fd isn't really required.  Could the drm_prime_handle_to_fd() be
>>>> reworked into a helper that converts the handle to the dmabuf without
>>>> the fd?  Something like drm_gem_prime_handle_to_dmabuf(), which would
>>>> then be exported?
>>>>
>>>> And I have the question wrt the 3rd patch; just that it's about 
>>>> importing.
>>>>
>>>> (Looking further through the code, it appears that the fd could be
>>>> removed from the helpers, the callbacks and vmwgfx. It would then be
>>>> used entirely in the ioctl entry points, such as
>>>> drm_prime_fd_to_handle_ioctl().)
>>>>
>>>> Best regards
>>>> Thomas
>>>>
>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>> Best regards
>>>>>> Thomas
>>>>>>
>>>>>>
>>>>>>> Regards,
>>>>>>>     Felix
>>>>>>>
>>>>>>>
>>>>>>>> Best regards
>>>>>>>> Thomas
>>>>>>>>
>>>>>>>>> CC: Christian König <christian.koenig@amd.com>
>>>>>>>>> CC: Thomas Zimmermann <tzimmermann@suse.de>
>>>>>>>>> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
>>>>>>>>> ---
>>>>>>>>>    drivers/gpu/drm/drm_prime.c | 33 
>>>>>>>>> ++++++++++++++++++---------------
>>>>>>>>>    include/drm/drm_prime.h     |  7 +++++++
>>>>>>>>>    2 files changed, 25 insertions(+), 15 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/gpu/drm/drm_prime.c 
>>>>>>>>> b/drivers/gpu/drm/drm_prime.c
>>>>>>>>> index 63b709a67471..834a5e28abbe 100644
>>>>>>>>> --- a/drivers/gpu/drm/drm_prime.c
>>>>>>>>> +++ b/drivers/gpu/drm/drm_prime.c
>>>>>>>>> @@ -278,7 +278,7 @@ void drm_gem_dmabuf_release(struct dma_buf
>>>>>>>>> *dma_buf)
>>>>>>>>>    }
>>>>>>>>>    EXPORT_SYMBOL(drm_gem_dmabuf_release);
>>>>>>>>>    -/*
>>>>>>>>> +/**
>>>>>>>>>     * drm_gem_prime_fd_to_handle - PRIME import function for GEM
>>>>>>>>> drivers
>>>>>>>>>     * @dev: drm_device to import into
>>>>>>>>>     * @file_priv: drm file-private structure
>>>>>>>>> @@ -292,9 +292,9 @@ EXPORT_SYMBOL(drm_gem_dmabuf_release);
>>>>>>>>>     *
>>>>>>>>>     * Returns 0 on success or a negative error code on failure.
>>>>>>>>>     */
>>>>>>>>> -static int drm_gem_prime_fd_to_handle(struct drm_device *dev,
>>>>>>>>> -                      struct drm_file *file_priv, int prime_fd,
>>>>>>>>> -                      uint32_t *handle)
>>>>>>>>> +int drm_gem_prime_fd_to_handle(struct drm_device *dev,
>>>>>>>>> +                   struct drm_file *file_priv, int prime_fd,
>>>>>>>>> +                   uint32_t *handle)
>>>>>>>>>    {
>>>>>>>>>        struct dma_buf *dma_buf;
>>>>>>>>>        struct drm_gem_object *obj;
>>>>>>>>> @@ -360,6 +360,7 @@ static int drm_gem_prime_fd_to_handle(struct
>>>>>>>>> drm_device *dev,
>>>>>>>>>        dma_buf_put(dma_buf);
>>>>>>>>>        return ret;
>>>>>>>>>    }
>>>>>>>>> +EXPORT_SYMBOL(drm_gem_prime_fd_to_handle);
>>>>>>>>>      int drm_prime_fd_to_handle_ioctl(struct drm_device *dev, 
>>>>>>>>> void
>>>>>>>>> *data,
>>>>>>>>>                     struct drm_file *file_priv)
>>>>>>>>> @@ -408,7 +409,7 @@ static struct dma_buf
>>>>>>>>> *export_and_register_object(struct drm_device *dev,
>>>>>>>>>        return dmabuf;
>>>>>>>>>    }
>>>>>>>>>    -/*
>>>>>>>>> +/**
>>>>>>>>>     * drm_gem_prime_handle_to_fd - PRIME export function for GEM
>>>>>>>>> drivers
>>>>>>>>>     * @dev: dev to export the buffer from
>>>>>>>>>     * @file_priv: drm file-private structure
>>>>>>>>> @@ -421,10 +422,10 @@ static struct dma_buf
>>>>>>>>> *export_and_register_object(struct drm_device *dev,
>>>>>>>>>     * The actual exporting from GEM object to a dma-buf is done
>>>>>>>>> through the
>>>>>>>>>     * &drm_gem_object_funcs.export callback.
>>>>>>>>>     */
>>>>>>>>> -static int drm_gem_prime_handle_to_fd(struct drm_device *dev,
>>>>>>>>> -                      struct drm_file *file_priv, uint32_t 
>>>>>>>>> handle,
>>>>>>>>> -                      uint32_t flags,
>>>>>>>>> -                      int *prime_fd)
>>>>>>>>> +int drm_gem_prime_handle_to_fd(struct drm_device *dev,
>>>>>>>>> +                   struct drm_file *file_priv, uint32_t handle,
>>>>>>>>> +                   uint32_t flags,
>>>>>>>>> +                   int *prime_fd)
>>>>>>>>>    {
>>>>>>>>>        struct drm_gem_object *obj;
>>>>>>>>>        int ret = 0;
>>>>>>>>> @@ -506,6 +507,7 @@ static int drm_gem_prime_handle_to_fd(struct
>>>>>>>>> drm_device *dev,
>>>>>>>>>          return ret;
>>>>>>>>>    }
>>>>>>>>> +EXPORT_SYMBOL(drm_gem_prime_handle_to_fd);
>>>>>>>>>      int drm_prime_handle_to_fd_ioctl(struct drm_device *dev, 
>>>>>>>>> void
>>>>>>>>> *data,
>>>>>>>>>                     struct drm_file *file_priv)
>>>>>>>>> @@ -864,9 +866,9 @@ EXPORT_SYMBOL(drm_prime_get_contiguous_size);
>>>>>>>>>     * @obj: GEM object to export
>>>>>>>>>     * @flags: flags like DRM_CLOEXEC and DRM_RDWR
>>>>>>>>>     *
>>>>>>>>> - * This is the implementation of the 
>>>>>>>>> &drm_gem_object_funcs.export
>>>>>>>>> functions
>>>>>>>>> - * for GEM drivers using the PRIME helpers. It is used as the
>>>>>>>>> default for
>>>>>>>>> - * drivers that do not set their own.
>>>>>>>>> + * This is the implementation of the 
>>>>>>>>> &drm_gem_object_funcs.export
>>>>>>>>> functions for GEM drivers
>>>>>>>>> + * using the PRIME helpers. It is used as the default in
>>>>>>>>> + * drm_gem_prime_handle_to_fd().
>>>>>>>>>     */
>>>>>>>>>    struct dma_buf *drm_gem_prime_export(struct drm_gem_object 
>>>>>>>>> *obj,
>>>>>>>>>                         int flags)
>>>>>>>>> @@ -962,9 +964,10 @@ EXPORT_SYMBOL(drm_gem_prime_import_dev);
>>>>>>>>>     * @dev: drm_device to import into
>>>>>>>>>     * @dma_buf: dma-buf object to import
>>>>>>>>>     *
>>>>>>>>> - * This is the implementation of the gem_prime_import functions
>>>>>>>>> for GEM
>>>>>>>>> - * drivers using the PRIME helpers. It is the default for 
>>>>>>>>> drivers
>>>>>>>>> that do
>>>>>>>>> - * not set their own &drm_driver.gem_prime_import.
>>>>>>>>> + * This is the implementation of the gem_prime_import functions
>>>>>>>>> for GEM drivers
>>>>>>>>> + * using the PRIME helpers. Drivers can use this as their
>>>>>>>>> + * &drm_driver.gem_prime_import implementation. It is used as 
>>>>>>>>> the
>>>>>>>>> default
>>>>>>>>> + * implementation in drm_gem_prime_fd_to_handle().
>>>>>>>>>     *
>>>>>>>>>     * Drivers must arrange to call drm_prime_gem_destroy() 
>>>>>>>>> from their
>>>>>>>>>     * &drm_gem_object_funcs.free hook when using this function.
>>>>>>>>> diff --git a/include/drm/drm_prime.h b/include/drm/drm_prime.h
>>>>>>>>> index a7abf9f3e697..2a1d01e5b56b 100644
>>>>>>>>> --- a/include/drm/drm_prime.h
>>>>>>>>> +++ b/include/drm/drm_prime.h
>>>>>>>>> @@ -60,12 +60,19 @@ enum dma_data_direction;
>>>>>>>>>      struct drm_device;
>>>>>>>>>    struct drm_gem_object;
>>>>>>>>> +struct drm_file;
>>>>>>>>>      /* core prime functions */
>>>>>>>>>    struct dma_buf *drm_gem_dmabuf_export(struct drm_device *dev,
>>>>>>>>>                          struct dma_buf_export_info *exp_info);
>>>>>>>>>    void drm_gem_dmabuf_release(struct dma_buf *dma_buf);
>>>>>>>>>    +int drm_gem_prime_fd_to_handle(struct drm_device *dev,
>>>>>>>>> +                   struct drm_file *file_priv, int prime_fd,
>>>>>>>>> uint32_t *handle);
>>>>>>>>> +int drm_gem_prime_handle_to_fd(struct drm_device *dev,
>>>>>>>>> +                   struct drm_file *file_priv, uint32_t handle,
>>>>>>>>> uint32_t flags,
>>>>>>>>> +                   int *prime_fd);
>>>>>>>>> +
>>>>>>>>>    /* helper functions for exporting */
>>>>>>>>>    int drm_gem_map_attach(struct dma_buf *dma_buf,
>>>>>>>>>                   struct dma_buf_attachment *attach);
>>
>

