Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A06E6F7C6C
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 07:30:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42D7E10E56D;
	Fri,  5 May 2023 05:30:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA07210E56A;
 Fri,  5 May 2023 05:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683264612; x=1714800612;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=bw8E0oJ/rGBrlVKC3vp8bD+BGzFjMZUuT6n+jrfXM20=;
 b=T9YYvBEhnM4wK9blKckjnarJ8sialiT8eJEWI2gWJGgr+LXwRW00aQY1
 ALDioEJmKbx42cQUSdnaPAMqMtI1CI7YI3VmVg8htTSEYnMxNUwJXPhrW
 DVTrLv43eZBZF/rWHK60Z489tjJ1mjAlTf4tHPAkRj9kFhUnAf86Y4xul
 ozzCoFCo9ivn8oE1wMcWkhwm4kFYr9Yc+aHcqs+k2DDCWrKriYRIrACrQ
 BAqRCjo+A1Di++DlaeXRx+70oVLSpwIhT3AHnYOil+ztHwApj2fItykd/
 QviuLu8LfMzuQz/vsFDOLTsnt7jD8GFTe/I6gCCfaEtfAgwL0Zpp6wLF6 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="435453933"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; d="scan'208";a="435453933"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 22:30:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="674876881"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; d="scan'208";a="674876881"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 04 May 2023 22:30:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 4 May 2023 22:30:11 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 4 May 2023 22:30:11 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.44) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 4 May 2023 22:30:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RyZrFLCrNDz9SNCcKranp8SrN2o4UOSk7vPKaz+W98OTmXBu7tm5HIt2rzsbcfHRUf5v0gulaw0fS52WSnQSpIkuQKHabBf2LY5/XiNftdrgp3YQm/nrPCHWhArNd1xf+Srwt2zj3xjE6udiStTeiJuY4EwQUiWTnOtDVQNZGQAQN/RumM2k479Ei47ko6f5wiTKxnwUexfT+3SH5jbFI4sJBmV2BGV7U1GuvY1pxKdWhDkxQegLw+/dOq/EnghEN+V+FVwREvH8fHNqe9vKm+QrQYWxs1OA3FNvTUMG1SysBNIewlv4hd9W0Te1WzCr+QJTz07IL+vvq4NbEXwvng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bw8E0oJ/rGBrlVKC3vp8bD+BGzFjMZUuT6n+jrfXM20=;
 b=d1GfGm7tjhMC/GAzDObSGXAebhAsDflaBNMqUAyJzsIi9YkIT8Vj1ISv+K1mTieJ6anDmqy8d5DuejoWllpd8HHrpH8wV45G5RLrFZ3JeaEXouPMHGEXGAZqKUDdoQNLPMhOibuvmvLL5RKDPTux30j4D0Fo0a2psbc30JEIZPQ4t+3B38t8F1rUhcMz7fGP0MId+VcZCvMy5zni46el6lkLrfLr24r4PTGbuG76M8hv7noS9WgZS8Kq63dWfjOWD5lTRjBjF0QTXhMfpARWCYq4TmHfWbFzC2KtteZHY27cc6CAJ5iKhj7i6ZpsqC7O85Xux1IJrVHmZakriDaSJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 PH7PR11MB7641.namprd11.prod.outlook.com (2603:10b6:510:27b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.27; Fri, 5 May
 2023 05:30:08 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3%5]) with mapi id 15.20.6363.027; Fri, 5 May 2023
 05:30:08 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v9 6/8] drm/i915/uapi/pxp: Add a GET_PARAM for PXP
Thread-Topic: [PATCH v9 6/8] drm/i915/uapi/pxp: Add a GET_PARAM for PXP
Thread-Index: AQHZeWLWx68i9/8KnU+Unxd6GaMLfq9LMoYA
Date: Fri, 5 May 2023 05:30:07 +0000
Message-ID: <8888e3dff8c1c4fd1702ded911850da30330fbfa.camel@intel.com>
References: <20230427234843.2886921-1-alan.previn.teres.alexis@intel.com>
 <20230427234843.2886921-7-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20230427234843.2886921-7-alan.previn.teres.alexis@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|PH7PR11MB7641:EE_
