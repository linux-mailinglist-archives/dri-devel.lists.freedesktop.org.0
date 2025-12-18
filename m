Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C637CCCD515
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 20:03:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2376B10EA63;
	Thu, 18 Dec 2025 19:03:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LXqXUZ0d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B4F210EA63;
 Thu, 18 Dec 2025 19:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766084622; x=1797620622;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=lV7+pFS2/E3LNaZzntwTSrvzQe2Vy7NfguGUyolcyFo=;
 b=LXqXUZ0deeCYmkG4auZwkKWGP+lbd2PgimiU06/ff9NdOgqpRDAnssEZ
 VMhnzmCaZJNp46F0Q/8N70EdwFn6o95n6u0tLACokbBGHOfo2mAjU5W93
 syO3aUHMDyrTX/cLaA7ek19K7y2ZdP3xZjo5NKZMJU9oWgqnJM0SBpcUT
 404rnQ7J6pMVsQmhkNeKBgpjxdBBuil2316m+ys5XDuQtwBYw30Zq3MUG
 NDGgq64CtGkSjKoqZqqktePGVj2KZPjVkxfnkSkas1OS8Oz6RRmpzAPDi
 Uk7/OgkEsYHyQSmYxNC8x11AzzFTL+8NvGNm6I5RMEh8R3Ls/j7/og8bd g==;
X-CSE-ConnectionGUID: Cnsw2SgtTrmPVeIa7zERGw==
X-CSE-MsgGUID: ruGKRvtNSB+eu5cy2RLn1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="68089913"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="68089913"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 11:03:41 -0800
X-CSE-ConnectionGUID: uek4INldTKSwJ9h2Vh83Bw==
X-CSE-MsgGUID: ZVj7sSc4TkmKjPhAgzGLCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="198668648"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 11:03:41 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 11:03:40 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 18 Dec 2025 11:03:40 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.38) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 11:03:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oQHiUw0m+qhpSeWDE7AX9dM7NlQRfzvDmvne731Pp1rUo27M6aJl3il/ImFZGMefHumHkPveO/PIvr31ocBtWyCK4oo3AlHiDGGagofzUwDZx/QIQetsxWQ/FDCjXS1d8LLPEVaodguCOUCd4L+PWuT7YX+L514gQ3onOu+Wouea4aO9b1bVoASwyImNK1klPHtsbd45D1DcMlsCdv09SbTtkqd1lcBj6dyijpfYPBvmLIVcoJUgiqlbAJMZ2+2frY87qYxFBCCxYkF9SS8MRuLFErkbskMZcWYcksu4JOjlIWwW8RemBbUaHhh5Q9W9vJBcTxINebMRYY0N9sdbZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j/BqnDhXOKLutAwfZeVi3c6v3Nu5Z5fb0cSOnuzWDLw=;
 b=UHSv/95kgnHInQXL2547Cy/W+/zRdRiqh98a/O4mQNPzQWb/V3RLAkk7T171pt657U4OsxVvSo+ltwN97GK/nkHChaDJ49iQmhigFfQmZa+6V6ZXQgJILWeEn6GHa494G5G2RHQbRxmTddV0qBpdWPovSOgZVx+mfNwKt6H5HF/soN6giZZTnxeLaBqlFZlpcglU1EXrHV0Yt5tMnv8xZ2EBtz57iBlmMTLWTm7lABepZSZ1xeCgtgs7ggaeUas67XK5+VSaClOXvFrNXvC8BFGMOrzp2AicpX21QHgO+7qGC3b3j7/gxn+MnSN/kTd44W8Ueqyq5sjKegfDFs8ybQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB4991.namprd11.prod.outlook.com (2603:10b6:a03:2df::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 19:03:38 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 19:03:38 +0000
Date: Thu, 18 Dec 2025 11:03:35 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, <dakr@kernel.org>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH v5 24/24] drm/xe/svm: Serialize migration to device if
 racing
Message-ID: <aURQB/JJMRNqv+2l@lstrano-desk.jf.intel.com>
References: <20251218162101.605379-1-thomas.hellstrom@linux.intel.com>
 <20251218162101.605379-25-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251218162101.605379-25-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0015.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB4991:EE_
