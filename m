Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F147BB2A4
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 09:50:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D0A110E28A;
	Fri,  6 Oct 2023 07:50:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A95210E28A
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 07:50:29 +0000 (UTC)
X-UUID: 01e97358641d11ee8051498923ad61e6-20231006
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=kz27PIDscDiNDr/MR8O0ubtVYC+D1u45kPfQiZgUBeQ=; 
 b=qPpYmxWBgJmT6MUibazeWOBNXOzhR+J/gaP9UX7EokB9flMwJeUav85LLfkhp9VKWlbu0XuyRCowHjMcsO1LK/U2AJYkMhnOh5wuIA0HfSqhVMKRlcJOA2Xt1OHul5nRYeZJM2cc00+r3DCCDaghLoyB5+1Ou5/+vxx2foi349I=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:3e9fac34-5f95-4f34-b1cd-5217142aa004, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-META: VersionHash:5f78ec9, CLOUDID:ac8da6bf-14cc-44ca-b657-2d2783296e72,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 01e97358641d11ee8051498923ad61e6-20231006
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 66005804; Fri, 06 Oct 2023 15:50:24 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 6 Oct 2023 15:50:23 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Fri, 6 Oct 2023 15:50:23 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aBNoU0zpdyeDrQUezZ1Qgrbb/VDUrVtosj/wssXw8Fthme+X56CX49OO0P/8tj2cZxnwTH6lnu/yUVqtWmc+ZNfn0xyQyZzyWplJ9SryNYZ3iyC1lsO4BZ3LF469mmawIFGDtW1m+W2EoFY1xWzIDwK5B0d+s4AN6Ya4oJB3x/zzDYzd3apD3fYEBWq636EEe9g109WRBmMFNJHV3veLP9rF/XUqSyF1Jbi8C1R7CkHUyBpxTnAkqWCLT91nQX12WGSuBY6S042YcqV3DikU78d4VU+SEWEJJgl+5Pr4HbFyNPhZZtsQT476kBEl9y4pUgo/ZX48mYPf0bB1ys8jcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WKjJOUZoSenRb47rIza7PSZHK1T2EkUkxEtucApaL3Q=;
 b=EnklvrnFTovWNj0sCtv5j3gZWYSQ92CsRm13UpyMybkcCs2igAimDTo3ejNH/8PDEkHegDqAjiBYU2e5qeGyDohT0XVLpR00dsRD/oFld06CCFCQoCEBUm0rKZ6sIpyMz+6e4S0MOKRwa26ZWqtoguDSV9b7xaZ3015jYSJe0jA0/snKrzbqxok4nnjkMWF9//NsY9JLqo8pEeIfmvaMzjDfrvglKUy+m1KdN0rB7uXJs7EnsSHgpq4zeMI+eIiM4XWQBVTA3SbRG6LPU+QjSzxP1ghy4sGfg9eYIMSKsmTGxFBiYD372IsmYqrEky4mepHr0VXNKpkfW6/WYiHOyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WKjJOUZoSenRb47rIza7PSZHK1T2EkUkxEtucApaL3Q=;
 b=TfJSzsYvF3VusgUjlQ389jrQPyaV12XJKueFsCW7/JCjrWnNgDukqY4h6hERWd7RiBMTk5Yio4yt9uc40QE1Ms7DRtEy8Lz2/UA1d3DpmYttFprELyljnGCJ5NhnlOmlW47oLSn9rIRuyKmgPjxMPY/s6wRYACb0vYVVtRsCE3M=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEYPR03MB7967.apcprd03.prod.outlook.com (2603:1096:101:168::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.30; Fri, 6 Oct
 2023 07:50:20 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9c2c:c08a:212f:e984]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9c2c:c08a:212f:e984%7]) with mapi id 15.20.6792.026; Fri, 6 Oct 2023
 07:50:20 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, 
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v11 7/9] drm/mediatek: Support dynamic selection of
 DP_INTF0 on MT8188 VDOSYS0
Thread-Topic: [PATCH v11 7/9] drm/mediatek: Support dynamic selection of
 DP_INTF0 on MT8188 VDOSYS0
