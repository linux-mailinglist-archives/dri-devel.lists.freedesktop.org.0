Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F06BA7F5185
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 21:23:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA9CD10E303;
	Wed, 22 Nov 2023 20:23:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::60e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A97E710E161;
 Wed, 22 Nov 2023 20:23:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z6doZHZ8ob3ZfgCyVEqyHUuM9bbUsVXf5ezWrEzjfxqFjAxQ9+updYA/9Fz7w/gftNSX/ARTieskU84uRC1al0sQWXFJh2Jivha2XLbcV1Z4GMPnIuJHLSRUYMWzhBw946Qs6jBaaVoDAsOLxcOh7K1+gNfLo0nBQ1nhgK/v5KTW90V9Ruf38C/OMlcrJfDdteHf53AUgFM6lXM9weorSD2f/+b0ehvzzREe+G90Bg4+MMZQA0mgD1wRpB6yGrEAINVgGNDhSw1pqDfPCjPgg2oPEUM7oQUToqyn2d7Pd5Gr3UAAV5PHEpyNyxKo6ZmH35E7IuuuuvSk8lxcoMWz9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=54ZKw50752GkVSBzzyp5bG+BSoVJEqpTjJNsVpM1JD8=;
 b=Or9JdXdv5abvZFPayC+opiznpb3/Zf9x6Rgb6802Q6hlrfsuQSOU/DF9XEy3KvNjGocUNgXcYuad+rE966qi3WVYW+GDJ49WtzUBY1PhXJ9Db9uHEhRR770ZmiZ+H38jvIVAF7ht57tBSqPYac4njCAD8fpjIi2G54W/izf+G0qfTpRwcOZEssspll9SBTuVwHBzP1K3bbfscHK8krwU1/+p3/fcFhqXdvSZF/fzyoE7oUxUxMBF8Skh0e1qcD1KsGbqfkxmLKYptdEnj7giQuS+jLJ6156pp/Tynqrads7YCTUrNY7JnSBAYqTdSn5I5dvYClPoqEGzWsuxPueyBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=54ZKw50752GkVSBzzyp5bG+BSoVJEqpTjJNsVpM1JD8=;
 b=2gRl15lb7ou8lhRYgq6WEkkUHjhGp/hEO/cp9xw56euaQuIMJabCuavzIhOeDM0yLBEHxjwBGApGy67j8Q0soygiHUPRYtwFHl4xx+6+zbn0MmvcJ57PcO6eR6Pzfx+mNlLcJLrZVAK1MLAV0ymWNzlYewMskOvYTjelfEgg3r8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 DM4PR12MB7694.namprd12.prod.outlook.com (2603:10b6:8:102::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7002.28; Wed, 22 Nov 2023 20:23:49 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5358:4ba6:417e:c368]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5358:4ba6:417e:c368%6]) with mapi id 15.20.7025.019; Wed, 22 Nov 2023
 20:23:49 +0000
