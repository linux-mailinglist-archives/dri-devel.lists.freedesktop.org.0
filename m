Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6445D7F9E6D
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 12:22:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB6AF10E240;
	Mon, 27 Nov 2023 11:22:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1641 seconds by postgrey-1.36 at gabe;
 Mon, 27 Nov 2023 11:22:48 UTC
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ECAF10E240
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 11:22:48 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3AR8ZCFU025105; Mon, 27 Nov 2023 10:55:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=dk201812; bh=vjSa1CUybrkgcG2syf5u3tTfvKybOtBcNaJMFgip16I=; b=
 ApV36aasI+FqWbgg1C2FjLrfRiP+6r1aHAh4kehlO8MsHQ0oXRbESP6xTq8f1dwS
 BE413+nGIplyGQ2wPua0E+8YgBah6Loku5/dSIgF7ve+EEX+ibXMJt9SsruRDV1r
 JgMF1MLNgP82o5myn6XTJeNd2cnNaykVJdvrgkQ9WdMXklkMK98G5yIH31sDczeO
 r7tXI55zWbjRyvDoDYTchqpJY21r54h7pNp6bne1WyLJfDCjK8OuavlLn0MP22of
 05foxZMd30tFSlQl13cyl78NOlfItDc8AdEjWbvFKis1oKinr/+KSJ3TVU6ySZnY
 CDgjBnWCHpZdpQ3hMWWi6A==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3uk9vwhet2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 27 Nov 2023 10:53:56 +0000 (GMT)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 27 Nov 2023 10:53:55 +0000
Received: from GBR01-LO4-obe.outbound.protection.outlook.com (104.47.85.104)
 by email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 27 Nov 2023 10:53:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vg4p/CCByYI7bXLpHWZebBGshwW87GAg9mDcOr5SWwg1pMmKDEuaF51Vjm9I/R70CSaaS/+2kvY7uDIe+BlC8Ix8RawdYvm+UaeIH7wC4xZWavoNG+UdnujSAwxAwfueFqYxfgZXpJVRoQ5G4xykrr5KlaVyk13/fmVA07wl+XiKmlvJIdC27WVebJ7pDcv6GvtInabgBFWXlyhy49gGDT9ZBMeDocHdVG0YIk51oll93PnM68/ZoDx/FOgP+jUH7yNW2EkThB1DWy/Y8qmV6O9PeRt/x0UPX9IAK+sARoINxk/JDxSa+1y6P794qtDWUIB76hW44ogvQ9NO1pTwOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vjSa1CUybrkgcG2syf5u3tTfvKybOtBcNaJMFgip16I=;
 b=lzwTe9iTs8Ggf/GUf8lsa727q+3Ny/qR438HESURRJk1GFw9jnSVbK54MACy0s6cdyP38r3r86KdfDNQUOBWlqwMCoA15WlGXmIRVuPV6xmAixoSEtKg9f85zzNI+sV2uGzTcIKxRzYXXEwPquQwD6MWmIpO+LbTBcdB4jti8BoP1SzGf9Cc9iYQ0tE0AWxfPW1JvrECh27pVPm0wepuT9q9kTD0dPuK/vBd3j6Bb0BTdLhh2CxhOA8QmF06nZkMPpNJxHG06Lj9DwOdCxAGyHiaU2kcv25e6LL82KGE1zSPLwOgISf+5NlCcWGlfAuXft/baJ/0xBGjd/0wf06EIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vjSa1CUybrkgcG2syf5u3tTfvKybOtBcNaJMFgip16I=;
 b=qatn3YnLZPseuigvQiZvKxrNGee/pKml/oh1LYcId0VHzEc+HgdxQge2QlQNhVc2H+ngw1PtmVtaHYDDJxTyGNz5zX0UKAR1mkED8BKk8iUsIrsPMG+QDapkL0hM4J/v6VxWARkMV6lvih/GFVZ///zuPpHIx9yaGNb+jUKVVi8=
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2a5::14)
 by CWXP265MB1798.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:40::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Mon, 27 Nov
 2023 10:53:54 +0000
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::3ca3:d6ce:efeb:31ba]) by LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::3ca3:d6ce:efeb:31ba%3]) with mapi id 15.20.7025.022; Mon, 27 Nov 2023
 10:53:54 +0000
From: Frank Binns <Frank.Binns@imgtec.com>
To: "daniel@ffwll.ch" <daniel@ffwll.ch>, Donald Robson
 <Donald.Robson@imgtec.com>, Matt Coster <Matt.Coster@imgtec.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "dakr@redhat.com" <dakr@redhat.com>
