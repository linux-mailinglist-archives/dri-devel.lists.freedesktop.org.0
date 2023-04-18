Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB406E6C3B
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 20:38:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A323B10E858;
	Tue, 18 Apr 2023 18:38:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CB0010E844;
 Tue, 18 Apr 2023 18:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681843081; x=1713379081;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=h8YVN4BZoLDVNgrVNQxSVBjyjgZfY/ItpIxWdtS+kS8=;
 b=BB2AFUybtoQytOiygV92PXccjC+rXnZoIwxA+QqPlZsoU7fA9/K/kOIM
 HHwy8RqhN/pvRK5Yw8wk1/01Mn3sHxU7dJYuehmV8c3lQ7Rk4ADroZ1l/
 CD5gD0OnPMCExhkOKMMO5zkzTw/SU5hs0COYESl75kqwh7IUc31KipfMk
 PTMfOkO/kCmtotY6echRfcRsoRdpVbjGxsoVnv2mZLVUG14naOITxASMv
 hc+CGa6zImFgS8gMXbnlNPu/s523854hRnF6CBpLo/oLZ3fOAaESOdxOa
 e7eqW5HmCLZw7VYfshgmpVvEIDeCUnSjoECWisZVzTU/v/L3El67gbxXT g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="342742802"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; d="scan'208";a="342742802"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2023 11:38:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="693741511"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; d="scan'208";a="693741511"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 18 Apr 2023 11:38:00 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 18 Apr 2023 11:38:00 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 18 Apr 2023 11:37:59 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 18 Apr 2023 11:37:59 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 18 Apr 2023 11:37:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XhYG5VrYEQrqopBMr5poBQMMMc0dSU4xU3BrBS6vLOYf8DrdxjMIPZLRB3407A0kb5RiR2XFoj7jtDRWqK0iwqdE7soDwH5xcDpfzSoRLO6mBY+R+6Gk3VWEpQY3EuG1AMzKg+wvpUBrKaBR+seDPAAINrYd9LpK3SaR02FmWhgDZMt411VUYT+CMoXISGPQlc0q3NkOWCmG/OC372hAdfDGwtJ+Hki8qiCHtdqZksPeE11eZenWpzygCIGnRyO6a1LrO13A5Dw9XdgUsKQ0ck1OeHkyM2CFVXebeqUZMwl6e035rfeT2S3ndTWMCLoBxYSjwqBvI+zpelou/o/WzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h8YVN4BZoLDVNgrVNQxSVBjyjgZfY/ItpIxWdtS+kS8=;
 b=hJdVTMgUWPwj2xZ7EXq5Z0uziKXl75Ti+mNxHaRBrKfKywwRlx+Y8TtSLf0tmjW8FC/UnqwRWKFbmoOp0eRAtv8v/pcNdstfQkvscPl+VeYS8KRH4O79fotM4ZHSYHBScktA8YteBHNewMpYXhc/iGDFSYvUxKhMEOVNyXLmR6qz24QaXp45zOs+l2r10bYUMgC7o0dO4zu0OZSYwM0RuNckqiC6s8k0isqdZuDmP1XIVMZv3FTFeAt7+tCBDZg7eeWUGAtPwOaS3HmugaPOQwNXyP3ww+o/FhStVNNAYCZBoRqyACGbSBRqXI6QTe/HnGvIEJlUqJLSNfPzI54zsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 BL1PR11MB5367.namprd11.prod.outlook.com (2603:10b6:208:318::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 18:37:57 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3%6]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 18:37:57 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Landwerlin, 
 Lionel G" <lionel.g.landwerlin@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v7 6/8] drm/i915/uapi/pxp: Fix UAPI spec comments and add
 GET_PARAM for PXP
Thread-Topic: [PATCH v7 6/8] drm/i915/uapi/pxp: Fix UAPI spec comments and add
 GET_PARAM for PXP
Thread-Index: AQHZaK9ya+davEyaqkWPdww46zK+Z68k0KeAgAYmj4CABnhxgIAACMGA
Date: Tue, 18 Apr 2023 18:37:57 +0000
Message-ID: <3ea4969edf913ede9b1eaf6ec4216de154ce25bb.camel@intel.com>
References: <20230406174419.471256-1-alan.previn.teres.alexis@intel.com>
 <20230406174419.471256-7-alan.previn.teres.alexis@intel.com>
 <35d5f2da-115e-5873-1e3e-ba4db16537eb@intel.com>
 <ae72a0dfb157a9944434b773a93d82d40c7cb4e7.camel@intel.com>
 <fcc2efa1-87ad-d780-6d2e-cae2027971de@intel.com>
