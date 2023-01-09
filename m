Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C96A6624B9
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 12:54:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A370B10E3EA;
	Mon,  9 Jan 2023 11:54:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6975610E3EA
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 11:54:37 +0000 (UTC)
X-UUID: 0142db2dd4a84ed496c94becbd2f7bfd-20230109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=DVoBb1OKpzDDspbItRQeB3tSBsboO8RPH9yD8aW2X4I=; 
 b=QxlVdRpClLk1JSv4iZaOJRKP6u1biLU6x/CZv3e2iZni3cHnnQI73cwgB5IUogQQsRZ+VFhI/7bNb/I3PQtNoplJmF+T5h2310DsdHX3ktPvK9d1nTYOTlx+Zm8q9vEb2j3YcoIZZ32tNct1B4YWXPBuMdpGZSW8vKAUEw6oPUs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17, REQID:9203b980-18a8-47f4-b945-82fe9daf27d3, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:543e81c, CLOUDID:158cb78b-8530-4eff-9f77-222cf6e2895b,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 0142db2dd4a84ed496c94becbd2f7bfd-20230109
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw02.mediatek.com (envelope-from <xinlei.lee@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1538371268; Mon, 09 Jan 2023 19:54:29 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 9 Jan 2023 19:54:28 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.792.3 via Frontend Transport; Mon, 9 Jan 2023 19:54:28 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C7Zn9825AYKilRlKEdm5lEX+InNVqfqYhtQSjjjUAwyEmIqQ5LNhsfLMhwo2qJFRlvr4kanrvlGuD5K73hRdU5ND3U1JXePDAn3S63D2WAzk8Bd4liu29cXCiNTi1CAsb9EVO2rbP4yQfYzOcZib6EtH9CiiJ1YSwe0X6PJuV02XzumHRvfxMKGGc6ktjI2CkhwxWjaDXv8K80jhdZmhpZkJl7zpfwR3ATJLxV58N35S6jVIeuO+FNfE0KqpYdsdOcWsZw/rJl3g8kqbuCjgJJZyz/88hPr4O+3q8GBeZ0jpeutQyODB6bak/2MeYvCC78XGOeNx49NC/ZFxhA4blA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NIPRNC1rMY9OF+TrM6cl30UAaphUwUe+a6lEu/t+/60=;
 b=Rdn1aj7XRFdqEwQAJbJhuLaMXx28lUa6nyYOWq+4Cf6ltbLN4z2+HQyrN8tXkRVXTmrtB8dcaQ6jkektNUsAJQbBny1bbeelwm0KLdW8Bo1Vab0ekTp0xT5pmvnpixj8bKBh7c4lW8GBXw25IV0mvKinsxSpo8w6VioSXXBSCCOO85X0fZjjOcu8ktk/HW5PIdPVjIDbLlhOqTEMKXdUNVehnHyJGiw7d+v2Sd9sZSNxCRq4tEO+Sg3fs5QkaH1ewKicwXpavegdERweXBqF+8xcekgKtVM7MsucCC6uUrCQcBcj9T9Ao5MqMStBoSHEcbeYQ0tYViwNEjVtsZizaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NIPRNC1rMY9OF+TrM6cl30UAaphUwUe+a6lEu/t+/60=;
 b=JGesT0lp6MQADTP2rbGBcYb3yF95DywJw2kM/bOYM0cQOokn2A37WOHZ8hLL+svH9M3aWIZDt0/kIlHPngVjL4uCUFVmwpum4ylpCJujO1m9plP84e4IlBGeUXH25cn/bXJ+Z+DURCHL3NNWz4rJ/Ho2RN+P7GGwa7p4NDFEwSc=
Received: from SI2PR03MB5339.apcprd03.prod.outlook.com (2603:1096:4:105::9) by
 KL1PR03MB5587.apcprd03.prod.outlook.com (2603:1096:820:39::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18; Mon, 9 Jan 2023 11:54:25 +0000
Received: from SI2PR03MB5339.apcprd03.prod.outlook.com
 ([fe80::dae4:f894:f81f:7a2b]) by SI2PR03MB5339.apcprd03.prod.outlook.com
 ([fe80::dae4:f894:f81f:7a2b%8]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 11:54:25 +0000
From: =?utf-8?B?WGlubGVpIExlZSAo5p2O5piV56OKKQ==?= <Xinlei.Lee@mediatek.com>
To: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "sam@ravnborg.org"
 <sam@ravnborg.org>, =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?=
 <jitao.shi@mediatek.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "thierry.reding@gmail.com"
 <thierry.reding@gmail.com>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 2/2] drm/panel: boe-tv101wum-nl6: Reduce lcm_reset to send
 initial code time
Thread-Topic: [PATCH 2/2] drm/panel: boe-tv101wum-nl6: Reduce lcm_reset to
 send initial code time
Thread-Index: AQHZIXvy5e1lbNR4AkKSRYdDZpV3aq6V90KAgAAICoA=
Date: Mon, 9 Jan 2023 11:54:24 +0000
Message-ID: <cf95d399cbfcf847a85d848c99f1bc0694636247.camel@mediatek.com>
References: <1672974321-18947-1-git-send-email-xinlei.lee@mediatek.com>
 <1672974321-18947-3-git-send-email-xinlei.lee@mediatek.com>
 <778af306-ae24-4c49-5e93-7810fad7f8bb@collabora.com>
In-Reply-To: <778af306-ae24-4c49-5e93-7810fad7f8bb@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB5339:EE_|KL1PR03MB5587:EE_
x-ms-office365-filtering-correlation-id: b754780f-e5b3-48f4-84ed-08daf2384112
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PdQMLoy7v1PG9BmzeCO22h4pS5JlUOFEwMizW4O9Vay5RyAMhZYQ7cW2v68r3kFMYA8+dtbPkGuH5IvDZDCUt2x3sBhDYy36PKYnU4YIv6R1706q4f5T5wTMe3yif0T/DfKBxYfxi2rj2HWUoG8Fa5pAJam5OpEUcPsXQoUM/EEmzggsTJb9aZLut/akGd6pPuuP5jTA/ISdrV/FWPjoGVq8u+8IkkQ/3zO/WWmOP7wszfMGuUVbKEr2CUNFamoYW7w2lrLILU+8rlQ+pY3A0XvHbIkfS6CKzSG9wP0dszi8nww1qbKfvD/weUZvcWm06XDvJgqccs90gyRcKwBi0PCiIB+4JHD0Pg4thbm6IVjzlB9hduaX/TFy1DBE2G4oeMwJ+U5oJLJXzqCaFLkXxBocZtKWua7wVGZXYrY5LWTOcuWgruoorTr3H+MJYmzMpQBbOOEyPQmeIOcD/t0l6n4CHeKyuRk1oCUQpMbbF9TsvS0+YZjD/BiiTTF74L2riNWgtUxGrQpLT+Zx3CFZ1dvKd1frJlvhIcjawX5CD/N+3VdFmyapU0NoPos+1ydfA6LszYiZSbrFJjwgwYGVwj9xaPQOLIqVyUk1LgCq0uQgc7/9LzsqZRwwZHFddJJBXgcD8wEIk9FPwlV11LFzO4R09tdiGcROFR2zZOjvjswApRLs0z7J87cZJyu5NuB9tIngQ7KZ3DxwgbacJazz1a1pIRDsIZlhtfGFzdn+ABt9VPwF5J9xiCxo1wT86A0E
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR03MB5339.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(39860400002)(396003)(366004)(376002)(451199015)(36756003)(186003)(85182001)(8936002)(122000001)(107886003)(26005)(6506007)(6512007)(2616005)(110136005)(54906003)(5660300002)(66946007)(7416002)(66446008)(66476007)(64756008)(66556008)(4326008)(91956017)(316002)(38070700005)(86362001)(71200400001)(6486002)(38100700002)(76116006)(478600001)(41300700001)(8676002)(2906002)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cHNqTlN2ekdVVVJwMS9jRysya3RiSmJQUys3MXVxc3EzNDZnZmpZc2VySXhh?=
 =?utf-8?B?R1pVb0s3anQveEVUK25lVDIya3NZbldmYUc1eUNFcDBtVjlhbUhROUppcUkz?=
 =?utf-8?B?RWZVZ1BQUDNpcEN4RGNMalVOdytGS0NicThMZXAzOXpEMVY3MitMWndjUHps?=
 =?utf-8?B?K0c3TjRwODMyRFBhZ29DZFBJbWI1M3dNMDBPM0wrZzI1SEhLbDEvZUZrcWFS?=
 =?utf-8?B?NEhEc1F2L1Yvb1RtTFAxT2trbXJkTFZ4bnVkZmZFcCtqTFdTWDQvTHBxOUlp?=
 =?utf-8?B?Y3JPbGJ6bWh2WWxyd3pqbDl2WjJ2cXNJMkRibUY2ZU1zUW95OEpzWFZid0x5?=
 =?utf-8?B?OVdUTVlhbDR5NW81Vmh0YjVOK0t6dUJIY0E0WFYxd2hqM0wwSTRzRi9reHJI?=
 =?utf-8?B?WEpqTEEzRFJwVDhaeHFpZEVZeHRURm1XVGZOZzkrcU8vYVVUenNCbnZqWVlz?=
 =?utf-8?B?OFBsZG9jWHNFczMyV2FleFJwNm5EUEJHd1grTG8rMk1oRWhpUzVJRU1EVmpo?=
 =?utf-8?B?V3dOMTZ0ckZFbndEeThCMUJyUW0rWmxUaVZjWis1VUxJUUdwV2V6a3NRbUkr?=
 =?utf-8?B?bGNFWGIxemhSVjdOTnNxMjVXcWxOV05wNmtSRW00cDFFRFQ1OElaSDA0emNi?=
 =?utf-8?B?T0FqSVNVOVlhcUlHSlMyM1RUSHIwL1dPRDd4WGUvNWVhZ01JcEFzTEdCdUNL?=
 =?utf-8?B?UHlFS0RHM2RYMFFlQVpXbzMyOHF5TUhEajVoV2NDZ2lmV1EvVWtad2t6ODZL?=
 =?utf-8?B?ODR2a2FEUERwbmpFNitLT1FKRFZhcXFWTXZlYWJFejluUFRyUGRvSW9zQWEy?=
 =?utf-8?B?M1RjelRENjZINzJTRzFvRDY0QkpMVG4vWGpFZERmQlV5YXZCcVlWOE5sK2gy?=
 =?utf-8?B?cDNIV2xEUWRkUU9meUUzVnRITVV3dlRsSlFwTEhUN2Mzd2Z2ejQ1RDF2TnlW?=
 =?utf-8?B?VFE2UlNhOUt1R0c2YWxFUXQwU0EzYnJjRCtxaVRmOGIvUHNzMkhUSHJ4d0hO?=
 =?utf-8?B?bDR6UjlXVUtvWHExVEl0M1ZTKzFvcEt6eEJ1NDNIMFdNdFowSUxsT0pNdGJR?=
 =?utf-8?B?emxNOHcxUVBRcXE0Z3lDUFVzNFhvazBnek5QSVp3Tmh6OHFxdnE2cTdNYnBL?=
 =?utf-8?B?S0VudURGL1I4cWxUU040WkxFNjMrTGV4MWFJZG1tQnhkRnAzMzEwaVhZR3JY?=
 =?utf-8?B?V0RNSEgraVRqd1BhL3E2anoxTG9vbzJkZUU4WEIrejJFa1BzZ0VyOXlXdGhz?=
 =?utf-8?B?elNBYVVLT2lORGVuejNqSnh5STBsU3lta0JsMHJCTXcvUm8xMUxZcDZneHFm?=
 =?utf-8?B?TkMzbTFRZnBhZjN5VWhLZnBDdE13WllzQ05uV21Ta0d5SVk3UXJTYUR2V0dU?=
 =?utf-8?B?Si8xY3lwK0o5SWNzYnNadTVLWEZURjNnTlNXeGRyMDdBaUxzNTcvd01tWHAz?=
 =?utf-8?B?QkFkQjIzRDFta1ZDUHNBVUtOcjdreGpMaE9QR0p0bysxQm82TFRGYXBoblM2?=
 =?utf-8?B?MStUaFlVTjcyZDJ0OC8zTFQ4dXROT0t5UFFmUFN6aWgxNkIzTEI1RjJONStN?=
 =?utf-8?B?OGRNOW9JUG9hZGlEMUxCK0pWWm8zdkFiMzBTMUFiVWZPTmN1ZDZOUUNUa2tR?=
 =?utf-8?B?VWxJUHhETk9xZVNFcGVRTzdpaUE2aFVZaFQwaFAzcm51QUxvWlMwdnpBSTFP?=
 =?utf-8?B?MEptdlBTUm5vTWRTSVJMUS9TQm5zYWE1amVsM2tQQWt0YzZUMi9QV2FCek0r?=
 =?utf-8?B?Vm5BVDlrUWJXb2pwVWYyY1V2SGlNY015TzVkWGg4RnNZTWk1aUJ2ekQ0OWk2?=
 =?utf-8?B?UW9mdEYxTW5UaXhvT1VTU3BzZHBuMGJLdldsM25XWlp4M3MyOHRJaWgrVW4v?=
 =?utf-8?B?NkpJMUF1UnB2TXdKL29xVncxREpuWUZqd3Y2KzNYUXBxWWZWakppVjNpRWdY?=
 =?utf-8?B?RkRPR0xwS0Q0ejZNN1hHZFZZTlN0anY4dlRLT3hsbFRrcDJuYU03WmdIWGNI?=
 =?utf-8?B?NjFneHF0M1EvMDUvNlNweTlVSEZSNEUyNVp3OVQ5TXZjRjhpVUo5VmEyUFQ3?=
 =?utf-8?B?K0lOZmVWSUhrYkdTdldDR0ZCT2R1QzgzekdsK3E3eXpFWmkvc0UwMEtLajd0?=
 =?utf-8?B?Zmo5SSs0SDhQY2FFcU5tMFR5Y1Bid3FCK1J1NmlTY0I0U1duMHJjcUtLdCsw?=
 =?utf-8?B?R1E9PQ==?=
Content-ID: <D5E008CC87438D43AF548A240C697444@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5339.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b754780f-e5b3-48f4-84ed-08daf2384112
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2023 11:54:24.9700 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VnUfjE7bBp7dqqad5NrUEd3EWfRRB0IA1Lvu3gjKeWVcoEi59YrFSzrI0KByWYsZUD18boaAYHqCqe12/AcZrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB5587
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_001_1422823559.1796166322"
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
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_001_1422823559.1796166322
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCk9uJiMzMjtNb24sJiMzMjsyMDIzLTAxLTA5JiMzMjthdCYjMzI7MTI6MjUmIzMyOysw
MTAwLCYjMzI7QW5nZWxvR2lvYWNjaGlubyYjMzI7RGVsJiMzMjtSZWdubyYjMzI7d3JvdGU6DQom
Z3Q7JiMzMjtJbCYjMzI7MDYvMDEvMjMmIzMyOzA0OjA1LCYjMzI7eGlubGVpLmxlZUBtZWRpYXRl
ay5jb20mIzMyO2hhJiMzMjtzY3JpdHRvOg0KJmd0OyYjMzI7Jmd0OyYjMzI7RnJvbTomIzMyO1hp
bmxlaSYjMzI7TGVlJiMzMjsmbHQ7eGlubGVpLmxlZUBtZWRpYXRlay5jb20mZ3Q7DQomZ3Q7JiMz
MjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyO1NpbmNlJiMzMjt0aGUmIzMyO3BhbmVsJiMz
MjtzcGVjJiMzMjtzdGlwdWxhdGVzJiMzMjt0aGF0JiMzMjt0aGUmIzMyO3RpbWUmIzMyO2Zyb20m
IzMyO2xjbV9yZXNldCYjMzI7dG8mIzMyO0RTSQ0KJmd0OyYjMzI7Jmd0OyYjMzI7dG8NCiZndDsm
IzMyOyZndDsmIzMyO3NlbmQmIzMyO3RoZSYjMzI7aW5pdGlhbCYjMzI7Y29kZSYjMzI7c2hvdWxk
JiMzMjtiZSYjMzI7Z3JlYXRlciYjMzI7dGhhbiYjMzI7Nm1zJiMzMjthbmQmIzMyO2xlc3MmIzMy
O3RoYW4NCiZndDsmIzMyOyZndDsmIzMyOzQwbXMsDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtzbyYjMzI7
cmVkdWNlJiMzMjt0aGUmIzMyO2RlbGF5JiMzMjtiZWZvcmUmIzMyO3NlbmRpbmcmIzMyO3RoZSYj
MzI7aW5pdGlhbCYjMzI7Y29kZSYjMzI7YW5kJiMzMjthdm9pZCYjMzI7cGFuZWwNCiZndDsmIzMy
OyZndDsmIzMyO2V4Y2VwdGlvbnMuDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsm
IzMyO0ZpeGVzOiYjMzI7YTg2OWI5ZGI3YWRmJiMzMjsoJnF1b3Q7ZHJtL3BhbmVsOiYjMzI7c3Vw
cG9ydCYjMzI7Zm9yJiMzMjtib2UmIzMyO3R2MTAxd3VtLW5sNiYjMzI7d3V4Z2ENCiZndDsmIzMy
OyZndDsmIzMyO2RzaSYjMzI7dmlkZW8mIzMyO21vZGUmIzMyO3BhbmVsJnF1b3Q7KQ0KJmd0OyYj
MzI7Jmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO1hpbmxlaSYjMzI7TGVlJiMzMjsmbHQ7eGlu
bGVpLmxlZUBtZWRpYXRlay5jb20mZ3Q7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjstLS0NCiZndDsmIzMy
OyZndDsmIzMyOyYjMzI7JiMzMjtkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtYm9lLXR2MTAx
d3VtLW5sNi5jJiMzMjt8JiMzMjsxJiMzMjstDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyOyYjMzI7
MSYjMzI7ZmlsZSYjMzI7Y2hhbmdlZCwmIzMyOzEmIzMyO2RlbGV0aW9uKC0pDQomZ3Q7JiMzMjsm
Z3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyO2RpZmYmIzMyOy0tZ2l0JiMzMjthL2RyaXZlcnMv
Z3B1L2RybS9wYW5lbC9wYW5lbC1ib2UtdHYxMDF3dW0tbmw2LmMNCiZndDsmIzMyOyZndDsmIzMy
O2IvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWJvZS10djEwMXd1bS1ubDYuYw0KJmd0OyYj
MzI7Jmd0OyYjMzI7aW5kZXgmIzMyOzg1N2EyZjA0MjBkNy4uZjAwOTMwMzVmMWZmJiMzMjsxMDA2
NDQNCiZndDsmIzMyOyZndDsmIzMyOy0tLSYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFu
ZWwtYm9lLXR2MTAxd3VtLW5sNi5jDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrKysmIzMyO2IvZHJpdmVy
cy9ncHUvZHJtL3BhbmVsL3BhbmVsLWJvZS10djEwMXd1bS1ubDYuYw0KJmd0OyYjMzI7Jmd0OyYj
MzI7QEAmIzMyOy03ODAsNyYjMzI7Kzc4MCw2JiMzMjtAQCYjMzI7c3RhdGljJiMzMjtjb25zdCYj
MzI7c3RydWN0JiMzMjtwYW5lbF9pbml0X2NtZA0KJmd0OyYjMzI7Jmd0OyYjMzI7aW54X2hqMTEw
aXpfaW5pdF9jbWRbXSYjMzI7PSYjMzI7ew0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjsmIzMyO307
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyOyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyOyYj
MzI7c3RhdGljJiMzMjtjb25zdCYjMzI7c3RydWN0JiMzMjtwYW5lbF9pbml0X2NtZCYjMzI7Ym9l
X2luaXRfY21kW10mIzMyOz0mIzMyO3sNCiZndDsmIzMyOyZndDsmIzMyOy1fSU5JVF9ERUxBWV9D
TUQoMjQpLA0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtZb3UmIzMyO3NhaWQmIzMyO3RoYXQmIzMyO3No
b3VsZCYjMzI7YmUmIzMyO2dyZWF0ZXImIzMyO3RoYW4mIzMyOzYmIzMyO2FuZCYjMzI7bGVzcyYj
MzI7dGhhbiYjMzI7NDA6JiMzMjtwZXJoYXBzJiMzMjtvbg0KJmd0OyYjMzI7TWVkaWFUZWsNCiZn
dDsmIzMyO3BsYXRmb3JtcyYjMzI7cmVtb3ZpbmcmIzMyO3RoaXMmIzMyO2RlbGF5JiMzMjtpcyYj
MzI7ZmluZSYjMzI7YnV0JiMzMjt3ZSYjMzI7ZG9uJiMzOTt0JiMzMjtrbm93JiMzMjthYm91dCYj
MzI7b3RoZXJzDQomZ3Q7JiMzMjstJiMzMjthbmQmIzMyO3RoaXMNCiZndDsmIzMyO2RyaXZlciYj
MzI7aXMmIzMyO2ZvciYjMzI7YWxsJiMzMjtwbGF0Zm9ybXMuDQomZ3Q7JiMzMjsNCiZndDsmIzMy
O1RvJiMzMjtzdGF5JiMzMjtvbiYjMzI7dGhlJiMzMjtzYWZlJiMzMjtzaWRlJiMzMjt5b3UmIzMy
O3Nob3VsZCwmIzMyO2F0JiMzMjt0aGlzJiMzMjtwb2ludCwmIzMyO3JlcGxhY2UmIzMyO3RoaXMN
CiZndDsmIzMyO2RlbGF5JiMzMjt3aXRoDQomZ3Q7JiMzMjsNCiZndDsmIzMyO19JTklUX0RFTEFZ
X0NNRCg3KTsNCiZndDsmIzMyOw0KJmd0OyYjMzI7UmVnYXJkcywNCiZndDsmIzMyO0FuZ2Vsbw0K
Jmd0OyYjMzI7DQoNCkhpJiMzMjtBbmdlbG86DQoNClRoYW5rcyYjMzI7Zm9yJiMzMjt5b3VyJiMz
MjtyZXBseSENCg0KUGxlYXNlJiMzMjthbGxvdyYjMzI7bWUmIzMyO3RvJiMzMjtleHBsYWluLCYj
MzI7aW4mIzMyO2Fub3RoZXImIzMyO2RzaSYjMzI7bW9kaWZpY2F0aW9uJiMzMjtvZiYjMzI7dGhp
cyYjMzI7DQpzZXJpZXMsJiMzMjtJJiMzMjtyZWR1Y2VkJiMzMjt0aGUmIzMyO2RlbGF5JiMzMjtv
ZiYjMzI7ZHNpJiMzOTtzJiMzMjtMUDAwLSZndDtMUDExJiMzMjtzdGFnZSYjMzI7ZnJvbSYjMzI7
MjBtcyYjMzI7dG8mIzMyOzFtcyYjMzI7DQoodG8mIzMyO2NvbXBseSYjMzI7d2l0aCYjMzI7ZHNp
JiMzMjtzcGVjKSwmIzMyO2luJiMzMjtmYWN0LCYjMzI7aW4mIzMyO3RoaXMmIzMyO2ZpbGUsJiMz
Mjt0aGUNCmJvZV9wYW5lbF9wcmVwYXJlJiMzMjtmdW5jdGlvbiYjMzI7VGhlJiMzMjs2bXMmIzMy
O2RlbGF5JiMzMjthZnRlciYjMzI7cHVsbGluZyYjMzI7dXAmIzMyO2xjbV9yZXNldA0KaXMmIzMy
O2JlZm9yZSYjMzI7dGhlJiMzMjsxbXMmIzMyO21lbnRpb25lZCYjMzI7anVzdCYjMzI7bm93LCYj
MzI7d2hpY2gmIzMyO2Vuc3VyZXMmIzMyO3RoYXQmIzMyO3RoZSYjMzI7ZGVsYXkmIzMyO2lzJiMz
MjsNCndpdGhpbiYjMzI7dGhlJiMzMjtzcGVjaWZpZWQmIzMyO3JhbmdlJiMzMjsoN21zKS4NCg0K
RG8mIzMyO3lvdSYjMzI7c3RpbGwmIzMyO2hhdmUmIzMyO2RvdWJ0cyYjMzI7YWJvdXQmIzMyO215
JiMzMjtleHBsYW5hdGlvbiYjNjM7DQoNCkJlc3QmIzMyO1JlZ2FyZHMhDQp4aW5sZWkNCg0KPC9w
cmU+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVLIENv
bmZpZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioqKioqKioqKioNClRoZSBpbmZvcm1hdGlv
biBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0dGFj
aG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Ig
b3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4g
SXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJl
Y2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHByaW50
aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cyAN
CmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9o
aWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQg
cmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlIA0KdGhhdCB5b3UgaGF2ZSByZWNl
aXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1t
ZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxs
IGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9t
IHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUt
bWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_001_1422823559.1796166322
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDIzLTAxLTA5IGF0IDEyOjI1ICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gSWwgMDYvMDEvMjMgMDQ6MDUsIHhpbmxlaS5sZWVAbWVkaWF0ZWsuY29t
IGhhIHNjcml0dG86DQo+ID4gRnJvbTogWGlubGVpIExlZSA8eGlubGVpLmxlZUBtZWRpYXRlay5j
b20+DQo+ID4gDQo+ID4gU2luY2UgdGhlIHBhbmVsIHNwZWMgc3RpcHVsYXRlcyB0aGF0IHRoZSB0
aW1lIGZyb20gbGNtX3Jlc2V0IHRvIERTSQ0KPiA+IHRvDQo+ID4gc2VuZCB0aGUgaW5pdGlhbCBj
b2RlIHNob3VsZCBiZSBncmVhdGVyIHRoYW4gNm1zIGFuZCBsZXNzIHRoYW4NCj4gPiA0MG1zLA0K
PiA+IHNvIHJlZHVjZSB0aGUgZGVsYXkgYmVmb3JlIHNlbmRpbmcgdGhlIGluaXRpYWwgY29kZSBh
bmQgYXZvaWQgcGFuZWwNCj4gPiBleGNlcHRpb25zLg0KPiA+IA0KPiA+IEZpeGVzOiBhODY5Yjlk
YjdhZGYgKCJkcm0vcGFuZWw6IHN1cHBvcnQgZm9yIGJvZSB0djEwMXd1bS1ubDYgd3V4Z2ENCj4g
PiBkc2kgdmlkZW8gbW9kZSBwYW5lbCIpDQo+ID4gU2lnbmVkLW9mZi1ieTogWGlubGVpIExlZSA8
eGlubGVpLmxlZUBtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0v
cGFuZWwvcGFuZWwtYm9lLXR2MTAxd3VtLW5sNi5jIHwgMSAtDQo+ID4gICAxIGZpbGUgY2hhbmdl
ZCwgMSBkZWxldGlvbigtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
cGFuZWwvcGFuZWwtYm9lLXR2MTAxd3VtLW5sNi5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vcGFu
ZWwvcGFuZWwtYm9lLXR2MTAxd3VtLW5sNi5jDQo+ID4gaW5kZXggODU3YTJmMDQyMGQ3Li5mMDA5
MzAzNWYxZmYgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWJv
ZS10djEwMXd1bS1ubDYuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1i
b2UtdHYxMDF3dW0tbmw2LmMNCj4gPiBAQCAtNzgwLDcgKzc4MCw2IEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgcGFuZWxfaW5pdF9jbWQNCj4gPiBpbnhfaGoxMTBpel9pbml0X2NtZFtdID0gew0KPiA+
ICAgfTsNCj4gPiAgIA0KPiA+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBwYW5lbF9pbml0X2NtZCBi
b2VfaW5pdF9jbWRbXSA9IHsNCj4gPiAtCV9JTklUX0RFTEFZX0NNRCgyNCksDQo+IA0KPiBZb3Ug
c2FpZCB0aGF0IHNob3VsZCBiZSBncmVhdGVyIHRoYW4gNiBhbmQgbGVzcyB0aGFuIDQwOiBwZXJo
YXBzIG9uDQo+IE1lZGlhVGVrDQo+IHBsYXRmb3JtcyByZW1vdmluZyB0aGlzIGRlbGF5IGlzIGZp
bmUgYnV0IHdlIGRvbid0IGtub3cgYWJvdXQgb3RoZXJzDQo+IC0gYW5kIHRoaXMNCj4gZHJpdmVy
IGlzIGZvciBhbGwgcGxhdGZvcm1zLg0KPiANCj4gVG8gc3RheSBvbiB0aGUgc2FmZSBzaWRlIHlv
dSBzaG91bGQsIGF0IHRoaXMgcG9pbnQsIHJlcGxhY2UgdGhpcw0KPiBkZWxheSB3aXRoDQo+IA0K
PiAJX0lOSVRfREVMQVlfQ01EKDcpOw0KPiANCj4gUmVnYXJkcywNCj4gQW5nZWxvDQo+IA0KDQpI
aSBBbmdlbG86DQoNClRoYW5rcyBmb3IgeW91ciByZXBseSENCg0KUGxlYXNlIGFsbG93IG1lIHRv
IGV4cGxhaW4sIGluIGFub3RoZXIgZHNpIG1vZGlmaWNhdGlvbiBvZiB0aGlzIA0Kc2VyaWVzLCBJ
IHJlZHVjZWQgdGhlIGRlbGF5IG9mIGRzaSdzIExQMDAtPkxQMTEgc3RhZ2UgZnJvbSAyMG1zIHRv
IDFtcyANCih0byBjb21wbHkgd2l0aCBkc2kgc3BlYyksIGluIGZhY3QsIGluIHRoaXMgZmlsZSwg
dGhlDQpib2VfcGFuZWxfcHJlcGFyZSBmdW5jdGlvbiBUaGUgNm1zIGRlbGF5IGFmdGVyIHB1bGxp
bmcgdXAgbGNtX3Jlc2V0DQppcyBiZWZvcmUgdGhlIDFtcyBtZW50aW9uZWQganVzdCBub3csIHdo
aWNoIGVuc3VyZXMgdGhhdCB0aGUgZGVsYXkgaXMgDQp3aXRoaW4gdGhlIHNwZWNpZmllZCByYW5n
ZSAoN21zKS4NCg0KRG8geW91IHN0aWxsIGhhdmUgZG91YnRzIGFib3V0IG15IGV4cGxhbmF0aW9u
Pw0KDQpCZXN0IFJlZ2FyZHMhDQp4aW5sZWkNCg==

--__=_Part_Boundary_001_1422823559.1796166322--

