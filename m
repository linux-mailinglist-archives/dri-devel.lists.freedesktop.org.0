Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5FF72F327
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 05:41:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B828810E095;
	Wed, 14 Jun 2023 03:41:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE38A10E09C
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 03:41:13 +0000 (UTC)
X-UUID: 4ae605ec0a6511ee9cb5633481061a41-20230614
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=hjOLG9aueiVtOpksiOoEsUmhDLCQUdRMWXKzaAw9vAw=; 
 b=B/OuWNkBHnC7Ey4/hIr6hdoNMS0SHCCp+CdyZxntmcFV/Cz2jQflwjla/hVc0J38iORX2KX/1Iw2dnLOUxoMhPls1ZhXknjT+lBPnQHGnQHeSCqzOPzqWEOc0Hhphic5mg2VWavhu/mggBXAJOrd/f3Ti1wO7vR9YDCMYqu0jG0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.26, REQID:5e188510-c9ca-42e9-9029-779ed555b6ee, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:45
X-CID-INFO: VERSION:1.1.26, REQID:5e188510-c9ca-42e9-9029-779ed555b6ee, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:45
X-CID-META: VersionHash:cb9a4e1, CLOUDID:060f006f-2f20-4998-991c-3b78627e4938,
 B
 ulkID:230613095251RY68AK8N,BulkQuantity:39,Recheck:0,SF:28|17|19|48|38|29|
 102,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,C
 OL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SDM, TF_CID_SPAM_FAS, TF_CID_SPAM_FSD,
 TF_CID_SPAM_OBB, TF_CID_SPAM_SNR
X-UUID: 4ae605ec0a6511ee9cb5633481061a41-20230614
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 86224118; Wed, 14 Jun 2023 11:41:05 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 14 Jun 2023 11:41:04 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Wed, 14 Jun 2023 11:41:04 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M+QgomOS68YtBoicD6ExFtykxUlNIuY/R+DQk6NehWo3Yx/4R/zdGK6GMiXl93R94uUKZMY1A5NdCG3QfTfExS5qxhRHpIJLmXPkvAWYk9j8snxHKvzfLH43b+0i9a6JmnvhL7X4fjnd+vdVhdxkh/+bDRFY7Et6BxZcVyjloSR3LdUFPRMzG2mGHaeJBGZ/KifXqfMjJBN8WmYQc96OWMPj0rs/yF0rYb3urX2uoogPtNpiLrNWlG8c1Id/qL2PYibttY0sqQ0ZAoOZA5fnc+DzJfN4Dda+HekWthTpaoebAj84pZgB/pYsXtoTX5A/5xCUtjKQgt6iCsXO8yqUCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VAZ02C76q+TETHhtJz0JfyAE+dTLXo1fI7pViipmi0E=;
 b=G+Bz7BppOqoEvBG5PxMywogvl5ywzXFizxksCHGQYBEviHzpye+cbVQonjkB9KBsWThySzgRT4c41Hjl/6v1fmIx27Dq4J4oLjUSGxXAZVIin0NSP5wMEW7i1R9QSZounmoEYxFfZwZXKCglSUMzVZd24b2X7Q8eaxsyAEbe98bWOY4M+LpCInSNKkzD6LPFxAaLmFCSXYbtFjYNp0yjEzEzR7483A8I8SyFbo435cQsqomRW9sddTRN69HJXDQp3nAQLz6XdXrykd8SzxCf7Of1ek0l9SenZo87YWhp2UXoKDQd7j1SNxLi3XFVFtx+p4/87Jzwsdde+d1zsmcKQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VAZ02C76q+TETHhtJz0JfyAE+dTLXo1fI7pViipmi0E=;
 b=XCZoA7epkIXsGwcXtC7ay0+cIkShxqAMD1Sw6owa27BFo//snsj00lyg03nDcv60LCKLvXeW0+o9UtpYq2GETP9XZCdDpdwQc/Ct6ch8HXkLyfbVQWorxm4giA2wwF7a8y5cqKN/U21gjeeR4mM89zIkRlG4LG3LXqeV3dtu9sw=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SG2PR03MB6261.apcprd03.prod.outlook.com (2603:1096:4:175::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.44; Wed, 14 Jun
 2023 03:41:02 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::6fdb:ba2c:bcfc:d5ed]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::6fdb:ba2c:bcfc:d5ed%6]) with mapi id 15.20.6455.037; Wed, 14 Jun 2023
 03:41:01 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "kishon@ti.com"
 <kishon@ti.com>, =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?=
 <Chunfeng.Yun@mediatek.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?=
 <jitao.shi@mediatek.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "granquet@baylibre.com" <granquet@baylibre.com>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "vkoul@kernel.org" <vkoul@kernel.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>
