Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D0763CE18
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 04:54:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 366C28876A;
	Wed, 30 Nov 2022 03:53:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B73210E285;
 Wed, 30 Nov 2022 03:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669780426; x=1701316426;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=e6C7ruv35CAHNq/b3DICwh5Ky22/KaBa7XOd1iYsjMA=;
 b=gHyhzaP+Cfl+7IhPiRt32m/eRoGkgsVTx3d32PYYjdukXKL8Y7OGLIPv
 hKhWzmvJE3xrkPtKs12r5hm3aXDJy2sC/BPD3PaokI7mBiCA2XtUad35n
 rPbKAq8gGmxKa1RwBv6w4UoQ8tQ3PuYuhM6+TDFxzfCMu+S9SHwiN6uMi
 Cu7gHxmiecz/A1LwLhzr/mrRxckbmgFvxP5wyVFJiTnglD2vJ7ynLxg7Q
 R+QjJ6qKkIhd8qxy1UQOn0mWM9HMk3o470gsi7PJPMqaZF48OqNwbyDL5
 6HsUOYqoNg4C0F5NWCv57nNY090iaMnXCu8riqHckv4iEi46Of5fsD/vG Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="312910742"
X-IronPort-AV: E=Sophos;i="5.96,205,1665471600"; d="scan'208";a="312910742"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2022 19:53:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="712651157"
X-IronPort-AV: E=Sophos;i="5.96,205,1665471600"; d="scan'208";a="712651157"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP; 29 Nov 2022 19:53:44 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 29 Nov 2022 19:53:43 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 29 Nov 2022 19:53:43 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 29 Nov 2022 19:53:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QTNQ/VIByH6UQFrkv2ZhMbo9GV32g7bu5GrEHWI/jywCBrB1jgZdExKI12Z6EO5ObI/0f6rUwAyCo+WiJG0VnJpz7+C+a/akCZ90HaUr1xK3Dtw1jVWYkWlJGszBQ2xi4O8ilWeXmDIzWW8VVmK9WpZQKTCBxgAQ/32zwHl3v1b6JexqbYARI3lsoFTFnrWRJ7UpkW6ulvUzAsh+yuKHHVar8cFPSKrt8DR4YkRxL7O0QbSCdUjLlA1VhSS8Kwuk6pUxypVDgx5w6Dik8brhAOB5Eh7K4TYE6ah3PNtrfosRDu4MKR7RuSmQ4v0HIhbxBPpCfMI1oHX6CGqwmarcHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N1iS12gbqX+wM+eWETIt4if1phFXgWX/qhYU0fr8QEo=;
 b=UHOH0l4vPwjNiMBfDh936LCKIJv/iLTUdLxOGSBXjwFsXH31QKG3Q8rq+OJfNJFyCiPf4vxEz6WnFr5Hh+7v4dN981UDlL3CyI+aCd2df7WSKsfawajKb86WJMJF4o/eWyX8/3WgYL6S/wyXYjiab/ZA6mpOEaej3SHMF4m/4WkuZyvdvJKKIF2uwBUKrNjgCWZGC0cssB2FrF8QcUh5gK9sxPlGk/ZcGnm5svEbAxLCXQuh6iQ0P12Dp6nLFh8h+RFd7p12RzQBqDrJEo4fFqoZ/5t52tHHYW8y0RMS/nM+McjepSrM+JGj+i9Ypzv8ZoUviRjdVjLFKcAfuX0vpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by BL1PR11MB5430.namprd11.prod.outlook.com (2603:10b6:208:31e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Wed, 30 Nov
 2022 03:53:40 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::d060:bf4d:10ad:3713]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::d060:bf4d:10ad:3713%3]) with mapi id 15.20.5857.023; Wed, 30 Nov 2022
 03:53:40 +0000
