Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3476E8173
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 20:49:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB1FB10EA89;
	Wed, 19 Apr 2023 18:49:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C14110EA89;
 Wed, 19 Apr 2023 18:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681930161; x=1713466161;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AxTxClGzPvam6W3ty9HpB5mrwGBVqRdzVLEgAMvCPnY=;
 b=PQg9N2oEWXA/loniBI/K6fiNlit81Od8MhGJVPQOPbfuX8Pbf81PFwOR
 1IWYBQ4eoJlXNWFJ8QM6aLHCsokP0qIAtZl/FY1j5D6EbCaU2rnfl3Wip
 tO63jVMYRlOSSIa9DepBVd65mhuV/Uw0/aBbV0wwKMPYs/WBokH1H8iDM
 fRdiPKaj2vEqGcW1cd4p/wvkP/nfa/yr2L4nM5zcYkKfja9VJqqP7EY1s
 GzIXBxoheeRc/mv8VWp3vEqVJFzhAqY7Gl75OvxohyzY0CKfe22io1myr
 WxeXyQyhMahj08gBZOErI5DML/VluboECRDe1/vGJqeQmIWtR0EleO5HU A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="344285473"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="344285473"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 11:49:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="760846122"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="760846122"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 19 Apr 2023 11:49:18 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 11:49:19 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 11:49:19 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 19 Apr 2023 11:49:19 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 19 Apr 2023 11:49:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nOV4CicDOWcGjaZY6r3PErTu2FwLgso3RLfRI4k6h7o2/k+Yrc2epceokhdFL9xIXLWk9qyviiZqDMZ6GFeVcxL/6iBkcyTIk7Amisrj6uxIasPTiRhp+XnkaPHUNrsnmmOKtwB6kEl8DkVX/wMGHyFRNBT4pdxn5aRfhGFG8HgnAL2fGY+RJh2b4XNm0WihJA0sGKQqs2TvD9hf2v6V6HSMK4DlUxze8gyWbkqZQqMk0yxAOR1AU2zdf7/s2jZbueGi+yQr4vQWtHiik0ScNcRzou8Uwxp3NSrvCxlYWor/OaFvBi1ippaPuIfYHjUqevyPhYsR6FSj29YuHJ/Z9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AxTxClGzPvam6W3ty9HpB5mrwGBVqRdzVLEgAMvCPnY=;
 b=C+xYjCAkfF21KdsZtFIyWJjnA9NZm+0RP6OhiBMu4xZ87iOOQxrhV2uQodcghprcfYWh64eXqULt0ciytkO2cuukV1S/GJNkbMnpwa2UCwJgvUUkahb1bk4uTxMRPcY7yRBoHjrzSee5cLZgKLT5++np6Jp79mFfBBqBk9yRy3Iaeoc2Za7gHNc2WOYnlpGfZuVGHP8UZvMQ2Ue0+v8OTJIP556VtLpCYHDLOwgK7ZWXPDxBDhrx4DCgTwVO3N9jn5fBSRhD1JrFP+Hv+P3GMaEPHMs/lpXxSWPO78u4gm3re4JauZCENIYNOpj9slKBe9DduSZxU/YPPen1xqfc7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN6PR11MB2574.namprd11.prod.outlook.com (2603:10b6:805:59::14)
 by PH7PR11MB5768.namprd11.prod.outlook.com (2603:10b6:510:131::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Wed, 19 Apr
 2023 18:49:17 +0000
Received: from SN6PR11MB2574.namprd11.prod.outlook.com
 ([fe80::1500:cc90:f74a:6d73]) by SN6PR11MB2574.namprd11.prod.outlook.com
 ([fe80::1500:cc90:f74a:6d73%6]) with mapi id 15.20.6319.020; Wed, 19 Apr 2023
 18:49:17 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: "Hajda, Andrzej" <andrzej.hajda@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH 4/8] drm/i915/mtl: workaround coherency issue
 for Media
Thread-Topic: [Intel-gfx] [PATCH 4/8] drm/i915/mtl: workaround coherency issue
 for Media
