Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24EA76DF081
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 11:35:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 497FF10E75A;
	Wed, 12 Apr 2023 09:34:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2056.outbound.protection.outlook.com [40.107.92.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA2EE10E760;
 Wed, 12 Apr 2023 09:34:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DDBQg5Ltmk6IyyMaCnyr9eFscdTLIC1eaGOb2sdRaUiPzafM+COLvHQ1vFnBEBgq2hOXP4A1+qs4XQZt/GR0dVN8lEiIvHbqjePd8bPG4kFisTPRTjMHVgqJwksSG7xn3mfey2D03cxxp6bhJUFMCJ4E5pePLED2At0wXn71LknEu95BjqU7fuR+lKkwahNlOPGoB2Q0efnnrBsoH9IEYM1Pa8mNtyhI9TtvodkEFp4jHZ+lEhn5wExfLJrevS05t7Jw7kF+NfJMnQlxkqsJt0+i2sek/9Tz/13dzTVFnoas9En6FWgbym2PAcJeBN3P1WOi/bZZKt9lldxC/kSHPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iE0klUOBZbYPO/mdIXqnbAJFbU2i0fBqb0LNCGnZzRA=;
 b=fbO6BV2nz0EMrvtM6QW5EIoHovbn6O4Z5tGF/tCDOQz/iCV5V8t9qzSLaU3SqyrzVxmFHEPDNhghXLhxbLUfTIWtTk/hRXladeLgKr0I3AF3tl/3WhoamMcCIPHYl03236PuTgs9ITNmCEbnlfY1yRRmwmP7CyQWZn/dUB1A6fXw/d+JlPF3gUenUV7D4me6pClu9unfE9ckB9jmOM2dpfcj3Nj0Q94vvKWZcT6TtAUY9+k/RHy2M9ltvUTFja6uRVQHBWfb9h09EEi7Qskdr41aS/eKI0dGHi5XnfwI8Vjayvxt2uadk8Fg0E4kY8YrYHsgdEaNbLtvBAx+u7lvxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iE0klUOBZbYPO/mdIXqnbAJFbU2i0fBqb0LNCGnZzRA=;
 b=uqq/8Sa9HuZQ2U2TyAULFIEwvPnLVqe9NAVtkOAt/+FiYu55ji9nOJPPMmtaEY+YninwlOOQreSpy9lkErXUsWyu1B4VIew6gFXwGKA0bbWkCtkNDRWeNW69QTpFlWAPf6g2F9TZhCBhudvrhCrYzZ+NdTRvMP7Zg4yAlUvgKpE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ0PR12MB5609.namprd12.prod.outlook.com (2603:10b6:a03:42c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Wed, 12 Apr
 2023 09:34:51 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae%5]) with mapi id 15.20.6277.036; Wed, 12 Apr 2023
 09:34:51 +0000
