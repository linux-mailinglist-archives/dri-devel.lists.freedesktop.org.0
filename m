Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7377E22A6
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 14:01:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4613310E302;
	Mon,  6 Nov 2023 13:01:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6CC410E302;
 Mon,  6 Nov 2023 13:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699275685; x=1730811685;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=U+AVKlt4mihkLjL9Pu/pwagGOdnHoT8ajsP35RPi3uA=;
 b=CNpp0zzCygOuduGs3fkKnBfNKbNsIOsPQY4r43qYjSFn+49fCqxkkSyI
 CLsD8ckcEdpcj8/bjrJ4iEf7fwhgEfoSmRlVwPYOl6+kqPCFAjW1+QDRx
 HVAyUdbx8tScslM65YdTS+lMsya4HW/7/HY7MyvAKm6vZT10gcii2tJAA
 REF9fPEWYjRSxPesldPAISSelrnEcLBHZby1gYZTVwqhNyvgrh8UEdMRH
 3sH1UnxZ0lF+O7+RT/obQ5GbIPUmlIafhEc9XC9lu7LUxIwADj6/uESoC
 ReFgF3Nbc2KPFNXRHZSBADYw4Fbu5eHSyaYZy4DdNQnh029J8lOcg7PcG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="393164510"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="393164510"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 05:01:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="755848783"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="755848783"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Nov 2023 05:01:23 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 6 Nov 2023 05:01:22 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 6 Nov 2023 05:01:22 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 6 Nov 2023 05:01:22 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 6 Nov 2023 05:01:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fAVQSbfW3Mi3djD9LtfoqUDzFVXU+3hPpS/GpfVgfiBPTOLjHHVPqZG9PKaLDOn+QYzadi5htzR1Ivoi86VH/rL22acNrVIjzQBG4DBWkApoA8FEnYKMfAOvrac1pPUlVNrGAzOdqvAkwbh3BLF2fYUajqbbn9b1wcezT7Ixec4ineHPx6cfTkDMo8I0ZAkeyURcFttZ/LRr6VSYU9asAn5mJmtNd8TT8rtRaS9TJeK6JIO6DaREyWqo5cXt25QmOoEMrHYryn0XKksSaFh9kcro03/JoWcfdd04PnAwmM0LUYe5wjCmMWPkM2LN7nIaGRQ8FKL8lOEwUbJVnhX9Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U+AVKlt4mihkLjL9Pu/pwagGOdnHoT8ajsP35RPi3uA=;
 b=jHcfTeKsFB3r9E2j68lGAiwlQgcNNVWZndDddTgaw7zviM7vrtZqox9BOgBOqcVXA+RaSSbz3fUWiZlEDdGaN2E91E08YIPsvTXU4mYK0kVst+0ySx/nNm0eSsF8fIkYlgGYCye0I/ZLRq5GGtyUG7abfwx2ivd4M/v8D3OzbK0G8eboB1o+F9tJgrAaWii1R4QQRufN4Ue2iiUVS4q2lf7R7zuKsaD2RYmZRC+gUHhZU1jvYq9TKXdTSaB6eCo7Gg90Sx5FlEkfpYdOaPGE4OD/8tPf68QrGwtbtAJfO30SWXn+rROFNNJ7gal6s2nz7vFrbs9lkflPAd/5jS3BeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by PH7PR11MB7963.namprd11.prod.outlook.com (2603:10b6:510:246::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Mon, 6 Nov
 2023 13:01:19 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::d35c:f42b:fdf7:36bb]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::d35c:f42b:fdf7:36bb%5]) with mapi id 15.20.6954.021; Mon, 6 Nov 2023
 13:01:19 +0000
From: "Manna, Animesh" <animesh.manna@intel.com>
To: Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: RE: [PATCH v7 1/6] drm/panelreplay: dpcd register definition for
 panelreplay
Thread-Topic: [PATCH v7 1/6] drm/panelreplay: dpcd register definition for
 panelreplay
