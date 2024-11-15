Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C999CF9CC
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 23:30:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 094C410E14C;
	Fri, 15 Nov 2024 22:30:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mZG1+Z5J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B825F10E14C;
 Fri, 15 Nov 2024 22:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731709813; x=1763245813;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EG5ZULQLpMetSwN5W29vIjeLmmhrGsf4eJHZXeBX+yY=;
 b=mZG1+Z5JYHE+7WIdCU15uHjB4GPr1NFgmrVD6Il2iZeinRZoDmq6rG14
 30cmcgYnhO/NwmcR9bDDYFgJcUqUmHdmrDP/iwGMtQAlC9FvsfOjhzTNH
 2TX6u/aMqxSedC1l431ZLw7OR4kADDKRfP74G+2ThKmckkfRj3OCFnvMm
 7kTnM5ucls4IW8SZ1b4uMHmu+Vd+Nf/MOskHki91xwjXNIMnnpgrfb6E+
 xBwp9uMPcsDvzs0YrTdTsFF/m1cEBdYprPd6rl5dOUjJdeTQcaYc5fXHg
 uMOI9qbi5KN5nuBeIpENkQzLQ1I51tPGKwq9rVjAJWXd2moVBTgJoRByE g==;
X-CSE-ConnectionGUID: kTWDsOTDQtm7biSX8IaDJw==
X-CSE-MsgGUID: OAozO/V0QV67/cb6NJOScw==
X-IronPort-AV: E=McAfee;i="6700,10204,11257"; a="42368309"
X-IronPort-AV: E=Sophos;i="6.12,158,1728975600"; d="scan'208";a="42368309"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 14:30:12 -0800
X-CSE-ConnectionGUID: X1Afa8asQXeVcHsUJv08jA==
X-CSE-MsgGUID: BTohp7NqR9ulpDDuBxQLsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,158,1728975600"; d="scan'208";a="93136014"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2024 14:30:12 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 15 Nov 2024 14:30:12 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 15 Nov 2024 14:30:12 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 15 Nov 2024 14:30:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dDSHyhEfuST9FLv5dgE85JLJEJkeFjfUfu+xf87AYtOs5WtWBZH2u4rp01bn9Bc9HGRZA2/TDTFRtAqjPotKlmihUi8OybqiV0tpO5s1TJ1WkPgVXrvqoFMdlz+p6JykFXihadPr7YSfCHAqf8B6hkeeAKrjIN/Q+iAVBtX5Dxr2LpxQTzygsMJNRjkYqpS33yotgFok3ggKPScd17WJMrPrVA0n19DbdpIQFCCGBxtwVySWlXJYcJivgwvP6JcFyPCF3c1OG0BG/2trO6Ei+PpjrXPQ0gh4Ci334pr8EZwPUcuOYeXV8QkFZahbSxD9jCISBpCUrP/kDX7TP1YS4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tOZk7Ixxt39267OaiUMEjrjSq1fIN1SOelweYhVwkas=;
 b=jracWoMfqaovjiBApHuvvqG3hmuqpEihMewWUuhr/SIjuj5fgbgCvsr7ZMmwXE4h1CpLVmDhHFADgZSjrVsZIfdlGVWl/ykMZRcA/wXoQm+0v7xzIP4G4Ye48EYa+r7xaUkd0N8wBtQvQ/Ps1Dqm5gskA/Rx2wiiOkEUPzk9lkwxT+PSy07aw3LVzmKh/6pzRJJAP9sQwacIpK1ZMlrn060FyVBge9dfPdRBNnUrJIYLhG0IpCf9f6af9rZaPNsKBb0uktNWJOJUtVfLdcpu0p0emPai5EY641VX0W5zl5Lg1WHai+nDhi91R+hvh5oRNejPcOmiiIFrL3tkrTbgsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by MW4PR11MB6738.namprd11.prod.outlook.com (2603:10b6:303:20c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Fri, 15 Nov
 2024 22:30:06 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8114.020; Fri, 15 Nov 2024
 22:30:05 +0000
Date: Fri, 15 Nov 2024 17:30:01 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Imre Deak <imre.deak@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 "Jani Nikula" <jani.nikula@intel.com>
Subject: Re: [PATCH 1/4] drm/i915/dp_mst: Fix connector initialization in
 intel_dp_add_mst_connector()
Message-ID: <ZzfLaWrL3x1FjpMV@intel.com>
References: <20241115164159.1081675-1-imre.deak@intel.com>
 <ZzetKr-rApPqmehO@intel.com>
 <ZzevVE-MM4iFz1T_@ideak-desk.fi.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZzevVE-MM4iFz1T_@ideak-desk.fi.intel.com>
X-ClientProxiedBy: MW3PR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:303:2b::10) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|MW4PR11MB6738:EE_
X-MS-Office365-Filtering-Correlation-Id: 40b0e9c1-68eb-48fe-5862-08dd05c50db1
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qRbim4Po+llEDy2NLC8Sm8w1VI4hjDoKOOkGD50jBEewymRCJlN6373TGH6T?=
 =?us-ascii?Q?EwwOq8yMFggXzPeRaxPPRTNIjVOXaxDElireeHWS7XNzPhKa/pfzK/slJfaE?=
 =?us-ascii?Q?VtLiq6ltS7AQi7Dr3Ry1w3R1/rep7ptj7rYMMsSLOP87eSG2Jb1FE5PnTExn?=
 =?us-ascii?Q?nHnVGDcMdLtogYlymdQRVd+bqNKNf7b5WMqHO0AlcLfR9JJUOhP6SoYAdRZR?=
 =?us-ascii?Q?I99fpnlZ8+psFxV6bNXpDv+qng0uiG8Zjftw03/f0qQbjB0QVt4nEUgBMBpE?=
 =?us-ascii?Q?nkCNqDKY7WlRRQWD1PwLvfgmu0NRpHqnMiOJ/zClsH/MrBTQvkgRZaQse5H4?=
 =?us-ascii?Q?mRM35a5Iv6oDObSZvqFoF+IvYgmJE3VERwLWyGsScZNox/9aHxgrHRXIKjcF?=
 =?us-ascii?Q?cs4Euga0UMZZ6tp1+hom4Keki39Zm+h18PW+Ihgh5IvKM8RUdjgVQcWhoh0g?=
 =?us-ascii?Q?j3HnZaYS5pf1fGQbqGt9bbQZMx75Xn/Vs+FRh184MLs5rdM14bGymzjchapm?=
 =?us-ascii?Q?jEpr2qz1nkOF7XhWsykje7VL2+BaOUPahbGI+Cfe07+IL5unz4oyEJT6DyAW?=
 =?us-ascii?Q?8u/XaiLQv8htAJnb28gmtWKQCnCqdJn3RT8vpW/3QQQ4r22pQASCBSgFJkWs?=
 =?us-ascii?Q?acGUp/Cso4u859xXRdga6+PQOAdiMb/fkcKFDPy5N0BjxtJIMR4eFGo+VDsr?=
 =?us-ascii?Q?KfX6eOMIQsNbrov6mH060J2mZEaQwCiWtjoF6Sv1nJ9AJP7pSF3L+xuDoKZi?=
 =?us-ascii?Q?9ydOt0zdmneWaHCgJYzi6NbkdHkLjOVZfeg3DNgw//DxgM2GetJUOG8pnYXP?=
 =?us-ascii?Q?btqExQedHP9S0kkNlx+C62C2FlmzSx1Kc5vxEFOdvDuYPdJ8Et2kA+Gx+O3d?=
 =?us-ascii?Q?WqtN6jk1Dr+JQ0tz9XMV0qw/v3LD0weL/m/RO/QVbw3XP8ClhZ2iZR+5NKzI?=
 =?us-ascii?Q?QUXV6gjy1BGE3cIPjXuE/5AlpVk86ZAsCLpe1dql2YGZNkVsSVi6RjQDzh5g?=
 =?us-ascii?Q?hnKYw1cuXC9VpzXr3j548hIhNcLd4MG7cOICusvXMoGVkGJGFQy1jL6xGTg1?=
 =?us-ascii?Q?6ASwsVDt3ei8zKe/6TGRLujR6zyvR4ZO1D7YqeAIcmCg58rODS3b71IRwu1S?=
 =?us-ascii?Q?zTZvFOWHS9rC8w688qasgbekQ6w/DEu3EWZdwmcNg/Nl+uA+s5HKXDp7hyEG?=
 =?us-ascii?Q?/30ieOs1g/nt3K1JPzfr7NKLwcCBiD2k5wS8B2jHGJI3V2+7hhnTKSBFq9C5?=
 =?us-ascii?Q?v1HZXvZWRqwFZMdOlMZ5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TIwtDItTEP0/KPfpDa6ml4DGXHxZFa3tHcVGWLU5TiOTSrjWYHJUpbgkJAGC?=
 =?us-ascii?Q?ApP7CWYRzs1X3uGouS3VsS4f+njEaQSbZU7pKxC9+u/x9TNS+uzc3sRuBN0o?=
 =?us-ascii?Q?PFDjNLziec7EQsD0GO0cve8PxPcpgZI2seWhy/Arw3SWmxFyDzLVopibbULd?=
 =?us-ascii?Q?Y9tv1dcrEyVTofFXRPUxcplpBQZHJehzUjwq9o4dD8jFjSx7nPpphB243fG8?=
 =?us-ascii?Q?gou5+bfDOxncQl6NfgvMtLSqrFl/0i4qcXd1+zJZ8G1DJ3hbRmrLYa4d7E2H?=
 =?us-ascii?Q?Fl9OnF4bZHRjIEATJEcNBxNj8x5f0hrMKipFvp79wH6vQEMN4ohNv6dNVkmz?=
 =?us-ascii?Q?6hNiK8BIrjJg0YVERXOGRAq/pYr+bGqu0Xxk2+vTi/hBk4bBgxx1MWCumLOn?=
 =?us-ascii?Q?JnLukUEsAtx5PZqetIkkr6yvEhLwaCuRSnIGtif02PA4jZLbmKFCDaQumI1F?=
 =?us-ascii?Q?OJWHjXZpYw7tSdBawfCMINI1EUMP187WL4l7uiS6+L6h1pyFV/OQpgUwp6LV?=
 =?us-ascii?Q?NRfl1I9A1Ob3yo+xzc1n4Z0snaNcfekKeM0MjPqjY8WkZS9k+IAb7Gw9Xt+1?=
 =?us-ascii?Q?NWlud6tEDCi5WWtFgyiWaQm2LDjCR9etclHj2XzNwdpgTAI1f10gGmHL2/Eq?=
 =?us-ascii?Q?UO3EowChp6WWDLdwSHF9RUMLHLsQLQDV/5va+z1T/zwoXn8Jvrr/bUcAoRe4?=
 =?us-ascii?Q?/7hJnJHcCMQ2HQkckV7GtTIILj7SlB78t11FgtPRjrBFLNv7W/gseiUOYj/o?=
 =?us-ascii?Q?yTlDHR39f6TSPkG6lhG7KU9B5HuzIyy3WxkkW09zayR0sh6g+RNrMCyjAL2R?=
 =?us-ascii?Q?+jHfQ2rpra66bzsKB799MiFj1g9icgaNXGZxESwZAdru9iUmSPBF3YBiyrOd?=
 =?us-ascii?Q?4nL8jEpjUj/gH100pkpZRyqYOG/SWAZjMCrVnU4tA8x57vSURVuW5RhwCTh2?=
 =?us-ascii?Q?JO5R9Cz5MNZzZ13Mu4YZBhxBIHbKnZAV6jOuwOMuBhxD4TGA4si5dXas1vM9?=
 =?us-ascii?Q?KmLQGlOUMwlYc0aP1oD4dOFE13fjoGSZr4EXHfe751m/IVR5X1Om7PcE+0zD?=
 =?us-ascii?Q?kH87KUxdbfWShL+JOKHfhCGnp2B1snISDUZDgvrXOH7YygbNqKA2jyQ7sCgH?=
 =?us-ascii?Q?qTsZvYsay0maS9q2x/7OGnFvEj7bIaIxe30fTwz69lz9Pd0kIZwUvrZeET25?=
 =?us-ascii?Q?cWWZOyK+va9tHKj/ENhwUxnphq8Rdznjh2FMSKl+waKc6h+wreWwxtpuwajs?=
 =?us-ascii?Q?A7rQhw7iMgrlTrCKAGKpmvr5NRcO0CW6LYSLmxyjpi0PNfR6+7F/PuIfhfgK?=
 =?us-ascii?Q?eQaY90DfMNHFXXdPLG9NX6vFuKq6mD9aZvZTIQ1bZRcWm6WInt3h9xa0w4Nj?=
 =?us-ascii?Q?y+IyC3p4GwFwEhjbYr1vuqsgTqKnheTEM1+eDECWgCuOYCL2aq0IwGQsbMKn?=
 =?us-ascii?Q?41IgHz4dmEdewz/jRV0s7bY7CEqhtoZSr/qyvVoxjG0Ay3T7ATYRncPhhD5H?=
 =?us-ascii?Q?HnrSdi5yXlEiteYXDeryJcRKb3pqYAtBXVFQPDXIT572rmT/toLXK8tec2Rv?=
 =?us-ascii?Q?miX1q/UUIz7jwTc6kLI3RMjG6ChhQhDB+PCRC4YydOQAJmV9OggiljT134mh?=
 =?us-ascii?Q?0A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 40b0e9c1-68eb-48fe-5862-08dd05c50db1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 22:30:05.6429 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QLxql3mtFzopRRX9zW4oXPL2f9X86Cz/t/JO0Vj1aa8nELEja34kdV6hfpzNevDHO/H2vaWnpBjZGsYghnu+nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6738
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

