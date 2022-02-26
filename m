Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4179E4C53CF
	for <lists+dri-devel@lfdr.de>; Sat, 26 Feb 2022 06:10:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0601910EA28;
	Sat, 26 Feb 2022 05:10:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89A4810EA28;
 Sat, 26 Feb 2022 05:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645852217; x=1677388217;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=y/lZVqukB4uCsDJf3z9t1uDuR9RWPDe3ReRLqdX06Gg=;
 b=gzDLjDtl3Mv6/6JDF5NvVIHK0UFrY2Cl2NsCB92dL+1do1SK9EXJDowE
 kOqjmNNYJRexwqlMcfTy47X5D41fc67fOnk50LRvurGXHTXwWPx+WjqkC
 JrvaBTEYHZj5PajMXknAkQbHyi0NlolIT9G5njVTGSrh/N46IMoZ92mDJ
 KZ2ZaFcG2g234HhtE4IBeXZ3dMc3iZZ0Y/onVVdWcEdUyffMYktqPtauY
 C2I4oilUXn51YFHnWM+Jz6nqbgZWllILQFEIYdOHKnq7uSgO5I1fzuDvH
 BPzTHemZ1Uqchffq1NS9q33p+nOrZwThaV/CsI2oCvDUXOce7CJJPX4Q4 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10269"; a="233255588"
