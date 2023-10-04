Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFD07B8716
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 20:00:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD3D710E395;
	Wed,  4 Oct 2023 18:00:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDD5810E395;
 Wed,  4 Oct 2023 18:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696442416; x=1727978416;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=/8t3kbmx/0PlWyCp5hhWyPjXBOWp2JIa6GyqRvrRG4o=;
 b=Me/zSIuOKV/4fOjrKbLE6/7xj1g/lQl+RDAZ88Tbt9lMPgv8H2ZCVmj5
 FwmEYLWgYD0/evvdeTafqBX6e7IwRUk++RJGGjotmoFkV8PaLe0rgSYeg
 BKCT5+jlFr/1/fgxpy/FIBrHYRIQBhFget8vwt2wm/pVFHtV7xKVx60ZW
 wfwXSQl1RksHWhYtGUrdbSBRF3NIfZKW125jqWN6M4SOAagW4k/lP47bP
 YLXPM5G0XJJqJ0DreCsqHpfJ3R72l3lPzsyRck9DES72b/+MitbS3Sb2C
 x3V2x8G/nUB83rDw9klhZEYDWDgmnpl9edwUNVIfWXy6psUEsJNbqUQVV Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="383157025"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="383157025"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 10:59:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="925263396"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="925263396"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 10:59:29 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 10:59:29 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 10:59:29 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 10:59:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gu8seAzzCi+XCKBEe0rgHSRu4zoxic0B/VGYmU2fqdA42pcVgdBhlzhg15s6GAKwDSwqjBQyOc9oQ/t7T5AsugymWle5J4d9xlOSDCVD0RfkQ+EVKDpmz4BOkiQczsnf+qN3R/BPfWkpw2HNG0v91tEFLaBf92NemmsIYTpDOqeIlI0tObvGwlIczkRgPf7OM95SwKDmRvHncLztcP7Dv5XJrq9cs9nGM73CYia2j6c3Zk3OvvVLVeO1N6CbVxHHk96SUcNWJJwUUCIhRifCAW5b+0tTW7dqXvM1WtR2x4UK7T6j+o/4CSbD3Th2sigQUOqqLdWN7WZdSdsQMMedVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/8t3kbmx/0PlWyCp5hhWyPjXBOWp2JIa6GyqRvrRG4o=;
 b=BP+n5K1Myb/PNSnQFxiBUz64xmyyLukyL01T5m60QEyMMvJ1tzNDfEUNZ/d9dEoCIQmvOfP5YyT7qGnd8Wbg02jvku5N94XgO30nlIy+PwifQSFmsNKZK3PbS+mT9cW9jgycUfP+mh+iSICbrrCa9jEoKU5wp2prrJckgF6W1Mjnu5WCqL0XhTJl5a50QsX59w5M+yjzrUn+ew+P4dzF1YPVPyLgVwHa/LdEe4k1KlGMKT1UeyD6XR+zKlQLNZF0zn3o8bR9+LpSnHAJ60kedaCqK5qkeZiPzThGK9MOU3ySWxz9JmCAdaISFuhsG2tM676EKHCbYyT3Fp0sl9mK4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 SJ2PR11MB7455.namprd11.prod.outlook.com (2603:10b6:a03:4cd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Wed, 4 Oct
 2023 17:59:26 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::7bf2:1b4c:1512:79c1]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::7bf2:1b4c:1512:79c1%7]) with mapi id 15.20.6838.033; Wed, 4 Oct 2023
 17:59:26 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH v4 3/3] drm/i915/gt: Timeout when waiting for
 idle in suspending
Thread-Topic: [Intel-gfx] [PATCH v4 3/3] drm/i915/gt: Timeout when waiting for
 idle in suspending
Thread-Index: AQHZ8Kx2E7YYzy1lTkO6NJtn5NHgRrAuYVuAgAB+x4CAAVIIAIAJxYEA
Date: Wed, 4 Oct 2023 17:59:26 +0000
Message-ID: <0c1e1e713fc46bf0783ca6e0a72a39d6671a6b57.camel@intel.com>
References: <20230926190518.105393-1-alan.previn.teres.alexis@intel.com>
 <20230926190518.105393-4-alan.previn.teres.alexis@intel.com>
 <9ca17c5c-7bb4-ff6b-69cb-3983299729c1@linux.intel.com>
 <123edf6b37aa982de20279d64c213156a2dc8c2e.camel@intel.com>
 <fad657e7-beec-75fc-9003-5883412d6e6b@linux.intel.com>
