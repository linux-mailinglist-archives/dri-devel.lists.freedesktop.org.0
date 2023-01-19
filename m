Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B34D66736F7
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 12:34:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AED2910E90E;
	Thu, 19 Jan 2023 11:34:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2055.outbound.protection.outlook.com [40.107.237.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1DC010E093;
 Thu, 19 Jan 2023 11:34:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AuwI4yGz6B2GyMlPfH/iiAvH+b/AwaNl8N066zZKlCxD+ssqp0hZ93DmuaSJDo35HOSAFc+RR5SZ8ntlH0xRJlc+YqDBpWqa5ViqJKVL1nKuk7SRlBeLkcbzzOerDLi0M/ql5c3laDZNQ1jMEF9BSJX+/+tmcQEB/LaVvYV3s2hQyh2XxZ+iiYAp9F0qPy7ZGODa25F+yqGlJRc5sPB0oVvZPD4k3mwCrj+phihPlrSxAY8xaqsbrHY10F16+vqCwGg75NXB1a4s4ZiqDfoKC4GMYZyqtYMu7AX0+HFzz172cN5rZ+DbLaWmpO4/sLD0nQlSx4DgIzl/EiNCgMQOHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vW4+CceB3VYslbsk7nELPXYMigedjnEC+K17EI3Im8A=;
 b=J/v7ukzfkRJlRif+4Vi5/AbEpdESzZOxiXa+cjuZnvbfQNraauZbc9D/o9FpnXIOtu1I2e9mrdiASCHn8x+0Q7mL8W5QliMlOe2qapYPMoqJRywk6r1yuFhZmCX7RuoZS6JOvLrDTIEMBIK3eJKZNKwaqCLxBnaQel2mYCTyEmiJykG+B1GNHbVMQKiexq4RDavGlaqhmi6w/CN/1yNFSsXk5oGED9bIEue/G7JcV01ZYPlamfWlvnLE3NhWhjMKbNi9IMVBF8PdQvdAU74s8WgbbshmwJpfXoWrkDQpPzi3ZvLmlLHXB4YmQGsa1VPPR8QPD0woImM+/A4/0bky4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vW4+CceB3VYslbsk7nELPXYMigedjnEC+K17EI3Im8A=;
 b=gGNLAOAnKqGG3EX3HWQiN+GpYQw068ExCJ6LiCJSwrCQKp/V0MzGgR3dSyROPY1F+Facg2Hi+/G5FpiIbX+Ox8LTpOTUel5HlL6D2soY25n2f27CJ3WNBSSu7sPaDv92NIYyKQjM8fskZF7nCqy24LmYlAu31GlqaqGR08THcgA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH7PR12MB7987.namprd12.prod.outlook.com (2603:10b6:510:27c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Thu, 19 Jan
 2023 11:34:02 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0%3]) with mapi id 15.20.6002.024; Thu, 19 Jan 2023
 11:34:02 +0000
Message-ID: <12f8f138-302d-83d8-3d10-4036400d5482@amd.com>
Date: Thu, 19 Jan 2023 12:33:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: drm_gpuva_manager requirements (was Re: [PATCH drm-next 00/14] [RFC]
 DRM GPUVA Manager & Nouveau VM_BIND UAPI)
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@redhat.com>
References: <db4fa0fc-c9a6-9a48-c45f-1d655b30aff9@amd.com>
 <02b0bcb8-f69f-93cf-1f56-ec883cb33965@redhat.com>
 <3602500f-05f5-10b8-5ec6-0a6246e2bb6b@amd.com>
 <bcbef353-f579-4e90-1c77-be36bbe61c0f@redhat.com>
 <CADnq5_PGaXFW-z3gt+R+W+vBVdeuL4wMuMOQh4muxU13Bemy3A@mail.gmail.com>
 <0f2d6e1a-a3b5-f323-a29d-caade427292c@redhat.com>
 <CADnq5_Nh-1esiHzvTG+qFBCfMjy21efX-YN2jfGG=WC+-4LwLQ@mail.gmail.com>
 <CAPM=9txMZO1uYj+kVdTfmCwV2Fq8uu_b3i4eq4xhqPEPKBW8Eg@mail.gmail.com>
 <7839c47e-6692-b93b-69a8-9584193cb07d@amd.com>
 <6566870d-6256-8eef-5879-cb13711e4bed@redhat.com>
 <Y8jT1TazLddqZjG4@DUT025-TGLU.fm.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <Y8jT1TazLddqZjG4@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0169.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::8) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH7PR12MB7987:EE_
