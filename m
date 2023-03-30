Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3A56D0F23
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 21:44:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C6ED10F000;
	Thu, 30 Mar 2023 19:44:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FBD910EFF9;
 Thu, 30 Mar 2023 19:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680205459; x=1711741459;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=zDjR2IdwSnsHYqLEFpJI5LMDteBj8sYjxCbTiRzqoSU=;
 b=OQJJOgXS6KQhNnPbNaxobcxLtxlwGrwWfEUbuipBHbkp0MxW/FUV1LLo
 OLAoRQRp3z4NVAAVT0M7LmX/69FrjHxKAvxi06KUAnEnXbVbnCxF1NWCo
 u+evLEnHZ/MV8YF4yBtxDhitXYIsi2cpQZxRdf9hvDDt0P8dZpbOVsnjr
 vgWO6a3UXVs/vGKLH/yogLs9YWcVzTbNowARno6M69gJrKvoCDEdSp/GZ
 4oePdfG/UxoK2Zaanxq44uhro2fRBrqgha4jgxqHmv482GCfK/dY7MBoG
 +wWyzi7fbJn954IJ8tZbkSf/7uGlnZIMzVhUjiN1CdfQJ4T5WTDvzbaMe w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="403966401"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; d="scan'208";a="403966401"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 12:44:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="754156865"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; d="scan'208";a="754156865"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP; 30 Mar 2023 12:44:18 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 30 Mar 2023 12:44:17 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 30 Mar 2023 12:44:17 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 30 Mar 2023 12:44:17 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 30 Mar 2023 12:44:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S6Rwo1CA/FXTBgHUG/Gmo9ZZyb0VFWHkLU6+sIpCbS2q6aNKUTgBFhnrzOIoL396eBVIsGR6ahiIjdUBemw0qLBpSQFOnhu4dl1AzJW1nAbL+NfiewIYqVNjZW9yWVh8lqqAScD9wFUz1ajIPk6UG5Dih5M/KoTQRP9ZcLN/cWJAz5q3+ZbYyXBaad06bo71zqnjBsxFHJpKpevpHuLUlydvY6c2yCz3ft3PmS4KkE6E0iF22y4RdIrVld4OEVZhiih74xv13I88l829glNxwX8w1fdJsd5sLnHqVRaQhMskogrSPwYqvhDMNt8oCTgKPSAo24Kn2KQc6NicRYYYlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zDjR2IdwSnsHYqLEFpJI5LMDteBj8sYjxCbTiRzqoSU=;
 b=QiReTZHM7gTMmsOLRzmFsb6PYwTedCURXiMusbX85EE4u0CvGx4JWQLcW7zZjOmvxKlyRXFd3mzULXMw8kpOA246DAdAUKSIdKGXxZbM6HYsycTpWxS03YyYgyFt/p1XiJeqZyXeiZBwuri0JoOYH11n3hXEXCMZbVD98Ff8i2swWwJkTbnU+PBuye5wxiMLGaEgOexI6y+5arvg9FokJB+m6VodYAVqUXXwvHOxMDeamydIqFMBfMy409NXQWMJhstuj7k2NASSTxinPcwKFPd+D08LNjEp8XSggWVybKqARH3ykp9BYOyeq/Sw4rqjVTWhx9ZZjG0E/ofzW5fXvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 CY8PR11MB7364.namprd11.prod.outlook.com (2603:10b6:930:87::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.33; Thu, 30 Mar 2023 19:44:15 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3%4]) with mapi id 15.20.6222.030; Thu, 30 Mar 2023
 19:44:15 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "tvrtko.ursulin@linux.intel.com"
 <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v6 5/8] drm/i915/pxp: Add ARB session creation
 and cleanup
Thread-Topic: [Intel-gfx] [PATCH v6 5/8] drm/i915/pxp: Add ARB session
 creation and cleanup
