Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16424783ACF
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 09:26:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3131510E011;
	Tue, 22 Aug 2023 07:26:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 381 seconds by postgrey-1.36 at gabe;
 Tue, 22 Aug 2023 07:26:02 UTC
Received: from de-smtp-delivery-113.mimecast.com
 (de-smtp-delivery-113.mimecast.com [194.104.111.113])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 197ED10E011
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 07:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=toradex-com; t=1692689160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DiASmAmkF0Wq+19yh3Bys9ZnwGl8PkAPie/BWGT78MQ=;
 b=Ag7qiUTFVijLcGoUdGdHOKlYqbyPG1xM1B+Mhdam+XL5QI2/HLcDX5jh17G42A3LP6pi3s
 LnYCvn+Rsz+PKHQlIG4eZipbcroA5GSseuODAcZyD2brN+DT44H1JqZHrFYPHcs5RwlqnJ
 f2Lr2yJAx3i/ZIDUFtuIEUkii/CtiL0=
Received: from CHE01-GV0-obe.outbound.protection.outlook.com
 (mail-gv0che01lp2040.outbound.protection.outlook.com [104.47.22.40]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-16-Q4dYho3OPzm7u4TyLvNnYw-1; Tue, 22 Aug 2023 09:19:38 +0200
X-MC-Unique: Q4dYho3OPzm7u4TyLvNnYw-1
Received: from ZR0P278MB0683.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:3b::9) by
 ZR0P278MB0042.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1a::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.24; Tue, 22 Aug 2023 07:19:36 +0000
Received: from ZR0P278MB0683.CHEP278.PROD.OUTLOOK.COM
 ([fe80::d5a7:e7ce:ac78:4984]) by ZR0P278MB0683.CHEP278.PROD.OUTLOOK.COM
 ([fe80::d5a7:e7ce:ac78:4984%6]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 07:19:36 +0000
From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "victor.liu@nxp.com"
 <victor.liu@nxp.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v14 0/6] drm/imx: Introduce i.MX8qm/qxp DPU DRM
Thread-Topic: [PATCH v14 0/6] drm/imx: Introduce i.MX8qm/qxp DPU DRM
Thread-Index: AQHZIZK8Ht9B++0fbUq/ehBVvVc+t6/3MfsAgAAc4YA=
Date: Tue, 22 Aug 2023 07:19:36 +0000
Message-ID: <bc421f5fc24135d543ae516bc07af0e70dd920a3.camel@toradex.com>
References: <20230106055056.2883302-1-victor.liu@nxp.com>
 <AM7PR04MB7046E7F22B817FC6FE8DA95A981FA@AM7PR04MB7046.eurprd04.prod.outlook.com>
