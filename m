Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1CC575D2F
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jul 2022 10:19:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC17511B785;
	Fri, 15 Jul 2022 08:19:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061.outbound.protection.outlook.com [40.107.220.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3297A11B777;
 Fri, 15 Jul 2022 08:19:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SWX6knO5X1WkL6fWokRwAwSdO9mBe+CfhWZ0Rz+2UKsFU4WA5tUx2YdJRx5Rqdw4wO5gpVNSN85b9XMZsP0AaKi2uRPMYw9zAjaOIhkvM/IZT6C3GDsLssLKsY5zKbSQfTwYna5EqSYy1E1NPlSvafiqoHUTri7b9ZKIR2DyYhdUOaPwd0R8thFZ+ZUGccZlhNRi4YOk9O+R5SaFVbU3Xov26pi8W7WrUBfNuRfxXwc/1t3/KwtIUsb1BABPIAmP8Bc6Z9NHS8uOBIlQx2wZjpOsZ3keeR5QGot2SRGpPvg7IkFBaY0nNz3zQi40h53x29aSJU5HJsERYN4GHZeXWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JsedbK+RJSO+qwLVjExUAR1gwLJMC0b3SeI8yXK8ZBQ=;
 b=Yp3rXSypRK/0aYlcqkxeUBjGVXCAaMlnIZKKeW/GJJgRLfk0wjmBQ3/G2vWkwVbEFpt+YQnr/GDl7fO3o/KZmb7j7PNI0Os9kWbL26s1MJgDe2DGWPnHlLWGCmCjOCH9u2WyPjZ3kelmMGA3Ug0df5ILgcoEzd2of+BdoJQUrN3pi6FJ+EWnj06y2ZQLMFdlbcTTxibvm0fY8VZ+qxQy/ksrkx76pZCCTryWuwhfAIHKvtiKSpMOmbPlOgV6+FZ46sn5+hcWFTngIGPNtgx1qKK4bOaBpddgmTqSW02o4OrmbwQCHP1QZ/pswE8OJMDSKMbwLU4IV5M8/QB0OmVykQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JsedbK+RJSO+qwLVjExUAR1gwLJMC0b3SeI8yXK8ZBQ=;
 b=lW6XFijRoClkegZRO9MoACKEO/mSBsnJMGKvq7cFzFhtNpkVGmfP/ARd1oKCCmO/Jd0o6feW8CIJjkCPgW4+jkhSH26J+wwMTAzRgwNTngZHmynoa/6G3aH42cGkshoqsrvsi2G3/KZSobjQdvtHW1uAQYExgUiKZWJvWwnsbNU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3897.namprd12.prod.outlook.com (2603:10b6:5:1ca::24)
 by MN2PR12MB4336.namprd12.prod.outlook.com (2603:10b6:208:1df::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Fri, 15 Jul
 2022 08:19:10 +0000
Received: from DM6PR12MB3897.namprd12.prod.outlook.com
 ([fe80::8982:9580:31db:d96b]) by DM6PR12MB3897.namprd12.prod.outlook.com
 ([fe80::8982:9580:31db:d96b%7]) with mapi id 15.20.5417.028; Fri, 15 Jul 2022
 08:19:10 +0000
Content-Type: multipart/alternative;
 boundary="------------C6PTEz51v3OXFaiIjCj3HkD4"
Message-ID: <5ad24101-8db7-06eb-f28d-5e0c455592ce@amd.com>
Date: Fri, 15 Jul 2022 13:48:56 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH -next] drm/amdgpu: double free error and freeing
 uninitialized null pointer
Content-Language: en-US
To: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 Sebin Sebastian <mailmesebin00@gmail.com>
References: <20220710132911.399325-1-mailmesebin00@gmail.com>
 <21df71a6-44d4-48a6-17d2-d463174a10c7@igalia.com>
 <YtAw4dra+g1rcAXd@sebin-inspiron>
 <1106b107-6373-9f89-5310-ea29db9fdf75@igalia.com>
From: "Somalapuram, Amaranath" <asomalap@amd.com>
In-Reply-To: <1106b107-6373-9f89-5310-ea29db9fdf75@igalia.com>
X-ClientProxiedBy: PN3PR01CA0086.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::8) To DM6PR12MB3897.namprd12.prod.outlook.com
 (2603:10b6:5:1ca::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4406027a-1e6f-49ed-737b-08da663ab1af
X-MS-TrafficTypeDiagnostic: MN2PR12MB4336:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sRGRPL7LzT44nqdGHva0b1J99xE5MtmTLdmzolNuk3lUeYe8qaeSf1Cf1cG8bRD1/5wubSGt2JyTQG3jBUEryVbJmCmei1H1WQoovMxahrO6aDSed8W/I1LF20dIT1uLLH+hk1+Eckf7j9xaN7G0w+rPAp7Lj+dtBPvYtGK04bYeCWMVAMxD6kcyTmA4mB8aRvDSTSzbaDAjFv4CR78llQKfosHvk8gk3inYouL1/j+xcXNCn99hpbHXlQBlHfKapp9nNo3R2LrYz4aQKd0HSynhsBIfG/+0DR8WRwpBnqG38okya6n/DYdeSWxRWg/WGOSCWDRRX8DK3gyORHHuoi+BxxnTRVIKF5V5bnOR+1Yunx3IflzfqY7kTnFMIbrsxHE+Kk2ZOaztjz2r+mONA/l5P86fHMC6USi392PzzodyHKO+0AZ3BrxdvhFZKMecWkMLHVvkeaaVHJ5eaJuHzUdSRC/jXMIx6Z6dh8KMCMertMjpicS5/V71TsK+5j/kiim1R9LcI17P4Tb9oaoTevTQkOdXN2YRJh+nn5nmBGCF+MMKK2IIfCW1LHIzFudH5/5jMT0MzoD5zUE+ariqfOlyBK12cft0kUCz8TtK587EMXZymfJH6a9JdINSwSb90jvBTh/zS1k2mZhxveqt1rs1UlGjAL/xn4kO/3jSXXlRsQvyIX6OzSrKuxvRkTeNCjIra39vXeKfaAmQQfaR1I7WG7arsctw2UuR+WpHvrgKduLmLn0UpU40NJAvpqGWkjtb2KLRygQ5qkutUuQO+SkMY3vvK4H00LSfH+k1KxbFm615snAtDldCs5PBtfQ95zZBq2rSR4TNrbv5fmxhRd2SVgxeagRsk5D47XCDZjU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3897.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(366004)(136003)(396003)(376002)(346002)(110136005)(316002)(54906003)(26005)(186003)(38100700002)(6512007)(36756003)(2616005)(31686004)(31696002)(478600001)(66946007)(8676002)(66476007)(4326008)(53546011)(6506007)(66556008)(33964004)(8936002)(6666004)(83380400001)(6486002)(5660300002)(41300700001)(2906002)(62123004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZW0rV21sbWowTFRrVTIvYjlreXhlLy9wTWNOZVZJR3Baa0w3OGpIbGlORTNr?=
 =?utf-8?B?eFpTQjVpQkNjM2d1a1Rqd29oZHB0ZDg3K2kreVZ0eUhYT0VaRTI0SzdkYWJV?=
 =?utf-8?B?YTlaSGtXQUlxM25PNzEzeFN2bElnR1VJV2hiNTVxRkpleHNrTFA3RmRSQ2xn?=
 =?utf-8?B?V0hLcWFxc05sS1h1WHhsQi9idC9VditxOG9IV1F1V2cvR24yTTZzL014VXdQ?=
 =?utf-8?B?aUVLaXZvSXJXekE4dGZQTlVMMExYYi93V3VpbXFyWDBZRS9ON0VzRng4UVZU?=
 =?utf-8?B?NW5MY1FpV3hhamt5d2hCUERRbUxiNjlCVnArVmI1QjNsM29rcDFIL2x3dFZG?=
 =?utf-8?B?djM4em5qa3d4UEtuQ0szQ0Q3eXRaSlBiOS9iRGVFcVhTdFh6TUhvMDFWLytx?=
 =?utf-8?B?WnE1bmRobkpFSUhlQ0cxQVVXbVJiR29vUHRLK29WaFR6NkVoR0o5ZXZyNkg4?=
 =?utf-8?B?MUphMExYTTlXR2VWL2V6KzJNc2ZGODArL1VuYTQzY0dYZnM2bXlWUkdDSlNa?=
 =?utf-8?B?M3lDbXVyTXpBZzhOYzZjWlU1anBzcnczb1pNQXJ4Y0U1Rm9aTVQxdWVVVThs?=
 =?utf-8?B?bHl2R2xnckJhR3hPV1hIbWFDWWNhZ1g1cnhDVmk4cXlPMGZOTUhOd2ZYR3VH?=
 =?utf-8?B?M2lHdXlQaWh3Z3QrMFZrUXloamxHSUZ1WHNMYjN1cTRscG5sOURqL2taNkZU?=
 =?utf-8?B?UEFPcXZuSitSUVdjUU5rSUxQVlhPb0Irai9FQ1NMRzZlT2hmWlY5QUw3ZEhD?=
 =?utf-8?B?Vk0xN0srNkczUHlJSmJFTU1MR09SMzVjTUhITnhtajdVSHltUm5YaW5sWHlF?=
 =?utf-8?B?TUZkZDdPRkNwdDhOYjlQb05GUktQakNGOE5zei91cDhGbkg1TDhDU2FSSkhU?=
 =?utf-8?B?cS94T2NOT1ZKQVJDV3R0cDJrYzdMaUFHcStIUkU0M0JINlQ5b2xuc0dCZ2RW?=
 =?utf-8?B?L1ZFZFNnckpXUnlkbU5Ra3QvemFZNzRYZldvaGhxRDl1Smg1ZjJ2eE9JVWJt?=
 =?utf-8?B?QjlLdmU1S0c1bDhlQ0RXemtFbzRzK3VpUVZYdjZIb1A1b0ppZUtzZVRBcklY?=
 =?utf-8?B?cjFidGNUYWsrR1VpNGpvaWZKM3FiMHpiOXNSTisyWW1jem9oand6UEFSQmE5?=
 =?utf-8?B?ZktZRGZ4aElRc092R3lYL1FCMmxveU9PSHIyUjNuWHV6TVZUcjZhSjZGMUhO?=
 =?utf-8?B?elY1SlcvVldSV1VZdXVPK2pRazJYaVBDU0pIb3VvWGF0RVhHNFphbGwrQ091?=
 =?utf-8?B?eVY4Z1hwRG1mTEJBVDEyWmU5WVRBQ1JCYU1CVFNyV3I0b1hSL1lVS09LREVz?=
 =?utf-8?B?bzJ2aVREdHhIWFZoRlpRMUI2RlhDZEVtUTI5Mzg2MGFuV3dpMHc4Y2FETDhO?=
 =?utf-8?B?dzZISzF6NW1CeGtkVkt4SkwxWUJ2RksxaGpZNzR0UTVJOGlVdFphQW9RcCtB?=
 =?utf-8?B?WTdjazliK3VGRGg0YmNheDJVREc0aEFhV3VVQUEyWWVPL2l3c3hyeFRXTUhV?=
 =?utf-8?B?WWFiTWF0NHc4R2Nzb0ZmNDE2ek5vUGNwNlNmY3pqR1JVbDFvcndacUF3TElO?=
 =?utf-8?B?MVd5UXV6ZXJURVA1dFNxbFpSMmNVMGZZNjVXckxrY2NnMHkvcUl3QXF4aEZp?=
 =?utf-8?B?Y0k1b3hIK1o2VmZPMGlFa3FkaFRqT1BQQVprSFk3ZUhNSitKSnBQcUFieWZJ?=
 =?utf-8?B?S2NsUno0MHIwV1ZpMTBKZUVOMzdNcFBWZ3BPNk1LRUNtVEtJRlZCZEw2RFAr?=
 =?utf-8?B?anJ1aER2UTdYYlhhd2pDWFNNMjN3MHdiZXhtNzYwYjVLSC9oY1N4dUwrbzBj?=
 =?utf-8?B?NTN6QkhKRU45RFJORnBYOWY3L082VzgwV2g1eWl0TEZteHhKcDZ5NkZYV25n?=
 =?utf-8?B?NWFwdVB4TXZ3ZGU1a2lVbHJ0Z1lmU2Z0T3cyYnp5VWd1YThMWEtFWUdBaE1L?=
 =?utf-8?B?dkxadFk5WkM3YXpRdkNCUllsOEJnVnErbnZyNXRwaUxJMkF5TjlKS2x3eXQ0?=
 =?utf-8?B?b2MrcnNjMnhndnVaTURCSUhkTDJsZmZpZTI0RnhkOVl6T0VmYUpGb0lZRWd5?=
 =?utf-8?B?Z05sRkkvUW1tckJHYzVYb2V2TVNGN1BpRUJqQVpEY3lRdlp5amE0QzExWWJ3?=
 =?utf-8?Q?k2sIN6XpY0e+xgNsJZ4IL5V/j?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4406027a-1e6f-49ed-737b-08da663ab1af
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3897.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 08:19:10.5454 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hGTj5tM6CRjcQvIR3vud37SYsetRWSMl1/8D4+C7LFmo1lPZdtMr2myNY+Ys3uZubtyTGsueNgQcldpHKWGDhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4336
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
Cc: Tom St Denis <tom.stdenis@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Nirmoy Das <nirmoy.das@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------C6PTEz51v3OXFaiIjCj3HkD4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 7/14/2022 9:13 PM, André Almeida wrote:
> Às 12:06 de 14/07/22, Sebin Sebastian escreveu:
>> On Tue, Jul 12, 2022 at 12:14:27PM -0300, André Almeida wrote:
>>> Hi Sebin,
>>>
>>> Às 10:29 de 10/07/22, Sebin Sebastian escreveu:
>>>> Fix two coverity warning's double free and and an uninitialized pointer
>>>> read. Both tmp and new are pointing at same address and both are freed
>>>> which leads to double free. Freeing tmp in the condition after new is
>>>> assigned with new address fixes the double free issue. new is not
>>>> initialized to null which also leads to a free on an uninitialized
>>>> pointer.
>>>> Coverity issue: 1518665 (uninitialized pointer read)
>>>> 		1518679 (double free)
>>> What are those numbers?
>>>
>> These numbers are the issue ID's for the errors that are being reported
>> by the coverity static analyzer tool.
>>
> I see, but I don't know which tool was used, so those seem like random
> number to me. I would just remove this part of your commit message, but
> if you want to keep it, you need to at least mention what's the tool.

new variable is not needed to initialize.

The only condition double free happens is:

tmp = new;
                 if (sscanf(reg_offset, "%X %n", &tmp[i], &ret) != 1) {
                         ret = -EINVAL;
                         goto error_free; *//    if it hits this*
                 }/
/

and can be avoided like:

  error_free:
-       kfree(tmp);
+       if (tmp != new)
+               kfree(tmp);
         kfree(new);
         return ret;
  }


Regards,

S.Amarnath

>>>> Signed-off-by: Sebin Sebastian<mailmesebin00@gmail.com>
>>>> ---
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 8 +++++---
>>>>   1 file changed, 5 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
>>>> index f3b3c688e4e7..d82fe0e1b06b 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
>>>> @@ -1660,7 +1660,7 @@ static ssize_t amdgpu_reset_dump_register_list_write(struct file *f,
>>>>   {
>>>>   	struct amdgpu_device *adev = (struct amdgpu_device *)file_inode(f)->i_private;
>>>>   	char reg_offset[11];
>>>> -	uint32_t *new, *tmp = NULL;
>>>> +	uint32_t *new = NULL, *tmp = NULL;
>>>>   	int ret, i = 0, len = 0;
>>>>   
>>>>   	do {
>>>> @@ -1692,17 +1692,19 @@ static ssize_t amdgpu_reset_dump_register_list_write(struct file *f,
>>>>   		goto error_free;
>>>>   	}
>>> If the `if (!new) {` above this line is true, will be tmp freed?
>>>
>> Yes, It doesn't seem to free tmp here. Should I free tmp immediately
>> after the do while loop and remove `kfree(tmp)` from the `if (ret)`
>> block? Thanks for pointing out the errors.
> If you free immediately after the while loop, then you would risk a use
> after free here:
>
> 	swap(adev->reset_dump_reg_list, tmp);
>
> So this isn't the solution either.
>
>>>>   	ret = down_write_killable(&adev->reset_domain->sem);
>>>> -	if (ret)
>>>> +	if (ret) {
>>>> +		kfree(tmp);
>>>>   		goto error_free;
>>>> +	}
>>>>   
>>>>   	swap(adev->reset_dump_reg_list, tmp);
>>>>   	swap(adev->reset_dump_reg_value, new);
>>>>   	adev->num_regs = i;
>>>>   	up_write(&adev->reset_domain->sem);
>>>> +	kfree(tmp);
>>>>   	ret = size;
>>>>   
>>>>   error_free:
>>>> -	kfree(tmp);
>>>>   	kfree(new);
>>>>   	return ret;
>>>>   }
--------------C6PTEz51v3OXFaiIjCj3HkD4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/14/2022 9:13 PM, André Almeida
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1106b107-6373-9f89-5310-ea29db9fdf75@igalia.com">
      <pre class="moz-quote-pre" wrap="">Às 12:06 de 14/07/22, Sebin Sebastian escreveu:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On Tue, Jul 12, 2022 at 12:14:27PM -0300, André Almeida wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Hi Sebin,

Às 10:29 de 10/07/22, Sebin Sebastian escreveu:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Fix two coverity warning's double free and and an uninitialized pointer
read. Both tmp and new are pointing at same address and both are freed
which leads to double free. Freeing tmp in the condition after new is
assigned with new address fixes the double free issue. new is not
initialized to null which also leads to a free on an uninitialized
pointer.
Coverity issue: 1518665 (uninitialized pointer read)
		1518679 (double free)
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
What are those numbers?

</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">These numbers are the issue ID's for the errors that are being reported
by the coverity static analyzer tool.

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I see, but I don't know which tool was used, so those seem like random
number to me. I would just remove this part of your commit message, but
if you want to keep it, you need to at least mention what's the tool.
</pre>
    </blockquote>
    <p>new variable is not needed to initialize.</p>
    <p>The only condition double free happens is:</p>
    <p>tmp = new;<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (sscanf(reg_offset, &quot;%X %n&quot;, &amp;tmp[i],
      &amp;ret) != 1) {<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret = -EINVAL;<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto error_free; &nbsp;&nbsp;&nbsp;<b> //&nbsp;&nbsp;&nbsp; if it hits
        this</b><br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<i><br>
      </i></p>
    <p>and can be avoided like:<br>
    </p>
    &nbsp;error_free:<br>
    -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kfree(tmp);<br>
    +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (tmp != new)<br>
    +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kfree(tmp);<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kfree(new);<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
    &nbsp;}<br>
    <p><br>
    </p>
    <p>Regards,</p>
    <p>S.Amarnath<br>
    </p>
    <blockquote type="cite" cite="mid:1106b107-6373-9f89-5310-ea29db9fdf75@igalia.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">
Signed-off-by: Sebin Sebastian <a class="moz-txt-link-rfc2396E" href="mailto:mailmesebin00@gmail.com">&lt;mailmesebin00@gmail.com&gt;</a>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
index f3b3c688e4e7..d82fe0e1b06b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -1660,7 +1660,7 @@ static ssize_t amdgpu_reset_dump_register_list_write(struct file *f,
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)file_inode(f)-&gt;i_private;
 	char reg_offset[11];
-	uint32_t *new, *tmp = NULL;
+	uint32_t *new = NULL, *tmp = NULL;
 	int ret, i = 0, len = 0;
 
 	do {
@@ -1692,17 +1692,19 @@ static ssize_t amdgpu_reset_dump_register_list_write(struct file *f,
 		goto error_free;
 	}
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
If the `if (!new) {` above this line is true, will be tmp freed?

</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Yes, It doesn't seem to free tmp here. Should I free tmp immediately
after the do while loop and remove `kfree(tmp)` from the `if (ret)`
block? Thanks for pointing out the errors.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
If you free immediately after the while loop, then you would risk a use
after free here:

	swap(adev-&gt;reset_dump_reg_list, tmp);

So this isn't the solution either.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap=""> 	ret = down_write_killable(&amp;adev-&gt;reset_domain-&gt;sem);
-	if (ret)
+	if (ret) {
+		kfree(tmp);
 		goto error_free;
+	}
 
 	swap(adev-&gt;reset_dump_reg_list, tmp);
 	swap(adev-&gt;reset_dump_reg_value, new);
 	adev-&gt;num_regs = i;
 	up_write(&amp;adev-&gt;reset_domain-&gt;sem);
+	kfree(tmp);
 	ret = size;
 
 error_free:
-	kfree(tmp);
 	kfree(new);
 	return ret;
 }
</pre>
          </blockquote>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------C6PTEz51v3OXFaiIjCj3HkD4--
