Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB77C82FA9
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 02:06:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC66910E334;
	Tue, 25 Nov 2025 01:06:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gMGCiqge";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AD4F10E334;
 Tue, 25 Nov 2025 01:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764032802; x=1795568802;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FMeFEDmoctS89V/WvmwejXjQIBaqzODvwKi6ji/qIUk=;
 b=gMGCiqgexr3uGnTTO5V3Xp7mJWq3QW6ipgOOXFejowKjDPk/HNF1rr5g
 z6lgiUFzsxBtIPwoD5fk1CJqe9zPx7aakv5MNVfB43WIffpIUlBuQ79l7
 2yuZ8w290TSlzdq8tFKmk9PbwY47ecfmh5njrd5Oc4wOxVi77ZPybEP0J
 JYugTKAIZIopwkzc/aAHdmePGSnKTOPJ3wDJadCgdMjx/E5PGGPq4vXsU
 A8cIq8DcCEtZekVMZDaz/X85wyUWXE4zqcSRtzt1Qw+f2/1f8d4n87uT4
 zeTsefeb3dKE+h7yT27m0j6cZTmBnTnbYVEGd4nxaOwoybxOhaLQ1FnuN Q==;
X-CSE-ConnectionGUID: sNPc4NLrR0GOr3Zg2RbquQ==
X-CSE-MsgGUID: aY2Bo4hZRS2vOlGmJXI3mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="77519709"
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; d="scan'208";a="77519709"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 17:06:41 -0800
X-CSE-ConnectionGUID: Oj//N2xFRqW0YwNVvcmsWA==
X-CSE-MsgGUID: O3BSCoz6SO6PqYb9heszuw==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 17:06:40 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 24 Nov 2025 17:06:40 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 24 Nov 2025 17:06:40 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.36) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 24 Nov 2025 17:06:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X+JsfHS+3w0rmKZu/ySuhaCqHK0MA9XN1vLv7shvsZECp0KGc1LJwom+wHv7IH204ijOz3/eRzJxXq7cS23AkvkLmae+bxPSrdJBvo6O/OcYHfgubS6h2OIw2JQxNJGIQ+DzZvJFWgpNkc/1hpOfgGqa09PJ7owIi77O+CNgmfMHkKJ/Oe302hRjPb6DOvDtHkREaFds7mUPKJpPVDxAO9cY1LjjzCIaYimmpnRq1yTKpH3Oicm5PjQPQrqpYMs3BQvSlAiN/J67a1ToFqFU+rZnUDCMqvp6psh7iJrdFkmWcnflXnEALnRey1u4SvV2XmeuKcerl4nHcMrB04iOVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ysoztzb1hGlTr+//wRVT2DY1lw3v7+KUUAsACGF1bGs=;
 b=WMhE0fLPWKX31pMzLZJnOvC2Q7lvmDvNKLqffzK9M0lW1l27CmW03nrcabBVxK5eMKgPQS4aPPKWyJmgJ8Bp2dDT99vPUtVrf0ickpLjif8nDzgnU25dfWl8zADrXshZahjKw74U2JHKBvuf4XhmNgAiQ7nfcU2fRb5eL6+AeSXq2Iq9R4pdoR0YKIIq7Pgb9EWSsTLDA88rRvgQ1s5t5RMicXriGHmuamRpSkHoi+3S8zdq5YUhRmpw0hiIGDGwA30GktNnKPuqMMGdo4pm/l90scsPs+DWAKkHT6hSgqeTRRCQPTyBx7V6c8nPzVjondfytpMkBeLJ1lSNNftOtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by IA1PR11MB6441.namprd11.prod.outlook.com (2603:10b6:208:3aa::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.14; Tue, 25 Nov
 2025 01:06:36 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%7]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 01:06:36 +0000
Date: Mon, 24 Nov 2025 17:06:30 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <niranjana.vishwanathapura@intel.com>, <christian.koenig@amd.com>,
 <pstanner@redhat.com>, <dakr@kernel.org>
Subject: Re: [PATCH v4 8/8] drm/xe: Avoid toggling schedule state to check
 LRC timestamp in TDR
Message-ID: <aSUBFmZDeyfpyJd3@soc-5CG1426VCC.clients.intel.com>
References: <20251119224106.3733883-1-matthew.brost@intel.com>
 <20251119224106.3733883-9-matthew.brost@intel.com>
 <aR97CAIbMmgLQ0eJ@soc-5CG1426VCC.clients.intel.com>
 <aSDakpVxNmWmeY/d@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <aSDakpVxNmWmeY/d@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR03CA0169.namprd03.prod.outlook.com
 (2603:10b6:303:8d::24) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|IA1PR11MB6441:EE_
