Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9EBA0B90A
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 15:06:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C96D410E317;
	Mon, 13 Jan 2025 14:06:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="es6lMn/O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB6B010E298;
 Mon, 13 Jan 2025 14:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736777182; x=1768313182;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=v9OFqdAMch0ytmBMa7ESsQ3opelTpOK4FlhQq1CKwig=;
 b=es6lMn/O9S1gk4CnOdrzSiSzUx+se682GYaw1RZufS0l35s83v9xszX0
 Bw9VKTOikByDwMi7pu8yQ2ZsZNKispOUQzy8xPhqURYyuvqZoBcqVu3gD
 iRdSAmY27JmdpM/9kSxeafOVOtXBmyYUBWsvQ0ujLpn4OphQ8+heAxv9r
 2SDwF45W9OXYVl0xxn14MN99Cuw3Z7xBmN4sEXc732N3dQOvsM3A1b7kT
 4rC87sah7FN1z9Q59iC1m2uM4fwZWAl1+syHS3PpB/tlYDG+aYwmcV8bv
 oHEOPf76y69F1GbKWhxhwm+xRsZ+c/VkI7u6AsBZuV7ALF6qS0PAgGCEj w==;
X-CSE-ConnectionGUID: Y7SBDyjAQJeqxB5W9FALZg==
X-CSE-MsgGUID: CBtfxguWTUa6PIJksXdNbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="59526134"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="59526134"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2025 06:06:22 -0800
X-CSE-ConnectionGUID: FyO3cY2NQFWL5LehrU0JXw==
X-CSE-MsgGUID: KmXc4E1vQ4G38ILpgR7m5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="105002985"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Jan 2025 06:06:21 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 13 Jan 2025 06:06:20 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 13 Jan 2025 06:06:20 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 13 Jan 2025 06:06:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q5aYMSK29OIb8ouV74/cLQHGCzoSOOs8JXur548hac26e42saIXaoEJQB8uiiFHEaC8pbepLmJiWvRHmloXaT+zbv5tYnKwY/yCOX0nmdwEGWTzLY0JSIpeTUTV/I3W1vRYh+z4o90Pkc1zFGshLKBlad1DpZYqtureObz5wypM2DVCuURLGU91d3f2w7OjJ7M6ELrzoTkbeSRkxb9Z7lV9o7VxOHSJXcRxQ3xNxaDjp3Dkj8Ng6zg+Xrm8Ky6ZlUQqphj7nYntbz1R5vKyhKdG3l7Zkrzj3gebdDxJZMBqxNRr7/I82ZMPMAs6VxKSmzK9iGHS1n/LolReK1/JJrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yKG6S6BhoMqTi5FWwQ6pzRKLrA0Tv58ujO10yfpune8=;
 b=OMsM8f+UaSivY4P/a6ZsXPZUOAjpGyhTY7lezU1eEEIs9qqswNnA6N7dD3P3/N4HPzGxVVZmsPSlRpzNkhqfAUbHDqwPzhQcIj7u29yhbasvo51fJb5xhxaN9BZpaqLJKCoOPrfuIzDlCfLr3vCTYoTR2EPBxDmjYY+Rg6TbRIFGoiag2q1Y7xiB2flRwCotnB1/KY+UP2+s8gT2XYN9/itmvswQhX2E/nR8YnafTsnigb/q4J2X9/xrNXQoKUM/5RCQzsCP185EY18KCAmk3dN76Ro1vqGFbRh7nRmw6L4USi/CK8b9fYchIWyTKOoZu7mhQFuOEqiKzplYl+3sHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by DM6PR11MB4594.namprd11.prod.outlook.com (2603:10b6:5:2a0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 14:06:18 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548%4]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 14:06:18 +0000
Date: Mon, 13 Jan 2025 14:06:02 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Maciej Patelczyk <maciej.patelczyk@intel.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915/gt: Ensure irqs' status does not change with
 spin_unlock
Message-ID: <qyw2eoyxslr4v2w7myazje32gzje7edhifpon4xb2rqpt3z4bi@xtqh3n5ksucx>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <gtrmxhovj2qpmcica76f7uxharhztbt7fdoromyxbsd7ltjvuq@lhnv2wcxm7or>
 <5f339c78-c641-44ed-84c3-cc1972bc22dd@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <5f339c78-c641-44ed-84c3-cc1972bc22dd@intel.com>
