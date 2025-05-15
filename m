Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F197AAB839B
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 12:11:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB71710E827;
	Thu, 15 May 2025 10:11:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NBmFSNkp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42A7A10E825;
 Thu, 15 May 2025 10:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747303899; x=1778839899;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+6+P8jtnqeyljsXA5/wbRmpV1r05AeLneBVkjoc+ycE=;
 b=NBmFSNkpL4bNrEMDC0ZY9sIwQpuEQLNNQJthfgLqktnxjhK74VYLvN8E
 YgpSNajWXkyw6ZqEFEGlOLei1co7JAQ9FIXTi2lMkcmIawNYDQo54wT6w
 wkjGJ3VVeZXxWGVJUJ+Y7NYb5mV9X20RxBFj398Wzvg2vMdh786kCg+pv
 gtciqOmHfCg0tQA3wvr/yzDOLX9p18rirrozT5Etcbk0sdpJQuWJ9l2Bl
 x6DuQu+VOWK6QCAXzjsBqWZxt1Ube5Ckh4886D37zCsn+feTUYDI6lVA+
 ghbRUOr3g4s+pLDboj/7k9X3Wp0WZd+h0Rqz/DwEFmiB9M45vNONPwcXw A==;
X-CSE-ConnectionGUID: eIsce3sLTiiLnTB8+61sEw==
X-CSE-MsgGUID: WY4PRHCyROaiQ05AkzUhAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="60244880"
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; d="scan'208";a="60244880"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 03:11:38 -0700
X-CSE-ConnectionGUID: HYKTny93TYeorz1ID+s0KA==
X-CSE-MsgGUID: d/phchwBTYScTegC5ui9rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; d="scan'208";a="139223606"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 03:11:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 15 May 2025 03:11:38 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 15 May 2025 03:11:38 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 15 May 2025 03:11:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=acBm54m5kQAzomWhWtmA/mKrMljMZg72JHhGC1z03BotaGRutbVptU7jogsMQoID4iCI6cFC45HB7aVAqltgw09m28Dr6fUGfqVRYZxPogi1h8y+KXSQ4o9r4CFNcXVfBoKmySumc/6xKAKBhMDHylUcSqcj3xP5oX3hEMMIbLgzAtWDOI2wsRS/gVacRC5I54RlDVnoIVrQbOJb8TAhCokzK1sbrpp5iTQ8QZZZARqLUN/e7DmqJA9aB7VVTIzLyecDDfFD9alftm7Xt18o4FXbBRaZOmx4bKmjQ4qFZkEycjuwzSIu+Pd4BH685Ti4vpD0bb0GSJ4ZbMWijefTQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+6+P8jtnqeyljsXA5/wbRmpV1r05AeLneBVkjoc+ycE=;
 b=DOlTe1GKvJ6hfAXFN4+rntoSSbn7imgPvQi1hI1Gars0L8i3MVtxv3yDh6oqBueXvwVlNVoDnzMJb7URhagxkdT049HHV3qCrs8PyWj5Xq1jK4wkDkkQyJus/tz/AR3Hn3j9oUvOzehR++Tdf1dgB5tt2CTGGhhhEB73uM2a+YBHAUaVTu2vEgFEGk/QR/mtmVaV+aFMgXw35AhwoL7jPhBAm0SgLSj8+kfYc7hZNSCYV9HeyZTgkoAovlsML8g1QthaclZKx8yy/Wm7g82yFBSvdJp5LiaLTVNULVPcvPD95Upqus8/A+PXxBljAQZAniXrlSKWztQoQuW/CCuhZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by IA0PR11MB7751.namprd11.prod.outlook.com (2603:10b6:208:43a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.20; Thu, 15 May
 2025 10:11:08 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%3]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 10:11:08 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: "Jadav, Raag" <raag.jadav@intel.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?=
 <thomas.hellstrom@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 "Poosa, Karthik" <karthik.poosa@intel.com>, "Abliyev, Reuven"
 <reuven.abliyev@intel.com>, "Weil, Oren jer" <oren.jer.weil@intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Tomas Winkler
 <tomasw@gmail.com>
