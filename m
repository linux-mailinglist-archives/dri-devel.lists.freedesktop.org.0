Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFB57ECF21
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 20:46:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1E9910E57E;
	Wed, 15 Nov 2023 19:46:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F8C710E57E;
 Wed, 15 Nov 2023 19:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700077590; x=1731613590;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5nzm+ssBSHKmFAwiD/KezJkBIvSRp6j2x54G/0Y9gEI=;
 b=EeKcAC2HFvr7QZ63CSBxjX+7GyCtfG9M9M3MJOmVO7KkMFJPnjepc24L
 cKZc0KEP9vbNB7JzEc+V0wm0+0n5fOwmq0lCyeCagFQcQFK8N31TALAt+
 4/dCNq8Bdu5OhQ8hQFbdtURWCeg6NiPfz4L57X1e0A+JJQE6da4qjiGGq
 d47oSHTITyMZ9uy7tpCTr2yRStH42vkY3AR36IOZZ90cWcW0tNbQTpBfg
 EH8UViCu8e9ja53mGvHiN6sAgJsYwcZdBxHfyl2+bKarMUHWUBmv6PaTE
 J8zAfDVOCKyxHMLKEqYXitnbxPlCdF516Ap1jxIDzJyDT2Abp0R1P5D/u w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="371128556"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; d="scan'208";a="371128556"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 11:46:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="799947894"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; d="scan'208";a="799947894"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2023 11:46:29 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 11:46:28 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 11:46:28 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 15 Nov 2023 11:46:28 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 15 Nov 2023 11:46:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cRHlu09OaIsr6fJc4obyJR7wU0D1S6lS2ZR0UrW3G4ISLTLlXNYtKUJteTaQOn9c58LmqTNERs/jPHDRI1+doFsRXIorW0MVMtNdbMqZgZbZ7hiMgHH18G4UyzELxc8hgVLgtsLpkd9dRGZUWK3R/U+6812PU68CwfYvoGhv6iLkJVEi6vWg7GcUlwUQTSwWSCvoKf7l6aODZd2r6Abqk8DHOcuWfKigp9pcwNVT2ShOJdOpK/oJGwdcMLBqPJX34CQEMLb8Dj9Wujvpol9jH2/OsavWD6+Gq0z0lEVrvvR2o6FLv4+xhcSEUosO1Wv/2V515ZacUhEETvAfuONI9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5nzm+ssBSHKmFAwiD/KezJkBIvSRp6j2x54G/0Y9gEI=;
 b=ROUjEjsxqOV5sAce5zhAbNjrvssjIKcZexNels0VZZUWbvky4/vrsgSnoqEBuIiaAgHbwhL2Cq3LWNTfmiy+fz9Xy5xFgdOHJdzdekbTNDGTJVJGhHlmlTQb8FFFbmNjX4Z51DJe23AWmxKKfJ3NaGHl397us5KEEk6Ohn2Q06/Byiu0A3rG01ssic90oM5n7ZL/4eDT0dH4CcI7LmSZLQW8UUKv4wWJBp2Ef2jXJNKI82YOJKvNC4oAVlGJz1xj2Mpfi1hHhYRlpndxIReAeVqIU0FvwHaIICWtoPdmjxagFoIafTdumiYizvQYcjDoy58gToTSNP4NrIw6Kcgv3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5971.namprd11.prod.outlook.com (2603:10b6:8:5e::7) by
 DS7PR11MB6176.namprd11.prod.outlook.com (2603:10b6:8:98::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7002.18; Wed, 15 Nov 2023 19:46:24 +0000
Received: from DM4PR11MB5971.namprd11.prod.outlook.com
 ([fe80::1e93:6fb2:8788:b24a]) by DM4PR11MB5971.namprd11.prod.outlook.com
 ([fe80::1e93:6fb2:8788:b24a%4]) with mapi id 15.20.6977.029; Wed, 15 Nov 2023
 19:46:24 +0000
From: "Sripada, Radhakrishna" <radhakrishna.sripada@intel.com>
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>,
 =?utf-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: RE: [Intel-gfx] [PATCH] drm/i915: Read a shadowed mmio register for
 ggtt flush
Thread-Topic: [Intel-gfx] [PATCH] drm/i915: Read a shadowed mmio register for
 ggtt flush
Thread-Index: AQHaE0Ik5HA8DZiD/kKU5q/HjRA4lLByX+6AgAAImACAAAlvAIAASosAgAkSpCA=
Date: Wed, 15 Nov 2023 19:46:23 +0000
Message-ID: <DM4PR11MB59717444A778D13DF2290E6187B1A@DM4PR11MB5971.namprd11.prod.outlook.com>
References: <20231109192148.475156-1-vinay.belgaumkar@intel.com>
 <ZU0zYaFkpZJoUcZE@intel.com> <72f09667-24d5-403a-ba9a-3465c681fec3@intel.com>
 <ZU1CgB5XaO9VsBHJ@intel.com> <90c346b6-c335-4757-96e1-98eafdf9ef42@intel.com>
In-Reply-To: <90c346b6-c335-4757-96e1-98eafdf9ef42@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5971:EE_|DS7PR11MB6176:EE_
x-ms-office365-filtering-correlation-id: 13f76c4f-ec5a-4d04-e499-08dbe6138c98
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: scPonYInVKPs0wQdWDmL88yqhzN404RWfJaAbWz0BXGixE+cbxBCw49T3JT3QN948QliQ0iAlze3GcyMxNCi0xotm86qyVPkPlxa0RxwJG47mp06Jx2Ez60mq6DXmUORpMIl5eAuyAscoE7iuQ7iMXfAnJ6UHjo5NrdgUdfNgtlqrVOk8Xp1vFp0k+WMaZlt0uR6h4ZIO0u8JRVoi69USI3H1qDbJwD1KHBf3hX8Vb6q2lg8iOxglRBv3Ch3pWybyob3vl69kr3cRN2Izj75y5FoNnlYNiHvLG+E2WIe2kUmvPBcIzKwSG/anlCYnVnVyj71UOqUPGXzvLoOwTJJa33FBNM8otVvi4saIKXgVkt94uCB4c82QKehKbM+bms4rNECpoCLmsymuegGs+lkA8oBwdYi+lIkIGq0MXBoLXWLjkJA5O5vnVrlBlmMX2CvaAXmMAa4QZsaZdXYJw/8ilo3aaplpojQ2u7uWL51XfZ+BZL4Yf6+h8mCWJz/15gZp+W6s3n4StOc4zkbSc14qr1PQpaUufyVSgj0Mkrt+5WknSdJ8WOHoWM3Q8U8KdwYDmwCO3HDnEOqz9suOfMos5i0MMw1ue+fnDcE4daXGxc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5971.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(376002)(346002)(366004)(396003)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(966005)(478600001)(2906002)(6506007)(9686003)(53546011)(7696005)(52536014)(33656002)(86362001)(71200400001)(5660300002)(316002)(64756008)(110136005)(76116006)(4326008)(66446008)(66556008)(66476007)(8936002)(66946007)(8676002)(54906003)(38100700002)(38070700009)(83380400001)(41300700001)(55016003)(26005)(82960400001)(66574015)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QVF6RHpldmhLckVOTHFodXluOGpGeVN4QjdCQXNBOHU2dEt5Q2h2QkYvNHJx?=
 =?utf-8?B?K2NxdzVuaGpZWEprM0xXcWJtSDB2eExoV1NTOEN4ZmF0ZjlpS2YzZ3g3eTBk?=
 =?utf-8?B?VDYvRGNkTjdJVk9KdmRDeExYZlRkOWFCb3RMYzFsRzZqTEFERHo4UTJ5S1Iv?=
 =?utf-8?B?RzJ5c3hOWFdpeE82WUtQaFl4ZGJPbmVSK1lRMkNiT1FWZU9qVUNmbG1BRjdS?=
 =?utf-8?B?aTdnV1JERnp6S3p4K2puWlEvQUw4QnczQWdBS2loS0dCWDdtK05UZ2o3a0Zq?=
 =?utf-8?B?VVZkMUxFZm9QK1ZzRCt6SVZOb3lXME5UOG9yM1JJclI0aXhPVG90K1JFMGJC?=
 =?utf-8?B?WGVDWTNLWHN6U0UrZUsxVXNFYUFDbHlsYSt5UFBxWDFKM3N0eEV5TGkzVTN6?=
 =?utf-8?B?OEtpb1p6ZWpMN3BSdlVZUU8xSEpaUUlMcytPMHdsQXJUM3Yvdm5QTXcvNm9R?=
 =?utf-8?B?SHBlaTQ5cS81YWQ0QXNoMDhXVUVHRExSNXJscTZvMWUxWldQRzhlbjkrYXBU?=
 =?utf-8?B?aTJHalN1TW9penc5TWRuMzFmRG9zbUlpSFlvV0lqYThVRnlkenhpRHlneVA2?=
 =?utf-8?B?UXVNUEluc29lZlVXNVRpS2VUcHBPT1ZJQnJ5LzNEaXNmMjdZQjNJQjFvc0JK?=
 =?utf-8?B?cmhNYTk4S242YnkyeHhQYnZIWnpzWXZlclNpNmFqUXRiWUFodThlZUsvUUFa?=
 =?utf-8?B?aUFzcGVoMElnMVdPMVJKajc1V3hFZml2Z1FNclZYNDgxcGsvZjVFclV6WFVI?=
 =?utf-8?B?MnpuVlMrenpqOG5jUE1sK29qYTBzZWgycm9xZmdsZlRkT3BkcEsyd3JLb3ZT?=
 =?utf-8?B?cTJPTnMrTkxqOE1OVlVrbklESDhkbzZHUmVUeVNVbms4ajV5dVNZek9CRUJ2?=
 =?utf-8?B?bjd6eWlZNWNVVHhwNEFpSFpFc1M0K05WZjA3b1h6Q2VCc2RHamIydm94eHhy?=
 =?utf-8?B?RlFEOTRLZVQ3WjZkVlB5MUYwWWtORGVYc2hodndITVFBSGlKNGYwQi81K3o3?=
 =?utf-8?B?bmY5WmhnMUtUM241VWxXVDlKSlBFMG9HMGhLZUpyWVJMRVpBU0RDejJmMGFj?=
 =?utf-8?B?MFBEdi9KYXNvbXYyN0JZR0krUTVsaXhKKzNYb21YTXdZU3hSbG1zLzFZeGVU?=
 =?utf-8?B?OWd0anU1Nmx2QUlDbkZ4UisrVlp2VHhlUjNjaExrNEJ1MmhyU2xuemx2eGtZ?=
 =?utf-8?B?K3BjbXNhSnBVcllkWTM4QXJOZzM3eHVSZkRSRHRLeTBzeG9hUVBVKzAwMGRX?=
 =?utf-8?B?a2p5TDJWVG92d0pqK1Z6clBBOFRqRCtpbndpZ2ZTejhPdkw3ZDVzZ0FCeXhL?=
 =?utf-8?B?eUpJYnN6cU5OZzNiNll6REYzTDRISkJSVHhpeHJQQjhHYm1kNlh0UC8yT2pC?=
 =?utf-8?B?bjhaS2ZmSzlFdEk0Sy8yRHM3NnpneUFmQlpqUjVxVS9SUDF5b0RIZkdyTlVk?=
 =?utf-8?B?cjQ4VGllVTFGeklXRkFsa1dNMVNGTGd2RXBVaHhxdFMwV1FRd3phVCtUNWho?=
 =?utf-8?B?U0gvdWJyMFFJelpBZVUra2FxL2VoSEpBRStuSXRVOVRtVG5LWkRWTW1sanhG?=
 =?utf-8?B?MmxzcUdPakQwMlMrcFJuMlBSaVE3dkl6NkpWTUxuVk4yaXdSa09FNm1rTU9a?=
 =?utf-8?B?Z1JsMytJRWw4RVp1OXh0a1lmQjBpMjFkaEVISzVQSE9lbzNid25HTjMzZ3NB?=
 =?utf-8?B?QWRkSXUzTWIxVzlrV2RMcWJZUGZKZlZSSlJGZjBFTDY3WE9aanVhemNxYllJ?=
 =?utf-8?B?ZnFLSEZYeTF5M29hRzhReUhnd09tcUFrU1BMdkdKckR6SDFUaDFvMUtycDRi?=
 =?utf-8?B?SjQzTFA3MlloSURCL0d4NHlrbGp0bGhxaGNsTTBVa2I1V21keFhsaTRWSWtm?=
 =?utf-8?B?endVMEE2OUlzb04vaUxZdkZWY2h4SWUvUVFIUGxEUVUyaGxKQmZQT0xRUDZN?=
 =?utf-8?B?Yk55RGtyZHVXRDZaWVhyZ05HNEFZcy9hMlJLeEJ0aEVyd0x2VmRBeHB1bWph?=
 =?utf-8?B?TUNkV1NkWTIxZzVHT2o2NGhkUTNBamJSb3gwb1pNOXgxeGNjY0RERHVnNHZx?=
 =?utf-8?B?M2daaVJTemtVSk5kdTR0MHBPdDYxclhVZVloeTFsSUlMVnJ0VW5PUlN5Q241?=
 =?utf-8?B?T3g1YnNKZTVqdXRWcXorMis5RGhlWE5mK2YxUnNSOEUyNzhOV1ZUL0hncnNT?=
 =?utf-8?B?ZUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5971.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13f76c4f-ec5a-4d04-e499-08dbe6138c98
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2023 19:46:24.0058 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 53WVE2hZRR8jy6l8tYva+xjbTUQhfEfqL2BcnUvKRNok+2KjNukOg05ER5A2OCwZclHIA52txqSDJsngGY/uISQ1uvF6uwuhDKLg6XHkpi8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6176
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVmluYXksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogZHJpLWRl
dmVsIDxkcmktZGV2ZWwtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBP
Zg0KPiBCZWxnYXVta2FyLCBWaW5heQ0KPiBTZW50OiBUaHVyc2RheSwgTm92ZW1iZXIgOSwgMjAy
MyA1OjAyIFBNDQo+IFRvOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50
ZWwuY29tPg0KPiBDYzogaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiBSZTogW0ludGVsLWdmeF0gW1BBVENI
XSBkcm0vaTkxNTogUmVhZCBhIHNoYWRvd2VkIG1taW8gcmVnaXN0ZXIgZm9yDQo+IGdndHQgZmx1
c2gNCj4gDQo+IA0KPiBPbiAxMS85LzIwMjMgMTI6MzUgUE0sIFZpbGxlIFN5cmrDpGzDpCB3cm90
ZToNCj4gPiBPbiBUaHUsIE5vdiAwOSwgMjAyMyBhdCAxMjowMToyNlBNIC0wODAwLCBCZWxnYXVt
a2FyLCBWaW5heSB3cm90ZToNCj4gPj4gT24gMTEvOS8yMDIzIDExOjMwIEFNLCBWaWxsZSBTeXJq
w6Rsw6Qgd3JvdGU6DQo+ID4+PiBPbiBUaHUsIE5vdiAwOSwgMjAyMyBhdCAxMToyMTo0OEFNIC0w
ODAwLCBWaW5heSBCZWxnYXVta2FyIHdyb3RlOg0KPiA+Pj4+IFdlIHJlYWQgUkVOREVSX0hFQUQg
YXMgYSBwYXJ0IG9mIHRoZSBmbHVzaC4gSWYgR1QgaXMgaW4NCj4gPj4+PiBkZWVwZXIgc2xlZXAg
c3RhdGVzLCB0aGlzIGNvdWxkIGxlYWQgdG8gcmVhZCBlcnJvcnMgc2luY2Ugd2UgYXJlDQo+ID4+
Pj4gbm90IHVzaW5nIGEgZm9yY2V3YWtlLiBTYWZlciB0byByZWFkIGEgc2hhZG93ZWQgcmVnaXN0
ZXIgaW5zdGVhZC4NCj4gPj4+IElJUkMgc2hhZG93aW5nIGlzIG9ubHkgdGhpbmcgZm9yIHdyaXRl
cywgbm90IHJlYWRzLg0KPiA+PiBTdXJlLCBidXQgcmVhZGluZyBmcm9tIGEgc2hhZG93ZWQgcmVn
aXN0ZXIgZG9lcyByZXR1cm4gdGhlIGNhY2hlZCB2YWx1ZQ0KPiA+IERvZXMgaXQ/IEkgc3VwcG9z
ZSB0aGF0IHdvdWxkIG1ha2Ugc29tZSBzZW5zZSwgYnV0IEkgZG9uJ3QgcmVjYWxsIHRoYXQNCj4g
PiBldmVyIGJlaW5nIHN0YXRlZCBhbnl3aGVyZS4gQXQgbGVhc3QgYmVmb3JlIHRoZSBzaGFkb3cg
cmVnaXN0ZXJzDQo+ID4gZXhpc3RlZCByZWFkcyB3b3VsZCBqdXN0IGdpdmUgeW91IHplcm9lcyB3
aGVuIG5vdCBhd2FrZS4NCj4gPg0KPiA+PiAoZXZlbiB0aG91Z2ggd2UgZG9uJ3QgY2FyZSBhYm91
dCB0aGUgdmFrdWUgaGVyZSkuIFdoZW4gR1QgaXMgaW4gZGVlcGVyDQo+ID4+IHNsZWVwIHN0YXRl
cywgaXQgaXMgYmV0dGVyIHRvIHJlYWQgYSBzaGFkb3dlZCAoY2FjaGVkKSB2YWx1ZSBpbnN0ZWFk
IG9mDQo+ID4+IHRyeWluZyB0byBhdHRlbXB0IGFuIG1taW8gcmVnaXN0ZXIgcmVhZCB3aXRob3V0
IGEgZm9yY2Ugd2FrZSBhbnl3YXlzLg0KPiA+IFNvIHlvdSdyZSBzYXlpbmcgcmVhZHMgZnJvbSBu
b24tc2hhZG93ZWQgcmVnaXN0ZXJzIGZhaWxzIHNvbWVob3cNCj4gPiB3aGVuIG5vdCBhd2FrZT8g
SG93IGV4YWN0bHkgZG8gdGhleSBmYWlsPyBBbmQgd2hlbiByZWFkaW5nIGZyb20NCj4gPiBhIHNo
YWRvd2VkIHJlZ2lzdGVyIHRoYXQgZmFpbHVyZSBuZXZlciBoYXBwZW5zPw0KPiANCj4gV2UgY291
bGQgaGl0IHByb2JsZW1zIGxpa2UgdGhlIG9uZSBiZWluZyBhZGRyZXNzZWQgaGVyZSAtDQo+IGh0
dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTI1MzU2Ly7CoCBSZWFkaW5n
IGZyb20gYQ0KPiBzaGFkb3dlZCByZWdpc3RlciB3aWxsIGF2b2lkIGFueSBuZWVkbGVzcyByZWZl
cmVuY2VzKHdpdGhvdXQgYSB3YWtlKSB0bw0KPiB0aGUgTU1JTyBzcGFjZS4gU2hvdWxkbid0IGh1
cnQgdG8gbWFrZSB0aGlzIGNoYW5nZSBmb3IgYWxsIGdlbnMgSU1PLg0KDQpUaGUgcHJvcG9zZWQg
dXNhZ2UgbG9va3MgYWNjdXJhdGUgZm9yIHRoZSBpc3N1ZSBkZXNjcmliZWQuDQoNClJldmlld2Vk
LWJ5OiBSYWRoYWtyaXNobmEgU3JpcGFkYSA8cmFkaGFrcmlzaG5hLnNyaXBhZGFAaW50ZWwuY29t
Pg0KDQotLVJhZGhha3Jpc2huYShSSykgU3JpcGFkYQ0KPiANCj4gVGhhbmtzLA0KPiANCj4gVmlu
YXkuDQo+IA0KPiA+DQo+ID4+IFRoYW5rcywNCj4gPj4NCj4gPj4gVmluYXkuDQo+ID4+DQo+ID4+
Pj4gQ2M6IEpvaG4gSGFycmlzb24gPGpvaG4uYy5oYXJyaXNvbkBpbnRlbC5jb20+DQo+ID4+Pj4g
Q2M6IERhbmllbGUgQ2VyYW9sbyBTcHVyaW8gPGRhbmllbGUuY2VyYW9sb3NwdXJpb0BpbnRlbC5j
b20+DQo+ID4+Pj4gU2lnbmVkLW9mZi1ieTogVmluYXkgQmVsZ2F1bWthciA8dmluYXkuYmVsZ2F1
bWthckBpbnRlbC5jb20+DQo+ID4+Pj4gLS0tDQo+ID4+Pj4gICAgZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3QvaW50ZWxfZ3QuYyB8IDIgKy0NCj4gPj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gPj4+Pg0KPiA+Pj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9ndC5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z3QvaW50ZWxfZ3QuYw0KPiA+Pj4+IGluZGV4IGVkMzJiZjViMTU0Ni4uZWE4MTRlYTVmNzAwIDEw
MDY0NA0KPiA+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2d0LmMNCj4g
Pj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9ndC5jDQo+ID4+Pj4gQEAg
LTQ1MSw3ICs0NTEsNyBAQCB2b2lkIGludGVsX2d0X2ZsdXNoX2dndHRfd3JpdGVzKHN0cnVjdCBp
bnRlbF9ndCAqZ3QpDQo+ID4+Pj4NCj4gPj4+PiAgICAJCXNwaW5fbG9ja19pcnFzYXZlKCZ1bmNv
cmUtPmxvY2ssIGZsYWdzKTsNCj4gPj4+PiAgICAJCWludGVsX3VuY29yZV9wb3N0aW5nX3JlYWRf
ZncodW5jb3JlLA0KPiA+Pj4+IC0JCQkJCSAgICAgUklOR19IRUFEKFJFTkRFUl9SSU5HX0JBU0Up
KTsNCj4gPj4+PiArCQkJCQkgICAgIFJJTkdfVEFJTChSRU5ERVJfUklOR19CQVNFKSk7DQo+ID4+
Pj4gICAgCQlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZ1bmNvcmUtPmxvY2ssIGZsYWdzKTsNCj4g
Pj4+PiAgICAJfQ0KPiA+Pj4+ICAgIH0NCj4gPj4+PiAtLQ0KPiA+Pj4+IDIuMzguMQ0K
