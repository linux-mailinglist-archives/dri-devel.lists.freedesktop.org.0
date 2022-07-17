Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF195777D6
	for <lists+dri-devel@lfdr.de>; Sun, 17 Jul 2022 20:49:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7757F92EB7;
	Sun, 17 Jul 2022 18:49:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 335FF92EA8;
 Sun, 17 Jul 2022 18:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658083757; x=1689619757;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=O+/xRAbRjmuifriF2fyAcTyFk9eZYtPWB+91318fMgA=;
 b=JSm66/aUlaTv1moZLEOPoQzAIo33miWN+0XAFL7qFx3LvQ31XRO0MP38
 aR4BCTPdI3Y35QDTvwNXgvRUTZMVTc0Wv2plSDbOhfwjAsV7AFnN/hk64
 nFX/K44Ez43iaxtOXhcBzbq4vhfOhNauX1OKPhK/Z5Vv9DItS7ULLlUjf
 O2Wajbk0/r9kjfJhPg2ztWnFoD7OGOiAQrxqSpvFE3Qcouy8CO071pkLw
 Q6R3gB9vbPLi6kz20GHS525/PGT3B+I64LzGDQU4eaL6t3rv5C7IOVYcn
 M02+/oBQYaONpS0Rd+X7TAbZddiKe2CLD9OeuB3QUNCvlndZeOE86Z0No w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10411"; a="372392756"