Thread-Index: AQHZ9mw6bZNGX11RM0Om7uRdsEpCR7A8ZqiA
Date: Fri, 6 Oct 2023 07:50:20 +0000
Message-ID: <2fb9fa5915b69b381142da60d1a7ece9ca9fa395.camel@mediatek.com>
References: <20231004024013.18956-1-jason-jh.lin@mediatek.com>
 <20231004024013.18956-8-jason-jh.lin@mediatek.com>
In-Reply-To: <20231004024013.18956-8-jason-jh.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEYPR03MB7967:EE_
x-ms-office365-filtering-correlation-id: f8f6c41a-fe65-438c-c109-08dbc640e398
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8GkRSvNm3yFTHapCSXr6mkwJpX5/y1vm5QMWBbu4fg/RwVyb9ddFH3KylXguNz762rW5VEfq0+vkYyoqVo6355fXVYXIxLJOTUm0+88xz5C3YGBzKDSlaozXvLRGTFrznRQPq1thqUw7dLmM83rtY8dF2PxkPC2SpsMkxEgPhledR8NW8YikY9XRE916R6gk80GXOOtr7lozPRqhjZ2bdVmhBuk9OdfMQ2/G+sYyDijUZJA2RyA1z4vVNAbAt4YaQ5ArE4/ZSBHWctZbR2dXHnSRAQhWi4w9fnsHTr0TPJJSDaqR638HvTP7GJukhmbbB7+h+jqLvt3H42mps6MCo3uKVp66Fh6Vby0nrG0+pBi36iduQnTy0qFy9v1Q3lp7jvg46xaCt2K+L21NOByH4ryhPRqZ6tTKdVvPyhBYkxO6AfooK8Ajikn1Nd5mhLWsgWdzC0IggulrIk8zQQaPV3oId6cS/uBdADuCP8bBVMA0CTVd8L2Yvm0kUl9ptbGTqvnbZgElL0KSIszIIznIBLRZ1IyTtZXtrA9SyZfa//wdS/lwW9Pp4oRdrdio/g6eU5DodLJacd7pRxB8uOnoEhUlrKdvos3dUa9QhzZQyac7uopJeBo4/1r4bfjFHq/HP6fPAvsyK+EubZPcPcJpb4eKPZFJOZx/cymWxoiEcGU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(136003)(366004)(39860400002)(346002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(71200400001)(6486002)(6512007)(38070700005)(26005)(6506007)(86362001)(478600001)(38100700002)(66556008)(122000001)(316002)(2906002)(83380400001)(2616005)(76116006)(66446008)(8936002)(5660300002)(36756003)(85182001)(4326008)(41300700001)(54906003)(110136005)(66946007)(64756008)(66476007)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aGNsTjJURy9DWmprK1NIZ1g0MWVWS09WcExhMEpNWEZ5a056R0ZtOExUM3F0?=
 =?utf-8?B?RFJHUnR2d0VnZE9vZ1FNVmQrNnpBZ09WOUhsMkphU2lkbVJ6d0xXeUZQcmd4?=
 =?utf-8?B?NUFWV3J4MXNHOEV3WldwQVNrYllYR1hUMWF3Ukx2NklibjBjcGh3dE14UWxQ?=
 =?utf-8?B?QXRhUi9sNk05dTBYYmYvNEkyclRtaCsxdWpsYVZwRWJTRFBlaVkyenBBR3VP?=
 =?utf-8?B?Z2pKbVFhdHJSTXM3OE5FMVM1VUdGeU1qdmtUMFRnM3IvanlqdHRWb2ZVS2ZT?=
 =?utf-8?B?QTd2RHBzTUVHNXdmbE1iOG5EMkE1b0FEY0hsY1owOFhFeTB1OTN1WDl6S1FC?=
 =?utf-8?B?TFVuZkhaMlZCcEF1ZGkzSSs4UEtoa0VKd3NwMkJ2dXlEeUkxYXdkQmRUN3BN?=
 =?utf-8?B?ZjZlNUtETlBpTXZoRXlpd0dURnFSWnljUi9QNkpwMWU0dXdPMGdjdmhTZ1lD?=
 =?utf-8?B?eXNoTVdmbUZQWmZDTHhFcmk5VGJJUXVoTE1lbHg2NmpDNjRNUFcwLzB0SE4y?=
 =?utf-8?B?WENoUU5BMnpwZTNFZ1JiWDFJVnhhZzlKY1pnNTU3d0xvYWVMeW5TL1NndHdW?=
 =?utf-8?B?anVpTE1OSlFiWVhTcE1DbUVHckNBaEJqZWV2dWhyZFlIaHMwb1ZTRVZUT1Zr?=
 =?utf-8?B?YXdUd2lOWDdGOW5URlFJdHo4UFpvTnRRMzU3Nlg5TWxKU0M1V0RpakI4ZWFo?=
 =?utf-8?B?TVBZcjdReEJNakRjMUpyRVNQS0swN3VTdHhQTHNnZk9RNmVCWkR0K3AxVTkz?=
 =?utf-8?B?YkgyWGQ5aUVtNXUwWE80ZjNmTUp5SlhUdGVXc0xSMzJPN21iK0cxOUR6QUpw?=
 =?utf-8?B?NVdJRTVUR3BOSXRRWE0rRi84eUVJU3Jxam05L0IxcHE2S2RXNENXL2tFT1RN?=
 =?utf-8?B?SVVMM2srL3hhRDB5SHk3QitDS29nUVZHd05nb0ZBdVZjM096cUl3Z2w5Tk9H?=
 =?utf-8?B?bVFXeUwrT0F6LytKWWZmVXd6dlRyNXdVN0Q2Z3lUS3lCZ3ZlVDlxZEdLb3Fy?=
 =?utf-8?B?cUY0OGpuQnJXRW8vR1ZweDJyYm9ORDJBNkR3bFBIY01GWmdsOCswT0V0TG9z?=
 =?utf-8?B?YmtPS1lvc09FWWw0Qkc0b2ZDbjJTL3lMamQ0dERjc3hod3hTTEMvdkYxcmxz?=
 =?utf-8?B?OUJYVHdETlNCbGhvZEtDbFliM21sbjJISlhxdEM4dEV3QVE1QnRObXp2ZThr?=
 =?utf-8?B?MURvUGxVQW9EbnRWdkh5eWxxTUVvTlhqWlBFeFBadnpDaGxCcEZCNTRsdGx3?=
 =?utf-8?B?b2FLbDFlc0ZuMGNETndXb0Z5NHVldUV3L1RYaWwzajlESTlKMEoxaG5kM2Fz?=
 =?utf-8?B?RzMyZTJtVUpSUmNOOFljVGREQ1BZYVVOa2hlSnkrNnZoY25OWmE2K0JFTHpO?=
 =?utf-8?B?MXRWUThKU1BjWWgwL1U5L3FBOXl3NlozS1dGV2hhSWEvbDhjWndXMTBBQkVD?=
 =?utf-8?B?RVlhSUcrcEJKZlVyZGd1TDNwakViOFRBaHdvVEFiOWtGVWJHNlJKTThSMk90?=
 =?utf-8?B?b1ZiTG1XeXF2VDdqbjBOcFZwcUE2eW1sYmhuSEJ2VDNES2tRa2d4bTFVaFBF?=
 =?utf-8?B?djlBRVgwUGYwNzRKMjhPODJOOFBIdGNhdkFlVHNZbUJrbUJlUVNFOS9DZnQ3?=
 =?utf-8?B?VFprUWZYcFBVSHlGLy9Dem5zTkpUQ29rQ3ErNVBFSXVTTVFpQXJTMDE5cll6?=
 =?utf-8?B?OEFnM2xDVC81K0JLUmNLcHZWZlpLbDJBRTU3VFRKQlJFeGhDMlFhZ3k2ZTk1?=
 =?utf-8?B?T0dHQjZodXlUWnZIL0lqeDZGSDQ3d3pvQWY4RStLK0ZhdXR5MEF5bXMzVFls?=
 =?utf-8?B?TGFIejVkTWV3Sk84UGVwWGFaNDBhbnFITE8xaE8yNnhXM2o2Nlljckliellm?=
 =?utf-8?B?RlBmZ0tWVW9TTUlGTmNkOXBWRlhxdzFFZ2xEaGtLTE4xZnkvZmhob0tsbVhY?=
 =?utf-8?B?S2l6MlRVdmk0WitWU2d2TkVlbmo5K0xkUTF6b3lUSGJZeFMrZjFGdS9xT3pV?=
 =?utf-8?B?dVJPZjEzVHRzRW9KUGcvZ2w4Wk43VTZRVHJCdXJDbE5Ic25EL2t3UkxJV1hn?=
 =?utf-8?B?L1ZHNDhjM0FtblpVN3ZvR2J4MVhWbW9qOW9PT0t2Nmk5VU5LNm9wQXdKU0Np?=
 =?utf-8?Q?WXxUlZ6hRlWHBE3hb00yybOy3?=
