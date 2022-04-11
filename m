Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C5B4FB756
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 11:24:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CBFA10F76D;
	Mon, 11 Apr 2022 09:24:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2059.outbound.protection.outlook.com [40.107.22.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7431110F76D
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 09:24:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IjbPHatV0XfpeKu/Ax7zMbP9ctSdPVG1CkYyAZwIxsQ1k4fIkCwDjCWV4ht7quPz6Vd5I+HppJMMOCRb5pwBMrIKMfduhtkCDwMKXqfPwCLTQiVFitxifHrmd4wxEhtdyCKao0KDfEosBg8wzsmIqxJDMPsNyfffqeLDawcsSP1tRsmz4FtA8dJSqpXMoS+oSLfMbOELXk4yuWEERWxYgoMkZRNp4VsN+k18jmCielB1tZOjpTwmz27gc65/aT/r49LxqDtrQckbYbOPQOVA7tMvAEnRnmdyQulOdPUkno1rckAlzIiRjvRoLmq+/vqdAdsqp7qiR8I6ley8F20/vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wa32a+X7NcW5L9IPbZ7TkfbDtnF1hsDa2UGUloI3/qY=;
 b=N145EER4Hb3k7Kc9R+sgb06E05tN3QGCrxLt48Nt5tSSLEAZTrDf2ez2TYUmzStnT1/QL9hVcIKiW7e9IkLSAGGO3GSRirktZVEHDxfUtg9dCE8i8nPBUjFjObu7wCX6dQwXsvmiZK215uX55nVdy5xncaUsimE42uinjyXLF/cMAIpgWpyUgkVLGXPadQEKGpMj/MbivnukAzrU/pmXsxGhvAWp2FmrECzstI9V0oc1ZgzHgE3tLAx6Rlh1+8jFzwLiSLwYh8DG1uzDQzaRpZkm6MNtQWVXLp1qVrsWvIzC0ftm06M1+an85u4jrfBns0CO7WZi6mBbdzqmQHN/cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wa32a+X7NcW5L9IPbZ7TkfbDtnF1hsDa2UGUloI3/qY=;
 b=W70jaRf9Ry+h+hBsC+4m3ebyvSioQKuMCaOQFX1svncuTF+3hWliT9bA9TnZ6mgmXfvPf9KnZ0t9gfXhvA3ThpzDGH9OCVkCysqg96GARopOy6Ps97MoafVk7PmcFuq5w7qoOFvai+5cUMhLKzlZQnBlkxSILTWPEOzG5WBRpbM=
Received: from DB7PR04MB5450.eurprd04.prod.outlook.com (2603:10a6:10:86::11)
 by AM9PR04MB8826.eurprd04.prod.outlook.com (2603:10a6:20b:409::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 09:24:11 +0000
Received: from DB7PR04MB5450.eurprd04.prod.outlook.com
 ([fe80::7997:2892:d230:2430]) by DB7PR04MB5450.eurprd04.prod.outlook.com
 ([fe80::7997:2892:d230:2430%7]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 09:24:11 +0000
From: Sandor Yu <sandor.yu@nxp.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>, "robert.foss@linaro.org"
 <robert.foss@linaro.org>, "Laurent.pinchart@ideasonboard.com"
 <Laurent.pinchart@ideasonboard.com>, "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>
Subject: RE: [EXT] Re: [PATCH v2 3/5] drm: bridge: dw_hdmi: Enable GCP only
 for Deep Color
Thread-Topic: [EXT] Re: [PATCH v2 3/5] drm: bridge: dw_hdmi: Enable GCP only
 for Deep Color
Thread-Index: AQHYSzQN7JNypYhhz06euwsdfRBvh6zl9TiAgARg82A=
Date: Mon, 11 Apr 2022 09:24:11 +0000
Message-ID: <DB7PR04MB5450FE1EADEA356A6A2E34BCF4EA9@DB7PR04MB5450.eurprd04.prod.outlook.com>
References: <cover.1649412256.git.Sandor.yu@nxp.com>
 <a0f9def7e7438592f78ef0a16cd0a560be0e6133.1649412256.git.Sandor.yu@nxp.com>
 <25ca3826-44ee-ca6f-fb6b-1ef62f6da456@baylibre.com>
In-Reply-To: <25ca3826-44ee-ca6f-fb6b-1ef62f6da456@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a90122c1-dec2-4160-0bf6-08da1b9d09ad
x-ms-traffictypediagnostic: AM9PR04MB8826:EE_
x-microsoft-antispam-prvs: <AM9PR04MB8826118953FCB3321112D3ECF4EA9@AM9PR04MB8826.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NQWm6xxlK5NMOuXFzMVDQVffz1Jg8wUDjlUiVQGfc6Iktrfr5yS1XRByQhpUU6+3E19nN19MwCv/BI9+NROhQYJ07sEkIlfteHrhJzp3ebPedSvaRkkvGBdruBJ2Pzb6F4e3bnmuGbldBzbBeL6929rXW2dAs0znXVWa5XHJpqo6DGnMCF329jg4h4melsRvMX2S2n9hF6O4oQ4BgvZzEmYcVk5M5JdDQn79EftRYAu+Vx2vRqpWAqm/uHLs7/iCXaVblHyiK/WOU8F+G3v/Ae4ZpIz7LoTEMfX05yfcDzLZdl3ythbonRzoN8hRUxVFYHOFQlbjXxAlycq0hemnVUqdY4zPSOgF9lbBNo7/4cadRDln7Ou1IUWVR/KUkaColJuFopbchAlFvrhSt3yfLmgYO1qs1qE8wCliohwDcC6hIZumubUcs5gXy0worSLkVCOdgSytMUkpByrn7A/9gJPDpaTbIqY8LqUI4HWCle/qld6/FrhqcLE9qW2JDOGu253KasB+Icw6IZJmCI5vdEYZNEY4XjGEZjlgjspbV7cllYDaUMQ3qAinfBY2en980hV9wh3TE0tWiTiG3r1bXrHC9sYrb5pcoO0TRz7xHz5uyAlZW1eLQX1erxxZOEU4pU/xsWjQHhlEs41KuXQeqsxcYl3jbQJq7+PwqX8Y6wTnxgV7tgi3Z5MNj18VKyNLlLkTZRcB7CebTlQ7gJAsEg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB7PR04MB5450.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4326008)(66446008)(122000001)(66946007)(64756008)(8676002)(508600001)(86362001)(38100700002)(9686003)(52536014)(76116006)(71200400001)(33656002)(8936002)(55016003)(54906003)(66476007)(38070700005)(110136005)(66556008)(53546011)(2906002)(6506007)(7696005)(44832011)(83380400001)(26005)(186003)(7416002)(5660300002)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eXJXT2Q2ekVNMmpLNDJPVWwvdXo4NktpTU4vSTNSb1FRUkJwNUFBWFlzY2dF?=
 =?utf-8?B?M054a2k1NHdTSlZ3MG1VNWpSMWVuZ3VlVm5FdGRwU3pORmdVczVkM3YyOThN?=
 =?utf-8?B?REVWWTZ4bUlZTUJGSVF0eHJCVGhnRlZpeE00TTVqZkg5V2lPbUlJa08zQkk1?=
 =?utf-8?B?TVUvNzlUVTl5Zjd0NzUvaUprdGI4V3RQbWJGVVR6aGxTMjRINXpmWkYzdGZm?=
 =?utf-8?B?eVhWUjluS0hkZzBUaDNMOWFGWkJ4a1VaNnA2VG5jcDhJQzF2aUQ1bXRrVDNN?=
 =?utf-8?B?akRoK3RmaFQ0TkZmaTM2eFpNWnNGZXMwb01UMW9MVG5JYktMcGovOGFmK3U1?=
 =?utf-8?B?TmV4dFBYQlNCMUUya0trQUhJSEs2UC9zU1BXRFh4QUg4azZvYm1iVUE3aFl6?=
 =?utf-8?B?S0FNZE8rNklWYmRSQkdRSjJXdCtDRkdiWVFMcEFSMUpNMndqVS9iaVBleHNG?=
 =?utf-8?B?cDN4UHpIczZQQXVGUzdjV3k4L1o1T0c5R0lVODkzNzZPTkh4ZDlOWlo4Qnox?=
 =?utf-8?B?eUFOUUo3Vy9lRVk5bmNuanQrek5ZRzhpR1lndGpxMlBZTm14eDluL1NUaWRI?=
 =?utf-8?B?YXAwdDFyMGNyOXNwQ2t2cnFqU1FRRUsrNjBiakYrOEtlNDFmSXBVcnpINVFm?=
 =?utf-8?B?WjFyZDRrc3huOHhFSGZYOGtPNHdHM3J1OS83ZnFjSXZtR1NyQ0ZBL0p0alc1?=
 =?utf-8?B?dTJ5Q2NOeTYrZmZwRStyY3g4bWxBbi9kRU56cXM4NXRiY2ZSTmNQVTdrMGM2?=
 =?utf-8?B?TG1hKytYbjFRTGpmTlBzKzZuTXIxc29pdFV3SEZOb2diMGY3MWF4d1Rzdnk5?=
 =?utf-8?B?aEJTeTZINEVnci84c21BNllBdU92L0tUcEJIVFE0dXY3bkNpNVYrdFZtcUhI?=
 =?utf-8?B?SzZBa1NyenFiY1VYNUM4dndabXFsRFc5T2MwbEM4bkd6RWFJdis0VXBVb2Y5?=
 =?utf-8?B?TlRZaUZHaEo1eHZOeWNPaitib3hOMHJ1UHB4Q1JLNXBrV1N5WDM5ZXRaWCta?=
 =?utf-8?B?K29ZODFJcEMxZlgvMm5EUnhiVVVEUExrcW80TnI1ZkFMYXR2MkduakU4M1NP?=
 =?utf-8?B?S3ZQSER3TTJqM3pDTVk0dElUMnNzWFk3d0IwSWdrS1VlQUoreVVvWmFYWDVO?=
 =?utf-8?B?dGRralBpczFvemdiSVNaYWVDZTVjM1FNY2lGaU1oWERyWElNWXN4SzZmWjhJ?=
 =?utf-8?B?dGpMcFJWS05qbm81TWdvdmZocUI2NjRSV2xVc3NSRGt3dkJwTVpFcEMrc1RC?=
 =?utf-8?B?dXkxbVlHaVUwMGpTU2ZJb3RiaDFWelJRYXo4N043Y0lTUVJZVXROYUdUclhT?=
 =?utf-8?B?OGhVSDRpSll2eWlzMEs4Z3BVK0ZXdEpxd1ppNjJMVUc4aXJQNEJVNW91RXlt?=
 =?utf-8?B?Y1k4bVorYVArTUJXaEhrbW10a055QXpTYWU3VyttaEoxTmtBZy9lbmcyQzZT?=
 =?utf-8?B?Smlvcitldm9qQVByMmNKbW4ySnJMWndJYjZPMTBmNGVablBZNDAyUjgxZ2lQ?=
 =?utf-8?B?N05QUVVtMTVBR01oZzU1ZGg3MGdTdDBHVnBzR2QzSXU3N0xtb2orcG9IQzRC?=
 =?utf-8?B?SUR4QWNUNkI1Qzk5QWdnNU5ib2Z5bXhnbXVmNXFJank2MmJJN1lienNTNWtC?=
 =?utf-8?B?WTFYVjJlNWwrVDUvRFYyOVVOOVZkekVTK1c3bmNWSlIwN0RuMDVGMEVOTm1P?=
 =?utf-8?B?eTZUY1pZbzZ0WjZreXpacmZydlZYNlFqQUc1QUM0S1hIZzdZRGZYMnNsTHda?=
 =?utf-8?B?VHBEUEFjS0tuaUliRVpUUjN5QVlvaHJ5WGpRc2ZzbXc1ZldPQ2lxNnZ2bDYy?=
 =?utf-8?B?bjVwNFdMUno4RlVScnlpb3hKb1NRTTNyTFhaVFJZMGtVSWlCOXdBaUs4bUVW?=
 =?utf-8?B?SjRoWXlyWVR1VmQzU0dTbVZCSjFFNThSd2VINVJxQVk3blh3dlJ1SmszdjRN?=
 =?utf-8?B?SWE0cWpwNXBGNWtNZVFENm52ZnN6V3owVERPRTIrTnFNYzN4dWhsV1kvelhi?=
 =?utf-8?B?MWFsc0JPdUpwcUZFWU9lcGIzaFU0bWRQSjM4Y0ZEamo5TXRTRytSdzZzaGVp?=
 =?utf-8?B?eUdUTFc5R3YveDhmenQ3RGRodWRPWUp6b28vNGhlOVlEZzNodnRndzNnS2lE?=
 =?utf-8?B?QmNoVVUxYzl5YWRuT3RYc3A0WGJUa1UxczR3akc5NzJFS2JMd21HQUk1aTAz?=
 =?utf-8?B?MnkwLzV1M1dmUitULzNZcTg5T2pVR2JHcjQ2dytSSzRFUEtTMlNNMW9zbkFD?=
 =?utf-8?B?VEwrdjEvRmNKRlRFdWFvZ1dpaDQ1c0gxeXhNMUpPTGpTYURVRm1BWWl3cURB?=
 =?utf-8?B?ZWZJV0QzU2UwNnpOM0QyUGhMUm9oWnlSVWphSms3YXYyNWk2UkJaZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5450.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a90122c1-dec2-4160-0bf6-08da1b9d09ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2022 09:24:11.1716 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 36ksfOeYqqN8IinBOZtEKXPzxy5NYEDTj/unKerFhUx5ufzxI82VwN4WI6k6rFSeKWXXgJgucsfxiuUUmC7Z6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8826
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
Cc: "S.J. Wang" <shengjiu.wang@nxp.com>,
 "cai.huoqing@linux.dev" <cai.huoqing@linux.dev>,
 "maxime@cerno.tech" <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTmVpbCBBcm1zdHJvbmcg
PG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPg0KPiBTZW50OiAyMDIy5bm0NOaciDjml6UgMjA6NDAN
Cj4gVG86IFNhbmRvciBZdSA8c2FuZG9yLnl1QG54cC5jb20+OyBkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnOw0KPiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBhbmRyemVqLmhh
amRhQGludGVsLmNvbTsNCj4gcm9iZXJ0LmZvc3NAbGluYXJvLm9yZzsgTGF1cmVudC5waW5jaGFy
dEBpZGVhc29uYm9hcmQuY29tOw0KPiBqb25hc0Brd2lib28uc2U7IGplcm5lai5za3JhYmVjQGdt
YWlsLmNvbTsgaHZlcmt1aWwtY2lzY29AeHM0YWxsLm5sDQo+IENjOiBTLkouIFdhbmcgPHNoZW5n
aml1LndhbmdAbnhwLmNvbT47IGNhaS5odW9xaW5nQGxpbnV4LmRldjsNCj4gbWF4aW1lQGNlcm5v
LnRlY2g7IGhhcnJ5LndlbnRsYW5kQGFtZC5jb20NCj4gU3ViamVjdDogW0VYVF0gUmU6IFtQQVRD
SCB2MiAzLzVdIGRybTogYnJpZGdlOiBkd19oZG1pOiBFbmFibGUgR0NQIG9ubHkgZm9yDQo+IERl
ZXAgQ29sb3INCj4gDQo+IENhdXRpb246IEVYVCBFbWFpbA0KPiANCj4gT24gMDgvMDQvMjAyMiAx
MjozMiwgU2FuZG9yIFl1IHdyb3RlOg0KPiA+IEhETUkxLjRiIHNwZWNpZmljYXRpb24gc2VjdGlv
biA2LjUuMzoNCj4gPiBTb3VyY2Ugc2hhbGwgb25seSBzZW5kIEdDUHMgd2l0aCBub24temVybyBD
RCB0byBzaW5rcyB0aGF0IGluZGljYXRlDQo+ID4gc3VwcG9ydCBmb3IgRGVlcCBDb2xvci4NCj4g
Pg0KPiA+IERXIEhETUkgR0NQIGRlZmF1bHQgZW5hYmxlZCwgY2xlYXIgZ3BjX2F1dG8gYml0IGZv
ciAyNC1iaXQgY29sb3IgZGVwdGguDQo+IA0KPiBJdCdzIHJpZ2h0IGJlY2F1c2Ugd2UgZG8gbm90
IGhhbmRsZSBBVk1VVEUsIFBpeGVsIFBhY2tpbmcgbm9yDQo+IERlZmF1bHRfUGhhc2UuDQo+IA0K
PiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogU2FuZG9yIFl1IDxTYW5kb3IueXVAbnhwLmNvbT4NCj4g
PiAtLS0NCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIHwg
MTIgKysrKysrKysrKysrDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQ0K
PiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHct
aGRtaS5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYw0K
PiA+IGluZGV4IDAyZDhmN2UwODgxNC4uNWE3ZWMwNjZlMzdhIDEwMDY0NA0KPiA+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jDQo+ID4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMNCj4gPiBAQCAtMTEwOCw2ICsxMTA4
LDggQEAgc3RhdGljIHZvaWQgaGRtaV92aWRlb19wYWNrZXRpemUoc3RydWN0DQo+IGR3X2hkbWkg
KmhkbWkpDQo+ID4gICAgICAgdW5zaWduZWQgaW50IG91dHB1dF9zZWxlY3QgPQ0KPiBIRE1JX1ZQ
X0NPTkZfT1VUUFVUX1NFTEVDVE9SX1BQOw0KPiA+ICAgICAgIHN0cnVjdCBoZG1pX2RhdGFfaW5m
byAqaGRtaV9kYXRhID0gJmhkbWktPmhkbWlfZGF0YTsNCj4gPiAgICAgICB1OCB2YWwsIHZwX2Nv
bmY7DQo+ID4gKyAgICAgdTggY2xlYXJfZ2NwX2F1dG8gPSAwOw0KPiA+ICsNCj4gPg0KPiA+ICAg
ICAgIGlmIChoZG1pX2J1c19mbXRfaXNfcmdiKGhkbWktPmhkbWlfZGF0YS5lbmNfb3V0X2J1c19m
b3JtYXQpIHx8DQo+ID4NCj4gaGRtaV9idXNfZm10X2lzX3l1djQ0NChoZG1pLT5oZG1pX2RhdGEu
ZW5jX291dF9idXNfZm9ybWF0KQ0KPiA+IHx8IEBAIC0xMTE3LDYgKzExMTksNyBAQCBzdGF0aWMg
dm9pZCBoZG1pX3ZpZGVvX3BhY2tldGl6ZShzdHJ1Y3QNCj4gZHdfaGRtaSAqaGRtaSkNCj4gPiAg
ICAgICAgICAgICAgIGNhc2UgODoNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgY29sb3JfZGVw
dGggPSA0Ow0KPiA+ICAgICAgICAgICAgICAgICAgICAgICBvdXRwdXRfc2VsZWN0ID0NCj4gPiBI
RE1JX1ZQX0NPTkZfT1VUUFVUX1NFTEVDVE9SX0JZUEFTUzsNCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgY2xlYXJfZ2NwX2F1dG8gPSAxOw0KPiA+ICAgICAgICAgICAgICAgICAgICAgICBicmVh
azsNCj4gPiAgICAgICAgICAgICAgIGNhc2UgMTA6DQo+ID4gICAgICAgICAgICAgICAgICAgICAg
IGNvbG9yX2RlcHRoID0gNTsgQEAgLTExMzYsNiArMTEzOSw3IEBADQo+IHN0YXRpYw0KPiA+IHZv
aWQgaGRtaV92aWRlb19wYWNrZXRpemUoc3RydWN0IGR3X2hkbWkgKmhkbWkpDQo+ID4gICAgICAg
ICAgICAgICBjYXNlIDA6DQo+ID4gICAgICAgICAgICAgICBjYXNlIDg6DQo+ID4gICAgICAgICAg
ICAgICAgICAgICAgIHJlbWFwX3NpemUgPQ0KPiBIRE1JX1ZQX1JFTUFQX1lDQzQyMl8xNmJpdDsN
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgY2xlYXJfZ2NwX2F1dG8gPSAxOw0KPiA+ICAgICAg
ICAgICAgICAgICAgICAgICBicmVhazsNCj4gPiAgICAgICAgICAgICAgIGNhc2UgMTA6DQo+ID4g
ICAgICAgICAgICAgICAgICAgICAgIHJlbWFwX3NpemUgPSBIRE1JX1ZQX1JFTUFQX1lDQzQyMl8y
MGJpdDsNCj4gQEANCj4gPiAtMTE2MCw2ICsxMTY0LDE0IEBAIHN0YXRpYyB2b2lkIGhkbWlfdmlk
ZW9fcGFja2V0aXplKHN0cnVjdCBkd19oZG1pDQo+ICpoZG1pKQ0KPiA+ICAgICAgICAgICAgICAg
SERNSV9WUF9QUl9DRF9ERVNJUkVEX1BSX0ZBQ1RPUl9NQVNLKTsNCj4gPiAgICAgICBoZG1pX3dy
aXRlYihoZG1pLCB2YWwsIEhETUlfVlBfUFJfQ0QpOw0KPiA+DQo+ID4gKyAgICAgdmFsID0gaGRt
aV9yZWFkYihoZG1pLCBIRE1JX0ZDX0RBVEFVVE8zKTsNCj4gPiArICAgICBpZiAoY2xlYXJfZ2Nw
X2F1dG8gPT0gMSkNCj4gPiArICAgICAgICAgICAgIC8qIGRpc2FibGUgQXV0byBHQ1Agd2hlbiAy
NC1iaXQgY29sb3IgKi8NCj4gDQo+IE1heWJlIGFkZCBhIG5ldyBkZWZpbmUgZm9yIEhETUlfRkNf
REFUQVVUTzNfR0NQX0FVVE8gYml0IGFuZCB1c2UgaXQNCj4gaGVyZS4NCk9LLCBJIHdpbGwgYWRk
IGl0Lg0KPiANCj4gPiArICAgICAgICAgICAgIHZhbCAmPSB+MHg0Ow0KPiA+ICsgICAgIGVsc2UN
Cj4gPiArICAgICAgICAgICAgIHZhbCB8PSAweDQ7DQo+ID4gKyAgICAgaGRtaV93cml0ZWIoaGRt
aSwgdmFsLCBIRE1JX0ZDX0RBVEFVVE8zKTsNCj4gDQo+IFBsZWFzZSBhbHNvIGFkZCBhIGNvbW1l
bnQgZXhwbGFpbmluZyB3ZSBjbGVhciBHQ1AgYmVjYXVzZSB3ZSBvbmx5IHRyYW5zbWl0DQo+IENE
IGFuZCBkbyBub3QgaGFuZGxlIEFWTVVURSwgUFAgbm9yIERlZmF1bHRfUGhhc2UgKHlldCkuDQo+
IA0KT0suDQoNClNhbmRvcg0KPiA+ICsNCj4gPiAgICAgICBoZG1pX21vZGIoaGRtaSwNCj4gSERN
SV9WUF9TVFVGRl9QUl9TVFVGRklOR19TVFVGRklOR19NT0RFLA0KPiA+ICAgICAgICAgICAgICAg
ICBIRE1JX1ZQX1NUVUZGX1BSX1NUVUZGSU5HX01BU0ssDQo+IEhETUlfVlBfU1RVRkYpOw0KPiA+
DQo+IA0KPiBUaGFua3MsDQo+IE5laWwNCg==
