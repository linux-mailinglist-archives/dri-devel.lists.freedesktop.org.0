Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E20040DDEC
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 17:23:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A8A16EB8D;
	Thu, 16 Sep 2021 15:23:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B9F16EB8D;
 Thu, 16 Sep 2021 15:23:35 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10109"; a="244968128"
X-IronPort-AV: E=Sophos;i="5.85,298,1624345200"; d="scan'208";a="244968128"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 08:23:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,298,1624345200"; d="scan'208";a="434533221"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 16 Sep 2021 08:23:33 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 16 Sep 2021 08:23:33 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 16 Sep 2021 08:23:33 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 16 Sep 2021 08:23:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NPe+R6d3diU7GGaQwdCW3jDrVUBs+nHLIX4+Uv2m9pLqgQxKbqjQ21dLbNLGY7P3QA0cCCTU9WWukxaxBKbnGvDqyQqWB+kVd5qU+SAFvNCi339bU/oJzCiRaV7CvpiMSeqEVLi7L4tHqVySuqDlzAYoicbQ/UFlinT3UyiI7yq2CRfxaw/g5uFqLvSuEc5kcrSSf/lT+YMGuizZuDWY7i2n+JsTH/XmN4FnN6oyJ026CK6NaahMhdHYZdgI4ooqCowP6ccuACV6SDdpLmz96pI3LFPzmGe/roj5dEoZU7TagJq3tmWmQ2YrXg85YgjfxqsbGfUXgiktyCsP8P5PxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=Zzb/fWhEIBMqF+LyP8yYvBXEP91lvI+32zp4nJzcmog=;
 b=OfuDmWPOrnk6Yk3QoHaiEL/roPKznpXL4qsSh5tGGGhHoSd/zPvFKW0ub9RKL+llgj9amquZSXOHggMtB3zN7asq3nCtTk2Hi4dzibEqFSCCPGdAyFL76K1fKLFj+UHqSLPymklzVn5/oUtJJ36iUWppFcesDSQkTTfF9jopULybv2DdwyRqzjO7mBgv+JJzSdPv7m5jqN9nZiAaK92W7Ldy77HoBJqT7uZiv6WJzGTbFP0LEnCIB7khot5Pk3BHTdaxp1ErwGSF8EWCK9KKTkWSJ87TJuHqgLPkQCBCvR7aRI+hsmkLqeiyWYRvHCdARqYypB/N74s32uo0fyBFWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zzb/fWhEIBMqF+LyP8yYvBXEP91lvI+32zp4nJzcmog=;
 b=i26oOI2vBDh/z4oJ1uTBQlD8NfbyeRAaw7v/pg2OiCyHaL2/IgmIyIOI4oWfNfr/kh9YIJwF79AXBIwlx2LNK/DBHMNBNqEAhS+w4ahIUHA7SJj0xGHupafvWXUfE5Izhms2kLV2JcP/Mltsj0FIFN+obWaaaZ+7pfjTB+DDrZ8=
