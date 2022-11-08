Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B6F62063D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 02:39:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0DA910E3DD;
	Tue,  8 Nov 2022 01:39:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22F9610E3DC;
 Tue,  8 Nov 2022 01:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667871579; x=1699407579;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=i+LcLCpH9/o0h6Hco1G5/Ih8AqXBWBvEN/7jgXxmKzA=;
 b=ROkDlNKkpBVWl6JQXse/ifshg9FvZXX33180yrSZmRRXKj0f8BxzM+IA
 YO+AvEd4X1SvKxHlc9fPt9rTVUIZN1o5inG+2cUMXkad6rI0Ot4fHc8Im
 OtqK38ujAQY2VgjcsTm77NyZvr6hKcRW1IVKFzscxEbLzewsAhBqfpO0Z
 idOVWskbfdwnvAMwpAG/Ht2THwekvbN8nKt2DdVhtopkL7HCVj5BUgQ3P
 yZzrnasJERKXMDyfLt0ld8YYXk/kdZFj+NzHysjwWOdOWIt48CXy0v9ov
 O0MC3MiK1cmXSoVjpg/ONYzUKbai5EKb88f2pKo5FqpbkkAAQs3c379Xk Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="396870275"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="396870275"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 17:39:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="705106752"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="705106752"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP; 07 Nov 2022 17:39:37 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 7 Nov 2022 17:39:37 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 7 Nov 2022 17:39:37 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 7 Nov 2022 17:39:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Do3AKviWxh0UR0AXWW5daYrat/KkDpr7j6Kx1N9m2jHLP9TvAmGS1wlh2R1rJZ9BgSKTXO956P9trZf7gxHd3JrqWHyRwqv5m0byu1Fo3BH8dx4g3Xij8jHuM9DdApQ3UcCF0wsARb8m7hO0FrrNFC1ZuG00gBQs3i1veQXMPNkK6NgYDhEF07JHazrqp7QPPCFxmjJBPrTynWuMloHayqEmYFwr4MFxKma1r6MSqD9IRdSCFMrc6nmsyFYj0leymQFx2LAzPn9TsEcQDPBWid9lYLlugZQACIIsdl6phivA/AZZXL5nJjUR41rH03NsSQpgiPbMBVjsuPd16hkZcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i+LcLCpH9/o0h6Hco1G5/Ih8AqXBWBvEN/7jgXxmKzA=;
 b=HTu1VGvLs418AXur+TqwwOrVGwOSU5SOa8fIkVTFDbKCuVCwJd+wRqrgohDRFWIeRfrpt1caymcE1eVs6V2lO25YvnGRLQzFaShM5Et7gMGxhJnwk/xJf479n2PdoNPo8enYzK369op+o09VTIxmyxFyISf4WtbVEXTtUwn0o92eryGQxzUYmh5oN6XGWVJ2VRiccdnwCDBwVS/EKWrINzEoMmXQoXQi2bYCInOPC3LIZkEF6U7IaF33nBCfTBdlBbxZziyCOUaxfdbwe4Rd8TaQzwCjo5hxlLcEHAYYAdbL6EFccpEoz1kIfqseLTTwXGemxk4MCLxDtSPbzVOfDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CO6PR11MB5620.namprd11.prod.outlook.com (2603:10b6:303:13e::17)
 by LV2PR11MB5974.namprd11.prod.outlook.com (2603:10b6:408:17e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.25; Tue, 8 Nov
 2022 01:39:34 +0000
Received: from CO6PR11MB5620.namprd11.prod.outlook.com
 ([fe80::bd11:c577:72ab:57ed]) by CO6PR11MB5620.namprd11.prod.outlook.com
 ([fe80::bd11:c577:72ab:57ed%8]) with mapi id 15.20.5791.027; Tue, 8 Nov 2022
 01:39:34 +0000
From: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v6 20/20] drm/i915/vm_bind: Async vm_unbind support
Thread-Topic: [PATCH v6 20/20] drm/i915/vm_bind: Async vm_unbind support
Thread-Index: AQHY8oZHKND6eQ51EEW7nzZdttyaRa40QNsA
Date: Tue, 8 Nov 2022 01:39:34 +0000
Message-ID: <9b2538aa6ba2421e603c820af94c5d90df760501.camel@intel.com>
References: <20221107085210.17221-1-niranjana.vishwanathapura@intel.com>
 <20221107085210.17221-21-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20221107085210.17221-21-niranjana.vishwanathapura@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.3-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5620:EE_|LV2PR11MB5974:EE_
