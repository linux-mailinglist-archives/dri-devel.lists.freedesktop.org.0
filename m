Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A7456BB22
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 15:49:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26A1F10E5A9;
	Fri,  8 Jul 2022 13:49:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED6DF10E5A9;
 Fri,  8 Jul 2022 13:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657288141; x=1688824141;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hECzVxvejstrkWC1edBtBGp1cro85fefWm6NTgJ3XFI=;
 b=NeJ21Y3OQnJz/CnuMlQYNLWElackcA29maz3vZ2xF1ujBi9z2Qdx//lM
 qB/q04JUWoAJ3DstjQ7ILpF2Z09a9lePQJaJT4fKylvB3elALqy+JzAO/
 QA173tLZdgUJ+WQpqRe/g6Yi9ldyXmUgtpDT2zE4ZgVFoi4tzQrnNRm2F
 u0KpDeM5mFyZU2i92BWr9IfJXGPOR/NDlkZsGe6K5mxUq2rKdd/J7B4X6
 Guqct2X13tzNZAyRscusfcKg/xqLgSBOPiZrVMh7Je7OQAuvDi1Ca1VUV
 dJxMpHYsE3ro2PkcqQKm2IO7LYdlmL7hrMFOcCCjz2god0w5aILueu3xy w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="370596249"
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; d="scan'208";a="370596249"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 06:48:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; d="scan'208";a="661776514"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga004.fm.intel.com with ESMTP; 08 Jul 2022 06:48:59 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 8 Jul 2022 06:48:58 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 8 Jul 2022 06:48:58 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 8 Jul 2022 06:48:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=haThsbJy2LLxEFUxU4ube/i7Ni57+VnKXymm22oOrWcx1HH1H9h2XUusMCapJvScs+LmJzUpE993RN+cDBzT+oqawNXhveCjC33O/DSWxfznLj4ZtXdaZFAlSndxiE1cDjLsKCiW87bZbsM8n8yfdjm/9fZkfOEt+PNmhltArmsIxvYJvaa3BYzzXB1bVBKVuY4yD2A2WAlBcvL3zL3p3FGYU74lAOxkPiT47rpycbdPKBuoFuoh+I5fqYlOLsqzvZy8cordU20ImPeWvSgycxy1OuF53ewY8rcP2V8J+nRyCCYBXh9j+dYUijxc2jqHS0hpaEPhVsB88R0EM5IlGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hECzVxvejstrkWC1edBtBGp1cro85fefWm6NTgJ3XFI=;
 b=CQ2t55Qh0yAnLEdRefzCTRDU4dR1YSDqeLTTju7MJ+GktuKeYfReidQJYmJ6jpBBQTe3LqWi2zyqxPmuYQFGCJQGRTVegpfqR1TAo0gOGJBZcGUGryExOUnA6TTKYehEWlhOvla6K7H02YQqwWQdDhPixPbvrsX0tPpAXCowH4z8SIYR7HT7EOmpUMrFLSeLdRAKBX8FdNns6i/rwNOrN3CDm1w/+bcwGXj18YxSKQkUmHPjcLWWPvdy5QV2PfbvMJpmPHiV53Hf8NwSFoXGOD3Jq7zuhdploVZzE+ndW43pwEtRk92kj1avnzie0vHVpWljNqlX/doXAdQdsLsUcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR11MB1324.namprd11.prod.outlook.com (2603:10b6:3:15::14) by
 BL3PR11MB6458.namprd11.prod.outlook.com (2603:10b6:208:3bd::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.16; Fri, 8 Jul 2022 13:48:56 +0000
Received: from DM5PR11MB1324.namprd11.prod.outlook.com
 ([fe80::79c1:20d:d786:eba9]) by DM5PR11MB1324.namprd11.prod.outlook.com
 ([fe80::79c1:20d:d786:eba9%11]) with mapi id 15.20.5417.021; Fri, 8 Jul 2022
 13:48:56 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH 4/6] drm/ttm: audit bo->resource usage v2
