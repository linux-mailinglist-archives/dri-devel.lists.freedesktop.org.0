Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E03653544
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 18:33:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AEC010E468;
	Wed, 21 Dec 2022 17:33:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B08DF10E468;
 Wed, 21 Dec 2022 17:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671644007; x=1703180007;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=hkAmpJJVvSw1DSqBLrQ8UUWbCGsYxs8NhkUYiKMUbN4=;
 b=PtPLdPSO9YClvqThVqWZj0DE4gYnCWkRID0skCJAQjkef2wNRQziFHEf
 9V5A1U8qXtkT4wFAzWDM8mjCnAvjO0fmrr1uFxXmdLEILf9xrPIsieABt
 oY+yURGpAWGAcKR/S8n/bhdXtbQYgt0iBO1pBUYnfphrmB+Yu7vHcpTz3
 1nM8oaGmr04eEpbhPjxAq6AFE9pudTHKbcmbqKULlgvivmo0vE1eTfHeh
 GTO/HhcaLaXmfRvxu6d10lZJxFLTY7DbhkwYG83yrXsFnZDQaLZVx4CVT
 6LKk+gqKDrAKj7+zZ2ukRpTBT8aO2eQ7JVfm+Xrl443Ksi4KRM2VPXgn/ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="318627357"
X-IronPort-AV: E=Sophos;i="5.96,263,1665471600"; d="scan'208";a="318627357"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 09:33:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="793779657"
X-IronPort-AV: E=Sophos;i="5.96,263,1665471600"; d="scan'208";a="793779657"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP; 21 Dec 2022 09:33:27 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 21 Dec 2022 09:33:26 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 21 Dec 2022 09:33:26 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 21 Dec 2022 09:33:26 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 21 Dec 2022 09:33:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DUT5nyGdyCPlM4Is4w6aoDAmynQ30d+9XSD3u4xSKUX2ecTX77vNBncThQrzjH7Bw2Q/ZevlFWvDLR1xFaD9fInZ5z0bmCIFfjsZBXnWkP43aQfuzWyQyKiWMkQwWce/FIjd+XqiN3vM4RDqIADnceEiZevb4jpou6Hj5rOdQpEbLyXh42XiEsTXE6ZqZt6VcmN1rzATp9hKVuTUengFMZWa8Aflrav4Ew51CLXXNZi5Q4178Yqt8qRO0+P/nNPe/y0oRihPy5tN+VWEBgUegb6d8hI1XXJyzAK0jUFLOM/r3zXOJyf6YutuCtjrZ9Lmra5ROTgGbXbQbtcgitwRQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hkAmpJJVvSw1DSqBLrQ8UUWbCGsYxs8NhkUYiKMUbN4=;
 b=lfzVOAVjvnUItCUW6r8hu0mqJpxZWKNkR6SnJb3JwpxtovZxezdMGybuYD8OF2pVi2aDYE+meWM3fVgcDn45cA0q6Y3Hz9yLLWOkhzKOL212baOVGT/B3O+NHWoTMzDnbmY/oaSq2PXnYOhedzR426QCSwMYTLLEsR4koaF06JBC3QpQK/Zny3W4tDQ5f4kUmTiLlgaZlaIFcM+N1/h84rswjGGBSmgHCUKy2x7mxI+CmdApeWoWnNGPRQ111dzRG0xIILmzxWLE8r3D5O+Y1h/wrAC2LnBuSPir/DatfaMaMQ5sTAiGG2qRHVGq1ntOsIcsOMZZgf0idXVa6+0J/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 CY8PR11MB7338.namprd11.prod.outlook.com (2603:10b6:930:9e::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5924.16; Wed, 21 Dec 2022 17:33:24 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::8901:2af2:6e02:c95c]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::8901:2af2:6e02:c95c%5]) with mapi id 15.20.5924.016; Wed, 21 Dec 2022
 17:33:24 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 1/1] drm/i915/pxp: Use drm_dbg if arb
 session failed due to fw version