Date: Tue, 29 Nov 2022 19:53:31 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>
Subject: Re: [PATCH v7 00/20] drm/i915/vm_bind: Add VM_BIND functionality
Message-ID: <Y4bTu+yXv3bbUzI4@nvishwa1-DESK>
References: <20221113075732.32100-1-niranjana.vishwanathapura@intel.com>
 <a37460272142aeb9631e9a6362d4369768cca35d.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a37460272142aeb9631e9a6362d4369768cca35d.camel@intel.com>
X-ClientProxiedBy: BY3PR05CA0049.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::24) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|BL1PR11MB5430:EE_
X-MS-Office365-Filtering-Correlation-Id: b5bf1b72-54dc-4e16-1e81-08dad28676dd
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0wLaPoCLCTb1lWLvMSWmU4Uy4grE+XX1EP10Sn/oZwT4yniET80g6am+iRQrZJiHgKpw04Ts9M69UUUPsyqVN9zeyyexPAxV+NCN0L8MvLEfuDI3Jq00+ck/k/RD9U9NLAHo1jz3c++k2zS1zwgHlWlGEBxl/SRykbJLvpC7NisvTGGap84Ki2yCbtLJpukgrwHH7t73g/o0sKElFMR1JzaVpI/ILP61CrVSpN8jmAsHkdgwaJYWqRsndXWhx9k1zn6xwqoBc+BkS9AL/xbsOFtqb6ertyvDJmnx63XQ0+9axY2bdlSEZpIGfNwFYBE4hLyNBi/UdfvfCdCImgn4XpIAzKUCrFXqLA8QheXf5FUClum2HePULeglADRl0rXsJKXuE/65+ivrI9EJKdmTd2l7xUZZYm6e7utGSK7XJAT71wB1Ndr6McW5zA8qfGlow/IqiSnuIQ5lqYi07ssH25zui6u/2amjrS1eXMB5wEDovC6pWT7PnsrPBj4I9LnaoJJFJzxEGPKx1KuGNA+xqnbIxnoyvGkmb27yAO4ldY3dJf0cmjfv1FdmNe2zzK+GF0iOCqGB3aJwREIKeI6DWlG+pjfyHA7XFFab/TqiJtoHXR/R4y6nGUZexXiRlQeX+vhaeYf2dGevQ+JkSMHRfA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(376002)(366004)(136003)(39860400002)(396003)(346002)(451199015)(86362001)(83380400001)(2906002)(44832011)(82960400001)(38100700002)(41300700001)(66946007)(6862004)(33716001)(5660300002)(4326008)(66476007)(8936002)(6506007)(186003)(6666004)(26005)(6512007)(6486002)(9686003)(54906003)(316002)(8676002)(6636002)(66556008)(478600001)(4001150100001)(66899015)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?DzSfFM+NhtmJnUj2byeXZ0/TW/imPa6ObqZiS7dauaBFc7gEKJ+xCBblMg?=
 =?iso-8859-1?Q?CbjaOggdhB25McPpUSy31XP2SIJdwV084NU1gA05R7GTrtwb/vonT1QmkN?=
 =?iso-8859-1?Q?KyQMc3g0Xp1ofY7k74gx1SToVIk8Ad88QwwxdccsWfqblySnKs39LerOvV?=
 =?iso-8859-1?Q?KSyQuGbDqsNPcb6OucOLCxlwewzeGr55WdtAKLJpqD281/ZPho3tggXG0n?=
 =?iso-8859-1?Q?/myfyOyhIhpI/HTxJB0knIAUJwIoz1mq1Pg3aBThJT2uURlEr/y+Y5knyf?=
 =?iso-8859-1?Q?CLWn+D9UvCzpVP+BfiOUeHAPX7Gy5F/y5b7Q7ehofKf6gyjQxGPUkkCAdM?=
 =?iso-8859-1?Q?SPTkaaZhrfVxIzRAzUfV9C7KWbab4qbo+6i3flLKflhYbVTePE/cMElhT2?=
 =?iso-8859-1?Q?i/OqsyjvsVeLvx4LncM43EXSHP9B7phpWZBbiuEBmGxZ9ktg5uezGVPLL4?=
 =?iso-8859-1?Q?b29/jWAYRsSIeJ5pTxaAdSUGXf9TkSSRyMgBcLjUstamouKhBf+9p00PqE?=
 =?iso-8859-1?Q?b/MWVgoj3ZBnDRU6e7qZNtx83+ovn+TRA1wxn9YjhoRk46S86X8LAb0ZoQ?=
 =?iso-8859-1?Q?L9aE5G1YFFe2QI2sG2Gc+gzuNozNPpCXtouXF858d1C/UwYg6NgH2yOvjK?=
 =?iso-8859-1?Q?KZanvAtwclix0EuXS9+thc+AGvL+1jw6nIvfSgx+GeHmycpz50yWtHHvcW?=
 =?iso-8859-1?Q?emZSy7GUxRhZcmDvku13QrKPJ6ENnm/o3BU4qRqkCA0DhnW179rdXiryID?=
 =?iso-8859-1?Q?7eQisM5J00lKZIr8vkqH+JbN7fCNr6wc6JSy/nio6PY5irn8pEphP9UZPV?=
 =?iso-8859-1?Q?pgjracMqcrvJwVp/pMoPQf0waCd5KXMuNoURK7RAsfk0MjDd6O2E929Hrw?=
 =?iso-8859-1?Q?mIw2+05RF4m/gqGckoPMnsDh4g9ruydL8lMCbWE2jOO3se45URZqGXaagM?=
 =?iso-8859-1?Q?9pXgfjWB2cFw7tQs5dgRJYjPXf3VzQqtNwa/Vm2Edh+qIjMqgT7CWOw85j?=
 =?iso-8859-1?Q?66q06ngpcz4+jy9U1fv4SYkG+095UvVUARhPEXBBTgXVp2tg3c8YH42lve?=
 =?iso-8859-1?Q?nBQV/z8M9i27SEBbytFLm60QE8jp8RJyt1baNClrEokTumv+ZYVZxbIP1r?=
 =?iso-8859-1?Q?btvq2hpgPSl/dghbX1sFtTVxLQZwYGJRpAZq31WufKIW13cmU4bi6Z+V9K?=
 =?iso-8859-1?Q?+Hc457gSFNoLZKe150j6alD6L4PhbkMTNMWyOW/iHvdoqUVnnRaWM3sddo?=
 =?iso-8859-1?Q?+usP9sDrD6Y5aXrcV7haOGu2Ut8y4o3TOaviA9P6a2gzeGeawSSfeeZXVh?=
 =?iso-8859-1?Q?nlbMwv0WSfxmiM2j7Le3dszhFuTCn7bXe2rBw/xNo918Y9s6aEwKolAzUb?=
 =?iso-8859-1?Q?ghsClnvaW+fGJ8sAdNh6QTso8pBZ13wYHnvsYxrVwQu58RteVIdrfE/XP5?=
 =?iso-8859-1?Q?OQ+4uoZsFBQRGr8oWuWjUHdcuOmAuSmXEsUsKQV6+HebbRFMHWprSYperL?=
 =?iso-8859-1?Q?WMnaqoUAM3WYyhkMCbBEfJHIY1DSVEtNDBrb6zWZ6grjeleVz2+E36xtEJ?=
 =?iso-8859-1?Q?79cIgwKyw5s8V/v+sXEG50nLEz6WTgqueBYXH/4Tb4xBA2U0qGhxjyNs68?=
 =?iso-8859-1?Q?3S/4AR06w8qX7dxVF8gcrcR2pHdwYbyUrCme/8wrkcpltb7FOqhdvZi3Kv?=
 =?iso-8859-1?Q?uojtdASCOIABoynHxDU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b5bf1b72-54dc-4e16-1e81-08dad28676dd
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2022 03:53:40.2384 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wfV0fgoxYa5Gp9LpRPi5MDtAtG/QbBCZKyNNj9XVx8BTu9iLG6nhWyKiGREkDoo+UO/pXXoMeWT4Xrc4OrGPjKH8MraXIumTJ9xw42LwJsetVTwKVgEV9pD1zJQuHP/H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5430
X-OriginatorOrg: intel.com
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
Cc: "Brost, Matthew" <matthew.brost@intel.com>,
 "andi.shyti@linux.intel.com" <andi.shyti@linux.intel.com>, "Landwerlin,
 Lionel G" <lionel.g.landwerlin@intel.com>, "Ursulin, 
 Tvrtko" <tvrtko.ursulin@intel.com>, "Nikula, Jani" <jani.nikula@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Hellstrom, Thomas" <thomas.hellstrom@intel.com>, "Auld,
 Matthew" <matthew.auld@intel.com>,
 "jason@jlekstrand.net" <jason@jlekstrand.net>, "Vetter,
 Daniel" <daniel.vetter@intel.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 18, 2022 at 03:53:34PM -0800, Zanoni, Paulo R wrote:
>On Sat, 2022-11-12 at 23:57 -0800, Niranjana Vishwanathapura wrote:
>> DRM_I915_GEM_VM_BIND/UNBIND ioctls allows UMD to bind/unbind GEM
>> buffer objects (BOs) or sections of a BOs at specified GPU virtual
>> addresses on a specified address space (VM). Multiple mappings can map
>> to the same physical pages of an object (aliasing). These mappings (also
>> referred to as persistent mappings) will be persistent across multiple
>> GPU submissions (execbuf calls) issued by the UMD, without user having
>> to provide a list of all required mappings during each submission (as
>> required by older execbuf mode).
>>
>> This patch series support VM_BIND version 1, as described by the param
>> I915_PARAM_VM_BIND_VERSION.
>>
>> Add new execbuf3 ioctl (I915_GEM_EXECBUFFER3) which only works in
>> vm_bind mode. The vm_bind mode only works with this new execbuf3 ioctl.
>> The new execbuf3 ioctl will not have any execlist support and all the
>> legacy support like relocations etc., are removed.
>>
>> NOTEs:
>> * It is based on below VM_BIND design+uapi rfc.
>>   Documentation/gpu/rfc/i915_vm_bind.rst
>
>Just as a FYI to everyone, there is a Mesa Iris implementation that
>makes use of this series here:
>
>https://gitlab.freedesktop.org/pzanoni/mesa/-/commits/upstream-vmbind/
>
>Some notes on it:
>
>- Tested on TGL and Alchemist (aka DG2).
>
>- The code still has a lot of TODOs and some FIXMEs.
>
>- It was somewhat tested with the common Linux benchmarks (Dota 2,
>Manhattan, Xonotic, etc.) and survived most of what I threw at it. The
>only problems I saw so far are:
>
>  - Sometimes you get a random GPU hang with Dota 2, but it seems to go
>away if you use INTEL_DEBUG=nofc . I'm investigating it right now.
>
>  - Very very rarely DRM_IOCTL_SYNCOBJ_HANDLE_TO_FD returns EINVAL and
>we don't properly recover. I am still trying to understand this one,
>it's once in a blue moon that it happens.
>
>- Performance seems to be mostly equivalent to non-vm-bind, but I
>haven't spent a lot of time really gathering numbers since I'm mostly
>debugging things. Using VM_PRIVATE BOs is the key here, you cut Dota's
>performance by almost half if you don't use private BOs. Considering
>how ABYSMALLY slower things get, I would assume there's probably
>something the Kernel could do here to handle things a little faster.
>The 'perf' tool shows a lot of i915 fence-related functions wasting CPU
>time when we don't use private BOs.

