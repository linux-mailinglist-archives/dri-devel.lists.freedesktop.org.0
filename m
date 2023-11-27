Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F83D7FA26F
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 15:20:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9328E10E2B3;
	Mon, 27 Nov 2023 14:20:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2065.outbound.protection.outlook.com [40.107.92.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF0110E2B3;
 Mon, 27 Nov 2023 14:20:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SxqCJFhiyk5dRNOrcUK7uwlE8jVDNp2qox1MKGjQKR23+eoG6Y/ViXZPUMIfWfxYWFnJV/N2b87outconJZ6R7cZYSYixcN+D1UDnnT3GcRqZWiUnfXUEINckSxKT0WIlRRhoZ2KnhWfCenbgk78dVt7gf88QMYqw5kgfjPYdkHi9RhJdDBHh5TS1k+F/T90/HhmT2u8Ysw01YFVpNCWkmUgCLjW5ik+r7rsbnVS3PAFuY6UtJ1ndJN/8DVisJjgO9orTJbySD7W/5FWmf/bNEaGLL4qYsoZHeoG+CNx6babCi1jzlh47dg7lxRBNvF+V1aAuURAd/c3/7tyqlQ0sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+QZT+JZqBSUPzmGFHxr6vuenWRoYl6D2W/YWxwYwMA=;
 b=ICjHOY7W/kiMA6sb4tLi1MXhcdB4kj4s8O1gGqFOOCdyG0hgo2h4VRey55l/+Dcmobnje91tduJ0LTy0sUZhFMsnbhjd/vqNLv9+5OVZIoS/BoOcx2yNwSAkM6HZVRvWJyvV3zQLU+bAz04tXQZMyjfOQmW4wA+qWlcuxzJFTSTic1WktHuPxn3+KzM2t8GZrhBTtXznQOLhUxGQpbRYWBBF2EcMtaTd3Bo8SJUkfuKlRUhPlCxF0ptGVRsK95mFbChaHdzJLqwf7CHh4kqPtU/oUL/0pKjwBxrgeKv/VmPSRg7jUcIFaKBBA2PckA0AKgEl5oyb7l1G8fA/Ds8xow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+QZT+JZqBSUPzmGFHxr6vuenWRoYl6D2W/YWxwYwMA=;
 b=qcGD6XIZ1tIaWPki2C1u1CtDlJ3Sw3g6q3tcnUJRb66lZKsWOUt+hysMx6S11BbQvShd8CW7lYJHrdpECLFcVTiM8940zjoRds+Gcx4s+WFwB/fOKwNpyIezbCbDXy3VMTGUfCXDg1qRgvk/ZeofEHb8pHAPegMx45z9OwF9EsE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH3PR12MB8209.namprd12.prod.outlook.com (2603:10b6:610:123::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.28; Mon, 27 Nov
 2023 14:20:21 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%7]) with mapi id 15.20.7025.022; Mon, 27 Nov 2023
 14:20:21 +0000
Message-ID: <7429262c-6dea-4dcc-bf7e-54d2277dabf1@amd.com>
Date: Mon, 27 Nov 2023 15:20:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/sched: Rename priority MIN to LOW
Content-Language: en-US
To: Luben Tuikov <ltuikov89@gmail.com>,
 Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>
References: <20231124052752.6915-4-ltuikov89@gmail.com>
 <20231124052752.6915-5-ltuikov89@gmail.com>
 <76749276-dc73-4f6f-a467-aa8a721b0878@amd.com>
 <f5a4d51d-82d6-435d-92cd-fdd2d1683404@amd.com>
 <49388112-f42a-448c-9f68-e41266c4408c@gmail.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <49388112-f42a-448c-9f68-e41266c4408c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0156.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::13) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CH3PR12MB8209:EE_
