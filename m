Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E79A786CA1
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 12:14:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D0D510E506;
	Thu, 24 Aug 2023 10:14:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::700])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29E9710E4B9
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 10:14:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iIjX71EDWkk1Y4nQCBJNbmJoJB9P9cSyeU6/9CluQpDWcpYzgKsYZKGK1wf7dR2gTxEAB3Gb9pIFgYLZk2i7HMWchRW8PoWbBH10gnclhhGGQc7yiAPJp/NJ9xaiqws0ilM1UQjeCLuZ7KwszDcLHT9HKJGGwsnassBZ02MAeOpE8tuRRDsg8TvGfufa8Y57P3SReymnVjCzDhJ167jDKddZQJsTETn3MpHTyqby/ZTlwI/T7zICsiMngp3vEPmZUnK4snCls2eD27l5LgP+D4vLVAsAXiv21+X9tIYb6tER684euS6AkvjjGk/MPzkyGy1qp2s8rc1AeyuywurgFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YeN1NwwwxoR29H5j6FFJj1RjlI1xDwvhRyquo8YdueA=;
 b=WD9Bubx2VDzher0lwZ+59BI9CFaeHQ5zRzPPMllqHHGf5bTbEbXqnL7UqO07QsGSdQONJZW/MZTwdFhpdBAw8xppjvhJTKqTW/Cr6ly2Pvre6fFr5OHC4U8ZGa4PpK1BdfGZD/PZUxFcuhr4Cwktougkrf9m1oZ+VgpvY0oPXG64sWSzP09nPnI6p+x4/kSdA9Ec17IqLN0FRsPTLwsgWO1f6wnXDN/LZCT/A27KZBzNjJqn0UiAB6pfsAIk9jU+Z0XSyHWw5xSP8V5s8kQjQwGdMV0u8pkLO8dul17K+0TAL/MPGGXLY3+NxXQHqBAHqPaUqxW314nLovlvHSZeLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YeN1NwwwxoR29H5j6FFJj1RjlI1xDwvhRyquo8YdueA=;
 b=N0MMP4gl1lBmfFeZDAQAcUfTlzpv/rMQpUCSXz8Ji4RE+8TyXw4fKjFshT3faBFdtnT5FLc8KTcc30JYZAT0gt3nKwGz1KNbJFfy8a3CXc/n2GqIdDB44r+w9mXAv0X3zIOAgByoV0wlC8LHhiMtVNQLj4npyxhEmsBNU48NkuY=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB10795.jpnprd01.prod.outlook.com (2603:1096:400:297::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 24 Aug
 2023 10:14:27 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706%4]) with mapi id 15.20.6699.027; Thu, 24 Aug 2023
 10:14:26 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Doug Anderson
 <dianders@chromium.org>
Subject: RE: [PATCH] drm/bridge/analogix/anx78xx: Extend match data support
 for ID table
Thread-Topic: [PATCH] drm/bridge/analogix/anx78xx: Extend match data support
 for ID table
Thread-Index: AQHZzcNjEmgmmPkABUWy2CTKLw1ZbK/4AAKAgAACe0CAACZ1AIAABK0AgAAWxwCAAQNfgIAAA6kQ
Date: Thu, 24 Aug 2023 10:14:26 +0000
Message-ID: <OS0PR01MB5922CFCC41295316D3F5739A861DA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230813085137.74608-1-biju.das.jz@bp.renesas.com>
 <CAD=FV=W6aoaUuMx5OvG2xMX+fBG6B-c5Fmvmit4f2CTZq=x1vQ@mail.gmail.com>
 <OS0PR01MB5922E0300F53BED1AFFD916E861CA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAHp75VcjA-99ckLWNczNuP5f2FGx67o1=O8MFVThBTVzPzJBdA@mail.gmail.com>
 <CAHp75VeJ-JjcrfLZd2dyisBmq5r66j=Sq5ubSLpK=kFrodzb-g@mail.gmail.com>
 <CAD=FV=VbsfAc4Pb3LY3w3-krqfkmmaZLiBxcxjgea+4S0HU1Vw@mail.gmail.com>
 <CAHp75Vf-KLMGL-Exo5-+-AC51KhW+YOJSr7GpqHUG1WzZ0nkvQ@mail.gmail.com>
