Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 752BA7A2545
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 20:02:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCFC510E666;
	Fri, 15 Sep 2023 18:02:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FAFF10E660;
 Fri, 15 Sep 2023 18:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694800934; x=1726336934;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=dmsOXJhzA65l6AvK/mkHB6SbwLsN5McEYaJ4Fsrwmug=;
 b=BwYv+8Aw8hoF13sJDINPKIRdkA7hZnn1+dITCCRVj8TxHonCURp+nAoB
 KBeOT6kfL0qMWFWoSOzkr8p0fxClhdPv7GNAYONs0BtYqgBtlWtlOJSiM
 u8CUeKRlGAyUAz/6ZYDutKs/KWwWLhVN1ENz434YE/ZfBFeMraXQIP+yc
 qu2Iqvp3G0Xd2hK6NdVT7qV531a7WgPshDXjZwPdB3/O2+EBRzQwalTpP
 /HSt2DfN+jVlTsSRJqFHtWD+9AFMvGuYbndInblz6Sy8MJOx52av1g4Tz
 ctalPNzffJ7yhs7HUbzO5NH0Iswh+oQ2Drd4mb/tUU5OLnRIrXhXz4bXk Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="376643415"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="376643415"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 11:02:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="774395397"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="774395397"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Sep 2023 11:02:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 15 Sep 2023 11:02:10 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 15 Sep 2023 11:02:10 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 15 Sep 2023 11:02:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D5zsl0cvKEL/tIIBVl3ukq/qNN8HavFkL4YHsfblWi++0tPTILVqioO0KdBaahwKpmY9WqHVb3c31JkDDB+fjzhKo642jINtcIDTjUKH5wpD8h57dTZ9z5MpJMd2fb4usZ1LcFydHXYgdwjo0wUGpbWCvjOLK+l2kTW5ctsYgoUVgdRhNG+mtdC7Q5JTPLgVXemWLo8/kdqMqixIhZmqD1O5U7OnH+bfdFLj+ygCLSOBj8K0Qg+gFph7uqUL3MQkq0XGYmeYt1vjxn8UBuiM1rx4Hr2XSFbL2ZCxLLRzkVmPNbiGMNmTgCvy8ybyfyqZW1r4fA/pZ5yWRvy5y2qHwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dmsOXJhzA65l6AvK/mkHB6SbwLsN5McEYaJ4Fsrwmug=;
 b=OE3Q+9nSHFLZR+tWogUBz3zV75FeFjOE2/qgmFJfWymYVyA79W7rUvXayeiDt3cN0FIHowKqzB2Lt4YDDp1HDKDJtMGgR6g63as9le2sufM6R+RFP/Vf2lV4RqQ18mznmDwrjs+9+aI4F317KdYUh/c39KBGBKp3ocp6Loc8Ntt4xg8qvKcJvqTfUXR0r0lYDSRtY6fBwUPUaZLuTl9B/NLuNzx6bHiw6cKjhB4Fu24zLOc7Qyx8Zhp8jPV8xe71pWiwds/mJV1m5S+MQnUzuJM0TzMmwL10VGFyTd7XstkSsOo8ZF8I1CjliyD0Wn4KHCija/YijYAvHlItTkp8IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 CH0PR11MB5393.namprd11.prod.outlook.com (2603:10b6:610:b8::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.21; Fri, 15 Sep 2023 18:02:07 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531%3]) with mapi id 15.20.6792.021; Fri, 15 Sep 2023
 18:02:07 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v5 2/3] drm/i915/pxp/mtl: Update pxp-firmware packet size
Thread-Topic: [PATCH v5 2/3] drm/i915/pxp/mtl: Update pxp-firmware packet size
Thread-Index: AQHZ425s3iBiBJrFw0ufvaUcfhHV1bAcNpuA
Date: Fri, 15 Sep 2023 18:02:07 +0000
Message-ID: <1f78f5f54b2289c6398d1b5d3135f46894b0fe48.camel@intel.com>
References: <20230909223848.427849-1-alan.previn.teres.alexis@intel.com>
 <20230909223848.427849-3-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20230909223848.427849-3-alan.previn.teres.alexis@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|CH0PR11MB5393:EE_
