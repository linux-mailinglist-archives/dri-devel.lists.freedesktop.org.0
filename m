Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E049B7AD440
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 11:11:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1ADD10E219;
	Mon, 25 Sep 2023 09:11:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55B0410E219
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 09:11:41 +0000 (UTC)
X-UUID: 87082be45b8311ee8051498923ad61e6-20230925
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=7nFUqKPXldhP5pJAc3bP4gDEYdzPI4VwY06DkB9LLPU=; 
 b=Nl0u2eHIY7IpVFilvdp1jFgnbNFogZQYCvYkage7w+2dXh1kpCgodatH3RPW8y0bO5zmM25vPit440NY8+n9znTcZC8vmw6dfd+X9OjqhUWyLBAVsxo3LIhH39vBCNAN79t2VGlWLxRrNBOF9yycevQOvKHYaiSdDNouWwIdgJg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:e1cb24cd-5a92-4a27-a360-185c9251b953, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5f78ec9, CLOUDID:870c5814-4929-4845-9571-38c601e9c3c9,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 87082be45b8311ee8051498923ad61e6-20230925
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1787474115; Mon, 25 Sep 2023 17:11:35 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 25 Sep 2023 17:11:34 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Mon, 25 Sep 2023 17:11:34 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QNrP2QOkfOE2u25N96fskxhzL11l+8yV7p7W8EOxJGoIuDq98I+Z0lWPUPBDYpiw1CE44hQNaRabN/6JHj0B5KaVw7QzNynLR9d2gXvfVZ8o96BSQiHcBRtc4QQjvBGzioTEqUAsGUUqUWH31YggweNobKAbm9eIvDZmeb30wRGOdkbdwT/FtRyA2krSPCJ3/WIKA+zKDglezEh37Hq/1m4UirRgVcaTLzcSFzz5lYgSerFzLmMR8cp7mQb2JJpqprwsF1UT4TNDuRVxXvPIhrzf3ZpwQcUWLNcsOj+4EerOl/p50MVlMiuGnuwttAf5L7Fy7N3tQCXRurU2+zxeGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vD1c/M1Nf+/vxxmGR8DG8cl+xRr43Ii9OER6BL4XJnk=;
 b=jVvQKIcQjGPrRQd1zqY/lnBpoqERBrVnY7bih9fRJHRX5YSkWr7RMrYVjEpbslYt3mLq8Wox0aOKPMAYc56on+xrigkAiJhLeX/Fhfjpj7c6JZCUzvP5zVg51JlspMKw5pTasJ0d6knr1eXpVIR44CATmNh3BQCQe9eD1eSDgiteau9dKzEuOVHhq/PvOzCeOl/V5ErdxYk4vyuneCzAyG5IhShl74sAaBhYf624tsdM/hc3jHNwasVhktqwDDEmtCBOv26gm16qQPi5vfQXeHN4hBElEE16LcVfR4gGg/So/UwBz2SrWZY0/viPuDHMvj0afbyRe18TVlalN9ZVjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vD1c/M1Nf+/vxxmGR8DG8cl+xRr43Ii9OER6BL4XJnk=;
 b=LJx8jvztc+hUzd5GgpX56EuaNkU1iM/HepC58Fp/M/URH7c2GAqfJewaVGFpj4l1CIj5XEHH3SV1a/fxdsS/COW1jjExtAxHdDRhfR60osIUgNU9llSW/EiFeWlihMdDSzydXVOd1eABA+bQXKCOYyJBvyehpII+lvo9mYXlNX4=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by KL1PR03MB6376.apcprd03.prod.outlook.com (2603:1096:820:97::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 09:11:30 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1b82:a45d:e171:62e8]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1b82:a45d:e171:62e8%4]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 09:11:30 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 02/15] dt-bindings: gce: mt8195: Add
 CMDQ_SYNC_TOKEN_SECURE_THR_EOF event id
