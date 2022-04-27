Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4795C511841
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 15:23:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B92BE10F46B;
	Wed, 27 Apr 2022 13:23:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo-csw.securemx.jp (mo-csw1515.securemx.jp [210.130.202.154])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4234610E624
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 13:23:43 +0000 (UTC)
Received: by mo-csw.securemx.jp (mx-mo-csw1515) id 23RDNYA9005725;
 Wed, 27 Apr 2022 22:23:34 +0900
X-Iguazu-Qid: 34tMJGoc0hHKgAD4hF
X-Iguazu-QSIG: v=2; s=0; t=1651065813; q=34tMJGoc0hHKgAD4hF;
 m=2/ivpiD/7ryG8qAC8FUZas4cfnutHRan4t2UqiULtAA=
Received: from imx12-a.toshiba.co.jp (imx12-a.toshiba.co.jp [61.202.160.135])
 by relay.securemx.jp (mx-mr1513) id 23RDNXUF023220
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 27 Apr 2022 22:23:33 +0900
X-SA-MID: 3264107
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jicNshlJSQJPX7Y9a/4OzQ7W3MXCtJfxcoYPa6ZPexCw/grQSu1BGMALMdQL3l6Fjdy8D/oNvLcMhF8UBAcLGleuQyPEwH5ncqCQk2K4zMP2xYX+snCdUBIXTNcAdVJD3xiscXWEIzy9TmbcojTT7VVccioBAyLbSACu8UfG0QmNQ+vMQdUVi81e8wmc7oCDTXNxwdMwQoeRKJ0vKjJBtVgTX3RRiPh6uKSSP5ATqln9PYgI6nyr0iqdKHjGLWP2mTnQExtpUiFnMgCddirLXYb0qZ36IFRb0TrINbeN/OM+T21JWX1LaIq1Bt3sSTPSSQXxHfhb4vZDPt8qJRa8qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EPXB218+UcoMUbijsI82RfK1dl7VopUavpDmfm41Zjc=;
 b=UX6htoGLzVDoG52njwtNd9+4G1+vMAU/Qj6bj2GuYGmuZaYsk8ojpOy+RMBNiM3HRx55V9qzx8f5raupJZqoiUBPKtK4TO0WZzm7/aYgbSoO2GJbeHspo80+wnjDGZt7DJtDvv92RXL49E1a/ey97M6+DCYIqCZl/sEzNnHx1Zu0OM86m8zt3qZgvlQ3vKc5C67kcacqUyNgbl1J3YYB3bw20uQvX0nuqCi/PN/ih67xZd+fhFLh2NvCl4FGdcVHO2KXJO0PnoTO7vMpMxjPTWkQdPuxPdLYDiqSLtCKag5Gnkd/uquOJ+tURFeLSGYZ+1q+RgAlktRVcWx4qa8gOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toshiba.co.jp; dmarc=pass action=none
 header.from=toshiba.co.jp; dkim=pass header.d=toshiba.co.jp; arc=none
From: <yuji2.ishikawa@toshiba.co.jp>
To: <yuji2.ishikawa@toshiba.co.jp>, <nobuhiro1.iwamatsu@toshiba.co.jp>,
 <sumit.semwal@linaro.org>, <christian.koenig@amd.com>
Subject: RE: [PATCH 0/4] Add Toshiba Visconti AFFINE image processing
 accelerator driver
Thread-Topic: [PATCH 0/4] Add Toshiba Visconti AFFINE image processing
 accelerator driver
