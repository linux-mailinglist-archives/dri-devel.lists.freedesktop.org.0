Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE0EC8C284
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 23:07:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2FEF10E6A2;
	Wed, 26 Nov 2025 22:07:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cvl/DAAd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C86910E6A2;
 Wed, 26 Nov 2025 22:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764194876; x=1795730876;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=mc5cfprJXn5a8+P4AqobzA4jicIG8lIvwONbrEbiMus=;
 b=cvl/DAAdes9EAcYmrxcy9TfqnJk4VABNMsAKSNYV6NUfWh5wk7YMup+O
 AMMYcs6Z0fQrQiTyImFcy69hycPOpPy4K+fcNNj195JttaKKzktWFBHud
 xs5hheCxen+UtfaQFlDceL9tSW6mDrpXVYFzEiFhMN0gHrgh0G5kMSwEF
 kJMUliyZZf9c5YKDfD9xk0auGeoYYkcfGyWftoqSxe6ximnfdmw73ijIn
 Y5TgpICxCiqPy1gcQp5lZLWASElVbQozLC3yLM2DCFWO3vuwMiNeETjN4
 +IPFVAPQpg0a0u2nb7eaB7omrYR1cRdVd7bGHJHj9aSYowAlDLGfeAO1c g==;
X-CSE-ConnectionGUID: Rp/Xno+DQjW8vpCTyR3S/w==
X-CSE-MsgGUID: ZUtLiTEaR/qER9b+McACwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="70107700"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="70107700"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 14:07:55 -0800
X-CSE-ConnectionGUID: +v0EO//7SpqNzhIWgvpkyQ==
X-CSE-MsgGUID: jK0w/QXOR9W1XqEVB4enKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="193515427"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 14:07:54 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 14:07:54 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 26 Nov 2025 14:07:54 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.47) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 14:07:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KnEUYqa38lG3Okph02zxXwW0pEpJ1/Qjx/KbdCjPE8fVZ6CfB66CD/3fUC3L92aRERx/mfk/0mCkOtCTL/fQTHlGMXtkyf0FgybTcIx861BpfK+3AMc3Krwgg9Wy6N+gLcXJYTmwVmNqtAEx8gT5uAArmhEbpjq3UcXr+PvcnHvCsmJt1geRyzDyhFWwuK48QyCWUEDQTQFfHKMmsyig+pE+gd7XuOtuzgwcAzVu+EIHydv6OdFYJNQw9CMH8pVyNorjVQSQVdwMgEkYuYFwhdfDA8D6xMIXoM292lG3/O7yOU/YoASzdWn1feA/Z8lHIBseMm8/8oKPeYrg0ClRuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MZm9NJYvATRz+UZl+7ZKspQ36jOplhlWYrPfXOUSC9U=;
 b=QNK/xz6KnAkLbZq1xoHxacnMexhWpoKegeYWmgeEjNzhNZWXfIHwxx96ZrmIqvuvU48uQ3FN1Vmb5JQy8JZlqnloNebn8GYpgRemb/pDy9GT5Kz3zt61myOWFFDz9eFyii+LcT9wjCA8jqUaZY3U0vqQxFVrfDF9FyABAzn5cDxEvWv16/g1WAPLYuEg7Aw5JI8BLiRgV1b1mhsZGM8n33Bz5GlWsUUzdHk8sOBK2SdHeEnR11XupppXW1Uk6vOF8VLO6g2XYldm75ADxm+xQvJykuZZawcBbbkXwLX9pdCNHZ/BTac1Y+fyIL7SMai4Nei9JfIRrp7METL/fgEbHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5365.namprd11.prod.outlook.com (2603:10b6:208:308::18)
 by PH3PPF10FBEE80C.namprd11.prod.outlook.com (2603:10b6:518:1::d09)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 22:07:52 +0000
Received: from BL1PR11MB5365.namprd11.prod.outlook.com
 ([fe80::9e84:1ac6:7813:4af3]) by BL1PR11MB5365.namprd11.prod.outlook.com
 ([fe80::9e84:1ac6:7813:4af3%6]) with mapi id 15.20.9366.012; Wed, 26 Nov 2025
 22:07:52 +0000
