Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 439165BF659
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 08:31:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE79A10E84C;
	Wed, 21 Sep 2022 06:30:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD70810E846;
 Wed, 21 Sep 2022 06:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663741852; x=1695277852;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+kRihamCQtOE3B3nBN8XzQbSP30ODnlDjDIE7TfObxw=;
 b=JYlZD9jb90vl8NqmUjT1n0P637PZth7Z0g6vGML9ZkmKvuI+byb9ks7O
 uYrTjQ1cyPMQKJbJzOPd8OF2DS8tPW9tyLwcZUWDItxJ8uGDqQoUgWQaw
 UGMGD8XqTx8O/9HEPzdNZwSKD2VFZVwlhWgo7PFLkdqToyCa7V2n3/kww
 au7NbVFEH4ifvQRdrKytGyDlgeHMK49Oi1csC6n4sXxNI0EGGqq2atpFg
 15J1LhV99fh6aRdGFvsPGTIHNTvzJCyC7qp1RMFgSFyh5L2tW0LpB1xJz
 3Q4SLSQSr1WzxikLoifeY6jYllNMng5UqcxpeAMy3x9xRC7vnPjKCpYYh g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="298634026"
X-IronPort-AV: E=Sophos;i="5.93,332,1654585200"; d="scan'208";a="298634026"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2022 23:30:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,332,1654585200"; d="scan'208";a="864294886"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 20 Sep 2022 23:30:51 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 20 Sep 2022 23:30:51 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 20 Sep 2022 23:30:51 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 20 Sep 2022 23:30:51 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 20 Sep 2022 23:30:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hp2BRIwf/AJMblK4UGXa9WhTSHGNVxhQiBOFS5rOjVPaM1fmmXxVkO3XVciD57IczKDiCfJg8TWQ8mjw0XubaPXHtJ7+0u+K99BkJ0R4AMKpNBHxNFyU8rKgYjp9tQ5X73mgjgO/nyqWTeclbfS7vMpytIt0SS17bvapkByiqVIc13D6Kw3CjRX+kxC6vG/YpoTrnCiRw8oHyO5pRNNL1HYL93wWQ0tYLIYZ/YdXHPQHcFPtnMVlOvlb07mvuaJy+6MFXsebkH1ZiPxXfNu4E+UdqFZqetk2EHzlGdSY3yW0o8kOpiCRj3wMdE2516pOmxdVCrjug4MJ/K2SV8pCng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gymJa+rnssgsVHZN0Gx2LNd7bH5DqanxkG1KYdluuFo=;
 b=alTibr74K1CG7uFxGz2TywgCO7n7DkdGFD4qcGdpgZI6mSVLitg2RLNdeEZjK6moqcvuDKmz8aGyrLVsc7gF2nNlZtc6Gu9xtR203VS7Wpyjl4ga9HtA7T65B6RrzDDmkbAFjyQfNHZzfORKvycYFiObXMzPdp5qu4ir7Z9p6H7VIIBqjLsvBfYVZpbzyaHb2p9Bt5lIUJb5sd7P004gFS2Igxlj69VLP5TM/5uQUV9WgW0pJ2LT5fE5zdCmYaNuyOq2wCdcftE/6mCwgPee0cuL6u1Znr9D2i377jBSqRBnFkO5iei0iT63JGEOFGQftq4uw0fPU+w/gGN9QEX3xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by MN0PR11MB6085.namprd11.prod.outlook.com (2603:10b6:208:3cf::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Wed, 21 Sep
 2022 06:30:48 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::bde0:ec99:6d15:8763]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::bde0:ec99:6d15:8763%9]) with mapi id 15.20.5654.014; Wed, 21 Sep 2022
 06:30:48 +0000
Message-ID: <e5d340f9-848a-4bf8-29a3-2bbdbcf7ed4a@intel.com>
Date: Wed, 21 Sep 2022 12:00:38 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
Subject: Re: [Intel-gfx] [PATCH 1/1] drm/i915/mtl: enable local stolen memory
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20220920071940.3775059-1-aravind.iddamsetty@intel.com>
 <20220920083149.pfgk62ugajc7trth@ldmartin-desk2.lan>
 <20220920200512.pjjehlrebcr63uf2@ldmartin-desk2.lan>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <20220920200512.pjjehlrebcr63uf2@ldmartin-desk2.lan>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BMXPR01CA0088.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::28) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|MN0PR11MB6085:EE_
