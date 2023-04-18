Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D246E7011
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 01:52:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80B6710E5BB;
	Tue, 18 Apr 2023 23:52:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FC3A10E481;
 Tue, 18 Apr 2023 23:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681861928; x=1713397928;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=jOTb3nNqqoPoojJdqF5Cq9p6/LjdgcvAnVTtLVU8qfc=;
 b=iFLB+oglGzd3PzS3Cyj13wfmxAPc+GGm0wVICEElpTpUqIw7oRBUSm0z
 f9c7cZ9xwlHwsqJupN4vvwHrNi+cU3cYdGo6G0tBokjO2oOHCoq1auXY8
 JlnakVIMgwlzGJHcYxFmWCqKnUyPk9s4dcxCcJb9ZMqLsVCdz74fM7s63
 oBy3bll9xUymBixF/yXsxFGs7AmgDbnEfL3Y7MllWC6yYB8CLYLe2HMX9
 30IGCm8bMb8NMIXai1av5u8V9t/GtYwpPI9057jKgnjBfLZM03sp+8WgK
 oeVlz27ZAG9B1yWyRWI0IC7PzA7oZb9xxAXq35Tn33LNhlzfRxDF1f6a+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="342797420"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="342797420"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2023 16:52:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="691284912"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="691284912"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP; 18 Apr 2023 16:52:03 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 18 Apr 2023 16:52:03 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 18 Apr 2023 16:52:03 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 18 Apr 2023 16:52:03 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 18 Apr 2023 16:52:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R9pjae5qjFnMMymbnPVMel+D8uxwO9nRKwsHRXWNTnxZsCgK6Tv3Nbn9bUCoKjrjfOV0UaLMVPwvGq1we8BDROJh9aUuD3L4+nboekpvZqemNV3s60utBMhqFJic1/44cx23x6Qpbu/p78HIhAmVfzJQdrvRbrmN/AgoPNN8mtqJkXu7DUTgUWQ7YmwkIJpFKWUhrPFp7aLKovdrrbWN4MTU/MYt7HgJXvSbs7m62vkr5NSrcNxd0chwsEhkTEzRrrnpgQAiX53tS7X/EXzi/h38XgO0kER4H63zklQwRSm5X7BN7T818MjYHtLOfbqlREG5rDn6OMoPoOmlI0vfNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jOTb3nNqqoPoojJdqF5Cq9p6/LjdgcvAnVTtLVU8qfc=;
 b=fE/qxGxoCh5OevgEU8y63esHNhE8kPDsUNG+y9sNepGrQY/KRZhwxbNVGS+OCb0YMp4DGoz5SYBo9iYOxKOXhNwtx02ZSNo40/OBMCV2MHjs7QxNdxg5fh/FdQ1Es4sKB0xfLcYxngW66G/9UNSinjCVLeuH73IJdwhs3C+yj9FxLuKSbKcNZbhaRso/4diBuZBYA/QT86sNHzb+Eb9WclehmTcu7j8aSpnSFMBhXzV7YVc+xKLZN3NMaaRiYjQQqtYJSdD9J/zmDkj43f5/pOm+4KJsL2wcyo1/KAM/YWOUuEMdDP3w4gMfJAVy3lIFdgr/oFjXfCjlCsPmEgzw+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 SJ0PR11MB4797.namprd11.prod.outlook.com (2603:10b6:a03:2d4::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 23:52:00 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3%6]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 23:52:00 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/4] drm/i915/mtl: Define GSC Proxy component interface
Thread-Topic: [PATCH 1/4] drm/i915/mtl: Define GSC Proxy component interface
Thread-Index: AQHZYl+Hs4X6XrOdnUe1FJYX1lhoH68x3McA
Date: Tue, 18 Apr 2023 23:52:00 +0000
Message-ID: <f8a0afc25630acc1e73bfa5a46dcc94ea559234a.camel@intel.com>
References: <20230329165658.2686549-1-daniele.ceraolospurio@intel.com>
 <20230329165658.2686549-2-daniele.ceraolospurio@intel.com>
