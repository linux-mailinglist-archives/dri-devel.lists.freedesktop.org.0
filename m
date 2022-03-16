Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E57EA4DABBA
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 08:19:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 495A310E52F;
	Wed, 16 Mar 2022 07:19:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C25C10E52F;
 Wed, 16 Mar 2022 07:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647415145; x=1678951145;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MWUlTUWz3GAGr/zpidRgPrtPQNomQ5GzNfvDXr/rjLc=;
 b=Xe+iM2rcaY1+zLgLeIjsx+8Bdtfs2aaSxFavlLkTiJIlat0sYaSz85EL
 0YWBdQ6qkiqsynptotCF8ztSRpO3qFMdSiNTR3KnNRcrbsiw/pdT7Dwlu
 THXz8wlaHm3ZCWgQSu/UXKcvYy5YcBSRnvuMoCIh3N49qJWPbqQfJnyne
 WvDtue9z9tzcRUXp3MZ7f6RPOIWPQioXDe6XhezKsTwHV0kzWJ50gjkra
 diz8KSK7ftQ7taD8WxAUWVmTl04FN7fWj1K+WbDPpJZ9j+9/1ny3RpljD
 7FFYDiVu5ID5DMWzLAeD15r8FD1+C/Ssv7PZQD9MGXr7GGRpuW+uHE4pE A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="342942226"
X-IronPort-AV: E=Sophos;i="5.90,186,1643702400"; d="scan'208";a="342942226"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2022 00:19:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,186,1643702400"; d="scan'208";a="516215571"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 16 Mar 2022 00:19:04 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 16 Mar 2022 00:19:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 16 Mar 2022 00:19:03 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Wed, 16 Mar 2022 00:19:03 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Wed, 16 Mar 2022 00:19:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KPH3OnlH5/MgdZ5cJ8qCOPp6TQlyyjBlc1pWIIXFDzjYNrc4NwACLgoeF/YGKq88hXJbCgYcWqWOUVgq0JLgzx2mWSwkTHT6gBv3A9zIXKWu/NC9wXAMCm2d4VR4xAxOYRFYnPGFk/ThvRGSuJ3HgspC4VlE+oLYSKbr/iwfyghK3o0jDGWLfFLI21RjbBh52Ui2m14PgzYgy6R7HMTPDYfSG7k5UVva4wQrnl+589YbtpEuuU8lNmIqCJSJhc5zuemR+bQpIKEBw1JbS/lWPcDY7bCv8AHklXjsl0sDKbNmEO32p8QKacUMcHLPghDmz8XYYqsLrjTzWJfWnqDIgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MWUlTUWz3GAGr/zpidRgPrtPQNomQ5GzNfvDXr/rjLc=;
 b=AvwsuL/Lnps1Nn7mvxUb5oOOfaIPDNEdWLulA8zgK8sPIRvE/QFSKfw9wa5JvO6Q5GBdnBgkUCzbmBbB0n5gPGdnJHyvMLYiygz+nqZBSWpGn5vD83Yf9M7k22tFYev70CfSuEEdzneLoTUh06gLOg7zlx4KoJHaPxOHqn+qZ1orSSvUglgmBxamFfdM9azVyjieH9nCdIryHu3hQFt6HYxCU/P12ZerCuidCJt9cdrL5p47GhpcgaThOg+9PZFAuNbpQGGC+SJwMYc2rHedtF5p80FXxvG0IXHnvpo6v7q76H7tAwcSpFjD8t7qr0YSwHqYhqmfOnsJNfXzirPqEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2567.namprd11.prod.outlook.com (2603:10b6:a02:c5::32)
 by BN8PR11MB3826.namprd11.prod.outlook.com (2603:10b6:408:84::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Wed, 16 Mar
 2022 07:19:02 +0000
Received: from BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::f1ed:9074:5f82:150d]) by BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::f1ed:9074:5f82:150d%7]) with mapi id 15.20.5061.028; Wed, 16 Mar 2022
 07:19:01 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/i915: avoid concurrent writes to aux_inv
