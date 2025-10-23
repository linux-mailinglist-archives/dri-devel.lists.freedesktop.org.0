Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6373C033ED
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 21:54:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FD2D10E128;
	Thu, 23 Oct 2025 19:54:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MhueHMdb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E225B10E126;
 Thu, 23 Oct 2025 19:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761249252; x=1792785252;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/iUwz9hErBkt/kw9y8y7oLnDijDDkujdwZ1e1nsonlg=;
 b=MhueHMdbQeixSWR9fG90BVCNpGdDFcd9CkpfBHNCOLocL02F2SOXqId4
 QcYiYjUqRtAzcEYcAD2o353o7cp2ZmqCMcHu/z7puAoV/03JVXwyomgbz
 E6xrya3AZdEQninFDM7fA5f1A7K18DVff54svmiYDFiNdzTTdK0SqtFx9
 KhoAKddiT9OqkJJA19/+N1pWKRThKD/4WBJRvI6urnQRkZGqOC7EajOpD
 Yl1EpOt65GAsdOW/xATY+1PKGPJFA68baVtq/4TZBcKcfmTUXOgDHmSle
 +hXkN6YeSTEtjFgt4TvB8o+NhSz1d7oDRQu0MzewHaF+mLB2oRS2nUGHe w==;
X-CSE-ConnectionGUID: lTVm6RxqS7iMSVEH3ibHjQ==
X-CSE-MsgGUID: 3fncJK7vRka3obf9p+yCsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63578720"
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="63578720"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 12:54:12 -0700
X-CSE-ConnectionGUID: 9aapGMJKTra7X4HX8PX9QA==
X-CSE-MsgGUID: mmW5SnSnQmaInrYiLSia1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="189372929"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 12:54:11 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 12:54:10 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 12:54:10 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.31) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 12:54:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=De75YjLp/hpdSAPmTwuMRo8/p/dwsnHgaoRTHxOj31X5juX1JGgAanqEHfizOaWAgztoAC2eoMhyhxI+a9ef0bXj+QNSLkXpmuDVraOOSnRP4JG+XCruhZ/eTYPa2zJ0zOMsQUeOraHe1/YTE7QabTf1EFhJJ9z6GMko/Fq7bHHuwH52gvXuc8xrbMplzz6U0OSBCQAx0h/NbsNdNVYdt0GUMOwM6t5e+0xaUIh+9KCmakWoQw/TPNiZHdiwrIG7JtAzK3OxSOV28oMsEr6bDRmutTQdS0530yi48kg6PI8gHKUgZaLzez8VXuwELT6nG9aCdx7QQ4vt2OYuneG5EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lka8eQDSKIYsWrwOfjQYD+wT5wuYlg3z0xJRZ5L/sNM=;
 b=u1H8L5CQNo7SPD5j01M9pHQST/jsXabfd9/+LY1Rh4pe2CxOXtN+dMSIF70vD1UANXkegsGPo+cXFF5RvyGlxS5Ucf5qkt+N7lQAoNe70XByCog52uSJWaHY4gVnWRTqmyyi+/gfFd5LgizNs8viQ9E1XeGDIBYR0nlo50Uu533b+Lzoz2lLXg9SDuRIVdqlhvo2SGSYigfEUBzbGHzPc8ABUpMqjNIlFUFvb7TVGnX0ZB4+cpoqk4dH21CeBwecnbZApOa5FjTE73Lsc3cqzyTPqcPQXTsi5jX/u6Fgd3a8+vW9nibAEhzueE3ZzTp5u9KYy3gF3fFsYEpRJ8nuWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DM3PR11MB8670.namprd11.prod.outlook.com (2603:10b6:0:3d::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.13; Thu, 23 Oct 2025 19:54:09 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 19:54:08 +0000
Message-ID: <ce1b236d-f2ba-4f5a-944b-219e1cae8bd6@intel.com>
Date: Thu, 23 Oct 2025 21:54:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 22/26] drm/xe/pf: Handle VRAM migration data as part of
 PF control
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, "Alex
 Williamson" <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>
