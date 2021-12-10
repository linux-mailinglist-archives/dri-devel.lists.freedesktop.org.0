Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B9C46FC9A
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 09:20:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AF2610E3FA;
	Fri, 10 Dec 2021 08:20:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA15210E3FA;
 Fri, 10 Dec 2021 08:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639124425; x=1670660425;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=E9wOWPT78BqkZyObG5QP8CzzxAxkhD1p0QlFBVe3Btg=;
 b=bTNGk0x9WIEPUzNVeaYHRT6QxnQaDTNjvxI/9OS13SMGsmP8B4AF7HG3
 I8mHAuM8uCyqQ8aKYI4T3nJxikK/AjiqHNbCKoIvUE86kTXt7cl7QCElu
 OIDr2KhZRNggnycOFhNqvI5VRCeyTkh30fHt9BltYu6083O+ufNdZPz2Q
 ONAoYqDLVMUiZSkNglbwQzDt9MoON6DvjMGhXIm4bH+eZh1yQFMDZZ6D1
 n3aDco4ltKofrbFWNyVbWWa9whxewSTdkqwxzUqPpu96OhYsMpEVy+4a7
 xvJhuX+9HXZEzCwUMt6EVI50y6Up/XXSVcpAinsmSmn4UX2mmcJEOc9Ka A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10193"; a="225575512"
X-IronPort-AV: E=Sophos;i="5.88,194,1635231600"; d="scan'208";a="225575512"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 00:20:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,194,1635231600"; d="scan'208";a="503843480"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga007.jf.intel.com with ESMTP; 10 Dec 2021 00:20:24 -0800
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 10 Dec 2021 00:20:23 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Fri, 10 Dec 2021 00:20:23 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 10 Dec 2021 00:20:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ev7o6muM01oGkgzir3sLrwLLO7ZNHEUlFXo1GSuC6Bc0jTCZ4DuZ8fEnhThHwJiEqWi7zvNJi4METH1EfVX0RCWpyW9atm4x233gZvpGLsqoeETxRBTdmDOFHinYTiiDMiogwjjN7Ue/93tsE9FDeTc/VGZBLt9irXtFhYEqegDT/m0VVsfKpklGbIQ5TNxbpKJzqaEFtLnO2sD62WKvSTgKogsesUGM+32MZjUFwugbREH8LHQbdxTANQzigJ0r3r6KJIU/gwsdp3lTwF/Oz4eWl541IVHPWtRr7itSr4yrSL9UzW1L9GnXP29TsEiFFed2Tk9nIUi1l4FUJKPOEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E9wOWPT78BqkZyObG5QP8CzzxAxkhD1p0QlFBVe3Btg=;
 b=Zq9mwQFv6+PZiZphpQAEyxRWBZuSQ4CMyDEQOFrqE2LHL5Z8/5j+i3Ww8j7fXdns9mMoeeAeqaCxo9cWa3Ejsdpmk1UHOg5cgeh07UTUEtB/hC++aVJq3T0aDIkjZFcAMS5E6QIsid2yG49+Kpyia9Gth0yRKnMwLkoFeec+gbQFVWy72UE7mXA/phwIFhfufAhg3tAWs2gh0t74LWTLeJ0Q5indQ5aeTS7++uySi+kW1pxpcbyof8WSCjwQCAuBTGfXvIWUQ3jgFrepCQX6StiS1CWwCztlUCilVYW+NKnjdEVAhh7LR6vYxUvqqTKIM071K7uAir2Xt3+/RKtXVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E9wOWPT78BqkZyObG5QP8CzzxAxkhD1p0QlFBVe3Btg=;
 b=uFKdG4xElgD2nagESWndcbL7o4mr0EcnV8UMCyuga7Ejjsxm3oKud++htYCdAeThvSQYNfTY9pepIujhDJNClCfm/QC865xL495Z3YUAQWHKarqdYN+c+C6HJ7UZT+L19q5tRhQdKJzjJd0oEhtOtW9Bw2VIpoMayFgSLXftafw=