Thread-Index: AQHYU734mrSY9J8hmEWKaI6gNyAMra0DyuJg
Date: Wed, 27 Apr 2022 13:22:43 +0000
X-TSB-HOP2: ON
Message-ID: <TYAPR01MB6201138A7038DAB83DE0F77792FA9@TYAPR01MB6201.jpnprd01.prod.outlook.com>
References: <20220419072018.30057-1-yuji2.ishikawa@toshiba.co.jp>
In-Reply-To: <20220419072018.30057-1-yuji2.ishikawa@toshiba.co.jp>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=toshiba.co.jp;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f1ae6964-1459-495e-a8b2-08da28510311
x-ms-traffictypediagnostic: OS3PR01MB5943:EE_
x-ld-processed: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f,ExtAddr,ExtFwd
x-microsoft-antispam-prvs: <OS3PR01MB59431125D3842939348A60C892FA9@OS3PR01MB5943.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1+f9W+rtcwWtBLRs9+rdKGP/siOqapA5MOeEA/6BROPqMiTmG4S/5HDBuvM6b/ZXv+rg9J+1phDdx0TeMshXd/IEY4iIKEyiHlDtC+kJCH/g2n45mYP332Eebph6YIRQw6SdQhzHqv/RdtWnV+xzK5PsUhCVP9wOciISpzxZQSVaoBze47seul2kXXq2hAmxlx48flfu7NTaIbblChMoBpbWVkmYXu70+sEIXRy4fTromOloPm4OjxiZNAWFafY+W8GxxVh59CrjbeVPjTpCFmqWGQsuduEUd0a2glu5i0pLjNhH7WidaHqTMUewM6rVuF8lVRFK94STsahFl7US+M9vYLXm7XtFCAK/7PaT1UouhQDmRaYOyUZ1tFz2M90aWATTXXX1iXXXC1Ag8rZJUPKvtlGxIm2Iev+ceZoPUhbRXtqA7jJvUlpkpIlg6gumXqX8pDaFUps2LZLCisfoH234Uh/P7QaT8K2GquNRcmbqD9kgQsc/ZlYqb8EKupQnWPHE0zEEcyEpo8VVCJcxGQMdUWUPyu/li7C9hisk+3M9uqoeYkazfrqE7agmPtJHT8JH06scuu3kH+iOikJraMsKeG7J1rNN/OMu6znJPwUSLuv5SVkvqdeZWYN9tKPFKFv5te79/FkY1GLj52Dsf6B4ec2hqt3d4Vpepw5qN1wrcjq/OttYjgqPmOZIctBuevK81s61AnSykNmXtPRvEZC/uuIm6u1R2WD6lpJkg4OKbqKJYvgVMRoPcPZdsmUR+hJaeRZsMQZmoHgeA09XwqEiO3W7p+m8FJlFzt7aDLs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYAPR01MB6201.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(33656002)(55236004)(8936002)(38100700002)(38070700005)(66476007)(66446008)(8676002)(66946007)(122000001)(55016003)(66556008)(64756008)(52536014)(5660300002)(76116006)(71200400001)(4326008)(26005)(7696005)(9686003)(53546011)(66574015)(6506007)(186003)(2906002)(83380400001)(966005)(508600001)(54906003)(316002)(110136005)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZlRHbG5yUTAxL3RuOWxiU1ZzUFY0VjZEdzJtMlRNTU9Za3R0MVlCRnl6cit0?=
 =?utf-8?B?T2pGUU9oZDFCalhqYjZ2Z3lTdzR5RmFDZWlEVjVSNmN3MnNmMm5TSXhDeHov?=
 =?utf-8?B?VS9BTGlralRHK0h0eTFZV01MbjNYMVlrampmcGE1dEhiNlYzNmJwM2VId0FK?=
 =?utf-8?B?WHVIamJTWGZROWJ4b3ZkUWtaa3lqUDU3U3YrZHBGeDhBUmIzTHBNVXEvYmxq?=
 =?utf-8?B?ZFVQWjVyTU5aeU9SRHFYNC9OU0FsLy9wSHF5RnB3Y1RraGo5VE85a0ZxaTdH?=
 =?utf-8?B?dG5xSHlsNXJoSDY4d2NueEFJRlpXY0x1MmE1WHBybDRxUFdZcGVUbHMxUjZP?=
 =?utf-8?B?em5rRXBFUWdLYXNkTDFhKzV4V05ZRkh6dTgwZDBCN0czWmhURHNLcU9pZ2xT?=
 =?utf-8?B?M1NMQS9QbUs0OUV2ZnJEU3FtUkYxcExxeUVpNi9XN1drbWdqcVpXSEp0NXZU?=
 =?utf-8?B?YzZEakx4b2pGNnJEYjlGdFhISFNqbCtXT1FiL3M3Uk5PcXFUblduc0xKNFJI?=
 =?utf-8?B?QlpmVWhkMEVVQ3k5OUZISUhSRXJjREJiK2ZSdFZRdzFxKzBQS20vMU9SekhR?=
 =?utf-8?B?QlhIWlBWVDY2RmVsaHhtZUpvc25SY1dKaTdER1B4MzFmQzMrV3J0UlBnMm5V?=
 =?utf-8?B?b3dTcmE2SjE4aXRDMjZ4YXdJZUgvSVlQbnRrSUgzWDk3LzBFUTlpV2lzdFRj?=
 =?utf-8?B?WDV2OGJuUFF3cEZtZUdWTFU2Qk1XNlUyNllqemVyRXFTSk00TFBMd3ZhM3RN?=
 =?utf-8?B?ZXdLTXQvMmVYN3BWVHRNaStaWGdnWUllcTlZUkUzQWxsK0Z2bHYrVU9UeWlU?=
 =?utf-8?B?UGRuLy9DTnZCZ3k4bHh4UXFkakR2dmxSU0RNTjdBVTcycGhrQm9LY0FtSGQy?=
 =?utf-8?B?SGZhWjNFaWNVb1FlNXRaMFlJbENEck5rK1ZaaHltYzYxVTI2OXdGWmtsbGdu?=
 =?utf-8?B?N1V2T200TDFXMXhqYlVodUVkdWhSekdhREdVRFNXUmk4czZzU2dONnlSeVVO?=
 =?utf-8?B?bnZWbFVpNlBBMEdUdVVJZEZpOWpLcUo4WGd6czZOWWhvaE0zQU1PbUNHd05U?=
 =?utf-8?B?cWhST2xRQk5odzV2UGV5T2txOSsyNGp4S1RSNnlUcUlmemFEYVRCSStNUUpZ?=
 =?utf-8?B?Q1YwWHNUYlJkbHY1eEk0NU91dW5XVUhlNDNMa2hlRDg1ZU9PcUFxTm9xMVVi?=
 =?utf-8?B?RWR5RWtBTXh6SDI4WlVOdDRRUTdRemJ5eXhxM1prL3FTa1REZVZRTlJqQ3h0?=
 =?utf-8?B?NDVCZXZtN3JCUUtXbi9WL3RTS3hVNkdEMkpsK1F6ZXlaRHFmdHZuMml4YmI4?=
 =?utf-8?B?dUJybERRa0ZzYlFwZFVCSzFCZnd5Vi95aFBxZENhTWtSWjBRNHNZUjBkZW4z?=
 =?utf-8?B?MU1uUjQxOWEyQUx5amVoQ1NqSWc0dVFHQTZoL3V5WFRwWEl5WlViZWpITG9D?=
 =?utf-8?B?Y3pDVERDRWF0UGRGd1J2R2tPMHptTkdLYklRalQrcEd0WVhpUkZldi92ekxk?=
 =?utf-8?B?aTY2RkxlVnBIVzkydUoyNTB2N3ovaERUNXA5TGFFd0JpN0twQ2ppc3FRU1JF?=
 =?utf-8?B?MU9teFU5enh1MlhNTzV4a1JjcU90TEdWdUFEZUNQTUZVdzFDcHdlN0JqanBv?=
 =?utf-8?B?eWpGaUxqeFg0b2YyTGVFNkFESzVlS3dkV0hwL01ySGtzZ0EyaGZoTzBxV1Y0?=
 =?utf-8?B?d0dOeWFKelZwbTlKZEU2R0c1UmdlSUc3czkyZmI3Y2I0ZEEzNzRjd2E5M0xi?=
 =?utf-8?B?MjZsbW94cDV3WlVmd2tHbnZ3cEpZR1JJRkVsYU9EYjJkcGcvUlJHTEh5U0FD?=
 =?utf-8?B?bUFzSUNEN2wzbWhKaWJXU2tsTU1Kb0xVVktaQVNpdGNmQkVqdnFIcG1qYWQ1?=
 =?utf-8?B?WU5yYmpwU0RSc2xDV3pEZXlZU01OWnRYZTV0Vkg1dWUybjgzZ0JpMTkvUW9y?=
 =?utf-8?B?eC9EbWtkWlB1WUtXWHNoVVlyNjNhb1kyTGs0Sk9hWVpyTTA1Szc0SnF5Qkc3?=
 =?utf-8?B?MTJUVjFCMzM3OEc1TDhDMTR4MmMwendjSE96Z05FM2wzTWVBWThrR0p0Zndt?=
 =?utf-8?B?QmlBR3ViaFhVekNkcXliRGpWZGZyNDVHVk1mR3VQUzFrUHp6Q2JCK1MwYTlQ?=
 =?utf-8?B?dHZPMVpCMWUwZlJaOXRwU0dDbmc5aE1UaEtsS3VZSFdjd0F6VHc4UWNjL3Iz?=
 =?utf-8?B?eUxyVVVLTEVTRXliU1ZvcnF2VTBYMGpWUGFJdEhnM0RaN2l1bEUxcmZtMWdD?=
 =?utf-8?B?T1NhbnpPSVhmbkZmMTlWYXBuK25vQ1lVQzZsQ1phNFBabENXbHNBdEVLSStN?=
 =?utf-8?B?ZWtteDlMb3Q3TkRiT3A2ZmRpcDVkRVJvSjhLbkpqRmx4UzMycjA2YnlBaGpi?=
 =?utf-8?Q?Wx54Mw0QKMKl4+bI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYAPR01MB6201.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1ae6964-1459-495e-a8b2-08da28510311
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2022 13:22:43.4828 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T806h9AnJ6aBhmPx68CQtjB4xksLC+vLVQBggnxsJ4mgNBLzngN2GaD11ujGoL3j3apqaHtd1gNIV0KpsvheaEClz/rNlGWw6gMm3fdqlR0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5943
X-OriginatorOrg: toshiba.co.jp
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksDQoNCkkgd2l0aGRyYXcgdGhpcyBzZXJpZXMgb2YgcGF0Y2hlcy4NCkknbSBnb2luZyB0byBz
dWJtaXQgdXBkYXRlZCB2ZXJzaW9uIGFmdGVyIGFwcGx5aW5nIGNoZWNrcGF0Y2gucGwgd2l0aCBz
dHJpY3Qgb3B0aW9uLg0KDQpCZXN0IHJlZ2FyZHMsDQpZdWppDQoNCj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gRnJvbTogWXVqaSBJc2hpa2F3YSA8eXVqaTIuaXNoaWthd2FAdG9zaGli
YS5jby5qcD4NCj4gU2VudDogVHVlc2RheSwgQXByaWwgMTksIDIwMjIgNDoyMCBQTQ0KPiBUbzog
aXdhbWF0c3Ugbm9idWhpcm8o5bKp5p2+IOS/oea0iyDilqHvvLPvvLfvvKPil6/vvKHvvKPvvLQp
DQo+IDxub2J1aGlybzEuaXdhbWF0c3VAdG9zaGliYS5jby5qcD47IFN1bWl0IFNlbXdhbA0KPiA8
c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+OyBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29l
bmlnQGFtZC5jb20+DQo+IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7
IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4LW1lZGlhQHZnZXIua2VybmVs
Lm9yZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsNCj4gbGluYXJvLW1tLXNpZ0Bs
aXN0cy5saW5hcm8ub3JnOyBpc2hpa2F3YSB5dWppKOefs+W3nSDmgqDlj7gg4peL77yy77yk77yj
4pah77yh77yp77y077yj4peLDQo+IO+8pe+8oemWiykgPHl1amkyLmlzaGlrYXdhQHRvc2hpYmEu
Y28uanA+DQo+IFN1YmplY3Q6IFtQQVRDSCAwLzRdIEFkZCBUb3NoaWJhIFZpc2NvbnRpIEFGRklO
RSBpbWFnZSBwcm9jZXNzaW5nDQo+IGFjY2VsZXJhdG9yIGRyaXZlcg0KPiANCj4gVGhpcyBzZXJp
ZXMgaXMgdGhlIEFGRklORSBpbWFnZSBwcm9jZXNzaW5nIGFjY2VsZXJhdG9yIGRyaXZlciBmb3Ig
VG9zaGliYSdzDQo+IEFSTSBTb0MsIFZpc2NvbnRpWzBdLg0KPiBUaGlzIHByb3ZpZGVzIERUIGJp
bmRpbmcgZG9jdW1lbnRhdGlvbiwgZGV2aWNlIGRyaXZlciwgTUFJTlRBSU5FUiBmaWxlcy4NCj4g
DQo+IEJlc3QgcmVnYXJkcywNCj4gWXVqaQ0KPiANCj4gWzBdOg0KPiBodHRwczovL3Rvc2hpYmEu
c2VtaWNvbi1zdG9yYWdlLmNvbS9hcC1lbi9zZW1pY29uZHVjdG9yL3Byb2R1Y3QvaW1hZ2Utcg0K
PiBlY29nbml0aW9uLXByb2Nlc3NvcnMtdmlzY29udGkuaHRtbA0KPiANCj4gWXVqaSBJc2hpa2F3
YSAoNCk6DQo+ICAgZHQtYmluZGluZ3M6IHNvYzogdmlzY29udGk6IEFkZCBUb3NoaWJhIFZpc2Nv
bnRpIEFGRklORSBpbWFnZQ0KPiAgICAgcHJvY2Vzc2luZyBhY2NlbGVyYXRvciBiaW5kaW5ncw0K
PiAgIHNvYzogdmlzY29udGk6IEFkZCBUb3NoaWJhIFZpc2NvbnRpIGltYWdlIHByb2Nlc3Npbmcg
YWNjZWxlcmF0b3INCj4gICAgIGNvbW1vbiBzb3VyY2UNCj4gICBzb2M6IHZpc2NvbnRpOiBBZGQg
VG9zaGliYSBWaXNjb250aSBBRkZJTkUgaW1hZ2UgcHJvY2Vzc2luZw0KPiAgICAgYWNjZWxlcmF0
b3INCj4gICBNQUlOVEFJTkVSUzogQWRkIGVudHJpZXMgZm9yIFRvc2hpYmEgVmlzY29udGkgQUZG
SU5FIGltYWdlIHByb2Nlc3NpbmcNCj4gICAgIGFjY2VsZXJhdG9yDQo+IA0KPiAgLi4uL3NvYy92
aXNjb250aS90b3NoaWJhLHZpc2NvbnRpLWFmZmluZS55YW1sIHwgIDUzICsrDQo+ICBNQUlOVEFJ
TkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKw0KPiAgZHJpdmVy
cy9zb2MvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsNCj4gIGRyaXZl
cnMvc29jL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArDQo+ICBkcml2
ZXJzL3NvYy92aXNjb250aS9LY29uZmlnICAgICAgICAgICAgICAgICAgfCAgIDcgKw0KPiAgZHJp
dmVycy9zb2MvdmlzY29udGkvTWFrZWZpbGUgICAgICAgICAgICAgICAgIHwgICA4ICsNCj4gIGRy
aXZlcnMvc29jL3Zpc2NvbnRpL2FmZmluZS9NYWtlZmlsZSAgICAgICAgICB8ICAgNiArDQo+ICBk
cml2ZXJzL3NvYy92aXNjb250aS9hZmZpbmUvYWZmaW5lLmMgICAgICAgICAgfCA0NTENCj4gKysr
KysrKysrKysrKysrKysrDQo+ICBkcml2ZXJzL3NvYy92aXNjb250aS9hZmZpbmUvaHdkX2FmZmlu
ZS5jICAgICAgfCAyMDcgKysrKysrKysNCj4gIGRyaXZlcnMvc29jL3Zpc2NvbnRpL2FmZmluZS9o
d2RfYWZmaW5lLmggICAgICB8ICA4MyArKysrDQo+ICBkcml2ZXJzL3NvYy92aXNjb250aS9hZmZp
bmUvaHdkX2FmZmluZV9yZWcuaCAgfCAgNDUgKysNCj4gIGRyaXZlcnMvc29jL3Zpc2NvbnRpL2lw
YV9jb21tb24uYyAgICAgICAgICAgICB8ICA1NSArKysNCj4gIGRyaXZlcnMvc29jL3Zpc2NvbnRp
L2lwYV9jb21tb24uaCAgICAgICAgICAgICB8ICAxOSArDQo+ICBkcml2ZXJzL3NvYy92aXNjb250
aS91YXBpL2FmZmluZS5oICAgICAgICAgICAgfCAgODcgKysrKw0KPiAgZHJpdmVycy9zb2Mvdmlz
Y29udGkvdWFwaS9pcGEuaCAgICAgICAgICAgICAgIHwgIDg3ICsrKysNCj4gIDE1IGZpbGVzIGNo
YW5nZWQsIDExMTIgaW5zZXJ0aW9ucygrKQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+IERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb2MvdmlzY29udGkvdG9zaGliYSx2aXNjb250
aS1hZmZpbmUueWFtbA0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvc29jL3Zpc2NvbnRp
L0tjb25maWcgIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiBkcml2ZXJzL3NvYy92aXNjb250aS9NYWtl
ZmlsZSAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+IGRyaXZlcnMvc29jL3Zpc2NvbnRpL2FmZmluZS9N
YWtlZmlsZQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvc29jL3Zpc2NvbnRpL2FmZmlu
ZS9hZmZpbmUuYw0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvc29jL3Zpc2NvbnRpL2Fm
ZmluZS9od2RfYWZmaW5lLmMNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3NvYy92aXNj
b250aS9hZmZpbmUvaHdkX2FmZmluZS5oDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9z
b2MvdmlzY29udGkvYWZmaW5lL2h3ZF9hZmZpbmVfcmVnLmgNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCBkcml2ZXJzL3NvYy92aXNjb250aS9pcGFfY29tbW9uLmMgIGNyZWF0ZSBtb2RlDQo+IDEwMDY0
NCBkcml2ZXJzL3NvYy92aXNjb250aS9pcGFfY29tbW9uLmggIGNyZWF0ZSBtb2RlIDEwMDY0NA0K
PiBkcml2ZXJzL3NvYy92aXNjb250aS91YXBpL2FmZmluZS5oDQo+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgZHJpdmVycy9zb2MvdmlzY29udGkvdWFwaS9pcGEuaA0KPiANCj4gLS0NCj4gMi4xNy4xDQoN
Cg==

