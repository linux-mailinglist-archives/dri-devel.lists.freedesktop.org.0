Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D03E599CD4
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 15:20:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91D9B10EE40;
	Fri, 19 Aug 2022 13:20:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 840F310EE41;
 Fri, 19 Aug 2022 13:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660915199; x=1692451199;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=tXQhKs8tex1wvtsP/EIr2o/IvDS2DJ1Uzpq6htz3KiQ=;
 b=IiLDj5HkRvLrKdZKvg7+hH13hFVwK1CXqOsNenftRqZZmHgeTDbBmeVZ
 zsiRPG+pKXcFqLfl1IDHglZfe/YH7MoC++KAlqTyycePN1pSugGughYxf
 Fgl2wxM1vrCKicsecmPc/eQ1gAIZmmyKBGApgsriwgv3F6Z6XnpcMJEar
 P1lco0B/ex7dVSW8ja7iroawyLGu8GgpUkjFfUX/ybmZDs0RgOIlOH/1J
 6ZLCKmx56VtoG5TfCUlODEt0Ny1aB1bF5C5w+v163vrjZR6PjEr+HALgg
 1EFRD07bffPpEIGlPfuPVUE+Y/vbk1Evx3UeD8KuR0r+T4Zp7RA80AWMX Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10443"; a="293006966"
X-IronPort-AV: E=Sophos;i="5.93,248,1654585200"; d="scan'208";a="293006966"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2022 06:19:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,248,1654585200"; d="scan'208";a="608205745"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP; 19 Aug 2022 06:19:58 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 19 Aug 2022 06:19:58 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 19 Aug 2022 06:19:57 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 19 Aug 2022 06:19:57 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Fri, 19 Aug 2022 06:19:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lAU1PKcrzSUgwWweD2E8W2zD4lBruDWTLaZES7o9ACURS/gVMEebpNUeXDyuSR3Lc5gZpwjABc3g3Xjvdhc0c73uSgJwBTM/tbJxPnly6bESuZuMzqQ7ImEVUYIYm2ivMrDnJj7AMZT+XTm8rsq46+duL5b+Ub+Dcc+hSX+Z74+48cYpPe/tGWsx4lJY+rOGfdHbfIHAHKS4RnRsdCVtJCCs/W9h+45FPrmg9mGKgtMrZImj6dFGGGi7e157Bp9O7cPP87NbbRerOnjwUAcqaqdcKjHNvzKJqlw4mhxN8FgOK9cSj9DJxxGwGf7pAqRes7hPsrcQDnvRkSscdSj7Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tXQhKs8tex1wvtsP/EIr2o/IvDS2DJ1Uzpq6htz3KiQ=;
 b=dWZOgA0Ohl1J+djKKlP37V4Qn6Ke4Ped34xUBBgAXrP5UJex79NcjjhmAAsi4ymdmN5Hz6ooQ2y35sExdtanbhJ40CAk8mkf9ZKZ0Wog1pkWXF6mnRdabK16p80lKZhZ4nEs9+zPrbrGCOow39Mi9QNZ45f5nbyDOC9/SqdovQHQEbndPo5g+2dx2qBbBoqx13FZvSDTyGaxkMP46yCBYhNdWLYA5OH7zjzgxSiEoHiAgtn7i120MvQi62ppjyLjK61dnKUeB8ZXmU1hao6Qw3s/FI/K0OsDvMbbnPmYpYgGu+Sb7odCIb552bN5W88DthjqT/u48Qjltmi2hCmQ4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 BYAPR11MB3783.namprd11.prod.outlook.com (2603:10b6:a03:f5::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.19; Fri, 19 Aug 2022 13:19:55 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fd9b:c721:15c5:50aa]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fd9b:c721:15c5:50aa%9]) with mapi id 15.20.5546.018; Fri, 19 Aug 2022
 13:19:55 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "mairacanal@riseup.net" <mairacanal@riseup.net>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm: Use original src rect while initializing damage
 iterator