X-IronPort-AV: E=Sophos;i="5.92,279,1650956400"; d="scan'208";a="372392756"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2022 11:49:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,279,1650956400"; d="scan'208";a="597024937"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP; 17 Jul 2022 11:49:16 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sun, 17 Jul 2022 11:49:16 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sun, 17 Jul 2022 11:49:15 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Sun, 17 Jul 2022 11:49:15 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Sun, 17 Jul 2022 11:49:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HlDu2k+aQIv8Ki4m9TrdX4rnKA47fWE56dVGnHSFUD2mIFVSGpwlvUJDv+z8Bv1g0ij35ew6Zvvd9kP85ueNWcKI+5sttkLkqOMX+Ac1nb5TAXIrnbqDMhg83d/SguGuKntnDUyJaGJzVFyyh11nN+2giP+t8l1WDOIeIsPhL1/5/XnZs+vOlLMxIWTLKizvKiVpoi1Kdb5anpCwYz2RBGf6wwsElpoj9hDyzBmepKAU8QwoiK/f7IqXHapxDJr3Q9eWiF/6VlbtlXEnhBZ9UMA9NjoQ4B1dLTdD+6RGiBw7yEpiQyRxDA8JFpEn62CRmOJLF7Df5aWsxWz2/pNw5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O+/xRAbRjmuifriF2fyAcTyFk9eZYtPWB+91318fMgA=;
 b=N+k9OAWBJU/wrXkNg7+fXhaUvAULXI0nb+VE2mraX2m8YaT+GmnQd5cU556FyCYLALclJbKZhA0eauxfUhlpvCPIHCya0aiezSqjxOEREs95x1R4GcDgJS7sWgkFSrhN1J7Nlrr1V+PHECSF24EZm4n1lwmK3WKtwnlO1CTENXYWm/YlpNxts0Uf4MmzfX5b4mu90SgEod6bVXJftNFZbEjOFBjHHmsuY29Au1gZ6En8bfkDg4Kgswxkl6BfeFb0i649H8QaT6Ap8KgIrcY7/AKGqkf3H+rYp3UFvqVgzlyqWF8oBI6HlunFdykQYlY6Hu+R9r9r5h1YvbZWcaPsVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BY5PR11MB4434.namprd11.prod.outlook.com (2603:10b6:a03:1c2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Sun, 17 Jul
 2022 18:49:13 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615%9]) with mapi id 15.20.5438.022; Sun, 17 Jul 2022
 18:49:12 +0000
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "linux@roeck-us.net" <linux@roeck-us.net>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] drm/i915: Fix 32-bit build
Thread-Topic: [PATCH] drm/i915: Fix 32-bit build
Thread-Index: AQHYmfk0OnhDgSZI8kOxxgrtbjY/y62C59uA
Date: Sun, 17 Jul 2022 18:49:12 +0000
Message-ID: <7fdf804a29d05bcfe57200de0f1fe049bdb91016.camel@intel.com>
References: <20220717162046.710290-1-linux@roeck-us.net>
In-Reply-To: <20220717162046.710290-1-linux@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.4 (3.42.4-2.fc35) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 54ba98c0-4be3-4ded-20f5-08da68250a55
x-ms-traffictypediagnostic: BY5PR11MB4434:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7LSgRsaOL4KsEPkxb9Pe3HOxFB6knoulrFp0OUMJeV1eSob32UXahRKk24Uh0t6ArBUDayW0+cwtP8b3R8Wx3h6gbV7FCXT71vevxXUslBJPtF/+aflaWNOYoNm5dSeU5WAnHL3vtOpZM+8EYM4ocDOxEST9JitIF90tDSdR3eUdZKG9GB4qCXDg1hP1DjeNLt4/Bz6uB5InVgGlShtL2qVx6jPRSxrRom9ssfmAkGIjD3/GItmq7eaX+TnBXCoDqwm+HmBWLk23gZob8o2JPyhD9qeTlXDU9moXgfUm502aGJGzDAPzWqAMo3RNVCfP+EwQNPMi+6WLuU04HapeQ9MOzxe0NQeIFxojO5onvSqKoxML7LtEbm5wG5hLyppGDyLwpEgp1WqFNWOO+fXHX6nOX6KuJhohJVpA+p8MJnkZjCDob7U/h6dixWA2NNzv54iEtAMET+V6XRIk9YFJ7exaghyEI9lYzRGYe/M0SZRklv8g8k9f5zHaUbL3uFnFqWMKc1aHThSghHTHsJkJ/XGZNxuJ+0nqBufxD14vYL3bVUPUoqPMfq8WEJ5Xh3mGBc7YWRruYUnChSn9MEcjFx8q76HIqEPc9C2vGnAO93+giTAnnFgvduVPx9z9GZ1c6MYY8uNZpT9LOqseGjAWklPwodJDEcKi1cPJlSkOz2tNe8uo6RjjIOEl0rQ/bdSJH3N7JG8gL+1o7jo6MYSeERX/ERfEgMAYWhUofa2ZihNlVLgKni82ct6pb/C+X9oca3/VjHmVXU7GidnRV3Uvzw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(346002)(39860400002)(136003)(366004)(396003)(38070700005)(82960400001)(38100700002)(478600001)(6512007)(122000001)(2906002)(83380400001)(71200400001)(8676002)(66446008)(91956017)(4326008)(66946007)(64756008)(86362001)(66556008)(66476007)(8936002)(76116006)(966005)(5660300002)(6486002)(110136005)(26005)(316002)(54906003)(6506007)(36756003)(186003)(2616005)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NGwyd1hqWUdyOWRZVkZjaWxady9tMmxnV1VkTGx5Tmxod2tOZEprbVNrOUdY?=
 =?utf-8?B?elZrVUxLQmYyS2FVdno2VTVxRkJCaVhtclZ5WU5CUFVxVHBCcllMbERGVmdR?=
 =?utf-8?B?RnZmS2F0SG9uTUE4c1dHVDFUa2Jtek1SVTNCVmVKSjNad0hFd2t1Ym5jMTdQ?=
 =?utf-8?B?NEV1RXFZbmcxTTVERlI3d3VwVVJkblBIQlhMcW8rTkU2ZWhBRzIzUzlxbGxn?=
 =?utf-8?B?ZWlKU3JvRVJrU0NDOTllYi9GNElHQkRxUDR6M2kyMzJ0a3crVWwrTHdhUGQw?=
 =?utf-8?B?NEpUbVNWU2JlSVo4eDNLcE1HdUlUcDd1YzJRa2V0Z3FRQXBOZ3NpTE9SWmVm?=
 =?utf-8?B?bVB5NGRXZU1FVGV2Rlpyck9ucG5qWDloNThQbmwrMEhIbGdralJDVlJoU0U4?=
 =?utf-8?B?b256aUFGcFhSQ2Z1emJHcVhXdTRwS0pIOTZ2SGJiR09OZCtJTnM4cDFKYWJY?=
 =?utf-8?B?c0xxRTYzaVNJYS8xUzF1VmcwT3habkczOHlKQURzYm9GY0h3OUY3aWE2dGJh?=
 =?utf-8?B?THYvYk50VUVlMjlJQjRqQXJVQWZhZGhneS80ejlLOXpNMzBxNnZyU0N6ZlZM?=
 =?utf-8?B?YktlaXo5WDRBOUtYNWdxc2N0R1lTMXpSdU4zTkNLbHJncFp2LzBsRFIzRE5t?=
 =?utf-8?B?N1N5NVRLdkViOVBrZGdjYWJHTDBHQndNMWppMjJ2Y0w4SDIwbENTQlFpN1Zw?=
 =?utf-8?B?M0RsU24xOHRQZHZtNW5aS2Q4VGZjcmxqTVBmUXNwbUtUSHl3dkxPcmQxYXZl?=
 =?utf-8?B?bnJBbTluNFhEcHBlMGl2WHQwM2d5RkY2R2ZkbGpTUVlNRTd0cGZuUldsU2dp?=
 =?utf-8?B?dGZnazVVU2pRRDRweUE5UGQrckEwL2xOL2dWZ1EyeGhzMU1laEZuQlN0OTFu?=
 =?utf-8?B?dmQxbHZwZzBxUEVmajhUT2MxVzFkd1FFckxLNTUyV2ZGVThNQTRrWHowSkdM?=
 =?utf-8?B?T09zZ3VMTUwyTzdIVHNXSE1WZVFndEJ5a2Q4eUMzb01GNmNuUVJ3UjUzeW91?=
 =?utf-8?B?UUhzSnRMUlIxVG01MEdEQ3RHZ1hYM3IvNkl0WXRHdTMxYWN2TDFLamx1WFl6?=
 =?utf-8?B?SEQwazBINHpxQndLV1FpRzAxQXlLcWZZRmp6MTdsQUpHVlBOa285YlcvZnAz?=
 =?utf-8?B?WWJCTFdhRDRlMG1YNlIzZU1SVFVhY0hwMGk0aXYyN0Qzb3FKK2NGcm1QYnlG?=
 =?utf-8?B?eU9CbUsxemt4d2FPOGJtc1JCMm9HYngvbDlsVUNKYWF5T2xISnA4YnFDdU9S?=
 =?utf-8?B?S0R0dkZtTmQ3Q3l2anE2Y2VGOWFrUWh2K3M5Yi9abG9kVUlGUldUVzJ2M084?=
 =?utf-8?B?MXlBQkFHQXVlcXd5MENwcEhFMUVsTXNLenFDRGx6VkVoaXNUVnJYODlTb05P?=
 =?utf-8?B?UmNEcFRTS2pTRFdLNGt4NHdQY3p1Q3d5dTV4dEx3MUxqbkR1dGpPMTBRelF0?=
 =?utf-8?B?MFArVndpS2pPUUw3WmRuSGMzVUJVQkN6V2lqY252ZWpPd1lzQU1pWUhEdXFB?=
 =?utf-8?B?blFYcUI3eGFoSDcxb1B1ZlpKSHlWYVhTdkVCdTdvaFk1TVZISlF6KzBIdGx2?=
 =?utf-8?B?aml0ODBROUpPT0MrdXN4V2pzdFhqZW5jaWsyTHplc3hpemFMa3ZvSktmdGsw?=
 =?utf-8?B?ck9zRXh4bnF2c2c0aDVsYXRPbHEwUDZlcDBhcUF1c2pibHRReEZTejNjSDZ1?=
 =?utf-8?B?S3pheG9XQ1NlQTlxQ1gzNStiUEVYS1RzeUxPcnVhanVIbW1lUUZON3RuZUhs?=
 =?utf-8?B?NEFUYUYycDQyTkRlQzJ5d253bnM4bEJ3WFVvMEl3QnpsaVdhc29BRm5OTG9s?=
 =?utf-8?B?UUF2cWw0UTJobVpXWm12MjJNUnBTZ1plUUEraDJtTEdUM2twMi9SMVNUSkho?=
 =?utf-8?B?NkpRV3o5d0JiQkIycUVraHVpSlRDZGxEbzNpd1FQMXc4RWpheGl6UVRJeERU?=
 =?utf-8?B?TjArNU1UcUI3dVFlVHltM2ZQS2tZQjhPQVNqQ0x0NW5waUlIaERNSTZrTWxp?=
 =?utf-8?B?ellGSjZGTWdIZjhmQ2tFRWhaMHZkT2RJdHd6cyt3Q1VtTytkTEVZTE83WTNy?=
 =?utf-8?B?UHlHejBtTEtENDVWVTkzNVMzTWppOWE0T0RGQng2R3RzSFFxK1ZtK05LU216?=
 =?utf-8?B?K205d203ZG1RYlh4aHFvYTAvbTdoczdwZHVmcEhZczl1WWhRWDNBY1Noaisv?=
 =?utf-8?B?WlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F153E0F12E404C4BBEA02835F7CF3EC0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54ba98c0-4be3-4ded-20f5-08da68250a55
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2022 18:49:12.2463 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a4c55gCd74z9ovKKIMfsJQH5Y8rg0dMt7WQslHAETHDDU2qpXTFq6/kj3a8jSK0DT1wNJmaGGKsiZoM4b1RIgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4434
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
Cc: "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Auld,
 Matthew" <matthew.auld@intel.com>, "Das, Nirmoy" <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCAyMDIyLTA3LTE3IGF0IDA5OjIwIC0wNzAwLCBHdWVudGVyIFJvZWNrIHdyb3RlOg0K