In-Reply-To: <CAHp75Vf-KLMGL-Exo5-+-AC51KhW+YOJSr7GpqHUG1WzZ0nkvQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB10795:EE_
x-ms-office365-filtering-correlation-id: 60e633c4-8eee-42f9-2f64-08dba48ae5b4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +6nGWVqUJSDD+4uYOeA1eBQO9CK75eHLPHRn0J2xWfC/uZ8TLFr6z4KvHHBDBpB4JJw55YsPCFAGz4WkZISoRWdWmjckISE1db39E9eOoRe0R/bhR+NCKxM9ScmPq0Dci+H5VPn4KDt9U38qdDh/jQTCWjorJMxZVHuQ4wG0xM3/xBQIEKnyjyO8hRcoe5UMCF6IRNWrhF63ZL27U+yYdJwPRQX9mrQ0l/TkAI7poPXUryXFIWUbb0OWjvLVvtRoce3TraAim/UHR631iWqdIu+JkHIatmNy7q11JY3TuPk6NUSjqfn18pEFQ4qrWGvWAEX2TlrP73ol2JKXGUppXWXK1Uq/6CeNLYNj+LMbQB/HLtJyZ04nMsPvZsq3Lqg3WQy0YBMUz3Mo4Ksw04r4cWytYcNgUpl629pfI1JyfXuUxJAZkQzgDoMI3Oc1lA303s22nxCSC4v6XuwB6AvLu7TJnqVAMVWOW6DJM2awiWR4lvlUocQrzRtZWY4aJN0yw4SiGA70JEruJKqcQlnxAS6a2aTVU4WmwrkYanD/4WzrlKsaJCzk3C020UdJOKYDf+YgsBwKqxH0ijvsI7rEeBGi/unuNRohOywM1+mIVa1K2lTqlULMKWcAWeDaIkxB
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(366004)(376002)(136003)(39860400002)(186009)(451199024)(1800799009)(6506007)(71200400001)(7696005)(53546011)(478600001)(26005)(2906002)(7416002)(41300700001)(316002)(54906003)(64756008)(66446008)(66476007)(66946007)(110136005)(66556008)(52536014)(76116006)(5660300002)(8936002)(8676002)(4326008)(33656002)(9686003)(55016003)(38070700005)(38100700002)(86362001)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eXN3TFJsNFVabGNoOTNlemt0VTRwR3RUNUJISzRoZHR4cW9kSWNqUmw4VWNw?=
 =?utf-8?B?ajVvSXJZTjBNWE1WRTBlOVJ0NlNmREtPTlZlS1ZmZVQ0b1FodlA1dTV5MEFP?=
 =?utf-8?B?SHcxRjN5c3FHUXJDZUVLRFplN2hsSmJWM0RxbEdXdE85MU9sL1gwQ2VNcXpW?=
 =?utf-8?B?aHlxenF0citPL0FWNEZDTGo5SWdCRGordThOalYzSThwVXVySUd2aDhLY1l2?=
 =?utf-8?B?d2pSd0pRRmxRREFhS0piVVQ1TVBZdUZjekxsNWU5UGFES2lzdmxBWVRBVktJ?=
 =?utf-8?B?Y1FGak5JMGUyM3Vxd1pUTmxoczRtblRUeGZMbTZlaVhhajNkOFRnelFCRWN3?=
 =?utf-8?B?cklLMjFUWUEweGZtWmM2Wi9UeU9uYzZPVFc2dVdmZkxPeE1OM1UxUHcrQ3ZW?=
 =?utf-8?B?Y1h3cGYyaTB1YmFJMUFEdGV0YW5GUWZNeUkvSHdnVXJnQlFwUzJNQ3VDUElC?=
 =?utf-8?B?Yk9XbmNJVHp1SHhhTVVnNFo5OE1MMnF4RHJoR0dSbis3UEtPbVFxSzZVNWcx?=
 =?utf-8?B?UTZDRUQydE5EYUcySmtjemU2MU5DRkMzTHhvcFVESUJHbEtNd0xhb0Vqb2pw?=
 =?utf-8?B?TE1CZnBGRjZPZVl0VG9JU3pNcGprUngzcGVJY1gvMVJnZHdKY1VyUUhtUW5r?=
 =?utf-8?B?UVZtTG1kZ3VPbEQwNWFpaFZ0b1hvcDlURTRhdWwvU0M0ZWd1am85Z0s1MVNj?=
 =?utf-8?B?MENFOUhJVmduQmFicGJMdUQzUHlXUDZNTFNwRW1aVFhjc0trY3NlRzNQaGJB?=
 =?utf-8?B?RmxLRHpiTFVBR1FKSmlFRUFrbDgwRGxqMVZKdmRneUNBNzk4ZkdWeHFxdWNX?=
 =?utf-8?B?MnJhYkdzT3A3cDRROWRBaUk0RUQ4akhub29WQmZxazVGaHBURW5mNGFYaXpa?=
 =?utf-8?B?QUhRMWdnVTdpNmljVDFqaTNwdys1Z3MvRkZDSzRnUGNmcFVVS3ExY1I5YUhB?=
 =?utf-8?B?V2JBYUZTazJBbFlUQXB3T2tTZFVqTnkxa3RuaFUzTkVFQWhFelFDYTRhREpB?=
 =?utf-8?B?WGs1aXdVK3p3YUJiSGdSK1dFMzhxQnA2WFNiMnQ1bXBiUXpkRVJqclRCS1Ev?=
 =?utf-8?B?aG1CWE1KWkRFWTdueDByVWh0V2E2enp2d3RhejFwMjdIZnh5TGxEN0Q5ZytT?=
 =?utf-8?B?UXhxMjludnNJbWY2QnRuc0dBTVlDc1c1T3NKUmkwdEdZVUZxNkI1WUZTa3kx?=
 =?utf-8?B?cDdMa2RzSzJlUC8veVI0b2tDcS84MDJSc2dvV2F6SXBvMFNGU1h5L21BMjlU?=
 =?utf-8?B?VWNrZDJWcG9uQVVoVzF6NWhTZitBSmM3anY1Mk9aeXVMdVh4YVhiSWpEOTRT?=
 =?utf-8?B?N0czSk5OWUhxWU9vZThzc01GcUhYUisxemZkWlZjSlk2Ty9HMVc2SzExS3Ns?=
 =?utf-8?B?QnQ4R3lUN2hLa3ozTlIwU1FMK29zNS9xNldFeVRlam5QbHBoa3BRWTJVbVo1?=
 =?utf-8?B?ZFFpbVFOSHZlcHNsSm9Dc1RRRzBPV25JblVCQi9RK1lBMmZuV1RGVUJ1TEZm?=
 =?utf-8?B?RVFqREIrUlkzMEZDY0xpZEI2dHZCaTllejdXR3NicUlkQ0JYOHRMWVRzZy94?=
 =?utf-8?B?cUs0U05qVG1KMGdGMjRrbkE2WUVvYWwrRklCYldUUG1PN0E4eGhHOFp3ZmVr?=
 =?utf-8?B?MXpYdEE4a0JwU3V6UjMydW41aEw5b0RzSEtyai9TT0l6M0JXQ29JeEhUTkhQ?=
 =?utf-8?B?ZUh2dkluNE4vQlFCM1BkRDcxSzJuWHlnWGRTQzFZSDl3WjBBTDVET3hOMTNu?=
 =?utf-8?B?Q2tMVHJKWW5zTUxZb3hxcmFhZFMxenBuWk12KytqK0xBK0JnRU8xNUcyRTZ6?=
 =?utf-8?B?OHYvTmlRLy9hYW9ucVRRWktlOXY5QmVqWURVM01LRDAvcDgrUzBoc2ZVYWt2?=
 =?utf-8?B?TDM4NGNhZUc0bjdwbENCbkZmUDZLM3lEM3ptMTFhUmxpVUlEY1diSHF6U3R2?=
 =?utf-8?B?ZEpPSkhvanB5Qm1PM0k3WmdiV3l0V3V1UDFPcUoxckovVDNBcEtDRmRKWXBZ?=
 =?utf-8?B?U2dma2lhZDlpK0lnVitaRzRrUGlQckY1cVFMK21xcklsUFMwVW0ycnFCV0Vs?=
 =?utf-8?B?ZjRSdFZZTDdsSzVhZDZuUnNicDVvaHdXV3UwSmI1Z2kyNzZHNU9ld3pGanRh?=
 =?utf-8?B?N3daTTRVb0pHUWRMZGQwRUtrZmtpaENNK0tWdjZTcmNCQitsT1pneFZ2Qi9T?=
 =?utf-8?B?Snc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60e633c4-8eee-42f9-2f64-08dba48ae5b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2023 10:14:26.9126 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7xi2GFh5xJKxwdcffCCYRvR4kMZ6A+EMmuo49IraSFvO3qlCCxx/elCDN2ae3ZYoaN1arTD735WZ9h5cdFTGHhbHmeaYj193QKy3N0E/pkQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10795
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
Cc: =?utf-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Zhu Wang <wangzhu9@huawei.com>,
 Robert Foss <rfoss@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQW5keSBTaGV2Y2hlbmtvLA0KDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGRybS9icmlkZ2Uv
