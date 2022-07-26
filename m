Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F8B580B05
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 08:16:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0C7610E4A9;
	Tue, 26 Jul 2022 06:15:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo-csw.securemx.jp (mo-csw1515.securemx.jp [210.130.202.154])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E141010E2E4
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 06:15:54 +0000 (UTC)
Received: by mo-csw.securemx.jp (mx-mo-csw1515) id 26Q6FgSl024093;
 Tue, 26 Jul 2022 15:15:42 +0900
X-Iguazu-Qid: 34trLFpplLxaJGK9p3
X-Iguazu-QSIG: v=2; s=0; t=1658816142; q=34trLFpplLxaJGK9p3;
 m=7muzPcM58MwlJHeHnpSN2b7IvW3HUVHPyo0H3gJTF9w=
Received: from imx12-a.toshiba.co.jp ([38.106.60.135])
 by relay.securemx.jp (mx-mr1511) id 26Q6Feg2016514
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 26 Jul 2022 15:15:40 +0900
X-SA-MID: 39433831
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cIFNNnMTidxtTae66Yf0AhX5FnpxF6V3D2vHApF5sUt44avOeeLPbmS9n0xloYyaRus9yPXI0eoz18sCiin24e9i2/DiDXiFTXO+QCBxu0pT8CsHr8aPgpvn/s/ti6yeSwuAfPmGsyGuqm7t0iN+VeWc4Qj2mvH+uPih2nC6Gvpx0+edRUdjAKkX/sDlBUUraiS+4X1YTXoayBG4L2jppnFWeA4uiQpQCKZMejFG9Hps4ygK4kjWGZsgsaBiWTaZqkW0ofDI1tOm1A51IVzX8C/iktPS07f8DoCk6Y1AIMVOczv9lOjTTbwDljr7Oi0sM/sW05L9bvX3hjURHvs88g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sFQ1FmSRxrALbVY7/2nDs5hL9I6OM6wcoRrklWUL8B4=;
 b=dCfQm5jJlKxiZdhwYykoktRU/bdKNrgk2bbqeW2CcPxAOoNIMNeeqKp/a/Ibagr4ttYa53R6H7Jcs452yCbKH3mE2ciRVICffWMaK4CoB2XA5hwUuuZIXqFpAz494fD8RWqMcJHbcBIFAmmHKskYeX+LNU78f03vKqpoZevKeD6z0l0AM9DxgCLbUqLxSZplYnSSwuFrvbR6ygqe54H0ujJ4EZHRysXFkXWGle8xN2IcJse5znpxJKNXX/uGiqEBmPAbMiFgsp5THdrhHRJBml/4egtOn9B4wdVS+BSq+cjooVwkzO3AOikUEU7ZtKIGWsrbhkYhrvwlH/0fVuy0kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toshiba.co.jp; dmarc=pass action=none
 header.from=toshiba.co.jp; dkim=pass header.d=toshiba.co.jp; arc=none
From: <yuji2.ishikawa@toshiba.co.jp>
To: <gregkh@linuxfoundation.org>
Subject: RE: [PATCH v2 3/5] soc: visconti: Add Toshiba Visconti DNN image
 processing accelerator
Thread-Topic: [PATCH v2 3/5] soc: visconti: Add Toshiba Visconti DNN image
 processing accelerator
Thread-Index: AQHYnaUq2USs7z33O02SH8FDO7LUpq2PDlKAgAEOV3A=
Date: Tue, 26 Jul 2022 06:10:35 +0000
X-TSB-HOP2: ON
Message-ID: <TYAPR01MB620140363E2225BF68803BDF92949@TYAPR01MB6201.jpnprd01.prod.outlook.com>
References: <20220722082858.17880-1-yuji2.ishikawa@toshiba.co.jp>
 <20220722082858.17880-4-yuji2.ishikawa@toshiba.co.jp>
 <Yt6RD2atLwkDrrsu@kroah.com>
