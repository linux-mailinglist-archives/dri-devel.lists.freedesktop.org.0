Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C56436E1E
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 01:16:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F7666E4E6;
	Thu, 21 Oct 2021 23:15:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEE3F6E200;
 Thu, 21 Oct 2021 23:15:52 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10144"; a="292639665"
X-IronPort-AV: E=Sophos;i="5.87,170,1631602800"; d="scan'208";a="292639665"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 16:13:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,170,1631602800"; d="scan'208";a="552991051"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP; 21 Oct 2021 16:13:23 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 21 Oct 2021 16:13:23 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 21 Oct 2021 16:13:23 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 21 Oct 2021 16:13:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NLuEgqsvqZGSxOvvj3vI+t+g4MsMDxXz4w6Fjut/A1GdZMElReDN+oL3gPzG4ThrWbRAAaOHiBRqrXDEMLU44tv0yWGHFwjmAcyOmQYwLVhKFRgThWMS/YZRI33b0meh289ADjQfAUdAsBUg3iTcwYkonhi8ezmrVyT30KX+P07x/8pXqZZTZWFhcjV8BFX7aEHGlyAmGAWIe0FbHUPEh0dOroBi+typo1WOIZbk68s8lPf9zHy7CwD4aFVAYDcXCI7zW7PdpVNXr1u4Q3fMeRxUD55TuKT5N2xRXJUhHn4PF+KkINeJWGifn+t7YTxX2aYv+JJovwjtPF87RrqZ/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mk+2YqfoclWtUozTfq0BZHIuZhlGPO73q1+AY65pQ1A=;
 b=Lp1Lt9kuCOnDLiYz1IigiJeU5UoTFeI5SSv19vL2X8oqDm7OPtpnjxDii7SJmlIGbhGBe5HhhgpGZVy2ogUD7LPA+irMj//XHpMxQw1UtgoqWVTnbZ9szjC44K0PdJV8bq7A3A9atH1QjAOFYdrhSo3sXMFLwoc8toOa/fvb22ITcFl7a31P6H9WYH3wNindjwpb0cCZjG9QSnZRjI6ZDBBlICboxBDi8T7+OtZgnsDoQH+AwLh3i3te+DyT2uy9HMS6v2jTGnlQGD9j1DjKc4bzStOubRKPNi32f5UD9u4rkpIi8EP+e11iBMKqF0msQjQ+76pHI3Vt18AHsfg2Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mk+2YqfoclWtUozTfq0BZHIuZhlGPO73q1+AY65pQ1A=;
 b=EplvYXT1nqNzFxwzHihvg9wWxtD7eLPBby1KiK/k4UsGXTf29J5JkEa0z9tpB8CZ+TFBt/UGtKVkIGzZdajaT/nYsgp3myq/bTU7PRSr76yzz+Bbrp/RpgLkEvC4joiVFCf7Roq4fv+7crEwKITUnNZMSVofMhj5QFh9oJHjiZw=
