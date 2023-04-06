Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 743BB6D8EEA
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 07:45:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 781D710EAD4;
	Thu,  6 Apr 2023 05:44:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B804D10E02A;
 Thu,  6 Apr 2023 05:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680759895; x=1712295895;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=LCmNK9dvSI52S3Sb4tgLVDT2CjBefJvl1Z0nqnQvNmk=;
 b=QmG1/BWByjCT5UUSPcdbveXuudN+Tz9UfhZeG4IhGYFh0OQdK6sh7k0s
 fEPpmYG0TY00eZN3GUFdLhH1YM87xK51OMSkwl9eKtjRKNx0U1NcYA2tE
 DparSEhF+zXXBWzl5T9C2/4KQbner1MxN2FP1LAasGcgk1Qx0/znC/rog
 XTnr1JMeZqRh+hyWpnTHl4Z2HSUEV9fG1b2kYh92a7oesrKcveVVjbtpt
 LDszIi23YvBxhdlNB/ZpJdb1KQ0GnhdAH4d9PpwTkBC+z32WcNwNLx3Pm
 Ju01dw58Y2URwzMIr5wpDXgYo4rQPCSDNK7UWECKdpgLDndhU8lGvNDeD A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="322295314"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="322295314"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 22:44:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="689549982"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="689549982"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 05 Apr 2023 22:44:53 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 22:44:52 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 22:44:51 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 5 Apr 2023 22:44:51 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 5 Apr 2023 22:44:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l1YW36/JvsQkGVAQf1JBRZrPSHRu4+BjCDkhOmTUz2TMSIrJp8WOqytvCDnqG9yiRRpI3wFPbz6+lN/6150Fyb22SEYXFOuUo6dnxgupr2/aCBO34NzO3lMznwgINnYcrPirbox+bCOWHhRYFSFh9/p0d5K9e4CGQhRYZV5XpiGZ+4evyBJ1kAMXaNSiLop2dONaVIgnEJBtRL3hZmFMP10byqOmuKT1aHrTEqylnmUJXKeLIZABrC5J1ftlhZ9Y/WDJ8HIIdXPUlMjqab7NTSExq76FrYfOQ38NKwrBUQBJGWavRhXGB3zipPf6i65Cr3sG4eiMIYpie59928oypw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LCmNK9dvSI52S3Sb4tgLVDT2CjBefJvl1Z0nqnQvNmk=;
 b=ExRcrYVaocwugTVyd4M6Co6mkleFEOf2EAte3/+aHRwS6mR1Zy+YJLQ+cEg38gD+4lwQvW4Jb3dZcBAKD/SBvzuw4kECfjvm+rlN1Qa+UJlNXvBXLNIjih31Xg9fEVltUuybxC86s2IGUQAIGy8aO/A2UWxdzXEHs3b/yd8AEgotVfld8+L5Z6urtriG0lVLKYckHHLmq2IQrN5oyU++KpYH9xRV+xIjfZBFwgua3eIrN9a3yjE0sIA/6MU4UnT9v404/UbOjj68pUoMAJce2lSI1HoL55rr5vJaMASLBZphmG1PiowrrYGAhJeMfQslHp6PxHEHyObJ6wlW+z31AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 CH3PR11MB7201.namprd11.prod.outlook.com (2603:10b6:610:143::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.30; Thu, 6 Apr
 2023 05:44:49 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3%5]) with mapi id 15.20.6254.035; Thu, 6 Apr 2023
 05:44:49 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v6 7/8] drm/i915/pxp: On MTL, KCR enabling doesn't wait on
 tee component
Thread-Topic: [PATCH v6 7/8] drm/i915/pxp: On MTL, KCR enabling doesn't wait
 on tee component
Thread-Index: AQHZSxtzfbn8tqnR50Kmh735EgcmD67p44EAgDQcEoA=
Date: Thu, 6 Apr 2023 05:44:49 +0000
Message-ID: <ffc77d50c2b0b920c51d55f48284f55fc95f6ba2.camel@intel.com>
References: <20230228022150.1657843-1-alan.previn.teres.alexis@intel.com>
 <20230228022150.1657843-8-alan.previn.teres.alexis@intel.com>
 <b923b230-603e-312d-8d4f-160486095152@intel.com>
