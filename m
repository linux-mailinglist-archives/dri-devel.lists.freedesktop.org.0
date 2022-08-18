Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AA7598E50
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 22:49:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFE9E10E030;
	Thu, 18 Aug 2022 20:49:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C1B310E031;
 Thu, 18 Aug 2022 20:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660855743; x=1692391743;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=VJ2hgMHNNE5QzR8PbICtFxgjdmgWZdxaQokimEggxP0=;
 b=K1+xxWorldotaBp+BsX7LpeVLZWWrbzIKnC68kC8qEGN5JzGq20cpTIO
 9HDeWtRCPJYpuisyHNOZBPEzUt4wN7FUY2C8vCuy/124SGSOc9RsNruvU
 C8xQkNeWXcZkm1iqVeJBwp0+3CxO2AAOLlG6StD6lHtNhQaFyAi7sTbw7
 wshXmnpVj6TjBXqgjNsN950VhV7Zyd77AKC7Le/hKlyCXqxj0fxdU4AmV
 G1U2nOL5nh2Vu0cl3Yi8XtP5ZmbQ/iZXXIG6t1N8l0Oy7F2+aa6/N6mVe
 srbdgvfuLfHi6kiHEDocq3QN4BOc8ZE3WCq1i52CBvgaFgLVx4bq30R2e Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10443"; a="294144161"
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="294144161"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 13:49:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="584371155"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 18 Aug 2022 13:48:59 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 18 Aug 2022 13:48:57 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 18 Aug 2022 13:48:57 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Thu, 18 Aug 2022 13:48:57 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Thu, 18 Aug 2022 13:48:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CsbadWCihTM/kBZQy20FBFJNWXOeiX6evOkXV+dQa3AmUs+ExaNZcXE3/SYvaE8SZYyAB3fsCyqFOegbCoQea2XMMt0z9ahFwsv/BWR0G0dRstP0WZNN4NXUuLZZWKvxHreTiZOhA2tkumXq1glcOuX82YTrcBIXKooeMAn16IFI3COf6bf8r1hemM+GuHhH+9fNfXLQkn0IJIyoab3CMmot6bvFnkD6xRsPmUY4eGcoxBJLyAohkOTB0FPRPi468yI0gnGPTziCemaE3igYmDFOR7AtwSzBRWaGxoRveTAXdvPc9Yh6Nk1cjf2P+duDOpPMe7+Ku94PPZQed0tlKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VJ2hgMHNNE5QzR8PbICtFxgjdmgWZdxaQokimEggxP0=;
 b=cbnKCeHvAIDt1NOZvpfQ9GW0fVjCtrW9NwvgGaM9ILyj/ovTCa7Soa7rF9gheNuDcsTaP35bCFlcBN13hinqxMeDWIL6R84CVULhwuqq3MxY8QuIpTiQld3qRGc5/DUE6/00OdSCXwEq/EHsKMTlbbhxYVjxQQe+5KdVfKKPbb4lmwC/p8RSCBNXD8OKMFFckN3n1A0bxz/nS8BCFcojCwGMLMPq0SqBWNCwKnq8Fe1ibZ8psCBF8c8tNtC3XZ4IZbAVfBB9LFvIb0PH80FkeMs1CI/2LPA9tDXNmK24iADyyA/CbtJ99zdFX5uXBuiNt4WnsQUNrDkD68HYLe3vpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM5PR1101MB2347.namprd11.prod.outlook.com (2603:10b6:3:a2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.24; Thu, 18 Aug
 2022 20:48:55 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79%6]) with mapi id 15.20.5504.027; Thu, 18 Aug 2022
 20:48:55 +0000
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH i-g-t] i915/guc: Disable i915_pm_rps when SLPC is enabled
Thread-Topic: [PATCH i-g-t] i915/guc: Disable i915_pm_rps when SLPC is enabled
Thread-Index: AQHYs0MrRM6GhVfCeE+86Fp/wMkF0a21IVOA
Date: Thu, 18 Aug 2022 20:48:55 +0000
Message-ID: <7ff88d43156adcd1faf8fc82af8a69bdae000c57.camel@intel.com>
References: <20220818204255.20974-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20220818204255.20974-1-vinay.belgaumkar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.4 (3.42.4-2.fc35) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f6453b3e-87e1-430c-5001-08da815b10f0
x-ms-traffictypediagnostic: DM5PR1101MB2347:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: s2mu6I22MaZ4P5shKHgKxacXNWStel/DOjh2xJ4I0RaMg1Nv8KVFqALF+7OykRDnwwOG/xUKeprbPNJkbFoT1FJkVprbbKWVYcNMzk+95av9P6DYQ1Pg6Ep3A8c6d0wF79k1jVTPJUwaTAtJsLJHR6c4h0uiam+i9TGuoEzVoOV0H62FBs2vDO33BgQYPn2dQp1JXfNRbXAiNZSrKOvD3/G1F/IgeihPdicTrn2vcc40+CCsL9ObmlvSe2QLNs+CTpJC0Rq+x/zca/ZNRgrunQZLssTZnjgg4jh2C4kCl9eowqg+Cvs5G9vIrBDdpUCT18zxZFzA2185hgFx4Uk31P+g/jyECCTZTtSlm3nMX2/6jDmh/8DNHD1cFL6MGp25lGWCrAGSNqxZJzTDNS+bVnma6HB0fDkp0slRp986ZAsAMCOm1Gv43IHGlbgDsg2OsM4kQWTzksgM+4y/VDfz0F6nmkjuZ/VjSkmkcHubxsVMXLC+gRIxbIGhMmsy7CrPOYpj3E6Pvz8+jubMCblrZdPFkk49WjkWsQKoRzgBQ8mF4zCVzeJ8Lui7hTq1oVG8IxZKEnRZt0yU+BYviAOP8jYZbxJhIGbtGMv68bGGKBpme9IoTEWo/oTf7LYMRscYkSqNmRGvUvZrpI0OB7PiRwdEFr9NXutHMAPqhftm0DSGCgFc99JEl0qRM6CA1qCU48rweorEOzmE5QWMmvRKKg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(396003)(376002)(366004)(346002)(136003)(82960400001)(38100700002)(38070700005)(6636002)(110136005)(122000001)(36756003)(71200400001)(316002)(8936002)(5660300002)(41300700001)(2906002)(6506007)(91956017)(8676002)(66556008)(64756008)(76116006)(450100002)(66446008)(26005)(83380400001)(6486002)(6512007)(966005)(66476007)(66946007)(186003)(86362001)(2616005)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RzhxeHpsVTRMeTFZSURUWkhOWGxHcnZUeThEMk1qMEFGbXA3cDh3dlZUNXhC?=
 =?utf-8?B?VGM3MncxL3NncU5uajlGSDRlRW1WMjlMMFFLMFZJaTNoV3lJR0srZWdpVWwv?=
 =?utf-8?B?RGhRMlRzbWVSQTRHRktNT3RGNVA5OVZVNUp4RlNSL1dsMTBpOSt2SkJwYnQ0?=
 =?utf-8?B?TnpMTHJLVXR4dUNCTGliMU5YTWxsRTJ1MlpTV1lwTklIZ0tJUVZoSzB3bFlL?=
 =?utf-8?B?eGYxRk9ZOVJFd2wzeWc2WmdHRjhmVFltQVNvZmlYb0FQRVhLQllJaE9LNWpB?=
 =?utf-8?B?aFQ5ejdMQ3pMOHVjeHFSNGdZOW1TTlczK2FhdGo1MzVuZC93T1RiWnRFcUxy?=
 =?utf-8?B?QjM0UkR3TEg5anRrQWo3OFB2MmY1cjMxbFVKMUR3UGt4aWR5R1FZcVl6OVBR?=
 =?utf-8?B?OVB0bCttV3NPZFg0YmhaSVp6ZmRKcUl2WjBvb1ByU05YT1JvekdNaHd5UzBq?=
 =?utf-8?B?QVEwL0JaK2tRMUM0aDJLeFVxRHhZQnNWR1FpUGpjeFJUazZYOHBhT3F2WW83?=
 =?utf-8?B?Y1pNN3ZQMk5ITHo5TUdJR3VJUC9MTC9WeEFqSUFrdG84SjBEeEcvTWhmdVNo?=
 =?utf-8?B?RXpSZ0E5T3BwYjc4WEdqVUpSa2ptY1lQQmkzSFhlbUpuWEdIM0tWcFVMS0ZN?=
 =?utf-8?B?MzVqSXMzVnlVTWdxZElFSC9oeWI0bWdiNVBhT1lEUWpia2lNMXZNQzNyTGxW?=
 =?utf-8?B?d1NLWnU2SG93WEF4WEZhV2xEV0VwZU5GQjkxZG5JNXorRHZxbGM1Tm5aODZw?=
 =?utf-8?B?RHh2eHUrenF6K2R3RTJVWk16eUpFbUxIUGUrYTNqby9ZWG16ejN6V1FLZkVN?=
 =?utf-8?B?ZGVkZFduNEVUQTZYR1lMeUhMYW5Wclh2Kzh3OTRNZFNXY2ZCVWZZQnBCY1ls?=
 =?utf-8?B?dVRZeGZScmVtOXJOQWRqL3Y4U25JVDNsbnlRcTlyVDdsZVIxNExlVkcxMXdU?=
 =?utf-8?B?MkRZWUo5dXpLczVhQlBDd3lvWCs0ODU4ZmM1cFFkWnlCcGNuSi85a05TcmlJ?=
 =?utf-8?B?SGlDR0VnNGlOSjQ3VmE0TTRrWkVUR1V2eklvRWNPd083bnZqc2pJNUR5Z0lS?=
 =?utf-8?B?bmVwTUhTRTJRaURKZjQyUVAvaFJFVUZkU3d5VXYyT0pDMmdnV0tnZWNFMCtT?=
 =?utf-8?B?R08wS2VFL3dyL3FKbm93aW9iQVQ1MnJvczE3SXRtN3IwTGkxQzRvWUVONUNq?=
 =?utf-8?B?L1dlUzlTNU5VUDFSMm1nOVpabXB6NkRUVXlnVWtGdXZJcUlmWE1mcWVXSUVo?=
 =?utf-8?B?enZac2paRlYwZGUvNkg3SnR4UWxuU1gvVjZMWFVINk1SalhualVOUk5PK1FN?=
 =?utf-8?B?c01hRmRMTEdwdFQzOHdjaDNDelBRV01tVWhCaCtSaEo4Mnh3MFlyUm1wY21O?=
 =?utf-8?B?WVhGQlpHVUF2Vjk2RlZ3ZTlOWWw2aDVqWGF3U0FSa2IvWmNhVDZtTm9pdUdQ?=
 =?utf-8?B?TldLUjBPakQ0Qy9lZHAxRDNFRk1veUtjQlFWTW52WVV6UWZKczVuWS9MWDNn?=
 =?utf-8?B?UzFHOG16cGFleGUwTXk2Vmt4SGlrMkhlVFVDemIzRWc4UXAvdXhDb1FkYVVI?=
 =?utf-8?B?ZkpVTlpKZVA2Y1F5K2xLV052aGZPZ1ZPREpKREU1UVNxWWgrTGw3dXppL1Fq?=
 =?utf-8?B?NlEyY1hWbWJnVWY4SmpXVUVPZXY5Q3lkQUY5YlRDVjBmeFltRmlBa0tHamlj?=
 =?utf-8?B?TzRFSndMc3RJRGsvWXRGTHBZb1ZZd0ZBSzBvcnhSWkx2SWFXY0FRaHZJMEtn?=
 =?utf-8?B?d253aDJjdW9TY2hRU014NnF6NjM4K0NNYlV2Z0RmTXI0cDZkem1KRk1mdzRQ?=
 =?utf-8?B?aGVJaUNGOTlONTF5U3J2b3UrRFViVmZ2cytKQUgzVGVIRURWUmdsbE0zdGh6?=
 =?utf-8?B?RUF0dFVQSS9yTWJJM1dENlVKQXFVZWowVlpYWTdOQ1ZQTUZidFRKdVdNbnFB?=
 =?utf-8?B?eE5YdW80MHgzbG1BQ1hndmlMZEMzQmJObVJXY0NNTWVaQWY3YW5pYlJCelg1?=
 =?utf-8?B?cHdtZFpzbHVFUk9MYzV4MElvaXdNU1NYRkl2NEpFV0NTN0xPSVY0eVF3MXp0?=
 =?utf-8?B?RGovaWJQV1JXdEpZOEFUTm12QUxqbDZVMi94TGlCeXEvL01kMURndmN4djRa?=
 =?utf-8?B?K0VtZDhNL2oxZHRmVFpsTDllTkdrTHFIQzd0REx6bTJRKzFtckdZOWpWSU0v?=
 =?utf-8?B?dnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6515D91C0112274DBE6C05681F51E9E1@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6453b3e-87e1-430c-5001-08da815b10f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2022 20:48:55.2069 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WRnUxAQ++4ceWWHduaZgOirzjhNxjdK7LImvUJF+gblDKZ6OsE8ZCN097mW2cJmjDyo832rhZeTjeFdyAvotsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2347
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

