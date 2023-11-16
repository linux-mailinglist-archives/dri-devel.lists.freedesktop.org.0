Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D747EE9F9
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 00:28:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42BFC10E70D;
	Thu, 16 Nov 2023 23:28:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0F0C10E040;
 Thu, 16 Nov 2023 23:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700177322; x=1731713322;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Ii3XOy3OXGn5OiFhck+DJ+RA/uxPTZp+nJA2MsKfXyk=;
 b=eprwWM8WRjjY5qMZ1xwr95/1WSc3tWZi61I9SyRXYU7QD7e3lU5fJWYP
 CSmYeahMmi9B2AH6bp9BjilWM9+CGB3ujb1yMjcpnxjQqcgJdmSME0t8Y
 Tbb0k9MzdNQjm5tgtthFyPTKCes/P8bGBhL0FUtyzFW1xq2rPDi/ZRrvw
 a777JQun7kX3FBcfebBZg6/SyCWqnNI96E1e2Rd90j/Tbwx6rp+tJBTno
 sVfmH61+/6oDVhlPxTTrSZNfxVxSkQ94CmBks9X/MCmj4ghGsRpAm987q
 PMWsIidRTseIwONCX+wlL4gOSB5fYxQOQ31cYkSLyU950pp+kS5NveaB2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="376251275"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; d="scan'208";a="376251275"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 15:28:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="1096933141"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; d="scan'208";a="1096933141"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Nov 2023 15:28:41 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 15:28:40 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 16 Nov 2023 15:28:40 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 16 Nov 2023 15:28:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fh4yyp+xxQy8co/tcIRyiZd0+8o0mFbkAtoqd7GRmL9CwA0rbXuExokPblQI0lmLB7LRIoMWzYVX0T8i1e8OYOvfnAYrk/jT/XgiHNQ3rJHaSRvVSBoaHf3WnlLBttcvQKX7GrYecXvSEdnCq56cZkUB+QVPftuY218kF/i9kN/MQmfq94uNAIoZFlS9yvaGXNZ+YSESSsOBsuSU/rrqYP5NY4mjsgx44Q8qrCgeaGyhcB+G4vBKpv5OUEwIWQm2ZXvUjs6/Q/3M7kkN9VCqyyjxfO7UXJFtC3kwgZeo3sxHdjTxfgGOKJP7W1ltZqjsZx0qL8bI+Feutf02QnPIRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ii3XOy3OXGn5OiFhck+DJ+RA/uxPTZp+nJA2MsKfXyk=;
 b=fI/U+9E6j0KetOJott8yp9R1g/TWCVrriCNMKEapZD7t470C8jK9pMWTCchRsd5qk41vG27PORGAApmjZS7W1wd7+t6z097YYlcm9iza9UpUxEsoqClT2ZHRc8Rt0wP+qM7MQa7MS6fd8kiiwJsXKJtADQpJH1i5ScBpUbGTz9UTQxcAkmL7PP9oPrMQzex+RgEnbpdleVNsuDPi/Z9QzbSs1qaFt+28A6H6lM5Bbm9doh2apN6NU0zuzwPACL2dqIeFLFN4BUfOue0bt0HuCY2YSdUOBySD/BS3skFfZoXl0qGNf9BdgM0XYK24GAWC4N4gJorvOVvtNezin5U6fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN0PR11MB5758.namprd11.prod.outlook.com (2603:10b6:408:166::18)
 by SJ2PR11MB8497.namprd11.prod.outlook.com (2603:10b6:a03:57b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Thu, 16 Nov
 2023 23:28:38 +0000
Received: from BN0PR11MB5758.namprd11.prod.outlook.com
 ([fe80::f83:5f23:404f:a87c]) by BN0PR11MB5758.namprd11.prod.outlook.com
 ([fe80::f83:5f23:404f:a87c%7]) with mapi id 15.20.7002.021; Thu, 16 Nov 2023
 23:28:38 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v1 1/1] drm/i915/pxp: Bail early in pxp tee backend on
 first teardown error
Thread-Topic: [PATCH v1 1/1] drm/i915/pxp: Bail early in pxp tee backend on
 first teardown error