In-Reply-To: <AM7PR04MB7046E7F22B817FC6FE8DA95A981FA@AM7PR04MB7046.eurprd04.prod.outlook.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZR0P278MB0683:EE_|ZR0P278MB0042:EE_
x-ms-office365-filtering-correlation-id: 5d3845c2-ee45-439f-5ab1-08dba2e023dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: aLVkEfGcBnmAIRfOzdkA4EITdJ+a293UKnaOK7FlMu6uKZ3+DKG9suTF02Pj7VdRro7fKmMSO/UagqZbMZmY/ftg/39pVweeI5XqvqVRFzLjtLTHtgEx30iKt0sAj+WaG+A++neGuJ11KI7M1bxO1vn4ic2snfq/7HiNahFNHF2v0X3llrg4DTulm4h48gE4d3sLBv61sjEbI8KZJi/r9hVVvDPiI196PDATbgbUsTMqHrjmL1EYf013cK7AiKMvXe3W9vhX4pK082xRIdpnNcj+HPv7yGtVF1qTSsV92tZOOo/CAT0VuTiwmep/33xBVVHu6ugicXEFS+hUINqcVI9FiW4GDIXwlsxTHAxZjeXqqQZz/iB/251o1qcJu/DDXDru4JwUy7i93gmLlZVz1MuLCU1ikr2pHHnDP9428Krjx7SHH2daNDC/qesgB7dWEnxuabBP4OFuTmq4PHNdT1wHBHUW/PElwasj3Y6Vuj9azbhaUXJDjUHFy+UNUh/i4CIH6sekowu5MXawS2qBAGFFFsuRsLW/UbGrKDv2ZeN93jx8jw50Gyq4F62kuuNROXp6eGRQQgaEJHQ/djWWyCLNIEpeVxizjMOfqL36O02E/GNrsFAXsuZgHGSmaoqj
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:ZR0P278MB0683.CHEP278.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(39840400004)(346002)(396003)(376002)(136003)(366004)(186009)(1800799009)(451199024)(4326008)(8676002)(8936002)(26005)(6512007)(2616005)(86362001)(38100700002)(122000001)(38070700005)(66446008)(64756008)(41300700001)(316002)(6506007)(6486002)(478600001)(53546011)(71200400001)(76116006)(36756003)(66946007)(66556008)(66476007)(110136005)(54906003)(44832011)(2906002)(4744005)(5660300002)(7416002);
 DIR:OUT; SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UVRkTE5TZTJINmMvdUQxQmNyNGZzbnY2VFlZb29VOTQ0VFFkbzJsUUhxRWd0?=
 =?utf-8?B?a2hGQVFXTUhVUkM5d0pQSGZZRVh5bTdITE1hbmU2bzdiSStlUURBMTN0ZjRq?=
 =?utf-8?B?QS9MQ256cTJHd0krWmJKTDg2Y1Y1dmQvM05OSEd6SzhURlIycFAvQWRUWmdu?=
 =?utf-8?B?TFN6Y3lxM1hDVGgwNmlXcTFyVTdXNmJRQVArdVlTZjBINUFuSHZtaUtkZ0JS?=
 =?utf-8?B?WmRuN2JFa0pPWVVWeTAzSFJsSVFEY1gyN0cyMldzV1lsUlRZSEplZ3cvR05L?=
 =?utf-8?B?VXQ4Y3d2OUV4SzgrYjgwSXpOSlEwMXVnb3V0SEQ3cUptd2IvdTVzYW1RQml3?=
 =?utf-8?B?cml0a01rTkJ4ckxnaTZudUEwVGdUWUVXVjR5bkVORDRPd1ZDOXhKZmJPT3Zw?=
 =?utf-8?B?U2QvVlBVTTRjNWNxWlFFbDltTVA3a2ptK08yOGMya083RGRkQ1dYUlNLampk?=
 =?utf-8?B?UG00QURGM1QrTE9UZ2w1S3hacmNVUHVQL1E2eDViVUJocHBCVUNJR1V5MGF2?=
 =?utf-8?B?WEFsUy84NytoRVRTYXNjbHlmRVdGZDBZRmJ1ZzhMNThwaUdpMGpJZDYvdU55?=
 =?utf-8?B?MVVyOVdiSXNHUjZraHlHSVZwYTlBMTBYbnR1WUsvVHlZVUZOQ2hIT1RXR3dX?=
 =?utf-8?B?R0gyUFpobU5iTnJ4MndaNlJqMXJnMXdiVVJpMzVqT1BpOFRiTkRwaGFwQ2Fu?=
 =?utf-8?B?andxczBYR3BKNFZwYjlXVzQyd3c2RDdRbmF0ZnRsV0V6NHRHVCs0YXdBWjZx?=
 =?utf-8?B?Q1kwUk50V2JQUU1mU1EveXcrNUY5S0RscDhJS2FmMlAzaWZGMHVPQkNLK3cy?=
 =?utf-8?B?dVBxaFM3MExXTW10SmNxQTBhdjFleU9uL01RUVlORFFoSVFNWkR3ZTArN3p0?=
 =?utf-8?B?TDlvTHZzRmVPQTh3VFlXbUZpSlh0c3o5QWl6VHh4N2hwWHZUd2p5eUZtZUpC?=
 =?utf-8?B?cTl3Ui9PY01pLzNCYVBBWDcrU21ZSXhnSGJHdXlrVmhIN1h1V2QvWkJLbGQ2?=
 =?utf-8?B?aVF2dnlFc0ZBM2YzSHdLbVFzR0pZM3lvZTlYRGxOWWZiZEdaN3ZHaUcrZmFB?=
 =?utf-8?B?bE9NNUF2aHMvODVnbUpDcWVBL25YT3JXSmVxb0lmZW1DNEpTQWtybzRoOCtW?=
 =?utf-8?B?cUN2cEtUcmVIMG1FOGM1VlEySkFRUUQ4bk1Cbmt2d0tZT1lXR0FoS1VyWjNW?=
 =?utf-8?B?ZjhPUWpLZ1RPbUVkdHFaVCtCdGYwQ3VtdzZIWmhxZ2VhRDlkdUxoTEJjS0ta?=
 =?utf-8?B?Zzd6K1dURWtvTVFqZHVUMGlJK0ZrcHpDdDdGcXpwQVJKdTRPNTNWYXNTdzhO?=
 =?utf-8?B?M2gzekt5dWkrQ1BoencvNmdwWmIzMW5Ea1ZqajZveHF3QXpiWG50eXJMbUZL?=
 =?utf-8?B?RytjN1RoNWxZenI4eU5XMUJNV1l4cWpGNkMycyszSXdZWGV4anZwcFBxSjhN?=
 =?utf-8?B?SXR4YkVoMmNkWHY4d2RhNmtMKzJGbXQ5eWRpZ3BJajJ4YmcrTSsvVXF5bURk?=
 =?utf-8?B?Z1Q2di9ETjlrMGZ2cEw0WVBiYkxpbmpYTEYrYUR0VUo2RllWaW1NMFNIR2Nj?=
 =?utf-8?B?ZkVldmF0VnVlQ3RGZlJrMThZZzFybTlZRmh5cFhaRk5XQzBTbGZhTUZhNVBM?=
 =?utf-8?B?bVVuZGwrSHRCZ1NlVmYxdVBUVnR0TGwzODcwREFoMVBKR3d6S2JPaHp1M3lP?=
 =?utf-8?B?cGlkdmVheFNibmxiMWlpK05kZHoxdHd5YnZ5N1pTTDRhM204SWdqNkRhOGFC?=
 =?utf-8?B?RVQ2bDlCR2phVWYrM2dYUmJ2aUR2eWloZ2tEc3JpUlVyRWNyZU8xL0tOVzVI?=
 =?utf-8?B?VGNSVU53N3FKUTBCUnJkeVhualZpdnUzenRiKzZvUTVzbEFxV0QrQmFaTkZV?=
 =?utf-8?B?Q1hMSHBRK0VjVDZsZ2pvcEFUYTNmVFBHanJkN1cySFo5dy8yZlhUUnZ0KzNH?=
 =?utf-8?B?bmhIbGEzR0l3aGNqL2FFK0ZnSnFKSzNFMy96cGpCbmVid1ErNzF6V2ZuZDJn?=
 =?utf-8?B?Z0cwRXhOaEJUZWxhU2dGcXV3ZXRIb3NoMnEybnJCemNBc3ZsQitZTnIwS1Rk?=
 =?utf-8?B?T1l6VUE3RTkyRFdSNmtIM3JSVW5qci9SdkNNUHRDMTFKZkFBZU1RYWZJUW1F?=
 =?utf-8?B?SVRWZFdHRDRlYzlaUW1PNXp2NW4wdUxIVlVTUHRGZXJyWEdvSXUxaTVPMWlR?=
 =?utf-8?B?anc9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZR0P278MB0683.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d3845c2-ee45-439f-5ab1-08dba2e023dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2023 07:19:36.0735 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BR1PIQfAS9JSK+1QOEj8wcidJ2yPtIzodyvmcWl+OZ/H9WFxJxLPh87Fk9ttm6nfXVLQTFV+z1zVpT0N63tUEGkKqDraAZV1B9O+RbPlTR4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB0042
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: toradex.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-ID: <CE703F34BE876643975CDDAEAB5C9532@CHEP278.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
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
Cc: "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-imx@nxp.com" <linux-imx@nxp.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "laurentiu.palcu@oss.nxp.com" <laurentiu.palcu@oss.nxp.com>,
 "guido.gunther@puri.sm" <guido.gunther@puri.sm>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGl1IFlpbmcNCg0KT24gVHVlLCAyMDIzLTA4LTIyIGF0IDA1OjM2ICswMDAwLCBZaW5nIExp