Thread-Topic: [PATCH 02/15] dt-bindings: gce: mt8195: Add
 CMDQ_SYNC_TOKEN_SECURE_THR_EOF event id
Thread-Index: AQHZ6mVuaEaAeOxsw0iaYveBj8ZT1bAouz6AgAJLx4CAABsCgIAAKbeA
Date: Mon, 25 Sep 2023 09:11:30 +0000
Message-ID: <354bb70cd3f1921dd58629a044af7bfe4f3306c0.camel@mediatek.com>
References: <20230918192204.32263-1-jason-jh.lin@mediatek.com>
 <20230918192204.32263-3-jason-jh.lin@mediatek.com>
 <20372e40-e4fc-467a-d91a-fcf8e26728bc@linaro.org>
 <1f324b04cbd8faa7510a3519eb718c0be25af2be.camel@mediatek.com>
 <e69ca292-e0b9-4ee2-9f4e-6e9300a636a6@linaro.org>
In-Reply-To: <e69ca292-e0b9-4ee2-9f4e-6e9300a636a6@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|KL1PR03MB6376:EE_
x-ms-office365-filtering-correlation-id: 981e9e9f-c217-4664-f53d-08dbbda767ed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tVRLYxsngyjajtQEsRwMbrcuJhdjEvBGH6fsjsNdWiyIiMDRGQ3rp2ufcltSSg1xkZ2vephGA3CP8kll0KSBRMhgMOSJ4zUWdQCKEfO9ehHT0i6nloRdYXxbjXDslsVusiUsQqsX22ziAFR67iCkWaA4uea6pwSA/w6rClLBBxHM+VOanTTqtLZnKx/3H1QAEw2Rq5/4XE0fIZO0L3uK2GkpXHmEpFEwM1j3/JrTusf2pZHybbb+Zg+OQfRXIae/LKmrBvelV32Jfg3hxlAZpUsH4HiUNdBsmNTPoloUVD8ey5Co+jix+LMfdSRPFAiSqeEhKTxZqWx9/pD8QYvWKZBrnIhJvrHR2ZDDuErZ9KfmyFrvYMIEn5r8s+QXIhSwfBRTIw409v/1ui1TvFJ71ULKVNqOc9AetzyAlubhCQpsNL2Ty9e3mVFWD/Z83CxxwsxB6dsQYuh6pMBfSNUd/w2UdgPGhPkHZ00M/a532NsuWX7WVpIAWL/mnjJPGAHzp7Fq+fjz7Fo3EnRDsa0MS+/EqJfsl+aL0CoXlL630Fs0UlTYAFiXUjZKMekS2CYhpS5WTMtE/+KArdES1rcdKhyFLB/UPn6Z4w9gaRthlhuDee4J9EbNn1xrXqVrWvt96BWJlklq4mlEMZllFLQREvI+nbGw39moSm8aex0hmPA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(39860400002)(366004)(396003)(136003)(230922051799003)(1800799009)(186009)(451199024)(6506007)(53546011)(6486002)(6512007)(107886003)(26005)(71200400001)(2616005)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(86362001)(110136005)(91956017)(478600001)(122000001)(38070700005)(38100700002)(83380400001)(54906003)(2906002)(8936002)(8676002)(4326008)(85182001)(36756003)(5660300002)(316002)(41300700001)(7416002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SWIrWUJTV0YzRmZFZjc5NDhxSUR3aFBJNC8vdTNOdjFiQ1N4RkxKTzhqUXNK?=
 =?utf-8?B?T3hLQUtYWENOWGlFWUlYQmdoWWJqY1lmdlJpcU9nNlZmZEh2NTgwcUZwTEtC?=
 =?utf-8?B?ZXMvbkUwV1dvOU9rbkh2QlV3MzE5RkhqNmVxUmlCN0N3TjlQZjVnVC83Q05Q?=
 =?utf-8?B?ajFOeHQwMjdZakdObXZseFlOQlpuVSttVklvcVc3WmJwZCtqSi9IbjhkZ2NG?=
 =?utf-8?B?OGFVWHBZZ2NPTTdSdzQ0YzFpWkNFVmVLVEFTbWdHVnpISFRia0ZPYkZjVjdX?=
 =?utf-8?B?TEpEeVhsd1VvSzdnRFJLNnkyZzJCQnpVNncvdmdwdTFUOC9DWkFiY0VtWmlX?=
 =?utf-8?B?VmI2bU4yU2lNTTRFRFVWczJ2VkVBdUlNQ2tacGFEWmZHZTRLYnJyUUZDcFFo?=
 =?utf-8?B?cDRFRFRUU25LZFZOc2lNVE4wckxmeVlOMnNxcHkxald5UWtuUHIweDFGSUln?=
 =?utf-8?B?RHdmZUtqVEZ0Vkc2aGR3SmF0YlhKYlZHMGdJclNPWU5vM3RueFRNZjFLTUxD?=
 =?utf-8?B?QjNzdjdWbVNMaEFTTk5RbjczNjNhMkp4RFNadVdsZUlhWWEzM0NCa0JNNWZ4?=
 =?utf-8?B?MVdBbDJPTzRmQVI3clN1QjZhV3U1QUpFZ0VSUDV2MzBaZzZEdEttcGIzSXpP?=
 =?utf-8?B?S1NTVXhOT1dzRWJHbjJOWHIrdnBiRnpqUWxJTVhIcnVvMzBJc2xlaDBCWjV2?=
 =?utf-8?B?NTkxcDNvbVdhYjcrRStRcDI5NHdnMG5BbllaM2VYNi9Id2JMS1VscFNqRmhz?=
 =?utf-8?B?N0xlWFdpR3FHTFBiYzVPQlhUZFRpaHU4S2xLblZuQ0Y3dldSemYxakhTN1RT?=
 =?utf-8?B?RC96UVAwaitUa2F2cEJsc0Y2RTdYYmpnK1lXVXEydzd6amxnZC9RVWtGVkVs?=
 =?utf-8?B?c0sycWhYZk9qcTVKQ2FhTmtNbG9NNFJZSnZMTUhNbjNNY2diSnh4V25Yb1l5?=
 =?utf-8?B?RU1INGFVb29MdHBJZmxEK0V4V0dabHJXN2lpVXllRDR1U2ZpMXdJdjhMdXlw?=
 =?utf-8?B?N0V4bmE4bVNRamdNOE5tWEtsRU9jNC9kVUFkb3NtK204WG9mTk81b0ViMnBt?=
 =?utf-8?B?MC9SdDRobmdYVzRZUmZaMnRaNzFCb3ZHNHM2WnRMMUhGOTNFVXFMaGhpTGZi?=
 =?utf-8?B?WnM0VkFTV0VXdmsyZy9IT3dML0ZCRTN2blMvRXFIeEFvd1Jab2R3U0ZwTGlC?=
 =?utf-8?B?WlFPcnFmOWNrTWQ4ZzVTV3lpT1ArN3J4emhhWS9IRzRwZWFLTElhZWt6K2dL?=
 =?utf-8?B?eXFSVkdpVVY2SXZ4SG9MS3VNQU5uQUh2a3ZJYkpSWk5CR2hqVWpwVlQ4cXpm?=
 =?utf-8?B?bFQ4ZmxYWm1mVk9VS2NyTFl4a0F3cjcwYWxZQVFlRWZZWU5MZURZV1duN3pn?=
 =?utf-8?B?cy9hZldlSDNwL2JxRFRiZmYrc0hvVk5EKy8wcVB3V29kQnJkY0tPTndpQ0hF?=
 =?utf-8?B?UDRkZlo0TWZwbmp1c2t5TlNYblVBMVcwalZZZDZNc1ptbHpwOVJ4amVUVVAy?=
 =?utf-8?B?SG5sei9QMFZPTk1zYzlwRUdsUXo1UVNqeFdHY3VUc3U4d2hnQ3IrUTRub0kx?=
 =?utf-8?B?cGFBSDJLMStZTllZN0VZVlJvcktUT0x2TWdnTWphQVlEcDcxbm5yZnl4UE0v?=
 =?utf-8?B?ZHE2UHFaNjZ6S0hZKzYzK0xUL0l6UEN2M0dKZmQ2TW8vdDhsYmFNd2IrWkhj?=
 =?utf-8?B?eTAyS1JYcjBpbjZMTjF2U09IN2ZuRzZ2amtPR1dWcGR0ZDBzTytFV1JOcDlW?=
 =?utf-8?B?Um54c1IwTDJLc0VaOVhwWklrdWJVMy9uWm5iWjZsbUlrUVlCTVE3U3lxd0JZ?=
 =?utf-8?B?ZG0reFVBWXZmUC9wdjhYNE5Cc2dYK0tOWXlIdktEMEtiYWhlQVV2S2JKbDcr?=
 =?utf-8?B?TjBGTE0rOVgya0VzaFZwNUJWMHROcVlFKzFhdCtUWCtML2w3a2ROeEZiTHM1?=
 =?utf-8?B?bTRSejl1YTlMMWE4T0FjUlVSNFM2b05KTmRMaTczbHd0TUxvMGpMNTNFcmtv?=
 =?utf-8?B?KzFHeU01QjFnVUhuSlh0cTJ5Z2R6QkxpNU94WG1GOVU1M2VJNE45eUtsOUUr?=
 =?utf-8?B?RFROemlqQnMxTzhTZkFCcDlIKzJFc2ZmSGpWanRCNEYxQUFlbkplcll4bzVQ?=
 =?utf-8?B?UzlaWHIyclZmR3ZBZjhBUFpDazV5ZnFCVzZBSTR2WFZCaVluejJoNEJ3Rm03?=
 =?utf-8?B?bHc9PQ==?=
Content-ID: <B19A915DFD87314990646C230BBCCD40@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 981e9e9f-c217-4664-f53d-08dbbda767ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2023 09:11:30.3345 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GGomSWz5Uby69dgZ1KeN3ofAcSRhZYkx6YUy+6vkaZvt/b46oytbN4CIWxiwKNZp4qg06HS9jY4IcXdFGn4E3/qCH6CQSSTxfkJ2sd3yBwI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB6376
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_006_89212528.974587870"
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

--__=_Part_Boundary_006_89212528.974587870
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCk9uJiMzMjtNb24sJiMzMjsyMDIzLTA5LTI1JiMzMjthdCYjMzI7MDg6NDImIzMyOysw
MjAwLCYjMzI7S3J6eXN6dG9mJiMzMjtLb3psb3dza2kmIzMyO3dyb3RlOg0KJmd0OyYjMzI7JiMz
MjsmIzMyOw0KJmd0OyYjMzI7RXh0ZXJuYWwmIzMyO2VtYWlsJiMzMjs6JiMzMjtQbGVhc2UmIzMy
O2RvJiMzMjtub3QmIzMyO2NsaWNrJiMzMjtsaW5rcyYjMzI7b3ImIzMyO29wZW4mIzMyO2F0dGFj
aG1lbnRzJiMzMjt1bnRpbA0KJmd0OyYjMzI7eW91JiMzMjtoYXZlJiMzMjt2ZXJpZmllZCYjMzI7
dGhlJiMzMjtzZW5kZXImIzMyO29yJiMzMjt0aGUmIzMyO2NvbnRlbnQuDQomZ3Q7JiMzMjsmIzMy
O09uJiMzMjsyNS8wOS8yMDIzJiMzMjswNzowNSwmIzMyO0phc29uLUpIJiMzMjtMaW4mIzMyOygm
IzI2NTE5OyYjMzA1OTE7JiMzMTA3NzspJiMzMjt3cm90ZToNCiZndDsmIzMyOyZndDsmIzMyO0hp
JiMzMjtLcnp5c3p0b2YsDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyO1Ro
YW5rcyYjMzI7Zm9yJiMzMjt0aGUmIzMyO3Jldmlld3MuDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZn
dDsmIzMyOyZndDsmIzMyO09uJiMzMjtTYXQsJiMzMjsyMDIzLTA5LTIzJiMzMjthdCYjMzI7MjA6
MDEmIzMyOyswMjAwLCYjMzI7S3J6eXN6dG9mJiMzMjtLb3psb3dza2kmIzMyO3dyb3RlOg0KJmd0
OyYjMzI7Jmd0OyZndDsmIzMyOyYjMzI7JiMzMjsNCiZndDsmIzMyOyZndDsmZ3Q7JiMzMjtFeHRl
cm5hbCYjMzI7ZW1haWwmIzMyOzomIzMyO1BsZWFzZSYjMzI7ZG8mIzMyO25vdCYjMzI7Y2xpY2sm
IzMyO2xpbmtzJiMzMjtvciYjMzI7b3BlbiYjMzI7YXR0YWNobWVudHMNCiZndDsmIzMyO3VudGls
DQomZ3Q7JiMzMjsmZ3Q7Jmd0OyYjMzI7eW91JiMzMjtoYXZlJiMzMjt2ZXJpZmllZCYjMzI7dGhl
JiMzMjtzZW5kZXImIzMyO29yJiMzMjt0aGUmIzMyO2NvbnRlbnQuDQomZ3Q7JiMzMjsmZ3Q7Jmd0
OyYjMzI7JiMzMjtPbiYjMzI7MTgvMDkvMjAyMyYjMzI7MjE6MjEsJiMzMjtKYXNvbi1KSC5MaW4m
IzMyO3dyb3RlOg0KJmd0OyYjMzI7Jmd0OyZndDsmZ3Q7JiMzMjtDTURRX1NZTkNfVE9LRU5fU0VD
VVJFX1RIUl9FT0YmIzMyO2lzJiMzMjt1c2VkJiMzMjthcyYjMzI7c2VjdXJlJiMzMjtpcnEmIzMy
O3RvJiMzMjtub3RpZnkNCiZndDsmIzMyO0NNRFENCiZndDsmIzMyOyZndDsmZ3Q7Jmd0OyYjMzI7
ZHJpdmVyJiMzMjtpbiYjMzI7dGhlJiMzMjtub3JtYWwmIzMyO3dvcmxkJiMzMjt0aGF0JiMzMjtH
Q0UmIzMyO3NlY3VyZSYjMzI7dGhyZWFkJiMzMjtoYXMmIzMyO2NvbXBsZXRlZCYjMzI7YQ0KJmd0
OyYjMzI7Jmd0OyZndDsmIzMyO3Rhc2sNCiZndDsmIzMyOyZndDsmZ3Q7Jmd0OyYjMzI7aW4mIzMy
O3RoZWUmIzMyO3NlY3VyZSYjMzI7d29ybGQuDQomZ3Q7JiMzMjsmZ3Q7Jmd0Ow0KJmd0OyYjMzI7
Jmd0OyZndDsmIzMyO0hvdyYjMzI7Y2FuJiMzMjsjZGVmaW5lJiMzMjtiZSYjMzI7YWRkZWQmIzMy
O2FmdGVyJiMzMjtpdHMmIzMyO3VzYWdlJiM2MzsmIzMyO0RvZXMmIzMyO2l0JiMzMjtldmVuJiMz
MjttYWtlJiMzMjthbnkNCiZndDsmIzMyO3NlbnNlDQomZ3Q7JiMzMjsmZ3Q7Jmd0OyYjMzI7b2YN
CiZndDsmIzMyOyZndDsmZ3Q7JiMzMjtiZWluZyYjMzI7c2VwYXJhdGUmIzMyO3BhdGNoJiM2MzsN
CiZndDsmIzMyOyZndDsmZ3Q7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMy
O1RoaXMmIzMyO2RlZmluaXRpb24mIzMyO2lzJiMzMjt1c2VkJiMzMjtpbiYjMzI7dGhlJiMzMjtt
dDgxOTUuZHRzJiMzMjthdCYjMzI7W1BBVENIJiMzMjsxNS8xNV0mIzMyO2FuZCYjMzI7dGhlDQom
Z3Q7JiMzMjtDTURRDQomZ3Q7JiMzMjsNCiZndDsmIzMyO05vLCYjMzI7dGhlJiMzMjtkZWZpbmUm
IzMyO2lzJiMzMjt1c2VkJiMzMjtpbiYjMzI7cHJldmlvdXMmIzMyO3BhdGNoLCYjMzI7d2hpY2gm
IzMyO21lYW5zJiMzMjt5b3VyJiMzMjtwYXRjaHNldA0KJmd0OyYjMzI7aXMNCiZndDsmIzMyO25v
dCYjMzI7YmlzZWN0YWJsZSYjMzI7YW5kJiMzMjtub3QmIzMyO3Rlc3RlZC4NCiZndDsmIzMyOw0K
DQpEbyYjMzI7eW91JiMzMjttZWFuJiMzMjt0aGlzJiMzMjtwYXRjaCYjMzI7c2hvdWxkJiMzMjth
ZGQmIzMyO2JlZm9yZSYjMzI7cGF0Y2gmIzMyOzEmIzYzOw0KDQoNClRoZSYjMzI7ZXhhbXBsZSYj
MzI7b2YmIzMyO2R0cyYjMzI7aW4mIzMyO3BhdGNoJiMzMjsxJiMzMjtpcyYjMzI7dXNlZCYjMzI7
dGhlJiMzMjtkZWZpbml0aW9uJiMzMjtvZiYjMzI7bXQ4MTg4LCYjMzI7c28mIzMyO0kNCnRoaW5r
JiMzMjtJJiMzMjtjYW4mIzMyO2FkZCYjMzI7dGhpcyYjMzI7cGF0Y2gmIzMyO3RvJiMzMjtkZWZp
bmUmIzMyO3RoZSYjMzI7Z2NlJiMzMjtldmVudCYjMzI7aWQmIzMyO2ZvciYjMzI7bXQ4MTk1JiMz
MjthZnRlcg0KcGF0Y2gmIzMyOzEuDQoNCkkmIzMyO3dpbGwmIzMyO3N3YXAmIzMyO3RoZSYjMzI7
cGF0Y2gmIzMyOzEmIzMyO2FuZCYjMzI7dGhlJiMzMjtwYXRjaCYjMzI7MiYjMzI7aW4mIzMyO3Ro
ZSYjMzI7bmV4dCYjMzI7dmVyc2lvbiwmIzMyO2lmJiMzMjt0aGF0DQpjYW4mIzMyO21ha2UmIzMy
O2l0JiMzMjttb3JlJiMzMjthcHByb3ByaWF0ZS4NCg0KUmVnYXJkcywNCkphc29uLUpILkxpbg0K
DQomZ3Q7JiMzMjtCZXN0JiMzMjtyZWdhcmRzLA0KJmd0OyYjMzI7S3J6eXN6dG9mDQomZ3Q7JiMz
MjsNCiZndDsmIzMyOw0KDQo8L3ByZT48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioq
KioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZSAqKioqKioqKioqKioqKioq
KioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChp
bmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0
YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5k
ZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkg
dG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCAN
CmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1t
YWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50
KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3Ug
YXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUg
DQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90
aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwp
LCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwgKGluY2x1ZGluZyBh
bnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRo
ZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSEN
CjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_006_89212528.974587870
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDIzLTA5LTI1IGF0IDA4OjQyICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiAgCSANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRl
ciBvciB0aGUgY29udGVudC4NCj4gIE9uIDI1LzA5LzIwMjMgMDc6MDUsIEphc29uLUpIIExpbiAo
5p6X552/56WlKSB3cm90ZToNCj4gPiBIaSBLcnp5c3p0b2YsDQo+ID4gDQo+ID4gVGhhbmtzIGZv
ciB0aGUgcmV2aWV3cy4NCj4gPiANCj4gPiBPbiBTYXQsIDIwMjMtMDktMjMgYXQgMjA6MDEgKzAy
MDAsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+ID4+ICAgDQo+ID4+IEV4dGVybmFsIGVt
YWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzDQo+IHVu
dGlsDQo+ID4+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+
ID4+ICBPbiAxOC8wOS8yMDIzIDIxOjIxLCBKYXNvbi1KSC5MaW4gd3JvdGU6DQo+ID4+PiBDTURR
X1NZTkNfVE9LRU5fU0VDVVJFX1RIUl9FT0YgaXMgdXNlZCBhcyBzZWN1cmUgaXJxIHRvIG5vdGlm
eQ0KPiBDTURRDQo+ID4+PiBkcml2ZXIgaW4gdGhlIG5vcm1hbCB3b3JsZCB0aGF0IEdDRSBzZWN1
cmUgdGhyZWFkIGhhcyBjb21wbGV0ZWQgYQ0KPiA+PiB0YXNrDQo+ID4+PiBpbiB0aGVlIHNlY3Vy
ZSB3b3JsZC4NCj4gPj4NCj4gPj4gSG93IGNhbiAjZGVmaW5lIGJlIGFkZGVkIGFmdGVyIGl0cyB1
c2FnZT8gRG9lcyBpdCBldmVuIG1ha2UgYW55DQo+IHNlbnNlDQo+ID4+IG9mDQo+ID4+IGJlaW5n
IHNlcGFyYXRlIHBhdGNoPw0KPiA+Pg0KPiA+IA0KPiA+IFRoaXMgZGVmaW5pdGlvbiBpcyB1c2Vk
IGluIHRoZSBtdDgxOTUuZHRzIGF0IFtQQVRDSCAxNS8xNV0gYW5kIHRoZQ0KPiBDTURRDQo+IA0K
PiBObywgdGhlIGRlZmluZSBpcyB1c2VkIGluIHByZXZpb3VzIHBhdGNoLCB3aGljaCBtZWFucyB5
b3VyIHBhdGNoc2V0DQo+IGlzDQo+IG5vdCBiaXNlY3RhYmxlIGFuZCBub3QgdGVzdGVkLg0KPiAN
Cg0KRG8geW91IG1lYW4gdGhpcyBwYXRjaCBzaG91bGQgYWRkIGJlZm9yZSBwYXRjaCAxPw0KDQoN
ClRoZSBleGFtcGxlIG9mIGR0cyBpbiBwYXRjaCAxIGlzIHVzZWQgdGhlIGRlZmluaXRpb24gb2Yg
bXQ4MTg4LCBzbyBJDQp0aGluayBJIGNhbiBhZGQgdGhpcyBwYXRjaCB0byBkZWZpbmUgdGhlIGdj
ZSBldmVudCBpZCBmb3IgbXQ4MTk1IGFmdGVyDQpwYXRjaCAxLg0KDQpJIHdpbGwgc3dhcCB0aGUg
cGF0Y2ggMSBhbmQgdGhlIHBhdGNoIDIgaW4gdGhlIG5leHQgdmVyc2lvbiwgaWYgdGhhdA0KY2Fu
IG1ha2UgaXQgbW9yZSBhcHByb3ByaWF0ZS4NCg0KUmVnYXJkcywNCkphc29uLUpILkxpbg0KDQo+
IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQo+IA0KPiANCg==

--__=_Part_Boundary_006_89212528.974587870--

