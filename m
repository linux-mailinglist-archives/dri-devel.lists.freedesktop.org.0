Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58748AAE714
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 18:46:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A07BB10E866;
	Wed,  7 May 2025 16:45:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dB0wDyuW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B26AE10E861;
 Wed,  7 May 2025 16:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746636358; x=1778172358;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QILYS4gtcFm49nY0ikAa0ujZILjVkVRnb95isASWvSc=;
 b=dB0wDyuW+gs6TDSypZ57T113Qg9QpQsd2ZvNzcbkCqQZ2+1qmVxLk5gZ
 4+5LuwluWGctTPSHayOz/OWgEFENePqteH89FDOZ0SvAnI9wZbriviqvW
 MBGmOXzZKMWcDlYdszy0Gnl19MDRHoPnDyjVfo6gUK9J9TAu/EaDvJ+U0
 E4QZR9JGwEIshShGAhEPfXJBdbzzvA2wziY5HIRbT/F6f7Xrw1uQpGNLi
 /qgnOPcqTSdlRGT/re4DmYd90udIpthpEjSZjlO9kZ1VuqeF757th962L
 LFfbuld7ZwXdEklDW8VX+IeCORKxQhSOPVtO2GJ+8p3gZu9RMWCX7bfTK Q==;
X-CSE-ConnectionGUID: rbT8Jxz3QSqTOZNC23uT4Q==
X-CSE-MsgGUID: 5+PfjbZaTuyNJ072zdl3Cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59734733"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="59734733"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 09:45:52 -0700
X-CSE-ConnectionGUID: /xWNuNPqRi+LA4WFblXr+A==
X-CSE-MsgGUID: Y2jAYU0QSkOrdMU+CKd9AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="135715216"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 09:45:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 09:45:52 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 7 May 2025 09:45:52 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 7 May 2025 09:45:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oC8GS/TunZmMf1Updb75s5fn6/0J7IzM6e2WRbgKnToyBPxaaw5E5lDXNsu9VKCSMYFUBEgK8ChoxKE1/4eESjiACdBw61M/xRQotpIoVCXp9lFFi3xKhKT1vNk6dDtrB7rRf+garDvk4YMQEE4RWxTHNQIn74rA6pqaSne/LrkOG/w5oav1w6EGoaAUqvGbFPaa00ugCfVaRYLeX7KPFng/KTQpyPT6hptgllrOO8TUE4HpSjVrELX+sqYlsmDmsGD6AFYBy70DZztXkBP0VOjKoL5FW5JW7/7K5RpQATnwLI9To8VYdAyuZCR0CBvpP32g/qXPmyTdwLAZ29bWcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QILYS4gtcFm49nY0ikAa0ujZILjVkVRnb95isASWvSc=;
 b=cla4SqueorEiyjEmrp/3gMfe8a/Rlv993V73qOaAPhuY+IGqNAKsKWJPJF7Kpu9OANPvi8hSyhXlA4f7BvC51bNFFVLkW5QKD/IB00GL3v5L0ZnDjKRVgijFA/gyLKC2AGmyuHhKeOiC6A3RMOjH5IuxSpMEDSalw9BhBIB45d5yWQ9NcY/b8MwgfrHgQ2WmeDvxEw0Bpwpwx9eJpTZW4Hucxtm6yWXIjVKERQEUrrLzg7kN4L6MOPD47990p+mkO/M3BZ4TtrqVXPmRHB9a8INfwjW6fgyxNi3RodRkLeK/2sAR/e9caEZGVo9BNC6pZWdJqORoYbENu0+0iEM7Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SJ2PR11MB7715.namprd11.prod.outlook.com (2603:10b6:a03:4f4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 16:45:17 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%7]) with mapi id 15.20.8722.018; Wed, 7 May 2025
 16:45:16 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Hirschfeld, Dafna"
 <dafna.hirschfeld@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gupta, 
 saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, "Brost,
 Matthew" <matthew.brost@intel.com>, "Zhang, Jianxun"
 <jianxun.zhang@intel.com>, "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Mrozek, 
 Michal" <michal.mrozek@intel.com>, "Jadav, Raag" <raag.jadav@intel.com>,
 "Harrison, John C" <john.c.harrison@intel.com>, "Briano, Ivan"
 <ivan.briano@intel.com>, "Auld, Matthew" <matthew.auld@intel.com>
