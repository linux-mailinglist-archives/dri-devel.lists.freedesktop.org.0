Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6656FC943
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 16:41:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F26D10E36F;
	Tue,  9 May 2023 14:41:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E46C310E36F
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 14:41:01 +0000 (UTC)
X-UUID: 810f11e0ee7711edb20a276fd37b9834-20230509
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=2U585pJLZHmcHxSgCe4Vm7gXiYfWD+b9q73J5T5QpBg=; 
 b=mfY/kB9bPEmC2sEK/ZSt/yR/oJy+6mbIaFYWrc5s1MnHVtzbHxTkDnWaxxWyOWRmfhV2g1x89mh1xRAjevyrlrD3VUwX9J3e2rziEQ4WdPafzdwOqNDMyXFhXkwP2gwVq1XVVHkANr/vcLel216ne1Bf/DqW+3BJ7V0ycoqAjQ0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.24, REQID:e3cd0006-3179-4e8a-93ee-eb24d0a27e16, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:1,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:1
X-CID-INFO: VERSION:1.1.24, REQID:e3cd0006-3179-4e8a-93ee-eb24d0a27e16, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:1,FILE:0,BULK:0,RULE:Release_Ham,ACTION:re
 lease,TS:1
X-CID-META: VersionHash:178d4d4, CLOUDID:591b49c0-e32c-4c97-918d-fbb3fc224d4e,
 B
 ulkID:230509223838WCCCSQYY,BulkQuantity:5,Recheck:0,SF:38|17|19|102,TC:nil
 ,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:41,QS:nil,BEC:nil,COL:0,OSI:0
 ,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 810f11e0ee7711edb20a276fd37b9834-20230509
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 575941283; Tue, 09 May 2023 22:40:55 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 9 May 2023 22:40:54 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Tue, 9 May 2023 22:40:53 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ixH/DWoICYV+WGRURwwE4y6J9/LTgMwS3sJ+Xs5Q4dYnyUZb09II7feF+dzQutathZU1ABjtLwmFf0fay21vw0CxUlHWfttAzxgWq4C6gHoBVNShP/4W3BFTVLlr3uLb36nqpt1ej5oaJrI7u+F9TRX48lfLuJUKtfwt33k2ZSwkWLAkb8EYEAlxQblnoSsGXkkX6E3UXYQNO3wZoSn6ER6zL4BJyDYh+KHfpNXZY0HGxb7d/BTK09Ykg8a7pGNQDV0+EnfJV+bJ5dFC/Z4tg+yzveOFRspsCDaE2GGS0wnFnvDR/lAwhfLGRtOkLZuRyqMy2ULbvRycBVORqtJlwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yB4LFzkYojqVIh/WG1vUoXh8jz4XXClWigOtDvxb2Tw=;
 b=JreewoVTO37ZEWVc+sJCxHYr+NIagRuof3WtGj+5rjjoh5jMEXiH4QPpphyOHVwlCq7nac8Cd5uR41t+nzABq8OzY8R78y3n2LOq7mRp/wCbWB93luYaj+JSB5CpqFBkPGGNn92y+58obr/Llu+tm89u4Ji66kAm9O1wkAB+Msue5H59I5qCJcCKeSi18fCnUp3n7VKCuiE0eayW3zS7k7pE3eTLNkhJgGBdAPl5D037L8JcT2SI2Dh5s2R3hrx5YxDK+CoQmcQ9MdDPXd8DUCjKVcwVzhsR8WDbEQ54IFW1pcZbft/OECoan+roZ9ddX6HMYQ2fVfbuPAQUjoR6IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yB4LFzkYojqVIh/WG1vUoXh8jz4XXClWigOtDvxb2Tw=;
 b=p0ZiQU0Mvqc12dsgCeUMfPvti6ZUTD3P9D2Wba8x476wEP5mXuMuaoqbcbnYtVS2oNsDydLPjktPkkkQa8SFb0Q8N83vy1MHOxEVJaivhSIez2yrjRixqELyKQjh2oHhwVudkD3/xHx3p8t7AfprEKNSjaLm3AI0toP4W9vLizY=
