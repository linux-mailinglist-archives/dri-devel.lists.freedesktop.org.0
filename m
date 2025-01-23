Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8B2A1A949
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 19:01:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C3F010E29B;
	Thu, 23 Jan 2025 18:01:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OuGVEjRX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DCFC10E29A;
 Thu, 23 Jan 2025 18:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737655309; x=1769191309;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=+sXKbyD9xnYBw31ARzvSSkX+zra1xqMt1HFg9s3qcgM=;
 b=OuGVEjRXk7gOxzib+BVdlTm1hC1vOBnfPeE3kmdcUmm+WmEyTIe9baaE
 Z270g11gnlFgkUGULpuvYiM/z2bOdOqldTCl2HR/vBBhUAEINHDsawull
 iB4Qqa/eETTzKAAllB0v0u2hmiUnnC9d9YMNVgC525mwoS5thsZdF83rZ
 SGVf+72paVnWrXNxT5u9sYHB8jQCpdu+0kE815AaUyioC3rRKnr2dCADU
 6dA+t8UAOxMh8E4HvrfG/ohUrjqvg7yHTd4kdcBOTRdrzmiul96M/MoR6
 4Y9AUNTIXYSsEGWynborcHrTU5Sr4lW823XSNogukS5uQeGL9i0mmZsS2 g==;
X-CSE-ConnectionGUID: 2AFPfyhWSsOwrnOF2hnUig==
X-CSE-MsgGUID: uUjYrH4ETHKoFlamoT7mfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="41841667"
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; d="scan'208";a="41841667"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 10:01:48 -0800
X-CSE-ConnectionGUID: zLkWGvbeSLWdMgZ8ye2X7w==
X-CSE-MsgGUID: 1G2zInhvRRuDwwuAxl8t+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="138401821"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2025 10:01:49 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 23 Jan 2025 10:01:47 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 23 Jan 2025 10:01:47 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 23 Jan 2025 10:01:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C5K1ZUEWxDze9L27zytkR4tR6MUoQNdMXN35auqEsJ2bGqKzXKUd5F0P8P8zGwPbKTLGvHv0LwCUDln+1Kjy0onbaggJpu6QxeGm7z55TB8OEpIMxHzbzQR6KZOnKbH2aIIPVaqlwRC4ynWdpyyIzL774MyHgiKgvCTqh3Sv51foc1c3pRyFbHhKt8ChaXqCqitYLzYRJVqlwM9PQ+Ct4ighniLRPvOPeNEyj2TGLZufAf52jAo5NY4CvumZF/Xkow1VtAiTzxvIj1Frd9+2Kan8+xtC8+TyV9FlFV/becAr7gTW30QivK9aM73c6u7iLgaqPDwDm9uJK5BGNwjtYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+sXKbyD9xnYBw31ARzvSSkX+zra1xqMt1HFg9s3qcgM=;
 b=rcPjN1DgGlcVF2XWVvsdYipIDXnJkC1I6S6FSnDNySEEXvNwzxmtzMrUtevTK6Bgn5ypZR77Nc0b3VcWdqnlRAgPvkVEa51Q8N7xadFLfYHfj9t4XmNmh48VYivHiE2CrcpLNRMVjoIMFS8h4nI7FxRnoPZsoSyyOnmz6gufK8Mk43lBGwK/usl6IWGDJPt7Lq/7el6IdPM3dDofjbGz6B5FfRDyqMOxAd/+IJUE+sS6h1K1ox6jvF5F6inRI8r+9mBHG8nb0qQAPGOTP3m99nJxZ8fpfNWc7MY/DoZ9CQ/Yy1xu/MePYqX31yYXWOFXKymXkvfGt2wpjLaUcrwlfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 CH3PR11MB8187.namprd11.prod.outlook.com (2603:10b6:610:160::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Thu, 23 Jan
 2025 18:01:45 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842%5]) with mapi id 15.20.8377.009; Thu, 23 Jan 2025
 18:01:44 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Harrison, John C" <john.c.harrison@intel.com>, "Dong, Zhanjun"
 <zhanjun.dong@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>, "Brost, Matthew" <matthew.brost@intel.com>
