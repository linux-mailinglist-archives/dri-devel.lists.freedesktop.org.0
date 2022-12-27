Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EF1656DBD
	for <lists+dri-devel@lfdr.de>; Tue, 27 Dec 2022 18:55:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 974C910E164;
	Tue, 27 Dec 2022 17:55:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FB8110E164;
 Tue, 27 Dec 2022 17:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672163720; x=1703699720;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=3t2zGvsbIvsA1cQoM4f6pVNLC6//Nqq8z/31mc5E0zM=;
 b=PeQIB4ldP0PXGcLrEyY0j+yZ/OYgxk+IwcX1boxbBLLrnBdPbinDUmdQ
 +5yDbcgtM7N988mLCncBc6pGLW2zHi8jU4Kb6CdhI5FGuRsfHUBBzAnOw
 EpXCzW1aKzq4L3WnVDHc6JcdYSJ05ceFSL2L/Oof8pGvtFpfc/p7ni8E4
 Lo+kUOXKaPqSHKe4qCmglCG0TKN+hVCE16z+H1Xo+pa2OK7UOScKQspkH
 tjsxHGjg27OXyiaBTQbiOEluJkIZNSNKA/FBSiCms+jKSP0HjEmAA7Kfb
 IMobWjGuBoXfBg2sDhAitpSBtzxXXUR912pfjq2EFqoaCRN16TxVl56XQ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10573"; a="347934696"
X-IronPort-AV: E=Sophos;i="5.96,279,1665471600"; d="scan'208";a="347934696"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2022 09:55:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10573"; a="716396009"
X-IronPort-AV: E=Sophos;i="5.96,279,1665471600"; d="scan'208";a="716396009"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga008.fm.intel.com with ESMTP; 27 Dec 2022 09:55:19 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 27 Dec 2022 09:55:19 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 27 Dec 2022 09:55:19 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 27 Dec 2022 09:55:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oa383E57RqGRvrqphuEbvLA7LMpVu1y4zrlzCXs54Xn21MIJgnaUtnR3DwPeiwXcFXRu1mWL3/ZjpYp40/upJq0QdLtMkhDBC4T3PA92zLlU2XB4Qu1cxpLdskYkN/+rV+53e8bO1bIcS/CJmhBR7/qjDCdTHZffZrH8nkR/nyMQmMA7cEuBN1be/gtBTgks1JmRgQyBIJIOqCHLGmHhIeH58eT6kKjLMeoLomoODttgshHdbMWrlrj4KkuDi3oZvNMwvqI0whNZHXlV8tyfR8iShUZVas3r7D37XN1+WvXeOIN9Eml27EF9aka8o88tALC0QNMQfPQeKOjmydQDdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3t2zGvsbIvsA1cQoM4f6pVNLC6//Nqq8z/31mc5E0zM=;
 b=GcqT8ehUKSWxBLnIQn3icksiW1F5YBBLLd4A62Pfhn9mSTaJaXd/DhPvqFgsICfQ0CG2DAqqBfbXfJClq4uJ0NL6qyJMvf9DTOBQHu9LAdIuwL7f/rBcxg2coZ+4mpA0B/WJzeQM6zIC0d+PplohIR7ek6wtg5rSWr1GvizxPLbwbKh9nqqqFXD5UqxTcM+aVJ1yVuG5vEfzwyFES2TgGUY28JrM9QBnwtu/dLFaqoQup31od7ineXQEtuQbi21vbmKqdKz2xdlu+b475YGCnU4SSe9tmuHZ4mHFBhHuvon2PRYjypN4K6rRBXcrtVoaE+5Kv3PblTU7/p+QdfRKYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 IA1PR11MB7199.namprd11.prod.outlook.com (2603:10b6:208:418::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Tue, 27 Dec
 2022 17:55:17 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::8901:2af2:6e02:c95c]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::8901:2af2:6e02:c95c%5]) with mapi id 15.20.5924.016; Tue, 27 Dec 2022
 17:55:17 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "ddavenport@chromium.org" <ddavenport@chromium.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/display: Check source height is > 0
