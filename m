Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC497F9DFC
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 11:57:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2498F10E230;
	Mon, 27 Nov 2023 10:56:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCBE010E238
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 10:56:53 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3AR7K2dc021200; Mon, 27 Nov 2023 10:45:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=dk201812; bh=scqXFlxj1na2t/MBY90ly1uLDVcJbg+s/RKuKE/OLzI=; b=
 Og+qewCuL5hJBLpxgk2PAIJQ++CRTEXx0y5C+fBdheqmX4FHvvqDYCOUnflYG3Oz
 dbzmxrgSw7PjaZuJ3ipkY8qUD3ClGdTLa54FXh7IRc7HQdEqdajqC/G2gDGEoL20
 I7GFBypJWtYjkoSuQ2PdJ/qe6CN7hY8EA45zpGzqi87ytZoPN1s/KSSHcJSnS7Qr
 CaduWh3CL0V6+SpvqyGrCJrf+13B+M7JIMFiWJLDDSVepxrur9DpjTFA3Qhqsc8e
 0cvQDoE86ow3nHE9jMwxMHAVlHWtB3tvfqFQ6XK3o/QowA1lFmTncAAxyEM+pm6u
 IeQmyRKy3lfR+Lkj43Q6Dg==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3uk82sha8f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 27 Nov 2023 10:45:12 +0000 (GMT)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 27 Nov 2023 10:45:10 +0000
Received: from GBR01-CWX-obe.outbound.protection.outlook.com (104.47.85.41) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34 via Frontend
 Transport; Mon, 27 Nov 2023 10:45:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SE+VZ8XphdT7uWmYxR6el8Udbn7xVSNjLEFreCtnSWf7tjU6Ho7/cspgdNKryXX9AhuTJnDA44Nv4c81BFz4ICm5NS8EMx4wdZit2QNDefmX1ENDuG16eTaWiUlH4f+p/oqtL3a3WhzS1c6k/4aqNMR0GFRzz3oaESlDCv7UTnFhuoGBnSQJossGmC18Sgsm+p2QAl3d+bT9MkZK0pSLl6D/HMbT0nvUxz7Gu241VxtISSUz36ywLEqAtb/Ag7VtXc+YR/5YaLFx4PfiW35XLsmOZRPZhOfEeadPdOYPn2SBw4doZYPc8VF/Mjq0L+4zy5PKymPaTSq+GzDftn4J/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=scqXFlxj1na2t/MBY90ly1uLDVcJbg+s/RKuKE/OLzI=;
 b=JI49aczha29hlUWxO5SrYpVqgZ76KtffaaoH8A5raJIpA8e6l580AxM/8iQesddJW8c9mllKzpm79Dj2MPrPUVWxGo1hkmWkdAJTyCVlhXslrxOduUBH/Iwy1ooLiVlVchA3Zd3hqP1Buew66TlmYx6EFXgyHXsVlntqhjzz1poYzmUXEvPXU26dVp+BDho6hpBeBj+hyV8pX+99q+kOQCeWJKuLxxtoi6GiBVJ2kuxu2HvmbGJC3cBXX2cHxcTSdrky9ExAeaVIoz0Z1sVx0P/UB5Yq2S0jIcp1Tm8JIBbTQwnef8wE9lW0sjrQo79gEaiwaZrB1c+3UJsudNbIUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=scqXFlxj1na2t/MBY90ly1uLDVcJbg+s/RKuKE/OLzI=;
 b=aT+hbuTnK6K7weywzEV5YbwEmRGAzz6cUjs2APSPtmBqb9D7H6vD2iNm+BPVGwx/U1aX4NaBm6AZnJ51z8Hn9rmhmyoXjhiXmXBzV10M0MJMtnwpVaitMOx+EIKvCGiREQucGssS92OHRfFbD7pnJAjMaWr2BIY6pGY2YMnGzEc=
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2a5::14)
 by CWLP265MB5940.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1cd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.28; Mon, 27 Nov
 2023 10:45:09 +0000
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::3ca3:d6ce:efeb:31ba]) by LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::3ca3:d6ce:efeb:31ba%3]) with mapi id 15.20.7025.022; Mon, 27 Nov 2023
 10:45:09 +0000