Content-ID: <19845442E1EEDE458F9F068BD8BCE390@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8f6c41a-fe65-438c-c109-08dbc640e398
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2023 07:50:20.1099 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U7RM7o4Z0hmdVAmWy3B5+xMEcaq9Nxcr5Dc8X3b0GHp/ykHp+XNCv/LlLm52Hp6Je+1qIv7LIuKQUSDsPRUzqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7967
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_007_639668463.1120935276"
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
Cc: =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?utf-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?= <Jason-ch.Chen@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?utf-8?B?Sm9obnNvbiBXYW5nICjnjovogZbpkasp?= <Johnson.Wang@mediatek.com>,
 =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_007_639668463.1120935276
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpLCYjMzI7SmFzb246DQoNCk9uJiMzMjtXZWQsJiMzMjsyMDIzLTEwLTA0JiMzMjth
dCYjMzI7MTA6NDAmIzMyOyswODAwLCYjMzI7SmFzb24tSkguTGluJiMzMjt3cm90ZToNCiZndDsm
IzMyO01vdmUmIzMyO0REUF9DT01QT05FTlRfRFBfSU5URjAmIzMyO2Zyb20mIzMyO210ODE4OF9t
dGtfZGRwX21haW4mIzMyO2FycmF5JiMzMjt0byYjMzI7YQ0KJmd0OyYjMzI7Y29ubmVjdG9yJiMz
Mjtyb3V0ZXMmIzMyO2FycmF5JiMzMjtjYWxsZWQmIzMyO210ODE4OF9tdGtfZGRwX21haW5fcm91
dGVzJiMzMjt0byYjMzI7c3VwcG9ydA0KJmd0OyYjMzI7ZHluYW1pYyYjMzI7c2VsZWN0aW9uJiMz
MjtjYXBhYmlsaXR5JiMzMjtmb3ImIzMyO210ODE4OC4NCg0KSSYjMzI7d291bGQmIzMyO2xpa2Um
IzMyO3RvJiMzMjttZXJnZSYjMzI7dGhpcyYjMzI7cGF0Y2gmIzMyO3dpdGgmIzMyO1s5LzldLg0K
QWxsJiMzMjt0aGlzJiMzMjtzZXJpZXMmIzMyO2xvb2smIzMyO2dvb2QmIzMyO3RvJiMzMjttZSwm
IzMyO3NvJiMzMjtJJiMzMjt3b3VsZCYjMzI7bWVyZ2UmIzMyO3RoZXNlJiMzMjt0d28mIzMyO3Bh
dGNoZXMmIzMyO2J5DQpteXNlbGYuDQoNClJlZ2FyZHMsDQpDSw0KDQomZ3Q7JiMzMjsNCiZndDsm
IzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtKYXNvbi1KSC5MaW4mIzMyOyZsdDtqYXNvbi1qaC5saW5A
bWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYjMzI7UmV2aWV3ZWQtYnk6JiMzMjtBbmdlbG9HaW9hY2No
aW5vJiMzMjtEZWwmIzMyO1JlZ25vJiMzMjsmbHQ7DQomZ3Q7JiMzMjthbmdlbG9naW9hY2NoaW5v
LmRlbHJlZ25vQGNvbGxhYm9yYS5jb20mZ3Q7DQomZ3Q7JiMzMjstLS0NCiZndDsmIzMyOyYjMzI7
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMmIzMyO3wmIzMyOzcmIzMyOysr
KysrKy0NCiZndDsmIzMyOyYjMzI7MSYjMzI7ZmlsZSYjMzI7Y2hhbmdlZCwmIzMyOzYmIzMyO2lu
c2VydGlvbnMoKyksJiMzMjsxJiMzMjtkZWxldGlvbigtKQ0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtk
aWZmJiMzMjstLWdpdCYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYu
Yw0KJmd0OyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYw0KJmd0
OyYjMzI7aW5kZXgmIzMyOzVkMmUxOTFiNDEwNi4uNzBjOTUwMTI1MGEwJiMzMjsxMDA2NDQNCiZn
dDsmIzMyOy0tLSYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYw0K
Jmd0OyYjMzI7KysrJiMzMjtiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5j
DQomZ3Q7JiMzMjtAQCYjMzI7LTE4Niw3JiMzMjsrMTg2LDEwJiMzMjtAQCYjMzI7c3RhdGljJiMz
Mjtjb25zdCYjMzI7dW5zaWduZWQmIzMyO2ludCYjMzI7bXQ4MTg4X210a19kZHBfbWFpbltdDQom
Z3Q7JiMzMjs9JiMzMjt7DQomZ3Q7JiMzMjsmIzMyO0REUF9DT01QT05FTlRfR0FNTUEsDQomZ3Q7
JiMzMjsmIzMyO0REUF9DT01QT05FTlRfUE9TVE1BU0swLA0KJmd0OyYjMzI7JiMzMjtERFBfQ09N
UE9ORU5UX0RJVEhFUjAsDQomZ3Q7JiMzMjstRERQX0NPTVBPTkVOVF9EUF9JTlRGMCwNCiZndDsm
IzMyOyt9Ow0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7K3N0YXRpYyYjMzI7Y29uc3QmIzMyO3N0cnVj
dCYjMzI7bXRrX2RybV9yb3V0ZSYjMzI7bXQ4MTg4X210a19kZHBfbWFpbl9yb3V0ZXNbXSYjMzI7
PSYjMzI7ew0KJmd0OyYjMzI7K3swLCYjMzI7RERQX0NPTVBPTkVOVF9EUF9JTlRGMH0sDQomZ3Q7
JiMzMjsmIzMyO307DQomZ3Q7JiMzMjsmIzMyOw0KJmd0OyYjMzI7JiMzMjtzdGF0aWMmIzMyO2Nv
bnN0JiMzMjt1bnNpZ25lZCYjMzI7aW50JiMzMjttdDgxOTJfbXRrX2RkcF9tYWluW10mIzMyOz0m
IzMyO3sNCiZndDsmIzMyO0BAJiMzMjstMjg4LDYmIzMyOysyOTEsOCYjMzI7QEAmIzMyO3N0YXRp
YyYjMzI7Y29uc3QmIzMyO3N0cnVjdCYjMzI7bXRrX21tc3lzX2RyaXZlcl9kYXRhDQomZ3Q7JiMz
MjttdDgxODZfbW1zeXNfZHJpdmVyX2RhdGEmIzMyOz0mIzMyO3sNCiZndDsmIzMyOyYjMzI7c3Rh
dGljJiMzMjtjb25zdCYjMzI7c3RydWN0JiMzMjttdGtfbW1zeXNfZHJpdmVyX2RhdGEmIzMyO210
ODE4OF92ZG9zeXMwX2RyaXZlcl9kYXRhDQomZ3Q7JiMzMjs9JiMzMjt7DQomZ3Q7JiMzMjsmIzMy
Oy5tYWluX3BhdGgmIzMyOz0mIzMyO210ODE4OF9tdGtfZGRwX21haW4sDQomZ3Q7JiMzMjsmIzMy
Oy5tYWluX2xlbiYjMzI7PSYjMzI7QVJSQVlfU0laRShtdDgxODhfbXRrX2RkcF9tYWluKSwNCiZn
dDsmIzMyOysuY29ubl9yb3V0ZXMmIzMyOz0mIzMyO210ODE4OF9tdGtfZGRwX21haW5fcm91dGVz
LA0KJmd0OyYjMzI7Ky5udW1fY29ubl9yb3V0ZXMmIzMyOz0mIzMyO0FSUkFZX1NJWkUobXQ4MTg4
X210a19kZHBfbWFpbl9yb3V0ZXMpLA0KJmd0OyYjMzI7JiMzMjsubW1zeXNfZGV2X251bSYjMzI7
PSYjMzI7MSwNCiZndDsmIzMyOyYjMzI7fTsNCiZndDsmIzMyOyYjMzI7DQoNCjwvcHJlPjwhLS10
eXBlOnRleHQtLT48IS0tey0tPjxwcmU+KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRp
YWxpdHkgTm90aWNlICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFp
bmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykg
bWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lz
ZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGlu
dGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQo
cykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0
YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2ht
ZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBh
bmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVu
dCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZSANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhp
cyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5
IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMg
b2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5
c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8g
YW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_007_639668463.1120935276
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEphc29uOg0KDQpPbiBXZWQsIDIwMjMtMTAtMDQgYXQgMTA6NDAgKzA4MDAsIEphc29uLUpI
LkxpbiB3cm90ZToNCj4gTW92ZSBERFBfQ09NUE9ORU5UX0RQX0lOVEYwIGZyb20gbXQ4MTg4X210
a19kZHBfbWFpbiBhcnJheSB0byBhDQo+IGNvbm5lY3RvciByb3V0ZXMgYXJyYXkgY2FsbGVkIG10
ODE4OF9tdGtfZGRwX21haW5fcm91dGVzIHRvIHN1cHBvcnQNCj4gZHluYW1pYyBzZWxlY3Rpb24g
Y2FwYWJpbGl0eSBmb3IgbXQ4MTg4Lg0KDQpJIHdvdWxkIGxpa2UgdG8gbWVyZ2UgdGhpcyBwYXRj
aCB3aXRoIFs5LzldLg0KQWxsIHRoaXMgc2VyaWVzIGxvb2sgZ29vZCB0byBtZSwgc28gSSB3b3Vs
ZCBtZXJnZSB0aGVzZSB0d28gcGF0Y2hlcyBieQ0KbXlzZWxmLg0KDQpSZWdhcmRzLA0KQ0sNCg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogSmFzb24tSkguTGluIDxqYXNvbi1qaC5saW5AbWVkaWF0ZWsu
Y29tPg0KPiBSZXZpZXdlZC1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPA0KPiBhbmdl
bG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMgfCA3ICsrKysrKy0NCj4gIDEgZmlsZSBjaGFu
Z2VkLCA2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYw0KPiBiL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jDQo+IGluZGV4IDVkMmUxOTFiNDEwNi4uNzBjOTUwMTI1
MGEwIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYu
Yw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYw0KPiBAQCAt
MTg2LDcgKzE4NiwxMCBAQCBzdGF0aWMgY29uc3QgdW5zaWduZWQgaW50IG10ODE4OF9tdGtfZGRw
X21haW5bXQ0KPiA9IHsNCj4gIAlERFBfQ09NUE9ORU5UX0dBTU1BLA0KPiAgCUREUF9DT01QT05F
TlRfUE9TVE1BU0swLA0KPiAgCUREUF9DT01QT05FTlRfRElUSEVSMCwNCj4gLQlERFBfQ09NUE9O
RU5UX0RQX0lOVEYwLA0KPiArfTsNCj4gKw0KPiArc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZHJt
X3JvdXRlIG10ODE4OF9tdGtfZGRwX21haW5fcm91dGVzW10gPSB7DQo+ICsJezAsIEREUF9DT01Q
T05FTlRfRFBfSU5URjB9LA0KPiAgfTsNCj4gIA0KPiAgc3RhdGljIGNvbnN0IHVuc2lnbmVkIGlu
dCBtdDgxOTJfbXRrX2RkcF9tYWluW10gPSB7DQo+IEBAIC0yODgsNiArMjkxLDggQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBtdGtfbW1zeXNfZHJpdmVyX2RhdGENCj4gbXQ4MTg2X21tc3lzX2RyaXZl
cl9kYXRhID0gew0KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfbW1zeXNfZHJpdmVyX2RhdGEg
bXQ4MTg4X3Zkb3N5czBfZHJpdmVyX2RhdGENCj4gPSB7DQo+ICAJLm1haW5fcGF0aCA9IG10ODE4
OF9tdGtfZGRwX21haW4sDQo+ICAJLm1haW5fbGVuID0gQVJSQVlfU0laRShtdDgxODhfbXRrX2Rk
cF9tYWluKSwNCj4gKwkuY29ubl9yb3V0ZXMgPSBtdDgxODhfbXRrX2RkcF9tYWluX3JvdXRlcywN
Cj4gKwkubnVtX2Nvbm5fcm91dGVzID0gQVJSQVlfU0laRShtdDgxODhfbXRrX2RkcF9tYWluX3Jv
dXRlcyksDQo+ICAJLm1tc3lzX2Rldl9udW0gPSAxLA0KPiAgfTsNCj4gIA0K

--__=_Part_Boundary_007_639668463.1120935276--

