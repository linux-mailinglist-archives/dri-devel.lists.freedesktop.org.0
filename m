Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D07E4526558
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 16:58:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 359F610EB96;
	Fri, 13 May 2022 14:58:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2073.outbound.protection.outlook.com [40.107.236.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E11C10EC77
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 14:58:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bano1VHgsyZrIQbAY6APSUiq+Xy5vj/lcvuACtKgeAAqv2WkuNazv0M9hqh76tQC7BUHyRad3iLsmqgHkGGPv+xjStaOgga21ePz/G+m/covN166Bd8EDmow1OrtXGXLuC3j3qpj6P/++rMOQXDPrWg2AXJgZejFaB45A7tJx8z9ynV4v3CnA7mYC2DuYODy+/vS2lzzBwRHUGPeoPgeb5dsC6DdA2T+bumLVZFHgVG53UiSIaFFcQ5Bz2461NXA9Na7xyM6jAF6/IUXQCPa8KOIKbcgUpeFbQ/pYCPM/yWq4YQGhXJT+9ds3Xrt2f7ablX4xD6OtlWnp1ODDSAqHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6xwTnwhlabM6A7uDiyi7Y9owA+9eG0ecg1cFai8aaMo=;
 b=iEqu19pPaK1OyPimLsdtPbMzCbw3BEiCL8yKiDZhn+9o7L5zbLo25hnVXOny2QjcuhsYCVcXYBK1mMokkex5QlPBznk4jksjtPGTDyS5iHMkXw5G4Jpi7qeJm7yup34bSeBk06kyGfqTM720W1714olKsyVAPqsYhQgZLE/0sfTOOUwU0lVkyOfS47RmXRyWb3NqeWWlD436hBtmQ8Xy/OmVM+Tx4SNxRwNFMf0+mKm13hzpeyjHEghUeyiNRVvPzSW/z9PjeYOi0y/WRbeUgxbfrJbtda8fXDixQz7qItaiuJSCsMvTzBVxr64FP0VwVv5LyxlXJqUEJ86/NyNmNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6xwTnwhlabM6A7uDiyi7Y9owA+9eG0ecg1cFai8aaMo=;
 b=HcE/mnfjpJ1V0kCqylyUqGfHQEWDTOaWMfZNPp6esu27t65/S82qfQVxkXrWpj+U9UT757z6xEueQcvtwl3RtvBPqN/UwjVu9jmk0VH9lzN9zOa1+U27XAcDo2Ico36dMFpOhYDXTotsG5J3VG40RfQbro+8vGUVjIDJRVRJL1E=
Received: from BN8PR05MB6611.namprd05.prod.outlook.com (2603:10b6:408:57::15)
 by SA1PR05MB8625.namprd05.prod.outlook.com (2603:10b6:806:1c4::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.4; Fri, 13 May
 2022 14:58:05 +0000
Received: from BN8PR05MB6611.namprd05.prod.outlook.com
 ([fe80::1105:32c5:7d56:5430]) by BN8PR05MB6611.namprd05.prod.outlook.com
 ([fe80::1105:32c5:7d56:5430%4]) with mapi id 15.20.5273.005; Fri, 13 May 2022
 14:58:05 +0000
From: Zack Rusin <zackr@vmware.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>, "airlied@gmail.com"
 <airlied@gmail.com>
Subject: [pull] vmwgfx- drm-fixes-5.18
Thread-Topic: [pull] vmwgfx- drm-fixes-5.18
Thread-Index: AQHYZtnZLf471OktPk6qMJDGoqyM3g==
Date: Fri, 13 May 2022 14:58:05 +0000
Message-ID: <a1d32799e4c74b8540216376d7576bb783ca07ba.camel@vmware.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.0-1ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ac0b2b0d-1d7c-4269-e0dd-08da34f0fbff
x-ms-traffictypediagnostic: SA1PR05MB8625:EE_
x-microsoft-antispam-prvs: <SA1PR05MB86256E7F0756FBBDC1D4537FCECA9@SA1PR05MB8625.namprd05.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fUwP5vO9t5Xdx0aZeRbRQCeb0qcFQRf9tGj1lguBWtS1RCONx4mLFigWDI8FlwA+3O6LG+p+objpaY6xVztOH4v4MoTu0vbv41Os/2IAIUauihfmfYkHEL56Mxm7VC5qijPZ2ZM3OPK1JZvfQg6IUXXR4QGI2napvD5/nrxe9GTiEhexc+6QC04e1tgTRULvAr0GeYATGPH8h4m5D1QFOtzlrctdD9zQECeNCVtHpkF9jVXqkid2c2H+LkKYWOfK/ec5JquSyq05txUoEXn/c2wpJ1vYXEiIYuVVQ2kN8INa92R7z8+ycmimLDglvTlv2LzmOCF5uiywDLNZuKWLTLrl3L/6BRYwJ3MJpDhQZgBM4YlsfiuF/D0WoKJ8WSRpzsCXz4vgow0PN4/B6GjvljW7lljJhRo86dQNA3TAgqBJpe8kaRJsLzBHp1q2zOi58c6Uzvs9iWJVDKLvjGGhxQnx8NdM8UfFad/o6xsIiPjPtVtZO33ivP17Uva3iJVIf9CT2MioOFighKZIr2atxmH7qcINljEdE0v/TLjG9o/Dlh0s2k7hb3CpgTK1iCK3IdWO16+mJlU6oku6bDH28w0xSjobrbPLaNsb4ZLdUSIpFJrwIuXQ5lfBEcojKxc6Jds0MRM/sArcZFgvRBUTjP8NZvgx1h5fz66rBHjCCJMAybXerFWOGKkVruGjyWeaavrlQOOTIxSr+gkMF2tixw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR05MB6611.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(71200400001)(508600001)(966005)(6486002)(91956017)(76116006)(86362001)(66946007)(66556008)(66476007)(64756008)(8676002)(66446008)(38070700005)(6512007)(38100700002)(2906002)(122000001)(110136005)(316002)(26005)(83380400001)(186003)(2616005)(5660300002)(36756003)(6506007)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WHI5OWFnRG5jOXVaN2pIUFEwYzQzNmxndGNCcFkwMTZndkovaVRDRURjdGh1?=
 =?utf-8?B?MjdaU25YdlJOeHBaMlVYWlFhMGpZNng2RW5jQkViU09Sb1BYdTRBQ3Npdmlo?=
 =?utf-8?B?S3htUDZ5U1hydzhJU0VUM1FyVitjWmJpN21PZUJQZGlrdnRtTFJXdFRNVXpz?=
 =?utf-8?B?NUQ2VmZzVXg4aGxWVmxrTUdnalM0UjRkTnV6d01jdHo0SFkzVG1ZUU00QSt2?=
 =?utf-8?B?Y0FBM1dIenFKYjZBL24xdWZTb3BOd05OMC9rTUlaOGszZzBmdFNQKzNMT2cx?=
 =?utf-8?B?Q2lKZ3VwWExpVElsWlRrL0tDeHN1RmtmRzViS09HdTAyTklUTnQ2K0ZWOHdV?=
 =?utf-8?B?clZVNTVQSThra0xteklEaGtuSDhHZTNkZkJzWlQrdG1mOUEvWmhPOWNrZVYz?=
 =?utf-8?B?bnY4UXNTcm94ODJrZVJQMVFkN1FMK3JZUHBKVFdIN2FSYTVZWnlDbmI4QTdC?=
 =?utf-8?B?TG1KNzhQMFZHeSt2QzlwY2NYb0szcmttSHR6QUhSVUVNU1ZkQlRwdjQ4ZHRJ?=
 =?utf-8?B?YzZwbVh4YkxBVG16cldzazRBeUZSUGEweDVrT09oOHRrcEZUV0hUcUlCYWRa?=
 =?utf-8?B?RWV4cTlFeGNyWHcyczFnd3NWeWJnU2ZWQzlJOXZNdFBIVko5M1FHd0RXSUNl?=
 =?utf-8?B?ZUhIY1RQUzBCV2twU2tzTWtpWUFjNnV4ZlRFZnByYTEwNXYzMWN2TEYvNWMw?=
 =?utf-8?B?Ui9wLzFEejljYjFWd2VVcUJSQU9xOHpTbHNjdEVjNUJJcHdrVWFuc2YvbGV3?=
 =?utf-8?B?S2tYbXV3THdGcE5kSDc1VDFBWW9RV3c3R0V0aXVMWnp0NFdmK2lMTFBLa2xv?=
 =?utf-8?B?RG9UQXRwN3RGR3JDZFp3cEhTZDViNnMxUXQvTUROdXBzQ28vQy84bWtxVmk4?=
 =?utf-8?B?dVdCT2pRTE9FRTJzUHRCNGw1UnprZFRIalhPNGQwOHkzcHVrcVpseUdhWmNK?=
 =?utf-8?B?ajZGcGU1aVlBbkw2bDF4anEyMnR2R3RiMTd1OCtlek5MTmt3Z1Y4V0JIbWIv?=
 =?utf-8?B?Tkg4ZWh2R1V2Y2VmNmxqeFc5S2lkQ0pMNXB3Zkl5WlZ2SktRRFZxMmhIYUtM?=
 =?utf-8?B?MUlmdmVpUEV3SGpRR0hvNGF1cDJvYis1MFV6SlhmTmQ3UmFwS25vbmEzTmkz?=
 =?utf-8?B?YUNDUkE5RnZxV0FwQzJ0YmhJNXhnSjVUS3VHQmFpTllYNDlLdUYrNWFMTkl0?=
 =?utf-8?B?dzhWQkRzNXoyRnZoVUNOMWM1MWdIWUdDeXlZU3pMN0d2VEZiRXVXNGFVaXI3?=
 =?utf-8?B?RExWVzJrUXgzSVZjTDJkbkJmMmpUcFhwUkZqTnNPcjR1MDd3b09IemNnbjJm?=
 =?utf-8?B?VUhSNU9GblU1SGhVU1J3UXp2QVhJNDQ3YmVKYjIvaDN1VEdPcXdiUDQvbVNn?=
 =?utf-8?B?cENwNXRQUnpvUk1YK0NtZE14a0FwOU1aeUx6d2gyNWF4TGZDNk1TdmtIRFJv?=
 =?utf-8?B?Y1RJWFRWMk1CeVBUT08zSVBvVDZEeU1tS3NsOUNZQmZDTVMxM3Nvdk1ZNWxn?=
 =?utf-8?B?ZG5lbU9LTnp4K01PaDYwMmd6d0ZHUVd5SjRRaHdDNlNxWTE0ZFQ2cWUwNTVk?=
 =?utf-8?B?d05WTU1BUnk0WjF4NGFqcmt4a0ZNZEE0TzhHNFZucHFKT0tpcnVXREpvNFRD?=
 =?utf-8?B?V1JaYmVGNVJjVXpaTFI4MnAwUXNRUTlTR3gwdWJhQmtwem16MGpLRXNQZ3RV?=
 =?utf-8?B?Vmlvb1Rjc21KaEZVeUNRbURWNlVmVTd2L3FBU0xMaHdBQm1nQUovRUVnekQx?=
 =?utf-8?B?M3NnMEhpcEk2ZkZRcXlnbUh5VjhFTEYwYkRJS3FSeGpEaWFDUUlvWi9NMm44?=
 =?utf-8?B?YmR6RUNJMnc0d3hDQUhxcVNuNFk3MGVOZkNzbnpEV1g1VVBWZzdOS3FOSXJw?=
 =?utf-8?B?cC9INmtLWHExRDZQbHJhUG44U0ZqTlVtY1NGWEZ5UCswcVpnSHVETmxtbmc1?=
 =?utf-8?B?YlAxYUdZeVNZY3Fnb2NINFNyM25EY09sckZKb3hZN2lJVUhjc0E4TlowYVZO?=
 =?utf-8?B?M0hzTkpDdk5LMXR6NGlIbHRET1lFa0VxaGVnS2Q4dWVNTk1SVkhWQ2pPTkM5?=
 =?utf-8?B?ekdkRnhTZzdmOXkyYXlQbkpGR2JoNlpnQnNDTWxzZkhaWFI5bTdMcXQrakFM?=
 =?utf-8?B?VXBsVWJBelh0ZHBlN3BrcHZoUzBkMXJsa0xXekREUVZvVHl6STRVZ1E0djNr?=
 =?utf-8?B?VVFyV2F3djlvQ2pFUStTRnFhV0RzRnJEL1k3ZEQ2RXlway9nQVJDaUQ2V1Mx?=
 =?utf-8?B?RDRqM1Z2V1lGai9LQitWVVZvM050U0t5NWJFTHJKV2lGOGVPd1VZeUlLUDlv?=
 =?utf-8?B?cUpKYjAxOUlOYWRodFQxYjBnU0VaQXI0NGxIWlNnSFpLYlYyNUx3Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2A904A67A10DB34D898BE72A17963684@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR05MB6611.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac0b2b0d-1d7c-4269-e0dd-08da34f0fbff
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2022 14:58:05.0523 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eYZ8+Ef6A5/IeJI5ChRxlnlJS115w8XAwwvKiAdGhJhdZhOW7QZot0yEMMuWtLpZVkxyuFlJJoSLovU2zaxpNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR05MB8625
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2ZSwgRGFuaWVsLg0KDQpTb3JyeSBmb3IgdGhlIGxhdGUgZW1haWwsIEkgbWlzc2VkIHNv
bWUgaW1wb3J0YW50IGZpeGVzIGZvciB2bXdnZnguDQoNClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBz
aW5jZSBjb21taXQgNTAwNWU5ODE0Njk4ZjQ3YzVhMzY5OGZjYzU2YzlmNWU2ZjFkNDY0NDoNCg0K
ICBNZXJnZSB0YWcgJ2FtZC1kcm0tZml4ZXMtNS4xOC0yMDIyLTA1LTExJyBvZiBodHRwczovL2dp
dGxhYi5mcmVlZGVza3RvcC5vcmcvYWdkNWYvbGludXggaW50byBkcm0tZml4ZXMgKDIwMjItMDUt
MTMgMTA6NDA6NTYgKzEwMDApDQoNCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5
IGF0Og0KDQogIGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy96YWNrL3Ztd2dmeC5naXQg
dGFncy92bXdnZngtZHJtLWZpeGVzLTUuMTgtMjAyMi0wNS0xMw0KDQpmb3IgeW91IHRvIGZldGNo
IGNoYW5nZXMgdXAgdG8gMjFkMWQxOTI4OTBjZWQ4N2YyZjA0ZjhmNGRlYTkyNDA2ZTBiMTYyYToN
Cg0KICBkcm0vdm13Z2Z4OiBEaXNhYmxlIGNvbW1hbmQgYnVmZmVycyBvbiBzdmdhMyB3aXRob3V0
IGdib2JqZWN0cyAoMjAyMi0wNS0xMyAxMDoyOTozNiAtMDQwMCkNCg0KLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0Kdm13Z2Z4
IGZpeGVzIGZvcjoNCi0gQmxhY2sgc2NyZWVuIGR1ZSB0byBmZW5jZXMgdXNpbmcgRklGTyBjaGVj
a3Mgb24gU1ZHQTMNCi0gUmFuZG9tIGJsYWNrIHNjcmVlbnMgb24gYm9vdCBkdWUgdG8gdW5pbml0
aWFsaXplZCBkcm1fbW9kZV9mYl9jbWQyDQotIEhhbmdzIG9uIFNWR0EzIGR1ZSB0byBjb21tYW5k
IGJ1ZmZlcnMgYmVpbmcgdXNlZCB3aXRoIGdib2JqZWN0cw0KDQotLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpaYWNrIFJ1c2lu
ICgzKToNCiAgICAgIGRybS92bXdnZng6IEZpeCBmZW5jaW5nIG9uIFNWR0F2Mw0KICAgICAgZHJt
L3Ztd2dmeDogSW5pdGlhbGl6ZSBkcm1fbW9kZV9mYl9jbWQyDQogICAgICBkcm0vdm13Z2Z4OiBE
aXNhYmxlIGNvbW1hbmQgYnVmZmVycyBvbiBzdmdhMyB3aXRob3V0IGdib2JqZWN0cw0KDQogZHJp
dmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfY21kLmMgICB8IDEzICsrKysrKysrLS0tLS0NCiBk
cml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuaCAgIHwgIDggKysrKysrKysNCiBkcml2
ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9mYi5jICAgIHwgIDIgKy0NCiBkcml2ZXJzL2dwdS9k
cm0vdm13Z2Z4L3Ztd2dmeF9mZW5jZS5jIHwgMjggKysrKysrKysrKysrKysrKysrKysrLS0tLS0t
LQ0KIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2lycS5jICAgfCAyNiArKysrKysrKysr
KysrKysrKystLS0tLS0tLQ0KIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2ttcy5jICAg
fCAgOCArKysrKy0tLQ0KIDYgZmlsZXMgY2hhbmdlZCwgNjEgaW5zZXJ0aW9ucygrKSwgMjQgZGVs
ZXRpb25zKC0pDQo=
