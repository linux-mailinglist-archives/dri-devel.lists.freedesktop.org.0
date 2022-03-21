Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4BE4E227A
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 09:49:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89CD210E2B1;
	Mon, 21 Mar 2022 08:49:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD59F10E2B1;
 Mon, 21 Mar 2022 08:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647852550; x=1679388550;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:mime-version: content-transfer-encoding;
 bh=fdCC7DWBXu7UFcTGWD6gPmgSPysms3ED+AHP76SApsU=;
 b=e0cI9gLPvQFjkibzlQtzIy7z/hH0CP41ScjeCfr+hdr+3GoWcfdz319D
 TkUZi4EGTOqVYfp2equ01qUkahS7fxB6wFQX7n4ZbHLCtn8bUrfEfRQWc
 oiKoJKHtvOny0LOso29oZ4xmBlZlOyUJN8t6yQgPiv034ESmA8gACW/80
 yZy5MRgkr6EaW1gCzvr68gSVx6gjIhJkwViWmYcXIsDcaIkehHcbL+deT
 iBeKnJU8fHf5+ZLvjpmQFe4X3kbQ2MWfwyadwyjAp6NQUa/EC0RadJ2mN
 fc9o0XTD5XgjdlY8frEK2F4CCp+s+SNHTnbI18amcaVP0xPf4NqfINIKy Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10292"; a="237445881"
