Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9475D5A4F2F
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 16:29:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B30110F2F0;
	Mon, 29 Aug 2022 14:29:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0164510F2F0;
 Mon, 29 Aug 2022 14:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661783378; x=1693319378;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=lrqAaPJVAxsHbCNwT//MEtNgLnO9rsF8aBp0YAP22Fc=;
 b=KK5c2sODj+sohngAwipwj5bRTpFuXWI1sktus3Typvd5tiNEqXazAw12
 VtNJAZWPumIUp41YGytomqZq++tLVuYLVhzGc4+KUqk7k4LZEgIBOsr/T
 MjVtdPaCpcEBcIWTUO5lvdECytvS7L7woub9QjP9VSb6fxHeSXOceP9wk
 ejSQKlxKFHIODWXzLJ4Zlukz2cWka/IGS79UqGQF3eHVE7JyodPrrFxL0
 2UwS16RqK8LUEI3YHBT0Zc9GsWUkhL3WY6s3zVn8F1bjjxEqt5BJHvD8q
 8mggWQpqdc1M2Ri3e9HNZ6GbE1CRnTri6Jw6a059B8Zyo0WZzC61S9ODr w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10454"; a="321026598"
X-IronPort-AV: E=Sophos;i="5.93,272,1654585200"; d="scan'208";a="321026598"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2022 07:24:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,272,1654585200"; d="scan'208";a="753644739"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP; 29 Aug 2022 07:24:31 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 29 Aug 2022 07:24:31 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 29 Aug 2022 07:24:30 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 29 Aug 2022 07:24:30 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 29 Aug 2022 07:24:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JZqYj1uRTBMyGrZucTLKQDsWS8U8Z3itL33hwkBKtaJK4TGgT3Y2vzjJirSTymWhTrgLXcsNteICuLvKbqEX5agPMXpgGAy0RUwriXpjdVJ1mod3b+XwOrlPfu9JJOIc9Cnkd1YdRFtXzvpwvueSyNCZr/7q+OauGjvV69PZ1ah62OYolxkUcCLYOiLsEQcEaYCarAAyk3es9PKy1MeK34IZmkoKXwDtgNMEksGHjaH5qeDzYzrgpdzHU5Yu35NEkbdMFksJQuw/cHKXT2wIBGYjYlnDhl/4PTJTnr0tToC0KqYWZSRK19qAsdEESBLo9Cl159bVyZ74MlDtyx3XzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lrqAaPJVAxsHbCNwT//MEtNgLnO9rsF8aBp0YAP22Fc=;
 b=cJ15vlEVe3Y/yzZqNe8PVhtlCPKieACZnuDCUmiZ70q0SKJrEUYBriq+Y2Xq5PBk5tb2VClBY4a/xGV2DyIiLr7uG2K5Sy6lX4AkWoLSyzeaJ0WF0xpjKOH+cTywCJ445eGBggdb4kdyZBl7QbdIRPh1s7ANsfPDV6lJkqAyM5xERW0V1lSEGP/rDT95OzButylUfUm5yhXd/q45Tq5W2uOwM9rpfBDWh3o5JBZcBJiz5j8SPbb9YXrFF7EvSeogjThr8in0mvqeW4JXKLN/ywfEKG4YU841xn2R9HKTTxJbye07qIwzV3yE4AjyNffBC9p5rZxQJonsvIMROoAAeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CO1PR11MB4962.namprd11.prod.outlook.com (2603:10b6:303:99::23)
 by PH0PR11MB5015.namprd11.prod.outlook.com (2603:10b6:510:39::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 29 Aug
 2022 14:24:28 +0000
Received: from CO1PR11MB4962.namprd11.prod.outlook.com
 ([fe80::cc64:11a0:a0c1:93af]) by CO1PR11MB4962.namprd11.prod.outlook.com
 ([fe80::cc64:11a0:a0c1:93af%8]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 14:24:28 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/4] drm/i915: Fix intel_dp_mst_compute_link_config
Thread-Topic: [PATCH 2/4] drm/i915: Fix intel_dp_mst_compute_link_config
Thread-Index: AQHYu43XKY26r7lhEUCZmSzWbjxfHK3F7vqA
Date: Mon, 29 Aug 2022 14:24:28 +0000
Message-ID: <c5db29f6239f7c974b264b6b362bb09fc31fd931.camel@intel.com>
References: <20220829095832.21770-1-stanislav.lisovskiy@intel.com>
 <20220829095832.21770-3-stanislav.lisovskiy@intel.com>
In-Reply-To: <20220829095832.21770-3-stanislav.lisovskiy@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3f29b9b8-1d9d-4461-8a8b-08da89ca2ea0
x-ms-traffictypediagnostic: PH0PR11MB5015:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: m+1ROr3LpOjfhs9ncbcTGEiPteOIN3eGx7L6wTfMj+g+UXpp/dBUT0WalOzczm+7LOf6ZB3y2e9fWWDZI1r8KgR6ia3x3yZim5/VBoYqZL9zd1MaeYJunh+1+/vGuHjEbITUY6Pt7igU+0a/bal7AQ9iCKkyqwBYaWURpMUV6k7+4vO7+aYtOXcWwDBTp7D9QsHZA9dht/JiM6ChGX+2Lv5vp/+EhL+ofwPb1B3HrM3ZraxshpQbekAAizhc+2ENjOIvX2k1JtgYZQgrLD9Pg59BDWMg3tSeq3RFFpw2qHe8WuN1LC2Db7UF46TKHMZ2Iwb+RccTiWEE23EQYUL1QVFrER9q2+KkFggo2KffkTKykJagRVMomCXN/ugffcTn1kYRIp5Qrd0Z1oIPBgC91wH8psPXDIAjXhHz2Iu2P8M17ElkaA/rD/gOqZPGkLrqNVl817vMIq+BKXsMW29aniKwFv0wiEY9eW1j93JdI6p+caURAvkxqsPfJtGcFnytDWh1iQLBt3W1CoI/dOxK3kWIJ/eEmjNenIssou562dZwiABjWxXHq4V7pL3UgYjgJWlWG8Ti7Y+GglY6Wn2lkPEfNdwdDds/8Bcx+JHe7E6LXuU+AnbAw8bHI7zEaX/dC6LER0aQ73xt4/GXNkoz8M59yrha5zP+tnAtF0ywZ81f3XCl2EJyW2bPnO2bfDINH/uWTP/ElQcXQOXpy3fD+EM27H9dKh4UeTCO67j5LqCi+xhYjz8ScFJZOALYnhKkcag2iAvOWoaViIlqo2IF8A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4962.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(396003)(39860400002)(366004)(136003)(346002)(6512007)(86362001)(26005)(71200400001)(478600001)(6486002)(6506007)(41300700001)(107886003)(186003)(122000001)(38100700002)(38070700005)(82960400001)(83380400001)(66476007)(2616005)(64756008)(54906003)(66446008)(110136005)(66946007)(5660300002)(66556008)(8676002)(8936002)(4326008)(316002)(2906002)(36756003)(91956017)(450100002)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d2lPb2pBRlRIcEVES2UxQ0lNYm1Ebm4vUHcxb244dEIvN1ZJVkVFUTdDMWlZ?=
 =?utf-8?B?dDJxM3pHMHRmOWJ5dU1qQ253aWRsU0VhYXRTYUVKYXc5TmVaM2pHU3BGUy9x?=
 =?utf-8?B?YWJpdkdVcmxiekNxOXNUUFlBNFF6dVZpemNtVGpoYys5MndiVnhMZzBkSnVN?=
 =?utf-8?B?dEJ2RGpFTkJycVB2YUxIWEM2QUw5T2ZlS25rRXpaWWYvOU5DTEl3S2ErSmlj?=
 =?utf-8?B?dTFoM0FhdFBZSHVpZTNaZXE4SjFQR0xETk15YXVQTnJOUCtZUCs2Z1pxMHBX?=
 =?utf-8?B?cXNSVGxnWmhtYTRYdjJhWThTNFVQUCtvejVjd20vK2gxc2V1VHJLWnNONFJM?=
 =?utf-8?B?bE55dzQyeE4xL2lISDByRjRFQ1NwSC9yMkpvWnE0VGFZM2N6RmFkV0huUVFE?=
 =?utf-8?B?YzFiTmlLZ3B1R21uU3IvV3pVV0V3b0tCTEhkVXFGbStRYUdDK1BDNlFXbXlj?=
 =?utf-8?B?VndXd1FuSmlWWVJaRjNCbG1mSGV1OHoxM3EzeFN2bUx2NHAyS3F4QWNETzA2?=
 =?utf-8?B?NXhSTURuOE81TmVzU0UrLzk2MFVtRXp1NDVGUVI4SmloTzRIYU1tYUNKeUZB?=
 =?utf-8?B?V3JQS3JXZWc1YmhZaUFESjVmdmdyQnVIR0MzOEhZc05oREpFbnVqT3BxT2dh?=
 =?utf-8?B?KzRzaGR4K1RIamZJNnE3bEVkd1Iybjk3MGxDeGVaTGpRS1IySzUzS29DVHR6?=
 =?utf-8?B?bE1CNjlHL2dHZWZYbjV3aGVDNDZSa0p2SDZWalhpOFpRV01FMVQvQnRDdnVO?=
 =?utf-8?B?OUZ4ckJJbVRiTkRldXRTWFFCNVJiL3hPVXRIWHhlazN3S0JKUkZBVVFGeTd5?=
 =?utf-8?B?NlBhbk9JTUNBYXlpT3BLSytWNjByTzdnQjVyMml3M1luL3NydEhrS2hRVHZL?=
 =?utf-8?B?L0ZOcmV2VHdTRitNajZRejBwRFp2NmQySDRsM0JOREpUd0l4ZjcvN3JYK3c1?=
 =?utf-8?B?dFpxcVJhUlg4RFdBNzkxVzNWLzhKZEhwL0hMaHVHNE14NzE1eHk3dXZMZVZO?=
 =?utf-8?B?NVRDZEtRYmZBdmJGUWo4UnJjRlJ5UENrbnViVi95UEUwUnJXRzFObmJmdmtX?=
 =?utf-8?B?dEk1SGNoUURYS2ZHUURpM0VJYkNlV1BNUHczSFJMZElTR0pwR29EUzNzdmpk?=
 =?utf-8?B?Vm8rYVdOWWxScEVFeHQraWVVZFptYUhRV3A2YWRuNmorSkxPbzdHeDNwMjFx?=
 =?utf-8?B?YU4yNFFZek9ncUF0Wi9TcCtxdUZMd1p2NHNzaE4wdm0xb0VmY1FOS2w4OWw5?=
 =?utf-8?B?OE5Cc1lna3NFcUdoTmVqRUM5NlpoNFA1VWQvb1krMkhBb0x0YkJNcjFjc0tF?=
 =?utf-8?B?Y2hWOXZLaVRSUk9VbkdBUVJrblhpN3lYYlY4a1JqWE9Jckw4YW5IK1dITGN0?=
 =?utf-8?B?cnNQQnlCYk1CbXRiWm1VSmwyd0YvSlVxT2tBSjBWckdYNEcyN1RqbkNETXdE?=
 =?utf-8?B?Um9mWW1TQzdxRFlqcmsxcW53SUdLT2srQy9LbEhHSmJrY3YrRlZmWUpoTkRO?=
 =?utf-8?B?dVdSWnc1SmhSQUlRNFAyU0ZHTHc5bXg4NkhsVi9NRmpkTnpBZGhQVjYvbmhU?=
 =?utf-8?B?UVh2SzlBQ0liS2hsSTlNY2NNNW9wYXRFaGIwcS9VUnVVU2FNMUJtQ2t1L1pK?=
 =?utf-8?B?MjRxeGJ4cUpISWE4bnlSU0tEU0ZPOWo4VHJDcEcxOXpRN2VESTdZNmQ1WU9Q?=
 =?utf-8?B?Z0E3aWNNMTlvWk8yYUZRbFpZWWdYRU4xV0wzSEdYYzh5dElKV0ZEclNYNzgr?=
 =?utf-8?B?M3V6d1dYRWVOSmtBdFhFeDlLaWdRLzhhQzRCdTFJSmczejZwTFc5YUd2Z3BZ?=
 =?utf-8?B?WitLRDRHUnpGSmQvbnhYczdnakI4eG5uMHkwbDg4SG52a1Q3V01SSXFPN2Jv?=
 =?utf-8?B?bVBrMDBqOTJTZEdDYU83Q3cvQkhyK2JicENqYUFtbndtdDdwbUthWFdKOEsy?=
 =?utf-8?B?MmxkUnhBeVRhbmExeTV5aEtFcGlhcTZtR1pQSmlmUXhHcFJ2YzBUV2VWMVFW?=
 =?utf-8?B?Qzk3UEliWE96cjllMVhTY0lZcGo0MHluK1hnM1NMdjFTbE41UUd4R2pkc0No?=
 =?utf-8?B?dWltSktOUmxoV2g0M1U5QkMzU245cHdQYVRXdUgwRVlUUnR6eENUMElDQ1Ji?=
 =?utf-8?B?OXNZRTBtdlhhUFcybjBhMERHb0JQbDRJY1NCcjIzM0ZPaFRtQ24xMTRnN3VP?=
 =?utf-8?Q?Vlq67Kj+4J/c16sJ5ewbCcc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CDF844C1AB566949B7850E60FF0C2777@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4962.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f29b9b8-1d9d-4461-8a8b-08da89ca2ea0
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2022 14:24:28.4862 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BSZwOf48PbfwIKXD5QTcqHIbAfxKI/hsyZBOZC+B1AIOSdW3iUfb32tbwU8KRIiLbEe2ezt1nLUDcqOrp09dZBgAroutrgXKKySO2CKbewU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5015
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
Cc: "Nikula,
 Jani" <jani.nikula@intel.com>, "Navare, Manasi D" <manasi.d.navare@intel.com>,
 "Saarinen, Jani" <jani.saarinen@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IFZpbm9kIEdvdmluZGFwaWxsYWkgPHZpbm9kLmdvdmluZGFwaWxsYWlAaW50
ZWwuY29tPgoKCk9uIE1vbiwgMjAyMi0wOC0yOSBhdCAxMjo1OCArMDMwMCwgU3RhbmlzbGF2IExp
c292c2tpeSB3cm90ZToKPiBXZSBjdXJyZW50bHkgYWx3YXlzIGV4aXQgdGhhdCBicHAgbG9vcCBi
ZWNhdXNlIGRybV9kcF9hdG9taWNfZmluZF92Y3BpX3Nsb3RzCj4gZG9lc24ndCBjYXJlIGlmIHdl
IGFjdHVhbGx5IGNhbiBmaXQgdGhvc2Ugb3Igbm90Lgo+IEkgdGhpbmsgdGhhdCB3YXNuJ3QgdGhl
IGluaXRpYWwgaW50ZW50aW9uIGhlcmUsIGVzcGVjaWFsbHkgd2hlbgo+IHdlIGtlZXAgdHJ5aW5n
IHdpdGggbG93ZXIgYnBwcywgd2UgYXJlIHN1cHBvc2VkIHRvIGtlZXAgdHJ5aW5nCj4gdW50aWwg
d2UgYWN0dWFsbHkgZmluZCBzb21lIF93b3JraW5nXyBjb25maWd1cmF0aW9uLCB3aGljaCBpc24n
dCB0aGUKPiBjYXNlIGhlcmUuCj4gU28gYWRkZWQgdGhhdCBkcm1fZHBfbXN0X2NoZWNrIGhlcmUs
IHNvIHRoYXQgd2UgY2FuIG1ha2Ugc3VyZQo+IHRoYXQgdHJ5IGFsbCB0aGUgYnBwcyBiZWZvcmUg
d2UgZmFpbC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBTdGFuaXNsYXYgTGlzb3Zza2l5IDxzdGFuaXNs
YXYubGlzb3Zza2l5QGludGVsLmNvbT4KPiAtLS0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfZHBfbXN0LmMgfCAxNiArKysrKysrKysrKysrKy0tCj4gwqAxIGZpbGUgY2hh
bmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9tc3QuYwo+IGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9tc3QuYwo+IGluZGV4IDEzYWJlMmIyMTcwZS4u
YzRmOTJlZGJkZDA4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfZHBfbXN0LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X2RwX21zdC5jCj4gQEAgLTYwLDYgKzYwLDcgQEAgc3RhdGljIGludCBpbnRlbF9kcF9tc3RfY29t
cHV0ZV9saW5rX2NvbmZpZyhzdHJ1Y3QgaW50ZWxfZW5jb2RlciAqZW5jb2RlciwKPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCZjcnRjX3N0YXRlLT5ody5hZGp1c3RlZF9tb2RlOwo+
IMKgwqDCoMKgwqDCoMKgwqBib29sIGNvbnN0YW50X24gPSBkcm1fZHBfaGFzX3F1aXJrKCZpbnRl
bF9kcC0+ZGVzYywgRFBfRFBDRF9RVUlSS19DT05TVEFOVF9OKTsKPiDCoMKgwqDCoMKgwqDCoMKg
aW50IGJwcCwgc2xvdHMgPSAtRUlOVkFMOwo+ICvCoMKgwqDCoMKgwqDCoGludCByZXQgPSAwOwo+
IMKgCj4gwqDCoMKgwqDCoMKgwqDCoG1zdF9zdGF0ZSA9IGRybV9hdG9taWNfZ2V0X21zdF90b3Bv
bG9neV9zdGF0ZShzdGF0ZSwgJmludGVsX2RwLT5tc3RfbWdyKTsKPiDCoMKgwqDCoMKgwqDCoMKg
aWYgKElTX0VSUihtc3Rfc3RhdGUpKQo+IEBAIC04NSwxMCArODYsMjEgQEAgc3RhdGljIGludCBp
bnRlbF9kcF9tc3RfY29tcHV0ZV9saW5rX2NvbmZpZyhzdHJ1Y3QgaW50ZWxfZW5jb2RlciAqZW5j
b2RlciwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGNvbm5lY3Rvci0+cG9ydCwgY3J0Y19zdGF0ZS0+cGJuKTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoGlmIChzbG90cyA9PSAtRURFQURMSykKPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gc2xvdHM7Cj4gLcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoGlmIChzbG90cyA+PSAwKQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYnJlYWs7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGlmIChzbG90cyA+PSAwKSB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqByZXQgPSBkcm1fZHBfbXN0X2F0b21pY19jaGVjayhzdGF0ZSk7
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAvKgo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogSWYgd2UgZ290
IHNsb3RzID49IDAgYW5kIHdlIGNhbiBmaXQgdGhvc2UgYmFzZWQgb24gY2hlY2sKPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIHRoZW4gd2UgY2FuIGV4
aXQgdGhlIGxvb3AuIE90aGVyd2lzZSBrZWVwIHRyeWluZy4KPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqLwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKCFyZXQpCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYnJlYWs7Cj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0KPiDCoMKgwqDCoMKgwqDCoMKgfQo+IMKgCj4gK8Kg
wqDCoMKgwqDCoMKgLyogRGVzcGl0ZSBzbG90cyBhcmUgbm9uLXplcm8sIHdlIHN0aWxsIGZhaWxl
ZCB0aGUgYXRvbWljIGNoZWNrICovCj4gK8KgwqDCoMKgwqDCoMKgaWYgKHJldCAmJiBzbG90cyA+
PSAwKQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzbG90cyA9IHJldDsKPiArCj4g
wqDCoMKgwqDCoMKgwqDCoGlmIChzbG90cyA8IDApIHsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGRybV9kYmdfa21zKCZpOTE1LT5kcm0sICJmYWlsZWQgZmluZGluZyB2Y3BpIHNs
b3RzOiVkXG4iLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBzbG90cyk7Cgo=