PiBDb21taXQgYWZmMWUwYjA5YjU0ICgiZHJtL2k5MTUvdHRtOiBmaXggc2dfdGFibGUgY29uc3Ry
dWN0aW9uIikNCj4gaW50cm9kdWNlcw0KPiBhbiBhZGRpdGlvbmFsIHBhcmFtZXRlciB0byBpOTE1
X3JzZ3RfZnJvbV9tbV9ub2RlKCkuIFRoZSBwYXJhbWV0ZXIgaXMNCj4gdXNlZA0KPiB0byBjYWxj
dWxhdGUgc2VnbWVudF9wYWdlcy4gVGhpcyBpbiB0dXJuIGlzIHVzZWQgaW4gRElWX1JPVU5EX1VQ
KCkgYXMNCj4gZGl2aXNvci4gU28gZmFyIHNlZ21lbnRfcGFnZXMgd2FzIGEgY29uc3RhbnQgYW5k
IGhhbmRsZWQgd2l0aG91dA0KPiBkaXZpZGUNCj4gb3BlcmF0aW9uLiBTaW5jZSBpdCBpcyBubyBs
b25nZXIgY29uc3RhbnQsIGEgZGl2aWRlIG9wZXJhdGlvbiBpcyBub3cNCj4gbmVjZXNzYXJ5LiBU
aGlzIHJlc3VsdHMgaW4gYnVpbGQgZXJyb3JzIG9uIDMyLWJpdCBidWlsZHMuDQo+IA0KPiB4ODZf
NjQtbGludXgtbGQ6IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfc2NhdHRlcmxpc3QubzoNCj4g
wqDCoMKgwqDCoMKgwqDCoGluIGZ1bmN0aW9uIGBpOTE1X3JzZ3RfZnJvbV9tbV9ub2RlJzoNCj4g
aTkxNV9zY2F0dGVybGlzdC5jOigudGV4dCsweDE5Nik6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8g
YF9fdWRpdmRpMycNCj4gDQo+IEZpeCB0aGUgcHJvYmxlbSBieSB1c2luZyBESVZfUk9VTkRfVVBf
VUxMKCkgaW5zdGVhZCBvZg0KPiBESVZfUk9VTkRfVVAoKS4NCj4gDQo+IEZpeGVzOiBhZmYxZTBi
MDliNTQgKCJkcm0vaTkxNS90dG06IGZpeCBzZ190YWJsZSBjb25zdHJ1Y3Rpb24iKQ0KPiBDYzog
TWF0dGhldyBBdWxkIDxtYXR0aGV3LmF1bGRAaW50ZWwuY29tPg0KPiBDYzogTmlybW95IERhcyA8
bmlybW95LmRhc0BpbnRlbC5jb20+DQo+IENjOiBSb2RyaWdvIFZpdmkgPHJvZHJpZ28udml2aUBp
bnRlbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJvZWNrLXVz
Lm5ldD4NCj4gLS0tDQo+IEkgdG9vayBhIHN0YWIgYXQgdGhlIHByb2JsZW0uIFBsZWFzZSBpZ25v
cmUgdGhlIG5vaXNlIGlmIGl0IGhhcw0KPiBhbHJlYWR5DQo+IGJlZW4gZml4ZWQgd2l0aCBhIGRp
ZmZlcmVudCBwYXRjaC4NCg0KVGhhbmtzIGZvciB5b3VyIHBhdGNoLg0KDQpUaGlzIHdhcyBhY3R1
YWxseSBmaXhlZCBhbHJlYWR5IGluIG91ciAtbmV4dCBicmFuY2hlcywgYnV0IG1pc3NlZA0Kb24g
dGhlIGZpeGVzOg0KDQpodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvNDkz
NjM3Lz9zZXJpZXM9MTA2MjYwJnJldj0xDQoNClRoYW5rcywNClJvZHJpZ28uDQoNCg0KPiANCj4g
wqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3NjYXR0ZXJsaXN0LmMgfCAyICstDQo+IMKgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9zY2F0dGVybGlzdC5jDQo+IGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvaTkxNV9zY2F0dGVybGlzdC5jDQo+IGluZGV4IGY2M2I1MGI3MWUxMC4u
YjgxZDU2NThjMjIyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3Nj
YXR0ZXJsaXN0LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9zY2F0dGVybGlz
dC5jDQo+IEBAIC05Niw3ICs5Niw3IEBAIHN0cnVjdCBpOTE1X3JlZmN0X3NndCAqaTkxNV9yc2d0
X2Zyb21fbW1fbm9kZShjb25zdA0KPiBzdHJ1Y3QgZHJtX21tX25vZGUgKm5vZGUsDQo+IMKgDQo+
IMKgwqDCoMKgwqDCoMKgwqBpOTE1X3JlZmN0X3NndF9pbml0KHJzZ3QsIG5vZGUtPnNpemUgPDwg
UEFHRV9TSElGVCk7DQo+IMKgwqDCoMKgwqDCoMKgwqBzdCA9ICZyc2d0LT50YWJsZTsNCj4gLcKg
wqDCoMKgwqDCoMKgaWYgKHNnX2FsbG9jX3RhYmxlKHN0LCBESVZfUk9VTkRfVVAobm9kZS0+c2l6
ZSwNCj4gc2VnbWVudF9wYWdlcyksDQo+ICvCoMKgwqDCoMKgwqDCoGlmIChzZ19hbGxvY190YWJs
ZShzdCwgRElWX1JPVU5EX1VQX1VMTChub2RlLT5zaXplLA0KPiBzZWdtZW50X3BhZ2VzKSwNCj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBHRlBf
S0VSTkVMKSkgew0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGk5MTVfcmVmY3Rf
c2d0X3B1dChyc2d0KTsNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4g
RVJSX1BUUigtRU5PTUVNKTsNCg0K