Subject: RE: [PATCH v9 02/12] mtd: add driver for intel graphics non-volatile
 memory device
Thread-Topic: [PATCH v9 02/12] mtd: add driver for intel graphics non-volatile
 memory device
Thread-Index: AQHbtR4bMdUBeR7EsUy4fNjydqIKobO6aL8AgBkeP/A=
Date: Thu, 15 May 2025 10:11:08 +0000
Message-ID: <CY5PR11MB636656BB76C04BD77F0ADB25ED90A@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250424132536.3043825-1-alexander.usyskin@intel.com>
 <20250424132536.3043825-3-alexander.usyskin@intel.com>
 <aBCcdPbIxthARrMj@black.fi.intel.com>
In-Reply-To: <aBCcdPbIxthARrMj@black.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|IA0PR11MB7751:EE_
x-ms-office365-filtering-correlation-id: 69bf7e0b-1ac2-49c2-d9c5-08dd9398cf75
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7416014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?UzEzakloclZHbklIWVdMd0xLY0lnY0tMcjlqRmt2YkJNNHRTWjQ1V2VLUGgx?=
 =?utf-8?B?MUdJY2RqQ0tVYkJBWC9uZzZJcEhmcWpQNzRLUjFCTkd6ZjFRbm95RnlSbEVy?=
 =?utf-8?B?ekptUllpTnVrVmVtRHFad3hmVXlSdVdpdTZCaEdRVXRRblZvSVZjUVc2R1Nn?=
 =?utf-8?B?V3lYUlVFbE42dUx0N1FxSG1aVGUzM3JvWGZNMEhVcXJkWGhyeGZ1NnVLbmxZ?=
 =?utf-8?B?cVZaWDdUSkJwRTNEcjNjTlVjSDM5akhVOVpzYyt1S05OblNsMGdvSHc3eE1j?=
 =?utf-8?B?bWF4RkF1eEFVamEySVdtZUVFYWRlUERraWg0cEN1M3AyTnY1SlYrd0hDU1R0?=
 =?utf-8?B?TTlLZGFKaVBmNEZ6dk51aXYwc29HL3dqNWZnTGdIMHYyVENDaHNGMFFtVVh2?=
 =?utf-8?B?R25qcXRDcG0rZkZDMVNUdEd3TzA3YUxhMUt4NWloWXZLbnpVdWtlMm1aWk0x?=
 =?utf-8?B?MXdHRHE3RzB3RmFodVFjZHhjTk8rMzJDYzA2UFk2U2FFVEMyaXV5Q1gxNndL?=
 =?utf-8?B?NGljUUtQbXVJdW1IUnpIQ3R6U0RnZXhYbzZscVMrNWI0M1IrendSU1RpUVk2?=
 =?utf-8?B?U3N5WlRyMFV1NDFWNnBsMW1WV0pzQW8rMm5JUUJwa1FYeldyMGdzVnVnakor?=
 =?utf-8?B?SW1kR3pEckVxWldFY2svYUZqVHJwbW81Q2V0eitvQnZkWm1pNGhaZmx3MjMw?=
 =?utf-8?B?V2VIMG5IaldXWk4rN1huS20rcFJDQUhLSzM2YUVlcm8rbHVaUWtGRWJJeXVo?=
 =?utf-8?B?YlY0TXpEQzIyaE5md21yQktzc0haMFFtUW5PTkI1OEEyRkFZTE53djNIdWFD?=
 =?utf-8?B?UXMyazBwZmVMQVZQVW4yQVhKVXNTb3dCaCs2ZkIzZllsUG5oRm5qbFhpNVFr?=
 =?utf-8?B?MUVaZEEzbjFreDJjL3piYmRwazZrWFkyM29HYW13WS9EMExFWE1NZmZlemdV?=
 =?utf-8?B?bi84VkZMSlROOG1oc0k5aEhVWHJ6RnoxaGdjRk1tRnA0SE5MamlmL2lIa2ky?=
 =?utf-8?B?c0Z2ZTZvZWhHcU45ajJzbkJZWjRxTnA1T3ZPT3FTYzYwUktGcGhiQ3ZzMlls?=
 =?utf-8?B?OXNDYVBKdDErR1U2cHREVzBWbm4wNmluTFVqTUhqNGppZkdhNTBGZWlPSUVT?=
 =?utf-8?B?ZUx2NEg5b1cwNVJUWHFoRDZ2Vi80K3ZKTEFhV0swWCtuYXJrRzJieVM3Y2gr?=
 =?utf-8?B?U29YN2VRUzZUZEFFdmdrbXQ5YUtqempNbUZpM1Z5elpINFFHU3p2ZWtqM2Yr?=
 =?utf-8?B?TnJlWEdTeXcwWWl5dUpoYytvY1lkQnRLMjljOGMwSUIxV3pzb2Z0OHUya3ky?=
 =?utf-8?B?TG5TeDRjdjZQWUorUTQ2NXVhT0xCQ0UrOEJrTjF2QXhzcUVINklSMkRscjk1?=
 =?utf-8?B?a2NjaCtkeVV6WkpYNTUydk5tOW54d3V6QXpzVml6VGd0NDM5aVd2Vm5PV29I?=
 =?utf-8?B?L0xzcW1GUERydlh3TVlISmg5R2ZJdGhTNGtGVVB5RGRTV0k2M3phRkNFcWVU?=
 =?utf-8?B?T0NFWnFESHVOSzJ4THlMS1plazBwZUdhVmJSU0lqLzhPelBZTjJKS0JsU20r?=
 =?utf-8?B?WXdGa2d3YTRKOGp2cndNYkNHUG5GU0Y0T1V4SS9uMk0zekl3OGJtaWhFbXg4?=
 =?utf-8?B?T05rMWZWK29mV0tuZ04yRGhCNjRyWWVROWF3anZlcDJtbVl5WTRRN0NFMzQr?=
 =?utf-8?B?UG1RU2xWUVBEbGdhbGx4S1R6T3JpSzJrOHhmYy9uQjNKempPOWZ4aklIZ1V0?=
 =?utf-8?B?U1NHSnN2NkhTWnB6TndYZ2xDRmtoSlpmQjJJeGtBUUdYYVRhSTVLQVRTRWJl?=
 =?utf-8?B?OERWalVSVTZYbG5QRmZWZWlPT1lybmpSVXZIaW5tcXJMNGdmSUQ1N0YvcUg2?=
 =?utf-8?B?dXZYMGFHR1RnemtGWFBiQU1rcmdZOG13UTFzUXgyK2syTmJoZFdlTDRBUEN1?=
 =?utf-8?B?WExiWDRxVzFxRkRmVUZsK2N2ZzFUTjFndGZ1RGpQYUp6YmFZUnlYTmJOMjB0?=
 =?utf-8?Q?cBn4yX+gA/UOL4QlXyrUxN391qB044=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aHdDU0QzSkF5Y2lvOGl1clNNM1IzRC9kMjRMN1pNLzlkTjZqeVE1aEoxTmVI?=
 =?utf-8?B?VHZlS0RLaFJaTGR5SlYyR0NKMVgzL2tob0dTY1RpekQwNWNFWWV3S3RuWnRl?=
 =?utf-8?B?UzJ1RVJOWnYyQ0hJakhTTnAraTA4ckhNdlJGOFl4TEUyTlRlV01JK01Oc3VO?=
 =?utf-8?B?dDdOSmpSbklHc3N4UWUxN2R6aXlKVFFkS29WRWFQSFNERVBFVkV4NGg1OHZs?=
 =?utf-8?B?S1AwS1BEcWRnT2NzL2tjaVMyWGNEMk1DZGR6a0Z2TkdZRDBYM2xld2FNc2J1?=
 =?utf-8?B?dC85MWhrRCt4cDFlTGM1a2NyY1BGRUUxQVJWbmhHa25QdW1SL0ZsbVVLS2dw?=
 =?utf-8?B?M0s5WDN0LytyWk5ZZmVOa1JmbWRValBkaGFGVE5FdnhPczR3N2FvOEZ0ZkEw?=
 =?utf-8?B?R3lJbVl1Y1EvMGpnMi9DWHp3L0hKZkd3allyZDVSV3E1ZFdVZ3I5YVhmR00v?=
 =?utf-8?B?QSs4dlliTEhHWCtSQUZiTEM1QkEvM0k4cENLTFpYNXFEaXZKZzcwMVpYSDBm?=
 =?utf-8?B?NUNHNmZGOXpsdXdiTXRUSCtSR3BPbVcwZkR3ZmpiSzhiQjJ3K0I0cFNwall4?=
 =?utf-8?B?SDR6RCs2UFlPdmUySmlKR3kyQzczUHk1bTYyOS9WYlZBcDJMSXBvZEFpMnZ5?=
 =?utf-8?B?eVpSVDd5cmhXdm5WQmdKOE55SFIzRytJNStwSXBzL0ZmV1gwL3c0V3R1d2dj?=
 =?utf-8?B?NFlwalVBU3FWSHBubjlPRFFFYnFTb05jUVROSmxLWmZ2MTJoQ0FzVW5rdEk1?=
 =?utf-8?B?VzhpdTZWMEFwRUNmdUVKM200QzF5OVBCbXpVbWE5V0tTREsyVEM3TGlBVXVB?=
 =?utf-8?B?cXNHWU5IenZ4OTF5WThjSW5aSXJUNWRkWkFKNGltRENDN09MTy9yM2tOZUJN?=
 =?utf-8?B?M2xNSEhqd1Frd3IwcVViS2I0ekRoZ0ZSajJNQ1pXZGhCbCthVEN0bkdQVG1Q?=
 =?utf-8?B?SzVvaGR0UmdkTkdSQVJSakl2Tzl5M3p6Z05CSTBFZUZ5UVQ4bWE1YStVUXhr?=
 =?utf-8?B?SGxZT2tBbW4rTVZaRnlRdlJSZlhpSEdvQjdWWnA0bE8xNGwwdk5ESVkrL0VT?=
 =?utf-8?B?Vm03d3JZRm8ybWQxck1hYmFZMGptSGJja21QcGs1T0RrbThvTnJMWmNmb2pM?=
 =?utf-8?B?NURUUjVqNDdHR0VGWUtzQXZXZWxtRENCZDNRdXJ0S25nSVVzZ3l4NlBrNFBH?=
 =?utf-8?B?ams4R3BQOThPTXhPZFU4STNnSHMyN1JOZml0bDcyS3R5QWsyVnBGYWhlOUtx?=
 =?utf-8?B?cE1qNG94MUtUWW5XRnVoWnpTeVVSUFFyOXY1N1RSZHVoMTJEZUUrUjh2cEFy?=
 =?utf-8?B?clVlUkI4RDhJL0UwdmcvUS9yaDF5WkQ1UEN3dWNCWUhFVExYZzJxSWhQak5F?=
 =?utf-8?B?NXhjeDhWUG94MUNKTnBrM0YwcWgyem56anBhOG8zT3BBUU01dlNpbUxYKzVj?=
 =?utf-8?B?bjFITnROcUxPU2NDc3pqVjZxNE1mVFNUUXB1NXA4NXJPajJsOXAvY0lQVFBn?=
 =?utf-8?B?bC9nSVZzTnJ6WmU1UGQ1aDJicVQwSzdrVmRPNWlqWUFZQUF1cTg2cG9OaC9Q?=
 =?utf-8?B?YzYvR2tkRy9sZzBCNHluL2J4SzRHQkgvc0ErTUtkZ2JPWFhNWktsOE4vUWNP?=
 =?utf-8?B?ZVR1cnRYMjdrVDEybExQWWpuQ1p6UGJjZVQzNTdvNE55TitZUmdyaVc5KzZw?=
 =?utf-8?B?aXhYaldKRmVjUHVYQjlObklLTTRrUzlSUEs5VVZVTXhJcWNocWRtcXhzZFo5?=
 =?utf-8?B?WmpyM3kwNTMrUFBxUm5CTnROUFZtTXlEdHBEeFpnRzVYNGRZdlBVU2pqTkZ6?=
 =?utf-8?B?dUFUa0VZMmhFbmIrZUM3THVwS0l0ZjNQN0V1OVhoVWwyVkVUSnBTT0VxOGxk?=
 =?utf-8?B?YlBHcXJMYlRWOGRlRmlpREpyOEhTZGNpVHJqVzBBa2kxcU5CNGtLcVdiQU5U?=
 =?utf-8?B?ZHBPSjBoZWdicDIvZU0ra0VibmdIU1NXTGRVZUMwZFFIR1lScWNFejNQOTEw?=
 =?utf-8?B?UWJBYWVTcFJab0lHL1dqNEptUDcvQ0tYdzBhMWhDa1ZabVo4Q1VIVk5panRu?=
 =?utf-8?B?QldxTG5heDVGNHI1SjBOcDBWV01LQlYvK1dFSGtsYWtrbHN4VXYxRXpidkVv?=
 =?utf-8?Q?YyVhb/1HfMv7piLlVGdP5UUdg?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69bf7e0b-1ac2-49c2-d9c5-08dd9398cf75
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2025 10:11:08.0849 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VfuPgdJZGOrXa79eoAlkhNGLuJXwRjr24pvJp3Ygu+rrPLgm/LutEqUDhXIIBZ0nP7ujDMyJKnqyOOuvsyR1I3jQWOJKSVRloNDAcihy/BY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7751
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

