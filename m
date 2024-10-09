Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 628FB996D55
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 16:10:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D42F410E171;
	Wed,  9 Oct 2024 14:10:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vmmic5B4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6885610E171;
 Wed,  9 Oct 2024 14:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728483032; x=1760019032;
 h=date:from:to:cc:subject:message-id:in-reply-to: mime-version;
 bh=syRveQ4ESGy1nFG27QmA1K0Vf2WU5Af8UNiW2sFBciY=;
 b=Vmmic5B4rVcGwxyNKbPIV8B1DgfwAQdglXDA5BjZm8RkuQb6/te4m/cZ
 LlwZsxh5nrF/PAEzlsNcDMOMWxRL5JwB/MK7GhmnKnHFhUuuEJVAFDRBv
 CQSRA1rUx6h2dFqsut5lxbQ46qxO08BGq5J2ymRlU/hYk9S9ITHM6jz0v
 lHupr119xtjFxTMnide4zIFTInUjSvVZiTyxOS1bl8l3BU3MM15YCZ91j
 bKNUzE26OskbBlVqgaWYfae1ql8AZiCJSYTxSUwO8sj5kQV3qj7NKfuKi
 qz4xke+HShCz7OKkOcBQaHupUWTxhX3LRiZXteSEVsJSbtphRRz+ygvF3 w==;
