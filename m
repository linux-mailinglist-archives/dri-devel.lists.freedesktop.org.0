Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A2772873D
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 20:31:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4088510E1BA;
	Thu,  8 Jun 2023 18:31:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B7A710E0C8;
 Thu,  8 Jun 2023 18:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686249087; x=1717785087;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=J3RT1SbVp8HMHjha5RGf90JERk51JlyfAK+xUSry4+o=;
 b=UCIkVsnenFDL7RIBnjZQYGzw5rDboHT/j70tJq12bDx1nv6Q9845XVYb
 Ed3OBD6ig/67jegn+WAuFFlS9z9/n7nm9ym9hPKCN+rYM5JXJuU+lGXxX
 KRZiGvS+ITFM1pkrujCnS6ku4cxHyz27SbYr1pRbgoNqAU0Bq/xc+2H9l
 zCK064skeHxjP9c945gjPLjRacTqsbI4ly5X+vr9ct7lv1eojgkiVoiqg
 pS+oJSd+GBvGYMNiRUZQzNzaJbutp3tZ0aNa/vFQr6wUFMXxdfLDda44R
 kyolP0r8tIELK3S6XrCHXKd2MQfRtlW/7bGv+vD9X/7z7oIZfPfcFL2Ib w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="420982238"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; d="scan'208";a="420982238"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 11:31:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="799920246"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; d="scan'208";a="799920246"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Jun 2023 11:31:14 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 8 Jun 2023 11:31:14 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 8 Jun 2023 11:31:13 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 8 Jun 2023 11:31:13 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 8 Jun 2023 11:31:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j4aJ4BOlChD9yIVZkLFe1iKhrqrfRPyOnvB6dLoubel7TuqUaHEGqgQ5tF1MVYjAJO+HlDdo0UzCT1Xs3xEJbouG/gs4xx++quAZsFKzE+cI9NoFUleh1lR85j7SrmYgSwCUwbJlLsuD9u/WA8Uq67JbHUfL+WIyku2Z9pX7pUMt/1oDjlzIDmAICKQh9KwzaF22bfU2GzFLt1B/ymXd7lZeTKdrIr4grxg99OCQxY9cyxdtZTffwRIbHTU5Ie628Qvf/SC4W+rEWZARxQjEUEuJH+Er5qEqabxTBFBfOyOdQerOgps1L14MMn0QWycnzD/gFt5CtmDVQOaMcCzLNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J3RT1SbVp8HMHjha5RGf90JERk51JlyfAK+xUSry4+o=;
 b=gvuqvrRE2FEM9VJOu23F93az4yPmvG1sNpVr+2s/dhOCFwmZMSXPrKqbLL3YRa3nv9+V4sHqxeU3YkCavjprfL6Cki3HKS9gFcst+ms4vPqG1ivO+eVJUgIqdbJFalXxxY/dBnD7wz+nUTyKdBOamd3x3Da5YWGfQZr10tvStHXfH3/J61dNyPT7hyVClBrxgYwH2aOI/LL4XdD2KhUnOz4oQffZvHRWTRrTFztoiEYx2GrYNxJvvjLsGKvV/Tekj/QWI5qCqKzxHSDPkAbL7hKNo/CFYfdbQJwifHTLF1mzf1WJsdgotwVp4SQe106Ku9JXan7z2LxiCPTJu7201w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 PH7PR11MB5796.namprd11.prod.outlook.com (2603:10b6:510:13b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.39; Thu, 8 Jun
 2023 18:31:10 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::749a:b0c8:4930:5a2]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::749a:b0c8:4930:5a2%6]) with mapi id 15.20.6477.016; Thu, 8 Jun 2023
 18:31:12 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [v2] drm/i915/selftest/gsc: Ensure GSC Proxy init completes
 before selftests
Thread-Topic: [v2] drm/i915/selftest/gsc: Ensure GSC Proxy init completes
 before selftests