X-ClientProxiedBy: ZR0P278CA0221.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:6a::29) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|DM6PR11MB4594:EE_
X-MS-Office365-Filtering-Correlation-Id: 05bd507f-1177-416b-b85c-08dd33db7328
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TUxkNC9nRlB1YmRzdmhtNVdhc25qOFJTSlBKM0NqYTZKZENTSnpWM3c0V2tX?=
 =?utf-8?B?QXdHUjNROFNkNC8xdCs1SXN4dkdTN1B1SGRyTGI2eS9aT3d6a05PUnFLbXV2?=
 =?utf-8?B?TjAvWkZuSVR1aUVvVWtmYWt6Y3dnVCtyMnMxUDcxZzNoOTFxZ2J2MVU1MFhh?=
 =?utf-8?B?VmQrdWt4UFJaamFtbWpRaDg5OGVJcDZnQUMyYVBqVVkxam1MNXVjRWN6U0V2?=
 =?utf-8?B?TFZyOStaT2wrSlh1dExIYmVKd3pPRlJRaXI5UThPK2tWRUZnNkxrcFA4NWVP?=
 =?utf-8?B?d2NBVEkrQzlxbUlTQjA1YjFIMlFtbnJrRHUxd0tJMEJrRU5QRG5QNi9BdlJy?=
 =?utf-8?B?bHk5b3NJUDRpTHhLTmlnZlJiMUZUMStiZ0wwL3hWRmljdTFEU2V4MXBGWWQ5?=
 =?utf-8?B?WTlMWllZeUJPZHhoa0o3NU5xSmJSZkRRVk1yMUw1QkczdXFPY3Y1STY3dlcr?=
 =?utf-8?B?OU5UUUNwNnJJSlZTQllOTWxLZHJHUExWMXRhQXNPbFVuRGc2S282USs4RCtQ?=
 =?utf-8?B?YXoybStXZW1RSmROWmNrOFRQays4Zm1FTkdZMHgwdWRiOFR3NktWSXhHdFZk?=
 =?utf-8?B?WWVVRlp2TDg3NTNmTE9LbnNpdExzZ0wzU3Z1V05Nc1RJK0IvOXlyZlc2Kys5?=
 =?utf-8?B?aHV3anJ0RE5PWWF2dVdxVE5TeGpPeUthTkdpN296RzJZRWVReFpCVEJNUElw?=
 =?utf-8?B?WFhOdG1SdnVrQzdmVENPZzVYTFVCZmlUSlhCdzBpQ1pOMmY2YW9wZ1Y5dkhE?=
 =?utf-8?B?S1NoL3pvNzROWTlkOENXMm40Y3lMdzVzOFlheEV0ZnA4TlZHdVFneldEVWRl?=
 =?utf-8?B?dy9uZFNNSE5MYzFYZ2M2MDBHajNqZjZhMVJvN2dzZCtkZkNWdDlYS0FhTDhp?=
 =?utf-8?B?TEhUdmJreEwvV0grK3NwanBmU3BiZU9LRGU5Mk5hSHRCZ3BJWFdqVmh3d0hQ?=
 =?utf-8?B?b0hPV3JkS09SU0JWcVZUMUxLd0dDYUd3RU02V1EybnY4WTF4LzFQUWNCSXgv?=
 =?utf-8?B?SS9rZ3YrOUw1MUdBZGNHN0U2UXlEWUN5dytHMFdEV1NXSmhDa1hoRXpRQXpO?=
 =?utf-8?B?Um5hR0hWU0lRNVVJb01zT3djNDVNUTlTN1ErTUQxQ0hMWm1NQklMUjlXcm1v?=
 =?utf-8?B?eXFBMzhEclUvV25HVHp1NGNhWXBxZC9XVkxhMzZFUExHWDMxZnByVS9ON3Fn?=
 =?utf-8?B?M09qUXFBSTVTdkljczh2M1cvNm5nakpQT3pkanBVZU1KYSs3K3c3N2oxNGtV?=
 =?utf-8?B?cVBvZC9mZGNmTzUwTmEwbjY5d2ZLMzBnay9nbmNYWHFSQkhvRXNJc1Z2V0Ry?=
 =?utf-8?B?OURIVk14ZXU2UHgvbDZFTFNVanBrUVd6SkhuQlVHK2t0QVVYb1ZGNXk0QUw5?=
 =?utf-8?B?V1NSZUpmeXI5b3hGZGRqTjhMSjlEQXJPMU93bDBDbzBkRUFqWCtCa21qdXA3?=
 =?utf-8?B?RjdVbExDNjN5MDMwcHFBUXgxYzU4L253cHk0SXd5L3g1MS9veVBqd3QrK2dD?=
 =?utf-8?B?S0pUYngyTHBVL3MzcnBxWWFTbFB2UHhGbGo3cnpSc00zbWJRMWttdE1vVHdj?=
 =?utf-8?B?THFtenU1VHAreWwwK0tGSENoOVduMmJOdjRtYkN0RG9qRHY4amt1VlRqSWNL?=
 =?utf-8?B?ck9VSnV4eEFZaDlGSjhiYTE1d1JJQW5QYnlpUzBCUnRlSWxaREZQZ3dNZWhn?=
 =?utf-8?B?VUlNOXQrNlVjUFRTdDMyNXJoL1crWm93Wi80Y2VZMlBWOWo5VTlkTlZrWUZI?=
 =?utf-8?B?N0hDeXY4OW5VaWhQU3diaE5vY0FJb3VpWkxnTEpCVkFyYm91aFY1eFFqY2Fv?=
 =?utf-8?B?dTZ1VG4zelJqdzc0ZlpaUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHNWYkdHeHRQelp0Q21MZjNOdTFrOUtkN3Fhb0JhZ2VQeVJQVmo0RUVxNFFL?=
 =?utf-8?B?aXVSbUJ1ZDJYWkpGZk95dGthNDJXQUx1a0V0QzNvdm9veFdPZ2RPTzNkS0kw?=
 =?utf-8?B?VUo3bDJXRnQ0eXJ6ZFJ6Ti9SU1pCbEhBcEpyeTFHVTIySFlobFp0WjBObFdP?=
 =?utf-8?B?RUsvZXhpZ09uOTMwb2JSSG9GbHQ3MW5pR1Fkb1pvMFRzUnpoVnBOTFpTZ3I5?=
 =?utf-8?B?MmV2TEhRSVRRSURFOXdBb1NWZEpzYkNJd3dhRXdKdC9kbGlZb1Z1U1RPTHdl?=
 =?utf-8?B?WERWUjk3b1NObm14UlUwZCtob0l6K0cyN3pZbEN4MHJicjZseG1lMVU0YkZQ?=
 =?utf-8?B?ODlNN0lCUW5JRUhZUEt2emJ4YzVCcE5SRFI2by96bzIzemdVTUZVellXM2FC?=
 =?utf-8?B?M0NSc0s1SUt5bTVITzJ2VFE1dXY4ejlwdGhKSjBqRDhoT3NBUHlWMlp1cXpW?=
 =?utf-8?B?U3ZkUklXN3RQZEVBOEl0dU9xVDNXV1FGb2JNNzJJYWZJbVIzV0VpT1ZZWGVS?=
 =?utf-8?B?MDdKMWhaQVhIQWFTYTF3ZXJZRHp1elBlUkxZaHFFdmxhVFRrVUpyTy9zZDBr?=
 =?utf-8?B?Z3VmSCtKd0VHeENrM0h5UW41YUhaZW1nRDBEUkNhSktTNGVlMy8wZi9SbHJv?=
 =?utf-8?B?bHNvYWc5dFF1K2wyd0xCR2lqcE1WdklwVXpUZERBUUdTVW1iUzg1R3cwMGY5?=
 =?utf-8?B?bS9BRkEvOURyRHFhWXF1M2V6dk56REdRMFVnQzRpNHFQcVFZU1hyZnlWZzY4?=
 =?utf-8?B?RWtMeVJSTmVtdGw1QmVoZGROS0kyNEJyU2tWRXMraldicHEwN0loNzRrVWtR?=
 =?utf-8?B?b08rb3lwdzZwcmE3MVNrV2F3OWg5WHNZVkRtLzMvRm15Tnh5a25RUTk1U1p3?=
 =?utf-8?B?bWNSR1FFcTVLdkNBLzZRNS9FWWN4cnA5Wm1nMGFlQXA3MHRwQVNXSVJMRDBG?=
 =?utf-8?B?NDZzUExycG5RNW9senI5NWtqVVpYOGxWVHdDN3c2NDdRTC85Mi9OaUhYY3BV?=
 =?utf-8?B?NzcyR0tyOXdwVlB6VVY1Wk85MXJadHQ3cFlFQ212eVh2ZEZyTzVwRnVjTGNJ?=
 =?utf-8?B?QVlSUmx0Rm1KUC93M0dhelZWQTdYZG5DR3RlRFBDVkxSUmJVMmRkeTArS0NU?=
 =?utf-8?B?SzcwcDRLSE5vZnJOdE5vemNTOVNwWitZYk00aWdNT1ZFTWR5enpHNFZBSU1V?=
 =?utf-8?B?aG12TVdGckJYSkJuSDEvZjdlQ0IxUjIvNWRueEFESDNIaG96RUVwUEs1WFdr?=
 =?utf-8?B?MUlGbWROa0FnQ0QwWkFXc3pjMGVlS2czdGxLVGhvcHRYd1BhRCtzUHpwcU5C?=
 =?utf-8?B?eUtMMExINmY4Tzk2ZmhiNDFqQStjbURMRHBhUys2QkYrRzZJRmEwYmgwM0ll?=
 =?utf-8?B?YXRxSVdSdnBwSzArMHo4QW9PRUdjb2hsUE5tTVpBTWJoVVNSbE1rRDFaeEVv?=
 =?utf-8?B?dTJTeXdReFBJTTJTS2QrTWpkcmo1eDkrZFpXa2thZXdENmFKYStwSnRNeTUz?=
 =?utf-8?B?RFdZU0pCSVVDWUl0SjFMRzYwWHdiZU1GZWRsaWNpem1pa3RuN0E3QzU5LzNt?=
 =?utf-8?B?a0hGdlpzdEU4U0JBTzFYaGFOeXJWWXB4YXFLNWpTOGVVUGUxMHFKRkdWMmww?=
 =?utf-8?B?TzBLeFpseDRKOHRZbGE3NFZoNysvYjNvdE1MSUs1cUxEZUhya05NU3h6Z0Ey?=
 =?utf-8?B?SnhNRWUrQnhMVHJjUVU5a0pSdDd3THpFQ21CQndmbGF0ZnM0QTRBYnFpc3Zm?=
 =?utf-8?B?a1EweFQ0dDhKd3JpZ2ZucGlwWEVpYTB5OVZ2QldQS3lzeEc2MnJsOVIwTDZ3?=
 =?utf-8?B?c21oaWVEWUtmc1dSN2R2RlBQYTBocW53Z1A5d2JQQzlUYWlzRjU3TlVIQi9H?=
 =?utf-8?B?eDZFMlpyUU9UYjNQZFkyTjFJcWZScnh1MUR3SFpIUEZ1TXNxUDdXcFNERnZz?=
 =?utf-8?B?d2lvZUx3bEd2clhlc1NDTG1POEhXNVd6RVJSZUR2SG1pd29DQnk5MTVGNWJn?=
 =?utf-8?B?K0ZxQWNaSFNDaGhtb1NocjB0QnhqbGtzejd0Q25lWFBCeFplVmZadGZQUGtv?=
 =?utf-8?B?ckNBS1lDc3pPQzJGWnRXemZMcUJYcWdBK1h3TnAxdXhiUlZ6Zy9JRC9pbFZt?=
 =?utf-8?B?N2dHbFRuRjRWbHBtejJUMUlNOVJkaFFoM3Z6RzFmSXhMV0g2NWtvVGNmRDF4?=
 =?utf-8?B?T0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 05bd507f-1177-416b-b85c-08dd33db7328
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 14:06:18.0645 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rvf7FGl6IwYZluypmCxjphObXX+Vuz2mc11a6WrFB1oYcqPo8vZT+MgzA6q2OuZXAGpeRlzJuLnG5J8MqIWovnQWYpB3oUckFhYLdJ5748s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4594
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