In-Reply-To: <fcc2efa1-87ad-d780-6d2e-cae2027971de@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|BL1PR11MB5367:EE_
x-ms-office365-filtering-correlation-id: c4d30474-bf21-4863-00ce-08db403c07a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +t4WD/zMr0BeqB5hB1P08wPK309G4kEb/wPxyKbPrMjIjF7KEaaNl9FjCFVYrtnNg8YAzINLD1TE9swTdJz4+CZZ2NFRQrSOpHMAha/b1nutSAY3tgchDDiAsL9EMdHfRJHhmCKzqj9BVh74q34o8L/tC5YqB0rjgeQs0LRTXmHm18YCpULgJSiH6j8f3ils6ASkJjVoNk4szfJMX3tW83waZbHyiEaDUauZntcc0JVcca1FgcvjQZdOFKSwITXG2gMej3bZm1nJUoh1tvulolGcIpBaZvdGl7DJhnXd22rSrxuDBhkqFhn9ALu1lWKuCs0YYEctE9MyZWpRq5f1ZWDJoLsjz7n0KuHBTyGmXJtwgS9EOMID519T+Ee/wXchGbqOogkzueqis2PJAd1b90x71yeY9ST8xHB1rRoRjWKt8xg8bkeO/7GRoz6JOgwC9fombbxh2hHr66HvuIsTbgjsA3EqLa/4HUYy0BYs7fu52dK2gkOkQ9K4W54PUy+FGYBZ215o+F419X+eczy2F1lkDdHmqPlE+RNRnhzRDhj2meUhm+qMwdBoQOxRizvx7u2RQf/2NF5qJoa1iirClupU/PDrm91DspuCUzpTBnILgk6dqRKvC2LUPj0CSGwg
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(396003)(376002)(366004)(346002)(451199021)(5660300002)(2616005)(122000001)(86362001)(186003)(107886003)(53546011)(6512007)(6506007)(26005)(82960400001)(38100700002)(38070700005)(8936002)(8676002)(478600001)(110136005)(54906003)(71200400001)(6486002)(41300700001)(316002)(91956017)(76116006)(36756003)(4326008)(66556008)(66476007)(66946007)(64756008)(66446008)(2906002)(4744005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UWVEOFBsQStscEh5VkZQVUU2VUZxTFBtTVRtQmhpQ0F3YVVWNmVNZDlXVm1u?=
 =?utf-8?B?RC9GUG15MjZ4T0pDcnVvODlWVWFndWxDZytGcWptUXpic3N5ZnhkRG9ESnp6?=
 =?utf-8?B?bHVhMXREcTlPVmF4RmNEMXFvdUxTcnRUcmc4UjJuSXdXKys0VHFNS0R4d1BB?=
 =?utf-8?B?OENSeUtvdzgyRGdkNUdKTVdDMU1tRDhVWWcvQUR2RkNONXhSZ0k5UUc3TUdq?=
 =?utf-8?B?eVAzNGJhR3RyQTE4TUdTZ0lzbzlWUXBPOGIrVWcwQVpkUlZtN205TkdjVnc5?=
 =?utf-8?B?SkRUN3dPaytXSjlHOW5mL3gzeExlYzAvK2tUMHRtbDlIR1VhU084RDg3TDY4?=
 =?utf-8?B?TlpoLytqWmtEK2dNK2g4Q255QnBTRmF6SktidWRCbzFYSlZhZlhycDRNRFMx?=
 =?utf-8?B?V1k2VTY0LzA1VlRnZ2Q1NUpITTVsbXlpUEttTlJ1UzVYTjl2enIrbnAwWjdk?=
 =?utf-8?B?eHJzcWtVL3NyR3JNWmJFSGkxYitzdG5lKzhCZ0xyeGZ2Z250UW8za3J3anJv?=
 =?utf-8?B?VjBvTUJOK3FyaHpsQUF0WlpzNmp3YzE0N2pubWRGYTFmNVdXM0w2UndSWHNj?=
 =?utf-8?B?aTRtNTBqWFV5eUxXU2dTTlR5anN4Q3ZaVXFDeTc4TWNuY1dBWWgzeW9NMmFC?=
 =?utf-8?B?MDBrWmNRZmpndU1XT25RRTVjTVhrYWROVm5aT2RPdXZYU2ZJSW04N3h2SVI4?=
 =?utf-8?B?bDlwYy9ENG9ybC9wOHh0RXhod0dRTERsVTJFVGhGdVlqU3JacUR5b0VnVnly?=
 =?utf-8?B?R1FiUU9FTXBFUE9xRnhsR0lxQUhlVG5aN1JQZ3E0QlN1VlpMTjRBakZHaGxT?=
 =?utf-8?B?TmNmN3ZIMnFJUHJEMXlmQ3U0ZkQySGZrR2tGUXB5NWxoYmZ3dTVaVE5ocGVq?=
 =?utf-8?B?K0cwMzFXNXpDM05OeWlpUjdiTThWUm0vdWRQSjVKRUVOUHMwaldUSXVpUmNF?=
 =?utf-8?B?OXM1THlnVFZ2ZzB3OTRWcmMzRHk4WFA3YzZFeUhGcGtNejEzWDIxRjlqTWp2?=
 =?utf-8?B?b1JkWGF3VUpkdkhHcFhndEYzUldCUE93YkFoZURndWwzMXo0MWNleW56NnZo?=
 =?utf-8?B?WnZwTThPQi82dzhab0ZhVDkrRkd0QjRoNW0yTXpoQ2FtL0hpb25sTHRjR0pZ?=
 =?utf-8?B?VXR6V2VLU2JraFg4UVdDZE5URmhyc3NZVDM1c1NlcFc2dGtzVGtrWGE3dnJy?=
 =?utf-8?B?UWx2TTJlMS8xVllTZFhPei9XYm8ycXg1aFRpTjlFRXJwUk4yOTZsLzFoSzNG?=
 =?utf-8?B?L2VGNjRKRkYwbEJwbTRvYW05VDE3ZkNhb0tZbjd6U2s1SEJOWGdCclJDMjZq?=
 =?utf-8?B?UFFmMUwrYXczWUtERWhaUVE5VzZyc2V5Y2xhOGNEZVZXc3h3RVBXVnlpWkhv?=
 =?utf-8?B?dlFPL21tcDhQelk2YjMra0tYbFNuK1dLN1pCUkFkcUdRdXJraW50dzdoQlRl?=
 =?utf-8?B?UnpkSGxSM2FzM3hLRDhOMjBtaGpuMEpIQXd3RmNmNmV1aEhPSXZNUU5ScWtP?=
 =?utf-8?B?MndUZTBVSHBnT0xPY2tXSWIxTDFtanZEMGk4RCs2Y2NERVZKZmZIRDJjK2hS?=
 =?utf-8?B?V0ZGVGcrOWJ6MVg4K1hIdnlocVBSMGp5em9CQXR0TGRXYi9sa2pWcXdtZWEy?=
 =?utf-8?B?QnlHMk55NER0S2R0UE5sVWNBVHJYZzQzcFhiWDVMcWd2T3JkN1hrODhIZWlY?=
 =?utf-8?B?R0RlWEpIZ3FEb2tXT3FNY0JDcFpiOGQ0bGdEY1ZDTmRDVHhGb1ZGa1Q3aFdk?=
 =?utf-8?B?K0dSVkw1bE5ISGZuUkt6N2I1ZmEwODNDUUFmZTVkdGptU3NpWGFVTUZhL0tn?=
 =?utf-8?B?MUJNVHgyUDh6NHlzeGcwRFdhRVhuc1pvdXNhVUZpR1lFa1NwSmZEeGppZGFW?=
 =?utf-8?B?ZEYrRDZoZUxzUnp4OFFEUkZqazBPYy9QeHNQZU56aTdta2VyaGlFdzZrdi9H?=
 =?utf-8?B?dXo1MUVmQWdnYXlYQ09mOUdNYlh1STBzR0U0bmVNN3ZBSXJ3OGVVUU5xcDJr?=
 =?utf-8?B?ZHJzVFV1R3V1L2NFNnd2RTFPOUkzYXNPclBYR2NmZnp3VUNXMVVEamVYdXJ6?=
 =?utf-8?B?YTdGekVEZkVvSGNwR2hrQWZiN1ZpR2c0bFVHZHJkaDllK2EzUlJDZ3dyaUxx?=
 =?utf-8?B?NGZTMVJ3MGJSdTdKU0pDbWUzZW9taVhsYzYybVphUUhUNkszVWdDMWczYlor?=
 =?utf-8?Q?rtuxCmDPHbF4qlserJ2/Wfw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4AE1EBC03CBED94BBD63751FAEFF2908@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4d30474-bf21-4863-00ce-08db403c07a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2023 18:37:57.3309 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b0E4P4K/O/as9lX798shNbjWS8jZt1yiF+yNA1ChlY/ZNU1vWcOoTjv2UrIhXgbJ38iwgZJtKphqLhroHqb5aH4YhXeLhAMKXSk32Xb3KA3l2VUX+/BPZnCUcfCOP0LE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5367
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
Cc: "justonli@chromium.org" <justonli@chromium.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTA0LTE4IGF0IDIxOjA2ICswMzAwLCBMYW5kd2VybGluLCBMaW9uZWwgRyB3
cm90ZToNCj4gT24gMTQvMDQvMjAyMyAxODoxNywgVGVyZXMgQWxleGlzLCBBbGFuIFByZXZpbiB3
cm90ZToNCj4gPiBIaSBMaW9uZWwsIGRvZXMgdGhpcyBwYXRjaCB3b3JrIGZvciB5b3U/DQo+IA0K
PiANCj4gSGksIFNvcnJ5IGZvciB0aGUgbGF0ZSBhbnN3ZXIuDQo+IA0KPiBUaGF0IGxvb2tzIGdv
b2QgOg0KYWxhbjogR3JlYXQgLSB0aGFua3MgTGlvbmVsISA6KSBJJ2xsIGhlbHAgZ2V0IHRoZSBN
RVNBIHNpZGUgUFIgb3V0IGluIGNvbWluZyBkYXlzLg0KDQo+IA0KPiBBY2tlZC1ieTogTGlvbmVs
IExhbmR3ZXJsaW4gPGxpb25lbC5nLmxhbmR3ZXJsaW5AaW50ZWwuY29tPg0KPiANCj4gDQo+IFRo
YW5rcywNCj4gDQo+IA0KPiAtTGlvbmVsDQoNCmFsYW46c25pcA0K
