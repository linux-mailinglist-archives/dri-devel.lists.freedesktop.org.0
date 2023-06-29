Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E88742AA7
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jun 2023 18:28:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEDFA10E3EF;
	Thu, 29 Jun 2023 16:28:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE9210E037;
 Thu, 29 Jun 2023 16:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688056116; x=1719592116;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ix1EURMYoGTHh9eX11dQ5oFiCyXnPi3cxeDSmhVlbsc=;
 b=Tz08WaqWphX9ryOhyXGT3U62deUDyF0/p38LmMu5GOAc+CQiYNRZj33U
 ddnjdJ6aMe6mnsDtP9H/zAB2A6raPfod98UBZjz6SuA4S2Ailw5oqmPTW
 ngJrJHq0h8i7Zz7dtXfVGkNxIMWEqK0Zl/Iv4CShcmiN4FhSih/4dp2TQ
 PIik/S/bwxCP6LnFDOd7krEivK3dw+Q3KN+G1e09PIX84F/otNhysZJha
 PU2ZnkTNT0V+vpuCL6OML5gk2LYprMAM8uYuqpjxtuc+jH7vTqjMAgerq
 qdz5xgExsIaIAbfIEkY+10ZxlWOjGOUkSYJqqqNb25KLqntyV01+TYTAL Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="362194925"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; d="scan'208";a="362194925"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 09:28:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="841507171"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; d="scan'208";a="841507171"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 29 Jun 2023 09:28:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 29 Jun 2023 09:28:34 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 29 Jun 2023 09:28:34 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.105)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 29 Jun 2023 09:28:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DmGfh+MRHtsNZM7ki9QsNuoSqOyPluqr1dDZFlaemdGt7FZ7r+93SC6KvoS7D72EMsCqpyAFEITS0wvdWfQzHKVoUVg6tw7mUN94Eni3FZLrfyREaZDqfriGYj1NYYTK7xOVBns5l0tG1ZfjG5ddOpPOkldM8TOwZgE+6xZZr++6rl598yfatmOdgrJmc2EZVlqvBLvRh1VqnHrzaL6Is4APRU/8KDu3qAtZ4idVOnd9A4Hj2lwzHhnbiPOtHokduN+ra9PE4vMbA3CWQYRCe6iIuHDxXmhnbNmjlGTIQ78OjHG+CeGQI53i3EMaZ8wT4xzcGXJlT0rVqWimhzuLoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ix1EURMYoGTHh9eX11dQ5oFiCyXnPi3cxeDSmhVlbsc=;
 b=fhxw/Pgc5PDkVRrUJBwHmwqflE8rpn1qN92HfDPexQrg8sKyNMraN8XCbKnrew9xqxno2vqgQZlnht1v6M1qJNDVtoTowfB4bHM0+B/IyBBiB+SX/UHgTTBQrdY3sOJS8T0yQzMqPVR93jdVG+euDHa1pK2I3FV9jv5xRqIBOAvXZUQIn89ajs8umzsRXI5dd1bdQ6Fo8m+4xJXg+xJQDxqBqT+E+r++IF89ogXJz6eVZOru26oUuOTrpQOhJzj9Evx0k2buz14yx7rVgQFs1WgNR/wBULxBc5ROH0qbGNK3Cb8QjMgEG2e6BJISYsnCTg6hyWFVgnLOQ80NDBHuHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 SA0PR11MB4733.namprd11.prod.outlook.com (2603:10b6:806:9a::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.24; Thu, 29 Jun 2023 16:28:32 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::749a:b0c8:4930:5a2]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::749a:b0c8:4930:5a2%7]) with mapi id 15.20.6521.024; Thu, 29 Jun 2023
 16:28:31 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
Subject: Re: [PATCH v3] drm/xe/guc: Fix h2g_write usage of GUC_CTB_MSG_MAX_LEN
Thread-Topic: [PATCH v3] drm/xe/guc: Fix h2g_write usage of GUC_CTB_MSG_MAX_LEN
Thread-Index: AQHZqezMNiKbYPLoUEeVLIHIoBaLja+gv32AgAE6IoA=
Date: Thu, 29 Jun 2023 16:28:31 +0000
Message-ID: <e9a8dec5bc2a11681df241f59a36e92e41e691e7.camel@intel.com>
References: <20230628181718.1023703-1-alan.previn.teres.alexis@intel.com>
 <ZJypqfa107jTQZn+@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZJypqfa107jTQZn+@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|SA0PR11MB4733:EE_
