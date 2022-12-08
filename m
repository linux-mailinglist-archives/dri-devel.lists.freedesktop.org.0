Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 311F664681A
	for <lists+dri-devel@lfdr.de>; Thu,  8 Dec 2022 05:09:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDB6210E452;
	Thu,  8 Dec 2022 04:09:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 479AD10E1BC;
 Thu,  8 Dec 2022 04:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670472562; x=1702008562;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=mhF05jrDe5M9Un7zb5Q2bXMdRk7lJv36Fg1g6De4YqY=;
 b=b5IVqTS3iq4jhD0bf2xieD6zT8ny3b3E8iEB1/owQ0s8kIzsZYbKllWK
 TttLTPEifBAxYnebNXl/7PmmDmQiXpZ+b2C+0wVxiPFPTtup1PQB5UvSL
 u7r9BVm7FCJB9BY9k+gZ/Zknmh1de4Ehs/N13IFVNJ/B+KRGuusmBrekI
 Eusv5ywOwiOdMzSc9b6jpP6h00qK1ejNewCRvsAt9IgBANC0epMRoYXA+
 Ve2HoKyACM+X7v0Pm3hDXu4fQGJhWvtqR4jvaIfn8Rj6YvUMfaTl9I6FB
 hR+ykGmfC08xZSnAq7LSPjPTSAGIhorsT3v1IiR3XV+j5tqRG2onCTOP+ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="318919970"
X-IronPort-AV: E=Sophos;i="5.96,226,1665471600"; d="scan'208";a="318919970"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2022 20:09:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="771340104"
X-IronPort-AV: E=Sophos;i="5.96,226,1665471600"; d="scan'208";a="771340104"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 07 Dec 2022 20:09:21 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 7 Dec 2022 20:09:20 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 7 Dec 2022 20:09:20 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 7 Dec 2022 20:09:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NEAffUw6BqaXQujIArG46Eymt7b2fKHi8ypL8e/hU5mzkWBq3iLfH9G4cDutxjYFRvjwRbJ3ARbbvlk/7fV7W2PdxJruq3W0OxNEflKM/DoTj7z3h7yV1XCly23r2PgkzRftAWKNUXe0PNr0/hBqmdUI+tnVXn8m0qdIDih3yx/LxI/jMKTbRst2EW6h6JvhPzAFfFPDHHFvtHLXJuGjeilLt1tNlIwPut9Isd37hCmtgCJe5ZKeWTCrO0JxAtnR6KLrg+6SqsQFRhUSg5LkuPAeMSjBzBrY/dUt0FSbgIVOnxO9SwNMRLu4IyNixu83OdjpjTeduxd3kiIHiMDFjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mhF05jrDe5M9Un7zb5Q2bXMdRk7lJv36Fg1g6De4YqY=;
 b=XV6qCCPt8dFOlUo0t/O3LC92ahV2UCYmzlhZvDk7ayDGqq2IerAiv5nBoRQeAZepT0yqY7bIBsxqfqYpKnMQCxhcEFJfy4F4fN8+DhRrtgNcMfZvubKGjsd9ZMI5IsnQx1tR0p9Q5CnjTsKmqAWdM+phjPWR5M1WI+Gp+1YnuMAv3KBDcyn4f5bPyC/yif8b7p6LU5kqht+NHc7d3vTxGCZCLyCT7XP/YbQatH3Ien2xXz/TPBJUdyN9rJOst+FdeUZA54/LCiDZKB2VLQ49NIlwlFxoaaPS+otRCfocMhgLOlhfcY28QSZcomMMVD2CAyyMfT5kgabXDe/AXcMxDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 SA2PR11MB5099.namprd11.prod.outlook.com (2603:10b6:806:f9::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5880.14; Thu, 8 Dec 2022 04:09:19 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::6894:1dbc:4681:66b6]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::6894:1dbc:4681:66b6%4]) with mapi id 15.20.5880.014; Thu, 8 Dec 2022
 04:09:19 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/6] drm/i915/uc: Introduce GSC FW
Thread-Topic: [PATCH v2 1/6] drm/i915/uc: Introduce GSC FW
Thread-Index: AQHZCRA74ydlLR8OrEu2JDCyZnKpIa5jZFkA
Date: Thu, 8 Dec 2022 04:09:18 +0000
Message-ID: <22ea213325fc16966c55632642d73e8ed837f569.camel@intel.com>
References: <20221206011908.2745508-1-daniele.ceraolospurio@intel.com>
 <20221206011908.2745508-2-daniele.ceraolospurio@intel.com>
