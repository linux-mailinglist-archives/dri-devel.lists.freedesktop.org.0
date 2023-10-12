Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0217C69E9
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 11:44:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16EF110E47C;
	Thu, 12 Oct 2023 09:44:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::701])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D858310E47C
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 09:44:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mlTNtJwmWenP/dPvdvP2iX6ogO/ONGcIYdEkZL+zlrrba3TrqdBDqtZ2IawqSWoeYMoJdM/gOZswNxsZl+P5vPZGT989X/n/LF9c7Jh1UvHoiV57UBFGrlDbpLVm5NMXd8YtBcyeszbwi/LA21ZCC3k50U05HJIoPgO9YvXidOzA/B9GkWWTMPGpIyZruOgPUjtYVOQAyVz2OF10B9lbfneSU3vXuFDgTDgitaMgTdT/iAALiBqmAlpLvJ84RmY58E8ZDB8lLWmqCrn6C7C/cyk2DHsHzBkUWXQ1CGdGFxlEp7s/qm4R+m35JiXGCER41K33ez688AKIMWzbVH7kBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TqZBPuHTq0klNm5NA83cgaTRqx9RadRqaYsjlD5gOkY=;
 b=PBf7fHNMMYWDPwb4SbabaA09vs1B2Wxe3bvTiwxNFuDY4Ol0dSwO30345PMNPCts91x/ryVQFW+I28iywcZyh/deTDVjBbiRZM8J4oP7FlWSf+0jZtUGkUqZSgwR2Fv0RChAZizzTY/rbGWRrYW+FH+ahm9d7yueg3h8RfIejYGmdyq9ajgs0Iu0CLTmVqcJCWQLWE1iEsuQaM18WvgedTYE5HhBVR57LpcWtZf4xL5MybnQ8oVjyQWOAU4Gtee7rFWINOCs1gBQB/pg8EChDTvNHtZwfCmuq5nQxm42/EyFcgIjTBFoW5NX3MnYO/W1ewiJosNzWITuvPZsui0nEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TqZBPuHTq0klNm5NA83cgaTRqx9RadRqaYsjlD5gOkY=;
 b=XgXgCkJed2gY78Fv9vEHDK6hgCufzZlwg9bhLcPaDj1LIxgcUfXQos88/c0K/4wsZZ3G+aLYUYnSn6POGyzQoS/E20LQhSjDM1TGlbxqfK3WdZDrcNuns/lWSDHOLA4I4lUwyV5RKAjjLR4eDsyxnA30fMb0LAleS0k3TDM2b/0=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TY3PR01MB11890.jpnprd01.prod.outlook.com
 (2603:1096:400:406::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Thu, 12 Oct
 2023 09:44:04 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::db75:e192:bbfa:78a2]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::db75:e192:bbfa:78a2%3]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 09:44:01 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Jacopo Mondi
 <jacopo.mondi@ideasonboard.com>
Subject: RE: [PATCH v11 3/4] drm: renesas: Add RZ/G2L DU Support
Thread-Topic: [PATCH v11 3/4] drm: renesas: Add RZ/G2L DU Support
Thread-Index: AQHZ9SvlO8OfKLrQHU2DYmf59iqINrBF8ROAgAAEp6A=
Date: Thu, 12 Oct 2023 09:44:01 +0000
Message-ID: <TYCPR01MB112698FFB7FBFF2131BF4B94A86D3A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231002122740.220177-1-biju.das.jz@bp.renesas.com>
 <20231002122740.220177-4-biju.das.jz@bp.renesas.com>
 <CAMuHMdWC5Nd3nezR1K_XD5CJTM76XUbv3=Pf9fHvYK43n4iqmQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWC5Nd3nezR1K_XD5CJTM76XUbv3=Pf9fHvYK43n4iqmQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TY3PR01MB11890:EE_
