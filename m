Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFD47DD7CF
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 22:38:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C133B10E5CA;
	Tue, 31 Oct 2023 21:38:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A84F10E5CA;
 Tue, 31 Oct 2023 21:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698788286; x=1730324286;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=vUWBN8pT6/LPlJ9ofIzs3Mv20OETjrjNsj8MBSp5lXY=;
 b=UW0VLOcHQ6/n4irsh0WSz4jl8vHvdB+0tgyE36Nqfs4ICcTyZ+hkrlVb
 BEM0A84bAOuZGQ4SfLvf1a5tEjk7eV4pBzfRnNIOp2O5uW2XKr2KetbLh
 Y3hx+8pXo3FwBuR55k/PK1lNQKF7ocIjW/1S5amqwCJ2Us2khfWLDZaOq
 6qq/kQDgKUyxx+7E6kNyNMomX4jQfDV+pLVI8MhEhnsofFEsNYEx4sPVD
 Re2ELWAD4UiuGTNNwHEMkVdX0delC2kU3s4J8RkQI1/1+1uvfokZiJhAx
 t4nav6yWrwQ1jq2ECzElI+6pxzvhqsJD7iBw4KWhdOFpXr9lAXRuaEM87 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="387262641"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; d="scan'208";a="387262641"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 14:38:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="851370202"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; d="scan'208";a="851370202"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Oct 2023 14:38:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 31 Oct 2023 14:38:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 31 Oct 2023 14:38:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 31 Oct 2023 14:38:04 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 31 Oct 2023 14:38:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AIPYQQbZW1NrVUVayNEUsuSaL5+DV2zva3MPwFlrXDK556IOR0Tud5OqJes2VVQKpO59HlsQHgX6KZPzPzMV2cxkMbo8+zNjVV9DJR5rmaovNE82t+G8tceSVPHBuPXqbDvJkSKkqDP8qDpOikl/aVMcXUKgwD4rrR2szzoAqfTkx0KZ6PB7KKqYsv7v1eVGeBrxntCA1wVI6Xfra75dfkqANGQkb7qL6p6CRo+eZRG0Kjp9HrVPGlRrK0d+CBuTSPA+Bq1zlEw5uazL0ZLSosvz8PTDyeZ7U8pXgdUMzJpX6K1i+PiXLaVJuWg1eRLugIe3ohykToCSVkUhPV4TgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vUWBN8pT6/LPlJ9ofIzs3Mv20OETjrjNsj8MBSp5lXY=;
 b=JI8gEEfHIGAbb46xfbP0zf0NR9zalK25HKULCHUlvCj4H5XzNxI2IQU985CT23mykPOwnN51Kr1qiAjv5I5i6HKarrTPcMWshoJsZ0QsYO1ck+xbQFYUaqcJ5Hgoj93Z1iWEx0S6HbZSbR+niCnmW4K2gb47dzUwfQjTzof2Bwws7kO7AzB3m63E7L14fSHDiZl0EYdAkk7/UgeEY4j6lSkFuGtVrkYIkjkT9DCGbvzXKepvVwYZup1h2ce0PNKfsmOaWNS38NWB/9/xAhNMVmPZJ9nHodcl4BGEGCAtARSKsaW9jq4w3j13usfIrWsG9sfADgbGi8iOeLS++ZEtHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 PH0PR11MB7522.namprd11.prod.outlook.com (2603:10b6:510:289::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6933.28; Tue, 31 Oct 2023 21:38:02 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::d070:1879:5b04:5f57]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::d070:1879:5b04:5f57%4]) with mapi id 15.20.6933.029; Tue, 31 Oct 2023
 21:38:02 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Skip pxp init if gt is wedged
Thread-Topic: [Intel-gfx] [PATCH] drm/i915: Skip pxp init if gt is wedged
Thread-Index: AQHaCFdFWZV+5uQJ1kKifTPTSJGMB7BdOZoAgAc6wQA=
Date: Tue, 31 Oct 2023 21:38:02 +0000
Message-ID: <99df74b59af6abc51d5d13947912e11eb32f5a72.camel@intel.com>
References: <20231026215444.54880-1-zhanjun.dong@intel.com>
 <87a5s47d1p.fsf@intel.com>