Thread-Index: AQHZmjULuy4KQy28W068iwHwJCoAdq+BOl+A
Date: Thu, 8 Jun 2023 18:31:12 +0000
Message-ID: <05874bd1572e33ff56cb0d4b93584f9f6377b88a.camel@intel.com>
References: <20230530170104.2192126-1-alan.previn.teres.alexis@intel.com>
 <SN6PR11MB26223D9B57C1103BFD0B32BD8F50A@SN6PR11MB2622.namprd11.prod.outlook.com>
In-Reply-To: <SN6PR11MB26223D9B57C1103BFD0B32BD8F50A@SN6PR11MB2622.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|PH7PR11MB5796:EE_
x-ms-office365-filtering-correlation-id: fcf547af-5ebc-453d-fb46-08db684e89a3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: L3opWonKCbnzvahkDBDcrqCjQVLMCbzzgZo/9bhHXxUrOevdMPUMQWcOL2kEfHcRR2EtFTKZNnhESFbN0zk/n25Pt4eHz6TIkoObeUKaUE9Zu3DF18M6QOBEEOiNQ1SD2VzffWKHvrBN+kpJb04u0LLSE+XHYYJi4qya4kFRMJfW+lrolkPyYwOHSkABOph5BIJDKbVhrxhzCkl0rQx9+r19oj9b/+hoKw1C8SWTRo6GCHxPeVGV7xl1iByqEO7U4wB7QhDCO4HbStM6FI9EzzU+BjvydjG9qw9wxDGW+FCQSUcnrqEPPL48ITbRdn0o3LIb8+SvFEMXuruonxxuoc5vNImhD4JvxnRMSuS0tZYr//z9T3rxmpXzObvnIhrOWGPp/5Yfg4FNBlZIeTzMU4vBNcF+eFsKjGcGBdazdthV48saoRGpjp1xRz511bfy5GZv6CBi0j3zmIBzZf92bRNEx4mUjGbWbAyECFTCgeKWbgv0c7AXDqePk91QuuMRS5y6Ov6k2M9KiA6lOGDnemmyq3YALa/Z5UnRgLJc/xd/JQcZLHdqPGzAiQRLud/y5YRSvbuQF79IlNQ1Ruqs8NP311cQSYUzYj6ORKq3BdCmfDWv56WEtI1GBAO1/ppk
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(39860400002)(396003)(346002)(366004)(451199021)(66946007)(66556008)(66476007)(66446008)(64756008)(76116006)(478600001)(110136005)(91956017)(8676002)(36756003)(8936002)(5660300002)(450100002)(71200400001)(4326008)(316002)(41300700001)(6486002)(38100700002)(82960400001)(122000001)(6512007)(186003)(38070700005)(26005)(6506007)(83380400001)(2616005)(86362001)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b0tiTTZvU3BmSlhlbWxPM2pLcjczekVINjZWZVZydDJvSUxSbUpIcUh4Zkh1?=
 =?utf-8?B?MG9GZ3pSRVR1UEZmZnVoNmpNVmE3RVgxWlRQNFEvNUg3SGtoOTRLVkNuRFZW?=
 =?utf-8?B?eU5XNklCY0JWNk5jN04zUDc0VHc1UE1GQi9LalN5STJYVDQrRFVudGdmZWps?=
 =?utf-8?B?ZjVNRENZYmJhSEVTd1luWHQ3SkpWc2pxUmFvQm9RUlZGbTVhZUxWR1RPN3VV?=
 =?utf-8?B?aUFjeFlJN1lPQnVvTXVram9PdnhXZTdLdThVMFA3blVQYkthOVNyd3A2Yjdp?=
 =?utf-8?B?ZE5NdGZra1EybTVDam1RVzZJODZIVEduOGV6ZytsZkw2S1lOSmRQUTFWRWUy?=
 =?utf-8?B?b3hrQ3NQNkRIbFNOMzkrY2R6T0FHRVBINEVaYjIxZ1haUnlZY3kvRXhiUVcv?=
 =?utf-8?B?SU1YcVIzNitMWWE1UjZvbWxDTUkrdWh3LzRURk9xeS9mN3B3eTh2bnhxVHRQ?=
 =?utf-8?B?RENOcEJJdVpmRlUrR1BjNmtDTS8zQlFrcG9tM3cxSHE0R2pBL1I4b2dSYkt3?=
 =?utf-8?B?aVFOazhvWlU2aGdxaHdBaXZRUisrdy9PY2RaMi8veWJjaEdPdmJWRHk2a0R6?=
 =?utf-8?B?ZjVhSHgvMnNrQXR6K08rby9XcVNRVXFRWEs0TUpzSjZzcFZnTGtaTzRYVnRM?=
 =?utf-8?B?ZUtoYktLdmRNQ25RVkFmSGkzYkcrMDg1NU9WUVFudjkrV3pjTmdYMFY2Mjhu?=
 =?utf-8?B?ajZRSlg4d0MranJnYmFHcFQ1TitDWG51OFpkSHNtUWZwcWpZWjJOTUN2NUk2?=
 =?utf-8?B?MDlvV1MyRGg2SHpxYTRjZXJNR0ZCekpCakNTS3pOeUw0bXBUS2FuMlEzK3RK?=
 =?utf-8?B?S0huTHFyZ1lIVFVCcDdTbVhvOVFhekNINCsvNHRTempLVDNsSUJhUU1wdVgv?=
 =?utf-8?B?MDZxZjlSSU9KZVFQNFByNVdrRzA1TDBDNXlPRThHd2pLVTNjSWs1Q0hmT0ww?=
 =?utf-8?B?N01VdkpYVGtSckZkcGZJZS96MGsyRnJucTNocDFqMExZY2F3aGd5Si9RNzdV?=
 =?utf-8?B?THJGK2dtN295dTdHYUY1bm0yajNWMzhKU1JTNHNWbGxUajV4N0ZHUk1DMFI3?=
 =?utf-8?B?L3R5T05VaUZLTWkvdUZTaGd4c0pES0ZhTDRtRUIwNWVwc3ZQZ0JMQ0FlRjdO?=
 =?utf-8?B?NEx6aDMvRHJ3b0d3Z0IxU2plaVpnK2c1WE12ZHhSNTFrUnRvZkJQcWNjaVdi?=
 =?utf-8?B?THJ1WmtEeFdzQUZHaE5GZWg4WllZUmZjZCtBWWlUMHB4RUFYeitDeVVyaEJX?=
 =?utf-8?B?aGRQTzJmMy9mRGMyWVhuUGc3UXZCaFJlS05PbzBVcFcxZnV6Nm9YZjc4enhU?=
 =?utf-8?B?WWVpTVBIS1pZcGdQai9ZdUlTTldzVXdIZEZoVTNlQWdMOWFzblQwaWtCdS9K?=
 =?utf-8?B?S21XbnJNeWRxVm5iUnVlWnNMaDNNQzZGOFpzTklwVFgvNUV6Z0JLQVdWcTg3?=
 =?utf-8?B?ZXlvMzN6MzM3UGZid0tmZ0V5TUhLc3JCcFBDeWNWU2YrL3hVcnpSSFB2SCt3?=
 =?utf-8?B?WEJMN0dPSjZSSmZGdXYvOG9ISUZ4QzlqeStmS1ptWjlhQlQvZjh1ZjFVU1dV?=
 =?utf-8?B?T28wZFVOZyt5TE5pL2V1MUtRZjZ3WXhTZzZFQ2hkTFpuMHdVSVZZVStCN1NJ?=
 =?utf-8?B?bUUxbkFVSDdTa3Zya25ndlo4VnNJeGF2bENiOW5HdE4zc2pSekdQblFPZ3hh?=
 =?utf-8?B?K1NFRmt6b2NQU3p2UVV3anJmWXBHUU5UTG13YkNwVmVvR2w0YkY2ZnZRelpn?=
 =?utf-8?B?a3ZYeGREb25uMzZlQ1pxTkNxeXIwY29BeTk5cjkvVHZsSERJQXRXeGpQYjlx?=
 =?utf-8?B?M3BOK0R3WkpFa24xS3l3TWJxd3VtSUh4amNwTzBPM3BpNjhORGM0UGR3dExB?=
 =?utf-8?B?M21Kc25Ud28xbmNEY0ljcWVDOWdYTWdjQk1uRGJTb3psRkJhQzNuMDVGMy9w?=
 =?utf-8?B?QlVHUTBPaHphWiswd0IzNDJFWWdDUWRaQkdDbUs5N3E2dzI1SGxuTkhpenpv?=
 =?utf-8?B?K2N3UXZFbWhSWGVOQ1hvRnBxTnVwK3NVcHQwbTNYWnkvdmZJWG5TaTJhb2dC?=
 =?utf-8?B?elNnY1FxVUlIWks5OE5tZndxcXhQV042N2pMODFNMSszbytLNzN1N01uSVl5?=
 =?utf-8?B?azZnYnRUUzUvWDM1K0I4dWU5bmJ0RDZsVkdJNW42d0VxRTh4SUZicUlEY0Jr?=
 =?utf-8?Q?FDonhw57z/1Tl5rutEEwJvI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E2CCC3EB8D478A42AE4FEADEFBFA4D5F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcf547af-5ebc-453d-fb46-08db684e89a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2023 18:31:12.8537 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r6TNCcJKNlEm1JDKPQ5Fjz6QANhY2wD9L58np349W4wceQIwMiqwUc1RGsUSzlvT7/xS3Pz8M5vVIknk4SUCKaQwIr8+yzrdejK8bmD1x1BkbSqtb4ztLIMS83BdYUEJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5796
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

