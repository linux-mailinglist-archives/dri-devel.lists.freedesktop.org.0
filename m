Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6B1634A43
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 23:50:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D591310E360;
	Tue, 22 Nov 2022 22:50:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 749F910E0CB;
 Tue, 22 Nov 2022 22:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669157434; x=1700693434;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uE6ZC1v/LowaSUIf+Pt+FPmhQWERUncLwZ4Ox8HU4To=;
 b=fwKrv2ahjxQVU3qqifzmArrqdJ1isolgGIDva2mQ3tcSxGxaOq4aV920
 wkFzq+gtPsCLJCtxEE+mC3IZy7H0tsI0dMqcWrlYA3tGlXtOI8CBiYLbe
 gAiZgRkVWvLFI7fhW+FGrzyJdnIX86Ngq2543RCE60Pe5qqvramG8dFk+
 Rs8pVDihQfjlgzv581qfA2RwNVRnKpb9kPDL7ZduZCDKuClTStO8UL/RR
 VHTR+6Oo4jwmqsyQ6yjJZYgqIP6uVOiiT6+g9Iz/2q/ZwKEBDyDYocDU0
 skAP8oIgh8RLgL5/3SaUS2NZCupM93Q86NkveRuuI0RY6Y50WKS0qB6DA g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="340805611"
X-IronPort-AV: E=Sophos;i="5.96,185,1665471600"; d="scan'208";a="340805611"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2022 14:50:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="641576366"
X-IronPort-AV: E=Sophos;i="5.96,185,1665471600"; d="scan'208";a="641576366"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP; 22 Nov 2022 14:50:21 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 22 Nov 2022 14:50:21 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 22 Nov 2022 14:50:21 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 22 Nov 2022 14:50:21 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 22 Nov 2022 14:50:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iPvwvSqgKsoCz5KOWDGrdOUJ/ZGQsDG1KfbTROoH2gAvf3ZgJwqD2B25RsjWBF9itxCXOsIHU4RCkne48ENHph8JYgW1h5zG5BPfB/j+a33jZHeC6lbYrewVLd23Pl6A1dh6gY1oAfPFNlvUY9uqBpn61cXVwGImIEaXwc2DhhQ0hQTlcyU1eoKBcnnz2mVcpa8W7L/0GJYLAEpypsSFzHNVr1LIa41Bj8JeGBj23IAXWk0ex3Y4f2zGKdZdMdEE6ScjK3xMs69OmUs7PJr/XJdcrCGP6Gg/yFziAtExGzAsvbC3QW0rAZ5w41vA4nru+bFzXD5zhxEXP6n8LCnndA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u8P4TMrgUmxK9gCumi9yfnlE2mMHWARCpszrnzIM7CA=;
 b=MNDghaw9gErKIqslH1PLbJh85aVz5GMj/nAi8rwoWHAVSYWT36lsNd9WBf/iFNLdLVXir5lTQleNX4s6STH+GZl+zqL6AKXQnM9bJ3QLH0ts+vnhpSgY/7EQ+dF0OFWkGYFnu2cR7tMdKwr13/my5ndy+rZzW88sTmUpWnySzPfhAd8Y9sRaX9/tDQupHa4qjZwZoqWzAm+nkf2psiOdA18oTTAcfF5yEBfF9kvzKLv1+281F8bEXUA2CfP01FqCNoEK5tvvBRN73DtZRD/SFAq6NLUnuwmQP35l/oIFFOW8BydwPLhzo+6uzZ1Y8tOitecruhz/QRAIrhAoK5dxog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 PH8PR11MB7094.namprd11.prod.outlook.com (2603:10b6:510:216::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Tue, 22 Nov
 2022 22:50:19 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::f7a8:6d03:2464:2afd]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::f7a8:6d03:2464:2afd%5]) with mapi id 15.20.5834.009; Tue, 22 Nov 2022
 22:50:19 +0000
Message-ID: <243c6524-c6d4-40c1-4363-0d2db45cf066@intel.com>
Date: Tue, 22 Nov 2022 14:50:17 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [Intel-gfx] [PATCH 4/6] drm/i915/gsc: Do a driver-FLR on unload
 if GSC was loaded
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20221121231617.1110329-1-daniele.ceraolospurio@intel.com>
 <20221121231617.1110329-5-daniele.ceraolospurio@intel.com>
 <Y301LJvlfcUh7ADn@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <Y301LJvlfcUh7ADn@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR21CA0002.namprd21.prod.outlook.com
 (2603:10b6:a03:114::12) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|PH8PR11MB7094:EE_