Thread-Topic: [PATCH 1/3] drm: Use original src rect while initializing damage
 iterator
Thread-Index: AQHYmFH9/cgIngT/x0SE64A5V3kXLq22WHcAgAATo4A=
Date: Fri, 19 Aug 2022 13:19:55 +0000
Message-ID: <f314df088ee4d76f7f90ef953c7d639f4beea41b.camel@intel.com>
References: <20220715134958.2605746-1-jouni.hogander@intel.com>
 <20220715134958.2605746-2-jouni.hogander@intel.com>
 <71908f5f-6abc-9c9a-8c9a-96af84aa4c75@riseup.net>
In-Reply-To: <71908f5f-6abc-9c9a-8c9a-96af84aa4c75@riseup.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e6c59fd0-f29c-4219-b37a-08da81e5822e
x-ms-traffictypediagnostic: BYAPR11MB3783:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lcLptYag6L0HcHEq00NJNYttkoh6tFwN1VjcZGVR9nEnOuORRofWKGvlsXUGp740Z+oeES7CpJAaWRy+/IHdwrsIx4mrbJhqrfnlFAHUxD2ot+K+cFFsHN2DdXa7S9P1Y4TTJqW5NgA0cizuX+eNyJnvT78st2WPYFRa2NAvMd0spJ3dHjhB6fxigPdurCEVqFWh7D3uiNmSlIBX7iLuQ2Xn++h+mTasWScRPoEib2oeFaYAIsI5FqCzT/7lxyNLhvWB228FUvx0BWYU6i20GnwewI6Zk83KaY37ceZXxx2bDFf0TVTJI+0nJVvSoTpilgC21RwN8FuDnd9NziJALzLdCwq32oGD0VgqKrUAlEgVU2rDLUlsNRpew9nwxM+DHlQiRV9ytVzy2Ww9tMCPMEP4vmuwu3500PGUDlB3k8Eam6YQr5bNyAxvaAQLsMcBOh6AEpvcEXLCvTfLLnxAsy+cHVoYgeD2pQrHDByK2HH5yib9nJubvWBxc8QEQDzDJ/kAcImKQ5GXB3JCPonFoGgtnIFcvdCTIJO/y4WeC/dDQi2CkGTf5Y28MDxKbQ9OgNu+wIEXu/s+MkU7wyDLTagZRJSJKt84kVuf23V45d0Q4zVUaGMOQUSetRT8s5ZxJPJ7O+RRcRj3I4j8LTfP9LxWkX15zHqc9CR7EdiJVnGkkOejHHUobnj6qPSEeaFAJscX4f87pv9egsOou9Z6j4Bk1WjlYNo+qUoJvgql0EufdbUUqfX3OAPkgkEkuNSaNwXqzP5QYYiqIA775Um4X8NIH9rHfxVl57feJdTdpJE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(346002)(136003)(396003)(376002)(366004)(6512007)(82960400001)(86362001)(186003)(26005)(6506007)(2616005)(38100700002)(53546011)(38070700005)(122000001)(66574015)(83380400001)(71200400001)(478600001)(91956017)(5660300002)(36756003)(64756008)(2906002)(66556008)(6486002)(76116006)(8936002)(8676002)(66946007)(66446008)(966005)(66476007)(41300700001)(316002)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cGZCaU4rSytiWVlUTGo3WkxrWDZoNFVUZ1k2VFJGcVZ6eHIycmZ0Y3IzRTQy?=
 =?utf-8?B?dk8zRk1rckJLeW9jQmNUNUdjTE1KRjM4elI4NzMyNzBtYjZEY09MVmRUNE9J?=
 =?utf-8?B?WlltalhQTVlSWFpaTzFBWFNaaFo1YUsrOU1ob1drNy9ybjZySXJQMWs0bFN2?=
 =?utf-8?B?V3dNQ0NQUk9DUzRQUW05eG1UU1ZNRUlZRVU3WGF6eE14RVRxT014R0RVWDVM?=
 =?utf-8?B?N3kvS1hDbEg5eGQ1ckNrWm9SVnFlKzNEMVpwM3BBQm9FSFQ2cVpmRStERE1v?=
 =?utf-8?B?MWFLZ1F1L1huVzllWHgxMTlGZDNTV3Buc2JYaUNpZWgybG55T3ZYNG84REND?=
 =?utf-8?B?TURiWVV4KzY3N0ZZbTJYRytId0RxS2tSRHhZdUsyeVlUR1EydGtTWTNtMjV6?=
 =?utf-8?B?blVoNTlJbThZV0tOSHQ5K0VWL0hidTFYZnEyZWIvZ25JdUJXYnVQZmdJTUFZ?=
 =?utf-8?B?UU02d0VzZWJJZWJRTTBycjNleTQ4MGcwS041anpBMTkrYTNXZ2tLaWduTzRW?=
 =?utf-8?B?ZWZ1dlFxditWVUQrMDJtR3prNE40SEFCMVhkUldVVWI4cXc1Z2g4U0d5RU9J?=
 =?utf-8?B?elVFdm84TTVKMG13NGZJR1hkYkpxSXJSZkZHdDF4VU1SVU91dU5VUjZFa0NN?=
 =?utf-8?B?SnV5SnNVQ1BLam9ENm12ekpJcloyc2xzTStBV1BiU1Mvbk5ZazE3c0VCMzhx?=
 =?utf-8?B?M2ZiUHFGdUc1dHk1UDBXdi9wbDkwMW1kRVV4aDlCK094M1RQL01nZ0hoZjUv?=
 =?utf-8?B?MXJ6V091SlJyTGg1TmRsYjdtVXMvUlB0Y2pKSlE2OXpHVDJmSnUvZyt4aHZq?=
 =?utf-8?B?YS9xMGVEeUMrUEtCM0pKRjQrRzZGOFpXNG4zcitza2FOZTBXMDh6M3BTbXRr?=
 =?utf-8?B?Y25jS2dMUFV3U1FvZGdrcy9yY3QxeVhKMUpPcmpRVUQvN1hjbnNFa2ppNmNQ?=
 =?utf-8?B?UHdUTlBCcXJhS1A0U3lPVk9zWWJzRlpjRXN1cTdWK2pwNnVQQVZwNHJRZnVI?=
 =?utf-8?B?dWMwdjdRMEhSNXVSZ3JodTZ4S1NDbmczeUdTRktRR003MGxaUDBMVDBFc2NR?=
 =?utf-8?B?MHpkNjRKS3Z2UFFVUVU1NWZjemlZSENCWks1NERhWkhkczE4d2xNNURNSm9V?=
 =?utf-8?B?RlpncVhRa29Qa2xPbStGVWRxOUJScXI3UEVEbWFsNlJxZEdKR1EzMmRocUpW?=
 =?utf-8?B?T05HKzhoRU9qK2VLay9UL0c0aHRQbk02UEdxUFU3dElHQ2R6cG8xMHJhV2to?=
 =?utf-8?B?Nk5kZnpqMmw4bGFJOW9QZFNha25RZnpOVmtubFBzR1JJeHJXOXNqbFdtZ3pL?=
 =?utf-8?B?ZmRTV2gxNU9PTE9lbm5saTViK3BkejlHTlRiNFU4L3loajF6L2RxNXFYa0Nl?=
 =?utf-8?B?TksrMjdtcVFzOEt3Y0x6aCs3WVRDSFI3YVVEV1hjd2NRNnNNUER6bnl4RlRu?=
 =?utf-8?B?M1ZXUHB3THJHNjdZNmJjTUlwYVlXU3pjMDFrdVNuSUpER1hEajMybGZQdFQ2?=
 =?utf-8?B?bVlkQm9CclZodG5NZ1EwYk5jWFB3dDNtVGp6ZGlucnJXQ2l4TWJZVzB6Sjhn?=
 =?utf-8?B?SzVMNEVMdXlQcXpiMkRNRENXRkNraDlmZ2N3aEs3UE1tSGdGMVRsajFSNCs2?=
 =?utf-8?B?Q2x0Z2krejFIVjNhSkVmOFdsRThSVmNUQktiM21WeEFWZ0ZzZjBGQ3RDY0la?=
 =?utf-8?B?VkNkUEtwM0lzNlhZUEdFRlpsWHRjSEZMbURxUDhhb0xsa2RlRXNJSndiNFM5?=
 =?utf-8?B?eFZGK0JUWXlCRnZtRWVUakM4WVVBd3IzQkFERllra0g4bjhKUFFYSUxYZ01M?=
 =?utf-8?B?Y2Qwa1UwY2dnT1J4TnBnZFV3RUI2QW9IQUQ3UG1KbnBDT3laSFRRcEUxUjZ0?=
 =?utf-8?B?Q1owOWJPVW5WNEdzamtpalUzanE1UVp6MHB4UTNTNWJVa1gwbWR1V3pNRXhG?=
 =?utf-8?B?RkZWM2xPeEplUzN4VFF3SWdUTHU1K3ZCQStHRm9aVk5aOTlleGJRTkhUcWs2?=
 =?utf-8?B?anVGYjdEdGxNakxraTg3MW8rRHVpYnRHUmU5MG5IS3djS1l2UjBVS3ZTMVJV?=
 =?utf-8?B?cHh3MlJWSDhUUk5UUEpRcnZJa0luVFlOeFR1Z0tSR25IZ25yUGxac2YrOVpI?=
 =?utf-8?B?M3V1c253VldhRENkNlhCanpCc1kwdEorOW53d09lck5zNm1NU0hEWmFpeVlY?=
 =?utf-8?B?cUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FF78FF5399CD6D468C015E2F1C1DD851@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6c59fd0-f29c-4219-b37a-08da81e5822e
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2022 13:19:55.7626 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X5ivb+Y9nM1wwaYYpMEncYSKdUxofi+RqF1Dofa2StdBm8+FLgQEl6yE/UDO4Z0nst/+jRh7x3ihU+fMMB7y+n+za6JJbx0iLmoawzuO9uY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3783
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIyLTA4LTE5IGF0IDA5OjA5IC0wMzAwLCBNYcOtcmEgQ2FuYWwgd3JvdGU6DQo+
IEhpIEpvdW5pLA0KPiANCj4gT24gNy8xNS8yMiAxMDo0OSwgSm91bmkgSMO2Z2FuZGVyIHdyb3Rl
Og0KPiA+IGRybV9wbGFuZV9zdGF0ZS0+c3JjIG1pZ2h0IGJlIG1vZGlmaWVkIGJ5IHRoZSBkcml2
ZXIuIFRoaXMgaXMgZG9uZQ0KPiA+IGUuZy4gaW4gaTkxNSBkcml2ZXIgd2hlbiB0aGVyZSBpcyBi
aWdnZXIgZnJhbWVidWZmZXIgdGhhbiB0aGUgcGxhbmUNCj4gPiBhbmQgdGhlcmUgaXMgc29tZSBv
ZmZzZXQgd2l0aGluIGZyYW1lYnVmZmVyLiBJOTE1IGRyaXZlciBjYWxjdWxhdGVzDQo+ID4gc2Vw
YXJhdGUgb2Zmc2V0IGFuZCBhZGp1c3RzIHNyYyByZWN0IGNvb3JkcyB0byBiZSByZWxhdGl2ZSB0
byB0aGlzDQo+ID4gb2Zmc2V0LiBEYW1hZ2UgY2xpcHMgYXJlIHN0aWxsIHJlbGF0aXZlIHRvIG9y
aWdpbmFsIHNyYyBjb29yZHMNCj4gPiBwcm92aWRlZCBieSB1c2VyLXNwYWNlLg0KPiA+IA0KPiA+
IFRoaXMgcGF0Y2ggZW5zdXJlcyBvcmlnaW5hbCBjb29yZGluYXRlcyBwcm92aWRlZCBieSB1c2Vy
LXNwYWNlIGFyZQ0KPiA+IHVzZWQgd2hlbiBpbml0aWxpYXppbmcgZGFtYWdlIGl0ZXJhdG9yLg0K
PiA+IA0KPiANCj4gZHJtX2RhbWFnZV9oZWxwZXIgaGFzIHNvbWUgS1VuaXQgdGVzdHMgb24gZHJp
dmVycy9ncHUvZHJtL3Rlc3RzLCBhbmQNCj4gYnkNCj4gYXBwbHlpbmcgdGhpcyBwYXRjaCB0aGUg
ZHJtX2RhbWFnZV9oZWxwZXIgdGVzdHMgc3RhcnRlZCB0byBmYWlsLg0KPiBDb3VsZA0KPiB5b3Ug
YWxzbyByZWZhY3RvciB0aGUgZHJtX2RhbWFnZV9oZWxwZXIgdGVzdHM/DQo+IA0KPiBUbyBydW4g
dGhlIHRlc3RzLCB5b3UgY2FuIHJ1bjoNCj4gJCAuL3Rvb2xzL3Rlc3Rpbmcva3VuaXQva3VuaXQu
cHkgcnVuIFwNCj4gLS1rdW5pdGNvbmZpZz1kcml2ZXJzL2dwdS9kcm0vdGVzdHMgXA0KPiAtLWtj
b25maWdfYWRkIENPTkZJR19VTUxfUENJX09WRVJfVklSVElPPXkgXA0KPiAtLWtjb25maWdfYWRk
IENPTkZJR19WSVJUSU9fVU1MPXkNCj4gDQo+IFRoZXJlIGlzIGFsc28gc29tZSBkb2N1bWVudGF0
aW9uIG9uIHRoZSBEUk0gS1VuaXQgVGVzdHMgb24gWzFdLg0KPiANCj4gWzFdIGh0dHBzOi8vZG9j
cy5rZXJuZWwub3JnL2dwdS9kcm0taW50ZXJuYWxzLmh0bWwjdW5pdC10ZXN0aW5nDQoNCk9rLCB0
aGFuayB5b3UgZm9yIHRoZXNlLiBJIHdpbGwgdGFrZSBhIGxvb2suDQoNCj4gDQo+IEJlc3QgUmVn
YXJkcywNCj4gLSBNYcOtcmEgQ2FuYWwNCj4gDQo+ID4gU2lnbmVkLW9mZi1ieTogSm91bmkgSMO2
Z2FuZGVyIDxqb3VuaS5ob2dhbmRlckBpbnRlbC5jb20+PiAtLS0NCj4gPiAgZHJpdmVycy9ncHUv
ZHJtL2RybV9kYW1hZ2VfaGVscGVyLmMgfCAxMSArKysrKysrLS0tLQ0KPiA+ICAxIGZpbGUgY2hh
bmdlZCwgNyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RhbWFnZV9oZWxwZXIuYw0KPiA+IGIvZHJpdmVycy9n
cHUvZHJtL2RybV9kYW1hZ2VfaGVscGVyLmMNCj4gPiBpbmRleCA5MzdiNjk5YWMyYTguLmQ4YjI5
NTVlODhmZCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RhbWFnZV9oZWxw
ZXIuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZGFtYWdlX2hlbHBlci5jDQo+ID4g
QEAgLTIyNCw2ICsyMjQsNyBAQCBkcm1fYXRvbWljX2hlbHBlcl9kYW1hZ2VfaXRlcl9pbml0KHN0
cnVjdA0KPiA+IGRybV9hdG9taWNfaGVscGVyX2RhbWFnZV9pdGVyICppdGVyLA0KPiA+ICAJCQkJ
ICAgY29uc3Qgc3RydWN0IGRybV9wbGFuZV9zdGF0ZQ0KPiA+ICpvbGRfc3RhdGUsDQo+ID4gIAkJ
CQkgICBjb25zdCBzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpzdGF0ZSkNCj4gPiAgew0KPiA+ICsJ
c3RydWN0IGRybV9yZWN0IHNyYzsNCj4gPiAgCW1lbXNldChpdGVyLCAwLCBzaXplb2YoKml0ZXIp
KTsNCj4gPiAgDQo+ID4gIAlpZiAoIXN0YXRlIHx8ICFzdGF0ZS0+Y3J0YyB8fCAhc3RhdGUtPmZi
IHx8ICFzdGF0ZS0+dmlzaWJsZSkNCj4gPiBAQCAtMjMzLDEwICsyMzQsMTIgQEAgZHJtX2F0b21p
Y19oZWxwZXJfZGFtYWdlX2l0ZXJfaW5pdChzdHJ1Y3QNCj4gPiBkcm1fYXRvbWljX2hlbHBlcl9k
YW1hZ2VfaXRlciAqaXRlciwNCj4gPiAgCWl0ZXItPm51bV9jbGlwcyA9IGRybV9wbGFuZV9nZXRf
ZGFtYWdlX2NsaXBzX2NvdW50KHN0YXRlKTsNCj4gPiAgDQo+ID4gIAkvKiBSb3VuZCBkb3duIGZv
ciB4MS95MSBhbmQgcm91bmQgdXAgZm9yIHgyL3kyIHRvIGNhdGNoIGFsbA0KPiA+IHBpeGVscyAq
Lw0KPiA+IC0JaXRlci0+cGxhbmVfc3JjLngxID0gc3RhdGUtPnNyYy54MSA+PiAxNjsNCj4gPiAt
CWl0ZXItPnBsYW5lX3NyYy55MSA9IHN0YXRlLT5zcmMueTEgPj4gMTY7DQo+ID4gLQlpdGVyLT5w
bGFuZV9zcmMueDIgPSAoc3RhdGUtPnNyYy54MiA+PiAxNikgKyAhIShzdGF0ZS0+c3JjLngyICYN
Cj4gPiAweEZGRkYpOw0KPiA+IC0JaXRlci0+cGxhbmVfc3JjLnkyID0gKHN0YXRlLT5zcmMueTIg
Pj4gMTYpICsgISEoc3RhdGUtPnNyYy55MiAmDQo+ID4gMHhGRkZGKTsNCj4gPiArCXNyYyA9IGRy
bV9wbGFuZV9zdGF0ZV9zcmMoc3RhdGUpOw0KPiA+ICsNCj4gPiArCWl0ZXItPnBsYW5lX3NyYy54
MSA9IHNyYy54MSA+PiAxNjsNCj4gPiArCWl0ZXItPnBsYW5lX3NyYy55MSA9IHNyYy55MSA+PiAx
NjsNCj4gPiArCWl0ZXItPnBsYW5lX3NyYy54MiA9IChzcmMueDIgPj4gMTYpICsgISEoc3JjLngy
ICYgMHhGRkZGKTsNCj4gPiArCWl0ZXItPnBsYW5lX3NyYy55MiA9IChzcmMueTIgPj4gMTYpICsg
ISEoc3JjLnkyICYgMHhGRkZGKTsNCj4gPiAgDQo+ID4gIAlpZiAoIWl0ZXItPmNsaXBzIHx8ICFk
cm1fcmVjdF9lcXVhbHMoJnN0YXRlLT5zcmMsICZvbGRfc3RhdGUtDQo+ID4gPnNyYykpIHsNCj4g
PiAgCQlpdGVyLT5jbGlwcyA9IE5VTEw7DQoNCg==
