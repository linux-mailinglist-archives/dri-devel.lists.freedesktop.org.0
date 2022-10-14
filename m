Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F145FF1FF
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 18:04:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 489C210EB29;
	Fri, 14 Oct 2022 16:03:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CABE10E2A4;
 Fri, 14 Oct 2022 16:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665763432; x=1697299432;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/rTFY+AzpkJR645DXu1pw2YO1AAyzgz4FuzZIQg3C3c=;
 b=Y/TM7Yttnzcp7yA+rwVjoN3rJB4mMUsKYn5An6zkTCFIiIXoHYT65wb7
 G2bMm0AKH9FDaZjffiLIdRWft2H5bZZvPi8Kl93R963bi2PNqDVnnBpJZ
 VM4BgJ6RfWYlmd2BSeDwi/NsdLqqiVOiNGseEUk7pF8BgFh5n87vS8GrY
 NThE+7P27fr/VOYMRi4VYbe9M8bg+xoZrmM9uoruB2stkPA5pDEz9pXFV
 klWV930zM+38HxheOe963fyPGxTIo+n8x12TIKk6GDyRBQK5fU9JcIyd5
 YoLadDC0Uy0kN8+tmP1J+IvcPkkUzic47fw1XRs1YXBNIAznaNBGOLAon w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10500"; a="305397534"
X-IronPort-AV: E=Sophos;i="5.95,184,1661842800"; d="scan'208";a="305397534"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2022 09:03:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10500"; a="578672320"
X-IronPort-AV: E=Sophos;i="5.95,184,1661842800"; d="scan'208";a="578672320"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP; 14 Oct 2022 09:03:32 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 14 Oct 2022 09:03:31 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 14 Oct 2022 09:03:31 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 14 Oct 2022 09:03:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MYdQU5unCuIk9xTPiEN3JcaClPOxFf6wF12NG/wU/v2ZiB3MY0OEJ/Cqe2+rMe1X9q+VDhXJkQnzFa5kLZefD4rwjpIPNnfLWXQ5IHdjcQRVR5uQwDegh7mGFtC5TjOIm/gAQIYbhWQTrbJj+nWxHSSxYEAjijtkNLe4v6Nv3P9Dv9N5ETpFtrR01kM/DI/rmNn8YZDlNo/QUK0O50V7ZiNBVdUm0nHRh1Z6x3hNco2/I4Sp1xe2WwwGnfVzwSZ25/Gk2Nd9R6pvJfzD3l9bTj67jkApwcOK8BhSbUuje05ML45JPofOzrDz6agEbKcaiyzWCN0Ul3AkoKG/s1G/yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VvYapaUpEgUTQ3SbaWA3ZdzR2ECDM0Zu1EJ1Rw7RZbE=;
 b=m+kqXPNADzGA7a0CyQEaClOSaCfW/FHLDSBP5JTGiqlw8eXJXxOv/03jnTwSX1+6G26GS+vb8poSucNz6B58pduH3JLkZj2EkUM/rnbzXCSfyTKSsaCmv2Qr8avWLoFivqjb2UbZDJZ/aMHh+F6Q/LK85Subt2pKw91zxzu115xwCQJ8I+/hIJm4Wg8sIutUYBcgXyzZ+eo7yBI8EUJuXi/yPK8VEDeRjTZ4eapbifz/xV8Md8agWdvpEyuwR2h7JyvS0XPJAVYMjANSQRgbaZe44F/h2MlW0iRkPTOCK85LM1zuj5qcdUv5re/AsKzl7uPIfs2Xzz8jPq6Wge3wHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1897.namprd11.prod.outlook.com (2603:10b6:3:112::9) by
 BN9PR11MB5258.namprd11.prod.outlook.com (2603:10b6:408:133::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Fri, 14 Oct
 2022 16:03:06 +0000
Received: from DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::c0e8:f5ad:37d:ee67]) by DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::c0e8:f5ad:37d:ee67%3]) with mapi id 15.20.5709.021; Fri, 14 Oct 2022
 16:03:05 +0000
Date: Fri, 14 Oct 2022 21:32:55 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2 13/14] drm/i915/mtl: Add multicast steering for render
 GT
