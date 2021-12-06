Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDDB469776
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 14:48:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EA537AB6A;
	Mon,  6 Dec 2021 13:47:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2096.outbound.protection.outlook.com [40.107.114.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9118B7AB67
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Dec 2021 13:47:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LRmCbMGsRB6lsdzPVAm+FTFljAxt1PPNe58Mwjjg7ClWbzq4w9BDHKSddW/0VHnrFN3W/7jZGHKfYgClaQi1Dsa/rDwXLINT2rxAZ2dBcpP9HGmY/YuHairuYmyno13js7JRY5yZd90/wJMntsHK/TjIS6o3Sa/4hNDunQsPHvWM2lnEN4IPTrCZqGg3GOqc39Cx7DFmrc1mUGeuuexkTyEGl2NpLfS8jEiDP0jIeM3RIO4U0ljODRi+zDG3RCUiDFBPkSJhRbjq9b52/dk+L1HEW/oH/Q/olMnYSIefcG/lKysNIhKz4+/+pNzjP0SfdcuwC0g/hFdLQ+oT+thKQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oxxTmFIvyqyq2vqmVcbVD1fOyB31PsliRnMOcMKuSEk=;
 b=ee94xvXqGkwTUMY+jxrPmmiCtA/oGZGDLkhiuT3Z62hpHhXjc30EwxwS3rovW+Szi6y68KptyXsyI79P2ttCA9xo8nx1KATZp52+mgCGyl6BAJtj8lpWoIGbENxf0Kk/qpJPOhBp0FsyO56+X2DGWn5xrM7FcGlCNxH3usAHn0F71g76zqWpmCbaP1zLj8nx8teQUoHI05k0guYB1CCmMue7eqn2SmQnFdkOvZP5tO98bhfsjm1XZ6Q6zWZnXlRhJXOaViaHGFBoxvCLHdabKtzZ5TgS63tj0op2mxdPP7Fy5hI2PkyHLAclsKN4lOxyRLEODSQc8+q4OlZ6j9cKjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oxxTmFIvyqyq2vqmVcbVD1fOyB31PsliRnMOcMKuSEk=;
 b=LbSiVwvFe59YdZ0ZHnfY7Vf4GxzKtv7W/5AmzxzISc4hY2Cm9iJrRoFlYkN0A8iQcJjFa0tAZEiDyA+Wf0yf4kx9f/4ZieUVYJ0RsuyQ133dK+NCNZsZEbVe7hu4hiI118Efs8gkESPa8nT10kzHiVZzB1t13iSOzzpwKEeI6C0=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB7061.jpnprd01.prod.outlook.com (2603:1096:604:124::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Mon, 6 Dec
 2021 13:47:50 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153%9]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 13:47:49 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: RE: [PATCH 4/6] dt-bindings: gpu: mali-bifrost: Document RZ/G2L
 support
Thread-Topic: [PATCH 4/6] dt-bindings: gpu: mali-bifrost: Document RZ/G2L
 support
Thread-Index: AQHX6Dw1V6ZMz9I+rkmmmHhVuqDv7awleMeAgAADGtA=
Date: Mon, 6 Dec 2021 13:47:49 +0000
Message-ID: <OS0PR01MB5922CE3208E2386321A0347B866D9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20211203115154.31864-1-biju.das.jz@bp.renesas.com>
 <20211203115154.31864-5-biju.das.jz@bp.renesas.com>
 <CAMuHMdU+eYymZBQv8xrLKFCzORxmGe==Vc4z5qjxq+2vNfgaAw@mail.gmail.com>
In-Reply-To: <CAMuHMdU+eYymZBQv8xrLKFCzORxmGe==Vc4z5qjxq+2vNfgaAw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 39ea3b67-8b36-4d6e-9dd2-08d9b8befdfc
x-ms-traffictypediagnostic: OS3PR01MB7061:EE_
x-microsoft-antispam-prvs: <OS3PR01MB706159449233D2DBDD7038B5866D9@OS3PR01MB7061.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xxHIFJRiDTAPMSvi1iukeelEYMRXrQTAlVgct3UhbwKkRJP+64HVLrGIut954Q35xYr8qUhfvxlrCHXgOaSH3j7HY1/QHSFFjUZi7qg/0H68BfpnmwkV90aEpIu4gGCVMXUKyyLSVW2PfubDRIFyKeaadQ6YLOpaISG0OECoNVFXCWEFrQwcZU4O1/JtdRGAJO8joeyZmnj96UykEJkfzuF5qKbxbxyS+/C65CUtfot4nKH2MdQyJxG+6F5Px9qosES6/GAILTG5+mCuOwRbCqAYM+5nyA+XUJHKoZSYu1GPBAjeNMh6DtUe0IbnSApm+kFxlQOYmrFDW0dIrBukzs9fwj3BdyAxl5WXMAvNnxbVPAbm+cJvAkJL/WumbtkK229tGJ/LvY0HbK6I2/wAdCtSOvprA6cVOTPNIhlzLsiFEz8tN1eDQj40ddbikIXc6uks8aSraJGdSelNXkf7a5F0BTLjGKO6AGZVWrnGRu2xsNn6mDUOunTm/wigAOEI2RRoOgojrHd6yMfdpVsqN/x9TFnt7m4NOJsrJBQRp2B6ginsFi5Gd7/IxEMkn11jE2o0HliiK+2qfxwYMmV6CkAZPcj3ajHsiTKC1DYsruDNTQ3LjNSkagZzYMOllD/Nr+4WLXLuIdMsBy+LdzPf7q+s6ZwTv+XkT0F542JLoBVi0puBDQ3OsAR08qlNixhnzc/IlPgoWPqVLYP4y2QsrQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(55016003)(9686003)(8936002)(38100700002)(83380400001)(122000001)(71200400001)(6506007)(5660300002)(66946007)(76116006)(26005)(186003)(7696005)(33656002)(53546011)(52536014)(4326008)(66476007)(86362001)(54906003)(8676002)(38070700005)(66556008)(64756008)(66446008)(2906002)(316002)(6916009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Umx0YUF0ODRXWWpkU3luTktMTGFIVmR4NVRGcUwvMno0bnpaYXU0YzVCYmpj?=
 =?utf-8?B?a3pITWRUNGhUWitwMlFzVVAyL3lpUlVmMXQzMC9JcGV3MFFUNFBzc09BTHBT?=
 =?utf-8?B?QS8vay8wbExBVVBvYlNyTmg2cDlMeFUwckNGK0JiR3R0NlNNc2FRWWxIKzBi?=
 =?utf-8?B?ME1IU0duR2txMWNCUDlKTWVudjd3UEx0UnIrQnoraXdvQTJBa1BGNE5lSjhV?=
 =?utf-8?B?RVdDcGc2L3dQYnhHRXFtY2pwQmVmSE4rcVJ2cEkwTldJUHRsc0xxQ3MvWUow?=
 =?utf-8?B?ZEpaMVBETFBkQk9RcWZwangrV3FhQmJWZWpkYmszTmZoQkFlSjZnUjlDa2hU?=
 =?utf-8?B?WFNmZTg3ZWpKSHV6Wm5GM21Mc0NUSWxtTHcyenhpK2tnNjNFaVArdGkzTXFH?=
 =?utf-8?B?dmc5bzREZHZjRFRvc2NhREs2T25XbzlvYTJsaWVKODhWK3djdVpxSmZSTXpw?=
 =?utf-8?B?WW1mUm9IQXpNVXdtR045U01WR0h0aEZUay9Fd2FnbDMzR0tjTW40L1JOM2lD?=
 =?utf-8?B?Q0xJdnBOTmRBOVBmZHZJRGF1allDaU9Hb3lRWnVzTnFoMldCNjAxM0dwdEFJ?=
 =?utf-8?B?NGs4UGlZL3NpSzNoU2ZqdFZwR1h0cS9sajZ0WXpFYjR0Q1pSZU9nSXhRUkpG?=
 =?utf-8?B?UWp5WWhmSnJDWjAxbmJwcVdzUVVUS3BGYkRNRzZ1S2xxOGk4QWZIWjZPbHk4?=
 =?utf-8?B?dWwwcGZhSUcvcDJlQXlkdXA3eFh1dzBOUThkWGt2bmRqYyt3QmZoSVFOQlBB?=
 =?utf-8?B?Z0pyTXBCWU9oRzVzSzRhdlFGYUkyU29xN1FiOXBWMTU4UnJFTUR5SDVhbk0w?=
 =?utf-8?B?L3ppNmxRQ1BMSDV3cVdhQ0twbkRiZFMxOXJKRlljem5sM2JNMWpTZk1iWGFD?=
 =?utf-8?B?ZXJ5NzlPNFFNbUVNOXBZdXdURnAydWhPK1JzNzNhZFJPaUFRcE5BUjFTT1p3?=
 =?utf-8?B?ZWJWUzNwSnF0OEtkRVlZV0k2WW5zRnZ0VWJvOUUrRjExMFlybWZ5Wk96SUZO?=
 =?utf-8?B?MFRZV1laN3FuNTY0NlZtUEtSU1h5MUYyQS9wY0xFa0UvbW9zb2tkcWZZeGE2?=
 =?utf-8?B?U0Y2ZWZqVTdXWndFY2dEQlR3RlE5Z3BVN2ZuWGUzd2xwQVJyaEJaeElOdkJB?=
 =?utf-8?B?SjQvcG9JdEdaL2h0bmMyaVQ5RkVLTGNWdEt2UkpMNjkrcTRneTBXeS9acHls?=
 =?utf-8?B?dEV3U1IvdmtYKzlvbEhtUUpZTXlST1FMOWY0UDVPaTBySTFXVHpmbVMzNXpS?=
 =?utf-8?B?U2dtUE82TEJ1RElNdjNWUGJMU0FiQ21nVitVaWFCVXA5bUkyOW51RFJMVWl6?=
 =?utf-8?B?b0JJanREVWNsMGFQU3dZQ1BsU21qNU5NcmdzcVQwWnhLeENuWGxxRzRZNGNW?=
 =?utf-8?B?emhFRW00VEl3WXhXTm81cDc1dERpblBEWFhESEswYlgyNFJ0RXQyME81blE2?=
 =?utf-8?B?cnJZM1JQdVROdXBEa3NuYVpodXE1NmtpTXZHUHJxZ3N4MzVOcGtXMmhTbTJh?=
 =?utf-8?B?OVN6V0g0cm5DdVZNOTVJZ3E1aklWZGxOT1JvRzVYNVZSVHlRcDhRdlJaWno1?=
 =?utf-8?B?Ync4UTUvUllndnQya0JHbFFCUW03ZGlnaXhkbEFqeWJUWWVqcktpMStZZ3Rz?=
 =?utf-8?B?ZGUzSjYrTEJmekRJNGhRMUtBQjZJV2o2ODNNUFhGWmhLbEFGcy8vU2FtNjc1?=
 =?utf-8?B?bnNWUGtiMjFPQ0o1dnk5TVRLeVhqZXo5eHcweVVGYzc2Sy8zVGgzUmpVYWNY?=
 =?utf-8?B?RTFvZ3VHcWRLYWpndTRvQnFYNzl3b1VJZG1jSkJEVGxETmw4SElzZ3BWY3BV?=
 =?utf-8?B?SUdlajE2blpkNG91WlRrRWZDckZwM2dieHZLY3c1dlRpRXAxZnNiRnQwRGJn?=
 =?utf-8?B?cU9adzRmUjB6dmlpWU1NQkNlSnhhSzJjaFJoMnFHV3MwdkFoNVptOE1zTm8x?=
 =?utf-8?B?ZjBOeDJObWF2bUdOR1VCcDVCNVRnMXYrRFhpRHZCNjhOMEJzR3pMSExVUE15?=
 =?utf-8?B?ZmFONlNrYjRBbElwcXJPWTBiL2pzb0Z4K2ZZQW5xVjJqblBZNVhHWW0ybTNk?=
 =?utf-8?B?UVNlVVo2dzVnTG16dHN3QlE4UjNFNWRVdWprcXV2eHNTYmE1ckh4VjVsL1dh?=
 =?utf-8?B?NkQ4ZmZPYzJNR01sZ2tycFI2WmJrUDZ3K3p6Q3UzTDZoVEVZVjEvUnZxaGdV?=
 =?utf-8?B?MThMUXh1emVyZjlDalBCNGdmekRFTmlPSVRVeFc5UVN2SmlLNnVOSkFVUVFM?=
 =?utf-8?B?VFNtNytIQzI2T2gydkw0RWdPbkN3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39ea3b67-8b36-4d6e-9dd2-08d9b8befdfc
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2021 13:47:49.1993 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L9J2zxqeqIzS95hViw80XqlvP+yHD4M2nowxFLTHyWbBx110TMDx0jfqmYyd9cSc5Macb/4wnOuQCJheaZOlmD5qX741Bqux053290O3QTo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7061
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 Chris Paterson <Chris.Paterson2@renesas.com>, David Airlie <airlied@linux.ie>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggNC82XSBkdC1iaW5kaW5nczogZ3B1OiBtYWxpLWJpZnJvc3Q6IERvY3VtZW50IFJaL0cy
TA0KPiBzdXBwb3J0DQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gRnJpLCBEZWMgMywgMjAyMSBh
dCAxMjo1MiBQTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IHdyb3Rl
Og0KPiA+IFRoZSBSZW5lc2FzIFJaL0cye0wsIExDfSBTb0MgKGEuay5hIFI5QTA3RzA0NCkgaGFz
IGEgQmlmcm9zdCBNYWxpLUczMQ0KPiA+IEdQVSwgYWRkIGEgY29tcGF0aWJsZSBzdHJpbmcgZm9y
IGl0Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJl
bmVzYXMuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFo
YWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2gh
DQo+IA0KPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvYXJt
LG1hbGktYmlmcm9zdC55YW1sDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2dwdS9hcm0sbWFsaS1iaWZyb3N0LnlhbWwNCj4gDQo+ID4gQEAgLTUyLDcgKzY0LDgg
QEAgcHJvcGVydGllczoNCj4gPiAgICAgIG1heEl0ZW1zOiAzDQo+ID4NCj4gPiAgICByZXNldHM6
DQo+ID4gLSAgICBtYXhJdGVtczogMg0KPiA+ICsgICAgbWluSXRlbXM6IDENCj4gDQo+IDIsIGFz
IGJlZm9yZT8NCg0KT0suIFdpbGwgZG8uIA0KDQo+IA0KPiA+ICsgICAgbWF4SXRlbXM6IDMNCj4g
DQo+IFBlcmhhcHMgeW91IHNob3VsZCBhZGQgcmVzZXQtbmFtZXM/DQpBZ3JlZWQuIFdpbGwgcmVt
b3ZlIG1heCBpdGVtcyBhZGQgcmVzZXQtbmFtZXMgaW5zdGVhZCAoInJzdCIsICJheGlfcnN0Iiwg
ImFjZV9yc3QiKQ0KDQo+IA0KPiA+DQo+ID4gICAgIiNjb29saW5nLWNlbGxzIjoNCj4gPiAgICAg
IGNvbnN0OiAyDQo+ID4gQEAgLTExMyw2ICsxMjYsMjEgQEAgYWxsT2Y6DQo+ID4gICAgICAgICAg
LSBzcmFtLXN1cHBseQ0KPiA+ICAgICAgICAgIC0gcG93ZXItZG9tYWlucw0KPiA+ICAgICAgICAg
IC0gcG93ZXItZG9tYWluLW5hbWVzDQo+ID4gKyAgLSBpZjoNCj4gPiArICAgICAgcHJvcGVydGll
czoNCj4gPiArICAgICAgICBjb21wYXRpYmxlOg0KPiA+ICsgICAgICAgICAgY29udGFpbnM6DQo+
ID4gKyAgICAgICAgICAgIGNvbnN0OiByZW5lc2FzLHI5YTA3ZzA0NC1tYWxpDQo+ID4gKyAgICB0
aGVuOg0KPiA+ICsgICAgICBwcm9wZXJ0aWVzOg0KPiA+ICsgICAgICAgIGludGVycnVwdC1uYW1l
czoNCj4gPiArICAgICAgICAgIG1pbkl0ZW1zOiA0DQo+ID4gKyAgICAgICAgY2xvY2stbmFtZXM6
DQo+ID4gKyAgICAgICAgICBtaW5JdGVtczogMw0KPiA+ICsgICAgICByZXF1aXJlZDoNCj4gPiAr
ICAgICAgICAtIGNsb2NrLW5hbWVzDQo+ID4gKyAgICAgICAgLSBwb3dlci1kb21haW5zDQo+ID4g
KyAgICAgICAgLSByZXNldHMNCj4gDQo+IHJlc2V0LW5hbWVzDQoNCk9rLg0KDQpSZWdhcmRzLA0K
QmlqdQ0KPiANCj4gPiAgICAgIGVsc2U6DQo+ID4gICAgICAgIHByb3BlcnRpZXM6DQo+ID4gICAg
ICAgICAgcG93ZXItZG9tYWluczoNCj4gDQo+IFRoZSByZXN0IGxvb2tzIGdvb2QgdG8gbWUsIGJ1
dCBJJ20gbm8gTWFsaSBleHBlcnQuDQo+IA0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2
ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LQ0K
PiBtNjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNh
bCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuDQo+IEJ1dCB3aGVuIEknbSB0YWxraW5n
IHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZw0KPiBs
aWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9y
dmFsZHMNCg==