Thread-Topic: [PATCH] drm/i915: avoid concurrent writes to aux_inv
Thread-Index: AQHYMBX99rVLU26gUU6Ga1xGmtOKgKzBgJ8AgAABUKCAACghcA==
Date: Wed, 16 Mar 2022 07:19:01 +0000
Message-ID: <BYAPR11MB25676F9BEBF6FD452BFCCD709A119@BYAPR11MB2567.namprd11.prod.outlook.com>
References: <20220304221407.2416898-1-fei.yang@intel.com>
 <4e16174fd51a0701004b477a825a584dccf667fb.camel@intel.com>
 <BYAPR11MB2567590EC2088F973025329D9A119@BYAPR11MB2567.namprd11.prod.outlook.com>
In-Reply-To: <BYAPR11MB2567590EC2088F973025329D9A119@BYAPR11MB2567.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.401.20
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 544660dc-b843-4255-585b-08da071d3ef7
x-ms-traffictypediagnostic: BN8PR11MB3826:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BN8PR11MB38262B39E41FABC212B9795E9A119@BN8PR11MB3826.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gk6Rfyxik4q8U933ZN8R63x8ZMLUzwwuJRaAqhCAh05kFCGegD7vHHZ6CdeqRRtlsYYCImWLfSjTnEEWhgaA3tlbTA+nWKFF7JYj81cVyH+tEEl0LRRVhG9XB2+yS/WmJvxDhpYEPa62EVR0T4nZaEvSItHg/HaJBMzzTSSFnyrXctE1djxZb9UUFfKJ1nq/G5qY9nY/Lyu3GET7DebSLjTE6gVYpAVfHWex+ZNh8X628hA14VBqKwZIzZsGcGSGeV11QkftKBbntRo/lr1qK1lVv2B772+5B4DT2sOVCqpLnfzfP1KdQqgGFDZ3MQtlLDEGAJ59IryaXeIjFzfqqR4bPHVqLKNciR6DkrxnWkAzt17h7733HbpkYG41Q4kwj4IC/Vr+wTEbJCQg0rrp6CdkTSCm0kz7dHSw2sRF2CxNl97Reiu76U0jgFFI/bdXuDS9TxA0HzVVrdipqGB4YNd+FRTb798lLKigbt4MXLJIbgmJubRHSSe+Lb9Sf7OhF+UTLW4LwIB2Fo6VIqr20sMnPEgCeZ4AmfcVVMCPendFw8oQGNKdzCiKqrjBKzB9FTo+AfhIKaJcYIdV2rbaYdaJcFmCyaoJq+GZjGPsUi3C571us8HNBVtSdB0OP0nCK0/1iPO3TvH08UkqpzejJ8x3cGeY1xVeCkP2d2ZDCSBgfEZqxG3UKCPOhPoczpZR2YUUrbso9GjLhAGjYfipyg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2567.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(107886003)(38070700005)(186003)(26005)(82960400001)(38100700002)(122000001)(54906003)(8936002)(5660300002)(52536014)(83380400001)(66446008)(66476007)(66556008)(66946007)(64756008)(8676002)(4326008)(55016003)(2906002)(76116006)(508600001)(7696005)(2940100002)(316002)(9686003)(450100002)(71200400001)(110136005)(6506007)(86362001)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MFpreUltMHBJNXpXOEJwN0tKbTFFVnpwTjB6d0dlTGdoTzZuNW16WUF4ejY2?=
 =?utf-8?B?NExuNTRKV3NFM1I3UnI0UTduY3RIOVArNmZrMHJjS092SWkvcjN6ZG1EcnV2?=
 =?utf-8?B?QUloNUhkcHZ4ZmdDUkhYalBWRVpzbTg2RFNjekYwU1BtaThFTUM0L1poeFRz?=
 =?utf-8?B?b21VRkZwN3JuMVJqQi9ycllRUWRsUDNnQUJHUUlvaUNvenk1QXpjVHNPbDVr?=
 =?utf-8?B?RmJQK0tYSDdrMldPa2gyNWhKMXpPdXJrTG11RjdyVGc3ZnV0aUhOUVl4Rm5x?=
 =?utf-8?B?ZHZwV0VlNXpRbFhla2cwamkzdWM3YmQ1elcxNXhvcEYrNGl4NGNRQThKTFQr?=
 =?utf-8?B?cjhKK25BUkpsUnk2VllkOGplWVlmVjBOQUQvNjYzejNrNEFQb2djZTdWdkcz?=
 =?utf-8?B?WFhyYjRNdDFiT2RYWW1VNTIxeUJsendNUWhlRjREaVZwRkgrWm5MZElDWUFx?=
 =?utf-8?B?VVJaWlJNMm9sOGZZUitLc21ydlRUMldCUlM0WGlKKy83eGs3cmpDUW1jZ091?=
 =?utf-8?B?RktYOVAyL1QwS2JlS1F5ZHdXS3Vsd1BDakFlTUluOHJVem05RXpWQXdaWmVQ?=
 =?utf-8?B?OEx3Z1N0ZW8zY3JaRFY0b1FqNlJxYmdSZ3NkTS9IS0s4U1JQbjVzQWsvVGw4?=
 =?utf-8?B?SG1LbXFXSDlBbTdJclBTaHBPcmNFbU95RlhrSWh0SytDOWxpU3JyN3FVTHN2?=
 =?utf-8?B?NEpZQ0FYYzZwc0tGUWdVeWpIb0xzQ01rWmd6RGlFdDVGUHBoN21MRks0R1pu?=
 =?utf-8?B?dlEwNWhNVnByTHN1QzVwSGhFVmlROHRPVXNabTJZaWlXcTRaeHVpei9UWU1B?=
 =?utf-8?B?a01DR2dQcVFHby9HUzhPSUpOM2hrOGJMaHBkNGFZcTVBM1JualZFVEVEYXly?=
 =?utf-8?B?VU52OWNIdXdxamxtWWx3S0QxQXl4R2ZFRUFhRnJQZWkwYmsyWW0zSWZtK01h?=
 =?utf-8?B?cjFYZXVGR1FVZlYwQkVQL1k3cUM2cU50WGlVK08wcGNWa1dpby9DOHN5TzBY?=
 =?utf-8?B?a1JrQmFKdmxTOEF2Q09QNDBmM2lKR0ZBa2oxNjVWOHUvYUg0T0NlcFFMUDd0?=
 =?utf-8?B?VW4rM3hLSFhaWnJtRGt6N2dyWE5yVlpXODEzR2FBZ3ZTUFRFby9mbjl0MzdJ?=
 =?utf-8?B?a2VFdStCVlVQYmUyZmVlY1Ywa3FMV2ZoQ3dPQ0RsUHNBQjFiTFhrcXpYRUpM?=
 =?utf-8?B?VEVkRnpiczRBUG1XUW0zZ0hKS3YxcWNGOG1XaEoxQjJmZkR0MzlUdFgyVkhB?=
 =?utf-8?B?Nkw5cDhvV1BpNm9ibE4wR1BSL21mSlVvWVNyamRrbTQ4eVFycXpBRzlXZWNV?=
 =?utf-8?B?SWFkOW9pN1h5VkhNOEdRWENiemRRZWswQzhvSXZOcWIwa2tUV0RocjRhNVZQ?=
 =?utf-8?B?SU9pT1RoOUVYMUx5TWgxK3hsYndKK1FXMmcybm9icCs0aVVub0ovL2xXSzdZ?=
 =?utf-8?B?V0pmeTduNlVkT3VvSGVzZVRHRFNDQXVMT1p0emdwdUd2SDhsUldZaXBnSGFC?=
 =?utf-8?B?Y0o3K0h0ZUhaamRCOXlsQnllVTNma3VndnQzeUdOS2ZhcXVQeU9SNjVnNThs?=
 =?utf-8?B?Q0RUZTRhWTNGRGdlbE1iT2Z6WWlGYkFNOVl2QW9uN1BjdTNPbmdpWFpOcnJQ?=
 =?utf-8?B?TWc5UnR0UmR4aVBkS0I0K0J0NXgwbStzL0VlVE5EVzROemJiTkcwZnkrdTN1?=
 =?utf-8?B?a0R4aFpBakRpMlgvazBvL2JscnR5bU5ybUo5dXRXT2E3aEhOdnI5WVZRRzJD?=
 =?utf-8?B?THdRdHRzNW9mNGY5bG1QRWlHTU5ZVzRVbmxtVHJ1cXFIejFaRXBQZkp5REZ4?=
 =?utf-8?B?aC8wemNYeFYyQzV5SWNkRkQ3Ukh2blVzODZudlhqeGJTL3pRUXBCNEM2NU1T?=
 =?utf-8?B?STdCWG1VdHJxZEZya1lGMlNTMjA2ZUR6bEdDRG1razVHeWZYSDRrRkF2N3U3?=
 =?utf-8?Q?gO0Pui/nS+ftrhe5umj1FF+eVfekPh0O?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2567.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 544660dc-b843-4255-585b-08da071d3ef7
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2022 07:19:01.6940 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WJrxVcGx0ex4OIULIAtplA2BSIftDV2bxw81swJpBLASX8agyrHSKQcfZUdhyhBVwWE1llv9Xj/Znfef9WhJ/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3826
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
Cc: "Abodunrin, Akeem G" <akeem.g.abodunrin@intel.com>, "Wilson,
 Chris P" <chris.p.wilson@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9leGVjbGlzdHNf