X-IronPort-AV: E=Sophos;i="5.90,198,1643702400"; d="scan'208";a="237445881"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 01:49:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,198,1643702400"; d="scan'208";a="648486566"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga004.jf.intel.com with ESMTP; 21 Mar 2022 01:49:09 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 21 Mar 2022 01:49:09 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 21 Mar 2022 01:49:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Mon, 21 Mar 2022 01:49:09 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Mon, 21 Mar 2022 01:49:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dQMQ2lNaMGJ4h2I8w7ekdnGvj2kz82gZYYLwiNsvGo60HcWmx9XEgePfD+Lhle+DwVEeVkjMA30Lrme0dZgn35hWKX6qvyITWRA/Hgxoyf4bNrKIQ12KWiABEhqqhMOEAZ4AMzq70n0CRCfp6f2PPpN7Zjy1mbW2sRvTvxSTS2ihlE1qM6Xxp6BmhzuHowYj9e9SBNnWJp7WuPQjyj8CdkB6oVpraZnltgoa9oz1hkKlFWdi5fkaD2u/9WpeFoBxZM/OvP+yeuViQhQCTxmSu6cMOygCe4x4WmctlmDSEE+beHhWvv2AKIuFN/lSy6g4kugSohOmXtWyBb82cSDkIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rCfp9nR0n3XJA+V6Jsw+IY+NBaYEyqpeVqP4vpqe+Yk=;
 b=aAY/uANpyzF/VMofOtagscGJdHUxQPUFWWMATU1LczVsLU93ncWQc16+YvOzSFBat5lFNz86Wu/URJMUI+DLPBlogVznhDKNIapHronjJkWc9HgxVeZXr9yzDydM1SNN4MgHP23dQn+g6xw6Fipf4ENnvnmKbipOUxK21lPNDXH+SaajuVCoUoVOowyc9V6ZxfZp/QsId3QmV3VwOqepVbMclsiGpriVNkITFS1TxrVGsnu0FiGiAog50MVlvE/EcfYpCS4WpkdB7vdg8lUfR5AAkdSV3bbl3DAtDbfCKlBFYtq7akhWjC8Fjw0FzqWTu2Th9Fy1VO25VjsdSWuVOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3114.namprd11.prod.outlook.com (2603:10b6:5:6d::11) by
 BY5PR11MB3960.namprd11.prod.outlook.com (2603:10b6:a03:185::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Mon, 21 Mar
 2022 08:49:01 +0000
Received: from DM6PR11MB3114.namprd11.prod.outlook.com
 ([fe80::3967:4609:9c43:44a]) by DM6PR11MB3114.namprd11.prod.outlook.com
 ([fe80::3967:4609:9c43:44a%4]) with mapi id 15.20.5081.022; Mon, 21 Mar 2022
 08:49:01 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "C,
 Ramalingam" <ramalingam.c@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v4 1/8] drm/i915/gt: Use XY_FASR_COLOR_BLT to clear obj on
 graphics ver 12+
Thread-Topic: [PATCH v4 1/8] drm/i915/gt: Use XY_FASR_COLOR_BLT to clear obj
 on graphics ver 12+
Thread-Index: AQHYO9HK4QHmRVPpPUyCJnwkOZIJjazJiV+A
Date: Mon, 21 Mar 2022 08:49:01 +0000
Message-ID: <028e89a677269f10efe6a59afcaef52e5b126afa.camel@intel.com>
References: <20220319204229.9846-1-ramalingam.c@intel.com>
 <20220319204229.9846-2-ramalingam.c@intel.com>
In-Reply-To: <20220319204229.9846-2-ramalingam.c@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-2.fc34) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 765dc9ca-722a-45d8-f331-08da0b17a596
x-ms-traffictypediagnostic: BY5PR11MB3960:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BY5PR11MB3960EC6682F033AB8F0D06B497169@BY5PR11MB3960.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NkCTtSZSrTrn0ls2nsEbAlFnamszo/RSB/irfYwmbrqwurIQWoxH3wn8scaPCxq6hLNcmPEPGMfJX4zfzgHzBjL3WVmsroxfEck3IOXaIvE2HfreGmiCKNlDFfzrpzYpxtyjSobXy1dUBT46EN4c/IzbxRHvcqKejbHsj/aiteh3wPHBvvqJyxRJh2Xs840Q/yYD8e87t+eWaNRB6PMp8qqteMv1I7TjOkWXSVXpDX8m+Y6l831BFvlbI30KG8HqyFUv2eGHKrcyq0KH+zN8nPt1pjIIDkq34kffrxEr4wVdCTHJJQO7AQqyY8oBzfEPsniGJEMDAkdXWRCt6f7fytEPAIUds+tLmuN2GRUrezHLN4i/AR7p3dhCKSFnLs7Cuy5VIXT204vddfeCuN8ee9tDZ42TgmjVkTtk3w6P78NBqIa3i/S+ZevQPGFbN37pwwsEMRnQHeraOgPfys+U6FLqrmYtr8ZuX54PN6DXHNR3vLejDu/ludswJyrp4B15Dg0M7tpBDQxpvlw6PORFrkIPnrCINGTlMU2v53bsSXGNWSStw5VsksU5C0sZol1ZtIjcJePWV9i6h3qBj2x9o86Hylof1lcd2GWY7m0tuwIO+P/mVhWy1rrS9rUnf/8yHTprPPXxwRhzZgEsoEjAoDqCQZV3oK9fTg6Awv7RM9c7HODWjj46yvKunGpxcfbnC/I1hAFiJyUoJIoF6UI79w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3114.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66574015)(91956017)(83380400001)(66556008)(66476007)(36756003)(66446008)(71200400001)(316002)(4326008)(450100002)(110136005)(6486002)(64756008)(38070700005)(66946007)(8676002)(76116006)(508600001)(86362001)(8936002)(186003)(2906002)(5660300002)(26005)(107886003)(2616005)(82960400001)(38100700002)(122000001)(6506007)(6512007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SWZ6dEpBcEVZOEViYXFWMFNiSXJPMWdnN1pna20ySjZaQ1F3R3lZWER1OFhT?=
 =?utf-8?B?bUlKQ25yVExXWmlvRWlIZUpoNEsvTWpRK0p4d0pDN05ESXgrZXJmZmE3STV6?=
 =?utf-8?B?V1hTUjZDV0w0a243dGdFeTQ1ckpKMUMwczVhektXVi8walRmbFpvSVVoemtl?=
 =?utf-8?B?S3YrTVpaWXg2aVpkdnk3M2c5U1E2SUtCd1U3c0J6ZElUY2FYKy9xd2YzSW5Q?=
 =?utf-8?B?V2pKbVhuT0Ywb2lSYUJXZitOL21wUEJzZHFOM3lscVpUUUh0SytYUmJacXVR?=
 =?utf-8?B?eCtESEJFTXRQVzcrZk4xRVM5N3RmK0ZWLy9ySDFVblBSZFJ0elFadDVlV1Zh?=
 =?utf-8?B?aEtXU2I1ck42eWhDTlJROGhuUTlib3k4b29Jb1MzYjFWaHVCbzRUb2ZjQkRT?=
 =?utf-8?B?bGRUTmpDTmNlbUF5dWlRZFkxclNiZE00Ti9INktscEhFYjRzOUU0OGwvSzND?=
 =?utf-8?B?cS85bFY1V1JNSXVqbVdKNGpVZVJNMmpSZGxuUXB2UnBrcXY1dm11Ym01K2t3?=
 =?utf-8?B?a05rdU9qeVFaV3ByTnNoTFh6ZjNkWndGdXpCUERISFdKV1ordnhQUmt1R2sz?=
 =?utf-8?B?eXhCRDJUbnNNcjZlK0lHd3NzNnVFbEk1TWNNcWZ6aDNwNndnNFNEWUh5WnBK?=
 =?utf-8?B?MTZ4QjFBVThrR3hCVUdFcVR1aGt1bEtmbG15eXZPTnVtd28zVHpzcW1qZGxP?=
 =?utf-8?B?UDZFVkUrcUtna0R0UER5cWl6VG9ZVFU4cWNMYmk5bzE5QVdKVkNHUEgwTWls?=
 =?utf-8?B?Q3YxWlBCSEhQNTBaNnRPa1IxWmxnWFBUMmNwSTY5T0EvT1FOeDFsQW1NMC9J?=
 =?utf-8?B?YmdidUdTcU9IeVVjSnFLbDlWRXNrOGFtcXd1a0J4clFMYTFoWFdKMTcrZ28w?=
 =?utf-8?B?MWZ4SDFCL0FjV1orcnhqRENtUGtFengwa2xuV0V0Q0NhRWZJN0xON1dQUWhS?=
 =?utf-8?B?aTQvYjh3UjVGek56Y3c3cUl6Nk4zcm51MHVoK29nSmRkS1J3K1p5b0pIUzNX?=
 =?utf-8?B?MFBhUFFTTWVJS2U1NGV0M1JYYUZzRU55bWh1VEpIYXFqVTRiTDBuWU9MNHQ0?=
 =?utf-8?B?VS8yRklMWjduSDd4WHpuZFJma2svdG5lMVQ2ckhPdFRYSzVrRlQ2MElxU2Fy?=
 =?utf-8?B?V2ZUWlZLeVp1dXE0enlPNk9EMDBhdHZFU3Y2d1RvaXY3VmxSNnZhcWZLSHFn?=
 =?utf-8?B?ZVdmbnR2c1dPalZaYm5GbytwSzBaV3FWOVlnRFFoTDQvOTZVZHJkUEVhcFh6?=
 =?utf-8?B?ZTFvRG1MZi9yR09lVlgrb2xNNmg2ekU2TWhQQ3BWS0NHWWYxQ2lkME9ZQlNE?=
 =?utf-8?B?T0UxZXhIYkwxdThmSE9qb3lZTE85U0pERWlHSVhjRTVlVEN3cHVJSFVZbzMw?=
 =?utf-8?B?UVJqdFN6bkhuZU4vRXdnRytFYnQvMDQrRWV0TDVSTG4vcHoveHZESk53WnVh?=
 =?utf-8?B?b3VLY0FaZUxEbzBKUS9XSUNzanp4SmlsM1gwb0pJVUNTRC9JY0JMYTZBdWVG?=
 =?utf-8?B?R0dWUktPQWFXbmhZN3lUYW5jc1Y0TDh1UGhVeHhxbjVFN0t1R1VyM1grTGo2?=
 =?utf-8?B?QWtFWFdiSmZMT0cwM2tGeS82cVRXdkM4ejlwS1FHSHcrVkNPWDJIRllNKzhv?=
 =?utf-8?B?U2puc0x3TWg5Rm0wZmsrdU5LY2k1MmVxRm5NME9BM0R5VENKQ1VOUHpuL3J1?=
 =?utf-8?B?aEY2c3ZFRWZGdzk1akhUMWtJT3VseUZ6TUtkSnRPT2VuaG5ua1Q2N29ZSWZF?=
 =?utf-8?B?ZEJDK3BpUnpwL00rZkRNQVU2aDJXVEoyTnY5MVJodzVlMmhYeFN4cUxhTEl4?=
 =?utf-8?B?M2ZFVkdQZU1WbERCZ3F5Yng5RWxDM3lkdEl6WVBHWmY4Y2wyL2t2dHB3eXdr?=
 =?utf-8?B?aGU5alJqdDJva05pM0lSMXRCZzdGQUlISythQ2Z3M29zMFdBTnN3OGp4YWVL?=
 =?utf-8?B?S3RzRWNJMnpHT1lZVDNNam1BSUhpVjUrM1g5MVVMR0EveWhETnRldnIvWFZV?=
 =?utf-8?B?azVPeEwyVWd3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EF78B8C5EE24944ABF15009050428776@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3114.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 765dc9ca-722a-45d8-f331-08da0b17a596
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2022 08:49:01.5539 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XMKg+zT9cs2PkSsjYeLD8mSEhA1BUncRPHgWv3Fq5Hbkfv//czzwl14UE5/GmUMFuk2CGblbRGllOR30D02JgkNF9j7n1n7+JsHQuinHgbM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3960
X-OriginatorOrg: intel.com
Content-Transfer-Encoding: base64
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
Cc: "Auld, Matthew" <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCAyMDIyLTAzLTIwIGF0IDAyOjEyICswNTMwLCBSYW1hbGluZ2FtIEMgd3JvdGU6Cj4g
WFlfRkFTVF9DT0xPUl9CTFQgY21kIGlzIGZhc3RlciB0aGFuIHRoZSBvbGRlciBYWV9DT0xPUl9C
TFQuIEhlbmNlCj4gZm9yCj4gY2xlYXJpbmcgKFplcm8gb3V0KSB0aGUgcGFnZXMgb2YgdGhlIG5l
d2x5IGFsbG9jYXRlZCBvYmplY3QsIGZhc3Rlcgo+IGNtZAo+IGlzIHVzZWQuCgpOSVQ6IEltcGVy
YXRpdmUgd29yZGluZwoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBSYW1hbGluZ2FtIEMgPHJhbWFsaW5n
YW0uY0BpbnRlbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJp
cy13aWxzb24uY28udWs+CgpBbHNvIHRoZXJlJ3MgYSB0eXBvIGluIHRoZSBwYXRjaCB0aXRsZS4K
CldpdGggdGhhdCBmaXhlZDoKUmV2aWV3ZWQtYnk6IFRob21hcyBIZWxsc3Ryw7ZtIDx0aG9tYXMu
aGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbT4KCgo+IC0tLQo+IMKgZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3QvaW50ZWxfZ3B1X2NvbW1hbmRzLmggfMKgIDUgKysrCj4gwqBkcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndC9pbnRlbF9taWdyYXRlLmPCoMKgwqDCoMKgIHwgNDMgKysrKysrKysrKysrKysrKyst
Cj4gLS0KPiDCoDIgZmlsZXMgY2hhbmdlZCwgNDMgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMo
LSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfZ3B1X2Nv
bW1hbmRzLmgKPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2dwdV9jb21tYW5kcy5o
Cj4gaW5kZXggZDExMmZmZDU2NDE4Li45MjVlNTViNmE5NGYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfZ3B1X2NvbW1hbmRzLmgKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndC9pbnRlbF9ncHVfY29tbWFuZHMuaAo+IEBAIC0yMDUsNiArMjA1LDExIEBA
Cj4gwqAKPiDCoCNkZWZpbmUgQ09MT1JfQkxUX0NNRMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCgyIDw8IDI5IHwgMHg0MCA8PCAyMiB8ICg1IC0KPiAyKSkKPiDCoCNkZWZpbmUg
WFlfQ09MT1JfQkxUX0NNRMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCgyIDw8IDI5IHwg
MHg1MCA8PCAyMikKPiArI2RlZmluZSBYWV9GQVNUX0NPTE9SX0JMVF9DTUTCoMKgwqDCoMKgwqDC
oMKgwqDCoCgyIDw8IDI5IHwgMHg0NCA8PCAyMikKPiArI2RlZmluZcKgwqAgWFlfRkFTVF9DT0xP
Ul9CTFRfREVQVEhfMzLCoMKgwqAoMiA8PCAxOSkKPiArI2RlZmluZcKgwqAgWFlfRkFTVF9DT0xP
Ul9CTFRfRFfCoMKgwqDCoMKgwqDCoMKgwqAxNgo+ICsjZGVmaW5lwqDCoCBYWV9GQVNUX0NPTE9S
X0JMVF9NT0NTX01BU0vCoMKgR0VOTUFTSygyNywgMjEpCj4gKyNkZWZpbmXCoMKgIFhZX0ZBU1Rf
Q09MT1JfQkxUX01FTV9UWVBFX1NISUZUIDMxCj4gwqAjZGVmaW5lIFNSQ19DT1BZX0JMVF9DTUTC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAoMiA8PCAyOSB8IDB4NDMgPDwgMjIpCj4gwqAj
ZGVmaW5lIEdFTjlfWFlfRkFTVF9DT1BZX0JMVF9DTUTCoMKgwqDCoMKgwqAoMiA8PCAyOSB8IDB4
NDIgPDwgMjIpCj4gwqAjZGVmaW5lIFhZX1NSQ19DT1BZX0JMVF9DTUTCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAoMiA8PCAyOSB8IDB4NTMgPDwgMjIpCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2d0L2ludGVsX21pZ3JhdGUuYwo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Qv
aW50ZWxfbWlncmF0ZS5jCj4gaW5kZXggMjA0NDRkNmNlYjNjLi43MzE5OWViZjA2NzEgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfbWlncmF0ZS5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfbWlncmF0ZS5jCj4gQEAgLTYxNCwyMCArNjE0
LDUzIEBAIGludGVsX2NvbnRleHRfbWlncmF0ZV9jb3B5KHN0cnVjdCBpbnRlbF9jb250ZXh0Cj4g
KmNlLAo+IMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gZXJyOwo+IMKgfQo+IMKgCj4gLXN0YXRpYyBp
bnQgZW1pdF9jbGVhcihzdHJ1Y3QgaTkxNV9yZXF1ZXN0ICpycSwgdTY0IG9mZnNldCwgaW50IHNp
emUsCj4gdTMyIHZhbHVlKQo+ICtzdGF0aWMgaW50IGVtaXRfY2xlYXIoc3RydWN0IGk5MTVfcmVx
dWVzdCAqcnEsIHU2NCBvZmZzZXQsIGludCBzaXplLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHUzMiB2YWx1ZSwgYm9vbCBpc19sbWVtKQo+IMKgewo+IC3CoMKg
wqDCoMKgwqDCoGNvbnN0IGludCB2ZXIgPSBHUkFQSElDU19WRVIocnEtPmVuZ2luZS0+aTkxNSk7
Cj4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmk5MTUgPSBycS0+ZW5n
aW5lLT5pOTE1Owo+ICvCoMKgwqDCoMKgwqDCoGludCBtb2NzID0gcnEtPmVuZ2luZS0+Z3QtPm1v
Y3MudWNfaW5kZXggPDwgMTsKPiArwqDCoMKgwqDCoMKgwqBjb25zdCBpbnQgdmVyID0gR1JBUEhJ
Q1NfVkVSKGk5MTUpOwo+ICvCoMKgwqDCoMKgwqDCoGludCByaW5nX3N6Owo+IMKgwqDCoMKgwqDC
oMKgwqB1MzIgKmNzOwo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoEdFTV9CVUdfT04oc2l6ZSA+PiBQ
QUdFX1NISUZUID4gUzE2X01BWCk7Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgb2Zmc2V0ICs9ICh1
NjQpcnEtPmVuZ2luZS0+aW5zdGFuY2UgPDwgMzI7Cj4gwqAKPiAtwqDCoMKgwqDCoMKgwqBjcyA9
IGludGVsX3JpbmdfYmVnaW4ocnEsIHZlciA+PSA4ID8gOCA6IDYpOwo+ICvCoMKgwqDCoMKgwqDC
oGlmICh2ZXIgPj0gMTIpCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJpbmdfc3og
PSAxNjsKPiArwqDCoMKgwqDCoMKgwqBlbHNlIGlmICh2ZXIgPj0gOCkKPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgcmluZ19zeiA9IDg7Cj4gK8KgwqDCoMKgwqDCoMKgZWxzZQo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByaW5nX3N6ID0gNjsKPiArCj4gK8KgwqDCoMKg
wqDCoMKgY3MgPSBpbnRlbF9yaW5nX2JlZ2luKHJxLCByaW5nX3N6KTsKPiDCoMKgwqDCoMKgwqDC
oMKgaWYgKElTX0VSUihjcykpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1
cm4gUFRSX0VSUihjcyk7Cj4gwqAKPiAtwqDCoMKgwqDCoMKgwqBpZiAodmVyID49IDgpIHsKPiAr
wqDCoMKgwqDCoMKgwqBpZiAodmVyID49IDEyKSB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCpjcysrID0gWFlfRkFTVF9DT0xPUl9CTFRfQ01EIHwKPiBYWV9GQVNUX0NPTE9SX0JM
VF9ERVBUSF8zMiB8Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAoWFlfRkFTVF9DT0xPUl9CTFRfRFcgLSAyKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgKmNzKysgPSBGSUVMRF9QUkVQKFhZX0ZBU1RfQ09MT1JfQkxUX01PQ1NfTUFTSywg
bW9jcykKPiB8Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAoUEFHRV9TSVpFIC0gMSk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCpjcysr
ID0gMDsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgKmNzKysgPSBzaXplID4+IFBB
R0VfU0hJRlQgPDwgMTYgfCBQQUdFX1NJWkUgLyA0Owo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAqY3MrKyA9IGxvd2VyXzMyX2JpdHMob2Zmc2V0KTsKPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgKmNzKysgPSB1cHBlcl8zMl9iaXRzKG9mZnNldCk7Cj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCpjcysrID0gIWlzX2xtZW0gPDwgWFlfRkFTVF9DT0xPUl9C
TFRfTUVNX1RZUEVfU0hJRlQ7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC8qIEJH
NyAqLwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAqY3MrKyA9IHZhbHVlOwo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAqY3MrKyA9IDA7Cj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCpjcysrID0gMDsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgKmNzKysgPSAwOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAvKiBCRzExICov
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCpjcysrID0gMDsKPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgKmNzKysgPSAwOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAvKiBCRzEzICovCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCpjcysr
ID0gMDsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgKmNzKysgPSAwOwo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAqY3MrKyA9IDA7Cj4gK8KgwqDCoMKgwqDCoMKgfSBl
bHNlIGlmICh2ZXIgPj0gOCkgewo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgKmNz
KysgPSBYWV9DT0xPUl9CTFRfQ01EIHwgQkxUX1dSSVRFX1JHQkEgfCAoNyAtIDIpOwo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgKmNzKysgPSBCTFRfREVQVEhfMzIgfCBCTFRfUk9Q
X0NPTE9SX0NPUFkgfAo+IFBBR0VfU0laRTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCpjcysrID0gMDsKPiBAQCAtNzExLDcgKzc0NCw3IEBAIGludGVsX2NvbnRleHRfbWlncmF0
ZV9jbGVhcihzdHJ1Y3QgaW50ZWxfY29udGV4dAo+ICpjZSwKPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoGlmIChlcnIpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgZ290byBvdXRfcnE7Cj4gwqAKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgZXJyID0gZW1pdF9jbGVhcihycSwgb2Zmc2V0LCBsZW4sIHZhbHVlKTsKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZXJyID0gZW1pdF9jbGVhcihycSwgb2Zmc2V0LCBs
ZW4sIHZhbHVlLCBpc19sbWVtKTsKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgLyogQXJiaXRyYXRpb24gaXMgcmUtZW5hYmxlZCBiZXR3ZWVuIHJlcXVlc3RzLiAqLwo+IMKg
b3V0X3JxOgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpJbnRlbCBTd2VkZW4gQUIKUmVnaXN0ZXJlZCBPZmZpY2U6
IElzYWZqb3Jkc2dhdGFuIDMwQiwgMTY0IDQwIEtpc3RhLCBTdG9ja2hvbG0sIFN3ZWRlbgpSZWdp
c3RyYXRpb24gTnVtYmVyOiA1NTYxODktNjAyNwoKVGhpcyBlLW1haWwgYW5kIGFueSBhdHRhY2ht
ZW50cyBtYXkgY29udGFpbiBjb25maWRlbnRpYWwgbWF0ZXJpYWwgZm9yCnRoZSBzb2xlIHVzZSBv
ZiB0aGUgaW50ZW5kZWQgcmVjaXBpZW50KHMpLiBBbnkgcmV2aWV3IG9yIGRpc3RyaWJ1dGlvbgpi
eSBvdGhlcnMgaXMgc3RyaWN0bHkgcHJvaGliaXRlZC4gSWYgeW91IGFyZSBub3QgdGhlIGludGVu
ZGVkCnJlY2lwaWVudCwgcGxlYXNlIGNvbnRhY3QgdGhlIHNlbmRlciBhbmQgZGVsZXRlIGFsbCBj
b3BpZXMuCg==

