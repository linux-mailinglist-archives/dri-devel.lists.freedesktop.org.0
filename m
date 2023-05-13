Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F17570138B
	for <lists+dri-devel@lfdr.de>; Sat, 13 May 2023 02:52:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5E5610E6F5;
	Sat, 13 May 2023 00:52:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81F8410E081;
 Sat, 13 May 2023 00:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683939122; x=1715475122;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=06U2yaFoC9+rIjKDVkUGEnHBQ9WqoCFfS7GI6Z9BUQc=;
 b=fdidGBbw0PkwB7tBacD6wb97hgsXHZX3jgXIwhvx8lymuNk12U23N6xl
 gOPhvYKerER5cDSyEoRBL7EnRaTM/uIff4tf8glYldKP8MlMOfjUkrigu
 a+yDBmM9XFWqn492PVvnFzq9+Y20uDrJP59Ses9sjvQUxOIG9Sb9Pben5
 W/ZHx1LJ75e5YDsTN1jmG6SZ5XlMccbE1igiY0gGaSMiZnUZ6OQiLdQlo
 kPIRzHrimcwIMKOGpKnJtG2jRNFJ/f0gtG2oEXlHLuA5n8DFx/RmAUm6r
 4ZLlC6Yr0xluOUzWSwkitjjccMGu1+vQVnwvb8WHCwr7qu7zpLM+6QYza Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="331276094"
X-IronPort-AV: E=Sophos;i="5.99,271,1677571200"; d="scan'208";a="331276094"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 17:52:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="844611887"
X-IronPort-AV: E=Sophos;i="5.99,271,1677571200"; d="scan'208";a="844611887"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP; 12 May 2023 17:52:02 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 12 May 2023 17:52:02 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 12 May 2023 17:52:01 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 12 May 2023 17:52:01 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 12 May 2023 17:52:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=keYXa4JN7rTBq0cu5kcK9GhtN4ATpbRv3LQ9Zt4fHYZN6CaO72lt5r+p5aO2vh8fLygJvJVU79Oz03NoLmwVM4knar3fSlZlpi/v6otwuqKvo7ZKlRM0F888xSZ8OuHO9d24MsUNap10fUyzycjHBisY7ha/UIJ7lSfuqLMtPpYBt3GQOQvfavLrlH83fbU1WxCQdAeEFCi5gqw3B5CE1Z/gK1/gl2tGZf++ZuJrmEKx+7aobCqHR3sqj0bwIX/v70lwMRCHGl/9bylW5Fr2mIGhxmtMN2n3nEedEIfnqar+xRD4M9BKBjcFiSrAADJQPE9WwT5oGDgZzNNpo1GL4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=06U2yaFoC9+rIjKDVkUGEnHBQ9WqoCFfS7GI6Z9BUQc=;
 b=fEo8P1jDWQvdb2b4LixsqJup/9n22Y9FpacRAYdaLq2747ToruPRZVI26J1zxz/J7D0As2RCSiSML+vzTOVlNR844TV6JWEm3wRtwDX1F0vj19keeiDCKjTL54ey8q+BOxZOVH7uuj01aezLc3eJlR/WEoh1VOSaeOdPuzGVGr6hM+hYB+AVRorl4ClAF1ZwpFMF1j2yBL7GYczxDz+4u3VVs3zPonQHD/vYtvCrKx6+pBqAKuB1EKLDcN+YA81u3DF8WJr2cNXduk6/hS4+pvEuMUHsQ7+d+mZr0/Ycf1JAEw1aqjftVWrrm9VjwFRKOCCanLWiXOpXrgVOukogZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 PH0PR11MB7521.namprd11.prod.outlook.com (2603:10b6:510:283::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.23; Sat, 13 May
 2023 00:51:58 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3%6]) with mapi id 15.20.6387.020; Sat, 13 May 2023
 00:51:58 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2 5/8] drm/i915/huc: differentiate the 2 steps of the MTL
 HuC auth flow
Thread-Topic: [PATCH v2 5/8] drm/i915/huc: differentiate the 2 steps of the
 MTL HuC auth flow
Thread-Index: AQHZegNubesr3PJCYUW8VE1q7tEbvq9XdjQA
Date: Sat, 13 May 2023 00:51:58 +0000
Message-ID: <5df20eaf74dd0256be28ee48eef54ad08a45d15f.camel@intel.com>
References: <20230428185810.4127234-1-daniele.ceraolospurio@intel.com>
 <20230428185810.4127234-6-daniele.ceraolospurio@intel.com>
