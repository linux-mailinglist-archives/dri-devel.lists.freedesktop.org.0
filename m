Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B9B6F64C2
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 08:11:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 567A410E15A;
	Thu,  4 May 2023 06:11:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD01E10E15A;
 Thu,  4 May 2023 06:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683180695; x=1714716695;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=IkuTZIH7OoRi/4kPo7rhKJOBbCMzOg+JuQ2xr08sXj0=;
 b=Ktn41+hiiIJstHd16D2XZASR9BjroowAEpHbGshwcVEAgHljyptHEAfq
 llnDfY8JjHMDT3Km81Ln0ZYLJFtnC+Y6HQFWA16Ylom0S8me+h17e80u3
 4e694+nAnc18IVhzlIBf3cY4lcPSDAO3WWzT7CAPBK8zbkkhAPrUtyGST
 izqgbPgTYZP97lKqyDHGTXtWP7hnGUZPbwqZrz927+XY2iNchi2yOTmW3
 r23SL7dJ++hax3xSzvOAJpLo3KJfBzzHyG2jE4lTHnDJJCSCc6hfX4I1z
 6tfORMscIEVhG1WcB1gi1RNeLtWV1mPuojdER5MEKIgvO/vdsoi/tdoB6 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="351833458"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="351833458"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 23:11:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="808568900"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="808568900"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 03 May 2023 23:11:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 3 May 2023 23:11:33 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 3 May 2023 23:11:33 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 3 May 2023 23:11:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I5/VIlGDU3Mb/l1EoEt07JaJM1QRi8zci1u/D8tCGuPKEwwrTvcqlmo1t9f7P0KvBaRFFu3/vG7VaCEJYuBp5iP/sLJUZUg4HYvjaC5cH815PxrpKLw2aTJM/2BmJiJwfVsrUpSYvz8eHaHnS03gg+aU7xbnqjKTyhPwSws8vmVWXb04s9pIn34NL26O6RLpFNXROHy8gDIDL8iZeXZ8gVKy/QDE74liCs2HHdPx56GnM3LHJSYyfAiLvtXXt9JuvDqiJKxLYtJ4jXdAYsk0czwMuwPFvebhNrMz3oxa2JjpaZxrgGVoveZVK0KOb4/YVcTR8O+mWoXEAEl99il++g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IkuTZIH7OoRi/4kPo7rhKJOBbCMzOg+JuQ2xr08sXj0=;
 b=b7y3vOfNlR8jtxFD7W5AvGjkBGh3v+XvZ0xBvdAfjTxB8+vogHCWzQ0iZVQ4EeK/z26csF15HaFA8LSDT2gMQ71zeosK0Sbngz+2Hp7nD0DKyWoaSWf9mU9TGsfjjGPOkd9HuUTIy6oDcAuO5OlcA61XcdLewqroOjVKLfrPB03vIp+IqPXxUSLHOJNNtQSxaSzhZfXL+7opuzUa1pNRI74868sP8zCbYrJWSmGUn8S7SYI2NUsIzS8YGfZSPywjIz5TT0wRmP3L592Wz+bOeFTEvXZDIUVU1UdyamTN94xaidKSfzsqMuhU2CfCQjVLMfi8hZshNXNn5gXP8xmbNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 DS0PR11MB7560.namprd11.prod.outlook.com (2603:10b6:8:14b::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.26; Thu, 4 May 2023 06:11:28 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3%5]) with mapi id 15.20.6363.022; Thu, 4 May 2023
 06:11:28 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v3 4/4] drm/i915/gsc: add support for GSC proxy interrupt
Thread-Topic: [PATCH v3 4/4] drm/i915/gsc: add support for GSC proxy interrupt
Thread-Index: AQHZfRSqgnpwfQyoU0mR2wlrsC6eM69JpFoA
Date: Thu, 4 May 2023 06:11:27 +0000
Message-ID: <785d80d9841820aa8fc49d16d55e69099ed672c7.camel@intel.com>
References: <20230502163854.317653-1-daniele.ceraolospurio@intel.com>
 <20230502163854.317653-5-daniele.ceraolospurio@intel.com>