From: Frank Binns <Frank.Binns@imgtec.com>
To: "daniel@ffwll.ch" <daniel@ffwll.ch>, "mripard@kernel.org"
 <mripard@kernel.org>, "yang.lee@linux.alibaba.com"
 <yang.lee@linux.alibaba.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>
Subject: Re: [PATCH -next] drm/imagination: Remove unneeded semicolon
Thread-Topic: [PATCH -next] drm/imagination: Remove unneeded semicolon
Thread-Index: AQHaIR7KpQrIpX5M5UK0xQ0JyosOIg==
Date: Mon, 27 Nov 2023 10:45:09 +0000
Message-ID: <582897ebdc47216bb32c2d8a1322311d26588d61.camel@imgtec.com>
References: <20231127010430.119666-1-yang.lee@linux.alibaba.com>
In-Reply-To: <20231127010430.119666-1-yang.lee@linux.alibaba.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO6P265MB6032:EE_|CWLP265MB5940:EE_
x-ms-office365-filtering-correlation-id: 2c57a005-734b-43f2-7f28-08dbef35ed16
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7zgcBAzQSpFFeX/ygnMLevmUrOJvq6rVy5UWEy/XeQZtS3fKnUkzpLcGz8yyVcv8vHI0A/fd8UGpIunl8iPrAXg5YXZPfG1+LIa0kUkR7/dto89CQ+fqTWL7dR+djK2r9Ct8gM7x3Ys/6zgpKYwakIdFJKsDD3oa6hFZDXrpmNRyVirWJweQn6E3UbNCsUMYTh7f2kHLaodNRtCzowDQbXtcC238hjnG4fOYTH/hWEhcy5Ia2jeQ9i3AsUnWDEH8+gm4OlgtQgZ+lGfBeMfhtDs/7LDYLNIKQeC21VJuZy6dp+YxFQijIChr0hQVWm70pbCP+6CW6i8q0LYAFqLIfVPJ2/W99I5SL13OgTN/0kRC6O580HrRwFf+lKPW1JRgz1fhAutyp7Y6IuaRO6JVulAyacyiee3Lpb3utnYNebNBxsvWqIQr1wPsOlTuv7CgEiMxbv9LPu6ygu2CYYgXtsnFWGCr5VgEZF5J9ITAjiFwZ48WN9ofnX5fUDcI1mdqdRlTV9fl8jsA/Os1MdmtdJEZqNI2No1umhla5XdhlB1BniWodjK1vqqc6+jL1NmvjavRu5h1/pkyc6H0Qo8ujBeY/Zccl3v7WZhw3cdSY+E=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(39840400004)(346002)(366004)(376002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(86362001)(38100700002)(122000001)(38070700009)(36756003)(478600001)(6486002)(966005)(66556008)(66476007)(316002)(54906003)(64756008)(76116006)(66946007)(110136005)(66446008)(26005)(6506007)(71200400001)(2616005)(6512007)(5660300002)(2906002)(4744005)(4001150100001)(4326008)(41300700001)(8936002)(8676002)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RXpOUEhOZm9rTFdYbzkwYmpyTElhNFkySDZIVzlxbDFyN3ZlZ01GYUp3SFRo?=
 =?utf-8?B?anVKNkYvY29YbkRmS09PMmt2ZGViOVFuQ3FoMDVKMEZLZEEwQytYM1BDQ2RG?=
 =?utf-8?B?aHVobTBKRld5Y2dpNWExZ0xRRU5MVXJHUzJuWDN3Ly9ic0FYSDJkSU5hWUxk?=
 =?utf-8?B?aHdXeE5BakwyQUtxcHcrZ0pwdDVXNnFLeU9Dd3NwNHc4N2JsVXFINHkzTi9t?=
 =?utf-8?B?aExGdkFuWlhlLzhwYS9vaEhGSnY0TzFnOWNTNzd1K2c5MWpDekxSUFFyM1Zy?=
 =?utf-8?B?YTdhcWNJa0c1dDI2cXNpVGhNKzFIQWdJdjQzaXVoeWZtT1J3bTNtWFJQZEdi?=
 =?utf-8?B?YUVWSE5vOFFkTm0rU3h6aDdGejNiNlBqS3hjdkVLUE02Z2M1d0lJeXljUnVs?=
 =?utf-8?B?aHhNRUhHZGMwbEJYRHE0VHE2bGFjRWFGSC9aR1ZrL2pOSkR4V3dtY2FaTzB0?=
 =?utf-8?B?bkFUTG1FV0Fad055RjlBWEVMcWs5Z2c0aWRIZmladkE4SXlMbGI3M2w4bS9I?=
 =?utf-8?B?c3poRjF4TGx2VDN3VVI4cjVTdzhIcjFZUlFieWFkUi9SbEVQZGhVYUkvbXZQ?=
 =?utf-8?B?RmJhT0N5ekdtNmhYbjc0aFhERDYvc2grejIzc3dzM2Nmbjdldm0wbzMrSDFQ?=
 =?utf-8?B?eFFWUXB2V1RTeWRBQVM0M2tDNGhBVnRwSDQ2THd5VnNOejdpVnNVazA3REpa?=
 =?utf-8?B?Y3RaMUNRNlBVcWN0cDVMczZZNm5QR1FmVmZEcVlHR3pyaXhTc2hyZjBlZDhp?=
 =?utf-8?B?Tld6cDNod0wzYUNSczNpc3d1SzlzRVdCQlQwcVNsSURBYkdKWjUvYWw5cTdH?=
 =?utf-8?B?NHdLb1NQbCtTZGR0VC93YzJ5ZENBSVJGR2JaYzh0bytxa3Nld3NrcUYvZFBh?=
 =?utf-8?B?citqM2IyZktQczYxdzdkRkpBcWRlbGNCb1ZWcVVTYzAzZE1xRGdPSDBGSlY2?=
 =?utf-8?B?QXR2MmhGUHhPUW5ESUZlQjlJZGphUytWK05XVXljdWtpK1AzdXYwOXp5bTZw?=
 =?utf-8?B?d2RlY0dkZDdJdTNXdFMrQ2ZjdjNrcXNpdlBrSXgrY21mYUEydWlJa3JLRHlI?=
 =?utf-8?B?dzdsZklZNlh0ZUdzZzJyNlNWbW5zcGZWWnQzNFBKWWtoQ2pNOHV4bW0vaklu?=
 =?utf-8?B?L1lHVkxnWW55bkN5SjBRVDlLN1pCSmllM0RTV2liTEg5cW9RbjhkRkVQQkRM?=
 =?utf-8?B?WVRHRnk1THNqQi82WFQ4bkIvVlRsL1pJQ2RickhrQlYvRlMwOXdTeXR2dnpJ?=
 =?utf-8?B?ajd3M2VTK2JHdXFOSnZtNkRqZ2lKMC9sMG9WV25vOEhhSGRJSWliME1LT1Fi?=
 =?utf-8?B?QVdUZWthdG5Bb2U0a1U2LzBscFFZUzl2ZGl5V2RrTmNHbXNsWGp2T1BPV3Jw?=
 =?utf-8?B?ZW5uc3pUeGV4QmtoT2lUME5JelRvSnZ1RTBUaldNNG9JajlxbGZJR3lmczBu?=
 =?utf-8?B?eVpoV2JwTXZranVwbVBRRjdoTGcrL0Z3QWtIM01mWjd0Ky94UjNIeXo2K1kz?=
 =?utf-8?B?cHlIS3ZhYVkzbzZFOWQrdVlJS2taZmcrK3FhWjlQeTdNbFFVT1djL3BkenZL?=
 =?utf-8?B?eFBBbzh5aWpXZDcweFVETGNxaVdMUDU5QmUyL1J1cUhoSjFjZnJkRnl1YjhG?=
 =?utf-8?B?L1FFb3N2VUt1ejA2cVpnd1VNN2RjekIrMno2Qm84cU5WL0lGNjA5VlJyNmwz?=
 =?utf-8?B?SGR0S2tud0RXSWpmZlEyK3Y3RFdWSy9UcTYzS2hBYzJ1eGo3VWg1Y0Y0OVlu?=
 =?utf-8?B?WEJwM0p4a0dDcGVmZ2RKQlJGUUkxOEtqeEIvTFZXUUU1ZmNVK25vNzI1ZTJX?=
 =?utf-8?B?M2toKy9ZalVWUC9GV0FOWnY2UktoVzVVRG9iUVF0cHk3RVU5Z09vY3h1bHI4?=
 =?utf-8?B?ZVhKeUNubTFkZzI4aHJOQ0R1dzJEdmpmTCs2ZHFLQWR4dnlDQmQ0WExQc3hs?=
 =?utf-8?B?U28rMGNabkpvL2gxRkhKS1BYTUpMZDFWRWZwam5zL2FHbFlyTm42RzB2ZHpY?=
 =?utf-8?B?L3NyeHArSE5nR1RlT1pMbGlkcE9wUTNOUXdYcXNOaTJGbjZIamVyMWluUXZp?=
 =?utf-8?B?b0NKdXJnZG8xaFgwUjJLT3Fzc1l2RXFTdkkxVW5OTE0yS1NDdnNTNTZkZkx1?=
 =?utf-8?B?cEdiV3BPM0ZjMCtmTUpnVmRIV0FqNHFJTWlNcVRxcjhTTzdtYVBoOW15bGVJ?=
 =?utf-8?B?R3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5DDEB7504B5A304CA9CA185C467F3AFA@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c57a005-734b-43f2-7f28-08dbef35ed16
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2023 10:45:09.2631 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: atYuw/VYuV0z0KFk4zzSXJBxMTvKE2F/CVdJjivOmwwoFPiYcEwLVYPQw3Zq7kRqCbTBKbm3j5/r7yUiOBtHYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5940
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: YMcfKy_IIX5HJuO_SNdznxcG2HMGWgeU
X-Proofpoint-GUID: YMcfKy_IIX5HJuO_SNdznxcG2HMGWgeU
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
Cc: Matt Coster <Matt.Coster@imgtec.com>,
 "abaci@linux.alibaba.com" <abaci@linux.alibaba.com>,
 Donald Robson <Donald.Robson@imgtec.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksDQoNClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLg0KDQpPbiBNb24sIDIwMjMtMTEtMjcgYXQg
MDk6MDQgKzA4MDAsIFlhbmcgTGkgd3JvdGU6DQo+IC4vZHJpdmVycy9ncHUvZHJtL2ltYWdpbmF0
aW9uL3B2cl9mcmVlX2xpc3QuYzoyNTg6Mi0zOiBVbm5lZWRlZCBzZW1pY29sb24NCj4gDQo+IFJl
cG9ydGVkLWJ5OiBBYmFjaSBSb2JvdCA8YWJhY2lAbGludXguYWxpYmFiYS5jb20+DQo+IENsb3Nl
czogaHR0cHM6Ly9idWd6aWxsYS5vcGVuYW5vbGlzLmNuL3Nob3dfYnVnLmNnaT9pZD03NjM1DQo+
IFNpZ25lZC1vZmYtYnk6IFlhbmcgTGkgPHlhbmcubGVlQGxpbnV4LmFsaWJhYmEuY29tPg0KDQpS
ZXZpZXdlZC1ieTogRnJhbmsgQmlubnMgPGZyYW5rLmJpbm5zQGltZ3RlYy5jb20+DQoNCj4gLS0t
DQo+ICBkcml2ZXJzL2dwdS9kcm0vaW1hZ2luYXRpb24vcHZyX2ZyZWVfbGlzdC5jIHwgMiArLQ0K
PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2ltYWdpbmF0aW9uL3B2cl9mcmVlX2xpc3QuYyBi
L2RyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJfZnJlZV9saXN0LmMNCj4gaW5kZXggYzYx
ZmQ0MTdlZGNiLi41ZTUxYmM5ODA3NTEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9p
bWFnaW5hdGlvbi9wdnJfZnJlZV9saXN0LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2ltYWdp
bmF0aW9uL3B2cl9mcmVlX2xpc3QuYw0KPiBAQCAtMjU1LDcgKzI1NSw3IEBAIHB2cl9mcmVlX2xp
c3RfaW5zZXJ0X3BhZ2VzX2xvY2tlZChzdHJ1Y3QgcHZyX2ZyZWVfbGlzdCAqZnJlZV9saXN0LA0K
PiAgDQo+ICAJCWlmICghbnVtX3BhZ2VzKQ0KPiAgCQkJYnJlYWs7DQo+IC0JfTsNCj4gKwl9DQo+
ICAJLyogY2xhbmctZm9ybWF0IG9uICovDQo+ICANCj4gIAkvKiBNYWtlIHN1cmUgb3VyIGZyZWVf
bGlzdCB1cGRhdGUgaXMgZmx1c2hlZC4gKi8NCg==
