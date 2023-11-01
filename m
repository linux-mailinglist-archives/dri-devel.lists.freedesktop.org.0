Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1AD7DDE2E
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 10:10:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D34A710E66B;
	Wed,  1 Nov 2023 09:10:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89BD510E658;
 Wed,  1 Nov 2023 09:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698829822; x=1730365822;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=CqypwakQQb6Yt1sJ7XmpWuz+qd5qI1GjuSQxguN7/Ks=;
 b=W+4HKy8JI45CtLXGUVgLoz8hhEvF8SMG7b7o8nlOB/RzeGDGvGK/JSOK
 tm0WRaEXDVPfQrvmRNlAzniHS/36Tl4DuI6IYFRYkjgHycir7eHk/+joa
 cUdsLgKOoCX5l3TxdQkyS/OtMNDOJ5M4qYOMPPn9N8aAwiI9PiQyCDMVP
 UXqQrrrH2wMm8JqyY0mR24ofoMRhiF+xkwUxaj/1Yf03knY2hAY3UvObe
 aznA1EVPBc5RpX4r290OtyOv5p/+Zwt6M+pxMRd+OZDeW0tPaDg9OgOur
 0j05clEm4aTbfWFgUlQkAwRdWbLCpXj7nNZbAb5BTxA7P/O9Mza62wyZC w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="1314904"
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200"; 
   d="scan'208";a="1314904"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 02:10:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="1008052563"
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200"; d="scan'208";a="1008052563"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Nov 2023 02:10:21 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 1 Nov 2023 02:10:20 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 1 Nov 2023 02:10:20 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 1 Nov 2023 02:10:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VIBRAnMTrMCn3s0kBLJc+jKU1VbYfCj80d+hV4aBHH4JmOEzE21GhVOVwiELzKFdsHnqdmaeilHwmV1pudOMCCjnZypUhu+CLtR3jbY/fCgRmTmeS75r82I90zU/f8MLQvh/GyKIgCma0rO3+gorCFl1Tq9cItNnpOY3M31MbgG2QlVajnzsFxcciAfnUB4cuIFJCi73ML1NMuHKsMkFeT6mCq2if8t1qJX4+EEgEqb8YpLxAbM2Jq695RaWRXgr294iV/Hw9aAdvem6FdNFlHABHFZY1yXH88jdJaj51lOHLMLxfSSv/vC3Q+/e1oEn7ekznSWezdkJYFZq8spxRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CqypwakQQb6Yt1sJ7XmpWuz+qd5qI1GjuSQxguN7/Ks=;
 b=k9eAOeQJ3gfNH2BR25SIMVBV39NXKGNgGGLM0S6G2VUK1PBoJd316XKgWD/aPaFvjzUxwN9tWDu9SILarqNgT5khhYajbzYRbF9saxAdAUh0wEK9s6tzcMxJABVxPTtdc2CeehoAATrsl2VjS4IAOILv8aiARSvs/j7JGqpKHkOAVVdotvdbd4YEeoWrvh+qQ+eDeCNPsPWXojAmVZVxU9RI/ZMAHszrrIXsNma9sNBlNM6qjvltW4tzBvSyAV34VZ7v2r/bMgeg/nIW9u7zToFIO3gHhhtmCxTlSLAOqQ77fKHnjK4/5KIiUzO8pEyy5HFWf3cas3pvmyC5bDx73w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 CH0PR11MB5284.namprd11.prod.outlook.com (2603:10b6:610:bf::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6954.19; Wed, 1 Nov 2023 09:10:18 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::ea97:f0a2:fffc:b892]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::ea97:f0a2:fffc:b892%3]) with mapi id 15.20.6933.024; Wed, 1 Nov 2023
 09:10:18 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "ville.syrjala@linux.intel.com"
 <ville.syrjala@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "javierm@redhat.com" <javierm@redhat.com>, "tvrtko.ursulin@linux.intel.com"
 <tvrtko.ursulin@linux.intel.com>, "Deak, Imre" <imre.deak@intel.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH v5 5/7] drm/i915: Initialize fbdev DRM client
 with callback functions
Thread-Topic: [Intel-gfx] [PATCH v5 5/7] drm/i915: Initialize fbdev DRM client
 with callback functions
