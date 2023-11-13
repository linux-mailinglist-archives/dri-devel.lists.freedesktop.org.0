Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7797EA6E8
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 00:20:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0840F10E069;
	Mon, 13 Nov 2023 23:20:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9890010E069;
 Mon, 13 Nov 2023 23:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699917629; x=1731453629;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=E6pKm9CqDCb++eyM1CAdOLeeik7yIoowLr46QspJvSQ=;
 b=WzFez2OecRkOVkrBhRDyWWgGReQpOQsN+ipg3ILLoHaH0EBC89iExFBS
 rCjYehdkBRE4GJNXb5jr9e1YHVHP0rnDRJahgCOrgJALZmd5ImTYpZ570
 kuEsp3lixLq6xIkejSOAz/fIIzmUpWNT6rmfDkfZT838x4FTZVczH32qm
 o9mRJgqwxMOuSy64ECjTqNhDEEJFWccwS3/UcZeKGpF2kf/loqu1JoP4E
 H+Nnhjz4i33HGdEVoUIK4arq3Xs3Iv5Fomo4/Kj9oBCm/0CpzDqlpj5NQ
 Ng1iA52Z8qk31SgVp9pLxV37Xga87fGbfH1ZLAKUocZnTeTDjxJhp+ZrM w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="380920801"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="380920801"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 15:20:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="855103339"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="855103339"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Nov 2023 15:20:28 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 15:20:27 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 13 Nov 2023 15:20:27 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 13 Nov 2023 15:20:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VYfY31Y+AwfnJj8gH0gchlQPLMh+c8QJNVUigeCOyyYyvoxQZAkXGcpkWEoB7siUJlD2aT4ByrflAUX6HWlykvBVMVPyvo3OYzbk2YeU3Igdpk1f3qEULFNg0sY13EMwhOETCA9Hi1E9EcuZSM4eDVz3KnOpYkhsSISWsraLU7mRiK8usV4ozLY3G3bZ5ugJn6pq+Vs/ohXRg5SPc7PRx/CbrEGh0ov9JE8DoG94eYhaiwWK5frUbYdCILkCtz1v4cctvOVy2b5lnrRzMGBglzODe5NEEjki2yAOolCn54ipKoSCDWHCVulrjuWk7O1spUVWjfEvXDyEsaR7v67zYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E6pKm9CqDCb++eyM1CAdOLeeik7yIoowLr46QspJvSQ=;
 b=DArrtQf4vHTTzZsG5gZ3SbnfWi2iiwlzru7Zl7C3sjGdivD4Izug2yzhVNsngfu+haJdTY8pRDEYwX13mPb+eROItlkCp8EULqgfQr1jsqZgEtk+OPDIbaXICGuvHhKyzBDhDkTI+Coc6Gc8uT4agDoJAuchHa0Ro+YjM9K2Vmh4Yilb+WvURRtB2UyOh3UMgnE68sGewK86vuiyVZQ3nkosJRdL/dUROGRRmePvHyCFGLChWFYwCOu6TTnR74xDnn3Rtl6T5x4xk/BUsVkx/DOfMAnrkmmXWKAzS0uNs9Xsjg6GQdROp4E0QU8JwUHxnK0QKGpCAfIUGndnQJYnwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 PH0PR11MB4917.namprd11.prod.outlook.com (2603:10b6:510:32::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.29; Mon, 13 Nov 2023 23:20:25 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::d070:1879:5b04:5f57]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::d070:1879:5b04:5f57%4]) with mapi id 15.20.6977.029; Mon, 13 Nov 2023
 23:20:25 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH] drm/i915: Initialize residency registers earlier