In-Reply-To: <20230329165658.2686549-2-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|SJ0PR11MB4797:EE_
x-ms-office365-filtering-correlation-id: 5f52e666-0cad-4c76-b927-08db4067e72c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3OUCA8KGh6+7bAWavnkLgjaECWpjXxbzQR0p8GDgDYzOL13MuNSI4NBr9H2FakDerYDhzQSSnNE4k7oo6VN7S8uQanx7QlPkrGwR0y+yPBvCdhacXFEA8BzNGxAAqHaQgb0Mi/QEFOocrPqaXoB+671yG6AF/gwOA1Ow9KEkROkfaLJ6LBUbj+y6qqbCPNIQXVGWAWbsUJodFVCi3NDenqopmFkFSKq+NzQu/i+D4hXq2w1eKMv6eIi2uSd6WrVDRv2y0/Z0YsFNAZSyt4s0RoFWSPlFbv3zJrajQge3gN8aRDmI8cmK2/zwQnx0eeCAQy/fEwG5rsxNj9sG7xDBezmf3xssMrWCkXEtVXVY72J2UF7trN3Zq5oK+PT10CePbErlBPc1rsPzzeAaRBoDbJVm310fFXcIR9TaLmrP5jLmBaM1HE415OF4qWlAHVIDcPXKN2oNdyqQ7gD2Oa335CdT2JoCWsbxn8yJwxN+f6bc9JIKWOqso8BhHCD2/17ugt55WOPRehNBOmGLhnK1BjVRKhblRuo+XqgVpmB3wacRnyrskdJwhKZbp8qpgAeWBXinIoFAxwdD15z9ZthFz9NuhRWwZXLYQlLoYYihr72CFXALBMsY5QRc4l9CV7qI
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(366004)(39860400002)(376002)(396003)(451199021)(8936002)(38100700002)(36756003)(8676002)(122000001)(38070700005)(2906002)(86362001)(5660300002)(478600001)(6486002)(71200400001)(54906003)(110136005)(186003)(107886003)(2616005)(66946007)(6506007)(76116006)(66476007)(66446008)(6512007)(26005)(316002)(91956017)(82960400001)(83380400001)(64756008)(66556008)(41300700001)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RUYzQUl2ZlhlOGxvQStYMzJQVnFmK1ZKNGlHc0ltSm1UcHBFZ09aVEY1ampv?=
 =?utf-8?B?OW40NzZzc1ZyWkwyNGpHL0hja3dyTE9xZWVpN1BXbWZHTlN4UVkvRkVzampQ?=
 =?utf-8?B?aWExZ2MrRmtZeFdQZVJaL2lJaXphWG9JaS9ZZkhwYnIzWmNwM0lXWTUwZmFy?=
 =?utf-8?B?T3VKSjJJdDdGaHJkLzJ4S2FHM0tnZ1B5TEp5RlNteWd2c2J6Q1pRSHMxNm9U?=
 =?utf-8?B?SzQyODhvTjhsa2ZaczBuaDVjY0RpOFprbkJEY0hkeW5iS0xWL1Y4OGxsQlFL?=
 =?utf-8?B?ZVpMUkdtMFhnMU9tS0hmbTVrRytYYUdSQVpzTG5YNUJtWlFIWGU0VmFFUVdF?=
 =?utf-8?B?Zk9NOFFlRU5YaFZuOTFHeFEvTTVLcFhTcHNNandZcDYzaVR0R1ZEREl6TmlX?=
 =?utf-8?B?TlJtYVd0WDRWMTd3eWFMWTF5bUN5cHBISlN1L1V1ejBwYXdLamFRaGJDdVdG?=
 =?utf-8?B?dkVXREh2ZDNCY3RJZXhvZGsrYlZKSWFXckR2Z21obzFpcEJ2bEIyY2V5TzRp?=
 =?utf-8?B?eStzMmx3UjJ6Y3FLYmZKV0VoOEdJRWw3ajVoS3ZJM05lckwyM0l0aCs5amRk?=
 =?utf-8?B?M2ZzaFNYVlJtK2t6c0thODUxUUs3OWxWN3BxOVpmZXNtRVpoYWJBdVRQSVNt?=
 =?utf-8?B?WmZtVXAzOGVjakJVbVBUM0hySzFQQ3dpeFI0UmxtUEhqZkVDTUN5RmJDZzBU?=
 =?utf-8?B?RDdVQkswbFhKeWFhY01neHdVS3IwU1RqRnp6YVpDcjZKZzh3WUVSZHFLdDFF?=
 =?utf-8?B?QlBoSW1VTlNaWlkycTlIYmxTdmU4VTgwY2hWS2hSSm1zemdYV0RUaTN2djlp?=
 =?utf-8?B?cnR4aytQaGxVbFRNc21Md3ArVDZXQmpxZGdFT0VOWTZvZW1lNy9GNS9Ha0Fm?=
 =?utf-8?B?TzZmaU4xYzcrZWNVNnlFVjVQZTkwOGhqS3E5VkdJSUg5SDJzdEJCZEN5U0Vn?=
 =?utf-8?B?OEZ4SVk4b3ZyTmJUa0xpN0pBcDB3aXlyUk9BQnZYNXBaUFNweDE3SUdzTGJr?=
 =?utf-8?B?Y1FQdkJoYnEyZ084Y29IU3RvSlljNUFYWVhEUTZNaXR5NGd4VnVCTEQrdy9X?=
 =?utf-8?B?UFc3dTlobWRFK2lLT0o2YzBNejFWbzlsRXd5LzBHalBNMjR1NTFyMXBtODI2?=
 =?utf-8?B?SjNHOFRXcUprbU1PSVZKQWRDKzBCNzhtU1pMODJhc2picVNwRktXb1gzbThk?=
 =?utf-8?B?cDJMaUQ3a0w0OWJCK2JNeFVJc0YxNjJWUURteEkxaWEzWUtmZnBNZ0NtbUVB?=
 =?utf-8?B?S0oycUFlR3lzWndDSU1CSGVzYjJiT1ZONythRGg3eVk1czUyL0ZWeFBUVk9t?=
 =?utf-8?B?bnRjdytvdzFMMjhDMHhlRHloTk82UGNoT1Irc21FNFVzT0diejkzbWRheDNv?=
 =?utf-8?B?M0tvU2w0SmlzMWMyQjVOQm8zVkZXU1dHWnU5dkdDenNoZGI0UGp6eWw1L04y?=
 =?utf-8?B?SEpxSjhGZkpBMDVUV1FtaHdGNldrWmlDcldWZ3JmVmpndzhXei9UNDFZOWVO?=
 =?utf-8?B?VmhNS0lady9oeVpDSlgvdis4N01kNjlsZFlzT1I3VFdGZzRJZDZnQVM2MTIy?=
 =?utf-8?B?RklZVUFJaFhGUmdEdjdBR0lDeDY0NWdJQXZyQVNWcUdPT2FPcllNYWJhWDRM?=
 =?utf-8?B?Vkd1blZIZHJRNUNuNWNoMmJBOXdFYjJXTmlDV0JIaHUxS1k1NzZmSlZrc05C?=
 =?utf-8?B?REp1cXp3TVlEZk1ublFST2RRbElPVXA3YjMwbzdySzVTV1VnQWxCSnhaZ3dR?=
 =?utf-8?B?b081TnArMG42c2ZiblpPL1BXdG5uYVdMYWFlcG02NVNTWUE4WDhKMkFCSmF6?=
 =?utf-8?B?bDh2YlJwUUcrLzByTjN1RGU0cjkzaE1Fc2c3bE9BMVUraHJGTW9kalgyM0RC?=
 =?utf-8?B?dFlxOFBBUnpOUHk3cld2MzRhak5vem4yMS8vM3FTR0FTY3QyUy9UQU1IaVZy?=
 =?utf-8?B?WTRDTVNUREZ5ME4vcU15Sm1uWGxhWTR6OHMrcDFJN2ppUEcyaTl3a0Fod2hx?=
 =?utf-8?B?NEpLT2orU3A5VjdZSVlBcDBJaVFNd1dRd2ZNckRnQlhFc0xlbVpGaUlXc3d0?=
 =?utf-8?B?RmZEY3pOdkFYWVpIazdjZFNEODFQWnJ2VndPeVRFYWU0d3g3TDM0SWRCajhx?=
 =?utf-8?B?cXBBTjYrSVBXV0liN1VrUHBCMlQvRmEyQWRUeitPK3d1TWNwelJrSkNBZGlV?=
 =?utf-8?Q?1ggu72eu2q1XlqVXWrUrDHw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <71778EB3892FA14BBB9E908857F68CB1@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f52e666-0cad-4c76-b927-08db4067e72c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2023 23:52:00.7029 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2ze/dW4yR79JuaBcTPQJpe5+xY6/maikeIT2G3/kLDZAvJw5ylIvGggHOBVNrjzQbPy9yJolj93W3+4z5ZXUW6uvcN8He3SfHbJKUS0/ZkTVZCC60MvzFKi+YMFptdFx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4797
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
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "Kandpal,
 Suraj" <suraj.kandpal@intel.com>, "Usyskin,
 Alexander" <alexander.usyskin@intel.com>, "Winkler,
 Tomas" <tomas.winkler@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIzLTAzLTI5IGF0IDA5OjU2IC0wNzAwLCBDZXJhb2xvIFNwdXJpbywgRGFuaWVs