X-MS-Office365-Filtering-Correlation-Id: fcde5aaf-c121-4add-64bc-08de2bbee170
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QXJ2dGprWG44NlV6di92ZUk2enlkQThyL2FHOHp3M3E3MVo0bGlEWXV3RkNp?=
 =?utf-8?B?U1RZK3FBY1dFVlRtVTFHdDNhVXlhSE4rU1ljMkIvWlhwTXJmY2tsM3U5SDUr?=
 =?utf-8?B?WkFsbGVockQ4RlhtWi8xRk5pT2ZBYTEydXBONEFqaGJxSDE2T1N6djN0SnUr?=
 =?utf-8?B?c2dNRlcvWFdvT1dVNzhXNnMwV0U3VkZIT3NUZGt2eGtQakg5SjFwY1NHNksv?=
 =?utf-8?B?WURCQ0hCK0dOYWRYelBFWXlJQ0JFand2RkhrWFJmODJna0RTSGZOVlh1dGlP?=
 =?utf-8?B?NktUcVhHWmZhQnlZUG5ucmVIQ3NaMkxCc0hwTm5FK1YxWHN4K2hlZ0dCeXVR?=
 =?utf-8?B?UGNGNTVlNFBZMC9BdUY4MUpLK3QzcUs0aFAyZXBWaW9vTDBzTTRmbkhvcSs1?=
 =?utf-8?B?WkUzOWJJbDJiaktaTFpLcGgxbExUcXBZM2p0SThHY3dtbFFvUXVFdGpYdjhC?=
 =?utf-8?B?clBtZCtSWExtSGhwejI4RGVaYi9uQ0dCVmJhdlVUQXVnSWdhOXp4dklMMTd3?=
 =?utf-8?B?bFREMVdPRGhzeHBoZGxaOVBjVUsvWXZPeVJkcGV5dExVQlFRSUUvUDVKSGI1?=
 =?utf-8?B?c3VLVG81bGhJL2pTK0Y1RnltYjBjR2VEMTlGU3hsUmpxZG0vT1N3cXJYQkxn?=
 =?utf-8?B?NlFXemF5aDdIVDEyUjNpWThKb204dlVYTm82L1l0WFZLUCs1aUMzRzErd1Zq?=
 =?utf-8?B?NkhqeDd5K2h5cE9NbnVmUTQzRDhiUGtJYmZqRWlLNnl5QUc4TTF4cWtxMHZB?=
 =?utf-8?B?dUU3V3JlVVk3TDVkZUZNRmEvdEVCWGRjdnMyUElRRmVIdmZjTVBuTEtvQU9F?=
 =?utf-8?B?MWxMckNSMW1vRzRrZWpsTS85YVNZUG1keVZvbGlYbGhFcCtJQU04NHFhSEpt?=
 =?utf-8?B?cVNoL01VdHBaOVE1RlVnSEtaeFBNOHppWk04ODVXZzAxTy9BYjJBMzRnOHcx?=
 =?utf-8?B?VFFLQ3N1QWhXUTFqRFk1TVhwQmFTS3JCQllqNm1WUDhxNTZPeHIvZnVDVHB2?=
 =?utf-8?B?L09obUkwSmlKYjlBR0RVSlppN25BaEJKdjc4MEhnbkVoU1I3a1lVOGhJODJL?=
 =?utf-8?B?azR0M1JUMGZnOWJFbEhiNDAxdHNrN2ZEL1hjbW94UXFFZWJRV1NYbkZIZ0Fq?=
 =?utf-8?B?NzQxdDJrTUg5d0dJVmxmdXZyZXphMkNIZjZ1R1R5dUMxM0FUclIwZmw5VnNQ?=
 =?utf-8?B?bllhakwzVVVxRDNoZmkwK3prb3FHWkxmY2EvdGNxaUI4bkVPN3NuYVZyMW92?=
 =?utf-8?B?S3QrcUx1M3JrWjEvTmI5b0F1SHpTMmNZWCsySVcvZHluVlJDcm5QOFBrMzVI?=
 =?utf-8?B?NHBHSURHdlAzNXBtaE85dStycmI5TlBjY2l2UjV2OGpPaXliUkZTMnlDTHNO?=
 =?utf-8?B?Y1o4SXR5VitWZFRSTG9NRTZvbWt4aUl3VFJQOS8wZ1FBMlE0Yy9WWVJaaWZP?=
 =?utf-8?B?N0lIUHR6RnhOY25uQzA1b05YQWVyYXRybXlodUJOV3p5dGd3USs1RHNmT2hx?=
 =?utf-8?B?M0xYTU41M21JcjdqbVFzMktVbWlxRUJ0MTJJbUF1OC9GS1FHclJuUFZiVUFy?=
 =?utf-8?B?VGxRWkY1cDl3Z29DL2xJS3RoMGdOU2x6RGtJR1NnalhKU0hMdlYrZlF0TTJ5?=
 =?utf-8?B?ekkxNFJkamNXV3p6MFlrU1Zkam1SOFNxUE11WTBKOWJyRnZUZUx3Zi9NYTBJ?=
 =?utf-8?B?cGRORExOU2RmbytHTzh4YWgybGtaUEM2U3FkdGRVTnJJbjM2eVprUi9DVUJI?=
 =?utf-8?B?aVF2ckpyMWR2VHBnUExrcEwrTmhiNWZzc0JxZjd5bjlMUEZ3ODYvNXJHVDMy?=
 =?utf-8?B?UUxZVXNiRjJ6Yk9EWkFOanJlZzBHMnJ2Y011ZDFnRzNkZ3FXc29BNHNObi8r?=
 =?utf-8?B?N3ROTmtRbmhNWEV2c3kxZ214TW96em14aFJYaGRPTnZGM3VYdnpQTkRiaDhJ?=
 =?utf-8?Q?Nu8vhZu1d0QsD/snmsEOK1jVuvSh6nAW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RllJSHdncWJENjUwQUhRemdDSkZRTVRXS01XWGk0azE5ellUdHRqMG85YU5J?=
 =?utf-8?B?ZkNWNnNmWUdlQ1k5bDhaLzl4QWFxTDh1Wk5WQkczWmwxaU9ITU1rRVA3enRl?=
 =?utf-8?B?bGhxd2NlaHRwckxLb2NkMlRacVhqYTVRZkE3SUkwdHpWcmhvTnVKM2JuamdB?=
 =?utf-8?B?WktxLzlweWFseThJV25pbWt4cUZ0ZU1rNktLc09mT2p1QnptMnNtNW9wdmVh?=
 =?utf-8?B?b1hwNUhobGdNTzIzMm4xMFduQnFLaFAwRGRMQmNqOXNIYU1GRmNOcC9WcE85?=
 =?utf-8?B?R2RqRXhyTmpjWjY1Rjd4cDZZeTl3RUp2UXZLam1USUN4VWtXd3EzeWJGb2F3?=
 =?utf-8?B?MXJUOEVrVXF1QlNEZ1daVG5TK25RdlRLdGVCSGZBeVlzVXVIcndybC9TVVdG?=
 =?utf-8?B?UWxxZVdwSFEyVHJLTklINzB2cGhwU3lrcm10cHRXOG1DRGJGclN4KzhwT3Yy?=
 =?utf-8?B?TDNHRHRia3ZOeFdlYjNQdHJiK0Zjbm0zMmFUYmovTC96NVBOM253UnRMR05k?=
 =?utf-8?B?K1ZxcDBSRFVOYkV4ejJad3lxd2dtdmkwaVBndUtENDBFUmNNd1JTdFBHbzht?=
 =?utf-8?B?OXBrTkZ5ZWFWZFpON25CN2tGSUJJcHhwYjN3SmliSllUK3BlbGprOFZEMmx5?=
 =?utf-8?B?TldLWlJaYVUzTnRVdkpRTVhhMXU2MngvRVJaNnJDbVM3cDFnZFFZWkltSGhS?=
 =?utf-8?B?UVpJSGpuOFNMbUp0MWxOMUhIQ1ZHOGE2QkRBRVVnejZLSzZSV0lJcFNZYXg3?=
 =?utf-8?B?TFIra3YydWdCdTAxQVR2WlBranRFbWhLV3JqQTNXMEw2dEJQUm9tT2J0QkJH?=
 =?utf-8?B?bGZJdGNtbEJkd1dRM3gwQVlQd09ZY3B2Skd2Y1lWKy85ZXZGVWlRaWIzeTdC?=
 =?utf-8?B?QklYbXdtbmdEWWdHM0xNeXY2LzM0MkZiTnlUSUJ0Z1RCbU9rNzgvb3ZpdFNL?=
 =?utf-8?B?RnBWVm1GbGVuSVBENllqWEpIZEdINjlIYUQ1bDlpK0JJY1pQRldraU9xREpT?=
 =?utf-8?B?TFNaOHpyOTJrVVlnUkV0bDlLT0VsU2JJZjRudVB0d3NBeTZEbGhnU2E2YzdO?=
 =?utf-8?B?MGJrSVRzdVZnQVFkaE9UL21iNng4VjE3cnJzUVJiUlZRa1hvdnNRekZ0WFdv?=
 =?utf-8?B?QTdFaS93QVZCTzFkMDlJNGRrMU95cnQrY3dkWGpKTXdBejZkbFdGTW5ieUtW?=
 =?utf-8?B?cExYUXNYTlNFeVlFVTlnSDNyNktzVkJLQUtXcXBXeDRZaEZlSTlNV2JjSTEw?=
 =?utf-8?B?cm96RzVKeEdvN3JRNCsrZEJaMTFKT0k5MHZxakduWkQzTGtuMXh0NHJRVTZC?=
 =?utf-8?B?ZjRqMHlkZzdkVUhzYlliZ1EzM1lMWUJlUmhwcWtyVEFuVm9YNkUvTUFGMGZn?=
 =?utf-8?B?VDc0bFVJYWV2allPc3BjSjd1dnlKQW9tbUZMQmE2TEZKOUNKT3JmMFNqcW9p?=
 =?utf-8?B?NzMzdGtsN3ROS1BuSUJvOGtPL2NscDdiU21iNG1VUjFsNTFaUlJhbEFiN1Fr?=
 =?utf-8?B?NUkrVjJPa0FrK3Y3dFhnM29aRDRQSm92UDRQM3plRFVVVXRjSWpmWUhVRkxp?=
 =?utf-8?B?Z21vUko0MS9FUUVxeTdwVmFKT3FPY2FGWDNMRTByTGZEakFQRjJsc3ZTdU5i?=
 =?utf-8?B?THE3MFd6WnFTL09yTG1Kc3BKMlBqZXlqUmRsbEg2Tm9uOXBrUHFmd3JTUTJF?=
 =?utf-8?B?YmNHMXI2MzR2R3BXN2sxcWNSVGtKMEdkbUltVlBCTUhMS2JBNE1TREwwM2dM?=
 =?utf-8?B?bkZGT1lCcUNIZHBSeUFMcCt2Q05wNTc2REpzOEVYMUxPYmt3dTVCTTlZQ2JQ?=
 =?utf-8?B?aGpETlRyRE9oanNvYndnbnBJNGhFM2l1d1BQeUQ0ZDRwSmlhUnNPbVRPdU5B?=
 =?utf-8?B?VytPR004MTk2TW5rd2dmdFpDQUU3bGxLemgyRWFlbU9qcW1BdWk3SGNaeUND?=
 =?utf-8?B?aVE2RGwrRm9GSE1qOS8xcFM2c0o1Vkl4UGRNbkxEWWxrQ2tXOURJd2s1N2ZQ?=
 =?utf-8?B?Q0VpVVZIWUJGaU4yWGxFWmRKRExualEwRkdpUWpyUGtjZ1ZSQUhreGlKYktD?=
 =?utf-8?B?WHBvVDVNR0JsUmZsSkFkdElpSXMwNUd6a1FGdlpKdDBrSDVydkpZY2xsMHdm?=
 =?utf-8?B?YUhXNEVJdi9IcTFremRYOGhTbWxpVVM0ZVlUb0dIOW04OVJYYi9TNDg0OVNH?=
 =?utf-8?Q?bhR105OgxHarDta9ycbc+Oo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fcde5aaf-c121-4add-64bc-08de2bbee170
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 01:06:36.1948 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pczIweBYuggftmBp39W0xOM2EjKz6nNNiXmzM2FjEuOi0XIWNzZEqYO5OudCi+QVs1aaMyDiPMUlWGKXawRkiGbOXUTCxMMTfibu6FXvRxs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6441
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