Thread-Topic: [Intel-gfx] [PATCH v2 1/1] drm/i915/pxp: Use drm_dbg if arb
 session failed due to fw version
Thread-Index: AQHZFL+2tLuhU3GAzEeREOaOkPxGOa54In4AgAB5c4A=
Date: Wed, 21 Dec 2022 17:33:24 +0000
Message-ID: <74a4e4f38be56de1c3810e5a3dbe03fb3ec0939b.camel@intel.com>
References: <20221220221158.2390090-1-alan.previn.teres.alexis@intel.com>
 <87zgbh12hf.fsf@intel.com>
In-Reply-To: <87zgbh12hf.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|CY8PR11MB7338:EE_
x-ms-office365-filtering-correlation-id: 49f72983-90b3-49f7-4e49-08dae3797666
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: p7GUi8VH2FxxCvcUNkp/xWLr8xqbXbcF1xCVEJdq/8pfPdoR1IN/efbUT4D9HjV+DLSpOvHQHpPXTHXZ6s9x5jFPad6fxz/ul5Hl3WCQNfv4Pq3ZLwgRJKiwxyqnHTju3TDnfgWc4Va4x3C34BHCG2b4dVd8bLUp1Lam3HssHSy59x9DxwigXW8lALELQ8PAdmyCZ4b5iWhUlmp8932ucqc3Zs4YbO8uW5kFhTdoBS1tb1BvAw2oS6SEYrWADmCU3FW7ow83VlxXLS07hIXCM4umBvORyaeFK7Ovn98n7DrU6IA1ebqCwoGrxg7lhdvG6TXlVct44Gbwk2QF6dB+tHyElTn7JhekVIv0ln6runWsyyD4B+WRcjlkxG1LX9sJbv/WdxUzJlzESi+1pW16/8tiEEfa421sz6uIN2jHE18Gr243yu1er4oU+9o6e0Hr2l/vjInXM1bQx0b69C2Ez7B7BmlxeSctnuauQExC/iQ2vHs2cTknihVQ1wo9FG/ueDlM45BFhBkXkN45v6Tc3hcx4G2oNhG41zNyoCiqMaVC7YIgOsvR3q9mO4qM2dr9FNOnHXeSA2W9bq6DIwU5EPjXW3LVt0oay5uPr9VGD/xqBp7FKtPQ3FY+sg11Zl90VwKMuximnclgX9aNMVGD0KORWHm/157yx2j4ChjsPVXEgq/o6R8e5IDT3o1phosiinl+MXq1z1L1dMVMop6coA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(366004)(39860400002)(346002)(136003)(376002)(451199015)(36756003)(186003)(91956017)(26005)(76116006)(4326008)(41300700001)(66946007)(478600001)(2616005)(71200400001)(8676002)(4001150100001)(2906002)(86362001)(64756008)(66446008)(4744005)(8936002)(5660300002)(6512007)(6486002)(66476007)(66556008)(6506007)(122000001)(110136005)(316002)(38100700002)(82960400001)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UlIzb01oSnJhYkt6cHpRQmpnTjRCZXlGSGZ4RlRrTlJMYXhFVTlXeWd6WlBF?=
 =?utf-8?B?NUYySnplUmpYaUttMWlKdGMySkVnbklQNHhKU3dGaHlKZENQOW5pVGFScDNZ?=
 =?utf-8?B?MjlKUnN0UWZWVkJ0UE15S0wwbkdBMFZFQXQ2YkxOd1l0aEZNdjlRQlZLekNV?=
 =?utf-8?B?azlGME1Xd1JSTjVSOFV2cHZxN3N5WmFVVVFkK3JneHpuK0FlaWVpekNzOWE1?=
 =?utf-8?B?VW9XU2JBcms0ZzJVNE81dENFVnlQeVpxZ1grRzgzaEVvaUd5U3paOWQwRTBi?=
 =?utf-8?B?VEhwUFcyM01RWFkycWJsOFlQNFN4eUNEeUhiN2tRTWZlRDYwVm05eFdMU2cr?=
 =?utf-8?B?cDRJV0crdGErUDhwcDBYVGdNVTgvRDRJZDJhemNELzdXL2RtS0lxODNvbi8w?=
 =?utf-8?B?UUdQNjl4V2Jzb2lOTzY3dzB2cVU0b2FFaTBXSnA1aGl4T21ONWpYT1FvNy9Y?=
 =?utf-8?B?S3RwdzlKcDBXMStxYkNybWc1N3UxSUFtdlJWcVcvTVE5bW9oeVQ2cDd5TDNI?=
 =?utf-8?B?cDBOZkx1ek04eWs1aDA2RklHNWNUTzRQZXU4TkJXMjZaQmpCbngxUStrbGRE?=
 =?utf-8?B?cVBwZU5LaldHRDV2QlNhVldRU1llZmpsVGVFSWtiSDQwNzZETHFyclRHOVls?=
 =?utf-8?B?TEpndzhoRDB2TWpnTnprcEQ5SnBzcDBSeXV5dW10Q25KZmo3KzJqL0tVOFlz?=
 =?utf-8?B?OE8vWDV5QWJGRWJwZGx2ZEU1Wm0wUHBrY3MwYjZrbEZXcWdYN2JrSXVvRnpN?=
 =?utf-8?B?QXNJNDQwekRrQUZoajBjWXpWeGtTSGZNem1FbnVjUzQxdmNmVTNJNC9Yazh4?=
 =?utf-8?B?OGpaRWVsYWZ0Y3QwSUp3MEJ1ckFNQjNpZ1hsc3V3djJUWW5keERkSGlUejgy?=
 =?utf-8?B?YjFYTmJkbXVSTVRSd2NiSXNJRFl5VmRLU1RSckh3aU9ya2ExYjM3UWo0WmxH?=
 =?utf-8?B?R2dXd04xZldKM2VUTy81N1hHU1Q4dnRrL2hEcGFEOEp2dEE1V25najFtZHd0?=
 =?utf-8?B?YlZobmdaQnRMUmpaaFVQRHBxUkhQYXpDNWZPNzFGSUFEWXFVc0pMUmVCK0hP?=
 =?utf-8?B?Z1BsNkJ4MEhlT2ovZERlYitUcnJBWStERjlSdUZSbVhhUmlwbHlZL25HVUFn?=
 =?utf-8?B?QzBsaGFMdkVBRkRTVytJamkxRGhKRGVkOURJOFVtZHF6Mm42VnI1eUF0UWFY?=
 =?utf-8?B?cHRZSzRXWjBBMENINU1UN0x3ckxxNlM0UmwrZXNORjVhRlh5SXAxOUpMbk9Y?=
 =?utf-8?B?bFJBRzNKRkRMNTY1VnBOV2p4T0hlZkdWUEhFT09PTkhKMUZuNU1VNTVSbWxU?=
 =?utf-8?B?aEh6SGRvS282Z2JoNVVhSmFnVS82MGdkZmhyMHJCQVhmYU9FVzRaZlYvbzRE?=
 =?utf-8?B?U1d5WEU5dXRHd3FkYlNlMG1CaE4xVmlJUEVUdHpvcGlZeElELzNyR0xZS3pH?=
 =?utf-8?B?QjhPOWd2MWZQVExnc3QwWUV2eWEycGxaemZxb1ExYlpkcjdjTDNQV0JINEFm?=
 =?utf-8?B?NmtoTlByZndpdW96cEh3c0ZaY3JPM21pc0VDZ0d4dFovQ1NpYjVURGFvbThU?=
 =?utf-8?B?bmxIVzRxUUFGMU55NmF2QnIwYS9BdWtIWWp6MUN4dG9oVG0yakJuOTk5VHJw?=
 =?utf-8?B?Y3NSWFRJUm10ZGdMYXNPN1BjcUprR2pPTEZic2pOWGxROXZtWklXTkxqM3E0?=
 =?utf-8?B?QlNieVdQcUhqUUdVdmhRN3FudHl1cGhyRXBKdWpXSjRjMlZlUnE2WTU0WlA5?=
 =?utf-8?B?NE1qREdUNDk1dXJuZTByTGVPQzcydjd4eXdnNzdOeTQ3czhpOWFtQ2xqTGts?=
 =?utf-8?B?MXFMZ3RWZXZBMVNMdzVQM3BVNU96RTl3M044dU11T21MZ1BKakxPRWsrWmpM?=
 =?utf-8?B?SFM4bUwzM1pTT2ZTMDFPaXJkN2RHVklTRXFkTGluVVBTdDVwWklhdDZUSWdG?=
 =?utf-8?B?eHBhb29qcldGV3dMUHZEdjFSYWw0ZHU1YUZPZ3NBT1BPMUFUVm5ERXFzc1A5?=
 =?utf-8?B?bzBtNTFTUkpTTWM2Q0pmOGRmTUQ2YjRnRFQ1a0dFYWg1WHUwUXV6bEIzSUJ5?=
 =?utf-8?B?SVI4ZUxBTzU1K0RnbTVLaEppN0lRZllsRWN0QkRXYlhFZTZqbHZsLzRDeVFx?=
 =?utf-8?B?US9uazI4RkhLaTQ0NjRmL1pJWTQwV3RwYlMzMFNlRm4yWGM5dXdQeG1nemI1?=
 =?utf-8?Q?u/AHN5bqCrlWngNLOYBDSLY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <29BB053223E13548B638A20B4264762B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49f72983-90b3-49f7-4e49-08dae3797666
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2022 17:33:24.2998 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4bpMqYGLKfuiQG/hRPHntf6ulJwi3jIjwwxzNw9d7UVbJqobkF3mSmEBOtOhiXw2/rVz7fvjCHeZPYfOA9aZ5tSHK2U6YErOIh1jPjyN4UdShZNj7/2QWLriod3elnfm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7338
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