Subject: Re: [PATCH v4 5/8] drm/mediatek: hdmi: add v2 support
Thread-Topic: [PATCH v4 5/8] drm/mediatek: hdmi: add v2 support
Thread-Index: AQHZkjsmmHc/VTGOHU6M5MEfnDzs/6+Jv5sA
Date: Wed, 14 Jun 2023 03:41:01 +0000
Message-ID: <d9b7b71b0f7328830ff59c23b58b5d4bd361e85f.camel@mediatek.com>
References: <20220919-v4-0-687f09a06dd9@baylibre.com>
 <20220919-v4-5-687f09a06dd9@baylibre.com>
In-Reply-To: <20220919-v4-5-687f09a06dd9@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SG2PR03MB6261:EE_
x-ms-office365-filtering-correlation-id: b9d20b4b-423b-476c-1fc2-08db6c892c9d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: l/uHyvLYmkiz5cuvQgrf7pixn0hp/M7jKVjUUuDE2RIt9H6rUdmzuFBtwmO4Wp3TyduEXTwcM2tb+iP4ZsjWQzarWsUBI1c6eQNHUhUbUE0+vI1Z1J4SfjKm0bBDLhD0AiHv5hGqHtdDUd8OqWKhbSXmwWdjwD09t1KU6sWrVUl1wznjWPQNcIRYE1IQmgPxPfAhXR6tvykl8dcpyqeBWtqkf9Sc9cHB5lXSJjn1BCCgNUjMg3aeatyQwLZyTX2NGcPe30KY8PNPmyUkWnQczujEL6snigon+ojmcRNX+s4Ur4nw1+EjrETOVgtaJC+G2PjoglHDqIOC95VSfkJRZLV9AI3naVnEnAeSC6aT3a9hYPp5BXLHVM0CgVAhmnFS+dvQZ6OsI3LEKNec6hjxbs9o3pGJS2TS4Cyxp7TcXjq+f+wuo4YXvKP6onfS/n5g+24qKr/4LyvJFExSxXD70nuXX4Zp0p+nUefGGCJhPMA/ZJKKiPpj9VCArbKQYIKNFozWLmCPLof9FhC/xYe15yePamDGoYu003gwxCo0WNRcgCs6j9rpIo09HpbxVveBXMs6RKdXeoCJUWnB9j8AUcTvxMAmwPcICiGYkS3zyOsBUVaw6NPWm+/HxdaEnzWxVRac2M6Stwzl7SUUWLEhqw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(366004)(376002)(39860400002)(136003)(346002)(451199021)(85182001)(36756003)(86362001)(2906002)(38070700005)(7416002)(5660300002)(2616005)(83380400001)(186003)(26005)(6506007)(6512007)(921005)(122000001)(71200400001)(54906003)(6486002)(110136005)(66476007)(64756008)(478600001)(4326008)(38100700002)(66946007)(76116006)(66446008)(316002)(8936002)(66556008)(41300700001)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S0d4ellYeEk4YkhjZ2ZSQ05VMktrdjlJQm10eVF1WGFRaXg2VEF4WldhZDl1?=
 =?utf-8?B?NjdqOW5EdTlpeGVGczh5eW5tUW5VMVRacVVuMWxwYnBxb09qWXNwa3ZScjBz?=
 =?utf-8?B?bVRYRDB5NzRoS3h0MHRPQ1dvbnhtYW4rNmVuU3ppK2VHaG9pby9iSzlYZHox?=
 =?utf-8?B?T2h5Y1RXNk40bmoyUDExbnBCVGdoRWZzTCtOckFCUHA4Nm8rQlR0T2M3OEw3?=
 =?utf-8?B?OGgxQzBrRVhWYkp4S1dZQ1NIR0l0WEUzd2JqQ3BNTWpyTVBZaWJWaUo2TVBS?=
 =?utf-8?B?VFJVNjRFRkNoLzI2bUlRRGJQYmdwT0FWT2ZsRFRub0hVL2J3QlZpSU56SXJu?=
 =?utf-8?B?STJvSWdsM214YlFEM3FuMFlJdFZMZTlBVU9YZm9JT2poTTl1TU9yTW5WYmo2?=
 =?utf-8?B?SzVEL3ZCMHFUNVFHNUpERDFRZTB3LzhiKzVQYWNVVCtTVnFQZjJRVnpVc2Ja?=
 =?utf-8?B?Z0kzZU5oYWcrSzJFSUcvUkNMSmg0ZGsxNTBBcTYzQnFnZ0cwSkgyeHJEMGky?=
 =?utf-8?B?b0p5STU3QjRqaUxVaElkVU9hVzlscmlsejNaMFN5d0pPK0kyNk1pYldjY2JQ?=
 =?utf-8?B?RG43Zm45dDNWL0FwcGdNQ3BDZDRHeHZYQ3kwb3p3L0VGTGU4Qi9DMEY0d3Mv?=
 =?utf-8?B?M1RodkY5SUxZL0ZZNVU5eldwcW9remhnamtTQUhPMjRmNHJOV2t1WnV3eVRy?=
 =?utf-8?B?MnJrdDd1QUNnUDlrdXRaOWd0REJGUlowdFplaFJYQkd0eTdJVXNpNVExek9w?=
 =?utf-8?B?K1ZJNjd4REkzdEd6cWV2QzRkK3g3TnN2YlZaU2oweXRYUlo5WTY1dWViZ05N?=
 =?utf-8?B?UGRxWngrYVo3eXo4WG9sS0d1bVRCM2RMN0ZBVVRnYzUxZzhFTDZhRjVlcUtV?=
 =?utf-8?B?dlpNZ3dxeWs2bGhRRDJMZkNBYjZtMVJyQ003TjdYWE03R1Y2OGhxazJFVDNT?=
 =?utf-8?B?ZkdyNno5WFJpaTFyQ0xuNHZ4a2JvcERTa2Q4RUtkbjVGWlRVZ2VhTmpNYzRO?=
 =?utf-8?B?MnRJK2xRa3hmMnh0SEV5TEYxVWVsbURUakVPdkdmSlRta0h6UTBac2pyekJH?=
 =?utf-8?B?VzFpYVhlYmxDZGVNN3drcHhiWVNvUXRWMUdINzVIMTJXSU9KUS9JdjFJNy9l?=
 =?utf-8?B?S2ExUEQzcCtaSy8wbWJORXdVa0t4ZFJUOXJSZEl2VGE2bWxDTUl1bnNxN3dG?=
 =?utf-8?B?U3Q4dE4rdEhoRUxDb2dBcTkwWC9Ja3dmcHhhWkpYOWRGMkk5Y2swU1RuSmFa?=
 =?utf-8?B?cCtSNWswMWpPeTlqQktXZDNXWTFKNlkxalZ3REVieDFBeDdFbTYyZ3RMc3B5?=
 =?utf-8?B?MTUza1ptMlptcVlhSXVOVTRnY2hKcWpvZE96eHZ0STRuSDE4SUVUTDd0YzUz?=
 =?utf-8?B?YWZqTDhGUVlWdjl3RG1PcFd5aTZ5M1hvcnBUUWVXWmlBbHFZUWI1dG4vLzVh?=
 =?utf-8?B?ZnhKdXRoZGhmUlFEbFJTWTRkT0xQTWllK1NjTEdDU1VhRC9IY1pBVjFsZ29G?=
 =?utf-8?B?ZVM1MC9neE5qSkJwWHVWWnB3M3owSUFENDMyaTgxa0tpNlZZK0ZPcjkyZWVz?=
 =?utf-8?B?Qk9NbDYwaUVnQ1plcjVDS2lkQ3F3T2gwR2N5OGQ3TUlQTFJZZFlRY0M3VE5T?=
 =?utf-8?B?bFk5WHpMNTEyVnMrNk9xQ3Fpd0thd0ZSb05CTlVnNUxwdXpwamNnbUxpQ0Y0?=
 =?utf-8?B?bTQzeWp2bU44M0twY0wvbFI2ZS9PeFk2YlNMTk9PMHc5NHlya0lDL1JlZDRC?=
 =?utf-8?B?UkNmZFkvQ080a2IzazdDbU1QaElFVlZkUFltcVFFengvb0tlWWlXQ3RocjNm?=
 =?utf-8?B?Ynd1Y0pkQ2k1eVAxb3ZPamJDa2Q3QjI4RWRwdldrZFlJM2tGdUhPUjE4czQz?=
 =?utf-8?B?dmtmVUVCc2J4M013Skp3emYzUVJlQ24vcStFaWFKSHpkNDcvaU5CL1Rra0pa?=
 =?utf-8?B?cFh0OHJYMm1xWm5hbFdCdjBIV21sYXdjbVdYV0Z3ZVBhMHNCeHRZYzllY29m?=
 =?utf-8?B?eCthQmJoVVJQR2ZiNVQ2ZXJHVUh4Wk93VGZ5bkJsbHJkUWxoSWlubE11VlV5?=
 =?utf-8?B?Y1Jhb0hhUHdqNEVxME5XdDd0S2psWFJWazkyaCt5YkRqSnFiWjJGNDVHWE5t?=
 =?utf-8?Q?ivMf92WCKBU4OgD4TKLyL8LVQ?=
