Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5C4A69CFA
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 00:58:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE0C910E266;
	Wed, 19 Mar 2025 23:58:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bVfHfpy3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02CBF10E0A5;
 Wed, 19 Mar 2025 23:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742428704; x=1773964704;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3Q2fyYZjcsJ2ckZ17pqX+/32M+wU1WEaaOUsgKivHfQ=;
 b=bVfHfpy3zKNxg60YXi7OiXTCWTiNCFJkNRwDAVDJXQExomsO3P6+OEe7
 m9Q5ZQrZI1+TKyLlVQydCQ+BhSzWrOEfYScZcazqB61p6RmvRNgUDoJsv
 loM1h5JWOn1weFp3LJfjoGEew94BjPSmFcVGqaZ6/ntkz+wE83Lha40ti
 EBju20FiS1TEzucWEPd7Cr/A/XPsW/9iTXJocUhkPspQLKpYh0N3o237P
 P0KOvFg/C719uhJue956CMPeXiyMwYQeWh+h/dO/8VEcQXrLVBTu4FXDs
 qgrVNmH5x6NPChBJhX573soSm99Q1PMlFTe/299A6gYgSjXuchN89k+h7 Q==;
X-CSE-ConnectionGUID: 13Rnhpf2TfOrds+PgrXtGw==
X-CSE-MsgGUID: fKwTxgobSPia71wm0YEUEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="43372649"
X-IronPort-AV: E=Sophos;i="6.14,260,1736841600"; d="scan'208";a="43372649"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 16:58:16 -0700
X-CSE-ConnectionGUID: AsldfSi8QfC51PXwu7F1kg==
X-CSE-MsgGUID: utOmh5PsTu+JhNTXekYpLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,260,1736841600"; d="scan'208";a="127928410"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 16:58:14 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Wed, 19 Mar 2025 16:58:15 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 19 Mar 2025 16:58:15 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 19 Mar 2025 16:58:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wNylAy5rCz9k0wPEr9Pu/aiCv1M5o5kyXf/pDBnwvzxPixNr3o8rF14RtFymc91MLojibaKpiZ2AeRzOSrgb/CatjReizWr8/NDNaKiKkFkL4MHeMEeaF7aC2t+3Qyr/htEOMTr1CRZ4DvsWrsv2eM/m6VCKVzwU4q1MX34UpyMmFQpMalUsBrUV0v7ul0CucCMEqXQs7dZNpkE+rgjjaOHf0BhGe9M/uKjnlDga/bxXxrZeU6XcLdKbBVOWz+AgrKtNveF+cx5WYHOeb299P3vUjMVLmN3jn9slPZQTk6yhdcvjpaUzpGAmfp1a9jQ9Hh58QveHHrWYUCh6sJtr0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TrPsFkPCYMhB+bj9wsWQ6ci0etuXMY6zw0xQnJyw8PQ=;
 b=ebgs5vS+xjUFHf/Sw2HtwLxkyYaqA+bjKWhfTnnhPyk3vVmknK2aJppb2lYn0NJTGbmdcvGPFM2JpxUyb09SK3pW/qFF/SKkJJcfY1pNMwuM1eKj/qr9zCpNDTYrzjkTavAsclJkeA5FjdqsiE0Gw/QfKhZ6PaJEGbyrUPKKw5XHdiHf2iVHPIQso3YmxOjsH5On1MYfi9n+OL+U4KJcaNwBvV6TY10dCxiOoBzXES08lWV+v7ZTycuJ9WtrZXRkUjSRXbVw/FT4JDBZ3oaDqkAdmWrehqmImt33tR2RkPoq5Pm/RIkvfrl1DlIRGKA9Cv+7TTag/LlCwfv5WQOtEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8707.namprd11.prod.outlook.com (2603:10b6:610:1bf::20)
 by CO1PR11MB4994.namprd11.prod.outlook.com (2603:10b6:303:91::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Wed, 19 Mar
 2025 23:58:12 +0000
Received: from CH3PR11MB8707.namprd11.prod.outlook.com
 ([fe80::24af:ac1c:2b1d:7e62]) by CH3PR11MB8707.namprd11.prod.outlook.com
 ([fe80::24af:ac1c:2b1d:7e62%3]) with mapi id 15.20.8534.034; Wed, 19 Mar 2025
 23:58:11 +0000
Message-ID: <e2600ee9-b9ed-4f5a-91e5-6df1cc20f650@intel.com>
Date: Wed, 19 Mar 2025 16:58:09 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 6/6] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <saurabhg.gupta@intel.com>, <alex.zuo@intel.com>,
 <joonas.lahtinen@linux.intel.com>, <matthew.brost@intel.com>,
 <shuicheng.lin@intel.com>, <dri-devel@lists.freedesktop.org>,
 <Michal.Wajdeczko@intel.com>, <michal.mzorek@intel.com>
