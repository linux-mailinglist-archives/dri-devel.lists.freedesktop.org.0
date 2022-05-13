Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FCD52680B
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 19:16:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0E7810E408;
	Fri, 13 May 2022 17:16:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD0A010E2C8;
 Fri, 13 May 2022 17:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652462203; x=1683998203;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=PX2guiALP/Un1bCQV62e1mkPA4HY++D03KWLS1CjzpQ=;
 b=KcIvtB5/jxaMCatCPlwLmO/UYwT0k4E8kCwjNdjMC9pmwT8GAugAjbO2
 9q+vRpQ5JAeDBBzcLS8os/gX32Il17s3JkfV+zHPw6X+V/q64CdG1Fj1u
 mBeFMtYtEoD2WgCJwQPUXMHKvVScxKZ8WFvQy3U00cly+h912LqGEpvf8
 CaMxkM9J3yPNFcCghXEuhCXso0WjTHlqMj9TEzUzjqoKYoeEL2UeH1XoB
 K5dkf11NTDdN2ESrRDG+FT8hTOzo/AdtwbH6pZJRNMQNUcKROrxaibCk9
 f+3hclCLRyDHlQ+njGEHdUh+nLO3HgG1wSLfiTOKjf6/1+xGQ6NOKuxTY g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10346"; a="333392880"
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; d="scan'208";a="333392880"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2022 10:16:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; d="scan'208";a="567282152"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga007.jf.intel.com with ESMTP; 13 May 2022 10:16:28 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 13 May 2022 10:16:28 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 13 May 2022 10:16:28 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 13 May 2022 10:16:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HBr1MKlAr3Zo2XEWM8PWZPk2iOW8Wf2C28bC16ll5UpWY/i+sfS2YE2DQobUlok65DxuKcFcpCr7jfbUTqZwr/AZIcG5ct+HuZ50tcVaGdCYmgT315Xen2rnZ3TeWxZRf8DmzP6iM0RsOWf6nyPvPlZd6NFcWnySWy+NUSY0KibcyL7ZwPTxYESKjX7Do6HLYO+BBdcyKzwMeJ5RVEUoVDrp4y8ceV+Q+zLa46NInGVM+qS8xC37npi3i33oZgJgWAk93IaHbB97sfwwph1px8X3mF/XyG5fbJKtXF1j6o5iULLCiMfz58QJw/pyoQkm6NIfQBE6DdUuetANlt3uNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PX2guiALP/Un1bCQV62e1mkPA4HY++D03KWLS1CjzpQ=;
 b=SiX0i5sidvA/UoicKA6S9nQ54skygNY0aZS2a23tP0hQoFRfAz6RWEYm6yAZJ/Is0EhLQOhw1zgUiFOFiCyojB5sNGpRBtd7tnqLjUtV5X8f4khO7AaaE6GNK2MXQ1uEPKYM7iS4N3w+0Ws/dbNdaBCdk7Bft0hlcNpU7pzMB7jnO3cjlXCaGQmbZiAn3Wdvb4CPlqO3rQ07m/E1uKOlPJSj1JfcYd5byhIyVlBFyfTc2ZUUclagTGoYXSxw45FUX/Ro/q3sJZwfvFLU9O8rIcHDVnCR2RKzJ0QJ4QpibA9H8R9xEeOMRecoEl4xb2LWMkwZbG5lzPJaJYQuY6WCKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 MW3PR11MB4764.namprd11.prod.outlook.com (2603:10b6:303:5a::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.13; Fri, 13 May 2022 17:16:26 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4ca0:c733:3433:ce7b]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4ca0:c733:3433:ce7b%3]) with mapi id 15.20.5250.015; Fri, 13 May 2022
 17:16:26 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc/rc: Use i915_probe_error instead
 of drm_error
Thread-Topic: [Intel-gfx] [PATCH] drm/i915/guc/rc: Use i915_probe_error
 instead of drm_error
