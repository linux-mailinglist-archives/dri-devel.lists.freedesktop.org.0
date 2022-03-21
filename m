Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADB64E24F8
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 12:04:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6190B10E27F;
	Mon, 21 Mar 2022 11:04:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB37610E27F;
 Mon, 21 Mar 2022 11:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647860674; x=1679396674;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=qW2ZhPwvNh1LH59TIMda6llafGuP7F1iifR96BHRIPc=;
 b=F7HYfDXq+Qqbx/GEWTGuH4sSN0gBcVKPP+QCoNMw/3N+C7q5N/kNOxAT
 uCLAbs14fEJg7gZtlQFtc17cMSyAKY7yvV5qRU9+cFqog2R+Oq2r0uROM
 kzO/hvwY4qmY1zWP0/4f/aOGtM7rtSMZfmIGxa5O+eBalsJMfuaZA0f8/
 T1umXKNKD6dR32ZED3UIzUaqLlFOTQ3C53SUXvLZw56BNjjAuwRSOgb4R
 JEiG8Lyinac16WneDm3ccb6xqgHRDBjJIndrW39F9ScKySL0kqcdrQMr2
 hhA6zdE/XwaGisfH2kXtnYHIvH5+Wu0tEFpYq7PrPy6GccTaPoz647+4Q A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10292"; a="255089615"
