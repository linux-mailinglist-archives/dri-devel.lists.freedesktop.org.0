Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35658A4906A
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 05:35:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C3410EBEE;
	Fri, 28 Feb 2025 04:35:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VTfZt6Iv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1808310EBEE;
 Fri, 28 Feb 2025 04:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740717338; x=1772253338;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=A64QSBdp4y8h9o0Q3kdLrI3A15xbFdnNb4KuGKN5CLs=;
 b=VTfZt6IvV13xYeE+WP6PsptvV0kwUJ8jlzEe/hBx2JVUqXKj85bJ6Ayp
 bcIU39WEhUkPRg/VvDBzkiGytglZpNeXaESZDHQ1v1ZQyuVRvbIgKHnjm
 304nMj3fUD7/y3H82HEjWW0WpHRfIw9D2mLOZ5C6AmN6GCSR6wX9Cr5ZS
 gOKSOPm6Hsbos06tuQS98vv6cZP/y4TXgQsK4CGjW8820qtQjVy2oclCb
 mSCYYuAPL409GSopH7A6/j1eoTl9aJABqdQl1fJD+clfp4tcNdhaAphy7
 V/KgUqMyfrCI3OwGGCCRxGCRxZfWYaAcQEee/NCmTb93W82p33ZJ00W3T Q==;
X-CSE-ConnectionGUID: WLtQtW14Q6OfxgN/MBPofw==
X-CSE-MsgGUID: 5r73cpueTfCKCN2N1hvV0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="41552430"
X-IronPort-AV: E=Sophos;i="6.13,321,1732608000"; d="scan'208";a="41552430"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 20:35:36 -0800
X-CSE-ConnectionGUID: GjaurEhjSlOFUUVs/GTclw==
X-CSE-MsgGUID: MPSRcN+zSAanEObH0nUgtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,321,1732608000"; d="scan'208";a="117720979"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 20:35:35 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 27 Feb 2025 20:35:35 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 27 Feb 2025 20:35:35 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Feb 2025 20:35:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xbJuStmriqqorVbCRtmBmk/atSFCk9nDf35ju+l+f7Jlmbg71w2OCPNSg0/N3HMShnvqJTIsd1doBaYpQ0oWWiLY2nPlAODor520WpdaLcfaEHc58EIemOQZf8+a75oVzHBbDeCoTv3ai+vesF418ZpA3VLvyDSr8YYp2A8ar9VA4PcMLHxUeoXKh3fZvmWCMicnc8aLHDQH7czlyNfZ4DUsyHl6IIXcyCuJPG0FZXeOCKu1IkP4LVa94PYk8RuOsPqpAiGg7TvgWrv1OhXf73E3nzn3B+Nb/Ao8lVossdOpApZQ4grIQDVO567Djns8hWyjir26OmDi+20zW+2F5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t6yN3hh3+qFthi5AL09y0cIhXMPqNsb7Pnf6ZK3CQqg=;
 b=JRNuVr3M2n4KP38KthtFc80KOuuS+z9aAia8GG9v8bXklIod/5kq2PKRHnHa9WNnsIXuLfCLeFmPF2dk7O5TF1O198msLx66K1l6nhNriSx0YRSEzchTt8rsbC8r9g7guvKdg920VldvYvNzOY8hda/LRcvwmHtxS2fFSpFVnNJD84CviE5QTLaLFA38DrccRkz0yDxuhZk2758w+LC+sC0A/Fim5l21fP0Dp71/0Xn5F0Bl34cyAVPupIkSZHa3YYN/Ru4IdcjzYu6cAigF74sBMFq+bZOZmWqIIBsphzWeo9xTaRAJgicyka+CvwedIBdM7qU0VEnZgR8WyctxUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Fri, 28 Feb
 2025 04:35:31 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8489.021; Fri, 28 Feb 2025
 04:35:31 +0000
