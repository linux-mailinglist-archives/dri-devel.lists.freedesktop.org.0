Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F03A7A570B
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 03:39:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D41A910E391;
	Tue, 19 Sep 2023 01:39:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A520310E391
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 01:38:59 +0000 (UTC)
X-UUID: 4b6e6fb2568d11eea33bb35ae8d461a2-20230919
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=2oDepiqf3aaDLLqZPpNPgVrFtukhjjzH6GowBqXbgfA=; 
 b=lvEgDOPTDIt7zoCKSU0E+4jgbq+P/daWzcMTzhGI2w1WL+OGLthPo2OZ8PofE3mPHM0XMIcWMS2UTW3ItbiH8H9SmT+0SV3veVeiNC1HujJEcMhiwKB27kPL6P7ULO4RmaKl8+3PbVpvzFCvNfu0V/lGjob7xz5SP2D0CB669E4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31, REQID:643b13c3-e370-453e-8abe-dd90aff4ab08, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:0ad78a4, CLOUDID:828ed9ef-9a6e-4c39-b73e-f2bc08ca3dc5,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4b6e6fb2568d11eea33bb35ae8d461a2-20230919
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 216309698; Tue, 19 Sep 2023 09:38:55 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 19 Sep 2023 09:38:53 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Tue, 19 Sep 2023 09:38:53 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oCjZ9boq5aUQQ4tMaA8T4wPUgtw2/rA116GyBFXzpWlIZZDLI4FqAj8t2Isjc3w35BBzyK/M+4815iviZqaZm3V0eui0EwqjiywGE3BI9LPGTfcRYf5Jxet/nryjHW8eoEajX8/XQIWq6K8YmqYhchUC0bNf3Qg6a4I/Cc545QQ3tYEmfUgReVumsPFJ1dDeu4fOaxmepAqchbxw2zAW83Q5jCtcXcYkes9qJOBrBCprJmoJ8ZQsLG8MZR6aNqeY7Yyc6l+gqxx94J9EG3oxE17Rqup130zep+kqoXW5PmRbkdUR9YKdJwwhGzmKPM2GommZ+DdGrR3OSKi4nIZ/kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EpuK9GTR1RvqVijlFtovyWJm9jN718/djIAmqd7S/DE=;
 b=aomBknWUHW73b18X7WIYIHhkHc4sjbNrzwJkLXXuWQOPFzxF0ahmzQU4PJ0NgWrGuvZZflVaNu9+ZJvGFbtcilELk3RxiiOLJMFw5SCZzSFlJM5YMKhhGUv2osWtcZ5SrnDr/UyqMsdczXGNDJSEeuOsTrFSTocI6EZuljT3NFeLM95Whb955O3SWVueGGo/4Wcf3N0okzHhPpuUy/DrfclrK+12MdAzv4MgWEVFS6LbXW/enlLM/OU+HIft3pi8TDKZwCHJrZXYLsTD1whiO5IRZvo0pws05piUIQOWjSmgESBrQqG7OVtsFiT6/j3pUzEYp+azAsiUu98mAongoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EpuK9GTR1RvqVijlFtovyWJm9jN718/djIAmqd7S/DE=;
 b=peZo1D4sybzVoY+ws9jlhUnpd07zCvktwkH9grFfsU73xT4Ff/Ji/TDm+1GKHmyQI1tPwhPSV5RiiEOX48rOA9AQh+w6jrUvEWwn4rwBTaA8HaQcvHgy5bX8p5sKJe7NhvQTnvfWf9IjyPeZ3JSPWXVGeltaVMGG5YYeHXJS9BM=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TY0PR03MB6498.apcprd03.prod.outlook.com (2603:1096:400:1bd::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Tue, 19 Sep
 2023 01:38:50 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9c2c:c08a:212f:e984]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9c2c:c08a:212f:e984%6]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 01:38:50 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 08/15] soc: mediatek: Add cmdq_pkt_finalize_loop to CMDQ
 driver
Thread-Topic: [PATCH 08/15] soc: mediatek: Add cmdq_pkt_finalize_loop to CMDQ
 driver