X-IronPort-AV: E=Sophos;i="5.90,198,1643702400"; d="scan'208";a="255089615"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 04:04:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,198,1643702400"; d="scan'208";a="615599992"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga004.fm.intel.com with ESMTP; 21 Mar 2022 04:04:30 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 21 Mar 2022 04:04:30 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Mon, 21 Mar 2022 04:04:30 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Mon, 21 Mar 2022 04:04:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lwe9E4iEoiXts/qqi3QkNLHTopi5O0io1iMYJTSqSkXtxB2z/rQRseVQD7pBDxQbgVSLUOWEHia20VvwJEape9WOvDolk9fRViJqajZpfUULEiiZ8vhijcvnUsOXU8s9WLE4P9FChlxY4e6cD3GfmBBFpE+eGEK23WbSzk2CnIeFVmopZ0Dw66mwLPPOKKP3hO4pcWpJvMZpY0EfN9Uh+DDMqh4QFgll2kOxB+OO/XQ5wT7tDYfjQCvM/E44b0CmJa/rdoDssiiBXNjz7iT7LAppIv7VEk82+8+WB0Cq3hDTCfbgkb+ITbSf7LTSSKxVHdjWsUgYqN2aqGXtRm22ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qW2ZhPwvNh1LH59TIMda6llafGuP7F1iifR96BHRIPc=;
 b=RnVNNaESOTpPIbhKDbQuY+3u3/ERbWXTpD1TJy13obYdvnrHoEjLxxw3iQ33wVMXF88eINt7fEYAt4lVhkqN0EyUgDI0MnekxRNBfx3JHFZ3mH27LqZQGLilTXZ2U182fXbIyoDrQdT2Os1jjpXJ9W47s6HFPq6rsBKEgSr82+EIKrDVJdnAUuOf5V00PdOEo/lTuY9/3263pfUFn5BFGb/dkhTDoVubsQcpSReqdnFAKJVcnOsEKQWE+IMcm6qfadVFpykdOveSIJ7Om+422sStw/ZTLCNlDemBdnk7fRCslJtDvX9FblcG99lnHNtrhBe5U9Pt+bus7xXT+Hff7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5538.namprd11.prod.outlook.com (2603:10b6:610:d5::23)
 by BN7PR11MB2724.namprd11.prod.outlook.com (2603:10b6:406:b3::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Mon, 21 Mar
 2022 11:04:28 +0000
Received: from CH0PR11MB5538.namprd11.prod.outlook.com
 ([fe80::40ea:ae8:416c:4f7c]) by CH0PR11MB5538.namprd11.prod.outlook.com
 ([fe80::40ea:ae8:416c:4f7c%7]) with mapi id 15.20.5081.022; Mon, 21 Mar 2022
 11:04:27 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Colin Ian King <colin.i.king@gmail.com>, Zhenyu Wang
 <zhenyuw@linux.intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915/reg: Fix spelling mistake "Unsupport" ->
 "Unsupported"
Thread-Topic: [PATCH] drm/i915/reg: Fix spelling mistake "Unsupport" ->
 "Unsupported"
Thread-Index: AQHYOKrAGW6ip9wnk06Ss6al5f0wB6zJtYaA
Date: Mon, 21 Mar 2022 11:04:27 +0000
Message-ID: <c98cccdb-c4a2-3a0d-c6bb-dd69f26d8764@intel.com>
References: <20220315202449.2952845-1-colin.i.king@gmail.com>
In-Reply-To: <20220315202449.2952845-1-colin.i.king@gmail.com>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 081fa39e-408b-4219-c4fc-08da0b2a9126
x-ms-traffictypediagnostic: BN7PR11MB2724:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BN7PR11MB272469D59A255BF576E9259BCA169@BN7PR11MB2724.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2GFho+jP5P6QiBlPVMwR5oSH5e5rDU7WXQXX6i/pbSNAhAOdCZ6HmNrPfTmzODq0iPs6Gc9PTzroDVPFJZglgSibKtfyhrArbuFTL2BUSMed8E1Hy2nasXEdz/RnFVo9PQIxYW/LKmgrfwrVU72aBJB1SovycxdDTwMdMdY5f2ycT2CBgAIohBjfurt/CvWpPzTMBrzxMU4d5+RehQmA7n2m+An/y9/yW0+lChtesF27C1eWRnMXqDEoax7R320KBkj/LhdURY+a5SPKcPm/GhXiLtBhmBFH6cMnL8qaFBDp/moU4PkwmAoXR2GZvGMCwEn3Enul0TRQknUZGCIwewq9391isAq1uvlVIwtcqgn3TGifshVAm6YWK34XH1xjzYLHphar2yLi/NNO5IS2DulHVf0RIniEV05ywmtugjurWJeZEqY7NqCNsuGptSVD22HUGKw8JcogYYFnH9jjhneDcuzeAwY8wq+o5A0YoN7fwBPzuYxC+18SPM1Cr2KcPNDCvHyuZPBwZ03ntWKo3VX2wjFXTiQV3K+eUHtbV0ZEYj/oh2o0w0MZzE8Hmr4Ou5c0+CF6GYLDe6aSibStkZnpG9ou5pyeJyBBMvPELRisScdVJCc+KAYfujaUYfj2rH+kiNbMEt9JoLzxn4HyrMospP4cwG5ldlUosh7vr7NEKafN1sfdynMPu0GBmNriNcnCUGKLTFK5US9F2nqKm2ueACm0eyX0erGlWgL1/XLv0+H597bGhbR6ryhNja1NRcDeZnvATbiiigeMqO9epfcKfIxr6gqm8C0rfakz01k=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5538.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6506007)(186003)(54906003)(26005)(2616005)(110136005)(6512007)(6486002)(36756003)(31686004)(71200400001)(4326008)(8676002)(53546011)(66946007)(66556008)(66476007)(66446008)(64756008)(76116006)(508600001)(91956017)(38070700005)(31696002)(86362001)(5660300002)(4744005)(7416002)(8936002)(316002)(83380400001)(38100700002)(82960400001)(921005)(2906002)(122000001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QnBIZjM5SUZkSVJJQTF4WXBPZGl1anNCODR2VkVXQ0FZZGt5R1dlWmppNlNB?=
 =?utf-8?B?RWZtb2pPMXlnQlIvdjhTUU8yQm82RjUrL2FZeEEwZThZOU15eGg0Mk1PUUtI?=
 =?utf-8?B?WnhreENtQmVqMkhlSE1ZTFVPQmdXTkd0TERReHF5Qk1HT2xjdzJTc0x4b0xk?=
 =?utf-8?B?dGlpaHU4RFlmNW13Z0NaMitIKzc2TCt4VGczVklvZEJPRW1JNFFzN1FOTXMz?=
 =?utf-8?B?R0hZQ25nWm9ua1BQcW9DRnJhMXRGbTk4MjMvRDYvVFpSVFpZMnRSc2hER2xQ?=
 =?utf-8?B?elZFQ0pReEZwdXFQNG90Q1hQcWlXQW9RdlgzbzRkYzVPL0xBaFNCbUxXRm9G?=
 =?utf-8?B?MWFGMmQ2TmxXSGpBNG9ZeTRvbWlVMHhXbFkzT0tjczZMVUZ2WXFqWnpQV3VU?=
 =?utf-8?B?UGZmSlhvWmlWb3NCOGorR3F2WmE2bGIvNjFkWVc0QXZ2UUl2c3VRYUFsU29M?=
 =?utf-8?B?UHFuMDdWRytCOG52SkhhdXZMenk4NWhOcHpnekh0aHQwQUtlYUFHOXRrNTZa?=
 =?utf-8?B?SjZKSWdnR1F1WXJKUE5sVkpMcEdxTUI1WFpJZFBiR1h1Wmh5c0xBSmRodzB6?=
 =?utf-8?B?bEgvQzFTQ2RJaTg3L3kzdzZ2Lzd3bGM5Rm1nblBOTXRPbTRGSmlNT0Fpamhw?=
 =?utf-8?B?OFpDU0VYYmg0NnFVQ2Q5UU9jM3JORXczc0xmZUkyY0g0MktvdHBNdnFjNmRu?=
 =?utf-8?B?V2F0QXRFNFVwZ3Q0NlByS2F3ejBMS05USkh6dzlVMWtzcmNCSE5rYzBDTGE5?=
 =?utf-8?B?UGxMdGdnR204VmRrNUpXOWp2WHRFZnVJdW1ndXNCV3F1L2VKbHVaTHRkNHlo?=
 =?utf-8?B?aUlLTG5NRE9kSkZoMWZWQmFPRm9PcWdEOXBlc25LSTNXRGxIU25uMzhpaFU5?=
 =?utf-8?B?bHBHakszZi9EWnphSGJwUjUwZ0gwZTJHREx4WWsxbUQvMVNPU3hLSGpMdUYz?=
 =?utf-8?B?d3lka1ZTcVI5ZFladHRsMEd1WlpJTjZocXlsako3cXc0Q2lxeXNvQjFNMWpL?=
 =?utf-8?B?T3dwUFF5MFlxQThoazQ1KzRoaWlXbXl3QXZVWDV1dTNTNndhZFhEOENjMUEz?=
 =?utf-8?B?K2V2dTN5RGQxMEVacExRcU5WME9lYmd6bUJWc1o5MmpzV0JTQVk1RFRlTzVQ?=
 =?utf-8?B?Z1czVXpsYTN5L0dNV0ZIWlc3VjBtV0NmUnZxZXRpYUUveGJsZWEzTkpHMkU1?=
 =?utf-8?B?REVpWWcxc3ZlcVhYaEZ5YytNMXphMVVuNlFaUm1NeGpvd3lqNEVKYmFZYTg0?=
 =?utf-8?B?Uk5tSEdPZ3BJbG5rV3R1ZVJqeWN6akxZL3NPRXhWemJpRGR5blpvSUU5aW1u?=
 =?utf-8?B?bk9BZVRMYXlpRGVGS2hYY2M2c2F0dmFVRVFrb3R5c2oxbFY4enZEeGZZVVJV?=
 =?utf-8?B?UUo4SGRzYW5IZFJ2bWUxZEdYNDVGa3Z2eFBoQWpDYmZ5bmcyWk9EUjA1ZUFu?=
 =?utf-8?B?TEJ4cC9QOFA5TjBGbWhPcEdHVTF2ZUFmUExDQUpnMkd3WURYQzBFWHhRdHln?=
 =?utf-8?B?eE4rZGRhUGo3b2ZPKzU5WThuVkVvQVBZU0JOWUQ3aUs1YUdjZnFiOUY5RDZN?=
 =?utf-8?B?djI2aWpvSE1yTERKQld3Q0RwbzlpY3BjWStMWE9Rejdjanl0RUk1cnNZNHY2?=
 =?utf-8?B?NWpHNE9zbnNLRUhNdG9pTDlqZzl0S0pmVWx1S3RkUkd6cEhvZ2VxbXcveUVH?=
 =?utf-8?B?N2RPM0tSTE1UZnpiaDFvTFF3ZTVQcERIQlhtSlFoclR6TlJRcWN4TTI0eWZp?=
 =?utf-8?B?MGYwSGJicU0zbDQzQWtsTzg1RHZraGUyYlhmbG9QR0pKL2RmaDdOeWhpeWhF?=
 =?utf-8?B?alY5dUVTSS82QVg1cXpBTU1tUXVEQmgwNzNOODVBZDRIVXUvb3dUMy80K2Rl?=
 =?utf-8?B?NUJvOThZZVdvWjVjNUlNQUphSzJQV1p5d2NTS25uL1J6RU1pUW81eFpNYlVl?=
 =?utf-8?Q?+xSQo8cmDEEG8Fuacv6RqpFi+eTlLX04?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2A77E7B849E66547B182ABC0C31419F4@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 081fa39e-408b-4219-c4fc-08da0b2a9126
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2022 11:04:27.7490 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4GvKRkOIVWcHqm4Wab11ebCx1YDUQgZxmOTsNZP9kKNV/3PXO/N53yxFJ/HTeXtWDzvEX1gO8A4fqAc4Gt1Z5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2724
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
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhhbmtzIGZvciB0aGUgY29udHJpYnV0aW9uLCBDb2xpbi4gUXVldWVkLg0KDQpPbiAzLzE1LzIy
IDg6MjQgUE0sIENvbGluIElhbiBLaW5nIHdyb3RlOg0KPiBUaGVyZSBpcyBhIHNwZWxsaW5nIG1p
c3Rha2UgaW4gYSBndnRfdmdwdV9lcnIgZXJyb3IgbWVzc2FnZS4gRml4IGl0Lg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmkua2luZ0BnbWFpbC5jb20+DQo+IC0t
LQ0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMgfCAyICstDQo+ICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaGFuZGxlcnMuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2d2dC9oYW5kbGVycy5jDQo+IGluZGV4IDUyMGE3ZTE5NDJmMy4uYTAxZTNhODkzZTI0
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaGFuZGxlcnMuYw0KPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaGFuZGxlcnMuYw0KPiBAQCAtOTE0LDcgKzkx
NCw3IEBAIHN0YXRpYyBpbnQgdXBkYXRlX2ZkaV9yeF9paXJfc3RhdHVzKHN0cnVjdCBpbnRlbF92
Z3B1ICp2Z3B1LA0KPiAgCWVsc2UgaWYgKEZESV9SWF9JTVJfVE9fUElQRShvZmZzZXQpICE9IElO
VkFMSURfSU5ERVgpDQo+ICAJCWluZGV4ID0gRkRJX1JYX0lNUl9UT19QSVBFKG9mZnNldCk7DQo+
ICAJZWxzZSB7DQo+IC0JCWd2dF92Z3B1X2VycigiVW5zdXBwb3J0IHJlZ2lzdGVycyAleFxuIiwg
b2Zmc2V0KTsNCj4gKwkJZ3Z0X3ZncHVfZXJyKCJVbnN1cHBvcnRlZCByZWdpc3RlcnMgJXhcbiIs
IG9mZnNldCk7DQo+ICAJCXJldHVybiAtRUlOVkFMOw0KPiAgCX0NCj4gIA0KPiANClJldmlld2Vk
LWJ5OiBaaGkgV2FuZyA8emhpLmEud2FuZ0BpbnRlbC5jb20+DQo=