On Fri, Nov 21, 2025 at 01:33:06PM -0800, Matthew Brost wrote:
>On Thu, Nov 20, 2025 at 12:33:12PM -0800, Umesh Nerlige Ramappa wrote:
>> On Wed, Nov 19, 2025 at 02:41:06PM -0800, Matthew Brost wrote:
>> > We now have proper infrastructure to accurately check the LRC timestamp
>> > without toggling the scheduling state for non-VFs. For VFs, it is still
>> > possible to get an inaccurate view if the context is on hardware. We
>> > guard against free-running contexts on VFs by banning jobs whose
>> > timestamps are not moving. In addition, VFs have a timeslice quantum
>> > that naturally triggers context switches when more than one VF is
>> > running, thus updating the LRC timestamp.
>> >
>> > For multi-queue, it is desirable to avoid scheduling toggling in the TDR
>> > because this scheduling state is shared among many queues. Furthermore,
>> > this change simplifies the GuC state machine. The trade-off for VF cases
>> > seems worthwhile.
>> >
>> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> > ---
>> > drivers/gpu/drm/xe/xe_guc_submit.c      | 100 ++++++------------------
>> > drivers/gpu/drm/xe/xe_sched_job.c       |   1 +
>> > drivers/gpu/drm/xe/xe_sched_job_types.h |   2 +
>> > 3 files changed, 28 insertions(+), 75 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> > index 1f2afad1766e..7404716e979f 100644
>> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> > @@ -68,9 +68,7 @@ exec_queue_to_guc(struct xe_exec_queue *q)
>> > #define EXEC_QUEUE_STATE_KILLED			(1 << 7)
>> > #define EXEC_QUEUE_STATE_WEDGED			(1 << 8)
>> > #define EXEC_QUEUE_STATE_BANNED			(1 << 9)
>> > -#define EXEC_QUEUE_STATE_CHECK_TIMEOUT		(1 << 10)
>> > -#define EXEC_QUEUE_STATE_PENDING_RESUME		(1 << 11)
>> > -#define EXEC_QUEUE_STATE_PENDING_TDR_EXIT	(1 << 12)
>> > +#define EXEC_QUEUE_STATE_PENDING_RESUME		(1 << 10)
>> >
>>
>> ... snip ...
>>
>> > static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue
>> > *q)
>> > {
>> > 	return (atomic_read(&q->guc->state) &
>> > @@ -996,7 +964,7 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
>> > 	u32 ctx_timestamp, ctx_job_timestamp;
>> > 	u32 timeout_ms = q->sched_props.job_timeout_ms;
>> > 	u32 diff;
>> > -	u64 running_time_ms;
>> > +	u64 running_time_ms, old_timestamp;
>> >
>> > 	if (!xe_sched_job_started(job)) {
>> > 		xe_gt_warn(gt, "Check job timeout: seqno=%u, lrc_seqno=%u, guc_id=%d, not started",
>> > @@ -1006,7 +974,17 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
>> > 		return xe_sched_invalidate_job(job, 2);
>> > 	}
>> >
>> > -	ctx_timestamp = lower_32_bits(xe_lrc_ctx_timestamp(q->lrc[0]));
>> > +	ctx_timestamp = lower_32_bits(xe_lrc_update_timestamp(q->lrc[0],
>> > +							      &old_timestamp));
>>
>> Reg: xe_lrc_update_timestamp()
>>
>> The way context utilization is using this helper is to accumulate the 'new -
>> old' values each time this function is called. In the below example, context
>> utilization will loose some ticks.
>>
>> Example:
>>
>> 1. This code calls xe_lrc_update_timestamp() to sample the timestamp for TDR
>> purposes. Say context/job is running, then the lrc->ctx_timestamp is updated
>> (moved forward).
>>
>> 2. The context utilization code calls xe_lrc_update_timestamp(). Within this
>> helper
>> - old_ts is sampled as lrc->ctx_timestamp
>> - new_ts is calculated based on whether the job/context is active
>> - lrc->ctx_timestamp is updated to the new value.
>>
>> The result is that we lost one chunk of utilization because of the previous
>> call from the TDR path. I think some refactor would be needed to fix that.
>>
>> The other comment you already mentioned offline is locking, which I think we
>> should add to protect lrc->ctx_timestamp. I don't know if a refactor will
>> avoid the lock though.
>>
>
>I agree with you analysis here - thanks for the help.
>
>How about - we extract the following code from
>xe_exec_queue_update_run_ticks into helper that also returns the current
>timestamp and is also protected by an queue spin lock:
>
>         new_ts = xe_lrc_update_timestamp(lrc, &old_ts);
>         q->xef->run_ticks[q->class] += (new_ts - old_ts) * q->width;

I was thinking something like below.

/**
  * xe_lrc_timestamp() - Current ctx timestamp
  * @lrc: Pointer to the lrc.
  *
  * Return latest ctx timestamp.
  *
  * Returns: New ctx timestamp value
  */
u64 xe_lrc_timestamp(struct xe_lrc *lrc)
{
         u64 lrc_ts, reg_ts, new_ts;
         u32 engine_id;

         lrc_ts = xe_lrc_ctx_timestamp(lrc);
         /* CTX_TIMESTAMP mmio read is invalid on VF, so return the LRC value */
         if (IS_SRIOV_VF(lrc_to_xe(lrc))) {
                 new_ts = lrc_ts;
                 goto done;
         }

         if (lrc_ts == CONTEXT_ACTIVE) {
                 engine_id = xe_lrc_engine_id(lrc);
                 if (!get_ctx_timestamp(lrc, engine_id, &reg_ts))
                         new_ts = reg_ts;

                 /* read lrc again to ensure context is still active */
                 lrc_ts = xe_lrc_ctx_timestamp(lrc);
         }

         /*
          * If context switched out, just use the lrc_ts. Note that this needs to
          * be a separate if condition.
          */
         if (lrc_ts != CONTEXT_ACTIVE)
                 new_ts = lrc_ts;

done:
         return new_ts;
}

/**
  * xe_lrc_update_timestamp() - Update ctx timestamp
  * @lrc: Pointer to the lrc.
  * @old_ts: Old timestamp value
  *
  * Populate @old_ts current saved ctx timestamp, read new ctx timestamp and
  * update saved value. With support for active contexts, the calculation may be
  * slightly racy, so follow a read-again logic to ensure that the context is
  * still active before returning the right timestamp.
  *
  * Returns: New ctx timestamp value
  */
u64 xe_lrc_update_timestamp(struct xe_lrc *lrc, u64 *old_ts)
{
         *old_ts = lrc->ctx_timestamp;
         lrc->ctx_timestamp = xe_lrc_timestamp(lrc);

         trace_xe_lrc_update_timestamp(lrc, *old_ts);

         return lrc->ctx_timestamp;
}

TDR logic could just use xe_lrc_timestamp() since it does not care about 
old_ts anyways. We could avoid the lock since xe_lrc_update_timestamp() 
is the only place where lrc->ctx_timestamp gets updated.

Thanks,
Umesh

>
>It harmless if the TDR also updates run_ticks when it samples the LRC
>timestamp, right? Also the helper just skips run_ticks if q->xef is
>NULL.
>
>Matt
>
>> Thanks,
>> Umesh
>>
>> > +	if (ctx_timestamp == job->sample_timestamp) {
>> > +		xe_gt_warn(gt, "Check job timeout: seqno=%u, lrc_seqno=%u, guc_id=%d, timestamp stuck",
>> > +			   xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
>> > +			   q->guc->id);
>> > +
>> > +		return xe_sched_invalidate_job(job, 2);
>> > +	}
>> > +
>> > +	job->sample_timestamp = ctx_timestamp;
>> > 	ctx_job_timestamp = xe_lrc_ctx_job_timestamp(q->lrc[0]);
>> >
>> > 	/*
>> > @@ -1135,16 +1113,17 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>> > 	}
>> >
>>
>>
>> ... snip ...
>>
>> > diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h
>> > b/drivers/gpu/drm/xe/xe_sched_job_types.h
>> > index d26612abb4ca..ad5eee8a8cdb 100644
>> > --- a/drivers/gpu/drm/xe/xe_sched_job_types.h
>> > +++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
>> > @@ -59,6 +59,8 @@ struct xe_sched_job {
>> > 	u32 lrc_seqno;
>> > 	/** @migrate_flush_flags: Additional flush flags for migration jobs */
>> > 	u32 migrate_flush_flags;
> > >+	/** @sample_timestamp: Sampling of job timestamp in TDR */
>> > +	u64 sample_timestamp;
>> > 	/** @ring_ops_flush_tlb: The ring ops need to flush TLB before payload. */
>> > 	bool ring_ops_flush_tlb;
>> > 	/** @ggtt: mapped in ggtt. */
>> > --
>> > 2.34.1
>> >
