Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AE2A2B949
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 03:52:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2152A10EA05;
	Fri,  7 Feb 2025 02:52:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UnDjjMe2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F91210EA08;
 Fri,  7 Feb 2025 02:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738896739; x=1770432739;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aQgYiGtzMrMFh4RwweueNk/SfxKi6tDwceAIH3Mb2po=;
 b=UnDjjMe2AidslFSZeXxsby61cY66Bg7puW6m3cICaSGl8rXIrs1+WMs7
 1hVDMf1ucpuAAvkZhZVF+ipmm991Kd5xKOgxcDFFx+1aMQdzOyIfj8JAf
 n/DxzazsCV2GH+RQ173Vus159o8RJSiyJubw2wb6HDqFjZkHgO7MiXkGp
 1CRxg9p9xDFJEcIk/6fkg0vd2eYb92pmefLVINlXV+WbqFcm9kvgqQe+v
 jOxboS+/7aBW9aUq66v5bjW4wvy0MmDeKd45ngVLW3vVHlyU9XhE82Wge
 HhIqcvwENhrHaJECZmH5w8d8WQzwVTnkt+bn2HnjmsSftIigsGGuGAq0z g==;
X-CSE-ConnectionGUID: OGEkz5K+QgmfMyQWwyIncA==
X-CSE-MsgGUID: Z+E7B/inSSOg4j7VYE8nEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39555109"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="39555109"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 18:52:18 -0800
X-CSE-ConnectionGUID: Vjzy+ylOQZ+hgOH4ClyIMg==
X-CSE-MsgGUID: IymhbUTyS+KaHbSjeaDN4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="116020403"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2025 18:52:16 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 18:52:13 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 18:52:13 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 18:52:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qBimeiOFtMG9fvBuTKwO5G+COLqW0fWBybCaUhGzC7JO3Mye1qAxXiPBZIL6ZQfyu3AhCsW6k8WRpIot2REHDaSzAp2XS/85C4vJg0rZ8unAQX+w4tgRmRxZDzi2qHzybNymkXCK3Kfw5R00MVMJ969d/Aab/GH+SZfDN4QyhCM3iZZ+aizQF6XAFaw0ZnmrEH+8/6qwr4jSR3iQYmadQvYjDxHJSOx5w3LSgQ6yhe/97RPdZjfRsqCSpipryhNuUK9ZsgVNvQXhaEhlf1GgIAQRKSyrDOwn83onaEDZMLm6t3tCrnY2Sb7Mn1PfX1CALs+GlGZwikpVSZgJoiCiNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aQgYiGtzMrMFh4RwweueNk/SfxKi6tDwceAIH3Mb2po=;
 b=vq1zxgqKC/ywQ8j/yjobuDNO/El+O0G/fTJ6c1Dw/jqpXIMsrEuvJIVCXKfhKhnUol8ZhilzuvWUWHdyjIndygsPAJrS6B18X8HC354DM1lebIBo7Gc2zeCRptfNN6pHOr+8ZuJQEpKHwJKOHTaQ3cNL+QNz2gpsJrqn2eYO+qby2kGJa6ki1ID5yw6Zb3IUaBXHU74HoaG5pNm8tc15m6xgMsxCtbeIBgNDT7gc03TgtOfTO1rnG3N+ebOg7AVIxVU9Vi3YZ9hPSYv74K6l3d3x6OmwEuS0F5zibXYs5yz7LGJJdYMo8CRJX17Xzby+RAwANQnOdwWDFQ/od3WHmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7134.namprd11.prod.outlook.com (2603:10b6:930:62::17)
 by SA3PR11MB7525.namprd11.prod.outlook.com (2603:10b6:806:31a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.13; Fri, 7 Feb
 2025 02:51:55 +0000
Received: from CY8PR11MB7134.namprd11.prod.outlook.com
 ([fe80::cd87:9086:122c:be3d]) by CY8PR11MB7134.namprd11.prod.outlook.com
 ([fe80::cd87:9086:122c:be3d%4]) with mapi id 15.20.8398.025; Fri, 7 Feb 2025
 02:51:55 +0000
From: "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>
CC: "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "tursulin@ursulin.net" <tursulin@ursulin.net>, "airlied@gmail.com"
 <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: =?utf-8?B?UkU6IENvbXBpbGUgZXJyb3Igb24gImVycm9yOiBjYWxsIHRvIOKAmF9fY29t?=
 =?utf-8?B?cGlsZXRpbWVfYXNzZXJ0XzU4MeKAmSBkZWNsYXJlZCB3aXRoIGF0dHJpYnV0?=
 =?utf-8?B?ZSBlcnJvcjogY2xhbXAoKSBsb3cgbGltaXQgZHNjX21pbl9icGMgKiAzIGdy?=
 =?utf-8?B?ZWF0ZXIgdGhhbiBoaWdoIGxpbWl0IGRzY19tYXhfYnBjICogMyI=?=
Thread-Topic: =?utf-8?B?Q29tcGlsZSBlcnJvciBvbiAiZXJyb3I6IGNhbGwgdG8g4oCYX19jb21waWxl?=
 =?utf-8?B?dGltZV9hc3NlcnRfNTgx4oCZIGRlY2xhcmVkIHdpdGggYXR0cmlidXRlIGVy?=
 =?utf-8?B?cm9yOiBjbGFtcCgpIGxvdyBsaW1pdCBkc2NfbWluX2JwYyAqIDMgZ3JlYXRl?=
 =?utf-8?B?ciB0aGFuIGhpZ2ggbGltaXQgZHNjX21heF9icGMgKiAzIg==?=
Thread-Index: Adt4bQt4ppEmAW1NQ5OTdHEaZwpkcQARRKAAAAkBNgAADTiuAA==
Date: Fri, 7 Feb 2025 02:51:55 +0000
Message-ID: <CY8PR11MB71341D4BB1DAA6FDE53CCC9A89F12@CY8PR11MB7134.namprd11.prod.outlook.com>
References: <CY8PR11MB7134D2D3BD641BE58310EF0189F62@CY8PR11MB7134.namprd11.prod.outlook.com>
 <01316a42-bcc0-4255-8750-3c5e8329161f@intel.com> <Z6UcMPGQ7HiwHEPj@intel.com>
In-Reply-To: <Z6UcMPGQ7HiwHEPj@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7134:EE_|SA3PR11MB7525:EE_
x-ms-office365-filtering-correlation-id: af44eea5-d43c-4ad7-9a6e-08dd47226212
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?STZzQWpiZ2pDK3ozcGVONlMrT0JCVk5WcGhRSUttei9vc24zb3VtVTVXa3Q1?=
 =?utf-8?B?Zkd6SkRPMkF4eFpzN1dMTnYydk9tZ3g1Tk03UVA1bmNGbUxzN2hUTUM3OW1I?=
 =?utf-8?B?cmhlTG9vODNscWtDRjhsSlNMMVEzZGJWWG1lV0dXRVZjVTBFc291WnZ1d1Zn?=
 =?utf-8?B?Vlg5cDlPTHJNekZSVmpLQUkwVEdqRDlEWk9wVVRueE9pTHA4b1ZLU29jditQ?=
 =?utf-8?B?MWd6Vmt3c2dHVS8zcHJ5VGRGb2txemEvTUpuSlBNWG9tVk9YNjhkU0tjMFRk?=
 =?utf-8?B?S2xBbm05OHdBN2hPZW9CbldLSVRDNm9FSXI1N0ZVdTRZLzRLVkJWemtUZDlY?=
 =?utf-8?B?blpQcVJ1ZkNhclorRHFpWDFJWjRDTDlyQWQrZTFkUUs2N0ZFVHdMbnJFYk9V?=
 =?utf-8?B?Yjd3L2JkelMyM1ZKUk9PVjRqam9KTXpLTDM4cFZjZStnVjRGSGU2RGYranN2?=
 =?utf-8?B?TUVieGRJNm5vdWI2TDBSYnFqTjU3RkZTdFh1ODlCTGVRYUtMZTZGMlREWldN?=
 =?utf-8?B?dUJIOU1GSlpIdng3eWNyd2tNK0oxYUFkOGxHNFJ6bEErUTlqNDNyRUx5RDJX?=
 =?utf-8?B?VVN1RXlJRThRb3drb0Nhc0JtaGNWWWNhYlFNZjZxQVZFdlpsakV5R09sdDJa?=
 =?utf-8?B?S2xVZUtGaEtYWHY5cmlQQlNvYlc3SWhiZHE5ZjJZNDRkUzdwSWF4K3RMVzlF?=
 =?utf-8?B?SmliU1JlQjF0N21TcUs0bVJUbVp6cFpQUEhDakh1eCtZMHBid3U3UFJYbENz?=
 =?utf-8?B?cDBZVXpsbjFxSlp1Wi9hbmVPWVpXMHBXQ1QvdHNEZFVrM2F4LzdvMEQwemtP?=
 =?utf-8?B?M2t2ckZGYnpiNHQ0dm5wY3NucnlFcHZjNFk1YUJ5MG5EMzJOdnlNelBJM3FB?=
 =?utf-8?B?RFVKekx2cVlDdFhESnpIRGh0R3BqOVM4T3ovUkM5eVJWM3U2b0dCYndyREsr?=
 =?utf-8?B?OWpSK2szbzBFUkNzWkVRekd4UEVucUpxSE5hVm5hZC94MUFoZkxLeW1XdkRL?=
 =?utf-8?B?MGtJRXB6blFZaVZPOFBqTnFqTm9WMTgwbmN2d0oyKzdVRnJDSE9wRFlmcmEx?=
 =?utf-8?B?RFNhK1IvTFRJTVZmZUFOeWt6ay9sQjJxcDVLYWQwcWFpOWE1LzVUbFY3QTdk?=
 =?utf-8?B?SE1nVDBYc3JmM0QvdDdsOHdsREJOdU5GWjlzNEhSVnd0VUlQWndSRE12MDhM?=
 =?utf-8?B?WVlGQ0U5SUxBQ1Yyd2w5K0IvY1g0SStoZ1VYaFFiS0V0RmV0ZzRGT292QzZR?=
 =?utf-8?B?b3hoWSsyMHRPK2tjSFhOVStKbEdEMVhtN3NPV1N5VnVVMGpEZWl5cVlqUVZQ?=
 =?utf-8?B?aEFTTDRjcGVQQTF5MWlFeFBINjZMbDY0cmhhWjU0WStMM2llWUxEMU52K3dr?=
 =?utf-8?B?V1RPQ3ZPSjQ4d1BVTkxXR0U4eDNrMkk0SmI1YmRVYm9haTcrT0ZKaVNxeFRO?=
 =?utf-8?B?MUFDYlJsVzdMOHVlTkFkLzVxNjN6YUkvY1IzQlo2MnM5b2lPdW4vazIzcGFJ?=
 =?utf-8?B?eFpobSs0VWVidGtXZXhub2E2eEhKRTBrZjVHYzJhRTUwT29tZjQ0N0xzUDI3?=
 =?utf-8?B?ZUxOQXlqdDNLa0VVbjlBWGFEejVOTDcxVTNqRStackpMRFpqMUloN3Q5WGlB?=
 =?utf-8?B?aksvVFoyYXZVM1ZSZXRkQU9yQnZjQWc4SkpPQU5lRU9Td1o0dDB0MzRGU3Zt?=
 =?utf-8?B?MVB3Y0cyNHVJczZZdDdlcjNEbXJYQUp4YXNhTS9pYm5XSStGblpMR2lkWThJ?=
 =?utf-8?B?ZUxsb3Q0RUJOdlpsQzdEKzRUczB0WGdWSTBkb1FkN1YzMWNDc2JRczlGekpp?=
 =?utf-8?B?MktMODBFaVJVNjJ5MTkyOHpGWGNvVEhadVZnZTlUUWxpeHZ2ZXFkQUE0OG01?=
 =?utf-8?Q?ZoVK5Vn0yxJ4j?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7134.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TlZHektmdm05d3JNNWNITENoa0tmeXpEOFVpSmFzZlN3eVRUWEdJa1JsWlh5?=
 =?utf-8?B?cHVxeEI2NFVSazhIZkliNzUwMGtEMEF1NUNYZ0lMM1lNMktyZWRaUnF3ZGZU?=
 =?utf-8?B?VnpLbTdqM2FHTEVzY3RsYlRDSUdIVXpXUFo5Q0dHSVc4bkRuWWUxTHhGSEhS?=
 =?utf-8?B?VVlJT21mMTN1TnAzOTBKMDJpbUtibndMZHA0Z1hIODhtK0dlOUpKdlZPdlZE?=
 =?utf-8?B?ajk4REJ0MGliNlNBbmNCZUFwOTJYNmF1c0pzSEJQQW00eHdQNkh5UUI1VXdo?=
 =?utf-8?B?WGxXRC9rOVNHeS9tZ25RcHYwMFdOSGt2TERWejdQREM0NlpqL3R6cWM4MCtu?=
 =?utf-8?B?Q3p1dHVOMnRQVE9qdUJnd1o4c1Jjcm83d08weWI4VFFFeitCZEIrclU1dEhB?=
 =?utf-8?B?SHI5QVNnRGpRNjJhWTBUOUdxeWFxYWt5NXZvdXNFZTVVMXNBWFB3Q3pkWm4w?=
 =?utf-8?B?MGt2WUt0WnZFc1l3UURHY3ZweElWOWdlOS8ySWQyRWY0OHpPZ2NHV0cxVWZU?=
 =?utf-8?B?ekczaW02U3lDMkhmaXF0RVI3VEYvRElVWkVERmh4bUlabHJYMFFNTkdWT0Mx?=
 =?utf-8?B?N2cydlA5cGZyZ1NBU1BicDhPeWFzbWJVTi9FMHhiZ0E0NENnRlVsVG91dmhv?=
 =?utf-8?B?Y0hjL2FpZGFXaDBtMTFiakM5eHoxNDBtWFlHTEtCN2VOTGZLL0VoeHBkZVdt?=
 =?utf-8?B?MVFnUzc2TzJuUmh2Sy8yb0VxUSs0MTgwOEVGTGhyWElmSkJYQmJKZTJMSkdl?=
 =?utf-8?B?S3IrczF6bFRydE1aK0NLejhLTDVScXMwdXA3bFYwSll4VUUvUGxaa0xwWHlZ?=
 =?utf-8?B?VC8vTWZLRVc2aVBZODRhcjIxZHQwbk1UVW9kUlBRVmNqNU1jczZxR254Z3g3?=
 =?utf-8?B?M1FQUjZpNWNENzBldm5nYmJWN2tNY09ncnFNNE52UUFSaTJVcmh1NHBmZHRX?=
 =?utf-8?B?SC9rSjBVRlNvMVovMVhpczlIaC9ZNlNIWnFlYVk0MjJXNExORTFKSWRCVWlB?=
 =?utf-8?B?KzZTL3FHc280ZGVRYUlSSEM4RWRpajZ5aDNZRDNSb3piaXV0bjhQRlhMOWxw?=
 =?utf-8?B?UTdFU2dSbjV1K0g1ckJaeWNCNElKQml6RThDbmVURVVvS2h4ZGwyUXh3d1hT?=
 =?utf-8?B?dXYzdmFmNkdPMEkxNDZmaVgyRlVCa1Z1VCtvbTJSZExsaEFSeDRnZ2hZRVpM?=
 =?utf-8?B?NFJKUnBqdWQ0YlRSV0EzeHB5bmlndDE4NDVDNmZFUTRRUWM2aVhoSXJiMVRl?=
 =?utf-8?B?Z2N4bVo3OGZwNHVRZGhGZUpWYmhqNitLcGI0MWhuUjF0MUNXNGhtWmtLY3Ev?=
 =?utf-8?B?T0VxeS83Y05Tbk1uMlViRHFKUlJDRHh3S0RnNkVCaUlaSWJUa1R3cHpMQXZL?=
 =?utf-8?B?ODYxYUJYanBGOWlQL3hENElzeENDcjR6Q0k4VzloUEJIU2tYMk0zU2hXa0Yw?=
 =?utf-8?B?ZUJIK3RkTk82MmJmaGNDOE45S1B5VjBmTGFDV2M4N3BzUEhwYStlN04wTHdG?=
 =?utf-8?B?c3FJK3hPTnE1OE53MUE1RDAzUmp0UjR4blhUaCt3bGFnVmx4VHdmcG5Ua3FJ?=
 =?utf-8?B?N3RHbUxrL1lKS1ZZby9ZZ3VLQ0xNcWpBT3BQalZlRzVQcnF5V3pMNU1CdkxQ?=
 =?utf-8?B?N25DNm01Y0NRS2RiUFhLcHkzdTFZVUFodGRVY0J1K0pHUlNrTVROREtDNDJK?=
 =?utf-8?B?cHI0dmtTR0ZmNFNEYk9LQ3pyaGI0akhXYTViWG54Ukl0c0JrMUlaSEovb0M2?=
 =?utf-8?B?ZlhabHJsanVXVkFMZ1p4NVIzVWxTN1NpSEpKZzZhZ3FVc0p5WHhYQXZvam1w?=
 =?utf-8?B?c204UzZ4QzI0Y2ZQWnRoaWtEeVhCVU81VDcvOFNXL0ZZOHhPMmpOWWUrMWpp?=
 =?utf-8?B?clN0S1MwV2ZYK2NBTHdkdVFVU09ZN3lWNVIzZlZhcDFxdTI1UU9nQUdSMTlY?=
 =?utf-8?B?Zk56NHVWa29hc0Y0Vko3NVJUSEZOa2FOTWpBZnRpVkJJTDB4bm9hTDgySTRr?=
 =?utf-8?B?Q2luc041cmNmSTZYTkhWY3ZsQXFaSmJXN0xrMndKL3lySmlyZXZKanZJKzV1?=
 =?utf-8?B?TDNUMitldnJnNDQxcE1icnAzTFZHUU1wM01UQWFscmVMa3AyVFNncUZPb09u?=
 =?utf-8?Q?J9tI/d6vcT6JWgJ4YnFdkX21K?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7134.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af44eea5-d43c-4ad7-9a6e-08dd47226212
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2025 02:51:55.6051 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: INoKuJii+togKXJ54vpLEJFi83+1NCfj5JP0ao7By4tEr9yJbyX2J8DBisdh8r9mOcYlW9LqeDVqE/4czMEiwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7525
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

PiBGcm9tOiBWaXZpLCBSb2RyaWdvIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPg0KPiBbLi4uXQ0K
PiA+IE9uIDIvNi8yMDI1IDE6MzQgUE0sIFpodW8sIFFpdXh1IHdyb3RlOg0KPiA+ID4gSGksDQo+
ID4gPg0KPiA+ID4gSSBnb3QgdGhlIGNvbXBpbGUgZXJyb3IgYXMgYmVsb3cuDQo+ID4gPiBNeSBH
Q0MgaXM6IGdjYyAoVWJ1bnR1IDcuNS4wLTN1YnVudHUxfjE4LjA0KSA3LjUuMA0KPiA+ID4ga2Vy
bmVsOiB2Ni4xNC1yYzENCj4gPg0KPiA+IEhpIFFpdXh1LA0KPiA+DQo+ID4gVGhhbmtzIGZvciB0
aGUgbWFpbC4NCj4gPg0KPiA+IEZpeCB3YXMgc2VudCBhbmQgbWVyZ2VkIGluIGRybS1pbnRlbC1u
ZXh0IDoNCj4gaHR0cHM6Ly9jZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtLWludGVsL2NvbW1p
dC8/aD1kcm0taW50ZWwtDQo+IG5leHQmaWQ9YTY3MjIxYjVlYjhkNTlmYjdlMWYwZGYzZWY5OTQ1
YjZhMGYzMmNjYQ0KPiANCj4gV2hpY2ggaXMgcXVldWVkIHRvIGJlIGluIDYuMTQtcmMyDQo+IA0K
DQpJdCdzIGdvb2QgdG8ga25vdyB0aGF0IHRoaXMgaGFzIGJlZW4gZml4ZWQuIA0KVGhhbmtzIQ0K
DQotUWl1eHUNCg==
