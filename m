Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AFA728BE3
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 01:36:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C30B710E078;
	Thu,  8 Jun 2023 23:36:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E05E610E078;
 Thu,  8 Jun 2023 23:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686267389; x=1717803389;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=xuFm3SGCf7UJeYpEH3dByyjeAZy2XkIO3vjMMpEOF84=;
 b=YKBaxB1OcHU490u9mrW/q62IC24nMgQbyQ/6sitYgouxc3ae0UGfX2B5
 F0CSDaevT+cJzLPa/kY3DZvI34A2mqesVQZKyOFoIvvUBlGz45NL8GZAk
 zMHZNMgGEeYDgDq4Fo7Inxc1SQLQx65l6Nw0X948o20v9H9B9YRVpneVX
 jpaGR3O4TTvDlYT2axAz8u+It5R/k+0Fg3vLLWEw527vswqg0FVIGxHfN
 05Fj9Zd9cQzuI4TRLx6l3RgQVED8kfjTfqXlsMTYOPPJd7EKKQu4Hpm2X
 6lgAH3kFNuKojL4/aNQjZyCC+K3EdPyIAvdcmQVNJy/PVKBn/kOqJjrxu A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="359948447"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; d="scan'208";a="359948447"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 16:36:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="854543082"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; d="scan'208";a="854543082"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga001.fm.intel.com with ESMTP; 08 Jun 2023 16:36:28 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 8 Jun 2023 16:36:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 8 Jun 2023 16:36:27 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 8 Jun 2023 16:36:27 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 8 Jun 2023 16:36:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QWCwMiKXPNSa8pnhmpUqRTYPFJOOOE4BDikH4vQKSCsKAscjIWAKgal0jpZykEHV5OY3NhNkTQvE8NOkROpIAl5xS3s2t/BdXIggqmuoQJVaGihB2JEHDmIZmcd9GxcgR4ogqhSE+KA/qP4eXFINujoIu49xS6BOj1RSV+3J8/CMa2rpBd9ibkcXV2Lo3FiqujiF0BgqJm3yKCyzq4w+oA/2F47n4c76jE4uZo8ShOerbprVPPy8ZnU7gy8tIaXSNUIUfrPIIk3v4+4GjMWlR6zstWy2CVcIggoh90OzwWRRVvn5DX+wiYoXi5pIpfObYqPnw/HRXVBxg2watq6MJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xuFm3SGCf7UJeYpEH3dByyjeAZy2XkIO3vjMMpEOF84=;
 b=YIwh2s1Ms0Fa0FpiMm6ulVzbOVyWkvF/Yf1kLiUf31cFXH6qXvxzH1Czc8lZo2Iostx4SKyJSCzcxZ85YoSopSO4fMiN01BBs8dA3b50fL9KcUaNV096soQ/IQMu3Dcjkn17IBVjZs0/1Ow202oI3QcknIT0pB285VhHjW35pWOUT6084+raGQkKk5Jg6nk+o9YzNQAzP2jn5nmPeNE7010te0z96r6OBZAZZnPKDeLuLwkaGfAjrssJRQaBV5qDnyYq8bDjT9UZAzM0v3Bsa36YFcp6uUJ6xl96NKQ22urms+nI1D/roujVSv5BFvEf3bksq0y17+USxucdvHvTGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 SN7PR11MB6850.namprd11.prod.outlook.com (2603:10b6:806:2a2::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.39; Thu, 8 Jun 2023 23:36:26 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::749a:b0c8:4930:5a2]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::749a:b0c8:4930:5a2%6]) with mapi id 15.20.6477.016; Thu, 8 Jun 2023
 23:36:26 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2 3/5] drm/i915/mtl/gsc: query the GSC FW for its
 compatibility version
Thread-Topic: [PATCH v2 3/5] drm/i915/mtl/gsc: query the GSC FW for its
 compatibility version
