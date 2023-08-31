Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E3E78F31B
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 21:10:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 565C7892ED;
	Thu, 31 Aug 2023 19:10:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D75CC892ED;
 Thu, 31 Aug 2023 19:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693509044; x=1725045044;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=hUPMoIXeOyM94c/duOOxCRqF1qQ1nIa0+ON/INtGyiA=;
 b=d4VbyplJ51/fb0xNAPnvKbqYR0tK84nMf81luoGsTBfHPoT4ldrz1f3/
 UzHk4yk2qvl5UQwfCAFcYJ//rrXcQsvbTs+M5OrcLr0/i4pQGHiUCRM5y
 4NcNEZx+rRzd+phD0WmVOrh3iOv17+hdLc/u1duw5RbfWiDI9zpSeYlTf
 66L7tweNjtqxeZiqt082PkltiOJBMW7PYINsUnFu0CxPuFhwffgX0i5k3
 b2bBV4TU51JTD3D3Tb2Bbj6iROFiBSYOqwG7R1FmWKDjxgepPpX0MlhXN
 hiZrzce5QU037R3CPFHKHi9VNCIVy0+6SlPvkjeOpUaEKyPNk3JDu5go8 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="355536820"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="355536820"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 12:10:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="863253291"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="863253291"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Aug 2023 12:10:43 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 31 Aug 2023 12:10:43 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 31 Aug 2023 12:10:43 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 31 Aug 2023 12:10:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YzEHMJA1p9uewaX7eHgh+Pd/ilNOcqoelcf457C8zps9+GLM9PKYWhZYUdwRA9+NqgSNyN/hcxFtJf/zPIuHTWyLYIo0w05HwS17ISH8TeiOpcmE5e3yCfeCi4ZWv6By/sSgR4noFUHHb7zbHG80VqHbGLH3Lm8grncJu9K90A5Gg52Aj7JK3CtoLFz8PAsLo6D2GmqUKftZXKRmSVykVDhpefl1IFDgp0HwV/GyzEwwlug/OqRdPaluazzDvuKccKRNNHEfZXO6NO6il0duXIWUZzHgHW7XC1y04/e37yFwvA36yt1beCmNc8BIoOE5xiy+3YGeB9vfrAfMV89Opg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hcoveo35fMqh0aadCYa8QhRz3m0G4N8Kc2ma+fsSWfg=;
 b=NjgjEA3gufJ6yUtKl9TZ/xkG+SZ5tL2m9MEzQfzXn70hBNHQ7llWl3GJEHFgRyCL4Pyqu+f7L73u7n5dmEwqlCvM4p2Ekhn22Kw/Q1LDrarM3pxiCwOoWbli7RcAcpgrnqYyNMkkNFcqU68HsZsy51Ixrs60sE/2Aa77sJCnZ/jsyNVr9JWyrDobBnE+bI1b5c68R5UQ4fd04uCpLuQfUTGWHDJAKMK0b7UZ01khhV7whRF2Z2f/uB6N5VnaLQoGynA6zX7Bubk2IgthmzGLJCHme4u89rKpmAsCc63bcI6TYtlKzCeyS6nwBK8GbLXxRB0pZqFmxOqaiul5QiFjNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB7068.namprd11.prod.outlook.com (2603:10b6:806:29b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.37; Thu, 31 Aug
 2023 19:10:38 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6745.020; Thu, 31 Aug 2023
 19:10:38 +0000
Date: Thu, 31 Aug 2023 15:10:34 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <dri-devel@lists.freedesktop.org>, Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH 3/4] drm/doc/rfc: Mark DRM_VM_BIND as complete.
Message-ID: <ZPDlqqBghH3FE4HE@intel.com>
References: <20230829163005.54067-1-rodrigo.vivi@intel.com>
 <20230829163005.54067-3-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230829163005.54067-3-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR05CA0138.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::23) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB7068:EE_
