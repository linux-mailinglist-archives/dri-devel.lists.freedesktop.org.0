Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E428450B2A4
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 10:10:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D50610FE91;
	Fri, 22 Apr 2022 08:10:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2131.outbound.protection.outlook.com [40.107.113.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 599A510FEE8
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 08:10:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nuoHEIEfy1fYCtlVJ+DDC4XCmn9iil1QKsxS806RI8d0b0MCkerhXGjxycw9zTmHE58lg+6SKT5pyfIqeXnk6bcqd9Npi62dpN3mlz1FtShkxlaWUPphcdMUGlqoymQam6r1eL9UFoD12hI/3Rbef90ykkR0HOq80DZD+XQ4WvgDiCtsEnXWHQCjULvRYutcKiuI7htNkR6Mq2SUqTtX8ogP6QqyqtcgBVtwjmzjqQVimBI+JcNVM0UGV4QBoVj/H/dYsKkOy6dH/5wrO8W8ERXIfhPdHhpSHVlMHGK0IzH5iujyjqDfgj20vzf0D7GmkHPjtKnJMK4SOOf7UDWDBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BawZHJwfzE0MTldONm1nPvhGe6OPWcJ86ajji0Hw1Gk=;
 b=iWyKtWbRehntcn4AUoFTGBj+yxTvgsJf6tY+mxxvHJbs2opJdjzVgO/qsPsCQ3X/qbMsrJAAekbm3a3/+36nOz1T/IJjg2PV2pAc01BVYMZFb9hCMQumsxsB6S2r3FrqQRd83T26W/poWoxn3PuxS8ln/TRAaKS29sHw3RrVg9+6sLdal0VwXgU6wPOcZTga++ESwly7oo0K/FYyC0KBETSRanF2EsiW7y7lSHqXVdvVW15SLXuEPZmoN/wyIbGv5JhGDd0awbOjgy5pZ0mQa0Otunk4X3qualhvHDeiRjDP0+Z7F4U2NUQJ58eVsoAPqP5H5sRSHOiP1Jjujb9jIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BawZHJwfzE0MTldONm1nPvhGe6OPWcJ86ajji0Hw1Gk=;
 b=mW3vBMpmND7HqEYfE1Xsc5cfd+Qkz/RaEQKs9T7lh3p8rgRPGw8Wi2rumKMnezLa1yoT1R3vXTKygyoo5zwxI5eaXQ8ktUmJaVyKVN4dZQMlDZViSeE4tZ9R0yT30gl//EakpMW0TxYWDSJg2H5aopAw/SAa2XPA86Dx9oCd7Q4=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY2PR01MB4569.jpnprd01.prod.outlook.com (2603:1096:404:110::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Fri, 22 Apr
 2022 08:10:51 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db%4]) with mapi id 15.20.5186.014; Fri, 22 Apr 2022
 08:10:51 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: RE: [PATCH v3 1/4] dt-bindings: display: Document Renesas RZ/G2L DU
 bindings
Thread-Topic: [PATCH v3 1/4] dt-bindings: display: Document Renesas RZ/G2L DU
 bindings
Thread-Index: AQHYVZ1I7yZjrgOqkEeJ5CQoFwWKZ6z7kO+AgAABDrA=
Date: Fri, 22 Apr 2022 08:10:51 +0000
Message-ID: <OS0PR01MB5922728B940A386674DAB36786F79@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220421163128.101520-1-biju.das.jz@bp.renesas.com>
 <20220421163128.101520-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdWMmkY+_O_oyKeumuOqNvw_KJaDxuiwrETc3W-kCV2MCg@mail.gmail.com>
