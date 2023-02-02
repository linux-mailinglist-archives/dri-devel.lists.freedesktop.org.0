Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18020687334
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 02:55:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13E7D10E1C1;
	Thu,  2 Feb 2023 01:55:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E231710E1BD;
 Thu,  2 Feb 2023 01:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675302911; x=1706838911;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=R8cWLUSF/h38UGyDLrhIv+1XvRe1l1oRDPeAYMo3UHs=;
 b=cNo7Gg5jinc/cQJYhoWq6++lQGmYhOmkBpOcwwMt/ybZDAxWxjKGhLfj
 sRvb0wxNXetMxyrHbdOkp7G6N6vX5saLHSC1DrHAZrljQ4wC/Gnm5qvgk
 BFi1YzRoE/2Y7DfggRI1e87foobDytYeIn9v75IBq78+niRf/lW8DOg9p
 48LyKR64H+7QZe56lyxBIZGtxe2Nu0aX8IonLwBw3SzF4qFyEHgBtsYRJ
 u4CcAVsx74PvO5zhCuX+m4K1OTSB9aR5KC6MmqcVAsA84vd2TGD+nLdCB
 DtilmufrEXWx7CeAAQMe8hQDm8Trc+IaDQPVKB9pqCNThXLiYdwrtCXDx Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="392906771"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; d="scan'208";a="392906771"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2023 17:54:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="728652657"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; d="scan'208";a="728652657"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga008.fm.intel.com with ESMTP; 01 Feb 2023 17:54:58 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 1 Feb 2023 17:54:57 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 1 Feb 2023 17:54:57 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 1 Feb 2023 17:54:57 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 1 Feb 2023 17:54:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SOJ7upl9W7HMgD87J/EXJRWQOOUCLUflJmquqA3eFr8tg+am6c/ysGBfpmUjW/KkFiHo0yDHntXzsjAV3TdRAyTZ2FOQa+c24bd+T2m/bXytwiAOVrk3YjfOobeKvE3kzYMxfOajvZ63QT36dUksfOXk2P6lah6iqh6vAVgTrnbdydR9ow6Y4o0JKeLbjOf0MBa12smmEJ0Frc6tBuRn0onihbjDU0bU8h8i3WLLFCnMfCq5cE2SRDanh9UDt36xeWI78FkF166hTJ1Fr6njcMnixd2moScXH7o1pBRJdyVbhoC+UVVVLmpBuKuVbsAZtlecsIyO2bV2YUYYiw4nxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R8cWLUSF/h38UGyDLrhIv+1XvRe1l1oRDPeAYMo3UHs=;
 b=RUA0oxcjMGZB9IqifMO3BVF7eWEPAkIkv/JQDRDm7YPTs8bv++e7RJaA2jg4PCuuJK3HVnm0ZZolfOczv11JPpEYAIEgnMBaomWbAxd+vmfBLxtBBYLDQRBtZ3dAKmyWBpn3mZSdrbNHsyxTG5YTHmcbz4qAkqf5imgzl6h+71YVQCSR5I43D3IG8KALELPXitawppiMyHlAvxYorlziSjM8gMThOGP4HwjskBf62MEND/t8KoMWGyBozKGx9zIPAN43twgllEAfUTCl1x/RpvMcJ+omRYRN1T8yqqEvmniqaQ2A2HVVPbISiBH9WX/h8Eqj3U0gLexSfN21o8TAEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CO6PR11MB5620.namprd11.prod.outlook.com (2603:10b6:303:13e::17)
 by BN9PR11MB5370.namprd11.prod.outlook.com (2603:10b6:408:11b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.25; Thu, 2 Feb
 2023 01:54:53 +0000
Received: from CO6PR11MB5620.namprd11.prod.outlook.com
 ([fe80::a426:d80:95b1:7365]) by CO6PR11MB5620.namprd11.prod.outlook.com
 ([fe80::a426:d80:95b1:7365%7]) with mapi id 15.20.6064.022; Thu, 2 Feb 2023
 01:54:53 +0000
From: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v10 00/23] drm/i915/vm_bind: Add VM_BIND functionality
Thread-Topic: [PATCH v10 00/23] drm/i915/vm_bind: Add VM_BIND functionality
Thread-Index: AQHZKwzNUHz9z/BtIUSS9JuSYAnbpa66/JQA
Date: Thu, 2 Feb 2023 01:54:53 +0000
Message-ID: <2b1ec972fbf57f63bb900320cec7e774f5f27ea7.camel@intel.com>
References: <20230118071609.17572-1-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20230118071609.17572-1-niranjana.vishwanathapura@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.3-1+deb11u1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5620:EE_|BN9PR11MB5370:EE_
x-ms-office365-filtering-correlation-id: d5e431c9-7699-49e0-2150-08db04c07a64
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2KmxxjsD8c/YwHJtaj87Qrf7QbGp+VbNJIMbQ9/uL/wuLeSTNOZaS8Zy9fPUyhBZdpDOVJ/pff0jDN0mFfh0CfeSNTOTAsM3/4kScvdhNdKIcXz52+GbQT4hNmUTdYPh4JufxGnaPL+KMz1EG+u7hKZzCmFpfMbJjcot8awlpmaBu9dVEsv46hoSMDWMG3SXuOYca6uaNMrVqqL7sd81TZfy78NchK9oueMQaY3wWRXajzXSqodQpRHNZdAFk7UmuZK/TOQOy6nPoVy58QxPWxLnQtyMrrC6aEDrCCBZYmJRVuWfu2CJYjFuvt5do4QWw+r5nmZi3cYYjtg/swuoUB0p6W06g3MAHiHu0/6mjPJZTeGReoIzkTB6WeTkefMpgvckOVEsQMf1CVD5mglBHsn4cgMFEEFunutPMG/7prQzy+VI3B/hMAGEplz2US5b7HHv9OvzX/e3ggncNJIlR/cmisSNODu/HC2KmXvW01m3aKyXiarLEAt8S54QXMH53hypu3djN6rp3fiHQEhPczMXay+9lYX+8jA7qf/+S/ngcCnV2y9NVXHHwypuqSwHyfHzXadc7FED2zdAHDTRVAH59sdAyo/YKDB65iFHJ62+ZTfe0YXhIw/hBWZDg62GrDSJTer/iz8zTlsrE/Ho2A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5620.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(396003)(346002)(39860400002)(136003)(376002)(451199018)(8936002)(2616005)(110136005)(54906003)(316002)(5660300002)(71200400001)(4326008)(2906002)(41300700001)(8676002)(66476007)(6486002)(6512007)(64756008)(478600001)(66946007)(6506007)(186003)(66556008)(966005)(83380400001)(66446008)(91956017)(38100700002)(122000001)(38070700005)(76116006)(86362001)(36756003)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eGhQMnI2VlgwWWp6TUJ4Vm9lQXVDUnh6ak9OMWlMbVlETC9mRy9BM3RLajgv?=
 =?utf-8?B?VjhHcjVQTkJBVWw5RUVvS2ZORVArdHJzZ1RNbDVUb0FUVVlsK200eHpjY01x?=
 =?utf-8?B?STUxR0lockxyenFiYVppMW44S0t0TVN6NHljMUl6bGR3cWF6Tm43VUlVbWR6?=
 =?utf-8?B?WjBiSE41MzNwZWhqbTBISER6VFRvSDM1Zm9uaUU5amxTVVM4dVQ1ZG0zdDc0?=
 =?utf-8?B?NXlwcTBDWnBuOEo0SEpkMkhTWm1MalQ5L3lvbTZ6M0VncURIcHBybS9WdHFx?=
 =?utf-8?B?YmFRcjlPQm5rY3VHZUM4QjJ5VlpqcnJWMlN1dnc2WTRzTm5iK0FKUUlsWXBQ?=
 =?utf-8?B?dHBhVFk4OE9mUFZ6SnhDaHl1YmJkN2VKNE41K3VnS2FBN3NlK0o1VmN0aFpq?=
 =?utf-8?B?SXRIVkpKY0U1Zy9vMTJkRld4akIxREgzMUh3QWhyU2dOZlh4anloV0d6YUZS?=
 =?utf-8?B?QnRWRTZDU3ptVmkralhQaU1UQUx2SU40aVBDYWdQcElTNzFLMW1FMm5jMHM3?=
 =?utf-8?B?Y2t4cFBNc2NUSkJkSjZKWVVOZTZJdVRpN3N3TmFvSGR0LzZkanUwUDlZKzUr?=
 =?utf-8?B?S0JvR3I5ZDdQSnhzVHNEWUV5SldKY0NUZy96cHN5RVVaK1pxdEhWVTJTQlJM?=
 =?utf-8?B?d0tNMy9jYThWdXZHeXFGaWVhZXJzQnc0ZzJPOG5IYSt5Mm1HaExOM3BpeFhS?=
 =?utf-8?B?V3ArVFNraEJmU0VVT3JMYXgrY0xyV21FaUNFVkd1QytNdlZDWngxeXBjLzFM?=
 =?utf-8?B?NXBhSWpZYUZiZldzQjB1QzB6ODg2NGtmZFJ4NlcvQ1YrSXZFTGNXVUN3bkl0?=
 =?utf-8?B?MGNLS0xTMnJpbGNTNmNYQjRWa0NWcy8zUVRnZWp2NzNQUDRaRzFnL3hJTUV4?=
 =?utf-8?B?ZzZKZ0cvcjd3U2ZSM2E0QUtmNU1OTHJYZC80WGdBY3RjejEyNHlGa0d6UUxO?=
 =?utf-8?B?YzVPazRYdUhVTFo1KzF5ZEU3bkNTd2VBRkt3MjA1b1huaDcxSDNVWlRSdHlZ?=
 =?utf-8?B?SmFZYTZsS1hhZCs5Z05jTVY5Wk4ySHhMR016YkEwUmhSd0wwVFBjbVh5L2Ir?=
 =?utf-8?B?cWcyMkdSdFE1R2piaVl6MDlPdnhGYVNuZXV4cmRZY3lXU0NYNi9TUlVpc0or?=
 =?utf-8?B?akpKVVkzUXI0Tnpvdy9Pa1QwSWt1dUwrZTVuRzdGbmRleThSd0wzdFkxcnRM?=
 =?utf-8?B?SmVqQmV2eWRCWXhCeVd2Ti9aeHVoU2RJK1ZPNmpiSmZBSDNGNXhuQ3JWejdS?=
 =?utf-8?B?S1FJMnovOVRTaGwxaWMyU2pkRTJYL1JOVHZteUVFS0RZdGtMcGFDZ1FxbzJv?=
 =?utf-8?B?dEFxTHVqV3BxRHZNaXZWd05Ga2NHc1ROREEvbmF2ZUZWT01DTDdjbUxtRllE?=
 =?utf-8?B?dHV3aDJOeDAzazJOL3V1YzYxYzRRZVFqbFhidEhCdmR6UnZ4OTFSRFV6RnRa?=
 =?utf-8?B?b2srYXVDK2RYTEVXU2EwUHJLOUlhQU5CNE56d0Y3MTlBRHJDQWNFS0xxdmYy?=
 =?utf-8?B?R0RBVjd6ZStESnlidXMrbEVVQ0hXWVVKbzVOUCtZYkg2Y3hGUUI0Wk5xSFMw?=
 =?utf-8?B?bVA1WTg0UEpBL1Q2Y3J5dGFTbnlnTDBJcUxMdGd2MXlIZkQvcGU5SUk2NlEr?=
 =?utf-8?B?amordXRUclljTDJtZGovaTRTSUQ5ZkpscE1pdHBsRTNPM2R0Yy94ODZnZUZh?=
 =?utf-8?B?a3c4aGE0ZHRCZmZqSUdRdSt2TDFqR0VadWJhSjg0L0tXQ2ttSjlhdWt6VVpr?=
 =?utf-8?B?ak92LzBnclRiTVJuTlp3N3lzOFZOZW5rNkE0YTUzR3dTT3VibnloSGM2NmRV?=
 =?utf-8?B?a1E0WGdibzcyYTh2bU9nQUc0dTJrenZwNTJaYjdKdnZHVnNad21pREt0dHh2?=
 =?utf-8?B?OS9KODJKZ1EvWmdGdUhWSS9wdU1SazkyOGgwdHkvTVFEMVRJMmVkSU4rTkJG?=
 =?utf-8?B?K2FBZ2tUd3J1UTZpMXdtbWE0YWthUHJhUEZubDdNc2hmOHd0N3FvaHpKclBW?=
 =?utf-8?B?SnUxTE94SkVTZ2JCMzFmQ2xBOEFSb0dBQUl4dWtDRHhyWkZNM0dJaXMrbmg2?=
 =?utf-8?B?SUJ6Z1IxSDB0Qit6Yk1LSC9JbDdTOHBWSitDS1QwbXczbWVXZTlKRktRcXgw?=
 =?utf-8?B?dG5EMXQ3b2YvOVBSaCt0MXI2dVNHejd5bG5pT252SW1aMzl0aWMxYzNsVXhp?=
 =?utf-8?B?bFgvYnRsOTF5ak5VSllyWnp1Y1RsSDhYbXZsaG5QS2NhL1F0bXBJRUhpVEJ5?=
 =?utf-8?B?WFIyYlc1Vk9JZmcxaVRGTzdiSzFRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <879C46F684422F4880B24CF1EDE169B8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5620.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5e431c9-7699-49e0-2150-08db04c07a64
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2023 01:54:53.6515 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FaCM/HtdbJONWApDamx62Fwe4JNJR9bQ8L2NDkGzpWjtOp+bGSDXOZ56o5iz+w2SA8/k4LyFnThGCgAlpWAr97FWuCgFfNR0fFUZCH0RKOY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5370
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