X-CSE-ConnectionGUID: Y3s4YGISRsuf88A9CMJAog==
X-CSE-MsgGUID: 0z8RCJFsTSWWAMDtj93mGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27665520"
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="27665520"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 07:10:30 -0700
X-CSE-ConnectionGUID: eK/ewVRmQLC7AkGt3/nw1Q==
X-CSE-MsgGUID: pgfzcbdSRFOriNXYIwF4Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="113735133"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Oct 2024 07:10:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 9 Oct 2024 07:10:09 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 9 Oct 2024 07:10:09 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.44) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 9 Oct 2024 07:10:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PNveoLRe1a3dxpbe9N7Zoy8OEO8KEYAk+moB/B2Bzz8O8T9/SwoUpjNDwXOn36lfk6ZsTyj0Aq+ZNs8yszbLlt8abzLS/P15p7GEwqEONXlj9K/HsKPi2GGjWSr9zRJo3EfPuXHcWcd/8YukTesJIixH2yPWfhg6w3BXlu/diSC+oxIVg3DFcIJaaeGaTFh694H4Q3iH1g1Lwz9ybTE/LGc98iNW4NC/6J+dOEr7qo7KVpf9O+ClL//hQHPfDSoEensoIdPQQpgzpCqglxATszJyaMGUC7l15ZkaGuNh14fqMomL4Mx5nydxWsSVLYNZJnlxBQNWe1LtfHRz6quYtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jEOi2EP/xrf2dNhEa5Svq3uClwiZqhcotZOdVAQcvM0=;
 b=xYf09UfNzh4zocd/q8lrXbTvNI53dQJd3wEgWlGCA2/nPlIwUCvh+gPlwwFG+SJ2+UEndOHKIzaBeJ6OGyTF+TeZQ/lSJUZPWvnY7l6Tqiq+pcdThBsb8H68p6G+3QtVkdHm8ARTyLHTQLGHtfvTARXFqJOpq/kOcM0VVyazQSAdk/c++EXledsvmUHIdCszVngSRyrnzUpxNenEphc3xW/fKqJWRECg38rx+UpO4ndX6dYE/0FwFp6Y9fVd01HkgwOLdr4VRujLUimcSI/Io9jAOQd+5lsu2TdRUYDxQgXfreDiqXzrJ9f+UN4tRPw84oDaTi/s46MS0Hd0LibP3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by IA1PR11MB6097.namprd11.prod.outlook.com (2603:10b6:208:3d7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Wed, 9 Oct
 2024 14:10:03 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.8048.013; Wed, 9 Oct 2024
 14:10:03 +0000
Date: Wed, 9 Oct 2024 22:09:55 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <oliver.sang@intel.com>
Subject: Re: [PATCH 4/8] drm/client: Make copies of modes
Message-ID: <202410091649.1353a717-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241003113304.11700-5-ville.syrjala@linux.intel.com>
X-ClientProxiedBy: SG2P153CA0035.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::22)
 To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|IA1PR11MB6097:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e0bdb9a-fba8-42e4-0315-08dce86c11f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?I733eP82CQqtLWr89hTMM0hU2bx0T+y8NN+OqBEtrNxqX/xsXMDG98a8oTQ/?=
 =?us-ascii?Q?BOKfl56pRtj+9G/KAJbOp7g+8AITNvYDfi6LwvbFtEXyR+UmqXYZ/NdCrMJw?=
 =?us-ascii?Q?mrq2Xn3EPColX8Bnd1SsTxIt1fHjgEciqka6uHm2nKn2VXDnc1Q/dTAM6tDV?=
 =?us-ascii?Q?xoPhqRiBgzuvyrRDjG58ThF0+GYj9HGMVpLqkyifKZn3gXq3tk69Nnar5P6i?=
 =?us-ascii?Q?Xg1U/dH6Fjl1VKLp5uTVjB/04VknZB/jAPeLeQBayJGwcT/qlEn6BEAWo/xB?=
 =?us-ascii?Q?IMzBZ4du6uVnsCSQdAv2CuOtzO9M8hrJYyvKHnj9EAtjrEiG7HGhMgk5juk4?=
 =?us-ascii?Q?+ruYVGyNS3+JVBnqVh0fTnfxGy7WnCIcGzGbl6Bh3RGyDGdc8qhg7RmSFeaT?=
 =?us-ascii?Q?/de7gkq5Y0TeVHHWR/GAXXSBKR4P7YdhBWAqt8ihnDFJ/NpOXRSelEkbNEPS?=
 =?us-ascii?Q?jmRP6Qn0DwSlOnY9LGRjLTEYPOKdqWK/gZ5r2ipugHTXu8TY+U8Dltt2wV3F?=
 =?us-ascii?Q?UqftCno1gX6cfsC84Z6oIgs4WzAkh8Za4RyV7n/owyIWB0/x6ww5lCEMjHOy?=
 =?us-ascii?Q?3sCvQ58UmFhq5L6Eg5tlhl7SDmJnziD9XFPgME4crA+vqLYITNFfru2NYn+H?=
 =?us-ascii?Q?tW/VuSvysMxWdPqwOjA658fxgvbb7Wx9wxsF6U6vIvQHOlnSLr/4nnEjYqtG?=
 =?us-ascii?Q?pzU1GCZy5d+N/YnntneajI6eeb0vA22sAB4hXEzBj4RZ+ue1JbzjQCZ23Lgm?=
 =?us-ascii?Q?3aFLWgo5KbgXeuAERbKvmzO3l93agG4GACydrGpETB+TAjgIpC/4herVmlOW?=
 =?us-ascii?Q?cY6Bh/1QKGl+yhn1BNFJP9H9eZqyzn01fS0G91LsvZg1hns2yMPB3F7GYwpm?=
 =?us-ascii?Q?HGj/3TiLqamA/nL6eE8SC3kFQPz8SfFD/aVGPRTDyunZ1Xv8QBEoKEJ14QF9?=
 =?us-ascii?Q?+neWI6AysHQM8RB1XIg7Ukwn6JC7SRa42O66C3QcM3OrZYlbHqIQ+5th4uQA?=
 =?us-ascii?Q?PC3lrUXvDzSf5qgtLeu8OiIWfbtfJ5b8pMUnKrUVi80zQJJiTjjPSEeS5Nzn?=
 =?us-ascii?Q?MEkQ63IS8fTvaB3ZfE/gfxBT591291uHOJA2SXdvDp1S3/UhlqxAsHfnu2dG?=
 =?us-ascii?Q?mpdHkCUCnYGeCurFuK5qpHmvJJsCnmvIRic8thr7aGNngccSGTyc4wA+aFuC?=
 =?us-ascii?Q?CJ4oYujU5aNJpl4PQWbDADEZ9+KYgFiqaYXKPWaW514ggMzD9xKYIx8HGU8?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8603.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lDEO4hfOHf/nRVGFvq9oZ2lv3LnSaXSGEv6lB5w5Kbo8ME+SIOviMYXjJMfD?=
 =?us-ascii?Q?hgIE09gm1egh93EYpSMIq17rKav1K51sFjRnvW2Dd+niNSbFZTTincUQgfsc?=
 =?us-ascii?Q?98FeMHGZqzP/Pby3R7zBvD+7OXiTP/6m5JqE1auctX2/eYL8s3Apg1d6FTlx?=
 =?us-ascii?Q?pt4GgPAWcjRo/+BnC0E4NVW2ExwhXc+zeDhGfw9U5vOBqTvKSYosAMFBgbFT?=
 =?us-ascii?Q?7R5HdKgJnQcwCtD7kW7JLX+PvRai5i0dSnXqes0Kmm36bdLzDw2Nrlq0CBX2?=
 =?us-ascii?Q?X07hU6+vc4pOtzF4XFSh8ajAWQgLHisX++VLvk+cAteB0rKWVfIKIXODg0Ia?=
 =?us-ascii?Q?S3D8wMikRyROdK86+stQAZIUwG9eg2tF0Kj619ptLuMbtmyAxD8Flt8RDfmv?=
 =?us-ascii?Q?VaZCg9PpPxFEJxFCVFezcq7gCrOrQw/yQSrIBTXrZ/f19vJWZr5mpV7VZl2d?=
 =?us-ascii?Q?LXGd0zGxHBWxj2rIcM0JY8Vo3fCSNlOSXgYi/bmkbp5xi+73wXRMLKi6sK5p?=
 =?us-ascii?Q?ZozOSQm5t9Ar63vApJ/VA0JH7DMV9z4dD+CUoygw7TomnmdZrqL6HRn0U2ME?=
 =?us-ascii?Q?0m/9yYksgnPPv3dfSDy4XvNIhfK/GRmaSNBAHjyA6BFsqLFjQenvEnl/Qq1m?=
 =?us-ascii?Q?6SdiR/g6yfk8QTRPYX4IJGVhw4WDACJ9c+pUguAZMtB9xzTLnSztvh6ODcty?=
 =?us-ascii?Q?CO+114y4H3y2wcbmqMB4gJY5sksXrQUKQ411xCRd27Wxu0PWT8FglITHmd4D?=
 =?us-ascii?Q?+LYuzt0lrLhwY2rTNXaPzwGTO2fBQiT8Qv3iKC6yGo9JuwunjTTOZPl3Iney?=
 =?us-ascii?Q?JtWrZPoT1hDx84B3xqVC0Okr8Yiyr/xQIk1oAt/oZleMN/EIBrH/+h4DCGzN?=
 =?us-ascii?Q?4qagf1NEjyvO3V9/V/HAUMHbpykFT3xRrXvfDvqX500Fpsbp681s60/FA+lB?=
 =?us-ascii?Q?RO0fo6qw2GU8ytpxmuXvV4gSsi0F2e04jzD9jvYcfPD/P/oZt8GDWOBp6hpj?=
 =?us-ascii?Q?GJDdGkZpLc3BiO/T+8DZDY/Y9JuGFz4/j3qtMTQup0PjVJvJmcX8MPf0RMSF?=
 =?us-ascii?Q?EADmJWD5veW4c1fSrMJA/wX0h8AN8MB+DsJ6cdo5TNvmr6WzaKIpWZpYji8u?=
 =?us-ascii?Q?340h6pnWzc5CcCyFsOeYQoDvxASATfmai12G5VBtALFqb/1CgSHXZD1wh7SK?=
 =?us-ascii?Q?7JE6ltMMFeNLpJgoJQc6Z0uVADWjiwq4DBb7tCdRl8yW1QT+a04LNhSSmqqe?=
 =?us-ascii?Q?jazzijx847qz0s60+sf/OEEBePCuuAlnzH+olsC2ZJuuOfuKfV/iuil2J5sy?=
 =?us-ascii?Q?TjctMpjXn02N+4nmJXtmukrpPJgrXvkDYPE2V0TXkXvGHNyoiolayJbEfnU9?=
 =?us-ascii?Q?e6+NzMVe2ZcU9iP3fGFPo0F+hjyW7pjkYRnqgeDB5GcOKE4l7tcyIM7qOzAb?=
 =?us-ascii?Q?P0hqoLy5FgBNPxoEYBFajN0TTfNPxP4d7Y3+lhAegduq8K1pIwggo5A6iBX7?=
 =?us-ascii?Q?nxIrpH1gdpnTLA9zCxIYoz3T4x8TClJPsxMapv5thoaE6vKnhty1TD6WD4u8?=
 =?us-ascii?Q?BI2oByvw92cVjy+DoKjXNANt+oeq5M46XEhDGgZXLglF3A4UAhPYtdu7eXs5?=
 =?us-ascii?Q?Lw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e0bdb9a-fba8-42e4-0315-08dce86c11f5
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 14:10:03.7394 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uEMCxj/flRrZhR4Vfy/vAbvi9cL3JasJrsLNKe+cPEZxodoYdzFxitqjZxjSJD/OTOby1c79CEgo2LHSUZTb9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6097
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