On Fri, Nov 15, 2024 at 10:30:12PM +0200, Imre Deak wrote:
> On Fri, Nov 15, 2024 at 03:20:58PM -0500, Rodrigo Vivi wrote:
> > On Fri, Nov 15, 2024 at 06:41:56PM +0200, Imre Deak wrote:
> > > The connector initialization in intel_dp_add_mst_connector() depends on
> > > the device pointer in connector to be valid, at least by connector
> > > debug printing. The device pointer is initialized by drm_connector_init(),
> > > however that function also exposes the connector to in-kernel users,
> > > which can't be done before the connector is fully initialized. For now
> > > make sure the device pointer is valid before it's used, until a
> > > follow-up change moving this to DRM core.
> > > 
> > > This issue was revealed by the commit in the Fixes: line below, before
> > > which the above debug printing checked and handled a NULL device pointer
> > > gracefully in DRM core.
> > > 
> > > Cc: Jani Nikula <jani.nikula@intel.com>
> > > Fixes: 529798bd786a ("drm/i915/mst: convert to struct intel_display")
> > 
> > This is awkward. This patch actually removes callers of base.dev.
> > I don't see how that it could be causing this new null dereference.
> 
> It adds
> 
> struct intel_display *display = to_intel_display(connector);
> 
> which will be NULL since connector->base.dev is NULL and later display
> is dereferenced.

