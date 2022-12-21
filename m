Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA639653394
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 16:41:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0AA110E464;
	Wed, 21 Dec 2022 15:41:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDD0E10E45E;
 Wed, 21 Dec 2022 15:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671637277; x=1703173277;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=QH4M/7F38yYr/0zEfYUn6aCBKQMJj959jDw0q1raTVo=;
 b=nXdCRDDOdZms+/9gDt0lGQFxrSOT1dBJj9p2kWtBiphNIHKQwY4pzr/I
 sWLXXE8PqvH+AQUs6pUobS/mAyomcxkHgdPFLotKoAP+UeBr5vg0PvRTw
 XALbg94lp3QEc3BiFBHTUZbDT+Pnh9Ff2kGA2TZOWGicIS7eXztCcuIeb
 ggjH60Kw+sDKmHXN46nb+NtCQYzGeRavJBjfsaPcsOLt2Z5XjoVeg9hxr
 nujAki8raFRLiw7ZWiKhtNwo3v2PndIiYN+1Ifw8wK4QDCkuD/D+0Qh6e
 ZvZlMlU8l0vRoRF3+YwfvTLpNB7V44Ng7yBDRPLf5NO0dJl3dNDgcfNtG w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="319950172"
X-IronPort-AV: E=Sophos;i="5.96,262,1665471600"; d="scan'208";a="319950172"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 07:41:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="714850727"
X-IronPort-AV: E=Sophos;i="5.96,262,1665471600"; d="scan'208";a="714850727"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP; 21 Dec 2022 07:41:16 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 21 Dec 2022 07:41:15 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 21 Dec 2022 07:41:15 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 21 Dec 2022 07:41:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m4pVA6qp2krkkwh6OL1LJSGR8HjAQYgdyQH0Zis7emCREvPbeTshUYZhloxvP2ML6IgFOPOvoNHUNax+kfxF3IDJnvw+UrUbNCrRwfryaFYn/cDYaF5llzEMwIpvKErY4rE9uUzd662tsbB3Ecw7u0dYd8f/v9ha5OXH0GlK2RpSNvfdm8xPCjV0MU6ecEy+0gjVPIHJ3aphXIFWwdGQrZcfAq3FjTAeVNW7F2UzIrzVYCMA0UZkVkGCydryG1vyFL0CD8/ukaCZic1p5UZDIuVUCkFU8MfSj2nf3z7vpNkRgLSRN1Q3cZtoGpT+6YguCcaka9V/w1Xqf7xBqngJ1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QH4M/7F38yYr/0zEfYUn6aCBKQMJj959jDw0q1raTVo=;
 b=Ijo5Bz0TXX8iVjJiN+iMs/5pAzbi+GJNP4CJ+YxfF8bvHratDfoU3QrwRtfiKbzLhIJg0b7VnyFbw++0TZrTtkYggtAmPQh64RH8wXLBXN5Ckivoal2dKOHdLHGCONqnbBBU4RXLfCjT6f5/wCAHZjrUYGw5zJEu7qB1f9xySdvim50lrtMkqW4eGiGBT/zLxQZEH8bB5780Ma3H1oe+6wd65bYzUQmTYyl3Y/8wvtY0vJTjwv82mUhlp8dkLPNTYwruiPzXZoLmac35t+xqewi+sf1L2dFnWB4aXGQq8Evwn/d2UZCJdUXOGIvRSMrLc5fMONzdw3q45fuby6mq1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 SJ0PR11MB5816.namprd11.prod.outlook.com (2603:10b6:a03:427::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Wed, 21 Dec
 2022 15:41:12 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::1a7c:e221:1ca2:f43]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::1a7c:e221:1ca2:f43%8]) with mapi id 15.20.5924.016; Wed, 21 Dec 2022
 15:41:12 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>
Subject: Re: [PATCH 2/2] drm/fbdev: Move damage clip check to higher level
Thread-Topic: [PATCH 2/2] drm/fbdev: Move damage clip check to higher level
Thread-Index: AQHZFS4sL91X6czZk0ay+Xfn3u71g654PpKAgAA8XoA=
Date: Wed, 21 Dec 2022 15:41:12 +0000
Message-ID: <5c5771ca326a6490011eef14cd843b08e933749e.camel@intel.com>
References: <20221221111902.1742095-1-jouni.hogander@intel.com>
 <20221221111902.1742095-3-jouni.hogander@intel.com>
 <f534e1be-50d5-47e9-acb7-8c00a6119d3c@suse.de>
