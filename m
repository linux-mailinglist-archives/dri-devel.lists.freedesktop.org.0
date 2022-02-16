Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 316FD4B847C
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 10:36:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAAC610E66D;
	Wed, 16 Feb 2022 09:36:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D98E410E66D;
 Wed, 16 Feb 2022 09:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645004168; x=1676540168;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=eZRWjXDe/dMRlZ2rlnbvT3iyoeNq+q90/ODmYrNpIx8=;
 b=SnObTMQBvNRsFPOcgkbw9bNLY26FLvIqN3WPBu/yYOd7lL8FQEeHSuOQ
 Hng/EIqQqvK8ihORqC4uUSJqI1sFU5x69CmXgxOThok8pkb81f4kUOEkw
 9dssTN90CUMklHXyy3vsN5KHSodN4KvIAwi9by5NtNBwbCCmiR0mZWrHw
 8hAdeOjHSbayPz8uG8kblzex6HP0EL0031W4PXnRr3gP30XpDDtfGNI7i
 0PjFGG/vXLfV4593F51KqY+sPGEuq4awmtXffTRslL2sBTfiwAg8ipsGR
 LJBxR9TNiAdRoYsEVeJjOGZMcJgqy27rf1tr64t+lXj+yDaUZbrkOsvnO g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="248160763"
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; d="scan'208";a="248160763"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 01:36:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; d="scan'208";a="704229521"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga005.jf.intel.com with ESMTP; 16 Feb 2022 01:36:08 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 16 Feb 2022 01:36:07 -0800
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 16 Feb 2022 01:36:07 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Wed, 16 Feb 2022 01:36:07 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Wed, 16 Feb 2022 01:36:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mXtssDwzIRIzzqft1UrR2K2UeuNjoq040XuFFRgnONE7eSeskoQI5sSP8m9joX9kuB9VdErbtknY/lJV/LGvng5kgrqbXhXMtL5pNa3BmJ0Hnac/gQdMl14AUPcIynDPRUr/PD1oV6WrB5vavZ+I3+GCNHJ1fS+mo5xTK5DA7M0k/J8ST0CtyJXULfFALNT8yr2rPb+HQUZgqlvjAMNG5JncnjJ1bwJOf0rjF9u4UsSFnKTLJ2ql86YjdImSiqyjAWu3NDN40splRa1Fmk+W+x2oEYsEYmzcQDNuILddkzZOHLlA0GfreXNdGBLbmqXDldRUkQuio9K0SUtRhyap1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eZRWjXDe/dMRlZ2rlnbvT3iyoeNq+q90/ODmYrNpIx8=;
 b=lExQuiGqaU55+PyI+SWFJtbMJjRoYYvX5p3eKX1+59Vr90jtndlYjtToCMPw4pAc4UFDJHgHB85CAygLvCYYWd6jzEJiu9CeJEKodcVYV4rfeWCe+jnIv7puKLU5V6vMvaPP1Yc700GpcDCG2hr6i++YwRn9Y1jxOji6qalLHJga0mxH19bNnVrHCaHIYlok3cByYFXimYqfWrjVqIQi4is7+0zANxsyzVDNyQcfn2cyBImuIZ7g7TDbgZfsEkmSpz/kNGz33S9dR0ReNnk7q8fY9Al1Mk9jaEAOYBsX9VgtJ/PrPBUkid8gTCpluw1k0oN/J4IDA2Yq2tKCK0cpkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DM6PR11MB2731.namprd11.prod.outlook.com (2603:10b6:5:c3::25) by
 BL0PR11MB3332.namprd11.prod.outlook.com (2603:10b6:208:6b::25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.18; Wed, 16 Feb 2022 09:36:04 +0000
Received: from DM6PR11MB2731.namprd11.prod.outlook.com
 ([fe80::b4f9:69c4:33a4:aca2]) by DM6PR11MB2731.namprd11.prod.outlook.com
 ([fe80::b4f9:69c4:33a4:aca2%6]) with mapi id 15.20.4975.015; Wed, 16 Feb 2022
 09:36:02 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "C,
 Ramalingam" <ramalingam.c@intel.com>
Subject: Re: [PATCH 3/3] drm/i915: Fix for PHY_MISC_TC1 offset
Thread-Topic: [PATCH 3/3] drm/i915: Fix for PHY_MISC_TC1 offset
Thread-Index: AQHYIjAmYa3IUrw5kk2DUczzl8q10ayV4EKAgAAMlYA=
Date: Wed, 16 Feb 2022 09:36:02 +0000
Message-ID: <392e942460079346d1ce9d3a17db11f9d02a17f5.camel@intel.com>
References: <20220215055154.15363-1-ramalingam.c@intel.com>
 <20220215055154.15363-4-ramalingam.c@intel.com>
 <Ygy68/f1ERpTKJJW@intel.com>
In-Reply-To: <Ygy68/f1ERpTKJJW@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 542ff157-8b28-4dcf-3193-08d9f12fbf3a
x-ms-traffictypediagnostic: BL0PR11MB3332:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BL0PR11MB33323CE8B5CB840C21B729F28A359@BL0PR11MB3332.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Hkubx0SK2taryEfA88PE6KUY5oc5hHJih078T29EW5icsTj16n/+XYjcDyaEdQKvxJ7YVtbJq04+fjRxxOh8+hIS6mOOxi+7NiQL91AENKurueyfKg515SzkjAJ2XaFlXjaDyIbajpf2bgc83UhsUtyR8B5KsUjPyX/uGsq9OEKX34YsvJ7C3wak7LFwJb3Jmst2GM7+XUSmglKuqfetbrxTtcLI0KJUk7z9lIcfRZRCHDbTqPPQBPkhLT4vRU7e9ukHnIhSbOEC2NmJ5xh9yPlgreJ46re+v5aCQVtT2fBDRCDH4J7vjde+bp3U/h1aQGlnfvU57niBw6BJJI/BHpY13ZH0GEHj/MrF2q1/hRbwG1J2wKaccgAKchO5Nta6pefu/EEuNbnFGWDp0m8nSXe96FRSPoAdNhwIwXZmRpf/o64foImhS2wxYpHT/4CtNd4cXY9Xl/C4SR5iC8CR5BBUmpwBiv8FQKewZrDwH14SjjuU/aa/YMLE3NFQsC4R3FJDqbxF3q71u1pOZ5GvyGDsQzdDx3TW71xQLKj/QAuLBvjw4TBq/i/4PZdhzkXiLnhz0lc7FdQSqz4cgvCOEavbEgriXpMvQyszDNwwfaKZiu45yxGyAjnhhAVHIb4tq5LK208I/YVPUgyESPnere+3frTgF3FAvK4xvk3wXhN9Cux4af5UJRzWq79QX4WgO30/357PCEfIx8XnqfBsMA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2731.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(86362001)(66446008)(8936002)(54906003)(38070700005)(91956017)(82960400001)(122000001)(6486002)(110136005)(6636002)(4326008)(36756003)(64756008)(38100700002)(5660300002)(8676002)(66946007)(66556008)(76116006)(66476007)(71200400001)(83380400001)(316002)(6506007)(2906002)(6512007)(2616005)(26005)(508600001)(186003)(66574015);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eXRLaHROR2FUcG5Uekk4bnIxK2pDb2dicXV0QStXM3RoZTltOVRKUm1PK1Qr?=
 =?utf-8?B?eG44ZUNsRDlpamNtL2RwYXAwVFlQMTcraS9SUW1PWWNMQ2x2SzVwQmVSMnFK?=
 =?utf-8?B?cUlLMTJieG11dFFDYmszK0NYc29zQzJhR3g4Z1Z3c3AvWnVlY0hQRGlwSFZz?=
 =?utf-8?B?RWsxOTlhK1FTOGVWazhTcDlJYldZL2swNjhERjVXQ2tpM1VhNTBNeFFEdCtX?=
 =?utf-8?B?ckZUbDZSYitYTjVEWWFnTXgvZUVEbHYvT25UenpjZkU1emFxaGVMNWJNMWhT?=
 =?utf-8?B?eDUyUmlVeFFXTHh4LzlrTlBabENJSzBobnk5UU84QTkzaUxWc3hmb2tadXFR?=
 =?utf-8?B?S3FwZ1NuTFlxZzRxazhmU2VYb3lXeHNDT3pVQ25VbUVjTllncWdJcU9CdDhB?=
 =?utf-8?B?Qk5xTHN3ZUlRalcvRHZwSWkrbUxqRDljNS9XY01XeDVXUExzWnowdkxncmUx?=
 =?utf-8?B?ayszMmsrTHZ3aHJQalJkbU1FUStWVUdkOEdOOXYyKzhHa2RIbTRHSGRiUS9J?=
 =?utf-8?B?ZDNIbXdUMmNMSVlnK0NGazNWTHYrbGtxQUQ3RDVLSld1Uzk1Q1lXK3R3VzJQ?=
 =?utf-8?B?UmlCdWVPc3FQVXh1OEk3UkdUajlWY3NqYVorellWQkMxbE9scFJvLy9XMnNj?=
 =?utf-8?B?K3QyVmlxR2hTVHYva0lwS2MrVG0wSXFEQkVTRmxNNTk0cGZMWG9DODFTanYw?=
 =?utf-8?B?YVUwTjByaUl6ejRmNytrMVZlMzN2M3JIeTFndklJUjBwMDZLQTB5dVNGdndY?=
 =?utf-8?B?aVZYZEhnc1c1WlNselIvZXBhVlB5ZDZVQUltc2NyTlFPbExUU2Q0U0UzVkdz?=
 =?utf-8?B?L2xVbTcrRG9MakVydmhhL0J0b0FqNm5JU2diWE5nb1dyeG0wZDU2YmttcG96?=
 =?utf-8?B?dmNJWHZCWndwcFhxSDU2WFlQQ2VOK25hVG5DcWtuZXpHWFEwVTg5bGZvSktQ?=
 =?utf-8?B?bmpRRXd2ZHo2bzhsdnhVR2xicFVJOHFnbnA2UFJic1ZpQmdvK2N3UjZnakxs?=
 =?utf-8?B?aDNJZ0VNeUFmWk5yaExvMXRvMXFDQ1ZnR25TQUNUM2dydVhhZjBvelJDSjYz?=
 =?utf-8?B?NzBERkhONWxTNnBZMnAwcDN2VjMxUWMwYno2UWsyY2dxcTNOSEsyVkZaOUV5?=
 =?utf-8?B?SGQ2b1ZSK0daMnNNdkV2aDJuQi84ajRkNXFtbFU2NUFoN29VNnBvMkFGandu?=
 =?utf-8?B?a21iL1BIZlFNQ2xlYUlKRTA0TTJwQWlZRHdXYndwRUY3ZWhUbEt1U1ZaYkRk?=
 =?utf-8?B?NWJFa3huSjZjTlF3N3NycWUza0U4NWwyUjN5SlhYU2twdmxMQ2tTWnJIS1Zm?=
 =?utf-8?B?UzVtV1Y1Y0RwbTFWcWJDSnFlV1ZtVFY0QUNENERCaTVpaDhLZU1HNDkvNUI0?=
 =?utf-8?B?M05SVHhRQWdoZSs0M2RSZlJibldNdm04RkNGT1c2M3ZPamxrTEdHOUxZY2ty?=
 =?utf-8?B?LzA4VUNndGVUNlVENE9YM0haNmdPUGl5cFZEcjV6WkZEekp1aGR6ZHg2QXRB?=
 =?utf-8?B?cEZLRUVPd25YYkpNSVpuV1FBZnZEMTZ5dXZvaVZRZHJRUVNnVVBXWEM4TlRN?=
 =?utf-8?B?SU9SS1BHOFA2RkFlOU16SU1MOHhxYzNHS1hUTUVXTE9hT0FhNXQyaWIwbzRY?=
 =?utf-8?B?TnhibUF6bG5aNWhOVnZaRnBPdEFaWXE4dnJnQm1PMWxIdXV6K0NJSlExdVYx?=
 =?utf-8?B?NDlWSUovVGk4Z1ZjZXlRcHgrd29XQkdwM0FmMVRiYkZ4S2pOTFQ1amhlQThv?=
 =?utf-8?B?cDZLK3h6RUhRcHJaa1ZGMC9BUFNRU200MWVCV3pZNm81Z3ZvVzhqYytOWEI3?=
 =?utf-8?B?UW9lZmF4TGI0cVdpK3A1NzQ4SXNMNFZQa0x5Z0dBMndkSTdBaURyYWt5SFNn?=
 =?utf-8?B?NXIwTCtnVmdDU0VwR2NBeHA4UkVERytldzcrby9FMkpERGJjK1lyTHk4cFhw?=
 =?utf-8?B?MHJPZGVyK3Z1WmhwcFdMR2gyTUwvOGYwNXoyRnBkZCtVNjBYcmhncys5SUZQ?=
 =?utf-8?B?bnNWYjU2ejVnVFVBUXM0ZVhDRENScGNJRFNsSm1ZS0Ftbjc1U1QyVENhN3NM?=
 =?utf-8?B?OEhFWWRXMDQ1VXhyZ002T2VkWVlDaVZMVkdyM0dvRTJ5NWQvUDNGRzEyYVVt?=
 =?utf-8?B?UXdFZmZlL3RSYSt0a1p1aFZLcDJjblNGeU01NW9ubm5MNWJSMDJlNFBrRHJ1?=
 =?utf-8?B?QkkxR2FZL0NYemFjcnoxSzhZWFFndGFPT1VYWE9Lalp6SWNaaXNrNmdUQitN?=
 =?utf-8?Q?ilKV7XcRgn5VKjl/Pha8q6zlFEL4v6MChEN1D7SfqA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3805FF768BDAAF4EA61F40004CD43EDF@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2731.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 542ff157-8b28-4dcf-3193-08d9f12fbf3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2022 09:36:02.2717 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: znp5C8SAhJaISxCbOQs67iVAsSMVBZtO+m07lqc8gPTNm/eqA5jVpZ49oEYxrAMjWAnkeSo7q0P2n3YBJhd1Mpty0s0iC/WfPADtjHe4Ro8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3332
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
 "Shankar, Uma" <uma.shankar@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIyLTAyLTE2IGF0IDEwOjUwICswMjAwLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6
DQo+IE9uIFR1ZSwgRmViIDE1LCAyMDIyIGF0IDExOjIxOjU0QU0gKzA1MzAsIFJhbWFsaW5nYW0g
QyB3cm90ZToNCj4gPiBGcm9tOiBKb3VuaSBIw7ZnYW5kZXIgPGpvdW5pLmhvZ2FuZGVyQGludGVs
LmNvbT4NCj4gPiANCj4gPiBDdXJyZW50bHkgSUNMX1BIWV9NSVNDIG1hY3JvIGlzIHJldHVybmlu
ZyBvZmZzZXQgMHg2NEMxMCBmb3IgUEhZX0UNCj4gPiBwb3J0LiBDb3JyZWN0IG9mZnNldCBpcyAw
eDY0QzE0Lg0KPiANCj4gV2h5IGlzIGl0IFBIWV9FIGFuZCBub3QgUEhZX0Y/DQoNClRoaXMgaXMg
YSB2YWxpZCBxdWVzdGlvbi4gSXQgc2VlbXMgd2UgaGF2ZSBmb2xsb3dlZCBpbnRlbF9waHlfaXNf
c25wcygpDQpoZXJlOg0KDQovLyBzbmlwDQplbHNlIGlmIChJU19ERzIoZGV2X3ByaXYpKQ0KCQkv
Kg0KCQkgKiBBbGwgZm91ciAiY29tYm8iIHBvcnRzIGFuZCB0aGUgVEMxIHBvcnQgKFBIWSBFKSB1
c2UNCgkJICogU3lub3BzaXMgUEhZcy4NCgkJICovDQoJCXJldHVybiBwaHkgPD0gUEhZX0U7DQov
LyBzbmlwDQoNCkFjY29yZGluZyB0byBzcGVjIHBvcnQgRSBpcyAiTm8gY29ubmVjdGlvbiIuIEJl
dHRlciBwbGFjZSB0byBmaXggdGhpcw0KY291bGQgYmUgaW50ZWxfcGh5X2lzX3NucHMoKSBpdHNl
bGY/DQoNCj4gDQo+ID4gRml4IHRoaXMgYnkgaGFuZGxpbmcgUEhZX0UgcG9ydCBzZXByYXRlbHku
DQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogTWF0dCBSb3BlciA8bWF0dGhldy5kLnJvcGVyQGlu
dGVsLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBKb3VuaSBIw7ZnYW5kZXIgPGpvdW5pLmhvZ2Fu
ZGVyQGludGVsLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBSYW1hbGluZ2FtIEMgPHJhbWFsaW5n
YW0uY0BpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfc25wc19waHkuYyB8IDIgKy0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkx
NV9yZWcuaCAgICAgICAgICAgICAgIHwgNiArKysrLS0NCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA1
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfc25wc19waHkuYw0KPiA+IGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9zbnBzX3BoeS5jDQo+ID4gaW5kZXggYzYwNTc1
Y2I1MzY4Li5mMDgwNjFjNzQ4YjMgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9zbnBzX3BoeS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9zbnBzX3BoeS5jDQo+ID4gQEAgLTMyLDcgKzMyLDcgQEAgdm9pZCBp
bnRlbF9zbnBzX3BoeV93YWl0X2Zvcl9jYWxpYnJhdGlvbihzdHJ1Y3QNCj4gPiBkcm1faTkxNV9w
cml2YXRlICppOTE1KQ0KPiA+ICAJCWlmICghaW50ZWxfcGh5X2lzX3NucHMoaTkxNSwgcGh5KSkN
Cj4gPiAgCQkJY29udGludWU7DQo+ID4gIA0KPiA+IC0JCWlmIChpbnRlbF9kZV93YWl0X2Zvcl9j
bGVhcihpOTE1LCBJQ0xfUEhZX01JU0MocGh5KSwNCj4gPiArCQlpZiAoaW50ZWxfZGVfd2FpdF9m
b3JfY2xlYXIoaTkxNSwgREcyX1BIWV9NSVNDKHBoeSksDQo+ID4gIAkJCQkJICAgIERHMl9QSFlf
RFBfVFhfQUNLX01BU0ssDQo+ID4gMjUpKQ0KPiA+ICAJCQlkcm1fZXJyKCZpOTE1LT5kcm0sICJT
TlBTIFBIWSAlYyBmYWlsZWQgdG8NCj4gPiBjYWxpYnJhdGUgYWZ0ZXIgMjVtcy5cbiIsDQo+ID4g
IAkJCQlwaHkpOw0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3Jl
Zy5oDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3JlZy5oDQo+ID4gaW5kZXggNGQx
MmFiYjJkN2ZmLi4zNTRjMjVmNDgzY2IgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2k5MTUvaTkxNV9yZWcuaA0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcmVn
LmgNCj4gPiBAQCAtOTU1OSw4ICs5NTU5LDEwIEBAIGVudW0gc2tsX3Bvd2VyX2dhdGUgew0KPiA+
ICANCj4gPiAgI2RlZmluZSBfSUNMX1BIWV9NSVNDX0EJCTB4NjRDMDANCj4gPiAgI2RlZmluZSBf
SUNMX1BIWV9NSVNDX0IJCTB4NjRDMDQNCj4gPiAtI2RlZmluZSBJQ0xfUEhZX01JU0MocG9ydCkJ
X01NSU9fUE9SVChwb3J0LCBfSUNMX1BIWV9NSVNDX0EsIFwNCj4gPiAtCQkJCQkJIF9JQ0xfUEhZ
X01JU0NfQikNCj4gPiArI2RlZmluZSBfREcyX1BIWV9NSVNDX1RDMQkweDY0QzE0IC8qIFRDMT0i
UEhZIEUiIGJ1dCBvZmZzZXQgYXMgaWYNCj4gPiAiUEhZIEYiICovDQo+ID4gKyNkZWZpbmUgSUNM
X1BIWV9NSVNDKHBvcnQpCV9NTUlPX1BPUlQocG9ydCwgX0lDTF9QSFlfTUlTQ19BLA0KPiA+IF9J
Q0xfUEhZX01JU0NfQikNCj4gPiArI2RlZmluZSBERzJfUEhZX01JU0MocG9ydCkJKChwb3J0KSA9
PSBQSFlfRSA/DQo+ID4gX01NSU8oX0RHMl9QSFlfTUlTQ19UQzEpIDogXA0KPiA+ICsJCQkJIElD
TF9QSFlfTUlTQyhwb3J0KSkNCj4gPiAgI2RlZmluZSAgSUNMX1BIWV9NSVNDX01VWF9ERElECQkJ
KDEgPDwgMjgpDQo+ID4gICNkZWZpbmUgIElDTF9QSFlfTUlTQ19ERV9JT19DT01QX1BXUl9ET1dO
CSgxIDw8IDIzKQ0KPiA+ICAjZGVmaW5lICBERzJfUEhZX0RQX1RYX0FDS19NQVNLCQkJUkVHX0dF
Tk1BU0soMjMsDQo+ID4gMjApDQo+ID4gLS0gDQo+ID4gMi4yMC4xDQoNCkJSLA0KDQpKb3VuaSBI
w7ZnYW5kZXINCg==
