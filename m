Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E05BC229CB
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 23:57:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36BB410E083;
	Thu, 30 Oct 2025 22:57:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pfid8cup";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46B4210E083;
 Thu, 30 Oct 2025 22:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761865058; x=1793401058;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5FygmR9lfIJg/7vfpYcpCokeGBWgVpDTe/FN9+sF3ts=;
 b=Pfid8cupKHSFBFZtLPGdxgK/HwCnLZhxfpVosbwCM8Dt6IVzzFPndW/l
 ASwy1JG908Xc/5eRObLf7oCy6HCHVrTtnpMtJVb4hGloAnQo902e5eRFC
 swY523C7T+RbQOkWAZhRAnwoKF5N0jyMWNRgZa0pYg1UA3dxhph/tKYsV
 DTipE4pVp6cEPwJuyfUXpxpmPxhzUw8l/FmUdx8mIR/ztbuGdFNOggccr
 XuTrjLd9p9Wp08qOBInkyVPe4CZrwvbPsba4KOwYmCQaXGnKxoAG7bVFR
 qxBqRBofOcbHJmATltrmHjX725hnxVgbJQzE4cZscUrPxC9LSA11xGN2o Q==;
X-CSE-ConnectionGUID: ynW9cPxoTfezRUcXXXBNIQ==
X-CSE-MsgGUID: RRSGgIYvTo2S9SXmvdEtqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="75471418"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="75471418"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 15:57:37 -0700
X-CSE-ConnectionGUID: jev4YVa3TPq59z2BFye2+g==
X-CSE-MsgGUID: z03vTC0DQWWvepYQm/jyYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="186818985"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 15:57:36 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 15:57:35 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 15:57:35 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.2) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 15:57:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=omRl9mVL+E5rQQ/fKMh58fTYfBI2IdIN+CLqQlThYau1TPRV0EAGzJU6iRBfuxhwYTDW1Tv/4BkJDkYUI1x86filrMFZfngD1bA9Zoy7cK9EU1BegfwlzFq5JJVb0XSnVji5ToXZ0bwqmh56UgzOoiK7lbu90UDpuCG0xceRLoI5BfaMB+oyRdImPTKMdOTr5l1bU7/bWR0h01Nvhq2FtKB5HHfEGb5qJWNiGRF9UrEgVAYYl1eAL5E2JwbgGvxHzq7m5g06bkzLO/nnPdTPrtthe787c4qaqWdcC8yXH+TXdbM84i/Hyh/2UE/RTlcgrBFpeIkUobgc/1/VaiYkBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x4ZKysi5F+nSrWo5PNp8mpxatZLkPNOT97FL52iOyuc=;
 b=fnS5096+emz5sdCdySgdMhGmqgHLN5L6b2fMDvBLadiyk2D7XBmnmi8xPXZun/7hVOrmYKoBCo3eHPqXlCNtFQbxvbQ4YjK1wWswMMZN/QOhpwVbDC0hr414VrNMbtdnCN0VkI0QjLcxwX+oZYSS7ae6UdHY3YlB5ZyRJPr/8p3AQJ1AVC5nql1eNY8QnH5lzPetM9GsAetnFsyRKCptFqG+QzwVyPHCLkoj9Ni8l3+qehdjrv6JQkBSidY4WBnxHyxVN8tE9DmMO2QDAayVQPzW+3/rxPawOA+zE/7CaFtBJIy5fvUWHLmqTXHdQjcKao7Z8ysEXU+eJRoucFI78A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MN2PR11MB4757.namprd11.prod.outlook.com (2603:10b6:208:26b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 30 Oct
 2025 22:57:33 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 22:57:33 +0000
Message-ID: <612b77d4-236b-411b-9b6f-93c6924e8a1d@intel.com>
Date: Thu, 30 Oct 2025 23:57:28 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/28] drm/xe/pf: Convert control state to bitmap
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, "Alex
 Williamson" <alex@shazbot.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Rodrigo Vivi" <rodrigo.vivi@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yishai Hadas <yishaih@nvidia.com>, Kevin Tian <kevin.tian@intel.com>, Shameer
 Kolothum <skolothumtho@nvidia.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>,
 kernel test robot <lkp@intel.com>