x-ms-office365-filtering-correlation-id: 143e050f-ad47-449c-fc96-08dbb615e007
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JDfzi2kG2wI4GbAoCsk/VTovjL/3v/avjI6KEKAKVq96VY6EUraM9GQT9mpK9Kiz1H9ANZUAFMiip+kUSZJNJlorT+wbiEKe5EY93ZuuKmQ8/Q2DZZRFTR39lFcm6jLDPwD/ezlL++wTRTx4CXy4mOGBB4KuTqkVj9/X43Mu+c0CFCz96jJT943+6PXXZ3/8QsbVHAcXx4Xki1dFjiKSDmxV+p3Isng9n2x9abxACzIPqOMAxtfTpnVmHn3cQn2fZ94utMJ/fqZWwthQNyOBfbxnfpf2sX4NCj0ZyRxbbykAJes6hmaMxYY8kWy8pKu56HBEG8sMXqgCaA0AZt04krQFb/mQJJApSkoPD/EHM+z6afqJKb5r4YW/fHhD7CI1xnMosyD/RdoU6YlVHgcGvnVcLaha2N5tIxNqZ12VJfQCIou1wNfMiA9ppqyY7wQ9jt5jR3D4G2TTpJWvwpFjKL4SSamMRw970tZvk+Nic1eTqlIbjU3EmnLSyLcItS/m69NWzBKVl6a5JFzG/P+5YiZrgB+Xk2rbzbxsT5z8o8mzDw3GPFe/fqObeuTSU+UWjbnOudTF+P+T4R/KiptLkYcZRaVwamoCEra/xcoi/UA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(396003)(346002)(376002)(39860400002)(186009)(1800799009)(451199024)(2906002)(6512007)(86362001)(966005)(107886003)(2616005)(26005)(478600001)(36756003)(71200400001)(6486002)(6506007)(82960400001)(38070700005)(38100700002)(83380400001)(122000001)(450100002)(8676002)(4326008)(8936002)(41300700001)(66476007)(66556008)(54906003)(64756008)(66946007)(66446008)(91956017)(15650500001)(76116006)(5660300002)(316002)(6916009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Vng5QW9GSTNiZjRVcjN2QXRSNlhaZDRWZi9CdFVxc2hrSDJzcHA4YnVvQ1Fu?=
 =?utf-8?B?MTFIOW5EZlZmSUJVTnduSlBDeHA4Z2RFZlFwNjVQcnh1MmtpS205enNvK2pR?=
 =?utf-8?B?N01ZdVRUZXdZMUVvZkxXTGdLT240aFhxYmJOOFJZcnBqMmhwTTQ3ZjZyVU5J?=
 =?utf-8?B?UVVtaW5obndFNmJGL0Z6eGx5c1NvMEtxNnN6R3daRDRCanlBLzB1VG5DY1VF?=
 =?utf-8?B?Z09OeDJhek1MZW9LNHM4aWJuRnkvOGJDdEVjNzFBSU1CR2V6T2ZjcXVZaUFX?=
 =?utf-8?B?Q3BldjhnazNNWHJQNGUyOFR5SitzdW9qYTcwVk5FaHJ0aGhvbkltbW5PR2tT?=
 =?utf-8?B?YjkvNWxpUmZsVG1HWGxrcS9GN1YxTVl0WHVvSXYweWc1eHk3MUpPQnYzZHZ2?=
 =?utf-8?B?V2VQeXdpdE11cUpMNDEvWmt5bTlmTkJnMDJIT1R0a3R5aUVObDdZdFI4SDVQ?=
 =?utf-8?B?KzFpTTR0VnNkM2hMUFRwd0dVU01PbElzaFhKY3dxcFZYd2E5alhHSThEdTRC?=
 =?utf-8?B?YVJCNmRSYk5xVjU1UDg3YkxUeE41OThwSUlWVGl0VzJmeFk4SWp2cldKQ3BO?=
 =?utf-8?B?Y3RBTmdJTFFIcmFGTHQ1ZFBvNnRnbHgxOXpJQVNvN1FWOUI2ZDdOVEU3OUk5?=
 =?utf-8?B?OFJ4R3RzOFZVYlV6cElmZ1ZFdElWemNNVkZFSUpTYytYM09wMjloSG41Yk1v?=
 =?utf-8?B?cHZ2RHdmN1BBQ2lDTXBXNmNCeElVQzhoeVJxSE1ZOGtMUXZ5V3BjM0RmUXdU?=
 =?utf-8?B?SEh0OG5qN1ZuYlpPMzdwMFJua3QwaU5ObTcvZGhQYnIxZGxGSVBWdDNmRXBo?=
 =?utf-8?B?YUJUNDRVZmlxZ2cwbUFva2hsTUx3bGR6UXFPMjJXT3duR1RlUjdGdzJ2U21X?=
 =?utf-8?B?UENYQmtpejdBZzVQcXlhVlVaZWtLV0tjbjZqbU9laWc4eFUzU2RPU095VmQ2?=
 =?utf-8?B?VHFuZVc1M1ZNZmdnaUM4WFJEYytWWjlrQ0hVZTVCNHo1MTN3dkZTK0htdDdT?=
 =?utf-8?B?c3NKQm8zU0M5TGo4QUJTQUl5N3E3N1dCcEwwMSsrR2NUelJGOGNZclNROHlE?=
 =?utf-8?B?K0NsVVdRT3VKeHUrQ2c3N2tTODFPTDZqWW1CTnJvcmw3QjBmUXZrY3ozcmpu?=
 =?utf-8?B?R3NVb0NmRCtBdXg5R0dnT05CWUVRRGgzbEsrdFVnSGFZZFR1cUorWW1SSjJp?=
 =?utf-8?B?SEJ5VjVjRGxKaFlrSkVjQnhVdGJRbmE0WndPV1NsWTZ0Yk9XN3JRRUYyUGJZ?=
 =?utf-8?B?ZzV0Z3hiQXY2QzJabGFlMVM0RVZWejJ5a2ZueHZqSHFHRUJBd3NVSUlETGUr?=
 =?utf-8?B?OGhxOExTczI5NnZHc1VySzB0RGJsdWhCK0N0TitleGJIM2k5ZWJ1N1BkbVZ6?=
 =?utf-8?B?SktkUTZXOUx1WStMU0U1R2dTeE16Z0lEVnMrZUhhS3N2d1hzNUNYU1JUT25W?=
 =?utf-8?B?ZlM1STIwQk9iMThlQzVHZmVlYUdZNXJ5S0ovcU8wS3diZUNBWlZoOUVZVUtV?=
 =?utf-8?B?ZmJWL1p5eUpqOXhiSFJBd0toNHF2bUx1TjlHR0xaR2F1SjRxZ1ZZYXE0amxy?=
 =?utf-8?B?TkRtU0lGMlVJTjRoUFlxRWVIY0VrUkdka3FybjYzdUVPRTMxZWVDaGIzcmdo?=
 =?utf-8?B?ekVFMjBQSWM1cFUyZmJwaGh2Zk4rYllneSt3eUFvOHJ5SWw0V29tUXp2T0ZR?=
 =?utf-8?B?YjlIZEdoZXEvbW1FZDNaSWp1T0pua2dsY3V2RWdiOUoxUlVBa3k5azhPcUNq?=
 =?utf-8?B?YlBNWVNTNFVWcjBtcHAwSXVibXVSWHJ4SG9VMTJLYTJEV25abENWUk1aZDdu?=
 =?utf-8?B?c2Z1cWI2ckczbnZIVWNoTmdTME9JbllUVFJwUnVGZVA5UTBjczVJenZMTXEz?=
 =?utf-8?B?Vk1INmhEWkNzT2tJSzlSTDZockVabS9MRGZPUlYweTNhOVFyRXBXbS8vUkhX?=
 =?utf-8?B?bHd0enFJV1cvS0FhSGxsVndSVnRFS0MxOEFXczdudXppNUMraHVOcmYxWEJk?=
 =?utf-8?B?bUkybk1tOE9RdlZGTWZ5VmhLRnR4WTNGdmRNd2cxQTBuNVZZUk1DUEJqYmdR?=
 =?utf-8?B?ODQ5VlVUTUJxb0VIWGN6VzhKOGtJMVl0Mk0yTDlJSUxCandORW5EbXZYYWl1?=
 =?utf-8?B?T0d5bGlHWnc3aXpHbERoMGFMay9CQi9uZm4rV0pTcm9aY3RDS3RnOXBkTlg0?=
 =?utf-8?Q?b0f1gFN9VR++aOcWzY27fWc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0D1AC0FE3C0E5342BC01CD03BC403462@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 143e050f-ad47-449c-fc96-08dbb615e007
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2023 18:02:07.1693 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hJDi9ZMHkeHt0bZ9u0UUVcuJ7xRI6UQ3fAXXMDpLuVmy5mEen+LFHfmiY5CkLAwbQ5udYuYRbVWReZKnTeq2Qp+yGl2gSaftbtMwHd4j/cfqbWVFicWw1oMlWOylCI4V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5393
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
Cc: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCAyMDIzLTA5LTA5IGF0IDE1OjM4IC0wNzAwLCBUZXJlcyBBbGV4aXMsIEFsYW4gUHJl
dmluIHdyb3RlOg0KPiBVcGRhdGUgdGhlIEdTQy1mdyBpbnB1dC9vdXRwdXQgSEVDSSBwYWNrZXQg
c2l6ZSB0byBtYXRjaA0KPiB1cGRhdGVkIGludGVybmFsIGZ3IHNwZWNzLg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogQWxhbiBQcmV2aW4gPGFsYW4ucHJldmluLnRlcmVzLmFsZXhpc0BpbnRlbC5jb20+
DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvcHhwL2ludGVsX3B4cF9jbWRfaW50ZXJm
YWNlXzQzLmggfCA0ICsrLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvcHhw
L2ludGVsX3B4cF9jbWRfaW50ZXJmYWNlXzQzLmggYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9weHAv
aW50ZWxfcHhwX2NtZF9pbnRlcmZhY2VfNDMuaA0KPiBpbmRleCAwMTY1ZDM4ZmJlYWQuLmUwMTdh
N2Q5NTJlOSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvcHhwL2ludGVsX3B4
cF9jbWRfaW50ZXJmYWNlXzQzLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvcHhwL2lu
dGVsX3B4cF9jbWRfaW50ZXJmYWNlXzQzLmgNCj4gQEAgLTE0LDggKzE0LDggQEANCj4gICNkZWZp
bmUgUFhQNDNfQ01ESURfTkVXX0hVQ19BVVRIIDB4MDAwMDAwM0YgLyogTVRMKyAqLw0KPiAgI2Rl
ZmluZSBQWFA0M19DTURJRF9JTklUX1NFU1NJT04gMHgwMDAwMDAzNg0KPiAgDQo+IC0vKiBQWFAt
UGFja2V0IHNpemVzIGZvciBNVEwncyBHU0NDUy1IRUNJIGluc3RydWN0aW9uICovDQo+IC0jZGVm
aW5lIFBYUDQzX01BWF9IRUNJX0lOT1VUX1NJWkUgKFNaXzMySykNCj4gKy8qIFBYUC1QYWNrZXQg
c2l6ZXMgZm9yIE1UTCdzIEdTQ0NTLUhFQ0kgaW5zdHJ1Y3Rpb24gaXMgc3BlYydkIGF0IDY1SyBi
ZWZvcmUgcGFnZSBhbGlnbm1lbnQqLw0KPiArI2RlZmluZSBQWFA0M19NQVhfSEVDSV9JTk9VVF9T
SVpFIChQQUdFX0FMSUdORUQoU1pfNjRLICsgU1pfMUspKQ0KPiAgDQo+ICAvKiBQWFAtUGFja2V0
IHNpemUgZm9yIE1UTCdzIE5FV19IVUNfQVVUSCBpbnN0cnVjdGlvbiAqLw0KPiAgI2RlZmluZSBQ
WFA0M19IVUNfQVVUSF9JTk9VVF9TSVpFIChTWl80SykNClZpdmFpayByZXBsaWVkIHdpdGggUkIg
b24gZHJpLWRldmVsOsKgaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvYXJjaGl2ZXMvZHJp
LWRldmVsLzIwMjMtU2VwdGVtYmVyLzQyMjg2Mi5odG1sbA0Kd2UgY29ubmVjdGVkIG9mZmxpbmUg
YW5kIGFncmVlZCB0aGF0IGhpcyBSQiBjYW4gcmVtYWluIHN0YW5kaW5nIG9uIGNvbmRpdGlvbiBp
IGZpeCB0aGUgUEFHRV9BTElHTkVEIC0+IFBBR0VfQUxJR04gZml4Lg0KVGhhbmtzIFZpdmFpayBm
b3IgcmV2aWV3aW5nLg0KDQo=
