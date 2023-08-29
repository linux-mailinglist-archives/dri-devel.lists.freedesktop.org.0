Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCF578CCE2
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 21:26:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CEFF10E492;
	Tue, 29 Aug 2023 19:26:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2089.outbound.protection.outlook.com [40.107.94.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0919710E492;
 Tue, 29 Aug 2023 19:26:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NCmepXxGW/9f98NjJ5Eit8nkLcYq6OAndfulSnsYMdkWdwKdP9yE5mABT8UE2ZYzipOZzZ0V80ibYiN7SZBfDtxjoZ22+hjNMjNgu+EaCRA4V3FF6tGeMLCMeEGHDxNnIzPGZk1qQe63sDwqHqj7xx/JLqcmXeEdVgGkoBBeD2Hq57+qctpLke1hCnZ9M3xP3+qCJYXYe1peKxcT7rT2crMCeiXIAhZ+JZj4ELQqNLXo1FP/XWurBtYCT/ERPZnTI9Z5lNttheDmtn3S2K3ehWAMqfNqBCcVmtGF2PF3DuacJewps+jogu6ax0atEcTfpWZ4plnyhrZEFwRjPOFXxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e6a8fuKbUIWygGiMuvfy8xQmeJ9HKvggZ++BSmAHiIA=;
 b=O3T+bXbdsViQdRW7JwTyQwR7bdbLmI7bN8QwxHOFqxEEnAvDpJDuomWWdDv5cooEwzi/RXYI8+VshCzLoCK7w1583mUXeVzwCZFL1qzfJ27Akcb3dEGe/yxx1nt7zwdEYQz0gURe2fePwppWmAwalJgElzk6xyO1CbwnIlyaCOj06xtiJUshiuiEU1k27oUVudmgDeVmjklFlYY6hfm0XXCmPVKsuESmvXqZMG5/EH5AVnNsK9GvvmPbI6ewfWb7GKSH6donUzvmElCUYqEAU04SxALOFMtrM8LcnUhU/wg4JhuuslOROHUs2/J/o2fAPFuYXojQskJMxARPSVXFYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e6a8fuKbUIWygGiMuvfy8xQmeJ9HKvggZ++BSmAHiIA=;
 b=bpVXXXutxx8qw/cEWOYvVfDfiX0EiLXB4nN2nE+JPrS8gynZu/Rm8GexoIBj3fck01X3wh0pIzayZpA48k1I9bZu65PnQqA0eXK4IBdC2FGT/jm+xz67iy2trGgMHBu1UsKGN0Lqz5ZMbRr9HpUtDiJDX1eSNcJUzkWoIyB/1DI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SA0PR12MB4384.namprd12.prod.outlook.com (2603:10b6:806:9f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.18; Tue, 29 Aug
 2023 19:26:23 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::236b:d4e2:6fbf:6c2b]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::236b:d4e2:6fbf:6c2b%5]) with mapi id 15.20.6699.035; Tue, 29 Aug 2023
 19:26:23 +0000
