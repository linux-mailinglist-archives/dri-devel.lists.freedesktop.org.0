Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3E756BB50
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 15:57:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 673A610E97C;
	Fri,  8 Jul 2022 13:57:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38B1410E92B;
 Fri,  8 Jul 2022 13:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657288622; x=1688824622;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=elGXe/q2uvFwNGVzioXn/N3Gf55T2KRUmkBGgZUMvr4=;
 b=eNrAp+JyY8gMbhZANjXCo/ny12hpqDADAuYWul0shsod/LaWokHav5v/
 5akNOd6EU/NMZGGgGdMrrNBnKanm0YPDjjWl06ls77sHqHBbr8SB4xxFg
 SXLhToBWscyXiup0rF1ize5MxXFE+67ZAMazRljuix9YyOhC5c1vxtIwl
 XvNOkarikEYnic2gdBARxwZrSU7U8Xg2g16tPApGEXV54y8syzWffxd4R
 +EHPpl+CTc4Y5LVWzWv7tGSM6ZZfAA84HSE199EyJG3uDY7Jfc4h1YJaY
 zWVe1jj2ophWJyl2Rn+56YxE0SGbZxe4i8yTu5FhWizD7egBoA4ZOCL45 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="267315485"
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; d="scan'208";a="267315485"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 06:57:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; d="scan'208";a="651572908"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 08 Jul 2022 06:57:01 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 8 Jul 2022 06:57:00 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 8 Jul 2022 06:57:00 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 8 Jul 2022 06:57:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=noh15es2AgBUct6IJBLifYpvcLrUDyZTS70jqqJfQgjVS5fVtoYUz/SSI7e37fwKniASGmI82rp9vmjx4P+l8gVI7dDhFdZCfjdH3fpadzTVPL3nHxwy9733Pv1NSLn1BH2Vv5drgbAQnIb2+Nv4yWLyjjbHyC8a3OxPn8XS4vVZpR6pR8YBaOFyFXeBjpeO2fgtPDfaegTNTDgvjHGd3ino5pW/C7CZPZ0l2fWH6wupSwfwQ4DoGllo6VF9waI4m9a82jDcZf0VoqnA70px4DkAsSezZjbj99lPmtFkJ1gOeqxZ35HUGrQay+udwjf0uvYxScM38dT9UilalD4cRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=elGXe/q2uvFwNGVzioXn/N3Gf55T2KRUmkBGgZUMvr4=;
 b=ZAflTpYWT+224QolADPMOmP62PxFqMm2/VCHoWuC3upy2KoQP7sxQnKWJxWswSpPhIHQ0Z5C8J7NPVCBNCao4EI5COMnt+/E+Vua1qk7gYF10ppz9xrTO+3cz2CeKCMdtruaOhMXphlxP0SzbTEQlhHKx1EHnhPPK2llrqaaBxzHG5Nji/eqa9gc3T73TmH+XpxLtflPUvxyZA88e1ULM1Z44Ey0WK9mmWHrF1VZVu2lnILRH5CZLbGcN7F4//Vfuy5dF0ceQZ7CWDKBJG4ueknBqhYTbeV7aYL8XAfyLErEdWG43HkBIEXK4FL5ZaZDGGoD0hILWPNl6IOlA2qapQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR11MB1324.namprd11.prod.outlook.com (2603:10b6:3:15::14) by
 BL3PR11MB6458.namprd11.prod.outlook.com (2603:10b6:208:3bd::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.16; Fri, 8 Jul 2022 13:56:59 +0000
Received: from DM5PR11MB1324.namprd11.prod.outlook.com
 ([fe80::79c1:20d:d786:eba9]) by DM5PR11MB1324.namprd11.prod.outlook.com
 ([fe80::79c1:20d:d786:eba9%11]) with mapi id 15.20.5417.021; Fri, 8 Jul 2022
 13:56:59 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 6/6] drm/ttm: stop allocating a dummy resource for
 pipelined gutting
Thread-Topic: [PATCH 6/6] drm/ttm: stop allocating a dummy resource for
 pipelined gutting
