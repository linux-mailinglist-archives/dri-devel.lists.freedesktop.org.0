Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3AF77DAA3
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 08:49:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C037310E2E8;
	Wed, 16 Aug 2023 06:49:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A089510E2E8
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 06:49:31 +0000 (UTC)
X-UUID: 09b470ae3c0111ee9cb5633481061a41-20230816
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=PYXlItB6v0Xa2Nd0TKqB4BRn35d2M0xTS8J9T1dRQNs=; 
 b=lRQLQQWOQWSnDknpVV/wz/LkRFzFT9pLpDQu9cwT/Q5pkLAMrc/PZGXx4y6QcFATfmuzg2t/Kf1EolscvsGSk53LkCI2e8STC2Q05lOLaj/9thCtzvEwKYPqToc3vHnwuBH3NFB53WfC7Az3ufqMIm66/Ozq9nAIy5ww6miWxAs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31, REQID:c6c790b3-f2e0-45cf-93af-b1c0594a9561, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:0ad78a4, CLOUDID:f411d312-4929-4845-9571-38c601e9c3c9,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 09b470ae3c0111ee9cb5633481061a41-20230816
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1343958390; Wed, 16 Aug 2023 14:49:25 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 16 Aug 2023 14:49:24 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Wed, 16 Aug 2023 14:49:24 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KgYY6XVy5ypdJKMyatqiVoNceszXpSUm3Dr1pP6VhZWm0Kkf8dWchKHblbnwv1vEaa7qvPtSoIC5muZy/QC3mit8JQwW3GDU2oHGU9ij+6HjILpem8+qrKCkSr034eIlihPJ2mGempehK194u47IKY3hEXgRQogsuLhjzc1gCZIqYlRIxQSjeshhGxmucZUaVzu50jHa/vGOUURTwEQQw7+f59B//y68Ah3bJ72gsiJuX06l3WxFUJifADYnKboXbR2GV2H+pYjwVoW+55uuA/hx/nsku7S1ELqo5hszh9m1eUn0EgVJV09+tostKeB5NhtniNmJIen6Z9WNgtgz0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p2zs2hkEuHvdYQnuvLHmevrQc59UrIGWyRE+tGtmhUk=;
 b=gLOL1h6823rvxqK2PwdWmVai0kJRM63/teHUnwWPZyiN10JlWRwksK8S77/CkAOgXS8zteueWBk6xcgm2iylgTYJiAsiiQXj7rkdPQF1aChPBoWmrJbIIMnmsICdH1fDlmOP0wXkTiOhdjr2Rd1xN28Iy8QBwtnlcfe9R8zBOSSzPa8vRzO97KLd6w55gpeTdNsUKSSal8cD6ifCCaWmsUG8kjCwDz5eq3963X1m7bjry9KIFgOZUcXOABKyUNjQsuCVSHUb+Xb17H6MpcYO9nSmMkKWR855I7E9eZ+xdGdaZrd2CyASSZZusOqm7GGchuQ1U1hMZ+f32PJROxamTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p2zs2hkEuHvdYQnuvLHmevrQc59UrIGWyRE+tGtmhUk=;
 b=P/YotiLGUw2uHtYKSBqVba0Y9ZGsPLWtH6/qN0scZXvEXH/ArxNozH4P5Gk9e4L+EoaOIUSWwiiRKH4J+sFi5+uUGsh9yZxY8cEmWO7491+jUsBy2fDoCmYlNx1IEHHNP7LejnaG7QpUjAZwhz3aDSTrmteNWUUf53eh2VVamr8=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB7328.apcprd03.prod.outlook.com (2603:1096:101:123::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Wed, 16 Aug
 2023 06:49:21 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::d126:7f34:9e4f:a95]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::d126:7f34:9e4f:a95%4]) with mapi id 15.20.6678.022; Wed, 16 Aug 2023
 06:49:21 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?U2h1aWppbmcgTGkgKOadjuawtOmdmSk=?= <Shuijing.Li@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?=
 <jitao.shi@mediatek.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v4, 1/3] dt-bindings: display: mediatek: dp: Add compatible
 for MediaTek MT8188
Thread-Topic: [PATCH v4,1/3] dt-bindings: display: mediatek: dp: Add
 compatible for MediaTek MT8188