Subject: Re: [PATCH drm-misc-next 0/5] PowerVR VM fixes
Thread-Topic: [PATCH drm-misc-next 0/5] PowerVR VM fixes
Thread-Index: AQHaISADvHcUg42BTUax9WtHfhp3EQ==
Date: Mon, 27 Nov 2023 10:53:54 +0000
Message-ID: <d8c45d6c1b4ecbb182c4a16cb06def520450efa4.camel@imgtec.com>
References: <20231124233650.152653-1-dakr@redhat.com>
In-Reply-To: <20231124233650.152653-1-dakr@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO6P265MB6032:EE_|CWXP265MB1798:EE_
x-ms-office365-filtering-correlation-id: 703f0f35-70c3-4ad3-ac0b-08dbef372646
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZtBBuwDJ633z/jkF8xmBgLtGNVtfzFGn72emx1d3y/UnzVyd50nuWnhuO0HCbU4hTsqGmnJys0PYcdp7EyzImYzSm90ImNpjYbkUWB/oOdIdG2lGa0Tl+sWNJgfd9wgFK4+0/uhcMMLDcVd8+Ccq55vsjHbxL+PVKWSPaz99Kk4MXYpTrIBsh6M6dvKC2V3dP98W5uF8E8Rc6Au4bm4hNG7iH/m/Vwi5p4v6VHi2jkaXF9StIIVNzZjDxOPa3nU1rTRNZBl5nq2NCJT4XSewQ1703MUlCfx5nVAPOR5CDF1j3TrMLqbOBCfPlaViIBAdBYU2FB8allyxKxjPHinR4bnhR8bKnF86egUdgkjL1alVNiQfpd9c7z6yQIOF7gvIIXXeJaMCcO16ib0V+2Kp5SLVpScyWMq6pj43VBRxIU6yWnAfYgBoE7taWRphRMsRc0HBO9mZWH8uhcbQQoDZ4Trd+yWH+vJmQHy/C+wxsR0BaCXCtCfBRBgpxCb4xrZIOCAx4J29YRyA2Zs93xYBn6nUWN/9IoaRWdszlMBNXVBsu5eUZAf6mE3UDyunfpLvU8sDSD3NBrjryqkJojNX0rW+6kwY4XnIBoQJVq0c+teIC7sUmR1G4iDWVQ6Ez99D
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(396003)(376002)(136003)(39840400004)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(2616005)(71200400001)(26005)(478600001)(6506007)(6512007)(122000001)(38100700002)(38070700009)(86362001)(36756003)(4326008)(5660300002)(4001150100001)(2906002)(41300700001)(83380400001)(76116006)(110136005)(6486002)(66946007)(66556008)(66476007)(66446008)(64756008)(54906003)(316002)(8936002)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Zm9Cc0ZNM01kS280MVozSFAyM2dHNlVNd0hsRk1tSjVEaHh1MDhMVDE0WHda?=
 =?utf-8?B?SGpVd0luWkRRcUFlcHlrYXp0TGNDMW5XeWcycjdtbnl6NkxnUWptZ0pJMHhJ?=
 =?utf-8?B?YUQ1dDQyWEFTVXFxVlVTUk9lOGZwQTAyR09TaWpjK2ZHV0ZqRDJTU3JnYzFs?=
 =?utf-8?B?SElWazVVTnduNDRQMmdjdEJHWXNnOVRKaEhEL3ZsajVHdUZjb3pibC85eU1Z?=
 =?utf-8?B?UkUxNDJLbUFJNVE2SUxDMWlmcXhMM3d5dkdlREpIeE1VcjFYWFdsbTRqQzln?=
 =?utf-8?B?TXNrTWozUHAzbkJ1YWJ5THlRMDZxcit5UDZxYnJrMnVXSGNyQWt4S1R1MXhO?=
 =?utf-8?B?d2YydE93YlU1Ri9TUCs4bVhhdjQxRG8xbWxkQUY3Z2FweEtlQkoyMVJMZ1lh?=
 =?utf-8?B?NkJEUWY1VU15RG5sS1Q1UTZxN3ZITmVFb2xaN2FYZXpSbzdpalVYQzM3K3dI?=
 =?utf-8?B?aHI2cHBvVGRUVXpUOXVaK2s4VmNqM2NJaGx5ZWkrRjEyYmZmNmdXOWpYTnBT?=
 =?utf-8?B?UWt4TjVWbDVBWkN0UEQ4aXp4b2NaWk9jNVZtOU9wL1hmYVJCM3d4QzFnWjZl?=
 =?utf-8?B?R0dUUWFxOGY1dFRUaHNtb1BuaStacVFZR2tPdndUaEpVSXRXU0JhSWxtUFFV?=
 =?utf-8?B?UTQ1RlBwb28vK1J2Q0N6UC9OQ3NqcDlmQWZKT3FDR2R6NlZ3YmJXVnRGWEZx?=
 =?utf-8?B?VXAvRXlwV0kzaG1kT2FvMVBwNjUyNXk3UWhpWWdMYlZNNDVnYUhKWXQyK0xT?=
 =?utf-8?B?N3lMVUZHUDhxU21TT2RGVk02cGc5b3g5YXpPYU5xM0podUV5bTF0Y1Fhcnl1?=
 =?utf-8?B?bEppYzgxYndNYnBmSDAxeFE0NWNzOHRnWk1pZVpKU29tblhIUTB3SUt1Wk5l?=
 =?utf-8?B?aHNMMnBoU1pkRU9DS3UyNG14WncxOXBiUXJXaW85Z0Y0NWcvemtWSk04c3Uv?=
 =?utf-8?B?N3dLYXBucU1sYmlyc3o5QmtOSUVMQlNvMUpBQlBPbk1NazFBekZqNVNvZ3lP?=
 =?utf-8?B?VTBaZkRsREJhVnJXV3lZakVCY3IzUW9jT2ZDaXNpZVFCQ25zL2ZJeGFCeTU2?=
 =?utf-8?B?c0dIaW1ja0I3SUlVbThVUnFuZmZ4TmFMMFYrTnJIZGZ1ODNTU3NXRDB3V0s5?=
 =?utf-8?B?MzFrZnFpT2NkVHFGcTc3Mm82Z2M5VmVHZGRxcm5lc00ra3A1Y3RpVzZ1VkVl?=
 =?utf-8?B?MUd5YWROWXVyaUJLck1kTlQyakNqd1c4aE5odWdad0VMN2EzeGF6TS80bTY3?=
 =?utf-8?B?OFNNWVVwMVRJYmpNYlB6TzhYOXV6VGdCQ0tPNHo5dERJOGpFYm9CWGY1OUIz?=
 =?utf-8?B?dm5lbjZkMmsrUG5KZWl2RWtUVmRkMStGTWNjMEhGSUwrMFlWSmI2NWR6UFpu?=
 =?utf-8?B?aHIwS05CeUVnR3Btd0FLdStkRWg3TWIxZVZOUFBaRkdaaVJXRWR3cDJ6SDFM?=
 =?utf-8?B?OStnRXVFY1NHbkRFbCt3Tmxlc0ZnYXErY29nREUrbzlWdzc1OCtsSUV0MW9U?=
 =?utf-8?B?cFlzLzRLQjY5azc2d05xK2plM0RFc2J5U3dkWXNKUUtrdHFnTXdvdDhBVDAy?=
 =?utf-8?B?clpLa2NLK01mTVdaTEpuMS9OTVU2L1kydU0xSTF2WmxhMTEyYWhaVE5qNzFv?=
 =?utf-8?B?OHpVem94T2RRa3BkVDd1am9IUGFqSFM2YnlPOUZCbkpPUjZFbVlBVnl4ZGZi?=
 =?utf-8?B?N052OU5EdkduVW1ZMWpJUlNUYkxxRnh5UXM1Q2RLVUpFT0pXbnhoMGNFbEk5?=
 =?utf-8?B?WStYaG1rMzZXbmQxeUNSNUJpMkdyLzlrbmVTVldCUDRMT2JNNHhGa0NRUWVM?=
 =?utf-8?B?czR3SFB4ZEQwaVZ3YmtMUFh6SEVYc0tpbHkvdjEyS1Z3UFpYV0lNc3RXVnEy?=
 =?utf-8?B?T2FBQ2R0YTNua3IvK2Z2czJLTzY0Z214bjc4ay8rSnV2UWw1YmVrM2NmSzBG?=
 =?utf-8?B?UU5Qc0MwTFp6aDE3dlU5U2dpU3Vyc0pzVzFSSW43NVZ6MUkrZFd0RDM0QUxG?=
 =?utf-8?B?eFNTelNCN1ZBVXN6Z29JR25GOWVUWGZMOHVaUXIzaG93cHIzVTZaM2FZakJz?=
 =?utf-8?B?QkhHakF6WDVJaXpvV3RqM0NNaVVGa05peFlvZDJRUHZYUmloL09CNHRNa1lk?=
 =?utf-8?B?QmxIazNobmVpY0R2YWJtOXNlTjFMeUZXM0pwQWluRDVjMTMyNnBUOTg0Mjcz?=
 =?utf-8?B?K3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <087F9FAF2FDD1544B0D2060EC772673B@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 703f0f35-70c3-4ad3-ac0b-08dbef372646
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2023 10:53:54.7088 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +9khHGJJB/MQv2vllYcYuqNyzg7FwVBoVUOWhxOv/CIIYRhGR0C3GrXF4yiHe3qS1oE6i46ugrcNGepJW01F2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB1798
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: Ds-_0mafw5leQZS3VHss0VYEJ2MFRZXS
X-Proofpoint-ORIG-GUID: Ds-_0mafw5leQZS3VHss0VYEJ2MFRZXS
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksDQoNClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoZXMuDQoNCk9uIFNhdCwgMjAyMy0xMS0yNSBh
dCAwMDozNiArMDEwMCwgRGFuaWxvIEtydW1tcmljaCB3cm90ZToNCj4gSGksDQo+IA0KPiBTb21l
IG1ham9yIEdQVVZNIGNoYW5nZXMgbGFuZGVkIGp1c3QgYmVmb3JlIHY4IG9mIHRoZSBQb3dlclZS
IHNlcmllcy4gU2luY2UgdjgNCj4gd2VudCBpbiByYXRoZXIgcXVpY2tseSAocmV2aWV3IHByb2Nl
c3Mgd2FzIGZpbmlzaGVkIG90aGVyd2lzZSkgSSBoYXZlbid0IGhhZCB0aGUNCj4gY2hhbmNlIHRv
IHJldmlldyB0aGUgc3Vic2VxdWVudCBjb2RlIGNoYW5nZXMuDQo+IA0KPiBIZW5jZSwgdGhpcyBz
ZXJpZXMgd2l0aCBhIGZldyBmaXhlcyBpbiB0aGlzIGNvbnRleHQuIFBsdXMgYSBtaW5vciBHUFVW
TSBwYXRjaCB0bw0KPiBtYWtlIHRoZSBkcm1fZ3B1dm1fcHJlcGFyZV8qIGhlbHBlcnMgdXNlZnVs
IGZvciBQb3dlclZSLg0KPiANCj4gLSBEYW5pbG8NCj4gDQo+IA0KPiBEYW5pbG8gS3J1bW1yaWNo
ICg1KToNCj4gICBkcm0vaW1hZ2luYXRpb246IHZtOiBwcmV2ZW50IGR1cGxpY2F0ZSBkcm1fZ3B1
dm1fYm8gaW5zdGFuY2VzDQo+ICAgZHJtL2ltYWdpbmF0aW9uOiB2bTogY2hlY2sgZm9yIGRybV9n
cHV2bV9yYW5nZV92YWxpZCgpDQo+ICAgZHJtL2ltYWdpbmF0aW9uOiB2bTogZml4IGRybV9ncHV2
bSByZWZlcmVuY2UgY291bnQNCj4gICBkcm0vZ3B1dm06IGZhbGwgYmFjayB0byBkcm1fZXhlY19s
b2NrX29iaigpDQo+ICAgZHJtL2ltYWdpbmF0aW9uOiB2bTogbWFrZSB1c2Ugb2YgR1BVVk0ncyBk
cm1fZXhlYyBoZWxwZXINCj4gDQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2dwdXZtLmMgICAgICAg
ICAgfCAzNiArKysrKysrKysrKysrKysrKysrKy0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vaW1hZ2lu
YXRpb24vcHZyX3ZtLmMgfCA0NiArKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tDQo+ICBkcml2
ZXJzL2dwdS9kcm0vaW1hZ2luYXRpb24vcHZyX3ZtLmggfCAgMyArLQ0KPiAgaW5jbHVkZS9kcm0v
ZHJtX2dwdXZtLmggICAgICAgICAgICAgIHwgMjMgKystLS0tLS0tLS0tLS0NCj4gIDQgZmlsZXMg
Y2hhbmdlZCwgNjMgaW5zZXJ0aW9ucygrKSwgNDUgZGVsZXRpb25zKC0pDQo+IA0KPiANCj4gYmFz
ZS1jb21taXQ6IDQ2OTkwOTE4ZjM1YzFiZjZlMzY3Y2Y4ZTA0MjNlNzM0NGZlYzlmY2INCg0KRm9y
IHRoZSBzZXJpZXM6DQoNClRlc3RlZC1ieTogRnJhbmsgQmlubnMgPGZyYW5rLmJpbm5zQGltZ3Rl
Yy5jb20+DQoNCkknbGwgbGVhdmUgaXQgdG8gRG9uYWxkIHRvIGRvIHRoZSByZXZpZXcuDQoNClRo
YW5rcw0KRnJhbmsNCg==
