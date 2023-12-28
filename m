Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD8581F484
	for <lists+dri-devel@lfdr.de>; Thu, 28 Dec 2023 05:02:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FBB210E039;
	Thu, 28 Dec 2023 04:02:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E631110E039;
 Thu, 28 Dec 2023 04:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703736125; x=1735272125;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ARScYNRqzx8AGgw7cNGdWVlaGE1rc5ScBdzr1zUIXiA=;
 b=oKhaQhv+PDsJnMudowNe5SRGj4NqSMW8qvcXoiLogT6Q+06NclIwwiw2
 /irzmLXS+8ernTereq8d9OcYGdJeU31CcbLmb2psvvW1RPS3CmZn9MPms
 eWxsm9m1qFuM4zRsGQxbWqdGP+jQ0/kj9Z3jpJSBJ54o9UXqHth6cA7z3
 Y+C1brqcXrN5ZVhotML8HPgu3xo1JYdBc7akCjTVrlGjrjSq32hORPcTN
 Op8NyePPUG6BRu6AkhgAFBDOJah9mfdTPZok/1qO+1/F/OgEmuOjtsnXZ
 TsKmJ90XeVcVdvkFQun/1/s9/E03XXUPT8lwd2zYvnhlvJ4kh5raJrw4Z g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="9905219"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; 
   d="scan'208";a="9905219"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2023 20:00:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="901864027"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; d="scan'208";a="901864027"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Dec 2023 20:00:47 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Dec 2023 20:00:47 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 27 Dec 2023 20:00:47 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Dec 2023 20:00:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L9xLaFZ3ME2x8P45q08wmFrT90+Wav4p0LB/s75QdpTMYYT1npE2IWrluniGcfzP082Hqor6WdSR+PvCiE+HgCwrQHkhLd89a3xK80ULv32f94J80I2urt0sT6s1SL0a9i8i5mGuqLK0MrqxMIRbAuTCp1+EXRDr2058Hu3tGsFjKy6V37viNLdMrZRlrrCDj5zafuZq4f1VK16xEuK7ikExx7K/qKheM5GgMnw4wmBsyaRS4Ckc7gv1yD2/vnheBj2JyZfxNP+8iXG1Z+VeYbMmtN7G7fxW8C8Z0VkCs2cQeriGlFikGHu8im/zzegakmR71P2DkVrwx93LXmPcQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ARScYNRqzx8AGgw7cNGdWVlaGE1rc5ScBdzr1zUIXiA=;
 b=fQr/kCbBXjMYhJN+VUuVWr+2CcCeg2bsgot8MZpcKlK+2FwbbjKtcIKXYaTJ6fYlWi4oEEaIX8jRO3Wae8FE+K0psKEBbgtuVuxKw5fC4W6U/TMKjvWYiB+j6ZsO5XLbaMKFBuUk+FrmX9MJ8bFmxrOfI2OuNCnGolxUcICIxrAB8Xl8smF4nMzFuLIAVeC6D05BWc6acUQ+iO8fLKyQ/2kikema7gwRLCaY1MPsa/P6r7eBNAwtYhMmOaEzmkpOLwtXJbQ5gVXCtcq0e+RV9lf97cRDMnuq7NeL2yfZYtavkJJD7OXHhVyAoS+rcmlrovJ8Z8IFnCl1DnHK8wIv3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 PH0PR11MB5641.namprd11.prod.outlook.com (2603:10b6:510:d6::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7113.29; Thu, 28 Dec 2023 04:00:45 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::da85:3d5:65fd:4a21]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::da85:3d5:65fd:4a21%7]) with mapi id 15.20.7113.027; Thu, 28 Dec 2023
 04:00:44 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v8 2/2] drm/i915/guc: Close deregister-context race
 against CT-loss
Thread-Topic: [PATCH v8 2/2] drm/i915/guc: Close deregister-context race
 against CT-loss
Thread-Index: AQHaLRxNa0FKa5oy10+TCB+P30+R9rCnuu2AgAsd34CACOi2AIACaR8A
Date: Thu, 28 Dec 2023 04:00:44 +0000
Message-ID: <112f16089c5b1bd5c7240a112b9ec382bbaca845.camel@intel.com>
References: <20231212165716.57493-1-alan.previn.teres.alexis@intel.com>
 <20231212165716.57493-3-alan.previn.teres.alexis@intel.com>
 <ZXogv_iKOSLXnb8b@intel.com>
 <b89b77629fa2c54a7bef358eb66d89cfe454ba5e.camel@intel.com>
 <ZYrtPPQARTXBSAgM@intel.com>