Thread-Index: AQHZ/DUnGFtLdJRvEkSiZeAORe1DHbBoduiAgATypYA=
Date: Mon, 6 Nov 2023 13:01:19 +0000
Message-ID: <BL1PR11MB5979BF8B55E730D76DD29345F9AAA@BL1PR11MB5979.namprd11.prod.outlook.com>
References: <20231011110936.1851563-1-animesh.manna@intel.com>
 <20231011110936.1851563-2-animesh.manna@intel.com> <87jzqz194w.fsf@intel.com>
In-Reply-To: <87jzqz194w.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5979:EE_|PH7PR11MB7963:EE_
x-ms-office365-filtering-correlation-id: 8aa358de-9608-4539-b1ec-08dbdec87834
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lP3h/ghw3WODwlnlPLPuU/zmPA/t0073UeYwv/DDqb0ENg0uGi4mEMGszVo1hk5LoU6Zs4FHtbanevncOZTeON7Le9cuYRceemrqUfRipJVhnRiBzlCnwvJ/janQMTeS9UxQq3PIPP0tgBjQ1Ey/Ncvp67V3IKJG4GSsCeMq+0kYpWFbDMIlxXBxV6JA1WCPGiOKrlwV+N1+59s7xUuNPRZtLqcKcTAQ8zx8V0FygoYliQ7EeqP00VaTCZpIEVslcMt0qp/sdCf/96X9utYJuJl+uGHWdYqw6Ke/OkeWmyb1245dV8YdMW+VExMPv+rwGOR9c8w9wQZpAvCd93IO2Tzc74tgBep9GujWlmquJ2Za8moj7wp7C5kuxtpTeATlu+YZF+ktqvyNmHOkyWVKqyFDpRyiZtLCmyoDpatqFSBlm7WRO0S2vjRQsepa++sYbO72/W8HJK7F2En+wPTy6zyBh9cO7e+QBAkl9ZNX5qKzSYSgf8+PBppl0bo9Acm1eI18OtKVJRtFHajA+IOVPolXfwp2k2+iYNsNMNRJnhRoEDnlxaHU0cyrMR4KtnV6AZAXpKiGLzahbB/AYe1IJ5pTbTnDnrjqeGORhPb5lZCydUnnTToXncB69q0T2QJh
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(39860400002)(136003)(376002)(396003)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(26005)(38070700009)(55016003)(2906002)(52536014)(38100700002)(33656002)(5660300002)(8936002)(8676002)(86362001)(478600001)(9686003)(71200400001)(53546011)(66446008)(316002)(66946007)(64756008)(4326008)(66556008)(122000001)(66476007)(76116006)(6506007)(66574015)(82960400001)(83380400001)(7696005)(54906003)(110136005)(55236004)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VWNIelBjaUpQZEtDMzA0SWdSbG1QbTFIOFFRdW84dm5GazJsV2dscHlhL1I4?=
 =?utf-8?B?a2FDYS82bmtlYmdJNUNiM2xMdjFxV1BXNzUydXl5UTM2MUtaY0l5bmNRb2hB?=
 =?utf-8?B?SWdUK2RhQzhXanhQb3RMT3FiQUlhckYwUThNV3puaEJITDg4SnFWdGwvL1lB?=
 =?utf-8?B?NUhSR0hEdGVXSzgrRmtQRkpZK0pQeUNBMDNndVZqTUFZOWQxclZCR245Y2w3?=
 =?utf-8?B?OXRaa1Q3Y3A5WktiYWY0Rm5idmM2T2Z3YTVXVGR0TFdpQzdsWG9PNVREMEFi?=
 =?utf-8?B?ekVIS0hLV0d1cHQydmF1RkFaQ2crVlUxVndUblUza3JXTC9IWEpGYlQwMnNY?=
 =?utf-8?B?TGszWjFIS2tybmFLZGwwRGl2R24waG03NGIyY2dYUlJuYUhwTjd2d3Urb0wr?=
 =?utf-8?B?M0N0SEZrenBWYTd2Tm1EUG9tMC9QUXU1RXdpMVBPSk93MlcxVERSWmVZSU45?=
 =?utf-8?B?QjNhZ3NmazhTSzZuS3JPZUdJbFhyVmswYjJhL1pnWWJtTlRCNDRnbjdRdnEr?=
 =?utf-8?B?RlRMTVlIZkhWR2RVNmF5a0E0YlNFNG5kVjJVazhkbHhHYTNCMnBrZGtvem1E?=
 =?utf-8?B?ZmlhNEJlT3NDMGFYYnVMNElkd252c0t1WTQ1cUNyb1Z6OFpyOFVFNVB5dTAr?=
 =?utf-8?B?cm9haTE1d3dxZ2VqMjRBcWFxeFhFYUErK012emkzdG9zWXkyQ1dLcFFkY2lj?=
 =?utf-8?B?dEtzQW54MHo2Y1U0WmxOMk1zVjc0TjFBMy9QczliMlhQWGkrVlFQM3VYYjFB?=
 =?utf-8?B?cnczNzRWRFZUTFgrT3YxM2RPZnNNR0VacTcyR29MdnVaY2Q1Q3VCSnk5RUFu?=
 =?utf-8?B?ci9IYnhUZVUvTTJhN2paeGtBajhvMkM0eU50cEJyV3AyTkQxRzBsbmoyNExC?=
 =?utf-8?B?cVQzdGdWQ1VPRmZuWEFJa2VsS3oyTmVjMkFBN2JOZzJzK0EvTUV2TE1NUHRL?=
 =?utf-8?B?b2Z0ak9YbkkwNHNlbFo4UGk4Nk1VbjVaYU1kcHpwMmRWdU5tVU1RQ2hISEJF?=
 =?utf-8?B?NXV0eEp4a21YZE1nTnc1TXAyTzRqcCtFS1BKbDdnWHdQWmpNWGgrKy95OFBD?=
 =?utf-8?B?TE90N3ZQQ0NVTVBEVXByWWNsYksyZ3k4N3ArdUJRenRENzJkbXkvdld0d1lT?=
 =?utf-8?B?SUdlVWhKM0kwVjRlMnl3NnlrQlhjS0Q2UlFSeG54R0VIb2FINmRPRlkzaEZI?=
 =?utf-8?B?dEpZMzhVQnpVWVpZMjFCOURWYzBKSXYvbmYveXorcXpFNFpWZXBVR09MWWJP?=
 =?utf-8?B?UWRKQjRvZDZWTFpaSUFkT0hXRlNpVTAxSzY2NUNSbWxGMHlEMWNYUmQvSlRZ?=
 =?utf-8?B?d0w1RE83RksraHpMTngyUFNOUkFPSzU0b2VjdnFUN1FOSmJCdkYzZ2lKclBH?=
 =?utf-8?B?a3FyOTBtYzdmVUN6aVYyQWpnRW1iRmVXN29lUnJEWWRUWHNNRThDRlZWUDl4?=
 =?utf-8?B?THR3N3UwTzRPQnBMMVBwZEhVaXRIeUkvamlsZy8xOGdwWTZMdzJTWG4yTXRZ?=
 =?utf-8?B?a1hUYkI2NmdoRnF0bjRCNXdWdEhXdFZydng0SHY4bFMxdG1VUXRLL1dIRExJ?=
 =?utf-8?B?OUtPa1lscXBJb1d0ZHFndTJhc0dyaE5iWUVxZ2F2WXRXaE5QUUlnNVltMGlI?=
 =?utf-8?B?bWc4K0ErVk1FUGN1SWV6SlFvR1hRVFpwbytTRXlCV1RFY1dNVWJXVlJlUHYz?=
 =?utf-8?B?c01BdXBLVUtMbGRLQ1lqYzN0eUErNEZZTTlNcHV3dFQzUWFMOGJwcEttckNt?=
 =?utf-8?B?NVdtM3VCNG5LazQ4QW9PRjR3Rlc3aWtPaUM1ZVFudHRRVHJyMGNsLzFGY0dH?=
 =?utf-8?B?TEtxNkJaN3JzbmNuVkVaYVlOVFBFc01BL3ZEbi95Rk9xaklkS28vdDE4R2Yr?=
 =?utf-8?B?azZZVC9CQm10Q0hUeldrdklTRTJ0RENrcGNQUW1XWmk2NE9vZytGdXlLS2cy?=
 =?utf-8?B?NUg5YjV0SkFIZnhOTVNHZ1AxdGRXdlBCUGtxUHpwZmUxb3pDUjdJRlQweHlU?=
 =?utf-8?B?QThWaTl3bTZtWW5meW9GNmtZME5LNUZYcEh1ckxGTVd4MXdOYitpMHFDcFNJ?=
 =?utf-8?B?bkgrNWxIanN5U3BYaGVJYzNBVHYxMGxmdnpHV1lJc2NrS0t2b29GV1NjUnJH?=
 =?utf-8?Q?0JVieqLAWOsO8SQ0yEpiMGr8T?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aa358de-9608-4539-b1ec-08dbdec87834
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2023 13:01:19.4344 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JKWp+sxPIUZLrTI8u5O80HwVJ3AnyDZze2cYxSJ1SPQDCDxCURji0NCswIc5YR+vKvIbL5BTb8/nNy3AE/COQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7963
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
Cc: "Hogander, Jouni" <jouni.hogander@intel.com>, "Nikula,
 Jani" <jani.nikula@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Murthy,
 Arun R" <arun.r.murthy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTmlrdWxhLCBKYW5pIDxq
YW5pLm5pa3VsYUBpbnRlbC5jb20+DQo+IFNlbnQ6IEZyaWRheSwgTm92ZW1iZXIgMywgMjAyMyAy
OjU1IFBNDQo+IFRvOiBNYW5uYSwgQW5pbWVzaCA8YW5pbWVzaC5tYW5uYUBpbnRlbC5jb20+OyBp
bnRlbC0NCj4gZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgTWF4aW1lIFJpcGFyZCA8bXJpcGFy
ZEBrZXJuZWwub3JnPjsgVGhvbWFzDQo+IFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+
OyBNYWFydGVuIExhbmtob3JzdA0KPiA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29t
Pg0KPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgTWFubmEsIEFuaW1lc2gN
Cj4gPGFuaW1lc2gubWFubmFAaW50ZWwuY29tPjsgSG9nYW5kZXIsIEpvdW5pDQo+IDxqb3VuaS5o
b2dhbmRlckBpbnRlbC5jb20+OyBNdXJ0aHksIEFydW4gUiA8YXJ1bi5yLm11cnRoeUBpbnRlbC5j
b20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjcgMS82XSBkcm0vcGFuZWxyZXBsYXk6IGRwY2Qg
cmVnaXN0ZXIgZGVmaW5pdGlvbiBmb3INCj4gcGFuZWxyZXBsYXkNCj4gDQo+IE9uIFdlZCwgMTEg
T2N0IDIwMjMsIEFuaW1lc2ggTWFubmEgPGFuaW1lc2gubWFubmFAaW50ZWwuY29tPiB3cm90ZToN
Cj4gPiBBZGQgRFBDRCByZWdpc3RlciBkZWZpbml0aW9uIGZvciBkaXNjb3ZlcmluZywgZW5hYmxp
bmcgYW5kIGNoZWNraW5nDQo+ID4gc3RhdHVzIG9mIHBhbmVsIHJlcGxheSBvZiB0aGUgc2luay4N
Cj4gPg0KPiA+IENjOiBKb3VuaSBIw7ZnYW5kZXIgPGpvdW5pLmhvZ2FuZGVyQGludGVsLmNvbT4N
Cj4gPiBDYzogQXJ1biBSIE11cnRoeSA8YXJ1bi5yLm11cnRoeUBpbnRlbC5jb20+DQo+ID4gQ2M6
IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IEFy
dW4gUiBNdXJ0aHkgPGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6
IEFuaW1lc2ggTWFubmEgPGFuaW1lc2gubWFubmFAaW50ZWwuY29tPg0KPiANCj4gTWFhcnRlbiwg
TWF4aW1lLCBUaG9tYXMgLQ0KPiANCj4gQWNrIGZvciBtZXJnaW5nIHRoaXMgdmlhIGRybS1pbnRl
bC1uZXh0Pw0KDQpQaW5nIQ0KDQpSZWdhcmRzLA0KQW5pbWVzaA0KDQo+IA0KPiBUaGFua3MsDQo+
IEphbmkuDQo+IA0KPiA+IC0tLQ0KPiA+ICBpbmNsdWRlL2RybS9kaXNwbGF5L2RybV9kcC5oIHwg
MjMgKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIzIGluc2Vy
dGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kaXNwbGF5L2RybV9k
cC5oDQo+ID4gYi9pbmNsdWRlL2RybS9kaXNwbGF5L2RybV9kcC5oIGluZGV4IGU2OWNlY2U0MDRi
My4uZmM0MmI2MjJlZjMyDQo+IDEwMDY0NA0KPiA+IC0tLSBhL2luY2x1ZGUvZHJtL2Rpc3BsYXkv
ZHJtX2RwLmgNCj4gPiArKysgYi9pbmNsdWRlL2RybS9kaXNwbGF5L2RybV9kcC5oDQo+ID4gQEAg
LTU0Myw2ICs1NDMsMTAgQEANCj4gPiAgLyogREZQIENhcGFiaWxpdHkgRXh0ZW5zaW9uICovDQo+
ID4gICNkZWZpbmUgRFBfREZQX0NBUEFCSUxJVFlfRVhURU5TSU9OX1NVUFBPUlQJMHgwYTMJLyog
Mi4wICovDQo+ID4NCj4gPiArI2RlZmluZSBEUF9QQU5FTF9SRVBMQVlfQ0FQICAgICAgICAgICAg
ICAgICAweDBiMCAgLyogRFAgMi4wICovDQo+ID4gKyMgZGVmaW5lIERQX1BBTkVMX1JFUExBWV9T
VVBQT1JUICAgICAgICAgICAgKDEgPDwgMCkNCj4gPiArIyBkZWZpbmUgRFBfUEFORUxfUkVQTEFZ
X1NVX1NVUFBPUlQgICAgICAgICAoMSA8PCAxKQ0KPiA+ICsNCj4gPiAgLyogTGluayBDb25maWd1
cmF0aW9uICovDQo+ID4gICNkZWZpbmUJRFBfTElOS19CV19TRVQJCSAgICAgICAgICAgIDB4MTAw
DQo+ID4gICMgZGVmaW5lIERQX0xJTktfUkFURV9UQUJMRQkJICAgIDB4MDAgICAgLyogZURQIDEu
NCAqLw0KPiA+IEBAIC03MTYsNiArNzIwLDEzIEBADQo+ID4gICNkZWZpbmUgRFBfQlJBTkNIX0RF
VklDRV9DVFJMCQkgICAgMHgxYTENCj4gPiAgIyBkZWZpbmUgRFBfQlJBTkNIX0RFVklDRV9JUlFf
SFBECSAgICAoMSA8PCAwKQ0KPiA+DQo+ID4gKyNkZWZpbmUgUEFORUxfUkVQTEFZX0NPTkZJRyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgMHgxYjAgIC8qIERQIDIuMCAqLw0KPiA+ICsjIGRl
ZmluZSBEUF9QQU5FTF9SRVBMQVlfRU5BQkxFICAgICAgICAgICAgICAgICAgICAgICAgICgxIDw8
IDApDQo+ID4gKyMgZGVmaW5lIERQX1BBTkVMX1JFUExBWV9VTlJFQ09WRVJBQkxFX0VSUk9SX0VO
ICAgICAgICAgKDEgPDwgMykNCj4gPiArIyBkZWZpbmUgRFBfUEFORUxfUkVQTEFZX1JGQl9TVE9S
QUdFX0VSUk9SX0VOICAgICAgICAgICAoMSA8PCA0KQ0KPiA+ICsjIGRlZmluZSBEUF9QQU5FTF9S
RVBMQVlfQUNUSVZFX0ZSQU1FX0NSQ19FUlJPUl9FTiAgICAgICgxIDw8IDUpDQo+ID4gKyMgZGVm
aW5lIERQX1BBTkVMX1JFUExBWV9TVV9FTkFCTEUgICAgICAgICAgICAgICAgICAgICAgKDEgPDwg
NikNCj4gPiArDQo+ID4gICNkZWZpbmUgRFBfUEFZTE9BRF9BTExPQ0FURV9TRVQJCSAgICAweDFj
MA0KPiA+ICAjZGVmaW5lIERQX1BBWUxPQURfQUxMT0NBVEVfU1RBUlRfVElNRV9TTE9UIDB4MWMx
ICAjZGVmaW5lDQo+ID4gRFBfUEFZTE9BRF9BTExPQ0FURV9USU1FX1NMT1RfQ09VTlQgMHgxYzIg
QEAgLTExMDUsNiArMTExNiwxOA0KPiBAQA0KPiA+ICAjZGVmaW5lIERQX0xBTkVfQUxJR05fU1RB
VFVTX1VQREFURURfRVNJICAgICAgIDB4MjAwZSAvKiBzdGF0dXMgc2FtZQ0KPiBhcyAweDIwNCAq
Lw0KPiA+ICAjZGVmaW5lIERQX1NJTktfU1RBVFVTX0VTSSAgICAgICAgICAgICAgICAgICAgIDB4
MjAwZiAvKiBzdGF0dXMgc2FtZSBhcyAweDIwNSAqLw0KPiA+DQo+ID4gKyNkZWZpbmUgRFBfUEFO
RUxfUkVQTEFZX0VSUk9SX1NUQVRVUyAgICAgICAgICAgICAgICAgICAweDIwMjAgIC8qIERQIDIu
MSovDQo+ID4gKyMgZGVmaW5lIERQX1BBTkVMX1JFUExBWV9MSU5LX0NSQ19FUlJPUiAgICAgICAg
ICAgICAgICAoMSA8PCAwKQ0KPiA+ICsjIGRlZmluZSBEUF9QQU5FTF9SRVBMQVlfUkZCX1NUT1JB
R0VfRVJST1IgICAgICAgICAgICAgKDEgPDwgMSkNCj4gPiArIyBkZWZpbmUgRFBfUEFORUxfUkVQ
TEFZX1ZTQ19TRFBfVU5DT1JSRUNUQUJMRV9FUlJPUiAgICgxIDw8IDIpDQo+ID4gKw0KPiA+ICsj
ZGVmaW5lIERQX1NJTktfREVWSUNFX1BSX0FORF9GUkFNRV9MT0NLX1NUQVRVUyAgICAgICAgMHgy
MDIyICAvKg0KPiBEUCAyLjEgKi8NCj4gPiArIyBkZWZpbmUgRFBfU0lOS19ERVZJQ0VfUEFORUxf
UkVQTEFZX1NUQVRVU19NQVNLICAgICAgICg3IDw8IDApDQo+ID4gKyMgZGVmaW5lIERQX1NJTktf
RlJBTUVfTE9DS0VEX1NISUZUICAgICAgICAgICAgICAgICAgICAzDQo+ID4gKyMgZGVmaW5lIERQ
X1NJTktfRlJBTUVfTE9DS0VEX01BU0sgICAgICAgICAgICAgICAgICAgICAoMyA8PCAzKQ0KPiA+
ICsjIGRlZmluZSBEUF9TSU5LX0ZSQU1FX0xPQ0tFRF9TVEFUVVNfVkFMSURfU0hJRlQgICAgICAg
NQ0KPiA+ICsjIGRlZmluZSBEUF9TSU5LX0ZSQU1FX0xPQ0tFRF9TVEFUVVNfVkFMSURfTUFTSyAg
ICAgICAgKDEgPDwgNSkNCj4gPiArDQo+ID4gIC8qIEV4dGVuZGVkIFJlY2VpdmVyIENhcGFiaWxp
dHk6IFNlZSBEUF9EUENEX1JFViBmb3IgZGVmaW5pdGlvbnMgKi8NCj4gPiAgI2RlZmluZSBEUF9E
UDEzX0RQQ0RfUkVWICAgICAgICAgICAgICAgICAgICAweDIyMDANCj4gDQo+IC0tDQo+IEphbmkg
TmlrdWxhLCBJbnRlbA0K