Date: Thu, 27 Feb 2025 20:36:35 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Alistair Popple <apopple@nvidia.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <airlied@gmail.com>,
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v6 32/32] drm/doc: gpusvm: Add GPU SVM documentation
Message-ID: <Z8E9U7u8uV8rOlTO@lstrano-desk.jf.intel.com>
References: <20250225044311.3178695-1-matthew.brost@intel.com>
 <20250225044311.3178695-33-matthew.brost@intel.com>
 <cnt7o3wvgv37cfxsdothxv6agwi7nkqfqn37mafsyhl64h4lnv@rw7rbaha3au4>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cnt7o3wvgv37cfxsdothxv6agwi7nkqfqn37mafsyhl64h4lnv@rw7rbaha3au4>
X-ClientProxiedBy: MW4PR04CA0038.namprd04.prod.outlook.com
 (2603:10b6:303:6a::13) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB7605:EE_
X-MS-Office365-Filtering-Correlation-Id: e8773820-4510-4a83-36e7-08dd57b155a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SzJidlRPcm1HS3l0ZTdseE9JenV6OWtZR3FHdFRkdkdTM3B5Q2dxS3AwaWVX?=
 =?utf-8?B?S0o0SGVKdnFNRGFRcHJQRlZlZkRiS1ZaOWZKbmFNQzFneDNWTkI4NGhRZTBG?=
 =?utf-8?B?dFU2clovZ2doQXdHZEZsdFFZaGQvNDExWGtlVmN5VmRPMFRnTGlyV2VQWHMw?=
 =?utf-8?B?RjJ6c0VaV3p5L1JsaEFaLzN2dHllc0oyRFhlc3YrNzF2MU1HQVA1U0xXd0R4?=
 =?utf-8?B?bGdsV3lkbXVRREh5S2RsTFFMeDJCWUd3RVNNNlVqbThKeUVWNFdKM3BlNjBh?=
 =?utf-8?B?ZFlZVkpFZUg4b0JBYmZmcFdtV1Z5NHBSVTNJRWNkcmNURWNjMGdZTEloTEdN?=
 =?utf-8?B?VjZNVldoc1dWSEloM1lwSlB2T2dqblZTS3pvamJ5UHBTSHlTdW4vWjUrYVBi?=
 =?utf-8?B?VHZ0MER2MUpTWUEwV2xMRFhZbDVnQTYxdmFHbHl4WU9BMWhCRW81TnpITDgv?=
 =?utf-8?B?YzZrL1h4N2V5eW9GMmk1TjhaUXBaQU9RdHdCTUQyVnpzUEptZWpRT2cvY3pz?=
 =?utf-8?B?dkdTdWFsSWlIM0dpZ3hXOTU4akgwS1Byd2p0djdkS09pcnVVQTdwQUxBZHZO?=
 =?utf-8?B?WVFNR2xiekxUSXlXSUVIVkdNaXZJYU5NVWZVdmdGSjFLMDkzVmZOWXhBVEYv?=
 =?utf-8?B?U1V1WklGUWRlM2djWklWV3ZGZmdIeThXVmJzUkFvaTR6WkgrMlA5MlJEUk05?=
 =?utf-8?B?SWQ0Snp1dm45bEFwakVwSEpLa2Zsd0tvbUhaT1R5WHMwRk1RTjhVUVJsSjRE?=
 =?utf-8?B?U0xrVU5ob0l0aFVSekQzQ1hrSEhKeFp2RldXc25xbzRSMWpreXBKL3kzZEhG?=
 =?utf-8?B?TENVdXlySUlpRmlGQWlkVnVLU2FnTGJsSWtZME5LTXUxL2lCZUlKWGxkMktY?=
 =?utf-8?B?aytvbzFobzZjTzlEUGJZczNKMm42Y1l6Qmp3cUQzd0ZFaGJjcm1ObUN4dWtx?=
 =?utf-8?B?RjZ5UFlrSVpwNVNyMkR6emNEM1NtY2J0NytJc3pyRmUrNDAzUitNWDBaYUI5?=
 =?utf-8?B?alAvaW9hVnZYT2pWbjlaQTUwVUhFZ1JvVUVJOE9Zd0x5anJpeXoydzh2WFhk?=
 =?utf-8?B?dEdpSVFIRFIxSTRzOFNGa0doZkxaa0d2anhQR1lwaHV5YVRONUVkbFpLZXFP?=
 =?utf-8?B?YVpWNGhESGlFYy9lNno1OTluNUVScGMrdDZubkU2OUxTMWw4cS8vdytqMlNR?=
 =?utf-8?B?MFA0SWRIUW1YbnR6Wlp1R2lHWjcxam1lWGs0TXo4U0tQT1RLa2F0NjBqbUxi?=
 =?utf-8?B?OHIrcGw0Y3VucUNwNkpzL0FuZndEY09KcjhDek9UcFcrQ3Mva01GTnpSMDhn?=
 =?utf-8?B?WjB1K2xoQzZ6MTBVQnJVY2VTMjVyWHR2eDFHak9VZzFBSWlocjBTaWFMTTIx?=
 =?utf-8?B?UUZ2NElIQVloS1cwUU5ocVduT2FyTXQ1Z01KbXFtblZvYUVpV1VZV3AyWWxE?=
 =?utf-8?B?Wi9nWlZhWlRvaG5XWFpsTG11UEU4OHlhN3JjOUQ0cjg0Zk5GZUVWRFVKMkZ6?=
 =?utf-8?B?QTVlNTBzdWFndEV5SDloMUUzTUtqeDV1eEwvdnA5a2YzcWlHb2M2YWRHaFk1?=
 =?utf-8?B?dkRSbUo4NHFieHBFTlluVVZPSmNabllkMHpMSksyUUdOdkhVSTdETTU2UFp4?=
 =?utf-8?B?SUxnKzdXS25OTjhnekxDdkt1S3JWcWMrVmJ1TGFYeWY3dHN1Q3p6TVpjdE1D?=
 =?utf-8?B?cmNjVHJERmdvK3RWeUs3SFNOQjQzRGlRWFBSY2V4UnIzWFIzbXh1bUJiV3JE?=
 =?utf-8?B?eGJxU3QxMmNHdUtIdVROSzgzR3RDaFhSWVoyV01QdjlaZHNMNEVnc1RWVjBD?=
 =?utf-8?B?aFBXeVdZYkttaVJhUW9TUm0xdHM3TlVoNDQ0UUVNOHZMeFBFSXFYSzJWQVlQ?=
 =?utf-8?Q?0W0QOm/x+HAn0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnIwbWZQSWZGdzFxNjlLQ1Blako3YTQ1NGJ5S1lBSXkrL09DMkpCTW41d3pF?=
 =?utf-8?B?aDh0ZkdkQitsWU5OSGRxYTRmWkc4TVg0YWh1ZEp5Wi9lNFlaSW9lZ3ROWVVn?=
 =?utf-8?B?eFdJOXRSSmVwc3prNFVtVEM4TWprbFo3ZXRIR0ZrQnl6a2xucHV1TTh0VXdX?=
 =?utf-8?B?NFF2QWpxUzlMTWxOc1JuY2xPd01zTWcrR0JWNVM1aHhtTE56cGpjQzdkNnRN?=
 =?utf-8?B?dllmdDAxUGlLL1llaEZ5NGdONHdNZkZncFpKYXJOSzJncWJlTGtKVHpqNFor?=
 =?utf-8?B?UEg4bGM3d0EvdktIVitDdDlqalF2OHVUVmNKMGd6VEZ0S3Rhdlphd1AzS1o2?=
 =?utf-8?B?TXVwZ21xUXhHOE1TWG5MZFQrWUI4T2hRWkdWMWlkaEVLL05WMTlOZlFtMm1q?=
 =?utf-8?B?U010bXorOXZzcmx6UmZ1cURUaTdacCtIYk8vTUZpNWRlaDBMdkJOVGF1ZDNU?=
 =?utf-8?B?a1pXM0hhVVFsOEliMnRjS3E0WHZNUWpmR0NVUFozWmhGRnJ1VkFGemphTjZq?=
 =?utf-8?B?NkdYc24yVW9QcGtIVHJ2ZWVYcjlLdHRnV29CVHFuWnJsVlpkcEIxZmJpdStp?=
 =?utf-8?B?dlBYYzFwdkRKMm9EejMwK3ZJMDZCT0pGU2Y5TTFDelMrb0JYMGh0aXo0THp0?=
 =?utf-8?B?cFR4NTY3YTJoQ3pHdTB4MnFSY1huOHJqdG5tQUY0SXJJZGdvdysvK1h6UFJa?=
 =?utf-8?B?T3RpUGc0aTc0ajVYNGVmZ3laV240Y0pYcENRWWQ5VWhwRTQxT252R0VINTZV?=
 =?utf-8?B?YWwxcUtQM3krazh4SDQ5VGttK0cxdjM4UU9iR21uYjZwQUVmbEExUlZsRjZl?=
 =?utf-8?B?a25FSFQwelNRSHRXR1A2eXJFMnRoQmQvQTI0YU9aQVVuRTZrTHE1U0c3bkRx?=
 =?utf-8?B?d1VMR3JBWEFaNmZiWGhEOXoxa1pBRHBUUTh3akhrK1hlM0xjV216T2gxeGFk?=
 =?utf-8?B?a0FyTnRCSkFudHZYSEtuR003QVZzbkk3dkI2TzB5WjBWZHpDeXVqT3JBQlo3?=
 =?utf-8?B?enFicEg1M1FNaXVCM1B1Y01vNFRPUndSaG5QeisyUFNRTHR4Zzhtcml6eFYw?=
 =?utf-8?B?VVl1dDFMV1cwdkI1dy93M0M0T2dGdnRoWVBMZnllTjROWFI2UTRRQlA2VmYw?=
 =?utf-8?B?SDJOMzVUWjVUUU84d1AzcVFIM2tDU3pxV3VySzd0SVY0Wll0a2MybEM2TUdW?=
 =?utf-8?B?cGtHRzUyclNwM1o0M0VhQ1FxVFhNRktTcW0rUVYzTkx5L01rbHRIUnF1eHhG?=
 =?utf-8?B?N2lZZ2JjQ3BBak4zNzd3VU5KNFBFRS9NUGJxSDZFMTgyeWg4SjFneHRtNFFk?=
 =?utf-8?B?c05vOGVRV0ZWQllEUS9pNDl3OVFIbzBFU0p2OUIvUEpPMjhMMDNjUmNqNFRa?=
 =?utf-8?B?Q2dNaXdMWHRZVm1ReE1HMzNJNlFyYm1UemJIZThYa1ErK1YrZVo3cS9JVGpZ?=
 =?utf-8?B?Znh3YktsWVRkNGR5M3NqRzRweGh1QnZMbzJnR1lTUzVZV2VLaEkySy8wRVBF?=
 =?utf-8?B?RG1qVWlLQzJpYXVKVHhEd0RuME1iZklmdk5nZEM5cUpNVE11WFNSbHg1TVhL?=
 =?utf-8?B?M21CNWk1T2FrazNmZDNuMU9Ub21RK0dDK1ZISmNmUVRZcEZJTlhLcWpKb0ww?=
 =?utf-8?B?MEU5VFZVZGVxcUNIVThXU3ZrRDlodFZiUlBiM2l4TXpKMzdKTmp4NGYvOXBp?=
 =?utf-8?B?VjNKamJKOTJrUXpZUUhLT0dKT3haZDZqamZPQkdVZG41YUY0TVJ2d2xnMTlo?=
 =?utf-8?B?UjUraWlXNDJNWEhQTkVPQkRuekNQa2x6TFlwN2pYdGthNnFYZVFLSmY5R0ZD?=
 =?utf-8?B?bTgzMGZjaHdjT2JzYXlHa1lGcHhuaXJjRWZJa3hYQjcyMVMzUGMvazNPb3hM?=
 =?utf-8?B?aHpKMFN1ejYrT1FWUEFkb25vVm1yVlRSMjRnZ3EwdXZqUlRjaVFwaHN2bHJQ?=
 =?utf-8?B?YlIxTHZmR3VnVmNZMGdFaCtYeUdoSEx4TGQxTDcwMkxsandSZ01EcUVzQTN0?=
 =?utf-8?B?UmExR1hEU0NvRWNWT09Xdzk4Tm81VXZ2M0tTU2Z1ckxyZklMWStIcTh1SlJw?=
 =?utf-8?B?Qlo1bmFNSHQxS3A1QytsbmwzUzg3ekMySmVLTnlJTXNucklBNWwrcUI4L3BU?=
 =?utf-8?B?N2ZrbWF3ZDRyMzVFVW9IL0ZkRzFkUmhER2NLMmJzaEFuUWJ5UEJ3WlVpc2V5?=
 =?utf-8?B?OGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e8773820-4510-4a83-36e7-08dd57b155a7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 04:35:31.5659 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kvOatpKJufCU9rqZe4xgaoOTzfbzVjegJq7l6rstafgKoL8gigdRTdQFxQRmJ/DXmINKoj2C6IQGj59hNM5m0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7605
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

