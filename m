Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C9E701373
	for <lists+dri-devel@lfdr.de>; Sat, 13 May 2023 02:39:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 925A110E71D;
	Sat, 13 May 2023 00:38:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDACA10E711;
 Sat, 13 May 2023 00:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683938336; x=1715474336;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=aGkVUcpfii/k+WBI3T9Vded35/YZ/PDpsTvvhkz/fXQ=;
 b=EahjwmkwfsowvGWoTXklY8gkeJic1pz8oPDVZrnlgkm+lzFFP3daDgjM
 C+tdFv0W7LxJkGx57+nU5BaM8bKXQM5/kw0/n8Jeo4+PXwNf8L+0QO2nq
 x/yVbHx1p9Ql7XQNfOAMeWj/Wzf4bD4mN1CAoYgCJ2o/FD8H5impKNqQj
 lwM9SJyoXfZdjcA0O3vrPWjSuPx9ml+SEzVMV4lz9zoPlvv6HzZgHNTOj
 cMv3Df6NL0Kq0+bMltmuIsn4rC0036GZ+QOLyyCppjWHDb4M3SLKYSt8O
 7p6eWAHjr8o2C3OOg4JJdtryeDkhAmlGZvdnL5wBG2sFqr5PJXCmkfJNd A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="350936249"
X-IronPort-AV: E=Sophos;i="5.99,271,1677571200"; d="scan'208";a="350936249"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 17:38:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="677849416"
X-IronPort-AV: E=Sophos;i="5.99,271,1677571200"; d="scan'208";a="677849416"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 12 May 2023 17:38:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 12 May 2023 17:38:55 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 12 May 2023 17:38:54 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 12 May 2023 17:38:54 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 12 May 2023 17:38:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CkF7CC7aSbOhYUAzbbqO7JQeCu9hH4zrVfnbpTU/CaDtK3o5K5FRk6XACbZ3rP8rO0sVe3sxnaBA2BdUZwzwqY5ciiSJaIS9hU/U+Gh2arIqGyL+xHcRaaRKV8Owq97g60gJlY1Lua200CVJ/Rj61IO5uN2rlx3vLyol9KP+SAcCcav7pMzwLnjsCcsvDeagV7sOcgZzjq0nokAxUjWcgUpMqFiTxC8qw/2jtJWnK9OsInfCrcdOKP5wqx/9ff7DXh8GMYG0eTdBieaBaGrsgof25zWexqBIi5xupBtRYFvo5m7qf/61lAYTtxnZAx9xVlv4Mx+nkQTQ6dw4U00MYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aGkVUcpfii/k+WBI3T9Vded35/YZ/PDpsTvvhkz/fXQ=;
 b=dRYw0j2IaE0MXDCEuKv+ANafWUU+ROUwF9t1ORPulLvfxhqnJ38SgwltzvnGW+X5HSGRXeRWZnxHCRBcf0BH0aKUbbfsW/gvvkevVV6xPck/BYBemQf3jKtunrEzEnlJ8S3MI/PPOwfN47IxMx3eS4hr+mO9ZWJhdNQ0aBTlYHmplfIqMoqE0nenuKRmyqff+s4FAvTXDBbfm7PKyJBRiqqbiluXZJB/+0gbUShwQPS3oUTCgNsv6WiIq4qvPzMPQmDuA0TkaMiU4+INUe9IhxrYAG8+TAUpyiN2sUzn0sMNy53Ajgq8VhLFcn7xDUdpPJhx8PK2VmKUD8HVaxYRbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 BL1PR11MB5381.namprd11.prod.outlook.com (2603:10b6:208:308::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.24; Sat, 13 May
 2023 00:38:53 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3%6]) with mapi id 15.20.6387.020; Sat, 13 May 2023
 00:38:52 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/i915/huc: Parse the GSC-enabled HuC binary
Thread-Topic: [PATCH v2] drm/i915/huc: Parse the GSC-enabled HuC binary
Thread-Index: AQHZfQqz5X43fSE55Ue2RjgElvMPiq9XbHwA
Date: Sat, 13 May 2023 00:38:52 +0000
Message-ID: <6cdd5686a5b3b892c1d871d5c5d473e1c411bd6e.camel@intel.com>
References: <20230428185810.4127234-4-daniele.ceraolospurio@intel.com>
 <20230502152743.304579-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20230502152743.304579-1-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|BL1PR11MB5381:EE_
