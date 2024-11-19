Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B109D2AD9
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 17:26:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3B5C10E673;
	Tue, 19 Nov 2024 16:26:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iOGBy6eq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 077AE10E1C4;
 Tue, 19 Nov 2024 16:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732033572; x=1763569572;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=uX+BCK6NlBD/IEZZ3wKCEPtl8RkJ1vWl1vX5M6EE5Bw=;
 b=iOGBy6eqPnPYq/I5ls1VlfvfH61XSlivJH7pPYTmYN976Ocn/3REy7ff
 b/fF6vAVj0S2s4yrXF9RL+jtAmL8Xjioti7KU6WfFhY16rtcbiNOEGbsQ
 pcTbwRRANkcpN8Bdr/P4UsNfO9w3Xt6PVvphzBOVf4iX0VlKsX/O0Y8nn
 yp0m1fOb4JFUtS6O0/xl9lLH+cDcTLkVDgElrkQRZtte6AHN9q7Ijxg38
 9ox1cVLtBdu0yG2p3Vi902lL8agFCeircp+1F8hl4Se7oImgM/WAxKuoi
 T5IuQMGIULK77vyJukEK0Y7cT8YHc9hUGdjtZwD6pL1h1tXALTQIazJZf w==;
X-CSE-ConnectionGUID: UdmfGqx8STeDD/iOt1dx2Q==
X-CSE-MsgGUID: NKw+0NadTouv7a/BUNS/8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="32103870"
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="32103870"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 08:26:12 -0800
X-CSE-ConnectionGUID: bgXV/qekQaa1BmSra4PTrQ==
X-CSE-MsgGUID: j9bjevb1TLK1qtwQ+wbOnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="94536163"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Nov 2024 08:26:12 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 19 Nov 2024 08:26:11 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 19 Nov 2024 08:26:11 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 19 Nov 2024 08:26:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lW7NGzcp5wEDnc4npyVnp9tWQen6HimbIHP5azQ25AO4qO8Fo6IS7nHSVf8orQdt96sV8Ifv7YmvQ5EAGXQWOsnVL3H+PBQSurDSC/71rcV+rD+CrymnPAlEh98ln3ruuwYWB1y5lCeFarpdual7fd6VY9mezWXhMzuEpEm3W65E6wVBEqk8Pw9hFr6Jk4iQcRiufCjeUVIlU9RxNnN3aHopwTraT+dHNky/iIrcilDYEw2VXMjlLNCDRR6wGsPd0+No808vEp+HCrKSwpXWWhfZlbKlHK4xhNzYnRY5VY+ZERa1E3viOxjn75k4XULRoKWahNJWKBvdIcZBgdZ5kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bKlBOHGyGzHMAXPTPDgDAh/ArXAptpzcMHER181DB9A=;
 b=cAMaq2Tl7rDeigMymGLW1EfXQxOU1iuceOF4NpHEujGABn/jY+MacQUAh/yMOovo4/7BgCj9OClUi/wftmOLiPOlLuE44K/xfVAO3VOkAIz97+dGa1zH8t/2WmYqks4FmA9Pw3pGQneUZ2I07EqM6uJ0IcBCzVEHxED5sJbcvfzzEr8rspECrN1eagnXl4sqIQqsOs+CIieanVFURF20hgdmXxJ+4/K9yUiNaBAPuukQFbH/BBMIu70uTTXj4bQ+TviFxwOlcBC93BvM9ynAx1zJrk+F6EurB446Y5HR+x7D6RyGfYW68t8EjG/b2LW5orZPewzArcUAsIEtLFyyOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7557.namprd11.prod.outlook.com (2603:10b6:8:14d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.19; Tue, 19 Nov
 2024 16:26:07 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8158.023; Tue, 19 Nov 2024
 16:26:07 +0000
Date: Tue, 19 Nov 2024 08:26:42 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Danilo Krummrich <dakr@redhat.com>, <apopple@nvidia.com>,
 <airlied@gmail.com>, <christian.koenig@amd.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v2 10/29] drm/gpuvm: Add DRM_GPUVA_OP_USER