References: <20251030203135.337696-1-michal.winiarski@intel.com>
 <20251030203135.337696-4-michal.winiarski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251030203135.337696-4-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0072.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:26::13) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MN2PR11MB4757:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e8bb503-0900-4eaa-ee37-08de1807b65a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V2kwSWk3Z3Y1d000RE1UOEVtVUREZ3dOR2s5NXNXaFNXRGMvQi9qdlExTGI5?=
 =?utf-8?B?US9aTk1MZ1FpeW00Y2xwc3ZKNUhCM1BwdEcvODczZDFneDgraFBQaDdIcytN?=
 =?utf-8?B?bExSTkp2VHZaZWQ1T0xTMWt2OXhqNFR0ejU4UjdiOEswL1g2ZzR3ck5QWEFj?=
 =?utf-8?B?YVd4Q3A2dGljamJidnAweU53WEV4aHVQOENuT3AyTHVOY1F5cDQwSzdiUytK?=
 =?utf-8?B?c3pYdGNDeFpPclBpZnpUemRlM3I1NWRXTFVydXdUTEhBN2pScXo3UGVnemds?=
 =?utf-8?B?QzdQU0tpSnZtTFliWSt6eHVyV0dqVFhaUWlQSkJsUW1UZHdDR2RIZFVnVnFN?=
 =?utf-8?B?NlBkLzhxQnlucnMvM24zNXEybjNKb3FMMTNoRjBPS3pwc242OXMwNllheTFR?=
 =?utf-8?B?OHV5d0hkTENsai9qVnYrQWJSck9JeUtuYWpnTklndnlYSXR6TlgzMDZVVlli?=
 =?utf-8?B?eDBVeDM4ZU1VT1E0djBuTFVJZXl4dlNxWUtleWJvU25TSHhEVUt6aVJGODB5?=
 =?utf-8?B?VWc5dUovNmYxcGlycVFtRWswR296QnRVd2w2VWc1V3l5cFYwTCs2OTd3eEky?=
 =?utf-8?B?bHI2UmJ6d3V0T0dLb3k0cE1vbXd3cFNTTjF4WGxWOVRSaHNTRUVuOTl2ZXZk?=
 =?utf-8?B?WU5Fc2NXbHN4cVg5Q25OY0tJY21ydllZWjNEaXpITWVLVTFsQUExWmJXTU0y?=
 =?utf-8?B?NTBTUVdJVVF5a0dGeGJlNTg3Ti83dVJQTjBDaER1TG5LUDB6TWE2aThvTGxx?=
 =?utf-8?B?Qk9lZjI2Z3I4aXdjLzUwS1VvTkoxVjYwTkIrcTBXYW00RGFNVDduNFkvU3BV?=
 =?utf-8?B?SjVwd1gvay8xU2pTZ0VoTHJxUDFFMnE5cms5OVFuY3hwYjIrU3pJVXAzdXg5?=
 =?utf-8?B?dklzR1pHTFVEd2NGWkN2R1ZFUlZBaHFWUUVCeWFjbzBHNGVFL21qb0FXWHkx?=
 =?utf-8?B?NXJjODFpSm9oUUpsdGl5SFpKclpjZ3lrWE93bEJOYzBGRk5td1FaL0dmSUgy?=
 =?utf-8?B?QWJiR0R0OG0wazQ3NlJabEhCakw5NXY1aXVSTVVRaHJFTjVQUjhkcnpZdWhl?=
 =?utf-8?B?bWtIT2o0SlNPb3pCMVBsaGRLQ3A3eE1ndys3ZWZOTEYyWFo3eGVXLzZnKzg4?=
 =?utf-8?B?OTRUc2FWZVk3NXFpaUNnd3M2VytudjZOcHA5OVZ5STRvbThSelJhYnRyVVh0?=
 =?utf-8?B?YW4wVzlySUcrSUxrWEI2eUZRUS9TYm9zbkFuOXVkL2FPbXRyYXQ2ZDNlcG9x?=
 =?utf-8?B?SUJRYStSWE53ZFhwcDRjYUY4cHB5bWFIOFl2ZURsYzc4cEIzTnNCV3dhSmJC?=
 =?utf-8?B?VW1jazBySWlMemJwSzJLUUxmWEh2Nlh2bGkwYndWV0w4Tit0MVE3ZTk5a3V3?=
 =?utf-8?B?Z1NxSHVsR3BFNVpzUG52M2xOUkFoTXM2dWxqTW1SUjFsdTUxWFpXZlJ5Mzk1?=
 =?utf-8?B?d25kaStlOTJTUVdvOThlYlpGcnE5cjl0Z29uRWNLaEd6eXdaWmxndmUram9U?=
 =?utf-8?B?ZjlrZXR4dnR3eTVuenRKdmJzM0FKZEt3VDNaVlVTZnRDUnFlRzcrb0hIV1g0?=
 =?utf-8?B?Z1d1eHFWditrSVhlOW8welNoUGwveUhnWmw1N2xJY3dpLy9yY1hFWTBFM0xK?=
 =?utf-8?B?amswbG9PWDVGaWQyMzhKZm9xQUJwdXphb1o3UnNublRQVFZaRS8wcDlPbGdp?=
 =?utf-8?B?aEpvVFY3eHhDc0FFcHVaWXZrS0FLWWZVZ1B3Z0tibXQvM01rVXhyRHRxMDh6?=
 =?utf-8?B?OFl3TzJGMjdBa2ovc1VUUmpFWDNRT1Q0YkhBUXg4cFYrKzROb3FLd3IrWHdj?=
 =?utf-8?B?QnNGWlpoL3VVYzJGRkUvNktGUTc1dENhOWRrdE5URHB0RFhheGliMUdwRDF2?=
 =?utf-8?B?R1BjdVBiL2ZiNzdOMUtCL3JGM1VWTy83V0hPZkhhNWU0dTBjQWtCYVZLR3BD?=
 =?utf-8?B?NEJuaHhxZjFodUdLT1NOQzVLNnJUTytJMHFNN0dkd082Y0l2Nm1LREdYZDIv?=
 =?utf-8?B?VGlrL3djbnk4ZkVkZ2NrV1ZOQ3ZzenBkbG85bmV1S1FhYkI0UWd5cXc4Z25i?=
 =?utf-8?Q?9xoADE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eG15eWl3QWtydDlWREtEc1JvajFWc3ppTnZVenptTm9BWmYyNGxLV1dCUkhL?=
 =?utf-8?B?Z0FlVUp1UU5mendyS0RYa3hnOGsrblNDT2F5RnFjRnE0RWtYVUJDcFkzeHRz?=
 =?utf-8?B?OGtZL3hXMktxVlVDd2VKZWJWY3hoTXpEaU1CeHU4WmVNNzY4c2NUVS9sWU15?=
 =?utf-8?B?UTNoblRjK0Z3NFlVOUgwYVBvRTFqMkJLN0p1aXNSNTlVWUlZbXo0bGp6cW5V?=
 =?utf-8?B?KzN0UnJCWE9yWEVQSXQzZkRKMy91ME1GVVhOZ08vWllNZjYrVXNSQ2htblQ1?=
 =?utf-8?B?R25EWE9OcTBib0E4Q2IreDlnSlFQK1RsNCtFYlZnaXBaT0dvc1d4WWVUM3lN?=
 =?utf-8?B?b2pJbEVmTzdEd3FrOEVZbU1ocnQwWHR3OXMycmo3bGt0Q1ZGN2VNL3A1VUV1?=
 =?utf-8?B?WWxoT044bExDSGJPaVVkOGsrN3cvMmFlVlJMS3ByallneGg0Rkl6RGVDV3kx?=
 =?utf-8?B?NEcwNTZlTytXbjVCMXI0Um0yV3lOT2pHUzl5OXBsOWlHOTJDL3pQNllsZ2hC?=
 =?utf-8?B?OG9iMFdBTkErVkhreW1jVFVrd0hZYXdJbC9DdWE0WkdSaWhJVzNtR0pBWCtM?=
 =?utf-8?B?NE50QjFGTTIvSmswcFFrYml3Y2tPSmZQUTBDaVc2cjlGTTFOQVh6RXJ2ZW5R?=
 =?utf-8?B?RENaVWlyTVlDSEZJdytXeGVUM2diQ29FSmdSRno1eDV3aUtIbWVRMkhBTE5t?=
 =?utf-8?B?bTRXTzlMQjRpeDc2WmtDalovSjJrNkZSMWZJN3dRejFJK3dvNjVpSm93S3dL?=
 =?utf-8?B?NUdlOUxMSytESFdRZEFSd1ZuVWRlUjk0YlNLclE5Ykx5cmNvQ2l0YlFFbDFu?=
 =?utf-8?B?dnI3amNIQ2lTRWxERVBqM0FGWk9HbzVMbTBpUnM4ZkdHVmF3YnY3V210cnIv?=
 =?utf-8?B?TUR6bk5EekpyK1R2TzdvT3h4bVVoTW5yYVlRbHBYY0RsNExhVkRHZEdoU1NC?=
 =?utf-8?B?WExUdzNnRjVxamFvSzlBM2FlN0l2S1RsMjg4K3NhTC9vVnVTMWxHOVBXMVM4?=
 =?utf-8?B?VG1vU3VDOHpzaVFKYTBzbTN3M2lKNlo0OWQ4TzkrYzk0UkYyUEZ2aVZsRU5F?=
 =?utf-8?B?WlcrenM4czVET3g4cWk0bTZ5YlVKeHVEZ3Yzc3ZRMXAzY0owdmQ3WEJCNTFG?=
 =?utf-8?B?QWJwYW5ScWdXdG84bjJ1K2ZKbHM5RXVGQVFCM0hZdWI5bDVKTTFiK3lnM2tn?=
 =?utf-8?B?dGxKSkhhdjlDQlhvTTJoYnJ6dEZPVEtJM2hCYzRydDZsRkZEZCt3dXk4N0ZT?=
 =?utf-8?B?RlZqTm95TmVCcStiaStkNXc5TEhIeURybU5IMk9JK2d6OFk3aERRMnVTcXRs?=
 =?utf-8?B?WEl1ZEE1SEN0WG9pZnBwUW1zaE5jVEdra0ZjZnNNaExaRWM2QlZHMlV5Skpx?=
 =?utf-8?B?TDRYbXRRUmwxN1VvOWlhMDNOOWd3Y0dCbmw3UkpORDBaZE1LWUViVElHQjI5?=
 =?utf-8?B?Z053b21kUDdQbm5PUmR1KzZIdnhQSFJCL2xNcUVoeThyeGZVV21vUE9KdnVO?=
 =?utf-8?B?RFdacDhCa2lISnJ6M2Y5Z3FyMExYODN3a0JheVJCTzRURXRlOHVSbEthbXhm?=
 =?utf-8?B?RVlFd2FXWW5hc0VxOHgwZGV0a25DdGZqazdxeUtSOU9QRG4wZEhqMnhuZ014?=
 =?utf-8?B?b2RXek5zbEd4cVJUR0hmZUEvR3RvU05sUVNKOUlqNmtVQWpieVlpZGp2dDF5?=
 =?utf-8?B?a01Gam9ZUUVQOVZCd1ZpT1hRTDBoTjgzYXVkSSsvcU14Z2tWVHc1VTVEZ0NW?=
 =?utf-8?B?OFcvMXVzTVFhZy9mYlB1OStmUFpJSVFaSGd4am16MGVPYjJBNnA4UmJ3QnRn?=
 =?utf-8?B?M3FrL1BTWTlVRk94WTFDQVY1TEpZWXRqUGZiN3RDaE5wVDRIekI0ZGhraDdi?=
 =?utf-8?B?azJ3Tkk4UDE5OW9nTHYvN3E0NEg0ZnplTnEwSUFIbk03SzNOd2dkeTdqdlVS?=
 =?utf-8?B?NkFKakJGMGRzcDRNU083bDZoLzNrNEZRTzNLZkZoUWZJUkRGV0wxalFsV0Nj?=
 =?utf-8?B?RGJPa2k3Qk1DVzZIeEFheW1jMTdkakpMU3BjOEswOXYxbXI1cENUTHJoM0ha?=
 =?utf-8?B?bVhzR25RdFgzU3dmNndGMFBWak45cEM2NDE3WkM5YVovcVE4SlRnYStUemZr?=
 =?utf-8?B?dVhrcjByY09NMVZURVlBdkJ2c09jVFM3UzgrNzRGZGp0NWN4UWJBR2RZMjl5?=
 =?utf-8?B?OEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e8bb503-0900-4eaa-ee37-08de1807b65a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 22:57:33.8622 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +oqrv4tuZ+10hDyyFX8P1foUhEuq0SFijoczkZc475V7W6hxnb0/ZnKTeAFi14WHVSJBsKaVP6bs2N0sAQFOcxBaWOVbXzV+0rBSqZOaazU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4757
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



