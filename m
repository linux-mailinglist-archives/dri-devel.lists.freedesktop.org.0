Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9886C9E1597
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 09:25:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17BAA10E952;
	Tue,  3 Dec 2024 08:25:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LeSJGz12";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F322810E952
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 08:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733214341; x=1764750341;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=87Anmxn89/hoCvTxrqMhSGhv3yRtTmuiYtJUrfNj4rM=;
 b=LeSJGz12y7OwvrIhHXQENXSY+chdSrLTGjkl01JJqsB2rBh7SCU9M8g9
 R9ld1sx0SfR40JBgNuyarZQnPJo7pkEWUu7uKIg+kh89nQEn+U9ImgnzE
 YZef2P8zmoDSgfpcWsXC8wwM9NnpF2Ec5FDCnEJc01xx+HGn4g4C05X4k
 tv5bFl23S/9MzCXm24eoPYJkrGgZqACv9CvSeHdHbydmb7qpuy0xpQjwO
 DiO5d5ili2uKRF7R///TiuJwkhx/8vvoat2BPs498smZJwlttk9VFGJhS
 29ssfnRzOCbeHxYPOUqPLZqr0H0NxO7Dj3UxWKth04MwwgzpuZj1E3P5y g==;
X-CSE-ConnectionGUID: U8gW1nQbRviAnVseJUlvJg==
X-CSE-MsgGUID: C4K+1VPuSNGhs2injXmPjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33290052"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; d="scan'208";a="33290052"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 00:25:40 -0800
X-CSE-ConnectionGUID: 1qfN8BQyQNqxW3TTdTGyhg==
X-CSE-MsgGUID: 7KfVzyTSRbaCj+94MnjErg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; d="scan'208";a="93184229"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Dec 2024 00:25:39 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Dec 2024 00:25:36 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 3 Dec 2024 00:25:36 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 3 Dec 2024 00:25:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UruvJ/lnLR5DSxFnOJZon3y3ntZSh423DRDatRpcg6c3Pek6cczsaN9J1/2LLmfDkVIhTlDD4wprDET2/2wULr3TOB+G8hCnhZmLaSWdKwCZ1jkjU8lBbSMaV80KDYc3eH/19aDHOGkxlXzkkd/xsrOBSukOkBPORbXkI0IPZ6GAjrzrDahnEEiZ6swkXJWxR0fWanQa3yc5Utnnpnb36qp69QuSScdSo18P/QwMZlp/3tuIdpk+1N0sd5zubSkfR+66Xv1067y2VyPNF7rbAqg3J6mBrfNfY66NpkDONlNraDlWGIH8Y9T0ShUz4oohTtYulMIHPqCllOTugwFn0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=87Anmxn89/hoCvTxrqMhSGhv3yRtTmuiYtJUrfNj4rM=;
 b=EmefOsNm5AyyG/iRnKTJi3OciSWavnLJ/hfGKwg3NWgms75YWKJAKZAuJccfL71/+mzZ/XoQluk/+LD1FcVWx8sT4WP74izT+5HDTa0VBuWiPOgEtXpZW/ddWzBB6uKPk/oF71gh2z4SVsPFyfAgMa6yEW9j3YFtfiD3+ZmLNnv9MFCh7h8WDlJQmYAuI7HKee3kskOa2imJdRJosgEgCl/7jVAQU/6Sk3Al7+y9SShUFM/gpKT3UWNTMjFzlGlKwTB0KVRzWSuBEMdFms6RNuD+ywQCFTJfJD3WA9x/uyoxtQlog08uvOhykj8SGLOQ7kKAaQlhsYVrTbDSzbawWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by DM6PR11MB4753.namprd11.prod.outlook.com (2603:10b6:5:2ac::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.20; Tue, 3 Dec
 2024 08:25:33 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%3]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 08:25:32 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Jann Horn <jannh@google.com>, Gerd Hoffmann <kraxel@redhat.com>, dri-devel
 <dri-devel@lists.freedesktop.org>