Message-ID: <dbde0306-cc10-420f-a663-663481e127e2@amd.com>
Date: Tue, 29 Aug 2023 15:26:19 -0400
User-Agent: Mozilla Thunderbird
From: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC 00/33] Add Support for Plane Color Pipeline
To: Uma Shankar <uma.shankar@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230829160422.1251087-1-uma.shankar@intel.com>
Content-Language: en-US
In-Reply-To: <20230829160422.1251087-1-uma.shankar@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0212.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:67::18) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SA0PR12MB4384:EE_
X-MS-Office365-Filtering-Correlation-Id: 0391f558-0f38-4fcf-7c0d-08dba8c5d489
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QjQot9Hz2Scsf9QBQS03sSUbz0U24W/pjtcTGZ9AKKas+AWknI/GFAOt/JW7SFNOI2a9bg7Cp+eL98mg/nyjda94lq1XqSGcvWDfD802h/v79Ms8Pqgzqcw9H/aydPgJAE3iIJCZ+3LcyXFpxD5OF8ReblRl6jYbiVpouG2pujkeq30+syRCezjYtb43Cu8J1+RfiCJH2VADHITPlyzHFYhKz/maO+IPTLpMKFNBC5c5nLleQJx6FcofSuQUQT+QNU8Zm3x08tN0pVZw2GfMJ0mpDCM0cNp5DJf/ZZQ5E2QD7V02cG+qBJRQfkkJPyZMCM9G32MrABZEFjoxTgnfzBTweUTHPq014nwSOkZk/x0bQDkl+Mn+InWjEw1sfAdcJIA2URiGSumO9x41EcOm/BWR26vxC3OkN5OtJ3k/qOwy/NRyGwVVBPb6GGb8he86r8FQS4jXPt24cAXyTsXZgh0ShhFxntJ2DfFCDtqYU0ICrmv+yiYI+wV24CoDyOwy8ETrQOXL/Hbig5DGBPLaNoF8mMF4fCiQ23iHGgQMap0WkXZN9Y2AWcIbeV+92wUAXbACm7EjncoR4pEss4lllT7d4Mq7NaCLDQDrfm3Sc9EHTf1t0Jawy0Gc5uNPLZSWyns/zz5QgHdROsjBPZ9df0/y12aWrM69he0YHiDed/E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(136003)(366004)(346002)(396003)(451199024)(1800799009)(186009)(6512007)(38100700002)(316002)(41300700001)(66899024)(36756003)(4326008)(66574015)(7416002)(83380400001)(31696002)(2906002)(86362001)(30864003)(2616005)(44832011)(26005)(8676002)(5660300002)(8936002)(6666004)(66556008)(6506007)(6486002)(966005)(66946007)(66476007)(54906003)(53546011)(478600001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zm9lR0l6bUVPam9rUEdLbEtJNnczV3lqd3F5UUg2bFZ3UTJrcjJLcncybTJQ?=
 =?utf-8?B?azhiT0pTb0RtUUNDM01FT0dnK3M5TUh0ZjdhdUJJV0t3MGEzdUtIeGpoZUw5?=
 =?utf-8?B?ajJtZHlYcmxOOXFUbkVqTVROYVZhRHpIcGJXQTU1QlplSVd6RUVmTFRMTjRi?=
 =?utf-8?B?S094YjNseDhKaDhrSGJMWTFhM2JOMFdrRmJ5RUJmb0ZtOGhuZzBlbFY4YUxm?=
 =?utf-8?B?WnEwVnhtaFNRRUl1Q1l0MndOMkFOTjlFcTF2bEV5OEFOWnA2eUZ5b1k2MmNX?=
 =?utf-8?B?bXRnck9yTGVVVXkrcnNqMVBRaGdDOGovVTEzSDZ6N3psb3lmdTl3UWtmWDR3?=
 =?utf-8?B?VDBZTzFYQmpiNTJleno5bkJ3OENhdlIwSlJ5b0cwekI1b3c1eFNUdmlpekEz?=
 =?utf-8?B?eXdhSW9Xam9lR0hEejhTQ1pjSHJUZ1BkYm8vbHduZEpxU2tvNVo4RHpNQUZp?=
 =?utf-8?B?TXJidnF3STVuZGhnbHR6Smloek1uWHo5bVBRTHd0R2EwMGRxdEEyRDBYaXN0?=
 =?utf-8?B?SzkyWll2cll3QWJIdTdXaFJteUxFSnFERXUvcGloRkJncWd0RUdTbkUwRVND?=
 =?utf-8?B?b280OEorQ1FZK2ZkTm5PTURBQXBOUzRCQytBZ2R2dFZvQ0lnYldFODJzL1Va?=
 =?utf-8?B?eWMvS2h0UUF0M1FSeTVxK3lyWEJvRTNBUGZTSExZRjRIdytkOG1CK1BrY3Jk?=
 =?utf-8?B?YzAwLzFBbjZmWCs3eVlHSG9hSWx6OXFVSFY1OUVtOXJYZ2ZLVFo1cG56NU1i?=
 =?utf-8?B?RjRhS09lZ3NjVzhLcE5rYmtoUFZiMmNrQUJTdTlNWU5kdWx5cVpaeHZwQkJy?=
 =?utf-8?B?QzhlbFFkZG9Ea3JtVGFYaHFFWjVWc2ltbGR6Vy9UNXpYdTZMTUhSV0pYV05H?=
 =?utf-8?B?OXBtclNPQlBkL0xLSENUWDJmS2R2Q2VELzdZZ3ZobmxXNFpRU3ZXUVBFR3BF?=
 =?utf-8?B?bVN3dUU5V1JVcGxpM0hnUG51UnFZNU9ldkdPTWtwOXdUQUthZU1Fd0tmU2Jt?=
 =?utf-8?B?WHpFOTNrMVRFTk9LRmkzTFM1UWZaaExvTDhvdHNxZno3SUxzN2V4SmhEMy9x?=
 =?utf-8?B?Qm1lUmVlSnlOZVJVbUJtS2NZSVQxYzFUTFJhV1E0WVZrR0FWa3BNTUIwL1E3?=
 =?utf-8?B?MjlTdHp4Z2hNWXdKS2F6aW9sWlNlc08zbUt2OUpURTVNcjVSVXIyZDNWUDB4?=
 =?utf-8?B?OGR1WDIxN3FXUEczcGtZYklJTk50YURJZDhNMjFoZE10N3g0ZFNmVTBWc2Iv?=
 =?utf-8?B?TFlXc1BrMEc4RjF3VURMNEhBQlJOTm80T3M5RWFYUVFtTUZ2YzlscXJBaVVM?=
 =?utf-8?B?N2hGMUtBell0ZzJCYXBwaytlN3JWaWdIQ0FzMnF6Y1gydHFWTExMY0tiU2xM?=
 =?utf-8?B?emFwT0hBbzJCUlIwb3Y3SEYwOVllNGMrZlN2WkFOMVI3WTIxYXg4YXQxT0NO?=
 =?utf-8?B?L2diZ2dPQ3M2emg2bzAvVzVxbkJhNTF2V2FJUHp2VzN1am5HSzlwKzU0ZHR1?=
 =?utf-8?B?QmxFYVZ2eTlKbURJZENQRlkySlZ0S29FQTBXbU9KQ0dqYVp4V3I4Qzg5RGUv?=
 =?utf-8?B?Z1dYWkh6Yms4RWdpaTQzaGgxK1UzYTI5MjczbWtnZUFXVUh2ZEJLWDhPUUt2?=
 =?utf-8?B?ZHRCWUF3U1o4eE0rUEVmallOSXZ6ZWIwL2ZSRXRTbTEwZG4wMXlRMU96aHhF?=
 =?utf-8?B?WStUSGxNVCtrcEUrUlpCTXIzV0tUTjFhVHhHSWtKREpYOE91M1M3eHZqNjU3?=
 =?utf-8?B?dUo5OElQRk52N3hucnc5TGEzTDBDVElaNGtMUmRiNGNheHZadDBPdTJ2cG9h?=
 =?utf-8?B?K1RDSnhNR1I0WG9QUE1rbXloeHF3VWtWOTQ4R29MeUU1RnRoWDFtNmtvNW1v?=
 =?utf-8?B?REZDa01TOGlIQVBzbDJKSzIwVkhGSXZYSzR3UE5mY3A0d1FPaUphZEpYSk11?=
 =?utf-8?B?M3R4VEpuRzltbGx0aU4wUWJHYWtTZ2hrOXBJd3Bib0VaMkhka1FoRDV6STdJ?=
 =?utf-8?B?akNIdVZjb055MWdodXZlZHZmOGsxdUcwdWlZeEdIWVNjMUdyVW4zRzVWazYx?=
 =?utf-8?B?OHFVK0J5MGgyNWJHM2V4cGV0alh1MjRoUHBJdFgzb1o1TnZXVUs0ZDJrQ2x2?=
 =?utf-8?Q?bLqm0gOG0O3qqOr3FIrOyErrZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0391f558-0f38-4fcf-7c0d-08dba8c5d489
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 19:26:23.2800 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +xVqtDqWUlfKJf+5u0AqQqk094lHClOijSTGi4P0n44glNa7gU/yLo6+zmqpda87w7f8RQxOxbSK/7kZyPx8KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4384
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Shashank Sharma <shashank.sharma@amd.com>, wayland-devel@lists.freedesktop.org,
 Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Jonas_=C3=85dahl?= <jadahl@redhat.com>,
 Naseer Ahmed <quic_naseer@quicinc.com>,
 Christopher Braga <quic_cbraga@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+CC Naseer and Chris, FYI

See https://patchwork.freedesktop.org/series/123024/ for whole series.

On 2023-08-29 12:03, Uma Shankar wrote:
> Introduction
> ============
> 
> Modern hardwares have various color processing capabilities both
> at pre-blending and post-blending phases in the color pipeline.
> The current drm implementation exposes only the post-blending
> color hardware blocks. Support for pre-blending hardware is missing.
> There are multiple use cases where pre-blending color hardware will
> be useful:
> 	a) Linearization of input buffers encoded in various transfer
> 	   functions.
> 	b) Color Space conversion
> 	c) Tone mapping
> 	d) Frame buffer format conversion
> 	e) Non-linearization of buffer(apply transfer function)
> 	f) 3D Luts
> 	
> and other miscellaneous color operations.
> 
> Hence, there is a need to expose the color capabilities of the hardware
> to user-space. This will help userspace/middleware to use display
> hardware for color processing and blending instead of doing it through
> GPU shaders.
> 

