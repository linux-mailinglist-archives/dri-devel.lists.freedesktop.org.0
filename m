Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AB4A33E1D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 12:31:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E941010EA72;
	Thu, 13 Feb 2025 11:31:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HyGQkpe3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26FF210EA67;
 Thu, 13 Feb 2025 11:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739446293; x=1770982293;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DdMOQjeaA/jxTZhdwemdExT+MwFkkeYT3EesXFjkMRI=;
 b=HyGQkpe3Vya77XFqyYAQk6b+/vywaRd+D+MnXw5zWeKXeGzgJveYBkqR
 t9rhawCa47LSgbnSmY3U5DjiiHzUlyfvhC/AciFECo4p6EDgpK3G7g+2p
 VLDNuN9Mh2r3ag9Dy8NCyioNDFbJgtKZa4mrZ5076UUEPk8HCg5nKUUqq
 vw724ZJkLWSJ6RVDUXwgt8rfj2rYCbSp6Ft+41vR8L3UZPlf+/OPECHoe
 y+riL9CLMoYHmYfn3gIFaK9dn5xod/jVg4hUBUtG1w0sqAfBIY35FTBnp
 YieL8EnoqTJ8ZGfMT0FQKH3UXghgmQfZMwH+E8YV+nlZKIrBaKBExKJqw g==;
X-CSE-ConnectionGUID: QuBBL3/9QgqjXZITHyHdlQ==
X-CSE-MsgGUID: OprH3aaNTjKCpBjJy4rCyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="40062316"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="40062316"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 03:31:33 -0800
X-CSE-ConnectionGUID: OJfOVWnNQwWKf0TP9ZPM1g==
X-CSE-MsgGUID: QN7WV/ADT1mvFd04ChEBxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="113782594"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Feb 2025 03:31:32 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 13 Feb 2025 03:31:31 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 13 Feb 2025 03:31:31 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Feb 2025 03:31:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oJrZ3C3CN5ATUZm/8AD6hqK07Fr7NeKjm+3GSqFbGTLbkDp9OSG415o1RZJ6vVP3pTtNEWyGEFafK9IjSPejF5vEmkZXcuFR1p27L8Fj4CR7yzWBnEIJdAmBk+pSF5xSzP3zhaCBcZUEd8i5YfrZNikx3sSNv1rbH8OKVY1/uh35sON3DNkvXX85HmIvsxMD3ce+hVWeHfW9aCV11RPr318xiZk394pmNH5GyCAQn4z9fTu2r+zOydHCOpPhzLWZiJ6gsQi6hH5KYpQ90XfBSUkWYz2vDqhk4pkfAPsPkbWNvhWIJCqpPFuYU4FXCC2R+CWCzPNtiZP6fMP/+fbZcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZbAoxcXr11dvHdggzmU2gGuONexnD7FjdOjvA/+Q7uw=;
 b=xSk5Ev5qLjmLXQ9dgxFa+eGrnf+ldGKWfg84NfQUjiJ/95KU7oR5b+6cOkAhSlDt4ge5TeZZJRpZsurVMPHBPfrkHA/PRa5Zt+98javizfg4tH4y8QaMkVmG4CQYos/CbsTs0B9Mxbf6m5+ztGqHi3flyX7UyaEavm5QAtlLF/b6UqKDKDzSlO1WyOtKM1lLxGK4A7bM6rQGCUZNSpeY+S4tIEChiiYMrOTLf7J63Vw6TlwSJScvzRUGLQEmGb+GyNAo4MMJg4ry26sxR3qmBiSWE18qf4A3+cC/mo4XBsLcdqkCFvRpGbI/LAb6LDoxRhhks23383G3ESao0dCmsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CH3PR11MB7794.namprd11.prod.outlook.com (2603:10b6:610:125::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.23; Thu, 13 Feb
 2025 11:31:27 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8445.013; Thu, 13 Feb 2025
 11:31:27 +0000
Message-ID: <e674cda5-63e4-4900-bcdf-615dc6f1896b@intel.com>
Date: Thu, 13 Feb 2025 17:01:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 30/32] drm/xe: Add modparam for SVM notifier size
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>
CC: <apopple@nvidia.com>, <airlied@gmail.com>,
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
References: <20250213021112.1228481-1-matthew.brost@intel.com>
 <20250213021112.1228481-31-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250213021112.1228481-31-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0001.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::14) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CH3PR11MB7794:EE_
