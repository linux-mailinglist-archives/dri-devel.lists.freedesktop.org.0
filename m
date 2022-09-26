Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DF85E995A
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 08:15:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C31B10E4EB;
	Mon, 26 Sep 2022 06:15:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7967F10E36F;
 Mon, 26 Sep 2022 06:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664172934; x=1695708934;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ACJ5kS9vQ2IOW3ljv79FmlN6tXnGuQ0w24RcaCkfAVE=;
 b=aUwS3DRKqidskr8JI41TjaeHPxHwmsDeW+2HARpTbSRGeEEkXygYaijc
 6isqUrYkzL6LoQJDA9BwxjKXKpb6LoGh7ZfBgAvejUp3aIJhNz19KhKoB
 nDPIJKoz6fQlG0LJ5bAz/i3bZGKI1k7rF0ZBV7JZ5DhX3fR2HNHK9Z8kh
 RD/KwUWzi8koE6XXU0D1r+pi4nX22GrxfYnLw0TnasMO64VvL8shObsen
 UUuOFRgaFUXwdMhaqH9enpfisatHOJ7VGWJrcIT1L9dM5n9Z0DlnBjnGq
 7QFzKVmU+glhaxKiFWHR2ICJJBK4wV/s7FeCjF5oaycugsLzAnL6xNVqt g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10481"; a="364979882"
X-IronPort-AV: E=Sophos;i="5.93,345,1654585200"; d="scan'208";a="364979882"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2022 23:15:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10481"; a="651706182"
X-IronPort-AV: E=Sophos;i="5.93,345,1654585200"; d="scan'208";a="651706182"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP; 25 Sep 2022 23:15:33 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sun, 25 Sep 2022 23:15:33 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sun, 25 Sep 2022 23:15:33 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Sun, 25 Sep 2022 23:15:33 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Sun, 25 Sep 2022 23:15:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eXo/V6w8nqMIXQcjZAe5fUhxS1JdB8RFfEg7oh5KquAmQp+zJwklYJG3KFmABG18bJRPYegu0FrMAFxfgVqakJP6XC4qm0/23nitLjkNHiMKFgEzWHZyhAcIZlzKS64aP87CJNJkZGGUhCjznRrZRS5H6Qypi6UZvvDWXBDW7BAlqLeeC2RbPZEViU7Pvx2gdQBQrlbZlfMBWYluZzrAq1DdR8bx8VK5QNSKez6aCA0vuJCpiEhiba2vzArlcNzAkhU7fDMsFcQvusMy7kldCKw6HJpzwA1YgVw7nhP0fTExsSfb4kZj3avkDwAnsolJrxTQm8Qf59mhOMD0iFUllQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UBZ5OM2gZ8C/bhFIkKjQ9ZIwsGp8jCqC/DNTH5asbcQ=;
 b=bs0rEfr99ld9G4L3U7GdEKAaruRBZYJwqLcSJXLt9UtQ3UODIo1bFV2EYpH7rTflorD/h5NckdJmco3zWCru7NKzctjmG1NCL9fKrpfPLXXfEXwHAcHOVB6Utp4HXYxfRcLbkfvXWuRef+/q/1q8BLUVb+llOceDLl5svKG1gapYq/3fiyDIcYXQ69lxdSMvZPm8QNGiOithlxv8MQwOANKyeWKuYKK+IBQEc1sjk8nG/mh5ZnyGHA+9F4VJ4x9HItBkfFTT3d1Fsrt21GjuqD/od7okX7iR0gnukZ9rGMtSUHMT/0SjOENxrHe+1/LUjGi32sFhQpHwyk+CZfA+aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1897.namprd11.prod.outlook.com (2603:10b6:3:112::9) by
 DS7PR11MB6222.namprd11.prod.outlook.com (2603:10b6:8:99::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.18; Mon, 26 Sep 2022 06:15:29 +0000
Received: from DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::fc2f:babb:578c:f03e]) by DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::fc2f:babb:578c:f03e%6]) with mapi id 15.20.5654.024; Mon, 26 Sep 2022
 06:15:29 +0000
Date: Mon, 26 Sep 2022 11:45:19 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 01/12] drm/i915/gen8: Create separate reg definitions for
 new MCR registers
