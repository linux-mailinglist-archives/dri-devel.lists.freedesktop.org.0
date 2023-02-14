Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F99696D21
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 19:40:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E820E10E971;
	Tue, 14 Feb 2023 18:40:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABF7210E0F8;
 Tue, 14 Feb 2023 18:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676400043; x=1707936043;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Zik/Sf3794wO8YO9fIFb50aaGGpeMPgdKMZpNJ5CDXU=;
 b=VOOgv68OKkXjEDu9V93Ke+8gaLwohzKem8YBJsRrqw6ZlX0UExM5ampD
 UO8prA4fzgjXwtrshsfyn5r15T09Pp+D2JBLweK+izhDKNXKGBkCH7dcv
 QmamMF/ZejpPGa1KAS7xo/vq+PXOj+2ifNHgxtIvIpa1zieCAOAvTgbOo
 ebvHb+t19GW+WSbimWn0+SAbAGQ9hfCstdUwm1JTD9cLDU4KQ6+80ujWR
 d06YZQLsDKS5MpNpCEKxvFaI+IY9JdhC7tyJrTkYisWiYI/rHNqCSKnUG
 +cTFyw2+flGKr9EgtmeCnD1+VEMGM9HmGhUPCrNU+yl1v0wJhU5wqJR0Q g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="395851588"
X-IronPort-AV: E=Sophos;i="5.97,297,1669104000"; d="scan'208";a="395851588"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 10:40:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="778462437"
X-IronPort-AV: E=Sophos;i="5.97,297,1669104000"; d="scan'208";a="778462437"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP; 14 Feb 2023 10:40:42 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 14 Feb 2023 10:40:42 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 14 Feb 2023 10:40:42 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 14 Feb 2023 10:40:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g5aXf1dauVen5hOTo0OxSS/UwDYEmxjRfDqZuqoo41AuNTQjTcJ5T4lfleXtcS0Bxk5Kn2H4TXig/Gf8WmPXuKMQ+MD97lUmRT4zbYXMzbgdamwQxupnty2Cc/BuitSfLvf7R5dcS0rOtR0tVxcPf+GnhoBocl+hdjodlBRaTK3j/l5RWMfwlU0uRzOl45kVbSNaXbfhi10tOrX8BUJFAcXppnOAIA0zXM5b71RqpXi15pEaCvNAN3NDyl31jAd0H6mkL1ukTOY+kdvRTWYVH/7yWHm0u0yTQWsneitjnmBvPMyRLAQxQ/tJoLQmSVM+WnU11rZqx3BGTPBEAVF7aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zik/Sf3794wO8YO9fIFb50aaGGpeMPgdKMZpNJ5CDXU=;
 b=XHZxCcBOVLdeAuPzrcAqAK669CBXNEmciXHvd6XjZVshHxpZmshuXxOS4MoJVCm27QszxTt6TJGeZkBVrj5WloqP+QnRCyPBWc/2BVYZ82777uNVI9k8QBgIU1Q8blrMltbC1XttUm9mRmSflhKGkaTWaZYtTmoDBX1GST/OLUL3rsSbjw35cmp57vkiiy0sr+lyWG0lPy5paOyCM91uZDfyP6b9Z+tdMiuK/HjIAEhIB2c1+IrXZ9kMcxw93QJ4DyfVqeKay0fhAJqe9pknHBGIg3MTADUmQcu5PjtWk1/vlFPFNpmfVu3xE2Y3lW90oUD1t4OeuGs4TJxOKRY/Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 DM4PR11MB6405.namprd11.prod.outlook.com (2603:10b6:8:b5::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.24; Tue, 14 Feb 2023 18:40:41 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4cdb:78a7:917e:88e5]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4cdb:78a7:917e:88e5%9]) with mapi id 15.20.6086.024; Tue, 14 Feb 2023
 18:40:41 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v4 5/8] drm/i915/pxp: Add ARB session creation and cleanup
Thread-Topic: [PATCH v4 5/8] drm/i915/pxp: Add ARB session creation and cleanup
Thread-Index: AQHZPOiMm76f6sI3cEKUTiTQN1CkzK7OzdmA
Date: Tue, 14 Feb 2023 18:40:40 +0000
Message-ID: <c1299435e3e3eac03319063f40fccca8d3be47e0.camel@intel.com>
References: <20230210004209.1877143-1-alan.previn.teres.alexis@intel.com>
 <20230210004209.1877143-6-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20230210004209.1877143-6-alan.previn.teres.alexis@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|DM4PR11MB6405:EE_