On 10/30/2025 9:31 PM, Michał Winiarski wrote:
> In upcoming changes, the number of states will increase as a result of
> introducing SAVE and RESTORE states.
> This means that using unsigned long as underlying storage won't work on
> 32-bit architectures, as we'll run out of bits.
> Use bitmap instead.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202510231918.XlOqymLC-lkp@intel.com/
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c       | 2 +-
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h | 5 +++--
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> index 9de05db1f0905..8a2577fda4198 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> @@ -225,7 +225,7 @@ static unsigned long *pf_peek_vf_state(struct xe_gt *gt, unsigned int vfid)
>  {
>  	struct xe_gt_sriov_control_state *cs = pf_pick_vf_control(gt, vfid);
>  
> -	return &cs->state;
> +	return cs->state;
>  }
>  
>  static bool pf_check_vf_state(struct xe_gt *gt, unsigned int vfid,
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> index c80b7e77f1ad2..3ba6ad886c939 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> @@ -73,7 +73,8 @@ enum xe_gt_sriov_control_bits {
>  	XE_GT_SRIOV_STATE_STOP_FAILED,
>  	XE_GT_SRIOV_STATE_STOPPED,
>  
> -	XE_GT_SRIOV_STATE_MISMATCH = BITS_PER_LONG - 1,
> +	XE_GT_SRIOV_STATE_MISMATCH,
> +	XE_GT_SRIOV_STATE_MAX,

while this feels handy, this MAX enumerator is not a real state
and as such shouldn't be passed to any function that expects
"enum"

since we know (and want) to keep MISMATCH state as last one
(aka top bit) then maybe tag it and use separate define:

-	XE_GT_SRIOV_STATE_MISMATCH = BITS_PER_LONG - 1,
+	XE_GT_SRIOV_STATE_MISMATCH /* always keep as last */
+
+ #define XE_GT_SRIOV_NUM_STATES (XE_GT_SRIOV_STATE_MISMATCH + 1)

>  };
>  
>  /**
> @@ -83,7 +84,7 @@ enum xe_gt_sriov_control_bits {
>   */
>  struct xe_gt_sriov_control_state {
>  	/** @state: VF state bits */
> -	unsigned long state;
> +	DECLARE_BITMAP(state, XE_GT_SRIOV_STATE_MAX);
>  
>  	/** @done: completion of async operations */
>  	struct completion done;