x-ms-office365-filtering-correlation-id: b11ff5be-f42d-4685-17bb-08db4d29c9f3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bbKTOUycOjD+oFtgaZ0P0tiyc7nY3V8BQ1I8/nNSDX4gxcEtHCsZYpxoVs+6DalvPrBBRXlaNvVvTeJ1Oqympree3JBVyky7cUnKbAPEUwU6LBq9y5aUQg5/qPCkWXa+H2BJRk1KHhwSDavApWVdyAE2nEoh2IZWu0KNlhH4GBjkmc/66bkBwj4oJJ1tPtO6NvLcZHLBVtPQ1Rg+bpdxuX0yiG8qeY7W/rFh5L6w0hZiqPmS7FyCcdBA1yQGpdS7sRagpcIB4mdc/Ux06AqRqt6Oo6WRbhR64Keg+JrO4k3MYpAquPoNl1UeLSQlYnexCu6ttSlha0H8tKjaojcQZznJ1xwvzkcftKLswWpueluDnvtrftAJhm/W7LgNyQ/DI39QaPvg3cwBABnNyocxOb8WAlIe0QOJxfKVhZ9ANs42s/slV3FSKY32pHIKoj8gVmdYMw1CNJXudFjckwaOF/Tw2rIWxfJqp0zIftSDxCPgoFQlrv0eGjW+nYwVV0L34LbGdN8mQY2FgTSkdtg/yq3Y47FR7JJEp/RDvGrLqVGsPda1gGRCIddJV5DiU/1X
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(366004)(396003)(39860400002)(376002)(136003)(451199021)(966005)(66946007)(66556008)(66476007)(66446008)(64756008)(6916009)(4326008)(6486002)(478600001)(76116006)(316002)(91956017)(54906003)(71200400001)(36756003)(86362001)(83380400001)(107886003)(2616005)(6512007)(6506007)(26005)(8936002)(5660300002)(8676002)(4744005)(2906002)(41300700001)(82960400001)(38070700005)(186003)(122000001)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d2t5alcwTDBPLzR5ZTFEeEdOdXFoaVU3MjFMT0pteExJbU5Rd2ZWNlBYN3VJ?=
 =?utf-8?B?a2FUMkFIdWNzWjdTbzNwL2pKV09ETXRvR2xzQWZCVVU1K0xLN3c0QW0xQ2Q4?=
 =?utf-8?B?cmVVZ1RxOVZWZUNKaW8vVytweFlHVk5WWUFqYzJjVWxHZXJBVGNsNGhHbGFi?=
 =?utf-8?B?MDdQZFAxVzcyOENDZHNtUzMwMnE3UUYwNEE4c3dMcGRnVjR3TTczNDNNKzdU?=
 =?utf-8?B?cVk0OUdTVmJVTkZIbWU3RWVRY09TZkpWUEswOW4yMVhXUVVKQVN6cGE2Q2xz?=
 =?utf-8?B?UkZFdHJYRkNsV2w1QnptcWJUNTZLTms5TzU5M3BrWXdNdjJvSjl2ZTdRWWJW?=
 =?utf-8?B?ak9UYm9pQ3JlK09ZVXJRUDk4OTRyYk56cUVJTzRKS0xCQlh5cEt4TU9YeGNn?=
 =?utf-8?B?KzBlV09jYTQ0MzF1RzliMmxyQU9hT2xHL2RENkhISGIzWnNNVXAzbksyTXFX?=
 =?utf-8?B?UDBBZmZKMDJOcjNaSm9TU2VZMFhiNkswc084dFlXcVM1NU9pNG0vTU9EV01x?=
 =?utf-8?B?MGNxSVAzSDhzbXVPOWhxdTVnU1RHSFMvOE1YSExIR1IvK3VkQk9qSk5JdHY3?=
 =?utf-8?B?UU1PRVovTjRGL3hmdkp6VmFCSVVHb1psemRzaFZpRWpIREtyeGNtVnBvUi8w?=
 =?utf-8?B?Y0dDSzVUaXdpdGQ5akVrUkd4R0pyTm9wQUgwd0JSQlBheXpseUZpVFFvNmFh?=
 =?utf-8?B?OGZydTlMbnhRYkh5MHN6cWN6L0REV0Z4MTRMbC9TT1ZXeDg2bmhQQlJmdGVr?=
 =?utf-8?B?b0R0MGZOYnZWd1ZmdldZYjFOUjQzcjBGQUpadXJueTJMSGM5YkNDbVk3bFEr?=
 =?utf-8?B?MGNwL0tPa0FCdFNVbk1ka2I2dFZHWnhPR1prdXcvMy9Qc2o2NVZzTWRmdXJi?=
 =?utf-8?B?QW5oaTF1dmRZVTlUTWRYUCtLM0FHZHBXWVc4Q1RuanUrbXk4UlhnREZ6eFVP?=
 =?utf-8?B?OTBRaVQ0MEUra0NDTjkwcEtMSlFFMEF0WnNRdG5aY2dvOGNHT1N3aFgvL1lk?=
 =?utf-8?B?d0MySUVLL0NrUEl1ZGVlVnQ4ZmxVZE5kaGJQei9QbWoveDB3YkpmSWJmT0Nr?=
 =?utf-8?B?bmJOK1U5d2VIYzV4MEJiNUVmRWlJY1FOQ2tUUGVHU2dQeUt4TFhpMTRHVjZ2?=
 =?utf-8?B?REJ1U1FBQmc4cnlnTEdMZDNzVHpFLzZ1VUtlWHc5MjJXdmN1bHl1ODFWdmhw?=
 =?utf-8?B?ZFhJNWFkcTJLTDJaSm1COVVzeHp4dFVXYjgyT2plMDBJbU9CTkk3elZvM1BB?=
 =?utf-8?B?S1d0L2ltUUxDTVdHM0JwdElqQVpUdE1LQitTMDd6VmFucUYxajViZHRLOW5T?=
 =?utf-8?B?bXZLRmI3Qjk5SmxNZlRHYkluUXhtVU5JVlNQbVlQYlBQSWxtSEcxa0lyNTNs?=
 =?utf-8?B?VnNYbDk2Yzc3YjFTVEM0aHZ6K3M0MWxXSzI4bi83Q1JnVUNSUnBvYVFSc0RB?=
 =?utf-8?B?MU9WaG80M1VMaUFpT3BwNjdacWU3UVRNcVBzR3F1cGxyZkhHS1dTdmgxU2xo?=
 =?utf-8?B?YkRuVU8xVnlVMVYyeTN3RFlFZnQ1K3ptWCt6c3ZmdnNKb2N3TDFWQk05R3Nu?=
 =?utf-8?B?aU85ZUtuZ2J4STMxaUFwN3J5Z2JOWFpmOGd5MTRpZXRWNGNWZXZaQU9YQXhZ?=
 =?utf-8?B?OVhhblZaQXVzRGNZQU92OFZzYmk0cGh6VFo1NzdqUGVxNlNDN3JHRTFOMG1r?=
 =?utf-8?B?OWZWU1FGZzNmNHUzd1dsTCtpZU80Zmt4M2w3d0FPekVIZEw3a1UzNWp0Z0JV?=
 =?utf-8?B?aERjd0JUOThFK0h0ZG9hSVE1UkRCZEwvVm5idGVzMmxnMG1jYXEvUk05a05H?=
 =?utf-8?B?c1VQTmZibmhQaFpXNnZsMWh0enNhcUJ4cW56VjI5NGYrQzNkZzcrQlJzZ3k4?=
 =?utf-8?B?aGFWOWJSc3BDVzlIN3hCVDdMMUFrY2d0YUhRSWVpV2ZVREZnRFY2eWxPSDFR?=
 =?utf-8?B?YlZabU5FUUhManp2T0NvdW9NTEVEMzVHemdqWXR0dXMzc29ta3hiSmxFZGVJ?=
 =?utf-8?B?aCtxRXVubUxpclVLcFpGRWJ1SEQvVkE5SDhyTnk1K2lVVEgxdnJudkdwenhT?=
 =?utf-8?B?Z0MwUnFXWUxlaVZudDF6YVVWQlAyTjJhcCtFMUprYVZ0MjI5MS80RnpMZy9D?=
 =?utf-8?B?WUx5RDVnUTQra2JSTHNxelZiR3dxODdCemd4Z3FlZzJLM1V1T1V3MTI1Rk8r?=
 =?utf-8?Q?c2wtkr1h7ed76XcVRlTtucQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BFDD44273662CC4681A09BA7DDF050CE@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b11ff5be-f42d-4685-17bb-08db4d29c9f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2023 05:30:07.9765 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lc2p8SRixkXOd3oN0KnH+wZD9L0LRYjXuEUFSRnEV6dyj5Cb177/WQ2uxvw6h0fNOBXOcmw7RB+iavx48eCB3NLxoQEvm/bdeCJ7y535wjmlILOdtGSF1k1QZhd67xZ/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7641
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
Cc: "Ursulin, Tvrtko" <tvrtko.ursulin@intel.com>,
 "justonli@chromium.org" <justonli@chromium.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "Landwerlin, 
 Lionel G" <lionel.g.landwerlin@intel.com>, "Ceraolo Spurio,
 Daniele" <daniele.ceraolospurio@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Justen,
 Jordan L" <jordan.l.justen@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTA0LTI3IGF0IDE2OjQ4IC0wNzAwLCBUZXJlcyBBbGV4aXMsIEFsYW4gUHJl
