Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB196528C4
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 23:11:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3EAE10E41D;
	Tue, 20 Dec 2022 22:10:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6182610E41C;
 Tue, 20 Dec 2022 22:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671574225; x=1703110225;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=db19C1h8yI883J+FXe5jS0dUgWqY/YJaGJPgTIgRmfc=;
 b=leWqFLmdwY82zvXyoVPd5uojx++nU4sC8j7DsDwyocTyG2PUEA68UGk2
 gLuV0w4zX4R4xGqQMbi6DVyCzsSjHNMu+Wmwqydm87ZAh1VAnp8ZZKepM
 Js8+mXfmCP42icEmHyVBG+51ztRdw0HUS7qnzf8NY78uRSqbrFL1SoFcP
 WgtZb4kF8kSIBLqTWzUQgQ1KglSiKO4wyuLwy2qC04p+r0gWfQP6+1oQZ
 nxMQIrkMcyNZDiM7dbMGlsbrznse2ojolSUJO5NkcJfqUACVAnkquYQSr
 T3a+e36pU9LXIszONk+TfUUsknlxJZYs+n5uspBHpW81kfeYjbazDDGH3 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="384075879"
X-IronPort-AV: E=Sophos;i="5.96,259,1665471600"; d="scan'208";a="384075879"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2022 14:10:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="719731649"
X-IronPort-AV: E=Sophos;i="5.96,259,1665471600"; d="scan'208";a="719731649"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga004.fm.intel.com with ESMTP; 20 Dec 2022 14:10:18 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 20 Dec 2022 14:10:17 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 20 Dec 2022 14:10:17 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 20 Dec 2022 14:10:17 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 20 Dec 2022 14:10:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dfDpRBijf2hFWdBjRJPfrzKnymVI6PeLBBUK74dqMGScly4l1gpaAntzRhadUWND//xFfnNeQJSc0PNsQ40DPGTQALw7ao8ldyLAYxl+9zM2GX9jIk09h5r+Lx7e05O55rZy/UmllJB+ajGgSpllh+ku4pXyawogyvulCOlVUtkAWPRdoRy1EQxV9D5BScRDADDeqjFqn2ebfyaOOsHfGD2U5wAsWMLgjaaVMJUKOEFTJ3+ET78N/L5qE+6qFTC+0J3lZKPczyM7cc6nJ4YjqbQLH96x4493gImlnDzlO/5vj2RbhcKdxqhsUxT/facZRESKMHL+bWO8FP2h3rX6nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=db19C1h8yI883J+FXe5jS0dUgWqY/YJaGJPgTIgRmfc=;
 b=CkG49bFX6pPs7Bw0HcLvew+p0Odt+Qd3maJApD0lBfBJEBkpJglkMxjlw6TG35w7/QbMSzUuPxlFGxDjlSYPYz06R7z6tqGQ1KypcX2h5/L5PmOUsrrNXU+S7OduwpsPXblgv7ocE9mok116rwX3eiJxGhHxlG0BGS87HUXb0xlEMBjG+goI+U+b8QT8+gCgRixMlVhEZKU1AkDTFhBi8gaTWTGLHbTWC3csE5dOUMbboNWp2x+L6H/w8YK2Co8wu2wB/whgtkEyXMJFsgF1EWA6D5SIyZCHSSyFFkTTQpq3HzFGxHPkTEuDRk9+tdEWIuZq1tEZXd6uMxy0XlsOTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 DM4PR11MB5343.namprd11.prod.outlook.com (2603:10b6:5:392::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5924.16; Tue, 20 Dec 2022 22:10:15 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::8901:2af2:6e02:c95c]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::8901:2af2:6e02:c95c%5]) with mapi id 15.20.5924.016; Tue, 20 Dec 2022
 22:10:15 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/1] drm/i915/pxp: Use drm_dbg if arb session failed due
 to fw version
Thread-Topic: [PATCH 1/1] drm/i915/pxp: Use drm_dbg if arb session failed due
 to fw version