oh I see! Thanks

> 
> > > Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12799
> > 
> > But well, trusting more the tests then my eyes, let's move forward.
> > 
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > 
> > > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/display/intel_dp_mst.c | 10 ++++++++++
> > >  1 file changed, 10 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > > index df7edcfe885b6..f058360a26413 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > > @@ -1727,6 +1727,16 @@ static struct drm_connector *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
> > >  
> > >  	intel_dp_init_modeset_retry_work(intel_connector);
> > >  
> > > +	/*
> > > +	 * TODO: The following drm_connector specific initialization belongs
> > > +	 * to DRM core, however it happens atm too late in
> > > +	 * drm_connector_init(). That function will also expose the connector
> > > +	 * to in-kernel users, so it can't be called until the connector is
> > > +	 * sufficiently initialized; init the device pointer used by the
> > > +	 * following DSC setup, until a fix moving this to DRM core.
> > > +	 */
> > > +	intel_connector->base.dev = mgr->dev;
> > > +
> > >  	intel_connector->dp.dsc_decompression_aux = drm_dp_mst_dsc_aux_for_port(port);
> > >  	intel_dp_mst_read_decompression_port_dsc_caps(intel_dp, intel_connector);
> > >  	intel_connector->dp.dsc_hblank_expansion_quirk =
> > > -- 
> > > 2.44.2
> > > 