X-MS-Office365-Filtering-Correlation-Id: 47868cd6-2a50-4bc7-f687-08dbaa55f635
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1oicgIfwWYp5yA2ay64BuZAHdJlbQFqAp1Q9eGoBUm7ADRFE/iK1m4wBSmFNeFniY9nT1m9oqJyRgdW5sHZgQQMkUrW/QpmC5sY2zs5yOzvLXXdJ0c7f/1M+GKTTqSlQxV/F2SqOWbGh+bFO1Fb95nQsMyCUG47dOeBmyoQr37MtzMvVWrbH3nJgO5VSJHdkCmwVKQpzuSCeyJ+Zr0M5hEijkh+8rQDu8mume0UX55jinf+3mGwCGKz9Eakv+7bS5TUT7NVpscjWz1NrPhmtZ+IY9S+N+8lyWJ2npUQxV5pYVxE7tJ1kBIF052HxAzXg5YdF0Lk9hVV9WqJLCo6FVbLnTTTSaXg9I2qWerEjmzEy6y32iKgeRlmFW7qvnnWk96JZcT7v6hxAOlS2oz6vGgsser6kOGLWnSQ9hOimqGHLR07F4V3nNc9Ih6Hxiz1DOS77vAkRZXoknmmq1pxUNZa+v1ePWTwFWNfMdBlgyoU1ABqzeBQ3tyx38xiSe5RbjmZ8znubBZQ9JVBo+zDaZxG5liM4kNOD2xgD1dM47ttTx+ZoVcsKFvW/KSYqDPt0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(366004)(396003)(376002)(346002)(451199024)(186009)(1800799009)(38100700002)(66556008)(66476007)(66946007)(6512007)(6666004)(82960400001)(316002)(6916009)(83380400001)(86362001)(6506007)(6486002)(2616005)(2906002)(41300700001)(478600001)(36756003)(4326008)(8676002)(8936002)(44832011)(26005)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1FydUtTcVE4c3lxQ3R4cFNwdVJFY0VsbHltdHNpaWdtdE5zSlhGVXBlWGNr?=
 =?utf-8?B?QkFkckk0Wk5kMEw5eXlxcVNZUzE2eWlqYjgzRXUvUjIyRWxTVzRrZGsySFl3?=
 =?utf-8?B?KzBCMUhlYzFKaEhreGFWSmdYaXoreU42UzdPOUZyaFY5bHoreEF1SzByWERx?=
 =?utf-8?B?cDllV1A3cDhZcGR1YTcrNkVQaVVWendmajNxN0pFUGx3T09XSEtnaTJJa1Np?=
 =?utf-8?B?Y1NxR094YlZEZnQ3bU9NQndMNHRHYUhHbzU5NDdPMXhDeUkwSlBacUwxNnRC?=
 =?utf-8?B?emdVQ1VBbU0rbmY2dFdIWEFHWXpLRlBVU0ZRTWVkckpYM1dRUTY2K1RMaUZ5?=
 =?utf-8?B?Y09SNmY5clczbEFNZzNwRERMaklSNFJlK1huVThXK0dqTTlSSnc2Yks5M2p0?=
 =?utf-8?B?Zk1VME1RN1phSXd0M29IYVdYVmpmSnVjSFZaTXQ4VWRndmVPUVBPMmdUL2J1?=
 =?utf-8?B?Y1lNYWV2bHFCaWQrRTVISmZEN2FqSTBncTVmRllObTNzeGZFT1lMaExtMHRB?=
 =?utf-8?B?V2c5RmZiQ3ZxajhSVW93Q3cwcmlQRlZidTN6QjZ2QTRBekhYR01PaWxxQ2Qx?=
 =?utf-8?B?VEtRdkEzeVlTVVB6MXpLUWdoR1JuRHRaaWJhSjgvMlBmN1pMRUxDNkI0dFFJ?=
 =?utf-8?B?alNzRjUrQ3dhMnRjNVZIKzcrZ1oyN0FyUmEvNUVKNEE0a2VOYWFyY2JzbTlu?=
 =?utf-8?B?SElsaWc1RkFHRFFRYU5uR3o0NlgwVUZRL2l2QlNSbncyeTFoamh3VTFiOTlI?=
 =?utf-8?B?QlNHMUltREx5Z001VVQ1dVZrT0ZSNzFYcGZtL0NBMnU5YmNJdzh4QjJTZ05L?=
 =?utf-8?B?clcyTVB4NmkvWjJYTFBHUzBRWTB4UmlrdUxoNzJoN0JjSDZUTHZ1TjdFZkk0?=
 =?utf-8?B?c1lTZ0NUQjhYZnVmZXh5QklUMm9YVnJJR1RiNVlkb1g3TVBvS1YwRWh1bE9S?=
 =?utf-8?B?Zml1Y0Eyd3VodlZhMURNZ3VYTFppZFpoMlZhSlY4blZQcDg3dVovRkJiUEFH?=
 =?utf-8?B?VU0weXpBZ1ZWaDdDcFRKOTlSNTRZM3ZCSkRDOGNUVnAzQlhTaUdIRVU2ZHlE?=
 =?utf-8?B?ZWQwWXAvUmtJZkJFU3Q5ZjZwbFFIN2d1OGExN3c2Z1h4aXZIVTAvcDZOZEVK?=
 =?utf-8?B?MlhSWUovVXdrTCs0aGgyRlpZZ0owWlE3R29IWndTUTgwZjdQdzhvTXZUMTZ5?=
 =?utf-8?B?MGdUZEQrY0tuMExlU3pFcnU1OFZ5eXlHblFlR1U4N2pPY05pamFIMUFVUDM0?=
 =?utf-8?B?RGQyS1VrK2REekdRTWd1akJDWGl2TmF0Z0FSdzgzakR0R3ZmbHE0OWdqU3lZ?=
 =?utf-8?B?NzdjQ3FnT3dELzdBUHlMOE5JT1AwZVlkbHFQaEc5dGVsN0sycVV5cm50OHh3?=
 =?utf-8?B?cUVkckx5c0o4UU9xTDA5MlVJTmoxcW1VNTFoWS85cmJNVU56U0dyM2ZjUnM3?=
 =?utf-8?B?ZEZVeGloSzl5a0ZFTTRsd0JCczJDdUlhSDBwSndIUXdWLzNSV0ZOZlN1OUU1?=
 =?utf-8?B?OUZpaFBOeDRhL210U3hzYjROSzJ1TTRycm1LTUtZVWsyeGtNR2RaVExOaTlG?=
 =?utf-8?B?TXFpcE1jZmVqT0YxNEVaK3MwcENwWGFSSjBybEpkd1FUVjcrSjVidkNQb3lI?=
 =?utf-8?B?UWtTUURqbisvTmxkU2VIYnFkMS9aMWpsVlAxMXErZVNON3lIcXZYUmNGTUJo?=
 =?utf-8?B?SEFEMnNOcFQ2L09CN25WVEs3RjAyZTZmYWp2SzBna05WU2pQcVZtNXp6c2Rh?=
 =?utf-8?B?blEycXU0OWNJSUVHRlo4dHk3YTNyNXh3dGFyaW5kTzhqT0xPcDJ0Nlhta0Ns?=
 =?utf-8?B?QU16SVV2TkRBYnVzeGU0UitUY2thb09OcGg1TGJkSVVGbFowZmhReW01OUVn?=
 =?utf-8?B?bWFHWGxHVFFyVjd3SGRVdmdFYkgxR21EbWFWWmFxYVFrT1prNVhLSVFLQlVB?=
 =?utf-8?B?Q0liVE1ZZVg2VXRZUW5jR1d1em4ySEdWTm1JRHVkU0pZVU8yS0VRMWRQK014?=
 =?utf-8?B?d0ZjV0ptaXkrLzlTNVljNVE4TG1YaHF3c0JOT2hUT2liUXVaWFdqSlhvWXIx?=
 =?utf-8?B?TFJYcmFaaFkrNVlEYjY4TlVuN2YvZExpQVNTL3JDd243MGZkYzBORzJ3U3BF?=
 =?utf-8?B?RUVwbjY2c3cxenhPYzRiVjd1a3p2clNUem55SmhvSnIxMGg4UElSN1RRNUJX?=
 =?utf-8?B?Q2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 47868cd6-2a50-4bc7-f687-08dbaa55f635
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 19:10:38.6505 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AZCd9piGtHTAo0YZxXQ0C/pld4P1rNyEm2GPsu/a12UBRJ5ufxUtgm1/mIgl5YQA3d/xDbrWDewpRCNSbnJWxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7068
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
Cc: daniel.vetter@ffwll.ch, intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 29, 2023 at 12:30:03PM -0400, Rodrigo Vivi wrote:
> The consensus is for individual drivers VM_BIND uapis with
> the GPUVA helpers that are already implemented and merged
> upstream.
> 
> The merged GPUVA documentation also establish some overall
> rules for the locking to be followed by the drivers.

