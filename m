Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 409EC819B41
	for <lists+dri-devel@lfdr.de>; Wed, 20 Dec 2023 10:20:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BE2510E169;
	Wed, 20 Dec 2023 09:20:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C068F10E169
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 09:20:46 +0000 (UTC)
X-UUID: 0a2e80b29f1911eea5db2bebc7c28f94-20231220
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=y7K+aTpYG9XpBltmDgxIBbRv0HWr77xyysOXaDZN4HU=; 
 b=jcmj7Zz+M7bY/Gx6sI0O6r26ECvE/ouX7IHJikUqcpwG+IwpX5Ruc+9R+7OMf+H+IR6j94FVwTAP9I5htikA5MlZAacb8OgG1/GGXxV39SPIrYRZKRgz1NlFviT8cM8RYtDnhgYmIIqjIG+aT2vZs+lZWw/wDeIa8QGLyRwvDv8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35, REQID:937f2000-80c8-4915-ae10-5585a6048629, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5d391d7, CLOUDID:fadb797e-4f93-4875-95e7-8c66ea833d57,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 0a2e80b29f1911eea5db2bebc7c28f94-20231220
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <moudy.ho@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 596297617; Wed, 20 Dec 2023 17:20:38 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 20 Dec 2023 17:20:37 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Dec 2023 17:20:37 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B18wCnFpfyj9GckFmcITJ2/8vW7TQ/efMaCh49TTtLMoh31jveMqm0u2MspYdud8f7FfXJiHHH6/0HVTwouIrs+I+MrrwNR48yGePDEiLwzirAPpl6hiBz84DEPl3j4nye9uAnYjQ6UwyqKfj8Rb2VeyOJxBXkRFFv9mxtJ9iskJjSX3INJJRNjXy9MJOkK1oKxGurIA+tJ34mbM8t9n9lIbR/A3+vDOamPiQgiZdaMKvfTGpAgUW0oayJqtAdbZRHYgeQLybIrK3ugPcuY0ng+1D28xHugndsJMJpiIlzuuBwy7l0boWAnJd5CpSwARTGWe1UWIlO/Wj1EAD71bxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y7K+aTpYG9XpBltmDgxIBbRv0HWr77xyysOXaDZN4HU=;
 b=jhqC5FM7+T5GZ9iTkcpvCP7q51YODzvI6g71FKiY6jGBgOUXry71fNHbIyg0WLePb/aVTj9SE4aBu+DBKUh4jS1LTi8edPuaYGAxlEJ+ykPaCH4E5wZYtYjk/Eu3cXbib3S72DGKdt/ADPDzUdrFf2Q/0YPYcc+9g2wHPuurUvufpRZ50imHUt1EwuLsjtJZqeOzrQKGv5SK1gwSRcZhxpaBe7aC+pruYRyFLpNhABWJZuBXGWnNjnpYssn+HZPIqhyQSLjENIwTktgQ5ffevmB96XaoKLC93wuPStwHBRG1F6hG9G8on0DTbhGDWVWm4BcSepHicPQbQMuzhAUoiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y7K+aTpYG9XpBltmDgxIBbRv0HWr77xyysOXaDZN4HU=;
 b=gtWD+VMSAz6a/NLt8UHzCcRlCWVIwRANXwY+xM5/T6Kv7Xtu4/eO6/YbJiVVyFAsXa7pQjybgxYyYwpI64l4mr/hV4gkzsWPVIbm3B/Q/J4dKkYucKDvHevxy1n0UCDCapzgb5E6IOUVgsNLj1MZYFiWU8n0Nbni7N5VbLkjOZA=
