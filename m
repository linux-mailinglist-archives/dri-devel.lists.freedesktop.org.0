Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 316997A7311
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 08:48:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80FFD10E441;
	Wed, 20 Sep 2023 06:48:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5532710E441
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 06:48:12 +0000 (UTC)
X-UUID: a8d4fb4a578111ee8051498923ad61e6-20230920
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=rb5UqwXwfTHRDVLBkCAR0nvuirZ0WSBC//ML3HlrGPs=; 
 b=ojvNSiLFFcTDIrRARV0Zmsvs3fPpO57r+m/Z+1sUhPWlLAyGwdREEIUiHwaeMCUkGM35H7uw/Vd7PSwZy6AKHQ5Lgn1F4Y9L3A/ac8AgrTrOaBqQ7d7xBaYU/VcU0+YAsULwUB3vxgHAs120TxJi6iRcg+N8m2Nz9zaxndPsaqg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:3d78c9c8-9625-41a3-8777-38dea8a6d692, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5f78ec9, CLOUDID:cf7c3dc3-1e57-4345-9d31-31ad9818b39f,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: a8d4fb4a578111ee8051498923ad61e6-20230920
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1422466417; Wed, 20 Sep 2023 14:48:08 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 20 Sep 2023 14:48:07 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Sep 2023 14:48:07 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=chonWgF2IwA0MmUgn0mohgJTC6HPfvWFvHuVvV+LteqEp1sDSODMlqj1hRTKku/+rHvzwPrQtzIoIVlMB1ImzG8BHKVZVQW9fSrUBiQIdyirYNvRckLC1g126l1J6xoSbDBljRSsWPmrIqR50+Avq85QREIO7P9xGg+//ObIZCBwphXZd6iPr6KsffLQnaX6HVAGY9e0Vt8XvFEJA1lozvXtj54oQI4jTlJIK8pwCc8zeb1h6XAAugx6dNRTzlY7zX7ntVJaLdQB7byEUusK7OvbxnYcRyFfsTjgcqoAjZ1EV+fVgaVDlO+HbCB3b3lyiBYO2ftSrL6zDXO8e9l33w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xd6UD0lpiZEJpu1Ss2nBSvZLx949pcvoG78Z9xP77Wo=;
 b=ZYqWaoBcnaSBmPyRxdUm0ImweiRthReUDoAh5OdYZv2Tj7zc34Mq2lFF32JqEEUsqI0/pKyO1zVhavcWy8UqhTQUEcLpHfXjP3y7On+msX2B1LXxSSeNqMPoQSIZm2hpBRh5AMHDcdo0Xu6FospswGqj9TP9q8kV4M/sstSLKSC+ydjfolH/LKkm1Reu635yPHgPjFzxnUupHVtKcbF45Y3LT+8cV/RXju7/EPPsreVXdRdkQGsWsh0FVwMlSe6bzLE5Lzlz/3tsV+Outm5TOwP+ZjD1CMfcu+M71DI45C9tsgAIpLYWLvF6x6dsHUM9OwjEsMAkje3vB9bk+IrKrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xd6UD0lpiZEJpu1Ss2nBSvZLx949pcvoG78Z9xP77Wo=;
 b=F0zsCnujvpTJ1QIoVySR1k2lin5byvyb6spbdPiCi6YLeJOjwvJQpEZgsRdG96r4ASY+BnpwmLoam3Kld9zspILvh1SK03x5DOSXpTLC/rjFD0R4Mkhzx2bUwRE6K1kbDPkuWr8vJEMy5zPIiym9va1rdmFV719hSyAzG0OBBqc=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYSPR03MB7386.apcprd03.prod.outlook.com (2603:1096:400:42e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Wed, 20 Sep
 2023 06:48:05 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9c2c:c08a:212f:e984]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9c2c:c08a:212f:e984%6]) with mapi id 15.20.6792.026; Wed, 20 Sep 2023
 06:48:04 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [RESEND PATCH v6 12/20] drm/mediatek: Refine device table of OVL
 adaptor
Thread-Topic: [RESEND PATCH v6 12/20] drm/mediatek: Refine device table of OVL
 adaptor
