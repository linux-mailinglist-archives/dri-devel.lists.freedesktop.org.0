Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F707E7B0D
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 10:44:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0FDC10E968;
	Fri, 10 Nov 2023 09:44:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 629F510E95E;
 Fri, 10 Nov 2023 09:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699609471; x=1731145471;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sQ+GR3FN98LglIQuEpmoa0XBA9orHnKvNx551LVamC4=;
 b=a17Txtu3MgjAAo904RMsUdvJI4XFkBXip1hHHs1FTVX9omlV78/NCcWf
 ZY12l51PqlhZPahpwZ1tXoWOFp+vcrodYiXkQTMmv88BNWbk0b8muSE6P
 gUvnReWU8IMvlWkNyeIuOa+b0djrXgY8k1NP8UyIvuYgP4XTN6oXrWxkU
 1Edri2ui2Yx2Uh2j0f1WJEbDkb5POj5KyGWh3mUW7A1hPCvdulZVWWQ4a
 j3LlHhon3Rie228gb6S0OFDTjCSqil9AwlBWEt1Kx1Rp/vgi7UHKz6KWs
 zh3hagvxt+sUGTtAzD0gfRbX1M1Q+0L9H78kI4kwCPY201ut731OgecsV A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="454463572"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; d="scan'208";a="454463572"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 01:44:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="887316885"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; d="scan'208";a="887316885"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Nov 2023 01:44:30 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 10 Nov 2023 01:44:30 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 10 Nov 2023 01:44:30 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 10 Nov 2023 01:44:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MeV+VesZK0g7XejlQN9+ICHoRpG9pNzOiZ93zH+JYBQ2U+c6P5NUo0HLnsOcKxlSj2T8MOvPbJEfc78u8ReDx/XIKmOgVLmdJKHD6d4r7bKM6nm/6DJf631KMDRy4sxE6+cv5hvkVe0U9F0GMft4uoMMyWmcQ9bttNMM/yrlL4sDGWWJ3LiX/R45gUlvwAuvdBB8RpP8CCn/ZRagifSB8Gg9WBVhUb0X1La5dh9UhLhpeTd8mNus0fTKLCRV3Ut5d9JsSg9wSxeRe2TuDQ0rbnP1ADairuhpexbnUzyW3jPsRg9ykGc+FnjjoiL3AoS3gaOhuJY9/XdZSBP3Sy1U1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sQ+GR3FN98LglIQuEpmoa0XBA9orHnKvNx551LVamC4=;
 b=N0aCL0isAL78JY5XPTGahpTCzThyREE34Fgedz5ugZSSH+Og8D3qEihD916FgSm2gzhH1AmhsVaUxZQkZQlyxLq85eTDN+QHB/05uKX6MKWu+KyDVuFDJGYRx1vKUTEl39LKxMC2e/yDGkYM4gLBe07GEEIDlAvalViZ4+46acCv2HZ//yYnr1mk9B5qPCQ+dOI+uFTiR7HHD6Pqc0UhLA9pY3vXgaDSCbSMaZQjZcT4PI8HrrvGTBQiJg7NvqbYzmMqI3qNsR/9vDewZHDXt/Tw2lZ17cPeES8GotqmFBQAufAjdTcwW6mhEJkDp9DgirT7MDTYs3pqvp21gOsQUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by PH0PR11MB7712.namprd11.prod.outlook.com (2603:10b6:510:290::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Fri, 10 Nov
 2023 09:44:22 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::d35c:f42b:fdf7:36bb]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::d35c:f42b:fdf7:36bb%5]) with mapi id 15.20.6954.021; Fri, 10 Nov 2023
 09:44:22 +0000
From: "Manna, Animesh" <animesh.manna@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v9 1/6] drm/panelreplay: dpcd register definition for
 panelreplay
Thread-Topic: [PATCH v9 1/6] drm/panelreplay: dpcd register definition for
 panelreplay
Thread-Index: AQHaEhYrQzX4BsawRESdXoOd7QThy7Bx9zAAgAFYY9A=
Date: Fri, 10 Nov 2023 09:44:22 +0000
Message-ID: <BL1PR11MB5979B002FACFCB644D206D9FF9AEA@BL1PR11MB5979.namprd11.prod.outlook.com>
References: <20231108072303.3414118-1-animesh.manna@intel.com>
 <20231108072303.3414118-2-animesh.manna@intel.com> <87wmurvzw3.fsf@intel.com>