Thread-Topic: [PATCH] drm/i915: Initialize residency registers earlier
Thread-Index: AQHaC4tTz7M1R4USIEC65diQb4wrj7B4+N2A
Date: Mon, 13 Nov 2023 23:20:25 +0000
Message-ID: <432ae9008c73ebdbb00ebe0b48ab97aee17b2e15.camel@intel.com>
References: <20231030234527.2285179-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20231030234527.2285179-1-vinay.belgaumkar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.50.0-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|PH0PR11MB4917:EE_
x-ms-office365-filtering-correlation-id: d2ae23ac-5a95-414d-2b2e-08dbe49f1db8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q6COMKRUWBj9J9fGMFSlrcSPacNCRelclaYHETRAqQ2vwwA6oGOBzgK0YH+mbrySTZIXzc59F6UR53r5k0xMUn3x9pEyh2/jYbNaXnOTTdbL12S/OVVYrqZ6DbvyRWvI3UANWOP46sagNc9aFIMlReLMmHxcS8uKyj+VhmD1x6/Ixfz5EbIzPs3akiNL68GEj04pli0EnGTTrVgR+7uJRU+kRGpSqqmsdZDntbovqvZEX/k4hEX2cpnF1bjWYzZjKccB7YLRRprNNiNQreI5uT14e0mNr8tIU1GUjoeW8DEk3psHm7FHuA1csBTUwxJwYTN0UW9JCxG64jG2hwNJfR1Jww1BrujI6aP6LDbkXFN+PBCOALg28vO9OpyN3BZqLM+FIyz8Ak8H6A88gzECuJpT8Bi3R97cizCUgka+yrALJlWgZiLDf44xdhtbcHZpVtZr1Uqob2dWkQ9+C/QccmzsDZTHelEkkczOvMLZzSKBHrpAdZO+DLBQfCDAJtjEDNDwM0qnW8Ge1NXGnhgOI98q2/yrKXp6iWgLOKSh76DBCS6O+VY90upbxfAchTk6pa3qZ12G12xZhhq7yxU0Rl+yKnQ+9hOepJA5YoCZoTVCPp5H2i3OVTU/ZAY5g7CL
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(366004)(376002)(39860400002)(346002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(66446008)(66556008)(66476007)(76116006)(66946007)(6636002)(91956017)(110136005)(64756008)(38100700002)(38070700009)(36756003)(82960400001)(86362001)(316002)(6512007)(450100002)(83380400001)(71200400001)(122000001)(26005)(2616005)(6506007)(4001150100001)(2906002)(478600001)(6486002)(5660300002)(8676002)(41300700001)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QWw2ejNNeDhtQWxVV25QKzllaGhFbnJoaU1kblJ2WmxabU5jaHBlVHN2ZE5x?=
 =?utf-8?B?RVhkdHM3S28xMnhxYlZkMkdObzRxaER0Vk5RTmdNV3liTUM1SDZXbExUZVBw?=
 =?utf-8?B?OVcvVjZ4dWMyTm1DZ0syOXZDQ3dFL2pxdUlzUzIvV3dUdHRnQWxQT1VTS2Rt?=
 =?utf-8?B?WENJUVFxU1NtMHdGTUpoZ3JJRndEK0pmK2tWaTZ5OUJEbkVFSnNrMjVZdEtO?=
 =?utf-8?B?MTlyNEF4QWN0K1FodE1vVU4xVEMvVWRJb0xOcHFUWVNPUmJNWU9qSW1NZGZs?=
 =?utf-8?B?a2svbGJBa0M5NW1ia2NSMkR1OWlzZCs0QXM5Z2ZCaWtHZmlLK0RjRVFhcVpD?=
 =?utf-8?B?ME5uV3NLSFQ2TDA4dmZMYjl4a0JteFYzNDdxQUxCL1p6dUlGSmJDVXY2Tjdo?=
 =?utf-8?B?KzJJdEthc2k4TTJYR3FzVFpLSXVXc25ybzhHRk8zRFFSd2QwMDk4dWVDNHYz?=
 =?utf-8?B?MHdpdms2ME9mN24rdGNxZHRXRDdTdm5tN2NKaUpzMlpMZlFkYUlPdEsxVWlx?=
 =?utf-8?B?V01Pd01aZENKMUlERUlQMm8vbjcwaEZVaGVPMTRtWUg3MXkxNUZFR3VweHFu?=
 =?utf-8?B?YW85bVJ3YldzVWtsQjM0eGs3V0hocDRlNDhMUVV3R0x2cjRYSHYwelMvVjBr?=
 =?utf-8?B?bHI0bm5qbGRzbGhOSFN0cWtLTnRxQUh5MmxVT245YWEvWFE0V3VHZEVTaTdx?=
 =?utf-8?B?VFhKNHU5S2RlcGgrK1VySkZSdEZxYldPWFlrZG5pbnNqVEpsMjkzZHJqWkxl?=
 =?utf-8?B?SFg0MXpkcXNjK2N0WUM4UnY2T1l0aFBTeHROai9lQ0tJMlp1d2N0RDcvbVk0?=
 =?utf-8?B?R0wzdFQ2YUxXcUlBVjU4TEpJSDliMEdKS05HbWZBZ1BaaWpIalRvSytoZnpS?=
 =?utf-8?B?Vkc4bk9BMElZc1FHaHBIbjVwWk5Nd0dBZzBoSjZDeGJQQlVWQTAzY3hFbG9F?=
 =?utf-8?B?RHJUczZsRnErdmduWEVzZUxBcFJlTERqOEI1WXV3YmF2ZU8wSldWUjN3Mmoz?=
 =?utf-8?B?aElBN014Q2JuNW9kNjArSzJiN1B0bGJPV3NUWlZ5TjAvc1NnZnZxdFBMaTRh?=
 =?utf-8?B?MVphdHFuRm1aZENjdTFtbnYxMlJmaG5ieGJLazh4dkZIQjVEVEVYZEJuRE5m?=
 =?utf-8?B?ZXFsYjFsUjlaK2pmcmozSnA5c2N0dGZVZFZPZXJheWxUcmdWeS9GMkludFV1?=
 =?utf-8?B?K1RkYXNLM01iUHpmdTYvNm1iS2dSQS9iaXRERy9DZWF0djlib0tTU1lrVzBW?=
 =?utf-8?B?MDR2K1A4ek9iMXBjYzYyYi96c3FnV3VRNVIrYnp5aWNSY09rYTdqVkZ1VXZ2?=
 =?utf-8?B?YXhQTXZuK3Y3M2k3WHhmM0JUemh4ZzhLK05SU0V1Nmx5SHU0b0dPTnEwUjhk?=
 =?utf-8?B?czB3VEpXVkMwV2xRMWZPcFNNd0ZJRU9XbUFzZWhLYjhxdmVmbXNCcXRYVHN0?=
 =?utf-8?B?WGxWVUg3ZUloR3ptOEdjU3pSSjEyMkNDbnFFWmFxK3AweG9Sa3FkVGh4WkhO?=
 =?utf-8?B?SzFrM1NmSEFpZTJveDZNdGpBV3Z0QTQ2NFd4QWJJZDBVUVB3RkdmUEE2OXkv?=
 =?utf-8?B?ZzZoNHZrZUZ2Wm5lNjRtWE1ReHQ5Y0dqakJBWmp2eWE4Tkt1dEZzOUtZV1ZV?=
 =?utf-8?B?NmVwdXlRYmYrNkl2VTQvR3hoYW5adS94dUtDNnVRYTE3Y0NUU2dwQUNXd1My?=
 =?utf-8?B?L0IwY2FkSzdWWlpyMldTT3FaZU5CUzRZUTlFU01QUEFHL01SRE5lY1JZYjVS?=
 =?utf-8?B?WmJDMUMvbVYrRzBMRDh4YTdpaVJXb3BZUGlGTFQ1MWdoMzFsVWMxKzIwOTZ4?=
 =?utf-8?B?cEZKem5LK3hKNHBZRUUwSDB2VTJMbWpmTFJ1d3c4czA1RHVkUzZQZmt5UDdt?=
 =?utf-8?B?YzZWWEQ5emcyUFhkUFpOdGhKNldNcWRBNUF0UTZ0YkhFS0Q5a1BkU2h3cFFQ?=
 =?utf-8?B?b0NLdnRGMjBaaWJpZHpNU1FqeGF1djJJdU50ZzIyTzdzYTNuWUVaalVhRnhN?=
 =?utf-8?B?ZVJObThDc3R1dFh6WlhCYmw5aVBTbUdBTUJRZnlZKzVUY3ExWFE5RDVDc0hB?=
 =?utf-8?B?QldFMjkyOVkwRFVCTWhWUmdMWFcvVWNnZGtlTnBSc3liTXNhWmZCOUg0eFB0?=
 =?utf-8?B?Y3BWU0ZZM3dHaGxzaTlDaU50ZTRqOXJ4cGhQc1ZSbFVBRjM4dTB1WVhRaGxo?=
 =?utf-8?Q?6wf13QC31suvSJ0obk1/Pdg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <045745865AFF72488B4BD373F524DE02@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2ae23ac-5a95-414d-2b2e-08dbe49f1db8
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2023 23:20:25.2162 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eVocGb0j0TT10Xwneha3e4Um16AUKQrFhXmCQd2nVB2J6YQNAJXkXEY8UlqiGOdDvIWxbVBOs9j79rSPzBcfPQAvJAEJvvPyuJ0fGsTSoVCTVWQPf1GYboVQl095rR2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4917
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

T24gTW9uLCAyMDIzLTEwLTMwIGF0IDE2OjQ1IC0wNzAwLCBCZWxnYXVta2FyLCBWaW5heSB3cm90
ZToNCmFsYW46c2tpcA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9yYzYu
Yw0KPiBAQCAtNjA4LDExICs2MDgsMTMgQEAgdm9pZCBpbnRlbF9yYzZfaW5pdChzdHJ1Y3QgaW50
ZWxfcmM2ICpyYzYpDQo+ICAJLyogRGlzYWJsZSBydW50aW1lLXBtIHVudGlsIHdlIGNhbiBzYXZl
IHRoZSBHUFUgc3RhdGUgd2l0aCByYzYgcGN0eCAqLw0KPiAgCXJwbV9nZXQocmM2KTsNCj4gIA0K
PiAtCWlmICghcmM2X3N1cHBvcnRlZChyYzYpKQ0KPiAtCQlyZXR1cm47DQo+IC0NCj4gIAlyYzZf
cmVzX3JlZ19pbml0KHJjNik7DQo+ICANCj4gKwlpZiAoIXJjNl9zdXBwb3J0ZWQocmM2KSkgew0K
PiArCQlycG1fcHV0KHJjNik7DQo+ICsJCXJldHVybjsNCj4gKwl9DQo+ICsNCj4gIAlpZiAoSVNf
Q0hFUlJZVklFVyhpOTE1KSkNCj4gIAkJZXJyID0gY2h2X3JjNl9pbml0KHJjNik7DQo+ICAJZWxz
ZSBpZiAoSVNfVkFMTEVZVklFVyhpOTE1KSkNCg0KYWxhbjogYXMgZmFyIGFzIHRoZSBidWcgdGhp
cyBwYXRjaCBpcyBhZGRyZXNzaW5nICAoaS5lLiBlbnN1cmluZyB0aGF0DQppbnRlbF9yYzZfcHJp
bnRfcmVzaWRlbmN5IGhhcyB2YWxpZCByYzYucmVzX3JlZyB2YWx1ZXMgZm9yIGNvcnJlY3QgZHBy
Yw0KZGVidWdmcyBvdXRwdXQgd2hlbiByYzYgaXMgZGlzYWJsZWQpIGFuZCByZWxlYXNlIHRoZSBy
cG0sIHRoaXMgbG9va3MgZ29vZA0KdG8gbWUuDQoNCkhvd2V2ZXIsIHdoZW4gbG9va2luZyBhdCB0
aGUgb3RoZXIgY29kZSBmbG93cyBhcm91bmQgdGhlIGludGVsX3JjNl9pbml0L2ZpbmkNCmFuZCBp
bnRlbF9yYzZfZW5hYmxlL2Rpc2FibGUsIGkgbXVzdCBwb2ludCBvdXQgdGhhdCB0aGUgY2FsbHMg
dG8gcnBtX2dldA0KYW5kIHJwbV9wdXQgZnJvbSB0aGVzZSBmdW5jdGlvbnMgZG9uJ3Qgc2VlbSB0
byBiZSBkZXNpZ25lZCB3aXRoIHByb3Blcg0KbWlycm9yLWluZy4gRm9yIGV4YW1wbGUgZHVyaW5n
IGRyaXZlciBzdGFydHVwLCBpbnRlbF9yYzZfaW5pdCAod2hpY2ggaXMgY2FsbGVkDQpieSBpbnRl
bF9ndF9wbV9pbml0KSBjYWxscyBycG1fZ2V0IGF0IHRoZSBzdGFydCBidXQgZG9lc24ndCBjYWxs
IHJwbV9wdXQNCmJlZm9yZSBpdCByZXR1cm5zLiBCdXQgYmFjayB1cCB0aGUgY2FsbHN0YWNrIGlu
IGludGVsX2d0X2luaXQsDQphZnRlciBpbnRlbF9ndF9wbV9pbml0LCBhIGNvdXBsZSBvZiBzdWJz
eXN0ZW1zIGdldCBpbnRpYWxpemVkIGJlZm9yZSBpbnRlbF9ndF9yZXN1bWUNCmlzIGNhbGxlZCAt
IHdoaWNoIGluIHR1cm4gY2FsbHMgaW50ZWxfcmM2X2VuYWJsZSB3aGljaCBkb2VzIHRoZSBycG1f
cHV0IGF0IGl0cyBlbmQuDQpIb3dldmVyIGJlZm9yZSB0aGF0IGdldCBhbmQgcHV0LCBpIHNlZSBz
ZXZlcmFsIGVycm9yIHBhdGhzIHRoYXQgdHJpZ2dlciBjbGVhbnVwcw0KKGxlYWRpbmcgZXZlbnR1
YWxseSB0byBkcml2ZXIgbG9hZCBmYWlsdXJlKSwgYnV0IGkgdGhpbmsgc29tZSBjYXNlcyBhcmUg
Y29tcGxldGVseQ0KbWlzc2luZyB0aGUgcHV0X3JwbSB0aGF0IGludGVsX3JjNl9pbml0IHRvb2su
IEFkZGl0aW9uYWxseSwgdGhlIGZ1bmN0aW9uIG5hbWVzIG9mDQpyYzZfaW5pdCBhbmQgX19nZXRf
cmM2IGluc2lkZSBpOTE1X3BtdS5jIHNlZW1zIHRvIGJlIGNvbmZ1c2luZyBhbHRob3VnaCBzdGF0
aWMuDQpJIHdpc2ggdGhvc2Ugd2VyZSBuYW1lZCBwbXVfcmM2X2luaXQgYW5kIF9fcG11X3JjNl9p
bml0IGFuZCBldGMuDQoNCkFueXdheXMsIGFzIHBlciBvZmZsaW5lIGNvbnZlcnNhdGlvbiwgd2Ug
YXJlIG5vdCB0cnlpbmcgdG8gc29sdmUgZXZlcnkNCmJ1ZyBhbmQgZGVzaWduIGdhcCBpbiB0aGlz
IHBhdGNoIGJ1dCBqdXN0IG9uZSBzcGVjaWZpYyBidWcgZml4LiBTbyBhcw0KcGVyIHRoZSBhZ3Jl
ZWQgY29uZGl0aW9uIHRoYXQgd2UgY3JlYXRlIGEgc2VwYXJhdGUgaW50ZXJuYWwgaXNzdWUNCnRv
IGFkZHJlc3MgdGhpcyAibGFjayBvZiBhIGNsZWFuIG1pcnJvcmVkLWZ1bmN0aW9uIGRlc2lnbiBv
ZiBycG1fZ2V0L3B1dA0KYWNyb3NzIHRoZSByYzYgc3RhcnR1cCBzZXF1ZW5jZXMiLCBoZXJlIGlz
IG15IHJiOg0KDQpSZXZpZXdlZC1ieTogQWxhbiBQcmV2aW4gPGFsYW4ucHJldmluLnRlcmVzLmFs
ZXhpc0BpbnRlbC5jb20+DQoNCg==
