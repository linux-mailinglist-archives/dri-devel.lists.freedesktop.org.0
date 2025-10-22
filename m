Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F2ABFE6C5
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 00:35:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6CB710E858;
	Wed, 22 Oct 2025 22:35:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hcNrU3QH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5F1210E1B9;
 Wed, 22 Oct 2025 22:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761172500; x=1792708500;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=noWPzJcsUnwroScrXviGTrhVdeyG6/B2ogny4Seq0CI=;
 b=hcNrU3QHtHFzvqzzNEf2JoUOIVoNI+3jxSWZiMqTfI+boYu/Sj/rN2tP
 t1BO9WzmE8dUQ3/ob2rij1c28BPXaAC2cyR1PxW8+nI9ouAxcr3tb8sX/
 ZYKbYLGhn8wUDgp43bza+xPXpT47sll4unXe+PVq6kmQdbrWH+XHgEhjH
 Ez1Ko0tGIgp2YaL77ogjs3s/8tyxYFCFCLw5fig1WJ7qCBlZzTqD2qbMY
 iP0IUmcH3Svu5EPFa7esAMwyXkcKAxO4oClN1RrqjSJlSoNskjza8Cvas
 2yZntw1g+WNwEysF6IZfjQ+2zXHGbw8d3I/FvYatI9JXrbZW9BI+tA4yC Q==;
X-CSE-ConnectionGUID: vxf7AdiWSn2zODaF5KcwBQ==
X-CSE-MsgGUID: Rrd6Xt9mQkejJZYavn+bpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80770988"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="80770988"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 15:35:00 -0700
X-CSE-ConnectionGUID: EF+6HGn4S0uQWhZPZMTcNA==
X-CSE-MsgGUID: 8ocVPeoUSfGkIU5uVQzX6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="183580511"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 15:34:59 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 15:34:59 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 15:34:59 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.17) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 15:34:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CLPc30xOUW/o9Ci4mxNF9O4FnpC9LSlKDftM97AKoWoilglD7kf38sWVqSQOS92o+OYVRLtHd/P2OHxr65MJhsMD2uFDuSfwqQSJUSR3z65YujCDEPvCH09ZPTmErZczJKuiZnfNSkxMrlI8o+SwkXntHVEMsm0TEgVPDWPvNQmo7ReusDPExEzi2c2g3UioFHviOwP3ggTLQ3C5EM6P95yUjLOawpYMK06cMfoOvTNcdXiYwatcMJPnvNElxnshBwzZJI6twsXObC+OBEoTem16KMS/wbEy2kN9xAuI/KXbp/zF6Z+cocBTWg/Zzf1S5c3ERFaqkWkyPvmwoTXVOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pt+nYCEBdnCIxzApKOoXYveF48zW8EBmNxa03C4zwPo=;
 b=IgMA4ybNj1jHnxTvsPoCU+RCTZPXDZSo1pFMtPmlqeprnJM2GT1iGM60j4WnYOvMw35XJBHbaBD6YRLs4ZGoF7VTtfcW/SM0PlfZ9OU4h7xBFx8pj6ad/gW6FxHdS8S2G9YCTopkarX0dE9WuFzYFyMNsoLQ8+FYwV0C2PFw+aV9VYHbEucCVvW8rGTslDAKOpDsgsyI+41fzWI4ya1d6Jafs17BaBUUPUcWfFmKHLwvwRXmePpp3udnWh5JFmJE8EMnAAXi4rbQaLkXZskOOXYIbirTtzeW2iZj5TlzXUHU0OaGQf9nGXLgK6z+He7N5ikwD+d/SwRGtVPLAIruiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MW4PR11MB7032.namprd11.prod.outlook.com (2603:10b6:303:227::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 22:34:55 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 22:34:55 +0000
Message-ID: <0c76e7a9-c6db-4148-bd9e-a96fcd01247f@intel.com>
Date: Thu, 23 Oct 2025 00:34:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/26] drm/xe/pf: Add support for encap/decap of
 bitstream to/from packet
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
 <20251021224133.577765-7-michal.winiarski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251021224133.577765-7-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:26::9) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MW4PR11MB7032:EE_