x-ms-office365-filtering-correlation-id: afe0bf77-8735-470b-4327-08db78bde091
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xiDeTVXQjCFinyAtzwrYTA408B6pZQv9a+QYGYY/SZONSuG6SNd0biLszw6Q52xz6bCuXcrxtumgVisWKO1YMOzyPRtB5bz9tdLVn8qCczv2gjtUQw9zizikp0oAqoJO5jJfTkM6paVtT4HlXDrxl49DHY38ZDtn58n8ArrYuW5Kbt3P/N6Il44GbLHxBalTNvnT6+Dr57znIZTmkUHbilWu3mjbQUu6eCuKXxB2607n0dOQYX5fCTJWN6rfKcYY3xNgSU53kl/1u65G0kUER7ceXTycj+0iajc2fWB4HMY8x768kqiVNQV149Mcq+sOFOjpUeBsan2txBHGtLFC9rXy9k5LfB+piiJ8oR6PcmlpNeBUC+nDpZ3BR89KCa1IRMVZSCit9sxTh8wBHakOwFuIJBi1/F2J5fGNPO1IGOj6y/JGFFApJUqs/JQ2XzAlzIT9L4ka6c3mtmPJT6UYKZsHfrSh7P4a0I+ehV2wtfT9REuoNq+UIsdpfxgM5Fs7V+FvVXiAM3ih68UPrsfiLt0THPGd/f71J57uxmfUlTbz7XN7uvZk1z6jA1HdFzQ4RfXK8NiDkHWIzFSohKPi8vCRviV7VkG+GttlEfNL2O75zmG3FLhYLdE5UqXN610f
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(366004)(136003)(396003)(346002)(39860400002)(451199021)(6506007)(36756003)(66556008)(107886003)(6486002)(26005)(37006003)(71200400001)(54906003)(2616005)(6512007)(186003)(2906002)(478600001)(86362001)(316002)(64756008)(5660300002)(66476007)(122000001)(6862004)(76116006)(82960400001)(6636002)(66946007)(91956017)(450100002)(8676002)(4326008)(66446008)(41300700001)(8936002)(38070700005)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z1BnYXAwaDAvZGRnbk9PU1FiNHhKZ2ZZaFZCMzB2WHZUTk80OHNVYVF5LzN0?=
 =?utf-8?B?YnhNQW9NcjBFdnM5dThiQkx1bjVpMDVFK0JsVFRjK0g4cWIvSlNvR2JTcWxI?=
 =?utf-8?B?WGNTTUVzZVBLLzRxU3NxaTRnTE5pV1V3WnFlTWdSajNoQi9iYkFwWTBuMEZr?=
 =?utf-8?B?RVlnSnJlQUxXSG5QdzNMYWJSSUFjcEFMek4wMHFJdzQ4KzBzSytoVEpzNkhu?=
 =?utf-8?B?dlg1R1QwMy8zaUZuOG9FRXVxQ0FzbEpiSHUxLzdwR05JM0pyRGlkMk9vS05E?=
 =?utf-8?B?VGNRVnZQTDNPdGFnVU5QY0p1bGVQTnBCVEVpZVZMY0srNTliZHlBVmw1ckUr?=
 =?utf-8?B?MlB6MGxIUGtpNW9lNFBsYjc3ZFdjYVFzNFdWTE5lbmJRaCtBcmFGY1hXNEpt?=
 =?utf-8?B?MDRkYXJ1L3p2OUNXS3ZSMkRINTRlaThBRUZpUlpia2c0R1dJdjZzMXJFUldw?=
 =?utf-8?B?MUFkM3N0Ty9kc3o0N3FSanZTVUtKbVk5bDlIVko2WmJDNzhaVlVPdWNVcVJu?=
 =?utf-8?B?bXp1NGV0Y2k4OTVMb1dDaVp5cG1iZGo3NmhyaGNPMUVXcDNpNGNuY3BYMHFT?=
 =?utf-8?B?UmFwaXh3dGU2TW5KZWI5dzYwbHVVL3Bka0UvalluRlUweTJvS0JLa1ZTMnh5?=
 =?utf-8?B?TkhUZFVnSzZhSlFSczZXL0I0UTcvL0NGV1VPbmZIYUtSZ1NBVHI3TTB6WTd4?=
 =?utf-8?B?SmtaSkhYUmVhSXFCT3diMVZxTmo0Z3crZFcrbkNScDFGVUwyTU4xM0E1dnNY?=
 =?utf-8?B?WGNoNEpScmgyajBmNHQ1WVBQKytJOEk0TC83TVdEa0xjV2NhTzRJWmhaYWl0?=
 =?utf-8?B?ME5RdnQwRWMvZkRZRCtURGlvaElKblJ5RHdNemI5eENEUmRoSjQzTk1CeVF2?=
 =?utf-8?B?TGZJTVZYYjdJZ2NiYTlwQXhseXVlZVpsUlk4bWR0Y0QyN3lHQTFPZ09ibmhi?=
 =?utf-8?B?d0xRMnNRK3N5cU5oM0x2T0toYnZtTG5ZMlhQNVZERUp0eC8xcTdqdnk0N1BG?=
 =?utf-8?B?Z0plcFZubXZqallwd0ZBb3ZQelpUcWViWXRibDhnaExuVHJQOFdkeTI0Uk44?=
 =?utf-8?B?VUpTUmdXUWNXZlJBb2llYXY0T2xSOHNBN2xvZWVDRkhpbCtNSzRRaWJaaG9V?=
 =?utf-8?B?SlBveGpId3ZTOWZkVVFBYXQ0VUZEbkxPYjd3dFhYOXB3Ly9zZkpPVmtJV05i?=
 =?utf-8?B?ZnpJcTcvQkdJajFiaTZGWXlXVFhad1ArY1UxL0RLR1BBYnAxRkxpeWNRNER0?=
 =?utf-8?B?YS9SNzRuRjJ0UnlkbkJhbmlxeVV3bmJuRjczMEFERWFOMW1NdTM2K1FvVnNZ?=
 =?utf-8?B?VzlxMkcrYnNURldKYlpsVncvRUE2bHlBVk0vUXRQT3RBZzBaVy92Y3RjMVI0?=
 =?utf-8?B?ei9zajlUMTRKZFpZSk82RWpGQWFVUW5uT003MmtUelhIN3B1K1VLMEcxWU0y?=
 =?utf-8?B?RlpHUXE1U002cThQNG1MNm9HYktuT3oyRmFjS0tHSExETUpBaWM4UU82VjF2?=
 =?utf-8?B?UVVZMkpNQXNMTGtSdm9YNlBPTjhCVytFbGdWM3JDSURqQmVGZXJOQzVHU1E3?=
 =?utf-8?B?M3hQUFRwQkQ0V1lNQzhZN0FDcDlCL3RROTdYc0lzeDZoMWpGRnY5YmRuQzJX?=
 =?utf-8?B?MUJUajVXSTFSWmg0bmJYS0ROMzZ0QzNtbGhYRlNRc09ZWGtsaEw4RjNzYzhT?=
 =?utf-8?B?RlNuTWE4R2RmdFpURDRHQ0VSNkdlM0xtM283UG4yTDQ5TlNmbjFxU3BINUNl?=
 =?utf-8?B?M0Qxd1RtcTVJTW9BUkdYd0I3WGxSSDBzZGZJaEovSno2NkdtQzRMajdaWkgy?=
 =?utf-8?B?UEFJM0NzNmZIRlE3azZoSzc0VkRxZm9BWWdvNkhwdTFqRGxMalNFZUQ2cE9Z?=
 =?utf-8?B?eWxGeXBtS3NkWGxSakQrOE9OSTVqck9TTms2MWRuVGRDZFlKenNBbW5TYzkv?=
 =?utf-8?B?TTI4YlJrZ3kyc3p0SDlmSmtTZXVFcDc2TC9rTXRCb25ISnFPUlRGeWhhMTND?=
 =?utf-8?B?KzlnTkxENlpoWThtM3BnS1QzeHNYMTV0cWhYTnd5Q1RFbm1BTG5OVEp6ZjE1?=
 =?utf-8?B?VVh5a3R1Ymh4VkRMQTV4Z21TRWVvSVRqVU1RL2N6RkJROHYwSXh3M3dWYzdl?=
 =?utf-8?B?bUxCSUpMNjI1ZmpKMjRIL2tJa1hTUEMyR0R4cWJqQXRYUXp1VTArYmZMeVBa?=
 =?utf-8?Q?J5sRMpFTbJBZ4RgZFtoNh8M=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D8922F529DF242438FF7246D242A3337@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afe0bf77-8735-470b-4327-08db78bde091
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2023 16:28:31.4330 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GhGCwwWF7s2yhrvEfpIcY5M+lpdu6F7aXneznve8Je7I0k4Tkkl+dK02sYYPwurKzhIw+ANqKjhmbsWoy0GX2Bf0a0B1/f+fXmtmePWqBdH5joz6MlzsfxPBpgsUtVaI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4733
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
Cc: "Harrison, John C" <john.c.harrison@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIzLTA2LTI4IGF0IDIxOjQ0ICswMDAwLCBCcm9zdCwgTWF0dGhldyB3cm90ZToN
Cj4gT24gV2VkLCBKdW4gMjgsIDIwMjMgYXQgMTE6MTc6MThBTSAtMDcwMCwgQWxhbiBQcmV2aW4g
d3JvdGU6DQo+ID4gSW4gdGhlIEFCSSBoZWFkZXIsIEdVQ19DVEJfTVNHX01JTl9MRU4gaXMgJzEn
IGJlY2F1c2UNCj4gPiBHVUNfQ1RCX0hEUl9MRU4gaXMgMS4gVGhpcyBhbGlnbnMgd2l0aCBIMkcv
RzJIIENUQiBzcGVjaWZpY2F0aW9uDQo+ID4gd2hlcmUgYWxsIGNvbW1hbmQgZm9ybWF0cyBhcmUg
ZGVmaW5lZCBpbiB1bml0cyBvZiBkd29yZHMgc28gdGhhdCAnMScNCj4gPiBpcyBhIGR3b3JkLiBB
Y2NvcmRpbmdseSwgR1VDX0NUQl9NU0dfTUFYX0xFTiBpcyAyNTYtMSAoaS5lLiAyNTUNCj4gPiBk
d29yZHMpLiBIb3dldmVyLCBoMmdfd3JpdGUgd2FzIGluY29ycmVjdGx5IGFzc3VtaW5nIHRoYXQN
Cj4gPiBHVUNfQ1RCX01TR19NQVhfTEVOIHdhcyBpbiBieXRlcy4gRml4IHRoaXMuDQo+IA0KYWxh
bjpzbmlwDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfY3QuYyBi
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfY3QuYw0KPiA+IGluZGV4IDIyYmM5Y2U4NDZkYi4u
YWEwNGI1YzQ4MjJmIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNf
Y3QuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfY3QuYw0KPiA+IEBAIC00
MDEsMTkgKzQwMSwyMSBAQCBzdGF0aWMgaW50IGgyZ193cml0ZShzdHJ1Y3QgeGVfZ3VjX2N0ICpj
dCwgY29uc3QgdTMyICphY3Rpb24sIHUzMiBsZW4sDQo+ID4gIHsNCj4gPiAgCXN0cnVjdCB4ZV9k
ZXZpY2UgKnhlID0gY3RfdG9feGUoY3QpOw0KPiA+ICAJc3RydWN0IGd1Y19jdGIgKmgyZyA9ICZj
dC0+Y3Ricy5oMmc7DQo+ID4gLQl1MzIgY21kW0dVQ19DVEJfTVNHX01BWF9MRU4gLyBzaXplb2Yo
dTMyKV07DQo+ID4gLQl1MzIgY21kX2xlbiA9IGxlbiArIEdVQ19DVEJfSERSX0xFTjsNCj4gPiAt
CXUzMiBjbWRfaWR4ID0gMCwgaTsNCj4gPiArI2RlZmluZSBIMkdfQ1RfSEVBREVSUyAoR1VDX0NU
Ql9IRFJfTEVOICsgMSkgLyogb25lIERXIENUQiBoZWFkZXIgYW5kIG9uZSBEVyBIeEcgaGVhZGVy
ICovDQo+IA0KPiBIYXRlIHRvIG5pdCBwaWNrIGJ1dCBhZ2FpbiB0aGlzIHNob3VsZCBiZSBhYm92
ZSB0aGUgaDJnX3dyaXRlIHBlcg0KPiBmZWVkYmFjayBmcm9tIE9kZW4gb24gWGUgaW4gZ2VuZXJh
bC4NCj4gDQo+IE90aGVyd2lzZSBMR1RNLg0KPiANCj4gV2l0aCB0aGUgbml0IGFkZHJlc3NlZDoN
Cj4gDQo+IFJldmlld2VkLWJ5OiBNYXR0aGV3IEJyb3N0IDxtYXR0aGV3LmJyb3N0QGludGVsLmNv
bT4NCg0KVGhhbmtzIGZvciByZXZpZXdpbmcuIE15IGJhZCBvbiB0aGUgI2RlZmluZSAtIHlvdSBt
ZW50aW9uZWQgdGhhdCBiZWZvcmUuDQpXaWxsIGZpeCB0aGF0IG5vdy4NCi4uLmFsYW4NCg==