Thread-Index: AQHYYQwNvZX0nF/Qs0+Oi0amj3BgCq0dGEqA
Date: Fri, 13 May 2022 17:16:26 +0000
Message-ID: <b8f729f5f04adf6203c192b9226fc80ffb53a6d3.camel@intel.com>
References: <20220506054142.5025-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20220506054142.5025-1-vinay.belgaumkar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ef86b5e2-dd05-4cf1-582c-08da3504500f
x-ms-traffictypediagnostic: MW3PR11MB4764:EE_
x-microsoft-antispam-prvs: <MW3PR11MB4764137203B0853BD64F75798ACA9@MW3PR11MB4764.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: G/TdIC32S0dGpL1r6fDKnk3THEH6uxWt4LnxuBGmTK9xpCa/Z+31wUmuPWa1l6qISOqR5vjpflozMMFenX139udV3NvUvNLsuPpuFYRhZEgS0dhathsC1LFHExXcSNuV9Z32dEsMmOqlKLkTIKCXq9CfhxfoCblGsiENZ/pa4e0zo7cTPvjX8RnRIHoRppYwudZXVwfnhkk1lBbCqXuS3hYB/o3lKKMZ3bUHWL7AZQITeuKP3+9NHNSr8TadHoIbJZFA6BlM9Ohbf/CpdXlH5z8JaVgw7Gsm7jgL2OHGJbcO5KL4Cb8r+0bRRKKejXlqRY0tShX5IJDUCXRrVWbcI6TRDj24o6POMkAdIAqnntsay+BZBWn5okJE7G16zQ9pS8Kei7G5Nb+DG0PvVDabsG4BeD4wHFXVlOZmOoLQaQnQI93fmvyecvlxokwgCippP9juNjPfa4h8I2GfBMFVQAmqtDEnUe9dvSC35cC6FmNT4NW+JX/Vl9SJxq8NiNX8n/maa+oVYm9cXHPhKjgdiTcpY1U1evmkUBLK6iyfO9g0M5gHiyZRGeApAhJwXsnX6vgzB7IhuxDsWXD8mu3MT7Ic1pxOBydeeAoTSO5rGetiiBqPgpiT10swH2M42X4l3MU835i3tZVe7E1nujO1CDwFK1Yv35iuMNiVETn1J7/cFCGIOvkpbWI9vknOHujU/mRf5Inak4YAyajzF+Dm9A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6506007)(2616005)(26005)(83380400001)(2906002)(6512007)(36756003)(5660300002)(8936002)(38100700002)(122000001)(64756008)(66446008)(66476007)(450100002)(91956017)(38070700005)(66556008)(66946007)(76116006)(110136005)(82960400001)(8676002)(71200400001)(86362001)(186003)(6636002)(508600001)(316002)(6486002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Nm1pNjg0U1RGMXYxbW40R0VwUk5vdG54UEJTRjYrUHE1S1dTdER5aldueTIr?=
 =?utf-8?B?ZnVvTXlHV0prTWhldVd0NnpTZXVXNWRoc3pIYzZKTUNBdENMbGY4ZXBaRHB6?=
 =?utf-8?B?Q3FLVVZIWVV1R2c3TjAwVmtiMmRZSXE0eHI0eXZ1R3RRNFBRcWNyYlh1ZGZP?=
 =?utf-8?B?NjRBNVhrSkdEVEszMjBGZlAvQkZCZTRIRm1aWm11RTF6K1dWWkhBK0VMRE9W?=
 =?utf-8?B?MERyQmxPUWd2dnk2T1hjNVRWWG04NTJKdDVjRW5TalNZaWhBaW5xdVk2MEpo?=
 =?utf-8?B?SzBaOXhXMWhyQWFjdk9oZG40S1RCQzdkRVJwVlN5TStDeGZPRHkwVXVTdEk3?=
 =?utf-8?B?T2dXU085VFdiOXRJQ0lNeTRnd0hOajhXZm0yUzRPN0hPdldlaXZ5NCtMUTBl?=
 =?utf-8?B?MlRRR3V0NWJ5dU1INjdnS1d3QTFLQWxEVE9mVHltTlJtRXdrUGtNU3pSL214?=
 =?utf-8?B?a3Vya2NCcUtQazdsUDVJdVVhZFN1WFYzYXlhWVpCU1BSeEduUVoxbjEzTGJj?=
 =?utf-8?B?OGVrS2VMS1A3MXBjU29sc3BoUktyc2pqS0xrOEMzTXhPWi9obTBzZFk3dVNZ?=
 =?utf-8?B?UzFHbTVsWWV0TkNCNG9uVTl0VjI0WEQ0aUpkSTFjTytpRlVWa3NRL3JrdmtT?=
 =?utf-8?B?NDJURmRhSTZMa3JWdEhmOEI1QXV5YlYyZzd0b3djSlVtVGRvQ011MWs2cHlU?=
 =?utf-8?B?eWdoVXFXRGxTVVlXZURERXVtQjdDZjFDTy8wZmYvVGw5S1o0eXhFQWYvdVRG?=
 =?utf-8?B?WkJxYko3cEwyRGFyN2ZSVE5RdXpUWS9zeExUK3NjTjlQcGdRdFk1dElkUUJQ?=
 =?utf-8?B?OEZoa3pJdHVDUE5EbnI1S0NvQklwTld3Tm1Nejl4NlAzVFlsQ2crb2JnWlly?=
 =?utf-8?B?dVZsUXpIU2lkR0dlTVQxZHU2bUVqeGUrdmxSRVNGWCtGcUVvUUdSSzVVNWhi?=
 =?utf-8?B?MDlTVEtTVWV2d3kyWmZ0MUQza0tOV1IvZEEySktwRkZFUEVoZ3BhSzM3ZUNO?=
 =?utf-8?B?bHhoemx3V2JlblAyTy9lYU0xNjFvSURvWkdoT3UrcnljbXJZUFdpSlloSzZC?=
 =?utf-8?B?VTJsc2RsYkhCK2p6Ry90TEZDbzVKdU1odTg3Qk1sNkJIMkpjZXBwbU9wbFow?=
 =?utf-8?B?NCt6NTFBbnhVMGE3eTV6cGtiL0FDbXVwcTVxTFFwbDZRUEJDZXJWWUJCYlEr?=
 =?utf-8?B?TGRmS0RudHNnTVpYK0JnSHQ3K0xUcGJvd0IvWUV5VnFNWlRjSTFIQW1UWEN2?=
 =?utf-8?B?VElMb3NTNHFtZ0NwZ1BGbkIxYkgvV3JpdlFPLzRSaFRrUkl1cC92WTQ2QVFG?=
 =?utf-8?B?S1puMlo1QjAyUENJYVdNK2o3aTRTczlHQ2VESmoyaGlsTHgrVnhrU3RndlF6?=
 =?utf-8?B?bXJaVEQ1WHVEQmZsYjBRRTVWMm51TThMbkd0eVV4bmhYNGtPWmR3dHJidjRU?=
 =?utf-8?B?SFY2Ukk1ajZhMmVOWHN0SGRQbmRYY003d3dYNndPZFprTmlrMjVsY04xenZv?=
 =?utf-8?B?R1RST1BGc3ZscVFiOEREVkJLNWkvZDNPZHVabng4ZjlaVlJHcGxOWFl4cnoy?=
 =?utf-8?B?OHNGY0x0ZGEvY2gzYUVuZEdKNWRMT21YZEZWSUl5ZFVMSDZDTnJsYXRvZ1Ay?=
 =?utf-8?B?M1ZmUExzYWpFbFRUVGtUSExrSTFxa2dzbjd5dTlpVTNPc25WbitHN2YzSFpq?=
 =?utf-8?B?NGhOaTVkMW11ZnNNZDIybDF4NlQ5d2dmV3RGUDVCOXhGN1JsaVpKSUhZSzF6?=
 =?utf-8?B?TjZCR0t3UGFvRjZWMS9qOUhDRzFKVW9HZkZwSUUwTHdVbzQzeXVjZDdmbW9k?=
 =?utf-8?B?Z0tXS0NJK0hsSDhHaVgvUEJROTBsaWZibUFobDJGNUdGcDQwbUQzTWdpQjBT?=
 =?utf-8?B?OUVicXdnTlBWZzNJc2hEdktyWWhWaFk2cS80Y3grNVJSRE5LZWFnRUhNTmRt?=
 =?utf-8?B?bGFyUllCc0ZTcVFaREptUnZmQitqTGR3ZVR4K0Q2a2I5czFXUmUxendGWCt1?=
 =?utf-8?B?TFFYR0dicXpkanQrZmQ4aDZFY25ST3U0czAxSkRYb0VUMnNsWXNZZExNVGxB?=
 =?utf-8?B?Z3VDb2pHWTBGVVlhYko5Nzl1OGpRM0MxcDlEc2IxbGM1L0xXS05ZWThSZjNP?=
 =?utf-8?B?azBqZEFuUlBDK1lHcnByd0ZGZmVpODBDd2RHaTVOWVNvNmtxZXFXZmdVSFIv?=
 =?utf-8?B?MGtSeXo4a0lsc3hxamxpWE9iT1piclhpVmwydFlyMSsxWTVtY3lYQjRnTkhY?=
 =?utf-8?B?YjZyVk5KUlU0MXNrTVNOVE1rcGVBOWkxZFRLSmkwZWNTcG9UODNXQnRUWklE?=
 =?utf-8?B?QjBXRzhaZmFGdmphRDZUcmw5emoxU3pWWTRSODI4NEhEYUtrQnhiMTgwNldT?=
 =?utf-8?Q?idArBw18aLDW9inkAWRb2kGs5tikbK15CLNEWVjm7iJjC?=
x-ms-exchange-antispam-messagedata-1: L3W2FNhmzRAIpw==
Content-Type: text/plain; charset="utf-8"
Content-ID: <F511E4F19A453F45AD7789ADB6687711@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef86b5e2-dd05-4cf1-582c-08da3504500f
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2022 17:16:26.5045 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q67nWCvfWhNggBwpqxyXW2s3fquWA3nJaue0Ie2FU4lt6rywlY8Pyw83rUn0lCvsXgF4iOO5XEMZGflwPBAHnQXAaddY0k+rSdO1ntmZLRznMLuWqrNIdTwRm5lsQHkz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4764
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tml0OiBub3Qgc3VyZSB3aHkgd2UgdXNlIEVSUl9QVFIgZm9yIGludCB3aGVuIGNhbGxpbmcgZnVu
YyB3YXMgYWxzbyByZXR1cm5pbmcgYW4gaW50Lg0KQW55d2F5LCB0aGF0IHdhcyBob3cgdGhlIG9y
aWdpbmFsIGNvZGUgd2FzLCBzbzoNCg0KUmV2aWV3ZWQtYnk6IEFsYW4gUHJldmluIDxhbGFuLnBy
ZXZpbi50ZXJlcy5hbGV4aXNAaW50ZWwuY29tPg0KDQoNCk9uIFRodSwgMjAyMi0wNS0wNSBhdCAy
Mjo0MSAtMDcwMCwgVmluYXkgQmVsZ2F1bWthciB3cm90ZToNCj4gVG8gYXZvaWQgZmFsc2UgcG9z
aXRpdmVzIGluIGVycm9yIGluamVjdGlvbiBjYXNlcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFZp
bmF5IEJlbGdhdW1rYXIgPHZpbmF5LmJlbGdhdW1rYXJAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2d1Y19yYy5jIHwgNSArKy0tLQ0KPiAgMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9ndWNfcmMuYyBiL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2d1Y19yYy5jDQo+IGluZGV4IGUwMDY2MWZiMDg1
My4uOGY4ZGQwNTgzNWM1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91
Yy9pbnRlbF9ndWNfcmMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRl
bF9ndWNfcmMuYw0KPiBAQCAtNDksNyArNDksNiBAQCBzdGF0aWMgaW50IGd1Y19hY3Rpb25fY29u
dHJvbF9ndWNyYyhzdHJ1Y3QgaW50ZWxfZ3VjICpndWMsIGJvb2wgZW5hYmxlKQ0KPiAgc3RhdGlj
IGludCBfX2d1Y19yY19jb250cm9sKHN0cnVjdCBpbnRlbF9ndWMgKmd1YywgYm9vbCBlbmFibGUp
DQo+ICB7DQo+ICAJc3RydWN0IGludGVsX2d0ICpndCA9IGd1Y190b19ndChndWMpOw0KPiAtCXN0
cnVjdCBkcm1fZGV2aWNlICpkcm0gPSAmZ3VjX3RvX2d0KGd1YyktPmk5MTUtPmRybTsNCj4gIAlp
bnQgcmV0Ow0KPiAgDQo+ICAJaWYgKCFpbnRlbF91Y191c2VzX2d1Y19yYygmZ3QtPnVjKSkNCj4g
QEAgLTYwLDggKzU5LDggQEAgc3RhdGljIGludCBfX2d1Y19yY19jb250cm9sKHN0cnVjdCBpbnRl
bF9ndWMgKmd1YywgYm9vbCBlbmFibGUpDQo+ICANCj4gIAlyZXQgPSBndWNfYWN0aW9uX2NvbnRy
b2xfZ3VjcmMoZ3VjLCBlbmFibGUpOw0KPiAgCWlmIChyZXQpIHsNCj4gLQkJZHJtX2Vycihkcm0s
ICJGYWlsZWQgdG8gJXMgR3VDIFJDICglcGUpXG4iLA0KPiAtCQkJc3RyX2VuYWJsZV9kaXNhYmxl
KGVuYWJsZSksIEVSUl9QVFIocmV0KSk7DQo+ICsJCWk5MTVfcHJvYmVfZXJyb3IoZ3VjX3RvX2d0
KGd1YyktPmk5MTUsICJGYWlsZWQgdG8gJXMgR3VDIFJDICglcGUpXG4iLA0KPiArCQkJCSBzdHJf
ZW5hYmxlX2Rpc2FibGUoZW5hYmxlKSwgRVJSX1BUUihyZXQpKTsNCj4gIAkJcmV0dXJuIHJldDsN
Cj4gIAl9DQo+ICANCj4gLS0gDQo+IDIuMzUuMQ0KPiANCg0K
