Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4908B63FA2E
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 23:00:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0578810E677;
	Thu,  1 Dec 2022 22:00:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12D5B10E182;
 Thu,  1 Dec 2022 22:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669932027; x=1701468027;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=zW+ut5953W+wNGpmF0oFDXVC9+UdimasJcURxd+jufM=;
 b=UOpSVQ9kPSymU1p5Sg5UNbRbVSnL089LH20iXXiaAeW1LNXae5+GmJP5
 KWw3IJGszoLWJN6QzR2ZDebXAj5WSDpL3p1w2ReUtrNGTYJ/OKdI23dNE
 ZCkF2cAbIaKr13of62YfjraMxOJuCLKYF273LQHuOPSa4m/6ibQsVbogP
 bJ5odWPCf5ZR4Kd3bhX1jniaTGqWhnKGP5YpWFDxGfGs8fesa11DdOvWm
 KCXrrMlEk2vtAvnuu5wMRL2Pi8BHUs4RRNBgenmgvT2PEtmRlgLDtZw0p
 pCxqSnnK6pE8qwsMK/I5d0nJ4NNkcCqtklT/sQFfYZ9+8cdwWVtBl4PKZ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="313447520"
X-IronPort-AV: E=Sophos;i="5.96,210,1665471600"; d="scan'208";a="313447520"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2022 14:00:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="675600957"
X-IronPort-AV: E=Sophos;i="5.96,210,1665471600"; d="scan'208";a="675600957"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 01 Dec 2022 14:00:24 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 1 Dec 2022 14:00:24 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 1 Dec 2022 14:00:23 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 1 Dec 2022 14:00:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aUCCGlJ1chsOH816KeWDMRunDtWIFXjjSNZe30qoyYvPJjMvzUrpu+BqMylXhro4lBjlFEeYrvBRsus5/43iqRsZHL1B1iI+Wmd2zMYrooWm9e+Sd1S78Wdqh10f/0WNtBKs1eFUMFdhw+wIimPpdY4LzeVG93h8MSyWdZ5NpXLwLRw3gqV322fB7EZCtrykz2yZDIJ3B66/my+p3fidQRboWXnxiPcqNe0ZTahOR1u/Lv0AfrEq0DTqF0DdXaiQR/2qRbq3f+lu3+2d+hYQmAKCcE6cH2BHHcUcmeHwAg3Ajdsu13v9om0HKQdnaFlRDYeNuPSwwwvodg5E/22AAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zW+ut5953W+wNGpmF0oFDXVC9+UdimasJcURxd+jufM=;
 b=lvpZH9bqRD6oLFjcC33fCgRAx4dD82AoX9u7E0hMOHSMtLzEhZv07qXQjBkpwSpBEJ6faqhC04dLblTDjPaF4gedA6++fSsW+/oXaHH2z+GP//aMXfrLpoTfFWlErZaOfkswAcZwD6MoCOrFkyMMc4czN/pIXyjyJ9BS5GntIWaxhXNvkhElzwAoh4JWIP7XE0Hm/pf3GFBCrZ4l3Bgb3jWRI7oEtmfAHNLXsjAP0Fds+9cWxE2SZGZ5Pq7J9qzuOZVN2fSAHEXJaIOWjvFM/tjd6JVNNYGLGjFN3Cu1IJpiWEdjssKEAVDKp0R3LAdVjqQ0Lo0QpAX/WuvPU5Xz+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 DS7PR11MB6150.namprd11.prod.outlook.com (2603:10b6:8:9d::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5880.8; Thu, 1 Dec 2022 22:00:21 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::6894:1dbc:4681:66b6]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::6894:1dbc:4681:66b6%4]) with mapi id 15.20.5880.008; Thu, 1 Dec 2022
 22:00:21 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 3/6] drm/i915/gsc: GSC firmware loading
Thread-Topic: [PATCH 3/6] drm/i915/gsc: GSC firmware loading
Thread-Index: AQHY/f7QYgDO5ACkHEaRfKekorOOuK5ZpU4A
Date: Thu, 1 Dec 2022 22:00:21 +0000
Message-ID: <28a594827c786b083cf27ee2c5d6c25a1a716284.camel@intel.com>
References: <20221121231617.1110329-1-daniele.ceraolospurio@intel.com>
 <20221121231617.1110329-4-daniele.ceraolospurio@intel.com>
