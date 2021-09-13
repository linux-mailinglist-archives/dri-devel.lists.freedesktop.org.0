Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8292D4082DB
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 04:35:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 300FA6E0D1;
	Mon, 13 Sep 2021 02:35:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2042.outbound.protection.outlook.com [40.107.101.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A615F6E0D1;
 Mon, 13 Sep 2021 02:35:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iX3Z0XaUK8InQuiF8SlRnweU3zp1wIblnt/JAeQHqgtk0KJXc96YiR2Fc3H/sX/E1EiSg3XsQXUt+Ure4zFlDIV5SLRJJkp0aIPHkNKUDbGs2+46I/6Cu0FaFvMqpUnxCBJt51ZlanPEv64Q6yReSxShHnGYDa8btSFtZAz6kf2XHkClKgPsTP7B//Kcq0zhgfnvv0EbTyIRgUsdA6gkurlHEhgMD3Djm2+5pPhGlC2vIf8IgrBmTv1oqCPE4t1i5s3wCawakVZNXnFOv2PhliB2hXfCBVvnMbt5Wg5rXY9H9f2+oGUgkpG3iCP37Ux2HwNrgNURnOnp9Uu28M2gzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=uinZxgx1AsYZsOp1hG0BZWGM8n/HZaqGfmSsmPEvLMg=;
 b=fWyvUoXwdf4bsxs6iRYheR1tapDp8zG7n14OcNkotzTLbLwjNTavIxt7IK8ANBEK5kj37OWWeuhsOCVZ7F8+58oUK7DJHkLc8M5jpuIlW+prBp47aoqRHJdvPPZg8Loixi73M+1J+PajzR/78CiGtujnfU1WOia4ukHkm8faSt6S5yuNJejOfiA/9izEN4LOrAPKihOlyHke/WQF3dZytHHA7Dg4oDXq4nfXgNRMjGgnw/2+gp3h6K1dRMwJZUU3IXOwesz5DwvrTkqpTgC7KO0FmqZQSTiPvoTBlTXimv5BsIhPPxSrIaDDOMdB7qP8oE1zdc5OpmOIVO8X9dwZuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uinZxgx1AsYZsOp1hG0BZWGM8n/HZaqGfmSsmPEvLMg=;
 b=d/j1ndAxP2JtAyHBO+LahI8yUe1DR4XZYp0iyMxd9YchU9FhGXysqOikcyWkt2LihReim44Vuaj3oiNxLJ5SalWBchj04lk4eFXLzti+s+4V15/ZjA0OGIfUIiMPq2015906TtpHXTDOCX2RdJzj5XZPkhlkd/mcOnjjsW6ONxY=
Received: from DM5PR12MB2469.namprd12.prod.outlook.com (2603:10b6:4:af::38) by
 DM5PR12MB1707.namprd12.prod.outlook.com (2603:10b6:3:108::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14; Mon, 13 Sep 2021 02:35:20 +0000
Received: from DM5PR12MB2469.namprd12.prod.outlook.com
 ([fe80::54e5:e9f1:8883:e8a9]) by DM5PR12MB2469.namprd12.prod.outlook.com
 ([fe80::54e5:e9f1:8883:e8a9%3]) with mapi id 15.20.4500.018; Mon, 13 Sep 2021
 02:35:20 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: Robin Murphy <robin.murphy@arm.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
CC: "Shi, Leslie" <Yuliang.Shi@amd.com>
Subject: RE: [PATCH] drm/ttm: add a WARN_ON in ttm_set_driver_manager when
 array bounds (v2)
Thread-Topic: [PATCH] drm/ttm: add a WARN_ON in ttm_set_driver_manager when
 array bounds (v2)
Thread-Index: AQHXpiv5hGTadLT9Q0ugHa4Gp+RaAqudleQAgAOtfSA=
Date: Mon, 13 Sep 2021 02:35:20 +0000
Message-ID: <DM5PR12MB2469C78183CEFEF7FDBE7B72F1D99@DM5PR12MB2469.namprd12.prod.outlook.com>
References: <20210910100922.12097-1-guchun.chen@amd.com>
 <868cab56-607b-bcc8-e358-b2475315f862@arm.com>
In-Reply-To: <868cab56-607b-bcc8-e358-b2475315f862@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2021-09-13T02:35:18Z; 
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=51182e49-8c38-4a73-ab79-0e463a11e3b2;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
authentication-results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 701151b8-e98d-4e13-966d-08d9765f2152
x-ms-traffictypediagnostic: DM5PR12MB1707:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB17075C37C16CE097396E7ACEF1D99@DM5PR12MB1707.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uCPJpVLojReguKZucoxNAO73wbZy1rFXMp0mVD30RYSO89fMMztmprgJYn6gOj7QCQajeaqK4LyUe1XTnyEbsDaw+O/FZGpk4gfNepv9dnqxisrvIDzBkUJXjq2mhEJc0Ew5FQNRdYUbLAxC8shjhjrSKkTQDOou45nm4gh1ew6hAmJLCN6jSr9srWNEiVgghYe/o+gGsQjyyDipgB5s8UzyXF2CFzMO0RCKU/OA25nyKGBhodvDSYAYKRsKhgN/j0URUOHwyb1jzzrTjCwtsh7j27PQTSU6wAN3mpo2Pi7sEIMTdgxBjyySDoQVwMoWEHQrTnj6Djckm7X/6GL4ba4QrAnTo+jqC3k0VA3L0ajX4/9ZmmeQWsysxTKIsExE2O8W4Bao/IXQEAX583t7AkbHCyzbmyl9n+ElcF1Jm3VTH01MBFAvTUNlPILeBGbXV4mSdi8Mk7ldjdjIJo7xfjdNPbk8BPSYbloJqVFIbB0vQlYfS4g6eSAtXQ4RIAhxz5XAWdRd/xUi65/FsAESd41qJMhyT5s3p1f3OX72gJX4yf5uD9Aqgi6tW802faYoedPafB72ewT98U30DXQj0nFNEchzxxI11+N7ZvOkm6NSoCU5bi310MorgOQHN5LbYTqveLP5//OECNr8TZE05r07XBbsClv94oy20dym31zMwhU0zbOeOCkkMK3VNRLkIISw0Vwx+IZ0u2yiPqWzcg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB2469.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(366004)(376002)(39860400002)(136003)(5660300002)(478600001)(316002)(66476007)(66556008)(6636002)(4326008)(66946007)(66446008)(55016002)(71200400001)(64756008)(86362001)(38070700005)(2906002)(53546011)(6506007)(186003)(33656002)(122000001)(52536014)(8676002)(7696005)(8936002)(110136005)(26005)(83380400001)(38100700002)(76116006)(9686003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R3dwdVc3aFBPVnRqQTlGdUdGUi8zUUJNQWdKd21UMkpzOEgyamRtMVVEKzBJ?=
 =?utf-8?B?MjA4QjNqYlhVOTlrN2RuVmNDUVVNQndhVWZ5anc4d3VnbmZqSVIwdTRXdFJG?=
 =?utf-8?B?TWxsdFQ5ckNyRFFPWHJ4dmFzdmp4NmxZZDVyR3QyWGJkdFdLbTluWklvU1hu?=
 =?utf-8?B?WmVCWTJUdjJBQ1RoejgyV1BTYTFRMW5LQk1rS3J6THZzTFdBWlJ0blFVZHRm?=
 =?utf-8?B?a205RGdrQUhSTFFud21GQkNtc0lpd3dZeUd4YzZEdzIyYlZ0dEZMdHNlajlW?=
 =?utf-8?B?YUZOSlB5SFEzd0tqNnFWakNFSGNzMFdwRzRoNDVnM2ZacnJFWU5SbkY1YTRs?=
 =?utf-8?B?Zy9qSHhKbStSOU91ekViRzlqM2VqTkZ6ZVNZRDR2TDA3TVZaUmpXeTk0RVhj?=
 =?utf-8?B?dndBOHB2Z3ZyY3luMzJRa3RmKzg4VmJrMUlCT2R1SDAvOHBvZHYxVDl0cWFH?=
 =?utf-8?B?Tjg2ZktHMXhSZUZ6T1dSckxxQUE5OGxERENIc3hST1lrNTdIalN1K0RicVZB?=
 =?utf-8?B?TVZqR0hCbWV0OHBpUmUvc1ZtbUhxWHg5ZDEzeUJBcUhZUVBCelNLZkFYK1Fq?=
 =?utf-8?B?QW82elRZNHJXRFdSbTdNQXZsNFdUWmlIUjlBREYxWGR2U2E2c3JYMnMycTlT?=
 =?utf-8?B?WUtCaTZrSk1qQkxSazN1NUlpb3hpeDIwNVdRblBxNVpWOXlQRHE4L3JjZjZs?=
 =?utf-8?B?MUF0Q28rSWVWWXJ5Ulhhd0szRXFoUU5hdG1zZUdIWXdDRTNUbTZoOURTL3Yz?=
 =?utf-8?B?UHpCNTIrN0tNc3ZpZEpCKy9SV0RsaG9uanloajc5YXVoQWRYOHZ4Z2QvUmJ6?=
 =?utf-8?B?bjBQWTIyd2hHMWNFdjhhWnNUUmhscmxzR2d2Ym5rcElZS3dBc3JneGRrcjVB?=
 =?utf-8?B?ajBSZnhkenNwZjd6TVc1RTRNN3ZtaHpMVFZWU0FDdFpFQlFzM2FJUTgwdE5Q?=
 =?utf-8?B?VVo0dWtRdXV0dzNiWjBSUndpUmxYY2swTWkrdytwS2NGN2VPcndFcHpDZytR?=
 =?utf-8?B?K0xrVVdleE1WS05BWHRiSVdRWWhaUmJkN2thV1UySmtvbmtXSlB2NDVFS3pG?=
 =?utf-8?B?YzZoWEVsb2s1Z0hROVdZWlFvZHU3K2t2NFBJck96dml0R2JKQ1pxSmVxZE9x?=
 =?utf-8?B?L3pOSUhyTkpSbDUwRHFrUHVlVmZwdjI1aUcxS3ZJUGRqY0xYS0EvcnlBVW5m?=
 =?utf-8?B?ZnR3MitCL1ZzdnN0WWRwUnV6ejVZK24xUnFkdlc4QllPYjFvRzk1dmpReWh2?=
 =?utf-8?B?L3dkQmFsS2pGMEQ0L0UyQlFUY3VlMWp1QTBsS3IrUEJ2azREdnBoWnMwNndT?=
 =?utf-8?B?WU16QzdTaGtvcG9RQ09ML0tHaTVCak9aUU8wZ2psN2ZHS3FBckNaOVEwM3dV?=
 =?utf-8?B?amwxZm5GNkJwbWNFSjdnbmZESDdPaWt0T29MOHFJZG8vK21uVmhNK2c0R2Z6?=
 =?utf-8?B?UkE4Q3BCZzd1SThJaFQ0cExmUkxRbmVOM3djcU5QV3V1N1VxZEtQenFxUlhR?=
 =?utf-8?B?WXZKRG5SRGNuQlN4MEZSRVV6TjVQRGxsc1p2ell6VjY5L0xZQjJtWkIzOGdQ?=
 =?utf-8?B?MTB5SDhYWHNMeHRXMHI2R1hNdGxCMFB6SmIwRGxsaFhxbEg3ZVltRjNPS1Fh?=
 =?utf-8?B?T1ZNVHlrRktYTEJkZUlxa1RIRzRteHo0ZWVxemRTd1hBbng1cVB3TEN1KzY2?=
 =?utf-8?B?T0ZoZnE4RVdTOTV6bnlEZWthMnhPb1F4dmRrbXZpdkRRL3JDVmN1Yy9rN1Ir?=
 =?utf-8?Q?83HJZEl0lqczgfRfL9u8QyiOqBKI0z+vUD5OV0+?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2469.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 701151b8-e98d-4e13-966d-08d9765f2152
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2021 02:35:20.0628 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /XJTB5d1sPsVuf5Wph69tTu8y465ldTYza4Qy6kyNcrzN+5+XR9QnkJ09fpTbd7A/0b2FszlUc8HBQk6LE0rGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1707
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

W1B1YmxpY10NCg0KVGhhbmtzIGZvciB5b3VyIHN1Z2dlc3Rpb24sIFJvYmluLiBEbyB5b3UgYWdy
ZWUgd2l0aCB0aGlzIGFzIHdlbGwsIENocmlzdGlhbiBhbmQgWGluaHVpPw0KDQpSZWdhcmRzLA0K
R3VjaHVuDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBSb2JpbiBNdXJwaHkg
PHJvYmluLm11cnBoeUBhcm0uY29tPiANClNlbnQ6IFNhdHVyZGF5LCBTZXB0ZW1iZXIgMTEsIDIw
MjEgMjoyNSBBTQ0KVG86IENoZW4sIEd1Y2h1biA8R3VjaHVuLkNoZW5AYW1kLmNvbT47IGFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
OyBLb2VuaWcsIENocmlzdGlhbiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPjsgUGFuLCBYaW5o
dWkgPFhpbmh1aS5QYW5AYW1kLmNvbT47IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRl
dWNoZXJAYW1kLmNvbT4NCkNjOiBTaGksIExlc2xpZSA8WXVsaWFuZy5TaGlAYW1kLmNvbT4NClN1
YmplY3Q6IFJlOiBbUEFUQ0hdIGRybS90dG06IGFkZCBhIFdBUk5fT04gaW4gdHRtX3NldF9kcml2
ZXJfbWFuYWdlciB3aGVuIGFycmF5IGJvdW5kcyAodjIpDQoNCk9uIDIwMjEtMDktMTAgMTE6MDks
IEd1Y2h1biBDaGVuIHdyb3RlOg0KPiBWZW5kb3Igd2lsbCBkZWZpbmUgdGhlaXIgb3duIG1lbW9y
eSB0eXBlcyBvbiB0b3Agb2YgVFRNX1BMX1BSSVYsIGJ1dCANCj4gY2FsbCB0dG1fc2V0X2RyaXZl
cl9tYW5hZ2VyIGRpcmVjdGx5IHdpdGhvdXQgY2hlY2tpbmcgbWVtX3R5cGUgdmFsdWUgDQo+IHdo
ZW4gc2V0dGluZyB1cCBtZW1vcnkgbWFuYWdlci4gU28gYWRkIHN1Y2ggY2hlY2sgdG8gYXdhcmUg
dGhlIGNhc2UgDQo+IHdoZW4gYXJyYXkgYm91bmRzLg0KPiANCj4gdjI6IGxvd2VyIGNoZWNrIGxl
dmVsIHRvIFdBUk5fT04NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IExlc2xpZSBTaGkgPFl1bGlhbmcu
U2hpQGFtZC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEd1Y2h1biBDaGVuIDxndWNodW4uY2hlbkBh
bWQuY29tPg0KPiAtLS0NCj4gICBpbmNsdWRlL2RybS90dG0vdHRtX2RldmljZS5oIHwgMSArDQo+
ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvaW5j
bHVkZS9kcm0vdHRtL3R0bV9kZXZpY2UuaCANCj4gYi9pbmNsdWRlL2RybS90dG0vdHRtX2Rldmlj
ZS5oIGluZGV4IDA3ZDcyMjk1MGQ1Yi4uYWE3OTk1M2M4MDdjIDEwMDY0NA0KPiAtLS0gYS9pbmNs
dWRlL2RybS90dG0vdHRtX2RldmljZS5oDQo+ICsrKyBiL2luY2x1ZGUvZHJtL3R0bS90dG1fZGV2
aWNlLmgNCj4gQEAgLTI5MSw2ICsyOTEsNyBAQCB0dG1fbWFuYWdlcl90eXBlKHN0cnVjdCB0dG1f
ZGV2aWNlICpiZGV2LCBpbnQgbWVtX3R5cGUpDQo+ICAgc3RhdGljIGlubGluZSB2b2lkIHR0bV9z
ZXRfZHJpdmVyX21hbmFnZXIoc3RydWN0IHR0bV9kZXZpY2UgKmJkZXYsIGludCB0eXBlLA0KPiAg
IAkJCQkJICBzdHJ1Y3QgdHRtX3Jlc291cmNlX21hbmFnZXIgKm1hbmFnZXIpDQo+ICAgew0KPiAr
CVdBUk5fT04odHlwZSA+PSBUVE1fTlVNX01FTV9UWVBFUyk7DQoNCk5pdDogSSBrbm93IG5vdGhp
bmcgYWJvdXQgdGhpcyBjb2RlLCBidXQgZnJvbSB0aGUgY29udGV4dCBhbG9uZSBpdCB3b3VsZCBz
ZWVtIHNlbnNpYmxlIHRvIGRvDQoNCglpZiAoV0FSTl9PTih0eXBlID49IFRUTV9OVU1fTUVNX1RZ
UEVTKSkNCgkJcmV0dXJuOw0KDQp0byBhdm9pZCBtYWtpbmcgdGhlIHN1YnNlcXVlbnQgYXNzaWdu
bWVudCB3aGVuIHdlICprbm93KiBpdCdzIGludmFsaWQgYW5kIGxpa2VseSB0byBjb3JydXB0IG1l
bW9yeS4NCg0KUm9iaW4uDQoNCj4gICAJYmRldi0+bWFuX2Rydlt0eXBlXSA9IG1hbmFnZXI7DQo+
ICAgfQ0KPiAgIA0KPiANCg==