Thread-Index: AQHZcPUztdzx0D4PfUmjBA3bSkOXIK8yyLaAgAAPv8CAACNI0A==
Date: Wed, 19 Apr 2023 18:49:17 +0000
Message-ID: <SN6PR11MB257482462F00C5B347E6CC339A629@SN6PR11MB2574.namprd11.prod.outlook.com>
References: <20230417062503.1884465-1-fei.yang@intel.com>
 <20230417062503.1884465-5-fei.yang@intel.com>
 <e654fc52-b1ce-13f6-adfe-3e108f98e6ce@intel.com>
 <SN6PR11MB2574462BC46616D1954D40309A629@SN6PR11MB2574.namprd11.prod.outlook.com>
In-Reply-To: <SN6PR11MB2574462BC46616D1954D40309A629@SN6PR11MB2574.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR11MB2574:EE_|PH7PR11MB5768:EE_
x-ms-office365-filtering-correlation-id: a1e77ed0-c22c-4134-9e32-08db4106c730
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3AjIGIcIOm+Q/36G7D7lZyKzMICUrDICV8WLr8FJibkSVZHmdWV481n3z+L4NynoVjxEOoZZLnYAUCVWoxXhFLhzFvIaqNrlmnt7lYvt6jMyI+GrFa3ivuOdkvb5L9ERy4JGq9veiNhIpiIL88UdtKtGTQfeZM341gTaCSr5NG2NsJap4siVY+WFtzrEq77JPuswIO0cXAkxQ6Ys9YyBLwjc4Q/s3VQwDApFTFm8iAaNWl23c+szUE6IBj+LSR0CAD2iNqwtgwd2Sl0SkwiThPBs+SebrQXMURO8vvZo4OR7JfRG6hiBGcsF/nnLMGfhbCriFFxY/5PRMwwJT/YFwEVIIqstjO5e8//OD9oL6H30VcjiBZdl+/IgTXzTFYMbwfzq32KovF6eUU2Vs1ImGkqU38Ct9vgm8QbnQ/9da9cr29fp2KtHkj1ZcfMbVR3gxKzHwjYhPsoU4JHCdYG3LOelP3wXB/A7DuH9Ii0YWDnq9i9pbhvwYbTvOwNbpYYDhqLA1Pe3C+dNzdtMX/08keuWRVCiB3y39iuzGGTjIbSFrNnzpphWk6amXpVx5IsefxkblNrvUUjNbvp/RjJ7BS0qhWIweiWjUTvYVIQWlrHIjPoFRln7yFmboUk3NSm0
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2574.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(39860400002)(376002)(346002)(396003)(136003)(451199021)(8676002)(41300700001)(8936002)(55016003)(2906002)(38070700005)(5660300002)(52536014)(83380400001)(86362001)(122000001)(110136005)(478600001)(9686003)(6506007)(26005)(7696005)(38100700002)(33656002)(186003)(2940100002)(82960400001)(71200400001)(450100002)(316002)(4326008)(66556008)(66476007)(64756008)(66446008)(66946007)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UVlWOUQ3MFZLcFJPQ3NpbCtHKzF2emhxNlQ1RjVSb01UbzE0UFV3UEV4bEJj?=
 =?utf-8?B?MkdVcFBaUjdiSHdMdmpkTjQ4UXd5UnU1ZkdtZEZaV1ZXNzNiQlEzVXQ4OVVU?=
 =?utf-8?B?RkxwR2liaG1jSDRNTERLdVFhWGZreDUrR1phRzVydzFWdGk2Um9DWFpFM3Yw?=
 =?utf-8?B?VEQ4S05MdERpVFRoWlY0dTM0Nkx6bEh0anljT2c2c2VteXJqM2dUdk9nbVpV?=
 =?utf-8?B?Q1JDZ0w2UE5OR3FsYVJYZjA2bUdzelB5aUpORnM4dldhN3dYVlRRMFprS1Rz?=
 =?utf-8?B?SHhvRWxwZkdUQThUNzkrNWs0YUtjdnZhL01GWFYydUJMZWdJcFdpV25nUDc3?=
 =?utf-8?B?T0JOei8wTW9oOG1HZEpmbk5mRTZyUXNMRDNRcjgwejFvaDRJRE9XODhXbmFw?=
 =?utf-8?B?aTBKUFFCM0JhRDh4WG9kWUNHSENROHl6TFI3Zk9nKzRyTjBWRUJmcGRDU1Fx?=
 =?utf-8?B?d0YzQ3llQ1BiSzBXS0FCaXB1Z0c1WnJIa1JTM0JxMkV5VE5rejJNbXE2V0h0?=
 =?utf-8?B?bjJqRFBNVWJhaG5lQk9nTUk4VEtSb05TUjJZWW4wRmpSSFFXeDcrMFJicHdx?=
 =?utf-8?B?bHQ5M3lVcWdBZTZEUDNzUUhVZ1B3aUo3S1FxSWVEb2dES29ZQzMvOE5vV3U2?=
 =?utf-8?B?dDBiY0ljeDdhSEE1MW1YbVlXc0hwaXdLTVRBYk9NaUs2cEpuYVRORFA4QklT?=
 =?utf-8?B?WlBtWUUrcVgyOExOU0hDUjI4L3hrdW1INUQ5MGNObmh3NVRGOVJaUXRyZ2lX?=
 =?utf-8?B?MGZIQ21BVWhZdXh0cjlGb1ByS0tMZkgxaHdDeVAwUThFdlhOOTRadS8ycld0?=
 =?utf-8?B?NVNZUmR0T2dUN01hZVpSekZRTklxbmN1alFqTGVpT0J0RjRyS08yYWhTZ3dm?=
 =?utf-8?B?VjBrTDVrUXZheEQ5SnU1OFNMWUdyU3o5TDJKc013ejlSQ2UwdmVBajNNVlVq?=
 =?utf-8?B?RTJYNzQ1YkZaSlM1a3ZlZWZhaFlEbmRIenZGNGpZOFZBMllrUS9IR1o1c2JV?=
 =?utf-8?B?elZoM3ZJQlp2UjRYSnBXeVIxVmNyUEJEVXFXdnZqVFFsSFhJZllnbXdJdVBP?=
 =?utf-8?B?UHgrMmRSczdzSlBlV2VTRTZramVRaVc2MU8xckhodjhQQTVOS0tMTGZUeXM1?=
 =?utf-8?B?RlRVTkhmQW5BbEtCOGtDMmM4bWkwQnRnOVFTSHgzSzljM3NkbTBrckRWbDVU?=
 =?utf-8?B?N1ZzalE4WEZYUnhaclpnQit4YWw1UTZjaFhCM1dleWNzMnE0Vnl0RzU2M0xq?=
 =?utf-8?B?dWExY09nS2FlR2RjckV3UU81UEFmOFIrQVNaYUdyNTBTS2JXU3BJdjh2Q2lP?=
 =?utf-8?B?SFo2NnYzMmpqVFhvZm5yMENJSHhwdHZLT215VWV4eWROaEFTR1AxdzgvTHdT?=
 =?utf-8?B?dEVrc1VHa3RnNXZWNmhzQktGUk8zb1YvbFhNbGZBOHhnOFFQRWVJRFBKSjha?=
 =?utf-8?B?ZDVFUGs1MjdzNjVGWm9kdGorM3hkcTg3SWlFNEx5Nk52ajBQTzVrTHcrYkgw?=
 =?utf-8?B?eE5yTEJrRUh0eTQwaTV4WTdoWU1za1h5REdWN2d1bDk0SUx6RHV6ekE4SlR3?=
 =?utf-8?B?RGV2YXBHcU9YQlNORG9UemJwM3pMWGdmVzRVM0NiNkFwbFBRc21aZzVDYTVE?=
 =?utf-8?B?Ry9DRWgyVWJOZVpEWTYwVEVpK01ibnBlRG1wM3Rva1pTcjJ5S3UxWitLTkdm?=
 =?utf-8?B?K3pha0FYZU0xU3crNEJVODkyQ2E2aENzeWxSUm5qY0YySWxTMm9Bc3hZd2pS?=
 =?utf-8?B?bDVSRHRlN3pOblJxcFdDZ1EwakU2dytsL1lPQ0JkQnR6djM4K3ErV0k5UlEz?=
 =?utf-8?B?TmRvb0JCc3VRYVl5NTNQYTZRWEF5S2NoeW1PUjFQVGJNOXVoUDA3VUNKanBG?=
 =?utf-8?B?T1BjbTlWNWlEVCtKeEZPREVQdk9wd1N2eW9UeTJUTnVSaG0rbFlSYzBtQTRX?=
 =?utf-8?B?Uk5VZllIK2FHTkZ3L2l4eXZMdm5BRXZPeCtBZnpuU21tNmkybkVtNkR1eHpM?=
 =?utf-8?B?K0dzK015QnlKaE5lelZVaFo3NDY0dGpXZ3F2ekU3eVUzUVQwNXJJNmt4dVRa?=
 =?utf-8?B?aFRPYVVWeng1bGoxekg4aks5R1o4cWVJNUFSV2l5NWNaOTZmMjJlbTVVbmtX?=
 =?utf-8?Q?KVTM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2574.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1e77ed0-c22c-4134-9e32-08db4106c730
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2023 18:49:17.0366 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B6IVsbZk0hwtkcZl6IAgoX2ylKwCUE0BrCx9/JVmOBIR14J85cLdDY5qvv8og5ccJaK881InLeVFuUCutChm/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5768
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

Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9ndWNfY3Qu
Yw0KPj4+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxfZ3VjX2N0LmMNCj4+PiBp
bmRleCAxODAzYTYzM2VkNjQuLjk4ZTY4MmI3ZGYwNyAxMDA2NDQNCj4+PiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9ndWNfY3QuYw0KPj4+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2d0L3VjL2ludGVsX2d1Y19jdC5jDQo+Pj4gQEAgLTQxNSwxMiArNDE1LDYgQEAg
c3RhdGljIGludCBjdF93cml0ZShzdHJ1Y3QgaW50ZWxfZ3VjX2N0ICpjdCwNCj4+PiAgICAgIH0N
Cj4+PiAgICAgIEdFTV9CVUdfT04odGFpbCA+IHNpemUpOw0KPj4+DQo+Pj4gLSAgICAvKg0KPj4+
IC0gICAgICogbWFrZSBzdXJlIEgyRyBidWZmZXIgdXBkYXRlIGFuZCBMUkMgdGFpbCB1cGRhdGUg
KGlmIHRoaXMgdHJpZ2dlcmluZyBhDQo+Pj4gLSAgICAgKiBzdWJtaXNzaW9uKSBhcmUgdmlzaWJs
ZSBiZWZvcmUgdXBkYXRpbmcgdGhlIGRlc2NyaXB0b3IgdGFpbA0KPj4+IC0gICAgICovDQo+Pj4g
LSAgICBpbnRlbF9ndWNfd3JpdGVfYmFycmllcihjdF90b19ndWMoY3QpKTsNCj4+PiAtDQo+Pj4g
ICAgICAvKiB1cGRhdGUgbG9jYWwgY29waWVzICovDQo+Pj4gICAgICBjdGItPnRhaWwgPSB0YWls
Ow0KPj4+ICAgICAgR0VNX0JVR19PTihhdG9taWNfcmVhZCgmY3RiLT5zcGFjZSkgPCBsZW4gKyBH
VUNfQ1RCX0hEUl9MRU4pOyBAQA0KPj4+IC00MjksNiArNDIzLDEyIEBAIHN0YXRpYyBpbnQgY3Rf
d3JpdGUoc3RydWN0IGludGVsX2d1Y19jdCAqY3QsDQo+Pj4gICAgICAvKiBub3cgdXBkYXRlIGRl
c2NyaXB0b3IgKi8NCj4+PiAgICAgIFdSSVRFX09OQ0UoZGVzYy0+dGFpbCwgdGFpbCk7DQo+Pj4N
Cj4+PiArICAgIC8qDQo+Pj4gKyAgICAgKiBtYWtlIHN1cmUgSDJHIGJ1ZmZlciB1cGRhdGUgYW5k
IExSQyB0YWlsIHVwZGF0ZSAoaWYgdGhpcyB0cmlnZ2VyaW5nIGENCj4+PiArICAgICAqIHN1Ym1p
c3Npb24pIGFyZSB2aXNpYmxlIGJlZm9yZSB1cGRhdGluZyB0aGUgZGVzY3JpcHRvciB0YWlsDQo+
Pj4gKyAgICAgKi8NCj4+PiArICAgIGludGVsX2d1Y193cml0ZV9iYXJyaWVyKGN0X3RvX2d1Yyhj
dCkpOw0KPj4NCj4+IFRoZSBjb21tZW50IGFib3ZlIG5lZWRzIHVwZGF0ZSwNCg0KTmV2ZXIgbWlu
ZCwgSSBkZWNpZGVkIHRvIHJldmVydCB0aGlzIGNoYW5nZSBiZWNhdXNlIGl0J3Mgbm90IG5lY2Vz
c2FyeS4gVGhlcmUgaXMgYQ0KTU1JTyB3cml0ZSBmb2xsb3dpbmcgdGhlIGN0X3dyaXRlKCkgY2Fs
bCB3aGljaCB3b3VsZCBmbHVzaCB0aGUgd3JpdGUgY29tYmluaW5nDQpidWZmZXIgYW55d2F5LCBz
byB0aGUgYmFycmllciBpcyByZWR1bmRhbnQgaGVyZS4NCg0KPg0KPldpbGwgdXBkYXRlIHRoZSBj
b21tZW50Lg0KPg0KPj4gaWYgdGhpcyBpcyBjb3JyZWN0IGNoYW5nZS4gVGhlIHF1ZXN0aW9uIGlz
IHdoeSBpdCBpcyBjb3JyZWN0PyBJZiB5ZXMsDQo+PiBpdCBpbXBsaWVzIHRoYXQgb2xkIGJhcnJp
ZXIgaXMgaW5jb3JyZWN0LCBtYXliZSBpdCBzaG91bGQgYmUgdGhlbiBzZXBhcmF0ZSBmaXg/DQo+
DQo+IFRoZXJlIGlzIFdSSVRFX09OQ0UoZGVzYy0+dGFpbCwgdGFpbCkgcmlnaHQgYWZ0ZXIgdGhl
IEgyRyBidWZmZXIgdXBkYXRlIHdoaWNoIGlzIGFsc28NCj4gc2VlbiBieSB0aGUgR3VDIGZpcm13
YXJlLCB0aGUgYmFycmllciBpcyBuZWVkZWQgZm9yIGJvdGgsIHRodXMgbW92ZWQgaXQgZG93biBh
IGZldw0KPiBsaW5lcyB0byBjb3ZlciB0aGVtIGFsbC4NCj4NCj4+IEkgYW0gbm90IGFuIGV4cGVy
dCwgYnV0IHByZXZpb3VzIGxvY2F0aW9uIG9mIHRoZSBiYXJyaWVyIHNlZW1zIHNhbmUgdG8NCj4+
IG1lIC0gYXNzdXJlIEd1QyB3aWxsIHNlZSBwcm9wZXIgYnVmZmVyLCBiZWZvcmUgdXBkYXRpbmcg
YnVmZmVyJ3MgdGFpbC4NCj4NCj4gVGhhdCBpcyBjb3JyZWN0LCBidXQgdGhlIGJhcnJpZXIgaXMg
bmVlZGVkIGZvciBib3RoIEgyRyBidWZmZXIgYW5kIGRlc2NyaXB0b3IsIGFzIHRoZXkgYXJlIGFs
bCBzaGFyZWQgd2l0aCBHdUMgZmlybXdhcmUuDQo+DQo+IC1GZWkNCj4NCj4+IEFuZCBhY2NvcmRp
bmcgdG8gY29tbWl0IG1lc3NhZ2UgdGhpcyBuZXcgYmFycmllciBzaG91bGQgZmx1c2ggV0MNCj4+
IGJ1ZmZlciwgc28gZm9yIG1lIGl0IHNlZW1zIHRvIGJlIGRpZmZlcmVudCB0aGluZy4NCj4+IEFt
IEkgbWlzc2luZyBzb21ldGhpbmc/DQo+Pg0KPj4NCj4+IFJlZ2FyZHMNCj4+IEFuZHJ6ZWoNCg==