In-Reply-To: <20230502163854.317653-5-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|DS0PR11MB7560:EE_
x-ms-office365-filtering-correlation-id: f69b00b5-957a-4e1e-0ec4-08db4c6665ba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6sDNEVYk2jMXiiQQc4s+7r7cb/wNeV57iM0+dsLH5lKv3q9kUbSO88rf/FWlkC8hcQ2xgtRvxQIBu+hSXuA/owyMGy8BtnphTC/8/7DmYB8c7fiAKlPQfPjq+pO9jFjDkVFaoYq/1+KTUO0uHThjPF7xHmyluUKYaAftt9Dkg3/KSKoQ/mKIduNpwnnzwZUTHJZiWJXL2WOVctg0Z+UV4IM4oew7QrdX8sA0rBcjhnTpdVZMVF47HKwc8EObcM2PiEJxACtIKNfxcjmPxr8/PoqfIb6sIi0ien/mxLUFnBD9rF2fGEyrznmJwzgKuyjOrkmcTaOEFJjVurjyq30JXIJffyjij51MZz/2jHHYGQE8fyJIQYejkowO3owk6plB17BPh4fH4sfT4Xsj+r6bqjQBtacCi5iiRVd6mKTikTpcpmWKTF4yIJ0SUId1ge13c0/1almEeEVxC22l4JcVgFGN6tjOeUS/vfeukSU3luFxgn31UsLWgbQAspzYRWAUVoja8UZYuxj4NGiH4GcM5Yd9SkTN2yPcAb/ixxE9fUIHw216wsDctYmdDAQUgPrCuEVzhY+HWt7WgSLwZP+zE780XKiXrakbsOSFpOF7z3Ayz2eU7uaQb/UyaRkugIJh
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(366004)(376002)(136003)(39860400002)(396003)(451199021)(66446008)(36756003)(4326008)(66556008)(66476007)(450100002)(76116006)(91956017)(64756008)(83380400001)(66946007)(6512007)(6506007)(26005)(186003)(2906002)(4744005)(110136005)(478600001)(2616005)(38100700002)(82960400001)(8676002)(122000001)(8936002)(38070700005)(86362001)(41300700001)(6486002)(71200400001)(5660300002)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VEU1V2pTR0xFZzgyOUZ3VEp2VEltSUpLUFo5bmlING96LzNhVFFjUDJTckhN?=
 =?utf-8?B?b1hrd1pYNFR0K01aMFBiOEhhd3grRGVUREpycy9LR0RydlZVTWpyLzR5NndE?=
 =?utf-8?B?Q0pzR05PUHp4c092VkN1S3dOY3EyRzB2OFltVWJJekREVEJoRHNhRlFleFZJ?=
 =?utf-8?B?NmVmMHplenBZNVg5WlBzaHFYczBaUHdUc3A3ZjhQbjBJK0s5RGE3d00ycUJE?=
 =?utf-8?B?UXcxcmRzRW4rZlNKU3dCVmVEb0VWL3F4UmVzdDRUNVZRdlRKazNMN0dScGV6?=
 =?utf-8?B?V3FJM25JYjhRWmtKNVlGcnJEa2JSUEUzZDFSaG1ydWMyd3VPeHoxbExPUTlW?=
 =?utf-8?B?RWpSTkhwODFySVNLSVV5RWg1M3BmdEg0aXpUb1gydVdPOTNERy9JYmJtYTMv?=
 =?utf-8?B?T0pFRG1YcEgzWDVkdlJQSVhtOElyOGJ5UkVUYTBiNjdtUHpCY3VHd0NiSW81?=
 =?utf-8?B?cUFuWXhpa3BDclZINFllSUJhc3RQSHdVNlVEakZJSFRMM0xrd2EvKzU2N0FB?=
 =?utf-8?B?a2xyMzJoQ1c3TGNka2hvTEdFSnZkY09wRU9yTG0vOXpEQkIyQjNoblhFWm9Y?=
 =?utf-8?B?ZVZRc2tUZFNtRmV0Yks2OUhkKzZkOWxTRUtPZzZnR1pBUVFKdFQycHowWWN0?=
 =?utf-8?B?YmtWZmo2cS80b05UeVhaSDdmUytaaTJpQnF3S1h3WFZOTWRBdFJuaHMxWmVx?=
 =?utf-8?B?Tm81Nzc2cktEdDl4V2NWLzBNLzZMbTN1ZkV5dVpiUWE2dlpNR3c5OXQ3THZ1?=
 =?utf-8?B?OXQxL0RnNUw2Sm5aZzV2ODcxRnhZSk1lbGhjLzlPSTNubFFYbnhNeXY2cmMy?=
 =?utf-8?B?UEFnVFI0Y2VtdkhHYldPbEtPZzdtajVwbUhxYzMzb3laN0YxV1dVTWFNNnJX?=
 =?utf-8?B?Q1FjVTBvTjNUdFd0Z3lreUhhditNWDFoa25BNlRhSGNGbU9VQy9yeERHSnJt?=
 =?utf-8?B?UmQycURQVHFHd3crYzZRdmMzZFpzclRZNjRBeFNZdVI4cTVLcTEyZ1dqTWNM?=
 =?utf-8?B?aVJSS1F0ekhyS0RtMHhaS2paMXU5R2JwV3BTTzRpc2VmTURvQ1liSUg0K0dp?=
 =?utf-8?B?VzY0S0dDZXFScGR4THJ5SGNZb1I2NURlZzVPTmpNNmtvM2NaYjdnRkZoVWtr?=
 =?utf-8?B?dzRpRFJQNWFrS01wQTBpWFkwMVVjNVN6endUZkovNVV3amk3V3l0M3RUZ3pP?=
 =?utf-8?B?TmZDOEZ4UDg0TWhqd0V0NTBMVUVkT2RaS0llTWdIaDdka3JBWVVReGFQbTFI?=
 =?utf-8?B?VGt5WExxQXZQdXFGZ1pUamROMUlzdllvUVVjZWYwMmxGeHYwVzJGaTlwaEJK?=
 =?utf-8?B?UVZEWW5LbXFjTFpWSGVSSnNxS0Z3bUkxdmR2SFpmMEYxNlVEaG8rUS9YUlIv?=
 =?utf-8?B?bVVJWjE2TmlKZVRsNmpzOCs4NmNVb1p2R2lzb1dOYmZ4alhMcUsvblAyMWpl?=
 =?utf-8?B?NUNMaldZOE5wTjJIZ29hR3BBU0NZS29aQit0cGxuRE0rRHRWbUxOZDhORkp5?=
 =?utf-8?B?dkp5dTF2ZFpWMVY4SGM5SW5RWHpRQ3JudU9JcFc2MFpHaGNwcmljZ2s1SVBL?=
 =?utf-8?B?Z2JobHdFN3pvZmQycUdLMFU3bDQ2WGw3NDR3THpFUmdEWVdCTm5UaTBZNWRv?=
 =?utf-8?B?a2hxL2prL3FNY1dzQ1JtYlVRWHk4V095K3YxUGZuaE1Wd3ZaZWNYNDcxK2Ra?=
 =?utf-8?B?SU1ZSVRFYVJzblptR1lvLzcwM1Q2M1BKNFRWaGsvSEhQS0tkcGFKTGJ4VzRQ?=
 =?utf-8?B?ZlovSHl5WVRhQnZxNFZpeExpZXV1QXZvcDdNVmpZME05UlBhT2Z6WjM5a1ds?=
 =?utf-8?B?cUQ2OVNUUHNYOTFFeExCeE1lQmNxYmhHOUtTcFoxRGN6K3NvN1pSYWlIZXJF?=
 =?utf-8?B?TlRaTitMTXlMNExnZzZ5V3N5OVA3cUlVMjJYZU51NmFqT0tFL2xmRHdIR29H?=
 =?utf-8?B?YXI5aXFZVEZkQ3N1cWVnOTA1eU9RaHY1aHRBQWhTUlg0VjE0T2V5bmIxTlQ4?=
 =?utf-8?B?aGpJaSt5bDhBZkZuSmdhaEl4NGFXYmRWM0NEYlo2aDh4b1Rlb1JTY3cwTmdl?=
 =?utf-8?B?TVFHTFl6V2gwZllQV3dxM2Rjc0Y1VGhRdFdCeVAxUWQ5T1l6WW9hQXowSmV6?=
 =?utf-8?B?dGpRVzJJL3BPbTN0QWpUZ1c2QUpKMnJjRlNzOFNVdkNhZk5ZOWF1VnV5eTkv?=
 =?utf-8?Q?0u06scsgHAgDVmnl7YPD7N4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AB881C8FE890414A9A84846DD8350B06@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f69b00b5-957a-4e1e-0ec4-08db4c6665ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2023 06:11:27.9995 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WwLxMcTgWQzvhtba56ruLSmmeiN6jB3QgrMdVu2qjF6ddVOPvWQZOI0y1/TBHEIbxVTiZY2G3HS7f/tZt1n0GakBMYyWUWh8BbCu1/aNzl4/dT1pBlSrkAivPx579ZXc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7560
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

