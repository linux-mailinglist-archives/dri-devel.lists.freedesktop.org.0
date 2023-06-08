Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C27728705
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 20:16:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F020010E108;
	Thu,  8 Jun 2023 18:16:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24D6210E02A;
 Thu,  8 Jun 2023 18:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686248205; x=1717784205;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=N+Tb8GpDoNr7nLp28RSjQ99iZion5tIvz/Tk+bl+HPY=;
 b=SCK1OX+clxKFDRpwPFBDbf1SeA1EKZo5MfatgcI1lQYKLFmuDKF2PXpx
 o0oa06CPl2hVu2KtXp6QhBFMHs2rZHw+Gir8v2bFY5vLqZ7yI79bSZdyW
 /seZjwvY+WHn3X4fwx7Ck6sLdXu2Yhqn7Ww5F8O4wsf82h8sP4fqHA5FR
 YUXAXnBl2sim81uHzqgtNDgeKdcr4L+CFe9eoDTXLjYmv6LHUB/0BtxyD
 Dj8b2rkAvxnqlKk8ZNOi99kfr87+c/nqhrFmy7mwjFJ96dn/kr2UbNxLA
 QHjUBR4357KQpkppgzxEnQ3bziSzB9IOZ6Q578xT3lrrMq3htJAqI7FfG Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="420978184"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; d="scan'208";a="420978184"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 11:14:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="799917868"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; d="scan'208";a="799917868"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Jun 2023 11:14:20 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 8 Jun 2023 11:14:19 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 8 Jun 2023 11:14:19 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 8 Jun 2023 11:14:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fjo6OMmpPfTwr/0AF06hrSXVcM5SOD5bFLTlOm/E95e/OlsKLUOa6TygOSedYVaGmes7buJ/OD6HigROz+7MI3Eo6v8rujM25AO+Bqscz+LYAOBZM7sTLitx/c56BWI919AjjkEGlsu/UMEmTa+Qmhm3zKfiawGFG63dmNmQTZhMNT+4Kl8hmzUkC7s3kxHlp9hIsqTqEyvc8b9yC6jN4zXOuovQKOSk6zchw9E+rd5GG46aZ2shTCy9/YE6UUWAc+T7dL4LgQSHFDJ0C2MLOMh3ACZaIyjc5o73eyJ4BOH+pMf8/QWv/C6pspMF/DH4qHRaVXABr2Q/pXxmBZgaZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N+Tb8GpDoNr7nLp28RSjQ99iZion5tIvz/Tk+bl+HPY=;
 b=Wor5qT/n09l5Qd8UbHXMg1ehmy2rrUbL5yJ3lvdqP1Q3aTwcur1if04ZEatR1lPIglzFrb0Z9BFT6v+qofGgvDoAdBSxlCD4BT+1SnDLQc+j+nslZSK8kHyUpAYCYGUJtU3e3CuGxdz3RPwZPmmM8+yij+nYY/2OsLtVZRyK3mbtkBHtU/mKB75ZNsKrwX+YmLR3iCZpjpB8DsrJNmmwojL6Lr0GcM1ySZH7uba7ISz6NfcD4IWiPa+c8iWz9oBagXwUcwVV22/NkLA6IOea5H65wz/ed1XKeXAfHIwoRMz70I4b/T80FdKi85GGAjyZnwVfuAqWJVNIWAnYKSDlfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN6PR11MB2622.namprd11.prod.outlook.com (2603:10b6:805:57::31)
 by SA0PR11MB4558.namprd11.prod.outlook.com (2603:10b6:806:9e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Thu, 8 Jun
 2023 18:14:18 +0000
Received: from SN6PR11MB2622.namprd11.prod.outlook.com
 ([fe80::91eb:a6da:c4ea:2571]) by SN6PR11MB2622.namprd11.prod.outlook.com
 ([fe80::91eb:a6da:c4ea:2571%4]) with mapi id 15.20.6455.037; Thu, 8 Jun 2023
 18:14:18 +0000
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [v2] drm/i915/selftest/gsc: Ensure GSC Proxy init completes
 before selftests
Thread-Topic: [v2] drm/i915/selftest/gsc: Ensure GSC Proxy init completes
 before selftests
Thread-Index: AQHZmjUKPXURPqso+UqcPFZh/Emo2w==
Date: Thu, 8 Jun 2023 18:14:18 +0000
Message-ID: <SN6PR11MB26223D9B57C1103BFD0B32BD8F50A@SN6PR11MB2622.namprd11.prod.outlook.com>
References: <20230530170104.2192126-1-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20230530170104.2192126-1-alan.previn.teres.alexis@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR11MB2622:EE_|SA0PR11MB4558:EE_
x-ms-office365-filtering-correlation-id: 15bdc9e3-bb2f-42cd-9902-08db684c2cfc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 03rtQ54+v4uYSBjrFCfhrE3w71+rYP03sKhceI4Kyr8anoAw6mL0rngxiz0J+cwyXA6uBlMzZXG1ieg1RM26R3Z7DpbcWKXga7B01142OAiQUqjK/V3Nw9sCXVpkayslGFcx4YwB1RGkYsScRITnUpIOUpzosjp03Y4jcBEIAyVCLBnOXwrW9oDwFWBn2i3C/+YWOVl/HItB6L5kxH62wMYgBTLR0Czi1hBE/2vRT967WxZ3heOP9UZtoSJlI+w65jl4uBhMTjZi9whzBhwEWWhRkwYqo+A8iZt2RVNZPv+5tu6k1svCayMCC/zrgYI2f5RxwAar49d+IYucT8OJxd1CW/VI4rdcOMklhQj3HJpLbTq1Ur7VoayCtHkyPFPR0yHHPAVF3x6p0vJHkJs8HfkT63mfNbMmieQX+iWVU7jrY/71T7/wbLRkEclfjNxETU8AvoYrJ8L4e83cl7/uULRBSht69FWjMr0butFTiN8qftsFiNFepDIEiEas62+jU0HvTQdTFlC1bmhM/JcwSqAHsdos+iYAMDpVMziLskLj/kAH/tPpIYz3Nud4JKICETAp6ze5zxWTgXMhVCsX/3aDAIuAQbnUfMWPyzWY13fcCWF12/3vWxeg1Vw5puhwNa4W7289lLGmyzo3W9D74XsH6nFLI22k8pKJoDPcpp4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2622.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(39860400002)(136003)(346002)(376002)(366004)(451199021)(41300700001)(71200400001)(450100002)(5660300002)(52536014)(8676002)(8936002)(110136005)(66446008)(64756008)(66476007)(4326008)(66556008)(66946007)(76116006)(316002)(478600001)(2906002)(33656002)(38100700002)(55016003)(7696005)(6506007)(53546011)(9686003)(26005)(186003)(83380400001)(38070700005)(122000001)(86362001)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a2pYR2cxNVRBcEVMNkxwUDVGRzl4bk9KSGF2amppU1hhM1BWY1ozT2NoQ1Mw?=
 =?utf-8?B?b2hNSHhTaWNiZ2VHN053d0xXK29xTTZrNUFsVGxYWGlGZHBpQjVGc0Fyejl2?=
 =?utf-8?B?djhQQk03RkVYeFQxMTFxdXl4dDdpS09JbU5OR2ZyUHg4UHV1dERXMjJPcVNJ?=
 =?utf-8?B?b0UwR3N0MzF3QlBWRjl2dm9RWGxXVW5FUG9TRStzSXA4NytrQ0JFTzBjSmZK?=
 =?utf-8?B?L09MUkpmcndyTTFZRitsMjc5ZWpnMmdMTEJsQ3JPNWtsYlVFdkx6cGdlSHFK?=
 =?utf-8?B?REROQ1RQQjRCZzBqZ3l5R3h3bzU3dnM3dzZXUEs0V2ZRdHIrUUxRL2dHbGRV?=
 =?utf-8?B?R2JxQ0RkcFhUUXBVZHdBUElMUTFZQkpjTlpDS1pPQmdCNEZFaXhibzQ4dWlm?=
 =?utf-8?B?L0RjRHJEbFE1Z3liM3YwR1daZVJ2eGFPUWFtTzZEK1F2TGVmcjhUYjZTbkV3?=
 =?utf-8?B?emMwZkxiaDJ3d1I3b1RoZXBhZVZHc0hoNEhoYWk3OHQ0dnIwNC9mTTUzVS9B?=
 =?utf-8?B?WXUzTWtGVHM4K0RGWk11ditzU2xndlZaMXU1dWljQnNWdWx6T3Q2WGJMTFJR?=
 =?utf-8?B?QkJJa2JaMVBqSHZZRXRUenRnWEhLOEdEZzFzVjI5SjlrS211Yy9DMEh5Nkhi?=
 =?utf-8?B?TGx2Q21pNnJpbEpwZEVCZjZlOFJYRTFQWnB4Z1daL3Roc2lkVlN6c0o3bDly?=
 =?utf-8?B?dWR0NnY2Z3FyaTVKdmxhQWRRVjJhZU0xdDhZd3ZJVW8rZ3V5YlNBbEQxYWE1?=
 =?utf-8?B?bFhBNDcweDhkQzZQdjZmUzhoZUhvUGJMVWZsTTlDOGlJUE94UTc1Q2Fjc1lI?=
 =?utf-8?B?TFpKcFYrRlJscVlURUZqcHpNTnRRSTZFUzNZd1g2dHlEb3lQMVVJbW5OOFAw?=
 =?utf-8?B?Tk1LdVRVbjM0cloyMVBMM2ZDZ0YrU1dWaFVRaitVYzFOSERKV1o0a2VUYVp5?=
 =?utf-8?B?L3o0QTNBVTJsNkFzTS83TitpNzFIZkJuZWRRay91ZnV1UTV2MnBHNjdDVTg4?=
 =?utf-8?B?ZnJxOTVnZlBRb1o0NTBNNWttTWpiL1N5b1RXWFVEMWtDS21taWVvbWkvaldF?=
 =?utf-8?B?bXNUcFBGaldmWmNkcW8xT1NjdXdEWE9FVjNubVRnM2x2NVh4L1R6MnFCMFJq?=
 =?utf-8?B?dWVvdG9xWHBrN2djZXB6ek9MQnpKUHdnTENzVXFqL1phV1pZWDdIM1pMR2ZZ?=
 =?utf-8?B?QTRtNTliQyt3QmpKSFFRcHQ0ekZ6TEFVT25sMDYwTTZuRzNOSXZEQlVxOVlt?=
 =?utf-8?B?UWpxK1hubVQwd0RJMUNrMmZ1R1lDVG5lb01QMDBQQnh4bVYyZzBTS0lzVjlq?=
 =?utf-8?B?WHBEU1NOUmsxRE1SL1lxMUNXNmJCMFZ2Um9WTUJxOTdybWRCb0xJbDRzQXp6?=
 =?utf-8?B?dkp4V1YrQkZkWExVbGtBOUdPSEVJR0hXb2JvTWVqRmdRbzZiRDh1a1ZyZ21u?=
 =?utf-8?B?MEJRQ0hEZVVLZ1phcGovSnd1Zkw4ekU3dFRGZGFINm9Fazk0bHdMcnR1aCth?=
 =?utf-8?B?VzlkaHNpdTArbFVjQkFIY2Z3Y3lzd1R5QjlGN1lsLy84Nm41bmtWK210eFhK?=
 =?utf-8?B?MDhPSWlUUVhCQVNlRHA5dE5PRDdXakRTNzh3VkNlUWlVQm1SNkJPR1ZtOVVB?=
 =?utf-8?B?NWphSzdSQ3QxdTQ5UVE5MU4zV1JYa0EybXJpRGIyTWdGRUVKWW9xeFZoZncy?=
 =?utf-8?B?ZThqSWZJbHdoR0U5YjF1RFRCNXlRSTZUNEw0M3JCUWVrY2R2VzYwWnJyWFd6?=
 =?utf-8?B?N0lHeDREWTFVYjE3em1qT0JOdmFqbnF1NGgvaSs4RTdidHNHMHJUV0lCS0Jy?=
 =?utf-8?B?ZlY4bi9vODFhUUdJaktBRkJWVjk0Kzlub1BPdzlZaVd6dklENmdOYm5JNm4x?=
 =?utf-8?B?YUNXSmkzczdyT3JuTTBsUzdOeExXV3d4M3hUZEFRRjhaWUwrWkhnNTFUWkZG?=
 =?utf-8?B?SEdudkRKTHg0c2tTK2dwSmFRRVdjczdMNFVHRlFkSzF3YnBkVGtCRm5ERXRr?=
 =?utf-8?B?eDREbTk4R1dyVXhOK2huK081bHlZYzhiVmVSdnF4NmNML1FDY256dEdWVWsr?=
 =?utf-8?B?djQrSE9waEVpRXNyQzJaQlhpd0tuYml1RXhVdmNJSEszTUdqaDJudDQ5elFJ?=
 =?utf-8?Q?P2wV6Zw7gsZwxmUh/Y0xNnXip?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2622.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15bdc9e3-bb2f-42cd-9902-08db684c2cfc
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2023 18:14:18.4281 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vrs4ygSagzZDodPpk0gv+RT97c5gRPT4LBGs6pnAUxEIzY9LCHwdV9OB3XMIyG3fsCRTlsXWsBlxXLXAeQ5+TA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4558
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

U2VlIG15IGNvbW1lbnRzIGJlbG93Lg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
IEZyb206IEFsYW4gUHJldmluIDxhbGFuLnByZXZpbi50ZXJlcy5hbGV4aXNAaW50ZWwuY29tPg0K
PiBTZW50OiBNYXkgMzAsIDIwMjMgMTowMSBQTQ0KPiBUbzogaW50ZWwtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZw0KPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgQWxhbiBQ
cmV2aW4NCj4gPGFsYW4ucHJldmluLnRlcmVzLmFsZXhpc0BpbnRlbC5jb20+DQo+IFN1YmplY3Q6
IFt2Ml0gZHJtL2k5MTUvc2VsZnRlc3QvZ3NjOiBFbnN1cmUgR1NDIFByb3h5IGluaXQgY29tcGxl
dGVzIGJlZm9yZQ0KPiBzZWxmdGVzdHMNCj4gDQo+IE9uIE1UTCwgaWYgdGhlIEdTQyBQcm94eSBp
bml0IGZsb3dzIGhhdmVuJ3QgY29tcGxldGVkLCBzdWJtaXNzaW9ucyB0byB0aGUNCj4gR1NDIGVu
Z2luZSB3aWxsIGZhaWwuIFRob3NlIGluaXQgZmxvd3MgYXJlIGRlcGVuZGVudCBvbiB0aGUgbWVp
J3MNCj4gZ3NjX3Byb3h5IGNvbXBvbmVudCB0aGF0IGlzIGxvYWRlZCBpbiBwYXJhbGxlbCB3aXRo
IGk5MTUgYW5kIGENCj4gd29ya2VyIHRoYXQgY291bGQgcG90ZW50aWFsbHkgc3RhcnQgYWZ0ZXIg
aTkxNSBkcml2ZXIgaW5pdCBpcyBkb25lLg0KPiANCj4gVGhhdCBzYWlkLCBhbGwgc3Vic3l0ZW1z
IHRoYXQgYWNjZXNzIHRoZSBHU0MgZW5naW5lIHRvZGF5IGRvZXMgY2hlY2sNCj4gZm9yIHN1Y2gg
aW5pdCBmbG93IGNvbXBsZXRpb24gYmVmb3JlIHVzaW5nIHRoZSBHU0MgZW5naW5lLiBIb3dldmVy
LA0KPiBzZWxmdGVzdHMgY3VycmVudGx5IGRvbid0IHdhaXQgb24gYW55dGhpbmcgYmVmb3JlIHN0
YXJ0aW5nLg0KPiANCj4gVG8gZml4IHRoaXMsIGFkZCBhIHdhaXRlciBmdW5jdGlvbiBhdCB0aGUg
c3RhcnQgb2YgX19ydW5fc2VsZnRlc3RzDQo+IHRoYXQgd2FpdHMgZm9yIGdzYy1wcm94eSBpbml0
IGZsb3dzIHRvIGNvbXBsZXRlLiBXaGlsZSBpbXBsZW1lbnRpbmcgdGhpcywNCj4gdXNlIGFuIHRh
YmxlIG9mIGZ1bmN0aW9uIHBvaW50ZXJzIHNvIGl0cyBzY2FsYWJsZSB0byBhZGQgYWRkaXRpb25h
bA0KPiB3YWl0ZXIgZnVuY3Rpb25zIGZvciBmdXR1cmUgc3VjaCAid2FpdCBvbiBkZXBlbmRlbmN5
IiBjYXNlcyB0aGF0Lg0KPiANCj4gRGlmZmVyZW5jZSBmcm9tIHByaW9yIHZlcnNpb25zOg0KPiAg
ICB2MTogQmFzZWQgb24gaW50ZXJuYWwgdGVzdGluZywgaW5jcmVhc2UgdGhlIHRpbWVvdXQgZm9y
IGdzYy1wcm94eQ0KPiAgICAgICAgc3BlY2lmaWMgY2FzZSB0byA4IHNlY29uZHMuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBBbGFuIFByZXZpbiA8YWxhbi5wcmV2aW4udGVyZXMuYWxleGlzQGludGVs
LmNvbT4NCj4gLS0tDQo+ICAuLi4vZ3B1L2RybS9pOTE1L3NlbGZ0ZXN0cy9pOTE1X3NlbGZ0ZXN0
LmMgICAgfCA2MSArKysrKysrKysrKysrKysrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgNjEgaW5z
ZXJ0aW9ucygrKQ0KPiANCj4gDQo+IGJhc2UtY29tbWl0OiAwYWU0ZWUyYzczNTk3OTAzMGEwMjE5
MjE4MDgxZWVlNjYxNjA2OTIxDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvc2VsZnRlc3RzL2k5MTVfc2VsZnRlc3QuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L3Nl
bGZ0ZXN0cy9pOTE1X3NlbGZ0ZXN0LmMNCj4gaW5kZXggMzlkYTBmYjBkNmQyLi43NzE2OGE3YTdl
M2YgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L3NlbGZ0ZXN0cy9pOTE1X3Nl
bGZ0ZXN0LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvc2VsZnRlc3RzL2k5MTVfc2Vs
ZnRlc3QuYw0KPiBAQCAtMjQsNiArMjQsOCBAQA0KPiAgI2luY2x1ZGUgPGxpbnV4L3JhbmRvbS5o
Pg0KPiANCj4gICNpbmNsdWRlICJndC9pbnRlbF9ndF9wbS5oIg0KPiArI2luY2x1ZGUgImd0L3Vj
L2ludGVsX2dzY19mdy5oIg0KPiArDQo+ICAjaW5jbHVkZSAiaTkxNV9kcml2ZXIuaCINCj4gICNp
bmNsdWRlICJpOTE1X2Rydi5oIg0KPiAgI2luY2x1ZGUgImk5MTVfc2VsZnRlc3QuaCINCj4gQEAg
LTEyNyw2ICsxMjksNjMgQEAgc3RhdGljIHZvaWQgc2V0X2RlZmF1bHRfdGVzdF9hbGwoc3RydWN0
IHNlbGZ0ZXN0ICpzdCwNCj4gdW5zaWduZWQgaW50IGNvdW50KQ0KPiAgCQlzdFtpXS5lbmFibGVk
ID0gdHJ1ZTsNCj4gIH0NCj4gDQo+ICtzdGF0aWMgaW50DQo+ICtfX3dhaXRfZ3NjX3Byb3h5X2Nv
bXBsZXRlZChzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqaTkxNSwNCj4gKwkJCSAgIHVuc2lnbmVk
IGxvbmcgdGltZW91dF9tcykNCj4gK3sNCj4gKwlib29sIG5lZWRfdG9fd2FpdCA9IChJU19FTkFC
TEVEKENPTkZJR19JTlRFTF9NRUlfR1NDX1BST1hZKQ0KPiAmJg0KPiArCQkJICAgICBpOTE1LT5t
ZWRpYV9ndCAmJg0KPiArCQkJICAgICBIQVNfRU5HSU5FKGk5MTUtPm1lZGlhX2d0LCBHU0MwKSAm
Jg0KPiArCQkJICAgICBpbnRlbF91Y19md19pc19sb2FkYWJsZSgmaTkxNS0+bWVkaWFfZ3QtDQo+
ID51Yy5nc2MuZncpKTsNCj4gKw0KPiArCS8qDQo+ICsJICogRm9yIGdzYyBwcm94eSBjb21wb25l
bnQgbG9hZGluZyArIGluaXQsIHdlIG5lZWQgYSBtdWNoIGxvbmdlcg0KPiB0aW1lb3V0DQo+ICsJ
ICogdGhhbiB3aGF0IENJIHNlbGZ0ZXN0IGluZnJhc3RydWN1dHJlIGN1cnJlbnRseSB1c2VzLiBU
aGlzIGxvbmdlciB3YWl0DQo+ICsJICogcGVyaW9kIGRlcGVuZHMgb24gdGhlIGtlcm5lbCBjb25m
aWcgYW5kIGNvbXBvbmVudCBkcml2ZXIgbG9hZA0KPiBvcmRlcmluZw0KPiArCSAqLw0KPiArCWlm
ICh0aW1lb3V0X21zIDwgODAwMCkNCj4gKwkJdGltZW91dF9tcyA9IDgwMDA7DQoNCg0KTGd0bSwg
anVzdCBhbiBjb25jZXJuIGFib3V0IHRoZSBmaXhlZCBudW1iZXIgaGVyZSwgc2hhbGwgd2Ugc2V0
IHRoZSBtaW5pbWFsIGhlcmUsIG9yIGxldCBpOTE1X3NlbGZ0ZXN0LnRpbWVvdXRfbXMgdGFrZSBj
b250cm9sPyBUaHVzIG5vIGxvbmdlciBuZWVkIGNvZGluZyBjaGFuZ2UgaGVyZSBpbiB0aGUgZnV0
dXJlLg0KDQpSZXZpZXdlZC1ieTogWmhhbmp1biBEb25nIDx6aGFuanVuLmRvbmdAaW50ZWwuY29t
Pg0KPiArDQo+ICsJaWYgKG5lZWRfdG9fd2FpdCAmJg0KPiArCSAgICAod2FpdF9mb3IoaW50ZWxf
Z3NjX3VjX2Z3X3Byb3h5X2luaXRfZG9uZSgmaTkxNS0+bWVkaWFfZ3QtDQo+ID51Yy5nc2MpLA0K
PiArCSAgICB0aW1lb3V0X21zKSkpDQo+ICsJCXJldHVybiAtRVRJTUU7DQo+ICsNCj4gKwlyZXR1
cm4gMDsNCj4gK30NCj4gKw0KPiArc3RydWN0IF9fc3RhcnR1cF93YWl0ZXIgew0KPiArCWNvbnN0
IGNoYXIgKm5hbWU7DQo+ICsJaW50ICgqd2FpdF90b19jb21wbGV0ZWQpKHN0cnVjdCBkcm1faTkx
NV9wcml2YXRlICppOTE1LCB1bnNpZ25lZA0KPiBsb25nIHRpbWVvdXRfbXMpOw0KPiArfTsNCj4g
Kw0KPiArc3RhdGljIHN0cnVjdCBfX3N0YXJ0dXBfd2FpdGVyIGFsbF9zdGFydHVwX3dhaXRlcnNb
XSA9IHsgXA0KPiArCXsiZ3NjX3Byb3h5IiwgX193YWl0X2dzY19wcm94eV9jb21wbGV0ZWR9IFwN
Cj4gKwl9Ow0KPiArDQo+ICtzdGF0aWMgaW50IF9fd2FpdF9vbl9hbGxfc3lzdGVtX2RlcGVuZGVu
Y2llcyhzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZQ0KPiAqaTkxNSkNCj4gK3sNCj4gKwlzdHJ1Y3Qg
X19zdGFydHVwX3dhaXRlciAqd2FpdGVyID0gYWxsX3N0YXJ0dXBfd2FpdGVyczsNCj4gKwlpbnQg
Y291bnQgPSBBUlJBWV9TSVpFKGFsbF9zdGFydHVwX3dhaXRlcnMpOw0KPiArCWludCByZXQ7DQo+
ICsNCj4gKwlpZiAoIXdhaXRlciB8fCAhY291bnQgfHwgIWk5MTUpDQo+ICsJCXJldHVybiAwOw0K
PiArDQo+ICsJZm9yICg7IGNvdW50LS07IHdhaXRlcisrKSB7DQo+ICsJCWlmICghd2FpdGVyLT53
YWl0X3RvX2NvbXBsZXRlZCkNCj4gKwkJCWNvbnRpbnVlOw0KPiArCQlyZXQgPSB3YWl0ZXItPndh
aXRfdG9fY29tcGxldGVkKGk5MTUsDQo+IGk5MTVfc2VsZnRlc3QudGltZW91dF9tcyk7DQo+ICsJ
CWlmIChyZXQpIHsNCj4gKwkJCXByX2luZm8oRFJJVkVSX05BTUUgIjogUHJlLXNlbGZ0ZXN0IHdh
aXRlciAlcyBmYWlsZWQNCj4gd2l0aCAlZFxuIiwNCj4gKwkJCQl3YWl0ZXItPm5hbWUsIHJldCk7
DQo+ICsJCQlyZXR1cm4gcmV0Ow0KPiArCQl9DQo+ICsJfQ0KPiArDQo+ICsJcmV0dXJuIDA7DQo+
ICt9DQo+ICsNCj4gIHN0YXRpYyBpbnQgX19ydW5fc2VsZnRlc3RzKGNvbnN0IGNoYXIgKm5hbWUs
DQo+ICAJCQkgICBzdHJ1Y3Qgc2VsZnRlc3QgKnN0LA0KPiAgCQkJICAgdW5zaWduZWQgaW50IGNv
dW50LA0KPiBAQCAtMTM0LDYgKzE5Myw4IEBAIHN0YXRpYyBpbnQgX19ydW5fc2VsZnRlc3RzKGNv
bnN0IGNoYXIgKm5hbWUsDQo+ICB7DQo+ICAJaW50IGVyciA9IDA7DQo+IA0KPiArCV9fd2FpdF9v
bl9hbGxfc3lzdGVtX2RlcGVuZGVuY2llcyhkYXRhKTsNCj4gKw0KPiAgCXdoaWxlICghaTkxNV9z
ZWxmdGVzdC5yYW5kb21fc2VlZCkNCj4gIAkJaTkxNV9zZWxmdGVzdC5yYW5kb21fc2VlZCA9IGdl
dF9yYW5kb21fdTMyKCk7DQo+IA0K