Thread-Index: AQHZmB4EPyFc4VGi/UeBSnAStxyPfK+Bk9WA
Date: Thu, 8 Jun 2023 23:36:26 +0000
Message-ID: <fbe6c03fc5ef0117aed23904c04dedf5410b796e.camel@intel.com>
References: <20230606022402.2048235-1-daniele.ceraolospurio@intel.com>
 <20230606022402.2048235-4-daniele.ceraolospurio@intel.com>
In-Reply-To: <20230606022402.2048235-4-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|SN7PR11MB6850:EE_
x-ms-office365-filtering-correlation-id: 7c4cd5b2-a8e0-405c-32bb-08db68792d32
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: y7NCtK7+5+EOxHzK3eVev1ll8MAdPExn/SLCA2VTDve/WWZmTbGVobI78w9en3/PzTiBezDHvsBh//8dGFyUhwzdvB//Qn6DqaD+r+pI0SwNqCl+DXWHalNeVNtrYBDFyyaX29zd5nPq7WMLJvtzpnvvPlejBFxMS77zRjKHInu93g5gIa8/2ulGMDrc4A6rnd3ddm29N9ijlmQgKy7jmeSOfeSu2pLyNUAobuu/HOncgG6cD0q6ymo84rnUfM1NSsqxScP7yjwceKZ/3KAaUFFjAFA5i9zeHaIlGIHmPrYuXnSNiOJOyXssLj/ZvVE9UQxBeATb4ANNTW80nXFR1AjS1F+kbUrmIT0X8SXzBPlrN6QRlCwVp3Q5CaQ/IDCqQ2bp/fmBQ8NDUaN8ixLccosAhfgQXLL505U1dEtHIC5TojJSfPwQAMA+WBaFK64rsoRwE8ya8AvMLoHgZISXvx7Od4FnRd3ckM64yRKAhh31N/UQIuKNC2qosW+A5C9iOzKAZ7mxKowDFW7lRkM2gAy4CKkzJtr/Q2/pqDghZemlMG5JoO8Gf0kA17uADI2PGmApFPntTLD13LYWkbClRhiTBg6soxHzr6aZBMACjvZJ0tkS0gDATkw99avuiWS8
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(366004)(346002)(396003)(376002)(39860400002)(451199021)(107886003)(186003)(6506007)(26005)(6512007)(36756003)(86362001)(38070700005)(38100700002)(2616005)(82960400001)(122000001)(478600001)(4326008)(8676002)(8936002)(2906002)(450100002)(66476007)(66446008)(64756008)(76116006)(66946007)(66556008)(91956017)(4744005)(5660300002)(41300700001)(54906003)(110136005)(71200400001)(316002)(6486002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z3Y1OU5uV2lBdVBUaW1EeWdhOHEyNUl4bEJYR1h0a3M0MTFaQk11NWsvQURN?=
 =?utf-8?B?cUFyZXZLWkFKVU95UDMxL1B0NXNFaTQ3MDUrL2lDd255eHdxOHluVFlNRzVl?=
 =?utf-8?B?UlFmdDBRL3ArOEFTeitrYnFIeENLZU5La0liL2NhekQzYXg5bWdqdzJyS0xh?=
 =?utf-8?B?RWRRaU5WMG1rK1F5ZEpJNWg0YjhzakxGWml4T0xQanNhdFJ5WlBoRWZicGY1?=
 =?utf-8?B?WWhzT1lYK1hTUjFJZmFaVjJvcThmVGh1dEJCRUlkcktWNktxbGR4R3N5cGgw?=
 =?utf-8?B?cVY2VkpDL2NKSnBDNW54SzlRKzRabHN1Nll0aTV6cDByVDg0R1U4d00wQUJD?=
 =?utf-8?B?WGh2UExhZmQxLzNiSnEra0Z6NksxTXZ2Y2ZFMlBaYXRycEZWOENpQXJxQWtZ?=
 =?utf-8?B?RHRCbFJtc2lJY0VENTFiZlFLWSt1eTc1WlNJYnh1V21LdlJsZ2NDQk56UEZF?=
 =?utf-8?B?OUY1VTdZNnFWRldBQ3NDZjNLaERJdTIrSnlSKzZyNlR6WFkrVmhDSXRGcTYz?=
 =?utf-8?B?RkFaclNaNUErTjljcmJZTEpJSmx6RFpnMk9KUHJzYWc1TFVQUzYzVHJMdElt?=
 =?utf-8?B?Qi9XWTFyYk5saFFpd1V3cFZPTER5NkliTW1TRnVMV2F3aEtjbWsweDFGeHJq?=
 =?utf-8?B?QUFwSzNTc2dka3VNQ3A2bEF0RUl3clVJYkMwZWVYczY1UDYvNmNoTUdWbGVv?=
 =?utf-8?B?dnA2Z3ZwZDVOUGNpcEltcU5kU0NrNFhKYU53NlJYc2lZWVB3WnpRV0ZvdTM1?=
 =?utf-8?B?UFdudldIUlBhNm9BZWtrQWhNYis1Q0FaZFZyZ29JQVhNbEc4TFBWZ1ZHV2g3?=
 =?utf-8?B?R0wwV3dDQzJsMkY1d1NQZU1kdjdmL0VGaTd4TWxMaEU5SUdQdXJudGg5Y2xJ?=
 =?utf-8?B?UVZqK3N2WEEwd3A4bVVmQU9DVitxdjdGMzFERkNkYTZiWGU2MXB6UGhFNUxI?=
 =?utf-8?B?aXRERXFpZnVOMjExSkhiRWtWYWhuQjlkWnZKa1doV09Cc1RFdHRYY293VUda?=
 =?utf-8?B?bTFFRlR6K0RNcVh3MGVRenhBVmRmbU53Y2lOYld0eExRcVRpNnZwd2ZXbEha?=
 =?utf-8?B?anFsOGkwRVA5ZnpWMkFJdC9RSFFqZkMwZThLUGRWQ3A5ZVpWNnJrKzQxR2NJ?=
 =?utf-8?B?RlhOWTZNWjF6ZkVtaFFpMzBQei9iL1RlTW1LbkVhMTgwN2llRHg4YmdSZERC?=
 =?utf-8?B?Y1lveVJYTDh2SVZUazVRaGtGZWpOZVdiWDJWS25FVzJhcnhYMHp5T2VUOXlk?=
 =?utf-8?B?bnJUZStPVUd6VU1ucFpMM0szOUJQejJWYkNqbjEvbUlsUFJBTFZvSGRRMGNx?=
 =?utf-8?B?Vm9nY1lJWWwrVnJPRVkxZ0pEZVE1RDQ1VHZGbHdNQjRtUmwxdjgrQ05aMWZ1?=
 =?utf-8?B?MGt2QlAvVEh1ZDRwa1ZiQ29TRWVGOXlBRkFnc0NmREg3V20rdW9ZTnZ3VHpO?=
 =?utf-8?B?NFpZSXdRUnlxQkRiZFNLNUhlTktwVHpXSWJldVRxdUZIQzY1U0JaSTZvb3Uw?=
 =?utf-8?B?dnhCRnM4OGZiNTR4VklrRHNXbXFPT3ZjVTY3N2g1UDRoZk1UWHFUc1E5Qk9W?=
 =?utf-8?B?WVlWd2FJK0MreHhkdlg0S3puSkFvRkx4V1dkdW9mcnhKRDBSVlVWTDhrM3pE?=
 =?utf-8?B?cnl3TmxhaVZlREdUV2M3UGg4eWJKNFVYdkRXT0k0KzBhNVlUaHhWTktua0ZN?=
 =?utf-8?B?UC9jQkd1ZURRYUNnT1dVLzJYNkwrMnRXQVk5S1RBK3ZTOHdXK3lrQ25va05C?=
 =?utf-8?B?dm5WMzliRnllNzExWlNiNzJIVjhjN3N1Rm93Qm14bXl5bzRFS2RkQlY2c04y?=
 =?utf-8?B?WGliRWpCemVqNTBUWVNWb2toUW5TazZGMldXcmQ2TXpIeUVZYUZWTzAxNzhs?=
 =?utf-8?B?WXF1dWlxNEY5QjJCbzl1Um5HcDA0Wk1mL2pKbitRbjdBcXNGanBQUk5TaDFF?=
 =?utf-8?B?S2kwVUlpUUFaeEtsSXNRR0RuZlhmNVgyT3VhUTRuYVVEMVlwTERwaDNBRzZ4?=
 =?utf-8?B?SlR1UDRxWHVhQ3BhaWovbzVKSjh4eFM0M1Iwa1NUdlRrdURLdXpKU1RrbmNP?=
 =?utf-8?B?RWV1d3pMaFAvT1NxaS9NM0xxN0R3dGNINDRldWNNaStCWWxONy9EMGVmcFdR?=
 =?utf-8?B?NksvUnZWa1V2TFZ2a0tpcUR6OWs2Q1c4cE5VMGQ3amUyTlJRdEl4enVrVlhE?=
 =?utf-8?Q?5tt+KsCQ/JxXtZpz4lm5IYY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B43EC8C3C28074469B5DB6ABE71D8684@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c4cd5b2-a8e0-405c-32bb-08db68792d32
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2023 23:36:26.1132 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W0/9qe8iAO3hFWLi+kDrC7lB9mLbtFbgA20OjyPL5L8j6vs+rvTBL2FdiZyf+BOENlxeNoFVSr8+QNBJ39vPV80ESRB/AuwQ+0AqUabAsuBPKAEMBSabdp52O6cvsvin
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6850
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIzLTA2LTA1IGF0IDE5OjI0IC0wNzAwLCBDZXJhb2xvIFNwdXJpbywgRGFuaWVs
ZSB3cm90ZToNCj4gVGhlIGNvbXBhdGliaWxpdHkgdmVyc2lvbiBpcyBxdWVyaWVkIHZpYSBhbiBN
S0hJIGNvbW1hbmQuIFJpZ2h0IG5vdywgdGhlDQo+IG9ubHkgZXhpc3RpbmcgaW50ZXJmYWNlIGlz
IDEuMA0KPiBUaGlzIGlzIGJhc2ljYWxseSB0aGUgaW50ZXJmYWNlIHZlcnNpb24gZm9yIHRoZSBH
U0MgRlcsIHNvIHRoZSBwbGFuIGlzDQo+IHRvIHVzZSBpdCBhcyB0aGUgbWFpbiB0cmFja2VkIHZl
cnNpb24sIGluY2x1ZGluZyBmb3IgdGhlIGJpbmFyeSBuYW1pbmcNCj4gaW4gdGhlIGZldGNoIGNv
ZGUuDQo+IA0KPiB2MjogdXNlIGRlZmluZSBmb3IgdGhlIG9iamVjdCBzaXplIChBbGFuKQ0KPiAN
Cj4gQ2M6IEFsYW4gUHJldmluIDxhbGFuLnByZXZpbi50ZXJlcy5hbGV4aXNAaW50ZWwuY29tPg0K
PiBDYzogSm9obiBIYXJyaXNvbiA8Sm9obi5DLkhhcnJpc29uQEludGVsLmNvbT4NCj4gUmV2aWV3
ZWQtYnk6IEFsYW4gUHJldmluIDxhbGFuLnByZXZpbi50ZXJlcy5hbGV4aXNAaW50ZWwuY29tPiAj
djENCg0KDQpEaWZmJ2QgdjEgdnMgdjIgb2YgdGhpcyBwYXRjaCAtIGRpZmZlcmVuY2VzIGFyZSBn
b29kLiBTbyBteSBSJ0Igc3RpbGwgaG9sZHM6DQpSZXZpZXdlZC1ieTogQWxhbiBQcmV2aW4gPGFs
YW4ucHJldmluLnRlcmVzLmFsZXhpc0BpbnRlbC5jb20+DQoNCj4gLS0tDQoNCg==
