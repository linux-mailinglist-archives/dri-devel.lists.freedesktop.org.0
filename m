Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E4CA454BA
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 06:00:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFFBF10E20C;
	Wed, 26 Feb 2025 05:00:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KymP+7cW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 542A210E20C;
 Wed, 26 Feb 2025 05:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740546023; x=1772082023;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=EYSFxgvwZg1QI2to3zpEyN33Uxzpeg9ANqgFdFMeN0Q=;
 b=KymP+7cWhS7PH2PmltwCB8ywDseTDemD5KcRngrJ2rjUZtIRI7R4G0uM
 Sj8ZFzhzGBdnHvAs+7d3yNfaq87xSYNUyOF9jz7QSJzHMKPnvSNCOKZDg
 baiLwT8jjVlJuM1f1bfBivJndVHI73v2oZWo9mvucXcKtaYiggm0hmk2F
 QTlCkWmKb39VPNfNxSKZTQHgeRIoCWKU6t01mP+4duLk3vHCkBW1Ux9pc
 TwWD2pFf3wt9SwlMOKx9fHXsgwrGpmj9eA3DDa6Pd2nX+p4eB4HWX/q8u
 f4YIqGBivKEzTQ3YRtQ+PjB2uBYX3UoBWeezKNlCE0VcuDs4Il53emwaN A==;