References: <20251021224133.577765-1-michal.winiarski@intel.com>
 <20251021224133.577765-23-michal.winiarski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251021224133.577765-23-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0034.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:22::16) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DM3PR11MB8670:EE_
X-MS-Office365-Filtering-Correlation-Id: 83407dc0-c965-48f5-fd70-08de126dede3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dVo2UFE2N2NkTW1tZFc1MlcwNC9TN2xEME50SXliSjFCWEFZMXB2dHQ5NWpV?=
 =?utf-8?B?Ti93dkdwN05yNHhzVjBrdTY2dWp5SGpXWktmVm5XM3ZqV2s3dE1LaDV1dFRD?=
 =?utf-8?B?UEo0Q1h2MVhJenQxc3NUcG5HZVNweUhETXRobUEzTjR4VWQ3ZjMxT1JVOWJF?=
 =?utf-8?B?UHhHMUhBQjRMTjR2UDcyZUdLZEY2VUFaMzdpYkxNcHZ0RGlwRHkvT3FYcEZn?=
 =?utf-8?B?WkFaQURSaTVnK0N3U1lDbFAyQ2REejV3WE9yVmlDVGNCKzJTdEg0WlFGZzln?=
 =?utf-8?B?czNJUjBIWlVSUFFkSHdwUFBJc1p0T2RmeFpua081M1lnbkZZbWxxem5pcDd0?=
 =?utf-8?B?dHl1NkI4dVMrWFRCL3ZTeUt1VWdPRmhUY0dvRU4ydCt1K1huVVRhSi93YytY?=
 =?utf-8?B?b2FWQ1I0NDBsT1VGbHdpU2Rla3V4MlA0RmZGNkQySytSMXVEbVdwKzd2eVFS?=
 =?utf-8?B?UWpmL09zVk9yM0g1RDZjL2loc2JYTGdkZ2taSG9LOUdTSElEa3g2Y2plVk44?=
 =?utf-8?B?ekFtc2VvL3lpeWZWOGp0ZWhlQmtBK1BwemZ1WkJPd0p4YkN6bkdaVkkySXBG?=
 =?utf-8?B?ZUxEamdOQ05WZWV2N2ZMOGVIVnd1dlRnS2pTYmpjaGFuc1htYVdDRzVRRTEw?=
 =?utf-8?B?Q2NEcVdmOFVUYXNtZjMwWG5yQzMrbitpNW9IRUVYbUxIZ3VxUGl3WHRCazlP?=
 =?utf-8?B?clZXLzJtZVNjNTFGN1dXZEVIZ2dFSEhUd1MzN2JzUWhocUVqY3FuVFQrL2ow?=
 =?utf-8?B?OG05c0RYZnh6TUtuU1dqYjdWcGZLMmFVR1J1OHZRVnRhT2YyWmRDTW5SMGpH?=
 =?utf-8?B?ZFkvVkpUQXFTbXdhc2s0WktyNHNmaUo1SkFWMlJFVmFsblMyRHE2ZFZ5VHlz?=
 =?utf-8?B?NWpIMFV4NVllL1BiYnlrNGFMaDRLU3Y1ZHE0ajh0R2hCVk1abmhldFQ1YmlG?=
 =?utf-8?B?SDZLK24rWGtJelc2UDk5d0drU0FkaWhrWWFxMGgvZ3lob0VVWVFCVHU2cERX?=
 =?utf-8?B?SVc3aFUvWFB4OWhVaG1GdFZTTnBQbjBVTGlhUFlBVWZpVUxyMiswTFJMRmNp?=
 =?utf-8?B?Z2FzeW5vL3E4d1lsWUptMVZ2SkxNZ2JyQmZRVlNqVW1MaXdQQVVKbkJBalUw?=
 =?utf-8?B?OGlVQmlSaHpuZThuYjNSRThkYlU5TTh5ZlYzRE0vUk1ocnZaellxb0krelEv?=
 =?utf-8?B?RHd0eElYTlFBek1oanc3SnhzVFFmNEtMeSt5Tm1UajlxWk04blVXbi9ma2NO?=
 =?utf-8?B?UlJseFVBSzhYL2toNmYxUTd5dEh3bVlMV1pmOG5hZU5Td3hWK1B2Nkg3UnNJ?=
 =?utf-8?B?U3VLT3h3b2dhcytlSUJWVHRkcGMraVF2cnZjZFZUbm5XdjVYU3RZOXZBSnBy?=
 =?utf-8?B?K3plVTNXTFdKTm54Z1RaS0RNMVNBcEJCZG1uRzV1NGlVUDZRS2dXOHZ6YTQ5?=
 =?utf-8?B?Tk9vdWUwTGU2d0FzbHJoRmtJYlhSaXVRYy9zMVp5OUZjb1NDaUZncEh0MmQy?=
 =?utf-8?B?a0pDT25xZDBFN2t1a3hTU1luVnAyMXdXSS90a3Q0TE11TFlrVnNpdUtuZ0hx?=
 =?utf-8?B?SU1iVVNGLzRmcXUwNzZhUjlJdnVTZkIzMFR4T1VZYlVJTUZBdXFGZzNQTjUy?=
 =?utf-8?B?QnpFZm5wcWRXb1Q3WFFlODJkdkc4RGVGMzgxcGttRkZmMXl2ZjhlSXhiU21m?=
 =?utf-8?B?amxNVjgrb2R6TU5LUHlIVUdMMUVEdVlGNEF2OHRzclpZaVUxdjZER2lleUh1?=
 =?utf-8?B?MUU1UEFmT0h6ZE1Ia210MEdCdHYvdE9nd2FKSEFSU2Eyand6NGFIeEdXWmg1?=
 =?utf-8?B?RXdRWUpBRTdFK0pPeERoTkkzNURLWEtsR2dRbTMrMjJYUzU4OTcwdEh4Nzla?=
 =?utf-8?B?b1AzYk9mSkNaSE01b3VwUDZCRmlzWVY0Si90cDFnT3R6eC9zVnZubzZXeUNI?=
 =?utf-8?B?WjUxQkVRUkpNS1JONXYxSkFwRzNaK2JLWngxMzVlNkZoUEpjOElqcCtoY1Zt?=
 =?utf-8?Q?UxRh5iKhP4st9mfJPavrPpoVxnBGWo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K25rc250U2xVZmpSOEFleldwdkhGVDRtVHdWVWhlc0RjSHYwbGdJV2dnaUpt?=
 =?utf-8?B?MWhMR0dpWlNjcjRQN3VCZDBIckJQS0RmdmxmOHZFcHlSbnBPcEdpSVdheVN2?=
 =?utf-8?B?SUJQY0FEL1lMNE5HNlBjMFVTQm5jMXBYSWM2QmpIb2VLYzl2R0gyeWNFaCt6?=
 =?utf-8?B?QkVpZHdNVzRreFBnNVNjV3ZOU085WlNPRlE2YUthMC9JZE9heC82MWRBRWlN?=
 =?utf-8?B?RjdaQmlYS1UwOWg2cVdSZU5lTXNmRU5DTUl4WkRPQ0Q0dEVReEtYMXA5QWtt?=
 =?utf-8?B?eGh3UXZOOGJUam9EdjZLOXZtYXBoZGt2emRvSmdQWHV0UmIyeFFLSzZQa0Iy?=
 =?utf-8?B?QkxSeXdtZU80YzRjVVlqeVlIM3N4cVF1NnRjZ0pIY3AzeGhvTjZ5eW9wUjJC?=
 =?utf-8?B?K1cwOXRqYWxwSjNtekpNWWpDTCtvU0p3S1ExaGtQbVorU25GU0lTQTRxcm5m?=
 =?utf-8?B?WXZmdFFDRHVlc1pMNk43S0o0VGEzUXQxV0xCSWpjazhidTR5VGRsajA4azho?=
 =?utf-8?B?cklRR2NEU0RQSlVHL0JaWWRmTHhLU1lteHQrZmIxTUpFMVJWelh1dUUxbFRq?=
 =?utf-8?B?a251WktSWGJPQ3I0bFhyMlRZR0QrMFFzaDJNZms2WW1PYndweURRbVVrYnc0?=
 =?utf-8?B?Z3ArY1BIT1Z6V01CeVZEcjdzUmJJSzhzb1J3S2w5c0dFNmNjaEdCRElkUWNQ?=
 =?utf-8?B?czl1ZjJ5MEpmRCtDZkd5RWt3WmFUY2V1OG1mZmF4Zkgwa2owMFJ4dno4TWRD?=
 =?utf-8?B?cGZxL0lXcWY1TEhiOXVFc0FRM2xZOFNCaDNoR0ZORVo1bkhORG1MOG9XYjdH?=
 =?utf-8?B?U1dydGhJMnlYNlRKZCtEVlgwRi80Ymh6MmtEUmpEVlJXRXJPUDN3NkN4ZVpy?=
 =?utf-8?B?UjJ1Qk5hS2tPSHlmU0ZlRjFyQkE5cUQyMk13NHUyY2NCOGxncHYzK3VKclFa?=
 =?utf-8?B?TzhuVkNBcGV3cS9iOGtUSXRsMGR4ZFRLUThqb1BVU3VXTVZQWm9zaFljbGV6?=
 =?utf-8?B?eE92dG4yRWJoOE9UdzJ1WUVhbTJmM0dFUkF2N0twbjZRVisxK29GU1JteFRv?=
 =?utf-8?B?RjVuZS9La0VsQ29qZTFoT2xhejBDMFF4ZEQvRGJFQVVMQmtFVUtJZjlFenEx?=
 =?utf-8?B?blRMV3BMaU1SWU1ZbDlyaUY2aFFnQmwzU2wrWkwvUHIyRkpnb0ZJNGVmVEx5?=
 =?utf-8?B?ZG42ZUR3ZjFXU3lXSzRPdlFNekZ3T3ZmL3BTeXB3R0laK290THhXTVNvUkNS?=
 =?utf-8?B?SXV0VWVsTTlubld6WEc0ZGhpYVJTUkxnTlQrZzZLQUVWL3p4NHFvckkxSzZz?=
 =?utf-8?B?Yk1Vank3QkxUSVVMUWFRNWpDMVRUNGFDSFIwcGs5dEh3dEFGTmJsdTNvMW9S?=
 =?utf-8?B?QTA2ZE9hdmtuSFVSdW5OYTdBaTI5amV2cTNhSGFxaDBrdVpMc2dFbm9LTi90?=
 =?utf-8?B?VkwzR2grNWtFRVUwWVVxTnYyQVhvekFWK1Z6d2JJSkFET0FybDNuT2d4Wjlt?=
 =?utf-8?B?NlBubm9vdHJQelI5WUsvbzNiRVUxVS9PeFZEM1FPK05mVy9ZN2UrMDZyWGhm?=
 =?utf-8?B?Z2ZNSU1QazZvQVo0UGViYzdBUkxIaklBWFdITGVYcFIzVitBMm05MW16QUJp?=
 =?utf-8?B?V3NEVm9IU0kyL1lEY1B4cjAwQ2ZkRStQQVArcWJGYzJvRHdNZGlIdStxSWF5?=
 =?utf-8?B?MnRySWNUY05OdEFNUnlCSzRsKzY0UmdGRm91Q2J5Q1grNFdyUU96eEhsUWZl?=
 =?utf-8?B?NkJ0UjRhMzAwMGQ3QlpjVkMzQ01TWGUzdlZQZU9YWVRyVWxTaFdHcDljbkNF?=
 =?utf-8?B?TXB2bWFPZXdmMUlnOVBBNnd4bStqUFZSNVZucHZoQUdhWXBQL3dZM014ZXNU?=
 =?utf-8?B?SHhTdVJxR3hvT3lNTS9KaWVCRGg0NTAzbTlBQnBpMy9CUEZ1NDFqb1VCUnNr?=
 =?utf-8?B?YitnOG9OTFN0SENjNnJxTDRDcE9OQWlDR1NCR3dSb1dTOFZHMjRnUDcyOUph?=
 =?utf-8?B?WnlZbjJLTld6RXV6TjRZUTBxcGpmR1pydHJoWk5mdUtGblNPb1hrMGg1aTI1?=
 =?utf-8?B?Y3UzVFNMR2lSNU9FKzlqeE5JcVdNeEp5YmROUFVVWWhqYXVHczlIVFdZVXJD?=
 =?utf-8?B?WEg4cW1RNXhqdnpoQThJeSsrSDFsb0R5Q1ZvOXVJN0YrZDliekhhVzRYbTlP?=
 =?utf-8?B?dnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 83407dc0-c965-48f5-fd70-08de126dede3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 19:54:08.7871 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lV138Lqxjx5kRvQCJ4WFos6do4S93tggXDxuw3Y3BmNEBFAV7ZxBlOQ0WZaO+xSEJa+vkt9m7Zm7SuNW4zKbwnec0BUNpSNmD+kuSMkW/Jo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8670
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



