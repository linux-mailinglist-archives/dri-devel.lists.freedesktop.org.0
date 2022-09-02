Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C745AAD0F
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 13:04:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC98210E7F6;
	Fri,  2 Sep 2022 11:04:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07FBE10E7F6;
 Fri,  2 Sep 2022 11:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662116639; x=1693652639;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Ha0OtdsmcczbAzh2RTmT0vYVcvp/MFe9lhnd31AQUDQ=;
 b=FeF1HYyhDjNW9veZGyn3h8DnszX4c8P7JAHIS53dZtcjxYzOgPfnQZAl
 N25rJNXxkQvJE0hVu1O9BqkgPrh2eW1K83my/A5ev1NzYarPF2OpSQq7n
 rdth3SvJ15ssfcxHEFsmJVrs9UAIugPi038VFAsbUFBywTNrRUE3kQSAi
 zIsUUjfWnK4bvsnEmbgB9aOMk+oxY0IFZqTN6q1ZBZmK9PG4njoqt5lbk
 fskh422mkGmRUVnqjABOzcLKBI4bsLB4tPO6MmJLHkitGFcqt8lmzzazU
 mcQg9tGRUvLDgJM26BxTOgv+fBNzFJngaSctnvHIBE+nkyNO4fhKj56aU w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="294697131"
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="294697131"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 04:03:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="738831284"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 02 Sep 2022 04:03:58 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 2 Sep 2022 04:03:57 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 2 Sep 2022 04:03:57 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 2 Sep 2022 04:03:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mrEi05ckFyhcWloS72RGqQpqFylrGOoSjozbJ7TFqNJOhiNZf5BTC56tF3cRcHDKQpjsCFdGh8weNJ5lH5j3bsTO7+7GgKFsXxFpv46zNFP13saL9aGEZiJfRkCO8fTQGBmYjVzuz+ucZOmuwFOvcb5lTtCmm5086Gyv91mxlW3Sd1xJbbaN4nN2Je7dwmJajTfgY7R0genVLb0ShUtTjVlYx+8MLKNtTaKl9UEPxrIw8/EtzFglsNQ9WvDrnADk8mzrRye2X06xijyOh8mkU/diH/gvjcrt7Q0Tj4i7/Ml1ljJS87DFipIybBtD6km/fHUmLQmVqlXUE+sr8F4N2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ha0OtdsmcczbAzh2RTmT0vYVcvp/MFe9lhnd31AQUDQ=;
 b=M8jTM9e7vf9T1gExQTQ42qx88pRp4Yn2s4wEJratvdV5m3GdoSW+M7+Kf+mIDXLlmnj5ou0o5MBKdRyJcTItQxqvtgcBbeghm17UWzVzv4rdK6Hdbs7vQzgYz1wlPKS7ETGjVWjM5yN+t/QaEnW2YaMXJ3FV8HuovRRssCPg6id84LvrdLa1OJ5woFt0t1rNVb8+60YzePYEQNSNMX5IXe+U64TxUQrngmhFWtgd7oBkDsg26Jj1+ca755zmVSXgDDKcziTWl9lRx9UWweyD4U5P7UzEe9OktrIDKAgrPmJJcF4MaY/L37a4Td2lubEckcPSjp+l+CraDc8+t8D31Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by DM6PR11MB4316.namprd11.prod.outlook.com
 (2603:10b6:5:205::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Fri, 2 Sep
 2022 11:03:50 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::549e:abb2:40dc:6591]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::549e:abb2:40dc:6591%9]) with mapi id 15.20.5588.015; Fri, 2 Sep 2022
 11:03:49 +0000
From: "Kahola, Mika" <mika.kahola@intel.com>
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH v2 3/4] drm/i915/display: Use drm helper
 instead of own loop for damage clips
Thread-Topic: [Intel-gfx] [PATCH v2 3/4] drm/i915/display: Use drm helper
 instead of own loop for damage clips
