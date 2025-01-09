Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29437A0748C
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 12:22:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C10B10ED73;
	Thu,  9 Jan 2025 11:22:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BiY2dHho";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69E3410ED73;
 Thu,  9 Jan 2025 11:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736421735; x=1767957735;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UDq2pIYSTJt2WqlZzl7JagD/9icq6d2+ddx6ujXODi8=;
 b=BiY2dHhoc4sNws/jvcKKgFso8zX2qWgzbW/93hlf1pRtKP3nhwP6yxrZ
 G5NQct4+zMulQG5rwTgYyCBemIoNxeOoh+d3dBsSvnYCwPUsUhdFFMENP
 t7LhGm/yA/fhYFRAblvymadA7yzPfHw9XMQyILFSjMPK/0Oe1dXBL1awR
 iTRy/+NICWK/8nofxG9oGm3F/gIOOX9Z9knBP2d4i5r/1D+7oKg2Zj0oK
 3oHUYpQVkGC7swmLvOJHBLy8wmrHuPMDdKH+l/W7MvGX8SSZ21qIlOnsa
 qogEFrqw3tSlFj75UFOqxASw8pJA+8RQ8Cb0WDkL8cYOzSAhkmJMwIjvD A==;
X-CSE-ConnectionGUID: Tlnl2q2KT/iogoX0YUMu/w==
X-CSE-MsgGUID: ayvvchPgRB+ZxhkokYJemw==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="62054668"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; d="scan'208";a="62054668"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 03:22:14 -0800
X-CSE-ConnectionGUID: /QNRXqYEQcCAVd7znq3msw==
X-CSE-MsgGUID: PMSE01mcRqC6R9GrGlPtZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; d="scan'208";a="103889901"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jan 2025 03:22:13 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 9 Jan 2025 03:22:13 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 9 Jan 2025 03:22:13 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 9 Jan 2025 03:22:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ib+23IEg0qLFPJIPJwnbUrDn8X1SSX8A7R8y2PAkvOu3pOLKX0/71uri5iF4FtEiReTWsFvYEliHT2WKi7PeNDSBuZSfLkMGoe+Zwtvljf+exx40U2CJWGvoq9eWxhaJTipz8uOYTYnNZkgsRBso+WRlsbFiWDCkAMANk2Qt3g6cmKuQQQOibcUMBbl17vKrccgCJj/AhFeFfZs34//bCB377LXP+C1hnsImx54O14ZrYGGlgpjjWoDBBAs+4cYZadl1vN3d23i3LPWkbmjkKirEgw3kBnLswjgNLB/yO+h8MbrZfcU7NOTni0gdBu4i1JNuKr4qKZe2yfJ54lUcyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZhcYmBFHXSNkqrLAao0NLcHb9cpV+k6tfLqbjTi5tk4=;
 b=AY77z+AW+r6Kj0ypQ2I6P4W6dR5G59I+WZ2jhVCJ22LZH+t36D/XGPwwJtCJjoeLsOtj5KLN+AmSNyLatbnXJLYBe1OtY/tIVid3dJ0uw4LN4tEpAERnXc3Ky/iXq0bbQoIFf6UwLZsflAZqhaX1R3KsNEq/OePEy4PRQ+QmVz8TN1u5jOHB7bo2Gw4ZD1gU7wPR9coCk+uccr2oNZmjGq0tFLHSNIBgWGSa7QqdCf8qKdQWtEuhVFLVNDXA3rwrlZTPaQmhvn/VmBGZK7Fc7OrROGSjWSBUfTtpvGkrEAlMNzU9qAq/L8wLbcQXnoQLQMN4cT7XeryctmU9vTVj2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by SA1PR11MB5780.namprd11.prod.outlook.com (2603:10b6:806:233::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Thu, 9 Jan
 2025 11:22:10 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548%4]) with mapi id 15.20.8335.011; Thu, 9 Jan 2025
 11:22:09 +0000
Date: Thu, 9 Jan 2025 11:22:00 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <rodrigo.vivi@intel.com>, <tursulin@ursulin.net>,
 <karol.wachowski@intel.com>, <tomasz.rusinowicz@intel.com>
