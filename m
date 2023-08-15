Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DE777C4BB
	for <lists+dri-devel@lfdr.de>; Tue, 15 Aug 2023 02:49:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECC0C10E131;
	Tue, 15 Aug 2023 00:49:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A89C10E12D;
 Tue, 15 Aug 2023 00:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692060573; x=1723596573;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=hHCMRN0CvYli6BQQqV0eTz39BtA5+206D+DnFR7cAZU=;
 b=dZZViqbo9qTEEiHIYl+xFFRD+C2UMJ5x751PTm1FjAMIq9tzPvZ8tqNf
 DSUxA7mwmPOTH/6Os7MUaFf9tuw/NrVRrf3Sbvlv8e50k5njRuIZ3E/px
 vt9Q3JVuD/0Nmi74lNnAYjeMsao6c3npKqmUMJMVw2XZzYh3Oeo/gXMFp
 q+j2g23kFpc7xXCMUXJ08EHQtgqqPkgFe+qwoVPQdAosFnKRFNQq/Y23q
 2DGcxkUrnRtJ7wULtpjozjBqJOiOutn+IfJmO5KgNXMAuYTWm/ER28hsH
 ZQdjvLiL6a1h27xLTZ+T17Z/QKJGEg0MUYb8wSZBYqoAlxAsRaJr3NB84 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="403151763"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; d="scan'208";a="403151763"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 17:49:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="1064268304"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; d="scan'208";a="1064268304"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 14 Aug 2023 17:49:32 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 14 Aug 2023 17:49:32 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 14 Aug 2023 17:49:32 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 14 Aug 2023 17:49:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PPGIZLeKecddHA+ZHfwLXHyE3kz7KU8zC5tgmnB4LuMAWC19ObqlY03yCf19IXSy2GDQOyrL/JPJhaciy9gPAb+v1eBcX3xUhPBJFl5BVpLNNhZgic1l96C9zuo+0qcMgcPiSsrAVyrsTEW63Qei2DBbORuF74gFcavnFAmeH3FM6G+1wlQOlB60Kh/ZcgG07LPtEb6HLMokb214eXUVIwrTYPSzsXW+InkDV30XLMoHqWW7KAPaOAkVVsu/rBFY0CefWUk1t7HPztRUeBDi8Z0PmeUtERe4FfikhbH3kU3A1AaX92FlwFec/6tf+F113lgzf+g46CryXbkDONFqCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hHCMRN0CvYli6BQQqV0eTz39BtA5+206D+DnFR7cAZU=;
 b=R3P+QGMdmfGPwINxVSFpASYyE8hl6RSrEO5CpO4Moyu3NkIGNLuDfDRoLWWqYHBb9foTaqBwVbgP/8NXreETrctidMSYQfqL6PJ5/znv1AUrFuuFWJxO5OvOLTr+An8TX/HRUm0brm/MPsl5AjGQzqOrGM5lV4STw5YVKd3i2CL5gfqgln+qd7vPeKw/H0Cg5nzZBQ/5iktr86FSHPRuYupcWbDu9LYpUlscC66T97DMsPQG/sIxA3m93ySDbOebeqVKZMpiaEw0GceguuOLDiyBzAwQI1TJl/MJjjqDPgurOsx2tsqNYi2W+HU553YNCvIrYoJVxUUTylHzuhjzWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 PH7PR11MB6548.namprd11.prod.outlook.com (2603:10b6:510:210::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Tue, 15 Aug
 2023 00:49:30 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531%3]) with mapi id 15.20.6678.022; Tue, 15 Aug 2023
 00:49:30 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [Intel-gfx] [PATCH v1 1/3] drm/i915/guc: Flush context
 destruction worker at suspend
Thread-Topic: [Intel-gfx] [PATCH v1 1/3] drm/i915/guc: Flush context
 destruction worker at suspend
Thread-Index: AQHZxZn8zkAN8JKfO0eiHeQDrcMMeK/fJIkAgANbsYCACBlDgA==
Date: Tue, 15 Aug 2023 00:49:30 +0000
Message-ID: <55de694c85fe97cb616682b97e76a4e36e5d1abf.camel@intel.com>
References: <20230802233501.17074-1-alan.previn.teres.alexis@intel.com>
 <20230802233501.17074-2-alan.previn.teres.alexis@intel.com>
 <ZNEvQqeZgvd1XHPV@intel.com>
 <d3231f39c1ff7d5899d4fd194ebed480e1cda1af.camel@intel.com>