x-ms-office365-filtering-correlation-id: 83cbbfef-9cd1-4115-7b48-08db0ebaf924
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aZX8Vp4IlNz/ZWlSVOtgUTjHWIREFK2INlvj/0B6VuahQPC0g8RkiEsW7W2jQYgAPtZzHTM2ImUKYMBdRbLlikZKl9ar+fW5u61dgQcThkJde2yPLTGA3agCxDGL7N9NxbGxQJA76kf28/041125PP+JyFJbSXMVYoxEApXOoBPKAUOdCtZgOfGFdo5+DT3ZlpDauulaXjRCGm8JzU2HHv5HOhhrh3SY6DYRM4hL8IOwSIX1ChdtLuQcPlYVbsXWK7Qee/YwCJwcaRdXSSAkXxXBx1Et9wkwGWfNyT6RaMr2zwOHmLkFvSFNXfojzi1mvobP+M2DX78VfML+t/9r+wE5ueRe1D7FUKnrlvIbdd///ZScO4WvF7Ksti0Fbd7VPFFTaVPHZPPG/64eH/qu1HyELcC9H5rf7azak0vYioAyrw0FRSoVv9uG/e+zJ57ohwcMyv4VRuKUmLhjqZ4dEoEV6+e5gS2Q7WeM6ys6M1AeWkmIkoopo0yZ3dRJgqYWJHivQ3qAJHJnIbVo+mVdQrOy1nQTa7WtaJR5nW9S21rqVwakIExc1Og3pYLp4eSsM89OIwUU1ptgABnfEYASREvrDe1kcqZsj79P8zAtYt+hnsQ2xH94MUnSGl2OmmZIeJjHkpZxmi8VWOXbILYWjyj23AiLEUVGwJw2EizCKs0/LT05RdS7pdVdZKTsslVPXiL+420XjiDfM1JNqMuuXg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(136003)(39860400002)(346002)(366004)(396003)(451199018)(2906002)(5660300002)(86362001)(41300700001)(316002)(82960400001)(66446008)(66556008)(8676002)(6916009)(64756008)(76116006)(66476007)(66946007)(38100700002)(8936002)(91956017)(54906003)(36756003)(38070700005)(478600001)(6486002)(122000001)(71200400001)(186003)(26005)(6506007)(107886003)(2616005)(4326008)(6512007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OUVKN1gxV3l4QVFFcXZValJvcjFaR05LQmZwb0ZyaDFGaENnTFV4MDdUNlRk?=
 =?utf-8?B?c1RjODdPOTBuVDdPaTZTcXVUUHBBM3MvU1NNS0N6THFvWXBMM1E5WmFVVDZv?=
 =?utf-8?B?UEU0SXEyU2hKdllnVklOc3BrRGJxR2tHK1BTREREb1pJdit3Y1BXSUEwcjVR?=
 =?utf-8?B?VDRkUDV5aEZDb1M3Q05kdU05cjFETUllVDkxU1JJcStMdUZkdlpVUXZReFB6?=
 =?utf-8?B?OXE5TGZGUFp3MWZBNXlSeGkzMmlnY1ZKNmMzalR0L05FRHo2TTNlZ3RmTERC?=
 =?utf-8?B?aHdTa2FycGJ1N09MM2ZHeXZtVFU0YXM0U3lQK2hhYzZjanlkQ1lsMWVzZ3hC?=
 =?utf-8?B?YTFIZkxtdjA1S080bFRVMERSVS9rcUFtUXBpN2FBT3IyRWFIZkdKQWlZeUZQ?=
 =?utf-8?B?WjhtMFVqSFBjOU1hcjJETUFyU2NabGJaQnAzT0FISTdKSkcyNG1pS1c5VHRl?=
 =?utf-8?B?OTlxbko1bjFLbkd3MW9ndEZZQ3VHK1VDdzBCVS9Ha0Y1ZEQ2V1RQQ3duM04r?=
 =?utf-8?B?b0NIVUV2Qy9VOW83ZEZ3MlRzWXFpZXRPU2FmVHkzVlYrV1pyVE13M0pOUnh1?=
 =?utf-8?B?Y1JmbzRaQVZHKzMrQ043WWN6alJqUkFUVnYxbFpzekdiNHBzRkNFaFJvbnJB?=
 =?utf-8?B?YWxqMHk3N2ZGUk0wYmh4cCtnMnNuLzJmaHZubzV3UnpGYlE1SUZZdHc2dndQ?=
 =?utf-8?B?aU5jVzR3U1RWMldTTE5HRzh5V056WU85ZkVpbWVIclBUcHZNaDU5K0FKLy91?=
 =?utf-8?B?a3hYaUJNV2Q3SWFrYXhOeFhqb3Q2dFBIeHM4a1E0UDVyUDFaOVR4ditkb25a?=
 =?utf-8?B?U0tpV2hFMEg3eEFabFhSNks2amdFclYxUVMzaUl1MDVKSDh4NVM4cTFlSTR5?=
 =?utf-8?B?WURzQ1dwU3VJQVc2T1ZHUEE1WFEwcFlVL2tJclg2Q3lGRmtlbjBoYWUvUFV3?=
 =?utf-8?B?c1lHQTFvZkE4SXN1cU0wMUFIZEkzeTNyRXhZNDV1WVdpVUtuOWtwVkJmMFgv?=
 =?utf-8?B?RkhzMFV3Z2J6d0xLVGdPRlZ3T0pXd0NOMGJQdjlvcklub255S1dDSVFBOXNW?=
 =?utf-8?B?NE8vWWoxRE43azJPWjZuTXlLRlZ1ZUVabW5JR1BHaEdCbHUwMGhYdlI2ak01?=
 =?utf-8?B?WnFKdDJ6d2YwTy9aSmRFM3QvcWs1a0U3YXpZL1pZQWJPV083WHFWUmdNMGZZ?=
 =?utf-8?B?SkNDUnhRK2Y5VkIrMUFuUU5FNDhURmJ1Y0JDMVp5VFpGUE41OHFWeWdCam5E?=
 =?utf-8?B?TFVlT2FRdGJhTXlHUXVwRjc4M1NFK1E3YjFYUDg3VTViZGlYRmV1MGpyL0dJ?=
 =?utf-8?B?SFArelpwYytPUmsxM3RMRWJUZWowS08rRGxRT1FiTEhrd1ZabDJhMzlXdTNn?=
 =?utf-8?B?czNORFJVTng2OW1VdHZiKzBhSm9HNHpwVGdZRisvT01MU1BSbDl4L2RPRzR5?=
 =?utf-8?B?UEE4cHJweTNUb1MyYmRRZDk1VE50QytlQVZYN3lOeG1rbHgxN1lzOVNTWjNR?=
 =?utf-8?B?UHVmTmxFaCtQc3B5d3dJdlJPZDV1aVBUcmZYQ2Vmb0h6Uk43QlIzZldEcHAv?=
 =?utf-8?B?UEI0R1RYUGxMemtaMUpQbVRUQWxKckZUZFFRWTNVcWZ0UUdBVHM0RVhBV09y?=
 =?utf-8?B?V2drdnhQcitpejJUUnFXTzhKcHRHNlZHUUpwR3duTDhldlMwY1BwMTVnRVVW?=
 =?utf-8?B?ZEtnTUdUdE5RVGNOdnZNNEhMSnA1SzlxZitKOFlyRjZPZFppVmZENWpxNGNQ?=
 =?utf-8?B?cDRVaVBkd0xzczFSWG0rV2loUGdUandaY2RWZlF1cUZHTUJyZk1wZjRuN3hX?=
 =?utf-8?B?aGhQbFQrUEpjeGhoMFZkSUJibjBheGljMFdmTGI2cFduOWNuRit4cGJTbGJI?=
 =?utf-8?B?NjJwMEpPeFQzWktPVGx0TGNPbmx3Sjljdm9QWmRVZkgwalQwYk53WEpJU01F?=
 =?utf-8?B?SmJMV1NWdUcvd1hIdzdJeDkyUXlSQVdCVzhNcmpvSFJTaHNOVHpxV1V5bWxl?=
 =?utf-8?B?VnJxWTZoVDhZcWJPTU53VTNucmtuUWQ2Vk5tWVkwd29GYi9ucnNwT1ptOEJN?=
 =?utf-8?B?RndwMHIrQkFJYzllSlZKTWRML2NZR09jUWlSQzY0aXExT2t5bE5RYk8yY21Z?=
 =?utf-8?B?V0JPeE44eDgydGVoT1IwTThhbTJ4RENxak03bmVjZSthYkt1QUt3OHFYYmk1?=
 =?utf-8?Q?lkP7r9KOnS6MuWIu6jPulP4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <78B42F7770571E49B189E1229EBFEF7A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83cbbfef-9cd1-4115-7b48-08db0ebaf924
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2023 18:40:40.9212 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XeniCwEPPX6g6B6uw+Qyz9E62fxAk2MVZEHKNlxGy2iMPJZeyeryyYMmqiZemObBFzKqMtQHXfLcjCZMJSQbBnOlcacL8OnkgUWEg43+rPeu+FqCUALrdiYlleiOznBu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6405
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
Cc: "justonli@chromium.org" <justonli@chromium.org>, "Ceraolo Spurio,
 Daniele" <daniele.ceraolospurio@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTAyLTA5IGF0IDE2OjQyIC0wODAwLCBUZXJlcyBBbGV4aXMsIEFsYW4gUHJl
