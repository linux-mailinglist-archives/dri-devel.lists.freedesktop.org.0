Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A03E7C7D63
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 08:02:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE5EF10E07C;
	Fri, 13 Oct 2023 06:02:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 321FE10E07C
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 06:02:42 +0000 (UTC)
X-UUID: 1ae231f8698e11ee8051498923ad61e6-20231013
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=O0LFey7AjwR/Bp1b6n6lH58q2FHhQL8iKAtNJXrjDrk=; 
 b=fSzt0dvAQ6Xcmt1Ke2rD7qEuiUWVTT+i9jPrKOpv22hOuTiWtf9Dy+TU8ovuhkNtLVDerNxCysDkxHsycFYPyLjbLTKFawLuSM3FEkADo9l1vVhWW2FxLWQIImn6EhdcnRixstZaJjp4rfEKe4H4mxgO+tqkuj09XcRJKMJBBmo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:da5935c1-182e-4278-b424-aff40b1289fe, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5f78ec9, CLOUDID:9d83e2bf-14cc-44ca-b657-2d2783296e72,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 1ae231f8698e11ee8051498923ad61e6-20231013
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <moudy.ho@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1584486578; Fri, 13 Oct 2023 14:02:35 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 13 Oct 2023 14:02:34 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Fri, 13 Oct 2023 14:02:33 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I9MHZdXFT3Wv+vObcPodOfxzAsCvgNTOeO+B5DKmOR1ol9vzgE+0BRk96JHA1PoCUhdZWg3tixueoBzRKi03p2Rhu+lp7dCbTPBjXfeh8QAil/JEFj8Yhl/Mi2WtEnS9DLuCSsxt9lD9uSWIKYDmErBicvabA0uRVdBk0Thk4ihn9buHiQ0Qgt9/1V9FoId5bVml6XAJYzMW99KFDs7r2GNmtDdWk4724lQJx1KQEJRIOruSNyOb7DDvfyx5m/dOJPsTwEDnueNXtxdCx5r2R/XuF+NeyVbYic2PRbM3c7OewApibEbipXuz5nkNksIPd6y01ClMDZH6Eh+6Ed6HIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O0LFey7AjwR/Bp1b6n6lH58q2FHhQL8iKAtNJXrjDrk=;
 b=Klt63AnbU4d/D/KTIWdE7jl1HPNlGA90Jgqkcm/n80c/1Js40q31T+cvKwEpGxvhPIwqPO0QsoiufzyZVOonbM4syv2s774LFJsDnQV6xmxrb/6nVMxb/lt0mvJJb9jII9rOhZGk7SNQn4QRY8boFK+iy1YWDMqQj72eM3GYl8EWG4fEjJcRo/X52EQUYg2cJ979/S/oVqNdviCLsM3kZAo5G3M5adjs8z+JqkQuLnbxwLtUcIm+2Lux8s/pu4S0q963tEeorbVo91TmL+AmRYYszamWaoPyTFzPW+HKEPZc7GZr38QqK53sk7NkQfyWqQG5aM9CNHtP3Vn/Z59VMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O0LFey7AjwR/Bp1b6n6lH58q2FHhQL8iKAtNJXrjDrk=;
 b=H+eHA7slfd/rl7P7TBTDQXkmPRprzu/wcqtneDDQ+ofC1yImENyxKFB203ewE7y5BJhvrI2gAxr6RkgRfnDUGlrrdt6K2pFWV6t6ia0nD5F8fAAVETNTIT2AhkZmV/YU75fxPzz1UuDRxaTtumw0OykANjA0tB3nmGUtSFGVgUo=
