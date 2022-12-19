Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 791A9650889
	for <lists+dri-devel@lfdr.de>; Mon, 19 Dec 2022 09:23:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AAD510E1F7;
	Mon, 19 Dec 2022 08:22:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A59FA10E1F7;
 Mon, 19 Dec 2022 08:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671438125; x=1702974125;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=QadssjCDV5PLprBTDDWtAAeyWE7a9p/f00NETfKSTCA=;
 b=ZKabaZDTDv5jF6TH+hlekyJebh/TQsHYPHshIoqRTCfwj6+uE9NWkysh
 MGXVHyCh3lja4nL+Y3MyTLZ1bJGD1u3uAJt2KEaAvaNX670WVM+ud5gNe
 sl/iQVTHpEI44WRu6B50Hqc6cccu+Y9LMIP6Pgc7X+02NkCmgELdoiyWM
 tAarVd+FbeTjZdrp9EijMxE5YACLjKXMXLS85phoNbNmTJBCLHPyqdDRH
 MPOxgPAq2kBqytLXeBxM5czxYNNdPvqNgDSl5dhvc42muov+PnClsnBEP
 1sXN4o+1GlNaRuf9uy27tM8yqA5QNSKz3RFrI2Cr3WO/CCZKavHeuXzbO g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10565"; a="321187367"
X-IronPort-AV: E=Sophos;i="5.96,255,1665471600"; d="scan'208";a="321187367"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2022 00:22:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10565"; a="757534720"
X-IronPort-AV: E=Sophos;i="5.96,255,1665471600"; d="scan'208";a="757534720"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga002.fm.intel.com with ESMTP; 19 Dec 2022 00:22:04 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 19 Dec 2022 00:22:04 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 19 Dec 2022 00:22:04 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 19 Dec 2022 00:22:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MOjufdDsSPhRp/0y299rkQpa+HeugGbv/80qh8qcjo8VDSoFRtRQPHyq7bmurprEQqVM07Q/Z7FLEgXApHwKLaSaJzct6KZQiqVh3Hy73BF3FFkYPsZdAxkCl8pvDgfn/ZvU/nr/stARx2Sf2eu1FWHSf8ekkofSgk0ii9n/67j4KXbLI1vkRj2Rl5kVKHjd9FuvwQbXhPEG9g7Ol/snVyzowJTtyak3ul7AkVq9wP0Q/zqInVWX9hGMFN/SdCxPx/+4xgI01HkROJC0dTlBMzumyarGfOZ0Sh7MChiCTTvBGRRXCbsRF0dKfvbc5/3FxC4LbKPYUJMo3Y3vZqMeLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QadssjCDV5PLprBTDDWtAAeyWE7a9p/f00NETfKSTCA=;
 b=AiIahpwLTAS9Ldd61oZpoT2EI03m0vrmgEnIvjZXvAvQkQO4HXy7mZrDhvwhWAEzjGYr9XPJr3XC9a3hkEUdASy6slPp5E8gaumFk30P01VhVkD4boYsg0FmXL6TueZlPubvwUN5umcSOHIcFr+XEyuM5VYeXt5FfZGgr3TM1pSeSmxdrtAXdrmkh5KWyVefMSqwpDo4H6A1vw635bjoBxWauEbvn7K/NakIQPGDDTYDVS4Mj0MInxLYGQoqdts5ckusuFZ/9V9/QbjO6lZRf9vcNji3tE+5Oa7usKpAW/Ujw1MGbwIKrqCj6cw+ZEeqe+wtQ6w0kBw2+qdylc4lFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5924.16; Mon, 19 Dec 2022 08:22:01 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::4cb1:2965:376:8bda]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::4cb1:2965:376:8bda%7]) with mapi id 15.20.5924.016; Mon, 19 Dec 2022
 08:22:01 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Zheng Wang <zyytlz.wz@163.com>
Subject: Re: [Intel-gfx] [PATCH v3] drm/i915/gvt: fix double free bug in
 split_2MB_gtt_entry
Thread-Topic: [Intel-gfx] [PATCH v3] drm/i915/gvt: fix double free bug in
 split_2MB_gtt_entry
Thread-Index: AQHY6cLGBXkP1Tf3okih35bsJFVnIK5vEcgAgAAMroCABgz2AIAABv6A
Date: Mon, 19 Dec 2022 08:22:01 +0000
Message-ID: <11728bc1-7b59-1623-b517-d1a0d57eb275@intel.com>
References: <da557524-02ff-2ac7-7960-6f710c2d41d6@intel.com>
 <20221219075700.220058-1-zyytlz.wz@163.com>