Received: from BN9PR11MB5545.namprd11.prod.outlook.com (2603:10b6:408:102::19)
 by BN6PR11MB4178.namprd11.prod.outlook.com (2603:10b6:405:84::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Fri, 10 Dec
 2021 08:20:22 +0000
Received: from BN9PR11MB5545.namprd11.prod.outlook.com
 ([fe80::6533:7d95:6f60:aafd]) by BN9PR11MB5545.namprd11.prod.outlook.com
 ([fe80::6533:7d95:6f60:aafd%9]) with mapi id 15.20.4778.015; Fri, 10 Dec 2021
 08:20:22 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Rikard Falkeborn <rikard.falkeborn@gmail.com>, Zhenyu Wang
 <zhenyuw@linux.intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 7/9] drm/i915/gvt: Constify formats
Thread-Topic: [PATCH 7/9] drm/i915/gvt: Constify formats
Thread-Index: AQHX6P2AeFvbtLy2F0WFSvUB689fGKwra5EA
Date: Fri, 10 Dec 2021 08:20:22 +0000
Message-ID: <6e73f014-730c-3334-c0e6-7e0665f47fec@intel.com>
References: <20211204105527.15741-1-rikard.falkeborn@gmail.com>
 <20211204105527.15741-8-rikard.falkeborn@gmail.com>