Thread-Index: AQHZSxtxSfUqWny+hUmFCBmRtOC0Wq7p3LIAgCFQjwCAAeX0AIABTCEAgACZHYCAAZ87gIAADjoAgADoKICAARPBgIAAzW+AgAB6iQA=
Date: Thu, 30 Mar 2023 19:44:15 +0000
Message-ID: <4ad872f1366802a717e13140d1da467ace1ae36f.camel@intel.com>
References: <20230228022150.1657843-1-alan.previn.teres.alexis@intel.com>
 <20230228022150.1657843-6-alan.previn.teres.alexis@intel.com>
 <fabe4123-53cc-005e-e0af-7683e0d45896@intel.com>
 <3b8091c51677878b968d1d275b9b16e5088d913d.camel@intel.com>
 <ZCAqDlUIp0YmCkyu@intel.com>
 <fef256a6-3027-8beb-0ef8-fddf972db441@intel.com>
 <cf63d62b-3e2d-f8fe-82b6-95e71e376cc2@linux.intel.com>
 <3359c9d371a25710891352061693637b37679734.camel@intel.com>
 <ZCMpXMj7GwDIp6Ll@intel.com>
 <118981ef-260d-4c1a-5ca5-ad435d5edbc7@linux.intel.com>
 <f87c39a243d84e53d6c292c63d032b30c89adb3e.camel@intel.com>
 <36548877-5352-8ff3-6e87-410089470a4b@linux.intel.com>
