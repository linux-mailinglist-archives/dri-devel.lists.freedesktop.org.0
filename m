Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 849FE73D8BB
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 09:45:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5E0610E05C;
	Mon, 26 Jun 2023 07:45:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 478E310E05C
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 07:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687765547; x=1719301547;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XlKjpJnliwWWhzja5n/t2CaR5M+VXp4q2GwvnIzFCYU=;
 b=aNgop4O69Ho8sD1TA3BVo4XNPdwBjy9dyYcSw8yoRorNAzFqxpEB2H/L
 RjHTW794+ieq5Go3yHxloEjwwEDvkHRpDuu2nlSbfERuhbIRk1cEvkH09
 hAi/yoU/ujrvtDPb+y1IGQ6LzgsTP1VYoKqKOC1Ul9NNrxnZ+XFAvV6P7
 +Bd0qNM9XnXue1mna/TYlZiO6sQnnubcfL/kS3hsH7s48E3CdbJCntD8c
 pCWuIY+/HGclTFs43rXRxdGwLBus5TPlRo+cP3nR/16qfLPh3AHBJAA2+
 6XEHUjM26QJDL7wvAzL/S0ZDDdvJQZmvuv6XYe8UservBxQ97x2oN8Lw/ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="364652676"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="364652676"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 00:45:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="890198157"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="890198157"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 26 Jun 2023 00:45:44 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 26 Jun 2023 00:45:44 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 26 Jun 2023 00:45:43 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 26 Jun 2023 00:45:43 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 26 Jun 2023 00:45:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K6rsjaKRCbp3hFnNtS3/Da/VDlmKwgjFFQG+qUoLatLmBKOjBkWjeQM5ZCBr/eoaYhh040Qkdbs+8VxnYhLIyy4gdQVDaHVVoQaNaVfNRWboj5Sk8Nq/d4H47D5p9yoO5Ia+NfK6R1NAWU/+e7L8vsBMNtcaFRdYl+nCH79b/ZCgCahP8e1zpSykWEzE+CxJapDbmQj3qM3x5akGDcHuoo+Zl7R2+jq/0/FMhUc+Fynpgcs1MlydROZd2Bm+wqTcebn6P+mU5n3zFVTZtz6bEeYvOD9LxT+CgVxQ71TCmRuWqhvq09CpA0oQ4//2rmKTO2/6oHTHM+H4RROK8b8BDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XlKjpJnliwWWhzja5n/t2CaR5M+VXp4q2GwvnIzFCYU=;
 b=N8Rw3WNbplCJUihaKaN2g6nTWTYVFL4xWPOkCRl9QzbB3W09u88W3u15czxOChVFcJnpvbfuoB9WgjwqNxLrXY1cIMmHchrTYjjJN94hdfnSK56EhOwfSJWZtbGISUM0Ps4UstgwHEnAAUzWvCHq1fYvSr7D9xzBISVjoC2VCC/r8fPP1V8FQQ2qWUxgHXGErtMZM9hFtKG0JNZ2Ny283E/fe1TGOG6mg/D+I8Re+7+IGKNvGTFfP0PFRzGVcuUW/Y9qA/YtwxaCqtImPJcKjfGxQWJGo1WvfFFZc0D7fDdaejXraxNRg2VKcaAdpSpm6HMlm+NtX7F+y0e8DR7HBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by CO1PR11MB5011.namprd11.prod.outlook.com (2603:10b6:303:6d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Mon, 26 Jun
 2023 07:45:38 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::f53b:825:ff13:190a]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::f53b:825:ff13:190a%5]) with mapi id 15.20.6521.024; Mon, 26 Jun 2023
 07:45:37 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Peter Xu <peterx@redhat.com>
Subject: RE: [PATCH v1 0/2] udmabuf: Add back support for mapping hugetlb pages
Thread-Topic: [PATCH v1 0/2] udmabuf: Add back support for mapping hugetlb
 pages
Thread-Index: AQHZpN59yPT6xb778USyK3pSaYthDa+WfGmAgAD+79CAARxvgIACdYfQ
Date: Mon, 26 Jun 2023 07:45:37 +0000
Message-ID: <IA0PR11MB718571BA49F71282368D8649F826A@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20230622072710.3707315-1-vivek.kasireddy@intel.com>
 <6e429fbc-e0e6-53c0-c545-2e2cbbe757de@redhat.com>
 <IA0PR11MB718510999F2C0E2B70914E2AF823A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZJXJ4ULRKVN5JPyv@x1n>