x-ms-office365-filtering-correlation-id: 18319d31-d96f-46ff-4804-08dac12a1725
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8L421ANcOJJwf2dhP6FQFPYPZq+BtkppMSK96enC0xZH7gLHWFTn58+CJzvxQBKaUDO+PlVU9H11CEMf8FqJkFz15k0r35zW2MJj3AXKkCa4/rEfOrUdcjaK7g5Qbi7hQha2hESpol55FLnoQZ1MGYhZUQalNkx4LcsDU28GrmN/LqRrRqKgwTET0DSznLr/Ci7V0USOIwNKvcl5TjhQ6uiFIoVZBgvsV6vZKErsOaiEXgX+YWf/xqTdvJEsBSoO2rUMtDQve6aHdFpsz0HqRE6q3q9tT61NKgxfhBYT01Xk2fWYynl/YtJfcE2wxLEJUnQaSPUg89ICoBeMkkfFoabGCvs4ZYWdCZxcjeD/fcyoGYBv89OJqCx4I66oe0fWZD9gMmUK4lUqKpeS8DNfknUpb4Al0fzYpt27y6DA/URNxPYssA46pFBjwP9Le4Q1jNkG2UW9MgSXMcHCoPmb30DOk4LhV7Bqf7dJlkiGUZ2KI9eXFMVR5Vc3vCVD546FcNoTyFPThQwWAzy2DOOlHUdlkCObWWOCb4RcsTaTPhPKLCe20ZE9kY4TETHDpFIT0J1Xx7KGYHteYCo+fBTU6aKtbHnTxFILO6eZJo9kyeQmiyS/IfQ+w+PMgV+7TlB0z2WqJv9lBqc8mDs8M6gEHTGakh/l8lcpgdbq64z6HSq6Otb4X/RvRwCq1lLoBIz//O2pp5vSVZIQop1/LaYcR60hYIZ/BRFSyeUYalcVNJL5cOtquniAPj8z9TkvFonVMIZlbuOLfhllrhIV7cvZiA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5620.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(366004)(39860400002)(346002)(376002)(396003)(451199015)(2616005)(186003)(316002)(54906003)(36756003)(110136005)(38070700005)(38100700002)(122000001)(82960400001)(86362001)(6506007)(83380400001)(6512007)(8936002)(478600001)(41300700001)(5660300002)(66446008)(91956017)(4326008)(6486002)(64756008)(66556008)(66476007)(66946007)(8676002)(76116006)(71200400001)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VnFwaWVSb0lUR3NOYWtRRExYWGJPU2NsaDNOdjU5b21PYzBFTEMvby84Mml3?=
 =?utf-8?B?N1RoRC9nakw1UFFVbzVBR0NCTnB4U2VZV2tEUHo1NGV2RHFrblNKTFljNVJu?=
 =?utf-8?B?aVBOajNjdEZXZDcrWDVEZ2huMUNsMllnMlEwbnFmYTNPbHVEalFDWUl5T2o3?=
 =?utf-8?B?Zm5QWkpMU0ZaQkxYMVlMcDZrcmlaVFB0VVZhQnhDT3FwQk1OMjU0R3p6NWJj?=
 =?utf-8?B?VGM2SGErTVcwZURBRy91S3RTZXI0UjQrQ2xhMkpiSmREZktyNU1ETDUwNENX?=
 =?utf-8?B?OU9vSkNNOWIxdUIxckV2eEZlT3dzNDlrdUJLL1JUYjRyVWN4WWpKTCs5UzQy?=
 =?utf-8?B?V2owWkhsR0FIc3dpVHU4VHJCRGRPSjV3NDcyWlBWYVRBSzFkYklQNEdLZnh5?=
 =?utf-8?B?OUxiNnBsSUlJbkZYd0JTcFRROWhFR2ZyK25weGlSOXUrL210U3prT3psNGVO?=
 =?utf-8?B?Rmhmc2ZUVHRwZXg1dUwyTUVPWlQvRU16YUloNXQ1SDl5SHhHNTE5RWE5VTQ4?=
 =?utf-8?B?UFFqdUxIZTljSWVqcm5jSkJRK0Z1Y0pLMDBQbHI0YURWcGUxMGRxdXY1SFRW?=
 =?utf-8?B?OUhNaEdRUS9MRnJHS0ZHY0VweXd4VzVQZW16RU53Vit2eENrMERuY0tBNUc5?=
 =?utf-8?B?TmxWeHk1dTJDQlN2WEdlblF1WVpiRDgwWE92RVZxdTd1VWh6TTd1bXJ1VjNK?=
 =?utf-8?B?MjBjUWpFREc2dGk0NC9TZ3I0K2tGNmkwd3lJbjF6SEJka3BwZTBBUUZrMGRE?=
 =?utf-8?B?blhnK2d1VmdDRkNnL3VhaEtLQU44RzZ3Q2RXd1dRUlhTUWx0N0NIWjhRYkZn?=
 =?utf-8?B?cXFOc0h5c0NzUGI1bG5ETzltQSticVpuRElDeEI5NDZvOWJzMURvbjkwS0M4?=
 =?utf-8?B?QmFaYUdYR1gzQmVxT1A5L0liSzZJdklsOXRvMFJlaUNUQVdSdjE5TkdIcitB?=
 =?utf-8?B?UStnR2tsczc4V1d5Y0Y5US90UmxpRzJQYWMwNDdDcUNwRk8xbnhJVjU4eWxq?=
 =?utf-8?B?OW5pcTV5U0dsNlEvcnlvQUwyUXNXQjVQTXB5cXh1elhHK3ljSEFKMlRHTk92?=
 =?utf-8?B?eWxMM25XUWo5NVhMYUpmWTVPODRwQVVsQTdnSjVTcXVlWDBJWTJuc0FpQ3lC?=
 =?utf-8?B?YmZFY1Jjd0VuMG4ycWZTWk9RWDZMbzFLbXRlRFZGT25FbkRXOEl1cjV3aElo?=
 =?utf-8?B?UzI4Z241NXh5S3JPRHZRbFpiVTJqT0JhVm16SFBJSTl1TGZmdG0xSEgwRUZt?=
 =?utf-8?B?WWNMK2doUUxiRFZMZ3VhUUhldWlXUTBSb1N5b3pzcFBkY0tYck83WW1tMjZ0?=
 =?utf-8?B?cVdUZU9mS1hjZExCcXdGd2pjWUJoRC8vN1RsWGtpQVFKcmNNZnBZd0YxNG5y?=
 =?utf-8?B?UXljSTU1R1BiV09HS1VXajFmUzJ5djZndXlEczE2djAvbmprb0RtMTh2OWFr?=
 =?utf-8?B?eE1PazM1WkVPcFMxd0p1VU51SnB2WW1qZUViaWtJN2J3aGZYTXM3bENnbTBq?=
 =?utf-8?B?TTNBeFhqUW1JM0p2Rys5aTdTWnVISDNGd1VJUXVkSU0xV3grT2ZqTVVzYkVV?=
 =?utf-8?B?aUVUV2VyaDlqVGk3UUxjWnJSb0Y0VFJvWFcrclB0ZHdSTUdxMHRTbHZ2R0xn?=
 =?utf-8?B?TmVQQlFRSnZZMm1iS3Z1UG9wZENBZzVHT0dCaXU2dmV5R2xlUHVJeVZidTIy?=
 =?utf-8?B?OUpGNmpnYlhITkdiVTFnaElEd1pRNDE2K1Y1OUZha0RoSGdlbWhYVWtIZUVN?=
 =?utf-8?B?VGdrd0FWbFB1NXp4V3RGQUFRQTN1RnZvRituV0UvNllzQXlmRVFnNkd2SFkx?=
 =?utf-8?B?UEdsSlpiOHkwd3p3M01KV1BkWExzeW93RGxkY1p1dFI4YS83clV0YjlHMElH?=
 =?utf-8?B?WG85cVk1d1VoM25XbkJnUGZBRmJrYXBpOVNLbTlQSFZMcVhKU0xRaVBXQVhP?=
 =?utf-8?B?Z3pqK1Q1dkwvZy9zaU1QaG1FQnRWTVkwU3FiV2djNDk2T2tPWCt3MnptVnk0?=
 =?utf-8?B?Wk9ySXJORXZHZ0M0S0xLSis5TlRjWktzYVRMM0J3K08relFCa0V1UVFLZWFY?=
 =?utf-8?B?S1Mva1dTMXVoenZEUTU0Y0RsRzVPRmpVOTdHSGJLa0tnK0tzcTA4VVRpTmtW?=
 =?utf-8?B?dWViQXcyRXZaZ1orZFh0c0tIVWExOGlzMk1xd2pvY0x5SWl1L1VnSXg1MktF?=
 =?utf-8?B?T3lRN3E4a3hscDJJb25yMGFBNmNNdHV5elhaNFdqY1FWVndINGZpMXZOd3d0?=
 =?utf-8?B?SWdyNlhUZmwybjQxU0hNTVgyV1pnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <460D2C9A4433784FBB5B3F67D7EA1176@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5620.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18319d31-d96f-46ff-4804-08dac12a1725
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2022 01:39:34.7296 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EQNuxTj1dGyPKLjN/24Os40Sejt4313f+H6QWxGM0AYwlnSAOKl9CRQ66Rh6OGKTRkf19HbgDGdbEYuffZd0pDE+1QwhPNFesZa45bDNtms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5974
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
Cc: "Brost, Matthew" <matthew.brost@intel.com>,
 "andi.shyti@linux.intel.com" <andi.shyti@linux.intel.com>, "Ursulin, 
 Tvrtko" <tvrtko.ursulin@intel.com>, "Nikula, Jani" <jani.nikula@intel.com>,
 "Landwerlin, Lionel G" <lionel.g.landwerlin@intel.com>, "Hellstrom,
 Thomas" <thomas.hellstrom@intel.com>, "Auld, Matthew" <matthew.auld@intel.com>,
 "jason@jlekstrand.net" <jason@jlekstrand.net>, "Vetter,
 Daniel" <daniel.vetter@intel.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIyLTExLTA3IGF0IDAwOjUyIC0wODAwLCBOaXJhbmphbmEgVmlzaHdhbmF0aGFw
