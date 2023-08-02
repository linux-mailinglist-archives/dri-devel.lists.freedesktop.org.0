Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0FF76D0A2
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 16:53:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A35810E533;
	Wed,  2 Aug 2023 14:53:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1782A10E533
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 14:53:05 +0000 (UTC)
X-UUID: 47869db6314411eeb20a276fd37b9834-20230802
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=dJ6goB+NvFK7BYGIZPk8xPpRlXHzpr6bXH5YP/69krY=; 
 b=tBSaBJWGxtdDrnv/leH9+8tKX9NrSHvZ2vL0SK7hdGJTk/WfmSF0Zy1vLUp6w1M6weTrlbNH6fP4ob9yH1DkTB4Cm+U3dHcmyFltynGfRIzkEFe3A/3qK1jmofd0fEiuVmkAP8aVKVF92fDMCbzU9Nppv5fTJiAwWw3VQiOv3Ic=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.30, REQID:52672f4e-3ef8-4cd7-8b1b-52c0fac25eb8, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:51,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:51
X-CID-INFO: VERSION:1.1.30, REQID:52672f4e-3ef8-4cd7-8b1b-52c0fac25eb8, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:51,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:51
X-CID-META: VersionHash:1fcc6f8, CLOUDID:b1259dd2-cd77-4e67-bbfd-aa4eaace762f,
 B
 ulkID:230802225303LTIP56LL,BulkQuantity:0,Recheck:0,SF:19|48|29|28|17|102,
 TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:
 0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:PA,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-UUID: 47869db6314411eeb20a276fd37b9834-20230802
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw02.mediatek.com (envelope-from <jiaxin.yu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 121486606; Wed, 02 Aug 2023 22:53:02 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 2 Aug 2023 22:53:02 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Wed, 2 Aug 2023 22:53:01 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IiOcl04tbGyJr/kBQgCIp8bb65HQ4zdjd1BFNjuV+Nh7hjeRYM9h4b42qgnrBzsv7ryu8V/KW07PDYwlI07r3mjK4PyZxzVDJXgzLLmJ4nDQSvAdKBgiN3dqDjzDsKEVoPFQX92OnYXNsV7pqX1pmgdMSnaTncpmOLda3xTK8L3zyizVmltuLNYuFSKASL6k6O7Bf0dlvpjd9obFp+qVCkCe6a7Lbb4cXS9VMdxyzoGvLVH0SV33QOzPqd099RFDrLhdHPKX1UEymV1aV+oVVt/G5xZTLqK2tvJ9dbuBB8GKwBXbY+YAoEfBY+dMloF7DlT+ECCJMl9I0pL4BSy42g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vf0Ob3GoFKzgO51jz6PdnbtA3ZdChCHR2QEDtbM6myM=;
 b=I1PkSSLmTn/rMd5DW7bI/8WbuzPZmIyQaAmkguLGGWEp3O4f7VsdjlPc4QVl201wqkoYhdFM26pDUDZdQT+bUGTToFXJXsAunoM3dgdAxIA2zn8isHrGvf3Q0f7ZJE/oGf8KYRQyC1sgjfKP8fww7ZSEsCoYJbzhwpLQiZS3iCIxpqF98Tp9S4EvoOZRh2cA9AZpabiiSaIv4wWfBTFTiH+CpUXD26zbzpodbTh3huMWH5PzewRJv6SjNrKSweZ+o4rYm2xW7dAm5mrHADjaSYAD5BvH5+m0hD3ix5nGjGB7fXBqA0GinTsDJB3+fKEn9BuQHOIVoNiRXlgkkYJy/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vf0Ob3GoFKzgO51jz6PdnbtA3ZdChCHR2QEDtbM6myM=;
 b=nBCx+JbL3VCc/HJZOFUpuetdG1Fl964jqfoJozvftFxN8zdXHDKvZDLRf4K7EaFEv1VTwofLa/4Cq71VqfpLiCIivp4kLcH6VEDNHDZrX57MJBzlQFun/xVdZM2DljarpxINFO9KwT5Q0oyOIN4U+NIi5MnmroULqE5XI/m/uzo=
Received: from SEYPR03MB6459.apcprd03.prod.outlook.com (2603:1096:101:50::10)
 by KL1PR03MB5764.apcprd03.prod.outlook.com (2603:1096:820:64::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.19; Wed, 2 Aug
 2023 14:52:57 +0000
Received: from SEYPR03MB6459.apcprd03.prod.outlook.com
 ([fe80::b532:b348:3c02:982b]) by SEYPR03MB6459.apcprd03.prod.outlook.com
 ([fe80::b532:b348:3c02:982b%6]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 14:52:57 +0000
From: =?utf-8?B?SmlheGluIFl1ICjkv57lrrbpkasp?= <Jiaxin.Yu@mediatek.com>
To: "broonie@kernel.org" <broonie@kernel.org>
Subject: Re: [v3 2/3] ASoC: mediatek: mt8186: correct the HDMI widgets
Thread-Topic: [v3 2/3] ASoC: mediatek: mt8186: correct the HDMI widgets
Thread-Index: AQHZwxDWBavvSbTht0etjS6nC3ISe6/TxFwAgANXjQA=
Date: Wed, 2 Aug 2023 14:52:57 +0000
Message-ID: <c6ae8630d06138b6d0156c19323afebf0718f522.camel@mediatek.com>
References: <20230730180803.22570-1-jiaxin.yu@mediatek.com>
 <20230730180803.22570-3-jiaxin.yu@mediatek.com>
 <25e6ab45-ecad-4bc3-bf4d-983243c939ad@sirena.org.uk>
In-Reply-To: <25e6ab45-ecad-4bc3-bf4d-983243c939ad@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB6459:EE_|KL1PR03MB5764:EE_
x-ms-office365-filtering-correlation-id: 9e889414-9421-4500-dd5b-08db936828f1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mrHkiwvLh5pKd/Z+6Tm6pLOmE373ApOkUFxTd8A2G0oKSnvWfzZnlxlt6N5I8maXGNxgO/lHT5IBrR8ar0v2JpjT0dgnw4wygd9NxCGQKeW9XC1/mHCsTeuEBh2NdbymQOgndCw5ht/X/A/svbp9WEIdyOeJLyFODza+TOnADn1RgeKVqN75aOlBEvQscj0MygvyaILwzaidNiHp1WxQ5BqGy9iVH5wQH1/lsA6cQZZpbrLcMKY4e6b9RrkXAmfC8QFSs1x8SDr2HJfRRv9QSzvaoUPCD84pGRi2wi7mbDrI9zhp93t4Q6b/2FmfI0C7W8rZyOJFelZz7wVSWyY/iwTWZKWPt9k4UUBiICCzCKeMifXTkc9s3mX1/oZtZO8SnVLA6eb+nNzCMQtMDlF2f9QzhhjEw5gtth3n+aPatcmaCneN9a6+Q615G+0JcrSL0JuDsh3TyRwosicdTZpOKf8qKef3M9qR5JXLx0KzAuizL9WZdk6BDnb8gHlr3kYiqLmR74rNa72A294ChC1Rvu0mkUTe18b7Kdilp8XopTYYSx99md4/+MwuCZrWSCzvxW9qu1CoXX7YWUy3FSgcrb9jXysL1FrO18x7FfhwGaqYmfIFWLATES1NJQdjbC67SCvIt7D7KKO1qk8jCGvCdXmFnPBW+Yp8pvByASu7b5I=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB6459.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(366004)(39860400002)(396003)(136003)(376002)(451199021)(66476007)(66556008)(66946007)(66446008)(64756008)(6916009)(4326008)(316002)(91956017)(76116006)(5660300002)(6506007)(41300700001)(38100700002)(8676002)(7416002)(26005)(186003)(8936002)(6512007)(6486002)(478600001)(2906002)(38070700005)(85182001)(54906003)(36756003)(83380400001)(71200400001)(86362001)(2616005)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cWZEZ2x2RUw2akhNUi91R3diUWVmbzFia0o4c2FLT3dNcGl1aG1keG0yOU9k?=
 =?utf-8?B?Skp3LzZCQU5MUm9HelhuODY0NTUvMXBMRFlDQUdnMDQrQ0syWTFYN3h2YzNU?=
 =?utf-8?B?Y2N3K0p6ZzE3cTNvd3FHbUdDQ04zcmtuT2p3N0VyTFZJRW9tRGNXRVJRemxz?=
 =?utf-8?B?VFlqaHdQRGo1a25remlYOTJsVVZFckllSUs0VC9JYkQ5Z0NCY1JhTlFqdnhm?=
 =?utf-8?B?bmthVlNzN2JOUXlwVEJjaE9wRm9YdzdUMXAvL3M4N05iaU1TZXFCem5jVWMz?=
 =?utf-8?B?RzFFNHgwQ1FhYWZDcFlDbERBb1ViblZGMzhjVklFaXZlZWlOalBOd0cwTy9N?=
 =?utf-8?B?allLOFZFR2xWQXVIREkxd1puZngyajRNY1U1UFZiSkMyRzAxZ2FmV09vQ3Zq?=
 =?utf-8?B?MzhnSmJhOTZpRnB3ZENZM2tWa1h1UnFRZjNqOHhNMi91YWNvQ2pMV0RLckVL?=
 =?utf-8?B?Tk5Xa0NUYm12VU80bTgxcnFOMHJiU2tOOFVadDMwaU56SnpPNmZsWlZpNm8v?=
 =?utf-8?B?ck4wWVVmSk9jOGdXbVZlZXFuajZUMmpTN3h6Q2pVaGQ2NUdINDlKaGx5WTBY?=
 =?utf-8?B?aDN3Q0dJWjB5VERQMHphak54cFA1SnBIeUFNKzJDMFFNVC9QVjZXK1ZmOU1R?=
 =?utf-8?B?MkFVb21HSXMyWVRLMDhScnZ1Y1VyUGYwWEV3QzQ4TjVVM3YyY1h3L0ZhcGY3?=
 =?utf-8?B?eDNBeDhmSHFlRGlUSXlWMmJtRmRRdXNwRFNqeFZuaVBvNklwZkdVbE4wOG9z?=
 =?utf-8?B?MzRramdUdmc0eGl0bzdTVzRGQlI5Vm1HTFljSnRFSFRVR2JtRE56T3FhYTNa?=
 =?utf-8?B?cU80aTJ4VDlIdkFqeWZEbmpwSnF4eW9CdXhOOUs4bld6Zk0vdDVpbnpyVlpw?=
 =?utf-8?B?WGl6dk95SS96aVpqWWtESis2UkxjYTFkZ3VCeHBsWmw0OVhLSTZzYjNncDBP?=
 =?utf-8?B?cStzZXN2R3hleSt4cExjNHlTa1E1cXlJZ08yczNadzNzcU1GWUNZN0RLWXJ6?=
 =?utf-8?B?blE2SGdFMkRHblR1MHMxcVk5ait2c1c0K1VnTGhhU0dHcHlCY1RXeVVsc3dO?=
 =?utf-8?B?cjV2UUN6SGdNSkhyVC9vU3BXdDhBc1pkU05VV0ZxNGdJSGc1QnJVSTU4QU1X?=
 =?utf-8?B?aFkrMWdOVU92NkZLNEx4RGtLM0VmL0hDQUFjaFlqT3c5RnRhK1lYQ2UySHZR?=
 =?utf-8?B?SE15WkFuOFI4aHhZVG53WU82MlhZdFRER056T3ZSSVNSMzJYTGRLSWlHcHJz?=
 =?utf-8?B?ZFhieGZUOXBkbWx6RUJWQWlnNytPbGFRKytsWnI0VWoyQ1djd0cveE5pZDI0?=
 =?utf-8?B?NDV6SVZqN0ExNlVYbFp4K1NDKzZnR1dZcDNNakZJeEVLZ2hoNjN1UFpta0Rk?=
 =?utf-8?B?YUZCK1FNR2tPMHpWT243V1hweTBUdVhXbzA0Q1g4cHNGRnkyRWtzK1d1aG5F?=
 =?utf-8?B?bEpvVzlBbTFUOFI4K3hiUjIwWjlpWFFBaUdPQytMS0p5Sm1EMkpoaVMyU2tG?=
 =?utf-8?B?VDViaG9ZeUNQWldYQ1pGRkdtMEtDTjdXRlZNbUhXQ3U1U0dmd1ExNmd6OEYz?=
 =?utf-8?B?Nkw1cGkxQS85OVNNeG5aRWFlekNJS2Z3OEkxdTFMV3RrU3d0akQ0SDNQYmhx?=
 =?utf-8?B?dkhPb2tVTWtFcGZOdENBQVQyTVdUMWVtTjlQdG5YTXFXOEZSdk1KZ2NrcHFx?=
 =?utf-8?B?WGxMeU9NS1BqVVovTEM1Q0RPZW1nRlo0czh2S2pmbExDYXZZUjZ1bHpDMzFZ?=
 =?utf-8?B?bFAydE52aG9LRCtvLzNuNWdPRnErblhQTmt3MWRyWTZrbEY4UlZKUDM2djIx?=
 =?utf-8?B?VTFiUTVpczVmaUc2OThETEUxRzNheDNoZjVmVVZaYk9hazJST2lhdVFjWWFP?=
 =?utf-8?B?a1crTXpGMVpQQ1Btb3JxMFF0SFRrbThYT3ljMElkV0ozWmdCeE8zZ1kzQ0d3?=
 =?utf-8?B?ZGFSTHdsNmVxZHdaWXBsQlpuekZLbDIza1NOTmM2UVF1SEhBbnpjVmc2K0Ir?=
 =?utf-8?B?N0ZFSXExdlN2cjZMU0taU0FMMExYRUtFVlAvemV5cElIcHhiem1qK3kzWkpW?=
 =?utf-8?B?bHppRkk5NG9PdTBxM2N1VzlmZDkybDRSRjdIRFlBbjB1T1paTDV0aElUbmlS?=
 =?utf-8?B?VVpWcmdXQ09ERkFkVUtldGozL1ozSEEvbjJ3OHhFM2h6RHdFTmtvbWt1Sk9j?=
 =?utf-8?B?RlE9PQ==?=
Content-ID: <1A09919FB4C26F459AB07B0F5D0CA576@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB6459.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e889414-9421-4500-dd5b-08db936828f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2023 14:52:57.5760 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zMqAgn/z6q7+8TKL5FxLe6fK1qf1YqFlyhQZ4VWqyFQit+yWtvPbXK2i7kiSxOJVT6PXoRB2n8dvnpLH2pnIKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB5764
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_003_1710917020.1506625681"
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 =?utf-8?B?Q2h1bnh1IExpICjmnY7mmKXml60p?= <Chunxu.Li@mediatek.com>,
 =?utf-8?B?QWxsZW4tS0ggQ2hlbmcgKOeoi+WGoOWLsik=?= <Allen-KH.Cheng@mediatek.com>,
 "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "robert.foss@linaro.org" <robert.foss@linaro.org>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "ajye_huang@compal.corp-partner.google.com"
 <ajye_huang@compal.corp-partner.google.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_003_1710917020.1506625681
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCk9uJiMzMjtNb24sJiMzMjsyMDIzLTA3LTMxJiMzMjthdCYjMzI7MTI6NTAmIzMyOysw
MTAwLCYjMzI7TWFyayYjMzI7QnJvd24mIzMyO3dyb3RlOg0KJmd0OyYjMzI7T24mIzMyO01vbiwm
IzMyO0p1bCYjMzI7MzEsJiMzMjsyMDIzJiMzMjthdCYjMzI7MDI6MDg6MDJBTSYjMzI7KzA4MDAs
JiMzMjtKaWF4aW4mIzMyO1l1JiMzMjt3cm90ZToNCiZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYj
MzI7VXNlJiMzMjtTTkRfU09DX0RBUE1fTElORSYjMzI7aW5zdGVhZCYjMzI7b2YmIzMyO1NORF9T
T0NfREFQTV9PVVRQVVQmIzMyO3RvJiMzMjt0cmlnZ2VyDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtEQVBN
JiMzMjtldmVudHMmIzMyO3RvJiMzMjtoZG1pLWNvZGVjJiMzMjt3aGVuJiMzMjt1c2Vyc3BhY2Um
IzMyO2NvbnRyb2wmIzMyO3RoZSYjMzI7RFBBTSYjMzI7cGluLg0KJmd0OyYjMzI7DQomZ3Q7JiMz
MjtXaHkmIzYzOw0KDQpJJiMzMjtoYXZlJiMzMjtkZWZpbmVkJiMzMjthbiYjMzI7U09DX0RBUE1f
UElOX1NXSVRDSCYjMzI7dGhhdCYjMzI7bmFtZWQmIzMyO2FzJiMzMjsmcXVvdDtIRE1JMSZxdW90
OywmIzMyO2lmJiMzMjtJJiMzMjt1c2UNClNORF9TT0NfREFQTV9PVVRQVVQsJiMzMjtpdCYjMzI7
Y2FuJiMzOTt0JiMzMjtiZSYjMzI7Y29udHJvbGxlZCYjMzI7YnkmIzMyO0hETUkxJiMzOTtzJiMz
MjtQSU5fU1dJVENILg0KDQomIzMyOzk5NCYjMzI7c3RhdGljJiMzMjtjb25zdCYjMzI7c3RydWN0
JiMzMjtzbmRfa2NvbnRyb2xfbmV3DQomIzMyOzk5NSYjMzI7bXQ4MTg2X210NjM2Nl9kYTcyMTlf
bWF4OTgzNTdfY29udHJvbHNbXSYjMzI7PSYjMzI7ew0KJiMzMjs5OTYmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtTT0NfREFQTV9QSU5fU1dJVENIKCZxdW90O1Nw
ZWFrZXJzJnF1b3Q7KSwNCiYjMzI7OTk3JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7U09DX0RBUE1fUElOX1NXSVRDSCgmcXVvdDtIZWFkcGhvbmVzJnF1b3Q7KSwN
CiYjMzI7OTk4JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7U09D
X0RBUE1fUElOX1NXSVRDSCgmcXVvdDtIZWFkc2V0JiMzMjtNaWMmcXVvdDspLA0KJiMzMjs5OTkm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtTT0NfREFQTV9QSU5f
U1dJVENIKCZxdW90O0hETUkxJnF1b3Q7KSwNCg0KSSYjMzI7dGhpbmsmIzMyO1NORF9TT0NfREFQ
TV9PVVRQVVQmIzMyO211c3QmIzMyO2JlJiMzMjtqdWRnZWQmIzMyO2FzJiMzMjtlcCwmIzMyO3Nv
JiMzMjtJJiMzMjt3YW50JiMzMjt0byYjMzI7ZGVmaW5lDQpIRE1JMSYjMzI7YXMmIzMyO2EmIzMy
O3NuZF9zb2NfZGFwbV9zcGsmIzM5O3MmIzMyO3dpZGdldC4NCkZyb20mIzMyO3RoZSYjMzI7cGVy
c3BlY3RpdmUmIzMyO29mJiMzMjtoYXJkd2FyZSYjMzI7Y29ubmVjdGlvbiwmIzMyO3RoZWlyJiMz
MjtyZWxhdGlvbnNoaXAmIzMyO2lzDQppbmRlZWQmIzMyO2VxdWFsLCYjMzI7c28mIzMyO0kmIzMy
O2ZpbmQmIzMyO1NPQ19TT0NfREFQTV9MSU5FJiMzMjt0byYjMzI7ZGVmaW5lJiMzMjtIRE1JMS4N
Cg0KDQomIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7PT0mZ3Q7JiMzMjtoZG1pLWNvZGVjJiMzMjs9PSZndDsmIzMyO2l0NjUwNShIRE1JJiMz
MjtvdXRwdXQpDQpETDEoRkUpJiMzMjs9PSZndDsmIzMyO0kyUzMoQkUpDQomIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7PT0mZ3Q7JiMzMjty
dDEwMTVwKFNQRUFLRVImIzMyO291dHB1dCkNCg0KMjczOCYjMzI7c3RhdGljJiMzMjt2b2lkJiMz
MjtkYXBtX3VwZGF0ZV93aWRnZXRfZmxhZ3Moc3RydWN0JiMzMjtzbmRfc29jX2RhcG1fd2lkZ2V0
DQoqdykNCjI3MzkmIzMyO3sNCjI3NDAmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjtlbnVtJiMzMjtzbmRfc29jX2RhcG1fZGlyZWN0aW9uJiMzMjtkaXI7DQoyNzQx
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7c3RydWN0JiMzMjtz
bmRfc29jX2RhcG1fcGF0aCYjMzI7KnA7DQoyNzQyJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7dW5zaWduZWQmIzMyO2ludCYjMzI7ZXA7DQoyNzQzJiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7Li4uDQoyNzYwJiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7Y2FzZSYjMzI7c25kX3NvY19kYXBtX291
dHB1dDoNCjI3NjEmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7LyomIzMyO09uJiMzMjthJiMz
MjtmdWxseSYjMzI7cm91dGVkJiMzMjtjYXJkJiMzMjthJiMzMjtvdXRwdXQmIzMyO2lzJiMzMjtu
ZXZlciYjMzI7YSYjMzI7c2luaw0KKi8NCjI3NjImIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
aWYmIzMyOyh3LSZndDtkYXBtLSZndDtjYXJkLSZndDtmdWxseV9yb3V0ZWQpDQoyNzYzJiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjtyZXR1cm47DQoyNzY0JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO2VwJiMzMjs9JiMz
MjtTTkRfU09DX0RBUE1fRVBfU0lOSzsNCjI3NjUmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
c25kX3NvY19kYXBtX3dpZGdldF9mb3JfZWFjaF9zaW5rX3BhdGgodywmIzMyO3ApJiMzMjt7DQoy
NzY2JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjtpZiYjMzI7KHAtJmd0O3NpbmstJmd0O2lkJiMzMjs9PSYjMzI7c25kX3Nv
Y19kYXBtX3NwayYjMzI7fHwNCjI3NjcmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjtwLSZndDtzaW5rLSZndDtpZCYjMzI7PT0mIzMyO3NuZF9zb2NfZGFw
bV9ocCYjMzI7fHwNCjI3NjgmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjtwLSZndDtzaW5rLSZndDtpZCYjMzI7PT0mIzMyO3NuZF9zb2NfZGFwbV9saW5l
DQp8fA0KMjc2OSYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyO3AtJmd0O3NpbmstJmd0O2lkJiMzMjs9PSYjMzI7c25kX3NvY19kYXBtX2lucHV0KQ0Kew0K
Mjc3MCYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtlcCYjMzI7PSYjMzI7MDsNCjI3
NzEmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7YnJlYWs7DQoyNzcyJiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
Mjt9DQoyNzczJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO30NCjI3NzQmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7YnJlYWs7DQoNCjwvcHJlPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxw
cmU+KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlICoqKioqKioq
KioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1l
c3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwg
cHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xv
c3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5
ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWlu
YXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2Yg
dGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCBy
ZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwu
IElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3Ig
YmVsaWV2ZSANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBs
ZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlz
IGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5j
bHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlz
Y2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhh
bmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_003_1710917020.1506625681
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDIzLTA3LTMxIGF0IDEyOjUwICswMTAwLCBNYXJrIEJyb3duIHdyb3RlOg0KPiBP
biBNb24sIEp1bCAzMSwgMjAyMyBhdCAwMjowODowMkFNICswODAwLCBKaWF4aW4gWXUgd3JvdGU6
DQo+IA0KPiA+IFVzZSBTTkRfU09DX0RBUE1fTElORSBpbnN0ZWFkIG9mIFNORF9TT0NfREFQTV9P
VVRQVVQgdG8gdHJpZ2dlcg0KPiA+IERBUE0gZXZlbnRzIHRvIGhkbWktY29kZWMgd2hlbiB1c2Vy
c3BhY2UgY29udHJvbCB0aGUgRFBBTSBwaW4uDQo+IA0KPiBXaHk/DQoNCkkgaGF2ZSBkZWZpbmVk
IGFuIFNPQ19EQVBNX1BJTl9TV0lUQ0ggdGhhdCBuYW1lZCBhcyAiSERNSTEiLCBpZiBJIHVzZQ0K
U05EX1NPQ19EQVBNX09VVFBVVCwgaXQgY2FuJ3QgYmUgY29udHJvbGxlZCBieSBIRE1JMSdzIFBJ
Tl9TV0lUQ0guDQoNCiA5OTQgc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfa2NvbnRyb2xfbmV3DQog
OTk1IG10ODE4Nl9tdDYzNjZfZGE3MjE5X21heDk4MzU3X2NvbnRyb2xzW10gPSB7DQogOTk2ICAg
ICAgICAgU09DX0RBUE1fUElOX1NXSVRDSCgiU3BlYWtlcnMiKSwNCiA5OTcgICAgICAgICBTT0Nf
REFQTV9QSU5fU1dJVENIKCJIZWFkcGhvbmVzIiksDQogOTk4ICAgICAgICAgU09DX0RBUE1fUElO
X1NXSVRDSCgiSGVhZHNldCBNaWMiKSwNCiA5OTkgICAgICAgICBTT0NfREFQTV9QSU5fU1dJVENI
KCJIRE1JMSIpLA0KDQpJIHRoaW5rIFNORF9TT0NfREFQTV9PVVRQVVQgbXVzdCBiZSBqdWRnZWQg
YXMgZXAsIHNvIEkgd2FudCB0byBkZWZpbmUNCkhETUkxIGFzIGEgc25kX3NvY19kYXBtX3Nwaydz
IHdpZGdldC4NCkZyb20gdGhlIHBlcnNwZWN0aXZlIG9mIGhhcmR3YXJlIGNvbm5lY3Rpb24sIHRo
ZWlyIHJlbGF0aW9uc2hpcCBpcw0KaW5kZWVkIGVxdWFsLCBzbyBJIGZpbmQgU09DX1NPQ19EQVBN
X0xJTkUgdG8gZGVmaW5lIEhETUkxLg0KDQoNCiAgICAgICAgICAgICAgICAgICAgICAgPT0+IGhk
bWktY29kZWMgPT0+IGl0NjUwNShIRE1JIG91dHB1dCkNCkRMMShGRSkgPT0+IEkyUzMoQkUpDQog
ICAgICAgICAgICAgICAgICAgICAgID09PiBydDEwMTVwKFNQRUFLRVIgb3V0cHV0KQ0KDQoyNzM4
IHN0YXRpYyB2b2lkIGRhcG1fdXBkYXRlX3dpZGdldF9mbGFncyhzdHJ1Y3Qgc25kX3NvY19kYXBt
X3dpZGdldA0KKncpDQoyNzM5IHsNCjI3NDAgICAgICAgICBlbnVtIHNuZF9zb2NfZGFwbV9kaXJl
Y3Rpb24gZGlyOw0KMjc0MSAgICAgICAgIHN0cnVjdCBzbmRfc29jX2RhcG1fcGF0aCAqcDsNCjI3
NDIgICAgICAgICB1bnNpZ25lZCBpbnQgZXA7DQoyNzQzICAgICAgICAgLi4uDQoyNzYwICAgICAg
ICAgY2FzZSBzbmRfc29jX2RhcG1fb3V0cHV0Og0KMjc2MSAgICAgICAgICAgICAgICAgLyogT24g
YSBmdWxseSByb3V0ZWQgY2FyZCBhIG91dHB1dCBpcyBuZXZlciBhIHNpbmsNCiovDQoyNzYyICAg
ICAgICAgICAgICAgICBpZiAody0+ZGFwbS0+Y2FyZC0+ZnVsbHlfcm91dGVkKQ0KMjc2MyAgICAg
ICAgICAgICAgICAgICAgICAgICByZXR1cm47DQoyNzY0ICAgICAgICAgICAgICAgICBlcCA9IFNO
RF9TT0NfREFQTV9FUF9TSU5LOw0KMjc2NSAgICAgICAgICAgICAgICAgc25kX3NvY19kYXBtX3dp
ZGdldF9mb3JfZWFjaF9zaW5rX3BhdGgodywgcCkgew0KMjc2NiAgICAgICAgICAgICAgICAgICAg
ICAgICBpZiAocC0+c2luay0+aWQgPT0gc25kX3NvY19kYXBtX3NwayB8fA0KMjc2NyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHAtPnNpbmstPmlkID09IHNuZF9zb2NfZGFwbV9ocCB8
fA0KMjc2OCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHAtPnNpbmstPmlkID09IHNu
ZF9zb2NfZGFwbV9saW5lDQp8fA0KMjc2OSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHAtPnNpbmstPmlkID09IHNuZF9zb2NfZGFwbV9pbnB1dCkNCnsNCjI3NzAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVwID0gMDsNCjI3NzEgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KMjc3MiAgICAgICAgICAgICAgICAgICAg
ICAgICB9DQoyNzczICAgICAgICAgICAgICAgICB9DQoyNzc0ICAgICAgICAgICAgICAgICBicmVh
azsNCg==

--__=_Part_Boundary_003_1710917020.1506625681--