In-Reply-To: <20221121231617.1110329-4-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|DS7PR11MB6150:EE_
x-ms-office365-filtering-correlation-id: 7c9636a6-411c-4f60-36a7-08dad3e7713e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sIgP0khnVZXKOR7iOkKi7My58qPag7boqprZHDOPOEABjwg2NPfO7Qp94ewWxyomfOkbq21yuZ7Snbk8eyv6hP6x2aH/dBmQmfoKrHxZQcEJP8b8yWRlGnV66cDgeU0gIaHFW8IkwiWBiq5UjzKFx7mTD+BvxjN8EYddpg5m3eWTl/2e/h8b2s9rSRdHrh6RCpICpNGb2C3cYjkUE0yGIwHR+XgmMvpYS2G8i5Vad2FAQjHRWL4ZQL2giGPKPnmqOP7CWXiyx6S4T3cTvGAvQZt1GltyZ3lkQEy8OzzIPIGdICzMobyV+ejyRl9iNXRqrq2DIAup7AqqPTpFAb5oXzZP73NrjnoR7KDybDzhPgK1XcQbc0LtgawfU/W5WrSv63fYCrJs1jqoaGZ0SWZeOxH7CUw/tvq+7soJ9l/Cb14XnNVqkohvc9P9EfwJTHWZsPVGh6yYC/L3nvN5OWVDgWTd7DFh9Aba1/bAoHW5t3t0ruwIFm4jpxfoMoJ8teXhv8ymFPtzAd8zOni7VAuIeM9dic2E309TJ2RYtwbjurbZagbaiS8w1rNx5phA0popybtFHGNbb7IFdqc84jZz/XPzM7U356+F6tGDw1UxTQHEuVoiA224Mm6czWXwXGI6wzhAXdYnxLdpP+jDA3PDOK0+J2uymXWuQV7DhTAFOQeBndBCMWWjlp+Ne/kzthmpramANMzH3P//9hDBJdWiVg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(39860400002)(376002)(136003)(346002)(366004)(451199015)(4001150100001)(2906002)(66556008)(91956017)(76116006)(186003)(41300700001)(2616005)(36756003)(86362001)(122000001)(38100700002)(82960400001)(6512007)(26005)(110136005)(54906003)(38070700005)(450100002)(8936002)(5660300002)(4326008)(8676002)(66946007)(66446008)(66476007)(64756008)(4744005)(478600001)(71200400001)(6486002)(316002)(6506007)(107886003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y2FqQVhiQW9TUDRTcncwMG8yRUZUS0V6elVaNjVXMm5Fb0hhR3BnQyt6ZDdu?=
 =?utf-8?B?d0c0MUpDQVB0ZFRHdnQwRlZQbS9oR1poRkVRZkNJUW4za0wreThyTzZ6T1FK?=
 =?utf-8?B?Y3psOXgyQTdrVTZJdmw5MXFFU3h5U0djVVVMV2NsZVRNYlRxYlZXY0NTbHlW?=
 =?utf-8?B?amh4MDZVd3lHQ0dvT2p4ZGNPd2sxWG1aNitNbWJPTUFlTjJGVFJZSTV4VnZh?=
 =?utf-8?B?dER0ZzdpYm8yRjhTQ2MyNUJadjR6QVZVdVRZOGw2UHE2R3RRWDgyVXdNUFJV?=
 =?utf-8?B?MDBoemdwd2doY0JxdHdEUzlNUmVQN2JSRksyQlEwUXhoUlhhNGZiSEhGLzA4?=
 =?utf-8?B?T0pJZHN0UHMxZEFpM3dlR3MrbWsveEx4RkQxWDJmSGtsdEtWYjNaRkRSTzRZ?=
 =?utf-8?B?aExrSXF3VVIxY084NFFMb2Q5UVNLN3NqU0F5Y1hreHl2M0U2Tm1iNjF0S09R?=
 =?utf-8?B?Tk5Hb0Jyd3g0MmUxZUZrQmYvT0h0NTZGY3p1aTFpdU9sRlNqQnZpR0NRdVhH?=
 =?utf-8?B?bW5OdzhTWkV0aStCR04vT3F4ZlZtRldlQ1NxZklidGJDMnlEaEs5R1lOM3dH?=
 =?utf-8?B?dTZleGl1dkMzaVhURXYzNFc1SDFGQXJlQW1HR2xzT2ZidG5BQUh2enBTaXFB?=
 =?utf-8?B?d2M5VzZVVWRTRU5ad0lBYllhZUZlMWQ2VEJ4Qk5ZVzRuazYyd1dod2RwckdX?=
 =?utf-8?B?NUFKbGNiMUhtM3YzdGNrWTNBYXJrRGFqSnFOczFJRGIzekNqREliOXVLK3pw?=
 =?utf-8?B?M1ljRnVBLzdHQUpuMXJsOVRyS0xoZnROSjBVekhOS1Z1aGxDT1c3Y3lXTmcz?=
 =?utf-8?B?M1FzNXpkS0N1WFk3YXN2V0pGbjU0cXg4Qmp3QXdBTWpMU0xtOUM1Sm5SNzUr?=
 =?utf-8?B?WTNsdncyTFhNMWI3WlNGQXBtNW9NOXM4Z3ZLeFd1aXhmaFJtcFNCOUhwTWVW?=
 =?utf-8?B?K3llOGNqeUJRbzNDd05oYWNaS2I0ZDh4WFQyVUc2bC84TG5PRnh1Rm4wK01T?=
 =?utf-8?B?TjBCamJweVYyMXh0UWxKQVFsZ1Rqckx4NTV1Y0NnbmF1UGw2dDgrN3NDN0VL?=
 =?utf-8?B?Wk90SGdyWUFXcjlKZEZGVlpsdkl6MSsrOXRKdU5XOExaQm1GMmQzSVNpQUVp?=
 =?utf-8?B?cERIUE1HV0Q0ZytoNHZVUTVvcVVqNWFMbTBSb3VJNlByc1hldkoxalRQUGRB?=
 =?utf-8?B?UzNCeDU1czRwZDNZeU4rcGg4K1NtK2g1Y3ZmRGNSU2htaGhreHBpUU0vS1po?=
 =?utf-8?B?SFVWOXZlT2pKOE9IZTM2S2hUVFJnS2VXU1ZiNUp4N2w5QnlWZFV6cnZ4YWtI?=
 =?utf-8?B?cHF2VmlTaFBmaEFPTTNCMGIxUDNLTzU5TzcrcmlZYmxQMXU1K3FWeW5McTls?=
 =?utf-8?B?bndZU0FGaUFLTUFDb0JqUStWcEpHeFRlRXVJc3FmdWxycmY0djd2dVE4RlFE?=
 =?utf-8?B?YTBZUWVVV1lJMkQ5bHA0dTNNRUliTXorOVI4NmxUejNoTTV2OVQ1cEpjOHgv?=
 =?utf-8?B?aWtlUHFUWmtmUGZCL0dTNmt0azBiRWJaU25FUVdXV2p3Tjc0SStsQncyM0c5?=
 =?utf-8?B?YWVWZytnNGNteFZKRDVUakNlWmlFaStIN3k4K000NXNGcS91NENjYzM4WVA0?=
 =?utf-8?B?WGhyYVZ4bTNiV3pFVk5oRmRTT0pEYmx2ZyttYk8vcHg4NXhvek5CVkZ4L1ho?=
 =?utf-8?B?ZWpsNFFWVzhhVGx3aHE5aXY0c3FTQVg2b0NvS0NXS0VtOGhDVWx6QWxQOUl0?=
 =?utf-8?B?NjBhRHF6bWJOZkgrUUhCajRRZzJXQUtjQm9paThMQmxZNmhHcDZZd3VYT0p3?=
 =?utf-8?B?anVTZVVnMk11WmtKUGJYRTlGSUwxSkYwcVJOMi95em84UHpLcEhWcktEZERZ?=
 =?utf-8?B?WTArbUpXaXpZYkRQZEhDdkhWR0FObEVxUEhKSElKc2J1WGRGY1JYUDhVLzJU?=
 =?utf-8?B?bHQ2STIxZk9HOGJPVDZ3K2NKdkZheVRLNkpDLzYydjk2Y051TnhBOFF5eTJr?=
 =?utf-8?B?TFlsbTd3TGJwajMzU3NDdXd5b2NCSlJMb1ZKRFpXMkZOSlp4UFdjZXlZSmJU?=
 =?utf-8?B?UllFckg3OWhYZEtLR2dNb2NUZlBWK2NoZ0VHNkp3bU1KVTVhMjFqVHdhR1Q4?=
 =?utf-8?B?VWxIUU5MSmoxL1NiN3prWWdveFptMHFoaklxblZpUUNlZkwxVGwwOXRDV1hX?=
 =?utf-8?Q?pK8bcType7ldJ8go57Qpln0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0BA5201CD537B145BF883C66E69EA8E1@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c9636a6-411c-4f60-36a7-08dad3e7713e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2022 22:00:21.6999 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ceYurXLJ0AbAviEQB1IoNLWgbAdvM09a20OdvpKhmnyG6GTtJyPbmkK00aS9ACHDTe2jdov73JLDNna4xADKRuoCMgcI8Yo+RS436hVqPF3AZUTvkUtvm9PFOu0Esj7f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6150
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SSBvbmx5IGhhdmUgb25lIG1pbm9yIG5pdHMgYmVsb3cuIFJvZHJpZ28gYWxyZWFkeSBjYXB0dXJl
ZCBvdGhlciBtaW5vciBpc3N1ZXMuIEZ1bmN0aW9uYWxseSwgYWxsIExHVE0gc28NClJldmlld2Vk
LWJ5OiBBbGFuIFByZXZpbiA8YWxhbi5wcmV2aW4udGVyZXMuYWxleGlzQGludGVsLmNvbT4NCg0K
T24gTW9uLCAyMDIyLTExLTIxIGF0IDE1OjE2IC0wODAwLCBDZXJhb2xvIFNwdXJpbywgRGFuaWVs
ZSB3cm90ZToNCj4gR1NDIEZXIGlzIGxvYWRlZCBieSBzdWJtaXR0aW5nIGEgZGVkaWNhdGVkIGNv
bW1hbmQgdmlhIHRoZSBHU0MgZW5naW5lLg0KPiBUaGUgbWVtb3J5IGFyZWEgdXNlZCBmb3IgbG9h
ZGluZyB0aGUgRlcgaXMgdGhlbiByZS1wdXJwb3NlZCBhcyBsb2NhbA0KPiBtZW1vcnkgZm9yIHRo
ZSBHU0MgaXRzZWxmLCBzbyB3ZSB1c2UgYSBzZXBhcmF0ZSBhbGxvY2F0aW9uIGluc3RlYWQgb2YN
Cj4gdXNpbmcgdGhlIG9uZSB3aGVyZSB3ZSBrZWVwIHRoZSBmaXJtd2FyZSBzdG9yZWQgZm9yIHJl
bG9hZC4NCj4gDQo+IEBAIC0yMDYsNiArMjA2LDcgQEAgaTkxNS15ICs9IGd0L3VjL2ludGVsX3Vj
Lm8gXA0KPiAgCSAgZ3QvdWMvaW50ZWxfaHVjLm8gXA0KPiAgCSAgZ3QvdWMvaW50ZWxfaHVjX2Rl
YnVnZnMubyBcDQo+ICAJICBndC91Yy9pbnRlbF9odWNfZncubyBcDQo+ICsJICBndC91Yy9pbnRl
bF9nc2NfZncubyBcDQo+ICAJICBndC91Yy9pbnRlbF9nc2NfdWMubw0KPiANCk5pdDogUGVyaGFw
cyB3aGlsZSBoZXJlLCB5b3UgZml4IGFib3ZlIHRvIGJlIGFscGhhYmV0aWNhbCAtIGkgdGhpbmsg
dGhhdHMgdGhlIHByYWN0aWNlPw0KPiANCj4gDQoNCg==