Subject: Re: [PATCH v4 0/1] Maintenence of devcoredump <-> GuC-Err-Capture
 plumbing
Thread-Topic: [PATCH v4 0/1] Maintenence of devcoredump <-> GuC-Err-Capture
 plumbing
Thread-Index: AQHbbDgGDTaaPjTtmUG4RFIM4/GwLrMh3GCAgALMcQA=
Date: Thu, 23 Jan 2025 18:01:44 +0000
Message-ID: <e638a05b471aef03e692d224f039446e757c6e55.camel@intel.com>
References: <20250121190935.1984508-1-alan.previn.teres.alexis@intel.com>
 <Z5AqpemmzmBX2755@intel.com>
In-Reply-To: <Z5AqpemmzmBX2755@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|CH3PR11MB8187:EE_
x-ms-office365-filtering-correlation-id: 0bf0ebfc-90b3-4785-1bf9-08dd3bd7ff9d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UmhGSXZvWDg4MUNwQVhhSi9KVXBBMUhHMER1Skw2dmVYanFDa0J5OVh0TXNv?=
 =?utf-8?B?V2NvelhZd0RTYlFiUVpPOVlsUEZ2TjdVR3lUWHVYZm1ZaGlFR2lUbk5RaWpq?=
 =?utf-8?B?K2FjeFZSQzl5TWl6Y2U5bW9Xd1YvUFJzZnRVN3p2eUdFQjJ4RW4rNnd2QmFG?=
 =?utf-8?B?NUQ5TFlacnNBU1NQbFcwVVVzZDEwM2k1NDRBRlJIcG5hYnBkM3AvOXRmdHE2?=
 =?utf-8?B?YmFpWXJrQUlucytBL3hpV2c3ZGlvRGNCK1BnbEQ5N2JIZ2Q1S0dDUTdUVGow?=
 =?utf-8?B?OEh4Zys1bDBucllMQ0VZdjRSRUdRaUt2MC9kR1EyZzhsNHFadWtOeEFEMndB?=
 =?utf-8?B?aGRTc2VWQ1FUN24wUUZZdE5HcU5aajJqZTBMQ0hwSXBpWFZGbFJjL25NSXlU?=
 =?utf-8?B?SlhZTUdndFNLdUExdVIvY3FzeTdqa096RlJpU3NXRTRUUmhVQ244eVp5V21J?=
 =?utf-8?B?QnNmQ3VzdlF6S2xDV2xJT0NtcC9GMWJsYTNPNnUvekdsMXloTndoUFM5Wmtu?=
 =?utf-8?B?VEMvQ2taK1NMYXovVjk5eTJOR1dZMFFXa3p0N2EyTjhubGdMRERxRnlkMndv?=
 =?utf-8?B?TXM1aDM0NU1zN2Z6M05CVllMWGJoZy9ZMFpxSDBrUHUzY2svUVpHM1VJYS9T?=
 =?utf-8?B?S2t5TUJiVmJ1NEV0cUpKblpSK0hsSjBlV3l1eTliU2RsbXF4SzhCQWMyTWZz?=
 =?utf-8?B?Y3ZVSkZVYVJzYlhJVlIwU3FpY1dKaytha2tHaFNqZm5qMUhYWmNoY0FmeWRW?=
 =?utf-8?B?SWhqNDNUVjRTanQvOTBydUxMejdlaXd0THo0eVhPNEJrRGs4TS9XcXhVU0lU?=
 =?utf-8?B?NzZHaUZQb1RMOGgxbVNqRW10YVRpeG8rN1g2NTZ0S3dkcnVhODJkbC8veCtw?=
 =?utf-8?B?M0R5SStxTGRJMHdYSkZ5LytsOEhRS2tLMXNhVDhSeTdsRndlUjQxc2hNNGtr?=
 =?utf-8?B?U3Brd0VTb0VhZTY3TGxQYURnUFVBc1VzbHJlL1kvcUtCbjBGMDBCVXZ3QThQ?=
 =?utf-8?B?WDRtbGZEdmcvSHZYOStJdUJGUjNFSFIrQXpsdlFpaTdZd1BadWFlUnhFeHJC?=
 =?utf-8?B?bWpvbVZLejNNVUt2WVhkSU91ajVqV0t0b2Zlak03MkpQbWd3Sm5FUmEzMWl3?=
 =?utf-8?B?MHl3VGhtR0FublE3L2pGYThjb01OclhCVmVYSng5WjJhVXJwMDZpN1hObGpF?=
 =?utf-8?B?OEpCSWUzdTRLUUhGYVhNb2VzalU5NjF1QXNNajJDWngxL0h6YW90c1FjY2tQ?=
 =?utf-8?B?QWxJSW9hZ05nbit5NlNROGluaVhDN3B4VTdjaFVBaU5PdHZ3OGN1Ni9jSnNm?=
 =?utf-8?B?YW5QSzIxS3FkNDg5Vk00WkUwQ3NYV2JkMUVla3cvRWxIOUREUDBybXFYbEo3?=
 =?utf-8?B?aTRnckFOd1RxMzloOXUzenlQMi9iSytEWXIxRzYrNVBucEJjT21hZHBHYzJ1?=
 =?utf-8?B?SzVTdElYamtseUhvb01sNXozVW9wME4rNDZFNTdZblpQS0R6ZUh0YzJ5OUVn?=
 =?utf-8?B?TjZtVHA2WlZyK1R2ZVVOR1l0QWNIYXpBZkphRkNVcHRlTWlkZEVHcHFnbTRq?=
 =?utf-8?B?eEs0WjRQdk90d3U0bnNGbnplMnM0Vjk4a0QwbGoyTVZFZEthSTBPbytNV0Ju?=
 =?utf-8?B?UzlLaUt2OWh1UmpOYnVmN2tCWmdtWDhjVlBWaGJmUWhQRm93ME41TkdNZUhI?=
 =?utf-8?B?YmMySGIwSW8wSFA3K3BrY3lyZFhFQmpoMmxVQTlaYURvSGVOb1hPN2M5WU1I?=
 =?utf-8?B?Nlh3dDNRNVJQQ3p4aDI0TmNBblUzeDd6N3Q1SzNYb1pYV1lzT3k2cEo5MEh5?=
 =?utf-8?B?TVU3WWw3QWhaVUdqQUUxUHJ4UXpSSGJwUjBuYzJWRFBaQW5yOGRuejFMcGRQ?=
 =?utf-8?B?QWY2dXRsWm85YmtoRGJCVVNNUjlxMjFtMDFaZHV0bXR4ZXl6VGJpczV0SHpL?=
 =?utf-8?Q?0s2i0yEzU27vXCk635A210ho3I0EFfb/?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Wjh1eWt5TWJCMmFzaDVyQ2UweDBkMTAvY1ZmSkhFYnFWMDh6NDZuTVo3OGZk?=
 =?utf-8?B?ZUl3bitCZmM5cXFodG1mcjBYTW02VXh2U3hQRkpidERqbWFaTE1DMjZlR09O?=
 =?utf-8?B?L2tUai84QkRMWXFZc1Z5NFFwWHNYb2xsb1FQL0F2aFI2eEJTVVBOMFlCM0or?=
 =?utf-8?B?NWxMeDFmRllJSDhza2g1NVdKaiswdjdNNUtvSWtuZ3NWZW1kZ1ZKYWRNOUlE?=
 =?utf-8?B?MEd2czU3MEtmb012L1BCQStwRVlxMG9SUC9NUGFpU2d5QmhlSmp6NjdRaEVz?=
 =?utf-8?B?T0RLMEJHbXl6QjlLY0c4YlgybVdNR3pDTkszTTFHZ2N3RThHVUtLTExOcWox?=
 =?utf-8?B?T3ErQXhqbncvbjEyVkJDSTFaa3dzWEJWQkRjWW8reFV5UVhIbzRsZGhHOTdi?=
 =?utf-8?B?VzVsWjVSYUdTTXg1ZnBEbGpNWWt6SWlGU3UxSEF3ZlpFekFwZ2Z2bStZWkE0?=
 =?utf-8?B?UGdwNHY3bUNpZDZpZ080OWJMSnBvYjRSK1pOVmtmdDIvSUJtQ1pIa0RRNXFP?=
 =?utf-8?B?WDFYdFVNZ0ZidFNOVkpSSnhwU0svN2Q0c1JDSmdPWE1RK21Kbk5GZkkrdWFS?=
 =?utf-8?B?Q1MyWHk4am9QWUwvdkN6TlhaUjFmN1pSaHJZSGR1WlIwUGkyeEtITVREUTlL?=
 =?utf-8?B?WEI2a2NxUnJ1cUZwWmppRS9aQi9nVDQwTXREZnVMZzFjV3JrYkUzUW95aGt0?=
 =?utf-8?B?dHJwOVI4RlkvNTBPd2RMZ1NaeC84SmpjbjF3OUJ6QUIvZXNRekVwclBTOTFy?=
 =?utf-8?B?c0dpY3hnYmwrUVdjRlBERVNtZndzcHMrQnRrU1pZcmpwbWVBMC94MzNPaXg3?=
 =?utf-8?B?QXE2TDQ2aGxvWisya0pBWVdrZXpqVEkxNlo1YjczcWlURkJLTXM0dFVNdE1N?=
 =?utf-8?B?dDRaN3RCL21GajJBL3g5K0RDNS9qOWNueVRMWk5GU0t3MEZJNE1PQTVQUDJH?=
 =?utf-8?B?UytpNVRrMjhnWTBBVTFwUTRyVkNUREJ1ZnYzdmd6Z1pLNmUzSnExYzJBZDRX?=
 =?utf-8?B?OGVoVyt1SEpTMGs5MzB5a0g1aklQbHFEcmEybGh5WFcrbWV5QnBoOG1kSGlY?=
 =?utf-8?B?ME8vNVIyYVBDRzNLNHdRSmVQUmltTHJ4c1dFZDRPWVRBWkVuMURBOW94RnZS?=
 =?utf-8?B?N3hoa1VtWHprRkhwUkhvZHFodzNpa2VFV1FQM2Fpa24rNWlWYXVNQUNwSm45?=
 =?utf-8?B?b2toWXgvZXdaQitjRGY3N25KQUdFUVJic01nOExDY3pZTEM4KzJocUVONnM4?=
 =?utf-8?B?TjFqZGZHUEk0V0lXRE9PZ0NMaHpGUWwzRFBBY0xXRXVBTXFya3NTVDB3SkZX?=
 =?utf-8?B?R2hUZFVHR2F6cmhQQy9sN29RUmc4aUNDdVRxOEIycmNHZExmSDFuR0pZREY5?=
 =?utf-8?B?QmxOcko5NWR4TmNMQmd6U2tZdlhtR3VkUGtvdUtCcWtRbkU0YnNlbjF4elMy?=
 =?utf-8?B?dis2U2htc1N1Y01YQWI2czZBTllTNW9xc2gwM3VjVXNEN2VIakVsYzhuTzND?=
 =?utf-8?B?SU5IRlRoancrcWk3SldCOFBVb3NSQlFWK1E4STNvTWFkQ092WTJEVTJDcWJ3?=
 =?utf-8?B?OWxRZFptNlI0cWdrVVRsYW1ZZ1dUSEFVRXF5dEJnWEdUWER1dDVDRXlBYnlo?=
 =?utf-8?B?ZHdpKytZYWNEWGZQQUVnVVFNZlphcTFlWGxrSGxoZThlbkI0MmxoUlFlWjJK?=
 =?utf-8?B?SzJwL21rampQTVkzVDNnc2xXMDhrSHBDZEZFQnl0WklOakNqOC9ZYjBzMVMz?=
 =?utf-8?B?anhBQXhvTEt1K2dsK1Q2azJtS2trMGFUTUFyUi9pUEt4WC9yVnBHdXdVV1Vr?=
 =?utf-8?B?UHNHRk5oUUF0RG5oSlN6Z3lQb3RpN0FSR01tSlVHZXprcXlGSEZDc1cwTmNt?=
 =?utf-8?B?U1ZHaGM3THRJZ3dIUGtQaDZWVnJaQXJqSXhqc1l5WGNPRmpsY1k4Ym9EOTND?=
 =?utf-8?B?QnlENHVJd3RRVnJlMEQ3Q3FGTk05NlJIYWlDNDhwbGZBZ0dQVk0yMFRWV2k1?=
 =?utf-8?B?c0pjTS81alF2VGFvOVFiMHV4L01qZ0RQMjNTY0pyQkJKdW1sdmdSd1U5M09C?=
 =?utf-8?B?eWxXcEtpTjNqYnZ3UXVrQU5wZTVoMUczTy85S0p3bkJmbWZOTUJha1hzcEtG?=
 =?utf-8?B?UXN4cGVyL0VZV0crQW01N21CUFh6RzFOQUtvbkFqMUh0a2hWR1FUckEyOHZ3?=
 =?utf-8?Q?P07UYzcnsywaXtQ0A5l2KS0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6B229D1DED91AB4B8553583CB8701F09@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bf0ebfc-90b3-4785-1bf9-08dd3bd7ff9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2025 18:01:44.8883 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WoeVC2EAtbY7BauhSszk4H0QPUR/l6fxANJF0ZhdU/SpAFNwHDC1zyqedhTbdTwuIbRvU0+Yj/lj/s5kmSg4uIEPbwm85e4pRWPM0d6Z9y1f+Z1lpBMAQyOnSkdNyONS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8187
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