Message-ID: <bbbbbf34-2ea5-5344-30db-f976c5198d75@amd.com>
Date: Wed, 12 Apr 2023 11:34:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 0/7] drm: fdinfo memory stats
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230411225725.2032862-1-robdclark@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230411225725.2032862-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0073.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::17) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ0PR12MB5609:EE_
X-MS-Office365-Filtering-Correlation-Id: 64bed3b7-92ef-4d48-1ef6-08db3b392a28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QXxfMHGKAAQwLH1MBNyZrm5IQSC7OOdp5P5R/JxbnOPR3pwAcMtHDUACjgDRwxJixZssIE8ThKNqHMFqTEfETjaD3FkD5NANzGwVj8vgLYC0th62YG+uBpedIPfoCP+BPSHs5A+VFy4bJ3RuLJZBKfh+qz5oqccrsdzBZ81JKvpcwSzAzEcwmRUlb3vJvMacPxUhyEWY5goWR0taMo/r0um0x7RWRXzNMLS7bpXOYavPTn9Z8W307K9zLDhR5wHB5ND9Umamx4RoWs+Uz5Kk4AcbymS2GPD5fDRrF6Yx2tebQ429T7WElvjQ4BPDsZONntzJhWORF+ZUoDLrmeRgoBXIfWiLHRozJlWTE2RSTSizMHExjLqJ/Th+UHkIOjOLHaJNmYo6vfVgmQFfKkfpXqq5vpXF9aEAearrjpB4TvcD/b4QaQLZEVyIAKOtuGh5SLwm2jPCwp8tYZeVvYPofkmv5C2q7CV28Zz44GipdbteLuxI+BXDiNpWUbIpQLXIv9jh2SN68Xw+VRBeUdCLEuDtSZeUic1uvnohtlFgLgbW/LON6nh5o0OwP8hB31a4M546e8S1wI85EgxIOZb/XcZmCtb7/0MyTqBZ2GUYlbiZyFwuCv86i91XgiCS/HGLKSaNiLKwXcL7dB21dTaGlw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(376002)(346002)(366004)(136003)(39860400002)(451199021)(478600001)(6512007)(54906003)(5660300002)(6506007)(186003)(66556008)(6486002)(966005)(316002)(2906002)(66946007)(4326008)(41300700001)(7416002)(6666004)(8936002)(8676002)(66476007)(38100700002)(31696002)(83380400001)(36756003)(2616005)(86362001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3NmcTFhc3lzVEJ4RlZ0TUtYSFRBM1pJWjkxbDhjSjRLS0tUeTBvNjhTaUxY?=
 =?utf-8?B?NFEwRkVMZWh3MUxpZSs3TXpWMzkwNEQ3Z1NiUkRQL1A5T0tFUGxoTnNBc09y?=
 =?utf-8?B?ci9Iam1jSTJNaVp1U2VlekROWmpVaGhPNXNUY2ExTjVuRUQrcWRsbVVWcmxz?=
 =?utf-8?B?OXVWcTVZeVFuYXo1OVFjR1hFMGxkMFVTWGpIZVpoVW4yNWdmSTQxd01RcXhu?=
 =?utf-8?B?UU9pR1BqQXRteGhVOHEyUzRiblNNSDY2YSt4OUlaZC9UUlhPLzZ0V2xoZURv?=
 =?utf-8?B?YlJYOHIxem9WUFlNbVlXUXYva25mL1ZHUlVkaTd4U3V6MlhOd1VWVEhFb1Jx?=
 =?utf-8?B?TXh6RDlXRnl4eXRsTWo5UEl0MnV1bmFMNWIveGhEN3dxamQvam12ZEJ5VEJ3?=
 =?utf-8?B?SHNnSWNuc1NyS3hJNjNxSmR6R25BbjhxOFVkUHJieDFkeURLcmZ3Q2tJZ01C?=
 =?utf-8?B?UnA3KzAzTitGZGRDQmR4VFZqenU4V2dvMmRKRDNwY3RoTUwrUWVGRjF0Qm5U?=
 =?utf-8?B?Rk1IS2ExYzB3dkJzaUErTnlZdW5DaGY5Mm1LM0RLbjcvV1UwODhjdThmdzZu?=
 =?utf-8?B?bE81aVJGZUlmK2JxQzFETzBnaUxNTTRYOUVGZGRld1J6NlhhSW41Vmh4Skxk?=
 =?utf-8?B?ZmthWFlUMExzSVdZTDdsYk9JK2MyTWZUU0RKYmh0K0p1U1JTTURvVmdZaXVZ?=
 =?utf-8?B?cTVTNVFyVVpHaVh3NmtiYjkySUlSUFVFT1VWQXEzQ0RLZkUxbnpnU0lCaGEz?=
 =?utf-8?B?andrbWJSTk5BK1I0aGNrUEN3bTdtQXFLYmwxU3VtRnhBaTRKcm82RXFBd1h0?=
 =?utf-8?B?ZVZaR1N2bTdsU3ZwekhmMTgvdWNpZ21BcGQrc1B2NHdselpYbXNPZG5ibGda?=
 =?utf-8?B?a3VYRit3eURaNXRKcS9POUJmR3BOUk52anRlTGkzREVuNFlLdnVGYnJHYWNw?=
 =?utf-8?B?ajhkZ1BrOVdMT0lqZ0dmNTk5eDhoeUZrenUwTXhQaVpqc3gwRmw4RU1DQVk2?=
 =?utf-8?B?TU5JeFQzMjN4bktpSFdrQUJwUmdpVmlGcFJ2czQvZGxoUFJmNFUxN0RVUXRa?=
 =?utf-8?B?NHo3dGN1L3dYOVlZRHFGdVZZTUlwbWpJdTRSNWVneTd5OVhDc0JaWi9MT1pH?=
 =?utf-8?B?REpXdE5QUklpWWE0bTZiTWNHQ0tvUTJTZXNmUWR2dG8yMXQvelNXQXNWOENo?=
 =?utf-8?B?aWJSYUlDNW5RajBpTm9JejVNRVFLOGo5SnFVMzJKNUZObW8yeHlBZExjZG53?=
 =?utf-8?B?SWJXTHlTdTZYZHFnL1dFeEdNSGRnWGNGTU05QXFtSWxYZkNXTnl4UmpJbFVE?=
 =?utf-8?B?aG1ISUhneTlLYy9DSnZjTW9rOExKOHozNjg0M3BrdHI4MTF5Skw4T09NbGtn?=
 =?utf-8?B?d2VXZXUwWUZDWVk4WlMyTnVaQnE5NEVDOFoyR0lrMm01RmxiUFdPTWxwbkhJ?=
 =?utf-8?B?ZDFiOXEzNjFwOUxNa2dkTm5JTWYvajltNGZta1lybi93ZDFkU2N1NzJTclRp?=
 =?utf-8?B?ZTlsaDFxK3R3emNKNlU0d3E3RlNVS0NZZEgzb0EzODFUU1c5emtYMXJuemlN?=
 =?utf-8?B?eUZxWFYyZHMycEorY2lHdGVROWdYVVdwdU5XL1RQcm5sVk54aU1BYXZLZ0F5?=
 =?utf-8?B?OE0wcFM4NnFhTUpvMXd3bnFUNHh2RzEvbW9LRDVvdjAxRkQvVnJJeHJ3aDk3?=
 =?utf-8?B?VkJHQllrQnpCTGJsekZ0amwxZ2w0MHBLcXlxMnhsOEVNNjFPS2tDNWtwTjdv?=
 =?utf-8?B?OTVkYUd0blRFWUE5UW12aW8waHZ4Ly9NTW9Ta3B4UWQ3VUI2eHAyTUY4clVa?=
 =?utf-8?B?NjdVRnJ5a0pQN2xzWnVINXRFcVRiNENzZGlJMXJ3VE0vV1hxK0I2THJSNytR?=
 =?utf-8?B?NE02amJQWE1TZ3Q3MXZZTUd2bENoY0xOTmtxdUF6bElLUFhBMENJekY1N252?=
 =?utf-8?B?NktaRHh5U2lxVHp2OXlZZnRLQnY4KytFNVhVdG0vYjVZRG9UWlNFZ09VVnJW?=
 =?utf-8?B?N2lHNG9nVkVLaVZTRTd0RUhwQ01Ub2R2Tk5tTVU1UG8zYUJDT3UzSURld2Fr?=
 =?utf-8?B?NktnZzZXbmp5OCtMQTEwajlGTml2aStvNDhtMEJJTE9PbjRBNXRWN1QzR2xm?=
 =?utf-8?B?RExCOTRydWVlOE5tMERHRzlFK0cwVm1MbXNuVzBrV0JSU0V6c1B1TGM4Tjkr?=
 =?utf-8?Q?7tY0fjpLH1fgYWww6YFJRkYQMJsLHfi6diY9bGxZpumA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64bed3b7-92ef-4d48-1ef6-08db3b392a28
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2023 09:34:51.3276 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n9spp2wRJW+iqGyVo5++TTHxI4WShdBi+Gw/mOXSbG7ZmeoLJXAn9XEUcpLku0Au
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5609
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
Cc: "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <mdaenzer@redhat.com>,
 YiPeng Chai <YiPeng.Chai@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Rob Clark <robdclark@chromium.org>, Guchun Chen <guchun.chen@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 "moderated list:DRM DRIVERS FOR VIVANTE GPU IP"
 <etnaviv@lists.freedesktop.org>, Evan Quan <evan.quan@amd.com>,
 Sean Paul <sean@poorly.run>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Christopher Healy <healych@amazon.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 12.04.23 um 00:56 schrieb Rob Clark:
> From: Rob Clark <robdclark@chromium.org>
>
> Similar motivation to other similar recent attempt[1].  But with an
> attempt to have some shared code for this.  As well as documentation.
>
> It is probably a bit UMA-centric, I guess devices with VRAM might want
> some placement stats as well.  But this seems like a reasonable start.
>
> Basic gputop support: https://patchwork.freedesktop.org/series/116236/
> And already nvtop support: https://github.com/Syllo/nvtop/pull/204
>
> [1] https://patchwork.freedesktop.org/series/112397/

I think the extra client id looks a bit superfluous since the ino of the 
file should already be unique and IIRC we have been already using that one.

Apart from that looks good to me,
Christian.

PS: For some reason only the two patches I was CCed on ended up in my 
inbox, dri-devel swallowed all the rest and hasn't spit it out yet. Had 
to dig up the rest from patchwork.


>
> Rob Clark (7):
>    drm: Add common fdinfo helper
>    drm/msm: Switch to fdinfo helper
>    drm/amdgpu: Switch to fdinfo helper
>    drm/i915: Switch to fdinfo helper
>    drm/etnaviv: Switch to fdinfo helper
>    drm: Add fdinfo memory stats
>    drm/msm: Add memory stats to fdinfo
>
>   Documentation/gpu/drm-usage-stats.rst      |  21 ++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |   3 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c |  16 ++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.h |   2 +-
>   drivers/gpu/drm/drm_file.c                 | 115 +++++++++++++++++++++
>   drivers/gpu/drm/etnaviv/etnaviv_drv.c      |  10 +-
>   drivers/gpu/drm/i915/i915_driver.c         |   3 +-
>   drivers/gpu/drm/i915/i915_drm_client.c     |  18 +---
>   drivers/gpu/drm/i915/i915_drm_client.h     |   2 +-
>   drivers/gpu/drm/msm/msm_drv.c              |  11 +-
>   drivers/gpu/drm/msm/msm_gem.c              |  15 +++
>   drivers/gpu/drm/msm/msm_gpu.c              |   2 -
>   include/drm/drm_drv.h                      |   7 ++
>   include/drm/drm_file.h                     |   5 +
>   include/drm/drm_gem.h                      |  19 ++++
>   15 files changed, 208 insertions(+), 41 deletions(-)
>

