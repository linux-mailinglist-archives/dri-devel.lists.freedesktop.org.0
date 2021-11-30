Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CC6463A8D
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 16:48:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B3AC6E284;
	Tue, 30 Nov 2021 15:48:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2066.outbound.protection.outlook.com [40.107.96.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 956206E284;
 Tue, 30 Nov 2021 15:48:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MH6QvPjifk7Juo1I/vyVxls3HyC6LJIwXAbCkQw1sSFw/v15KhIN0qobWc/PzBJCfJKyJvrH8wlwkgDklJKLIeBole5OzGoUQVri0J+cqyYC0UHqxiDVVV0vZqPeZzDjGVuQ+8rtAtR9Ul3wWD2NCiFGNuXWgYWs+NYcbK2B3C0rvoSxnoA3ChfiG1m/BhZYz6nGlHUSQewAHYT9Hy+QljexbwjqsiDv3U/q2o+pSxukV8i3fWuHM6d6t8IAtfPPG4CC3+W0VBV/ES0vZVEoaxezFJ28xFunCsQiozzwzM7w+PmmsedLl4+Nm7Es4Rz1mslboWjghMDh0/GNPj7c/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lun5cXXZPvSUwk+gzAk33EtdmaQR6cz/sxox4BdMbIw=;
 b=lWU5WcyCMYEbe3g6PuPzTK59fbHQFbQXJKbU1TiuNcui5ef3W9lGezjrYqET8ThNNkTPLuG7UxH5EGkcVPcpFt3zXdQW++mlg8LVzbp1Wm2KgOvclpxjbzItj4s4LsN7IewGfRCNOOyHoy/KMMV0FkeYUoBdGQ+c6A+3qpsRWUvzgmfF3JGMEx+jov3IK2Gz74IPv/RDEcK3PNVpKJruKiMsqlen9U+iKacDyFw69hChRg36Zx5PaTU0yHJmg0/DMcT3Z7Icq/Nb1liNLdhQ2sIunOrE0RFZrHRvr7v0/t5A/BL1ncU3d/dHAibaocn9NQCWPdn5o/axFEbhiYf/Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lun5cXXZPvSUwk+gzAk33EtdmaQR6cz/sxox4BdMbIw=;
 b=Zze/Nq0aprnUqhT3MT87GYa0ctN9318A29cZU9PsF/zXKx3xmwzPwiLO3eThiE8jFCs1hZeYxglwpJ3d96VcjN8VUEJt+LaL00FFTAmMS/WXBLIi0juTyNuqmZEWj2DgnrONoIUCxj5+A4kX0nneaQD/y+5rMvw0YYNWww9kFwM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5473.namprd12.prod.outlook.com (2603:10b6:303:13e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Tue, 30 Nov
 2021 15:48:47 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::e492:c86b:9906:1b46]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::e492:c86b:9906:1b46%7]) with mapi id 15.20.4734.023; Tue, 30 Nov 2021
 15:48:46 +0000
Message-ID: <507bfbc5-4be4-9681-c768-efea7c0541d8@amd.com>
Date: Tue, 30 Nov 2021 10:48:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 1/6] Documentation/gpu: Reorganize DC documentation
Content-Language: en-US
To: Rodrigo Siqueira Jordao <rjordrigo@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20211125153830.1352994-1-Rodrigo.Siqueira@amd.com>
 <20211125153830.1352994-2-Rodrigo.Siqueira@amd.com>
 <YaEAVV3Ka2lG/iOh@phenom.ffwll.local> <87k0grjhed.fsf@intel.com>
 <254992f1-9f40-b756-b324-8f45726ef823@amd.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <254992f1-9f40-b756-b324-8f45726ef823@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0150.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:e::23) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
Received: from [192.168.50.4] (198.200.67.104) by
 YQBPR0101CA0150.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23 via Frontend
 Transport; Tue, 30 Nov 2021 15:48:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f10e35e-872d-467d-191a-08d9b418e516