dmluIHdyb3RlOg0KPiBCZWNhdXNlIG9mIHRoZSBhZGRpdGlvbmFsIGZpcm13YXJlLCBjb21wb25l
bnQtZHJpdmVyIGFuZA0KPiBpbml0aWFsaXphdGlvbiBkZXBlZGVuY2llcyByZXF1aXJlZCBvbiBN
VEwgcGxhdGZvcm0gYmVmb3JlIGENCj4gUFhQIGNvbnRleHQgY2FuIGJlIGNyZWF0ZWQsIFVNRCBj
YWxsaW5nIGZvciBQWFAgY3JlYXRpb24gYXMgYQ0KPiB3YXkgdG8gZ2V0LWNhcHMgY2FuIHRha2Ug
YSBsb25nIHRpbWUuIEFuIGFjdHVhbCByZWFsIHdvcmxkDQo+IGN1c3RvbWVyIHN0YWNrIGhhcyBz
ZWVuIHRoaXMgaGFwcGVuIGluIHRoZSA0LXRvLTggc2Vjb25kIHJhbmdlDQo+IGFmdGVyIHRoZSBr
ZXJuZWwgc3RhcnRzICh3aGljaCBzZWVzIE1FU0EncyBpbml0IGFwcGVhciBpbiB0aGUNCj4gbWlk
ZGxlIG9mIHRoaXMgcmFuZ2UgYXMgdGhlIGNvbXBvc2l0b3IgY29tZXMgdXApLiBUbyBhdm9pZA0K
PiB1bm5jZXNzYXJ5IGRlbGF5cyBleHBlcmllbmNlZCBieSB0aGUgVU1EIGZvciBnZXQtY2FwcyBw
dXJwb3NlcywNCj4gYWRkIGEgR0VUX1BBUkFNIGZvciBJOTE1X1BBUkFNX1BYUF9TVVBQT1JULg0K
PiANCmFsYW46c25pcC4NClByb2dyZXNzIHVwZGF0ZSBvbiB0aGUgVU1EIHNpZGUgLSBJJ20gd29y
a2luZyBvbiBwYXRjaCBmb3IgUFIgaGVyZTogDQpodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5v
cmcvYWxhbl9wcmV2aW5faW50ZWwvbWVzYS1hbGFuLXByZXZpbi1mZWF0dXJlcy8tL2NvbW1pdC9m
YjlkNGZiZmJlZjdkZmQzZjQxZGYzMzVjZDMxNTQ5ZmQzOWRkYjU3DQpidXQgdGFraW5nIHRpbWUg
dG8gdmVyaWZ5IGNlcnRhaW4gY29kZSBwYXRocw0K