In-Reply-To: <b923b230-603e-312d-8d4f-160486095152@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|CH3PR11MB7201:EE_
x-ms-office365-filtering-correlation-id: 1258929b-6478-4b64-5a91-08db36620973
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5iWyEEYdTOunbj3KfEKBQRIsjEO/KRfnMcWRsxUVE26Tei2EKtIOdydvmP59PGf9kReExkY9rExRn+fMRwaQ01LxxSImSP4FrlIqHJyCVcoqawkIIU8CD1tbkbFlp/BElNxAkVsNUIDzYVmP/4QQFokT5Z+ICee5D6xKnwJt3ILxuvH73pHCzxTwyqiQEvswW0OU2CLdfREslabhzbM3eAhKBb/Pp5r9IDQopN4Jh9yZ+LWfeog8tNQPpcVlrzpsjN//xqM2jCa597auEuDNnv5Yce+Inn168dkdOE5gJxy2zkWyQ7HLovU60OaqK8htULt2uSwiStqMqqpxNBJp465InKxvLkCTj/Pr12yr+It6g1hvDrYZSqNjs05j3lD7OEgHZXYGLOlr85FqFzu70wqUJkz9zEfRA2NdjndFrfDH6vHPxmJjW6TDRVDI9xy8cIDV3NvpML7RVRkQboIjgGw6f2dTFs9Ey62fou1evxjR3g+F9qvD8qHmjbYYwcifidkjwZUt0oMOEK8KiZCdUdXaP7Cc0Tg3oUqGVYj1FrmXitj06a3MYzcpJaR5gpQPtBqzB9mmhQZZCA5kLu6U+F2AKXMqSSEYhFFTgfsejFjmwRS9uNYSYBe6HID0WrC4
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(366004)(346002)(39860400002)(396003)(376002)(451199021)(83380400001)(4744005)(71200400001)(82960400001)(38100700002)(66946007)(66446008)(66476007)(66556008)(8676002)(91956017)(5660300002)(64756008)(76116006)(4326008)(38070700005)(2616005)(122000001)(8936002)(2906002)(41300700001)(478600001)(54906003)(86362001)(110136005)(186003)(316002)(36756003)(6506007)(6512007)(26005)(6486002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R2loY3EzeUkxaUtTUEFmb1l4SnF4dEhxemorMjMwQndzaUp2YmRBTXVzVDJ3?=
 =?utf-8?B?aUFFM3VjL0w4VjRBc0d4Qkk2QU9KUDU3YklNeVNxN1dzaVEwdS9NaVpwbFQ5?=
 =?utf-8?B?RGdoKytZeFNJT1hGU1RYVTlxTWdJem5nQzNtc0lzUGFtMDA3YVVlai8zRmxT?=
 =?utf-8?B?amQ5RnlkVkJDV2RYZ2hDVkJpalJMb2lLUW1TZWlkMWdGY0hybmZ1WmhnUXpr?=
 =?utf-8?B?UW50OFBGZmpwOFVFMUxoRUhxa08rUWQwUVVmSTgxbGoyTmtvKzhCQkVWdU0y?=
 =?utf-8?B?TWFjRjU4K2Jub3BZWWlYZ29sOTI3Ny9FUDI3TU9CSEsrSVhqKzJRbzhTYUsv?=
 =?utf-8?B?SlZaazVKeU53RFlJdEpLWFBDbWduMGQ0M3JRdGVRRTRQbHQ1V2NQWDJBeFJi?=
 =?utf-8?B?Tk51S3lxSkNhelhUNEFIaEJ1dU56OExOV0JaNkZpUGRMLzZWWHhsN3VLY281?=
 =?utf-8?B?YnZydGZKSUFka1BycDlEMFhTWFZoaDQ5ZnBGa0tsUnd4Z1JDVnBSeUxWU0VR?=
 =?utf-8?B?SFkxb1NOQXlYdEVaaThrV3c2bzBSUHFqZXhITGNVVWViQUZ2ZStNblBjam9n?=
 =?utf-8?B?aTh3aUd4QVZkWE5rV2VXbm8wVTExVGU1YnlLYnZjRHRKa01zNXBsMWgzZGl6?=
 =?utf-8?B?V0JETC9GSGpJL0p0TFBXTGV1alBZNVpWQS9nYmZqTnhVSGpkKzhOL0w4OXFB?=
 =?utf-8?B?cyt5TFg1YVV0SEkvQlBRd2owb0FnU1FXcW9sOTZtUER3cTNUUEZwa3FTWU0w?=
 =?utf-8?B?VHk1S1pnZm8yNGFjTmlYcmxaeTJLbTNhclpFeDNsblNaUkVVZHNOSkN4RE1F?=
 =?utf-8?B?SHE2a1hEVE9QWHZhRkRsZXpsNE1YV1h2UWNoTGRSUUNGOExQRGQxbzFzWldM?=
 =?utf-8?B?eVlxRFY2dTY4dnNRUHdtc3VsS3F0WWdSNzgvTXZVUkcydE5STXg5aXY5V3Rn?=
 =?utf-8?B?YlE4dEJvYUNCc1VCZ3F2Slo3cGVBck9LUDdnbitlZ2pkZGlnZ0N0a0NCbXk5?=
 =?utf-8?B?dytHUENzM0ZVajQ0c2RmQjVUVGpTdXpwL2hPazBWaWdDM1VYcXV2ZjlEUjJy?=
 =?utf-8?B?dUlPL2Y0UTh5eXY4YTV5ODJrYTJoUDRISUk2TzU3L3Q0em1RNkVhcTY0ci9k?=
 =?utf-8?B?Q0psSkV5Qk9VdEg0SWVqQkxCdzVReXFrczM2VEtxSE0yTGJ4ZS9nV25WV0Fw?=
 =?utf-8?B?WUxsak1zZ2J1MzdZVTNucHlGVHoxNVB2aGpIaHFrb0V3MC9LS3FBSXcrem94?=
 =?utf-8?B?MlBTeEh3dU55bVFXUlc2YVMwd0pHUlEzYmNsQXpqWG9jVzNuRXBCWE5KREor?=
 =?utf-8?B?bDA5KzYrTmVRYzdpQm5xbWlNQkRIeTIrMnkrRnM3bHpLK2hNWHB4NmxnRGFS?=
 =?utf-8?B?YkM3czlpbHlpVVRObE1DaERkMWdkOFRnZGNFREpyeXRpWHRnaUtWSExwYjBV?=
 =?utf-8?B?NDBDSHE2VVllZU1MM3Bqam9mMGo4UDNRU2JEUWp3ZlNPNGJYUUFkbnRoUmtL?=
 =?utf-8?B?ZitEbUdKbzV2eWUzU2dmSnVNWG0rUmExbGM1bmlId2dyaFIwUFhXdm15TGww?=
 =?utf-8?B?NFhCcUtzaVJIOTR4NTY5SE1KdFJBYW56R0tveWZPeXlENGU3UVJyaWR3alhw?=
 =?utf-8?B?bjdjU0J3SVdNNThZV3NCVFVzaUVZYm5wSDMzWVdjM21tZDlrelpzYTg3anJ0?=
 =?utf-8?B?bS9LWVhFbS9jdTlMQ2hhaktQNTdsUVJpTVM3b240VWNlTW9yVWxjQnZJWkxT?=
 =?utf-8?B?UHB5WjZWTi93dUZhb09URENKakYranlMNTcvRFpxUHNkamlHMnR3N0pFOTRU?=
 =?utf-8?B?azduZUJXcktMb096dkJnUU9WSWYrZ1FVakhZWmUyV1MyTFdRQmdXZGQ1c25z?=
 =?utf-8?B?UitvbjBwZDJlVUdXOTlKYWNXc0xnOWxBRWFOL3h3dGViVjlYbThYb094WG5k?=
 =?utf-8?B?NmtUb0NGYjc4N2xtVDFTWlc0NitwU3lWenM0eXprRXVxeDVHcStQcDNNSjZ0?=
 =?utf-8?B?b2g1SWxwdHliMjdCbGN5MmZqYzRYU2hBWEJvcVRiRGtLdUl3RlRJc0lMSVY1?=
 =?utf-8?B?MklXNk1ZaVpmblg2MTJaUmtlVExzMkMyeitDYUUzRWxaeGwrUmdiQzd1N1pq?=
 =?utf-8?B?OHU5SXQ2U3RBUGQvWlVneGxzMWVZZk5zTmFhbUxWNjZadjhYWHJFeDNVZ3kr?=
 =?utf-8?Q?Rh8btAZPV35yJmhY/LMTQS0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B92EAFF36F1E2B418EE21F509CE7C9B1@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1258929b-6478-4b64-5a91-08db36620973
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2023 05:44:49.5924 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rzfswwmT8Odjt+rgsHgMPe5rctHdbpX0QyaGer1Xl2e9YIkhGbQo6/Z+2l5vsS/S4rQotRlVCJtDbCuWtPKSd0kscRlKodIU6WfkcZntbWxMpa00pOURAR9hXCwQyu4z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7201
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
Cc: "justonli@chromium.org" <justonli@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiANCmFsYW46c25pcA0KPiA+IEBAIC0xNDAsMTAgKzE0MSwxNSBAQCBzdGF0aWMgdm9pZCBweHBf
aW5pdF9mdWxsKHN0cnVjdCBpbnRlbF9weHAgKnB4cCkNCj4gPiAgIAlpZiAocmV0KQ0KPiA+ICAg
CQlyZXR1cm47DQo+ID4gICANCj4gPiAtCWlmIChIQVNfRU5HSU5FKHB4cC0+Y3RybF9ndCwgR1ND
MCkpDQo+ID4gKwlpZiAoSEFTX0VOR0lORShweHAtPmN0cmxfZ3QsIEdTQzApKSB7DQo+ID4gICAJ
CXJldCA9IGludGVsX3B4cF9nc2Njc19pbml0KHB4cCk7DQo+ID4gLQllbHNlDQo+ID4gKwkJaWYg
KCFyZXQpIHsNCj4gPiArCQkJd2l0aF9pbnRlbF9ydW50aW1lX3BtKCZweHAtPmN0cmxfZ3QtPmk5
MTUtPnJ1bnRpbWVfcG0sIHdha2VyZWYpDQo+ID4gKwkJCQlpbnRlbF9weHBfaW5pdF9odyhweHAp
Ow0KPiANCj4gcGVyc29uYWwgcHJlZmVyZW5jZTogSSdkIG1vdmUgdGhpcyAoYW5kIHRoZSBtYXRj
aGluZyBjYWxsIGluIGZpbmkpIA0KPiBpbnNpZGUgaW50ZWxfcHhwX2dzY2NzX2luaXQvZmluaS4g
VGhhdCB3YXkgd2UgY2FuIHNlZSB0aGlzIGFzIG1vcmUgDQo+IGJhY2stZW5kIHNwZWNpZmljOiB0
aGUgZ3NjY3MgaW5pdGlhbGl6ZSBldmVyeXRoaW5nIGltbWVkaWF0ZWx5LCB3aGlsZSANCj4gdGhl
IHRlZSBiYWNrLWVuZCBmb2xsb3dzIGEgMi1zdGVwIGFwcHJvYWNoIHdpdGggdGhlIGNvbXBvbmVu
dC4NCj4gTm90IGEgYmxvY2tlciBzaW5jZSBpdCBpcyBhIHBlcnNvbmFsIHByZWZlcmVuY2UsIHNv
IHdpdGggb3Igd2l0aG91dCB0aGUgDQo+IGNoYW5nZToNCj4gDQo+IFJldmlld2VkLWJ5OiBEYW5p
ZWxlIENlcmFvbG8gU3B1cmlvIDxkYW5pZWxlLmNlcmFvbG9zcHVyaW9AaW50ZWwuY29tPg0KPiAN
Cj4gRGFuaWVsZQ0KDQphbGFuOiB3aWxsIG1ha2UgdGhhdCBjaGFuZ2UgdG9vIC0gdGhhbmtzIGZv
ciB0aGUgUi1iLg0KYWxhbjpzbmlwDQo=