Thanks Paulo for trying this out.
i915 loops through each non-private BO of working set in the submission path
updating it's dma-resv fence list. So, user have to use privater BOs where
possible and when BOs needs to be shared, VM_UNBIND it when it is no longer
required (thus removing it from working set for subsequent submissions).

>
>- I am not really sure whether the implicit tracking code actually
>works or not. It doesn't really seem to make much of a difference if I
>remove it entirely, but I'm still planning to spend more time analyzing
>this. If anybody knows of a workload that will absolutely fail if we
>get this wrong, please tell me.
>
>- There's the whole frontbuffer tracking discussion from v6 that's
>still pending resolution.
>
>- The Vulkan implementation will come later. I wanted to sort all the
>GL details later so I don't make the same mistakes twice.
>
>- I really dislike how we have to handle the lack of implicit tracking
>support. The code is excessive and racy. See export_bo_sync_state(),
>import_bo_sync_state() and their caller from
>src/gallium/drivers/iris/iris_batch.c. Suggestions for Mesa
>improvements are welcome, but I would really really really prefer to
>have a way to just tell execbuffer3 to handle implicit tracking for
>these buffers for me in an atomic way.
>
>- I kinda wish execbuffer3 still accepted a pointer to struct
>drm_i915_gem_exec_fence in addition to struct
>drm_i915_gem_timeline_fence, since we already have to keep a list of
>exec_fences for execbuf2, and then in the execbuf3 we convert them to
>the new format. We could also do the opposite and leave execbuf2 with
>the slower path. But I could live without this, no problem.
>