In-Reply-To: <fad657e7-beec-75fc-9003-5883412d6e6b@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|SJ2PR11MB7455:EE_
x-ms-office365-filtering-correlation-id: 07bf4eb3-383a-4b1b-0052-08dbc503a5df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9yoOucAiI43DjCNWzBLCKn+T0A1pSm3FcEUZ9bFd7s2CpTq81/CYA82W/GckfADsjO+PxvpnsTskNsmMC3oxPzQ07gHoHlracZPCRlIOZgj3BpTsplq0ZHUbvxeW0VhnSaTpoZsziekfZgxMskF/zrryjFZRZFm0n+VJYC9AfwFinksAcDFHnkfdsesdIQ3sOTRh+jEqaauOFgeQ9WE5sjTgTfhObku0fHrDwKCaOqEMYrdoj2x8bjnh6ahu+8CMOK/tJpro5wj4YXScK5nFqE5+Bxo+aiktlVAazuPoL8lNFxrvWknwzxvLG0hhUobv42qEXb/Z0RC3gTfTZ69pM4qjZVJATQpkH69S6KRvuNmHMjOSlnWrXhGiaXUmx9RP0bCOB+09tXo8v8swXL2Y46MqqhMqLDO0KRYDUj/Zo5nFl96H7pFTDiVD6IB6LM7L1JO/mMINWjblOWueT7OBNsTMVq0lQDb2Y+mc1brrynDToClEoA2v+YHyaaCKdbOdBEbQd/3YDV3SOkjSoE225WFH6wYQBYVTj6Dd3KAlelMl50ZJf3+oJ11ihS9HUqIzWO7MswYpltcfFtjyZt+DFog3WSzY+Z64fR50DYuT2EqubTH0qycoQ6JCooFd/yrD
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(376002)(39860400002)(366004)(346002)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(26005)(478600001)(53546011)(6506007)(6486002)(71200400001)(86362001)(38070700005)(15650500001)(122000001)(38100700002)(82960400001)(83380400001)(2616005)(6512007)(66446008)(36756003)(2906002)(54906003)(76116006)(66476007)(4326008)(5660300002)(110136005)(41300700001)(8676002)(316002)(66556008)(66946007)(8936002)(64756008)(91956017);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V0xQaFJhYjhDMTlHQnZORnNqTUhML3RVeHVMaGJiS1Q0QXg2TlBNY25qdHZP?=
 =?utf-8?B?VDRMMG9ZaUUwV0d3M3BpN2hwSDl3M1ZaQVJZMVpFSHhlbHk3dFZJNnNHcXMx?=
 =?utf-8?B?a0pvdGZxNmRZY1Fzd2o2Z1MrME1RdGZmQ0Z0ZlVKNlI0UEEza1ZXdTEvL1pl?=
 =?utf-8?B?V2FCbkV5RTE1b2lxVUtLQTJpQThFb2owekpaM1VZSmRJWmdFeU1DenQybm9U?=
 =?utf-8?B?QXF0MmRESEJ0VXcvUTh4YVp6eDB5K0F2dzhuNURWNWtzM0Vwd1NJR25BaFFZ?=
 =?utf-8?B?cnY3TnB0Ty9lM3puYlpqck84a2lrZSsrZ1llM1ZaYmc0MWZzRG5SaHZ5cXdU?=
 =?utf-8?B?TnhoVkMreWRZY0xwZTdrOWZ0T0lDTDRldnVqenBpNnJQUndvZmxaMjlPb1Jx?=
 =?utf-8?B?M1o1SGF3aWxYdFl2cnBBeThpZWZTREErKzViaFI5OEZIdVo1RmpCRVZPRWQ1?=
 =?utf-8?B?UmxzMnlxcjJmMEw1WUlQK1QwWXJ3T3BLd2xlKzZsQVVCdlRnVUhEVGw1U0Nn?=
 =?utf-8?B?Ym44RUlSVnJ5SlJlRzVhaWpXcmdIblUyRkgvTE9UUm1IOHB1TE02MzNKaUdB?=
 =?utf-8?B?KzVmSG9tV1VnQTVNZWQ5K25uaVkrUVhNTkh6ZGd1UU5pQzUyVDRtejJpNU01?=
 =?utf-8?B?MnV2WnFWc1NkVyt2VkxtR2Z4djAxSnVOdDNwbWdaNHdDMCttb3E1WVQ0WlpG?=
 =?utf-8?B?OGJ1SmpUNHlrUlRhcHVjMlJ6UjRhSmdFb1I0WFZPMXBFRzJydU1KM0Z4MXRa?=
 =?utf-8?B?Q29ldFVVaEc2Z2VBelJtK0dXZUc3K01Fd21mTWl1Y3cvcFJ6bnBjNWVuN3BM?=
 =?utf-8?B?WFl3c1VsVU13RGx6VWdLWlpJV3NIK2hVV2VGNWc0SWtWY3BIRFBhVzN0YWk3?=
 =?utf-8?B?Wm81QnQzeVF0ZkVTeGpIVW9veW05NWlGQURhTE9sU3VRMExhVDEzdU9Qdk9y?=
 =?utf-8?B?NnJZUUZiaU8zR0M3aFlpTDFTT3NVNzBMczlsNk0vbmNrQ3lQeW9CYXM1NkMy?=
 =?utf-8?B?eXphSVhhY3Fxbnd5M3FmdUVxZVpSSDVmVktnSmFBSkJFWkdidDB6SmwwcCt4?=
 =?utf-8?B?VE1tMm1QN2NiNUl0RnpYbkNJZEVvcHFFSGJ1dk1zd2QrWURoS0c5dWxYWU1i?=
 =?utf-8?B?ZytXdUZia1d0RXk4U2VEeWlTMjJKTFVqeVJoODRFRmUweGJnT0lucmw0bGNn?=
 =?utf-8?B?Ujg4SERGcXdLWTZCNUdyTUhlVWhNQWJ4S0lTc29yZGhFeEQ2R3doL3o0cFdM?=
 =?utf-8?B?NHpobk1VdkQ5YWY1WEoyTDdyejYxN3ZXa2FVRVVZcExHQkNlVjJOVVVjV0lB?=
 =?utf-8?B?VWZ3OFhZNHhiL01nT3gweFJabUl0U05HbW9KVmxwSjZLVGp4TnBnY05qVHlQ?=
 =?utf-8?B?dllEWTErOUdaaHByRDZVa3Y4Q25SVVhTTjV5QXY5R1FlUGZ6QnVqdStXajVM?=
 =?utf-8?B?WWVIbldkM0x6S2tZZ3dpaVZRUjV3SWdpdlVaTTMvY1M3cWNYRjNrVzlXWmdF?=
 =?utf-8?B?WGl5ZW9NUS9HenJyRzBMcEhlT0wxWU5vY1BnQWFQVm5uYy9nNnV1K2xVOEhH?=
 =?utf-8?B?ZmRiVitKTXQyMkpiNW1OWXdtbWx4SlZvVkE2bmF5T3RpZU1VZ1h4OU0yYXhU?=
 =?utf-8?B?WVQ5Z21qU1hJdVVBMzc3SHNXbmsvM3VENlUyWWV6SkhLZDNnNStpUGdvRHd5?=
 =?utf-8?B?ZklrazBLZTMwQjMwQm1lR1lRY05kQ25uZWZrdUM5aEs5N1lMTTVLbG1CVEJR?=
 =?utf-8?B?OEJOU1pocnhSOGM4VjY1MWNsSmhxTTlQVUMzT2UyMnZwb1BpbVVOR2JCS1gv?=
 =?utf-8?B?U2NVNzZlYSszb1dkQTZwY0ppbkdOZ3c5c2YxeC9scldwd01HOXpjRmk5Vkxs?=
 =?utf-8?B?bFJERThKWXlIZDJSYlEzMmhHZFpZWlpXOEkvTit6RklxVUNaOVlqeDUrZjl1?=
 =?utf-8?B?WmdQdC85SXFDdE9vczg4VFBpTWg2R2E5Yjl0YThoTXQ3aElsVFhhVFF5cEw4?=
 =?utf-8?B?cXFHN0M0YmR3RzlyeEpiUUZBcVZQVTZiTlo2ODlpR2I4RVBJOGlnRkVkVkl5?=
 =?utf-8?B?K3dqUlgrMk4zWFROQ3BUR0FXbEtsSHhQME9GY2htNm5qVGdGSHFKdVYzOC9R?=
 =?utf-8?B?RUFYMFZ2T3VVM1dPOFNrUERUNDR1NmtZWlZVZS84TktPRXF2N1NUSlRhU0RJ?=
 =?utf-8?Q?aPAVFt/ZNVvNJN7xrF2AlxU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CA9D96D912FDE0409E766C19A05E62FE@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07bf4eb3-383a-4b1b-0052-08dbc503a5df
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2023 17:59:26.1303 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OThZ8c0362Lo489ORH25dEsHUHS1ELQqQYjzg4IFuqytTFB6nWWW7Z6jKz8lQjdP08pugKIbmocwu6emngSM4hqRgUKrOdYJSNUURoUiq8oMqUNOMy1fATI3Exkitlow
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7455
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
Cc: "Jana, Mousumi" <mousumi.jana@intel.com>,
 "intel.com@freedesktop.org" <intel.com@freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTA5LTI4IGF0IDEzOjQ2ICswMTAwLCBUdnJ0a28gVXJzdWxpbiB3cm90ZToN
