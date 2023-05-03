Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A89946F5D60
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 19:57:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23D5C10E32A;
	Wed,  3 May 2023 17:57:03 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9206B894EA;
 Wed,  3 May 2023 17:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683136620; x=1714672620;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=0nyAXF5q5xcNVVRT1gTJo8O/HniR/s0FznBnwNTcFtI=;
 b=Q5UhVpnoPCAX32QCGXClkcAN05X9hr8IlqbUkkEf7WdwoMgD1U0lgCBX
 w0by8cI1IhqrasnUSAD3HUGYUITH2x4FtLeFHJBi5raG3rijrmCVyMwQX
 DcgylhP2zGl7WShOUc8kKCpvE/z3D76Zkz9YmZ5cuQFLWAblhS/GG7aO9
 CmRmSwKaoXd585ScXO+XeB4dK5Pl24+sYWGyvRNNY0zDqlZFATyTFmRc7
 zfKZz1o0y6g91bMCT8hcCurHQWGsoTPVzj0P6j4b65uLc74X0ODnZhzIc
 fGQuX50+DpiutKghOUJxNtPcRpnkq5cwjiATDAiM82SEmfc1b6iBhudDy A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="351702278"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; d="scan'208";a="351702278"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 10:54:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="808361793"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; d="scan'208";a="808361793"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP; 03 May 2023 10:54:30 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 3 May 2023 10:54:29 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 3 May 2023 10:54:29 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 3 May 2023 10:54:29 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.42) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 3 May 2023 10:54:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FDDV20MPQkV5s4tGMaDGRN4lLKvN0bOCyCkS2y4sv3ly2NxLUOErgS2DvQEo44OFx3sokLl+aJhH6u4DW1eUJ/OYKla41G1SV1+EkPQGUpMdGbvnUHQfLYwROMcYcVsWtZEZOEgv9EL9lBRWcccVHSazhEsMHIHxP6KR7NKOpOFkAzVIRQu3QgjgHw+MeRr/U3xTQ5KD4/1TQ3o9U4Ah2yehwsE7rtfOoACuSAxu92eN+Xyj9AqZPOsgNON2gu/mS4nDKXlrXd1uiatp3z0FSueQ0cLbGJjwqp/jmj1lKJQascF9Bbu7pGJLAtnOBmrmujtN0QzAc76lTeKbVlDA5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0nyAXF5q5xcNVVRT1gTJo8O/HniR/s0FznBnwNTcFtI=;
 b=Xwf93V5TGaxlCxCUGVERqvMc/rpHCz/mAc22M/ADGC1cRiv1CwxpziIxg4IEUaam1Y0lAnRmvn9JBEXTJDjK/bZLu373mfGIM9tJkF8DhgIbwJ0AaMtB1uNnqNJv2iF/u42zylwYLpaQliWlc7BGnaVfe3zxp4CyF8Ke01EWlqT7zjpvVvP/n7t0ww/JlwoMqfj1WSC2iagtnOam4I8V2BkJ02277K6M0R4bbhgZ5W98XmXoKLoTJ7Z7OKBHTtxFSMMZWrIAmsxypFGBDEpBeSesYUayOTEw76oPuTp1/qKk9zqwiJ2MtXUKjhNnxvhdH/bUl7+TmEBPanB42bX23g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 CO1PR11MB4851.namprd11.prod.outlook.com (2603:10b6:303:9b::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.22; Wed, 3 May 2023 17:54:25 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3%5]) with mapi id 15.20.6363.022; Wed, 3 May 2023
 17:54:25 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Harrison, John C" <john.c.harrison@intel.com>,
 "Intel-GFX@Lists.FreeDesktop.Org" <Intel-GFX@Lists.FreeDesktop.Org>
Subject: Re: [Intel-gfx] [PATCH v2 3/4] drm/i915/guc: Capture list naming
 clean up
Thread-Topic: [Intel-gfx] [PATCH v2 3/4] drm/i915/guc: Capture list naming
 clean up
