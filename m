Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2901750FF7
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 19:50:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38BD510E5C3;
	Wed, 12 Jul 2023 17:50:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2078110E5C1;
 Wed, 12 Jul 2023 17:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689184200; x=1720720200;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=MnsuI1lHsEqFBAdlVnIMUG0ah674fF2mE8zOfV1thvM=;
 b=cZQFUmYj8wSpJFmsLGstmH8JP3zqz1BmQDPu8eJBNF0CEJAu/O93ay5k
 I2CuOcHvQJ7umSuQPgMTrDJ6ypNes71ovJgXkVdeVnAPuoaLWAGGaN1DD
 Ys3iWnzUF0upa1RoCkBBWN0qHZ6DRbCgVBAf/6HQc9wfC3y045uMHXWGN
 9AHypdiJssTQO0XoHhLj8GQQ3JsCUj2+XSGkQjSN/NkyJDbrteq53r754
 et0R8m1DuflGv7xQ0LHl7PRXHt7+tp+fBcY0nqWmqUAC4WxPeAz4CF8k7
 rThJJ+uhKGJTLHk4pXjwrSvXapuEnXHSnKHhQI/tB46Aotw4jmlHh/RRn Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="349815260"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; d="scan'208";a="349815260"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2023 10:49:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="835256212"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; d="scan'208";a="835256212"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga002.fm.intel.com with ESMTP; 12 Jul 2023 10:49:59 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 12 Jul 2023 10:49:59 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 12 Jul 2023 10:49:58 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 12 Jul 2023 10:49:58 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 12 Jul 2023 10:49:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P8daBQhNRqdKcAwayVoA9JBXJSxau2KgZFgtGhymVbV9vWeQW3cn4CqV7rISzNqZSW/Wj7WGr3sP6IvkVSBggYa4z3/tj8VNuXrASYi8o/fEKKNpKCsl/dNlgxi+RsjiHUvscWuk8wtFngMM7/gtCLU/FUIsu9etlRk2dVEWBZTpF6P/gBRCuO+6rQP2PCHWuzNoKiOwQt84voSXdCk4F3eVME8XCUg57dPJR9pRgpy2OgbxWYgTjgZMpJDR9ImEWyq16mJ9wW6Xrn0hzwvXCbMV41lvDSWQGR8KKtLQ44Y1oNyvdBeJ3G8J8R7hCVJYpgdyi3AClSk6bnev1xFZKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MnsuI1lHsEqFBAdlVnIMUG0ah674fF2mE8zOfV1thvM=;
 b=SoKqcLbZMvlNuzq9u5+xF8PhSrS5y2Gka83lU8hIHrE5qU6vW+5kl46vMYqi46CkapUTR2eaJ1c1jKKkzge7vdPPfdWRvo/LV96UpzQimNYOTrnpGcBt+5+R/YS/1Prfj2pvWY/2MB6L/uNmsmdm7RLg9shLD1lYeDZ8b5cfCqsoGia88maOBOMBqQPwos258gRAmXKfo0grPyOH3/L52QdKxkRlC6FwUvhgHPYvHfbccRF7/aDKhoSifB8W94wmmFVAKiQna+UCGPePUwEa7RCOhuSzLlw4e+SaHjI3876iSOJGmYwrIHt0pPw9kMpvPGO9KD6+GtHZdt2hQRV+2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 MN6PR11MB8217.namprd11.prod.outlook.com (2603:10b6:208:47d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.26; Wed, 12 Jul
 2023 17:49:56 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::f674:6c10:d181:ac70]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::f674:6c10:d181:ac70%6]) with mapi id 15.20.6588.017; Wed, 12 Jul 2023
 17:49:56 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH v4] drm/i915/selftest/gsc: Ensure GSC Proxy
 init completes before selftests
Thread-Topic: [Intel-gfx] [PATCH v4] drm/i915/selftest/gsc: Ensure GSC Proxy
 init completes before selftests
