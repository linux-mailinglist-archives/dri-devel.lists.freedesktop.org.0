Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C1B7A7274
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 08:01:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFC1E10E0BE;
	Wed, 20 Sep 2023 06:01:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EC3B10E0BE
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 06:01:07 +0000 (UTC)
X-UUID: 132659fa577b11ee8051498923ad61e6-20230920
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=b96ndry6ydff1HPS7gj/WFSkrz6je4w/eRLaQcG8gVc=; 
 b=UGe235CDtcvAOz0dMXwcHuLwMXr/h922A/uNF7xU5kuyU7IwlVcDQpeGwt2kXvjyVZcR4Afc9tP1l4weXKFcplkMuCuCQ7bPaRMa7XmQBs8ekDj34y/b0BpRLSj1SaNPtnQBEsQbEeoLnqhECFOv5V16nfNKHi8ghRIpNmgP5QI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:a849ad73-083b-4a43-96e4-6ea3678e9e86, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5f78ec9, CLOUDID:9e7fe8ef-9a6e-4c39-b73e-f2bc08ca3dc5,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 132659fa577b11ee8051498923ad61e6-20230920
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1293127521; Wed, 20 Sep 2023 14:01:00 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 20 Sep 2023 14:00:59 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Sep 2023 14:00:59 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SzzUa+PKJyYQsKSVSwyyU8Z0YB5vFX92qisnr6vfFZHtlVH0x2IxTtPs0lCoCgHLx1VIrlS7Lv9pfhYKucMJKkKEJ9jVtHLaHVGrLpFAcIRp9ceD/SvSaByylkUm5AWe/IedM20+5WvEwtouNbfrtSwwua4iz/QMa3+iDTYxlgqBszOHruQJFtPfdPvjt6K6dMEPq4uqvxOpPmFrapHYdgd1z0DRzct+YaluMeLwd2DzUmVfBB2YyTqUuhH2jJ26FvWQV4li3m+WiUsGFSWRt8eRFyjm5UD/SYSe7X7R+pZ2Y5lcybzkObCGcG07QpQBHCfVuJJNHPzdxcg+ux1+lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tckp63eZq4d9Nfo/DcIBj3ct0EYqPYfOpr1vdt8FuhY=;
 b=fp/wAOEcH0s+pKBbW/ZXciKkkg2lEkfHXBg70v275c4/LaufU8QrlEDyrmluS3VK/4ENc0Ya8Eh71VjxDpuYzMyHfpILDmsDgnPhOtaHspU4+51C+Zslxf1Eus+bPIl3JF9tj2n7bfyMhWd8c0Bk1HSsOoJFVp8Gj+myThThxfEWzqH4cv65nzwUtElGRediIM+oO8OIV4lOlK6/kUpPFvxPebmsTrzWodVdiynbD1I6iG8dlomYW4sossGKML671l0zXne3+we5QXLd+6wSH7DXcWjB0ijUSxkNYeG6oMaZvAaX2H0JNHhpPFsu1yP2X+IA4b8UQZYxssxO9RP+uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tckp63eZq4d9Nfo/DcIBj3ct0EYqPYfOpr1vdt8FuhY=;
 b=b+hgx5PfX3xV4keaMQAx3I64wZVMFWWxJI2LVPB7xDhYtb9deLhd63JYAquZlhA1MEFrib+0ymGRoY5yjNon1Fi5vbTb8ZnQb0RMu4pHTCAn8JZ11ONBXWUa9NcclAaIEUoQxcneK8tZEar9Doiz49e7cnaMtwYjreLrPjIe5wE=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYSPR03MB7706.apcprd03.prod.outlook.com (2603:1096:400:413::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Wed, 20 Sep
 2023 06:00:56 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9c2c:c08a:212f:e984]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9c2c:c08a:212f:e984%6]) with mapi id 15.20.6792.026; Wed, 20 Sep 2023
 06:00:56 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [RESEND PATCH v6 01/20] dt-bindings: display: mediatek: ethdr:
 Add compatible for MT8188
Thread-Topic: [RESEND PATCH v6 01/20] dt-bindings: display: mediatek: ethdr:
 Add compatible for MT8188