Thread-Index: AQHZegM9Fi8CQekXBUib9SIfISbzO69I3I+A
Date: Wed, 3 May 2023 17:54:25 +0000
Message-ID: <b8fa0992331f215fe8df08660dcca525cf703612.camel@intel.com>
References: <20230428185636.457407-1-John.C.Harrison@Intel.com>
 <20230428185636.457407-4-John.C.Harrison@Intel.com>
In-Reply-To: <20230428185636.457407-4-John.C.Harrison@Intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|CO1PR11MB4851:EE_
x-ms-office365-filtering-correlation-id: 44c09d49-b1a4-43c8-7ca1-08db4bff6ec6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2gwm3jeuF8pVCrauHVldUpUuMfRTpU0Tv1u51fRKWd3IeygdCGsZKFklA2PQNHVhZcKGxjQ1FpFpSUllxhzT1uWtkvJ+McNBdX8EvC5VZUZGDjhZzzg/9DefAMWq3xTGNUbNf+DWOaGcAl6nYWGrfrQMaekpj0CJ2C/CB2ikWmtkZhGHNbcrD1EyiOIDt7K3F4Z4OhqzjN1rz5DjZ4lKsiFcurJ08ejuexp/bM1ny23kdUSOnHHayIAudYkR4kdaHnCYO19F6pL8QuUV41QN9bOu6U7+GJeK5CMeiMGNPciY8arN8hyNbwYa3mRIcaSspq5YEsrmr1SWnRLq3LKCpI26VgiQyz8lF9YPmua75pWS74z2HLWUZy9KTgX5LrXDCFmj7GLZYytihYhezaU0+o2nT9Hedt4uvu7ucxKGroq2LDv7z2ALWGswoSQC8sjErSQaxE/ykz+Fk7NjWk5TCAAqrZu2uSQrGPzG+E7v0Tyb3ecmSnJXBQB93HlzYN9DliDmM4WYk9X0S7ujfLuQwfSsLviRUPcOmA/YnsvQ+65xJ0nkAQKslNJvkrLkDU7UP8HLM+/YqYcv/Mv4NMMuDi6IFllNjKo5WQ6E6Oltr4zouFHyMdUvD7XTsO2+oRAA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(366004)(376002)(396003)(136003)(451199021)(71200400001)(41300700001)(478600001)(64756008)(316002)(91956017)(450100002)(66556008)(4326008)(66476007)(66446008)(76116006)(66946007)(110136005)(6486002)(8936002)(86362001)(38100700002)(26005)(6512007)(6506007)(5660300002)(4744005)(2906002)(2616005)(8676002)(38070700005)(186003)(82960400001)(122000001)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y3JEa3ExQlRqaHcrVEx2STVZdm9nVkVJU1FxRFVQUTBSKzZEWnRvRHdieldt?=
 =?utf-8?B?c2JsOFlBcXgxQTNGcjNELzZwTkxkdkNvTWxhZGpRNGdYWjNTU0hMa2dTWTVY?=
 =?utf-8?B?elNwbXdMVTZLay91R1ZKM2tsZkE2YU01UlBLd2JUZ3NVQ2hBdER1QzdlWHZ6?=
 =?utf-8?B?bCtuQkJHbjNDUGJkVVNVUCs3d1U4Y0ExelltSGZLY3lEUjhTMWk2L2pJeHR1?=
 =?utf-8?B?d3BRTVBwdTV0Q0w2YXlFY1hnR2Z5RHZHN3FLZkF0eGxxUVFZSDltL1RoeDcz?=
 =?utf-8?B?Z2lSZjcyS3crVG1jeEI2QnZUbkE2N25yY0gwdnFLWmIzTUh0R0FKT3pYRXZI?=
 =?utf-8?B?TkoydTZsYVhxSytHSElNK2VPMGlhajVLZk5hdTIrdzU4VEZJbkQzL0hGSjFq?=
 =?utf-8?B?dmVSQ3pVdStUNjJUNlM5bktMaWRDRDdYdHZHaXVwRkpzbVdBcnhqQllKZjFG?=
 =?utf-8?B?bkJEUi9uUjBkM3lSR0txazhKbnVmVFhxMDc4TDFaL1lXVGZ4aDJET0tnOUU5?=
 =?utf-8?B?M1JaMXZPYVRiYUV2bUVPeDIwREhURGRzVXAyTUVTQmUreEYzd2J3bTU5czR6?=
 =?utf-8?B?eW5NMFhxUUE2SkIwNCszQ2dyUFFsY2lvZGgxc0pZL3RmRDRLU2lqQ0IwLzZt?=
 =?utf-8?B?ZzFWR3NVaHd5MjBDaGQ0Szc2ck4zazR3YjladnpMUUZGZFJtQ0x1enVEUG5P?=
 =?utf-8?B?MkJxeGhKZUlTc3dnbzdQU0lPNjBFT1kzNS8wRlY1UmM1QjFTVmJKcTJPZk03?=
 =?utf-8?B?WndMazJKb09mdTRzYThBT0daV0lkemhzbkN3N0VYNStMTVdtRS9uMkViN3ZS?=
 =?utf-8?B?bG96M25ybnJkV0k5ZVZkNEVYRHNEcStST0ZTRkFPSUxMOVN5ZDIySDJKaVhF?=
 =?utf-8?B?bGJjK2pRQTZLYzdLcTI1T0llVHY0aktvbnNqR2kxdnRyTVRmZFFwQ2c1MGtU?=
 =?utf-8?B?ejlicS80MWJFU0diTFdsNHFIZ3ZTUy9HdXhxbFM1QUZ2M2lNWS9LYzFoSXhV?=
 =?utf-8?B?Q0tOZ1ozZW5BTC9RcDl1YVZqeWl6ZkZ2Ym12eTVnSkVMcEFVMytxT0sxdmxv?=
 =?utf-8?B?dHNJUCtoZzhia1AyQXZldTk3dDdoWEl2b0xHOWppVEwwVHJEUVpoWHVvbUJK?=
 =?utf-8?B?ZG9RdmFXL1AwSVRMc1pYc0FrM3BIS21RekRxdTlTenNBS2YwaDl6ZHhnRVlq?=
 =?utf-8?B?Vi9pVUxaWVl5QWxZbm1uSmhyRUgvZk9ZZ2R3WmxmR2dyTVFpSStwVHZrTEZT?=
 =?utf-8?B?N3pwUnhDQi9KN0h1OGswOUhIUytGTTJiOW50Wlp4WjJ5cXQzYitSOGd2LzB4?=
 =?utf-8?B?MnRxQUUwbnI0MW5WekdhYld0UVVnQWNOemVwY0hseHJ2ejVGSGJFVUVueTYx?=
 =?utf-8?B?bkZVcHVHMXJQR0FrbnFHTWNYVDVmVTc3N0MwaUZIaUliTURVNDluQjZMMzFl?=
 =?utf-8?B?aU13eUhxR3hwOFpzSnFYbFYvRnlmU1JQWmlSOS9nSnFDWlJoS3JjQnhCSm56?=
 =?utf-8?B?QkRRaHhhNFF1MlY0SkRPZ085Qk1UQ2VXcHFJanBnR3IzaGtTVVFoY2FIdnBK?=
 =?utf-8?B?TkQ2TUpodWtveUpWUUNhcXVLUno1VHQ2cDBjTUdXZzBOVWg5N2YyN0lqY3Fw?=
 =?utf-8?B?dzdaTnR6SDJTUE1yRXlLa3RxK3A4bklOVS9pTG5pZTBINVhGbjhVckQzemx4?=
 =?utf-8?B?c1BZd0NmeDNBN3BCdlhRN05seHlIVTRpL0VkWUF5UGM4alRPNU9Ya2hyZlUz?=
 =?utf-8?B?VlorVnJpYzFMZjhrbGVObjR1NTNqaWJGRWcyQ1RLQW9weXFTYURNUWM2NmhW?=
 =?utf-8?B?VmNBemxWVXdFaENvaFhTTnZ5UWlPK2hrYTlwYVo2aUdxd2JWR3kwQVpxa1BT?=
 =?utf-8?B?bDNYNS81anR5eUdjdjFhMVdFRUJXeC8zVGFDTFVsT2dUSENtem9CWTNYdWx2?=
 =?utf-8?B?N0FlZGFCdXJpOUYvTjI4TU9veURKL2VOdjlpWkZCMGRnUjJ0aHBOakxNY3A1?=
 =?utf-8?B?aXJYN3QrSERXWm91Ukd4ZlZCREIyTFVHYnl4bzJRUGxIUXd2WXg3eTR1SUdR?=
 =?utf-8?B?K09KMG5Dd1B3VGtuRTVYRnBrWXlGbkRWQVhZVC9UdzBpRUFqRnhySUNlQmVZ?=
 =?utf-8?B?ZHNNM1RtV0xDSFBKcS83K29tMTh3aWh6UnY3VXpUaDNPVUQxS0JhYmRaNm4y?=
 =?utf-8?Q?PWsvT1aqMVowa1KC0RR21YA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BF546C1A073B344EBCEE863336A785BC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44c09d49-b1a4-43c8-7ca1-08db4bff6ec6
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2023 17:54:25.0238 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fjN1Cq8bXra10vMRtOWNCyX0F+f4Ir59gNCWWWOq0Drs7AssY31B7ocdsa3bW8E9K+T08LNeBkDlj7x7LsLV1OrDAutnNVKHDUQubSqMxyg+bZn9WUXRYX5jcUdptuXs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4851
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
Cc: "DRI-Devel@Lists.FreeDesktop.Org" <DRI-Devel@Lists.FreeDesktop.Org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TEdUTToNClJldmlld2VkLWJ5OiBBbGFuIFByZXZpbiA8YWxhbi5wcmV2aW4udGVyZXMuYWxleGlz
QGludGVsLmNvbT4NCg0KT24gRnJpLCAyMDIzLTA0LTI4IGF0IDExOjU2IC0wNzAwLCBKb2huLkMu
SGFycmlzb25ASW50ZWwuY29tIHdyb3RlOg0KPiBGcm9tOiBKb2huIEhhcnJpc29uIDxKb2huLkMu
SGFycmlzb25ASW50ZWwuY29tPg0KPiANCj4gRG9uJ3QgdXNlICd4ZV9scConIHByZWZpeGVzIGZv
ciByZWdpc3RlciBsaXN0cyB0aGF0IGFyZSBjb21tb24gd2l0aA0KPiBHZW44Lg0KPiANCj4gRG9u
J3QgYWRkIFhlIG9ubHkgR1NDIHJlZ2lzdGVycyB0byBwcmUtWGUgZGV2aWNlcyB0aGF0IGRvbid0
DQo+IGV2ZW4gaGF2ZSBhIEdTQyBlbmdpbmUuDQo+IA0KPiBGaXggWGVfTFAgbmFtZS4NCj4gDQo+
IERvbid0IHVzZSBHRU45IGFzIGEgcHJlZml4IGZvciByZWdpc3RlciBsaXN0cyB0aGF0IGNvbnRh
aW4gYWxsIEdFTjgNCj4gcmVnaXN0ZXJzLg0KPiANCj4gUmVuYW1lIHRoZSAnZGVmYXVsdF8nIHJl
Z2lzdGVyIGxpc3QgcHJlZml4IHRvICdnZW44XycgYXMgdGhhdCBpcyB0aGUNCj4gbW9yZSBhY2N1
cmF0ZSBuYW1lLg0KYWxhbjpzbmlwDQo=
