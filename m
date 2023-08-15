Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7BE77D554
	for <lists+dri-devel@lfdr.de>; Tue, 15 Aug 2023 23:42:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C923110E29F;
	Tue, 15 Aug 2023 21:42:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 673F210E29F;
 Tue, 15 Aug 2023 21:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692135766; x=1723671766;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=2URuTD8iuky/hF1QFqykUdoD5N1skZdx32ILyHOlTUo=;
 b=CuTc3n4l3zdQBelM7cWGSBfo8mhZZn/Yhaz84R2G41C7YYuD/LqujVmC
 tEx+2GCwbDQuRsqq10c2i3KTAjS80QyoFozNRx/9Hi1PI7gL0XAJLZhw5
 jKo0XLPD2j1l7U876aTmsAMBAVF7d0m5Zom/KT1Uogey5msQ/miJndLod
 KME6XfDietoDhhgiR/JRAgoIaPD5qk1/KNlY9S15LJi9NnZHpJPqQTrc1
 +/byvwhkS/wCJstw/jZtdKjwhkAva/v+xobowvyT2Pl5HpD0E0c++n8z4
 QtH4297mYTOg/U3a3j9yKeyAgZ26OSlB2+m6C91qglRRHqwbP78Le5xXF g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="436282568"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; d="scan'208";a="436282568"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2023 14:42:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="1064594253"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; d="scan'208";a="1064594253"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga005.fm.intel.com with ESMTP; 15 Aug 2023 14:42:45 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 15 Aug 2023 14:42:45 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 15 Aug 2023 14:42:44 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 15 Aug 2023 14:42:44 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 15 Aug 2023 14:42:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gDxxnHuTxv7vqChELjeC+qKtV1IkYVcl/3JE26UjE0gyAMaKLhrej2E0aSe/+h7h9srd/lFGmPPqbDo6pIyCn6s8OHzRQYkAMNqkv1xT18Xx8FRy4wvdYiaQVMp1xQjogM6OXygvExkGHBb66mu7OGaLDTMMB8ILVddaRizy+do1MryFxkxAUSSstw+eU6Qo2OtUlD6Q13Z5nCOLMpbMeUWHcz5FyGdFAe1csPWpHvOWEL+3wulEub1LY4Byz0pdaM0zF1NHYsmsAZ+m045jkpdhrz9VECaTOWPDztpgnDdBM2GjzRudjcSfUZX77pN5cZ31RJTWT1G5oxccSCiLyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2URuTD8iuky/hF1QFqykUdoD5N1skZdx32ILyHOlTUo=;
 b=SUqAKOwrTpBVbJchpDkTewO8osdiUfUlKZyPiUr8MhjWVdjmpCQGMgbWvPZrnwud55yhUC25irPtSz6xLwoG3oZ0QyVPQKqhN/e4BmTXm7jlBH4kB7ayrz+2ih3HsC3kWNianJUqJnieFw3IxNxkkjbbFCgTMsJoPnOcN4ESRGXdAah6KSA64wf18tx1luP555BEsGyxIKF22fXQpmnqBOiHbbTtJW4Kl61viwU5GWcQlQZ+dIqOUL53OqWAFTYBBA8+uO/UtCX/TjqwFRGaxX7T6+Iz7Z5Z8djLfhG+97MpvCo/3dmvQg11qF+J7pwBbTXcyMJP5FSJNFg5f1VmHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 IA1PR11MB7245.namprd11.prod.outlook.com (2603:10b6:208:42f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Tue, 15 Aug
 2023 21:42:42 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531%3]) with mapi id 15.20.6678.025; Tue, 15 Aug 2023
 21:42:42 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v3 1/3] drm/i915/pxp/mtl: Update pxp-firmware response
 timeout
Thread-Topic: [PATCH v3 1/3] drm/i915/pxp/mtl: Update pxp-firmware response
 timeout
Thread-Index: AQHZz7cwHW6p5n+S0E+LTZV7RlCqC6/r42UA
Date: Tue, 15 Aug 2023 21:42:42 +0000
Message-ID: <e325f8d32f72e1b5a877347d564a54d7c7e70d7e.camel@intel.com>
References: <20230815202916.1211768-1-alan.previn.teres.alexis@intel.com>
 <20230815202916.1211768-2-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20230815202916.1211768-2-alan.previn.teres.alexis@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|IA1PR11MB7245:EE_
