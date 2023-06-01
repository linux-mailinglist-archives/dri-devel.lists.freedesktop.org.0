Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A212F71F669
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 01:12:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76C4D10E60E;
	Thu,  1 Jun 2023 23:12:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA49E10E600;
 Thu,  1 Jun 2023 23:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685661131; x=1717197131;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=4YMLg8M0pe6zGIUFDv1RGZge8RtJ7bVgCNVRQ190kSg=;
 b=W6rpS+BIRLpMKYdOpOGb+X8v8zy/fo/Kxe0m+XG2FRr3ncDiMY+TuJ3l
 Ra/X84Ocj09jLbDdFHaSY/BM14JAxMK1YojUGpD/NTZSzF/MG8ZJ4x5gK
 6OtiIjCqLTD3fzT5dE9jG2PWhDWbskdirn6CSwQZmd8jufzTx7sil1Gwq
 jGEUGj/SHfvRzUQiUjEF8WSmQWvmX/QYtDzmj/fKn653g/ww+JZIyhzPX
 pZN2TWcLvTw+ot8HkbB9w+RYdiZsPZO5EQuzUqTicUSIrcXZadQTeJ7y5
 p1t1SrTC/wofvQSYTnsylWp0bpZNr3GhMUKLiLXwKBQ+1LGJywjR3xBMC g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="383990646"
X-IronPort-AV: E=Sophos;i="6.00,211,1681196400"; d="scan'208";a="383990646"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 16:12:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="851899578"
X-IronPort-AV: E=Sophos;i="6.00,211,1681196400"; d="scan'208";a="851899578"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga001.fm.intel.com with ESMTP; 01 Jun 2023 16:12:11 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 1 Jun 2023 16:12:10 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 1 Jun 2023 16:12:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 1 Jun 2023 16:12:10 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 1 Jun 2023 16:12:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WurS/1xR9zgJTrd6EkL3WVHhZHsFnMREUWvClXbB6bhaw4Sg9RR+QN8UyMNbjm3dswaZQaJOVyXjAv5u3OV1LdKdJlxp8f9n9jice6CDBxncr/rHLTScbUiaf/fCqqiH5LLqUkZgSHfk+K0253/Y8rsfdCHdI/BXp4+3uS9jmyVoN+nYyuQ4RwicF6ZIOWkp3Lnr8Z04RCNgB/ZrKUZq129CWgIc2SSAaVXKXWbZTugDQOSLTozT3OABDt3Wz1OAWFVt+MakDzhyPPzr0bfelQhZuWBtQR7HEWuKWRyOJ/uShcENn/TRTEjpiKhMriT0e3+7HEr3/l1ujeRZ7lFnLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4YMLg8M0pe6zGIUFDv1RGZge8RtJ7bVgCNVRQ190kSg=;
 b=GdE2aGX+DTYzmRfv3HaVK9te9ludlMseIohKir6QNg9KRnrww5pnt/97uj7MGUgi8byE9fANtR6k/hFi/3o8c9PLDRxQpwKoWC03qMx1dFfPCqtfM/OCfLYNN3ijD2/enhTpp+2c15QE3voAnmAcpyH2ock9tSEtqJULSSTurxfkRxVtm757+ve3FugJanur1Q+jQP4/ApIPWli0Fub4PPFrlMpguQ1qSX8xIwaSVmjPVUVO9w1AOct8wf0yWuTeSjdSMaFswWUN0kfz4VmAoBUaRREJX8jXcwid0D39wwO1O9H+7Uzo3Qx39SYgNmxRWbSuTqclsfVL48LFAcv65Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 PH7PR11MB6745.namprd11.prod.outlook.com (2603:10b6:510:1af::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Thu, 1 Jun
 2023 23:12:07 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::11d1:e192:b174:e851]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::11d1:e192:b174:e851%4]) with mapi id 15.20.6455.020; Thu, 1 Jun 2023
 23:12:07 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v5 5/7] drm/i915/mtl/huc: auth HuC via GSC
Thread-Topic: [PATCH v5 5/7] drm/i915/mtl/huc: auth HuC via GSC
Thread-Index: AQHZlBtDH3d8Bv6oOU6ECNwEguioIa92lL4A
Date: Thu, 1 Jun 2023 23:12:06 +0000
Message-ID: <1ca14c2cc05eb867fba9ac407f39b0a3734d87d6.camel@intel.com>
References: <20230531235415.1467475-1-daniele.ceraolospurio@intel.com>
 <20230531235415.1467475-6-daniele.ceraolospurio@intel.com>