In-Reply-To: <87wmurvzw3.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5979:EE_|PH0PR11MB7712:EE_
x-ms-office365-filtering-correlation-id: d284dbb6-3513-40d0-267a-08dbe1d19e56
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QlyiCs9RhOwabnl1mxXvTnE7hsvOeXLWk2XFgHw+2nGrk0hTuoTxMdo7XFlaYQI4lVkO/c9KhQXwiVNYKTWmbHFlAH/XUubC6HT5bWsF1vOPrzQR6t9G8LJtV2hlVFm9GK9YDiSmc+NQe79qVwq7y7V2egpMrWPnwWPo0HODt5c5Krku+ouL8vP7eDbYfc/K5MfJxWZJrRdvPXmQ0MTH0hOzdFqiD1QNywFqwSHsAgqI6yiL97ooBgKM/OGcdqBZJWmggBGZ/13r3t/mVY+PQRCDVKav9aLx4LnuItNPLUa4y86WGFSH8J+bNFbFa1Nspttlu8tIf1GGxp+q+knTFfVyob8cQWbMlSj0SCq8Hhwm6Zm83ty0EcVZOo5MrZtsWcyI/CjbfbG/8OeWTqNpgFV8ioLXwaoQ3jt3EjW6paILKiP4b14IvV2Komk1RAgsOi9l+sU9VXip4C8JE3mi6ZTHUseB9SNBZ75SLgKjMyUwZMkVOLWviMfRGLQzxLqyPxcUNmEbrl9UuyQauucBNQxE/v9ayth8Qpla0eEWYgPrbF0rybJx5GzUoXBnCGgykChZgI4YeABwbJA+SZcSyoo1fnMUF+P6WyNY0iwyEu0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(366004)(346002)(39860400002)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(316002)(41300700001)(8936002)(2906002)(8676002)(4326008)(55016003)(38100700002)(5660300002)(53546011)(66556008)(966005)(450100002)(9686003)(33656002)(54906003)(66446008)(66476007)(64756008)(86362001)(52536014)(66946007)(83380400001)(38070700009)(76116006)(26005)(82960400001)(107886003)(122000001)(110136005)(7696005)(66574015)(6506007)(71200400001)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RmgxajRqMmFIanJOSlI4TjllRGxBdHlTOXhaNUs1SEQ5MEZmOTI4Y2wyajIz?=
 =?utf-8?B?MzQ5YkhROWFydUMybmhSV3BOekVOdnJoaU9rYkgxNjNtRTdxaXhXSUp6Smxq?=
 =?utf-8?B?c3hDSDdwcG1VbUo1cW1lTnNjOVI2ZGlpbndLNVlGSGVadmViVjdOaFdCVnFJ?=
 =?utf-8?B?VElUeDZTaC9kQjl1Mk9jR1RDdFRBQS80V1BLbTBqdy9xMVBDelMycCtqYVdx?=
 =?utf-8?B?NElWMGQ2V0VHYkZaa1hvQVU5WG5uMVNlK3RucThzR0gyeWNYN2NsVElGNGFp?=
 =?utf-8?B?WFVFOWtrMnNjVmVBZW9MUjBCNDVjeXVTbCtaZ3NhaldsNDdCT3VuL1BiTU85?=
 =?utf-8?B?QWwxS1BzWmo2K0ZuTWJMTzF4VllhVkhjbnl4YktORHZaK0YzVk9mVTZFZ1hT?=
 =?utf-8?B?UmdBS3pLRXJtUVJsYnBIN0lBbjdCUC9zKzJzVk5QdldZMkdvQkFLNXhmNE11?=
 =?utf-8?B?MFJLeTBjdDVLeSsrRzU0Q1ZEYWphaDlHbkltMzRpenVNVzlvd2hWYnBQTzlZ?=
 =?utf-8?B?NUN0bllrTXA4WlZLdGxYZ0oyRW9McVZ1d2NtNzIyUkVURC83L2MvNktmT25Q?=
 =?utf-8?B?cENVQUlVdFN3Z3JDSjNuZlhySFNSZFVEN1dtbkRoV1FRT1hVeGxaZ2w1UExs?=
 =?utf-8?B?RllONUxFaUVKVnZITGo4N2ZoL1ZRdWtObnVjSDBMWTZkdUMvbXV2WWVQZWFo?=
 =?utf-8?B?eU1FMWVtR1VQZThsVlhUL2o5RUJxazhwSnlEVkFISm4wdFIzRDRtdll2VVZS?=
 =?utf-8?B?eVlqcXhBbktoOG4wWGlKVCswbW5tQjZXQjdtem9qWVFqRjhEb2dzb3lvL2ZT?=
 =?utf-8?B?Tk1HUEU4SUdZQmRzaUhZdlF2ZS9MdDVsN3Nsd0s5aG1LUlM4ZGtaZXo3VzdM?=
 =?utf-8?B?SVBRLzVUVGhxQXdoZEs0UnNoOUlteEd3Z0VJbVlBUkxvYU9PL0kzTldyUnl2?=
 =?utf-8?B?MFBPZnFIdEVxWTc1SUpMWXJpM2h6YVNtM3htN25DTWt5REZWVnZyL3g1MUI2?=
 =?utf-8?B?dkVCb1E0N1RDbDkyTmVaMThyWDJobjRIbUo2ZUw2enFYUkFsb0pHeG50bENq?=
 =?utf-8?B?R1lyM2h2ME0yVXR0anVjN2xmWE5nVU8yRGtpcjhZb0ZBVlVpYllidDFUaG1z?=
 =?utf-8?B?d1JxR2FybUE0MzZpZXpla1JoTG1jYk80MjdGdThLa3IzLytGMFBaWGpoRmQv?=
 =?utf-8?B?YWllY1hZbjl2c0lvdE1TR0Y0RnlpZzB6ZDFaY3ZJYk5USmM1S3p0S0Y2S2Mx?=
 =?utf-8?B?OUZPVkF0aWR5SE1Tek1laFRUYXAya1ljYjd1bU5hTnFGdzNoMXBDYjZ5SXA2?=
 =?utf-8?B?TzZ6cTRHZTNLc2FNZmRPT2h4d2pZTlp3MXJGQitjSktRQWMxUUFwUEFiMzlx?=
 =?utf-8?B?Nm9tbzZrZDhrUkFMei8rVVZhWFNFRm1GODhRTGgwYzRDSHBiMVhualJxL3p4?=
 =?utf-8?B?b2dxZWNiS252bWladG5LcUFOYjcxNHlEM0lsU0Q3c29zbG5SWWluQkp2RkpS?=
 =?utf-8?B?b21HeUdSYzR1a1gzY0tGOG1ybTlhdHlMU3pMa0JnVVBHTnFCTnBGaGtkWVFn?=
 =?utf-8?B?MDJUbWJGaWpCWDlsV0MxSnEyaENSNW5CN0hzajN4NEFqN0drWFpMZVcvSWJz?=
 =?utf-8?B?U3ZEaFhOQ2NtUkZ2R2hRc1dIcERLU3ZoMHRJVG1VQThORU9WQUp0Nk9YNDMw?=
 =?utf-8?B?MGsrOFhDOEJkVHB5ZTlsOTJOemF1SGdkdi9KZ2Q3SUZrcHpBOG5iUnB0dmgw?=
 =?utf-8?B?ZVU1VkhnTDNOOWEyVWxMZDZZNUlYVnFKMmdQaVJDSlhRWDBVSmNkQVJpRkVP?=
 =?utf-8?B?bG9pNkF5T3R4bm5XYklJbWtLNTdQbDhFek1EdmpkRzh4aVpEQVhzYkRjbEVE?=
 =?utf-8?B?clUzNmRSY21QVkNtRzJVSzA0V1hZdFZNV0RWcFZRbzBVVlFYZ2RsRFg4eitG?=
 =?utf-8?B?djNVelNGYm5aVit0WEY4ZmdMYVNmZkZsT3dmdWcrb1hUR3VENDJEcVVBMjRR?=
 =?utf-8?B?WDhrVExpTmVwYTNLVmtkVEZtbUV1TU1ldHFFbzA4ZG1zbklmaFZiZlBmN0R1?=
 =?utf-8?B?RndPWFlpaHYrdy9RakhIcGlBbXRKWk9CZGVuc1pzRk9wb2IvOXNXNm9wL0py?=
 =?utf-8?Q?2tE9sCdmC9hUC+MfQ7stq7V5g?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d284dbb6-3513-40d0-267a-08dbe1d19e56
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2023 09:44:22.3735 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IJs+JbFcpQIsQUZ62wG7TxcEhnt0uVV4KladSZyFKrN/0w4M7eOzHp7NU8m8BoRN9quyQNTskz0bup64EzLAXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7712
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
Cc: "Hogander, Jouni" <jouni.hogander@intel.com>, "Murthy,
 Arun R" <arun.r.murthy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTmlrdWxhLCBKYW5pIDxq
YW5pLm5pa3VsYUBpbnRlbC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBOb3ZlbWJlciA5LCAyMDIz
IDY6MzcgUE0NCj4gVG86IE1hbm5hLCBBbmltZXNoIDxhbmltZXNoLm1hbm5hQGludGVsLmNvbT47
IGludGVsLQ0KPiBnZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnDQo+IENjOiBNYW5uYSwgQW5pbWVzaCA8YW5pbWVzaC5tYW5uYUBpbnRlbC5j
b20+OyBIb2dhbmRlciwgSm91bmkNCj4gPGpvdW5pLmhvZ2FuZGVyQGludGVsLmNvbT47IE11cnRo
eSwgQXJ1biBSIDxhcnVuLnIubXVydGh5QGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2OSAxLzZdIGRybS9wYW5lbHJlcGxheTogZHBjZCByZWdpc3RlciBkZWZpbml0aW9uIGZvcg0K
PiBwYW5lbHJlcGxheQ0KPiANCj4gT24gV2VkLCAwOCBOb3YgMjAyMywgQW5pbWVzaCBNYW5uYSA8
YW5pbWVzaC5tYW5uYUBpbnRlbC5jb20+IHdyb3RlOg0KPiA+IEFkZCBEUENEIHJlZ2lzdGVyIGRl
ZmluaXRpb24gZm9yIGRpc2NvdmVyaW5nLCBlbmFibGluZyBhbmQgY2hlY2tpbmcNCj4gPiBzdGF0
dXMgb2YgcGFuZWwgcmVwbGF5IG9mIHRoZSBzaW5rLg0KPiA+DQo+ID4gQ2M6IEpvdW5pIEjDtmdh
bmRlciA8am91bmkuaG9nYW5kZXJAaW50ZWwuY29tPg0KPiA+IENjOiBBcnVuIFIgTXVydGh5IDxh
cnVuLnIubXVydGh5QGludGVsLmNvbT4NCj4gPiBDYzogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxh
QGludGVsLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogQXJ1biBSIE11cnRoeSA8YXJ1bi5yLm11cnRo
eUBpbnRlbC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogQW5pbWVzaCBNYW5uYSA8YW5pbWVzaC5t
YW5uYUBpbnRlbC5jb20+DQo+IA0KPiBZb3UgZ290IHRoZSBhY2ssIHBsZWFzZSBrZWVwIHRyYWNr
IG9mIGl0Lg0KPiANCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci9lbGNlYnlneHM0MzJiY2o3
b2V6N25kbGZ2YjNscnU3bTd5em55cXAyZWk0b2Nqaw0KPiB2eHBAMjNsZjJyaDQ1Zm10DQoNClRo
YW5rcyBKYW5pIGFuZCBldmVyeW9uZSB3aG8gaGVscGVkIGluIHJldmlldy4NClB1c2hlZCB0aGUg
aW5pdGlhbCA1IHBhdGNoZXMgb2YgdGhpcyBzZXJpZXMuIEFzIDZ0aCBwYXRjaCBoYXMgZGVwZW5k
ZW5jeSBvbiBpZ3QgY2hhbmdlcywgd2lsbCBwdXNoIGFmdGVyIGlndCBjaGFuZ2VzIGdldCBtZXJn
ZWQuDQoNClJlZ2FyZHMsDQpBbmltZXNoIA0KPiANCj4gPiAtLS0NCj4gPiAgaW5jbHVkZS9kcm0v
ZGlzcGxheS9kcm1fZHAuaCB8IDIzICsrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIDEgZmls
ZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9kcm0vZGlzcGxheS9kcm1fZHAuaA0KPiA+IGIvaW5jbHVkZS9kcm0vZGlzcGxheS9kcm1fZHAu
aCBpbmRleCBlNjljZWNlNDA0YjMuLmZjNDJiNjIyZWYzMg0KPiAxMDA2NDQNCj4gPiAtLS0gYS9p
bmNsdWRlL2RybS9kaXNwbGF5L2RybV9kcC5oDQo+ID4gKysrIGIvaW5jbHVkZS9kcm0vZGlzcGxh
eS9kcm1fZHAuaA0KPiA+IEBAIC01NDMsNiArNTQzLDEwIEBADQo+ID4gIC8qIERGUCBDYXBhYmls
aXR5IEV4dGVuc2lvbiAqLw0KPiA+ICAjZGVmaW5lIERQX0RGUF9DQVBBQklMSVRZX0VYVEVOU0lP
Tl9TVVBQT1JUCTB4MGEzCS8qIDIuMCAqLw0KPiA+DQo+ID4gKyNkZWZpbmUgRFBfUEFORUxfUkVQ
TEFZX0NBUCAgICAgICAgICAgICAgICAgMHgwYjAgIC8qIERQIDIuMCAqLw0KPiA+ICsjIGRlZmlu
ZSBEUF9QQU5FTF9SRVBMQVlfU1VQUE9SVCAgICAgICAgICAgICgxIDw8IDApDQo+ID4gKyMgZGVm
aW5lIERQX1BBTkVMX1JFUExBWV9TVV9TVVBQT1JUICAgICAgICAgKDEgPDwgMSkNCj4gPiArDQo+
ID4gIC8qIExpbmsgQ29uZmlndXJhdGlvbiAqLw0KPiA+ICAjZGVmaW5lCURQX0xJTktfQldfU0VU
CQkgICAgICAgICAgICAweDEwMA0KPiA+ICAjIGRlZmluZSBEUF9MSU5LX1JBVEVfVEFCTEUJCSAg
ICAweDAwICAgIC8qIGVEUCAxLjQgKi8NCj4gPiBAQCAtNzE2LDYgKzcyMCwxMyBAQA0KPiA+ICAj
ZGVmaW5lIERQX0JSQU5DSF9ERVZJQ0VfQ1RSTAkJICAgIDB4MWExDQo+ID4gICMgZGVmaW5lIERQ
X0JSQU5DSF9ERVZJQ0VfSVJRX0hQRAkgICAgKDEgPDwgMCkNCj4gPg0KPiA+ICsjZGVmaW5lIFBB
TkVMX1JFUExBWV9DT05GSUcgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDB4MWIwICAvKiBE
UCAyLjAgKi8NCj4gPiArIyBkZWZpbmUgRFBfUEFORUxfUkVQTEFZX0VOQUJMRSAgICAgICAgICAg
ICAgICAgICAgICAgICAoMSA8PCAwKQ0KPiA+ICsjIGRlZmluZSBEUF9QQU5FTF9SRVBMQVlfVU5S
RUNPVkVSQUJMRV9FUlJPUl9FTiAgICAgICAgICgxIDw8IDMpDQo+ID4gKyMgZGVmaW5lIERQX1BB
TkVMX1JFUExBWV9SRkJfU1RPUkFHRV9FUlJPUl9FTiAgICAgICAgICAgKDEgPDwgNCkNCj4gPiAr
IyBkZWZpbmUgRFBfUEFORUxfUkVQTEFZX0FDVElWRV9GUkFNRV9DUkNfRVJST1JfRU4gICAgICAo
MSA8PCA1KQ0KPiA+ICsjIGRlZmluZSBEUF9QQU5FTF9SRVBMQVlfU1VfRU5BQkxFICAgICAgICAg
ICAgICAgICAgICAgICgxIDw8IDYpDQo+ID4gKw0KPiA+ICAjZGVmaW5lIERQX1BBWUxPQURfQUxM
T0NBVEVfU0VUCQkgICAgMHgxYzANCj4gPiAgI2RlZmluZSBEUF9QQVlMT0FEX0FMTE9DQVRFX1NU
QVJUX1RJTUVfU0xPVCAweDFjMSAgI2RlZmluZQ0KPiA+IERQX1BBWUxPQURfQUxMT0NBVEVfVElN
RV9TTE9UX0NPVU5UIDB4MWMyIEBAIC0xMTA1LDYgKzExMTYsMTgNCj4gQEANCj4gPiAgI2RlZmlu
ZSBEUF9MQU5FX0FMSUdOX1NUQVRVU19VUERBVEVEX0VTSSAgICAgICAweDIwMGUgLyogc3RhdHVz
IHNhbWUNCj4gYXMgMHgyMDQgKi8NCj4gPiAgI2RlZmluZSBEUF9TSU5LX1NUQVRVU19FU0kgICAg
ICAgICAgICAgICAgICAgICAweDIwMGYgLyogc3RhdHVzIHNhbWUgYXMgMHgyMDUgKi8NCj4gPg0K
PiA+ICsjZGVmaW5lIERQX1BBTkVMX1JFUExBWV9FUlJPUl9TVEFUVVMgICAgICAgICAgICAgICAg
ICAgMHgyMDIwICAvKiBEUCAyLjEqLw0KPiA+ICsjIGRlZmluZSBEUF9QQU5FTF9SRVBMQVlfTElO
S19DUkNfRVJST1IgICAgICAgICAgICAgICAgKDEgPDwgMCkNCj4gPiArIyBkZWZpbmUgRFBfUEFO
RUxfUkVQTEFZX1JGQl9TVE9SQUdFX0VSUk9SICAgICAgICAgICAgICgxIDw8IDEpDQo+ID4gKyMg
ZGVmaW5lIERQX1BBTkVMX1JFUExBWV9WU0NfU0RQX1VOQ09SUkVDVEFCTEVfRVJST1IgICAoMSA8
PCAyKQ0KPiA+ICsNCj4gPiArI2RlZmluZSBEUF9TSU5LX0RFVklDRV9QUl9BTkRfRlJBTUVfTE9D
S19TVEFUVVMgICAgICAgIDB4MjAyMiAgLyoNCj4gRFAgMi4xICovDQo+ID4gKyMgZGVmaW5lIERQ
X1NJTktfREVWSUNFX1BBTkVMX1JFUExBWV9TVEFUVVNfTUFTSyAgICAgICAoNyA8PCAwKQ0KPiA+
ICsjIGRlZmluZSBEUF9TSU5LX0ZSQU1FX0xPQ0tFRF9TSElGVCAgICAgICAgICAgICAgICAgICAg
Mw0KPiA+ICsjIGRlZmluZSBEUF9TSU5LX0ZSQU1FX0xPQ0tFRF9NQVNLICAgICAgICAgICAgICAg
ICAgICAgKDMgPDwgMykNCj4gPiArIyBkZWZpbmUgRFBfU0lOS19GUkFNRV9MT0NLRURfU1RBVFVT
X1ZBTElEX1NISUZUICAgICAgIDUNCj4gPiArIyBkZWZpbmUgRFBfU0lOS19GUkFNRV9MT0NLRURf
U1RBVFVTX1ZBTElEX01BU0sgICAgICAgICgxIDw8IDUpDQo+ID4gKw0KPiA+ICAvKiBFeHRlbmRl
ZCBSZWNlaXZlciBDYXBhYmlsaXR5OiBTZWUgRFBfRFBDRF9SRVYgZm9yIGRlZmluaXRpb25zICov
DQo+ID4gICNkZWZpbmUgRFBfRFAxM19EUENEX1JFViAgICAgICAgICAgICAgICAgICAgMHgyMjAw
DQo+IA0KPiAtLQ0KPiBKYW5pIE5pa3VsYSwgSW50ZWwNCg==
