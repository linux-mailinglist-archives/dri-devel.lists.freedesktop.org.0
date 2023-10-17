Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B0B7CC103
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 12:50:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C0AD10E2BD;
	Tue, 17 Oct 2023 10:50:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16A9B10E2C4
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Oct 2023 10:50:26 +0000 (UTC)
X-UUID: f61c5c366cda11ee8051498923ad61e6-20231017
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=sn3rtb9pVwQlPIvWSC2n25n6SoACll6ihoJfxV6h0xs=; 
 b=UzHt5+2AGbpfAmStHqD24rRjpAx8v5K3Kqd7KUgcuNoFVAu45EzNSGCzxCw7ktsy91pp92kZXVcjGa+GZRA83UO0uSNNwlozJr8qJCoLgVu0YyTWovgf/0yz+Kamqp9ALv1bihTCSXo2dH4RL0ZEt0uW07pECisMFZrCSlyf/74=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:9ad2046e-92ae-4416-9694-d41852fccaae, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5f78ec9, CLOUDID:37cf2215-4929-4845-9571-38c601e9c3c9,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: f61c5c366cda11ee8051498923ad61e6-20231017
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw02.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1010877228; Tue, 17 Oct 2023 18:50:18 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 17 Oct 2023 18:50:17 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Tue, 17 Oct 2023 18:50:17 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b2zmsxqKUAoeeMtzSMAGFbX/6Feo+pjkz172dbQqNVmoRtsVIHHtpOESJSBjg9Zk3h3O7MgDoPLMyaNuaAtjGyqPKVm4mWXOjJ/V5KMHwbW5tBgYn+TpFI8NXDvJ2BJJFhLUtsOZanr1SsYvRCKzKHfizLlqw3GHd9TYRekKHFVy72ZJzn61VYwT0uDXWOsFs39sqHu9PNBdTeJ1TsjA/7CX8xi0c6le/APRZOXVQaeIBQJK9/MNLI2s5QxG4Yi1CmSRG9SlCIH6vTk1Nw1NEYAwVg3nbs995Dgo3i+xvnq7V2lw7wt+wz7Pgfyd4Fhaqm3akjJcmxwJOT0b+aoJ/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2s6rIsj3S+nC9n3/7CRtCj9yH7eOFeG3/2ltEI09ZSs=;
 b=EEo3pPeZyPxHyAi1Knp1rssyEM/AJi5cqu5AasLg7gqO/YXD3sMnM+gbhZX5qk3yuKRQAuUTUOuOXAVXVwC55hatUZM2JRRttJwkAQjDH6flmC2qPxtPorTpjnLGnbKYKA3YUzADnGX3dw4+5tvveR4nmn7NvKJ6MFxRFUeUA0u44ERujCoTagiuDw0VmejiCXC3QT3qvNkZUcdMGEbJRvO/ggOsj+XLdrtyLhPJmbRMH3FGeABNVc8v7TXtMWiYbpO7tM7jJmpM2UM7/5jTzFO6znuaAbY2gRNIRkMR7ujWbQ0guZAvM4DISZWAPMd0VJRBGGWT+TsgoxIqVXAEBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2s6rIsj3S+nC9n3/7CRtCj9yH7eOFeG3/2ltEI09ZSs=;
 b=kgGyOxh/P42vL2yvKAhmtkxJHcYPrKXEW9GrlqCpUlHwI8B5PZHov0hJcmQHd267IkdtWOrRz9MsLYZMRMcq4ZLbl5Nk7pLo9+S9SJg0w9kZN97rIclDr9oYGhC64d57o9x3J92nuU0Hrt356jNol4AZlG3VJDa7dXdcXmnLl+E=