x-ms-office365-filtering-correlation-id: be7509e6-02c0-4714-65f7-08dbcb07c422
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: htv6eV22haTQI0TCiaHyErRg5CtBjTujmB9mi3PMvEwLLOl2suc5j+iDMnmF7zJre5nAhs4IvSyfHhbCtAxfTIIlqJ+HR9NIvoDeU1fx46rnDssIFNsNEnoeWe1ravvsK4LumygZEdBLsN+G+MioO/C9cxcO4OWgkrnWBtNbJUHBcrjqFZ+2MVlqo29T7fQ2cf7PHM0/UuWE3a8W+RGhtqBXd3aZDJ+87o2nI8GDRUw8JMfKdUKM67mh/YOK6sg0zJmvUg/r7ONBypmHAqdjxe3e8c5LWiPzwwtXske9wn5Kpfeuq1Po2xX1o4x2PVXolQc7HAD2peHDEs1nWCY77DbDwBLI2Y17cp+5NE96T3p7431slyyaMgToaJ/PUy5Z1ZDzCZ9g80KWNlenB7Lqy6Y9VLsfX4HaRkU9oflBtmWcmd4+/a+D1MSYnAvtxmL6CP8NY41wTSBhHkI94XSJYauHuYlMdLG5wrWVB6YcUM/pcFp5fCk+ddlIO58ORZinth2zq4Jxjqxd6Uez3UwQXLhEpkkJ4YDkjj/9eSgcx8NK52w0lPqFX28X/x2mfGqfYgRP9eGgXoQdAKa4kD4mHhnD79YJWSl1+4vZva5I1xaNjFyYsmz6rAxovFIFX/MG
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11269.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(346002)(136003)(376002)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(66446008)(66946007)(76116006)(54906003)(64756008)(66556008)(66476007)(33656002)(316002)(110136005)(71200400001)(7696005)(6506007)(53546011)(9686003)(107886003)(55016003)(478600001)(2906002)(7416002)(4326008)(52536014)(8676002)(41300700001)(8936002)(5660300002)(86362001)(26005)(122000001)(38070700005)(38100700002)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VWc1N3dBWnBnSE5uMTU0Snl5bytrcExjazByN1lsWnRTSXB3b1I2dndlYmcx?=
 =?utf-8?B?S0o2aThadUIwZjZLK3k4ekhmWnRxSVRIUks4c2t4T044SXgrVk9SNUdLMFBr?=
 =?utf-8?B?WHJmQmt3N3ZwT0gzU1Q5eFpVMWNla2E3T3JYSEVWUkVKMHJtamo2M3ZrbkRv?=
 =?utf-8?B?KzRIeDhHT3U2UWI5Rlk4L1NQMmgyVTdiZmJBV1QyUEhXdWp3ZUJndkFPMFBT?=
 =?utf-8?B?VDRoYmU4eUdxcEUwOHRKSXR3UXh1anJSMzhYU3hQaGlDZThaajRZNzZTajJI?=
 =?utf-8?B?OXVDemJKaVI4eTZCQlFSRjg1Zks0aDRSeFcyZVNnM0ZYd011VDRGOVlSb0Ix?=
 =?utf-8?B?SU5VN2hPVVVGZFR6QXpiMUoxMXlEMm45ZW5TRm54T0lWVEYwRndzay96Z2Vy?=
 =?utf-8?B?STA2akR4V1VGWkNPR0VRYmhhUkszaklMN2IrRDBtazRJdnozQUQ4V2tYcEJP?=
 =?utf-8?B?K0NsSVZUWXFESEkzZC9GZnljVmtWd0w4TmV6cU4zd1ViRW1NVGVpaXJ5TWFj?=
 =?utf-8?B?RmlnTVlSeGQ0bzBiZDVIZWhJUDVKcWJJYVNjbFl1MnJlVFVvYUVpSWFReFRh?=
 =?utf-8?B?bWtTbmpRQmQzdEVycExjSnBoK2NyWTBtY0p6QkgwZG5EQVlEdVVzU0lzUTVr?=
 =?utf-8?B?RkVOSFlzTnVuSGMwaFM0ZWJiM3J4NnlxazU0R2UzaG10cVQzb1FXa2tDRVdk?=
 =?utf-8?B?Q2IwVG5sZ2d0L1dWK2ZpMEwwNGF2K2VWQTQ2aFJSd1Zwdy9vODdhWm0wMWVW?=
 =?utf-8?B?OXRDa3Uxc2ZReStBR05sZjM4azF0NXpsb0VQZVhRcjBndU9zY3dseFNySlgy?=
 =?utf-8?B?S0dZNkNOY2R5bXRSNnVnQlBQWHNralg1enJRUWlUQytzTGtlOHV3MGVrYU4x?=
 =?utf-8?B?Slo0OTlPTVhKa0J3dWMwMlptcG5yTFhEZEZNTVNOcWVOb0tScE5MREZweXdV?=
 =?utf-8?B?UFRUZHZnUGk5UmREYytyd0VVZW13aG5YN2RtaDRuM0g1U1ZtU3pGakRCUU5X?=
 =?utf-8?B?RGFzem9pdkdOYW95TzdDWmg1THpWMGlyUFF3dDk2YzJPZktWd080WlBoUHFy?=
 =?utf-8?B?YzdXWWR6LytPVWxoa21TVlpISktEaWlqR2N4blp2VXBMOHd0OHZKR0dnbytV?=
 =?utf-8?B?Uzh2cUhaNDZmeWpDUW04T0NpbUtSYmFMNjFZSkdyeHUrRXhrUWpYOE1RNmdi?=
 =?utf-8?B?RmJReVBRRENVUFRwcExFeStEK2htT0hCNlo3RDRCLzJYR0tvY3hBVkRjQ1I4?=
 =?utf-8?B?MzRDVHVKOGxBTks0L3lrdW4vbGV2ZTlwZTdydUpWeVFFaTNycEdyZHRNZ1Zv?=
 =?utf-8?B?VmtxR2ZPZDl0ZUtjei9Edm1QWnZJY3lmNGZ4NEV6ZlFEeENyOUw5Z3plb3Jw?=
 =?utf-8?B?eFVmUUhjTVB1QjdMQkRlemRGcmFVdVUxb3d5TU91dHVnVnRIUGtaemI4Mm9U?=
 =?utf-8?B?Zm1vYmlMYTNNeTBYalIvcWdTM3lLUXBuRWo4elNtWTAvZ3FuTVJ3M1ZPTDFm?=
 =?utf-8?B?MG94UHZuWlF5VS9ZN001Nzl4YUt3NFJqcUlVb1Q0czBCU29SaWJ0VDdlcWsv?=
 =?utf-8?B?ZUppay9IUnh5Z1gxaFgrYmZreHgzVmI1VXl5SEtqMEtqU2RFcmFydXZSMEt5?=
 =?utf-8?B?ZHZiOFNQell2aUlTWWZoWFBzWUI2VmNrLzFpZHEwS0hzbmxmelRnZzRkbEdQ?=
 =?utf-8?B?Y1lqaDdRQXRSNytxZ2Q4UlFUSHNXaTZocmhCeFNPdzk3UVF3bVl2ZVNxWDlp?=
 =?utf-8?B?bDdaMUErNmV5aFg3WXRjNjF5cXNOa09ITFAxRzBpWmRSb1hlaEZ3RHlUbER6?=
 =?utf-8?B?cUNqYWVjREU2b2JuRUxScTZRRlJjd05SYUtCYzZRQUQ4NFp4RklCa0tRMWFE?=
 =?utf-8?B?cHk2eUs2aE9ORHpNblVtL2tPcGFsV1lpNzY2MDZmYkcwZkNIcU1jbUZrd1Yz?=
 =?utf-8?B?L2YrY0tiNmRxY0xvZVpxTWw0UjdrWHVRNmh3S0U2Q0JVV1N4TlBXMEJuNnlQ?=
 =?utf-8?B?a1h6TnhTb2plSjVTN0w3VFB0V3hXNSs4VVpoSW1TMnNzeFpBWWVvQlJyUjU5?=
 =?utf-8?B?TzZTQWQ4dkVqTE9DaFFYT3dzelhnTnJhcGNUQTFjd2pXajNxQnBMOWtCU0Rh?=
 =?utf-8?B?RmxBVlRuY2dvNFdkOGhDajF5dERmTllYRDJVVHlJY2RxWEQwYTE1V2lvaVFZ?=
 =?utf-8?B?ckE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be7509e6-02c0-4714-65f7-08dbcb07c422
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2023 09:44:01.8251 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1ZWGGU7eT567iFVxT37aSIlfYBn8ex5fiBxVsqTaWJrTJJnWwPEmRcjHrlNKg0pT+vpncEfibO1bP2EcYlfCdvOhPhThn1qcwU1NDmuqhCU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11890
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
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR2VlcnQgVXl0dGVyaG9ldmVuLA0KDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+
IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjExIDMvNF0gZHJtOiByZW5lc2FzOiBBZGQgUlovRzJMIERV
IFN1cHBvcnQNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBNb24sIE9jdCAyLCAyMDIzIGF0IDI6
MjjigK9QTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IHdyb3RlOg0K
PiA+IFRoZSBMQ0QgY29udHJvbGxlciBpcyBjb21wb3NlZCBvZiBGcmFtZSBDb21wcmVzc2lvbiBQ
cm9jZXNzb3IgKEZDUFZEKSwNCj4gPiBWaWRlbyBTaWduYWwgUHJvY2Vzc29yIChWU1BEKSwgYW5k
IERpc3BsYXkgVW5pdCAoRFUpLg0KPiA+DQo+ID4gSXQgaGFzIERQSS9EU0kgaW50ZXJmYWNlcyBh
bmQgc3VwcG9ydHMgYSBtYXhpbXVtIHJlc29sdXRpb24gb2YgMTA4MHANCj4gPiBhbG9uZyB3aXRo
IDIgUlBGcyB0byBzdXBwb3J0IHRoZSBibGVuZGluZyBvZiB0d28gcGljdHVyZSBsYXllcnMgYW5k
DQo+ID4gcmFzdGVyIG9wZXJhdGlvbnMgKFJPUHMpLg0KPiA+DQo+ID4gVGhlIERVIG1vZHVsZSBp
cyBjb25uZWN0ZWQgdG8gVlNQRC4gQWRkIFJaL0cyTCBEVSBzdXBwb3J0IGZvciBSWi9HMkwNCj4g
PiBhbGlrZSBTb0NzLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFz
Lmp6QGJwLnJlbmVzYXMuY29tPg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4g
PiB2OS0+djEwOg0KPiANCj4gPiAgKiBBZGRlZCByemcybF9kdV93cml0ZSgpIHdyYXBwZXIgZnVu
Y3Rpb24uDQo+IA0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
cmVuZXNhcy9yei1kdS9yemcybF9kdV9jcnRjLmMNCj4gDQo+ID4gK3N0YXRpYyBpbmxpbmUgdm9p
ZCByemcybF9kdV93cml0ZShzdHJ1Y3QgcnpnMmxfZHVfZGV2aWNlICpyY2R1LCB1MzINCj4gPiAr
cmVnLCB1MzIgZGF0YSkgew0KPiA+ICsgICAgICAgd3JpdGVsKGRhdGEsIHJjZHUtPm1taW8gKyBy
ZWcpOyB9DQo+IA0KPiBXaGF0IGlzIHRoZSBhZGRlZCB2YWx1ZSBvZiB0aGlzIHdyYXBwZXI/DQoN
CkkgdGhpbmssIGZvciBkZWJ1Z2dpbmcgd2UgY2FuIGFkZCBzb21lIHByaW50cyBoZXJlIGFuZCBj
aGVjayByZWcgdmFsdWVzLiBPdGhlciB0aGFuIEkgZG9uJ3Qgc2VlDQphbnkgYmVuZWZpdCBoZXJl
LiBMYXVyZW50LyBKYWNvcG8gcGxlYXNlIGNvbmZpcm0uDQoNCj4gVGhlIG9yZGVyIG9mIHRoZSBy
ZWcvZGF0YSBwYXJhbWV0ZXJzIGlzIHRoZSBpbnZlcnNlIG9mIHRoZSBzdGFuZGFyZA0KPiB3cml0
ZWwoKSBvcGVyYXRpb24uLi4NCg0KT0suDQoNCj4gDQo+ID4gKyAgICAgICByemcybF9kdV93cml0
ZShyY2R1LCBEVV9ESVRSMCwgZGl0cjApOw0KPiANCj4gLi4uIGFuZCB1c2luZyBpdCBhY3R1YWxs
eSBuZWVkcyBvbmUgbW9yZSBrZXlzdHJva2UgdGhhbiBvcGVuLWNvZGluZyBpdDoNCj4gDQo+IC0g
ICAgICAgd3JpdGVsKGRpdHIwLCByY2R1LT5tbWlvICsgRFVfRElUUjApOw0KPiANCj4gU29ycnkg
Zm9yIG1pc3NpbmcgdGhpcyBiZWZvcmUuDQoNCkkgaGF2ZSBjaGFuZ2VkIHRoaXMgYmFzZWQgb24g
cmV2aWV3IGNvbW1lbnQgZnJvbSBMYXVyZW50IGFuZCBKYWNvcG8uIElmIHRoZSB3cmFwcGVyDQpp
cyBub3QgYWRkaW5nIHZhbHVlLCBJIGFtIGhhcHB5IHRvIHVzZSB3cml0ZWwgaW5zdGVhZC4NCg0K
UGxlYXNlIGNvbmZpcm0uDQoNCkNoZWVycywNCkJpanUNCg==