X-MS-Office365-Filtering-Correlation-Id: bc54e659-65d9-40e8-2d1a-08dd4c21f47b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WTNUVlFkNXVYTGZNcS9pTmdLajNEeE5kWTdvbmUrUHNJS1NzNDUvcWtKMmpD?=
 =?utf-8?B?NHNOM2l0SjY3cUdBSWFGOXEvN0IrOGx2S0J1NTh6QzFuTEk5b0VpaVM1VzNH?=
 =?utf-8?B?allGY3BhbkFsYUM2SGlSZ3BMLzFUMkovaHZ2MGZpMmlnL3Fldit6RU5wbzg5?=
 =?utf-8?B?am5zMHpjTzhOMnVzQUJ4R3J1bFFxOU9lQmcybmlwMk1GOXFNQTY0cXpMaDRh?=
 =?utf-8?B?OTlHRHowUzdaL1NhNW1Idms0Z2JwZnBJWThnZFF6ZE5RR1NEc280VThSbERi?=
 =?utf-8?B?NVRlY3hnUHJnbkI3WkNSSlZmSEQwa3ZOaDNDZnV1UFl6d1lwMWl3OVIyZjBK?=
 =?utf-8?B?MmJCVEgydkZQZ1FCeEoxa2R3RTNZZ0ovcWhjRDZ3NFV6d05mWTZlM2lodE1o?=
 =?utf-8?B?cXBBcUpweG01dTBHaDRhb3paVFprcmtuYjYvWmhNbW1lM21LVzNzOExMQXVi?=
 =?utf-8?B?UmNFMFdObFNuNFV4Szh0cTFTSkNQRWpJalNkK0VwZ1FjOUZBRXlKY0FwUjZN?=
 =?utf-8?B?dXpOVlFlTHltZGpNUUtsYVB4dlRYZEVIeVF6S2lRMXRiUWFBVmlxNTV4Qmg4?=
 =?utf-8?B?ckl6U0VSSTRtZFFhSzdLdFJraXlNS29XUENFOFlZNWZGN3lyalJ1eUpKYktm?=
 =?utf-8?B?Z3BiMmxiajNVVTFXWS9XU2l0QkN4Z2M3VjBMeHpITUptSFY2YUt6bGg4Mjdk?=
 =?utf-8?B?WEdNK0xWczVmRnJWZTVEYTE2VDA4eE05UC84YW9CbGJ6L3p6V01QNXpmNEMx?=
 =?utf-8?B?MGhqc2VsMXJSYUZ1Uk5QUDRjRjUwSHBKbHlmazUwZ3dpNWNpRmJ3MGR6Zm1T?=
 =?utf-8?B?a29aSS90elpZTjNRMndUR0lGQmt4RDkyWUU2N3F6bldLSHJpcy9JWWJKd2dH?=
 =?utf-8?B?ZGNyOXpOSnhnaFl0VGtJUmpxQ1FzS2lDbDNacmNkOEtldnZHd0V2RlVkdU5B?=
 =?utf-8?B?d3BQT2ROUVNtcXc3dkVyZXZXN2dXUUlMbk5yS3MvemJ6QjJEdXhBUVJsbkN2?=
 =?utf-8?B?SWIyNlNFd1c4RWIvWVNDU1FuU0ovVUp1S0VLTGpKVGp3UmludlJHWkhnRnVi?=
 =?utf-8?B?ZkdlelRaOFdLMzNiRWJaTzJhQmZGeERoME54cWpqamppZHJ5bnJzUm5ob3lo?=
 =?utf-8?B?MytQSzZraHByL3VoN3ZJWkF0NDdhc3lvWjVvRkR2QW13TmY1T3ZWSUdaT0xp?=
 =?utf-8?B?d1NhU0hQREFCNHBqNWRSSkVoOGttN091V1I0VU1DcHlvUlpsNFhhWEZJbytZ?=
 =?utf-8?B?UnZXUjlPMlp6c1lod3N6ZG9JSW5mY1VocDY4dFBLVUE3M3BVWE1nMkxtVWhF?=
 =?utf-8?B?UDFxcTlSTjVDZXpla29jZ01VVWtKRXJCV3VHNUQvWVNkUXY2YWJFdUZJN2Z5?=
 =?utf-8?B?UVZRUW94eUtQVHlyRFRtNVZ0UndMWWpLN25Sa2JHT3JPVStpYlhZVEJtd1R5?=
 =?utf-8?B?Z0gxdzdJRDMrbVhuM0dkV0Y3L0VLUG5OVjBNanNYeEk3WDB3QmNlRTZvU3Vi?=
 =?utf-8?B?VGdXS2FnZHBtVFBscVNSQ1hLQTQ0RC95NUkxbGhrRmdqVXhUajNzbWhXLzFx?=
 =?utf-8?B?SDdjUzFoMUNNTTZpaUlwYk1RV05ZT3dKZ2VBTWZrM2YxQ0FlS1BkZjZRdjln?=
 =?utf-8?B?MEJ5SmZBR2MzdmFpdDlxc1pHbFcvYmlnM2U0cUxudU9TbEF0Ni9oRDVZQ0hO?=
 =?utf-8?B?OFNqUGtUWG1xcjl1V09SYUV4WnQxaG5XZWhqN1JTT2JGSC9rbWdMRTNJcjRR?=
 =?utf-8?B?Ui8xL2thK2tLWnV0aGp3YS8zR2lOQmVpaXd5eDlvbjBhTWpyam1mSE8rYlRt?=
 =?utf-8?B?cSs4M3ZkUTVIZEZMYUxhOENBeXA5bC9yM3VBZ2JJanRDeFlJdDNsbGIvTTBX?=
 =?utf-8?Q?25r1st8FQcw7j?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjJRcXJZeGZRSTIrUDkwYVBmSTA3RTVsVnBRaDcrUEZ2T3dyY0JMRlVpUVQz?=
 =?utf-8?B?NzlsM2l5OEQvM3lNS0duSWhzaTY4SWlzS3V4bEVwLy95SWVpcVlyRnZwN3dY?=
 =?utf-8?B?VE9PS29DVWdrS0JFcTgxRml3a3FiR1R1UllMbUs2bXlqUlVsVEYwSkhnZzZJ?=
 =?utf-8?B?QkdjYjZlemtXWTZaMDlIVU51QVZKZWVxUHZqTTliMklGTUt6WnlvUlgxVk9j?=
 =?utf-8?B?ZlpzL2RWdTl1dnQrc0NhU0JQejJ2QXNMREJoem5TTjdDd0NPb2FWTldYRU5S?=
 =?utf-8?B?TWt1WFZNUm9HbnFVT3VaOVd2RExYYkFId0dYRGdxUkJpV2RMdWY4b0lTTnNm?=
 =?utf-8?B?eDM4UW92ZEdiTjZ1S1RmdThLSm9QcG9qWjNTSExaektlVEdqNGtHRktYTnA3?=
 =?utf-8?B?dmZFZXBYRm5VU2p5QzJHSFAvQjUyV015Rm11RDJmUHVOVVhSSUIwTWYrV0pU?=
 =?utf-8?B?eGNIei9ySmZVcXdkalpSOUxtYU9WL3N0YW9iNnZnRzMzRkpUTXlSYjNmRitQ?=
 =?utf-8?B?VnFDTFBKNVcxWW1IakNKY2dqTkJsVmNHbVlnbngySThkNlZUZlRFcnBNOFRn?=
 =?utf-8?B?SnhqOVVwUXVCSTRwNkwwMFpqM2UxZ0tQVEpTdUlLci90RkhzUnN4V3NQTGFl?=
 =?utf-8?B?QURreGMybERrejF4V1hsQm5FSFNENVhkYThxUVh0ZE1lZElCUmtaNVI4OXJI?=
 =?utf-8?B?NHk3UzhCVHQzeVl6VFl0NldEbGM4aWpUV1ZnYlBBYU1ldmIvNHVEbEs4Z3pG?=
 =?utf-8?B?WGVvMEJDZW1RQ0VlWWN6dTFIYlBrV1V5b1BaUW0zZnhuZm16RVNhUG9POHJy?=
 =?utf-8?B?eWRkZ29SWGsyVnZGUk9tdkl4dUN5L0g0RWt4RDlYVDl0cUo0Tzk4WFlFOHBi?=
 =?utf-8?B?eThlcXN1YVZGei8wYW5JMmthcmVDZWxQQ21USXkzbjFFdGFDUDZxQUlHanNt?=
 =?utf-8?B?Ty9Zc3NzQTZrMGJ4cXIza1NSMFdyaE1jV0IwaEpyeUFtTEhUYXRRWElaWVBu?=
 =?utf-8?B?OXFaUzQ1MCszK1BFeFFyaHBBL3B4cUFHQjlnT21ZTVFtRE1TMDRaUWFFU2pt?=
 =?utf-8?B?cUNUdzh0L1Z2ZWhoNE1aWGRGaGNrK2YwZXVDRlJ1b0tqZE5HMVlWekRKTUJv?=
 =?utf-8?B?Ly9QWUtyMkhqdU91QXdnaTBtVWM4SmpiSzIyZVE4QUZYanNoY0hkYTMxN0R1?=
 =?utf-8?B?a1JBNUMyWk1sdk1TdzdidHJYVVA0S0dJbkJ2dW9RZGIvY1VvUzh0UlRTYUJp?=
 =?utf-8?B?eE03ZXUveFh6UVZMWUcweVQ5bWVJOEVaK1pQVXFzbkpMN2pPQjNMcitUOHY3?=
 =?utf-8?B?OWpBbVhaSHZ5QTJpUGJvcnQ5SEwvYlNHN1U5Q3dpQjFudlVleEZiRGpEMkNB?=
 =?utf-8?B?QmM4cUMvekozV0x4a0VMNUhwSXVnOUppMWxCVGlKdkZZRWI2bVZPRWIvM05u?=
 =?utf-8?B?UGVCcno4Zk9WdlE4ZTJUYUNQZTlvVFhRL1JjOVpPUjB6Z2d0bDc4ZGZWZ2w1?=
 =?utf-8?B?ZkpJLzMvb2pXNWZPci9iQStkWGFkcnVzZ3ZxdzRZcWw2TGtlbTRaQ3dFWUNv?=
 =?utf-8?B?NEgvU2F5a3FmRE1xcU90MGNLckNzNzdpeXZTM25kYXFEN0IwTG9YbHdvdDJ5?=
 =?utf-8?B?UG9ZRnBUNlNJM2E3QVY3UmN2SkJwV3RaV1ljellvV3pVRnVzNitKVGl5bGd0?=
 =?utf-8?B?R3ZyRSs5aWZZUFhpbjBuaWlBNDRqQlVrYWR5VTlQRTYreWJ5WTBSSzAxQ1A5?=
 =?utf-8?B?TGlEZS9HTTdvYk9FNlVUY3UvT1F6WWZoUmNZdUs1RUhQSVNPb3prbXNobm9P?=
 =?utf-8?B?WHBpN1VPU0NydTE3RWNoV2JjSEVuWndEVHZsSHpxc0dTd2FRZDZkdWV0N3JM?=
 =?utf-8?B?VGFmTi9reUlxU21BdVZ6WDdMa3ZmUlhkWk1JY05SeHZiZE5ZaVhCdWdBTzBN?=
 =?utf-8?B?TFNPalVvZ0h5UkMrSkc5WHhGMVhMQnphbFJzL0lUKzRINFR6WC9qbWV6OGV4?=
 =?utf-8?B?bkJoejRYTE9sTDJ3Z3ZMOHJHRnB2YnNjcXBUVGJ3aWJqaWE0REZZZFp2NW50?=
 =?utf-8?B?NEhCNTVQRTVtdFNoYmRlaFBqZWhXb1lESnNvRlI5cFEzTnpoc1ZtMWhuZVZD?=
 =?utf-8?B?cFJBVUdOa1M5OXJlaElTM3FNaXRRT1FESFl3WnpuUWkrT05ISVJKTTlNaCtH?=
 =?utf-8?Q?Gc32BstvOOcwmOFj8YWxD7o=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc54e659-65d9-40e8-2d1a-08dd4c21f47b
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 11:31:27.8638 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HcJT9XS1T8nKbaeNEzFgoFQUvQVRXMt/5c1se+1SY2kZS9kSmkLHd+wvkN9kQGF97h02ru0n67tsvYFd9kgAsMM+Ti/R1h/m22d3YbYoN1c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7794
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



