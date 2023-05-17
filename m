Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E77705DD7
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 05:14:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9260A10E396;
	Wed, 17 May 2023 03:14:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D437410E392;
 Wed, 17 May 2023 03:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684293265; x=1715829265;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lm5tv/p1ymnr5FikxNCWGCuw4zPIhxip021aWj+PSFE=;
 b=YwzzKudhg2B47wfWFjeAajATirLPg5Jide2t3733q+XU9A7aJj1D/4/j
 JEMtrLeCgxPBtfstwLNzcZcbnC1IwPs7JYpomzHYynnF3F4QhoXhHV76X
 Eaz/Y/V+ajWj9b9Mau37d8r3ZGESEJwIfkA5g19rPqzYeh+NVECNSF88h
 G9ZNzQnUQFiBO50gYbrjn8qykn2evnIF465Quekheg43zl2Bb5e22POX6
 pu6qfMbSmKCGWTdRQ3J01wmeCrbj44laWIQBiQuSiBfNRi3X6EFJrAuSN
 ywCyNJiP8voDZ2OiVrwIcS2E1PRq0ShGyPh1Kur8HKGO7e33VYpVELVFk A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="331264653"
X-IronPort-AV: E=Sophos;i="5.99,280,1677571200"; d="scan'208";a="331264653"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 20:14:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="771304130"
X-IronPort-AV: E=Sophos;i="5.99,280,1677571200"; d="scan'208";a="771304130"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP; 16 May 2023 20:14:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 16 May 2023 20:14:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 16 May 2023 20:14:17 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 16 May 2023 20:14:17 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 16 May 2023 20:14:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DeGTij/g0njtzSbDEKiAy2+WH2pfOdBYTxqtJdZIL9mPUsg1K9pXYpRtXWMVZMipablPXceXHCU5MUNZV297W9LOdXsnXgA4XNlKH+MERHW4SMERKOF/bsOra6BBSYRavXfKms8qadjRDwsrwHDA7PFs8nF4Y72XZa6HNUxVcBGCmSdesj6XkkZSBvswMQhgo7BGKmOvxvJwc+Q7pglIFUx70Y7TrdlSwyyBB2o3C0AG2XHdX+etmQiSfmn0VKJiRz6VqGtUSyTrnQC2Taux518lKJrEpSoc1Y1RpIzyCogiDd4VPsKWxK55vLMjC/6t905ctYnWlRovbaVqIQEUfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lm5tv/p1ymnr5FikxNCWGCuw4zPIhxip021aWj+PSFE=;
 b=bu/fpFDyYsBAXeUgx1c1dkJ0xFdMu7wWrV9snb542JgGubDDedT8141AiYtmIvdPhuC2y7YqcnP5W/Mi31qhNeFkibpu28p44/qBMq3QeDjL4F5NHadkWGN2k50mmgHKrOo8s7ftRWtAA9CoEfXfYrypOE9MY+sIw1vWStxAfMUEKa5HWaSCJrqYnVS7DHvLf0v/Uy3pqa+13U93rY0JjlIWgi9chm2RMoG8jtuFiaUtETNbK1KyoIX5MwuTe+tqmkKHXnfJFefWvGJgCUiKU9/I1PDQv7bY5xBMWFF/mEwV4jrVEfQBrtUxiqYuUc3279stXZLa27JJ1yZjhW0XwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by SA1PR11MB7109.namprd11.prod.outlook.com (2603:10b6:806:2ba::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Wed, 17 May
 2023 03:14:10 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::3c34:3b9d:4abf:d93c]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::3c34:3b9d:4abf:d93c%3]) with mapi id 15.20.6387.030; Wed, 17 May 2023
 03:14:10 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Subject: RE: [Freedreno] [PATCH v5 6/8] drm/display/dsc: split DSC 1.2 and DSC
 1.1 (pre-SCR) parameters
Thread-Topic: [Freedreno] [PATCH v5 6/8] drm/display/dsc: split DSC 1.2 and
 DSC 1.1 (pre-SCR) parameters
Thread-Index: AQHZfp4YcDsmrD/BuE6hnamqa8oWkK9dTRCggABbqICAADTTIA==
Date: Wed, 17 May 2023 03:14:10 +0000
Message-ID: <SN7PR11MB6750C44FC84BA19033B720DAE37E9@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20230504153511.4007320-1-dmitry.baryshkov@linaro.org>
 <20230504153511.4007320-7-dmitry.baryshkov@linaro.org>
 <SN7PR11MB6750F3758BA9B176904C449BE3799@SN7PR11MB6750.namprd11.prod.outlook.com>
 <12082d1c-4ff2-5ca6-fdaa-2fad6bd06e84@linaro.org>