In-Reply-To: <20221219075700.220058-1-zyytlz.wz@163.com>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5549:EE_|CO1PR11MB5073:EE_
x-ms-office365-filtering-correlation-id: c75a7344-0dd3-4bfb-3abb-08dae19a1ae8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kXeKNtnbJH2QIGAYj1Dtk9uut9BxCiciZXEZ3wQjQbbgnueyx6V+w3QIg72cvZOt21LzY7dUfy7WpMEUdjeftvQAxqTRW/eb6GRVy0Q9iPw1bROVou4nztMI57GMgIp5k2d+HcAXUpRajlImAgcoVCwdrUXNEcYANYEbKK0yXVUxbMqE5v+GF0X4VNitAQ6DX8O9pLCinJhgC9m+1xlSUexT9nMH4Tlivym6PsIjI+hyvd9gg/xCq3vmMtg16seLfRIdSc57NbVfqmGJdNJ/+kayjoOK57RZiuk4k3gjRzaZtTN4EdN24qEXzrrxiy8zeyczfBDHwzkYqhzZx4Ompn9MvR/MkKGqBoxGZnM57/2wOUsfo3g0bouDlnElGAf8gpTjFaHTZ7QXf3LCMZrp8Z+HVeTuqCCEX8kBC1YNUEtrpkrgabKs1h3Lt15Zx23xx//b6KAzAhpoQLsOJb2VZPiCO1wSTk5cmdgf3cwUH7hoZErye9XLUZoAWz4aTub3kpViCLk954LWhJmXjMWos+Kf2Y/uSy6D7aAILZNceNYg8L+XkIvk0579HF/GqdQsLBykxcRUOTaA/aMA5Cgyyeaqcr02l6AM2upX2zQO4xFNdr+2vIQyQ0ngI50hltnTNNSkWIsC5NyxGhXwxyQxY48RoDuM6Ayh5FqUmiW36rhut+432/rQ2TZhssZ8+6UpU6qWQv+N8pS/fFvchtyjIg1DQyoq8ivf72aVqZqYpJlTMgLGpI6CM4Ml5nf+DP9ul5Zr5sFfVhuEKRctJkYPWQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(396003)(376002)(39860400002)(346002)(136003)(451199015)(6506007)(478600001)(6486002)(36756003)(71200400001)(2906002)(53546011)(26005)(6512007)(186003)(31696002)(41300700001)(8676002)(66556008)(76116006)(66946007)(66476007)(66446008)(91956017)(38070700005)(64756008)(4326008)(7416002)(83380400001)(5660300002)(316002)(122000001)(8936002)(6916009)(54906003)(82960400001)(86362001)(38100700002)(31686004)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TmRVdEJ0bi9rSzdtaStpSGNEVWtDWlJWK3orM0ZiTDFBZEhpdTRtR3MySWd2?=
 =?utf-8?B?S05ESTlxMVFZVDBJNnEvRjlyQlZWREY2TTd1M1FOSUZtWVBBWFhrWXE1MDFa?=
 =?utf-8?B?ck9RUklyVDZsdCsrRVUvaWd2YUN3SDBSU2hEaU1Wd2dXOUNhanIxS2FST0VQ?=
 =?utf-8?B?Z2QyWkFBV2x0bjJ6UnIrRm1MRmtTMExHYUErQlViNkgrK2tqblRiT1haeW9h?=
 =?utf-8?B?eGMrdE5KUlFkY3ZhY0xOTlliSlJkWHgyc3ZhWW9xNUNuUEZVNWkzV3E2Sm5L?=
 =?utf-8?B?L0dVUW1Xekw3Z1RJSGl0YkhycXFvK0FDb2p3U3FVb2RjTHVOcHc3THcvQ3g5?=
 =?utf-8?B?ZVdGendGVWtzMnc5M1hsa3hXVDdjM1pmWWY0dlRlSGQvN0VRMGlQcmJBTlpY?=
 =?utf-8?B?clZTWCtuMVBSNDF0VE5kQ2pUT0t4cVUwZkF4S29EdTdhSWZOVmpVejR1dUkw?=
 =?utf-8?B?ODdHd1plRnlCQmNEQXFiL3ZWdm9NK0VUY1I3UkN2VXlzencrUG8yUm5nTmVG?=
 =?utf-8?B?RXNJcFVNRVBScEU1ajFJWk9vN09qZ1ZvcjNIZzBTLzI1NXRlbGIvZGFOSnlL?=
 =?utf-8?B?Z1hOVHpldVpKbnFscmhHQUVYVWlteTdRNWRhREs3MEJTYWlTeGNSeWZDd0oz?=
 =?utf-8?B?ZG5aZVRqQTF2S0xpQXo4dk04ZTBIT2Z1OTJSRnBWOG9nb0ppU2tubHZIZzZJ?=
 =?utf-8?B?MlRJeXcrYjJiM3BRQXh4ZlNvSFBrb1lPalRrUkZ6ZnZzN1B3dUdGMHdsRXAv?=
 =?utf-8?B?MUw4OWRTK1o1OHJvN1ZuNnk0OTEvR0kyc0hxUVBjampwdEdvNVlZeVhYMDhU?=
 =?utf-8?B?TzBNU1dDQUhub0dwaW5MQWQ0R09oQlV3eTQ3LzFoT3l4T0JNN1VERW1ZRFNS?=
 =?utf-8?B?c3haOU9kTk5rL1cxa0g1dVczUlRnT2JhMjRKblpQVG5CWWpzREZMMTQ4YUEw?=
 =?utf-8?B?RCtMRmlrdnk2RzBpWEF5elVuclFEcVQ4V1NLQWFKbVdvZm1NRlBNd3EwNEJC?=
 =?utf-8?B?bk9iRlh2dVVnVEI3dnU1V2pYeEE2SjRpYitIQVJjTGMyVVUwbi9XZU9uTjAy?=
 =?utf-8?B?R1dac0lCM0ltNjVPQnRpQ2tKMXJWLzEwY0JQMnlQMXNldEFkRVlaVEVqUW40?=
 =?utf-8?B?cDUwa28yakZxRnlNWXhxeFZEdytMY2l5YWtxN2VhVjJ5QWtOUDFwcVVwbWNu?=
 =?utf-8?B?U2kxVSttQnJCb1hwMXdMTG5RdFhSZFNjVkxXcGNDREt2c2tpc3I0T2tkaFk5?=
 =?utf-8?B?SGFNK2E1YWVMa0ZkUUhXcFZ6SGUvdUIzWGN3MDNCMEd0N29iTzA2T0JQZVZM?=
 =?utf-8?B?TnMrR0lEWWoxQWFpMG5TanFqWWZnaTJjNm9USkFzZ2hBSk1yb0ZBT256WCtD?=
 =?utf-8?B?L3NPMUNoMFR2aWowM1FlazlxUG9wMjRjMVVGMlo2UVA4UU9Gb0srMUhSTjdk?=
 =?utf-8?B?NjhSZGpxT1ZOaWRRMXNFSjRsdkxOaEg3TTBWNzVYZFdsOE9pV0hpeHViVU9H?=
 =?utf-8?B?QWdydVZZdGdNeXlDM2p4TXkrTjJrTmZlWVl6M2tQK1RORk9qQy9JRFNlWFNa?=
 =?utf-8?B?SHZQR1F4NzcxdFhpRHRzYzZiaE9peUEwcEVoa0xTazFqUmhDR1M4M01sM2J0?=
 =?utf-8?B?empDeDB1REdPSmFwTGJ2LzgyNDRsM0lZeXRsQ2gxK2FnSmtPVDlVMnRLSlNJ?=
 =?utf-8?B?R0Z4QUZXaGFFckhDWmRnU3ByY1lCMU43dWlmTVpTam84WWhBS3NEWXl1ZkNk?=
 =?utf-8?B?OXpYMm8rU2JTeHRtK3REYzR5c2E1c0c3MVlYQVFHclFWYWN1RG5FWGtaVlNn?=
 =?utf-8?B?MDYvTThBWWI3am5id3Mwa1FINzdLVHpDNTc2Vi9xcDM3Zk1TTjExL05mWnFM?=
 =?utf-8?B?dUpFblFBY08zTjNkaFo4TmpjTE9Vb3NFbFZ6ZndzTWYzdk5Idit5YXZaNmZE?=
 =?utf-8?B?U09oQjNhcjI3eTRveGV1N1FFTE45TkFPT3dzRzM1N0t1Mit3dVRmMHA0ekJx?=
 =?utf-8?B?T25CU2RvNmlRRHkwdy9RMjhIRks5ZjR1emZWbmdZbjdGK0F1V3dWYTNZenlY?=
 =?utf-8?B?SUI3OTJBRGNNOFk2bjBkWkYrYWdwMHY2STIvR2hPaElTQkh4ZUJuSE1ZUGNG?=
 =?utf-8?Q?YekwAt/+yGrdE+wjH7qYrDVUC?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E156909705587449AFC1269623DE30E1@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c75a7344-0dd3-4bfb-3abb-08dae19a1ae8
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2022 08:22:01.8517 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0R3swrm9fpEh67mTzj5nZRtp7hTIInuS1mT1KypJUxIJXF7zgeYQ0B8TY1sa6dAzeV/Y/KQXXh3h865W4zoGSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5073
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
Cc: "alex000young@gmail.com" <alex000young@gmail.com>,
 "security@kernel.org" <security@kernel.org>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "hackerzheng666@gmail.com" <hackerzheng666@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "1002992920@qq.com" <1002992920@qq.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTIvMTkvMjAyMiA5OjU3IEFNLCBaaGVuZyBXYW5nIHdyb3RlOg0KPiBIaSBaaGksDQo+IA0K