Received: from BYAPR11MB3784.namprd11.prod.outlook.com (2603:10b6:a03:fe::10)
 by BYAPR11MB3269.namprd11.prod.outlook.com (2603:10b6:a03:75::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Thu, 16 Sep
 2021 15:23:31 +0000
Received: from BYAPR11MB3784.namprd11.prod.outlook.com
 ([fe80::7d17:fce5:7d65:61e1]) by BYAPR11MB3784.namprd11.prod.outlook.com
 ([fe80::7d17:fce5:7d65:61e1%5]) with mapi id 15.20.4523.016; Thu, 16 Sep 2021
 15:23:31 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@redhat.com" <airlied@redhat.com>, "daniel.vetter@ffwll.ch"
 <daniel.vetter@ffwll.ch>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "chris@chris-wilson.co.uk"
 <chris@chris-wilson.co.uk>
Subject: Re: [Intel-gfx] [PATCH v9 04/17] drm/i915/pxp: allocate a vcs context
 for pxp usage
Thread-Topic: [Intel-gfx] [PATCH v9 04/17] drm/i915/pxp: allocate a vcs
 context for pxp usage
Thread-Index: AQHXploXiT0yjPBclUGt9MBG4cD4B6ulJXOAgAB3NgCAAOyPAIAAMCEAgAAXrQA=
Date: Thu, 16 Sep 2021 15:23:31 +0000
Message-ID: <f1b2658fd050c669f64382e8c73e058081b60dc6.camel@intel.com>
References: <20210910153627.1060858-1-daniele.ceraolospurio@intel.com>
 <20210910153627.1060858-5-daniele.ceraolospurio@intel.com>
 <874kamx7vk.fsf@intel.com> <YUJe4Az/in46lPkg@intel.com>
 <87bl4swzhr.fsf@intel.com> <YUNNsOmnhIHaPPxl@intel.com>
In-Reply-To: <YUNNsOmnhIHaPPxl@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fecbb8f8-4a07-40c0-bbf4-08d97925f0f9
x-ms-traffictypediagnostic: BYAPR11MB3269:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB3269B0E8856D6F21EC36DC6F8ADC9@BYAPR11MB3269.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: J+ybv39cFU5lIZnxCKRIMYtVUHz/g9CydBD+ShVViDXi64g/G5tvHvqvN2U+u5TGngy+Tvw+UP5llS2Y7GFsiCBXRuwFyQYeE2/7s+TtaOMh/Yp8no2nWvomcW5XJ3n3i2P9P5pj9vTerU/oUIKeZ2ERtZFXFV2cdto3D1qari2UX7r4vNRd2kTPnk1xxYQ5Do6adaQ7R1IW/9STM8gnRHkWM+jSCm7+LXO9NSo49f/BR8eRFSRcR+VUrnTlqQMz1V8o6xdTrPZACfccnIU2v02Jn9ScFuKaaEtTtV73EGIRiRcl+tUMQcWjo7RWZXzt+eYYQfc1uZDL+Unfbc2K8h2rMQ3HmjgFdEfheSxNMBLxv/LZtCPdJuR/NUCFofzCnA6FprS7saO1PAk4P3E65Vk7naiaO90lzPlskfeAaU2vvtRCqux7vlz5+QXckBkyWjVPdz4dAXWd9iz3Q8uQTZiTYXLq0S2cFVs/w2OL9yQ+I1af+7oLF8Zocl+0anC2LoG9VL9Bg2uSJrmqksjOzOei1AaYr1wZsuHqFCoaMuHpuOhHhLMzgbDa0ckYpf/MoP2XLtYLjZDNgQirsIhW70ywtAGu+xY9cdaqQfhd+nndhbe4FtR2zXK/9bFcf6C1Nx6UvEYgpvVUlrcSmyCPx55WUbyQUOv0DY52c4OCMqhUmMEwu1alNYqjJjnobuYqhT0vea2YwJ0T4fUmrIhrWg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3784.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(366004)(136003)(346002)(39860400002)(38070700005)(8936002)(2906002)(86362001)(54906003)(4326008)(316002)(2616005)(83380400001)(186003)(26005)(478600001)(36756003)(6506007)(6486002)(8676002)(110136005)(122000001)(5660300002)(6512007)(38100700002)(71200400001)(66946007)(66556008)(64756008)(66446008)(76116006)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?blVsQmJ2VW83VGo0Y1Z6UFNlOUhRN2xqamlCaUQvWXhRK3dtcDBPdjdWUTRw?=
 =?utf-8?B?QmpDM3dCMm4yUHV3ajNaNlZoMUprWmpiQjBlbEZLdmVZK3N1dWVXUHE1SEFR?=
 =?utf-8?B?RHBVWXBzRkRKdytOOGxyWDl5SVpUTHY1S3ZiVFhDZWJ3Vkp0QWMzRjA2UDFj?=
 =?utf-8?B?WUMwUkt6L1dJSUNYQ0hWcmYvZWRSV1prckNGQnR3WFpyMTZyNVhMbmo2WnBK?=
 =?utf-8?B?YVhObjFEZGJ0U3YxTFBxa1pJNFZXWUlrL0E2Z3BGZWt4Szh2aklEWkZUd2Zn?=
 =?utf-8?B?UXMzMHJNTDYwdkVvcjVQR0p2U0FVSFBwL2wyVEFubFpaeU9SejBzbnlOQ1Fp?=
 =?utf-8?B?UjB2VnR4VmpVUWQ4RnAxY0sxdkRFaDJwUUpsQS9rZzRqYVZZZWdCeHMwU3pF?=
 =?utf-8?B?cnZ6dFNaVjFUMEVKbFkvaGRyeStGL1RBVzJYYTVOekNMOGoyWVBzUHE5Z0p3?=
 =?utf-8?B?RURybUxzNHpYakxqOWZid2pZeWdMeDBKSHg5TlVmWWpBSURpODZNWGhvVUda?=
 =?utf-8?B?Y3hKcWgyTDQ1WTVjdlRicC9JdSsvcFFmSk9iUEF0VGh0WFNabE8wUFd5c1Ey?=
 =?utf-8?B?NElnaVdVa3BkWVhncHhKR2VTSTdVTjcwSjZaOWJTcXEvY2JsTTNPN0lLZjF2?=
 =?utf-8?B?WmlmMXJTVlJqeVlYWXR0K3VKNVJ5VzR3bkdxS1ZUU3Vkb1dNd3pEQ2tkUzEv?=
 =?utf-8?B?NFRDcEZQWWM5V20xdlNSay9OL3NiSGpSSXRNak5GWXcxcHVZWEZPc00rdVFa?=
 =?utf-8?B?MXdMbUNqOVhoSzdGMHB6THpaTFBnU0pNcnlGa2RDTG0xTXNLcXlPS0NDUHVI?=
 =?utf-8?B?bnMrdC9GdU1GQVlmUVdGSlNJQU95SlJubGh6OVZDY3ZpZVlmV2pscUloWlN3?=
 =?utf-8?B?c3BsS3lmbDF6RTYvRXJXQTVIWHVoVWE3bG1lUVVvaWFWaU50RUsxZ2h5UWhv?=
 =?utf-8?B?bXNDQTBJNUV0OTgrc2U3bHRDTEppRDdMbng3bmMxa0hUZkhmYmw3TEIvZG9V?=
 =?utf-8?B?WGtYMjJQZ1JTSGNpQkUwM3BmRzhpaFpFMnBWb2J0b0h0aUNDVzBBeERRWEdz?=
 =?utf-8?B?NjArNTVIcmlIN1d3czFDc1RoMU0wYjIrQmF4UDYrdkJ4VXpLSkl2TmxKeGxo?=
 =?utf-8?B?ZXZjR1pib2dlRDFCSEtuT2E5c0h5YXBkRWhZZmNUWFVKNGVLZysrVXM0SHVB?=
 =?utf-8?B?U2pOZVFLZDFTbUFMZE0vUnl6ZjVNWWVPQUtqUFZPT2ZNeEZJdVZsajkxdVky?=
 =?utf-8?B?S2sreSthRy9VVGk1Q2Q2SFpkdXFNWmRhY0FSZlRuZnBLZkVaOWcvekJWUzRo?=
 =?utf-8?B?dmZXZlhibEI5V0gvVThsRlRIbExxTWp4SHcxeFJtM2xHUWlHVDB3TE53RWNn?=
 =?utf-8?B?TlRyS05wNDdNd1NDRlhlV1h6Yi9POWRoenhKZExpMEhUQy9vcUV5aVlQUmdY?=
 =?utf-8?B?U2pFMXY4UHczT2Y5MGJaWUpsUnN6NWZSZjB4alRWSElPam04Z1ZGcE5VTEVR?=
 =?utf-8?B?M3RhTkQ2Qm1GektVRlFUYkJiak5aNUowQWxXb2tWMFJSMlZJdmpJdzN5aDJ2?=
 =?utf-8?B?SGtFM3FkY21qMHBnNE90OTFUZXo4bldkcWdhbGRzcVRKQ21yQ0VUbFVqNTU2?=
 =?utf-8?B?SEJONkNuTDZFSG5XSCs4L2d1UlJ6enFuc0N1SmpFV3ZLanJVTCtjT2JwNzgv?=
 =?utf-8?B?b0dtd0RxdTJnU1J2TnV3SnllZUd1QnJxcUhrSEEyYlpFZG9qbDVtNDh3WVpT?=
 =?utf-8?B?UFR6NjRSTlRuakRoRFd6VVh4NndjV0NvY1UyclE0OWNxSmVOOTEvRkJaT1ox?=
 =?utf-8?B?blB1MC8wLzBEakMyY21Fdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <38968D060E1A2741960CA86224AF9737@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3784.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fecbb8f8-4a07-40c0-bbf4-08d97925f0f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2021 15:23:31.2265 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ho77I2wHP6+RmDH3ZmMXsqKsGMKFGTaP4FCoSgLD8ZCd01WKQB9z5BOIDDRzmcHyH5I6/4XLWqV5ThsoBsHWUtay+NufgfybgCCHqdb49B06mcYdTX2T3NV2KWhgM316
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3269
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

DQpPbiBUaHUsIDIwMjEtMDktMTYgYXQgMDk6NTkgLTA0MDAsIFJvZHJpZ28gVml2aSB3cm90ZToN
Cj4gT24gVGh1LCBTZXAgMTYsIDIwMjEgYXQgMDI6MDY6NTZQTSArMDMwMCwgSmFuaSBOaWt1bGEg
d3JvdGU6DQo+ID4gT24gV2VkLCAxNSBTZXAgMjAyMSwgUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZp
dmlAaW50ZWwuY29tPiB3cm90ZToNCj4gPiA+IE9uIFdlZCwgU2VwIDE1LCAyMDIxIGF0IDA0OjUz
OjM1UE0gKzAzMDAsIEphbmkgTmlrdWxhIHdyb3RlOg0KPiA+ID4gPiBPbiBGcmksIDEwIFNlcCAy
MDIxLCBEYW5pZWxlIENlcmFvbG8gU3B1cmlvIDxkYW5pZWxlLmNlcmFvbG9zcHVyaW9AaW50ZWwu
Y29tPiB3cm90ZToNCj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
cHhwL2ludGVsX3B4cC5oIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvcHhwL2ludGVsX3B4cC5oDQo+
ID4gPiA+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiA+ID4gPiBpbmRleCAwMDAwMDAwMDAw
MDAuLmU4NzU1MGZiOTgyMQ0KPiA+ID4gPiA+IC0tLSAvZGV2L251bGwNCj4gPiA+ID4gPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9weHAvaW50ZWxfcHhwLmgNCj4gPiA+ID4gPiBAQCAtMCww
ICsxLDM1IEBADQo+ID4gPiA+ID4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBNSVQgKi8N
Cj4gPiA+ID4gPiArLyoNCj4gPiA+ID4gPiArICogQ29weXJpZ2h0KGMpIDIwMjAsIEludGVsIENv
cnBvcmF0aW9uLiBBbGwgcmlnaHRzIHJlc2VydmVkLg0KPiA+ID4gPiA+ICsgKi8NCj4gPiA+ID4g
PiArDQo+ID4gPiA+ID4gKyNpZm5kZWYgX19JTlRFTF9QWFBfSF9fDQo+ID4gPiA+ID4gKyNkZWZp
bmUgX19JTlRFTF9QWFBfSF9fDQo+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ICsjaW5jbHVkZSAiZ3Qv
aW50ZWxfZ3RfdHlwZXMuaCINCj4gPiA+ID4gDQo+ID4gPiA+IEkndmUgYmVlbiB0cnlpbmcgdG8g
cHJvbW90ZSB0aGUgaWRlYSB0aGF0IHdlIGRvbid0IGluY2x1ZGUgaGVhZGVycyBmcm9tDQo+ID4g
PiA+IGhlYWRlcnMsIHVubGVzcyByZWFsbHkgbmVjZXNzYXJ5LiBJdCBoZWxwcyB3aXRoIGJ1aWxk
IHRpbWVzIGJ5IHJlZHVjaW5nDQo+ID4gPiA+IHJlYnVpbGRzIGR1ZSB0byBjaGFuZ2VzLCBidXQg
bW9yZSBpbXBvcnRhbnRseSwgaXQgaGVscHMgd2l0aCBjb21pbmcgdXANCj4gPiA+ID4gd2l0aCBh
YnN0cmFjdGlvbnMgdGhhdCBkb24ndCBuZWVkIHRvIGxvb2sgYXQgdGhlIGd1dHMgb2Ygb3RoZXIN
Cj4gPiA+ID4gY29tcG9uZW50cy4NCj4gPiA+ID4gDQo+ID4gPiA+IFRoZSBhYm92ZSBpbmNsdWRl
IGxpbmUgcHVsbHMgaW4gNjcgb3RoZXIgaW5jbHVkZXMuIEFuZCBpdCBoYXMgdG8gbG9vayBhdA0K
PiA+ID4gPiB0aGUgc2FtZSBmaWxlcyBhICpsb3QqIG1vcmUgdGltZXMgdG8ga25vdyBub3QgdG8g
aW5jbHVkZSB0aGVtIGFnYWluLg0KPiA+ID4gPiANCj4gPiA+ID4gTWF5YmUgd2UgbmVlZCB0byBz
dGFydCBiZWluZyBtb3JlIGFnZ3Jlc3NpdmUgYWJvdXQgaGlkaW5nIHRoZQ0KPiA+ID4gPiBhYnN0
cmFjdGlvbnMgYmVoaW5kIHRoZSBpbnRlcmZhY2VzIGFuZCBoZWFkZXJzLiBTdGF0aWMgaW5saW5l
cyBhcmUNCj4gPiA+ID4gbm90aGluZyBidXQgbWljcm8tb3B0aW1pemF0aW9ucyB0aGF0IGxlYWsg
YWJzdHJhY3Rpb25zLiBEbyB3ZSBuZWVkDQo+ID4gPiA+IHRoZXNlPw0KPiA+ID4gDQo+ID4gPiBZ
ZWFwLCB3ZSBoYXZlIGEgZmV3IGNhc2VzIHdoZXJlIHRoaXMgaXMgYWxyZWFkeSBoYXBwZW5pbmcu
Li4NCj4gPiA+IA0KPiA+ID4gU2hvdWxkIHdlIHN0YXJ0IHVzaW5nIHRoZSBjb250YWluZXJfb2Yg
bW9yZSBkaXJlY3RseSBhbmQgYXZvaWQgdGhlIGFfdG9fYigpDQo+ID4gPiBoZWxwZXJzPw0KPiA+
ID4gDQo+ID4gPiBTaG91bGQgd2UgY3JlYXRlIHRoZSBhX3RvX2IoKSBoZWxwZXJzIG9ubHkgaW5z
aWRlIC5jIGZpbGVzIGxpa2Ugd2UgaGF2ZQ0KPiA+ID4gaW4gYSBmZXcgb3RoZXIgY2FzZXM/DQo+
ID4gPiANCj4gPiA+IEluIHRoaXMgcHhwIGNhc2UgaGVyZSBpdCBsb29rcyBsaWtlIHVzaW5nIHRo
ZSBjb250YWluZXIgb2YgZGlyZWN0bHkgaXMNCj4gPiA+IGV2ZXJ5d2hlcmUgaXMgYmV0dGVyLi4u
IGlzIHRoaXMgeW91ciByZWNvbW1lbmRhdGlvbj8NCj4gPiANCj4gPiBFaXRoZXIgdGhhdCwgb3Ig
bWFrZSBpdCBhIG5vbi1pbmxpbmUgZnVuY3Rpb24gdGhhdCdzIGFjdHVhbGx5DQo+ID4gYWJzdHJh
Y3RlZC4gWWVzLCBpdCBsZWFkcyB0byBhIGZ1bmN0aW9uIGNhbGwsIGJ1dCBJJ20gcmVhbGx5IHN0
YXJ0aW5nIHRvDQo+ID4gd29uZGVyIGFib3V0IHRoZSBjb3N0cyBvZiBhIGZ1bmN0aW9uIGNhbGwg
dnMuIG1haW50YWluYWJpbGl0eSBhY3Jvc3MgdGhlDQo+ID4gYm9hcmQuDQo+IA0KPiBBbGFuLCBj
b3VsZCB5b3UgcGxlYXNlIGFkZHJlc3MgdGhpcz8gV2l0aCB0aGF0IGFkZHJlc3NlZCBhbmQgQ0kg
aGFwcHkNCj4gd2Ugd2lsbCBtZXJnZSB0byB0aGUgYWxyZWFkeSBjcmVhdGVkIHRvcGljL3B4cCBh
bmQgZG8gdGhlIHByb3Blcg0KPiBwdWxsIHJlcXVlc3RzLg0KPiANCj4gaWYgeW91ciBjaGFuZ2Ug
b25seSB0b3VjaGVzIHRoaXMgcGF0Y2ggZG9uJ3QgbmVlZCB0byByZXNlbmQgdGhlIHdob2xlDQo+
IHNlcmllcyBidXQganVzdCBpbi1yZXBseS10by4gQnV0IGlmIGNoYW5nZXMgZXZlcnl0aGluZyB0
byBjb250YWluZXItb2YNCj4gcGxlYXNlIHJlc2VuZCBpdCBlbnRpcmVseS4NCj4gDQo+IFRoYW5r
cywNCj4gUm9kcmlnby4NCj4gDQoNClllcyAtIGFzIHlvdSBhcmUgYXdhcmUsIEkgaGF2ZSBzb21l
dGhpbmcgcmVhZHkgdG8gcHVibGlzaCBidXQgaXQgdG91Y2hlcyBtdWx0aXBsZSBwYXRjaGVzIChh
cyBmdW5jdGlvbg0KZ2V0IGludHJvZHVjZWQgYW5kIG1vZGlmaWVkIGFjcm9zcyBtdWx0aXBsZSBw
YXRjaGVzKS4gVGhlIGFwcHJvYWNoIGkgYW0gdGFraW5nIGlzIHRvIG1ha2UgdGhlbSBmdW5jdGlv
bg0KcHJvdG90eXBlcyAoZXhjZXB0IHdoZW4gQ09ORkdfUFhQIGlzIG9mZiBhcyB0aGV5IGFyZSBj
YW4gYmUgaW5saW5lIHN0dWJzKS4gSSBqdXN0IGhhdmUgbW9yZSBjbGVhbiB1cHMgKw0KdGVzdGlu
ZyB0byBkby4NCg0KPiA+IFN0YXRpYyBpbmxpbmVzIGNvbnNpZGVyZWQgaGFybWZ1bC4NCj4gPiAN
Cj4gPiANCj4gPiBCUiwNCj4gPiBKYW5pLg0KPiA+IA0KPiA+IA0KPiA+ID4gPiA+ICsjaW5jbHVk
ZSAiaW50ZWxfcHhwX3R5cGVzLmgiDQo+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ICtzdGF0aWMgaW5s
aW5lIHN0cnVjdCBpbnRlbF9ndCAqcHhwX3RvX2d0KGNvbnN0IHN0cnVjdCBpbnRlbF9weHAgKnB4
cCkNCj4gPiA+ID4gPiArew0KPiA+ID4gPiA+ICsJcmV0dXJuIGNvbnRhaW5lcl9vZihweHAsIHN0
cnVjdCBpbnRlbF9ndCwgcHhwKTsNCj4gPiA+ID4gPiArfQ0KPiA+ID4gPiANCj4gPiA+ID4gSSB0
aGluayBpdCdzIHF1ZXN0aW9uYWJsZSB0byBjbGFpbSB0aGUgcGFyYW1ldGVyIGlzIGNvbnN0LCB3
aGVuIHlvdSBjYW4NCj4gPiA+ID4gZG86DQo+ID4gPiA+IA0KPiA+ID4gPiAJY29uc3Qgc3RydWN0
IGludGVsX3B4cCAqY29uc3RfcHhwID0gc29tZXRoaW5nOw0KPiA+ID4gPiAJc3RydWN0IGludGVs
X3B4cCAqcHhwID0gJnB4cF90b19ndChjb25zdF9weHApLT5weHA7DQo+ID4gPiA+IA0KPiA+ID4g
PiBCUiwNCj4gPiA+ID4gSmFuaS4NCj4gPiA+ID4gDQo+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ICtz
dGF0aWMgaW5saW5lIGJvb2wgaW50ZWxfcHhwX2lzX2VuYWJsZWQoY29uc3Qgc3RydWN0IGludGVs
X3B4cCAqcHhwKQ0KPiA+ID4gPiA+ICt7DQo+ID4gPiA+ID4gKwlyZXR1cm4gcHhwLT5jZTsNCj4g
PiA+ID4gPiArfQ0KPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiArI2lmZGVmIENPTkZJR19EUk1fSTkx
NV9QWFANCj4gPiA+ID4gPiArdm9pZCBpbnRlbF9weHBfaW5pdChzdHJ1Y3QgaW50ZWxfcHhwICpw
eHApOw0KPiA+ID4gPiA+ICt2b2lkIGludGVsX3B4cF9maW5pKHN0cnVjdCBpbnRlbF9weHAgKnB4
cCk7DQo+ID4gPiA+ID4gKyNlbHNlDQo+ID4gPiA+ID4gK3N0YXRpYyBpbmxpbmUgdm9pZCBpbnRl
bF9weHBfaW5pdChzdHJ1Y3QgaW50ZWxfcHhwICpweHApDQo+ID4gPiA+ID4gK3sNCj4gPiA+ID4g
PiArfQ0KPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiArc3RhdGljIGlubGluZSB2b2lkIGludGVsX3B4
cF9maW5pKHN0cnVjdCBpbnRlbF9weHAgKnB4cCkNCj4gPiA+ID4gPiArew0KPiA+ID4gPiA+ICt9
DQo+ID4gPiA+ID4gKyNlbmRpZg0KPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiArI2VuZGlmIC8qIF9f
SU5URUxfUFhQX0hfXyAqLw0KPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9weHAvaW50ZWxfcHhwX3R5cGVzLmggYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9weHAvaW50
ZWxfcHhwX3R5cGVzLmgNCj4gPiA+ID4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+ID4gPiA+
IGluZGV4IDAwMDAwMDAwMDAwMC4uYmQxMmM1MjBlNjBhDQo+ID4gPiA+ID4gLS0tIC9kZXYvbnVs
bA0KPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L3B4cC9pbnRlbF9weHBfdHlw
ZXMuaA0KPiA+ID4gPiA+IEBAIC0wLDAgKzEsMTUgQEANCj4gPiA+ID4gPiArLyogU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IE1JVCAqLw0KPiA+ID4gPiA+ICsvKg0KPiA+ID4gPiA+ICsgKiBDb3B5
cmlnaHQoYykgMjAyMCwgSW50ZWwgQ29ycG9yYXRpb24uIEFsbCByaWdodHMgcmVzZXJ2ZWQuDQo+
ID4gPiA+ID4gKyAqLw0KPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiArI2lmbmRlZiBfX0lOVEVMX1BY
UF9UWVBFU19IX18NCj4gPiA+ID4gPiArI2RlZmluZSBfX0lOVEVMX1BYUF9UWVBFU19IX18NCj4g
PiA+ID4gPiArDQo+ID4gPiA+ID4gK3N0cnVjdCBpbnRlbF9jb250ZXh0Ow0KPiA+ID4gPiA+ICsN
Cj4gPiA+ID4gPiArc3RydWN0IGludGVsX3B4cCB7DQo+ID4gPiA+ID4gKwlzdHJ1Y3QgaW50ZWxf
Y29udGV4dCAqY2U7DQo+ID4gPiA+ID4gK307DQo+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ICsjZW5k
aWYgLyogX19JTlRFTF9QWFBfVFlQRVNfSF9fICovDQo+ID4gPiA+IA0KPiA+ID4gPiAtLSANCj4g
PiA+ID4gSmFuaSBOaWt1bGEsIEludGVsIE9wZW4gU291cmNlIEdyYXBoaWNzIENlbnRlcg0KPiA+
IA0KPiA+IC0tIA0KPiA+IEphbmkgTmlrdWxhLCBJbnRlbCBPcGVuIFNvdXJjZSBHcmFwaGljcyBD
ZW50ZXINCg0K
