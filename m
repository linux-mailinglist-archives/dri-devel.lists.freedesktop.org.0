Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3391850B418
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 11:31:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADE2110EB51;
	Fri, 22 Apr 2022 09:31:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2129.outbound.protection.outlook.com [40.107.114.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBD7410EB51
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 09:31:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kWPXEEXlGJTr+JiO5dki3TlVlUOvPFE9S3WpPJpLxbpMyhZKAv9PNUzqV5zXaYJ+NPp0S8r7TUhpEthGpfeMNnutWO2qjIzDru+wticz1jMgDiH8uDjTGENAm7LxSElc2BnaNRP9AH35LJkE/6agEzcE7vrAbNlG/8U+NQofXa6NqaK+92mAPgXw0HqoG+t+szIFb3kB3SJtNzuKyfuXSxlserx1UdLQlFuFyo7B26ibqDVa9tHTU0GCruClQU+czxc3cU5e1p6mlJzRCAOPwsWsh5lCmMk9hZ3wZalv04mESnUC/FTKwj/OlAp6K97SZz7a5W7Sgy/KYcfhRWfRgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=etPI6xSf4U/9iapRB9Y9bC48m5lnYEwWmZFk+HT+JGE=;
 b=G4Oheu5H70KDlVP5ICZ+UnDG/A8aFvUVhEaYhfOxAd0w7TOsuuJUkp8uzJYrnWEvtHT/cD2rwS6tc/yr81MB6xNiGsnCcvzbzuqjSc2wk064BTm9Uh13j6pmrKHWXzbzbegHaHlvPQjR7gUlHnXuILkIZiRy41Cy3XoKxqB+lNq+fJPAxWMpRDFCOLQGhq+QZNOTSNnQH7c1rH4x/lMNhhBmLQUUM0lUneHTOxmDYpkWzSbeqWKqyWnCRGeHIoTVIeBJ08wyVZA1Dlqn2B+1SBi+8QLS0CPV32QJtj6k5jc2T2+CVI+FIOJdQ1MYXJGgIhDFImSGi0IkbiJt92NA/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=etPI6xSf4U/9iapRB9Y9bC48m5lnYEwWmZFk+HT+JGE=;
 b=d2ZVoBXBl8dl6ZnWmhmlUpfWXBZf+vHrR39gEMw77+i66lSYWKh3bNCBO2hpp3paTucVVMMuKG1hJOsQzFWt7345wxBWW65DQuBfJlNspsjqhUfNvy58giSUf97+p4hsSh4j+bENaEW+9wh1gbSrXiQlmmbzFmiOer42Eq70k/U=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB8341.jpnprd01.prod.outlook.com (2603:1096:400:15c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Fri, 22 Apr
 2022 09:31:37 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db%4]) with mapi id 15.20.5186.014; Fri, 22 Apr 2022
 09:31:37 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: RE: [PATCH v3 1/4] dt-bindings: display: Document Renesas RZ/G2L DU
 bindings
Thread-Topic: [PATCH v3 1/4] dt-bindings: display: Document Renesas RZ/G2L DU
 bindings
Thread-Index: AQHYVZ1I7yZjrgOqkEeJ5CQoFwWKZ6z7kO+AgAABDrCAAApIgIAACUEA
Date: Fri, 22 Apr 2022 09:31:37 +0000
Message-ID: <OS0PR01MB5922446E9F1126BF8E06E9F286F79@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220421163128.101520-1-biju.das.jz@bp.renesas.com>
 <20220421163128.101520-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdWMmkY+_O_oyKeumuOqNvw_KJaDxuiwrETc3W-kCV2MCg@mail.gmail.com>
 <OS0PR01MB5922728B940A386674DAB36786F79@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdXqYm1WtgnEGhXdOipXwJ9s3NV8CkNWCYhin3SF7tnv+Q@mail.gmail.com>