Thread-Index: AQHZ6mWSWGhWkrDLxUmToKKOu9sO6rAhX0kA
Date: Tue, 19 Sep 2023 01:38:50 +0000
Message-ID: <54799d50c0b4427102e275117e715d9d4a190375.camel@mediatek.com>
References: <20230918192204.32263-1-jason-jh.lin@mediatek.com>
 <20230918192204.32263-9-jason-jh.lin@mediatek.com>
In-Reply-To: <20230918192204.32263-9-jason-jh.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TY0PR03MB6498:EE_
x-ms-office365-filtering-correlation-id: 675df916-cdb2-4e86-1b46-08dbb8b12d0b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qtplHBz210+NW1LiCXJXrKCkOd/Ys366k0LFgL1l+mnVPILAjN2kGUhH3LPOVuYg3EsE65xLJ8rGUG8KTGorQDas3gC1y12mMkhLtB5RF+w6fKYQMTa6CceYiVveCLOKp3XKp4Mh1pH1mH4Cv9QQ5QBvJGBTQHcUcxNTHLGDrAiKCm5giMC9Mu2YuDx/M4HtPreKflq05L/3H3BB66Ty8bMIR37CPNSXziHTB6bYMZSipDJbPqwA4ei82xS05CJFAmYlJij+tS1tTW92erin07xQ1R8tg3vFnU+SPCyOSYK3Y5zlLDeg9k3tlALACvDklOfuZ9vP3DotyrQw28cFbyE7sxvese3yhFr3+kcaPRQcftcqBdjBFS3pu0D7C219/0MPiI55uk/M/9NIv3SID37irHU4Pi3GZOLZwQ+/liNsaZlmScWcFCqjNh1gutUGHPqvxui6dTs8LuEmg5miBxdzgxwPyb1tZXZReykbGPI/qQkuijT8CO/Q7XvUIrnfIFUBU3ElBlBvp79WEe7X3rFZNC8IGxcymSb7G6ecEPKilExTQASVBHCAnOISUvx7QbAUt0Q2gCTCfdUOdLfkVHsRNeuHiB9AVoPfobe9Bq2mS4XEZA6RX2C25YR9EQxNYSewQDupe9iUX4nQx9pfxpStYgSAe/Kbdt9rhwEUV94=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(346002)(366004)(39860400002)(136003)(186009)(1800799009)(451199024)(6486002)(6506007)(6512007)(478600001)(71200400001)(26005)(107886003)(4326008)(2906002)(64756008)(7416002)(66476007)(66446008)(76116006)(66556008)(54906003)(66946007)(110136005)(5660300002)(8936002)(8676002)(41300700001)(316002)(2616005)(122000001)(38070700005)(86362001)(85182001)(36756003)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aEFmdnJRb2I3ZkNTYVh1RHFQRnN1eFZnMHBFazdJSnNpZm9OK1BFMzUxbzd4?=
 =?utf-8?B?NTNqbkVVcU14dzJod1IwWVJoZ3ZwOTFXeFd4cHlLbUVVZHhaeGJETWZzQ1dp?=
 =?utf-8?B?RDJNZWxqUU13Smt3TlcyNFUvY3VsaHhqMHZERlNyMnN2WDlOeHQ1Z0lPK2ZT?=
 =?utf-8?B?aGFsYmd3Q2doekhwZnBSTHZGclR6RDV5TkViTkZZd0tMY21MK3UzSnZoWDA5?=
 =?utf-8?B?WkxVNmduOWN1OEY3STlRaEpKN01lOFZGNndPMWdkSVlvRk93UWVHSERmaFBF?=
 =?utf-8?B?UEVQKy9HNEVtei9PTXRlRTl0NWY3Z1pObjhrT1NWMk1ubFlzWVpNSmhaWmJZ?=
 =?utf-8?B?cnlyN1FmMmQwVno4b2JHTGVvYUtEcS90SWl0YTJJd2NyLytlYklBZC8yc1Fp?=
 =?utf-8?B?SW9FVlE0ZWx0WjNYUnNnMW80NkNRN0MxOGhMK2tUbjR5V0hRdkg5RmhqYS9O?=
 =?utf-8?B?ZnVxSU1vZFBOT2F3WHRCV3JIVXY0ZTExM0NNdXN5d0V0QXpFYk04TXVHWkJa?=
 =?utf-8?B?TjMvOE83VTYzcE5VbVBadnNvcXdmQlp4VmM5Q0xITDZ5M0hBaFl3SVJyb3Jk?=
 =?utf-8?B?bUk2alVmWFZrbmRrQ1NGZzg5RXZ4WHJjVUlCQXArN2QrNllFZUlqelEwOGg1?=
 =?utf-8?B?RGFTa1NVRys3OWhzQnBaeWoyS1htUEdBSG1ldXJqb0FoU2lmc0MzRzIxSmdM?=
 =?utf-8?B?YjhIS0Y5blBXeSs1Y3Z6MTQyUTNCMEt3YWVpa3hHejNMcHVxbjB6ZFZOWGhr?=
 =?utf-8?B?RmkvcnhCNVBsaFlRdG5MejBpV0JYVXRCRkFVRmxyb3NxZThIdjJsZmEvN1lO?=
 =?utf-8?B?R3NPZ1dzd0NpeGVWeFdEMkZpNyt1c25rNlBxV0F6WDNqM2lPbWtIN0ZPSkV3?=
 =?utf-8?B?bm1kUm1NbTJrUnhMdjFPMWVJVEQyZStQTUpmR1VidzJ1Wkp6d1J0ZFRRbmtX?=
 =?utf-8?B?TnBmWGdGd0gxNVZCWlRhZWNHbmYzb0NiZ0p4d2p2ZC81ZVZncm9LNHF6M2Zi?=
 =?utf-8?B?RGcvd0dGajdudGM5TG9kbWJGbXFsYzZTYlpWYWtPOW1yU2VQVHZicjNHWlZV?=
 =?utf-8?B?TnNmT0JiNENXYWNiekhqeEdBSlVnelJRRGZ6T3BIYk5NZ2NsYmJPN3NzUnNn?=
 =?utf-8?B?c3dpbmYwUjdFTkJIdlFsenFJS3dXM0hiKy8xcE1LbUEvS1Nkdk1MWWNvK2cx?=
 =?utf-8?B?TkN0OXVYcFFUeWxSN1hwK2V2V28xc0F4ZFdseXJhK0l4VU1vcW83dzhuWjE2?=
 =?utf-8?B?VDF1c3RXb2hyeCs1dHdwMXAwTEVkcnl2WkNodUJYVFRjMFdGclNrdGd0VFBP?=
 =?utf-8?B?Q1JDT3JZM1IyOS9Sc0k4VlVKSDR1a0VDZXZybW9iV1R2QUdWYVFNZHBzaWtJ?=
 =?utf-8?B?eWcyeVpSR0ljMm0xY2FQajNBVi9nUHMzOUNScTJxclBkdklBajJacHN1WUJk?=
 =?utf-8?B?aGRlVGNNSWpLSEMyVmRSRWUrTzR4Q2ZXVGYwWDE1OGpoelNsU2NzVG5TNDkz?=
 =?utf-8?B?RDV1dFRSa0F0ZTBKYVJhZ2RwL0RSRmo4VkIzOVl2ekFEbFpDcWZPZ08rcTFo?=
 =?utf-8?B?a29mL1ZwMThsOEpTaGszaXFwakNqTWVOWHExWVZRcnY4eWVHZEw0WCtBaC9P?=
 =?utf-8?B?a3p6ejA2QXphNW5ibTVHS2JGTmZSWlNCUVJuOE45NGRKeWVPVTFYbzBLM0p2?=
 =?utf-8?B?aG93UEtpYys2YjVwai9nMUxMOUVEanZFYU4vaG1TZmRteXBXbkxKci95TkFX?=
 =?utf-8?B?V2RyaFZNQ0laTFU3aWlUcDU5SVd1a0FkUkNrbm9uNUhlZmJUOHdINFZVWkxw?=
 =?utf-8?B?MnNDcXg4UGhaU04wdTAybGZUM1l0c1o2RHVMZ1hYbVlrSi90d3RGWGxBY2kv?=
 =?utf-8?B?SDdOM21wN0M1SzJJY2NJOVRhQXJqbDBlenNtWE9WaUlraEpqdWo0OHY3Nmh4?=
 =?utf-8?B?MjFzSStjdXlGT1Vya0xWaGNUaG5rekt3dUlXTGR3dkNpck9SYW4yNWwrQ0Rn?=
 =?utf-8?B?cVJWekJNY3lBK1g5dDJSeERmdWI5dUVuZFE1TzdZMWtLdm1DMUFzZ3dkUXZt?=
 =?utf-8?B?VzBVczlSMmFPRXVWaEt5UGlacERWK1hPYTNsTDBiNlhaMmU4RXFyYU50U284?=
 =?utf-8?Q?eJSKwyQL9R1HHyyNNeacEChYY?=