Content-ID: <720A45D38D1A9F479C337FEE7E36312F@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9d20b4b-423b-476c-1fc2-08db6c892c9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2023 03:41:01.7654 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kGXy/RhStpCTZFw5I3Es0r5gRfidwK05Vu/lQPwOsgmyq4UpP+pxY2WoX9YJuQwCPN8wwozNY69NIleuaL5vYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB6261
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_007_202570841.346653132"
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
 =?utf-8?B?TWFjIFNoZW4gKOayiOS/iik=?= <Mac.Shen@mediatek.com>,
 =?utf-8?B?U3R1YXJ0IExlZSAo5p2O57+wKQ==?= <Stuart.Lee@mediatek.com>,
 "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_007_202570841.346653132
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpLCYjMzI7R3VpbGxhdW1lOg0KDQpPbiYjMzI7TW9uLCYjMzI7MjAyMy0wNS0yOSYj
MzI7YXQmIzMyOzE2OjMxJiMzMjsrMDIwMCwmIzMyO0d1aWxsYXVtZSYjMzI7UmFucXVldCYjMzI7
d3JvdGU6DQomZ3Q7JiMzMjsmIzMyOyYjMzI7DQomZ3Q7JiMzMjtFeHRlcm5hbCYjMzI7ZW1haWwm
IzMyOzomIzMyO1BsZWFzZSYjMzI7ZG8mIzMyO25vdCYjMzI7Y2xpY2smIzMyO2xpbmtzJiMzMjtv
ciYjMzI7b3BlbiYjMzI7YXR0YWNobWVudHMmIzMyO3VudGlsDQomZ3Q7JiMzMjt5b3UmIzMyO2hh
dmUmIzMyO3ZlcmlmaWVkJiMzMjt0aGUmIzMyO3NlbmRlciYjMzI7b3ImIzMyO3RoZSYjMzI7Y29u
dGVudC4NCiZndDsmIzMyOyYjMzI7QWRkcyYjMzI7aGRtaSYjMzI7YW5kJiMzMjtoZG1pLWRkYyYj
MzI7c3VwcG9ydCYjMzI7Zm9yJiMzMjt2MiYjMzI7SVAuDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1Np
Z25lZC1vZmYtYnk6JiMzMjtHdWlsbGF1bWUmIzMyO1JhbnF1ZXQmIzMyOyZsdDtncmFucXVldEBi
YXlsaWJyZS5jb20mZ3Q7DQomZ3Q7JiMzMjstLS0NCg0KW3NuaXBdDQoNCiZndDsmIzMyOysNCiZn
dDsmIzMyOytzdGF0aWMmIzMyO2ludCYjMzI7bXRrX2hkbWlfYnJpZGdlX2F0dGFjaChzdHJ1Y3Qm
IzMyO2RybV9icmlkZ2UmIzMyOypicmlkZ2UsDQomZ3Q7JiMzMjsrJiMzMjsmIzMyO2VudW0mIzMy
O2RybV9icmlkZ2VfYXR0YWNoX2ZsYWdzJiMzMjtmbGFncykNCiZndDsmIzMyOyt7DQomZ3Q7JiMz
Mjsrc3RydWN0JiMzMjttdGtfaGRtaSYjMzI7KmhkbWkmIzMyOz0mIzMyO2hkbWlfY3R4X2Zyb21f
YnJpZGdlKGJyaWRnZSk7DQomZ3Q7JiMzMjsraW50JiMzMjtyZXQ7DQomZ3Q7JiMzMjsrDQomZ3Q7
JiMzMjsraWYmIzMyOyghKGZsYWdzJiMzMjsmYW1wOyYjMzI7RFJNX0JSSURHRV9BVFRBQ0hfTk9f
Q09OTkVDVE9SKSkmIzMyO3sNCiZndDsmIzMyOytEUk1fRVJST1IoJnF1b3Q7VGhlJiMzMjtmbGFn
JiMzMjtEUk1fQlJJREdFX0FUVEFDSF9OT19DT05ORUNUT1ImIzMyO211c3QmIzMyO2JlDQomZ3Q7
JiMzMjtzdXBwbGllZCYjOTI7biZxdW90Oyk7DQomZ3Q7JiMzMjsrcmV0dXJuJiMzMjstRUlOVkFM
Ow0KJmd0OyYjMzI7K30NCiZndDsmIzMyOytpZiYjMzI7KGhkbWktJmd0O25leHRfYnJpZGdlKSYj
MzI7ew0KJmd0OyYjMzI7K3JldCYjMzI7PSYjMzI7ZHJtX2JyaWRnZV9hdHRhY2goYnJpZGdlLSZn
dDtlbmNvZGVyLCYjMzI7aGRtaS0mZ3Q7bmV4dF9icmlkZ2UsJiMzMjticmlkZ2UsDQomZ3Q7JiMz
MjtmbGFncyk7DQomZ3Q7JiMzMjsraWYmIzMyOyhyZXQpDQomZ3Q7JiMzMjsrcmV0dXJuJiMzMjty
ZXQ7DQomZ3Q7JiMzMjsrfQ0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7K3BtX3J1bnRpbWVfZW5hYmxl
KGhkbWktJmd0O2Rldik7DQomZ3Q7JiMzMjsrbXRrX2hkbWlfZW5hYmxlX2Rpc2FibGUoaGRtaSwm
IzMyO3RydWUpOw0KDQpJbiYjMzI7bXQ4MTczJiMzMjtoZG1pJiMzMjtkcml2ZXIsJiMzMjt0aGUm
IzMyO2JyaWRnZSYjMzI7YXR0YWNoJiMzMjtmdW5jdGlvbiYjMzI7ZG9lcyYjMzI7bm90JiMzMjtl
bmFibGUmIzMyO2hkbWksDQpjb3VsZCYjMzI7eW91JiMzMjthbGlnbiYjMzI7dGhlJiMzMjtlbmFi
bGUmIzMyO3RpbWluZyYjMzI7d2l0aCYjMzI7bXQ4MTczJiM2MzsmIzMyO0lmJiMzMjtub3QsJiMz
MjtwbGVhc2UmIzMyO2V4cGxhaW4uDQoNCiZndDsmIzMyOysNCiZndDsmIzMyOytyZXR1cm4mIzMy
OzA7DQomZ3Q7JiMzMjsrfQ0KDQpUaGlzJiMzMjtmdW5jdGlvbiYjMzI7aXMmIzMyO2FsbW9zdCYj
MzI7dGhlJiMzMjtzYW1lJiMzMjthcyYjMzI7bXQ4MTczJiMzMjtvbmUsJiMzMjt0cnkmIzMyO3Rv
JiMzMjttZXJnZSYjMzI7dGhlbS4NCg0KUmVnYXJkcywNCkNLDQoNCiZndDsmIzMyOysNCiZndDsm
IzMyOw0KDQo8L3ByZT48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiog
TUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZSAqKioqKioqKioqKioqKioqKioqKg0KVGhl
IGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcg
YW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2
aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGlj
YWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRl
c2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1
dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNs
dWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0
cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBh
biBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUgDQp0aGF0IHlv
dSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBz
ZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUg
YW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNo
bWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50
IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSENCjwvcHJlPjwh
LS19LS0+