Thread-Index: AQHZzoEPd3SY9Hkp9kuhWXwiy7nyL6/sfo+A
Date: Wed, 16 Aug 2023 06:49:21 +0000
Message-ID: <25b048feb8cc02e449c4f4b6caf67586e82167f1.camel@mediatek.com>
References: <20230814072842.28597-1-shuijing.li@mediatek.com>
 <20230814072842.28597-2-shuijing.li@mediatek.com>
In-Reply-To: <20230814072842.28597-2-shuijing.li@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB7328:EE_
x-ms-office365-filtering-correlation-id: e7b6e91a-b749-4ed4-8d71-08db9e24ebd1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IMC/R3Y0et5AKvt7ku0uyTnOeJUnO3nssGF+PCovjEdr5eBd61hbbhk3wgMEHqZYSskXk/b4zEpne0mh98LTyniKk/GgryOYYG6eXoCN7iVDrVpECdZIinVf2drDsA6t2Si4Qamat1zpDnK0u6SJZS4/pHQCBrRHEV7bA7cfLB4Z78pwXt7G0lpErabxZbOq91zyXvodpuiPh8h386Lpkx/WafwcnooOfQ05JE41z57b4O+All7yKNK8qgResD0lxg/6rxDCo/WXanUrUGwdsqiw4GRn6DQEySrTw2YLeENm4zF+DaUi+/UsQMnuQs/E0NBWoopQOHs1akKKMPnQNfkYoHINpzo4VDbcUvYHXrgj8FB89zLI9/RBhQqibbmqMPDUG2qENicvJHbip0H2BeNff79/Ddd7iufMSF+a1Jo6b4lmKztIa4BBNPkk8/72Pb/zPuh1B19u8Z0d+pEv1Ru63RD+N64Jo2ET3ZApOdVrGA5xfV8Mmi8WQtdemIobXgpbzqYsBqVoXEs0MAqhChdf105bCbtOioqu+b0gxPO3tYTsaVMAEWyphKMbPtsYLLuo3tP4xgB8vKX0dlEUMl56wfG0yS1Gi6EKvDnnLJOfxK3pvglCn9xpjqVVBhs9AsTSO8hMvCOFiNxWX4AiM/Y9w2dLZwB9dTJdBSwEVa3LR4nNw5LrDQWZJagkAWdOY+qXbI9uZaItP9pC6ElRmQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(376002)(366004)(346002)(396003)(1800799009)(451199024)(186009)(316002)(921005)(110136005)(66946007)(54906003)(64756008)(66446008)(76116006)(66476007)(66556008)(122000001)(12101799020)(966005)(41300700001)(5660300002)(8936002)(8676002)(38070700005)(38100700002)(4326008)(7416002)(2906002)(26005)(478600001)(86362001)(6512007)(107886003)(85182001)(6506007)(71200400001)(36756003)(6486002)(2616005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Vkk2aFNkM3Q1VXIyMW5meXJQTzdFaW45ZWhsUXZiZ0pnazdoT1B2bldLdnRo?=
 =?utf-8?B?QVpQL25xNmpkWFRJV3lYNFB4SGtteEs2RkZNaHZsbnM4ZEd6OVBVbW9kdHlt?=
 =?utf-8?B?ZjdhK2FiaWh0d2pvQkw3NzVoQVpyeFFjQVMzWTJrQlUzbmRXZlJsdzFOSDBO?=
 =?utf-8?B?WUxqUFVPbi9Yc2M2MVQ3cm9iamVKOVpHNms4dE03dXkrUnZLQi9YWko5QVBn?=
 =?utf-8?B?WWsxaUYxUzc1aldRNXZnUmNXRkNZOXFZTUlQZzE2QVpTdWFETGdDVitBL0lM?=
 =?utf-8?B?UGhKbmxCUnhibUhDOUhYUTlrWW1oME00SlN0YmpEZ2pIWXdyZTRmNzRCd2s1?=
 =?utf-8?B?MTREbXROQUNjYzhrb0JvcXg2cXA0Q0hRNFczRmVxNkJSOXkvUTUxMzg3Y1M5?=
 =?utf-8?B?V0JjSmdDUUVRK0p0Qk5KbnZDNGtwWm9iVXJlNjRHUGhIRXRna3YxRTduTDl5?=
 =?utf-8?B?MHZXU3d6K2RwSUo1RXVMYU1QMUVuNkl3N094UGZCc0sydHZjUG5vRzh0WjRn?=
 =?utf-8?B?UzUwVithT1Q5WVFkbDNZUldDdGNRYld5NUYwQVBYVXVYeld0M1R4U0xnc2R6?=
 =?utf-8?B?Q2F2V0hEdnNlVVdqd2JnSVBvVzFrWGt1UURJYzZWWW5oUUUxTHJsSGRHOFl6?=
 =?utf-8?B?RzdMY3JoajdlMEFya0xCdVZyVEwxTzVsN0JJU0JIV2FYTlV4NFZFTlFEckVS?=
 =?utf-8?B?alA2c3ZIYXhPNlUvcnJ1RUR2TXJCb2VnWTZBT2FoOVZtcEQ1Sk92QnF0ZG8r?=
 =?utf-8?B?YTdUNjJhemdlQ01CZFp3VkpKbUtxRURWa3NKbmNMNHdINVZnRGp2eGdVbnF5?=
 =?utf-8?B?cVRpVlJ6d1hUemloZ01hdTZtTEZULzZKWkUxM0wwTnZkb2dNcVJVTW8yUGc2?=
 =?utf-8?B?enVKeXlVdE1oUGpBTVZXYURlOElLQ2M5TFNKUVpQdG1WWkJYSWNBSGdnRFVk?=
 =?utf-8?B?akVaUDZjVWNWWmZvVmxkaDlCblFKd1dIcHN5T3hMdEQvbUFSYVh4Sll0TGFs?=
 =?utf-8?B?UlArd2hjNGlNd2tIdnF3UkdzQnBKRlZ2bTFLcFpNNDFZWG1tdldLUUd4UGpy?=
 =?utf-8?B?S1Y5aG9TL1hvU2hQQzhHclJPb3dTQUZoR3lsa1VraEI3L2hZUXNSSGRseDN6?=
 =?utf-8?B?b2UrMmVYTDFpVnBrSlVQNkxPNUUzclFCeDBxbXFpVGZsSGROTFlSVUpaTUto?=
 =?utf-8?B?TE55ZVZQc1lKTmdJNldMZlRQb2dINTE3NlRjVTMrbFdMKzFwbW1DRkNLOXVK?=
 =?utf-8?B?ZUJJSk5FeGNJMGEyVVhoOVdBeEFGdE05ZS92VUgvNUozODFCTDRnRVlyc3V4?=
 =?utf-8?B?MkhjVGw1Yk9tK0JHaWtMWkRXNm9aQzlEWnlqOUtDUWM5R3Y0WkswZ0tRY3li?=
 =?utf-8?B?UUZlL1p2Y2ZkTWNkSC9HLzBoamdYUnFWdlcySDFZUjZzbS9WUGgvNlE0RzNv?=
 =?utf-8?B?RTdpcUVWZWJoM3VJSXpudUdvaVdKZ2dwYWNwWXV3dlFMYVp1MG1hcmx2czk0?=
 =?utf-8?B?YUF1MXlTcCsvWTJ6endiTm9nU1hUNHFIcVN5dkVQLzV0M3FKUjkxb1NGYmhm?=
 =?utf-8?B?WHJSWUJMN2JxUmFOQWtYR05Kd3ViekcxbklOVUlDTHJLUmJCUjR6dHZBY29G?=
 =?utf-8?B?ejgzdSsvYWs0WUhXUExqOWk5SmlHbkFBMUovQ2dLQmszaXc0Y3I2V2ZtUEo4?=
 =?utf-8?B?Sm9oRXdWL21oQVVLYmRFdE5vRlR1ZmNOY3BIY0lSMk8zQ2QvVVpjeFdqTEsz?=
 =?utf-8?B?WFcvQ2orbk9uTHdwQVJBcmRibDl0Si9rVDcrN1VEcklwczRHYTRHY1FUd3cw?=
 =?utf-8?B?c01pVk1mQ3BQN3BhK3JpVHlTYTJVNTRacTJheFE0anppMVFjcnN5cDJQL1Vv?=
 =?utf-8?B?dHhWUUpmdlZSeVRqZE16QzJONEp2NWk2MlJZL2x1R0szRlVoTTNvK3cwMlpH?=
 =?utf-8?B?Tm9SSGdEL0dhb1k1YjBZQkp6ZDE5d0x1ZzV2QmxaSDErWC8vWGQrQUlodWdO?=
 =?utf-8?B?ZnBuU05NbnFxQ1kyYmFpd21FMmNraGRUTnRKV3ZET0FtUG1NQ1BrS1pidEcv?=
 =?utf-8?B?Qng1YUNNcDJmL2tnd0prWmgzV1FwU0JGTlVkWGhITXNyMXZ4RWJqaCtNYTRi?=
 =?utf-8?Q?4Tkhz0vgcakciR6CghAPhauZR?=
Content-ID: <1FB1C235EF1F5E4391A75D0170F8DD73@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7b6e91a-b749-4ed4-8d71-08db9e24ebd1
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2023 06:49:21.5079 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: evkrlZ3X8G77Zm7Lq+phbNYUC21Tq6SEUW245tTjoFs6PldhipDZZZAWF8w80pppFnanTq6MjBrxDWAtDbXtiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7328
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_002_968443210.1863259685"
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
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_002_968443210.1863259685
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpLCYjMzI7U2h1aWppbmc6DQoNCk9uJiMzMjtNb24sJiMzMjsyMDIzLTA4LTE0JiMz
MjthdCYjMzI7MTU6MjgmIzMyOyswODAwLCYjMzI7U2h1aWppbmcmIzMyO0xpJiMzMjt3cm90ZToN
CiZndDsmIzMyO0FkZCYjMzI7ZHQtYmluZGluZyYjMzI7ZG9jdW1lbnRhdGlvbiYjMzI7b2YmIzMy
O2RwLXR4JiMzMjtmb3ImIzMyO01lZGlhVGVrJiMzMjtNVDgxODgmIzMyO1NvQy4NCg0KUmV2aWV3
ZWQtYnk6JiMzMjtDSyYjMzI7SHUmIzMyOyZsdDtjay5odUBtZWRpYXRlay5jb20mZ3Q7DQoNCiZn
dDsmIzMyOw0KJmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO1NodWlqaW5nJiMzMjtMaSYjMzI7
Jmx0O3NodWlqaW5nLmxpQG1lZGlhdGVrLmNvbSZndDsNCiZndDsmIzMyO1NpZ25lZC1vZmYtYnk6
JiMzMjtKaXRhbyYjMzI7U2hpJiMzMjsmbHQ7aml0YW8uc2hpQG1lZGlhdGVrLmNvbSZndDsNCiZn
dDsmIzMyO1Jldmlld2VkLWJ5OiYjMzI7QW5nZWxvR2lvYWNjaGlubyYjMzI7RGVsJiMzMjtSZWdu
byYjMzI7Jmx0Ow0KJmd0OyYjMzI7YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEu
Y29tJmd0Ow0KJmd0OyYjMzI7QWNrZWQtYnk6JiMzMjtLcnp5c3p0b2YmIzMyO0tvemxvd3NraSYj
MzI7Jmx0O2tyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZyZndDsNCiZndDsmIzMyOy0tLQ0K
Jmd0OyYjMzI7Q2hhbmdlcyYjMzI7aW4mIzMyO3YyOg0KJmd0OyYjMzI7YWRkJiMzMjthJiMzMjtt
ZWRpYXRlayxtdDgxODgtZWRwLXR4JiMzMjtjb21wYXRpYmxlJiMzMjtwZXImIzMyO3N1Z2dlc3Rp
b24mIzMyO2Zyb20mIzMyO3RoZQ0KJmd0OyYjMzI7cHJldmlvdXMmIzMyO3RocmVhZDoNCiZndDsm
IzMyOw0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC9jNGE0YTkwMC1jODBkLWIxMTAtZjEw
ZS03ZmEyZGFlOGI3YjVAY29sbGFib3JhLmNvbS8NCiZndDsmIzMyOy0tLQ0KJmd0OyYjMzI7JiMz
MjsuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRwLnlh
bWwmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3wmIzMyOzINCiZndDsmIzMyOysr
DQomZ3Q7JiMzMjsmIzMyOzEmIzMyO2ZpbGUmIzMyO2NoYW5nZWQsJiMzMjsyJiMzMjtpbnNlcnRp
b25zKCspDQomZ3Q7JiMzMjsNCiZndDsmIzMyO2RpZmYmIzMyOy0tZ2l0DQomZ3Q7JiMzMjthL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVr
LGRwLnlhbWwNCiZndDsmIzMyO2IvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZHAueWFtbA0KJmd0OyYjMzI7aW5kZXgmIzMyO2ZmNzgx
ZjIxNzRhMC4uMmFlZjFlYjMyZTExJiMzMjsxMDA2NDQNCiZndDsmIzMyOy0tLQ0KJmd0OyYjMzI7
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRp
YXRlayxkcC55YW1sDQomZ3Q7JiMzMjsrKysNCiZndDsmIzMyO2IvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZHAueWFtbA0KJmd0OyYj
MzI7QEAmIzMyOy0yMSw2JiMzMjsrMjEsOCYjMzI7QEAmIzMyO2Rlc2NyaXB0aW9uOiYjMzI7fA0K
Jmd0OyYjMzI7JiMzMjtwcm9wZXJ0aWVzOg0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7Y29tcGF0
aWJsZToNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtlbnVtOg0KJmd0OyYjMzI7
KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOy0mIzMyO21lZGlhdGVrLG10ODE4OC1kcC10
eA0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOy0mIzMyO21lZGlhdGVr
LG10ODE4OC1lZHAtdHgNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7LSYjMzI7bWVkaWF0ZWssbXQ4MTk1LWRwLXR4DQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOy0mIzMyO21lZGlhdGVrLG10ODE5NS1lZHAtdHgNCiZndDsmIzMy
OyYjMzI7DQoNCjwvcHJlPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxwcmU+KioqKioqKioqKioq
KiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlICoqKioqKioqKioqKioqKioqKioqDQpU
aGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGlu
ZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHBy
aXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBs
aWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUg
ZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJp
YnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGlu
Y2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMg
c3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90
IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZSANCnRoYXQg
eW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhl
IHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0
ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRh
Y2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRl
bnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+
PCEtLX0tLT4=

--__=_Part_Boundary_002_968443210.1863259685
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFNodWlqaW5nOg0KDQpPbiBNb24sIDIwMjMtMDgtMTQgYXQgMTU6MjggKzA4MDAsIFNodWlq
aW5nIExpIHdyb3RlOg0KPiBBZGQgZHQtYmluZGluZyBkb2N1bWVudGF0aW9uIG9mIGRwLXR4IGZv
ciBNZWRpYVRlayBNVDgxODggU29DLg0KDQpSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlh
dGVrLmNvbT4NCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogU2h1aWppbmcgTGkgPHNodWlqaW5nLmxp
QG1lZGlhdGVrLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogSml0YW8gU2hpIDxqaXRhby5zaGlAbWVk
aWF0ZWsuY29tPg0KPiBSZXZpZXdlZC1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPA0K
PiBhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+DQo+IEFja2VkLWJ5OiBL
cnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+DQo+IC0t
LQ0KPiBDaGFuZ2VzIGluIHYyOg0KPiBhZGQgYSBtZWRpYXRlayxtdDgxODgtZWRwLXR4IGNvbXBh
dGlibGUgcGVyIHN1Z2dlc3Rpb24gZnJvbSB0aGUNCj4gcHJldmlvdXMgdGhyZWFkOg0KPiANCmh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvYzRhNGE5MDAtYzgwZC1iMTEwLWYxMGUtN2ZhMmRh
ZThiN2I1QGNvbGxhYm9yYS5jb20vDQo+IC0tLQ0KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkcC55YW1sICAgICAgIHwgMg0KPiArKw0KPiAgMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdA0KPiBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRw
LnlhbWwNCj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRp
YXRlay9tZWRpYXRlayxkcC55YW1sDQo+IGluZGV4IGZmNzgxZjIxNzRhMC4uMmFlZjFlYjMyZTEx
IDEwMDY0NA0KPiAtLS0NCj4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9tZWRpYXRlay9tZWRpYXRlayxkcC55YW1sDQo+ICsrKw0KPiBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRwLnlhbWwNCj4g
QEAgLTIxLDYgKzIxLDggQEAgZGVzY3JpcHRpb246IHwNCj4gIHByb3BlcnRpZXM6DQo+ICAgIGNv
bXBhdGlibGU6DQo+ICAgICAgZW51bToNCj4gKyAgICAgIC0gbWVkaWF0ZWssbXQ4MTg4LWRwLXR4
DQo+ICsgICAgICAtIG1lZGlhdGVrLG10ODE4OC1lZHAtdHgNCj4gICAgICAgIC0gbWVkaWF0ZWss
bXQ4MTk1LWRwLXR4DQo+ICAgICAgICAtIG1lZGlhdGVrLG10ODE5NS1lZHAtdHgNCj4gIA0K

--__=_Part_Boundary_002_968443210.1863259685--

