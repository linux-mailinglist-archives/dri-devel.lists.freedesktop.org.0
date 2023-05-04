Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1E16F645D
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 07:26:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F11C010E387;
	Thu,  4 May 2023 05:26:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B333710E386;
 Thu,  4 May 2023 05:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683178005; x=1714714005;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=6u1sFF8AFJiTGDVBd01bsiCwIilxByu5WuXHxTxFT0A=;
 b=F/GK+3QlqtE8UEQMsjiUMqIwvLMW5RBsz6nDOCTIJ5rxikE3TpdPA6Xn
 XS/yR+nZjxw0mU/NTJFDD8OqX1u9ioBnHUsr/snVBOgMLcvCw/Y6M9EkF
 G0x1I+QKnNN1LZKD3It9MOzCd7qQy2x4YJ78DmaJuIw2Zn4ZXM+hKhoiJ
 Qzxw16hxEsl7Yaa1s+HOpyWebX7SO/ialQJ5ZjleeE68WOn4M9unbp+xV
 3QTiJIs0cgN3uZZ4NITtEyUgMEYk7+c31P2d/h8+phs+p2Ax0ajG1gPYX
 Fagcqv389+v8sgH8HRN+yQ7UHgi7ZNrh0/f6zBO5NlI9szE01G6RbCiBc g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="351827137"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="351827137"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 22:26:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="690964289"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="690964289"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP; 03 May 2023 22:26:44 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 3 May 2023 22:26:44 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 3 May 2023 22:26:44 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 3 May 2023 22:26:44 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 3 May 2023 22:26:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fxgdIiaKN085MJsv/aRkNsLSPy5xkuaHvfnFT0+bpAWBwFX9o2MFjx/7VfxgYagMg+jhQ1mXRCdjVsMUuiW55u+bPMJUwKOKQ8GD4STf+IhpYMyk3KM890N4yXuRCNA2kan5VuU9Q1/b9H4GwwnYA4AVSERKNd506SCj4w+uKcddSl+GDlERCaaccEY91h0/6qjq5EZvUjIoOJM/6NWPlFO86JfvlgpiXzk+Qu4yipCeTe8BL6xYXhq7l534FQMmnh/3lFaHkT+gRif6PyismYX2+st4p3NSlSXvR8Dt5Wgmj9kBc515+jgjYATtRFjRfBO4/ewMd8Tau/VPIJX9+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6u1sFF8AFJiTGDVBd01bsiCwIilxByu5WuXHxTxFT0A=;
 b=Q0f0vDmzeYms+Co58LN/O5vS3IRNiBuv0nSB1bb+pbXm4hDpHYLao43nWAhtjw8QBAX/BJQRmcgoNw9woGnglE9W9gDPAhI2bfRWh5S2CU8RHIFMUY5mpGpXfvw5am31M+lwBwMZuSlyi1YHo/Y8hixH1+RtGaRAUD1eZxmZxfh+abx7ZQRlumjmg4EHNp1oV7MJoONti7RGEC5O4qTfGVydI35vifOfcnQebM7k4nJAIGF8TOvuuyWJNZCJJHMADZAMxk2vbphNOF7dfgcz+X1lPi2xLmu2l0gCRuD/tM0c0ewTQTZ6NuAnyGmGmh9eVhOKnpsmwzt3WJZcQUueMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 PH7PR11MB6794.namprd11.prod.outlook.com (2603:10b6:510:1b8::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.30; Thu, 4 May 2023 05:26:42 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::34a1:94e9:ec9b:dfe3%5]) with mapi id 15.20.6363.022; Thu, 4 May 2023
 05:26:41 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v3 1/4] drm/i915/mtl: Define GSC Proxy component interface
Thread-Topic: [PATCH v3 1/4] drm/i915/mtl: Define GSC Proxy component interface
Thread-Index: AQHZfRSp8cr/GIG0Wka7hendTQu5V69Jl9eA
Date: Thu, 4 May 2023 05:26:41 +0000
Message-ID: <fd49333d820a27871c36bcaf31d3e37f2c5d39e5.camel@intel.com>
References: <20230502163854.317653-1-daniele.ceraolospurio@intel.com>
 <20230502163854.317653-2-daniele.ceraolospurio@intel.com>