Cj4gT24gMjcvMDkvMjAyMyAxNzozNiwgVGVyZXMgQWxleGlzLCBBbGFuIFByZXZpbiB3cm90ZToN
Cj4gPiBUaGFua3MgZm9yIHRha2luZyB0aGUgdGltZSB0byByZXZpZXcgdGhpcyBUdnJ0a28sIHJl
cGxpZXMgaW5saW5lIGJlbG93Lg0KYWxhbjpzbmlwDQoNCj4gPiA+IA0KPiA+ID4gTWFpbiBjb25j
ZXJuIGlzIHRoYXQgd2UgbmVlZCB0byBiZSBzdXJlIHRoZXJlIGFyZSBubyBwb3NzaWJsZQ0KPiA+
ID4gaWxsLWVmZmVjdHMsIGxpa2UgbGV0dGluZyB0aGUgR1BVL0d1QyBzY3JpYmJsZSBvbiBzb21l
IG1lbW9yeSB3ZQ0KPiA+ID4gdW5tYXBwZWQgKG9yIHdpbGwgdW5tYXApLCBoYXZpbmcgbGV0IHRo
ZSBzdXNwZW5kIGNvbnRpbnVlIGFmdGVyIHRpbWluZw0KPiA+ID4gb3V0LCBhbmQgbm90IHBlcmhh
cHMgZG9pbmcgdGhlIGZvcmNlZCB3ZWRnZSBsaWtlIHdhaXRfZm9yX3N1c3BlbmQoKSBkb2VzDQo+
ID4gPiBvbiB0aGUgZXhpc3RpbmcgdGltZW91dCBwYXRoLg0KPiA+IGFsYW46IHRoaXMgd2lsbCBu
b3QgaGFwcGVuIGJlY2F1c2UgdGhlIGhlbGQgd2FrZXJlZiBpcyBuZXZlciBmb3JjZS1yZWxlYXNl
ZA0KPiA+IGFmdGVyIHRoZSB0aW1lb3V0IC0gc28gd2hhdCBoYXBwZW5zIGlzIHRoZSBrZXJuZWwg
d291bGQgYmFpbCB0aGUgc3VzcGVuZC4NCj4gDQo+IEhvdyBkb2VzIGl0IGtub3cgdG8gZmFpbCB0
aGUgc3VzcGVuZCB3aGVuIHRoZXJlIGlzIG5vIGVycm9yIGNvZGUgDQo+IHJldHVybmVkIHdpdGgg
dGhpcyB0aW1lb3V0PyBNYXliZSBhIHN0dXBpZCBxdWVzdGlvbi4uIG15IGtub3dsZWRnZSBvZiAN
Cj4gc3VzcGVuZC1yZXN1bWUgcGF0aHMgd2FzIG5vdCBncmVhdCBldmVuIGJlZm9yZSBJIGZvcmdv
dCBpdCBhbGwuDQphbGFuOlR2cnRrbywgeW91IGFuZCBJIGJvdGggc2lyLiAoYXBvbG9naWVzIGZv
ciB0aGUgdGFyZHkgcmVzcG9uc2UgeWV0IGFnYWluIGJ1c3kgd2VlaykuDQpTbyBpIGRpZCB0cmFj
ZSBiYWNrIHRoZSBndC0+d2FrZXJlZiBiZWZvcmUgaSBwb3N0ZWQgdGhlc2UgcGF0Y2hlcyBhbmQg
ZGlzY292ZXJlZCB0aGF0DQpydW50aW1lIGdldC9wdXQgY2FsbCwgaSBiZWxpZXZlIHRoYXQgdGhl
IGZpcnN0ICdnZXQnIGxlYWRzIHRvIF9faW50ZWxfd2FrZXJlZl9nZXRfZmlyc3QNCndoaWNoIGNh
bGxzIGludGVsX3J1bnRpbWVfcG1fZ2V0IHZpYSBycG1fZ2V0IGhlbHBlciBhbmQgZXZlbnR1YWxs
eSBleGVjdXRlcyBhDQpwbV9ydW50aW1lX2dldF9zeW5jKHJwbS0+a2Rldik7IChoYW5naW5nIG9m
ZiBpOTE1KS4gKG9mYywgdGhlcmUgaXMgYSBjb3JyZXNwb25kaW5nDQpmb3IgJ19wdXRfbGFzdCcp
IC0gc28gbm9uLWZpcnN0LCBub24tbGFzdCBpbmNyZWFzZXMgdGhlIGNvdW50ZXIgZm9yIHRoZSBn
dC4uLg0KYnV0IHRoaXMgbGFzdCBtaXNzIHdpbGwgbWVhbiBrZXJuZWwga25vd3MgaTkxNSBoYXNu
dCAncHV0JyBldmVyeXRoaW5nLg0KDQphbGFuOnNuaXANCj4gPiANCj4gPiBSZWNhcDogc28gaW4g
Ym90aCBjYXNlcyAob3JpZ2luYWwgdnMgdGhpcyBwYXRjaCksIGlmIHdlIGhhZCBhIGJ1Z2d5IGd0
LXdha2VyZWYgbGVhaywNCj4gPiB3ZSBkb250IGdldCBpbnZhbGlkIGd1Yy1hY2Nlc3NlcywgYnV0
IHdpdGhvdXQgdGhpcyBwYXRjaCwgd2Ugd2FpdCBmb3JldmVyLA0KPiA+IGFuZCB3aXRoIHRoaXMg
cGF0Y2gsIHdlIGdldCBzb21lIG1lc3NhZ2VzIGFuZCBldmVudHVhbGx5IGJhaWwgdGhlIHN1c3Bl
bmQuDQo+IA0KPiBJdCBpcyBub3QgcG9zc2libGUgdG8gd2FpdCBmb3IgbG9zdCBHMkggaW4gc29t
ZXRoaW5nIGxpa2UgDQo+IGludGVsX3VjX3N1c3BlbmQoKSBhbmQgc2ltcGx5IGRlY2xhcmUgImJh
ZCB0aGluZ3MgaGFwcGVuZWQiIGlmIGl0IHRpbWVzIA0KPiBvdXQgdGhlcmUsIGFuZCBmb3JjaWJs
eSBjbGVhbiBpdCBhbGwgdXA/IChXaGljaCB3b3VsZCBpbmNsdWRlIHJlbGVhc2luZyANCj4gYWxs
IHRoZSBhYmFuZG9uZWQgcG0gcmVmcywgc28gdGhpcyBwYXRjaCB3b3VsZG4ndCBiZSBuZWVkZWQu
KQ0KPiANCmFsYW46IEknbSBub3Qgc3VyZSBpZiBpbnRlbF91Y19zdXNwZW5kIHNob3VsZCBiZSBo
ZWxkIHVwIGJ5IGd0LWxldmVsIHdha2VyZWYNCmNoZWNrIHVubGVzcyBodWMvZ3VjL2dzYy11YyBh
cmUgdGhlIG9ubHkgb25lcyBldmVyIHRha2luZyBhIGd0IHdha2VyZWYuIA0KDQpBcyB3ZSBhbHJl
YWR5IGtub3csIHdoYXQgd2UgZG8ga25vdyBmcm9tIGEgdWMtcGVyc3BlY3RpdmU6DQotICBlbnN1
cmUgdGhlIG91dHN0YW5kaW5nIGd1YyByZWxhdGVkIHdvcmtlcnMgaXMgZmx1c2hlZCB3aGljaCB3
ZSBkaWRudCBiZWZvcmUNCihhZGRyZXNzZWQgYnkgcGF0Y2ggIzEpLg0KLSBhbnkgZnVydGhlciBs
YXRlIEgyRy1TY2hlZERpc2FibGUgaXMgbm90IGxlYWtpbmcgd2FrZXJlZnMgd2hlbiBjYWxsaW5n
IEgyRw0KYW5kIG5vdCByZWFsaXppbmcgaXQgZmFpbGVkIChhZGRyZXNzZWQgYnkgcGF0Y2ggIzIp
Lg0KLSAod2UgYWxyZWFkeSksICJmb3JjaWJseSBjbGVhbiBpdCBhbGwgdXAiIGF0IHRoZSBlbmQg
b2YgdGhlIGludGVsX3VjX3N1c3BlbmQNCndoZW4gd2UgZG8gdGhlIGd1YyByZXNldCBhbmQgY2xl
YW51cCBhbGwgZ3VjLWlkcy4gKHByZS1leGlzdGluZyB1cHN0cmVhbSBjb2RlKQ0KLSB3ZSBwcmV2
aW91c2x5IGRpZG50IGhhdmUgYSBjb2hlcnJlbnQgZ3VhcmFudGVlIHRoYXQgInRoaXMgaXMgdGhl
IGVuZCIgaS5lLiBubw0KbW9yZSBuZXcgcmVxdWVzdCBhZnRlciBpbnRlbF91Y19zdXNwZW5kLiBJ
IG1lYW4gYnkgY29kZSBsb2dpYywgd2UgdGhvdWdodCB3ZSBkaWQNCih0aGF0cyB3aHkgaW50ZWxf
dWNfc3VzcGVuZCBlbmRzIHd0aCBhIGd1YyByZXNldCksIGJ1dCB3ZSBub3cga25vdyBvdGhlcndp
c2UuDQpTbyB3ZSB0aGF0IGZpeCBieSBhZGRpbmcgdGhlIGFkZGl0aW9uYWwgcmN1X2JhcnJpZXIg
KGFsc28gcGFydCBvZiBwYXRjaCAjMikuDQoNClRoYXQgc2FpZCwgcGF0Y2gtMyBpcyBOT1QgZml4
aW5nIGEgYnVnIGluIGd1YyAtaXRzIGFib3V0ICJpZiB3ZSBldmVyIGhhdmUNCmEgZnV0dXJlIHJh
Y3kgZ3Qtd2FrZXJlZiBsYXRlLWxlYWsgc29tZXdoZXJlIC0gbm8gbWF0dGVyIHdoaWNoIHN1YnN5
c3RlbQ0KdG9vayBpdCAoZ3VjIGlzIG5vdCB0aGUgb25seSBzdWJzeXN0ZW0gdGFraW5nIGd0IHdh
a2VyZWZzKSwgd2UgYXQNCmxlYXN0IGRvbid0IGhhbmcgZm9yZXZlciBpbiB0aGlzIGNvZGUuIE9m
YywgYmFzZWQgb24gdGhhdCwgZXZlbiB3aXRob3V0DQpwYXRjaC0zIGkgYW0gY29uZmlkZW50IHRo
ZSBpc3N1ZSBpcyByZXNvbHZlZCBhbnl3YXkuDQpTbyB3ZSBjb3VsZCBqdXN0IGRyb3AgcGF0Y2gt
MyBpcyB5b3UgcHJlZmVyPw0KDQouLi5hbGFuDQo=