CC: Julian Orth <ju.orth@gmail.com>, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>, Linux-MM <linux-mm@kvack.org>
Subject: RE: udmabuf: check_memfd_seals() is racy
Thread-Topic: udmabuf: check_memfd_seals() is racy
Thread-Index: AQHbQcYYOJHlXbpmsEeChVg0gfGnHLLT69/g
Date: Tue, 3 Dec 2024 08:25:32 +0000
Message-ID: <IA0PR11MB7185E2589D638EF287E627E0F8362@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <CAG48ez0w8HrFEZtJkfmkVKFDhE5aP7nz=obrimeTgpD+StkV9w@mail.gmail.com>
In-Reply-To: <CAG48ez0w8HrFEZtJkfmkVKFDhE5aP7nz=obrimeTgpD+StkV9w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|DM6PR11MB4753:EE_
x-ms-office365-filtering-correlation-id: 5d179699-38f9-4374-c68d-08dd13740df4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?aTgxN0hSeUoveEo4Y1Zycm1lYTFDL2tZdFZud0w3OUx0MWtqMk9IUDBqNzRS?=
 =?utf-8?B?Nzl6YVlTWFZNbTR1RFR6dzdJSU1kd1ZpTWlBTnRrTERTUFMrYU1PS1ZBdVFa?=
 =?utf-8?B?K1VKbjNVUSthQkxNZXc0TGU4R0J4Z3NmM2ZvTmxGVlk5eWJzOUpVMlNCaGx0?=
 =?utf-8?B?blVYSEkrbXp2TGdFOTR4eS8xZEIySk9SZTd3Q0tqOCtRYlFJRXR3SDB0T0JY?=
 =?utf-8?B?Zk9jQnZSbFhBeStBaXM1ZHVON1JEdVJjUFFmbm0zcEZNZ3Q3WmVzVncrMG9z?=
 =?utf-8?B?QTNDWUMvcDFyQk1yMVhjb01oVnNZenVaQzlQaDNPZDB4Z3dhMUFhNkYwTzhw?=
 =?utf-8?B?cnEyVmtYaTFWUmlxaDFnWmNJYmNmbWRuSWM2c3ZpTEo3WGk0aWxQTEsrL2tV?=
 =?utf-8?B?eFlXNjJSVENRSytxK0RqczRqSFB3Z0tQVTNBbkFGNUFkZWJkODRvblRzdWNy?=
 =?utf-8?B?V0g4RXFBYUFaTmtLSlEwTUF6cmRHMkxiNkRFVTlyTThwOWFNVk16ODkrOWNo?=
 =?utf-8?B?V2RiU2dDVWYvUk83SDFRaENNd29zUWpzVlVvdjQyOHFXUWkxWGpZdGlKbEo2?=
 =?utf-8?B?ZmJ4Wk5tdEhlRW1XRmJwakhQMlpYbEdDOEJkNEYwYXhVdzFZcVkvQVJaMTBM?=
 =?utf-8?B?V1YyV0Z3MWxzSEVuRnpROEVJOVduYmU0QnFQQ3ozOFRiMlp6Qmt2RmE0QytF?=
 =?utf-8?B?RDV4UklnMDZWQXNHY1grUlcwMVZqeG81K2FSNGlRTmt2VDNaZzZTNEsrV2lm?=
 =?utf-8?B?MmtKWDdSTS96Qy9oTDBENUdmQnI1dThjODBaWUE5QzBad01Ba2lNbURJRW9h?=
 =?utf-8?B?Zk9NRmYxa29QZzJ2SWNQOXNKMTJxY2t3SFVEaENmdHFYVEhWZEcxYm5uS2Vr?=
 =?utf-8?B?T0YrK0dQd21ITUxiWHFIODJPenNMa2VobGpWeWxRRUxZMk80NUFUdjZGdm5j?=
 =?utf-8?B?d2xHSWgxRWJGOE12QmU2ZVFkdlVKU0wvMVJ0OXRsakYrTEZqZlppdUFNZG9Z?=
 =?utf-8?B?VEFKU0hWNnRUZDMvU3p6ZzNubkQvWjhIZHVQQTR3TTlsdFRteC9EanVXTEQw?=
 =?utf-8?B?TlZ4M2VhOWNkb3d5THdxTi92aXppNGRnRTBBWlVpTDd1czVhUGxUS0V2dWdP?=
 =?utf-8?B?akp0UGl6dVBFOStndFFhVGdpTFJDSUZ4MFdXQjRKUWZ1c21LaS9PV1VJN0No?=
 =?utf-8?B?UXUzdGJHSjlFdXRaSFB0WUFWTlJieWk4Wmd0dTB6UmxvZXQvSFU0RkR6a05k?=
 =?utf-8?B?ZUFEeWVreWRTSlRwYVlXTVdqVU9PZ1A2UlF1RHhnMGpxRXpnNzVYSldubG1F?=
 =?utf-8?B?Tk0wYnJuS3RNTWs3bmxrd1EvRU9UZWtOMm9tSGRSendXNll0cXFaRzRBWDJ0?=
 =?utf-8?B?VUxjcVdsTlRQL3dIcEdMSUNDcmVmQlpBUVJEa2wwNFRyRi94UzVES2FjZkt3?=
 =?utf-8?B?K1FNUStGaGd4bENiM1JaZ1hQOGFlSVBOYmVXamZINDBIcVllaUt2MnZHVmlV?=
 =?utf-8?B?ZFpRWDNFWThpM1BYSlBBMVRQam5sMXZqYXhyVEhZcDBrMUdtdDlFUUJUYno1?=
 =?utf-8?B?QnBDYVE1SGhoNkZKU2FURVNYRE5CbXN1K1FmWVBxd2FkWFhyMVlMS2J3aXNK?=
 =?utf-8?B?a3BhY2EvUUxHTkR4Vm9DODVwY2VPSDlkVldIT3hWVmx1MmltaHdQS2c5bTBR?=
 =?utf-8?B?RTc3NVZ0T0RCYWxESTVDQUlCSmEzY3gzZEhXb1VPYlUwakZRci9VaHgxUlJX?=
 =?utf-8?B?NTJRcG5SZFc4YWFvTTl3Njh1Q1FhdWVNQk0wM1M2Y2MvbkQ1N3RmRTB0akw2?=
 =?utf-8?B?bzNmK3dRUzQ1YVJyOCtMY1hhbzFpTTA4S3FpUXlaNU9yRkZ5cEpleHR1enhU?=
 =?utf-8?B?OThWa3pPNWF2dzVZVWFFZ2Uwa1ZGWHFkaVVRTHN6N3R0YlUzVXJ1YkpnMEQv?=
 =?utf-8?Q?cGIQMU79M84=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YmV6VlpUOE9Vdk4xZFdmdUN4a250ejQ5eFlERGtOaUdvMVdGUU9pSTRVcEp5?=
 =?utf-8?B?KzBTL2h5MWI0VGVDTE0rUXRzUkllaThWVVRlUGQ3VTc3L2FLYzNwTVBzcHFR?=
 =?utf-8?B?bjNacnFPZWtJZ2VoRnduODc4c2VOQ0JnckdZajVTRk5ZNHdFenllTWU5R0RF?=
 =?utf-8?B?bWJzT1M1aWFNRjVmNFpaaVpDTGVXc0dKRnlsbkFub2V5aC9GaGZNbE1pVC9m?=
 =?utf-8?B?OW5BYWdDa2FzY3duY05JZkVJcnRMTWRxNVUxWDZjTjU1RXdnM2hTY2lzc3ZR?=
 =?utf-8?B?NXpwSzMyQUpTK1ZyTEx0ZnUrdWNGYzBocE9DaXA4UURBYUpBNytqTmc2Z3px?=
 =?utf-8?B?OXZnd053VzYveW1WVDViVE1wMlNDUjdLM0lST3RHZ1huOWcyWmFMeklGTDY4?=
 =?utf-8?B?QndRS0I3QldCODVBbjFGVXBMTk9od28reXJoeUFoaTFGVjlNcytvUU92Q1VC?=
 =?utf-8?B?SEp5RXVycGhCMHRMZmt5N0dzSFZlaThiT2ozK3ZTc2R0K3hqUU8zdXJVZTJC?=
 =?utf-8?B?cEFIOERyRFQrWGc5Z0FyVFdUYnpTbndxeDBMSkVSWS9tNkdpeXR3bnFXTTUx?=
 =?utf-8?B?RE43ekpCZUpremZxUzc3emhLTWtJV0ljOXlneTdzTUNqTGlBL2VRSHJCZkZ0?=
 =?utf-8?B?R28wdXgzRys0N0Uzb2kvRGphTC9CRk9tZEcySU1UZzg1U3ZxS1VRZ3lIQURj?=
 =?utf-8?B?WTNmTGJIaXpUcmtLOEx3SVh2VHEvZkFQbEQzeW5XVlkycnFOYVBDUEh6QTdv?=
 =?utf-8?B?YUJmWFcvN0FDQko2UzIrcFI0TWtDZXhpZ0tpY2xhbEd3anFzVGVNQ1QrU1Mv?=
 =?utf-8?B?bkptQWpFY2wxWmladlVkcmEzVXNFcWh3UHhFczJWOHIxdXBCQnFYRUhUVTRn?=
 =?utf-8?B?ZkZUYnFpRVNjZ25EdWNzTnFHZUNlTzduRlF6Vml2bzdueVBpc1kzNXdGYncx?=
 =?utf-8?B?TnZPdFE5b0JTY2xUemx5cHkvajl4Rlk4ZW94TUwxZTBUeHptVTNVN0tIbmNm?=
 =?utf-8?B?TVoyaTRBODZZZ0lpWmlTYVI5MENLSXk2aktCTFhLZ2pWUmNVTmlpVDVtSWRH?=
 =?utf-8?B?cC9GNmNveVBKS0JiQStUZ3hPOWdyUm9uYXpXZnNUY1FNVnlrTUowVWIwYVlt?=
 =?utf-8?B?WGV2ZnFVK3FHd3ZKSEF0RVdGaEVKdjEwWDdqUTJyY2N2NDM3MHdISS9peWVM?=
 =?utf-8?B?UVhkZEttTXhPMUZ2cncyMmw4TVI5Y28wbmZ3UHJCZG1yN0JHemVZM2IzMG0y?=
 =?utf-8?B?YmV3OGhvUEVUK3p1dkxOcmY1L3hDa01lK0RUa2h3Vk51enBCNWlHd09uNXl6?=
 =?utf-8?B?dlhVeDVackZqdEpyVVhPRXcxbEttMFQvc0U0bnVRTEN2NnhlQ1VNc0VQNHMy?=
 =?utf-8?B?LzR1MTZ6dGtrUG53eFhQMzlNc21SMlhxOFVUTGdRWDF4TFB1MDM3Q0pObzhF?=
 =?utf-8?B?UnVmeDVGSUxidHhSUElqTWZsVTZvR25TZ2wvUlUyS3UrZlk1QTl0U3JBemxi?=
 =?utf-8?B?Mm9pR0dWdEIwMHpHQys4VWlpT29WWnh3U1EyRi9GZmlrSUpDY1R2aHRjZ2Zu?=
 =?utf-8?B?MXhxRWVFSUU0TU9KYkhMN2pVUFpnWVZzMFViNkVYazlRcDF2U2UrNWdscFpI?=
 =?utf-8?B?TDlLbGxxdndCUzNRUmRrUVkzTWU5aUlLOEdlaFBiV0NnMDd2VC9WRTRna1lM?=
 =?utf-8?B?V3pOdDQ2ZHd4VWFNMVJwTUZUSllWVjVIQWhyNHR5SHJCbHhZZ1FaYys1dHg2?=
 =?utf-8?B?YnN0VThhVjNqSDgwTDdEWUVwQzlvM3dIdDBRNC9ZSWVJTHI4anVoN1k5bWtB?=
 =?utf-8?B?N25sZk96TXhWa2RRcnR1ZERielBXMmtyVFltR1Bwd3UyKzZRKy8vRUMxdlBF?=
 =?utf-8?B?VXN6M0phYVZmSU1wcnl4dnpKNmJON0ovaFZrL0gxci9LeE1DODBKYTNIT0p6?=
 =?utf-8?B?YUY1b0FWcW5veVFKcUtPM2lIZjJlYWtvT21BdkVEdFlaMnNaSE9iQW5LV2FK?=
 =?utf-8?B?UnJNdlRQMnJNRlhrN3d1U1pwOXhyNHA5WHRtMVRQaDZJdTlLMEVFQ2wvQkUz?=
 =?utf-8?B?OUU3ZWVpR2Ztd3poNHcrQW5TUUdLZjIvR3FycXdDeVhvd0wvN3VoRjU0cnJ4?=
 =?utf-8?Q?AyMOULCpPxj+us+fdg1qilVyV?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d179699-38f9-4374-c68d-08dd13740df4
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2024 08:25:32.7475 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bdlB71QOwYq5GKDN4fMWb06TCMcxvPPLSXjZsISSyKW/wJFhrBT5ILp8wxMr3P5Fm/n1uxGNgaZrq+CGXQcdlxu45SBmwq1vrbELZuV/xPs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4753
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

