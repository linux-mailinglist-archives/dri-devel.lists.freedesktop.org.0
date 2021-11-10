Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A286744BE71
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 11:18:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A2E76EA40;
	Wed, 10 Nov 2021 10:18:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2059.outbound.protection.outlook.com [40.107.92.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F5536EA66
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 10:18:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ECKZfaDCF2Gie3qefyfKA/GpYH1aXzQiuZXTQT5iL6f1aNUaV0+1WK2RgU1+83wrW1R8pfDjVEI0tIM8smGIg7MqboTr+sK082XhkYyo2tP/9PZja6KxrspwXzoj7LkI0ltfaSAdw4pVhDkKI2vRHFrAE1tptFo0Y10uslofhZXeGJqGUFpDEyJfIw3EeQr0bWfpJFli4um77w5zPrwmn7jjt0LBH0tXy7DZdMFqEYtfNTynpRjSAbReTSKoqtckfFNqgkWXzo1/U3+TvR+io1pf6xAAEoRlO3HHQlJecMKjyY9CEzjeGBPqDwTCA3SOYIjCb7IN/hxgYwUCUtuNUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ud9i53nCK/lIxNCfR4ui5Q2fN70htx0bx7FRdmFtabI=;
 b=JQa7lY39m87ZBxO1rZjCxNmu0su9hEC6Wn3p+CXCKOln0ZEudTzzcs4oU3eVf8QIu1EyhOVZwNT7Jh29njHpNnH2/gL99aRZ0rHlDg4CGhVOdqHDqN+YxwXhftbc90JchodkOoYvKtGa2OfGfj/FkfGDIuaB1trUhCCdE3asvqxuGsEy0s0Zzb4X0Rnq0d4tYGZ022h0MgWVyhGm7rO5jSpPbWkJCCdlNve2HcSQhwfU3zJCuamh8OghIbgE5YJZ22QYm89/3V3+Yk2qwkH4rspjP0zHADjwSkHxLM4OkNBmOaFoZ9ZIvFopDuilgH2abM3ZdEeyofSEVpugl4x4DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ud9i53nCK/lIxNCfR4ui5Q2fN70htx0bx7FRdmFtabI=;
 b=1UVylWypbT0hrrCZk/cZ+pkfmq5dhIbyccfw64cwhu8Nbr4m87TSB1Y6N9A35Tt3GAx2wxWRN3sIWirXhvMvbC8i3TeevD4szaaWtqtvJF9ZnpfwPOSAw8DGtxqXGwsGemcQoPiCrIQJYJX8QOjZ61xjc+Wk/oOYCsL0kkJ4PDo=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MW3PR12MB4473.namprd12.prod.outlook.com
 (2603:10b6:303:56::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Wed, 10 Nov
 2021 10:18:10 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769%5]) with mapi id 15.20.4669.016; Wed, 10 Nov 2021
 10:18:09 +0000
Subject: Re: Questions about KMS flip
To: Daniel Vetter <daniel@ffwll.ch>
References: <579d0f44-bb85-11b2-d326-35a0b7c5d0de@amd.com>
 <5c242319-ade3-5621-6429-f77b17c34de5@amd.com>
 <YYV0W1CxT5torU7u@phenom.ffwll.local>
 <64e70779-7c33-7849-aa29-aeaee4a89005@amd.com>
 <YYk7SkflDx8ToqYG@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <4ba7e3f8-7956-882a-6888-57e2448b907d@amd.com>