T24gVGh1LCAyMDIzLTA2LTA4IGF0IDE4OjE0ICswMDAwLCBEb25nLCBaaGFuanVuIHdyb3RlOg0K
PiBTZWUgbXkgY29tbWVudHMgYmVsb3cuDQo+IA0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQo+ID4gRnJvbTogQWxhbiBQcmV2aW4gPGFsYW4ucHJldmluLnRlcmVzLmFsZXhpc0BpbnRl
bC5jb20+DQphbGFuOnNuaXANCg0KPiA+ICtzdGF0aWMgaW50DQo+ID4gK19fd2FpdF9nc2NfcHJv
eHlfY29tcGxldGVkKHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICppOTE1LA0KPiA+ICsJCQkgICB1
bnNpZ25lZCBsb25nIHRpbWVvdXRfbXMpDQo+ID4gK3sNCj4gPiArCWJvb2wgbmVlZF90b193YWl0
ID0gKElTX0VOQUJMRUQoQ09ORklHX0lOVEVMX01FSV9HU0NfUFJPWFkpDQo+ID4gJiYNCj4gPiAr
CQkJICAgICBpOTE1LT5tZWRpYV9ndCAmJg0KPiA+ICsJCQkgICAgIEhBU19FTkdJTkUoaTkxNS0+
bWVkaWFfZ3QsIEdTQzApICYmDQo+ID4gKwkJCSAgICAgaW50ZWxfdWNfZndfaXNfbG9hZGFibGUo
Jmk5MTUtPm1lZGlhX2d0LQ0KPiA+ID4gdWMuZ3NjLmZ3KSk7DQo+ID4gKw0KPiA+ICsJLyoNCj4g
PiArCSAqIEZvciBnc2MgcHJveHkgY29tcG9uZW50IGxvYWRpbmcgKyBpbml0LCB3ZSBuZWVkIGEg
bXVjaCBsb25nZXINCj4gPiB0aW1lb3V0DQo+ID4gKwkgKiB0aGFuIHdoYXQgQ0kgc2VsZnRlc3Qg
aW5mcmFzdHJ1Y3V0cmUgY3VycmVudGx5IHVzZXMuIFRoaXMgbG9uZ2VyIHdhaXQNCj4gPiArCSAq
IHBlcmlvZCBkZXBlbmRzIG9uIHRoZSBrZXJuZWwgY29uZmlnIGFuZCBjb21wb25lbnQgZHJpdmVy
IGxvYWQNCj4gPiBvcmRlcmluZw0KPiA+ICsJICovDQo+ID4gKwlpZiAodGltZW91dF9tcyA8IDgw
MDApDQo+ID4gKwkJdGltZW91dF9tcyA9IDgwMDA7DQo+IA0KPiANCj4gTGd0bSwganVzdCBhbiBj
b25jZXJuIGFib3V0IHRoZSBmaXhlZCBudW1iZXIgaGVyZSwgc2hhbGwgd2Ugc2V0IHRoZSBtaW5p
bWFsIGhlcmUsIG9yIGxldCBpOTE1X3NlbGZ0ZXN0LnRpbWVvdXRfbXMgdGFrZSBjb250cm9sPyBU
aHVzIG5vIGxvbmdlciBuZWVkIGNvZGluZyBjaGFuZ2UgaGVyZSBpbiB0aGUgZnV0dXJlLg0KPiAN
Cj4gUmV2aWV3ZWQtYnk6IFpoYW5qdW4gRG9uZyA8emhhbmp1bi5kb25nQGludGVsLmNvbT4NCg0K
VGhhbmtzIFpoYW5qdW4sIHVuZm9ydHVuYXRlbHksIGJhc2VkIG9uIGludGVybmFsIHRlc3Rpbmcs
IGk5MTVfc2VsZnRlc3QudGltZW91dF9tcyBkZWZhdWx0IGlzIHRvbw0KbG93IHRoYXQgaXQgZG9l
cyBvY2Nhc2lvbmFsbHkgdGltZW91dCBmb3IgQ0kuIEZyb20gZXhwZXJpZW5jZSwgd2l0aCBhIGxl
YW4gdWJ1bnR1IGNvbmZpZywgaXQgdHlwaWNhbGx5DQp0YWtlcyBhYm91dCB+MSBzZWNvbmRzIGZv
ciB0aGUgbWVpLWdzYy1zdy1wcm94eSBjb21wb25lbnQgZHJpdmVyIHRvIGxvYWQgYWZ0ZXIgaTkx
NSBsb2Fkcy4NClNpbmNlIENJIHJlZ3VsYXIgdW5sb2FkcyBhbmQgcmVsb2FkcyBpOTE1LCB0aGUg
dGltZW91dCBvYnNlcnZlZCBlbmRzIHVwIGJlaW5nIHJlcG9ydGVkIGFzIGlzc3VlLg0KDQo4IHNl
Y29uZHMgd2FzIGJhc2VkIG9uIGludGVybmFsIHRlc3Rpbmcgb2YgdGhlIHdvcnN0IGNhc2Ugc2Nl
bmFyaW8gLSB3aGljaCBoYXJkbHkgZXZlciBoYXBwZW5zLg0KV2UndmUgb25seSBzZWVuIHRoZSA4
IHNlY29uZCBoYXBwZW4gd2hlbiB0aGUga2VybmVsIGNvbmZpZyBoYXMgY29uZmlncyBlbmFibGVk
IGZvciB2ZXJ5IG1hbnkgU09DIElQDQpkcml2ZXJzIGFuZCBjb21wb25lbnQgZHJpdmVyIChzZWVu
IG9uZSBhdCBsZWFzdCBvbmUgY3VzdG9tZXIgY29uZmlnKSBvciBpZiB0aGUgTVRMIGJvYXJkIElG
V0kgd2FzIG9ubHkNCmp1c3QgcmVmbGFzaGVkICh0aGlzIHdvdWxkIGJlIGEgb25lLW9mZiA4IHNl
Y29uZHMsIHdlIHN1c3BlY3QgZHVlIHRvIHRoZSBmaXJtd2FyZSBkb2luZyBhZGRpdGlvbmFsIHN0
ZXBzKQ0KDQoNCg==