Thread-Topic: [Intel-gfx] [PATCH] drm/i915/display: Check source height is > 0
Thread-Index: AQHZGbedEZslNx+p3U+H+RVl79kTVq6CBh2A
Date: Tue, 27 Dec 2022 17:55:17 +0000
Message-ID: <e9cfd7b7b23294592192869bd16a20596f3276c2.camel@intel.com>
References: <20221226225246.1.I15dff7bb5a0e485c862eae61a69096caf12ef29f@changeid>
In-Reply-To: <20221226225246.1.I15dff7bb5a0e485c862eae61a69096caf12ef29f@changeid>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|IA1PR11MB7199:EE_
x-ms-office365-filtering-correlation-id: f747ea14-a906-46ab-26d8-08dae8338387
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dWiHPoYaWKli/oZzt95kmhbMtyA0tKduZ6TyTZKgn7CIPLMHtWrHqzof3bpRu9e7QdmymTh/zWICTxuhguvIGIVPF44OZYSTLckkEhDVPMRWrRnVxwi7MvvwH+oHHD1IGZKfNpgXkwDRf5T3AKonWAscNPjbtbau4ISTZtJ+TCGHHh5SRJrtDCGPV2zIAVCbhOXU2ffWKx/eb2UsTSH4lOC7VfKG9hvE4FU1tbaO3HYmD7a2q8rFE2FQX8IMRO2MWaSfr0t+wLAhVPcQuV0Da7IFFHsOs/ID90mp/GGJOmYsRrSQBBsbK0oL/6adYw2DI5izRCH5o7HHYjuCdbT0aJngcKhjszGD9E98oI9dbOIHLQRR38+lKYsg37cr9s5N6Y5t37YMbkP7jo/aiLob/nLzmv/+wGfLKvBK86ytEa5ZMgjI74x7ZhW1SsNfmSuCFhnstQjCDZWvlTBtviUxQ5bZ8h+ipJjjfh/a9cYuux4Sk1KdFQZ8YAI2CmMpFVGSbsibpJKIihsA5UflcDSplHJ72nHNBj3DQnFVXuGBpJ7nMLbno7KO28EGNo4CBMs65+UwIbpaS72zPlibYtGmxYVywEOtJNsmw7VYYBMkcjYBsWFhJMEQnco9Dp/9MHbOG2bfhkNE78THVAzaF6xiLNvjhcDHC1aSqCkH8/ueoiS7CIf55i4Ai52NXpqVDyNwPAVaPQppkPq/FFFFE3/09A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(39860400002)(366004)(136003)(346002)(376002)(451199015)(2616005)(76116006)(66556008)(66476007)(66946007)(82960400001)(41300700001)(38100700002)(66446008)(91956017)(64756008)(122000001)(107886003)(8676002)(4326008)(4001150100001)(2906002)(8936002)(86362001)(5660300002)(38070700005)(36756003)(83380400001)(6486002)(478600001)(6506007)(110136005)(54906003)(316002)(186003)(6512007)(26005)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UUVFREN5ZGw5QjIyelVYOUV6T0V5K2duL1FDSXljSmFYYU0rTnZPRlZwRFkw?=
 =?utf-8?B?bzV2N0FDRFh6bVdlR0gvQXhCN0pPZlhCdUVXVkYzUXN2ZEJyQWY2QmlwTXJ2?=
 =?utf-8?B?U21sdFlBT2E0SUx1NFlScTVjWHYwbStRcVNFajYya3N5NmFHcllVUEtYNDZS?=
 =?utf-8?B?T2pXcmxHTG1wbWZGOGJJdlZvOWtHTWNjVDl2ek9Rdjd6TzQ1RkVHV3V5Vno0?=
 =?utf-8?B?MDVQNStSbkZlT1BWNnFGNHo4NkVHdTgyQm1mVGRiMURGVWdtNWNPZERnYmJi?=
 =?utf-8?B?a3VDZGZDVXJXV3cxZVQwTDc3M3FRR3lmUjlmbUJlR2V0cXQ0aldjczFKMnda?=
 =?utf-8?B?a1lTRUxENXJOMmVkWHppV1IzVkFuT0x5T0huemovMGNxVS9QZVFQZDdyckVE?=
 =?utf-8?B?d1BYWTU4S012cy9ncFRVOTFBZnd0dVdtWndSTkJHUDlnNHNHcFJiekNTNWV0?=
 =?utf-8?B?T2pUQ1ZMV0xvQTdLeUpVbEFoeWNkM3lGTWt3TlNaQkZuTk5FeWxCTitzSjVE?=
 =?utf-8?B?N0J4ZjhLVUlKTUJqMi83OXZvY1lYdkpUenptbnhrbitUL3R0SEh4aFFzMXZz?=
 =?utf-8?B?ZG1LclkxZW9mNlYvL1NyTEdaZUNPUlhkSklMbjVOQWVZTGI4VHRtM0RCbjRO?=
 =?utf-8?B?N3piaXpzVmU3K2xkcFRiOFNzZEZOakdXV0FKQnpUK1lUUXFsZks0U3J4UTJw?=
 =?utf-8?B?M3RueGZGN1FtNzZRNXNPSnh3dEhMNm1VSS9YbGpaYnVVbUZwSkd6WXQzNnJP?=
 =?utf-8?B?QndVNVAwNGViM0tGQmZGWWtqWEUwdENqOElaVWRsZTdSdUE1N1RPcHo5dUxx?=
 =?utf-8?B?U1Rpc0pFa0szcjJpbFozWS9kWWlCdkhxcURISW85VVpWcTdrNExHZER6dERP?=
 =?utf-8?B?YlFkb2crY2J0Q0hsZEUvdE1wSFpTbnFKdHAyellVSWt5amFFZElHYXA0aU56?=
 =?utf-8?B?aXFtOUs1WXowbnUvV3RsMHRiTDJKZHFnYldzZ0hSZEdzRnpWUGhXV1J5L1kw?=
 =?utf-8?B?VVFQZGNxNm00Z0djZzl5UVMxbFdiMFg2Q3laZVFBTTR6Skwvd1FocHdESVJE?=
 =?utf-8?B?dTJhK3Y3cW8wcWdpMGlPaXZia0VXWUxXYlJYZW9qeUFxaGhYTUl5cXk0VHVo?=
 =?utf-8?B?LzRGTEJYK1grSUQ3dDdhQUV6SS9QaEt6NkVRTFRHNDlSVXFrUkRzNzZYTytw?=
 =?utf-8?B?cVlWaDMrLzZoUjFYOXhPTlVSVnRNRUJZUFpPalJzUWRvSXVHWUlPTW5XcXlF?=
 =?utf-8?B?ZVlmbisyQkJVV0VhUGdoSGpZUi9venRLTENSejFMOU11TUg5RGxuN0hOL0dz?=
 =?utf-8?B?TVh2UXdTQkpYWFpVWURVYmJBTVRwWDhnaHl0NmRMdlRBYU55TVI0SFpaV2tt?=
 =?utf-8?B?MkRsb0pmNnd0OFhoMkZiNnAzdWp1WTV2eU9lKzZrMnQrS2oyK0Y2TEI2bkxF?=
 =?utf-8?B?R0psTzlBbEtVZWZLS0VRMkJ0OHQ0UnMrZTRlU0dRT2RCTWFtcmFhOExTN2l4?=
 =?utf-8?B?Z1cwMHJpS2pXMmU4U2h0ZEFBLzFncHFyaXZ4VFdFd1FSSzlkblJxOWpQeVVQ?=
 =?utf-8?B?cFhYblVpam82STRuc1M5KzdyUDdNWmcrWmZSd0VXbDFDelBIMjE0QmRVT05t?=
 =?utf-8?B?cEZkeVlQMVlEQkhEejRYbGIwSUVRUU0vMnY3WUNXaDJLOElKRWJYajFmVnFL?=
 =?utf-8?B?RTh5QjVVbmZPYmlGSTc3T2Q2aXF0RXBiQVB1dVFUVHlzUU5KNkNEdzY4c0pK?=
 =?utf-8?B?bHNVeTcyRDFRSzBvV2lmT1Jlb29NM25kemZLWGduczd2a2FoVmMzWTZKMVdz?=
 =?utf-8?B?Nk5jV1RhVkd5dlQrMUZXT1NLemJPSUFmR1U1aWkzMnBOK3p4cWZvSjdsVFk2?=
 =?utf-8?B?RENqOUVQcktJeW9ERTVPeVZyTVFBZGJLdmVGcUxiTXNiV2lmSFZxaW9qcXJE?=
 =?utf-8?B?Y21Ha1MwRmZTUmwwSDRiY1NhMyticEhmaDdabFgrdkd2WVY1Vko0d25oZSsv?=
 =?utf-8?B?ckgwMFBrT1U0SGFCNlF2bWYxaHRQT29DWDVLV1NXUmNTcWhyWFYzMkg1Ulpw?=
 =?utf-8?B?bHBlS1ZzbTdJb2dDRysvUUM0Q3FiUThsWWpsZXVFS01WUi9QSWVFSzg0aDBM?=
 =?utf-8?B?OU5vU2NETkFpcDZQYWlKSkZDQXZ5b2k4bm9PaC9ZcGtiQVhybW55cmFUbHlI?=
 =?utf-8?Q?9J7fnYB8khmc/0zntkx/nYE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7C563FF2EDFE42469D9CE87B1E5A1F9B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f747ea14-a906-46ab-26d8-08dae8338387
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Dec 2022 17:55:17.3370 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AkDC2NzEEw29918DmkVWYaq+SE17CKfUyX9/1qp3z3o8xAuOPdCGyPT0iEHlUxG0EhCre2yOyEfUTLIzM6TvfA/eTOgoOlxVOA5KRgEDYMiM7puhR0+4qWEslA69stF/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7199
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Heikkila,
 Juha-pekka" <juha-pekka.heikkila@intel.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SXMgdGhlcmUgYSBiZXR0ZXIgcGxhY2UgZm9yIHRoaXMgY2hlY2sgaGlnaGVyIHVwIHRoZSBpbnRl
