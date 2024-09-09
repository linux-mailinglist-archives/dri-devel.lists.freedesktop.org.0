Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E15A6971ECC
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 18:10:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50A1A10E5D2;
	Mon,  9 Sep 2024 16:10:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cy37iixs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B09010E5D1;
 Mon,  9 Sep 2024 16:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725898239; x=1757434239;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=msmOi+wrMtsPk1YDY1+QA/njjMkIqgh3AV8vjIG6lW4=;
 b=cy37iixs9jd61ZE7WHo261zkE3YscjaJDadc1IGxJeIQ1Z+Ftzwg/ZdX
 M02qyR+u8IuJzOJ6Hg7I4cph0fw4zqK132IUCoV++Asz0bz1VlarXCbFq
 4nKwKtGkba151/jHS52hzDFMSLZ7zi35NZKtraeXMd58Kt2I3mG1XjkVn
 LgubN9yAd5BP7m8aiAYNORYZM2TRSZQuvU/4jSBDIAGxPAhvjwBYCgAT+
 5w2pcw1k8uDMS6rHoN4wLSeXGfDxZPRg+Ug8aytW5z/c1rsOWYgWAI7sS
 Q06VaMdDNgHUSgyoX4M+D9lBHc/LMIUaMiRY5y8YcN8H3aUQj3lW4+zNa A==;
X-CSE-ConnectionGUID: oiOJXFhgRjaxQ6unlbxR0A==
X-CSE-MsgGUID: z8XIpPEnSgqv+BgVnTaDVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24716557"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; d="scan'208";a="24716557"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 09:10:39 -0700
X-CSE-ConnectionGUID: Hmmi/057R7mEnIy3Vewj2A==
X-CSE-MsgGUID: f3/MgUXNRBmY05RYAMPWGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; d="scan'208";a="71129193"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Sep 2024 09:10:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Sep 2024 09:10:38 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 9 Sep 2024 09:10:38 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 9 Sep 2024 09:10:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BTnUA9+hBx6hXTTR4V/EGzJNDISyzXVfa8ztTXeELEAAo85RViRBJFf3s+1tX03qFqtARiDpCCaIFzd9rTo2FRk90zDcWf2VEaNRzfNL5y/qCEwxSCYUoRJypblmWCdEDkmAwGlyFXJKTytsyyeY1+Q8+papff6HcLiD6c5rMCttx36OU95eaL2WlwdTGn01kEKz4iMujfxx2dk/3rZuaPhVok+Ae37Tgeq4LCqGzOZ1nBY7qof+Pd3/QuDil8GhTCBIbDS0t7jbncW9v8QE+Yz48zPTn5D62zFXlV4YBoCwTQTD3C0wKhiy3O5z+ZJ6JkCXbWENEXMzbU2MdtpP3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ooTnmoqOeQF/gSld+4X5eXqr2Mtz5Yu2crFS/+mdD+w=;
 b=tXbrIBUXcgFn7MAoNpZqYGjoq8bjPL2NO6RBBGweFS8X4Y6oueBQuRtkAtxYyviDkv/DvxJzz47pS26cE8s5lExQWTg5GbA5qCVnp6blspe2GQyWTK3O+hEsvsVAubVgKdofZYU4Svagj3EhH+RwBkW/i9p5+4G20qjNBNHsONmckhRxDHzqAuCv34W43g+y1l6KzRy//C3dFmTSGXUkmW8F8bOzAzF+O+TOFSBoE/tPnSyUpOvGOdUomuVExhQguWGpEcB4GO/HWyr7IhTAHbmv5SHWqTrcxvuLuDtzlk0oks1ApD+1Q7HFmTJFUq71HX+NKMbxseSfAfqm5fJ5jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB7659.namprd11.prod.outlook.com (2603:10b6:510:28e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Mon, 9 Sep
 2024 16:10:35 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7918.024; Mon, 9 Sep 2024
 16:10:35 +0000