Thread-Index: AQHZ8S1p27EtMmEpjk6s1S3ZaAPFDLBaWnAAgAr5NwCAABBxgA==
Date: Wed, 1 Nov 2023 09:10:16 +0000
Message-ID: <3f197071e61c0014b15f2de1a082f0a6d59495ec.camel@intel.com>
References: <20230927102808.18650-1-tzimmermann@suse.de>
 <20230927102808.18650-6-tzimmermann@suse.de>
 <62b2e622370df7557ea7d98ea65eaf2c5a09bb6e.camel@intel.com>
 <58a56618-318d-466e-afa0-0c3b1016a3ef@suse.de>
In-Reply-To: <58a56618-318d-466e-afa0-0c3b1016a3ef@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|CH0PR11MB5284:EE_
x-ms-office365-filtering-correlation-id: ef4f2375-a2cd-4bd7-c20a-08dbdaba5d7d
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PsvD4WbJXFMUUou+t1IUUmrAZ/Ozpms96WiJ6kd6lfQzUvuVNZ6iehRUcA51uW6yc30TU1yFj2M7hmCFTJpLrLnDc9FyxMNwLEN8G9kobPM1Ec91NxUwz0X/giJ4hP21/pjRX68hLlcWiZJ+zQwxtkpRvEwVGZVHGBSqHmrpLl4JlbW0gj8XbB2ATtrfAMPG3fz2+U439fODgqH6WpyDA4VR9A9/jL7Ua6eBzOfg+OYqA1MHU9YxFuBTpPv175gyBfmYBZwb7mH7mHAyh8CZJX3IJZtgReGNFUXr66evIgn5YHfKg6a2VVji//9XCr+B8b8wD8/bcknA2iDmyDzGYlVHwyipoTtpUlQxHOmIYKs/NgAtUGTzk2K2LPOFAsA9s5/NgBVbiZlfhywrR3+B3bBaler7oQBdm+ju3ukGziieTaF8buldUvMX6jX6yR+Of84SsMC52cYukAGNVDKfORglDVTH4yP7kYSY3KIcpgWAZW3hD4oA2jGSGv0XRNv2vBH5JJ4Xmib4pOH4Q8Uv55cXyuHD1WmDNdzLcGuVdUtZ9w85LF4d2Il6cxKBsEgoQP0t+wk5i8xrEQ90tHR4hijkLmZy4Yp9vATDV4XGnk1aOIv8h/AZ0PKFLwYCjDuI
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(39860400002)(396003)(346002)(366004)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(2616005)(26005)(6512007)(71200400001)(478600001)(6506007)(83380400001)(66574015)(7416002)(6486002)(2906002)(5660300002)(41300700001)(76116006)(66946007)(91956017)(110136005)(66556008)(66446008)(8936002)(8676002)(4326008)(316002)(64756008)(66476007)(54906003)(966005)(38070700009)(38100700002)(86362001)(82960400001)(122000001)(921008)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QUFVV3dyU3ZmUGhxWTBtOVBJM0J4eUQ2Q09xaC83dGpPTFczeXBxVW12OUVU?=
 =?utf-8?B?RVI1T2pBd2VwUmFqWDhaeG1TdnNqTTFXZnNpbjhSQ29VRDg0MHJDbldEZWlH?=
 =?utf-8?B?bytxcy8wcEIwYTJDT25rSTFqT3pYK3FQNHF4WWMvd1F5QUErMEVFcm5KMTdE?=
 =?utf-8?B?NllnSGFzVDBKMklSU1lYQkdTSWRibFY5dVhJUXBmQXgxMzJ0NnVrTmxwcG1I?=
 =?utf-8?B?K3VscXpQRmZwSzdwbXl2NmdCOEJiWnByMWNLbUh5MzJHZ28zbFNPNGtEUFVC?=
 =?utf-8?B?OTlvV2xHdTlnY0VlU1htWERKS2tVTDRhOHJWVE5zTnQzZmpxTHFRQXZ5TllF?=
 =?utf-8?B?c1k1SHloYkdmcFIwNkVRSWxMOEdmQTF4NVZEOE1qWlJ6RSsxd3phZHdvVFlr?=
 =?utf-8?B?NTJkbGpOTmJlZVQxRnJrVmE1RmEzSWhVTEZvSU1HejM1dFlEWFMxTjFRdzVz?=
 =?utf-8?B?Q0Nsc2JPeVVHQ1RoNkRSRHVOYnFFc2tHZHVUNHZZcktWTktUVnBnRE4xRkxi?=
 =?utf-8?B?MmJlRGkzNTRYd0lJLzlLUGFYZ2czNVJYK2NMWC9RZFFONTlXK2x6NEVFK0tL?=
 =?utf-8?B?amlHYUZqRXBXc0dzdG13Sm9lMWpTanV5S21WWndHdm9HU0NnaXhxOFE0S2tw?=
 =?utf-8?B?Q0ZKSmx2LzE3L2RKdmtBY3duMXBXeFZLNm9VWU9mM21uajJwb2MwSGlKTE5X?=
 =?utf-8?B?L2hKei9RQ0RnblprbHA3TEdKZVN3M0pTZHFxWHNwbVFvR3MrT0R5TnZOS3dW?=
 =?utf-8?B?eFoweVk1dTA3dm81YjM0Njl0UytMSVNrM0U1aExUdDQ0Q3B4MTFrZ0E3MTRi?=
 =?utf-8?B?bjN4NVJSakREc2gyb0tuMkYzYWpVTEl2R1ZBcVJjOExrM3YxenN4Nkk5Nkdn?=
 =?utf-8?B?UlQ0YXJ5NnlzY0NtVlpWWjYwaXlPcG1yVnJTcGF6Y1U3NkVxK1BGVFNDeEor?=
 =?utf-8?B?aXgxdnp1dER2eCtZaW9JMy93M0xvellmcytYYTk1Q1hnVStmVHEzT0hkbE9F?=
 =?utf-8?B?ZC9NSjBrUVZJSnpzaGphOGJqTGF4SkQxRElsM1hnZ1NGYU1mQ0dadHlaWUVJ?=
 =?utf-8?B?QWlRN2xFMklFeWpZS1VOeDgrcDZramhNVldTK1JJNmxzTHpXdXFXdzA4R0h5?=
 =?utf-8?B?YUhuVFJ5MjNFeUkySUVkVDFET2JWWXY2Y3dDZjJpM2R1TTc4TXhvWU52dGtF?=
 =?utf-8?B?dWEzY1NJNXJsOVZqdFZhY0o1S04zcTVNRnRCUitkeXp4bTh6YWFLLzlWSit4?=
 =?utf-8?B?c2c5MkJwcmRuK0xWN21vcHUydkRqUG16c0RnR0JkVmZ2OEk0Ump3NEhyR0xL?=
 =?utf-8?B?ZnY3NnlzaVBFUjJRalZFZjNzalMxaldoY0hXTjZ5ckpVWlZMdm1QTmNxb01R?=
 =?utf-8?B?MW13MlRiVnIyVTRPT25RTDNtOElmOHJ2ZEpDRjNBQlNSMGZKUk9WRmJFNVhT?=
 =?utf-8?B?T2ZrNmhjMlYydlhuYWp0K2psREFsd2UyZWhuci9KYlBNa3Q0c2FjWDVPN3Bh?=
 =?utf-8?B?MDA1MEJQYjVMYmRBLzhNK2UwdG5Ba0dVemkyOHBFbUdYclVMSDNrWUNpNUhi?=
 =?utf-8?B?SndUNjlxZHd1M29Kam5tb2txcWxmMXhVSC9VWUx6OGpnRWN6UjB1RXd0OHlI?=
 =?utf-8?B?NzJlZitDdUtjYll1UjJ3VkUxSGFyN0Vndm1xaVY1MmJqRzNzeUI1aGhhYTlX?=
 =?utf-8?B?bE94V3FwS3RnUlBsOTRkY0ZPTHYwd0ZXbEREeFlSL2pXYUtmTmJFVC9DZDBu?=
 =?utf-8?B?OFZaaTV4OU0xRnF0dGxsKzZsbWNsZWFGNVVqeW9yKytTS0lyNFB5YkY3OEVZ?=
 =?utf-8?B?TDNGbFA0Z3lZUHBTYXdIYnZRUTZuM3kxYVUwc2dOb0ROV0ZnZlErNk02OEdY?=
 =?utf-8?B?cU1BR3BkK05Eb29yN1Z2bVlKcGdIc3dQLzRYS1EvbUNiS0JnUkFBYUNUWjJ2?=
 =?utf-8?B?SlpEZW9aeDhZZTRON01ZYkNkd1c5ZXBTTzlncnpSbStWd0w2RUdHOWpWWDRS?=
 =?utf-8?B?MXdWc2ZJRGlyS2pJZGo2SndLaHl1WnNMUWxjZW1xZFI5dDJpdEFqRDB0YzRH?=
 =?utf-8?B?Q0VxajVPMWxMK3Rmdjd2b2VKZENMbGNkWWxaWHFEUEpjNEd0S0dNUVRENjFV?=
 =?utf-8?B?WldFNEFSMzJjWWtIY0pSdzZLZnoyTEVZUnJvaDJRNlgyWXJLNXdwbXE5TGEx?=
 =?utf-8?B?eVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5FCB9D6F60E58C48A02F6B87CD87B25B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef4f2375-a2cd-4bd7-c20a-08dbdaba5d7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2023 09:10:17.0289 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z1Zg7ZV0ilE10TUTGfhwfExD1cgRYj/mShq6TUi4Gz7ZsKpUQpZdcPrQXpGp2ErQIKHjhCndxhhGWMD8uaipyMm4aRA/Kc452NC/Isr+i0M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5284
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