bCBzcGVjaWZpYyBhdG9taWMtY2hlY2s/IChzbyB0aGUgY2hlY2sgd29uJ3QgYmUgc2tsIHNwZWNp
ZmljIC0gaSBub3RpY2UgdGhhdCBpbnRlbF9hZGp1c3RlZF9yYXRlIGlzIGFsc28gY2FsbGVkIGJ5
DQppbGtfZm9vIGFzIHdlbGwgYW5kIG5vbi1iYWNrZW5kLXNwZWNpZmljIGZ1bmN0aW9ucykuIEVs
c2UsIHBlcmhhcHMgaW50ZWxfYWRqdXN0ZWRfcmF0ZSBzaG91bGQgYWRkIGEgY2hlY2sgKyBXQVJO
PyAoaWYgd2UgYXJlIHRyeWluZyB0byBwcm9wYWdhdGUgdGhpcyBzbG93bHkgYWNyb3NzIEhXKS4N
Cg0KDQouLi5hbGFuIA0KDQpPbiBNb24sIDIwMjItMTItMjYgYXQgMjI6NTMgLTA3MDAsIERyZXcg
RGF2ZW5wb3J0IHdyb3RlOg0KPiBUaGUgZXJyb3IgbWVzc2FnZSBzdWdnZXN0cyB0aGF0IHRoZSBo
ZWlnaHQgb2YgdGhlIHNyYyByZWN0IG11c3QgYmUgYXQNCj4gbGVhc3QgMS4gUmVqZWN0IHNvdXJj
ZSB3aXRoIGhlaWdodCBvZiAwLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogRHJldyBEYXZlbnBvcnQg
PGRkYXZlbnBvcnRAY2hyb21pdW0ub3JnPg0KPiANCj4gLS0tDQo+IEkgd2FzIGludmVzdGlnYXRp
bmcgc29tZSBkaXZpZGUtYnktemVybyBjcmFzaCByZXBvcnRzIG9uIENocm9tZU9TIHdoaWNoDQo+
IHBvaW50ZWQgdG8gdGhlIGludGVsX2FkanVzdGVkX3JhdGUgZnVuY3Rpb24uIEZ1cnRoZXIgcHJv
ZGRpbmcgc2hvd2VkDQo+IHRoYXQgSSBjb3VsZCByZXByb2R1Y2UgdGhpcyBpbiBhIHNpbXBsZSB0
ZXN0IHByb2dyYW0gaWYgSSBtYWRlIHNyY19oDQo+IHNvbWUgdmFsdWUgbGVzcyB0aGFuIDEgYnV0
IGdyZWF0ZXIgdGhhbiAwLg0KPiANCj4gVGhpcyBzZWVtZWQgdG8gYmUgYSBzZW5zaWJsZSBwbGFj
ZSB0byBjaGVjayB0aGF0IHRoZSBzb3VyY2UgaGVpZ2h0IGlzIGF0DQo+IGxlYXN0IDEuIEkgdHJp
ZWQgdG8gcmVwcm8gdGhpcyBpc3N1ZSBvbiBhbiBhbWQgZGV2aWNlIEkgaGFkIG9uIGhhbmQsIGFu
ZA0KPiB0aGUgY29uZmlndXJhdGlvbiB3YXMgcmVqZWN0ZWQuDQo+IA0KPiBXb3VsZCBpdCBtYWtl
IHNlbnNlIHRvIGFkZCBhIGNoZWNrIHRoYXQgc291cmNlIGRpbWVuc2lvbnMgYXJlIGF0IGxlYXN0
IDENCj4gc29tZXdoZXJlIGluIGNvcmUsIGxpa2UgaW4gZHJtX2F0b21pY19wbGFuZV9jaGVjaz8g
T3IgaXMgdGhhdCBhIHZhbGlkDQo+IHVzZSBjYXNlIG9uIHNvbWUgZGV2aWNlcywgYW5kIHRodXMg
YW55IHN1Y2ggY2hlY2sgc2hvdWxkIGJlIGRvbmUgb24gYQ0KPiBwZXItZHJpdmVyIGJhc2lzPw0K
PiANCj4gVGhhbmtzLg0KPiANCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvc2tsX3Vu
aXZlcnNhbF9wbGFuZS5jIHwgMiArLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9za2xfdW5pdmVyc2FsX3BsYW5lLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L3NrbF91bml2ZXJzYWxfcGxhbmUuYw0KPiBpbmRleCA0Yjc5YzJkMmQ2MTc3Li45YjE3MmEx
ZTkwZGViIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L3NrbF91
bml2ZXJzYWxfcGxhbmUuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L3Nr
bF91bml2ZXJzYWxfcGxhbmUuYw0KPiBAQCAtMTYyNyw3ICsxNjI3LDcgQEAgc3RhdGljIGludCBz
a2xfY2hlY2tfbWFpbl9zdXJmYWNlKHN0cnVjdCBpbnRlbF9wbGFuZV9zdGF0ZSAqcGxhbmVfc3Rh
dGUpDQo+ICAJdTMyIG9mZnNldDsNCj4gIAlpbnQgcmV0Ow0KPiAgDQo+IC0JaWYgKHcgPiBtYXhf
d2lkdGggfHwgdyA8IG1pbl93aWR0aCB8fCBoID4gbWF4X2hlaWdodCkgew0KPiArCWlmICh3ID4g
bWF4X3dpZHRoIHx8IHcgPCBtaW5fd2lkdGggfHwgaCA+IG1heF9oZWlnaHQgfHwgaCA8IDEpIHsN
Cj4gIAkJZHJtX2RiZ19rbXMoJmRldl9wcml2LT5kcm0sDQo+ICAJCQkgICAgInJlcXVlc3RlZCBZ
L1JHQiBzb3VyY2Ugc2l6ZSAlZHglZCBvdXRzaWRlIGxpbWl0cyAobWluOiAlZHgxIG1heDogJWR4
JWQpXG4iLA0KPiAgCQkJICAgIHcsIGgsIG1pbl93aWR0aCwgbWF4X3dpZHRoLCBtYXhfaGVpZ2h0
KTsNCj4gLS0gDQo+IDIuMzkuMC4zMTQuZzg0YjlhNzEzYzQxLWdvb2cNCj4gDQoNCg==
