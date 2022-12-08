Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C7F64688D
	for <lists+dri-devel@lfdr.de>; Thu,  8 Dec 2022 06:24:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C77C10E45E;
	Thu,  8 Dec 2022 05:24:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC1AA10E459;
 Thu,  8 Dec 2022 05:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670477044; x=1702013044;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=16fElU9tIVCeRKGsfmO6R+bdsenwHhloo84dabKu2Q0=;
 b=JTcFOh5pf6FmRikdScyPd57WZ+azdYxlj3G8ft5la5KFjcOTqxh/5tVi
 uOptQeH3jPfAlorHoufaYAjiv/efF6Ey4Jh6aODB7e6B9icwG3+JojOK/
 ksRT13O8pROIC4NYkS+zYA6HABD+qUzA2YeSAEF7Zr5JZcJ59lU5F3Qef
 ufmjpRhLWaX0+PdLt4j2jt7WSu/neQ5bJEwkpe5bSyEgXS1Ln9REMCOcU
 csqV9P1X9pKl/x8k4ZICCEfJenAshxbARTXezax6aRGmMOCC44kcLa1sj
 5Hq5H0gecKm0RWyMNCY4K4sPti2a6XQ58KRN8stqF9qeimc09hwFdJ8AV Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="381367527"
X-IronPort-AV: E=Sophos;i="5.96,226,1665471600"; d="scan'208";a="381367527"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2022 21:24:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="710324761"
X-IronPort-AV: E=Sophos;i="5.96,226,1665471600"; d="scan'208";a="710324761"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 07 Dec 2022 21:24:03 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 7 Dec 2022 21:24:03 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 7 Dec 2022 21:24:02 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 7 Dec 2022 21:24:02 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.49) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 7 Dec 2022 21:24:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MXv8JHyWyIK9IFa49RAf/1tjbXYyS8LPzunBnu2Uk5mNdAKsBvGV7Jul7nCQGT/z6AppZjJj9UHzAqzaPWBnQ9V46KNieRQSo/aoeeqQt+JzRiuO81THHFUZE3zLXT/uSfzgukXbyHf+YCs8T+T+8Pa53/mrv6u8lj6WooPR2dsmUg2xH53MORVNSi2CHcdmoM+JaEYhuiuj9ME+cfn/EISWDt1J6Dsi0M4RVkVKNNYFQ5ARvWu6YsG08ChGe2vr+iKk+MVlVBArxnNckycdViUpMr/t7Bf9XIV32cMM23d4kIqsV+Ht1dg6slnIi12+/ONuKj8bAntB4Kt/VBCwnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=16fElU9tIVCeRKGsfmO6R+bdsenwHhloo84dabKu2Q0=;
 b=OfkggnduRjsRyH4cr6crxhnshDdwsRqV+9R10nyeWpQAc0ExZB21GpycAGm0L1Ec/7ACHWi5t2F7sJ7YbNK2DN2u07ZRvfDp0UWwASvq6loY0et1MpA97eF7vHZQV3idVeMPPGPopmBnnVfKScre2gScMK0wuddWWZbGfGHBgNZI/7Ll5b5BPDU8wK+rrOFeUx0Wj65JW7qMOrPn+R6iMyUHNaTAnEx0J96ru9FsczQDLEAd2WZwdeIfNUrvmsGTP6TzLrXLSGfPDjTSjg1LgHCwzdBgoSAwh8cFCcgp6j/jvG7aZuhkBTkPN5Iitz9IQAY/lTsLJ/52xouvAF8ITw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 PH0PR11MB5093.namprd11.prod.outlook.com (2603:10b6:510:3e::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5880.14; Thu, 8 Dec 2022 05:23:55 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::6894:1dbc:4681:66b6]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::6894:1dbc:4681:66b6%4]) with mapi id 15.20.5880.014; Thu, 8 Dec 2022
 05:23:55 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/6] drm/i915/gsc: Skip the version check when fetching
 the GSC FW
Thread-Topic: [PATCH v2 2/6] drm/i915/gsc: Skip the version check when
 fetching the GSC FW
