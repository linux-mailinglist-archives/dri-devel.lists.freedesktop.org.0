Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEBF52E966
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 11:54:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2606610E42C;
	Fri, 20 May 2022 09:54:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo-csw.securemx.jp (mo-csw1114.securemx.jp [210.130.202.156])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B92910E42C
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 09:54:00 +0000 (UTC)
Received: by mo-csw.securemx.jp (mx-mo-csw1114) id 24K9rcXv004878;
 Fri, 20 May 2022 18:53:38 +0900
X-Iguazu-Qid: 2wHHdmOs2sV2XLGzYW
X-Iguazu-QSIG: v=2; s=0; t=1653040417; q=2wHHdmOs2sV2XLGzYW;
 m=VRdjLF34/bev9VrhO1a1MxlrfctvsZ2TC/m3R1GYhk0=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
 by relay.securemx.jp (mx-mr1111) id 24K9raN7004708
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 20 May 2022 18:53:36 +0900
X-SA-MID: 38232197
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T0Tr9Unj8hy8AAAx6zuh7qafhL5cXXeuJIKxL5ouAbkcSqBhhPnICZUD7EHjfuQpt+KGcfmEefLVr8gNGRTvxafTH2S/leEIIlFzQ9ElvUnAk1G1WxryheY/qWPW2FVgc6fGvXwZfA19/aI/7WzFrFXjNmVaCIfhwpQAdHjHCBuy+y99JAdlHoYsxzTXtzFlMwC/VXKHrNvCstHEryrHBBLPfnIXGgCjXuOiN6JvZ+bjanBTzI+gXFiz58m+fof+45QhvuvUZEVut37NW4RH3l61kZmzqpW9zjQGfVFyBRlU4pfFVAlpwxnikbzqtekPCYYEQTw07Xnoq1hUK5T9dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BT8HrPoOzSVlEV2P2z0CpkR8AJh6aBtMd1eeKCPHSMQ=;
 b=W0YgyaW0K+jDqit08OS2hSXNgnCoLWvN0zAWOUtTaaAZB4QX2E4AyGCMWW42/eZnJzNmiCuabOZ9+2TqWvzyDNTbqesJr2oF5joLu2WHDH3XhNnAkF7CqABcJUG6v+sQEPzEwyhjByFn7FiudhSSFQBoNHIvBDwN3T6Xlzdl2l8s4domJarjDLtMqF1se7fYQeY055NLEH3n3KrkJTltofFh/7pvgBHVNPhJ2LGqXfKsn8U+Xj2lcfqifSykGLw1H2/P+mohqDR2vYqQz7g4bWSnMedSwSM/0WVUqoHhfCtraHF2GamLhVMMst7ms6bPc+8371wRjofCZfDrD84bnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toshiba.co.jp; dmarc=pass action=none
 header.from=toshiba.co.jp; dkim=pass header.d=toshiba.co.jp; arc=none
From: <yuji2.ishikawa@toshiba.co.jp>
To: <hverkuil@xs4all.nl>, <robh+dt@kernel.org>,
 <nobuhiro1.iwamatsu@toshiba.co.jp>, <sumit.semwal@linaro.org>,
 <christian.koenig@amd.com>
Subject: RE: [PATCH 0/4] Add Toshiba Visconti DNN image processing accelerator
 driver
Thread-Topic: [PATCH 0/4] Add Toshiba Visconti DNN image processing
 accelerator driver
Thread-Index: AQHYWwF7uwVWGREvfEWf5eEr1gqNuq0bLOmAgAx4NhA=
Date: Fri, 20 May 2022 09:48:31 +0000
X-TSB-HOP2: ON
Message-ID: <TYAPR01MB62015F4029956F009EC03FBE92D39@TYAPR01MB6201.jpnprd01.prod.outlook.com>
References: <20220428131128.5053-1-yuji2.ishikawa@toshiba.co.jp>
 <b5e35985-c159-6b11-8752-d6dd29fc6a64@xs4all.nl>
