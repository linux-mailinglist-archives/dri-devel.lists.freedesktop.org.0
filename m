Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37953463A87
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 16:46:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F1146E898;
	Tue, 30 Nov 2021 15:46:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2063.outbound.protection.outlook.com [40.107.223.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3BF16E87B;
 Tue, 30 Nov 2021 15:46:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l4v0m6/eweViJSfdhjDWldjObcfj3m2pV2oaPUyTQ2gGKfiQIO9vw10xrer9yn2am+1C7MEi+xldeWpMwMdM3s60UdKmPlg6r+9kD5SziSbJgnTndRUJzBXkSwZ0Bmksso6IDLD+YSHARcbAOjLnZ1JeEp7nLeulIDEPr558jiAERXf75VSiAsmYOiuuDJtj0l9HkFA7PGSZjxxLLrB7yjAT9ImcLCHlTVhXFGKuDgEGqQf7OMngRJ0TLUOhq9EyIthlWh4txlKcCfOygfiEp7Mud+wtI5jw2ob+kO0qlr0GcofKhtZwwdjyR25oB6NjLyM/Kg3CB7x5mFy08iUYxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uz6pgVAmIhcvHu5ClBjonVP5/5yGC6FMgCQPDa2t4OI=;
 b=UGqlxC6w1Lwm93MJ6Gsb7j+7S/Zs748G4oG+/n15ESGlDDoVmSGTXmBTPXv13cCO/QsaF+r9s6uVQ7mtT88rLPzalGPCzVpO6v97wINWNB2s2vdDOVe95aiZ152ApwfbtBH/a++MruI9kFxbl2QQCI8Lyh4NoLhPBJGUC65udeQTVuoNaXI7sFzvTNvZTcP3EhaQxNe6hUKtyf6FGsXK3jgENWGZnTqkfdGT0quq+H9Yj2uXoK01WFGupIfHHtOkjtVcOB07M3VfEj5KPevDA0WjLfsyjm9rTuWz3q+GYEymjrt0VEiH3f01fUggPRKDRLPo3yHXk5w08vbMQ6wkQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uz6pgVAmIhcvHu5ClBjonVP5/5yGC6FMgCQPDa2t4OI=;
 b=ylyG3cpmOJcKrfwKEQ0//UMOr94DjApl+vyTidgzvBdT/Q15YrAdpKKjRCHC++EOX6FDXC9iif9+h0iycceCgZ+m+KbnNZZ4hkL8v64OGXk4BYOX64zbxqlqcH/wskAH0ywzNsFwmlrw6jsjUMif36RLaHRdSegCQ4Ez9WgyxkA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2896.namprd12.prod.outlook.com (2603:10b6:208:ab::22)
 by MN2PR12MB3280.namprd12.prod.outlook.com (2603:10b6:208:ad::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Tue, 30 Nov
 2021 15:46:16 +0000
Received: from MN2PR12MB2896.namprd12.prod.outlook.com
 ([fe80::44f7:66fe:4419:d8d3]) by MN2PR12MB2896.namprd12.prod.outlook.com
 ([fe80::44f7:66fe:4419:d8d3%6]) with mapi id 15.20.4734.024; Tue, 30 Nov 2021
 15:46:16 +0000
Subject: Re: [PATCH 1/6] Documentation/gpu: Reorganize DC documentation
To: Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter
 <daniel@ffwll.ch>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20211125153830.1352994-1-Rodrigo.Siqueira@amd.com>
 <20211125153830.1352994-2-Rodrigo.Siqueira@amd.com>
 <YaEAVV3Ka2lG/iOh@phenom.ffwll.local> <87k0grjhed.fsf@intel.com>
From: Rodrigo Siqueira Jordao <rjordrigo@amd.com>
Message-ID: <254992f1-9f40-b756-b324-8f45726ef823@amd.com>
Date: Tue, 30 Nov 2021 10:46:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <87k0grjhed.fsf@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:208:c0::22) To MN2PR12MB2896.namprd12.prod.outlook.com
 (2603:10b6:208:ab::22)
MIME-Version: 1.0
Received: from [IPv6:2607:fea8:56e0:6d60:d1f5:d5c:27fc:61c]
 (2607:fea8:56e0:6d60:d1f5:d5c:27fc:61c) by
 MN2PR05CA0009.namprd05.prod.outlook.com (2603:10b6:208:c0::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.11 via Frontend Transport; Tue, 30 Nov 2021 15:46:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54874929-c34e-459b-140d-08d9b4188b7f
X-MS-TrafficTypeDiagnostic: MN2PR12MB3280:
X-Microsoft-Antispam-PRVS: <MN2PR12MB328061E8C9857A09F5CCD22F98679@MN2PR12MB3280.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sPYnQOuoHPBiy75L49avh2RzJd3u17d/P0k1Aq/O7UEwqd2rG+UVS8hQFaYJtYNn8pq/jyCsMqRjNes8jJL6d2kKJfsfkEpr5RXrtzl1FrCEYvbm6ScGEDATM+JB5M7XkWUYgrDfytnbBP7qy4lTaf6B+oAGpxs540IOpD7Sd0ymZ6DhOCu42ablTvLU1fYYDlXiMvq4gJmVqSjafucvwRQdgumkjaYMTtsc5dH8lqiZxyZF/hbXBQs6pBjs5PLqEMUCIXu+ZTCTnGVxmzwIQboNg7vCOyNjsZ12CE259l/5D1Bh21KzjmO6iXlXMpikCztzPNildM2mbGxim+w7gqNFCA1i0/TZmuie0X0g5vCKuWFq9iABDm6rB+8m7iZYycGEwuP5+7CJJgk3+VNsIIppJCxMOelAOLdmXczII/WFWx36wXJ//S4jykcC8BFwyLVXt6eH1uWIglCZ99FYT1nLOW3DMljrD5TMrCGN3jO4EGUgweMjoJ3G4iw32AjeTE952X3wp9aqbcD+oJT0LICcdP5ovk2UmV/GPHQr1CBWbYRRJH1a8RhIH7DskgZ6DxbwWbywGbbfzxUipGyjZXTQtuihOYYvYFZoJcBajNGZXxvsOQwBiJRcKZSE3dwtrCKiYYimLnBgiYT3W6JtDZYaLZvUAy0H5I36zwvOuwT2j9c6FXW9i9Qb1QOxVUgDMWoZMFowIUKU8M4w4sMnJc0e/igNar3k+6J12RA+f2xxEtO6k7h193rZZyG6h/yG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2896.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(186003)(83380400001)(31696002)(8936002)(66556008)(53546011)(38100700002)(5660300002)(66476007)(66946007)(2616005)(316002)(4001150100001)(2906002)(36756003)(31686004)(4326008)(508600001)(6636002)(54906003)(110136005)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDdtU01aWS9tWnJJQWFHVHloeThKemJHNklGcU83YStZTCtjV1ViU0x6UjFa?=
 =?utf-8?B?aTg3a09YR3dNeW9EUWRzVy95SmdSWncvV3Z6cUp5VVo5aUNSa2VRSDFhcWM4?=
 =?utf-8?B?TGZmTVNRSlhjdWJTSHhkc1RkbDEvbFR3cXJJT1lUaHVmaGZ5Mk1PTHVSdHM5?=
 =?utf-8?B?VEw0ZUk4Ly9uSWJvMUNvdXdrMSs5dXZyZnQweGJHdUNobmJxSzg5S0lWY2ow?=
 =?utf-8?B?SFlxUXEzK3dvaGw0VVVjSVZrVkhVdWIrNkI1emgvMnVOV1RPeWRmVGRoTkJm?=
 =?utf-8?B?ZllaN0NVMXFoT2R0dklIMHd1N0NaQTFuTEdXeXFoaDM2ek9WdCtJYlE1NHAy?=
 =?utf-8?B?MjN3NVlZQ2YzSWRCK0hPbVlQbHVBYjdYWTNBaUNhMTViYUloS2haTUROWjdU?=
 =?utf-8?B?dWlqRG5xR3JGMVRCdERWL3RWUnhMODBMT0l0OFIyUVJuaWkvT0ZzekhBdXlv?=
 =?utf-8?B?RkR5eldtTVp4ckZJSnMxbXVnOHJFc3A3WmZlTGlBR3BaK2pyK01TUUl0dUhR?=
 =?utf-8?B?RlJXKy91WjR3UEUzSjEzcDRFcXl1emJkc1drZE5vc2NIMmk5cUhlYnNBU0pC?=
 =?utf-8?B?TTRDZUlPcWxZR0hRaDYzQ3hKY1ZwWE5QUTExM2Jtc3lubTBlSVBSZDdpMURj?=
 =?utf-8?B?ZitWVWwrREZyK0w4cDdvbzNFd2hYMnlCcjF2WW9UbGNubUk4ZWlHRDY4QWpz?=
 =?utf-8?B?d2hqam5KS08wSHFaQlFjOHU5R0ZzM2JDM1R3aWNXbFBVRTJIY05hV3NrQ3pk?=
 =?utf-8?B?UnloQ3pTMlZhQkMxUkIwR1dxYmxYTGVTNHUySXgyVHUybmFaV3pnOHNidlFs?=
 =?utf-8?B?blFJN2VBeGZsenZYajdsajU5YWp4YkZwRjdrYlY4T1grRWprckQyVDhiWndw?=
 =?utf-8?B?MVpIM01OWFRpdWUrMTNCLzAxeTYybWdVNTUvNnVOZHl1ZTYrL3EwVnFLTGpK?=
 =?utf-8?B?VWRmTXhTdy9IY3NyK2h3N0JHemVXM0x5NlI3TXRUTlhxUU5vQzQ1Y21mUklZ?=
 =?utf-8?B?dVM0R2d6ZU5Mc3pON0xneDJmc2Q1UTZ3N0NPRG1PU2VjT0d4dEFwNS9LUTVz?=
 =?utf-8?B?MURyN1VlSUlQOWtUNG15bjNpWjRwS1pPN2lmVTg2SFRHQzFnSFZ3U2hGMnQw?=
 =?utf-8?B?VDR4WUg4VUF5Q0g5b0xBckJBaUFmcnRjc2lFcmgvU3NPdTlyM3ZTUEM4QXhj?=
 =?utf-8?B?cFp0MXlzNWtVcWkvOHlRWWxvam94ZjNoamMvalRySWxUWlB0S3B4UzVrMlkr?=
 =?utf-8?B?S2hCT09mcm9Bck5PbUl2OGwzcjZCcU1yVXdBSDFyTkIzLy8xSjJVaWpXN25y?=
 =?utf-8?B?NExteXZwZm0yL014SjlVbXIvVnR3RHdxVmNrL21EcDNZRjBKc1N6QjYzeHFO?=
 =?utf-8?B?aVlkVHRvS0JYdDNFdjVBNnVWeVAzNi9WWVJadEtxZWsyTGZCR09UdnNVMVpU?=
 =?utf-8?B?ZjdlaDRLRTdicVFMWjVKZVBEekhTSzJHZzh2cklFOTZPSDcydGh4TllYVTJP?=
 =?utf-8?B?M0NibktXSmtZVzRWNjZ1OGZaUDZuWWg4UnYwUVlrVEtTTEw4WDRVeFVDb1No?=
 =?utf-8?B?UDdNbm11ekQ5VysyMjBpdXphNXhjN3YwVCtWUU9RQkg3L3I1UU5hTkpZbi9a?=
 =?utf-8?B?RUt6eXdFVzJzUlRjZndyT29kcDR3Zk1taTFOU3NlN21aMFVBTWVHOGpxa1dG?=
 =?utf-8?B?KzFLbVhNbi85cTkwUmVKelQraFA1dGk0ZzZRRVc1aXNPWkY0c3pWVkwxSjU2?=
 =?utf-8?B?bHU1VDIxRnlYaFBZK0ZSd0JxN2Jka21IcU4rZk9yVDFKQWFQcG5oS2l0U2sx?=
 =?utf-8?B?aUtZUFUwQ1FORk92a2RGaDFUV01hR1A3MVZ2aUM4eXV0RWNZV0NBUTJZbVV4?=
 =?utf-8?B?K2hhUEtVQ2hta1F4NkVTcGhSR2VwZk5kenRtNEw0NTBreVZYRElMQmVwTGE1?=
 =?utf-8?B?c2hSQ0lMcVdQalRwY05mUWtLNUpvbVV4ZkZ5d3E3TGxIVzZ1RlRYVGo5YlAr?=
 =?utf-8?B?RFQyMHp2QlVsTERIb2Q1aGd6WEMzdU44NzJGMkJXMUJrMWw0K1k0Zk4vRDFX?=
 =?utf-8?B?ZjZOd09QWjA0bklTRU83QTdBand4WUI2dzlXRXlSa2dTQVdrSnVQa0M1SDAy?=
 =?utf-8?B?VHZHN2FSTFAvWmNmZ21ib0ZSWmZ4S1kzbzZyWHJjczl6bHR2MEgvUU5ENzNZ?=
 =?utf-8?B?R25acmFXM2RwQ0ZaTElKVzVGaDdiL1kycHo5VUlEMGEzUVZOdlE5TmNtZ05Q?=
 =?utf-8?Q?IRf+nY5vulxSs9tL2OQ52rdFkg6cgemVj+wLTcikjg=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54874929-c34e-459b-140d-08d9b4188b7f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2896.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2021 15:46:16.4000 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XbAEgDXJpGvgsmVcU3MP2lzKeFkFKV1EFyLvEi5i3jaShwBrTcRgX8G36Wfc+YXD7LxLCTr7lh+lCxN44MJmhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3280
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
Cc: linux-doc@vger.kernel.org, Mark Yacoub <markyacoub@chromium.org>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>, roman.li@amd.com,
 amd-gfx@lists.freedesktop.org, Roman Gilg <subdiff@gmail.com>,
 aurabindo.pillai@amd.com, nicholas.choi@amd.com,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Sean Paul <seanpaul@chromium.org>, qingqing.zhuo@amd.com,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, bhawanpreet.lakha@amd.com,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2021-11-29 7:06 a.m., Jani Nikula wrote:
> On Fri, 26 Nov 2021, Daniel Vetter <daniel@ffwll.ch> wrote:
>> On Thu, Nov 25, 2021 at 10:38:25AM -0500, Rodrigo Siqueira wrote:
>>> Display core documentation is not well organized, and it is hard to find
>>> information due to the lack of sections. This commit reorganizes the
>>> documentation layout, and it is preparation work for future changes.
>>>
>>> Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>>> ---
>>>   Documentation/gpu/amdgpu-dc.rst               | 74 -------------------
>>>   .../gpu/amdgpu-dc/amdgpu-dc-debug.rst         |  4 +
>>>   Documentation/gpu/amdgpu-dc/amdgpu-dc.rst     | 29 ++++++++
>>>   Documentation/gpu/amdgpu-dc/amdgpu-dm.rst     | 42 +++++++++++
>>>   Documentation/gpu/drivers.rst                 |  2 +-
>>>   5 files changed, 76 insertions(+), 75 deletions(-)
>>>   delete mode 100644 Documentation/gpu/amdgpu-dc.rst
>>>   create mode 100644 Documentation/gpu/amdgpu-dc/amdgpu-dc-debug.rst
>>>   create mode 100644 Documentation/gpu/amdgpu-dc/amdgpu-dc.rst
>>>   create mode 100644 Documentation/gpu/amdgpu-dc/amdgpu-dm.rst
>>>
>>> diff --git a/Documentation/gpu/amdgpu-dc.rst b/Documentation/gpu/amdgpu-dc.rst
>>> deleted file mode 100644
>>> index f7ff7e1309de..000000000000
>>> --- a/Documentation/gpu/amdgpu-dc.rst
>>> +++ /dev/null
>>> @@ -1,74 +0,0 @@
>>> -===================================
>>> -drm/amd/display - Display Core (DC)
>>> -===================================
>>> -
>>> -*placeholder - general description of supported platforms, what dc is, etc.*
>>> -
>>> -Because it is partially shared with other operating systems, the Display Core
>>> -Driver is divided in two pieces.
>>> -
>>> -1. **Display Core (DC)** contains the OS-agnostic components. Things like
>>> -   hardware programming and resource management are handled here.
>>> -2. **Display Manager (DM)** contains the OS-dependent components. Hooks to the
>>> -   amdgpu base driver and DRM are implemented here.
>>> -
>>> -It doesn't help that the entire package is frequently referred to as DC. But
>>> -with the context in mind, it should be clear.
>>> -
>>> -When CONFIG_DRM_AMD_DC is enabled, DC will be initialized by default for
>>> -supported ASICs. To force disable, set `amdgpu.dc=0` on kernel command line.
>>> -Likewise, to force enable on unsupported ASICs, set `amdgpu.dc=1`.
>>> -
>>> -To determine if DC is loaded, search dmesg for the following entry:
>>> -
>>> -``Display Core initialized with <version number here>``
>>> -
>>> -AMDgpu Display Manager
>>> -======================
>>> -
>>> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> -   :doc: overview
>>> -
>>> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>>> -   :internal:
>>> -
>>> -Lifecycle
>>> ----------
>>> -
>>> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> -   :doc: DM Lifecycle
>>> -
>>> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> -   :functions: dm_hw_init dm_hw_fini
>>> -
>>> -Interrupts
>>> -----------
>>> -
>>> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
>>> -   :doc: overview
>>> -
>>> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
>>> -   :internal:
>>> -
>>> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> -   :functions: register_hpd_handlers dm_crtc_high_irq dm_pflip_high_irq
>>> -
>>> -Atomic Implementation
>>> ----------------------
>>> -
>>> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> -   :doc: atomic
>>> -
>>> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> -   :functions: amdgpu_dm_atomic_check amdgpu_dm_atomic_commit_tail
>>> -
>>> -Display Core
>>> -============
>>> -
>>> -**WIP**
>>> -
>>> -FreeSync Video
>>> ---------------
>>> -
>>> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> -   :doc: FreeSync Video
>>> diff --git a/Documentation/gpu/amdgpu-dc/amdgpu-dc-debug.rst b/Documentation/gpu/amdgpu-dc/amdgpu-dc-debug.rst
>>> new file mode 100644
>>> index 000000000000..bbb8c3fc8eee
>>> --- /dev/null
>>> +++ b/Documentation/gpu/amdgpu-dc/amdgpu-dc-debug.rst
>>> @@ -0,0 +1,4 @@
>>> +Display Core Debug tools
>>> +========================
>>> +
>>> +TODO
>>> diff --git a/Documentation/gpu/amdgpu-dc/amdgpu-dc.rst b/Documentation/gpu/amdgpu-dc/amdgpu-dc.rst
>>> new file mode 100644
>>> index 000000000000..3685b3b1ad64
>>> --- /dev/null
>>> +++ b/Documentation/gpu/amdgpu-dc/amdgpu-dc.rst
>>
>> While we bikeshed names, I think it'd would make sense to call this
>> overview.rst or intro.rst or similar, since it's meant to contain the
>> overall toctree for everything amdgpu related (maybe there will be more in
>> the future).
> 
> index.rst?
> 
> 

Hi,

Thanks a lot for the suggestions; I will prepare a V2 that addresses all 
your comments.

Ps.: If there is no objection, I'll rename amdgpu-dc to index as Jani 
suggested.

Thanks.