Subject: RE: [PATCH v23 2/5] drm/xe/xe_gt_pagefault: Move pagefault struct to
 header
Thread-Topic: [PATCH v23 2/5] drm/xe/xe_gt_pagefault: Move pagefault struct to
 header
Thread-Index: AQHbtVpgi1/2p1GPXUq6RBiICW9LNbO6uX6AgAy3ewCAAAGCAA==
Date: Wed, 7 May 2025 16:45:16 +0000
Message-ID: <CH0PR11MB5444110657C65CD08B7181D3E588A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250424204917.172708-1-jonathan.cavitt@intel.com>
 <20250424204917.172708-3-jonathan.cavitt@intel.com>
 <zqvdl3mu7q5vynymsbz7ax76sz2opyfhr4cwyp6vsi5yz4fl5w@jxxwcgbzoqhf>
 <c328fce4-761c-44d1-b9a3-0b20e6da7125@intel.com>
In-Reply-To: <c328fce4-761c-44d1-b9a3-0b20e6da7125@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SJ2PR11MB7715:EE_
x-ms-office365-filtering-correlation-id: 68c6f0d9-e8ae-4ef9-ace2-08dd8d868b9e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?aExWanVIVGtWdEFMTHArOEhicEZKVEQ3VHUzSmxpODVhZ0VpalMyZWpKa3N3?=
 =?utf-8?B?dWNtcmdjeXhJZVhRU09tOHc1Uk1MRWtMN1hXZ3lJM1VDK0dRVUxGaStaUUFP?=
 =?utf-8?B?U2xQQU5RUG80a1lTVWxuaDN1WWRNakVBR0dxQWdXUGlMQW5ic0FyTm9ObENy?=
 =?utf-8?B?NWpVUlBzV3lkWE01NjRJRzltY1Z1UlRucG4ybmRZMzJ2a0dZMlRnM2dzWk0z?=
 =?utf-8?B?ZXlRY0x1aStTMzBDM3I4eWhEQjR0SHZZZGx2YStHUll2OWF4OGx5ck5DM1o1?=
 =?utf-8?B?czU5aGhRZTB6OGw3c1ZSWit3eE9YblAyam1mcGFRR2RNdXdPMGFCL0c5L3hl?=
 =?utf-8?B?cEpyK0dHdVNTRnJIbFV5NDFvQ2w4TGlLbE53K3VHSkljSXJtTW5IVGdGNW5y?=
 =?utf-8?B?TzFkNUxrczRDOTJoaUFESVdrSGo5WlBlMWxISkJyOW1EL0pPZDVxdjJlR1RV?=
 =?utf-8?B?MGpFTWlGc3hhUW9DVmIzMDBmVVlBWkY3WWhKeHIrNmN1Smx2akF5WWpjTVNm?=
 =?utf-8?B?d2lJZzRHREViS2R3MlZqK0tYamU4dkZZRGhLRUpGcU9SSktCM3J3bDc0UG9k?=
 =?utf-8?B?czJWY2JxR0NkdUhiSkZpT2oyalRqVTZYZllGQkwyMmtPb2RJRk5RdklqWEg5?=
 =?utf-8?B?cGFFUkExdTBPaVIvVXpkTURmWHEwTFMraThpSjJqT2RVcFBUblpqQkxrbVR3?=
 =?utf-8?B?STQwTzd2d3ZrTjZ0UzkxVUFvZXdBT0VQUFp6VGtNWGFiaStOSVlaTXpLSE15?=
 =?utf-8?B?RVVJSzBxVHJrUzlOUFg0Um94cngrU1p6YW91Vk04SHZCWkM1Y3cvOVlqSFNS?=
 =?utf-8?B?ckpBZXFMRjdHMHk2bEFIUEtRNEh2dW9rVGt0eEVqaEtvYTlvSU9Lekk2T2NS?=
 =?utf-8?B?cUhkbUExdm9xY202UmZxMlAvSzZPQm81THgxZHNvdko3cUUzODc1dFY2T2sx?=
 =?utf-8?B?NDR4VEF3ZUNHdlNQRmtiR1hUYkJkT2RtMmwxdjdzWWhzQzNxbVE2am1XQVVV?=
 =?utf-8?B?clhEbm1oc0YvVEZJWnk3ZURWMTRtMk02Y3NwRVd5TkIyOGVIQUJFN1Y3eS9P?=
 =?utf-8?B?WExoWmlxWmdYWkN2QzBHKzgvS05QMnRrVy9HazV4WGJ5VjJRSFpHb1BlcXI5?=
 =?utf-8?B?VlI4KzFPYjBOcG52NFI1OGI5YjVSdUxvMmxJSkZNUnhnS0ZYRnBKL2NxcStl?=
 =?utf-8?B?Zk9QQW9JaEE2KzUvVU41Y25uQWQ2Vk8wZCtmQjZvRFNIQXp1ZVduMDM2SDhz?=
 =?utf-8?B?bytTK25LSy91R3FlNExTbWQ3Tkd4NzN4OXN2K2VSZ1d2dy9BZ3JrRlFQWDE5?=
 =?utf-8?B?ZU45Yk05RTV1b2xkMkNKajlCU1EvTEU2L3NEdTBQNzlnempFVWFyVE1LRy9a?=
 =?utf-8?B?MiswYldDOTRYWlZxekk1bHBRcHVHQjdHeUNIUHk2MWV4NWFUWHpwMFBORy9F?=
 =?utf-8?B?NGZhdkQrNFBseVBObXM5R1EyL1JBNXFQdWp2Q1BxMFcza2tZSzluSkJuVGU2?=
 =?utf-8?B?UVphUzJpa3puNFNFMGFDR29pcXVPRHZZWENvRFQwQk5HNWlMZXFpUVRObGUx?=
 =?utf-8?B?RGpEMnVuSDlnUVFwc05vbVIxeUhMWnQwQWlmdlhmUnBVVHJicmgyYm5nZTR5?=
 =?utf-8?B?K1NyQ2Q1UXZEanltQy9aR3U3UXNFd2dTakJLSHJmTHBoNU15cU9TZkZySVlR?=
 =?utf-8?B?OVNGWDRYeVQrSE1ub0tPYUxNdFByYWs2TzJxWklsWkdOOHh6TlNKWTJFeXUv?=
 =?utf-8?B?VUl5Z2NpMlFwd2J3dks0WnZ0VzZTRUM5dmZHTWV0RWRjLzdMTGFReEJON1BD?=
 =?utf-8?B?YjBVZlhuZmNDekU1QW9RbDAyYTlMN3dOd2JVT3JlSFRNckEwZkdPMFEvSW1J?=
 =?utf-8?B?UUY0c2lYR2IrZ2dSb2tQYmtXR1hCNTY5WnhGWVdNbmNxbUZwZENTbFRXb2Rj?=
 =?utf-8?B?a3VDR3dSdUltSzdFOFI1UFhoWjdCTlB5S3NseHJKMnNidmhvR2g4R0NYbGNl?=
 =?utf-8?Q?XjsEa2/xEDary7iEQPKMGYUZo3Fwvw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VUNZaGU4cEVQdGFKbHpYOXpLQVBMaVFVLzhuNzcyQndrSVFrR2pSVktUY2Iv?=
 =?utf-8?B?SHhsSTBzL0xRamZVMW8xakN5a3BLcEt0aVc3R0hkRTdNc1RWSTFDU2tpUGhs?=
 =?utf-8?B?QUx1czJEZ0ZnT1pCSCtTbXUwTjJLL0pjUHNrNFU5TFVCT3NBenEvVDlXOFFy?=
 =?utf-8?B?ZkpFQTBJSjE5US9sTHhjWldDUFMzVXlsOXl0TWNXNkMvNlFoMGlhMzYrR1No?=
 =?utf-8?B?TXhreCtwWDI2YjROb2pGeC9LQTZDRWhLRkpHVzJESlNkWXFoOVA3S09nak5Y?=
 =?utf-8?B?aFNlUEZ4YVB6LytWS2tXLzkvR3VlL3NKc1NmVXlYYUZZVWw4b2FNUjVpZFhF?=
 =?utf-8?B?cnBmS3dJMk94a2JtcExEWGg4aElXU2Z1YTFsMTZkL1NodERWVmJGQ3FKNG1R?=
 =?utf-8?B?V2JvUlo4bnNKU2xhTVpzNFdudGxxUy96VmxTci9tNmt4alIwOWw5YUc3eEZ5?=
 =?utf-8?B?c0NzVlkvWHdVSVViV3ZOSk1RRmpLd3djdTB3d2k5aS95cDZjVFRtaDRPK3RL?=
 =?utf-8?B?R2pVdjRpSVV3cU5XbHpENVQyMSt3ZHROa1N1QUs0SWZCdDRNczEzQW1KV3Bo?=
 =?utf-8?B?SUI2WVNBWUNwVGthbW0rNEU1SS80V2p6VS9hdzlxa3RhQXZoRE44L0dWaTZr?=
 =?utf-8?B?Y2dITk1IVEs0S0tVM2FxMVhtK2xSZ3VjdzhVUzc4aWo5TGszRWZQZVBlZEFQ?=
 =?utf-8?B?ZFEwcmEzQVZkaFpPalhvZ0hiNHFiSVdGRmxyL2UxVVZWRWFPaFVXOEF5UzJY?=
 =?utf-8?B?RXdJeW82MDNNR29ubGJsLzBQMEx1RGE4aUpYNWZodlVpdGs1STAzbzQvNFBK?=
 =?utf-8?B?cW5rZElyVjNpZUNJTkZkYWJQc2VweVVvUU0rVXQ1d0xMM05Ea1l3VEpjY2xs?=
 =?utf-8?B?Uk9naW5OdTY2SmFNWjFLcGR3NDdiYVphS08vM0hSdUZFMHpSaTlpUWFSK0ZV?=
 =?utf-8?B?dGlLWXpBaHpYMlJ5K29vckRUcklHTTJ3dXZ2V1kwYjJBd1ZmNy9ST0c1Q0NE?=
 =?utf-8?B?eis2K3pDMXNCbjZSUUdjYUFjUWIwRHVyc0JicitrKzBlUlhka3FTNUdrTEZ0?=
 =?utf-8?B?Vi9pc281amZIUmptOHJRamswVW5iemxORXhQSHo3UXllQVJCNDJYL2FMME10?=
 =?utf-8?B?VEduRUY5dFFYeHk4dnZYU28xR2cxTzhIMzEwMmJzdU0rMWxjT1FzUnF4Qmhp?=
 =?utf-8?B?U0VIS3I3QU1xY3E4TXk4WVhLZnY3Y2lxZ1ViN2RiU1A1emhuS3oxMDZjeFYr?=
 =?utf-8?B?dWR5NytZSHdBeWszQ0k4cjJaeDZ5OVBsMTQvWjZubUx0dmErbzdZNC9DcGZo?=
 =?utf-8?B?QVVCS2xPNG0xeGI1VUdHTzBudTZ6U0F0QU8zbW1FQk9RREtuNGZUdENqTWV3?=
 =?utf-8?B?dFk0OGkxVlpCcm4vN2JDN0cxekpxTUZjdnREZW5rVS9EdTJJLzM5UW9xdGhx?=
 =?utf-8?B?dXY1ckhoaDJjcklOSlFnMDEyeHhab2FuTEtQd0FnbmNPY1l3QjRucitTbXp0?=
 =?utf-8?B?NGFtbEpuYnFTbUZ6cmlqeUdsUjg3TG9DZUR3U05vK2dzenRUWjRXN1ZuOXNl?=
 =?utf-8?B?L3ZEaW1RVU0yOVJkTTl0N1AzR3puSVN6Y2dOTmxNWmxNaUd1NnFMTzNUM3lX?=
 =?utf-8?B?Tlc2b1RicHRicXZlQlFnWXcrM3ZWSnFUS2g2Vm4yWmF1eVd5enVoYlY0alBH?=
 =?utf-8?B?YUJtdVNQZk40b1Z5WG80dkZFamN0Rm0xajduNlh4SXVMdkc0ZWdVL3dDeDZ2?=
 =?utf-8?B?d21EU3FTbjdTR2dwWE13Q242TGt2VTJ6dnB1Sk5NZ0FGMmxRRkJlQzl2UXRY?=
 =?utf-8?B?czV5R0VBbEhXLzNnd1RibWFnZEl1TmVHd3ozREVkWHRnaTJwenpYdUhFSUM1?=
 =?utf-8?B?ZnlzZU93RllMUlN1L2tjM1BCWmR5RGQvUVhHNHdGU3JoRjRpWkx6SnZkQ2hS?=
 =?utf-8?B?VVlmNzF0eGZlbzNrQit6L2I2YjNGMVQ1WHlQR3poTmtvbkhmTkMrSmZUTi9a?=
 =?utf-8?B?dGFKNk1raEZGRk45UCtUb3V1Qkgwa2pxYXRJUzFLeVNodUduVnZ6RFhid2R0?=
 =?utf-8?B?Q3oxMUxqTkVoUlJ0U3Qya0ZWYkFCNStuNE04S3ZIdHdKdjZwSlVwcVRYS0hR?=
 =?utf-8?Q?xZSGc+G7hhmTjfkl+l0aW464g?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68c6f0d9-e8ae-4ef9-ace2-08dd8d868b9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2025 16:45:16.3800 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uJuqErw2pdZtRZSdQyq/bpzjUOqVrIBQLFIt/75JzjCtr0PnIVcH3EBevKXoMTYZD/ATjtOXb+k2fblYouTo/a93YbUx8rZ+flZ7sVsiu9c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7715
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFdhamRlY3prbywgTWljaGFsIDxNaWNo
YWwuV2FqZGVjemtvQGludGVsLmNvbT4gDQpTZW50OiBXZWRuZXNkYXksIE1heSA3LCAyMDI1IDk6
MzQgQU0NClRvOiBIaXJzY2hmZWxkLCBEYWZuYSA8ZGFmbmEuaGlyc2NoZmVsZEBpbnRlbC5jb20+
OyBDYXZpdHQsIEpvbmF0aGFuIDxqb25hdGhhbi5jYXZpdHRAaW50ZWwuY29tPg0KQ2M6IGludGVs
LXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgR3VwdGEsIHNhdXJhYmhnIDxzYXVyYWJoZy5ndXB0
YUBpbnRlbC5jb20+OyBadW8sIEFsZXggPGFsZXguenVvQGludGVsLmNvbT47IGpvb25hcy5sYWh0
aW5lbkBsaW51eC5pbnRlbC5jb207IEJyb3N0LCBNYXR0aGV3IDxtYXR0aGV3LmJyb3N0QGludGVs
LmNvbT47IFpoYW5nLCBKaWFueHVuIDxqaWFueHVuLnpoYW5nQGludGVsLmNvbT47IExpbiwgU2h1
aWNoZW5nIDxzaHVpY2hlbmcubGluQGludGVsLmNvbT47IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmc7IE1yb3playwgTWljaGFsIDxtaWNoYWwubXJvemVrQGludGVsLmNvbT47IEphZGF2
LCBSYWFnIDxyYWFnLmphZGF2QGludGVsLmNvbT47IEhhcnJpc29uLCBKb2huIEMgPGpvaG4uYy5o
YXJyaXNvbkBpbnRlbC5jb20+OyBCcmlhbm8sIEl2YW4gPGl2YW4uYnJpYW5vQGludGVsLmNvbT47
IEF1bGQsIE1hdHRoZXcgPG1hdHRoZXcuYXVsZEBpbnRlbC5jb20+DQpTdWJqZWN0OiBSZTogW1BB
VENIIHYyMyAyLzVdIGRybS94ZS94ZV9ndF9wYWdlZmF1bHQ6IE1vdmUgcGFnZWZhdWx0IHN0cnVj
dCB0byBoZWFkZXINCj4gDQo+IE9uIDI5LjA0LjIwMjUgMTY6MjIsIERhZm5hIEhpcnNjaGZlbGQg
d3JvdGU6DQo+ID4gT24gMjQuMDQuMjAyNSAyMDo0OSwgSm9uYXRoYW4gQ2F2aXR0IHdyb3RlOg0K
PiA+PiBNb3ZlIHRoZSBwYWdlZmF1bHQgc3RydWN0IGZyb20geGVfZ3RfcGFnZWZhdWx0LmMgdG8g
dGhlDQo+ID4+IHhlX2d0X3BhZ2VmYXVsdF90eXBlcy5oIGhlYWRlciBmaWxlLCBhbmQgbW92ZSB0
aGUgYXNzb2NpYXRlZCBlbnVtIHZhbHVlcw0KPiA+PiBpbnRvIHRoZSByZWdzIGZvbGRlciB1bmRl
ciB4ZV9wYWdlZmF1bHRfZGVzYy5oDQo+ID4+DQo+ID4+IFNpbmNlIHhlX3BhZ2VmYXVsdF9kZXNj
LmggaXMgYmVpbmcgaW5pdGlhbGl6ZWQgaGVyZSwgYWxzbyBtb3ZlIHRoZQ0KPiA+PiB4ZV9ndWNf
cGFnZWZhdWx0X2Rlc2MgaGFyZHdhcmUgZm9ybWF0cyB0byB0aGUgbmV3IGZpbGUuDQo+ID4+DQo+
ID4+IHYyOg0KPiA+PiAtIE5vcm1hbGl6ZSBuYW1lcyBmb3IgY29tbW9uIGhlYWRlciAoTWF0dCBC
cm9zdCkNCj4gPj4NCj4gPj4gdjM6DQo+ID4+IC0gcy9NaWdyYXRlL01vdmUgKE1pY2hhbCBXKQ0K
PiA+PiAtIHMveGVfcGFnZWZhdWx0L3hlX2d0X3BhZ2VmYXVsdCAoTWljaGFsIFcpDQo+ID4+IC0g
Q3JlYXRlIG5ldyBoZWFkZXIgZmlsZSwgeGVfZ3RfcGFnZWZhdWx0X3R5cGVzLmggKE1pY2hhbCBX
KQ0KPiA+PiAtIEFkZCBrZXJuZWwgZG9jcyAoTWljaGFsIFcpDQo+ID4+DQo+ID4+IHY0Og0KPiA+
PiAtIEZpeCBpbmNsdWRlcyB1c2FnZSAoTWljaGFsIFcpDQo+ID4+IC0gUmVmZXJlbmNlIEJzcGVj
IChNaWNoYWwgVykNCj4gPj4NCj4gPj4gdjU6DQo+ID4+IC0gQ29udmVydCBlbnVtcyB0byBkZWZp
bmVzIGluIHJlZ3MgZm9sZGVyIChNaWNoYWwgVykNCj4gPj4gLSBNb3ZlIHhlX2d1Y19wYWdlZmF1
bHRfZGVzYyB0byByZWdzIGZvbGRlciAoTWljaGFsIFcpDQo+ID4+DQo+ID4+IEJzcGVjOiA3NzQx
Mg0KPiANCj4gbWF5YmUgYWxzbyBtZW50aW9uIDU5NjU0IGhlcmU/DQo+IA0KPiA+PiBTaWduZWQt
b2ZmLWJ5OiBKb25hdGhhbiBDYXZpdHQgPGpvbmF0aGFuLmNhdml0dEBpbnRlbC5jb20+DQo+ID4+
IFJldmlld2VkLWJ5OiBTaHVpY2hlbmcgTGluIDxzaHVpY2hlbmcubGluQGludGVsLmNvbT4NCj4g
Pj4gQWNrZWQtYnk6IE1hdHRoZXcgQnJvc3QgPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPg0KPiA+
PiBDYzogTWljaGFsIFdhamRlY3prbyA8TWljaGFsLldhamRlY3prb0BpbnRlbC5jb20+DQo+ID4+
IC0tLQ0KPiA+PiBkcml2ZXJzL2dwdS9kcm0veGUvcmVncy94ZV9wYWdlZmF1bHRfZGVzYy5oIHwg
NDkgKysrKysrKysrKysrKysrKysrKysrDQo+ID4+IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9w
YWdlZmF1bHQuY8KgwqDCoMKgwqDCoMKgIHwgNDMgKysrKy0tLS0tLS0tLS0tLS0tDQo+ID4+IGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9wYWdlZmF1bHRfdHlwZXMuaMKgIHwgNDIgKysrKysrKysr
KysrKysrKysrDQo+ID4+IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfZndpZi5owqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB8IDI4IC0tLS0tLS0tLS0tLQ0KPiA+PiA0IGZpbGVzIGNoYW5nZWQsIDEw
MCBpbnNlcnRpb25zKCspLCA2MiBkZWxldGlvbnMoLSkNCj4gPj4gY3JlYXRlIG1vZGUgMTAwNjQ0
IGRyaXZlcnMvZ3B1L2RybS94ZS9yZWdzL3hlX3BhZ2VmYXVsdF9kZXNjLmgNCj4gPj4gY3JlYXRl
IG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9wYWdlZmF1bHRfdHlwZXMuaA0K
PiA+Pg0KPiA+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3JlZ3MveGVfcGFnZWZh
dWx0X2Rlc2MuaCBiL2RyaXZlcnMvDQo+ID4+IGdwdS9kcm0veGUvcmVncy94ZV9wYWdlZmF1bHRf
ZGVzYy5oDQo+ID4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4+IGluZGV4IDAwMDAwMDAwMDAw
MC4uYTE2OWFjMjc0ZTE0DQo+ID4+IC0tLSAvZGV2L251bGwNCj4gPj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3hlL3JlZ3MveGVfcGFnZWZhdWx0X2Rlc2MuaA0KPiA+IA0KPiA+IE1heWJlIGNoYW5n
ZSB0aGUgZmlsZSBuYW1lIHRvIHhlX2d1Y19wYWdlZmF1bHRfZGVzYy5oICwNCj4gPiBzaW5jZSB0
aGlzIGlzIGN1cnJlbnRseSBndWMgc3BlY2lmaWMuDQo+IA0KPiBJTU8gJ2d1YycgdGFnIGlzIG5v
dCBhcHBsaWNhYmxlIGhlcmUNCj4gDQo+IG15IHVuZGVyc3RhbmRpbmcgd2FzIHRoYXQgR3VDIHNl
bmRzIGRhdGEgYXMgaXQgd2FzIHJlYWQgZnJvbSB0aGUgSFcNCj4gcmVncywgc28gdGhlIG9yaWdp
biBvZiB0aGUgc3RydWN0IGxheW91dCBpcyBIVywgaGVuY2Ugd2UgcHV0IGl0IGluIHJlZ3MvDQo+
IHdoZXJlIHdlIGhhdmUgYWxsIHRoZSBIVyBkZWZzLCBub3QgaW4gdGhlIGFiaS8gZm9sZGVyIHdo
aWNoIGlzIGZvciBGVyBkZWZzLg0KPiANCj4gdW5sZXNzIHdlIHdhbnQgdG8gbWFrZSB0aGlzIHN0
cnVjdCBwYXJ0IG9mIHRoZSBzdGFibGUgR3VDIHBhZ2VmYXVsdCBBQkksDQo+IGFuZCB0aGVuIGV2
ZW4gaWYgSFcgZGVmaW5pdGlvbi9sYXlvdXQgd291bGQgY2hhbmdlLCB3ZSB3aWxsIHN0aWNrIHdp
dGgNCj4gY3VycmVudCBsYXlvdXQuIFRoZW4gYWdyZWUsIHdlIHNob3VsZCBtb3ZlIGFsbCB0aGlz
IHRvIGFiaS8gYW5kIGFsc28NCj4gZHJvcCB0aGUgQnNwZWMgcmVmZXJlbmNlIGFzIG4vYQ0KDQpT
bywgdG8gc3VtbWFyaXplLCB5b3Ugd2FudCBtZSB0byAqbm90KiBjaGFuZ2UgdGhlIG5hbWUgb2Yg
dGhlIHJlZ3MveGVfcGFnZWZhdWx0X2Rlc2MuaCBmaWxlPw0KDQpJJ2xsIGdldCBvbiByZXZlcnRp
bmcgdGhhdCBjaGFuZ2Ugc2hvcnRseS4NCg0KPiANCj4gPiANCj4gPiBBbHNvLCB0aGUgZGVmaW5l
ICdQRl9NU0dfTEVOX0RXwqDCoMKgIDQnIHJlbGF0ZXMgdG8gdGhlDQo+ID4gbGVuZ3RoIG9mIHRo
aXMgc3RydWN0IHNvIHNob3VsZCBtb3ZlIGhlcmUuDQo+IA0KPiBhbnkgRzJIIG1lc3NhZ2UgcmVs
YXRlZCBkZWZpbml0aW9ucyBzaG91bGQgYmUgaW4gdGhlIGFiaS8gR3VDIGZpbGVzLCBub3QNCj4g
aGVyZSBpbiByZWdzLyB3aGVyZSB3ZSBrZWVwIEhXIGRlZmluaXRpb25zLg0KPiANCj4gYW5kIHBs
ZWFzZSBkb24ndCBzdGFydCBkZWZpbmUgbmFtZSB3aXRoICJQRiIsIHVzZSAiR1VDIiBpbnN0ZWFk
DQo+IA0KPiBhbmQgYnR3LCBpbiBtYW55IHBsYWNlcyBieSBtZXNzYWdlIGxlbmd0aCB3ZSBhc3N1
bWUgYWxzbyBIWEcgaGVhZGVyDQo+IGxlbmd0aCwgc28gdGhlIGFjdHVhbCBsZW5ndGggb2YgdGhl
IEcySCA2MDAyIG1lc3NhZ2UgaXMgNSBhcyBpdCBpbmNsdWRlcw0KPiAxIERXIG9mIGhlYWRlciB3
aXRoIERBVEEwIGFuZCA0IERXcyBvZiBwYXlsb2FkIHdpdGggREFUQTEuLjQNCj4gDQo+ICNkZWZp
bmUgR1VDMkhPU1RfTk9USUZZX1BBR0VfRkFVTFRfUkVRX0RFU0NfTVNHX0xFTiBcDQo+IAkoR1VD
X0hYR19SRVFVRVNUX01TR19NSU5fTEVOICsgNHUpDQoNClNob3VsZCBJIHJlcGxhY2UgYWxsIGlu
c3RhbmNlcyBvZiBQRl9NU0dfTEVOX0RXIHdpdGgNCkdVQzJIT1NUX05PVElGWV9QQUdFX0ZBVUxU
X1JFUV9ERVNDX01TR19MRU4sIGluc3RlYWQgb2YgYXR0ZW1wdGluZw0KdG8gcmVsb2NhdGUgYW5k
IHJlbmFtZSB0aGUgdmFsdWU/DQoNCklmIG5vdCwgd2hpY2ggYWJpICBmaWxlIHNob3VsZCBJIHJl
bG9jYXRlIHRoZSB2YWx1ZSB0bywNCmFuZCB3aGF0IHNob3VsZCB0aGUgdmFsdWUgYmUgcmVuYW1l
ZCB0bz8NCkdVQ19QRl9NU0dfTEVOX0RXPw0KDQotSm9uYXRoYW4gQ2F2aXR0DQoNCj4gDQo+ID4g
DQo+ID4gVGhhbmtzLA0KPiA+IERhZm5hDQo+ID4gDQo+IA0K