Received: from TYZPR03MB6623.apcprd03.prod.outlook.com (2603:1096:400:1f5::13)
 by KL1PR03MB5603.apcprd03.prod.outlook.com (2603:1096:820:5d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Tue, 17 Oct
 2023 10:50:14 +0000
Received: from TYZPR03MB6623.apcprd03.prod.outlook.com
 ([fe80::faa3:6316:28ab:206b]) by TYZPR03MB6623.apcprd03.prod.outlook.com
 ([fe80::faa3:6316:28ab:206b%4]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 10:50:14 +0000
From: =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>
To: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH v8 15/23] drm/mediatek: Manage component's clock with
 function pointers
Thread-Topic: [PATCH v8 15/23] drm/mediatek: Manage component's clock with
 function pointers
Thread-Index: AQHaAB1EFgvzgIQf10CXPVdnWO1vobBNvcmAgAARZwA=
Date: Tue, 17 Oct 2023 10:50:14 +0000
Message-ID: <714697a54f449cbc78620f7482ca78173fc94230.camel@mediatek.com>
References: <20231016104010.3270-1-shawn.sung@mediatek.com>
 <20231016104010.3270-16-shawn.sung@mediatek.com>
 <91932706-c42c-4c10-96bd-c8a91b7d82f0@collabora.com>
In-Reply-To: <91932706-c42c-4c10-96bd-c8a91b7d82f0@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6623:EE_|KL1PR03MB5603:EE_
x-ms-office365-filtering-correlation-id: 90be9f9f-572a-4975-ea04-08dbcefed839
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8qVLNumOfcTs7GnHdPqzojgqwQYLx0ChRMtP/z7hNB5BHTp+8JiuzFmsVPO88KRJDnUoREie7fSPsE2nxBXONAiUH1PdjoxLWyIee7oPD6hOoDJw07ez+EwHR5Yu9hyiEVz2YgIh+O1rBQb0aS1X2+ot0bp5ZytzAHsWlkleNvD+qcjASPnLmdqUICdmMdRQVKEZDWwK8Nd73xYFYZ1+5e32knUa8P/CN5N4wp1/aICMX5IkJY4qRsdBuzGoM5hlsTv3L5vDuX5VwBaozty9fZNd593E+iH+gI3sUmKZ2BM7teCjtRWfGuBBWCkS+ytpLFuSiF9SF/uH/fQJxguE83EqvmNmaORuH79MJ1wcL35VlhtsN0JzAciZfBKCr6o9j7EGBs6xniAnR3qVBx+++GraAOeaFdhLbg0bFoTKGxoNJFg5glgPJl8ItX2NJ9pVcdedRQAOvBG+jvaLyPsmEEpVvPMzw/u08jyqsyM0nud7GEBEtTGHShTCTc6NqQj1XcZvphzr4OFOKldm0lel0XD2c/6em551iFE2AuzQckdcde5NLsZJnxm41JNERZnWz65ROzdJu30LbfJ31yVOU1tOLeBW8k6d7yCj1zQvZoBpmSusHvBXyQX5wSmlKEfXixIDUa+a1FAhGllIKc261h6z58JxvGk9eN8TBrPA8ag=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6623.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(376002)(39860400002)(366004)(396003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(83380400001)(8676002)(8936002)(6506007)(71200400001)(110136005)(6486002)(478600001)(26005)(76116006)(64756008)(6512007)(66446008)(66556008)(2616005)(54906003)(66476007)(38100700002)(7416002)(66946007)(4001150100001)(2906002)(36756003)(5660300002)(85182001)(86362001)(4326008)(38070700005)(122000001)(316002)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TG9sUEtYcHVVWkVvMDJOcjVjWEVta1FESGV2OXhKL0RYN0VTRzVHRTZxejVk?=
 =?utf-8?B?LzRscE9jcFFGUVN0emQ2QU5vNm1kWjNBampLdjgzTGZXTnUyL3FWdEFoRmlt?=
 =?utf-8?B?SWRQeWhtVGU3V2F4Q3pFRDhZcHQ1cUs0VjhtWVFyKzhQWXFlcE9iNGNpQjN3?=
 =?utf-8?B?YTlrT3hiSk1hTXRtRjBwdjhUOGtJWWZ4Q0ExK3FvZThFRGRDcUtCRXlKOFpL?=
 =?utf-8?B?eDRBQjAza0pkcXpxNTk2czNRT2JVRmVDZDd2RDExNU52YWRLb2N1UXNVaTN6?=
 =?utf-8?B?b3FGWEw4TUZIQ2NUL001cTcyTTl3cG1WNXNBajZGUC9CdUJoUWMybmhGYkg0?=
 =?utf-8?B?YXNSV2Zrajl3MytDVUtxVm9LNXRPU3lyM1JtUnh0dEZ1VE40aTNibERYL1Jl?=
 =?utf-8?B?MUlraHYwT2VnbHFxRTRuWDhVWEhaK3dsUnVXc0xmaGlyWGgwTmJETDhtdWRM?=
 =?utf-8?B?K1J4L0N3L1Ixd2t1STBQSUFYU29nSTZkSHVsbW1YYkhiT1loU3FoVGdHZzVO?=
 =?utf-8?B?MHg3d0NDSlpaU05YRE4rTWExUUpxSUJkcVlVQzd2VHhCRmwrd2NIVUp0enpv?=
 =?utf-8?B?NWNXOTNMNUZaSFhrVU1OcEtrMmdjN2J5T2NRYjN4U1l5bnpneFI5dFRiWDhu?=
 =?utf-8?B?eHNPRUZodXNOR2dBQjRMQ3h6VkdTVEdUM3pjR2JpRWJ6WThVdlhVWVY0U0tj?=
 =?utf-8?B?ODY2V3FGZ1ZlYlRwZGpPNTVlVWFlM21hUmN0eHp3RUdWVG95NHRQKzJHeG5w?=
 =?utf-8?B?MFh6MnRJZGhrYmh6NWtzSmMxSld2djMyY2dna0hsYUJRNmNHaVBEV3BGU282?=
 =?utf-8?B?QmdoRXh6M1owWGZDZ3M0ZGx1aVpsWmpHUmlHNjhzVWtnWVRwbFZQRnZLWlRk?=
 =?utf-8?B?V01wUnJoeWJXbUs3eHJ1QVV0cGlFSzcxNUFZdEluMFlJNVlpNzBKT0paNm5C?=
 =?utf-8?B?TEJ0d3B6TStmU0FHWXVOZTdqMzh5QkRoR04rZUNIUEFhamw4dm9KYkZpWUVj?=
 =?utf-8?B?enpMMmkwNFpBNUVscE9ZSlFjc3RsRkJYYU5HUlJ4eDBmMGVSTE9JOWxPNFFy?=
 =?utf-8?B?R3hYUGQrUElGU0laNllnZFA4SytYcWRPNDUvYzJ6c0JkQW1ISFNkUlEvakR6?=
 =?utf-8?B?cUFxTktuR0MwRjRoU1l6UTZvTWJSZmk1K1pGWWRhUWdvenVSV0lWTDduM1ds?=
 =?utf-8?B?UmYrSFd1NTNCdStwRWI1Q0hKc25udnE2ZWZSVjNhT3R4TG4vQldYMndWU2xa?=
 =?utf-8?B?ODFaeXRBME1vNmFMd1QwdGRHZGtud3J0VUh3UjdreVZHL0VYc0lLVDZVM1dO?=
 =?utf-8?B?anhtYWxtVmphWmp2U1dBREZpcUdtK2tHdit0STZPUjlGQXNuQmF4TUhCRmsz?=
 =?utf-8?B?Y2pFRVlaMnh3WmVlaDlKajVpWXlnZzFuQWkreFliY3N2OVQvY2sySmtnZDJw?=
 =?utf-8?B?U2dRSXpyMzNlOEhsSXA4SEsrWFdScGt0bFVMY1lMakIyRE8zdFRXTUQ2UVJ0?=
 =?utf-8?B?Q0NEMVRGaEtlQmk3WGdHaHlEclNVVFNGYkJRTUJzeXU3c3ltMmx4TjYwanR3?=
 =?utf-8?B?a2E4aEphR2U3dWtiYURWZWZiSnhiN3hkZjFzV3RUbWdmYUl5N1lSbTdZMGo3?=
 =?utf-8?B?dlhsWlNCOXgwVXFmVFVCd01makhTWHBYb3NGQjE4N3orM0YyYlVwWDdsSHRW?=
 =?utf-8?B?bzBhUU9MQzVJYmdMRlR2cTVKcTczcGE1U2RGU3laRXBnbGkzVklGdEUrdHhF?=
 =?utf-8?B?UHo0ZGMxMlM0d0JWZEtGdnA4dmI4cTJNMUdTeVNmSzQwWmNFam5IcGZjVENB?=
 =?utf-8?B?SUdidUdmcUYxckRqZ3RDc0FWMk90aVQrZi9VZFZPb1RmZE9YNjNUQlNKTFlU?=
 =?utf-8?B?dDBOSVdCOW5rRjllNnRWOUZDWkVWTnpvT2FXVFUyZkdNcVUyajZnRUtWeXA4?=
 =?utf-8?B?WTFNUkhwbkNFSDN3TU5SWjdQVCtuL3ZBMTlRU05TcnJHVVhuUTB0N0craUxn?=
 =?utf-8?B?R0JJNlFjZG95MlE5T3UzSkp2K2JiTU9GVUJPaVZ3NldkQUlqNEQwK212eEYw?=
 =?utf-8?B?d0RXamFSbWFycC9qbU5VVGs4U3p3RTVnZnBLVzd2NnpwWGVPbzVuL0NPb1Fu?=
 =?utf-8?B?WEc0a3ZWYzFpdmoyaHJoTDlVbkFHeFFFQzV6R00zUzhmWEZybXJidGRha2p0?=
 =?utf-8?B?OGc9PQ==?=
Content-ID: <5B08DBBC04251549A7EF2C5625408CAC@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6623.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90be9f9f-572a-4975-ea04-08dbcefed839
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2023 10:50:14.7541 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XdaurLVG6t+ugZkvRLFPSw/6ciBvKnjBWAZnrw4A+Uxjh99WeE0ngtISvupgKtS2P3AEAh4iqkh/FYbuockYcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB5603
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_008_1992886791.1075805967"
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
Cc: =?utf-8?B?TmF0aGFuIEx1ICjlkYLmnbHpnJYp?= <Nathan.Lu@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "fshao@chromium.org" <fshao@chromium.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "sean@poorly.run" <sean@poorly.run>,
 "johnson.wang@mediatek.corp-partner.google.com"
 <johnson.wang@mediatek.corp-partner.google.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?utf-8?B?WW9uZ3FpYW5nIE5pdSAo54mb5rC45by6KQ==?= <yongqiang.niu@mediatek.com>,
 "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_008_1992886791.1075805967
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpJiMzMjtBbmdlbG8sDQoNCk9uJiMzMjtUdWUsJiMzMjsyMDIzLTEwLTE3JiMzMjth
dCYjMzI7MTE6NDcmIzMyOyswMjAwLCYjMzI7QW5nZWxvR2lvYWNjaGlubyYjMzI7RGVsJiMzMjtS
ZWdubyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtJbCYjMzI7MTYvMTAvMjMmIzMyOzEyOjQwLCYjMzI7
SHNpYW8mIzMyO0NoaWVuJiMzMjtTdW5nJiMzMjtoYSYjMzI7c2NyaXR0bzoNCiZndDsmIzMyOyZn
dDsmIzMyO0J5JiMzMjtyZWdpc3RlcmluZyYjMzI7Y29tcG9uZW50JiMzMjtyZWxhdGVkJiMzMjtm
dW5jdGlvbnMmIzMyO3RvJiMzMjt0aGUmIzMyO3BvaW50ZXJzLA0KJmd0OyYjMzI7Jmd0OyYjMzI7
d2UmIzMyO2NhbiYjMzI7ZWFzaWx5JiMzMjttYW5hZ2UmIzMyO3RoZW0mIzMyO3dpdGhpbiYjMzI7
YSYjMzI7Zm9yLWxvb3AmIzMyO2FuZCYjMzI7c2ltcGxpZnkmIzMyO3RoZQ0KJmd0OyYjMzI7Jmd0
OyYjMzI7bG9naWMmIzMyO29mJiMzMjtjbG9jayYjMzI7Y29udHJvbCYjMzI7c2lnbmlmaWNhbnRs
eS4NCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7UmV2aWV3ZWQtYnk6JiMz
MjtDSyYjMzI7SHUmIzMyOyZsdDtjay5odUBtZWRpYXRlay5jb20mZ3Q7DQomZ3Q7JiMzMjsmZ3Q7
JiMzMjtTaWduZWQtb2ZmLWJ5OiYjMzI7SHNpYW8mIzMyO0NoaWVuJiMzMjtTdW5nJiMzMjsmbHQ7
c2hhd24uc3VuZ0BtZWRpYXRlay5jb20mZ3Q7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjstLS0NCiZndDsm
IzMyOyZndDsmIzMyOyYjMzI7JiMzMjsuLi4vZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmxf
YWRhcHRvci5jJiMzMjsmIzMyOyYjMzI7fCYjMzI7MTExJiMzMjsrKysrKysrLS0tLQ0KJmd0OyYj
MzI7Jmd0OyYjMzI7LS0tLS0tLQ0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjsmIzMyOzEmIzMyO2Zp
bGUmIzMyO2NoYW5nZWQsJiMzMjs0NCYjMzI7aW5zZXJ0aW9ucygrKSwmIzMyOzY3JiMzMjtkZWxl
dGlvbnMoLSkNCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7ZGlmZiYjMzI7
LS1naXQmIzMyO2EvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bF9hZGFwdG9y
LmMNCiZndDsmIzMyOyZndDsmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNw
X292bF9hZGFwdG9yLmMNCiZndDsmIzMyOyZndDsmIzMyO2luZGV4JiMzMjs2MGU1ZGZlOWVmMGQu
LmZmZmVmMmE0ZjkxOSYjMzI7MTAwNjQ0DQomZ3Q7JiMzMjsmZ3Q7JiMzMjstLS0mIzMyO2EvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bF9hZGFwdG9yLmMNCiZndDsmIzMyOyZn
dDsmIzMyOysrKyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsX2Fk
YXB0b3IuYw0KJmd0OyYjMzI7Jmd0OyYjMzI7QEAmIzMyOy01Myw2JiMzMjsrNTMsNyYjMzI7QEAm
IzMyO3N0cnVjdCYjMzI7b3ZsX2FkYXB0b3JfY29tcF9tYXRjaCYjMzI7ew0KJmd0OyYjMzI7Jmd0
OyYjMzI7JiMzMjsmIzMyO2VudW0mIzMyO210a19vdmxfYWRhcHRvcl9jb21wX3R5cGUmIzMyO3R5
cGU7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyOyYjMzI7ZW51bSYjMzI7bXRrX2RkcF9jb21wX2lk
JiMzMjtjb21wX2lkOw0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjsmIzMyO2ludCYjMzI7YWxpYXNf
aWQ7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrY29uc3QmIzMyO3N0cnVjdCYjMzI7bXRrX2RkcF9jb21w
X2Z1bmNzJiMzMjsqZnVuY3M7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyOyYjMzI7fTsNCiZndDsm
IzMyOyZndDsmIzMyOyYjMzI7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7JiMzMjtzdHJ1
Y3QmIzMyO210a19kaXNwX292bF9hZGFwdG9yJiMzMjt7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtAQCYj
MzI7LTY3LDIwJiMzMjsrNjgsMzUmIzMyO0BAJiMzMjtzdGF0aWMmIzMyO2NvbnN0JiMzMjtjaGFy
JiMzMjsqJiMzMjtjb25zdA0KJmd0OyYjMzI7Jmd0OyYjMzI7cHJpdmF0ZV9jb21wX3N0ZW1bT1ZM
X0FEQVBUT1JfVFlQRV9OVU1dJiMzMjs9JiMzMjt7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyOyYj
MzI7W09WTF9BREFQVE9SX1RZUEVfTUVSR0VdPSYjMzI7JnF1b3Q7bWVyZ2UmcXVvdDssDQomZ3Q7
JiMzMjsmZ3Q7JiMzMjsmIzMyOyYjMzI7fTsNCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7JiMzMjsN
CiZndDsmIzMyOyZndDsmIzMyOytzdGF0aWMmIzMyO2NvbnN0JiMzMjtzdHJ1Y3QmIzMyO210a19k
ZHBfY29tcF9mdW5jcyYjMzI7X2V0aGRyJiMzMjs9JiMzMjt7DQomZ3Q7JiMzMjsNCiZndDsmIzMy
O1NvcnJ5JiMzMjtJJiMzMjtqdXN0JiMzMjtub3RpY2VkJiMzMjt0aGF0OyYjMzI7Y2FuJiMzMjt5
b3UmIzMyO3BsZWFzZSYjMzI7cmVtb3ZlJiMzMjt0aGUmIzMyO2xlYWRpbmcmIzMyOyZxdW90O18m
cXVvdDsmIzMyO2Zyb20NCiZndDsmIzMyO2FsbA0KJmd0OyYjMzI7b2YmIzMyO3Rob3NlJiM2MzsN
CiZndDsmIzMyOw0KJmd0OyYjMzI7X2V0aGRyJiMzMjstJmd0OyYjMzI7ZXRoZHImIzMyO29yJiMz
MjttdGtfZXRoZHINCiZndDsmIzMyO19tZXJnZSYjMzI7LSZndDsmIzMyO21lcmdlJiMzMjtvciYj
MzI7bXRrX21lcmdlDQomZ3Q7JiMzMjtfcmRtYSYjMzI7JiMzMjstJmd0OyYjMzI7cmRtYSYjMzI7
JiMzMjtvciYjMzI7bXRrX3JkbWENCiZndDsmIzMyOw0KJmd0OyYjMzI7VGhhbmtzLA0KJmd0OyYj
MzI7QW5nZWxvDQomZ3Q7JiMzMjsNCg0KU3VyZS4mIzMyO1dpbGwmIzMyO2RvJiMzMjtpbiYjMzI7
dGhlJiMzMjtuZXh0JiMzMjt2ZXJzaW9uLg0KVGhlJiMzMjtyZWFzb24mIzMyO0kmIzMyO2RpZG4m
IzM5O3QmIzMyO3VzZSYjMzI7bXRrXyomIzMyO2lzJiMzMjtzaW1wbHkmIzMyO2JlY2F1c2UmIzMy
O29mJiMzMjt0aGUmIzMyO2NvbHVtbiYjMzI7d2lkdGgNCndpbGwmIzMyO2V4Y2VlZCYjMzI7MTAw
JiMzMjtjaGFyYWNhdGVycy4NCg0KVGhhbmtzLA0KU2hhd24NCg0KPC9wcmU+PCEtLXR5cGU6dGV4
dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBO
b3RpY2UNCiAqKioqKioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBp
biB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBi
ZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4
ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRl
ZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBB
bnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmlu
ZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMp
IGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1h
eSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2Yg
dGhpcyBlLW1haWwsIG9yIGJlbGlldmUNCiANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBl
LW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChi
eSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2Yg
DQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3Rl
bSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55
IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_008_1992886791.1075805967
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQW5nZWxvLA0KDQpPbiBUdWUsIDIwMjMtMTAtMTcgYXQgMTE6NDcgKzAyMDAsIEFuZ2Vsb0dp
b2FjY2hpbm8gRGVsIFJlZ25vIHdyb3RlOg0KPiBJbCAxNi8xMC8yMyAxMjo0MCwgSHNpYW8gQ2hp
ZW4gU3VuZyBoYSBzY3JpdHRvOg0KPiA+IEJ5IHJlZ2lzdGVyaW5nIGNvbXBvbmVudCByZWxhdGVk
IGZ1bmN0aW9ucyB0byB0aGUgcG9pbnRlcnMsDQo+ID4gd2UgY2FuIGVhc2lseSBtYW5hZ2UgdGhl
bSB3aXRoaW4gYSBmb3ItbG9vcCBhbmQgc2ltcGxpZnkgdGhlDQo+ID4gbG9naWMgb2YgY2xvY2sg
Y29udHJvbCBzaWduaWZpY2FudGx5Lg0KPiA+IA0KPiA+IFJldmlld2VkLWJ5OiBDSyBIdSA8Y2su
aHVAbWVkaWF0ZWsuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEhzaWFvIENoaWVuIFN1bmcgPHNo
YXduLnN1bmdAbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+ICAgLi4uL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2Rpc3Bfb3ZsX2FkYXB0b3IuYyAgIHwgMTExICsrKysrKystLS0tDQo+ID4gLS0tLS0t
LQ0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDQ0IGluc2VydGlvbnMoKyksIDY3IGRlbGV0aW9ucygt
KQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rp
c3Bfb3ZsX2FkYXB0b3IuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNw
X292bF9hZGFwdG9yLmMNCj4gPiBpbmRleCA2MGU1ZGZlOWVmMGQuLmZmZmVmMmE0ZjkxOSAxMDA2
NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsX2FkYXB0
b3IuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmxfYWRh
cHRvci5jDQo+ID4gQEAgLTUzLDYgKzUzLDcgQEAgc3RydWN0IG92bF9hZGFwdG9yX2NvbXBfbWF0
Y2ggew0KPiA+ICAgCWVudW0gbXRrX292bF9hZGFwdG9yX2NvbXBfdHlwZSB0eXBlOw0KPiA+ICAg
CWVudW0gbXRrX2RkcF9jb21wX2lkIGNvbXBfaWQ7DQo+ID4gICAJaW50IGFsaWFzX2lkOw0KPiA+
ICsJY29uc3Qgc3RydWN0IG10a19kZHBfY29tcF9mdW5jcyAqZnVuY3M7DQo+ID4gICB9Ow0KPiA+
ICAgDQo+ID4gICBzdHJ1Y3QgbXRrX2Rpc3Bfb3ZsX2FkYXB0b3Igew0KPiA+IEBAIC02NywyMCAr
NjgsMzUgQEAgc3RhdGljIGNvbnN0IGNoYXIgKiBjb25zdA0KPiA+IHByaXZhdGVfY29tcF9zdGVt
W09WTF9BREFQVE9SX1RZUEVfTlVNXSA9IHsNCj4gPiAgIAlbT1ZMX0FEQVBUT1JfVFlQRV9NRVJH
RV0JPSAibWVyZ2UiLA0KPiA+ICAgfTsNCj4gPiAgIA0KPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0
IG10a19kZHBfY29tcF9mdW5jcyBfZXRoZHIgPSB7DQo+IA0KPiBTb3JyeSBJIGp1c3Qgbm90aWNl
ZCB0aGF0OyBjYW4geW91IHBsZWFzZSByZW1vdmUgdGhlIGxlYWRpbmcgIl8iIGZyb20NCj4gYWxs
DQo+IG9mIHRob3NlPw0KPiANCj4gX2V0aGRyIC0+IGV0aGRyIG9yIG10a19ldGhkcg0KPiBfbWVy
Z2UgLT4gbWVyZ2Ugb3IgbXRrX21lcmdlDQo+IF9yZG1hICAtPiByZG1hICBvciBtdGtfcmRtYQ0K
PiANCj4gVGhhbmtzLA0KPiBBbmdlbG8NCj4gDQoNClN1cmUuIFdpbGwgZG8gaW4gdGhlIG5leHQg
dmVyc2lvbi4NClRoZSByZWFzb24gSSBkaWRuJ3QgdXNlIG10a18qIGlzIHNpbXBseSBiZWNhdXNl
IG9mIHRoZSBjb2x1bW4gd2lkdGgNCndpbGwgZXhjZWVkIDEwMCBjaGFyYWNhdGVycy4NCg0KVGhh
bmtzLA0KU2hhd24NCg==

--__=_Part_Boundary_008_1992886791.1075805967--