Thread-Index: AQHZtENaL0KmKSqG9Uucxa5eO4yGNq+1204AgACOsgA=
Date: Wed, 12 Jul 2023 17:49:56 +0000
Message-ID: <134d8655487a1e2b43eebd4b5bd79962a8a6b285.camel@intel.com>
References: <20230711220204.2085513-1-alan.previn.teres.alexis@intel.com>
 <564e2cfd-4597-9f90-d8df-bf028519e689@linux.intel.com>
In-Reply-To: <564e2cfd-4597-9f90-d8df-bf028519e689@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|MN6PR11MB8217:EE_
x-ms-office365-filtering-correlation-id: 0d57da52-8101-4038-f6f7-08db8300679e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PP7vWVKnDsaJ7CHnKdhs/0+htA3NH1cQ18QDxLiLnLH2K+qKR92LRZQnfC+0Rrr59vqXaIOhY2rLFSPa2qWL0XITgLNkvo+SXhwApqDZKzlsq1WM3qYJXmSJbyDkn+2yQxkmoor0IB+g1DIXHdDjAN+x4vMC+VtK8ZUem1IoFtTeeKdhIstO7+UeXFS5cpUD44xhDfznPsvybh/nLXDdITRJdNvI3PP6rayqR9vzrSmDTQ0RJEYGLCPcTd5TL/2Ubm83KBob9nhBSr+A4f6EUiGU6PZkJYsMavPXUSJdtrJWUKX7PGl/U72ldtPw9MAwJvS4G1GnJVGiuLyBlos2El/iIHKOSSGbVOE+czI9R8UG6EXT7Epn0HDJ8mK26OYSojLFkVwY7v/u6awwF+9Z4qqyj6pLbNXSHkNnUls/J68CjC81gf1AtFYyuSHCFOhTAQohBJBh3seUayLUWufKN6R98jGF6Kmq8GeQxulqlu+bWD74JOl3xAAQgWW1FXyW9/nUdCSVq7Eb6gwI0Ca198NyEqj+R+A9d2Zm2sREmPOaFHST6p7ZDhqJHKmYKqMw6A6TfjcE0Sdh4faDqEdONXbb/jijaJJBaieIoBkJcksp2ySP1N0Hez+mODmT4sPE
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(39860400002)(396003)(366004)(376002)(451199021)(186003)(26005)(6512007)(53546011)(6486002)(2616005)(41300700001)(6506007)(4326008)(316002)(83380400001)(66556008)(8936002)(2906002)(8676002)(66446008)(5660300002)(66476007)(64756008)(110136005)(76116006)(66946007)(91956017)(71200400001)(36756003)(478600001)(82960400001)(122000001)(86362001)(38100700002)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WkUvK1FvS2liRzJxS2RMTE1KcXFLL1FxYmdVV0M3NUxaUFdkTWxCNzVKbVlj?=
 =?utf-8?B?TkI5UXVYWWRaYmQ4bmRvUGpHbU14Rll2Mk9mQ1U0TUJ4MVRGak4rUENEOXZE?=
 =?utf-8?B?SVpqSUdzTERaRmMzWGhoNTlTbFV5YzhRanFIMVpveGg1OFNvdU1HY1pjTXY1?=
 =?utf-8?B?NnFCdVVEM1hLZVJKTnY3bU5UNXlpWElRTnQ0Q0lIeFBBMGhoSzk1bHVtOTFn?=
 =?utf-8?B?M3RCMDZpcXdZR3dpaGkyOEpheFhiOWJWUlFoYXoyQ0RuamJwbkMxekNMa0ph?=
 =?utf-8?B?SGQ0ZjEwQmpaVmpJUElVeG1Tb3hxaEZ1QkNtTXRock0wSStIUUZ3Z1hNWlZB?=
 =?utf-8?B?cGdpWFNzMElJRnBKWldQQXhiQTI2ZHUxcDFPeWljeldzSE5tR3dCM0tMelZE?=
 =?utf-8?B?NlorbEJybzhFd2JTcERKdjlRemFJcnIrT0lFMTNReEtqTjRnTm9Zc2lsZC9G?=
 =?utf-8?B?VjlXK2cwYTVmR1RmMllvZWxMN0NUanVyRWNGRFZsSklrL1BSY3U4bjRvVzRW?=
 =?utf-8?B?aUJoN0llNWlmbEVibnFJYUQrTjk4aVprTjZuMzBHemdGdmNzN3duWXcrS29o?=
 =?utf-8?B?YjR0OXN1TGtGcjNqWk93S3F1TWFhNXAyWE94M014dEp4bWQ2d1pxN3E1VDJu?=
 =?utf-8?B?VHV5TUU5RVFNemI5eUtDRzEydFdvaEhreDl4cE1kRXRQeGJSanVyQmEyaUtN?=
 =?utf-8?B?NVA0WE5RTXE1QlZSZENZNWc4QXNvSEVlaG9OUEFoQlpGMzZPei9SU0szRFlE?=
 =?utf-8?B?VDFMWkFsZnpSY043Y2NqQmQ1cVhnNmFYVGhKOSszbHBEdVJmUWZ5cEhYMlRG?=
 =?utf-8?B?R2JIREhFd01tMU9rZjJiVU5EcHVHT1o0Y3NlODg3ZUFjMWVXSVVBdWN1RFY4?=
 =?utf-8?B?VDdtd0ZGTE9nQW9JOGxGTlVUVFJaOWYzbTZraWxpaGJBVml1bi9IMFA4enFk?=
 =?utf-8?B?bndZUnQ0M2dPZGVEREJOUFg0dnBkQlZKMExhazBSc21kdkFUWEp0RU04RjVi?=
 =?utf-8?B?c085ZVJUTDQ4cmV5VmlycmZ3eHRSOUxuYkdUZi9iMUxDcDJNd0haZ2JjdU9o?=
 =?utf-8?B?cmRxRUhyQ2FyLzhkN2Rab29ibHpuYWZRWkpzOUo3L1RXeDBLaVdlOGdQMSt4?=
 =?utf-8?B?eG85T2Y2RjhxRytiQ2hhUndGZW9JUzZLVm9oVGNsSE9kVjlrbnVYR0I3Z1Nn?=
 =?utf-8?B?YjQva1Jod3hSL1VVMTZ0WFREeStncmN1ZnNNZ0ZTM0RrOHFLQnM1T3VOazRP?=
 =?utf-8?B?OTh0VU1zMGR1Z25NQysreklETXQxVTB1Rkc2Yi9weUlUSk1zMS9wTXF1SWRL?=
 =?utf-8?B?WW1tc1RwRU9qRFhLUlA2aC9vbnREYXNlTS9pRzVvQkd5anpSL1pxdGZjOSt3?=
 =?utf-8?B?TElIeFEzUTZXTmZkV2k3WUVTV2VpN0d0R3BZRUxId0pHMDhSdG0yQjNPQnE0?=
 =?utf-8?B?V0l0WDZhWkhTVUZuMzJIVWcwVU82b2VONnZ0bW1MeHc3eC81UmVJK0dmVVR2?=
 =?utf-8?B?NHdHRnN5eVhSMlYrVjlqbHQ0Y3ZOakZyYkFSY1RhOXFkaTl3QzZjRVFtM2d2?=
 =?utf-8?B?cVB4N21hdXpGc3IyS3dkUjdoQi8wYkMzSlR1WXo1bGtUcGt6WGlSN0I0ZmhC?=
 =?utf-8?B?bnJZMStBQ2dBTmVPNytsL2x1UFU1R1g4Q3lVZ2g1QW8wUlpGaFh4OGhScURM?=
 =?utf-8?B?NEF1QkVFMkx2a3UwVWFiV1Y3Uk0zQmFhaHFxY3hoREtYdExVUGxLSGxSblpO?=
 =?utf-8?B?a1JpYnlsU1BKd3YvSUFTSXBja013b1pGdTBhN0pJclVtOFFxc1gxQVNZVnl6?=
 =?utf-8?B?SFQrYUJ4cHNrTW1KZHNQQnNwNjhPMWNsTzdxL3M0dmkyQXB6SUhKRElBQzl3?=
 =?utf-8?B?czU5VFAxUGJCWEk1L2lCeCt5b09VQytoVWhabTdBRERFaE43R0kzdjM5ZkpO?=
 =?utf-8?B?YmZkbDNCRFlyRTlPOENBL3VPcGNHMC9EdlRsNXZReGNvOUVNNVBqajc4d05l?=
 =?utf-8?B?Q3l1ZG82YUJ5QWRQU29MT3hIQkdPRWkzb3FaTHVlYlJyTlhWRHRFbHJoTUtz?=
 =?utf-8?B?M25PcVJCSDEya3JVbnhNOUQ0Y1pCcUtkK21nTTVCSTBQN2tsKzVpMWpiSnI2?=
 =?utf-8?B?U3oyUEhKL21YVUhyREVrU1dNQlkrTkFBS3lVeTdRZkNqWlVxbWpPVi9QY0Ru?=
 =?utf-8?Q?30HFRrxW+5x1YOgLtfLfLK4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F6CD584F260E0747A3AC4C1FD0C6E436@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d57da52-8101-4038-f6f7-08db8300679e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2023 17:49:56.4533 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nfL644EMhai0458H9aHWF+M9darKWSQ1VuSeuMTkJcT+fgn8JK8CsyhHtmlDwHCj8Jh2XhTtWX1ZxYPqFPfmEzrwKwnDMYpwpgA69Yi+VSh65LzGmmwx0eS0W/pHAPlo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8217
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