X-CSE-ConnectionGUID: fNooruyqSkyBtXm2N3G4RA==
X-CSE-MsgGUID: dKkPr7WlS1SGfxvG1JHplg==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="45028510"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; d="scan'208";a="45028510"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 21:00:22 -0800
X-CSE-ConnectionGUID: Wy1dk5v/R4K63M1FwVyflg==
X-CSE-MsgGUID: NuodjVcrQf+frvlRxIgtMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; d="scan'208";a="147419224"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Feb 2025 21:00:23 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 25 Feb 2025 21:00:22 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Feb 2025 21:00:22 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Feb 2025 21:00:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JKEGb5da3cVXVDWn/uiE98wcqjwHU/qGNuMyjgyLRugqypaOYMgAnaQPLGIR68/fKJ4q32I4JoD9SLR5TGqtlB43ZfylP1PigHEtKx8hJCatyHVejVyPA0fGbWb06c/BHmOYyvbGYql7r3867oGDn8E6xC6aq8bQav9na0djjVLMLoSJtJHKvcrp7VZxEGTFJ3A8pImTubXkIAg+QvcMLYk1Qq+TsScHdV6xESZv6IUfJ51KnkN/i0l091U6x0vfllW+pnyRrKSsveF7h9pgabcOes5oSY1iwOXsKpl2r4hen4TPgCGMSF4qnOsDgudJOQm+Q8u+5wzC75w+rToTMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bC6+mWw7U9mAyXZIDycP1sn/OGeyZ+ozApymP7v3rEw=;
 b=IS4CNYqBy2cf/uCtBwyJJXRHbgp6WlZQSRSyCwVNjEKQ42Cs/QMJdWux6C2NN/8UWguAtr3yWAJyx2ypqFrZ2KO2+JEhErh7GistB83I5vT86rTs80EwZHpp9ekOaK/PiEslW0P6NG7IKPZdMCpSb628J2IhbZOvWRv4NDeAlCuIjCTEWfygalZxmodlhOh4siT7rxhJLNrGxltbLS+Saef8JQnxSkb/xlYkjMlTkdu1pvCmUHj4fyJsd/5BRkXQse7OUDk7mz9TnBmMSViulh2/Ceb1TSsMgG6blX6YiGYG/1IAOf+sxFuIygH8RUu7JDYIUhqNzuDH8GhWWDGljQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB4900.namprd11.prod.outlook.com (2603:10b6:303:9e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Wed, 26 Feb
 2025 04:59:47 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 04:59:47 +0000
Date: Tue, 25 Feb 2025 21:00:49 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <jeffbai@aosc.io>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, =?iso-8859-1?Q?Jos=E9?= Roberto de Souza
 <jose.souza@intel.com>, Francois Dugast <francois.dugast@intel.com>, "Alan
 Previn" <alan.previn.teres.alexis@intel.com>, Zhanjun Dong
 <zhanjun.dong@intel.com>, Matt Roper <matthew.d.roper@intel.com>, "Mateusz
 Naklicki" <mateusz.naklicki@intel.com>, Mauro Carvalho Chehab
 <mauro.chehab@linux.intel.com>, Zbigniew =?utf-8?Q?Kempczy=C5=84ski?=
 <zbigniew.kempczynski@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Kexy
 Biscuit" <kexybiscuit@aosc.io>, Shang Yatsen <429839446@qq.com>,
 <stable@vger.kernel.org>, Haien Liang <27873200@qq.com>, Shirong Liu
 <lsr1024@qq.com>, Haofeng Wu <s2600cw2@126.com>
Subject: Re: [PATCH 2/5] drm/xe/guc: use SZ_4K for alignment
Message-ID: <Z76gAbZjF3b0jLb7@lstrano-desk.jf.intel.com>
References: <20250226-xe-non-4k-fix-v1-0-80f23b5ee40e@aosc.io>
 <20250226-xe-non-4k-fix-v1-2-80f23b5ee40e@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250226-xe-non-4k-fix-v1-2-80f23b5ee40e@aosc.io>
X-ClientProxiedBy: MW4PR03CA0315.namprd03.prod.outlook.com
 (2603:10b6:303:dd::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB4900:EE_
X-MS-Office365-Filtering-Correlation-Id: 0577eedc-35da-46e1-0c96-08dd56226420
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|1800799024|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q1BScXI1ZDBRejVGQThySW5USWxWT1NQa0czRlJsd2FvRnZ4bFpKaGFOZWY3?=
 =?utf-8?B?ZkkyVG1zTHJyemg2R0sxQ2lsT25hV21yZERnR2RZMS9KdmUrRXNDWUhTdXRn?=
 =?utf-8?B?RE9WK2x2c1diQjNrNXRGR1RXNm1HUTFETnFOc0RhQ1AyZmpCb1I0SUZIWGJX?=
 =?utf-8?B?VzlkVTVGdjNXdk11d2xNV3k0RjdSSFJtRkhhd1E5YVUzNHVucXBTVFhva1ly?=
 =?utf-8?B?NUpra2VQUEtncXA5OFJvK3I4WUJraDlzejlCY280MVlXYzYyREg1NUFsVm5F?=
 =?utf-8?B?Y2RRMGpPQzdLWGtIdzEwNXdHazhDcEpmZzliYkU4Tktjay9oUnYvd01TMmor?=
 =?utf-8?B?azNuS1dNTk5xY1VlQzVEMU1PN0wxbFBPdXlHcjJxYVhOTEIwaXVxNnJXZTlU?=
 =?utf-8?B?dnpqOC9Pc0RKSml6Yldud1lWOEw0NlhVZ3JBVFhHa0h5amhMUE9IYzg0Z2ll?=
 =?utf-8?B?amxvWTJ3NUQ2VUtDSjBnS0RrZ0RCZlowRzhJeXMxUEwzaGVhU0g3cVp0RzBo?=
 =?utf-8?B?ajQ1RExValhYblpxTk44MnBUZFpCbWNWcXNQWGlBdzRkeFoyZm1YSFhFUFcr?=
 =?utf-8?B?M1NOU0VNSi9hQUIyTTEvT1NLMnJyVzVYUkQxWGlCalZXbCs0eWF3R2h0bldw?=
 =?utf-8?B?TTZaZ1J3R0h6Z0tBeTdmNUxXTTB5K1Fnd0VjWHZSZWVTV2xBanV1U1RHY1dT?=
 =?utf-8?B?ZTBRTjBUUUprOUR1WTJRNHdLNkhpRUN3Z0laZEd5eUo1Y3JWZ09icHhQUTRQ?=
 =?utf-8?B?aEIrcXppMWVKOW1wQkJpN0swUlkzbDdUOGlCa3d5WldSL3pRa1cwaWRScWt6?=
 =?utf-8?B?MGdIWkZpTmkwYkw1Z1AvU1ZUaTBwVUU2VVVFQVZneWQxUW9keldTbGlGUW5B?=
 =?utf-8?B?Y2txZ2szYm90RTlQZkJJQTNsMmJma0N0NXY5Zy9EUHkzVllJczg3aTN6ZG1C?=
 =?utf-8?B?TWxGT2lYZHhFRHdyQzdjem4rZFRQUCtiNUIyWnBmaTdHZHNDSDRVVHhxandj?=
 =?utf-8?B?NlpGN1pweEZ0Wm1RekpRUFpOYW01TVpHK3VDTkNhRjgvUWlxeUU0U1M0Vkl0?=
 =?utf-8?B?VDVSOXQxUFdHaEtzcE05T2tsNWhibmxsUkduQXVLdG1sL2hFQlhCZllMTGky?=
 =?utf-8?B?clZCRTFQQ3hGUTd2TnV1UlROcXQzTWJzcWdaeTZ1bFpSc0xmUkhJWGg0WUIz?=
 =?utf-8?B?V29aa0psaDQxVDJpc01uamFsYlNYVUI4dkgvbGxXWTV0NWlHNHpUVFhJbkZm?=
 =?utf-8?B?WjJLeXBKVmQ1eHdQK0tHZ3F5dXlTbGpnMjQ5MXkrN091dXRxS25HZ0FpVy9X?=
 =?utf-8?B?bnA2T0ROay9Rc04xWWJPR3pkYmI0cGxoNXpsVDhYWEYrNXBXV09SUjZkRmN2?=
 =?utf-8?B?aGx4RFE2RkFsSWdXUnFnTXpVeTBZeldoUms5VGhJUGdabzZSOVUycWE5SDdh?=
 =?utf-8?B?eWJnSmJOOEkzaWpsSmpxMTVhNm9IVzV0d2NHQmEySkVZSkZLWFRTVVY5SFFW?=
 =?utf-8?B?cCsxK1IyOC9sbVY4SE1EdDlqdTRmSTJTQUVYcG5CRmQrdFU5RVJtQlRZVHNR?=
 =?utf-8?B?V2lzOTFYd3BraWkzWUN1MlRyanRKY1IxNndvSzMyaWw2SERheXZuVnNwL3l3?=
 =?utf-8?B?MDJ2Tzh2Tlh1K0xFWXZMZVpxOWdJcHM0dmVtcUxJa0JnYkVYRUE4WmszNHht?=
 =?utf-8?B?RmczRHR2alhGTlV1c0c4ZGw4aFpJU014MGVHMnQrWCtVZmQ4SXFyb3ByYVFm?=
 =?utf-8?B?eWhIMnI1V3RXU0JuV1F4QTNiRFFNdkdZaGc0cnlMaTlib0FrOUtjYVlwU09S?=
 =?utf-8?B?bEhtT3lzNHk3c2ljeTFUUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(1800799024)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmlqOSs2NkROV2YzaU45TlJ4WGxtNGZXZXlkSnZ6VWdXaDViZUhCL1V2THJO?=
 =?utf-8?B?TTdCQjFIU2hiTFMyL3FSeFpGNHRjdTJaQjdaY2hVU2NnYytOeGhVNzlFdUJr?=
 =?utf-8?B?a0RkU0NLbmozNUJ0VEl0T1hobUtYeThMZ2NpNHZuL0NBRXR5bjcwMzRwVldV?=
 =?utf-8?B?eVFIazIvQ05nTjAvWXB4TXdaZnVwVEd5SFZaL3V6cFdlcTBpMU5XS2dEYkgz?=
 =?utf-8?B?UW5PRmxxdVNJZC9nNG5MZkljU0prcWdsYXUzMWtjREk3WllUajRPQUQ1QTgv?=
 =?utf-8?B?VjNnNWVVWW9ZdC9zeXE4MU9hVWhCZXA5Tys1bjIrZ0Nndk9JN2VkcTU5Qkxa?=
 =?utf-8?B?bmI3MnIzaDVyUEtZdnJmY2s2NDZndnpGNU9SOE0xdGNGU0tYZnVyL3RnRHdC?=
 =?utf-8?B?S3JKZDNCVXVSRHozUHFwMldBcm52RnNwd3B6TjNacklUZGZlTTJzcmNzM016?=
 =?utf-8?B?ZWF4anJvbm1BTHRvMmFWU3FMbUp0VUhEZ2NDYUUwOW9wUVRXb2t4bFpmNjdj?=
 =?utf-8?B?L1N6bFMrVTIzbXcrYWxjK0x6R1YrUnpoekI2dnRVeVhSUXUyWTh6dUd0M2Zv?=
 =?utf-8?B?SVg2U05xb3hwbHdWK2lCNmg4STRRVGJPNnltMEc5SWZZNXZwcTdxNDBRZnlD?=
 =?utf-8?B?eEdiRnhRUEIyUkJVdnhKcnd0TlAzZWR2TGVpUEFUREZoM2ZLckhIV3dNMXkz?=
 =?utf-8?B?V3B5elVjUUd1YzAyTFYvWVNDckpQWHFjTGdZdzJqVjBMNW5HQ3ZqcEFJWUtR?=
 =?utf-8?B?VlRZVTlEaUVOVndPejdqYStQa1lqOUpOdmlKSmN3VDNYQnZQR1RxTUt6VkpN?=
 =?utf-8?B?dzJ1V2I5NTZseUZaclcwN0VtMCtRcCtuRmhoM3M2eTZNeW1KQUZnSUp6V2hR?=
 =?utf-8?B?K21QemdZaVpmZklOcnhjdjlUd0NUNGxsSXYyYk9paHdRM3pJQWtNSUtxSFp0?=
 =?utf-8?B?Sm93S3hTZXVNdzU0WEpKVzZ4Ym41YjQzRFBKYTdhTDUySGpRVFFBU242dlNu?=
 =?utf-8?B?UVZNKytkWHRFaGZCSmZmQU5UY2dVNHc0MzJ6ZFlPb2lLci9uQkhPcDFTSXU0?=
 =?utf-8?B?VTZzUURxVjJmLytXV1pmZGhZTDNUcnhXNnZTTHNjdmMyNllzaUt6MnJCWk5p?=
 =?utf-8?B?RGVnMnE0VWhUWVRaTHZWa0RhZ2tZbSsxTURBR0c4OTZLa1pQeWFMTCtJMTla?=
 =?utf-8?B?MUR2R0p5S2Z3ZnZ2b3lTeUpUN3E2cTllRFYxSFQvZ3hzUm9Uc3lxQnNibG9z?=
 =?utf-8?B?SHk3dk1hdzBPM1hybjhDWmN0V1R5a0hLMkM5cTVtMnhqUGswcUZ3dWFYT083?=
 =?utf-8?B?TFBaNU1zTGpTZ05teXErODdiV3RyTldud0FSNENkTzdoRW9wZ2ZjcnFMT1J5?=
 =?utf-8?B?MGpiVmtKZlV1RllSVDhkMWVVdVl6MlNTSElFUGY3YURtZWhWNGsrQ0N1SklD?=
 =?utf-8?B?dnJIdUtpdUN3T1oyWWVEL25PSXloT0tlN2xqakQzUVRiTmJrNUhNRGdoQlNs?=
 =?utf-8?B?VVBSeXQ5a2xSWnlxVzQ4eHA0NHpMejJVcXBCVVJKOWJ0bStnK01qT1ZzTlRs?=
 =?utf-8?B?WWt2ZzlPbzR6OXdVeHBzcy9YRk1taUo2SmU5T0RYWlJPQWtDUEl4SUF6dXN3?=
 =?utf-8?B?MHVDdklMK3lCOXoyRHo2R1J1VVdMWWdSeXFxVFdoOHQ5SUQ5d1l5MGMrYTl1?=
 =?utf-8?B?dytialpmWkNRaGhCN1NTSzlEVnBtbndVbUxlTDZ6MVR3MDRmSXMzeTZCMFdD?=
 =?utf-8?B?MWlyMjNHdjdKUVlqbDJNU1RFbEx0dVVGV2RuMVVoQm9TS3hldzBOb0dFSVN2?=
 =?utf-8?B?aEhRdHZTNHpkeitnbHlaY0pTYm9TRnBsS3ltb3NMSjBydTAvVk5aVDFrSTIv?=
 =?utf-8?B?SFBIem9mTy9kV0wvRFVDejNuQ25JSTA0KzRpUURPaXRhczdTYnNtajFSSWhW?=
 =?utf-8?B?TGpQRi9YaCtOK1lQejZENTVYVEpVc2ltQ0hDb3FEcEFKa3NQZHZpQ2dLYnhI?=
 =?utf-8?B?Q2lhaHJCTW1hRWdYb2pBejcwazFXdTVTNE5CNDNqUTRRY2pnTitxYTErNVN0?=
 =?utf-8?B?aHFrem9GMExidFJPczF0QXlBME9BckJiOFNRV3IrNDFPcVpHK2lrOEJFNnhE?=
 =?utf-8?B?WU1RL20vbzFHbkg4WjUxa1ByK091VjRGQ2xTd2wvY2NqTFV2M1lCTk9DdUo5?=
 =?utf-8?B?b2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0577eedc-35da-46e1-0c96-08dd56226420
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 04:59:46.6655 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZWXoxkfr3SsXU+NpG9D3+cwz0X4z8RTEVLg2Nid4X9TRJ4BczERP4vmILeikk2QXnTj7me4qicHULJiAuH/EVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4900
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

On Wed, Feb 26, 2025 at 10:00:19AM +0800, Mingcong Bai via B4 Relay wrote:
> From: Mingcong Bai <jeffbai@aosc.io>
> 
> Per the "Firmware" chapter in "drm/xe Intel GFX Driver", as well as
> "Volume 8: Command Stream Programming" in "Intel® Arc™ A-Series Graphics
> and Intel Data Center GPU Flex Series Open-Source Programmer's Reference
> Manual For the discrete GPUs code named "Alchemist" and "Arctic Sound-M""
> and "Intel® Iris® Xe MAX Graphics Open Source Programmer's Reference
> Manual For the 2020 Discrete GPU formerly named "DG1"":
> 
>   "The RINGBUF register sets (defined in Memory Interface Registers) are
>   used to specify the ring buffer memory areas. The ring buffer must start
>   on a 4KB boundary and be allocated in linear memory. The length of any
>   one ring buffer is limited to 2MB."
> 
> The Graphics micro (μ) Controller (GuC) really expects command buffers
> aligned to 4K boundaries.
> 
> Current code uses `PAGE_SIZE' as an assumed alignment reference but 4K
> kernel page sizes is by no means a guarantee. On 16K-paged kernels, this
> causes driver failures after loading the GuC firmware:
> 
> [    7.398317] xe 0000:09:00.0: [drm] Found dg2/g10 (device ID 56a1) display version 13.00 stepping C0
> [    7.410429] xe 0000:09:00.0: [drm] Using GuC firmware from i915/dg2_guc_70.bin version 70.36.0
> [   10.719989] xe 0000:09:00.0: [drm] *ERROR* GT0: load failed: status = 0x800001EC, time = 3297ms, freq = 2400MHz (req 2400MHz), done = 0
> [   10.732106] xe 0000:09:00.0: [drm] *ERROR* GT0: load failed: status: Reset = 0, BootROM = 0x76, UKernel = 0x01, MIA = 0x00, Auth = 0x02
> [   10.744214] xe 0000:09:00.0: [drm] *ERROR* CRITICAL: Xe has declared device 0000:09:00.0 as wedged.
>                Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new
> [   10.828908] xe 0000:09:00.0: [drm] *ERROR* GT0: GuC mmio request 0x4100: no reply 0x4100
> 
> Correct this by revising all instances of `PAGE_SIZE' to `SZ_4K' and
> revise `PAGE_ALIGN()' calls to `ALIGN()' with `SZ_4K' as the second
> argument (overriding `PAGE_SIZE').
> 
> Cc: stable@vger.kernel.org
> Fixes: 84d15f426110 ("drm/xe/guc: Add capture size check in GuC log buffer")
> Fixes: 9c8c7a7e6f1f ("drm/xe/guc: Prepare GuC register list and update ADS size for error capture")
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Tested-by: Mingcong Bai <jeffbai@aosc.io>
> Tested-by: Haien Liang <27873200@qq.com>
> Tested-by: Shirong Liu <lsr1024@qq.com>
> Tested-by: Haofeng Wu <s2600cw2@126.com>
> Link: https://github.com/FanFansfan/loongson-linux/commit/22c55ab3931c32410a077b3ddb6dca3f28223360
> Co-developed-by: Shang Yatsen <429839446@qq.com>
> Signed-off-by: Shang Yatsen <429839446@qq.com>
> Co-developed-by: Kexy Biscuit <kexybiscuit@aosc.io>
> Signed-off-by: Kexy Biscuit <kexybiscuit@aosc.io>
> Signed-off-by: Mingcong Bai <jeffbai@aosc.io>

Typo in last reply:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc.c         |  4 ++--
>  drivers/gpu/drm/xe/xe_guc_ads.c     | 32 ++++++++++++++++----------------
>  drivers/gpu/drm/xe/xe_guc_capture.c |  8 ++++----
>  drivers/gpu/drm/xe/xe_guc_ct.c      |  2 +-
>  drivers/gpu/drm/xe/xe_guc_log.c     |  4 ++--
>  drivers/gpu/drm/xe/xe_guc_pc.c      |  4 ++--
>  6 files changed, 27 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 408365dfe4eed02336bbd208b60491aea27a8a6e..595873780a5774501f04b2f01ebdf8a45c7ac931 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -88,7 +88,7 @@ static u32 guc_ctl_feature_flags(struct xe_guc *guc)
>  
>  static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
>  {
> -	u32 offset = guc_bo_ggtt_addr(guc, guc->log.bo) >> PAGE_SHIFT;
> +	u32 offset = guc_bo_ggtt_addr(guc, guc->log.bo) >> XE_PTE_SHIFT;
>  	u32 flags;
>  
>  	#if (((CRASH_BUFFER_SIZE) % SZ_1M) == 0)
> @@ -141,7 +141,7 @@ static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
>  
>  static u32 guc_ctl_ads_flags(struct xe_guc *guc)
>  {
> -	u32 ads = guc_bo_ggtt_addr(guc, guc->ads.bo) >> PAGE_SHIFT;
> +	u32 ads = guc_bo_ggtt_addr(guc, guc->ads.bo) >> XE_PTE_SHIFT;
>  	u32 flags = ads << GUC_ADS_ADDR_SHIFT;
>  
>  	return flags;
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index fab259adc380be28c79fae5946e123427359ec60..65e88ad43e8adef752889300abd0197a0ac4a1a3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -143,17 +143,17 @@ static size_t guc_ads_regset_size(struct xe_guc_ads *ads)
>  
>  static size_t guc_ads_golden_lrc_size(struct xe_guc_ads *ads)
>  {
> -	return PAGE_ALIGN(ads->golden_lrc_size);
> +	return ALIGN(ads->golden_lrc_size, SZ_4K);
>  }
>  
>  static u32 guc_ads_waklv_size(struct xe_guc_ads *ads)
>  {
> -	return PAGE_ALIGN(ads->ads_waklv_size);
> +	return ALIGN(ads->ads_waklv_size, SZ_4K);
>  }
>  
>  static size_t guc_ads_capture_size(struct xe_guc_ads *ads)
>  {
> -	return PAGE_ALIGN(ads->capture_size);
> +	return ALIGN(ads->capture_size, SZ_4K);
>  }
>  
>  static size_t guc_ads_um_queues_size(struct xe_guc_ads *ads)
> @@ -168,7 +168,7 @@ static size_t guc_ads_um_queues_size(struct xe_guc_ads *ads)
>  
>  static size_t guc_ads_private_data_size(struct xe_guc_ads *ads)
>  {
> -	return PAGE_ALIGN(ads_to_guc(ads)->fw.private_data_size);
> +	return ALIGN(ads_to_guc(ads)->fw.private_data_size, SZ_4K);
>  }
>  
>  static size_t guc_ads_regset_offset(struct xe_guc_ads *ads)
> @@ -183,7 +183,7 @@ static size_t guc_ads_golden_lrc_offset(struct xe_guc_ads *ads)
>  	offset = guc_ads_regset_offset(ads) +
>  		guc_ads_regset_size(ads);
>  
> -	return PAGE_ALIGN(offset);
> +	return ALIGN(offset, SZ_4K);
>  }
>  
>  static size_t guc_ads_waklv_offset(struct xe_guc_ads *ads)
> @@ -193,7 +193,7 @@ static size_t guc_ads_waklv_offset(struct xe_guc_ads *ads)
>  	offset = guc_ads_golden_lrc_offset(ads) +
>  		 guc_ads_golden_lrc_size(ads);
>  
> -	return PAGE_ALIGN(offset);
> +	return ALIGN(offset, SZ_4K);
>  }
>  
>  static size_t guc_ads_capture_offset(struct xe_guc_ads *ads)
> @@ -203,7 +203,7 @@ static size_t guc_ads_capture_offset(struct xe_guc_ads *ads)
>  	offset = guc_ads_waklv_offset(ads) +
>  		 guc_ads_waklv_size(ads);
>  
> -	return PAGE_ALIGN(offset);
> +	return ALIGN(offset, SZ_4K);
>  }
>  
>  static size_t guc_ads_um_queues_offset(struct xe_guc_ads *ads)
> @@ -213,7 +213,7 @@ static size_t guc_ads_um_queues_offset(struct xe_guc_ads *ads)
>  	offset = guc_ads_capture_offset(ads) +
>  		 guc_ads_capture_size(ads);
>  
> -	return PAGE_ALIGN(offset);
> +	return ALIGN(offset, SZ_4K);
>  }
>  
>  static size_t guc_ads_private_data_offset(struct xe_guc_ads *ads)
> @@ -223,7 +223,7 @@ static size_t guc_ads_private_data_offset(struct xe_guc_ads *ads)
>  	offset = guc_ads_um_queues_offset(ads) +
>  		guc_ads_um_queues_size(ads);
>  
> -	return PAGE_ALIGN(offset);
> +	return ALIGN(offset, SZ_4K);
>  }
>  
>  static size_t guc_ads_size(struct xe_guc_ads *ads)
> @@ -276,7 +276,7 @@ static size_t calculate_golden_lrc_size(struct xe_guc_ads *ads)
>  			continue;
>  
>  		real_size = xe_gt_lrc_size(gt, class);
> -		alloc_size = PAGE_ALIGN(real_size);
> +		alloc_size = ALIGN(real_size, SZ_4K);
>  		total_size += alloc_size;
>  	}
>  
> @@ -612,12 +612,12 @@ static int guc_capture_prep_lists(struct xe_guc_ads *ads)
>  					 offsetof(struct __guc_ads_blob, system_info));
>  
>  	/* first, set aside the first page for a capture_list with zero descriptors */
> -	total_size = PAGE_SIZE;
> +	total_size = SZ_4K;
>  	if (!xe_guc_capture_getnullheader(guc, &ptr, &size))
>  		xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), capture_offset, ptr, size);
>  
>  	null_ggtt = ads_ggtt + capture_offset;
> -	capture_offset += PAGE_SIZE;
> +	capture_offset += SZ_4K;
>  
>  	/*
>  	 * Populate capture list : at this point adps is already allocated and
> @@ -681,10 +681,10 @@ static int guc_capture_prep_lists(struct xe_guc_ads *ads)
>  		}
>  	}
>  
> -	if (ads->capture_size != PAGE_ALIGN(total_size))
> +	if (ads->capture_size != ALIGN(total_size, SZ_4K))
>  		xe_gt_dbg(gt, "ADS capture alloc size changed from %d to %d\n",
> -			  ads->capture_size, PAGE_ALIGN(total_size));
> -	return PAGE_ALIGN(total_size);
> +			  ads->capture_size, ALIGN(total_size, SZ_4K));
> +	return ALIGN(total_size, SZ_4K);
>  }
>  
>  static void guc_mmio_regset_write_one(struct xe_guc_ads *ads,
> @@ -928,7 +928,7 @@ static void guc_populate_golden_lrc(struct xe_guc_ads *ads)
>  		xe_gt_assert(gt, gt->default_lrc[class]);
>  
>  		real_size = xe_gt_lrc_size(gt, class);
> -		alloc_size = PAGE_ALIGN(real_size);
> +		alloc_size = ALIGN(real_size, SZ_4K);
>  		total_size += alloc_size;
>  
>  		/*
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
> index f6d523e4c5feb7f07d695af90f4c44c7a9072c2d..dac51f8720fc6c7d27baa31a1b5c567f560e8c1f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -590,8 +590,8 @@ guc_capture_getlistsize(struct xe_guc *guc, u32 owner, u32 type,
>  		return -ENODATA;
>  
>  	if (size)
> -		*size = PAGE_ALIGN((sizeof(struct guc_debug_capture_list)) +
> -				   (num_regs * sizeof(struct guc_mmio_reg)));
> +		*size = ALIGN((sizeof(struct guc_debug_capture_list)) +
> +			      (num_regs * sizeof(struct guc_mmio_reg)), SZ_4K);
>  
>  	return 0;
>  }
> @@ -738,7 +738,7 @@ size_t xe_guc_capture_ads_input_worst_size(struct xe_guc *guc)
>  	 * sequence, that is, during the pre-hwconfig phase before we have
>  	 * the exact engine fusing info.
>  	 */
> -	total_size = PAGE_SIZE;	/* Pad a page in front for empty lists */
> +	total_size = SZ_4K;	/* Pad a page in front for empty lists */
>  	for (i = 0; i < GUC_CAPTURE_LIST_INDEX_MAX; i++) {
>  		for (j = 0; j < GUC_CAPTURE_LIST_CLASS_MAX; j++) {
>  			if (xe_guc_capture_getlistsize(guc, i,
> @@ -758,7 +758,7 @@ size_t xe_guc_capture_ads_input_worst_size(struct xe_guc *guc)
>  		total_size += global_size;
>  	}
>  
> -	return PAGE_ALIGN(total_size);
> +	return ALIGN(total_size, SZ_4K);
>  }
>  
>  static int guc_capture_output_size_est(struct xe_guc *guc)
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 72ad576fc18eb583110b44b118abeba4c6be936a..a58c58e599122f3e9ebd1e8374c17c3b4663a5ed 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -212,7 +212,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
>  	struct xe_bo *bo;
>  	int err;
>  
> -	xe_gt_assert(gt, !(guc_ct_size() % PAGE_SIZE));
> +	xe_gt_assert(gt, !(guc_ct_size() % SZ_4K));
>  
>  	ct->g2h_wq = alloc_ordered_workqueue("xe-g2h-wq", WQ_MEM_RECLAIM);
>  	if (!ct->g2h_wq)
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> index 0ca3056d8bd3fa37bdb79a7a71ef671270771657..9975005732f645b4735f95fbae8ebe431e793ebe 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.c
> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> @@ -58,7 +58,7 @@ static size_t guc_log_size(void)
>  	 *  |         Capture logs          |
>  	 *  +===============================+ + CAPTURE_SIZE
>  	 */
> -	return PAGE_SIZE + CRASH_BUFFER_SIZE + DEBUG_BUFFER_SIZE +
> +	return SZ_4K + CRASH_BUFFER_SIZE + DEBUG_BUFFER_SIZE +
>  		CAPTURE_BUFFER_SIZE;
>  }
>  
> @@ -331,7 +331,7 @@ u32 xe_guc_get_log_buffer_size(struct xe_guc_log *log, enum guc_log_buffer_type
>  u32 xe_guc_get_log_buffer_offset(struct xe_guc_log *log, enum guc_log_buffer_type type)
>  {
>  	enum guc_log_buffer_type i;
> -	u32 offset = PAGE_SIZE;/* for the log_buffer_states */
> +	u32 offset = SZ_4K;	/* for the log_buffer_states */
>  
>  	for (i = GUC_LOG_BUFFER_CRASH_DUMP; i < GUC_LOG_BUFFER_TYPE_MAX; ++i) {
>  		if (i == type)
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index df7f130fb663fc2fd170a94cc1b835b4b4cca167..0f97c6310a3a5696490aaa4827eb3aa0d45ea6d6 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -1000,7 +1000,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>  {
>  	struct xe_device *xe = pc_to_xe(pc);
>  	struct xe_gt *gt = pc_to_gt(pc);
> -	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
> +	u32 size = ALIGN(sizeof(struct slpc_shared_data), SZ_4K);
>  	unsigned int fw_ref;
>  	int ret;
>  
> @@ -1110,7 +1110,7 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
>  	struct xe_tile *tile = gt_to_tile(gt);
>  	struct xe_device *xe = gt_to_xe(gt);
>  	struct xe_bo *bo;
> -	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
> +	u32 size = ALIGN(sizeof(struct slpc_shared_data), SZ_4K);
>  	int err;
>  
>  	if (xe->info.skip_guc_pc)
> 
> -- 
> 2.48.1
> 
> 
