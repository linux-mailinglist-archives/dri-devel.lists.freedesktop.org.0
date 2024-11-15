Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CA99CF3E8
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 19:27:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5404110E2E7;
	Fri, 15 Nov 2024 18:27:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dI2V2zVR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BB9A10E065;
 Fri, 15 Nov 2024 18:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731695258; x=1763231258;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=dRyjHDdMguHKdM3cIrIW55eMkXfmmQNyKAAGM1/j5rA=;
 b=dI2V2zVRSg/NjLIMywFdLuvRYV+TMZKVApdcdVBps3CfIsFbqvZEtyrl
 7Fw5fpmMLPuRtrFJtkwG9TUCpHtT6EmgXvxYPwZQ8onP5VhYr2U3fbYF1
 sZOZYBWa/0WM29bgrcy6rKWQ/lnmLWXA2jUeYXCVl9q3OgDjqgBYvRSbn
 nEe/GuZCJUqG56qNmsmgVpdWQhrIIi2luEGudtnyV4QRPAgGHNHvxPcJs
 tRLBNivL0Ec9P98SbJg7P7IP5xKVWrrlgKPxC+6KSjtfM8rFx11kJLpGb
 QsGDsjvIDdBP2DhlTVjCxb+MPr4Sg1KWQUrgqg2nYaPIsgqOEC5uTFjNz g==;
X-CSE-ConnectionGUID: 9OCfdhOfQF2tff6cEaryWw==
X-CSE-MsgGUID: kFjJIf5cTH21m4xCbHNCag==
X-IronPort-AV: E=McAfee;i="6700,10204,11257"; a="35474745"
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="35474745"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 10:27:38 -0800
X-CSE-ConnectionGUID: SlQyEOS5QxO1xbjD+2OB8g==
X-CSE-MsgGUID: /Sfbf3pOQBWZQS8rXgOcUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="93076355"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2024 10:27:33 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 15 Nov 2024 10:27:29 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 15 Nov 2024 10:27:29 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 15 Nov 2024 10:27:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nvjdiXkeLm/aEXDiPtBhRKLOOpc5j5ypv7v0kv1hvrA9YaqZ+XxjfB9qV5YldxOQ6YAaU1RnFruzqJqO7PtpiggA1wOQCbPHDNvl9MZagdFPlaEytHHlrJOk/4OR8v+RkMHP614baHFfy7r3aXyzbWerpl6d6qffDHImfnO4q2DpT/x5VmrNhFNdj4fZQaCpL95aCR2JXCR+yexDvvitYhIFId90szNRQBlWWkQHN4DmjT0gj+MAzkASrfK+EhYQ82la32f6Mm5GaFGa0LQI6nVF/6ALtW33yD/xMiftAtFn5607oOVV1uzs3uixzx56nOfvbqt4pjI/bCBJ7k3x2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gvgQaCp3m3R7fp8k5P73NhyN+/2caCtfHJjC5WGmLyo=;
 b=BH7m20NQauIoIchBue36E+8mxERNq9SWaxyzl2+ryW/mQtV1MLYire+V0B2Ny8ESkbQh7hLdqHbD2GiWpm5ET1AsZxra5G43EjFwieIhhYAwB+pAIP+YopSdItF3fA5Ud93a9BMhgbncTR+sjBo+xgnSIWOf1SmMdmKpmSD1gge4mBqkWQvrwnzcZ+mz44vwsHNop2PuJe6VivpubeGdvW2jf6rZ7tMm/D3fkrKOqafDnZImy655zOblwRilXyIceNQBMB+XnVWOvvbTYKqjQno6yPZJbqXnGGsLIknyX5iIbw62IopAiY4D25qLDIZmtuZx7Cl1mqjV+HTBBd/ZEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DM4PR11MB7254.namprd11.prod.outlook.com (2603:10b6:8:10e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Fri, 15 Nov
 2024 18:27:26 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%3]) with mapi id 15.20.8158.017; Fri, 15 Nov 2024
 18:27:26 +0000
Date: Fri, 15 Nov 2024 10:27:59 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
CC: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, Simona Vetter
 <simona.vetter@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Huang Rui
 <ray.huang@amd.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <matthew.auld@intel.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v6 2/8] drm/ttm: Add ttm_bo_access
Message-ID: <ZzeSr5ut6GVEwSJY@lstrano-desk.jf.intel.com>
References: <8d181425-db3b-46b7-ae73-ae6ef149d185@amd.com>
 <ZzKJHxaMnWKQ5mzV@lstrano-desk.jf.intel.com>
 <31b16d78-708d-4f19-9b33-891e31be5480@gmail.com>
 <173141886970.132411.13400253861916730373@jlahtine-mobl.ger.corp.intel.com>
 <27f8bd540ac1f04daf8a7786f4ae7828017d061b.camel@linux.intel.com>
 <c62e5298-1ca6-4cd0-a558-3d2a91175fa0@amd.com>
 <d469ab3509a1b875ad0c44d01569675682d6c61c.camel@linux.intel.com>
 <6ab9e754-6f4a-48ec-b143-02585bc40291@amd.com>
 <5a16ef4ff06a530c52df7633833db19aaa15b33e.camel@linux.intel.com>
 <8d17a8a2-9a44-4f80-92b5-a8aa3efe6bf2@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8d17a8a2-9a44-4f80-92b5-a8aa3efe6bf2@amd.com>
X-ClientProxiedBy: MW4PR03CA0189.namprd03.prod.outlook.com
 (2603:10b6:303:b8::14) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DM4PR11MB7254:EE_