In-Reply-To: <Yt6RD2atLwkDrrsu@kroah.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=toshiba.co.jp;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ab49244a-3745-4942-ac47-08da6ecd8dec
x-ms-traffictypediagnostic: TYAPR01MB3424:EE_
x-ld-processed: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: G0AsDxed4rL6m1Wy0OgG06QKzF6WzBfexbf/9xWByB7VDlQLY3nvs3bpPBx3HyTblfD8NLe/yIdXljXYMn+h2wV1gRSXGHs2LyNORoG/czxjY10GRM4shW+YOVpyzZYKK8OxkRdnTm1pZ4J0pdzGIWetbs/CJk+KKPRlwxAQVkgtkXXQj5gougCsZUxYQj+ja4uzYw7tsCiSiI5mzsO42jhCr5ai8QUwOyoYYN0jf7nJogMV0jzLljb6PsgNcGoEm8yfkFII5kBdZI1vPD57kxZip+mueRVmbJrqGwXDd+kDjveoctGRV44hcktofmzHYbjIxzSIJh3D4Sg0ENMa/kfmPh9DLyyP6/wI4DxbEx4XrF7otNZek3AHaC9FBOdBCcpry/+5bexjV+UVNCTP3rGBNCzT698J2YPhtP98I5tmjT2BMx8hQyI4JERMfQSscht/9wnjnlLPkmfmNuAAm0qOA+RdlmEt6jpMcQvMXFJCPlku5xGgfcU0whb7XaxTrgrDRjg6Q4AMR8oV3AJnJA/+U2qrrOO6o5+ORVY2RFmaAWgXRwTnxYkVJ7YK5ojOvGTUtq3X4vwCS8kMd2ZzdfduXab+Y9NOZfAgIQW/MA5sgaIh/9X5LgEhf2jDZw9qTBXcYdVwk7/ITU8SH1Gpegi2ghY+quWdorzMgKEdpYFs/JicZ5jZKwkxBLm0ZDVk7cQbiYuJ7ERGfgWxEYz+913wR5pKewX0owR7O3miTH/wHuyjEQzAxIHPeQoD2/1sX9T3QXgdWHhtyjExXLuCc0+ED9c2ddNWDSTj6nIe7jdck5Rfs04PMLn5QEecc68+
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYAPR01MB6201.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(376002)(346002)(396003)(366004)(39860400002)(4326008)(316002)(55016003)(66556008)(66946007)(66476007)(64756008)(66446008)(8676002)(71200400001)(8936002)(54906003)(478600001)(76116006)(6916009)(52536014)(5660300002)(7416002)(2906002)(41300700001)(6506007)(7696005)(53546011)(86362001)(33656002)(186003)(38070700005)(38100700002)(83380400001)(9686003)(26005)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NklwdllUcEM3bTJNeGx3U2V3ZEJlcUlZQWFVUHpyZGdzSHdDdFhyc1EyWlF3?=
 =?utf-8?B?VEphaFIvRmhoT005WUpETG9SaDZ2N1l0YzdCNWU1T3NmdGNBTHB4Yi9RSVFx?=
 =?utf-8?B?QW16YWFoTWROMzhEZXNPZXNYei9WbitkQUYwSWQ4aUE1OEpTSVR6L2VXZ0xT?=
 =?utf-8?B?NnFOOCtOUFo2VTk1MlNzc2YwL2R0ZkRXUFFYSG5uaGlxYS9aRnRUSmVxNk1m?=
 =?utf-8?B?QlpJZ0t3T0JaVWxLdC85cXJHNjlDZ1R1bTJnRGhCRGFkQnJpQzhMOWN5VFZr?=
 =?utf-8?B?eG14WjcxMjNpNHJZWG45ZmYwaUdlTXUxSENxVGNiVXNaYVhJaTFaSmxvQko5?=
 =?utf-8?B?K2dNUExDTCtFbG9UbE9aSEJmZEtsMG11S205TGVNN2tCTWgyR3A0M1NhdjE4?=
 =?utf-8?B?WWFsL0hyY0c0N3ozaWZaeW9LWm1PbWFpU01PRkxMZ2F6MjRCYjYwR0hGSjAv?=
 =?utf-8?B?Q2lzMjdTK25qOUlFbEFFQy96cFlRd2VlRmFGWVl0K253NE5mcTV0MmpJUHp2?=
 =?utf-8?B?M1YrdzF1TVJqNm1RT0pPZFNpd3hJZzFRN0JPYWZGa1NjK1FScVdZYVQwMldp?=
 =?utf-8?B?eWhDTXhzdkpLYkRKcmJ3ZHA0a04rejN0ak5tUXJhZWlmOVYwYmpnbHJHMnVp?=
 =?utf-8?B?Zm1zQVFRUzRXaDEwWUd6WGdlZE1JNXR3NkVDWTk1QVI4aDhINlRmQW1hQkQ3?=
 =?utf-8?B?TkJKVFpVcDRTaUE4V1BreE5qcnY1bWU0Z2U2cXUrNmFYOGFnZGp5V09Jb3BI?=
 =?utf-8?B?WWx1d09rV2Qxd29ZdUFtZ28vN0syUGlkd0FrUzlIWSt3dDhqNmgrQkxwcVRa?=
 =?utf-8?B?blNteVNmMysxekF4ekdSaGV1dVU1NWNRaUxvRjVXV0pXMjlqVHZ3RmFDNXYx?=
 =?utf-8?B?UXBGQ1kycUg2YnllWFBVR2pNY0gwVEhWMW14NllWa3pJS1JRME1CQ1hHVnVY?=
 =?utf-8?B?eDF2RXhSMTZ4VllZSzNFV2Q1QUZlcElqbjdYQmUxREtJSlNwVVVDUlp0Z2Ju?=
 =?utf-8?B?RTFSa1NxZDNqYTF6dUdaa3dzNW1WTjhGc3VhZE81aTVCd3RWcUpQeWp1UXJ3?=
 =?utf-8?B?bG1LOVE1N2ZEOWtOMWNiWFpHSThMNEZtZ3AwSGRMdXlEMTJPbkp4V1AyL3NI?=
 =?utf-8?B?ellpdkIwM3pRNHQ4WUtCeG0rV3JWMjVhK0tBdWdvVjRiUHFvVXd0ZmlIc2JE?=
 =?utf-8?B?a0NWaHZiNTJhcnFOQXR0SjE5N2dJcm9YYmw1SmlzeVZKSUMvdGRRY1JodmF4?=
 =?utf-8?B?eHV1M09vWFpaT1lNMzc4bEVYMmVhNTZyWFlXeDJtMzBFUGo0b2xhM05xZk5n?=
 =?utf-8?B?RnNqLzNQUnc5VEM4ZWV4R0RmcjlKdVZ4SzdIV0htMFplNncxdXpKZXo1bXpG?=
 =?utf-8?B?YVBKOGZRS1FkQjBFc2xOU1Nmc1RkUG54Z0RLWW9IQmYxK1BMSzBzbHNENWlS?=
 =?utf-8?B?dGdGY053bTJwUGZkaVNHUTlVd0RCOXF0MDZ5MlZuRERkSUNoQ2doZXpaT0Qy?=
 =?utf-8?B?WkVxcUZhL282ZnBoa2gyZlp6YlJFZGZlQnJRTjl1Mnh1T25hc0NhVWdOODNm?=
 =?utf-8?B?VjhHckFrQnFpajIxN3JwaGNuT2VSaTZWdThMVFdvQW5oWDZsVkhUVG9kbHBs?=
 =?utf-8?B?WEh3Q1Q4SEhYM2ZQa3VKc3AxTk00dnRVbGJwTW9rMTFEU1NrOGg3dThTN0Z2?=
 =?utf-8?B?SkhQUjQ2R3ppRDBRUEx2U3YwTjBXL0Iwd1dIclZOS1RlcDB1UGxuQWRBK2JK?=
 =?utf-8?B?MjF6TDhYa1Z1VTBQNk9rdnVDaWlDRWlidndNcjlrazM3OEhFWFVTRXpTSnlj?=
 =?utf-8?B?VXdVNEdIZUVsWFBJM0Zwam92d3IxVXRhUjU3eUpSN0c3TVBSWEFiSnlNblNs?=
 =?utf-8?B?TXJYQWlGTEk1bmZiREpFakFoUDNCSktFWEcvbHdyM1FJaWdXUFVQUkVLTWIr?=
 =?utf-8?B?VS9aeHBpQ0JYZldVR2RQYlZyejZDemRCR2phUUJ2b1dyNHZDQnAxKzlBQ1Zz?=
 =?utf-8?B?aWMxR1NidW9EL3lkZ1FNQUVVZUhUaDEzQUU4RjltcDB6Tld4RzhvbmMwa1Mx?=
 =?utf-8?B?SG4xaWw4T2NGdnUxaGJDa2I0blZMaTY5MW5wa0NibjRac2NxZ3NPdmhkMTVx?=
 =?utf-8?B?TytWYVFLUU5iRkhiRDBLa1lCN1BwUndFTjd5TzRXdC9TNGVubThBemVnM2w5?=
 =?utf-8?B?amc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYAPR01MB6201.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab49244a-3745-4942-ac47-08da6ecd8dec
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2022 06:10:35.4483 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xexFvOUa6che4l82M//i3cjY+6i+BVQqbwHa6Dt7YvDR3LGRB6QtBIlQQBfIA3hvdMgL2/DWYSQCHUr7vHMF/++nGC72bV32Km5YA5n/Fcc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3424
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
Cc: linaro-mm-sig@lists.linaro.org, corbet@lwn.net,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 sumit.semwal@linaro.org, hverkuil@xs4all.nl, robh+dt@kernel.org,
 nobuhiro1.iwamatsu@toshiba.co.jp, christian.koenig@amd.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR3JlZw0KDQpUaGFua3MgZm9yIHlvdXIgY29tbWVudHMNCg0KPiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiBGcm9tOiBHcmVnIEtIIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4N
