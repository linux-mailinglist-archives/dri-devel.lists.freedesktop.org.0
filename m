Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A9D83307F
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 22:54:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A78B310EA80;
	Fri, 19 Jan 2024 21:54:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2089.outbound.protection.outlook.com [40.107.95.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07A3310EA80
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 21:54:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GSTh7scntJolqPP4S6eSKtkQcc5RtCP4d8ZG1HdFBJbesbqqGmWQ9tXUJcR2lDVOto7+siFty2scOSG7rE9y6as0V4dGBEmE+tKKg5ZOqTGKNCErccXi8C5BSnMkrya4I0MFkZkR4XqWU50A/AEHDy1z5rm2LYyNq2pnK91WqvcscvDIyRuehkogxSB0EP7kemRdx6DpRVc8m6yEeGNOsDQ+UH6Dy65piKPES/M2aq/m0q1ZUOYwGQk5y1q+KZfsAF8fqlRl3ik9JdEvKtEr+YAPV/0QQtYWomr0YL5nJ3ZVVMsObz/MJ9ATpUzXWA7wn3O7SyLfwiZs7bEHyM1/Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LI2998x0UTwKoMy8VmC95T5+japhZlzL9xFnUt/W8+o=;
 b=Ca2hyxM5ea8AiJmhW2WiyrpdyvfnuyrxVsbEUVYVzdPDAvsIju1h3/AiYE6nFTwv+Mdx/9m2+sIkOqJpHQKDgB/UIZ0IekCA2tMe1DS3irQgI2o46tgRqDDbXqwtwwyECmbguVewJIhjTNpQG8AIgGZKvctgSQRHnDs3zg+AnBFIIFFh79euHMFeHS2OzwpkNe5tsSObp2o86cCKYXRryG+GBqsROjEjg0ntIhcbpXZD7Sxr6wQybrHCre1I9PzjhwY4qDXF009btCuuKAG2xbea0N2fI4mfCHIWBlgFpf6mo89U1tuz71JuG2b6veep6eG0y0qjCDwcuHupyFPH1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LI2998x0UTwKoMy8VmC95T5+japhZlzL9xFnUt/W8+o=;
 b=fUKU00AhSLxS+SR7G36yRSN5qqnGCiBN5a4gf6/1nTYLk3p6UI8VZ8JG4wl1Vlct6I7hXAw5mKbIsD8JXNY7aXnizl4P/AGloo0ixYAt2tB1dXGsBQzmP6RuCyj8shI4EZRqcCOCivpoWG3kPNIQoNCnykkHpwvfwm9vvEXnhDU=
Received: from MW4PR12MB7165.namprd12.prod.outlook.com (2603:10b6:303:21b::14)
 by BN9PR12MB5338.namprd12.prod.outlook.com (2603:10b6:408:103::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.26; Fri, 19 Jan
 2024 21:54:24 +0000
Received: from MW4PR12MB7165.namprd12.prod.outlook.com
 ([fe80::374b:e99d:5ba7:1ec0]) by MW4PR12MB7165.namprd12.prod.outlook.com
 ([fe80::374b:e99d:5ba7:1ec0%4]) with mapi id 15.20.7202.024; Fri, 19 Jan 2024
 21:54:24 +0000
From: "Klymenko, Anatoliy" <Anatoliy.Klymenko@amd.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH 3/4] drm: xlnx: zynqmp_dpsub: Don't generate vblank in
 live mode
Thread-Topic: [PATCH 3/4] drm: xlnx: zynqmp_dpsub: Don't generate vblank in
 live mode
Thread-Index: AQHaSpvU9W+NcWnB8E2zkfKtis0GmbDhETEAgACdKJA=
Date: Fri, 19 Jan 2024 21:54:24 +0000
Message-ID: <MW4PR12MB7165ED01A69DDBA1F6A40DA8E6702@MW4PR12MB7165.namprd12.prod.outlook.com>
References: <mailman.1660.1705501214.2415.dri-devel@lists.freedesktop.org>
 <MW4PR12MB7165B7BEA23F4C4185A48EE9E6702@MW4PR12MB7165.namprd12.prod.outlook.com>
 <20240119122954.GA13388@pendragon.ideasonboard.com>
In-Reply-To: <20240119122954.GA13388@pendragon.ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR12MB7165:EE_|BN9PR12MB5338:EE_
x-ms-office365-filtering-correlation-id: e25da573-2df1-43d7-94c8-08dc19393364
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AW6a2c46kw9oXu6CzGLs0+oRcpyJe59qS7gtbvaXoSYQEaMYgynRzTt8yyAQek4ulW5fAi+IDDJ4bcBeTjDRtbliPi1yVwpo21L2RCjlVQaBOzsVmTNBTmEeJ1WVKf84++PdxKdpSQpAKyGq2I8rixIzhmvmAHHQ18jfXXuj3MZ4aJfOToo02lZYNZLxLNPCNeyDan/CmXSuRjEsJ6sOemNcJQQuU79caaQR1z9dBiDbGxSHXFo8tWom4et/YVA+A4NGd2R9C2c8baCc7l59N/eTQmya+mCvoDZGpQBhlXPbwbkiLX8Dv+F66VuBj3b1pZTDEsy+TOsDgSmukYuSagoW7JJauz860hyAJ42+a8rlNJbFGMI7oFq7F7aEkszH6mdWtnEFWMbmkyfux+h0I2dJEVPKrAlEUHUzLPp/pvQfp/bLxwnDSq1JhSBqIFt0NeOz48fmvM7gdItaMAzVyDOUAorAjcG7VhVElb3a9ddyAECR9IsJ/vXM7KLShPX/9DPwdQcgPW1e28swr/WYSse7lPH3mhukiq3VIiXBORCekQTAVAEt9j9+RHzwW5tg3NZrmoxoRSr0XRf+5yErMkx6NvqCnjbAZQlcQpqSl+A/2sQWe7Ft1Mmwl9ylU4mTnWS5pwPssU6PCSX1qfUOVMPj1ph0seEp46zknf6g8zU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB7165.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(346002)(396003)(136003)(366004)(230273577357003)(230922051799003)(230173577357003)(451199024)(1800799012)(186009)(64100799003)(2906002)(7416002)(5660300002)(52536014)(8936002)(55016003)(8676002)(4326008)(6916009)(316002)(64756008)(66946007)(66476007)(76116006)(66446008)(54906003)(66556008)(41300700001)(38070700009)(26005)(71200400001)(478600001)(6506007)(7696005)(53546011)(9686003)(38100700002)(122000001)(83380400001)(86362001)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V3RmNWJ4eUlMeU9ld1A5cjgzK3Rmcm5sRnkwK1Zpc3FQVFFKU0I4ZU8ybzNY?=
 =?utf-8?B?bmZUUklOSU0wTnZTRTNUNnhKK2ZhNS96dWVjbXNmdXBSZmZZVnhGODlBYWIy?=
 =?utf-8?B?SngrcFJEL1U4YWNqL0lKZllHSUxYVXN2VHF2a09FbnBodWtPb0xOY2FPRU5Z?=
 =?utf-8?B?MVpuTm43R0UrRFR5MWY2dHh2eGpxTFpNd3Bub0ZUY3BONXRWNC9vSThXdkxz?=
 =?utf-8?B?ZC9QdkhGQWkyRm9WSFFxQzkveHRwazRjKzJVVmtpZWdGTFJMUndpMHJPTFNH?=
 =?utf-8?B?VWFaNzVWa09iSE1TdFVXaGpqUG9NZUZsTmMwSXQrVDQyL1Fra09VcDhHaHpu?=
 =?utf-8?B?eDdvRWRwTVZaeHVWSXVieDNxOUdnbFZJbmVSUW9HQ2RNNDF1bDFGZFpHM2J3?=
 =?utf-8?B?NzZOZTdoVGFVZTR1aTBBcWxwNDBCa05zbEYrUllJMTV0UTl3TXF1anZ3Q2Rn?=
 =?utf-8?B?aExvTmIxUVQ4UTB0UWRhWDJPVWVuK2FCbVk3T0lUTTVPN2tOZ0JVakVZSlla?=
 =?utf-8?B?L1hxdUlRSjBHSG13dmIwLzJSZmdSaEJxWVlKbGVhS3Y4MVBNYUtxNCtaVzlJ?=
 =?utf-8?B?bmQ3Z2M0RldkK25zcE1CNVVnczlHOXNtTDBhZDlta29xaVNJbldENXY1NnhK?=
 =?utf-8?B?Wlp6S0pMVUhlVjVWVnpGRGxNR0t4QkZFT0JpQVhMZXdxSXFnN0Vud1pDRkFT?=
 =?utf-8?B?VU9vSG5QaU5YT0NVNFFqdnFwQkpscWxMN29zNWo0S3YwMWxhVnNxVGFRWDkv?=
 =?utf-8?B?QTA2clBZZU5Lc2IxR0x5ZTNZZW1WSU8wWTNJQ21IUDNzNnFBcmp3STBnM1ls?=
 =?utf-8?B?UjhmcmU2WUVEWVVFbkV6T1Q5b0hqR0xiRjduZVlOWDhPcEFRdTJOK2ZGYzlu?=
 =?utf-8?B?RFNZRXZyMnlWU3lYNEhVeGJkTnA2cWUvcjRYNnc0MklxaVBaUHF2Z0NBYXI2?=
 =?utf-8?B?SWVEeUkwWSthN1pGa01MVHpoWEN3dFJhSUUxd3N1UHVoaGpHZGNSU2ZEdUZz?=
 =?utf-8?B?K1ZCSG1tbFBwU1JMSFNqTU5peFNPdzYvNi9FVFpZL0lybkVjVWtZcVVmSmo5?=
 =?utf-8?B?S2p5NkJiMG9sckphRlQ3YUlmaTduTTNxK0VjMDhKcVhOWWtoNy82bi9Jc3kv?=
 =?utf-8?B?TmFacnk2UDlHaVZzc01OcjhEZmxDNXUrRGo3WDZUeHFqSkMycW55MUhxd2FF?=
 =?utf-8?B?MDhzcHo2RzlRb1luVmtlcnFZdTE3YnlyWGxQeG83RFQxLzlBcTltTWN6T0U4?=
 =?utf-8?B?R2ZzMENld2FQeVo3SFBJempDeXRtQVFrZS9yM3BpQ09kdUkyekhybUk5WHVl?=
 =?utf-8?B?MFhIai95UmUvSmdhNGxGa3lXeE5QZ3pxclFKVTZ2R3lDT2l5OVhCcThuc2ho?=
 =?utf-8?B?emhocERTS0JCTHVwOHRxT2M0bjdraG9wUEx2ekRheVhWejB3dFA2R0dXNURl?=
 =?utf-8?B?STJPUTg4SlRVbnN1dFAzcm8xell2WFVuMkxYbjc1dE5LQUsvcHVQa2lyYXIx?=
 =?utf-8?B?cXpZSVVlNlBYOGl4elp4L2lXa1hkYVlnaytjTXcrQVllNjF0T2p6NmRwcEU0?=
 =?utf-8?B?Q21xWFM4TTQwM1ZnUmtVRzg5M1p4cG5LMi9nelF3c2ZNYjZQM0JrWDk3S1l1?=
 =?utf-8?B?TDVlU1AzRjBTbFppdjJoeUhLZE5iWE1OUkJoQ001cGU4Zk9GSDkvSXlwVUxl?=
 =?utf-8?B?QWpVUFZmZDNBNkRORlZaY3QzblhmY05rTG5MMUxzZk90Y0h4ZFl2QWJmL1Fi?=
 =?utf-8?B?V0dRZFh4dytGbEFPc0JDREU4LzNuZExIcXNDbkhRTmxJejhIYndlVFVBcElC?=
 =?utf-8?B?Y1lLYS96YThGVlhqRGN5dlBHSW15Sk9aeWU2MXRlZ1hYTFB2dE0vanpZT0lB?=
 =?utf-8?B?RmhVNTBuZjc2L2ZxandRVXhmeHNpeEFYVHU1VXNwdVo3Ylk1ei9NeGpHMlVE?=
 =?utf-8?B?VVNiVDRSTDhrWldkK3BPSytwVUx0cVpDTEFWd0Rkektwb0Jrbkt4eThEL1RM?=
 =?utf-8?B?aHpGTGxHSE1aNXdSUUQyU1hFU3RrUlRwS3JkMXBOcEVtRzJiVVJxc2JNRzJY?=
 =?utf-8?B?bmI0dm9rS3RlOURSSHVHblI1b0FFRkp3a1RwemViZ1lXK1ZFeVFFMGFtYW9y?=
 =?utf-8?Q?GMkE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB7165.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e25da573-2df1-43d7-94c8-08dc19393364
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2024 21:54:24.5647 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1hRZJeh1bMdf/QLCKxo25qLj38UMRdsF9FbbRZ85nALHhtnyuf74xIikGbY4K8RSwX9+bVEivwWg7H++kBGTIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5338
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
Cc: "tzimmermann@suse.de" <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "aarten.lankhorst@linux.intel.com" <aarten.lankhorst@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "Simek, Michal" <michal.simek@amd.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMYXVy
ZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+DQo+IFNlbnQ6
IEZyaWRheSwgSmFudWFyeSAxOSwgMjAyNCA0OjMwIEFNDQo+IFRvOiBLbHltZW5rbywgQW5hdG9s
aXkgPEFuYXRvbGl5LktseW1lbmtvQGFtZC5jb20+DQo+IENjOiBUb21pIFZhbGtlaW5lbiA8dG9t
aS52YWxrZWluZW5AaWRlYXNvbmJvYXJkLmNvbT47DQo+IGFhcnRlbi5sYW5raG9yc3RAbGludXgu
aW50ZWwuY29tOyBtcmlwYXJkQGtlcm5lbC5vcmc7IHR6aW1tZXJtYW5uQHN1c2UuZGU7DQo+IGFp
cmxpZWRAZ21haWwuY29tOyBkYW5pZWxAZmZ3bGwuY2g7IFNpbWVrLCBNaWNoYWwgPG1pY2hhbC5z
aW1la0BhbWQuY29tPjsNCj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgbGludXgt
YXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBsaW51eC0NCj4ga2VybmVsQHZnZXIua2Vy
bmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDMvNF0gZHJtOiB4bG54OiB6eW5xbXBfZHBz
dWI6IERvbid0IGdlbmVyYXRlIHZibGFuayBpbiBsaXZlDQo+IG1vZGUNCj4gDQo+IENhdXRpb246
IFRoaXMgbWVzc2FnZSBvcmlnaW5hdGVkIGZyb20gYW4gRXh0ZXJuYWwgU291cmNlLiBVc2UgcHJv
cGVyIGNhdXRpb24NCj4gd2hlbiBvcGVuaW5nIGF0dGFjaG1lbnRzLCBjbGlja2luZyBsaW5rcywg
b3IgcmVzcG9uZGluZy4NCj4gDQo+IA0KPiBIaSBBbmF0b2xpeSwNCj4gDQo+IE9uIEZyaSwgSmFu
IDE5LCAyMDI0IGF0IDA1OjUzOjMwQU0gKzAwMDAsIEtseW1lbmtvLCBBbmF0b2xpeSB3cm90ZToN
Cj4gPiBPbiBXZWQsIDE3IEphbiAyMDI0IDE2OjIwOjEwICswMjAwLCBUb21pIFZhbGtlaW5lbiB3
cm90ZToNCj4gPiA+IE9uIDEzLzAxLzIwMjQgMDE6NDIsIEFuYXRvbGl5IEtseW1lbmtvIHdyb3Rl
Og0KPiA+ID4gPiBGaWx0ZXIgb3V0IHN0YXR1cyByZWdpc3RlciBhZ2FpbnN0IGludGVycnVwdHMn
IG1hc2suDQo+ID4gPiA+IFNvbWUgZXZlbnRzIGFyZSBiZWluZyByZXBvcnRlZCB2aWEgRFAgc3Rh
dHVzIHJlZ2lzdGVyLCBldmVuIGlmDQo+ID4gPiA+IGNvcnJlc3BvbmRpbmcgaW50ZXJydXB0cyBo
YXZlIGJlZW4gZGlzYWJsZWQuIEF2b2lkIHByb2Nlc3Npbmcgb2YNCj4gPiA+ID4gc3VjaCBldmVu
dHMgaW4gaW50ZXJydXB0IGhhbmRsZXIgY29udGV4dC4NCj4gPiA+DQo+ID4gPiBUaGUgc3ViamVj
dCB0YWxrcyBhYm91dCB2YmxhbmsgYW5kIGxpdmUgbW9kZSwgdGhlIHRoZSBkZXNjcmlwdGlvbg0K
PiA+ID4gZG9lc24ndC4gQ2FuIHlvdSBlbGFib3JhdGUgaW4gdGhlIGRlc2MgYSBiaXQgYWJvdXQg
d2hlbiB0aGlzIGlzIGFuDQo+ID4gPiBpc3N1ZSBhbmQgd2h5IGl0IHdhc24ndCBiZWZvcmU/DQo+
ID4NCj4gPiBZZXMsIEkgc2hvdWxkIG1ha2UgcGF0Y2ggY29tbWVudCBtb3JlIGNvbnNpc3RlbnQg
YW5kIGVsYWJvcmF0ZS4gSSB3aWxsIGZpeCBpdCBpbg0KPiB0aGUgbmV4dCB2ZXJzaW9uLiBUaGFu
ayB5b3UuDQo+ID4NCj4gPiA+DQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEFuYXRvbGl5IEtseW1l
bmtvIDxhbmF0b2xpeS5rbHltZW5rb0BhbWQuY29tPg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4gICBk
cml2ZXJzL2dwdS9kcm0veGxueC96eW5xbXBfZHAuYyB8IDExICsrKysrKysrKy0tDQo+ID4gPiA+
ICAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPiA+
ID4NCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94bG54L3p5bnFtcF9kcC5j
DQo+ID4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hsbngvenlucW1wX2RwLmMNCj4gPiA+ID4gaW5k
ZXggZDYwYjc0MzE2MDNmLi41NzFjNWRiYzk3ZTUgMTAwNjQ0DQo+ID4gPiA+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS94bG54L3p5bnFtcF9kcC5jDQo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS94bG54L3p5bnFtcF9kcC5jDQo+ID4gPiA+IEBAIC0xNjI0LDggKzE2MjQsMTYgQEAgc3RhdGlj
IGlycXJldHVybl90IHp5bnFtcF9kcF9pcnFfaGFuZGxlcihpbnQNCj4gaXJxLCB2b2lkICpkYXRh
KQ0KPiA+ID4gPiAgICAgICB1MzIgc3RhdHVzLCBtYXNrOw0KPiA+ID4gPg0KPiA+ID4gPiAgICAg
ICBzdGF0dXMgPSB6eW5xbXBfZHBfcmVhZChkcCwgWllOUU1QX0RQX0lOVF9TVEFUVVMpOw0KPiA+
ID4gPiArICAgICB6eW5xbXBfZHBfd3JpdGUoZHAsIFpZTlFNUF9EUF9JTlRfU1RBVFVTLCBzdGF0
dXMpOw0KPiA+ID4gPiAgICAgICBtYXNrID0genlucW1wX2RwX3JlYWQoZHAsIFpZTlFNUF9EUF9J
TlRfTUFTSyk7DQo+ID4gPiA+IC0gICAgIGlmICghKHN0YXR1cyAmIH5tYXNrKSkNCj4gPiA+ID4g
Kw0KPiA+ID4gPiArICAgICAvKg0KPiA+ID4gPiArICAgICAgKiBTdGF0dXMgcmVnaXN0ZXIgbWF5
IHJlcG9ydCBzb21lIGV2ZW50cywgd2hpY2ggY29ycmVzcG9uZGluZw0KPiBpbnRlcnJ1cHRzDQo+
ID4gPiA+ICsgICAgICAqIGhhdmUgYmVlbiBkaXNhYmxlZC4gRmlsdGVyIG91dCB0aG9zZSBldmVu
dHMgYWdhaW5zdCBpbnRlcnJ1cHRzJyBtYXNrLg0KPiA+ID4gPiArICAgICAgKi8NCj4gPiA+ID4g
KyAgICAgc3RhdHVzICY9IH5tYXNrOw0KPiA+ID4gPiArDQo+ID4gPiA+ICsgICAgIGlmICghc3Rh
dHVzKQ0KPiA+ID4gPiAgICAgICAgICAgICAgIHJldHVybiBJUlFfTk9ORTsNCj4gPiA+ID4NCj4g
PiA+ID4gICAgICAgLyogZGJnIGZvciBkaWFnbm9zdGljLCBidXQgbm90IG11Y2ggdGhhdCB0aGUg
ZHJpdmVyIGNhbiBkbw0KPiA+ID4gPiAqLyBAQCAtMTYzNCw3ICsxNjQyLDYgQEAgc3RhdGljIGly
cXJldHVybl90IHp5bnFtcF9kcF9pcnFfaGFuZGxlcihpbnQNCj4gaXJxLCB2b2lkICpkYXRhKQ0K
PiA+ID4gPiAgICAgICBpZiAoc3RhdHVzICYgWllOUU1QX0RQX0lOVF9DSEJVRl9PVkVSRkxXX01B
U0spDQo+ID4gPiA+ICAgICAgICAgICAgICAgZGV2X2RiZ19yYXRlbGltaXRlZChkcC0+ZGV2LCAi
b3ZlcmZsb3cNCj4gPiA+ID4gaW50ZXJydXB0XG4iKTsNCj4gPiA+ID4NCj4gPiA+ID4gLSAgICAg
enlucW1wX2RwX3dyaXRlKGRwLCBaWU5RTVBfRFBfSU5UX1NUQVRVUywgc3RhdHVzKTsNCj4gPiA+
ID4NCj4gPiA+ID4gICAgICAgaWYgKHN0YXR1cyAmIFpZTlFNUF9EUF9JTlRfVkJMQU5LX1NUQVJU
KQ0KPiA+ID4gPiAgICAgICAgICAgICAgIHp5bnFtcF9kcHN1Yl9kcm1faGFuZGxlX3ZibGFuayhk
cC0+ZHBzdWIpOw0KPiA+ID4NCj4gPiA+IE1vdmluZyB0aGUgenlucW1wX2RwX3dyaXRlKCkgaXMg
bm90IHJlbGF0ZWQgdG8gdGhpcyBmaXgsIGlzIGl0PyBJDQo+ID4gPiB0aGluayBpdCBzaG91bGQg
YmUgaW4gYSBzZXBhcmF0ZSBwYXRjaC4NCj4gPg0KPiA+IFRoZSBzb2xlIHB1cnBvc2Ugb2Ygenlu
cW1wX2RwX3dyaXRlKCkgaXMgdG8gY2xlYXIgc3RhdHVzIHJlZ2lzdGVyLiBUaGUNCj4gPiBzb29u
ZXIgd2UgZG8gaXQgdGhlIGJldHRlciAoYWZ0ZXIgcmVhZGluZyBzdGF0dXMgaW4gdGhlIGxvY2Fs
IHZhcmlhYmxlDQo+ID4gb2YgY291cnNlKS4NCj4gDQo+IE5vIGRpc2FncmVlbWVudCBhYm91dCB0
aGF0LiBUb21pJ3MgcG9pbnQgaXMgdGhhdCBpdCdzIGEgZ29vZCBjaGFuZ2UsIGJ1dCBpdCBzaG91
bGQNCj4gYmUgZG9uZSBpbiBhIHNlcGFyYXRlIHBhdGNoLCBieSBpdHNlbGYsIG5vdCBidW5kbGVk
IHdpdGggb3RoZXIgY2hhbmdlcy4gVGhlIHVzdWFsDQo+IHJ1bGUgaW4gdGhlIGtlcm5lbCBpcyAi
b25lIGNoYW5nZSwgb25lIGNvbW1pdCIuDQo+IA0KU3VyZSwgSSB3aWxsIG1vdmUgdGhpcyBpbnRv
IGEgc2VwYXJhdGUgY29tbWl0IGluIHRoZSBuZXh0IHZlcnNpb24uIFRoYW5rIHlvdS4NCg0KPiA+
IFdlIGNhbiBhbHNvIHJldXNlIHN0YXR1cyB2YXJpYWJsZSBmb3IgaW4tcGxhY2UgZmlsdGVyaW5n
IGFnYWluc3QgdGhlDQo+ID4gaW50ZXJydXB0IG1hc2ssIHdoaWNoIG1ha2VzIHRoaXMgY2hhbmdl
IGRlcGVuZGVudCBvbg0KPiA+IHp5bnFtcF9kcF93cml0ZSgpIHJlb3JkZXJpbmcuIEkgd2lsbCBh
ZGQgYSBjb21tZW50IGV4cGxhaW5pbmcgdGhpcy4gSXMNCj4gPiBpdCBvaz8NCj4gDQo+IC0tDQo+
IFJlZ2FyZHMsDQo+IA0KPiBMYXVyZW50IFBpbmNoYXJ0DQoNClRoYW5rIHlvdSwNCkFuYXRvbGl5
DQo=