X-MS-Office365-Filtering-Correlation-Id: 1be8ca94-2378-4529-840d-08de3e6826be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?lfYSMkpodVXsPnt2L04nmbcc9hCNxj3T0hqDmcV6cjzSnluFJInXrn7yWD?=
 =?iso-8859-1?Q?E3DwXC3JUuLS7ViBsWpasL90ECvOUF8x7BwCXuHLDQJ1PI2J9RreDzNwiu?=
 =?iso-8859-1?Q?Hyw8c1EtLydzHLHUNgVqED8X2pbGU+jvo2WzfElozmDSTUfBcyU/UiRU13?=
 =?iso-8859-1?Q?pMyX9TiC/E5tC09Q/oG5ybfIXVNS1GysDfWTairyo10UBCTztBwFarM5n9?=
 =?iso-8859-1?Q?a53udjR5n5Gxt/AU+5f7WgHNFzK7F1nWa/vZCXHDcFKw86q8h020ImWvHi?=
 =?iso-8859-1?Q?slMRxuY7rUiG9C9pPN/BGANFOpZKxDW0WrPrlKbzpf8icQEarn4vH2tOh4?=
 =?iso-8859-1?Q?QWV5UEBLTiQ5SqkDRirF2dAeWkd027/SijpdPi87Mj4r4JpQhx1+pc3Kzl?=
 =?iso-8859-1?Q?cmHTpfERhjsggVBHQERa0WdphXqmTUgHhRAmaFZxQG/DM79L9mU0278yxn?=
 =?iso-8859-1?Q?DiJvEa4wTK0SZnfpZFhxUJw3nrNK0kUpGgyEz/xSpHddTDVqyBnW0FfgaJ?=
 =?iso-8859-1?Q?on4Ot9i/aE0RKbxZIaKD3FtfQLNCbhBgkC1YLEKkIVHrXQ2ozbg6zjMq/y?=
 =?iso-8859-1?Q?sWrEAnNdubfaPmABYKw9dHLdiSaoGmgdlwRVFCWo0xp5lZ5UMuHcxisoCg?=
 =?iso-8859-1?Q?dERF7j3O4eV+lTjRuLpp2D0pLnNRzZJgaNahlpC9uPIEr2w4XnoRd+g/CE?=
 =?iso-8859-1?Q?Orvg33I7//GqrQonDxkQ8EmEGoO2HFYUC8MuaoWN4pTZmQ7WNdX3ev/AtF?=
 =?iso-8859-1?Q?80pWYGgWVJfyW6r9ScPmFXbX83ammA4MCNob8HHhUYrAt+YHleRSUmn6z6?=
 =?iso-8859-1?Q?bK30TH+Qjm6AwX9HetbKZof8P5mIAVQ/l4lhrL85FlkeKjP319ckFcEd4j?=
 =?iso-8859-1?Q?CDOIBbuCWG6CL43oTa0b/DIXBmkqy8qS3O1kHrVPTW4In94c80z7om4bfe?=
 =?iso-8859-1?Q?AxQZbVvaTPmpZfFQqkffG6G5WteNYKBJ8JrJsWn4dLFOQ+Ur7dP/MfwQa4?=
 =?iso-8859-1?Q?MEks058Z+kwcYqpnG/xf2Jy8YfJXG1hvh1o4QMGe8yDSltcEIaZFm0UlCc?=
 =?iso-8859-1?Q?BLJe+B2vKSSNDNqJvr+xM49dE4ApaqEnVqlZiO1/7JAELJapacmE1oONBD?=
 =?iso-8859-1?Q?A9Vwn/Ozuo6Wmw8DhUjki5SHm1UvAfE/XH9vRjCT+gdYkt0d+FrrzHaMKZ?=
 =?iso-8859-1?Q?PyDqygE8PjXxZPXAy1yAmjxp3esHtSBpK8anMAigEqIA+ekN/4PXBCtpnH?=
 =?iso-8859-1?Q?yQFyWhyOyLAgzZACZXKaBN3wzjepGF7TbmS2aQ8xuh5AcCHVXHnslvz53o?=
 =?iso-8859-1?Q?uKsrAFGAEAYUw+BInSPnc7ntVHNjvPqhT50of3qJxlTBHnvODEUNo4p42c?=
 =?iso-8859-1?Q?jm0uhkSOPvofkTyXJLtVfSHz9TsDHmER/M/DEuCSObU8xEs6Dhru7k9XQ7?=
 =?iso-8859-1?Q?bH0wt8Z25CnJXT2lW13JqlZ4Ql8Z8q4R2CZGXo6Lm5Jpp52qqPpEHYux/N?=
 =?iso-8859-1?Q?kyciNQQiyAm69lI05/j702?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?kS7X/TNkjd/BU7wXW9/QThpPsmVeF693i/0/SJzK5hJzYOaSikggjHdtfJ?=
 =?iso-8859-1?Q?c9BIkoAayvxuK40uK3+fkVQQND+bCEIMlfr1eZIFxodDfNSjlV/vocmXiD?=
 =?iso-8859-1?Q?gl7MNU1unFZrbVNBot8q5qgIUWAcSxw6qc2/kc/NaORLFdyHTpeLNsYADT?=
 =?iso-8859-1?Q?Ylroxnf0Uk2/hpOYvJRPS8M2c++CGq4yuXGDP4kcYMFH4H3xlRmXKI5D3i?=
 =?iso-8859-1?Q?L74ZzvUgoB6INc3nzoFbpRkfd3nU1s/jwWuKJT8b8mRJnG//sagbSD/+mp?=
 =?iso-8859-1?Q?DKpPXPBxXRvXpOtvqXhfO9fgL2owiSbfjquMRl3v2sg5xQC/x1FzwSJfDe?=
 =?iso-8859-1?Q?o/orsNUwpSPU4SWaLGu9DnXhNfH6ZVWX5xU9diP7BbEtdZWAcqLsxM33Zk?=
 =?iso-8859-1?Q?X09MENQMXnq7UA673SRZzGaTCpDItIQ7/u4uphYIZ7Qd3zmp916x7g3BNy?=
 =?iso-8859-1?Q?IA79xdCGUNK53hfMHK2RPh5AliRuUJuNvYqdP/lpiVnLkO6lEyFLZrZumT?=
 =?iso-8859-1?Q?Pt8OJ1B6id33CIK1wGQ36lU0599cVCn5/fLrYZX0TGzR7lUZ2wa/GB4hX8?=
 =?iso-8859-1?Q?9S6eeqGftMaVvUabkXBGndrRKWSOONcxIigJc9XksLbv8i0+Jj01ZbP0tP?=
 =?iso-8859-1?Q?wQmWtWdlCciFsMpZHHRI+HzzFYLbZLVrw1BODMcqW2ARSQxExlridhsa0P?=
 =?iso-8859-1?Q?Cli/1voizvj/RVJ0U2ZvIvq5ezuo71ApMmslbDHI4BcJ/VL+zgjrK6sD8L?=
 =?iso-8859-1?Q?JyNAQGoIh5OTOub88dVAFkyq3zFQ3YWfUsfQCecsTXkMUz+hif8okV0zYm?=
 =?iso-8859-1?Q?hgPXRPCOAsVuk7FHTY2aqygHm6YdUU7kqeUJi1Fw9Y+2vt5gzMkYbzFqMQ?=
 =?iso-8859-1?Q?8Xkpp9aMOs6wJDM7cNKkVSZ9IfeYcwOVY5wvk2JVjEMEA02oN/UKKbIkri?=
 =?iso-8859-1?Q?9zmudSWYPsh/aT2+ZhMFhbFt9+rBJVOhDGedgmVh6nSyfK9AfP6ZKFlIOZ?=
 =?iso-8859-1?Q?/nNOckPpI4snc7zVL0/6VQpeTjdn89UbC7cjgc4A8EZ9IZzfTXcMz9C+DG?=
 =?iso-8859-1?Q?6gE9x8E2q86YrelxLVWjWVX+LengX4Z3KwdiotWPAjwasjKJCZE/rFIw8M?=
 =?iso-8859-1?Q?5TQqnaRgQQyLqfYK72ZMjNPPFqSHB9ApyZ0+GyTD/gOx+5oDQf2hLs//jr?=
 =?iso-8859-1?Q?QcxvpeJJx0s4aYB3Cwb5krouKL6hCxSi8BwElhnJ/hDjtVMY/IWL88FJj0?=
 =?iso-8859-1?Q?v7jUfp6Dzn+wauRjI6Ydpzj4/jowRmc6fLLqLdJ0LX00VoaA5zi19JlEJi?=
 =?iso-8859-1?Q?sMiorjyvAjA+jrm6twhQszVvae0TpgEItoJulBU3KNeb6eSOzS0R1wJcQy?=
 =?iso-8859-1?Q?lZI0eANMFybtDasQ70dOqdceGwoeQH3GVlEYqlgeQAzGoAd9izvIrNurhw?=
 =?iso-8859-1?Q?8921D6raMKONwsVdRGspi7KpYms9eWPhQ+pKTho/XJ70a/hRedw9SFPRwF?=
 =?iso-8859-1?Q?9wP90lmLqYIACkE2eF0abdFjF+bI5Q059NmS+tKVch3IkaJOCRhtXbHVUH?=
 =?iso-8859-1?Q?UUU1STcILdRhT6RT01CTd11RMH1zMB2EQzFJa0JdYszfb//eNaBhoFqtE3?=
 =?iso-8859-1?Q?Uu6OP2mO5kjANOmHaJMD8q13bWNthylGk0VaX6zklmdxrVBF6BBHJDuw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1be8ca94-2378-4529-840d-08de3e6826be
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 19:03:38.2668 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xtFCVwwya+Sd15dRVX9lTiHBahVkk06E6LqyhXS4pL5na9xedTb7Ph4XcRETZ8TCfXjhBC9K8BG8TyYh0bjcDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4991
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