Message-ID: <Zzy8QtL9czBFf1BY@lstrano-desk.jf.intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-11-matthew.brost@intel.com>
 <e1a00a4f6ea93f63da3e255d442257c4708105ca.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e1a00a4f6ea93f63da3e255d442257c4708105ca.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0087.namprd04.prod.outlook.com
 (2603:10b6:303:6b::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7557:EE_
X-MS-Office365-Filtering-Correlation-Id: efbf8a0b-999f-4b12-17e6-08dd08b6def9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Y7JqdDtB2gmqCKNLTAb6C+6lfEx8z1aAgLxj7HAmotP5oN50QV71YAqD7R?=
 =?iso-8859-1?Q?x3FtWF4QVPvqndnb6dTQHkTiCF8r8uEOal26kTmpyIdeGinQ96+8KZk+1Q?=
 =?iso-8859-1?Q?8S+eawv//WL9UYPVzl2Z4OEqfmNTMJmhPE6bi6jQDIpf5nF9wtYdbsIPfz?=
 =?iso-8859-1?Q?SRbYrKGKPcMpgFgqLsfQXXBhBT5NedCh5UO9uNxvzk1ErN34GePHV0LALe?=
 =?iso-8859-1?Q?TBWKkswp0aX62p0lmT7FHAcvqtBzpBeANJBO+yyrd+cZxBCpKf4NByGopZ?=
 =?iso-8859-1?Q?BQBrS9PWdatDQPWoYR9XF0QmKAhEP4eWovJZJOkVzxyakvCg0oWtsh7Ds4?=
 =?iso-8859-1?Q?RCES5P/Je179rkor2MWwK2b9ddJiV1Xidz/3xT25euk8BET9nkTR06PkJp?=
 =?iso-8859-1?Q?EjtZA1dghj0GcUygg4EsPPVFz0gwttkOwB5lR9/y/1QWv83QUOh7bPkJQI?=
 =?iso-8859-1?Q?Pqc3yS1FscrrqkAeRYd3WEvY159BiMs0FXWR3HxgzlAeGKpZwf8vBP6kOs?=
 =?iso-8859-1?Q?9UBOR+65SZ/L3VUurqB+kjD+PZwdAx35hs0MuQiDFrhdDwTQcADDrxZlhB?=
 =?iso-8859-1?Q?K6ufJdzbjSjGQDMaS4py6fpR2c9b/kSAN9HdtlKr6PC6+mvM07grVdAcuh?=
 =?iso-8859-1?Q?DCafzAzw9KoDoZHCbrr40hXeWQwV5DthXJty9MHIuXkcz1mKBc/txUxivU?=
 =?iso-8859-1?Q?pmv26VYvGXeRs/uRrDCUfVKAdsTWEzkaVfrJyjn10zBY/Iy5KN3MoBcWm5?=
 =?iso-8859-1?Q?L4tFEr0OjRAIlKKbQPYPFs21p9+qwXgjaJUdmK0frCAOBaUmKaH1mP9jWN?=
 =?iso-8859-1?Q?56NuTIPmhrX2Bi+NW9XAaKcCwvR+NfrUhN5ut12eMKzRmlT1sTYe9rnteq?=
 =?iso-8859-1?Q?JMKNhDsVKBrHyvg0i49wruWp3vjTATl/AUwWmWv1dilYHEvxRT/RKy3+LJ?=
 =?iso-8859-1?Q?RLBYBWiYfsgnkCYzNXilPwbD8U0v83nK62A8LdiwKuOc7abn0lVRWy6eNH?=
 =?iso-8859-1?Q?k8xL1Qe0KiNZpULSZkn0vfxw03/BFdBJWbQ2EyK+WXQ3EOSM/8S5vucZyz?=
 =?iso-8859-1?Q?NR/VPKF23niVUHGpIyJyCYIso8yzF0SrL3LoZag6lIxsIEhC9Q9QOdYYlr?=
 =?iso-8859-1?Q?+oqszDKwMVLOuJugwuFlulrUXSgGu2BZamaIA0DUNkh6k08PziedBbV6uQ?=
 =?iso-8859-1?Q?K2AoQcC4h8+SPzru2C5GVDsKJEl3/YgMCYjef7hK1C+3NGSxCv1Qf0SFmf?=
 =?iso-8859-1?Q?Y00Q6CDxBwZSa1/tRuBjorHFplSdZUG5C0Fo3/1ZuyzEyRA5P2i9FB1pKA?=
 =?iso-8859-1?Q?RpkNQjbFXkJu7cpXqRqCzWWeIi5CuY8KsQfVTqWae9lMykjlBH+OurNAMs?=
 =?iso-8859-1?Q?7isR0tvdMC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?08qo/ffEUSHHysVX8kEsvHKL2ok3Sjf3Nrh4iBmWmwNi+mFt/VnsrjBpyH?=
 =?iso-8859-1?Q?Ax0kgpKiniIdkzd86hE8Uwd6UpbHuz2+mkj9DRay9BpYwtPE6Oao9nJKjo?=
 =?iso-8859-1?Q?/pl0nK8qMPe8lhDZEjTYmAdsVk042suf/67pzV11yyOX2OGaHBtudKzXas?=
 =?iso-8859-1?Q?uuuHt7serKnrDpD6byLmliBjB9Nx6XzGxMFHBZu1anIl/SFDUjjUk8vozK?=
 =?iso-8859-1?Q?SnCioIYdJd82heuOPuGBmHPRZ0TDbQxdvyhu53uMfAnsKD11qOgbDS6ogE?=
 =?iso-8859-1?Q?Kx+CJRQWmM1IQ7ga/uKXf5MoqFBVi6TcuVrSsRGHb7iQnhTh3vqLhFSApt?=
 =?iso-8859-1?Q?Z64ybRk3AT+2TbzqH0HSSxiWmxEOwozfR+HJN/3tUxRlqRCctYBZmPOtDw?=
 =?iso-8859-1?Q?w64C3jrx0Fm5ujgmkY7e/yaijWnRb9IpoxZFIUVIzD9J6FF0OUvsdAf9hp?=
 =?iso-8859-1?Q?Ujr1oxQcehJwt4TT4vHzMADSous1u5H1L84AeOCh1f4AhrBT06CVzBiYlz?=
 =?iso-8859-1?Q?XbzFkLtI7NRdUjUXkJ5RA1hjAKwNGSnhzOnRXEPRN0iop0KTcUUvMpkenj?=
 =?iso-8859-1?Q?qivcwb3ce42V04pkO1SEQi8jb1wKUV8yJf2su2/LjEnWp1g1y9iYxELTP0?=
 =?iso-8859-1?Q?58AMWdTFaaTwB24JWXn2mPH3WUXLmLrTe/xeO9Yk7ooFwcxkpiBVnKF6F5?=
 =?iso-8859-1?Q?K+Qedlborb17lWf09Tiyo8TENkSmawAqrVVqMySEIO5fE2EWBdTbJBObe+?=
 =?iso-8859-1?Q?Q2CuAgeyA+FX2HQwXP0WAZTI/DMgDu/D6dxBdA1Bf/0cSWqis7YiUHhZOm?=
 =?iso-8859-1?Q?KQqUZF0xxOVmPXhIS561VzAvTvR9ut47NrlPFpnnwhVy6iIcmCe7q+a56+?=
 =?iso-8859-1?Q?/925qS6vYcxlBJ9wxwKxE39FUCBFcvJEandOsipXUNk9lTkCmwIqsn+T8Y?=
 =?iso-8859-1?Q?cYgu7vrg3loGeZlq942FzogChHjEfA2r7Z8HgKYpZF9srOZOB/qVwdm0UI?=
 =?iso-8859-1?Q?a8METgH6sjKF0NCB30w8iCcjMHWQg2jx2OASkWZR3jJOybZD2+2Ej4Jd2S?=
 =?iso-8859-1?Q?GPeEym+iiuX7MYd99b85NqH5MJYrx8OVGEvqPc0P3wVhiAOJDWgcmBX3/i?=
 =?iso-8859-1?Q?fHofNYtJhNBWDRyvcfSk4P3MuqCz7bBdTrWMCsI/32MQnpEHX2+YCP0Yxa?=
 =?iso-8859-1?Q?1++OqdTdEuYHaDgl85oZhBdlXr2kJIKYkEOF4wfMVQAjgJzEU8s7ZtTN+q?=
 =?iso-8859-1?Q?gvjGbSxVlZ1Z0B47fHCOU/p9ql75rInULIgduS9/WtZH+iQ2ESK5FPw7+b?=
 =?iso-8859-1?Q?ia5c2aTiqHg9p58teIN3EC4E25B0SMVaEno8BfGALUcvAM8eTrzcuGA4js?=
 =?iso-8859-1?Q?yDxFwfhJzy7JQUAuNmf40xYQ1BdAlNIYElCwEfxE8+lRecz3qpr2saWlym?=
 =?iso-8859-1?Q?w7JWx5RTrK2gBb96ZrBgRyuMAEQADBf7SpkZS43kC/NyEaJvM2HAs/ggs/?=
 =?iso-8859-1?Q?cmo3n2Ctbw7zW9m5jBhEq60It4MCDG6/bneIMEhngew1+XJ6UsXaAgGQ6e?=
 =?iso-8859-1?Q?nvJ1ZESvbASWZLEdYLk9Q9caKLvQhDLHMAQbmOVZ0fFjuNcrjHGmiabqdC?=
 =?iso-8859-1?Q?kv388XxK99lmLtNHKDd3K/UcPA3WS1/nzeZwpDGMPY68gT0iNFQmNm2Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: efbf8a0b-999f-4b12-17e6-08dd08b6def9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 16:26:07.6039 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l3NyAfeXwamFb3Ew3SRXQzjdSEjhRFxq8bdLMjV19srtzBe0qBct+yfpE1zhj/U13FAyKG1YcduSfGbC2UDlVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7557
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

On Tue, Nov 19, 2024 at 02:57:56PM +0100, Thomas Hellström wrote:
> On Tue, 2024-10-15 at 20:24 -0700, Matthew Brost wrote:
> > Add DRM_GPUVA_OP_USER which allows driver to define their own gpuvm
> > ops.
> > 
> > Cc: Danilo Krummrich <dakr@redhat.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  include/drm/drm_gpuvm.h | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> > index 00d4e43b76b6..cc3f8ed5113b 100644
> > --- a/include/drm/drm_gpuvm.h
> > +++ b/include/drm/drm_gpuvm.h
> > @@ -812,6 +812,11 @@ enum drm_gpuva_op_type {
> >  	 * @DRM_GPUVA_OP_PREFETCH: the prefetch op type
> >  	 */
> >  	DRM_GPUVA_OP_PREFETCH,
> > +
> > +	/**
> > +	 * @DRM_GPUVA_OP_USER: the user defined op type
> > +	 */
> > +	DRM_GPUVA_OP_USER,
> 
> Perhaps _OP_DRIVER, But Danilo might want to chime in.
> 

I think that better too. Will change and open to any feedback from
Danilo too.

Matt

> Otherwise LGTM.
> Thanks,
> Thomas
> 
> 
> 
> >  };
> >  
> >  /**
> 
