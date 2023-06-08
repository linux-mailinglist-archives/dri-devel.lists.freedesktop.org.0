Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39529728A6A
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 23:51:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C65F010E623;
	Thu,  8 Jun 2023 21:51:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C551410E623;
 Thu,  8 Jun 2023 21:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686261104; x=1717797104;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=5UbsWfGhsWp/l3i5+lwTGIycTZWbk/rVfsmpoCIahpI=;
 b=dr+gkFafxaMHvOAGfVFwtacQAF1lWCztvfnCdlTAaxRZVmw+wDPYneNk
 8xlaVaIAu1Wd8Vm4I2LMZMDLou3O9vGryTclkWGubOlU0I9TVYeMlnGWl
 i6v7NvnrhZ1Hu9Q1xUdykqpKrv1XHe4RiJHIERbn4TUbODm8DGzPmgWys
 CVUlztglR70LHpNt0L1sX0sLbuk/IJ4fREOG6525wKggoJIPFA7YbUaf5
 AxG3EWr1liN+jSk0P2WQ7UAk2m908wiROJRu9H03Cy8PsUNuoKaEzXP0S
 OsTbaWd9wWrBBZF3W/gvbdQehFev/2YZIK62kJrbqjkRy6AlZ1O54uQT7 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="421029943"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; d="scan'208";a="421029943"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 14:51:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="775255049"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; d="scan'208";a="775255049"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga008.fm.intel.com with ESMTP; 08 Jun 2023 14:51:42 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 8 Jun 2023 14:51:41 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 8 Jun 2023 14:51:40 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 8 Jun 2023 14:51:40 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 8 Jun 2023 14:51:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ypo0Fuh39FUqAd62gS1potw5yg3p2k8OuforDLWfDaAk/a3llT8HuSs02TSJnkD79UNsma/JhtiS9XgtRiWVNPP0sDtiX+QQ7dN7vnUSV0DGP9NVr3O1crRR8+7tdjv8YRT8jvmZw8ZQ3IKkEBHzS6FZ+8dwP4Ntm4p/01QIsQSYusIW+3hsD3Ln07RmlK8+Y2GoKtu014ZpWx3me/hnEbcpAfmyUSK+y8guKaZLz9pZMVqbS9kVxPn57W+Ot4JBxTPosMIScyOjCtPgFqr1SX7TVJYzx3ATSEoO8ZEtotMCK2TZl1ecpEMqrLtSGASO1DnoGH2brNEOMblT0YBC7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5UbsWfGhsWp/l3i5+lwTGIycTZWbk/rVfsmpoCIahpI=;
 b=awJTQ2QLivbl0NCIsK7oHC8iAiCAoMCmRWBWNpx/7cKAbGWUbYg9uv9ZiNJWG5jTEZ6RmbPW1Fa0XKbd5O3gyi8IbnlbhTWmTLfn/YNcC52loT8HJxUAcpActmUwozGY6oSSv9sKVDN0nIup6Nr15Thbrxt/C8Ng6RUz7kwQ0k2Uc6+064GwzVoYTAoYIzweGpX+405lMXBxgnk9/pBpf0PT5zPG+6+M+6ATqOUKgXiZGm9Os928yRib4TH1mN5M9TbxBY8kBnDNNMXhlNUIQJtu+n80IA2KUR7n3ITqhtyQdmac+qWnqRxJjGd2sgi2QYUMbSY2HQW7U59NK5fG6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 BN0PR11MB5711.namprd11.prod.outlook.com (2603:10b6:408:167::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Thu, 8 Jun
 2023 21:51:40 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::749a:b0c8:4930:5a2]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::749a:b0c8:4930:5a2%6]) with mapi id 15.20.6477.016; Thu, 8 Jun 2023
 21:51:39 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/5] drm/i915/mtl/gsc: extract release and security
 versions from the gsc binary
Thread-Topic: [PATCH v2 2/5] drm/i915/mtl/gsc: extract release and security
 versions from the gsc binary
Thread-Index: AQHZmB4Cqy1YsYjM4kiZhQmyHsvCn6+Bdo4A
Date: Thu, 8 Jun 2023 21:51:39 +0000
Message-ID: <f003c4360ec8383388d25175e022e8d1d8e7eb26.camel@intel.com>
References: <20230606022402.2048235-1-daniele.ceraolospurio@intel.com>
 <20230606022402.2048235-3-daniele.ceraolospurio@intel.com>