X-MS-TrafficTypeDiagnostic: CO6PR12MB5473:
X-Microsoft-Antispam-PRVS: <CO6PR12MB5473C76D539527BCB49E93CE8C679@CO6PR12MB5473.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t+T2a5MNMTaZZNnuWosGA+Okknd8CA59o64DhBXr9pAF8JHfrURXZ2OckluD+90gjFtak5V+vdU6I3Ak/CvslbwxCZ1HrBSD4I3rF9yQZ5vtgnL9GUZTDB80S917PGt114xObhqFn1wdZyCzObi7JJsBcjY2TIvH2VjYGbA57Bj5qfjsoo9dUjZfs00aAcZTvoJCXFLSaRt3R7afGOYBFVsVzDZ2g8ASKUA70XZb8ALjkE5BpQ7G3iBcEha0WBeDSwR4gYlslzUn1+nouRzL7QI0ycdrZVJQC4oI6DdtV/z6aL3yrQlysICncEJ5yOye8+8eD2ZSgYb2XjmlTcBVEBbUydxNvQc/zegSDd1CakZjzCQP8qpwaDzgM423upeMQ898ZjYMCs64ET7tXbqveuIZBEsuoYN7kDXQt/91eizx/yU2OAIb2VUiTNTB3X3FjiSuVpCv46rGQ9Rx0WBKFAStm+R9Qh8xdyZdazMrFz6UXPFakzcody9aM3TZygz373BtCAUYhE4mgqtQS6Q5Q5DkltWA1715V50cly06dI7BUUgwfujlqt2nE+xJuV9bTqT2ZMXpweWAJI/JRVo0PGKRGGxBZ4TpP4f2L30WJap8p1EF1iwGYGEp/DfMM0h9nYPy/s1IpM50072AwFtML15NpSldLr/0d0fUeqDB6KHMniJrmYE8yV4BBBKkWFKlWnoULqL3KZ19+FJY/DXI2a1WwUrsj78VI43wa1P9TPx87Tat6en7wNxMSKHRSMZs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(54906003)(53546011)(5660300002)(316002)(31696002)(2906002)(16576012)(110136005)(6486002)(31686004)(26005)(4326008)(508600001)(6666004)(956004)(83380400001)(8676002)(2616005)(44832011)(186003)(38100700002)(66556008)(36756003)(66476007)(66946007)(4001150100001)(8936002)(86362001)(6636002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekNXK0lROURQQXBUd0t4bkNjbUxCa1VWeE5wUXN0QTAyOW42SU95OFBPVlNz?=
 =?utf-8?B?TFM3LzBvbkJ2RVYxMHJudmk3cGp3Q0E0SUJPOEhtbStLWStTQXFidlB0bmFT?=
 =?utf-8?B?RlU5NHA0bmxpQnkyYVdtalplcnVwZjhPT0VQcTFST3lnWGRhL2xPc01LZnlM?=
 =?utf-8?B?dHZsSG91YXRtVU1FbmpjWkZXNStWeTA0b0JISVB1UnNTUE1RK3FlQURBZElD?=
 =?utf-8?B?NTFjVDlmdXFUMS84anVYMlVXU05SVDJQTHpZN1pHNVVOZ1NqbVZaYkR0VHky?=
 =?utf-8?B?NjVPQ1lFYUxqRjhwVG9ORHdtZnZHWUdMa2hFZllUREpSeE5WdlIvaUlyWmJI?=
 =?utf-8?B?RU91d3NqZWw4OHNacEMrUmVDRm1rSUhjTEN4aHI2L3ErQ25NSndxaTJVTmZV?=
 =?utf-8?B?WXpYRnNnTHBVdDZMUXd5R3Mwa21FWUR4RzJqVmU4TVRsMHAzVkdNOU8wdGhN?=
 =?utf-8?B?cjRna1U1RFhpUUtUbWpnR3JlSjhLUStOUDRPbWFzby9Db0plL040RzdLa0xO?=
 =?utf-8?B?VXZNb3hqVDNjKzNSQVl5RUZLSm1PY2ZjRWg0VjFmVVlrS1AxNko4L3NOamxm?=
 =?utf-8?B?UlVBT2daMmUzb1VoWXQwNmc2SHJxYlBJUGh4RjRPeisrMGlnbGpIYUQzazRN?=
 =?utf-8?B?eTNidW84cWxtMU90LzZZcFkxLzRTc0pvd2U2QVgvWTJtQlVkTHdjeDBITGVz?=
 =?utf-8?B?cHBBMERHTzlsWjkzckNhZFYwVUxPek9sM3dndHFzd1dkT2lKYnNFdXFjRUQ1?=
 =?utf-8?B?a0t2N01DcHQ0cGVCUTI1ZjZ5RUFFY0lIVm5TaHVVbEt3Zi9LSVd5NzJER05C?=
 =?utf-8?B?N0FHamYxRzh1T0E3aGdQY0NhY0s4SlRPVkFLRzc1bkFFV29WWWlRQzA0NTFC?=
 =?utf-8?B?SUhaMHkrSU1pRVE0dk9KREJnMGQ1YmVHRG5ydzF0N0k0UjBSNTJvUUhQUEFv?=
 =?utf-8?B?WGZrdWk3aXlSY1dYcVB5bFZsdEUyQnRaQnU3bUVWNi8waXk5cVhSVG1sRmU4?=
 =?utf-8?B?MFZqY1EwVFduZFJiZC8xZTNmTDkrZlAzWU90eGx1S1dWWmhHUCtrNjNvSmpC?=
 =?utf-8?B?SkJIQTQrdE4xY1l0RnRid0tJZ1Exckt6Uk1va3FEaTZxYlFCRU5kdnU4cURm?=
 =?utf-8?B?M1B4Q0l6S3dzQU1CaThJV0NjcmpKVGErRzVXWUZqYVhLNnpuK2NSMnFtUVhM?=
 =?utf-8?B?LzdQVFdUZ1F3UUdWeWZDYVA5V2ZMOEc0REVXa0JNanBUaTk2VmwwQTlpOSsy?=
 =?utf-8?B?a0hjam1iSndEZXFPSmNzSkNyeUNXbDExMGpDUk4yVXJSSGdOamVOc1ZKL216?=
 =?utf-8?B?QjFVUkJDbGFkVkpNUjRNNU4zSlU2RS9lekRBSHNkUEFnaUQ0QUJrc2pSNXoy?=
 =?utf-8?B?aHAwSHkzM0NCdU0waEFJSU1qdXduajJxM1J3ZzJLazRFWkYwK29JcXU2UkMy?=
 =?utf-8?B?VzhteElDWkhnSzB2L3ZhcVF2MWxVNDJscDVyRVp2ei9OWWR1OXdJUDlpYUNR?=
 =?utf-8?B?WGtzTHFmQTI2V0d0MVhnTVIxc0x3UzJCSE5GV3E3UG05bzI2N05LR285eFBK?=
 =?utf-8?B?K3hBbGlZdWhjWWl5ajM2bEc4ZFBJQ09Yd3R2YUtPUjhqUjB2YlpjSlhSeFhB?=
 =?utf-8?B?WWZreDJYbGcrSWNaNEhuQU1vbVhpcTVOVHlCeHJQazMzQy9MQmJxdzZGVHNS?=
 =?utf-8?B?ci9LR1NPTzlIeVY0b0Z5eXhyQlZFYmpJUWRsc0o3WEdPUWxON1liK1Q1T010?=
 =?utf-8?B?enBpOXdJaG9MdXR2S0o5OUh4R2dmMGpuSVRlcjJ5QW5VOUNQWkV3RHpKenNC?=
 =?utf-8?B?M2tsVmoxQk9tb1hoWXczZGtGRjN3WjVuclYvcS9IMFVUMHBoRERDZEpjYVd5?=
 =?utf-8?B?R1BLbTcveTFlSmN1M05tQnpENFBmQW1nT3QxQnFsK01reU1OZFhjU1ZZSjAz?=
 =?utf-8?B?L1RVWlFPWERoZ3IyZUsrY0hBbDUwWk5ORDdXY1dxT1hZREpyTTVqa0twREg4?=
 =?utf-8?B?SDRsbXl5azcydlNhd0tlMWFTTWJ4UmlLUVo5NmN5Q3VFbk1XU1VGbHhnZkRP?=
 =?utf-8?B?WlhFbFBITnJ5Z2R3cXc2R3NycWtrbzNyTjk2UHFxdWU4YnFjcklRMXNpa01K?=
 =?utf-8?B?OG5SdG42SFRWSFg5VFdyOU5aMVRXYXdsbEU4TXhrTkJMcERQamFqYU1kUWh0?=
 =?utf-8?Q?2ycTiqlMjgNaSUSRlIggYyQ=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f10e35e-872d-467d-191a-08d9b418e516
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2021 15:48:46.7770 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aoXGivvTCN2t5THYC6ineEBBkVFSNOgpieLWuvSGip5ZWXcXyYWLHIl6NA2j5k3zGUfuFyk6dFgkoCYgFJdOQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5473
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
 amd-gfx@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>, aurabindo.pillai@amd.com,
 nicholas.choi@amd.com, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Sean Paul <seanpaul@chromium.org>,
 qingqing.zhuo@amd.com, bhawanpreet.lakha@amd.com,
 Roman Gilg <subdiff@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-11-30 10:46, Rodrigo Siqueira Jordao wrote:
> 
> 
> On 2021-11-29 7:06 a.m., Jani Nikula wrote:
>> On Fri, 26 Nov 2021, Daniel Vetter <daniel@ffwll.ch> wrote:
>>> On Thu, Nov 25, 2021 at 10:38:25AM -0500, Rodrigo Siqueira wrote:
>>>> Display core documentation is not well organized, and it is hard to find
>>>> information due to the lack of sections. This commit reorganizes the
>>>> documentation layout, and it is preparation work for future changes.
>>>>
>>>> Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>>>> ---
>>>>   Documentation/gpu/amdgpu-dc.rst               | 74 -------------------
>>>>   .../gpu/amdgpu-dc/amdgpu-dc-debug.rst         |  4 +
>>>>   Documentation/gpu/amdgpu-dc/amdgpu-dc.rst     | 29 ++++++++
>>>>   Documentation/gpu/amdgpu-dc/amdgpu-dm.rst     | 42 +++++++++++
>>>>   Documentation/gpu/drivers.rst                 |  2 +-
>>>>   5 files changed, 76 insertions(+), 75 deletions(-)
>>>>   delete mode 100644 Documentation/gpu/amdgpu-dc.rst
>>>>   create mode 100644 Documentation/gpu/amdgpu-dc/amdgpu-dc-debug.rst
>>>>   create mode 100644 Documentation/gpu/amdgpu-dc/amdgpu-dc.rst
>>>>   create mode 100644 Documentation/gpu/amdgpu-dc/amdgpu-dm.rst
>>>>
>>>> diff --git a/Documentation/gpu/amdgpu-dc.rst b/Documentation/gpu/amdgpu-dc.rst
>>>> deleted file mode 100644
>>>> index f7ff7e1309de..000000000000
>>>> --- a/Documentation/gpu/amdgpu-dc.rst
>>>> +++ /dev/null
>>>> @@ -1,74 +0,0 @@
>>>> -===================================
>>>> -drm/amd/display - Display Core (DC)
>>>> -===================================
>>>> -
>>>> -*placeholder - general description of supported platforms, what dc is, etc.*
>>>> -
>>>> -Because it is partially shared with other operating systems, the Display Core
>>>> -Driver is divided in two pieces.
>>>> -
>>>> -1. **Display Core (DC)** contains the OS-agnostic components. Things like
>>>> -   hardware programming and resource management are handled here.
>>>> -2. **Display Manager (DM)** contains the OS-dependent components. Hooks to the
>>>> -   amdgpu base driver and DRM are implemented here.
>>>> -
>>>> -It doesn't help that the entire package is frequently referred to as DC. But
>>>> -with the context in mind, it should be clear.
>>>> -
>>>> -When CONFIG_DRM_AMD_DC is enabled, DC will be initialized by default for
>>>> -supported ASICs. To force disable, set `amdgpu.dc=0` on kernel command line.
>>>> -Likewise, to force enable on unsupported ASICs, set `amdgpu.dc=1`.
>>>> -
>>>> -To determine if DC is loaded, search dmesg for the following entry:
>>>> -
>>>> -``Display Core initialized with <version number here>``
>>>> -
>>>> -AMDgpu Display Manager
>>>> -======================
>>>> -
>>>> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>> -   :doc: overview
>>>> -
>>>> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>>>> -   :internal:
>>>> -
>>>> -Lifecycle
>>>> ----------
>>>> -
>>>> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>> -   :doc: DM Lifecycle
>>>> -
>>>> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>> -   :functions: dm_hw_init dm_hw_fini
>>>> -
>>>> -Interrupts
>>>> -----------
>>>> -
>>>> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
>>>> -   :doc: overview
>>>> -
>>>> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
>>>> -   :internal:
>>>> -
>>>> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>> -   :functions: register_hpd_handlers dm_crtc_high_irq dm_pflip_high_irq
>>>> -
>>>> -Atomic Implementation
>>>> ----------------------
>>>> -
>>>> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>> -   :doc: atomic
>>>> -
>>>> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>> -   :functions: amdgpu_dm_atomic_check amdgpu_dm_atomic_commit_tail
>>>> -
>>>> -Display Core
>>>> -============
>>>> -
>>>> -**WIP**
>>>> -
>>>> -FreeSync Video
>>>> ---------------
>>>> -
>>>> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>> -   :doc: FreeSync Video
>>>> diff --git a/Documentation/gpu/amdgpu-dc/amdgpu-dc-debug.rst b/Documentation/gpu/amdgpu-dc/amdgpu-dc-debug.rst
>>>> new file mode 100644
>>>> index 000000000000..bbb8c3fc8eee
>>>> --- /dev/null
>>>> +++ b/Documentation/gpu/amdgpu-dc/amdgpu-dc-debug.rst
>>>> @@ -0,0 +1,4 @@
>>>> +Display Core Debug tools
>>>> +========================
>>>> +
>>>> +TODO
>>>> diff --git a/Documentation/gpu/amdgpu-dc/amdgpu-dc.rst b/Documentation/gpu/amdgpu-dc/amdgpu-dc.rst
>>>> new file mode 100644
>>>> index 000000000000..3685b3b1ad64
>>>> --- /dev/null
>>>> +++ b/Documentation/gpu/amdgpu-dc/amdgpu-dc.rst
>>>
>>> While we bikeshed names, I think it'd would make sense to call this
>>> overview.rst or intro.rst or similar, since it's meant to contain the
>>> overall toctree for everything amdgpu related (maybe there will be more in
>>> the future).
>>
>> index.rst?
>>
>>
> 
> Hi,
> 
> Thanks a lot for the suggestions; I will prepare a V2 that addresses all your comments.
> 
> Ps.: If there is no objection, I'll rename amdgpu-dc to index as Jani suggested.
> 

SGTM, you mean amdgpu/index.rst, right?

Harry

> Thanks.
> 