References: <20250313183415.133863-1-jonathan.cavitt@intel.com>
 <20250313183415.133863-7-jonathan.cavitt@intel.com>
Content-Language: en-US
From: Jianxun Zhang <jianxun.zhang@intel.com>
In-Reply-To: <20250313183415.133863-7-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0069.namprd03.prod.outlook.com
 (2603:10b6:a03:331::14) To CH3PR11MB8707.namprd11.prod.outlook.com
 (2603:10b6:610:1bf::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8707:EE_|CO1PR11MB4994:EE_
X-MS-Office365-Filtering-Correlation-Id: 7158bfdb-98bb-483a-7c04-08dd6741e79a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZTNBQW9NZnVNd0VjV2RlQ3h6TXRaOTFTdnJSSmNnUVpqMTUwdTUxWWEzcjhv?=
 =?utf-8?B?Z3o5ODVVZGZzeG1XVnBsYWl3SWV1Z0MvajMrbUtsRE9iV2pJL3loZWowRDNv?=
 =?utf-8?B?dkRHRlRHYjkzaUlPRE0rZmNvOXBjcURGUENYMllGc1kwUUkzRCtQcCtPWUZl?=
 =?utf-8?B?YlhGMy9YdUxWVmRhN1RKcFYzdHRCNXlRNWVSOVlvR08yRlYvc0NlcjVQemhi?=
 =?utf-8?B?M0hoQ2czYVZwOFNaY0RrZzYvbE1Wa2R1RXZBTXd2bzc4SndtOUcrZTNvVVlF?=
 =?utf-8?B?R0lrODROQ3BvY0NLQzl5SnNDZkpNdy9IREJLcURhZVkwYVhWTjVPaE43VGU4?=
 =?utf-8?B?ZENPMUx6UWVkcW5KZUZzanJCZm1iY2lrZGtucEc0SmZaM3JUQXBOc05ZY24w?=
 =?utf-8?B?Zk01L0JpZnBqWDYrdGhwZ0RJNzJZTjBYRFlEOGh6b2JnRUh3VkJGWkJUa3Qx?=
 =?utf-8?B?SVFwM0ltSGgzSFhRYjVlNFdodzhuSTl3cU1lKzZOcWdRZ21MNHB5bm9uWkVJ?=
 =?utf-8?B?b2pUNHBLYUhwY25MbTBWN0VjMFNOZVNsQ0ptZUh0NTZ4OFBBM1U2ejNVTG5Z?=
 =?utf-8?B?NG5taGx4L2F4M3BhcnV4QjRmQTdCcEx0QmNvOXN4RGxkMXVLZ3kvK3lTcUl3?=
 =?utf-8?B?U0pZWU5XelBhZ042M0puaStNTFZHeTNISnZrWFNuek1wU29zMUtqVHVlNFRQ?=
 =?utf-8?B?M1dTYjBpTXp5NHkxRHdwSjF4elUrN2FqL0RIVzJOTFNUQ2UxWkxWcWIrUjhU?=
 =?utf-8?B?SS9PVlFwb0EzdlJLcng1MWhRblV3aGMyN1dDbWp2VWpJeGYyK2ljZ2w3R1U5?=
 =?utf-8?B?K1Z2N3BpenlDMWxZR2lseXZ2SEswcjdnUDlNb1BxMkxqTldMdEdFY1p0bHNZ?=
 =?utf-8?B?ZEI2SkQwRGNYWGFtRm5sMXdKZkoySHBaSlZDY1VVZ1l0L0Jla2lWdzNwOGZF?=
 =?utf-8?B?elZBZFUvUkUwRWx1TDRKZ2thNXJPUXhUeDl2aW0rMU0xL3VtSVBKUmV1MGxU?=
 =?utf-8?B?T2h3TzRNbnRidmlLYTdzZHROekZmWmhFSTV2Um1QQ2h3eE9iR3dob2dtMTRr?=
 =?utf-8?B?OUUvTmJXUlBQZjRIdFRsc01ud2dXcGY3SDVJS1czN2pxOU1MU0o0d2pWRFVW?=
 =?utf-8?B?VWFqTGZFZ08zTkQvUG44ZlVaSDhsdURVcGp1S2xPS2FCYUQ5ajR1ZXhOQm5t?=
 =?utf-8?B?U2J1Tms4SnczYXBac0N0c3FpcnBvc0FPOUJrRkpIQlE2NXpjSU95NW9vZEYz?=
 =?utf-8?B?UEdmR3gybnlVMzVEaWk3K3pzZ2docWVoOFhoUWNQbTREdXpZYVVBVFg2ZkRJ?=
 =?utf-8?B?cllVOThBRC83OHcrRmNPTDN1TThNMTRUSnFFUUJrNlQybXlUc0ZiNzNWRVpQ?=
 =?utf-8?B?VkVpTU5pL2JKSXpaOFRyd1JoK0E4b3ZDVXRFRnFvc05CZE9ZWlRHQ3hhNUt2?=
 =?utf-8?B?QlNER2srNkNFWjlEKzd2SzhaVHZRdmVuZzJ6c0ozcGRkNFV4NjdJMzdwWFJS?=
 =?utf-8?B?OG5BQ014ditZVGRQaE9BTGNsbDdjVnBqOGxWWUt4L1BUUkF6NElMZXV3b2lp?=
 =?utf-8?B?WDRCT2x4SHNOb3g2Yk1zMFpxRG9TRkErYnZ5eFRKQWdnL2VvRTdMeU9leWZ6?=
 =?utf-8?B?b1Q3T3JubEpMUmFEc1RpbTlVRmxtK3AxaS9qMXBPVGoxTW9VcVo4MC9Dc3ZF?=
 =?utf-8?B?WlNNVE1XZW5PRDZpem1QWEN0anQrUGI1Q25tQ1JLOUhkSWR2eGtOc0JKZThw?=
 =?utf-8?B?L2k4TTk5cFM5UHNTWWVIczV3OUVBOWVYZzZhYVRsK3ZxRXdIeXdNN0VKbWpG?=
 =?utf-8?B?WVNSZ1ZwSGJKaDZjaFp1UGIyQUhaTmV0dmJCRUFTdktHd2hMOTBDWjA0L1hj?=
 =?utf-8?Q?BpU472unZI2OX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8707.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFlmOHdEbC81M2UyYllFbmVZRVlNR3I2TWdSNERzWnZIaHNsQWF3b0tnV1M2?=
 =?utf-8?B?SVMrOTBLeDYwVDBsQUpqNElJTkc4Q2Rhclc0aXk1dmVWK2l0ZW5Uc2lxcmwr?=
 =?utf-8?B?d2dMRVl4cVl1ZGZUTy9CaTN5NzNKTVJ6ZE96WG1VNXpBcldaK2J3NmxzSlRv?=
 =?utf-8?B?NzI2d3RsZ04vcU01NGVZSXRRM2phalJIYlErdGJkUXdSNmdERVl3dXhIb044?=
 =?utf-8?B?NTJFSUZsZUthOUNvdm1FTWNQZWdUdERCbFBDdXpJdmZLN3pHSUR5OGd0Y0RJ?=
 =?utf-8?B?ajZ2cnlnVnI5OThTbDh2RUxWMkhvenBhT2ZtRTVmdldGMHRpcW9wYmlqVnR0?=
 =?utf-8?B?dnBoeXVwa0hCVVROUmI2RVlHNHVXRkN2NlRyamtqV01qY0QyUG8wNVdJTW4y?=
 =?utf-8?B?SUdMWGcwVW8ySVRHL3lTNzRYL3RMeGErUU9qMklhOFlkbXlVZDFtOHdUNVlE?=
 =?utf-8?B?RnJQa2JaY3dNbnpDOTdWTzc4enc0SXdJcnJPaHBGNStCWHNxeXRjVEZicnNX?=
 =?utf-8?B?RXRnRWFUSjBBbWxxaE95WEkzV2hRc2JuUXRjYzRPN1U5NCtqYUNqc0hyRVdB?=
 =?utf-8?B?UWgxdEEra2NreS9TZVFkS005Q09MamYxRTMxTWMyRlZrdmlOaHVpTEpOejhW?=
 =?utf-8?B?THR2UUNXWWxWM3JTZVJHUGFWZ1F3Q1BrcnZERjY1R3J4K1pPNS9Fa1JZV0k4?=
 =?utf-8?B?U0dXS3U5OVJTcDBxQkdlZm9QTTNlYTd6UDZmUGNvMFpTelNSNm04Wm9idjY2?=
 =?utf-8?B?bEZLNjBiRzIraUEzVENSUG8zL1NaYU52ZEw0bCtxeWlYWFp5Yjlvc1NjQVQ3?=
 =?utf-8?B?alRsVXZjSEp2U0R1OUlERnNGZEFEZWF0UGc2K2hLL3hSZ0lzak10aERwaWJs?=
 =?utf-8?B?QzFLT3FJcjU1QkxNdStycFFoeno2SytIaW00dzgwVG1yZGFZMlVVM3pDSXQx?=
 =?utf-8?B?MkpYOVF0em5SZmZHdTZ0TUNDZWZ0VmFQaC9QVjZlVTRzSHA3Qnp2aHF4YVhV?=
 =?utf-8?B?REs4RFlxRnd3dnQyRnd1ajBxSTU2SEJKTnRqNGcwR1RhLzA2OGFmMklhaUtT?=
 =?utf-8?B?RHRGekJhR0xDRG5FcmhBKy9YSVdtQVd4U3RJbk1pN2lIN0hkNHFRTHR5N2ZG?=
 =?utf-8?B?d1JMVmRTaVlEUG1YeXhQSWtTd3VlZ0tENVV2MmJnci9uY3JwYmNxREN3SHlT?=
 =?utf-8?B?bzJlU09BT2RIMkU0VE1odkNnNVBCcDBTRXowaldieUd1NHM4dWxCbnVUeXpN?=
 =?utf-8?B?MFdqOGMxUzI0RlJDS3ROOGRIR0wrZHVkV0FYbzRkRSsxTTd4NnlDZDZVc1JG?=
 =?utf-8?B?cXpUZVRiUUR2cG5PZ25nYTU3OFp2bWFaYWN3UGk1d2tRNUxtWTV0MFNVWHBR?=
 =?utf-8?B?ZFg1b21pRWNyaXN3a082MWlBczhXK1phZndEUGdDQWVhbmloUzdBQTFlY21S?=
 =?utf-8?B?YjM0ZDcyN0ROMGhQQllVN2w0MmlOUGt4RWVhd25idGtadzNxUnlBQnFlaU1m?=
 =?utf-8?B?SUliMXpzNytFLzVGWFZXVzExa2NvQjIwc2xKWXNTZzJWY3YvK1E4c2dpVi9D?=
 =?utf-8?B?RFV6alFaZ1J3WUtLV1QwMU04bVNoVVFqU0FLVFdabU5DUzhrVEdaWEJ2Mkhk?=
 =?utf-8?B?Wk1Wa0hHbk83SVcxMTdncXNRcEgwQU9BS1A1anlyb3ZZdWNjb2hTTnlpdndZ?=
 =?utf-8?B?Z3pWWXM0S0pXZVpqTVlIUFRjK2JtVXBzbStkRnBkR2l3VVF6a0IrUlZFWDVZ?=
 =?utf-8?B?bS92bWdncFlOelUwUlYrekFPRDhSL3ZESEdURkZ2b0VpejU4aVFNMnNRK3Uv?=
 =?utf-8?B?TVdmZlZKbktDYUJmY053OUFRNGIvQmNlY01MYWZoMy9VYWpEQkpwVURGYkN1?=
 =?utf-8?B?TXd5OHlaNXcrVytsTk9XaGZmWXFsc09odmU0em9SNU5TNGlaY0RtVXQ4QTZL?=
 =?utf-8?B?dXEwZEpGazhGMWd6YjBlMzlEZHY1MDJ3ZWhMeXlHd0hmcWlwVnJRa1JkWTBO?=
 =?utf-8?B?UDRKV2hXQkFDbTRHZ01Jc0wyUFpsM1FYYzFWNFJnZkJXYm9kbVRVODNUVUNx?=
 =?utf-8?B?b1lhMWJBRUhQR05QOElhTXhhMWkwRER1ZXRSZ1VHbVNPRkluN05PSjJJTnJF?=
 =?utf-8?B?THo4TnQrNVV5R05sRVhoSUVCdGtDSFZYSnZMNi9Oa0xndWtQS1k2UFZPQ3Ft?=
 =?utf-8?B?SHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7158bfdb-98bb-483a-7c04-08dd6741e79a
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8707.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 23:58:11.7300 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FTO7XpGzDmz/YrdvQgdK5TfmjU7MF70WWlRbiBlUg/kZhf/r3Bh2FFXmw/XszuSkWu0DwH6nF8EjCjP5g9MD8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4994
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



On 3/13/25 11:34, Jonathan Cavitt wrote:
> Add support for userspace to request a list of observed faults
> from a specified VM.
> 
> v2:
> - Only allow querying of failed pagefaults (Matt Brost)
> 
> v3:
> - Remove unnecessary size parameter from helper function, as it
>    is a property of the arguments. (jcavitt)
> - Remove unnecessary copy_from_user (Jainxun)
> - Set address_precision to 1 (Jainxun)
> - Report max size instead of dynamic size for memory allocation
>    purposes.  Total memory usage is reported separately.
> 
> v4:
> - Return int from xe_vm_get_property_size (Shuicheng)
> - Fix memory leak (Shuicheng)
> - Remove unnecessary size variable (jcavitt)
> 
> v5:
> - Rename ioctl to xe_vm_get_faults_ioctl (jcavitt)
> - Update fill_property_pfs to eliminate need for kzalloc (Jianxun)
> 
> v6:
> - Repair and move fill_faults break condition (Dan Carpenter)
> - Free vm after use (jcavitt)
> - Combine assertions (jcavitt)
> - Expand size check in xe_vm_get_faults_ioctl (jcavitt)
> - Remove return mask from fill_faults, as return is already -EFAULT or 0
>    (jcavitt)
> 
> v7:
> - Revert back to using xe_vm_get_property_ioctl
> - Apply better copy_to_user logic (jcavitt)
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Jainxun Zhang <jianxun.zhang@intel.com>
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c |   3 +
>   drivers/gpu/drm/xe/xe_vm.c     | 134 +++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_vm.h     |   2 +
>   3 files changed, 139 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index b2f656b2a563..74e510cb0e47 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -194,6 +194,9 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
>   	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
>   			  DRM_RENDER_ALLOW),
>   	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl, DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(XE_VM_GET_PROPERTY, xe_vm_get_property_ioctl,
> +			  DRM_RENDER_ALLOW),
> +
>   };
>   
>   static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 067a9cedcad9..521f0032d9e2 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -42,6 +42,14 @@
>   #include "xe_wa.h"
>   #include "xe_hmm.h"
>   
> +static const u16 xe_to_user_engine_class[] = {
> +	[XE_ENGINE_CLASS_RENDER] = DRM_XE_ENGINE_CLASS_RENDER,
> +	[XE_ENGINE_CLASS_COPY] = DRM_XE_ENGINE_CLASS_COPY,
> +	[XE_ENGINE_CLASS_VIDEO_DECODE] = DRM_XE_ENGINE_CLASS_VIDEO_DECODE,
> +	[XE_ENGINE_CLASS_VIDEO_ENHANCE] = DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE,
> +	[XE_ENGINE_CLASS_COMPUTE] = DRM_XE_ENGINE_CLASS_COMPUTE,
Not sure if this will be used to interpret engine_class that will be 
reported to UMD, so just a heads up. In bspec 77412 the compute engine 
class id is 5, instead of 4 as this macro defined.

There are other values so perhaps you can just report raw value of 
engine class and let UMD deals with it according to the bspec.
> +};
> +
>   static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
>   {
>   	return vm->gpuvm.r_obj;
> @@ -3551,6 +3559,132 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   	return err;
>   }
>   
> +static int xe_vm_get_property_size(struct xe_vm *vm, u32 property)
> +{
> +	int size = -EINVAL;
> +
> +	switch (property) {
> +	case DRM_XE_VM_GET_PROPERTY_FAULTS:
> +		spin_lock(&vm->faults.lock);
> +		size = vm->faults.len * sizeof(struct xe_vm_fault);
> +		spin_unlock(&vm->faults.lock);
> +		break;
> +	default:
> +		break;
> +	}
> +	return size;
> +}
> +
> +static int xe_vm_get_property_verify_size(struct xe_vm *vm, u32 property,
> +					  int expected, int actual)
> +{
> +	switch (property) {
> +	case DRM_XE_VM_GET_PROPERTY_FAULTS:
> +		/*
> +		 * Number of faults may increase between calls to
> +		 * xe_vm_get_property_ioctl, so just report the
> +		 * number of faults the user requests if it's less
> +		 * than or equal to the number of faults in the VM
> +		 * fault array.
> +		 */
> +		if (actual < expected)
> +			return -EINVAL;
> +		break;
> +	default:
> +		if (actual != expected)
> +			return -EINVAL;
> +		break;
> +	}
> +	return 0;
> +}
> +
> +static int fill_faults(struct xe_vm *vm,
> +		       struct drm_xe_vm_get_property *args)
> +{
> +	struct xe_vm_fault __user *usr_ptr = u64_to_user_ptr(args->data);
> +	struct xe_vm_fault store = { 0 };
> +	struct xe_vm_fault_entry *entry;
> +	int ret = 0, i = 0, count;
> +
> +	count = args->size / sizeof(struct xe_vm_fault);
> +
> +	spin_lock(&vm->faults.lock);
> +	list_for_each_entry(entry, &vm->faults.list, list) {
> +		if (i++ == count)
> +			break;
> +
> +		memset(&store, 0, sizeof(struct xe_vm_fault));
> +
> +		store.address = entry->address;
> +		store.address_type = entry->address_type;
> +		store.address_precision = entry->address_precision;
> +		store.fault_level = entry->fault_level;
> +		store.engine_class = xe_to_user_engine_class[entry->engine_class];
> +		store.engine_instance = entry->engine_instance;
> +
> +		ret = copy_to_user(usr_ptr, &store, sizeof(struct xe_vm_fault));
> +		if (ret)
> +			break;
> +
> +		usr_ptr++;
> +	}
> +	spin_unlock(&vm->faults.lock);
> +
> +	return ret;
> +}
> +
> +static int xe_vm_get_property_fill_data(struct xe_vm *vm,
> +					struct drm_xe_vm_get_property *args)
> +{
> +	switch (args->property) {
> +	case DRM_XE_VM_GET_PROPERTY_FAULTS:
> +		return fill_faults(vm, args);
> +	default:
> +		break;
> +	}
> +	return -EINVAL;
> +}
> +
> +int xe_vm_get_property_ioctl(struct drm_device *drm, void *data,
> +			     struct drm_file *file)
> +{
> +	struct xe_device *xe = to_xe_device(drm);
> +	struct xe_file *xef = to_xe_file(file);
> +	struct drm_xe_vm_get_property *args = data;
> +	struct xe_vm *vm;
> +	int size, ret = 0;
> +
> +	if (XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> +		return -EINVAL;
> +
> +	vm = xe_vm_lookup(xef, args->vm_id);
> +	if (XE_IOCTL_DBG(xe, !vm))
> +		return -ENOENT;
> +
> +	size = xe_vm_get_property_size(vm, args->property);
> +
> +	if (size < 0) {
> +		ret = size;
> +		goto put_vm;
> +	} else if (!args->size) {
> +		args->size = size;
> +		goto put_vm;
> +	}
> +
> +	ret = xe_vm_get_property_verify_size(vm, args->property,
> +					     args->size, size);
> +	if (XE_IOCTL_DBG(xe, ret)) {
> +		ret = -EINVAL;
> +		goto put_vm;
> +	}
> +
> +	ret = xe_vm_get_property_fill_data(vm, args);
> +
> +put_vm:
> +	xe_vm_put(vm);
> +	return ret;
> +}
> +
>   /**
>    * xe_vm_bind_kernel_bo - bind a kernel BO to a VM
>    * @vm: VM to bind the BO to
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 9bd7e93824da..63ec22458e04 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -196,6 +196,8 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
>   			struct drm_file *file);
>   int xe_vm_bind_ioctl(struct drm_device *dev, void *data,
>   		     struct drm_file *file);
> +int xe_vm_get_property_ioctl(struct drm_device *dev, void *data,
> +			     struct drm_file *file);
>   
>   void xe_vm_close_and_put(struct xe_vm *vm);
>   