Thread-Index: AQHaGOOM17iiUYJRjkGbE4e+kNVzV7B9l3YA
Date: Thu, 16 Nov 2023 23:28:37 +0000
Message-ID: <2f53a52f62801810695c6e6ec1f3f409ed1f1c1b.camel@intel.com>
References: <20231116232041.25534-1-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20231116232041.25534-1-alan.previn.teres.alexis@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.50.0-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR11MB5758:EE_|SJ2PR11MB8497:EE_
x-ms-office365-filtering-correlation-id: c80d546c-e130-41f7-a4da-08dbe6fbc2ad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ud0s8IYYaYr0Kq/piEFFEZxnzG8alKULwEDALeSY7HR2Ce4JI3p2L81wEr5rcJaHlQMslT4zosQCxwHHWN7rUMxXHxw0k4F/+EVXPU7w69Kfequ7GcVg9/+pWjqQ6G9rV422jwmaWF/5AFO9Sf59DDiCWaA2KGNSYgCGVN34xG+VEl1oVNhlcO4TgdlSv6kgIXIB/ToNJKylB1sdFxRVO2VLS/9+UtFvTLN4llZp08QXdolNvV9ainvYiGyM2kC5K/4wU3DVVIPtb1G2wG/wilLQhdhTfs1UmxoO3A7fAfo/Ye0XNjySXl5fNxAT8QvcdGbf4UCA8WleJrMdXrwLrjmPMnVl/rPrg/G3IhL9k6t0NohtnWUI/PMLjsVThSsAjr684uQaCk4o7Ey0+P9LXKvIYaQ4cdWE47gRCJNlwFmaukQcAv64pI7yuhgd6tf7Xoa3kUO1IzLiceLSe8iiFZkOmUeGdsaNOB1GSKbvDAUR+PKod58zfXEuIReq9xHTU6vVbB61gQg/Ivz1HM80Lxr3wIOr/NqXxVb2ROYTaeMO+bPq0qZvU8UOUJW/IBB8LcdlDqge1ENL+Dv+/hggHVGcM0aZmATvWXro7xamEKjrPSQKnUeTsZicmwE/3wO/
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5758.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(39860400002)(346002)(366004)(376002)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(478600001)(6486002)(6512007)(122000001)(36756003)(71200400001)(38100700002)(6506007)(64756008)(316002)(107886003)(66556008)(6916009)(2616005)(83380400001)(54906003)(66446008)(82960400001)(76116006)(26005)(66476007)(66946007)(91956017)(5660300002)(4326008)(8676002)(8936002)(86362001)(2906002)(4001150100001)(38070700009)(66899024)(41300700001)(450100002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TkVCanBUNFpscVNIRWVCUkhqMjZNMUczTkt6c09OWmdUWVQ0WUV2WnZOb1FD?=
 =?utf-8?B?QndNdEczTnhqNk1aUWI1NGdqYjZjSmJwYnZZWXQ3TU1OZmNRbFROejl2MWF4?=
 =?utf-8?B?ZUZ1QTFCclR5ckpsbTBnODI3cEg3c2UzQk1TNWtaR0xUVkZZOVptZWpoRGhD?=
 =?utf-8?B?elNmUkYwNFBKaDZ2alUyYkZ1SEZKdVE5ZjhrMG4zcXJjT1ZUR2NwK1VQSitY?=
 =?utf-8?B?VkMzQ2NXR2VHa21QdnJ6c09VQ3hxY1lCYlhrZE5mbmtLay9ZTFJZcUVaWS8y?=
 =?utf-8?B?ZzVPQ2g4ell0NFJ5VmtEdXpVeURsUldscFFaN3pETktMTWZIak5RSTcwZGdL?=
 =?utf-8?B?Vm1nMVZzRXJhN0hIOXY5dE9TZjFCc1V6ZU8rd0ZMRWFIV3daVG9MVXNHV0l6?=
 =?utf-8?B?d0EvMkhVcnZXMys5aVlDaVg3c1BSNTkyeHJQa0ZRc1BBZ0RQYVdsMmJPMTRN?=
 =?utf-8?B?SzBad0RaeVRUSnNHeEQyL2JHRHhjTTNTTDRwdXVZT20xV1pWWEVsM09yZFJS?=
 =?utf-8?B?ZG54ZnNYYU1nRVlkcGg3OWh0eEpEdExvL2kzL2llaUdGdkIzU0YweVJWZGJP?=
 =?utf-8?B?c0hUbzJDbXdISjY1K3B3ZFVoYUF3K1FFWERReHd3RnFFNS8ya3ZQazVMdlNN?=
 =?utf-8?B?d1VrZUhhNGFTcUZWR0JTSW8rQUJhOXViZ1gxU05ZdU9zVS9oT2lKMG5oY1Z2?=
 =?utf-8?B?aCtJWEFwU1pwems2SFhaVmt5TFNtN1pFSTZWOW1OLzhWMVlPNmJZZlo2R0tB?=
 =?utf-8?B?OFI1L2xPaHlHcjJIYTd2MEdOVlVpMXNqTUlES0JpWklRSzJDM0R5WVF1ZVRB?=
 =?utf-8?B?RTBDSE1URHB6R2FDbGM5emJpb1M0a293TFVhZUcyczN1Znd1cVJoblcvcTFF?=
 =?utf-8?B?NnZSU0xkaWpiVk5NaHFSS2krTHIxVlN5RGtKTmgySURsRGJGMkNCbXp0cjlu?=
 =?utf-8?B?QmJjcjhnVGM1aFBNYlRHWmpUWE5OaUlCNFpLL1ltU09HWEVUemdXYW1DdTNx?=
 =?utf-8?B?cG9xbkcrdGhCVHlyRVZqUnUyM2txWllrMGlRVkNUeUhlN3dLdzV1ZmEwM3pT?=
 =?utf-8?B?WGpoM21uOUlCeWxkN3BMMGovT1lDZmZoRXJ1aTNHQkpvZDYwOE9PejMyTCs1?=
 =?utf-8?B?V0x5bGRaejh1QzRvbHNnVUhxS0haN3I0R3dpOEFOcUY3UVNUamRmelZ3Q3FM?=
 =?utf-8?B?aVZsWUg5SVhVVlpZbmYwWEU2SE04blptU0tWL1ovR2NhdllYNENHYXpYOWtp?=
 =?utf-8?B?MEY0MW4rR0xiNytMZ0xUUGRka0RaOEdLRm5ON3o2ZFZ1UG1Td0lTbmtDZ0JF?=
 =?utf-8?B?a2xqNW5tUlF0MTM4L01EakZQeHFvNHVXOGFSTUdUSkZFSzFJTFNQZ0hzSGlB?=
 =?utf-8?B?aEllMElWOWRUdllObWFzVDRLRElXaGwwbVFyMGdhRTJId1NJT3Ivd2ZvR3ZZ?=
 =?utf-8?B?eHhUZWNuYUZVaXZvTmljeGFMcHViZjc3TFRZcjFMZUh5VS8rUTBXL05qdllU?=
 =?utf-8?B?emhlMk03V3l0VG13Z2hzOHIxZTdnRDFwL1BnT1dEUThZSFhZZ2NXUWg5aXZ1?=
 =?utf-8?B?di9QVHArUm40TGtHckNzQU1wVmtzaTNhTWd5Zk44aXMzTzNIWS8xS2IwSUkz?=
 =?utf-8?B?cWlvWld3ZWxtRmJudjZTWk9ZTm5JaGh1bmw4Mi8xNlZFV3FqTzc3V2RDOHVZ?=
 =?utf-8?B?cGNuZkdSTklBeU5wRDZ3MXJDdnFxVEFDY0VMUzhLSDg4V2VhcmZyd05wemI4?=
 =?utf-8?B?cEZXRFg1aTdYT2tsWlJnNE5YS3Y4OCtTNi9PZDJVeUZoYVZ1Y1oxcXR3T0FD?=
 =?utf-8?B?VmVtVFozczJaaG56RDZOejA1YytGUHB5QzlQQUorZ28wVnEzdnl5cVVtV1V0?=
 =?utf-8?B?aEdpS3pPc2NRTHZxUVpKQ2pLUHpjUG9xZ3FMbmZ0OE1TQWZKVDN4WFcwR0RV?=
 =?utf-8?B?OGVid1A1ak53VElJYk56akoxZmhtYndCTXh4U2p2OVNTRDRWdW9lblVScWRy?=
 =?utf-8?B?NnFQUW5IRmhyZVhmS1lvZzhOQTJTci9XcXg2cWFwOVVuNytOOWRreFBXbUJ0?=
 =?utf-8?B?VkRqNG53eTNESkxPeHdiWjRoVml3bHZSL00xVEEweHp0enF6dVlNdlozbGFL?=
 =?utf-8?B?OGdwUTZoYk16eVB1bW5NRVdrd2g4TmVDSHFGS05Mb2xUak5MWlBCMmFlT2VZ?=
 =?utf-8?Q?ly+TwmhdC1tU2W3Sm6uMwg8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DF183005FDFC204B9603A4B57ABAF9A7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5758.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c80d546c-e130-41f7-a4da-08dbe6fbc2ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2023 23:28:38.0080 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NgcPzIr9kRCDM4T3vSjY/v06m0aH5yshWFeweAWJSd+RHyYu3kwsM14HqWMlwrVmVq+ba3/4yHBcHf70vYQKE5PPA1hEf6MoGguj+Gav0zD3WkfuusgQajPvMrulJs9r
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8497
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
Cc: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTExLTE2IGF0IDE1OjIwIC0wODAwLCBUZXJlcyBBbGV4aXMsIEFsYW4gUHJl
dmluIHdyb3RlOg0KPiBGb3IgR2VuMTIgd2hlbiB1c2luZyBtZWktcHhwIHRlZSBiYWNrZW5kIHRy
YW5wb3J0LCBpZiB3ZSBhcmUgY29taW5nDQo+IHVwIGZyb20gYSBjb2xkIGJvb3Qgb3IgZnJvbSBh
IHJlc3VtZSAobm90IHJ1bnRpbWUgcmVzdW1lKSwgd2UgY2FuDQo+IG9wdGlvbmFsbHkgcXVpY2tl
biB0aGUgdmVyeSBmaXJzdCBzZXNzaW9uIGNsZWFudXAgdGhhdCB3b3VsZCBvY2N1cg0KPiBhcyBw
YXJ0IG9mIHN0YXJ0aW5nIHVwIGEgZGVmYXVsdCBQWFAgc2Vzc2lvbi4gVHlwaWNhbGx5IGEgY2xl
YW51cA0KPiBmcm9tIGEgY29sZC1zdGFydCBpcyBleHBlY3RlZCB0byBiZSBxdWljayBzbyB3ZSBj
YW4gdXNlIGEgc2hvcnRlcg0KPiB0aW1lb3V0IGFuZCBza2lwIHJldHJpZXMgKHdoZW4gZ2V0dGlu
ZyBub24tc3VjY2VzcyBvbiBjYWxsaW5nDQo+IGJhY2tlbmQgdHJhbnNwb3J0IGZvciBpbnRlbF9w
eHBfdGVlX2VuZF9hcmJfZndfc2Vzc2lvbikuDQphbGFuOnNuaXANCg0KPiBAQCAtMzg3LDEwICsz
ODksMTQgQEAgdm9pZCBpbnRlbF9weHBfdGVlX2VuZF9hcmJfZndfc2Vzc2lvbihzdHJ1Y3QgaW50
ZWxfcHhwICpweHAsIHUzMiBzZXNzaW9uX2lkKQ0KPiAgCXJldCA9IGludGVsX3B4cF90ZWVfaW9f
bWVzc2FnZShweHAsDQo+ICAJCQkJICAgICAgICZtc2dfaW4sIHNpemVvZihtc2dfaW4pLA0KPiAg
CQkJCSAgICAgICAmbXNnX291dCwgc2l6ZW9mKG1zZ19vdXQpLA0KPiAtCQkJCSAgICAgICBOVUxM
KTsNCj4gKwkJCQkgICAgICAgTlVMTCwgcHhwLT5od19zdGF0ZV9jb2xkc3RhcnQgPw0KPiArCQkJ
CSAgICAgICBQWFBfVFJBTlNQT1JUX1RJTUVPVVRfRkFTVF9NUyA6IFBYUF9UUkFOU1BPUlRfVElN
RU9VVF9NUyk7DQo+ICANCj4gLQkvKiBDbGVhbnVwIGNvaGVyZW5jeSBiZXR3ZWVuIEdUIGFuZCBG
aXJtd2FyZSBpcyBjcml0aWNhbCwgc28gdHJ5IGFnYWluIGlmIGl0IGZhaWxzICovDQo+IC0JaWYg
KChyZXQgfHwgbXNnX291dC5oZWFkZXIuc3RhdHVzICE9IDB4MCkgJiYgKyt0cmlhbHMgPCAzKQ0K
PiArCS8qDQo+ICsJICogQ2xlYW51cCBjb2hlcmVuY3kgYmV0d2VlbiBHVCBhbmQgRmlybXdhcmUg
aXMgY3JpdGljYWwsIHNvIHRyeSBhZ2FpbiBpZiBpdA0KPiArCSAqIGZhaWxzLCB1bmxlc3Mgd2Ug
YXJlIHBlcmZvcm1pbmcgYSBjb2xkLXN0YXJ0IHJlc2V0DQo+ICsJICovDQo+ICsJaWYgKChyZXQg
fHwgbXNnX291dC5oZWFkZXIuc3RhdHVzICE9IDB4MCkgJiYgIXB4cC0+aHdfc3RhdGVfY29sZHN0
YXJ0ICYmICArK3RyaWFscyA8IDMpDQphbGFuOiBUYWtlIG5vdGUgSSBhbSB3b3JraW5nIG9mZmxp
bmUgd2l0aCBzaXN0ZXIgdGVhbXMgdG8gcGVyZm9ybSBzb21lIGVuZCB0bw0KZW5kIGNvbmZvcm1h
bmNlIHRlc3Rpbmcgd2l0aCBtb3JlIGNvbXByZWhlbnNpdmUgT1Mgc3RhY2tzIGJlZm9yZSB3ZSBj
YW4gdmVyaWZ5DQp0aGF0IHRoaXMgb3B0aW1pemF0aW9uIGRvZXNudCBicmVhayBhbnkgZXhpc3Rp
bmcgdXNlLWNhc2VzLg0K