Content-ID: <EE99EA9C400D854C9FFAF530D17320CD@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 675df916-cdb2-4e86-1b46-08dbb8b12d0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2023 01:38:50.7143 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ef0opja1LotWlJLHmrhvh+8NWNTbrHn2w1T1LgCFPqiOfy333tvQqh45t7CKtYOizYh+6DOmzAR6Y2HFbcxcGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6498
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_002_1317771996.1640298673"
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
 =?utf-8?B?RWx2aXMgV2FuZyAo546L5YabKQ==?= <Elvis.Wang@mediatek.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?utf-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?= <Jason-ch.Chen@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?utf-8?B?Sm9obnNvbiBXYW5nICjnjovogZbpkasp?= <Johnson.Wang@mediatek.com>,
 =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_002_1317771996.1640298673
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpLCYjMzI7SmFzb246DQoNCk9uJiMzMjtUdWUsJiMzMjsyMDIzLTA5LTE5JiMzMjth
dCYjMzI7MDM6MjEmIzMyOyswODAwLCYjMzI7SmFzb24tSkguTGluJiMzMjt3cm90ZToNCiZndDsm
IzMyO0FkZCYjMzI7Y21kcV9wa3RfZmluYWxpemVfbG9vcCYjMzI7dG8mIzMyO0NNRFEmIzMyO2Ry
aXZlci4NCiZndDsmIzMyOw0KJmd0OyYjMzI7Y21kcV9wa3RfZmluYWxpemVfbG9vcCYjMzI7YXBw
ZW5kcyYjMzI7ZW5kJiMzMjtvZiYjMzI7Y29tbWFuZChFT0MpJiMzMjtpbnN0cnVjdGlvbiYjMzI7
YW5kDQomZ3Q7JiMzMjtqdW1wJiMzMjt0byYjMzI7c3RhcnQmIzMyO29mJiMzMjtjb21tYW5kJiMz
MjtidWZmZXImIzMyO2luc3RydWN0aW9uJiMzMjt0byYjMzI7bWFrZSYjMzI7dGhlJiMzMjtjb21t
YW5kDQomZ3Q7JiMzMjtidWZmZXImIzMyO2xvb3BhYmxlLg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtT
aWduZWQtb2ZmLWJ5OiYjMzI7SmFzb24tSkguTGluJiMzMjsmbHQ7amFzb24tamgubGluQG1lZGlh
dGVrLmNvbSZndDsNCiZndDsmIzMyOy0tLQ0KJmd0OyYjMzI7JiMzMjtkcml2ZXJzL3NvYy9tZWRp
YXRlay9tdGstY21kcS1oZWxwZXIuYyYjMzI7fCYjMzI7MjMmIzMyOysrKysrKysrKysrKysrKysr
KysrKysrDQomZ3Q7JiMzMjsmIzMyO2luY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210ay1jbWRx
LmgmIzMyOyYjMzI7fCYjMzI7JiMzMjs4JiMzMjsrKysrKysrKw0KJmd0OyYjMzI7JiMzMjsyJiMz
MjtmaWxlcyYjMzI7Y2hhbmdlZCwmIzMyOzMxJiMzMjtpbnNlcnRpb25zKCspDQomZ3Q7JiMzMjsN
CiZndDsmIzMyO2RpZmYmIzMyOy0tZ2l0JiMzMjthL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1j
bWRxLWhlbHBlci5jDQomZ3Q7JiMzMjtiL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1jbWRxLWhl
bHBlci5jDQomZ3Q7JiMzMjtpbmRleCYjMzI7NGJlMmExOGE0YTAyLi5iYmIxMjc2MjBiYjMmIzMy
OzEwMDY0NA0KJmd0OyYjMzI7LS0tJiMzMjthL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1jbWRx
LWhlbHBlci5jDQomZ3Q7JiMzMjsrKysmIzMyO2IvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLWNt
ZHEtaGVscGVyLmMNCiZndDsmIzMyO0BAJiMzMjstNDc1LDYmIzMyOys0NzUsMjkmIzMyO0BAJiMz
MjtpbnQmIzMyO2NtZHFfcGt0X2ZpbmFsaXplKHN0cnVjdCYjMzI7Y21kcV9wa3QmIzMyOypwa3Qp
DQomZ3Q7JiMzMjsmIzMyO30NCiZndDsmIzMyOyYjMzI7RVhQT1JUX1NZTUJPTChjbWRxX3BrdF9m
aW5hbGl6ZSk7DQomZ3Q7JiMzMjsmIzMyOw0KJmd0OyYjMzI7K2ludCYjMzI7Y21kcV9wa3RfZmlu
YWxpemVfbG9vcChzdHJ1Y3QmIzMyO2NtZHFfcGt0JiMzMjsqcGt0KQ0KJmd0OyYjMzI7K3sNCiZn
dDsmIzMyOytzdHJ1Y3QmIzMyO2NtZHFfaW5zdHJ1Y3Rpb24mIzMyO2luc3QmIzMyOz0mIzMyO3sm
IzMyO3swfSYjMzI7fTsNCiZndDsmIzMyOytpbnQmIzMyO2VycjsNCiZndDsmIzMyOysNCiZndDsm
IzMyOysvKiYjMzI7aW5zZXJ0JiMzMjtFT0MmIzMyO2FuZCYjMzI7Z2VuZXJhdGUmIzMyO0lSUSYj
MzI7Zm9yJiMzMjtlYWNoJiMzMjtjb21tYW5kJiMzMjtpdGVyYXRpb24mIzMyOyovDQomZ3Q7JiMz
MjsraW5zdC5vcCYjMzI7PSYjMzI7Q01EUV9DT0RFX0VPQzsNCiZndDsmIzMyOytpbnN0LnZhbHVl
JiMzMjs9JiMzMjtDTURRX0VPQ19JUlFfRU47DQomZ3Q7JiMzMjsrZXJyJiMzMjs9JiMzMjtjbWRx
X3BrdF9hcHBlbmRfY29tbWFuZChwa3QsJiMzMjtpbnN0KTsNCiZndDsmIzMyOytpZiYjMzI7KGVy
ciYjMzI7Jmx0OyYjMzI7MCkNCiZndDsmIzMyOytyZXR1cm4mIzMyO2VycjsNCiZndDsmIzMyOysN
CiZndDsmIzMyOysvKiYjMzI7SlVNUCYjMzI7dG8mIzMyO3N0YXJ0JiMzMjtvZiYjMzI7cGt0JiMz
MjsqLw0KJmd0OyYjMzI7K2VyciYjMzI7PSYjMzI7Y21kcV9wa3RfanVtcChwa3QsJiMzMjtwa3Qt
Jmd0O3BhX2Jhc2UpOw0KJmd0OyYjMzI7K2lmJiMzMjsoZXJyJiMzMjsmbHQ7JiMzMjswKQ0KJmd0
OyYjMzI7K3JldHVybiYjMzI7ZXJyOw0KDQpDb3VsZCYjMzI7eW91JiMzMjtleHBsYWluJiMzMjt0
aGUmIzMyO2Nhc2UmIzMyO3RoYXQmIzMyO2EmIzMyO2xvb3AmIzMyO3RocmVhZCYjMzI7d291bGQm
IzMyO3RyaWdnZXImIzMyO2FuDQppbnRlcnJ1cHQmIzYzOyYjMzI7SW4mIzMyO0RSTSYjMzI7Y3Jj
JiMzMjtmdW5jdGlvbiwmIzMyO3RoZSYjMzI7bG9vcCYjMzI7dGhyZWFkJiMzMjtuZWVkJiMzMjtu
b3QmIzMyO3RvJiMzMjt0cmlnZ2VyDQppbnRlcnJ1cHQsJiMzMjtzbyYjMzI7SSYjMzk7bSYjMzI7
Y3VyaW91cyYjMzI7YWJvdXQmIzMyO3RoaXMuDQoNClJlZ2FyZHMsDQpDSw0KDQomZ3Q7JiMzMjsr
DQomZ3Q7JiMzMjsrcGt0LSZndDtsb29wJiMzMjs9JiMzMjt0cnVlOw0KJmd0OyYjMzI7Kw0KJmd0
OyYjMzI7K3JldHVybiYjMzI7ZXJyOw0KJmd0OyYjMzI7K30NCiZndDsmIzMyOytFWFBPUlRfU1lN
Qk9MKGNtZHFfcGt0X2ZpbmFsaXplX2xvb3ApOw0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7JiMzMjtp
bnQmIzMyO2NtZHFfcGt0X2ZsdXNoX2FzeW5jKHN0cnVjdCYjMzI7Y21kcV9wa3QmIzMyOypwa3Qp
DQomZ3Q7JiMzMjsmIzMyO3sNCiZndDsmIzMyOyYjMzI7aW50JiMzMjtlcnI7DQomZ3Q7JiMzMjtk
aWZmJiMzMjstLWdpdCYjMzI7YS9pbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstY21kcS5o
DQomZ3Q7JiMzMjtiL2luY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210ay1jbWRxLmgNCiZndDsm
IzMyO2luZGV4JiMzMjs4MzdhZDg2NTZhZGMuLjM4YThlNDdkYTMzOCYjMzI7MTAwNjQ0DQomZ3Q7
JiMzMjstLS0mIzMyO2EvaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRrLWNtZHEuaA0KJmd0
OyYjMzI7KysrJiMzMjtiL2luY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210ay1jbWRxLmgNCiZn
dDsmIzMyO0BAJiMzMjstMzIzLDYmIzMyOyszMjMsMTQmIzMyO0BAJiMzMjtpbnQmIzMyO2NtZHFf
cGt0X2p1bXAoc3RydWN0JiMzMjtjbWRxX3BrdCYjMzI7KnBrdCwNCiZndDsmIzMyO2RtYV9hZGRy
X3QmIzMyO2FkZHIpOw0KJmd0OyYjMzI7JiMzMjsmIzMyOyovDQomZ3Q7JiMzMjsmIzMyO2ludCYj
MzI7Y21kcV9wa3RfZmluYWxpemUoc3RydWN0JiMzMjtjbWRxX3BrdCYjMzI7KnBrdCk7DQomZ3Q7
JiMzMjsmIzMyOw0KJmd0OyYjMzI7Ky8qKg0KJmd0OyYjMzI7KyYjMzI7KiYjMzI7Y21kcV9wa3Rf
ZmluYWxpemVfbG9vcCgpJiMzMjstJiMzMjtBcHBlbmQmIzMyO0VPQyYjMzI7YW5kJiMzMjtqdW1w
JiMzMjt0byYjMzI7c3RhcnQmIzMyO2NvbW1hbmQuDQomZ3Q7JiMzMjsrJiMzMjsqJiMzMjtAcGt0
OnRoZSYjMzI7Q01EUSYjMzI7cGFja2V0DQomZ3Q7JiMzMjsrJiMzMjsqDQomZ3Q7JiMzMjsrJiMz
MjsqJiMzMjtSZXR1cm46JiMzMjswJiMzMjtmb3ImIzMyO3N1Y2Nlc3M7JiMzMjtlbHNlJiMzMjt0
aGUmIzMyO2Vycm9yJiMzMjtjb2RlJiMzMjtpcyYjMzI7cmV0dXJuZWQNCiZndDsmIzMyOysmIzMy
OyovDQomZ3Q7JiMzMjsraW50JiMzMjtjbWRxX3BrdF9maW5hbGl6ZV9sb29wKHN0cnVjdCYjMzI7
Y21kcV9wa3QmIzMyOypwa3QpOw0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7JiMzMjsvKioNCiZndDsm
IzMyOyYjMzI7JiMzMjsqJiMzMjtjbWRxX3BrdF9mbHVzaF9hc3luYygpJiMzMjstJiMzMjt0cmln
Z2VyJiMzMjtDTURRJiMzMjt0byYjMzI7YXN5bmNocm9ub3VzbHkmIzMyO2V4ZWN1dGUNCiZndDsm
IzMyO3RoZSYjMzI7Q01EUQ0KJmd0OyYjMzI7JiMzMjsmIzMyOyomIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7cGFj
a2V0JiMzMjthbmQmIzMyO2NhbGwmIzMyO2JhY2smIzMyO2F0JiMzMjt0aGUmIzMyO2VuZCYjMzI7
b2YmIzMyO2RvbmUNCiZndDsmIzMyO3BhY2tldA0KDQo8L3ByZT48IS0tdHlwZTp0ZXh0LS0+PCEt
LXstLT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZSAq
KioqKioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUt
bWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRl
bnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9t
IGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSAN
CmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBk
aXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5
aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50
ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVu
bGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1h
aWwsIG9yIGJlbGlldmUgDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVy
cm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcg
dG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1h
aWwgKGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBu
b3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJz
b24uIFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_002_1317771996.1640298673
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEphc29uOg0KDQpPbiBUdWUsIDIwMjMtMDktMTkgYXQgMDM6MjEgKzA4MDAsIEphc29uLUpI
LkxpbiB3cm90ZToNCj4gQWRkIGNtZHFfcGt0X2ZpbmFsaXplX2xvb3AgdG8gQ01EUSBkcml2ZXIu
DQo+IA0KPiBjbWRxX3BrdF9maW5hbGl6ZV9sb29wIGFwcGVuZHMgZW5kIG9mIGNvbW1hbmQoRU9D
KSBpbnN0cnVjdGlvbiBhbmQNCj4ganVtcCB0byBzdGFydCBvZiBjb21tYW5kIGJ1ZmZlciBpbnN0
cnVjdGlvbiB0byBtYWtlIHRoZSBjb21tYW5kDQo+IGJ1ZmZlciBsb29wYWJsZS4NCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IEphc29uLUpILkxpbiA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4NCj4g
LS0tDQo+ICBkcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstY21kcS1oZWxwZXIuYyB8IDIzICsrKysr
KysrKysrKysrKysrKysrKysrDQo+ICBpbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstY21k
cS5oICB8ICA4ICsrKysrKysrDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKykN
Cj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstY21kcS1oZWxwZXIu
Yw0KPiBiL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1jbWRxLWhlbHBlci5jDQo+IGluZGV4IDRi
ZTJhMThhNGEwMi4uYmJiMTI3NjIwYmIzIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3NvYy9tZWRp
YXRlay9tdGstY21kcS1oZWxwZXIuYw0KPiArKysgYi9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGst
Y21kcS1oZWxwZXIuYw0KPiBAQCAtNDc1LDYgKzQ3NSwyOSBAQCBpbnQgY21kcV9wa3RfZmluYWxp
emUoc3RydWN0IGNtZHFfcGt0ICpwa3QpDQo+ICB9DQo+ICBFWFBPUlRfU1lNQk9MKGNtZHFfcGt0
X2ZpbmFsaXplKTsNCj4gIA0KPiAraW50IGNtZHFfcGt0X2ZpbmFsaXplX2xvb3Aoc3RydWN0IGNt
ZHFfcGt0ICpwa3QpDQo+ICt7DQo+ICsJc3RydWN0IGNtZHFfaW5zdHJ1Y3Rpb24gaW5zdCA9IHsg
ezB9IH07DQo+ICsJaW50IGVycjsNCj4gKw0KPiArCS8qIGluc2VydCBFT0MgYW5kIGdlbmVyYXRl
IElSUSBmb3IgZWFjaCBjb21tYW5kIGl0ZXJhdGlvbiAqLw0KPiArCWluc3Qub3AgPSBDTURRX0NP
REVfRU9DOw0KPiArCWluc3QudmFsdWUgPSBDTURRX0VPQ19JUlFfRU47DQo+ICsJZXJyID0gY21k
cV9wa3RfYXBwZW5kX2NvbW1hbmQocGt0LCBpbnN0KTsNCj4gKwlpZiAoZXJyIDwgMCkNCj4gKwkJ
cmV0dXJuIGVycjsNCj4gKw0KPiArCS8qIEpVTVAgdG8gc3RhcnQgb2YgcGt0ICovDQo+ICsJZXJy
ID0gY21kcV9wa3RfanVtcChwa3QsIHBrdC0+cGFfYmFzZSk7DQo+ICsJaWYgKGVyciA8IDApDQo+
ICsJCXJldHVybiBlcnI7DQoNCkNvdWxkIHlvdSBleHBsYWluIHRoZSBjYXNlIHRoYXQgYSBsb29w
IHRocmVhZCB3b3VsZCB0cmlnZ2VyIGFuDQppbnRlcnJ1cHQ/IEluIERSTSBjcmMgZnVuY3Rpb24s
IHRoZSBsb29wIHRocmVhZCBuZWVkIG5vdCB0byB0cmlnZ2VyDQppbnRlcnJ1cHQsIHNvIEknbSBj
dXJpb3VzIGFib3V0IHRoaXMuDQoNClJlZ2FyZHMsDQpDSw0KDQo+ICsNCj4gKwlwa3QtPmxvb3Ag
PSB0cnVlOw0KPiArDQo+ICsJcmV0dXJuIGVycjsNCj4gK30NCj4gK0VYUE9SVF9TWU1CT0woY21k
cV9wa3RfZmluYWxpemVfbG9vcCk7DQo+ICsNCj4gIGludCBjbWRxX3BrdF9mbHVzaF9hc3luYyhz
dHJ1Y3QgY21kcV9wa3QgKnBrdCkNCj4gIHsNCj4gIAlpbnQgZXJyOw0KPiBkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRrLWNtZHEuaA0KPiBiL2luY2x1ZGUvbGludXgv
c29jL21lZGlhdGVrL210ay1jbWRxLmgNCj4gaW5kZXggODM3YWQ4NjU2YWRjLi4zOGE4ZTQ3ZGEz
MzggMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210ay1jbWRxLmgN
Cj4gKysrIGIvaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRrLWNtZHEuaA0KPiBAQCAtMzIz
LDYgKzMyMywxNCBAQCBpbnQgY21kcV9wa3RfanVtcChzdHJ1Y3QgY21kcV9wa3QgKnBrdCwNCj4g
ZG1hX2FkZHJfdCBhZGRyKTsNCj4gICAqLw0KPiAgaW50IGNtZHFfcGt0X2ZpbmFsaXplKHN0cnVj
dCBjbWRxX3BrdCAqcGt0KTsNCj4gIA0KPiArLyoqDQo+ICsgKiBjbWRxX3BrdF9maW5hbGl6ZV9s
b29wKCkgLSBBcHBlbmQgRU9DIGFuZCBqdW1wIHRvIHN0YXJ0IGNvbW1hbmQuDQo+ICsgKiBAcGt0
Ogl0aGUgQ01EUSBwYWNrZXQNCj4gKyAqDQo+ICsgKiBSZXR1cm46IDAgZm9yIHN1Y2Nlc3M7IGVs
c2UgdGhlIGVycm9yIGNvZGUgaXMgcmV0dXJuZWQNCj4gKyAqLw0KPiAraW50IGNtZHFfcGt0X2Zp
bmFsaXplX2xvb3Aoc3RydWN0IGNtZHFfcGt0ICpwa3QpOw0KPiArDQo+ICAvKioNCj4gICAqIGNt
ZHFfcGt0X2ZsdXNoX2FzeW5jKCkgLSB0cmlnZ2VyIENNRFEgdG8gYXN5bmNocm9ub3VzbHkgZXhl
Y3V0ZQ0KPiB0aGUgQ01EUQ0KPiAgICogICAgICAgICAgICAgICAgICAgICAgICAgIHBhY2tldCBh
bmQgY2FsbCBiYWNrIGF0IHRoZSBlbmQgb2YgZG9uZQ0KPiBwYWNrZXQNCg==

--__=_Part_Boundary_002_1317771996.1640298673--