YW5hbG9naXgvYW54Nzh4eDogRXh0ZW5kIG1hdGNoIGRhdGEgc3VwcG9ydA0KPiBmb3IgSUQgdGFi
bGUNCj4gDQo+IE9uIFdlZCwgQXVnIDIzLCAyMDIzIGF0IDk6MznigK9QTSBEb3VnIEFuZGVyc29u
IDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+DQo+IHdyb3RlOg0KPiA+IE9uIFdlZCwgQXVnIDIzLCAy
MDIzIGF0IDEwOjEw4oCvQU0gQW5keSBTaGV2Y2hlbmtvDQo+ID4gPGFuZHkuc2hldmNoZW5rb0Bn
bWFpbC5jb20+IHdyb3RlOg0KPiA+ID4NCj4gPiA+ID4gTm8uIFBsZWFzZSwgZG8gbm90IHJlbW92
ZSB0aGUgSTJDIElEIHRhYmxlLiBJdCBoYWQgYWxyZWFkeSBiZWVuDQo+ID4gPiA+IGRpc2N1c3Nl
ZCBhIGZldyB5ZWFycyBhZ28uDQo+ID4gPiA+DQo+ID4gPiA+ID4gWWVzLCBpdCBtYWtlIHNlbnNl
LCBhcyBpdCBzYXZlcyBzb21lIG1lbW9yeQ0KPiA+ID4NCj4gPiA+IE9rYXksIHJlYWRpbmcgY29k
ZSBhIGJpdCwgaXQgc2VlbXMgdGhhdCBpdCB3b24ndCB3b3JrIHdpdGggcHVyZWx5DQo+ID4gPiBp
MmMgSUQgbWF0Y2hpbmcuDQo+ID4NCj4gPiBPSywgc28geW91IGFyZSBpbiBhZ3JlZW1lbnQgdGhh
dCBpdCB3b3VsZCBiZSBPSyB0byBkcm9wIHRoZSBJMkMgSUQgdGFibGU/DQo+IA0KPiBZZXMuDQo+
IA0KPiA+ID4gU28gdGhlIHF1ZXN0aW9uIGhlcmUgaXMgIkRvIHdlIHdhbnQgdG8gYWxsb3cgZW51
bWVyYXRpb24gdmlhIHN5c2ZzIG9yDQo+IG5vdD8iDQo+ID4NCj4gPiBJcyB0aGVyZSBzb21lIHBy
ZXNzaW5nIG5lZWQgZm9yIGl0PyBJZiBub3QsIEkgZ3Vlc3MgSSdkIHRlbmQgdG8gd2FpdA0KPiA+
IHVudGlsIHNvbWVvbmUgbmVlZHMgdGhpcyBzdXBwb3J0IGJlZm9yZSBhZGRpbmcgaXQuDQo+IA0K
PiBEZXBlbmRzLiBJcyB0aGlzIGRldmljZSBhbnlob3cgdXNlZnVsIElSTCBhcyBzdGFuZGFsb25l
IGlmIGluc3RhbnRpYXRlZCB2aWENCj4gc3lzZnM/IEkgdGhpbmsgaXQgbWF5IGJlIG5vdCwgc28g
aXQncyB1bmxpa2VseSB3ZSB3YW50IHRvIGhhdmUgc3lzZnMgb3B0aW9uDQo+IGZvciBpdC4NCg0K
U3lzZnMgb3B0aW9uIHdpbGwgbWF0Y2ggYWdhaW5zdCBJRCB0YWJsZSBvciBPRiB0YWJsZT8NCg0K
SUQgdGFibGUsIG1lYW5zIGl0IHdpbGwgY3Jhc2guIE9GIHRhYmxlIG1lYW5zIGl0IHdvcmtzIG9r
DQphcyBpdCBoYXMgcHJvcGVyIG1hdGNoaW5nIHN1cHBvcnQuDQoNCkNoZWVycywNCkJpanUNCg==