X-MS-Office365-Filtering-Correlation-Id: 6659f5b3-bbf7-4f2b-9f3b-08dafa111050
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IWM4i6yUrKR1URJ5IYwRI/eyBIxslO7GZyOeERqHt+tWUgQwn4l+x8tfEje7bFtiuDJJShRfWSShXr3zNDypVmJW23S7nV1Nt7yrB+LrNAPtd0J20tDyn9U5EXf/V/eCjVcg1TUZEFQtmsRBxjsJwWW6THfBurHXIgVvojzr/BZ2vSYe0J9lC0DVg1EAucVdzzvi7Gt+4IGv7pZiHcjVsAaLmYSLl3UBGJIxQLEbUHgM0FwYhxjAVvfLddrsWD1VNBk58kb4KJPtAyN7qXj5pu3QXyyuclyiOvtltJVQPBEbrpz0j4Dsl/GSx48Gf9LieO6W0v++YvAd70kiBiHgvhzBJlnszrUXhyDfh5MeDjWZUQ3c0eHKlSYZPJXQu8E/aP/OsK/ZiMukKLMT/F7XIK2QLhq9MGzvDDdWYXUp5BFiR70ZHpbQCY/bNlJsEjg/v9fttex4EIgZMrqmCWXlx5hubBpM/ubqXVQs9A6axPIB3d6Kd4+aDpW+UZaULuNfF/Vlp5QOsipGAzY5QzWebx3cYG5AaGw4Um0KtrcYOetRXm/wWPxG11mzZUI7LbzMKITWvw45CcrZtGZrGwMSe+YA0/3j74qtmNyT42TzoJFn3ZlM5InF62JPWLrXycHFenJCC/d6Ud3u9CE+spz2XYu+AVMXGEh3whFRd9PtEOcAe4z/27VR44pYuPORJzJFuISfhN/GPiDo/5FtefY/Oiij0fa8wQ6fEPchMxVcJuc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(136003)(396003)(39860400002)(366004)(346002)(451199015)(36756003)(66899015)(31686004)(66476007)(7416002)(2906002)(66946007)(8936002)(5660300002)(66556008)(31696002)(38100700002)(316002)(54906003)(110136005)(6666004)(6506007)(86362001)(478600001)(6486002)(8676002)(4326008)(41300700001)(186003)(83380400001)(26005)(6512007)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFBla3NmTWFXbWV4Tm1BNStObnl0N2dvcERPNlJURHJSa29aOU9wMFEzTVhi?=
 =?utf-8?B?c05oMTZRV1ZCaktzRGM3dHJBazJ6b2hwYk9qT0dYRk8xYm9ONnFSd1NNS3ZU?=
 =?utf-8?B?b245WmljUGdSdUhTaDUzWkNlTXVmK1lyUGo1Z0I1Y3BOdm9KNDd5V3J5ZjdK?=
 =?utf-8?B?bFBMeHhiWVZuck1tWHk3aUhsb2dtcHdCV1pJT09xcFh3ZkhXOFR5QzVpNWxu?=
 =?utf-8?B?ek4zSUdVZkEyZnBSU0VCSmRLUmVrQTd1Q3VMODB3WVBaYzVlSWFYWTdEbFdV?=
 =?utf-8?B?OFlNSFZBaDduU0lQR205Rnl1VERmOGtHMEl0VVdZK1g1U1lPdFd6VlhRanVm?=
 =?utf-8?B?TWFJU0dIQVNEN3c0a08wZjlNUWZTWG1PMUVNOTEwY0ZJT3R3N2ZnZEZDVmUz?=
 =?utf-8?B?VHJXQkkyeEJ4WXlLdk1nczhZeSszUHZoUW40ZXpkdmx3OUs5S01JTHdSSFdp?=
 =?utf-8?B?Z09ybGg0eXNKVFdneHNGUlMvK0k4V29RWS9mSnBPYWtzWm54WVJSTC9LS2Nj?=
 =?utf-8?B?a29aZTVuVE5mclJYdHBRYndlWXJxMUhtYmE4MWxHeVdNcDRDTG9BdFhVSzVQ?=
 =?utf-8?B?UW5FTUFKZVVYeXdOWlhudzlObUxESVdWcm50V21qNitDM3F4ekk4NUE3ckJE?=
 =?utf-8?B?VUdEeTI3RGRGNFllUTg2cS9xczVlOXZSK1QwWUJYL0tRVGFNL2wwUTlLbkdE?=
 =?utf-8?B?MWFwUzlFanhrZnZLaGJMWU5nS1J3SU1YVFg4bEluTWRzWEY3UVBhdldSK0V0?=
 =?utf-8?B?NysvbW5UZk00ZmoxM3ZZa2xlak55Q2J1M01lVW03OEZ5b3JEd3JaOFJUYW9W?=
 =?utf-8?B?UnZ5MFcxVGp2N1VyTCtQY1F0VDlKYytTdEZ3TlZtNmpyalZxZkNyMm5NYmkw?=
 =?utf-8?B?aWo4RWJEU2lHbVZKM1dFZVF0dVlIL09wdzhyMFREU2hMZ2lYOS93Tk1TWUEx?=
 =?utf-8?B?aDB0dmdFdlFqZEpIaVFlaVZMcjNVVWhQNmxFcjJ3QzhFZmhWeWlHdWhRaGht?=
 =?utf-8?B?Sm5IWStHQUNqajB2U1czMG9WeHE1VytETzQ3NnRFaHgzYlMzemE0b0o3eVFx?=
 =?utf-8?B?eVZGUkhxa1Rma1h5MXNxS2lFRlI3dTFsVEhlT0RIOU1ZS1kraEN5WUdKWkZH?=
 =?utf-8?B?S2F5emFqSXpPekdpZmZHVjg5MDJ3N3ZXd2JkTitNRjFpS0VIbFdGK05EV2tr?=
 =?utf-8?B?Z1pYZ3pjdUppb3I4Z1ZMd1ZLM0laWDJKNFJVSXlsaFJ4YW4xRDlWSkExWno1?=
 =?utf-8?B?eVp6Q0s1NzU2NFNreHU4c05VWVM1Vi9hbnlJV1N3UWJVSk9iZGs1QytLdzR2?=
 =?utf-8?B?K3crTDZIWHIzUm9BbkxBT3BmOGlXTFFnaFdEVmRmaFRvZmhaVGZwdEtyQWJV?=
 =?utf-8?B?NUhycElSZk1MeU9wTHY0ZnFVaWllTlc1ejhQWXFKUHlWYk5sb0ZUZ3EwajFR?=
 =?utf-8?B?cGprdWNiNWlmNmJYdmtFRU9kZUNDN0ZCVFBpWkd5cWcrNEhCNnRZYXdHUDRO?=
 =?utf-8?B?azNBa25YdWFERzMveVpYMHlLUWl1UFFTOGRVTHdVQzF4MCtyS3FBWFJtTzhK?=
 =?utf-8?B?cVA4WE0wcGtwbnhhT01GSTMvVmhoamRGYVFNUm9oV0pJODVxK1V3OFJEVDBh?=
 =?utf-8?B?aENRNEZjdThFbDJBSXJFMXhldXk5U2xKSHdZekFZNk96WldrVTJMSFo4YnNh?=
 =?utf-8?B?aGIrSEdkb0xkcGtSd2cxeWpqcVVSOGo2WlNzU255TzE2cmlQUXhVUGY1MDVP?=
 =?utf-8?B?T3BGdFpqb0N6eUV1dHJhMVpORzhwVjNPeldxK0lvc1ZFTm1raUd3SG12c1lN?=
 =?utf-8?B?TXJ0QTEzai9oQVltREJtUHozUGs2Sk9NSCszaHp6aUtKZk83WGdaY0VVUVNm?=
 =?utf-8?B?a0pNV3VacXVadkh4RldIRFNsTndWQmVxNnRoM2R0TWZuc0xPQk9zZk9DYW1i?=
 =?utf-8?B?WGZnbzU4R3pjRVlYbDRmcFVoVkloZHJQS2RMSk51Y3JBNEtqT0h2OEM5RE1u?=
 =?utf-8?B?SDhEOWZlc0tmcmNSTFB5blFweGt3TzFDcGJpZk13ZDVHaGYzeGQ4OGF1dXBE?=
 =?utf-8?B?NHg1NGJrS1BjaHJsSG9MU2l4MTVuM2xxak5kUXdwRmNvbVVaNjVsQUdKQ0ZN?=
 =?utf-8?Q?DDmW8RjjsYO6x39JW7Gjk+A/0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6659f5b3-bbf7-4f2b-9f3b-08dafa111050
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 11:34:02.4890 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MgQBXeCP6JUjAjxzgZNl4e7BQQq+OyXCVfLL4TunV7j5GfK90Ky0ts13jtIJxCKW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7987
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
Cc: tzimmermann@suse.de, corbet@lwn.net, nouveau@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bskeggs@redhat.com, jason@jlekstrand.net,
 airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 19.01.23 um 06:23 schrieb Matthew Brost:
> [SNIP]
>>>> Userspace (generally Vulkan, some compute) has interfaces that pretty
>>>> much dictate a lot of how VMA tracking works, esp around lifetimes,
>>>> sparse mappings and splitting/merging underlying page tables, I'd
>>>> really like this to be more consistent across drivers, because already
>>>> I think we've seen with freedreno some divergence from amdgpu and we
>>>> also have i915/xe to deal with. I'd like to at least have one place
>>>> that we can say this is how it should work, since this is something
>>>> that *should* be consistent across drivers mostly, as it is more about
>>>> how the uapi is exposed.
>>> That's a really good idea, but the implementation with drm_mm won't work
>>> like that.
>>>
>>> We have Vulkan applications which use the sparse feature to create
>>> literally millions of mappings. That's why I have fine tuned the mapping
> Is this not an application issue? Millions of mappings seems a bit
> absurd to me.

That's unfortunately how some games are designed these days.

>>> structure in amdgpu down to ~80 bytes IIRC and save every CPU cycle
>>> possible in the handling of that.
> We might need to bit of work here in Xe as our xe_vma structure is quite
> big as we currently use it as dumping ground for various features.

We have done that as well and it turned out to be a bad idea. At one 
point we added some power management information into the mapping 
structure, but quickly reverted that.