In-Reply-To: <20230428185810.4127234-6-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|PH0PR11MB7521:EE_
x-ms-office365-filtering-correlation-id: fe3b262c-1ee4-41d4-e079-08db534c4175
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AsZ4kU6uH+m2KhJPPlN7bfYkh2Tabf+cWE7w8ns37Y1cuov4WYbUM45CnVm202wmmR4JMm0XEwGjM0d2pHoTH4WSnYdek4+W/ig8gCCfbmnKQfQXGFQj9NDbFDUtr2bl7HenYYrVAwB58CspvFUbfhLDskCUX0Yx/B880v/LLlPoR9OrqUu9fyU7SBQAiqqMPiNutfGfPUu2SWTQ34fBh4mQdickQc4vli7D2UO2VGsVbo0Fcy9w8vBkEh9FO+Cy7GUQT3cVaueLQv/fhN0/YnZOrHzaiZe8GNRWZmXW/uP2ajzh8hjG8633eIun70aSD6cUfntbq3sEe7jpOFYPHCHLY26m+7eUaJbUXOAW5aA0mLm/UVXJHXH6RAzTUgzzGDlx5lKfXMvN5f/m4Vn9L4v/p5cDp2mftmf+AFq8/fjLyQaKzG87deTTNDT4MzIn9Jbtp84N8RfClgSJ3B3OrqFibnNKoe16ZUg52yTD2kEcFHTcLzZCc2HSpYNP0za7Zh5JSN0XKOmuTrtksFmECSCJozxKcYcWYqMxVAkugkDcSmIye2FfncpTPoyZWwQXlJKwWZVryMQlkFSXm/bbqVqgIfIhHKmV8+GktyvsHdiyIW8epNUi7PL33yM/jxQT
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(376002)(396003)(366004)(346002)(136003)(451199021)(6486002)(110136005)(38070700005)(316002)(41300700001)(71200400001)(478600001)(36756003)(86362001)(91956017)(450100002)(66446008)(66556008)(64756008)(4326008)(6506007)(66946007)(6512007)(26005)(2616005)(83380400001)(186003)(66476007)(76116006)(38100700002)(122000001)(82960400001)(8676002)(5660300002)(8936002)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L0xES3Bnc1hZZ1J4U0FLbUNnWVhkSVQ2WWNiSHVvaDNNZm1yTVdxU1kwVHJI?=
 =?utf-8?B?dUlKcFQ0NWZ1Y0V0VDIwYU1JV2Foc1p5Tm5FMzdLZGl1Z1VZaXNraWVvZkF2?=
 =?utf-8?B?aXRyenhkdFBUN0hPS1I0RVlvVGU0RjFJUFF2UjJTTTJaQWN3MWtsbDFyS3c3?=
 =?utf-8?B?MGZFU0lGWVp2SUhrV0ptL1hvUTRWN2hEbmVaWVhLOTNNdTh2NVExV2FtMlA5?=
 =?utf-8?B?MVNFN1JKNk1PV29aVG9FVER1MWJWK1RtVlhnVU04djZEVGFLY0VrSEMrcGpa?=
 =?utf-8?B?VEhxS0NSRkk1aUVJM1dBTFgyYmhiVkkranErU0RWQTZ6Sk9oNXBxcnVvZzVs?=
 =?utf-8?B?cVRKUmpGN3owRWFjMDFsa1poejRPR0hBdGJPMzhjeVgyTmVFWmE3RGpoRjQx?=
 =?utf-8?B?cjhUT2M4dDBhdGpYWVFTVlVoOGJ5Y0p6bXZua0hvdFFtY3Q0K25PcnVEUFox?=
 =?utf-8?B?aEkwUXRHNThsaklBandJb05sMkp0WWdFZ0tlUjQ2TWVDQUZMNkhpRVU0a2ZH?=
 =?utf-8?B?Rlo5Y3RBSUhuMmZNT1p5alpmc0w0djEvOWEzT0tmUHZIKzZ5RyszUFZQVE1D?=
 =?utf-8?B?UXNBZ3JkbldIRmxvYW1oYzd1alBhOE93QzRaYzJmUEoraERGL1FqakFqRHNC?=
 =?utf-8?B?N2dVY285dTBwT1ZUUDNuVzYzUllXMU1xM1VoY29WWDhBTEZleWlWcCtlcWo1?=
 =?utf-8?B?MnQ3b2t2d09pcjFkbUFQU3RLYUNROGdsMkVxdkZRZHFHR1NSZk80QTl6L0dC?=
 =?utf-8?B?ZGVEN2RGRWpMcFAwb0NrL0srRFZFdzlvbUR3RE9NTDhuREhuTVdCYzJBU0ow?=
 =?utf-8?B?N1dzOHlZWTRvamUya2hjS242bURsL25JOWcvbnlOMzgrcWJvb01DSHJmNVph?=
 =?utf-8?B?TW14MnVyTlVkOXozNlVPWTAwWXNrSk1YSnhRN2FNSkxEV2djV0FnTGlFaDRv?=
 =?utf-8?B?OUQwdUZCUEdKcEhGQWlJMWR3MFNFMHFwTEZINzMvV25uMGwyeHlIR0ErMTIx?=
 =?utf-8?B?TkdNSWJwbHMxMi8xOHJsdjhPdGt3SGdSSjNGbUxmY3FvLzExYkd3dFRyeHF3?=
 =?utf-8?B?ZkVkZDlmY01HeWJ3ZEM5QStrUEpGMU4ydklhMjBFSjNzS3NYRnpUeUxqZGhF?=
 =?utf-8?B?dmZIcHRzRHc4S0JUQlBlK0kzUWdaZXhJNmlMYzh0MFVubnNUeldCSjVaSDl5?=
 =?utf-8?B?djJJcVRpRmtxZy92Qk1SV1ZZWTNNODMxRjFtRUY3MnpPV3dWYzN1K2toVTRH?=
 =?utf-8?B?TkdDSmFaTGY3UUZJck1XUDJCNktoTEl1LzR2UHllbTIzNWxjTWtTNlF2Um1l?=
 =?utf-8?B?eUZYdk9lNkMrbXpPanBGMmgwWnpTcStuVllTM3JTenlObEVDY0NLalNsUFZY?=
 =?utf-8?B?SXdUUWN0YXBJSTZzZjNVR3NFOVNNWFVUbHQ2cjRkREhmQlFxVG1MdlZLazJX?=
 =?utf-8?B?b3lMZ3JNWVpPTGVZNUZuN0lWd3BGcGJVN0VUcGpPMHYzT1pRVHNacmtHVHJL?=
 =?utf-8?B?cmFodzROaUVWVXU3UlNLZXJYalhTNmpYaGZ4cy9CTXFrUmlPOGoxU1Bwb29o?=
 =?utf-8?B?c09YMDNEQWd3Q2xoOUp1ZUhCMXJtaStSOU9kQnZRWlovSlNrK0dRMGtoSlNP?=
 =?utf-8?B?M1c0eUkzRi94ZGNTSGFpVFBYQUFpMkI4ZFZQOUtacnVzcFF1Mk04MHJFYzBo?=
 =?utf-8?B?NzRPSFA0dlJQSUk1azdQTkNmUlc2THBTQ1M3S0dtQ0NiUVAxVkNyLytCV1h4?=
 =?utf-8?B?Z1dSNjZMTUZscHV6TEs1aWYyb0Z4K0c2cDNoVWs2WStEcC9BcE9SaXFWV2JK?=
 =?utf-8?B?eTNKYXdOZXU5VFRqN1dDU0dFL2RKMmFicXEzc29VMWVYQytUTC9zT3pnNFZl?=
 =?utf-8?B?M2x2SXRjSXBuanZsbFRQU1RtT0hHaWhlTmhQYkZ4b3lHSTBZZkphODBnQUw3?=
 =?utf-8?B?SWdkbUk0R25XdzNndDU3NVJGT3dmU2ViME5LRWVaMjRSRnRhOEdTN3M3QWVN?=
 =?utf-8?B?MmMwVXVWbGtIZm1TdmtDT3JvZDNFWG9WM3NFQmE3WUdJTTFCWklucytVb0t4?=
 =?utf-8?B?SHN6ank3Q2lBVUJVVDRRZCtObkNXTGYwRXN2cWhmRlpIS0x3RnpIeUxOR0Fh?=
 =?utf-8?B?dEsrNFdwNWx4U2R5T0VKbXlHM1VIQWViQjgxU0Y3cTYvSmQ0TmVmTTFvN0V5?=
 =?utf-8?Q?I0Ylq8qwcLFGgWjwfwjlUFw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2F22FA2C8F35AF489089A97C6C82382F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe3b262c-1ee4-41d4-e079-08db534c4175
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2023 00:51:58.3741 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DFcRBoOHThRYTFyzXkSq7O3EZSZi1QxamEaCaUoOnu8dXK0o3YuIyWLcEq5J/Bed1UAVp6zWAlLjuRv1z8M+9UD8DNcH/kCltJEni/y4LXt4L5cNldGHxjSvKd9Cv4oX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7521
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

