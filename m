Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4864ED4DF
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 09:36:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBB2510FC54;
	Thu, 31 Mar 2022 07:35:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2058.outbound.protection.outlook.com [40.107.244.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08A2A10FC54;
 Thu, 31 Mar 2022 07:35:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WvTs78gifYX3lbvH9bvdyvnym8m+hegva3F46Rr9mjFUhT1QXKiSUVNEJQ8+/LNIn+lNrsvzxDXvPly5wkolWQ7rADlhy5oYmkHWLxxoGMNCRsZvlYcsmsJAut35g3KVdejqvIHJJL75RkmXsT5nM8+5dudhzJ+ZpkLpUXkuV3qqf5bZRIJnjT74yhPMM+CY98+Cz828uAQ7rE10InMfTQ9HJ/olY7kVFn8tOpOqwWGxyOieD/mrxydFvNZTQsqyUXMuEzYvhQ4GUX1zYO9VF5b1o5FwWszI4uZ+GL1qJKCItEXZTNK/tBkYpB8GF1R0l7tFHQ9DC/zQA5moERL5LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QE0PV4drg+tl9dns/PRVYZcvpRA4aLmbnYDFYUCyeYE=;
 b=GSoIfswuyIjflX8qL1csmtJKRK18uxUhdVFEGXxbn/Wbcuv/xOWk6uQjSApkNyuHgek78ugIAXpgIsxROw/yZhrdQ0Q1p8LeFBzIpL8J0NWWtadQ4wMcjKRGCUbKk7Y/fhEtDyI9r3E1p4xJvL+7kqmrU/jevE+WyHP6yqiOOu42Ywj9n91F190yZUsROwxM+5MxxROpz7GptiOC/CmEaZlLnvG888Qc3PhuJqQkC0rRxM2nR21kV7r4kPrhrNJBeeg+KUyNmvh0fjwjdhBnq9MITgpMKGnR9P3AezOPAoaFcmctr0MrgaCq3SYZ3t4TRvnKLQJmpzuhmzLB5QlwsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QE0PV4drg+tl9dns/PRVYZcvpRA4aLmbnYDFYUCyeYE=;
 b=rQ2jbOJWN4wkidYbFrJorELJOgJ5hNgKyYhlAvWQmy1W3dQk+s7aHXF85xfMoDs0M3rPulh1KB5dHgVOf43+UXEtK9rb91NEEsYeVVeSoioj7Ciue6ZpnGX+DzFEDO1oNO3L1vDbdjUoxqweb9BXJE0EndwP1SHs1ENz2J/9790=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN6PR12MB1762.namprd12.prod.outlook.com (2603:10b6:404:fe::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.16; Thu, 31 Mar
 2022 07:35:55 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5102.023; Thu, 31 Mar 2022
 07:35:55 +0000
Message-ID: <40ccaa09-42d3-37c0-65cb-5b5eabe8d706@amd.com>
Date: Thu, 31 Mar 2022 09:35:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: drm-tip compile break
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <87o81n9ikg.wl-ashutosh.dixit@intel.com>
 <d3d90c7f-b3a9-e81c-c97e-b40ee3ee5baf@amd.com>
In-Reply-To: <d3d90c7f-b3a9-e81c-c97e-b40ee3ee5baf@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR04CA0072.eurprd04.prod.outlook.com
 (2603:10a6:20b:f0::49) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 535cf23d-a6bf-4aee-f261-08da12e91732
X-MS-TrafficTypeDiagnostic: BN6PR12MB1762:EE_
X-Microsoft-Antispam-PRVS: <BN6PR12MB176235F0681B5277217355FD83E19@BN6PR12MB1762.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kLXXZ4MxgcWsHQiXYCYDpKH83lY6mZV9aRB3E1gGdBcuxWFV1o3l1TQOW7PxlqlfZhbGRiBm3ogBQenS5ZkLNaDuJeO3tS3LYc+qG3r9md/m+3baeUtTnaAexMLeNRdgywwTT7EK/MVs8yhXnPScjRbxessNwkcS6gfm/RZDWRDUWBObj53c0KZ+r5f4yyE1r/mVM0E+Q15QVLP+l50nOtgaymXZ9rw+iXzKQHcFMfyTTrp+5Vh+a85/NyN/0ZJZ5ogZynqyd8//uy9joykbjWj/WOwzqhfyg7OrWdOu5q01sKDF4kODI+HafsCdJ7lQp7bKneWI3HR/Ufij4u+ZzHecAdG6hC9iCvM+Idf2dSUfd37ykPVF01cX9OM5kIaqbWZC1aW8soIqVcv3uj10Nc156feRtgCTTmpk+/FBh9l9udLopOWPFg5YSzIKPxP9YbOKS5ngnEHPCVwXCviDgcisawWyTvVuIknGxsVC1wjw36vfLal19UgrwljwkhhNWuq5nDBV89sL6TzXwvOUwdlqnt2xTSwHnNzIODaSZyXSiE7lphthzMHhyzL4jn9QO8wVuAC3u7P7j0x85iJlHZHnn/xHtUAPlvOYBKcLbWiTXMdEcdLx4YijNFUUt6xB7JcQqAm/z4OLQaeICoKmgvQ/qZDHne6KylD9e6kMG0M84311uwSYh/funJdH5q5iC7xfdfYVs+dbQY+shHZuiYegPP9nGDKL20yGahPWTs0mkfTZBMP6mPEOQ1X2NMXC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8676002)(5660300002)(4744005)(6666004)(2616005)(31686004)(4326008)(66476007)(3480700007)(66556008)(31696002)(36756003)(316002)(86362001)(66946007)(110136005)(6486002)(26005)(8936002)(2906002)(508600001)(186003)(6506007)(6512007)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEt6ZTJJbGxtM05HTE9Qak1ReUk0Vk5zUnNFektFZ3dzcUdxUE5NSk1zVWcx?=
 =?utf-8?B?MzJ6UmVHU1Bpb2xxU3RNaVk3QTFicTJzY2ZjenZrR0Q4NURnYnJLYjNkUkZS?=
 =?utf-8?B?TG1PenpFdS9uZkZMZlZMcTE5bWRGOUQrbW1VdUpCVldjOFRwR1BQMkJEMzIy?=
 =?utf-8?B?b3hOOEtwajJHODhxRGovNjdiU0lZMmlnckgxMTZ3a1ZIUFo2T3AzUE1SM1do?=
 =?utf-8?B?cVpIVEF6bHVhRHR5M0VmRjYrNHdFa2NNL0M5WEVxM2pwMlZXaUlRaElIY04x?=
 =?utf-8?B?bC9zaGtpUFlHSnd1WktRMWswS0JPMVRpc21CbnB1TWREdGFIcVVqRkpnMGkz?=
 =?utf-8?B?WEZWcEh5cFNYdDVlaitZRGYwU0ZYVkd0YTdrWG5TTUt2SG14UjluRExnSlJr?=
 =?utf-8?B?Yzh6dmVFQjdNUWZKbExFOEZHQWpXRTFoN3VERlVoWVlTK0F0QzhTRUx4QmxB?=
 =?utf-8?B?MkZwNjZmVFJqL0NRK2FhU2UzZEVJcW05VklDb2ZvWG9vTzRuQWJoU1UvYkVS?=
 =?utf-8?B?bmNYa2pjS2sxdkl0OGxqZUh5VWhXeFNpbUJnaUdWUWdDYVdybzY1ZEFkY1VG?=
 =?utf-8?B?NHJMUWU4Mnc2U3FkMkRZUUVQRmVPSHdVVFMrRGZ2UjFGNGp6Ukc2RjNUa01V?=
 =?utf-8?B?T1NQeVh5MVZDNDhXWWpsL3hkdk9VVjMwYzFHRkUzN1RZYXdScUMvYXJlbnIr?=
 =?utf-8?B?UUQ3Rm14N1ppaTM2RzA4aTNKWXRSOFRXbWZoM3hVTS8zanBpaHF4bnlqVjhO?=
 =?utf-8?B?aitUdWZpcGZJRW1DR1VxQWRpTGhRSWQrYi9ndmJoak81K29sdzRwQ09DbldZ?=
 =?utf-8?B?ZmpLUVZFUk5xT0pVUnZ6eGhXdzV4UC94ZWtHeEFXNFQyck1jNkVBaVpLeGVC?=
 =?utf-8?B?UXpwajB0eHpUSWt5aEFDUjdraGlYcGxrMitXVVhLLzNERURGbE1GRTZkTmEy?=
 =?utf-8?B?WE9WblFHeXhnWjZ6Z1FHYnAxS2d0d2VaOUJRMkVIZWhVeWFuTHQ1aXVZNDEv?=
 =?utf-8?B?OEdtbkwrTGl1TXo0WGt1dlI4QTMrcXBybFl2KzQ4NjhGVXhhN2JZNkxYZ04r?=
 =?utf-8?B?MjZ0UkJRY2FIcVN5WDJPZHdpaVpjcnJJUHJDSU5UQWFmQmd6N1F3cEdkMzNX?=
 =?utf-8?B?U3J1R056emJPSFJRK0FEc1U1WmxKUzdGZEd4dE1YM2hOK3VlL3lTWjZSVUI4?=
 =?utf-8?B?RUFhMFJKRWlncnUwNmdDcGlRSWUva3RTYVprUzJVQkM4RWZxVkE1ays0TVRw?=
 =?utf-8?B?VVlKdi93ZGJ6bVhtTm55THBRU2t0eDhaZEVMcmRvNlZCK081WXYvZnIxU3ZE?=
 =?utf-8?B?eXl5aFF0YlU0Z0R1SVc1NFJrYkpxaXJVMGtuUFJTNzZQelFnS1dYOG1zS0kw?=
 =?utf-8?B?Wi9PVzBBTXQ5NkpRWnArTXY4VnJqSklFNkc5ZXVhbWFvMndpOEJLMjZwVVRT?=
 =?utf-8?B?TlNSWFl6UGZyb0M4NkVYT1FWTGJMcWIzNWRyNlBKWGRSQ3pvRVJlaDZPeitY?=
 =?utf-8?B?bE5EUlFEVE5IdHpLRjcrVUI0MXBqTmdQR2tmQWJxdHIrbHNLMk84S0JmZEc1?=
 =?utf-8?B?dGY5RzQ0OXlVdG4yeld3c1p6ZitKUThSeER6VEpBa1RpaXBseUJUaTZtWGdB?=
 =?utf-8?B?U0NWZ2UwbGJKM0FFSmd0OXMwcTgzek9kVUdKbEdMdEgxK0VDR3p1U1JETzlR?=
 =?utf-8?B?SkZFdUdaclNDakJwRXR4MGZ1S29PSGNOTjZ3UnRrRkphM0VJR1JFS0VzSU1T?=
 =?utf-8?B?MkhCaUFOM21tbmZXVEpydlhuMXVIcUdsNnVMVjNWdDY5WU9FUUhNS0c2djlJ?=
 =?utf-8?B?RUVuSVhRRXVGaFowWDRqTklRT3orZjhlYXVMcEZ1TVBHSFNQQzZNbG9aWW8z?=
 =?utf-8?B?RE50SHVLdzd1blZJNXhuVUtOQ0xyTDVPTjFyVTFkRjNicTk1WkMwYVF6M1JX?=
 =?utf-8?B?bXp0MVQweTZwVVVZTEJ4U2VleUdXMkZGRTdWY3dldytzZkpMNkFGV1orSDdS?=
 =?utf-8?B?Qkxpb0tzdG50K296OThQamZOa3lHdm9pdG5aZm1YWjJQeVpTWjhVTjNiS3E3?=
 =?utf-8?B?bmdsQnBkTGNuMUR6SzluTHNiRjlZMFcvZ1pyNGx6L2JNODFrVE1nSTBTSWk5?=
 =?utf-8?B?MU5nTHdoMVFRQ2JGMXVFTWlqTE9OeE9QVlVaaFBrTTNNc1I0QVR2cFd0cjZD?=
 =?utf-8?B?cFluM1V3OWU4eXA0OENVYkZlU0hHS1dobUJkWk92NS9lUVIwdFlSOEhuYi85?=
 =?utf-8?B?WWRsM2FoY2FTQ2RLRXpJeGJ3eDR5cWx4enpjbHFELzlpUFBOS3UraExzNmVt?=
 =?utf-8?B?cHJTcU5lU0s2Y1NmdkJhT3JRcklRZ2NhT01Ub2QzVTJxVEdkSDB6dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 535cf23d-a6bf-4aee-f261-08da12e91732
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 07:35:55.4272 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 08LYxZXwRnxaZ35nmeZJmjWunHBnaONZ9d4iTC/kObWU0wfbCtmsNIuMQ0cwJOK5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1762
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

Well the fix is trivial, but somehow rebuilding drm-tip always fails for 
me while merging drm-intel-next.

I probably have somehow messed up reverting the conflict resolution. Ideas?

Christian.

Am 31.03.22 um 08:28 schrieb Christian König:
> I'm going to take a look, but need to figure out how to find the 
> broken merge
>
> Christian.
>
> Am 31.03.22 um 00:33 schrieb Dixit, Ashutosh:
>> Is anyone looking into fixing this:
>>
>> drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c: In function 
>> ‘amdgpu_gtt_mgr_recover’:
>> drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c:200:31: error: ‘struct 
>> ttm_range_mgr_node’ has no member named ‘tbo’
>>     amdgpu_ttm_recover_gart(node->tbo);
>>                                 ^~
>> make[4]: *** [scripts/Makefile.build:288: 
>> drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.o] Error 1
>>
>> Thanks.
>