In-Reply-To: <87a5s47d1p.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|PH0PR11MB7522:EE_
x-ms-office365-filtering-correlation-id: ac1c0967-2b88-4baa-ff5f-08dbda59a907
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YExH5ttFfTcEfHth75d/hZep9HimmK5FNXtNn79oLZAO7uvXVsxn9OL/RcNgMKNkanxG1sYx5xbs0lPPtImP6GLfOqeX3ttGTWQJUJZjGHDjTGFuoYZCeHrwUH2GhH6hHls5N8ZId8rp7NcrcT7fjFDknDNZh2RY2n7fbnO4+GszEkKiqvON6VQV+Au/k+RSJY4Q5ETDkFGXCunqsqSFPdEmlo+MQ5XF4ZFctNXAIeH/aa/oRlK9Da5zyU0/DaNhXNcOMviykap4kOWvsa/tLV1MQh5wmXJMjS7NmbucjwpaZ8p5RsddIeazowEHfPQKzUNxSg5Rrk4yo4FkGVAODlEjza33pGpqaW8t9qZrAg4qFXKfqdSsORxgt5CiMl5Q8moU39jfNAb3e+nv9WQfB86QWkV7W/Q7Yp5VTzoD9N//RMqOW7UPtlHJA712vy/hFpSjn+xBZPYkWZaJuLxBiT/nJEM4yhR36FVBpckH8cZUb+s7eZnR/LHAVSe422swfIQzzJTBSwjwK9vZ3LaNxDLKVKl+DgYunUkw+rkSjW5GY/NLyUW8WcLD90jD4BdKXcYFCfpswUQAberFR92qcQARAUzmTKaVmbEuX6sMvUo3z6NXtw+U4uFwLfqyT9/+
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(366004)(396003)(376002)(136003)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(4001150100001)(26005)(2616005)(6512007)(38100700002)(6506007)(478600001)(66476007)(83380400001)(6486002)(2906002)(8936002)(110136005)(41300700001)(76116006)(91956017)(66556008)(66946007)(71200400001)(316002)(64756008)(66446008)(8676002)(5660300002)(38070700009)(36756003)(82960400001)(122000001)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aFRTT0NMeUgwOXB6aFlxWWJTanFkTFFQUXdreUlZR2ZyRWd5ZllxZ1JWd0F4?=
 =?utf-8?B?RjhqbmlIc2dMKzlEK0hZMDJxUUNBQTZOZC9SV25ZNzA0QzdOSVEwMWt5Qy8v?=
 =?utf-8?B?T1NTWTdDUGFhOHNBTjBSNlcxZDlyVHJ3eWtUeVhlWlZ3Zk5mOXB2UmV4cG55?=
 =?utf-8?B?eXY2dys0SUNMeDF4N0lMdUdrWEViRTVEMEhRcmZ2cVViWjhhTmgvZTQvVVMr?=
 =?utf-8?B?R2U5ckI4b0xtTXU3VGxDWHphZFFtSi9CbXlGYzlscmZlYnJFaU16YVhKdzVG?=
 =?utf-8?B?T1JQbU4veGp5T2QvdTNQeldHWXl2NDBZVXh1aEs4WFlKRitvUXFiOFpaUlcw?=
 =?utf-8?B?d0cwUUNvSzRIMEM3SzYrQ1VKaVdwTGRqZVFRTUEzMDZVSG9iUjlWZnZyMWNS?=
 =?utf-8?B?K2liWjRlR2xoaWxKK090bjBPeXVxU2FiWEw1dW5zWW05SkR6YmRJM1pqK2N4?=
 =?utf-8?B?QzhoUjlMVWpJc3BOb05tZDliekdIdG4vand1SDRKeHpYNy9hTXF3UDc5VE43?=
 =?utf-8?B?emllZlpVOFhWa1p0em5MMjJ0L2oyMUpCK3k3VmtLRDFrZ2NaVEt6b2hsbEY5?=
 =?utf-8?B?V3E3NnNDM3VOR093a3AvTVJoV2J5RGE2dkJ5OE5KbXhxQ1VCUk9VSXhTR0wx?=
 =?utf-8?B?S0ZYVm5vaS91TjY5VW1xanNnbnpjcExTTmxaNi9vWEhhWitzbzRWa3YxQnJR?=
 =?utf-8?B?L2JJTGNOeWlna3hUaDhYaEVicmJQRUlwU1d0TlB2WEVYTGJBOTBLUlZORWdH?=
 =?utf-8?B?U2xYeGtnWDZPMVAydTRmaU01T0dVaEpPOUEzZVQzTWZsZW5QYmpabnhNYUtM?=
 =?utf-8?B?QVAzYmUwNGVPZzlERlRxQ1RPU3ZEWU9tNEZ5cTlVYmJPQ0RFblVIZ1BHOVRo?=
 =?utf-8?B?SldDblpiZ0xzSzBYZWhBYmMyR0pGNEEyZ0RyZG9vS0p2eWtETU9ySCtQU1hO?=
 =?utf-8?B?eStZVEJzMXVYdlA1L0d4cGhRN2J0UDhYaCtvR2ZtdHQ2L0V5UkZGY0h5QjNt?=
 =?utf-8?B?QjJqeVVtcFgwMmtkc3Vsc2lrRlJyaU5LOXV4a0dnelQ3UUE1TFhwemNGU1o0?=
 =?utf-8?B?ekF5c2JGQm5TTmVwZk45QXFZTnRrQ05GSDVIVW5ycnQ0ekZ0cDdXS28wOGpk?=
 =?utf-8?B?SmNyK1o3Z2NoaE1Mc0Rjd1NDMElDUW1TS2FkZGZYVDV2ZGNCMEJ5elpQQmF4?=
 =?utf-8?B?dzgvWFVwU1dFY1dNeGVjUnZQQzg5d3RLeEhnU2d0VndVWVlFWVdlS1c1VE9J?=
 =?utf-8?B?T2JBVEpXU3JvMGZEUGx1NnhBV2x4MFdwM0JkNGc1TlNaMXU5NSs1cFVaUWNl?=
 =?utf-8?B?UWtSOVlBaTg1ZTQydjQxaGhMM0NsWWUyZWJGSkRPZ3piUnlTb1JUZVlDWTRr?=
 =?utf-8?B?YWtrWEVNL2lIdnVRaE5pdUR1K2JCVFpIcW5lNm9USXV2RWRTVXc3K1dMWlB0?=
 =?utf-8?B?MU8ydWVFMnRvOCtmSW4wc2FiOHY2UmlHd2RpUmVtRTh6bS9CUGlBOVVUYVE5?=
 =?utf-8?B?Q3FBNmZTN1ZTcXFhWjR1Nmx0M25ONlBhVlZ3S2NlVkV1ZFNybGg2bHBTNlZs?=
 =?utf-8?B?UWJvaVpBNFVlUEtDZVhCQytoWE9tNDJwM0JrZjVMemVIL2tGdVhKSEpzRWdi?=
 =?utf-8?B?QUFCdVhJa3o2VnhvWnY0QUZMUVJxcXpJL2NHNFBKd2dCdHBVeHkwaThOWWlQ?=
 =?utf-8?B?OFEyTENreUlwMzROVDFYdythQ3lLVU1SNzFZUnoyTmtaYXpoNCthVUhPL1RW?=
 =?utf-8?B?UVRoRUNxc1R0NFhDUytYOVBIdjl1N0dFWWdNUVJMcVl6TFNwWVVhc3FhaU5z?=
 =?utf-8?B?ZGhxbEJGaVhtVEM4ZVZsYWoveEoxNjBnaGdjSFhzckpacU9vbzlCQStvbkY1?=
 =?utf-8?B?TDZXRjVVbEs3UERnbjE1RGFvTVluWXNaQmdHUWp6TmU4bGM3bjZNMXNDMlVH?=
 =?utf-8?B?M0k3QlZNcjYrL1pyNFJqSmRteHBwaU83RkhtTXRWTDgyeWJNTUxweWVtT21j?=
 =?utf-8?B?dlIyL2thV0VpdUVrVVNxWFlLeENiaiszLzY2bGRKUEluVWRqMUtSYlFXY0gy?=
 =?utf-8?B?QXJhRVMyUVMvOUowVmp1TDA5N2ZManBJSmNhK0JHN2tKZWttRFZ4bEkwU3Ry?=
 =?utf-8?B?T3FwRzhOMUY4ZTd2eWw3OXJaZ3RQMW5aWG1YWUVpMVpoUGY4czMxZGZkSlBM?=
 =?utf-8?Q?b3q/LmNFH11ESolkv6WfHc0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3C117402993F1640B3C9B85E32057D28@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac1c0967-2b88-4baa-ff5f-08dbda59a907
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2023 21:38:02.5698 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mxqzDixl0q2bz9NujvI0zcWQRn/B8I8GjsGXEdMmOSYzvpsHjacNA9HCLX9lGDv8jMpxRTOnbQDR83o1nMzhLSV7d/oSoTVBTJt9by2E9LkxNxS5uHT4/dbTR44M9RwD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7522
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

