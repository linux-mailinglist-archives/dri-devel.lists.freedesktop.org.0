Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE4976E32F
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 10:33:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3807C10E5D1;
	Thu,  3 Aug 2023 08:33:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 426B010E5D1
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 08:32:59 +0000 (UTC)
X-UUID: 586610b431d811eeb20a276fd37b9834-20230803
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=yhbcE8L9YYRpjFoeNKzPuRqwU+lSOc8sA5rYHYlBadE=; 
 b=NXPPT5V4J090fGJ4EwTxGQzu2R2/vdoGmGIy5SwXXNZwap14GxVVT0dlHqfkKjKWI8//2rpbSqyWx7V84pgMs+aH/Wom2Jdh1WU5lz8rd7dGrCikfS/UFucgXtn7QznS6x4IheDs/3+PB7g2kmRigAuhUDOxMOto6R/7c7bXaAw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.30, REQID:70cb4ce3-be62-44fc-be6f-a9dc42595542, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:1fcc6f8, CLOUDID:71991ab4-a467-4aa9-9e04-f584452e3794,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 586610b431d811eeb20a276fd37b9834-20230803
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 88224360; Thu, 03 Aug 2023 16:32:56 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 3 Aug 2023 16:32:55 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Thu, 3 Aug 2023 16:32:54 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XpLWST64F1QNsNAk5Mln1IsBkV+rTlm/FvsB3pVMJ2I2CK7sxAY95TNOPpsTN3W68/eyHlJ8DCRnBHZbTDXtnEROao3GIfCJyf6E4SsOSCFgSGNf93/7I5qaoBlYry9o/qawo+ngjtiIFo3NUVJAT6oQfk1J73KRitaLI+/bMkTNU2rEEVvNxFEhNsGMJm95Q+TaDuDKp3iagNEMiMY49qoKpoZOGH/zWwalsPlfLm4sEKbeXAb5awmkdId85E+ipI3ICvMnIWUW8PX0fUB59dFc53Ng85+qTXBq73cQYw7uOKMoWOfL0g7iB02qEMG7gadk8yLTOSs/z6CMjSd2gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8UauAPglruVzPTeL1vqBzuPGZ4I2xYduAu/C+s80cd8=;
 b=dcCFsOuQBL1rmEIcplY7w0iDvaod8c6th96OeQX9TqY5ljPdFzfXFYcUMF5EZxO8FX3kfo1zOcaj8g/Tk8Sa690wDEDhuYGCUMBt1UabO+OgXyPSk9WR8jEDtG5r288h+9U9Ne+QeXgmkn4PQB4fuRimU53d4uR2NasKKwdYedYMeeOaA8ExrSSPg73Kc6hOm6LNR3DuzDft0szjG09JvgegxOcjYl5o0oCMPoEIv7YOGDjCUk+1wulMPRLgk1FVveDaddb+kt+8pWcKBkLVoY4buLaopXrTrz1Dwg4SUqViz06SquFV9QP5jQDbQcBA6Jcdkl//0h69PJVFHkWw2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8UauAPglruVzPTeL1vqBzuPGZ4I2xYduAu/C+s80cd8=;
 b=NkRGhW94kJWcI/V9ULEnqCj7UyCTMuu+MdyTf9bfEHcQXQXyqIq+8Sh0EM9cSP6uc1Uwg29MMCz/8Yq8bFm352wQo6RentXaMgp1OBssubT8eof0AMr5I3B2/h1JhRQrcklWiOJh7aqh2lOwmhe+tTckKgLdXJCVX9TkvUqx38M=