PiBUaGFua3MgYWdhaW4gZm9yIHlvdXIgcmVwbHkgYW5kIGNsZWFyIGV4cGxhaW5hdGlvbiBhYm91
dCB0aGUgZnVuY3Rpb24uDQo+IEkgc3RpbGwgaGF2ZSBzb21lIGRvdWJ0IGFib3V0IHRoZSBmaXgu
IEhlcmUgaXMgYSBpbnZva2UgY2hhaW4gOg0KPiBwcGd0dF9wb3B1bGF0ZV9zcHQNCj4gICAgLT5w
cGd0dF9wb3B1bGF0ZV9zaGFkb3dfZW50cnkNCj4gICAgICAtPnNwbGl0XzJNQl9ndHRfZW50cnkN
Cj4gQXMgZmFyIGFzIEknbSBjb25jZXJuZWQsIHdoZW4gc29tZXRoaW5nIGVycm9yIGhhcHBlbnMg
aW4gRE1BIG1hcHBpbmcsDQo+IHdoaWNoIHdpbGwgbWFrZSBpbnRlbF9ndnRfZG1hX21hcF9ndWVz
dF9wYWdlIHJldHVybiBub25lLXplcm8gY29kZSwNCj4gSXQgd2lsbCBpbnZva2UgcHBndHRfaW52
YWxpZGF0ZV9zcHQgYW5kIGNhbGwgcHBndHRfZnJlZV9zcHQsd2hpY2ggd2lsbA0KPiBmaW5hbGx5
IGZyZWUgc3B0IGJ5IGtmcmVlLiBCdXQgdGhlIGNhbGxlciBkb2Vzbid0IG5vdGljZSB0aGF0IGFu
ZCBmcmVlcw0KPiBzcHQgYnkgY2FsbGluZyBwcGd0dF9mcmVlX3NwdCBhZ2Fpbi4gVGhpcyBpcyBh
IHR5cGljYWwgVUFGL0RvdWJsZSBGcmVlDQo+IHZ1bG5lcmFiaWxpdHkuIFNvIEkgdGhpbmsgdGhl
IGtleSBwb2ludCBpcyBhYm91dCBob3cgdG8gaGFuZGxlIHNwdCBwcm9wZXJseS4NCj4gVGhlIGhh
bmRsZSBuZXdseSBhbGxvY2F0ZWQgc3B0IChha2Egc3ViX3NwdCkgaXMgbm90IHRoZSByb290IGNh
dXNlIG9mIHRoaXMNCj4gaXNzdWUuIENvdWxkIHlvdSBwbGVhc2UgZ2l2ZSBtZSBtb3JlIGFkdmlj
ZSBhYm91dCBob3cgdG8gZml4IHRoaXMgc2VjdXJpdHkNCj4gYnVnPyBCZXNpZGVzLCBJJ20gbm90
IHN1cmUgaWYgdGhlcmUgYXJlIG1vcmUgc2ltaWxhciBwcm9ibGVtcyBpbiBvdGhlIGxvY2F0aW9u
Lg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBaaGVuZyBXYW5nDQo+IA0KDQpJIHRoaW5rIGl0IGlz
IGEgY2FzZS1ieS1jYXNlIHRoaW5nLiBGb3IgZXhhbXBsZToNCg0KVGhlIGN1cnJlbnQgc2NlbmFy
aW8gaW4gdGhpcyBmdW5jdGlvbiBsb29rcyBsaWtlIGJlbG93Og0KDQpjYWxsZXIgcGFzcyBzcHQg
YQ0KZnVuY3Rpb24NCglhbGxvYyBzcHQgYg0KCXNvbWV0aGluZyBlcnJvcg0KCWZyZWUgc3B0IGEN
CglyZXR1cm4gZXJyb3INCg0KVGhlIHByb2JsZW0gaXM6IHRoZSBmdW5jdGlvbiB3cm9uZ2x5IGZy
ZWVzIHRoZSBzcHQgYSBpbnN0ZWFkIGZyZWUgd2hhdCANCml0IGFsbG9jYXRlcy4NCg0KQSBwcm9w
ZXIgZml4IHNob3VsZCBiZToNCg0KY2FsbGVyIHBhc3Mgc3B0IGENCmZ1bmN0aW9uDQoJYWxsb2Mg
c3B0IGINCglzb21ldGhpbmcgZXJyb3INCgkqZnJlZSBzcHQgYioNCglyZXR1cm4gZXJyb3INCg0K
VGhhbmtzLA0KWmhpLg0KDQo=
