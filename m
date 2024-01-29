Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 489A5841450
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 21:30:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80AE510FF4A;
	Mon, 29 Jan 2024 20:29:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7002010FF20;
 Mon, 29 Jan 2024 20:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706560166; x=1738096166;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=k4b0CHezOHxCIAEetyaM0qSDSuyyAVgiN1ph9oag82s=;
 b=Rrq4nqTVWWnubjTZ1DIELGjI9t2dENHJFbukR+44XhUmr6nyU7CVi5GU
 7Huo5Omqu0Jwoixd0q8iAChJKFA4OC67eBxJbnJeS019igm1Oe2G0jcGx
 0NSxpktX0rFB20s6Qzd/U4FhsmkoNCXOsCjr81UdwRVZZcyYs+MJr0nSp
 4Ext2ihgQKHgfaP93ihAHiMVTXGNAUH3TejOrlzMK2RNjidpCWD8Hkt6I
 GRzY/xopEWzLRJG1LjFbSiwgryGz4vDyOb0BUz/4UhDqPNfvqNzFubTYP
 1SqRedHOif4GSXg83ixgnewxdvqp479K48hc7St9KB+njU/4P2EQlBHet g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="16612321"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="16612321"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 12:29:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="931202902"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="931202902"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jan 2024 12:29:25 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Jan 2024 12:29:25 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Jan 2024 12:29:24 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Jan 2024 12:29:24 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Jan 2024 12:29:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fDflnfvGAzL/8dqLDkgF9hZr/J1Wp2P7qTmaszHsMADq3yDiosdhOHN1/C04cHtxSYJaAqjG8luLto+ONqdERBJuWC82qqOX6OGPjjQuWdoS9BiCQNxApq+s1J1SzlZjmSGWbZLAewrojzUE74zDuECmeYFF8f6a9zY68c3N8V1wMqb/pNHLVKRLnbjNiNUHSDgK7NHKLratXea6ttMFYWlldP6KBPtdvuzI7PPbnFXjdSdZrfcGjXIv0geLFd88BBawElsWcAhfVyAxG7egRVlnUgQf/ZQ97zB+V3e2lodGMNkFf/aCAb8hU17+ijRs6TRfgfPWDGe7hcQpsluBHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k4b0CHezOHxCIAEetyaM0qSDSuyyAVgiN1ph9oag82s=;
 b=Pva89RsKihF3Ws/FRYXAt24VAQXc70UstvZn41AxuPUtJBkNrmhlfdYxdsTjP5QisFh+je1BrF8QjMjk1/75CdekjJJ8S9Fhgma00NI/r+nYb5PnISyJf/JfecIjzoqjLpOrStHykptPEctB+dlG956nk9MosYW3e7UkrlN5ORJz75+vO5qEy8jQ75A0f4qvH+HuvI2DthVGWXVs9vo1z8/hxdohFTUz2g2TUXmcd7ztrCL/JTVboRj392+c6QpnoeQIHxd5qGTvterPpGvmo/2D26muCuPMCA32QZVkCIZ7r7wj++nLeCEaLnwlaLdI01bRB9L26lELM8ZjjbY/YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by CH3PR11MB7793.namprd11.prod.outlook.com (2603:10b6:610:129::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Mon, 29 Jan
 2024 20:29:17 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::b8db:cc2d:d64f:f7de]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::b8db:cc2d:d64f:f7de%5]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 20:29:17 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe: Fix a build error
Thread-Topic: [PATCH] drm/xe: Fix a build error
Thread-Index: AQHaUTd+XD2mvBR8zkCJFwer00IIDLDxA5sAgAA8m4CAAADD4A==
Date: Mon, 29 Jan 2024 20:29:17 +0000
Message-ID: <SA1PR11MB6991072A876ED10A0CEE193F927E2@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240127155327.423294-1-oak.zeng@intel.com>
 <21f2b595-0690-4372-bd81-86d23ac7498b@gmail.com>
 <0d1e2c15-c951-4c97-b242-a1231ae4f608@linux.intel.com>
