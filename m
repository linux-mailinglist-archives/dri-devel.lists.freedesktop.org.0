Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FC4A798BA
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 01:23:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B092010E03C;
	Wed,  2 Apr 2025 23:23:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SuH2bQpA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4DF710E03C;
 Wed,  2 Apr 2025 23:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743636181; x=1775172181;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Xj+K0TTRPSBvoH7gmvR8jGAYvIuvtOXPbZVQCRP4e1M=;
 b=SuH2bQpA/xO5POCCUkbj+jhOsJac4+wwtXxZts1ElKYD/1UKmL3xf3qM
 FLt0SQ+7le2+MjEYrr1E2TTt2gSmoX8U9vaUz2FujplgOkd7Ne/VloxqP
 JnsYcthH3BkcV67/YiQ8Dk3kbs/XEbOV3X3WES8wUF9zidp3Sb6Gbx9Lu
 D6XiTMJxoa/CbGurt+UWzvQ0dtL8p5OboBiEZ1FJY6VBuHWOuP1tte74O
 /YjC/ISCwC/u4oV0+Jo4hTFJra6s0Ac3jYwECNDa5AZcYxX+oBbhjQMcw
 sdNXeMBK9oqjmgIveNcBU6nrGHukecMWKpyvytoHJsOvc0khRx/nKTRCT w==;