T24gRnJpLCAyMDIzLTA0LTI4IGF0IDExOjU4IC0wNzAwLCBDZXJhb2xvIFNwdXJpbywgRGFuaWVs
ZSB3cm90ZToNCj4gQmVmb3JlIHdlIGFkZCB0aGUgc2Vjb25kIHN0ZXAgb2YgdGhlIE1UTCBIdUMg
YXV0aCAodmlhIEdTQyksIHdlIG5lZWQgdG8NCj4gaGF2ZSB0aGUgYWJpbGl0eSB0byBkaWZmZXJl
bnRpYXRlIGJldHdlZW4gdGhlbS4gVG8gZG8gc28sIHRoZSBodWMNCj4gYXV0aGVudGljYXRpb24g
Y2hlY2sgaXMgZHVwbGljYXRlZCBmb3IgR3VDIGFuZCBHU0MgYXV0aCwgd2l0aCBtZXUNCj4gYmlu
YXJpZXMgYmVpbmcgY29uc2lkZXJlZCBmdWxseSBhdXRoZW50aWNhdGVkIG9ubHkgYWZ0ZXIgdGhl
IEdTQyBhdXRoDQo+IHN0ZXAuDQo+IA0KPiBUbyByZXBvcnQgdGhlIGRpZmZlcmVuY2UgYmV0d2Vl
biB0aGUgMiBhdXRoIHN0ZXBzLCBhIG5ldyBjYXNlIGlzIGFkZGVkDQo+IHRvIHRoZSBIdUMgZ2V0
cGFyYW0uIFRoaXMgd2F5LCB0aGUgY2xlYXIgbWVkaWEgZHJpdmVyIGNhbiBzdGFydA0KPiBzdWJt
aXR0aW5nIGJlZm9yZSBmdWxsIGF1dGgsIGFzIHBhcnRpYWwgYXV0aCBpcyBlbm91Z2ggZm9yIHRo
b3NlDQo+IHdvcmtsb2Fkcy4NCj4gDQo+IHYyOiBmaXggYXV0aGVudGljYXRpb24gc3RhdHVzIGNo
ZWNrIGZvciBERzINCj4gDQo+IFNpZ25lZC1vZmYtYnk6IERhbmllbGUgQ2VyYW9sbyBTcHVyaW8g
PGRhbmllbGUuY2VyYW9sb3NwdXJpb0BpbnRlbC5jb20+DQo+IENjOiBBbGFuIFByZXZpbiA8YWxh
bi5wcmV2aW4udGVyZXMuYWxleGlzQGludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndC91Yy9pbnRlbF9odWMuYyAgICB8IDk0ICsrKysrKysrKysrKysrKysrLS0tLS0t
DQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9odWMuaCAgICB8IDE2ICsrKy0N
Cj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2h1Y19mdy5jIHwgIDQgKy0NCj4g
IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcmVnLmggICAgICAgICAgIHwgIDMgKw0KPiAgaW5j
bHVkZS91YXBpL2RybS9pOTE1X2RybS5oICAgICAgICAgICAgICAgfCAgMyArLQ0KPiAgNSBmaWxl
cyBjaGFuZ2VkLCA5MSBpbnNlcnRpb25zKCspLCAyOSBkZWxldGlvbnMoLSkNCj4gDQpJIGJlbGll
dmUgeW91IG5lZWQgYSByZWJhc2Ugd2l0aCB0aGUgUFhQIHNpbmdsZSBzZXNzaW9uIG1lcmdlZCAo
dGhlDQpyZWFkaW5lc3MgY29kZSBpbiBnc2NjcyBiYWNrZW5kKS4gT3RoZXIgdGhhbiB0aGF0LCBh
bGwgbG9va3MgZ29vZDoNCg0KUmV2aWV3ZWQtYnk6IEFsYW4gUHJldmluIDxhbGFuLnByZXZpbi50
ZXJlcy5hbGV4aXNAaW50ZWwuY29tPg0K