In-Reply-To: <12082d1c-4ff2-5ca6-fdaa-2fad6bd06e84@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|SA1PR11MB7109:EE_
x-ms-office365-filtering-correlation-id: 9ee2697c-5d23-4486-341c-08db5684c86e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tDEL5590D6KxA8vx0mwKslzml6EVm965ZRa2Kq5xz85Iz2+YdYBc57Scx3QXY8kKA6f1bBw9FSO1Xev+cOiYv/VvQW5jrwuQ9HDyXr0Xi/GLUQmyPicFEKDgFknJ3yo3F+L+Rrmn7Sa0P2jntbqDRcmyCLLZ6Pam8cXh/l7OVJcSI8LTnJw9Vt3vZqkNgPcrAGtzuqq+//pwFUU/eO/wakgslHL7A+dC60N4o5BONS7wBQ1bNEHyLAu3kXSFD6I5oSgH/IikzVs2EYX+DcIgVMSRlGjWjKbCtzV97X5pVAZBIADCZo+F3aQonFKQutRSeby/OaonD78J4Qgm9b42Qa6xwwZfJsHqNEuICIGzBr8MjvcNOFlLSBGkSLkDl1/RDqt+I04hYlBNW+rvLVpiBmCVXPLvfdCKLO02Oww/zUxz9dlTY1Zq/VIX8yM66SKg9Ahk5Xf8FPgt0+OGBG1VOylntPYkwodfkoDU0Bxzxli5m/E9sjaI6VaBP5Ip8Sm/iAYKslj1aXPLlmM+q6M4dfJ2IRj/kRr9AyNBWHYpnT+1LKsdzMfAcvmWNV24niiesVfgEd+yKhcJeFEVdrqrvVi5gFL39NYnN9wIA2qUeSnwXiqcJ7Hf9cbiAmlurSbT
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(366004)(136003)(396003)(346002)(376002)(451199021)(33656002)(7696005)(38070700005)(55016003)(66574015)(83380400001)(122000001)(53546011)(9686003)(38100700002)(26005)(6506007)(921005)(186003)(82960400001)(86362001)(110136005)(54906003)(7416002)(52536014)(2906002)(41300700001)(8676002)(5660300002)(316002)(8936002)(4326008)(64756008)(76116006)(66556008)(66446008)(66476007)(66946007)(71200400001)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NDFORWQ0NGFqNjJxL3ViN094Yll1VVc1ZkdkRllwL3lteGJTVUpFVTc3N2Vp?=
 =?utf-8?B?TENxWGNSMi96dC9tVmRJSjF3cjN2dm9SNFVIaXZiS09ENGxoSDRHVkRKUFRa?=
 =?utf-8?B?N3JrN0NMMjNkbTEyVWZLZVdvMEorSVFBMUpXR1B1ZFplbHA4MUYyVnc5K3FU?=
 =?utf-8?B?Q2Z0ZWF3SldVS0FnOU00YmtZRGI3c29KaXVMMzR1NFhBUkpHK2JqNEhhdE56?=
 =?utf-8?B?dWZIQTM4cm5tQXJ4NnNCeXlyTkNrbkhLZU1XVUpWeUU4QUR6czZzelRKdnJ6?=
 =?utf-8?B?TTBZUmI2NHgvcDFpd1UwTGJSV2xXK0VtN3F6V2lBQTVJRjhTVUtCUVlES00z?=
 =?utf-8?B?K3V5QzdLSmRLYmR6U0gzRXRJd0lBT3hHWGlQRUlEL1lQU0xSNU8xUmg0UnpK?=
 =?utf-8?B?SDdpanp5U1dieGEvVWN6YklXbys5Wlh4Ymc1NDA5ZkFOSWR5Y29sLzlzZElT?=
 =?utf-8?B?UUhrM2htVWZUeThxUndLcTJ6STlweTlSMVJmdG9jYnNPYW5pM1o4MHdTUjFN?=
 =?utf-8?B?YzJ1ZzFndHRvaDEyVWFCTCtVM3dsYit0R1MxeXpnOGRzMzZnbXdLL1FZaHkw?=
 =?utf-8?B?VU0yTkRWOC82QldNdUFyR1ZqR1RoTHFkS01oQjdrUllJZFhhVml2eXhEM0tm?=
 =?utf-8?B?N0M0RmZ3TmpKODN4cWRwY29DR0xIUWo5VGNaOUN2RitBMkwyZEV3bjhzRU56?=
 =?utf-8?B?T2NmMExSR2NWd0tGWEdOQ0s0cnRZTG1SVkpUM20xTFhxTFl6RTJEWmRqTVNB?=
 =?utf-8?B?OGx3NEoxSVcyREowalhZdDRuWUdvVjM0NDJySXRQUHJva0VIS2VpejdlSmV0?=
 =?utf-8?B?Tk1ybmZkUGxOS2VEM2hJaFVyNXRTV1JBNjUrbGFjTzFUbU9GUDBTblFYdUl2?=
 =?utf-8?B?S0hzWTRKVytXTHVGdWp6ci9rZDJwVGsrZWRGQ0lDQlgyVFRXbmxaNThZUkJr?=
 =?utf-8?B?OGVhTXIyd0dFbTNxa1dLZjMySUExMkhXKzVvR09nR2IxMU11RTZEZkZyM2tt?=
 =?utf-8?B?Qit6SVA2b2d2SEJDc2xpVFhzZFZrK0VtVE0yV1BEREt1Z0lEZ2xKNEtxRzM0?=
 =?utf-8?B?eU1Jd0VXUzhSa2ZWQzEwY3g0UWNoQWZCNGRxNmdGdXNmcm1zbExjVmsxVHlh?=
 =?utf-8?B?OVh1VTJUTlJHM2RxNDRzZWgvTnJDdnZGUFRlWmJsYjlPSGVlTitSaCtucStn?=
 =?utf-8?B?TlNQa2QwQVNCK3RuMHB3ZVdZbnQ1TmpMT1NaVVE3VzNMYjg1K3RPOVZVN1FW?=
 =?utf-8?B?SGlsejlqUG1FU2s1WmtyeXNJa0FwbmYvRXFUc2xkbEY4Y0tXOWJVSEFTYmpP?=
 =?utf-8?B?bExDbTlvT01FQ2FaSmt4NzZaQnozTXZPeXRGSitvL1RYSHdtU0xDak1KUDUx?=
 =?utf-8?B?RExObUtDaGxmckQrVUxHNjMvSkNMSmYvcTk1ZmVodFlteUVuUGptWkZqcFUx?=
 =?utf-8?B?Tm83YUJXUzJrMFBydXRwZTBHQ0U4OXRmU3pkZVFHQk1VbWdUWHJxZHdOUFQ3?=
 =?utf-8?B?TkJNejAraUo1Wm5wYXZMOVRTT01hOFd2K0hKMjU3YVAwcjg4Q1ZQcC9PMHVO?=
 =?utf-8?B?ZTBvTWZoazM2ZUE4OERyV0VneE1EWXVKby9ydE5lbFpsMEU5bUhSY2hHN0U2?=
 =?utf-8?B?MGlDVkFwT1hBQWpsbkgrNjVNV1NxaVlia3FTMlJWYWlzOWdoei9NZFpuQjNa?=
 =?utf-8?B?a0ZDcDYxUSswSTh5Z3VTTVJTeTB1bWNCbWwrMkl4WHlMcnlhRG5YTngrMXhj?=
 =?utf-8?B?ekdVUXNPWk1vVDZkdGh2S1ZsZlZ2S2dwaDlDZFd4Z3RxYlNrampNWk80Zk0x?=
 =?utf-8?B?YUdhWEtPclVOL0xIaENBNWZPc2FvcGJIaDdWb3RLUUJCVnNkcGtZK0dtTTY3?=
 =?utf-8?B?MzVjb3BLU2w3ajlvYnpnRExaYWI0YnRSYXJIeWZBQ1ZMdm1MSTg2WlRtMXdY?=
 =?utf-8?B?ZFFqb2dRbytFVFJMbURDdkk5T2Y3WTlxaXVzL3VaeXY2OE5PdWtqVTY0Ti9D?=
 =?utf-8?B?bWxDSUdCNnc5aHEwNTJDaDQveFJPSzRlTDVxWDNKWUNrUjQxbS8xWVVQLzZQ?=
 =?utf-8?B?dllLQ2pUSDRodWo1MVBEcDY1dFRnT0ZNMU9SVkx6TU9uZ0lONHFCa25SUXpl?=
 =?utf-8?Q?xViXm1ISrFKs1yfDVqvC6cfRy?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ee2697c-5d23-4486-341c-08db5684c86e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2023 03:14:10.1251 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nLrI4uJNbOiKxA9x+CN8UAZYbpB4jDbR99jmRJiq1ZrkF6QCEtjW7vNGwHOF8/kcX/I4GOCger/egMAa2U5a/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7109
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
Cc: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRG1pdHJ5IEJhcnlzaGtv
diA8ZG1pdHJ5LmJhcnlzaGtvdkBsaW5hcm8ub3JnPg0KPiBTZW50OiBXZWRuZXNkYXksIE1heSAx
NywgMjAyMyA1OjMzIEFNDQo+IFRvOiBLYW5kcGFsLCBTdXJhaiA8c3VyYWoua2FuZHBhbEBpbnRl
bC5jb20+OyBEYXZpZCBBaXJsaWUNCj4gPGFpcmxpZWRAZ21haWwuY29tPjsgRGFuaWVsIFZldHRl
ciA8ZGFuaWVsQGZmd2xsLmNoPjsgSmFuaSBOaWt1bGENCj4gPGphbmkubmlrdWxhQGxpbnV4Lmlu
dGVsLmNvbT47IEpvb25hcyBMYWh0aW5lbg0KPiA8am9vbmFzLmxhaHRpbmVuQGxpbnV4LmludGVs
LmNvbT47IFZpdmksIFJvZHJpZ28gPHJvZHJpZ28udml2aUBpbnRlbC5jb20+Ow0KPiBUdnJ0a28g
VXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AbGludXguaW50ZWwuY29tPjsgUm9iIENsYXJrDQo+IDxy
b2JkY2xhcmtAZ21haWwuY29tPjsgQWJoaW5hdiBLdW1hciA8cXVpY19hYmhpbmF2a0BxdWljaW5j
LmNvbT47DQo+IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPjsgTWFyaWpuIFN1aWp0ZW4NCj4g
PG1hcmlqbi5zdWlqdGVuQHNvbWFpbmxpbmUub3JnPg0KPiBDYzogbGludXgtYXJtLW1zbUB2Z2Vy
Lmtlcm5lbC5vcmc7IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7DQo+IGZyZWVkcmVu
b0BsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7
IFZpbGxlDQo+IFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+DQo+IFN1
YmplY3Q6IFJlOiBbRnJlZWRyZW5vXSBbUEFUQ0ggdjUgNi84XSBkcm0vZGlzcGxheS9kc2M6IHNw
bGl0IERTQyAxLjIgYW5kDQo+IERTQyAxLjEgKHByZS1TQ1IpIHBhcmFtZXRlcnMNCj4gDQo+IE9u
IDE2LzA1LzIwMjMgMjE6NDYsIEthbmRwYWwsIFN1cmFqIHdyb3RlOg0KPiA+Pg0KPiA+PiBUaGUg
YXJyYXkgb2YgcmNfcGFyYW1ldGVycyBjb250YWlucyBhIG1peHR1cmUgb2YgcGFyYW1ldGVycyBm
cm9tIERTQw0KPiA+PiAxLjEgYW5kIERTQyAxLjIgc3RhbmRhcmRzLiBTcGxpdCB0aGVzZSB0b3cg
Y29uZmlndXJhdGlvbiBhcnJheXMgaW4NCj4gPj4gcHJlcGFyYXRpb24gdG8gYWRkaW5nIG1vcmUg
Y29uZmlndXJhdGlvbiBkYXRhLg0KPiA+Pg0KPiA+DQo+ID4gSGkgLA0KPiA+IE5lZWRlZCB0byBh
ZGQgc29tZSBtb3JlIGNvbW1lbnRzIGFwYXJ0IGZyb20gdGhlIHByZXZpb3VzIG9uZXMNCj4gYWxy
ZWFkeQ0KPiA+IGdpdmVuDQo+ID4NCj4gDQo+IFtza2lwcGVkXQ0KPiANCj4gDQo+ID4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Zkc2MuYw0KPiA+PiBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfdmRzYy5jDQo+ID4+IGluZGV4IGQ0
MzQwYjE4YzE4ZC4uYmQ5MTE2ZDJjZDc2IDEwMDY0NA0KPiA+PiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX3Zkc2MuYw0KPiA+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX3Zkc2MuYw0KPiA+PiBAQCAtMjI2LDcgKzIyNiwxNSBAQCBpbnQg
aW50ZWxfZHNjX2NvbXB1dGVfcGFyYW1zKHN0cnVjdA0KPiA+PiBpbnRlbF9jcnRjX3N0YXRlICpw
aXBlX2NvbmZpZykNCj4gPj4gICAJaWYgKERJU1BMQVlfVkVSKGRldl9wcml2KSA+PSAxMykgew0K
PiA+PiAgIAkJY2FsY3VsYXRlX3JjX3BhcmFtcyh2ZHNjX2NmZyk7DQo+ID4+ICAgCX0gZWxzZSB7
DQo+ID4+IC0JCXJldCA9IGRybV9kc2Nfc2V0dXBfcmNfcGFyYW1zKHZkc2NfY2ZnKTsNCj4gPj4g
KwkJaWYgKChjb21wcmVzc2VkX2JwcCA9PSA4IHx8DQo+ID4+ICsJCSAgICAgY29tcHJlc3NlZF9i
cHAgPT0gMTIpICYmDQo+ID4+ICsJCSAgICAodmRzY19jZmctPmJpdHNfcGVyX2NvbXBvbmVudCA9
PSA4IHx8DQo+ID4+ICsJCSAgICAgdmRzY19jZmctPmJpdHNfcGVyX2NvbXBvbmVudCA9PSAxMCB8
fA0KPiA+PiArCQkgICAgIHZkc2NfY2ZnLT5iaXRzX3Blcl9jb21wb25lbnQgPT0gMTIpKQ0KPiA+
PiArCQkJcmV0ID0gZHJtX2RzY19zZXR1cF9yY19wYXJhbXModmRzY19jZmcsDQo+ID4+IERSTV9E
U0NfMV8xX1BSRV9TQ1IpOw0KPiA+PiArCQllbHNlDQo+ID4+ICsJCQlyZXQgPSBkcm1fZHNjX3Nl
dHVwX3JjX3BhcmFtcyh2ZHNjX2NmZywNCj4gPj4gRFJNX0RTQ18xXzJfNDQ0KTsNCj4gPj4gKw0K
PiA+DQo+ID4gSSBkbyBub3QgdGhpbmsgdGhpcyBraW5kIG9mIGFzc2lnbm1lbnQgd29ya3MgYXMg
eW91IHdpbGwgYWxzbyBiZQ0KPiA+IGFkZGluZw0KPiA+IERSTV9EU0NfMV8yXzQyMiBhbmQgRFJN
X0RTQ18xXzJfNDIwIGluIGZ1cnRoZXIgcGF0Y2hlcyBhbmQgQUZBSUNTDQo+ID4gVGhlcmUgaXMg
bm8gd2hlcmUgaW4gcGF0Y2ggOCB0aGF0IHlvdSBoYXZlIGFjY291bnRlZCBmb3Igd2hlbiA0MjIg
b3IgNDIwDQo+IHdpbGwgYmUgdXNlZC4NCj4gPiBNYXliZSB5b3UgY2FuIGFkZCBhbiBpZiBjYXNl
IGluc2lkZSB0aGUgZWxzZSBibG9jayB0byBjaGVjaw0KPiA+IHBpcGVfY29uZmlnLT5vdXRwdXRf
Zm9ybWF0IHRvIHBhc3MgdGhlIHJjX3BhcmFtX2RhdGEgaW4gcGF0Y2ggOA0KPiANCj4gSSBkb24n
dCB0aGluayB0aGlzIGlzIG5lY2Vzc2FyeSBmb3Igbm93LiBUaGUgZHJpdmVyIGRvZXNuJ3Qgc3Vw
cG9ydCBZVVYgNDIyLg0KPiBUaGUgWVVWIDQyMCBpcyBzdXBwb3J0ZWQgb25seSBmb3IgRElTUExB
WV9WRVIoZGV2X3ByaXYpID49IDE0LCBob3dldmVyDQo+IHRoZXNlIGhlbHBlcnMgYXJlIG9ubHkg
dXNlZCBmb3IgRElTUExBWV9WRVIoZGV2X3ByaXYpIDwgMTMuDQo+IA0KPiBJIGRpZCBub3QgbW92
ZSBSQyBjYWxjdWxhdGlvbiB0byBkcm1fZHNjX2hlbHBlcnMuYyAoeWV0ID8pLCB3aGljaCBpcyB1
c2VkIGZvcg0KPiBESVNQTEFZX1ZFUiA+PSAxMy4NCg0KSG1tLiBJIHNlZSBJJ2xsIHdvcmsgb24g
aXQgb25jZSB0aGlzIHBhdGNoIHNlcmllcyBpcyBtZXJnZWQNCg0KUmVnYXJkcywNClN1cmFqIEth
bmRwYWwNCj4gDQo+ID4NCj4gPiBSZWdhcmRzLA0KPiA+IFN1cmFqIEthbmRwYWwNCj4gPj4gICAJ
CWlmIChyZXQpDQo+ID4+ICAgCQkJcmV0dXJuIHJldDsNCj4gPj4NCj4gPj4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvZHJtL2Rpc3BsYXkvZHJtX2RzY19oZWxwZXIuaA0KPiA+PiBiL2luY2x1ZGUvZHJt
L2Rpc3BsYXkvZHJtX2RzY19oZWxwZXIuaA0KPiA+PiBpbmRleCAxNjgxNzkxZjY1YTUuLmM2MzRi
YjI5MzVkMyAxMDA2NDQNCj4gPj4gLS0tIGEvaW5jbHVkZS9kcm0vZGlzcGxheS9kcm1fZHNjX2hl
bHBlci5oDQo+ID4+ICsrKyBiL2luY2x1ZGUvZHJtL2Rpc3BsYXkvZHJtX2RzY19oZWxwZXIuaA0K
PiA+PiBAQCAtMTAsMTIgKzEwLDE3IEBADQo+ID4+DQo+ID4+ICAgI2luY2x1ZGUgPGRybS9kaXNw
bGF5L2RybV9kc2MuaD4NCj4gPj4NCj4gPj4gK2VudW0gZHJtX2RzY19wYXJhbXNfa2luZCB7DQo+
ID4+ICsJRFJNX0RTQ18xXzJfNDQ0LA0KPiA+PiArCURSTV9EU0NfMV8xX1BSRV9TQ1IsIC8qIGxl
Z2FjeSBwYXJhbXMgZnJvbSBEU0MgMS4xICovIH07DQo+ID4+ICsNCj4gPj4gICB2b2lkIGRybV9k
c2NfZHBfcHBzX2hlYWRlcl9pbml0KHN0cnVjdCBkcF9zZHBfaGVhZGVyICpwcHNfaGVhZGVyKTsN
Cj4gPj4gaW50DQo+ID4+IGRybV9kc2NfZHBfcmNfYnVmZmVyX3NpemUodTggcmNfYnVmZmVyX2Js
b2NrX3NpemUsIHU4DQo+ID4+IHJjX2J1ZmZlcl9zaXplKTsgdm9pZCBkcm1fZHNjX3Bwc19wYXls
b2FkX3BhY2soc3RydWN0DQo+ID4+IGRybV9kc2NfcGljdHVyZV9wYXJhbWV0ZXJfc2V0ICpwcHNf
c2RwLA0KPiA+PiAgIAkJCSAgICAgIGNvbnN0IHN0cnVjdCBkcm1fZHNjX2NvbmZpZyAqZHNjX2Nm
Zyk7ICB2b2lkDQo+ID4+IGRybV9kc2Nfc2V0X3JjX2J1Zl90aHJlc2goc3RydWN0IGRybV9kc2Nf
Y29uZmlnICp2ZHNjX2NmZyk7IC1pbnQNCj4gPj4gZHJtX2RzY19zZXR1cF9yY19wYXJhbXMoc3Ry
dWN0IGRybV9kc2NfY29uZmlnICp2ZHNjX2NmZyk7DQo+ID4+ICtpbnQgZHJtX2RzY19zZXR1cF9y
Y19wYXJhbXMoc3RydWN0IGRybV9kc2NfY29uZmlnICp2ZHNjX2NmZywgZW51bQ0KPiA+PiArZHJt
X2RzY19wYXJhbXNfa2luZCBraW5kKTsNCj4gPj4gICBpbnQgZHJtX2RzY19jb21wdXRlX3JjX3Bh
cmFtZXRlcnMoc3RydWN0IGRybV9kc2NfY29uZmlnICp2ZHNjX2NmZyk7DQo+ID4+DQo+ID4+ICAg
I2VuZGlmIC8qIF9EUk1fRFNDX0hFTFBFUl9IXyAqLw0KPiA+PiAtLQ0KPiA+PiAyLjM5LjINCj4g
Pg0KPiANCj4gLS0NCj4gV2l0aCBiZXN0IHdpc2hlcw0KPiBEbWl0cnkNCg0K