X-IronPort-AV: E=Sophos;i="5.90,138,1643702400"; d="scan'208";a="233255588"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 21:10:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,138,1643702400"; d="scan'208";a="684855933"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP; 25 Feb 2022 21:10:16 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 25 Feb 2022 21:10:16 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 25 Feb 2022 21:10:16 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Fri, 25 Feb 2022 21:10:16 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 25 Feb 2022 21:10:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PmaEtczxzWdjNLKpw0a9zmLG8DaVwxwvhxfZ2tiwi8dSWNtSaKAIEXR11p3gT85Ggx2dcB3X8wtz4r1NM1f1CMxrq7RlI6ZjkOjjxBxQ5lwSZOGvFou2kFAoracTfZ95xwutM7bz3o4c2qRSg3b9iGbuIMGq6EkeAoMoRuHWtmuujaVWWdRoasPqfEkZ1pHRv35ReDD4cjLqdljedQjNMGslZZ4Bou9P9Jinn2qyXhuONoUIQsOusBgBV+c5KYUBfHnvkxOTiqbkPJPm6Zk8FL1bTO6U84hCG3tQpgN4YtKa9Z4uvobSI2zzBMZpkMoq+VtZggFITou0rOVQFq5LFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y/lZVqukB4uCsDJf3z9t1uDuR9RWPDe3ReRLqdX06Gg=;
 b=UOQhy8Pj/nQnkfJh4kUZ46OSrVEbCehnQPvRQ3u6QbiFbg4YeRX6IytPb4Obdw4aqu6vaOEYa088SArbt6DzFgsnszcgbMLm570EyhIGekaXM5YmPS0KLlRORK8hwKTbVo46/g0xABwV7r9B/ZrquqhtrNEgbr0X4GmLZtseCGKMeCz9i8FGFLxW3frEKwJ94+SNdAFX/D911FGr4iOFXR2EpRmUy3YhoJ5pVBU1ByCVH9913cMAI1nHa9T2j7ji7vmC83FqaqEgiY9wYZV2SCT6MqHWIcwbgWAvegdhcoJji4sH2VhYDern7EHh2+p79R44Ck//IHjYfuSX21nfPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB1741.namprd11.prod.outlook.com (2603:10b6:300:10d::20)
 by DM6PR11MB4545.namprd11.prod.outlook.com (2603:10b6:5:2ae::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Sat, 26 Feb
 2022 05:10:07 +0000
Received: from MWHPR11MB1741.namprd11.prod.outlook.com
 ([fe80::216d:6bf4:d46c:f133]) by MWHPR11MB1741.namprd11.prod.outlook.com
 ([fe80::216d:6bf4:d46c:f133%6]) with mapi id 15.20.5017.025; Sat, 26 Feb 2022
 05:10:06 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, "Nikula, Jani"
 <jani.nikula@intel.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: RE: [PATCH 5/6] drm/rcar_du: changes to rcar-du driver resulting from
 drm_writeback_connector structure changes
Thread-Topic: [PATCH 5/6] drm/rcar_du: changes to rcar-du driver resulting
 from drm_writeback_connector structure changes
Thread-Index: AQHYGBFjkzht//tf006vXTl+IOhLcKyANJuAgAAJCYCAAAcSAIAAJjQAgCBeB4CABEU7AIAAW/1w
Date: Sat, 26 Feb 2022 05:10:06 +0000
Message-ID: <MWHPR11MB1741E1C4A6247CCCBECC6793E33F9@MWHPR11MB1741.namprd11.prod.outlook.com>
References: <20220202085429.22261-1-suraj.kandpal@intel.com>
 <20220202085429.22261-6-suraj.kandpal@intel.com>
 <Yfp8Q6OFqTAvESOi@pendragon.ideasonboard.com> <87y22ts948.fsf@intel.com>
 <CAA8EJprrhPtDkWRk8+6Wf+OoQi4u8m_t7G5guJQW+SNuttOSgQ@mail.gmail.com>
 <87sft1s1m5.fsf@intel.com>
 <MWHPR11MB17412030E65D4E4821549E24E33C9@MWHPR11MB1741.namprd11.prod.outlook.com>
 <d0677cbd-64f1-eb13-7aea-3de599134d09@quicinc.com>
In-Reply-To: <d0677cbd-64f1-eb13-7aea-3de599134d09@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.401.20
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0b2b7036-c795-45e2-b8f4-08d9f8e64122
x-ms-traffictypediagnostic: DM6PR11MB4545:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <DM6PR11MB454548799D84D15518926519E33F9@DM6PR11MB4545.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FOgWYJZDQM8snYOoOTBEOwn6xgV1QAuVgPE7/6GbM7Xcp9Djpjid/yfjdRHOOJ/Eg/Kcb7Ei/qvH3DDbwD0rrZHFHKt+pBpL+T9GXlQUPNLWbW7lPQ9i32Ct5h8jj4VeIWc6kjR5ncgJDY39XkSe2qudtkJcDwEqOugS75ZtMFJuc20BEs2ewfJWFXttpzUY7RTsXDMAX45Sc8dJp54Y5lHYpphJ5ynQ70nRyD9bO+vtD+FL7+lRVznDshrmba+BbtWx6kR2jzb2l+OIunsP2JDZP2NenjcqhLelCpmIvRGIv58MI05ZQCfDZUpDqm6kb9sW3p/433p0EUUDd9kOX3yZF9UrPsqJoYXgi4ZXyp/YZrQpkirdIG7A8WobygG77EWkDGioRzU0upqsqAzPDGk5hlS6Us9WClIaCYVTlqy9AXp++uEqRwc28GJvU0Nec65ZJ/CydI7fozTnShQpSF+q/yMU+9yNg6jHgcFd11uNBU3e81Q0XPdvln3QC8LlNV5qMxpc0PMSSu5Ay4QFy0RRP40rGmtoiG0U9NYuw7tgM/99FaldZhzN0IdrhA922PDB5H554mVM6T46qyygawXHez4HlctvroYqi6gQq5TyB6v5XPPOA40nluUdYjXhpKV3olGPTtQtxrQV6aQCIVbadeWrI26sZcmFEBfYfjUILBrBBOmuTWRd0JFA+e0W/6HyTFosGUIRhBejd9u1qg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1741.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66476007)(26005)(66946007)(66556008)(76116006)(186003)(5660300002)(71200400001)(9686003)(33656002)(52536014)(6506007)(7696005)(8936002)(4326008)(38100700002)(8676002)(38070700005)(64756008)(66446008)(2906002)(55016003)(82960400001)(508600001)(54906003)(122000001)(86362001)(316002)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RnlTejhDYUttaDNwcm5meFo2RE9KcUpXc2ZjVTB3cXJLNHRpb2V5eEtUTUp2?=
 =?utf-8?B?aFVIc3NxcDhmdllGSDJKekpHK0ZOTzRrYmdHa2hGMjVSdnVTd1F5empCL0ZY?=
 =?utf-8?B?N2ZNcVF0RFpteGlvNnhhdVdtYXBVSjVKdk5HVHFPSVd5RWVnRjE2Y2o2endP?=
 =?utf-8?B?bFptMlVuNGlXNjJKM05mUW4vbTRHMENOM0U4RGl4dFhsbTBmU1JMbEprT1hL?=
 =?utf-8?B?aWw2K2RUck12dW1uT3dqcDVMNExQSFdDM0hCTjIrUEp2WkVYbEw4SXpid29V?=
 =?utf-8?B?NGhmRjFoZXNkeUFueUZLNTZsdUh1ZUN5Z3J3M1FQU1huaTRrNTZkZFhSYjQw?=
 =?utf-8?B?aHhEeVdTcDh5VncwNTVRY28xV2lHaVEyV2V0MHp6WGJ3WFF6S3VobVY5aW5z?=
 =?utf-8?B?bzFQS3NmZkJnUWhCanB4a3RPWG4zczFNT1N5TEVVbWRlQVdCM0hsTUtBeFlq?=
 =?utf-8?B?QmNvbXNBSnduTFo4SlV6MlN4VUNxOS9CeHA2dWtJbXBoeWFPL3JHeTJGSVRZ?=
 =?utf-8?B?NnZpdWwxdXlVOWM0WFZETklsVWpVWWYvZ1JVSWJIaTd1TmkzMnRXY25wOXdS?=
 =?utf-8?B?TTQ4N2tNdWlBRkZGalZrM1N2eCtoSW9OSVE3SXJ6U01NY0prYUYvcDlybnls?=
 =?utf-8?B?bXFYYnJhckYwa1dGTkJoeDN0RHZWQ0FhTnZaMUhaRmoyMEFsZUF1TS9COHlG?=
 =?utf-8?B?K3ViMWIzVGtTcUF2SWxuN1ZrdVFEYXZ4cEVmeWJRTTg5SksrNHZUSWdtcjRl?=
 =?utf-8?B?WE1qeGMrYWxrZFFlWWFHeDdLUDM0aDhVQmMvbTJuN0huMFNxZXVCTDhWcFd5?=
 =?utf-8?B?MGcxcVdDZDk0aTlwRjVraE1NQTYzUExHSTdyNUc5OU5uUVEwemNOUDR0Ukdj?=
 =?utf-8?B?dzREakE1ZGIrYnk1M3RobExLUUh5eUgvd1h4N3NUUkJkeFA1NE9nSm1jUlhw?=
 =?utf-8?B?akdFOFFTaU9rMkVoS0pTZllRbU1pT1JScVoxTXV0MDNjOHVCdlNVWWZKN056?=
 =?utf-8?B?WmRtcmdrRnYrSkViQkwrZ3NLZHk3UFpiTkZxZ2NrSVRaTS9XM3hENGx0elcy?=
 =?utf-8?B?Rk1CWnVSc3VVTFJTdXNZQmZCL0ttbndGMXBKNzg2SFMzc0NIWWxreEtNVi9m?=
 =?utf-8?B?NDE5SVFuV0NKY2FzNXZ5YXhkNGR1ODRuYW1ucURpQTkrYy9Td1hKOGFNbW5i?=
 =?utf-8?B?bkl3WkY0LzgyeDNyTStMWkYyZEpVZGQxOW00YnpDOUMvMnBGVUhxemlBZFlp?=
 =?utf-8?B?bHYwSUFtVmE4bllZem8waWlwTXhRcXYwMk4yNVZrUm5nUHR6VDY0TUZPZTRk?=
 =?utf-8?B?UVgwZG13OTduUmdUZXFvYW1LMExNeU4zQVRtWFpKRkl3U3ZZUnVwYUxUQzRM?=
 =?utf-8?B?ZzN1ajZHTjYzYlNVR2JKVTdsRnl3UVZIWCtyYnpEc2ZpSXFTZGFCV1o1NW1k?=
 =?utf-8?B?ZmFDQWFtRjQvN3pvOWFBNGo3dHdpeGlsc09JOUlFOTRrd0RaNUhOR0hvOHlU?=
 =?utf-8?B?emoyN1hrRW43YjdNUDVKcVlaVkxiMzVQRk5MSGFsVkEybjBGandDOXpFV3pt?=
 =?utf-8?B?L1BiQVh4RlpLS1FKcjAyT2NTSnBIODFuZEdWYThmYU85eDlRcG52bTArekth?=
 =?utf-8?B?eFptNFIyOEdjOFdIbWQwY0xBQTB6RE5CR2t1dCtTR2c4YXk5NFM3TVptVDN5?=
 =?utf-8?B?TTVZSGhJN1NkNnBVTEdzcGNEQm80TEdiQm43eE5Qc0tqdGlxZUIvR045cDMz?=
 =?utf-8?B?anlNMGhlbUpZRTRYaDVHemJGQWRqWUF1Mk5XM3N0bDRJQ3NsRWZRMWd0VHFv?=
 =?utf-8?B?ZFNsT3lnSjA4YmdGTFBJaHNvbmlUNHJCR0Z0encxb084bGQ5UTVvUW03NFNm?=
 =?utf-8?B?RmZ2VUJmLytyWjhJWmorTElNRE5SRUlmNFZ5amp4VzU4dkovbGptUnFUQWMv?=
 =?utf-8?B?ODhWTmVmR1l2ZXEva1ZZZHRpZkdjck81c2lsTEZXUGllMk1XNjlIYVNKdjBm?=
 =?utf-8?B?ZGZaQUZYWW90S2hkY3pTdUd0OTFFV2RvYkxwYk1XcWZya2hJeisrNDZndjFl?=
 =?utf-8?B?OWI1VW5HOUtWVGJWNFoxZXFmams4anNheWJZOXJCU0ZQeVRHM3VaZmFwUUNo?=
 =?utf-8?B?WmZPOHRiNGg5ZTFRNE5HMzJHK3d1Yi9uQ1doaDM2SExiWUlrYy9kTk0vY3Rz?=
 =?utf-8?B?elE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1741.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b2b7036-c795-45e2-b8f4-08d9f8e64122
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2022 05:10:06.7659 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ix27m1dPZXTO1d21R0cbeOxjL9plUD6lR8t5WM1Tv+VUwcW/PgmuunVJUX6LLU2whmY4FmfTFnG8wPkgb/2ixg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4545
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
Cc: "carsten.haitzler@arm.com" <carsten.haitzler@arm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, "Murthy, 
 Arun R" <arun.r.murthy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQWJoaW5hdiwNCg0KPiBCYXNlZCBvbiB0aGUgZGlzY3Vzc2lvbiBpbiB0aGlzIHRocmVhZCBb