In-Reply-To: <36548877-5352-8ff3-6e87-410089470a4b@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|CY8PR11MB7364:EE_
x-ms-office365-filtering-correlation-id: 97cae434-5d59-40ff-ed92-08db315724bd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6UhfDFqeBLbY7X4V5Dju+lEOMuSEkZze67zoLjM8UVm8Tu5xj95cxtfmUXINwyulO5T9EklkjV+5iz2zR7xCHGZawxqttArP40sJyxLvyV/G4+INw0vO9pd/UvPPiTqEqYmuyhS8q5dM0Bs76vQWiEXe6fSqhTSo5yfjshPCW5AJK76KXLerhF5hx3NlAiFw5exdrmQXS6obbR/6pyWUqk7u7jgPhqumstwF4FzuwJl5u2/fBUILAmroecTtLg54vjKbu89+S0m+mzHM2nBeTLjQsD2OAtdO3mkqUdKc0UBzXTjjwapB2cZV+/D8ow661CBH3yFk5fRbqDrOY4VqhzOy1w/RioQw2RsHhU8VP0jcOY/FP9IUaPMXaJ895bk9AflM1LswRit97p2eWu7lc+Kc2FkyzveI+Ei+/jzall1qdEiNDwUOC6FwTaHyzVjgZ0wlWv0kWqRUOR5/va7TYTui/OIOTraLY9e5DYyrBlIc43fmiy9Y4LhWsYPQO09bwI1zESbb/RrTafNM6E17k88Isjahs0M6S9TI75wLQBKlPND1ps7CQk7wWNoisvWjhNQIERT+/pdCPAKPWfHfS3LvXmI1heJ+oq+pnocypQePuE7OMsoYgHUd/las4toe
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(136003)(366004)(346002)(39860400002)(451199021)(66476007)(8936002)(82960400001)(66556008)(66946007)(122000001)(8676002)(64756008)(66446008)(41300700001)(4326008)(76116006)(2906002)(38070700005)(38100700002)(5660300002)(53546011)(6506007)(6512007)(26005)(6486002)(2616005)(83380400001)(36756003)(186003)(316002)(91956017)(110136005)(86362001)(54906003)(71200400001)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M2NnUkpCMDBOb3g0c2E1RGJvUUVaTm5JczY0ZjgyT2ZUNmVuSEJ2TFhpYnZj?=
 =?utf-8?B?d0JDNEJOWVFZNVRicHRFRXRkRWRVd2NlS3FpYVh1TXRCVmtJa2tkTkI0d3J2?=
 =?utf-8?B?VnhQNFErZDVMaWNqRjUyWUZLSlRlN1VBRHJkVi9iemZCN1RyS3crUEtPNGkv?=
 =?utf-8?B?WnQrS2NxVmxVRHRHcnpVK21SQW1kemJ6aHVoLzcxSFVaNS9jWjhrbEc2ZXdr?=
 =?utf-8?B?NmVRTWRLem9hV3ZOazBqYXVRcFhsU1UrS1FHcTNLREtjWTNCNG5UNVFheWpT?=
 =?utf-8?B?aUZqVytTcDFMTWRmYUZ1eVVpNTIySi9TcEtRZHdIUnR0TUJOcEVpQU5vcHNz?=
 =?utf-8?B?OHF5eXNQUVRyNFExWFZycVc2N2JRb1p2MzFuclVzSzZXYUFFRGh2Q1Y5bTBX?=
 =?utf-8?B?WWpOZ3lkYzFNeTBnaE9jdmZ5SWxDeHl1b2thQVlEOVNmd2FJYkcxa3ZneEI5?=
 =?utf-8?B?Um1WQXZPYnc5YXBUYWhIZ0FDNFpRWlJJWUxHQmlZeTNFQXBnd2FTeFJsTFBN?=
 =?utf-8?B?TG5tMEYrNkF3RFNSN3lHcDA1QmlCYm1aOE9SZG9TNUY5ZCt2NmlxUWE4dEND?=
 =?utf-8?B?a29JOFZwR1krUkhzZ3RvWDZ6ZlR1aUNmaTlqVkRrYjZpbE10d3V0NThBUDEx?=
 =?utf-8?B?cE9PMFNiV00rUy9JbEhwN2NubGRoNEtFS0dmZ2svb0UxSzlIRW5LU09zd3NY?=
 =?utf-8?B?VVRHWjNEWnpVV21mWG9zSnJYR2dNUHNWMUgxdWdVb0JsSlBXUGhla0Y1b2M1?=
 =?utf-8?B?WUhwZWhIUGpyQ2tWelN2TTd3Qnk2S0tMMDdWVmhhUWFSdUMxUzhmek9LZUVZ?=
 =?utf-8?B?SVl1WFF2WnRCcDVSRG5CWUVQYzV5Tml0Qm1JVEJtTUFYNzFPcWdyZkR3RkZX?=
 =?utf-8?B?dTkrU2hPRlFJUFd0Q0RsMVRLYXpKdjNFa2tzcE1vN0xTdk1zMGQzV2RsOEpR?=
 =?utf-8?B?NWZLRFN0b3RjdWI2Vm1tV295WEJTMm5qZTcvdXFmb25CSVBtRnJnS0ZPdk9R?=
 =?utf-8?B?bXlHRDhBYzl6dnZhSEhkbWFVSk92VEdVb2tPdHZ1VnhKM3VRSVZ6b3JmbG5o?=
 =?utf-8?B?dFhSM0lwSm05U1p6aDlQU2FhNEtzNnA1TjJZY05IQ1pGTnVIOUZxK2xhOExK?=
 =?utf-8?B?dVk0SHhScWNVSzJxenFWMEtqVUNHMzM0NUptK3Q5U3UxRExHdHNxM0RtSjVq?=
 =?utf-8?B?Vk5zeWppdzV2RU9VVEhjcThvOFdyQW1MR3pKemhIemNGcWwzNFVkc0NteHht?=
 =?utf-8?B?cGJJaW4wVEJkUmJuUzR2d3V0SEZ5RmI2ZXJ6VFZLZFdBNjAvbklMY2RkOC9J?=
 =?utf-8?B?UzNsRmhhY3UvaTZWeEdISzJVaXhuT0ZLZXB4YWlCS0R5QUpuMnpGNUFPOGdz?=
 =?utf-8?B?OWVWWFUwL1k2d0hnR0pzMFA3RTU4Z3hSSkx2aXNJTWt6N3ZZTmZ1NTQxZEdx?=
 =?utf-8?B?Z3RXTThOTERrZkVOL3ZuZ3M1bFcwY1hDU1M3MlRmZm9LNTZGMytlWTdoQVBS?=
 =?utf-8?B?aXJrYXRFNFM5QkFMNGlLSmxFVVZYRHJGUWxlMUtzRU56by8rbmJ0VXB2T3Fk?=
 =?utf-8?B?bmhJL3F3djdDQUkxeXhiN0FMbmVuYjdjdk9XZWZycXdVa3AyVDcxUVB4V0Jp?=
 =?utf-8?B?bEV2WTY4aFhNZElxaVU2Y09jUXBYN2pDVS8wLzcyanF3K1lOZGNLR1MwTnl4?=
 =?utf-8?B?cGthL2J2cTRCdlhKQ08wZnZjSjJZUXFnTEI4L05zQzRZZS9MRmVCZ1RkSmNN?=
 =?utf-8?B?RkdrcXI0RGYvbHVqSS9IK0U3UFBiR09icWh2d1pCcitLVldJbExRT0ZNNU8r?=
 =?utf-8?B?SWZPaEdiVzVwWTc4Z3hYS1dQc1h4NWhXWmhWUE1GKzF0YTJVNXN1WFExUG5n?=
 =?utf-8?B?MmlQQkVXTjVFNy9OU1B1K3J2NWZyNDRQZGRXdVpzbzBrZ09uOXpaYWpGRDJK?=
 =?utf-8?B?MGxIUURnejBzS29rWGQ3K1Jqa0s2cG95R1Bna0pLT0RJTVhXRFYvaU1HUGtW?=
 =?utf-8?B?VSs1dmR3eDJvNkh6VkdhdHNOK25Xb3dUUDVaZ1hxcWtNMU9KeVllellmNmJx?=
 =?utf-8?B?eUorV0ZVWGdjbFAzUnV4YXdUd2M1aDU1SEh3ZnRZSzRFSGdnUlN1RTVYMnBB?=
 =?utf-8?B?U3p0d1oyVnhVcmRZZ3QzbFdqc2NSZDkyWHF6OTFvVGtQNzFHempzdW9CQ1Zo?=
 =?utf-8?Q?8HPJ/zwZ3kSXfoTBvY/iaVA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <73EB4079971F784D90458ECFCE9CD3F6@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97cae434-5d59-40ff-ed92-08db315724bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2023 19:44:15.1094 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cDEf65HIP1t4RC69u0GeCuLIDOGtV2YdGvYFqDYSx68wCOg/bnRX5rzsKny6/Yr/Xonj29hok2L396JY274GchqCUW+Lh/h7zeJDR5/6046WjxfTOhyyCN3xBlfPejHL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7364
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Landwerlin, Lionel G" <lionel.g.landwerlin@intel.com>, "Lahtinen,
 Joonas" <joonas.lahtinen@intel.com>, "Ceraolo Spurio,
 Daniele" <daniele.ceraolospurio@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Harrison,
 John C" <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTAzLTMwIGF0IDEzOjI1ICswMTAwLCBUdnJ0a28gVXJzdWxpbiB3cm90ZToN