In-Reply-To: <f534e1be-50d5-47e9-acb7-8c00a6119d3c@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|SJ0PR11MB5816:EE_
x-ms-office365-filtering-correlation-id: 5801e5a4-13a6-40b6-7c6a-08dae369c9f5
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gvIaTRYydgoJW9NbHqC/EtjYJAB5yzv0K08HlYY/px3e5WdgJYyqPIlcM/uFEOfQcfMirr0oZbrSfr3ZoRtuseQ9F4FcytjDYHH6TU2O962sUIyZN1XY828sbZ89k2OuITKnxBpwug3gj6rNdikZU0y7LVrVFN6n0C5I4WeGCMD77ztLcYqthi1sXNzbjT/X249650CeHqH8ngZFY5nqrGrPBYpKPbJFIyu1qC1qN9mmidu8LA8QxIFqCyG8Mqoz43ZDlAAhQ3D2NQ9/Dw/mfmXPk04a3fJUgvYulHAj5EyseTborlTDeOOYkjhioaCwemRHjmeeNq5+3Nk9txaJv6A+m9ejczJj0K8whSGjq+86Wh73oyfsDEndkE0oF7gAKL4w3Igt/x5AsQxzLryeeLfuQKmiHwAUzC/dBguDbwjM6G6oQxA50s0BhXelgdcGXoCV5fj8QHkYFq4u4aJ8YoCeF57oeBQkc8ADVXyoOUi5uu9xfuskRxvZPuhGRTISAIjltoBt40XA7Q6EDAc+xLaJFQeQ5R+scMlMC84oTWzESy2kjPXlA3mZhfvi90r13BZqfdW4ThK9tFcv0iG4OQymJ82GtrL69JO7/+E3idpcr5L5pbp3B7LQsi3C5IlSub46tvSvgym8u/0jUsGLoQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(366004)(396003)(39860400002)(376002)(346002)(451199015)(41300700001)(38070700005)(82960400001)(5660300002)(316002)(66946007)(76116006)(4326008)(8676002)(110136005)(6486002)(91956017)(8936002)(478600001)(966005)(36756003)(66476007)(71200400001)(2906002)(4001150100001)(38100700002)(64756008)(66446008)(66556008)(186003)(6512007)(2616005)(107886003)(26005)(6506007)(83380400001)(66574015)(86362001)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R1ErOGJtWjZTR2NRcWpzV2lUSkZJQXJJM3BxRE41RnRNR3FRMEV6OGFXcXdS?=
 =?utf-8?B?QjFiOXp5NFU0T2xvUW1ia3lTeUR6ZjZOT2RLeE9uUC96b01HYWpybTRkSC9X?=
 =?utf-8?B?eXNNeklDRHFXTVRXM2c2blJCWTJaV3g0NGpsUExwb0JtczVWdm82bVMvU3NG?=
 =?utf-8?B?TkdGcE5PUG5RbDd6dHAwVnRycGk3clJOeDAwblQ2aGFVcDFpUHdZUnZaUmRI?=
 =?utf-8?B?QTFQNVdqNEx6cXVSalRzUzBlTzVVd0dkQUJQVnh4QUIwOEhaVGthNlRKNlZY?=
 =?utf-8?B?bm5OMW1oRTFsbjZ5aHFKL3EwWlhUSS9UR2hXY2ZYQmNuenR5UTVKT3NtRTJk?=
 =?utf-8?B?c2FIUUg3SDV4dTAyaFlaeTdrZTU5eFNKSCs1b1JCbzVJWmJYL1doVzkwM0dD?=
 =?utf-8?B?czZTUDdmRExGeHY1RW9yWjV4VVo3aGhhbk1GeDFKamF6dktiNnducjJhdklt?=
 =?utf-8?B?UFAwVDFpZlkzaXhXOGp6Mm5VU1oxK0U1b3lBSU9vTzB6d05CbkZKR3h1VkJJ?=
 =?utf-8?B?WVdDM0ZCYXl4bkh1UTJmN0s1dTNqeGVnMHAxK1VHUHFpcU5PZUtFbTdybTBU?=
 =?utf-8?B?Wk1nbXYyMXArZzFhTHZPMFNaVTRZc2JDL2wxVllra1kvWTNVZDFnbDVFTWNT?=
 =?utf-8?B?cGFnL2FLMmxNNC9rSnh6K1hZYUt3cVJhcWlGckFuZkNlK2dWYUs1VStYcmpN?=
 =?utf-8?B?anNKcGkyMHh1ZXEyR2NyWlZyZVdCUW1yZlVKYzhJOFBwRDNvMXhySWxGeDlD?=
 =?utf-8?B?SUtwUnIzRGkzV2d4VzZNR2tUMktMbktMMU5xQzl2L2U4YWpoZHpMM0VLeElD?=
 =?utf-8?B?eUpSdEd1NitRZkVnWDA2SDBtWXRhZlFFSHZwWlRDWmpzdFBDaFErN0hnbnht?=
 =?utf-8?B?MXhZekh5NWl6Q1VmVnFrTWxUV2hjRFhJdWw1c0R6RThveG9EQ0VyTmlFK0xU?=
 =?utf-8?B?emw5NWhCQVg1Tm1KdWt1S3dZdi9DUTVQbWhGTE44NmxVOC9yVDU5YjRMeDYy?=
 =?utf-8?B?OVFjaXBiZlpjTnNBT3dnZHo1ZnZudmh5Z0E4c2dyUXNIOVlJeFF5empjdTJ1?=
 =?utf-8?B?MVhwWXAydndaeUVLbFFsMHFEbS9SUUZybkhXeTZnWGs3OGhYMGdwUUpRbExn?=
 =?utf-8?B?UGt4emJFZVVIbXhLcTE1Y0ZPU2doZUJGa1JycDNxZGorWVp6OER4U244Rkh6?=
 =?utf-8?B?S01OYy9NV0ZyNEhCeWptTlM4emRxTUJpZ0FRcTBIVDBBbENka01IMm9RQm4v?=
 =?utf-8?B?ZjRIOEhFUmtKK29KakIyN1ZETy84ZVJ2cnlBMFpRVlhudGRJWlVpeVFydEdQ?=
 =?utf-8?B?Q2VuYzN3WnNHVEozYVNoQ0c2YUFrT1VtZlVvQVduZUxMNFpFMjFlRGJlcU52?=
 =?utf-8?B?WDh2Vm9reDhEUVdnbGNUU0dNNjlIQkw2RTVvdGtBcXVVZER5NmVBMmxuVytv?=
 =?utf-8?B?WkNKNWMrL2p2QlNueDF6TVMwWWhMckpGdHRQaFQreVJsMHRVRGgvM050bzhq?=
 =?utf-8?B?NlAvV0lXdXhLRm1OL1JsRWR1cWVuQ040aUtvNGRMSEphTlJOUmZSeXFrbmhH?=
 =?utf-8?B?OE9EYVQ5MDhNVXZTTkNBOFh0V2dJZ3pnd1l5eHFIRjd0aVJrRVdtR3hBRklE?=
 =?utf-8?B?VytqUTRMSStkeU56aVVoOTJ4Y2VTTmlXTzN3T3EvQitETXVWOTBvUG4yM05Y?=
 =?utf-8?B?bHM2MVF5RWovdFhyN2xiQzBjOUJTdGR0TTdYTU5uWGkyWC9wUXMwVk9kMGx0?=
 =?utf-8?B?MW1weUdYZ3hzeUlLbzRzbHVZek0zK2Z2T1hkcEh6QWhRb1oySmw3S3NxRGFX?=
 =?utf-8?B?TUlrVm1MbEdtbmNUZ1dPWGY2d3I5NW0vRDdzS29mZEZyYVlXQ2xnT0xTZnRU?=
 =?utf-8?B?djVWSjZkeU1LaXpLcXRadXhFTDJwVVpvV3V5b3I2R1JKbEQrNGZoeTFaRklP?=
 =?utf-8?B?TW5ndEMrRUdJMi9sZjVrVGpNTmFwMEhMMHZrTlRMd2JMMGs4bHhnY2tkM2Za?=
 =?utf-8?B?bVZwSkhmTGF2bm1UM2o4UnpLTjBVSGFoWXFwWUlCNFBCUFI0UE9EbWRlUE5x?=
 =?utf-8?B?VjVxRUlIMUdRTjViUGJkaUpyV2V0azcyN2xEWWZIc0w5RW43VnhLdVJvbXc5?=
 =?utf-8?B?dEdyczQySllZUG03dWc3TG43UEc4SStVbEQxQUFSUUJ4MzNTbkJHblpsbXdR?=
 =?utf-8?B?b0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <968E9BDB4587D147909CF99EC3DE276D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5801e5a4-13a6-40b6-7c6a-08dae369c9f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2022 15:41:12.5101 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ozVnBTGshowR1MESRcS+xukSUrqIVP2VSidh01d5XnBlku6Zh6LiKSQj9672YsaY9wuk+6Ist+S/QZblC5X/yZ5uPVHqld/T+lcMnGvAq6s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5816
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIyLTEyLTIxIGF0IDEzOjA1ICswMTAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90
ZToNCj4gSGkNCj4gDQo+IEFtIDIxLjEyLjIyIHVtIDEyOjE5IHNjaHJpZWIgSm91bmkgSMO2Z2Fu
ZGVyOg0KPiA+IENoZWNraW5nIGlmIGRhbWFnZSBjbGlwIGlzIHZhbGlkIGlzIGNvbW1vbiB0byBh
bGwgZmIgaGVscGVycy4NCj4gPiBNYWtlcyBtb3JlIHNlbnNlIHRvIGNoZWNrIGl0IGluIGhpZ2hl
ciBsZXZlbCB0aGFuIGFkZGluZyBpbnRvDQo+ID4gYWxsIGhlbHBlcnMuDQo+IA0KPiBJdCB3YXMg
YSBkZWxpYmVyYXRlIGRlY2lzaW9uIHRvIHNlcGFyYXRlIGRhbWFnZSBjbGlwcGluZyBhbmQgZGly
dHkgDQo+IHVwZGF0ZXM7IGRvbmUgaW4gWzFdLiBDbGlwcGluZyBpcyBhbiBvcHRpb25hbCBoaW50
IGluIG91ciByZWd1bGFyDQo+IGRhbWFnZSANCj4gaGFuZGxpbmcgdmlhIGRybV9mcmFtZWJ1ZmZl
cl9mdW5jcy5kaXJ0eS4gVGhlIGZiX2RpcnR5IGNhbGxiYWNrIG5vdyANCj4gZm9sbG93cyB0aGF0
IHNlbWFudGljcy4NCj4gDQo+IEkgbWVudGlvbmVkIHRoYXQgaXQgd291bGQgYmUgYmV0dGVyIHRv
IGltcGxlbWVudCB0aG9zZSBmYl9vcHMNCj4gY2FsbGJhY2tzIA0KPiBmb3IgaTkxNS4gQnV0IGlm
IHlvdSBnbyB3aXRoIGZiX2RpcnR5LCBwbGVhc2UgaW1wbGVtZW50IHRoZSBjbGlwcGluZyANCj4g
dGVzdCBpbiB5b3VyIGNhbGxiYWNrLg0KDQpUaGFuayB5b3UgZm9yIHlvdXIgY29tbWVudHMuIEkg
aGF2ZSBzZW50IGEgbmV3IHZlcnNpb24uIFBsZWFzZSBjaGVjay4NCg0KPiANCj4gQmVzdCByZWdh
cmRzDQo+IFRob21hcw0KPiANCj4gWzFdDQo+IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9w
Lm9yZy9wYXRjaC81MDk5NTgvP3Nlcmllcz0xMDk5NDMmcmV2PTMNCj4gDQo+ID4gDQo+ID4gQ2M6
IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+DQo+ID4gQ2M6
IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPiA+IENjOiBKYW5pIE5p
a3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEpvdW5pIEjD
tmdhbmRlciA8am91bmkuaG9nYW5kZXJAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+IMKgIGRyaXZl
cnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmPCoMKgwqDCoCB8IDQgKysrKw0KPiA+IMKgIGRyaXZl
cnMvZ3B1L2RybS9kcm1fZmJkZXZfZ2VuZXJpYy5jIHwgNCAtLS0tDQo+ID4gwqAgMiBmaWxlcyBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+ID4gDQo+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMNCj4gPiBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZmJfaGVscGVyLmMNCj4gPiBpbmRleCBiM2E3MzFiOTE3MGEuLjc4Yzg4OWRiYzYx
MCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jDQo+ID4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYw0KPiA+IEBAIC0zODQsNiArMzg0
LDEwIEBAIHN0YXRpYyB2b2lkIGRybV9mYl9oZWxwZXJfZmJfZGlydHkoc3RydWN0DQo+ID4gZHJt
X2ZiX2hlbHBlciAqaGVscGVyKQ0KPiA+IMKgwqDCoMKgwqDCoMKgwqBjbGlwLT54MiA9IGNsaXAt
PnkyID0gMDsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmaGVs
cGVyLT5kYW1hZ2VfbG9jaywgZmxhZ3MpOw0KPiA+IMKgIA0KPiA+ICvCoMKgwqDCoMKgwqDCoC8q
IENhbGwgZGFtYWdlIGhhbmRsZXJzIG9ubHkgaWYgbmVjZXNzYXJ5ICovDQo+ID4gK8KgwqDCoMKg
wqDCoMKgaWYgKCEoY2xpcF9jb3B5LngxIDwgY2xpcF9jb3B5LngyICYmIGNsaXBfY29weS55MSA8
DQo+ID4gY2xpcF9jb3B5LnkyKSkNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
cmV0dXJuOw0KPiA+ICsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgcmV0ID0gaGVscGVyLT5mdW5jcy0+
ZmJfZGlydHkoaGVscGVyLCAmY2xpcF9jb3B5KTsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgaWYgKHJl
dCkNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdvdG8gZXJyOw0KPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiZGV2X2dlbmVyaWMuYw0KPiA+IGIvZHJp
dmVycy9ncHUvZHJtL2RybV9mYmRldl9nZW5lcmljLmMNCj4gPiBpbmRleCAwYTRjMTYwZTBlNTgu
LjZjNmJiMGRkMmVhOCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiZGV2
X2dlbmVyaWMuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJkZXZfZ2VuZXJpYy5j
DQo+ID4gQEAgLTMzNCwxMCArMzM0LDYgQEAgc3RhdGljIGludCBkcm1fZmJkZXZfZmJfZGlydHko
c3RydWN0DQo+ID4gZHJtX2ZiX2hlbHBlciAqaGVscGVyLCBzdHJ1Y3QgZHJtX2NsaXBfcmVjdA0K
PiA+IMKgwqDCoMKgwqDCoMKgwqBpZiAoIWRybV9mYmRldl91c2Vfc2hhZG93X2ZiKGhlbHBlcikp
DQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gMDsNCj4gPiDCoCAN
Cj4gPiAtwqDCoMKgwqDCoMKgwqAvKiBDYWxsIGRhbWFnZSBoYW5kbGVycyBvbmx5IGlmIG5lY2Vz
c2FyeSAqLw0KPiA+IC3CoMKgwqDCoMKgwqDCoGlmICghKGNsaXAtPngxIDwgY2xpcC0+eDIgJiYg
Y2xpcC0+eTEgPCBjbGlwLT55MikpDQo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oHJldHVybiAwOw0KPiA+IC0NCj4gPiDCoMKgwqDCoMKgwqDCoMKgaWYgKGhlbHBlci0+YnVmZmVy
KSB7DQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXQgPSBkcm1fZmJkZXZf
ZGFtYWdlX2JsaXQoaGVscGVyLCBjbGlwKTsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoGlmIChkcm1fV0FSTl9PTkNFKGRldiwgcmV0LCAiRGFtYWdlIGJsaXR0ZXIgZmFpbGVk
Og0KPiA+IHJldD0lZFxuIiwgcmV0KSkNCj4gDQo+IC0tIA0KPiBUaG9tYXMgWmltbWVybWFubg0K
PiBHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQo+IFNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdl
cm1hbnkgR21iSA0KPiBNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCj4g
KEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KPiBHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2
DQoNCg==