Received: from SEZPR03MB7616.apcprd03.prod.outlook.com (2603:1096:101:123::9)
 by SEZPR03MB7375.apcprd03.prod.outlook.com (2603:1096:101:10d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 08:32:52 +0000
Received: from SEZPR03MB7616.apcprd03.prod.outlook.com
 ([fe80::2310:62b8:e345:dae4]) by SEZPR03MB7616.apcprd03.prod.outlook.com
 ([fe80::2310:62b8:e345:dae4%7]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 08:32:52 +0000
From: =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>
To: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "fshao@chromium.org" <fshao@chromium.org>
Subject: Re: [PATCH v2] drm/mediatek: fix uninitialized symbol
Thread-Topic: [PATCH v2] drm/mediatek: fix uninitialized symbol
Thread-Index: AQHZc/dVWUY2pJ1cl0a+Yt4DL3ZbCa+5gtAAgARbdwCABPgaAIAWC96A
Date: Thu, 3 Aug 2023 08:32:51 +0000
Message-ID: <ecedbe0bd06a67654bc90421569ad6e6bd9ddfe7.camel@mediatek.com>
References: <20230421021609.7730-1-nancy.lin@mediatek.com>
 <ae96299cffaacdbf51beae96e3a257c95a04ac95.camel@mediatek.com>
 <CAC=S1njEG2sV28XAWDw8FoQ0p5w=-sU4i+D-ESfapHMQC1ZW3Q@mail.gmail.com>
 <7e1124a15395dbb6906c17e240e5011a4274a9b5.camel@mediatek.com>
In-Reply-To: <7e1124a15395dbb6906c17e240e5011a4274a9b5.camel@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR03MB7616:EE_|SEZPR03MB7375:EE_
x-ms-office365-filtering-correlation-id: 1035d5ca-b0ec-4523-74fb-08db93fc3a39
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: O32J/DTluzFoqNq/kx67DkFXIafJdFqFzP4LeRueMSniY9vDPOFy9jVQ9mbAqdEl/vUIEMsG6ChmieZjxCYsakPMDRExQIE0IFUP5LwXsqKAzJwP60TSvW82ygU8/Nf3yqFc8uokIz5dpoHjYRgFyAvtWP7k06Dxi6UtugaEpe9UnBB/c8Fqxj7oDgt8aUijLpm/u2oLtovDGQDL3+lnw8jf8AzryFFwYStICghs/oGDtlg6at9WO41+6OGoOUr/mrXlNk4b0xYbya8DXschyAX5lsz+gd0x4Rmajsz0JAzwHT6731fpcdER/asx3lOQREoxCIm1qlWGaHSAmRIQcfl2BElUwmP9qaGiun5a822m/ISM49V88aJ4UbgQJSbfRLs5UuyQJapn/dDIgJHIM1qVxVYy6evVDqly4Bcjnlbq5d5U4Kh3Fbissh+JadoF0rNgydKZ/jLtmE5aFtVlyednvjJSo6KCWv9V0q36oLZLQnVKz1Z0C4kuCH+YeK/+ihqNMWjLfwFA5pju0ptkBc6o1EAmRjP3d1DEOKaQHRQd9cFuWQmqT1Ww2dyIq5+iMBVjdLbkHjTlJpsigZmbD3mX2lqNvsEsPttkGwwJF3S5z9kkRF4Az3Py1yvD1O9xeZj6YhJlGHTVL2K1NKkUwrl+eQFM//7dM8Mr8VUGiyA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR03MB7616.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(136003)(346002)(366004)(39860400002)(451199021)(122000001)(53546011)(6506007)(26005)(38100700002)(186003)(38070700005)(2616005)(83380400001)(2906002)(85182001)(36756003)(5660300002)(7416002)(8676002)(478600001)(110136005)(86362001)(6512007)(54906003)(71200400001)(6486002)(41300700001)(316002)(91956017)(8936002)(64756008)(66446008)(66476007)(76116006)(66946007)(66556008)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZXQvcTYxclJPTnZieVJxVm9aRmFSbWlxSzdlSjBYR2NBK2ozL3JuZlptcmRp?=
 =?utf-8?B?YTBwakJNaTFLMWhFMzVoYXFvckxaaGcvdGh2MEhqRmh6MlZYMFFqcjZEOVpJ?=
 =?utf-8?B?cFFud3k1ZkkzM2M1WGFRL3hLaDhab01ucTNTeHlWU1BFdGtFU01oTGxXSUpN?=
 =?utf-8?B?QVNkcHp3dEgyY3Zydi9MRnBoTC9qYmNRNlVDSHBTU1lJNk5ERTg3UER3UWc5?=
 =?utf-8?B?N2EwZHlvUktUSmNENGdPc0JTNmQwVGxQZm04SVlTVUNOZzVqZ1F6VHFQZFha?=
 =?utf-8?B?OVlOTjNrclV4bTAxQWc3RTFPbGo4UjBhbnRRUVRXQ3d4eG1sbHJ5WVAyVVZt?=
 =?utf-8?B?aHhlRVN0R1Yzc2tmQ1NPd2cxc0RrTGg5Q3JrVzZ1cnhaVW0ybi92Ym1OeFVE?=
 =?utf-8?B?bVZCOE9KWUZvSGVVWEpja3VYd2JzVTIwSXcxM0hmVUtLMzAxRXQ0N2dIK2Vn?=
 =?utf-8?B?cVJ3QTNBS0trdzhsUUpCUmFlaE55N3MvczUrN1NveTJxanRTMy85bHovL2NX?=
 =?utf-8?B?N3M5S2hzMVI0WDMxa3FGemtuelVjYWZmYktnNnN5L0hwVmpudVQvSnRRcnox?=
 =?utf-8?B?a2V6T3MrMWdVTHNEeDJJNFpXYnVpZHdTRlhZWlMrN29hMGhWTkZhM2o1VFN2?=
 =?utf-8?B?dXYwWWp1UDZmbWtxenlZczJGRGs0ODVDQ09jcHhEd3ovWnNmRVVjUGl1cktw?=
 =?utf-8?B?WXBVYUw3M2NqWWNXU0VFdE1DZVBOWDI5eGhSRHVrK1cxWkszZzJLaGN1N0hX?=
 =?utf-8?B?cVpsVTlpOENkMHY0YzVzNXM2d0MxcDlpSmFDYVZLb2d4NnZvSTI1VnJxaVE5?=
 =?utf-8?B?TCtXbnR0dHh5dFUvd3pOVEVtYlBEbFdncHNEQXBKS0svb0daZG9Ccy82WFRZ?=
 =?utf-8?B?OURSaVE2VmRhRi9qNG5ETHIzL050RWdET3NHY0FWdmovQkg1dUh2bXcyYzVn?=
 =?utf-8?B?WkIzaWZRSEJvSEVGUVJRanhxbEdDamtEQU5SQUJTR0hoTUFrak13dXY4L09j?=
 =?utf-8?B?WDdlMjYzNFVPODZXOXY0aU9iL0Uvclg4RDY0aC9oZ25qVUprRURyTWgxN3V5?=
 =?utf-8?B?T3lBNEtTVGVza3JsMG50TjBQS0QyUFgyZDFxNFJsWWVZZmp1SDhoMDhHWFFP?=
 =?utf-8?B?dDA1YWFRK2ZUblR1YVlCeEdTUUE1dC9hWnlIM2p0M2FlQXNzOVZWVW9MMUtp?=
 =?utf-8?B?QUFyNUlBajJUbWxvd1lpbGQ3eHBCMlNtZXZwdWU3YTRKNFNYOFNSVWdoaTFs?=
 =?utf-8?B?VFRmaFNkR3N2Mm5NSVJUM05GTmtSMG5uZXp1NDFRSVppR284eXA4VUhET1dQ?=
 =?utf-8?B?Qmt3MkxPUHpEUkl6enlCdmRVMDFmczR1VDR4YjkxeC8xejhZSHl4ZXJxUnRv?=
 =?utf-8?B?N0Rkd1liS2FKYnVFd2d1dyszcHYxWnJoM2hUanllQkR3ZWRrUmxzdjVHMWsx?=
 =?utf-8?B?eVA0MGJwR1RUM3ZMdUViRENKTHVEckpQaS9KRi9NZWNCOXZyYVM3Q2pmZDNV?=
 =?utf-8?B?MFVESzRPNHhIVzNiYXNXV3BqTU1oNDR3ZUdNZ3RSZFhSMXp6MHhBU2VjbWgw?=
 =?utf-8?B?WjBLL2hrM1RVV0l4dmJNWHZBZ0hPVDZFdTFVTk12b1JtLyt4MW1rci8rNml1?=
 =?utf-8?B?ekQ3M2JXSmI0Nkgyd1B6REpwZCtlMDNxOWRVQVhCVE4wa2g4bTgwL29SQnVV?=
 =?utf-8?B?OGVPdzBPaHFOcnZjMmxvc0t0UGxpVFhqVk9kYWRjK2pPUzcxTDFncm5UNzBK?=
 =?utf-8?B?WG11ZmxtKzdLZ0JqanpkTTROUFBKMWVRbkQ4OVZvNTN5N0cwOEhYN0w2RG1Z?=
 =?utf-8?B?SUMzek95cmhTKytDOCtDTUx0NFNoSGJoTzJOQ05QcHBGMzFJOTAweHRMQ0ds?=
 =?utf-8?B?Tk9jTEZaUWpwMVJnUDIyNVFPUWd3SitHVXljZW8vS3JLdmhiU09FZUlXWlgz?=
 =?utf-8?B?TS9yMU5HS1VFQWQ1TFhuRmp6R0FaUFJ4d2FOYzlOaTJ4bVcxS2VPcGUrQ0da?=
 =?utf-8?B?SWdVZEZyOWdKVEVtKzB3dG54ZGhHaERrZld6V3ZvT3Z1MGhhdkQvRkluZUhm?=
 =?utf-8?B?c3lhZUF1Z0lEMWxDYWRtakxxN3pCaFdlMHdIU0NhbEUzL1ZpRzRKdmwrMjZv?=
 =?utf-8?B?MERUUXZHT2lOdkgwOEF1V3R3VnUzV2xIOGVzOFliYjNXTTdCS0FNWUxKU1kz?=
 =?utf-8?B?eGc9PQ==?=
Content-ID: <DFDBC3588F495C49B1B0E8ED31381835@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR03MB7616.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1035d5ca-b0ec-4523-74fb-08db93fc3a39
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2023 08:32:52.0918 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h5yQjOouypQdiItFoZeDh/nbrPOPpYC+e51DVm2HgS0EsS0cHHi5cuMEFcTSehCbhzGhjDmIqPZQ+3j9WH+bdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7375
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_002_1801065578.374948272"
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
Cc: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "clang-built-linux@googlegroups.com" <clang-built-linux@googlegroups.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_002_1801065578.374948272
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpJiMzMjtDSyYjMzI7YW5kJiMzMjtGZWksDQoNClRoYW5rcyYjMzI7Zm9yJiMzMjt0
aGUmIzMyO3Jldmlldy4NCg0KT24mIzMyO1RodSwmIzMyOzIwMjMtMDctMjAmIzMyO2F0JiMzMjsw
Nzo1MiYjMzI7KzAwMDAsJiMzMjtDSyYjMzI7SHUmIzMyOygmIzMyOTkzOyYjMjA0MjY7JiMyMDgw
OTspJiMzMjt3cm90ZToNCiZndDsmIzMyO0hpLCYjMzI7RmVpOg0KJmd0OyYjMzI7DQomZ3Q7JiMz
MjtPbiYjMzI7TW9uLCYjMzI7MjAyMy0wNy0xNyYjMzI7YXQmIzMyOzExOjU5JiMzMjsrMDgwMCwm
IzMyO0ZlaSYjMzI7U2hhbyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyOyYjMzI7
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtFeHRlcm5hbCYjMzI7ZW1haWwmIzMyOzomIzMyO1BsZWFzZSYj
MzI7ZG8mIzMyO25vdCYjMzI7Y2xpY2smIzMyO2xpbmtzJiMzMjtvciYjMzI7b3BlbiYjMzI7YXR0
YWNobWVudHMNCiZndDsmIzMyOyZndDsmIzMyO3VudGlsDQomZ3Q7JiMzMjsmZ3Q7JiMzMjt5b3Um
IzMyO2hhdmUmIzMyO3ZlcmlmaWVkJiMzMjt0aGUmIzMyO3NlbmRlciYjMzI7b3ImIzMyO3RoZSYj
MzI7Y29udGVudC4NCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7SGkmIzMyO0NLLA0KJmd0OyYjMzI7
Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtPbiYjMzI7RnJpLCYjMzI7SnVsJiMzMjsxNCwm
IzMyOzIwMjMmIzMyO2F0JiMzMjs1OjI3JiM4MjM5O1BNJiMzMjtDSyYjMzI7SHUmIzMyOygmIzMy
OTkzOyYjMjA0MjY7JiMyMDgwOTspJiMzMjsmbHQ7Y2suaHVAbWVkaWF0ZWsuY29tJmd0Ow0KJmd0
OyYjMzI7Jmd0OyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsm
IzMyOyZndDsmIzMyOyZndDsmIzMyO0hpLCYjMzI7TmFuY3k6DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsm
Z3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyO09uJiMzMjtGcmksJiMzMjsyMDIz
LTA0LTIxJiMzMjthdCYjMzI7MTA6MTYmIzMyOyswODAwLCYjMzI7TmFuY3kuTGluJiMzMjt3cm90
ZToNCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7c25pcA0KJmd0OyYjMzI7
Jmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtJbiYjMzI7bGlu
ZSYjMzI7NTY2LCYjMzI7dGhlJiMzMjtzdGF0ZW1lbnQmIzMyO2lzDQomZ3Q7JiMzMjsmZ3Q7JiMz
MjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyO2lmJiMzMjsobm9kbykmIzMy
O3sNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjtjb21wX3BkZXYmIzMyOz0mIzMyOy4uLg0KJmd0OyYjMzI7Jmd0OyYjMzI7
Jmd0OyYjMzI7fQ0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMz
MjsmZ3Q7JiMzMjtUaGUmIzMyO2NvbW1lbnQmIzMyO3NheXMmIzMyO3RoYXQmIzMyO29ubHkmIzMy
O292bF9hZGFwdG9lciYjMzI7aGFzJiMzMjtubyYjMzI7ZGV2aWNlJiMzMjtub2RlLCYjMzI7c28N
CiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyO3RoZQ0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYj
MzI7Y2hlY2tpbmcmIzMyO3Nob3VsZCYjMzI7YmUNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMy
Ow0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7aWYmIzMyOyh0eXBlJiMzMjshPSYjMzI7TVRL
X0RJU1BfT1ZMX0FEQVBUT1IpJiMzMjt7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7Y29tcF9wZGV2JiMzMjs9JiMzMjsu
Li4NCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyO30NCiZndDsmIzMyOyZndDsmIzMyOyZndDsm
IzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7YW5kJiMzMjtsYXRlciYjMzI7aXQmIzMy
O3dvdWxkJiMzMjtyZXR1cm4mIzMyO3doZW4mIzMyO3R5cGUmIzMyOz0mIzMyO01US19ESVNQX09W
TF9BREFQVE9SLA0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7c28mIzMyO3RoZXJlJiMzMjt3
b3VsZCYjMzI7YmUmIzMyO25vJiMzMjtwcm9ibGVtJiMzMjtvZiYjMzI7dW5pbml0aWFsaXplZCYj
MzI7c3ltYm9sLg0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtUaGF0JiMz
Mjtzb3VuZHMmIzMyO2ZhaXIsJiMzMjtidXQmIzMyO0lJVUMmIzMyO3doYXQmIzMyO05hbmN5JiMz
Mjt0cmllcyYjMzI7dG8mIzMyO3Jlc29sdmUmIzMyO2hlcmUmIzMyO2lzJiMzMjt0aGUNCiZndDsm
IzMyOyZndDsmIzMyO2ZhbHNlLXBvc2l0aXZlJiMzMjtTbWF0Y2gmIzMyO3dhcm5pbmcuDQomZ3Q7
JiMzMjsmZ3Q7JiMzMjtIb3cmIzMyO2Fib3V0JiMzMjt0aGlzOiYjMzI7Z2l2ZW4mIzMyO3RoZSYj
MzI7JiM5NjtpZiYjMzI7KG5vZGUpJiM5NjsmIzMyO2Jsb2NrJiMzMjt3YXMmIzMyO2V4Y2x1c2l2
ZWx5JiMzMjthZGRlZA0KJmd0OyYjMzI7Jmd0OyYjMzI7Zm9yDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtv
dmxfYWRhcHRvciYjMzI7aW4mIzMyO1sxXSwmIzMyO3BsdXMmIzMyO3RoZSYjMzI7aW5pdCYjMzI7
ZnVuY3Rpb24mIzMyO3dpbGwmIzMyO2ltbWVkaWF0ZWx5JiMzMjtyZXR1cm4NCiZndDsmIzMyOyZn
dDsmIzMyO2FmdGVyJiMzMjt0aGF0JiMzMjtpbiYjMzI7dGhpcyYjMzI7Y2FzZSwmIzMyO2l0JiMz
MjtzaG91bGQmIzMyO2JlJiMzMjtzYWZlJiMzMjt0byYjMzI7ZG8mIzMyO3RoZSYjMzI7Zm9sbG93
aW5nDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyOyYjOTY7JiM5NjsmIzk2
Ow0KJmd0OyYjMzI7Jmd0OyYjMzI7LyomIzMyO05vdCYjMzI7YWxsJiMzMjtkcm0mIzMyO2NvbXBv
bmVudHMmIzMyO2hhdmUmIzMyO2EmIzMyO0RUUyYjMzI7ZGV2aWNlJiMzMjtub2RlLi4uJiMzMjsq
Lw0KJmd0OyYjMzI7Jmd0OyYjMzI7aWYmIzMyOyhub2RlJiMzMjs9PSYjMzI7TlVMTCkNCiZndDsm
IzMyOyZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7cmV0dXJuJiMzMjswOw0KJmd0OyYjMzI7
Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtjb21wX3BkZXYmIzMyOz0mIzMyO29mX2ZpbmRf
ZGV2aWNlX2J5X25vZGUobm9kZSk7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsuLi4NCiZndDsmIzMyOyZn
dDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7aWYmIzMyOyh0eXBlJiMzMjs9PSYjMzI7TVRLX0RJ
U1BfQUFMJiMzMjt8fA0KJmd0OyYjMzI7Jmd0OyYjMzI7Li4uDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsm
Izk2OyYjOTY7JiM5NjsNCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7d2hp
Y2gmIzMyO2lzJiMzMjtlcXVpdmFsZW50JiMzMjt0byYjMzI7YWRkaW5nJiMzMjthJiMzMjsmIzk2
O25vZGUmIzMyOz09JiMzMjtOVUxMJiM5NjsmIzMyO2NoZWNrJiMzMjtiZWZvcmUmIzMyO1sxXS4N
CiZndDsmIzMyOyZndDsmIzMyO1RoaXMmIzMyO3Nob3VsZCYjMzI7c3VwcHJlc3MmIzMyO3RoZSYj
MzI7U21hdGNoJiMzMjt3YXJuaW5nJiMzMjtiZWNhdXNlJiMzMjsmIzk2O2NvbXBfcGRldiYjOTY7
JiMzMjt3aWxsJiMzMjtiZQ0KJmd0OyYjMzI7Jmd0OyYjMzI7KGFnYWluKSYjMzI7dW5jb25kaXRp
b25hbGx5JiMzMjthc3NpZ25lZCYjMzI7dG8mIzMyO3NvbWV0aGluZywmIzMyO2FuZCYjMzI7dGhl
JiMzMjsmIzk2O3R5cGUmIzMyOz09DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtNVEtfRElTUF9PVkxfQURB
UFRPUiYjOTY7JiMzMjtsaW5lJiMzMjtjYW4mIzMyO2JlJiMzMjtkcm9wcGVkJiMzMjthbHNvJiMz
Mjsob3B0aW9uYWwmIzYzOykuDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1RoaXMmIzMyO3NvbHV0aW9u
JiMzMjthbHNvJiMzMjtsb29rcyYjMzI7Z29vZCYjMzI7dG8mIzMyO21lLg0KJmd0OyYjMzI7DQom
Z3Q7JiMzMjtSZWdhcmRzLA0KJmd0OyYjMzI7Q0sNCiZndDsmIzMyOw0KSSYjMzI7d2lsbCYjMzI7
c2VuZCYjMzI7dGhlJiMzMjtuZXh0JiMzMjt2ZXJzaW9uJiMzMjtvZiYjMzI7bW9kaWZpY2F0aW9u
cyYjMzI7YmFzZWQmIzMyO29uJiMzMjt5b3VyDQpzdWdnZXN0aW9ucy4NCg0KVGhhbmtzLA0KTmFu
Y3kNCg0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtbMV06JiMzMjtjb21t
aXQmIzMyOzBkOWVlZTkxMThiNyYjMzI7KCZxdW90O2RybS9tZWRpYXRlazomIzMyO0FkZCYjMzI7
ZHJtJiMzMjtvdmxfYWRhcHRvciYjMzI7c3ViDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtkcml2ZXImIzMy
O2ZvciYjMzI7TVQ4MTk1JnF1b3Q7KQ0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7
JiMzMjtSZWdhcmRzLA0KJmd0OyYjMzI7Jmd0OyYjMzI7RmVpDQoNCjwvcHJlPjwhLS10eXBlOnRl
eHQtLT48IS0tey0tPjxwcmU+KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkg
Tm90aWNlICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGlu
IHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJl
IGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhl
bXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVk
IHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFu
eSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5n
IG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykg
YnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5
IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0
aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZSANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1h
aWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSBy
ZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0
aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwg
YW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90
aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_002_1801065578.374948272
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQ0sgYW5kIEZlaSwNCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3Lg0KDQpPbiBUaHUsIDIwMjMt
MDctMjAgYXQgMDc6NTIgKzAwMDAsIENLIEh1ICjog6Hkv4rlhYkpIHdyb3RlOg0KPiBIaSwgRmVp
Og0KPiANCj4gT24gTW9uLCAyMDIzLTA3LTE3IGF0IDExOjU5ICswODAwLCBGZWkgU2hhbyB3cm90
ZToNCj4gPiAgCSANCj4gPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlu
a3Mgb3Igb3BlbiBhdHRhY2htZW50cw0KPiA+IHVudGlsDQo+ID4geW91IGhhdmUgdmVyaWZpZWQg
dGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gPiAgSGkgQ0ssDQo+ID4gDQo+ID4gT24gRnJp
LCBKdWwgMTQsIDIwMjMgYXQgNToyN+KAr1BNIENLIEh1ICjog6Hkv4rlhYkpIDxjay5odUBtZWRp
YXRlay5jb20+DQo+ID4gd3JvdGU6DQo+ID4gPiANCj4gPiA+IEhpLCBOYW5jeToNCj4gPiA+IA0K
PiA+ID4gT24gRnJpLCAyMDIzLTA0LTIxIGF0IDEwOjE2ICswODAwLCBOYW5jeS5MaW4gd3JvdGU6
DQo+ID4gDQo+ID4gc25pcA0KPiA+ID4gDQo+ID4gPiBJbiBsaW5lIDU2NiwgdGhlIHN0YXRlbWVu
dCBpcw0KPiA+ID4gDQo+ID4gPiBpZiAobm9kbykgew0KPiA+ID4gICAgICAgICBjb21wX3BkZXYg
PSAuLi4NCj4gPiA+IH0NCj4gPiA+IA0KPiA+ID4gVGhlIGNvbW1lbnQgc2F5cyB0aGF0IG9ubHkg
b3ZsX2FkYXB0b2VyIGhhcyBubyBkZXZpY2Ugbm9kZSwgc28NCj4gPiA+IHRoZQ0KPiA+ID4gY2hl
Y2tpbmcgc2hvdWxkIGJlDQo+ID4gPiANCj4gPiA+IGlmICh0eXBlICE9IE1US19ESVNQX09WTF9B
REFQVE9SKSB7DQo+ID4gPiAgICAgICAgIGNvbXBfcGRldiA9IC4uLg0KPiA+ID4gfQ0KPiA+ID4g
DQo+ID4gPiBhbmQgbGF0ZXIgaXQgd291bGQgcmV0dXJuIHdoZW4gdHlwZSA9IE1US19ESVNQX09W
TF9BREFQVE9SLA0KPiA+ID4gc28gdGhlcmUgd291bGQgYmUgbm8gcHJvYmxlbSBvZiB1bmluaXRp
YWxpemVkIHN5bWJvbC4NCj4gPiANCj4gPiBUaGF0IHNvdW5kcyBmYWlyLCBidXQgSUlVQyB3aGF0
IE5hbmN5IHRyaWVzIHRvIHJlc29sdmUgaGVyZSBpcyB0aGUNCj4gPiBmYWxzZS1wb3NpdGl2ZSBT
bWF0Y2ggd2FybmluZy4NCj4gPiBIb3cgYWJvdXQgdGhpczogZ2l2ZW4gdGhlIGBpZiAobm9kZSlg
IGJsb2NrIHdhcyBleGNsdXNpdmVseSBhZGRlZA0KPiA+IGZvcg0KPiA+IG92bF9hZGFwdG9yIGlu
IFsxXSwgcGx1cyB0aGUgaW5pdCBmdW5jdGlvbiB3aWxsIGltbWVkaWF0ZWx5IHJldHVybg0KPiA+
IGFmdGVyIHRoYXQgaW4gdGhpcyBjYXNlLCBpdCBzaG91bGQgYmUgc2FmZSB0byBkbyB0aGUgZm9s
bG93aW5nDQo+ID4gDQo+ID4gYGBgDQo+ID4gLyogTm90IGFsbCBkcm0gY29tcG9uZW50cyBoYXZl
IGEgRFRTIGRldmljZSBub2RlLi4uICovDQo+ID4gaWYgKG5vZGUgPT0gTlVMTCkNCj4gPiAgICAg
cmV0dXJuIDA7DQo+ID4gDQo+ID4gY29tcF9wZGV2ID0gb2ZfZmluZF9kZXZpY2VfYnlfbm9kZShu
b2RlKTsNCj4gPiAuLi4NCj4gPiANCj4gPiBpZiAodHlwZSA9PSBNVEtfRElTUF9BQUwgfHwNCj4g
PiAuLi4NCj4gPiBgYGANCj4gPiANCj4gPiB3aGljaCBpcyBlcXVpdmFsZW50IHRvIGFkZGluZyBh
IGBub2RlID09IE5VTExgIGNoZWNrIGJlZm9yZSBbMV0uDQo+ID4gVGhpcyBzaG91bGQgc3VwcHJl
c3MgdGhlIFNtYXRjaCB3YXJuaW5nIGJlY2F1c2UgYGNvbXBfcGRldmAgd2lsbCBiZQ0KPiA+IChh
Z2FpbikgdW5jb25kaXRpb25hbGx5IGFzc2lnbmVkIHRvIHNvbWV0aGluZywgYW5kIHRoZSBgdHlw
ZSA9PQ0KPiA+IE1US19ESVNQX09WTF9BREFQVE9SYCBsaW5lIGNhbiBiZSBkcm9wcGVkIGFsc28g
KG9wdGlvbmFsPykuDQo+IA0KPiBUaGlzIHNvbHV0aW9uIGFsc28gbG9va3MgZ29vZCB0byBtZS4N
Cj4gDQo+IFJlZ2FyZHMsDQo+IENLDQo+IA0KSSB3aWxsIHNlbmQgdGhlIG5leHQgdmVyc2lvbiBv
ZiBtb2RpZmljYXRpb25zIGJhc2VkIG9uIHlvdXINCnN1Z2dlc3Rpb25zLg0KDQpUaGFua3MsDQpO
YW5jeQ0KDQo+ID4gDQo+ID4gWzFdOiBjb21taXQgMGQ5ZWVlOTExOGI3ICgiZHJtL21lZGlhdGVr
OiBBZGQgZHJtIG92bF9hZGFwdG9yIHN1Yg0KPiA+IGRyaXZlciBmb3IgTVQ4MTk1IikNCj4gPiAN
Cj4gPiBSZWdhcmRzLA0KPiA+IEZlaQ0K

--__=_Part_Boundary_002_1801065578.374948272--