c3VibWlzc2lvbi5jDQo+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9leGVjbGlz
dHNfc3VibWlzc2lvbi5jDQo+Pj4gaW5kZXggZTE0NzBiYjYwZjM0Li43ZTg1NTI0MTQyNzUgMTAw
NjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfZXhlY2xpc3RzX3N1
Ym1pc3Npb24uYw0KPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2V4ZWNs
aXN0c19zdWJtaXNzaW9uLmMNCj4+PiBAQCAtMTI1OCw2ICsxMjU4LDM0IEBAIHN0YXRpYyBib29s
IGNvbXBsZXRlZChjb25zdCBzdHJ1Y3QgaTkxNV9yZXF1ZXN0IA0KPj4+ICpycSkNCj4+PiAgCXJl
dHVybiBfX2k5MTVfcmVxdWVzdF9pc19jb21wbGV0ZShycSk7ICB9DQo+Pj4gIA0KPj4+ICtzdGF0
aWMgaTkxNV9yZWdfdCBhdXhfaW52X3JlZyhjb25zdCBzdHJ1Y3QgaW50ZWxfZW5naW5lX2NzICpl
bmdpbmUpIHsNCj4+PiArCXN0YXRpYyBjb25zdCBpOTE1X3JlZ190IHZkW10gPSB7DQo+Pj4gKwkJ
R0VOMTJfVkQwX0FVWF9OViwNCj4+PiArCQlHRU4xMl9WRDFfQVVYX05WLA0KPj4+ICsJCUdFTjEy
X1ZEMl9BVVhfTlYsDQo+Pj4gKwkJR0VOMTJfVkQzX0FVWF9OViwNCj4+PiArCX07DQo+Pj4gKw0K
Pj4+ICsJc3RhdGljIGNvbnN0IGk5MTVfcmVnX3QgdmVbXSA9IHsNCj4+PiArCQlHRU4xMl9WRTBf
QVVYX05WLA0KPj4+ICsJCUdFTjEyX1ZFMV9BVVhfTlYsDQo+Pj4gKwl9Ow0KPj4+ICsNCj4+PiAr
CWlmIChlbmdpbmUtPmNsYXNzID09IFZJREVPX0RFQ09ERV9DTEFTUykgew0KPj4+ICsJCUdFTV9C
VUdfT04oZW5naW5lLT5pbnN0YW5jZSA+PSBBUlJBWV9TSVpFKHZkKSk7DQo+Pj4gKwkJcmV0dXJu
IHZkW2VuZ2luZS0+aW5zdGFuY2VdOw0KPj4+ICsJfQ0KPj4+ICsNCj4+PiArCWlmIChlbmdpbmUt
PmNsYXNzID09IFZJREVPX0VOSEFOQ0VNRU5UX0NMQVNTKSB7DQo+Pj4gKwkJR0VNX0JVR19PTihl
bmdpbmUtPmluc3RhbmNlID49IEFSUkFZX1NJWkUodmUpKTsNCj4+PiArCQlyZXR1cm4gdmVbZW5n
aW5lLT5pbnN0YW5jZV07DQo+Pj4gKwl9DQo+Pj4gKw0KPj4+ICsJR0VNX0JVR19PTigidW5rbm93
biBhdXhfaW52IHJlZ1xuIik7DQo+Pj4gKwlyZXR1cm4gSU5WQUxJRF9NTUlPX1JFRzsNCj4+PiAr
fQ0KPj4+ICsNCj4+PiAgc3RhdGljIHZvaWQgZXhlY2xpc3RzX2RlcXVldWUoc3RydWN0IGludGVs
X2VuZ2luZV9jcyAqZW5naW5lKQ0KPj4gDQo+PiBTbyBpbiB0aGUgcHJldmlvdXMgaW1wbGVtZW50
YXRpb24sIHRoaXMgIndvcmtlZCIgZm9yIGJvdGggZXhlY2xpc3RzIGFuZCBndWMgc3VibWlzc2lv
bi4gQnV0IGhvdyB3aWxsIHRoaXMgd29yayBub3cgZm9yIEd1QyBiYXNlZCBzdWJtaXNzaW9uPw0K
Pj4gVGhpcyBmbG93IGFuZCB0aGUgYWRkcmVzcyBvZiB0aGUgZW5naW5lIGlzIG93bmVkIGJ5IHRo
ZSBHdUMuDQo+Pg0KPj4gSWYgd2UgYXJlIGdvaW5nIHRvIHNheSB0aGlzIGlzIGFuIGV4ZWNsaXN0
IG9ubHkgcmVxdWlyZW1lbnQgKGUuZy4NCj4+IHBsYXRmb3JtcyB1c2luZyBHdUMgc3VibWlzc2lv
biBkb24ndCBuZWVkIHRoaXMgd29ya2Fyb3VuZCksIHlvdSBzaG91bGQgYWRkIGFuIGlmICghdXNp
bmcgZ3VjIHN1Ym1pc3Npb24pIGluIHRoZSBzZXF1ZW5jZSB5b3UgYWRkZWQgdG8gdGhlIHZhcmlv
dXMgZW1pdF9mbHVzaCgpIHJvdXRpbmVzIGFib3ZlLg0KPg0KPiBHb29kIHBvaW50Lg0KPiBJIGRp
ZG4ndCBjb25zaWRlciBHdUMgc3VibWlzc2lvbiBiZWNhdXNlIENocm9tZSBkb2Vzbid0IGVuYWJs
ZSBHdUMgZm9yIFRHTC4gQnV0IGl0IGlzIHRydWUgdGhhdCB0aGUgaW1wbGVtZW50YXRpb24gd2ls
bCBoYXZlIHByb2JsZW0gd2l0aCBHdUMgc3VibWlzc2lvbi4NCj4gSSdtIG5vdCBzdXJlIGlmIGl0
J3MgcG9zc2libGUgZm9yIGk5MTUgdG8ga25vdyB3aGljaCBlbmdpbmUgd2lsbCBldmVudHVhbGx5
IGNhcnJ5IG91dCB0aGUgcmVxdWVzdCBiZWNhdXNlIGl0IG1pZ2h0IGJlIHNjaGVkdWxlZCBieSBH
dUMuIEkgd2lsbCBuZWVkIHRvIGludmVzdGlnYXRlLg0KDQpJIHRoaW5rIHRoZSBzYW1lIGNhbiBi
ZSBkb25lIGluIGludGVsX2d1Y19zdWJtaXNzaW9uLmMgYWZ0ZXIgX19pOTE1X3JlcXVlc3Rfc3Vi
bWl0KHJxKSBjYWxscy4NCg0KPj4gVGhhbmtzLA0KPj4gU3R1YXJ0DQoNCg==