Cj4gT24gMzAvMDMvMjAyMyAwMToxMCwgVGVyZXMgQWxleGlzLCBBbGFuIFByZXZpbiB3cm90ZToN
Cj4gPiBPbiBXZWQsIDIwMjMtMDMtMjkgYXQgMDg6NDMgKzAxMDAsIFR2cnRrbyBVcnN1bGluIHdy
b3RlOg0KPiA+ID4gT24gMjgvMDMvMjAyMyAxODo1MiwgUm9kcmlnbyBWaXZpIHdyb3RlOg0KPiA+
ID4gPiBPbiBUdWUsIE1hciAyOCwgMjAyMyBhdCAwNTowMTozNlBNICswMDAwLCBUZXJlcyBBbGV4
aXMsIEFsYW4gUHJldmluIHdyb3RlOg0KPiA+ID4gPiA+IE9uIE1vbiwgMjAyMy0wMy0yNyBhdCAx
NzoxNSArMDEwMCwgVHZydGtvIFVyc3VsaW4gd3JvdGU6DQphbGFuOnNuaXAgKGV4Y3VzZSBteSBz
bmlwcyAtIG15IGV2b2x1dGlvbiBrZWVwcyBpbnNlcnRpbmcgQ1JzIC0gc3RpbGwgbG9va2luZyBm
b3Igc29sdXRpb24pDQo+IEJ1dCBpbnR1aXRpdmVseSBJIHRob3VnaHQgdGhhdCB3aGF0IE1lc2Eg
d2FudHMgaXMgYSBuby1jb3N0IGdldHBhcmFtIA0KPiB3aGljaCB3b3VsZCBzb21ld2hhdCByZWxp
YWJseSB0ZWxsIGl0IGlmIHRoZSBmZWF0dXJlIGlzIHN1cHBvc2VkIHRvIGJlIA0KPiB0aGVyZSBh
bmQgY29udGV4dCBjcmVhdGUgYXQgYSBsYXRlciBzdGFnZSwgd2l0aCB0aGUgcHJvdGVjdGVkIGZs
YWcgc2V0LCANCj4gaXMgc3VwcG9zZWQgdG8gd29yay4gQUZBSVUgaXQgY2FuIHN0aWxsIGZhaWwg
YXQgdGhhdCBwb2ludCBvciBwcm9iYWJseSANCj4gYmxvY2sgdW50aWwgdGhlIHJlcXVpcmVkIHNl
dHVwIGlzIGRvbmUuDQpZZXMgLSB0aGF0J3MgcmlnaHQgLSBpIGhhZCBhbm90aGVyIHJvdW5kIG9m
IGRpc2N1c3Npb25zIHdpdGggRGFuaWVsZSBhYm91dCBhIGNsZWFuZXIgYXBwcm9hY2ggLSBiZWxv
dy4uwqANCmFsYW46c25pcA0KPiBFdmVuIDIwMG1zIGlzIHBvc3NpYmx5IG5vdCBnb29kIGVub3Vn
aCBzaW5jZSBib290IHRpbWUgdGFyZ2V0cyAodG8gVUkgDQo+IEFGQUlSKSBhcmUgcHJldHR5IHRp
Z2h0LiBEb24ndCBrbm93Li4uIE1heWJlIEknZCBuZWVkIGEgdGltZWxpbmUgZGlhZ3JhbSANCj4g
c2hvd2luZyB0aGUgaW52b2x2ZWQgY29tcG9uZW50cyB0byB1bmRlcnN0YW5kIHRoaXMgcHJvcGVy
bHkuDQpBYnNvbHV0ZWx5LCBteSBleHBlcmllbmNlcyBpbiBpOTE1IG9uIGVtYmVkZGVkIHByb2R1
Y3RzIGV2ZW4gaGFkIFBPUnMgb2YgPDEwMDBtaWxpc2VjIHRvIGZpcnN0LWZ1bGx5LXJlbmRlcmVy
ZWQtZGlzcGxheSBmcm9tIGNvbGQtYm9vdCBzbyB5ZXMsIHdlIG5lZWQgdG8gd29yayB3aXRoIHRo
aXMgcmVxdWlyZW1lbnQNCmluIG1pbmQgYW5kIGRvIHRlc3Rpbmcgb24gcmVhbCBjdXN0b21lciBz
dGFjay4NCg0KSSBzcG9rZSB0byBEYW5pZWxlIGFuZCB3ZSBoYXZlIGFub3RoZXIgaWRlYSAtIGJ1
dCB3b3VsZCBhbHNvIGltcGFjdCBtZXNhLCBmb3IgdGhlIGJldHRlcjoNCg0KMS4gSW50cm9kdWNl
IGdldC1wYXJhbSAoaXNfUFhQX2F2YWlsKQ0KCS0gd2lsbCByZXR1cm4gYSBzaW1wbGUgeWVzIG9y
IG5vDQoJCS3CoHllcyBtZWFucyA6IGk5MTUtZGV2aWNlLWluZm8gc3VwcG9ydHMgaXQsIGtlcm5l
bCBjb25maWdzIHN1cHBvcnRzIGl0IGFuZCByZXF1aXJlZC1maXJtd2FyZXMgd2VyZSBmb3VuZCAo
bm90IG5lY2Vzc2FyaWx5IGxvYWRlZC9pbml0IHlldCkuDQoJCQkoTk9URTogdGhpcyB3b3VsZCBi
ZSBtYWRlIHRvIGhvb2sgdXAgdG8gcHhwIGhlbHBlcnMgc3VjaCBhc8KgaW50ZWxfcHhwX2lzX3N1
cHBvcnRlZCkNCjIuIEdlbS1weHAtY29udGV4dC1jcmVhdGlvbiBjb250aW51ZXMgYmxvY2tpbmcg
bGlrZSB0b2RheSB3aXRoIG1pbm9yIHR3ZWFrOg0KCShzYW1lKS0gc3VjY2VzcyA9IGFsbCBkZXBl
bmRlbmNpZXMgYXJlIGluIHBsYWNlLCBhbGwgZmlybXdhcmUgaW5pdCBjb21wbGV0ZWQsIHB4cCBh
cmIgc2Vzc2lvbiBzdWNjZXNzZnVsbHkgY29tcGxldGVkLg0KCShzYW1lKS0gbm9uLXN1Y2Nlc3Mg
LUVOT0RFViA9IGlmIGFueSBkZXBlbmRlbmN5IHdhc250IGF2YWlsYWJsZSBvciBmdyBmYWlsZWQg
dG8gY3JlYXRlIGFyYi1zZXNzaW9uIGR1ZSB0byBmdy1pbml0LWZhaWx1cmUvQklPUy9wbGF0Zm9y
bSBjb25maWcuDQoJKHR3ZWFrKS0gbm9uLXN1Y2Nlc3MgLUVOWElPIChvciBzb21lIG90aGVyIC1F
J0ZPTycpIGlmIGNvbXBvbmVudC1kcml2ZXItaW5pdCBvciBmaXJtd2FyZS1pbml0IGlzIHN0aWxs
IHBlbmRpbmcgYWZ0ZXIgYnJpZWYgdGltZW91dC4NCgkJLSBvbiB0aW1lb3V0IC0gVEJEIC0gbmVl
ZCB0ZXN0aW5nL2RlYnVnIG9uIHJlYWwgd29ybGQgc3RhY2suDQoJCS0gVUFQSSBzcGVjIG5lZWRz
IHVwZGF0ZSBidXQgcHhwIGltcGxlbWVudGF0aW9uIGN1cnJlbnRseSB1c2VzIC1FTlhJTyBmb3Ig
c2ltaWxpYXIgcmVhc29uIGluaGVyaXR0ZWQgZmlyc3QgbWVyZ2UuDQoNClRodXMsIHdpdGggdGhp
czrCoEdldCBwYXJhbSB3b3VsZCBhbHdheXMgYmUgaW1tZWRpYXRlLiBQeHAtY29udGV4dC1jcmVh
dGlvbiB3b3VsZCBvbmx5IGJsb2NrIHdoZW4gYWxsIGRlcGVuZGVuY2llcyBhcmUgaW4gcGxhY2Ug
YW5kIHdlIGF0dGVtcHQgdG8gY3JlYXRlIHRoZSBweHAgYXJiIHNlc3Npb24uDQooZmlybXdhcmUg
Y2FuIHRha2UgdXAgdG8gMjAwLW1pbGlzZWNzLCBhY2NvcmRpbmcgdG8gTVRMIHNwZWMsIHNvIEkn
ZCBzYXkgfjIxMCBnaXZlbiBvdGhlciBvdmVyaGVhZHMgYmV0d2VlbiBpOTE1IGFuZCBmdyBhbmQg
YmFjaykuDQpXZSB3b3VsZCBuZWVkIHRvIGNoYW5nZSBNRVNBLWdldC1jYXBzIHRvIHVzZSBnZXQt
cGFyYW0gKGFuZCBub3QgcHhwLWNvbnRleHQtY3JlYXRpb24pIGFzIGl0IHdvdWxkIGFsd2F5cyBy
ZXR1cm4gaW1tZWRpYXRlbHkgd2l0aCBrZXJuZWwgc2lkZSBzdXBwb3J0Lg0KQW5kIGlmIGFwcGxp
Y2F0aW9uIGV4cGxpY2l0bHkgcmVxdWlyZXMgUFhQIHN1cHBvcnQsIHRoZW4gaXQgbmVlZHMgdG8g
Y2FsbCBweHAtY29udGV4dC1jcmVhdGlvbiB0aGF0IG1heSBibG9jayBvciByZXF1aXJlIHJldHJ5
Lg0KV1JUIHRvIGZhc3QtYm9vdC10by1maXJzdC1mcmFtZSwgSSBhbSBob3BpbmcgcmVhbCBjdXN0
b21lciBzdGFjayBkb2Vzbid0IHJlcXVpcmUgUFhQIG9uIHRoZSBjb21wb3NpdG9yIGFuZCBmaXJz
dCBtZXNhIGluc3RhbmNlIHdvcmtzIGZpbmUgd2l0aG91dCBQWFAgY2Fwcy4NCkFuZCB3aGVuIGN1
c3RvbWVyIGFwcHMgdGhhdCBuZWVkcyBQWFAgc3RhcnRzLCBpdCB3b3VsZCBjcmVhdGUgcHhwIGNv
bnRleHQgd2hpY2ggd291bGQgYmxvY2sgYnV0IHRoZSBhcHAgd291bGQgbm90IGhhdmUgYSBjaG9p
Y2UuDQoNCi4uYWxhbg0K