x-ms-office365-filtering-correlation-id: 77b725d8-62eb-4351-dac0-08db534a6cc1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xdDsHUNWiGpIJiiCWL2D6YoLGSVVBBfpSTVexzpHSx1cT7qnkhPmi91abnblQdbwUrTS7gpiNqj9RH2nwxFaw9AOttMiXKKFwWKNTs9DY/u3xBqjljGNe7izTRVJSdLXgQB4OPYDlIqdsxxNPRHhto0p6t5Z+BNQGalfeKNFISrDOYsuXbpaEOjXpWJaW54D06kmsJO9RuKZmDSC9F9cPt/ncU10ZW5Qqg+eKVP5qFlv2sJ2TLIP7gDC/kgGfBfnLZxXZhzKJ+up0GTYLDrlXVm4aIGxZ2bYzJhMaL88fWSaYLU2tC/+hw+1P28wEhV/YUSA+hkxUNRGFoETz61vJlGF4ZaBkk7QlrX3oEVRbwkkrVkpWxrLf81ETJPhsF2UvppXgG30lHLIiRTeBPwykoZD1BnUMe1C1G1byhymQHdgAXHL+cdXqWkU+Bye/N8QF0QrFZ/wOtpBQlLd3rJ1xT5nCGNpMPoToqwTI3Og+1BzOd0p1ECq10XHWa+ntB1X6xyVGFpBPYdz2VFQ80nI/nTzDUQ7qxxGTBol/Sfx6t2kkZPrslfNLs6oGiN+d9dk/tAlnJdZ/sJnk1Xp/P3dzarPDTEERcsGe/xnIlZf7qgjoTTPEL5D+JDHP3utvs0K
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(346002)(376002)(366004)(136003)(451199021)(86362001)(36756003)(450100002)(91956017)(6486002)(110136005)(316002)(66946007)(64756008)(66476007)(66556008)(4326008)(66446008)(76116006)(478600001)(41300700001)(71200400001)(8936002)(8676002)(5660300002)(2906002)(83380400001)(38070700005)(38100700002)(122000001)(82960400001)(2616005)(186003)(26005)(6506007)(6512007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UU1rUThua2hJZ2R2aDhDbCswS1B1NEhlZ0JnU1FjaUVZNnYwYklYWEFHRFN1?=
 =?utf-8?B?bmVTc0ZrcXBsZ09VcmxKdC9BRmRydU1pdkR4NnpRYk80S3BjWE14cjQ5b1Bw?=
 =?utf-8?B?YWNlNkpNV0ZtODNLKzlnUGFiR2ZXSnhtRHl6ZmIydkx4K3dCYjJ3QXlGbzV3?=
 =?utf-8?B?RGE2ZVMrcGpDRVlFZm9UY3NITmRUZnBIUklHR3hDVmoxSHJkblRQbE1YNWQv?=
 =?utf-8?B?UWxmUWt2QVNpeFhqRHplV2J0WHdqMERzVlBCeVRrSTh0NHRKUnp6NktiWlFu?=
 =?utf-8?B?azRMMHU3M3FsMDFsSGNyL21qTFFpQnBHYUVZdmlMZ2ZnWmZaVGhqTmxUWXJX?=
 =?utf-8?B?aU94TmNtNDE1RlE0MEVodFpNbVdqQjFqY1RxRHQ0aVlhWi90SEFmb2dXSEMv?=
 =?utf-8?B?TmpCLzlZbk5tNTkvQ3UvR0J2SVk2dWFTMGNZSzkrc2xvZUxoTjlKQURaNndY?=
 =?utf-8?B?cnc1L2FhVklrZFkreVNETmVtR25jdVU5U3RlQmRsZGtDbE53ZFBJajhQRGt1?=
 =?utf-8?B?d0dVUGpsMERIeEowNUs4aEl1THNqSnBTaXdSZjhUS2VSVlpnNDJoU2t1aFBt?=
 =?utf-8?B?b3NHcGlOU2IrNnZmV3g2SUNBNUh0WVJ0SnhGMUNkNjFmQWI2dzJudEJ5NTRk?=
 =?utf-8?B?M0VCdUljM1BLcmNoM2x0Q1Q2L0g3UGdaUWxiOGpZYlRQcEZKNlo2NXJwWG44?=
 =?utf-8?B?d2pnTFN3SHQ5T08zU3YvV25rMDJhYUowWTFpMmloY1dxVm1sZ3BKWm1yLzJE?=
 =?utf-8?B?cjdZV1UveVJaVHQvWXZTcXJyaENUZUtIdFgxRE9MODlUUWs4RXJleTByTk5Q?=
 =?utf-8?B?U0tRWDlEYzJhN3puQkh5THdIeHIrL1Ayd3BGMjJqRUp0dWc2Wm9ZUlZnbkZi?=
 =?utf-8?B?MlpRNzRMaUJybDV0RGZzL2ZlK2psSkFta2RjT1I2V29qT090RUJkWW5ZME5n?=
 =?utf-8?B?dGxFdU5mUVNvQzR1ZFVwQ3RsVHhxWkJiUTVlZ0FsRml2cEFRUHZtQ0RDandJ?=
 =?utf-8?B?UU9zUWdZYTBVelNyVFY3QS9Ca1VITjJ4cnI1YW5zNlpQcUo2endzc21QY1BX?=
 =?utf-8?B?WmZaT0hvZ1pieEdsaytIYmczcGZ5ekVkNVV6THFDTm5Vc2JIanhmNVJ0NjF1?=
 =?utf-8?B?ckljU3hGQUVxbzRTTGZVdzNHQU1rOXpoWm91UlMzcTBiOXRzM3FZOTByVG9z?=
 =?utf-8?B?Um5zYWVYS2xlQTVBQUw0c0lXTHBLSGcvamRkd3h1OUlZdEx3SE4yT294ZGI3?=
 =?utf-8?B?WmI2OTVSRG00UU91cy9zek1rU0RMUExUOHVycHVFcDhKM3NtOXU3YXBxMkUw?=
 =?utf-8?B?Vjk3ZVhTZ2puYU9VRUNIRndESlZzK1RtOGZ2a0pxOXgrT3B3R3I1bm9lbkN3?=
 =?utf-8?B?M3RYWmZxSlZQbmhvVG1yV0E5U0ZuUWQyRVI4aU4rTm9KUkxxbFA3Ui9nd2F5?=
 =?utf-8?B?bmZNOFJLM3JYdk9ZQXNNK3E5amZYcEduQ3F2d040Y21Dc0FuZGhLdFdjcUJq?=
 =?utf-8?B?UGZxTC9YbVNsMXRBMlhxb01ZUWQwd0p1R01ZWi9sdXFSWWI5cHpnMmxGTHZY?=
 =?utf-8?B?dElDMGp6V0JKU0NyLy9DaXB2OTJWTitybC9UTnd1LzFwVGIyb2pjZXlZNkp5?=
 =?utf-8?B?akU3Nm5pRThIamRqREszdFd0cHV4ZDB0OTloa21JSG5SQWdOWlpDN3VzWmdC?=
 =?utf-8?B?MVY3dzBoMWRBSStnUjVXSlp0UTVQNUxrYkhXT2MyeWx3TGp6ODVvN1RrZTB5?=
 =?utf-8?B?R21XRVVLTmVXc0JRMkZ2WXc1WGFKdFo4ZGRJOW9RdGVxYTlPMkp1RlNVNTRn?=
 =?utf-8?B?aWtlWVZtVVdGNUNYSlF3a0s0TXZHVkQ3WU0wQVVZdk1SRVpVeTBHSnJ6TFZV?=
 =?utf-8?B?UkpuT3d3TzY2aU05dENXYjR6NVl2UEl6ak5CU0pONmlkTWVnWjZmOFNQQzY1?=
 =?utf-8?B?TDhBVU9najNLQ2N1RUxlTlI5QjFWVnlhbkRkYmlFOUdTQVhzUlY1SmplL3gr?=
 =?utf-8?B?SXFRQnZubnpJTWtJSEV2cGNpRmhOVnB5cWRrQXNFdnB4clVrMVNRWHJlUnFa?=
 =?utf-8?B?QThVV2RZM28wNFhDNDJIZmxQNCtza3lCWFdNdWR3WHg2bW41c3RUcjFBcDIr?=
 =?utf-8?B?TUJjQkFtTkVqL2tyYWN3RE12S0dOYUtkdTJFcXY0aHBaOXY3YTNpUVIvMXd4?=
 =?utf-8?Q?M7wSPJfZz9B/gewwKQHWloU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7600A8B11AF8824B90208D75C86934FE@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77b725d8-62eb-4351-dac0-08db534a6cc1
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2023 00:38:52.0375 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IUCGYTQP1v773Y+m5deiYdL46bPZ9WuhCHcb3jgRTSFbBayxxx9NNHxG70bMGPjCvFQtPmVVK18g609AqLyY9BDLcwV9biEe6br8E4C0YjDHkZdwI0XmrI8rupQLlIPP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5381
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

T24gVHVlLCAyMDIzLTA1LTAyIGF0IDA4OjI3IC0wNzAwLCBDZXJhb2xvIFNwdXJpbywgRGFuaWVs
ZSB3cm90ZToNCj4gVGhlIG5ldyBiaW5hcmllcyB0aGF0IHN1cHBvcnQgdGhlIDItc3RlcCBhdXRo
ZW50aWNhdGlvbiBoYXZlIGNvbnRhaW4gdGhlDQo+IGxlZ2FjeS1zdHlsZSBiaW5hcnksIHdoaWNo
IHdlIGNhbiB1c2UgZm9yIGxvYWRpbmcgdGhlIEh1QyB2aWEgRE1BLiBUbw0KPiBmaW5kIG91dCB3
aGVyZSB0aGlzIGlzIGxvY2F0ZWQgaW4gdGhlIGltYWdlLCB3ZSBuZWVkIHRvIHBhcnNlIHRoZSBt
ZXUNCj4gbWFuaWZlc3Qgb2YgdGhlIEdTQyBiaW5hcnkuIFRoZSBtYW5pZmVzdCBjb25zaXN0IG9m
IGEgcGFydGl0aW9uIGhlYWRlcg0KPiBmb2xsb3dlZCBieSBlbnRyaWVzLCBvbmUgb2Ygd2hpY2gg
Y29udGFpbnMgdGhlIG9mZnNldCB3ZSdyZSBsb29raW5nIGZvci4NCj4gTm90ZSB0aGF0IHRoZSBE
RzIgR1NDIGJpbmFyeSBjb250YWlucyBlbnRyaWVzIHdpdGggdGhlIHNhbWUgbmFtZXMsIGJ1dA0K
PiBpdCBkb2Vzbid0IGNvbnRhaW4gYSBmdWxsIGxlZ2FjeSBiaW5hcnksIHNvIHdlIG5lZWQgdG8g
c2tpcCBhc3NpZ25pbmcNCj4gdGhlIGRtYSBvZmZzZXQgaW4gdGhhdCBjYXNlICh3aGljaCB3ZSBj
YW4gZG8gYnkgY2hlY2tpbmcgdGhlIGNjcykuDQo+IEFsc28sIHNpbmNlIHdlJ3JlIG5vdyBwYXJz
aW5nIHRoZSBlbnRyaWVzLCB3ZSBjYW4gZXh0cmFjdCB0aGUgSHVDDQo+IHZlcnNpb24gdGhhdCB3
YXkgaW5zdGVhZCBvZiB1c2luZyBoYXJkY29kZWQgb2Zmc2V0cy4NCj4gDQo+IE5vdGUgdGhhdCB0
aGUgbWV1IHN0cnVjdHVyZSB3aWxsIGJlIHJlLXVzZWQgZm9yIHBhcnNpbmcgdGhlIEdTQyBiaW5h
cnksDQo+IHNvIHRoZXkndmUgYmVlbiBhZGRlZCBpbiB0aGVpciBvd24gaGVhZGVyLg0KPiANCj4g
djI6IGZpeCBzdHJ1Y3R1cmUgbmFtZXMgdG8gbWF0Y2ggbWV1IGRlZmluZXMgKHMvQ1BUL0NQRC8p
LCB1cGRhdGUgY29tbWl0DQo+ICAgICBtZXNzYWdlLCBjaGVjayBjY3MgdmFsaWRpdHksIGRyb3Ag
b2xkIHZlcnNpb24gbG9jYXRpb24gZGVmaW5lcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IERhbmll
bGUgQ2VyYW9sbyBTcHVyaW8gPGRhbmllbGUuY2VyYW9sb3NwdXJpb0BpbnRlbC5jb20+DQo+IENj
OiBBbGFuIFByZXZpbiA8YWxhbi5wcmV2aW4udGVyZXMuYWxleGlzQGludGVsLmNvbT4NCj4gLS0t
DQo+ICAuLi4vZHJtL2k5MTUvZ3QvdWMvaW50ZWxfZ3NjX21ldV9oZWFkZXJzLmggICAgfCAgNzQg
KysrKysrKysrKw0KDQpDb21wYXJlZCBsaW5lIGJ5IGxpbmUgYXMgcGVyIGludGVybmFsIHJldmll
d3MgYW5kIHRoZSBzcGVjLg0KQWxsIGxvb2tzIGdvb2QgdG8gbWUgLSBuaWNlIHRvIHNlZSB0aGF0
IGFkZGl0aW9uYWwgY2NzIHZhbGlkaXR5Lg0KTEdUTSwgUmV2aWV3ZWQtYnk6IEFsYW4gUHJldmlu
IDxhbGFuLnByZXZpbi50ZXJlcy5hbGV4aXNAaW50ZWwuY29tPg0K
