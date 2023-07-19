Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E18E758E4D
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 09:01:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D33610E3FF;
	Wed, 19 Jul 2023 07:01:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on20721.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:704b::721])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EED0B10E013
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 03:59:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lEfmfBRywW96GIYLg61NU4mKanbdbHfk7y6draQUJU+AXem5MNmggDBXrXmGXl0b+ktjxXA4CBtVX2O1Ht6+4Pq88wfdQ2OdUviHaGXLcvecu6FpJQg9ALgTAl5g/ohyEpYL0FK+ScCIy7tu2If3sIHWlNBULLI/NA5LHqwM1v6etkpnmEulAAjMgKqZepySXGyVTeB2pCtHLqt0GCHT6uwW0rDt3KFprllXQrdH2WIIfCS16sGdzGgc9vAewJ+HUhtiSdSAdrrfSMRT+YTqKiVGhCnEHCJJ2bjX4WowwOTNnv+17gInhJc0Pq72Kv8K323B2wD9gt5RhD9NPfszjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rvtbjvVObiQjz0Op/7r6hiKQvvdM1GmGec838q2cqiE=;
 b=iopwDanuiwO4nM+7W1L83/63hRz3d/0N8OrNKPxWDyMhjtFE2vF25isgGEo0Lb6FUbOEHS7Dsn+Dqzpr+GqXTgpUq8R85lYTYy3E95PFI5Uyo1D7MqKNgJl8LyQg9812xlzW03MwmSKjBpn78EOOY/BBsaYLczAiOYGEH3yvmAUNuG3QaNCdmJC2kYmEXdH5IPcezhpWtg/CHD2v9WkEZEiZA9SGMYEOf0+3K5vHPx0E+a1RT9Xkx+UgILVAse+hn27gGRYh5jdeEYZVK570ja3VJmbzg4A8XVV7QLYfJmtWeCCJH435DaiikOM5BZHb1TKlpQImyqbYxRex6kYdmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rvtbjvVObiQjz0Op/7r6hiKQvvdM1GmGec838q2cqiE=;
 b=Oz7oGW8X/vdgntyiNGVw8CwUo+X0zDkEojFQ748dVYlN5TPqlJQEDp3pqqIEqVmKzjRiaa3PK3lA8A5owaeYHr9UBzHF7Gfax6Fms262KDqZ/sgMJj6MHSAs4v4fpbzBKprYPoLAy+bYXG2oF3WJWhdw4vKTxX0T6SCgQjQkLGjLAzQsuK57xDjKA2tdhjPcUPITNzQGfHkVcxavYYjdL1p+GChqa2pSFHUk1MjY62utnLMLPdZQssRHUavwI31/MhCZf42leGF8uDqpBdvT1n1QlIUw6MXQBe1IobYxbDQz+qu4ogfDMYZor9yDQJlHRknGFwEOYd01q4vNSF6VKA==
Received: from SG2PR06MB3743.apcprd06.prod.outlook.com (2603:1096:4:d0::18) by
 SI2PR06MB3930.apcprd06.prod.outlook.com (2603:1096:4:fd::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.31; Wed, 19 Jul 2023 03:59:24 +0000
Received: from SG2PR06MB3743.apcprd06.prod.outlook.com
 ([fe80::535e:25af:a3bc:d600]) by SG2PR06MB3743.apcprd06.prod.outlook.com
 ([fe80::535e:25af:a3bc:d600%4]) with mapi id 15.20.6609.022; Wed, 19 Jul 2023
 03:59:24 +0000
From: =?gb2312?B?zfXD9y3I7bz+tdey47y8yvWyvw==?= <machel@vivo.com>
To: Hyun Kwon <hyun.kwon@xilinx.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, Michal Simek <michal.simek@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v1] gpu: drm: Use dev_err_probe instead of dev_err
Thread-Topic: [PATCH v1] gpu: drm: Use dev_err_probe instead of dev_err
Thread-Index: Adm59WeYe/bpzU+qdEKMHyTSJmH1lw==
Date: Wed, 19 Jul 2023 03:59:24 +0000
Message-ID: <20230719035912.3227-1-machel@vivo.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: TY2PR04CA0001.apcprd04.prod.outlook.com
 (2603:1096:404:f6::13) To SG2PR06MB3743.apcprd06.prod.outlook.com
 (2603:1096:4:d0::18)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR06MB3743:EE_|SI2PR06MB3930:EE_