Date: Mon, 9 Sep 2024 16:08:23 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tursulin@igalia.com>
CC: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, "Luben Tuikov" <ltuikov89@gmail.com>
Subject: Re: [RFC 0/4] DRM scheduler fixes, or not, or incorrect kind
Message-ID: <Zt8dd4jRxKEoy/Yw@DUT025-TGLU.fm.intel.com>
References: <20240906180618.12180-1-tursulin@igalia.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240906180618.12180-1-tursulin@igalia.com>
X-ClientProxiedBy: BY5PR13CA0018.namprd13.prod.outlook.com
 (2603:10b6:a03:180::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB7659:EE_
X-MS-Office365-Filtering-Correlation-Id: 795a3d5b-7eb2-4fd5-c03b-08dcd0e9f00a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?xq7R04uiht6ZfJLyStORgAdZfu6jyF8chXIEodfdkHgMV7cxuu0m1J4ZVi?=
 =?iso-8859-1?Q?OQn1mhMMsDfRWZZpd7aRy4daF+CF1H4rPkug8yK3KXQO0zFlbmFeSchnPA?=
 =?iso-8859-1?Q?m2NHYALl4MbdCl0zA7zUlYj5ZCOWD0pK3xDNfotg2Nnp6kIPJvDyJ+RDls?=
 =?iso-8859-1?Q?Atp/hzyYTog5lOde0LCeeq9X7IYTZCM+ibArUaBPbBxtDn27OV1xdKOtYf?=
 =?iso-8859-1?Q?wMlbc0HG/VMCskWQIiTpVcdVMpsZIeX2fE65o2D27dVkz3muRMVutlk8oR?=
 =?iso-8859-1?Q?vDL9x4MwdtsqJuBkt9PIERLDrRmjmbVjMRka3qVNkTj9T9TdywIooxIeJ1?=
 =?iso-8859-1?Q?cg69xRDXgeZfluJlPhtMTuf7qloZfDuvSph5TmaynvyWuLGf/C0T1ALBfW?=
 =?iso-8859-1?Q?ydQqB2XviRKycvY3P55r5DBn3qveZ1WnjNUxNvG6hjk77qUtrU0eLd4Pi4?=
 =?iso-8859-1?Q?pElhTKlbp1yHTTNVB8dpni2MdepKpKqiqcW/MN89kg4PCrvLfdoKyli61u?=
 =?iso-8859-1?Q?KlVBjn7N2dMdT8PGtEG/8B0aTlkV/vJQ9QIY07XqC3FeqzshyRqp9Bp/DZ?=
 =?iso-8859-1?Q?OF9XGv+0JsVO5GzU65Xg+lFw3MqrhD/kXR+0QG61DLQWrpZmEQA5Bc43zW?=
 =?iso-8859-1?Q?6nR70VzUaqYcG6tORAoVMeBe6WOCxT4YUqo7bsudJzNEA+n93tpNMe47wk?=
 =?iso-8859-1?Q?uYuvTrsAPJFsWvSo5NF2yRBdCKgS9wSyyIs2WWVOpAgWBED/rhCnO93TA6?=
 =?iso-8859-1?Q?rVwwOg45pd8l9Si7UtNtUYLGgFM6Up17bYInRXBKcEB71wuYSaqJ5FVuXl?=
 =?iso-8859-1?Q?oHAmZTVfK9qHxS5uRfY0duHHGFNgAzBLkk/i5/mPc5dhN+pWwqzQbzR0Cv?=
 =?iso-8859-1?Q?jq9odNIzrQDjG3GpBucU9rXPm0zAXV7Yh0o1Fgz6CZoE3t213zNFjHM0C9?=
 =?iso-8859-1?Q?/3aLxO8z1A8DwXTKjrCwlZTHgrVLlc1r5QOLnBGKGROP+ys6hBHFrlfFfk?=
 =?iso-8859-1?Q?NcBKu8nRmY/asGX/kHdAuCbC14PXKVOMNG9YrdECPrpKLB+h1RWstCNN/A?=
 =?iso-8859-1?Q?AEs6iZxY+OsAb6SqFAQVquC3wpIB819atgO5v2B+OOWwHlkxU4HBNfHtVE?=
 =?iso-8859-1?Q?hYopKPd9NovJAxX2ALtN3J1hjiXL3mH3WSv9jR09T7C5AESFuh5ZPK1UHj?=
 =?iso-8859-1?Q?8iTL2r4zKT20LohHowHHkGkFpMBalQeA05dLlErVX9BhEczlMA5ekBGIHb?=
 =?iso-8859-1?Q?h06WeHOR2Zbe0JvE65tKmiLSBXn/MdGE2gK5vpD3QH1Rhm2BN9tZNL87Vh?=
 =?iso-8859-1?Q?gai3hhD6oDiqZ7D53jRRCVI7gVlnT+73QMiDUoJ2JFVoXug/HQhq/vgErO?=
 =?iso-8859-1?Q?efCQ0vzUmp9NX63hmcbpKxwcnHyx7+BA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?6EhvSQ5J3I0FdKq1uOIMM/KOVUtsCUNobRFasuuWRny/PuI0M6LZ+Ue0ng?=
 =?iso-8859-1?Q?/5curRo0smzabO9s9ZGih+ff0LlzR1iHdjCuJcZ+XDPmW963Bh/gK9BrNZ?=
 =?iso-8859-1?Q?JcCfq8x9Pul/hi4BOAlwctgZDhcnshWYr809KDYjvR3ibTbX2PKzSeow24?=
 =?iso-8859-1?Q?9zV/Um3Ei2j8jH7snXo/007lKBZrSDAYjqJ7lWy9eIGxiL8G4++mMKIYK+?=
 =?iso-8859-1?Q?ZspUHvTIeDA9eDQRmH2Uj16ICPizOPvXdOa8wlB14lJOLYY1Lv4GZCWHSA?=
 =?iso-8859-1?Q?TzdEUd+5bYpRK1KtL2t52SnmA6iXN0al0MTmfBSJjv/woOmeLucTfst8uz?=
 =?iso-8859-1?Q?dmEcMvm9AWNDh6dZsrRZZR5m7Gpkz5KjffhpPJRdmNzGi7G4C8vb/z8edq?=
 =?iso-8859-1?Q?2BteXuOv+cAwEV1ZiiHsXv0vPhObmVwiFEmOnnig2VdnPF/GjVFB22FTSf?=
 =?iso-8859-1?Q?hoK5GzWkkpuvXFhtnGGfuzownyK2HTJy87/tvUD/yaGPr8pV+0aZptHoL6?=
 =?iso-8859-1?Q?n8w9j8WVKQ8BgMeSNCZ97q/nMPYnPgcWN+wyaVH+9vVklNr8Q1Xr9zfYex?=
 =?iso-8859-1?Q?cZ6DB2ZtJrgArLv3ThoajcUwbucVUqsvb3LtgPbo2XV7ZcmSEPS6BvoVu+?=
 =?iso-8859-1?Q?+KRjgNgMIuUw71Z1odSVH9Q7FlYJWVqnTn7lBF+Y6Lf4eI6sKfJR0BK/TD?=
 =?iso-8859-1?Q?eeN7wpagrJFICsoCgVeKnNGDYFcUxK6+wbHvpf3/pcaTK0gx7JxXpFL1/L?=
 =?iso-8859-1?Q?LZ3e6sR5LNT4jAsJRjpNm2r1jxw1VUfxN6DrTyEBKl9pxcqnpycfyglgLc?=
 =?iso-8859-1?Q?TdnPwuI+rzFu/8NcXxcvEhaYXEkCUYS5hAW+RTEH0vsyLSrssR0wmkG19W?=
 =?iso-8859-1?Q?/lGq6foEoqTjLSRv11IkRZO6wZ6rhgsSfBNPbvW/UrhwRV8Mb0L897YcjX?=
 =?iso-8859-1?Q?xcbSgdHolXVNYrsoVSlybB1r5H1VC2cO/SIWdNELKkm7XDGo9myVW1ZLhG?=
 =?iso-8859-1?Q?N4Hg24RNnyTo2XWnFJIPRDeLJJ5FbjBGZhjKbzYBk+/FABHzkH2kgjiizz?=
 =?iso-8859-1?Q?iEEzNICsC9r5w5Vjeyvi+OWqu5Ta4MaKVEGs5mSxVl7jvpEWcGkSMc83A6?=
 =?iso-8859-1?Q?ZSmmIxy5ZvsbOVJK+F2631rgdWeUx0CnpYKnGZVUUHs72ycCqaPzyGhYIH?=
 =?iso-8859-1?Q?E5FOkfijmqtF/4baQh+ly3od2Yw02/aq14sgaJ41hc5KiPKRDbSyXG0Iik?=
 =?iso-8859-1?Q?7Pm2ec9Mrn38cBbgvxt9P2CnV35MHrOL38pGTIz0ce1BKPCNsMqW4ckkfF?=
 =?iso-8859-1?Q?M+JQEZ8IVPnKE/ja7SbWWxFzMVWjkgZRSO7I+fk+WT0174uksQPF3Tpqer?=
 =?iso-8859-1?Q?XFOyvealGKw6UJzXwglnBAYGmkARZ0GFBKN30y+eF72YddaEvbhBb9x1YQ?=
 =?iso-8859-1?Q?aPck7UNJmbB/g3zvWC4lmj8yqrTopk0dRUeqOg/v1K1gb82AUAvWf6i1DJ?=
 =?iso-8859-1?Q?R4VxQE4FQxekjssGoV4pkvROmmZw6A96iSIUZi+P0RIuKgwTbCI8rszcvh?=
 =?iso-8859-1?Q?OSKnQYWCqgE44RD0fDn0dbKTfDHuFLuhWEOBv6zEW2+sayzpb8R+wqPeaY?=
 =?iso-8859-1?Q?03iJPWO+CBrf8YneV6AeWVJBmm0CpYjU585M4wSr9IsJ6iVA4nnixxDg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 795a3d5b-7eb2-4fd5-c03b-08dcd0e9f00a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 16:10:35.4516 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J1KbnwKdnpHxbFOW6K9t5/Z3RuPlbdT87UDEAAXaYQZIM6Uan6f8cMw/9UIzmv9JtuBtsAht+VeNnAefifu0xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7659
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 06, 2024 at 07:06:14PM +0100, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> 
> In a recent conversation with Christian there was a thought that
> drm_sched_entity_modify_sched() should start using the entity->rq_lock to be
> safe against job submission and simultaneous priority changes.
> 
> The kerneldoc accompanying that function however is a bit unclear to me. For
> instance is amdgpu simply doing it wrongly by not serializing the two in the
> driver? Or is the comment referring to some other race condition than which is
> of concern in this series?
> 
> To cut the long story short, first three patches try to fix this race in three
> places I *think* can manifest in different ways.
> 
> Last patch is a trivial optimisation I spotted can be easily done.
> 
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Luben Tuikov <ltuikov89@gmail.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

It seems like the series is getting traction on reviews so don't have
much to add series looks sane enough to me. Consider series acked by me
on whatever you hash out in reviews.

Matt

> 
> Tvrtko Ursulin (4):
>   drm/sched: Add locking to drm_sched_entity_modify_sched
>   drm/sched: Always wake up correct scheduler in
>     drm_sched_entity_push_job
>   drm/sched: Always increment correct scheduler score
>   drm/sched: Optimise drm_sched_entity_push_job
> 
>  drivers/gpu/drm/scheduler/sched_entity.c | 17 ++++++++++++-----
>  drivers/gpu/drm/scheduler/sched_main.c   | 21 ++++++++++++++-------
>  include/drm/gpu_scheduler.h              |  1 +
>  3 files changed, 27 insertions(+), 12 deletions(-)
> 
> -- 
> 2.46.0
> 