X-MS-Office365-Filtering-Correlation-Id: ec59e0d2-7fb7-4138-586f-08da9b9ad211
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WVx4FQuLktVLhPCvh7xiJwfg6+dnRwDhWjrzuuwnYyn9+wnQx0PwFCqYW8nZE1ym3ro8WNgSspQm57UYQjLPnSFgCJHSuQ9mAq0wJccT9QaH65uqA8PUBRvPJyxrFZisKUz8t1fxbVHKbZ82yHOVZJSaxP2D0fgkwubkKGvz5tf2YY0djwBjvft7RuaTpClAx90TcanXNQ8yDZu7HFyyKfRD5iSjYFkakAUbHZF7xGb2VQCuy+haZHEIKDKUO6xwVmLeWPryRy3QDJU5gGvmV/39N1MgQw0YozZk9z4sUETzCQ+st9s8tAsjtuNtM9TPNhFXu15vQ44Ggo9doYCftqdP5i/bJjZGePHZ/dS6mbzVOgRnZJXo0IZFXBHDLhBJ0gvzTJ57xuQJAozNJQYnNmXLHQdwAtTgrjtssq5N2eU2XukkbNzeVYEMSRVQP9s2TKu86SDgyz8Nu2S+fEHmWhRbgdhXE4yc6fOnkfy6ZDQBlfD24xtePmf0sDf16OKD2GqNwMkCkXFzs/59myJreIaDc11c77v5B4wgprfLQqAt6iev/HruwXfCR6UlkbRrKCteS/IEy0B7O32pTSOJPECVbXwjzdC/T89W/Yk9W+XVAVbNGMtXUILq8NQ/2wH8YKjgR87sCc4lR/7J9/fHzcJI9zW1RtJ58fiMglkBjkymUz/7PI2tTGETz2USBcOaCMZiup+XJcK0vA5SDVhM02u3mEKtl2ayhVJuFSghXas=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(376002)(39860400002)(136003)(346002)(396003)(451199015)(26005)(37006003)(478600001)(30864003)(86362001)(66476007)(6636002)(82960400001)(6506007)(31696002)(36756003)(966005)(66556008)(38100700002)(5660300002)(316002)(41300700001)(6666004)(450100002)(53546011)(186003)(8936002)(6486002)(31686004)(6512007)(83380400001)(4326008)(2906002)(8676002)(66946007)(2616005)(107886003)(6862004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b09VdzBMSWs1ZXpGcU8zaHRZTWdDQjByMUJ0amJ3MFhaM1NBa09OYTBDQVQ1?=
 =?utf-8?B?NVdwNUp2V3RhWEtySytZcHdVUk1GaEQrY2NwdCtvdHFqdzhYcktuWDJvQ0o1?=
 =?utf-8?B?czE5MW1NdEErUzkyZm5xTUhzbllyLzdKbDdUdXYwdWhVNTdaenI0dGdrUGU4?=
 =?utf-8?B?TldRaDhaK2tLbU9tb3ovaVI3eG5RYVQva3RCbTlsdnF4ZWRFWXJvb0w5YUhO?=
 =?utf-8?B?MGNjZDdaclpZTjQvTmwreTNzMnVDQnNpMytYNy9XY0dzRGZPMER4S2xIYnZ3?=
 =?utf-8?B?TGlJdTRvVnpJQkZTT0RuRkFBQmpaT3dIS05DYUtaZHQ4MDdjTEErMFFZUWty?=
 =?utf-8?B?RU5RZXFJcEp0KzNxa2EvK0JVRGxxNjFqN3d4amlwM3E1RmVBak1pTE9JK2ZE?=
 =?utf-8?B?K0sxd0VGNytFTFNiMFpwVjlnUXA1a2Qvbml1Nk5JeUVkaGhRbjNVR1JtNy91?=
 =?utf-8?B?WDE3aGhiUjBKTzZNMG52RFlkZy9HOUYyUWd0SUJRV2ZsSC93UGx3RU04WlVT?=
 =?utf-8?B?cllURk8wUHYySjRCc2M2YThIcUJuYUcvc09TTXpJczVTMTY5UlpWOVNDTzBU?=
 =?utf-8?B?NWp3d1hHODVMSUMxYkFqSGRxdUJaM1VPSm9SWFhwS1lGS0FGa0lmMkdUZGFM?=
 =?utf-8?B?OEMyV0ZIbjFxclRpRExabW9LaVRidDIxYXprK3dxYllqbnpZVmZEZ3NxR0VG?=
 =?utf-8?B?cWwzVGQ3R2RvTXptLy9tKzZSYWtzeFMrNVd0N2swelFDdGlEV1pySU0rZlhW?=
 =?utf-8?B?OEZhbGU2NFNtZWgxRU9ONS9kbUxHUWhCdjFiNUFKV1RLbW9uSmc3S3dXb1Vr?=
 =?utf-8?B?dzFTd1k0WStPZjEwSzYvY1htaWRIRzJSMFdTdUNGM3NqL2NaV1paZ0NpeWhq?=
 =?utf-8?B?V0tKZHZiVVlBT0g0SmJOQURiaW9YL2V2ZlFjdCsxdEFrWUdKci9PeUlKb3Y5?=
 =?utf-8?B?NGNvSSt6QzJBYVMvOGJyTlRsdlI5REEremhLM0FNS3VDdmVZMFp3enZLbHpB?=
 =?utf-8?B?UmxPK0hWeHBaMXBneUlEdFowOS83Q0NrV1B2KytLV0VlWVdiejUvWmZmQWtB?=
 =?utf-8?B?OEV5Mjd1bGZBRlFKQkd5VmNCd21ZQnpoV0pVSzRkcnBicTYzNGNhU1g5akdt?=
 =?utf-8?B?OU14YS9YUm04MjNteEFxVXkxN2JvOXdUektGWUYxb2VQUWJJa3dZWFgrdGdE?=
 =?utf-8?B?UkJ2NktuU05uNmUxZXNBcllJbGtFWWJDVWxRWS9pU0YybHYxMkNzWHExMjA3?=
 =?utf-8?B?ZEZPL2M1UnZ3YitZYTNnYkNIZ1ZuZGpxKzBaNHlFRVYwNVdSOHUxRlJZWE1G?=
 =?utf-8?B?RU90eFFxREVhSHArVTgwTzhxeG40NVFBcS85WVZYK0NrSDFzNExzL2IrV09O?=
 =?utf-8?B?VkRKenVXb3VuVzB2bEhRQzlUUmswUDU1Lzc3bGE2cFl6bUxkZmMrTUNncjJa?=
 =?utf-8?B?L1FuMFJIbVZXVXJHZldQaU4vQjV2Sm82VVdzSXdEU2ZSUU5wZE0xZk5INFBH?=
 =?utf-8?B?ZVRMQVhZOGdwZEd2bCtRNnR0REZBSFpUaXVXays5eTB6eVF4YjJtTDlaYjRH?=
 =?utf-8?B?V2hnTUlWWWVQMk5Tc3dCYVd3TDBIMFZJRjFhTnNDQmVoOFZaTG9GRjZDUXFm?=
 =?utf-8?B?T1J3YktiSmVHbXV4azBQUllHNVdTTDNCWTd0K0kybmg4dWZnN2QxV2c2allE?=
 =?utf-8?B?UDFhZFFuLzlobzZDbzFMNSsyYXE0bFg2RzNybEdRM1BtT3lvcDNxU2puN242?=
 =?utf-8?B?TmU4NGlNMEUyZ0VMOWNpYkswdmlZMVJoQWVTQ1Q3ZVNPR29lRitiaVhIUElY?=
 =?utf-8?B?a204SkdqOVh5MXVMaEE3Qk1iQ0hsNzBQeEFhQ1RCR3ZxSXZJRXc0T1g5bnVP?=
 =?utf-8?B?R2U0WFFXR2ZjTUcyZDZ4RitOcC8xQWozekNhUFpmQ0hQaE9jQjh1MHpGVWdz?=
 =?utf-8?B?bXM3SlBWOThOc1BXYXZCN2w1RXFXYTBqQkxXcW5sVVRoVExEOTg0WW1jRUxM?=
 =?utf-8?B?TDVjSDI5RkV5cytILzlCYTBSNk16c0lRQlRtSjVRRERyeVBoakZjTXBvU2Nz?=
 =?utf-8?B?STB3N2pGZWJRc3lIVXkrdjFUaGRiOVJnendFZ1JUd2RPdTFvdnF5YWZjRm5z?=
 =?utf-8?B?WU5qOVpzK1NITUhESlVRZXppc0R5dzJEbGFSV0w2VW4rWWhGRmo5aWJ4TDJh?=
 =?utf-8?B?Vnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ec59e0d2-7fb7-4138-586f-08da9b9ad211
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2022 06:30:48.1238 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pa6AoyLsib6eW/tC3NKCvL5BYHsgVkjHZhaCynwnqcbK/1HusrLybNvCUpwNCIONap9QJvWT8x/V2ocqpBch+kU/mG/G4z+WUx+/IOAYmkQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6085
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

replying here for earlier comments too.

On 21-09-2022 01:35, Lucas De Marchi wrote:
> On Tue, Sep 20, 2022 at 01:31:49AM -0700, Lucas De Marchi wrote:
>> On Tue, Sep 20, 2022 at 12:49:40PM +0530, Aravind Iddamsetty wrote:
>>> As an integrated GPU, MTL does not have local memory and
>>> HAS_LMEM() returns false.  However the platform's stolen memory
>>> is presented via BAR2 (i.e., the BAR we traditionally consider
>>> to be the LMEM BAR) and should be managed by the driver the same
>>> way that local memory is on dgpu platforms (which includes
>>> setting the "lmem" bit on page table entries).  We use the term
>>> "local stolen memory" to refer to this model.
>>>
>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>
>>> Signed-off-by: CQ Tang <cq.tang@intel.com>
>>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>> Original-author: CQ Tang
>>> ---
>>> drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 113 +++++++++++++++++----
>>> drivers/gpu/drm/i915/gt/intel_ggtt.c       |   2 +-
>>> drivers/gpu/drm/i915/i915_drv.h            |   3 +
>>> 3 files changed, 100 insertions(+), 18 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
>>> b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
>>> index acc561c0f0aa..bad5250fb764 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
>>> @@ -77,6 +77,19 @@ void i915_gem_stolen_remove_node(struct
>>> drm_i915_private *i915,
>>>     mutex_unlock(&i915->mm.stolen_lock);
>>> }
>>>
>>> +static bool is_dsm_invalid(struct drm_i915_private *i915, struct
>>> resource *dsm)
>>> +{
>>> +    if (!HAS_BAR2_SMEM_STOLEN(i915)) {
>>
>> I called a similar function as is_dsm_valid() in
>> https://patchwork.freedesktop.org/series/108620/
>>
>> sounds weird  with "invalid" and the double negation on return early
>> style.

sure, will change it hope i can use that from your patch.
>>
>>> +        if (dsm->start == 0)
>>> +            return true;
>>> +    }
>>> +
>>> +    if (dsm->end <= dsm->start)
>>> +        return true;
>>> +
>>> +    return false;
>>> +}
>>> +
>>> static int i915_adjust_stolen(struct drm_i915_private *i915,
>>>                   struct resource *dsm)
>>> {
>>> @@ -84,7 +97,7 @@ static int i915_adjust_stolen(struct
>>> drm_i915_private *i915,
>>>     struct intel_uncore *uncore = ggtt->vm.gt->uncore;
>>>     struct resource *r;
>>>
>>> -    if (dsm->start == 0 || dsm->end <= dsm->start)
>>> +    if (is_dsm_invalid(i915, dsm))
>>>         return -EINVAL;
>>>
>>>     /*
>>> @@ -136,7 +149,7 @@ static int i915_adjust_stolen(struct
>>> drm_i915_private *i915,
>>>      * overlaps with the non-stolen system memory range, since lmem
>>> is local
>>>      * to the gpu.
>>>      */
>>> -    if (HAS_LMEM(i915))
>>> +    if (HAS_LMEM(i915) || HAS_BAR2_SMEM_STOLEN(i915))
>>
>> comment above makes no sense when you add this.  For this specific case
>> it's still system memory, reserved by the BIOS and that we access by
>> mapping the lmembar

thanks for catching this.
>>
>>>         return 0;
>>>
>>>     /*
>>> @@ -371,8 +384,6 @@ static void icl_get_stolen_reserved(struct
>>> drm_i915_private *i915,
>>>
>>>     drm_dbg(&i915->drm, "GEN6_STOLEN_RESERVED = 0x%016llx\n", reg_val);
>>>
>>> -    *base = reg_val & GEN11_STOLEN_RESERVED_ADDR_MASK;
>>> -
>>>     switch (reg_val & GEN8_STOLEN_RESERVED_SIZE_MASK) {
>>>     case GEN8_STOLEN_RESERVED_1M:
>>>         *size = 1024 * 1024;
>>> @@ -390,6 +401,12 @@ static void icl_get_stolen_reserved(struct
>>> drm_i915_private *i915,
>>>         *size = 8 * 1024 * 1024;
>>>         MISSING_CASE(reg_val & GEN8_STOLEN_RESERVED_SIZE_MASK);
>>>     }
>>> +
>>> +    if ((GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70)) && !IS_DGFX(i915))
>>> +        /* the base is initialized to stolen top so subtract size to
>>> get base */
>>> +        *base -= *size;
>>
>> that doesn't necessarily holds true.  According to the spec the wopcm
>> base is 1MB aligned so even if it is "at the top", it may not mean it
>> is at the
>> very very top that we can just subtract the size.

well here the reserved_base is not to the top of the BAR, we got the
stolen size from GGC register so base is initialized to end of that
stolen size. hence we subtract the reserved size from it.

>>
>>
>>> +    else
>>> +        *base = reg_val & GEN11_STOLEN_RESERVED_ADDR_MASK;
>>> }
>>>
>>> static int i915_gem_init_stolen(struct intel_memory_region *mem)
>>> @@ -423,8 +440,7 @@ static int i915_gem_init_stolen(struct
>>> intel_memory_region *mem)
>>>     if (i915_adjust_stolen(i915, &i915->dsm))
>>>         return 0;
>>>
>>> -    GEM_BUG_ON(i915->dsm.start == 0);
>>> -    GEM_BUG_ON(i915->dsm.end <= i915->dsm.start);
>>> +    GEM_BUG_ON(is_dsm_invalid(i915, &i915->dsm));
>>>
>>>     stolen_top = i915->dsm.end + 1;
>>>     reserved_base = stolen_top;
>>> @@ -796,6 +812,46 @@ static const struct intel_memory_region_ops
>>> i915_region_stolen_lmem_ops = {
>>>     .init_object = _i915_gem_object_stolen_init,
>>> };
>>>
>>> +static int get_mtl_gms_size(struct intel_uncore *uncore)
>>> +{
>>> +    u16 ggc, gms;
>>> +
>>> +    ggc = intel_uncore_read16(uncore, _MMIO(0x108040));
>>
>> ??
>>
>>> +
>>> +    /* check GGMS, should be fixed 0x3 (8MB) */
>>> +    if ((ggc & 0xc0) != 0xc0)
>>> +        return -EIO;
>>> +
>>> +    /* return valid GMS value, -EIO if invalid */
>>> +    gms = ggc >> 8;
>>> +    switch (gms) {
>>> +    case 0x0 ... 0x10:
>>> +        return gms * 32;
>>> +    case 0x20:
>>> +        return 1024;
>>> +    case 0x30:
>>> +        return 1536;
>>> +    case 0x40:
>>> +        return 2048;
>>> +    case 0xf0 ... 0xfe:
>>> +        return (gms - 0xf0 + 1) * 4;
>>> +    default:
>>> +        return -EIO;
>>> +    }
>>> +}
>>> +
>>> +static inline bool lmembar_is_igpu_stolen(struct drm_i915_private
>>> *i915)
>>
>> doesn't deserve an inline. lmembar_is_igpu_stolen() doesn't make much
>> sense as the lmembar is never igpu stolen.... you probably mean
>> something else here
here the intent was to check the second BAR which is traditionally LMEM
is to be considered STOLEN, if the memory regions consists STOLEN_LMEM
and not LMEM. But I think i can rather replace this entire function and
just use HAS_LMEM check.
>>
>>> +{
>>> +    u32 regions = RUNTIME_INFO(i915)->memory_regions;
>>> +
>>> +    if (regions & REGION_LMEM)
>>> +        return false;
>>> +
>>> +    drm_WARN_ON(&i915->drm, (regions & REGION_STOLEN_LMEM) == 0);
>>> +
>>> +    return true;
>>> +}
>>> +
>>> struct intel_memory_region *
>>> i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
>>>                u16 instance)
>>> @@ -806,19 +862,16 @@ i915_gem_stolen_lmem_setup(struct
>>> drm_i915_private *i915, u16 type,
>>>     struct intel_memory_region *mem;
>>>     resource_size_t io_start, io_size;
>>>     resource_size_t min_page_size;
>>> +    int ret;
>>>
>>>     if (WARN_ON_ONCE(instance))
>>>         return ERR_PTR(-ENODEV);
>>>
>>> -    if (!i915_pci_resource_valid(pdev, GEN12_LMEM_BAR))
>>> +    if (!i915_pci_resource_valid(pdev, GFXMEM_BAR))
>>
>> at least for MTL, Bspec 63830 still calls this lmembar. So the rename
>> for me is a net loss
that is right, will revert this.
>>
>>>         return ERR_PTR(-ENXIO);
>>>
>>> -    /* Use DSM base address instead for stolen memory */
>>> -    dsm_base = intel_uncore_read64(uncore, GEN12_DSMBASE);
>>> -    if (IS_DG1(uncore->i915)) {
>>> -        lmem_size = pci_resource_len(pdev, GEN12_LMEM_BAR);
>>> -        if (WARN_ON(lmem_size < dsm_base))
>>> -            return ERR_PTR(-ENODEV);
>>> +    if (lmembar_is_igpu_stolen(i915) || IS_DG1(i915)) {
>>> +        lmem_size = pci_resource_len(pdev, GFXMEM_BAR);
>>
>> this looks confusing, but apparently correct. For DG1 the stolen is
>> on top of lmem. For MTL, it's on the end of lmembar (256M). This works
>> because on DG1 aperture == lmem size.
>>
>>>     } else {
>>>         resource_size_t lmem_range;
>>>
>>> @@ -827,13 +880,39 @@ i915_gem_stolen_lmem_setup(struct
>>> drm_i915_private *i915, u16 type,
>>>         lmem_size *= SZ_1G;
>>>     }
>>>
>>> -    dsm_size = lmem_size - dsm_base;
>>> -    if (pci_resource_len(pdev, GEN12_LMEM_BAR) < lmem_size) {
>>> +    if (HAS_BAR2_SMEM_STOLEN(i915)) {
>>> +        /*
>>> +         * MTL dsm size is in GGC register, not the bar size.
>>
>> it's not exclusive to MTL. it has been there for ages and it was never
>> the BAR size like this comment says. Or at least it doesn't match the
>> else condition that is using the GEN12_DSMBASE register
>>
>>> +         * also MTL uses offset to DSMBASE in ptes, so i915
>>> +         * uses dsm_base = 0 to setup stolen region.
>>> +         */
>>> +        ret = get_mtl_gms_size(uncore);
>>> +        if (ret < 0) {
>>> +            drm_err(&i915->drm, "invalid MTL GGC register setting\n");
>>> +            return ERR_PTR(ret);
>>> +        }
>>> +
>>> +        dsm_base = 0;
>>
>> if we stop handling part of the values in the registers as relative to
>> the mapping and rather handle them as we read from the registers
>> (physical addresses), the size calculations should still match and we
>> shouldn't need all the if/else dance. If we pass the right io_start we
>> can then make them relative to the mapping by subtracting it, or if we
>> don't want GTT to be in the mapping we subtract it.
>>
>> That makes me wonder if choosing the i915_gem_stolen_lmem_setup() for
>> all of this is even the right choice given we are actually talking about
>> system memory that is mapped through the lmembar.
> 
> 
> another approach could be:  handle the several coding style issues,
> function names etc. Since this works for MTL, it's better than the
> hypothetical solution that is not written and may not work well. I may
> have missed something in my analysis. So I'd be fine to go with improved
> version of this patch, and I can add to my todo list to try to clean
> this up later.

Thanks for that.

> 
> Lucas De Marchi
> 
> 
>>
>>> +        dsm_size = (resource_size_t)(ret * SZ_1M);
>>> +
>>> +        GEM_BUG_ON(pci_resource_len(pdev, GFXMEM_BAR) != 256 * SZ_1M);
>>> +        GEM_BUG_ON((dsm_size + 8 * SZ_1M) > lmem_size);
>>> +    } else {
>>> +        /* Use DSM base address instead for stolen memory */
>>> +        dsm_base = intel_uncore_read64(uncore, GEN12_DSMBASE);
>>> +        if (WARN_ON(lmem_size < dsm_base))
>>> +            return ERR_PTR(-ENODEV);
>>> +        dsm_size = lmem_size - dsm_base;
>>> +    }
>>> +
>>> +    io_size = dsm_size;
>>> +    if (pci_resource_len(pdev, GFXMEM_BAR) < dsm_size) {
>>>         io_start = 0;
>>>         io_size = 0;
>>> +    } else if (HAS_BAR2_SMEM_STOLEN(i915)) {
>>> +        io_start = pci_resource_start(pdev, GFXMEM_BAR) + 8 * SZ_1M;
>>
>> should be the GGSM?
make sense can be derived from GGC registered.

Thanks,
Aravind.
>>
>>
>> Lucas De Marchi
>>
>>>     } else {
>>> -        io_start = pci_resource_start(pdev, GEN12_LMEM_BAR) + dsm_base;
>>> -        io_size = dsm_size;
>>> +        io_start = pci_resource_start(pdev, GFXMEM_BAR) + dsm_base;
>>>     }
>>>
>>>     min_page_size = HAS_64K_PAGES(i915) ? I915_GTT_PAGE_SIZE_64K :
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c
>>> b/drivers/gpu/drm/i915/gt/intel_ggtt.c
>>> index 30cf5c3369d9..b31fe0fb013f 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
>>> @@ -931,7 +931,7 @@ static int gen8_gmch_probe(struct i915_ggtt *ggtt)
>>>     unsigned int size;
>>>     u16 snb_gmch_ctl;
>>>
>>> -    if (!HAS_LMEM(i915)) {
>>> +    if (!HAS_LMEM(i915) && !HAS_BAR2_SMEM_STOLEN(i915)) {
>>>         if (!i915_pci_resource_valid(pdev, GTT_APERTURE_BAR))
>>>             return -ENXIO;
>>>
>>> diff --git a/drivers/gpu/drm/i915/i915_drv.h
>>> b/drivers/gpu/drm/i915/i915_drv.h
>>> index 134fc1621821..ef3120322077 100644
>>> --- a/drivers/gpu/drm/i915/i915_drv.h
>>> +++ b/drivers/gpu/drm/i915/i915_drv.h
>>> @@ -973,6 +973,9 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>>>
>>> #define HAS_ONE_EU_PER_FUSE_BIT(i915)   
>>> (INTEL_INFO(i915)->has_one_eu_per_fuse_bit)
>>>
>>> +#define HAS_BAR2_SMEM_STOLEN(i915) (!HAS_LMEM(i915) && \
>>> +                    GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70))
>>> +
>>> /* intel_device_info.c */
>>> static inline struct intel_device_info *
>>> mkwrite_device_info(struct drm_i915_private *dev_priv)
>>> -- 
>>> 2.25.1
>>>