In-Reply-To: <CAMuHMdXqYm1WtgnEGhXdOipXwJ9s3NV8CkNWCYhin3SF7tnv+Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d7081b04-912f-442a-d847-08da2442e5fd
x-ms-traffictypediagnostic: TYCPR01MB8341:EE_
x-microsoft-antispam-prvs: <TYCPR01MB83413665ED7754D99FC7506186F79@TYCPR01MB8341.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KAABiQa6HCN19RKhvT5XW4xO1Oo3/fVzDCRi33tEJZaM3Xh6ws90t5P99FwmUf83wc2GlVWgceoR+xTHVYYU3ZeiY5r/UXcTgRiWSgAylxJBe77fX3tGe6MVFDAjmpIPHCNAvpn3yIzSSNqwGtbJ1oEpXoVzCAXk7JX94FbLiRc01RURy6blMdR37Stw5QAt9W+e+pv9h3wHjecF3TZjW0ZQq3nagJ2ilHHI0RtFs0dnboJ0Hu6Rmprq0Ym/PvVEYdVmPPY8bZ647OXBqOw/RqbCeolSleYUbqPJSw344yh9TRVgBLQ5152pgQBrHXUfYf0pceXrvkDTpGccU9qF7TXgEpNUop0CDdRjQNqtxWSS4KSXcc+1jPAz9iedR+sjhBaWb7v090OtfUSQw4d4J23URti8YUBFiplpX7Nw9YWZdKU/yhllZFORkl0KkjnwGfXmSkAkxDUWOJI7ta/OdhcUX7ru87YNhuTujXc8g+8+a1PcZfIYGIwfAttDdXXhSc9TwZFY/5HGdmH2MLep0oE9vbGPyxhwhmnRBQVkTKhMQBXkQ6rQtpDMczKgUY3FhEZQXPnR8Y6KqubrcMExahE7sjsD1JIaB4/A24k6Dtcqr5hMWVlB0Wf/Bb3rd+w01foMr7i1YeBrvWgxsxunGwctfhqScJuHozpcdnCRl/4NE16EgzygILHlKXzeQZYSt4ZlbmfikxGP3XZVaxnWhQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38070700005)(8676002)(5660300002)(38100700002)(316002)(122000001)(9686003)(2906002)(66556008)(53546011)(26005)(4326008)(66946007)(66476007)(76116006)(6506007)(66446008)(64756008)(71200400001)(86362001)(7696005)(508600001)(52536014)(8936002)(55016003)(6916009)(33656002)(83380400001)(54906003)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UEExTDFVSXlpNG5ESWtDYWoxRSsvL3lSdWkzbXJnd0x3NVg4STBsVWp2RkZl?=
 =?utf-8?B?MGdEUE9XKzcyc1cvSTdxdGk1Sll1Z05GdjdoeUdSUTh2ZjBhRHdZTkdEMytS?=
 =?utf-8?B?UGYrQkJOMG9jWHdjby90MStHandwRk92K3lGOXhoSFZFMTVGWW5VQzRtaFM1?=
 =?utf-8?B?eTJWaEFiRERYSzN5VGxjUDh1N2NvRTBBTHRLZXFIS3lPaEkwbWlyODlQT2pz?=
 =?utf-8?B?SHoyQWxwbkJOTWM4dGlwV245K1VwbTR6SE5QcmloSVd0OExtTWlTN3hHWE9o?=
 =?utf-8?B?MmFyOTFJQWJJdG4vNUkzZU93UGxQWHhab1RDcWRQMEl3UTJiU1FhUFpNb0FS?=
 =?utf-8?B?VnNFNE5LUUpmVmRZb25jNzM3MjMzbmI2U1ZHeHpPeWErRW13eDBSOC9WZEFW?=
 =?utf-8?B?dFR2OUJRQ3BHV1BaeSsrV0hjT3RxTFB1ZnhXQmJ0RWlHUlQwZmlRYjdkNFZw?=
 =?utf-8?B?NHJQYlJMUlNGQnlMcGx4dkpkWCtVbnFRRlA4cCtXejRxN1VmcVR2U24xNWVS?=
 =?utf-8?B?N1h1YWtTZWtWUERpV1ZnYUNSSys2NWdEdkxrVjhHaWtyUXB0NTRiVmxKNllj?=
 =?utf-8?B?TGh1dHdNRStLZUwwblR0SWNMTG5SQndiN0twZDNKcFFTclFFb0NCSzdpL0lo?=
 =?utf-8?B?Rm5VTzhPM28yR0pld21wdmpOcHpkMUFIMDNLSW0rNW5iWEJHOXdXUXZQNmtK?=
 =?utf-8?B?YzBlcWJ1MWt3L1M3WHhtTk12MUczMjNITlR2R0N4ajZEck5JYTROV202bE5U?=
 =?utf-8?B?bDBLcURzLy94bmp6STUrYzlXQmk2bW01ak5SMTJQWHp3djVLTFlZTlhmRHor?=
 =?utf-8?B?VTdLNm9ZSGZaN1JlVHUzVDVVR3FqNnZHM3NEdjlyOWhGMW0zWjNBd1A1Zkxs?=
 =?utf-8?B?VkNXanEvTXJxc3hGandndkY4d25YaHZrRVg4ZnJGRXBwK0hnUzN0Q1lqNTJD?=
 =?utf-8?B?ZFcyQUE2by8wNCtQSDBzUVpZK25jVXZhQ3RvL1JrOFVQQXloNXZWd202V2Nk?=
 =?utf-8?B?YjJYY0hSRkdjcm5oTHBVK3R4VjZ2TTM4clhBT1RyRitYTGhaeW1JR05ISFcw?=
 =?utf-8?B?NHpTUXIzUEpla3hlS2UyVjgyTnczZjA3R21iWlB1TEpFL1ZZaDhHVkJkQ0RV?=
 =?utf-8?B?QlNlb29nMzhpZG96VHArLzlqcmJDblZMZFdURHJZdTNJdDJtTC8rUWczb09E?=
 =?utf-8?B?UE9zZmUvWjZObUxmUWttbkNHbzlYcXM1NXorQ0EzYU9EYjNLTFRDTExDRlFw?=
 =?utf-8?B?OS9tKzBnT1BYUUN3VjEvTUxrelpUVjBCTmdXaG1Xc1RRYmZZUFMrenBFSFl2?=
 =?utf-8?B?Q1BOTWtxVVlDTFEzclMwU29yZGJ0M1pVbCsva0UvMWdDeFYwekxOazhhNEpn?=
 =?utf-8?B?S2cyc283UWYwa3RzeHgyVEMxbVJKNGZ2bnFPcEhCWmpVVk1nY1Jnd05Ed2xQ?=
 =?utf-8?B?QVVCaFB4WTZsRFlvVnVZMkUreFROYkRyQ1FCcGlZdS8wTkNmWFZLL1c1Ykkx?=
 =?utf-8?B?R1FxejV1TlJKbm5LSlM4L0FLSkkxRnFDcXkwS2lLLzV3bk1lQ242U2tSMm9i?=
 =?utf-8?B?di9pb3RHMjlnMW14dTVBUFA3QmNnRmt4YVlSU3puTENTUHN6eDk0WE1IdVBz?=
 =?utf-8?B?NytNRGVRYWRvZmUxRjBwZnNXeG1Mc2d5VzlsSS81Zm1YeTdBRzNwbGZJS0VO?=
 =?utf-8?B?bGtmNDJjSXZJQU5uTVpMUmdONStMT0pZaUp6QXluYWlTV0g0NlVDc2gzNjZB?=
 =?utf-8?B?NXVXZWRJTU80c1F1dXpFKzE3TEt2OEVJejJuR3RIbnp1UjhhcXdNRkt1Y0ov?=
 =?utf-8?B?SnJyaXYvTENWSS9iMTI2Tjk2YjhMV0daRTFJeWY4Z2M0WFZvVmcwTDVwOHFZ?=
 =?utf-8?B?Slg5QnRQMHBlRVBzdjU3M2NMSkFJWHJDdGplaFlVWThHaGJoSmo2bW11NUl0?=
 =?utf-8?B?bUE1UFBaTHV1SUNWVkhHOWFhVVhudmRaVExVUktVSGRpc25CRzNRWVBkWEJY?=
 =?utf-8?B?aG5TaFJhakpkcmc2NlA3U1l6ZWxyYmNDZXMyQVNvYzNLTXB4aTdObzAxMHFG?=
 =?utf-8?B?TGJ0TFlCdG56NHAvSVRXWWVvUVhWOVFQcjlWcDB6RklLakRnbkt0MGJRYzk5?=
 =?utf-8?B?NjFRSUQzdm02MGZyZkllaEp0QzNXSll1aHJhUTJ3UXVsMDhqMlMrRWRnZS9W?=
 =?utf-8?B?bUlmWGdxRjRGQ2FFU3cyUHl4VEtreUJnSTVpSkhNNmJFeCsyRWV4SnpmbEhw?=
 =?utf-8?B?TjROZWJBbzB3WGRwalg4WlhLZ1hVYWhDTTJkcmZmWjB1SWVmTFVmcXFWZE5M?=
 =?utf-8?B?OXdWeVcyVE94ZlJFRGFHUnlGL0pVNFZPbUMrY1N5RHMzTEdhZ0toeFNJd2lh?=
 =?utf-8?Q?jsvgSNBegKCMCy28=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7081b04-912f-442a-d847-08da2442e5fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2022 09:31:37.1250 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /5DSxN19/aI7w/96vstmnC88YmknOaD5iHF6+gTSg+BKpNHUiaVtSTsT8q9tnzwg/eJ6GUbm1if4WKveqinexpkL5+cu8WrYTRWYh/lG7LI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8341
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
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 David Airlie <airlied@linux.ie>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjMgMS80XSBkdC1iaW5kaW5nczogZGlzcGxheTogRG9jdW1lbnQgUmVuZXNhcyBSWi9H
MkwNCj4gRFUgYmluZGluZ3MNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBGcmksIEFwciAyMiwg
MjAyMiBhdCAxMDoxMSBBTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+
IHdyb3RlOg0KPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyAxLzRdIGR0LWJpbmRpbmdzOiBk
aXNwbGF5OiBEb2N1bWVudCBSZW5lc2FzDQo+ID4gPiBSWi9HMkwgRFUgYmluZGluZ3MgT24gVGh1
LCBBcHIgMjEsIDIwMjIgYXQgNjozMSBQTSBCaWp1IERhcw0KPiA+ID4gPGJpanUuZGFzLmp6QGJw
LnJlbmVzYXMuY29tPg0KPiA+ID4gd3JvdGU6DQo+ID4gPiA+IFRoZSBSWi9HMkwgTENEIGNvbnRy
b2xsZXIgaXMgY29tcG9zZWQgb2YgRnJhbWUgQ29tcHJlc3Npb24NCj4gPiA+ID4gUHJvY2Vzc29y
IChGQ1BWRCksIFZpZGVvIFNpZ25hbCBQcm9jZXNzb3IgKFZTUEQpLCBhbmQgRGlzcGxheSBVbml0
DQo+IChEVSkuDQo+ID4gPiA+DQo+ID4gPiA+IFRoZSBEVSBtb2R1bGUgc3VwcG9ydHMgdGhlIGZv
bGxvd2luZyBoYXJkd2FyZSBmZWF0dXJlcyDiiJIgRGlzcGxheQ0KPiA+ID4gPiBQYXJhbGxlbCBJ
bnRlcmZhY2UgKERQSSkgYW5kIE1JUEkgTElOSyBWaWRlbyBJbnRlcmZhY2Ug4oiSIERpc3BsYXkN
Cj4gPiA+ID4gdGltaW5nIG1hc3RlciDiiJIgR2VuZXJhdGVzIHZpZGVvIHRpbWluZ3Mg4oiSIFNl
bGVjdGluZyB0aGUgcG9sYXJpdHkNCj4gPiA+ID4gb2Ygb3V0cHV0IERDTEssIEhTWU5DLCBWU1lO
QywgYW5kIERFIOKIkiBTdXBwb3J0cyBQcm9ncmVzc2l2ZSDiiJINCj4gPiA+ID4gSW5wdXQgZGF0
YSBmb3JtYXQgKGZyb20gVlNQRCk6IFJHQjg4OCwgUkdCNjY2IOKIkiBPdXRwdXQgZGF0YQ0KPiA+
ID4gPiBmb3JtYXQ6IHNhbWUgYXMgSW5wdXQgZGF0YSBmb3JtYXQg4oiSIFN1cHBvcnRpbmcgRnVs
bCBIRCAoMTkyMA0KPiA+ID4gPiBwaXhlbHMgeCAxMDgwIGxpbmVzKSBmb3IgTUlQSS1EU0kgT3V0
cHV0IOKIkiBTdXBwb3J0aW5nIFdYR0EgKDEyODANCj4gPiA+ID4gcGl4ZWxzIHggODAwIGxpbmVz
KSBmb3IgUGFyYWxsZWwgT3V0cHV0DQo+ID4gPiA+DQo+ID4gPiA+IFRoaXMgcGF0Y2ggZG9jdW1l
bnQgRFUgbW9kdWxlIGZvdW5kIG9uIFJaL0cyTCBMQ0RDLg0KPiA+ID4gPg0KPiA+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gPg0K
PiA+ID4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiA+ID4NCj4gPiA+ID4gLS0tIC9kZXYvbnVs
bA0KPiA+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9yZW5lc2FzLHJ6ZzJsLWR1LnkNCj4gPiA+ID4gKysrIGFtbA0KPiA+ID4gPiBAQCAtMCwwICsx
LDE1OSBAQA0KPiA+ID4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25s
eSBPUiBCU0QtMi1DbGF1c2UpICVZQU1MDQo+ID4gPiA+ICsxLjINCj4gPiA+ID4gKy0tLQ0KPiA+
ID4gPiArJGlkOg0KPiA+ID4gPiArDQo+ID4gPiA+ICt0aXRsZTogUmVuZXNhcyBSWi9HMkwgRGlz
cGxheSBVbml0IChEVSkNCj4gPiA+ID4gKw0KPiA+ID4gPiArbWFpbnRhaW5lcnM6DQo+ID4gPiA+
ICsgIC0gTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydCtyZW5lc2FzQGlkZWFzb25i
b2FyZC5jb20+DQo+ID4gPiA+ICsgIC0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMu
Y29tPg0KPiA+ID4gPiArDQo+ID4gPiA+ICtkZXNjcmlwdGlvbjogfA0KPiA+ID4gPiArICBUaGVz
ZSBEVCBiaW5kaW5ncyBkZXNjcmliZSB0aGUgRGlzcGxheSBVbml0IGVtYmVkZGVkIGluIHRoZQ0K
PiA+ID4gPiArUmVuZXNhcyBSWi9HMkwNCj4gPiA+ID4gKyAgYW5kIFJaL1YyTCBTb0NzLg0KPiA+
ID4gPiArDQo+ID4gPiA+ICtwcm9wZXJ0aWVzOg0KPiA+ID4gPiArICBjb21wYXRpYmxlOg0KPiA+
ID4gPiArICAgIGVudW06DQo+ID4gPiA+ICsgICAgICAtIHJlbmVzYXMsZHUtcjlhMDdnMDQ0YyAj
IGZvciBSWi9HMkxDIGNvbXBhdGlibGUgRFUNCj4gPiA+ID4gKyAgICAgIC0gcmVuZXNhcyxkdS1y
OWEwN2cwNDRsICMgZm9yIFJaL0cyTCBjb21wYXRpYmxlIERVDQo+ID4gPg0KPiA+ID4gUGxlYXNl
IHVzZSB0aGUgZm9ybWF0ICI8bWFudWY+LDxzb2M+LTxtb2R1bG8+IiBmb3IgbmV3IGJpbmRpbmdz
Lg0KPiA+ID4NCj4gPg0KPiA+IE9LLg0KPiA+DQo+ID4gPiBJIHRob3VnaHQgdGhlcmUgd2FzIG5v
IG5lZWQgdG8gZGlmZmVyZW50aWF0ZSBSWi9HMkxDIGFuZCBSWi9HMkwsIGFzDQo+ID4gPiB0aGUg
b25seSBkaWZmZXJlbmNlIGlzIGEgd2lyaW5nIGRpZmZlcmVuY2UgZHVlIHRvIHRoZSBsaW1pdGVk
IG51bWJlcg0KPiA+ID4gb2YgcGlucyBvbiB0aGUgUlovRzJMQyBwYWNrYWdlLCBhcyBwZXIgeW91
ciBjb25maXJtYXRpb25bMV0/DQo+ID4gPiBIZW5jZSBwbGVhc2UganVzdCB1c2UgInJlbmVzYXMs
cjlhMDdnMDQ0LWR1Ii4NCj4gPg0KPiA+IEkgY3Jvc3MgY2hlY2tlZCBIVyBtYW51YWwsIG9uIHRo
ZSBvdmVydmlldyBzZWN0aW9uKHBhZ2UgNjkpIFN1cHBvcnRlZA0KPiA+IERVIGNoYW5uZWxzIG9u
IHZhcmlvdXMgU29DJ3MgYXJlIGFzIGJlbG93DQo+ID4NCj4gPiBSWi97RzJMLFYyTH0NCj4gPiDi
iJIgMSBjaGFubmVsIE1JUEkgRFNJIGludGVyZmFjZSBvciAxY2hhbm5lbCBwYXJhbGxlbCBvdXRw
dXQgaW50ZXJmYWNlDQo+ID4gc2VsZWN0YWJsZSwNCj4gPg0KPiA+IFJaL0cyTEMNCj4gPiDiiJIg
MSBjaGFubmVsIE1JUEkgRFNJIGludGVyZmFjZQ0KPiA+DQo+ID4gUlovRzJVTCAoIEZyb20gUlov
RzJVTCBoYXJkd2FyZSBtYW51YWwgb3ZlcnZpZXcpIOKIkiAxIGNoYW5uZWwgcGFyYWxsZWwNCj4g
PiBvdXRwdXQgaW50ZXJmYWNlLg0KPiA+DQo+ID4gPg0KPiA+ID4gRG8geW91IHdhbnQgYSBmYW1p
bHktc3BlY2lmaWMgY29tcGF0aWJsZSB2YWx1ZSAoInJ6ZzJsLSIpLCBhcyB0aGlzDQo+ID4gPiBJ
UCBibG9jayBpcyBzaGFyZWQgYnkgKGF0IGxlYXN0KSBSWi9HTChDKSwgUlovVjJMLCBhbmQgUlov
RzJVTD8NCj4gPg0KPiA+IE1heSBiZSB3aWxsIGNvbmNsdWRlIGFmdGVyIHRoZSBhYm92ZSBkaXNj
dXNzaW9uPz8NCj4gDQo+IEkgZG9uJ3QgaW5zaXN0IG9uIGZhbWlseS1zcGVjaWZpYyBjb21wYXRp
YmxlIHZhbHVlcyBoZXJlLCBhcyB0aGUgRFVzIG9uDQo+IFJaL0cyVUwgYW5kIFJaL1YyTCBtYXkg
ZGlmZmVyLg0KPiBCdXQgUlovRzJMIGFuZCBSWi9HMkxDIGFyZSBpZGVudGljYWwgb3RoZXJ3aXNl
Li4uDQoNCk9LLCBXaWxsIHVzZQ0KDQpjb21wYXRpYmxlOg0KICAgIGl0ZW1zOg0KICAgICAtIGVu
dW06DQogICAgICAgICAtIHJlbmVzYXMscjlhMDdnMDQ0LWR1ICMgUlovRzJ7TCxMQ30NCiAgICAg
LSBjb25zdDogcmVuZXNhcyxyemcybC1kdQ0KDQo+IA0KPiA+ID4gPiArYWxsT2Y6DQo+ID4gPiA+
ICsgIC0gaWY6DQo+ID4gPiA+ICsgICAgICBwcm9wZXJ0aWVzOg0KPiA+ID4gPiArICAgICAgICBj
b21wYXRpYmxlOg0KPiA+ID4gPiArICAgICAgICAgIGNvbnRhaW5zOg0KPiA+ID4gPiArICAgICAg
ICAgICAgZW51bToNCj4gPiA+ID4gKyAgICAgICAgICAgICAgLSByZW5lc2FzLGR1LXI5YTA3ZzA0
NGMNCj4gPiA+ID4gKyAgICB0aGVuOg0KPiA+ID4gPiArICAgICAgcHJvcGVydGllczoNCj4gPiA+
ID4gKyAgICAgICAgcG9ydHM6DQo+ID4gPiA+ICsgICAgICAgICAgcHJvcGVydGllczoNCj4gPiA+
ID4gKyAgICAgICAgICAgIHBvcnRAMDoNCj4gPiA+ID4gKyAgICAgICAgICAgICAgZGVzY3JpcHRp
b246IERTSSAwDQo+ID4gPiA+ICsgICAgICAgICAgcmVxdWlyZWQ6DQo+ID4gPiA+ICsgICAgICAg
ICAgICAtIHBvcnRAMA0KPiA+ID4gPiArDQo+ID4gPiA+ICsgIC0gaWY6DQo+ID4gPiA+ICsgICAg
ICBwcm9wZXJ0aWVzOg0KPiA+ID4gPiArICAgICAgICBjb21wYXRpYmxlOg0KPiA+ID4gPiArICAg
ICAgICAgIGNvbnRhaW5zOg0KPiA+ID4gPiArICAgICAgICAgICAgZW51bToNCj4gPiA+ID4gKyAg
ICAgICAgICAgICAgLSByZW5lc2FzLGR1LXI5YTA3ZzA0NGwNCj4gPiA+ID4gKyAgICB0aGVuOg0K
PiA+ID4gPiArICAgICAgcHJvcGVydGllczoNCj4gPiA+ID4gKyAgICAgICAgcG9ydHM6DQo+ID4g
PiA+ICsgICAgICAgICAgcHJvcGVydGllczoNCj4gPiA+ID4gKyAgICAgICAgICAgIHBvcnRAMDoN
Cj4gPiA+ID4gKyAgICAgICAgICAgICAgZGVzY3JpcHRpb246IERQQUQgMA0KPiA+ID4gPiArICAg
ICAgICAgICAgcG9ydEAxOg0KPiA+ID4gPiArICAgICAgICAgICAgICBkZXNjcmlwdGlvbjogRFNJ
IDANCj4gPiA+ID4gKyAgICAgICAgICByZXF1aXJlZDoNCj4gPiA+ID4gKyAgICAgICAgICAgIC0g
cG9ydEAwDQo+ID4gPiA+ICsgICAgICAgICAgICAtIHBvcnRAMQ0KPiA+ID4NCj4gPiA+IEhhdmlu
ZyBkaWZmZXJlbnQgcG9ydCBudW1iZXJzIGZvciB0aGUgY29tbW9uIERTSTAgb3V0cHV0IGluZGVl
ZA0KPiA+ID4gY29tcGxpY2F0ZXMgbWF0dGVycyA7LSkNCj4gPg0KPiA+IEJ1dCB3ZSBjb3VsZCBk
ZWxldGUgYXMgcGVyIFsxXSBmb3IgUlovRzJMQyB3aGVyZSBpdCBzdXBwb3J0cyBvbmx5IERTSSBh
bmQNCj4gWzJdIGZvciBSWi9HMlVMIHdoZXJlIGl0IHN1cHBvcnRzIG9ubHkgRFBJLCByaWdodD8N
Cj4gDQo+IFllcyB3ZSBjYW4uIEJ1dCBhcyB0aGUgaW50ZXJuYWwgaGFyZHdhcmUgaXMgdGhlIHNh
bWUsIEkgdGhpbmsgd2Ugc2hvdWxkDQo+IGtlZXAgdGhlIHBvcnQgbnVtYmVycyB0aGUgc2FtZSBv
biBSWi9HMkwgYW5kIFJaL0cyTEMuDQoNCk9LLCBXaWxsIGtlZXAgdGhlIHNhbWUgcG9ydCBudW1i
ZXIgZm9yIGJvdGggUlovRzJMIGFuZCBSWi9HMkxDLg0KDQo+IA0KPiBGb3IgUlovVjJMLCB5b3Ug
cHJvYmFibHkgd2FudCB0byB0cmVhdCBpdCBleGFjdGx5IHRoZSBzYW1lIGFzIFJaL0cyTCwgaS5l
LiwNCj4gdGhlIHNhbWUgcG9ydCBudW1iZXJpbmcuDQoNCk9LLg0KDQo+IA0KPiBGb3IgUlovRzJV
TCwgeW91IGNhbiB1c2UgYSBkaWZmZXJlbnQgbnVtYmVyaW5nLCBhc3N1bWluZyBubyBmYW1pbHkt
c3BlY2lmaWMNCj4gY29tcGF0aWJsZSB2YWx1ZSBpcyBpbnRyb2R1Y2VkLg0KDQpPSy4NCg0KUmVn
YXJkcywNCkJpanUNCg==
