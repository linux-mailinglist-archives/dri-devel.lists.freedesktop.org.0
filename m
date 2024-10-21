Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E00059A703E
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 19:00:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FBFC10E569;
	Mon, 21 Oct 2024 17:00:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YHoQCoqp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A225F10E567;
 Mon, 21 Oct 2024 16:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729529999; x=1761065999;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ufE+CMvL15pUorOuxzOYRG+BVmFcb5ZyhHzx/css7PQ=;
 b=YHoQCoqpmFnZ0I934k72d1YPMZTQjqSAaKeKmmYN86U1OBfKIdBbzzlv
 nV51gzifdtfeFzW66eKLB78o3Xd3mQ72uL4BOtPzn/n2vuu7Qjnv9Hzmc
 g4jcHOLyeahL8oOqJmEeEG9Dkr76B14nTCD63fm6tXUyp5I19LErx+1VN
 91O6F3q/Enzk1vqoXlqqWSExND6ed3lxAcETrxVONLIHF/VtT5pevFUVb
 uA+/WninelnjL6xB4xMvjqCPEOn98oXjWZMtDYQsB/h2BUIqft7rMN2KF
 BmiuoRrGcvP9Tbdcsv905fcY4v2jO+sWq5x60Q6I+Lk6PhcYTv3NZItz+ w==;
X-CSE-ConnectionGUID: TKurvJ9NTl+x+CVkul6aDw==
X-CSE-MsgGUID: 9fxQjv67SZuX8DtV8Xcrew==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="39645019"
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="39645019"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 09:59:56 -0700
X-CSE-ConnectionGUID: 4SNGqPQwT/uwpLLcd8vHDw==
X-CSE-MsgGUID: 94yy2wohSfGYiy6Y+NohpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="79670226"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Oct 2024 09:59:53 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 21 Oct 2024 09:59:52 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 21 Oct 2024 09:59:52 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 21 Oct 2024 09:59:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hi32eEP96zcHgfmRiMjusDbzBuU8TXuhflzr2uVmYk67jNZcEGRmCqj5QlkNm3AB2ixuuzZscvMp8/7W7lEolmP8zDMCgNIEbMmjhufNOBCQJCd3C70QJcSjf1WS+nZmTIzY2wab+AEZyNsbFsdxYI9K3w4QQJWvoqsHdM08b5qxYEW7pRrbqD3tWpvm6fluPgZseG4NGAzFMRHN1EkuozsUV8lJbd46Xxzc8hqM6pUuWGX0K7OLgaQCfO2ex+8eTQCGUMA+J4ODxnpKq3HapnOdYsmpQK4uiyGuoqMcmTL2n6LktYfJ4fWfpsMwRj79PPBOG6xsSK15PMHP2QTCPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PQM4+V5wfSwYYClk2Rbv4Kfs3r4RkCa5kAqYFvN8+/0=;
 b=V11zNk6aUvLdeFObhMj0xe2+zKun8POJ6xXr36ZOtCyJ6yjz+YCQtwU0KI8ef7f4V23aLpoL+z4yupz5twWs7K8BjUiyfU3Y1bZ4Ri6eo70RYGDb+FXGAsXsWMsjsvAcf6uQjVrRo3N7unMqfyrUXc+7RiMynD0G8IwN/GyDCeHD+0/KNf+Ns9J/ZYGXXVemv9JW9zTgEqToAF1JtBVSlXUebRnwTPDoHjXtQkZyhyRPZoLH3cfIJ625X0v5GkYNpOtXHIFGGR+a0RozMV80ksLt+2ckC9Zf0seKrzJjUBoT4bTBd4BK18ncEWPt4/f9NzsxZnmFVe/rI7QYzu4TXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6540.namprd11.prod.outlook.com (2603:10b6:208:3a0::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Mon, 21 Oct
 2024 16:59:48 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 16:59:47 +0000
Date: Mon, 21 Oct 2024 16:58:43 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v3 4/6] drm/xe: Use ttm_bo_access in
 xe_vm_snapshot_capture_delayed
