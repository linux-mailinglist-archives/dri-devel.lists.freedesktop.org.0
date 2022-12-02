Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E6A640FF0
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 22:24:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF90F10E72E;
	Fri,  2 Dec 2022 21:24:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E56910E72C;
 Fri,  2 Dec 2022 21:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670016255; x=1701552255;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=mGXdrmzo+kJ7vEnYMZIzSzAnldIBrZR30xqpj+TD3B0=;
 b=bUBERbjl6sqSWXc4SvTkpLlDSxOurFgorQV3kfc6ao/NB7QpZh78y2G8
 sEsgpOpVGEaw4TmImwLN+UGhRyTR15uwjgoNeMbwkWbAt4d0IdwNboz6k
 ZsBqdCqjh1tXmxMFbwuZyR+3obKOK5EyGMHRw21ljGORgte4s+cSgXlc6
 723SMxtd7yi4Xe2lrzhcDDnldWuTSQ5GwcK0rTvRD2RSUDSXaFbp93P99
 6xDeg0F956XMc6RGTJnn0l0GgknDYBiDiAvitJ+saaLuie9mbPxux0tYs
 rFs9+uAbj8sAS29Fb85hhLlmM2TjkZU6vykV3d9+hNeEn9N+IpR8qVHBU A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10549"; a="296407498"
X-IronPort-AV: E=Sophos;i="5.96,213,1665471600"; d="scan'208";a="296407498"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2022 13:24:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10549"; a="595581993"
X-IronPort-AV: E=Sophos;i="5.96,213,1665471600"; d="scan'208";a="595581993"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP; 02 Dec 2022 13:24:13 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 2 Dec 2022 13:24:13 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 2 Dec 2022 13:24:12 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 2 Dec 2022 13:24:12 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 2 Dec 2022 13:24:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cria5IlZCv1j6Uz8S5qU72unyduVfcmnVMvU+kDzu8hKBUlVHee7paGsZs6wc/k6fRgZ8q5w8aS/tcgWU7BjjdL6ZjDrBMjFotEKkjXQae4rzxssxUe5CPsVf4EtMV3w1mjLTPFIbL27TJf4R0fgUdlHRXJKteVSsjIML002czrWOc0K5Z4Li9+uAxk4OvsPYvHyY6gsa1LfO4cHqFh8Olx6RZjxGO4hy7Nn+ASWAbh3uD7mNTb7MTlnlvV08aFOMf/kUfzObZ2PHw8TRr9nmRsbIQslYh/TI/hoFTIsCs66aqzGex8uD3fhq4kifuwoi03nbhar+eZ7qfndTvqWYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mGXdrmzo+kJ7vEnYMZIzSzAnldIBrZR30xqpj+TD3B0=;
 b=LGZZxa8SFg2g+KTsDjmM68V1KaDFL4IvGt/7Qa8YkbbeMtpN1o0CK1Ah1a6E8iYK9T8ry3oaRtvIQTjdgeP3leek6H9NT3H+9SKRC9/spf1ToyKk9Va3NY6KmyI6BLrim7hb6HHl+gbbLDbyg2V5UlE7elog+SS9De2TcLR+TkPcZcOIktKCfp5OrfDajmFWyACqBbPc7w94CLGS8U1juApVjneXuInHjZHAKYIGy2AYr6j1rXtHrKye0AWvMe/7I6T58pQWCm2EB2DxDT5e7sdR2gEhLLQXDv+TxBtUZQZM+MGEQm5DCxaXvpDNgslQutR/Bd4mXM5+4+Mh6q0ydw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW3PR11MB4699.namprd11.prod.outlook.com (2603:10b6:303:54::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Fri, 2 Dec
 2022 21:24:11 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::499c:efe3:4397:808]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::499c:efe3:4397:808%7]) with mapi id 15.20.5880.008; Fri, 2 Dec 2022
 21:24:11 +0000
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
Subject: Re: [Intel-gfx] [PATCH v7 1/1] drm/i915/pxp: Promote pxp subsystem to
 top-level of i915
Thread-Topic: [Intel-gfx] [PATCH v7 1/1] drm/i915/pxp: Promote pxp subsystem
 to top-level of i915