dmluIHdyb3RlOg0KPiBBZGQgTVRMJ3MgZnVuY3Rpb24gZm9yIEFSQiBzZXNzaW9uIGNyZWF0aW9u
IHVzaW5nIFBYUCBmaXJtd2FyZQ0KPiB2ZXJzaW9uIDQuMyBBQkkgc3RydWN0dXJlIGZvcm1hdC4N
Cj4gDQo+IEFsc28gYWRkIE1UTCdzIGZ1bmN0aW9uIGZvciBBUkIgc2Vzc2lvbiBpbnZhbGlkYXRp
b24gYnV0IHRoaXMNCj4gcmV1c2VzIFBYUCBmaXJtd2FyZSB2ZXJzaW9uIDQuMiBBQkkgc3RydWN0
dXJlIGZvcm1hdC4NCj4gDQo+IEJlZm9yZSBjaGVja2luZyB0aGUgcmV0dXJuIHN0YXR1cywgbG9v
ayBhdCB0aGUgR1NDLUNTLU1lbS1IZWFkZXIncw0KPiBwZW5kaW5nLWJpdCB3aGljaCBtZWFucyB0
aGUgR1NDIGZpcm13YXJlIGlzIGJ1c3kgYW5kIHdlIHNob3VsZA0KPiByZXN1Ym1pdC4NCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IEFsYW4gUHJldmluIDxhbGFuLnByZXZpbi50ZXJlcy5hbGV4aXNAaW50
ZWwuY29tPg0KPiAtLS0NCj4gDQoNCmFsYW46c25pcC4uDQoNCj4gK3ZvaWQgaW50ZWxfcHhwX2dz
Y2NzX2VuZF9hcmJfZndfc2Vzc2lvbihzdHJ1Y3QgaW50ZWxfcHhwICpweHAsIHUzMiBzZXNzaW9u
X2lkKQ0KPiArew0KPiArCXN0cnVjdCBkcm1faTkxNV9wcml2YXRlICppOTE1ID0gcHhwLT5jdHJs
X2d0LT5pOTE1Ow0KPiArCXN0cnVjdCBweHA0Ml9pbnZfc3RyZWFtX2tleV9pbiBtc2dfaW4gPSB7
MH07DQo+ICsJc3RydWN0IHB4cDQyX2ludl9zdHJlYW1fa2V5X291dCBtc2dfb3V0ID0gezB9Ow0K
PiArCWludCByZXQgPSAwLCB0cmllcyA9IDA7DQo+ICsJdTY0IGdzY19zZXNzaW9uX3JldHJ5ID0g
MDsNCj4gKw0KPiArCW1lbXNldCgmbXNnX2luLCAwLCBzaXplb2YobXNnX2luKSk7DQo+ICsJbWVt
c2V0KCZtc2dfb3V0LCAwLCBzaXplb2YobXNnX291dCkpOw0KPiArCW1zZ19pbi5oZWFkZXIuYXBp
X3ZlcnNpb24gPSBQWFBfQVBJVkVSKDQsIDIpOw0KPiArDQpGaXJtd2FyZSBBUEkgdmVyc2lvbiBp
cyBiYWNrd2FyZCBjb21wYXRpYmlsaXR5IGFuZCBlbmZvcmNlcyB0aGUgY29ycmVjdA0KQVBJIGNh
bGxzIGZvciB0aGUgcGxhdGZvcm0rZmlybXdhcmUuIFRodXMsIGFsdGhvdWdoIHRoZSBzdHJ1Y3Rz
IGFyZSB2NC4yLA0KdGhlIGFwaV92ZXJzaW9uIG5lZWRzIHRvIGNhcnJ5IFBYUF9BUElWRVIoNCwg
MykNCg0KYWxhbjpzbmlwLi4NCg0K