T24gRnJpLCAyMDIzLTEwLTI3IGF0IDEwOjEzICswMzAwLCBKYW5pIE5pa3VsYSB3cm90ZToNCj4g
T24gVGh1LCAyNiBPY3QgMjAyMywgWmhhbmp1biBEb25nIDx6aGFuanVuLmRvbmdAaW50ZWwuY29t
PiB3cm90ZToNCj4gDQphbGFuOnNuaXANCj4gSSdsbCBub3RlIHRoYXQgbm9ib2R5IGNoZWNrcyBp
bnRlbF9weHBfaW5pdCgpIHJldHVybiBzdGF0dXMsIHNvIHRoaXMNCj4gc2lsZW50bHkgc2tpcHMg
UFhQLg0KPiANCj4gQlIsDQo+IEphbmkuDQoNCmFsYW46c25pcA0KPiA+ICsJaWYgKGludGVsX2d0
X2lzX3dlZGdlZChndCkpDQo+ID4gKwkJcmV0dXJuIC1FTk9ERVY7DQo+ID4gKw0KDQphbGFuOiB3
b25kZXJpbmcgaWYgd2UgY2FuIGFkZCBhIGRybV9kYmcgaW4gdGhlIGNhbGxlciBvZiBpbnRlbF9w
eHBfaW5pdCBhbmQNCnVzZSBhIHVuaXF1ZSByZXR1cm4gdmFsdWUgZm9yIHRoZSBjYXNlIG9mIGd0
X2lzX3dlZGdlZCAoZm9yIGV4YW1wbGU6IC1FTlhJTy4pLg0KQXMgd2Uga25vdyBndCBiZWluZyB3
ZWRnZWQgYXQgc3RhcnR1cCBiYXNpY2FsbHkgbWVhbnMgYWxsIGd0IHVzYWdlIGlzIGRlYWQNCmFu
ZCB0aGVyZWZvcmUgd2UgY2FudCBlbmFibGUgUFhQIChhbG9uZyB3aXRoIGV2ZXJ5dGhpbmcgZWxz
ZSB0aGF0IG5lZWRzIHN1Ym1pc3Npb24vDQpndWMvIGV0YykuIFdpdGggYSBkcm0tZGVidWcgaW4g
dGhlIGNhbGxlciB0aGF0IHByaW50cyB0aGF0IHJldHVybiB2YWx1ZSwgaXQNCmhlbHBzIHVzIHRv
IGRpZmZlcmVudGlhdGUgYmV0d2VlbiBndC1pcy13ZWRnZWQgdnMgcGxhdGZvcm0gY29uZmlnIGRv
ZXNudCBzdXBwb3J0DQpQWFAuIEhvd2V2ZXIsIHRoaXMgd291bGQgbWVhbiBuZXcgZHJtLWRlYnVn
ICdub2lzZScgZm9yIHBsYXRmb3JtcyB0aGF0IGk5MTUganVzdA0KZG9lc24ndCBzdXBwb3J0IFBY
UCBvbiBhdCBhbGwgd2hpY2ggd291bGQgYmUgb2theSBpZiBkb250IHVzZSBkcm1fd2FybiBvciBk
cm1fZXJyDQphbmQgdXNlICdzb2Z0ZXInIG1lc3NhZ2UgbGlrZSAiUFhQIHNraXBwZWQgd2l0aCAl
ZCIuDQoNClBsZWFzZSB0cmVhdCBhYm92ZSBjb21tZW50IGFzIGEgIm5pdCIgLSBpLmUuIGV4aXN0
aW5nIHBhdGNoIGlzIGdvb2QgZW5vdWdoIGZvciBtZS4uLg0KKGFmdGVyIGFkZHJlc3NpbmcgSmFu
aSdzIHJlcXVlc3QgZm9yIG1vcmUgY29tbWl0IG1lc3NhZ2UgaW5mbykuIC4uLmFsYW4NCg0KDQo=