hi, Ville Syrjala,

we noticed there is a v2 for this commit
https://lore.kernel.org/all/20241003181553.8891-1-ville.syrjala@linux.intel.com/

but bot failed to analyze the patch mail structure and re-assemble it with
other patches in this serial to form a new branch (which need manual efforts).

so we just made this report out FYI. in case you are sure the issue should be
addressed by v2, please just ignore. if you want us to test v2, please let us
know. thanks


Hello,

kernel test robot noticed "Oops:general_protection_fault,probably_for_non-canonical_address#:#[##]PREEMPT_SMP_KASAN_PTI" on:

commit: 2cc919cccbb5d887534545618d696db4ec5fb691 ("[PATCH 4/8] drm/client: Make copies of modes")
url: https://github.com/intel-lab-lkp/linux/commits/Ville-Syrjala/drm-client-Constify-modes/20241004-061843
base: git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link: https://lore.kernel.org/all/20241003113304.11700-5-ville.syrjala@linux.intel.com/
patch subject: [PATCH 4/8] drm/client: Make copies of modes

in testcase: boot

compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+----------------------------------------------------------------------------------------------+------------+------------+
|                                                                                              | 40327b7031 | 2cc919cccb |
+----------------------------------------------------------------------------------------------+------------+------------+
| boot_successes                                                                               | 15         | 0          |
| boot_failures                                                                                | 0          | 16         |
| Oops:general_protection_fault,probably_for_non-canonical_address#:#[##]PREEMPT_SMP_KASAN_PTI | 0          | 16         |
| KASAN:null-ptr-deref_in_range[#-#]                                                           | 0          | 16         |
| RIP:drm_mode_copy[drm]                                                                       | 0          | 16         |
| Kernel_panic-not_syncing:Fatal_exception                                                     | 0          | 16         |
+----------------------------------------------------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202410091649.1353a717-oliver.sang@intel.com


[   12.729071][  T116] bochs-drm 0000:00:02.0: vgaarb: deactivate vga console
[   12.733522][  T116] Console: switching to colour dummy device 80x25
[   12.738211][  T116] [drm] Found bochs VGA, ID 0xb0c5.
[   12.738603][  T116] [drm] Framebuffer size 16384 kB @ 0xfd000000, mmio @ 0xfebf0000.
[   12.742172][  T116] [drm] Initialized bochs-drm 1.0.0 for 0000:00:02.0 on minor 0
[   12.744751][  T116] Oops: general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] PREEMPT SMP KASAN PTI
[   12.745622][  T116] KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
[   12.746193][  T116] CPU: 1 UID: 0 PID: 116 Comm: udevd Not tainted 6.12.0-rc1-00311-g2cc919cccbb5 #2
[   12.746817][  T116] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 12.747510][ T116] RIP: 0010:drm_mode_copy (kbuild/src/consumer/drivers/gpu/drm/drm_modes.c:1422) drm
[ 12.748000][ T116] Code: 40 84 c6 0f 85 01 01 00 00 84 c9 0f 95 c2 0f 9e c0 84 c2 0f 85 f1 00 00 00 48 ba 00 00 00 00 00 fc ff df 48 89 e8 48 c1 e8 03 <0f> b6 0c 10 48 8d 45 77 48 89 c6 83 e0 07 48 c1 ee 03 0f b6 14 16
All code
========
   0:	40 84 c6             	test   %al,%sil
   3:	0f 85 01 01 00 00    	jne    0x10a
   9:	84 c9                	test   %cl,%cl
   b:	0f 95 c2             	setne  %dl
   e:	0f 9e c0             	setle  %al
  11:	84 c2                	test   %al,%dl
  13:	0f 85 f1 00 00 00    	jne    0x10a
  19:	48 ba 00 00 00 00 00 	movabs $0xdffffc0000000000,%rdx
  20:	fc ff df 
  23:	48 89 e8             	mov    %rbp,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
  2a:*	0f b6 0c 10          	movzbl (%rax,%rdx,1),%ecx		<-- trapping instruction
  2e:	48 8d 45 77          	lea    0x77(%rbp),%rax
  32:	48 89 c6             	mov    %rax,%rsi
  35:	83 e0 07             	and    $0x7,%eax
  38:	48 c1 ee 03          	shr    $0x3,%rsi
  3c:	0f b6 14 16          	movzbl (%rsi,%rdx,1),%edx