T24gVGh1LCAyMDIyLTA4LTE4IGF0IDEzOjQyIC0wNzAwLCBWaW5heSBCZWxnYXVta2FyIHdyb3Rl
Ogo+IFRoZXNlIHRlc3RzIHdlcmUgc3BlY2lmaWNhbGx5IGRlc2lnbmVkIGZvciBob3N0IFR1cmJv
LiBTa2lwCj4gdGhlbSB3aGVuIFNMUEMgaXMgZW5hYmxlZCBhcyB0aGV5IGZhaWwgZnJlcXVlbnRs
eS4gV2Ugd2lsbCBsb29rCj4gdG8ga2VlcCBhZGRpbmcgdG8gU0xQQyB0ZXN0IGNvdmVyYWdlIHdp
dGggdGhlc2Ugc2NlbmFyaW9zLgo+IAo+IEJ1ZzogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Au
b3JnL2RybS9pbnRlbC8tL2lzc3Vlcy8zOTYzCj4gQnVnOiBodHRwczovL2dpdGxhYi5mcmVlZGVz
a3RvcC5vcmcvZHJtL2ludGVsL2lzc3Vlcy80MDE2Cj4gQnVnOiBodHRwczovL2dpdGxhYi5mcmVl
ZGVza3RvcC5vcmcvZHJtL2ludGVsL2lzc3Vlcy81NDY4Cj4gQnVnOiBodHRwczovL2dpdGxhYi5m
cmVlZGVza3RvcC5vcmcvZHJtL2ludGVsL2lzc3Vlcy81ODMxCj4gCj4gQ2M6IFJvZHJpZ28gVml2
aSA8cm9kcmlnby52aXZpQGludGVsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBWaW5heSBCZWxnYXVt
a2FyIDx2aW5heS5iZWxnYXVta2FyQGludGVsLmNvbT4KCklkZWFsbHkgd2Ugc2hvdWxkIGFkZCBv
dGhlciBhcGkgdGVzdHMgYW5kIGNhc2VzIHRvIHZhbGlkYXRlIHRoZQpleHBlY3RlZCBzbHBjIGZs
b3cuCkJ1dCB0aGlzIGNvdWxkIGJlIGRvbmUgaW4gYSBmb2xsb3ctdXAgd29yayBzaW5jZSByaWdo
dCBub3cgaXQgaXMKaW1wb3J0YW50IHRvIG1lcmdlCnRoZSBmaXggZm9yIHRoZSBwZXJmb3JtYW5j
ZSByZWdyZXNzaW9uIHdpdGhvdXQgdGhlIGlnbm9yZV9lZmZpY2llbnQKZnJlcS4KClNvLApSZXZp
ZXdlZC1ieTogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPgoKPiAtLS0KPiDC
oGxpYi9pZ3RfcG0uY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDE1ICsrKysrKysrKysrKysr
Kwo+IMKgbGliL2lndF9wbS5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAxICsKPiDCoHRl
c3RzL2k5MTUvaTkxNV9wbV9ycHMuYyB8IDI5ICsrKysrKysrKysrKysrKysrKysrKysrKy0tLS0t
Cj4gwqAzIGZpbGVzIGNoYW5nZWQsIDQwIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL2xpYi9pZ3RfcG0uYyBiL2xpYi9pZ3RfcG0uYwo+IGluZGV4IDZlYmJh
ZDMzLi43OWJkNmUyYSAxMDA2NDQKPiAtLS0gYS9saWIvaWd0X3BtLmMKPiArKysgYi9saWIvaWd0
X3BtLmMKPiBAQCAtMTIwMiwzICsxMjAyLDE4IEBAIHZvaWQKPiBpZ3RfcG1fcHJpbnRfcGNpX2Nh
cmRfcnVudGltZV9zdGF0dXModm9pZCkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oGlndF9wbV9wcmludF9wY2lfZGV2X3J1bnRpbWVfc3RhdHVzKF9fcGNpX2Rldl9wd3JhdHRyCj4g
W2ldLnBjaV9kZXYpOwo+IMKgwqDCoMKgwqDCoMKgwqB9Cj4gwqB9Cj4gKwo+ICtib29sIGk5MTVf
aXNfc2xwY19lbmFibGVkKGludCBmZCkKPiArewo+ICvCoMKgwqDCoMKgwqDCoGludCBkZWJ1Z2Zz
X2ZkID0gaWd0X2RlYnVnZnNfZGlyKGZkKTsKPiArwqDCoMKgwqDCoMKgwqBjaGFyIGJ1Zls0MDk2
XTsKPiArwqDCoMKgwqDCoMKgwqBpbnQgbGVuOwo+ICsKPiArwqDCoMKgwqDCoMKgwqBpZ3RfcmVx
dWlyZShkZWJ1Z2ZzX2ZkICE9IC0xKTsKPiArCj4gK8KgwqDCoMKgwqDCoMKgbGVuID0gaWd0X2Rl
YnVnZnNfc2ltcGxlX3JlYWQoZGVidWdmc19mZCwKPiAiZ3QvdWMvZ3VjX3NscGNfaW5mbyIsIGJ1
Ziwgc2l6ZW9mKGJ1ZikpOwo+ICvCoMKgwqDCoMKgwqDCoGlmIChsZW4gPCAwKQo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gZmFsc2U7Cj4gK8KgwqDCoMKgwqDCoMKgZWxz
ZQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gc3Ryc3RyKGJ1ZiwgIlNM
UEMgc3RhdGU6IHJ1bm5pbmciKTsKPiArfQo+IGRpZmYgLS1naXQgYS9saWIvaWd0X3BtLmggYi9s
aWIvaWd0X3BtLmgKPiBpbmRleCBmMjhiNmViZi4uY2JiZGUxMmIgMTAwNjQ0Cj4gLS0tIGEvbGli
L2lndF9wbS5oCj4gKysrIGIvbGliL2lndF9wbS5oCj4gQEAgLTc5LDUgKzc5LDYgQEAgdm9pZCBp
Z3RfcG1fZW5hYmxlX3BjaV9jYXJkX3J1bnRpbWVfcG0oc3RydWN0Cj4gcGNpX2RldmljZSAqcm9v
dCwKPiDCoHZvaWQgaWd0X3BtX3NldHVwX3BjaV9jYXJkX3J1bnRpbWVfcG0oc3RydWN0IHBjaV9k
ZXZpY2UgKnBjaV9kZXYpOwo+IMKgdm9pZCBpZ3RfcG1fcmVzdG9yZV9wY2lfY2FyZF9ydW50aW1l
X3BtKHZvaWQpOwo+IMKgdm9pZCBpZ3RfcG1fcHJpbnRfcGNpX2NhcmRfcnVudGltZV9zdGF0dXMo
dm9pZCk7Cj4gK2Jvb2wgaTkxNV9pc19zbHBjX2VuYWJsZWQoaW50IGZkKTsKPiDCoAo+IMKgI2Vu
ZGlmIC8qIElHVF9QTV9IICovCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2k5MTUvaTkxNV9wbV9ycHMu
YyBiL3Rlc3RzL2k5MTUvaTkxNV9wbV9ycHMuYwo+IGluZGV4IGQwNmFkZTI3Li5jY2UwNzAwOSAx
MDA2NDQKPiAtLS0gYS90ZXN0cy9pOTE1L2k5MTVfcG1fcnBzLmMKPiArKysgYi90ZXN0cy9pOTE1
L2k5MTVfcG1fcnBzLmMKPiBAQCAtOTE0LDM1ICs5MTQsNTQgQEAgaWd0X21haW4KPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlndF9pbnN0YWxsX2V4aXRfaGFuZGxlcihwbV9ycHNf
ZXhpdF9oYW5kbGVyKTsKPiDCoMKgwqDCoMKgwqDCoMKgfQo+IMKgCj4gLcKgwqDCoMKgwqDCoMKg
aWd0X3N1YnRlc3QoImJhc2ljLWFwaSIpCj4gK8KgwqDCoMKgwqDCoMKgaWd0X3N1YnRlc3QoImJh
c2ljLWFwaSIpIHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWd0X3NraXBfb25f
ZihpOTE1X2lzX3NscGNfZW5hYmxlZChkcm1fZmQpLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiVGhpcyBzdWJ0ZXN0IGlzIG5vdCBz
dXBwb3J0ZWQgd2hlbgo+IFNMUEMgaXMgZW5hYmxlZCIpOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgbWluX21heF9jb25maWcoYmFzaWNfY2hlY2ssIGZhbHNlKTsKPiArwqDCoMKg
wqDCoMKgwqB9Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgLyogVmVyaWZ5IHRoZSBjb25zdHJhaW50
cywgY2hlY2sgaWYgd2UgY2FuIHJlYWNoIGlkbGUgKi8KPiAtwqDCoMKgwqDCoMKgwqBpZ3Rfc3Vi
dGVzdCgibWluLW1heC1jb25maWctaWRsZSIpCj4gK8KgwqDCoMKgwqDCoMKgaWd0X3N1YnRlc3Qo
Im1pbi1tYXgtY29uZmlnLWlkbGUiKSB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oGlndF9za2lwX29uX2YoaTkxNV9pc19zbHBjX2VuYWJsZWQoZHJtX2ZkKSwKPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIlRoaXMgc3Vi
dGVzdCBpcyBub3Qgc3VwcG9ydGVkIHdoZW4KPiBTTFBDIGlzIGVuYWJsZWQiKTsKPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoG1pbl9tYXhfY29uZmlnKGlkbGVfY2hlY2ssIHRydWUp
Owo+ICvCoMKgwqDCoMKgwqDCoH0KPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqAvKiBWZXJpZnkgdGhl
IGNvbnN0cmFpbnRzIHdpdGggaGlnaCBsb2FkLCBjaGVjayBpZiB3ZSBjYW4KPiByZWFjaCBtYXgg
Ki8KPiDCoMKgwqDCoMKgwqDCoMKgaWd0X3N1YnRlc3QoIm1pbi1tYXgtY29uZmlnLWxvYWRlZCIp
IHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWd0X3NraXBfb25fZihpOTE1X2lz
X3NscGNfZW5hYmxlZChkcm1fZmQpLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiVGhpcyBzdWJ0ZXN0IGlzIG5vdCBzdXBwb3J0ZWQg
d2hlbgo+IFNMUEMgaXMgZW5hYmxlZCIpOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgbG9hZF9oZWxwZXJfcnVuKEhJR0gpOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgbWluX21heF9jb25maWcobG9hZGVkX2NoZWNrLCBmYWxzZSk7Cj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBsb2FkX2hlbHBlcl9zdG9wKCk7Cj4gwqDCoMKgwqDCoMKgwqDCoH0K
PiDCoAo+IMKgwqDCoMKgwqDCoMKgwqAvKiBDaGVja3MgaWYgd2UgYWNoaWV2ZSBib29zdCB1c2lu
ZyBnZW1fd2FpdCAqLwo+IC3CoMKgwqDCoMKgwqDCoGlndF9zdWJ0ZXN0KCJ3YWl0Ym9vc3QiKQo+
ICvCoMKgwqDCoMKgwqDCoGlndF9zdWJ0ZXN0KCJ3YWl0Ym9vc3QiKSB7Cj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoGlndF9za2lwX29uX2YoaTkxNV9pc19zbHBjX2VuYWJsZWQoZHJt
X2ZkKSwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgIlRoaXMgc3VidGVzdCBpcyBub3Qgc3VwcG9ydGVkIHdoZW4KPiBTTFBDIGlzIGVu
YWJsZWQiKTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHdhaXRib29zdChkcm1f
ZmQsIGZhbHNlKTsKPiArwqDCoMKgwqDCoMKgwqB9Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgaWd0
X2Rlc2NyaWJlKCJDaGVjayBpZiB0aGUgb3JkZXIgb2YgZmVuY2VzIGRvZXMgbm90IGFmZmVjdAo+
IHdhaXRib29zdGluZyIpOwo+IC3CoMKgwqDCoMKgwqDCoGlndF9zdWJ0ZXN0KCJmZW5jZS1vcmRl
ciIpCj4gK8KgwqDCoMKgwqDCoMKgaWd0X3N1YnRlc3QoImZlbmNlLW9yZGVyIikgewo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZ3Rfc2tpcF9vbl9mKGk5MTVfaXNfc2xwY19lbmFi
bGVkKGRybV9mZCksCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgICJUaGlzIHN1YnRlc3QgaXMgbm90IHN1cHBvcnRlZCB3aGVuCj4gU0xQ
QyBpcyBlbmFibGVkIik7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBmZW5jZV9v
cmRlcihkcm1fZmQpOwo+ICvCoMKgwqDCoMKgwqDCoH0KPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqBp
Z3RfZGVzY3JpYmUoIkNoZWNrIGlmIGNvbnRleHQgcmV1c2UgZG9lcyBub3QgYWZmZWN0Cj4gd2Fp
dGJvb3N0aW5nIik7Cj4gLcKgwqDCoMKgwqDCoMKgaWd0X3N1YnRlc3QoImVuZ2luZS1vcmRlciIp
Cj4gK8KgwqDCoMKgwqDCoMKgaWd0X3N1YnRlc3QoImVuZ2luZS1vcmRlciIpIHsKPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWd0X3NraXBfb25fZihpOTE1X2lzX3NscGNfZW5hYmxl
ZChkcm1fZmQpLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAiVGhpcyBzdWJ0ZXN0IGlzIG5vdCBzdXBwb3J0ZWQgd2hlbgo+IFNMUEMg
aXMgZW5hYmxlZCIpOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZW5naW5lX29y
ZGVyKGRybV9mZCk7Cj4gK8KgwqDCoMKgwqDCoMKgfQo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoC8q
IFRlc3QgYm9vc3QgZnJlcXVlbmN5IGFmdGVyIEdQVSByZXNldCAqLwo+IMKgwqDCoMKgwqDCoMKg
wqBpZ3Rfc3VidGVzdCgicmVzZXQiKSB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBpZ3RfaGFuZ190IGhhbmcgPSBpZ3RfYWxsb3dfaGFuZyhkcm1fZmQsIDAsIDApOwo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZ3Rfc2tpcF9vbl9mKGk5MTVfaXNfc2xwY19lbmFi
bGVkKGRybV9mZCksCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgICJUaGlzIHN1YnRlc3QgaXMgbm90IHN1cHBvcnRlZCB3aGVuCj4gU0xQ
QyBpcyBlbmFibGVkIik7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB3YWl0Ym9v
c3QoZHJtX2ZkLCB0cnVlKTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlndF9k
aXNhbGxvd19oYW5nKGRybV9mZCwgaGFuZyk7Cj4gwqDCoMKgwqDCoMKgwqDCoH0KCg==