In-Reply-To: <d3231f39c1ff7d5899d4fd194ebed480e1cda1af.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|PH7PR11MB6548:EE_
x-ms-office365-filtering-correlation-id: 6a77190a-247e-4487-a0c0-08db9d297c24
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xUs2ghdoXQvlz5SLacH6UkwwA5UhT/F3/iYOmj7/KA6tSKzIRUvl+QTVsQUxenPRRw4vFUDyqH3TSD6lsoy6NOFG2VKkShKtztORAugzn2U5YoXWi+wuKUc2JC93FNtOKZ4I/wUHW/5ZwAGkQ4QAKpa8TGVTEc8GWVHoyDOIH6/HzbJbbg0nLz/hfNRouofIEpGNwoEUmtEeSDXwdn9S5z11D8Epk32/exaORvU1ClE/kj/kXbTjTjzI6OLEc94OzmRmqwC/WEwF4c/RNPbN0IaKR9/w7rw03tuA3QrpwK9mxGmsrSU4uguENjSoEkGueaL4a7R3xLsWsFdk8grnBJaBPGKs91MKa9CdhgUfDGg5PoMRisjZnqM3e8o0z0DGKf2BBlLguRHvxML1ieL1DGsnhxZfyZ83Olapk3XmqoATkCLJ9rRrSKeovG2avfeafFPgRbZiYtzdmNoV07svxd5geamG+0LQxwpwfIPeaDbHnO81/2UM71vb5TzNThVhXRbf/4PotDb9a2fyRcQs6jWeoaRJx3vbkTQFdvlUWJmeY5Jq7LwrtLGIgTTMBqRRASaGBtyYaA2CotwgcTGOvMMGWWEDWI4ePZtjUm/le0c=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(366004)(39860400002)(136003)(346002)(451199021)(186006)(1800799006)(37006003)(54906003)(71200400001)(38100700002)(82960400001)(6486002)(478600001)(5660300002)(122000001)(2906002)(8676002)(6862004)(38070700005)(86362001)(8936002)(36756003)(6636002)(4326008)(66446008)(91956017)(66476007)(64756008)(66556008)(76116006)(66946007)(41300700001)(450100002)(316002)(26005)(6506007)(83380400001)(2616005)(6512007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZGppelg2Znc5SnZjUzIraWR1YUhTOStBQStCQitFVXJhSVJDNmVYWE5jMzh0?=
 =?utf-8?B?MThVMDBIdnJBaVQzeVVPWmNLVEtQZTladHB4QXh2bENqQ1ZwbEtHMzlHVmpU?=
 =?utf-8?B?WkxLRy9KSFAxeW90RFBFZE5UcFJsdzYvYy9sZUR3Z0lNamRTbFlobjZ0Z1h0?=
 =?utf-8?B?c1VNc04xWmw5ajFkUzZDY1JWVFJCczBJVHB5R0wxeW8xMnRsRlpDaVJCWUgz?=
 =?utf-8?B?cW85L3RhenZSeVR6a0xTNzVhU0VkKzVHYkZaNE5LNG4yVkJDNFF2VkxDN1hV?=
 =?utf-8?B?VXRGUjh6V3pvNGN1QnBQRWhtaHRRckVLTmNSelV5ZUNOVHU5d2E0a0tvS29r?=
 =?utf-8?B?VWFIaHJxeEgxTGNaejU0MHdjZ05mTTIrSzcvZ1JBOFdTdTlNYWFTR1VWckho?=
 =?utf-8?B?a2F1Z1R5YUprSWZkVXNXMW9qcisxS1d2eW1DZ0U3Nm5EQXJUdVdKME5KdEs0?=
 =?utf-8?B?T2h3ZDZaUnB6OFdXRU9XRDkwNTRvTzk2S1V5TS9iaGo0cnJhcU1uM24yby9p?=
 =?utf-8?B?bDdOZkVRU0dwUnQ5ZmxSMkd0cVI0Qlk3UFc1TkU3WVJQcTd1VkdydFdFSzNi?=
 =?utf-8?B?bllaelYzWnVwRm1yMjNZekZBNnQ5Yll5TVFOR050ODdmcEFQQ2kyMnBrU0lX?=
 =?utf-8?B?QXVjaktzN05JQ25IMmRMa25ULzFhUFVDYksyTmVFZE1DR3Bld0N2TExTZjFV?=
 =?utf-8?B?U3JYSTZnYTlLd2xuQ3RHQlNuNElraGpyREVXZSttbVNkYmo5YzBQVzJ3WW9i?=
 =?utf-8?B?MDdrSWJBOTRnaGx0aWRDdElEa1c1RUl6cHVsL0hnTHpsakhsbi9UeVRFbG9B?=
 =?utf-8?B?QTk0SVNCNFJQSWtLY0o0aWprZkNZTXJLZHU0RjVrQ2lxaHI5d0J4Y1loUjJY?=
 =?utf-8?B?QlQwaHFBOHl4WEx4aml4RzNhZVJQSGl2WTA4QytmZkxjYS9WTGQ0ZFZoVlpP?=
 =?utf-8?B?d0R6b3RxWTVaMDhUODYwMDVsSVp5YW9hZlFWTlBNenpiOFN4aFAzMi9LSVpk?=
 =?utf-8?B?elhTaFR0RE1VZzZYYnoydmMvV1pJTkJOYU5aOGhmWVM3SkxxT1VOdFRCd1N2?=
 =?utf-8?B?R3JjcUN6cmJnYXRGLzJLV3B5N0VnbWQ3cTRrZWNKanMzQm1UeW9OZ2wwTVRr?=
 =?utf-8?B?eEJJdDVjdFMrM0tTTjZoNzBoR242VnoyZmMyVk9QSloyNVNGeHR6Wmg4dnBH?=
 =?utf-8?B?VCtZOHExZ1Z2WlE1NjFONFB2Rk9tYkErRkg1SnV4WTV2MlhrNlB2eG5XcGJp?=
 =?utf-8?B?YnhjdlBGanFWTTZobDBWaHR1ZkVvTDRxTXRSeVNCZllqSjNuRDluRFhHa20y?=
 =?utf-8?B?aE9MZi8zR0Nvdk9EOVpPWW43K2VleUI1dGpXK3RjeUdOZFJwMGJtU3IxUEYw?=
 =?utf-8?B?SUdkMHJFVk5pbUFNY3BNWWoyVWJ1MU5jNXhBNFNLOGplWXBaSlJMcllrbVRB?=
 =?utf-8?B?Wk1wRnhRS1dIV0FNM0F4TnBtT3B3eEJFaEcxdmkvM1MzT09Ramx3YUhsYmM1?=
 =?utf-8?B?U0tSeDRTWmlYU2JFSFR5a2NxVExuUzBhVml5OHU0RFhqSXZpZmhtSUtIR0lP?=
 =?utf-8?B?ZFgrNXRpN2N6cDBqSXVlNDh4Z05WcmZjbDJzZVdoVm9GTkRibXhRWHh6OWl0?=
 =?utf-8?B?TjZlY2tYR29jZHo3cUR4NTZLcHVwVEw4ZFpGMjFRNzloeWhSN0VlYzNXblM5?=
 =?utf-8?B?ZWFmUVF5bER3T2ttSkphYm1mQmhuTGFjeFYxaGV6ZmQ1MWMrMUxTOVpOcFZh?=
 =?utf-8?B?S0pISlduM1hNMmExVTNSVEJyeHkraXNucmVzaUxWL0FtMXJKNXhkQkIvZmZI?=
 =?utf-8?B?QVBCTzM0V3BSb1pRSEtPQ09GYlJRYmJIb2ZYR0VEck1ZcS9DOThlaHF4VVcv?=
 =?utf-8?B?L3JnSTVVRzVsUnA5c3lac3dMTDljQStnODVwV2VhNmR0a0lHT0d4bXlhaXhX?=
 =?utf-8?B?L3RIbEZ0emVTUmlFYldUUVpBUVdRUTBycjdBK0RMVmlpdEQzSGlOS1JQYmtp?=
 =?utf-8?B?QnJnUmZ0UTZzY1NtRVhhRFloVE5uOTZ1dHlaNnVpcG8yTkhtQUkxaCtvVUNa?=
 =?utf-8?B?M0xwSjAydjRha2pGcDdmR05RUlp1SHo0TG5TWHdJRUZnQlRkU2VSYS85RFpw?=
 =?utf-8?B?STgyOWZKYkh0aDF2dDNTc1R6UWI2azJyK2pDazhUSkMwYmhVZW4wQXNqZUdl?=
 =?utf-8?Q?OatMljdujmOeIoAkTS83qIc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AB56E8F74836C24D97EC8C22156E054E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a77190a-247e-4487-a0c0-08db9d297c24
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2023 00:49:30.4594 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mdZf6Ba5iNoharGqUwbOg73NRzyausQCkMK5xzDoi3aI6Lzg273KCShtwog0ylXhROcEWoNJFfuH8yLFdH4hyoPmrPT4HRpirgzd+OzhPlUr9K2aS6Y9kLnsXbB+M8qh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6548
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiANCg0KPiA+IFJvZHJpZ286IEFuZCB3aHkgaGVyZSBhbmQgbm90IHNvbWUgdXBwZXIgbGF5ZXI/
IGxpa2UgaW4gcHJlcGFyZS4uLi4NCj4gYWxhbjogd2FpdF9mb3Jfc3VzcGVuZCBkb2VzIGJvdGgg
dGhlIGNoZWNraW5nIGZvciBpZGxlIGFzIHdlbGwgYXMgdGhlIHBvdGVudGlhbA0KPiB3ZWRnaW5n
IGlmIGd1YyBvciBodyBoYXMgaHVuZyBhdCB0aGlzIGxhdGUgc3RhdGUuIGlmIGkgY2FsbCBmcm9t
IHRoZSB1cHBlcg0KPiBsYXllciBiZWZvcmUgdGhpcyB3YWl0X2Zvcl9zdXNwZW5kLCBpdCBtaWdo
dCBiZSB0b28gZWFybHkgYmVjYXVzZSB0aGUNCj4gd2FpdC1mb3ItaWRsZSBjb3VsZCBleHBlcmll
bmNlIHdvcmtsb2FkcyBjb21wbGV0aW5nIGFuZCBuZXcgY29udGV4dHMtZGVyaWd0cmF0aW9ucw0K
PiBiZWluZyBxdWV1ZWQuIElmIGkgY2FsbCBpdCBmcm9tIHVwcGVyIGxheWVyIGFmdGVyIHdhaXRf
Zm9yX3N1c3BlbmQsIHRoZW4gaXQgd291bGQNCj4gYmUgdW5uZWNlc3NhcnkgaWYgd2FpdF9mb3Jf
c3VzcGVuZCBkZWNpZGVkIHRvIG51a2UgZXZlcnl0aGluZy7CoEhtbW0uLiBidXQgaSBndWVzcw0K
PiB0aGUgbGF0dGVyIGNvdWxkIHdvcmsgdG9vIC0gc2luY2UgdGhlIG51a2UgY2FzZSB3b3VsZCBo
YXZlIGVtcHRpZWQgb3V0IHRoZSBsaW5rLWxpc3QNCj4gb2YgdGhhdCB3b3JrZXIgYW5kIHNvIGl0
IHdvdWxkIGVpdGhlciBydW4gYW5kIGRvIG5vdGhpbmcgb3Igd291bGQgbm90IGV2ZW4gYmUgcXVl
dWVkLg0KPiBXb3VsZCB5b3UgcmF0aGVyIGkgZ28gdGhhdCB3YXk/IChpJ2xsIHJlY2hlY2sgd2l0
aCBteSB0ZWFtIG1hdGVzIGZvciBpLWRvdHRpbmcvdC1jcm9zc2luZw0KPiBkaXNjdXNzaW9uLg0K
DQphY3R1YWxseSwgYWZ0ZXIgZ29pbmcgdXAgYSBsYXllciwgaSByZWFsaXplIHRoZSByaWdodCBw
bGFjZSBtaWdodCBiZSB0byBpbnNlcnQNCmxhdGUgc3RhZ2Ugd29ya2VyLWZsdXNoaW5nIGludG8g
aW50ZWxfdWNfc3VzcGVuZCAoY2FsbGVkIGZyb20gaW50ZWxfZ3Rfc3VzcGVuZF9sYXRlKQ0Kd2hp
Y2ggaXMgYWxzbyB3aGVyZSB0aGUgZ3NjIHdvcmtlciBpcyBmbHVzaGVkLiBUaGlzIHdpbGwgYWxz
byBtZWFuIHdlIGRvbid0IG5lZWQgdG8NCmNyZWF0ZSBpbnRlbF91Y19zdXNwZW5kX3ByZXBhcmUg
Zm9yIG5ldyBwbHVtYmluZy4NCg==