PiBTdWJqZWN0OiBSZTogW1BBVENIIHY5IDAyLzEyXSBtdGQ6IGFkZCBkcml2ZXIgZm9yIGludGVs
IGdyYXBoaWNzIG5vbi12b2xhdGlsZQ0KPiBtZW1vcnkgZGV2aWNlDQo+IA0KPiBPbiBUaHUsIEFw
ciAyNCwgMjAyNSBhdCAwNDoyNToyNlBNICswMzAwLCBBbGV4YW5kZXIgVXN5c2tpbiB3cm90ZToN
Cj4gPiBBZGQgYXV4aWxpYXJ5IGRyaXZlciBmb3IgaW50ZWwgZGlzY3JldGUgZ3JhcGhpY3MNCj4g
PiBub24tdm9sYXRpbGUgbWVtb3J5IGRldmljZS4NCj4gDQo+IC4uLg0KPiANCj4gPiArc3RhdGlj
IGludCBpbnRlbF9kZ19tdGRfcHJvYmUoc3RydWN0IGF1eGlsaWFyeV9kZXZpY2UgKmF1eF9kZXYs
DQo+ID4gKwkJCSAgICAgIGNvbnN0IHN0cnVjdCBhdXhpbGlhcnlfZGV2aWNlX2lkICphdXhfZGV2
X2lkKQ0KPiA+ICt7DQo+ID4gKwlzdHJ1Y3QgaW50ZWxfZGdfbnZtX2RldiAqaW52bSA9DQo+IGF1
eGlsaWFyeV9kZXZfdG9faW50ZWxfZGdfbnZtX2RldihhdXhfZGV2KTsNCj4gPiArCXN0cnVjdCBk
ZXZpY2UgKmRldmljZTsNCj4gPiArCXN0cnVjdCBpbnRlbF9kZ19udm0gKm52bTsNCj4gPiArCXVu
c2lnbmVkIGludCBucmVnaW9uczsNCj4gPiArCXVuc2lnbmVkIGludCBpLCBuOw0KPiA+ICsJY2hh
ciAqbmFtZTsNCj4gDQo+IFBlcmhhcHMgbW92ZSB0aGlzIHRvIHRoZSBsb29wIGl0IGlzIGJlaW5n
IHVzZWQgaW4/DQo+IA0KV2lsbCBkbw0KDQo+ID4gKwlpbnQgcmV0Ow0KPiA+ICsNCj4gPiArCWRl
dmljZSA9ICZhdXhfZGV2LT5kZXY7DQo+ID4gKw0KPiA+ICsJLyogY291bnQgYXZhaWxhYmxlIHJl
Z2lvbnMgKi8NCj4gPiArCWZvciAobnJlZ2lvbnMgPSAwLCBpID0gMDsgaSA8IElOVEVMX0RHX05W
TV9SRUdJT05TOyBpKyspIHsNCj4gPiArCQlpZiAoaW52bS0+cmVnaW9uc1tpXS5uYW1lKQ0KPiA+
ICsJCQlucmVnaW9ucysrOw0KPiA+ICsJfQ0KPiA+ICsNCj4gPiArCWlmICghbnJlZ2lvbnMpIHsN
Cj4gPiArCQlkZXZfZXJyKGRldmljZSwgIm5vIHJlZ2lvbnMgZGVmaW5lZFxuIik7DQo+ID4gKwkJ
cmV0dXJuIC1FTk9ERVY7DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJbnZtID0ga3phbGxvYyhzdHJ1
Y3Rfc2l6ZShudm0sIHJlZ2lvbnMsIG5yZWdpb25zKSwgR0ZQX0tFUk5FTCk7DQo+ID4gKwlpZiAo
IW52bSkNCj4gPiArCQlyZXR1cm4gLUVOT01FTTsNCj4gPiArDQo+ID4gKwlrcmVmX2luaXQoJm52
bS0+cmVmY250KTsNCj4gPiArDQo+ID4gKwludm0tPm5yZWdpb25zID0gbnJlZ2lvbnM7DQo+IA0K
PiBJcyB0aGlzIGFzc2lnbm1lbnQgdXNlZnVsPw0KTm9wZSwgcmVtb3ZpbmcNCg0KPiANCj4gPiAr
CWZvciAobiA9IDAsIGkgPSAwOyBpIDwgSU5URUxfREdfTlZNX1JFR0lPTlM7IGkrKykgew0KPiA+
ICsJCWlmICghaW52bS0+cmVnaW9uc1tpXS5uYW1lKQ0KPiA+ICsJCQljb250aW51ZTsNCj4gPiAr
DQo+ID4gKwkJbmFtZSA9IGthc3ByaW50ZihHRlBfS0VSTkVMLCAiJXMuJXMiLA0KPiA+ICsJCQkJ
IGRldl9uYW1lKCZhdXhfZGV2LT5kZXYpLCBpbnZtLQ0KPiA+cmVnaW9uc1tpXS5uYW1lKTsNCj4g
PiArCQlpZiAoIW5hbWUpDQo+ID4gKwkJCWNvbnRpbnVlOw0KPiA+ICsJCW52bS0+cmVnaW9uc1tu
XS5uYW1lID0gbmFtZTsNCj4gPiArCQludm0tPnJlZ2lvbnNbbl0uaWQgPSBpOw0KPiA+ICsJCW4r
KzsNCj4gPiArCX0NCj4gPiArCW52bS0+bnJlZ2lvbnMgPSBuOyAvKiBpbiBjYXNlIHdoZXJlIGth
c3ByaW50ZiBmYWlsICovDQo+IA0KPiBDb25zaWRlcmluZyBrYXNwcmludGYgZmFpbHVyZSwgc2hv
dWxkIHdlIG1vdmUgZm9yd2FyZCBpZiBuID09IDA/DQpOb3Qgc3VyZSBpZiBhZGRpbmcgZXhpdCBw
YXRoIGhlcmUgYWRkcyBzb21ldGhpbmcgcG9zaXRpdmUgdG8gZHJpdmVyDQpvdGhlciB0aGFuIGNv
bXBsZXhpdHkuDQoNCj4gDQo+ID4gKwludm0tPmJhc2UgPSBkZXZtX2lvcmVtYXBfcmVzb3VyY2Uo
ZGV2aWNlLCAmaW52bS0+YmFyKTsNCj4gPiArCWlmIChJU19FUlIobnZtLT5iYXNlKSkgew0KPiA+
ICsJCWRldl9lcnIoZGV2aWNlLCAibW1pbyBub3QgbWFwcGVkXG4iKTsNCj4gDQo+IElzIHRoaXMg
dXNlZnVsPyBQZXJoYXBzIHRoZSBoZWxwZXIgYWxyZWFkeSBkb2VzIGl0IGZvciB1cy4NClllcywg
d2lsbCByZW1vdmUNCg0KPiANCj4gPiArCQlyZXQgPSBQVFJfRVJSKG52bS0+YmFzZSk7DQo+ID4g
KwkJZ290byBlcnI7DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJZGV2X3NldF9kcnZkYXRhKCZhdXhf
ZGV2LT5kZXYsIG52bSk7DQo+ID4gKw0KPiA+ICsJcmV0dXJuIDA7DQo+ID4gKw0KPiA+ICtlcnI6
DQo+ID4gKwlrcmVmX3B1dCgmbnZtLT5yZWZjbnQsIGludGVsX2RnX252bV9yZWxlYXNlKTsNCj4g
PiArCXJldHVybiByZXQ7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRpYyB2b2lkIGludGVsX2Rn
X210ZF9yZW1vdmUoc3RydWN0IGF1eGlsaWFyeV9kZXZpY2UgKmF1eF9kZXYpDQo+ID4gK3sNCj4g
PiArCXN0cnVjdCBpbnRlbF9kZ19udm0gKm52bSA9IGRldl9nZXRfZHJ2ZGF0YSgmYXV4X2Rldi0+
ZGV2KTsNCj4gPiArDQo+ID4gKwlpZiAoIW52bSkNCj4gPiArCQlyZXR1cm47DQo+IA0KPiBBcmUg
d2UgZXhwZWN0aW5nIHRoaXM/DQo+IA0KPiA+ICsJZGV2X3NldF9kcnZkYXRhKCZhdXhfZGV2LT5k
ZXYsIE5VTEwpOw0KPiANCj4gRG8gd2UgbmVlZCB0aGlzPw0KSXMgdGhlcmUgZ3VhcmFudHkgYnkg
YXV4aWxpYXJ5IGRldmljZSB0aGF0IGFmdGVyIHJlbGVhc2Ugbm90aGluZyBpcyBjYWxsZWQ/DQoN
Cj4gDQo+ID4gKwlrcmVmX3B1dCgmbnZtLT5yZWZjbnQsIGludGVsX2RnX252bV9yZWxlYXNlKTsN
Cj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBhdXhpbGlhcnlfZGV2aWNl
X2lkIGludGVsX2RnX210ZF9pZF90YWJsZVtdID0gew0KPiA+ICsJew0KPiA+ICsJCS5uYW1lID0g
Imk5MTUubnZtIiwNCj4gPiArCX0sDQo+ID4gKwl7DQo+ID4gKwkJLm5hbWUgPSAieGUubnZtIiwN
Cj4gPiArCX0sDQo+ID4gKwl7DQo+ID4gKwkJLyogc2VudGluZWwgKi8NCj4gPiArCX0NCj4gPiAr
fTsNCj4gPiArTU9EVUxFX0RFVklDRV9UQUJMRShhdXhpbGlhcnksIGludGVsX2RnX210ZF9pZF90
YWJsZSk7DQo+ID4gKw0KPiA+ICtzdGF0aWMgc3RydWN0IGF1eGlsaWFyeV9kcml2ZXIgaW50ZWxf
ZGdfbXRkX2RyaXZlciA9IHsNCj4gPiArCS5wcm9iZSAgPSBpbnRlbF9kZ19tdGRfcHJvYmUsDQo+
ID4gKwkucmVtb3ZlID0gaW50ZWxfZGdfbXRkX3JlbW92ZSwNCj4gPiArCS5kcml2ZXIgPSB7DQo+
ID4gKwkJLyogYXV4aWxpYXJ5X2RyaXZlcl9yZWdpc3RlcigpIHNldHMgLm5hbWUgdG8gYmUgdGhl
IG1vZG5hbWUNCj4gKi8NCj4gPiArCX0sDQo+ID4gKwkuaWRfdGFibGUgPSBpbnRlbF9kZ19tdGRf
aWRfdGFibGUNCj4gPiArfTsNCj4gDQo+ID4gKw0KPiANCj4gTml0OiBSZWR1bmRhbnQgYmxhbmsg
bGluZS4NCldpbGwgcmVtb3ZlDQo+IA0KPiA+ICttb2R1bGVfYXV4aWxpYXJ5X2RyaXZlcihpbnRl
bF9kZ19tdGRfZHJpdmVyKTsNCj4gPiArDQo+ID4gK01PRFVMRV9MSUNFTlNFKCJHUEwiKTsNCj4g
PiArTU9EVUxFX0FVVEhPUigiSW50ZWwgQ29ycG9yYXRpb24iKTsNCj4gPiArTU9EVUxFX0RFU0NS
SVBUSU9OKCJJbnRlbCBER0ZYIE1URCBkcml2ZXIiKTsNCj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9saW51eC9pbnRlbF9kZ19udm1fYXV4LmgNCj4gYi9pbmNsdWRlL2xpbnV4L2ludGVsX2RnX252
bV9hdXguaA0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMDAw
Li42OGRmNjM0Yzk5NGMNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvaW5jbHVkZS9saW51
eC9pbnRlbF9kZ19udm1fYXV4LmgNCj4gPiBAQCAtMCwwICsxLDI3IEBADQo+ID4gKy8qIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiBNSVQgKi8NCj4gPiArLyoNCj4gPiArICogQ29weXJpZ2h0KGMp
IDIwMTktMjAyNSwgSW50ZWwgQ29ycG9yYXRpb24uIEFsbCByaWdodHMgcmVzZXJ2ZWQuDQo+ID4g
KyAqLw0KPiA+ICsNCj4gPiArI2lmbmRlZiBfX0lOVEVMX0RHX05WTV9BVVhfSF9fDQo+ID4gKyNk
ZWZpbmUgX19JTlRFTF9ER19OVk1fQVVYX0hfXw0KPiA+ICsNCj4gPiArI2luY2x1ZGUgPGxpbnV4
L2F1eGlsaWFyeV9idXMuaD4NCj4gDQo+IE1pc3NpbmcgdHlwZXMuaCwgY29udGFpbmVyX29mLmgN
CldpbGwgYWRkDQo+IA0KPiA+ICsjZGVmaW5lIElOVEVMX0RHX05WTV9SRUdJT05TIDEzDQo+ID4g
Kw0KPiA+ICtzdHJ1Y3QgaW50ZWxfZGdfbnZtX3JlZ2lvbiB7DQo+ID4gKwljb25zdCBjaGFyICpu
YW1lOw0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArc3RydWN0IGludGVsX2RnX252bV9kZXYgew0KPiA+
ICsJc3RydWN0IGF1eGlsaWFyeV9kZXZpY2UgYXV4X2RldjsNCj4gPiArCWJvb2wgd3JpdGFibGVf
b3ZlcnJpZGU7DQo+ID4gKwlzdHJ1Y3QgcmVzb3VyY2UgYmFyOw0KPiA+ICsJY29uc3Qgc3RydWN0
IGludGVsX2RnX252bV9yZWdpb24gKnJlZ2lvbnM7DQo+ID4gK307DQo+ID4gKw0KPiA+ICsjZGVm
aW5lIGF1eGlsaWFyeV9kZXZfdG9faW50ZWxfZGdfbnZtX2RldihhdXhpbGlhcnlfZGV2KSBcDQo+
ID4gKwljb250YWluZXJfb2YoYXV4aWxpYXJ5X2Rldiwgc3RydWN0IGludGVsX2RnX252bV9kZXYs
IGF1eF9kZXYpDQo+ID4gKw0KPiA+ICsjZW5kaWYgLyogX19JTlRFTF9ER19OVk1fQVVYX0hfXyAq
Lw0KPiA+IC0tDQo+ID4gMi40My4wDQo+ID4NCg==