Received: from PU1PR03MB3062.apcprd03.prod.outlook.com (2603:1096:803:3b::21)
 by TYZPR03MB5995.apcprd03.prod.outlook.com (2603:1096:400:12a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 14:40:52 +0000
Received: from PU1PR03MB3062.apcprd03.prod.outlook.com
 ([fe80::66d9:2bd0:26ba:d9bb]) by PU1PR03MB3062.apcprd03.prod.outlook.com
 ([fe80::66d9:2bd0:26ba:d9bb%7]) with mapi id 15.20.6363.033; Tue, 9 May 2023
 14:40:52 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>
Subject: Re: [PATCH v3 06/11] drm/mediatek: gamma: Use bitfield macros
Thread-Topic: [PATCH v3 06/11] drm/mediatek: gamma: Use bitfield macros
Thread-Index: AQHZgBdycBha5qWq9kGZQo4+7tMpFa9SCFGA
Date: Tue, 9 May 2023 14:40:52 +0000
Message-ID: <624a9c767af6fa079ba8d600815d4cba5dbae767.camel@mediatek.com>
References: <20230506123549.101727-1-angelogioacchino.delregno@collabora.com>
 <20230506123549.101727-7-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230506123549.101727-7-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PU1PR03MB3062:EE_|TYZPR03MB5995:EE_
x-ms-office365-filtering-correlation-id: 9e0bfc60-c4dd-4814-a932-08db509b6399
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: grG6CQ2VWFf6j11RrPET9akExR9No9d0/l064YALmDHVd31lZgh40KbzwU1YfVdtKlF4vU/WMXMFWMiqhXTrVGF6k5WBYvAISm+s4fStdV2yNVjOJzDH0fYjcSAGkWMX+v5rf9FwTSQIgJTETYFnBO13dLzOuLMDjdEYLjg+DApnCSOzxWtKzqyRQe0cho0K89oq8PPdP6jpr1eF5ob+1SyFCiFdinNuKFQ4GcN38ho/djRMZMvBcYS06IIPaeWO08kne5LIUndUXrCTrVJbVZoE34r8RwwyLAcmaaWcuJBKOjmQQumg84kjb2LbjJE0KhjXQj9QlgGV2fgeoRT6e/Tn/Ku9lp9zCQyqHVZkf40qKOITlcux4//GjHJK81eGokKhjCcMbnef+h0rEcQ2mO2rfUaAMXrynhPEaHC1LWtwwl15aYP3xp94gUVf3pYPFpa/JlyfIFDP68fHV0xz1ZLcBgx+pQCDUCPR8Lb+JroKKNkES3zBWHaMzHQ3fke1NdcSOxMYICbzYzPCogj+PgCfrH0xGioF5LRwwacoW25T5sARRCZzP5fTHSKf1vtpXVr3AMepaURwfJPk8A6axagd6BfTKoNmU5GEdblod9XwO4WyRKNkWyw60qKi6fVq
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PU1PR03MB3062.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(136003)(396003)(39860400002)(366004)(346002)(451199021)(66476007)(4744005)(7416002)(8676002)(8936002)(5660300002)(41300700001)(4326008)(316002)(64756008)(76116006)(91956017)(66556008)(66946007)(83380400001)(85182001)(71200400001)(26005)(186003)(6506007)(6512007)(478600001)(6486002)(2906002)(66446008)(38070700005)(86362001)(38100700002)(36756003)(2616005)(54906003)(110136005)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V3B3L3FUN242NlV3RW5BamZNbWdXQy96bDhMNmVzVGlkb3NzOHhsWWNDNURj?=
 =?utf-8?B?ZGV2eE4vVlVidUc3b0VMRjBJR1NRQjlQek9yV0dtY3RYNE4yQ3Z1S2ZJZVZZ?=
 =?utf-8?B?SmUxNWFidy8xUUhQS1FMT0o0bU1Yc2Yxd0FpQlhheVlhZ3Y1aVFIcVdwbmkw?=
 =?utf-8?B?Sks2cTZZUzZsZkppSDRZSW9ENi8xb0g4Kzl0c0ZkSzhESE1hQlZJWCtvOEx1?=
 =?utf-8?B?WFJnd1RVeXpNT1RiQUJxSlp3clVSZlpzZkdpZXp3SCsvYzlNVjhvU2tQUUla?=
 =?utf-8?B?YWtJU0p2YXpkcUpwdHhoS0p1QkhEMDJObG5xekQ0bzMxaldjeE5zZ0xxYXM4?=
 =?utf-8?B?NjQ1MlVWNUZPM043YVhTTWs3TUZ4K2Y1YWRUY3JWMStKV1oxU0NJRjFBcTBL?=
 =?utf-8?B?OStOYkdZTDdlV3B3U0R5VHJ6aDJxTm5obU8zeS8xWDkvSzllcWVSM3lXVVpE?=
 =?utf-8?B?NUxPL2dGekFCMTdpeVcvaG11T0UwZjhmWkRCMWt2WDVNWkU1UDBITy9haXVm?=
 =?utf-8?B?V2FFTjZyY2l4a2NtTklTbFZ4RUozMjNuMzUyd0tnNzBMOGRHdVZzcGhHWmJC?=
 =?utf-8?B?aWNSZWU5a1BRamlQZ0Znam5TL3lLTG8vMW1haFdxM28vYllZeVpjSFczbk1J?=
 =?utf-8?B?L0lVUlVYUm1oWEJXbU15cS9mNXVoZkEzb0dMYVo0VmsvaUszUU00ZFlUeFpX?=
 =?utf-8?B?Y0FaRko3eDhpYXBpREF0UWVNQis1NXZTV3VTYWpJdEV5WWduN2xNenc3b3hX?=
 =?utf-8?B?TlJMWGp1bVE5emNFQmorM2c0T3ZVenVBYjBXbGhMOGY0SHEvKzBRSXYrRHBo?=
 =?utf-8?B?cGFrNHRiVzByVk4xazR2M05JNVh5OGNWR3lGR0Q1Yk83YUw5MWg3Uzc5bFFv?=
 =?utf-8?B?cDZDb1ZYVitIVUlVVEZlYVRJUTB2cDRQT3JUMHRycy9hSHoxQnFOanNWeEE5?=
 =?utf-8?B?Rlg5UUFEM1dUY0MzcEttNUZ1eUI5M1lzckxqOEpwZExHQ3pTVzJIQVhTelhU?=
 =?utf-8?B?UDNVYWxRZTJVZTdiYzF3bDZNUUtuOXdqd2g3VjUrWndhWVNraVpzOU5vclNo?=
 =?utf-8?B?aXE0Y3lVZHNnRlJjUXlYSzhZSCtDclBJbGhjQ2M2Q1VSV3BYQlZndG1yN3Ba?=
 =?utf-8?B?cklsYWR1LzQ3dU1FbGFXOFUyeDVJZVR2cy91UnFVbmhKQ1BDa0tEa3hRLzlF?=
 =?utf-8?B?NjhEcXRJS0VLdy9SWmx6NWxGM0lNUWgwek0zb2xyM3JvVEZjNkR2QVpLYkMy?=
 =?utf-8?B?eVJzTHYzdURBOGFiRTcwTFFiYWhNS0ZRVWlBVEFwZ2xDZUd1by82RDlpOW9p?=
 =?utf-8?B?b3IxMDFjTmhtV1FoejBwVmhJZmU2ZS9qWk5lVUtOTm1jd0VGanJnRWg4dkc3?=
 =?utf-8?B?UEd0bU5XaHdhOXgxY093aGc1allmeG5LaTBhSmwxU1RaMHl5L2IvVnAxd1Nx?=
 =?utf-8?B?SzJDcC9uNWEwak1VNmwwaHM3cXBTemlvV29MQXAvTHkxVGUrM2tKcVNYLzhv?=
 =?utf-8?B?Ri9BZEVseDlBaGxnaCtqSGhTTXA0eVJpeXJidm1LZHpyNkRNNHNBZy9oVm5O?=
 =?utf-8?B?TC8xNG56cjBTYWFYRVZmVmJUT1BhcVdvZHpwWGlWTXRIS1N6NWtWV1dWdWJh?=
 =?utf-8?B?elM4bnRnOE1lbkUxZ1lNY28zY25UZ25rWmtNbmdQcXhYMDVnaUdZTjJBQ25n?=
 =?utf-8?B?TGF2NEZSNnBXblNRUzNGN3RNa3NnZ1NaeWh1WEdmQVgyNnByWWtLQjFMN0gr?=
 =?utf-8?B?WVJFZmEvTzg5blZ1MVI3Rkk4YmtnTHo1SjE2cFBkYXkxSDlRaVg0QW1MLzVu?=
 =?utf-8?B?RGpZRjJQaytpNjZPcWxhbHFpVnZ0MVpxVnFuUzNVSlhBWXlsa1RtelJSZGtV?=
 =?utf-8?B?K2FGTTJWbUxlY0R3RHJ6eThtMVRVQXI0QTdvSU5mTmlxa2pwWkRnbUVWYUlv?=
 =?utf-8?B?Z3hpQWR3bXNoWjVSNVE0dWFmR0c5S2tsTm1mck0wZ09URWQxOTJrMzVZVDBo?=
 =?utf-8?B?NGJnc3J6YkxKZng3NSs0SGgrcmxVWHo1bVZ1WndQbVNlNTRuMXlBa1d1SnI3?=
 =?utf-8?B?V01lZjN0b2EvaUtYVGJhZHBMcVRlTGRKcCt0MTZzVHVlY2pRbVFtd244YkRt?=
 =?utf-8?B?MVdOeTh5L29vdVdKUUdka1pwTnpHSTZEemN5b0kxWHJhNFVyR0NlNkx1QzNn?=
 =?utf-8?B?SWc9PQ==?=
Content-ID: <F68C461E5C38814C9C6F87C730F3FA57@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PU1PR03MB3062.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e0bfc60-c4dd-4814-a932-08db509b6399
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2023 14:40:52.4114 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GuaTniJuFL3JoHqNPScP/PoDPiNTO5DMx692eUbrYTCaceUiCRyjIAeJZwYl2XKNWNHKjSByCaJyBg8f/m4a2u94EYp9cyboNFmUwAB9ZxA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB5995
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_009_745636304.1459119617"
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "wenst@chromium.org" <wenst@chromium.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_009_745636304.1459119617
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpJiMzMjtBbmdlbG8sDQoNCk9uJiMzMjtTYXQsJiMzMjsyMDIzLTA1LTA2JiMzMjth
dCYjMzI7MTQ6MzUmIzMyOyswMjAwLCYjMzI7QW5nZWxvR2lvYWNjaGlubyYjMzI7RGVsJiMzMjtS
ZWdubyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtFeHRlcm5hbCYjMzI7ZW1haWwmIzMyOzomIzMyO1Bs
ZWFzZSYjMzI7ZG8mIzMyO25vdCYjMzI7Y2xpY2smIzMyO2xpbmtzJiMzMjtvciYjMzI7b3BlbiYj
MzI7YXR0YWNobWVudHMmIzMyO3VudGlsDQomZ3Q7JiMzMjt5b3UmIzMyO2hhdmUmIzMyO3Zlcmlm
aWVkJiMzMjt0aGUmIzMyO3NlbmRlciYjMzI7b3ImIzMyO3RoZSYjMzI7Y29udGVudC4NCiZndDsm
IzMyOw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtNYWtlJiMzMjt0aGUmIzMyO2NvZGUmIzMyO21vcmUm
IzMyO3JvYnVzdCYjMzI7YW5kJiMzMjtpbXByb3ZlJiMzMjtyZWFkYWJpbGl0eSYjMzI7YnkmIzMy
O3VzaW5nJiMzMjtiaXRmaWVsZA0KJmd0OyYjMzI7bWFjcm9zJiMzMjtpbnN0ZWFkJiMzMjtvZiYj
MzI7b3BlbiYjMzI7Y29kaW5nJiMzMjtiaXQmIzMyO29wZXJhdGlvbnMuDQomZ3Q7JiMzMjtXaGls
ZSYjMzI7YXQmIzMyO2l0LCYjMzI7YWxzbyYjMzI7YWRkJiMzMjthJiMzMjtkZWZpbml0aW9uJiMz
Mjtmb3ImIzMyO0xVVF9CSVRTX0RFRkFVTFQuDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1NpZ25lZC1v
ZmYtYnk6JiMzMjtBbmdlbG9HaW9hY2NoaW5vJiMzMjtEZWwmIzMyO1JlZ25vJiMzMjsmbHQ7DQom
Z3Q7JiMzMjthbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20mZ3Q7DQoNClJl
dmlld2VkLWJ5OiYjMzI7SmFzb24tSkguTGluJiMzMjsmbHQ7amFzb24tamgubGluQG1lZGlhdGVr
LmNvbSZndDsNCg0KUmVnYXJkcywNCkphc29uLUpILkxpbg0KDQo8L3ByZT48IS0tdHlwZTp0ZXh0
LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5v
dGljZQ0KICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGlu
IHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJl
IGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhl
bXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVk
IHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFu
eSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5n
IG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykg
YnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5
IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0
aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZQ0KIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUt
bWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5
IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiAN
CnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVt
LCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkg
b3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_009_745636304.1459119617
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQW5nZWxvLA0KDQpPbiBTYXQsIDIwMjMtMDUtMDYgYXQgMTQ6MzUgKzAyMDAsIEFuZ2Vsb0dp
b2FjY2hpbm8gRGVsIFJlZ25vIHdyb3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBu
b3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJp
ZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250ZW50Lg0KPiANCj4gDQo+IE1ha2UgdGhlIGNvZGUg
bW9yZSByb2J1c3QgYW5kIGltcHJvdmUgcmVhZGFiaWxpdHkgYnkgdXNpbmcgYml0ZmllbGQNCj4g
bWFjcm9zIGluc3RlYWQgb2Ygb3BlbiBjb2RpbmcgYml0IG9wZXJhdGlvbnMuDQo+IFdoaWxlIGF0
IGl0LCBhbHNvIGFkZCBhIGRlZmluaXRpb24gZm9yIExVVF9CSVRTX0RFRkFVTFQuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8DQo+IGFuZ2Vsb2dpb2Fj
Y2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEphc29uLUpILkxp
biA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4NCg0KUmVnYXJkcywNCkphc29uLUpILkxpbg0K

--__=_Part_Boundary_009_745636304.1459119617--