On Fri, Feb 28, 2025 at 01:34:42PM +1100, Alistair Popple wrote:
> On Mon, Feb 24, 2025 at 08:43:11PM -0800, Matthew Brost wrote:
> > Add documentation for agree upon GPU SVM design principles, current
> > status, and future plans.
> 
> Thanks for writing this up. In general I didn't see anything too controversial
> but added a couple of comments below.
> 
> > 
> > v4:
> >  - Address Thomas's feedback
> > v5:
> >  - s/Current/Basline (Thomas)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > ---
> >  Documentation/gpu/rfc/gpusvm.rst | 84 ++++++++++++++++++++++++++++++++
> >  Documentation/gpu/rfc/index.rst  |  4 ++
> >  2 files changed, 88 insertions(+)
> >  create mode 100644 Documentation/gpu/rfc/gpusvm.rst
> > 
> > diff --git a/Documentation/gpu/rfc/gpusvm.rst b/Documentation/gpu/rfc/gpusvm.rst
> > new file mode 100644
> > index 000000000000..063412160685
> > --- /dev/null
> > +++ b/Documentation/gpu/rfc/gpusvm.rst
> > @@ -0,0 +1,84 @@
> > +===============
> > +GPU SVM Section
> > +===============
> > +
> > +Agreed upon design principles
> > +=============================
> 
> As a general comment I think it would be nice if we could add some rational/
> reasons for these design principals. Things inevitably change and if/when
> we need to violate or update these principals it would be good to have some
> documented rational for why we decided on them in the first place because the
> reasoning may have become invalid by then.
> 