T24gVHVlLCAyMDIzLTAxLTE3IGF0IDIzOjE1IC0wODAwLCBOaXJhbmphbmEgVmlzaHdhbmF0aGFw
dXJhIHdyb3RlOg0KPiBEUk1fSTkxNV9HRU1fVk1fQklORC9VTkJJTkQgaW9jdGxzIGFsbG93cyBV
TUQgdG8gYmluZC91bmJpbmQgR0VNDQo+IGJ1ZmZlciBvYmplY3RzIChCT3MpIG9yIHNlY3Rpb25z
IG9mIGEgQk9zIGF0IHNwZWNpZmllZCBHUFUgdmlydHVhbA0KPiBhZGRyZXNzZXMgb24gYSBzcGVj
aWZpZWQgYWRkcmVzcyBzcGFjZSAoVk0pLiBNdWx0aXBsZSBtYXBwaW5ncyBjYW4gbWFwDQo+IHRv
IHRoZSBzYW1lIHBoeXNpY2FsIHBhZ2VzIG9mIGFuIG9iamVjdCAoYWxpYXNpbmcpLiBUaGVzZSBt
YXBwaW5ncyAoYWxzbw0KPiByZWZlcnJlZCB0byBhcyBwZXJzaXN0ZW50IG1hcHBpbmdzKSB3aWxs
IGJlIHBlcnNpc3RlbnQgYWNyb3NzIG11bHRpcGxlDQo+IEdQVSBzdWJtaXNzaW9ucyAoZXhlY2J1
ZiBjYWxscykgaXNzdWVkIGJ5IHRoZSBVTUQsIHdpdGhvdXQgdXNlciBoYXZpbmcNCj4gdG8gcHJv
dmlkZSBhIGxpc3Qgb2YgYWxsIHJlcXVpcmVkIG1hcHBpbmdzIGR1cmluZyBlYWNoIHN1Ym1pc3Np
b24gKGFzDQo+IHJlcXVpcmVkIGJ5IG9sZGVyIGV4ZWNidWYgbW9kZSkuDQo+IA0KPiBUaGlzIHBh
dGNoIHNlcmllcyBzdXBwb3J0IFZNX0JJTkQgdmVyc2lvbiAxLCBhcyBkZXNjcmliZWQgYnkgdGhl
IHBhcmFtDQo+IEk5MTVfUEFSQU1fVk1fQklORF9WRVJTSU9OLg0KPiANCj4gQWRkIG5ldyBleGVj
YnVmMyBpb2N0bCAoSTkxNV9HRU1fRVhFQ0JVRkZFUjMpIHdoaWNoIG9ubHkgd29ya3MgaW4NCj4g
dm1fYmluZCBtb2RlLiBUaGUgdm1fYmluZCBtb2RlIG9ubHkgd29ya3Mgd2l0aCB0aGlzIG5ldyBl
eGVjYnVmMyBpb2N0bC4NCj4gVGhlIG5ldyBleGVjYnVmMyBpb2N0bCB3aWxsIG5vdCBoYXZlIGFu
eSBleGVjbGlzdCBzdXBwb3J0IGFuZCBhbGwgdGhlDQo+IGxlZ2FjeSBzdXBwb3J0IGxpa2UgcmVs
b2NhdGlvbnMgZXRjLiwgYXJlIHJlbW92ZWQuDQo+IA0KPiBOT1RFczoNCj4gKiBJdCBpcyBiYXNl
ZCBvbiBiZWxvdyBWTV9CSU5EIGRlc2lnbit1YXBpIHJmYy4NCj4gwqDCoERvY3VtZW50YXRpb24v
Z3B1L3JmYy9pOTE1X3ZtX2JpbmQucnN0DQo+IA0KPiAqIFRoZSBJR1QgUkZDIHNlcmllcyBpcyBw
b3N0ZWQgYXMsDQo+IMKgwqBbUEFUQ0ggaS1nLXQgdjEwIDAvMTldIHZtX2JpbmQ6IEFkZCBWTV9C
SU5EIHZhbGlkYXRpb24gc3VwcG9ydA0KDQpGWUksIEkgY3JlYXRlZCBhIERyYWZ0IE1SIGZvciB0
aGUgTWVzYSBpbXBsZW1lbnRhdGlvbjoNCg0KaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3Jn
L21lc2EvbWVzYS8tL21lcmdlX3JlcXVlc3RzLzIxMDU3DQoNCkEgRHJhZnQgTVIgc2hvdWxkIGJl
IGVhc2llciB0byB0cmFjayB0aGFuIHNpbXBseSBhIGJyYW5jaCBvbiBhIHBlcnNvbmFsDQp0cmVl
LiBGZWVsIGZyZWUgdG8gcHV0IHRoaXMgbGluayBpbiB0aGUgbmV4dCBjb3ZlciBsZXR0ZXJzIGZv
ciB2MTEgYW5kDQphYm92ZS4NCg0KPiANCj4gdjI6IEFkZHJlc3MgdmFyaW91cyByZXZpZXcgY29t
bWVudHMNCj4gdjM6IEFkZHJlc3MgcmV2aWV3IGNvbW1lbnRzIGFuZCBvdGhlciBmaXhlcw0KPiB2
NDogUmVtb3ZlIHZtX3VuYmluZCBvdXQgZmVuY2UgdWFwaSB3aGljaCBpcyBub3Qgc3VwcG9ydGVk
IHlldCwNCj4gwqDCoMKgwqByZXBsYWNlIHZtLT52bV9iaW5kX21vZGUgY2hlY2sgd2l0aCBpOTE1
X2dlbV92bV9pc192bV9iaW5kX21vZGUoKQ0KPiB2NTogUmVuZGVyIGtlcm5lbC1kb2MsIHVzZSBQ
SU5fTk9FVklDVCwgbGltaXQgdm1fYmluZCBzdXBwb3J0IHRvDQo+IMKgwqDCoMKgbm9uLXJlY292
ZXJhYmxlIGZhdWx0cw0KPiB2NjogUmViYXNlZCwgbWlub3IgZml4ZXMsIGFkZCByZXNlcnZlZCBm
aWVsZHMgdG8gZHJtX2k5MTVfZ2VtX3ZtX2JpbmQsDQo+IMKgwqDCoMKgYWRkIG5ldyBwYXRjaCBm
b3IgYXN5bmMgdm1fdW5iaW5kIHN1cHBvcnQNCj4gdjc6IFJlYmFzZWQsIG1pbm9yIGNsZWFudXBz
IGFzIHBlciByZXZpZXcgZmVlZGJhY2sNCj4gdjg6IFJlYmFzZWQsIGFkZCBjYXB0dXJlIHN1cHBv
cnQNCj4gdjk6IEFkZHJlc3MgY2FwdHVyZSBzdXBwb3J0IGZlZWRiYWNrIGZyb20gdjgNCj4gdjEw
OiBQcm9wZXJseSBoYW5kbGUgdm1hLT5yZXNvdXJjZSBmb3IgbWFwcGluZ3Mgd2l0aCBjYXB0dXJl
IHJlcXVlc3QNCj4gDQo+IFRlc3Qtd2l0aDogMjAyMzAxMTgwNzEzNTAuMTc0OTgtMS1uaXJhbmph
bmEudmlzaHdhbmF0aGFwdXJhQGludGVsLmNvbQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogTmlyYW5q
YW5hIFZpc2h3YW5hdGhhcHVyYSA8bmlyYW5qYW5hLnZpc2h3YW5hdGhhcHVyYUBpbnRlbC5jb20+
DQo+IA0KPiBOaXJhbmphbmEgVmlzaHdhbmF0aGFwdXJhICgyMyk6DQo+IMKgwqBkcm0vaTkxNS92
bV9iaW5kOiBFeHBvc2Ugdm0gbG9va3VwIGZ1bmN0aW9uDQo+IMKgwqBkcm0vaTkxNS92bV9iaW5k
OiBBZGQgX19pOTE1X3N3X2ZlbmNlX2F3YWl0X3Jlc2VydmF0aW9uKCkNCj4gwqDCoGRybS9pOTE1
L3ZtX2JpbmQ6IEV4cG9zZSBpOTE1X2dlbV9vYmplY3RfbWF4X3BhZ2Vfc2l6ZSgpDQo+IMKgwqBk
cm0vaTkxNS92bV9iaW5kOiBTdXBwb3J0IHBhcnRpYWxseSBtYXBwZWQgdm1hIHJlc291cmNlDQo+
IMKgwqBkcm0vaTkxNS92bV9iaW5kOiBBZGQgc3VwcG9ydCB0byBjcmVhdGUgcGVyc2lzdGVudCB2
bWENCj4gwqDCoGRybS9pOTE1L3ZtX2JpbmQ6IEltcGxlbWVudCBiaW5kIGFuZCB1bmJpbmQgb2Yg
b2JqZWN0DQo+IMKgwqBkcm0vaTkxNS92bV9iaW5kOiBTdXBwb3J0IGZvciBWTSBwcml2YXRlIEJP
cw0KPiDCoMKgZHJtL2k5MTUvdm1fYmluZDogQWRkIHN1cHBvcnQgdG8gaGFuZGxlIG9iamVjdCBl
dmljdGlvbnMNCj4gwqDCoGRybS9pOTE1L3ZtX2JpbmQ6IFN1cHBvcnQgcGVyc2lzdGVudCB2bWEg
YWN0aXZlbmVzcyB0cmFja2luZw0KPiDCoMKgZHJtL2k5MTUvdm1fYmluZDogQWRkIG91dCBmZW5j
ZSBzdXBwb3J0DQo+IMKgwqBkcm0vaTkxNS92bV9iaW5kOiBBYnN0cmFjdCBvdXQgY29tbW9uIGV4
ZWNidWYgZnVuY3Rpb25zDQo+IMKgwqBkcm0vaTkxNS92bV9iaW5kOiBVc2UgY29tbW9uIGV4ZWNi
dWYgZnVuY3Rpb25zIGluIGV4ZWNidWYgcGF0aA0KPiDCoMKgZHJtL2k5MTUvdm1fYmluZDogSW1w
bGVtZW50IEk5MTVfR0VNX0VYRUNCVUZGRVIzIGlvY3RsDQo+IMKgwqBkcm0vaTkxNS92bV9iaW5k
OiBVcGRhdGUgaTkxNV92bWFfdmVyaWZ5X2JpbmRfY29tcGxldGUoKQ0KPiDCoMKgZHJtL2k5MTUv
dm1fYmluZDogRXhwb3NlIGk5MTVfcmVxdWVzdF9hd2FpdF9iaW5kKCkNCj4gwqDCoGRybS9pOTE1
L3ZtX2JpbmQ6IEhhbmRsZSBwZXJzaXN0ZW50IHZtYXMgaW4gZXhlY2J1ZjMNCj4gwqDCoGRybS9p
OTE1L3ZtX2JpbmQ6IHVzZXJwdHIgZG1hLXJlc3YgY2hhbmdlcw0KPiDCoMKgZHJtL2k5MTUvdm1f
YmluZDogTGltaXQgdm1fYmluZCBtb2RlIHRvIG5vbi1yZWNvdmVyYWJsZSBjb250ZXh0cw0KPiDC
oMKgZHJtL2k5MTUvdm1fYmluZDogQWRkIHVhcGkgZm9yIHVzZXIgdG8gZW5hYmxlIHZtX2JpbmRf
bW9kZQ0KPiDCoMKgZHJtL2k5MTUvdm1fYmluZDogUmVuZGVyIFZNX0JJTkQgZG9jdW1lbnRhdGlv
bg0KPiDCoMKgZHJtL2k5MTUvdm1fYmluZDogQXN5bmMgdm1fdW5iaW5kIHN1cHBvcnQNCj4gwqDC
oGRybS9pOTE1L3ZtX2JpbmQ6IFByb3Blcmx5IGJ1aWxkIHBlcnNpc3RlbnQgbWFwIHNnIHRhYmxl
DQo+IMKgwqBkcm0vaTkxNS92bV9iaW5kOiBTdXBwb3J0IGNhcHR1cmUgb2YgcGVyc2lzdGVudCBt
YXBwaW5ncw0KPiANCj4gwqBEb2N1bWVudGF0aW9uL2dwdS9pOTE1LnJzdCAgICAgICAgICAgICAg
ICAgICAgfCAgNzggKy0NCj4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9NYWtlZmlsZSAgICAgICAg
ICAgICAgICAgfCAgIDMgKw0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9j
b250ZXh0LmMgICB8ICA0MyArLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dl
bV9jb250ZXh0LmggICB8ICAxNyArDQo+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVf
Z2VtX2NyZWF0ZS5jICAgIHwgIDcyICstDQo+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5
MTVfZ2VtX2RtYWJ1Zi5jICAgIHwgICA2ICsNCj4gwqAuLi4vZ3B1L2RybS9pOTE1L2dlbS9pOTE1
X2dlbV9leGVjYnVmZmVyLmMgICAgfCA1MjIgKy0tLS0tLS0tLS0NCj4gwqAuLi4vZ3B1L2RybS9p
OTE1L2dlbS9pOTE1X2dlbV9leGVjYnVmZmVyMy5jICAgfCA4NzIgKysrKysrKysrKysrKysrKysr
DQo+IMKgLi4uL2RybS9pOTE1L2dlbS9pOTE1X2dlbV9leGVjYnVmZmVyX2NvbW1vbi5jIHwgNjcx
ICsrKysrKysrKysrKysrDQo+IMKgLi4uL2RybS9pOTE1L2dlbS9pOTE1X2dlbV9leGVjYnVmZmVy
X2NvbW1vbi5oIHwgIDc2ICsrDQo+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2Vt
X2lvY3Rscy5oICAgIHwgICAyICsNCj4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9n
ZW1fb2JqZWN0LmMgICAgfCAgIDMgKw0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1
X2dlbV9vYmplY3QuaCAgICB8ICAgMiArDQo+IMKgLi4uL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9n
ZW1fb2JqZWN0X3R5cGVzLmggIHwgICA2ICsNCj4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0v
aTkxNV9nZW1fdXNlcnB0ci5jICAgfCAgMTkgKw0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2dl
bS9pOTE1X2dlbV92bV9iaW5kLmggICB8ICAzMCArDQo+IMKgLi4uL2RybS9pOTE1L2dlbS9pOTE1
X2dlbV92bV9iaW5kX29iamVjdC5jICAgIHwgNDYzICsrKysrKysrKysNCj4gwqBkcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndC9pbnRlbF9ndHQuYyAgICAgICAgICAgfCAgMjIgKw0KPiDCoGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2d0L2ludGVsX2d0dC5oICAgICAgICAgICB8ICAyOCArDQo+IMKgZHJpdmVy
cy9ncHUvZHJtL2k5MTUvaTkxNV9kcml2ZXIuYyAgICAgICAgICAgIHwgICA0ICsNCj4gwqBkcml2
ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2Rydi5oICAgICAgICAgICAgICAgfCAgIDIgKw0KPiDCoGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZ2VtLmMgICAgICAgICAgICAgICB8ICAxNCArLQ0KPiDC
oGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZ2VtX2d0dC5jICAgICAgICAgICB8ICAzOSArDQo+
IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9nZW1fZ3R0LmggICAgICAgICAgIHwgICAzICsN
Cj4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2dldHBhcmFtLmMgICAgICAgICAgfCAgIDMg
Kw0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZ3B1X2Vycm9yLmMgICAgICAgICB8ICA1
MiArLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfc3dfZmVuY2UuYyAgICAgICAgICB8
ICAyOCArLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfc3dfZmVuY2UuaCAgICAgICAg
ICB8ICAyMyArLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfdm1hLmMgICAgICAgICAg
ICAgICB8IDMwMSArKysrKy0NCj4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3ZtYS5oICAg
ICAgICAgICAgICAgfCAgNzAgKy0NCj4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3ZtYV90
eXBlcy5oICAgICAgICAgfCAgNDMgKw0KPiDCoGluY2x1ZGUvdWFwaS9kcm0vaTkxNV9kcm0uaCAg
ICAgICAgICAgICAgICAgICB8IDI4MSArKysrKy0NCj4gwqAzMiBmaWxlcyBjaGFuZ2VkLCAzMjQ1
IGluc2VydGlvbnMoKyksIDU1MyBkZWxldGlvbnMoLSkNCj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQg
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2V4ZWNidWZmZXIzLmMNCj4gwqBjcmVh
dGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2V4ZWNidWZm
ZXJfY29tbW9uLmMNCj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z2VtL2k5MTVfZ2VtX2V4ZWNidWZmZXJfY29tbW9uLmgNCj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQg
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX3ZtX2JpbmQuaA0KPiDCoGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fdm1fYmluZF9vYmpl
Y3QuYw0KPiANCg0K