In-Reply-To: <ZJXJ4ULRKVN5JPyv@x1n>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|CO1PR11MB5011:EE_
x-ms-office365-filtering-correlation-id: 7336280e-7406-4958-bc62-08db76195539
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4h20vhJpXm0dlT1tXT/A2xivsduf/6wghPRzSctXlgn/DNsKETrzMHLZaXT7seKfIc4K/VEgtCoTjjqeGCmEzGY6WSxOTWqD//krt3TSmifju+T5vcE5FiD/M+olG4zG61AYlSRBmsP5P8v2Gls2ndAiVk+Er45s4pFwbIelEx96neHr0lAyNwRR0Ob5HpdIWA3HhsrolhPQc0k+VdicCfG+e136nQkFWThlaEYQorLj81/rlg2ASHLnB4Z6024/AGCO0kmvlWUkoKpMAk1HtWXOQHPjFxJNW3IOyryoQ1Qn29HfvgzokRz1APiR8C2ef+jgJlsNzt0yR0aaJJS7YNwKNVSDrBErSmfDeONDCVgo103Q1VwojzBlSKjG4SKXblDkgRkKMYHaM1kSGW2CECD1sKVGv1Vw0AoCHaFVQl4eubLmwrB1aWB+x1vyYyu5r1nMFFRr3Bz5VAXpz8QlKRgvEPetmQrG7kPt8buw1zPrAQAPKPuNQlsibcLNL8OEQ/KUy+xiM451np3DSCFLPoLBeRiLDQgoLdNw7CPA50AdRWflJLf743KQhIuFFUqJAP52lYL7wCK4zT44J6DpxkHdgoVqB9E/kbsh7gv0a9mAFgQcwoI0vlSWXUMd5ADzs4taXY67jDV1QP0o27PbxA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(136003)(346002)(39860400002)(366004)(396003)(451199021)(966005)(71200400001)(478600001)(54906003)(7696005)(83380400001)(6506007)(186003)(26005)(9686003)(2906002)(5660300002)(52536014)(7416002)(33656002)(41300700001)(38100700002)(122000001)(82960400001)(66946007)(55016003)(8936002)(8676002)(66446008)(316002)(86362001)(66476007)(6916009)(4326008)(66556008)(76116006)(38070700005)(64756008)(66899021);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cUtuaEZDSVRENVBGcnUrclROdGJwd2UrODB3SnNsTXJiakJCRTRPTFArVGFr?=
 =?utf-8?B?bHk2N1RYSlNCUmVubFYwWTV1ZU9FVDIvRndSYTJUVndaalZaSWpZTHdlOUhP?=
 =?utf-8?B?M1ZBUGo4eThNWmZVZjhPUnVvZHFKRlNIVlEyWEdrMDlVRStrQ003V1pPS2lH?=
 =?utf-8?B?MDF4ME9uUTdlazlrbXdnc054RjNWVDgrZzFQMWFua1hveDV3NDdVRnM5Qlp0?=
 =?utf-8?B?THdkRjBrM0FQZ3NSYlNDSDNmRlhyd09tajE0OGh6c0laSEs0TnRRR1ZFTkFK?=
 =?utf-8?B?S3pvYW1nT2lPdzBzWGt4SGZkRUFneFZtNUx3Y2o0YVo2NnVxVjNQblVtV2hi?=
 =?utf-8?B?Q21iYWNoOG5tdGFFbzVJYjhabHpVazdibnA4R3RZbzI5YjdYV2ZLYWZhMG9H?=
 =?utf-8?B?dlBzNkhZQ1NFV0RaMms5eFBhTExrdERTODdPdE50UUZsRG94QlJ4NjJKN2tV?=
 =?utf-8?B?cnltZmI3WTZjR0lqdWRQdlhlVVdvTmFBR1MwMU53TklITno3ZzVNeU9VdHJk?=
 =?utf-8?B?eWR5cDZCWVlTR2lWQVNWTUkxOWxYd3NxdEJPZWpVb25DemFtZ05VT0FwU1ZP?=
 =?utf-8?B?ZWpUYlRmeDFBd3A0S3NiUC95N3RnU3o3QjZuYllOeGRFNk84NnJkdXVaVEhz?=
 =?utf-8?B?Wk5rSEkrR3RocmV2clR3UGsydmpkbDg4dEpYTmJ6c21za0dZbWxScXFPQjVw?=
 =?utf-8?B?MU1pWUNLY1MwTmw5QzlXWUFFamNXTmdBYTQ5RGVEYkZxSWlXdzdsWDFkK0lI?=
 =?utf-8?B?YVJPZHlDSmRicjd5RDBhay8xL3g5VHd6OTVjaG11SkhjRzNEQ0taamw0ajVk?=
 =?utf-8?B?dWFIbU1XTEhESWJUQjJZVGJQZnhxUFFOcEcwSzh4czFMT0xqMGdJenhyVzBE?=
 =?utf-8?B?akpQSCttU0VMcEdpWnMvbW5mWkg2emFzSnU5Q2M4ZVpUNm9ZWXFrYUNRTktT?=
 =?utf-8?B?bm1DYmNFYnZkWWc3SERDcjNlaEtYZVV4dVczM3hoTEczMnNGSzhQc3pJNThU?=
 =?utf-8?B?aFBId0VBaWlIeWNyZFNvV1E4Zklwdy9hZzdsR1VLakNGNHBEbWNOcEp3b29J?=
 =?utf-8?B?VzUrUzFrc2FIWVcrb2JkK29pd0FKRzYvb0ZXNkNTYmlSU3lhczNsdC9rOUxi?=
 =?utf-8?B?VVZsRzFLYkp4UjhjcmhkRlhub09PQ0NYOXRDcmd6OUcvYms4S3l1VmRpQ3Iv?=
 =?utf-8?B?b1dQczIyL0MwMzB1WmRyd1NVVU9iNnNWckRIQUg4TkhJQ2RaTXk2dTVoTkRT?=
 =?utf-8?B?VzZQR0VkVEtzaUgvR2Z6aktJTUZJanhNTCthd0ZTdlNIUUNRUzIyQ01ZNytE?=
 =?utf-8?B?bkxhajNuUUt5OTArWXo1NndTVlZ3S3I2ZVk1dGNsSEZzOVozWE5vV3N0WG5Y?=
 =?utf-8?B?VGpsUEltZW5tSlNtR0dac3l2dUxFLzVxQm9YNGNTMU9ZTFVaZnNaRTBJdnNS?=
 =?utf-8?B?TDAyNzh2TGJuNlpoQkY3MjQzcnpQWmEzNFFQdzY0THVPdjN0UkRjL1JtSzhF?=
 =?utf-8?B?TGFEbDZoZG00TTR3QjZWSUhYcTRaVS9PTk1ncEJBNGRORUk3Z1JLMjVveTYy?=
 =?utf-8?B?VkpPekFrUkpKN0RvSVAyNFUvNzNRcjJpWklBRGlHVElVT0FRTXdNdXB0WmxE?=
 =?utf-8?B?TVdZYjRyanhKVk9SekdPRTZjUXRJeE5IejF4NTVSaEdwMkR4MVJPckNIMnVt?=
 =?utf-8?B?WlVJaG1ULzhSQnRsV29uanduMEl4TERrWEFaZEZ1VFRsWFdway9UYmhMMjd2?=
 =?utf-8?B?YlM3eUIvVFZvcWpzcFJmR05DK2xWUkx0V2JkN29HdWp2QWo3SFExbzJKL2Vv?=
 =?utf-8?B?ckdoWW9DdmY5MDhjMFc4bnNIZ3lqenoxTmpWZjhjWG5lNkJCd3VORUwwWHNM?=
 =?utf-8?B?RVFTZ0VsM2FYdTFmdEJQc2oveU1LRTJkemJwY0x2ZXZTazVWeDhlMkxndllH?=
 =?utf-8?B?dEFNN1R5WmNXSEgrSU5pK0s0b3QyV0dkT0VDR2cyWEFCem83aVRCVERNTzBp?=
 =?utf-8?B?aUpENDhyTkZPeTZBTDlmYWFuYW42S1d2UlBtU0pmOTBGYVVHeUliL1pHQ1Rw?=
 =?utf-8?B?b01yVThmMUV5cmF1VzQ0UHkwNk90cER0RHRzOVN5eXFFZExncXB5ekRtaXFX?=
 =?utf-8?Q?+3s47exYZQgIkzPeZXgOXi6ht?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7336280e-7406-4958-bc62-08db76195539
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2023 07:45:37.8996 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cyP9pM/lazZ6NjSFO7weITiOICTiuEkbs/cKVvZp9Kjo2SHsnq+TPUQka/PFK/RF/Bp7k9G1sMSi718PL2J3wSSd561VZVxKAIRq7hWdhQ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5011
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
Cc: James Houghton <jthoughton@google.com>, Jerome
 Marchand <jmarchan@redhat.com>, "Kim, Dongwon" <dongwon.kim@intel.com>,
 David Hildenbrand <david@redhat.com>, "Chang,
 Junxiao" <junxiao.chang@intel.com>, Muchun Song <muchun.song@linux.dev>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "Hocko, Michal" <mhocko@suse.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUGV0ZXIsDQoNCj4gDQo+IE9uIEZyaSwgSnVuIDIzLCAyMDIzIGF0IDA2OjEzOjAyQU0gKzAw