T24gV2VkLCAyMDIzLTA3LTEyIGF0IDEwOjE5ICswMTAwLCBUdnJ0a28gVXJzdWxpbiB3cm90ZToN
Cj4gT24gMTEvMDcvMjAyMyAyMzowMiwgQWxhbiBQcmV2aW4gd3JvdGU6DQo+ID4gT24gTVRMLCBp
ZiB0aGUgR1NDIFByb3h5IGluaXQgZmxvd3MgaGF2ZW4ndCBjb21wbGV0ZWQsIHN1Ym1pc3Npb25z
IHRvIHRoZQ0KPiA+IEdTQyBlbmdpbmUgd2lsbCBmYWlsLiBUaG9zZSBpbml0IGZsb3dzIGFyZSBk
ZXBlbmRlbnQgb24gdGhlIG1laSdzDQo+ID4gZ3NjX3Byb3h5IGNvbXBvbmVudCB0aGF0IGlzIGxv
YWRlZCBpbiBwYXJhbGxlbCB3aXRoIGk5MTUgYW5kIGENCj4gPiB3b3JrZXIgdGhhdCBjb3VsZCBw
b3RlbnRpYWxseSBzdGFydCBhZnRlciBpOTE1IGRyaXZlciBpbml0IGlzIGRvbmUuDQo+ID4gDQo+
ID4gVGhhdCBzYWlkLCBhbGwgc3Vic3l0ZW1zIHRoYXQgYWNjZXNzIHRoZSBHU0MgZW5naW5lIHRv
ZGF5IGRvZXMgY2hlY2sNCj4gPiBmb3Igc3VjaCBpbml0IGZsb3cgY29tcGxldGlvbiBiZWZvcmUg
dXNpbmcgdGhlIEdTQyBlbmdpbmUuIEhvd2V2ZXIsDQo+ID4gc2VsZnRlc3RzIGN1cnJlbnRseSBk
b24ndCB3YWl0IG9uIGFueXRoaW5nIGJlZm9yZSBzdGFydGluZy4NCj4gPiANCj4gPiANCj4gPiAN
CmFsYW46c25pcA0KDQo+ID4gKwkvKg0KPiA+ICsJICogVGhlIGdzYyBwcm94eSBjb21wb25lbnQg
ZGVwZW5kcyBvbiB0aGUga2VybmVsIGNvbXBvbmVudCBkcml2ZXIgbG9hZCBvcmRlcmluZw0KPiA+
ICsJICogYW5kIGluIGNvcm5lciBjYXNlcyAodGhlIGZpcnN0IHRpbWUgYWZ0ZXIgYW4gSUZXSSBm
bGFzaCksIGluaXQtY29tcGxldGlvbg0KPiA+ICsJICogZmlybXdhcmUgZmxvd3MgdGFrZSBsb25n
ZXIuDQo+ID4gKwkgKi8NCj4gPiArCXVuc2lnbmVkIGxvbmcgdGltZW91dF9tcyA9IDgwMDA7DQo+
ID4gKw0KPiA+ICsJaWYgKG5lZWRfdG9fd2FpdCAmJg0KPiA+ICsJICAgICh3YWl0X2ZvcihpbnRl
bF9nc2NfdWNfZndfcHJveHlfaW5pdF9kb25lKCZpOTE1LT5tZWRpYV9ndC0+dWMuZ3NjLCB0cnVl
KSwNCj4gPiArCSAgICB0aW1lb3V0X21zKSkpDQo+ID4gKwkJcHJfaW5mbyhEUklWRVJfTkFNRSAi
VGltZWQgb3V0IHdhaXRpbmcgZm9yIGdzY19wcm94eV9jb21wbGV0aW9uIVxuIik7DQo+IA0KPiBX
b3VsZCBpdCBtYWtlIHNlbnNlIHRvIGVycm9yIG91dCBoZXJlPyBPciBhdCBsZWFzdCB1cGdyYWRl
IHRvIHByX3dhcm4gb3IgDQo+IHNvbWV0aGluZz8NCmFsYW46IGFncmVlIG9uIHByX3dhcm4gKGVz
cGVjaWFsbHkgc2luY2UgbmVlZF9mb3Jfd2FpdCBiZWluZyB0cnVlIGFuZCB3ZSB0cmllZCBmb3Ig
OCBzZWNzIC0gdGhpcyBzaG91bGQgbmV2ZXIgaGFwcGVuKS4NCg0KPiANCj4gSSBkaWRuJ3QgcXVp
dGUgdW5kZXJzdGFuZCB0aGUgcG9pbnRzIERhbmllbGUgcmFpc2VkIGFib3V0IGVuZ2luZSBsb29w
cyANCj4gYW5kIHJlc2V0cyAtIGluIG15IG1pbmQgR1NDIGVuZ2luZSBpcyB0aGlzIHNwZWNpYWwg
dGhpbmcgZXhlcmNpc2VkIGZvciANCj4gaGlnaGx5IHNwZWNpYWxpemVkIG9wZXJhdGlvbnMgYW5k
IG5vdCB0b3VjaGVkIGluIHJhbmRvbSBmb3JfZWFjaF9lbmdpbmUgDQo+IGxvb3AgdGVzdHMsIGJ1
dCBJIGFsc28gZGlkIG5vdCByZWFsbHkgbG9vayBzbyBtaWdodCBiZSB0b3RhbGx5IHdyb25nLg0K
DQphbGFuOiBhZnRlciBjb25zdWx0aW5nIHdpdGggRGFuaWVsZSBmdXJ0aGVyLCB0aGUgY29uY2Vy
biBpbiB0aGUgY2FzZSBvZg0KaGF2aW5nIGdzYy1wcm94eS1pbml0IG1pZC1leGVjdXRpb24gd2hp
bGUgb3RoZXIgc2VsdHRlc3RzDQphcmUgcnVubmluZyAod2hlbiB0aGlua2luZyBvZiB0ZXN0cyB0
aGF0IGhhdmUgbm90aGluZyB0byBkbyB3aXRoIEdTQw0KYnV0IGhhcyBpbmRpcmVjdCBlZmZlY3Qg
bGlrZSBtZW1vcnktcHJlc3N1cmUsIGVuZ2luZS1yZXNldHMsDQpldGMpIGlzIHRoYXQgdGhlIHBy
b3h5LWluaXQgd2lsbCBiYWlsLW91dCBwcmludCBhbiBlcnJvciBidXQNCnRoYXQgd291bGQgcmVz
dWx0IGluIENJIHJlcG9ydGluZyBhIGZhbHNlLW5lZ2F0aXZlLiBXZSBjYW4ndCBza2lwDQp0aGF0
IGVycm9yIHNpbmNlIENPTkZJR19JTlRFTF9NRUlfR1NDX1BST1hZIHRlbGxzIHVzIHRoYXQgdGhl
IGtlcm5lbA0Kb3duZXIgd2FudHMgR1NDLVBST1hZIHdvcmtpbmcuDQoNCj4gDQo+IEluIGFueSBj
YXNlLCB2NCByZWFkcyBjbGVhciAtIG5vIGNvbmZ1c2luZyBjb21tZW50cyBhbmQgbm90IA0KPiBv
dmVyLWVuZ2luZWVyZWQgc28gaXMgYWNjZXB0YWJsZSB0byBtZS4NCj4gDQphbGFuOiB0aGFua3Mg
VHZydGtvLg0KDQoNCj4gUC5TLiBNYXliZSB0aGUgY2hlY2sgKmNvdWxkKiBiZSBtb3ZlZCB0byBp
OTE1X2xpdmVfc2VsZnRlc3RzLCB3aGVyZSBodyANCj4gZGVwZW5kZW5jaWVzIGNvbmNlcHR1YWxs
eSBmaXQgYmV0dGVyLCBhbmQgbWF5YmUgaTkxNV9wZXJmX3NlbGZ0ZXN0cyANCj4gd291bGQgbmVl
ZCBpdCB0b28gdGhlbiAoPyksIGJ1dCBpdCBpcyB1cCB0byB5b3UuDQphbGFuOiBpIGNhbiBkbyB0
aGlzIHF1aWNrbHkgYXMgYSByZXY1IChhZnRlciBhIGJpdCBvZiBtYW51YWwgY2hlY2sgaWYgcGVy
ZiBuZWVkcyBpdCkNCg0KPiANCj4gTWF5YmUgZXZlbiBpbiB0aGUgYXJyYXkgc2VsZnRlc3RzL2k5
MTVfbGl2ZV9zZWxmdGVzdHMuaCBpZiB3ZSBjb3VsZCBhZGQgDQo+IGEgZmFjaWxpdHkgdG8gbWFr
ZSB1bnNraXBwYWJsZSB0ZXN0cyBhbmQgYWRkIHRoaXMgb25lIGFmdGVyIHRoZSBzYW5pdHkgDQo+
IGNoZWNrLiBXaGljaCB3b3VsZCB0aGVuIGFjaGlldmUgdGhlIHNhbWUgZ2VuZXJhbGl6ZWQgdGhp
bmcgeW91IGhhZCBpbiANCj4gdGhlIHByZXZpb3VzIHZlcnNpb24gd2l0aG91dCBuZWVkaW5nIHRv
IGFkZCBhIG5ldyBhcnJheS9sb29wLg0KYWxhbjogaSByYXRoZXIgbm90IGF0dGVtcHQgdGhpcyBh
cyBwYXJ0IG9mIHRoZSBjdXJyZW50IHBhdGNoIGJ1dCB3aWxsDQpjb25zaWRlciBpdCBhcyBhIHNl
cGFyYXRlIHBhdGNoIGlmIHlvdSBhcmUgb2theSB3aXRoIHRoYXQ/DQoNCg==