Message-ID: <cc10f6b0-e26e-4021-85ca-33cb1e58e937@amd.com>
Date: Wed, 22 Nov 2023 15:23:46 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/4] drm: Add support for atomic async page-flip
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20231122161941.320564-1-andrealmeid@igalia.com>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20231122161941.320564-1-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0154.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8c::13) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|DM4PR12MB7694:EE_
X-MS-Office365-Filtering-Correlation-Id: 55b38246-191f-4aa6-6ac3-08dbeb98efc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GeW5K0I+OTXiWcDMM5HsK+F70Xp6VtUBHw00YkvDt0vcp/f+oTkJc2PpVXBwDfF/7xvzspSTweXyn0XX6VvZsl6xnt5dsoP4I4K5TPCIePpfJWLYpnqJdZ6G2Dcs9VTDhYEALTi9TLg29cqS3WfjGbCarJGwHkcdFZ2QTyG8Mvz3rXToexldU/YsyxMIOfZFB/2hOTmbTjzmteYZPSCN51TKuZMyYiWS0kHd76A1MEmUJyfv3aDTsK8QQNYKFun4gbLBtDntYs3PaDkS085hT1R9BfAS+1zjj3Wnkprzbk2KBEqIkeGlxxT5n9nmzWAjjrjnGzB6wFvaKpqMPLsvV7Ka2W0q++kxRGDhPjmsN9zUqGetLuKD61dN+7iLi5i3zT0WccMxGSp0exhYPc5SbEliM+mFZDgSUqesTwG5XXTLJfFiSWUq3oQbyV4ubWRiZI7WH5p9As2Tfgfhk+BvSsunnYZusfEEibUWAvAXBuSoQP7OAJu42JfDCIPA9ZQfgdMw3AcEIJtPlkRl45cESxl67G0S2rY7TOCt3A4s6LJ2NH2N72cmRr/Rtomw9OCa1CV2YbQGnChj/Y6Lx6TQrNvZr0FuBq5XoCXgX+HAixkPWjld56kwMHXUNhfy9HuBMZWnmiJ3xQrZoQtkAgeGFuI7yHL4voiX++5tS8WRdLo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(396003)(366004)(376002)(136003)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(66556008)(66476007)(316002)(54906003)(66946007)(6506007)(53546011)(6512007)(6666004)(36756003)(26005)(6486002)(966005)(31696002)(38100700002)(83380400001)(86362001)(478600001)(2616005)(7416002)(5660300002)(44832011)(31686004)(2906002)(41300700001)(8936002)(4326008)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHBZM1pJc2t1d0psQ1pzcng5Z1JkSDFDSXhnNktvY01kM29MWjNXMEFVZm9D?=
 =?utf-8?B?OEI2WXhNUDlGNzFZSlJ3YjBnRkRKYWtjSVdGbUlVaVNOSVZPY2NCVklMN3Nq?=
 =?utf-8?B?SVNnejdLdkhrRGdvTDlrZWZvS2xialI4K1ZZd0xWcEtMK2htUGRQSWJLQmZ2?=
 =?utf-8?B?ZWVVS3diMGdzMGFoZHhtWlhuYndkOWx1NUZDMTZ4VjdmSlRWajRFL0NJSXFT?=
 =?utf-8?B?aXVOUXZxaHdxZDdhc2k2RHFYaDdZSlZhTS9ZNnFiU0ZvTVF2R0dwS2EveFg2?=
 =?utf-8?B?QU9Cclp1WE9pT1NIcytsVHQ2WXhoOGpGWnA2SXZNUjZtQ1BOUFVNNHhHMXZI?=
 =?utf-8?B?YkxBZUlQc0t1aVQ2VXl5YW9WbVJGZFFieldIMm9vb1Q0V2ZDZnIvNlhPQW9l?=
 =?utf-8?B?V0VTTkk4YWI3ZkJvK2U2b21XelBmODBhQmZEaXZmclB0TTBkNlczcW16Mk9I?=
 =?utf-8?B?NEg5ODZsUkxjdDZ1VTNpK2hVc01sanNZN1V3ZEdGc3haWE5FTFgySUw1RU1z?=
 =?utf-8?B?VzdIT2s2TE1lNlhOUTVrZ0VuTWZqbmk2WVZ0TmlVNy9lUHJFYVRoZWFRbURm?=
 =?utf-8?B?K1ViamliMkRlL05pajBVQlJJeTZqU0kxcFZjc1B0cE9DYnpNdG11VlhSWjB0?=
 =?utf-8?B?WFhwZkQzeDBnWFcxQ2VkRTFLZGV5VzRYb1VlV1V4aCtPZ2Z4Nk00S1c4SVZt?=
 =?utf-8?B?SmgzNmJqY05BSzNkQkxWUDBtYm1GcFFyeGx6YVVVQXY3c2VZMDVDSi9kSisz?=
 =?utf-8?B?MVhBNlZPdWFJR2RtVnhJTVk1eDExbk0xUW5qRmszUEE1SFIrdVl0aDNkdGNR?=
 =?utf-8?B?akNXTTRlUFRrbWg5dmwxcjZzOENyTUMvLzVwUDJaVWFIYjdCTnV3ZSs2YUZr?=
 =?utf-8?B?MDNaWXhkb3Z3Wm8vK0dOejFYY0tQYlBxYkVnYUEzeDlIaWl3dmg3WVVEZGxk?=
 =?utf-8?B?UDI3Vi96ZmpvOTNkQTc5OTlNWEcxOXV0bnNIYWpxQ1lwUUUzcy93S2wrU0Rw?=
 =?utf-8?B?dEl3b1U2b1RSc1gvOUN2T0syejVpQjRESGVCNDVYZW9kKzFZWTBua2FFdXpu?=
 =?utf-8?B?QWYwYU1DdmxEUHhnOVpHS2J2VnNweXVVNUNSMFNBRjZYWTFoby8xeForNk82?=
 =?utf-8?B?Z1c0VjhIcVhWbnV6UU0va0pheCtzQjRJeGEwYXNZNUZCNUdoWVFuNVJHNGlQ?=
 =?utf-8?B?c1IrcjJ1Zkd0QmI5NWV4aVR1UHNIa2hOY3VjcFo4TE9LUklsanMzUDZLdjZO?=
 =?utf-8?B?UUlsNFI0UU5ZTnc2RHp6SXNmZjlVMy9UKzhROC85bkw4UVRxbUdJSE5ITWRV?=
 =?utf-8?B?endHSXpGU3VHVXFxWGpMMmJXT2tTNlhKbGVabDgvOEFpQ2d3aUkrVUZod0Zs?=
 =?utf-8?B?MURFcnJGaVkwaGJzN0hYZ0lnTDNnUFdta0dKSzZNeENFR08yd1ZkanU0bUZi?=
 =?utf-8?B?N1o0SDJYYk54bk5pTk91ckFNME1QTzlkaXVtY0JPeDBpNnN3MjAxV01yVnNV?=
 =?utf-8?B?a0p5dENtTEY3clFqeVFQem0vR3BrYnh4Nzdsa2FjcmNsQTFDSlBQcnZqRG5Y?=
 =?utf-8?B?UVlHbEp0TGwxKzl4dzBwbVZXQ3QxYytwU1FhSjh4RlAzZ3BYVlorQWg2UFh6?=
 =?utf-8?B?bUN4WDZwOXd4cnU2dDV0ZGwxNDRON3c3bm94T0VjbitnT1BUcGh2U2JQTlRX?=
 =?utf-8?B?a3g3alpOUkovWmdOYjJXVUxQa1JuekhpZkhaUFpDS2JoaFQ2MzBKYlVZT2pT?=
 =?utf-8?B?ZDZkWjcza2t3WTBIUG5LTHhBcUtSTU54cTFCd3dvbWl3b24zMnV0RU5hUU12?=
 =?utf-8?B?Z2NiMjN4ajUwWWNlUkN0eHpxUlJnRkVrazJJbkJaV090S05CNGxva2lKOGNn?=
 =?utf-8?B?MHVBZDVuU1JSbXVJNWRxVEJjeEhyRlJEL3FRN3hSbytKTmQ4RjFhVUJ6Q0xv?=
 =?utf-8?B?K01nSldTSGFkLysrWGNRNlBXMjdvOGNlTXg5RHYwTVM2amVBVjJMMnp6VEFV?=
 =?utf-8?B?SlBLTytQNzNmRC92bFl3bUt4elRpYmQ1eHVjOVpUdmRJR0F0ajhBRllVRXVI?=
 =?utf-8?B?OFc4N01TYUYzcmlVd3lMRXk1SG5uWWNzYi9scHFwRVZCaWRZc2tsMll3RVBz?=
 =?utf-8?Q?VEGRGT5sxqCVr43h6vXloBEVD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55b38246-191f-4aa6-6ac3-08dbeb98efc1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 20:23:49.4549 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: baaOogdiW5v+XhAY25UGO6E8HG3ZcP4OWGL/wGICRPOiqRDCgWfaMPbkpzgUi58zrAZdFcCncfPYx8wV3zuflQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7694
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?UTF-8?B?J01hcmVrIE9sxaHDoWsn?= <maraeo@gmail.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 intel-gfx@lists.freedesktop.org, Randy Dunlap <rdunlap@infradead.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, kernel-dev@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi André,
On 11/22/23 11:19, André Almeida wrote:
> Hi,
> 
> This work from me and Simon adds support for DRM_MODE_PAGE_FLIP_ASYNC through
> the atomic API. This feature is already available via the legacy API. The use
> case is to be able to present a new frame immediately (or as soon as
> possible), even if after missing a vblank. This might result in tearing, but
> it's useful when a high framerate is desired, such as for gaming.
> 
> Differently from earlier versions, this one refuses to flip if any prop changes
> for async flips. The idea is that the fast path of immediate page flips doesn't
> play well with modeset changes, so only the fb_id can be changed.
> 
> Tested with:
>   - Intel TigerLake-LP GT2
>   - AMD VanGogh

