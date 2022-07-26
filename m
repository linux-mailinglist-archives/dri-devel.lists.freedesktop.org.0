Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03234580B0A
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 08:16:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2510910E465;
	Tue, 26 Jul 2022 06:16:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo-csw.securemx.jp (mo-csw1115.securemx.jp [210.130.202.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DAC410E64E
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 06:16:13 +0000 (UTC)
Received: by mo-csw.securemx.jp (mx-mo-csw1115) id 26Q6Fm45021367;
 Tue, 26 Jul 2022 15:15:48 +0900
X-Iguazu-Qid: 2wHHoF6uBaMq4rYeVc
X-Iguazu-QSIG: v=2; s=0; t=1658816147; q=2wHHoF6uBaMq4rYeVc;
 m=HUSNmruNu2dqU9CEHkivheqaUZgrIf0QR0PByxVAWXQ=
Received: from imx12-a.toshiba.co.jp ([38.106.60.135])
 by relay.securemx.jp (mx-mr1113) id 26Q6FjSO034113
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 26 Jul 2022 15:15:45 +0900
X-SA-MID: 39433842
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lebjiv0eCYsfd7iEeIgUQNCARnTEGuzrCuYxTkTsJ2lo4UtJrnZZ/T6QdpYhIHnQJwf5OvKaECJlrzUmvBx5fbyp0+qQpHtKS81FF+XdXlS7JoO4PWfxRCUH2ZPcoSJ5E8hJ1Yfh8XABDfKalI/xlUrKDrobdYHjL5NhZ3Ly1H/p1zM0j82Md/ruisYQOeJywhUZmZnKZXjJJoknfX+FHr1msBeiTnP8otg/ADTAllkldfkBBuz4vcEucn1Psw91zqgviLHCugI+F1OE7gvb1a6iNPaBo3DnKimc9fblvkQRHosGK1RsSXgGnPp0V7aaSE/Txnz+o5F+VghW2b32fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YDObuCms0YW5KhdyABV9OOWnPsI5IT+VdbyQ87Vxa2Q=;
 b=HrDtz38cETA/x5gtZ0rj+9f5ufllLXglo7kWKiUw9MmGu91Iv23EaTqDWADcUJpgI27GLaxXeUyNYbyeAioXHdQfd4r69XKBlwWU89qqCBSl9wIBNQ4584L0CEW3x5OLSqSKAUeTUy+V5VC4NUuunnnU3P5S6ZbfFY24/B/vo9W3FKb0pLoTMKuXSdpwMATYp2WLoea8W4g9TtJ6YDHdri42D0MCpzbaMbPHX2cuKwB50mbfpoCX4vgTm4zzlNC+NW37Fv9nsiM+Cew5v79ueDGCCyzNg3hSo6mEfbgrT+7O7T1I4SdyTX3/LV+yIbRiJZSQ2xcEURku1RShajFBHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toshiba.co.jp; dmarc=pass action=none
 header.from=toshiba.co.jp; dkim=pass header.d=toshiba.co.jp; arc=none
From: <yuji2.ishikawa@toshiba.co.jp>
To: <gregkh@linuxfoundation.org>
Subject: RE: [PATCH v2 4/5] MAINTAINERS: Add entries for Toshiba Visconti DNN
 image processing accelerator
Thread-Topic: [PATCH v2 4/5] MAINTAINERS: Add entries for Toshiba Visconti DNN
 image processing accelerator
Thread-Index: AQHYnaUot7HxQEqg/0qbg+3sLDWQ+62PDhUAgAEh98A=
Date: Tue, 26 Jul 2022 06:10:40 +0000
X-TSB-HOP2: ON
Message-ID: <TYAPR01MB6201F467FB17AD40EE907E7392949@TYAPR01MB6201.jpnprd01.prod.outlook.com>
References: <20220722082858.17880-1-yuji2.ishikawa@toshiba.co.jp>
 <20220722082858.17880-5-yuji2.ishikawa@toshiba.co.jp>
 <Yt6Q3A4tkmu797eX@kroah.com>
In-Reply-To: <Yt6Q3A4tkmu797eX@kroah.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=toshiba.co.jp;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ebc0b1c3-f014-4d5b-b1a1-08da6ecd910d
x-ms-traffictypediagnostic: TY2PR01MB1900:EE_
x-ld-processed: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eVswtFN4el9kVxj2+CXp0GdOQ4Hj0CbLft7ZqqB7pXKcAngpA6ah9uHvxkTttAaQSx/JusYoHQiVz2GbUqhdsrMB6ZNH/fte05OFvffM/lfG1dmfMjytVVzqiir6/x/jAO03Ar9e/TRMe+rG4dw8r13NQeuCESBtn3P6SO2Ny3/Nb2zJ38gEsKDZhw+S3y6lsw4ABIRCmZUoFgQhwKvGgnA8rVQIxkEEQayTBopeP5gm9DlonP/w62eGS0el3pE54PHrpOlkDLF30DdAd2WI2dXbW3pKvRDECLQr2gWpUcTqm469jIy279wVcVj7jAvYccH02InFGX2L0gR2hExxRN5wVj+XhkhQLKEbp9ntZPWEJwhlF+PLTXHSDDIPJlQ8Jj8MW4IRBqsnSytUPvslAUsMWjDAEkxkH0QMZNDo0oY6i3mYi/akzAsV+vQO0YRZijs1CtG62ekZFgZhgO9oaSN49uVJeHSc4OBXDZPJ/8IoffpE849ZcIxzzXXTSO9GuQB8xZfC4sHrP05qvCuVlPgGVA5EEKKTXfU1sQIuCiLK8Wer2cYdCXPb/dBbHtoiW3gQzkwOBiPbUhxzTCQWxMW7wq+tZTxbCFM2QEu/S7uPT8lVCyOR3udIvN/g4uZOixx19hAiGR8M+3ER+bChC8LXXIaiHseKoU234O6ZOV9fbT+6aTKTnYU4rl6/BhJyjJ92EEC1SdZKI5nakInjLWpBkojvvC7nkLjIvcInRMEy3kHpfthkkUhCyjJ9ofhAfEHkUTlyCaeA4fo4npjXRcVbPUTZTpFL/oiXOfrUeeDo0cvAqbOKNYymSwrmifI/
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYAPR01MB6201.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(346002)(376002)(366004)(136003)(39860400002)(41300700001)(71200400001)(316002)(6916009)(478600001)(55016003)(54906003)(2906002)(66446008)(66946007)(66556008)(8676002)(64756008)(7416002)(4326008)(66476007)(5660300002)(4744005)(76116006)(83380400001)(8936002)(86362001)(38100700002)(122000001)(186003)(7696005)(6506007)(9686003)(33656002)(53546011)(38070700005)(26005)(52536014);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q3RMaVQ1T3luWWU5bVQ3TmVzdGlvbjZ5LzVESjFtTnZraHNvQXRnSWdEL2FW?=
 =?utf-8?B?cjhTOTgxaFJzdWduMWxDaC9aYmtKbVhtd1h0RDg5dGdIQXh0K2l1NDlscUtG?=
 =?utf-8?B?TEZhOENpY3NoSjRzYU5XcEJlOHE3RDQ0Z1RSSXp0OE8zUnNYSHBBOXhGSFNR?=
 =?utf-8?B?aFZGUG1NRHdDMWxjQ3hGVjcvSnFvTnVZVGlOanlTNC9XRlBRcFBTZ01qZ1kr?=
 =?utf-8?B?V3JxMk1GR1hUTVI4bVZMS21HZThNOVU0cDhqNHhZcEtDbDJnbDFYWjJpd0RF?=
 =?utf-8?B?THdITkduQnpxNHVTeXdiS0ZFU29MeENCZzkwaXNBZ0kwZkpIU1g1c1Z2SDZh?=
 =?utf-8?B?THQ2Z3FkN2VPMVFocmJ6UXErWFY1Qi9qTGI2WldJZWxBMEhlT1prd2tKR0dh?=
 =?utf-8?B?bTlOS1BUN0RwSXl1RGkyL0tsSG1qbi9xcG9uUmxvdXpSbzFXQjVLWTlKVjVM?=
 =?utf-8?B?WlpxUjZ6MTZxb2wvMjlSLzlWcTJYaE5nL1lSTjF3dXpwc0Y5YUQ1anpoZDBH?=
 =?utf-8?B?LzZQTXpXaUFGNCtubjdRL3BtWTJlTlc0WGhLSTBydWo4SlIxVTlHV2R5b3o1?=
 =?utf-8?B?dlppc2g5K25BLzFIemsrd0swc052QjNySlZXalg3OWozaEw5eENxNUdJM3Ar?=
 =?utf-8?B?UTY3cnJGSGhhbUJKaWxMZytFc0g2dWdhNVhtenpWVE12N2E2MWNiQUNKaG1U?=
 =?utf-8?B?Z0c4UndGSFFMdGh3OEtmY1Zha056VitDTko5R0h0eEpsUEdUdEo1a1pnd0hz?=
 =?utf-8?B?MnlMSTk5bms5VHlWSnplZXM1cnRueHVUWHQ4OXUzNG5uajQvMkQ3R1lsVlk4?=
 =?utf-8?B?Zk01VDJHUDI2ekwzWDZndXE5QTMvSzdYNkh6S0tnNnA3NmZBRGttLzgvKy8w?=
 =?utf-8?B?RGdBdGFmNzlpeFZydkxKKzl6NndnQTJGajlrNm40UklwUFdSTFZ5YkNVT202?=
 =?utf-8?B?WjIrcnRpVlh6TkJyeGRhYUplQ0g2RzN2ZjdibkZMSmxVN0IyUmRHZkpkQUph?=
 =?utf-8?B?dmM3ajJwaEdJZGlBTDZucTAzaWl4VkpzcUZNTEZvbERxeUVqVnhOSnpxL29j?=
 =?utf-8?B?aW9VMllqcW8vOXovOUt4NG91N1VSeWg2dDhmd0JVRVNwbWphZXlMWjRjNWRI?=
 =?utf-8?B?WkhPL0Y5dno0b2hkZnd1d3hKYUxzb1k2ZzJlKzBSS0JGV213V3VDMno2cHlT?=
 =?utf-8?B?SmhkaFVqMTkrcTRvNlY1NmdyZGZoMGxqeGpKc2VEY1dYbVBFYmtSL2xISkQw?=
 =?utf-8?B?SUdUY0hPaUFpbnk0VVBRTlcweHUzR3BFeWZXbnBpNVovbGkzNDdNR1dpYmRD?=
 =?utf-8?B?cnQwcGgvYmhpSVZLNmMwcnJDNTdBQm4wSEVwbnpvWGJaUUQzRlA3Uk9XT3o4?=
 =?utf-8?B?M1JWVkM3d1JqWmVpNVBZNllyaE1KZXl3cy9zNlU2NERnL3NpUGFFcG0zem1w?=
 =?utf-8?B?NmZ5S1JzamRydUhIT0FHNkV4dElKQVZyRmVwMkJxdWJMQ3N3RXoxLzMxcGNa?=
 =?utf-8?B?d0VVcWpXQkNiWThxSFB1MnJhVkJsU2MyNlgvNi84bk9RWjEvQ0hNWTZ6UEZq?=
 =?utf-8?B?NTdyS09lWGJVNmx0dFhCWWg5eG5ZSkxrUlFuRWhyaU83bSsrQkF0NCtFRHkv?=
 =?utf-8?B?UXlXS1EwQ3A5WHFqVDRBbWpPUlNBdjhla0hiRFZxd09TYXBkbUNnK2FreXBx?=
 =?utf-8?B?WVpudENlSDdKazM3Y0tSVy92a201OGdNWEJvck5YRDd5b0FrZFdaTHlzZUhV?=
 =?utf-8?B?eWJhNkVMTzVuRm02dUZlTjczZFdPWlpjQ1h4ZzJlVmJRSkJoNE1nbGhwV2Y4?=
 =?utf-8?B?UVBLMXdTVjN2S0c3M2hPMlZ5aEtWSFpFTy9oNFhXWmVkbjZVSUx6RC82MUE1?=
 =?utf-8?B?VkRTcEF0OGRGaW9iUzZXak1YNjdDRHZoMXA0VXUyTmEyazluYklZUGw5c3Zn?=
 =?utf-8?B?SFNuT1B1L2V5SUgwc2hiYnRDaitwT0RzSW1hdFFxZCtIUWo0dW9xZEl1QU8x?=
 =?utf-8?B?aUFRdDJmNUxHMlNJSHBtWHhjR1dxcVBpZVBDV1dvM1hUenpOVkNIU0p6WEpj?=
 =?utf-8?B?SG4rNFJiSElUeWFsZnBFeEhlTDFpWmp3ZmlTZ21BK3dDdklHM1EvR1YxZlRh?=
 =?utf-8?B?NHFQalRkdjM2cHN4dXdNb2RKYTJhckxkd284ZEsycTM0aWE2MHdWZU80M1I1?=
 =?utf-8?B?bUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYAPR01MB6201.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebc0b1c3-f014-4d5b-b1a1-08da6ecd910d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2022 06:10:40.6666 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c4YSevQHtTF/CTrAd3PJWgokhf30AsVyLk8nGNuZhg0Xac6U6cp1+0df5VnhwJRh0hdkruK8Y9f12lSkdQyi85i5GD0a73QiedDAnSSpfaU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB1900
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

U29ycnkgZm9yIHRoaXMgcGF0Y2ggbm90IGJlaW5nIHdlbGwgZm9ybWF0dGVkLg0KDQpJJ2xsIGFk
ZCBjaGFuZ2UgbG9nIGFuZCB0aGUgc2lnbmVkLW9mZi1ieSB0YWcuDQpJIHNob3VsZCBoYXZlIGNo
ZWNrZWQgcGF0Y2hlcyB3aXRoIGNoZWNrcGF0Y2gucGwgYXMgd2VsbCBhcyB0ZXN0aW5nIHNvdXJj
ZXMgd2l0aCAtLWZpbGUgb3B0aW9uLg0KDQpSZWdhcmRzLA0KICBZdWppIA0KDQo+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEdyZWcgS0ggPGdyZWdraEBsaW51eGZvdW5kYXRp
b24ub3JnPg0KPiBTZW50OiBNb25kYXksIEp1bHkgMjUsIDIwMjIgOTo0NyBQTQ0KPiBUbzogaXNo
aWthd2EgeXVqaSjnn7Plt50g5oKg5Y+4IOKXi++8su+8pO+8o+KWoe+8oe+8qe+8tO+8o+KXi++8
pe+8oemWiykNCj4gPHl1amkyLmlzaGlrYXdhQHRvc2hpYmEuY28uanA+DQo+IENjOiBSb2IgSGVy
cmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPjsgSGFucyBWZXJrdWlsIDxodmVya3VpbEB4czRhbGwu
bmw+Ow0KPiBpd2FtYXRzdSBub2J1aGlybyjlsqnmnb4g5L+h5rSLIOKWoe+8s++8t++8o+KXr++8
oe+8o++8tCkNCj4gPG5vYnVoaXJvMS5pd2FtYXRzdUB0b3NoaWJhLmNvLmpwPjsgSm9uYXRoYW4g
Q29yYmV0IDxjb3JiZXRAbHduLm5ldD47DQo+IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxp
bmFyby5vcmc+OyBDaHJpc3RpYW4gS8O2bmlnDQo+IDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+
OyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7DQo+IGxpbnV4LWtlcm5lbEB2
Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZzsNCj4gZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgbGluYXJvLW1tLXNpZ0BsaXN0cy5saW5hcm8ub3JnDQo+
IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgNC81XSBNQUlOVEFJTkVSUzogQWRkIGVudHJpZXMgZm9y
IFRvc2hpYmEgVmlzY29udGkNCj4gRE5OIGltYWdlIHByb2Nlc3NpbmcgYWNjZWxlcmF0b3INCj4g
DQo+IE9uIEZyaSwgSnVsIDIyLCAyMDIyIGF0IDA1OjI4OjU3UE0gKzA5MDAsIFl1amkgSXNoaWth
d2Egd3JvdGU6DQo+ID4gLS0tDQo+ID4gIE1BSU5UQUlORVJTIHwgMiArKw0KPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+IA0KPiBObyBjaGFuZ2Vsb2cgdGV4dD8NCj4gDQo+
IE5vIHNpZ25lZC1vZmYtYnk/DQo+IA0KPiBBcmUgeW91IHN1cmUgdGhhdCBjaGVja3BhdGNoIHBh
c3NlZCB0aGlzIHBhdGNoPw0KPiANCj4gZ3JlZyBrLWgNCg==