Subject: Re: [PATCH] drm/i915: Add VM_DONTEXPAND to exported buffers
Message-ID: <mk5kmhrk5kpqaf4o2wfkqt4rqijsprj6r5om5ygcempavigl46@eqeupyenr2xj>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20250108105346.240103-1-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250108105346.240103-1-jacek.lawrynowicz@linux.intel.com>
X-ClientProxiedBy: ZR0P278CA0115.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::12) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|SA1PR11MB5780:EE_
X-MS-Office365-Filtering-Correlation-Id: 016559d1-fdd5-41e1-7f86-08dd309fdb87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d2hzQU9Sc2lBR3BlSElsSFZUTFlweW1SbkxFcHBRRVB5YW9rcDlqblhYL1ZX?=
 =?utf-8?B?OHpIWXJMcmxYdVdZOUNJWHRidldUVytMcHUwSXgvL0w4ZnJ6S1ZDODdnOExa?=
 =?utf-8?B?UDNSNktwRnRZZmtZeUNJZFdtNXBCOHYxa3hpdGlNVDlPT2duMTBoNUM2NHc4?=
 =?utf-8?B?MVp2MUp4QU1uVGpFaFJGZU9KSTcybDNjeUVHSnhxTStWWHZmWUs5UE82Y2ZV?=
 =?utf-8?B?SDlJQm40RE83NUNLNjhCOTdKdnJscG1pbllFV2pEQ1ViVHh5YmpqS3h5Yk9i?=
 =?utf-8?B?YWg1SlltejY3SnJpd0dtVXVwYmROMVQxOW1MRi9PK3NZZHRpdlF4dDhXWWFo?=
 =?utf-8?B?M0NDUndGK293QnNKTmNOV0NhSTBDTThKL0dFb3NzWU9QdFRjWFJDZVY0a01T?=
 =?utf-8?B?N09UT0pjWS9WcVgvY2dySzc3b08vU0VWeE9sQzZNZTVVcHZveVVVSnpna28v?=
 =?utf-8?B?RmdwVlJjVUs4NWJuejlPSThaUGZNamVkN0tvSFZZc2JVd2VHcTRPS3p4dFdL?=
 =?utf-8?B?R1hwb1EyS1NlZlNVWndyS1VPd0EzbmFhcmxtaElOVStWc2FVLytkcktGU0V6?=
 =?utf-8?B?NVNxcm1YcGlrMTJZUGtsR1BvbzJ4K051a1FEUTh6M1RWQWZQK1lsUUFXMXNF?=
 =?utf-8?B?OUtNbGtNcWZ1MFdqSkQ5VWJWNDltdVphWC9oMENKNFFkSTNCdlpmRDZDQm9x?=
 =?utf-8?B?ZFZMakNoT3BnS2NoWldjVWhaSERHNXdGQzdFRVg0RkdvMDZkUFZqK1BHaUJh?=
 =?utf-8?B?OEF0ckRlVC81RUM1MjhXalNlSGVZdkk0NUJFazRsZ1B1QzdnL2Q4d2JEc2NJ?=
 =?utf-8?B?SjFPem55ZFB5Um1LcmpVVWFvaUdCeDdiNnkyeCtMd1JBNUcrejV3Qlowb01o?=
 =?utf-8?B?Sk8zYkNISnRtakl6d2JWOW8vY1ZJNFJUc3BwVzNlL01jQUhxS0xUWHEwcFBX?=
 =?utf-8?B?U1RyTHY2eFVKZld5MTA2Q1F6N0lQa2JSNjQ5amF5QWNuKzhxalg5eUxsWHI5?=
 =?utf-8?B?UnQ5cnJFT0lxaGtRUHdVUzhXaExqUzhyRTViYmM4L09tOXN4QmZuM2p5WU01?=
 =?utf-8?B?Mmk0ZkkybGNQNDRua3N0SURQdGh5SnR0aThOVGVaM2pvWEdaUENkcnhLeUVZ?=
 =?utf-8?B?TVlncWtpejg1V0I0aHI0bUV0dkxsaGVzOXVBbUw5S0RLaE9RbFFOdTY2UWdq?=
 =?utf-8?B?K3V0S0JtaDNzRVZQWCtzZXdkNmcxNVhEdDNTOTBhaGZKaG1ab2ZSbFlFdkhZ?=
 =?utf-8?B?Zkt1ZDVzaStmYWh0MlNXVFk4K1JhV1pDMVZpb2dpRDEvdTBraVA0UjJxT1lY?=
 =?utf-8?B?YWdFMFNlSm5aQTlSWWZIUW92WllqMm83YWxoYlRIc1Nrb0t4aGYySC81ZHJQ?=
 =?utf-8?B?a0V2K05BK1QwMGw3NEZqRjk1a3pkNjd0UjJGSnhodjVJVk92a0N1SmZBdE9y?=
 =?utf-8?B?aUdYSHplRWZ3Y0NpWlpOcG5CTk54MGF5ODM2OFA1SXg4cElCaUg0TE5qeUR1?=
 =?utf-8?B?d3JQamNsRkVNRmJMSkkxb0hEUVFGMlZhZVBKb3h5QzZLL3pwbndjZlJWSzNL?=
 =?utf-8?B?bDRtRHpMNlVVMklDWTBSUFd1M1FpRWc3QmF1RnVNdkpPSU9mK2wrS0oyYXhC?=
 =?utf-8?B?OVUzTCtYNDRsY1pUL0Y1T1R6TThxbmhWY2dJOWRlakRreThxdVV4YWFzdC9v?=
 =?utf-8?B?QWN6eEtZaUdSeC9ZaEtGcWVjTnB4bHoxN2tzdXc1WFdwaWozb3JwOFVPUFhK?=
 =?utf-8?B?eHZ5YUxIUzdoUTJrbUcxWUxNYWViUy9Dck5oT3QwcG5RMU1kRUtwR0tzdGZ4?=
 =?utf-8?B?dVNWMkdCVVhGNjZKK2lTaTJNMjRZOWZ0NUQvUTczZ01kSzNMQWJEVk9VZlFv?=
 =?utf-8?Q?S0jUKUGU91d0+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGtma2NyUHEwQjJvVjR1Vnl2RnhHeDVDamdlRkRYTmRFRWw4aStRa3llVnZV?=
 =?utf-8?B?ajh2a2Noc0ZmS2VlOW8yYS95NnFpMVRmbnlTTjZBUm1YMnEwZU5SaGdqeVAw?=
 =?utf-8?B?U0xtQ3duSnJNSUxHQW8wRFREUkM3UWk2cVVoZHNEejA4MzZYSytsVzJaSjMw?=
 =?utf-8?B?SE5BRGZzaXMwTnl3V3FwdDgxbXk4aTIzZGFNbTRueExDSHpEa2hRSlhMemhR?=
 =?utf-8?B?ZG9QdFYyTTdLbWE3dkFZM2xVZ3FjcjExbWxFT3pLc3VGeGtCWFN6T1NSVy9r?=
 =?utf-8?B?VkhFL0dVOEZxekpDWi92ZXVjYk1hbm5FMlk2ZEl6TndPalBsZjVSU2hiNk54?=
 =?utf-8?B?dklRaFJuNlZBTWZSWFJ0MVU4dnFkUVhEOHJYSHQrSk1zeTdUOEc3a2tXYUZM?=
 =?utf-8?B?eVA3bUtoVGpXcEozQUtCczN1Wkg4RE5BQmR0dFhNSFFWcU9yS2VRTGd6OTNw?=
 =?utf-8?B?T0xVdG5EQXVXanBXLzhYS1NNYUZFKzVQVlRFTHJmbFF1UWNCTUZYU2ljK2VT?=
 =?utf-8?B?cjlaNHo1bW1DcnI2Um5jN2lJRUJDWkVVMHQ2SWozeDN0b1NDamRxSkJseXFu?=
 =?utf-8?B?TG9jUnRVUzNlWHlxUVZHY3k4WmVLZERWSTkrditZZXBLUmFsUTJTa3lCUmxm?=
 =?utf-8?B?bW1ydHFTYXR5UG9sU1ZVYXhvaG8rcjN2NTI0NUFaUTBFcnpOMFAwMktuZUsy?=
 =?utf-8?B?ZlhCekhKR0szaTFiaVl3R244Q0NUdnFnTkJ6TTNNNHVUVERCWTJDeGRxYkpG?=
 =?utf-8?B?YmhRL1UxUzExcVZnVXdpSEo1MTVZTDc5bFVFNzVuNmI4cjFGTk9WUTZDak81?=
 =?utf-8?B?aDZyd1NiVjBXcXc0OFlrcFJWQXlOTG5MVkE4cFcyaUxYcm9tb2FkOGJrc2tR?=
 =?utf-8?B?d3VIa01hcDRVa21nR045emtUcTl1d0RrYTFFZlhucGFqZmlFcVRWQ3lnam1i?=
 =?utf-8?B?ZlIyM254MXhlTlBvMXFpNlZuUXByS054S1MwUHlVc3duWTJ4MFE1aDBYYzhn?=
 =?utf-8?B?aS9RZFYxWG5CTS9ScWhnTmc3ZjJVSVpaVElkWWo5T3VjS3VmdWxqWVlYZTFi?=
 =?utf-8?B?Q2s0c2E4OE9pTmdZSi9PK2thUC8yWFNYSUZoNENRSjMvRGxYSGg2V2FnRjgv?=
 =?utf-8?B?TDhSVU8wRHhMcW5CaGNjS05mZWpHMmpNMjB0ODN5OE5iR0ltTlM3V2lYQlNY?=
 =?utf-8?B?RzlhU2hiKzdNRVdQOWFqUkdJc0JDdGpUUXo4aVBFTUxiclRyTXo2eXVZUzBL?=
 =?utf-8?B?ODk5c2hzMFBPV3lhK1YxV2N1NlFOZlVFTzhXODNaV2YvR2UwRmcvNTFZQ0JG?=
 =?utf-8?B?M3F2RVpxVXhFNGtMdlpiSkRFcjU1QS9ZWmlURmVmSmg2YkZpVVlxUEdDUHhm?=
 =?utf-8?B?czZraCtZeTNEdXVLaVNpNG5IOXZBYncvWDRuYjhCS0R0Y29iSmNGTXFBYVBo?=
 =?utf-8?B?QnBxc21KdmtZdzFDak1WeE0rVFVPSEFOQm4zQTNLV1FnNG94TVdFWTR5TDlL?=
 =?utf-8?B?Vi94d2x3U0JLYm9vMkUreEtMVlkyQVExSjBYRmk5K3RKaXM4VFFWZkszYkR0?=
 =?utf-8?B?dEpLa1dObHBqWUFOd1RKUHMxVURVc0N2K1lkQ2REZ1FxOGJnQlhRakxYL3hi?=
 =?utf-8?B?VDR6S3dlYmlQb2Q0NzM3ZkN6UHNEclloenRkZFVaZ3pMeXVodEo5d1R6ZnNx?=
 =?utf-8?B?Z3NyYzFWSHJGdGlIeForVDA1S3JONXN1cjhqOXNiNUdpam9YZE5jclRVS3p4?=
 =?utf-8?B?Wjg4SkVqUHV5R0wxaEVzVXNiL2hlZ1ZSOUJPcis2WWpMOUdCcE4wVG5SL2Yz?=
 =?utf-8?B?MEpPVGxBSjlPaVNlK2ZnekVPQm56RU5jWktQU0kveEh1aTRrR3RqRmMyLzlD?=
 =?utf-8?B?WlprUXhVVjZkN3dLOVNpRk9sUk15bDB1U2lEMVVwbXZVek9IUlFkMjlvWnov?=
 =?utf-8?B?V25Ia0pITkgxbXpnOWdHZWwzM1h4ZC9adVp5MENMUlU4UjFBU1hEQzZoa0V5?=
 =?utf-8?B?L1NPaUp1cVNSOGxKdFQrOGxPQ3Y4bWxPak1iWVB3dnh0REkvbXRwNTQza0ZH?=
 =?utf-8?B?K0pMWWV4cExtRmFhejFyV2piME1pdElvblVvNS9ZdDA5YXM5Q3V5elFzOTVi?=
 =?utf-8?B?TUxFUXdZMDJjR2RXYXYyaXZWKzVtSHpkUE5mSDlFcTk1VWZySjVvUWNYd3dY?=
 =?utf-8?B?N2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 016559d1-fdd5-41e1-7f86-08dd309fdb87
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 11:22:09.9224 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5YBFud5jUxjSunmw2022dO1jWgGugPuyGvsgr7EPVHqRGYFI8w5RqobFPIxyO+Aeu/+IVEn411MuXrpYsI2NLLAriuQ0/4F8H2Edo2flE8s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5780
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

Hi Jacek,

On 2025-01-08 at 11:53:46 +0100, Jacek Lawrynowicz wrote:
> drm_gem_mmap_obj() expects VM_DONTEXPAND flag to be set after mmap
> callback is executed. Set this flag at the end of i915_gem_dmabuf_mmap()
> to prevent WARN on mmap in buffers imported from i915 e.g.,
...
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> @@ -110,6 +110,7 @@ static int i915_gem_dmabuf_mmap(struct dma_buf *dma_buf, struct vm_area_struct *
>  	if (ret)
>  		return ret;
>  
> +	vm_flags_set(vma, VM_DONTEXPAND);
>  	vma_set_file(vma, obj->base.filp);
>  
>  	return 0;
> 
Is this an existing issue somewhere (on GitLab for example)? The fix
looks good, I'm just curious how you noticed this problem and if the
patch should have "Fixes/Closes" labels added.

Krzysztof
