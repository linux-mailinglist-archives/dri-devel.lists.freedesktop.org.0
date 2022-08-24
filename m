Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C67D459F5CD
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 10:58:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D2C710FBC0;
	Wed, 24 Aug 2022 08:58:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2096.outbound.protection.outlook.com [40.107.114.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0BBD10FBC0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 08:57:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LBCB1P83he22Hg9M5mS/j9Ic+S5/zGV1wqpWyeq6Dp1PuNOs8yn9IZWFLVf9Mcpz51Etlku5hBK7XvHcf+xL409gikncB8/lg7VtnnJBDzuW2IQ2QuMW3A7NDM+HWvCiKN2kDJk0NU+HZQ8rGx4TrjnWO9SGHOETbZh/wgkFglRrTPQ5iWvaIaYlxNtXY1NY1lm33qM6AfoU99C6DeJ15owdCsPaVifJ0bi5JdwqLGV/npE3OTrhh1MvuKU+hm/h3VwZQgMDogEoZE34Dgjv5AirHp+dCuOOAywSkoS5MesXTk1Rw91DGkdpEGmDjbinb7Sbs6DTLn1arZ+lsf4JMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MvjijARv/AAXdB1DVM3nIQjPA75PJ2+gx1LjisFHt4A=;
 b=afv5dE60vwnmIuOehCsCMKJr/IOPqTNTl/sOQLs3cWsYvrW6AlezcqeHvl1IT+44jKYDtITr0hsUJC7trvGUFp2l5xbavqqCO9MTYZyvVHywzD2YdeaTX+z1OfLr5QH8ki7OP8Zw+hnwjmZRBAx9X6AR1p1EPPFeSQle9ufFSrzvJ75VcQSE6ybCHa9QEHjV2ntKF46IjY/dvThOVYVnFYR93fRmTxVO1EepVHpbK9a3kNzkC8/LmgdVDdV228FfuJoP5uIRoGlwPa2SNpBAmDLeIfOPkdF7LRSEAUJ1dwTif1dioWkQ/GhqbSN4/b/Y3HKA0E/m1QvbVnng7K8yEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MvjijARv/AAXdB1DVM3nIQjPA75PJ2+gx1LjisFHt4A=;
 b=TfAk8N7fU30/FKsCXuU89W+LpxK5gru2GWC+TV63Z7kDGEoNhhXuR+ZrViOdOty85vj8ZDTS+V59MQSdlKQMO0jbfWRY6iN3xeU7QRSc/EctB2t/XHmG5LkfIIC0vU2Os0g+jGceurYPvmAHOl570I+4gCcr24DPB1cCe3GYuPQ=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSBPR01MB2968.jpnprd01.prod.outlook.com (2603:1096:604:19::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Wed, 24 Aug
 2022 08:57:42 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::14d3:5079:9de1:ceaf]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::14d3:5079:9de1:ceaf%3]) with mapi id 15.20.5546.024; Wed, 24 Aug 2022
 08:57:42 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: RE: [PATCH v5 04/10] drm: rcar-du: Add rcar_du_lib_fb_create()
Thread-Topic: [PATCH v5 04/10] drm: rcar-du: Add rcar_du_lib_fb_create()
Thread-Index: AQHYodMVXjawvh/XXkm3oEYnbtREVa20hmUAgAljCOA=
Date: Wed, 24 Aug 2022 08:57:42 +0000
Message-ID: <OS0PR01MB592256FBBD6074EC5807C1CE86739@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220727160753.1774761-1-biju.das.jz@bp.renesas.com>
 <20220727160753.1774761-5-biju.das.jz@bp.renesas.com>
 <CAMuHMdU8V9=w-uTt7Lx264wtz+TopHUD+W9H66y68tNMOG7P8w@mail.gmail.com>