On 13-02-2025 07:41, Matthew Brost wrote:
> Useful to experiment with notifier size and how it affects performance.
> 
> v3:
>   - Pull missing changes including in following patch (Thomas)
> v5:
>   - Spell out power of 2 (Thomas)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/xe/xe_module.c | 4 ++++
>   drivers/gpu/drm/xe/xe_module.h | 1 +
>   drivers/gpu/drm/xe/xe_svm.c    | 4 +++-
>   3 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index 26ec9aa02648..4fe6a33da7e3 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -25,9 +25,13 @@ struct xe_modparam xe_modparam = {
>   	.max_vfs = IS_ENABLED(CONFIG_DRM_XE_DEBUG) ? ~0 : 0,
>   #endif
>   	.wedged_mode = 1,
> +	.svm_notifier_size = 512,
>   	/* the rest are 0 by default */
>   };
>   
> +module_param_named(svm_notifier_size, xe_modparam.svm_notifier_size, uint, 0600);
> +MODULE_PARM_DESC(svm_notifier_size, "Set the svm notifier size(in MiB), must be power of 2");
> +
>   module_param_named_unsafe(force_execlist, xe_modparam.force_execlist, bool, 0444);
>   MODULE_PARM_DESC(force_execlist, "Force Execlist submission");
>   
> diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
> index 161a5e6f717f..5a3bfea8b7b4 100644
> --- a/drivers/gpu/drm/xe/xe_module.h
> +++ b/drivers/gpu/drm/xe/xe_module.h
> @@ -22,6 +22,7 @@ struct xe_modparam {
>   	unsigned int max_vfs;
>   #endif
>   	int wedged_mode;
> +	u32 svm_notifier_size;
>   };
>   
>   extern struct xe_modparam xe_modparam;
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 8fd1750b5b04..ce67f42bf4f7 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -6,6 +6,7 @@
>   #include "xe_bo.h"
>   #include "xe_gt_tlb_invalidation.h"
>   #include "xe_migrate.h"
> +#include "xe_module.h"
>   #include "xe_pt.h"
>   #include "xe_svm.h"
>   #include "xe_ttm_vram_mgr.h"
> @@ -611,7 +612,8 @@ int xe_svm_init(struct xe_vm *vm)
>   
>   	err = drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM", &vm->xe->drm,
>   			      current->mm, xe_svm_devm_owner(vm->xe), 0,
> -			      vm->size, SZ_512M, &gpusvm_ops, fault_chunk_sizes,
> +			      vm->size, xe_modparam.svm_notifier_size * SZ_1M,
> +			      &gpusvm_ops, fault_chunk_sizes,

LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   			      ARRAY_SIZE(fault_chunk_sizes));
>   	if (err)
>   		return err;