Thread-Index: AQHZFL56YWq96zWuGk+h+0y7Ad4IF653VvqA
Date: Tue, 20 Dec 2022 22:10:15 +0000
Message-ID: <e5a1ef4709c5cd18e92fb0cc6951a46aec9a531b.camel@intel.com>
References: <20221220220304.2383273-1-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20221220220304.2383273-1-alan.previn.teres.alexis@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|DM4PR11MB5343:EE_
x-ms-office365-filtering-correlation-id: 451746b8-b2eb-4bf7-57de-08dae2d6f903
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: B3j/EqzN/Bw2vClY5IaBoggX1clgftXWzz4k0LP7rYeZkX5V2gpYPMii71hWM3o5yFS3PHtmc8daNVCVDNID6s9pIWbjjHSAV3GPTuEWDJC5Wh0B4/8u4CK30QAbF9btMJB7hkONVCcZwJxQ1wURYh7VSJ6ITf7ehQ1aldkbY3Bpqp7LusPaLUsS09Ygi6xL0UixYHLd77yUO+PIwF7xeFEEi9gzHNddOJjk9GBe52oJL4Mr3PMZFnb6aEGr4S1eB07vowvBsc7snwzGOv1XFx2GyZtDFk8MJX0C0WqvcHBFna5c0W2rvuHlUyo/SRAXyJp2rFXYRF853Sk7VUBtJre3S7ktphu45lP+0trxNHTVvGpcBbBl7NgYOE6vWGnSzi8IalQ/Mhw9r+28QfznFIeFYk1sGVu/YRpX/C0vtDMPP8j6v8liLhz+9epFs83fZtPf0zNet5zT9ikjCCUbCTJBFZIpXJQRIgvx9RVmZIDoixxZ4pxwZd0z1lhrFt2QvdEQC1MUjSyFAy1SH7uk6aX2zWprTaw/yrzVeitxjWYzsx7WD0EtsCIJp/Zhzpk1DpqxD/OUtHaLrOGjH3phq2oPV2FbOHWxTDoUm55fbJBrlMRZzh2SpzfP/F3QX2FJUAaw+tNRSmqdsx7vFxwmim+h61n6TUo8+urLmaWtslcGWj1EofHXiKHKy++JqwRD2lGgBqqLzXefPP8tuiM3Zw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(376002)(39860400002)(136003)(346002)(366004)(451199015)(76116006)(66476007)(66446008)(66556008)(91956017)(450100002)(66946007)(86362001)(4326008)(64756008)(8676002)(316002)(5660300002)(36756003)(8936002)(2616005)(41300700001)(186003)(6506007)(6512007)(107886003)(26005)(71200400001)(38070700005)(83380400001)(38100700002)(54906003)(122000001)(82960400001)(6486002)(478600001)(6916009)(2906002)(4001150100001)(4744005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZUJLWHR1U0dQQ1dZTzdQcVNybURCZVd6c094K1REZk9oZi9FcmMwN2NGVkRL?=
 =?utf-8?B?aHN6ajVnbkxJVkt2YVNrcXlOejVTaEFMb2NpOVBrNU9tN04yK3RyUG1FSHNs?=
 =?utf-8?B?WTRtLzA1bkM1VThKeXpiUXRMVXdqUURqRC80RGdwVjJIWmJDdHVKcmVCNXhM?=
 =?utf-8?B?Z04xcWNxcVQ2aG52bitIczlwbGpXV3huaEd3TFFBUVhsM0VNSysxRU1mV0ZU?=
 =?utf-8?B?TTRMM0pjcUJtV3F4dmh5NHRMVk93Zm0rLzVhZDdDNjE3SnlZSVE2ejNGcGRR?=
 =?utf-8?B?ZXp4VE8xaEUwOHVKU2o1YjlwQmc0NkNjSkUwNG5yZXBTQUVMUU9Hdkthc0VS?=
 =?utf-8?B?b0JSaWxEZ0FUVFZqaXp0UGZHajRjNGs1TW4rd2Y1K3o0R0ZWSHhvNHpwQjBI?=
 =?utf-8?B?Z3NzV1ZJTEN5N2d2b1Z6Y0RweGFRWHBsTDRObTNOUzkvek9hT1k2T2I0NVkv?=
 =?utf-8?B?KzFNODhRRE96OTFzZDZlbzFMZnJRK2UwZjdSY01jbkcwaWNCNWdsYkhPaFoy?=
 =?utf-8?B?eVB3b3hXeDNDVGZXVUFSd1M1dTArQ3I4eGd2V1RxUkF2ZVVpYUd1VTE3aFZJ?=
 =?utf-8?B?NjJBVnB2QWo1cnIrODFyT3NTR3hnT2d4aU9yYUQ5WEJVR2FpVTVIcjEzdklp?=
 =?utf-8?B?dmZoOTAzbmRkdWl4aGtMV0s3MkNveXRnVDNpMzY1Z1pnTWcrWURUeEwvZ1dn?=
 =?utf-8?B?MWpuQmJHajR5eVVwaUMwQnZScFFPOFk5NldPL3d0Nm1TUUdiOXRTeWwvWkZR?=
 =?utf-8?B?Y293djN6OU5jelJZMC9mc2J1SnE4TUw3UER6REZ4cmQ1Um5xeXZUUjJoRWwy?=
 =?utf-8?B?aXphVk82b2VBZkdmMlRQK2t3bG8xUExLaFI3cDBoaE8wTXVYcmxjNmplVm1j?=
 =?utf-8?B?RDNqT3pJY1pRU213R0FSNlplVXEzaHZGWGNNeU4vM1NkdWgvcE5Kc1pJMEhF?=
 =?utf-8?B?M3VZdjFCbTNkcWxCUXpPUUtjVlI5V093VDEzUWNwRmIrVnY1ZGFoLzdGaUZR?=
 =?utf-8?B?QmVMc0VQT1pHcnhLSUEwdnd6VVVhWk95OGI3bkZWM25rd2pLdUp5ci9iSTlO?=
 =?utf-8?B?cjZiUXZUYllMS2pQNjhkb2JFclozZTdCOVFKNjFLaVVpc2dlZUZsWnl4aDAy?=
 =?utf-8?B?MzFidG14elZXSnlXVGhYbUwzcUg1eG03ZldlcjFFeFRxZW16WkJhSGEyckZk?=
 =?utf-8?B?SW5CUVNXN1ZDVUxrRENZZUVyN3JLZXhnS0lLMUVzcHNialVZRlRwQ0M4Zkw4?=
 =?utf-8?B?VHU4Q1B3UndMTGU5YXQ2ZnJva1BkRFJoSzZneFhUOHJ0V3JscTg4WlpSWllB?=
 =?utf-8?B?alNocGNVKzNiMEpjSWovOWVjN0JDeHBUOStHcm1kL254ZlBHVm1RWTN0c2JM?=
 =?utf-8?B?aGFIZjg2TDJNSGdQNDFqb20rT2dHVXZMTlVhd1JZcjhKU0VuSzVnV0dXZ0lR?=
 =?utf-8?B?SEEycDZhcTd2UUkzVmhibWlWajVvQTliY1BmNFd3YzJmSGVreFhMdzJQN1R6?=
 =?utf-8?B?c1liTWhicUpLekUwMFkvVmw0OU5qS1h4Ujhib2tnQ3lvN3FWQ0pGM0hVVnBG?=
 =?utf-8?B?QlMrR2FZbDh4TmRES1djN3lzYVR5a0pMa0hJN1lTVWZ3Z2sxYmpkdTF1dUNs?=
 =?utf-8?B?ZUhqd1Q3d0E4dElhY1AzMm1zUUJoSisxUXNWVHdwMnQ4Tzk3cjRuM1M5aVhh?=
 =?utf-8?B?M3FsL2kvNWFmZUREOFYxeUtkMGFIZzZiR3pla1dkR1BUa3pBOE4yWStYUVh6?=
 =?utf-8?B?aFJKeThHR1J0bW5mSmRWSjhHQXV2dXQyd1diVnhiblQ3UzJodnZMcXdvOGdO?=
 =?utf-8?B?eTNPa1BhdURkK29XbjZzNXdSN25HZUZ5Wk5JcjVROFZFZEoyclphbGI0YmFj?=
 =?utf-8?B?aTZxS1JIb0FpMEtwMUFSNGc3MjJlak4rMUZQNnRaclJqd0U4V1YxMVI3citw?=
 =?utf-8?B?Rk16UzhkRVNPWHpaUXJOZy9PNTlGZE1DU2twbUNpS0FUeEFwZE5FZVkwZGVC?=
 =?utf-8?B?eEhYOG1RZjlqL3RDVFVlRUJ0T3E5NWVpcW05THU2MUJqMjl6Zk5nWWVjcXRF?=
 =?utf-8?B?alRJZjlRUWpZY0lLRVRpU2hza2JPLzRlM1ZmSGdRZlN3OEh6cGduOGduWFNI?=
 =?utf-8?B?SHhYNHpacU1EK3hqaXdZUVZkSTY4UFE3aWowalpwL0JmKy9WbUNscDVYTjIz?=
 =?utf-8?Q?ouwXrKr3c5C+jlqMHUaJR/Q=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BDE80EA2A5DBA4449BCF44F63D4A95F4@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 451746b8-b2eb-4bf7-57de-08dae2d6f903
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2022 22:10:15.4346 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kMi4UBaKQ5TSGXdwORzEuJ7rE0+1HxRydn+EZ7TcexG1LsN9PbiS0gTXe2ptNGYuYikEnbevMkI9JLO/kOuwtGSSwEncP9h+uHcb5sau0cF3eaU5VjrtEjfmBpl1puhx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5343
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
Cc: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Harrison,
 John C" <john.c.harrison@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SWdub3JlIHRoaXMsIHVzZSByZXYyIGluc3RlYWQsIGFwb2xvZ2llcyBmb3IgdGhlIG1pc3Rha2Uu
DQoNCk9uIFR1ZSwgMjAyMi0xMi0yMCBhdCAxNDowMyAtMDgwMCwgVGVyZXMgQWxleGlzLCBBbGFu
IFByZXZpbiB3cm90ZToNCj4gSWYgUFhQIGFyYi1zZXNzaW9uIGlzIGJlaW5nIGF0dGVtcHRlZCBv
biBvbGRlciBoYXJkd2FyZSBTS1VzIG9yDQo+IG9uIGhhcmR3YXJlIHdpdGggb2xkZXIsIHVuc3Vw
cG9ydGVkLCBmaXJtd2FyZSB2ZXJzaW9ucywgdGhlbiBkb24ndA0KPiByZXBvcnQgdGhlIGZhaWx1
cmUgd2l0aCBhIGRybV9lcnJvci4gSW5zdGVhZCwgbG9vayBzcGVjaWZpY2FsbHkgZm9yDQo+IHRo
ZSBBUEktdmVyc2lvbiBlcnJvciByZXBseSBhbmQgZHJtX2RiZyB0aGF0IHJlcGx5LiBJbiB0aGlz
IGNhc2UsIHRoZQ0KPiB1c2VyLXNwYWNlIHdpbGwgZXZlbnR1YWxseSBnZXQgYSAtRU5PREVWIGZv
ciB0aGUgcHJvdGVjdGVkIGNvbnRleHQNCj4gY3JlYXRpb24gd2hpY2ggaXMgdGhlIGNvcnJlY3Qg
YmVoYXZpb3IgYW5kIHdlIGRvbid0IGNyZWF0ZSB1bm5lY2Vzc2FyeQ0KPiBkcm1fZXJyb3IncyBp
biBvdXIgZG1lc2cgKGZvciB3aGF0IGlzIHVuc3VwcG9ydGVkIHBsYXRmb3JtcykuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBBbGFuIFByZXZpbiA8YWxhbi5wcmV2aW4udGVyZXMuYWxleGlzQGludGVs
LmNvbT4NCg0K