X-MS-Office365-Filtering-Correlation-Id: fcc2a28c-9c6f-4d33-adab-08dd05a327e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V2UrYjFpNEFlbHpEK0tGTVRhdmcxYmwwWndiTUZtNWVDam1SbVJWRVpZWk9U?=
 =?utf-8?B?dk1rMEZBZ3FWVVBFbTlNWU5FZ2xkR0Z3T0F5SnF5UlgrejBLdS85NFdhZjJt?=
 =?utf-8?B?Q2pzc0xlbzBJTW8zNE5QaFE2MXoySEsyYXdGMGh6akpyYlltbmtENEhDZUpB?=
 =?utf-8?B?bVBDb01Uc3FVSmNFNzhQVmQ5RFVaL2Vnd1d5RWdNQ1ZkWGZ0L1V6WGdZU2hP?=
 =?utf-8?B?VllTMUxabW9ZYlVyNDNJNjlWV2JqcW92dUNBdGhqSFcwaHA0eU9TQVlHbWZm?=
 =?utf-8?B?QkN6c0ZwdGpuMW52R1JCWlJ2NGFTY3BzU09pSHYvalppVEt6OEtaUHJGQ2pG?=
 =?utf-8?B?bHNvbENYeEF6bGJ1S0Ewb3FFSW4yVWlGSkxjU0NML1IrUU1IcXp3YW1PQWtR?=
 =?utf-8?B?MVpzVGdIZXZCT3NtUmhSOWorajl2SUJESUVXV2hyallnN05iZEd4dGhxZUVZ?=
 =?utf-8?B?SFpzWklyYkY1YnZJV2VVckZyQjZyQjVFT0MxMDVVb2dPTGNad3NWUm1CRFE3?=
 =?utf-8?B?NFl6WFlhMnpNTlFrSmZ3QTU3RzMrTDRzUHNCYTFodDJXOTcxd1FPV3pZM091?=
 =?utf-8?B?K2p4Y3dNMmJEeCtWMytLbTBYaWVNSWNhZkRlcGlnOWNtbGNqd0ROZTNsUXVP?=
 =?utf-8?B?eEpUV2RYeVNRU0VpV2JVY2Fua1ROUjFUczloempQOHlPVXBqb01HdjVNL3VO?=
 =?utf-8?B?V1ovVmxnOXlUeW5LRm1NT3hNbEZTNEJ0RWtDWjBqOVcrdHk5Rm8vbXJHUERN?=
 =?utf-8?B?Tmozd0NmNG9mQ3RUS2dmbThIU2dxZ1dwK3BoUHFCS3VyanhJdThmVXRhSzNp?=
 =?utf-8?B?RENOMUUxQmkwVjZMdkM0a090OGMzNUhMVEpDenlMOWpsRnF5NkZpRDVHTGlX?=
 =?utf-8?B?c2Q5SjJ5VndoeE41TnJTMFBDclREdUZ5ZVFYL1pTWmFVM00wRmFvM1FsUkgr?=
 =?utf-8?B?SzlZc3lTd1ZnbEJma1o2ZlhHT1diWnAyVDJIMVQxRzVrcHRyeXZob1M3V2to?=
 =?utf-8?B?VkZjYWp6VXQ5MzZQNkgzVm03SVVkTTR6cnVhY2RvWCt1TEZuWE52U0pVOUVF?=
 =?utf-8?B?SnFYWk5kbDFGNWRzUEUyVFdCQVNIb3FYVzE1dU1GbjNGaDdiM1A3MitQcVhI?=
 =?utf-8?B?L1I3TlRhTVdST0FMOXQzU1owQk9YNnByTks3dEkzazBmdWdWRVJWcEUvK1ZL?=
 =?utf-8?B?Y2xabHNJbkw1V1NxT0xCcmxsblg2dU9QZFYyVzFvaEJ4N24yVFdxTDNyRWFC?=
 =?utf-8?B?S2c3NW50a1A2dzRpRkpVQWVLTm16MGN5aFNlNFFlUUJYN2hHT25YRC9BY2pz?=
 =?utf-8?B?NE8wdkhhSUlsRDBFV0dOL0cxL0djajZ2dFl3c0ZWQmtOdUJML25sYnBHV1Ux?=
 =?utf-8?B?NHErVG5uc0ZsYUxKUjd0K2FFSDhUSXB2OE5VTzRYZlI4REwrY2l2M0dzSmlD?=
 =?utf-8?B?TlNtY1VqRmp1b2pTZ05ISGQ4S1VGVU1VM0RqV29CSXNQWjVwSmxFQnVhbklI?=
 =?utf-8?B?MUpyNmRsQVcwVFRXYjdWR3dmakhSbXk1SXpKbTJCdFFCN3BHenpLajZoQXBE?=
 =?utf-8?B?emZjWUNnS1prMGV6MzhzK2t5U1VoQ2RheUZyNStESzg0ZzZvemFLcy82VVdw?=
 =?utf-8?B?YjU5S3Zxc1Nvc05jYUFFaGc1bkQ3STBaMW5VTnFoWWpEenNHcDR3cWFDSnpq?=
 =?utf-8?B?a2p3Skt3NUc4VUtUTnY1d3c3WFU3cUhjci9MNmowZ2lmNFNVQXg0MCtnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rkd2eERtZGlpeHJDQ0tzRHBiaGFzdE5ZUml3RVdIR3grelhGVGo0ZFRFaFk5?=
 =?utf-8?B?VnZPVGtVbVZaRlBqOC8vL2pRaUhmMThSQklCekFSdE1xU1VmZnlJK3FhbTND?=
 =?utf-8?B?L3docEpxN2djV1lndTlHYm9GTEoxTS9WYmIxcnpZeTRIVUZ0SmRTUWJYRmda?=
 =?utf-8?B?elpheWRJY3RwTzhsdWxNdGtIMGNTN0kxdG9ZN2dtWkRCVi9tTzFVcFowNzlj?=
 =?utf-8?B?YU40eFNXSkxtZWVnMW14YmtiL2M0T09kS2pqbEJzMkxnYlRpNE1VelpiRTRF?=
 =?utf-8?B?ZkhWZWJaZHFqcEQwcVcrQkFDMDhVOGJzWnpqNnZ1VFg5WHVqdkpiRk5tdG5C?=
 =?utf-8?B?ckpmUlJJdURSNVN2QTVDV1lOS1hzZG40eHJ1R1VkMHBJZGNBaWJ1bDFjYWVP?=
 =?utf-8?B?OTJMUmIwMFM1Yzg3bHI3V2xGNWcxTDVuYm1FbkVnWnBubDNDcXJHQVJSM1Jj?=
 =?utf-8?B?VzNsYlZVblE5QjhSNzdyN3Y1TU9yRjVIQ2VTREVEK1VCdXhtdEFIZ2FmTE1h?=
 =?utf-8?B?UmMxbmhOL1Y5TGJOQ3NOWXk1ckQwbWlJV3lTdWY2NllJQy9RdHhBSDBNSWVY?=
 =?utf-8?B?bWtBUG5SWTJ2eGllc3RTSkN2akdLY3kvQkEydTIzRENlVmVzcFdMVHF5VGxZ?=
 =?utf-8?B?M3I3QTN5NS9wbW8wckp6Ty9HU0JrOVpmTFRUOWREMU1WbHhJa2R0RVR3MWU3?=
 =?utf-8?B?UUhWc1VSTkpTMEZCbHdhSXZPNE8xV1dheHJaWTYyb3VQeDZBd1lKSnNNWXJY?=
 =?utf-8?B?QjEraTdLZDRBRjBBbFJ0dFlTODFlRUx1RE5tMHlmWlRqS21VVmdFT3QwRElW?=
 =?utf-8?B?d0tzY3B3cGo4eDJ6Umo2dWxsdmcyUlJWdlVBZFlvVy9xZDU5Qk15SU9zZzRX?=
 =?utf-8?B?bnVwM1B0aG9hZWFCcTRKTEU1eHk3T0QvZnh6OTlSTitrTjI4V3hXa1dSbWJt?=
 =?utf-8?B?VGp1NnBRK29qOG80Nk1hYjZ4TFpGekhyOGpYYUVVSUFGTWs3eDg3R1VmSSty?=
 =?utf-8?B?WTFBUy9WRUREU2VDM0J4UmI1L1hVdnN1TkdITzZtTHptQWFTNGVXaVBwdW9v?=
 =?utf-8?B?SDhKcFpLTE0vWDNsbjFoRS8xc2ZiQ2VQSGx1TUpUY3d0VENYa2dpdlVrYmJv?=
 =?utf-8?B?OHBoN2h6UWhZT3ZjNnFKenBWUHJyb3Y3ZEdteDlEelNyMFRjTFMxaEw2WUNw?=
 =?utf-8?B?L0RDT2Z3Yjl1akpBZFR5VFlSSzE0YS80QTFsOGNrYVYwUkdBZ1pneDZ3VEov?=
 =?utf-8?B?eHlwSkRCMEpxaTV2NHV5QmtZOU01YXJ4YWEwTFUyQ3o3Y1ZUTGVTc3pYbm1l?=
 =?utf-8?B?YWZ6K053OG4vUlhmSnlPZjlWYUo0S1A2VVlGVVdPQ0FtQ2drZTRvTmd2QTNK?=
 =?utf-8?B?Y2JvenJCZTFYalFQc1dtOTQ3QTdTdXlEODFoL1BYUTcyU1pBWEJTdmtxYkhG?=
 =?utf-8?B?UGJMYldLbjk0L1F3QmhITEM0eDBsWGNOWkh1Y1BhMjEvNU1pbDIwbDN3NGU3?=
 =?utf-8?B?SVF1MS9GUkdubkZRNXVGRzlEYS80NjJEUENPU2kzWXJqR28yTmIzS081QjJn?=
 =?utf-8?B?K0p4ZVVTeTlCSm1RWXc2bGJZL3FCNENqcFY1b2IxazRnS1JOeFdwTmhiQW9Y?=
 =?utf-8?B?M0lJM2c5bWo0UTcvNUxKRUFSSFhMaDIyaDhsaExRdVJGQjk3bXlqb0VKQjJt?=
 =?utf-8?B?TzZvUHd1WUQzd0NHbng4KzlobFRYeFo4eUFHUXVsak1kdzFLZEt3dWlzMEcr?=
 =?utf-8?B?MHA0RVZhV0hZKzV2RitMbVJOYlZSaktyQXN5RzU1SkZudHF6aml4bzEwSFVX?=
 =?utf-8?B?MVEwWGN1TFdLcCtZUGJOYjlweXJhNm5hT2pCYXQ1OTdOdjJ5UE55RkRuWG9H?=
 =?utf-8?B?NngzUGxWSkZZdFVyblcwaytkcHdlTXVleWwwNytXZStVWFVJSzVtVHFpWHIw?=
 =?utf-8?B?ajQvSk1WSFdoNWp5MGhkK1BoZ3F0dmp0SmZYMHkydHdYV3FrUmFCdjFPUmIz?=
 =?utf-8?B?R1dOdWlncWNTMHpiVkdRNyt5QTA5TXVWeDZyUHZkSEg2U21vMHE0bUtiVnlj?=
 =?utf-8?B?NURoMnVLcTFncUw3LzJBZWtOelFVc1VWeFlZMUVFdnJmRzNZMTZHM1FqVEZY?=
 =?utf-8?B?ZVV1VHpGZWhvR1pNUGJ2TG42U2VDc2R5Z1VrV3NsQVdkWVVSZWVpbkI2cUht?=
 =?utf-8?B?TGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fcc2a28c-9c6f-4d33-adab-08dd05a327e0
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 18:27:26.5340 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qfsUSSvHqJAWMAPn1kzCclCtVMMN96rjtPftX7mr/zhA513juxz6oUuUAKD7Zfytmi9wh3cEgzT2eg3nyZWnUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7254
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