MDAsIEthc2lyZWRkeSwgVml2ZWsgd3JvdGU6DQo+ID4gSGkgRGF2aWQsDQo+ID4NCj4gPiA+ID4g
VGhlIGZpcnN0IHBhdGNoIGVuc3VyZXMgdGhhdCB0aGUgbWFwcGluZ3MgbmVlZGVkIGZvciBoYW5k
bGluZyBtbWFwDQo+ID4gPiA+IG9wZXJhdGlvbiB3b3VsZCBiZSBtYW5hZ2VkIGJ5IHVzaW5nIHRo
ZSBwZm4gaW5zdGVhZCBvZiBzdHJ1Y3QgcGFnZS4NCj4gPiA+ID4gVGhlIHNlY29uZCBwYXRjaCBy
ZXN0b3JlcyBzdXBwb3J0IGZvciBtYXBwaW5nIGh1Z2V0bGIgcGFnZXMgd2hlcmUNCj4gPiA+ID4g
c3VicGFnZXMgb2YgYSBodWdlcGFnZSBhcmUgbm90IGRpcmVjdGx5IHVzZWQgYW55bW9yZSAobWFp
biByZWFzb24NCj4gPiA+ID4gZm9yIHJldmVydCkgYW5kIGluc3RlYWQgdGhlIGh1Z2V0bGIgcGFn
ZXMgYW5kIHRoZSByZWxldmFudCBvZmZzZXRzDQo+ID4gPiA+IGFyZSB1c2VkIHRvIHBvcHVsYXRl
IHRoZSBzY2F0dGVybGlzdCBmb3IgZG1hLWJ1ZiBleHBvcnQgYW5kIGZvcg0KPiA+ID4gPiBtbWFw
IG9wZXJhdGlvbi4NCj4gPiA+ID4NCj4gPiA+ID4gVGVzdGNhc2U6IGRlZmF1bHRfaHVnZXBhZ2Vz
ej0yTSBodWdlcGFnZXN6PTJNIGh1Z2VwYWdlcz0yNTAwDQo+ID4gPiBvcHRpb25zDQo+ID4gPiA+
IHdlcmUgcGFzc2VkIHRvIHRoZSBIb3N0IGtlcm5lbCBhbmQgUWVtdSB3YXMgbGF1bmNoZWQgd2l0
aCB0aGVzZQ0KPiA+ID4gPiByZWxldmFudCBvcHRpb25zOiBxZW11LXN5c3RlbS14ODZfNjQgLW0g
NDA5Nm0uLi4uDQo+ID4gPiA+IC1kZXZpY2UgdmlydGlvLWdwdS1wY2ksbWF4X291dHB1dHM9MSxi
bG9iPXRydWUseHJlcz0xOTIwLHlyZXM9MTA4MA0KPiA+ID4gPiAtZGlzcGxheSBndGssZ2w9b24N
Cj4gPiA+ID4gLW9iamVjdCBtZW1vcnktYmFja2VuZC1tZW1mZCxodWdldGxiPW9uLGlkPW1lbTEs
c2l6ZT00MDk2TQ0KPiA+ID4gPiAtbWFjaGluZSBtZW1vcnktYmFja2VuZD1tZW0xDQo+ID4gPiA+
DQo+ID4gPiA+IFJlcGxhY2luZyAtZGlzcGxheSBndGssZ2w9b24gd2l0aCAtZGlzcGxheSBndGss
Z2w9b2ZmIGFib3ZlIHdvdWxkDQo+ID4gPiA+IGV4ZXJjaXNlIHRoZSBtbWFwIGhhbmRsZXIuDQo+
ID4gPiA+DQo+ID4gPg0KPiA+ID4gV2hpbGUgSSB0aGluayB0aGUgVk1fUEZOTUFQIGFwcHJvYWNo
IGlzIG11Y2ggYmV0dGVyIGFuZCBzaG91bGQgZml4DQo+IHRoYXQNCj4gPiA+IGlzc3VlIGF0IGhh
bmQsIEkgdGhvdWdodCBtb3JlIGFib3V0IG1pc3NpbmcgbWVtbG9jayBzdXBwb3J0IGFuZA0KPiBy
ZWFsaXplZA0KPiA+ID4gdGhhdCB3ZSBtaWdodCBoYXZlIHRvIGZpeCBzb21ldGhpbmcgZWxzZS4g
U08gSSdtIGdvaW5nIHRvIHJhaXNlIHRoZQ0KPiA+ID4gaXNzdWUgaGVyZS4NCj4gPiA+DQo+ID4g
PiBJIHRoaW5rIHVkbWFidWYgY2hvc2UgdGhlIHdyb25nIGludGVyZmFjZSB0byBkbyB3aGF0IGl0
J3MgZG9pbmcsIHRoYXQNCj4gPiA+IG1ha2VzIGl0IGhhcmRlciB0byBmaXggaXQgZXZlbnR1YWxs
eS4NCj4gPiA+DQo+ID4gPiBJbnN0ZWFkIG9mIGFjY2VwdGluZyBhIHJhbmdlIGluIGEgbWVtZmQs
IGl0IHNob3VsZCBqdXN0IGhhdmUgYWNjZXB0ZWQgYQ0KPiA+ID4gdXNlciBzcGFjZSBhZGRyZXNz
IHJhbmdlIGFuZCB0aGVuIHVzZWQNCj4gPiA+IHBpbl91c2VyX3BhZ2VzKEZPTExfV1JJVEV8Rk9M
TF9MT05HVEVSTSkgdG8gbG9uZ3Rlcm0tcGluIHRoZQ0KPiBwYWdlcw0KPiA+ID4gIm9mZmljaWFs
bHkiLg0KPiA+IFVkbWFidWYgaW5kZWVkIHN0YXJ0ZWQgb2ZmIGJ5IHVzaW5nIHVzZXIgc3BhY2Ug
YWRkcmVzcyByYW5nZSBhbmQgR1VQDQo+IGJ1dA0KPiA+IHRoZSBkbWEtYnVmIHN1YnN5c3RlbSBt
YWludGFpbmVyIGhhZCBjb25jZXJucyB3aXRoIHRoYXQgYXBwcm9hY2ggaW4gdjIuDQo+ID4gSXQg
YWxzbyBoYWQgc3VwcG9ydCBmb3IgbWxvY2sgaW4gdGhhdCB2ZXJzaW9uLiBIZXJlIGlzIHYyIGFu
ZCB0aGUgcmVsZXZhbnQNCj4gPiBjb252ZXJzYXRpb246DQo+ID4gaHR0cHM6Ly9wYXRjaHdvcmsu
ZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzIxMDk5Mi8/c2VyaWVzPTM5ODc5JnJldj0yDQo+ID4NCj4g
PiA+DQo+ID4gPiBTbyB3aGF0J3MgdGhlIGlzc3VlPyBVZG1hIGVmZmVjdGl2ZWx5IHBpbnMgcGFn
ZXMgbG9uZ3Rlcm0gKCJwb3NzaWJseQ0KPiA+ID4gZm9yZXZlciIpIHNpbXBseSBieSBncmFiYmlu
ZyBhIHJlZmVyZW5jZSBvbiB0aGVtLiBUaGVzZSBwYWdlcyBtaWdodA0KPiA+ID4gZWFzaWx5IHJl
c2lkZSBpbiBaT05FX01PVkFCTEUgb3IgaW4gTUlHUkFURV9DTUEgcGFnZWJsb2Nrcy4NCj4gPiA+
DQo+ID4gPiBTbyB3aGF0IHVkbWFidWYgZG9lcyBpcyBicmVhayBtZW1vcnkgaG90dW5wbHVnIGFu
ZCBDTUEsIGJlY2F1c2UgaXQNCj4gPiA+IHR1cm5zDQo+ID4gPiBwYWdlcyB0aGF0IGhhdmUgdG8g
cmVtYWluIG1vdmFibGUgdW5tb3ZhYmxlLg0KPiA+ID4NCj4gPiA+IEluIHRoZSBwaW5fdXNlcl9w
YWdlcyhGT0xMX0xPTkdURVJNKSBjYXNlIHdlIG1ha2Ugc3VyZSB0byBtaWdyYXRlDQo+ID4gPiB0
aGVzZQ0KPiA+ID4gcGFnZXMuIFNlZSBtbS9ndXAuYzpjaGVja19hbmRfbWlncmF0ZV9tb3ZhYmxl
X3BhZ2VzKCkgYW5kDQo+IGVzcGVjaWFsbHkNCj4gPiA+IGZvbGlvX2lzX2xvbmd0ZXJtX3Bpbm5h
YmxlKCkuIFdlJ2QgcHJvYmFibHkgaGF2ZSB0byBpbXBsZW1lbnQNCj4gc29tZXRoaW5nDQo+ID4g
PiBzaW1pbGFyIGZvciB1ZG1hYnVmLCB3aGVyZSB3ZSBkZXRlY3Qgc3VjaCB1bnBpbm5hYmxlIHBh
Z2VzIGFuZA0KPiBtaWdyYXRlDQo+ID4gPiB0aGVtLg0KPiA+IFRoZSBwYWdlcyB1ZG1hYnVmIHBp
bnMgYXJlIG9ubHkgdGhvc2UgYXNzb2NpYXRlZCB3aXRoIEd1ZXN0IChHUFUNCj4gZHJpdmVyL3Zp
cnRpby1ncHUpDQo+ID4gcmVzb3VyY2VzIChvciBidWZmZXJzIGFsbG9jYXRlZCBhbmQgcGlubmVk
IGZyb20gc2htZW0gdmlhIGRybSBHRU0pLg0KPiBTb21lDQo+ID4gcmVzb3VyY2VzIGFyZSBzaG9y
dC1saXZlZCwgYW5kIHNvbWUgYXJlIGxvbmctbGl2ZWQgYW5kIHdoZW5ldmVyIGENCj4gcmVzb3Vy
Y2UNCj4gPiBnZXRzIGRlc3Ryb3llZCwgdGhlIHBhZ2VzIGFyZSB1bnBpbm5lZC4gQW5kLCBub3Qg
YWxsIHJlc291cmNlcyBoYXZlIHRoZWlyDQo+IHBhZ2VzDQo+ID4gcGlubmVkLiBUaGUgcmVzb3Vy
Y2UgdGhhdCBpcyBwaW5uZWQgZm9yIHRoZSBsb25nZXN0IGR1cmF0aW9uIGlzIHRoZSBGQiBhbmQN
Cj4gdGhhdCdzDQo+ID4gYmVjYXVzZSBpdCBpcyB1cGRhdGVkIGV2ZXJ5IH4xNm1zIChhc3N1bWlu
ZyAxOTIweDEwODBANjApIGJ5IHRoZSBHdWVzdA0KPiA+IEdQVSBkcml2ZXIuIFdlIGNhbiBjZXJ0
YWlubHkgcGluL3VucGluIHRoZSBGQiBhZnRlciBpdCBpcyBhY2Nlc3NlZCBvbiB0aGUNCj4gSG9z
dA0KPiA+IGFzIGEgd29ya2Fyb3VuZCwgYnV0IEkgZ3Vlc3MgdGhhdCBtYXkgbm90IGJlIHZlcnkg
ZWZmaWNpZW50IGdpdmVuIHRoZQ0KPiBhbW91bnQNCj4gPiBvZiBjaHVybiBpdCB3b3VsZCBjcmVh
dGUuDQo+ID4NCj4gPiBBbHNvLCBhcyBmYXIgYXMgbWlncmF0aW9uIG9yIFMzL1M0IGlzIGNvbmNl
cm5lZCwgbXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IGFsbA0KPiA+IHRoZSBHdWVzdCByZXNvdXJj
ZXMgYXJlIGRlc3Ryb3llZCBhbmQgcmVjcmVhdGVkIGFnYWluLiBTbywgd291bGRuJ3QNCj4gc29t
ZXRoaW5nDQo+ID4gc2ltaWxhciBoYXBwZW4gZHVyaW5nIG1lbW9yeSBob3R1bnBsdWc/DQo+ID4N
Cj4gPiA+DQo+ID4gPg0KPiA+ID4gRm9yIGV4YW1wbGUsIHBhaXJpbmcgdWRtYWJ1ZiB3aXRoIHZm
aW8gKHdoaWNoIHBpbnMgcGFnZXMgdXNpbmcNCj4gPiA+IHBpbl91c2VyX3BhZ2VzKEZPTExfTE9O
R1RFUk0pKSBpbiBRRU1VIHdpbGwgbW9zdCBwcm9iYWJseSBub3Qgd29yaw0KPiBpbg0KPiA+ID4g
YWxsIGNhc2VzOiBpZiB1ZG1hYnVmIGxvbmd0ZXJtIHBpbm5lZCB0aGUgcGFnZXMgInRoZSB3cm9u
ZyB3YXkiLCB2ZmlvDQo+ID4gPiB3aWxsIGZhaWwgdG8gbWlncmF0ZSB0aGVtIGR1cmluZyBGT0xM
X0xPTkdURVJNIGFuZCBjb25zZXF1ZW50bHkgZmFpbA0KPiA+ID4gcGluX3VzZXJfcGFnZXMoKS4g
QXMgbG9uZyBhcyB1ZG1hYnVmIGhvbGRzIGEgcmVmZXJlbmNlIG9uIHRoZXNlIHBhZ2VzLA0KPiA+
ID4gdGhhdCB3aWxsIG5ldmVyIHN1Y2NlZWQuDQo+ID4gRG1hLWJ1ZiBydWxlcyAoZm9yIGV4cG9y
dGVycykgaW5kaWNhdGUgdGhhdCB0aGUgcGFnZXMgb25seSBuZWVkIHRvIGJlDQo+IHBpbm5lZA0K
PiA+IGR1cmluZyB0aGUgbWFwX2F0dGFjaG1lbnQgcGhhc2UgKGFuZCB1bnRpbCB1bm1hcCBhdHRh
Y2htZW50IGhhcHBlbnMpLg0KPiA+IEluIG90aGVyIHdvcmRzLCBvbmx5IHdoZW4gdGhlIHNnX3Rh
YmxlIGlzIGNyZWF0ZWQgYnkgdWRtYWJ1Zi4gSSBndWVzcyBvbmUNCj4gPiBvcHRpb24gd291bGQg
YmUgdG8gbm90IGhvbGQgYW55IHJlZmVyZW5jZXMgZHVyaW5nIFVETUFCVUZfQ1JFQVRFIGFuZA0K
PiA+IG9ubHkgZ3JhYiByZWZlcmVuY2VzIHRvIHRoZSBwYWdlcyAoYXMgYW5kIHdoZW4gaXQgZ2V0
cyB1c2VkKSBkdXJpbmcgdGhpcw0KPiBzdGVwLg0KPiA+IFdvdWxkIHRoaXMgaGVscD8NCj4gDQo+
IElJVUMgdGhlIHJlZmNvdW50IGlzIG5lZWRlZCwgb3RoZXJ3aXNlIEkgZG9uJ3Qgc2VlIHdoYXQg
dG8gcHJvdGVjdCB0aGUgcGFnZQ0KPiBmcm9tIGJlaW5nIGZyZWVkIGFuZCBldmVuIHJldXNlZCBl
bHNld2hlcmUgYmVmb3JlIG1hcF9hdHRhY2htZW50KCkuDQo+IA0KPiBJdCBzZWVtcyB0aGUgcHJl
dmlvdXMgY29uY2VybiBvbiB1c2luZyBndXAgd2FzIG1ham9ybHkgZm9yaygpLCBpZiB0aGlzIGlz
IGl0Og0KPiANCj4gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzIxMDk5
Mi8/c2VyaWVzPTM5ODc5JnJldj0yI2NvDQo+IG1tZW50XzQxNDIxMw0KPiANCj4gQ291bGQgaXQg
YWxzbyBiZSBndWFyZGVkIGJ5IGp1c3QgbWFraW5nIHN1cmUgdGhlIHBhZ2VzIGFyZSBNQVBfU0hB
UkVEDQo+IHdoZW4NCj4gY3JlYXRpbmcgdGhlIHVkbWFidWYsIGlmIGZvcmsoKSBpcyBhIHJlcXVp
cmVtZW50IG9mIHRoZSBmZWF0dXJlPw0KPiANCj4gSSBoYWQgYSBmZWVsaW5nIHRoYXQgdGhlIHVz
ZXJzcGFjZSBzdGlsbCBuZWVkcyB0byBhbHdheXMgZG8gdGhlIHJpZ2h0IHRoaW5nDQo+IHRvIG1h
a2UgaXQgd29yaywgZXZlbiB1c2luZyBwdXJlIFBGTiBtYXBwaW5ncy4NCj4gDQo+IEZvciBpbnN0
YW5jZSwgd2hhdCBpZiB0aGUgdXNlcmFwcCBqdXN0IHB1bmNocyBhIGhvbGUgaW4gdGhlIHNobWVt
L2h1Z2V0bGJmcw0KPiBmaWxlIGFmdGVyIGNyZWF0aW5nIHRoZSB1ZG1hYnVmIChJIHNlZSB0aGF0
IEZfU0VBTF9TSFJJTksgaXMgcmVxdWlyZWQsIGJ1dA0KPiBhdCBsZWFzdCBub3QgRl9TRUFMX1dS
SVRFIHdpdGggY3VycmVudCBpbXBsKSwgYW5kIGZhdWx0IGEgbmV3IHBhZ2UgaW50byB0aGUNCj4g
cGFnZSBjYWNoZT8NCklJVUMsIFFlbXUgY3JlYXRlcyBhbmQgb3ducyB0aGUgbWVtZmQgdGhhdCBp
cyBhc3NvY2lhdGVkIHdpdGggR3Vlc3QgbWVtb3J5Lg0KQW5kIGlmIGl0IHB1bmNoZXMgYSBob2xl
IGluIGl0cyBvd24gbWVtZmQgdGhhdCBnb2VzIHRocm91Z2ggR3Vlc3QgcGlubmVkIHBhZ2VzIA0K
YXNzb2NpYXRlZCB3aXRoIGJ1ZmZlcnMvcmVzb3VyY2VzLCB0aGVuIEkgdGhpbmsgdGhlIHByb3Bl
ciB3YXkgdG8gZml4IHRoaXMgaXMgdG8NCnNvbWVob3cgbm90aWZ5IHRoZSBHdWVzdCBkcml2ZXIg
KHZpcnRpby1ncHUgaW4gdGhpcyBjYXNlKSB0aGF0IHRoZSBiYWNraW5nIHN0b3JlDQpvZiB0aGUg
YWZmZWN0ZWQgcmVzb3VyY2VzIGlzIG5vIGxvbmdlciB2YWxpZCBhbmQgdGhhdCB0aGUgcmVzb3Vy
Y2VzIG5lZWQgdG8gYmUNCmRlc3Ryb3llZCBhbmQgcmUtY3JlYXRlZCBhZ2Fpbi4NCg0KSGF2aW5n
IHNhaWQgdGhhdCwgb25lIG9wdGlvbiBJIGNvdWxkIHRoaW5rIG9mIGlzIHRvIHByb2JhYmx5IGlu
c3RhbGwgYSBtbXVfbm90aWZpZXINCmFzc29jaWF0ZWQgd2l0aCB0aGUgcmVsZXZhbnQgcGFnZXMg
aW4gdWRtYWJ1ZiBhbmQgb25jZSB3ZSBnZXQgbm90aWZpZWQgYWJvdXQNCmFueSBpbnZhbGlkYXRp
b24gZXZlbnQgY29uY2VybmluZyBhbnkgb2YgdGhlIHBhZ2VzLCB3ZSdkIGZhaWwgYW55IHN1YnNl
cXVlbnQNCmF0dGVtcHQgdG8gYWNjZXNzIHRoZXNlIHBhZ2VzIGFuZCBwcm9wYWdhdGUgdGhlIGVy
cm9yIGFjcm9zcyB0aGUgc3RhY2suIA0KDQpIb3dldmVyLCBpdCBmZWVscyBsaWtlIHVkbWFidWYg
aXMgbm90IHRoZSByaWdodCBwbGFjZSB0byBoYW5kbGUgdGhpcyBpc3N1ZSBiZWNhdXNlDQp0aGVy
ZSBhcmUgdmVyeSBsaW1pdGVkIG9wdGlvbnMgZm9yIHRha2luZyBwcm9wZXIgY29ycmVjdGl2ZSBh
Y3Rpb24gaWYgUWVtdSBkZWNpZGVzDQp0byBwdW5jaCBhIGhvbGUgaW4gR3Vlc3QgbWVtb3J5IHRo
YXQgdGFrZXMgb3V0IHBhZ2VzIHRoYXQgYXJlIHBpbm5lZC4NCg0KVGhhbmtzLA0KVml2ZWsNCg0K
PiANCj4gVGhhbmtzLA0KPiANCj4gPg0KPiA+ID4NCj4gPiA+DQo+ID4gPiBUaGVyZSBhcmUgKnBy
b2JhYmx5KiBtb3JlIGlzc3VlcyBvbiB0aGUgUUVNVSBzaWRlIHdoZW4gdWRtYWJ1ZiBpcw0KPiA+
ID4gcGFpcmVkDQo+ID4gPiB3aXRoIHRoaW5ncyBsaWtlIE1BRFZfRE9OVE5FRUQvRkFMTE9DX0ZM
X1BVTkNIX0hPTEUgdXNlZCBmb3INCj4gPiA+IHZpcnRpby1iYWxsb29uLCB2aXJ0aW8tbWVtLCBw
b3N0Y29weSBsaXZlIG1pZ3JhdGlvbiwgLi4uIGZvciBleGFtcGxlLCBpbg0KPiA+ID4gdGhlIHZm
aW8vdmRwYSBjYXNlIHdlIG1ha2Ugc3VyZSB0aGF0IHdlIGRpc2FsbG93IG1vc3Qgb2YgdGhlc2Us
IGJlY2F1c2UNCj4gPiA+IG90aGVyd2lzZSB0aGVyZSBjYW4gYmUgYW4gYWNjaWRlbnRhbCAiZGlz
Y29ubmVjdCIgYmV0d2VlbiB0aGUgcGFnZXMNCj4gPiA+IG1hcHBlZCBpbnRvIHRoZSBWTSAoZ3Vl
c3QgdmlldykgYW5kIHRoZSBwYWdlcyBtYXBwZWQgaW50byB0aGUgSU9NTVUNCj4gPiA+IChkZXZp
Y2UgdmlldyksIGZvciBleGFtcGxlLCBhZnRlciBhIHJlYm9vdC4NCj4gPiBPazsgSSBhbSBub3Qg
c3VyZSBpZiBJIGNhbiBmaWd1cmUgb3V0IGlmIHRoZXJlIGlzIGFueSBhY2NlcHRhYmxlIHdheSB0
bw0KPiBhZGRyZXNzDQo+ID4gdGhlc2UgaXNzdWVzIGJ1dCBnaXZlbiB0aGUgY3VycmVudCBjb25z
dHJhaW50cyBhc3NvY2lhdGVkIHdpdGggdWRtYWJ1ZiwNCj4gd2hhdA0KPiA+IGRvIHlvdSBzdWdn
ZXN0IGlzIHRoZSBtb3N0IHJlYXNvbmFibGUgd2F5IHRvIGRlYWwgd2l0aCB0aGVzZSBwcm9ibGVt
cyB5b3UNCj4gPiBoYXZlIGlkZW50aWZpZWQ/DQo+ID4NCj4gPiBUaGFua3MsDQo+ID4gVml2ZWsN
Cj4gPg0KPiA+ID4NCj4gPiA+IC0tDQo+ID4gPiBDaGVlcnMsDQo+ID4gPg0KPiA+ID4gRGF2aWQg
LyBkaGlsZGVuYg0KPiA+DQo+IA0KPiAtLQ0KPiBQZXRlciBYdQ0KPiANCg0K