Have you had a chance to test this with VRR enabled? Since, I suspect
this series might break that feature.

> 
> Thanks,
> 	André
> 
> - User-space patch: https://github.com/Plagman/gamescope/pull/595
> - IGT tests: https://lore.kernel.org/all/20231110163811.24158-1-andrealmeid@igalia.com/
> 
> Changes from v8:
> - Dropped atomic_async_page_flip_not_supported, giving that current design works
> with any driver that support atomic and async at the same time.
> - Dropped the patch that disabled atomic_async_page_flip_not_supported for AMD.
> - Reordered commits
> v8: https://lore.kernel.org/all/20231025005318.293690-1-andrealmeid@igalia.com/
> 
> Changes from v7:
> - Only accept flips to primary planes. If a driver support flips in different
> planes, support will be added  later.
> v7: https://lore.kernel.org/dri-devel/20231017092837.32428-1-andrealmeid@igalia.com/
> 
> Changes from v6:
> - Dropped the exception to allow MODE_ID changes (Simon)
> - Clarify what happens when flipping with the same FB_ID (Pekka)
> 
> v6: https://lore.kernel.org/dri-devel/20230815185710.159779-1-andrealmeid@igalia.com/
> 
> Changes from v5:
> - Add note in the docs that not every redundant attribute will result in no-op,
>    some might cause oversynchronization issues.
> 
> v5: https://lore.kernel.org/dri-devel/20230707224059.305474-1-andrealmeid@igalia.com/
> 
> Changes from v4:
>   - Documentation rewrote by Pekka Paalanen
> 
> v4: https://lore.kernel.org/dri-devel/20230701020917.143394-1-andrealmeid@igalia.com/
> 
> Changes from v3:
>   - Add new patch to reject prop changes
>   - Add a documentation clarifying the KMS atomic state set
> 
> v3: https://lore.kernel.org/dri-devel/20220929184307.258331-1-contact@emersion.fr/
> 
> André Almeida (1):
>    drm: Refuse to async flip with atomic prop changes
> 
> Pekka Paalanen (1):
>    drm/doc: Define KMS atomic state set
> 
> Simon Ser (2):
>    drm: allow DRM_MODE_PAGE_FLIP_ASYNC for atomic commits
>    drm: introduce DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP
> 
>   Documentation/gpu/drm-uapi.rst      | 47 ++++++++++++++++++
>   drivers/gpu/drm/drm_atomic_uapi.c   | 77 ++++++++++++++++++++++++++---
>   drivers/gpu/drm/drm_crtc_internal.h |  2 +-
>   drivers/gpu/drm/drm_ioctl.c         |  4 ++
>   drivers/gpu/drm/drm_mode_object.c   |  2 +-
>   include/uapi/drm/drm.h              | 10 +++-
>   include/uapi/drm/drm_mode.h         |  9 ++++
>   7 files changed, 142 insertions(+), 9 deletions(-)
> 
-- 
Hamza

