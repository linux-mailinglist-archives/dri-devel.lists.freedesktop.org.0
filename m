Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C537F6D3A
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 08:54:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E132E10E79B;
	Fri, 24 Nov 2023 07:54:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99E0C10E79B;
 Fri, 24 Nov 2023 07:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700812452; x=1732348452;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7mrbbVhGhwuvi1O8Ybr2KRV6b7y0RQxPxSJRCfHqv0k=;
 b=gizs2KnuzkUJnpn3lFU+ZleIDejIFUIh0/uWGyR5nWvHqz+YDCvE8Tli
 Ti9uRCCKIsqZT5XNn8GlcXDRek/MwGvuJxV5/RJX3NoHZ7sOemakPkWCw
 +isJF/AQNsdF/SiJGbXmgZT0A/801maWzrwjOzklSuCuE1X/6q22ItNNF
 31+LJN9SyaQsVln9ktLjZZY03WhqolhX/od8PS6YcEKhoyyhUznQ3hL7x
 gqT7lmJTW4+47QB+F47D0hse2XU7ax3Jnmq6TaxEfhtA8IX8op+La7Lwo
 JNJIeddeswW3hnMGypwVQ1Khc2JfS8BH9pRH7JrdzKLIC6vACmsJO3+SU w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="5599844"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="5599844"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2023 23:54:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="911369645"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; d="scan'208";a="911369645"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Nov 2023 23:54:10 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 23 Nov 2023 23:54:10 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 23 Nov 2023 23:54:10 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 23 Nov 2023 23:54:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PSOIE8fQruKAZsDz31/llvoT7wiO416Mv93c43wFSB8xlm5Z1GctpLU32XkLyV3qK5wOtafeb+fmB+HTvPuAsRZiIsp9KrSeXEFWQYPWDozezlA1R0+Bqp2EpD6ZhrKSYXsWsRNIGXBghRh6NO6+tAlYDk4YYd1yz5Nlb8rjzz4yC0ZEgipba5tqWFykaxJ13VDZa90IH7hRKIuXgc2zwl/tax/mJn66V5DLpwdwv0xVn74Y6MTl4qmOiF2eKaDMtyrqdeaAzmzPjMozfG1+N6ozNsSV06O/WqarM1xJ7sLF1P21gdB4OJ0S1YvVjjqCOe+fqBcwzu8CLQJheNsRXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7mrbbVhGhwuvi1O8Ybr2KRV6b7y0RQxPxSJRCfHqv0k=;
 b=ixpfAZoA4ATs5CBZfJYm0WyDTsusbAmBV8v4vgdQUe2mvZ4e8jsNFPc8240DJ+Q8fmzOTTMGIYsWcCPSBF8V1okZuX7L/N5o9QxT7+hRWEiVBfuKttwZx8X+nTJwGIyBgTow/zxH7vBynYbot1Ym6QFH/tRAbG4XE4eggQZyATiqKpLrSgajAKPI5I+f3M9NYSI8xlIlAOOx1c1L+8R7e3BGqeMAdrlXUMC4T5q3P1YkWhXHyDZKvysuF0XwiFHKGDZ1rc2cFZtWjPJ0mEEj9fveT3BuwgOkBRMeuema0wEH1VRac6qRSWg1xh0XRJGQIM332ps2469I0CXKrXJU+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by CH3PR11MB8238.namprd11.prod.outlook.com (2603:10b6:610:155::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.20; Fri, 24 Nov
 2023 07:54:08 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::b5bf:a968:5f25:945]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::b5bf:a968:5f25:945%6]) with mapi id 15.20.7025.021; Fri, 24 Nov 2023
 07:54:07 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Subject: RE: [Intel-gfx] [PATCH] drm/i915/irq: Improve error logging for
 unexpected DE Misc interrupts
Thread-Topic: [Intel-gfx] [PATCH] drm/i915/irq: Improve error logging for
 unexpected DE Misc interrupts