In-Reply-To: <CAMuHMdU8V9=w-uTt7Lx264wtz+TopHUD+W9H66y68tNMOG7P8w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e677c5cf-b721-4245-4fa0-08da85aeb44d
x-ms-traffictypediagnostic: OSBPR01MB2968:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bOpQdbHLQdD91yA1NRlNRLYMTu++S6RYKrrF9xJ+3npuZZYaKpHxyPV3w/jiW9NYw5RszwjWOo5petgt8DAQ6fwU0B9mml5Q8ebwd0LUGUlJXlEynmfkGy8ZfiLNUZ8fUIp83EebWrdUQlfvqfXj8IYByxbmeOEahodNdz0a6tqSOqPx4BmqpZ9mqD2dletNcRMdo32+YLsK/it2PdejK5Up7w2AJ9tFo4ui1pdsJXNK0+ToVuPFmZDR/lvC4g3MLhXTtNORYguAiMUHQFOQDLqkhQxOoOoc0QwtV5Rg7u6KGc0RBRx5XbaTUHLJ5F4dFpYHWrlVth4pmJWOKsvAkjwKEoEBwNsGdbDaRpsSHTgTXeg3Ajz2J3VgteeO5PLcR6TSAOdzr4lk8MrC0TuBJB1dc1r7K79Shr0RmIuaMXARwJTgkcvYngLlemCZxJXuyt2xO9Lg8PTkn+00mnUNtIR7XwBEhtYAcrdwU9tyNpcsBOf5clRIRRTc/jdXG1A+5+Kd0mxXazn0YSygg7CsUyIiVuoCKRMgiMc6FhdPQxy/DHSG3qFnCwWi4qJa4ZYDUidBn+Yx3pTU4jmC414y/AxRbGW0wanGRw6iqnaOlAVzfn7Dr+TIRCDDUlUOrxa2yg1/mKQutSCF2e2wrzOU5a5qJRZUtbjajSplyWeSeT483VIQkuKM0WthN9x3fDLRD7OaeBXdee/xJQBTODdxxxGuZitIUE1xjmGAc924Ab9oBXEd++oFIcc063tpcL+JfD0RvGVw+pOL5Z/pmejSww==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(136003)(396003)(366004)(346002)(376002)(38100700002)(186003)(38070700005)(122000001)(53546011)(64756008)(66446008)(66556008)(6506007)(7696005)(76116006)(9686003)(478600001)(66946007)(66476007)(8676002)(4326008)(26005)(316002)(86362001)(41300700001)(107886003)(55016003)(6916009)(54906003)(52536014)(8936002)(71200400001)(2906002)(5660300002)(83380400001)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TU1sQ1R6SEVtd042Q3I0alFtRVhjbDJoSy81NHRQMWVlaDRCcHk0OUxLQ3pU?=
 =?utf-8?B?dVAzcmhJSDg3UnQ4VHJNRXQzdksxWURya1RTbkQrdENPUithTUlxSEJVQzZp?=
 =?utf-8?B?WFFjM0RTWHE3T295eFU5ZXNFQlFPbmIzYUI0OG03bzVHV2RUREZpOE55ZEw5?=
 =?utf-8?B?NHJXdHpibWVtNjQrT1JITzYyWElua1c1R3ZQVmF6VU1XcXE4cmJ6QjlIbkVK?=
 =?utf-8?B?cmhkTVRHd0gwdXRDa01oL3I3M0lQMGlROTdVZ2d2dHQyR0VXVWRiMENqTDgx?=
 =?utf-8?B?K09tU0dXbDV1RTJKRjMwWlNGd2xzUWdHMWxXVU9uVVRCNWZkb0QyNUp1TzJK?=
 =?utf-8?B?T3gxWTZVUzFiUkkxUmlsVGNWbGwwVVZWNDRQTFFEZTNZOVIzVGUzakNmTmNJ?=
 =?utf-8?B?VkhZOVh6cUE5bjJwclR1bHNoYWVDSy95L2FwQ2MyUE52SlJBTm1hUitpY09k?=
 =?utf-8?B?ODNJU3JFZjhFK3ozQ3JXYkhVUTRzU3M1Q0h0Y0M5Ylc0ZlE4WVhzUnVyMjdQ?=
 =?utf-8?B?T0MvUFNuWnJtYnhrL3ByZGhhSURtUWR3a1BXQUtYMXI4b1pYMkMyQXd4NXZp?=
 =?utf-8?B?b1NuQU05cFljZWlhUm1tWm91QWJwcnZXbW9CTVYxOUVMZ0U4M1pMR1lqcEY4?=
 =?utf-8?B?U0VrR0h5Vkh1Z2ZsUFNETkZ4N1haNHdqOTJGV3NYMFhoZHIxRkt2MTZIU3NK?=
 =?utf-8?B?c2JLeXJLWDR5K1kyQ2hGZEl5aFYwRHhpUXdqUjVZdlBHZ2kva1JSZVNkUlo2?=
 =?utf-8?B?MTN0cHczQXJpaUNGK1kwMFB2S2QrdDQzanpkaUpBVmpRNlhXWHU2eFI1L1l1?=
 =?utf-8?B?K1FsVDhodWE2bVBwdjhDSHROSHBQNFFEYXg4MEx2Zmk4QjVBMzREMlNCRWIz?=
 =?utf-8?B?bzBGMlJ5aW9pZldQNWpoenViTUhDeGNhRW4wNnhLNC9hbDB0Y1c4YWVreUtp?=
 =?utf-8?B?WGdSWm9QdTNvdTQ2cE5wSUNYVEV1L1ZncU9FWVY2VmNtQ3FZenJIeWVkS3FL?=
 =?utf-8?B?ODlpeTkwM2g1NEpoN2FDdm42aVc2YWY1elFUQ0hJWnBZbzFJeDF0akN4TWFr?=
 =?utf-8?B?Wm9iU2xNSzR5c3gwOGhUVm5EdjMyejQyZHRHak9mRExFNmlGRldpUWxyN0N2?=
 =?utf-8?B?ZUphWnB6eE82MXJvNlhubWIvUC9RTmRCWTc0emc5N2J6M1NQVHN5WjJWbjR0?=
 =?utf-8?B?SWgzMVpUUFQ3ZXE4ZisvKzRRSENFa0g4VmFOOW5FVURtQVJBemVIbmNIUVN3?=
 =?utf-8?B?cGJQd3owRWJva2RTZVpXc2owcFRMY0RLTktRdzl3a2tnZzVXT05vVkR3alpi?=
 =?utf-8?B?NGdMMG5Td1RQb0MrdjlzRVo5ZkxvNUtmVGcxL1JQNFpFSlkzU1Y4anhPVDhq?=
 =?utf-8?B?OXNFaHJxNHBJeWFFV0s2bkxscDZmY1MwSXlNdU42RGoxLzd4T3hITTFpTktN?=
 =?utf-8?B?elhueGgyZ25rOTg4cy9Pd1VlQ2dheEtqbU1WK2RXTWgzK1pkSW9QU2Fndzhx?=
 =?utf-8?B?T3ZtK0ZNZjRXWFhDSjVGMW9SZjNiYnNHMkw1K1BxN2RUOUFkOXBxdTdJcStM?=
 =?utf-8?B?aUZGZzRPQlJ1dTFTTW0zQTZFSjV5b0NuaDNlM2FsSzlhTVR6WXBMZkhpNnM4?=
 =?utf-8?B?Um9LL0h3NXJGQ1FYVkZ4RjZkQkNIWFlPSVdxQnZINXQ4cFFQNHZ5eTJsanIw?=
 =?utf-8?B?d0hLeHdwcWZTWnZOZElSNnFORk14UzdwSXZ5bWdMSGwxV1FWL296bHoxTm1m?=
 =?utf-8?B?Z3kra1VSbFRoQTVSV3FxMnFRZUF1U0RQTTdFdERqQ3gydDlycW1nc2tEb1Bw?=
 =?utf-8?B?cVRld1k0OFVtQktYMS83aDA3WkQ0b245MWFpc21wT002dlVvV0s0bWhTY1Zx?=
 =?utf-8?B?Qm1IZ0dvUkxiaTVHVlB4UlpMY1ovdHJyeEFFaXhHZjJ0d0dQQ3F2SldMb0xo?=
 =?utf-8?B?ZXZVcFVHVmNiVi9IalNEL08rOW56a1NHMzlwL25QVTRnQ2N5MlRvVlZsZWxV?=
 =?utf-8?B?emVOWU1WaFhIZ1F5N1Zodm1VWll4dmh5RVhmTGhiZklLN3R2MkVFMjlwNjVE?=
 =?utf-8?B?eHJNZ3Y3eGF6VEtXTWZtbnlDbUZOMEIzaC9UVGZwMTNRSG9aYVEvWFFIUmRr?=
 =?utf-8?B?QWpFM0JENzQ3Um5nckdDcEdZMmlHM0xXSnZONWJWSXBqNytZcUhhK3lwVGZI?=
 =?utf-8?B?d3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e677c5cf-b721-4245-4fa0-08da85aeb44d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2022 08:57:42.1647 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HpCg4RlTkLR8qVcRpgAea1DZQM1iTW0NPrm0idVuE3YjUMxKiuIkIEhU5ExttlJTk7DQJnjjZ2XR7y8XCqhy1TRitDav1I98TisIlvw2yno=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2968
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
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 David Airlie <airlied@linux.ie>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjUgMDQvMTBdIGRybTogcmNhci1kdTogQWRkIHJjYXJfZHVfbGliX2ZiX2NyZWF0ZSgp
DQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gV2VkLCBKdWwgMjcsIDIwMjIgYXQgNjowOCBQTSBC
aWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+IE1vdmUg
dGhlIGNvbW1vbiBjb2RlIGZyb20gcmNhcl9kdV9mYl9jcmVhdGUtPnJjYXJfZHVfbGliX2ZiX2Ny
ZWF0ZSwNCj4gPiBzbyB0aGF0IHJ6ZzJsX2R1X2ZiX2NyZWF0ZSgpIGNhbiByZXVzZSB0aGUgY29t
bW9uIGNvZGUuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpA
YnAucmVuZXNhcy5jb20+DQo+ID4gLS0tDQo+ID4gdjU6DQo+ID4gICogTmV3IHBhdGNoDQo+IA0K
PiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+IA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9y
Y2FyLWR1L3JjYXJfZHVfa21zX2xpYi5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JjYXIt
ZHUvcmNhcl9kdV9rbXNfbGliLmMNCj4gPiBAQCAtMzkyLDMgKzM5Miw3MiBAQCBpbnQgcmNhcl9k
dV9kdW1iX2NyZWF0ZShzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGUsDQo+ID4gc3RydWN0IGRybV9kZXZp
Y2UgKmRldiwNCj4gPg0KPiA+ICAgICAgICAgcmV0dXJuIGRybV9nZW1fY21hX2R1bWJfY3JlYXRl
X2ludGVybmFsKGZpbGUsIGRldiwgYXJncyk7ICB9DQo+ID4gKw0KPiA+ICtzdHJ1Y3QgZHJtX2Zy
YW1lYnVmZmVyICoNCj4gPiArcmNhcl9kdV9saWJfZmJfY3JlYXRlKHN0cnVjdCBkcm1fZGV2aWNl
ICpkZXYsIHN0cnVjdCBkcm1fZmlsZQ0KPiAqZmlsZV9wcml2LA0KPiA+ICsgICAgICAgICAgICAg
ICAgICAgICBjb25zdCBzdHJ1Y3QgZHJtX21vZGVfZmJfY21kMiAqbW9kZV9jbWQpIHsNCj4gPiAr
ICAgICAgIHN0cnVjdCByY2FyX2R1X2RldmljZSAqcmNkdSA9IHRvX3JjYXJfZHVfZGV2aWNlKGRl
dik7DQo+ID4gKyAgICAgICBjb25zdCBzdHJ1Y3QgcmNhcl9kdV9mb3JtYXRfaW5mbyAqZm9ybWF0
Ow0KPiA+ICsgICAgICAgdW5zaWduZWQgaW50IGNocm9tYV9waXRjaDsNCj4gPiArICAgICAgIHVu
c2lnbmVkIGludCBtYXhfcGl0Y2g7DQo+ID4gKyAgICAgICB1bnNpZ25lZCBpbnQgYWxpZ247DQo+
ID4gKyAgICAgICB1bnNpZ25lZCBpbnQgaTsNCj4gPiArDQo+ID4gKyAgICAgICBmb3JtYXQgPSBy
Y2FyX2R1X2Zvcm1hdF9pbmZvKG1vZGVfY21kLT5waXhlbF9mb3JtYXQpOw0KPiA+ICsgICAgICAg
aWYgKGZvcm1hdCA9PSBOVUxMKSB7DQo+ID4gKyAgICAgICAgICAgICAgIGRldl9kYmcoZGV2LT5k
ZXYsICJ1bnN1cHBvcnRlZCBwaXhlbCBmb3JtYXQgJTA4eFxuIiwNCj4gDQo+IEkga25vdyB5b3Un
cmUganVzdCBtb3ZpbmcgY29kZSwgYnV0IG5vd2FkYXlzIHdlIGRvIGhhdmUgIiVwNGNjIiwgd2hp
Y2gNCj4gdGFrZXMgYSBwb2ludGVyIHRvIHRoZSBmb3VyY2MgdmFsdWUuDQoNCk9LLCB3aWxsIGZp
eCB0aGlzIGluIG5leHQgdmVyc2lvbiwgaWYgdGhpcyBjaGFuZ2UgaXMgb2sgdG8gZXZlcnlvbmUu
DQoNCkNoZWVycywNCkJpanUNCg0KPiANCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBtb2Rl
X2NtZC0+cGl4ZWxfZm9ybWF0KTsNCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIEVSUl9QVFIo
LUVJTlZBTCk7DQo+ID4gKyAgICAgICB9DQo+IA0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+
ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJo
b2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4
LQ0KPiBtNjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2hu
aWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuDQo+IEJ1dCB3aGVuIEknbSB0YWxr
aW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZw0K
PiBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMg
VG9ydmFsZHMNCg==