Thread-Index: AQHZ5IOpllqLDOuYakOF2HJ3eFO0T7AjRpoA
Date: Wed, 20 Sep 2023 06:00:56 +0000
Message-ID: <1b5ad730c689894ac202c171c46135f9a8ff8d57.camel@mediatek.com>
References: <20230911074233.31556-1-shawn.sung@mediatek.com>
 <20230911074233.31556-2-shawn.sung@mediatek.com>
In-Reply-To: <20230911074233.31556-2-shawn.sung@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYSPR03MB7706:EE_
x-ms-office365-filtering-correlation-id: f8ce35a7-f2f4-432a-0fe1-08dbb99ef48e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3pbkbR+W7ZQcyfxc4o3s/2DZVBWedZlUQyd30G1gvTDX5ejRJqPv2pZkHkKzxHQfOi86Na87LeW2B4s1qC8PF+076yK+mzrO2HjJmAnW4zjmw7VYvNwoPlmBgml1sqnOyoPkrCs+AVR/H0WVxiLQaRY0n7nxpfelTWgoDk5Wo1IrYV+n36b1FN+KDr3oz6Go/+tmlPDvfa8tLO4VmYJm64dgphILpRSH7+GF+CRRLovXbf2hGyhihpuAp6tstYaKHZGOQf7OOlCiXbBV+t46K5xLAFR+VV+XBF3ZMIWPLWUcQPgFsziwScCNyHX9/xih4TZqoiuHqNpfIJ/ZmkG42wRxnnvgxQLeho0fNvFG4qnBX8ThHT4sAvwQ9OMS8B4s66ZXXdDKJusT3Hh/AYyzUWwDgCRZAb3VBEu29FA/WtSEUMXNBtC5n+e5DeE+4kT+9XSTb4HVGIZVQOHmgHtsduJm1aOHv8qunR16TaTOkhBuKJxuByxWHlGpADlljFjcxJVcZP+BSV5HIDPBsfkI+Q9AfMX1aOrJokYAwjB7IlSxqaGRsOc5aJLXxVRL8+xLF/sXuDQAcwL8r6DEXJLasdluw5OsSD/lJuFOhoS4J6NDMziPDrT65mo1XW20P+Y7fY12yjyEMuUMZPF5L4+JI36uVoUZGYEkF6/1BvelpNQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(376002)(39860400002)(396003)(136003)(451199024)(1800799009)(186009)(85182001)(66556008)(6506007)(66946007)(66476007)(6486002)(64756008)(66446008)(316002)(38070700005)(38100700002)(83380400001)(36756003)(110136005)(76116006)(86362001)(6512007)(54906003)(2616005)(478600001)(26005)(8676002)(71200400001)(7416002)(2906002)(8936002)(4326008)(122000001)(5660300002)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OGNZY28ra0VITXRnY1dHREJQbVhYU3l6QjZpV01weXhuVzB6Q1dVTnpJSCtO?=
 =?utf-8?B?UkZwQUJrbVdqNFJlSW1UM2xtMXZuQlVBY09sTU1RcVYyamNTdUVvQUhOWkxB?=
 =?utf-8?B?WktwT3h4OUMrdGlMWEwxUUhta3VETlBPaHZwZWZxTXBpUEJHWmpUaGNGWmJx?=
 =?utf-8?B?anR0U3VkZjJ0TjQzRFdhMDBoS1J5K1NUbHdRTkk1emppOHkydzNuRFlvQ3gz?=
 =?utf-8?B?OW91T1RLM3ByVS9FMXdBSTE3VlRYOEpVbUpYWWRnTUt3c2U2Yk1kb3gzMTNZ?=
 =?utf-8?B?S0tWeERORThsSjdid0gzczJYN0s5UE5aRDIyZzFoODdHcmc4MTZPK0oxUndk?=
 =?utf-8?B?YnptNXk5aUdjSkNkaDJiYVFSU3kzZTQwQzQ4d0dPQ21DUGF1Zk0ranhLeDUz?=
 =?utf-8?B?Snlqb3h0b25KaFJEZk8zcml1c0x0VUhPL1FES3crOGtMYkI4d0lRSG1GbDcz?=
 =?utf-8?B?ZHVKckxIZUUyK0dyVzR5eGhVVDRvQjNnTDdsTURTeEZhMFhEOVV3dHpxTVNU?=
 =?utf-8?B?SUhUTHRTQkg5NllTZ2NydUtndU04S1N6ZUZWajNRSTIya2ZOMjJUakM4V0Y5?=
 =?utf-8?B?bTVwVFEyYXFPN2lNVXg4YTZkd0ZEdTFEblVEeC9wTnozTGgxMFRVRktVdzYx?=
 =?utf-8?B?clVjcjRRemc0T1FvUzdSWHJaQTZsbXpTd3VhdXhycm8xWFBkeXNFTFdMejFY?=
 =?utf-8?B?M2lYc1lhQ2Z0TWFnWVMvQkwwT2tsc2hxZFd0S0JYVzlTNzlscDI1UXF3QzM1?=
 =?utf-8?B?a3AzdFZmVjRFMkFuQkc4NEZRWThOM1BCc2RwRm4vMm4zTGRPQ3FMV05LeEFK?=
 =?utf-8?B?djV1M2J1Nk44ZmRLVlN6UFZTazVjdTFvRFZEZTRLaFpwWndyRTZQcUQzcTZj?=
 =?utf-8?B?aG44R0VWS01ZMmlsVi9hZy9aUWlCT3lEckQ2b28vVG1lWjMvck1SVU56ZDZR?=
 =?utf-8?B?UzI1Y1N2TDhNY2dEcEJlUVp5d2R0M0VGZHZtaEE0RDh1S2xiQytIVmZNSGlS?=
 =?utf-8?B?bzFkTmp6QXR5Q0lreVl6cmNVcmZwcHhWcVRuNXNUYUQ4T1JvVjc1OUpBSlJ5?=
 =?utf-8?B?TEtSRWNmdCtTSVJRQlNOSWNzV0ozMDNwYzhDWWJ5TlYvYjNKVE9ZVEpaMXFN?=
 =?utf-8?B?NEtKRCtEN3VnLzVQUGcwc2VrVFViRkJPTGN6NFZHZVN3SGozU1BIampWSU9z?=
 =?utf-8?B?UStUNlFCSGxyd01HT1c1aXN3N2RlcWh3VXl4ZThvS3JXY2t2dmFtOHpkVmdC?=
 =?utf-8?B?MHNoZEdiQ3RWQk1OVGJqeVpnMzhRazJjaFpDcXFySEhVdkNZaFVxa0tEYzZK?=
 =?utf-8?B?MkRZM05OZzdKcmM3ZHFlOWUwM3ozZlNTMll3Qys5ZG4yd0llL1RkTHlRcE9u?=
 =?utf-8?B?RlEwamdFM0xwaWNYR0ZNei9jaDh5TDF3T1dwRkRnTmVDK0ZBSUpTdnFTQnFS?=
 =?utf-8?B?M1lDN3h5MTgydC9VNVYyclNNK1RwVEFLU0JUMGRnVTl3VEFrcUNnNE05c1VM?=
 =?utf-8?B?dmlKVDlJQTE5a0lpdGJTVGR2S21vU2FPVmhQQWtnTm5rOVFIanRGNWJITDRm?=
 =?utf-8?B?SDVnUGQxTWdFM3NJd0p3eXJvRkQ0ekFNbFQrRHFHL0E3KzEyL1NLK1phdy9l?=
 =?utf-8?B?THlmNlJ2V2lLNThPUFZkcGhnZ21QV1Mxb2EwdVFkY25NTndpZkE0T21SbkxM?=
 =?utf-8?B?THdLZlYxckYwSVRlelByZmV6TUdiZUNTRXlJNjV0Rk5ZUCthbzljbHM3NDNn?=
 =?utf-8?B?L2IySGMvQXZCVjJCcjQyUzdDZEJTRUNqNTZWazVtRjVCVG1FVml1a3Rjck5n?=
 =?utf-8?B?dkhudmtBZVdKRWtnclhhZTJ5NUZxTzBTWVF2QU9BTXRjNEUwbnl1MkV1LytK?=
 =?utf-8?B?ZmtPcFUxaW0vZjBTYnlzYmRJWnZ6aGlDaDlvZ3VrYVZmU1d3YzdEQ1ZJbzY1?=
 =?utf-8?B?ZlVpWFYwZm5mTXhzZ3pVYUUzL3Foa2tUK2w2VWFYM01Fc0IySnpjVUsxd0pu?=
 =?utf-8?B?NzBFT2g5NHRKKytDbERkek9TN0hUK2V5UGxycTVyVXhuY1pwOEY0dGl1R0tG?=
 =?utf-8?B?TzhaRFVER25ZSHBUUWJURUxwNktXK281YlJwTUNlbHJZNk1mMGVZRmRJcTI3?=
 =?utf-8?Q?GrGBMyjuCMEqIqAN9WGpTqZp6?=
