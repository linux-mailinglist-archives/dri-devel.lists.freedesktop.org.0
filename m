Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DF4A6592E
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 17:56:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D70810E431;
	Mon, 17 Mar 2025 16:56:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nqaqtpce";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A82B10E431;
 Mon, 17 Mar 2025 16:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742230582; x=1773766582;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wBH17quviB2rxgoiUfswDaA4mFxaEsPKDRmQ3h3hixo=;
 b=Nqaqtpcegzc6mP2N52lzgEajQTofaqdFxhHCkfSMasClUG6UPnRIrB+L
 cgZN3ZQKxPuLdAsLyx8SZ5Itdml/L6Ng0ag61JMVbvdDxSiV385BfzQMW
 dOt5KYw2ZNPi05wcP4mw9cayYXCpCB8NVwJ+g/27dDZw4YtdxA+Y+UOhy
 UH3/PFqznwx98prYXHlVW3ERiKJEl1qh3aFVVdJxrtWPAkSqvuSi5K/Oy
 bDCkdfQt+4yZZWY+CafJjpXHJ9gFQQYASDaaM+Y+rfD3BeJPTDK1DHfND
 QSbNMpOgbFvJq7KSax8fsZIsTWFhwJmiiIF3Qg140dctneSaezMbLk9Y+ Q==;
X-CSE-ConnectionGUID: eW7pnHYVSqu0glkU/JHWvA==
X-CSE-MsgGUID: 59tgZ0AOTQy0ZnpNF8G71w==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="42511895"
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; d="scan'208";a="42511895"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 09:56:21 -0700
X-CSE-ConnectionGUID: ZM6Ci2rZRVG0ucGeqg1HoA==
X-CSE-MsgGUID: Iu4Lg//MQHWK1aMFJ24RGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; d="scan'208";a="126180942"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Mar 2025 09:56:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 17 Mar 2025 09:56:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 17 Mar 2025 09:56:20 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 17 Mar 2025 09:56:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lE42aFZHTvYvKFG3kXSuoxEqqDSILBah1g8YBH8w9P6g6VaaEZqXuSB3LetFzUi0jaeLcrV5NCHpHPfxj+roqFZSDlBr3MsbG7F9GxquuKYItA75hl9kyJZaswamxrZz9AIov3m0f6FF8tFBShgi5lhtBhB0Ee+KeBJzYFj/ZQdjk/YswPaeY6jjw34YdseWOlWH+qdq1yeiuBYQaWKihSaLY8NWhyqqi6kWZZxPq9n2efilxnQiQiw3lqf8qM9lnn6dFp364S5d84OS3IQ2gv99scfGx5nziaAoHFRYp1On+m/+xyZqYf/qxa7MnLqLNj9NDuCmhELl3zUyVPsM8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=picwdzs8dsION8H/4YOHwJZUkz6DDs8gFMnI5W7zRdE=;
 b=IKEJbMF1YZfoJFh3AdcSga9kNK1VH1O094qhF69QYlE0yH4ZKq4Ayo2o1pPRLrAfePh8SxudmAohFI8NzHBn8zb8n1Wg2FdgWPfD/axUgKtmxUw4Uryv/yrc4gIx6k1orjE6s66Q3I415M42P4F0Wjb5u5JoReac4jM+40ast+LMpwl3MJHNpkt6gXtNj7it5maAmHjPSkz0+fHvN3br09vYC2gLy5o1zq2rEo46G8EbR5ssIEbpgNypQgLOomaLhhrbk7rGUowkxgYlvo32AC1CKDz2jblmKdC5qMWOVjHGB44XuRjJ7QKi73CR7KlZoyqtvbVDGXy3MEOHIrlfHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by SJ0PR11MB5008.namprd11.prod.outlook.com (2603:10b6:a03:2d5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 16:55:47 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695%6]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 16:55:47 +0000
Date: Mon, 17 Mar 2025 17:55:39 +0100
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
CC: <intel-gfx@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>, 
 Alan Previn <alan.previn.teres.alexis@intel.com>, Ashutosh Dixit
 <ashutosh.dixit@intel.com>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v5 2/3] drm/i915: Fix PXP cleanup missing from probe
 error rewind
Message-ID: <yuundz62i2vj4iu3khip5eekukinnkcfxcnvtj46i7qcjnrbbv@z4hgo65avx4b>
References: <20250314205202.809563-5-janusz.krzysztofik@linux.intel.com>
 <20250314205202.809563-7-janusz.krzysztofik@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250314205202.809563-7-janusz.krzysztofik@linux.intel.com>