In-Reply-To: <20230531235415.1467475-6-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|PH7PR11MB6745:EE_
x-ms-office365-filtering-correlation-id: 00475dc4-8b7b-4fc2-4262-08db62f59e52
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BQsdicAaQQrC99UFpoBJe49Vv47+vjH5wEJFDKL/IXYTaP/LrUTJDlcU9l9clXoADCdFiRG19lWy40MAVjjdicFCG+eTFo4HqRwNdT5jE5xf2TJhZDaVvZ1DflU9hyDlmzRHB3RuTGlFljlGMEH0ID/x8MzOVly03bSP9RdEIGnRmiFZuWm0KqGEPXzKvBCMNnj6I5adncHyzgApjzlQG6SUpPsEHHxyPfqlzgTdy1OGPbWbxobe5XDsB7a3OZjOqDI0X8xJwp70j4OQb3PGnpBo37NZ6pahp9aQR+lNi/q/Y39gS+EJld9chh34jvsWVzCM6SOVlVU8zZ9NXDjDOT3tauRHw9rg/uhiEkIccTqB9NGaobHs3jLXyB+4pJ5mGEQHTFxK3ZXolcX8znVvMro+bAxbfjB/nmu2UQ58gGAIHnPjb/E9/3tVXPZ+nc+5Em1XYLbu2UBlPFo3UtXa9RxfruoHhgeQXkpce+MkGZPcDR7uvnkQ3hGQIjuL1Isa13OyGe+YeTAeY31/aAsAtMLB2W3ydxR1DYCJ4X3hiaNzwscX4I5uSiw/zfry3HG9aN8AGObu2KY9rjLxI+/BxfHIN7dDcytAx4iO3UMGuazkUYV28NZaTlEGi4Rxd5ww
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(366004)(39860400002)(376002)(136003)(451199021)(91956017)(71200400001)(478600001)(110136005)(8676002)(5660300002)(2906002)(36756003)(86362001)(38070700005)(76116006)(66476007)(64756008)(66556008)(450100002)(66446008)(82960400001)(66946007)(316002)(122000001)(4326008)(41300700001)(2616005)(38100700002)(186003)(8936002)(26005)(6486002)(6506007)(6512007)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QWQ2bnpsb2VOQi9UU0djMHJYTlQ4ZGc2a05ybmtHS0d0UXBNeUZqQjU1YkMw?=
 =?utf-8?B?SzJVcG9tSEh1T0M2UWsyMjZmSEczck9iSWo2S1NzeDM3eWtBZGd3c292cE96?=
 =?utf-8?B?Y3FleHdDVmhJVGl2N2ltVDJ2VFJSUkJ6NUI3ME9vNnpFcXY2c21PS0xOS1BG?=
 =?utf-8?B?VWdJeHp6SVFXMlpUb3QzTVBaUDZVcEhFMlJndGgxd1prWjlBTVZPcVlWVVFu?=
 =?utf-8?B?b2VEYnV5OFcyZWtsZ1BON0I0MnhNK3RCWVpETUpxQ0N2NE5OMUp3YnliRzdY?=
 =?utf-8?B?U1pJQThjK1J4QmVWcS90MVFZV0cvVjVxVUlNQ283V2xxK2c1cVc1NDFCcTcy?=
 =?utf-8?B?OGx4cGlXdUlWQ1Y2d2Z6cFF4WnI5YVg0QURiRnBHK2FudS9RVUpuVExvL3V3?=
 =?utf-8?B?UFdKK0ZaYmwyLzhIWTJCQjYyZHVWZkVqT3JJbDFydk0renBpSDUwOFlIUFpQ?=
 =?utf-8?B?WVovekVJdWZQM09qR1hoSUhRNnZrU3VOcnMrRmFJbDZiWXhMblBab1pFby81?=
 =?utf-8?B?OCs1NUpEVVIzcmF2RlFJWFd6UXpaNWRUYmZ3L3BxazZlQWFRTUp6aUI3cmdj?=
 =?utf-8?B?dnliVVl4VGt1OFJUdzhiYUhkUzdFcllYb3NrZEp3RGR5MEJFbjhjaUNpMkNJ?=
 =?utf-8?B?bjhsYXJxY2J5WlY0Mlh2NXQzZ29zUlZrWi8zclVqRTJHMlBINFIvMG9UUjND?=
 =?utf-8?B?UHlWZUgybjRtd1VlYzFITlFOQ1owTU9kNnk1QUZYb3BZY3hXQUZOOHRHQ0tD?=
 =?utf-8?B?ZWFyWGtUMWY4RDF3bEIvSmJpWmVxaFBtdTRvNWNJVEJJSzl4NGs2SDdRR3hG?=
 =?utf-8?B?RWhWWDhHdG5MWFBaZVRuNUwxTndGZmRhRzZldFNvUS8zWGI1WTFiZ3E4ZVVz?=
 =?utf-8?B?Q29sVkMwRW9ZWGZOOWFjNWdGdWJMMk5za2x3Mm1aT0RhZmpmMS9WTzBkSU43?=
 =?utf-8?B?UmdYVDZiVGVadFpDamg1cDJTMVpHbU1VbC8rVGZoejNaejFtVkJZTFkydk1j?=
 =?utf-8?B?ekRZRXlDQ2hjcnBKYkRSdG9WMyt2V2VmT3ZIU1lVdWRnT2FjVmRLN2F3RlR4?=
 =?utf-8?B?NjhHZm5hZjFyTlpjOURSRy85VWd6Wm5MYWQwZjRqZytoczI1aWVyZC9wTkFJ?=
 =?utf-8?B?Vld0ZWNyenVpOWtTN3hiVjhyMWdBMFpBSzBxV2Zlb0VvVXcwR0czL1JhZUh3?=
 =?utf-8?B?V2JseExaMk0wTFJoZCtEdlRxN0d2OFZsQ043dGxoaXUvcEJSZlAyRzc4RlZw?=
 =?utf-8?B?Y0tPOCt0SE1MRGdXenZNSTlwVWFMalpqb2pTR1l6cS9XWVRLbjRNaVRZM3Mz?=
 =?utf-8?B?V05IdWZ5clFtQU5BbmR4M215dlM1dTUybmtWWkF0L21mZlByTUZaenB1K0pW?=
 =?utf-8?B?R0NodWVHWTFZckpWM1JmbU0yL1MzL3YyeHMrZHlXSmwyTlBSN3B5dFVJaWlv?=
 =?utf-8?B?MWJ4SGdKVnVHcGtCQ1dVODVTTFRvcUFCdnIydE82ZGhpZlN4cG9VTHJLVEtM?=
 =?utf-8?B?U0pnYmhVeHlreXdIbjdSR0U3NU1WRSsxWng5K0pKTHlhaFpKcU1MQTVKS2F4?=
 =?utf-8?B?SkVwcUU2cVJvZWJhVEc0ZnN1VmIwTkR5NzF0cFFWUkg4MHoycWZ1R3pheS8w?=
 =?utf-8?B?dWs4aWZkKzEwR3pYSk8rSWpQZ0wxV0ZsOHVUOTRHRFd5NnlNVnhKNkxFZ2VE?=
 =?utf-8?B?U1hkd2RsR0JkaU5JcE9QMVZRaTM4OTlQRk1mWDdPOVd0dlVLMktvU2NWWGtU?=
 =?utf-8?B?c2ZacDEwVzRBTzdxTHRNWDVWVU0rSGhJWjNuNUJtSmRRTHYxTk5hbXphZE1l?=
 =?utf-8?B?MXBqYkdtd3RaS2QxVVJ5UmVzdkd2Q1ZIbEp5TCtPeUtNZjJ0cXY3c040SWFI?=
 =?utf-8?B?ZmI0VU1OQ0ovcHBsb3lnNEhrZlZFMlp0dWlvNjYvK3B1SytSVVh1ZTFRV05X?=
 =?utf-8?B?Y1ZJOUhoTUdNc0F6MTVIdlp6KzhFekZyTTRud3JTd0Y4MnltZ0pmNDRMdmRa?=
 =?utf-8?B?VHJGZ01tT1UrYnNBbGJITnNDUWprMzdiN3hEdVJIQ1FMYTQxb3pJQ1NyeG9C?=
 =?utf-8?B?QktqOHpvSU5tYURaLzQyeDkyT2JHbGJWWWdGaTlPeTZrZ2JESVQyeWVCU0lO?=
 =?utf-8?B?MEhtL2cvVHUzWTBKdVdxL1JPdFk2NVM3M09SZkhoNWNEWkROY2VlYTdTbC8w?=
 =?utf-8?Q?KYxvZDlou2zqVzTC0W4hfPY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CD52FAEBDE87414EA22C425A2B4761C1@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00475dc4-8b7b-4fc2-4262-08db62f59e52
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2023 23:12:06.5147 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +xDk6oEN3oH8UR6u1p3NB3Sr4LxgqLasPP3tjPXuO2G4ftKTS9NGmQsgRy9v0f6TEMVcJbzXqDkxxEz+XgjKfCkrvYnvN3qOtDSPwjwn1m8LCYuxDQg9Od65aGulOO7V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6745
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIzLTA1LTMxIGF0IDE2OjU0IC0wNzAwLCBDZXJhb2xvIFNwdXJpbywgRGFuaWVs
ZSB3cm90ZToNCj4gVGhlIGZ1bGwgYXV0aGVudGljYXRpb24gdmlhIHRoZSBHU0MgcmVxdWlyZXMg
YW4gaGVjaSBwYWNrZXQgc3VibWlzc2lvbg0KPiB0byB0aGUgR1NDIEZXIHZpYSB0aGUgR1NDIENT
LiBUaGUgR1NDIGhhcyBuZXcgUFhQIGNvbW1hbmQgZm9yIHRoaXMNCj4gKGxpdGVyYWxseSBjYWxs
ZWQgTkVXX0hVQ19BVVRIKS4NCj4gVGhlIGludGVsX2h1Y19hdXRoIGZ1bmN0aW9uIGlzIGFsc28g
dXBkYXRlZCB0byBoYW5kbGUgYm90aCBhdXRoZW50aWNhdGlvbg0KPiB0eXBlcy4NCj4gDQo+IA0K
YWxhbjpzbmlwDQoNCj4gQEAgLTM5OSw2ICs0MTYsOSBAQCB2b2lkIGludGVsX2h1Y19maW5pKHN0
cnVjdCBpbnRlbF9odWMgKmh1YykNCj4gIAkgKi8NCj4gIAlkZWxheWVkX2h1Y19sb2FkX2Zpbmko
aHVjKTsNCj4gIA0KPiArCWlmIChodWMtPmhlY2lfcGt0KQ0KPiArCQlpOTE1X3ZtYV91bnBpbl9h
bmRfcmVsZWFzZSgmaHVjLT5oZWNpX3BrdCwgMCk7DQphbGFuOiBuaXQ6IGkganVzdCByZWFsaXpl
ZCB0aGF0IGZvciBjb25zaXN0ZW5jeSAoaW5pdCBtaXJyb3ItaW5nIGZpbmkpLCB3ZSBzaG91bGQg
YmUgZG9pbmcgdGhpcyBoZWNpIHJlbGVhc2luZyBhZnRlciB0aGUgaW50ZWxfdWNfZndfZmluaSBi
ZWxvdy4NCkJ1dCBzaW5jZSB0aGUgYmVsb3cgb2JqZWN0IGlzbnQgcmVmZXJlbmNpbmcgdGhlIGhl
Y2kgcGFja2V0LCB0aGlzIGRvZW5zJ3QgbWF0dGVyLCBzbyBjb25zaWRlciBhIG5pdC4NCg0KYWxh
bjpzbmlwDQo+IEBAIC00NzAsMzEgKzQ5MSw0MSBAQCBpbnQgaW50ZWxfaHVjX2F1dGgoc3RydWN0
IGludGVsX2h1YyAqaHVjKQ0KPiAgCWlmICghaW50ZWxfdWNfZndfaXNfbG9hZGVkKCZodWMtPmZ3
KSkNCj4gIAkJcmV0dXJuIC1FTk9FWEVDOw0KPiAgDQo+IC0JLyogR1NDIHdpbGwgZG8gdGhlIGF1
dGggKi8NCj4gKwkvKiBHU0Mgd2lsbCBkbyB0aGUgYXV0aCB3aXRoIHRoZSBsb2FkICovDQo+ICAJ
aWYgKGludGVsX2h1Y19pc19sb2FkZWRfYnlfZ3NjKGh1YykpDQo+ICAJCXJldHVybiAtRU5PREVW
Ow0KYWxhbjogbml0OiBzb3JyeSBmb3IgYW5vdGhlciBsYXRlIGNvbW1lbnQgYnV0IG1lcmVseSBh
IG5pdCAtIHdvbmRlcmluZyBpZiB3ZSBzaG91bGQgYWRkIGEgd2FybiBpbiBoZXJlICh0byBjYXRj
aA0KaWYgd2UgY291bGQgZW5kIHVwIGhlcmUpIGJ1dCBpdHMgb2theSAtIHRoaXMgaW4gdGhlb3J5
IHNob3VsZG50IGhhcHBlbiBhbnl3YXkuDQoNCmFsYW46c25pcA0KDQoNCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxfaHVjX2Z3LmMNCmFsYW46c25pcA0KDQoNCg0KT25s
eSBhIGNvdXBsZSBvZiBsYXRlLWNvbWVyLW5pdHMgdGhhdCB5b3UgY2FuIGlnbm9yZSwgZWxzZSBM
R1RNOg0KUmV2aWV3ZWQtYnk6IEFsYW4gUHJldmluIDxhbGFuLnByZXZpbi50ZXJlcy5hbGV4aXNA
aW50ZWwuY29tPg0K