T24gVHVlLCAyMDIzLTA1LTAyIGF0IDA5OjM4IC0wNzAwLCBDZXJhb2xvIFNwdXJpbywgRGFuaWVs
ZSB3cm90ZToNCj4gVGhlIEdTQyBub3RpZmllcyB1cyBvZiBhIHByb3h5IHJlcXVlc3QgdmlhIHRo
ZSBIRUNJMiBpbnRlcnJ1cHQuIFRoZQ0KPiBpbnRlcnJ1cHQgbXVzdCBiZSBlbmFibGVkIGJvdGgg
aW4gdGhlIEhFQ0kgbGF5ZXIgYW5kIGluIG91ciB1c3VhbCBndCBpcnENCj4gcHJvZ3JhbW1pbmc7
IGZvciB0aGUgbGF0dGVyLCB0aGUgaW50ZXJydXB0IGlzIGVuYWJsZWQgdmlhIHRoZSBzYW1lIGVu
YWJsZQ0KPiByZWdpc3RlciBhcyB0aGUgR1NDIENTLCBidXQgaXQgZG9lcyBoYXZlIGl0cyBvd24g
bWFzayByZWdpc3Rlci4gV2hlbiB0aGUNCj4gaW50ZXJydXB0IGlzIHJlY2VpdmVkLCB3ZSBhbHNv
IG5lZWQgdG8gZGUtYXNzZXJ0IGl0IGluIGJvdGggbGF5ZXJzLg0KPiANCj4gVGhlIGhhbmRsaW5n
IG9mIHRoZSBwcm94eSByZXF1ZXN0IGlzIGRlZmVycmVkIHRvIHRoZSBzYW1lIHdvcmtlciB0aGF0
IHdlDQo+IHVzZSBmb3IgR1NDIGxvYWQuIE5ldyBmbGFncyBoYXZlIGJlZW4gYWRkZWQgdG8gZGlz
dGluZ3Vpc2ggYmV0d2VlbiB0aGUNCj4gaW5pdCBjYXNlIGFuZCB0aGUgcHJveHkgaW50ZXJydXB0
Lg0KPiANCj4gdjI6IE1ha2Ugc3VyZSBub3QgdG8gc2V0IHRoZSByZXNldCBiaXQgd2hlbiBlbmFi
bGluZy9kaXNhYmxpbmcgdGhlIEdTQw0KPiBpbnRlcnJ1cHRzLCBmaXggZGVmaW5lcyAoQWxhbikN
Cj4gDQo+IHYzOiByZWJhc2Ugb24gcHJveHkgc3RhdHVzIHJlZ2lzdGVyIGNoZWNrDQo+IA0KYWxh
bjpzbmlwDQpSZXZpZXdlZC1ieTogQWxhbiBQcmV2aW4gPGFsYW4ucHJldmluLnRlcmVzLmFsZXhp
c0BpbnRlbC5jb20+DQo=