Message-ID: <Y0mILx4Pm9kGQxs4@bala-ubuntu>
References: <20221001004550.3031431-1-matthew.d.roper@intel.com>
 <20221001004550.3031431-14-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20221001004550.3031431-14-matthew.d.roper@intel.com>
X-ClientProxiedBy: PN3PR01CA0034.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::6) To DM5PR11MB1897.namprd11.prod.outlook.com
 (2603:10b6:3:112::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1897:EE_|BN9PR11MB5258:EE_
X-MS-Office365-Filtering-Correlation-Id: 404c96be-9cba-4025-971e-08daadfd943f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M1mJ81pqxWGkXRpZrPpJ1xxgzdNhXkZQTQwn5uwcVPoFv6MMEhqFc/j6Ogn3aaZzFxOkpOB3xIpwx7NqD64t7/S0k+jgdij+qgN/kpzilyjgmvzYgzevX6s6PwDb/T82HbmXGm5m+SdxfcgqxMEleG47XGOCnBCjO5l1TBNBqYdesb4yDhzw4FafWYEn0Llcsh/YJn4Jy+I9zPxMk1X9KuxJC3RsDnzkLFpiEpG7AjQe7OvUPIV/vj4d5LhEm3vSyateJEvW8l6zJUsv+2U+XPHG7XcwUctd+qZ7wT1WIZoV5QB4FgClR3k8oBTBO50cUCb/H9zfh1o8QK0XEKmLP4ddAfFcFASLnUnax2KmRmCznBiiL3AosSJMYzg4Ta0ZHpgqkUUNKrG2McWs3RnhE3Jo75gBAWeu/gLZnzwJngjtDKsJjA/NpfB/Wwej7QYHvnToa1t0l34DZ/nd8ReBVFqlnzTAj9Wgqj4oU3wOXfTgZl/QxcRYQNZD1xnmpX/R9O+2A0ADUo8EEqCTf+Ta9BSNXhWAGrarTK4pe9WeDAosPlfi/XHzBW+tWCx0OAleMiqX5XUmZsgAbBhA6qNuDa8zOGESbV/vkaBx9IU3ZQ91d/WQYUouUHNwy1n2vQnse1ujVT8l3sRMtDDgN7SeKr3J9TNiN6R2qgpb76BgHyJNKI6+PK2wfrtESJ7s+jvYDLandK5yYnBc/kOw0KzWBA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(366004)(396003)(39860400002)(346002)(376002)(136003)(451199015)(86362001)(38100700002)(82960400001)(2906002)(186003)(5660300002)(44832011)(30864003)(6666004)(107886003)(6506007)(26005)(6512007)(9686003)(53546011)(83380400001)(6486002)(316002)(478600001)(33716001)(66946007)(450100002)(66556008)(66476007)(8676002)(4326008)(41300700001)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Sm1qb2JWUXpzUks4aEoyZjdKcSsrWHpKR2JtdFZYUk9NSGE2Qm9BR00wUDJG?=
 =?utf-8?B?VlJQT09Xc2F5T3dybHVTQW1LNTAxWEVlSjk2RTFzWkN1d0FqRTI1c3Yva0NE?=
 =?utf-8?B?RUdWc1k1K3VZQmtwMjRjQzlPeEtGb203WnpURGxvQTNDbERqNmZBUjl5REln?=
 =?utf-8?B?V0lrZzdlaEdOcHdQd0F3QzBObks5NXdEQ1oySE1vcWxtSFVDNnZCcmNKSGZ4?=
 =?utf-8?B?QW5Pa29GMmU2SnlKeTZMVDk1cE84VWZKZ3dHYTdYNW43RGtKSVRNQ0l2Unk4?=
 =?utf-8?B?aEJXaU80MlpTWlgyQ3BpOTFQZThFV2NZdnJJK0ZwUmJMbFN5enkyQzBSQ09q?=
 =?utf-8?B?MjJZUTFxZzZreG1RM1BORmttako3T2JtaS9SY29DS2E3QUc4cGxQNWlDMEJj?=
 =?utf-8?B?MlcrbEU1QkovdFh5TU02Um9xeWQ4UXBSVE9iaWJLc3J4NWhoTkR1MWttK0Q4?=
 =?utf-8?B?dmFleGg1UTZLQzliUU9hZlRxdGNkakZLbjZhSTl1MlJ5OVlSVWl3REFZMFlj?=
 =?utf-8?B?c2xQQzhIbGFicVhLdEFOSnFucnNvM0dUTWdwRDVpRFprSDdsNExqL1VQM2NS?=
 =?utf-8?B?a1hjL2phQVBUelB4Z1FiWnU1L3puM0hjMUE3T0ZnQnE1VWhUSUJzMGRmcDR5?=
 =?utf-8?B?WGNiaVlGRDM2YngvZ3JMZ1lTVEJad1JpUlQ3R3JaMjB3SVk3MzQyR0ZDMkw0?=
 =?utf-8?B?TWJaZkY1VzNHcitnQTI3WUczR2tESWp0ZlNZRUtweFozOXFqTkI4Q0VDNUlw?=
 =?utf-8?B?aU5IaElTOE5HNzFJR1o1UzVaVVBQK2lxcUpIN0IyQnYvb2RhbTZCSnBhRE1w?=
 =?utf-8?B?WmVXWHliTXV3VjJqNFEwSWlHNEw4UTgwN0gweGM5ZUdhdUNxVldtd0RUd2R1?=
 =?utf-8?B?QUtSVmJzOVovWGp1TFNDTWcrR0tmQ212TlRpaUltQUU2b1dLcjA5RGpTRlcr?=
 =?utf-8?B?eEplK2ZuSldpWnhCVzNTL1N4L3laa0MrVFEvdHNwc2xvQ05ySWcwdTRsRXlq?=
 =?utf-8?B?Q05rMXVWclZwdmJwM2o5aDVITFhuaXFqMThLNVdJUzI4OGxGQ3p3SWtTNnRI?=
 =?utf-8?B?bWRES2xORGtDa3d4dWdGWmdlTXVmZ1VYVXRQd3NBY0FwbnFobjI2aURibWFu?=
 =?utf-8?B?TVZ3K2s4VUloanJKZjYydHd5a2xPaFZVZGNFdXZpeWl5TjdjdGpsRG52V0Ix?=
 =?utf-8?B?aXZ3UlR1czNIS0lkcy9UZk5lT1BrUTU0eTRmR2t3bGEyNHBnSENjNlNGbjFP?=
 =?utf-8?B?ZE1mSFlVMmlsQU5LaWRicTV5TFdib3JQanUwTGtmbEo3cGsyQytmYk5uR0c3?=
 =?utf-8?B?T01HRC82WTErbGtpaFNVek5yaVZIV29UUlUrL0JMako0UXNzN2N1L1h1aVRP?=
 =?utf-8?B?N3FhemljMjdQb1pXK29rY2ZjQWMrb3NxdWFmdlJocVNHSk9kOURLTXh2ZW5m?=
 =?utf-8?B?QXlTV1BQbXdKb1hGdmNCNkV5cEx4R2Y2ZUt6WEhyRjBwK1ltUEw5RW5UTVEz?=
 =?utf-8?B?d2MyM2w0VTVhdnczQTQvcnZDV0h0bE5NRHdMVUFuUGhGanRXd3UyOUQxZkZS?=
 =?utf-8?B?TVB1eGlvK3c5UFQyYndKelprYVI2dFZLU3REMlhJYSswdDljZUl1dmMyMTE4?=
 =?utf-8?B?KzdSVVFmajNsM3dRZzcwOFUvZVd1RWIxN2FkYURsM3lHTHJsdEsxNjlLZ2F6?=
 =?utf-8?B?UWZSN0pUOUJuRFFtRml3TnFBUEVQeXFsMllEKy9PUzdvS3lyTGVXT05IcDNM?=
 =?utf-8?B?Q3hVTFFiQTNMT1dFc2MvTm14S2JTdkdhZHovUDBRejZHRThFaXJKeVQ5WC9F?=
 =?utf-8?B?RVJYaUxNL1NNWDUvZFhFbVA5aWlHem91T0svYjUrb053d3ZGamJnUjE5WUc1?=
 =?utf-8?B?RHZpSUZ5ZWJUUFJJaWFMQ3lkb2tlNU1teTZaTmlDdzZpVkNvcE16M3BjNnZt?=
 =?utf-8?B?NUw3NDQvekQvRUY1aWVGKzNWMnRrc1Q1UllBK1dNcEFHQk8zM3RqZk02cVhP?=
 =?utf-8?B?VEhRbWtydlRmTXNoOXJRTDB1UnlSbFRVd2ZlelZnUUxhYTRqQi9XeEtnMUJl?=
 =?utf-8?B?N1lEMHZuSDEvVllNZ2Y4WmY1S3ZINTRDOGF4a0JpRVhmSW85SDBLaVFuSXpR?=
 =?utf-8?B?WFRQUWZiekp3Q0FERGpjcUN2bzh5S3V3azViVUZxcWxndDl1SGZOcUtCMWZT?=
 =?utf-8?Q?pxJAWYPLGW3AzvDIlh0nqjM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 404c96be-9cba-4025-971e-08daadfd943f
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2022 16:03:05.5622 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LKMOtcGjj/otfa+rhg03Ef9lx4tC36wzTWsKcgmnA5HOaDeINnpuO/DtThYeg0IAsM9hKgjZ/NIipM9ommiJr39ISPl9NtU33TZPAyZ73MCYlPrImuHqg3rPETQknDbZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5258
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
Cc: ravi.kumar.vodapalli@intel.com, dri-devel@lists.freedesktop.org,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30.09.2022 17:45, Matt Roper wrote:
> MTL once again changes the multicast register types and steering
> details.  Key changes from past platforms:
>  * The number of instances of some MCR types (NODE, OAAL2, and GAM) vary
>    according to the MTL subplatform and cannot be read from fuse
>    registers.
>  * The MCR steering register (and its bitfields) has changed.
> 
> Unlike past platforms, we will be explicitly steering all types of MCR
> accesses, including those for "SLICE" and "DSS" ranges; we no longer
> rely on implicit steering.  On previous platforms, various
> hardware/firmware agents that needed to access registers typically had
> their own steering control registers, allowing them to perform multicast
> steering without clobbering the CPU/kernel steering.  Starting with MTL,
> more of these agents now share a single steering register (0xFD4) and it
> is no longer safe for us to assume that the value will remain unchanged
> from how we initialized it during startup.  There is also a slight
> chance of race conditions between the driver and a hardware/firmware
> agent, so the hardware provides a semaphore register that can be used to
> coordinate access to the steering register.  Support for the semaphore
> register will be introduced in a future patch.
> 
> Bspec: 67788, 67112
> Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_mcr.c      | 85 ++++++++++++++++++---
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h     |  5 ++
>  drivers/gpu/drm/i915/gt/intel_gt_types.h    |  8 +-
>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 18 ++++-
>  drivers/gpu/drm/i915/i915_pci.c             |  1 +
>  5 files changed, 102 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> index 9e2caba64f19..a1fa71b47831 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> @@ -41,6 +41,7 @@ static const char * const intel_steering_types[] = {
>  	"MSLICE",
>  	"LNCF",
>  	"GAM",
> +	"DSS",
>  	"INSTANCE 0",
>  };
>  
> @@ -99,9 +100,40 @@ static const struct intel_mmio_range pvc_instance0_steering_table[] = {
>  	{},
>  };
>  
> +static const struct intel_mmio_range mtl3d_instance0_steering_table[] = {
> +	{ 0x000B00, 0x000BFF },         /* SQIDI */
> +	{ 0x001000, 0x001FFF },         /* SQIDI */
> +	{ 0x004000, 0x0048FF },         /* GAM */
> +	{ 0x008700, 0x0087FF },         /* SQIDI */
> +	{ 0x00B000, 0x00B0FF },         /* NODE */
> +	{ 0x00C800, 0x00CFFF },         /* GAM */
> +	{ 0x00D880, 0x00D8FF },         /* NODE */
> +	{ 0x00DD00, 0x00DDFF },         /* OAAL2 */
> +	{},
> +};
> +
> +static const struct intel_mmio_range mtl3d_l3bank_steering_table[] = {
> +	{ 0x00B100, 0x00B3FF },
> +	{},
> +};
> +
> +/* DSS steering is used for SLICE ranges as well */
> +static const struct intel_mmio_range mtl3d_dss_steering_table[] = {
> +	{ 0x005200, 0x0052FF },		/* SLICE */
> +	{ 0x005500, 0x007FFF },		/* SLICE */
> +	{ 0x008140, 0x00815F },		/* SLICE (0x8140-0x814F), DSS (0x8150-0x815F) */
> +	{ 0x0094D0, 0x00955F },		/* SLICE (0x94D0-0x951F), DSS (0x9520-0x955F) */
> +	{ 0x009680, 0x0096FF },		/* DSS */
> +	{ 0x00D800, 0x00D87F },		/* SLICE */
> +	{ 0x00DC00, 0x00DCFF },		/* SLICE */
> +	{ 0x00DE80, 0x00E8FF },		/* DSS (0xE000-0xE0FF reserved) */
> +};
> +
>  void intel_gt_mcr_init(struct intel_gt *gt)
>  {
>  	struct drm_i915_private *i915 = gt->i915;
> +	unsigned long fuse;
> +	int i;
>  
>  	/*
>  	 * An mslice is unavailable only if both the meml3 for the slice is
> @@ -119,7 +151,22 @@ void intel_gt_mcr_init(struct intel_gt *gt)
>  			drm_warn(&i915->drm, "mslice mask all zero!\n");
>  	}
>  
> -	if (IS_PONTEVECCHIO(i915)) {
> +	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70) &&
> +	    gt->type == GT_PRIMARY) {
> +		fuse = REG_FIELD_GET(GT_L3_EXC_MASK,
> +				     intel_uncore_read(gt->uncore, XEHP_FUSE4));
> +
> +		/*
> +		 * Despite the register field being named "exclude mask" the
> +		 * bits actually represent enabled banks (two banks per bit).
> +		 */
> +		for_each_set_bit(i, &fuse, 3)
> +			gt->info.l3bank_mask |= (0x3 << 2*i);
> +
> +		gt->steering_table[INSTANCE0] = mtl3d_instance0_steering_table;
> +		gt->steering_table[L3BANK] = mtl3d_l3bank_steering_table;
> +		gt->steering_table[DSS] = mtl3d_dss_steering_table;
> +	} else if (IS_PONTEVECCHIO(i915)) {
>  		gt->steering_table[INSTANCE0] = pvc_instance0_steering_table;
>  	} else if (IS_DG2(i915)) {
>  		gt->steering_table[MSLICE] = xehpsdv_mslice_steering_table;
> @@ -184,7 +231,12 @@ static u32 rw_with_mcr_steering_fw(struct intel_uncore *uncore,
>  
>  	lockdep_assert_held(&uncore->lock);
>  
> -	if (GRAPHICS_VER(uncore->i915) >= 11) {
> +	if (GRAPHICS_VER_FULL(uncore->i915) >= IP_VER(12, 70)) {
> +		/* No need to save old steering reg value */
> +		intel_uncore_write_fw(uncore, MTL_MCR_SELECTOR,
> +				      REG_FIELD_PREP(MTL_MCR_GROUPID, group) |
> +				      REG_FIELD_PREP(MTL_MCR_INSTANCEID, instance));

I think we need to clear the MULTICAST bit in the MTL_MCR_SELECTOR
register here since we are doing unicast r/w.

And in the functions intel_gt_mcr_multicast_write() and
intel_gt_mcr_multicast_write_fw(), we need to set the MULTICAST bit
in the MTL_MCR_SELECTOR register for MTL since we no more rely on
default values for the MTL_MCR_SELECTOR.

Can I also suggest to optimize the groupid and instanceid calculation
during non-terminating unicast MCR read/write by caching the groupid and
instanceid in some variables instead of calculating it everytime?
Because from MTL we have replaced all MCR register reads with implicit
steering to intel_gt_mcr_read_any/_fw call, and each call of that
function does groupip/instanceid calculation.

Regards,
Bala

> +	} else if (GRAPHICS_VER(uncore->i915) >= 11) {
>  		mcr_mask = GEN11_MCR_SLICE_MASK | GEN11_MCR_SUBSLICE_MASK;
>  		mcr_ss = GEN11_MCR_SLICE(group) | GEN11_MCR_SUBSLICE(instance);
>  
> @@ -202,26 +254,30 @@ static u32 rw_with_mcr_steering_fw(struct intel_uncore *uncore,
>  		 */
>  		if (rw_flag == FW_REG_WRITE)
>  			mcr_mask |= GEN11_MCR_MULTICAST;
> +
> +		old_mcr = mcr = intel_uncore_read_fw(uncore, GEN8_MCR_SELECTOR);
> +
> +		mcr &= ~mcr_mask;
> +		mcr |= mcr_ss;
> +		intel_uncore_write_fw(uncore, GEN8_MCR_SELECTOR, mcr);
>  	} else {
>  		mcr_mask = GEN8_MCR_SLICE_MASK | GEN8_MCR_SUBSLICE_MASK;
>  		mcr_ss = GEN8_MCR_SLICE(group) | GEN8_MCR_SUBSLICE(instance);
> -	}
>  
> -	old_mcr = mcr = intel_uncore_read_fw(uncore, GEN8_MCR_SELECTOR);
> +		old_mcr = mcr = intel_uncore_read_fw(uncore, GEN8_MCR_SELECTOR);
>  
> -	mcr &= ~mcr_mask;
> -	mcr |= mcr_ss;
> -	intel_uncore_write_fw(uncore, GEN8_MCR_SELECTOR, mcr);
> +		mcr &= ~mcr_mask;
> +		mcr |= mcr_ss;
> +		intel_uncore_write_fw(uncore, GEN8_MCR_SELECTOR, mcr);
> +	}
>  
>  	if (rw_flag == FW_REG_READ)
>  		val = intel_uncore_read_fw(uncore, mcr_reg_cast(reg));
>  	else
>  		intel_uncore_write_fw(uncore, mcr_reg_cast(reg), value);
>  
> -	mcr &= ~mcr_mask;
> -	mcr |= old_mcr & mcr_mask;
> -
> -	intel_uncore_write_fw(uncore, GEN8_MCR_SELECTOR, mcr);
> +	if (GRAPHICS_VER_FULL(uncore->i915) < IP_VER(12, 70))
> +		intel_uncore_write_fw(uncore, GEN8_MCR_SELECTOR, mcr);
>  
>  	return val;
>  }
> @@ -385,6 +441,8 @@ static void get_nonterminated_steering(struct intel_gt *gt,
>  				       enum intel_steering_type type,
>  				       u8 *group, u8 *instance)
>  {
> +	u32 dss;
> +
>  	switch (type) {
>  	case L3BANK:
>  		*group = 0;		/* unused */
> @@ -408,6 +466,11 @@ static void get_nonterminated_steering(struct intel_gt *gt,
>  		*group = IS_DG2(gt->i915) ? 1 : 0;
>  		*instance = 0;
>  		break;
> +	case DSS:
> +		dss = intel_sseu_find_first_xehp_dss(&gt->info.sseu, 0, 0);
> +		*group = dss / GEN_DSS_PER_GSLICE;
> +		*instance = dss % GEN_DSS_PER_GSLICE;
> +		break;
>  	case INSTANCE0:
>  		/*
>  		 * There are a lot of MCR types for which instance (0, 0)
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index b7341f01ec9f..c5b9671097e3 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -59,6 +59,7 @@
>  #define GMD_ID_MEDIA				_MMIO(MTL_MEDIA_GSI_BASE + 0xd8c)
>  
>  #define MCFG_MCR_SELECTOR			_MMIO(0xfd0)
> +#define MTL_MCR_SELECTOR			_MMIO(0xfd4)
>  #define SF_MCR_SELECTOR				_MMIO(0xfd8)
>  #define GEN8_MCR_SELECTOR			_MMIO(0xfdc)
>  #define GAM_MCR_SELECTOR			_MMIO(0xfe0)
> @@ -71,6 +72,8 @@
>  #define   GEN11_MCR_SLICE_MASK			GEN11_MCR_SLICE(0xf)
>  #define   GEN11_MCR_SUBSLICE(subslice)		(((subslice) & 0x7) << 24)
>  #define   GEN11_MCR_SUBSLICE_MASK		GEN11_MCR_SUBSLICE(0x7)
> +#define   MTL_MCR_GROUPID			REG_GENMASK(11, 8)
> +#define   MTL_MCR_INSTANCEID			REG_GENMASK(3, 0)
>  
>  #define IPEIR_I965				_MMIO(0x2064)
>  #define IPEHR_I965				_MMIO(0x2068)
> @@ -531,6 +534,8 @@
>  #define   GEN6_MBCTL_BOOT_FETCH_MECH		(1 << 0)
>  
>  /* Fuse readout registers for GT */
> +#define XEHP_FUSE4				_MMIO(0x9114)
> +#define   GT_L3_EXC_MASK			REG_GENMASK(6, 4)
>  #define	GEN10_MIRROR_FUSE3			_MMIO(0x9118)
>  #define   GEN10_L3BANK_PAIR_COUNT		4
>  #define   GEN10_L3BANK_MASK			0x0F
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> index 30003d68fd51..77ecbd6be331 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> @@ -60,6 +60,7 @@ enum intel_steering_type {
>  	MSLICE,
>  	LNCF,
>  	GAM,
> +	DSS,
>  
>  	/*
>  	 * On some platforms there are multiple types of MCR registers that
> @@ -255,8 +256,6 @@ struct intel_gt {
>  
>  		intel_engine_mask_t engine_mask;
>  
> -		u32 l3bank_mask;
> -
>  		u8 num_engines;
>  
>  		/* General presence of SFC units */
> @@ -268,7 +267,10 @@ struct intel_gt {
>  		/* Slice/subslice/EU info */
>  		struct sseu_dev_info sseu;
>  
> -		unsigned long mslice_mask;
> +		union {
> +			unsigned long mslice_mask;
> +			unsigned long l3bank_mask;
> +		};
>  
>  		/** @hwconfig: hardware configuration data */
>  		struct intel_hwconfig hwconfig;
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index 174c74dcda99..9be048da7fb3 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -1581,12 +1581,28 @@ pvc_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>  	wa_mcr_write_clr(wal, GEN8_MISCCPCTL, GEN12_DOP_CLOCK_GATE_RENDER_ENABLE);
>  }
>  
> +static void
> +mtl_3d_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
> +{
> +	/*
> +	 * Unlike older platforms, we no longer setup implicit steering here;
> +	 * all MCR accesses are explicitly steered.
> +	 */
> +	if (drm_debug_enabled(DRM_UT_DRIVER)) {
> +		struct drm_printer p = drm_debug_printer("MCR Steering:");
> +
> +		intel_gt_mcr_report_steering(&p, gt, false);
> +	}
> +}
> +
>  static void
>  gt_init_workarounds(struct intel_gt *gt, struct i915_wa_list *wal)
>  {
>  	struct drm_i915_private *i915 = gt->i915;
>  
> -	if (IS_PONTEVECCHIO(i915))
> +	if (IS_METEORLAKE(i915) && gt->type == GT_PRIMARY)
> +		mtl_3d_gt_workarounds_init(gt, wal);
> +	else if (IS_PONTEVECCHIO(i915))
>  		pvc_gt_workarounds_init(gt, wal);
>  	else if (IS_DG2(i915))
>  		dg2_gt_workarounds_init(gt, wal);
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> index 38460a0bd7cb..bd1d8e0205a6 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -1145,6 +1145,7 @@ static const struct intel_device_info mtl_info = {
>  	.extra_gt_list = xelpmp_extra_gt,
>  	.has_flat_ccs = 0,
>  	.has_gmd_id = 1,
> +	.has_mslice_steering = 0,
>  	.has_snoop = 1,
>  	.__runtime.memory_regions = REGION_SMEM | REGION_STOLEN_LMEM,
>  	.__runtime.platform_engine_mask = BIT(RCS0) | BIT(BCS0) | BIT(CCS0),
> -- 
> 2.37.3
> 