x-ms-office365-filtering-correlation-id: ef94a181-2ce1-416c-e54a-08db9dd88de6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JE7uLZXDUJwoG+etA/Il8sPT25Y2B7zY7IFi9DtNQe2xEimeQpUaj5KKTxdP3UJWHbHG5UxOmCC7J9jZJX5zbScVuhFyS17qo80/z7mOeDxtom40ErrV9dgBg0UShg7uspLIVum1+N6ZS29U3ZeDpq02Qg+/3AEsEcSP4RlOMWpQHpSRS6s9zAShN2E/6BuC+/FLK18//7i/QX9LXEM7bNytnzFbyzTYaOTkBLipajMPs4H1mT0Yna8LNGiWoBJBuZT0E4eTulG2a/W0anDB71VMuHehrFTjYxEdPE6YxzQHwc8+xzoV28QTiY9DKVrKAq3rL9W5JH3IGEHqkTLaPegO248laFnhgn1neMmxwa2fAQ9LS/8gBkgC0ltgW0eXCxJqI/HUlntBIKRl+7XsTHdAVKzd1BTrTE17bon6+J6q7n0a/iLCDg1YsSgoioXNu502jsVNPWUft/pMIkZNhtdRNUZwkLyptURwSXglmQOqpBzcC1DFELX8rxU5I52FgrO0Ubxb+YgDJqUBZQ0EyZkt1rvB4OUbf+rzpy7cFfktwKQ83ZgjRER7NgpDFpFOViqvMlPPAuuNyoFqDx5hkVx3hxNnkz0iftvkTj+xNS0T7R5KxCXRuNgwYE4tQW0Q
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(136003)(376002)(366004)(346002)(1800799009)(186009)(451199024)(82960400001)(122000001)(83380400001)(2906002)(107886003)(450100002)(2616005)(6486002)(86362001)(71200400001)(6512007)(36756003)(38070700005)(38100700002)(6506007)(478600001)(6916009)(316002)(41300700001)(26005)(66946007)(76116006)(54906003)(66556008)(8936002)(8676002)(66476007)(64756008)(5660300002)(15650500001)(4326008)(91956017)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UHYwSGx3UWkwL1lKVURtc1E1YzQxSDZGRldkaUl5MnBCeUpTSCtRcURZbzRM?=
 =?utf-8?B?WkxyQXV0eW9CWXFLQjhPL1gwNlNZaEhaR29XUHZFckVTbjdKWnpYc0xSczNm?=
 =?utf-8?B?SDdTeGxUenBNTHo3WGRwMDhxSGZYZWhHeXdWS0xPZHFIZktML0E4K1JkVW9n?=
 =?utf-8?B?cTRMV2ZTU0NNbW56WFUwWXZBSk1qUHhtbTJkZUd3NTNQVzJ1bzhvQWtVTVhL?=
 =?utf-8?B?bVJ3aGNnN0Uza1ZMV0pmU05IdlNEMUVFaVBPRVFTZFVyeVpWblhNeWpUVC9D?=
 =?utf-8?B?MzlVV1ZsVE1aRHN5WG5uN0I2U0Z2Y1pjend0RkxSdWhEMmFSUGNUOHZXa0E4?=
 =?utf-8?B?Sm9xb2ZxQXlVT1JtNVl6ZnphZVR0YjBrQVUxdlN0T1Y5ZzZnYmo0N1VMT2R5?=
 =?utf-8?B?bk13M0Vwb2dmcEpnQ3ZQbWNRVEdXd2pqbHVFTTJiaU5vY1BMeWVCK2F2cjln?=
 =?utf-8?B?MTk1NkIwcGFSMkVvZ2pYNGtkWERPOG9TOWVTOGRTZ0NLN0tKQ2lobWRXOWJW?=
 =?utf-8?B?UGFUenRIbldyQURwN0Y0UFhUbUNYaXZtNUJBdFJUZDFTajVva2VMSTdJZzlG?=
 =?utf-8?B?dWxvRjQ2Z1RqRGp6amZuNXVqU0ltV2FxeE05aEx5ZktlV2c1TmZuY0dLSWtW?=
 =?utf-8?B?QnhKZjBoTFJ3eFZEbk9HY0x1SmNGTGlTemo2bXNXdVh6U085MDJLWW9Felp3?=
 =?utf-8?B?U05JNWgvQVdKM004akVtQjJablNRVDV4QVRIWDRmZmtHR3V4cmdBWEZTMFY5?=
 =?utf-8?B?VGVnZkI2M1Fsc3o0L2pZTUQwNnFYUzNWYVpqNWMwMWZkc2FBMHRBUUdrVVVL?=
 =?utf-8?B?WmVwWXFvTGRNTSt6d1p2dTBXYmtiZU0vTTFYWExxNit6QytLRTd6N2tQUVpp?=
 =?utf-8?B?RGk2NUtxL0lZMG81Mm1WT0U3ZzFYUzJlTzkyTkl4OSt0Yy9yWnoyU3VJMW90?=
 =?utf-8?B?M1N0WlZPSThQYVlhVUFobndkQWJDMVlpN0swQ2V1aFBWWlE1RXQ5eGV6bXRH?=
 =?utf-8?B?Q0xlRFdyRXdXWGxxaE5jNjVrUmhSSXlwaWc4RUZaUzdGRytVVG8yQnpERGtJ?=
 =?utf-8?B?bURkZnp1U284eVFaM1RPczYwYlVsK2oxVUtkbWZleXErSkZhaGVYS2svUjU2?=
 =?utf-8?B?WlpJMmRWWUMwcEJ1VDF2eDJvSStPalhINVc0TlFkcWxsNTRkRzhrRXJ4WFU2?=
 =?utf-8?B?SFRpQW9kZkQ1ZnVNWkhYb0RXdkR2c3BqZWtKcmZhSUtNQTBMWG9JR3JNbEFp?=
 =?utf-8?B?UFZBNVBCLzhOT1F0OU5obzc1NzJVaENpS0VjeGU5QUZtNUJPNXBYNGxRTmZQ?=
 =?utf-8?B?SkJrWENlUHBFdWcvOE5McURkTjJVYmZKQ3kwME95ai8zeUMxSzZobWRPQmRM?=
 =?utf-8?B?TWUwOU5iWVhTc2RNN2VESThDZ2lNWHIrVUJxdG96Y2xTTlFBWjVSSFoxT0tP?=
 =?utf-8?B?cTV2M0kwQ2oyd2JKUUcybStDcHl6NFUvd1dicjdLU0lEU2czaGhXUmcvNWk3?=
 =?utf-8?B?UE9aZHNnTEtQb0orOVp1QlpQbUt6bkl2L2ZDWG8ra1R4cVR1ZlJnbkZITEJx?=
 =?utf-8?B?U0J0dzYyeENMS2FWTERoamNRL1VNMTByWXdYMU9mbFFwNkRUMTBob2ZGODV4?=
 =?utf-8?B?T05TYU5zaU9UemJRZGhvYk1yYTY1T1NVN0lFYWQ0S0tDWlZJTTFBRTNQdzBN?=
 =?utf-8?B?d1hJSjluS2ZkdlZ5bStXb1IzUXpVTng4S0lERGhqZlcyWEVYKzV6S0FSNXYy?=
 =?utf-8?B?bUhKenRIRWtCVUl6dTRQK0ZibzlZR0tLVmFZbzVlc3BBVHFNNzM4S0d6cGRi?=
 =?utf-8?B?cUh0UXRGbW5Bb2NZc0tuSDhFM0Y3K1lxZmhxM3pVcFY1aE0vbi9oMXFPWWNW?=
 =?utf-8?B?SlM3SStsSXA5MjI5RXd2UWhhbzg5cGdwNjNVMGVZQ21rMzh4T2ZsbTFuN01H?=
 =?utf-8?B?U21mZHVnTXdHNDhUcjJnNW9vYSsrWC9GWUR6OGYwOWNSeWUyMjlxdzFwejdU?=
 =?utf-8?B?eVVraWZSR2h0TkYvWW5tbEZob0JlY2FzcGt0NTVIeDduc0FLbE1HRktESEVG?=
 =?utf-8?B?dzd3TE03WGJiN1EwdHNnME13TGQwMkRIczFCNDZVNkk4bElUYWY1MUZJcnRl?=
 =?utf-8?B?VC9lcFl0YVRCVVU5Y3Jxc2lFSVRuT0pGWlR4ZDU4eUZJSUVJWnR6djJUVW44?=
 =?utf-8?Q?SnIvpzAaN/kbiV9ycGJ6/SU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D9B933DC860E9D4E99C42EA212A7FA94@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef94a181-2ce1-416c-e54a-08db9dd88de6
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2023 21:42:42.2158 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zow0lkmWUNsWS7QFAx0F8BS0WM/T1lv/lYLl1eZK5w6JJgWnVkl1w1FSKWLrAziIyRB9SuSl8guBBpbTNj1Xc8GnLw/qFtIdfVFJwl3Vdh/LE6b0yWfQpHy+Hl1p/QO4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7245
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
Cc: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTA4LTE1IGF0IDEzOjI5IC0wNzAwLCBUZXJlcyBBbGV4aXMsIEFsYW4gUHJl
dmluIHdyb3RlOg0KPiBVcGRhdGUgdGhlIG1heCBHU0MtZncgcmVzcG9uc2UgdGltZSB0byBtYXRj
aCB1cGRhdGVkIGludGVybmFsDQo+IGZ3IHNwZWNzLiBCZWNhdXNlIHRoaXMgcmVzcG9uc2UgdGlt
ZSBpcyBhbiBTTEEgb24gdGhlIGZpcm13YXJlLA0KPiBub3QgaW5jbHVzaXZlIG9mIGk5MTUtPkd1
Qy0+SFcgaGFuZG9mZiBsYXRlbmN5LCB3aGVuIHN1Ym1pdHRpbmcNCj4gcmVxdWVzdHMgdG8gdGhl
IEdTQyBmdyB2aWEgaW50ZWxfZ3NjX3VjX2hlY2lfY21kX3N1Ym1pdF9ub25wcml2LA0KPiBzdGFy
dCB0aGUgY291bnQgYWZ0ZXIgdGhlIHJlcXVlc3QgaGl0cyB0aGUgR1NDIGNvbW1hbmQgc3RyZWFt
ZXIuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbGFuIFByZXZpbiA8YWxhbi5wcmV2aW4udGVyZXMu
YWxleGlzQGludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9p
bnRlbF9nc2NfdWNfaGVjaV9jbWRfc3VibWl0LmMgfCAzICsrKw0KPiAgZHJpdmVycy9ncHUvZHJt
L2k5MTUvcHhwL2ludGVsX3B4cF9nc2Njcy5oICAgICAgICAgICAgICAgIHwgNiArKystLS0NCj4g
IDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2dzY191Y19oZWNp
X2NtZF9zdWJtaXQuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2dzY191Y19o
ZWNpX2NtZF9zdWJtaXQuYw0KPiBpbmRleCA4OWVkNWVlOWNkZWQuLmFlNDU4NTU1OTRhYyAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxfZ3NjX3VjX2hlY2lf
Y21kX3N1Ym1pdC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2dz
Y191Y19oZWNpX2NtZF9zdWJtaXQuYw0KPiBAQCAtMTg2LDYgKzE4Niw5IEBAIGludGVsX2dzY191
Y19oZWNpX2NtZF9zdWJtaXRfbm9ucHJpdihzdHJ1Y3QgaW50ZWxfZ3NjX3VjICpnc2MsDQo+ICAJ
aTkxNV9yZXF1ZXN0X2FkZChycSk7DQo+ICANCj4gIAlpZiAoIWVycikgew0KPiArCQlpZiAod2Fp
dF9mb3IoaTkxNV9yZXF1ZXN0X3N0YXJ0ZWQocnEpLCAyMDApKQ0KPiArCQkJZHJtX2RiZygmZ3Nj
X3VjX3RvX2d0KGdzYyktPmk5MTUtPmRybSwNCj4gKwkJCQkiRGVsYXkgaW4gZ3NjLWhlY2ktbm9u
LXByaXYgc3VibWlzc2lvbiB0byBnc2Njcy1odyIpOw0KYWxhbjogb2ZmbGluZSBkaXNjdXNzaW9u
IHdpdGggRGFuaWVsZSwgRGFuaWVsZSBwcm92aWRlZCB0aGUgZm9sbG93aW5nIHJldmlldyBjb21t
ZW50czoNCldlIHNob3VsZCBhZGQgdGhpcyB3YWl0LWNoZWNrIGZvciBib3RoIHByaXYgYW5kIG5v
bi1wcml2IGJ1dCB3ZSBzaG91bGQgaW5jcmVhc2UgdGhlDQp0aW1lb3V0IHRvIGJlIG1vcmUgdGhh
biB0aGUgZ3VhcmFudGVlZCBmdyByZXNwb25zZSB0aW1lIG9mIDEgb3RoZXIgbWVzc2FnZSAoc2lu
Y2Ugd2UNCmhhdmUgYSB0b3RhbCBvZiAyIGNvbnRleHRzIHRoYXQgY291bGQgYmUgc2VuZGluZyBt
ZXNzYWdlcyBjb25jdXJyZW50bHkgYXQgYW55IHRpbWUNCmluY2x1ZGluZyB0aGlzIG9uZSkuLi4g
c28gbWF5YmUgdGltZW91dCBvZiB0aGUgbmV3IEdTQ19SRVBMWV9MQVRFTkNZX01TICsgMTUwLg0K
TW9yZSBpbXBvcnRhbnRseSwgaGUgaGlnaGxpZ2h0ZWQgdGhlIGZhY3QgdGhhdCB3ZSBzaG91bGQg
d2FpdCBmb3IgdGhlIHJlcXVlc3Qtc3RhcnRlZA0KQU5EIGVuc3VyZSB0aGVyZSBhcyBubyBlcnJv
ciBpbiByZXF1ZXN0IHN0YXR1cy4NCg0KW3NuaXBdDQo=