Thread-Index: AQHYtuPpeSR5J+3MqEqb1isZxLfmza3MCW3A
Date: Fri, 2 Sep 2022 11:03:49 +0000
Message-ID: <MWHPR1101MB2157A2EA865E672652280990EF7A9@MWHPR1101MB2157.namprd11.prod.outlook.com>
References: <20220823112920.352563-1-jouni.hogander@intel.com>
 <20220823112920.352563-4-jouni.hogander@intel.com>
In-Reply-To: <20220823112920.352563-4-jouni.hogander@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b7b8b88e-c402-4396-404f-08da8cd2d09c
x-ms-traffictypediagnostic: DM6PR11MB4316:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: l+HHOiwmcNVa+UjgMhs9EHUQo1QJHy/cPUKAH56m8BqpOXoCc1k33g/CzT2WsxJ9a0/iUEo79hBxCCGnnr7uaBGm2sJo8CdOC6FuDzpvhparhEENZHIdhfjp6F5KA5d2HPMAQ9+JdsbiGdKYFXK0gMvZ14MXkoVzKT7jOSw9uR/QHYK61erMR8RtlALjKTsgXD5djyWxAGfiDcSjY7VHuI2XhtITBmKr1pj3NXbEao75mRijvQjV+tb+apjqWjUFjukNqTIIYFNx+NFembu1/QBctA7cH7HMMu3QhNBBRlVOHMOyEaaI8x9/zlDeXK6qIgvbHHupHnj99QLzemDXlY6ElGFzI71iSfOZqFAIm/eJp57qwV4IbOKBz337lV4ExhuHAd1AoI9ON39QFfQ1Zt3vsTH0WgNAVQl9Ji7F1yPMYvTT/Ufyds5ZzbDEnhA6Qz/Xq722ShjlUe7EXnnGQjruR5BeU76U7iWo1C2LT+Ez6ZtRVIZ60cPsKiKX2XX8eTTwsXGgn9mWQch+jg+OeaNAHfV3vacrQrlpG6yobkTflYCYhsck++Jk3/BppJq7G+HS+JBcX6MRjM9jwg8uvHnnjS/2WCrNmRQ/pWDzzQ6FUbKFPJbuLcEoYgJiNA8+z+6ND0yraBMZpA+bwkp2uPKZDqwYfja5YPvDWshCSkaGnIWoOBluJaLGrTg6DP4Y700rGXYZDGRLLEgMV8SyhzaV7yfU2f2qVW1lQ4wiiTfK+WJ0WWSL6zAIj+eIwJzxyU0BmR4w6pD+I7W36URmkw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(376002)(39860400002)(396003)(346002)(366004)(33656002)(2906002)(86362001)(66446008)(66556008)(66476007)(66946007)(450100002)(64756008)(76116006)(82960400001)(110136005)(38070700005)(8676002)(316002)(7696005)(186003)(83380400001)(53546011)(5660300002)(6506007)(9686003)(478600001)(52536014)(122000001)(71200400001)(38100700002)(8936002)(26005)(41300700001)(55016003)(66574015);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MWRQMFdIWEFkV0t3ZW9pM1d0VGNCWjlQWXJxS29jWEVXMStPdC94aUV3ODRq?=
 =?utf-8?B?eURWdmgzU2VvN2JraVVrVTFucE1BK2VwMnlmZGtGSWpYVktWNU5ld3lUZnAr?=
 =?utf-8?B?cit6VWRoMnhZbTRyMG9WNHBJNm5JaktKbWhVRkdRKzd4Y1RFQTNkMWdYcmZx?=
 =?utf-8?B?aU0vTlYrNnM0eEFGMmpwRjVCM1FyMngwdDFYdFQ4RGl2SmVkU2NVWGIvN2xu?=
 =?utf-8?B?b0srUHhISGtOcU13bG9nTTRtTEhOeWl0NDI4bzArWEExRlNINDJSaVlSS24v?=
 =?utf-8?B?VXRZTmVYVjM1d0FCQytWSld2WnVZS3BIblUwNEQ3TGxHSm9nbjB4bGJOams0?=
 =?utf-8?B?bndGK0xuT21oS2U0bzRpK1FTSDBsSlR4bEJTQ1lYTEs3aENXc3h0azhzSHhr?=
 =?utf-8?B?M21Jbi8rdk05SlVvVjVvQWFjeDgzRER2cUsrR0llcERvcGpsa2VBbEk5ZUE1?=
 =?utf-8?B?WG54UG1teEwzQjdQVVZKNUJpckZ2T2NhMkM4ekEvQVRyK3BWT3JEUFpkNTNt?=
 =?utf-8?B?L25Gd3o2dFpsUjNvWEpJQ2VhMGJBbTl5b0oxL1cxbjlod3oyZER2eHN2alBu?=
 =?utf-8?B?THdyZHhUUllwSG1CRENPUE05UmkyeTVLOUVwSk02SWRqTWxUMGd6eDlLeEdi?=
 =?utf-8?B?Y3RBN2ovMEhPWXQ0bmE5QXYyWE5hZHh3amVlWVc0aE90YURUSXYwb3dzZExk?=
 =?utf-8?B?Q05lOVhEV3ZBQURlUjRWa3U2THNMVUVIS3EwTlV1V0pVY3VidVhDY2o4SGtY?=
 =?utf-8?B?b1pPdTI4elRqa3NZV0d6VENGNHhnR0VRWVBhNnR3M1NXVk4weDVuMTlYZ0F4?=
 =?utf-8?B?WjdVempyZFRBWTlWcFUrMTBncFZFcjZqMUtoT2FpczZxNTl0TXBHT3lKYjNq?=
 =?utf-8?B?VmJLRlpoNTlvT2FqbXhvMlpzRnpWaHhYV0JyZjF2eTQvU1lQZG5oRy9mN2dM?=
 =?utf-8?B?eE5DanNTeTVKa1hKYXozRDRUUER3SGN1UHdaL00xVkZSa0NSTENIRC95QmQy?=
 =?utf-8?B?d1RSNHlqdFpFS3czaXh0d2t6MFczU2ZvcXhvQ0xPTWt6L3BxMUluTGtkWlVQ?=
 =?utf-8?B?b1pxV2dRWFBwVGhvMXlBS0REQ2FFMDNYYTlXNjNuOGFpR0Y2UytjM3VyRmFy?=
 =?utf-8?B?d2VRclM2cUc0R2pGdXh1NXEwc1NmSERXRHJwSkh0bkhPVUpkdHVKeUZIaWF2?=
 =?utf-8?B?ekRMMUppVS9kSXdINzQ1OENweXp6a2RVU2J2QWlJRW56SmQvMGxybzhzU3lV?=
 =?utf-8?B?K0tuWFQvaEpENzhhb3ZIenpCT21ldEJ2WFhSenVqajVKVytoVjdxNlRrZ0dT?=
 =?utf-8?B?TUVCckI2czdmVnV0dFpmQkxRMGhXT3UrUWk5UFZTRi8xT2FPbHg2clYxeWts?=
 =?utf-8?B?OGZodDJaT1JqZWxVQThZMUlYOVNKNjg0cCtoNjdya2x0cDQ1YWhqMDU2R1ht?=
 =?utf-8?B?bjhZaHgwcHJOeTNMWkVYYXQyVU5aYU9qR3hJSURiUGdvOVluM3dPRGJnVmxT?=
 =?utf-8?B?cmdpM1c3N2htZkhNbGN2YmdrZFhKK085WFh4UmovS1dqZTBBYnhFV1o1SEVX?=
 =?utf-8?B?VnJtcTkzOEVMc29mdzU5Qm1wRFgwc3orclYwcFBEdFI0TExqMGZDZ1FGbTdi?=
 =?utf-8?B?VWZjaU1zL2RVb2llazhZM3RISUI4UllQMGNpQXY4cVNRaytmUWFYMitJMjF2?=
 =?utf-8?B?alVHZzdVSEZ2RHJyRHFCQjBYMmJlajBDVjRhVjduZ1RCYmRzNXlMZkM0Ujlq?=
 =?utf-8?B?SzBKdG5heXR3YmYwYlBkR1M2MTB4Q0dYTytjbGpBUGlxS0ViQjR2SThCYzlB?=
 =?utf-8?B?d0M5ZktRRzA4bEFQdjQ0SmsyVzRudGM1L3lxejc3bEQ2c3N2T21Yc3lhNHJG?=
 =?utf-8?B?R09saGdVNHJiNk44UWZTaXY5eDFqNmFJMGFQajB1dEpqRDgwMjRCeW5jN2tl?=
 =?utf-8?B?OGFhQUdsQ09zSHp0ME5yVWJDUFBzMVlZaXdRVkZaS25oZTNDVy9KZ25LVzQy?=
 =?utf-8?B?VWxJQWhWTld5Z3RhellReVVjRmtlWnpMakh1RjhjSlh2Q0ZBWndIbkdIbUdD?=
 =?utf-8?B?UnlHcDBSVDhtQ0E1anZXeTFPd2Vla3I0M1FpaVFrdmZDQStzWnVJcEVscHh5?=
 =?utf-8?Q?X6HVVc4bzq7PXmH4LwEjW1t1G?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7b8b88e-c402-4396-404f-08da8cd2d09c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2022 11:03:49.6799 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sRKCpQAwNlaCLTNHQRavLFY5Hz1mx82tOYdrvnQ37OldMVrO9mOwM6B/G1nTIvbsUWlHv3qzjK4kHFcTfNhfBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4316
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBJbnRlbC1nZnggPGludGVsLWdm
eC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIEpvdW5pDQo+IEjD
tmdhbmRlcg0KPiBTZW50OiBUdWVzZGF5LCBBdWd1c3QgMjMsIDIwMjIgMjoyOSBQTQ0KPiBUbzog
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZw0KPiBTdWJqZWN0OiBbSW50ZWwtZ2Z4XSBbUEFUQ0ggdjIgMy80XSBkcm0vaTkxNS9k
aXNwbGF5OiBVc2UgZHJtIGhlbHBlciBpbnN0ZWFkIG9mDQo+IG93biBsb29wIGZvciBkYW1hZ2Ug
Y2xpcHMNCj4gDQo+IFVzZSBleGlzdGluZyBkcm1fYXRvbWljX2hlbHBlcl9kYW1hZ2VfbWVyZ2Vk
IGZyb20gZ2VuZXJpYyBkcm0gY29kZQ0KPiBpbnN0ZWFkIG9mIGltcGxlbWVudGluZyBvd24gbG9v
cCB0byBpdGVyYXRlIG92ZXIgZGFtYWdlX2NsaXBzLg0KPiANCg0KUmV2aWV3ZWQtYnk6IE1pa2Eg
S2Fob2xhIDxtaWthLmthaG9sYUBpbnRlbC5jb20+DQoNCj4gU2lnbmVkLW9mZi1ieTogSm91bmkg
SMO2Z2FuZGVyIDxqb3VuaS5ob2dhbmRlckBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuYyB8IDE3ICsrKysrLS0tLS0tLS0tLS0tDQo+
ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkNCj4gDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5jDQo+
IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuYw0KPiBpbmRleCAxNjk4
NWRlMjQwMTkuLjBjZTgwNzZiZTAwMCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9wc3IuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX3Bzci5jDQo+IEBAIC0xNzIxLDggKzE3MjEsNiBAQCBpbnQgaW50ZWxfcHNyMl9z
ZWxfZmV0Y2hfdXBkYXRlKHN0cnVjdA0KPiBpbnRlbF9hdG9taWNfc3RhdGUgKnN0YXRlLA0KPiAg
CQkJCQkgICAgIG5ld19wbGFuZV9zdGF0ZSwgaSkgew0KPiAgCQlzdHJ1Y3QgZHJtX3JlY3Qgc3Jj
LCBkYW1hZ2VkX2FyZWEgPSB7IC54MSA9IDAsIC55MSA9IC0xLA0KPiAgCQkJCQkJICAgICAgLngy
ID0gSU5UX01BWCB9Ow0KPiAtCQlzdHJ1Y3QgZHJtX2F0b21pY19oZWxwZXJfZGFtYWdlX2l0ZXIg
aXRlcjsNCj4gLQkJc3RydWN0IGRybV9yZWN0IGNsaXA7DQo+IA0KPiAgCQlpZiAobmV3X3BsYW5l
X3N0YXRlLT51YXBpLmNydGMgIT0gY3J0Y19zdGF0ZS0+dWFwaS5jcnRjKQ0KPiAgCQkJY29udGlu
dWU7DQo+IEBAIC0xNzcwLDIwICsxNzY4LDE1IEBAIGludCBpbnRlbF9wc3IyX3NlbF9mZXRjaF91
cGRhdGUoc3RydWN0DQo+IGludGVsX2F0b21pY19zdGF0ZSAqc3RhdGUsDQo+ICAJCXNyYyA9IGRy
bV9wbGFuZV9zdGF0ZV9zcmMoJm5ld19wbGFuZV9zdGF0ZS0+dWFwaSk7DQo+ICAJCWRybV9yZWN0
X2ZwX3RvX2ludCgmc3JjLCAmc3JjKTsNCj4gDQo+IC0JCWRybV9hdG9taWNfaGVscGVyX2RhbWFn
ZV9pdGVyX2luaXQoJml0ZXIsDQo+IC0JCQkJCQkgICAmb2xkX3BsYW5lX3N0YXRlLT51YXBpLA0K
PiAtCQkJCQkJICAgJm5ld19wbGFuZV9zdGF0ZS0+dWFwaSk7DQo+IC0JCWRybV9hdG9taWNfZm9y
X2VhY2hfcGxhbmVfZGFtYWdlKCZpdGVyLCAmY2xpcCkgew0KPiAtCQkJaWYgKGRybV9yZWN0X2lu
dGVyc2VjdCgmY2xpcCwgJnNyYykpDQo+IC0JCQkJY2xpcF9hcmVhX3VwZGF0ZSgmZGFtYWdlZF9h
cmVhLCAmY2xpcCwNCj4gLQkJCQkJCSAmY3J0Y19zdGF0ZS0+cGlwZV9zcmMpOw0KPiAtCQl9DQo+
IC0NCj4gLQkJaWYgKGRhbWFnZWRfYXJlYS55MSA9PSAtMSkNCj4gKwkJaWYgKCFkcm1fYXRvbWlj
X2hlbHBlcl9kYW1hZ2VfbWVyZ2VkKCZvbGRfcGxhbmVfc3RhdGUtDQo+ID51YXBpLA0KPiArCQkJ
CQkJICAgICAmbmV3X3BsYW5lX3N0YXRlLT51YXBpLA0KPiAmZGFtYWdlZF9hcmVhKSkNCj4gIAkJ
CWNvbnRpbnVlOw0KPiANCj4gIAkJZGFtYWdlZF9hcmVhLnkxICs9IG5ld19wbGFuZV9zdGF0ZS0+
dWFwaS5kc3QueTEgLSBzcmMueTE7DQo+ICAJCWRhbWFnZWRfYXJlYS55MiArPSBuZXdfcGxhbmVf
c3RhdGUtPnVhcGkuZHN0LnkxIC0gc3JjLnkxOw0KPiArCQlkYW1hZ2VkX2FyZWEueDEgKz0gbmV3
X3BsYW5lX3N0YXRlLT51YXBpLmRzdC54MSAtIHNyYy54MTsNCj4gKwkJZGFtYWdlZF9hcmVhLngy
ICs9IG5ld19wbGFuZV9zdGF0ZS0+dWFwaS5kc3QueDEgLSBzcmMueDE7DQo+ICsNCj4gIAkJY2xp
cF9hcmVhX3VwZGF0ZSgmcGlwZV9jbGlwLCAmZGFtYWdlZF9hcmVhLCAmY3J0Y19zdGF0ZS0NCj4g
PnBpcGVfc3JjKTsNCj4gIAl9DQo+IA0KPiAtLQ0KPiAyLjM0LjENCg0K