You mean having an array of <handle, value> pairs (as with execbuf3)
vs having separate handles array an value array (as with execbuf2)?
I think former is much cleaner interface.

>- Credits to Ken, Jason, Lionel, Niranjana, Nanley, Daniel and
>everybody else who helped me sort things out here.
>
>
>Is this ready to be merged to the Kernel? Maybe, but I'd like us to
>sort these things out first:
>
>1. Get conclusion regarding the frontbuffer tracking issue first.
>
>2. Get some validation from more experienced people (*winks at Jason*)
>that our approach with implicit tracking is correct here. Or convince
>Niranjana to add a way to pass buffers for implicit tracking so the
>Kernel can atomically inside execbuf3 what we're trying to do with 8
>ioctls.

It was discussed during VM_BIND rfc design and implicit dependency
tracking is removed. Note that supporting it in execbuf3 is not trivial
with our VM_BIND dma-resv usage model.

Regards,
Niranjana

>
>3. Fix all the Mesa bugs so we're 100% sure they're not design flaws of
>the Kernel.
>
>But that's just my humble opinion.
>
>Thanks,
>Paulo
>
>>
>> * The IGT RFC series is posted as,
>>   [PATCH i-g-t v7 0/13] vm_bind: Add VM_BIND validation support
>>
>> v2: Address various review comments
>> v3: Address review comments and other fixes
>> v4: Remove vm_unbind out fence uapi which is not supported yet,
>>     replace vm->vm_bind_mode check with i915_gem_vm_is_vm_bind_mode()
>> v5: Render kernel-doc, use PIN_NOEVICT, limit vm_bind support to
>>     non-recoverable faults
>> v6: Rebased, minor fixes, add reserved fields to drm_i915_gem_vm_bind,
>>     add new patch for async vm_unbind support
>> v7: Rebased, minor cleanups as per review feedback
>>
>> Test-with: 20221113075309.32023-1-niranjana.vishwanathapura@intel.com
>>
>> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>
>> Niranjana Vishwanathapura (20):
>>   drm/i915/vm_bind: Expose vm lookup function
>>   drm/i915/vm_bind: Add __i915_sw_fence_await_reservation()
>>   drm/i915/vm_bind: Expose i915_gem_object_max_page_size()
>>   drm/i915/vm_bind: Add support to create persistent vma
>>   drm/i915/vm_bind: Implement bind and unbind of object
>>   drm/i915/vm_bind: Support for VM private BOs
>>   drm/i915/vm_bind: Add support to handle object evictions
>>   drm/i915/vm_bind: Support persistent vma activeness tracking
>>   drm/i915/vm_bind: Add out fence support
>>   drm/i915/vm_bind: Abstract out common execbuf functions
>>   drm/i915/vm_bind: Use common execbuf functions in execbuf path
>>   drm/i915/vm_bind: Implement I915_GEM_EXECBUFFER3 ioctl
>>   drm/i915/vm_bind: Update i915_vma_verify_bind_complete()
>>   drm/i915/vm_bind: Expose i915_request_await_bind()
>>   drm/i915/vm_bind: Handle persistent vmas in execbuf3
>>   drm/i915/vm_bind: userptr dma-resv changes
>>   drm/i915/vm_bind: Limit vm_bind mode to non-recoverable contexts
>>   drm/i915/vm_bind: Add uapi for user to enable vm_bind_mode
>>   drm/i915/vm_bind: Render VM_BIND documentation
>>   drm/i915/vm_bind: Async vm_unbind support
>>
>>  Documentation/gpu/i915.rst                    |  78 +-
>>  drivers/gpu/drm/i915/Makefile                 |   3 +
>>  drivers/gpu/drm/i915/gem/i915_gem_context.c   |  43 +-
>>  drivers/gpu/drm/i915/gem/i915_gem_context.h   |  17 +
>>  drivers/gpu/drm/i915/gem/i915_gem_create.c    |  72 +-
>>  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |   6 +
>>  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 522 +----------
>>  .../gpu/drm/i915/gem/i915_gem_execbuffer3.c   | 872 ++++++++++++++++++
>>  .../drm/i915/gem/i915_gem_execbuffer_common.c | 671 ++++++++++++++
>>  .../drm/i915/gem/i915_gem_execbuffer_common.h |  76 ++
>>  drivers/gpu/drm/i915/gem/i915_gem_ioctls.h    |   2 +
>>  drivers/gpu/drm/i915/gem/i915_gem_object.c    |   3 +
>>  drivers/gpu/drm/i915/gem/i915_gem_object.h    |   2 +
>>  .../gpu/drm/i915/gem/i915_gem_object_types.h  |   6 +
>>  drivers/gpu/drm/i915/gem/i915_gem_userptr.c   |  19 +
>>  drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h   |  30 +
>>  .../drm/i915/gem/i915_gem_vm_bind_object.c    | 449 +++++++++
>>  drivers/gpu/drm/i915/gt/intel_gtt.c           |  17 +
>>  drivers/gpu/drm/i915/gt/intel_gtt.h           |  21 +
>>  drivers/gpu/drm/i915/i915_driver.c            |   4 +
>>  drivers/gpu/drm/i915/i915_drv.h               |   2 +
>>  drivers/gpu/drm/i915/i915_gem_gtt.c           |  39 +
>>  drivers/gpu/drm/i915/i915_gem_gtt.h           |   3 +
>>  drivers/gpu/drm/i915/i915_getparam.c          |   3 +
>>  drivers/gpu/drm/i915/i915_sw_fence.c          |  28 +-
>>  drivers/gpu/drm/i915/i915_sw_fence.h          |  23 +-
>>  drivers/gpu/drm/i915/i915_vma.c               | 186 +++-
>>  drivers/gpu/drm/i915/i915_vma.h               |  68 +-
>>  drivers/gpu/drm/i915/i915_vma_types.h         |  39 +
>>  include/uapi/drm/i915_drm.h                   | 274 +++++-
>>  30 files changed, 3027 insertions(+), 551 deletions(-)
>>  create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
>>  create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_execbuffer_common.c
>>  create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_execbuffer_common.h
>>  create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
>>  create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>
>