T24gVHVlLCAyMDI1LTAxLTIxIGF0IDE4OjE1IC0wNTAwLCBWaXZpLCBSb2RyaWdvIHdyb3RlOg0K
PiBPbiBUdWUsIEphbiAyMSwgMjAyNSBhdCAxMTowOTozNEFNIC0wODAwLCBBbGFuIFByZXZpbiB3
cm90ZToNCj4gDQo+IA0KPiBBICdzZXJpZXMnIG9mIDEgcGF0Y2ggaXMgbm90IGEgc2VyaWVzLiBD
b3ZlciBsZXR0ZXIgaXMgbm90IG5lZWRlZC4NCj4gDQo+IEhvd2V2ZXIsIHRoaXMgcGF0Y2ggaXMg
dGhlIHNpemUgb2YgYSBzZXJpZXMgYW5kIGl0IHNob3VsZCBiZQ0KPiBzcGxpdC4gSSdtIHJlYWxs
eSBzdXJwcmlzZWQgdGhhdCBzb21lb25lIHdlbnQgb3ZlciBhbmQNCj4gKnJlYWxseSogcmV2aWV3
ZWQgaXQuDQo+IA0KPiBFdmVuIHRoZSBzdWJqZWN0IG9mIHRoZSBwYXRjaCBkb2Vzbid0IG1ha2Ug
YSBsb3Qgb2Ygc2Vuc2UgdG8gbWUuDQo+IEkgZG9uJ3QgZXZlbiBrbm93IHdoYXQgdG8gd3JpdGUg
aW4gdGhlIHB1bGwtcmVxdWVzdCB3aXRoIGEgcGF0Y2gNCj4gbGlrZSB0aGlzLg0KPiANCj4gUGxl
YXNlIGJyZWFrIHRoaXMgaW4gc21hbGwgcGF0Y2hlcy4NCg0KR290IGl0IC0gd2lsbCBkby4NCg0K
Li4uYWxhbg0K