On Wed, Nov 13, 2024 at 12:42:35PM +0100, Christian König wrote:
> Am 13.11.24 um 11:44 schrieb Thomas Hellström:
> > On Wed, 2024-11-13 at 09:37 +0100, Christian König wrote:
> > > Am 12.11.24 um 17:33 schrieb Thomas Hellström:
> > > > [SNIP]
> > > > > > > This has been extensively discussed already, but was expected
> > > > > > > to
> > > > > > > really
> > > > > > > only be needed for low-on-memory scenarios. However it now
> > > > > > > seems
> > > > > > > like
> > > > > > > the need is much earlier due to the random userptr page
> > > > > > > joining
> > > > > > > by
> > > > > > > core
> > > > > > > mm.
> > > > > > Just to clarify here:
> > > > > > In Long-Running mode with recoverable pagefaults enabled we
> > > > > > don't
> > > > > > have
> > > > > > any preempt-fences, but rather just zap the PTEs pointing to
> > > > > > the
> > > > > > affected memory and flush TLB. So from a memory resource POW a
> > > > > > breakpoint should be safe, and no mmu notifier nor shrinker
> > > > > > will be
> > > > > > blocked.
> > > > > That sounds like a HMM based approach which would clearly work.
> > > > > 
> > > > > But where is that? I don't see any HMM based approach anywhere in
> > > > > the
> > > > > XE
> > > > > driver.
> > > > This is a mode that uses recoverable pagefaults to fault either
> > > > full
> > > > userptr or full bos, and used with DRM_XE_VM_CRATE_FLAG_FAULT_MODE.
> > > > (not SVM)!
> > > > 
> > > > userptrs in xe are bo-less, and using the vm's resv, but otherwise
> > > > using hmm similar to amdgpu: xe_hmm.c
> > > Yeah, I have seen that one.
> > > 
> > > > fault servicing:
> > > > xe_gt_pagefault.c
> > > > 
> > > > PTE zapping on eviction and notifier:
> > > > xe_vm_invalidate_vma(), xe_vm.c
> > > Ah, that was the stuff I was missing.
> > > 
> > > So the implementation in xe_preempt_fence.c is just for graphics
> > > submissions? That would make the whole thing much easier to handle.
> > Actually it's not, it's intended for long-running mode, but as a
> > consequence the debugger would be allowed only in fault mode.
> 
> Make sense, yes.
> 
> > > The only remaining question I can then see is if long running
> > > submissions with DRM_XE_VM_CRATE_FLAG_FAULT_MODE could potentially
> > > block
> > > graphics submissions without this flag from accessing the hardware?
> > Yes and no. We have a mechanism in place that allows either only fault
> > mode jobs or non-faulting jobs on the same, what we call "engine
> > group".
> > A pagefault on an engine group would block or hamper progress of other
> > jobs on that engine group.
> > 
> > So let's say a dma-fence job is submitted to an engine group that is
> > currently running a faulting job. We'd then need to switch mode of the
> > engine group and, in the exec ioctl we'd (explicitly without preempt-
> > fences) preempt the faulting job before submitting the dma-fence job
> > and publishing its fence. This preemption will incur a delay which is
> > typically the delay of servicing any outstanding pagefaults. It's not
> > ideal, but the best we can do, and it doesn't affect core memory
> > management nor does it affect migration blits.
> > 
> > In the debugger case, this delay could be long due to breakpoints, and
> > that's why enabling the debugger would sit behind a flag and not
> > something default (I think this was discussed earlier in the thread).
> > Still, core memory management would be unaffected, and also ofc the
> > migration blits are completely independent.
> 
> Yeah, that sounds totally sane to me.
> 

