Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E713990F692
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 20:59:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80DF010ED92;
	Wed, 19 Jun 2024 18:59:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TGMHMiZA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 837A110ED92;
 Wed, 19 Jun 2024 18:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718823571; x=1750359571;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=dkF7PA5AWb6d6hfUVAWB1ILvgLHXBkyp+mUoBUdwffg=;
 b=TGMHMiZAwNIRZZAG5RtFtiHJJwGzSn1Z9fi7Sx+/rK9EF7y4YoCpBfTv
 XI/Z4r24mlTBGGiv6BPuDklwFOcFDPn2k5zncbNLL5Ocxy0am3O8sPJ2I
 mS3bkYduGSzLoX3Pu0OzkWYm5H2RfMC6LU1HKazRYDkSs0gT7UtZllgho
 Ex8uJQueLGE0+N4HpJBxioYNR87ft2GXhv4ISZwLJhIbZJqUbFxxmnDnr
 mfsYz7c/KizAKJkd2IwnNPESP4vJLoxRsE/RQFdeXWcLWhsmWH+6MsFna
 Ud3WwNUzMSqtHGmnL3N4XtoMffgcwMtHDY2Gyr64ODBerrz7ZLYHfr1PD w==;
X-CSE-ConnectionGUID: vICpQwg3QWKvwpBu2p8cAQ==
X-CSE-MsgGUID: 7xIdWv/USiydJ4vRVD8SWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="12152280"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="12152280"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 11:59:30 -0700
X-CSE-ConnectionGUID: z/T4J9wxSOKWlndMXuGb/g==
X-CSE-MsgGUID: zr8yLPvxShG0ZHjO33R0JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="46528199"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jun 2024 11:59:30 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 19 Jun 2024 11:59:29 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 19 Jun 2024 11:59:29 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 19 Jun 2024 11:59:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lu1hOXKmVlNtn1pzXD0YPJJ5cwohMlBewwwi08YG4izult+lf0U1pc2IYpBYSEiysh2l8hRamJzlgxGo/lRH7vW4XkvRjzMvsA9Nd50Tkb2/6JPNr7VFg9qLJVH18RsQaoX0GMdZrCeQd+OlHU6zxbx3abT3EODUzSe6wXE8kZ0PsxU6bETM7niaUs7l0TCH8E/BkSDTmDMfky22frHzfUZ0BmNBQcNCicVgTMH8b6EWBPTeAoHBHt5vu77H4DxQVhDb6MRakwnP1szH2L2Cwl0rZvnyMS3vByur3EPlmmqMKlnGIRIoEh9Zw+aDkYjKJtWZCuMwpMxKLdKKV7+FDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X6CaCVoYv3zo7EDtiDxuU7RYgLJNNcwimDgHVik/xPw=;
 b=fCktz4lgYGZwmoQDkN1D+ZvVNOikuSm/vpFg0fVkYfJnwQWe3uaTBpz1MpME7Hj2aPKFtsEAyICT0QiL2sXeYquB59wBkvBHZLaEyLNtBIG9nGJ7anXI7vU/QTZtHlbWQLkPhSAOC6r7pcTt5TAeX6XouPPEK9YyVu7KFbjrI/jfLSs1UJkNxOwFUJqheBvZ1q03zBUcX3kKMIU9eYbVvOeyCspj6S1vM/CYimkU7y7YVNDPz5C623VixlQ2n2nVu89SdsInmrI8paMUPrW7q7zteXAHFQw8nPX7GZWQ3OHz07gSFD+FpqEj/+kbn1ZG7gslWezGKqgum0nNz2RGcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH7PR11MB8571.namprd11.prod.outlook.com (2603:10b6:510:2fd::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.32; Wed, 19 Jun
 2024 18:59:26 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7677.030; Wed, 19 Jun 2024
 18:59:25 +0000
Date: Wed, 19 Jun 2024 14:59:22 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, "Lucas De
 Marchi" <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 0/9] drm/i915: Polish plane surface alignment handling
Message-ID: <ZnMqijypij5ZCk-O@intel.com>
References: <20240612204712.31404-1-ville.syrjala@linux.intel.com>
 <ZnLDKM2I8WWrWwmO@intel.com> <ZnMNA8QQdxPLQ1oV@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZnMNA8QQdxPLQ1oV@intel.com>
X-ClientProxiedBy: BYAPR02CA0019.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::32) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH7PR11MB8571:EE_
X-MS-Office365-Filtering-Correlation-Id: a7384d44-5d26-4e42-dee0-08dc9091f02c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|366013|1800799021;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?thgdjr2K9JVOmN8rBlxavKMHm7qhEHcMrt9bSa7ZKoQmrBumiJvAabSJg7?=
 =?iso-8859-1?Q?HbNmqwjLliWYrgXSb/OPiaNZvXmU0NvOpnWIKjQjNdNZSGi5wiGyijr8Or?=
 =?iso-8859-1?Q?ewhV8oIte0f3CXxR0LWduBmxJcR75NidjhOdcJReXMheG3DxcwCCOmAn2/?=
 =?iso-8859-1?Q?U5PAiKUo2cTuam9rocOd1cc2q2RTRLbj7R18cgvmG4ai3ufxJXdtNkIG0N?=
 =?iso-8859-1?Q?8icNHNPSWg3wloMUvGp+MweNeWTGtpnI2AEEXoBNX3feRJ2AreJzTy8oDv?=
 =?iso-8859-1?Q?lUUPaJKCkXmSGq9C+1HhsQipQ8bGwRKHcawaAR1EKU4NiaJmf9/nwlk53W?=
 =?iso-8859-1?Q?EIdwU3cz3mqmMdjQbOowWL1aFR9iCKUpYbrBlFLymWhXN29MkDKWV5pQZM?=
 =?iso-8859-1?Q?/5I9AOaN5/B4rMTEK742wg4qB0orSWuQ8YlMXVUCh04LYGH4TISAjGSokh?=
 =?iso-8859-1?Q?ZFsXouZ8ff7dcos5VafFIk5919i8BEihlc/5+nBjW9va2V2FPuQlxETccd?=
 =?iso-8859-1?Q?pDDklouaRHUqWEgJY1J+EJhR55nNHWCm+E4tcabO3761IR/xeJIGTit2wW?=
 =?iso-8859-1?Q?vDjog/7aBC1IvUYN6aH5Brk8RIKGsjk70j++hfA6BQOMivb/gKi8Uf9udI?=
 =?iso-8859-1?Q?D4DsiEnB+cczwp/npf1/48gMi2MQ5oFMTKE1cdDazp5YXKLEr10ZXzYwCx?=
 =?iso-8859-1?Q?mLmPqgldmpeBWcbVAho8+UuecH7xV7yCYUbzfQ1DA2pnJW5SOiJuOVNc+U?=
 =?iso-8859-1?Q?fi+lwsFLBdqwskr6Pc/o3LlD2hHyVQu7Tcq/PL3kXc4AJdta7xVoJUEHFO?=
 =?iso-8859-1?Q?u24QPvusNiiO1Its+UCnpEHtC1/K4LYrWxzKHpdC/d+YXKBAGP3s1rklTy?=
 =?iso-8859-1?Q?Y2Ks0wC727PCu7liLNcGrXAEzhVUipnhWQJRSP8Yk4IwpA+9Q5hyjMYobI?=
 =?iso-8859-1?Q?C2P0GjMWXoc3N94xGrTicFAsE7fWAhOJjtAJ+BXG7ydKM+LKm+1Gy/Xedt?=
 =?iso-8859-1?Q?KkrMp4ojOsTH77SmfCSJ59Nveq72S5S27F0b5bdVDU9KE9Vz0GjHa0Emea?=
 =?iso-8859-1?Q?ctoYcdQZK9pla/vzNFtyQ56T5D6mofGHIJ8LEK+Z/g+2m52xAgcZb2AqbV?=
 =?iso-8859-1?Q?hLe9LJc8Bu24b3/7YZi+UJxRiB+KscrBDXcNymYYeTE+UO1eRIloaqiYKB?=
 =?iso-8859-1?Q?JAyogyW8Ih9am0AnRm2tq99Ji3zM5oNQryV7jzTMqAb7uFjRfGLIVgypEr?=
 =?iso-8859-1?Q?YOfwx8d6vSFZSFF8OdDerBT8E1ip85nDHxLmYrWRmE0xS6qMiw7KYDDkQE?=
 =?iso-8859-1?Q?ak0RDs9YYWdS6iy9YqYyLvIlF5x7cOPwv60fhKrsJ36O6wc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(366013)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ojcMeNRD08HB2rjC3DwuJoLQEkAIox/gXYb4L1nOFpkwmDnHqrWpMHlalq?=
 =?iso-8859-1?Q?1XpKjyBm3WHIjTQPNndaIg17kHe6/u2SYhs1CvsB/VL08n9z1IZAr9eRyl?=
 =?iso-8859-1?Q?AJpDY4G7iBV3RESgWt+evhc5B76bSgZihnFc0CCFJ8QHVNqyFEbPPHJAQV?=
 =?iso-8859-1?Q?A02amOHnUIwNXAfo0o+NKRfWQUAYp4QRkuOmVq23+/VZym4J6PC5Q9ZKD+?=
 =?iso-8859-1?Q?p37OyuI2M/lre0NdYOtJ0tmrzWbjj/7lVDClm0sAx6jEN4qdDRy81MGHYh?=
 =?iso-8859-1?Q?IxM7Kobc9PCHIhwiRdxThFVWREwmAIqJ9mHCzZSc3cM2zH/8cZcseH2LjK?=
 =?iso-8859-1?Q?+/6drImszYLKX8MQRYvodmN8PDJa4XwaDjV7mdZ6smAgD8Y9UiEYO//3WK?=
 =?iso-8859-1?Q?3WZg/k+2kKN3kuSwnEr67qZA/JiWJnK0vV8Ku4cW1JdFMygl9MVr4z3PAf?=
 =?iso-8859-1?Q?7Y3d0Dg2xgizsA9NNDWS4t2FZRxvjkr9zuhErSckIsIhy5rd5x3mSEkH9+?=
 =?iso-8859-1?Q?Em3ycpeylvn9eZuENjP2SVph/rFdSqaiICCOGNAjr+6UlZSRHL0veuDW7h?=
 =?iso-8859-1?Q?Mu+JewA0N1Cyk0SLGd3R9gwazBI90RInF4d6NOLY7EQTIpwtPdAiGdJlma?=
 =?iso-8859-1?Q?endPL5QQXyuj8jSzXNowMVW1sWuJXvc6ZPDOL7B/r7hY3EonMCDMqt6kQ9?=
 =?iso-8859-1?Q?ZTy6jQ2hvDHg/hbAND0zi2piMA2FhNtdhqCCEPzIGV3goEBgri3+/zhaI+?=
 =?iso-8859-1?Q?koUua+a/cQhX35JLRRkkWtf/u+NPBZ4KeWchNGYDhLSbpwzQl4uzX5QirO?=
 =?iso-8859-1?Q?38k/M31gVJfhaBAtR7h/JIPEf+1L2QYRFsflZ6G77OxdG5yVQtTlPP9mhW?=
 =?iso-8859-1?Q?tTXsBNGzsHePfcJ0+wA4Ir6MV8lLK+FPM3Ct+l/p6Wq8SLWqZD/KHEkCwE?=
 =?iso-8859-1?Q?vl+yeT/DesgR4Lu8Q9feNEuu39P098xeu51H8enLepjVuEjNZO7sn5e8AW?=
 =?iso-8859-1?Q?byNRXOP+G0Zeh96wCbQDcb2ZvECTGC2kMtfYZ/w7jEfYbH3ccPSsfhupvu?=
 =?iso-8859-1?Q?uxKN6eoeGk3WxExknqBVPbrmmegW2tZL/Aw6SNXGLCPiPB/eXBghV6ILkp?=
 =?iso-8859-1?Q?OJnVRPER+nu/ochWpe6AAUyMWT/Xn7mICYJxAKWXfHPz6Dw1hLISoh2YC+?=
 =?iso-8859-1?Q?FC9zjYV6q14u0OZTvJwU2JJNHR5h7jLBY0UnazpZAHAW9t3yhMr50ISTmb?=
 =?iso-8859-1?Q?sZXuWa6nLKZZyoe7fHnXWA9Yegk3dg0dPZpRJyRsOqCxgekZuYfjwnjdyk?=
 =?iso-8859-1?Q?pomFHHP9lEagn1CE8Da+XoiLdWrthrxvZfIgkPw04kIlf3Sw8PPkHAPWiQ?=
 =?iso-8859-1?Q?ePRvkzZP6iDRes9rj95cUOBw7nCWfZ9wINJ5aKrjS2afh12cF3UX14h36y?=
 =?iso-8859-1?Q?FtXNYpVXnWOdGqPVDbZUdBZLEFpvFa0DHKm4zJcd0loA7/gxHGjx4Z7dxL?=
 =?iso-8859-1?Q?XBBsyUSocGHbG2lXcHpiS6AZFAnMJq13mHDBqK8OFNX321+lfXLYh74LDT?=
 =?iso-8859-1?Q?jOtkFN00tGR/1CPk5WbefjWi1pK819V0NWVuhesmzV1pybz2VoxCmE/kQq?=
 =?iso-8859-1?Q?rWFN7h5P60NpV5lflDnQAMK0upxAtK+IEcwV+OQIVNwUa75AjtPnKsTg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a7384d44-5d26-4e42-dee0-08dc9091f02c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 18:59:25.5764 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G5yp08HKNYdXreQi0M+L6bXYziOm52u0wps724fNgOhETJz6XJK1p2/Pb9/7n02dC1rs7JFolpTUivZ9FPM7bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8571
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