Date: Wed, 26 Nov 2025 23:07:47 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Alex Williamson <alex@shazbot.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 <dri-devel@lists.freedesktop.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Lukasz Laguna <lukasz.laguna@intel.com>, Christoph Hellwig
 <hch@infradead.org>
Subject: Re: [PATCH v6 1/4] drm/xe/pf: Enable SR-IOV VF migration
Message-ID: <4mraxnjpbthxpbghrfgzwywi4nrc76qflhoc5nnfxp2yzj3ub6@3q2pqu75xxm2>
References: <20251124230841.613894-1-michal.winiarski@intel.com>
 <20251124230841.613894-2-michal.winiarski@intel.com>
 <5565f3ea-6427-458a-b821-eb58890f16fa@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5565f3ea-6427-458a-b821-eb58890f16fa@intel.com>
X-ClientProxiedBy: VI1PR07CA0263.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::30) To BL1PR11MB5365.namprd11.prod.outlook.com
 (2603:10b6:208:308::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5365:EE_|PH3PPF10FBEE80C:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c858a5c-9a14-41d8-ad4f-08de2d383e37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Yk1GUEZJOVp5aE9GcnBNQVE1M3UzVHFjSHkvUmpSZUpkOHRhYnFBYThwMTRQ?=
 =?utf-8?B?ekFPSURqUCtLZzQzc0tublFYYkNzQUcvSHhGMHRVUk9yVUxHL0tnOC9BaHBY?=
 =?utf-8?B?aHpMRWRqWHdXU3N4dWhDaFZkanUwODVBbzFTZjh4UVEvZDZLYm9IRlJSQURp?=
 =?utf-8?B?Y3M3T3lmbEY5aXRxNzFObGt3NHNOSkFoL0lBRVlYL25abHp2cGRzZTN2eDk4?=
 =?utf-8?B?amZwczFBckJJYTRQMlpkUE80aStFQ0R6TEE2NGhkZGc3MVIrV1N1L1g0RkpQ?=
 =?utf-8?B?eXEvd2lzVU5TMk5zQTAyeDg3d0hkdDQ0Ykc4K29iUEVhc1ZHdlk5N2o4VXFN?=
 =?utf-8?B?bDFTOU9GRlpTZkIrOXZrMkwybDBxYzlOVzlLbVBLNWluSnlmNTlXTklLNXJG?=
 =?utf-8?B?a0c4WEtxWUVXQmpDVWx1WHJ3RVd3WXd1bVhKQjV3cUVJdzlQVnlSTm1senhE?=
 =?utf-8?B?RWI0Ym9Vd0pObzVMRDhtTkY1V2EvOE9DMUpmMENRanJQVlVLcmZnNnJBd0ly?=
 =?utf-8?B?d2ZpVHdsMnR4bmZ6OGQrQTJ3NGl3WndDYW9IQVhDVWl6dnJLdkRZNGtXclNk?=
 =?utf-8?B?M0hYY01rUXkyWmFteDJqR201WCtXVHhMdWJwdkwrZjRsd3lURVVKdnp6N1Fo?=
 =?utf-8?B?a3pzdStxenY4aXJnY0JwdkgvSE9LQUpsTDlScFYrSDdRc2pob204bm1zMjVY?=
 =?utf-8?B?dGppMURjS2JKMU43YmN4TFNTSmFjOE9yWDVmYkJkaUltRW96U3Q5TExvNWZy?=
 =?utf-8?B?b0dWVTcvSGkzd1BsTi9COTZJSlpUSkhFU2doWC9pWXBOSVA4ak1sN2VBTkpP?=
 =?utf-8?B?WjlDQzBucnhLMmd0T1ZBZ0U3RDVkNk9wUVVzRmtFMHJLNzdUM2FOOEVsQlBv?=
 =?utf-8?B?SzBlZlZ6RGdqZGdmeTFPd3JBSGUzVlJ2cHh1RlN5eWhZeTJ3eFJRMEd2UmNM?=
 =?utf-8?B?VjRvVTFacGk5TGJLNVNPYTZQK3NiSFErbW1ZdjkreXZEYU1vRHhHNWNlSVZS?=
 =?utf-8?B?cVVWcndPU2RGZng1ek9UaDhnbTZLZFBMZlFldlRwbGNyeXAwNHZsMHc1NFI2?=
 =?utf-8?B?eFhWQWd6d2plc0NsMmZnbmtXNmloNmhCSjkwdmFNNVpoVDUxc3hPUU5PV3BO?=
 =?utf-8?B?THJBWENpTUxRbnloK0VKVlZlNUFyV3dqdXk2QkNvQkF3UVFnSjdBTEVZaFRZ?=
 =?utf-8?B?MlB4MS9JbkVmbkEzNFBmNzdIY0lHMk1iWXp5ZVp5RE9GMzk3aFFFK2YvVGFC?=
 =?utf-8?B?bk01YTBpVmNmV0k5elBnMzVXR3FkQlpLQnAvblczMkU4akQ5U0FmNE5YQzdJ?=
 =?utf-8?B?NnZXMG9IR2tCWG1zOE9VckZ0Rm9aeXpuVGRUOHhKZHFGNzVuR05LQ1hvSnVI?=
 =?utf-8?B?V2lCQXRhKzdLQW05VG5jOVpsS010MGJuYXYwUmVWZHIwcjI0RUMrKzBUV29x?=
 =?utf-8?B?UElmNHFibzJaQlFPcEFPZ0xPUzFFNDB5TGsrNTgrQjhFOEJKR3I3dXNOVWxi?=
 =?utf-8?B?YzJBc2ZzNWh5bm53djhCaUNrZFVoWGFnNzU2MUI0WFYvZDk1WXozM1RTV1Yr?=
 =?utf-8?B?Z3d6QlY4bzljd2tseWdKRXNTMjluMlJCNzNCQXUzT3dxWENta21EZkdJRmo4?=
 =?utf-8?B?dVVZOWpEL1J2QlVRc3hOREQ4MjNBRDJmSnUyeVIwZXZxeWtiZEhzbTZLVDZX?=
 =?utf-8?B?UjJuVUFobU04a2RUVUlQand1VVFickIrT3ZWMUtNbm9tRWE4MnZEUVhCci82?=
 =?utf-8?B?OGx2RXV6L3BWa2ZyQ0pOclFQVVdNa3dZZC9sKzNadm9JTzBDYktTNE1zMjVI?=
 =?utf-8?B?MXEvemtRTUIxLzBuVjNGRW1qUUlCRWlUK3M3dXpwUXRhRTJaMDRKZVN5em81?=
 =?utf-8?B?cjBaTTllY1lyYzNsNGYwZC82S3p5V0JpODY2VnhsWWNnT3B6a09IVHA0elJh?=
 =?utf-8?Q?A5WfUd8hPfmLvq0meQ95DY6NhFKjeuvR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5365.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVMxVFRXdVFmK29OSEptakpsZGtRZTRjMUErK1RCUVVCSm52M1cwK2hPeTRp?=
 =?utf-8?B?dzlSYUtPTlM2SXhvbUZLai9ZSUsxa2FPdU5nRmVpaEN1UUpheDNmYlVVN3Mv?=
 =?utf-8?B?T1JUdU5TNVF1SzlRVDVkdmkzb0RQOTJSM1dYWVJiUGg0NS90U1AydS9PMndR?=
 =?utf-8?B?WUR2S0QxWnNQQWhFRlc0S3NIVDZLa0cvWUw1TUR6QXZKQzVwL0xDRWdpaUpN?=
 =?utf-8?B?SGZta2RHQXNGMk1LVkNaYkZ4b1JzY0pDK0p4TW5JZ2M4YkNpdFA5bDEwWngy?=
 =?utf-8?B?aTJqOXZaSmtrbjdtM2pTOU1yVHdyKzBEMit4ZFJMT1h4ckYzaVZFN2draUpZ?=
 =?utf-8?B?NVJpVTNtN09zaWZjb2RXSU1DdXdjMWVzblp1NFhJNkVPZnllN2x1VzBxL05m?=
 =?utf-8?B?NVFsN0Z4WEllOCtFeG5yRU9pREFBTGlCL2kxNmxTOGtBRHpUVFpvMHcxYzFI?=
 =?utf-8?B?K21QcFpyUGJOakY4cCtZeTNiQWg2T01Ea2syOTdnWWgySk5JUFRRajhubTZu?=
 =?utf-8?B?UGd1S3VaZ3JRWGMxb2hxOXpDWW1nb0prYVgwTjlobnNaTVVwTUx3UmF3dGpB?=
 =?utf-8?B?TU5jNEkwYk9XYXQxM0dSVVJvOFkxbXJMRlp0c2FDeHU1SWRST0M2U01Hek5K?=
 =?utf-8?B?OFQxZk9qWDdEditjYVhEcDJjdXFoaktMM1VTVTUvWDN4eXhnY3FjTG1FazBx?=
 =?utf-8?B?SUpXaCt1R0h3WnhCeWtXd0w4bExJaEVKWmxmazQxVHJjQjl2NTRrQ2d1ZkZU?=
 =?utf-8?B?LzBWa0dBUm52YlBGL0lsKzQyT2R5RTk4VEU3U05PcHZxNUhNZC9XWDUxZ3FD?=
 =?utf-8?B?SE1vZXZzT0pXYjAwSGlMTWk5ZVVERmhGMVdaVldsMm9BRXZSVDRTMm9kSXVr?=
 =?utf-8?B?enoxYUpRTHUxVXphem5LdjJqekVZMjNtcHRRNzd5amozYlM1Zm14elp2TE9M?=
 =?utf-8?B?cjBFZ1RmUWJEUjJ5eDBrUDViZHM0eW45MDNJZVAvMjRiMWpDdVFNdlhCeHIr?=
 =?utf-8?B?SHQxbEpCSURpbVl3cHNWUG13M1htaTBMK3kwWjdWeVBNME1yS2FBTW1KLzNG?=
 =?utf-8?B?QnhWZjdLbWJWeWFvRWVCaTIza0FwWHhIOThXSWF0WlRIOVBHWXprUEpYV0pD?=
 =?utf-8?B?SStWMmphSlpTenJreGc3SGVNRkhkOEpuV0lXc2FyY3hxcnNiSkRuZTBjTnpR?=
 =?utf-8?B?WlVOZWpqRVd4aEh2QTlpUUNZdmZSdXQvRi9GOStDc3BCbU54QlZ2RWhkT3NP?=
 =?utf-8?B?S0E0VXoxK0RHWUJzTFBFeG81L0RkZ0E1aklFVTVmODc1L3p4VGNGOHJzTEhj?=
 =?utf-8?B?S0FZQ0NERW8wM0hwd1dOSDYwSUZ1TStWVmNSdFIxcnJ2eVNRUzF3WWt2cnJy?=
 =?utf-8?B?bTVISGtkTWtJSFdycUNRNGpTQ2FhTmdERnlCWlNUanArRTdVL3MzUE9kdUZ1?=
 =?utf-8?B?eFRlR0xyTXAwUFRQYU1CODkxdjhaVnNJZS83Yk1rOVNNQ2VHbzdlckVzZXJq?=
 =?utf-8?B?NDllYTR0WHZzM29RdHZ6MXAyTGJ1MURIZVVUQ1gvbVJ3MlgrcmFSSXZtWTlT?=
 =?utf-8?B?M2VGcWtoYlR1UTlnVEVXVjArREVoMW1Ka29JVUNJNXZYNUhGcS93MWw2SlJB?=
 =?utf-8?B?bFRBeUtFYTZoOUtadUVvU2hCb1VkQ1NoVXdibW8wWUhQSEJEWUEwckpJL1VU?=
 =?utf-8?B?Umh6eUN6TzIvR2pJSHlDM1VkY3NYYUVRcWZ2L00yckRsSjQ0djlwSFgrc2Nr?=
 =?utf-8?B?bk1kU1Fqd252QjhuRDZvdUxnMHRuUmtxUmxza3RtTG55MEQyRVNXMlhibG1F?=
 =?utf-8?B?NThsOFFYZUJMSWVOZHB5TFZqTy9KazdnL2ErMzZ1RVhrK2E1eGZyOTRMcjcw?=
 =?utf-8?B?S2liUm80T1AxWWxtclJ4dWlDcnJzWGFkMVBsTnpEeWYzVkJGbVhwSDJCWkhQ?=
 =?utf-8?B?a2xWNFRQdEV3TDg0eFA3ZkZQQTYyMmdMbW9Tb0UvTVYwZGVTR1F6Q3FRa0k3?=
 =?utf-8?B?ZzJZS1hPUmV2QklEbWw1UTRuQ1JsZHgyYlBpN2JKYzlWVHh2REQ4L2JleDZr?=
 =?utf-8?B?UVJ0ZXJyY2lvRmFobWN1OVo1UTdFRU5UOU9hU1ZKWUo1NUliR293bjlITHRa?=
 =?utf-8?B?aXVwclc0TnhnWktXb0U1YVovYnUxVkx2V280REg5eTdRRDExeVV2U2gzdVlp?=
 =?utf-8?B?WHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c858a5c-9a14-41d8-ad4f-08de2d383e37
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5365.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 22:07:52.4042 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qwfjHExs1VbKKsrp5gZzsjZWeDuc8+YRNmsgKX7CWiLHPBZ89GQO04G6Sqt80wLVxp6PNxuHTk7u099uQ7bi+BOlOSXHozr9l+L4zBMIJ3k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF10FBEE80C
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

On Tue, Nov 25, 2025 at 03:26:38PM +0100, Michal Wajdeczko wrote:
> 
> 
> On 11/25/2025 12:08 AM, Michał Winiarski wrote:
> > All of the necessary building blocks are now in place to support SR-IOV
> > VF migration.
> > Flip the enable/disable logic to match VF code and disable the feature
> > only for platforms that don't meet the necessary prerequisites.
> > 
> 
> I guess you should mention that "to allow more testing and experiments,
> on DEBUG builds any missing prerequisites will be ignored"

Sure, let's add it.

> 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c |  9 +++++
> >  drivers/gpu/drm/xe/xe_sriov_pf_migration.c    | 35 ++++++++++++++++---
> >  drivers/gpu/drm/xe/xe_sriov_pf_migration.h    |  1 +
> >  .../gpu/drm/xe/xe_sriov_pf_migration_types.h  |  4 +--
> >  4 files changed, 42 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > index d5d918ddce4fe..3174a8dee779e 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > @@ -17,6 +17,7 @@
> >  #include "xe_gt_sriov_pf_helpers.h"
> >  #include "xe_gt_sriov_pf_migration.h"
> >  #include "xe_gt_sriov_printk.h"
> > +#include "xe_guc.h"
> >  #include "xe_guc_buf.h"
> >  #include "xe_guc_ct.h"
> >  #include "xe_migrate.h"
> > @@ -1023,6 +1024,12 @@ static void action_ring_cleanup(void *arg)
> >  	ptr_ring_cleanup(r, destroy_pf_packet);
> >  }
> >  
> > +static void pf_gt_migration_check_support(struct xe_gt *gt)
> > +{
> > +	if (GUC_FIRMWARE_VER(&gt->uc.guc) < MAKE_GUC_VER(70, 54, 0))
> > +		xe_sriov_pf_migration_disable(gt_to_xe(gt), "requires GuC version >= 70.54.0");
> > +}
> > +
> >  /**
> >   * xe_gt_sriov_pf_migration_init() - Initialize support for VF migration.
> >   * @gt: the &xe_gt
> > @@ -1039,6 +1046,8 @@ int xe_gt_sriov_pf_migration_init(struct xe_gt *gt)
> >  
> >  	xe_gt_assert(gt, IS_SRIOV_PF(xe));
> >  
> > +	pf_gt_migration_check_support(gt);
> > +
> >  	if (!pf_migration_supported(gt))
> >  		return 0;
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> > index de06cc690fc81..6c4b16409cc9a 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> > +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> > @@ -46,13 +46,37 @@ bool xe_sriov_pf_migration_supported(struct xe_device *xe)
> >  {
> >  	xe_assert(xe, IS_SRIOV_PF(xe));
> >  
> > -	return xe->sriov.pf.migration.supported;
> > +	return IS_ENABLED(CONFIG_DRM_XE_DEBUG) || !xe->sriov.pf.migration.disabled;
> >  }
> >  
> > -static bool pf_check_migration_support(struct xe_device *xe)
> > +/**
> > + * xe_sriov_pf_migration_disable() - Turn off SR-IOV VF migration support on PF.
> > + * @xe: the &xe_device instance.
> > + * @fmt: format string for the log message, to be combined with following VAs.
> > + */
> > +void xe_sriov_pf_migration_disable(struct xe_device *xe, const char *fmt, ...)
> > +{
> > +	struct va_format vaf;
> > +	va_list va_args;
> > +
> > +	xe_assert(xe, IS_SRIOV_PF(xe));
> > +
> > +	va_start(va_args, fmt);
> > +	vaf.fmt = fmt;
> > +	vaf.va  = &va_args;
> > +	xe_sriov_notice(xe, "migration %s: %pV\n",
> > +			IS_ENABLED(CONFIG_DRM_XE_DEBUG) ?
> > +			"missing prerequisite" : "disabled",
> > +			&vaf);
> > +	va_end(va_args);
> > +
> > +	xe->sriov.pf.migration.disabled = true;
> > +}
> > +
> > +static void pf_migration_check_support(struct xe_device *xe)
> >  {
> > -	/* XXX: for now this is for feature enabling only */
> > -	return IS_ENABLED(CONFIG_DRM_XE_DEBUG);
> > +	if (!xe_device_has_memirq(xe))
> > +		xe_sriov_pf_migration_disable(xe, "requires memory-based IRQ support");
> >  }
> >  
> >  static void pf_migration_cleanup(void *arg)
> > @@ -77,7 +101,8 @@ int xe_sriov_pf_migration_init(struct xe_device *xe)
> >  
> >  	xe_assert(xe, IS_SRIOV_PF(xe));
> >  
> > -	xe->sriov.pf.migration.supported = pf_check_migration_support(xe);
> > +	pf_migration_check_support(xe);
> > +
> >  	if (!xe_sriov_pf_migration_supported(xe))
> >  		return 0;
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
> > index b806298a0bb62..f8f408df84813 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
> > +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
> > @@ -14,6 +14,7 @@ struct xe_sriov_packet;
> >  
> >  int xe_sriov_pf_migration_init(struct xe_device *xe);
> >  bool xe_sriov_pf_migration_supported(struct xe_device *xe);
> > +void xe_sriov_pf_migration_disable(struct xe_device *xe, const char *fmt, ...);
> >  int xe_sriov_pf_migration_restore_produce(struct xe_device *xe, unsigned int vfid,
> >  					  struct xe_sriov_packet *data);
> >  struct xe_sriov_packet *
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
> > index 363d673ee1dd5..7d9a8a278d915 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
> > +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
> > @@ -14,8 +14,8 @@
> >   * struct xe_sriov_pf_migration - Xe device level VF migration data
> >   */
> >  struct xe_sriov_pf_migration {
> > -	/** @supported: indicates whether VF migration feature is supported */
> > -	bool supported;
> > +	/** @disabled: indicates whether VF migration feature is disabled */
> > +	bool disabled;
> >  };
> >  
> >  /**
> 
> otherwise lgtm,
> 
> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 

Thanks,
-Michał