Thread-Index: AQHZ5IOtrFOLXF0a4EKn1nlLCbDfH7AjU8cA
Date: Wed, 20 Sep 2023 06:48:04 +0000
Message-ID: <45e51d006e7d4cc43f08856be1077127f0d85a5f.camel@mediatek.com>
References: <20230911074233.31556-1-shawn.sung@mediatek.com>
 <20230911074233.31556-13-shawn.sung@mediatek.com>
In-Reply-To: <20230911074233.31556-13-shawn.sung@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYSPR03MB7386:EE_
x-ms-office365-filtering-correlation-id: 4227297e-d3a6-4000-a666-08dbb9a58a95
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aUEaLQaohZdu3+8oejl2lgF9PptHoXTbIvL2fieGEul5T6WvzzWS067yD4+WuwCO12eEs6Vun9LqcYXeyA0SK+9RRY5QwfOvWmdIakX2OQSfWYO0Q1BNhbSpIOYm85wilD5uC5Ac3VcajbAA5E4bOIBdFChUWsB6o+sqcB/nLn6tnkS2mIsNMFPOjIRtO3kYrdbLrQuGs3y7MLOdaI3A/iRqeCpjKiWuMcYvPNi6M02PSVCbFvgBpd2+/fNbk94oiHO5yqgNVLN3XiOoegIpBeaj6JEBKeQhrCf2m0Paz0q0Lb0QukunFhiSMBrCPTMOoyDqUXcsmP53pqR91WxcJYjOcps9ttnOMWFBzkrAMRmEjTXN6155FhNcu3XH7M0YFfNzXNbxN5ZvPxJ88nxanBkTEZkcVFNQ5+mSpGWF+cnLhIDraRm96SHc+TelDTW4jOyXa11ZknBgzQBDblOf+2DEQKfm2xkdt2nVTeuQui+U1o6CXIYsO//mHm2gsp4w/jtBQPbcxTU9OeDxArB4n9wYhKihUGsaObfCsoq4SWxupH/GvVFyFmposNOmJGj1XLxxsaYB61o2I2IIxvPpu8xLu47/9189eSWeMRqK4LrmmUKSkeUzB705O8E7T4/fjM6mY38wQ5ufwTlOV6aN+l67aBEJ+kYqCTP8342aSwA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(396003)(366004)(346002)(39860400002)(1800799009)(186009)(451199024)(316002)(54906003)(41300700001)(66446008)(66556008)(91956017)(66946007)(64756008)(76116006)(110136005)(66476007)(478600001)(71200400001)(122000001)(38100700002)(38070700005)(2906002)(36756003)(86362001)(85182001)(7416002)(8936002)(5660300002)(2616005)(83380400001)(8676002)(4326008)(26005)(6506007)(6512007)(6486002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WUQzZlBvMEErWHhsVFV2NEhwODhiZFVPN3lPSWhpTWg2T1dTQjNJbUNpekdl?=
 =?utf-8?B?ZmVHTDRKTm9TMVZaU1NONXdWTFRXUmRVYUpRZzIvVklnaDdVOG1nemxCS2Vk?=
 =?utf-8?B?QUFmSE41S252S0wwTTYzbitvVGRxb3gzeDMxSEw1VExpRkVrTmJhQ3owYzFq?=
 =?utf-8?B?a05JSktFaUkxeHdJVDNCU01PNWIxVCs4THNCY2c4UXh4M1ZIY2xmWmpBUXFz?=
 =?utf-8?B?K3cxVU9wNWxvbG9obkRTL3gvSDY3dGRPemJKd3JsSjF4ZndhVWRydlJaeW9F?=
 =?utf-8?B?SDNHMTYwcEN0YWd0a3ZCV0RockxmWGxTQmFZbUc2ellsYWRCek1kdVBIdHpV?=
 =?utf-8?B?aGROOTZCRVlJWForUTJuckprbkIvR3Q0WXh3NTluUzdCZ1BNdzQ2ODVKbDNZ?=
 =?utf-8?B?bFoxUkdQK2JaRWlsYksrRm9UTDd2d2pweHRvT1JKZ3lYbXZ0YXh2bWgvcjVG?=
 =?utf-8?B?K3RMeitsWjA3WFEraHVqV1RqVmNXdGw0QXp4OFNLcVRJcXREREw1Vkw1MjEr?=
 =?utf-8?B?eDVMRmtqUXNYZ3lFK1ZHZEYrYzdtVjBVZXZUZVN4NmlOTFJYUUlZWTVCdFRh?=
 =?utf-8?B?a2JaaVBDUkZPZFUzenNuQmJUM2I3a0d4TWtZTkR6UUFxSHdUcjRTTk5WQys3?=
 =?utf-8?B?MGNDbHpJK2NjT2c3K2JvMDZsY1RRcFlmWHZVcGtwWXhyOTE0VWhxUEZCVlZH?=
 =?utf-8?B?TjRzRWRiS0UrdEw3VGFZL3UyK2p2cUlJYkRJeTBESmZUQ0U5dU5oL3RWU25u?=
 =?utf-8?B?NjRyd3pEM2llS20wYjJORHB1NlZRUGthYWVjalJ0NXQ1SXVScUhaa01aaElQ?=
 =?utf-8?B?SnFiYlRQNzQ3NTJsNGxaeFRWVExLVGJ4L0lBeURFY0JBNnlqR05pamRTSXFO?=
 =?utf-8?B?b092d0J0NFNwWWpScWZ0S2l2djNVLy9UbDdPN0ZJbFRaamFGY20xWU9Sdkln?=
 =?utf-8?B?Sjg5R1BMT2dXUTZ1M3lrV2Vva2tuK2ZIUURkY0VIaHR4ZlF2dnVETlJ5bGlP?=
 =?utf-8?B?RUdyU1VhZDRiUitnUkdrMEhvY3JkQU1WQ205dytNSUdsZFBDVVk0MTBsVU0y?=
 =?utf-8?B?NGJoZ1VWRkpucjR5R241dm1vNnBMTHpsVHRCaG1sNkVOTlc0MWxkZ0pPNG53?=
 =?utf-8?B?U3h3M2FmU2U4Tkc3bm5tTlo0bFZtUEN3SHhCdmwzYnhieTFyUGZQV3ZkL0dJ?=
 =?utf-8?B?b2piV0Z2UVlqTEtKWldhaEFML1lTNFN5a1dKRU55UzgvMEQvQ1l0WWMvNmk3?=
 =?utf-8?B?cnZTVU1VT25nNDFBeVkxY0p4ejZQejZLd0NxZVh4b09NeUsxakp4V3B4bUIy?=
 =?utf-8?B?Zy9PMGJBNmx3aHM0ZDlkS0tpUkQ2ZEFrUldRdk1kRm1SSEc1RUpUV2R1bnds?=
 =?utf-8?B?MlhNRmEyZjM5Z1ptam14RURwUmlaQyt5MUlNMm1xcXU1UTdEYkt6aloxaXZF?=
 =?utf-8?B?aHhtRllISm9QR2VFVkFTUVgwaFovd2NqS0FsMVpZZFI4RDdSSUsvbHY3ejlZ?=
 =?utf-8?B?VUVIMWttd3RJQ3E0Y2dqbDB4NGgxM3RmbVdiZEVQS1RiUEV1aXBWU3F6eHRX?=
 =?utf-8?B?MEdBMVNsaGZSVVZ5cUE5aVd4MkQ5bUVxTXZKWENpc0RVRlVOOTFyZ1hGTkpu?=
 =?utf-8?B?NDROTnMycXpyM1JrRGJob1RnRE45TEV3SlA4SXJIWU50WktnRXFDcnhhL2ZB?=
 =?utf-8?B?Y21US3Y0dFlmdkF3RXNNUXQvckRXWU85MUNUd0daVXc0N3h6cFRML0pWWmll?=
 =?utf-8?B?VkxKdlNoa3l4d3NxempYM3JETzJnb0M1R1RsbU9GN3d2ZEM4V1RxZmwwQ0ph?=
 =?utf-8?B?TFJlTE1Kd1orRG95QlN2RzdMb1JrVGVJdlE2dTNDdkRhaG9HRlgwRE1sRmt2?=
 =?utf-8?B?ZXlQeTZLRFdaOXBMSDZsVjVvRmdOVU56ZW1maUlFMWlhWWpQdXB0RXBja0F6?=
 =?utf-8?B?cGFLTEREdEJ6eDZlZTl4dVBnSUdxNUhkMU9Yc1J2UVBDNUloeHA4RjE5a3ht?=
 =?utf-8?B?eHR3alcyZFVXdWs3UmEwS1pSREhoYmtTMHo0RWlDOVdZY013NHlwaTErTHhU?=
 =?utf-8?B?cEhtUGQrUEx5bE1YcWNVRWxrc0w1TkthbUxoUGdDVlJJbGJNRGFoL3k2UXIz?=
 =?utf-8?Q?iemybAhzQ6Uwik5hPNzH5YnAl?=