X-CSE-ConnectionGUID: Kf3Cg8lARHGpuOvcFPYppw==
X-CSE-MsgGUID: Xd9mTUGITWeMok8dKTINlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="56390639"
X-IronPort-AV: E=Sophos;i="6.15,183,1739865600"; d="scan'208";a="56390639"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 16:23:01 -0700
X-CSE-ConnectionGUID: v+bhIyV9TX+3E9E7M0ChCQ==
X-CSE-MsgGUID: ZEL2Dfq8Qzu3j+5kXs5L9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,183,1739865600"; d="scan'208";a="130967225"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 16:23:01 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 2 Apr 2025 16:23:00 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 2 Apr 2025 16:23:00 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 2 Apr 2025 16:23:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g69cAuSgW+y9zQafuR/MG93ndTJJ/0+J/Il/KfLoK17kusTuw+fF/CBTTFRGew0wvhPauGR0xO/qUGE/r+JPuUzK2STUeRKxvxxreIgy3ZBnukGy6zvHGmCkgaSQqWcjkATkKNslcW1Z8RQtfhRAEIxAbuMej/hStOvyJqi8NYYctekmE3Hr4mkgBfECJQZDtHoubCRxtWdFFeevkRjAuOEHBXWLAT9dTQ30PM0xwIyU/uCSZUrMW/KCCZDQSag7nfUbdoWnEU9DM2aZuIsKrKZKxLyyt9YXTHogHW/qsbaiczJvleZG19wH1GwPyQoTD6ExSzgiizMVnU+gQOfrDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yf0PH9qO70+21jbJQOBnLP0QTAUMz3gFhuynYO5BqdY=;
 b=P7RfMhzwoGeP1NRbvMiH958MS5DONfnlJaJ+QVrBYSjeAjn5a5ydfk6Ju8je60Pz6GbSok7pMEi2WvN8e/kS9IkYQba9ASAvWhk9bHZ/9XWFXqJmeuxxtvcf7nf7SqOT2akzw5p2FFlq9BrHkv+L7W5f6KNkDePKjMQRucaUWwZMmbaUVnvIJEbbqqmzEUlZ6MITDoFGE0u+YxO9OXiiKOgaTdjXeQmwivoqyn+EXmgNe/EuIGCOGHhzNKDwS3XyZAdmW9bAUlMLHUp+O26V8E6u+a4QkGHrcqmDJQySXe4AmDiiEt08mGzybNEkMvmCb7s1IfycVYDmD9x6Tp8zlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB6865.namprd11.prod.outlook.com (2603:10b6:930:5f::15)
 by CH3PR11MB8493.namprd11.prod.outlook.com (2603:10b6:610:1bc::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.48; Wed, 2 Apr
 2025 23:22:30 +0000
Received: from CY8PR11MB6865.namprd11.prod.outlook.com
 ([fe80::3918:9807:8667:3b73]) by CY8PR11MB6865.namprd11.prod.outlook.com
 ([fe80::3918:9807:8667:3b73%4]) with mapi id 15.20.8534.048; Wed, 2 Apr 2025
 23:22:30 +0000
Date: Wed, 2 Apr 2025 16:22:27 -0700
From: <ivan.briano@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <joonas.lahtinen@linux.intel.com>,
 <matthew.brost@intel.com>, <jianxun.zhang@intel.com>,
 <shuicheng.lin@intel.com>, <dri-devel@lists.freedesktop.org>,
 <Michal.Wajdeczko@intel.com>, <michal.mrozek@intel.com>,
 <raag.jadav@intel.com>, <john.c.harrison@intel.com>
Subject: Re: [PATCH v16 3/5] drm/xe/uapi: Define drm_xe_vm_get_property
Message-ID: <4wixf3hmhcu43ikzs6omjez5wo3tzkaiox2vz7gbi7qe3uru7p@xexdfeqdptdu>
References: <20250401222657.78545-1-jonathan.cavitt@intel.com>
 <20250401222657.78545-4-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250401222657.78545-4-jonathan.cavitt@intel.com>
X-ClientProxiedBy: BYAPR07CA0081.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::22) To CY8PR11MB6865.namprd11.prod.outlook.com
 (2603:10b6:930:5f::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB6865:EE_|CH3PR11MB8493:EE_
X-MS-Office365-Filtering-Correlation-Id: 8284ccef-fa0c-49cc-541e-08dd723d3d51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RZLk7+YjLlq41f5P8WgIgCifAPk2atp6OXj2lofyuHMyscKDugaq2Z+vFPQ3?=
 =?us-ascii?Q?PcR/xKYGu583iwgE3FX2hya/o95q5VTD3uTHpHNxc/D+kii+HgUdV8KJ4pz5?=
 =?us-ascii?Q?o6URG/mu2odco37q2WeZRwE6UVkXJ2sIgEte55DJS3OQeOV3Z5QVw+rFwx+O?=
 =?us-ascii?Q?4isSGYjkzaIpMmewSYX2ZWjavjY4LxKmAxeEFfv2mfTPJPyl7Dk98/gohksD?=
 =?us-ascii?Q?WqPo4L/ZOfHqyVCoKo87KyhwNya8DLI9BsHojqF3kBRN2/IB970U0ZB6Py+m?=
 =?us-ascii?Q?5/NKzY9KiEvcg1fp9gHwakZlS3P9U+rs++bw73/GJv+1BClhuyhzM0zg0g/U?=
 =?us-ascii?Q?/yU1m9sxzjj0v8OyGI6SvmfYvXlR0KQCsVcjVlIR82A+zFFQtBe1VWPN6Ldi?=
 =?us-ascii?Q?T+DrzUGLoJSgVNz3/IYVx3owkancGR9VgPMoiZBUJnz0II4go/NfCv3z5Yy3?=
 =?us-ascii?Q?kqTLLfPcr0DaasJfeyNhyKhPHkKNBGmM41u9m6RCt24yoE7/soopqv6Sohzv?=
 =?us-ascii?Q?Lqo8UjjoFTEwcpMwJXuXt4+d7WITu4r/99/9O+9UtlY00EoTa1PrVj5TNZS5?=
 =?us-ascii?Q?Dqkli4Rxkuk67SgNtoTXN+6Bp+PQVcKwUs4O6oSpeWsqvSs0w/nbFWSLSsdr?=
 =?us-ascii?Q?QeiI/JXJ2k4LMAZb53P1M3bIimETLoKTzvhftJ/pgrsrc14yNfLUK+xrPuvz?=
 =?us-ascii?Q?RwZii+Jd5B1YFwwsSFVsPmnBJPBitWTw5tfjhgz9nP937mlttz3IJd5vJh64?=
 =?us-ascii?Q?eMuaqFmLn5nlaFuJWWKiRLL/oqMc6KEiZLUNE3E5DMqMXtXXME7UcDYGyzHy?=
 =?us-ascii?Q?pZXgwHEIg0rlpoxNadwN8VoDKuVU+gA4yYq4n6S5LRLoVmGmdcT27SVjYYNR?=
 =?us-ascii?Q?NV06KMv0lwoTK8WK+6eb0DLzYHKYCVj5wXi3bHO/5U1+2Iy51sHcXgexbXA/?=
 =?us-ascii?Q?dhVGTAU2C/EMELAow6z08Z5nl+or3uD9CCa7L6oJLIBIlygNJKKgnYV8m0HT?=
 =?us-ascii?Q?rsS4dkAv31QSbGMBI6vSz/jFoR17tk2HxyvGln1FDkl1WMkyqPSamGSB59g8?=
 =?us-ascii?Q?xvIU4GW8VrXMjRKw5BDmC6DleYfn2Ye0kKUec2Diw0vcp3kgX4g0LCJEOtD1?=
 =?us-ascii?Q?ol6Zf1a5KaEHZIUk86C46+OLaiK73zOizRHKwLhprv0zFT9l8+UUyDDyn6AU?=
 =?us-ascii?Q?sGAwEEkJy67PSxMSPa2LlAo2WAq422VSvp9L21uVF3F4KCxr/V9XXheW5Cfu?=
 =?us-ascii?Q?569QqBgwDh6iSclooB82+nlnGxFbA/LIyiV7dJMg7T2vCjwhZc6azqE4z5nQ?=
 =?us-ascii?Q?s8weWLXe9TwIvNH+awCfYF7QJXewNjeooyJFvhUihZmq5AsX64UGb+srrOCw?=
 =?us-ascii?Q?7q10iuoWE4T1593dn9tsSOAqWdRC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6865.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s+0MF8heHhIT5Ts+IOy6B6ISKEmm7Xkf4m0dvcSOiet0tDcmBiiYPvfVc3Wu?=
 =?us-ascii?Q?+2W6y42o+Mlj1G3dM25xQpOdLEqvWyKo9YwuGw0+DvxvLyXX9+7ol6hc1hhR?=
 =?us-ascii?Q?jMP+1uUEg/k1NZ0+hza2gb1wlQF4DIfkzQQ4ZaODtbxBRYCuv1IdjsCFu587?=
 =?us-ascii?Q?v8Rfzs5CCdR7jjVK4zXeC1ZPSvU+J3iCmbiHXN3oZUJ/RocggnnbCyappsMn?=
 =?us-ascii?Q?qV4XnJYktoMHZbcK/PgF23imb+JJu4gPYcRVkP4UXmTriosIitRP5mIGeoUJ?=
 =?us-ascii?Q?+VAyn+XkDUsGZS3DdA0pHYJOYJgZ0tqwnN1Q8e2swO5X1Lqct4nuzUSz8U2/?=
 =?us-ascii?Q?05xL9MDfj7qr46EzEcD1/Pt6r+XWf+PKkCow7n0Fj911meL8dYbZziloG450?=
 =?us-ascii?Q?kgT7JONLeJBaLg37cvUD0rwhCUZvnOpxKCBe50BKleOTq+GI1zQJ27xp8/rm?=
 =?us-ascii?Q?jY9ET9RsTTdZ2hpuDK56S3Rc6rm+U3L8xmlUdbgwcPapn9RXtv9Vh692iZpl?=
 =?us-ascii?Q?PEnHn1s3Talfwj+RDVqMDTWsaEU+5bv9Q6XCLkBAeDkA7eETSAQkxu/PkMWB?=
 =?us-ascii?Q?xIHXa3BW2WSh/CNnYwimfnAV7c2zhzDLqfw3foZfOoMa00uVllscnTQaMltV?=
 =?us-ascii?Q?xAMi9xIu8xOqIyFUNRaKiO1cr9zwhpesnUcle5wLQIiYi7Qbq1LJDWOWzeSB?=
 =?us-ascii?Q?FBZGdcFpczJJjAcYsF5iBNMJYDnk6OQ3J8imBh7VLDtP7NZlMOkdpoeRqONA?=
 =?us-ascii?Q?0tI7PKwiDPUvUfIJROMZdj8d0YC+lyfy+zz440UV+UEE2kCHBuT5Y5ALRdjv?=
 =?us-ascii?Q?XknDk3KJhGNrpKa23MkXxXZOJnsff5zQS7rbTZ4K+02rfU2qpODoSJTwuMXt?=
 =?us-ascii?Q?zrcxjDizJOokq7uiw+ggOVNTLVKX1UmsWiI5k66qOMR/IQnlRmmS1wX2K9nd?=
 =?us-ascii?Q?nUGAzCJUJtrLdnEzJDHWuxR/GEMKwV+2T2UJCPFF8GWaS0nKYfltKvKpIGxL?=
 =?us-ascii?Q?M87vzd9yP2O1jmCf+G7k0ofeApsa7SNajNJ+HrxBt488q2v32yAjV6ZEFKC7?=
 =?us-ascii?Q?nWEuD9mkk7+0Kdk2MQnl7toCKGVsOy7YK8CHbwadT8V/CZNABs0jvudFAbky?=
 =?us-ascii?Q?NxbKJe6juhhOsv8ssZTCJwXkGBmSkHOlwlHt+NzL0Wx/GRVQrfP5q4WxG17T?=
 =?us-ascii?Q?effr4QLGM4vpTJW3bnK4dkzv1So7swP8Ys4Sj3QE8n5CvBEEm8FD2QjvVOyp?=
 =?us-ascii?Q?tuOvkybdpSix/esUStS9fZlXWiosmcSl43rCBquSt8CI1gDCo6AU0xpG/vFi?=
 =?us-ascii?Q?u+V0uhV6pMDrkg/74AXMll9egjiT8W5t/vHaXhuZmX8xuxKlE3dVde4WW1Pr?=
 =?us-ascii?Q?i7QSzCfXvYqLr1n7hNIThlvUub5qasg112bvt5bMPmlnFVp6U+/Xi7thZH1o?=
 =?us-ascii?Q?1kDdAbL5fIjZfs1zNkj8tThiXNi8PcmBKMYz55Q7G+z2bXqlU5b1HR6YKpfP?=
 =?us-ascii?Q?zT2QDrNFo1VTBWtqxABVuuo+8zIyYKK7r8T++W50LTrqjPljBp/B+R8l+8gp?=
 =?us-ascii?Q?7lZoeL4mCfhSFFAF1h+71J1BBWM4LKWpZjvq+4hu?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8284ccef-fa0c-49cc-541e-08dd723d3d51
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6865.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 23:22:30.6056 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bjQW0ohJwKgMCSs7JBlJeJWzmYoZb6KclmxRsFN+9jSOV1bLIyElQCfr23DIaMbitzhoNCH9U2dLIZPJmZiX7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8493
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

On Tue, Apr 01, 2025 at 10:26:54PM +0000, Jonathan Cavitt wrote:
> +/** struct xe_vm_fault - Describes faults for %DRM_XE_VM_GET_PROPERTY_FAULTS */
> +struct xe_vm_fault {
> +	/** @address: Address of the fault */
> +	__u64 address;
> +	/** @address_precision: Precision of faulted address */
> +	__u32 address_precision;
> +	/** @access_type: Type of address access that resulted in fault */
> +	__u8 access_type;
> +	/** @fault_type: Type of fault reported */
> +	__u8 fault_type;
> +	/** @fault_level: fault level of the fault */
> +	__u8 fault_level;
> +	/** @pad: MBZ */
> +	__u8 pad;
> +	/** @reserved: MBZ */
> +	__u64 reserved[4];
> +};

Are the possible values here documented somewhere or should be just
follow bspec for them?