Received: from TY0PR03MB6356.apcprd03.prod.outlook.com (2603:1096:400:14c::9)
 by TY0PR03MB6631.apcprd03.prod.outlook.com (2603:1096:400:210::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.37; Wed, 20 Dec
 2023 09:20:33 +0000
Received: from TY0PR03MB6356.apcprd03.prod.outlook.com
 ([fe80::a7c7:5df8:f1de:9663]) by TY0PR03MB6356.apcprd03.prod.outlook.com
 ([fe80::a7c7:5df8:f1de:9663%7]) with mapi id 15.20.7091.034; Wed, 20 Dec 2023
 09:20:33 +0000
From: =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "mripard@kernel.org" <mripard@kernel.org>, "mchehab@kernel.org"
 <mchehab@kernel.org>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, "hverkuil-cisco@xs4all.nl"
 <hverkuil-cisco@xs4all.nl>, "airlied@gmail.com" <airlied@gmail.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v9 00/16] introduce more MDP3 components in MT8195
Thread-Topic: [PATCH v9 00/16] introduce more MDP3 components in MT8195
Thread-Index: AQHaC9T/Ok7poeuX1ke5MJU4wPOzBbCyM+aA
Date: Wed, 20 Dec 2023 09:20:33 +0000
Message-ID: <80feea63d4da5f9e942ecd8b4902a6f552394c0f.camel@mediatek.com>
References: <20231031083357.13775-1-moudy.ho@mediatek.com>
In-Reply-To: <20231031083357.13775-1-moudy.ho@mediatek.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY0PR03MB6356:EE_|TY0PR03MB6631:EE_
x-ms-office365-filtering-correlation-id: 0a34b370-b790-47c8-57e0-08dc013ceb60
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MJtS/tUTB2OdollopiEl8fY+tOi8q+vQ5Z5iUQaC8WdZedlf7y1baDftInobLDBGtaCwYE6PZgrqmzrtk5J5O2bTh8wJyIRHTWx+yVeG35EwI7jFersJGPf7qeBqWD0uhcdqAZty+yR1+eQqOUmdYbmshokEojAjzmbVPLsTEpITaPBnMgjq7gV16qymVs3kL91mL3FJw++oqVT88+aUW5Tsgz4xydnhMweMxYCGrc1i3OXuOaSJKvfi7+likICsazeiDtgZ/p5ais/gHKxKsG8Xf+Y9bWu6jdVOD9Eaz8OMdtPlBABlAw5FboNAv8tZ2yQC/q6IfGWhNoklDIS/5l0OEmJgJRsf/piROJVa/cj4sBUFBYW0Hukl1oZOdVInO5wbAed6ikUEXLww6drqjF3NmS8KKrZ9jIeDW5o0/1Byf9r1tZMvkmQtA6U4OT7rKTmE68c4t07TyEuMzQDGzdUn/5AtAg/34SdcVxfqtsllNkKKhcBL6slzwt9sXX4dvTs8lGURuVOqUWNkCwwyd3pHpT3p61R8wRG4w4V0PBGDnstFvhjJYXjOu1eGmZ1eqc7j5SVZ4g7yJOva3VMQ36QbSZVzWmpThBZ3oqI+2m0fIpYI7mZswYq961Hku4Pt/qkr5pOffARUN7BqhT+jU796AmB/b5/bztFtgLuW+oixa9DUjUn2x0LYS3l8f53df0zctroqm5yujpopfgKwmWAN7u/d7YpaHlq01R+eDBw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY0PR03MB6356.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(136003)(39860400002)(346002)(376002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(38070700009)(921008)(7416002)(36756003)(38100700002)(4001150100001)(85182001)(2906002)(122000001)(41300700001)(86362001)(83380400001)(8936002)(478600001)(8676002)(4326008)(71200400001)(966005)(6486002)(2616005)(26005)(76116006)(66476007)(316002)(6506007)(54906003)(5660300002)(66946007)(66556008)(64756008)(66446008)(110136005)(6512007)(99106002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Ky9hZS8yWGVTY3hlUkk0QmRUMzJTSHlEVm9lSVp0Vytoek1xWE1yMnJKL2RB?=
 =?utf-8?B?TndocDM5aEtKdW90NGlWUFpITng0S1I0UXhxUWxPbjNreGtWeEVPRlFEeGl2?=
 =?utf-8?B?RlV0dXVkRjZ0Y3pJb1BVMDdoTU9aSFZ0NDZORkVwaWdUU3JoKzhJS0tFaFdn?=
 =?utf-8?B?dFErb0gzYnlsZFJMd2kzNmdlSVgvNDMvYmh1N3pJa0diNjJWcnh1YWFLSEFR?=
 =?utf-8?B?SmlXS3lGM0gra3pYTXBqNVlvbTNaSmNQTy9IbWJkNHR2Q3AvRlRRc0Z1aExH?=
 =?utf-8?B?NHYyVXNObVpIUCtRcGJNclhlL3FxeXZEb0FnbkFzZFgyZGczekRPelpyY0Iw?=
 =?utf-8?B?NjIybUIzYXI5bUl0NkZPK3N6MkF4Ull1L2ExdSs2NEdGVWM5TFpaYmNBbTdx?=
 =?utf-8?B?MzRHQW9qelpvZmJKR1ZkT3ExQ2dKbjZsalRmV2tSMFV3elU0SnorNkZ0SklE?=
 =?utf-8?B?SkpXMEhha2RyWFdXalJoVFpXOUpKMnhmVWJaVkd2eHJYN2RyWU52TGlXdVBa?=
 =?utf-8?B?dmVSSjY5bDlDSGFkZWNUQzhQTS8vLzVrMVpXYjhkeFRQeEdiZ2RVMEN1UzVC?=
 =?utf-8?B?bjE3SzV6UTdIUjFBUDg5ZzlhNWN4MFVmaTNsRHQ0d0RMbTlRQVJLUWpCN2I4?=
 =?utf-8?B?bFB1SHA3U3U1VFQyc2lGNy91eUZlR3c0djRzNFpNYlhFU3RqMHN4aXdRNnNE?=
 =?utf-8?B?ZWcrNzZKb3dTVzVSd3g5WU5Zb1NlYlU1UTdkYTBEcHRQWkpLU3dWYW9SMTFQ?=
 =?utf-8?B?SmJCdWhNZ3JlaVlOeXdYOHpQQURkUFBUa0lWSi9TVlFESlk2R3paR1ZWM1ky?=
 =?utf-8?B?Q3B5WmZ1TGJrblgwYjMwa0lYTnZaZnZqSXFueU9aRFpiVk5xZm50VUtKdWkv?=
 =?utf-8?B?bGsxMWt4NkpDSEd6cHZCdjBSV2VlNTFCM3dpYjNKK2JCT1ZzamZCNWtWTE5m?=
 =?utf-8?B?Vmd3MXBBOURjaHovTXkwUDNHcjZ3cXdFWTZOQVhOaEJSdjVwSHl3WVJwTlR1?=
 =?utf-8?B?Q2RhQlNKUG0yaWdRY3ErRWsrc0VGcmlsdFFXS1dham9pYVBjM1hvTlZkTlNY?=
 =?utf-8?B?RHRPblZUb0JvOWZZOGlrSm5pQWprT0hyMVRsR3RhdEFJUEdpSTNBQVNSejgr?=
 =?utf-8?B?TFVqbXZKM284bE44QVVSRTU1V2NSdUdIRHlqTkNwQ25GZjJzOEU4cFpmYjJS?=
 =?utf-8?B?aHlhRTIxbDYraUEzR28xclR5UGdPMU13L3l2NTBOZGJUY1NqS0QrZG5VdVlZ?=
 =?utf-8?B?ZTRlcEZtTHpjZk5pc0tjV0I0ZXFCMDhtekxITm56MTc2Zm5Oem5KSjdaZXFT?=
 =?utf-8?B?V0Y3QmxpbUtweWd1U3ZlNThPZEhkOVV4WFJ3ZXYwOTNNSUgrOUx2bG1KUHEw?=
 =?utf-8?B?RTk0ZTNCRTVsQnVCeGd3MFcxbVgvck9YQXI2U0huMnJ3cW1SbStUN1F4RTkx?=
 =?utf-8?B?N2Z1YU94R0h4M0E5Z3ZJUUEvR3ZtQzQzVm9Ic0xKS1phb3ZEU3dZd3UzaGVz?=
 =?utf-8?B?c3NPNUxqVWlXRVF2Ym5oMStZNDlYN1ZuYTdwWHZwMWJkQ0pjZW5TWjlyeUQ0?=
 =?utf-8?B?YW1UMVcya3lnZmpkODdFWXZaa1I5SlRDNzliQzRkd2l3bXhoMHBUcElFcDVr?=
 =?utf-8?B?eXBQOC9YK3Y2U3B0RlIyS1NNSnl0Q3Y1OGd6enJvUE93Um9zRTI0SEFyUUc3?=
 =?utf-8?B?eFFwaDcrOTBGSWhCYzAyNCtUUVRxdWNCbmNYNDEveVN1Y21xS1prWWwxQzhu?=
 =?utf-8?B?WkVwLzFUWGUrQ0hiaWpDS3M3OTRleWsvSDVkcHdXeFJZRWpvdTU1ZCtkUXRY?=
 =?utf-8?B?WUwxUzlQdHVCSlZlSWFJNjA3MUhlUElzNmkwclNoREgvVjlZcnpGdndFMFcv?=
 =?utf-8?B?ejc2dlBxUlNoeXAxeUp4TEViNGdOQ0k4ODVyZjhjYUxJekhSVlkxWjJleldw?=
 =?utf-8?B?cGlXTzJmV2R0eTBFdjFtNGZPVVlhWnNNY1picGxvU0M5UWJmSmwrZUYyMGwz?=
 =?utf-8?B?NnM3c0l4cmRBOGdaVERGU1dLd2V6ZmMzdW5OakpjeGxMeFQzMDBYM0hXcUo5?=
 =?utf-8?B?SkpZdHk1ai8wb084ZzdnellzcXZ5dzE1emw1a0licHQvWW54aUhwYUFNeXB4?=
 =?utf-8?B?MlJvQ1d4WGI3cXROR0kyZWFVNldiSkRVblA1UDlmYXFYR2dla0UwWjZlKytF?=
 =?utf-8?B?R0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2680D1F6567C09409D441BBD52163AD9@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY0PR03MB6356.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a34b370-b790-47c8-57e0-08dc013ceb60
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2023 09:20:33.8248 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eMbdygLQ6ZriTht9kOjNC3CTVNQFdq+O0eSwjPDIC3lV5OJBEma+Gh09nNVcbWAJiUQIYnGtl/Bwg7zk+1TcBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6631
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--15.138700-8.000000
X-TMASE-MatchedRID: Nail4dlEBNHUL3YCMmnG4pRrnSy7UTtb0HjeANoeuJ1b6PBUqmq+Uhz6
 jMcFLTORkR7FS8SlQ4ZNO6zg+DuNuUkkO4zqprNOhK8o4aoss8pKPIx+MJF9oxHfiujuTbeddd3
 vE6bWkcGB1bQ3lewQOofOMvbCpEpcAGmlGcKv1CpT46Ow+EhYOFAI6wCVrE3vRL9uhZIYy13H5Z
 Ph+OIwZ3JTOKyI/+1iXVsdzvRWuzJA90k3OkvQziVypP66BP0QjI6qXkf2FQ3J2i9a4v4pV74jd
 hRUbhxwR+PrL64BEuZeXwsHKcwo88RBLZ5x+SkXcX5PeMxy2v5aNaxZBRbNWr6majHNXd7Go8WM
 kQWv6iUVR7DQWX/WkYGsNX5eg/aOVnRXm1iHN1bEQdG7H66TyF82MXkEdQ77jrpxDiS+g9+GX+9
 vZsMj2fNjnN8jXEiBtByJGbBoPU2FcSJub/xxnw==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--15.138700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 507069D77E8B3A83CC38C9D33916B9E40712165883B417FA3CCD244359C2FE362000:8
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

SGksDQoNClRoaXMgc2VyaWVzIHNob3VsZCBkZXBlbmQgb24gYW5vdGhlciBzZXJpZXMgYXMgZm9s
bG93czoNCk1lc3NhZ2UgSUQgPSAyMDIzMTIxNDA1NTg0Ny40OTM2LTEtc2hhd24uc3VuZ0BtZWRp
YXRlay5jb20NCg0KDQpUbyBpbmNsdWRlIHRoZSBtaXNzaW5nIGNvbXBhdGlibGUgbmFtZSAnbWVk
aWF0ZWssbXQ4MTg4LXZkbzEtcmRtYScgZnJvbQ0KcGF0Y2ggWzEvMTJdIGluIHRoZSBtZW50aW9u
ZWQgc2VyaWVzIGluIG5leHQgdmVyc2lvbi4NClRoZSBvcmlnaW5hbCB0YWdzIHdpbGwgYmUgcmVt
b3ZlZCAocGF0Y2ggWzIvMTZdKSwgYW5kIGtpbmRseSBhc2sNCmV2ZXJ5b25lIHRvIHJldmlldyBp
dCBhZ2Fpbi4NCg0KU2luY2VyZWx5LA0KTW91ZHkNCg0KT24gVHVlLCAyMDIzLTEwLTMxIGF0IDE2
OjMzICswODAwLCBNb3VkeSBIbyB3cm90ZToNCj4gQ2hhbmdlcyBzaW5jZSB2ODoNCj4gLSBSZWJh
c2Ugb24gbGludXgtbmV4dC4NCj4gLSBEZXBlbmRlbnQgZHRzaSBmaWxlczoNCj4gICANCj4gaHR0
cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhdGVrL2xpc3QvP3Nl
cmllcz03OTc1NDMNCj4gLSBEZXBlbmRzIG9uOg0KPiAgIE1lc3NhZ2UgSUQgPSAyMDIzMTAyNDEz
MDA0OC4xNDc0OS05LXNoYXduLnN1bmdAbWVkaWF0ZWsuY29tDQo+IC0gRm9sbG93aW5nIFJvYidz
IHN1Z2dlc3Rpb24sIHRoZSBudW1iZXIgb2YgJ2Nsb2NrcycgYW5kICdtYm94ZXMnDQo+IGl0ZW1z
IGFyZQ0KPiAgIHJlc3RyaWN0ZWQgdXNpbmcgdGhlICdtaW5JdGVtcycgaW4gWzIvMTZdIGFuZCBb
My8xNl0uDQo+IC0gUmV2aXNlIHRoZSBkZXBlbmRlbnQgbXQ4MTg4IGRpc3AgcGFkZGluZyBjb21w
YXRpYmxlIG5hbWUgaW4NCj4gWzE2LzE2XS4NCj4gDQo+IENoYW5nZXMgc2luY2Ugdjc6DQo+IC0g
UmViYXNlIG9uIGxpbnV4LW5leHQuDQo+IC0gRGVwZW5kZW50IGR0c2kgZmlsZXM6DQo+ICAgDQo+
IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRlay9saXN0
Lz9zZXJpZXM9Nzk3NTQzDQo+IC0gRGVwZW5kcyBvbjoNCj4gICBNZXNzYWdlIElEID0gMjAyMzEw
MjQxMzAwNDguMTQ3NDktOS1zaGF3bi5zdW5nQG1lZGlhdGVrLmNvbQ0KPiAtIENvcnJlY3QgdGhl
IGJpbmRpbmdzIG9mIHRoZSBmb3VyIGNvbXBvbmVudHM6IEZHLCBUQ0MsIFREU0hQIGFuZA0KPiBI
RFIuDQo+ICAgVGhlIG5hbWVzIG9mIHRoZSBmaXJzdCB0aHJlZSBhcmUgZXhwYW5kZWQgaW4gdGhl
IHRpdGxlLCBhbmQNCj4gICB0aGUgZGVzY3JpcHRpb25zIG9mIGFsbCBmb3VyIGhhdmUgYmVlbiBl
bmhhbmNlZC4NCj4gDQo+IENoYW5nZXMgc2luY2UgdjY6DQo+IC0gUmViYXNlIG9uIHY2LjYtcmM1
Lg0KPiAtIERlcGVuZGVudCBkdHNpIGZpbGVzOg0KPiAgIA0KPiBodHRwczovL3BhdGNod29yay5r
ZXJuZWwub3JnL3Byb2plY3QvbGludXgtbWVkaWF0ZWsvbGlzdC8/c2VyaWVzPTc5MjA3OQ0KPiAt
IERlcGVuZHMgb246DQo+ICAgTWVzc2FnZSBJRCA9IDIwMjMxMDA2MDczODMxLjEwNDAyLTUtc2hh
d24uc3VuZ0BtZWRpYXRlay5jb20NCj4gLSBEaXNjYXJkIHNwbGl0dGluZyBSRE1BJ3MgY29tbW9u
IHByb3BlcnRpZXMgYW5kIGluc3RlYWQgdXNlICdhbGxPZicNCj4gdG8NCj4gICBpc29sYXRlIGRp
ZmZlcmVudCBwbGF0Zm9ybSBmZWF0dXJlcy4NCj4gLSBSZXZpc2UgdGhlIGluY29ycmVjdCBwcm9w
ZXJ0aWVzIGluIEZHLCBIRFIsIFNUSVRDSCwgVENDIGFuZCBUREFQDQo+IGJpbmRpbmdzLg0KPiAt
IEFkZGluZyBTb0Mtc3BlY2lmaWMgY29tcGF0aWJsZSBzdHJpbmcgdG8gY29tcG9uZW50cywgbGlr
ZSBXUk9UIGFuZA0KPiBSU1osDQo+ICAgdGhhdCBhcmUgaW5oZXJpdGVkIGZyb20gTVQ4MTgzLg0K
PiAtIEZpeGVkIHR5cG9zIGluIFRDQyBwYXRjaCBhbmQgZW5oYW5jaW5nIGl0cyBoYXJkd2FyZSBk
ZXNjcmlwdGlvbi4NCj4gDQo+IENoYW5nZXMgc2luY2UgdjU6DQo+IC0gUmViYXNlIG9uIHY2LjYt
cmMyLg0KPiAtIERlcGVuZGVudCBkdHNpIGZpbGVzOg0KPiAgIA0KPiBodHRwczovL3BhdGNod29y
ay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtbWVkaWF0ZWsvbGlzdC8/c2VyaWVzPTc4NjUxMQ0K
PiAtIERlcGVuZHMgb246DQo+ICAgTWVzc2FnZSBJRCA9IDIwMjMwOTExMDc0MjMzLjMxNTU2LTUt
c2hhd24uc3VuZ0BtZWRpYXRlay5jb20NCj4gLSBTcGxpdCBvdXQgY29tbW9uIHByb3BlcnRpcyBm
b3IgUkRNQS4NCj4gLSBTcGxpdCBlYWNoIGNvbXBvbmVudCBpbnRvIGluZGVwZW5kZW50IHBhdGNo
ZXMuDQo+IA0KPiBDaGFuZ2VzIHNpbmNlIHY0Og0KPiAtIFJlYmFzZSBvbiB2Ni42LXJjMQ0KPiAt
IE9yZ2FuaXplIGlkZW50aWNhbCBoYXJkd2FyZSBjb21wb25lbnRzIGludG8gdGhlaXIgcmVzcGVj
dGl2ZSBmaWxlcy4NCj4gDQo+IEhpLA0KPiANCj4gVGhlIHB1cnBvc2Ugb2YgdGhpcyBwYXRjaCBp
cyB0byBzZXBhcmF0ZSB0aGUgTURQMy1yZWxhdGVkIGJpbmRpbmdzDQo+IGZyb20NCj4gdGhlIG9y
aWdpbmFsIG1haWxpbmcgbGlzdCBtZW50aW9uZWQgYmVsb3c6DQo+IA0KaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvYWxsLzIwMjMwMjA4MDkyMjA5LjE5NDcyLTEtbW91ZHkuaG9AbWVkaWF0ZWsuY29t
Lw0KPiBUaG9zZSBiaW5kaW5nIGZpbGVzIGRlc2NyaWJlIGFkZGl0aW9uYWwgY29tcG9uZW50cyB0
aGF0DQo+IGFyZSBwcmVzZW50IGluIHRoZSBtdDgxOTUuDQo+IA0KPiBNb3VkeSBIbyAoMTYpOg0K
PiAgIGR0LWJpbmRpbmdzOiBtZWRpYTogbWVkaWF0ZWs6IG1kcDM6IGNvcnJlY3QgUkRNQSBhbmQg
V1JPVCBub2RlIHdpdGgNCj4gICAgIGdlbmVyaWMgbmFtZXMNCj4gICBkdC1iaW5kaW5nczogbWVk
aWE6IG1lZGlhdGVrOiBtZHAzOiBtZXJnZSB0aGUgaW5kZW50aWNhbCBSRE1BIHVuZGVyDQo+ICAg
ICBkaXNwbGF5DQo+ICAgZHQtYmluZGluZ3M6IG1lZGlhOiBtZWRpYXRlazogbWRwMzogYWRkIGNv
bmZpZyBmb3IgTVQ4MTk1IFJETUENCj4gICBkdC1iaW5kaW5nczogbWVkaWE6IG1lZGlhdGVrOiBt
ZHAzOiBhZGQgY29tcGF0aWJsZSBmb3IgTVQ4MTk1IFJTWg0KPiAgIGR0LWJpbmRpbmdzOiBtZWRp
YTogbWVkaWF0ZWs6IG1kcDM6IGFkZCBjb21wYXRpYmxlIGZvciBNVDgxOTUgV1JPVA0KPiAgIGR0
LWJpbmRpbmdzOiBtZWRpYTogbWVkaWF0ZWs6IG1kcDM6IGFkZCBjb21wb25lbnQgRkcgZm9yIE1U
ODE5NQ0KPiAgIGR0LWJpbmRpbmdzOiBtZWRpYTogbWVkaWF0ZWs6IG1kcDM6IGFkZCBjb21wb25l
bnQgSERSIGZvciBNVDgxOTUNCj4gICBkdC1iaW5kaW5nczogbWVkaWE6IG1lZGlhdGVrOiBtZHAz
OiBhZGQgY29tcG9uZW50IFNUSVRDSCBmb3IgTVQ4MTk1DQo+ICAgZHQtYmluZGluZ3M6IG1lZGlh
OiBtZWRpYXRlazogbWRwMzogYWRkIGNvbXBvbmVudCBUQ0MgZm9yIE1UODE5NQ0KPiAgIGR0LWJp
bmRpbmdzOiBtZWRpYTogbWVkaWF0ZWs6IG1kcDM6IGFkZCBjb21wb25lbnQgVERTSFAgZm9yIE1U
ODE5NQ0KPiAgIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiBtZWRpYXRlazogYWFsOiBhZGQgY29tcGF0
aWJsZSBmb3IgTVQ4MTk1DQo+ICAgZHQtYmluZGluZ3M6IGRpc3BsYXk6IG1lZGlhdGVrOiBjb2xv
cjogYWRkIGNvbXBhdGlibGUgZm9yIE1UODE5NQ0KPiAgIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiBt
ZWRpYXRlazogbWVyZ2U6IGFkZCBjb21wYXRpYmxlIGZvciBNVDgxOTUNCj4gICBkdC1iaW5kaW5n
czogZGlzcGxheTogbWVkaWF0ZWs6IG92bDogYWRkIGNvbXBhdGlibGUgZm9yIE1UODE5NQ0KPiAg
IGR0LWJpbmRpbmdzOiBkaXNwbGF5OiBtZWRpYXRlazogc3BsaXQ6IGFkZCBjb21wYXRpYmxlIGZv
ciBNVDgxOTUNCj4gICBkdC1iaW5kaW5nczogZGlzcGxheTogbWVkaWF0ZWs6IHBhZGRpbmc6IGFk
ZCBjb21wYXRpYmxlIGZvciBNVDgxOTUNCj4gDQo+ICAuLi4vZGlzcGxheS9tZWRpYXRlay9tZWRp
YXRlayxhYWwueWFtbCAgICAgICAgfCAgMSArDQo+ICAuLi4vZGlzcGxheS9tZWRpYXRlay9tZWRp
YXRlayxjb2xvci55YW1sICAgICAgfCAgMSArDQo+ICAuLi4vZGlzcGxheS9tZWRpYXRlay9tZWRp
YXRlayxtZHAtcmRtYS55YW1sICAgfCA4OCAtLS0tLS0tLS0tLS0tLS0NCj4gLS0tDQo+ICAuLi4v
ZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxtZXJnZS55YW1sICAgICAgfCAgMSArDQo+ICAuLi4v
ZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxvdmwueWFtbCAgICAgICAgfCAgMSArDQo+ICAuLi4v
ZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxwYWRkaW5nLnlhbWwgICAgfCAgNCArLQ0KPiAgLi4u
L2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssc3BsaXQueWFtbCAgICAgIHwgMjcgKysrKysrDQo+
ICAuLi4vYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWssbWRwMy1mZy55YW1sICAgICAgfCA2MSArKysr
KysrKysrKysNCj4gIC4uLi9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayxtZHAzLWhkci55YW1sICAg
ICB8IDYxICsrKysrKysrKysrKw0KPiAgLi4uL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLG1kcDMt
cmRtYS55YW1sICAgIHwgOTIgKysrKysrKysrKysrKysrDQo+IC0tLS0NCj4gIC4uLi9iaW5kaW5n
cy9tZWRpYS9tZWRpYXRlayxtZHAzLXJzei55YW1sICAgICB8ICA2ICstDQo+ICAuLi4vYmluZGlu
Z3MvbWVkaWEvbWVkaWF0ZWssbWRwMy1zdGl0Y2gueWFtbCAgfCA2MSArKysrKysrKysrKysNCj4g
IC4uLi9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayxtZHAzLXRjYy55YW1sICAgICB8IDYyICsrKysr
KysrKysrKysNCj4gIC4uLi9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayxtZHAzLXRkc2hwLnlhbWwg
ICB8IDYxICsrKysrKysrKysrKw0KPiAgLi4uL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLG1kcDMt
d3JvdC55YW1sICAgIHwgMjkgKysrKy0tDQo+ICAxNSBmaWxlcyBjaGFuZ2VkLCA0NDAgaW5zZXJ0
aW9ucygrKSwgMTE2IGRlbGV0aW9ucygtKQ0KPiAgZGVsZXRlIG1vZGUgMTAwNjQ0DQo+IERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLG1k
cC0NCj4gcmRtYS55YW1sDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQNCj4gRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLG1kcDMtZmcueWFtbA0KPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0DQo+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9t
ZWRpYXRlayxtZHAzLWhkci55YW1sDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQNCj4gRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLG1kcDMtc3RpdGNoLnlhbWwN
Cj4gIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbWVkaWEvbWVkaWF0ZWssbWRwMy10Y2MueWFtbA0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayxtZHAzLXRk
c2hwLnlhbWwNCj4gDQo=