In-Reply-To: <20230502163854.317653-2-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|PH7PR11MB6794:EE_
x-ms-office365-filtering-correlation-id: bc92d538-17fe-4ce3-3b64-08db4c60247b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mWuPAjr4kkWpFE1MsCSKMch/x4w0iIDDkS/4TcW2ToZml351l/dLkPhQHveD2sHok2Ch23vTVqeLCHH7MTX8Zzyhr65USzhpEJHUeOVKLVT3yT+85bdtkEMp1ukPTsGnJYJf1jyhw0P84eag3QlNWc47ykn9iZJea2Y9tIsKpZy8QNfH0Gvezyx6Qfo6JPD5HucD2RT61C0Srih1lFEz42OKW2nsUYDRnZl7DGrijifOWW0kif9YWJTdQYVszoJl+sO4g26KLSDDsfQwyzIdKa01ZVuANPh0lQ6qcH+B/8TVWynuZdaWjO+54fcyjznLRp2YXPVjqQihWJGhrUlfY/zChQJ+63WzqLCnlZK+SCCf7sbIDHyowKPk89GgdsCy95aeqfC3AxH22YHxWrSKnS8YE4uyAOPxJ/cWpH958lTK3CmPy+3JNXECEgI6MD/Fr5SXyYnHQxK32mr9YEGRdywDkag3LQXltBr8GBgMjkp3Mh7+Y+mgiU3VqrXaxii19d9sZLAXHzu5kWKJj+5rwCGnLmVZ8Zd263rXFZdPmQKSBbQvjEqBoCUA1Hr2gjNpvJBek+w5nVgmHLWw/NGlreNdSWDz5itTHw+iZ5UxjeGa5XIOefB98Z5FLOHSQWUG
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(39860400002)(396003)(376002)(346002)(136003)(451199021)(8936002)(5660300002)(82960400001)(8676002)(41300700001)(316002)(38070700005)(86362001)(36756003)(38100700002)(2906002)(4744005)(122000001)(186003)(66446008)(76116006)(2616005)(478600001)(71200400001)(6486002)(26005)(6506007)(6512007)(4326008)(91956017)(54906003)(66556008)(66946007)(110136005)(64756008)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bmlyVHFrOU5JMjBQZTJ0RmNYWFBlN1BDa3Y4WVUvVXFOV014VDNtV1VyNHlE?=
 =?utf-8?B?WUNRdUYxMDUxcStQTmxYZ3pFV3Z1dnAwdlNnSDcxZW9hOEY3NUI4c1JXV2I0?=
 =?utf-8?B?a1h1bmFhMlY4WGlhZTYyRnNPY2hjbTQvSUNwaHhrTjhxZ0RnbFB6bFdEa1Jw?=
 =?utf-8?B?ZlhLaFFEWlJONnhVSk5yb2FVWENUUWxBdGFmcVBKbWxQbGtMVldCbW85NWNO?=
 =?utf-8?B?V2JEL3BZS0YzU2JyYzJXbk5ielc4RUd3cytlL2hBd3RoOHg5VWFLeW93Rzg0?=
 =?utf-8?B?ckpEUml6dWpuYW10d0VqOUFYNmtmQklZNDRvOFR1WGtWeW15b0czUVVQMHls?=
 =?utf-8?B?SU5xNDlXOWNQaTdzV0hvL250emREKzAwL3c1UXE2RHV4d0psN1hwM3g2K2tH?=
 =?utf-8?B?Ty9VbmlKd3ovd3U5S3Y4WEdTczhrWnFZbkpKMVhDUmUwOWlEWHkraTEzS1dC?=
 =?utf-8?B?L3FzNlV2Skw2N1pxMXV0U1BnM251N2lBeGxtS3p6eXI3UUd2QjZiQTJQeXRl?=
 =?utf-8?B?YU01amlsaEkxM0JHMWJnVnJmRVVPT1BPSjhmcWNIdGtJalNhM0xnd2FXQi9m?=
 =?utf-8?B?SE1TblJuaW51Z3gydjU3M3lWd2p3d0xVdnRqZFpiYmZmZGRSZHV1SDNhMlEr?=
 =?utf-8?B?RERIQlFZN1hUdmtiYkZ3a1V6a211NWJhV2psUXY0K1BOZmZMZ3VtdVpFWVVt?=
 =?utf-8?B?SmlDUjBGM0FhTThrRkppc1kyWDlmZXRtYzR5Z29HSXBLek4ybTA5L3ZFQUIr?=
 =?utf-8?B?bVU3ZUkzb2pPWGdqNE1ZR1pxYVp4N1VEcmxmaURtMFZaMmxrUHcyNXN0M2VS?=
 =?utf-8?B?Q2kxTUpVb2NtTFpCWDVMVW1PZ2xINWpSUnRsZnhOdWtSOHgyYVJ6cXRJS09Z?=
 =?utf-8?B?V2RyOWcra0hTRG5uYXJjR0Y1MjBhSHFtUW56dGVHZ1M3OG1hUERHQjJ0eGIv?=
 =?utf-8?B?dHI3TWxIK1Q2OWIvaFZiYk5XVlFSbllVVkRhVHgwdzdYN0xhQzBVUlc3UUQ5?=
 =?utf-8?B?M3daRnE1RS9iWFc5NXpVZEVTYlVyYjVMRnptb2JyNEtZd0ZERUV6empVQWNC?=
 =?utf-8?B?V21teVlDMUFhM2twdGVISGtRcCsvZzhBV2pDd1BBMnV6Q2w1aWtremFMT1hv?=
 =?utf-8?B?Y2c0Z0wrbFRUS1VnY2s3ckhUeVkvTG1YN21uYTBnd2hxMXoyby9rUk1Gd21F?=
 =?utf-8?B?Y2lkTHBZdnBJL3Z3R2lBTE00Z1p5QkIrQ0lSVTRldi9vSnRDN3dOdHV2clFE?=
 =?utf-8?B?aExiK3lVaDRvN2p6d2Nwb0tvR2ZvdGhsd2psTmlzVGsvRThRZWFzM0x5c0JO?=
 =?utf-8?B?WUw2N2RXMHBGeUV6UnhWem1NcmxWZlRMU25UUU95N1ZlS2dCRnEybFFHMExy?=
 =?utf-8?B?a3cvMlBDWis3L2R1SFBRdFpybHB2MXVqMmZHcWlYVllJWWVwanlHS0VlS1R4?=
 =?utf-8?B?ZnpZenhwbFRVTFp0S0tuQW5RZVpYZlA5c3NEb09Henh6c3hDMkpvWHJMbml4?=
 =?utf-8?B?NEZ5RTdibzlvcXJ2NVFYZzF6SERkbTcwVmhyVmltbm5wTnlnbStkblZHNUJ0?=
 =?utf-8?B?WCtjQWRVWFByNmFkSnFYM3dVbUg0NVk4WGQ0L1ZtNE1SZHExenM0Zm9XTDhG?=
 =?utf-8?B?REJ6dWZtODNzNmhQQy94azk2MGtKOVVWQzVuTS9Qamg2T2lLenZhVXUzaERY?=
 =?utf-8?B?bVFncHhLM3lWQm53QnRBeER3L2dKTWQ0V0xTY1I4NzdHWjFJKzk1VHpKYUwx?=
 =?utf-8?B?NHRqenJnMlNIQ1hvbi9pVitKc2dmaTcyVW1ncjRXMDVVRFdVR2RQZ0RKQzlC?=
 =?utf-8?B?RGd6S1RoRGowRWhRSmRiazdTbUVGM3NRZG92WnBmYlRtamV3Z2xOeTdVN0lv?=
 =?utf-8?B?dmRsZSt0WmpaUFJqTGtRMzJDSGRibngrYVlSd3lPTHFVblZ2T2dDTzdEVDFE?=
 =?utf-8?B?d25NZFRpTmZORGFVdW02YldXZ1NqcWQ0LzZJN1oxNUg0UE5hL2pocFZDeUt1?=
 =?utf-8?B?K3JRQlRYcWswSjNpeXVOUm1kYkNDcmI4Q0w2aHhCSnZHSXh5VjdyZXBCUWhS?=
 =?utf-8?B?L0JPeldrZm1tbHBBYnFTL3Q1MFlLbWltSE9jV0NKRnNYWHN5cWlKQUF0b0hi?=
 =?utf-8?B?bXBnaHFYSitZa09TOW96V3drQlMvVEZTdWFuUzRHd1MwcEs5RnpnTVp5ZmZo?=
 =?utf-8?Q?nYgCbP1U/YwZQXKOTrbdLFQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AF7FFB14ABEF9D4294CB85CF50535251@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc92d538-17fe-4ce3-3b64-08db4c60247b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2023 05:26:41.5330 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q2DzbyrSMcOVxq25cElsHvUr+l8X2Sm/kWkZx02tqiou+Mi1YWgSh8fcZOokHmMydQOTDIHHA+m5rFmuBHZEfkGQ4si4N3YDQFyvH9v8Pl9q34eXncgfl9m3e8jf9UB/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6794
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
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "Winkler,
 Tomas" <tomas.winkler@intel.com>, "Usyskin,
 Alexander" <alexander.usyskin@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TEdUTQ0KUmV2aWV3ZWQtYnk6IEFsYW4gUHJldmluIDxhbGFuLnByZXZpbi50ZXJlcy5hbGV4aXNA