In-Reply-To: <20221206011908.2745508-2-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|SA2PR11MB5099:EE_
x-ms-office365-filtering-correlation-id: f979e9e3-9c87-41bc-6952-08dad8d1fa92
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TM6d+BnuAp35v8do/wY4aZrwTsuvzaQ6k38oF+OgYPJ1vzP8JNlMDtJl2TbyM6z2NgWesvwkCAsrQqE/F8s9aMjnOovoV49d3BdYZDaIypEFbMYMp2WuxlDzGswQITAQPJJaIDHDno549J6nWB4zKR4ZvNkhpayUlhKos6CAqOxoe0VeRCB69AgpT/oScfWtD7iEYVABqNWn0z/9pi/FJDbTT/c2PB/CQ0beFc3RhU0Qfw37hCYTEjaFeK7/RcOIiXItgk1mGMXytkmkkp4QjadnnLrZLj9xhlqVH//ZCbo8I8TDTnw/Ur9uoB3tlZcT5/nKwvMmDIHuvco/NeHJKmMkp8Y00uZQ8Sh0Dya2xAqbQFMva12O+06braMRuw6L4B1fLdPosEhn+yuEDwHNYhp/61bAEEnlJZbFVyznu9co4BqUaM0afwnuscwxxcDlAJwzSQLd59fWaFtXCvn8zYIKOKgXC3Bn8Fe1YqQY+Blu8+KWmTfb6A7hgSsisDtl97HXUQd/SEl+/8wD3UiHIvUrKG12dxU1LDVG1MqoBMXqbYaYqZ8EQoufmfCo6NPQrYa8TzaxR2O81pfuVoyb3MGAnGglzHp4EUltnTdOd0+7C6j+dsh0fO5WlJ32rOmThUPiWbkiBlAcu22wCDXmALtfc/sr0qw4xXMb1kUX3TGLwtQLP+z8gjqybbM9osHC+3wIzZEKrsMjSFhD1LWUzA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(366004)(346002)(136003)(39860400002)(376002)(451199015)(66476007)(66556008)(316002)(64756008)(76116006)(66446008)(91956017)(8676002)(5660300002)(4326008)(71200400001)(122000001)(66946007)(8936002)(38100700002)(41300700001)(186003)(478600001)(54906003)(110136005)(36756003)(2616005)(6486002)(4744005)(82960400001)(6506007)(38070700005)(2906002)(83380400001)(6512007)(86362001)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZkEzZzA1b2hvMlBDTHpmbTltSHJjMTdKRnNUOW5OR0Z6M2ZkcXJKazVwMzR0?=
 =?utf-8?B?aWFJbmdVbzVPdzdDSDFyRFJYeElTUWc0UmRpaHhreUZPdXVYU3g0RXdGS1V6?=
 =?utf-8?B?ZHArc0VMc2JiSS9yZ0tNTktiTVFGZjZOeXZVUkdqWVRsNVNkQjliNlNCS3I3?=
 =?utf-8?B?SzN2d0RBVkZiK3k5dWsrYWxjdWh1UkUzSC85YXEwZnlKaXZVc1VmWGRLUVMr?=
 =?utf-8?B?UHdKSXB1aVd5WXl6dzU4eHovQnNMZFdBZTUwbUl4L1R6cmZRYlZuYlV1TjN0?=
 =?utf-8?B?SzRrMVNiMHJzNWd5WWdYM09acVhBUG9pOXdId3NBT1JKaEhsK0V4S1dpWGZF?=
 =?utf-8?B?QlhkN2NWZjBEeEpIQVhWZitzSnRVLzgxU2k1Q1FFeVRXMnVkaEZkVTR1cWhK?=
 =?utf-8?B?K1h5RkdBb0dobzVyL0E5TVVEODkzRFBMMy91MGhnMEE0QUUyR2ptb0I5akJr?=
 =?utf-8?B?WWNQcmlscUxFb0huS0ZFalkrZHR0VlFRTWJLcEhFRzdScmxmd2ZBZ1E2UXhT?=
 =?utf-8?B?a0EwWTVqbWV0ekxVOUFiTVRGUG9ac2VrTEx0RnBBMHhzdFFxVWl6ZXF2aXpl?=
 =?utf-8?B?QlhNWmUwYURBM3BIMHp0a0Nsdk9odE9rVnkwa2FZUXU1TFBQN2lGbWZGa0hj?=
 =?utf-8?B?WU93OVVxa0lKcThvQVFQc2RxN2xRb2ZxNFkyRi9kc08venNVMnVjZnl2bUNX?=
 =?utf-8?B?dUlCTElPcjJqMm5NOEJkYVFoN0ZOVHRsYUVYWVFuUnBqMktWVlNmS2FybTdw?=
 =?utf-8?B?Mk5jcDBvdk5VREYrbEtoVUlKbTlhTlkxSDEyL2tPSk14YWVkUHppVXZnNnY1?=
 =?utf-8?B?WExvME4wMlB5WGFRMHlQeVBEeWtPTWpGTFlhZXZtUnZZVkRFUWJtUDlOdGgw?=
 =?utf-8?B?dXB0N3hkNlJtY0JOV05QRmdTcDJ4NmJjWGdEbnlWbUJESStxbE5HNzJ2VlhV?=
 =?utf-8?B?Z2hvYzRiZDB6djJoS0l3b21wbS9qZVBnTEFROHpGVEZzOFd2R0JBYkQyZDFL?=
 =?utf-8?B?b1NhVEVzNU40TFVOMUMza2pMYWl0QnpnNHhDb1FvaFdKVXgrN09PNUJjMG4w?=
 =?utf-8?B?Wld1ZmZFelFoa3QxNGxRSHlXSjMwdUswU3ZKOHNQWkFCMUo3dlJVamFLUGxl?=
 =?utf-8?B?a1JOeDRocC90Q2FLUEp1a2tkekhSalg4d1FPZmFJWHZ4MEJHQUd3ak9MUzd4?=
 =?utf-8?B?aHVYOHVXUXFxM2dha1ZObG16OW5PaWgwUHdtVG84M1FVZ3puRGlpai9zZnpq?=
 =?utf-8?B?dzkySmdrTU5sZE5iNUU2cTY4SGcza3B0QmEyTDdiOURHN1V3M2RiNVdhemNr?=
 =?utf-8?B?QlRlMEFKc0pnTm5PdG5tOVkvZlEzcGhVOTFMZytDOGc5bTdvVElGNWg4dnIz?=
 =?utf-8?B?RHdSdnlhUlVtS0hFTkVxcmMvNDh0enFNN0pLSW43bVFXdWtjZktqeVN6RXZX?=
 =?utf-8?B?WjAxb2dCNTBsNU5MV2JFUFZiRGRaMjlCNS9NR2JtenRHYVo4a0dJdHEvdm1C?=
 =?utf-8?B?aWxvaHVTTDdJZEtSWkZkVzZ2dmd5a3hyQzdHMnJmVVpmQkV4aWZyRkhQYmtv?=
 =?utf-8?B?NC9UcDRjL3F4aWtseVRvejdrNlpOVXdUc0RBSU96SDhsMWlHTDFaM09YZWsy?=
 =?utf-8?B?T2p2N0N2T1Z2QmdUbDRqcVF5OThrUm1pbHVWN3VzVDMrTU9JcjVLdWp2Skt2?=
 =?utf-8?B?aUd3dGJpQkduSDQvK3JHMEJEV3ZrK2kwMUlwWEdQZm9PeDlUVFdhN1VMUU9E?=
 =?utf-8?B?NVNYWWZBQkllMEVYQ0lQUDM2dG9KM0Jid0p4SWY0MVlJMUM1b2xOQ0swTUgr?=
 =?utf-8?B?U01oUWVOV3daeEZuWUhhK0dBTFQ1Qkpld21FdW03cGIwWXZjbjNvcGM0YUl1?=
 =?utf-8?B?Q0ZsVWo0VlZ2Ly85WUE1d1BKZnFHRXJ6YTV5WFhVTDMrUlFlL1ZkeE5CQU1o?=
 =?utf-8?B?aUFnUm5TbVVobmlRYzdPQU5SeDBQbFZ5SjYyeTdNOTFJeWptaElGclZOeXFE?=
 =?utf-8?B?QlYvaFAySDJxaDFOb2NPMGgzQmFsVEkrQWhiUlBuelFpMlQwZkNTZFFoeHk4?=
 =?utf-8?B?QlJ5STBBNHdoeStzY1BhR3laZU9yRFRDT0lwSDllOStxMVAyTTBjQkttMGZy?=
 =?utf-8?B?UW8zN0paUmpmN29JdlFqdFhBb1JEbERjdGh6NS95YmJkSkRZUWN6ZDI5c0J3?=
 =?utf-8?Q?bO7dQMoxzMyO6wjldfvrGgY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <76D31FFE16AA7A46BCDDC98B01CFEBEB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f979e9e3-9c87-41bc-6952-08dad8d1fa92
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2022 04:09:18.9697 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m8JO+Z5nJjSj01xFFnM2bQMqJm1j3HBXg0Ns2Bcp1VaUqcSkGkSM1w/tN1CSgBO0UqevsA+U6QrKqbKPDkgvETg6XoJIPhIWrAC/fDZ8lbJuPOmUgCFYxPJpJEOD64fa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5099
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
Cc: "Harrison, John C" <john.c.harrison@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIyLTEyLTA1IGF0IDE3OjE5IC0wODAwLCBDZXJhb2xvIFNwdXJpbywgRGFuaWVs
ZSB3cm90ZToNCj4gT24gTVRMIHRoZSBHU0MgRlcgbmVlZHMgdG8gYmUgbG9hZGVkIG9uIHRoZSBt
ZWRpYSBHVCBieSB0aGUgZ3JhcGhpY3MNCj4gZHJpdmVyLiBXZSdyZSBnb2luZyB0byB0cmVhdCBp
dCBsaWtlIGEgbmV3IHVjX2Z3LCBzbyBhZGQgdGhlIGluaXRpYWwNCj4gZGVmcyBhbmQgaW5pdC9m
aW5pIGZ1bmN0aW9ucyBmb3IgaXQuDQo+IA0KPiBTaW1pbGFybHkgdG8gdGhlIG90aGVyIEZXcywg
dGhlIEdTQyBGVyBwYXRoIGNhbiBiZSBvdmVycmlkZW4gdmlhDQo+IG1vZHBhcmFtLiBUaGUgbW9k
cGFyYW0gY2FuIGFsc28gYmUgdXNlZCB0byBkaXNhYmxlIHRoZSBHU0MgRlcgbG9hZGluZyBieQ0K
PiBzZXR0aW5nIGl0IHRvIGFuIGVtcHR5IHN0cmluZy4NCj4gDQo+IE5vdGUgdGhhdCB0aGUgbmV3
IHN0cnVjdHVyZSBoYXMgYmVlbiBjYWxsZWQgaW50ZWxfZ3NjX3VjIHRvIGF2b2lkDQo+IGNvbmZ1
c2lvbiB3aXRoIHRoZSBleGlzdGluZyBpbnRlbF9nc2MsIHdoaWNoIGluc3RlYWQgcmVwcmVzZW50
cyB0aGUgaGVjaQ0KPiBnc2MgaW50ZXJmYWNlcy4NCj4gDQo+IHYyOiByZS1vcmRlciBNYWtlZmls
ZSBsaXN0IHRvIGJlIHByb3Blcmx5IHNvcnRlZCAoSmFuaSwgQWxhbiksIGJldHRlcg0KPiAgICAg
Y29tbWVudCAoYWxhbikNCj4gDQpBbGFuOltzbmlwXQ0KDQpBcyBwZXIgb2ZmbGluZSBjb252ZXJz
YXRpb24sIGkgcmUtcmV2aWV3ZWQgdGhlIGRpZmZlcmVuY2UgZnJvbSBSZXYxIHRvIFJldjIgLSBp
LmUuIGp1c3QgdGhlIG1ha2VmaWxlIGFuZCB0aGUgY29tbWVudCBjaGFuZ2VzLCBhbGwgbG9va3Mg
Z29vZCwgc286DQpSZXZpZXdlZC1ieTogQWxhbiBQcmV2aW4gPGFsYW4ucHJldmluLnRlcmVzLmFs
ZXhpc0BpbnRlbC5jb20+DQo=