Received: from TY0PR03MB6356.apcprd03.prod.outlook.com (2603:1096:400:14c::9)
 by KL1PR03MB5947.apcprd03.prod.outlook.com (2603:1096:820:88::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Fri, 13 Oct
 2023 06:02:30 +0000
Received: from TY0PR03MB6356.apcprd03.prod.outlook.com
 ([fe80::3375:b210:ae9a:20af]) by TY0PR03MB6356.apcprd03.prod.outlook.com
 ([fe80::3375:b210:ae9a:20af%6]) with mapi id 15.20.6863.032; Fri, 13 Oct 2023
 06:02:30 +0000
From: =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>, "airlied@gmail.com"
 <airlied@gmail.com>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v7 06/16] dt-bindings: media: mediatek: mdp3: add
 component FG for MT8195
Thread-Topic: [PATCH v7 06/16] dt-bindings: media: mediatek: mdp3: add
 component FG for MT8195
Thread-Index: AQHZ/OfecPDs/dSp+UGYBt7ZtUa80LBF8k8AgAFJkQA=
Date: Fri, 13 Oct 2023 06:02:30 +0000
Message-ID: <2b81ede001c95b4abedbc554ccb9a99847af7bc0.camel@mediatek.com>
References: <20231012084037.19376-1-moudy.ho@mediatek.com>
 <20231012084037.19376-7-moudy.ho@mediatek.com>
 <2b735350-406f-e9e4-0e0d-8a12cbbfedd7@collabora.com>
