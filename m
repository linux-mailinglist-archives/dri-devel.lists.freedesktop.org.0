Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D00358294C8
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 09:08:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D570A10E0FA;
	Wed, 10 Jan 2024 08:08:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B998710E0FA;
 Wed, 10 Jan 2024 08:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704874131; x=1736410131;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=VGbx669kwuaVDClAmbHJ4un4+2bCxMl6XUXN4YuEWLY=;
 b=KR9JNi6YhYIZP4vV0so8JIXPLmC2cmTFUHbd8KHcGeZUdSsgKgp7NMxX
 /d/AMoESzULXqyjBUGjIs1pCdsgqCn0nNboIMy/a46LNptZGZrECkLtX/
 eQMftc3PIpX/HC7a7KAxuMT4JMSABgpal0zMIzOOJ+y0rX49409eN9AIb
 LP/0D2DJJWAyFWz/cp/3fKUzYCnET76/7sS4v0KSAAuVKGWGi9tpw9VOL
 lFNXyly6rauxoX3PxmMJGqdfRqgYrhNB45/5lS1pWyAW4nhjJf9lEfVrV
 O/nW7Eq6h9wD1KtHJTQ/E7NijVEGgzI2CkHZ28xgUpWi5dELXqIRp9HE2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="5804629"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="5804629"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 00:08:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="785524360"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="785524360"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jan 2024 00:08:29 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Jan 2024 00:08:30 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 10 Jan 2024 00:08:30 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Jan 2024 00:08:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QaeYInWHD4pdPITTdOIa9Yw5dQAmzbQHKEMo6EgFc1rtXgLkM8QxM1hcnCTXxgz9lmNhf2mx8a5GExoS/2+wrQMnsaI015FMceGbbnVeEwLyNJ7sh5dnbs5gdZ00tEn3PCAtLVgIdPW8aG/tbakI/NsnVCSLilQkdIaew9J+uj+3xK7pCV8LMdMW5/JJRpinKcJM+Xp21/uwM1gFqftigMdHMvRdHODWr9pojA+/22a3FWthYYBokT7fvz95a3C+gO2MG4qYXCs70hzBOf81Wfm0d5usSOgUK+N6LU+yYZYHBO3b2AEYf4wAUipxo0Xq354eCP8QXOHPtxommCfh5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VGbx669kwuaVDClAmbHJ4un4+2bCxMl6XUXN4YuEWLY=;
 b=iL1VYSjife+vhsjOE0MutXOOfLOZBTSnlYWzZGPF/S+MBnXYLPVUXYNdc3lANnXdifRtpkakiT0lOwnTw2/85wcXFFzdazeHXOnvrdA4/mnnrNTp9IjgHYmZNuixZeoUT7fdyqgMxKl/yjq+AeT2a0FoKLxnl0U94tZF3YJIJWurQRoO3ZkWzj89l2U8/bF13JL+BFDYQ5AmCUMIGyFmlcA76DyCqoAKvZCl3anZkyS1gHopjzyctrLYdu3GuJYCttY880Bzo9OL6Lio9fg75xxOgWhsorsWIn7jiYQOU9CFlWi3D99HZg6CktO4a2juVy/GkPvizzTnmz5uNsEtAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 DM4PR11MB5389.namprd11.prod.outlook.com (2603:10b6:5:394::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7181.18; Wed, 10 Jan 2024 08:08:28 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::dde1:91ce:98c6:d737]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::dde1:91ce:98c6:d737%7]) with mapi id 15.20.7159.020; Wed, 10 Jan 2024
 08:08:28 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "Kahola, Mika" <mika.kahola@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/7] drm: Add eDP 1.5 early transport definition
Thread-Topic: [PATCH 1/7] drm: Add eDP 1.5 early transport definition
Thread-Index: AQHaMdq1J+lGFmoDOU+auqFsb5eEqbDIAHQAgArUNgA=
Date: Wed, 10 Jan 2024 08:08:28 +0000
Message-ID: <e7b655ea89669e205dfff4b5cced93520cc6f874.camel@intel.com>
References: <20231218175004.52875-1-jouni.hogander@intel.com>
 <20231218175004.52875-2-jouni.hogander@intel.com>
 <MW4PR11MB7054CC77033CD795D7D68FAAEF60A@MW4PR11MB7054.namprd11.prod.outlook.com>