Let me try to add somethings to the various cases.

> > +* migrate_to_ram path
> > +	* Rely only on core MM concepts (migration PTEs, page references, and
> > +	  page locking).
> > +	* No driver specific locks other than locks for hardware interaction in
> > +	  this path. These are not required and generally a bad idea to
> > +	  invent driver defined locks to seal core MM races.
> 
> In principal I agree. The problem I think you will run into is the analogue of
> what adding a trylock_page() to do_swap_page() fixes. Which is that a concurrent
> GPU fault (which is higly likely after handling a CPU fault due to the GPU PTEs
> becoming invalid) may, depending on your design, kick off a migration of the
> page to the GPU via migrate_vma_setup().
> 
> The problem with that is migrate_vma_setup() will temprarily raise the folio
> refcount, which can cause the migrate_to_ram() callback to fail but the elevated
> refcount from migrate_to_ram() can also cause the GPU migration to fail thus
> leading to a live-lock when both CPU and GPU fault handlers just keep retrying.
> 
> This was particularly problematic for us on multi-GPU setups, and our solution
> was to introduce a migration critical section in the form of a mutex to ensure
> only one thread was calling migrate_vma_setup() at a time.
> 
> And now that I've looked at UVM development history, and remembered more
> context, this is why I had a vague recollection that adding a migration entry
> in do_swap_page() would be better than taking a page lock. Doing so fixes the
> issue with concurrent GPU faults blocking migrate_to_ram() because it makes
> migrate_vma_setup() ignore the page.
> 

