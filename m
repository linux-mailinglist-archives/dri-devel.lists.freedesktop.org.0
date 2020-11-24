Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AA52C3214
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 21:43:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C702A6E062;
	Tue, 24 Nov 2020 20:43:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32E456E062
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 20:43:44 +0000 (UTC)
IronPort-SDR: 1j7kTe8fDkURsmqjS+EgXuiwRZ2jFjadJNvnK9KrFE3N388iGpcB6vyDKvAuGSIKYL+CtIv3qG
 OtYK+4HpluXA==
X-IronPort-AV: E=McAfee;i="6000,8403,9815"; a="171233963"
X-IronPort-AV: E=Sophos;i="5.78,367,1599548400"; d="scan'208";a="171233963"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2020 12:43:43 -0800
IronPort-SDR: isAnOI/a4KPq0neyYliLYd/vRfJ8prFo2yqlp4uglYUEPqR60iXGb59bJ5qd/5Chg1FO2FMAN8
 QYI4FY3xMnXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,367,1599548400"; d="scan'208";a="370561532"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by FMSMGA003.fm.intel.com with ESMTP; 24 Nov 2020 12:43:43 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 24 Nov 2020 12:43:43 -0800
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 24 Nov 2020 12:43:42 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 24 Nov 2020 12:43:42 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Tue, 24 Nov 2020 12:43:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TSRsyg1lZDjnF6588/Fste9Up35FkEuxyevYVdx3QIXZ8tmE8kAHfSLXT5Pud7DNe5EsWOBE+ABd69BVwk4scEMjKnXir9sXjbRnmHEMYTQNA/ItX1/GazdR9HN5CR0YQENHJIPFtGSF8E9lok9q+hYUTDIMs/fX9rCHEU0aEK63Wg4DuMOjtkZ7hhC0/2axIAJZC9CujMbFMZ5dT7Y1L1oJ+HLWRDT82tWsgD4OpB3ISw7zUV3QJanyGVTaYf7jUKXfpTP8tuLled1Peyk6fhyL/SLyCLwiYyVLkv35yhGOaSPjhppf0fNNUDq6pm4eFZVjI2JtWFurhMhpigG9DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nXOcFpRauHgwNnl7UivTKFyEP1b7+1qT02xWdn/6R/c=;
 b=EP9QeCQ9n8W34GnBNqfoWamBQrl6CpxLF3jcNhqByVpikhkx1rIMMAgk2x4t58mhNGRhCnrcooiiRn3/AlH8zIMT35KKeT7dTsinjzPdNd6/L/gOfXdyrUQGD1DELFKqrhNQKhLiPw2m8Rgu4Lvma/mwUBAxyZ5W7Jqm7bhOldwpZVo+l/jF/29Vurl1aJn0fmZUiysnU/hmvysl3p1Ys5iRF0pqIh+ZdpcjBltLWkAF5euz7rXVU+NMsJM6QN94xfsxfSVnt3YwSMfsWF6smpD01aITSofp7jzk0RdJQKf2YcUT9lLJydkOQRrKU3utogRyRDFIyzmCNZpDLUWerw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nXOcFpRauHgwNnl7UivTKFyEP1b7+1qT02xWdn/6R/c=;
 b=GaNJnRZTE4eC4WWJwgvjH+qTyn6hymU7z3UdDvkDi66ws53wHGcUeF5R2foHCh8iOcEOLdJCqp0mMQ47bYQO4BT3rCiMoI+RC6QY39V9EsD/ObghdqmsfIotoBsxVmXc+ouSeZ9sZRf7g6PerW8iJlQRhOVqvSTB+e9IF0ad/M0=
Received: from MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24)
 by CO1PR11MB4945.namprd11.prod.outlook.com (2603:10b6:303:9c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Tue, 24 Nov
 2020 20:43:37 +0000
Received: from MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7510:71a5:3cfe:ab94]) by MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7510:71a5:3cfe:ab94%8]) with mapi id 15.20.3589.030; Tue, 24 Nov 2020
 20:43:37 +0000
From: "Xiong, Jianxin" <jianxin.xiong@intel.com>
To: John Hubbard <jhubbard@nvidia.com>, "linux-rdma@vger.kernel.org"
 <linux-rdma@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH rdma-core 5/5] tests: Bug fix for get_access_flags()