Thanks, Uma, for sending this. I've been working on something similar
but you beat me to it. :)

> 
> Work done so far and relevant references
> ========================================
> 
> Some implementation is done by Intel and AMD/Igalia to address the same.
> Broad consensus is there that we need a generic API at drm core to suffice
> the use case of various HW vendors. Below are the links capturing the
> discussion so far.
> 
> Intel's Plane Color Implementation: https://patchwork.freedesktop.org/series/90825/
> AMD's Plane Color Implementation: https://patchwork.freedesktop.org/series/116862/
> 
> 
> Hackfest conclusions
> ====================
> 
> HDR/Color Hackfest was organised by Redhat to bring all the industry stakeholders
> together and converge on a common uapi expectations. Participants from Intel, AMD,
> Nvidia, Collabora, Redhat, Igalia and other prominent user-space developers and
> maintainers.
> 
> Discussions happened on the uapi expectations, opens, nature of hardware of multiple
> hardware vendors, challenges in generalizing the same and the path forward. Consensus
> was made that drm core should implement descriptive APIs and not go with prescriptive
> APIs. DRM core should just expose the hardware capabilities; enabling, customizing and
> programming the same should be done by the user-space. Driver should just honor
> the user space request without doing any operations internally.
> 
> Thanks to Simon Ser, for nicely documenting the design consensus and an UAPI RFC
> which can be referred to here:
> 
> https://lore.kernel.org/dri-devel/QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr/
> 
> 
> Design considerations
> =====================
> 
> Following are the important aspects taken into account while designing the current RFC
> proposal:
> 
> 	1. Individual HW blocks can be muxed. (e.g. out of two HW blocks only one can be used)
> 	2. Position of the HW block in the pipeline can be programmable
> 	3. LUTs can be one dimentional or three dimentional
> 	4. Number of LUT entries can vary across platforms
> 	5. Precision of LUT entries can vary across platforms
> 	6. Distribution of LUT entries may vary. e.g Mutli-segmented, Logarithmic,
> 	   Piece-Wise Linear(PWL) etc
> 	7. There can be parameterized/non-parameterized fixed function HW blocks.
> 	   e.g. Just a hardware bit, to convert from one color space to another.
> 	8. Custom non-standard HW implementation.
> 	9. Leaving scope for some vendor defined pescriptive implementation if required.
> 	10.Scope to handle any modification in hardware as technology evolves
> 
> The current proposal takes into account the above considerations while keeping the implementation
> as generic as possible leaving scope for future additions or modifications.
>   
> This proposal is also in line to the details mentioned by Simon's RFC covering all
> the aspects discussed in hackfest.
> 
> 
> Outline of the implementation
> ============================
> 
> Each Color Hardware block will be represented by a data structure drm_color_op.
> These color operations will form the building blocks of a color pipeline which
> best represents the underlying Hardware. Color operations can be re-arranged,
> substracted or added to create distinct color pipelines to accurately describe
> the Hardware blocks present in the display engine.