Content-ID: <871A9FCE9579CA4AA19E22B503E134B6@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4227297e-d3a6-4000-a666-08dbb9a58a95
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2023 06:48:04.8804 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ks+1ZUQPkee4Pj1ExxaqRjF7IO7jSqagpEd2zEevaTkVhXQ26hXOdMG8pn2y+PD8saVt5Y7Xc10gMdqPXpJT+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7386
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_004_2100862750.288263213"
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

--__=_Part_Boundary_004_2100862750.288263213
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpLCYjMzI7SHNpYW8tY2hpZW46DQoNCk9uJiMzMjtNb24sJiMzMjsyMDIzLTA5LTEx
JiMzMjthdCYjMzI7MTU6NDImIzMyOyswODAwLCYjMzI7SHNpYW8mIzMyO0NoaWVuJiMzMjtTdW5n
JiMzMjt3cm90ZToNCiZndDsmIzMyOy0mIzMyO0FkanVzdCYjMzI7aW5kZW50YXRpb24mIzMyO3Rv
JiMzMjthbGlnbiYjMzI7d2l0aCYjMzI7b3RoZXImIzMyO2ZpbGVzDQomZ3Q7JiMzMjstJiMzMjtT
b3J0JiMzMjtkZXZpY2UmIzMyO3RhYmxlJiMzMjtpbiYjMzI7YWxwaGFiZXRpY2FsJiMzMjtvcmRl
cg0KJmd0OyYjMzI7LSYjMzI7QWRkJiMzMjtzZW50aW5lbCYjMzI7dG8mIzMyO2RldmljZSYjMzI7
dGFibGUNCg0KUmV2aWV3ZWQtYnk6JiMzMjtDSyYjMzI7SHUmIzMyOyZsdDtjay5odUBtZWRpYXRl
ay5jb20mZ3Q7DQoNCiZndDsmIzMyOw0KJmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO0hzaWFv
JiMzMjtDaGllbiYjMzI7U3VuZyYjMzI7Jmx0O3NoYXduLnN1bmdAbWVkaWF0ZWsuY29tJmd0Ow0K
Jmd0OyYjMzI7LS0tDQomZ3Q7JiMzMjsmIzMyO2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZGlzcF9vdmxfYWRhcHRvci5jJiMzMjt8JiMzMjsxNSYjMzI7KysrKy0tLS0tLS0tLS0tDQomZ3Q7
JiMzMjsmIzMyOzEmIzMyO2ZpbGUmIzMyO2NoYW5nZWQsJiMzMjs0JiMzMjtpbnNlcnRpb25zKCsp
LCYjMzI7MTEmIzMyO2RlbGV0aW9ucygtKQ0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtkaWZmJiMzMjst
LWdpdCYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsX2FkYXB0b3Iu
Yw0KJmd0OyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsX2FkYXB0
b3IuYw0KJmd0OyYjMzI7aW5kZXgmIzMyOzExNGVkZWQ4MTc3ZS4uNGE1ZmFiNWVhNTFmJiMzMjsx
MDA2NDQNCiZndDsmIzMyOy0tLSYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rp
c3Bfb3ZsX2FkYXB0b3IuYw0KJmd0OyYjMzI7KysrJiMzMjtiL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZGlzcF9vdmxfYWRhcHRvci5jDQomZ3Q7JiMzMjtAQCYjMzI7LTM4NiwxNyYjMzI7
KzM4NiwxMCYjMzI7QEAmIzMyO3N0YXRpYyYjMzI7aW50JiMzMjtvdmxfYWRhcHRvcl9jb21wX2dl
dF9pZChzdHJ1Y3QNCiZndDsmIzMyO2RldmljZSYjMzI7KmRldiwmIzMyO3N0cnVjdCYjMzI7ZGV2
aWNlX25vZGUmIzMyOypub2RlLA0KJmd0OyYjMzI7JiMzMjt9DQomZ3Q7JiMzMjsNCiZndDsmIzMy
OyYjMzI7c3RhdGljJiMzMjtjb25zdCYjMzI7c3RydWN0JiMzMjtvZl9kZXZpY2VfaWQmIzMyO210
a19vdmxfYWRhcHRvcl9jb21wX2R0X2lkc1tdJiMzMjs9JiMzMjt7DQomZ3Q7JiMzMjstew0KJmd0
OyYjMzI7LS5jb21wYXRpYmxlJiMzMjs9JiMzMjsmcXVvdDttZWRpYXRlayxtdDgxOTUtdmRvMS1y
ZG1hJnF1b3Q7LA0KJmd0OyYjMzI7LS5kYXRhJiMzMjs9JiMzMjsodm9pZCYjMzI7KilPVkxfQURB
UFRPUl9UWVBFX01EUF9SRE1BLA0KJmd0OyYjMzI7LX0sJiMzMjt7DQomZ3Q7JiMzMjstLmNvbXBh
dGlibGUmIzMyOz0mIzMyOyZxdW90O21lZGlhdGVrLG10ODE5NS1kaXNwLW1lcmdlJnF1b3Q7LA0K
Jmd0OyYjMzI7LS5kYXRhJiMzMjs9JiMzMjsodm9pZCYjMzI7KilPVkxfQURBUFRPUl9UWVBFX01F
UkdFLA0KJmd0OyYjMzI7LX0sJiMzMjt7DQomZ3Q7JiMzMjstLmNvbXBhdGlibGUmIzMyOz0mIzMy
OyZxdW90O21lZGlhdGVrLG10ODE5NS1kaXNwLWV0aGRyJnF1b3Q7LA0KJmd0OyYjMzI7LS5kYXRh
JiMzMjs9JiMzMjsodm9pZCYjMzI7KilPVkxfQURBUFRPUl9UWVBFX0VUSERSLA0KJmd0OyYjMzI7
LX0sDQomZ3Q7JiMzMjste30sDQomZ3Q7JiMzMjsreyYjMzI7LmNvbXBhdGlibGUmIzMyOz0mIzMy
OyZxdW90O21lZGlhdGVrLG10ODE5NS1kaXNwLWV0aGRyJnF1b3Q7LCYjMzI7LmRhdGEmIzMyOz0m
IzMyOyh2b2lkDQomZ3Q7JiMzMjsqKU9WTF9BREFQVE9SX1RZUEVfRVRIRFImIzMyO30sDQomZ3Q7
JiMzMjsreyYjMzI7LmNvbXBhdGlibGUmIzMyOz0mIzMyOyZxdW90O21lZGlhdGVrLG10ODE5NS1k
aXNwLW1lcmdlJnF1b3Q7LCYjMzI7LmRhdGEmIzMyOz0mIzMyOyh2b2lkDQomZ3Q7JiMzMjsqKU9W
TF9BREFQVE9SX1RZUEVfTUVSR0UmIzMyO30sDQomZ3Q7JiMzMjsreyYjMzI7LmNvbXBhdGlibGUm
IzMyOz0mIzMyOyZxdW90O21lZGlhdGVrLG10ODE5NS12ZG8xLXJkbWEmcXVvdDssJiMzMjsuZGF0
YSYjMzI7PSYjMzI7KHZvaWQNCiZndDsmIzMyOyopT1ZMX0FEQVBUT1JfVFlQRV9NRFBfUkRNQSYj
MzI7fSwNCiZndDsmIzMyOyt7JiMzMjsvKiYjMzI7c2VudGluZWwmIzMyOyovJiMzMjt9DQomZ3Q7
JiMzMjsmIzMyO307DQomZ3Q7JiMzMjsNCiZndDsmIzMyOyYjMzI7c3RhdGljJiMzMjtpbnQmIzMy
O2NvbXBhcmVfb2Yoc3RydWN0JiMzMjtkZXZpY2UmIzMyOypkZXYsJiMzMjt2b2lkJiMzMjsqZGF0
YSkNCiZndDsmIzMyOy0tDQomZ3Q7JiMzMjsyLjE4LjANCiZndDsmIzMyOw0KDQo8L3ByZT48IS0t
dHlwZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50
aWFsaXR5IE5vdGljZQ0KICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29u
dGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50
cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVy
d2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlz
IGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGll
bnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywg
cmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRh
Y2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRl
ZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lw
aWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZQ0KIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZl
ZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRp
YXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNv
cGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlv
dXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFp
bCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_004_2100862750.288263213
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEhzaWFvLWNoaWVuOg0KDQpPbiBNb24sIDIwMjMtMDktMTEgYXQgMTU6NDIgKzA4MDAsIEhz
aWFvIENoaWVuIFN1bmcgd3JvdGU6DQo+IC0gQWRqdXN0IGluZGVudGF0aW9uIHRvIGFsaWduIHdp
dGggb3RoZXIgZmlsZXMNCj4gLSBTb3J0IGRldmljZSB0YWJsZSBpbiBhbHBoYWJldGljYWwgb3Jk
ZXINCj4gLSBBZGQgc2VudGluZWwgdG8gZGV2aWNlIHRhYmxlDQoNClJldmlld2VkLWJ5OiBDSyBI
dSA8Y2suaHVAbWVkaWF0ZWsuY29tPg0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBIc2lhbyBDaGll
biBTdW5nIDxzaGF3bi5zdW5nQG1lZGlhdGVrLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsX2FkYXB0b3IuYyB8IDE1ICsrKystLS0tLS0tLS0tLQ0K
PiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bF9hZGFw
dG9yLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsX2FkYXB0b3Iu
Yw0KPiBpbmRleCAxMTRlZGVkODE3N2UuLjRhNWZhYjVlYTUxZiAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bF9hZGFwdG9yLmMNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bF9hZGFwdG9yLmMNCj4gQEAgLTM4Niwx
NyArMzg2LDEwIEBAIHN0YXRpYyBpbnQgb3ZsX2FkYXB0b3JfY29tcF9nZXRfaWQoc3RydWN0DQo+
IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUsDQo+ICB9DQo+IA0KPiAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgbXRrX292bF9hZGFwdG9yX2NvbXBfZHRfaWRz
W10gPSB7DQo+IC0Jew0KPiAtCQkuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTUtdmRvMS1y
ZG1hIiwNCj4gLQkJLmRhdGEgPSAodm9pZCAqKU9WTF9BREFQVE9SX1RZUEVfTURQX1JETUEsDQo+
IC0JfSwgew0KPiAtCQkuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTUtZGlzcC1tZXJnZSIs
DQo+IC0JCS5kYXRhID0gKHZvaWQgKilPVkxfQURBUFRPUl9UWVBFX01FUkdFLA0KPiAtCX0sIHsN
Cj4gLQkJLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTk1LWRpc3AtZXRoZHIiLA0KPiAtCQku
ZGF0YSA9ICh2b2lkICopT1ZMX0FEQVBUT1JfVFlQRV9FVEhEUiwNCj4gLQl9LA0KPiAtCXt9LA0K
PiArCXsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTk1LWRpc3AtZXRoZHIiLCAuZGF0YSA9
ICh2b2lkDQo+ICopT1ZMX0FEQVBUT1JfVFlQRV9FVEhEUiB9LA0KPiArCXsgLmNvbXBhdGlibGUg
PSAibWVkaWF0ZWssbXQ4MTk1LWRpc3AtbWVyZ2UiLCAuZGF0YSA9ICh2b2lkDQo+ICopT1ZMX0FE
QVBUT1JfVFlQRV9NRVJHRSB9LA0KPiArCXsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTk1
LXZkbzEtcmRtYSIsIC5kYXRhID0gKHZvaWQNCj4gKilPVkxfQURBUFRPUl9UWVBFX01EUF9SRE1B
IH0sDQo+ICsJeyAvKiBzZW50aW5lbCAqLyB9DQo+ICB9Ow0KPiANCj4gIHN0YXRpYyBpbnQgY29t
cGFyZV9vZihzdHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEpDQo+IC0tDQo+IDIuMTguMA0K
PiANCg==

--__=_Part_Boundary_004_2100862750.288263213--