Nice, glad to see this part of the thread resolved.

Setting aside the peek/poke and FD PID duplication issues (which seem to
be part of a larger discussion, with Joonas as the point of contact for
that), we have another use case for this helper in my current series.

We use this interface to read a BO marked with a dumpable flag during a
GPU hang in our error capture code. This is an internal KMD feature, not
directly exposed to user space. Would adding this helper be acceptable
for this use case? I can add kernel indicating the current restrictions
of the helper (do not directly expose to user space) too if that would
help.

Matt

> Sorry for the noise then. I didn't realized that you have two separate modes
> of operation.
> 
> Going to reply on the other open questions separately.
> 
> Regards,
> Christian.
> 
> > 
> > /Thomas
> > 
> > > Thanks a lot for pointing this out,
> > > Christian.
> > > 
> > > > Thanks,
> > > > Thomas
> > > > 
> > > > > Regards,
> > > > > Christian.
> > > > > 
> > > > > > Nor will there be any jobs with published dma-fences depending
> > > > > > on
> > > > > > the
> > > > > > job blocked either temporarily by a pagefault or long-term by a
> > > > > > debugger breakpoint.
> > > > > > 
> > > > > > /Thomas
> > > > > > 
> > > > > > 
> > > > > > > If that is done and the memory pre-empt fence is serviced
> > > > > > > even
> > > > > > > for
> > > > > > > debuggable contexts, do you have further concerns with the
> > > > > > > presented
> > > > > > > approach
> > > > > > > from dma-buf and drm/sched perspective?
> > > > > > > 
> > > > > > > Regards, Joonas
> > > > > > > 
> > > > > > > > Regards,
> > > > > > > > Christian.
> > > > > > > > 
> > > > > > > > 
> > > > > > > >            This means that a breakpoint or core dump doesn't
> > > > > > > > halt
> > > > > > > > GPU
> > > > > > > > threads, but
> > > > > > > >            rather suspends them. E.g. all running wave data
> > > > > > > > is
> > > > > > > > collected into a state
> > > > > > > >            bag which can be restored later on.
> > > > > > > > 
> > > > > > > >            I was under the impression that those long
> > > > > > > > running
> > > > > > > > compute
> > > > > > > > threads do
> > > > > > > >            exactly that, but when the hardware can't switch
> > > > > > > > out
> > > > > > > > the
> > > > > > > > GPU thread/process
> > > > > > > >            while in a break then that isn't the case.
> > > > > > > > 
> > > > > > > >            As long as you don't find a way to avoid that
> > > > > > > > this
> > > > > > > > patch
> > > > > > > > set is a pretty
> > > > > > > >            clear NAK from my side as DMA-buf and TTM
> > > > > > > > maintainer.
> > > > > > > > 
> > > > > > > > 
> > > > > > > >        I believe this is addressed above.
> > > > > > > > 
> > > > > > > >        Matt
> > > > > > > > 
> > > > > > > > 
> > > > > > > >            What might work is to keep the submission on the
> > > > > > > > hardware
> > > > > > > > in the break state
> > > > > > > >            but forbid any memory access. This way you can
> > > > > > > > signal
> > > > > > > > your
> > > > > > > > preemption fence
> > > > > > > >            even when the hardware isn't made available.
> > > > > > > > 
> > > > > > > >            Before you continue XE setups a new pre-emption
> > > > > > > > fence
> > > > > > > > and
> > > > > > > > makes sure that
> > > > > > > >            all page tables etc... are up to date.
> > > > > > > > 
> > > > > > > >            Could be tricky to get this right if completion
> > > > > > > > fence
> > > > > > > > based
> > > > > > > > submissions are
> > > > > > > >            mixed in as well, but that gives you at least a
> > > > > > > > direction
> > > > > > > > you could
> > > > > > > >            potentially go.
> > > > > > > > 
> > > > > > > >            Regards,
> > > > > > > >            Christian.
> > > > > > > > 
> > > > > > > > 
> > > > > > > >                Regards, Joonas
> > > > > > > > 
> > > > > > > > 
> > > > > > > >                    Regards,
> > > > > > > >                    Christian.
> > > > > > > > 
> > > > > > > > 
> > > > > > > >                        Some wash-up thoughts from me below,
> > > > > > > > but
> > > > > > > > consider them fairly irrelevant
> > > > > > > >                        since I think the main driver for
> > > > > > > > these
> > > > > > > > big
> > > > > > > > questions here should be
> > > > > > > >                        gdb/userspace.
> > > > > > > > 
> > > > > > > > 
> > > > > > > >                            Quoting Christian König (2024-11-
> > > > > > > > 07
> > > > > > > > 11:44:33)
> > > > > > > > 
> > > > > > > >                                Am 06.11.24 um 18:00 schrieb
> > > > > > > > Matthew
> > > > > > > > Brost:
> > > > > > > > 
> > > > > > > >                                      [SNIP]
> > > > > > > > 
> > > > > > > >                                      This is not a generic
> > > > > > > > interface
> > > > > > > > that anyone can freely access. The same
> > > > > > > >                                      permissions used by
> > > > > > > > ptrace
> > > > > > > > are
> > > > > > > > checked when opening such an interface.
> > > > > > > >                                      See [1] [2].
> > > > > > > > 
> > > > > > > > [1]
> > > > > > > > https://patchwork.freedesktop.org/patch/617470/?series=136572&r
> > > > > > > > e
> > > > > > > > v=2
> > > > > > > > [2]
> > > > > > > > https://patchwork.freedesktop.org/patch/617471/?series=136572&r
> > > > > > > > e
> > > > > > > > v=2
> > > > > > > > 
> > > > > > > > 
> > > > > > > >                                Thanks a lot for those
> > > > > > > > pointers,
> > > > > > > > that
> > > > > > > > is exactly what I was looking for.
> > > > > > > > 
> > > > > > > >                                And yeah, it is what I
> > > > > > > > feared. You
> > > > > > > > are
> > > > > > > > re-implementing existing functionality,
> > > > > > > >                                but see below.
> > > > > > > > 
> > > > > > > >                            Could you elaborate on what this
> > > > > > > > "existing
> > > > > > > > functionality" exactly is?
> > > > > > > >                            I do not think this functionality
> > > > > > > > exists at
> > > > > > > > this time.
> > > > > > > > 
> > > > > > > >                            The EU debugging architecture for
> > > > > > > > Xe
> > > > > > > > specifically avoids the need for GDB
> > > > > > > >                            to attach with ptrace to the CPU
> > > > > > > > process or
> > > > > > > > interfere with the CPU process for
> > > > > > > >                            the debugging via parasitic
> > > > > > > > threads or
> > > > > > > > so.
> > > > > > > > 
> > > > > > > >                            Debugger connection is opened to
> > > > > > > > the
> > > > > > > > DRM
> > > > > > > > driver for given PID (which uses the
> > > > > > > >                            ptrace may access check for now)
> > > > > > > > after
> > > > > > > > which the all DRM client of that
> > > > > > > >                            PID are exposed to the debugger
> > > > > > > > process.
> > > > > > > > 
> > > > > > > >                            What we want to expose via that
> > > > > > > > debugger
> > > > > > > > connection is the ability for GDB to
> > > > > > > >                            read/write the different GPU VM
> > > > > > > > address
> > > > > > > > spaces (ppGTT for Intel GPUs) just like
> > > > > > > >                            the EU threads would see them.
> > > > > > > > Note
> > > > > > > > that
> > > > > > > > the layout of the ppGTT is
> > > > > > > >                            completely up to the userspace
> > > > > > > > driver
> > > > > > > > to
> > > > > > > > setup and is mostly only partially
> > > > > > > >                            equal to the CPU address space.
> > > > > > > > 
> > > > > > > >                            Specifically as part of
> > > > > > > > reading/writing the
> > > > > > > > ppGTT for debugging purposes,
> > > > > > > >                            there are deep flushes needed:
> > > > > > > > for
> > > > > > > > example
> > > > > > > > flushing instruction cache
> > > > > > > >                            when adding/removing breakpoints.
> > > > > > > > 
> > > > > > > >                            Maybe that will explain the
> > > > > > > > background. I
> > > > > > > > elaborate on this at the end some more.
> > > > > > > > 
> > > > > > > > 
> > > > > > > >                                              kmap/vmap are
> > > > > > > > used
> > > > > > > > everywhere in the DRM subsystem to access BOs, so I’m
> > > > > > > >                                              failing to see
> > > > > > > > the
> > > > > > > > problem with adding a simple helper based on existing
> > > > > > > >                                              code.
> > > > > > > > 
> > > > > > > >                                          What#s possible and
> > > > > > > > often
> > > > > > > > done is to do kmap/vmap if you need to implement a
> > > > > > > >                                          CPU copy for
> > > > > > > > scanout for
> > > > > > > > example or for copying/validating command buffers.
> > > > > > > >                                          But that usually
> > > > > > > > requires
> > > > > > > > accessing the whole BO and has separate security
> > > > > > > >                                          checks.
> > > > > > > > 
> > > > > > > >                                          When you want to
> > > > > > > > access
> > > > > > > > only
> > > > > > > > a few bytes of a BO that sounds massively like
> > > > > > > >                                          a peek/poke like
> > > > > > > > interface
> > > > > > > > and we have already rejected that more than once.
> > > > > > > >                                          There even used to
> > > > > > > > be
> > > > > > > > standardized GEM IOCTLs for that which have been
> > > > > > > >                                          removed by now.
> > > > > > > > 
> > > > > > > >                            Referring to the explanation at
> > > > > > > > top:
> > > > > > > > These
> > > > > > > > IOCTL are not for the debugging target
> > > > > > > >                            process to issue. The peek/poke
> > > > > > > > interface
> > > > > > > > is specifically for GDB only
> > > > > > > >                            to facilitate the emulation of
> > > > > > > > memory
> > > > > > > > reads/writes on the GPU address
> > > > > > > >                            space as they were done by EUs
> > > > > > > > themselves.
> > > > > > > > And to recap: for modifying
> > > > > > > >                            instructions for example
> > > > > > > > (add/remove
> > > > > > > > breakpoint), extra level of cache flushing is
> > > > > > > >                            needed which is not available to
> > > > > > > > regular
> > > > > > > > userspace.
> > > > > > > > 
> > > > > > > >                            I specifically discussed with
> > > > > > > > Sima on
> > > > > > > > the
> > > > > > > > difference before moving forward with this
> > > > > > > >                            design originally. If something
> > > > > > > > has
> > > > > > > > changed
> > > > > > > > since then, I'm of course happy to rediscuss.
> > > > > > > > 
> > > > > > > >                            However, if this code can't be
> > > > > > > > added,
> > > > > > > > not
> > > > > > > > sure how we would ever be able
> > > > > > > >                            to implement core dumps for GPU
> > > > > > > > threads/memory?
> > > > > > > > 
> > > > > > > > 
> > > > > > > >                                          If you need to
> > > > > > > > access
> > > > > > > > BOs
> > > > > > > > which are placed in not CPU accessible memory then
> > > > > > > >                                          implement the
> > > > > > > > access
> > > > > > > > callback
> > > > > > > > for ptrace, see amdgpu_ttm_access_memory for
> > > > > > > >                                          an example how to
> > > > > > > > do
> > > > > > > > this.
> > > > > > > > 
> > > > > > > >                            As also mentioned above, we don't
> > > > > > > > work
> > > > > > > > via
> > > > > > > > ptrace at all when it comes
> > > > > > > >                            to debugging the EUs. The only
> > > > > > > > thing
> > > > > > > > used
> > > > > > > > for now is the ptrace_may_access to
> > > > > > > >                            implement similar access
> > > > > > > > restrictions
> > > > > > > > as
> > > > > > > > ptrace has. This can be changed
> > > > > > > >                            to something else if needed.
> > > > > > > > 
> > > > > > > > 
> > > > > > > >                                      Ptrace access via
> > > > > > > > vm_operations_struct.access → ttm_bo_vm_access.
> > > > > > > > 
> > > > > > > >                                      This series renames
> > > > > > > > ttm_bo_vm_access to ttm_bo_access, with no code changes.
> > > > > > > > 
> > > > > > > >                                      The above function
> > > > > > > > accesses
> > > > > > > > a BO
> > > > > > > > via kmap if it is in SYSTEM / TT,
> > > > > > > >                                      which is existing code.
> > > > > > > > 
> > > > > > > >                                      This function is only
> > > > > > > > exposed to
> > > > > > > > user space via ptrace permissions.
> > > > > > > > 
> > > > > > > >                            Maybe this sentence is what
> > > > > > > > caused the
> > > > > > > > confusion.
> > > > > > > > 
> > > > > > > >                            Userspace is never exposed with
> > > > > > > > peek/poke
> > > > > > > > interface, only the debugger
> > > > > > > >                            connection which is its own FD.
> > > > > > > > 
> > > > > > > > 
> > > > > > > >                                      In this series, we
> > > > > > > > implement
> > > > > > > > a
> > > > > > > > function [3] similar to
> > > > > > > > amdgpu_ttm_access_memory for
> > > > > > > > the
> > > > > > > > TTM vfunc access_memory. What is
> > > > > > > >                                      missing is non-visible
> > > > > > > > CPU
> > > > > > > > memory
> > > > > > > > access, similar to
> > > > > > > > amdgpu_ttm_access_memory_sdma.
> > > > > > > > This will be addressed in a follow-up and
> > > > > > > >                                      was omitted in this
> > > > > > > > series
> > > > > > > > given
> > > > > > > > its complexity.
> > > > > > > > 
> > > > > > > >                                      So, this looks more or
> > > > > > > > less
> > > > > > > > identical to AMD's ptrace implementation,
> > > > > > > >                                      but in GPU address
> > > > > > > > space.
> > > > > > > > Again,
> > > > > > > > I fail to see what the problem is here.
> > > > > > > >                                      What am I missing?
> > > > > > > > 
> > > > > > > > 
> > > > > > > >                                The main question is why
> > > > > > > > can't you
> > > > > > > > use
> > > > > > > > the existing interfaces directly?
> > > > > > > > 
> > > > > > > >                            We're not working on the CPU
> > > > > > > > address
> > > > > > > > space
> > > > > > > > or BOs. We're working
> > > > > > > >                            strictly on the GPU address space
> > > > > > > > as
> > > > > > > > would
> > > > > > > > be seen by an EU thread if it
> > > > > > > >                            accessed address X.
> > > > > > > > 
> > > > > > > > 
> > > > > > > >                                Additional to the peek/poke
> > > > > > > > interface
> > > > > > > > of ptrace Linux has the pidfd_getfd
> > > > > > > >                                system call, see
> > > > > > > > here
> > > > > > > > https://man7.org/linux/man-pages/man2/pidfd_getfd.2.html.
> > > > > > > > 
> > > > > > > >                                The pidfd_getfd() allows to
> > > > > > > > dup()
> > > > > > > > the
> > > > > > > > render node file descriptor into your gdb
> > > > > > > >                                process. That in turn gives
> > > > > > > > you
> > > > > > > > all the
> > > > > > > > access you need from gdb, including
> > > > > > > >                                mapping BOs and command
> > > > > > > > submission
> > > > > > > > on
> > > > > > > > behalf of the application.
> > > > > > > > 
> > > > > > > >                            We're not operating on the CPU
> > > > > > > > address
> > > > > > > > space nor are we operating on BOs
> > > > > > > >                            (there is no concept of BO in the
> > > > > > > > EU
> > > > > > > > debug
> > > > > > > > interface). Each VMA in the VM
> > > > > > > >                            could come from anywhere, only
> > > > > > > > the
> > > > > > > > start
> > > > > > > > address and size matter. And
> > > > > > > >                            neither do we need to interfere
> > > > > > > > with
> > > > > > > > the
> > > > > > > > command submission of the
> > > > > > > >                            process under debug.
> > > > > > > > 
> > > > > > > > 
> > > > > > > >                                As far as I can see that
> > > > > > > > allows
> > > > > > > > for the
> > > > > > > > same functionality as the eudebug
> > > > > > > >                                interface, just without any
> > > > > > > > driver
> > > > > > > > specific code messing with ptrace
> > > > > > > >                                permissions and peek/poke
> > > > > > > > interfaces.
> > > > > > > > 
> > > > > > > >                                So the question is still why
> > > > > > > > do
> > > > > > > > you
> > > > > > > > need the whole eudebug interface in the
> > > > > > > >                                first place? I might be
> > > > > > > > missing
> > > > > > > > something, but that seems to be superfluous
> > > > > > > >                                from a high level view.
> > > > > > > > 
> > > > > > > >                            Recapping from above. It is to
> > > > > > > > allow
> > > > > > > > the
> > > > > > > > debugging of EU threads per DRM
> > > > > > > >                            client, completely independent of
> > > > > > > > the
> > > > > > > > CPU
> > > > > > > > process. If ptrace_may_acces
> > > > > > > >                            is the sore point, we could
> > > > > > > > consider
> > > > > > > > other
> > > > > > > > permission checks, too. There
> > > > > > > >                            is no other connection to ptrace
> > > > > > > > in
> > > > > > > > this
> > > > > > > > architecture as single
> > > > > > > >                            permission check to know if PID
> > > > > > > > is
> > > > > > > > fair
> > > > > > > > game to access by debugger
> > > > > > > >                            process.
> > > > > > > > 
> > > > > > > >                            Why no parasitic thread or
> > > > > > > > ptrace:
> > > > > > > > Going
> > > > > > > > forward, binding the EU debugging to
> > > > > > > >                            the DRM client would also pave
> > > > > > > > way for
> > > > > > > > being able to extend core kernel generated
> > > > > > > >                            core dump with each DRM client's
> > > > > > > > EU
> > > > > > > > thread/memory dump. We have similar
> > > > > > > >                            feature called "Offline core
> > > > > > > > dump"
> > > > > > > > enabled
> > > > > > > > in the downstream public
> > > > > > > >                            trees for i915, where we
> > > > > > > > currently
> > > > > > > > attach
> > > > > > > > the EU thread dump to i915 error state
> > > > > > > >                            and then later combine i915 error
> > > > > > > > state
> > > > > > > > with CPU core dump file with a
> > > > > > > >                            tool.
> > > > > > > > 
> > > > > > > >                            This is relatively little amount
> > > > > > > > of
> > > > > > > > extra
> > > > > > > > code, as this baseline series
> > > > > > > >                            already introduces GDB the
> > > > > > > > ability to
> > > > > > > > perform the necessary actions.
> > > > > > > >                            It's just the matter of kernel
> > > > > > > > driver
> > > > > > > > calling: "stop all threads", then
> > > > > > > >                            copying the memory map and memory
> > > > > > > > contents
> > > > > > > > for GPU threads, just like is
> > > > > > > >                            done for CPU threads.
> > > > > > > > 
> > > > > > > >                            With parasitic thread injection,
> > > > > > > > not
> > > > > > > > sure
> > > > > > > > if there is such way forward,
> > > > > > > >                            as it would seem to require to
> > > > > > > > inject
> > > > > > > > quite
> > > > > > > > abit more logic to core kernel?
> > > > > > > > 
> > > > > > > > 
> > > > > > > >                                It's true that the AMD KFD
> > > > > > > > part
> > > > > > > > has
> > > > > > > > still similar functionality, but that is
> > > > > > > >                                because of the broken KFD
> > > > > > > > design
> > > > > > > > of
> > > > > > > > tying driver state to the CPU process
> > > > > > > >                                (which makes it inaccessible
> > > > > > > > for
> > > > > > > > gdb
> > > > > > > > even with imported render node fd).
> > > > > > > > 
> > > > > > > >                                Both Sima and I (and
> > > > > > > > partially
> > > > > > > > Dave as
> > > > > > > > well) have pushed back on the KFD
> > > > > > > >                                approach. And the long term
> > > > > > > > plan
> > > > > > > > is to
> > > > > > > > get rid of such device driver specific
> > > > > > > >                                interface which re-implement
> > > > > > > > existing
> > > > > > > > functionality just differently.
> > > > > > > > 
> > > > > > > >                            Recapping, this series is not
> > > > > > > > adding
> > > > > > > > it
> > > > > > > > back. The debugger connection
> > > > > > > >                            is a separate FD from the DRM
> > > > > > > > one,
> > > > > > > > with
> > > > > > > > separate IOCTL set. We don't allow
> > > > > > > >                            the DRM FD any new operations
> > > > > > > > based on
> > > > > > > > ptrace is attached or not. We
> > > > > > > >                            don't ever do that check even.
> > > > > > > > 
> > > > > > > >                            We only restrict the opening of
> > > > > > > > the
> > > > > > > > debugger connection to given PID with
> > > > > > > >                            ptrace_may_access check for now.
> > > > > > > > That
> > > > > > > > can
> > > > > > > > be changed to something else,
> > > > > > > >                            if necessary.
> > > > > > > > 
> > > > > > > >                        Yeah I think unnecessarily tying gpu
> > > > > > > > processes
> > > > > > > > to cpu processes is a bad
> > > > > > > >                        thing, least because even today all
> > > > > > > > the
> > > > > > > > svm
> > > > > > > > discussions we have still hit
> > > > > > > >                        clear use-cases, where a 1:1 match is
> > > > > > > > not
> > > > > > > > wanted (like multiple gpu svm
> > > > > > > >                        sections with offsets). Not even
> > > > > > > > speaking
> > > > > > > > of
> > > > > > > > all the gpu usecases where
> > > > > > > >                        the gpu vm space is still entirely
> > > > > > > > independent
> > > > > > > > of the cpu side.
> > > > > > > > 
> > > > > > > >                        So that's why I think this entirely
> > > > > > > > separate
> > > > > > > > approach looks like the right
> > > > > > > >                        one, with ptrace_may_access as the
> > > > > > > > access
> > > > > > > > control check to make sure we
> > > > > > > >                        match ptrace on the cpu side.
> > > > > > > > 
> > > > > > > >                        But there's very obviously a bikeshed
> > > > > > > > to
> > > > > > > > be had
> > > > > > > > on what the actual uapi
> > > > > > > >                        should look like, especially how gdb
> > > > > > > > opens
> > > > > > > > up a
> > > > > > > > gpu debug access fd. But I
> > > > > > > >                        also think that's not much on drm to
> > > > > > > > decide,
> > > > > > > > but whatever gdb wants. And
> > > > > > > >                        then we aim for some consistency on
> > > > > > > > that
> > > > > > > > lookup/access control part
> > > > > > > >                        (ideally, I might be missing some
> > > > > > > > reasons
> > > > > > > > why
> > > > > > > > this is a bad idea) across
> > > > > > > >                        drm drivers.
> > > > > > > > 
> > > > > > > > 
> > > > > > > >                                So you need to have a really
> > > > > > > > really
> > > > > > > > good explanation why the eudebug interface
> > > > > > > >                                is actually necessary.
> > > > > > > > 
> > > > > > > >                            TL;DR The main point is to
> > > > > > > > decouple
> > > > > > > > the
> > > > > > > > debugging of the EU workloads from the
> > > > > > > >                            debugging of the CPU process.
> > > > > > > > This
> > > > > > > > avoids
> > > > > > > > the interference with the CPU process with
> > > > > > > >                            parasitic thread injection.
> > > > > > > > Further
> > > > > > > > this
> > > > > > > > also allows generating a core dump
> > > > > > > >                            without any GDB connected. There
> > > > > > > > are
> > > > > > > > also
> > > > > > > > many other smaller pros/cons
> > > > > > > >                            which can be discussed but for
> > > > > > > > the
> > > > > > > > context
> > > > > > > > of this patch, this is the
> > > > > > > >                            main one.
> > > > > > > > 
> > > > > > > >                            So unlike parasitic thread
> > > > > > > > injection,
> > > > > > > > we
> > > > > > > > don't unlock any special IOCTL for
> > > > > > > >                            the process under debug to be
> > > > > > > > performed by
> > > > > > > > the parasitic thread, but we
> > > > > > > >                            allow the minimal set of
> > > > > > > > operations to
> > > > > > > > be
> > > > > > > > performed by GDB as if those were
> > > > > > > >                            done on the EUs themselves.
> > > > > > > > 
> > > > > > > >                            One can think of it like the
> > > > > > > > minimal
> > > > > > > > subset
> > > > > > > > of ptrace but for EU threads,
> > > > > > > >                            not the CPU threads. And thus,
> > > > > > > > building on
> > > > > > > > this it's possible to extend
> > > > > > > >                            the core kernel generated core
> > > > > > > > dumps
> > > > > > > > with
> > > > > > > > DRM specific extension which
> > > > > > > >                            would contain the EU
> > > > > > > > thread/memory
> > > > > > > > dump.
> > > > > > > > 
> > > > > > > >                        It might be good to document (in that
> > > > > > > > debugging
> > > > > > > > doc patch probably) why
> > > > > > > >                        thread injection is not a great
> > > > > > > > option,
> > > > > > > > and why
> > > > > > > > the tradeoffs for
> > > > > > > >                        debugging are different than for for
> > > > > > > > checkpoint/restore, where with CRIU
> > > > > > > >                        we landed on doing most of this in
> > > > > > > > userspace,
> > > > > > > > and often requiring
> > > > > > > >                        injection threads to make it all
> > > > > > > > work.
> > > > > > > > 
> > > > > > > >                        Cheers, Sima
> > > > > > > > 
> > > > > > > > 
> > > > > > > >                            Regards, Joonas
> > > > > > > > 
> > > > > > > > 
> > > > > > > >                                Regards,
> > > > > > > >                                Christian.
> > > > > > > > 
> > > > > > > > 
> > > > > > > > 
> > > > > > > >                                      Matt
> > > > > > > > 
> > > > > > > > [3]
> > > > > > > > https://patchwork.freedesktop.org/patch/622520/?series=140200&r
> > > > > > > > e
> > > > > > > > v=6
> > > > > > > > 
> > > > > > > > 
> > > > > > > >                                          Regards,
> > > > > > > >                                          Christian.
> > > > > > > > 
> > > > > > > > 
> > > > > > > >                                              Matt
> > > > > > > > 
> > > > > > > > 
> > > > > > > >                                                  Regards,
> > > > > > > >                                                  Christian.
> > > > > > > > 
> > > > > > > > 
> > > > > > > > 