SGkgSmFubiwgSnVsaWFuLA0KDQo+IFN1YmplY3Q6IHVkbWFidWY6IGNoZWNrX21lbWZkX3NlYWxz
KCkgaXMgcmFjeQ0KPiANCj4gSGkhDQo+IA0KPiBKdWxpYW4gT3J0aCByZXBvcnRlZCBhdA0KPiBo
dHRwczovL2J1Z3ppbGxhLmtlcm5lbC5vcmcvc2hvd19idWcuY2dpP2lkPTIxOTEwNiB0aGF0DQpU
aGFuayB5b3UgZm9yIHJlcG9ydGluZyB0aGlzIGJ1Zy4gDQoNCj4gdWRtYWJ1Zl9jcmVhdGUoKSBj
aGVja3MgZm9yIEZfU0VBTF9XUklURSBpbiBhIHJhY3kgd2F5LCBzbyBhIHVkbWFidWYNCj4gY2Fu
IGVuZCB1cCBob2xkaW5nIHJlZmVyZW5jZXMgdG8gcGFnZXMgaW4gYSB3cml0ZS1zZWFsZWQgbWVt
ZmQsIHdoaWNoDQo+IHRoZW9yZXRpY2FsbHkgYnJlYWtzIG9uZSBvZiB0aGUgc2VjdXJpdHkgcHJv
cGVydGllcyBvZiBtZW1mZCBzZWFsaW5nLg0KPiBTZWUgYWxzbyB0aGUgZGlzY3Vzc2lvbiBzdGFy
dGluZyBhdA0KPiA8aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtDQo+IG1tL0NBSGlqYkVW
Nnd0VFF5MDFkalNmV0JKa3NxNEFFb1o9S1lVc2FLRUtOU1hiVFRTTS0NCj4gV3dAbWFpbC5nbWFp
bC5jb20vPi4NCkFGQUlDUywgdGhpcyBwcm9ibGVtIGRvZXMgbm90IGFkdmVyc2VseSBhZmZlY3Qg
dGhlIG1haW4gdXNlciBvZiB1ZG1hYnVmIGRyaXZlcg0KKFFlbXUpIGdpdmVuIHRoYXQgUWVtdSBh
ZGRzIEZfU0VBTF9TRUFMIHdoaWxlIGNyZWF0aW5nIHRoZSBtZW1mZCBidXQNCkkgY2FuIHNlZSBo
b3cgb3RoZXIgdXNlcnMgb2YgdWRtYWJ1ZiBkcml2ZXIgbWlnaHQgYmUgaW1wYWN0ZWQgYnkgdGhp
cyBpc3N1ZS4NCg0KPiANCj4gSSB0aGluayBvbmUgcG9zc2libGUgY29ycmVjdCBwYXR0ZXJuIHdv
dWxkIGJlIHNvbWV0aGluZyBsaWtlOg0KPiANCj4gbWFwcGluZ19tYXBfd3JpdGFibGUoKSBbd2l0
aCBlcnJvciBiYWlsb3V0XQ0KPiBjaGVjayBzZWFscyB3aXRoIEZfR0VUX1NFQUxTDQo+IHVkbWFi
dWZfcGluX2ZvbGlvcygpDQo+IG1hcHBpbmdfdW5tYXBfd3JpdGFibGUoKQ0KSSBiZWxpZXZlIHRo
aXMgc2hvdWxkIHByb2JhYmx5IHdvcmsgYXMgbWFwcGluZ19tYXBfd3JpdGFibGUoKSB3b3VsZCBw
cmV2ZW50DQpGX1NFQUxfV1JJVEUgZnJvbSBnZXR0aW5nIGFkZGVkIGxhdGVyLiBEbyB5b3UgcGxh
biB0byBzZW5kIGEgcGF0Y2ggdG8gZml4DQp0aGlzIGlzc3VlIGluIHVkbWFidWYgZHJpdmVyPw0K
DQpUaGFua3MsDQpWaXZlaw0KDQo=