>> That's a valuable information. Can you recommend such an application for
>> testing / benchmarking?
>>
> Also interested.

On of the most demanding ones is Forza Horizon 5. The general approach 
of that game seems to be to allocate 64GiB of address space (equals 16 
million 4kiB pages) and then mmap() whatever data it needs into that 
self managed space, assuming that every 4KiB page is individually 
mapable to a different location.

>> Your optimization effort sounds great. May it be worth thinking about
>> generalizing your approach by itself and stacking the drm_gpuva_manager on
>> top of it?
>>
> FWIW the Xe is on board with the drm_gpuva_manager effort, we basically
> open code all of this right now. I'd like to port over to
> drm_gpuva_manager ASAP so we can contribute and help find a viable
> solution for all of us.

Sounds good. I haven't looked into the drm_gpuva_manager code yet, but a 
few design notes I've leaned from amdgpu:

Separate address space management (drm_mm) from page table management. 
In other words when an application asks for 64GiB for free address space 
you don't look into the page table structures, but rather into a 
separate drm_mm instance. In amdgpu we even moved the later into 
userspace, but the general take away is that you have only a handful of 
address space requests while you have tons of mapping/unmapping requests.

Separate the tracking structure into two, one for each BO+VM combination 
(we call that amdgpu_bo_va) and one for each mapping (called 
amdgpu_bo_va_mapping). We unfortunately use that for our hw dependent 
state machine as well, so it isn't easily generalize-able.

I've gone back on forth on merging VMA and then not again. Not merging 
them can save quite a bit of overhead, but results in much more mappings 
for some use cases.

Regards,
Christian.

>
> Matt
>   
>>> A drm_mm_node is more in the range of ~200 bytes and certainly not
>>> suitable for this kind of job.
>>>
>>> I strongly suggest to rather use a good bunch of the amdgpu VM code as
>>> blueprint for the common infrastructure.
>> I will definitely have look.
>>
>>> Regards,
>>> Christian.
>>>
>>>> Dave.

