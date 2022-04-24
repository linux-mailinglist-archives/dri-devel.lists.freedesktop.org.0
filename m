Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BC850D33E
	for <lists+dri-devel@lfdr.de>; Sun, 24 Apr 2022 18:20:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDE4A10E512;
	Sun, 24 Apr 2022 16:20:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2132.outbound.protection.outlook.com [40.107.113.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B61D710E512
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Apr 2022 16:20:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SmAS2MO6nGUqggAe6sLjmMLS9ZObgpUlxvRXxrH7xkZBe9WDXIhBp24ZGaMvDydN0jyPxNKJqL2aad85EfsUuyFwthQGlxLX13YBTQxFfm6bfaFHiVVnkRTUAASBmrUAL7AemhyJmzee0Ta/QIsBHncubDQW9Acm9b+9rytMCsyNhlJOGkGiEoSb886KuMeQ2AFHCgK4x/o5K0Y4+FVc1bct0AAy7F55JJmQTPmuRRmbChe4FEaGmuLwOvzJE8zVj07FmX6E5GnxT6GicHoBbQy+lCVaEVd5+wkS7gaBLmEDCDUXf5QzxjVd8NnquZGRO7zZC9x50BMM9ouW9ePYeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+EXUp7lwGiNPFF36iA5GcFo/TSb6D7xib7HhsNBDaHM=;
 b=EduiBPUijIZz8suje5Syb7XqWurgkS/Kt33hyctJi85CTqeNTPXua8SHnmrisEqyShQR5fYIuYToMuKMo7g2jihc2eTKvE95bisTO3dw/WuL7tvYaeF6o7dMXGsDOse7Zn9DVoORsou1xmooWzz7/bnR9t23OnWBHQ+Z8iP71P3c30xyvAA8VoTFLvVhdYjlBN2f0AyYf3t8g5t0ckaJa4pfiOnmlnAcbMj0TpAz93GzDnPgdvstAIBCPIOFUnM4WDMtIFROQ63bo/P/UVZwBkJb7VO0zjvv16fvtzSQJbrn10pfDEKD6arcSKSYDop0ialD7Njmj7wlWniGvTQPlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+EXUp7lwGiNPFF36iA5GcFo/TSb6D7xib7HhsNBDaHM=;
 b=Qm3X2eJ+joR9WXhyV8zytCa7wCTIp5uXLmfYu17OLpisw13mblHaS4cFId93FlSl/FjnkYzXtuEMPPlUXxVwnRs+c1AR1RvlHqmzNbPwBPVfwqWn6haIEUIaVFzgR55TTjbL1AYhWN63lDSl+Zp4uy7/4lQ8+jbiiRH0IEjRYYE=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB7207.jpnprd01.prod.outlook.com (2603:1096:604:141::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Sun, 24 Apr
 2022 16:20:38 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db%4]) with mapi id 15.20.5186.021; Sun, 24 Apr 2022
 16:20:38 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v3 2/4] drm: rcar-du: Fix typo
Thread-Topic: [PATCH v3 2/4] drm: rcar-du: Fix typo
Thread-Index: AQHYVZ1KwGddPqPEj0WtGe3WF9brO6z7n8IAgAANTUCAA4wDgIAAA6pg
Date: Sun, 24 Apr 2022 16:20:38 +0000
Message-ID: <OS0PR01MB5922F44D706458962829275A86F99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220421163128.101520-1-biju.das.jz@bp.renesas.com>
 <20220421163128.101520-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdV_eNxM4yHgkUFPz58KyiGFtjjBeePtuAg8pZYfsS5t9g@mail.gmail.com>
 <OS0PR01MB59222BB60DE4DFEA83A851C186F79@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <YmVwT0ZKInxbgKQ7@pendragon.ideasonboard.com>