Message-ID: <YzFDd8IZ6giMmnoQ@bala-ubuntu>
References: <20220919223259.263525-1-matthew.d.roper@intel.com>
 <20220919223259.263525-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20220919223259.263525-2-matthew.d.roper@intel.com>
X-ClientProxiedBy: PN2PR01CA0152.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::7) To DM5PR11MB1897.namprd11.prod.outlook.com
 (2603:10b6:3:112::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1897:EE_|DS7PR11MB6222:EE_
X-MS-Office365-Filtering-Correlation-Id: 2762d4de-d033-4439-636a-08da9f868269
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +7ZtCuU9/mkvPpiB2stZloPIMtGdK15haZKZbfvXxBlwk78aPgvIRYXrxDqz//EaFe0mN4YLNk8u0G3A80DxEQN6PexiQukC2xlDCbQZNClG2Xi4SmEZVwbj52jcHe5NNcsmswGFoCfVRZ6m9EvNeNxiokHRyxZad1k4fZbtYKC1xn0CJMsgVsT3zDKPWfxQKbhTeQtjcA0X87PJETS5LjMwwfSF+rX+Xv0Yl6b07x0NnKhSmWbDHgKbmxYJnqS9+RYvwEpAjN/iyGB9wlKqJkrGNPCvqfpFjyjPY+aw0tG98meWWfR5FWYyNO9nqaByLfj4+n1UFBMJ/3KmmIVLLNqjXHRYDxSRN7YY4JbDsX8j61Z51NgF77AC0WEIsYHlE3REBf86HG1pdNu0GBVM1qqWCJ6kZYq+rRREEHdp8Fu88p3SorYNccB1ms6SmoG9rUXF4xk2GHMgk07iv8yU8QSJdP/8odwItY5tFfCKLhTm4xE5+ua/E6BY9TCAVlBNfdn0F+PdgVZWGmBO1wy8Td0s/WuzGUHhCAfUxppZ0BLOWQs8kzKmMx7Goxfw1aqNMhWItAKhu9kXcuilt9mOkF7BLDW+05/8632HO9l3pltIcoV+ald1lsNtwsP3tpAE1f0XDb3I4GA8YKpzT16cIbbCZHh8nltamq24KTYUs/6zjDAMfvZk3kD+uwwW2rRtMbWYupCRSSfnTGFsA2dGUA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(366004)(39860400002)(346002)(136003)(376002)(396003)(451199015)(44832011)(82960400001)(38100700002)(478600001)(6486002)(41300700001)(2906002)(86362001)(5660300002)(30864003)(66556008)(66476007)(316002)(6506007)(8936002)(9686003)(66946007)(6512007)(6666004)(26005)(33716001)(4326008)(53546011)(83380400001)(8676002)(450100002)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWFmeEVUZXovdEpTd1pna0o2RDBuOFZKcUtvNGtoeUpNMktaWlVvTFZDbFJu?=
 =?utf-8?B?SkF4N1VLbFBsankrM21oQytEazVieWZSeDdPWDFTeE1yRytzbTdIMHlPWEgw?=
 =?utf-8?B?bGxUMzV5NFlPRERxS1dmeDhsU0d4T1p5STBTVGJEUDE2QkZzTStOOGwyM1Na?=
 =?utf-8?B?bitqcUoxOXV6R21QOEQ0aEQ4QWFTeDNFVnZkMUEvY1Nta1Rpckd4SUJiQ1BG?=
 =?utf-8?B?eFlKTUlpeS81V3prcUVaNjhhNGhhcDg5TU1DL3JnYTlUdGNQVmtkWWlLNGEw?=
 =?utf-8?B?NDVwVncxdFlDS2Z4QUxmZDlscDJVYUZEcmRRWXdCRDBiZFM2OCtXK2pJSS93?=
 =?utf-8?B?ZkcrdzJTUC9mMW9lRkxlUzdIMUUvMHA0YWtBaSs0ZndoNzk4WDNOSFNoWWJZ?=
 =?utf-8?B?QVZpb1RDSEtyejQ4RjVXdStQRUMrbE5RMlAvTmpZWGRqcDlnbjgrZFVqZm8v?=
 =?utf-8?B?THlyNTdKQk1QYi9wSDYxR1A2dnpLTG9SZ1FGVW1leGJsUGRKWEFGU1I4ZnRq?=
 =?utf-8?B?UUs4SnlZMFlveFRkSkNJZUdqc3M5MGFQMkh0alBJVE9uUSsyMFVUQkc5SmpZ?=
 =?utf-8?B?R1NoMUxKZXRTd3BuQm9vaFVKaHgvRXMxajhSNFB2enVIcnkyS3dQYzlBWTdL?=
 =?utf-8?B?b3JwQWUwNXNvWlR6RHZQWTlDU0hMSGFBc3hsMkdUYi9tS1diTEswRi8rMVFZ?=
 =?utf-8?B?ZmVEbTZ6RmkvRGdXcjJBSlIrRDk1YmgxQk1kVFZ5aDJ3T2g4c04zTWxUcmtL?=
 =?utf-8?B?MFBSU0J5bGMxdGdEMGQ4ZTcySXZFWlhOSHF2K3cxUm1TVFZKWkZHZk9EcDU5?=
 =?utf-8?B?R1hlcXhxd09Fa1QvVnJGWEtlOHFVcmdTcU9IY3A1NFhzU2lEcnJDTTRKT25j?=
 =?utf-8?B?Qm1nTnpmZVlkbkdsek4vaWFPUzV3eW5LWVhCeGp2VWNSS2U0cmNoTmVpS3dH?=
 =?utf-8?B?aGNsM2FHWGZrdHd3cTJXbjdjTUhiZVVaMkNBUTZjSHZsOC9PbXBPOUFwaUlE?=
 =?utf-8?B?QVZITE85Y0w2Ukh2enRsbVlzSmdXWkVJRURZaDJPcFlnLytYbzJId2VndGZT?=
 =?utf-8?B?NHhzbjZab2M3OG9DcGlvc2lXT2RSM1I5eUxMcjJyV2E4K2lEc2UxUTN1ekNa?=
 =?utf-8?B?SFB6ck0rYUUzMlB1YjNmVXVVK1EyWi9tWC9QYTdWQnpkZkQzVm8yYlE4QThv?=
 =?utf-8?B?WmdFQjl0Y3lHQlQvSGR6d1pQQWR5b3RvMEVKcHNqREZIV2tnTENqbnBPOXR1?=
 =?utf-8?B?YWVDeWpFeFB2Ny9jejA2dHNKdkpUZ3puLzNlOWtlWkJHRzFOK0VwcVRCNUZY?=
 =?utf-8?B?WWpCT0ROWSs1WUNvYTAzbVpQVWlueS9hdVcyazlhVDhIQXNCTHpsZm1yTG5D?=
 =?utf-8?B?L0JxcW82cnd0Qms2QWc3Rk9iOVkwZkc3WVRGUjNpY1FGQjZ4U0FUZUNNaGh6?=
 =?utf-8?B?dXl0VldiNTFnbi8wRWF1aWV2aVBxWEtmT1M1RzJkZHlaYnJBQWgxN3g1S2J2?=
 =?utf-8?B?VkVQQm04WWh2T2M3MWhzM25Tcks2emJZemtCQWNuRmcwQllRSW9iTEtzZ2lU?=
 =?utf-8?B?akJMRmJPaHdoRGd0WWdZaE54dmV4QXROQXl3UUdmWFIyYlJiRWw4c3NDcitQ?=
 =?utf-8?B?RTBzUWdLTURlVzU0ZmplNmpmTjZHMU9KQUVQejBhL1RrcXMwREk4R0hzbmtP?=
 =?utf-8?B?S0VEb1pjWXg4SU5LcnU0dnZtZndUYis0OVRlSlFyUGJWMjFhbGZJbmsyR1lU?=
 =?utf-8?B?bDRmaUI3SWVYMFlUdW90WGdlZVJjZjUrYms0d2JmSnRpRGFXNEtWdkhVUWlH?=
 =?utf-8?B?ckJQc0dXd3hWZlhNOHNGUUF6TytKK3NtUS9sb2Fzd1Vtc1dCNW8wczF3TUtu?=
 =?utf-8?B?S0xIYTI3aG9rZFdYQTZpWGVjL0x0cDNIU2xDMWpzamp2Szd1NW9TTmdsVTRW?=
 =?utf-8?B?NUdzYzVtdFhFSU1rM3liYTNWS3RPR0J3MUJpUzFkRC9YQXNpRHpXWG8raWpu?=
 =?utf-8?B?ZGZxb0k0alc2ZTVWa3lYSXpucDBOdDBjZGJQMVRROW5LSE45eFhReWZPZ1o5?=
 =?utf-8?B?RENuOXJIL0dKSWRYcE1hLzU3ZktIOGxWL2d6RVR1QnZ2WmJTbHZvalo0MUlE?=
 =?utf-8?B?N3lCMUR5dTVNMnJOdDFrVzdMWWVyU2dvaFlNV240NHU1V0w0OG1YSXU4UnV0?=
 =?utf-8?Q?WsTPHPP16E7HsNQqMw+8lUo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2762d4de-d033-4439-636a-08da9f868269
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 06:15:29.0600 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +gBm7as4oB2Cwoj/xJiFYSEeQXSi9RHuzwoP0RmPGR6x//G2F5kujhlhg1WSQBxJCFfq/4h8K2zqXKgS+oDYy9rOdOteOuMNlkSajHbVwQtPuTCe+EKa7EWsinppSnPF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6222
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19.09.2022 15:32, Matt Roper wrote:
> Gen8 was the first time our hardware had multicast registers (or at
> least the first time the multicast nature was exposed and MMIO accesses
> could be steered).  There are some registers that transitioned from
> singleton behavior to multicast during the gen7 -> gen8 transition;
> let's duplicate the register definitions for those registers in
> preparation for upcoming patches that will handle MCR registers in a
> special manner.
> 
> The registers adjusted are:
>  * MISCCPCTL
>  * SAMPLER_INSTDONE
>  * ROW_INSTDONE
>  * ROW_CHICKEN2
>  * HALF_SLICE_CHICKEN1
>  * HALF_SLICE_CHICKEN3
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  4 ++--
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h       | 11 +++++++++-
>  drivers/gpu/drm/i915/gt/intel_workarounds.c   | 22 +++++++++----------
>  .../gpu/drm/i915/gt/uc/intel_guc_capture.c    |  4 ++--
>  drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c     |  2 +-
>  drivers/gpu/drm/i915/gvt/handlers.c           |  2 +-
>  drivers/gpu/drm/i915/gvt/mmio_context.c       |  2 +-
>  drivers/gpu/drm/i915/intel_gvt_mmio_table.c   |  2 +-
>  drivers/gpu/drm/i915/intel_pm.c               | 10 ++++-----
>  9 files changed, 34 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index 2ddcad497fa3..c408bac3c533 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -1559,11 +1559,11 @@ void intel_engine_get_instdone(const struct intel_engine_cs *engine,
>  		for_each_ss_steering(iter, engine->gt, slice, subslice) {
>  			instdone->sampler[slice][subslice] =
>  				intel_gt_mcr_read(engine->gt,
> -						  GEN7_SAMPLER_INSTDONE,
> +						  GEN8_SAMPLER_INSTDONE,
>  						  slice, subslice);
>  			instdone->row[slice][subslice] =
>  				intel_gt_mcr_read(engine->gt,
> -						  GEN7_ROW_INSTDONE,
> +						  GEN8_ROW_INSTDONE,
>  						  slice, subslice);
>  		}
>  
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index 1cbb7226400b..e5a1ea255640 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -647,6 +647,9 @@
>  
>  #define GEN7_MISCCPCTL				_MMIO(0x9424)
>  #define   GEN7_DOP_CLOCK_GATE_ENABLE		(1 << 0)
> +
> +#define GEN8_MISCCPCTL				_MMIO(0x9424)
> +#define   GEN8_DOP_CLOCK_GATE_ENABLE		REG_BIT(0)
>  #define   GEN12_DOP_CLOCK_GATE_RENDER_ENABLE	REG_BIT(1)
>  #define   GEN8_DOP_CLOCK_GATE_CFCLK_ENABLE	(1 << 2)
>  #define   GEN8_DOP_CLOCK_GATE_GUC_ENABLE	(1 << 4)
> @@ -1068,18 +1071,22 @@
>  #define GEN12_GAM_DONE				_MMIO(0xcf68)
>  
>  #define GEN7_HALF_SLICE_CHICKEN1		_MMIO(0xe100) /* IVB GT1 + VLV */
> +#define GEN8_HALF_SLICE_CHICKEN1		_MMIO(0xe100)
>  #define   GEN7_MAX_PS_THREAD_DEP		(8 << 12)
>  #define   GEN7_SINGLE_SUBSCAN_DISPATCH_ENABLE	(1 << 10)
>  #define   GEN7_SBE_SS_CACHE_DISPATCH_PORT_SHARING_DISABLE	(1 << 4)
>  #define   GEN7_PSD_SINGLE_PORT_DISPATCH_ENABLE	(1 << 3)
>  
>  #define GEN7_SAMPLER_INSTDONE			_MMIO(0xe160)
> +#define GEN8_SAMPLER_INSTDONE			_MMIO(0xe160)
>  #define GEN7_ROW_INSTDONE			_MMIO(0xe164)
> +#define GEN8_ROW_INSTDONE			_MMIO(0xe164)
>  
>  #define HALF_SLICE_CHICKEN2			_MMIO(0xe180)
>  #define   GEN8_ST_PO_DISABLE			(1 << 13)
>  
> -#define HALF_SLICE_CHICKEN3			_MMIO(0xe184)
> +#define HSW_HALF_SLICE_CHICKEN3			_MMIO(0xe184)
> +#define GEN8_HALF_SLICE_CHICKEN3		_MMIO(0xe184)
>  #define   HSW_SAMPLE_C_PERFORMANCE		(1 << 9)
>  #define   GEN8_CENTROID_PIXEL_OPT_DIS		(1 << 8)
>  #define   GEN9_DISABLE_OCL_OOB_SUPPRESS_LOGIC	(1 << 5)
> @@ -1132,6 +1139,8 @@
>  #define   DISABLE_EARLY_EOT			REG_BIT(1)
>  
>  #define GEN7_ROW_CHICKEN2			_MMIO(0xe4f4)
> +
> +#define GEN8_ROW_CHICKEN2			_MMIO(0xe4f4)
>  #define   GEN12_DISABLE_READ_SUPPRESSION	REG_BIT(15)
>  #define   GEN12_DISABLE_EARLY_READ		REG_BIT(14)
>  #define   GEN12_ENABLE_LARGE_GRF_MODE		REG_BIT(12)
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index 6d2003d598e6..e382cb4c6971 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -295,10 +295,10 @@ static void bdw_ctx_workarounds_init(struct intel_engine_cs *engine,
>  	 * Also see the related UCGTCL1 write in bdw_init_clock_gating()
>  	 * to disable EUTC clock gating.
>  	 */
> -	wa_masked_en(wal, GEN7_ROW_CHICKEN2,
> +	wa_masked_en(wal, GEN8_ROW_CHICKEN2,
>  		     DOP_CLOCK_GATING_DISABLE);
>  
> -	wa_masked_en(wal, HALF_SLICE_CHICKEN3,
> +	wa_masked_en(wal, GEN8_HALF_SLICE_CHICKEN3,
>  		     GEN8_SAMPLER_POWER_BYPASS_DIS);
>  
>  	wa_masked_en(wal, HDC_CHICKEN0,
> @@ -386,7 +386,7 @@ static void gen9_ctx_workarounds_init(struct intel_engine_cs *engine,
>  	    IS_KABYLAKE(i915) ||
>  	    IS_COFFEELAKE(i915) ||
>  	    IS_COMETLAKE(i915))
> -		wa_masked_en(wal, HALF_SLICE_CHICKEN3,
> +		wa_masked_en(wal, GEN8_HALF_SLICE_CHICKEN3,
>  			     GEN8_SAMPLER_POWER_BYPASS_DIS);
>  
>  	/* WaDisableSTUnitPowerOptimization:skl,bxt,kbl,glk,cfl */
> @@ -490,7 +490,7 @@ static void kbl_ctx_workarounds_init(struct intel_engine_cs *engine,
>  			     GEN8_SBE_DISABLE_REPLAY_BUF_OPTIMIZATION);
>  
>  	/* WaDisableSbeCacheDispatchPortSharing:kbl */
> -	wa_masked_en(wal, GEN7_HALF_SLICE_CHICKEN1,
> +	wa_masked_en(wal, GEN8_HALF_SLICE_CHICKEN1,
>  		     GEN7_SBE_SS_CACHE_DISPATCH_PORT_SHARING_DISABLE);
>  }
>  
> @@ -514,7 +514,7 @@ static void cfl_ctx_workarounds_init(struct intel_engine_cs *engine,
>  		     GEN8_SBE_DISABLE_REPLAY_BUF_OPTIMIZATION);
>  
>  	/* WaDisableSbeCacheDispatchPortSharing:cfl */
> -	wa_masked_en(wal, GEN7_HALF_SLICE_CHICKEN1,
> +	wa_masked_en(wal, GEN8_HALF_SLICE_CHICKEN1,
>  		     GEN7_SBE_SS_CACHE_DISPATCH_PORT_SHARING_DISABLE);
>  }
>  
> @@ -2107,7 +2107,7 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>  
>  	if (IS_DG2_GRAPHICS_STEP(i915, G11, STEP_A0, STEP_B0)) {
>  		/* Wa_14013392000:dg2_g11 */
> -		wa_masked_en(wal, GEN7_ROW_CHICKEN2, GEN12_ENABLE_LARGE_GRF_MODE);
> +		wa_masked_en(wal, GEN8_ROW_CHICKEN2, GEN12_ENABLE_LARGE_GRF_MODE);
>  
>  		/* Wa_16011620976:dg2_g11 */
>  		wa_write_or(wal, LSC_CHICKEN_BIT_0_UDW, DIS_CHAIN_2XSIMD8);
> @@ -2156,7 +2156,7 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>  			    DISABLE_128B_EVICTION_COMMAND_UDW);
>  
>  		/* Wa_22012856258:dg2 */
> -		wa_masked_en(wal, GEN7_ROW_CHICKEN2,
> +		wa_masked_en(wal, GEN8_ROW_CHICKEN2,
>  			     GEN12_DISABLE_READ_SUPPRESSION);
>  
>  		/*
> @@ -2253,7 +2253,7 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>  	if (IS_ALDERLAKE_P(i915) || IS_ALDERLAKE_S(i915) || IS_DG1(i915) ||
>  	    IS_ROCKETLAKE(i915) || IS_TIGERLAKE(i915)) {
>  		/* Wa_1606931601:tgl,rkl,dg1,adl-s,adl-p */
> -		wa_masked_en(wal, GEN7_ROW_CHICKEN2, GEN12_DISABLE_EARLY_READ);
> +		wa_masked_en(wal, GEN8_ROW_CHICKEN2, GEN12_DISABLE_EARLY_READ);
>  
>  		/*
>  		 * Wa_1407928979:tgl A*
> @@ -2282,7 +2282,7 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>  	    IS_DG1_GRAPHICS_STEP(i915, STEP_A0, STEP_B0) ||
>  	    IS_ROCKETLAKE(i915) || IS_TIGERLAKE(i915)) {
>  		/* Wa_1409804808:tgl,rkl,dg1[a0],adl-s,adl-p */
> -		wa_masked_en(wal, GEN7_ROW_CHICKEN2,
> +		wa_masked_en(wal, GEN8_ROW_CHICKEN2,
>  			     GEN12_PUSH_CONST_DEREF_HOLD_DIS);
>  
>  		/*
> @@ -2449,7 +2449,7 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>  	if (IS_HASWELL(i915)) {
>  		/* WaSampleCChickenBitEnable:hsw */
>  		wa_masked_en(wal,
> -			     HALF_SLICE_CHICKEN3, HSW_SAMPLE_C_PERFORMANCE);
> +			     HSW_HALF_SLICE_CHICKEN3, HSW_SAMPLE_C_PERFORMANCE);
>  
>  		wa_masked_dis(wal,
>  			      CACHE_MODE_0_GEN7,
> @@ -2747,7 +2747,7 @@ general_render_compute_wa_init(struct intel_engine_cs *engine, struct i915_wa_li
>  		wa_write_or(wal, XEHP_L3NODEARBCFG, XEHP_LNESPARE);
>  
>  		/* Wa_14010449647:xehpsdv */
> -		wa_masked_en(wal, GEN7_HALF_SLICE_CHICKEN1,
> +		wa_masked_en(wal, GEN8_HALF_SLICE_CHICKEN1,
>  			     GEN7_PSD_SINGLE_PORT_DISPATCH_ENABLE);
>  
>  		/* Wa_18011725039:xehpsdv */
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
> index 8f1165146013..9495a7928bc8 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
> @@ -244,8 +244,8 @@ struct __ext_steer_reg {
>  };
>  
>  static const struct __ext_steer_reg xe_extregs[] = {
> -	{"GEN7_SAMPLER_INSTDONE", GEN7_SAMPLER_INSTDONE},
> -	{"GEN7_ROW_INSTDONE", GEN7_ROW_INSTDONE}
> +	{"GEN8_SAMPLER_INSTDONE", GEN8_SAMPLER_INSTDONE},
> +	{"GEN8_ROW_INSTDONE", GEN8_ROW_INSTDONE}
>  };
>  
>  static void __fill_ext_reg(struct __guc_mmio_reg_descr *ext,
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
> index a0372735cddb..9229243992c2 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
> @@ -35,7 +35,7 @@ static void guc_prepare_xfer(struct intel_uncore *uncore)
>  
>  	if (GRAPHICS_VER(uncore->i915) == 9) {
>  		/* DOP Clock Gating Enable for GuC clocks */
> -		intel_uncore_rmw(uncore, GEN7_MISCCPCTL,
> +		intel_uncore_rmw(uncore, GEN8_MISCCPCTL,
>  				 0, GEN8_DOP_CLOCK_GATE_GUC_ENABLE);
>  
>  		/* allows for 5us (in 10ns units) before GT can go to RC6 */
> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
> index daac2050d77d..700cc9688f47 100644
> --- a/drivers/gpu/drm/i915/gvt/handlers.c
> +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> @@ -2257,7 +2257,7 @@ static int init_generic_mmio_info(struct intel_gvt *gvt)
>  	MMIO_DFH(_MMIO(0x2438), D_ALL, F_CMD_ACCESS, NULL, NULL);
>  	MMIO_DFH(_MMIO(0x243c), D_ALL, F_CMD_ACCESS, NULL, NULL);
>  	MMIO_DFH(_MMIO(0x7018), D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
> -	MMIO_DFH(HALF_SLICE_CHICKEN3, D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
> +	MMIO_DFH(HSW_HALF_SLICE_CHICKEN3, D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
>  	MMIO_DFH(GEN7_HALF_SLICE_CHICKEN1, D_ALL, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
>  
>  	/* display */
> diff --git a/drivers/gpu/drm/i915/gvt/mmio_context.c b/drivers/gpu/drm/i915/gvt/mmio_context.c
> index 1c6e941c9666..ac58460fb305 100644
> --- a/drivers/gpu/drm/i915/gvt/mmio_context.c
> +++ b/drivers/gpu/drm/i915/gvt/mmio_context.c
> @@ -111,7 +111,7 @@ static struct engine_mmio gen9_engine_mmio_list[] __cacheline_aligned = {
>  	{RCS0, GEN9_SCRATCH_LNCF1, 0, false}, /* 0xb008 */
>  	{RCS0, GEN7_HALF_SLICE_CHICKEN1, 0xffff, true}, /* 0xe100 */
>  	{RCS0, HALF_SLICE_CHICKEN2, 0xffff, true}, /* 0xe180 */
> -	{RCS0, HALF_SLICE_CHICKEN3, 0xffff, true}, /* 0xe184 */
> +	{RCS0, HSW_HALF_SLICE_CHICKEN3, 0xffff, true}, /* 0xe184 */
Since it is for Gen9 and above, can we use GEN8_HALF_SLICE_CHICKEN3
register name here?

Rest looks good.

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Regards,
Bala

>  	{RCS0, GEN9_HALF_SLICE_CHICKEN5, 0xffff, true}, /* 0xe188 */
>  	{RCS0, GEN9_HALF_SLICE_CHICKEN7, 0xffff, true}, /* 0xe194 */
>  	{RCS0, GEN8_ROW_CHICKEN, 0xffff, true}, /* 0xe4f0 */
> diff --git a/drivers/gpu/drm/i915/intel_gvt_mmio_table.c b/drivers/gpu/drm/i915/intel_gvt_mmio_table.c
> index 8279dc580a3e..638b77d64bf4 100644
> --- a/drivers/gpu/drm/i915/intel_gvt_mmio_table.c
> +++ b/drivers/gpu/drm/i915/intel_gvt_mmio_table.c
> @@ -102,7 +102,7 @@ static int iterate_generic_mmio(struct intel_gvt_mmio_table_iter *iter)
>  	MMIO_D(_MMIO(0x2438));
>  	MMIO_D(_MMIO(0x243c));
>  	MMIO_D(_MMIO(0x7018));
> -	MMIO_D(HALF_SLICE_CHICKEN3);
> +	MMIO_D(HSW_HALF_SLICE_CHICKEN3);
>  	MMIO_D(GEN7_HALF_SLICE_CHICKEN1);
>  	/* display */
>  	MMIO_F(_MMIO(0x60220), 0x20);
> diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
> index 8f86f56e7ca4..1aa77b18fd3c 100644
> --- a/drivers/gpu/drm/i915/intel_pm.c
> +++ b/drivers/gpu/drm/i915/intel_pm.c
> @@ -4325,8 +4325,8 @@ static void gen8_set_l3sqc_credits(struct drm_i915_private *dev_priv,
>  	u32 val;
>  
>  	/* WaTempDisableDOPClkGating:bdw */
> -	misccpctl = intel_uncore_read(&dev_priv->uncore, GEN7_MISCCPCTL);
> -	intel_uncore_write(&dev_priv->uncore, GEN7_MISCCPCTL, misccpctl & ~GEN7_DOP_CLOCK_GATE_ENABLE);
> +	misccpctl = intel_uncore_read(&dev_priv->uncore, GEN8_MISCCPCTL);
> +	intel_uncore_write(&dev_priv->uncore, GEN8_MISCCPCTL, misccpctl & ~GEN8_DOP_CLOCK_GATE_ENABLE);
>  
>  	val = intel_uncore_read(&dev_priv->uncore, GEN8_L3SQCREG1);
>  	val &= ~L3_PRIO_CREDITS_MASK;
> @@ -4340,7 +4340,7 @@ static void gen8_set_l3sqc_credits(struct drm_i915_private *dev_priv,
>  	 */
>  	intel_uncore_posting_read(&dev_priv->uncore, GEN8_L3SQCREG1);
>  	udelay(1);
> -	intel_uncore_write(&dev_priv->uncore, GEN7_MISCCPCTL, misccpctl);
> +	intel_uncore_write(&dev_priv->uncore, GEN8_MISCCPCTL, misccpctl);
>  }
>  
>  static void icl_init_clock_gating(struct drm_i915_private *dev_priv)
> @@ -4500,8 +4500,8 @@ static void skl_init_clock_gating(struct drm_i915_private *dev_priv)
>  	gen9_init_clock_gating(dev_priv);
>  
>  	/* WaDisableDopClockGating:skl */
> -	intel_uncore_write(&dev_priv->uncore, GEN7_MISCCPCTL, intel_uncore_read(&dev_priv->uncore, GEN7_MISCCPCTL) &
> -		   ~GEN7_DOP_CLOCK_GATE_ENABLE);
> +	intel_uncore_write(&dev_priv->uncore, GEN8_MISCCPCTL, intel_uncore_read(&dev_priv->uncore, GEN8_MISCCPCTL) &
> +		   ~GEN8_DOP_CLOCK_GATE_ENABLE);
>  
>  	/* WAC6entrylatency:skl */
>  	intel_uncore_write(&dev_priv->uncore, FBC_LLC_READ_CTRL, intel_uncore_read(&dev_priv->uncore, FBC_LLC_READ_CTRL) |
> -- 
> 2.37.3
> 