X-MS-Office365-Filtering-Correlation-Id: 8abb31cd-b177-4921-1e14-08dbef53fce2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6Y16LS7ELd1Fc+P9Qv+0YB+3hGPG+jMOB0qYR1zmodswj/S33nA0U7GehOgf2tpDaPj2jJvd3itDSQTDbWI/8xLgAcu4/u2QmE6n/rn0hF2ejL1ugllPSoA18vSEoyyKESpGNN2ib6lniiYB8g1IwqD2XiG8I0ag9CLNFw6+3EQHyvSYCXpnLfEahLkn0nNPl7oID8/ZogH1GN6+yQjMnGx0S8egWPBf+oyqX5d24hokzfgmwqkLwRy4H4mMYlm9klzgyLHhlhxeX8MG12oa17vLFRH02dcv/ps8+UFWkJ9w6YiFJ0snwGzKrkcVam0WqP0Kg3ssErE4SIvlmkOOXgH0lwtVi+Ig63/WOzH5juSz/I8TJ5p89XsVo1A+fVywfdsFfE/9OdMMqkUzKHOf8h8P1Azjy/c86q0c3QAcN0cwQv9TT9xeKD5h9lnmy7k5nI66ZEif2cow+OUm/jQ7CmRU4gUSQCv6lE/o2ZSj/DLWqFpe7xETZz9+edAAcQCySh6dbx5H0FmfoMgxVG2OahBoXmHfvsP3NaZgKAEY7UnrX52wtD2QXDsR+eKWVqTUJ4B1V5DIeE3tlv3Hgv3bjGLCPzVuVozba5t/By2Iuo5W1g6lCUJOkTLvtcQALHKffuOW7qedSrwsqXU6D52YfA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(396003)(39860400002)(136003)(346002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(38100700002)(6486002)(966005)(478600001)(41300700001)(8936002)(8676002)(4326008)(36756003)(6506007)(66946007)(54906003)(31696002)(86362001)(316002)(66476007)(66556008)(110136005)(26005)(2616005)(66574015)(83380400001)(53546011)(6666004)(6512007)(31686004)(4001150100001)(2906002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d25kdWd2cDFtT2Z6d1VGcXl0Y3BHbU1UcHViM0MxQU55SVlRN0ljRlFpalNl?=
 =?utf-8?B?dVhiK1FCVkhVcmNaa1l3TzJPQUE0UzRQM3BiZzZCRFdWOWFnT2kvVi9CSFE0?=
 =?utf-8?B?a0pZNXdJOVV2S2k2ZlUvOWorRXhCRTlDcVZaOG05WmdJYkRhNllYZmhxcVNo?=
 =?utf-8?B?RGtkVDVhbWtjYUVDdXJ3M3RJTzAxd2dGL3V6K1Z3bDdJSzdDczA2cm1EaXpO?=
 =?utf-8?B?dkFJZ2tqRTM3MnFpTFZaZEZSSnEweWVXREoxVmIvUXRkdDRBUGpmVmUycE5l?=
 =?utf-8?B?bnJESkZKU1NKVGd5bU5BalRJTEYzUkQ3ZW9GUXdDMkd0U1E4WDVyVXg0QlVD?=
 =?utf-8?B?MmxLQ0lxKzBIUko3YzNuVkxLbngvdEM1Yk9rNnhsVVl5UExXTTFTb1ZveFJk?=
 =?utf-8?B?Wjcwb0ZEOUtHa0I1VktENHlQRVpUU1Z3aHBBTytVYlJFWUVEdzVQeGtuWFIw?=
 =?utf-8?B?WDAraHFvRHMyOXVkajVzOWYwMjNiWXhvTlAzbDRMUjNBZEhOMFAvM2ZtdFF3?=
 =?utf-8?B?Y1lxRHU5SnV6dWo5Um10YlZwTzRQcU82OFFhMWVSamkvWEZGZzV1dmtMQUwr?=
 =?utf-8?B?NGhBU3dLNTNPeU1FVXBCeEJlSVhEWEM0ZVRwa0U1Vmg0bnFlY0VmSVZGbDlM?=
 =?utf-8?B?QVhiSVJyekp2cXduS1MxODByRGZOMC9Za1F3ajhJM1crbW81TnNsS1pLREQ1?=
 =?utf-8?B?YjBpWnpPN3QvRjZEUDNpWHdKUDBuL0ttL3A4Sk5abG1qQ0c3S1dZL29YV0Z3?=
 =?utf-8?B?a3AxYVhxYVl0OERyRXptbEZRWkVZM2YrYi9CM0NkVWZEcDRybXJudndCWGdi?=
 =?utf-8?B?VmxzbFNWUC9mTW5zMWpQb25mT2lFQlJsSkZNbExUYm5Hd3NvZHNwQXMvb0Qy?=
 =?utf-8?B?Y1VXNWNxZU02ZmR1TVFiZDU4TU9nTm13U3J0VE5OejdOcGN0NlpocWFJWk1L?=
 =?utf-8?B?TEJRZmZwUkw1YS9GYUU2MDY2blFkSWhrTHFQcmZUNGlZeS9ha20vRDcvZVJr?=
 =?utf-8?B?SEs5U29BY1JIaTdLNys0VnpPL2xBZi9SMDAyMWV6S3NjRWtVaWxGSVNNRitR?=
 =?utf-8?B?enhLWTJBVUpZT2pFVmpIOG9Qa3QrbWJjaWh6ZWNhdVEzdGF0UVdsenFoVXc0?=
 =?utf-8?B?N3pYNWN1N0xkdGQrNE9KUzNpVzFqWjV1djlsbmVQeS9XeXRxeWlaenhkSTVa?=
 =?utf-8?B?Mm9EellQRUtMZ1ZsQ2ZiOUZXUmZQbFBLSTlUblpmMmtHQlZOSk00Sk5rWFVR?=
 =?utf-8?B?OW1ZQkRHQVRRTk4wUlMzZXlwOTNhQWpydGZERkZiM1FDQnJWa2NjOVUraEYy?=
 =?utf-8?B?QkxPVGV5cHhPRCtTUzNYWnNFYnRJV2o0NUtnU3NkTlQxNU5TUjVGcVRsQzFQ?=
 =?utf-8?B?bTc4Y0o4QUNEM2lEd00vOCtrZkxrNmFrVlNHTTFsUGtjYVo2N2xiektuakh5?=
 =?utf-8?B?SjZIcVd3c25NRVp1Um1EbzJha3ZkOTJpOUdkblAybGZkems5OTBQNTdMV3Q4?=
 =?utf-8?B?MjJ0Zm9WU2FRVWx3Z0hHeG9DRkFsUnBnTGRsMU8wMlpEUzJIUjY2MUU3bFl2?=
 =?utf-8?B?eVFYeHQzWnJwTm9IYkhUMEdmRElIblFjVmt2VjJvU0tMNU5IblJYaWRmeXUx?=
 =?utf-8?B?YUpxd0gwSlVhVGI1bWx3a3hmZjJGKy9nRXZ5VmQ0Tm4xQVJrRE50dC95VGlS?=
 =?utf-8?B?MkFJRGg1YmtOYlVoN2VpM0d6SEFhaHpaTmlyZ21MaHFISmVyUERROFQyTTNM?=
 =?utf-8?B?dnNkdHI1YmNzZ1h4TnhiTEtnL3BIaVJpR3QzZXAraHBkZkNsN05MRS9wYnkv?=
 =?utf-8?B?YjNJZnc2eDNPdnBlTktTUllyVUxGeFpGd2lLREthVGJ1aDh6YTBQWHkxK05T?=
 =?utf-8?B?aTVKblJNR1NnMExFQUtMSXd6cEJ3NmZEdzhnRjdDc2ZDNlVzbGFEL0ZlM2l0?=
 =?utf-8?B?OUIzZjIxdmtnWWhSVjhHQUxMcnNoeTlDNWRRc0VtSm5BNjg3RWZOU295dnow?=
 =?utf-8?B?YkV6ckp2RlVJdUh0S1VlYmJ6eVdHMXdLR2xlaS9vUFJCOEIyUERHdDhqT3B6?=
 =?utf-8?B?TGVFSTZMdnJBN0VuNGh6ZmpOTkhaR0lqbDYyaFpvdkk3UytLdnhTRUFQS1Bu?=
 =?utf-8?Q?+47OO7dhVGaBkIynU33/cBHMR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8abb31cd-b177-4921-1e14-08dbef53fce2
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 14:20:21.3503 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aNlM2OFgfpl5FySg9QHZK+hHY9L1AevNpARe/8qu0fgGs43LuoMRKzkE9Ygv7kYv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8209
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Alex Deucher <alexander.deucher@amd.com>, Danilo Krummrich <dakr@redhat.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 27.11.23 um 15:13 schrieb Luben Tuikov:
> On 2023-11-27 08:55, Christian König wrote:
>> Hi Luben,
>>
>> Am 24.11.23 um 08:57 schrieb Christian König:
>>> Am 24.11.23 um 06:27 schrieb Luben Tuikov:
>>>> Rename DRM_SCHED_PRIORITY_MIN to DRM_SCHED_PRIORITY_LOW.
>>>>
>>>> This mirrors DRM_SCHED_PRIORITY_HIGH, for a list of DRM scheduler
>>>> priorities
>>>> in ascending order,
>>>>     DRM_SCHED_PRIORITY_LOW,
>>>>     DRM_SCHED_PRIORITY_NORMAL,
>>>>     DRM_SCHED_PRIORITY_HIGH,
>>>>     DRM_SCHED_PRIORITY_KERNEL.
>>>>
>>>> Cc: Rob Clark <robdclark@gmail.com>
>>>> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> Cc: Danilo Krummrich <dakr@redhat.com>
>>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>>> Cc: Christian König <christian.koenig@amd.com>
>>>> Cc: linux-arm-msm@vger.kernel.org
>>>> Cc: freedreno@lists.freedesktop.org
>>>> Cc: dri-devel@lists.freedesktop.org
>>>> Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
>>> Reviewed-by: Christian König <christian.koenig@amd.com>
>> Looks like you missed one usage in Nouveau:
>>
>> drivers/gpu/drm/nouveau/nouveau_sched.c:21:41: error:
>> ‘DRM_SCHED_PRIORITY_MIN’ undeclared here (not in a function); did you
>> mean ‘DRM_SCHED_PRIORITY_LOW’?
>>      21 |         NOUVEAU_SCHED_PRIORITY_SINGLE = DRM_SCHED_PRIORITY_MIN,
>>         | ^~~~~~~~~~~~~~~~~~~~~~
>>         | DRM_SCHED_PRIORITY_LOW
>>
>> This now results in a build error on drm-misc-next.
> I'm waiting for someone to R-B the fix I posted two days ago:
> https://lore.kernel.org/r/20231125192246.87268-2-ltuikov89@gmail.com

There must be something wrong with the dri-devel mailing list (or my 
gmail, but I doubt so). I don't see this mail in my inbox anywhere.

Feel free to add my rb and push it.

Thanks,
Christian.