DQoNCk9uIFdlZCwgMjAyMi0xMi0yMSBhdCAxMjoyMSArMDIwMCwgSmFuaSBOaWt1bGEgd3JvdGU6
DQo+IE9uIFR1ZSwgMjAgRGVjIDIwMjIsIEFsYW4gUHJldmluIDxhbGFuLnByZXZpbi50ZXJlcy5h
bGV4aXNAaW50ZWwuY29tPiB3cm90ZToNCj4gPiANCkFsYW46W3NuaXBdDQo+ID4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2k5MTUvcHhwL2ludGVsX3B4cF90ZWUuYw0KPiA+IEBAIC0yOTgsNiArMjk4
LDExIEBAIGludCBpbnRlbF9weHBfdGVlX2NtZF9jcmVhdGVfYXJiX3Nlc3Npb24oc3RydWN0IGlu
dGVsX3B4cCAqcHhwLA0KPiA+ICANCj4gPiAgCWlmIChyZXQpDQo+ID4gIAkJZHJtX2VycigmaTkx
NS0+ZHJtLCAiRmFpbGVkIHRvIHNlbmQgdGVlIG1zZyByZXQ9WyVkXVxuIiwgcmV0KTsNCj4gPiAr
DQo+IA0KPiBTdXBlcmZsdW91cyBuZXdsaW5lIHRoYXQgc29tZW9uZSdzIGdvbm5hIHNlbmQgYSBw
YXRjaCBsYXRlciB0bw0KPiByZW1vdmUuIEVhc2llciB0byBqdXN0IG5vdCBhZGQgaXQuDQo+IA0K
PiBCUiwNCj4gSmFuaS4NCj4gDQpBbGFuOiB3aWxsIGZpeA0KDQo=
