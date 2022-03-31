Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7044ED5E6
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 10:39:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC9C410F632;
	Thu, 31 Mar 2022 08:39:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2084.outbound.protection.outlook.com [40.107.243.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F9D310F6B9;
 Thu, 31 Mar 2022 08:39:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S430YnQojFciCjXt9D85n+Mmx1Xf/Hqa2X/ICZTxMFYiWJ2RJmm6dmM61XnGaotY4W9xOKCVPBcWjImN0vxX0vbJMGgwvI+ByACEuH65TavaW64N7XunxhkkFNOW5A9eWF8tvykhVcyu5eJuUZu4EBiZJryPvRNQRW9+sPfua4c02SgRvkO0MrxQYNwnO8vnwZcrYIjzdqAggMElJZ2xeob9cHFKJxVoU04IWiRCaNHO+Bo5tUfAOeXicfInEiLFFkMBrXK8fQEDC1dH93QXtonQYrIs/KAArpjuKZx3bqczdkPk/ZrhbPCwWEqzjMidztq2OqKeNy0Wg4rWkq8R+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Mf7Fk9cfl/kkvO1g97pBSzUVJvT3EY40WKUnENU4sU=;
 b=iRNJCF3cj7CpF3Phv767c3AiFkXtDvGXDitCTmQmUIgjNUb1/MQYWTGJ7tCNPXkmmTpnPUCpHUpFxsZ74Gm3vBtWFRMBJnmow27OFYoMWBm+BXu55atdxN4flwBSFiVNrn1sSJraE0LDEJ4Wy8FpN06MiyeYC8q1pgYE8kOuZ27poUqkQZ1vYNElT5HkiSQKUqodSKYLC4ZLGlJCfUMADTf/JWLqUxronxpsDysicEhzCexpoBDNctW8UZ2tVpxcq+jeP+kNoKyg4xVcYf8z1zg+R9uvnNDUe+AfXbcqtHvBuauX8II/7p7QZXy6JrrUl5PRjPR8IMBj24BvOg+FMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Mf7Fk9cfl/kkvO1g97pBSzUVJvT3EY40WKUnENU4sU=;
 b=f5b5V27D4hDTBZivN+p928EUnuAM/15oFx/ugazGSziLgT88sLtlgO98rKszR5r+A3KiG8eeHBOfbcsy/MqcHr1b996AXyxEJcTDDrTIECGXRCpqjl7R8CaBCJHavKM2rFHl2zkzLbPWjzL1gw9BQFP+wVY0RpIGxZ+ZuKD7NVc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BL0PR12MB4945.namprd12.prod.outlook.com (2603:10b6:208:1c4::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.21; Thu, 31 Mar
 2022 08:39:51 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5102.023; Thu, 31 Mar 2022
 08:39:51 +0000
Message-ID: <26704e45-3d35-e172-0aed-32291a163d2f@amd.com>
Date: Thu, 31 Mar 2022 10:39:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [Intel-gfx] drm-tip compile break
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>
References: <87o81n9ikg.wl-ashutosh.dixit@intel.com>
 <d3d90c7f-b3a9-e81c-c97e-b40ee3ee5baf@amd.com>
 <40ccaa09-42d3-37c0-65cb-5b5eabe8d706@amd.com>
 <20220331081529.4gsfd6diznsjzfay@ldmartin-desk2>
 <afa8f35b-88a0-236d-6740-e36ce12c851b@amd.com>
 <20220331083012.teu6v3c45gkgdicf@ldmartin-desk2>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220331083012.teu6v3c45gkgdicf@ldmartin-desk2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0043.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b81d2322-bb02-43dc-25e0-08da12f205be
X-MS-TrafficTypeDiagnostic: BL0PR12MB4945:EE_
X-Microsoft-Antispam-PRVS: <BL0PR12MB49453C7B8014F84C5F98E8A583E19@BL0PR12MB4945.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lBJ2/+pybM6RgXOp5gjbMMUCmv7T42y9AFjzNqkTq2IUPJ6P1ymTsYIHJMXEclhupp42NxTaoDhUowbuVVta/z6JX+ggtydlaA2Ri1kuhMIofVd1OleJbNeJZVnVFKmoyXa128XbqJY75+NuAAc16QycTawxD4LDF1PTYFv0L0cT+M5KZszqFSlNnk7qDugRIbhqynHR4G9lN73f5M+7GLQQ4DelqUgCkWBFoG2Z+ZUX4crl5R3Esu2VZX16kTCEBuUV9hqM6twwd8NTfMiwwh8NB1KZEzWpDsuuAsweLPrXWugxEUfGOCLOehSz3uDhHeVHTy1wXUyqrZ6jFkbWM404Rvcq1mQ9TTMKqqW/877cfZVmmodWz5iovYZOv3l2BNSjfiE6dOJzKY485pi96MyRfpJzc00mktS3Y4FpXxMwkVIhV0LsG1u2tmrpL2qsSTZA6ubaaTRAX5jZdy+HyHWgYB1jweN7UUvKsXyRlXooDLvPAadaru32Ipi4Kjv+pYBJL6ItN68RywqZ3e9TZlkFFaiX3nLB6i7HTq//9UAAgW1TvVzPfNI53t9gvcUEB6aBj9nXcckCRJb+Dw7NObA7JSIY2tyPf3mfw+44WdRrVq0ujQPZwlMz7PdmciLboiK6eVP8RPnRWoyM2tA4mQNIzNSn4FaAu+iIbAHumCnQGiBp7OU63cZWHnOJXoSmpt+YDLTVETBEcygNU7mqUBziIUM3VGLLnkCFuXLKbQYp7tnxx3S6fc/VpCKtN2+o
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6486002)(966005)(8936002)(38100700002)(2906002)(66946007)(31686004)(4326008)(8676002)(66476007)(66556008)(6666004)(6506007)(66574015)(6916009)(2616005)(186003)(26005)(316002)(31696002)(6512007)(36756003)(508600001)(5660300002)(83380400001)(86362001)(45080400002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enhiUFU0WTN2NkpSRGNzcUs4QTk4VUFNRHNEbFZQeUFDZk1MT1U3QTJlb1V6?=
 =?utf-8?B?akRZblNqSHUwb1V4bS9yZHNGaGVFeDBGQmRuMDhkN3ZmaDdmWUZacXJCQTFT?=
 =?utf-8?B?NU9FUHEwWk9KTFhmSjl6VUplUDFNbnVMdkhLM0FKN3gvUnhiTTZjazZNZ3BQ?=
 =?utf-8?B?MVZob3VJSW5nMUc2ZC9ZSDl3czZObE56VmdiOWgxaVA0am44WHUvS2xQcTdn?=
 =?utf-8?B?NVB1c1A2OG9ock92cmpJbzM1NGlkWDBQOU43a2JOdXB2NDRxNGxIK25ucVFq?=
 =?utf-8?B?QXcrblZTUkNueDNzUmd5YXF6ejl0aThMS2FqVFNxUHF4OHBDOWl2SExXMEJY?=
 =?utf-8?B?V2RYcW1ia3N4VmFLV3ZvUzR3QitoNGFnTjV1WVdzOHhyNlJ2OUhMVjlxV0hI?=
 =?utf-8?B?aG45S29uaVhOdi9WNlZZakl6Tm1YWlkwYlhuaCtmWFlDazNCQjlpbklpaDJz?=
 =?utf-8?B?dzJzd29OMG1GK0RXMFZmNHViZWg2TW52eGEwZjBoOU10OTh0K1FZaTZ1TkYr?=
 =?utf-8?B?ZkRVY0VSWFJWM0ltbUZyWlhuaDBQTUpVU1o0N3FhUDFFSXlMZ2Y1dWszb3pj?=
 =?utf-8?B?MThYWmRMYWMzNEpGQXRmRkJUUVRlQkdtdHRXaUJHclMrd0xyS3FaVEdxU2p5?=
 =?utf-8?B?MlNNVjVJclBzZ3ZCSitQTzZsdGxMK1VEdEl5MlB6Yks1V2tqWDlablFZQmlp?=
 =?utf-8?B?UjFPeTdkdWs5ZCtVbFhWVkJhTVFBWEdtRUJEajFYNGJmV05WQWVscnlVdXE4?=
 =?utf-8?B?Q0MrR1l1Vkc5WFVRZXBFMWNmcjZVYWk5STFia092dHZ6eDNpNWVCYld2UVlq?=
 =?utf-8?B?b3dHWGZwTlQ1TXJ6Q2h6OVJuRkFjMEVCRmFQWFJtZG5Rbk9oQ0lvbDJxdy9J?=
 =?utf-8?B?b1JHbEhqY2xjOWtwU1JnZTgxS1M5Njl2dGNtUzdGUzB3b0RWcmc0TkxqcDZV?=
 =?utf-8?B?OFdPZmpxYlkxMTZ6MFdnd09MNkpja2pLWVNwTVE1TkQzRlJkbE5NbU1ySWda?=
 =?utf-8?B?bUYwRWdiQkw0Vm5YNUkxaTVsZVJhd2JXRVlTN2lJUWRYUENsSHhUQ2FXZENT?=
 =?utf-8?B?MjdTVFVEdW0vV1gwRXVCQ3J3c0Zab2F6N0tHa21tWVBLNExYK2htbFZ3MmhW?=
 =?utf-8?B?SVZ4RytBMjBhTmJpbmcySjh2VWRGeVBxRmtkWDZZMU1wTXJXUHFIQ1RMTzlp?=
 =?utf-8?B?QmdHRXZhR0Q4d1MrYkNIUk1SZzRBR3UvY2Y2eHFJWmpxOHFzNWRCN21TdC9O?=
 =?utf-8?B?VFRScTlCRVJiTmpDYXlSd2hjVDFhYytJNnZOalgyc1dMbjV6aUhBSVpSV3hq?=
 =?utf-8?B?QktDMHVzcXpCWUdTd29yZjFUK3M5LzlJMktyK3NWOEJ5K0t5SDNOcHRKWnRF?=
 =?utf-8?B?aDA5K0dVSnBkMDFWWVN6eXpUOVhYNlk4T3gzaEZDbTF3OU1zRUFQNWdVZ2wx?=
 =?utf-8?B?MG5zcUY0YmtvdnZYMEkzcFZQZ1lFd29rL2VBSzVVeEVsc1pKSzFqVDI3WEVR?=
 =?utf-8?B?ZUxVeG9JbVF0VjBZd2NVSkhEUWRRNzhKSXJvK2lWUlg5WlBZOVh4ckFXamFU?=
 =?utf-8?B?NDlQcngxU21lZEM0dGRUeEVsa1lGajVEK3NQczZxZ0UrZkQ1dTBTc3I2cW5p?=
 =?utf-8?B?ZzQ5VmZLYjBjZ3haamd5eHVOY2NLeXVxZCt1UTQvcHZybzgvU1hBTDNVOHFE?=
 =?utf-8?B?UFpjU3o2RGN6NmlhM1FTcGpFZEtkUXp0ZWJHZ1ZzNi8xbWFXTkJna0N3RXli?=
 =?utf-8?B?Mzc0RnpwcVhQRktDOVlQTDN0S0svR3JMOWxQVGdraDUyQzlQdTRjVGJmblVG?=
 =?utf-8?B?dlBsNTBWVHduaTF2WENNUDVFWEdycm01Q1hzZ0hXNzRDcHp6SWppOGFReGlm?=
 =?utf-8?B?S0Q4dC9RanNoVllmNldXS0NkME9jdWpQMzl4UHVuWmhvZHo0b2lqbEFScEZS?=
 =?utf-8?B?WUZXc3dOelVHTmZMK1k3VDlSLy9QaC9mU0U1SmpqNi81cVRtQXN1cXprMHZ4?=
 =?utf-8?B?Y0ZYZ1pRNmZOc1RQRmNPM0NEUmp1WEE5QXRpK1FQMXQ4cmd2LzVZY1NwcU44?=
 =?utf-8?B?bzIxcDJTVFVpbFAzb0dZbG1zd042REJpZE4zZ1Q1MXF1My84a20yenFiRTJI?=
 =?utf-8?B?WmFUeXE3dDFtNmZrK1p1cys3Z0p4Yi9sSGlmdzZwTHFmUjY1UjdrZUhEUmcw?=
 =?utf-8?B?V0NERVRuanNMRFdVeENCRElzNWpLbVZhS2p5YnFjMzlMSkVwVmVOR2VyUWd6?=
 =?utf-8?B?K0pMenZQeTkyREREYnlqVTdzTytuVWVSMGRzaHlaWmlOcFUrL0tTRlQ2Qk1x?=
 =?utf-8?B?eGxTSnlGWERBcDkrUXNJUkk2WUxSY3c5ZXNZSFZyV2ZtUTErV1VVdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b81d2322-bb02-43dc-25e0-08da12f205be
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 08:39:51.5798 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hA82IxMB9F3g8f70ajQ3QuIPXRZ0qAVQkxNP1Q5RgaLyGeLEUWMugG70Xsw1qLND
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4945
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 31.03.22 um 10:30 schrieb Lucas De Marchi:
> On Thu, Mar 31, 2022 at 10:20:58AM +0200, Christian König wrote:
>> Am 31.03.22 um 10:15 schrieb Lucas De Marchi:
>>> On Thu, Mar 31, 2022 at 09:35:50AM +0200, Christian König wrote:
>>>> Well the fix is trivial, but somehow rebuilding drm-tip always 
>>>> fails for me while merging drm-intel-next.
>>>>
>>>> I probably have somehow messed up reverting the conflict 
>>>> resolution. Ideas?
>>>
>>> It looks like the error is in the wrong conflict resolution in
>>> 629041de3a0c M─┐ Merge remote-tracking branch 
>>> 'drm-misc/drm-misc-next' into drm-tip
>>> you'd need to redo the merge (-i) after telling git
>>> rerere to forget the previous conflict resolution.
>>>
>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdrm.pages.freedesktop.org%2Fmaintainer-tools%2Fdrm-tip.html%23removing-a-wrong-conflict-resolution&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C4db28b5734c24859ff9908da12f0b216%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637843122239322034%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=rD4fKwnNFGmFoReTCI3fCbC7j1UWA4vAqYpOiG3Lkqc%3D&amp;reserved=0 
>>>
>>>
>>>
>>> it's also useful to use dim -i, to make sure we can build on each merge
>>> afterwards.
>>>
>>> AFAICS the revert would be on 141577c6d0bd 
>>> ("2022y-03m-29d-09h-01m-04s UTC: drm-tip rerere cache update")
>>>
>>> taking a stab on it, should be like below. It even builds,
>>> but I have no confidence to commit it.
>>
>> Please go ahead with that, it looks correct to me.
>
> done

Thanks!

>
>
>>
>> I somehow messed up my installation so badly that even a "drm 
>> rebuild-tip" doesn't work any more and fails to merge drm-intel-next 
>> with a conflict which seems to already be resolved.
>>
>> And when I try to resolve it once more drm-tip says only "Preimage 
>> für 'drivers/gpu/drm/i915/intel_pm.c' aufgezeichnet." and doesn't 
>> seem to remember the conflict resolution.
>>
>> Any advise how I can fix this?
>
> probably:
>     dim ub
>     git clean -fxd
>     git reset --hard drm-tip/rerere-cache
>
>
> To try without pushing, you can do:
>
>     dim -d rebuild-tip

Unfortunately that didn't helped either.

Christian.

>
> it would also be good to get a review on 
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fdrm%2Fmaintainer-tools%2F-%2Fmerge_requests%2F16&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C4db28b5734c24859ff9908da12f0b216%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637843122239322034%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=qOxp0mjxpH73P2Urs6dK5lFIJRG7lyC9uB2at9fZ%2BU4%3D&amp;reserved=0
> that has some improvements on dry-run and other things.
>
> Lucas De Marchi
>
>
>>
>> Thanks,
>> Christian.
>>
>>>
>>> Lucas De Marchi
>>>
>>> -------
>>> diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
>>> index dd78402e3cb0,68494b959116..000000000000
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
>>> @@@ -200,17 -187,20 +187,17 @@@ static void amdgpu_gtt_mgr_del(struct t
>>>    *
>>>    * Re-init the gart for each known BO in the GTT.
>>>    */
>>>  -int amdgpu_gtt_mgr_recover(struct amdgpu_gtt_mgr *mgr)
>>>  +void amdgpu_gtt_mgr_recover(struct amdgpu_gtt_mgr *mgr)
>>>   {
>>> -     struct amdgpu_gtt_node *node;
>>> +     struct ttm_range_mgr_node *node;
>>>       struct drm_mm_node *mm_node;
>>>       struct amdgpu_device *adev;
>>>  -    int r = 0;
>>>         adev = container_of(mgr, typeof(*adev), mman.gtt_mgr);
>>>       spin_lock(&mgr->lock);
>>>       drm_mm_for_each_node(mm_node, &mgr->mm) {
>>> -         node = container_of(mm_node, typeof(*node), 
>>> base.mm_nodes[0]);
>>> -         amdgpu_ttm_recover_gart(node->tbo);
>>> +         node = container_of(mm_node, typeof(*node), mm_nodes[0]);
>>>  -        r = amdgpu_ttm_recover_gart(node->base.bo);
>>>  -        if (r)
>>>  -            break;
>>> ++        amdgpu_ttm_recover_gart(node->base.bo);
>>>       }
>>>       spin_unlock(&mgr->lock);
>>>   diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>> index fc4563cf2828,28f5e8b21a99..000000000000
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>> @@@ -375,9 -375,7 +375,9 @@@ static void amdgpu_vm_bo_base_init(stru
>>>       if (bo->tbo.base.resv != vm->root.bo->tbo.base.resv)
>>>           return;
>>>    + dma_resv_assert_held(vm->root.bo->tbo.base.resv);
>>>  +
>>> -     vm->bulk_moveable = false;
>>> +     ttm_bo_set_bulk_move(&bo->tbo, &vm->lru_bulk_move);
>>>       if (bo->tbo.type == ttm_bo_type_kernel && bo->parent)
>>>           amdgpu_vm_bo_relocated(base);
>>>       else
>>> @@@ -2660,12 -2597,9 +2606,12 @@@ void amdgpu_vm_bo_del(struct 
>>> amdgpu_dev
>>>       struct amdgpu_vm *vm = bo_va->base.vm;
>>>       struct amdgpu_vm_bo_base **base;
>>>    + dma_resv_assert_held(vm->root.bo->tbo.base.resv);
>>>  +
>>>       if (bo) {
>>>  +        dma_resv_assert_held(bo->tbo.base.resv);
>>>           if (bo->tbo.base.resv == vm->root.bo->tbo.base.resv)
>>> -             vm->bulk_moveable = false;
>>> +             ttm_bo_set_bulk_move(&bo->tbo, NULL);
>>>             for (base = &bo_va->base.bo->vm_bo; *base;
>>>                base = &(*base)->next) {
>>>
>>>
>>>>
>>>> Christian.
>>>>
>>>> Am 31.03.22 um 08:28 schrieb Christian König:
>>>>> I'm going to take a look, but need to figure out how to find the 
>>>>> broken merge
>>>>>
>>>>> Christian.
>>>>>
>>>>> Am 31.03.22 um 00:33 schrieb Dixit, Ashutosh:
>>>>>> Is anyone looking into fixing this:
>>>>>>
>>>>>> drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c: In function 
>>>>>> ‘amdgpu_gtt_mgr_recover’:
>>>>>> drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c:200:31: error: 
>>>>>> ‘struct ttm_range_mgr_node’ has no member named ‘tbo’
>>>>>>     amdgpu_ttm_recover_gart(node->tbo);
>>>>>>                                 ^~
>>>>>> make[4]: *** [scripts/Makefile.build:288: 
>>>>>> drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.o] Error 1
>>>>>>
>>>>>> Thanks.
>>>>>
>>>>
>>