In-Reply-To: <YmVwT0ZKInxbgKQ7@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d3b17e67-42f7-42ae-d930-08da260e5ecf
x-ms-traffictypediagnostic: OSAPR01MB7207:EE_
x-microsoft-antispam-prvs: <OSAPR01MB72073806EDB37B82D25BC02686F99@OSAPR01MB7207.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RYAJQ/FQ0c/0rAh4rVjyKJbXTtzY4NxRalNoke5xKoYC2HaOpit9kV7u4tBFN5GSuoXS2VSSnBO1qUaBcrPsvfqQpx5yDtMKyL/Ds1GKcBAyXqmqohnvbiLzqtdmv6C7coPqa1fZjSNujljIAcppFyoAwmxRs1i7TRNsP0EDCUY7n1MDScDko+mZdYaqmygn1oKte5CC4Sp4yZS2ty0z1iOrAyGkk5pkS5AaTIoMrJOHvbpAms0um63CCyFeXZUH5nWwQOL4Petgt/oYfdTqDkEYoHZUFTMS8TK1H4D6twSGzwwUfXnJhjdrD3ke3gyNwOHdhXjB8zoxPX+GDS4yl3Mz7+TVDOGdmLtpqeJ4f+ocMacNrIDgarQy8T5s4qIh3bpc/H+dUWEszom5YIO4K/xBbd64Euef5/5qJMerSQwxYYVbP9g6GZLRVqQtoBmB62XfoDl2BgWhWNB8Oe1SlFR8EhWv4RoZEHHg9gvZ2L++VVjzHpp/F7L1/cOxd2DM9ghGJ1R43sHjHIAjA4b94lkp/hRMShfCpCqVAlq400EbmvBkyW33Q76E4JHj8ZeSNEqwDZW0C2FDhCiYUTml3NdtKOKj8+aZHs4JQPiaOIVKEAHHa1+7Nb6DvnyKwj9a+aSDmGgfThlXfQLPNkFNLC1Bc8Dz2ONpYEeHrn0XD6O2sv9UC0T6Wz0RtSA4D9yXtNN2SY+lCeFEVn1aR/MUCg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6916009)(54906003)(122000001)(38100700002)(316002)(38070700005)(83380400001)(26005)(76116006)(66946007)(4326008)(55016003)(8676002)(66476007)(66556008)(64756008)(66446008)(71200400001)(2906002)(86362001)(6506007)(107886003)(186003)(7696005)(5660300002)(508600001)(8936002)(52536014)(9686003)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SS82RzNOV21jbWJyUVdBdGRqazdFdlhNWlgycXdoc3VDWXJzQnErU3Y3a09V?=
 =?utf-8?B?VFQweGhWVGs2bUlKcmVKY2p6aG1Uc3hFQmZCcjkrRHJJZVpVbmVGWVRWdmpq?=
 =?utf-8?B?c1NLaGlENDUremFRY0VRcnNPZmo3Y256ZUZldkVtSU5Tc3l2c0E3QnMyc0xo?=
 =?utf-8?B?OU1tK3EzR21SaWdzTStKdTBpU0U3OHExRmVTM2plcWc1NVE3QllJUFkwSkNh?=
 =?utf-8?B?WnBSYzhJWHdwNzc2MXdldnRtbUNzNnlsRTloU0dQa3h0OHFKTXk3SmxYOVVL?=
 =?utf-8?B?YjJwYmN6QTJPWVlPRWtOWTZvZHdxUWVuNDJDTTgwRmpQdHJnZW5mWVVFUlph?=
 =?utf-8?B?YlVnN1JDMjdqYmVIWVk2VUMrdnJPYjZveU9FR3VJQ2tpR1hFUEU5c2JvUzR4?=
 =?utf-8?B?K1FVbGVXMEdpdjQ2Z1pTQy90ZHBXS252dGVjeFdQY1F5Z3Z3K0Vsb0tmemZt?=
 =?utf-8?B?UUF5dG1ESzl2ajRhOHI3aUZuTmpRNXp6cGhCWHEyYTl4Q3ZUOFNHeXg5SDhz?=
 =?utf-8?B?V2wrc1FHd0dNblNwbUhoODg4UHdqcGRoK0JXNm1lN2NqQzRvRVhNVWRGaWlN?=
 =?utf-8?B?Nm1KMzc5R21VejU5eHlxOGpuSVRscUFRemsxVk9CV3BvdU9rZmRuaUdReE1C?=
 =?utf-8?B?NngrM2R5cjNJZEdSL0lTTmlXZ1ZvcXFjRlRyZ0MxUVQycHNNRGQzbjVIZ2lx?=
 =?utf-8?B?YzBTcllhUllZUVUrSnBEbUo5akxDM2pNNVkxWWFydWZrL1BxK1l3WVR5Ymhy?=
 =?utf-8?B?Mjl3NmhSZVJVNzdLcEVuR0NxeU44T1lXbmRBcTZzZlNQNTMvSzNhWnpmdDZt?=
 =?utf-8?B?V1NiR0VmN3lNNE5DVHArMDlzQWdxUVZOa2syd1BCaTI1Uno4a25TSFRyUlJx?=
 =?utf-8?B?TytoSVhjRTNpeVFEQUpWVnU4QXFOMlJRbjdtNGlTV2hyUVB1WndtanEvUlpL?=
 =?utf-8?B?SjErNVpPSW5XYXZkMWpDaWYyREhlSUlod1FSMUpqN2JicHh0V3kwV0QzY1px?=
 =?utf-8?B?MGt4M2hCaTJwRGtkZXh2M1QxbjlwKzdBSmZuc1RtOTArOEZhaW9oUUlTNjZa?=
 =?utf-8?B?Z3ZBUmo5UHZEQmxoYXBJQUdKZXI1WGRMbmRpeEZMWGlvZVA4N0RRdDc3Y1FO?=
 =?utf-8?B?bjZtMEIxekJzNUtsdmtZOC9oOFBpVzVVOC8yRElNenptbUo2cmlCOW51eEUw?=
 =?utf-8?B?WDVLVjRWNmxSUDVPSEdmakt2ODhGRm1lRHg5QmJGNEdwZjEzM2poWHZ2czR5?=
 =?utf-8?B?TktNSFNSRFQyL2dJc1p3UTAyQWV4RUtZaEZaZGRRcEorc2t6R05ZbHJORjhl?=
 =?utf-8?B?OTVxcnE2N3J5QjNURHFuaGVBeEcvNWFwcmpNd2NWeHlzaFcvOVpYTnpNcWlZ?=
 =?utf-8?B?bHZjKzVKeUNmZnhRYUlrNkVyRGUrN20yMU1mYmQyNU1mYnRDb0Z3R0FaQzRP?=
 =?utf-8?B?MUdCeHF4cTRieDZpaEp4ZHFyemIvOURlU3Z4R3djRkhCVU1GcEJyRDhPcnI0?=
 =?utf-8?B?QkZTcUhYWEpsc0lXZnAzY0wwMTFONForRTZaR0RoVGo3OEhSU0hCK0FJVG8w?=
 =?utf-8?B?WUdXYXFDc2ZHRE5NQjc5UXNSalY5WHI4TFZJbVh2NURhUEJaNzR0WldRcGVa?=
 =?utf-8?B?cFgyTkFqUTk0SmNtaS9NUEVNcTZsS0pTMDAzSFBpRm1rQ3RTeWdkd0hKc21u?=
 =?utf-8?B?Wk9nRW45WjI3QXNjdjN2ejloc05sZmJQS0RhazJmTGxHTWtUTkFOTWx0c3lF?=
 =?utf-8?B?cHRwNy9HVGloaU04UUYxdEdIMmJiZXI2RlFnYWkrb0tkVDgyMTh3NDBTa0Nv?=
 =?utf-8?B?MTd5SkNpcnFwN0lkTzVvS3p5U3VWUVBKNTkzWkZ3Wm1EbTJtRWQ1TlNQYWk0?=
 =?utf-8?B?eSs5RVBXK3UwQ3IzNkhzdGNqZStOUmF2Qkc5ZktWR2kvS1ViUkg1RXdsVk1y?=
 =?utf-8?B?dU84QkdvODdWZzJvK0FQMmNhT1NyQUY1UW1RLzFVTStiTjZXcWR5aHJYZCsy?=
 =?utf-8?B?djREajB4NU9IVnZvWnowSjVvdEZOd29FOURCdEVlcEt3UVh0SUNuYkp3TFRG?=
 =?utf-8?B?QUd1QmV5MEtmL1VRcnFIdTdnS2pZSU1WenFmQU9BbkVJOEE1aHd4YkJOb2tl?=
 =?utf-8?B?UGlDckdJUy9USksrVHZjWEcvR0tlSXJtQTFyNzRsWkxFTVRlaHZPc3ZYRG9q?=
 =?utf-8?B?N3JuSk8xNW9jWG9tdHJDWTNsN3V0NVBNM0NsWVNGdmdPUUxUdlQ4cWsxTjd1?=
 =?utf-8?B?KzhxK2FpMnkwSWJYenVXUW8wMCtzVnBxdnhhOUtBT1lXN3loS1RlWm5SUXVD?=
 =?utf-8?B?UGpDRW5hL1N0T3lrRG96M1hPQ1RscEYrOVF4M28wUXd2a05NTHRweHlKZE1T?=
 =?utf-8?Q?P4g34LqpDEVd3X8M=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3b17e67-42f7-42ae-d930-08da260e5ecf
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2022 16:20:38.7955 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4L8/vCfXs/N5AI1g/E1DBjpu9wzIQRxsgwLAQ+bHbOlIwQ4ApKi6Y3fo+TjBh4cwL5WTfUlOtKT8q6bO40QUta7RbmMcGIUICadeWklYMs0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB7207
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
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwNCg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDIvNF0gZHJtOiByY2FyLWR1
OiBGaXggdHlwbw0KPiANCj4gSGVsbG8sDQo+IA0KPiBPbiBGcmksIEFwciAyMiwgMjAyMiBhdCAw
OTozODowMEFNICswMDAwLCBCaWp1IERhcyB3cm90ZToNCj4gPiA+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggdjMgMi80XSBkcm06IHJjYXItZHU6IEZpeCB0eXBvIE9uIFRodSwgQXByIDIxLA0KPiA+ID4g
MjAyMiBhdCA2OjMxIFBNIEJpanUgRGFzIHdyb3RlOg0KPiA+ID4gPiBGaXggdHlwbyByY2FyX2R1
X3ZzcC5oLT5yY2FyX2R1X3ZzcC5jDQo+ID4gPiA+DQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEJp
anUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiA+DQo+ID4gPiBUaGFua3Mg
Zm9yIHlvdXIgcGF0Y2ghDQo+ID4gPg0KPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmNh
ci1kdS9yY2FyX2R1X3ZzcC5jDQo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1
L3JjYXJfZHVfdnNwLmMNCj4gPiA+ID4gQEAgLTEsNiArMSw2IEBADQo+ID4gPiA+ICAvLyBTUERY
LUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCsNCj4gPiA+ID4gIC8qDQo+ID4gPiA+IC0gKiBy
Y2FyX2R1X3ZzcC5oICAtLSAgUi1DYXIgRGlzcGxheSBVbml0IFZTUC1CYXNlZCBDb21wb3NpdG9y
DQo+ID4gPiA+ICsgKiByY2FyX2R1X3ZzcC5jICAtLSAgUi1DYXIgRGlzcGxheSBVbml0IFZTUC1C
YXNlZCBDb21wb3NpdG9yDQo+ID4gPg0KPiA+ID4gUGVyaGFwcyBkcm9wIHRoZSBmaWxlIG5hbWUg
Y29tcGxldGVseSBpbnN0ZWFkPw0KPiA+DQo+ID4gQ3VycmVudGx5IGFsbCB0aGUgUi1DYXIgRFUg
ZmlsZXMgaGF2ZSBmaWxlIG5hbWUuIE1heSBiZSBBIHNpbmdsZSBwYXRjaA0KPiA+IHRvIHJlbW92
ZSBhbGwgb2ZmIHRoZW0gaWYgd2UgYXJlIHBsYW5uaW5nIHRvIGRvLg0KPiA+DQo+ID4gTGF1cmVu
dCwgcGxlYXNlIHNoYXJlIHlvdXIgdGhvdWdodHMgb24gdGhpcy4NCj4gDQo+IEdlZXJ0IGhhcyBh
IHBvaW50LCB0aGUgZmlsZSBuYW1lcyBjYXVzZSBpc3N1ZXMgYW5kIGRvbid0IGFkZCBtdWNoIHZh
bHVlLg0KPiBXb3VsZCB5b3UgbGlrZSB0byBzZW5kIGEgcGF0Y2ggdG8gZHJvcCB0aGVtIGFsbCwg
dG8gcmVwbGFjZSB0aGlzIG9uZSA/IEkNCj4gY2FuIGFsc28gaGFuZGxlIGl0IG15c2VsZiBpZiB5
b3UgcHJlZmVyLg0KDQpPSywgSSBkb24ndCBoYXZlIGFueSBwcmVmZXJlbmNlLiBJIEp1c3Qgbm90
aWNlZCB0aGF0IGlzc3VlLiBGZWVsIGZyZWUgdG8gcG9zdCB0aGUgcGF0Y2guDQoNCkNoZWVycywN
CkJpanUNCg==
