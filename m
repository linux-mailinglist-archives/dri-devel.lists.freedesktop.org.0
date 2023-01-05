Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF49965E518
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 06:29:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B94610E6AB;
	Thu,  5 Jan 2023 05:29:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2073.outbound.protection.outlook.com [40.107.93.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09CA810E6AA;
 Thu,  5 Jan 2023 05:29:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y+CorYDWioeqcJDxSla9PpRYUWhD01yIpw9ugMLGq6uET8fQVgQni6wZ/KXizKotrukPafnEXqpQfjn6QqVew0QANDEMQ8p2MqULJfRZiYgtoICMYhXKs7inyp9mRvcI8HsZhk1L3uqVhOHeF5vVhWcS6TInzmeZ0Kay0lW7ZgvwgiKtHVkJ7Ki/UaiXyzQ0xbynhp6CeEZamLbaqX1QKpFvg1757of/J2nDWAym3kBvS8g9EqTz0AEbNXRh/TB6WWxxbIrXhmxmDvZ35Er8aYvGn1efLVL1XSfbgUhrs2wcJ6F6r2xuvuZK9Jaq3S117nyXsA3mI/WbP315ZV6bKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K/yyFAP2R2HUGa9FCJanMzXhNSKsTn5URNJ7wFz9ZD4=;
 b=Q1KSVRAWhy76OYUoeG62SKZDlSA/DZFY624OROQJfLlRx27mutcFqpPWecWxlHNDxayv1oa1j1Ct/v/9aM1RusJqfrFuR+NCV9k92mzFZm+38bz56m4g6kyuSZm+HABUbj2dxDcpKdjVDdIV8A6t9uLpynO6Ml2rajuRJYVNSFOXCpRJQR6QIcyKgTpxsoZ/VkloFTPyYuRsXuqRHo8OiO0wAOVuHeYqhnOc1t3FuQvrG36UIrRTarr0kXIJKNVqtMBOw68VdxadkshNOB282GHGO4bGCSh3ALxh7sRbg1Hoe8ziAiVkZlMUdDZ9Xn22jf0375UFDZzahomQbz6ZEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/yyFAP2R2HUGa9FCJanMzXhNSKsTn5URNJ7wFz9ZD4=;
 b=JbiQbEFU8bhx4vIcE1pg4nfCTPFKxL7QmG5fkwiCPBfb21xPH0fikheIZkC6zURefc3WtbcgkbkFm4O9q+kf4JEF7htQvoWLCe7JMPy/oJUl6V/k7iYtNlV8QHaS49/efzfqSPeGhEnemG+waFkseoh90k57Lq5j/UQ7xPzJIPQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4614.namprd12.prod.outlook.com (2603:10b6:a03:a6::22)
 by DS0PR12MB6559.namprd12.prod.outlook.com (2603:10b6:8:d1::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.19; Thu, 5 Jan 2023 05:29:36 +0000
Received: from BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::457b:5c58:8ad2:40fa]) by BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::457b:5c58:8ad2:40fa%6]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 05:29:36 +0000
Message-ID: <d227e106-1766-c51e-397d-209c1f880a65@amd.com>
Date: Thu, 5 Jan 2023 10:59:22 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v6 05/45] drm/amd: Add a new helper for loading/validating
 microcode
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, linux-kernel@vger.kernel.org
References: <20230105034327.1439-1-mario.limonciello@amd.com>
 <20230105034327.1439-6-mario.limonciello@amd.com>
 <804491f0-6e83-dae5-f108-f80950838a52@amd.com>
 <b3304913-e6f4-3f87-e4f9-b31374682d2a@amd.com>
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <b3304913-e6f4-3f87-e4f9-b31374682d2a@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN0PR01CA0054.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:49::15) To BYAPR12MB4614.namprd12.prod.outlook.com
 (2603:10b6:a03:a6::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB4614:EE_|DS0PR12MB6559:EE_
X-MS-Office365-Filtering-Correlation-Id: 2015e77e-d5be-46b8-3dcd-08daeeddd554
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oSXe7a9j/mhvC1LaQn5Mxn40aENiwGkFpOWGdNC93ERF1NoJYI2LbG3o7fs5SWNgyUSGnCmGsxluqueJqMNoUzfGX8nFggbBAkGCrQ8WLBmSeXVUtq4OY8JIAxDu0JuG18G04WRUJflPDAu4dSm/pqwA4/XI2qUgz2eltoVOsXpTPpE4r3ymJZOyYv6lasrCizaVw8LUdPkWmsh+sxliIY0WmD6a8twERnysoHbFOj/Ea5CZTtUkfyOa+FS5AyaCikWFtc86WnW543DXBojVWKl+7hFuWrX/YlP1WYYWaax/qZi+jOAMVbQcfOdKwOR24NgreItx32ZGX61Prs289B76CpPUGADL3jBAykLFrurvHKdDNMqTN1uKvpKenZtLRK3CL//HbxrGu+5vobxQAnbheRbkdlTTRZr3f8EyFeidNUJqmASFy+j0uN0/wd20TPh//BrmQCdtZsrIxM3+nA1ctsAbwNkh6y/xQX3MnQ88/5g0EyX22nTT3KMCbgGXZxPbfyT5sD5zCAk3edim4EfGAecUloaRt5VwzMU33whw65D5qkVrZGzNyASZGlow/Ok4fPcCShS4RsCySsJFffMM5zDWJTPKqoJzU+wCH45N0E+F2efU6I238der7ONZu6/GYi0j2rxcacX2LVt+OhdSmClkwGp3PX23MKQgYDUh7iWWenGeI6HiIzoGViJNVCUZwVWIdIHm5qUc4n4KnDv+oA7FWZcn+o1eUxvaarE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4614.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(366004)(396003)(376002)(136003)(346002)(451199015)(41300700001)(8936002)(4326008)(66946007)(5660300002)(8676002)(54906003)(110136005)(316002)(31686004)(2906002)(53546011)(66556008)(6486002)(6506007)(66476007)(6666004)(478600001)(86362001)(31696002)(26005)(6512007)(83380400001)(2616005)(186003)(38100700002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWUxeDhVQnNkM1JNSWVONkdUNkpXWFVMRE5GZCtOclRvODNmMG1pSHdQU045?=
 =?utf-8?B?REJUelZEM29PMDZWR1pBSDZ1aEJmbWh0dnM2Sm84cE9nai81RGpKTERHN203?=
 =?utf-8?B?YS9zOEFUTTFqTkZiVHJOUFdLZk9ib21CcTlpNGhtbmFoakg3Y3kzWW9NMDh0?=
 =?utf-8?B?L3lJdEh6dzlaWEpadW1aaWdlRHc5dWtLUnc0T0ZncHZmMjdhdERBaHNGZFBu?=
 =?utf-8?B?OER4VEl1QlBEOEhTd0c2OWEzbTlPVkxyYmRmSGRnVGx6MWtOTWxZc2dBUFlN?=
 =?utf-8?B?TGg3d1d0eGYxNnA3M1pZM1c1QkJpZVBzdnNSL0hnYjhBcmpCclFoWVZUVXZU?=
 =?utf-8?B?bmVJUytHa1BpbFBVemJwWlhJTHRUMTBDRU1DRDRrNk41TU1YTTNmUGdUOVVm?=
 =?utf-8?B?MGdjVnVoVC9aVWxpQVY2RUtIaGFJODBldzI2dVloKy9HKzVSdmZKSFBZS3Yv?=
 =?utf-8?B?RlEwa2xYdTdoZmNOYVJqdTl1RksyT0wwbmJSS0N1aVhiSnN2Rm14dS9DZzdP?=
 =?utf-8?B?NW5tTW92cGp3STBIVXB6eTZvRmZUOENGVTRSbUVEUFhLTm5iWlhDRVdtNTVZ?=
 =?utf-8?B?dEhEZDlOaFdTRTI0TzlzUE1LM1lhTDZXNVljaDVtU05BTms3UmlNczJjWFpK?=
 =?utf-8?B?aFZmdUxJOHgySUt1T1FIRE1sblZRMGFsYzZWY2dteW03R3pTUmRNejdMd1pB?=
 =?utf-8?B?SVZYaitXUHlNU080ZjRzcGh1dlFVekVmWlRyNlgyOHdJeEtVeVcyeFlHR01H?=
 =?utf-8?B?aDUwZndPMldQMHk3bzVWNUZHbUdpVDRvT1R1d0NjNUlFUzBqK3ZaSU1CdWFs?=
 =?utf-8?B?NHh6c29TNDhnT203Mnl3VWFBWVVYNzJWcWlFVVVianhlVXNoM1ZOVm03M0FY?=
 =?utf-8?B?Y2ZxMEM3NVU5OTQ5K1dMTSs4M3lxa1VIV1dob3c5aHQvc3hSay82VGpsRk5s?=
 =?utf-8?B?UUgzZ3kzbmRSN0s4MVBhMFlpbmUrcmVsUnFIdGFzeGhvVFgwNi9FS3JEdS9W?=
 =?utf-8?B?VEw2cFFmTVpFOWxvQmpsRlhKZVFzS3NHdDB0WTVObWNRRFlqbWxBT2dZSXRw?=
 =?utf-8?B?WGlTWFRuTEdFSHhGbktMZWFjOExRWVFveVV4eXlCakI3QU43OC81eVNwZ1ZP?=
 =?utf-8?B?dlh3d0tVREJ4ajNiZ1l4ckhVVjZCeU5WVnNEcW5LN2R6TFhQUnQ0NFRnOWFl?=
 =?utf-8?B?RVdHaGwxNTJ0TW5LejRGTm55RjdUWllEU1dXZTBsTHhKcnd3YUc3YjNGc1Zl?=
 =?utf-8?B?bkJWOXI5NFYyWXp3ZS9URzkxMDNEOGpyd2NxQjhBTEtKVGJlL2VXY25jZTdI?=
 =?utf-8?B?OUFGWGpSOHNFbEdKTHdnd3JGcCtuSnVFUW1pN1Y0eTZUQmRZczd6dE9nNmlO?=
 =?utf-8?B?VDlFNnMvTjRtVUpyVFFld0E5MTFvZnE5SmdZK0NjYzVCeWdJRDlkeHAvSWh1?=
 =?utf-8?B?SkJEUW1vMU1TWFdJYnBzdXUrVXNTaXY2VUxGaDdFNVBTcE5VbGhNTlliTDlZ?=
 =?utf-8?B?djA0NFJkSys4VnNhWkdTc1p3enVTS0hoRU5iRUpIdWRSRllLQzJHeDZISEhz?=
 =?utf-8?B?aG5zSFdza2hoVkxqK1RRUUVGZVU3QlhTWVNmbEt5RFBqa1NTMGt1YXVQWnM0?=
 =?utf-8?B?T2VkWGY1R2U3NDNSQkM0V1BibnJLZHVtQ1U3TlYrSEwwSndlWU5idGllNFo5?=
 =?utf-8?B?aUJvNjZxeHVlbWxyOVN0QTlsSHREd2E2aGVIbmYrdjNJTFZIL3NIdUFMSklT?=
 =?utf-8?B?MFpJMEJSc0t6c0FuaTBoMDBaaGNWRHp3SmppYlFRUjZndVdld1k5RG84R0c0?=
 =?utf-8?B?WmhwcGd5andmYlRqd3EzOUxBNCtVeXp0bCtlaTFGdmprQnpTaE5qSi8rZlMz?=
 =?utf-8?B?MFpZQWtTZkp0Yy9XMTNwRDZwY3V1NUJWaTA5eXF4SCtrQU9kaC9wbVZnNmlv?=
 =?utf-8?B?QjdGcVg5VEZVaE13LzhBVzVuVEtvUmt1SXZoOHRrY1EzOGE2WlhIVVUzQWo0?=
 =?utf-8?B?NjJxdEhBeFhyaUtNRWp2M0x2K29NdUhBRDhvVWxoNE5ydkhvZDJOdi90UTBy?=
 =?utf-8?B?TWhqT1FsSEZFd1N2c3hEb2NKcHdHYWltSW5GY04vQ1U3V0JmaUl6UWw1OWRv?=
 =?utf-8?Q?3mw1q96YBF/Ol/6O1FqhKk53g?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2015e77e-d5be-46b8-3dcd-08daeeddd554
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4614.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 05:29:36.3722 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mOJ9WreVQJNRIFZgbGpylVk/B0hlsG1zQJVX7ArRo/AtZuv0B0p3Aq9htjqhFyjQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6559
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Carlos Soriano Sanchez <csoriano@redhat.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/5/2023 10:53 AM, Mario Limonciello wrote:
> On 1/4/23 23:07, Lazar, Lijo wrote:
>>
>>
>> On 1/5/2023 9:12 AM, Mario Limonciello wrote:
>>> All microcode runs a basic validation after it's been loaded. Each
>>> IP block as part of init will run both.
>>>
>>> Introduce a wrapper for request_firmware and amdgpu_ucode_validate.
>>> This wrapper will also remap any error codes from request_firmware
>>> to -ENODEV.  This is so that early_init will fail if firmware couldn't
>>> be loaded instead of the IP block being disabled.
>>>
>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>> ---
>>> v5->v6:
>>>   * Fix argument to be ** not *
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c | 36 +++++++++++++++++++++++
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h |  3 ++
>>>   2 files changed, 39 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
>>> index eafcddce58d3..8ebfec12da87 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
>>> @@ -1312,3 +1312,39 @@ void amdgpu_ucode_ip_version_decode(struct 
>>> amdgpu_device *adev, int block_type,
>>>       snprintf(ucode_prefix, len, "%s_%d_%d_%d", ip_name, maj, min, 
>>> rev);
>>>   }
>>> +
>>> +/*
>>> + * amdgpu_ucode_request - Fetch and validate amdgpu microcode
>>> + *
>>> + * @adev: amdgpu device
>>> + * @fw: pointer to load firmware to
>>> + * @fw_name: firmware to load
>>> + *
>>> + * This is a helper that will use request_firmware and 
>>> amdgpu_ucode_validate
>>> + * to load and run basic validation on firmware. If the load fails, 
>>> remap
>>> + * the error code to -ENODEV, so that early_init functions will fail 
>>> to load.
>>> + */
>>> +int amdgpu_ucode_request(struct amdgpu_device *adev, const struct 
>>> firmware **fw,
>>> +             const char *fw_name)
>>> +{
>>> +    int err = request_firmware(fw, fw_name, adev->dev);
>>> +
>>> +    if (err)
>>> +        return -ENODEV;
>>> +    err = amdgpu_ucode_validate(*fw);
>>> +    if (err)
>>> +        dev_dbg(adev->dev, "\"%s\" failed to validate\n", fw_name);
>>> +
>>
>> Missed this earlier. If validate fails, shouldn't this undo the 
>> request operation by calling release?
> 
> Actually that was original design, but there is one place in the 
> codebase that expects that ucode validation can fail, and so leave the 
> evaluate of error code and cleanup outside of helper.
> 

I see. Does request_firmware assure that fw pointer be always NULL if it 
fails? Or should that be done here if request_ fails? In subsequent 
patches, I see clients calling release without checking what caused the 
failure.

Thanks,
Lijo

>>
>> Thanks,
>> Lijo
>>
>>> +    return err;
>>> +}
>>> +
>>> +/*
>>> + * amdgpu_ucode_release - Release firmware microcode
>>> + *
>>> + * @fw: pointer to firmware to release
>>> + */
>>> +void amdgpu_ucode_release(const struct firmware **fw)
>>> +{
>>> +    release_firmware(*fw);
>>> +    *fw = NULL;
>>> +}
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h
>>> index 552e06929229..848579d4988b 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h
>>> @@ -544,6 +544,9 @@ void amdgpu_ucode_print_sdma_hdr(const struct 
>>> common_firmware_header *hdr);
>>>   void amdgpu_ucode_print_psp_hdr(const struct common_firmware_header 
>>> *hdr);
>>>   void amdgpu_ucode_print_gpu_info_hdr(const struct 
>>> common_firmware_header *hdr);
>>>   int amdgpu_ucode_validate(const struct firmware *fw);
>>> +int amdgpu_ucode_request(struct amdgpu_device *adev, const struct 
>>> firmware **fw,
>>> +             const char *fw_name);
>>> +void amdgpu_ucode_release(const struct firmware **fw);
>>>   bool amdgpu_ucode_hdr_version(union amdgpu_firmware_header *hdr,
>>>                   uint16_t hdr_major, uint16_t hdr_minor);
> 