ZSB3cm90ZToNCj4gRnJvbTogQWxleGFuZGVyIFVzeXNraW4gPGFsZXhhbmRlci51c3lza2luQGlu
dGVsLmNvbT4NCj4gDQo+IEdTQyBQcm94eSBjb21wb25lbnQgaXMgdXNlZCBmb3IgY29tbXVuaWNh
dGlvbiBiZXR3ZWVuIHRoZQ0KPiBJbnRlbCBncmFwaGljcyBkcml2ZXIgYW5kIE1FSSBkcml2ZXIu
DQoNCg0KDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9pOTE1X2dzY19wcm94eV9tZWlfaW50
ZXJmYWNlLmggYi9pbmNsdWRlL2RybS9pOTE1X2dzY19wcm94eV9tZWlfaW50ZXJmYWNlLmgNCj4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMDAwLi5lODE3YmIzMTZkNWMN
Cj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9pbmNsdWRlL2RybS9pOTE1X2dzY19wcm94eV9tZWlf
aW50ZXJmYWNlLmgNCj4gQEAgLTAsMCArMSwzNiBAQA0KPiArLyogU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IE1JVCAqLw0KPiArLyoNCj4gKyAqIENvcHlyaWdodCAoYykgMjAyMi0yMDIzIEludGVs
IENvcnBvcmF0aW9uDQo+ICsgKi8NCj4gKw0KPiArI2lmbmRlZiBfSTkxNV9HU0NfUFJPWFlfTUVJ
X0lOVEVSRkFDRV9IXw0KPiArI2RlZmluZSBfSTkxNV9HU0NfUFJPWFlfTUVJX0lOVEVSRkFDRV9I
Xw0KPiArDQo+ICsjaW5jbHVkZSA8bGludXgvbXV0ZXguaD4NCg0KYWxhbjogaSBub3RpY2UgdSBo
YXZlIGluY2x1ZGVkIG11dGV4LmggYnV0IGRvbid0IGhhdmUgYW55IG11dGV4IHVzZSBpbiB0aGlz
IGhlYWRlci4NCnNpZGUgbm90ZTogbG9va2luZyBhdCBhdCBsZWFzdCBvbmUgb3RoZXIgY29tcG9u
ZW50IGludGVyZmFjZXMgKHB4cCksIEkgc2VlIGEgbXV0ZXggaW4gdGhlDQpjb21wb25lbnQgc3Ry
dWN0IGJ1dCBkb24ndCBzZWUgaXQgYmVpbmcgdXNlZCBhdCBhbGwgLSBhIHRvcGljIGZvciBhIGRp
ZmZlcmVudCBzZXJpZXMuDQoNCg0KPiArI2luY2x1ZGUgPGxpbnV4L2RldmljZS5oPg0KYWxhbjog
YW55IHJlYXNvbiB3ZSBzaG91bGQgaW5jbHVkZSAiZGV2aWNlLmgiPyBhcyBvcHBvc2VkIHRvIGp1
c3QgZGVmaW5lIHRoZSBwdHIgdHlwZQ0KKHNpbmNlIHcgb25seSByZWZlcmVuY2UgdGhlIHB0cnMp
LiB0aGlzIGNvdWxkIHNhdmUgdXMgYSBsaXR0bGUgb24gYnVpbGQgdGltZQ0KDQo+ICsNCj4gKy8q
Kg0KPiArICogc3RydWN0IGk5MTVfZ3NjX3Byb3h5X2NvbXBvbmVudF9vcHMgLSBvcHMgZm9yIEdT
QyBQcm94eSBzZXJ2aWNlcy4NCj4gKyAqIEBvd25lcjogTW9kdWxlIHByb3ZpZGluZyB0aGUgb3Bz
DQo+ICsgKiBAc2VuZDogc2VuZHMgZGF0YSB0aHJvdWdoIEdTQyBwcm94eQ0KPiArICogQHJlY3Y6
IHJlY2VpdmVzIGRhdGEgdGhyb3VnaCBHU0MgcHJveHkNCmFsYW46IG5pdDogdG8gYmUgbW9yZSBz
cGVjaWZpYyAiLi4uIGZyb20gaTkxNSB0aHJvdWdoIEdTQyBwcm94eSINCg0KPiArICovDQo+ICtz
dHJ1Y3QgaTkxNV9nc2NfcHJveHlfY29tcG9uZW50X29wcyB7DQo+ICsJc3RydWN0IG1vZHVsZSAq
b3duZXI7DQo+ICsNCj4gKwlpbnQgKCpzZW5kKShzdHJ1Y3QgZGV2aWNlICpkZXYsIGNvbnN0IHZv
aWQgKmJ1Ziwgc2l6ZV90IHNpemUpOw0KPiArCWludCAoKnJlY3YpKHN0cnVjdCBkZXZpY2UgKmRl
diwgdm9pZCAqYnVmLCBzaXplX3Qgc2l6ZSk7DQo+ICt9Ow0KYWxhbjogaSBiZWxpZXZlIHdlIHNo
b3VsZCBoYXZlIHByb3BlciBkb2N1bWVudGF0aW9uIG9uIHRoZSBwb3NzaWJsZSBsaXN0IG9mDQpy
ZXR1cm4gdmFsdWVzIGZvciB0aGUgdmFyaW91cyBlcnJvciBjb25kaXRpb25zIChhc3N1bWluZyAw
IGlzIHN1Y2Nlc3MpLg0KDQo+ICsNCj4gKy8qKg0KPiArICogc3RydWN0IGk5MTVfZ3NjX3Byb3h5
X2NvbXBvbmVudCAtIFVzZWQgZm9yIGNvbW11bmljYXRpb24gYmV0d2VlbiBpOTE1IGFuZA0KPiAr
ICogTUVJIGRyaXZlcnMgZm9yIEdTQyBwcm94eSBzZXJ2aWNlcw0KPiArICogQG1laV9kZXY6IGRl
dmljZSB0aGF0IHByb3ZpZGUgdGhlIEdTQyBwcm94eSBzZXJ2aWNlLg0KPiArICogQG9wczogT3Bz
IGltcGxlbWVudGVkIGJ5IEdTQyBwcm94eSBkcml2ZXIsIHVzZWQgYnkgaTkxNSBkcml2ZXIuDQo+
ICsgKi8NCj4gK3N0cnVjdCBpOTE1X2dzY19wcm94eV9jb21wb25lbnQgew0KPiArCXN0cnVjdCBk
ZXZpY2UgKm1laV9kZXY7DQo+ICsJY29uc3Qgc3RydWN0IGk5MTVfZ3NjX3Byb3h5X2NvbXBvbmVu
dF9vcHMgKm9wczsNCj4gK307DQo+ICsNCj4gKyNlbmRpZiAvKiBfSTkxNV9HU0NfUFJPWFlfTUVJ
X0lOVEVSRkFDRV9IXyAqLw0KDQo=