In-Reply-To: <20230606022402.2048235-3-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|BN0PR11MB5711:EE_
x-ms-office365-filtering-correlation-id: cb2b15af-56e5-4a66-4f35-08db686a8a41
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WnV7OEAzEW56Q2uW87ehUQFVAJFe/5SlPmoDZ/dQLHc2x0Lh+wNE58gNkjbjO7dm9eR8jwucBtt2BxUap1ZTp6o2PRygwc5A6Gy2w3ZJMHzxdsTpAkXEokUiRNrDPBnHH2XRkljmpboJAPFJdks479h7LqKK9ObwB8cALJmbRRM+oBuNm0D48zpyT2MmdgSZUEbSUtnYWYbgVBebo/dUpG4x2CcH0GtRO2dv19+7Fr+inV7Ck/Uxq+ZohW5QR0HMa8Vn/vsTljJbMwnARpMsMwf9XJA3hHh4L/SyE+DbdushXzIwAffmzB75vpyOBAUMrhTLD8MJEjpzYjM95tJ8Be5RkL+ZLXj4X5+Uquiv2sRlNsP4kksAYDj/gQMlKTPM7Z9KrgwHAOnzOgq/UfG5w93zDE8e0IJY9rAke3fdL968/g4dsBk368447ILDhoiNiEE7+GIu3RfGoEzea2+Mtc5JP4EsByd1Fb9EHIs2pbzgi2acAI20dIoSdc4SaTwhKF31KgN7oohz9MSl6irU7uSmyyt4O2+mYVxn4i0WeJX/I3nE6z2upds5TyGgKEHri8RCakoN8RNQwYnBNNzA+BSZ8i0Yl/ON8GJZUOD7+0vk8LuedWbqG7lS08EONWLWvhIu/vtIvsAiQ/Br1EVexGVZfLH850T8P0wDqAAOM/I=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(366004)(346002)(396003)(39860400002)(136003)(451199021)(82960400001)(41300700001)(478600001)(316002)(110136005)(122000001)(5660300002)(66556008)(66946007)(64756008)(450100002)(76116006)(4326008)(91956017)(8936002)(66476007)(66446008)(15650500001)(8676002)(71200400001)(6486002)(38070700005)(2906002)(86362001)(2616005)(38100700002)(36756003)(186003)(26005)(6506007)(6512007)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RG5zaTMwSzYzcVk2SU1vVWdDbDdZNm5tSGVXV3dVaVJHOHY2Y2IrdmU0RFhH?=
 =?utf-8?B?Y1dVVkJDekE3UGxsREVVR3ZLTWhLYmJTd1pMeTE3RldGM3NNaytsMGVuL3BR?=
 =?utf-8?B?eHJST1pHalpYNkhmdGFrcVVmR0hkcDNhWm1nOVBabUVHV3E0QTdGa29Xc3Rq?=
 =?utf-8?B?UDFqMmxqUjd4b3JrTEM2TjUydmxLS1pRNVgzS3RWSmtWaW5VSHR0K0gvQkV5?=
 =?utf-8?B?R3lFbytZcDNLTnhMNkxnZW9OZkNWSkRTYzBSUTBDa0VBMnpiZVM5US9nRVVP?=
 =?utf-8?B?d1Y2SUd1UWZMVVQyd1JTM2tYKzNvVW9KV2xWVkE3R1E3NFJaT2RKcHNOMUNE?=
 =?utf-8?B?bUZ1T01EN2pURkRUSzNVWW9QNVczUnZHQ0V4RW5MQ1o4M2gxRnNBZVRPVkRY?=
 =?utf-8?B?Q1Uyc01rUkZSZ1cvSXcvREVqUElnaDYzNE5DM2ZSWXI3dkZxQjBxL2g5UzVQ?=
 =?utf-8?B?MHZ4T0QzTGsyRURLSVhzUDQ1OENKTmJuand1ZWthcFJ4NHNJMHI0Vmd6TDVB?=
 =?utf-8?B?dERzb0o5bTc4R29tbTZMajhWblVYMzZ2cXoybU05Ky95ZWRBYkg5ai9WQ3Yv?=
 =?utf-8?B?bEtockgyRk5KR0lxc1FqWFBValpBWUV0VVV5NG1WcFRIbENjWjkwVmlQNWdL?=
 =?utf-8?B?VTFpc2kyZmdDbDcyd2tGeUsxYWZXUkdwa1Y4N0c3VlUySFNCUTVaWlFWU0Rz?=
 =?utf-8?B?MjQvYXNvN2MwWVJqcG81TTFQYjhvQ1ZXdVRtZExOLzhVRXU0YTh6NksvTTIw?=
 =?utf-8?B?RFdlbDFBeW1zVDhZL2JkRTY0dWVEYTViM3F2L2liN1BudktSdWxPbzh1b2xJ?=
 =?utf-8?B?WHc2bUpmVm1QSEtacm9lV1MvOG02d0FCYm1ENU9OT0haMlRXTlhkRHVhbGJC?=
 =?utf-8?B?SVRNMGVxSGo3Rk42by9UNGJiL25hdHY1ajBFWlpzNE9WMFJRWDZVNUpPMFNw?=
 =?utf-8?B?akxvMVJGSzJXRklDcURNQ3RENnJ6R2hUa1Q5ZGF6ODNKaFhxUHNmZC9BSjFs?=
 =?utf-8?B?UGthYmJlTkFPMkZVcXV5OTJUWTBaNU5Vci9UYVdGSEU1OHB3bmcyUHVGbWM1?=
 =?utf-8?B?UFl4Nld4S0xQQnB1VUhXc2hwWENTbzhBTC9BcUdhT01RNEhLUmZmUlhQOURs?=
 =?utf-8?B?WUUxUTRCL0tEdy9XeHNkVGNNWEpCbFh6SC8xbmZoS2FyakNIYS9TZkRLQVZD?=
 =?utf-8?B?ZnR5c0NTdWRySXZZbkZvSGtKZTVjNjZtSFpJWThFRm44Ky9ObXJhZW9JYXo3?=
 =?utf-8?B?QWVsNUxVWnFycllPL0JnU3JSYmw5TjR3Rk1RMCtSMCtNeTU4Uzh4MUkveFV6?=
 =?utf-8?B?NzJCcDlMMUQwTG5aaWp6cEROU2hLTHpMdStyTkZRYWE3bllGa2U3ZisxS2RD?=
 =?utf-8?B?bk9lUHN5L204QjVrR05DRTRwNDkyMUxDRlR5Q09mZk9ub2lMaEJGK0krcEY5?=
 =?utf-8?B?RUNjeTBVYWJYeXNGQXZlSUVXQllsQ0lZODRtZWlzd3JlNlNURmJIOFRXNzNI?=
 =?utf-8?B?RXBLOFZDcWZoZ1c4M1Y3WTFlRHRaTjczRFQ3aVB6RnU5ai93S2taYUVYemcy?=
 =?utf-8?B?Z0VYdTk2T3htTzBweCtMT0pXQ0hvOGxleHhoczNqNzFjYm4yTTFUOUdqeldH?=
 =?utf-8?B?cHpmMWFLQm1pV0FHckVSZllPeGxyMWMzLytwcldPWGRWaTZ0dnN1Yzkwbjlk?=
 =?utf-8?B?L2MvaEd0aVViTU5IdkZPVllrdTIxMklDZkVyT2JHY21zV0toR2JybzdmaHEw?=
 =?utf-8?B?VG54ZktGb09pUWVYQzIwcW9nbjNhZXU5aENlZXJGMmlMTitOUG5Ldlc3emwr?=
 =?utf-8?B?UUdKUE9tbjJpMWtKWnBhdk5FUytJdXJaYVU0UUtSMVhpSVdadlg5OHZ2SEo4?=
 =?utf-8?B?MXZPRWdVV2lzUHVsV240SXM2VUR6RS9YazUzYzlFR05HeTlTaUJ4TWRnb0VL?=
 =?utf-8?B?aDRSRG4xbWFncS80STJvM0hnam9zdFVMNFRBcDBzUjZYMll2OEkyWTJFcWJQ?=
 =?utf-8?B?cWJrU1lQaCtZU2xrRzR0YlJ6bWNnb2htbGlnOUc5ZXVtN3J5YUdxL1NBVGNW?=
 =?utf-8?B?aEVLRjcxTmFLK3d2VnQ1QURsclNiZlE5QWRGNHRwd3piaFhWYlgvOHpLRmdl?=
 =?utf-8?B?bWpHaDBqVDdhUnZRZHZiRHdld2NKWjYxdVU1VXFFbDU4RXdPYWxUSUR6eHVW?=
 =?utf-8?Q?TuBn18wMzCJiPTFoGIn7byM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D8F7E4567164D34C919EDC2087EBC27E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb2b15af-56e5-4a66-4f35-08db686a8a41
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2023 21:51:39.7949 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h3g61cfiZwQKMMFvo13LjVLviuYbQ524F5j3CyTvCdvI8DU5o3snRPsVT8nbAoGG1STBZJTfn8g+g6F4WU6wxnMiWW+wNTZIsApzOBZsM4UmlyO7bltj8mUwhijGxwzX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR11MB5711
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RXZlcnl0aGluZyBsb29rcyBnb29kIHRvIG1lLCBzbw0KUmV2aWV3ZWQtYnk6IEFsYW4gUHJldmlu
IDxhbGFuLnByZXZpbi50ZXJlcy5hbGV4aXNAaW50ZWwuY29tPg0KDQpPbiBNb24sIDIwMjMtMDYt
MDUgYXQgMTk6MjMgLTA3MDAsIENlcmFvbG8gU3B1cmlvLCBEYW5pZWxlIHdyb3RlOg0KPiBUaGUg
cmVsZWFzZSBhbmQgc2VjdXJpdHkgdmVyc2lvbnMgb2YgdGhlIEdTQyBiaW5hcnkgYXJlIG5vdCB1
c2VkIGF0DQo+IHJ1bnRpbWUgdG8gZGVjaWRlIGludGVyZmFjZSBjb21wYXRpYmlsaXR5ICh0aGVy
ZSBpcyBhIHNlcGFyYXRlIHZlcnNpb24NCj4gZm9yIHRoYXQpLCBidXQgdGhleSdyZSBzdGlsbCB1
c2VmdWwgZm9yIGRlYnVnLCBzbyBpdCBpcyBzdGlsbCB3b3J0aA0KPiBleHRyYWN0aW5nIHRoZW0g
YW5kIHByaW50aW5nIHRoZW0gb3V0IGluIGRtZXNnLg0KYWxhbjpzbmlwDQoNCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2dzY19iaW5hcnlfaGVhZGVycy5o
IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxfZ3NjX2JpbmFyeV9oZWFkZXJzLmgN
Cj4gaW5kZXggNzE0ZjBjMjU2MTE4Li5hZDgwYWZjYWZkMjMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2dzY19iaW5hcnlfaGVhZGVycy5oDQo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2dzY19iaW5hcnlfaGVhZGVycy5oDQph
bGFuOnNuaXANCg0KDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9p
bnRlbF9nc2NfZncuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2dzY19mdy5j
DQphbGFuOnNuaXANCg0KDQo+IEBAIC00Miw2ICs0MywxNTcgQEAgYm9vbCBpbnRlbF9nc2NfdWNf
ZndfaW5pdF9kb25lKHN0cnVjdCBpbnRlbF9nc2NfdWMgKmdzYykNCmFsYW46c25pcA0KDQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9nc2NfZncuaCBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2dzY19mdy5oDQphbGFuOnNuaXANCg0KDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9nc2NfdWMuaCBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2dzY191Yy5oDQphbGFuOnNuaXANCg0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxfaHVjX2Z3LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9odWNfZncuYw0KYWxhbjpzbmlwDQoN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX3VjX2Z3LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF91Y19mdy5jDQphbGFuOnNuaXANCg0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxfdWNfZncuaCBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX3VjX2Z3LmgNCmFsYW46c25pcA0KDQoN
Cg0KPiAgLyoNCj4gQEAgLTI4OSw2ICsyOTAsOCBAQCBzdGF0aWMgaW5saW5lIHUzMiBpbnRlbF91
Y19md19nZXRfdXBsb2FkX3NpemUoc3RydWN0IGludGVsX3VjX2Z3ICp1Y19mdykNCmFsYW46c25p
cA0K