X-MS-Office365-Filtering-Correlation-Id: 24c16fd7-aa45-45fa-346f-08de11bb395c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QmJJY0NSTDZuQ3ZsYi9uZlFPTGpuTmloVHd3M0FSS0FHMXZVU1hDYXZqZGhZ?=
 =?utf-8?B?eFhIQ1pSQi9EaytsakphNnFNdWVUNEZEak1ucDdnVzFCYU5Wa3RpVk53VkJV?=
 =?utf-8?B?ZlYwdnVKL1pBQi9TRlk3aGV2Q0poT05NVVJwYWFSTnZvQ2djRm8zTURzVnVv?=
 =?utf-8?B?Q0FaNWs5UzNVU1NQK0h5ZUZmL0Zqb0NFUndkS1lhY1g3WGxwQW9oUjBrb1Zj?=
 =?utf-8?B?cXlZNmt6eCtsdlcrdldLcEtXYS8xQlY1NE9yZU5iV1Q0Q0I0azVGcHg4d2p3?=
 =?utf-8?B?OGxxb0l6cVQ0WVlkbUIxOHZWOVJHNjJiRjN1WVkwR3NRTWJ6MU5sb1VpSXZZ?=
 =?utf-8?B?TnB0eGhNYWNMUVBUSmMrYTlUR1dvTDJwVlZ5SUI0aG13UTA0UzA2dDczb2g3?=
 =?utf-8?B?RkduZWVXZk4zMWJoQ05UMmgrMWswVnMxbnVOeGJNRDVYZ2pJQ0R2cjE3M1Y5?=
 =?utf-8?B?aTlHYlowTWZFeU80OThscXE5Z3MzeU1MU2JGWFZwZWttVXB6ZThPTjFXZG1a?=
 =?utf-8?B?K2RYU2JRUlpSWFV0cTdkY0lYWDRMSmRJT0VHMUVub3pRNTAyOHBiWDVJYjRV?=
 =?utf-8?B?T3ZNWDhaVDMvVGJjblNrOWZBQ2ttOUpqQW8rV1ZxbEZ3ajdJK1lLRCt0MzBo?=
 =?utf-8?B?bTlaTFhTVDJTL0ZpaG9yb3NUMk50ZTcxYXFVZHBBOWpDd1BsS1NsVHRjWU1W?=
 =?utf-8?B?cDFHMWtSMkpreVpsSlhJdjBIbHp2ZzB4MWo2L1VaREx1d3ZIMzg3VlJFeXdl?=
 =?utf-8?B?Vjk4eW9KV2F5cnlwcFdBbEgzbzRkWENMYy8yRGlkb1lWZ3N6YzZnaTJCTk1n?=
 =?utf-8?B?LzUraHFkTkZMdjcvMkNiU25tNDEzSGp3bU1iVHNJb3pjZzdVeFV5aTYrWkJZ?=
 =?utf-8?B?eTlKV29MTElRKzFEYU5meXhHOEZVZkFKWnRVNVRvSUE5RjRZZy9tTlFJeldW?=
 =?utf-8?B?YTd0L2tXZ2gvMzhndU1uYUFKUWpYaUtzaDNETllJTXQwdHZjOW5nczJmTTlL?=
 =?utf-8?B?SUZMcGlOc2k3cGxuZDFGZEhFWTQyOGRtL29qUkovY1ZPdTJEb2tYOS93QjNl?=
 =?utf-8?B?aUUydEo1N0tob1BLdlE4aHA2WlJWbFlaYmhEanZ4RFdaTTJrQnBjKzRqYVY5?=
 =?utf-8?B?bDk2ZEIwc3dVT2h1Nk5sbGI3Sk5EenEzM1Q2aUlwUHl1WjR0c3hLSS96Q0Zy?=
 =?utf-8?B?OVlPV3VJbjR3bnk0Qk9VQWEwcEYwUVpaaElYWDZ6Wm45UEQ1Znd0c2FQUkta?=
 =?utf-8?B?S3h1SCtLQjNqWWRKcnBpc0hscE9BdFRuSDN1b2xaY0R2d3J2WFRCMU84QkZv?=
 =?utf-8?B?cktLUXVUek1VNXNoME5CaTlpaG96aWNTQ3lLQXhyWDB2WTJoUDVJMldjK3dV?=
 =?utf-8?B?SXFscEM0OHNXUEZHOVczWmt4TU9FUTBvVmpoUENKc2VOU203TnBYc21XNVNu?=
 =?utf-8?B?dU8rTVByVkZ0VmgxR0xURjBPSFJkaEpMUVZ4ekdDN2toUisycTZXck0vT3hR?=
 =?utf-8?B?cUJkRE9hejJQNnhmMGxNRHBIREdKdDdiQi9QNVFvTjdBNDZobFJqSDNCQnZ0?=
 =?utf-8?B?Q3licGtwN3VtNjUyak5vRXQxT0phQUV1NWh4V29EUUhETEw5SDlXaEd2UnRw?=
 =?utf-8?B?NTd5ZG4relJKaCsyZWNmaHhwb3lKcG4xTmNEUWlwa1dDSDJVcEdCRHJ0cVpr?=
 =?utf-8?B?Q3o0V01wTUgvakJHL2hQNnNJOGlkZ3Bod01zMVR5U1V6QTBxdDF3TkhYMTJ6?=
 =?utf-8?B?NTYrbXMxWi9LczQzK1hkNjNZTHZlS1MyeFE4a29VSElCTjBaMDZmUVFhNFpF?=
 =?utf-8?B?Ynd3UnVaamxHRUtqTkc0R243SzNaRG5ET3MxTmQwYmcrelM4WHc5Y3luT0Ji?=
 =?utf-8?B?ZkpPcGxMVXB3ZXpZVnJsZ0lpcjQrbWhaOEZ5bHNyU0ZYeFJKTkg1WnRwV0lq?=
 =?utf-8?B?b0U0OEFQQmJUUDhuVWcxYnBwTTh3MlFLa3d3ck1ZdXpDN3NOTTlONHB3R3Uw?=
 =?utf-8?Q?BbtTs8vw2XYqutNKZ37QgDDSvKCrBE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3VhbVBQV0FaZWJMSlR1M0FMd0dzTHJsckpmYlVoRStPamk2L2Q1SzZiNHdm?=
 =?utf-8?B?N3YrOEJpTjQ0c1JzL1JCRSt1VVJpWXljcVI0Z2ZvNkE0Y3RjdXF4RW05TWhD?=
 =?utf-8?B?dlhBVXczWFE1Yjg4MlpXK3RFTmdNWTI3TEQvT2xzdUFpZnhXN3pNTDRnM3Vk?=
 =?utf-8?B?Vk5HVWFuK2trUXp0UGVWa1MxUmVLa3BmMUkxeVFZNmUwNVRHY2RZVGx4Z1V6?=
 =?utf-8?B?aXJBZmJrWklneC9xaHlBVlIyVUx3RGhicTFMYVcxTWdNZkNQZGtDMVNOcDVX?=
 =?utf-8?B?bWEyMDBYeFRQa21RODM4dFFvcFRCc3QxSkI2Zll5N1RoK3dBRGk1K2E2TkFN?=
 =?utf-8?B?MHVTRTFvQ3JhV1JBV1VySjFYeVRkYTZVZS90cGtSWmVMcU0zUVBFWHNXS2Z1?=
 =?utf-8?B?MGZGd3BVL1lNeHd6bldQZHVhZnVhVkRtdUQvNk9GampZMlRZQnhaUklvbVd6?=
 =?utf-8?B?S2pBZ21TUEROYlBjMXVydGhKYkI2MDhqZm40STZmUjRsQTY1cjVFa0dGQ0oz?=
 =?utf-8?B?blNIbnNzZHppOUoxMmFpRjhqbVhYdW4yZXdWYUo3UXprcThLUzdIcHRvK0Zr?=
 =?utf-8?B?eFh2YWdOQ0NoZGFuQ2R1TWpWbEZIcytGVmNtNnczK1RtVEc3K21JeHpzSm1v?=
 =?utf-8?B?WUxEYnRXaXRGR080TnIyMkJBbisyTUJhQWdwTmtTK215cHRBVlQ2akFZYm1S?=
 =?utf-8?B?VU5NSlQ0dGZWVXlsRGFBNGhIS3RrZjJLdUx1dzRHeWJ3VjY2L0JEVHUxcU1z?=
 =?utf-8?B?RTEyYzVtU3F5bHdsL243bVRtcWYvZjlUdXpIRkJpSUFSMEJaV2d6R1kySVRS?=
 =?utf-8?B?Qmt4c0YvV1hJVGNMckNNZklMa3BqQVIzSmxpQ0szZURSRVZZS3VNTmN0L2wv?=
 =?utf-8?B?TUQ5U1crVGk3OXNGNHROZWJmdGlWQS82cGlFd2crTlBuTjhnaWRrVFVnaHNU?=
 =?utf-8?B?YzJEZlFDME1wb2w3ZmlmYXNuYjZsa0N3V1dYWFNZNlpFeHFOSlNPak9IQjl4?=
 =?utf-8?B?TVMyR0ZHNVZHZXlXY3RtNWtUSndEM2ZzUG42U25wL0lwZ1pHTUtDVHpyUVgr?=
 =?utf-8?B?VEtESXVkNjVuM3hndUZBR3RFVmp4bFVBeEtldWpOWkFDc2psOHBoUE5oMHdM?=
 =?utf-8?B?eUpaUENTTEljam15Um8vdkorMHl6bmZMeDJWajJHTDJWcXc2VXdNWWY1S2Vn?=
 =?utf-8?B?ZStKKzlFYkVtSXV5bmxTeDBTdk1jaHJFU0pIclBGYUpzU2FIaGRBMHJ4S3Vw?=
 =?utf-8?B?c3ZndlI1emp4dkZMMmxyWE0xRGQ3eFMzRE1sY3UrL2RoNDRrY0dEN3ZjOWZQ?=
 =?utf-8?B?eEtiYmxzR0VOQ2xzSUxIYWt0dmc4Ymw5TXNBK2JrM2tjSEJkZGZ0aGVQN2VY?=
 =?utf-8?B?dXZsRkRMbklra1VEdjdvY1dxNzJUUUZuZk4yb0xmUkNpdTJDdjcyOGZWdmRm?=
 =?utf-8?B?MWJuWlgxMWRweTB6V2NMSzg3L0NRa21ab1l3b2hrVlVmNG1oSGVJSGRERm5y?=
 =?utf-8?B?VDNyaFRWd211cmYxVUF3dWpnRUtaTVBpN2RZaDZSdkxrQTFUNHFhYUFBMmt3?=
 =?utf-8?B?NzB0M25RSFk5dzBsRVY5SWdOYUlRU01KZklpVDB0a1NQWXlNbTZxTFFMZGxs?=
 =?utf-8?B?U3UxbURycytoOUMrVE1hUjY2QnRaU3YrTEgxZUVGdWdrSGVCaTA4czFweUJC?=
 =?utf-8?B?YjZGZ2RmVllFR1huTkZQaVdGSmRBQVN5KzZKSmpvZkdBb0xrdmlIcjh5Nk5L?=
 =?utf-8?B?ZXlWcng1OXNrSFZUSUZaMko1dHpqUVM2VHNGN25CaUJ1akliRStLVXJFRWlM?=
 =?utf-8?B?UEdsaGRwNDdPVlp5L2R0dmREbHVCTFZ2QnN1aEtLbUdTNE5IdWMzNUE3N0w2?=
 =?utf-8?B?NTVlcm9OdVY0OEFadjdMWjZhem1SUyszcWNFT1IxZHZONWRIWXlLUXlKMFN0?=
 =?utf-8?B?aTRtY1F4SVN5VlVGVHkvRk1OeWEyakY1TjZTM2ExVVJ5OUVtamNRc1NvS1pa?=
 =?utf-8?B?aWNuSHNSYlRSN3RtS2cwV29PWFZ2QUd2Q3pXN1paaytvNm9rUFdpOGdqTmdk?=
 =?utf-8?B?VXlNRmVwa01FY2tHSStsMWhEcGc4Nm5GaktoVWVwaHR0dkxaWjIrdkQ0Tkh3?=
 =?utf-8?B?cVhOc1ZxaEhmT045WmlkVHdlN3VXc3F2SjhIL3cxbUJvclp4NTFJV2lQZVVU?=
 =?utf-8?B?MWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 24c16fd7-aa45-45fa-346f-08de11bb395c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 22:34:55.4075 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: woyF4cpEC49yGF3Xn7qAKaFyhT4LI628vpXZtoSrjwyCYRMjzvvDekakrXQbX2QQeRIOsChU6LIjJXnsSI9glV1CFYQl317ppXzqhoy6sqA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7032
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
> Add debugfs handlers for migration state and handle bitstream
> .read()/.write() to convert from bitstream to/from migration data
> packets.
> As descriptor/trailer are handled at this layer - add handling for both
> save and restore side.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sriov_migration_data.c  | 336 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_migration_data.h  |   5 +
>  drivers/gpu/drm/xe/xe_sriov_pf_control.c      |   5 +
>  drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      |  35 ++
>  drivers/gpu/drm/xe/xe_sriov_pf_migration.c    |  54 +++
>  .../gpu/drm/xe/xe_sriov_pf_migration_types.h  |   9 +
>  6 files changed, 444 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov_migration_data.c b/drivers/gpu/drm/xe/xe_sriov_migration_data.c
> index b04f9be3b7fed..4cd6c6fc9ba18 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_migration_data.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_migration_data.c
> @@ -6,6 +6,44 @@
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_sriov_migration_data.h"
> +#include "xe_sriov_pf_helpers.h"
> +#include "xe_sriov_pf_migration.h"
> +#include "xe_sriov_printk.h"
> +
> +static struct mutex *pf_migration_mutex(struct xe_device *xe, unsigned int vfid)
> +{
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +	xe_assert(xe, vfid <= xe_sriov_pf_get_totalvfs(xe));

other helpers have sep line here 

> +	return &xe->sriov.pf.vfs[vfid].migration.lock;
> +}
> +
> +static struct xe_sriov_migration_data **pf_pick_pending(struct xe_device *xe, unsigned int vfid)
> +{
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +	xe_assert(xe, vfid <= xe_sriov_pf_get_totalvfs(xe));
> +	lockdep_assert_held(pf_migration_mutex(xe, vfid));
> +
> +	return &xe->sriov.pf.vfs[vfid].migration.pending;
> +}
> +
> +static struct xe_sriov_migration_data **
> +pf_pick_descriptor(struct xe_device *xe, unsigned int vfid)
> +{
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +	xe_assert(xe, vfid <= xe_sriov_pf_get_totalvfs(xe));
> +	lockdep_assert_held(pf_migration_mutex(xe, vfid));
> +
> +	return &xe->sriov.pf.vfs[vfid].migration.descriptor;
> +}
> +
> +static struct xe_sriov_migration_data **pf_pick_trailer(struct xe_device *xe, unsigned int vfid)
> +{
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +	xe_assert(xe, vfid <= xe_sriov_pf_get_totalvfs(xe));
> +	lockdep_assert_held(pf_migration_mutex(xe, vfid));
> +
> +	return &xe->sriov.pf.vfs[vfid].migration.trailer;
> +}
>  
>  static bool data_needs_bo(struct xe_sriov_migration_data *data)
>  {
> @@ -43,6 +81,9 @@ xe_sriov_migration_data_alloc(struct xe_device *xe)
>   */
>  void xe_sriov_migration_data_free(struct xe_sriov_migration_data *data)
>  {
> +	if (IS_ERR_OR_NULL(data))
> +		return;
> +
>  	if (data_needs_bo(data))
>  		xe_bo_unpin_map_no_vm(data->bo);
>  	else
> @@ -125,3 +166,298 @@ int xe_sriov_migration_data_init_from_hdr(struct xe_sriov_migration_data *data)
>  
>  	return mig_data_init(data);
>  }
> +
> +static ssize_t vf_mig_data_hdr_read(struct xe_sriov_migration_data *data,
> +				    char __user *buf, size_t len)
> +{
> +	loff_t offset = sizeof(data->hdr) - data->hdr_remaining;
> +
> +	if (!data->hdr_remaining)
> +		return -EINVAL;
> +
> +	if (len > data->hdr_remaining)
> +		len = data->hdr_remaining;
> +
> +	if (copy_to_user(buf, (void *)&data->hdr + offset, len))
> +		return -EFAULT;
> +
> +	data->hdr_remaining -= len;
> +
> +	return len;
> +}
> +
> +static ssize_t vf_mig_data_read(struct xe_sriov_migration_data *data,
> +				char __user *buf, size_t len)
> +{
> +	if (len > data->remaining)
> +		len = data->remaining;
> +
> +	if (copy_to_user(buf, data->vaddr + (data->size - data->remaining), len))
> +		return -EFAULT;
> +
> +	data->remaining -= len;
> +
> +	return len;
> +}
> +
> +static ssize_t __vf_mig_data_read_single(struct xe_sriov_migration_data **data,
> +					 unsigned int vfid, char __user *buf, size_t len)
> +{
> +	ssize_t copied = 0;
> +
> +	if ((*data)->hdr_remaining)
> +		copied = vf_mig_data_hdr_read(*data, buf, len);
> +	else
> +		copied = vf_mig_data_read(*data, buf, len);
> +
> +	if ((*data)->remaining == 0 && (*data)->hdr_remaining == 0) {
> +		xe_sriov_migration_data_free(*data);
> +		*data = NULL;
> +	}
> +
> +	return copied;
> +}
> +
> +static struct xe_sriov_migration_data **vf_mig_pick_data(struct xe_device *xe, unsigned int vfid)
> +{
> +	struct xe_sriov_migration_data **data;
> +
> +	data = pf_pick_descriptor(xe, vfid);
> +	if (*data)
> +		return data;
> +
> +	data = pf_pick_pending(xe, vfid);
> +	if (!*data)
> +		*data = xe_sriov_pf_migration_save_consume(xe, vfid);
> +	if (*data)
> +		return data;
> +
> +	data = pf_pick_trailer(xe, vfid);
> +	if (*data)
> +		return data;
> +
> +	return ERR_PTR(-ENODATA);
> +}
> +
> +static ssize_t vf_mig_data_read_single(struct xe_device *xe, unsigned int vfid,
> +				       char __user *buf, size_t len)
> +{
> +	struct xe_sriov_migration_data **data = vf_mig_pick_data(xe, vfid);
> +
> +	if (IS_ERR_OR_NULL(data))

vf_mig_pick_data() seems to never return NULL, so maybe just IS_ERR() ?

> +		return PTR_ERR(data);
> +
> +	return __vf_mig_data_read_single(data, vfid, buf, len);
> +}
> +
> +/**
> + * xe_sriov_migration_data_read() - Read migration data from the device.
> + * @xe: the &xe_device
> + * @vfid: the VF identifier
> + * @buf: start address of userspace buffer
> + * @len: requested read size from userspace
> + *
> + * Return: number of bytes that has been successfully read,
> + *	   0 if no more migration data is available,
> + *	   -errno on failure.
> + */
> +ssize_t xe_sriov_migration_data_read(struct xe_device *xe, unsigned int vfid,
> +				     char __user *buf, size_t len)
> +{
> +	ssize_t ret, consumed = 0;
> +
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +
> +	scoped_cond_guard(mutex_intr, return -EINTR, pf_migration_mutex(xe, vfid)) {
> +		while (consumed < len) {
> +			ret = vf_mig_data_read_single(xe, vfid, buf, len - consumed);
> +			if (ret == -ENODATA)
> +				break;
> +			if (ret < 0)
> +				return ret;
> +
> +			consumed += ret;
> +			buf += ret;
> +		}
> +	}
> +
> +	return consumed;
> +}
> +
> +static ssize_t vf_mig_hdr_write(struct xe_sriov_migration_data *data,
> +				const char __user *buf, size_t len)
> +{
> +	loff_t offset = sizeof(data->hdr) - data->hdr_remaining;
> +	int ret;
> +
> +	if (len > data->hdr_remaining)
> +		len = data->hdr_remaining;
> +
> +	if (copy_from_user((void *)&data->hdr + offset, buf, len))
> +		return -EFAULT;
> +
> +	data->hdr_remaining -= len;
> +
> +	if (!data->hdr_remaining) {
> +		ret = xe_sriov_migration_data_init_from_hdr(data);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return len;
> +}
> +
> +static ssize_t vf_mig_data_write(struct xe_sriov_migration_data *data,
> +				 const char __user *buf, size_t len)
> +{
> +	if (len > data->remaining)
> +		len = data->remaining;
> +
> +	if (copy_from_user(data->vaddr + (data->size - data->remaining), buf, len))
> +		return -EFAULT;
> +
> +	data->remaining -= len;
> +
> +	return len;
> +}
> +
> +static ssize_t vf_mig_data_write_single(struct xe_device *xe, unsigned int vfid,
> +					const char __user *buf, size_t len)
> +{
> +	struct xe_sriov_migration_data **data = pf_pick_pending(xe, vfid);
> +	int ret;
> +	ssize_t copied;
> +
> +	if (IS_ERR_OR_NULL(*data)) {
> +		*data = xe_sriov_migration_data_alloc(xe);
> +		if (!*data)
> +			return -ENOMEM;
> +	}
> +
> +	if ((*data)->hdr_remaining)
> +		copied = vf_mig_hdr_write(*data, buf, len);
> +	else
> +		copied = vf_mig_data_write(*data, buf, len);
> +
> +	if ((*data)->hdr_remaining == 0 && (*data)->remaining == 0) {
> +		ret = xe_sriov_pf_migration_restore_produce(xe, vfid, *data);
> +		if (ret) {
> +			xe_sriov_migration_data_free(*data);
> +			return ret;
> +		}
> +
> +		*data = NULL;
> +	}
> +
> +	return copied;
> +}
> +
> +/**
> + * xe_sriov_migration_data_write() - Write migration data to the device.
> + * @xe: the &xe_device
> + * @vfid: the VF identifier
> + * @buf: start address of userspace buffer
> + * @len: requested write size from userspace
> + *
> + * Return: number of bytes that has been successfully written,
> + *	   -errno on failure.
> + */
> +ssize_t xe_sriov_migration_data_write(struct xe_device *xe, unsigned int vfid,
> +				      const char __user *buf, size_t len)
> +{
> +	ssize_t ret, produced = 0;
> +
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +
> +	scoped_cond_guard(mutex_intr, return -EINTR, pf_migration_mutex(xe, vfid)) {
> +		while (produced < len) {
> +			ret = vf_mig_data_write_single(xe, vfid, buf, len - produced);
> +			if (ret < 0)
> +				return ret;
> +
> +			produced += ret;
> +			buf += ret;
> +		}
> +	}
> +
> +	return produced;
> +}
> +
> +#define MIGRATION_DESCRIPTOR_DWORDS 0
> +static size_t pf_descriptor_init(struct xe_device *xe, unsigned int vfid)
> +{
> +	struct xe_sriov_migration_data **desc = pf_pick_descriptor(xe, vfid);
> +	struct xe_sriov_migration_data *data;
> +	int ret;
> +
> +	data = xe_sriov_migration_data_alloc(xe);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	ret = xe_sriov_migration_data_init(data, 0, 0, XE_SRIOV_MIGRATION_DATA_TYPE_DESCRIPTOR,
> +					   0, MIGRATION_DESCRIPTOR_DWORDS * sizeof(u32));
> +	if (ret) {
> +		xe_sriov_migration_data_free(data);
> +		return ret;
> +	}
> +
> +	*desc = data;
> +
> +	return 0;
> +}
> +
> +static void pf_pending_init(struct xe_device *xe, unsigned int vfid)
> +{
> +	struct xe_sriov_migration_data **data = pf_pick_pending(xe, vfid);
> +
> +	*data = NULL;
> +}
> +
> +#define MIGRATION_TRAILER_SIZE 0
> +static int pf_trailer_init(struct xe_device *xe, unsigned int vfid)
> +{
> +	struct xe_sriov_migration_data **trailer = pf_pick_trailer(xe, vfid);
> +	struct xe_sriov_migration_data *data;
> +	int ret;
> +
> +	data = xe_sriov_migration_data_alloc(xe);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	ret = xe_sriov_migration_data_init(data, 0, 0, XE_SRIOV_MIGRATION_DATA_TYPE_TRAILER,
> +					   0, MIGRATION_TRAILER_SIZE);
> +	if (ret) {
> +		xe_sriov_migration_data_free(data);
> +		return ret;
> +	}
> +
> +	*trailer = data;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_sriov_migration_data_save_init() - Initialize the pending save migration data.
> + * @xe: the &xe_device
> + * @vfid: the VF identifier
> + *
> + * Return: 0 on success, -errno on failure.
> + */
> +int xe_sriov_migration_data_save_init(struct xe_device *xe, unsigned int vfid)
> +{
> +	int ret;
> +
> +	scoped_cond_guard(mutex_intr, return -EINTR, pf_migration_mutex(xe, vfid)) {
> +		ret = pf_descriptor_init(xe, vfid);
> +		if (ret)
> +			return ret;
> +
> +		ret = pf_trailer_init(xe, vfid);
> +		if (ret)
> +			return ret;
> +
> +		pf_pending_init(xe, vfid);
> +	}
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sriov_migration_data.h b/drivers/gpu/drm/xe/xe_sriov_migration_data.h
> index ef65dccddc035..5cde6e9439677 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_migration_data.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_migration_data.h
> @@ -27,5 +27,10 @@ void xe_sriov_migration_data_free(struct xe_sriov_migration_data *snapshot);
>  int xe_sriov_migration_data_init(struct xe_sriov_migration_data *data, u8 tile_id, u8 gt_id,
>  				 enum xe_sriov_migration_data_type, loff_t offset, size_t size);
>  int xe_sriov_migration_data_init_from_hdr(struct xe_sriov_migration_data *snapshot);
> +ssize_t xe_sriov_migration_data_read(struct xe_device *xe, unsigned int vfid,
> +				     char __user *buf, size_t len);
> +ssize_t xe_sriov_migration_data_write(struct xe_device *xe, unsigned int vfid,
> +				      const char __user *buf, size_t len);
> +int xe_sriov_migration_data_save_init(struct xe_device *xe, unsigned int vfid);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
> index 8d8a01faf5291..c2768848daba1 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_control.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
> @@ -5,6 +5,7 @@
>  
>  #include "xe_device.h"
>  #include "xe_gt_sriov_pf_control.h"
> +#include "xe_sriov_migration_data.h"
>  #include "xe_sriov_pf_control.h"
>  #include "xe_sriov_printk.h"
>  
> @@ -165,6 +166,10 @@ int xe_sriov_pf_control_trigger_save_vf(struct xe_device *xe, unsigned int vfid)
>  	unsigned int id;
>  	int ret;
>  
> +	ret = xe_sriov_migration_data_save_init(xe, vfid);
> +	if (ret)
> +		return ret;
> +
>  	for_each_gt(gt, xe, id) {
>  		ret = xe_gt_sriov_pf_control_trigger_save_vf(gt, vfid);
>  		if (ret)
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
> index e0e6340c49106..a9a28aec22421 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
> @@ -9,6 +9,7 @@
>  #include "xe_device.h"
>  #include "xe_device_types.h"
>  #include "xe_pm.h"
> +#include "xe_sriov_migration_data.h"
>  #include "xe_sriov_pf.h"
>  #include "xe_sriov_pf_control.h"
>  #include "xe_sriov_pf_debugfs.h"
> @@ -132,6 +133,7 @@ static void pf_populate_pf(struct xe_device *xe, struct dentry *pfdent)
>   *      /sys/kernel/debug/dri/BDF/
>   *      ├── sriov
>   *      │   ├── vf1
> + *      │   │   ├── migration_data
>   *      │   │   ├── pause
>   *      │   │   ├── reset
>   *      │   │   ├── resume
> @@ -220,6 +222,38 @@ DEFINE_VF_CONTROL_ATTRIBUTE(reset_vf);
>  DEFINE_VF_CONTROL_ATTRIBUTE_RW(save_vf);
>  DEFINE_VF_CONTROL_ATTRIBUTE_RW(restore_vf);
>  
> +static ssize_t data_write(struct file *file, const char __user *buf, size_t count, loff_t *pos)
> +{
> +	struct dentry *dent = file_dentry(file)->d_parent;
> +	struct xe_device *xe = extract_xe(dent);
> +	unsigned int vfid = extract_vfid(dent);
> +
> +	if (*pos)
> +		return -ESPIPE;
> +
> +	return xe_sriov_migration_data_write(xe, vfid, buf, count);
> +}
> +
> +static ssize_t data_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
> +{
> +	struct dentry *dent = file_dentry(file)->d_parent;
> +	struct xe_device *xe = extract_xe(dent);
> +	unsigned int vfid = extract_vfid(dent);
> +
> +	if (*ppos)
> +		return -ESPIPE;
> +
> +	return xe_sriov_migration_data_read(xe, vfid, buf, count);
> +}
> +
> +static const struct file_operations data_vf_fops = {
> +	.owner		= THIS_MODULE,
> +	.open		= simple_open,
> +	.write		= data_write,
> +	.read		= data_read,
> +	.llseek		= default_llseek,
> +};
> +
>  static void pf_populate_vf(struct xe_device *xe, struct dentry *vfdent)
>  {
>  	debugfs_create_file("pause", 0200, vfdent, xe, &pause_vf_fops);
> @@ -228,6 +262,7 @@ static void pf_populate_vf(struct xe_device *xe, struct dentry *vfdent)
>  	debugfs_create_file("reset", 0200, vfdent, xe, &reset_vf_fops);
>  	debugfs_create_file("save", 0600, vfdent, xe, &save_vf_fops);
>  	debugfs_create_file("restore", 0600, vfdent, xe, &restore_vf_fops);
> +	debugfs_create_file("migration_data", 0600, vfdent, xe, &data_vf_fops);
>  }
>  
>  static void pf_populate_with_tiles(struct xe_device *xe, struct dentry *dent, unsigned int vfid)
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> index eaf581317bdef..029e14f1ffa74 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> @@ -10,6 +10,7 @@
>  #include "xe_gt_sriov_pf_migration.h"
>  #include "xe_pm.h"
>  #include "xe_sriov.h"
> +#include "xe_sriov_migration_data.h"
>  #include "xe_sriov_pf_helpers.h"
>  #include "xe_sriov_pf_migration.h"
>  #include "xe_sriov_printk.h"
> @@ -53,6 +54,15 @@ static bool pf_check_migration_support(struct xe_device *xe)
>  	return IS_ENABLED(CONFIG_DRM_XE_DEBUG);
>  }
>  
> +static void pf_migration_cleanup(struct drm_device *dev, void *arg)
> +{
> +	struct xe_sriov_pf_migration *migration = arg;
> +
> +	xe_sriov_migration_data_free(migration->pending);
> +	xe_sriov_migration_data_free(migration->trailer);
> +	xe_sriov_migration_data_free(migration->descriptor);
> +}
> +
>  /**
>   * xe_sriov_pf_migration_init() - Initialize support for SR-IOV VF migration.
>   * @xe: the &xe_device
> @@ -62,6 +72,7 @@ static bool pf_check_migration_support(struct xe_device *xe)
>  int xe_sriov_pf_migration_init(struct xe_device *xe)
>  {
>  	unsigned int n, totalvfs;
> +	int err;
>  
>  	xe_assert(xe, IS_SRIOV_PF(xe));
>  
> @@ -73,7 +84,15 @@ int xe_sriov_pf_migration_init(struct xe_device *xe)
>  	for (n = 1; n <= totalvfs; n++) {
>  		struct xe_sriov_pf_migration *migration = pf_pick_migration(xe, n);
>  
> +		err = drmm_mutex_init(&xe->drm, &migration->lock);
> +		if (err)
> +			return err;
> +
>  		init_waitqueue_head(&migration->wq);
> +
> +		err = drmm_add_action_or_reset(&xe->drm, pf_migration_cleanup, migration);

shouldn't we use devm instead here ?

> +		if (err)
> +			return err;
>  	}
>  
>  	return 0;
> @@ -154,6 +173,36 @@ xe_sriov_pf_migration_save_consume(struct xe_device *xe, unsigned int vfid)
>  	return data;
>  }
>  
> +static int pf_handle_descriptor(struct xe_device *xe, unsigned int vfid,
> +				struct xe_sriov_migration_data *data)
> +{
> +	if (data->tile != 0 || data->gt != 0)
> +		return -EINVAL;
> +
> +	xe_sriov_migration_data_free(data);
> +
> +	return 0;
> +}
> +
> +static int pf_handle_trailer(struct xe_device *xe, unsigned int vfid,
> +			     struct xe_sriov_migration_data *data)
> +{
> +	struct xe_gt *gt;
> +	u8 gt_id;
> +
> +	if (data->tile != 0 || data->gt != 0)
> +		return -EINVAL;
> +	if (data->offset != 0 || data->size != 0 || data->buff || data->bo)
> +		return -EINVAL;
> +
> +	xe_sriov_migration_data_free(data);
> +
> +	for_each_gt(gt, xe, gt_id)
> +		xe_gt_sriov_pf_control_restore_data_done(gt, vfid);
> +
> +	return 0;
> +}
> +
>  /**
>   * xe_sriov_pf_migration_restore_produce() - Produce a VF migration data packet to the device.
>   * @xe: the &xe_device
> @@ -173,6 +222,11 @@ int xe_sriov_pf_migration_restore_produce(struct xe_device *xe, unsigned int vfi
>  
>  	xe_assert(xe, IS_SRIOV_PF(xe));
>  
> +	if (data->type == XE_SRIOV_MIGRATION_DATA_TYPE_DESCRIPTOR)
> +		return pf_handle_descriptor(xe, vfid, data);
> +	else if (data->type == XE_SRIOV_MIGRATION_DATA_TYPE_TRAILER)

no need for "else" here

> +		return pf_handle_trailer(xe, vfid, data);
> +
>  	gt = xe_device_get_gt(xe, data->gt);
>  	if (!gt || data->tile != gt->tile->id) {
>  		xe_sriov_err_ratelimited(xe, "VF%d Invalid GT - tile:%u, GT:%u\n",
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
> index 2a45ee4e3ece8..8468e5eeb6d66 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
> @@ -7,6 +7,7 @@
>  #define _XE_SRIOV_PF_MIGRATION_TYPES_H_
>  
>  #include <linux/types.h>
> +#include <linux/mutex_types.h>
>  #include <linux/wait.h>
>  
>  /**
> @@ -53,6 +54,14 @@ struct xe_sriov_migration_data {
>  struct xe_sriov_pf_migration {
>  	/** @wq: waitqueue used to avoid busy-waiting for snapshot production/consumption */
>  	wait_queue_head_t wq;
> +	/** @lock: Mutex protecting the migration data */
> +	struct mutex lock;
> +	/** @pending: currently processed data packet of VF resource */
> +	struct xe_sriov_migration_data *pending;
> +	/** @trailer: data packet used to indicate the end of stream */
> +	struct xe_sriov_migration_data *trailer;
> +	/** @descriptor: data packet containing the metadata describing the device */
> +	struct xe_sriov_migration_data *descriptor;
>  };
>  
>  #endif