Date: Wed, 10 Nov 2021 11:18:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <YYk7SkflDx8ToqYG@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM7PR03CA0004.eurprd03.prod.outlook.com
 (2603:10a6:20b:130::14) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:fa11:45ae:fadf:6269]
 (2a02:908:1252:fb60:fa11:45ae:fadf:6269) by
 AM7PR03CA0004.eurprd03.prod.outlook.com (2603:10a6:20b:130::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16 via Frontend
 Transport; Wed, 10 Nov 2021 10:18:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ae0a196-bcae-42ec-9b17-08d9a43364d5
X-MS-TrafficTypeDiagnostic: MW3PR12MB4473:
X-Microsoft-Antispam-PRVS: <MW3PR12MB44734CAFCBE499A6CE9AFD5083939@MW3PR12MB4473.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7BtN4Ei3wibVUhqvTbAowQUC22CuuWnhcei2sBNJs5qNjHd/VFAfoxC4Kmc3+sU0GzfStY5tSlETzca0+U/ZP6JawPDeh3jMC9kj0PXbQMYZAWXI3MdeSa5fR8ZnD6MKx69C2jrOS68kGrjulV8hYu59QHKdHKJDrUkLYguyaNHGOdqBZD/YBbg2Yntqt1p53D9kYKP6Fti8DQeIQ5izzTbsuC4yAk9zQ0ThQO6E+TZ7t6Dom7kdR90bKCkC5s0EqbGpXukm6UofseBTsTK7NvuQjW9T3G/D+wkZzakPXoFlxpRdtubK0dlv2eQbrFjWjHn0PrAQfhkXcozNeeQazFk1q52EPr/sAhbKLjuR0vTQpw+6xGWVhbEFn6BiMw9AcIku/cFoZufkg6aJ+mUTd4U0MLy0sT7U5JZNLOrJSx6cbk6thbK/YgLYT7zxOJuEwYFl9JYbhjp3m2SqV2d43gmPG23vYHYo1+znbDcVSiugw9MgOGkk2fXOREiO0Xzi2kMcHdDpZqYH+I85LLmH1Gq6u8Ny0sjYekq+9NHpxLKmZ+iN0WSF+RSbaxnF8WXHbWodedGGovp8n5fju561pc/f39q0nHyUY8zBcTHgxyUMRbICgmtqrfDiMUP7Zrx7VcCvTQ2fzxSeVZvIsk8ot0KH3+JYe3hql/IHb5+sFmBc67bh6IVBk0eL9d7UwiAMy0I4s3jxKVlBpc4zQljnkMEO+CAkUM08iQrpNcEr14U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66574015)(316002)(31686004)(6486002)(8676002)(508600001)(86362001)(186003)(54906003)(6666004)(4326008)(66556008)(6916009)(36756003)(2906002)(3480700007)(5660300002)(38100700002)(83380400001)(66946007)(53546011)(2616005)(31696002)(8936002)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anljTEdWcmJ3UHpDa0c0eHhFT3VBMFl2TVhBY3IwWEVSNXlmRjNranBkSTlH?=
 =?utf-8?B?MjJwYXJYTkdrS2xJcEw1dXhTckc0eDdmVUx5U0NoVWZxOWx1MHBjU0lCYkwr?=
 =?utf-8?B?TVlLTW1rRXRMN05yb1kwNEZNR0JpTE15YUpiQThPNEdqcEZwYkxEL3VCS295?=
 =?utf-8?B?amZzSFIzeEh5VlQ2S0tXWDk2alBIanRVYXRLUjl4VDZVU3FvZ2NPWEZUWTVr?=
 =?utf-8?B?bC9TMlgza2dSU3ByN1AxamFRc3grbm1zMytEWWNuTUxkenBYMG4rTjg0OUNa?=
 =?utf-8?B?ZVFGazFvSGl4SmMzVmJlcFlHNGE1MHRoM2hoWVhQSzU2U3JQUHFNbnBQWXF2?=
 =?utf-8?B?ZTFoOWFqbE9JZzRtTTZzcnZJS3MzdFhud3o3RVU0M3FaUFRnRmpEMXNsTEI1?=
 =?utf-8?B?M2REN3lVdXRGSVpJUFhXU0doL0hGeU9SL29mT3hrN0VtZ3BVa084V0dKRTFK?=
 =?utf-8?B?ZmY1ZTRHYVMvRkh5YWE1T0tyc0JxVlAwV2pVT0FKTTFIb1NHUFg5SjdYTUdZ?=
 =?utf-8?B?a3ZaRTZBdkpSRjZ5SFVyMGZrREdDQlhoZllwL2hQcWp0TUNpR0kxcktGUEhN?=
 =?utf-8?B?S2NnK0NVUlZGZjhGMGs3UFNISEw5TXZTY01YaktZSWVqU3VQU1B4R3dvNVlL?=
 =?utf-8?B?dkVBT0VwL2t3c1dEU2xqenV1eHQrcG9KUUpUTDViWHlYSnRJYkdVV3IzUjBG?=
 =?utf-8?B?QWlMejdOeFRiaCtmVEtycnlUb3FtVTI4Wk44MjVrNVNuY0lqb1VZWWM4cFRG?=
 =?utf-8?B?bDMyT28vNXZXNmJ1bE1nSzMxZjQ4RUcyeUhEZ3lmcmdyNFF3UnJhSlVOL3pP?=
 =?utf-8?B?QmtCa0RvWUppV0dTMlppdFVUd21RYlFSOGhLSnBkY3JaQ09OVUZoNDltNlVZ?=
 =?utf-8?B?d0pwWldISGdwU3lUSU5Xdk42Z3U0UUliSGJXMEN5QXlGSUl6VEQ1L2oyLzkz?=
 =?utf-8?B?VFg3VFVnQUg4ZjNrQ3oxdWwxcXVrYk1HWjNvU2xJak9MdWEvODVaWnFpU2p3?=
 =?utf-8?B?NEN4bFZjQ1FENXg4Q2UvOEZuM3huSlJMZnlmeXEzR3Z1bGI2and2NEpRWDRL?=
 =?utf-8?B?RG4yY2hjOUlwdnBCWDVGL1R1emRNRUlUd1h4OXdsSzVsRjd0T2Zvei9SS1ZI?=
 =?utf-8?B?YzZpOVU3ekwwWGpYVkJubjBwRXZZZVNpTnNTQnB0RkhZY3NTQ3VUOURUTC9Q?=
 =?utf-8?B?NkNKS3g0aTFzQmhCZzlCc3VPc3NaUHh5RkdwSm9jbUhGakcxdm5vbGFiVWt5?=
 =?utf-8?B?WjRWRmhCdUZCNjFnbUEwSmVxMWZXRmRQTFJjekVDRUdWZDBXMFIyY2JVaStM?=
 =?utf-8?B?YUhCd1Z6aVBEb3V3aUM0RExqcGxxdjl4TDVlN2ptU29HUVppakV5YStDMkFO?=
 =?utf-8?B?cU5YU1pYYVJMcDRscEc4UUdmMm5IcWYzSWU5bGVJYXU4KzhNdXJHVlpEeloz?=
 =?utf-8?B?Y2E0WjZCbjl3SURiSTNiU09SdC81NHlxdU9MNVlxbEtyLzIrQ1NKQTNITG93?=
 =?utf-8?B?ZHVlZWM5UjVEd3ZDQVdRbFNHWCtJQnpWYWQybnk5RTEyaGFvYmd1NUhId3pK?=
 =?utf-8?B?S25mZkpsaTBLVTNLOGQzcWVKeTh1a3VOQ1VhMmdPTysyT0VJeEdCbXNkdS9G?=
 =?utf-8?B?YTJ6UWV2ekFNN0p0WENCYzQ4TFgwclRKbGo0RlpWRi9lRnA1ZW8ycGt1Q0tR?=
 =?utf-8?B?SkExV2NCR1REYmM1Nmk0bEhMRFhpa1FRd3hvWUJQK2l6UjVQeStQOU5iS1Za?=
 =?utf-8?B?S0tMeEtrblYvaGVpYnJvUXJyTHhkWUhYK2dZNUk1bUZPZEJFajhGYXZSUVZM?=
 =?utf-8?B?dTIwSXRtRTFoc2dBNjlLS3pFWk5nMzdvRS9QZ2YrOVZsWkYrY1QrMlNDa3lY?=
 =?utf-8?B?Y05XdkRRZ1RWLzN4VkxzZE0wZW9KOENzMmwvTms5TkNKVkNVTWJTQWhPT3hG?=
 =?utf-8?B?K0tBY3pjbjBwQ2ZKZjRJdkQrU1VXVEFveWFwaCsvV1ZQNk5VTG03a2EzL1Jw?=
 =?utf-8?B?UXVnbGpPZzR6QTZIYytBRTJGZGdLb1BLckt6aVV2U1g1NjlqQVRnV1g1YWt4?=
 =?utf-8?B?NmYwZ3cxK0tzOFpaNUgxQlR3bjYxdnE4RTR1M21ndU5vQmFhZDF0L0VyT0dp?=
 =?utf-8?B?Zk9oclhvVDlHZHU0aDk1N05oT1JVTjdRdU9zQ3pnZm1yd2l0amFhYnc4TjlP?=
 =?utf-8?Q?plPWMHgBbl7QnVAuhvjIsRM=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ae0a196-bcae-42ec-9b17-08d9a43364d5
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2021 10:18:09.8570 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TbrfGker2qSPMM5i28pa3hLmJzwd7TKf4v7Dw4Crvemev+UVC53mgPjLofuxDObe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4473
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
Cc: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 08.11.21 um 15:59 schrieb Daniel Vetter:
> On Mon, Nov 08, 2021 at 08:44:24AM +0100, Christian König wrote:
>> Am 05.11.21 um 19:13 schrieb Daniel Vetter:
>>> On Thu, Nov 04, 2021 at 12:44:34PM -0400, Harry Wentland wrote:
>>>> +Nick
>>>>
>>>> It looks to be the old drm_plane_state->fb holds that reference. See dm_plane_helper_cleanup_fb() in amdgpu_dm.c.
>>> Yup plane state holds reference for its entire existing (well this holds
>>> in general as design principle for atomic state structs, just makes life
>>> easier). And the plane state is guaranteed to exist from when we first pin
>>> (prepare_fb plane hook) to when it's getting unpinned (cleanup_fb plane
>>> hook).
>>>
>>> Out of curiosity, what's blowing up?
>> The TTM pin count warning. What happens is that we try to free up a BO while
>> it is still being pinned.
>>
>> My best guess is that some DMA-buf client is doing something wrong, but it
>> could of course also be that the BO was pinned for scanout.
> We check in dma_buf_release whether there's anything left over, so I think
> the dma-buf scenario is rather unlikely.

That was unfortunately only added quite recently and is currently 
backported to older kernels.

> I guess worst case we could add a cookie struct to dma_buf_pin that you
> need to pass to dma_buf_unpin, and wherein we can capture a backtrace. Or
> maybe implement that in ttm even. Otherwise I don't have good ideas.

I was thinking about something similar for ttm_bo_pin().

BTW: How would I do that? I know that dump_stack() prints the current 
stack trace into the system log, but how would I get this as string?

Thanks,
Christian.

> -Daniel
>
>> Christian.
>>
>>> -Daniel
>>>
>>>> Harry
>>>>
>>>> On 2021-11-04 08:51, Christian König wrote:
>>>>> Hi guys,
>>>>>
>>>>> adding the usual suspects which might know that of hand: When we do a KMS page flip, who keeps the reference to the BO while it is scanned out?
>>>>>
>>>>> We are running into warning backtraces from TTM which look more than odd.
>>>>>
>>>>> Thanks,
>>>>> Christian.

