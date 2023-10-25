Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1167D627F
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 09:26:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DF1C10E566;
	Wed, 25 Oct 2023 07:26:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2110.outbound.protection.outlook.com [40.107.241.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53C4510E566
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 07:26:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KgFv5oqze/a78JsJNe2c2PDpaAEDxqfndk0auRKxYitdjxAx/e7EapTDd81AuAN8mfVZv+E2TNTTjTvZgeTKxf2R3AokVuVF/tVEBPuvKom8EY+iuD+ISNAaeFX2uUrDQJaA7C9TniaErnMlhyukpL/6LCXph91CRwc+Bhy0KbXxmV1TCNonEuFpooNn95yeSCCaHSVML35sgAhUDtCUk5DaIHSrSVv3KgwHcglxaUTSwO45/yM57ztVOfwTta+T4Xo3DmsaZc/4IA7WRf/iKx5nOCnlAja3e7xVEYcT2d9NtaOtrK8OrAG3E2IcxCd8XW9PjVkP2CY/Sn6s76Gk5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0HJ1dflWJ8YVmPHhNsQznCKoSRmEmrV3iP/BG9U0zB4=;
 b=UnubzSxlvq6gUwICo77Ho/9c/WTg1jf2htzZUBz6O4aE9bamGD1GZ9GaC3vAAszawjjMwwSqtEQ6rrhpWktXVxtu2bEF/U46TE0nwxO6pZSKcAXrhyYHu+wvr4N+HgUGd0byctB6I7R+WZm7fAJ33QqXIh8ysUIaqcqNEvULf0Br/KESqG4u3Du41h2nX7b7bJ7/JFqrnFYc6uprrAJd3KDuo+Eret4hNq7wojC5tq70M9WkTN6tLrIDh9yW4xRoad8bGWXkRiu+AmBdhJuttWgtoACWXmWGqnEto9jH/vBft10v0dOpxY4ViB1q2OQkT8lpXUXH7qofIR2NdVwGjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bang-olufsen.dk; dmarc=pass action=none
 header.from=bang-olufsen.dk; dkim=pass header.d=bang-olufsen.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bang-olufsen.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0HJ1dflWJ8YVmPHhNsQznCKoSRmEmrV3iP/BG9U0zB4=;
 b=WsZQqQ/YmngmPCarMZhu7nq7zZDOpQ+2Mn2f2hp2nwe0L9ClSYYAQChkRc1EYW0oRTIOAz9K4KB3XQmPATj4TFxNJy212gt7DNLROA8+Ao5jbi6fuBwJZL6PdhYR9fAYPveitG2lFHAhZJzZHDAFR04YnlQlZeOBcGq95/9ZPMU=
Received: from AM6PR03MB3943.eurprd03.prod.outlook.com (2603:10a6:20b:26::24)
 by VI0PR03MB10281.eurprd03.prod.outlook.com (2603:10a6:800:20e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Wed, 25 Oct
 2023 07:26:44 +0000
Received: from AM6PR03MB3943.eurprd03.prod.outlook.com
 ([fe80::7cb2:3f7a:4f93:ec47]) by AM6PR03MB3943.eurprd03.prod.outlook.com
 ([fe80::7cb2:3f7a:4f93:ec47%6]) with mapi id 15.20.6907.032; Wed, 25 Oct 2023
 07:26:44 +0000
From: =?utf-8?B?QWx2aW4gxaBpcHJhZ2E=?= <ALSI@bang-olufsen.dk>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] drm: bridge: adv7511: get edid in hpd_work to update CEC
 phys address
Thread-Topic: [PATCH] drm: bridge: adv7511: get edid in hpd_work to update CEC
 phys address
Thread-Index: AQHZ/taq5D2UjK1S+kWjz8DqNvYQ77BXTnMAgALdFoA=
Date: Wed, 25 Oct 2023 07:26:43 +0000
Message-ID: <dbmznxaf2vb44g66a45kzdzpsyyrmqh5opnh4q6it4a2ncikkt@p5ojks5dz6lc>
References: <20231014-adv7511-cec-edid-v1-1-a58ceae0b57e@bang-olufsen.dk>
 <87pm15bm4f.fsf@intel.com>
In-Reply-To: <87pm15bm4f.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bang-olufsen.dk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR03MB3943:EE_|VI0PR03MB10281:EE_
x-ms-office365-filtering-correlation-id: 9eff823a-fba2-437a-26b2-08dbd52bbd4e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sF7WOg7HDtcxNbnHgQ/xvVooBwkuj+sNAgXNaJWcKaToxp8GIpc3F8jeiwdOGz/BXCjaF3k/64U9eFj4KE0NNUdIpECEa/NCwLWt9lOiev0S69YMYs8PxkHWVv23B2001zzELq/ebJdt6zvxubW3FhAT1sCdSevkxHNsBXX61Q9C0RTd6vWcvLQvii6dt0lWamdLxxviecCkNkqckrnRaWZME4/HBlxs2QdtEvLCDg6QIcKi12p92MHjgzEEO4mA313iJ58ah8lZuhZOAuzHNYbedUsgmRHXhRD+LfWZtdD5wkEx9bgiNJBdCra886oV42L219hSXnOc91LMFyMFPWbS3FwoFB92FgLwiSlwXnXcRK6iouSF9yVix4QvUEKkpA0OKVGaharlvhCKWMzzOgNASJYT9zuoXLRWfeGjwADLt8Xn+7cH1BFnYKLdDwKJgP4dbnKoPR0sUNagUtC7n80CxhqBZA09tjkAuUrA9apKx7YZHp8ut7ls4tK31DzE5x9SggZFdHfLHPl4kp0MwhdT0hOTj1mNKbzt3APoRhgSHfsUaIlFbZhxhwmd76rYarCzhS/z8vgRpFCTeojcOtCQz/eRe5mZx+BYQHJqLlDgz7oThxT3dxXhfETvb+GM
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR03MB3943.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(346002)(376002)(136003)(39850400004)(366004)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(26005)(38070700009)(33716001)(41300700001)(38100700002)(2906002)(6506007)(4744005)(85182001)(7416002)(5660300002)(4326008)(85202003)(86362001)(8676002)(8936002)(478600001)(6916009)(66556008)(71200400001)(91956017)(122000001)(64756008)(316002)(66446008)(76116006)(66946007)(66476007)(54906003)(83380400001)(9686003)(66574015)(6512007)(6486002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dFNWcnpiN20rdXFNQzNDRnBGdEF5OHd3cVppdFZ6eWE1RnhXdms5UnZhR0VL?=
 =?utf-8?B?VjhWcWNZTTFJbHV5K1dhc2tqOS9iZTJCN1FGNU9uSmw1Y2p4MWdITjdWcXJG?=
 =?utf-8?B?MDRrbHhMaVVjWm9aWFRFbzBGNHArQ0Y3S3MrSFJrcmxZTmFlMGdpbkxnRkYx?=
 =?utf-8?B?TVNNRkY4cFVkdTVxU0JsUmRyVWpmSWRiMms4cCsvSS9tNGU2Ti9EZEFKdlNI?=
 =?utf-8?B?WHhLcFlkVG9QZEtqMHhOalFhcGt0cVVTeTJGRG02NWNZUDdUOGQ1NnBSNWZs?=
 =?utf-8?B?RmNzTnQ3c0VkOExLYTRyMzZqb0ZFaUFXUXpzeTNDakRHYmV4L093WWQzL2c1?=
 =?utf-8?B?UTNIRGQ4T0FMVHErMUFpUDhaRGtobml1aVNvSkVvOGlHQ2M0NzVmQkhIK3ZF?=
 =?utf-8?B?VVRoaWg0bzVDK1NYWlMvZk1WaGVvWGd1OHhNZitnRkNqQmRqV1J6enlVdEdG?=
 =?utf-8?B?V0VPVEhIYXJtc01OcVI2N1E3RzVQbWVoRUlhYXNCMWFBWWwweXFobGlSQ3JC?=
 =?utf-8?B?dGhXeCtPZnBpZXY0QXFXcDQwRlpNMmYvSSt4UCttSEYrNnloMDREZFhoOWow?=
 =?utf-8?B?VUFTYWNYNVBSaFE4aE1xTkZ0ejZmWUMzMmZFOVRzMDV2QUZUcHJQdk1jR1U1?=
 =?utf-8?B?RGM5SXo0RDMzZC9sbUFrNjBtK1VJZXcrMHZSeTh5czcrSHdEME5uaExSRi9q?=
 =?utf-8?B?Vk1DR2ZiWUgyNFAvWWhoTnNIeFZXTUFMOTBEWFRiK3dDM3QxRSs5S1dNNFF3?=
 =?utf-8?B?a2RxMCtEM25qNEdCSnlFcXdEVk96a0dwbytvRGtNWTlqM2RrdG9ZSmhxRzFi?=
 =?utf-8?B?cldGTEhiWFkxS0FsTHFDVmNFWWNuU1ltV29ET2FOaldXNklPYVdjMVRJOVJi?=
 =?utf-8?B?WGRPWVFuYTZ5U2grRDY1d1FoQUdIUmdCdEU4OVFpR2N5VUduZE8rRk55T2tM?=
 =?utf-8?B?TTg1RmdkZkVsWHV6dE9pSW1Ddm1uWFV0Y0xOcDFSTS9TTWMwZ2orTWhJOXRG?=
 =?utf-8?B?ZktMcHRvKzZ4U3J4L2wyS25BVVNTeUc2dzBwSTN4R20wOVliSk1ManFGK2RH?=
 =?utf-8?B?SWJqeWplSm9COXhuN05udm9VdXhoUHNCczh6ZHFHQk5SMGF3Wk5uNng0VVVa?=
 =?utf-8?B?aFhGbDJscWxqMEVNdmJrOVdFalk5VWF5M3FxSzEzc0UzT1hlQng1SUZwd1JG?=
 =?utf-8?B?S3pGcUJIeDd0SmFHVlk0SldnTDZ0UzZvbHZPVG9INUtyMzZ2b2JpUm9HTUR2?=
 =?utf-8?B?OEE1RFI4Zmp0TU9FT1VOeWgzMG16aTZOQWxoUGFWNTlIb3dkb1ZSMUVXalRj?=
 =?utf-8?B?N1BwY0ZPN2p6MnNlSzdqUDJlVjdsUnVoYkg4S1d0VjNucFk2RzU1dzRvdmpr?=
 =?utf-8?B?dm5aODkxMndBZW5ES2JKL011QllmRFFRcFF2U2RESzdTVUpzOTl5L2pjZGl4?=
 =?utf-8?B?cTh3NDhncTdmYVA4dHdvMTFaQzdBbFMyam5QMnAvMFBlVDhoVkFic1JQVHNh?=
 =?utf-8?B?OUQrdkRPTUE4amkralVkTk9vSHBYNXR6N0ZqNW5rWkdYOTNKcXQ5L0xHTmJh?=
 =?utf-8?B?Q3QyUDZBU1dWSGtFejNOeSt1ZFZISkR2ZkRkdHpzWHJFVWE0NVljZzVaWFNa?=
 =?utf-8?B?NktjczlmZDdOT1ZBNU1jL2hnSXE0OFllVTV0K3lwREhMYTFESGUvdlMxcWxr?=
 =?utf-8?B?c3BzUVBNTm5ZbU5xMnUwUENaUEZMSzVhcU9KeTgrdWQ0NXQrSzMyc2k5MWRp?=
 =?utf-8?B?WGd4OXFUU1hTOXNzTXk5SVpPaTF4b29BQXdXRExjanR0OFBTYlRrNHFSL1E4?=
 =?utf-8?B?czlET29pOStpUGw4blZWNTZ3NWtHUmtDKzR5RjRoL3RLT2M1N2dkckQ3RUoy?=
 =?utf-8?B?ajRJUVJFSEdCdlcwSjVGZE1TWEd4MElJdE5RSkNBbUFETGVmeVBuVHByK093?=
 =?utf-8?B?RjFFb1A4clJaWnZnNlIrMEorSWZzaWRlVzZDdW0rSlIwdlhla25oZHdySFVL?=
 =?utf-8?B?YUlya2lKT0hUL3kxdk1yWlRKcHpBVVVIcm8xUVZxSnk4cklkTHVDcVJqeCtx?=
 =?utf-8?B?TUNGdStOQmphdXhmdUZqNEFjNUFMdFJjaXdxaCtTdG9YR0RRNVpJY200Um0z?=
 =?utf-8?B?bmFwMS9WYlBMT2VjQ0UzNk16T1NaNVhUYlVwZkRQK2hJM1VGdTFYNFl2WG03?=
 =?utf-8?B?anc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <08C9B73C35F94A4B80135672F91563AD@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bang-olufsen.dk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR03MB3943.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eff823a-fba2-437a-26b2-08dbd52bbd4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2023 07:26:43.9244 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 210d08b8-83f7-470a-bc96-381193ca14a1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LKPnRJeIsrhYzz/UDn9ayaCbZXax5B3InSArlkt5aBfg7BTxhDSuAZnoFjqVOGH9soqwdX/XQbolGGr0N7pAhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB10281
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 =?utf-8?B?QWx2aW4gxaBpcHJhZ2E=?= <alvin@pqrs.dk>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFuaSwNCg0KT24gTW9uLCBPY3QgMjMsIDIwMjMgYXQgMDI6NDI6NTZQTSArMDMwMCwgSmFu
aSBOaWt1bGEgd3JvdGU6DQo+IE9uIFNhdCwgMTQgT2N0IDIwMjMsIEFsdmluIMWgaXByYWdhIDxh
bHZpbkBwcXJzLmRrPiB3cm90ZToNCj4gPiBAQCAtNDU3LDYgKzQ2MCw5IEBAIHN0YXRpYyB2b2lk
IGFkdjc1MTFfaHBkX3dvcmsoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQ0KPiA+ICAJCWlmIChh
ZHY3NTExLT5jb25uZWN0b3IuZGV2KSB7DQo+ID4gIAkJCWlmIChzdGF0dXMgPT0gY29ubmVjdG9y
X3N0YXR1c19kaXNjb25uZWN0ZWQpDQo+ID4gIAkJCQljZWNfcGh5c19hZGRyX2ludmFsaWRhdGUo
YWR2NzUxMS0+Y2VjX2FkYXApOw0KPiA+ICsJCQllbHNlDQo+ID4gKwkJCQlhZHY3NTExX2dldF9l
ZGlkKGFkdjc1MTEsICZhZHY3NTExLT5jb25uZWN0b3IpOw0KPiANCj4gVGhpcyBsZWFrcyB0aGUg
cmV0dXJuZWQgRURJRC4NCg0KVGhhbmtzIGZvciBjYXRjaGluZyB0aGlzIC0gSSB3aWxsIGZpeCBp
biB2Mi4NCg0KS2luZCByZWdhcmRzLA0KQWx2aW4=
