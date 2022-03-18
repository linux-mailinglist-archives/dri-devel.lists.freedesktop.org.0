Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AA14DE0D7
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 19:13:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B3D810E22E;
	Fri, 18 Mar 2022 18:13:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D91B10E22E;
 Fri, 18 Mar 2022 18:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647627223; x=1679163223;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OVGf/ml3to+KiIgkLaZvtCb9SGYF7/4AXPRrh5XQ2mo=;
 b=ii8VOuhwukBId47rjNztOjutUrigFn6ej/+67y+i/AYuABTHcXq6YcuK
 41alvrb25ECDt9mPRQpZA7vZOpPg5kekbZFtH+50+Vx1NqQTwAO0fUsMV
 KB5bF4Md+bF28zqhBtyQCQbIh1ZU6qR+ZcBmI1cKNTMbIed5grKOA7KWM
 4CRzostBXN4RBT4EMAnwsLpCrNq4dyad5iL1YAe7bhDoetSHeK7C3pGdr
 8uPLQ62hP8x3XtNgzlSw1wubeWidL0Erbrl7IQQlZCw8SEzB1zV3kB9m8
 u8e92IlFRp1op5EPafvvQaL7ET0IvuxJaQd9ldwq9DKcsPxHdYboDn5VH A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10290"; a="239355904"
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="239355904"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 11:12:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="691402975"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by fmsmga001.fm.intel.com with ESMTP; 18 Mar 2022 11:12:14 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 18 Mar 2022 11:12:14 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 18 Mar 2022 11:12:13 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Fri, 18 Mar 2022 11:12:13 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Fri, 18 Mar 2022 11:12:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VnRFIF/0jMpT6wjdPEg3NS6XRN1g/OX2vVB3N6GsAo96/B8imtvSuT6Gaq0Z0Rt2xexseo2FTavRONWbaM33iMvztWXC53YY3QQIG+DqDmrRFEo+L1DkS3KYqPEmRa6ipU+rBYmnwrvN4hnuDKLfOXK+LXJoQ6hdC2EY2bZmF4LMUkVEAL1otZoHqV6xEfNeY05jQA439rP6ZZD8jbCTWUyZCrbbaZH+1CKCMl1dGdQqwjhL9lm+yeqAQEPmV33xYChvyoHbBbV99Ud3iBv0WLNbGKJgYVAJyMZiTKKuiw08i5X6Oz1NB9JOHx7O/L5VroFORvsf3wVmPtekegDU8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OVGf/ml3to+KiIgkLaZvtCb9SGYF7/4AXPRrh5XQ2mo=;
 b=kMDsceU2Fp+Mp5BaXpyQbhtU/matCi1Mk3ZQFwnIEAPGZ19U1jzoR/X2i8l7hK6Zeo4jKN468j4FFCySTWi2eITa05Hzko6Mi7tQgKmC8Z7SHWgYSUF9lQMnTJmnI+Tr0vFcmQtI+wlRg1f8xmh+SIXMBjq9DAWJiJgZcWCApIFw69RRn3L64z578Ut6j3SolijZmO3XT2tjiY5zL/aq/xjZcu8+t7pVyVbxiOO1vOfjrPeazFxhybJdGxG57mnlH+3RgG4uIo2nOatBImC3CnYz6vFfar3FJpCBppsW6MwUlioZ3klcX6cDxuetdST4lBlTrbaBN813BGrpnLGWLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2567.namprd11.prod.outlook.com (2603:10b6:a02:c5::32)
 by DM6PR11MB2697.namprd11.prod.outlook.com (2603:10b6:5:c3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.18; Fri, 18 Mar
 2022 18:12:11 +0000
Received: from BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::f1ed:9074:5f82:150d]) by BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::f1ed:9074:5f82:150d%7]) with mapi id 15.20.5081.018; Fri, 18 Mar 2022
 18:12:11 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH] drm/i915: avoid concurrent writes to aux_inv
Thread-Topic: [Intel-gfx] [PATCH] drm/i915: avoid concurrent writes to aux_inv
Thread-Index: AQHYOomImJgbr2W/ukeYl6I1AeepdKzFNqkAgAAikcA=
Date: Fri, 18 Mar 2022 18:12:11 +0000
Message-ID: <BYAPR11MB25678F24A1093AB70032745A9A139@BYAPR11MB2567.namprd11.prod.outlook.com>
References: <20220318052619.3429370-1-fei.yang@intel.com>
 <8d283c4b-6f16-a235-7c57-ad8a67252ca9@linux.intel.com>