X-ClientProxiedBy: MI2P293CA0008.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::19) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|SJ0PR11MB5008:EE_
X-MS-Office365-Filtering-Correlation-Id: c1d265d3-3fe9-4487-f95c-08dd65749059
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VXB5NytFYjh2eklENDlTbjU0R1FFV3EzVjZIUUFOTTVoRkZSbVJCUW9PaHFn?=
 =?utf-8?B?TVZjai9lSGJOdzdVNExpNDNYYTZZTkdwdkxBWnhHdzd2cDJFY2pjTnNLczJV?=
 =?utf-8?B?amlVU3I5TTdWM0FQK21FYkhhaDlCKzhnd3gyTTFPeHJQeFNHZExDM253RjJ2?=
 =?utf-8?B?SFlVaU5hS3FXbytHdDY1Q0JXVVZ2ZnRjNGoyd2FHYngya0g4RktYZFN5UUhl?=
 =?utf-8?B?ZzBrZGxCNmdudXI1bFpXeHQ3MG81MG9qZDJHOUFKNDBMVm5FZnM4S04xMW80?=
 =?utf-8?B?MEN6NVFySkgxbnFoM1hhNkFERTRWL1dRWHowbDk0d0RHeU9iTmxybTRHRE5r?=
 =?utf-8?B?YlhtUCtDbzI1OG05dUtESUVSQjFJektQc2dkZ2Z0UDVWTEhHMmhwUzNPWUhY?=
 =?utf-8?B?dWEwOWt5S3ZXVmloOU4xR1krTVhtMko5aTdGV1B4YWFpSUptaUhkS2xZSDlC?=
 =?utf-8?B?ejExam9uNEd0S09YK1BDNW81Mndjc2l5WjdVRGFmU3M5cTVSQm1qbGw3djNm?=
 =?utf-8?B?YlhkRVZIdXVHSGhkSWhaY3pTYnlsSGFGNUxpeWFvWitiNHBQUVFmdWJncDFP?=
 =?utf-8?B?QTZoWE1KdEh5WkFUajBkVkY0Ri9BWCtGMkZxWTZEa2RIekZVRU5SNlJSb2Rn?=
 =?utf-8?B?Y0ZITUloeGhVMjFJWU5xT2tManNJQmdBYlk3dFduZFYzZ3JxN0NnRmxRQ01B?=
 =?utf-8?B?ZExHWk1panhnd2VxNEdXL2U2MFZaTm9wNTc1bnpGNHpDUXpiaHZzMXFGMUVG?=
 =?utf-8?B?aUovOWdOUjBZenBuRkJTV0NGcmk5L1FOY0cxRzE0VjV3eDIxeTFFODJxMEF4?=
 =?utf-8?B?N2FtUUkvclliWXB3RTFUZ1RYa1JNR1lVSTNvY0hWdWtDV2pkUFRGak95N2JF?=
 =?utf-8?B?SG02R081YU9mSzdIYi9SZVVpajNQQUQzbHh2di9Yakt6azYvT0JmUGZOK28z?=
 =?utf-8?B?NVdEZjg5RGlWejlYcVB1NWdFRW53aTRvUlV6MC9hV3IxeGhBb3dsTkJEYUY1?=
 =?utf-8?B?RzlKRnE3alJlU3QvSXVEVDQ0Zks0a3V0ZWpPSG5BU2J4a3ZDUnBiODFoL25N?=
 =?utf-8?B?Q1VONTFQQ25hS3JKM0VtdVh0UytvTS8rWEpVdCtmcVFaTHRwWDFtWURxSEpr?=
 =?utf-8?B?dXFxdEExTmlTSjAveG5wVzIySytiSCtxTEs0YU1wYU9PWGJNdTc3UmhwZmF3?=
 =?utf-8?B?bWYyQkZtSE5FVDQ1alE3bUM3Q05BQTFnWFE4b1JyV0FwdU9HMjVZWjY1ZlRt?=
 =?utf-8?B?bjN6Rmt5eWVpMkVZYlN3UDFxTk9vYk51Z3hmY3VmbkVKa1Y1V0lkNGpDd2Va?=
 =?utf-8?B?aEthUGlub1Q5UmczeFFURWozQlBwQVlSWGZYeVRpa2hUS2hMQmJoZlBzZGtx?=
 =?utf-8?B?cGNwblpoR1dnVHpTeEZuaFU4d00weElNWlVyMVl0NHMvQ0hOYTF6YXMvUkg1?=
 =?utf-8?B?MmI1TWdHbm5XTWpMSG0yUEczWVJqY0ZSSTNsUVpwYmVzYzI4OVljMmp4VGJI?=
 =?utf-8?B?U1VUd2VkcGlXNlpqTHN6bWUxR3Y3dXBISDg2TGt3M3FrdENJU0tXMkRZcjkx?=
 =?utf-8?B?b05mLzVLc0xFeTl5K2YxTnE1T2haWjQzSnN2cHZiVkN4TVpsSWRjNnZTUWpT?=
 =?utf-8?B?cU1Pd2lnRlBZaXA5SU82UFJRZkNKKzZNWnBSUXp5SFFMa3dNc2VsVjJKT2Zx?=
 =?utf-8?B?Skg4TUlnZTNsNThUSUpxS0hFbnZmVE0zdzhDb01jWmkwc21LalpZYjFGcUd2?=
 =?utf-8?B?NlV0dDk1ZmZRV1dHTHdscUxickw3dEpncUtLTzNUSHdiOTRyRzNCdTIrcUR5?=
 =?utf-8?B?M1V3RFVianlHWVlSY25ITHlNb0VWWVd3bU1GaDMwYjBHWERtMUVGelEwOWtu?=
 =?utf-8?Q?Tmy/Iz2Wk1gvQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEV0cThCaGZjVTlYRnNNSythc1lBN0trVGtRSDZIOWVRdGhaamhxSWhCR0d4?=
 =?utf-8?B?REhjMmV5T3hBT0piaUxZZURhaGJJUDE5NXRQVVFHbHQ2MVZWUUp1a1EvZDZB?=
 =?utf-8?B?elVOL2xpdEZiRllLS2VhZ3J5b2tBZ0pCeStTdkdLajdaaXNISm9nZkEvd2Iw?=
 =?utf-8?B?WExZYjBLc0QyRG1od2RIb1JkUCs1QWJZcXRlWTFaSGsxZkdXWXgzVkpOczFD?=
 =?utf-8?B?Kys3MDdtT1YwK1QvRDc2NlBkMlFHSGJVbG93RlhvRmhFN2ZrSlRqNjg1eW94?=
 =?utf-8?B?SE9kQkdZbE16TTlETDNseDgwa2JSWExYL20zdlFxQVlXRkliU0FtT0loU2FR?=
 =?utf-8?B?Rm85MTFKbG1xL2FUYXlPbEZ5anZucDR5ODFwNUZYOVpjZS9VZXIyeFpNTURo?=
 =?utf-8?B?M0dNeVFkYUdqc3c4ODhGNzZicTVNb092MmEyaXJINEprTXduRHN4eUYzVDk4?=
 =?utf-8?B?V2IwekVKMVRQbGFpSG1wWkxsdWw0Z0U0QVpucHJoMndZTlg4cU5Xc1pQb3JM?=
 =?utf-8?B?N1VkQ085dEJsQ2J5MkIvc21pdVZWOUFOM3FNV2FvOEE2Z293anQ1OWdzVi9W?=
 =?utf-8?B?OWdqVVZ0a1FlMDdiU0ZKOFV5bXhGaU55OUovV01yZVVUR1VuNlE0UHFjK0Y3?=
 =?utf-8?B?WWxXclhGdEFFWGg0ZVo3VEFNWlJQMDVGWGx0V1hnQ1M3WndMVlJqNWZpY0k2?=
 =?utf-8?B?cExiWUxkTHpyR0c1dVZiV1dlMk9PMVpuTW5QVkZhU29rSExyUG9lNjAwM1Bw?=
 =?utf-8?B?NnNmYUcxZUtnR3VLVkMvRnllRjI5eHlqS215MkJ3MSs3VWpFQWNlQ1ZkUU1Z?=
 =?utf-8?B?ZFdFbzRYYStmSERheEVWUHpiS2dZdlNZTUx1cEJvbHFPR3orYVVTanJQdTJ1?=
 =?utf-8?B?bFBweVdtTE1HVUJDM1VVUzJYTmVUdkI1LzZHTEk1MVB6VGlhMklibmkvVjBY?=
 =?utf-8?B?bHdqa1hTTXRiK1BsTEhVTEZLWGhpSmp1NHkrTUNSbUpTbEZOci8wVkVVM0Rx?=
 =?utf-8?B?SjNaZVI5RFhXbkJhWlg4d2RrdE1Xd1E5elR0ZXR5dlR4RmdkTHhOOUJ3SHly?=
 =?utf-8?B?K254d1BTazE3L2xzQWp6REs0dmkvTDQwS3AzQ2Q0QVZoSVp1YnZjelR6WjhM?=
 =?utf-8?B?cDJkTUhzMzQrcnI2SHBLaDM2Y3piTjJCTytINFBMM2d0aS9RU3J0UDNDMVFN?=
 =?utf-8?B?UWViMjN6ams0NjZkWTdubW1CZHhiQ0xIRWJhU1IwZEZ1V0Y2ZUlxS3dNblc0?=
 =?utf-8?B?ZWRrREhTamQvWG1IL2JLWGVFNHpaTG5RQmkxVzAwZkxGczBTZEZMbmdsSW05?=
 =?utf-8?B?MDYrQ3ZVQ0VOY0FpbDY0VDhpWHh4U1Riek5wY1pwaDhmWG1ZZWJ1cVhMV1RM?=
 =?utf-8?B?d2tHcUJ4UjRzM3I4UzA0MGZwSnNmM1lkSUNuY3dGN2QwbDhhcTI2QUhUQjEw?=
 =?utf-8?B?eDJuZDB4MmVnTXNGbERuTDJmRXk3czFwdGx6SlFudThoVUVYSlY2UVBmMWtT?=
 =?utf-8?B?cFpsZUs3Wk9oVU9BaXAveVZSZUpVMnJvUXFHWldoYnNqVVRtMGIrTDJFOUJY?=
 =?utf-8?B?RUdKaWFoQ1JXLzBaRFlvQm1Pd0gxTk5xZlVISitBRXV0RUJBbFFwZTk0bjZP?=
 =?utf-8?B?Nk95eHUxWCtYbldwQ1RFNXM3KzYwWWF6cG0vOTZCdStrZU9SL05qanVkNzUz?=
 =?utf-8?B?SXZJMW9vemN2bENIbUk5T0NLZTRHZ21KOXpOQWhidXI4R3gxN0gyZWZCRUUx?=
 =?utf-8?B?QWhLRlpCZDhTd0VLUXFwY1lyd2VEN3MvenVIdGF6d1hiOC8zQUs0Qk9tVXZC?=
 =?utf-8?B?OXpLb2RrdDZZTHh1MFM1R2R0eUFzUGhOelZKeitiVDlya29yd0RsSVVCWTlx?=
 =?utf-8?B?VUpwWUxqVjlhSk95dG1pZWlrYmQxbXE3dHNUVklhYXBLcnBoQVpGaTVjMFdT?=
 =?utf-8?B?dzlyY3g4SXhhdmZuZjkrQzIrOE5SRzdwNFN4K1VNS3h4QjJCcGV5NDVDaVIx?=
 =?utf-8?B?MmRac2tZM2QySjJhWDhVOWY5MlhTbnVNdkVIQ0hWQmhtYUJQd09TODhOTGNX?=
 =?utf-8?B?MG03TWFpZmlXRlo1R0wydkp6WmdVaXVpUURmV1o0eTVXb1RHRU9vRm04QkMv?=
 =?utf-8?B?bHFKRFoyTHRtb1FSRjJmUldERXF2OW5nZVBRZy9LR2JyQ2NvcXFsQWpURXkz?=
 =?utf-8?B?YVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c1d265d3-3fe9-4487-f95c-08dd65749059
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 16:55:47.0116 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tkSas944WTKzXL1gT8K+Gmd0cd8cFJfsW+i48UjdnIXYbNo5njUQGFb2NM6pKHf66EcUFWF7NO5ykMxoS+TwBAwTF8omPmDyAl5TP9Vmhgw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5008
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

Hi Janusz,

On 2025-03-14 at 21:38:34 GMT, Janusz Krzysztofik wrote:
> Commit f67986b0119c04 ("drm/i915/pxp: Promote pxp subsystem to top-level
> of i915") added PXP initialization to driver probe path, but didn't add a
> respective PXP cleanup on probe error.  That lack of cleanup seems
> harmless as long as PXP is still unused and idle when a probe failure
> occurs and error rewind path is entered, but as soon as PXP starts
> consuming device and driver resources keeping them busy, kernel warnings
> may be triggered when cleaning up resources provided by memory regions,
> GGTT, GEM and/or VMA cache from the probe error rewind and/or module
> unload paths because of missing PXP cleanup.  That scenario was observed
> on attempts to fail the probe and enter the rewind path on injection of
> now ignored error in device registration path.
> 
> Fix it.
> 
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>

Thanks
Krzysztof