x-ms-office365-filtering-correlation-id: fc388129-d680-45e0-f33e-08db880c8a13
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OWEGI0n0kiJlrn+EFYxnEhCzXwVaLCgTEwQa0txVCg6fsW2WtBXoGQ18lVci8WiFMsvMqNxgbcIoU34Lkz81v7gZz14JmjaR6rIaN3FWOUDAMC/LDQTHa6BnhMRTBmIePP4V5M1z4MOW61fzkuueGTaB96I+VRkg2i5kof9bL/lXu8qG9x8D6Ili5TWX7cicKYaGrb0MZkvqh+pWs62KPCHtGUojEMh4bEFwRrFa/ijOGki4F/DmbuZDQyspBhr1QaylRAdZMgUbh/BTHDTclslCRquANIlOuJThJmwVdoX8Pu0mVB/iyJZ7HKoQdnhg3cAfUfIEZeY2O/lJ5FHXNrBbGcrAsgSfamvTP8CqmF417TOykP3KTgdnoej3Cd/NjN9+aF1yReidF0EfHPNGQLHZIh1H+RgqeyqESTqvPbHKXJVJtIfjMXvmfqe4Jc3yCqM73p+MGuQ8BqrMx0wZOLXtlfbyS+ItocEbmm66upSpZ3m5xwxc15ukor1QGHs6BPtwsVC76neohvvgE5CYu/fQ1N/sB45BzEsXpMU1Azx0fYHk2EAvifdi/250xs9ZDv4Y701sQe/zbuVTF6pA8vDOYIph5glv0HyEF2uNCixhp3sttKv4AAf2JUltd4uW
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR06MB3743.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(136003)(39860400002)(396003)(366004)(346002)(451199021)(8936002)(8676002)(66446008)(66476007)(66556008)(64756008)(41300700001)(6512007)(52116002)(6486002)(66946007)(316002)(5660300002)(4326008)(110136005)(4744005)(54906003)(122000001)(85182001)(36756003)(71200400001)(2906002)(478600001)(83380400001)(26005)(107886003)(6506007)(1076003)(2616005)(38350700002)(38100700002)(86362001)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?cXhEV3ltWDRGY0V0Z2xtOUxHaGdHbGpjbGVDR2pnZnQ4SHFNWkpOUktLUFlu?=
 =?gb2312?B?TkdzZ0FBOTdUT3hnejNDRmxQOVpKY3diSkVmNWFhM2w5VGVFSTFKcnJlRjNT?=
 =?gb2312?B?elVRN3dsczQ1ZS9uc3RRQzZVV1F2R2FUZ2xjdDBwbG45WDFtVmZOL0ZSK242?=
 =?gb2312?B?d1FlbGM2ZHNsNXRnZmdwUDdYcEpvTGpCN1BSaXRjVDR1S0dvLzJUN1NlbmEw?=
 =?gb2312?B?clZwdjI3U1NNd3Y4cU5lSFA5OTdtRUxkNGZMYVpwdWtEL0tsOWR6N3JaNm5q?=
 =?gb2312?B?VTdIMlNzdjdYUlAza2xNUElHbTVaV3gxWTJEajBydjJJZXNEaW85ZzlhZG13?=
 =?gb2312?B?ZHdXQjJDRUZXTFY4S0haNnRNSWU1ZDNERStqanpKZnhiQ1BjWk9mWThqZ3c1?=
 =?gb2312?B?aFJqcTBzQzM3Y2dDQVpuTFZ2bDB5OEU0VWRmWmQ2aWcrMm4xbWZUYUo1M3Qz?=
 =?gb2312?B?ODFHOXpOY1ZKQkIyTWNCVVBVdlMyUTVROVdjMzQyVmY4K3kyMllveU1NamZ0?=
 =?gb2312?B?ODZpTGtVYjNwYTZCVVFXZWVYeEdua1pXSXdmVXo2TDJscDRrWjhUMHd5Zk9p?=
 =?gb2312?B?ZFFwbXM3cllYVGt1K2N2aUtoRGRVZk1OVnB0TkdNYjcyVnllR1VKVWh1aVB3?=
 =?gb2312?B?dnVOUFlRRDVrTnFYVFhmUU1vYUFwdm1reUZsdEMxN0dzS0xXSVZwQVl0VUto?=
 =?gb2312?B?QXY2Sjg3czJEc0l2emVQdWZTWGVHN0JlWUFVdi9RMGVQdytjODVHYklsRmJx?=
 =?gb2312?B?K0JTQ1cxektFcWFGQWJCSzFvV1VIOHM5MkRGUkhiQ2t2YWhLYXNiUS9rMnFs?=
 =?gb2312?B?dHdKWnY0bVFRclRZZW5Sc2NQWXF6aWc2UDVpK2U2VC91WENkK1NHOEQzV0tU?=
 =?gb2312?B?QnIvMkxMWkZ2aUwzN0ZnRTFLVGUzWjNjd0F6bUdNWnNCeDdDbDBKSkJJK3RS?=
 =?gb2312?B?UXJUdkxGTjRNNHZyWmFnSkZ1MTlmSDRpaFRaOGdxbDY1NDhUckJCUkdiQTlz?=
 =?gb2312?B?aXdieGc4VjBXRjlKMmRCWWw5OXdFdXQyQS8wZGFSL1FGd1V1SmtNZS80M3pm?=
 =?gb2312?B?V0I1TnRGcmZnaTBRbjhRK1I0Y2RIZDE2bjNDQUxGaXFLVW1Zd2ZROWlIS1JR?=
 =?gb2312?B?ZFpYMlB2Z0pnRDQ3R29xSisxMElQNGlTd016aUw5OHBOOWNJM2ttQkdIVzdE?=
 =?gb2312?B?dXF2ckV0aSttbmowQTFNcXZkMFFYcm45cFVBa3FoaVd4cDlBVlRSajZuSE1l?=
 =?gb2312?B?RE1Qc1ZJM0F6dG9Dakt1VG5aVmtxRk1OWjUyTHJ5b0tQOGJuUEE2SFR1M2Vq?=
 =?gb2312?B?TExBa01JOHhUdVJabGk4b05LejBLczZ5NEUvS3ZaaFlOTFNDQ0Vrb1I1YkZX?=
 =?gb2312?B?MGJGaWVJRzJaNEVsREROY0VuYkw5Nmp0YVBWSE1TekVFY0ltWXNlMlNCSE96?=
 =?gb2312?B?SmN5RVg3bVhpWStheWNrREtmSG1NN081L0REbTNqalBQZXpDV0s2d1F0RUlV?=
 =?gb2312?B?cXBXRTJESWtEV3BVOU0wVzBzbjNXdGFTUmNqK081ZStMU1d5Y1RrazJUbThG?=
 =?gb2312?B?aE9Sek9ZWmhHcGhaeVZTa003QWh6bXA1ekJwb1NaamF3MEJWTEtMOHVhdHNR?=
 =?gb2312?B?VVM1NDhmYUxPbzUzRGJCOTJKaVZDbzJMZUhvR0RXalVLVFNIWkE1WkUwYkdC?=
 =?gb2312?B?NEMwOGpWR21wYnp3V2cva1dSSGkvTDhvM1c0Y1lPem1Tckoza2dvME5hK0Mr?=
 =?gb2312?B?Sk1KckFtM0tSN1lDVkVhVWx0TlNNT1hBMmljcjRUUVZSVUpOUVllSHhTUXBn?=
 =?gb2312?B?c1hZNytSRGpRL01uU1h5YmltdnpuOFc0cmtsb3ZwU0RoOTJNdkRLVnFHWEtu?=
 =?gb2312?B?c1JOWjhZS3hRemtNQnY3Y1ZpaFdKQ2llWlk0RDNjSXFpRzc2QWlCdG5zQ3Z0?=
 =?gb2312?B?WU1mTW5icGhqRUhqbHhRUk53QWtPUUNYbi9CQmZuR055eVpranp0YjJyM0xO?=
 =?gb2312?B?UnRoTEFIbUZ3cUlRVWM5S3ZBdlVjZGk2U01EWWNFdnpqamdJNVBtZGlVbWxh?=
 =?gb2312?B?NTlVUnZFdTU5S1pESFh2Tk9jQ3BRanMrQkxhSFRoN3FuT1FTSHErUmF1djd4?=
 =?gb2312?Q?LTheUNuzAnNcpQIaK7SDH4R6k?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB3743.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc388129-d680-45e0-f33e-08db880c8a13
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2023 03:59:24.0371 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fzoIvItmrslQYb7m0R3UAfzqHR10uG5kWwItjV3zhBhBIJ8NGTa8UJKbnWnCwb3IHGOwE6IR4vsFM5vDlSEoXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB3930
X-Mailman-Approved-At: Wed, 19 Jul 2023 07:01:14 +0000
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
Cc: =?gb2312?B?zfXD9y3I7bz+tdey47y8yvWyvw==?= <machel@vivo.com>,
 "opensource.kernel" <opensource.kernel@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SXQgaXMgcG9zc2libGUgdGhhdCBkbWFfcmVxdWVzdF9jaGFuIHdpbGwgcmV0dXJuIEVQUk9CRV9E