--__=_Part_Boundary_007_202570841.346653132
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEd1aWxsYXVtZToNCg0KT24gTW9uLCAyMDIzLTA1LTI5IGF0IDE2OjMxICswMjAwLCBHdWls
bGF1bWUgUmFucXVldCB3cm90ZToNCj4gIAkgDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRv
IG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZl
cmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+ICBBZGRzIGhkbWkgYW5kIGhkbWkt
ZGRjIHN1cHBvcnQgZm9yIHYyIElQLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogR3VpbGxhdW1lIFJh
bnF1ZXQgPGdyYW5xdWV0QGJheWxpYnJlLmNvbT4NCj4gLS0tDQoNCltzbmlwXQ0KDQo+ICsNCj4g
K3N0YXRpYyBpbnQgbXRrX2hkbWlfYnJpZGdlX2F0dGFjaChzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJp
ZGdlLA0KPiArICBlbnVtIGRybV9icmlkZ2VfYXR0YWNoX2ZsYWdzIGZsYWdzKQ0KPiArew0KPiAr
c3RydWN0IG10a19oZG1pICpoZG1pID0gaGRtaV9jdHhfZnJvbV9icmlkZ2UoYnJpZGdlKTsNCj4g
K2ludCByZXQ7DQo+ICsNCj4gK2lmICghKGZsYWdzICYgRFJNX0JSSURHRV9BVFRBQ0hfTk9fQ09O
TkVDVE9SKSkgew0KPiArRFJNX0VSUk9SKCJUaGUgZmxhZyBEUk1fQlJJREdFX0FUVEFDSF9OT19D
T05ORUNUT1IgbXVzdCBiZQ0KPiBzdXBwbGllZFxuIik7DQo+ICtyZXR1cm4gLUVJTlZBTDsNCj4g
K30NCj4gK2lmIChoZG1pLT5uZXh0X2JyaWRnZSkgew0KPiArcmV0ID0gZHJtX2JyaWRnZV9hdHRh
Y2goYnJpZGdlLT5lbmNvZGVyLCBoZG1pLT5uZXh0X2JyaWRnZSwgYnJpZGdlLA0KPiBmbGFncyk7
DQo+ICtpZiAocmV0KQ0KPiArcmV0dXJuIHJldDsNCj4gK30NCj4gKw0KPiArcG1fcnVudGltZV9l
bmFibGUoaGRtaS0+ZGV2KTsNCj4gK210a19oZG1pX2VuYWJsZV9kaXNhYmxlKGhkbWksIHRydWUp
Ow0KDQpJbiBtdDgxNzMgaGRtaSBkcml2ZXIsIHRoZSBicmlkZ2UgYXR0YWNoIGZ1bmN0aW9uIGRv
ZXMgbm90IGVuYWJsZSBoZG1pLA0KY291bGQgeW91IGFsaWduIHRoZSBlbmFibGUgdGltaW5nIHdp
dGggbXQ4MTczPyBJZiBub3QsIHBsZWFzZSBleHBsYWluLg0KDQo+ICsNCj4gK3JldHVybiAwOw0K
PiArfQ0KDQpUaGlzIGZ1bmN0aW9uIGlzIGFsbW9zdCB0aGUgc2FtZSBhcyBtdDgxNzMgb25lLCB0
cnkgdG8gbWVyZ2UgdGhlbS4NCg0KUmVnYXJkcywNCkNLDQoNCj4gKw0KPiANCg==

--__=_Part_Boundary_007_202570841.346653132--