aW50ZWwuY29tPg0KDQpPbiBUdWUsIDIwMjMtMDUtMDIgYXQgMDk6MzggLTA3MDAsIENlcmFvbG8g
U3B1cmlvLCBEYW5pZWxlIHdyb3RlOg0KPiBGcm9tOiBBbGV4YW5kZXIgVXN5c2tpbiA8YWxleGFu
ZGVyLnVzeXNraW5AaW50ZWwuY29tPg0KPiANCj4gR1NDIFByb3h5IGNvbXBvbmVudCBpcyB1c2Vk
IGZvciBjb21tdW5pY2F0aW9uIGJldHdlZW4gdGhlDQo+IEludGVsIGdyYXBoaWNzIGRyaXZlciBh
bmQgTUVJIGRyaXZlci4NCj4gDQo+IENjOiBBbGFuIFByZXZpbiA8YWxhbi5wcmV2aW4udGVyZXMu
YWxleGlzQGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIFVzeXNraW4gPGFs
ZXhhbmRlci51c3lza2luQGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogVG9tYXMgV2lua2xl
ciA8dG9tYXMud2lua2xlckBpbnRlbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IERhbmllbGUgQ2Vy
YW9sbyBTcHVyaW8gPGRhbmllbGUuY2VyYW9sb3NwdXJpb0BpbnRlbC5jb20+DQo+IEFja2VkLWJ5
OiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPg0KPiAtLS0N
Cj4gDQo+IHYyOiBJbXByb3ZlIGRvY3VtZW50YXRpb24sIHJlbW92ZSB1bm5lZWRlZCBpbmNsdWRl
cw0KDQo=
