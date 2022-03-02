Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6734CB90E
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 09:33:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C48D10EF36;
	Thu,  3 Mar 2022 08:33:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130053.outbound.protection.outlook.com [40.107.13.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AE1D10E13C
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 13:14:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bD7uL7i1qXpwAr2mpov2ldPJ+/1DZbryRsFJ9Ke4yaEA4UYI+qVflThUZwPw8kTHJTeVmIZ05LeIdaKp0Mx53dlSt6tmkYNfKqdHG4EMJ6Kedwm1Tam2D4pxQMWU6Cmfy5IZSbKgFug7Vuc3owijgPtI5IhESW2qpk35oRQKuivzcBjBfl8/t+z41qEtzO9kGH9TlVLwCT2LirHb+rbX/YMq0yftU2NR08zFOIHgZ4+mmp5xN6zNrWVqpoM/FcUrsdequVEfzFdTTNb0q1TrQKDvdkHEcXfr6tWneyLkFNvwxhmxhL0tNtyX5j2fl6xZvDQdC9kz5ThiErEk8zIGfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C3stJq7zAbFdBkQmylZXEJRF+YwKRg9IzUqNt0Mk/rQ=;
 b=JDqpjPHdvpqX7slh4SIWk2BTOIq6WnN9NlOooJwcKptTPinIC5kEESlj66W2SjKsPIWVZwiTjh2RmOmiQFbmXZYrPmnLjxgTt3Rs2d/CS7ZL+3PFxxqLz0ym9++NX54HN2WqxBlYJagfxDC/jyZiOydNKioGlye8aJfzEloyQJK3/ozfuEXTy0KO4BBFQph6YRKZ1oKu5dCMJJenhdskWP1GbtZ4Hq5XHNFHcj/qLVGsWrlldOxa7Iw2c0FqqzNzb82Cyp1ggZ1PwNPiK5Djn9nkvWKPb5yfbQQDDwhKNxYCKbGxJ5E8quBVUkwNwDouLQtImT0QhUQBxbiQ7xZYGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C3stJq7zAbFdBkQmylZXEJRF+YwKRg9IzUqNt0Mk/rQ=;
 b=DRyate1BekIudxUFmGKNn/3kYTO2J3w0QY8Y39DcvFrTPPKW/oZTDu4LZau6KfhnkxDyqudc4D6ir9JI54MWNPkUhkosiHns52idG7N7rhFQzTPVgO0XY25jg842o488yohxCEeBoT1p01BSmrLa3m23ZAdB7w32hlkF6AhjDf4=
Received: from VI1PR04MB6991.eurprd04.prod.outlook.com (2603:10a6:803:12d::13)
 by AM6PR04MB4646.eurprd04.prod.outlook.com (2603:10a6:20b:1a::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.13; Wed, 2 Mar
 2022 13:14:14 +0000
Received: from VI1PR04MB6991.eurprd04.prod.outlook.com
 ([fe80::714c:9519:48a9:bfa3]) by VI1PR04MB6991.eurprd04.prod.outlook.com
 ([fe80::714c:9519:48a9:bfa3%3]) with mapi id 15.20.5017.027; Wed, 2 Mar 2022
 13:14:14 +0000
From: Robby Cai <robby.cai@nxp.com>
To: Marek Vasut <marex@denx.de>, Lucas Stach <l.stach@pengutronix.de>, Adam
 Ford <aford173@gmail.com>
Subject: RE: [EXT] Re: [PATCH 1/9] dt-bindings: mxsfb: Add compatible for
 i.MX8MP
Thread-Topic: [EXT] Re: [PATCH 1/9] dt-bindings: mxsfb: Add compatible for
 i.MX8MP
Thread-Index: AQHYLRZRpDvsPWt1BUeVY4+4n78X96yqTT4AgAAEXACAAAy8gIAAIPcAgAAEOwCAAANPQIAA31CAgACpsQA=
Date: Wed, 2 Mar 2022 13:14:14 +0000
Message-ID: <VI1PR04MB6991E6759DA88E5A3804DB74F2039@VI1PR04MB6991.eurprd04.prod.outlook.com>
References: <20220228004605.367040-1-marex@denx.de>
 <35b981d0d9d763525c427491ca0e25b6e4c03d0f.camel@oss.nxp.com>
 <8eac8a2c-bc6d-0c79-c727-bdaa2cd9abee@denx.de>
 <a3ab4ec2dd0c7b87698bc7902509a4de6950dd25.camel@oss.nxp.com>
 <33207e88-da9b-96d7-0fef-461cb4496c88@denx.de>
 <284d65f53dffb6085bde6ef6ecd398f10d4c6c80.camel@oss.nxp.com>
 <8950434843ff7bbd1a527b0c799d9a74a75ee36d.camel@pengutronix.de>
 <7aeed693-dfb7-950f-fdf0-3c90de285392@denx.de>
 <8bf0b5a1c9ab9faee28077436cdfd49c0cd08792.camel@pengutronix.de>
 <CAHCN7xJ6ypDxZouZV1b1F1EgQFwdTvmY6EEekj+_z-UWbQMD5Q@mail.gmail.com>
 <4253aa4b5dc4a3568e45755678849961468bfd38.camel@pengutronix.de>
 <VI1PR04MB699190CC6CB1D5C37C4BB64CF2029@VI1PR04MB6991.eurprd04.prod.outlook.com>
 <3485f77c-667c-05fa-ff96-93e732247b49@denx.de>
In-Reply-To: <3485f77c-667c-05fa-ff96-93e732247b49@denx.de>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a5d78ef0-8552-499c-bbbc-08d9fc4e8ca4
x-ms-traffictypediagnostic: AM6PR04MB4646:EE_
x-microsoft-antispam-prvs: <AM6PR04MB464696E8491473A565D46232F2039@AM6PR04MB4646.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: L6qtNJjufqiCKyhzoXeAKubdf5pSKlix5/lObWUDP7BBcA9hdDLO0mFRC+gtfSyGdhZM68mOehy8eAJ4+KD+Tbd394og7Gxdm3m0vkj/ImW0qek8HYn5tP1+q5TgIQGfgy49EkeceEpF0Rn1VZKRHI4NcYpTEwIDM/ImGzjHnH3N5Yob4kTBU/ylccJ3KJGCW8K+t5Y+gq0wcy6ZHz4rcrXpjrYgkcUrPAZxMuZ5rRdp1hDS4yJ3T6vomANxYAH+e3LhXtDP3PSs+567VQNk/Zr2OG/bnWXxlpdDfPB7UAN/CfzTGGi//5uejRh/Br+b7loxSEkAUk3dtPEHfz0VMwPIbvrhiSoJ7IJp5fEA03TDJ68tEComoBKpbciFGBpvNWZzoWiaOuQAfyPcLHXgrEB9mO7kFw5Wq87FHBEVCeYNglALjR+kd0yonmfMe4YvfVQ6nFrLm2pLzXA76yZz0Hc5Pj91LokplUd91BtXE3A6Ar17r/53I49TNlPIY3tOBh+3MzkEfdoEK4zW07n8kByOrYnmtZXV7JVHtgQ4n4HM+SmI+TvHKOf3+OavVBgj2lkiqKPDYB+2rFSlRM62Pk2rKABdyOl9oOOT9naMeSnmmJX03nba7SGhuo7LKqhTArf/oZyyfjx8YbeYavHnHaDqc40mB3pi3diSray1zxR1/pSxrBTRVSDh2T26hCXkUeR2DT+ZkP6ZhAoohPqyRKcPO8JUoBioDEBYrR4ntnh2u5qh53W9V50IhIDJ1z69OVPgOTFLKK6FG96VobTEtJWOp2Iioxvl7flMuxli03Q=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB6991.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(38100700002)(2906002)(9686003)(7696005)(122000001)(186003)(55016003)(83380400001)(33656002)(26005)(5660300002)(54906003)(110136005)(8936002)(71200400001)(52536014)(8676002)(4326008)(966005)(64756008)(66446008)(66476007)(66556008)(498600001)(66946007)(76116006)(44832011)(38070700005)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K1BSZWY5UnJxMktUdnV5by9HNWNHaHpYdEYzTG55ZzFhaFRuSjRYYVFQNjhN?=
 =?utf-8?B?djg3TW13RFJYbE1aVTE3bndLblhQOW85dDRabkpYRWhmekdkUVpUNDVOdjI4?=
 =?utf-8?B?YVliM3FxQS9uOGtrVmJQcC9IR2Z3VVNKdjdpalZEOU5ZVGF0ZXRQUkQyWHJp?=
 =?utf-8?B?YzhVRDFBWUkyZmVQbHUwYldFQ2VnUm03NUxyYWNWUTE2MFFHb0ZGNnZLYjBs?=
 =?utf-8?B?dWxpVWFtNkgxeUZ6RTJKNElneFNqUlJFcTFBT1NHakpucGptY1BWTEMrZFlP?=
 =?utf-8?B?UHpqM0pBSkcvMy9abGdMYzJlY0pPVVNBQVdEVVdSQkd3WXprbGRGQ2ZIOUlR?=
 =?utf-8?B?OXBjMHpWOTJQNXdPQ1ppazNaVmdhU2RMVG5nbzdtLzB3aS8vUTB3cnlJTDBI?=
 =?utf-8?B?a0dHbWlvMm1yVHlINE95NTlFcEdZNWoyV3NUSW9ReXQybWlQa1ZXYUpKVFBr?=
 =?utf-8?B?ZUE0NUc2cVRDOWQvckxodEdkdVIvNEZBR1M5M0NxU1N6a0hGYkk1d1RZUnpj?=
 =?utf-8?B?VURPR2pNcTFZNCtiUDhvay82ODhvWHk0QythcG54c2xPK2Q5RStjakIwcjVZ?=
 =?utf-8?B?RmNvdW8yNUpYcUlLbkdHc2YyajV0d00reDU2LzlTQWVqNll5NTJEZzVVL3k4?=
 =?utf-8?B?NDd3OVRpTjV2MHRBaGVtY09qbUd6cWlTMVBaN1pRYmFZRkQvZklPdnZQUURE?=
 =?utf-8?B?bStCdllYN3JJL3RJUDBua0lOSTErb1hBOHpDUUtoMHNxNGhjSE1UQ0xHcUhp?=
 =?utf-8?B?R1JQTkwwTjZHUDJiSlcxaXkrUTl4a2tLSjR6WUZJN0JUV1E1akMxRTErRC95?=
 =?utf-8?B?ZW1SQVhoaDhCMkQwQ2MvUkdWa1dscjBvTWgySm9kMlJLSXZ3RHIyVVBkRnY5?=
 =?utf-8?B?QWdaWUI1UC95Sk1xRHFuSTF0SXRGYURIU21ONC9taGt5WkRQUjd2WS9KOVVh?=
 =?utf-8?B?dElzbXRWcmxtUWZvZTVWQnlmNk11TjNheTk4cXd6cHphYkxsSkM4dEJnVFZy?=
 =?utf-8?B?cFc1YTUxZG5SQ0VZWHEvTlNqV1J1ZDQxOXF0RHJCdjJLWnlZTklxVkJrZlQ4?=
 =?utf-8?B?bXNyMkR1S1QyQVRENWRoQ1ZBL3ZJY1hNUFlSSWM0bnlpSkg0M1piTnNJQ20r?=
 =?utf-8?B?SUVoTU9PalJHWU5WOHhVZ3RJMHdGeGFIOFFzNVRlZjY2amZqMklNaE5udWVz?=
 =?utf-8?B?RmRwaEpLSmNYS2VWamlGNm9GZDlCUFVINlRPZStVNUtlclNOU3k4NnhWSlZP?=
 =?utf-8?B?ZzRVODlOTG5kRkoxSWRKR2J5K050T3FGQzZGV3lUNFY4aWpFdm5vdmZydDhl?=
 =?utf-8?B?Y2FPZS84TDR3Z0Y5RXJ3SFdoTXhFRzR5c3d6QzYwdSs3cHBRT3BLYUE4RStE?=
 =?utf-8?B?RDdmSmM3dUEwbDlaTDI2YnRyYlpkVFNkM1l0a1RxdlBMcFJDRWovK2pYQWFn?=
 =?utf-8?B?ZEJXK2VGRE0wNDFGUVhpU2J6STgxVDc1VWw3NVowQXZ1RkQrUVdzVVA2dXhR?=
 =?utf-8?B?K3Z5Zlc4QzRIT20zdTJjS2F5R1RsS0dJQWIyY2VnS0J6V1hURjQ4UVJmZUVs?=
 =?utf-8?B?YnlFQVNWb1ZYcXgwZ1Nxb3lXSFlpbm1NSFdjWGptTFlSWXk1alowQ0ZxL1hz?=
 =?utf-8?B?alBjc3NobDFUaFNGc1VndmJlS1lRNGZtbVd3TW1CTU1JK21HRkR4VzdPRmU3?=
 =?utf-8?B?UHoxSmlUTXlmUnVBT3lRNmsrMEdnUyszOFVqN1J2L2hvb3lLZ1l0dzVsUlla?=
 =?utf-8?B?dk5nWXBXOFo0UytJYkc0VkI5NmtTYktpTWgzNFZBbTk3R3V5Y3BWM0tFVmJo?=
 =?utf-8?B?OGFEODRHeG4zbWNmL0hqZnBRZkJKUmVjaVdrd3NkRlAvdE9ldWo1ZXRQVXgr?=
 =?utf-8?B?ZjkycnVJZjRHT3BJa2t0OTNXRjlwbFRHZ0hIREFuVHFvTWh2dy9YV21abU8w?=
 =?utf-8?B?eE9Ha3JFSWdyYTQwQmFDdmE2OU5VYWExZTFUb00yakR6R2hKRldrYzNvcGpO?=
 =?utf-8?B?MWljQjFYWWdXcVRwM3I1R0h6Z3JBWW9ENjJKSmdhOThyM3RJU1VDc0oyS1hQ?=
 =?utf-8?B?OEFNQlpjZEtORzZsVDQzWC9NRlo3YzRhdTZTbk1QWkNRTkQ2TVJWUXlaVWN6?=
 =?utf-8?B?Wi94dUNxL2JSRC9aVVJWOXJydVlMdUpFQzMvNDAyWjJDTFNxbEl1bEtFMGU2?=
 =?utf-8?B?TWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB6991.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5d78ef0-8552-499c-bbbc-08d9fc4e8ca4
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2022 13:14:14.5484 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eiYP4OV0jyAZ1lBxjXJ4dKKP8f55tsSGzSm9fAzj4ACdoJKcq05UrJrv8mV1fUxWc022Pl9UHK7Ryuxme6UfvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4646
X-Mailman-Approved-At: Thu, 03 Mar 2022 08:33:09 +0000
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
Cc: devicetree <devicetree@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "Ying Liu \(OSS\)" <victor.liu@oss.nxp.com>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogTWFyZWsgVmFzdXQgPG1hcmV4QGRl
bnguZGU+DQo+U2VudDogMjAyMuW5tDPmnIgy5pelIDEwOjUwDQo+VG86IFJvYmJ5IENhaSA8cm9i
YnkuY2FpQG54cC5jb20+OyBMdWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5ndXRyb25peC5kZT47DQo+
QWRhbSBGb3JkIDxhZm9yZDE3M0BnbWFpbC5jb20+DQo+Q2M6IFlpbmcgTGl1IChPU1MpIDx2aWN0
b3IubGl1QG9zcy5ueHAuY29tPjsgZHJpLWRldmVsDQo+PGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmc+OyBkZXZpY2V0cmVlIDxkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZz47DQo+UGVu
ZyBGYW4gPHBlbmcuZmFuQG54cC5jb20+OyBBbGV4YW5kZXIgU3RlaW4NCj48YWxleGFuZGVyLnN0
ZWluQGV3LnRxLWdyb3VwLmNvbT47IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+Ow0K
PkxhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT47IFNh
bSBSYXZuYm9yZw0KPjxzYW1AcmF2bmJvcmcub3JnPg0KPlN1YmplY3Q6IFJlOiBbRVhUXSBSZTog
W1BBVENIIDEvOV0gZHQtYmluZGluZ3M6IG14c2ZiOiBBZGQgY29tcGF0aWJsZSBmb3INCj5pLk1Y
OE1QDQo+DQo+Q2F1dGlvbjogRVhUIEVtYWlsDQo+DQo+T24gMy8xLzIyIDE0OjM3LCBSb2JieSBD
YWkgd3JvdGU6DQo+DQo+SGksDQo+DQo+Wy4uLl0NCj4NCj4+Pj4gSSB0ZW5kIHRvIGFncmVlIHdp
dGggTWFyZWsgb24gdGhpcyBvbmUuICBXZSBoYXZlIGFuIGluc3RhbmNlIHdoZXJlDQo+Pj4+IHRo
ZSBibGstY3RybCBhbmQgdGhlIEdQQyBkcml2ZXIgYmV0d2VlbiA4bSwgbWluaSwgbmFubywgcGx1
cyBhcmUNCj4+Pj4gY2xvc2UsIGJ1dCBkaWZmZXJlbnQgZW5vdWdoIHdoZXJlIGVhY2ggU29DIGhh
cyBpdCdzIG93biBzZXQgb2YgdGFibGVzIGFuZA0KPj4+PiBzb21lIGNoZWNrcy4gICBMdWNhcyBj
cmVhdGVkIHRoZSBmcmFtZXdvcmssIGFuZCBvdGhlcnMgYWRhcHRlZCBpdCBmb3INCj4+Pj4gdmFy
aW91cyBTb0Mncy4gIElmIHRoZXJlIHJlYWxseSBpcyBuZWFybHkgNTAlIGNvbW1vbiBjb2RlIGZv
ciB0aGUNCj4+Pj4gTENESUYsIHdoeSBub3QgZWl0aGVyIGxlYXZlIHRoZSBkcml2ZXIgYXMgb25l
IG9yIHNwbGl0IHRoZSBjb21tb24NCj4+Pj4gY29kZSBpbnRvIGl0cyBvd24gZHJpdmVyIGxpa2Ug
bGNkaWYtY29tbW9uIGFuZCB0aGVuIGhhdmUgc21hbGxlcg0KPj4+PiBkcml2ZXJzIHRoYXQgaGFu
ZGxlIHRoZWlyIHNwZWNpZmljIHZhcmlhdGlvbnMuDQo+Pj4NCj4+PiBJIGRvbid0IGtub3cgZXhh
Y3RseSBob3cgdGhlIHN0YW5kYWxvbmUgZHJpdmVyIGxvb2tzIGxpa2UsIGJ1dCBJDQo+Pj4gZ3Vl
c3MgdGhlIG92ZXJsYXAgaXMgbm90IHJlYWxseSBpbiBhbnkgcmVhbCBIVyBzcGVjaWZpYyBwYXJ0
cywgYnV0DQo+Pj4gdGhlIGNvbW1vbiBEUk0gYm9pbGVycGxhdGUsIHNvIHRoZXJlIGlzbid0IG11
Y2ggcG9pbnQgaW4gY3JlYXRpbmcgYQ0KPmNvbW1vbiBsY2RpZiBkcml2ZXIuDQo+Pj4NCj4+PiBB
cyB5b3UgYnJvdWdodCB1cCB0aGUgYmxrLWN0cmwgYXMgYW4gZXhhbXBsZTogSSdtIGFsbCBmb3Ig
c3VwcG9ydGluZw0KPj4+IHNsaWdodGx5IGRpZmZlcmVudCBoYXJkd2FyZSBpbiB0aGUgc2FtZSBk
cml2ZXIsIGFzIGxvbmcgYXMgdGhlIEhXDQo+Pj4gaW50ZXJmYWNlIGlzIGNsb3NlIGVub3VnaC4g
QnV0IHRoZW4gSSBhbHNvIG9wdGVkIGZvciBhIHNlcGFyYXRlIDhNUA0KPj4+IGJsay1jdHJsIGRy
aXZlciBmb3IgdGhvc2UgYmxrLWN0cmxzIHRoYXQgZGlmZmVyIHNpZ25pZmljYW50bHkgZnJvbQ0K
Pj4+IHRoZSBvdGhlcnMsIGFzIEkgdGhpbmsgaXQgd291bGQgbWFrZSB0aGUgY29tbW9uIGRyaXZl
ciB1bm1haW50YWluYWJsZQ0KPj4+IHRyeWluZyB0byBzdXBwb3J0IGFsbCB0aGUgZGlmZmVyZW50
IHZhcmlhbnRzIGluIG9uZSBkcml2ZXIuDQo+Pj4NCj4+PiBSZWdhcmRzLA0KPj4+IEx1Y2FzDQo+
Pg0KPj4gTENESUYgb24gaS5NWDhNUCBpcyBhIGRpZmZlcmVudCBJUCB3aGljaCBpcyBib3Jyb3dl
ZCBmcm9tIG5vbi1pTVggc2VyaWVzLA0KPmFsdGhvdWdoIGl0J3MgYWxzbyBjYWxsZWQgJ0xDRElG
Jy4NCj4+IFdlIHByZWZlciBub3QgbWl4IHRoZXNlIHR3byBzZXJpZXMgb2YgSVBzIGluIG9uZSBk
cml2ZXIgZm9yIGVhc2Ugb2YNCj5tYWludGVuYW5jZSBhbmQgZXh0ZW5zaW9uLg0KPg0KPldoZXJl
IGRvZXMgdGhlIE1YOE1QIExDRElGIGNvbWUgZnJvbSB0aGVuLCBTR1RMIG1heWJlID8NCg0KQUZB
SUssIGl0J3MgUlQxMTcwLiBZb3UgbWF5IGhhdmUgYSBjaGVjayBvbiBSTSBbMV0uIEludGVyZXN0
aW5nbHksIHRoaXMgU29DIGhhcyBib3RoIGVMQ0RJRiBhbmQgTENESUZ2MiwgdHdvIElQcyB3ZSBh
cmUgdGFsa2luZyBhYm91dC4NCg0KWzFdIGh0dHBzOi8vd3d3Lm54cC5jb20vd2ViYXBwL0Rvd25s
b2FkP2NvbENvZGU9SU1YUlQxMTcwUk0NCg0KUmVnYXJkcywNClJvYmJ5DQo=