X-MS-Office365-Filtering-Correlation-Id: e02ba2b8-d264-4df4-2223-08daccdbedfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AWkz8v9cWa+X7xkqSkVzgNVV8yt74kV7P7RXehXUPYYpG/7KnZT986R0rgws4hX/wtOB6RrR6CNLam6YEWPfOIhe6pdeKPynpWF2lMveZc9qd9uXihWEmrYjl5PiOsPbcuTzrAsKOpbsduDOy7MgvdSHienQrtSPF0lIeiD14raaH30FfwJOOycLK3VJDlNIj2+pQMiDufVWP1Wx1yALmacsfw9M+i5mIrrU2bIkFaEC3xJxjNWqCoqhEbWiSyyXWZJGC6JtuPtK40VIUUz2sfnkmKIUNl6x1i5j096t1cQquyz0R+4hMIDhJawN3DV4h6lQOQlWDjuJs2q7N5W5/Lrw3XfOembgcKa2n/tWfwffvwpJtCP0SxpO8JoMO6NCVDYr51p5Rq6oykAJIh7hvgXJtAB99a+nw2cNPuU8cp/ziR80sF4167SIwIwOkykCWoZofiZk6AzrNQrBiv9C2Wn7ZUXnhWtnWcfP9s9MvLga5P2xYZrc7E5gEIEgCkznfrbx2npJa/WIFibf68jIVAAYaWKZ2qmxkm8GXWBwatA7s2b0C1Z13lpcat2fqk6NF8ZrnGp4IBWFsuNSwL+1eTu4zoKcUC9sJKbill/LYJ1xyR+EbhQbAdpiD15Bpb9NkPW54AZhL1JoNl8j4Ka0x+tLF01PHsAcnWwPLS2YF/WVmRQxISkM3E0LStWc7/fu2ZIrq6IigAxCjZcDmwKaViZuryguF/KOY3eNg8uBuDM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(376002)(366004)(346002)(136003)(39860400002)(451199015)(478600001)(4326008)(6486002)(36756003)(66476007)(37006003)(8676002)(41300700001)(82960400001)(38100700002)(66556008)(66946007)(6636002)(316002)(186003)(2616005)(83380400001)(6506007)(31696002)(6512007)(26005)(86362001)(53546011)(2906002)(31686004)(450100002)(8936002)(6862004)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SlozbVdVM2JFbWJiWS9Wd005T1FxQUVrYkN4K1QzSWVNVE0xeVhFNVNUTFhy?=
 =?utf-8?B?VmdyWHdSVzdUbE80Mkk5UUtHWHo3Q2xINkw0MXZvOXZJUWorblppZE9iYWV6?=
 =?utf-8?B?SXVUMlNkQ2gveVRvYWcxQlhieGZOQUYrQ3I5L3VwWFdQVjlXa2pnZ3E2eHR2?=
 =?utf-8?B?ZG5rUzIwWlc1N1E3REVZUTUxRTI4d0pnV0hRY0JyRUF5VFhBQTI0QlJpdHdD?=
 =?utf-8?B?VC80eVpHckxYaTJOL3NnaWx0ZWhnK1BOT0hPRGwrM1ZseGluVVlrWjd6TU1D?=
 =?utf-8?B?TkU2aG1XYUdBNnJCTDliWWxqSVZnU1hOVW5xeTVhSGs2Mm9VcDFVQ3Z2Q3VC?=
 =?utf-8?B?WWR4MGRxSC9KM0F2WmhZdFhIK1c3cjd2Rkg0VVBvK0JoUW85TzRWV2lJS2sz?=
 =?utf-8?B?THpzQ1FWUTF2UzZZRURvSU5jT2FZUXcxdXlnQmNUd0NUMUtIajMwSTgrZDV6?=
 =?utf-8?B?WklLelU3WUlORTU0Q25VRVI2NmVmMnJFbWsrUUZJSmRjRkpEbHdLcnpXS3gv?=
 =?utf-8?B?d29CVkZoblNhUmVBVWQrNnovR21GYjFic0UrNjQwTGVTU2VraWxQMTdQdGFh?=
 =?utf-8?B?RkxsUU8zdWdYZ2dnOXRneDRZL3JxQy9PcEN6SGtjQ2pmQkk4UmdlSUR5eVp5?=
 =?utf-8?B?RVV4Zys5ZTlOZkplNURSWUF1aTAwd2l1czk1a2gzWGRTbXY2QmNNZTFoekhv?=
 =?utf-8?B?VEl4NFRpVmpSSkUrbmtGeVRIRkhUZTBzNzJEUDgxVlJJdDladlVyL3ZxWGlF?=
 =?utf-8?B?V3JTUEVuKy9BMTdxQUV0d0lmU2F5a1ZibG5RY1dnajkzMUtHTVZvYzhqNnEx?=
 =?utf-8?B?RmY4dkZ5eGt5S21lQnlKQXhydmJXRG5pQ3JldHU0NnZEMStyQ1hMYXNKNUNK?=
 =?utf-8?B?akhvOUFWT29mUkxZNWwwQzVmKzhaVC9NOVhCNzZHQ1YweHorYlFZZlpFZXc1?=
 =?utf-8?B?MHBCUmxuSnRZb2VSam5IaS96RlM4cGFybE1lblcrRVE0UlVUUWJNRmtWNVBt?=
 =?utf-8?B?NkpVQWU0SnBzb2RQM3pUVzkxb1didlBiM0YwaDhLWmtnOHpxcmhza1hvVXhn?=
 =?utf-8?B?Qm9ySUlNcTk2RmhkZkpJN01pdU9KQVFIeUdKRW11MFRWYlo3VkpLT3UvSG5Z?=
 =?utf-8?B?aHdRb2lXUSt4SFlaSU5CTmRBTUd5L1BDRGlqcG9zemJ1ZWpQdm1LeUJ2WDBx?=
 =?utf-8?B?UnBQcFpjR1FGbTZkbXJmSDdaSmZYODMyRGVEekRVN3ROUzB3c29VTzRwUTRa?=
 =?utf-8?B?aFpTRUNBa1J5ZnJRb0dxQnNwT1hZcU90YzV6RXNTNmRUMHVEdjBFdGZvUmR4?=
 =?utf-8?B?NEFHM0M1NXRadWttanZRNzlzNGtKSkFON3huNTU4SFN2NnBXODF6ckJpL05r?=
 =?utf-8?B?M2FvOHZwY0kvY0sweTI3ZjJBRmpWVElTVC9FM1cwZjN0dWtKQ3pmZjlVU2pr?=
 =?utf-8?B?Q1VqMTMvdUhnRFBQMDlqc1pZQ2hEUU9EUFE0eS9TTENpcWhnazdKanF1NVFa?=
 =?utf-8?B?VmdCeVFEcHQ3TXJ6anRKUE03OVFDOEVKQ2srdmREaVZHOUtjQmdORXdHRTBW?=
 =?utf-8?B?MFZpTU1oeGc3MHNGZ2lpWGxvTXJsR2tWWmxQUVJyMnRKOXlEMnM3YlNMdzNV?=
 =?utf-8?B?UVBraWF6czJoY0N5bXNZaVhxbHJTYTJLa3I3TVB4UXgzVmcrckRLV1BIT00r?=
 =?utf-8?B?dGllNDNpUDUvMXJmNjI3QU5BKzJtVzVMVVNxTVJuWTJBSENXUWNEKzVZa0xR?=
 =?utf-8?B?UWdhNnFjaEtPWGJpMzhzUHlZUll0MUM2ZVI4SWxBQTA3TXNsaHBmVHNVN0tS?=
 =?utf-8?B?Z3hET3dXMy9RWEJmNVdWS3d5VWpoZks3azRhUklpZnMvajVEVG4vVlNTU1l4?=
 =?utf-8?B?cFl5QmVTLzdkZFM4Wkp4UTJLQjB2V3BVRDB4bUZyZE9xc1pIUFZwaUsvVWc2?=
 =?utf-8?B?aWI4V2h6WjAvWHlYN0xPRWlwcEt2NVArQzhoN2xidWY1MW0rZitBVjFhSDVm?=
 =?utf-8?B?dmowRUFaQmFqOFQvZHNWa2FzWFBaQTlDOGRhVWlLWXBpeGtqU1FPNmhKczQw?=
 =?utf-8?B?ZkxGSXozQ3VWSlFWOURLZHI3b1l0WVJENG9jbHhuekZTNTYzeEhkTmFoMEJR?=
 =?utf-8?B?V083aitKM3JOTC9MSDJUdW9vbmRwSmw2R04vRUlvbDVTRHZQeUtIdzZGN1lp?=
 =?utf-8?Q?f5awxRFDr67VOD8DvVK7Kig=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e02ba2b8-d264-4df4-2223-08daccdbedfc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 22:50:19.0849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /IYt4HeJgu7OCKMSauEMi1AyFC+geoeDaAf/BSLwdk2JWcI9mHYni3SAscE8sjOp8Bwg3f+Px2NmjZKu/3XQfhpA4eMF8jR4XYZrteibkys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7094
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/22/2022 12:46 PM, Rodrigo Vivi wrote:
> On Mon, Nov 21, 2022 at 03:16:15PM -0800, Daniele Ceraolo Spurio wrote:
>> If the GSC was loaded, the only way to stop it during the driver unload
>> flow is to do a driver-FLR.
>> The driver-FLR is not the same as PCI config space FLR in that
>> it doesn't reset the SGUnit and doesn't modify the PCI config
>> space. Thus, it doesn't require a re-enumeration of the PCI BARs.
>> However, the driver-FLR does cause a memory wipe of graphics memory
>> on all discrete GPU platforms or a wipe limited to stolen memory
>> on the integrated GPU platforms.
> Nothing major or blocking, but a few thoughts:
>
> 1. Should we document this in the code, at least in a comment in the
> flr function?