Who is doing the arranging of color operations? IMO a driver should 
define one or more respective pipelines that can be selected by 
userspace. This seems to be what you're talking about after (I haven't 
reviewed the whole thing yet). Might be best to drop this sentence or to 
add clarifications in order to avoid confusion.

> 
> In this proposal, a color pipeline is represented as an array of
> struct drm_color_op. For individual color operation, we add blobs to advertise
> the capability of the particular Hardware block.
> 
> This color pipeline is then packaged within a blob for the user space to
> retrieve it.
> 

Would it be better to expose the drm_color_ops directly, instead of 
packing a array of drm_color_ops into a blob and then giving that to 
userspace.

> To advertise the available color pipelines, an immutable ENUM property
> "GET_COLOR_PIPELINE" is introduced. This enum property has blob id's as values.
> With each blob id representing a distinct color pipeline based on underlying HW
> capabilities and their respective combinations.
> 
> Once the user space decides on a color pipeline, it can set the pipeline and
> the corresponding data for the hardware blocks within the pipeline with
> the BLOB property "SET_COLOR_PIPELINE".
> 

When I discussed this at the hackfest with Simon he proposed a new DRM 
object, (I've called it a drm_colorop) to represent a color operation. 
Each drm_colorop has a "NEXT" pointer to another drm_colorop, or NULL if 
its the last in the pipeline. You can then have a mutable enum property 
on the plane to discover and select a color pipeline.

This seems a bit more transparent than a blob. You can see my changes 
(unfortunately very WIP, don't look too closely at individual patches) at
https://gitlab.freedesktop.org/hwentland/linux/-/merge_requests/5/diffs

libdrm changes:
https://gitlab.freedesktop.org/hwentland/drm/-/merge_requests/1/diffs

IGT changes:
https://gitlab.freedesktop.org/hwentland/igt-gpu-tools/-/merge_requests/1/diffs

I'll take time to review your whole series and will see whether we can 
somehow keep the best parts of each.

Curious to hear other opinions on the blob vs new DRM object question as 
well.

> Refer to Documentation/gpu/rfc/plane_color_pipeline.rst added in the patch
> 
> IGT and test details
> ====================
> 
> A set of IGT tests is written to demonstrate the usage of the proposed UAPIs
> along with some sanity validation.
> 
> Details of the IGT test can be found here:
> https://patchwork.freedesktop.org/series/123018/
> 
> Opens
> =====
> 
> a. To come up with a list of common HW blocks which can be defined generically by the DRM
>     core in agreement with all the stakeholders
> b. To enhance/finalize the data structure to define segmented LUTs generically.
> 

It would be good to add some basic support in VKMS. My work has been 
based on VKMS. Once we kinda settle on an approach I'll look at exposing 
the AMD private properties from Melissa through the API.

> 
> Out of Scope
> ============
> 
> a. The coefficients for CTM and LUT value calculations are out of scope of the proposal.
> b. The onus of programming the HW blocks and their values is on user-space. Driver will
>     just provide the interface for the same.
> c. In order to compute LUT values and coefficients, a helper library can be created in
>     user-space. However, it is out of scope for the current proposal.
> 
> Acknowledgements and credits
> ============================
> 
> There are multiple contributors who have helped us to reach to this proposal. Special mention
> to Ville Syrjala<ville.syrjala@linux.intel.com>, Pekka Paalanen<pekka.paalanen@collabora.com>,
> Simon Ser<contact@emersion.fr>, Harry Wentland<harry.wentland@amd.com>,
> Melissa Wen<mwen@igalia.com>, Jonas<jadahl@redhat.com>, Sebastian Wick<sebastian.wick@redhat.com>,
> Bhanu<bhanuprakash.modem@intel.com> and Shashank<shashank.sharma@amd.com>.
> 
> Also, thanks to Carlos <csoriano@redhat.com> and the Redhat team for organizing the HDR hackfest.
> 
> 
> UAPI dependency and Usermode development
> ========================================
> 
> The current KMS implementation requires a user space consumer for it to be accepted upstream.
> Work is ongoing in weston and mutter community to get color management and HDR support implemented
> in the respective stacks.
> 

If we can get AMD properties encoded using a Color Pipeline API we can 
probably use gamescope as the userspace vehicle.

I'm reviewing this in sequence, so there's a chance I'm missing context. 
Please bear with me if some of my comments are answered later in the series.

Again, thanks for sending this.

Harry

> =================================================================================
> 
> We have tried to take care of all the scenarios and use-cases which possibly could exists in the
> current proposal. Thanks to everyone who has contributed in all color management discussions so
> far. Let's work together to improve the current proposal and get this thing implemented in
> upstream linux. All the feedback and suggestions to enhance the design are welcome.
> 
> Regards,
> Uma Shankar
> Chaitanya Kumar Borah
> 
> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> Cc: Simon Ser <contact@emersion.fr>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Melissa Wen <mwen@igalia.com>
> Cc: Jonas Ådahl <jadahl@redhat.com>
> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> Cc: Shashank Sharma <shashank.sharma@amd.com>
> Cc: Alexander Goins <agoins@nvidia.com>
> 
> Chaitanya Kumar Borah (14):
>    drm: Add color operation structure
>    drm: Add plane get color pipeline property
>    drm: Add helper to add color pipeline
>    drm: Manage color blob states
>    drm: Replace individual color blobs
>    drm: Reset pipeline when user sends NULL blob
>    drm: Reset plane color state on pipeline switch request
>    drm/i915/color: Add HDR plane LUT range data to color pipeline
>    drm/i915/color: Add SDR plane LUT range data to color pipeline
>    drm/i915/color: Add color pipelines to plane
>    drm/i915/color: Create and attach set color pipeline property
>    drm/i915/color: Enable plane color features
>    drm/i915/color: Add a dummy pipeline with 3D LUT
>    drm/i915/color: Add example implementation for vendor specific color
>      operation
> 
> Uma Shankar (19):
>    drm/doc/rfc: Add RFC document for proposed Plane Color Pipeline
>    drm: Add structures for setting color pipeline
>    drm: Add set colorpipeline property
>    drm: Add Enhanced Gamma LUT precision structure
>    drm: Add color lut range structure
>    drm: Add color information to plane state
>    drm/i915/color: Add lut range for SDR planes
>    drm/i915/color: Add lut range for HDR planes
>    drm/i915/color: Add color pipeline for HDR planes
>    drm/i915/color: Add color pipeline for SDR planes
>    drm/i915/color: Add plane color callbacks
>    drm/i915/color: Load plane color luts from atomic flip
>    drm/i915/xelpd: Add plane color check to glk_plane_color_ctl
>    drm/i915/xelpd: Add register definitions for Plane Degamma
>    drm/i915/color: Add color functions for ADL
>    drm/i915/color: Program Plane Pre-CSC Registers
>    drm/i915/xelpd: Add register definitions for Plane Post CSC
>    drm/i915/xelpd: Program Plane Post CSC Registers
>    drm/i915/color: Enable Plane CSC
> 
>   .../gpu/rfc/plane_color_pipeline.rst          | 394 ++++++++++
>   drivers/gpu/drm/drm_atomic_state_helper.c     |  21 +
>   drivers/gpu/drm/drm_atomic_uapi.c             | 218 ++++++
>   drivers/gpu/drm/drm_color_mgmt.c              | 130 ++++
>   drivers/gpu/drm/i915/display/intel_color.c    | 684 +++++++++++++++++-
>   drivers/gpu/drm/i915/display/intel_color.h    |   7 +-
>   .../drm/i915/display/skl_universal_plane.c    |  21 +-
>   drivers/gpu/drm/i915/i915_reg.h               | 124 ++++
>   include/drm/drm_plane.h                       |  82 +++
>   include/uapi/drm/drm_mode.h                   | 196 +++++
>   include/uapi/drm/i915_drm.h                   |  25 +
>   11 files changed, 1899 insertions(+), 3 deletions(-)
>   create mode 100644 Documentation/gpu/rfc/plane_color_pipeline.rst
> 