Received: from MW3PR11MB4620.namprd11.prod.outlook.com (2603:10b6:303:54::14)
 by MWHPR1101MB2349.namprd11.prod.outlook.com (2603:10b6:300:79::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Thu, 21 Oct
 2021 23:13:21 +0000
Received: from MW3PR11MB4620.namprd11.prod.outlook.com
 ([fe80::7d39:e768:f48d:5d20]) by MW3PR11MB4620.namprd11.prod.outlook.com
 ([fe80::7d39:e768:f48d:5d20%9]) with mapi id 15.20.4628.018; Thu, 21 Oct 2021
 23:13:21 +0000
From: "Almahallawy, Khaled" <khaled.almahallawy@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>
Subject: Re: [RFC PATCH 0/4] drm/dp: Use DP2.0 DPCD 248h updated
 register/field names for DP PHY CTS
Thread-Topic: [RFC PATCH 0/4] drm/dp: Use DP2.0 DPCD 248h updated
 register/field names for DP PHY CTS
Thread-Index: AQHXxjmKEvIhvrrfeEmTVY9BWxark6vdOI2AgADdiIA=
Date: Thu, 21 Oct 2021 23:13:21 +0000
Message-ID: <104136c2cecfc24c95552d15825b1b37ba053bf6.camel@intel.com>
References: <20211021050713.836498-1-khaled.almahallawy@intel.com>
 <8735ouofy0.fsf@intel.com>
In-Reply-To: <8735ouofy0.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cd798a1f-d3fc-4564-a04e-08d994e86042
x-ms-traffictypediagnostic: MWHPR1101MB2349:
x-microsoft-antispam-prvs: <MWHPR1101MB2349DC7C4C68071F0EBFB52289BF9@MWHPR1101MB2349.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vhV5rayJOC1lngK/GJk2m7+4Dpar07h+FE6vTa6nwNHMkZKFPTbXBT2IfYEPy3qu+KgyErh5MYwVTxZMSDmsAy75bLXKLpLow4B6y3SttMbSQOV6tIijCabuMiaBUKSvbpCaMUo6QdO5JdY7KfSEBOqlvomTlKU4wfLHJOAIJZ+RJ3E0Y1JkFq4oSCqsXoA0nliRPb6kZD36orFoJxs7RZv3sFya0BdmxlN7YnnTAQFcsiBfVJgUMAhgFFaEvZdmIgcnU56NgaSBemju0ZCYRNhg9Hprw63wvQrb+M6QY1A6QTjDpz6BmKbCUuWJUTb6BXq3181U8wpLzw3A/XkJPgRQT+aOJbZinFiywYWNWmTcUjCd0rdf2VnC2udKcik7CKiRARn/Y9N2ReZZBvj6uEXKJcfm6zLIuBj3tHITxIE1J6PdpwS8sz11IeYpKVbj3hee0REAkyT64uMg4b73RjCymdfgubuXqVahz5G9xtEya67znd3oBbT1JWNLH54qOm3UF+ClPYVdfJOw53WCVsCkxzpQOlxXeaBq2ICSN1aSJXY9WoAoIpN/DXQhR2BagXoP2UwmUu07xaVzWi4dnjZUyk3hxQMmAjI8G818eadJF+1mn+xmp4z8sBh3Vubv644cVKAfaSnA+jQ6kTBZYXcCneJC/tqswyHg4mh33D7DvveQsr+i75GqdrBZVXJ7eklv0kwzgARSU2cJfBYurC4+KV8aAFRc/R7oRZS2lXS+QxLreo/JQAPpo14uPPfyRdYnpNNmkFx+gp9zhv4863/zDYCMe/GYEuwNb1KQnpk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4620.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(83380400001)(6486002)(8936002)(122000001)(110136005)(38100700002)(508600001)(8676002)(6506007)(38070700005)(186003)(5660300002)(4001150100001)(82960400001)(66556008)(66476007)(66446008)(64756008)(76116006)(36756003)(66946007)(6512007)(86362001)(2906002)(19627235002)(316002)(2616005)(71200400001)(966005)(26005)(15650500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WGwxMlcyeTZhNGZTUVIvbXhqYTF1aEZlcC9pQ2Y5Ny9VWVJzUjd6bFlFV0pU?=
 =?utf-8?B?RmRybGlHeE1BcUl3aSsydjM2c29wVngwR0xuR3YyaU1mSW9TS1Bxb2kwYUVw?=
 =?utf-8?B?MXdseEx4R25yT21FTGwyd0I1S2dqTTg1NjZ3amE0cHBlbUJOQVRITXI2TEVn?=
 =?utf-8?B?cDZKSmhZQStWWTdldmU5Nm12cmMwWnA1YXdUc09YZmNyUjBQMDR2aGVLdDlT?=
 =?utf-8?B?WitQZVdFd3Fla2crcSt6ckdFbzYrb3JuNi9ZbDdIVkVBUnhMMnZHbzlKRzJJ?=
 =?utf-8?B?ZEVPUTRoYlIrNm1GdDJOd0tnbXI2STRYS3NQcHU5djhxbExhWVhSUFR0VWRC?=
 =?utf-8?B?SnpIZU9VR1J3dFpuS0F5K2MveEo4RkZ4K0RTRHlwNWVhTHFMR25lakw5SXRE?=
 =?utf-8?B?blJtZzNPWDd0K3N3ZUx5SVI0RFJqU0JtVS9XVCsveHBsVU1DSGpMdnpQMXpX?=
 =?utf-8?B?RXI3aU5aOHN6VVJWVmlFeTRmeEN0VWJ4aEFHNlgwUEZqOFJsV0l0cTNlZzRS?=
 =?utf-8?B?emxua05IRk1CK3RMYjc1UjVVaTg4dGlzci9td2NLUisrOVI1UjlNdFVEYXNL?=
 =?utf-8?B?RTRsTUFTNVZzZndUQW1ZN3JHU3MvQ3RNNi9RdTIrS2ttMWFrY3RjRkxMQjg1?=
 =?utf-8?B?OW5TdzVqY1htTG8wQTBCZmRwZ1pocFllNENiRlpEQXVPQ3o5U2h2NFY0dmNm?=
 =?utf-8?B?U09VUzFBWmEzaFVBNnRNYzM4eWdmYnJPWXJOcTRVU0QwUHNPc3ExaHV2RUpG?=
 =?utf-8?B?QzBiUndVeGxQcnBuZVdDQjgrSytFUzE4V2d2R2FrZ1pYK2JMNWNaZmNZb2lS?=
 =?utf-8?B?V0EwVDdkK2dWT3BkWGJXc3I2cnN0dXZKTmVaTGsrSzdZbkJtYnNhZUVBdUl6?=
 =?utf-8?B?eVh6NXNKUWNPeEhVTnROUytRcUM5MHRWamVvd2IweG5RVVhhaWpjbGVkVXA0?=
 =?utf-8?B?REVYTUhJZDVaS2hCam5MTUx0V1ZMWm51WXhtaCtieTNEM3QvVUpxek1NZG9T?=
 =?utf-8?B?YzNoQlVqcEJmcUM2dnNhdEx6TW9Kd2pZRGxQUEtvdGRjL1AwS0FSUTJ4ZlZS?=
 =?utf-8?B?Ukt1WGUvRW1WVFgzNEczTXRNM1ZUdW5oNVk5bjhqdDQ3WjF0b1JJRGRPdGNF?=
 =?utf-8?B?Q21XK3dtWDVoVDd4Z1NzUURZYUxveDlZYjJZNE1yMEY5M0hITW9sVEZhS0VW?=
 =?utf-8?B?NXNtQUpDeDZiWWViYTVBUTJYVFRpdDJQcFdWTHBrTmcycjh5MEFNUFVIVTdp?=
 =?utf-8?B?c05ubmdPQ1dYcHBMSGxaM1FxUzA5SFgwUkF1M2lmekhrNnhtbDI2OU1zd2gv?=
 =?utf-8?B?Wnl6c0FOVFBITFlLd3hiVzhTNTc1SjR1Y3FXaUF5cVRjWWJIUnZ2ZC9QaElu?=
 =?utf-8?B?aUZKNDlCWVpSbVhnNEJvOWFYSzR1THdDVkpibjMxZzFaUHBOdFpIL0tseWt6?=
 =?utf-8?B?K0NvUU40NnlkWnE4OG9oSTV4VFBiNThlL3VDNkwyQUoybUV3Q0Q1clNqNmx3?=
 =?utf-8?B?U3QwNnRFeFU2MTJLay9LYk5LWExXZFJIWjZ6ZkRHSjhENHV2QXNHNUdvQWh0?=
 =?utf-8?B?UjQ5OUdyaG9MWXNPTmxjM21mNkZRa3pFaE9GWWJHeTJDRjNna2ZLQ0pJbjYx?=
 =?utf-8?B?WjVvTkwwQys5V2dxbFdLeFJSbHVVQU1nbGVaQnRlVFIrWGs1aHIycHkrWHcr?=
 =?utf-8?B?akdNVTB1UVFNdHNLZVNIcnVBOGlzY2pqaFlwZ09sK284MXo5Y2svK01ucGxN?=
 =?utf-8?B?ejBPZGhYOW9ZWEJSa202enJ5ZW5SUnNmT1loUWJ0ZGYxa1F4WmlXQ2NrUkx3?=
 =?utf-8?B?U1lPYUI2Q2l4ZnFiSGNCUmc3RkgzN1BDWEYxZjUrK2NWK2RhYTQ4TXZZbXdJ?=
 =?utf-8?B?YlYxVWxVRU11NnFoNVJ6dlkva0ttWmY1NGhqRnJrVjZ0UGdQL0IzbHEyelFB?=
 =?utf-8?B?RE9Qb2JNcXpmMWxXRGVxOUlzeE5ieTdrZm56N2FWYVdrblE3RE5lNi9peVE3?=
 =?utf-8?B?a3NCY3hLSEJBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A1BCE2C2121F3E429BE949C3F5017505@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4620.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd798a1f-d3fc-4564-a04e-08d994e86042
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2021 23:13:21.7679 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: khaled.almahallawy@intel.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2349
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

T24gVGh1LCAyMDIxLTEwLTIxIGF0IDEzOjAwICswMzAwLCBKYW5pIE5pa3VsYSB3cm90ZToNCj4g
T24gV2VkLCAyMCBPY3QgMjAyMSwgS2hhbGVkIEFsbWFoYWxsYXd5IDxraGFsZWQuYWxtYWhhbGxh
d3lAaW50ZWwuY29tDQo+ID4gd3JvdGU6DQo+ID4gVGhpcyBzZXJpZXMgdXBkYXRlcyBEUENEIDI0
OGggcmVnaXN0ZXIgbmFtZSBhbmQgUEhZIHRlc3QgcGF0dGVybnMNCj4gPiBuYW1lcyB0byBmb2xs
b3cgRFAgMi4wIFNwZWNzLg0KPiA+IEFsc28gdXBkYXRlcyB0aGUgRFAgUEhZIENUUyBjb2RlcyBv
ZiB0aGUgYWZmZWN0ZWQgZHJpdmVycyAoaTkxNSwNCj4gPiBhbWQsIG1zbSkNCj4gPiBObyBmdW5j
dGlvbmFsIGNoYW5nZXMgZXhwZWN0ZWQuDQo+ID4gIA0KPiA+IFJlZmVyZW5jZTog4oCcRFBDRCAy
NDhoLzEwQmgvMTBDaC8xMERoLzEwRWggTmFtZS9EZXNjcmlwdGlvbg0KPiA+IENvbnNpc3RlbmN5
4oCdDQo+ID4gaHR0cHM6Ly9ncm91cHMudmVzYS5vcmcvd2cvQWxsTWVtL2RvY3VtZW50Q29tbWVu
dC8yNzM4DQo+IA0KPiBZb3UgY2FuJ3QgZG8gcmVuYW1lcyBsaWtlIHRoaXMgcGllY2UgYnkgcGll
Y2UuIEV2ZXJ5IGNvbW1pdCBtdXN0DQo+IGJ1aWxkLg0KDQpOb3RlZCwgSSBhcG9sb2dpemUgZm9y
IG1lc3NpbmcgdGhhdCB1cC4NCiANCkkgd2lsbCBzZW5kIHYyIHRvIG1ha2Ugc3VyZSBhbGwgcmVu
YW1lcyBvZiBEUF9QSFlfVEVTVF9QQVRURVJODQpkb25lIGluIG9uZSBwYXRjaCB3aXRoIHRoZSBv
dGhlciBjaGFuZ2VzIHlvdSByZXF1ZXN0ZWQuDQoNClRoYW5rIHlvdSBmb3IgeW91ciByZXZpZXcN
CktoYWxlZA0KDQo+IA0KPiBJbmNpZGVudGFsbHksIHRoaXMgaXMgb25lIG9mIHRoZSByZWFzb25z
IHdlIG9mdGVuIGRvbid0IGJvdGhlciB3aXRoDQo+IHJlbmFtZXMgdG8gZm9sbG93IHNwZWMgY2hh
bmdlcywgYnV0IHJhdGhlciBzdGljayB0byB0aGUgb3JpZ2luYWwNCj4gbmFtZXMuDQo+IA0KPiBI
b3dldmVyLCBpbiB0aGlzIGNhc2UgeW91IGNvdWxkIHN3aXRjaCBhbGwgZHJpdmVycyB0byB0aGUg
ZGlmZmVyZW50DQo+IHRlc3QNCj4gcGF0dGVybiBtYWNyb3MgcGllY2UgYnkgcGllY2UsIGFzIHRo
ZXkncmUgYWxyZWFkeSB0aGVyZS4NCj4gDQo+IA0KPiBCUiwNCj4gSmFuaS4NCj4gDQo+IA0KPiA+
IEtoYWxlZCBBbG1haGFsbGF3eSAoNCk6DQo+ID4gICBkcm0vZHA6IFJlbmFtZSBEUENEIDI0OGgg
YWNjb3JkaW5nIHRvIERQIDIuMCBzcGVjcw0KPiA+ICAgZHJtL2k5MTUvZHA6IFVzZSBEUCAyLjAg
TElOS19RVUFMX1BBVFRFUk5fKiBQaHkgdGVzdCBwYXR0ZXJuDQo+ID4gICAgIGRlZmluaXRpb25z
DQo+ID4gICBkcm0vYW1kL2RjOiBVc2UgRFBDRCAyNDhoIERQIDIuMCBuZXcgbmFtZQ0KPiA+ICAg
ZHJtL21zbS9kcDogVXNlIERQQ0QgMjQ4aCBEUCAyLjAgbmV3IG5hbWVzL2RlZmluaXRpb25zDQo+
ID4gDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtfZHAu
YyB8ICAyICstDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMgICAgICAgICAg
ICAgICAgICB8ICA2ICsrKy0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2RwLmMgICAgICAgICAgfCAxMiArKysrKystLS0tLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJt
L21zbS9kcC9kcF9jYXRhbG9nLmMgICAgICAgICAgICAgIHwgMTIgKysrKysrLS0tLS0tDQo+ID4g
IGRyaXZlcnMvZ3B1L2RybS9tc20vZHAvZHBfY3RybC5jICAgICAgICAgICAgICAgICB8IDEyICsr
KysrKy0tLS0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2RwL2RwX2xpbmsuYyAgICAgICAg
ICAgICAgICAgfCAxNiArKysrKysrKy0tDQo+ID4gLS0tLS0tDQo+ID4gIGluY2x1ZGUvZHJtL2Ry
bV9kcF9oZWxwZXIuaCAgICAgICAgICAgICAgICAgICAgICB8IDEzICsrKy0tLS0tLS0tLQ0KPiA+
IC0NCj4gPiAgNyBmaWxlcyBjaGFuZ2VkLCAzMyBpbnNlcnRpb25zKCspLCA0MCBkZWxldGlvbnMo
LSkNCg==