In-Reply-To: <8d283c4b-6f16-a235-7c57-ad8a67252ca9@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.401.20
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0560e3bc-a165-4d54-45c1-08da090ad271
x-ms-traffictypediagnostic: DM6PR11MB2697:EE_
x-microsoft-antispam-prvs: <DM6PR11MB26976BAA86F8A17A341081309A139@DM6PR11MB2697.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2+rjMWvcGIs6+OzDn8kDMMkYUdiTlWvpvoD80aPNxiDTkv+OffkijZMpTgsmoZLP8AqB+aPkz18KqMguJ8g1Q+pV6srnIry2/80WsEz0dsombV4eqF5sCdxj93fV0HY1lD3lKR2xvikAXpRp5hUlldWlh3qLbNSDVLJbgL1/7BZjY/jZ0XmL9F8rcGoGL6Vc+pzfGQ4tacxAmXCK8/CsIDEqvDqYmvlVn1clXLJcnTh7YmSj/P8nDTEZ5mUTkZkhRuK+wqYnu6NSM9Kr34u9jSqYQlx39Ic2BrncdHx4KMXPjHZ9baI1JuewulS3eJxXEhr6rlyR6Cwsw7eGGso3mkirj//xPzdU1gsbs6VidxTSAqQYipxM8EiZOYdX05VQq6LSGykw299dUj8AniR9qDmjXhP+/cJEZwC1bPm0d6b52L98sxPl2Du3zZ9gh8Wl12UijK9WCZD9a6hyQ6KU81++67VO+Y4CVWhde5DHQ2KAfcqe3TVa6ExzERrBuxu4AfvX4aEWnmxX/BYNI2Rp9rDkbNM2RQ37OOAgy6cX97g9zmm4WOvgmk8cGJeBWAipjnW/+FphryRrGgt9NU4Exv1VWTSFneTXoAomp7m3Z6CENFCBvydqvCHZhEYX14STHsVHwxNz+8GX9elJVi49o6ihnrIGgl3tDQy7bzJ6YJaMWSYyPu1N58010aorBmOVvCzF5oxGDMpTHx8nkM4I+A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2567.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(7696005)(110136005)(83380400001)(71200400001)(33656002)(5660300002)(6506007)(316002)(9686003)(38070700005)(186003)(8936002)(64756008)(66946007)(66476007)(66446008)(82960400001)(66556008)(26005)(76116006)(122000001)(52536014)(508600001)(2906002)(38100700002)(4326008)(86362001)(55016003)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a3FNT1p6cEs0TkZnTWJuTGVVV0xnTldJVFJJaytjSFVoeGdvb3NjRVJCYkJm?=
 =?utf-8?B?QVZZTkk1V3pUNERIWHlkWVlmZ2RHUmsrdWRKSmxmbGJZU3NBRVdmQ0RWSlRC?=
 =?utf-8?B?Mzg1NnJrWExwb1hCeWo4OGEyZ3ZnVnBpQ3JSU3JqY2pqZU5FR1BXKythZ0dt?=
 =?utf-8?B?YXN5QVJpTG9jK2RXam5sbFQ2SnFKU1hMbTBTTUlHUzZiS3lubW5KZ2NXSEJj?=
 =?utf-8?B?R1VEYy9XUWQrU0M3K09ua0laMlhSb2k0T25NMkc3MnZxbGVkdjI5NGNNcE1U?=
 =?utf-8?B?MXV0MW5ObFVEYTdFK3lid3dzSkpFb0wwbmt2aVZaOERHbjUrTU9QV0pQZmFh?=
 =?utf-8?B?VXlzTlNDWUhHaGd1NkpZSG04WG1ITDZBeEFzSkxxbGpJbkxhaDNyRVdKL3Nm?=
 =?utf-8?B?VnpVZ0RKRnViOG1HQW0vazRZU0Via05vT3c2dFlKdTlGTGRZenNVTmpoaDM4?=
 =?utf-8?B?MGJoQ1ZIUitEU25JM0RRMFdEb1ZxaE5rbWhiNTVQTmpweTBtSTd3aXkydnJk?=
 =?utf-8?B?cE1TY1JuZFB3Ny9BRnVBbCt1U0tGUHZrSXZOOGhFYTJISEFtejFJazVQVSt5?=
 =?utf-8?B?eEI2UitxeEVzbU5CSnJGNlc2S0tTcExiTDBDY3duR2hVTGFRSmQ2QzdXcFBG?=
 =?utf-8?B?bzhaYkRJYkltamc4MnhheU1HV2grVXp6ZUlzL0x6Mml5elI5TmJXdWFmKzNO?=
 =?utf-8?B?MkRhcnNxMHRUT3k2Rm9oTEYrWUhOWkNYUlZqYnRzMHZRN2ZUdWh2cGJ1SkNy?=
 =?utf-8?B?VjJYcUVGTzdjTXFLQ0ExaVJna0s0NjAvNm50ZVZ4c1RNc3pHNWovKzBaTXZH?=
 =?utf-8?B?OFdkTjgwcE0rOXN0VTdxVWZCMTE3M09OZ2NMRDB4NHJtb1Job0NDRFZuUnJn?=
 =?utf-8?B?SVVxTWZsQmUrZGphWVJscS9NdHVtZUZtUUI4b1VrOUZqdEpmR2Z1Y1l2dCt0?=
 =?utf-8?B?WDFaNDdUSEN3bEFWemp4VmpNcWNXZzB2UUlER2xnWnRqSzZHaEJZd3VoWTA0?=
 =?utf-8?B?VG9jbTZFTjVaOEM4Ly9jWXdtdkdSR2ovU1NPbGtNc0dHR1pNOTF6SWtNWHpP?=
 =?utf-8?B?THY5b0RPRDhmZTkvQjI5RnZWaWxyV2lZK2kzS3h6dHdRcTEzakloTnNXK3Zz?=
 =?utf-8?B?UVVPR3NkVDM5RzRIYjNPUkZ6ZzRuRGE2Q1d0NHk3a09PK1hIQ1QveEkxYkZG?=
 =?utf-8?B?QWlQNjFpU0VLR2padGIyOTdnS2MvMzVkdmUxL3ZURkRiZmhqbGR3WmpVZmZ2?=
 =?utf-8?B?c1JDZE9KMjBWbnVncGVkZkRvV0tLclZ5MnlXaFFTdmg0YXo1OVhNYXIyN3RT?=
 =?utf-8?B?RVpNOCtyd2poRVVWWVQyZTVDSUpUbWQwcmxyYVAzbm5EbWNHV3Fjc2VTUzhu?=
 =?utf-8?B?MjB0T05HOVk4VjZuTGpsTzk1R3VjTk5tN1NtWXpCQ2lKdFNNTlpVVXh1NGZL?=
 =?utf-8?B?Mk55WWlZSnNjcTBhVlpHY0NSdTdHQkg2SkxvYW5XSmppVFVmazhNZFNFekhY?=
 =?utf-8?B?RTYycWZXa3BoSnBLRU5pTkNoZkJVWnZWVXpkQVdSdnQzOGtReE9pRFRvd0tH?=
 =?utf-8?B?WlNIU25HWVNUeGQ0Z1EydEp4U3FEWUF4YlhNRzNnUjk5TW85eVIyd3BmWUFH?=
 =?utf-8?B?SFowa011RUc3Smd2eVJLS3RjUkxNT3lEY2RnWFFOQWhjMkNwYmhLWjF5cklN?=
 =?utf-8?B?UXpjbWIzQk14U3pOTnZEb1o2aVFGbjJVdGczcWRhdEJMVFVrSnp0U2I2L2Rq?=
 =?utf-8?B?UUhvT3oyR0plNkl3aTRtelBIa0o4bXRVSy9oZ0dVM2hGR2w4VW5nL2xRZnp2?=
 =?utf-8?B?VTBkamVlQm9iaUlwb1BVcUQ5enFLMTVNNk1ZNmhtQWRsNXBpZlpZUWZEVmNo?=
 =?utf-8?B?a2wxdmhFL0JJSHZDU0src0RWQ0xaMWR5UjBCMm9XNnBrTXdFMTE3NWdlYnhl?=
 =?utf-8?Q?I2Xp4P+9KPuizolXrPStXKoZSz7zKD0J?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2567.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0560e3bc-a165-4d54-45c1-08da090ad271
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2022 18:12:11.0839 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CsvftcL8zFm2zJvBvOVuwoO2TU3qJBrlJWV6KaEIejMAum7SDS7c6uZldpe4MYkZd1qyZcC0wehRXIOTP2CVbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2697
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pj4gICBzdGF0aWMgdTMyICpnZW4xMl9lbWl0X2F1eF90YWJsZV9pbnYoY29uc3QgaTkxNV9yZWdf
dCBpbnZfcmVnLCB1MzIgKmNzKQ0KPj4gICB7DQo+PiAgIAkqY3MrKyA9IE1JX0xPQURfUkVHSVNU
RVJfSU1NKDEpOw0KPj4gQEAgLTI5Niw3ICsyNzIsNyBAQCBpbnQgZ2VuMTJfZW1pdF9mbHVzaF94
Y3Moc3RydWN0IGk5MTVfcmVxdWVzdCAqcnEsIHUzMiBtb2RlKQ0KPj4gICAJCWlmICghSEFTX0ZM
QVRfQ0NTKHJxLT5lbmdpbmUtPmk5MTUpKSB7DQo+PiAgIAkJCWF1eF9pbnYgPSBycS0+ZW5naW5l
LT5tYXNrICYgfkJJVChCQ1MwKTsNCj4+ICAgCQkJaWYgKGF1eF9pbnYpDQo+PiAtCQkJCWNtZCAr
PSAyICogaHdlaWdodDMyKGF1eF9pbnYpICsgMjsNCj4+ICsJCQkJY21kICs9IDQ7DQo+PiAgIAkJ
fQ0KPj4gICAJfQ0KPj4gICANCj4+IEBAIC0zMjksMTQgKzMwNSwxNiBAQCBpbnQgZ2VuMTJfZW1p
dF9mbHVzaF94Y3Moc3RydWN0IGk5MTVfcmVxdWVzdCAqcnEsIHUzMiBtb2RlKQ0KPj4gICAJKmNz
KysgPSAwOyAvKiB2YWx1ZSAqLw0KPj4gICANCj4+ICAgCWlmIChhdXhfaW52KSB7IC8qIGhzZGVz
OiAxODA5MTc1NzkwICovDQo+PiAtCQlzdHJ1Y3QgaW50ZWxfZW5naW5lX2NzICplbmdpbmU7DQo+
PiAtCQl1bnNpZ25lZCBpbnQgdG1wOw0KPj4gLQ0KPj4gLQkJKmNzKysgPSBNSV9MT0FEX1JFR0lT
VEVSX0lNTShod2VpZ2h0MzIoYXV4X2ludikpOw0KPj4gLQkJZm9yX2VhY2hfZW5naW5lX21hc2tl
ZChlbmdpbmUsIHJxLT5lbmdpbmUtPmd0LCBhdXhfaW52LCB0bXApIHsNCj4+IC0JCQkqY3MrKyA9
IGk5MTVfbW1pb19yZWdfb2Zmc2V0KGF1eF9pbnZfcmVnKGVuZ2luZSkpOw0KPj4gLQkJCSpjcysr
ID0gQVVYX0lOVjsNCj4+ICsJCSpjcysrID0gTUlfTE9BRF9SRUdJU1RFUl9JTU0oMSkgfCBNSV9M
UklfTU1JT19SRU1BUF9FTjsNCj4gDQo+IENvb2wsIEkgZGlkbid0IGtub3cgdGhpcyBleGlzdHMu
IEZpcnN0IEJzcGVjIGxpbmsgSSBmb3VuZCBkaWQgbm90IG1lbnRpb24gdGhlc2UgcmVnaXN0ZXIs
IGJ1dCBzZWNvbmQgZGlkLg0KPiBUaGF0IG9uZSBob3dldmVyICgyOTU0NSkgaGFzIGEgd29ycnlp
bmcgInJlbW92ZWQgYnkiIHRhZyB3aGljaCBzZWVtcyB0byBwb2ludCB0byBhIHN0b3J5IHN1Z2dl
c3RpbmcgdGhlDQo+IHJlbWFwcGluZyB0YWJsZSBtaWdodCBiZSBnb25lIG9uIG1hY2hpbmVzIHdp
dGggZmxhdCBjY3M/ISBDb3VsZCB5b3UgZG91YmxlIGNoZWNrIHBsZWFzZT8NCg0KVGhlIHZhcmlh
YmxlIGF1eF9pbnYgaXMgc2V0IG9ubHkgaWYgKCFIQVNfRkxBVF9DQ1MocnEtPmVuZ2luZS0+aTkx
NSkpLg0KDQo+PiArCQlpZiAocnEtPmVuZ2luZS0+Y2xhc3MgPT0gVklERU9fREVDT0RFX0NMQVNT
KSB7DQo+PiArCQkJKmNzKysgPSBpOTE1X21taW9fcmVnX29mZnNldChHRU4xMl9WRDBfQVVYX05W
KTsNCj4+ICsJCX0gZWxzZSBpZiAocnEtPmVuZ2luZS0+Y2xhc3MgPT0gVklERU9fRU5IQU5DRU1F
TlRfQ0xBU1MpIHsNCj4+ICsJCQkqY3MrKyA9IGk5MTVfbW1pb19yZWdfb2Zmc2V0KEdFTjEyX1ZF
MF9BVVhfTlYpOw0KPj4gKwkJfSBlbHNlIHsNCj4+ICsJCQlHRU1fQlVHX09OKCJ1bmtub3duIGF1
eF9pbnYgcmVnXG4iKTsNCj4+ICsJCQkqY3MrKyA9IGk5MTVfbW1pb19yZWdfb2Zmc2V0KElOVkFM
SURfTU1JT19SRUcpOw0KPg0KPiBJJ2QgY29uc2lkZXIgbm90IGVtaXR0aW5nIHRoZSBMUkkgaWYg
d2UgZG9uJ3Qga25vdyB3aGF0IHRvIHB1dCBpbiB1bmxlc3MgdGhlcmUgaXMgc29tZSBoaWRkZW4g
cG9pbnQgdG8gZG8gaXQ/DQoNClRoYXQncyB0cnVlLiBJIHdhcyBmb2xsb3dpbmcgdGhlIG9yaWdp
bmFsIGxvZ2ljIGZsb3cgaGVyZS4gSSB0aGluayBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gY2hlY2sg
Zm9yIGVuZ2luZSBjbGFzcyBiZWZvcmUgc2V0dGluZyB0aGUgdmFyaWFibGUgYXV4X2ludi4NCg0K
Pg0KPj4gICAJCX0NCj4+ICsJCSpjcysrID0gQVVYX0lOVjsNCj4+ICAgCQkqY3MrKyA9IE1JX05P
T1A7DQo+PiAgIAl9DQo+PiAgIA0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2d0L2ludGVsX2dwdV9jb21tYW5kcy5oIA0KPj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9p
bnRlbF9ncHVfY29tbWFuZHMuaA0KPj4gaW5kZXggZDExMmZmZDU2NDE4Li4yZDE1MGVlYzVjNjUg
MTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9ncHVfY29tbWFu
ZHMuaA0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfZ3B1X2NvbW1hbmRz
LmgNCj4+IEBAIC0xNDQsNiArMTQ0LDcgQEANCj4+ICAgI2RlZmluZSBNSV9MT0FEX1JFR0lTVEVS
X0lNTSh4KQlNSV9JTlNUUigweDIyLCAyKih4KS0xKQ0KPj4gICAvKiBHZW4xMSsuIGFkZHIgPSBi
YXNlICsgKGN0eF9yZXN0b3JlID8gb2Zmc2V0ICYgR0VOTUFTSygxMiwyKSA6IG9mZnNldCkgKi8N
Cj4+ICAgI2RlZmluZSAgIE1JX0xSSV9MUk1fQ1NfTU1JTwkJUkVHX0JJVCgxOSkNCj4+ICsjZGVm
aW5lICAgTUlfTFJJX01NSU9fUkVNQVBfRU4JCSgxIDw8IDE3KQ0KPj4gICAjZGVmaW5lICAgTUlf
TFJJX0ZPUkNFX1BPU1RFRAkJKDE8PDEyKQ0KPg0KPiBQYXNzaW5nIG9ic2VydmF0aW9uIC0gdGhy
ZWUgYml0cywgdGhyZWUgZmxhdm91cnMgb2YgZXhwcmVzc2luZyB0aGVtLCBzaWdoLi4uDQpIYWhh
LCBSRUdfQklUKDE3KSBpdCBpcy4gVGhlIG90aGVyIG9uZSBjYXVzZXMgYSBDSEVDSzpTUEFDSU5H
LCBidXQgZG9uJ3Qgd2FudCB0byB0b3VjaCB0aGF0IGluIHRoaXMgcGF0Y2guDQoNCj4+ICAgI2Rl
ZmluZSBNSV9MT0FEX1JFR0lTVEVSX0lNTV9NQVhfUkVHUyAoMTI2KQ0KPj4gICAjZGVmaW5lIE1J
X1NUT1JFX1JFR0lTVEVSX01FTSAgICAgICAgTUlfSU5TVFIoMHgyNCwgMSkNCg==