On Wed, Jun 19, 2024 at 07:53:23PM +0300, Ville Syrjälä wrote:
> On Wed, Jun 19, 2024 at 02:38:16PM +0300, Ville Syrjälä wrote:
> > On Wed, Jun 12, 2024 at 11:47:03PM +0300, Ville Syrjala wrote:
> > > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > 
> > > intel_surf_alignment() in particular has devolved into
> > > a complete mess. Redesign the code so that we can handle
> > > alignment restrictions in a nicer. Also adjust alignment
> > > for TGL+ to actually match the hardware requirements.
> > > 
> > > v2: Drop the per-plane vma stuff as it was borked
> > >     Don't temporarily remove the 2MiB DPT alignment for UV on TGL
> > > 
> > > Ville Syrjälä (9):
> > >   drm: Rename drm_plane_check_pixel_format() to drm_plane_has_format()
> > >   drm: Export drm_plane_has_format()
> > 
> > Maarten/Maxime/Thomas, can I get an ack for merging these via
> > drm-intel please?
> > 
> > >   drm/i915: Introduce the plane->min_alignment() vfunc
> > >   drm/i915: Introduce fb->min_alignment
> > >   drm/i915: Split cursor alignment to per-platform vfuncs
> > >   drm/i915: Split pre-skl platforms out from intel_surf_alignment()
> > >   drm/i915: Move intel_surf_alignment() into skl_univerals_plane.c
> > >   drm/i915: Update plane alignment requirements for TGL+
> > >   drm/i915: Nuke the TGL+ chroma plane tile row alignment stuff
> > > 
> > >  drivers/gpu/drm/drm_atomic.c                  |   7 +-
> > >  drivers/gpu/drm/drm_crtc.c                    |   6 +-
> > >  drivers/gpu/drm/drm_crtc_internal.h           |   2 -
> > >  drivers/gpu/drm/drm_plane.c                   |  23 ++-
> > >  drivers/gpu/drm/i915/display/i9xx_plane.c     |  75 ++++++++-
> > >  drivers/gpu/drm/i915/display/intel_cursor.c   |  38 +++++
> > >  .../drm/i915/display/intel_display_types.h    |   5 +
> > >  drivers/gpu/drm/i915/display/intel_fb.c       | 151 ++++--------------
> > >  drivers/gpu/drm/i915/display/intel_fb.h       |   3 -
> > >  drivers/gpu/drm/i915/display/intel_fb_pin.c   |  39 +++--
> > >  drivers/gpu/drm/i915/display/intel_fb_pin.h   |   3 +-
> > >  drivers/gpu/drm/i915/display/intel_fbdev.c    |   5 +-
> > >  drivers/gpu/drm/i915/display/intel_sprite.c   |  26 +++
> > >  .../drm/i915/display/skl_universal_plane.c    |  85 +++++++++-
> > >  drivers/gpu/drm/xe/display/xe_fb_pin.c        |   3 +-
> > >  drivers/gpu/drm/xe/display/xe_plane_initial.c |   4 +-
> > 
> > Lucas, can you give me an ack for the merging the xe
> > changes via drm-intel?
> 
> Apparently Lucas is out. Rodrigo, can you ack this?

I wonder if we should start using some tag like
drm/{i915,xe}/display: or drm/{i915,xe}:
in cases like this, to make it easier to spot the patches
that are touching both sides...

anyway, that was just a random thought while seeing this and
searching for the actual patch to ack...


Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
them all...


> 
> > 
> > >  include/drm/drm_plane.h                       |   2 +
> > >  17 files changed, 309 insertions(+), 168 deletions(-)
> > > 
> > > -- 
> > > 2.44.2
> > 
> > -- 
> > Ville Syrjälä
> > Intel
> 
> -- 
> Ville Syrjälä
> Intel