Thread-Topic: [PATCH rdma-core 5/5] tests: Bug fix for get_access_flags()
Thread-Index: AQHWwb+UQYxphObI7kixoosqOrApOqnXvNKAgAADYsA=
Date: Tue, 24 Nov 2020 20:43:37 +0000
Message-ID: <MW3PR11MB45558FDBAE1E7268E300C481E5FB0@MW3PR11MB4555.namprd11.prod.outlook.com>
References: <1606153984-104583-1-git-send-email-jianxin.xiong@intel.com>
 <1606153984-104583-6-git-send-email-jianxin.xiong@intel.com>
 <b2365ae5-25c4-2e06-51ac-e94fffc3b6fe@nvidia.com>
In-Reply-To: <b2365ae5-25c4-2e06-51ac-e94fffc3b6fe@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [73.53.14.45]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f20d1a47-4fa6-490a-45ad-08d890b99eb5
x-ms-traffictypediagnostic: CO1PR11MB4945:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO1PR11MB49455696019F83B9CA80B4A9E5FB0@CO1PR11MB4945.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EJ0ZIYx1ndMagSl2wb+usG7JLxIEbCDUHwJEPKVUfbZUwpqFNw8aVBabltgM33zBHg/TKIK0O20eBDTy96AXZTeIbRAFY5NuR4MRBng0HwcrnuDP4lJ3ZcGRm35j+3YwU6JS21z34yQ1ZcicRqXggilOPJ/hL2U72A6TIj/haCQ3kyvJyD4C8+jpPJceWNYl4Tm85W1cggktQ3bcYSoUxsoUcSVNUK1tygrdp04NzBwkLNzcYGqETszpxM133IzgaXVy98/O2N1Ra5vljkLCp7n0IF4QHDWFJ0bYW056Est7OMAk4GHeWjUIv+02RSg0WV7eBD+309Sui6sX0LGmnQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4555.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(366004)(396003)(136003)(66946007)(83380400001)(66556008)(66476007)(2906002)(66446008)(76116006)(54906003)(107886003)(110136005)(71200400001)(33656002)(8676002)(478600001)(64756008)(9686003)(52536014)(4326008)(6506007)(53546011)(7696005)(186003)(8936002)(5660300002)(26005)(86362001)(316002)(55016002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?a3JyQzIvT3lucHlid3h3MEhWb0lLWkkvR2lnYXp3Sm1uN3Jtb3lYTVhvZFl2?=
 =?utf-8?B?cTRXck0ydFpVK0FKQUh4QjNNejJZOEw2OTM5Uk16NjBacnI5TUxMbVFudVoz?=
 =?utf-8?B?V2ZtV0UyaGhoMVF2TmNxelhDMlhEcVM0Nlg3S3BDMlFpS2xHT3d5TWhRRFZJ?=
 =?utf-8?B?L0c3MGhkSzcvTDJ5c0VYRnkyRmh2alZod1lCeW44cmovZndxOWFHLzhYemNq?=
 =?utf-8?B?SXF3NTVHaXVwVWsvUEVvb3pOWERBd0MwT0kwU0xuNkNiOGVSR1VIeXFPQUUv?=
 =?utf-8?B?T1JRYkQ0eVFKeXVwTGMxemo2cTRWcWdNNFkzbXlic3RkNStOTXVaNHJuMGRS?=
 =?utf-8?B?R0ZsWmd5UWwzSG1zMWtNck9YMkN2QjJ0SU44cUMyYWZpK1k2OGcxSnRhUVlz?=
 =?utf-8?B?cmxKM1RuSzlrK3dpbnVqNURVRkIyTlJycEZ3RWE0SmdxNUhRM3c1MlQvWThI?=
 =?utf-8?B?cnd4N2xkYUZlQlFvd2crd2gxcVpLWHJ0RWhUSFVZYVV2dTEvazlMSXJMK0RO?=
 =?utf-8?B?aHAwUFZUdlJibFJnbytNUW9nMnJSVmtDL2EzRlZFYkd0amx3NjU0M1VTZWdF?=
 =?utf-8?B?bVRlL0REMjZsNW5XU0RoY3FWU2d0VXJEeHg1dkV4L2k3eEVUUzAveVZCUXFy?=
 =?utf-8?B?YkJrNU1CaVB3RnBzeSt1eFo5OVc3dWhvL0IzU0tybStTSHp5VCsyL0xaRGFJ?=
 =?utf-8?B?SWFxTWpSZEY0di8zN0ZCdnErMHZYYTdabEVKb0g4dzR1cU1ldXRjT2FPaUpl?=
 =?utf-8?B?eGtmcG0rcElRNHhLNUdLcUVJYnlGZExMWTBkN0hvZnora2FoOXFsNFVqa2ow?=
 =?utf-8?B?b2R0d3ZiQ3h4NWliSEdUd0oxUEpEa1NpYmxvL05Hdjl3Wk9WOWFwUjJzcWQy?=
 =?utf-8?B?ak55SzBNdkp3N01tSmsvQmFGYUpnbjE3OHE0RlkxNTNTYWg0RzNtYlVMdzJG?=
 =?utf-8?B?U1ZuNk5KTHRzTWJhU29idC9OZy9BZEtGY1JXZVFLMFdrTkR3VVdOTUxKUWR2?=
 =?utf-8?B?YTluaG5XbXA1S1JDN2FZbklFc2dTUVM1RHVjdHh2M3dLaWcwR2JwMmRZQkJB?=
 =?utf-8?B?RldYTXdyNjgxbGM2L1dIY1dYYVpnSkJFeUQ0M0dhR2NXSkhWay9aUmVycmR6?=
 =?utf-8?B?UDY5UUZmYS9tUUkrVHNlamI1TzdTVFVpNmsyQkJpeVNpV3g2NjdHZjNHbmJ1?=
 =?utf-8?B?NW1YdDJnWEtnUGwrWk9Id0hkUkwxcm9hNnNOWTBJdVBRYmQ3blJxZGtMRUlh?=
 =?utf-8?B?QTNwM2lTaFcwWnBEV2ZLaGVEUEJmK0ZsczFZSUV5aWNYVjh6VkROVUdkSWZt?=
 =?utf-8?Q?8F/I6bWp6Cn/w=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4555.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f20d1a47-4fa6-490a-45ad-08d890b99eb5
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2020 20:43:37.8297 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ARBSunFi9jfY/PIoIDnJviLSSXrxRmFdrZaLfGB+OKmh5pGkjVaET9Y6ydVjau84qkQ/kw6jDzHsc5zkqtCHxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4945
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
Cc: Leon
 Romanovsky <leon@kernel.org>, Christian Koenig <christian.koenig@amd.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Doug Ledford <dledford@redhat.com>, "Vetter,
 Daniel" <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKb2huIEh1YmJhcmQgPGpodWJi
YXJkQG52aWRpYS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIE5vdmVtYmVyIDI0LCAyMDIwIDEyOjI3
IFBNDQo+IFRvOiBYaW9uZywgSmlhbnhpbiA8amlhbnhpbi54aW9uZ0BpbnRlbC5jb20+OyBsaW51
eC1yZG1hQHZnZXIua2VybmVsLm9yZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0K
PiBDYzogRG91ZyBMZWRmb3JkIDxkbGVkZm9yZEByZWRoYXQuY29tPjsgSmFzb24gR3VudGhvcnBl
IDxqZ2dAemllcGUuY2E+OyBMZW9uIFJvbWFub3Zza3kgPGxlb25Aa2VybmVsLm9yZz47IFN1bWl0
IFNlbXdhbA0KPiA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+OyBDaHJpc3RpYW4gS29lbmlnIDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+OyBWZXR0ZXIsIERhbmllbCA8ZGFuaWVsLnZldHRlckBp
bnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggcmRtYS1jb3JlIDUvNV0gdGVzdHM6IEJ1
ZyBmaXggZm9yIGdldF9hY2Nlc3NfZmxhZ3MoKQ0KPiANCj4gSnVzdCBzb21lIHNpbGx5IG5pdHMg
SSBzdHVtYmxlZCBhY3Jvc3Mgd2hpbGUgdHJ5aW5nIHRvIHVuZGVyc3RhbmQgdGhlIHRlc3RzLg0K
PiANCj4gT24gMTEvMjMvMjAgOTo1MyBBTSwgSmlhbnhpbiBYaW9uZyB3cm90ZToNCj4gPiBUaGUg
ZmlsdGVyIGRlZmludGlvbiBpcyB3cm9uZyBhbmQgY2F1c2VzIGdldF9hY2Nlc3NfZmxhZ3MoKSBh
bHdheXMNCj4gDQo+ICAgICAgICAgICAgICAgZGVmaW5pdGlvbg0KDQpUaGFua3MuDQoNCj4gDQo+
ID4gcmV0dXJuaW5nIGVtcHR5IGxpc3QuIEFzIHRoZSByZXN1bHQgdGhlIE1SIHRlc3RzIHVzaW5n
IHRoaXMgZnVuY3Rpb24NCj4gPiBhcmUgZWZmZWN0aXZlbHkgc2tpcHBlZCAoYnV0IHJlcG9ydCBz
dWNjZXNzKS4NCj4gPg0KPiA+IEFsc28gZml4IGEgdHlwbyBpbiB0aGUgY29tbWVudHMuDQo+IA0K
PiBXYXMgdGhlcmUgYW5vdGhlciB0eXBvIHNvbWV3aGVyZT8gQWxsIEkgc2VlIGlzIGFuICphZGRl
ZCogdHlwby4uLg0KPiANCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEppYW54aW4gWGlvbmcgPGpp
YW54aW4ueGlvbmdAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICAgdGVzdHMvdXRpbHMucHkgfCA2
ICsrKy0tLQ0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlv
bnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS90ZXN0cy91dGlscy5weSBiL3Rlc3RzL3V0aWxz
LnB5IGluZGV4IDBhZDcxMTAuLmVlZTQ0YjQNCj4gPiAxMDA2NDQNCj4gPiAtLS0gYS90ZXN0cy91
dGlscy5weQ0KPiA+ICsrKyBiL3Rlc3RzL3V0aWxzLnB5DQo+ID4gQEAgLTU1LDggKzU1LDggQEAg
ZGVmIGZpbHRlcl9pbGxlZ2FsX2FjY2Vzc19mbGFncyhlbGVtZW50KToNCj4gPiAgICAgICA6cGFy
YW0gZWxlbWVudDogQSBsaXN0IG9mIGFjY2VzcyBmbGFncyB0byBjaGVjaw0KPiA+ICAgICAgIDpy
ZXR1cm46IFRydWUgaWYgdGhpcyBsaXN0IGlzIGxlZ2FsLCBlbHNlIEZhbHNlDQo+ID4gICAgICAg
IiIiDQo+ID4gLSAgICBpZiBlLklCVl9BQ0NFU1NfUkVNT1RFX0FUT01JQyBpbiBlbGVtZW50IG9y
IGUuSUJWX0FDQ0VTU19SRU1PVEVfV1JJVEU6DQo+ID4gLSAgICAgICAgaWYgZS5JQlZfQUNDRVNT
X0xPQ0FMX1dSSVRFOg0KPiA+ICsgICAgaWYgZS5JQlZfQUNDRVNTX1JFTU9URV9BVE9NSUMgaW4g
ZWxlbWVudCBvciBlLklCVl9BQ0NFU1NfUkVNT1RFX1dSSVRFIGluIGVsZW1lbnQ6DQo+ID4gKyAg
ICAgICAgaWYgbm90IGUuSUJWX0FDQ0VTU19MT0NBTF9XUklURSBpbiBlbGVtZW50Og0KPiA+ICAg
ICAgICAgICAgICAgcmV0dXJuIEZhbHNlDQo+ID4gICAgICAgcmV0dXJuIFRydWUNCj4gPg0KPiA+
IEBAIC02OSw3ICs2OSw3IEBAIGRlZiBnZXRfYWNjZXNzX2ZsYWdzKGN0eCk6DQo+ID4gICAgICAg
YWRkZWQgYXMgd2VsbC4NCj4gPiAgICAgICBBZnRlciB2ZXJpZnlpbmcgdGhhdCB0aGUgZmxhZ3Mg
c2VsZWN0aW9uIGlzIGxlZ2FsLCBpdCBpcyBhcHBlbmRlZCB0byBhbg0KPiA+ICAgICAgIGFycmF5
LCBhc3N1bWluZyBpdCB3YXNuJ3QgcHJldmlvdXNseSBhcHBlbmRlZC4NCj4gPiAtICAgIDpwYXJh
bSBjdHg6IERldmljZSBDb250ZXh0IHRvIGNoZWNrIGNhcGFiaWxpdGllcw0KPiA+ICsgICAgOnBh
cmFtIGN0eDogRGV2aWNlIENveXludGV4dCB0byBjaGVjayBjYXBhYmlsaXRpZXMNCj4gDQo+IEkg
bGlrZWQgdGhlIG9sZCBzcGVsbGluZy4gIkNveXludGV4dCIganVzdCBkb2Vzbid0IHNvdW5kIGFz
IGdvb2QuIDopDQoNCkhtbSwgSSBkb24ndCBrbm93IHdoYXQgaGFwcGVuZWQg8J+YiiBJIHdhcyBz
ZWVpbmcgdGhlIG90aGVyIHdheSBhcm91bmQuDQoNCj4gDQo+ID4gICAgICAgOnBhcmFtIG51bTog
U2l6ZSBvZiBpbml0aWFsIGNvbGxlY3Rpb24NCj4gPiAgICAgICA6cmV0dXJuOiBBIHJhbmRvbSBs
ZWdhbCB2YWx1ZSBmb3IgTVIgZmxhZ3MNCj4gPiAgICAgICAiIiINCj4gPg0KPiANCj4gdGhhbmtz
LA0KPiAtLQ0KPiBKb2huIEh1YmJhcmQNCj4gTlZJRElBDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