In-Reply-To: <MW4PR11MB7054CC77033CD795D7D68FAAEF60A@MW4PR11MB7054.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|DM4PR11MB5389:EE_
x-ms-office365-filtering-correlation-id: 77715386-1df4-4c4a-295b-08dc11b35425
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jWx+jimuKazc/KGrWipg2ygWJCGJbtvHseMBEfy719C1prnZlgGN+AXhRIpowrfX5tkBbkn/vIcbvKKjsaUb+woqtaVr0IH2w3Y0s977DNsCxdtQA5z68PnuLLKpz9BC9pBAZBrgh9UjFjdcjS/ahnD6aO1abts/dUM7c6JgtPtctza0e48/oqSUEY3yHIIYGljC0Mtu9zBNCCZfIJ9ZT5n+FYcSDW5PtDr/x0tBSRydppfQpPqI/iZH1F994wI2azKOHPY4eCD9+jDutVYAfDq5dfD1iThJ9p5d8asXAWlD4j1krFm2EUeVVy4CcIdzO9PwVAhfl2v+6xpWted6UbH+5CZAA6oiDWZU/zxcSX13yLEeaneAT+yF6Sp5WHHaYU/qXJX/OSVntVTL1u01Faam/wBm7TCyvZyk22Jx1bdVKZeXfK1nIv2kRTQqwzFfmbqBn4poosuHfbnPDYp2RRb5M1UrT+aChcN9doQaot0/DzlwvCy9EdbvpOGfPoBvFBGGjF3RUD4cxtpVQlgySm1MSaXxqbvZwshgBEP/36T+x188V4Y2sw9BljXEICu2rrIfVsFtnPD1e1Pe8IN65ohoT8TfvMS3eSE1SymPIwBY7RllHqJhlMVJcYubngpB
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(376002)(366004)(346002)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(122000001)(38100700002)(38070700009)(36756003)(86362001)(41300700001)(82960400001)(4326008)(8936002)(8676002)(316002)(71200400001)(91956017)(110136005)(66556008)(66476007)(66446008)(64756008)(54906003)(66946007)(76116006)(26005)(2616005)(6506007)(6512007)(53546011)(478600001)(5660300002)(2906002)(6486002)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TElrdzRCRGNHZDFIUUhnaFFLVGRBUHRSNmxQUjlBajRpZEN6WVRYZ0NUUUE1?=
 =?utf-8?B?NjJqai9VdTNPQmx2dUMzK3NpZlZKUGpmNFY1ZGRSN2J1d2hkOWp3V2ZhMFA1?=
 =?utf-8?B?OXdjaVcxYUJzL29zemxBS3lPQkNoSlFNT3dnMjZEMHBqMmZOWEttSGVSWTZ4?=
 =?utf-8?B?WnBYcVFNb2pnUG56QlB2Q2tFSE50Qkd4Umd1bmVkSHV5ajF4bUxzR01jWFAy?=
 =?utf-8?B?ZVhYbko4S3RzZ3VrUlYxZFpJMkFDMHBDbkN4WjV3TkFsdkFPTTVVL0NmVklK?=
 =?utf-8?B?dVpZZlFOVVd5d2tpanBOVkJoS0JUNjRhUHRNMlNzczJkY2FmVUNabWcxV04v?=
 =?utf-8?B?VmpsbEMzZG9xbFZqR1ZieWhDQ3BSaEJVQk0rUFI3Y1VteFkxMWtsUHIyM3B6?=
 =?utf-8?B?K1RYSERoSjdHa3NBNVcxazk4TDNycmhPaURtVk9BSi9ydDJWdFdTOEk2ZE9H?=
 =?utf-8?B?V0RuWnNCTjJhUThtcWszWWNYK3E2OFoyZmhnTkdKMElhZGJVUHg4R2VycG5V?=
 =?utf-8?B?TUx4cXh6QnY1cERueE02bWVDYkhQNXJkemFqcHE4YWRTSmRobUpVcXdKYzk3?=
 =?utf-8?B?M1k1ZzFjMzZDemMwelhlL3o0RW8vM3ZMM1kxaGJCeDNZeEJWay9yOXYzS0lY?=
 =?utf-8?B?TkJoWnhaMFRkN0M4b29CeEcrRjF0M09GcEEzL0ZxRFJ1bnNoUHF3NVZ4QktM?=
 =?utf-8?B?WThyL2lWdmlIREUrL2ZVM2EvUWxNYXRmQjUrOXlEQUNabUloSnVPRW82aGZw?=
 =?utf-8?B?TGVtR1VFalNxRmpJbzVJcTBZak9jd1RLNnRsQzRvUlFld3BpRXFEWGZsTktF?=
 =?utf-8?B?TjhBc04yNko2UDUyZTJwUEd1VTQwR2dkQlkzekpLdElUTERpQWI5TDA5d1F2?=
 =?utf-8?B?RUxxSGkwYkZtRTBVYVVQL0RIK0pUYXV5Nzg5ZG5TazVLSDN3T0lPRjNuSkNK?=
 =?utf-8?B?ckhHd2x2eG9sTjZZME5aOGxRVHVEWXh3dlQ5dDlremZOSmhnVzlNbEhCVGkw?=
 =?utf-8?B?a3ZqUjBDbnpFTWFHdlQyZjcvQWtuS0ZaK0xhVXpwRmRwRW9JL0xjekYvK2xj?=
 =?utf-8?B?N0lweVVkSjhRSGxsRURmbVZ5OTRWUnFsc0tYYmJReTZXdlR6SUZWN29LTHBY?=
 =?utf-8?B?d1RQVEVWVm0wdmJCZTNTSzFULzdmMjFDM1M1VU5oWDFmNU1MZ3Z6WWJuM0Vp?=
 =?utf-8?B?eS9QSitzT0hNemVhS3o3TmdZQnJ1M2pFUjhGNVIyS1czNlRWODBXaE9YNFhD?=
 =?utf-8?B?cE9hNllkaHhFS3ptSllTbG1TeXVxQ1krY292dGZXaWw5alArTnBqQzlodzB4?=
 =?utf-8?B?QjhUaXlaL3gzQ3V0U1lHdzNkQm56QjNnOXR5MUxIN3JSNjNZOW5GeElKUWwv?=
 =?utf-8?B?aVpLRHJEWEROUlpSb3d1YkJ2RnVwNEpGRWhsT0h1S1RKMGRkVHlpVUsxK3RY?=
 =?utf-8?B?OHRrV1BqSmFEZnVTbm5ZR2JqTUVkOEtoOTYzNjN5TGpwOEpCdUlnd3AvUUp0?=
 =?utf-8?B?YlBEV3dobVAwT3lWTCtLaXhPL294MGFEdU1WQzRuTW8zMFpDNjYxbndQS1hW?=
 =?utf-8?B?V0dzNVFTRjYwNlIrOC9yQUZnU3FFcGtXbHpxdWc0OG1vMHJ0MzY0dm0yNVJX?=
 =?utf-8?B?N2YyajlMVDdHKzRjdXlYenFMNWpScGtiV3RxWWZFWC9adTlxUDZHaGVuTkpy?=
 =?utf-8?B?eStwSVUrSEs4UVJURjF3V2xQVE9nSVpNSWxHMEJOQ3ZRQW4zbXlGUzZuQWh3?=
 =?utf-8?B?dFJrYmRxWmZpS1ZUeVQ4bkR1MU5YQTVKdWZaMktDd3dpajZVdzdmelVWK3V6?=
 =?utf-8?B?clJTMDlZWTJzZE5SeEdmL1RQUmNJNklnSTUxTkQyc05mMmZYTFN1N1QvS1dp?=
 =?utf-8?B?Y3QwNUZ1MUNKdmNBaUtaMUJzR0JYSmljYUdjcXVERzROUnh6cEJxTjVRcjVl?=
 =?utf-8?B?L05xY2o2SHVyWkdPQWg5RU5YVkM3VFloZzR4aTZQVklET3RPOVR1VXBWU3lp?=
 =?utf-8?B?OTdWcnU0Slo2ZjhmNHZqVUs4cGRzemhsclUvZjF3T0VEK2VDaThjeTllMDg5?=
 =?utf-8?B?cVhZUktIMjkvbHJYT3dmTHhPK3c4NnB6MEZZREJhckVHcUdSaVFIRFdHbmtt?=
 =?utf-8?B?c3AwTG5vT0ZOV0ZHQVJZL0JvZFZGRHU2RTZNdFUxVWZUakM4SUJJZ00xUkYz?=
 =?utf-8?B?OUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1D027E057966834A8D16B35BE16D6311@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77715386-1df4-4c4a-295b-08dc11b35425
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2024 08:08:28.7681 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: awAsYugnQhYiDf4sJDmvOAS4FingESRJfsLLHr9T1b5CW0KMEj2IGGSe6VqsCLkl4Roo0r68X/V8mADjXELjsQNk+r2DdDOGUzwAmD7YUhE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5389
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8gQWxsLA0KDQpJIGFjY2lkZW50YWxseSBwdXNoZWQgdGhpcyBwYXRjaCBpbnRvIGRybS1p
bnRlbC9kcm0taW50ZWwtbmV4dC4NCkhvcGVmdWxseSB0aGlzIGRvZXNuJ3QgY2F1c2UgcHJvYmxl
bXMuIEknbSB2ZXJ5IHNvcnJ5IGZvcg0KaW5jb252ZW5pZW5jZS4NCg0KQmVzdCBSZWdhcmRzLA0K
DQpKb3VuaSBIw7ZnYW5kZXINCg0KT24gV2VkLCAyMDI0LTAxLTAzIGF0IDEwOjQ2ICswMDAwLCBL
YWhvbGEsIE1pa2Egd3JvdGU6DQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBG
cm9tOiBJbnRlbC1nZnggPGludGVsLWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4g
T24gQmVoYWxmDQo+ID4gT2YgSm91bmkgSMO2Z2FuZGVyDQo+ID4gU2VudDogTW9uZGF5LCBEZWNl
bWJlciAxOCwgMjAyMyA3OjUwIFBNDQo+ID4gVG86IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcNCj4gPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiA+IFN1Ympl
Y3Q6IFtQQVRDSCAxLzddIGRybTogQWRkIGVEUCAxLjUgZWFybHkgdHJhbnNwb3J0IGRlZmluaXRp
b24NCj4gPiANCj4gPiBBZGQgRFBfUFNSX0VOQUJMRV9TVV9SRUdJT05fRVQgdG8gZW5hYmxlIHBh
bmVsIGVhcmx5IHRyYW5zcG9ydC4NCj4gPiANCj4gPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZw0KPiA+IA0KPiANCj4gUmV2aWV3ZWQtYnk6IE1pa2EgS2Fob2xhIDxtaWthLmth
aG9sYUBpbnRlbC5jb20+DQo+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEpvdW5pIEjDtmdhbmRlciA8
am91bmkuaG9nYW5kZXJAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+IMKgaW5jbHVkZS9kcm0vZGlz
cGxheS9kcm1fZHAuaCB8IDEgKw0KPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
DQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2Rpc3BsYXkvZHJtX2RwLmgNCj4g
PiBiL2luY2x1ZGUvZHJtL2Rpc3BsYXkvZHJtX2RwLmggaW5kZXggMzczMTgyODgyNWJkLi4yODFh
ZmZmNmVlNGUNCj4gPiAxMDA2NDQNCj4gPiAtLS0gYS9pbmNsdWRlL2RybS9kaXNwbGF5L2RybV9k
cC5oDQo+ID4gKysrIGIvaW5jbHVkZS9kcm0vZGlzcGxheS9kcm1fZHAuaA0KPiA+IEBAIC03MTgs
NiArNzE4LDcgQEANCj4gPiDCoCMgZGVmaW5lIERQX1BTUl9TVV9SRUdJT05fU0NBTkxJTkVfQ0FQ
VFVSRcKgwqDCoMKgwqBCSVQoNCkgLyogZURQIDEuNGENCj4gPiAqLw0KPiA+IMKgIyBkZWZpbmUg
RFBfUFNSX0lSUV9IUERfV0lUSF9DUkNfRVJST1JTwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBCSVQoNSkgLyoNCj4gPiBlRFAgMS40YSAqLw0KPiA+IMKgIyBkZWZpbmUgRFBfUFNSX0VO
QUJMRV9QU1IywqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoEJJVCg2KSAv
KiBlRFAgMS40YQ0KPiA+ICovDQo+ID4gKyMgZGVmaW5lIERQX1BTUl9FTkFCTEVfU1VfUkVHSU9O
X0VUwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEJJVCg3KSAvKiBlRFAgMS41DQo+ID4gKi8NCj4g
PiANCj4gPiDCoCNkZWZpbmUgRFBfQURBUFRFUl9DVFJMwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDB4MWEwDQo+ID4gwqAjIGRlZmluZSBEUF9B
REFQVEVSX0NUUkxfRk9SQ0VfTE9BRF9TRU5TRcKgwqAgKDEgPDwgMCkNCj4gPiAtLQ0KPiA+IDIu
MzQuMQ0KPiANCg0K