Thread-Topic: [Intel-gfx] [PATCH 4/6] drm/ttm: audit bo->resource usage v2
Thread-Index: AQHYkevzHRSLvAjtu0autaPru66Wma10fwhQ
Date: Fri, 8 Jul 2022 13:48:56 +0000
Message-ID: <DM5PR11MB1324FE467849C196BC022EFBC1829@DM5PR11MB1324.namprd11.prod.outlook.com>
References: <20220707102453.3633-1-christian.koenig@amd.com>
 <20220707102453.3633-5-christian.koenig@amd.com>
In-Reply-To: <20220707102453.3633-5-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.500.17
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d7134d23-8c48-4fe8-0181-08da60e89a4f
x-ms-traffictypediagnostic: BL3PR11MB6458:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gdlgoEL/NeLWIFyVw+QK6C2j1bqXtLLpYMjRvUfL1caXn8wsIYhkTJH2PB4vXEDVnFr22k6zLjeFTRmvBE2dNYhlpPTQBjKF3x5IbDdnC0ospB9lYJMFl6rcg+TuTXAZym535L4+30vM93M9At8u1KCU9XgRGXY8EN5zf2rWvWWicWF5SL488kLfK+rWP9cu9gUK39WdxgPAYH8KRgii1LEsTci96bjRXzsp+O2ZN+E/78Omn5n2L72w0xjIvuAJHEAlmcgqjdARwoQnPNv5nzm+g7TcWlnfcyALgZxHIuXn7pBfq1u4bp1qMv//ne16LyL+yJv+vTOihL/Hep0W5ghgmQxNUFIYIpfEB+0POFDBQ2602FFpkykdKdte4G/O/tzp1vbGEsUVqzpbOSLI5xxcbj03myv2LWXysi1VgGonJTLgaYXuuCRizza3bbfO1DfvRGe+DOdpEX7IvCluNtxwXnZ7o8jmbSQUJqHimSh4JOaD53pGyp+VZdZeITs2aExMoU+KlkHbG6Zs+IuTsgjlsUrxwgKmOTXCYghR5pM05uxlltHnzJwrInkr847XL+VL4obBgysLDGFyHZzJ86Rf+ZgnSF2WPSPrAXXJLXywSDEek2uo/RL1ehMvmgIpMSZGTY8L014jkAsVJ1SMZsVXjN7XL1w/0wYoxKxDp6tMMfS6SpveXIIxggpLOoabJoHCj8GkaGkBe8qPgWz2gyJ5EezxopOIUzOlWc+SDz6ppgP6hCsQO+ZMY1HnsfKmE5JD8Mr1tWFgv/HngN213tB7Pte8RGFSGAtI7agAsUOj4csa20J2WNqvn/Bj9RWQ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1324.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(396003)(376002)(136003)(39860400002)(346002)(41300700001)(66446008)(2906002)(82960400001)(186003)(83380400001)(316002)(5660300002)(33656002)(66946007)(4326008)(122000001)(66476007)(71200400001)(38100700002)(8676002)(38070700005)(66556008)(52536014)(76116006)(8936002)(9686003)(6506007)(110136005)(26005)(64756008)(478600001)(66574015)(55016003)(86362001)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MXAvNkNOYmdOZFZPSDY2Qzg0U1ZkNG1jQW1TVmdPNXJZRnQyMTYwY0hMRXU3?=
 =?utf-8?B?c2thSlpxOG9menNYTTV4SmF6V3ZvT1JCNWgwMGU4b3JpTWdwbTlGTk9KSlBa?=
 =?utf-8?B?L1VkK0NqUFczNkxJaUxUdVZ5YnJ1QTRjS1BUcSt0N0R3STZIaFNuNE1GQU9V?=
 =?utf-8?B?d2diaWkwakdUSSt3SVhjbTVMSnFTbHA0VjhYeGx0MVJRNm9iY3prZVowUXlp?=
 =?utf-8?B?Rk92M251NzJEQmtMS0J4WXFWSEZ0K09RNmJaVUt0UEE0dUtkQ2ZVL0RlTlVD?=
 =?utf-8?B?bGRzOE5aNHIySjVsTGY5cnZ3aFltTGVyNWx5dWxmdzExUElNZFFSQzZWSStj?=
 =?utf-8?B?U0VHNkEvb3YrT0ZPOXZ4Q25PNS9IVzZyNjk3YnpXdHJRY3ZvWjVObjNRVjJG?=
 =?utf-8?B?dkhRaW9iSXlGa254akEydWgwc2MwbUlNUVFrU00vdVFzbHBCU2R4SHcwbWsx?=
 =?utf-8?B?cGM4TW9FaWx4bm43ZDlOWEFtNE1CbnpibVNGZ3MxdlE4aEI1YW1QTnF4c1p2?=
 =?utf-8?B?QXhBZ1BMTDVHWnpYb3IwT3doYTBHYndrVzBwZGx0QkUxazZ0RGlTMC9Qbm5E?=
 =?utf-8?B?bDZxZFBrZm03NkVkQnF3SHFmUjdiZ1o3R25ZVnhEOFR3U3BwbTY4dXpmZVU4?=
 =?utf-8?B?Z2ZqWjVuV1AvNHUrVDFPcjNJWnNZOEdsSGVaY0plMFZncndFTGJaRVZGbjRL?=
 =?utf-8?B?d1JqU0k2aFhVTWJDZTNRdEk0TWFFeU9xaGFoQUdLakxxNkwyRDE2dFM0RGZM?=
 =?utf-8?B?S1pqeXQ3bjNjK1hxNjZjNnd0N0lKRStpQ3ZOckF3ZkZ6ajMzeXo3bHNLREhu?=
 =?utf-8?B?Z2ljMTRXVWgwWEM5Q0V6R1FSQUd6UElrOFJMakliQng1T3VyaDJ1aG1LZHRi?=
 =?utf-8?B?aEdFQXh2VUNBMTU2Z2p3S2F2OWVpNTZKZ2YzL0IwN0hDZVJmMVdIVXdGYkpv?=
 =?utf-8?B?c3NZL0NvNmR0THZva0paT2dsQ2ttZ1dqMTZDd0dnc3pUZEwzNHI5RnhLUWd5?=
 =?utf-8?B?UmtiQkFHZGFHZk1QVWdXUnZtNXJRcjFGblBmbW95dGlZYnRzcVp5SXphQmEy?=
 =?utf-8?B?VjBOSGViRE9ITVQ5YnVwWTJpQzFqb1J5WW8vU0ZtTVJvVk9ROUFxM3F0eEor?=
 =?utf-8?B?RGpiZG1IL2dNaC9vTFBwMEVaMHRyVnp5eitFMG1HQy9FdFlueEZuUDR2ajBp?=
 =?utf-8?B?bThVL1RHN3g2dFlSNTh5amZpSE95aXU1WTgycGZOdkMrUnBrV1htQTg2eTNX?=
 =?utf-8?B?SENWSFRUaGVMVTAzZnB1T1JXekhnMEJtVFIraTN0L3VKaTNROTlIa0VZc0Fj?=
 =?utf-8?B?bUZaVC92SlhBN1lYbUlneitRRFhad1FqeHFtNHIyZ3oyYU1rL1JaOHRibzRU?=
 =?utf-8?B?MUtoNkgyakczdExSTXpLQ1UyTndodmZPMk5rSWwreHJFOXBZRnBKeXNZSHdU?=
 =?utf-8?B?MGNoK3RlNzZWTkI3aXVoek8rZmNOMUl0ZGdyT1A0anFqYTc4RlowV3Jua3FH?=
 =?utf-8?B?bWZkcW9EdkRlOVNOdmtsVGJsczdIdHdUNGpOcnBIVHVyVWdKc3dwc01kR0NM?=
 =?utf-8?B?enRxcll0YVhzUjc4eml4NXo4R29OZ1RZLy9GVFArbmRVYlB2UzF6blZPWkJW?=
 =?utf-8?B?VndiMVBzLzZvOGZ0VzAvamNUN2NrSnFhNUVOaU9xVjdDOEpJb0F4U3V3dnNW?=
 =?utf-8?B?U3Z1TFlIY3pKc3dhU2lVMldsdUlmcHVHQjNuT2ZVUU1pQy9xSHpxUk1Ed2tQ?=
 =?utf-8?B?bEsweDUwRjBRRmtSTjhocG5qUkZDM2liOERxVWRBODlJOTRPdm1XWFpJRVlF?=
 =?utf-8?B?QjhkMGxTMEY0ZnVqYlFwb2lZTFhhRnh1RlR4NzMxUmk0SDFGNXB0Q2pkM3FO?=
 =?utf-8?B?MWRLZ0pZOVRhblRCUWIvR0NDUXlweGd2eWVnbmFGR1VEY0RpRmhSMFRpdkZv?=
 =?utf-8?B?bXFGenZCajlvVk5qakR1MWdDRGtOZDVlUDhrbTFCZ3lqc2FRQWYvL0l6Mkpu?=
 =?utf-8?B?R2JJTzc2L0sxV2svTC92Y2ZpUXQxYW1CUmRWYTNEZHl2b0t4V3RWTXlRR21P?=
 =?utf-8?B?SjVhbDlYNDB6WTl6bURaSVpobks4SW9vZmdEUUZDZFBIMlJZQlFoYmNHTG5B?=
 =?utf-8?Q?OMIJ3+GmxIRg0wiYg5gLeQLuX?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1324.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7134d23-8c48-4fe8-0181-08da60e89a4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2022 13:48:56.3425 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S9jtDKblYFSY2wrdfvahswD4IO0zHnuZKbEHKqB5GkrX0PoEymYzIJYEt8DMk74kcTuWcTBrjmCW24bGVJzs7GUkDSJzzf/AciyJ+XkWaYM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6458
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
Cc: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IEludGVsLWdmeCA8aW50ZWwt
Z2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YNCj5DaHJpc3Rp
YW4gS8O2bmlnDQo+U2VudDogVGh1cnNkYXksIEp1bHkgNywgMjAyMiA2OjI1IEFNDQo+VG86IGlu
dGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmc7DQo+bm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnDQo+Q2M6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1k
LmNvbT4NCj5TdWJqZWN0OiBbSW50ZWwtZ2Z4XSBbUEFUQ0ggNC82XSBkcm0vdHRtOiBhdWRpdCBi
by0+cmVzb3VyY2UgdXNhZ2UgdjINCj4NCj5BbGxvdyBCT3MgdG8gZXhpc3Qgd2l0aG91dCBiYWNr
aW5nIHN0b3JlLg0KPg0KPnYyOiBoYW5kbGUgdHRtX2JvX21vdmVfbWVtY3B5IGFzIHdlbGwuDQo+
DQo+U2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQu
Y29tPg0KDQpSZXZpZXdlZC1ieTogTWljaGFlbCBKLiBSdWhsIDxtaWNoYWVsLmoucnVobEBpbnRl
bC5jb20+DQoNCk0NCg0KPi0tLQ0KPiBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jICAgICAg
fCAxNiArKysrKysrKy0tLS0tLS0tDQo+IGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3V0aWwu
YyB8ICA3ICsrKysrLS0NCj4gMiBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAxMCBk
ZWxldGlvbnMoLSkNCj4NCj5kaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8u
YyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMNCj5pbmRleCA5ODQ1MzVkNmEyZDAuLmEy
ZjQ5YmRkYThhMSAxMDA2NDQNCj4tLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jDQo+
KysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYw0KPkBAIC0xMTcsMTIgKzExNywxMyBA
QCBzdGF0aWMgaW50IHR0bV9ib19oYW5kbGVfbW92ZV9tZW0oc3RydWN0DQo+dHRtX2J1ZmZlcl9v
YmplY3QgKmJvLA0KPiAJCQkJICBzdHJ1Y3QgdHRtX29wZXJhdGlvbl9jdHggKmN0eCwNCj4gCQkJ
CSAgc3RydWN0IHR0bV9wbGFjZSAqaG9wKQ0KPiB7DQo+LQlzdHJ1Y3QgdHRtX3Jlc291cmNlX21h
bmFnZXIgKm9sZF9tYW4sICpuZXdfbWFuOw0KPiAJc3RydWN0IHR0bV9kZXZpY2UgKmJkZXYgPSBi
by0+YmRldjsNCj4rCWJvb2wgb2xkX3VzZV90dCwgbmV3X3VzZV90dDsNCj4gCWludCByZXQ7DQo+
DQo+LQlvbGRfbWFuID0gdHRtX21hbmFnZXJfdHlwZShiZGV2LCBiby0+cmVzb3VyY2UtPm1lbV90
eXBlKTsNCj4tCW5ld19tYW4gPSB0dG1fbWFuYWdlcl90eXBlKGJkZXYsIG1lbS0+bWVtX3R5cGUp
Ow0KPisJb2xkX3VzZV90dCA9IGJvLT5yZXNvdXJjZSAmJg0KPisJCXR0bV9tYW5hZ2VyX3R5cGUo
YmRldiwgYm8tPnJlc291cmNlLT5tZW1fdHlwZSktDQo+PnVzZV90dDsNCj4rCW5ld191c2VfdHQg
PSB0dG1fbWFuYWdlcl90eXBlKGJkZXYsIG1lbS0+bWVtX3R5cGUpLT51c2VfdHQ7DQo+DQo+IAl0
dG1fYm9fdW5tYXBfdmlydHVhbChibyk7DQo+DQo+QEAgLTEzMCwxMSArMTMxLDExIEBAIHN0YXRp
YyBpbnQgdHRtX2JvX2hhbmRsZV9tb3ZlX21lbShzdHJ1Y3QNCj50dG1fYnVmZmVyX29iamVjdCAq
Ym8sDQo+IAkgKiBDcmVhdGUgYW5kIGJpbmQgYSB0dG0gaWYgcmVxdWlyZWQuDQo+IAkgKi8NCj4N
Cj4tCWlmIChuZXdfbWFuLT51c2VfdHQpIHsNCj4rCWlmIChuZXdfdXNlX3R0KSB7DQo+IAkJLyog
WmVybyBpbml0IHRoZSBuZXcgVFRNIHN0cnVjdHVyZSBpZiB0aGUgb2xkIGxvY2F0aW9uIHNob3Vs
ZA0KPiAJCSAqIGhhdmUgdXNlZCBvbmUgYXMgd2VsbC4NCj4gCQkgKi8NCj4tCQlyZXQgPSB0dG1f
dHRfY3JlYXRlKGJvLCBvbGRfbWFuLT51c2VfdHQpOw0KPisJCXJldCA9IHR0bV90dF9jcmVhdGUo
Ym8sIG9sZF91c2VfdHQpOw0KPiAJCWlmIChyZXQpDQo+IAkJCWdvdG8gb3V0X2VycjsNCj4NCj5A
QCAtMTYwLDggKzE2MSw3IEBAIHN0YXRpYyBpbnQgdHRtX2JvX2hhbmRsZV9tb3ZlX21lbShzdHJ1
Y3QNCj50dG1fYnVmZmVyX29iamVjdCAqYm8sDQo+IAlyZXR1cm4gMDsNCj4NCj4gb3V0X2VycjoN
Cj4tCW5ld19tYW4gPSB0dG1fbWFuYWdlcl90eXBlKGJkZXYsIGJvLT5yZXNvdXJjZS0+bWVtX3R5
cGUpOw0KPi0JaWYgKCFuZXdfbWFuLT51c2VfdHQpDQo+KwlpZiAoIW9sZF91c2VfdHQpDQo+IAkJ
dHRtX2JvX3R0X2Rlc3Ryb3koYm8pOw0KPg0KPiAJcmV0dXJuIHJldDsNCj5AQCAtOTA0LDcgKzkw
NCw3IEBAIGludCB0dG1fYm9fdmFsaWRhdGUoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywN
Cj4gCS8qDQo+IAkgKiBDaGVjayB3aGV0aGVyIHdlIG5lZWQgdG8gbW92ZSBidWZmZXIuDQo+IAkg
Ki8NCj4tCWlmICghdHRtX3Jlc291cmNlX2NvbXBhdChiby0+cmVzb3VyY2UsIHBsYWNlbWVudCkp
IHsNCj4rCWlmICghYm8tPnJlc291cmNlIHx8ICF0dG1fcmVzb3VyY2VfY29tcGF0KGJvLT5yZXNv
dXJjZSwNCj5wbGFjZW1lbnQpKSB7DQo+IAkJcmV0ID0gdHRtX2JvX21vdmVfYnVmZmVyKGJvLCBw
bGFjZW1lbnQsIGN0eCk7DQo+IAkJaWYgKHJldCkNCj4gCQkJcmV0dXJuIHJldDsNCj5kaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdXRpbC5jDQo+Yi9kcml2ZXJzL2dwdS9k
cm0vdHRtL3R0bV9ib191dGlsLmMNCj5pbmRleCAxY2JmYjAwYzFkNjUuLjE1MzA5ODIzMzhlOSAx
MDA2NDQNCj4tLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMNCj4rKysgYi9k
cml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMNCj5AQCAtMTM3LDggKzEzNyw3IEBAIGlu
dCB0dG1fYm9fbW92ZV9tZW1jcHkoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0DQo+KmJvLA0KPiAJ
CXR0bV9tYW5hZ2VyX3R5cGUoYm8tPmJkZXYsIGRzdF9tZW0tPm1lbV90eXBlKTsNCj4gCXN0cnVj
dCB0dG1fdHQgKnR0bSA9IGJvLT50dG07DQo+IAlzdHJ1Y3QgdHRtX3Jlc291cmNlICpzcmNfbWVt
ID0gYm8tPnJlc291cmNlOw0KPi0Jc3RydWN0IHR0bV9yZXNvdXJjZV9tYW5hZ2VyICpzcmNfbWFu
ID0NCj4tCQl0dG1fbWFuYWdlcl90eXBlKGJkZXYsIHNyY19tZW0tPm1lbV90eXBlKTsNCj4rCXN0
cnVjdCB0dG1fcmVzb3VyY2VfbWFuYWdlciAqc3JjX21hbjsNCj4gCXVuaW9uIHsNCj4gCQlzdHJ1
Y3QgdHRtX2ttYXBfaXRlcl90dCB0dDsNCj4gCQlzdHJ1Y3QgdHRtX2ttYXBfaXRlcl9saW5lYXJf
aW8gaW87DQo+QEAgLTE0Nyw2ICsxNDYsMTAgQEAgaW50IHR0bV9ib19tb3ZlX21lbWNweShzdHJ1
Y3QgdHRtX2J1ZmZlcl9vYmplY3QNCj4qYm8sDQo+IAlib29sIGNsZWFyOw0KPiAJaW50IHJldCA9
IDA7DQo+DQo+KwlpZiAoIXNyY19tZW0pDQo+KwkJcmV0dXJuIDA7DQo+Kw0KPisJc3JjX21hbiA9
IHR0bV9tYW5hZ2VyX3R5cGUoYmRldiwgc3JjX21lbS0+bWVtX3R5cGUpOw0KPiAJaWYgKHR0bSAm
JiAoKHR0bS0+cGFnZV9mbGFncyAmIFRUTV9UVF9GTEFHX1NXQVBQRUQpIHx8DQo+IAkJICAgIGRz
dF9tYW4tPnVzZV90dCkpIHsNCj4gCQlyZXQgPSB0dG1fdHRfcG9wdWxhdGUoYmRldiwgdHRtLCBj
dHgpOw0KPi0tDQo+Mi4yNS4xDQoNCg==