Thread-Index: AQHZCRA8SbRHewy1Ck+yx1rYNPtCKK5jeTEA
Date: Thu, 8 Dec 2022 05:23:54 +0000
Message-ID: <d9e37bed5e4098380466646c17c7fe1fdcea9ab9.camel@intel.com>
References: <20221206011908.2745508-1-daniele.ceraolospurio@intel.com>
 <20221206011908.2745508-3-daniele.ceraolospurio@intel.com>
In-Reply-To: <20221206011908.2745508-3-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|PH0PR11MB5093:EE_
x-ms-office365-filtering-correlation-id: d516e5ac-22ab-4fe4-017b-08dad8dc667d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zejuPRMhGNbdTk1mdbivLWw4htNO7sHdAn6SQ2hRMDc+RfYysMAsCjBes1Kr+wwV+6Kr0dShk5Eie19AoE+zQOt000CS4Qr0ahKxVGyRKOktd6edADj90HQGF/XiesiAR9j6SokR92CRk0lgQmeNe4Ln/9JxUYS98E6U8eF+eKNfiyupaa90hEqXgWSDvxj5dRm3sIrkl3665/3JU1QLAPmzqVH9CCSYx1iCjLuwapDpRCmiaAAUiRQZodLGvEQNis8b5njD6JqM9cPeroXAYb7SevrioWCfbSHL8V9zTyKkgJaSFuEPIqNXEU6pnUv7DGP8zj9o3UdqrPx+A/3lml/Ht99ZlzM5xpemAs75BrgBzaEcZpRE4Z3AdswzjBkfEWZ1vqLwHUvTWuevo5JA4TZLQ1RR0fyjC6JYoA28swQ6g9B69fvgOOg9l6u1lSqwtweBxHT1J6tYWDdrjfH4UhfrHb/TvPbpvA2Sw7cDTMBejgcjGWHyqcFRbGmRfILyERP1lmu25oBJudspLBblNTzG3V/nUDHITzf8suwSYqv6ov44+gpk+nHSpStvZr/xhPyspGdoVAnPj2AcWoUwlV0h6Ahyw2GzbwwoxNdd1mxElqE2+ffudCPwRHcLbeWb7nm21I9aUvJEx+iMiNVDl3vo0QbePYBmgxPzyA1wVBc0jsnMpKR34ILrl52tYcSHp6zJYl/wT7uLF/pdpQAFPA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(346002)(396003)(39860400002)(376002)(136003)(451199015)(478600001)(71200400001)(91956017)(122000001)(4326008)(2906002)(76116006)(107886003)(66946007)(66476007)(64756008)(66446008)(66556008)(8676002)(6486002)(36756003)(82960400001)(41300700001)(38100700002)(450100002)(2616005)(6506007)(316002)(86362001)(110136005)(186003)(6512007)(26005)(54906003)(38070700005)(8936002)(4744005)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bHFEU01UMmUwNUFFbWU4dkovcmNmcm1iSUFFc0E4b3pFcGRlQkZ3WGR4Ump6?=
 =?utf-8?B?R3lBNEJCZHlCb3NkTXBMUmNPUlE0RzRVcUk4YXpEVERKRlRtTWdLYTk4ODNy?=
 =?utf-8?B?djZzZm1yRVFEUHRKRmNiMWQrSkZNQnM2YzNvdDdDaFBVSGtUNU03TnpCR0Rh?=
 =?utf-8?B?bXBqdlpDRzV1M1UycGJuRkJiNHBGa3o4UnByakYxdHhoVW9JZ0ZPQUpqMUZx?=
 =?utf-8?B?bmEraHBQekF0d2laVkxKc0Y5azAzYlN2WEhJS3p4UU4wdTBEbURsejIwVGtL?=
 =?utf-8?B?Y2VnSlVYOGJFb0k3SmFNb2kzREIvWjVLenpENlg4ZWJMTFJTZXpTTmQyTktC?=
 =?utf-8?B?N0pkbzNKK2lsOUVWbC9qci9lTVg5OGk1M01uN0FTWU9TdXFFNjJzWUVJMmFj?=
 =?utf-8?B?ckpMc3JBT3IxMW5FVUNucDBBandjZEludUNnVWgvUkNaNDhQeUtkVTBveko5?=
 =?utf-8?B?dUpLQ0RWellpZ2g4Wlg1Sy9UMmJ3WWlnbVR5dU1mTkJGRWpaZkkyZHU2YkxK?=
 =?utf-8?B?bUtVYjR2T2tKdzU0MEZoU09vSmNvS05xYThOZ0t3Ukt0R3B5UnRyN1pHSjRm?=
 =?utf-8?B?c1d3WTRNN0dQUnlCczNldzFnU1dJMXR3WTZvNm1HdmFad3lleWRxMXpvYVZm?=
 =?utf-8?B?UFNKWVQwNUluNmxVM21BRERlNGpCODFtN250amp3MkRpVy9hMHJOWGkzcnll?=
 =?utf-8?B?OHpUODBUbjZ6UUtxVy9DeHI2YnJHcUFnYTNuTmI4d0JtaXhDRFpXWXhjOVV0?=
 =?utf-8?B?emxLT3BqMG5XN052NVp0QUJDT1NTUE5aQ2RKL244NnhoRG13NnhWNGZOUXda?=
 =?utf-8?B?UURiT2IrSHY1Q2QyNnVHRDBTYlV4WGozM0hIbzNlL2pwS05TZ21RZEJrRXBx?=
 =?utf-8?B?V3NrVVRadk1mOXYvSmlIVjY4dGNyc2RYempRWjlqQkhNVytVaEhJWlRWZEdC?=
 =?utf-8?B?bWkvdFZhWDRUMGtRY2IyTDRpVHpqN002Q1lVV0xCTVpwMndRZDBwOHQ1cUx4?=
 =?utf-8?B?ZkhZTzdhWmovek5ueGZCSFNnTnNNM1BMZVZucFlCSUIwdmZFT3FCdzArQkNT?=
 =?utf-8?B?SDNJZ1Jpb0lVTXM5TEdlNGFzU1NGOWpQN0MzajVtTnMweXlCZTFrOFZSbk4y?=
 =?utf-8?B?MUZGclpDZlA0VjdvZ1EwcGRqYTV5RllIaFgreTk0RkVWaW16ZmlWSWJsSUZk?=
 =?utf-8?B?UHk0TWpHYzg3YWVVcmNtS2VaNitrVXZYT2MxRU91OUl1alEvNmdNbmRpWjMw?=
 =?utf-8?B?VXhJaE94RzkyS2dveXhhRTlVM0E3OVRZMkxoTlRheTh2N1BoYlYyby9paXJY?=
 =?utf-8?B?N0VBYzIvMU0vbGlTWFpaTXkzcndoTUJTWnZxSThvOG1wZFppb2twMmlDdlkv?=
 =?utf-8?B?SzhrZmxhVURuVGtLazZPVlNSa0VVMDBHeDkwcGJGM2hiVEdXazRDSlVianNV?=
 =?utf-8?B?dGcveFplL2JReSt0Wm1PMSsyMEFWQnV4VEdkRDNpN1hid2JxOVRYRk1GMXZB?=
 =?utf-8?B?bjJVTGN4ajdKQ2QwMXAzbkpBMDZBcERUK3phQnpYSUtSb3VIVDlPbndxZkcy?=
 =?utf-8?B?Sk1UeFlBb0haYllRelc0VHMvQzZTNVZvMmF2UUdGSjN0a1IrVFhnakZDcDZB?=
 =?utf-8?B?MkNnTml5UVdsWFJUbExyWURoV3pkZFF0c0VwdTJHMnVxeGZiWFNaSDJSM3FI?=
 =?utf-8?B?MUZtMDlpUmRCTEZaa3RucWRtd0lEVS8relFBUVpJNGZCS2F0Vkp4OGllczV5?=
 =?utf-8?B?NTF5S2pMNWVhNm1aWkVLazlQZlYrMUlXb292RG5YVnpkNjBYaHpNNkdVLzFQ?=
 =?utf-8?B?WWdNK1JDYVpEYTY1Y2xiMDVDS3U4TkpsSjBLemI1ZzdQQk9MSzNBZ1R5cFN1?=
 =?utf-8?B?dWw0RTFPM24reE1FUHcxbVVmdGlXeXlkRmxLSkRXeG1nUjhUWDdhL2FORG9r?=
 =?utf-8?B?RGJmaUFSZmE0MForRC9WWWd1ancyK3pLV3B2b0FmRlp3Z3JxZzRUaXZ3OWNK?=
 =?utf-8?B?QnNSTXNudDVqMTVtQjNGYVNGQWM1eDJRc0dTWjRJNWRCR05yZGtsYWEyR2hh?=
 =?utf-8?B?cDYxaUpvUUs4dU55SU9OS0RuU0FDTHJob2kyS1VkL0gydlJTSVZzVnJMay8x?=
 =?utf-8?B?Qk1TcEJzRGxLZG5JTVJUdVpxSDFGcEU5UjdHWWdOVlFSeXBEOXZpMkJIaFBq?=
 =?utf-8?Q?UWD/oUsNbTpvEBRrFA9AFRw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9AEE65B70035F04994B703293BC37E63@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d516e5ac-22ab-4fe4-017b-08dad8dc667d
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2022 05:23:55.0063 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B6kbvG410dv+a1SFTsI6RudIUs4RJRYbmKNnDlou066oEesbqI03ZPttascqpFW/p8bSRj4aCDFdiu21YYQ5q9kBSwvssQYZA8u3aVY3xYABWcflRSSdWDJzt2TTHQCy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5093
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQpPbiBNb24sIDIwMjItMTItMDUgYXQgMTc6MTkgLTA4MDAsIENlcmFvbG8gU3B1cmlvLCBEYW5p
ZWxlIHdyb3RlOg0KPiBUaGUgY3VycmVudCBleGVjdGF0aW9uIGZyb20gdGhlIEZXIHNpZGUgaXMg
dGhhdCB0aGUgZHJpdmVyIHdpbGwgcXVlcnkNCj4gdGhlIEdTQyBGVyB2ZXJzaW9uIGFmdGVyIHRo
ZSBGVyBpcyBsb2FkZWQsIHNpbWlsYXJseSB0byB3aGF0IHRoZSBtZWkNCj4gZHJpdmVyIGRvZXMg
b24gREcyLiBIb3dldmVyLCB3ZSdyZSBkaXNjdXNzaW5nIHdpdGggdGhlIEZXIHRlYW0gaWYgdGhl
cmUNCj4gaXMgYSB3YXkgdG8gZXh0cmFjdCB0aGUgdmVyc2lvbiBmcm9tIHRoZSBiaW4gZmlsZSBi
ZWZvcmUgbG9hZGluZywgc28gd2UNCj4gY2FuIGtlZXAgdGhlIGNvZGUgdGhlIHNhbWUgYXMgZm9y
IG9sZGVyIEZXcy4NCj4gDQo+IFNpbmNlIHRoZSBHU0MgRlcgdmVyc2lvbiBpcyBub3QgY3VycmVu
dGx5IHJlcXVpcmVkIGZvciBmdW5jdGlvbmFsaXR5IGFuZA0KPiBpcyBvbmx5IG5lZWRlZCBmb3Ig
ZGVidWcgcHVycG9zZXMsIHdlIGNhbiBza2lwIHRoZSBGVyB2ZXJzaW9uIGZvciBub3cgYXQNCj4g
ZmV0Y2ggdGltZSBhbmQgYWRkIGl0IGxhdGVyIG9uIHdoZW4gd2UndmUgYWdyZWVkIG9uIHRoZSBh
cHByb2FjaC4NCj4gDQo+IHYyOiByZWJhc2VkIG9uIHVjX2Z3IHZlcnNpb24gc3RydWN0IGNoYW5n
ZXMuDQo+IA0KQWxhbjpbc25pcF0NClJldmlld2VkIHRoZSBjaGFuZ2VzIHRoYXQgY2FtZSBmcm9t
IHRoZSByZWJhc2UgKHVwc3RyZWFtIG1lcmdlcykgLSBzbyBtaW5vciBpIG1pc3NlZCBpdCBhdCBm
aXJzdC4NCkZ1bmN0aW9uYWxseSBpZGVudGljYWwgYXMgYmVmb3JlIHNvOg0KUmV2aWV3ZWQtYnk6
IEFsYW4gUHJldmluIDxhbGFuLnByZXZpbi50ZXJlcy5hbGV4aXNAaW50ZWwuY29tPg0K