In-Reply-To: <CAMuHMdWMmkY+_O_oyKeumuOqNvw_KJaDxuiwrETc3W-kCV2MCg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5c93c547-58aa-4f93-91ba-08da24379d94
x-ms-traffictypediagnostic: TY2PR01MB4569:EE_
x-microsoft-antispam-prvs: <TY2PR01MB456955866FE605CE01995F5E86F79@TY2PR01MB4569.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MsbIfH2BhOa/uS83N19fLRa/+SwVA+MGv52WyrKiW0cveEFylsl5aeqH6Z3kYt5NCjWEi/4OF+XQatgTxE07PX640jHr6Ba8GByrYq7hDIh9tu7DhztuHhJMiDDnIOKKTQU1Q3RHhZ2Q7kA3qvJlnk2tHe4l0HXxXHwlQPFx2zH3ZJtqTwAKRZCk//T4anyLBm1vLtQoqbzTShpm1MoYkBeLhdeTKTY6ipfa7YhafEPJLG8sNzP49QsGOFmKdhKyHOO1hVqk8s37rIVsPF26x3SXl8nZJXazg8gpoo32ZyONIh0Fm2SrUgrOip0zsOyCC6aXxEgBe7/2Bic4uCbf5fSeSsb2IV9ep8gxeo+CHc0Ot5vNZbo3GyZyquAOtokhMuu0v6eH3GGXdTzEBq1EiUrhNhLPrSzqVd0q79G0jyF9anDNtjVkMbSrZ1Mvrpi7FEHwd1Y+po44e9tnjFvjmVNRUw6nxodtlUV723586hN7YcmH7faAewWgwDrDOpY4rF5V+4wua1n7GGtgnyh+9LvBO3iCyRAak5iU+dZhbP8hWcBum3WaIQoZnysfqXCtex1ZWCG75KrgOG3+gkuJIucziIv0Z2bXL58E8agvoz7K/z2/W289kSKW0ydVLXxVGBWdXFv6qo1FE24noYBSAa9elY/caCwfLNJkYFnLkj/YwwEK2Vd0NyWwMY0+MOwzc67eocRdIfmeZ8zY5LR4mYaTz8wpg7N7eRtCzIurTYJ+pZ8lRHUOfM7cY9FwO8fxzGU1AbOMXA1c75CyyCiEibZTetyOBNbgEBaGj686L66HeiZBiBw7XaHl/6p+kf+dpS/Y6o2Hokiz4M3DXgLdeg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(55016003)(53546011)(5660300002)(7696005)(38100700002)(122000001)(38070700005)(6506007)(2906002)(76116006)(6916009)(316002)(966005)(86362001)(54906003)(26005)(52536014)(8676002)(66446008)(66476007)(4326008)(83380400001)(66556008)(186003)(66946007)(9686003)(64756008)(71200400001)(33656002)(508600001)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?THRWMFhkS0Z0SGF1TFF0eWowMlBnV3B1cVJWQjdlMHhGcDdUOWowdGEvMGVs?=
 =?utf-8?B?clh2OHQ2dmcwanIrTzBxYy9JSWh2a1N6MzlXbTd5TUZna2ZSTVhiUjdrRmNL?=
 =?utf-8?B?ai8rSTBXalBrdGJ3cDQ2emlNaUhPVjY4Nk9QbGlFZE9wL1F2eEVIMXo5ZW53?=
 =?utf-8?B?OWlNTFBZaEdoRDJpck53UE15QUZPd3BLNWdqaWJGNWFnZnc1aGlSdC9kaUJK?=
 =?utf-8?B?ZVVrTTAzVTRNVUpROTU5Q0JBNWFHYzF4Zjh4R0VPYWJIR2lkay9jc2JrUG40?=
 =?utf-8?B?NnphZ1FuODRkSXNxQzBFL1dtTlFSRFVJTk4yRmY0cmVodTdKVnJXdkdxVmlR?=
 =?utf-8?B?R0xnZWJWWUszT3lwYmtEUXNZWlVZNm85ZWo2YWdTVm05MjJrTGdTeEx5bU5i?=
 =?utf-8?B?YzllWE1GUmY4akpNS29YZ3NJeVl4Q2JULzZocmRWRm44M09KZVN6TlAwcXFK?=
 =?utf-8?B?UFgxYXlrRENGNTJNL0Joc1VsRWhvUEhjY1FxSllQZjAzSVErRFh4TndrM2hm?=
 =?utf-8?B?ZURsVWtxTXBwUkdsZWJqc05Yd1pKZmoxdWhPdTFVMUlKUTdVVEFyb0pEMkZm?=
 =?utf-8?B?bGVnSTUvckZXd29zWC9CZ1RRMVFLbkJ2RE9hLzFvSWtMYmJBdVVzNDlOTHFn?=
 =?utf-8?B?V2ZseGJjeE1WS1h0dkxVMURHT3BqaWU3UEFJWEFkS3ZVTHBVcy9najNmeXpu?=
 =?utf-8?B?TW5tWGcyWGdsQ3pUdU5rUmV1MllGSk0zd1plcExveG9yTXZ2cndUQmlHcnd4?=
 =?utf-8?B?WVZRcjZNbWV5Q044Q0VMRWk4Rm5QazVTQisxbkJDQm45SzEvVEthekVaekhr?=
 =?utf-8?B?eG1samczcXUzZWVwYTlMNzBvRlZjQjlPdHhveG9CZWhyUGFwcFEzckdxeG1a?=
 =?utf-8?B?Z3diUGxsanUvLysyQTh2M2VMR3BXQ1c2ZnM5SDY5K2RmUS9zeC9WVmNwRU1o?=
 =?utf-8?B?QWlsekpsYmFvV1FmUDZ4cUNpSDBvcHo2MEorWmc5Vysya0xsTFFiTGxkUXBl?=
 =?utf-8?B?NXdzZEVGM1FYRUxqRlhHY1VOOVFuTUQ4MkdVN0RUa3BGTmlhQldwMmtuaVNU?=
 =?utf-8?B?TUVzNkVjbE5hVU4yK01oYUU0aXliaUora25jWjhIaE91dUlNMlNZQStmemlB?=
 =?utf-8?B?VDVhaXhaU0FEZGJnaFg4UGkyRjVFT1VXenljc3pIR29GUzBnVWxlVHo2MStF?=
 =?utf-8?B?T0dKTWRHWldyb1hENUIxSXQvQS9zNDhjTmh6VDVrVmhYUDZmYy96N1ZWeXQ2?=
 =?utf-8?B?azdwajZPdEZLQjhQeC8wS3pUYTEraUthclBnWHQ0NjBjeWMzT0E5WVVZQVdF?=
 =?utf-8?B?K3ptQXZlZEx2MTVYS2JXL2hycGNQeFJhUUhSdkp1bkx5N09sMGpuWWcvNFRJ?=
 =?utf-8?B?dGxWelA4UVRJaXFBUDRFbmNBVUZjbEpPYS9QOGV6TFZyVWxqR3AyK1FRMnRy?=
 =?utf-8?B?U1llemY0UGRBcWljaU02Mm1LbTU5enVSOU9kbktIQTZvbUt3WnZQTHJXQ2dN?=
 =?utf-8?B?K085aTcrSnZXZ0t4a0QwaU5zcFRSTjFvcHo3ZzAxSDI1L0h6TnFacE1zZjNB?=
 =?utf-8?B?RDZ4RXVqcjdwMFB2cDAwa2d0U3BLb2VtZm9WRzdETHBGSkprd2tsNFJxS0No?=
 =?utf-8?B?ME5FYWdwc3lyR2d4WXBmKy9UNXFJamtseTJsNVBKekR3M2gzN25PZFdvdjc3?=
 =?utf-8?B?a1BMa3pKa0hsVUt4dkc2SkRBMk9xZGpRaTkvaGxWT1NvbkNMRDgwdHl1T00w?=
 =?utf-8?B?MHpSZ2g4dHp4cTZXUFBUUnEzb2djdDhRSDI1SGIvNWFkMnNoRjdDZWcyRzNN?=
 =?utf-8?B?TTRwd3FFMmxMcXlCU29ybGc1MWpLYVlwUWcrenlnWGc0cFRZbVhjNmpBbXlO?=
 =?utf-8?B?a1dlYnB1djMvVmNsSmZMS3J0MkVuQ1daUG82ejNLbXpuMDZpYld3WmFMdm9L?=
 =?utf-8?B?TTBwdmVZRnlwWUFzYmJ0V21rVzZ2MTJYZDh2WldrNXBGNmo4TE9FRXM1eWJO?=
 =?utf-8?B?QXJsZzRGQnIyWG5pRkttMXNVbS9HeXk4Ynlrd04vTDNxK0pOZTcrTWFNenZW?=
 =?utf-8?B?WEd4dElSRktUak03OWhBZlE3ZFNnamlwME5GOXhycnhiekVxVGVFQSt6d1A2?=
 =?utf-8?B?ZFJnVDBOOTEyVXJ6M3A0TUtnanhLYWxjK2JwUHVYRzZGZEprOTFZY2hWNzRs?=
 =?utf-8?B?ZU9CTFdZY2RVMG5ybCtEcGRRenE1OVU3bHUzbFhqMytsUGlZV2tUMC9hL0VT?=
 =?utf-8?B?cmpQQU0vVVVJaWNuTGlsRFgvVjZ0UXhwOEhoemdHSWlhdE1XcVlESXN3UW16?=
 =?utf-8?B?cVp3M0tiSHl0dERpU0J2QUZ0UndTWGh5L1czMGRRUHJ6Yzd6ZEZETXdMQWV6?=
 =?utf-8?Q?4r+i9zcJwj4lqBIA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c93c547-58aa-4f93-91ba-08da24379d94
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2022 08:10:51.1282 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2AgEVjCRd30oIF13FXi943sywc4WnjzdwsTHoAGE9MKqHxn9HXoCaUUsc8yuCVr/6zl/GBpbDnbR+wssqPgsMmabglwMJfULEqq69OMAdkU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4569
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
MkwNCj4gRFUgYmluZGluZ3MNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBUaHUsIEFwciAyMSwg
MjAyMiBhdCA2OjMxIFBNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4g
d3JvdGU6DQo+ID4gVGhlIFJaL0cyTCBMQ0QgY29udHJvbGxlciBpcyBjb21wb3NlZCBvZiBGcmFt
ZSBDb21wcmVzc2lvbiBQcm9jZXNzb3INCj4gPiAoRkNQVkQpLCBWaWRlbyBTaWduYWwgUHJvY2Vz
c29yIChWU1BEKSwgYW5kIERpc3BsYXkgVW5pdCAoRFUpLg0KPiA+DQo+ID4gVGhlIERVIG1vZHVs
ZSBzdXBwb3J0cyB0aGUgZm9sbG93aW5nIGhhcmR3YXJlIGZlYXR1cmVzIOKIkiBEaXNwbGF5DQo+
ID4gUGFyYWxsZWwgSW50ZXJmYWNlIChEUEkpIGFuZCBNSVBJIExJTksgVmlkZW8gSW50ZXJmYWNl
IOKIkiBEaXNwbGF5DQo+ID4gdGltaW5nIG1hc3RlciDiiJIgR2VuZXJhdGVzIHZpZGVvIHRpbWlu
Z3Mg4oiSIFNlbGVjdGluZyB0aGUgcG9sYXJpdHkgb2YNCj4gPiBvdXRwdXQgRENMSywgSFNZTkMs
IFZTWU5DLCBhbmQgREUg4oiSIFN1cHBvcnRzIFByb2dyZXNzaXZlIOKIkiBJbnB1dCBkYXRhDQo+
ID4gZm9ybWF0IChmcm9tIFZTUEQpOiBSR0I4ODgsIFJHQjY2NiDiiJIgT3V0cHV0IGRhdGEgZm9y
bWF0OiBzYW1lIGFzIElucHV0DQo+ID4gZGF0YSBmb3JtYXQg4oiSIFN1cHBvcnRpbmcgRnVsbCBI
RCAoMTkyMCBwaXhlbHMgeCAxMDgwIGxpbmVzKSBmb3INCj4gPiBNSVBJLURTSSBPdXRwdXQg4oiS
IFN1cHBvcnRpbmcgV1hHQSAoMTI4MCBwaXhlbHMgeCA4MDAgbGluZXMpIGZvcg0KPiA+IFBhcmFs
bGVsIE91dHB1dA0KPiA+DQo+ID4gVGhpcyBwYXRjaCBkb2N1bWVudCBEVSBtb2R1bGUgZm91bmQg
b24gUlovRzJMIExDREMuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5k
YXMuanpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+IA0K
PiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9yZW5lc2FzLHJ6ZzJsLWR1LnlhbWwNCj4gPiBAQCAtMCwwICsxLDE1OSBA
QA0KPiA+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0y
LUNsYXVzZSkgJVlBTUwgMS4yDQo+ID4gKy0tLQ0KPiA+ICskaWQ6DQo+ID4gKw0KPiA+ICt0aXRs
ZTogUmVuZXNhcyBSWi9HMkwgRGlzcGxheSBVbml0IChEVSkNCj4gPiArDQo+ID4gK21haW50YWlu
ZXJzOg0KPiA+ICsgIC0gTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydCtyZW5lc2Fz
QGlkZWFzb25ib2FyZC5jb20+DQo+ID4gKyAgLSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVu
ZXNhcy5jb20+DQo+ID4gKw0KPiA+ICtkZXNjcmlwdGlvbjogfA0KPiA+ICsgIFRoZXNlIERUIGJp
bmRpbmdzIGRlc2NyaWJlIHRoZSBEaXNwbGF5IFVuaXQgZW1iZWRkZWQgaW4gdGhlIFJlbmVzYXMN
Cj4gPiArUlovRzJMDQo+ID4gKyAgYW5kIFJaL1YyTCBTb0NzLg0KPiA+ICsNCj4gPiArcHJvcGVy
dGllczoNCj4gPiArICBjb21wYXRpYmxlOg0KPiA+ICsgICAgZW51bToNCj4gPiArICAgICAgLSBy
ZW5lc2FzLGR1LXI5YTA3ZzA0NGMgIyBmb3IgUlovRzJMQyBjb21wYXRpYmxlIERVDQo+ID4gKyAg
ICAgIC0gcmVuZXNhcyxkdS1yOWEwN2cwNDRsICMgZm9yIFJaL0cyTCBjb21wYXRpYmxlIERVDQo+
IA0KPiBQbGVhc2UgdXNlIHRoZSBmb3JtYXQgIjxtYW51Zj4sPHNvYz4tPG1vZHVsbz4iIGZvciBu
ZXcgYmluZGluZ3MuDQo+IA0KDQpPSy4NCg0KPiBJIHRob3VnaHQgdGhlcmUgd2FzIG5vIG5lZWQg
dG8gZGlmZmVyZW50aWF0ZSBSWi9HMkxDIGFuZCBSWi9HMkwsIGFzIHRoZQ0KPiBvbmx5IGRpZmZl
cmVuY2UgaXMgYSB3aXJpbmcgZGlmZmVyZW5jZSBkdWUgdG8gdGhlIGxpbWl0ZWQgbnVtYmVyIG9m
IHBpbnMgb24NCj4gdGhlIFJaL0cyTEMgcGFja2FnZSwgYXMgcGVyIHlvdXIgY29uZmlybWF0aW9u
WzFdPw0KPiBIZW5jZSBwbGVhc2UganVzdCB1c2UgInJlbmVzYXMscjlhMDdnMDQ0LWR1Ii4NCg0K
SSBjcm9zcyBjaGVja2VkIEhXIG1hbnVhbCwgb24gdGhlIG92ZXJ2aWV3IHNlY3Rpb24ocGFnZSA2
OSkgU3VwcG9ydGVkDQpEVSBjaGFubmVscyBvbiB2YXJpb3VzIFNvQydzIGFyZSBhcyBiZWxvdw0K
DQpSWi97RzJMLFYyTH0NCuKIkiAxIGNoYW5uZWwgTUlQSSBEU0kgaW50ZXJmYWNlIG9yIDFjaGFu
bmVsIHBhcmFsbGVsIG91dHB1dCBpbnRlcmZhY2Ugc2VsZWN0YWJsZSwNCg0KUlovRzJMQw0K4oiS
IDEgY2hhbm5lbCBNSVBJIERTSSBpbnRlcmZhY2UNCg0KUlovRzJVTCAoIEZyb20gUlovRzJVTCBo
YXJkd2FyZSBtYW51YWwgb3ZlcnZpZXcpDQriiJIgMSBjaGFubmVsIHBhcmFsbGVsIG91dHB1dCBp
bnRlcmZhY2UuDQoNCj4gDQo+IERvIHlvdSB3YW50IGEgZmFtaWx5LXNwZWNpZmljIGNvbXBhdGli
bGUgdmFsdWUgKCJyemcybC0iKSwgYXMgdGhpcyBJUCBibG9jaw0KPiBpcyBzaGFyZWQgYnkgKGF0
IGxlYXN0KSBSWi9HTChDKSwgUlovVjJMLCBhbmQgUlovRzJVTD8NCg0KTWF5IGJlIHdpbGwgY29u
Y2x1ZGUgYWZ0ZXIgdGhlIGFib3ZlIGRpc2N1c3Npb24/Pw0KDQo+IA0KPiA+ICthbGxPZjoNCj4g
PiArICAtIGlmOg0KPiA+ICsgICAgICBwcm9wZXJ0aWVzOg0KPiA+ICsgICAgICAgIGNvbXBhdGli
bGU6DQo+ID4gKyAgICAgICAgICBjb250YWluczoNCj4gPiArICAgICAgICAgICAgZW51bToNCj4g
PiArICAgICAgICAgICAgICAtIHJlbmVzYXMsZHUtcjlhMDdnMDQ0Yw0KPiA+ICsgICAgdGhlbjoN
Cj4gPiArICAgICAgcHJvcGVydGllczoNCj4gPiArICAgICAgICBwb3J0czoNCj4gPiArICAgICAg
ICAgIHByb3BlcnRpZXM6DQo+ID4gKyAgICAgICAgICAgIHBvcnRAMDoNCj4gPiArICAgICAgICAg
ICAgICBkZXNjcmlwdGlvbjogRFNJIDANCj4gPiArICAgICAgICAgIHJlcXVpcmVkOg0KPiA+ICsg
ICAgICAgICAgICAtIHBvcnRAMA0KPiA+ICsNCj4gPiArICAtIGlmOg0KPiA+ICsgICAgICBwcm9w
ZXJ0aWVzOg0KPiA+ICsgICAgICAgIGNvbXBhdGlibGU6DQo+ID4gKyAgICAgICAgICBjb250YWlu
czoNCj4gPiArICAgICAgICAgICAgZW51bToNCj4gPiArICAgICAgICAgICAgICAtIHJlbmVzYXMs
ZHUtcjlhMDdnMDQ0bA0KPiA+ICsgICAgdGhlbjoNCj4gPiArICAgICAgcHJvcGVydGllczoNCj4g
PiArICAgICAgICBwb3J0czoNCj4gPiArICAgICAgICAgIHByb3BlcnRpZXM6DQo+ID4gKyAgICAg
ICAgICAgIHBvcnRAMDoNCj4gPiArICAgICAgICAgICAgICBkZXNjcmlwdGlvbjogRFBBRCAwDQo+
ID4gKyAgICAgICAgICAgIHBvcnRAMToNCj4gPiArICAgICAgICAgICAgICBkZXNjcmlwdGlvbjog
RFNJIDANCj4gPiArICAgICAgICAgIHJlcXVpcmVkOg0KPiA+ICsgICAgICAgICAgICAtIHBvcnRA
MA0KPiA+ICsgICAgICAgICAgICAtIHBvcnRAMQ0KPiANCj4gSGF2aW5nIGRpZmZlcmVudCBwb3J0
IG51bWJlcnMgZm9yIHRoZSBjb21tb24gRFNJMCBvdXRwdXQgaW5kZWVkIGNvbXBsaWNhdGVzDQo+
IG1hdHRlcnMgOy0pDQo+IA0KDQpCdXQgd2UgY291bGQgZGVsZXRlIGFzIHBlciBbMV0gZm9yIFJa
L0cyTEMgd2hlcmUgaXQgc3VwcG9ydHMgb25seSBEU0kgYW5kIFsyXSBmb3IgUlovRzJVTCB3aGVy
ZSBpdCBzdXBwb3J0cyBvbmx5IERQSSwgcmlnaHQ/DQoNClsxXSBodHRwczovL2dpdGh1Yi5jb20v
cmVuZXNhcy1yei9yel9saW51eC1jaXAvYmxvYi9yei01LjEwLWNpcDEvYXJjaC9hcm02NC9ib290
L2R0cy9yZW5lc2FzL3I5YTA3ZzA0NGMyLmR0c2kjTDI0DQoNClsyXSBodHRwczovL2dpdGh1Yi5j
b20vcmVuZXNhcy1yei9yel9saW51eC1jaXAvYmxvYi9yei01LjEwLWNpcDEvYXJjaC9hcm02NC9i
b290L2R0cy9yZW5lc2FzL3I5YTA3ZzA0My5kdHNpI0wxMDAwDQoNClJlZ2FyZHMsDQpCaWp1DQoN
Cg==