Thread-Index: AQHaHlWx2ge4guZm/kK/ODQH6nKZMbCI94sA
Date: Fri, 24 Nov 2023 07:54:07 +0000
Message-ID: <SJ1PR11MB612918F5E101E35224C918FEB9B8A@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20231123175638.27650-1-sergeantsagara@protonmail.com>
In-Reply-To: <20231123175638.27650-1-sergeantsagara@protonmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|CH3PR11MB8238:EE_
x-ms-office365-filtering-correlation-id: 8548aa5b-c425-495e-94de-08dbecc2894d
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aKb86mTcEP/dYGlDCZDlVvbLnNfIMCxhtISzwORlaIz8YTjwqzatBVaN6r/WS3uI82ux2Km6Oi2vKHmcxqet9rkhPXkePfDqfdal3Tjx4dwdObwRi2kBJL5fzv/2PxeSOEvewnSglNTMR/alt/ITlqKEpww8/vyZU2RvWivArwpdwFlckaqOEC7TeUUSSBdcX+OcnR004CEl84hg66JfiecKwiFlVJdlpqaZe2nCIg2h/LSEv9Nbzybcj51duf4bkQz3pGntsJ7ks27O/Osld4XlHWIhd0W8Py2i7l1EyANzMn4XoSZ3/iKsMKfn091FHAZjECkdO984392M56pHYD4gwuSnY2vxengBfhluYH91JlikcuOzjCJjPtvcH4HjbgF/4nIfZXLKl/N3k4q1fehnq59izzk9BR1I3HMMndmBIErLRo4O8zUoH6VjueQNxs5aCVXMYaccyyQVhTGt8tmelif7E1OewDKp2JCOyCPtYm4LB0uzlXq1Vu9TuNL5R+qtj3V6B93bvHyEyBdoXYUIfeO5ddAcbheYVQGKOi+zR4EQ3sF8AGHqxHSB5MgsuvrOB0iaSzoqW2fxXIaEayfnfyL0KsTB/XpNYvtDebs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(366004)(376002)(396003)(346002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(55016003)(9686003)(26005)(82960400001)(122000001)(86362001)(33656002)(38070700009)(38100700002)(64756008)(83380400001)(5660300002)(2906002)(478600001)(6506007)(7696005)(71200400001)(53546011)(54906003)(316002)(66946007)(66446008)(66556008)(66476007)(4326008)(8936002)(6916009)(8676002)(966005)(52536014)(41300700001)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R0dFdmFVTWQ3cGRnWTAvZkt6SHVoOW0ydVp1RDVEL2dmZUZnZlRoZUpsVUxL?=
 =?utf-8?B?ZlFySzg0T3IxaEp2c1FjYkVMb2JKUFB6djlHT2UzakIvSUpocDQyNHJ0ajR0?=
 =?utf-8?B?a1RENXRWUUVPZS9nZG50ZXA5di9VQVQ3SmpRVzJjWVF2TmVzSWhhdXpYMlFR?=
 =?utf-8?B?LzFvK0ltdEZwdGhGbi9PL21IYWV4YUpBV0JDSEtzcklGS1FlTEw0c2ExMWRF?=
 =?utf-8?B?dlJKdmh0V0QvM3dBWFFVYUg4Z01Ra2VmaWdNSGFtUGZKeVNJL2J0WFZoVXh4?=
 =?utf-8?B?Ti9GekdNcThVY3R3YWwxRDArMGl5NGhkekFIZ0lJSkpYV20yK1lic1kxWUx5?=
 =?utf-8?B?U3BCNE44UEFCWXRySGM0bTh4K3A2dXRwNENRdG85VVRkaDUrcW05bEVjV0tq?=
 =?utf-8?B?UUgySFgyU1ZaNGZONTFVUGZBR2d2TGdYM0dNVkFoNzlYeXR1ZGdnR1hxdUIv?=
 =?utf-8?B?U1YyV0FZRWlFa0tGUU0vU0srUjhWaERBa2ZUaFh5MGt0RnNSbjNCRFVsUWdZ?=
 =?utf-8?B?OFVjSHNNaUl6Wm81QlFlNHh4eW5aYng1K29UY245OEYxRFArNTdCNHFRbm1t?=
 =?utf-8?B?ZzZpYm1HcjNEVnFOdEdFc2J1c2tmbVBxa1QrSzRhaWhEeUl5ZTRsNmc5WXZ1?=
 =?utf-8?B?elVmVkFyZHFSRmRCZVlpZStjYzlZajF6RmM5dVJkZGZDcURyYjZTdWFQSFVa?=
 =?utf-8?B?VWpsUUVQL3JqVzlJMVNSa1J6VjhHTi9yQTMwSHkyWmJMZTFHc2xnUjRnVnVr?=
 =?utf-8?B?YUUzcExCY2h3Y0lDUXBMTGN2cW5zMzJQMjlkMWVXaERHNXdkVXd0RGFIT0d2?=
 =?utf-8?B?Ry81TlVkVGsreG9vZ1ZUaTBsNlBVR1VWWkNnN3RWSjNFTi9ZWjI3WDBtcmtS?=
 =?utf-8?B?ZUNuTGpvZHIzVEpRRjFwUmZqM3ZzMVg0K1pqTjAwSUZZNzFrM0M0NmxRZmxs?=
 =?utf-8?B?NWlGbEpxaWJFS05qUEs2NlBVUnJ6cXZNdktEZjNLOVVtbWZWbjkvcEhKZFdr?=
 =?utf-8?B?NWtTZytNMFFNUEJHWjBTSkorSlBhcDZzYnhmaGQ1N21MNWt4dWd3bEx4VHd3?=
 =?utf-8?B?N093bFVGbVhEZXN6Nk40eDRkYzFhUCtxYUlwYjBOcndJWVhyTytkVXFDcHNU?=
 =?utf-8?B?blNmZzhpdWtJdlpsYXRwMGhYZHNvUzlsekg0a3Z2cUZyQ0Y2Yjg3M0lVV3Js?=
 =?utf-8?B?aE5lcWdraXQ1Qld3dExYSFpyTGFtbSs1a1dsMlc0dW8zT3VmbzRRNEgzeDhp?=
 =?utf-8?B?dC9haElMU1BZc1dNbnUyQW9UU1NRb3p1RzVPdjhDOFYrK0NyQmYvLzZYaGM4?=
 =?utf-8?B?UDYzdSt0K3ZMMGZIeWhrcURJRVU2NHJSb1VkdTgrRkJNQ05TMzRDUVRkTU54?=
 =?utf-8?B?OEN0Y0hGdGNMeU5BUDNmT2w5TmNxenFrOWd3VW1yZENFdjd1S3JRUFRSeDdu?=
 =?utf-8?B?T0EzQ0dIMGlLTVhsMjBvdXhmc0k2bm5Gc0JqcVBZSWtPQ01ubmlsUWhBS290?=
 =?utf-8?B?YjNkTytyYk1RTlVLdnNVOElaVDhqQU5wVnA4SHJtdWkxbzY4S3FNOHVjbXdG?=
 =?utf-8?B?Zmg4OWZiZzY5dSt1L0pTS0VHOTBPUGc3dG9IVXNBK2tsVUhLMHd4bTdMcTQy?=
 =?utf-8?B?UlYvT3dmT0dQNFBRbDZMMVhxRk5wMXM3VTJtNXIwcEtEMXVxK1A1UGxGNi9E?=
 =?utf-8?B?U2JXdW1WclNvTlBDekVOTUNwWGg3MTNDVWEvZVNVSmowUFV1QlQ0U2lIdjJJ?=
 =?utf-8?B?NWpQU1N6U2tEM05za2pudWN3aTM0ZnZMVVVOa2dzaXNnMVRBbUxCaHQvcDRk?=
 =?utf-8?B?blhqTG41bExkd3JsbVJPUGZsVXBESTNXU0dKVktKcmcyRG9BTTlEamlEc0RF?=
 =?utf-8?B?NVE3TlpSb2Q0OGN5Z1lLcVBUOVlDbDdWTUM2WDN2N1g0Nk5TYmJFL3NZMjEv?=
 =?utf-8?B?U0V4Vzg4SmpvbnQrOStIQUNHN1NDQWNzbDQ4RjlmUmNlVmJMTzBNT2FKSFNB?=
 =?utf-8?B?UWkybXhrYjdqWk9SZHFsUTNBS2VWMCtUZW9wUHNrNFBDellnSDJHUzQ0cEh2?=
 =?utf-8?B?cklUQSsxallnYVJFOXJHNlJxYXFrQ3NXUk4xM3EyS2NqR2pnejNUdGdnd2RL?=
 =?utf-8?B?QjBPeCt3UkZ6K3RCd3UvYStXL3IxLzc3YVhqb3dXQ2FGQVBNaHpZWm9mOXZZ?=
 =?utf-8?B?b0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8548aa5b-c425-495e-94de-08dbecc2894d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2023 07:54:07.4100 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hj2vmLs2ckw3kYiVlIeqST16wjhNHVDR/G9lCTDsvL6Y+cveiYDt24E1KGFwJooAymSVymWSxP61eYG0i2zAAlEJm4vYQvXGNsv+S0Vo770=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8238
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBJbnRlbC1nZnggPGludGVsLWdm
eC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIFJhaHVsDQo+IFJh
bWVzaGJhYnUNCj4gU2VudDogVGh1cnNkYXksIE5vdmVtYmVyIDIzLCAyMDIzIDExOjI3IFBNDQo+
IFRvOiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBOaWt1bGEsIEphbmkg
PGphbmkubmlrdWxhQGludGVsLmNvbT47IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7
DQo+IFJhaHVsIFJhbWVzaGJhYnUgPHNlcmdlYW50c2FnYXJhQHByb3Rvbm1haWwuY29tPg0KPiBT
dWJqZWN0OiBbSW50ZWwtZ2Z4XSBbUEFUQ0hdIGRybS9pOTE1L2lycTogSW1wcm92ZSBlcnJvciBs
b2dnaW5nIGZvcg0KPiB1bmV4cGVjdGVkIERFIE1pc2MgaW50ZXJydXB0cw0KPiANCj4gRHVtcCB0
aGUgaWlyIHZhbHVlIGluIGhleCB3aGVuIHRoZSBpbnRlcnJ1cHQgaXMgdW5leHBlY3RlZC4NCj4g
DQo+IExpbms6IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vaW50ZWwvLS9pc3N1
ZXMvOTY1MiNub3RlXzIxNzg1MDENCj4gQ2M6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRl
bC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IFJhaHVsIFJhbWVzaGJhYnUgPHNlcmdlYW50c2FnYXJh
QHByb3Rvbm1haWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfZGlzcGxheV9pcnEuYyB8IDIgKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV9pcnEuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV9pcnEuYw0KPiBpbmRleCBiZmY0YTc2MzEwYzAuLjFhNWE5
ZTBmYzAxZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9kaXNwbGF5X2lycS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfZGlzcGxheV9pcnEuYw0KPiBAQCAtODk2LDcgKzg5Niw3IEBAIGdlbjhfZGVfbWlzY19pcnFf
aGFuZGxlcihzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZQ0KPiAqZGV2X3ByaXYsIHUzMiBpaXIpDQo+
ICAJfQ0KPiANCj4gIAlpZiAoIWZvdW5kKQ0KPiAtCQlkcm1fZXJyKCZkZXZfcHJpdi0+ZHJtLCAi
VW5leHBlY3RlZCBERSBNaXNjDQo+IGludGVycnVwdFxuIik7DQo+ICsJCWRybV9lcnIoJmRldl9w
cml2LT5kcm0sICJVbmV4cGVjdGVkIERFIE1pc2MgaW50ZXJydXB0Og0KPiAlI3hcbiIsIGlpcik7
DQoNCk5pdDogSXQgY291bGQgdXNlIGEgZm9ybWF0IHNwZWNpZmllciBsaWtlICIweCUwOHgiIChs
aWtlIG90aGVyIGluc3RhbmNlcyBpbiB0aGUgZmlsZSkgdG8gbWFpbnRhaW4gdW5pZm9ybSB3aWR0
aC4NCg0KT3RoZXIgdGhhbiB0aGF0LiBMR1RNLg0KDQpSZXZpZXdlZC1ieTogQ2hhaXRhbnlhIEt1
bWFyIEJvcmFoIDxjaGFpdGFueWEua3VtYXIuYm9yYWhAaW50ZWwuY29tPg0KDQoNCj4gIH0NCj4g
DQo+ICBzdGF0aWMgdm9pZCBnZW4xMV9kc2lfdGVfaW50ZXJydXB0X2hhbmRsZXIoc3RydWN0IGRy
bV9pOTE1X3ByaXZhdGUNCj4gKmRldl9wcml2LA0KPiAtLQ0KPiAyLjQwLjENCj4gDQoNCg==