On 10/22/2025 12:41 AM, Michał Winiarski wrote:
> Connect the helpers to allow save and restore of VRAM migration data in
> stop_copy / resume device state.
> 
> Co-developed-by: Lukasz Laguna <lukasz.laguna@intel.com>
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   |  18 ++
>  .../gpu/drm/xe/xe_gt_sriov_pf_control_types.h |   2 +
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 222 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |   6 +
>  .../drm/xe/xe_gt_sriov_pf_migration_types.h   |   3 +
>  drivers/gpu/drm/xe/xe_sriov_pf_control.c      |   3 +
>  6 files changed, 254 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> index e7156ad3d1839..680f2de44144b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> @@ -191,6 +191,7 @@ static const char *control_bit_to_string(enum xe_gt_sriov_control_bits bit)
>  	CASE2STR(SAVE_DATA_GUC);
>  	CASE2STR(SAVE_DATA_GGTT);
>  	CASE2STR(SAVE_DATA_MMIO);
> +	CASE2STR(SAVE_DATA_VRAM);
>  	CASE2STR(SAVE_DATA_DONE);
>  	CASE2STR(SAVE_FAILED);
>  	CASE2STR(SAVED);
> @@ -832,6 +833,7 @@ static void pf_exit_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
>  		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_GGTT);
>  		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_MMIO);
>  		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE);
> +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_VRAM);
>  	}
>  }
>  
> @@ -885,6 +887,19 @@ static int pf_handle_vf_save_data(struct xe_gt *gt, unsigned int vfid)
>  		ret = xe_gt_sriov_pf_migration_mmio_save(gt, vfid);
>  		if (ret)
>  			return ret;
> +
> +		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_VRAM);
> +		return -EAGAIN;
> +	}
> +
> +	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_VRAM)) {
> +		if (xe_gt_sriov_pf_migration_vram_size(gt, vfid) > 0) {
> +			ret = xe_gt_sriov_pf_migration_vram_save(gt, vfid);
> +			if (ret == -EAGAIN)
> +				pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_VRAM);
> +			if (ret)
> +				return ret;
> +		}
>  	}
>  
>  	return 0;
> @@ -1100,6 +1115,9 @@ pf_handle_vf_restore_data(struct xe_gt *gt, unsigned int vfid)
>  	case XE_SRIOV_MIGRATION_DATA_TYPE_GUC:
>  		ret = xe_gt_sriov_pf_migration_guc_restore(gt, vfid, data);
>  		break;
> +	case XE_SRIOV_MIGRATION_DATA_TYPE_VRAM:
> +		ret = xe_gt_sriov_pf_migration_vram_restore(gt, vfid, data);
> +		break;
>  	default:
>  		xe_gt_sriov_notice(gt, "Skipping VF%u unknown data type: %d\n", vfid, data->type);
>  		break;
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> index 9dfcebd5078ac..fba10136f7cc7 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> @@ -36,6 +36,7 @@
>   * @XE_GT_SRIOV_STATE_SAVE_DATA_GUC: indicates PF needs to save VF GuC migration data.
>   * @XE_GT_SRIOV_STATE_SAVE_DATA_GGTT: indicates PF needs to save VF GGTT migration data.
>   * @XE_GT_SRIOV_STATE_SAVE_DATA_MMIO: indicates PF needs to save VF MMIO migration data.
> + * @XE_GT_SRIOV_STATE_SAVE_DATA_VRAM: indicates PF needs to save VF VRAM migration data.
>   * @XE_GT_SRIOV_STATE_SAVE_DATA_DONE: indicates that all migration data was produced by Xe.
>   * @XE_GT_SRIOV_STATE_SAVE_FAILED: indicates that VF save operation has failed.
>   * @XE_GT_SRIOV_STATE_SAVED: indicates that VF data is saved.
> @@ -82,6 +83,7 @@ enum xe_gt_sriov_control_bits {
>  	XE_GT_SRIOV_STATE_SAVE_DATA_GUC,
>  	XE_GT_SRIOV_STATE_SAVE_DATA_GGTT,
>  	XE_GT_SRIOV_STATE_SAVE_DATA_MMIO,
> +	XE_GT_SRIOV_STATE_SAVE_DATA_VRAM,
>  	XE_GT_SRIOV_STATE_SAVE_DATA_DONE,
>  	XE_GT_SRIOV_STATE_SAVE_FAILED,
>  	XE_GT_SRIOV_STATE_SAVED,
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> index 41335b15ffdbe..2c6a86d98ee31 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> @@ -17,6 +17,7 @@
>  #include "xe_gt_sriov_printk.h"
>  #include "xe_guc_buf.h"
>  #include "xe_guc_ct.h"
> +#include "xe_migrate.h"
>  #include "xe_sriov.h"
>  #include "xe_sriov_migration_data.h"
>  #include "xe_sriov_pf_migration.h"
> @@ -485,6 +486,220 @@ int xe_gt_sriov_pf_migration_mmio_restore(struct xe_gt *gt, unsigned int vfid,
>  	return pf_restore_vf_mmio_mig_data(gt, vfid, data);
>  }
>  
> +/**
> + * xe_gt_sriov_pf_migration_vram_size() - Get the size of VF VRAM migration data.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + *
> + * This function is for PF only.
> + *
> + * Return: size in bytes or a negative error code on failure.
> + */
> +ssize_t xe_gt_sriov_pf_migration_vram_size(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (gt != xe_root_mmio_gt(gt_to_xe(gt)))

probably you mean

	if (!xe_gt_is_main_type(gt))

> +		return 0;
> +
> +	return xe_gt_sriov_pf_config_get_lmem(gt, vfid);
> +}
> +
> +static struct dma_fence *__pf_save_restore_vram(struct xe_gt *gt, unsigned int vfid,
> +						struct xe_bo *vram, u64 vram_offset,
> +						struct xe_bo *sysmem, u64 sysmem_offset,
> +						size_t size, bool save)
> +{
> +	struct dma_fence *ret = NULL;
> +	struct drm_exec exec;
> +	int err;
> +
> +	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
> +	drm_exec_until_all_locked(&exec) {
> +		err = drm_exec_lock_obj(&exec, &vram->ttm.base);
> +		drm_exec_retry_on_contention(&exec);
> +		if (err) {
> +			ret = ERR_PTR(err);
> +			goto err;
> +		}
> +
> +		err = drm_exec_lock_obj(&exec, &sysmem->ttm.base);
> +		drm_exec_retry_on_contention(&exec);
> +		if (err) {
> +			ret = ERR_PTR(err);
> +			goto err;
> +		}
> +	}
> +
> +	ret = xe_migrate_vram_copy_chunk(vram, vram_offset, sysmem, sysmem_offset, size,
> +					 save ? XE_MIGRATE_COPY_TO_SRAM : XE_MIGRATE_COPY_TO_VRAM);
> +
> +err:
> +	drm_exec_fini(&exec);
> +
> +	return ret;
> +}
> +
> +static int pf_save_vram_chunk(struct xe_gt *gt, unsigned int vfid,
> +			      struct xe_bo *src_vram, u64 src_vram_offset,
> +			      size_t size)
> +{
> +	struct xe_sriov_migration_data *data;
> +	struct dma_fence *fence;
> +	int ret;
> +
> +	data = xe_sriov_migration_data_alloc(gt_to_xe(gt));
> +	if (!data)
> +		return -ENOMEM;
> +
> +	ret = xe_sriov_migration_data_init(data, gt->tile->id, gt->info.id,
> +					   XE_SRIOV_MIGRATION_DATA_TYPE_VRAM,
> +					   src_vram_offset, size);
> +	if (ret)
> +		goto fail;
> +
> +	fence = __pf_save_restore_vram(gt, vfid,
> +				       src_vram, src_vram_offset,
> +				       data->bo, 0, size, true);
> +
> +	ret = dma_fence_wait_timeout(fence, false, 5 * HZ);
> +	dma_fence_put(fence);
> +	if (!ret) {
> +		ret = -ETIME;
> +		goto fail;
> +	}
> +
> +	pf_dump_mig_data(gt, vfid, data);
> +
> +	ret = xe_gt_sriov_pf_migration_save_produce(gt, vfid, data);
> +	if (ret)
> +		goto fail;
> +
> +	return 0;
> +
> +fail:
> +	xe_sriov_migration_data_free(data);
> +	return ret;
> +}
> +
> +#define VF_VRAM_STATE_CHUNK_MAX_SIZE SZ_512M
> +static int pf_save_vf_vram_mig_data(struct xe_gt *gt, unsigned int vfid)
> +{
> +	struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, vfid);
> +	loff_t *offset = &migration->vram_save_offset;
> +	struct xe_bo *vram;
> +	size_t vram_size, chunk_size;
> +	int ret;
> +
> +	vram = xe_gt_sriov_pf_config_get_lmem_obj(gt, vfid);
> +	if (!vram)
> +		return -ENXIO;

no error message ?

> +
> +	vram_size = xe_bo_size(vram);
> +	chunk_size = min(vram_size - *offset, VF_VRAM_STATE_CHUNK_MAX_SIZE);

what if *offset > vram_size ?

> +
> +	ret = pf_save_vram_chunk(gt, vfid, vram, *offset, chunk_size);
> +	if (ret)
> +		goto fail;
> +
> +	*offset += chunk_size;
> +
> +	xe_bo_put(vram);
> +
> +	if (*offset < vram_size)
> +		return -EAGAIN;
> +
> +	return 0;
> +
> +fail:
> +	xe_bo_put(vram);
> +	xe_gt_sriov_err(gt, "Failed to save VF%u VRAM data (%pe)\n", vfid, ERR_PTR(ret));
> +	return ret;
> +}
> +
> +static int pf_restore_vf_vram_mig_data(struct xe_gt *gt, unsigned int vfid,
> +				       struct xe_sriov_migration_data *data)
> +{
> +	u64 end = data->hdr.offset + data->hdr.size;
> +	struct dma_fence *fence;
> +	struct xe_bo *vram;
> +	size_t size;
> +	int ret = 0;
> +
> +	vram = xe_gt_sriov_pf_config_get_lmem_obj(gt, vfid);
> +	if (!vram)
> +		return -ENXIO;

no error message ? other errors are reported

> +
> +	size = xe_bo_size(vram);
> +
> +	if (end > size || end < data->hdr.size) {
> +		ret = -EINVAL;
> +		goto err;
> +	}
> +
> +	pf_dump_mig_data(gt, vfid, data);
> +
> +	fence = __pf_save_restore_vram(gt, vfid, vram, data->hdr.offset,
> +				       data->bo, 0, data->hdr.size, false);
> +	ret = dma_fence_wait_timeout(fence, false, 5 * HZ);

define this timeout at least as macro (if not as helper function, as this might be platform/settings specific)

> +	dma_fence_put(fence);
> +	if (!ret) {
> +		ret = -ETIME;
> +		goto err;
> +	}
> +
> +	return 0;
> +err:
> +	xe_bo_put(vram);
> +	xe_gt_sriov_err(gt, "Failed to restore VF%u VRAM data (%pe)\n", vfid, ERR_PTR(ret));
> +	return ret;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_migration_vram_save() - Save VF VRAM migration data.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier (can't be 0)
> + *
> + * This function is for PF only.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_migration_vram_save(struct xe_gt *gt, unsigned int vfid)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	xe_gt_assert(gt, vfid != PFID);
> +	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
> +
> +	return pf_save_vf_vram_mig_data(gt, vfid);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_migration_vram_restore() - Restore VF VRAM migration data.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier (can't be 0)
> + *
> + * This function is for PF only.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_migration_vram_restore(struct xe_gt *gt, unsigned int vfid,
> +					  struct xe_sriov_migration_data *data)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	xe_gt_assert(gt, vfid != PFID);
> +	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
> +
> +	return pf_restore_vf_vram_mig_data(gt, vfid, data);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_migration_save_init() - Initialize per-GT migration related data.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier (can't be 0)
> + */
> +void xe_gt_sriov_pf_migration_save_init(struct xe_gt *gt, unsigned int vfid)
> +{
> +	pf_pick_gt_migration(gt, vfid)->vram_save_offset = 0;
> +}
> +
>  /**
>   * xe_gt_sriov_pf_migration_size() - Total size of migration data from all components within a GT.
>   * @gt: the &xe_gt
> @@ -522,6 +737,13 @@ ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid)
>  		size += sizeof(struct xe_sriov_pf_migration_hdr);
>  	total += size;
>  
> +	size = xe_gt_sriov_pf_migration_vram_size(gt, vfid);
> +	if (size < 0)
> +		return size;
> +	else if (size > 0)

"else" not needed

> +		size += sizeof(struct xe_sriov_pf_migration_hdr);
> +	total += size;
> +
>  	return total;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> index 24a233c4cd0bb..ca518eda5429f 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> @@ -27,6 +27,12 @@ ssize_t xe_gt_sriov_pf_migration_mmio_size(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_migration_mmio_save(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_migration_mmio_restore(struct xe_gt *gt, unsigned int vfid,
>  					  struct xe_sriov_migration_data *data);
> +ssize_t xe_gt_sriov_pf_migration_vram_size(struct xe_gt *gt, unsigned int vfid);
> +int xe_gt_sriov_pf_migration_vram_save(struct xe_gt *gt, unsigned int vfid);
> +int xe_gt_sriov_pf_migration_vram_restore(struct xe_gt *gt, unsigned int vfid,
> +					  struct xe_sriov_migration_data *data);
> +
> +void xe_gt_sriov_pf_migration_save_init(struct xe_gt *gt, unsigned int vfid);
>  
>  ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid);
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
> index 75d8b94cbbefb..39a940c9b0a4b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
> @@ -16,6 +16,9 @@
>  struct xe_gt_sriov_migration_data {
>  	/** @ring: queue containing VF save / restore migration data */
>  	struct ptr_ring ring;
> +
> +	/** @vram_save_offset: offset within VRAM, used for chunked VRAM save */

"last saved offset" ?
> +	loff_t vram_save_offset;
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
> index c2768848daba1..aac8ecb861545 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_control.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
> @@ -5,6 +5,7 @@
>  
>  #include "xe_device.h"
>  #include "xe_gt_sriov_pf_control.h"
> +#include "xe_gt_sriov_pf_migration.h"
>  #include "xe_sriov_migration_data.h"
>  #include "xe_sriov_pf_control.h"
>  #include "xe_sriov_printk.h"
> @@ -171,6 +172,8 @@ int xe_sriov_pf_control_trigger_save_vf(struct xe_device *xe, unsigned int vfid)
>  		return ret;
>  
>  	for_each_gt(gt, xe, id) {
> +		xe_gt_sriov_pf_migration_save_init(gt, vfid);
> +
>  		ret = xe_gt_sriov_pf_control_trigger_save_vf(gt, vfid);
>  		if (ret)
>  			return ret;