In-Reply-To: <20211204105527.15741-8-rikard.falkeborn@gmail.com>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e33f7c9d-6981-4229-d4ea-08d9bbb5e941
x-ms-traffictypediagnostic: BN6PR11MB4178:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BN6PR11MB4178CE3E7D654FFD7CDB10E5CA719@BN6PR11MB4178.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: le3s9yZTRKFl6nFmyxUo+dtaopeXf2nGWOjidniGr7zxuruZmdOUkxfr++7hEvPB16zNg+4iTWiUxXXvha55QHo5UQc4KMOw7iyeMWAxDqaVmfGw0UNWksI7XV3fSvvxNVkRaxrmIVnbB3tg6TwoTt8VDTUY9k9724Xpjc/nfFR5ROi2uzkhJdzkoHmTHWDHq7x/txafnCZEBqu5/p/9ZpfL7xdMUDJMvazKmkTJDFqkgQILC7UZrdyHPpUyWArcAAyZZISAApYx61AIG4rD9LJ6sCQQws1RhdHTObcq1K4bbZcL20oLbzLlzfssrTMWjFDt2DzKGivsqiGFKP9FNMZgfamuU6oJ6OS99UDO96IUb6aO2vSxfIkL7me/Grv3t8+jzXV0SsGaa8fec+jiPQXF2xsrW/72mV2/qqEEkg2AF+X1HAo957NBPKmnZ3DIZ9wtyXXUfPIlpjvG6Ijo6afmyjq6CocOHnN9bcg7UqgvJipcqSCJP0+fH95FZxHmAbvbCp9afhK+QWl4d1JqKPY/1fj4O42V0qcRTr6sTtO0vzk/74J+1fgtjB0/GBJjEk0TfGUq3N9TW1cpQgmJmvzU0R3rXfZuX6X1Hyw9gFBkOHvhezTQeheXRu2EH0zCp2iHCNUkclIa7iUDiXrArKfmVhpaaYPtK/sKq7H4ne0oRxH/mRPfYQtNRZxMcjLBpX3iD+0sNrXYjRpB0OvEJhY8fuS/FpB1o7msmgeEAdbjNGdvts/K1F+1XBLf6zOfQSKPytBlOFHxOX71QQduhg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5545.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8936002)(83380400001)(38070700005)(31686004)(2906002)(36756003)(7416002)(64756008)(186003)(54906003)(86362001)(316002)(31696002)(8676002)(66476007)(71200400001)(91956017)(76116006)(110136005)(508600001)(66946007)(66556008)(38100700002)(26005)(2616005)(82960400001)(53546011)(6512007)(6506007)(5660300002)(4326008)(122000001)(6486002)(66446008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OXBBS1QraklyZWFFc0xKM2lsY3M4VkJoaEowdXRTNms5OUR5VCtBS3pMUjdQ?=
 =?utf-8?B?VkUyNHQxZU5Eeng3WTNGRmg2RU45UFZCemdGNTZQK2ZxQzhMb0R6WDdSL2FD?=
 =?utf-8?B?ZkFid2pZUTcwcS8ra0tJMFpXaWJidEJEYXZtMWpXTkxoeVFxODNLMlBCSisx?=
 =?utf-8?B?NUJhL1NWKzhUY21WYVlIV1QxR3lYYnlEd1VYYnNtbUxPdzJVVE9zQTZTYjUr?=
 =?utf-8?B?cng3eHQ1a0hKS1hlL2ViSVo4bCt6RERwWWp2YVBySHBYMytUb09QV1AvbTQx?=
 =?utf-8?B?dlZOaVprZWJyeWt4VnVDeE1MYWFUdFNvRWh4S0JvNTAvUThJcGN3eHlKZTRy?=
 =?utf-8?B?UnIzU21JaHU4azh5ME9nbkFCV0tEUW9MSWhZTVUyL1h0cjFrd05kQ2JKSUtD?=
 =?utf-8?B?TEx0ci9XMlV1TjlwZ1JSUVJaVVpocmdZR2h0REFlR1IyOEZkU0V6QUNpSCtR?=
 =?utf-8?B?cHNKeDJlYzVtdDBQQnBudWlRdStwSUpYNUFnZnJHa1Q0bTNlODllMTM2akVM?=
 =?utf-8?B?a3BQWWFRN282RU9MWWJna0hoQmlLZnV3amFQSVNoVnB3cGMyWStxME9CeFgz?=
 =?utf-8?B?eVdsS1o2V0E3WENtSE10TlY1TDBDSStYWVBUbUFSK2V1UlpnenV4UEdFVCtV?=
 =?utf-8?B?Ly94ckVtcEVrQm55M3ZJU2xTbmpvdmZrQndCRVh1R0pZSVFTZVpuTXNGei93?=
 =?utf-8?B?VWhabitkbitDbW82My8rYkdpeVd6bUp4MExoY3ZybTJWZVNoY01aN3RRMlI3?=
 =?utf-8?B?cGttNlRaNFZ0YkhtZmtLMExjMHRCdFc1R3p2VzNVN1BTTlBuL0NrdGRIV0do?=
 =?utf-8?B?VmI5dk13aUJYeGtsUitLOFJrUjBFQWRsQTVwcS9lRVliMDJFWXM1Q2F3eDM1?=
 =?utf-8?B?NzBFL3JZMysrbVVtVFdjSEsxR3lYOTdQS01zcmNvTTJmN3BpTUdHSjZyWnVk?=
 =?utf-8?B?emhSWHNTYlhXTXZONTRjYU9DbXdyTkhCVitlb2dsL0p1UkRjR2xGblNKYzY4?=
 =?utf-8?B?aE5Xa01LVGh1eksxczQ0RGt5d21HQ2g0eDdUZHNmSHIxRm9tWC85djByWDVt?=
 =?utf-8?B?dElOM205YSs4b1owNkZlUjdHVEIvNWZqZmliK1IwcklTV3F4NHFCSndQODYw?=
 =?utf-8?B?QThNL1BaWlBIWi96bU1Wa0k0YUIyYldZTVo1UlJZLzdIK1phSkRpNHg4U1Bz?=
 =?utf-8?B?cVgybUxDRzgwWkhodFlCYkszd1ZPVHkraURlU2hxcmpvS2ZIbjU2aCt3VkRP?=
 =?utf-8?B?dDkxMm5QZFp6WTdzKzBwVVdYL09iWlk3OFVmMEdhaGk5TllBdUpCNU1DZHU5?=
 =?utf-8?B?L2NzbFdNQmtqckJvMG93RTJaNVdWL1NHNXBmNVIwMzdIeHp5eldRTi9jTFJS?=
 =?utf-8?B?QURXbDRMaE01RmhESHBPRFd4V3R1WWxUWkhQamY3ODVmOGJwOXFLUkxlclpI?=
 =?utf-8?B?anZuVXlRclM0V1F3eVAwbjl0Wkg5ajZ5QzI4MFk2VERHaVpLZXNXUEpoUVAv?=
 =?utf-8?B?QjNjdU42eUtjeUU2UUQ5dGdzVXhlSWQrN21YZEVBT25RKzhLOHdDSFhzdldV?=
 =?utf-8?B?aStzaUhoNVc2NE9ZUVBWbWhGbFBJVGcxOUZWUHJDR3JSZXZnbVQ3RGlsTTRm?=
 =?utf-8?B?cFQzSlBCTHFQa254OWZBU1E1a0hVdUlVMTUzTUVURkViTksyckdlUGJzWFJz?=
 =?utf-8?B?bStqamZNRDJqUUdlcGFuaWg1WnNJQUU0bTNJZHM0L2tMMDRabXE0MHBkaXo1?=
 =?utf-8?B?WVU2ZU15RHNMTFBpb0NLUXF3UWhqQmIwUW1kMDRzOHFzeTlSYSs3WmVsbHAz?=
 =?utf-8?B?WDR4VlI0dm5kNlhYZFo0V05QOHZVUUNSZk41cjZEUktvcjZ2TDM4SU1lRVZy?=
 =?utf-8?B?VjdYRWFKQUpnakkvb1hrekhRNzZVZzVCc3pCYW5hcHAwdFpKZE9ubW0yU0lD?=
 =?utf-8?B?U09zakFkVkc3dGFRVnF6WkJNWG9RUGFUd1NzVHMyaXdyMm00by9aWHN0N2VP?=
 =?utf-8?B?NVFaNjlYQkJhK3d5ak9WVUpXTmNiSHk3TFRUK2FvZ0EzMmYyYzdPTWF4R3BJ?=
 =?utf-8?B?aFhTQys0YnlySHRnTUxjSXI1QWFuSkc0NW1lbk5Na2tXMmFSSFBIYzVSU2pE?=
 =?utf-8?B?SGhYZEJ0S0hLUktoeHNwU3NBQXkzS1pwNU55c29acElBdlhVNitrQ1ZQVzRP?=
 =?utf-8?B?R1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4DA274F4C6B6914F8ABACF7F600EB681@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5545.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e33f7c9d-6981-4229-d4ea-08d9bbb5e941
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2021 08:20:22.5072 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ypPOkagIw+GMeSdmwS/VXwAN+xq1Kp9/BP9V0W0nB1P6dWW9u5YBhei9nLQHRqwOdZVidiDggvXbPG3PQo1rTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4178
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
 "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTIvNC8yMDIxIDEyOjU1IFBNLCBSaWthcmQgRmFsa2Vib3JuIHdyb3RlOg0KPiBUaGVzZSBh
cmUgbmV2ZXIgbW9kaWZpZWQsIHNvIG1ha2UgdGhlbSBjb25zdCB0byBhbGxvdyB0aGUgY29tcGls
ZXIgdG8NCj4gcHV0IHRoZW0gaW4gcmVhZC1vbmx5IG1lbW9yeS4gV0hpbGUgYXQgaXQsIG1ha2Ug
dGhlIGRlc2NyaXB0aW9uIGNvbnN0DQo+IGNoYXIqIHNpbmNlIGl0IGlzIG5ldmVyIG1vZGlmaWVk
Lg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBSaWthcmQgRmFsa2Vib3JuIDxyaWthcmQuZmFsa2Vib3Ju
QGdtYWlsLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2ZiX2RlY29k
ZXIuYyB8IDI0ICsrKysrKysrKysrKy0tLS0tLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAx
MiBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2d2dC9mYl9kZWNvZGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dnQvZmJfZGVjb2Rlci5jDQo+IGluZGV4IDExYThiYWJhNjgyMi4uM2M4NzM2YWU4ZmVkIDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZmJfZGVjb2Rlci5jDQo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9mYl9kZWNvZGVyLmMNCj4gQEAgLTQwLDEyICs0MCwx
MiBAQA0KPiAgIA0KPiAgICNkZWZpbmUgUFJJTUFSWV9GT1JNQVRfTlVNCTE2DQo+ICAgc3RydWN0
IHBpeGVsX2Zvcm1hdCB7DQo+IC0JaW50CWRybV9mb3JtYXQ7CS8qIFBpeGVsIGZvcm1hdCBpbiBE
Uk0gZGVmaW5pdGlvbiAqLw0KPiAtCWludAlicHA7CQkvKiBCaXRzIHBlciBwaXhlbCwgMCBpbmRp
Y2F0ZXMgaW52YWxpZCAqLw0KPiAtCWNoYXIJKmRlc2M7CQkvKiBUaGUgZGVzY3JpcHRpb24gKi8N
Cj4gKwlpbnQJCWRybV9mb3JtYXQ7CS8qIFBpeGVsIGZvcm1hdCBpbiBEUk0gZGVmaW5pdGlvbiAq
Lw0KPiArCWludAkJYnBwOwkJLyogQml0cyBwZXIgcGl4ZWwsIDAgaW5kaWNhdGVzIGludmFsaWQg
Ki8NCj4gKwljb25zdCBjaGFyCSpkZXNjOwkJLyogVGhlIGRlc2NyaXB0aW9uICovDQo+ICAgfTsN
ClRoYW5rcyBzbyBtdWNoIGZvciB0aGlzLiBBY2NvcmRpbmcgdG8gdGhlIGNvZGUgb2YgaTkxNSwg
d2UgcHJlZmVyIHVzaW5nIA0Kb25lIHNwYWNlIGFzIHNlcGVyYXRvci4NCj4gICANCj4gLXN0YXRp
YyBzdHJ1Y3QgcGl4ZWxfZm9ybWF0IGJkd19waXhlbF9mb3JtYXRzW10gPSB7DQo+ICtzdGF0aWMg
Y29uc3Qgc3RydWN0IHBpeGVsX2Zvcm1hdCBiZHdfcGl4ZWxfZm9ybWF0c1tdID0gew0KPiAgIAl7
RFJNX0ZPUk1BVF9DOCwgOCwgIjgtYml0IEluZGV4ZWQifSwNCj4gICAJe0RSTV9GT1JNQVRfUkdC
NTY1LCAxNiwgIjE2LWJpdCBCR1JYICg1OjY6NSBNU0ItUjpHOkIpIn0sDQo+ICAgCXtEUk1fRk9S
TUFUX1hSR0I4ODg4LCAzMiwgIjMyLWJpdCBCR1JYICg4Ojg6ODo4IE1TQi1YOlI6RzpCKSJ9LA0K
PiBAQCAtNTgsNyArNTgsNyBAQCBzdGF0aWMgc3RydWN0IHBpeGVsX2Zvcm1hdCBiZHdfcGl4ZWxf
Zm9ybWF0c1tdID0gew0KPiAgIAl7MCwgMCwgTlVMTH0sDQo+ICAgfTsNCj4gICANCj4gLXN0YXRp
YyBzdHJ1Y3QgcGl4ZWxfZm9ybWF0IHNrbF9waXhlbF9mb3JtYXRzW10gPSB7DQo+ICtzdGF0aWMg
Y29uc3Qgc3RydWN0IHBpeGVsX2Zvcm1hdCBza2xfcGl4ZWxfZm9ybWF0c1tdID0gew0KPiAgIAl7
RFJNX0ZPUk1BVF9ZVVlWLCAxNiwgIjE2LWJpdCBwYWNrZWQgWVVZViAoODo4Ojg6OCBNU0ItVjpZ
MjpVOlkxKSJ9LA0KPiAgIAl7RFJNX0ZPUk1BVF9VWVZZLCAxNiwgIjE2LWJpdCBwYWNrZWQgVVlW
WSAoODo4Ojg6OCBNU0ItWTI6VjpZMTpVKSJ9LA0KPiAgIAl7RFJNX0ZPUk1BVF9ZVllVLCAxNiwg
IjE2LWJpdCBwYWNrZWQgWVZZVSAoODo4Ojg6OCBNU0ItVTpZMjpWOlkxKSJ9LA0KPiBAQCAtMjc4
LDE0ICsyNzgsMTQgQEAgaW50IGludGVsX3ZncHVfZGVjb2RlX3ByaW1hcnlfcGxhbmUoc3RydWN0
IGludGVsX3ZncHUgKnZncHUsDQo+ICAgDQo+ICAgI2RlZmluZSBDVVJTT1JfRk9STUFUX05VTQko
MSA8PCA2KQ0KPiAgIHN0cnVjdCBjdXJzb3JfbW9kZV9mb3JtYXQgew0KPiAtCWludAlkcm1fZm9y
bWF0OwkvKiBQaXhlbCBmb3JtYXQgaW4gRFJNIGRlZmluaXRpb24gKi8NCj4gLQl1OAlicHA7CQkv
KiBCaXRzIHBlciBwaXhlbDsgMCBpbmRpY2F0ZXMgaW52YWxpZCAqLw0KPiAtCXUzMgl3aWR0aDsJ
CS8qIEluIHBpeGVsICovDQo+IC0JdTMyCWhlaWdodDsJCS8qIEluIGxpbmVzICovDQo+IC0JY2hh
cgkqZGVzYzsJCS8qIFRoZSBkZXNjcmlwdGlvbiAqLw0KPiArCWludAkJZHJtX2Zvcm1hdDsJLyog
UGl4ZWwgZm9ybWF0IGluIERSTSBkZWZpbml0aW9uICovDQo+ICsJdTgJCWJwcDsJCS8qIEJpdHMg
cGVyIHBpeGVsOyAwIGluZGljYXRlcyBpbnZhbGlkICovDQo+ICsJdTMyCQl3aWR0aDsJCS8qIElu
IHBpeGVsICovDQo+ICsJdTMyCQloZWlnaHQ7CQkvKiBJbiBsaW5lcyAqLw0KPiArCWNvbnN0IGNo
YXIJKmRlc2M7CQkvKiBUaGUgZGVzY3JpcHRpb24gKi8NCj4gICB9Ow0KVGhlIHNhbWUgY29tbWVu
dCBhcyBhYm92ZS4NCj4gLXN0YXRpYyBzdHJ1Y3QgY3Vyc29yX21vZGVfZm9ybWF0IGN1cnNvcl9w
aXhlbF9mb3JtYXRzW10gPSB7DQo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGN1cnNvcl9tb2RlX2Zv
cm1hdCBjdXJzb3JfcGl4ZWxfZm9ybWF0c1tdID0gew0KPiAgIAl7RFJNX0ZPUk1BVF9BUkdCODg4
OCwgMzIsIDEyOCwgMTI4LCAiMTI4eDEyOCAzMmJwcCBBUkdCIn0sDQo+ICAgCXtEUk1fRk9STUFU
X0FSR0I4ODg4LCAzMiwgMjU2LCAyNTYsICIyNTZ4MjU2IDMyYnBwIEFSR0IifSwNCj4gICAJe0RS
TV9GT1JNQVRfQVJHQjg4ODgsIDMyLCA2NCwgNjQsICI2NHg2NCAzMmJwcCBBUkdCIn0sDQo+IEBA
IC0zOTEsNyArMzkxLDcgQEAgaW50IGludGVsX3ZncHVfZGVjb2RlX2N1cnNvcl9wbGFuZShzdHJ1
Y3QgaW50ZWxfdmdwdSAqdmdwdSwNCj4gICANCj4gICAjZGVmaW5lIFNQUklURV9GT1JNQVRfTlVN
CSgxIDw8IDMpDQo+ICAgDQo+IC1zdGF0aWMgc3RydWN0IHBpeGVsX2Zvcm1hdCBzcHJpdGVfcGl4
ZWxfZm9ybWF0c1tTUFJJVEVfRk9STUFUX05VTV0gPSB7DQo+ICtzdGF0aWMgY29uc3Qgc3RydWN0
IHBpeGVsX2Zvcm1hdCBzcHJpdGVfcGl4ZWxfZm9ybWF0c1tTUFJJVEVfRk9STUFUX05VTV0gPSB7
DQo+ICAgCVsweDBdID0ge0RSTV9GT1JNQVRfWVVWNDIyLCAxNiwgIllVViAxNi1iaXQgNDoyOjIg
cGFja2VkIn0sDQo+ICAgCVsweDFdID0ge0RSTV9GT1JNQVRfWFJHQjIxMDEwMTAsIDMyLCAiUkdC
IDMyLWJpdCAyOjEwOjEwOjEwIn0sDQo+ICAgCVsweDJdID0ge0RSTV9GT1JNQVRfWFJHQjg4ODgs
IDMyLCAiUkdCIDMyLWJpdCA4Ojg6ODo4In0sDQoNClRoZSByZXN0IG9mIHRoZSBwYXRjaCBsb29r
cyBnb29kIHRvIG1lLg0KDQo=