Code starting with the faulting instruction
===========================================
   0:	0f b6 0c 10          	movzbl (%rax,%rdx,1),%ecx
   4:	48 8d 45 77          	lea    0x77(%rbp),%rax
   8:	48 89 c6             	mov    %rax,%rsi
   b:	83 e0 07             	and    $0x7,%eax
   e:	48 c1 ee 03          	shr    $0x3,%rsi
  12:	0f b6 14 16          	movzbl (%rsi,%rdx,1),%edx
[   12.749333][  T116] RSP: 0000:ffffc900007ff548 EFLAGS: 00010246
[   12.749749][  T116] RAX: 0000000000000000 RBX: ffff8881819c6600 RCX: 0000000000000000
[   12.750284][  T116] RDX: dffffc0000000000 RSI: 1ffff11030338c01 RDI: ffff8881819c6648
[   12.750820][  T116] RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000001
[   12.751354][  T116] R10: 0000000000000000 R11: dffffc0000000000 R12: 0000000000000000
[   12.751889][  T116] R13: 0000000000000000 R14: 0000000000000001 R15: ffff8881819c6600
[   12.752435][  T116] FS:  0000000000000000(0000) GS:ffff8883a8f00000(0063) knlGS:00000000f7cec740
[   12.753057][  T116] CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
[   12.753537][  T116] CR2: 00000000ffc27bf8 CR3: 0000000139596000 CR4: 00000000000406f0
[   12.754112][  T116] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   12.754674][  T116] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[   12.755239][  T116] Call Trace:
[   12.755479][  T116]  <TASK>
[ 12.755686][ T116] ? die_addr (kbuild/src/consumer/arch/x86/kernel/dumpstack.c:421 kbuild/src/consumer/arch/x86/kernel/dumpstack.c:460) 
[ 12.755977][ T116] ? exc_general_protection (kbuild/src/consumer/arch/x86/kernel/traps.c:751 kbuild/src/consumer/arch/x86/kernel/traps.c:693) 
[ 12.756372][ T116] ? asm_exc_general_protection (kbuild/src/consumer/arch/x86/include/asm/idtentry.h:617) 
[ 12.756757][ T116] ? drm_mode_copy (kbuild/src/consumer/drivers/gpu/drm/drm_modes.c:1422) drm


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241009/202410091649.1353a717-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

