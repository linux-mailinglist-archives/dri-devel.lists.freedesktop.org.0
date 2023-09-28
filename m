Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9DB7B1204
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 07:24:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E67A10E086;
	Thu, 28 Sep 2023 05:24:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 232B510E086
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 05:24:25 +0000 (UTC)
X-UUID: 4803cbcc5dbf11ee8051498923ad61e6-20230928
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=KHzATrxNbVhJGNGUHLRuEuUYlK2tT1GzmOkWuCTx3ZI=; 
 b=oxZVgHpQvNDhH/MPYuPmbaMEQHwANKD/9MSLmxkvZO3w8wSfb5ut5hQAWSYG75Ah9aMiAIvxGtVToQTH0/Oqr+wnyv+beDtzoQNqj+7Cxn4nF1DQemcEespYrOBkD9TjCDCQG1gRxSX2zV4ONDbjpChjcYvizjg/tyvJSXmxJ8o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:7bdd2a09-637e-4092-aba8-04d06a1ccdd4, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5f78ec9, CLOUDID:b4043af0-9a6e-4c39-b73e-f2bc08ca3dc5,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4803cbcc5dbf11ee8051498923ad61e6-20230928
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1638831420; Thu, 28 Sep 2023 13:24:22 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 28 Sep 2023 13:24:21 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Thu, 28 Sep 2023 13:24:20 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SXzusLHzZOdFVomEc/UsFBVJDDltblCLUs43dJvWo4vJJoBCC78+pYqfyeVhGx9d6x1bttdSi8dCAakBK8OqfIrPFD7YgbAYO4B+/ECx1HP6CsLplE33lnMbq+ahaGFV48LL9Ln5S54vuyqvLVs5803LGmGl1GyDeYC/czNKp0klf5Z6ZQnMJOa26q5SldPmeKYb2Dm3AOi1jeYS7i2R/rJY9Xic1F4y8YD+UpS3k2cyvHPQvdtMXXXJEf9RPQ/4bRkqgg/NnpHKscb5ZrfM00N4jEoa70s/xbSHH5H3UXBe0Z0sZi0jgCY6GEe19nLwXF/xfCA2zWEhWfec6Ptnww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KHzATrxNbVhJGNGUHLRuEuUYlK2tT1GzmOkWuCTx3ZI=;
 b=PjbCD6RI1YCU2Vaep2exT477NJ378+gwtNo2/goNlxYDVnL6juAmd5EFeRhvHIjdePzFLXbTragXq2QptozIH+g0aZHpwFgJSN7rYtbQYb9/j88G66N1W0a0Of8NrTkjAQ4B2nk02epvoKFLgvishjP3fA3yFGLEjOzUFLEjB5f3KHEHwpGBPQaFpT3fOYp1EqGKsFJvTGFmWLZb1TtukFG67Kms+1WGarLgoUkcy2YyXVSqbSdx/XJk7sWdEgj9A6ug2/YT24o2yus38AA/Vmpjk3GI1d7RRILcJEjKh4Ne70UmjlqgxQ/o/l6IyvxIgKsTYLjZSVlE69Pu0swNGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KHzATrxNbVhJGNGUHLRuEuUYlK2tT1GzmOkWuCTx3ZI=;
 b=U7KRYoClVAdBAi3Nf7wlm4r2tuq94dQ3elTrOMz2Q0mI/skjeByR9toPVlpUfQEaR+K7fLw3GPbH0LJjOjMRByXrm+FE29IX7p+uaOQCziivHnZOCIfKKGHb0BLqpp4UZXg6om+X25Q3/c7QakHKSEwn7wtmecWwp+lxMs8gvAU=