RUZFUiwNCndoaWNoIG1lYW5zIHRoYXQgZGlzcC0+ZGV2IGlzIG5vdCByZWFkeSB5ZXQuIEluIHRo
aXMgY2FzZSwNCmRldl9lcnIoZGlzcC0+ZGV2KSwgdGhlcmUgd2lsbCBiZSBubyBvdXRwdXQuIFRo
aXMgcGF0Y2ggZml4ZXMgdGhlIGJ1Zy4NCg0KU2lnbmVkLW9mZi1ieTogV2FuZyBNaW5nIDxtYWNo
ZWxAdml2by5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0veGxueC96eW5xbXBfZGlzcC5jIHwg
NCArKy0tDQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkN
Cg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94bG54L3p5bnFtcF9kaXNwLmMgYi9kcml2
ZXJzL2dwdS9kcm0veGxueC96eW5xbXBfZGlzcC5jDQppbmRleCAzYjg3ZWViZGRjOTcuLjY3NmYw
OWZlODU5NCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS94bG54L3p5bnFtcF9kaXNwLmMN
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS94bG54L3p5bnFtcF9kaXNwLmMNCkBAIC0xMDk0LDggKzEw
OTQsOCBAQCBzdGF0aWMgaW50IHp5bnFtcF9kaXNwX2xheWVyX3JlcXVlc3RfZG1hKHN0cnVjdCB6
eW5xbXBfZGlzcCAqZGlzcCwNCiAJCQkgIiVzJXUiLCBkbWFfbmFtZXNbbGF5ZXItPmlkXSwgaSk7
DQogCQlkbWEtPmNoYW4gPSBkbWFfcmVxdWVzdF9jaGFuKGRpc3AtPmRldiwgZG1hX2NoYW5uZWxf
bmFtZSk7DQogCQlpZiAoSVNfRVJSKGRtYS0+Y2hhbikpIHsNCi0JCQlkZXZfZXJyKGRpc3AtPmRl
diwgImZhaWxlZCB0byByZXF1ZXN0IGRtYSBjaGFubmVsXG4iKTsNCi0JCQlyZXQgPSBQVFJfRVJS
KGRtYS0+Y2hhbik7DQorCQkJcmV0ID0gZGV2X2Vycl9wcm9iZShkaXNwLT5kZXYsIFBUUl9FUlIo
ZG1hLT5jaGFuKSwNCisJCQkJCQkJCSJmYWlsZWQgdG8gcmVxdWVzdCBkbWEgY2hhbm5lbFxuIik7
DQogCQkJZG1hLT5jaGFuID0gTlVMTDsNCiAJCQlyZXR1cm4gcmV0Ow0KIAkJfQ0KLS0gDQoyLjI1
LjENCg0K
