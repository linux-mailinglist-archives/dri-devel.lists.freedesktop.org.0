Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 948DB6B2235
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 12:04:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16FF110E0EF;
	Thu,  9 Mar 2023 11:04:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A703E10E0D2;
 Thu,  9 Mar 2023 11:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678359877; x=1709895877;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=7P26T5+OSnh4bQKi43E3+a0paiR4hpuqD66aShaucro=;
 b=hfF337cLtQ/V4pMYkqMtCblaXxGhAgo3tf9GeoK/jc2EKPQWS+4IU5wk
 ok/oVohHfQuAfKAXiJ3RT0WezuLdGTruRsMcnDRCToNdLMHc1yALe6/tK
 OBLC+3JOYZliG59HtF8/jtZBlpfWJcvbGA5SBUWPuOygPJNJWLFV0W5Cc
 KynSqlYPbgPgqM4WlFJKPH3M3Pf6TTZV0DwMhMrTXB5EtaVXyBN9kf0wS
 pwYIwVZRhjT+Y2e45uRk0HFhFG7annuSN2THpCv+vEwZeYlVOgHt3QzzK
 KVoxM2foeX9519Rd7uNI6JDdbZJ56cCVR2WFPOKiMLl0Ghnwq10wpgHmD w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="337944068"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; d="scan'208";a="337944068"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2023 03:04:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="670682688"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; d="scan'208";a="670682688"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP; 09 Mar 2023 03:04:36 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 9 Mar 2023 03:04:36 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 9 Mar 2023 03:04:36 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 9 Mar 2023 03:04:36 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 9 Mar 2023 03:04:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Enu9Qko9rBW1cCSxaj0CoEXRXQaF5AmWodQwgUbAEnMXm8r7WL5yTSGZMa1Q6r+wkeXofGna1g6bAdgxXpnpBpGC8YPkSbVlbQGj6sx/R0vAxMYY7xd3xuipUM4vFaG+jkmSTaaOYP8buLG2zTSpHofcsVF3lzLd0oohWo18cy29MzTXEz3zZ5i8qiESlyfwRXUov0+TeSt2mWGYhFKk8zCqR5bCSkYkbGc25P+Ll1bPrPI5WHxuh9VgL14JgbUvAZoQw0Ps+wWz6Xh2eoVsjHPJUQwSu/Eh17ysN+T5YW0qVSHCSj/a3p6OZaIfZImOt3xZ8kXQSxPYkKScmuGq4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7P26T5+OSnh4bQKi43E3+a0paiR4hpuqD66aShaucro=;
 b=WyEeKw9FeJ0bDs6dDcQPk8DRtqVq37PZfACJqdVrHQ2ag2gDN2uBF4T/QSm2xtkdxi/wQsC4AD9+KGMnZlr+ETYGYKjjXYkGGKYKYTcMOcW6JyAWimgkGMhvHE527fKHFmzf/2d0S6CWoXgAI5PseIOD54Xn8eza3fkyZdALOe47VCpkaN7wmosrQBJ5n6pHoUKSCQVlf8EY0yKpnjSkL06CL2jWCkXHJMo3VvckC8kUXWfpfwTYKREKxRzb/dXy6PiWcb8Zhk9sw4XEKx2m1BjT772TVtZPcrkl9jbh0M/giaClDvhwx+mgSraEVeu5reOepbMADq2ADOOtrcrLuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 PH8PR11MB8063.namprd11.prod.outlook.com (2603:10b6:510:252::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Thu, 9 Mar
 2023 11:04:34 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::a238:46d2:74d3:28cb]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::a238:46d2:74d3:28cb%4]) with mapi id 15.20.6178.017; Thu, 9 Mar 2023
 11:04:34 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
Subject: Re: [Intel-gfx] [Intel-xe] [PATCH] drm/xe/display: Do not use i915
 frontbuffer tracking implementation
Thread-Topic: [Intel-gfx] [Intel-xe] [PATCH] drm/xe/display: Do not use i915
 frontbuffer tracking implementation