Cj4gU2VudDogTW9uZGF5LCBKdWx5IDI1LCAyMDIyIDk6NDggUE0NCj4gVG86IGlzaGlrYXdhIHl1
amko55+z5bedIOaCoOWPuCDil4vvvLLvvKTvvKPilqHvvKHvvKnvvLTvvKPil4vvvKXvvKHplosp
DQo+IDx5dWppMi5pc2hpa2F3YUB0b3NoaWJhLmNvLmpwPkhpDQo+IENjOiBSb2IgSGVycmluZyA8
cm9iaCtkdEBrZXJuZWwub3JnPjsgSGFucyBWZXJrdWlsIDxodmVya3VpbEB4czRhbGwubmw+Ow0K
PiBpd2FtYXRzdSBub2J1aGlybyjlsqnmnb4g5L+h5rSLIOKWoe+8s++8t++8o+KXr++8oe+8o++8
tCkNCj4gPG5vYnVoaXJvMS5pd2FtYXRzdUB0b3NoaWJhLmNvLmpwPjsgSm9uYXRoYW4gQ29yYmV0
IDxjb3JiZXRAbHduLm5ldD47DQo+IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5v
cmc+OyBDaHJpc3RpYW4gS8O2bmlnDQo+IDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+OyBsaW51
eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7DQo+IGxpbnV4LWtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmc7IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZzsNCj4gZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZzsgbGluYXJvLW1tLXNpZ0BsaXN0cy5saW5hcm8ub3JnDQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggdjIgMy81XSBzb2M6IHZpc2NvbnRpOiBBZGQgVG9zaGliYSBWaXNjb250
aSBETk4gaW1hZ2UNCj4gcHJvY2Vzc2luZyBhY2NlbGVyYXRvcg0KPiANCj4gT24gRnJpLCBKdWwg
MjIsIDIwMjIgYXQgMDU6Mjg6NTZQTSArMDkwMCwgWXVqaSBJc2hpa2F3YSB3cm90ZToNCj4gPiBB
ZGQgc3VwcG9ydCB0byBETk4gaW1hZ2UgcHJvY2Vzc2luZyBhY2NlbGVyYXRvciBvbiBUb3NoaWJh
IFZpc2NvbnRpIEFSTQ0KPiBTb0NzLg0KPiA+IFRoZSBhY2NlbGVyYXRvciBpcyBhcHBsaWNhYmxl
IHRvIEROTiBpbmZlcmVuY2UgdGFza3MuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBZdWppIElz
aGlrYXdhIDx5dWppMi5pc2hpa2F3YUB0b3NoaWJhLmNvLmpwPg0KPiA+IFJldmlld2VkLWJ5OiBO
b2J1aGlybyBJd2FtYXRzdSA8bm9idWhpcm8xLml3YW1hdHN1QHRvc2hpYmEuY28uanA+DQo+ID4g
LS0tDQo+ID4gdjEgLT4gdjI6DQo+ID4gICAtIGFwcGxpZWQgY2hlY2twYXRjaC5wbCAtLXN0cmlj
dA0KPiA+ICAgLSByZW1vdmVkIHVudXNlZCBjb2RlDQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvc29j
L3Zpc2NvbnRpL0tjb25maWcgICAgICAgICAgIHwgICA2ICsNCj4gPiAgZHJpdmVycy9zb2Mvdmlz
Y29udGkvTWFrZWZpbGUgICAgICAgICAgfCAgIDIgKw0KPiA+ICBkcml2ZXJzL3NvYy92aXNjb250
aS9kbm4vTWFrZWZpbGUgICAgICB8ICAgNiArDQo+ID4gIGRyaXZlcnMvc29jL3Zpc2NvbnRpL2Ru
bi9kbm4uYyAgICAgICAgIHwgNTIzDQo+ICsrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAg
ZHJpdmVycy9zb2MvdmlzY29udGkvZG5uL2h3ZF9kbm4uYyAgICAgfCAxODMgKysrKysrKysrDQo+
ID4gIGRyaXZlcnMvc29jL3Zpc2NvbnRpL2Rubi9od2RfZG5uLmggICAgIHwgIDY4ICsrKysNCj4g
PiAgZHJpdmVycy9zb2MvdmlzY29udGkvZG5uL2h3ZF9kbm5fcmVnLmggfCAyMjggKysrKysrKysr
KysNCj4gPiAgZHJpdmVycy9zb2MvdmlzY29udGkvdWFwaS9kbm4uaCAgICAgICAgfCAgNzcgKysr
Kw0KPiA+ICA4IGZpbGVzIGNoYW5nZWQsIDEwOTMgaW5zZXJ0aW9ucygrKQ0KPiA+ICBjcmVhdGUg
bW9kZSAxMDA2NDQgZHJpdmVycy9zb2MvdmlzY29udGkvZG5uL01ha2VmaWxlICBjcmVhdGUgbW9k
ZQ0KPiA+IDEwMDY0NCBkcml2ZXJzL3NvYy92aXNjb250aS9kbm4vZG5uLmMgIGNyZWF0ZSBtb2Rl
IDEwMDY0NA0KPiA+IGRyaXZlcnMvc29jL3Zpc2NvbnRpL2Rubi9od2RfZG5uLmMNCj4gPiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvc29jL3Zpc2NvbnRpL2Rubi9od2RfZG5uLmgNCj4gPiAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvc29jL3Zpc2NvbnRpL2Rubi9od2RfZG5uX3JlZy5o
DQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3NvYy92aXNjb250aS91YXBpL2Rubi5o
DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zb2MvdmlzY29udGkvS2NvbmZpZw0KPiA+
IGIvZHJpdmVycy9zb2MvdmlzY29udGkvS2NvbmZpZyBpbmRleCA4YjEzNzg5MTcuLmEyNTI4N2Qw
YyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3NvYy92aXNjb250aS9LY29uZmlnDQo+ID4gKysr
IGIvZHJpdmVycy9zb2MvdmlzY29udGkvS2NvbmZpZw0KPiA+IEBAIC0xICsxLDcgQEANCj4gPiAr
aWYgQVJDSF9WSVNDT05USQ0KPiA+ICsNCj4gPiArY29uZmlnIFZJU0NPTlRJX0ROTg0KPiA+ICsg
ICAgYm9vbCAiVmlzY29udGkgRE5OIGRyaXZlciINCj4gPiArDQo+IA0KPiBXZSBjYW4ndCB0YWtl
IEtjb25maWcgb3B0aW9ucyB3aXRoIG5vIGhlbHAgdGV4dCBhdCBhbGwsIHBsZWFzZSBwcm92aWRl
IHRoZQ0KPiBuZWVkZWQgaW5mb3JtYXRpb24gaGVyZS4NCg0KSSdsbCBhZGQgZGV0YWlsZWQgZGVz
Y3JpcHRpb24gdG8gS2NvbmZpZyBoZWxwIHRleHQuDQoNCj4gDQo+IEFuZCB3aHkgY2FuJ3QgdGhp
cyBiZSBhIG1vZHVsZT8NCg0KVGhlcmUncmUgbm8gc3BlY2lhbCByZWFzb25zIHRvIGRpc2FibGUg
bW9kdWxlIGJ1aWxkLg0KSSdsbCB0ZXN0IG1vZHVsZSBidWlsZCBhbmQgYWRkIHRoZSBvcHRpb24u
DQoNClJlZ2FyZHMsDQogIFl1amkNCg==