Hi Maciej,

> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > index 12f1ba7ca9c1..e9102f7246f5 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > @@ -4338,10 +4338,11 @@ static void guc_bump_inflight_request_prio(struct i915_request *rq,
> >   static void guc_retire_inflight_request_prio(struct i915_request *rq)
> >   {
> >   	struct intel_context *ce = request_to_scheduling_context(rq);
> > +	unsigned long flags;
> > -	spin_lock(&ce->guc_state.lock);
> > +	spin_lock_irqsave(&ce->guc_state.lock, flags);
> >   	guc_prio_fini(rq, ce);
> > -	spin_unlock(&ce->guc_state.lock);
> > +	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> >   }
> >   static void sanitize_hwsp(struct intel_engine_cs *engine)
> 
> The guc_retire_inflight_request_prio is called in intel_breadcrumbs.c
> signal_irq_work().
> 
> There is a similar situation
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c?h=v6.13-rc7#n255
> 
> There is also spin_(un)lock while potentially IRQs are disabled.
> 
> Should it also be addressed?
Thanks for spotting this. Yes, I believe we should also address
other spin locks/unlocks on this path
(inside list_for_each_entry_rcu loops for example), as they
might cause similar problems. I will include these in v2.

Krzysztof
> 
> Regards,
> 
> Maciej
> 