Content-ID: <1990F33AD589BB488869609D1DE4F413@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8ce35a7-f2f4-432a-0fe1-08dbb99ef48e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2023 06:00:56.1924 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O+0zku2lVXwI4qqZFacB3S++D+MKuCpX/b9gMgdRq6p/wwfDl7DMoIgXaMCqiFhZlYyciHzA/BboECYHoYxzYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7706
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_008_1630980637.605087458"
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
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_008_1630980637.605087458
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpLCYjMzI7SHNpYW8tY2hpZW46DQoNCk9uJiMzMjtNb24sJiMzMjsyMDIzLTA5LTEx
JiMzMjthdCYjMzI7MTU6NDImIzMyOyswODAwLCYjMzI7SHNpYW8mIzMyO0NoaWVuJiMzMjtTdW5n
JiMzMjt3cm90ZToNCiZndDsmIzMyO0FkZCYjMzI7Y29tcGF0aWJsZSYjMzI7bmFtZSYjMzI7Zm9y
JiMzMjtNZWRpYVRlayYjMzI7TVQ4MTg4JiMzMjtFVEhEUi4NCg0KUmV2aWV3ZWQtYnk6JiMzMjtD
SyYjMzI7SHUmIzMyOyZsdDtjay5odUBtZWRpYXRlay5jb20mZ3Q7DQoNCiZndDsmIzMyOw0KJmd0
OyYjMzI7UmV2aWV3ZWQtYnk6JiMzMjtBbmdlbG9HaW9hY2NoaW5vJiMzMjtEZWwmIzMyO1JlZ25v
JiMzMjsmbHQ7DQomZ3Q7JiMzMjthbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5j
b20mZ3Q7DQomZ3Q7JiMzMjtBY2tlZC1ieTomIzMyO0tyenlzenRvZiYjMzI7S296bG93c2tpJiMz
MjsmbHQ7a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnJmd0Ow0KJmd0OyYjMzI7U2lnbmVk
LW9mZi1ieTomIzMyO0hzaWFvJiMzMjtDaGllbiYjMzI7U3VuZyYjMzI7Jmx0O3NoYXduLnN1bmdA
bWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYjMzI7LS0tDQomZ3Q7JiMzMjsmIzMyOy4uLi9iaW5kaW5n
cy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGV0aGRyLnlhbWwmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7fCYjMzI7Ng0KJmd0OyYjMzI7Kysr
KystDQomZ3Q7JiMzMjsmIzMyOzEmIzMyO2ZpbGUmIzMyO2NoYW5nZWQsJiMzMjs1JiMzMjtpbnNl
cnRpb25zKCspLCYjMzI7MSYjMzI7ZGVsZXRpb24oLSkNCiZndDsmIzMyOw0KJmd0OyYjMzI7ZGlm
ZiYjMzI7LS1naXQNCiZndDsmIzMyO2EvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZXRoZHIueQ0KJmd0OyYjMzI7YW1sDQomZ3Q7JiMz
MjtiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21l
ZGlhdGVrLGV0aGRyLnkNCiZndDsmIzMyO2FtbA0KJmd0OyYjMzI7aW5kZXgmIzMyOzgwMWZhNjZh
ZTYxNS4uNjc3ODgyMzQ4ZWRlJiMzMjsxMDA2NDQNCiZndDsmIzMyOy0tLQ0KJmd0OyYjMzI7YS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRl
ayxldGhkci55DQomZ3Q7JiMzMjthbWwNCiZndDsmIzMyOysrKw0KJmd0OyYjMzI7Yi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxldGhk
ci55DQomZ3Q7JiMzMjthbWwNCiZndDsmIzMyO0BAJiMzMjstMjMsNyYjMzI7KzIzLDExJiMzMjtA
QCYjMzI7ZGVzY3JpcHRpb246DQomZ3Q7JiMzMjsNCiZndDsmIzMyOyYjMzI7cHJvcGVydGllczoN
CiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyO2NvbXBhdGlibGU6DQomZ3Q7JiMzMjstJiMzMjsmIzMy
OyYjMzI7JiMzMjtjb25zdDomIzMyO21lZGlhdGVrLG10ODE5NS1kaXNwLWV0aGRyDQomZ3Q7JiMz
MjsrJiMzMjsmIzMyOyYjMzI7JiMzMjtvbmVPZjoNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjstJiMzMjtjb25zdDomIzMyO21lZGlhdGVrLG10ODE5NS1kaXNwLWV0aGRy
DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7LSYjMzI7aXRlbXM6DQom
Z3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjstJiMzMjtjb25zdDomIzMyO21lZGlhdGVrLG10ODE4OC1kaXNwLWV0aGRyDQomZ3Q7JiMzMjsr
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjstJiMzMjtj
b25zdDomIzMyO21lZGlhdGVrLG10ODE5NS1kaXNwLWV0aGRyDQomZ3Q7JiMzMjsNCiZndDsmIzMy
OyYjMzI7JiMzMjsmIzMyO3JlZzoNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtt
YXhJdGVtczomIzMyOzcNCiZndDsmIzMyOy0tDQomZ3Q7JiMzMjsyLjE4LjANCiZndDsmIzMyOw0K
DQo8L3ByZT48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiogTUVESUFU
RUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZSAqKioqKioqKioqKioqKioqKioqKg0KVGhlIGluZm9y
bWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0K
YXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2Vk
LCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBs
YXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0
ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwg
cHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcg
aXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5
IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRl
bmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUgDQp0aGF0IHlvdSBoYXZl
IHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIg
DQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFu
ZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMp
IGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRo
aXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_008_1630980637.605087458
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEhzaWFvLWNoaWVuOg0KDQpPbiBNb24sIDIwMjMtMDktMTEgYXQgMTU6NDIgKzA4MDAsIEhz
aWFvIENoaWVuIFN1bmcgd3JvdGU6DQo+IEFkZCBjb21wYXRpYmxlIG5hbWUgZm9yIE1lZGlhVGVr
IE1UODE4OCBFVEhEUi4NCg0KUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+
DQoNCj4gDQo+IFJldmlld2VkLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8DQo+IGFu
Z2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4NCj4gQWNrZWQtYnk6IEtyenlz
enRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4NCj4gU2lnbmVk
LW9mZi1ieTogSHNpYW8gQ2hpZW4gU3VuZyA8c2hhd24uc3VuZ0BtZWRpYXRlay5jb20+DQo+IC0t
LQ0KPiAgLi4uL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZXRoZHIueWFtbCAg
ICAgICAgICAgfCA2DQo+ICsrKysrLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdA0KPiBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGV0aGRyLnkNCj4gYW1s
DQo+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsv
bWVkaWF0ZWssZXRoZHIueQ0KPiBhbWwNCj4gaW5kZXggODAxZmE2NmFlNjE1Li42Nzc4ODIzNDhl
ZGUgMTAwNjQ0DQo+IC0tLQ0KPiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGV0aGRyLnkNCj4gYW1sDQo+ICsrKw0KPiBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGV0
aGRyLnkNCj4gYW1sDQo+IEBAIC0yMyw3ICsyMywxMSBAQCBkZXNjcmlwdGlvbjoNCj4gDQo+ICBw
cm9wZXJ0aWVzOg0KPiAgICBjb21wYXRpYmxlOg0KPiAtICAgIGNvbnN0OiBtZWRpYXRlayxtdDgx
OTUtZGlzcC1ldGhkcg0KPiArICAgIG9uZU9mOg0KPiArICAgICAgLSBjb25zdDogbWVkaWF0ZWss
bXQ4MTk1LWRpc3AtZXRoZHINCj4gKyAgICAgIC0gaXRlbXM6DQo+ICsgICAgICAgICAgLSBjb25z
dDogbWVkaWF0ZWssbXQ4MTg4LWRpc3AtZXRoZHINCj4gKyAgICAgICAgICAtIGNvbnN0OiBtZWRp
YXRlayxtdDgxOTUtZGlzcC1ldGhkcg0KPiANCj4gICAgcmVnOg0KPiAgICAgIG1heEl0ZW1zOiA3
DQo+IC0tDQo+IDIuMTguMA0KPiANCg==

--__=_Part_Boundary_008_1630980637.605087458--