Thread-Index: AQHYkevri/vHzzsdNEaxAzFM/Mr1Ea10gURA
Date: Fri, 8 Jul 2022 13:56:59 +0000
Message-ID: <DM5PR11MB1324F8F1DD7DE5A154AD3FD8C1829@DM5PR11MB1324.namprd11.prod.outlook.com>
References: <20220707102453.3633-1-christian.koenig@amd.com>
 <20220707102453.3633-7-christian.koenig@amd.com>
In-Reply-To: <20220707102453.3633-7-christian.koenig@amd.com>
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
x-ms-office365-filtering-correlation-id: 38c215c8-357e-438a-3081-08da60e9ba1a
x-ms-traffictypediagnostic: BL3PR11MB6458:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xXpT6NuEGMoVaSlHRBQ9LA2Gzzaer5D0I/a1LSymT/aZnRxVPoRpLO/gv6BVRt8vXvWvZv4GpJ17FRdBUt1mrrgcN6HOURrucHrWZYorvPlvwwMOvamPviEUGkFirOZpnl6CPtjg3Hn/jDF5uDO+MTfCIsy2/QcxSqexAAKkqHTmCEWm+PBxDovwJFSn+6ljz0UzbMmsBsDTZHRzRuedPRw6Oe92e1SCjkLP015q5idGiDyFfMMJig7dUoPSBf0+RDcKOR59jasnolma/Qj2uzwdeYnrlW6K7SwfiPh/8SK7B316O9wTTyninIEka1eT85KPJE54MG3jTu1BFJCfQHuZQviNEQmbat/VEKx33ZFMwU4NegqemtzSQaX6ryH2p6eIuaTNIxdF1bpyjk48nCD6COAeEGF58Wl3uDL5IbFDhX12RDjA9eGQCs6cOTa0lfCKSRPSdlWHZMWeHyLk6dDx5wtpdy1Xu5UgqjOl3TJamXYvJhgxPl6kt1uXX8ZcF4rVqQ31tqa4WMGnQVu5UcKU3KoNeSwB2zs+WA1/vJ98EDIdxRDGZyv4AWQjtgR2yu7T5bK8r1TXArODGLm+o4oSVQ2zVqfOtgG12oFeaJT3tVsVq/0Th2KzBSrG1lkyrDDQ7Uxv5hjiwKwFwcvDLLAiQd86h2aaNGgA4Yw0fFaMmcS19vqoZ+kk/+JsamGhPM4OzQUnvJF+cYY9EvLuSzjnTowR9bJYhFS3LDfCofR4L268QmM0IAbsMaJPmNzzKnfIgIMIsb3DOtjS8jG87fWD0PuWhg+RjP1VU4CjLUfD+HUONAnwdvRzJ/2UOnGz
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1324.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(366004)(396003)(376002)(346002)(39860400002)(41300700001)(66446008)(2906002)(186003)(82960400001)(83380400001)(316002)(5660300002)(33656002)(4326008)(66946007)(122000001)(66476007)(71200400001)(8676002)(38070700005)(38100700002)(66556008)(52536014)(76116006)(8936002)(9686003)(6506007)(110136005)(26005)(64756008)(478600001)(55016003)(86362001)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y1JuM2dZVUxqQmVRMG1ZZTJEY1BHN0pqbldIL2ZLOG5oZHVTQ211VVZIUVdr?=
 =?utf-8?B?YStJcTFYRVVKUDdXejhFTy9IL1VVMisrMkI1cmh2V29NMEtPUGRCNW0wU040?=
 =?utf-8?B?T3E3azFnSkY1SDNoY3daL2ltcmNYK0dGc2tLU3UvSlRjSi90T1ZYVTFQc3BJ?=
 =?utf-8?B?ekNIMmlqeUFjM0szR3dqdTA0N0ZueHRrcUtXV2gwNjFuM3dxS0pCdG1TY2RV?=
 =?utf-8?B?ZXZ3KytQTm8wMmNLOGR5QnlmbndlNWFFSXQyY2FmSGUrRWpyM3BJakxqbmZr?=
 =?utf-8?B?TGNVWEc4RzlaSFZqRDhjUy9pTkRNME9EWEtCUFlrbk01T01YMFBPRnJLdk9y?=
 =?utf-8?B?d3Fla3l3bUhDUlBCR3I3ZXBUK3d5bjgrU3ZFT0ZUdkdQWDBhZkRNS2p0TTVH?=
 =?utf-8?B?NnN6Wm4yT2xPUUVQdjNWMzBGL2ZwQ01VdmJHQitjaThmVjRpSWZnL3A0SzB0?=
 =?utf-8?B?SHhkQ1FLa0o4cnROMXArTmJENTM4RVhHZlZtenJDYlRWZk82Y082OElFODA4?=
 =?utf-8?B?K1JHL0FSU05PRml3Z25PS3pEOGtSNmhvanI0MVNoSDNOdVhPR1hDdEsxR0Jw?=
 =?utf-8?B?SitybDdJS3R4RlppOGE2ZS80bXdhK2Z2SG5rbmhybjdYTWQ5eFREekNJZDJy?=
 =?utf-8?B?SE84M1g0bjZ6dlJQMXBTRUlBU3I3RFQzQldzWUNsR1ViOUVsOUMzZHFpUnc4?=
 =?utf-8?B?SktCS2xhSWRxdHBpOGxMR280SGVLblpsd29GWVc4VVNjUFRrd2ZQSlI3RnRN?=
 =?utf-8?B?R1hQSjRZbzVqNW9rbkhMdXpCc0tvelBUMUszR0FKMWQzbkJ5TTMyUFJPdVVE?=
 =?utf-8?B?YnVDaisrR1FHbytXY3FVRkdPYjhLeGZ1eElSQmdYbE8rRUJjeWhmek5CaTJs?=
 =?utf-8?B?akVLMEZnd09WOFgvaTNJYUVzZFFDZkg4U0I3ckNjdC9QcEhGRkYvdG5wdCtr?=
 =?utf-8?B?S2ZZenBKbTNwckFkWnZ0b1lPeE5ZbndJMmVSOHozQnk1RFNhVDNVWTFzZ3NF?=
 =?utf-8?B?cGR6dE1NVEM5aHhPZDJYbFBESWhPYlpxRXdoY2NtVHZTV2FsbmZNeTcrTCs4?=
 =?utf-8?B?dncxWC8vL3RXS2lwWEM1ZmRQZHErVU9yS0ZFK3cwaWFRNWZrd3huNFBCVFBt?=
 =?utf-8?B?aHZES1BwbXlyV1AxaFpES09MTXpXOXR0RUxseUxpcm1EUWNwWCtVMUhkRDhy?=
 =?utf-8?B?M081WWlPUzQ1WDJROVM4WnZOOHZqOGhWVmhld0tsNFhiUUM0Zm5Ec1RGTk9i?=
 =?utf-8?B?bG1xYlhEaTRPekVyTDlTd013Qmo0OUplSGZrTURlZE9ZL2NQaVd3YjVnd2xk?=
 =?utf-8?B?M0J6ZFJwZ1FzcHJIMWlSMDBQdEtuMkU4UTRmbUZzejQ5WlhYQUp2L1R6U1hm?=
 =?utf-8?B?T09GYW5PbERqV2NGYXdOd1kreGZXMzk2bkE5c0tRaUNkTUpKVWRHOFRnYTdy?=
 =?utf-8?B?V2xTR2JPaEhhQXQ3S1lVVGh0bnhZZHZsUUZ1QU8rSGZ4VzRUcnA5RklqNCtj?=
 =?utf-8?B?N2VUYzlBUDU0ZzZpK1Z3cFBPWmJXMjlsNlNEL3NxaEsvZ2FOcUtneno2cnhL?=
 =?utf-8?B?QUN2WHFmMEUyNG41ZFUwVHp3ck1UekVaRG96eWFpWUN2Q1dFS0VuVmxPdmhj?=
 =?utf-8?B?ckx5STF5Q252Z3IwZHA0L1NMaXRDeUFlRVN5Y3VacXVKZTQ3K2tjYlU1UXhT?=
 =?utf-8?B?a3BxUGlKcFZUQXJxUVV5WklUTUtKTVl4VTFQOVp5bE9tR0xoSHIyNW9IYkhl?=
 =?utf-8?B?aW9uVXhTeGxEWDhYRkRINmZPamZlbGNXYTZ0NlduR0Q4TU1TV0xUQ1NuQWMy?=
 =?utf-8?B?a0x3MDYxRHYvS0NBZ0Ivd1NzNkpncTAvUTNtYjhsaUpMUGZ6bEU1RmxQUVh2?=
 =?utf-8?B?anJ4cVd6S1A4emYxWS9kV1NVdmFHMWZYVk1WK2RyN0hNOUljZWIwOGRVaHlB?=
 =?utf-8?B?YUNTZU5Tb3hzVk5GY2RHN3h0YVl4aEVzM3lRU2xzbjZaSC9Va1E1TFRpb1Ba?=
 =?utf-8?B?aHl0RElDR252Q1ZzRDVrWUFxV1pMR1NUMHlqQ20waEZmUmQyR0ZLdDlHdk5x?=
 =?utf-8?B?eHNiZmVycHgybXhwcmlxbnhobElaVDVyeGRqUERxUkN5ZzUrTC9DWmV1Nmlv?=
 =?utf-8?Q?VJl0/hgmepv2eHhBm8F2SvZR1?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1324.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38c215c8-357e-438a-3081-08da60e9ba1a
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2022 13:56:59.1802 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +Kz9EUxQsLGMaA3mif5Z5SHNBOnJ0S2F98ubb6G8vt4ifrLIZNcutHQzAjlvnT/js31lA0VIdCiZLV+9IinYMRgiDQlcTaGG4FLHFN5vdZg=
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

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IGRyaS1kZXZlbCA8ZHJpLWRl
dmVsLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YNCj5DaHJpc3Rp
YW4gS8O2bmlnDQo+U2VudDogVGh1cnNkYXksIEp1bHkgNywgMjAyMiA2OjI1IEFNDQo+VG86IGlu
dGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmc7DQo+bm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnDQo+Q2M6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1k
LmNvbT4NCj5TdWJqZWN0OiBbUEFUQ0ggNi82XSBkcm0vdHRtOiBzdG9wIGFsbG9jYXRpbmcgYSBk
dW1teSByZXNvdXJjZSBmb3IgcGlwZWxpbmVkDQo+Z3V0dGluZw0KPg0KPlRoYXQgc2hvdWxkIG5v
dCBiZSBuZWNlc3NhcnkgYW55IG1vcmUgd2hlbiBkcml2ZXJzIHNob3VsZCBhdCBsZWFzdCBiZQ0K
PmFibGUgdG8gaGFuZGxlIGEgbW92ZSB3aXRob3V0IGEgcmVzb3VyY2UuDQo+DQo+U2lnbmVkLW9m
Zi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KDQpSZXZp
ZXdlZC1ieTogTWljaGFlbCBKLiBSdWhsIDxtaWNoYWVsLmoucnVobEBpbnRlbC5jb20+DQoNCk0N
Cg0KPi0tLQ0KPiBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMgfCAxNSArKy0tLS0t
LS0tLS0tLS0NCj4gMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25z
KC0pDQo+DQo+ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3V0aWwuYw0K
PmIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdXRpbC5jDQo+aW5kZXggMTUzMDk4MjMzOGU5
Li4xZTc2MTQ5YzYyZmYgMTAwNjQ0DQo+LS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9f
dXRpbC5jDQo+KysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdXRpbC5jDQo+QEAgLTYw
MywxNiArNjAzLDEwIEBAIEVYUE9SVF9TWU1CT0wodHRtX2JvX21vdmVfc3luY19jbGVhbnVwKTsN
Cj4gICovDQo+IGludCB0dG1fYm9fcGlwZWxpbmVfZ3V0dGluZyhzdHJ1Y3QgdHRtX2J1ZmZlcl9v
YmplY3QgKmJvKQ0KPiB7DQo+LQlzdGF0aWMgY29uc3Qgc3RydWN0IHR0bV9wbGFjZSBzeXNfbWVt
ID0geyAubWVtX3R5cGUgPQ0KPlRUTV9QTF9TWVNURU0gfTsNCj4gCXN0cnVjdCB0dG1fYnVmZmVy
X29iamVjdCAqZ2hvc3Q7DQo+LQlzdHJ1Y3QgdHRtX3Jlc291cmNlICpzeXNfcmVzOw0KPiAJc3Ry
dWN0IHR0bV90dCAqdHRtOw0KPiAJaW50IHJldDsNCj4NCj4tCXJldCA9IHR0bV9yZXNvdXJjZV9h
bGxvYyhibywgJnN5c19tZW0sICZzeXNfcmVzKTsNCj4tCWlmIChyZXQpDQo+LQkJcmV0dXJuIHJl
dDsNCj4tDQo+IAkvKiBJZiBhbHJlYWR5IGlkbGUsIG5vIG5lZWQgZm9yIGdob3N0IG9iamVjdCBk
YW5jZS4gKi8NCj4gCXJldCA9IHR0bV9ib193YWl0KGJvLCBmYWxzZSwgdHJ1ZSk7DQo+IAlpZiAo
cmV0ICE9IC1FQlVTWSkgew0KPkBAIC02MjAsMTQgKzYxNCwxMyBAQCBpbnQgdHRtX2JvX3BpcGVs
aW5lX2d1dHRpbmcoc3RydWN0DQo+dHRtX2J1ZmZlcl9vYmplY3QgKmJvKQ0KPiAJCQkvKiBTZWUg
Y29tbWVudCBiZWxvdyBhYm91dCBjbGVhcmluZy4gKi8NCj4gCQkJcmV0ID0gdHRtX3R0X2NyZWF0
ZShibywgdHJ1ZSk7DQo+IAkJCWlmIChyZXQpDQo+LQkJCQlnb3RvIGVycm9yX2ZyZWVfc3lzX21l
bTsNCj4rCQkJCXJldHVybiByZXQ7DQo+IAkJfSBlbHNlIHsNCj4gCQkJdHRtX3R0X3VucG9wdWxh
dGUoYm8tPmJkZXYsIGJvLT50dG0pOw0KPiAJCQlpZiAoYm8tPnR5cGUgPT0gdHRtX2JvX3R5cGVf
ZGV2aWNlKQ0KPiAJCQkJdHRtX3R0X21hcmtfZm9yX2NsZWFyKGJvLT50dG0pOw0KPiAJCX0NCj4g
CQl0dG1fcmVzb3VyY2VfZnJlZShibywgJmJvLT5yZXNvdXJjZSk7DQo+LQkJdHRtX2JvX2Fzc2ln
bl9tZW0oYm8sIHN5c19yZXMpOw0KPiAJCXJldHVybiAwOw0KPiAJfQ0KPg0KPkBAIC02NDQsNyAr
NjM3LDcgQEAgaW50IHR0bV9ib19waXBlbGluZV9ndXR0aW5nKHN0cnVjdCB0dG1fYnVmZmVyX29i
amVjdA0KPipibykNCj4gCXJldCA9IHR0bV90dF9jcmVhdGUoYm8sIHRydWUpOw0KPiAJc3dhcChi
by0+dHRtLCB0dG0pOw0KPiAJaWYgKHJldCkNCj4tCQlnb3RvIGVycm9yX2ZyZWVfc3lzX21lbTsN
Cj4rCQlyZXR1cm4gcmV0Ow0KPg0KPiAJcmV0ID0gdHRtX2J1ZmZlcl9vYmplY3RfdHJhbnNmZXIo
Ym8sICZnaG9zdCk7DQo+IAlpZiAocmV0KQ0KPkBAIC02NTgsMTMgKzY1MSw5IEBAIGludCB0dG1f
Ym9fcGlwZWxpbmVfZ3V0dGluZyhzdHJ1Y3QNCj50dG1fYnVmZmVyX29iamVjdCAqYm8pDQo+IAlk
bWFfcmVzdl91bmxvY2soJmdob3N0LT5iYXNlLl9yZXN2KTsNCj4gCXR0bV9ib19wdXQoZ2hvc3Qp
Ow0KPiAJYm8tPnR0bSA9IHR0bTsNCj4tCXR0bV9ib19hc3NpZ25fbWVtKGJvLCBzeXNfcmVzKTsN
Cj4gCXJldHVybiAwOw0KPg0KPiBlcnJvcl9kZXN0cm95X3R0Og0KPiAJdHRtX3R0X2Rlc3Ryb3ko
Ym8tPmJkZXYsIHR0bSk7DQo+LQ0KPi1lcnJvcl9mcmVlX3N5c19tZW06DQo+LQl0dG1fcmVzb3Vy
Y2VfZnJlZShibywgJnN5c19yZXMpOw0KPiAJcmV0dXJuIHJldDsNCj4gfQ0KPi0tDQo+Mi4yNS4x
DQoNCg==
