Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 125FB3CCDC9
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 08:11:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3E8989D6C;
	Mon, 19 Jul 2021 06:11:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2072.outbound.protection.outlook.com [40.107.101.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D19C489D6C
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 06:11:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V7PIJfQ+deSTvkJjEs+rjwculIpQgJ9nHcXSFoZELCmdpfnOXGowXPgFSmtMyFDHnsl0Jx4e3kWNsIyicYhmcLtLs8P08tqHhyaDnS6H3vQmGZYqq/oKGtgrZWGaLII7VcKz8iaCygHwch8hMTqq+hhKBD5E5KjyxSTdGKDwNoWKdHJyWzWbhjv/unkW7XvL+BBOEL7OT0VZ1dg7FTYN1Z98/e14pL2uPcCnuIA63DNsjD1lKsan7A4v5/LGmIMo2hOx5v8GhejO3v3v0s5Cird4k7OBZ0IokWbI2QntUg2aXGY/PXZvUyeTeDyeMA0dSzmqUTK1h651LaEURAKvlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mxljdsBvHogLJB5z/YcDnYE1k+kQ1JHdi5ZX4zi5Bbk=;
 b=UY1wBTzUT7gC3yqhIXj0tgyKUf/0k5rz8Uy+6Q4GSXRlW8bKn005ZIY6NGA6O7yIfb49V6n37ra3WFJ4+kP0SF2Q5e40t3qdyqSqwvagYR3F8SO2EsOVkQ92Fpi28RK00ydy0ugt/kzNdy35YdoR9sh/8rkc+8weZmm79fFWYapzJKSUamB5w2PT1eAoQEk1Zf8fKxyWtSU4VNyEbMTfyVEptfiYAbOrGjJ5OHgB+MMElfullXvDpSUETWHqE8m33FM8b3gD4VLEP0lQMG0jhPS+BIAsYSvbG5yrLYtfrXVX+P1Gy5YaevwevVhSom2YbYmEzrYx5JMy4dt1m7gTAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mxljdsBvHogLJB5z/YcDnYE1k+kQ1JHdi5ZX4zi5Bbk=;
 b=N/wvIW1isoKqsscSWnvXNG53CECfAED/xV3vci4XiaaoSbQzaTWYvgURBmIRrSuz5f5iBDzpFnnf2Tr5jUATtwgNLe6lORfxT3pEFdN714gtg8RZhdqJJLpKDncqBz5cuhdgyyFjc8Xt28odHO4fTmDo7ETjAIDccm4SSIeuozA=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BY5PR12MB3764.namprd12.prod.outlook.com (2603:10b6:a03:1ac::17)
 by BYAPR12MB3224.namprd12.prod.outlook.com (2603:10b6:a03:137::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.29; Mon, 19 Jul
 2021 06:11:34 +0000
Received: from BY5PR12MB3764.namprd12.prod.outlook.com
 ([fe80::6c58:1598:e768:d45e]) by BY5PR12MB3764.namprd12.prod.outlook.com
 ([fe80::6c58:1598:e768:d45e%7]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 06:11:33 +0000
Subject: Re: [git pull] drm fixes for 5.14-rc2
To: "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dave Airlie <airlied@gmail.com>
References: <CAPM=9tzb9KSspAtVkSH3pYN97hQ815MoOBTSiuHzUJnnb2fhRA@mail.gmail.com>
 <20210717214302.mpfil765uji5dnb7@box.shutemov.name>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <44538364-13c5-2626-502c-31d85161a0d4@amd.com>
Date: Mon, 19 Jul 2021 08:11:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210717214302.mpfil765uji5dnb7@box.shutemov.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: PR0P264CA0250.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::22)
 To BY5PR12MB3764.namprd12.prod.outlook.com
 (2603:10b6:a03:1ac::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:e48d:68a9:5ef4:9e09]
 (2a02:908:1252:fb60:e48d:68a9:5ef4:9e09) by
 PR0P264CA0250.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Mon, 19 Jul 2021 06:11:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9e01e07-4a50-4c11-bf15-08d94a7c0e5b
X-MS-TrafficTypeDiagnostic: BYAPR12MB3224:
X-Microsoft-Antispam-PRVS: <BYAPR12MB32243817205E61633FB66A6A83E19@BYAPR12MB3224.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MZ1/d6KQCz2qHFRDcAtAjt6lIy0ccLAoQgji2DpzRvmXEUU8BWf0+mThCUXbUPf6ap9dIXBCCzhBXEQScnUQdPPvFrF/jo9wKqrD2Ukwln9YvECYmeeOQLRzY5CJ8hvKmcB1+rfJqF0dnBH16V9EMfONpT1u+qCUQeJkTlC4oLE3sL3MpxrP68K4sV2UKPEfXuwhDcMsbjkONAhM4c6Jdkg4g26OEIRvZAA1HZuFN4TjA7YnhjVA/+s6ZmaLtwNXoKvOEK42YvsedoihyA8bJ8KpR2nxwc9VKkC/RiPvtrf+32nIQI2QLZvKSB5OCD3kpVcLcFldSTWaBkzDKtemE/TnpO6FEKW8q5kUCmlJ/UA++ni6cDAMXmQWX5JHqQfB4gLJPJltLbBHUvEiOoy74J/SJnsRBkrJJaQ0pdG4EWkad2RtJf0qY87OxXqyt6oK0omFkht1TLPWDy1i8bX88OZ0mKcbUS/sZGDCcTKE/7Ji6WlEiuYhXtVZZMCRzooCyDsuUsXk1jrq2iZSba+GbwD0Wn3AKqui9K/Os4aqByJVa7z0E9CxNE6YEaioVLdEBvi7lIigpwHsNagBV87kC55lgd8Iz86pOz9RN9SIWWKiGha+vKdbtIPcYM91mcRy5cSgW/qOtiyPI2Ch5t95Z6Hss5+8/6inVthmyAECihdLe/5pBtWuDqFmeMAZa15XbMqNJViALvJfNZNn1QCV2yZZ8dD6zWc/4nQN7Jj4aYKpwLNFp+ufyM8JcDODCsiWuWjRk9fKMngEdiy6aCqPGCXOV17zbf+UG/8mLDY5T9hS8lBJHJzwgnO9Tv2K947MNez90rBKH8iboM9AevlauQjbPKHtiAtP/j+gGNPCpfo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB3764.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(54906003)(110136005)(4326008)(316002)(86362001)(38100700002)(31696002)(45080400002)(966005)(8676002)(508600001)(8936002)(186003)(6666004)(2616005)(2906002)(36756003)(6486002)(83380400001)(31686004)(66946007)(5660300002)(66476007)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkZYOXpKZ1lZcTk2MDNVL2pSVkhzTnE0NWgwTnZhU2VXekkyWUYwZkdMR2ty?=
 =?utf-8?B?ektORkhJRzF4K3JiOHV6OHNoNUh0VEFQQVJIazE5UkgxbktuajgyeG16Rzlp?=
 =?utf-8?B?cDFjSnVOd25MOFZTazFQN2JGdEpEWU4zV0VCdVUrcTdtS3JDN0h6MnRBTk5M?=
 =?utf-8?B?T2Q3dEJ6b0dmOXlrdXhBakpoZDVUZUlKTTVnMDRvQ1R6L2VvZW5yajNTOXFP?=
 =?utf-8?B?ZWQ2ZTBnVFdvQVIwS3dWaC84VWpnRjBoNjRpMUN1ckdmK2J1WU9naUpHTkxJ?=
 =?utf-8?B?dWJETEhLMFZkNWJxSmhtRndhTFNlcFhSNFg3aVF1bitGNmw1SGVDU1FmZkt3?=
 =?utf-8?B?OFZCSUkrTDFrNXUvc3RjeS9SMFhBSUxJSlVIUzYzNXFNR0pxeDZKb25JN1N2?=
 =?utf-8?B?Zy93Sm1rYjNoanJJcC9DRElleTZhKzl0UXVtWnluOXJ0TGJUKzlReHNSeE1t?=
 =?utf-8?B?NDdaWGhrWDZpdG9ZZEF1VHhSeE9MYVlCV0hnS2ZNM3A2T2ZtNmo0VE9uSHVP?=
 =?utf-8?B?VllWV0NMbjhFekE2NUFrRERxcFJwckJpc3dGd2FMVFdLWFphUHBTbVBmbVpm?=
 =?utf-8?B?Z0VsMXg3WnhQNE02QlZkL3AzRjZqNjA3am80aTg3ZG53c1Q1YXlDVStKNVp3?=
 =?utf-8?B?VHd4N2IwY1BZU1RPYXRyNTZmd2pwakdhUzNFcVdBVnpGR1RVYk5kL3pQMEFq?=
 =?utf-8?B?TzN3NVhPeEYzVkNpUmVvbGJSR0V1VE9GOWV4ODZYS1gvMWxPdVhaZG5zTmdz?=
 =?utf-8?B?Ynp6TTd4NXRlU0VXNzB4Slh5VG4rUFJYZmFKOC9IZFBJMkxoWXpuYy9LRHMw?=
 =?utf-8?B?VzhnaElvRnhTZ3RqVUl0VTh0TXpGZ0xmODMxVnlndmdCTkpNNGtHZWwzNk9T?=
 =?utf-8?B?LzVMalN2OUdYYzlGTTBaM0FWOWxVQm5lWm41ZzF0NVZXeTlhd0QzR001NzN4?=
 =?utf-8?B?ckVFK2tlZGdhcmFwRFBpNVg5THI4dG9vTVFNQ1UxNkdPVzRLYitJenRqSXVX?=
 =?utf-8?B?UEF1VUF0dEt6STAyZEVPZDlTbWpzc20yRnM3SHZGSEhVRXF2OEJ0dCs4cVpG?=
 =?utf-8?B?c0pzZUJ4NkN4dXdPMzBuQzN0MDdod0RScmRSZnpQQWdhTktNZkEwM1V0Vnc4?=
 =?utf-8?B?OXlWNWh2MTFKd0l5Y3pkRUE5cGJSbnppL0lNaWNlanh6SXIrd0ZIZUZmRGR4?=
 =?utf-8?B?UVRELzE2WjlFemMzY0paVmZCM2pSOVJTWVFNTmVWaDBQci9YeGU4MUFCcDVa?=
 =?utf-8?B?ck1RVkk1OTc1QzlobVQvSXovempoc3ptSkRRWjB3QzJZT0V4ZDlmUlhwbnVs?=
 =?utf-8?B?TVFQZHhUQjVLVXVCNm1uL0s1UVFoSlVQd3Z1RGo1dE11MVNUWjlWS0JsMnJV?=
 =?utf-8?B?clArMkVvZWlSK1VJeFpUTTYvcnl2UHM4TDhXSmJDWmVOL0R0dzZKeVRvVGMz?=
 =?utf-8?B?VzJyNXNYdWtWZElmaEIrUjZPZGNpWHVzMWhoVW5oUVVsLzJNOHFmN2l1T0pO?=
 =?utf-8?B?K3RUV09Fb1NUTG1JOWVzeWRVRGNRZ0dzQ3pZOENKMTUyaVE0QUR3dzErNnl3?=
 =?utf-8?B?bWdpWnBocEloOVFHMzJBQWNYazNWQjR3eWVUQUdaMWE5MHhoZjdianFiVm1D?=
 =?utf-8?B?U3lET3RuYjk3ZndrSGVtOEdGRWdEbnM4UFFXWlN5eEdrdUI2UitjOHJVMTFX?=
 =?utf-8?B?S203cGd0ZERuZ2NpZXg4L1dXcFRHOU0xUldyOVpxeUdkTTN4dzhkWWwrREc3?=
 =?utf-8?B?MnRQenlNUTlWVERUeTZ1SHlpUHVnd3Q2K3BwUC9WK0o0Z0x0OVJXWUtOa2FP?=
 =?utf-8?B?YnlEMVFyL0dtYVNBbTMveHZjV2UycVJiTGJSU1BZWWtoTmNpQ0dYLzE2SW9C?=
 =?utf-8?Q?97C8mDA6/zPtD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9e01e07-4a50-4c11-bf15-08d94a7c0e5b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3764.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 06:11:33.6444 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VRUYm8kOgYCXT5uQpHSgQFEhNyXqYUjWLQxqyJQyVO/yytR5yclVHwv96cuK8PF+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3224
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 17.07.21 um 23:43 schrieb Kirill A. Shutemov:
> On Fri, Jul 16, 2021 at 01:41:18PM +1000, Dave Airlie wrote:
>> Hi Linus,
>>
>> Regular rc2 fixes though a bit more than usual at rc2 stage, people
>> must have been testing early or else some fixes from last week got a
>> bit laggy. There is one larger change in the amd fixes to amalgamate
>> some power management code on the newer chips with the code from the
>> older chips, it should only affects chips where support was introduced
>> in rc1 and it should make future fixes easier to maintain probably a
>> good idea to merge it now. Otherwise it's mostly fixes across the
>> board.
>>
>> Dave.
>>
>> drm-fixes-2021-07-16:
>> drm fixes for 5.14-rc2
> Dave, Daniel,

My fault, I've pushed it to drm-misc-next after the branch of.

Just cherry-picked that to drm-misc-fixes. Should be in the next -rc

Thanks for the notice,
Christian.

>
> Looks like the fix[1] for nouveau regression[2] is missing. Hm?
>
> [1] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fnouveau%2F20210609172902.1937-1-christian.koenig%40amd.com%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Cdfa76642807a4953a9dc08d9496bda6a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637621549856073674%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=8wYkOJYcSoLt3P6cFdTsaYrvX2UEhm7M5RKkaSn5dws%3D&amp;reserved=0
> [2] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Flkml%2FYOC4uekpD7iA3xPi%40Red%2FT%2F%23u&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Cdfa76642807a4953a9dc08d9496bda6a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637621549856073674%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=h5QYbNjhPDAqioojBPTY7uVvfJx6XwEV7ic8rwuMxMc%3D&amp;reserved=0
>