Received: from SI2PR03MB5885.apcprd03.prod.outlook.com (2603:1096:4:142::7) by
 PUZPR03MB6020.apcprd03.prod.outlook.com (2603:1096:301:b7::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.19; Thu, 28 Sep 2023 05:24:18 +0000
Received: from SI2PR03MB5885.apcprd03.prod.outlook.com
 ([fe80::e148:3390:1eb2:28e3]) by SI2PR03MB5885.apcprd03.prod.outlook.com
 ([fe80::e148:3390:1eb2:28e3%7]) with mapi id 15.20.6813.027; Thu, 28 Sep 2023
 05:24:18 +0000
From: =?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>
To: "joakim.bech@linaro.org" <joakim.bech@linaro.org>
Subject: Re: [PATCH 6/9] dma-buf: heaps: mtk_sec_heap: Add tee service call
 for buffer allocating/freeing
Thread-Topic: [PATCH 6/9] dma-buf: heaps: mtk_sec_heap: Add tee service call
 for buffer allocating/freeing
Thread-Index: AQHZ5FgqDwsDNAc9xUe5kPjiMIdpmrAu14CAgAD33IA=
Date: Thu, 28 Sep 2023 05:24:17 +0000
Message-ID: <5dec9567716ab4fcd675682157daaeacc7053d98.camel@mediatek.com>
References: <20230911023038.30649-1-yong.wu@mediatek.com>
 <20230911023038.30649-7-yong.wu@mediatek.com>
 <20230927143709.hrytde34trrdhpwf@pop-os.localdomain>
In-Reply-To: <20230927143709.hrytde34trrdhpwf@pop-os.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB5885:EE_|PUZPR03MB6020:EE_
x-ms-office365-filtering-correlation-id: 066fad88-3802-4cca-7bcc-08dbbfe329ad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0/yTTJKO2CbztNPZhDWA1bAqWzrzbvkk74qOgS9WMOOM7xJ2pTot/0YkM90nHTYkNd3Le7qLYou2hmlknzHYJImO+bjQUU8TYiGHx5runxtK0n+WhQKRBw2M2kIVhbNjOCQW2GHO5t4CRl1nTTPPVrEZ8LLhqb3hd/EykMXYCFT5tavE1kAQLlKdHFUHWHPzVFHwfQ/h24HOzeS+jbMtQqJ9fXvlrln1jwQTF2DaUFUlSZDgwTw2Q5g+p4iWS/WWESR68iZroI/3e9uKf/qRsCrKkXLIFd9H5k1xnJLBZx+UhjoeyKtCcrrZr4DuvUF+giRltISfw1dbyO+AWttGb5BebMs3HozXOxcA+OgYUeCzUwSkouKw/d1t7PvQcz5P23bEq7mY8fOEJgqQXGXIHDberJoAR2RzmRsa/KB7wbK45ErgrEzRtjWG6p5a9iWrMmZJhFawrIkMrUMZShrJRzjj+ejPd97aDXAx9PIWhMRddGUUKJvPgCEpfK8H6n5C3xXImICOwZvM9832YzzqyRonuqzYUwkouX58mtpaUpl5QPk/Tv0I+r2dGWgw0+QOtVQcdf0sHuMe8YaCmevdCGrS+uksbmvso0WeAiQ1cnqYUQQUGMbwJkonUj+J5XOPtCcopdsu+aZcubr6H8UkgEMh1UhiUIcpCf2cNIpiLamFDCF06DdmGx03E6TSKWf8
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR03MB5885.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(346002)(136003)(366004)(396003)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(2616005)(38070700005)(85182001)(26005)(5660300002)(2906002)(7416002)(122000001)(36756003)(4326008)(41300700001)(86362001)(38100700002)(8936002)(83380400001)(66946007)(6512007)(6506007)(6486002)(478600001)(6916009)(66446008)(66556008)(8676002)(316002)(66476007)(76116006)(71200400001)(54906003)(64756008)(99106002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZnpjcTIza0pzU1FuN2lyZW9ZQlJqNHdYazFoZDNrdTlMeE8yZ3BScTkzSith?=
 =?utf-8?B?YWhUQXBRTXloZXZyZTd4NjQ0TmJYcTFlR0ovdFQ4dGhFRXVsb0ZNbXoyeEtF?=
 =?utf-8?B?bUpwalNwbWZPVlo4Snp1ZE44WVBlUG4vNFYyT25VTHVPY054R2QzamJLMUY2?=
 =?utf-8?B?bGoxaTRMVlB1R3NEdTRqcC9RbWZFUmlFZ0xUSGRiNVRISVFGRXNXZFRsU3ls?=
 =?utf-8?B?KzRaYTlxRWYyY1hDRFBWWmU0TUwxdGxPQnJiVDV3YUp0TVpiWW96aHE4eTFi?=
 =?utf-8?B?cW8yWmxOL25PTTgycDdhcGpHN1RhNEluNkoraCs0WVFJSWVORVZSMVNmeXZs?=
 =?utf-8?B?UXhpeG4razV2em1wQ2RIbkpiMUhXWEM0S3NxNFBVOVpka25sU2wxWk9xYmp1?=
 =?utf-8?B?ZjdBOHFRYU1Ud2NRaHBvc3AxdWg0emJCM1lvNzZNdGZ6Mm1uM1ROTmVaUnJm?=
 =?utf-8?B?anpLUHZVYk51RnhZOHozMzRRZ0hwVlJPMGloL1J5N1VnRG1rV1FLb040eG1S?=
 =?utf-8?B?Q05KN25QTGthYytlT1NJelRINVVIdVowZ3NXZ24wTlpzUGZGNldIRDhBZzk0?=
 =?utf-8?B?Zy9SNFBSU1FhR1dGNDdZY0NDV0toMHlWNTdOK2FZenRjN29GSFZNaDV0UHMz?=
 =?utf-8?B?TmE5WUx3RE04NzlCYjNyQlpxS0RYNEpnOEZWT3VpRE5BckJJUWo4b01Ldm83?=
 =?utf-8?B?M1dkd0kyNCtJV2lOcG1pY0FzcmZOTEJlK1FGSGx4UXk1SlB2bi9LeUxYaE41?=
 =?utf-8?B?R0pNbFBKanl3eXJPZVhmWE1RbDJDN00wd2FGS3RlczJSL2tMdk5NbXJnM1VF?=
 =?utf-8?B?L0xtVzdPK1o1U1RJcDdLSkRFdllDWW4wOXMzMW5mZGJUOUtmdFZXd3h2RTNq?=
 =?utf-8?B?MCtRcEg3clZhY1VOeFhjdzJTSi9Db0ZDTkN5Nm9OeTlaYUlYUmhsdC9yemNp?=
 =?utf-8?B?a1FJQ0ZkZFdHOGJaMHE0OU5LS2hDai9kRWpQTTFQOCs3MnZ6MnQ5Vk81bmc0?=
 =?utf-8?B?azJQdGIrUEEvMXA1ckp6MElQZnVnRnVkM3dITUtUb2tNQklxSHRjVWVqY29p?=
 =?utf-8?B?ZHVQYkl3N3hBZ0NvVmtNLzRLV0FyTUJ6ZXN3RHM2bHRRMnRyME50WFZEMWdL?=
 =?utf-8?B?WHlET1BqQXFWMk5vRE96Qk1tN3BheFgvUjBBMTZVRHhmbkJmMllWREhNajhE?=
 =?utf-8?B?NHlSSnNOTEI2NTVyWjBGV1pVSWVXbUtINW92Z0paRDlZdVIzaGt2SnpNclI4?=
 =?utf-8?B?VTlRVkVWK3dOZUtXRlBWK0VFSEp2eG5NQkVRcU14NzdZbEFJQjhscU1FZS85?=
 =?utf-8?B?WUwyQjViSjVtNFp1VS9nMFRhS0xlS0FsdkF6NFVMN2xqS0hHeG10TkVaZVFh?=
 =?utf-8?B?R3NYUTdveHNlcUJoWXpCNGRUUWRLeXRhRDd6Z1ROZmJldVRXbWhyeE1BS3dU?=
 =?utf-8?B?ejkwRkR2Z1cxQXRqbUF2Qmw2eWc1Wm1uTVdzcExjRUR5Wmd6MktwbDArSFQ4?=
 =?utf-8?B?Wm1aTHZ4Si9raVdaTVREdmRtT1R0WlNXbzIwVW01cU4rdFJEaVhDYVU5aTZD?=
 =?utf-8?B?dXhmdnFWaFFrRDg1Z1pmeG9DbzZrY01rVGlibGZMWnV6ZzN3VjZUc1BpWHBI?=
 =?utf-8?B?VWV5U0Ixb3owNlVjZGtqcE9DVEVIbituOHB1STlhQmkwZGxrMlZHQlBrRDdI?=
 =?utf-8?B?WVBjTTM1ci81MWViWG94QnA1cEduYzlHMS9jbkd3cXljTTRLSXpvZkdBaTJ1?=
 =?utf-8?B?V3dCZXhHcHdWU0FROUp5RjdmRDZwSVFybDRCcXh1ZWxML2hsUzVXK3poY0tm?=
 =?utf-8?B?ZWZCWVNScU1uRVVPbWo1Z29QNnJlYWNzMHZlWW9CYVlJSlB3ZHRZMW9pVW5G?=
 =?utf-8?B?MjhZOHlSSnFnTzF6SXFUaXRTU1d1RlBEdHppZUlEdFI2cWFvWnhRN21JRWhJ?=
 =?utf-8?B?Ry9CVVNnUHF5T0tmSlNseHRGVDVma2NURFNXSnJCSWJHUURjbXFkNmExVzZE?=
 =?utf-8?B?YjRCQiswWGozSGdVYmt4RXVxSmpjZTRCRlU0L3B2RW12K0FFaU1vSnZZalBn?=
 =?utf-8?B?ZGlFeCs0aVNpV3ZXakFDTU52V2o5dHQ2c0dhaUNFUU55S3hRV3Mzajk3MFVa?=
 =?utf-8?Q?xstMABECPPyOPHQp3swTW/VLQ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C2EE14452F0D7D4293D97AE5122B7E7D@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5885.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 066fad88-3802-4cca-7bcc-08dbbfe329ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2023 05:24:18.0185 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h8U7uddojnJyGwZ2SuKhiEGkiaQwmjrZBma+N78wg0WypBWwqEkM6NjgLdh+yMy71FUd+cb+/uZ41c4pjtNwPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB6020
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
Cc: =?utf-8?B?R2F2aW4gTGl1ICjlionlk7Llu7cp?= <Gavin.Liu@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "jstultz@google.com" <jstultz@google.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "jkardatzke@google.com" <jkardatzke@google.com>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 =?utf-8?B?SmlhbmppYW8gWmVuZyAo5pu+5YGl5aejKQ==?= <Jianjiao.Zeng@mediatek.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "tjmercier@google.com" <tjmercier@google.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 =?utf-8?B?QW5hbiBTdW4gKOWtmeWuieWuiSk=?= <Anan.Sun@mediatek.com>,
 =?utf-8?B?S3VvaG9uZyBXYW5nICjnjovlnIvptLsp?= <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSm9ha2ltLA0KDQpUaGFua3MgdmVyeSBtdWNoIGZvciB0aGUgcmV2aWV3aW5nLg0KDQpPbiBX
ZWQsIDIwMjMtMDktMjcgYXQgMTY6MzcgKzAyMDAsIEpvYWtpbSBCZWNoIHdyb3RlOg0KPiAgCSAN
Cj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0
YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUgY29u
dGVudC4NCj4gIE9uIE1vbiwgU2VwIDExLCAyMDIzIGF0IDEwOjMwOjM1QU0gKzA4MDAsIFlvbmcg
V3Ugd3JvdGU6DQo+ID4gQWRkIFRFRSBzZXJ2aWNlIGNhbGwgZm9yIHNlY3VyZSBtZW1vcnkgYWxs
b2NhdGluZy9mcmVlaW5nLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEFuYW4gU3VuIDxhbmFu
LnN1bkBtZWRpYXRlay5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogWW9uZyBXdSA8eW9uZy53dUBt
ZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9tdGtfc2Vj
dXJlX2hlYXAuYyB8IDY5DQo+ICsrKysrKysrKysrKysrKysrKysrKysrKy0NCj4gPiAgMSBmaWxl
IGNoYW5nZWQsIDY4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPiANCj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9kbWEtYnVmL2hlYXBzL210a19zZWN1cmVfaGVhcC5jIGIvZHJpdmVy
cy9kbWEtDQo+IGJ1Zi9oZWFwcy9tdGtfc2VjdXJlX2hlYXAuYw0KPiA+IGluZGV4IGUzZGEzM2Ez
ZDA4My4uMTRjMmExNmE3MTY0IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9oZWFw
cy9tdGtfc2VjdXJlX2hlYXAuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9tdGtf
c2VjdXJlX2hlYXAuYw0KPiA+IEBAIC0xNyw2ICsxNyw5IEBADQo+ID4gIA0KPiA+ICAjZGVmaW5l
IE1US19URUVfUEFSQU1fTlVNNA0KPiA+ICANCj4gPiArI2RlZmluZSBUWkNNRF9NRU1fU0VDVVJF
Q01fVU5SRUY3DQo+ID4gKyNkZWZpbmUgVFpDTURfTUVNX1NFQ1VSRUNNX1pBTExPQzE1DQo+IFRo
aXMgaXMgcmVsYXRlZCB0byB0aGUgZGlzY3Vzc2lvbiBhcm91bmQgVVVJRCBhcyB3ZWxsLiBUaGVz
ZSBudW1iZXJzDQo+IGhlcmUgYXJlIHNwZWNpZmljIHRvIHRoZSBNZWRpYVRlayBUQS4gSWYgd2Ug
Y291bGQgbWFrZSB0aGluZ3MgbW9yZQ0KPiBnZW5lcmljLCB0aGVuIHRoZXNlIHNob3VsZCBwcm9i
YWJseSBiZSAwIGFuZCAxLiANCj4gDQo+IEkgYWxzbyBmaW5kIHRoZSBuYW1pbmcgYSBiaXQgaGVh
dnksIEkgdGhpbmsgSSdkIHN1Z2dlc3Qgc29tZXRoaW5nDQo+IGxpa2U6DQo+ICMgZGVmaW5lIFRF
RV9DTURfU0VDVVJFX0hFQVBfWkFMTE9DIC4uLg0KPiBhbmQgc28gb24uDQoNCkkgd2lsbCBjaGVj
ayBpbnRlcm5hbGx5IGFuZCB0cnkgdG8gZm9sbG93IHRoaXMuIElmIHdlIGNhbiBub3QgZm9sbG93
LA0KSSdsbCBnaXZlIGZlZWRiYWNrIGhlcmUuDQoNCj4gDQo+ID4gKw0KPiA+ICAvKg0KPiA+ICAg
KiBNZWRpYVRlayBzZWN1cmUgKGNodW5rKSBtZW1vcnkgdHlwZQ0KPiA+ICAgKg0KPiA+IEBAIC0y
OSw2ICszMiw4IEBAIGVudW0ga3JlZV9tZW1fdHlwZSB7DQo+IFRoZSAia3JlZSIgaGVyZSwgaXMg
dGhhdCBtZWFudCB0byBpbmRpY2F0ZSBrZXJuZWwgUkVFPyBJZiB5ZXMsIHRoZW4gSQ0KPiBndWVz
cyB0aGF0IGNvdWxkIGJlIGRyb3BwZWQgc2luY2Ugd2Uga25vdyB3ZSdyZSBhbHJlYWR5IGluIHRo
ZSBrZXJuZWwNCj4gY29udGV4dCwgcGVyaGFwcyBpbnN0ZWFkIG5hbWUgaXQgc29tZXRoaW5nIHdp
dGggInNlY3VyZV9oZWFwX3R5cGUiPw0KPiANCj4gPiAgc3RydWN0IG10a19zZWN1cmVfaGVhcF9i
dWZmZXIgew0KPiA+ICBzdHJ1Y3QgZG1hX2hlYXAqaGVhcDsNCj4gPiAgc2l6ZV90c2l6ZTsNCj4g
PiArDQo+ID4gK3UzMnNlY19oYW5kbGU7DQo+ID4gIH07DQo+ID4gIA0KPiA+ICBzdHJ1Y3QgbXRr
X3NlY3VyZV9oZWFwIHsNCj4gPiBAQCAtODAsNiArODUsNjMgQEAgc3RhdGljIGludCBtdGtfa3Jl
ZV9zZWN1cmVfc2Vzc2lvbl9pbml0KHN0cnVjdA0KPiBtdGtfc2VjdXJlX2hlYXAgKnNlY19oZWFw
KQ0KPiA+ICByZXR1cm4gcmV0Ow0KPiA+ICB9DQo+ID4gIA0KPiA+ICtzdGF0aWMgaW50DQo+ID4g
K210a19zZWNfbWVtX3RlZV9zZXJ2aWNlX2NhbGwoc3RydWN0IHRlZV9jb250ZXh0ICp0ZWVfY3R4
LCB1MzINCj4gc2Vzc2lvbiwNCj4gPiArICAgICB1bnNpZ25lZCBpbnQgY29tbWFuZCwgc3RydWN0
IHRlZV9wYXJhbSAqcGFyYW1zKQ0KPiA+ICt7DQo+ID4gK3N0cnVjdCB0ZWVfaW9jdGxfaW52b2tl
X2FyZyBhcmcgPSB7MH07DQo+ID4gK2ludCByZXQ7DQo+ID4gKw0KPiA+ICthcmcubnVtX3BhcmFt
cyA9IE1US19URUVfUEFSQU1fTlVNOw0KPiA+ICthcmcuc2Vzc2lvbiA9IHNlc3Npb247DQo+ID4g
K2FyZy5mdW5jID0gY29tbWFuZDsNCj4gPiArDQo+ID4gK3JldCA9IHRlZV9jbGllbnRfaW52b2tl
X2Z1bmModGVlX2N0eCwgJmFyZywgcGFyYW1zKTsNCj4gPiAraWYgKHJldCA8IDAgfHwgYXJnLnJl
dCkgew0KPiA+ICtwcl9lcnIoIiVzOiBjbWQgJWQgcmV0ICVkOiV4LlxuIiwgX19mdW5jX18sIGNv
bW1hbmQsIHJldCwNCj4gYXJnLnJldCk7DQo+ID4gK3JldCA9IC1FT1BOT1RTVVBQOw0KPiA+ICt9
DQo+ID4gK3JldHVybiByZXQ7DQo+ID4gK30NCj4gUGVyaGFwcyBub3QgcmVsZXZhbnQgZm9yIHRo
aXMgcGF0Y2ggc2V0LCBidXQgc2luY2UgdGhpcyBmdW5jdGlvbiBpcw0KPiBqdXN0DQo+IGEgcHVy
ZSBURUUgY2FsbCwgSSdtIGluY2xpbmVkIHRvIHN1Z2dlc3QgdGhhdCB0aGlzIGNvdWxkIGV2ZW4g
YmUNCj4gbW92ZWQNCj4gb3V0IGFzIGEgZ2VuZXJpYyBURUUgZnVuY3Rpb24uIEkuZS4sIHNvbWV0
aGluZyB0aGF0IGNvdWxkIGJlIHVzZWQNCj4gZWxzZXdoZXJlIGluIHRoZSBMaW51eCBrZXJuZWwu
DQoNCkdvb2QgU3VnZ2VzdGlvbi4gSSd2ZSBzZWVuIG1hbnkgcGxhY2VzIGNhbGwgdGhpcywgYW5k
IHRoZXkgYXJlDQpiYXNpY2FsbHkgc2ltaWxhci4gRG8geW91IG1lYW4gd2UgY3JlYXRlIGEgc2lt
cGxlIHdyYXAgZm9yIHRoaXM/DQpzb21ldGhpbmcgbGlrZSB0aGlzOg0KaW50IHRlZV9jbGllbnRf
aW52b2tlX2Z1bmNfd3JhcChzdHJ1Y3QgdGVlX2NvbnRleHQgKmN0eCwNCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdTMyIHNlc3Npb24sDQogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHUzMiBmdW5jX2lkLA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNp
Z25lZCBpbnQgbnVtX3BhcmFtcywNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3Ry
dWN0IHRlZV9wYXJhbSAqcGFyYW0sDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlu
dCAqaW52b2tlX2FyZ19yZXQvKiBPVVQgKi8pDQoNCklmIHRoaXMgbWFrZXMgc2Vuc2UsIGl0IHNo
b3VsZCBiZSBkb25lIGluIGEgc2VwYXJhdGUgcGF0Y2hzZXQuDQoNCj4gDQo+ID4gKw0KPiA+ICtz
dGF0aWMgaW50IG10a19zZWNfbWVtX2FsbG9jYXRlKHN0cnVjdCBtdGtfc2VjdXJlX2hlYXAgKnNl
Y19oZWFwLA0KPiA+ICtzdHJ1Y3QgbXRrX3NlY3VyZV9oZWFwX2J1ZmZlciAqc2VjX2J1ZikNCj4g
PiArew0KPiA+ICtzdHJ1Y3QgdGVlX3BhcmFtIHBhcmFtc1tNVEtfVEVFX1BBUkFNX05VTV0gPSB7
MH07DQo+ID4gK3UzMiBtZW1fc2Vzc2lvbiA9IHNlY19oZWFwLT5tZW1fc2Vzc2lvbjsNCj4gSG93
IGFib3V0IG5hbWUgaXQgdGVlX3Nlc3Npb24/IEFsdGVybmF0aXZlIHRhX3Nlc3Npb24/IEkgdGhp
bmsgdGhhdA0KPiB3b3VsZCBiZXR0ZXIgZXhwbGFpbiB3aGF0IGl0IGFjdHVhbGx5IGlzLg0KDQpU
aGFua3MgZm9yIHRoZSByZW5hbWluZy4gV2lsbCBjaGFuZ2UuDQoNCj4gDQo+ID4gK2ludCByZXQ7
DQo+ID4gKw0KPiA+ICtwYXJhbXNbMF0uYXR0ciA9IFRFRV9JT0NUTF9QQVJBTV9BVFRSX1RZUEVf
VkFMVUVfSU5QVVQ7DQo+ID4gK3BhcmFtc1swXS51LnZhbHVlLmEgPSBTWl80SzsvKiBhbGlnbm1l
bnQgKi8NCj4gPiArcGFyYW1zWzBdLnUudmFsdWUuYiA9IHNlY19oZWFwLT5tZW1fdHlwZTsvKiBt
ZW1vcnkgdHlwZSAqLw0KPiA+ICtwYXJhbXNbMV0uYXR0ciA9IFRFRV9JT0NUTF9QQVJBTV9BVFRS
X1RZUEVfVkFMVUVfSU5QVVQ7DQo+ID4gK3BhcmFtc1sxXS51LnZhbHVlLmEgPSBzZWNfYnVmLT5z
aXplOw0KPiA+ICtwYXJhbXNbMl0uYXR0ciA9IFRFRV9JT0NUTF9QQVJBTV9BVFRSX1RZUEVfVkFM
VUVfSU5PVVQ7DQo+ID4gKw0KPiA+ICsvKiBBbHdheXMgcmVxdWVzdCB6ZXJvZWQgYnVmZmVyICov
DQo+ID4gK3JldCA9IG10a19zZWNfbWVtX3RlZV9zZXJ2aWNlX2NhbGwoc2VjX2hlYXAtPnRlZV9j
dHgsIG1lbV9zZXNzaW9uLA0KPiA+ICsgICBUWkNNRF9NRU1fU0VDVVJFQ01fWkFMTE9DLCBwYXJh
bXMpOw0KPiA+ICtpZiAocmV0KQ0KPiA+ICtyZXR1cm4gLUVOT01FTTsNCj4gPiArDQo+ID4gK3Nl
Y19idWYtPnNlY19oYW5kbGUgPSBwYXJhbXNbMl0udS52YWx1ZS5hOw0KPiA+ICtyZXR1cm4gMDsN
Cj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIHZvaWQgbXRrX3NlY19tZW1fcmVsZWFzZShzdHJ1
Y3QgbXRrX3NlY3VyZV9oZWFwICpzZWNfaGVhcCwNCj4gPiArc3RydWN0IG10a19zZWN1cmVfaGVh
cF9idWZmZXIgKnNlY19idWYpDQo+ID4gK3sNCj4gPiArc3RydWN0IHRlZV9wYXJhbSBwYXJhbXNb
TVRLX1RFRV9QQVJBTV9OVU1dID0gezB9Ow0KPiA+ICt1MzIgbWVtX3Nlc3Npb24gPSBzZWNfaGVh
cC0+bWVtX3Nlc3Npb247DQo+ID4gKw0KPiA+ICtwYXJhbXNbMF0uYXR0ciA9IFRFRV9JT0NUTF9Q
QVJBTV9BVFRSX1RZUEVfVkFMVUVfSU5QVVQ7DQo+ID4gK3BhcmFtc1swXS51LnZhbHVlLmEgPSBz
ZWNfYnVmLT5zZWNfaGFuZGxlOw0KPiA+ICtwYXJhbXNbMV0uYXR0ciA9IFRFRV9JT0NUTF9QQVJB
TV9BVFRSX1RZUEVfVkFMVUVfT1VUUFVUOw0KPiBQZXJoYXBzIHdvcnRoIGhhdmluZyBhIGNvbW1l
bnQgZm9yIHBhcmFtc1sxXSBleHBsYWluIHdoeSB3ZSBuZWVkIHRoZQ0KPiBWQUxVRV9PVVRQVVQg
aGVyZT8NCg0KV2lsbCBkby4NCg0KPiANCj4gLS0gDQo+IC8vIFJlZ2FyZHMNCj4gSm9ha2ltDQo+
IA0KPiA+ICsNCj4gPiArbXRrX3NlY19tZW1fdGVlX3NlcnZpY2VfY2FsbChzZWNfaGVhcC0+dGVl
X2N0eCwgbWVtX3Nlc3Npb24sDQo+ID4gKyAgICAgVFpDTURfTUVNX1NFQ1VSRUNNX1VOUkVGLCBw
YXJhbXMpOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICBzdGF0aWMgc3RydWN0IGRtYV9idWYgKg0KPiA+
ICBtdGtfc2VjX2hlYXBfYWxsb2NhdGUoc3RydWN0IGRtYV9oZWFwICpoZWFwLCBzaXplX3Qgc2l6
ZSwNCj4gPiAgICAgICAgdW5zaWduZWQgbG9uZyBmZF9mbGFncywgdW5zaWduZWQgbG9uZyBoZWFw
X2ZsYWdzKQ0KPiA+IEBAIC0xMDcsNiArMTY5LDkgQEAgbXRrX3NlY19oZWFwX2FsbG9jYXRlKHN0
cnVjdCBkbWFfaGVhcCAqaGVhcCwNCj4gc2l6ZV90IHNpemUsDQo+ID4gIHNlY19idWYtPnNpemUg
PSBzaXplOw0KPiA+ICBzZWNfYnVmLT5oZWFwID0gaGVhcDsNCj4gPiAgDQo+ID4gK3JldCA9IG10
a19zZWNfbWVtX2FsbG9jYXRlKHNlY19oZWFwLCBzZWNfYnVmKTsNCj4gPiAraWYgKHJldCkNCj4g
PiArZ290byBlcnJfZnJlZV9idWY7DQo+ID4gIGV4cF9pbmZvLmV4cF9uYW1lID0gZG1hX2hlYXBf
Z2V0X25hbWUoaGVhcCk7DQo+ID4gIGV4cF9pbmZvLnNpemUgPSBzZWNfYnVmLT5zaXplOw0KPiA+
ICBleHBfaW5mby5mbGFncyA9IGZkX2ZsYWdzOw0KPiA+IEBAIC0xMTUsMTEgKzE4MCwxMyBAQCBt
dGtfc2VjX2hlYXBfYWxsb2NhdGUoc3RydWN0IGRtYV9oZWFwICpoZWFwLA0KPiBzaXplX3Qgc2l6
ZSwNCj4gPiAgZG1hYnVmID0gZG1hX2J1Zl9leHBvcnQoJmV4cF9pbmZvKTsNCj4gPiAgaWYgKElT
X0VSUihkbWFidWYpKSB7DQo+ID4gIHJldCA9IFBUUl9FUlIoZG1hYnVmKTsNCj4gPiAtZ290byBl
cnJfZnJlZV9idWY7DQo+ID4gK2dvdG8gZXJyX2ZyZWVfc2VjX21lbTsNCj4gPiAgfQ0KPiA+ICAN
Cj4gPiAgcmV0dXJuIGRtYWJ1ZjsNCj4gPiAgDQo+ID4gK2Vycl9mcmVlX3NlY19tZW06DQo+ID4g
K210a19zZWNfbWVtX3JlbGVhc2Uoc2VjX2hlYXAsIHNlY19idWYpOw0KPiA+ICBlcnJfZnJlZV9i
dWY6DQo+ID4gIGtmcmVlKHNlY19idWYpOw0KPiA+ICByZXR1cm4gRVJSX1BUUihyZXQpOw0KPiA+
IC0tIA0KPiA+IDIuMjUuMQ0KPiA+IA0K