MV0gLCBpdCBzZWVtcyBsaWtlIGhhdmluZyBkcm1fZW5jb2Rlcg0KPiBhcyBhIHBvaW50ZXIgc2Vl
bXMgdG8gaGF2ZSBtZXJpdHMgZm9yIGJvdGggb2YgdXMgYW5kIGFsc28gaW4gYWdyZWVtZW50IHdp
dGgNCj4gdGhlIGZvbGtzIG9uIHRoaXMgdGhyZWFkIGFuZCBoYXMgYSBiZXR0ZXIgY2hhbmNlIG9m
IGFuIGFjay4NCj4gDQo+IEhvd2V2ZXIgZHJtX2Nvbm5lY3RvciBpcyBub3QuDQo+IA0KPiBJIGhh
ZCBhIGJyaWVmIGxvb2sgYXQgeW91ciBpbXBsZW1lbnRhdGlvbi4gQW55IHJlYXNvbiB5b3UgbmVl
ZCB0byBnbw0KPiB0aHJvdWdoIGludGVsX2Nvbm5lY3RvciBoZXJlIGFuZCBub3QgZHJtX3dyaXRl
YmFja19jb25uZWN0b3IgZGlyZWN0bHk/DQo+IA0KPiBUaGUgcmVhc29uIEkgYXNrIGlzIHRoYXQg
SSBzZWUgeW91IGFyZSBub3QgdXNpbmcgcHJlcGFyZV93cml0ZWJhY2tfam9iIGhvb2suDQo+IElm
IHlvdSB1c2UgdGhhdCwgeW91IGNhbiB1c2UgdGhlIGRybV93cml0ZWJhY2tfY29ubmVjdG9yIHBh
c3NlZCBvbiBmcm9tDQo+IHRoZXJlIGluc3RlYWQgb2YgbG9vcGluZyB0aHJvdWdoIHlvdXIgbGlz
dCBsaWtlIHlvdSBhcmUgZG9pbmcgaW4NCj4gaW50ZWxfZmluZF93cml0ZWJhY2tfY29ubmVjdG9y
Lg0KPiANCj4gQWxzbywgbm9uZSBvZiB0aGUgb3RoZXIgZW50cmllcyBvZiBzdHJ1Y3QgaW50ZWxf
Y29ubmVjdG9yIGFyZSBiZWluZyB1c2VkIGZvcg0KPiB0aGUgd3JpdGViYWNrIGltcGxlbWVudGF0
aW9uLiBTbyBkb2VzIHRoZSBkcm1fd3JpdGViYWNrX2Nvbm5lY3RvciBpbg0KPiB5b3VyIGltcGxl
bWVudGF0aW9uIG5lZWQgdG8gYmUgYW4gaW50ZWxfY29ubmVjdG9yIHdoZW4gaXRzIGFueXdheSBu
b3QNCj4gdXNpbmcgb3RoZXIgZmllbGRzPyBXaHkgY2FudCBpdCBiZSBqdXN0IHN0b3JlZCBhcyBh
IGRybV93cml0ZWJhY2tfY29ubmVjdG9yDQo+IGl0c2VsZiBpbiB5b3VyIHN0cnVjdCBpbnRlbF93
ZC4NCg0KVGhlIHJlYXNvbiB3ZSBjYW4ndCBkbyB0aGF0IGlzIGk5MTUgZHJpdmVyIGFsd2F5cyBh
c3N1bWVzIHRoYXQgYWxsIGNvbm5lY3RvcnMNCnByZXNlbnQgaW4gZGV2aWNlIGxpc3QgaXMgYW4g
aW50ZWwgY29ubmVjdG9yIGFuZCBzaW5jZSBkcm1fd3JpdGViYWNrX2Nvbm5lY3Rvcg0KZXZlbiB0
aG91Z2ggYSBmYXV4IGNvbm5lY3RvciBpbiBpdCdzIGluaXRpYWxpemF0aW9uIGNhbGxzIGRybV9j
b25uZWN0b3JfaW5pdCgpDQphbmQgZ2V0cyBhZGRlZCB0byB0aGUgZHJtIGRldmljZSBsaXN0IGFu
ZCBoZW5jZSB0aGUgaTkxNSBkcml2ZXIgYWxzbyBleHBlY3RzIA0KYSBjb3JyZXNwb25kaW5nIGlu
dGVsIGNvbm5lY3RvciB0byBnbyB3aXRoIGl0LiBJbiBjYXNlIEkgZG8gdHJ5IHRvIG1ha2Ugd3Jp
dGViYWNrDQpjb25uZWN0b3Igc3RhbmRhbG9uZSBhIGxvdCBvZiBjaGVja3MsIGEgbG90IHdpbGwg
aGF2ZSB0byBiZSBhZGRlZCBhbGwgYXJvdW5kIHRoZSANCmRyaXZlciBhcyB0aGVyZSBjb3VsZCBi
ZSBhIGNoYW5jZSB0aGF0IG9uZSBvZiB0aGUgZHJtX2Nvbm5lY3RvciBpbiB0aGUgZHJtIGRldmlj
ZQ0KbGlzdCBtYXkgbm90IGJlIGFuIGludGVsX2Nvbm5lY3Rvci4NClllcyByaWdodCBub3cgbm90
IGFsbCBmaWVsZHMgb2YgaW50ZWxfY29ubmVjdG9yIGFyZSBiZWluZyB1c2VkIGJ1dCB3ZSB3aWxs
IGJlIHdvcmtpbmcNCm9uIGZpbGxpbmcgdGhlbSBhcyB3ZSBhZGQgbW9yZSBmdW5jdGlvbmFsaXR5
IHRvIHdyaXRlYmFjayBmb3IgZXhhbXBsZSBpbnRyb2R1Y2luZw0KY29udGVudCBwcm90ZWN0aW9u
LiANClNvIGV2ZW4gaWYgSSBkbyBmbG9hdCB0aGUgcGF0Y2ggc2VyaWVzIHdpdGgganVzdCBkcm1f
ZW5jb2RlciBhcyBwb2ludGVyIGl0IHdvbid0IGhlbHANCnVzIHdpdGggb3VyIGltcGxlbWVudGF0
aW9uIGlmIGRybV9jb25uZWN0b3IgaXNuJ3QgYSBwb2ludGVyIHRvby4NCiANClJlZ2FyZHMsDQpT
dXJhaiBLYW5kcGFsDQo=