Danilo, do you agree with this?
if nothing is missing on that front, could you please ack this patch?

> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  Documentation/gpu/rfc/xe.rst | 34 +++++++++++++++++-----------------
>  1 file changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/Documentation/gpu/rfc/xe.rst b/Documentation/gpu/rfc/xe.rst
> index bf60c5c82d0e..a115526c03e0 100644
> --- a/Documentation/gpu/rfc/xe.rst
> +++ b/Documentation/gpu/rfc/xe.rst
> @@ -106,23 +106,6 @@ our tree. Missing Nouveau patches should *not* block Xe and any needed GPUVA
>  related patch should be independent and present on dri-devel or acked by
>  maintainers to go along with the first Xe pull request towards drm-next.
>  
> -DRM_VM_BIND
> ------------
> -Nouveau, and Xe are all implementing ‘VM_BIND’ and new ‘Exec’ uAPIs in order to
> -fulfill the needs of the modern uAPI. Xe merge should *not* be blocked on the
> -development of a common new drm_infrastructure. However, the Xe team needs to
> -engage with the community to explore the options of a common API.
> -
> -As a key measurable result, the DRM_VM_BIND needs to be documented in this file
> -below, or this entire block deleted if the consensus is for independent drivers
> -vm_bind ioctls.
> -
> -Although having a common DRM level IOCTL for VM_BIND is not a requirement to get
> -Xe merged, it is mandatory to enforce the overall locking scheme for all major
> -structs and list (so vm and vma). So, a consensus is needed, and possibly some
> -common helpers. If helpers are needed, they should be also documented in this
> -document.
> -
>  ASYNC VM_BIND
>  -------------
>  Although having a common DRM level IOCTL for VM_BIND is not a requirement to get
> @@ -230,3 +213,20 @@ Later, when we are in-tree, the goal is to collaborate with devcoredump
>  infrastructure with overall possible improvements, like multiple file support
>  for better organization of the dumps, snapshot support, dmesg extra print,
>  and whatever may make sense and help the overall infrastructure.
> +
> +DRM_VM_BIND
> +-----------
> +Nouveau, and Xe are all implementing ‘VM_BIND’ and new ‘Exec’ uAPIs in order to
> +fulfill the needs of the modern uAPI. Xe merge should *not* be blocked on the
> +development of a common new drm_infrastructure. However, the Xe team needs to
> +engage with the community to explore the options of a common API.
> +
> +As a key measurable result, the DRM_VM_BIND needs to be documented in this file
> +below, or this entire block deleted if the consensus is for independent drivers
> +vm_bind ioctls.
> +
> +Although having a common DRM level IOCTL for VM_BIND is not a requirement to get
> +Xe merged, it is mandatory to enforce the overall locking scheme for all major
> +structs and list (so vm and vma). So, a consensus is needed, and possibly some
> +common helpers. If helpers are needed, they should be also documented in this
> +document.
> -- 
> 2.41.0
> 