Thread-Index: AQHZBesPqg3EyWzNg0SYQKwNkfFViK5ayM4AgAAyDACAACIkgA==
Date: Fri, 2 Dec 2022 21:24:10 +0000
Message-ID: <8d1da6c988a1163c38bc7958882cfa0b53f834bc.camel@intel.com>
References: <20221202011407.4068371-1-alan.previn.teres.alexis@intel.com>
 <Y4omWlWLDvtPMVxG@intel.com>
 <0b6ea10288b9a350969b62393bda588ac5fa735f.camel@intel.com>
In-Reply-To: <0b6ea10288b9a350969b62393bda588ac5fa735f.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4 (3.44.4-2.fc36) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB6059:EE_|MW3PR11MB4699:EE_
x-ms-office365-filtering-correlation-id: a32fd938-4bd8-4b88-b168-08dad4ab8de0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5G03m42vB2OQnENCnkuPC8mraq8wRzL0/wx7mWEQTvR4Up0eIT0K+SevAQvAu32Ai3kI5aWRI9cn6TdN0fNYQWDifOLKc4osOVSuCKanzM3/SpeihrQbjF2INpT4QtiL9M2kEVexshjod+xhkcn0Q1PS0vosxGAMK5hKlUwl56ynTwOxqeLCUyRXxrt6sX9C2zddpXHkVPenTfxTt1/jNYmtLkIhdlcWPjMa3tdBrrvZXifYQKZCBfp10iSaITF4kUaE1zD8pA8X17zCncwGZrRsdYVMd2AQ/LHxSfszmYF3oxbK7aEXzYttu0+XhC8QSoBeEw15Y9HuwLRoU8MO5phFrE3Avw/BSO50MQs0RnPAcEibMp23g685xoiuwAjWi4Tv2MrOSh7E0UJop+wc4mCE6JiUCln6FOg97pNVQjuQch7xsLKfpY4DEUnkhfRU/VC/vt+2Qb8eAhK+R/QGOf7FoI0GZ9ujeOv6Szz9/CZALac4Z6qG8Cfoci4sN2SsQSvmoVlgj9Gtj3lWfbp/PH1kE+lW+BpPlrm1FB3ny8rXwFgxBPPcwNQPZi3us7cH8dvyyZOf7xbGJGVIt4mKDWXFDNDNAM+fAEX4WKU0POpnUkT732I64r82cxCkocrpsjMcMZKPtfGCoFTFlOUIwg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(346002)(366004)(136003)(396003)(376002)(451199015)(478600001)(86362001)(6512007)(6486002)(6506007)(966005)(71200400001)(36756003)(38070700005)(38100700002)(2616005)(122000001)(83380400001)(26005)(186003)(41300700001)(5660300002)(82960400001)(66556008)(4326008)(66946007)(64756008)(66476007)(450100002)(91956017)(66446008)(76116006)(8936002)(8676002)(6862004)(316002)(6636002)(37006003)(2906002)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b0l2VEo1dVF1cWwweXc5dzkyNjI0VnRaM05DdUUyT1JSeHRYQjVGd0VSaFZT?=
 =?utf-8?B?SlBUZ1cxd3JsWHlNZVhabEtQTE5UaFlWR2Q5UXJyRGM3WGdMWFRUYTQ1NHZU?=
 =?utf-8?B?OXd1cjYxUWoyTkZTaG1nZEt4Q213dnZJTm9FT24vbFNJMGw5TU9vemZmMXdK?=
 =?utf-8?B?SkxNN0htTjNxd2J1dGpZQVNsaSt5T0xFVTg5ZjUwaGt6SmFpbk5EOHJqT21r?=
 =?utf-8?B?aUhXT2NQNUZ3UkVkTmVvTGhCRDZJS1Qzc1dvVzFnWmFiWWxZU3F5ZlUrb3J2?=
 =?utf-8?B?RGFJK0dnWThzQWV1WTIyOG15cnZKcFdzeVM5cWNpZFRtek5qUjhaRWttaG9T?=
 =?utf-8?B?eW90NVFOOVhSSGtBMCtuNGtWQzJoeGpCc2drMHpEUXpFZzJZNXcrUWhpMTk3?=
 =?utf-8?B?T210NDVXS1pHWkMza3A3M0VRZ2s4ajNqWWdKZXVYbTRvZ1liSVhnWUtwRDJ2?=
 =?utf-8?B?NGhxU3g3aFN2N3RLNUZLamFueGlPVnJDYS81YWJFV3FHUWNYYWdHSzJIeE9y?=
 =?utf-8?B?bzY2UWRwYXJ5SjlHc0lpU2cyeGxYNXhSdzhWaVdoVVdzT29lbXE1WnI0ck1R?=
 =?utf-8?B?bmlESU12NERpL0RydzArYnU5ait4MlI5T0kzV1h3KzBBbG0reTM3clFpYU1R?=
 =?utf-8?B?b3JzUEJNdFQ3U3VZT3Z6VVVWZlB5K2tXWENCSjBpQVNLanNZQnpFMTRGRDZn?=
 =?utf-8?B?TGl5MFEzeXdsOHExeTc3ajhQRjB2aUFmeFhKNzBEaGFZd3F1ZDZrSzFrbExv?=
 =?utf-8?B?bDRrckRHZEJ4RjdWam9reGhONDRJYVFEeFZUNFoyZDRZMWZVUGRmMEEvZmN5?=
 =?utf-8?B?MnZtN0h4YUthL1FDekFzbzh0SmZOZDJjTjRoNmNKTmYxaVYwSlNJYjRwRFBj?=
 =?utf-8?B?NWF2aFQ5UkI5MUttTk0yT0tTZmhiUEhiYVNxT0dFbEQxdWx6K3FsSWcyQW1F?=
 =?utf-8?B?R0VobEVJc2w0em1WamhoVUpNSGdxUC9JWkFVYTFLZzc2WnJIY2lJVi8yVFRm?=
 =?utf-8?B?NWV2SkE1d01jT2YvdldxMkpCU2U4bHltN1B3STF5enhDZjR4ZFhjZGlWNXJz?=
 =?utf-8?B?empSYVpyWURoMEM0U0x5WVY1MXJ0V2FPTVRSUzZxOURMRjNZczJBUTBFd29o?=
 =?utf-8?B?U1o4WlFPUEx3bnRVa2I1RDFUWFhtVjY1c3dINnJHaWVGQnZvR0FCZS9OY012?=
 =?utf-8?B?UE9Sek9kVStVdEdmWXZMNEdTbHhhMmxIa1l0R2Q3ZndJdEVYVUpVeVdFa3l1?=
 =?utf-8?B?MmQwK2p4eUQyRlp2UEV0ZnhGcFZuaFpmZm85UmZFWHBGVUJvTVVVZUQvOXE1?=
 =?utf-8?B?TmJlck5qcGNKR0VmNmhMUXRzYndJMlcxOHpGN2dmbjZlNVZIQllZaWFYaTZD?=
 =?utf-8?B?RVg2NkI3djRZM0ZnWG9ZQnpmYVlvM1VkRENPY2tsMk5PQkRUTkZMVTM4UWxV?=
 =?utf-8?B?OWh1TUlpeDNhNFRYNW5sM0trTzZOZGxEd0cxd2VGNjlIeXg1QmpRd1B2OEFI?=
 =?utf-8?B?Wmo0OVB1Y2dhYnhxRGJQVmozNDArZFkwVWxhTXBvNHRCNXk3NzFxanQxZXhP?=
 =?utf-8?B?cHRUMzUrMGxVYkQwVVNyK24zUHBnWnVsNU8zR3pySTY2YW14OXlWdVNBU3hF?=
 =?utf-8?B?ODZiZm5ZWmRTRUp0eURueDVhODJMalVYdG56UjR3cFFFUEhSK2psdzFxc3hV?=
 =?utf-8?B?Nml1Wkx4WUxYUW1FeG96RWJDOFEyRTl3RmN2aEx4U3F4Snp5OGF6QTkwMXFq?=
 =?utf-8?B?SktLb2JOQ1l4Z2c1ZDRMbHYwbzYySExhMkFhT1Z2SjBMazRZM3VabGhoaUtu?=
 =?utf-8?B?cXJLS2twaFJUYnU2NWRzMnVieFBmNW1BZzY5MHJPaHZRTUM3eDdkeFE0MUhv?=
 =?utf-8?B?S2xtYXFOamxQdE01YTQzMC8rZXRzd0JpYXFHWm1BM1pneDhvM0x0SVM3ZmJh?=
 =?utf-8?B?OGs1UlpzcEhsZGUvYkxDUGYxV0hpV25vQm1kNExiUlB1YlQ2OGxwOVhveXJn?=
 =?utf-8?B?QXNDODNuSHBHcWdnbmQzT3YrMFJ3R1dUNzA0Z1h1bkN2VU9ybDFtVGorb2g3?=
 =?utf-8?B?L3lGeTdOS1N4WDk5NVZHYjczdkZoTlJRdEJrRUxBK0Q0aE1ONmZ6R08wUnRF?=
 =?utf-8?B?TTlxdE5nQmpqVjNNQk0vOCtqYUt3YnZFSVgzaENKM3hGUGx0S2ZsOVB5Tjdj?=
 =?utf-8?B?MVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3EEBC96FCA8DE3409CA525F111DC724F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a32fd938-4bd8-4b88-b168-08dad4ab8de0
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2022 21:24:11.0530 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oTjG9ZYQtfXItvMJFosrqHd4RfIwgNM6D9FgEq7QOP4yioZBBSLvteIwvTM858m7YxtcI7/QE45/ot4QoXRdQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4699
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIyLTEyLTAyIGF0IDE5OjIxICswMDAwLCBUZXJlcyBBbGV4aXMsIEFsYW4gUHJl
dmluIHdyb3RlOg0KPiANCj4gDQo+IE9uIEZyaSwgMjAyMi0xMi0wMiBhdCAxMToyMiAtMDUwMCwg
Vml2aSwgUm9kcmlnbyB3cm90ZToNCj4gPiBPbiBUaHUsIERlYyAwMSwgMjAyMiBhdCAwNToxNDow
N1BNIC0wODAwLCBBbGFuIFByZXZpbiB3cm90ZToNCj4gPiA+IFN0YXJ0aW5nIHdpdGggTVRMLCB0
aGVyZSB3aWxsIGJlIHR3byBHVC10aWxlcywgYSByZW5kZXIgYW5kIG1lZGlhDQo+ID4gPiB0aWxl
LiBQWFAgYXMgYSBzZXJ2aWNlIGZvciBzdXBwb3J0aW5nIHdvcmtsb2FkcyB3aXRoIHByb3RlY3Rl
ZA0KPiA+ID4gY29udGV4dHMgYW5kIHByb3RlY3RlZCBidWZmZXJzIGNhbiBiZSBzdWJzY3JpYmVk
IGJ5IHByb2Nlc3MNCj4gPiA+IHdvcmtsb2FkcyBvbiBhbnkgdGlsZS4gSG93ZXZlciwgZGVwZW5k
aW5nIG9uIHRoZSBwbGF0Zm9ybSwNCj4gPiA+IG9ubHkgb25lIG9mIHRoZSB0aWxlcyBpcyB1c2Vk
IGZvciBjb250cm9sIGV2ZW50cyBwZXJ0YWluaW5nIHRvDQo+ID4gPiBQWFANCj4gPiA+IA0KPiBB
bGFuOiBbc25pcF0NCj4gDQo+ID4gPiBAQCAtMTE2OCw2ICsxMTc2LDggQEAgc3RhdGljIGludCBp
OTE1X2RybV9wcmVwYXJlKHN0cnVjdA0KPiA+ID4gZHJtX2RldmljZSAqZGV2KQ0KPiA+ID4gwqB7
DQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmk5MTUgPSB0
b19pOTE1KGRldik7DQo+ID4gPiDCoA0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgaW50ZWxfcHhwX3N1
c3BlbmRfcHJlcGFyZShpOTE1LT5weHApOw0KPiA+ID4gKw0KPiA+ID4gwqDCoMKgwqDCoMKgwqDC
oC8qDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgICogTkIgaW50ZWxfZGlzcGxheV9zdXNwZW5kKCkg
bWF5IGlzc3VlIG5ldyByZXF1ZXN0cw0KPiA+ID4gYWZ0ZXIgd2UndmUNCj4gPiA+IMKgwqDCoMKg
wqDCoMKgwqAgKiBvc3RlbnNpYmx5IG1hcmtlZCB0aGUgR1BVIGFzIHJlYWR5LXRvLXNsZWVwIGhl
cmUuIFdlDQo+ID4gPiBuZWVkIHRvDQo+ID4gPiBAQCAtMTI0OCw2ICsxMjU4LDggQEAgc3RhdGlj
IGludCBpOTE1X2RybV9zdXNwZW5kX2xhdGUoc3RydWN0DQo+ID4gPiBkcm1fZGV2aWNlICpkZXYs
IGJvb2wgaGliZXJuYXRpb24pDQo+ID4gPiDCoA0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoGRpc2Fi
bGVfcnBtX3dha2VyZWZfYXNzZXJ0cyhycG0pOw0KPiA+ID4gwqANCj4gPiA+ICvCoMKgwqDCoMKg
wqDCoGludGVsX3B4cF9zdXNwZW5kKGRldl9wcml2LT5weHApOw0KPiA+IA0KPiA+IGlzIHRoaXMg
cmVhbGx5IG5lZWRlZCBoZXJlIGluIHRoZSBzdXNwZW5kX2xhdGU/DQo+ID4gd2h5IG5vdCBpbiBz
dXNwZW5kKCk/DQo+ID4gDQo+ID4gSW4gZ2VuZXJhbCB3aGF0IGlzIG5lZWRlZCBpbiBzdXNwZW5k
X2xhdGUgaXMgcmVzdW1lZCBmcm9tIHRoZQ0KPiA+IHJlc3VtZV9lYXJseSwNCj4gPiB3aGF0IGRv
ZXNuJ3QgbG9vayB0aGUgY2FzZSBoZXJlLiBTbyBzb21ldGhpbmcgbG9va3Mgb2ZmLg0KPiA+IA0K
PiANCj4gQWN0dWFsbHkgdGhpcyBwYXRjaCBpcyBOT1QgY2hhbmdpbmcgdGhlIGNvZGUgZmxvdyBv
ZiB3aGVuIHRoZXNlIHB4cA0KPiBwbSBmdW5jdGlvbnMgYXJlIGdldHRpbmcgY2FsbGVkIGZyb20g
YW4gaTkxNS1sZXZlbA0KPiBwZXJzcGVjdGl2ZSAtIGkgYW0gbWVyZWx5IG1vdmluZyBpdCBmcm9t
IGluc2lkZSBndCBsZXZlbCB0byB0b3AgbGV2ZWwNCj4gdXA6DQo+IA0KPiBPcmlnaW5hbCAtLT4g
aTkxNV9kcm1fc3VzcGVuZF9sYXRlIGNhbGxzIGk5MTVfZ2VtX3N1c3BlbmRfbGF0ZSBjYWxscw0K
PiBpbnRlbF9ndF9zdXNwZW5kX2xhdGUgY2FsbHMgaW50ZWxfcHhwX3N1c3BlbmQNCj4gUGF0Y2gg
LS0+IGk5MTVfZHJtX3N1c3BlbmRfbGF0ZSBjYWxscyBpbnRlbF9weHBfc3VzcGVuZCAoYmVmb3Jl
DQo+IGNhbGxpbmcgaTkxNV9nZW1fc3VzcGVuZF9sYXRlKQ0KPiANCj4gUHV0dGluZyB0aGF0IGFz
aWRlLCBpIHRoaW5rIHRoZSBvcmlnaW5hbCBjb2RlIHdhcyBkZXNpZ25lZCB0byBoYXZlDQo+IHRo
ZSBzdXNwZW5kLXByZXBhcmUgZG8gbmVhcmx5IGV2ZXJ5dGhpbmcgZXhjZXB0DQo+IGRpc2FibGUg
dGhlIEtDUiByZWdpc3RlcnMgd2hpY2ggaXMgcG9zdHBvbmVkIGluIG9yZGVyIHRvIGhhbmRsZSBh
DQo+IGZhaWxlZCBzeXN0ZW0tc3VzcGVuZC1wcmVwYXJlIChhZnRlciBweHAncyBzdXNwZW5kLQ0K
PiBwcmVwYXJlKS4gQSBmYWlsZWQgc3lzdGVtLXN1c3BlbmQtcHJlcGFyZSAoYWZ0ZXIgcHhwJ3Mg
c3VzcGVuZC0NCj4gcHJlcGFyZSkgd291bGQgYmUgcmVjb3ZlcmFibGUgd2l0aCBuby1vcCBmcm9t
IHB4cCdzDQo+IHBlcnNwZWN0aXZlIGFzIHRoZSBVTUQgd291bGQgYmUgZm9yY2VkIHRvIHJlY3Jl
YXRlIHRoZSBweHAgY29udGV4dA0KPiB0aGF0IHJlY3JlYXRlcyBhcmIgc2Vzc2lvbiBhZ2FpbiBh
bmQgYmVjYXVzZSB0aGUgS0NSDQo+IHJlZ2lzdGVycyBoYWRudCBiZWVuIGRpc2FibGVkLCBub3Ro
aW5nIG1vcmUgaXMgcmVxdWlyZWQuIEknbSBub3QgMTAwJQ0KPiBzdXJlIHNvIEknbGwgcGluZyBE
YW5pZWxlIGp1bXAgaW4gdG8gY29ycmVjdCBtZS4gDQo+IA0KPiBUaGF0IHNhaWQsIHRoZSBiZXR0
ZXIgd2F5LCBmb3IgY29kZSByZWFkaWJpbGl0eSwgd291bGQgYmUgY29tcGxldGVseQ0KPiBza2lw
IGhhdmluZyBhbiBpbnRlbF9weHBfc3VzcGVuZCBhbmQganVzdCBkaXNhYmxlDQo+IHRoZSBLQ1Ig
aW4gaW50ZWxfcHhwX3N1c3BlbmRfcHJlcGFyZSBhbmQgaW5zdGVhZCBhZGQgYW4gaTkxNSBjYWxs
YmFjaw0KPiBmb3IgcmVzdW1lX2NvbXBsZXRlICh3aGljaCBpcyB0aGUgc3ltbWV0cmljYWwNCj4g
b3Bwb3NpdGUgb2Ygc3VzcGVuZF9wcmVwYXJlIGFuZCBzdXJwcmlzaW5nbHkgbm9uLWV4aXN0ZW5k
IGluIGk5MTUNCj4gY29kZWJhc2UpIGluIG9yZGVyIHRvIHJlLXN0YXJ0IGtjciByZWdpc3RlcnMg
dGhlcmUgZm9yDQo+IHRoZSBjYXNlIG9mIGEgZmFpbGVkLXN5c3RlbS1zdXNwZW5kLXByZXBhcmUg
b3IgY29tcGxldGlvbiBvZiByZXN1bWUuDQo+IEkgaGF2ZSBhIHNlcGFyYXRlIHNlcmllcyB0aGF0
IGlzIGF0dGVtcHRpbmcgdG8gZml4DQo+IHNvbWUgb2YgdGhpcyBsYWNrIG9mIHN5bW1ldHJ5DQo+
IGhlcmU6wqBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvNTEzMjc5Lz9z
ZXJpZXM9MTExNDA5JnINCj4gZXY9McKgYnV0IGkgaGFkbid0DQo+IHJlbW92ZWQgdGhlIGludGVs
X3B4cF9zdXNwZW5kIGJlY2F1c2UgaSBhbSBub3Qgc3VyZSBpZiB0aGUgaTkxNS0NCj4gcmVzdW1l
LWNvbXBsZXRlIGNhbGxiYWNrIHdvdWxkIHN0aWxsIGJlIGNhbGxlZCBpZiBpOTE1DQo+IGl0c2Vs
ZiB3YXMgdGhlIHJlYXNvbiBmb3IgdGhlIGZhaWxlZCBzdXNwZW5kLXByZXBhcmUgQU5EIHRoZSBw
eHAtDQo+IHN1c3BlbmQtcHJlcGFyZSBoYWQgb2NjdXJlZC4gU28gaSBuZWVkIHRvIGNyYWZ0IG91
dCBhDQo+IHdheSB0byB0ZXN0IHRoYXQuDQo+IA0KPiBEbyB5b3Ugd2FudCB0byBjb250aW51ZSBw
dXJzdWluZyB0aGUgZmluYWwgZml4dXBzIGZvciBweHAncyBzdXNwZW5kLQ0KPiByZXN1bWUgZmxv
d3MgaW4gdGhpcyBwYXRjaD8gQWdhaW4sIGkgYW0gTk9UIGNoYW5naW5nDQo+IHRoaXMgZmxvdyAt
IGp1c3QgbW92aW5nIGl0IGZyb20gaW5zaWRlLWd0IHRvIG91dHNpZGUgZ2VtLWd0IHdoZXJlIGZv
cg0KPiBzdXNwZW5kIHdlIG1vdmUgaXQgb3V0c2lkZS1hbmQtYmVmb3JlIGFuZCBmb3INCj4gcmVz
dW1lIHdlIG1vdmUgaXQgb3V0c2lkZS1hbmQtYWZ0ZXIuDQoNCk9oISBva2F5LCBsZXQncyBtb3Zl
IHdpdGhvdXQgY2hhbmdpbmcgdGhpcyBmbG93IGluIHRoaXMgcGF0Y2ggYW5kIHdvcmsNCmluIGEg
Zm9sbG93IHVwLg0KDQo+IA0KPiA+ID4gDQo+ID4gPiANCj4gDQo+IEFsYW46IFtzbmlwXQ0KPiAN
Cj4gPiA+ICsNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqBpOTE1X2dlbV9zdXNwZW5kX2xhdGUoZGV2
X3ByaXYpOw0KPiA+ID4gwqANCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqBmb3JfZWFjaF9ndChndCwg
ZGV2X3ByaXYsIGkpDQo+ID4gPiAraW50IGludGVsX3B4cF9pbml0KHN0cnVjdCBkcm1faTkxNV9w
cml2YXRlICppOTE1KQ0KPiA+ID4gK3sNCj4gPiA+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCBpbnRl
bF9weHAgKm5ld3B4cDsNCj4gPiA+ICsNCj4gPiA+ICvCoMKgwqDCoMKgwqDCoG5ld3B4cCA9IGt6
YWxsb2Moc2l6ZW9mKCpuZXdweHApLCBHRlBfS0VSTkVMKTsNCj4gPiA+ICvCoMKgwqDCoMKgwqDC
oGlmICghbmV3cHhwKQ0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVy
biAtRU5PTUVNOw0KPiA+ID4gKw0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgaTkxNS0+cHhwID0gbmV3
cHhwOw0KPiA+IA0KPiA+IGk5MTUtPnB4cCBpcyBhbHJlYWR5IGFuIGludGVsX3B4cCAqLCB3aHkg
Y2FuJ3Qgd2Ugc2ltcGx5DQo+ID4gZG8gDQo+ID4gaTkxNS0+cHhwID0ga3phbGxvYyhzaXplb2Yo
Li4uDQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgIGlmICghaTkxNS0+cHhwKQ0KPiA+IMKgwqDCoMKg
wqDCoMKgwqDCoCByZXR1cm4gLUVOT01FTTsNCj4gPiA/DQo+ID4gDQo+IHllcyBidXQgaSB3YW50
ZWQgdG8gYXZvaWQgdXNpbmcgJ2k5MTUtPnB4cCcgZm9yIGFsbCB0aGUgY29kZXMgYmVsb3cNCj4g
YW5kIGp1c3QgdXNlIGEgbG9jYWwgdmFyaWFibGUgdG8ga2VlcCBpdCBzaG9ydGVyLg0KPiBCdXQg
c2luY2UgdGhhdCdzIHdoYXQgeW91IHByZWZlciwgSSB3aWxsIHJlc3BpbiBhY2NvcmRpbmdseS4N
Cj4gDQo+ID4gPiArDQo+ID4gPiArwqDCoMKgwqDCoMKgwqBuZXdweHAtPmN0cmxfZ3QgPSBweHBf
Z2V0X2N0cmxfZ3QoaTkxNSk7DQo+ID4gPiArwqDCoMKgwqDCoMKgwqBpZiAoIW5ld3B4cC0+Y3Ry
bF9ndCkNCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gLUVOT0RF
VjsNCj4gPiA+IMKgDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgLyoNCj4gPiA+IMKgwqDCoMKgwqDC
oMKgwqAgKiBJZiBIdUMgaXMgbG9hZGVkIGJ5IEdTQyBidXQgUFhQIGlzIGRpc2FibGVkLCB3ZSBj
YW4NCj4gPiA+IHNraXAgdGhlIGluaXQgb2YNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqAgKiB0aGUg
ZnVsbCBQWFAgc2Vzc2lvbi9vYmplY3QgbWFuYWdlbWVudCBhbmQganVzdCBpbml0DQo+ID4gPiB0
aGUgdGVlIGNoYW5uZWwuDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgICovDQo+ID4gPiAtwqDCoMKg
wqDCoMKgwqBpZiAoSEFTX1BYUChndC0+aTkxNSkpDQo+ID4gPiAtwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgcHhwX2luaXRfZnVsbChweHApOw0KPiA+ID4gLcKgwqDCoMKgwqDCoMKgZWxz
ZSBpZiAoaW50ZWxfaHVjX2lzX2xvYWRlZF9ieV9nc2MoJmd0LT51Yy5odWMpICYmDQo+ID4gPiBp
bnRlbF91Y191c2VzX2h1YygmZ3QtPnVjKSkNCj4gPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBpbnRlbF9weHBfdGVlX2NvbXBvbmVudF9pbml0KHB4cCk7DQo+ID4gPiArwqDCoMKg
wqDCoMKgwqBpZiAoaW50ZWxfcHhwX2lzX3N1cHBvcnRlZChuZXdweHApKQ0KPiA+ID4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHB4cF9pbml0X2Z1bGwobmV3cHhwKTsNCj4gPiA+ICvC
oMKgwqDCoMKgwqDCoGVsc2UgaWYgKGludGVsX2h1Y19pc19sb2FkZWRfYnlfZ3NjKCZuZXdweHAt
PmN0cmxfZ3QtDQo+ID4gPiA+dWMuaHVjKSAmJg0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBpbnRlbF91Y191c2VzX2h1YygmbmV3cHhwLT5jdHJsX2d0LT51YykpDQo+ID4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaW50ZWxfcHhwX3RlZV9jb21wb25lbnRf
aW5pdChuZXdweHApOw0KPiA+ID4gKw0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgcmV0dXJuIDA7DQo+
ID4gPiDCoH0NCj4gPiA+IA0KPiANCj4gQWxhbjogW3NuaXBdDQo+IA0KPiA+ID4gwqBzdGF0aWMg
aW5saW5lIHN0cnVjdCBpbnRlbF9weHAgKmk5MTVfZGV2X3RvX3B4cChzdHJ1Y3QgZGV2aWNlDQo+
ID4gPiAqaTkxNV9rZGV2KQ0KPiA+ID4gwqB7DQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0
IGRybV9pOTE1X3ByaXZhdGUgKmk5MTUgPSBrZGV2X3RvX2k5MTUoaTkxNV9rZGV2KTsNCj4gPiA+
IMKgDQo+ID4gPiAtwqDCoMKgwqDCoMKgwqByZXR1cm4gJnRvX2d0KGk5MTUpLT5weHA7DQo+ID4g
PiArwqDCoMKgwqDCoMKgwqByZXR1cm4gaTkxNS0+cHhwOw0KPiA+IA0KPiA+IGhtbW0uLi4gbm93
IHRoYXQgd2UgaGF2ZSBweHAgdW5kZXIgaTkxNSwgd2Ugc2hvdWxkIHNpbXBseSBraWxsIHRoaXMN
Cj4gPiBmdW5jdGlvbg0KPiA+IGFuZCBtb3ZlIGl0IHRvIHNpbXBseSB1c2UgaTkxNS0+cHhwLg0K
PiA+IA0KPiBBbGFuOiBzdXJlIHdpbGwgcmVtb3ZlIHRoaXMuDQo+IA0KDQo=