In-Reply-To: <0d1e2c15-c951-4c97-b242-a1231ae4f608@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|CH3PR11MB7793:EE_
x-ms-office365-filtering-correlation-id: 4cfd199a-535d-42bf-98ff-08dc2108f739
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pBZ4b2uCkmTuZ8fst0t0FOmkWP4tyz7Hnpz0z8dG7zGKiLbPaDFLCZt2qVxbprfTuM094mDJlXmthdnxiOXC3k/Uyd9CGFrecABbI1akwgKM9NOA+AUHaB64FIfnWS1cgs5SpVJ/k/m/pNBtuGCegNubV4lqCmtv6Z/XYdSHqjy16rFnhq/pqXj9YG1+9zzNj3iya0nKIGHDq5BjrtWuSKxqH8tAFwXNsz8lgEWwf97RUuIEptubd2aVJfTCTu4Lb5YnTbI6UCUmmgA/4Gxsc7VttaxJq6Prqz1phZn6E5SYBynXSwOgC1riLCe4FvKSfLbzv64tbfvalOd4WZsvst0ZiZRLphhq9TjLggOFKQK4lqDiHTSLAJdNmOQZLknrrYSUIsKJ92PwyqjQ8/zuhS4qD8rSVgRYkvdrVhC4v1wobpAyu8igZg4DqkCXNZUkl4RSsad+AlI6gr1IxUrPG+xzQ9g7anJ0JN80eG+SGXX5vHooaQl7/UOcUmoxv+SKG+lPdZo4WmKE87sWpG3k1CHnekoEUa+hBOChCc0N3yIAZ6M6ynb9UplR24JnuqaTi4IVTs56wKnHsr+0EpFOmxnWaslnrmB9CMruCfOxg3QgpMy9bkGWNRXLhbXaw/Fd
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(366004)(39860400002)(396003)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(41300700001)(82960400001)(38100700002)(122000001)(55016003)(7696005)(66446008)(110136005)(316002)(6506007)(86362001)(76116006)(54906003)(53546011)(66946007)(66476007)(8676002)(8936002)(64756008)(66574015)(5660300002)(52536014)(9686003)(33656002)(26005)(478600001)(2906002)(71200400001)(4326008)(66556008)(83380400001)(38070700009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OUc1YXpwVnJ5SHBZbUYyK1ZXK0Uxc3hUZ2VJUHkxQnZaRlp4bkdGa0J3ZTZa?=
 =?utf-8?B?aGlJd3g0VEhKY25zQkVLMXJ2SXM4Q1ZsSElGU0txRWhSTHptczZEb2RHdzJh?=
 =?utf-8?B?TmE4R0lha1VIVTI0RFg0UFlUMm5Bc01ncDM0eUhtSUhZZ0d5VkhlNmpSN3dY?=
 =?utf-8?B?TnVvejdINXFndEpQbE1LSFZYZFNmbTJGc3F3bTBZM2VId2ZhcUJZbWh1Y1dH?=
 =?utf-8?B?OWtjRFExWkI5RWxCejN1QW1PQjJIL2tiT09YTzNOdC91cDNQOXN5elNiWWxY?=
 =?utf-8?B?Z0ZNMU1qSGR0aWpBcjltbkxhZ0hXbnM3NWxRdDloMVoxWUFzYkhwTmo2NHM5?=
 =?utf-8?B?VG5KTHRpTnlBQUMyNFJPVkJxZkFJMStlM0pocTdtbjd1OGZFK3l1NGtQS0Jj?=
 =?utf-8?B?eENNS05CYVE5bVFFVWVVdGlmNEFueWlaVFhHbmRjVnlXdHptTi9oUnc5TS9k?=
 =?utf-8?B?c3M1b0RWNE54aFRQalNQRVFMSWJacnYyL0tTVll4enlJQ1UyMVBiMTQrdVRS?=
 =?utf-8?B?SzZheHpDR0ZPQU5lRktOVng3d1ZmaDNnc3FGd3oyQ3Y5Z1UydDNmOU1rR1Bq?=
 =?utf-8?B?YW9kV3Erd1VUbndFV042a2hQaUdjUVRLQ0V6MWdqb2hHSlhrbTFCekcybVVG?=
 =?utf-8?B?T2pnR0JqUzBYaFRLVHk1R25ZenFqOUFaa0wwQ2orc1JBeVVOMGdaOUxFSXc0?=
 =?utf-8?B?UERZa05zSzY3VXA5dUttazlPRVNNWGUwc1dIcEVIUXJ0YVVPdWhodkt5cDEw?=
 =?utf-8?B?SWpWZEJjNVZIL2tQUG4ybHhyK0JObkhKbWhkemxrWkttaVZmTGs1elJTb2Ew?=
 =?utf-8?B?NHQwMWI0d2FNTUxIbXFuNi9Lc0FUc2UxUlppcmovaVo1allIbEZJUXJvT1dF?=
 =?utf-8?B?OTJ4NTR5TWVWSXFCa1I4ZHdqNHFYZFJCWlJueGNnWk1OZ1F0MVdFc3hWejdj?=
 =?utf-8?B?a09TQ3Vnb3NUdW5qTU5iK3ZrbU8ySCtZT2ljeUxIS0g4eHdEZFFIN1JnaGFi?=
 =?utf-8?B?MVBRYUQ0NzVUd082MjlXM0F1ZERuQnBkcXNEdnZKWHdhQXdiRnNnbTA4NzFq?=
 =?utf-8?B?WlM1dDBDaW1scThkVkZ3ZFB3QkkxNVJkbFNCTFY0ZS9aa3cxcnVUMSttWTZK?=
 =?utf-8?B?bUtoNU9oUCtpZ2twb1gyWVQ0MnJnUllUVThKNDlJQWlpRW9JdVBlZndaZjlh?=
 =?utf-8?B?NVo3dFF2RlYyQ244Mi8zQmtjQWZTRTRkdkJpWExsSzM1Q3BWTWpEY3l3eFRM?=
 =?utf-8?B?L05nM0x3dEhaaE5mMFhlN1Q2OVRnZzEvRnNUQStwZFcvMzF3SHdjT0tJVm5r?=
 =?utf-8?B?OVpaRlZIblhqVGd1Y3cvdHFRVm5DazRCNTEwaFhyZGhTYzQ0QjBFaXQxTm05?=
 =?utf-8?B?RlhLT1hITnM5Z05pU2NBajF1Z2puR204N3hLeTRyUXNqVlBrR0x3MFJYejl6?=
 =?utf-8?B?ckV5aTc1citQWkRiTXd3bU5hM0U2Mkx0V1duRVoyb2FsYTRxcUNQNlN5U0tw?=
 =?utf-8?B?d2pjMG5URk1GZUtxQWxGd01lUVBmK2xvaVg1Rk9ySnM1ZU5aVEZiVXU2ODA0?=
 =?utf-8?B?SjFWdlB6WWJ4RFFRUnd1MysvQnp0aXhjZEtQNE5HM1dXajEya2swVWpYOUtN?=
 =?utf-8?B?NDN6THJvZVJOV2o5SDJPZldXM2JqeTJKTVFUV083YVBDb0IrUHI4OEpsbDg5?=
 =?utf-8?B?QWlhSXc5V01rOVVNcHcwT2lINzBFTlpyOEpIRC9kbktXKzVJS3pkNGF0UnhE?=
 =?utf-8?B?WWt4dE9GV28zVFczazNzaXhxZHVEczlMNkl0cXErTm8yaVBEdC9qRGJmbnVV?=
 =?utf-8?B?dVhGTzJPUVcwMUxMTlBVWEUwbDNmckFMTmc4YkRzOTVRSGlrY0p1VDhrUFFR?=
 =?utf-8?B?ZUtGVlVUenJYMktUSy82RmgxVzlLMFY3WFNjQTZHWUVWRDh3RVo2TnlmKzNJ?=
 =?utf-8?B?TzJMcXhZbDVxL0pYTW5zK2NxZndWdzJ4TlRCMzFQTEw5YUQzZmFQKytYU21u?=
 =?utf-8?B?ZWs1aXBkRHJ2QTdBL01MYWM3R3k2ZHo3VnVUeEtDdWlVRVFJWHF2NStMdkps?=
 =?utf-8?B?VTNiNjkyOTh1eUNxTjMrbnA2bFQ2WmkwRUxoNWJCaFZjdjJxVU4ySDlsYmZy?=
 =?utf-8?Q?ABwk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cfd199a-535d-42bf-98ff-08dc2108f739
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2024 20:29:17.0353 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MOFf9W/ZW0txM4gfi4/LMui4KkBsrfCHjOGEWNWo99lrAiLgZGvbD1rpHQab6WKSIozlLzwoXmEeRGxjzL0N9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7793
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
Cc: "Amaranath.Somalapuram@amd.com" <Amaranath.Somalapuram@amd.com>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVGhvbWFzLA0KDQpNeSBwYXRjaCB3YXMgYmFzZWQgb24gZHJtLXRpcC4uLi4gYmVjYXVzZSBJ
IGZvdW5kIGRybS10aXAgaXMgYnJva2VuLi4uLg0KDQpBcyBsb25nIGFzIGRybS10aXAgY2FuIGJ1
aWxkLCBJIGFtIGFsbCBnb29kLg0KDQpUaGFua3MsDQpPYWsNCg0KPiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiBGcm9tOiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBs
aW51eC5pbnRlbC5jb20+DQo+IFNlbnQ6IE1vbmRheSwgSmFudWFyeSAyOSwgMjAyNCAzOjI2IFBN
DQo+IFRvOiBDaHJpc3RpYW4gS8O2bmlnIDxja29lbmlnLmxlaWNodHp1bWVya2VuQGdtYWlsLmNv
bT47IFplbmcsIE9haw0KPiA8b2FrLnplbmdAaW50ZWwuY29tPjsgZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZzsgaW50ZWwtDQo+IHhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzog
QW1hcmFuYXRoLlNvbWFsYXB1cmFtQGFtZC5jb207IERlIE1hcmNoaSwgTHVjYXMNCj4gPGx1Y2Fz
LmRlbWFyY2hpQGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL3hlOiBGaXgg
YSBidWlsZCBlcnJvcg0KPiANCj4gSGksDQo+IA0KPiBPbiAxLzI5LzI0IDE3OjQ4LCBDaHJpc3Rp
YW4gS8O2bmlnIHdyb3RlOg0KPiA+IEFtIDI3LjAxLjI0IHVtIDE2OjUzIHNjaHJpZWIgT2FrIFpl
bmc6DQo+ID4+IFRoaXMgZml4ZXMgYSBidWlsZCBmYWlsdXJlIG9uIGRybS10aXAuIFRoaXMgaXNz
dWUgd2FzIGludHJvZHVjZWQgZHVyaW5nDQo+ID4+IG1lcmdlIG9mICJkcm0vdHRtOiByZXBsYWNl
IGJ1c3kgcGxhY2VtZW50IHdpdGggZmxhZ3MgdjYiLiBGb3Igc29tZQ0KPiA+PiByZWFzb24sIHRo
ZSB4ZV9iby5jIHBhcnQgb2YgYWJvdmUgY2hhbmdlIGlzIG5vdCBtZXJnZWQuIE1hbnVhbGx5IG1l
cmdlDQo+ID4+IHRoZSBtaXNzaW5nIHBhcnQgdG8gZHJtX3RpcA0KPiA+DQo+ID4gTWhtLCBJIHBy
b3ZpZGVkIHRoaXMgYXMgbWFudWFsIGZpeHVwIGZvciBkcm0tdGlwIGluIHRoaXMgcmVyZXJlIGNv
bW1pdDoNCj4gPg0KPiA+IGNvbW1pdCBhZmM1Nzk3ZThjMDNiZWQzZWM0N2EzNGYyYmMzY2YwM2Zj
ZTI0NDExDQo+ID4gQXV0aG9yOiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFt
ZC5jb20+DQo+ID4gRGF0ZTrCoMKgIFRodSBKYW4gMjUgMTA6NDQ6NTQgMjAyNCArMDEwMA0KPiA+
DQo+ID4gwqDCoMKgIDIwMjR5LTAxbS0yNWQtMDloLTQ0bS0wN3MgVVRDOiBkcm0tdGlwIHJlcmVy
ZSBjYWNoZSB1cGRhdGUNCj4gPg0KPiA+IMKgwqDCoCBnaXQgdmVyc2lvbiAyLjM0LjENCj4gPg0K
PiA+DQo+ID4gQW5kIGZvciBtZSBjb21waWxpbmcgeGUgaW4gZHJtLXRpcCB3b3JrZWQgZmluZSBh
ZnRlciB0aGF0LiBObyBpZGVhIHdoeQ0KPiA+IHRoYXQgZGlkbid0IHdvcmsgZm9yIHlvdS4NCj4g
Pg0KPiA+IEFueXdheSBmZWVsIGZyZWUgdG8gYWRkIG15IHJiIHRvIHRoaXMgcGF0Y2ggaGVyZSBp
ZiBpdCBoZWxwcyBpbiBhbnkgd2F5Lg0KPiA+DQo+ID4gUmVnYXJkcywNCj4gPiBDaHJpc3RpYW4u
DQo+IA0KPiBJIHJldmVydGVkIHRoYXQgcmVyZXJlIGNhY2hlIHVwZGF0ZSBhbmQgYWRkZWQgYW5v
dGhlciBvbmUsIHNvIG5vdyBpdA0KPiB3b3Jrcy4gTm90IHN1cmUgZXhhY3RseSB3aGF0IHRoZSBk
aWZmZXJlbmNlIHdhcywgYnV0IHRoZSByZXN1bHRpbmcgcGF0Y2gNCj4gd2FzIGZvciB0aGUgZHJt
LW1pc2MtbmV4dCBtZXJnZSBpbiBteSBjYXNlLCBhbmQgSXQgd2FzIGZvcg0KPiBkcm0teGUtc29t
ZXRoaW5nIGluIHlvdXIgY2FzZS4NCj4gDQo+IC9UaG9tYXMNCj4gDQo+IA0KPiA+DQo+ID4+DQo+
ID4+IFNpZ25lZC1vZmYtYnk6IE9hayBaZW5nIDxvYWsuemVuZ0BpbnRlbC5jb20+DQo+ID4+IC0t
LQ0KPiA+PiDCoCBkcml2ZXJzL2dwdS9kcm0veGUveGVfYm8uYyB8IDMzICsrKysrKysrKysrKysr
Ky0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9u
cygrKSwgMTggZGVsZXRpb25zKC0pDQo+ID4+DQo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0veGUveGVfYm8uYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5jDQo+ID4+IGluZGV4
IDY4NmQ3MTZjNTU4MS4uZDZhMTkzMDYwY2MwIDEwMDY0NA0KPiA+PiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0veGUveGVfYm8uYw0KPiA+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfYm8uYw0K
PiA+PiBAQCAtMzgsMjIgKzM4LDI2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdHRtX3BsYWNlIHN5
c19wbGFjZW1lbnRfZmxhZ3MNCj4gPj4gPSB7DQo+ID4+IMKgIHN0YXRpYyBzdHJ1Y3QgdHRtX3Bs
YWNlbWVudCBzeXNfcGxhY2VtZW50ID0gew0KPiA+PiDCoMKgwqDCoMKgIC5udW1fcGxhY2VtZW50
ID0gMSwNCj4gPj4gwqDCoMKgwqDCoCAucGxhY2VtZW50ID0gJnN5c19wbGFjZW1lbnRfZmxhZ3Ms
DQo+ID4+IC3CoMKgwqAgLm51bV9idXN5X3BsYWNlbWVudCA9IDEsDQo+ID4+IC3CoMKgwqAgLmJ1
c3lfcGxhY2VtZW50ID0gJnN5c19wbGFjZW1lbnRfZmxhZ3MsDQo+ID4+IMKgIH07DQo+ID4+IMKg
IC1zdGF0aWMgY29uc3Qgc3RydWN0IHR0bV9wbGFjZSB0dF9wbGFjZW1lbnRfZmxhZ3MgPSB7DQo+
ID4+IC3CoMKgwqAgLmZwZm4gPSAwLA0KPiA+PiAtwqDCoMKgIC5scGZuID0gMCwNCj4gPj4gLcKg
wqDCoCAubWVtX3R5cGUgPSBYRV9QTF9UVCwNCj4gPj4gLcKgwqDCoCAuZmxhZ3MgPSAwLA0KPiA+
PiArc3RhdGljIGNvbnN0IHN0cnVjdCB0dG1fcGxhY2UgdHRfcGxhY2VtZW50X2ZsYWdzW10gPSB7
DQo+ID4+ICvCoMKgwqAgew0KPiA+PiArwqDCoMKgwqDCoMKgwqAgLmZwZm4gPSAwLA0KPiA+PiAr
wqDCoMKgwqDCoMKgwqAgLmxwZm4gPSAwLA0KPiA+PiArwqDCoMKgwqDCoMKgwqAgLm1lbV90eXBl
ID0gWEVfUExfVFQsDQo+ID4+ICvCoMKgwqDCoMKgwqDCoCAuZmxhZ3MgPSBUVE1fUExfRkxBR19E
RVNJUkVELA0KPiA+PiArwqDCoMKgIH0sDQo+ID4+ICvCoMKgwqAgew0KPiA+PiArwqDCoMKgwqDC
oMKgwqAgLmZwZm4gPSAwLA0KPiA+PiArwqDCoMKgwqDCoMKgwqAgLmxwZm4gPSAwLA0KPiA+PiAr
wqDCoMKgwqDCoMKgwqAgLm1lbV90eXBlID0gWEVfUExfU1lTVEVNLA0KPiA+PiArwqDCoMKgwqDC
oMKgwqAgLmZsYWdzID0gVFRNX1BMX0ZMQUdfRkFMTEJBQ0ssDQo+ID4+ICvCoMKgwqAgfQ0KPiA+
PiDCoCB9Ow0KPiA+PiDCoCDCoCBzdGF0aWMgc3RydWN0IHR0bV9wbGFjZW1lbnQgdHRfcGxhY2Vt
ZW50ID0gew0KPiA+PiAtwqDCoMKgIC5udW1fcGxhY2VtZW50ID0gMSwNCj4gPj4gLcKgwqDCoCAu
cGxhY2VtZW50ID0gJnR0X3BsYWNlbWVudF9mbGFncywNCj4gPj4gLcKgwqDCoCAubnVtX2J1c3lf
cGxhY2VtZW50ID0gMSwNCj4gPj4gLcKgwqDCoCAuYnVzeV9wbGFjZW1lbnQgPSAmc3lzX3BsYWNl
bWVudF9mbGFncywNCj4gPj4gK8KgwqDCoCAubnVtX3BsYWNlbWVudCA9IDIsDQo+ID4+ICvCoMKg
wqAgLnBsYWNlbWVudCA9IHR0X3BsYWNlbWVudF9mbGFncywNCj4gPj4gwqAgfTsNCj4gPj4gwqAg
wqAgYm9vbCBtZW1fdHlwZV9pc192cmFtKHUzMiBtZW1fdHlwZSkNCj4gPj4gQEAgLTIzMCw4ICsy
MzQsNiBAQCBzdGF0aWMgaW50IF9feGVfYm9fcGxhY2VtZW50X2Zvcl9mbGFncyhzdHJ1Y3QNCj4g
Pj4geGVfZGV2aWNlICp4ZSwgc3RydWN0IHhlX2JvICpibywNCj4gPj4gwqDCoMKgwqDCoCBiby0+
cGxhY2VtZW50ID0gKHN0cnVjdCB0dG1fcGxhY2VtZW50KSB7DQo+ID4+IMKgwqDCoMKgwqDCoMKg
wqDCoCAubnVtX3BsYWNlbWVudCA9IGMsDQo+ID4+IMKgwqDCoMKgwqDCoMKgwqDCoCAucGxhY2Vt
ZW50ID0gYm8tPnBsYWNlbWVudHMsDQo+ID4+IC3CoMKgwqDCoMKgwqDCoCAubnVtX2J1c3lfcGxh
Y2VtZW50ID0gYywNCj4gPj4gLcKgwqDCoMKgwqDCoMKgIC5idXN5X3BsYWNlbWVudCA9IGJvLT5w
bGFjZW1lbnRzLA0KPiA+PiDCoMKgwqDCoMKgIH07DQo+ID4+IMKgIMKgwqDCoMKgwqAgcmV0dXJu
IDA7DQo+ID4+IEBAIC0yNTEsNyArMjUzLDYgQEAgc3RhdGljIHZvaWQgeGVfZXZpY3RfZmxhZ3Mo
c3RydWN0DQo+ID4+IHR0bV9idWZmZXJfb2JqZWN0ICp0Ym8sDQo+ID4+IMKgwqDCoMKgwqDCoMKg
wqDCoCAvKiBEb24ndCBoYW5kbGUgc2NhdHRlciBnYXRoZXIgQk9zICovDQo+ID4+IMKgwqDCoMKg
wqDCoMKgwqDCoCBpZiAodGJvLT50eXBlID09IHR0bV9ib190eXBlX3NnKSB7DQo+ID4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBsYWNlbWVudC0+bnVtX3BsYWNlbWVudCA9IDA7DQo+ID4+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBsYWNlbWVudC0+bnVtX2J1c3lfcGxhY2VtZW50ID0g
MDsNCj4gPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuOw0KPiA+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgfQ0KPiA+PiDCoCBAQCAtMTM5MSw4ICsxMzkyLDYgQEAgc3RhdGljIGludCBf
X3hlX2JvX2ZpeGVkX3BsYWNlbWVudChzdHJ1Y3QNCj4gPj4geGVfZGV2aWNlICp4ZSwNCj4gPj4g
wqDCoMKgwqDCoCBiby0+cGxhY2VtZW50ID0gKHN0cnVjdCB0dG1fcGxhY2VtZW50KSB7DQo+ID4+
IMKgwqDCoMKgwqDCoMKgwqDCoCAubnVtX3BsYWNlbWVudCA9IDEsDQo+ID4+IMKgwqDCoMKgwqDC
oMKgwqDCoCAucGxhY2VtZW50ID0gcGxhY2UsDQo+ID4+IC3CoMKgwqDCoMKgwqDCoCAubnVtX2J1
c3lfcGxhY2VtZW50ID0gMSwNCj4gPj4gLcKgwqDCoMKgwqDCoMKgIC5idXN5X3BsYWNlbWVudCA9
IHBsYWNlLA0KPiA+PiDCoMKgwqDCoMKgIH07DQo+ID4+IMKgIMKgwqDCoMKgwqAgcmV0dXJuIDA7
DQo+ID4+IEBAIC0yMTUwLDkgKzIxNDksNyBAQCBpbnQgeGVfYm9fbWlncmF0ZShzdHJ1Y3QgeGVf
Ym8gKmJvLCB1MzIgbWVtX3R5cGUpDQo+ID4+IMKgIMKgwqDCoMKgwqAgeGVfcGxhY2VfZnJvbV90
dG1fdHlwZShtZW1fdHlwZSwgJnJlcXVlc3RlZCk7DQo+ID4+IMKgwqDCoMKgwqAgcGxhY2VtZW50
Lm51bV9wbGFjZW1lbnQgPSAxOw0KPiA+PiAtwqDCoMKgIHBsYWNlbWVudC5udW1fYnVzeV9wbGFj
ZW1lbnQgPSAxOw0KPiA+PiDCoMKgwqDCoMKgIHBsYWNlbWVudC5wbGFjZW1lbnQgPSAmcmVxdWVz
dGVkOw0KPiA+PiAtwqDCoMKgIHBsYWNlbWVudC5idXN5X3BsYWNlbWVudCA9ICZyZXF1ZXN0ZWQ7
DQo+ID4+IMKgIMKgwqDCoMKgwqAgLyoNCj4gPj4gwqDCoMKgwqDCoMKgICogU3RvbGVuIG5lZWRz
IHRvIGJlIGhhbmRsZWQgbGlrZSBiZWxvdyBWUkFNIGhhbmRsaW5nIGlmIHdlDQo+ID4+IGV2ZXIg
bmVlZA0KPiA+DQo=