In-Reply-To: <ZYrtPPQARTXBSAgM@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.50.0-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|PH0PR11MB5641:EE_
x-ms-office365-filtering-correlation-id: 1511ed53-409e-4f95-7768-08dc07599107
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 99ekI2iLLabF0g7FEsU7fIcmplo+wm8fDRIRixfJqS6Lu/ydjHJGQutJomNl1EjXsQgKbW5Hp1TASOtasbzdXP2sEjFr+UWBfDRdtr3lEw/ikoaH7kBWqKmPiZQzRcaK6ww3YM4bkoMKGwwOl4rMfIBQuBHlGciZprm9vjOwwtRoATS36DSJ60x9XnGZntjVANS9DkdH3r0FObWpYJ2fxvVyzFMl1Xg/u2K/e35O9TMqgkgcAcMVDqkngT03dY9e696mJieI4IjaqkjTBgBNbLIe8dUpKvKIwA49GryBWqTtJNutrhsDU5Me1wLM13fzNsSLVr3OwTYq3Bkg6K2mSyv6hblTdJjMO8CRPO0nFtU2UcYstRZ/e/9G7dQs2bESDZrhBNGQFVlXqEGKCTHF3eSsPS+bCQ8NWrAaFSo8y5iD1WEmtEzeY4MijjGA25Dsk8UCe33SUMp0RMMaTqgpYQKcShP20LCIlZHAm2U6zWJiKTohgVBscznnBnan2ZAP2Vru8SZxk6upy3eg6GPs2bEr6foG8+nzILSMLoKKoSfzgwB4HM0x+k1tLuGnUF7Y5yogRAAJKwJlNxYm8ptAejPoK5w61LA/oZxkrvEoSwo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(366004)(39860400002)(376002)(346002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(6512007)(2616005)(26005)(71200400001)(37006003)(66946007)(8676002)(4326008)(6862004)(82960400001)(91956017)(6636002)(66446008)(66556008)(64756008)(54906003)(316002)(76116006)(66476007)(83380400001)(478600001)(122000001)(6506007)(38100700002)(86362001)(8936002)(450100002)(6486002)(5660300002)(2906002)(36756003)(41300700001)(38070700009)(4001150100001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WWFRV3lwNVN6Qk1aNVQvdHMxRGlVK1BKNTVzSWNxRUV6OGZxMGpkTHVHWTlE?=
 =?utf-8?B?cUFjTnZERHEwcVFYelo5UnN0MG5hb3JTd0hWRTdoN2o0cDBwUVJ6Qy9YSVBn?=
 =?utf-8?B?eXVuZWxKL1dlMFJkcktDdXVGeVBJci9JYzcyRWNGZ1d1QnBQU2VTTnQvNHhp?=
 =?utf-8?B?bklLallXTWpCOEhaOXp5Yk4xZUpYSHp5emZma2lFVGJzL3F2d0lZYTlGc0xE?=
 =?utf-8?B?cThWV3hZWWxvaEZnaGtlU0ZkRlZ4VXRsYmNVOXpCYlZLS2l3NkgzZ0VZcmRa?=
 =?utf-8?B?ZjA2QVVhbnV2QkZtOExsRGV0UlVNMUdwL1d6YXBWOFVQMmQ1RnFaRDl5Nk9O?=
 =?utf-8?B?eHJRUmtGTWV6V09GSUhid3RrZXpqRmlOSHBJR1FWL2ZlVXNWeHQvQjRFTVJU?=
 =?utf-8?B?dURSMDhwbnBJN1FPc04ralBRYjJDaEF2d2tWZDloL3VUbU1qd2JUM0l4OUJs?=
 =?utf-8?B?bFg4NjJpWXJybjFUWDdocEIvcFZuUFRxcGltK0pheXhFRGtrTXFJQ0R3Mzdh?=
 =?utf-8?B?UytPZDBFa2thYjA3c3BhQ004QTRJOGNNbzNxa1hCdDhCY2I1bXZjd3JCVFps?=
 =?utf-8?B?Q0oyNzJ1ckVENVFnWG1WT2VXeWJlZHVTckFYbVVqZmdJcXpKYWdOOTVmcGpV?=
 =?utf-8?B?em42dkxjTTZmLytVL2tHNWgvZldJSXU3K3VvcnFGYS8vYVlwL3k0MGxoMDIw?=
 =?utf-8?B?TGpJWTZqTDhwQWN2dldGNmxaTnRLdEVTTEdsdEVTTUpiR21KQXN4VlpGSnJn?=
 =?utf-8?B?Z0JDUHUzc1QrMVhITjJiYXJKQlltUlptQ0lKSjE0RVY3Tm9sRzJERktDeXZ4?=
 =?utf-8?B?NWlIVUVPQlJVekdndVdTSmhsSXlBVHI4bmpqTURwbDl5bnp5NUJxT1hzN3VR?=
 =?utf-8?B?dEtHbTE5QXhNZDJxVlI4R2QyUk0raGZYVGZEWDdKdGlvQTRKUVJWWHorRFgr?=
 =?utf-8?B?SjFvYzE0dHFVZ0FUR1g1cmVyWjcyOGQ4cnNtMWdoUDdTdmhRK0JHemJTRWt6?=
 =?utf-8?B?bitoMTg5VTB0QTdnbkg1Um4vK0lveno0U3p6UDgrOENibElxZitOeUtaOHFy?=
 =?utf-8?B?NS8zRzRUalRaQ0F2QytKZkJlalRITHJCMzk5UjRGWENISUdZUG96UGNnUUQ3?=
 =?utf-8?B?RnlNd1hiS1hCZHllQmJ5UDQ5blVENTZDZGhrYlorM0JoSllTRkhjek1xTXg4?=
 =?utf-8?B?UTd6bS9ZSGFRZG9PekkwL1JCc1FHdmhBdlpVNERTZW9TbmlXZHRSV0xiNDB6?=
 =?utf-8?B?RUNjd0J0czRaOE12cE9GSGlmcjdqOU5xZlk1UlRaVitKcmVORmRrVmdsSFg2?=
 =?utf-8?B?SXdnSklpczdNc2JPTm9PaTUzdmVxT3YyRlJYcnJTQ2hlU281WjJJejVsMFFU?=
 =?utf-8?B?OGhTSHBodk51cC9BTlNQTndQT1BncVhzVFRoMENTMG5YbWR1NXlVU2xuVTIv?=
 =?utf-8?B?ZWdYQkg2QlZvNHVhdUF5TGJWZldtcWl0UnpFeE55VWw0RVB3QmhyUlppOUNs?=
 =?utf-8?B?V0xFV1p3STRvdzdwV3lXVldObWN3dUxnWWtCSWlDV1c5MUdSQ1Z5TGhha2Zk?=
 =?utf-8?B?cVcrWHdCdWdBTTBWd04yZHIwS21mSHBMNmRVZkJ0ckhQYk9DNk43YmlxZTVL?=
 =?utf-8?B?TW9WdmEzazQvVWxvR2k4b0hxbHpiSVdZemlHZHlKNXdzWVRYekJTZFlPdHBv?=
 =?utf-8?B?ZHFwZEhTNWQ3RExUUlNOMndodmY3K3drMDB3R0RCdmlzMm1UcjRSSnM5VFA3?=
 =?utf-8?B?UVB1NFlTdEJnVGtBd1VqRnpCR2ZPb00yLzl3emdrL1BLNTkvWFZUVDhDK1cw?=
 =?utf-8?B?RktGcUFZWVB5cWkvbjRweHJsaDdzN1JaOFpPMEtyaXVLODhEVTk4TVZVUy92?=
 =?utf-8?B?VWFmbzFsdjRNTnhoWndsLzk4ZHdKeFpGNkNpVDVxdVhCZlRKNVljNFlFd1JN?=
 =?utf-8?B?S2VTNldYcHpoVlI0cHI2Z0crV2pUSFBNSG5KMXR5Y0h4NmptNVZDazhhc0pX?=
 =?utf-8?B?ek5yK0wwU2VvLy82cUwyNms4QWxhUmFlc0hNV21Rb0h1Y3FGRE52RlZnaDZF?=
 =?utf-8?B?WUhRUldiSlkwOHlmMUR4OU1aWnIzQlU1OWs2UXcyRTBWbkdvVkI4Tjl6SldR?=
 =?utf-8?B?eE9vek5GUldBcXFKOHZBMHdwclU3Z0laL3hieGp4dlVlVGRZTy9tVHVsZGJC?=
 =?utf-8?Q?SrCv6q29UAcD24oc/oLTPtA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4B5F6DF6CDA22548A6C9B5D6DE8EFC49@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1511ed53-409e-4f95-7768-08dc07599107
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Dec 2023 04:00:44.6209 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xbysG+WcWWWiWrFlrFG+pXrtBmmMIk1MR67MrEQHiTn9L1WbYSPQrq4mWVUWaVqHguJ4TiudkytRwHm8KTvPcCkNuYvWwgOfGeyAGnmZHZ00m80lsY6YH2hDucdI+CmN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5641
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Jana,
 Mousumi" <mousumi.jana@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTEyLTI2IGF0IDEwOjExIC0wNTAwLCBWaXZpLCBSb2RyaWdvIHdyb3RlOg0K
PiBPbiBXZWQsIERlYyAyMCwgMjAyMyBhdCAxMTowODo1OVBNICswMDAwLCBUZXJlcyBBbGV4aXMs
IEFsYW4gUHJldmluIHdyb3RlOg0KPiA+IE9uIFdlZCwgMjAyMy0xMi0xMyBhdCAxNjoyMyAtMDUw
MCwgVml2aSwgUm9kcmlnbyB3cm90ZToNCmFsYW46c25pcA0KDQo+ID4gDQo+ID4gDQo+ID4gYWxh
bjogVGhhbmtzIFJvZHJpZ28gZm9yIHRoZSBSQiBsYXN0IHdlZWssIGp1c3QgcXVpY2sgdXBkYXRl
Og0KPiA+IA0KPiA+IEkndmUgY2FudCByZXByb2R1Y2UgdGhlIEJBVCBmYWlsdXJlcyB0aGF0IHNl
ZW0gdG8gYmUgaW50ZXJtaXR0ZW50DQo+ID4gb24gcGxhdGZvcm0gYW5kIHRlc3QgLSBob3dldmVy
LCBhIG5vdGljYWJsZSBudW1iZXIgb2YgZmFpbHVyZXMNCj4gPiBkbyBrZWVwIG9jY3VyaW5nIG9u
IGk5MTVfc2VsZnRlc3QgQGxpdmUgQHJlcXVlc3RzIHdoZXJlIHRoZQ0KPiA+IGxhc3QgdGVzdCBs
ZWFrZWQgYSB3YWtlcmVmIGFuZCB0aGUgZmFpbGluZyB0ZXN0IGhhbmdzIHdhaXRpbmcNCj4gPiBm
b3IgZ3QgdG8gaWRsZSBiZWZvcmUgc3RhcnRpbmcgaXRzIHRlc3QuDQo+ID4gDQo+ID4gaSBoYXZl
IHRvIGRlYnVnIHRoaXMgZnVydGhlciBhbHRob3VnaCBmcm9tIGNvZGUgaW5zcGVjdGlvbg0KPiA+
IGlzIHVucmVsYXRlZCB0byB0aGUgcGF0Y2hlcyBpbiB0aGlzIHNlcmllcy4NCj4gPiBIb3BlZnVs
bHkgaXRzIGEgZGlmZmVyZW50IGlzc3VlLg0KPiANCj4gWWVhcCwgbGlrZWx5IG5vdCByZWxhdGVk
LiBBbnl3YXksIEknbSBzb3JyeSBmb3Igbm90IG1lcmdpbmcNCj4gdGhpcyBzb29uZXIuIENvdWxk
IHlvdSBwbGVhc2Ugc2VuZCBhIHJlYmFzZWQgdmVyc2lvbj8gVGhpcw0KPiBvbiBpcyBub3QgYXBw
bHlpbmcgY2xlYW5seSBhbnltb3JlLg0KDQpIaSBSb2RyaWdvLCBpIHdpbGwgcmViYXNlIGl0IGFz
IHNvb24gYXMgaSBkbyBhIGJpdCBtb3JlIHRlc3RpbmcuLg0KSSByZWFsaXplIGkgd2FzIHVzaW5n
IGEgc2xpZ2hsdHkgb2xkZXIgZ3VjIGFuZCB3aXRoIG5ld2VyIGd1YyBhbQ0Kc2VlaW5nIGFsbCBr
aW5kcyBvZiBmYWlsdXJlcyBidXQgdHJlbmRpbmcgYXMgbm90IGFuIGlzc3VlIHdpdGggdGhlIHNl
cmllcy4NCg0K