On Thu, Dec 18, 2025 at 05:21:01PM +0100, Thomas Hellström wrote:
> Introduce an rw-semaphore to serialize migration to device if
> it's likely that migration races with another device migration
> of the same CPU address space range.
> This is a temporary fix to attempt to mitigate a livelock that
> might happen if many devices try to migrate a range at the same
> time, and it affects only devices using the xe driver.
> A longer term fix is probably improvements in the core mm
> migration layer.

+1, yes we can likely do some core MM changes to make this work a bit
better.

Until then:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_svm.c | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 7be4d129247d..dce7879b3133 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -1616,10 +1616,12 @@ struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *t
>  int xe_svm_alloc_vram(struct xe_svm_range *range, const struct drm_gpusvm_ctx *ctx,
>  		      struct drm_pagemap *dpagemap)
>  {
> +	static DECLARE_RWSEM(driver_migrate_lock);
>  	struct xe_vm *vm = range_to_vm(&range->base);
>  	enum drm_gpusvm_scan_result migration_state;
>  	struct xe_device *xe = vm->xe;
>  	int err, retries = 1;
> +	bool write_locked = false;
>  
>  	xe_assert(range_to_vm(&range->base)->xe, range->base.pages.flags.migrate_devmem);
>  	range_debug(range, "ALLOCATE VRAM");
> @@ -1638,16 +1640,32 @@ int xe_svm_alloc_vram(struct xe_svm_range *range, const struct drm_gpusvm_ctx *c
>  		drm_dbg(&xe->drm, "Request migration to device memory on \"%s\".\n",
>  			dpagemap->drm->unique);
>  
> +	err = down_read_interruptible(&driver_migrate_lock);
> +	if (err)
> +		return err;
>  	do {
>  		err = drm_pagemap_populate_mm(dpagemap, xe_svm_range_start(range),
>  					      xe_svm_range_end(range),
>  					      range->base.gpusvm->mm,
>  					      ctx->timeslice_ms);
>  
> -		if (err == -EBUSY && retries)
> -			drm_gpusvm_range_evict(range->base.gpusvm, &range->base);
> +		if (err == -EBUSY && retries) {
> +			if (!write_locked) {
> +				int lock_err;
>  
> +				up_read(&driver_migrate_lock);
> +				lock_err = down_write_killable(&driver_migrate_lock);
> +				if (lock_err)
> +					return lock_err;
> +				write_locked = true;
> +			}
> +			drm_gpusvm_range_evict(range->base.gpusvm, &range->base);
> +		}
>  	} while (err == -EBUSY && retries--);
> +	if (write_locked)
> +		up_write(&driver_migrate_lock);
> +	else
> +		up_read(&driver_migrate_lock);
>  
>  	return err;
>  }
> -- 
> 2.51.1
> 