In-Reply-To: <2b735350-406f-e9e4-0e0d-8a12cbbfedd7@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY0PR03MB6356:EE_|KL1PR03MB5947:EE_
x-ms-office365-filtering-correlation-id: 593a2fcd-ba1a-4858-6532-08dbcbb1fc71
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uAVk5Im1ceNyy3ezyJXTMZmYCQIC99pKa3Ehl0/sXoMiljpJu5dBJM4icAktx08hyVXmZk+8ZalCOqKi9nPyCMeKXyTknSGWG0GeUih0hHZXPzLDQOEokQtd7k2AeR5NDgg97/l1TZHBYtKuwlJD+gFubUGlq4RhVGp0a5gBmYpEoKVIE8G6R8bAJKq6QZOPqDnaPMnX3jEXYWCUYn1q2gLk1wQEUI25IaDJ85H2DodPjboxW9qAId0vbwpzAwf1vdNWInBAPuZUpe9KnZmYqQMxr/27ABwq+QJKVjAj8QoyUJpVKAOVZKjfvKi9nbgeIpoTECNcGt3rFs4RK4dA9PR9L/aBv4SnOT0knypdCQK9arsDH8qHzj+qS+6OvRCCOiQvc4eyP5ZHLrvomZEb5O2IRICK0dlew6emVGOwmS1SQv2tqHqScU6st5MlHJSyJZu5W910UCsQBXKkeRRb+o8qxAf1/yUmL89VM8CngHiPQyscQHmoUvDvlG965eOFzr5bNHv+ljkCw2e0HiJj0awv2ndZFan6CDhIbAMR0lI6y3I3Vozc8LS5Q6x9uO31ZpgduRuLoorMlcf4k9HTIeWLRny16rtnRSAwHfma+GQJKoCqFpdJfAxsOWuwWxKpLvadaU5N3tCy1f0I26pR9UO8hslVKxSTgKtU0ipCldRaFzk1dHRBWyB46AdjYZPZd8d9zjeIqedf8TlsScJ6Gnlgv02wjbbxca9kBDGmw8Q=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY0PR03MB6356.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(346002)(396003)(366004)(376002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(6512007)(478600001)(122000001)(36756003)(966005)(6486002)(66946007)(66476007)(66556008)(76116006)(316002)(110136005)(66446008)(6506007)(38070700005)(38100700002)(26005)(921005)(2616005)(41300700001)(71200400001)(54906003)(64756008)(8936002)(4326008)(8676002)(5660300002)(7416002)(86362001)(2906002)(85182001)(4001150100001)(99106002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S0lkc1Rtb0dkeEpqNnpnVy9NT1lwV0NFQmFjSmg1NEEwaTloRmlCeG5oNkgw?=
 =?utf-8?B?eElJQUptai9McmxiTkxWY1pUQkdEMUR2Wm9SZjJ3VUc4d2FZazJKWm1PVHZk?=
 =?utf-8?B?Y0FYUkRxbEFhSE9kcFRlanNweHhRU2svY2s3YU1LUG51QmpXM0dlVjAzME9H?=
 =?utf-8?B?MGFmZG9qR3AzWUhDeU5XZFk2QnZRRERtN0JIVURjRk12QzB5c2dkRE9XeU8y?=
 =?utf-8?B?SERVU2xvLzN0ZEc4MGx2T1FZaW1qT2E0djZvM0JHZm42K1RHRnRkMTYxZkMy?=
 =?utf-8?B?M1ZwQStXNy9KSVRaeitaQUc5VmlRRU1IZllRNlVFSm1XYWdXSDBxSEZhdTNL?=
 =?utf-8?B?QTJQUzZLT2pIOXpYMUpaeldrRFBMdXlLVmRKTkpCWTVLTWxxY3lnUENVQXB2?=
 =?utf-8?B?UittdnpoemVvOEc3ODI1VzA3UXBIVUdwYmJrUGhWdlhHZnNJTkFuZjBLbGdG?=
 =?utf-8?B?TjJibVFZZmltbE4xRnJWMG5YVnBXakM1RVpPWEtCWGxxM0h1NFdrcEZ0dmJB?=
 =?utf-8?B?QzRSTFFCejNiMUs0NHpieHo4Yi9VanVYRmY1WU9WTzV0RHFNQWZlRVA2T0hx?=
 =?utf-8?B?cUdSWlltZVh5NFZJczgyUk1zQjZORlE3VzJnNFJLTFY3TDZ0VFY1azZoZldt?=
 =?utf-8?B?andKMWlMVm5oa3N4WjVxenRXT3h5Y1RXUkUwZDVzci84cEFuWStadk0zRFJx?=
 =?utf-8?B?NTRPOGhGNkJQQVVtU21BSk5wZ0pEQ1hhSytpaERMOW9QYUk4L1FTSTJvMFVq?=
 =?utf-8?B?RWFESjVsaTcxcHdlKzF2ZUlNY1gvWWhWR20raG1kQmZHQktxMVVzYmw3aWNS?=
 =?utf-8?B?NEViWVZhM3BnQU5iVjZHMUd6VEFWT1I0SmlhNHFtTXY3cHM1dSsyY0Q3NjY3?=
 =?utf-8?B?Z0pMZG9nZ25HRXVGUVVRRmNJdElSeEp0UmxJeW1naUFEZllHb0FsbnNmNXh1?=
 =?utf-8?B?aGlGRlduOEVBN05ENkRFbUsyaUtEWFp0cDdNZ00zeW1KV3cvNHZaQ3BjbjZM?=
 =?utf-8?B?YXZ4enhSTWxjSjh2ckFnNlp3TUlrcEtpdy8rNkVCZGhqei9CVW5Ia3VaalZW?=
 =?utf-8?B?dlpKR0lSUWJBK0VuczBkcFpiaTJOaUZQMEJvYnFzM2g2VWErWnJITUtrUG9m?=
 =?utf-8?B?OTZNbldacnJpN3BlWGd2NFR5S3dTM2dlYTRkWk80cFpQT2ZmRzNkN1Y5NHlz?=
 =?utf-8?B?cFppbzErbWUrTjhLS215c3Y1OVlDT0hWWHlmTE9DNGRaendEMDhoa3VVaGRK?=
 =?utf-8?B?eU14VFFjZTYwSkJzbW5neUxJS3lxQzlvMGNkb1BNMmVKZVZ3UXhycC9BTGdR?=
 =?utf-8?B?UDJWL2hjbXVSbmx2b2RKd2VDN2hERzY1Vk5XNG9HYkZka2YrS09wMjhVU2VG?=
 =?utf-8?B?YWpSekhDeWRYOHFmYjlEdGtTcng4WHRxY0hSM2xZQzkwalVkdW80Z3NRd2JC?=
 =?utf-8?B?UWJlM21DV3dLVmYzZGxDUW5JSEw3bmVCQzFIeTFLMHErWHpPTUVaVXVZUklz?=
 =?utf-8?B?REUxcmlnM0dUZFB3RE82T3VGUmdJSnhhdU52cEpSbWROQ3EwQVFHL2Nscmlu?=
 =?utf-8?B?QlR3Vm1OeStoTFIyY3FVRzYrR1U4Y1h5eGVFWlBBM09KL0dMSVBOWDBER0F0?=
 =?utf-8?B?OWQ4MG1LeXdhWmJSYk0yMUtHSkgyZ1ltY1VPbkVmQkNMckNEdmZwNWtTOXI5?=
 =?utf-8?B?M0p1Zld4NEx1U3ZlTGtKMFFKb1pzQUYvWmlMOFNMLy9UWHNMTGN3dFpmUlFQ?=
 =?utf-8?B?WDBvZkJKL2dhM0I5cmlCL2pDSy9aelVuYVVZMmlBc0dRdTZ6WUhRcnp3TGl4?=
 =?utf-8?B?M0hJUUttTkg0R3BYLzNsbStSZE0veGlWdGZmalZtdFJ4YnpzckxXNG9wdWJh?=
 =?utf-8?B?VTZEQmFyRHNoUmcvMk9aVDhsbk9jUU14M0JXakQ5QVVvdU9jRmR4bGNMWG9u?=
 =?utf-8?B?Y0UyeWx4cCtscXZINnlrRGIwVnNrOFUvM0pWdW9XYTh3eXRyYXM4c1FyNTY5?=
 =?utf-8?B?MklxT1FDN2wycEVib0JSUnBsRlAyQVFYMkdCMVk2d3R1cEx0RXh2WmJZdElp?=
 =?utf-8?B?U1VZK2J0RXZ3cDYyM24vVkdoOUxXYXVUekt4VGZUelNNVmxuaXA4cWZqU29I?=
 =?utf-8?B?eDJyMTY1OTVnYzNvNk1lY3Z1a3kra1UxbXFHOFpTS0lrZExtaTVVSlloQXUx?=
 =?utf-8?B?U1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3C287ECC96C291459BB5CE03929902DD@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY0PR03MB6356.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 593a2fcd-ba1a-4858-6532-08dbcbb1fc71
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2023 06:02:30.7623 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zSwizD2b2uPVFz/ZhHDP4ueeempdUolx9wpfrLyc5Gmque+3JT5i7Vdf3IGdBYVJgruJgZgiD459Lj45JpmL2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB5947
X-MTK: N
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTEwLTEyIGF0IDEyOjIyICswMjAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gSWwgMTIvMTAvMjMgMTA6NDAsIE1vdWR5IEhvIGhhIHNjcml0dG86DQo+
ID4gQWRkIHRoZSBmdW5kYW1lbnRhbCBoYXJkd2FyZSBjb25maWd1cmF0aW9uIG9mIGNvbXBvbmVu
dCBGRywNCj4gPiB3aGljaCBpcyBjb250cm9sbGVkIGJ5IE1EUDMgb24gTVQ4MTk1Lg0KPiA+IA0K
PiA+IFNpZ25lZC1vZmYtYnk6IE1vdWR5IEhvIDxtb3VkeS5ob0BtZWRpYXRlay5jb20+DQo+ID4g
LS0tDQo+ID4gICAuLi4vYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWssbWRwMy1mZy55YW1sICAgICAg
fCA2MQ0KPiA+ICsrKysrKysrKysrKysrKysrKysNCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA2MSBp
bnNlcnRpb25zKCspDQo+ID4gICBjcmVhdGUgbW9kZSAxMDA2NDQNCj4gPiBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWssbWRwMy1mZy55YW1sDQo+ID4gDQo+
ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9t
ZWRpYXRlayxtZHAzLQ0KPiA+IGZnLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbWVkaWEvbWVkaWF0ZWssbWRwMy0NCj4gPiBmZy55YW1sDQo+ID4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjgyZjRjMTgyYzc3YQ0KPiA+IC0tLSAv
ZGV2L251bGwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVk
aWEvbWVkaWF0ZWssbWRwMy1mZy55YW1sDQo+ID4gQEAgLTAsMCArMSw2MSBAQA0KPiA+ICsjIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkNCj4g
PiArJVlBTUwgMS4yDQo+ID4gKy0tLQ0KPiA+ICskaWQ6IA0KPiA+IGh0dHBzOi8vdXJsZGVmZW5z
ZS5jb20vdjMvX19odHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9tZWRpYS9tZWRpYXRlayxt
ZHAzLWZnLnlhbWwqX187SXchIUNUUk5LQTl3TWcwQVJidyFrd0RJYWd6d21SMEV2UThXMlR5ZC1F
Uy00elFvbnNpQVZyNWJTdlRTWUs0WVRWYi05WGlYdTBEVHd0VHJOeWZVWHZ1Qi1fb2xldWF1dGY3
VWVvMS1IaEMzb3RINjdRZyQNCj4gPiAgDQo+ID4gKyRzY2hlbWE6IA0KPiA+IGh0dHBzOi8vdXJs
ZGVmZW5zZS5jb20vdjMvX19odHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUu
eWFtbCpfXztJdyEhQ1RSTktBOXdNZzBBUmJ3IWt3RElhZ3p3bVIwRXZROFcyVHlkLUVTLTR6UW9u
c2lBVnI1YlN2VFNZSzRZVFZiLTlYaVh1MERUd3RUck55ZlVYdnVCLV9vbGV1YXV0ZjdVZW8xLUho
QzMzRUs1N3lBJA0KPiA+ICANCj4gPiArDQo+ID4gK3RpdGxlOiBNZWRpYVRlayBNZWRpYSBEYXRh
IFBhdGggMyBGRw0KPiANCj4gTWVkaWFUZWsgTWVkaWEgRGF0YSBQYXRoIDMgRmlsbSBHcmFpbg0K
PiANCj4gPiArDQo+ID4gK21haW50YWluZXJzOg0KPiA+ICsgIC0gTWF0dGhpYXMgQnJ1Z2dlciA8
bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT4NCj4gPiArICAtIE1vdWR5IEhvIDxtb3VkeS5ob0BtZWRp
YXRlay5jb20+DQo+ID4gKw0KPiA+ICtkZXNjcmlwdGlvbjoNCj4gDQo+IEZpbG0gR3JhaW4gKEZH
KSBpcyBhIE1lZGlhIERhdGEgUGF0aCAzIChNRFAzKSBjb21wb25lbnQgdXNlZCB0byBhZGQNCj4g
dGhlIGZpbG0gZ3JhaW4gYWNjb3JkaW5nIHRvIHRoZSBBT01lZGlhIFZpZGVvIDEgKEFWMSkgc3Rh
bmRhcmQNCj4gDQo+IGFmdGVyIHdoaWNoDQo+IA0KPiBSZXZpZXdlZC1ieTogQW5nZWxvR2lvYWNj
aGlubyBEZWwgUmVnbm8gPA0KPiB6YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEu
Y29tPg0KDQpIaSBBbmdlbG8sDQoNClRoYWtzIGZvciB5b3VyIGhlbHAgaW4gZW5haG5jaW5nIHRo
ZSBkZXNjcmlwdGlvbnMgb2YgdGhlIGNvbXBvbmVudHMNCmFib3V0IEZHLCBIRFIsIFRDQyBhbmQg
VERTSFAgaW4gcGF0Y2ggNiwgNywgOSBhbmQgMTAuIEknbGwgY2FyZWZ1bGx5DQpyZXZpZXcgeW91
ciBzdWdnZXN0aW9ucyBhbmQgaW5jb3Jwb3JhdGUgdGhlbSBpbnRvIHRoZSBuZXh0IHN1Ym1pc3Np
b24uDQoNClNpbmNlcmVseSwNCk1vdWR5DQo=