In-Reply-To: <b5e35985-c159-6b11-8752-d6dd29fc6a64@xs4all.nl>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=toshiba.co.jp;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d3c561bd-5bf8-423d-8254-08da3a45e632
x-ms-traffictypediagnostic: OSBPR01MB3607:EE_
x-ld-processed: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f,ExtAddr,ExtFwd
x-microsoft-antispam-prvs: <OSBPR01MB36073222EC23A30D686B636C92D39@OSBPR01MB3607.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uDTKQPqUAj/Ui8D7ogQEiS7PusmNPfs0PO286sLjS/AVpFzqO0ggphSK8P4CB3NfFtKFSjneQMYrhFFF9Wv/heRw25lO2/OQ7Mu6rBFlJCYZepewX70L0zV+J1tgKQEcbA+IbzO9opRSET1HEcGmEeF0L+/fFR0u9ytNb5EmRpchvJNGCCNef3mYO/Kv32HGweRrGjPARbmorFRol8Ffninm79VxO13z0oGv3koBqYZJpww5hxrOdjhmRqPK5SNg8O5xI15z+GBFbPGfEGActJzElZz+CvZHxL8DBgUqzJ5RO315DYVnAnFD8kDwRKA/iXha2Q8EWlS2YsCFc9c+TUxz3aXkkCMy3l6efnWiVDjl1PHBMdP23yH2Iuuobb60pTQqySEZ/NisFepORWkCDo58ta4hCEOlumV179QVEah4OZ5N8xmPoNlXkFDOH7olx5zNlmDzRVNJTbBwByw67pfHsTQZdiRoVcFzSU9h4gJy5b42XgRYPkR8IFM/Uf0OaPMQ4rc9ddmaKUUVtRxLSJFQ4fAcr0ydgORLaRfpx88OHQ8FsHSp6MleTMnyBJeDwS/sujnB19eXFnW1O56xUcxK4iXOQQe/y4nMxoz1w77g25frHzFeskRp+119XXgCF03UXxZL/eF2pdN4Ao6ZJP/Zp7Y0OMhzFm8Yf3VhD4SzUtcGadmot/u5iGQHtAv77Vcm9DTbgVQvf/nnrwQvJabuBOVFPzl827ioETxR6rEFAzUg4U1TlbmRVzHi1UmP11/mopoMM3og2bln8RSMPLofan370atlHQjng8bMX5o=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYAPR01MB6201.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38070700005)(8936002)(71200400001)(316002)(38100700002)(122000001)(9686003)(54906003)(86362001)(508600001)(55016003)(66574015)(7416002)(110136005)(5660300002)(26005)(966005)(52536014)(83380400001)(55236004)(4326008)(33656002)(53546011)(66476007)(66446008)(8676002)(66556008)(2906002)(64756008)(7696005)(186003)(66946007)(6506007)(76116006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?elY1dVlWWENSWVBpR2VPVmw3SERDUVZ2UXBJL3U0VnJBQllVcm5FbXRkNTNP?=
 =?utf-8?B?M0I4aGxXZVJlTEdSR2NlbzN2TEh4bGVCRjFjSUxIcGdra0ppOFlvUU9XNy83?=
 =?utf-8?B?a0FFOWZqbzZNbHdOME8zMUNmUnppb3FhVGp0NDBDNk8xbkJ4cXNncEptWmkr?=
 =?utf-8?B?TFZCK3lCbWZLem1VQ0pQd3ZhL01BQUFJUkJveC9Sd042aFFVMjZIcllXaUpI?=
 =?utf-8?B?TENFS3JJQkgyWjdPcTJ2Z3FGZlc1VktVQTR4NXZvMFRnWkxRZGY0M1FuVTdY?=
 =?utf-8?B?blVQNHNReGtNOFlvSGZlQm0vSytMNkZPS2F3TThwTExDT0h6UE84RENiMm1n?=
 =?utf-8?B?TklISEh6dEFFQSttU3VrMm9vTnJpYkliQ2s1YWNjYWJIdnlrTHdxZVZIMnEr?=
 =?utf-8?B?N2pycVc3OEpuTTZjNTIvSEVCbm1rSktST3JtbGR6cnMyb0xTU0RHUmFOaUZz?=
 =?utf-8?B?ZkRTMUQ3V0pFbHZudFdvajh3NnpETFlpSmkxWnZJdEZGQXVrTGUwcWFsUE50?=
 =?utf-8?B?QVAxMXhPZmNiQjRrdWl3cVJwWmRoK1JGVnRDQlhSTG94cEdqeEtmaWNjeGly?=
 =?utf-8?B?NE5LSUFWSDBqRmxyTzJtYUVycWJSUlpKY2JsMlh3R1lIUmxiZmQvZDFHeXFw?=
 =?utf-8?B?Lyt5N3k2RjB6SE41bUJ1dGxHNG9rbkFzUEdJZVBLVkg2OHN2Zjg0dDFBTnNP?=
 =?utf-8?B?RHlSTW9RRlYraUdNSVluRUIrblprNm0yeGFZdUNDblc2N3FFTmZUbHVZWVJj?=
 =?utf-8?B?Z3I2UVV2N0lZbjE5VjYvR0oyU0dsSzF2Q2s3MEhyL2lmUDY1L09tbEl0OU8v?=
 =?utf-8?B?N043K3dEYXYya3NLWWNmMnpCVDgva3NZM1g5SmdhWkFtWi9jY2hhaUdPWjJJ?=
 =?utf-8?B?UEh1K3czeU9oV2xPOG5kdnlkOEZsb2thSHVqdUhtZ04ycUREK3VSVE9SRUND?=
 =?utf-8?B?VGlIOHN0MjVpVXRIWXNiQVh3NXdGWnRJclFLK3pqY1ZmaXoyV2g2QnRTa2J4?=
 =?utf-8?B?SnNTTUsyL0JaeTlXVVpaUVc3VU4xS0RlQm5XUVpSY2RQaVRMTWkyeGx2M1hq?=
 =?utf-8?B?NTUvVUR5ZGU1cFdhcUZiTUVHOVFhQ0RDR3JOT3FXWEc4ZWk3S2xURzR6MmFE?=
 =?utf-8?B?NWJON2Z0UWk0dUR2b3U2NXlEdWxtVnhuRS9KTGZZVkNhMmVXSDNMd2RzTE50?=
 =?utf-8?B?dmg1SkxuWEV5YzgwM0FSR2J1bllyZkpaVE1XVDJTQllMS29vRHlPNTVESm1D?=
 =?utf-8?B?Ymp4ZWhBdFB3ZjNsTGVoQkYyVDN0aEtyaUhPSWtUTEhqbjVQK1RjcXE5RDlB?=
 =?utf-8?B?MmlHMmpnSG0yYVhzbXA2SkhycWR3UHlwNUk0c0NKVktqaWlGUEVIdWpMOWRz?=
 =?utf-8?B?dG1YMGxtN2o2a2MzNTg5VzB6SWxIMTR3bnRsK1A2Vm5SVk1waGZ2dFpHZVNY?=
 =?utf-8?B?d2YyRkRPWTNZaXRvbTB2UFpQL1BJTUVCbkFFVjRzUW04aXRuV2RITGxqL0Y0?=
 =?utf-8?B?RWQxeFoveFpCdG1USW41dHhRWXAwRmNrT0FKZzQ4MDNydXNrWjJybFRkMVps?=
 =?utf-8?B?QVlsa24vNFNXaVR6Q3VkYjdlNnJ2QUhGV0xqOE9wSkZXS3Q3cnUvWTBkZnhB?=
 =?utf-8?B?SUhUWW55NDJXNFhGZUlHS1l3SURtcm9tMDBNVHFWSGRjYUVoc0o2emJTbEN0?=
 =?utf-8?B?MDhidmoremxPL212b3hLRzYvbVlyTVhTbklzc280U0FuY1Z1ZHhETVJBendx?=
 =?utf-8?B?R1phK25xV1hlQU9XalBSNGRieWo2UDNKbkFSY24xZGRjQkQrdGF5aUhWaVRZ?=
 =?utf-8?B?ejFtL2FNZjUyN0Z4ckxaQXFWOUNwOFJ6czEvUktDWnBPMUtjdGJldkQ1M1Bp?=
 =?utf-8?B?NFNTWWhJS2RSL3VHL3k3akV2Z0JFQ1JQN25NUEJwNm42MEdDdDc1MnNNZ3d6?=
 =?utf-8?B?aEJpTHhHd3dOUjBXZWh5a1pZWGxBVU4vMDljbnZMY25qaUVqMlNBNE9uOG0y?=
 =?utf-8?B?b2RhQjFzMW9DQkxsdkFVcW9QWkdsaXdGMlcvMDNWUkY5Q1RmbVJrS1RYcGNn?=
 =?utf-8?B?eWR0MEx3VDNEZFNCZlMvZzJzZHhGaFo2NnBWUk9zWXo2QzlGeE5wTmlOejhv?=
 =?utf-8?B?V1NKdTdnT2MvS2F6bUM0V2tMS3ZibmJ3KzU1OEVMOWtYUzBoRWZ2K1dqL0xy?=
 =?utf-8?B?a3IyOGR2bHYyQXZESWNXYm95UjBLbUx6ZFRIYTliUmlkLzlkRFI3ZjNjRnND?=
 =?utf-8?B?NUV1OGFqdXpxNE1GOTFDbDhhcSs0YTVmd2JtUFFxM2oxQ3dqQlNNck5hU2Yz?=
 =?utf-8?B?ZVNHSlpRV1lSRXBmU1EzN0Z3WUNicUJJZ3VYeHBIcDRMUVFQSldFSm9VV2l0?=
 =?utf-8?Q?QPCeUCYZYRnAkxXE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYAPR01MB6201.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3c561bd-5bf8-423d-8254-08da3a45e632
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2022 09:48:31.5258 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: klgfHVCe8NpTAl7aALsr+47pvKrq35ut9HI1LuR6Mks3cNwtSuKXijXSH7rLu0sb3lcQ5GCriJFnA4amp1xoaV5VA599U0b+ze+BIyyydK4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3607
X-OriginatorOrg: toshiba.co.jp
MSSCP.TransferMailToMossAgent: 103
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

SGkgSGFucywNCg0KVGhhbmsgeW91IGZvciB5b3VyIGNvbW1lbnQuDQpJIGFncmVlIHRoYXQgdGhp
cyBzdWJtaXNzaW9uIGxhY2tzIGRvY3VtZW50cyBzaGFyaW5nIGJhc2ljIGlkZWEgb2YgdGhlIGFj
Y2VsZXJhdG9yczsgd2hhdCBkbyB0aGV5IGFjY2VwdCBhbmQgd2hhdCBkbyB0aGV5IHlpZWxkLg0K
V2hlcmUgY2FuIEkgcHV0IGEgbmV3IGRvY3VtZW50PyBDYW4gSSBwdXQgaXQgYXMgYSBjb21tZW50
IGluIGEgc291cmNlPyBDYW4gSSBhZGQgYSBmaWxlIHVuZGVyIERvY3VtZW50YXRpb24vbWlzYy1k
ZXZpY2VzIGRpcmVjdG9yeT8NCg0KVGhhbmtzLA0KWXVqaSBJc2hpa2F3YQ0KDQo+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEhhbnMgVmVya3VpbCA8aHZlcmt1aWxAeHM0YWxs
Lm5sPg0KPiBTZW50OiBUaHVyc2RheSwgTWF5IDEyLCAyMDIyIDg6MTUgUE0NCj4gVG86IGlzaGlr
YXdhIHl1amko55+z5bedIOaCoOWPuCDil4vvvLLvvKTvvKPilqHvvKHvvKnvvLTvvKPil4vvvKXv
vKHplospDQo+IDx5dWppMi5pc2hpa2F3YUB0b3NoaWJhLmNvLmpwPjsgUm9iIEhlcnJpbmcgPHJv
YmgrZHRAa2VybmVsLm9yZz47DQo+IGl3YW1hdHN1IG5vYnVoaXJvKOWyqeadviDkv6HmtIsg4pah
77yz77y377yj4pev77yh77yj77y0KQ0KPiA8bm9idWhpcm8xLml3YW1hdHN1QHRvc2hpYmEuY28u
anA+OyBTdW1pdCBTZW13YWwNCj4gPHN1bWl0LnNlbXdhbEBsaW5hcm8ub3JnPjsgQ2hyaXN0aWFu
IEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KPiBDYzogbGludXgtYXJtLWtlcm5l
bEBsaXN0cy5pbmZyYWRlYWQub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOw0KPiBs
aW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmc7DQo+IGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIDAvNF0gQWRkIFRvc2hpYmEgVmlzY29udGkgRE5OIGltYWdlIHByb2Nlc3NpbmcNCj4gYWNj
ZWxlcmF0b3IgZHJpdmVyDQo+IA0KPiBIaSBZdWppLA0KPiANCj4gT24gNC8yOC8yMiAxNToxMSwg
WXVqaSBJc2hpa2F3YSB3cm90ZToNCj4gPiBUaGlzIHNlcmllcyBpcyB0aGUgRE5OIGltYWdlIHBy
b2Nlc3NpbmcgYWNjZWxlcmF0b3IgZHJpdmVyIGZvciBUb3NoaWJhJ3MgQVJNDQo+IFNvQywgVmlz
Y29udGlbMF0uDQo+ID4gVGhpcyBwcm92aWRlcyBEVCBiaW5kaW5nIGRvY3VtZW50YXRpb24sIGRl
dmljZSBkcml2ZXIsIE1BSU5UQUlORVIgZmlsZXMuDQo+ID4NCj4gPiBUaGUgc2Vjb25kIHBhdGNo
ICJzb2M6IHZpc2NvbnRpOiBBZGQgVG9zaGliYSBWaXNjb250aSBpbWFnZSBwcm9jZXNzaW5nDQo+
IGFjY2VsZXJhdG9yIGNvbW1vbiBzb3VyY2UiDQo+ID4gYW5kIHRoZSBmb3VydGggcGF0Y2ggIk1B
SU5UQUlORVJTOiAuLi4iIGFyZSB0aGUgc2FtZSBhcyB0aGUgb25lcyBpbiB0aGUNCj4gcHJlY2Vk
aW5nIHBvc3QgZm9yIGFmZmluZSBkcml2ZXIuDQo+IA0KPiBUaGVyZSBhcHBlYXJzIHRvIGJlIG5v
IGRvY3VtZW50YXRpb24gd2hhdHNvZXZlciwgdW5sZXNzIEkgYW0gbWlzc2luZw0KPiBzb21ldGhp
bmcuDQo+IA0KPiBIb3cgaXMgdGhlIHVBUEkgc3VwcG9zZWQgdG8gYmUgdXNlZD8gV2hhdCBkb2Vz
IGl0IGRvPyBXaGF0IGZvcm1hdHMgZG9lcyBpdA0KPiBhY2NlcHQgb3IgcHJvZHVjZT8NCj4gDQo+
IElmIHRoaXMgcHJvY2Vzc2VzIGltYWdlcywgdGhlbiAoYXMgTGF1cmVudCBtZW50aW9uZWQpIHRo
aXMgaXMgbW9yZSBzdWl0YWJsZSBhcyBhDQo+IFY0TDIgbWVtMm1lbSBkcml2ZXIuDQo+IA0KPiBT
ZWUNCj4gaHR0cHM6Ly9saW51eHR2Lm9yZy9kb3dubG9hZHMvdjRsLWR2Yi1hcGlzLW5ldy91c2Vy
c3BhY2UtYXBpL3Y0bC9kZXYtbWUNCj4gbTJtZW0uaHRtbA0KPiBhbmQgdGhlIG1hbnkgZHJpdmVy
cyBpbiBkcml2ZXJzL21lZGlhIHRoYXQgdXNlIGl0IChnaXQgZ3JlcCB2NGwyLW1lbTJtZW0uaCku
DQo+IA0KPiBCdXQgd2l0aG91dCBhbnkgZXhwbGFuYXRpb24gd2hhdHNvZXZlciBJIGhhdmUgbm8g
aWRlYSB3aGF0IGRvZXMgb3IgZG9lcyBub3QNCj4gbWFrZSBzZW5zZS4NCj4gDQo+IFJlZ2FyZHMs
DQo+IA0KPiAJSGFucw0KPiANCj4gPg0KPiA+IEJlc3QgcmVnYXJkcywNCj4gPiBZdWppDQo+ID4N
Cj4gPiBbMF06DQo+ID4NCj4gaHR0cHM6Ly90b3NoaWJhLnNlbWljb24tc3RvcmFnZS5jb20vYXAt
ZW4vc2VtaWNvbmR1Y3Rvci9wcm9kdWN0L2ltYWdlLQ0KPiA+IHJlY29nbml0aW9uLXByb2Nlc3Nv
cnMtdmlzY29udGkuaHRtbA0KPiA+DQo+ID4gWXVqaSBJc2hpa2F3YSAoNCk6DQo+ID4gICBkdC1i
aW5kaW5nczogc29jOiB2aXNjb250aTogQWRkIFRvc2hpYmEgVmlzY29udGkgRE5OIGltYWdlIHBy
b2Nlc3NpbmcNCj4gPiAgICAgYWNjZWxlcmF0b3IgYmluZGluZ3MNCj4gPiAgIHNvYzogdmlzY29u
dGk6IEFkZCBUb3NoaWJhIFZpc2NvbnRpIGltYWdlIHByb2Nlc3NpbmcgYWNjZWxlcmF0b3INCj4g
PiAgICAgY29tbW9uIHNvdXJjZQ0KPiA+ICAgc29jOiB2aXNjb250aTogQWRkIFRvc2hpYmEgVmlz
Y29udGkgRE5OIGltYWdlIHByb2Nlc3NpbmcgYWNjZWxlcmF0b3INCj4gPiAgIE1BSU5UQUlORVJT
OiBBZGQgZW50cmllcyBmb3IgVG9zaGliYSBWaXNjb250aSBETk4gaW1hZ2UgcHJvY2Vzc2luZw0K
PiA+ICAgICBhY2NlbGVyYXRvcg0KPiA+DQo+ID4gIC4uLi9zb2MvdmlzY29udGkvdG9zaGliYSx2
aXNjb250aS1kbm4ueWFtbCAgICB8ICA1NCArKw0KPiA+ICBNQUlOVEFJTkVSUyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKw0KPiA+ICBkcml2ZXJzL3NvYy9LY29uZmln
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKw0KPiA+ICBkcml2ZXJzL3NvYy9NYWtl
ZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKw0KPiA+ICBkcml2ZXJzL3NvYy92
aXNjb250aS9LY29uZmlnICAgICAgICAgICAgICAgICAgfCAgIDcgKw0KPiA+ICBkcml2ZXJzL3Nv
Yy92aXNjb250aS9NYWtlZmlsZSAgICAgICAgICAgICAgICAgfCAgIDggKw0KPiA+ICBkcml2ZXJz
L3NvYy92aXNjb250aS9kbm4vTWFrZWZpbGUgICAgICAgICAgICAgfCAgIDYgKw0KPiA+ICBkcml2
ZXJzL3NvYy92aXNjb250aS9kbm4vZG5uLmMgICAgICAgICAgICAgICAgfCA1MzMNCj4gKysrKysr
KysrKysrKysrKysrDQo+ID4gIGRyaXZlcnMvc29jL3Zpc2NvbnRpL2Rubi9od2RfZG5uLmMgICAg
ICAgICAgICB8IDE4MyArKysrKysNCj4gPiAgZHJpdmVycy9zb2MvdmlzY29udGkvZG5uL2h3ZF9k
bm4uaCAgICAgICAgICAgIHwgIDY4ICsrKw0KPiA+ICBkcml2ZXJzL3NvYy92aXNjb250aS9kbm4v
aHdkX2Rubl9yZWcuaCAgICAgICAgfCAyMjggKysrKysrKysNCj4gPiAgZHJpdmVycy9zb2Mvdmlz
Y29udGkvaXBhX2NvbW1vbi5jICAgICAgICAgICAgIHwgIDU1ICsrDQo+ID4gIGRyaXZlcnMvc29j
L3Zpc2NvbnRpL2lwYV9jb21tb24uaCAgICAgICAgICAgICB8ICAxOCArDQo+ID4gIGRyaXZlcnMv
c29jL3Zpc2NvbnRpL3VhcGkvZG5uLmggICAgICAgICAgICAgICB8ICA3NyArKysNCj4gPiAgZHJp
dmVycy9zb2MvdmlzY29udGkvdWFwaS9pcGEuaCAgICAgICAgICAgICAgIHwgIDg4ICsrKw0KPiA+
ICAxNSBmaWxlcyBjaGFuZ2VkLCAxMzI5IGluc2VydGlvbnMoKykNCj4gPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0DQo+ID4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvYy92aXNjb250
aS90b3NoaWJhLHZpc2NvbnRpLWRubi55YQ0KPiA+IG1sICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJp
dmVycy9zb2MvdmlzY29udGkvS2NvbmZpZyAgY3JlYXRlIG1vZGUNCj4gPiAxMDA2NDQgZHJpdmVy
cy9zb2MvdmlzY29udGkvTWFrZWZpbGUgIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+IGRyaXZlcnMv
c29jL3Zpc2NvbnRpL2Rubi9NYWtlZmlsZSAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+ID4gZHJpdmVy
cy9zb2MvdmlzY29udGkvZG5uL2Rubi5jICBjcmVhdGUgbW9kZSAxMDA2NDQNCj4gPiBkcml2ZXJz
L3NvYy92aXNjb250aS9kbm4vaHdkX2Rubi5jDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2
ZXJzL3NvYy92aXNjb250aS9kbm4vaHdkX2Rubi5oDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBk
cml2ZXJzL3NvYy92aXNjb250aS9kbm4vaHdkX2Rubl9yZWcuaA0KPiA+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgZHJpdmVycy9zb2MvdmlzY29udGkvaXBhX2NvbW1vbi5jICBjcmVhdGUgbW9kZQ0KPiA+
IDEwMDY0NCBkcml2ZXJzL3NvYy92aXNjb250aS9pcGFfY29tbW9uLmggIGNyZWF0ZSBtb2RlIDEw
MDY0NA0KPiA+IGRyaXZlcnMvc29jL3Zpc2NvbnRpL3VhcGkvZG5uLmggIGNyZWF0ZSBtb2RlIDEw
MDY0NA0KPiA+IGRyaXZlcnMvc29jL3Zpc2NvbnRpL3VhcGkvaXBhLmgNCj4gPg0K