Ok, this is something to keep an eye on. In the current Xe code, we try
to migrate a chunk of memory from the CPU to the GPU in our GPU fault
handler once per fault. If it fails due to racing CPU access, we simply
leave it in CPU memory and move on. We don't have any real migration
policies in Xe yet—that is being worked on as a follow-up to my series.
However, if we had a policy requiring a memory region to 'must be in
GPU,' this could conceivably lead to a livelock with concurrent CPU and
GPU access. I'm still not fully convinced that a driver-side lock is the
solution here, but without encountering the issue on our side, I can't
be completely certain what the solution is.

> > +	* Partial migration is supported (i.e., a subset of pages attempting to
> > +	  migrate can actually migrate, with only the faulting page guaranteed
> > +	  to migrate).
> > +	* Driver handles mixed migrations via retry loops rather than locking.
> >
> > +* Eviction
> 
> This is a term that seems be somewhat overloaded depending on context so a
> definition would be nice. Is your view of eviction migrating data from GPU back
> to CPU without a virtual address to free up GPU memory? (that's what I think of,
> but would be good to make sure we're in sync).
> 

Yes. When GPU memory is oversubscribed, we find the physical backing in
an LRU list to evict. In Xe, this is a TTM BO.

> > +	* Only looking at physical memory data structures and locks as opposed to
> > +	  looking at virtual memory data structures and locks.
> > +	* No looking at mm/vma structs or relying on those being locked.
> 
> Agree with the above points.
> 
> > +* GPU fault side
> > +	* mmap_read only used around core MM functions which require this lock
> > +	  and should strive to take mmap_read lock only in GPU SVM layer.
> > +	* Big retry loop to handle all races with the mmu notifier under the gpu
> > +	  pagetable locks/mmu notifier range lock/whatever we end up calling
> > +          those.
> 
> Again, one of the issues here (particularly with multi-GPU setups) is that it's
> very easy to live-lock with rety loops because even attempting a migration that
> fails can cause migration/fault handling in other threads to fail, either by
> calling mmu_notifiers or taking a page reference.
> 
> Those are probably things that we should fix on the MM side, but for now UVM at
> least uses a lock to ensure forward progress.
>

Again, see above. Right now, migration in Xe is more of a best-case
scenario rather than a mandatory process, and perhaps this is masking an
issue.

Maybe I should add a comment here stating your possible concerns and that
Xe will be implementing real migration policies and multi-GPU support
soon. If this issue arises, we can revisit the locking guidelines or
perhaps help contribute to the necessary core changes to make this work
properly.
 
> > +	* Races (especially against concurrent eviction or migrate_to_ram)
> > +	  should not be handled on the fault side by trying to hold locks;
> > +	  rather, they should be handled using retry loops. One possible
> > +	  exception is holding a BO's dma-resv lock during the initial migration
> > +	  to VRAM, as this is a well-defined lock that can be taken underneath
> > +	  the mmap_read lock.
> 
> See my earlier comments. Although note I agree with this in principal, and we do
> just retry if taking the lock fails.
> 
> > +* Physical memory to virtual backpointer
> > +	* Does not work, no pointers from physical memory to virtual should
> > +	  exist.
> 
> Agree. And my rational is because core-MM can update the virtual address for a
> page without notifying a driver of the new address. For example with mremap().
> So it's impossible to keep any backpointer to a virtual address up to date.
> 

Yep, this is good example and will include this in my next rev.

> > +	* Physical memory backpointer (page->zone_device_data) should be stable
> > +	  from allocation to page free.
> 
> Agree. And presumably the rational is because it is very difficult to safely
> update page->zone_device_data and ensure there aren't concurrent users of it
> unless the page is free (ie. has a 0 refcount)?
> 

Yes, exactly.

> > +* GPU pagetable locking
> > +	* Notifier lock only protects range tree, pages valid state for a range
> > +	  (rather than seqno due to wider notifiers), pagetable entries, and
> > +	  mmu notifier seqno tracking, it is not a global lock to protect
> > +          against races.
> > +	* All races handled with big retry as mentioned above.
> 
> Sounds reasonable.
> 
> > +Overview of current design
> > +==========================
> > +
> > +Baseline design is simple as possible to get a working basline in which can be
> > +built upon.
> > +
> > +.. kernel-doc:: drivers/gpu/drm/xe/drm_gpusvm.c
> > +   :doc: Overview
> > +   :doc: Locking
> > +   :doc: Migrataion
> > +   :doc: Partial Unmapping of Ranges
> > +   :doc: Examples
> > +
> > +Possible future design features
> > +===============================
> > +
> > +* Concurrent GPU faults
> > +	* CPU faults are concurrent so makes sense to have concurrent GPU
> > +	  faults.
> > +	* Should be possible with fined grained locking in the driver GPU
> > +	  fault handler.
> > +	* No expected GPU SVM changes required.
> > +* Ranges with mixed system and device pages
> > +	* Can be added if required to drm_gpusvm_get_pages fairly easily.
> 
> I don't see much of a need, but also don't see any barriers on the MM side for
> doing that.
>

I don't see any barriers either, I think it would work in Xe with slight
tweak to our VM bind code.

I'm unsure the use case though too.

> > +* Multi-GPU support
> > +	* Work in progress and patches expected after initially landing on GPU
> > +	  SVM.
> > +	* Ideally can be done with little to no changes to GPU SVM.
> 
> See above, but I mostly agree.
> 
> > +* Drop ranges in favor of radix tree
> > +	* May be desirable for faster notifiers.
> > +* Compound device pages
> > +	* Nvidia, AMD, and Intel all have agreed expensive core MM functions in
> > +	  migrate device layer are a performance bottleneck, having compound
> > +	  device pages should help increase performance by reducing the number
> > +	  of these expensive calls.
> 
> I'm hoping my patch series[1] to allow for compound device pages will land in v6.15

Cool! I was not aware of this ongoing series. Let me look.

> as well. The next steps are extending that to DEVICE_PRIVATE pages with
> migrate_vma_setup() and migrate_to_ram() and we have been making some good
> progress on this internally. I hope to have something posted before LSFMM.
> 

Also cool. If you think you have something working, let me know and will
pull in changes to test out.

> The other thing we have been looking at here is being able to migrate
> file-backed pages to GPU memory.

Also can test this one out too.

Matt

> 
> [1] - https://lore.kernel.org/linux-mm/cover.a782e309b1328f961da88abddbbc48e5b4579021.1739850794.git-series.apopple@nvidia.com/
> 
> > +* Higher order dma mapping for migration
> > +	* 4k dma mapping adversely affects migration performance on Intel
> > +	  hardware, higher order (2M) dma mapping should help here.
> > +* Build common userptr implementation on top of GPU SVM
> > diff --git a/Documentation/gpu/rfc/index.rst b/Documentation/gpu/rfc/index.rst
> > index 476719771eef..396e535377fb 100644
> > --- a/Documentation/gpu/rfc/index.rst
> > +++ b/Documentation/gpu/rfc/index.rst
> > @@ -16,6 +16,10 @@ host such documentation:
> >  * Once the code has landed move all the documentation to the right places in
> >    the main core, helper or driver sections.
> >  
> > +.. toctree::
> > +
> > +    gpusvm.rst
> > +
> >  .. toctree::
> >  
> >      i915_gem_lmem.rst
> > -- 
> > 2.34.1
> > 