Message-ID: <ZxaIQy+RVf8qTjn1@DUT025-TGLU.fm.intel.com>
References: <20241019192030.1505020-1-matthew.brost@intel.com>
 <20241019192030.1505020-5-matthew.brost@intel.com>
 <3a956975-4e6b-4990-80e2-769872d17816@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3a956975-4e6b-4990-80e2-769872d17816@intel.com>
X-ClientProxiedBy: SJ0PR03CA0155.namprd03.prod.outlook.com
 (2603:10b6:a03:338::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6540:EE_
X-MS-Office365-Filtering-Correlation-Id: ad0e4cc7-34af-4259-4988-08dcf1f1c4a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rNQKbQzc0eY5XQDjqSqNUgnBAt4i8uCzFWxGrN6qum6CdAijddbPKPutn+xy?=
 =?us-ascii?Q?rzfiu7eNPtWj1KcVFIS0C0xsnLZ7vQEnww9lPexadfXMHBbZtmu+84108gLH?=
 =?us-ascii?Q?TECccP2EpxGsLJxs80cTYMaIO2A3o0w4jjZI71kP9m0dCOWyvBHSuPqmqsKB?=
 =?us-ascii?Q?iOBAamStMNBsRUIXlQr5NHDyj42Jwq37DxBBAhMKFEW89KgdgB3n4QJUd15z?=
 =?us-ascii?Q?qCtroQ4DH/pYNm6jYir12PgraNdutzBgcZR+f5vZV254GSpFBsmiLBFEHxCG?=
 =?us-ascii?Q?6Em1B8/s82Zgzjro4HGDh8te4AApGqSIIcOnNwtFA8m4dlYATM0x7EP8Ozff?=
 =?us-ascii?Q?vT4OwVURxoQOVM2Tn3gztAwuoGX1qoR8mHrSGUmkhuiSJ7PaW6O7XD9f5wO7?=
 =?us-ascii?Q?5OcwCQuSmleOPOHVzOSyIISOud9TSjLw3LoGxHsgivr3S5gcIFfUcyvPcBZG?=
 =?us-ascii?Q?GTMcypQ+d26BvbqVoHf9k3fsZk0F1u9p1XA0JfdnKmcRvKHF4Y72kviYWIy1?=
 =?us-ascii?Q?Gzzmsr1Xl5SOHVnEaexawW3CQ0lsQrXtYT8oYCDMs3uW0JYs7ael0Nr3y8ZE?=
 =?us-ascii?Q?BsSr7wY+yVOHkAmiZQwVJ+/ukJ90Pq1JUt/0wAvVGlHWkGL+RVXYOKv9rBR6?=
 =?us-ascii?Q?k0mzqcxxxUtAuUrPA71Gi+6GyErR3zzDd2JLItsAqy3VoDwGx0CNH7bsCmax?=
 =?us-ascii?Q?3r04tg5KI4Ev7jRlIQb7GDEOBpx0XSw1HfoXBW2HWePs2TZ8xgIiy93RUZfI?=
 =?us-ascii?Q?ZAWgdUh7grYXtigUy51QvGnqc5g0oaOHhmvZOcfwoq+YLjbUDgs52fFRlVH6?=
 =?us-ascii?Q?pRGqtXQ4EOQT+Lpquy6JN63uaPryzk4War6C5UFzvdmK5GI/IqucceAYriNS?=
 =?us-ascii?Q?OaxpcXLkI6HPANBdw6a6SB72z7ENSr6GsxniL6Tk82FyJTZUOweUTBsHK5Dz?=
 =?us-ascii?Q?aL/KCvmJjIQU9c0+0eCS/1kS5Z4UL8z6W5RXQjRlBhCHKKCZAuL3Hvvx3eUC?=
 =?us-ascii?Q?UUZZ18CWJs/L0qrIhxOea+arszfKKxtZsedVkbjSH1WMwZpTV2+HqLgskcqL?=
 =?us-ascii?Q?nWm56JUKsBsJvRpNRhfpPzFFf5lIlXVcbCp2GgcRkQxur+Y9aL8NhkqcYFz0?=
 =?us-ascii?Q?WhjGFuz8GbZH92ZQC1XZtUhLr0YjpVX5W+Er16W4NFlHUl8S41mCoRjWchHd?=
 =?us-ascii?Q?6+5hBJktBCt707cPC+3WWLmEC0GljLuRjA/vAsqxMum1n3wSwDaITbyOIQZB?=
 =?us-ascii?Q?7P0L6LOjXrI2GpmIFCjD7LvfkNYKjP+HNa04HtApRQxRBWwPwkVi3PgtQLA4?=
 =?us-ascii?Q?lMD17EAONxKi1Kk/I3GZhwo/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CPBQntxxZgVzdoheD3gC7BdomO8VTh0ENktQBkN5F7J1dN3NrcLyzV1HbHXc?=
 =?us-ascii?Q?HbVrNvIM5Xzm+UN5urMYfcT2ufxx1kY1kPM31+AUQ8QWI+KGA7x43I80Rq8y?=
 =?us-ascii?Q?dV97wY+J0AMGJNE67PjO3kECNphGU3D08p0GZg1UF7jFB3FXWCsMWtewOqqR?=
 =?us-ascii?Q?HiYPocnT/XOVlth25LwhPHKUCLt0UuFy3nAakcq7S8nwy2O0vdxIF+LWm2Ob?=
 =?us-ascii?Q?b1t8CPu3AuugAmFcmWaZdptuNfL0zmD7R5sc6BluRiSYgyPjix8kqlVRhfKe?=
 =?us-ascii?Q?eZat4Gx4QJV/Blkm5t7pGUwrGJHKoY9BZWNJCqYl+kBf3C5Tvb2Ce9oE/mQv?=
 =?us-ascii?Q?nPvgJOsu9E14+P/MzYYHUWVrVsdcPYhOF6b5mp4S1xrQsUaiYdJtINidxzvU?=
 =?us-ascii?Q?SNMSTOBk8KG6bRPzH7ACFdlrA+I3LIBYXIU0YqFQtDf+TErzqm+WSOx/5Btj?=
 =?us-ascii?Q?+vKFbHlTVBYD74Vg1IINvQmiUBsL2ygRL/whyNWtzK1mglMhci2IyS6LjEn5?=
 =?us-ascii?Q?xXwUwomSLMIZQvdHKiN1G/eHzWdCyVCRS+W5+BD6pThhgL+167jbaSEfxUFp?=
 =?us-ascii?Q?fdukNECK8PHh7p4h/b3C+o0Uoh82OFZ6nVRg16n16XsteVusJVEojfsk/leS?=
 =?us-ascii?Q?oHz9qMe5ruwkOeU+9DbpoukFqe5EY2K2PmVp1lB5u75fpX5x/6KqsqSi7QLQ?=
 =?us-ascii?Q?fUvbp9N9BI53WucZZShK/epqnnDcgF1Z+Pqc0dQAo7aYNhsJ5L844CnnUjjK?=
 =?us-ascii?Q?a5vgCgBklCsN8NuUmjkwXXPTGFfaLUMVRjwV7+B0in0movLwmlcMmPUgFYVe?=
 =?us-ascii?Q?27xjWV8f0rtvjbDVrq0G8ptkH9hiAS8Gtg9uslfbtdfLfpNOrr6+G4miD+iF?=
 =?us-ascii?Q?GmqFX70hKUl6zwWduosWcgpR0G3bqqoYp/4h7jeuMqzSsBNKQeMNEH66tTSw?=
 =?us-ascii?Q?rA7XfvjV8dgQkXt0B2BN3v8wEUKHarIvxiht2OfUZkBtZpZEeHMmDcrAS3f6?=
 =?us-ascii?Q?7X45cXdEQCaEMHDV0ne6/U2s/70jmp7e1nen9iIvZci+jm0bCYbqQCySBOMb?=
 =?us-ascii?Q?bSuAgBdA2PIh1XLXBWFMGEDEUytVe2p3u3/cOKrqY0MM88ZxIt9hGwpjTq/F?=
 =?us-ascii?Q?Syq0wYragWcGdwthBocRNW+hdj+SKp9TYClPmwgEks6ZDkD+1m4sf2bvB2kj?=
 =?us-ascii?Q?l3ZR2B07R2xn1IuTjqtRVvhNY0KxmUk4HpJVmuX4GBL9p4J7qDhwMhqx7B5e?=
 =?us-ascii?Q?23Qf1hMZARzfXdte4Tt4Oc3ee58mnkaaMG+D6OpTlRBy+c2HH0qtpxXjxlyO?=
 =?us-ascii?Q?x0LvjS/EmQGcFbxvMVadYCFK33MOMEVLfMWe2xBQcI4OWztIKWDYVg7BfNVW?=
 =?us-ascii?Q?kamNKR/I7n5NY/DZJJQ5rpeWmq0LGzUc51azIV6vTFOfp3zVGup1L2NDg4Kx?=
 =?us-ascii?Q?ZvA2hsPbdXW2hDYoJaKN2JHOQfvWgQTOKRkUyqacoCYk9nrTY4RjNmirnsfP?=
 =?us-ascii?Q?4d7IMa10lFfBzWGRViARkMlSyssQVTQ7HndQG6b75vmbgQMfJmdozZ61ZxHa?=
 =?us-ascii?Q?SUM2pW2vFIYUVFPP8M1lkFuTDlERcT7CFHzeXmAqluEN4xza6HzqZB8HiPUe?=
 =?us-ascii?Q?vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ad0e4cc7-34af-4259-4988-08dcf1f1c4a5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 16:59:46.9839 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rILSpbnNWQWP7gT4OcS9yxHBRHemMaqpgyMDacY0zNV1ELcoSQh7AXrrS0yBvRJhNbA1308d2iMwBdsIS82FTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6540
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

On Mon, Oct 21, 2024 at 10:07:31AM +0100, Matthew Auld wrote:
> On 19/10/2024 20:20, Matthew Brost wrote:
> > Non-contiguous mapping of BO in VRAM doesn't work, use ttm_bo_access
> > instead.
> > 
> > v2:
> >   - Fix error handling
> > 
> > Fixes: 0eb2a18a8fad ("drm/xe: Implement VM snapshot support for BO's and userptr")
> > Suggested-by: Matthew Auld <matthew.auld@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> The other user looks to be the clear color stuff for display. See
> intel_bo_read_from_page(). I think that is also potentially busted?
> 

I looked at display but missed this. Will fix in next rev.

> > ---
> >   drivers/gpu/drm/xe/xe_vm.c | 17 ++++++-----------
> >   1 file changed, 6 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index c99380271de6..c8782da3a5c3 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -3303,7 +3303,6 @@ void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap)
> >   	for (int i = 0; i < snap->num_snaps; i++) {
> >   		struct xe_bo *bo = snap->snap[i].bo;
> > -		struct iosys_map src;
> >   		int err;
> >   		if (IS_ERR(snap->snap[i].data))
> > @@ -3316,16 +3315,12 @@ void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap)
> >   		}
> >   		if (bo) {
> > -			xe_bo_lock(bo, false);
> 
> I think we still need the lock, or is that grabbed somewhere else? Also I
> guess CI doesn't currently hit this path?
> 

Yep. ttm_bo_access does a ttm_bo_reserve / ttm_bo_unreserve which is a
lock / unlock.

Matt

> > -			err = ttm_bo_vmap(&bo->ttm, &src);
> > -			if (!err) {
> > -				xe_map_memcpy_from(xe_bo_device(bo),
> > -						   snap->snap[i].data,
> > -						   &src, snap->snap[i].bo_ofs,
> > -						   snap->snap[i].len);
> > -				ttm_bo_vunmap(&bo->ttm, &src);
> > -			}
> > -			xe_bo_unlock(bo);
> > +			err = ttm_bo_access(&bo->ttm, snap->snap[i].bo_ofs,
> > +					    snap->snap[i].data, snap->snap[i].len, 0);
> > +			if (!(err < 0) && err != snap->snap[i].len)
> > +				err = -EIO;
> > +			else if (!(err < 0))
> > +				err = 0;
> >   		} else {
> >   			void __user *userptr = (void __user *)(size_t)snap->snap[i].bo_ofs;