T24gV2VkLCAyMDIzLTExLTAxIGF0IDA5OjExICswMTAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90
ZToNCj4gSGkNCj4gDQo+IEFtIDI1LjEwLjIzIHVtIDEwOjM2IHNjaHJpZWIgSG9nYW5kZXIsIEpv
dW5pOg0KPiA+IEhpIFRob21hcywgT25lIG1pbm9yIGNvbW1lbnQgaW5saW5lIGJlbG93Lg0KPiAN
Cj4gVGhhbmsgeW91IHNvIG11Y2ggZm9yIHRha2luZyB0aGUgdGltZSB0byByZXZpZXcgdGhlc2Ug
cGF0Y2hlcy4NCj4gDQo+ID4gDQo+ID4gT24gV2VkLCAyMDIzLTA5LTI3IGF0IDEyOjI2ICswMjAw
LCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4gPiA+IEluaXRpYWxpemUgaTkxNSdzIGZiZGV2
IGNsaWVudCBieSBnaXZpbmcgYW4gaW5zdGFuY2Ugb2Ygc3RydWN0DQo+ID4gPiBkcm1fY2xpZW50
X2Z1bmNzIHRvIGRybV9jbGllbnRfaW5pdCgpLiBBbHNvIGNsZWFuIHVwIHdpdGgNCj4gPiA+IGRy
bV9jbGllbnRfcmVsZWFzZSgpLg0KPiA+ID4gDQo+ID4gPiBEb2luZyB0aGlzIGluIGk5MTUgcHJl
dmVudHMgZmJkZXYgaGVscGVycyBmcm9tIGluaXRpYWxpemluZyBhbmQNCj4gPiA+IHJlbGVhc2lu
ZyB0aGUgY2xpZW50IGludGVybmFsbHkgKHNlZSBkcm1fZmJfaGVscGVyX2luaXQoKSkuIE5vDQo+
ID4gPiBmdW5jdGlvbmFsIGNoYW5nZSB5ZXQ7IHRoZSBjbGllbnQgY2FsbGJhY2tzIHdpbGwgYmUg
ZmlsbGVkIGxhdGVyLg0KPiA+ID4gDQo+ID4gPiB2MjoNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDC
oCogY2FsbCBkcm1fZmJfaGVscGVyX3VucHJlcGFyZSgpIGluIGVycm9yIGhhbmRsaW5nDQo+ID4g
PiAoSmFuaSkNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoCogZml4IHR5cG8gaW4gY29tbWl0IG1l
c3NhZ2UgKFNhbSkNCj4gPiA+IA0KPiA+ID4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1h
bm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+ID4gPiAtLS0NCj4gPiA+IMKgwqBkcml2ZXJzL2dw
dS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2ZiZGV2LmMgfCA0Mw0KPiA+ID4gKysrKysrKysrKysr
KysrKysrKystLQ0KPiA+ID4gwqDCoDEgZmlsZSBjaGFuZ2VkLCAzOSBpbnNlcnRpb25zKCspLCA0
IGRlbGV0aW9ucygtKQ0KPiA+ID4gDQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZGlzcGxheS9pbnRlbF9mYmRldi5jDQo+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfZmJkZXYuYw0KPiA+ID4gaW5kZXggMjY5NWM2NWI1NWRkYy4uZDllNjk0
NzFhNzgyYSAxMDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfZmJkZXYuYw0KPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9mYmRldi5jDQo+ID4gPiBAQCAtMzc4LDYgKzM3OCw3IEBAIHN0YXRpYyB2b2lkIGludGVs
X2ZiZGV2X2Rlc3Ryb3koc3RydWN0DQo+ID4gPiBpbnRlbF9mYmRldiAqaWZiZGV2KQ0KPiA+ID4g
wqDCoMKgwqDCoMKgwqDCoMKgaWYgKGlmYmRldi0+ZmIpDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgZHJtX2ZyYW1lYnVmZmVyX3JlbW92ZSgmaWZiZGV2LT5mYi0+YmFz
ZSk7DQo+ID4gPiDCoCANCj4gPiA+ICvCoMKgwqDCoMKgwqDCoGRybV9jbGllbnRfcmVsZWFzZSgm
aWZiZGV2LT5oZWxwZXIuY2xpZW50KTsNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoGRybV9mYl9o
ZWxwZXJfdW5wcmVwYXJlKCZpZmJkZXYtPmhlbHBlcik7DQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKg
wqBrZnJlZShpZmJkZXYpOw0KPiA+ID4gwqDCoH0NCj4gPiA+IEBAIC02NzEsNiArNjcyLDMwIEBA
IHZvaWQgaW50ZWxfZmJkZXZfcmVzdG9yZV9tb2RlKHN0cnVjdA0KPiA+ID4gZHJtX2k5MTVfcHJp
dmF0ZSAqZGV2X3ByaXYpDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
aW50ZWxfZmJkZXZfaW52YWxpZGF0ZShpZmJkZXYpOw0KPiA+ID4gwqDCoH0NCj4gPiA+IMKgIA0K
PiA+ID4gKy8qDQo+ID4gPiArICogRmJkZXYgY2xpZW50IGFuZCBzdHJ1Y3QgZHJtX2NsaWVudF9m
dW5jcw0KPiA+ID4gKyAqLw0KPiA+ID4gKw0KPiA+ID4gK3N0YXRpYyB2b2lkIGludGVsX2ZiZGV2
X2NsaWVudF91bnJlZ2lzdGVyKHN0cnVjdCBkcm1fY2xpZW50X2Rldg0KPiA+ID4gKmNsaWVudCkN
Cj4gPiA+ICt7IH0NCj4gPiA+ICsNCj4gPiA+ICtzdGF0aWMgaW50IGludGVsX2ZiZGV2X2NsaWVu
dF9yZXN0b3JlKHN0cnVjdCBkcm1fY2xpZW50X2Rldg0KPiA+ID4gKmNsaWVudCkNCj4gPiA+ICt7
DQo+ID4gPiArwqDCoMKgwqDCoMKgwqByZXR1cm4gMDsNCj4gPiA+ICt9DQo+ID4gPiArDQo+ID4g
PiArc3RhdGljIGludCBpbnRlbF9mYmRldl9jbGllbnRfaG90cGx1ZyhzdHJ1Y3QgZHJtX2NsaWVu
dF9kZXYNCj4gPiA+ICpjbGllbnQpDQo+ID4gPiArew0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgcmV0
dXJuIDA7DQo+ID4gPiArfQ0KPiA+ID4gKw0KPiA+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZHJt
X2NsaWVudF9mdW5jcyBpbnRlbF9mYmRldl9jbGllbnRfZnVuY3MgPQ0KPiA+ID4gew0KPiA+ID4g
K8KgwqDCoMKgwqDCoMKgLm93bmVywqDCoMKgwqDCoMKgwqDCoMKgwqA9IFRISVNfTU9EVUxFLA0K
PiA+ID4gK8KgwqDCoMKgwqDCoMKgLnVucmVnaXN0ZXLCoMKgwqDCoMKgPSBpbnRlbF9mYmRldl9j
bGllbnRfdW5yZWdpc3RlciwNCj4gPiA+ICvCoMKgwqDCoMKgwqDCoC5yZXN0b3JlwqDCoMKgwqDC
oMKgwqDCoD0gaW50ZWxfZmJkZXZfY2xpZW50X3Jlc3RvcmUsDQo+ID4gPiArwqDCoMKgwqDCoMKg
wqAuaG90cGx1Z8KgwqDCoMKgwqDCoMKgwqA9IGludGVsX2ZiZGV2X2NsaWVudF9ob3RwbHVnLA0K
PiA+ID4gK307DQo+ID4gPiArDQo+ID4gPiDCoMKgaW50IGludGVsX2ZiZGV2X2luaXQoc3RydWN0
IGRybV9kZXZpY2UgKmRldikNCj4gPiA+IMKgwqB7DQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqBz
dHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqZGV2X3ByaXYgPSB0b19pOTE1KGRldik7DQo+ID4gPiBA
QCAtNjkyLDE2ICs3MTcsMjYgQEAgaW50IGludGVsX2ZiZGV2X2luaXQoc3RydWN0IGRybV9kZXZp
Y2UNCj4gPiA+ICpkZXYpDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqBlbHNlDQo+ID4gPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWZiZGV2LT5wcmVmZXJyZWRfYnBwID0gaWZi
ZGV2LQ0KPiA+ID4gPmhlbHBlci5wcmVmZXJyZWRfYnBwOw0KPiA+ID4gwqAgDQo+ID4gPiArwqDC
oMKgwqDCoMKgwqByZXQgPSBkcm1fY2xpZW50X2luaXQoZGV2LCAmaWZiZGV2LT5oZWxwZXIuY2xp
ZW50LCAiaTkxNS0NCj4gPiA+IGZiZGV2IiwNCj4gPiANCj4gPiBXZSBhcmUgY3VycmVudGx5IHdv
cmtpbmcgb24gbmV3IGRyaXZlciBuYW1lZCBhcyBYZS4gRHVlIHRvIHRoaXMgaXQNCj4gDQo+IEkn
dmUgYWx3YXlzIHRob3VnaHQgdGhhdCBpdCdzIGFuIGVudGlyZWx5IG5ldyBkcml2ZXIuIEJ1dCBJ
J20gbm90DQo+IHJlYWxseSANCj4gdXAtdG8tZGF0ZS4gU28gdGhlIFhlIGRyaXZlciBpcyBsb2Nh
dGVkIHVuZGVyIGk5MTUvIGFuZCBhbHNvIHNoYXJlcw0KPiBjb2RlIA0KPiB3aXRoIHRoZSBleGlz
dGluZyBpOTE1IGRyaXZlcj8NCg0KSXQgd2lsbCBtYWlubHkgc2hhcmUgZGlzcGxheSBjb2RlIHdp
dGggaTkxNS4NCg0KPiANCj4gPiBtaWdodCBhY3R1YWxseSBtYWtlIHNlbnNlIHRvIHVzZSBpbnRl
bC1mYmRldiBoZXJlIHJhdGhlciB0aGFuIGk5MTUtDQo+ID4gZmJkZXYuDQo+IA0KPiBUaGF0IGNo
YW5nZSBjb3VsZCBicmVhayB1c2VyLXNwYWNlIHByb2dyYW1zLiBTZWUgdGhlIGNvbW1lbnQgYXQg
WzFdDQo+IGFuZCANCj4gdGhlIGNvbW1pdCA4NDI0NzBjNGUyMTEgKCJSZXZlcnQgImRybS9mYi1o
ZWxwZXI6IGltcHJvdmUgRFJNIGZiZGV2IA0KPiBlbXVsYXRpb24gZGV2aWNlIG5hbWVzIiIpLsKg
IEknZCByYXRoZXIgbGVhdmUgdGhlIHN0cmluZyBhcyBpdCBpcy4NCg0KQ2xpZW50IG5hbWUgZG9l
c24ndCBhZmZlY3QgbmFtZSB1c2VkIGluIGZiaW5mby4gRm9yIGk5MTUgaXQgaXMNCmk5MTVkcm1m
YiBhcyBlYXJsaWVyIGFuZCBmb3IgeGUgaXRzIHhlZHJtZmIuIEFsc28gdGhpcyBjbGllbnQgbmFt
ZSBpcw0KY29tcGxldGVseSBuZXcgYWRkZWQgYnkgeW91ciBwYXRjaGVzLiBJJ20gbm90IHN1cmUg
d2hlcmUgaXQgd2lsbA0KdmlzaWJsZS4gSSB3YXMgb3JpZ2luYWxseSB0aGlua2luZyB1c2luZyBk
cml2ZXItPm5hbWUgYXMgZG9uZSBpbg0KZHJtX2ZiX2hlbHBlcl9maWxsX2luZm8sIGJ1dCBJIHRo
aW5rIGNvbW1vbiBpbnRlbC1mYmRldiBpcyBqdXN0IGZpbmUuDQoNCkJSLA0KDQpKb3VuaSBIw7Zn
YW5kZXINCiANCj4gDQo+IEJlc3QgcmVnYXJkcw0KPiBUaG9tYXMNCj4gDQo+IFsxXSANCj4gaHR0
cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuNi9zb3VyY2UvZHJpdmVycy9ncHUvZHJt
L2RybV9mYl9oZWxwZXIuYyNMMTc1NQ0KPiANCj4gPiANCj4gPiBCUiwNCj4gPiANCj4gPiBKb3Vu
aSBIw7ZnYW5kZXINCj4gPiANCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAmaW50ZWxfZmJkZXZfY2xpZW50X2Z1bmNzKTsNCj4g
PiA+ICvCoMKgwqDCoMKgwqDCoGlmIChyZXQpDQo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgZ290byBlcnJfZHJtX2ZiX2hlbHBlcl91bnByZXBhcmU7DQo+ID4gPiArDQo+ID4g
PiDCoMKgwqDCoMKgwqDCoMKgwqByZXQgPSBkcm1fZmJfaGVscGVyX2luaXQoZGV2LCAmaWZiZGV2
LT5oZWxwZXIpOw0KPiA+ID4gLcKgwqDCoMKgwqDCoMKgaWYgKHJldCkgew0KPiA+ID4gLcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGtmcmVlKGlmYmRldik7DQo+ID4gPiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIHJldDsNCj4gPiA+IC3CoMKgwqDCoMKgwqDCoH0N
Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoGlmIChyZXQpDQo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgZ290byBlcnJfZHJtX2NsaWVudF9yZWxlYXNlOw0KPiA+ID4gwqAgDQo+ID4g
PiDCoMKgwqDCoMKgwqDCoMKgwqBkZXZfcHJpdi0+ZGlzcGxheS5mYmRldi5mYmRldiA9IGlmYmRl
djsNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoElOSVRfV09SSygmZGV2X3ByaXYtPmRpc3BsYXku
ZmJkZXYuc3VzcGVuZF93b3JrLA0KPiA+ID4gaW50ZWxfZmJkZXZfc3VzcGVuZF93b3JrZXIpOw0K
PiA+ID4gwqAgDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gMDsNCj4gPiA+ICsNCj4g
PiA+ICtlcnJfZHJtX2NsaWVudF9yZWxlYXNlOg0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgZHJtX2Ns
aWVudF9yZWxlYXNlKCZpZmJkZXYtPmhlbHBlci5jbGllbnQpOw0KPiA+ID4gK2Vycl9kcm1fZmJf
aGVscGVyX3VucHJlcGFyZToNCj4gPiA+ICvCoMKgwqDCoMKgwqDCoGRybV9mYl9oZWxwZXJfdW5w
cmVwYXJlKCZpZmJkZXYtPmhlbHBlcik7DQo+ID4gPiArwqDCoMKgwqDCoMKgwqBrZnJlZShpZmJk
ZXYpOw0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgcmV0dXJuIHJldDsNCj4gPiA+IMKgwqB9DQo+ID4g
PiDCoCANCj4gPiA+IMKgwqBzdGF0aWMgdm9pZCBpbnRlbF9mYmRldl9pbml0aWFsX2NvbmZpZyh2
b2lkICpkYXRhLA0KPiA+ID4gYXN5bmNfY29va2llX3QNCj4gPiA+IGNvb2tpZSkNCj4gPiANCj4g
DQo+IC0tIA0KPiBUaG9tYXMgWmltbWVybWFubg0KPiBHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVy
DQo+IFNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KPiBGcmFua2Vuc3RyYXNz
ZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KPiBHRjogSXZvIFRvdGV2LCBBbmRyZXcg
TXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQo+IEhSQiAzNjgwOSAoQUcg
TnVlcm5iZXJnKQ0KDQo=