dXJhIHdyb3RlOg0KPiBBc3luY2hyb25vdXNseSB1bmJpbmQgdGhlIHZtYSB1cG9uIHZtX3VuYmlu
ZCBjYWxsLg0KPiBGYWxsIGJhY2sgdG8gc3luY2hyb25vdXMgdW5iaW5kIGlmIGJhY2tlbmQgZG9l
c24ndCBzdXBwb3J0DQo+IGFzeW5jIHVuYmluZCBvciBpZiBhc3luYyB1bmJpbmQgZmFpbHMuDQo+
IA0KPiBObyBuZWVkIGZvciB2bV91bmJpbmQgb3V0IGZlbmNlIHN1cHBvcnQgYXMgaTkxNSB3aWxs
IGludGVybmFsbHkNCj4gaGFuZGxlIGFsbCBzZXF1ZW5jaW5nIGFuZCB1c2VyIG5lZWQgbm90IHRy
eSB0byBzZXF1ZW5jZSBhbnkNCj4gb3BlcmF0aW9uIHdpdGggdGhlIHVuYmluZCBjb21wbGV0aW9u
Lg0KDQpDYW4geW91IHBsZWFzZSBwcm92aWRlIHNvbWUgbW9yZSBkZXRhaWxzIG9uIGhvdyB0aGlz
IHdvcmtzIGZyb20gdGhlDQp1c2VyIHNwYWNlIHBvaW50IG9mIHZpZXc/IEkgd2FudCB0byBiZSBh
YmxlIHRvIGtub3cgd2l0aCAxMDAlIGNlcnRhaW50eQ0KaWYgYW4gdW5iaW5kIGhhcyBhbHJlYWR5
IGhhcHBlbmVkLCBzbyBJIGNhbiByZXVzZSB0aGF0IHZtYSBvciB3aGF0ZXZlcg0KZWxzZSBJIG1h
eSBkZWNpZGUgdG8gZG8uIEkgc2VlIHRoZSBpbnRlcmZhY2UgZG9lcyBub3QgcHJvdmlkZSBhbnkg
c29ydA0Kb2YgZHJtX3N5bmNvYmpzIGZvciBtZSB0byB3YWl0IG9uIHRoZSBhc3luYyB1bmJpbmQu
IFNvLCB3aGVuIGRvZXMgdGhlDQp1bmJpbmQgcmVhbGx5IGhhcHBlbj8gV2hlbiBjYW4gSSBiZSBz
dXJlIGl0J3MgcGFzdCBzbyBJIGNhbiBkbyBzdHVmZg0Kd2l0aCBpdD8gV2h5IHdvdWxkIHlvdSBw
cm92aWRlIGFuIGFzeW5jIGlvY3RsIGFuZCBwcm92aWRlIG5vIG1lYW5zIGZvcg0KdXNlciBzcGFj
ZSB0byB3YWl0IG9uIGl0Pw0KDQpUaGFua3MsDQpQYXVsbw0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBOaXJhbmphbmEgVmlzaHdhbmF0aGFwdXJhIDxuaXJhbmphbmEudmlzaHdhbmF0aGFwdXJhQGlu
dGVsLmNvbT4NCj4gLS0tDQo+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV92bWEuYyB8IDUx
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS9p
OTE1L2k5MTVfdm1hLmggfCAgMSArDQo+IMKgMiBmaWxlcyBjaGFuZ2VkLCA0OCBpbnNlcnRpb25z
KCspLCA0IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2k5MTVfdm1hLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3ZtYS5jDQo+IGluZGV4
IDA4MjE4ZTNhMmYxMi4uMDNjOTY2ZmFkODdiIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9pOTE1X3ZtYS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfdm1h
LmMNCj4gQEAgLTQyLDYgKzQyLDggQEANCj4gwqAjaW5jbHVkZSAiaTkxNV92bWEuaCINCj4gwqAj
aW5jbHVkZSAiaTkxNV92bWFfcmVzb3VyY2UuaCINCj4gwqANCj4gDQo+IA0KPiANCj4gK3N0YXRp
YyBzdHJ1Y3QgZG1hX2ZlbmNlICpfX2k5MTVfdm1hX3VuYmluZF9hc3luYyhzdHJ1Y3QgaTkxNV92
bWEgKnZtYSk7DQo+ICsNCj4gwqBzdGF0aWMgaW5saW5lIHZvaWQgYXNzZXJ0X3ZtYV9oZWxkX2V2
aWN0KGNvbnN0IHN0cnVjdCBpOTE1X3ZtYSAqdm1hKQ0KPiDCoHsNCj4gwqAJLyoNCj4gQEAgLTE3
MTEsNyArMTcxMyw3IEBAIHZvaWQgaTkxNV92bWFfcmVvcGVuKHN0cnVjdCBpOTE1X3ZtYSAqdm1h
KQ0KPiDCoAlzcGluX3VubG9ja19pcnEoJmd0LT5jbG9zZWRfbG9jayk7DQo+IMKgfQ0KPiDCoA0K
PiANCj4gDQo+IA0KPiAtc3RhdGljIHZvaWQgZm9yY2VfdW5iaW5kKHN0cnVjdCBpOTE1X3ZtYSAq
dm1hKQ0KPiArc3RhdGljIHZvaWQgZm9yY2VfdW5iaW5kKHN0cnVjdCBpOTE1X3ZtYSAqdm1hLCBi
b29sIGFzeW5jKQ0KPiDCoHsNCj4gwqAJaWYgKCFkcm1fbW1fbm9kZV9hbGxvY2F0ZWQoJnZtYS0+
bm9kZSkpDQo+IMKgCQlyZXR1cm47DQo+IEBAIC0xNzI1LDcgKzE3MjcsMjEgQEAgc3RhdGljIHZv
aWQgZm9yY2VfdW5iaW5kKHN0cnVjdCBpOTE1X3ZtYSAqdm1hKQ0KPiDCoAkJaTkxNV92bWFfc2V0
X3B1cmdlZCh2bWEpOw0KPiDCoA0KPiANCj4gDQo+IA0KPiDCoAlhdG9taWNfYW5kKH5JOTE1X1ZN
QV9QSU5fTUFTSywgJnZtYS0+ZmxhZ3MpOw0KPiAtCVdBUk5fT04oX19pOTE1X3ZtYV91bmJpbmQo
dm1hKSk7DQo+ICsJaWYgKGFzeW5jKSB7DQo+ICsJCXN0cnVjdCBkbWFfZmVuY2UgKmZlbmNlOw0K
PiArDQo+ICsJCWZlbmNlID0gX19pOTE1X3ZtYV91bmJpbmRfYXN5bmModm1hKTsNCj4gKwkJaWYg
KElTX0VSUl9PUl9OVUxMKGZlbmNlKSkgew0KPiArCQkJYXN5bmMgPSBmYWxzZTsNCj4gKwkJfSBl
bHNlIHsNCj4gKwkJCWRtYV9yZXN2X2FkZF9mZW5jZSh2bWEtPm9iai0+YmFzZS5yZXN2LCBmZW5j
ZSwNCj4gKwkJCQkJICAgRE1BX1JFU1ZfVVNBR0VfUkVBRCk7DQo+ICsJCQlkbWFfZmVuY2VfcHV0
KGZlbmNlKTsNCj4gKwkJfQ0KPiArCX0NCj4gKw0KPiArCWlmICghYXN5bmMpDQo+ICsJCVdBUk5f
T04oX19pOTE1X3ZtYV91bmJpbmQodm1hKSk7DQo+IMKgCUdFTV9CVUdfT04oZHJtX21tX25vZGVf
YWxsb2NhdGVkKCZ2bWEtPm5vZGUpKTsNCj4gwqB9DQo+IMKgDQo+IA0KPiANCj4gDQo+IEBAIC0x
Nzg1LDcgKzE4MDEsNyBAQCB2b2lkIGk5MTVfdm1hX2Rlc3Ryb3lfbG9ja2VkKHN0cnVjdCBpOTE1
X3ZtYSAqdm1hKQ0KPiDCoHsNCj4gwqAJbG9ja2RlcF9hc3NlcnRfaGVsZCgmdm1hLT52bS0+bXV0
ZXgpOw0KPiDCoA0KPiANCj4gDQo+IA0KPiAtCWZvcmNlX3VuYmluZCh2bWEpOw0KPiArCWZvcmNl
X3VuYmluZCh2bWEsIGZhbHNlKTsNCj4gwqAJbGlzdF9kZWxfaW5pdCgmdm1hLT52bV9saW5rKTsN
Cj4gwqAJcmVsZWFzZV9yZWZlcmVuY2VzKHZtYSwgdm1hLT52bS0+Z3QsIGZhbHNlKTsNCj4gwqB9
DQo+IEBAIC0xNzk2LDcgKzE4MTIsMzQgQEAgdm9pZCBpOTE1X3ZtYV9kZXN0cm95KHN0cnVjdCBp
OTE1X3ZtYSAqdm1hKQ0KPiDCoAlib29sIHZtX2RkZXN0cm95Ow0KPiDCoA0KPiANCj4gDQo+IA0K
PiDCoAltdXRleF9sb2NrKCZ2bWEtPnZtLT5tdXRleCk7DQo+IC0JZm9yY2VfdW5iaW5kKHZtYSk7
DQo+ICsJZm9yY2VfdW5iaW5kKHZtYSwgZmFsc2UpOw0KPiArCWxpc3RfZGVsX2luaXQoJnZtYS0+
dm1fbGluayk7DQo+ICsJdm1fZGRlc3Ryb3kgPSB2bWEtPnZtX2RkZXN0cm95Ow0KPiArCXZtYS0+
dm1fZGRlc3Ryb3kgPSBmYWxzZTsNCj4gKw0KPiArCS8qIHZtYS0+dm0gbWF5IGJlIGZyZWVkIHdo
ZW4gcmVsZWFzaW5nIHZtYS0+dm0tPm11dGV4LiAqLw0KPiArCWd0ID0gdm1hLT52bS0+Z3Q7DQo+
ICsJbXV0ZXhfdW5sb2NrKCZ2bWEtPnZtLT5tdXRleCk7DQo+ICsJcmVsZWFzZV9yZWZlcmVuY2Vz
KHZtYSwgZ3QsIHZtX2RkZXN0cm95KTsNCj4gK30NCj4gKw0KPiArdm9pZCBpOTE1X3ZtYV9kZXN0
cm95X2FzeW5jKHN0cnVjdCBpOTE1X3ZtYSAqdm1hKQ0KPiArew0KPiArCWJvb2wgdm1fZGRlc3Ry
b3ksIGFzeW5jID0gdm1hLT5vYmotPm1tLnJzZ3Q7DQo+ICsJc3RydWN0IGludGVsX2d0ICpndDsN
Cj4gKw0KPiArCWlmIChkbWFfcmVzdl9yZXNlcnZlX2ZlbmNlcyh2bWEtPm9iai0+YmFzZS5yZXN2
LCAxKSkNCj4gKwkJYXN5bmMgPSBmYWxzZTsNCj4gKw0KPiArCW11dGV4X2xvY2soJnZtYS0+dm0t
Pm11dGV4KTsNCj4gKwkvKg0KPiArCSAqIEVuc3VyZSBhbnkgYXN5bmNocm9ub3VzIGJpbmRpbmcg
aXMgY29tcGxldGUgd2hpbGUgdXNpbmcNCj4gKwkgKiBhc3luYyB1bmJpbmQgYXMgd2Ugd2lsbCBi
ZSByZWxlYXNpbmcgdGhlIHZtYSBoZXJlLg0KPiArCSAqLw0KPiArCWlmIChhc3luYyAmJiBpOTE1
X2FjdGl2ZV93YWl0KCZ2bWEtPmFjdGl2ZSkpDQo+ICsJCWFzeW5jID0gZmFsc2U7DQo+ICsNCj4g
Kwlmb3JjZV91bmJpbmQodm1hLCBhc3luYyk7DQo+IMKgCWxpc3RfZGVsX2luaXQoJnZtYS0+dm1f
bGluayk7DQo+IMKgCXZtX2RkZXN0cm95ID0gdm1hLT52bV9kZGVzdHJveTsNCj4gwqAJdm1hLT52
bV9kZGVzdHJveSA9IGZhbHNlOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
aTkxNV92bWEuaCBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfdm1hLmgNCj4gaW5kZXggNzM3
ZWYzMTBkMDQ2Li4yNWYxNTk2NWRhYjggMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2k5MTVfdm1hLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV92bWEuaA0K
PiBAQCAtMjcyLDYgKzI3Miw3IEBAIHZvaWQgaTkxNV92bWFfcmVvcGVuKHN0cnVjdCBpOTE1X3Zt
YSAqdm1hKTsNCj4gwqANCj4gDQo+IA0KPiANCj4gwqB2b2lkIGk5MTVfdm1hX2Rlc3Ryb3lfbG9j
a2VkKHN0cnVjdCBpOTE1X3ZtYSAqdm1hKTsNCj4gwqB2b2lkIGk5MTVfdm1hX2Rlc3Ryb3koc3Ry
dWN0IGk5MTVfdm1hICp2bWEpOw0KPiArdm9pZCBpOTE1X3ZtYV9kZXN0cm95X2FzeW5jKHN0cnVj
dCBpOTE1X3ZtYSAqdm1hKTsNCj4gwqANCj4gDQo+IA0KPiANCj4gwqAjZGVmaW5lIGFzc2VydF92
bWFfaGVsZCh2bWEpIGRtYV9yZXN2X2Fzc2VydF9oZWxkKCh2bWEpLT5vYmotPmJhc2UucmVzdikN
Cj4gwqANCj4gDQo+IA0KPiANCg0K