Sure, I'll add it in

> 2. Should we call this driver_initiated_flr, aiming to reduce even more
> the ambiguity of it?

ok

>
>> We perform the FLR as the last action before releasing the MMIO bar, so
>> that we don't have to care about the consequences of the reset on the
>> unload flow.
> 3. should we try to implement this already in the gt_reset case as the
> last resrouce before wedging the gt? So we can already test this flow
> in the current platforms?

This would be nice to have, but very complicated to implement. The fact 
that FLR kills everything on the system, including resetting display and 
wiping LMEM, means that we would need a new recovery path to 
re-initialize all components. There are also potential questions on how 
to handle LMEM: do we try to migrate it to SMEM before triggering the 
FLR (potentially via CPU memcpy if the GT is dead), or do we just let it 
get wiped?

The reason why I wanted the FLR to be the very last thing before 
releasing MMIO access was exactly to not have to care about the recovery 
path ;)

Daniele

>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c |  9 +++++
>>   drivers/gpu/drm/i915/i915_reg.h           |  3 ++
>>   drivers/gpu/drm/i915/intel_uncore.c       | 45 +++++++++++++++++++++++
>>   drivers/gpu/drm/i915/intel_uncore.h       | 13 +++++++
>>   4 files changed, 70 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
>> index 510fb47193ec..5dad3c19c445 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
>> @@ -173,6 +173,15 @@ int intel_gsc_fw_upload(struct intel_gsc_uc *gsc)
>>   	if (err)
>>   		goto fail;
>>   
>> +	/*
>> +	 * Once the GSC FW is loaded, the only way to kill it on driver unload
>> +	 * is to do a driver FLR. Given this is a very disruptive action, we
>> +	 * want to do it as the last action before releasing the access to the
>> +	 * MMIO bar, which means we need to do it as part of the primary uncore
>> +	 * cleanup.
>> +	 */
>> +	intel_uncore_set_flr_on_fini(&gt->i915->uncore);
>> +
>>   	/* FW is not fully operational until we enable SW proxy */
>>   	intel_uc_fw_change_status(gsc_fw, INTEL_UC_FIRMWARE_TRANSFERRED);
>>   
>> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
>> index 8e1892d14774..60e55245200b 100644
>> --- a/drivers/gpu/drm/i915/i915_reg.h
>> +++ b/drivers/gpu/drm/i915/i915_reg.h
>> @@ -118,6 +118,9 @@
>>   
>>   #define GU_CNTL				_MMIO(0x101010)
>>   #define   LMEM_INIT			REG_BIT(7)
>> +#define   DRIVERFLR			REG_BIT(31)
>> +#define GU_DEBUG			_MMIO(0x101018)
>> +#define   DRIVERFLR_STATUS		REG_BIT(31)
>>   
>>   #define GEN6_STOLEN_RESERVED		_MMIO(0x1082C0)
>>   #define GEN6_STOLEN_RESERVED_ADDR_MASK	(0xFFF << 20)
>> diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
>> index 8006a6c61466..c1befa33ff59 100644
>> --- a/drivers/gpu/drm/i915/intel_uncore.c
>> +++ b/drivers/gpu/drm/i915/intel_uncore.c
>> @@ -2703,6 +2703,48 @@ void intel_uncore_prune_engine_fw_domains(struct intel_uncore *uncore,
>>   	}
>>   }
>>   
>> +static void driver_flr(struct intel_uncore *uncore)
>> +{
>> +	struct drm_i915_private *i915 = uncore->i915;
>> +	const unsigned int flr_timeout_ms = 3000; /* specs recommend a 3s wait */
>> +	int ret;
>> +
>> +	drm_dbg(&i915->drm, "Triggering Driver-FLR\n");
>> +
>> +	/*
>> +	 * Make sure any pending FLR requests have cleared by waiting for the
>> +	 * FLR trigger bit to go to zero. Also clear GU_DEBUG's DRIVERFLR_STATUS
>> +	 * to make sure it's not still set from a prior attempt (it's a write to
>> +	 * clear bit).
>> +	 * Note that we should never be in a situation where a previous attempt
>> +	 * is still pending (unless the HW is totally dead), but better to be
>> +	 * safe in case something unexpected happens
>> +	 */
>> +	ret = intel_wait_for_register_fw(uncore, GU_CNTL, DRIVERFLR, 0, flr_timeout_ms);
>> +	if (ret) {
>> +		drm_err(&i915->drm,
>> +			"Failed to wait for Driver-FLR bit to clear! %d\n",
>> +			ret);
>> +		return;
>> +	}
>> +	intel_uncore_write_fw(uncore, GU_DEBUG, DRIVERFLR_STATUS);
>> +
>> +	/* Trigger the actual Driver-FLR */
>> +	intel_uncore_rmw_fw(uncore, GU_CNTL, 0, DRIVERFLR);
>> +
>> +	ret = intel_wait_for_register_fw(uncore, GU_DEBUG,
>> +					 DRIVERFLR_STATUS, DRIVERFLR_STATUS,
>> +					 flr_timeout_ms);
>> +	if (ret) {
>> +		drm_err(&i915->drm, "wait for Driver-FLR completion failed! %d\n", ret);
>> +		return;
>> +	}
>> +
>> +	intel_uncore_write_fw(uncore, GU_DEBUG, DRIVERFLR_STATUS);
>> +
>> +	return;
>> +}
>> +
>>   /* Called via drm-managed action */
>>   void intel_uncore_fini_mmio(struct drm_device *dev, void *data)
>>   {
>> @@ -2716,6 +2758,9 @@ void intel_uncore_fini_mmio(struct drm_device *dev, void *data)
>>   		intel_uncore_fw_domains_fini(uncore);
>>   		iosf_mbi_punit_release();
>>   	}
>> +
>> +	if (intel_uncore_needs_flr_on_fini(uncore))
>> +		driver_flr(uncore);
>>   }
>>   
>>   /**
>> diff --git a/drivers/gpu/drm/i915/intel_uncore.h b/drivers/gpu/drm/i915/intel_uncore.h
>> index 5449146a0624..a9fa0b11e7e4 100644
>> --- a/drivers/gpu/drm/i915/intel_uncore.h
>> +++ b/drivers/gpu/drm/i915/intel_uncore.h
>> @@ -153,6 +153,7 @@ struct intel_uncore {
>>   #define UNCORE_HAS_FPGA_DBG_UNCLAIMED	BIT(1)
>>   #define UNCORE_HAS_DBG_UNCLAIMED	BIT(2)
>>   #define UNCORE_HAS_FIFO			BIT(3)
>> +#define UNCORE_NEEDS_FLR_ON_FINI	BIT(3)
>>   
>>   	const struct intel_forcewake_range *fw_domains_table;
>>   	unsigned int fw_domains_table_entries;
>> @@ -223,6 +224,18 @@ intel_uncore_has_fifo(const struct intel_uncore *uncore)
>>   	return uncore->flags & UNCORE_HAS_FIFO;
>>   }
>>   
>> +static inline bool
>> +intel_uncore_needs_flr_on_fini(const struct intel_uncore *uncore)
>> +{
>> +	return uncore->flags & UNCORE_NEEDS_FLR_ON_FINI;
>> +}
>> +
>> +static inline bool
>> +intel_uncore_set_flr_on_fini(struct intel_uncore *uncore)
>> +{
>> +	return uncore->flags |= UNCORE_NEEDS_FLR_ON_FINI;
>> +}
>> +
>>   void intel_uncore_mmio_debug_init_early(struct drm_i915_private *i915);
>>   void intel_uncore_init_early(struct intel_uncore *uncore,
>>   			     struct intel_gt *gt);
>> -- 
>> 2.37.3
>>

