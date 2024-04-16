Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 135F78A65F5
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 10:21:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A871112AE3;
	Tue, 16 Apr 2024 08:21:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IdhrXGFY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2116F10F357;
 Tue, 16 Apr 2024 08:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713255687; x=1744791687;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5/FDmYA21PQCrMDZtHmx06X2ALW3lQ7xN6IIjbWXcPw=;
 b=IdhrXGFYhNVcL0Fo7gkXF9SzINNg0ZzPp0ugr8QrpQpLnmFeewKwUJmx
 qQIhBVSMNlDZoTq2JhFiuRRio/JnpiOUyqPVPHAxKGcX3hNEtbhelKRTz
 bR8DAm8+ftH19EgvYa3Sci6qkfAldUe69xfMkmZ/1xKqPx0K6YkzIQ0S6
 8wAnSQ6aL9kzdMS4lnW6IgPaEUzu7Otnc9tvw/3CT4auSDAXr8tM/gCTG
 wNDRSLeCWoDF25sYhFhxKVn3oDcdeihnxVbhmcylVS8rt1y2FplfBgFDj
 wibuAcim5Z2H0ouJcxa75ETo03Y9F0a0ibX8+z3/eejxyK7OcY5U6F+Ud g==;
X-CSE-ConnectionGUID: AnOp13coQya3TAleXzVoxg==
X-CSE-MsgGUID: qLml1PrxSn64FdXFcV5+yQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8542580"
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="8542580"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 01:21:21 -0700
X-CSE-ConnectionGUID: RoFTyd6CSHGKGfyIc2N2Uw==
X-CSE-MsgGUID: y01jDmoWSNu/EV8JEThXpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; d="scan'208";a="26972408"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Apr 2024 01:21:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 01:21:20 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Apr 2024 01:21:20 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Apr 2024 01:21:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fugvlaaALWZLwuXeiD+e/AaWKUTWXEqFVssjWFpLjImSBkad26jE/UnNI6QXidGv48PLXdgxBensQnkHzggBHLeYApmi/3CCp63mFHwEPyIEvuNTStR/Cu/uHO/8MLa+HuK7k9WrXKpzpqd1h0QTQfzxiu/0aOv/joN4O0pUe71HwJQNAQNHp5KOa/SmA5meMdg27IKWl6dkCLqZqIfh2+AOuEqK5T/1rNBuc3aEmRzBYCjhwwgO6iG4MMC250VDv8SV2brSElfDiukntooevm6hT/BZfwl9kyGnoz7qeP0gq/aU55coVABX8a9mX6j6IaYfA5ChXp/U3QjEuWagbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5/FDmYA21PQCrMDZtHmx06X2ALW3lQ7xN6IIjbWXcPw=;
 b=BDZfo3wUg4kbCZK6A4L2oKX2pzuWtJt4b/oWJS5wOmtWeZn48py5DjT5KUPLmwGfGfjjT7XzRgDI4+qMjnRZoflTbUewxkQEf+EFK8oYXmr/hF+3yvLm8gRgRP+YkB2s84coJUdO6mIJpZ4EwtCC7Qcpuqj8bRWJQwqjXOnsDhqq0DEJabrtTgQtFCktAzqCd9u5rirE9W6rya5AJaAKGv4wnCnFLJ0vFWDjwAbb+lIDC3Hb40N+WyLzf0atOYnMiSQtFC6zpbGfN6umj7q9N6VnspiMeaUvw0D1wG7EalO675Tq+L28psD/Z94yBMQVUPtnTVIkSUVlryVEWO+Pbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB5981.namprd11.prod.outlook.com (2603:10b6:510:1e0::15)
 by CO1PR11MB4964.namprd11.prod.outlook.com (2603:10b6:303:9e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.27; Tue, 16 Apr
 2024 08:21:18 +0000
Received: from PH7PR11MB5981.namprd11.prod.outlook.com
 ([fe80::8970:61a2:f00d:b23f]) by PH7PR11MB5981.namprd11.prod.outlook.com
 ([fe80::8970:61a2:f00d:b23f%4]) with mapi id 15.20.7472.025; Tue, 16 Apr 2024
 08:21:18 +0000
From: "Manna, Animesh" <animesh.manna@intel.com>
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Murthy, Arun R" <arun.r.murthy@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>
Subject: RE: [PATCH v2 6/6] drm/i915/alpm: Add debugfs for LOBF
Thread-Topic: [PATCH v2 6/6] drm/i915/alpm: Add debugfs for LOBF
Thread-Index: AQHajPO3Kk0exObOm0Wlb4MImlWYNrFpIXkAgAFpQmA=
Date: Tue, 16 Apr 2024 08:21:18 +0000
Message-ID: <PH7PR11MB598139777CC7E24677743807F9082@PH7PR11MB5981.namprd11.prod.outlook.com>
References: <20240412155243.2891996-1-animesh.manna@intel.com>
 <20240412155243.2891996-7-animesh.manna@intel.com>
 <a0e3f4acec56e84dcfca5e5a08275e9fd5862c63.camel@intel.com>
In-Reply-To: <a0e3f4acec56e84dcfca5e5a08275e9fd5862c63.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB5981:EE_|CO1PR11MB4964:EE_
x-ms-office365-filtering-correlation-id: 73e81888-385d-457a-4e0e-08dc5dee3100
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hjJmGJIKG16UT9bofNO9i2zBKcvShD5b3GoVmJaiiUKDBwqjgEsFMTWbrJ4ts2TQxHBwV6vPb1NDCuw9KTB5gBH+nE0r8/DrTb6YLceVhKCTh1GdFS5TLoG3ZvuLZ8UH4iZtjf9y1xVb4S1JR512LYu9ertBnaSkf/z7x/KhHmfVkyRnw00+Vr9RrbTHI1HamLALawPCCxdZXmMIccWDKNfNWF+6b7272kQqXJNBZ0TcxczJYW5sDUixPVL6BmE6aARqIwIRepGnzMt0DRk90TivrZsHFcp7SqFf05p8LUhG4YyA05nq17oxQ+zaljDvF7NrFp2oxTOoyGwtp3y68THkoHgNRJVpKWQkv3GroJu/O4WQxdWqgaUf1YgTaNCrR+xTfLyw0F/Mb08j1P9rt0kLCXHdtoqpNe3SYLWpi/ygl9RCOOrTo3qFkauVG8E9i/TZmYo7bySgJOJ0DOydOzcu/PcMjmy1kA/ocihO5fSFi5sArCrToYJX6u+ucljiiQUbqVfPtFBTJF5imnTX61OgQFHOT/QEki7EYqzvoL9kT64xd8BNlgZYvzld5m2MzSTtTV7DC3X2VOS7uUQ9J/ZsmtZxI3hlR29FRskWVYnJcVTf9dAKgFKRsLOOXXu/Oikp3DXbAyR58c0LzzQ4GRxj0ZBgbl2gZu2ElN6t8HY2D/tviKcHJY3FZLD4B6MUs9F9QuXpRcH9j6P2g2j42CeDsllqqm547//oRBHU5jM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB5981.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?blozVUhQS01SSUd5allzYk9zR2JPVFdiK1lmR3U3S0pLMHEySXh4MWRKWEJm?=
 =?utf-8?B?aytWWmNyZlBIMUQ3ZDBlQXgzZjh3TW5XWHpNcHRkUTY2NGtYclhlMlNMWUha?=
 =?utf-8?B?K0RBK1NxMXZxM1FzVlpmcHlqd3BISkE3WjRqdHdydld3THFWZmx5K3pHczUw?=
 =?utf-8?B?b1RDY0FDVjFQdzIwVnZISmU2RGwwL3VRMnY2cWxaSFJoS0l0aldqZFdkN2pa?=
 =?utf-8?B?RFg1OWZ2eTBIK3VuQjJubk5MNW9tY1ZSenU2OWRJZE5qQTFzaGtSaGtzeDVQ?=
 =?utf-8?B?RENDc3Vwc2E2V1J0SnpScTZBNkw1L3VrZVZITjAwenFGRU8wRk50UmN2WkRF?=
 =?utf-8?B?QU90cnBiQkpMWHJqWXdxL0RXMFEwSDJhNHB0YUVLYk13NGEyTXl4OTR4eDVU?=
 =?utf-8?B?cjN0MWJvS0lBSlVEZUxrSldscGkzcGJBSE8ya3hpUm9RbXV0Rnhya01kL3lF?=
 =?utf-8?B?QWIvekllWkFWTFBKS29FR1lnY0l0NGIzQjNIUytQOEZMYVhRaUNJb3FJdC9S?=
 =?utf-8?B?WUFkQm15dTlwR29tc1Y4MVZPOG40QVNUa3llSzdhNW9YaHBHZVdxR1h1cUZk?=
 =?utf-8?B?UkhUZW44OGhnbFgvR1loTUk2bDBJUFNYMng4dTd4akZZTkFaL0VPQVhTaDVH?=
 =?utf-8?B?aHNEeFJPcVM0blVzSmhreHI2SnUwbC83c2tKUnZQQVowSkFrMVVJaWpoYVpy?=
 =?utf-8?B?WUJZNXhmdlJ6a0pTZWJ1T2drSVhBbUFrS1RMcGQzNGJ4ZC9MVkRtblZEUEJ6?=
 =?utf-8?B?UFJnblJ1dVB1ZjFMVjF0emZIMGgyMkhIbkFRY1BaaDUvRzhNWVlSNUYvRUdN?=
 =?utf-8?B?bnZrRFIyNEM1MGUvSnQ0TW5rbndEelArRHJNUmpldWxxenFsZFU5bGVEeTNE?=
 =?utf-8?B?aUVYc245cFowbWZ4MzQxZE9YNTJiYTIrMGhueHROK3pmUVdaK2cwK0dVQk4r?=
 =?utf-8?B?V0hrVTFFYXJYZXJ2WGZyRzBMaEYrR3pEbTFhVm5CRXNTOGhFYVN5U3prcEV6?=
 =?utf-8?B?My9JN2JCR3NTMmRkT3Z5WFJielpkTlZHMi9IN0xUeUYxbkp6YWRKZGJsT294?=
 =?utf-8?B?OVpuajJpcUVKeXA0dXdSQWJ1MEdHS2pWNzJ2TDdzWUZFRTRhdTJ5V21qekI3?=
 =?utf-8?B?Q0VVNUN0bW13UGk0QWZzZG1zNnVIenhRODRVVUo0Yy91RlVtKzg1NGlpZWhq?=
 =?utf-8?B?YmhkbzFhcEJCejl0eFVKRnBQTW9saTB2QmZVUUpKVStwcGtwdytSUVVta1lr?=
 =?utf-8?B?a0M4cVRLaEtiM0x1RzBOZVRCbFNUWEVCYzZGNDJ1enpGQjBXV1drRjVCMDBq?=
 =?utf-8?B?bmRYK2F3aThyUitKb2habHNzMzF5a2p1RlZyV2QrUDU5SlJxWTQxOHViWSs4?=
 =?utf-8?B?MHYxSHNaeVdSWlRFaGhOUjFWejNpL3g3dy83ckxjMlkvVzg4K3hVZG9zc3do?=
 =?utf-8?B?eC9uNEZpRWZsNkRrMkVISUxQQkhTemVkZkJSMk5NUnl2QkRmN2ZhVW9UNkYr?=
 =?utf-8?B?N1ZQb3BLVDRJWElSTDh0ZFd5RmFLVmxxdURkMk5CTTI0VjkzT1ZIcGE1NEJB?=
 =?utf-8?B?N3hmYTVnRHVkMmZvd2V5Sld2RVFhMzJRZUt0cTN0VUNtWkM5RmxkTlV4S0F4?=
 =?utf-8?B?cHFpS3ZkZ0xNelg3RzZGT1ZFbTlZbDdPV1FUdk12UUZDeFNoVk1oa0lOM2Ex?=
 =?utf-8?B?UUl5L3V0RUdnOEZPMnJoY2RmL3VNWG5SMThiR1FqV2s0bnRBUDZBTjUxTHF4?=
 =?utf-8?B?VDRHd0l3NVh6YVNpdjBJREp5RjFWenh3ekRnTTBQRzRLbFZBbDM0THN0ZHA3?=
 =?utf-8?B?R2tSeUUrS1lHbFVUSCtiWEt2MVZKVmhCdS9pUUt5V01zMFhwMTZPc3h2dHBh?=
 =?utf-8?B?TzA1OUdCNTIyclFNNkMxL3IzdTlldGZWbkFMU2R3bnhPMU9IcU1tcDBvV2la?=
 =?utf-8?B?MEV5ZTE2ekRhL0RGQWxrSGNRLzVtMTBpQjJmeU5tQlh4WDl4dWtSZ3FYZmhY?=
 =?utf-8?B?Z3BYL21XTzBoM1l0eFRKT0lNbU5WbGZjREtlZ1phZ3A0cnVtOWxiT3dvQ2E0?=
 =?utf-8?B?SUwzUkNiY3JHUjNiZm5VNUJpUDVEbDMrSTQvYUlkZmlZL1IxZ3ZBVHNLMVB2?=
 =?utf-8?Q?0LSurbl1FktzdVfy9cfojWyHp?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5981.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73e81888-385d-457a-4e0e-08dc5dee3100
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2024 08:21:18.5118 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8SD1ZfwBqDdzPUKKx7Rtu39jhSmLFknz/+ckhAykWLyQ4e8Fl2EAQsMj+ulM3vKGYD9plzrwNsqmvtvl6kbH/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4964
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSG9nYW5kZXIsIEpvdW5p
IDxqb3VuaS5ob2dhbmRlckBpbnRlbC5jb20+DQo+IFNlbnQ6IE1vbmRheSwgQXByaWwgMTUsIDIw
MjQgMzo0NCBQTQ0KPiBUbzogTWFubmEsIEFuaW1lc2ggPGFuaW1lc2gubWFubmFAaW50ZWwuY29t
PjsgaW50ZWwtDQo+IGdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IGRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmc7IE11cnRoeSwgQXJ1biBSDQo+IDxhcnVuLnIubXVydGh5QGlu
dGVsLmNvbT47IE5pa3VsYSwgSmFuaSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPg0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIHYyIDYvNl0gZHJtL2k5MTUvYWxwbTogQWRkIGRlYnVnZnMgZm9yIExPQkYN
Cj4gDQo+IE9uIEZyaSwgMjAyNC0wNC0xMiBhdCAyMToyMiArMDUzMCwgQW5pbWVzaCBNYW5uYSB3
cm90ZToNCj4gPiBGb3IgdmFsaWRhdGlvbiBwdXJwb3NlIGFkZCBkZWJ1Z2ZzIGZvciBMT0JGLg0K
PiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQW5pbWVzaCBNYW5uYSA8YW5pbWVzaC5tYW5uYUBpbnRl
bC5jb20+DQo+ID4gLS0tDQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X2FscG0uY8KgwqDCoMKgIHwgNDcNCj4gPiArKysrKysrKysrKysrKysrKysrDQo+ID4gwqBkcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2FscG0uaMKgwqDCoMKgIHzCoCAyICsNCj4g
PiDCoC4uLi9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfZGVidWdmcy5jwqAgfMKgIDIg
Kw0KPiA+IMKgMyBmaWxlcyBjaGFuZ2VkLCA1MSBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmMNCj4gPiBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5jDQo+ID4gaW5kZXggYWU4
OTRjODUyMzNjLi4yMWRmYzA2OTUyZDcgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2FscG0uYw0KPiA+IEBAIC0zMzksMyArMzM5LDUwIEBAIHZvaWQgaW50
ZWxfYWxwbV9jb25maWd1cmUoc3RydWN0IGludGVsX2RwDQo+ID4gKmludGVsX2RwKQ0KPiA+IMKg
ew0KPiA+IMKgwqDCoMKgwqDCoMKgwqBsbmxfYWxwbV9jb25maWd1cmUoaW50ZWxfZHApOw0KPiA+
IMKgfQ0KPiA+ICsNCj4gPiArc3RhdGljIGludCBpOTE1X2VkcF9sb2JmX3N1cHBvcnRfc2hvdyhz
dHJ1Y3Qgc2VxX2ZpbGUgKm0sIHZvaWQNCj4gPiAqZGF0YSkNCj4gPiArew0KPiA+ICvCoMKgwqDC
oMKgwqDCoHN0cnVjdCBpbnRlbF9jb25uZWN0b3IgKmNvbm5lY3RvciA9IG0tPnByaXZhdGU7DQo+
ID4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IGludGVsX2RwICppbnRlbF9kcCA9IGludGVsX2F0dGFj
aGVkX2RwKGNvbm5lY3Rvcik7DQo+ID4gKw0KPiA+ICvCoMKgwqDCoMKgwqDCoHNlcV9wcmludGYo
bSwgIkxPQkYgc3VwcG9ydDogPSAlcyIsDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgc3RyX3llc19ubyhpbnRlbF9kcC0+bG9iZl9zdXBwb3J0ZWQpKTsNCj4gPiArDQo+
ID4gK8KgwqDCoMKgwqDCoMKgcmV0dXJuIDA7DQo+IA0KPiBXaGF0IHRoaXMgZGVidWdmcyBpcyB0
ZWxsaW5nPyBMb2JmIG1heSBiZSBzdXBwb3J0ZWQgYnkgcGxhdGZvcm0sIGJ1dCBub3QNCj4gZW5h
YmxlZCBiZWNhdXNlIFBTUiBpcyBlbmFibGVkLiBTYXlpbmcgTE9CRiBzdXBwb3J0ID0gbm8gaXMg
bWlzbGVhZGluZy4NCg0KSG93IGFib3V0ICJMT0JGIGVudHJ5IGNyaXRlcmlhIG1ldCA9IHllcy9u
byI/DQoNCj4gDQo+ID4gK30NCj4gPiArDQo+ID4gK0RFRklORV9TSE9XX0FUVFJJQlVURShpOTE1
X2VkcF9sb2JmX3N1cHBvcnQpOw0KPiA+ICsNCj4gPiArc3RhdGljIGludCBpOTE1X2VkcF9sb2Jm
X3N0YXR1c19zaG93KHN0cnVjdCBzZXFfZmlsZSAqbSwgdm9pZCAqZGF0YSkNCj4gPiArew0KPiA+
ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCBpbnRlbF9jb25uZWN0b3IgKmNvbm5lY3RvciA9IG0tPnBy
aXZhdGU7DQo+ID4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IGludGVsX2RwICppbnRlbF9kcCA9IGlu
dGVsX2F0dGFjaGVkX2RwKGNvbm5lY3Rvcik7DQo+ID4gK8KgwqDCoMKgwqDCoMKgY29uc3QgY2hh
ciAqc3RhdHVzOw0KPiA+ICsNCj4gPiArwqDCoMKgwqDCoMKgwqBpZiAoaW50ZWxfZHAtPmxvYmZf
ZW5hYmxlZCkNCj4gDQo+IEkgdGhpbmsgYmV0dGVyIG9wdGlvbiBpcyB0byByZWFkIGl0IGZyb20g
dGhlIHJlZ2lzdGVycy4NCg0KU3VyZSwgd2lsbCBhZGQuDQoNClJlZ2FyZHMsDQpBbmltZXNoDQoN
Cj4gDQo+IEJSLA0KPiANCj4gSm91bmkgSMO2Z2FuZGVyDQo+IA0KPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBzdGF0dXMgPSAiZW5hYmxlZCI7DQo+ID4gK8KgwqDCoMKgwqDCoMKg
ZWxzZQ0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzdGF0dXMgPSAiZGlzYWJs
ZWQiOw0KPiA+ICsNCj4gPiArwqDCoMKgwqDCoMKgwqBzZXFfcHJpbnRmKG0sICJMT0JGOiAlc1xu
Iiwgc3RhdHVzKTsNCj4gPiArDQo+ID4gK8KgwqDCoMKgwqDCoMKgcmV0dXJuIDA7DQo+ID4gK30N
Cj4gPiArDQo+ID4gK0RFRklORV9TSE9XX0FUVFJJQlVURShpOTE1X2VkcF9sb2JmX3N0YXR1cyk7
DQo+ID4gKw0KPiA+ICt2b2lkIGludGVsX2FscG1fbG9iZl9kZWJ1Z2ZzX2FkZChzdHJ1Y3QgaW50
ZWxfY29ubmVjdG9yICpjb25uZWN0b3IpIHsNCj4gPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgZHJt
X2k5MTVfcHJpdmF0ZSAqaTkxNSA9IHRvX2k5MTUoY29ubmVjdG9yLT5iYXNlLmRldik7DQo+ID4g
K8KgwqDCoMKgwqDCoMKgc3RydWN0IGRlbnRyeSAqcm9vdCA9IGNvbm5lY3Rvci0+YmFzZS5kZWJ1
Z2ZzX2VudHJ5Ow0KPiA+ICsNCj4gPiArwqDCoMKgwqDCoMKgwqBpZiAoRElTUExBWV9WRVIoaTkx
NSkgPj0gMjAgJiYNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29ubmVjdG9yLT5iYXNlLmNv
bm5lY3Rvcl90eXBlICE9DQo+IERSTV9NT0RFX0NPTk5FQ1RPUl9lRFApDQo+ID4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybjsNCj4gPiArDQo+ID4gK8KgwqDCoMKgwqDCoMKg
ZGVidWdmc19jcmVhdGVfZmlsZSgiaTkxNV9lZHBfbG9iZl9zdXBwb3J0ZWQiLCAwNDQ0LCByb290
LA0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGNvbm5lY3RvciwgJmk5MTVfZWRwX2xvYmZfc3VwcG9ydF9mb3BzKTsNCj4gPiArDQo+ID4g
K8KgwqDCoMKgwqDCoMKgZGVidWdmc19jcmVhdGVfZmlsZSgiaTkxNV9lZHBfbG9iZl9zdGF0dXMi
LCAwNDQ0LCByb290LA0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGNvbm5lY3RvciwgJmk5MTVfZWRwX2xvYmZfc3RhdHVzX2ZvcHMpOyB9
DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxw
bS5oDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2FscG0uaA0KPiA+
IGluZGV4IGMzNDFkMmMyYjdmNy4uNjZlODFlZDhiMmZiIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5oDQo+ID4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmgNCj4gPiBAQCAtMTEsNiArMTEsNyBAQA0K
PiA+IMKgc3RydWN0IGludGVsX2RwOw0KPiA+IMKgc3RydWN0IGludGVsX2NydGNfc3RhdGU7DQo+
ID4gwqBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9zdGF0ZTsNCj4gPiArc3RydWN0IGludGVsX2Nvbm5l
Y3RvcjsNCj4gPg0KPiA+IMKgYm9vbCBpbnRlbF9kcF9nZXRfYXV4X2xlc3NfYWxwbV9zdGF0dXMo
c3RydWN0IGludGVsX2RwICppbnRlbF9kcCk7DQo+ID4gwqBib29sIGludGVsX2FscG1fY29tcHV0
ZV9wYXJhbXMoc3RydWN0IGludGVsX2RwICppbnRlbF9kcCwgQEAgLTE5LDUNCj4gPiArMjAsNiBA
QCB2b2lkIGludGVsX2FscG1fY29tcHV0ZV9sb2JmX2NvbmZpZyhzdHJ1Y3QgaW50ZWxfZHANCj4g
PiAqaW50ZWxfZHAsDQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZQ0K
PiA+ICpjcnRjX3N0YXRlLA0KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGRybV9jb25uZWN0b3Jf
c3RhdGUNCj4gPiAqY29ubl9zdGF0ZSk7DQo+ID4gwqB2b2lkIGludGVsX2FscG1fY29uZmlndXJl
KHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHApOw0KPiA+ICt2b2lkIGludGVsX2FscG1fbG9iZl9k
ZWJ1Z2ZzX2FkZChzdHJ1Y3QgaW50ZWxfY29ubmVjdG9yICpjb25uZWN0b3IpOw0KPiA+DQo+ID4g
wqAjZW5kaWYNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9kaXNwbGF5X2RlYnVnZnMuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9kaXNwbGF5X2RlYnVnZnMuYw0KPiA+IGluZGV4IDBmZWZmZThkNGU0NS4uYmExNTMw
MTQ5ODM2IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfZGlzcGxheV9kZWJ1Z2ZzLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX2Rpc3BsYXlfZGVidWdmcy5jDQo+ID4gQEAgLTEzLDYgKzEzLDcgQEANCj4gPiDC
oCNpbmNsdWRlICJpOTE1X2RlYnVnZnMuaCINCj4gPiDCoCNpbmNsdWRlICJpOTE1X2lycS5oIg0K
PiA+IMKgI2luY2x1ZGUgImk5MTVfcmVnLmgiDQo+ID4gKyNpbmNsdWRlICJpbnRlbF9hbHBtLmgi
DQo+ID4gwqAjaW5jbHVkZSAiaW50ZWxfY3J0Yy5oIg0KPiA+IMKgI2luY2x1ZGUgImludGVsX2Rl
LmgiDQo+ID4gwqAjaW5jbHVkZSAiaW50ZWxfY3J0Y19zdGF0ZV9kdW1wLmgiDQo+ID4gQEAgLTE1
NDIsNiArMTU0Myw3IEBAIHZvaWQgaW50ZWxfY29ubmVjdG9yX2RlYnVnZnNfYWRkKHN0cnVjdA0K
PiA+IGludGVsX2Nvbm5lY3RvciAqY29ubmVjdG9yKQ0KPiA+IMKgwqDCoMKgwqDCoMKgwqBpbnRl
bF9kcnJzX2Nvbm5lY3Rvcl9kZWJ1Z2ZzX2FkZChjb25uZWN0b3IpOw0KPiA+IMKgwqDCoMKgwqDC
oMKgwqBpbnRlbF9wcHNfY29ubmVjdG9yX2RlYnVnZnNfYWRkKGNvbm5lY3Rvcik7DQo+ID4gwqDC
oMKgwqDCoMKgwqDCoGludGVsX3Bzcl9jb25uZWN0b3JfZGVidWdmc19hZGQoY29ubmVjdG9yKTsN
Cj4gPiArwqDCoMKgwqDCoMKgwqBpbnRlbF9hbHBtX2xvYmZfZGVidWdmc19hZGQoY29ubmVjdG9y
KTsNCj4gPg0KPiA+IMKgwqDCoMKgwqDCoMKgwqBpZiAoY29ubmVjdG9yX3R5cGUgPT0gRFJNX01P
REVfQ09OTkVDVE9SX0Rpc3BsYXlQb3J0IHx8DQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBj
b25uZWN0b3JfdHlwZSA9PSBEUk1fTU9ERV9DT05ORUNUT1JfSERNSUEgfHwNCg0K