dSB3cm90ZToNCj4gSGksDQo+IA0KPiA+IE9uIEZyaWRheSwgSmFudWFyeSA2LCAyMDIzIDE6NTAg
UE0gWWluZyBMaXUgd3JvdGU6DQo+ID4gDQo+ID4gSGksDQo+ID4gDQo+ID4gDQo+ID4gVGhpcyBp
cyB0aGUgdjE0IHNlcmllcyB0byBpbnRyb2R1Y2UgaS5NWDhxbS9xeHAgRGlzcGxheSBQcm9jZXNz
aW5nIFVuaXQoRFBVKQ0KPiA+IERSTSBzdXBwb3J0Lg0KDQpbc25pcF0NCg0KPiBUaGlzIHBhdGNo
IHNlcmllcyBoYXMgYmVlbiBzdWJtaXR0ZWQgZm9yIGEgcXVpdGUgbG9uZyBwZXJpb2Qgb2YgdGlt
ZS4NCj4gDQo+IEFueXRoaW5nIEkgY2FuIGRvIHRvIGhhdmUgaXQgbGFuZGVkID8NCg0KV2VsbCwg
bWF5IGl0IGJlIHRlc3RlZD8gQXJlIGFsbCB0aGUgbWlzc2luZyBwaWVjZXMgdGhlcmUgbm93Pw0K
DQpUaGFua3MhDQoNCj4gUmVnYXJkcywNCj4gTGl1IFlpbmcNCg0KQ2hlZXJzDQoNCk1hcmNlbA0K