Thread-Index: AQHZUDZZ/xOpbYbNkEW5oAvc81EWjK7t3q8AgABUBACAAAmhAIAEERYA
Date: Thu, 9 Mar 2023 11:04:33 +0000
Message-ID: <3dc66e2540e3dcf8c626d8fe79c6334b1f1066e9.camel@intel.com>
References: <20230306141638.196359-1-maarten.lankhorst@linux.intel.com>
 <edae44735190c4d5fbbe8959f999ad7ca65f3677.camel@intel.com>
 <073f5ef3-523a-2997-c7e9-771cce8f4c24@linux.intel.com>
 <ZAZT6jJlsiTF1A5a@intel.com>
In-Reply-To: <ZAZT6jJlsiTF1A5a@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|PH8PR11MB8063:EE_
x-ms-office365-filtering-correlation-id: 75cfe245-4384-404b-b0f4-08db208e1098
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ffTcQjwVp4BTbkmB3U4hVJ0vwA9wStQi08BjLXv7hUQMDzJZiPLMCxrUxI9KE4LU0rk1PGsfVx1OO0u9WFg8CrnxeELZFCb4d5WMVRnU6uhQptZ9TZP25WQBqItcnvr3j1e408h65Gc/I7WUqd5lze12SvNzxr7GSsioDqXlIXXkJ+Wp0kzF4tWS76gDkv7nmvS8vVWFyw+/CJ6xymujSE4IJS0GMNaIw8+5g398qm4Wekjnis8DHFkdbtZKXP1VmPiqcp+NMB+hWJbXWVuPi4ytbM2jog6PCqottq/CKogzv037Fr3PwuJxZ9CbejKrcg5OzG1ilystm5o8YD3H1YEJFE/umg+RE/70LwyTNFuML+wRJAUuP0BvvsL6W3CuY9Wu+nDdBDrCaq1Y3nYRDAHEd1UzhhR0SBM5afSpJrH3Zmt41HSAZBZy4GkwyG1ba7jSLswEA8z7mDPX1U3jXZqLIp5Sw6pg+fJzdbym6CGliz0PHddySbRSQtF09eF2YJRBuQWNgrAiTSBiIamJN3wVmKy4mvfz0TOFNBMDx39SnSvf2IUb/ZzY9CluSzkyfM9MFjgDOs684Hsrq/zOT1Ulkq/Hc48i0mJ0mVC3eHRNYvy1UYdYvuxOdr3MTAqx1nN4M8To1wu7BaGkC+6mXyhcXE996Lb3zq9PBk4cTgn914hASajBqtN5WGY7auEir81nNLQvZhqKvfPBcMZPEQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(346002)(136003)(366004)(39860400002)(396003)(451199018)(66574015)(54906003)(110136005)(36756003)(38070700005)(38100700002)(86362001)(82960400001)(122000001)(6512007)(6506007)(26005)(53546011)(83380400001)(186003)(2616005)(71200400001)(316002)(5660300002)(478600001)(6486002)(4326008)(41300700001)(8936002)(2906002)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(8676002)(91956017);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OUtORjNtSC92VEVSdWJ2M2t0a1cvNzJMcFB0dGVINmE2QVN1am9wUjBvSk12?=
 =?utf-8?B?TDV5MWdkRmJnaFpubjJjV1N3Rzl4NVg3aDVCUnFKNHBhUUxxVW9qMXNURUdT?=
 =?utf-8?B?UlllWDNlTjQ2SUtQL0VjSDMzRSt3ek0zY2hVWUxZblhqV1lXNU9sbTQzSHAv?=
 =?utf-8?B?UkwrMk14MzkxN1BnWUpUUGtFcFVNRTUvNm1qc1VUMVJncFI1UXduMTk2T1FJ?=
 =?utf-8?B?UFRybkt6dHY0OGMwS3JwSVZ1VzdOYUZWRVY1Vkw2VVhRenFEN21YNzRLd0NZ?=
 =?utf-8?B?UmRmR0RXTWRCd2hEbzQxTEJsNk1lVUlRc0hKOGdnQUJRWVpMYWswcnBqR1ZW?=
 =?utf-8?B?R0lPYXRBYTFOdnY5K01YRUV4QnBVUHBIZnJCYTBiQzVyUStyVzdsbFRSb0t3?=
 =?utf-8?B?MkN6b0dxU1gwUEpTYnJKSkFmTXlZR0MyamJwVk5KeWFPZmpzTmJ6SU5hUlN3?=
 =?utf-8?B?b1VCVUgxcTRsK2w5WWJBVHo4NmRGOC9sa2ZkdzRiSk5mM3dRU3NBWkFreUp0?=
 =?utf-8?B?QXBjL0tnSHp3NXpyaVRtTDM0TUltaWlVNnU5VGxZbS9aZERVV29uNjFzODI2?=
 =?utf-8?B?TCt4TmEyVm5MK2RXYmFkb3dUZE9zM0Q5Q0xoMTFJRGdCeFBlempLdjdPY1I1?=
 =?utf-8?B?YldjY2dMZWlnM0R1N3ZQSzU0WEtHRFNJREJlcEE3QVdDa0FndmZuMElxeWFL?=
 =?utf-8?B?WFNKRnFaYm56R2YwaFpOSkN0eFRwNW93R0FrR01yZnJuUG9EMmdKZHhmbXJr?=
 =?utf-8?B?Ky9JcWJxZlJWTnpyd3A4djZsc0wzY2pMQmUxN01qbmQvM1RpeUVsR3Q1VlQz?=
 =?utf-8?B?TXRVUCtETzdsR2RwUncvUUZYU0xoL2ZsTUk0UUF3R21Vc1VQMjhPbjdHelpO?=
 =?utf-8?B?bTBDK1NVbEpRajVTVnBQZVlWS0hSLzRPK2xSbEtDQUs4c25BcytMMjM2KzRU?=
 =?utf-8?B?T1lJK1hhb2pYVTRPYnJJYU5KUTdqbm0xelljNEcrMFhZOUpOYUFNNjBUSFds?=
 =?utf-8?B?aHV4TVdnclBVdWp1NHlsYWZNaFkrb24vZUdhbkpWOXYvT3BFaTdwanJYQWQz?=
 =?utf-8?B?YUxEY3hyNnlvVDRnUEdTeXYzUWhXUW5pZWVTOThFbVVGeFpuT3VaQnQwWDVM?=
 =?utf-8?B?WGQ3aGpXUU1VZkd3enlpaW8reS9QK1lGNkhPaEF0N3NscEJSSlh0WlNCSkhF?=
 =?utf-8?B?akpWYm5ab213czhFRUN5dFhod1JiandiNTNWYWl6cURGUHhwczJYcmxqcDdp?=
 =?utf-8?B?dHpkYkUyczF0eEtTTU5yTk81NnU0VDdRQ2FUNlFka0ltSUtUNFhDQzRoVEtl?=
 =?utf-8?B?U3JvRGZOcjBFZzROQnQrUmFCblkyZm1wekJRaXhSeWVNNEJPempOMmwxelkw?=
 =?utf-8?B?V2t0VDBYSWJ5czRDNldmRndEOUcvRDVqNUFwQmJsWmN6RitRNWorSEVvRjJJ?=
 =?utf-8?B?ZFUxbE1DaFZtQXd2aHJGOThpdXpyQXZKNUc4M1ZXKzM0SHdOSzlKTzBiKzlu?=
 =?utf-8?B?TlpZZlUySU9mcWp0WmpRUVhhTzh5MlNxb1JyLzMzcVBNN01tY2JrU0pqOGJ3?=
 =?utf-8?B?aldPU2dQbTB6eXd1UWlncmhScG9hQldzZk1GNTM2N09iNjhmK3lDNU10bkdO?=
 =?utf-8?B?ZlVPWno4djRPNFJLQkw4RHQ0Qy9kcmZBdjBWU2NYVDlIOGdZaE5UcC84WG80?=
 =?utf-8?B?UzRNRnQ2d3lTS05TUW40cyt0UkZ0RCtnaGNkSTZVaS9xZlV4bVQxMEIwZWJw?=
 =?utf-8?B?TER2eVNFWHpPbWxNZFlqNjd6VGVJYi9NV3c5T3M1czhidVdQbE9ycU0wTk9L?=
 =?utf-8?B?cmJWTXF4Z1JJT1FsbW1raURjQUZWTW85VWNocVVwY3JlMjNPZ2tsMTRZdjZi?=
 =?utf-8?B?SHh1RkVaYTV6UStmUlhYbjdTMVk4NjZQcUVhbXFMcjBnaXNQMElEV3QwZ2Zp?=
 =?utf-8?B?VjRNYnpmRk4xUW5zbUd2MjBmNzUvcG94VVd3UnhpbnVOOU1WVFBiTWRMejgy?=
 =?utf-8?B?Y3NKZXEvekNWM20rKzRZaU9ZdVZRNzUzME5KdHBDSkRaM2dUU3NSdXpLbjR0?=
 =?utf-8?B?MENzRkNBVjZZbjFqR0lpdkhTNUhJbUFCaHdYQk1mMG51clNVQTJKaWt2aFIx?=
 =?utf-8?B?dWV4OU9wUitwRDdiNEVMTjgwaEtZYnhROTRQWWxIc0wvVkxRMnVNOE1VR2ZI?=
 =?utf-8?B?elE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B02830FE7D8C124E971C206287404D49@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75cfe245-4384-404b-b0f4-08db208e1098
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2023 11:04:33.8631 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JG4wYysfSqoeJOJqVg79qU11SFDEs5LY07YB8Fz9u4g1saD4MPCsRdeGd1WT1yCZg/nNRFhWYVJTOJjafiNBP+xn96Ggn3QmviGxowYpCd8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8063
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
Cc: "Souza, Jose" <jose.souza@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIzLTAzLTA2IGF0IDIyOjU4ICswMjAwLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6
DQo+IE9uIE1vbiwgTWFyIDA2LCAyMDIzIGF0IDA5OjIzOjUwUE0gKzAxMDAsIE1hYXJ0ZW4gTGFu
a2hvcnN0IHdyb3RlOg0KPiA+IEhleSwNCj4gPiANCj4gPiBPbiAyMDIzLTAzLTA2IDE2OjIzLCBT
b3V6YSwgSm9zZSB3cm90ZToNCj4gPiA+IE9uIE1vbiwgMjAyMy0wMy0wNiBhdCAxNToxNiArMDEw
MCwgTWFhcnRlbiBMYW5raG9yc3Qgd3JvdGU6DQo+ID4gPiA+IEFzIGEgZmFsbGJhY2sgaWYgd2Ug
ZGVjaWRlIG5vdCB0byBtZXJnZSB0aGUgZnJvbnRidWZmZXINCj4gPiA+ID4gdHJhY2tpbmcsIGFs
bG93DQo+ID4gPiA+IGk5MTUgdG8ga2VlcCBpdHMgb3duIGltcGxlbWVudGF0aW9uLCBhbmQgZG8g
dGhlIHJpZ2h0IHRoaW5nIGluDQo+ID4gPiA+IFhlLg0KPiA+ID4gPiANCj4gPiA+ID4gVGhlIGZy
b250YnVmZmVyIHRyYWNraW5nIGZvciBYZSBpcyBzdGlsbCBkb25lIHBlci1mYiwgd2hpbGUNCj4g
PiA+ID4gaTkxNSBjYW4NCj4gPiA+ID4ga2VlcCBkb2luZyB0aGUgd2VpcmQgaW50ZWxfZnJvbnRi
dWZmZXIgKyBpOTE1X2FjdGl2ZSB0aGluZw0KPiA+ID4gPiB3aXRob3V0DQo+ID4gPiA+IGJsb2Nr
aW5nIFhlLg0KPiA+ID4gUGxlYXNlIGFsc28gZGlzYWJsZSBQU1IgYW5kIEZCQyB3aXRoIHRoaXMg
b3IgYXQgbGVhc3QgYWRkIGEgd2F5DQo+ID4gPiBmb3IgdXNlcnMgdG8gZGlzYWJsZSB0aG9zZSBm
ZWF0dXJlcy4NCj4gPiA+IFdpdGhvdXQgZnJvbnRidWZmZXIgdHJhY2tlciB0aG9zZSB0d28gZmVh
dHVyZXMgd2lsbCBicmVhayBpbiBzb21lDQo+ID4gPiBjYXNlcy4NCj4gPiANCj4gPiBGQkMgYW5k
IFBTUiB3b3JrIGNvbXBsZXRlbHkgYXMgZXhwZWN0ZWQuIEkgZG9uJ3QgcmVtb3ZlIGZyb250YnVm
ZmVyDQo+ID4gdHJhY2tpbmc7IEkgb25seSByZW1vdmUgdGhlIEdFTSBwYXJ0cy4NCj4gPiANCj4g
PiBFeHBsaWNpdCBpbnZhbGlkYXRpb24gdXNpbmcgcGFnZWZsaXAgb3IgQ1BVIHJlbmRlcmluZyAr
IERpcnR5RkINCj4gPiBjb250aW51ZSANCj4gPiB0byB3b3JrLCBhcyBJIHZhbGlkYXRlZCBvbiBt
eSBsYXB0b3Agd2l0aCBGQkMuDQo+IA0KPiBOZWl0aGVyIG9mIHdoaWNoIGFyZSByZWxldmFudCB0
byB0aGUgcmVtb3ZhbCBvZiB0aGUgZ2VtIGhvb2tzLg0KPiANCj4gTGlrZSBJIGFscmVhZHkgc2Fp
ZCB+MTAgdGltZXMgaW4gdGhlIGxhc3QgbWVldGluZywgd2UgbmVlZCBhIHByb3Blcg0KPiB0ZXN0
Y2FzZS4gSGVyZSdzIGEgcm91Z2ggaWRlYSB3aGF0IGl0IHNob3VsZCBkbzoNCj4gDQo+IHByZXBh
cmUgYSBiYXRjaCB3aXRoDQo+IDEuIHNwaW5uZXINCj4gMi4gc29tZXRoaW5nIHRoYXQgY2xvYmJl
cnMgdGhlIGZiDQo+IA0KPiBUaGVuDQo+IDEuIGdyYWIgcmVmZXJlbmNlIGNyYw0KPiAyLiBleGVj
YnVmZmVyDQo+IDMuIGRpcnR5ZmINCj4gNC4gd2FpdCBsb25nIGVub3VnaCBmb3IgZmJjIHRvIHJl
Y29tcHJlc3MNCj4gNS4gdGVybWluYXRlIHNwaW5uZXINCj4gNi4gZ2VtX3N5bmMNCj4gNy4gZ3Jh
YiBjcmMgYW5kIGNvbXBhcmUgd2l0aCByZWZlcmVuY2UNCj4gDQo+IE5vIGlkZWEgd2hhdCB0aGUg
Y3VycmVudCBzdGF0dXMgb2YgUFNSK0NSQyBpcywgc28gbm90IHN1cmUNCj4gd2hldGhlciB3ZSBj
YW4gYWN0dWFsbHkgdGVzdCBQU1Igb3Igbm90Lg0KPiANCg0KQ1JDIGNhbGN1bGF0aW9uIGRvZXNu
J3Qgd29yayB3aXRoIFBTUiBjdXJyZW50bHkuIFBTUiBpcyBkaXNhYmxlZCBpZiBDUkMNCmNhcHR1
cmUgaXMgcmVxdWVzdGVkLg0KDQpBcmUgd2Ugc3VwcG9zZWQgdG8gc3VwcG9ydCBmcm9udGJ1ZmZl
ciByZW5kZXJpbmcgdXNpbmcgR1BVPw0KDQpCUiwNCg0KSm91bmkgSMO2Z2FuZGVyDQoNCg==
