Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D67B572D77F
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 04:53:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D23810E2F3;
	Tue, 13 Jun 2023 02:53:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3532B10E2F3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 02:53:28 +0000 (UTC)
X-UUID: 7685db6c099511ee9cb5633481061a41-20230613
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=uXzANLRpe2K1r3PuLgSH0ef8NWuHnZJR6HY4Nc2B8oc=; 
 b=mztPDulGAWsaN6jjWZQtAYfAc2hBDRW+Fx/QarfE9VerlqlNjUxyvmi5/gfiS9S1KYTQ5srn9ow6wGeMmE6o5JBq2KANMjmaVzQPWysDv47Qjw0sWvLDf+fqMRd80jewl2ImNQHEsEaK8J1NVpubC5vpQYqw8UceO2TrGQztZw8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.26, REQID:ebd957f3-aee7-40b3-a9c9-4488b85c495f, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:cb9a4e1, CLOUDID:ca7c3a3e-de1e-4348-bc35-c96f92f1dcbb,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7685db6c099511ee9cb5633481061a41-20230613
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1793213232; Tue, 13 Jun 2023 10:53:23 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 13 Jun 2023 10:53:22 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Tue, 13 Jun 2023 10:53:22 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UXTHm6r6DoTpijU1e30zWnh6RaFVu/Tzy8Suzc0NhBhxC8E+Wm7rpVGJ9DjUA9HM+ssbgE1SCkS81YU3mLPE/78720wJ37Wkg7jKmSX61iPMdAg1L9XNJxRkgMeOpDDB5utd+IFl/hNpSh4P1E9AeYzpYy0O6KdoRUAAwKfY/ZDEw+sqQzRiI2jKJVuWDaESm5QrcLN4hW/vU1DwSMkrqogPXbbc00Hd9S3b9/iW/rWFpTNx/vtCVNUYQiVTlzB2UKb31cKhAsadWIOWeQDqKRPnEzpvEIPnt/IssD1FhFRj5LjjDnHvWlmBDHvV3fHTK+T4QHpQGTzL2aBONS6n6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l+w/I967veNT7hGi2DGnopHRaF1aw67TPG082/07GWg=;
 b=kcAv+g4SGYSP+h1h2LkvJP0Yvbw8zl2QUT84b7RgOXnZR6k9wzmS3SEnFdraDeI+UwycBFJ9jBGtdYnF7GDnQB8+Fw3vbzuvPEJwiw9gi/TBQhsRDWvR3olqgOmN/1S3C/GqLJeK+fOxli20aq3FTtuTM3Tc6kO/p62mkd/qRlMp1CWta4ZqB5OR/3EuTVZ3HICMHHyrgeSROMkKV80uRuG052NCv8J5pbTY9dR3quYcHDLL0JMdR9cLOpD8vWXISA85U/Yt21eKypwR4UHNZ/yttp6RjUSWPSZ8eRIfwFaHagEliKheLPCSrHJLpPu/5YYcGyFhRG5tBjrs+fzIKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l+w/I967veNT7hGi2DGnopHRaF1aw67TPG082/07GWg=;
 b=Hb4XvAWTJc0/r8shk5ganJzFUK4RNxywzb7PBdFxXPpXbGvCMCeBuUyV1xtVfexidMKVDVq38fOAfjwyU4MJiM6QQJ/YGelYzrrtKS8/CKc2LkmptY/reWbs5z9hoi5Cd9v8IbbT/zQmmUJ7HnL/Dn3kTgzlc+uNC5n1i5DxXL4=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYSPR03MB7330.apcprd03.prod.outlook.com (2603:1096:400:42e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.44; Tue, 13 Jun
 2023 02:52:18 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::6fdb:ba2c:bcfc:d5ed]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::6fdb:ba2c:bcfc:d5ed%6]) with mapi id 15.20.6455.037; Tue, 13 Jun 2023
 02:52:18 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "kishon@ti.com"
 <kishon@ti.com>, =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?=
 <Chunfeng.Yun@mediatek.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?=
 <jitao.shi@mediatek.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "granquet@baylibre.com" <granquet@baylibre.com>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "vkoul@kernel.org" <vkoul@kernel.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>
Subject: Re: [PATCH v4 5/8] drm/mediatek: hdmi: add v2 support
Thread-Topic: [PATCH v4 5/8] drm/mediatek: hdmi: add v2 support
Thread-Index: AQHZkjsmmHc/VTGOHU6M5MEfnDzs/6+IH6qA
Date: Tue, 13 Jun 2023 02:52:18 +0000
Message-ID: <086c960fc79fd603424fa68363ebeb4099db8984.camel@mediatek.com>
References: <20220919-v4-0-687f09a06dd9@baylibre.com>
 <20220919-v4-5-687f09a06dd9@baylibre.com>
In-Reply-To: <20220919-v4-5-687f09a06dd9@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYSPR03MB7330:EE_
x-ms-office365-filtering-correlation-id: caf3eda4-931b-42bf-decd-08db6bb933f6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bgFbASxPWTYY55QD/h3iTPpNIyNwyYbwk8ZgNwUwanoB2DKgzEsldONw+vQuWis3qhjuZOT11SMzEp7oyh6qscHoonSNVOXV293pgUKpxzSOaK0ubg2lCYVO8ab0aDvL7b1L7dJJe/1op9u+gwHt4nSGVyjANzBiBHjeOKrOsU2LoM7gdp3MQB8OX8MDLzjv70QbNS7/h/xKOVQMOhW9HIfVzCGPQomuqrytWSvHCVA3WPFSbAZDjeThmX2t/YURce9dr57oN/Jfka+X4IPJqwmU1Xk9dN5YmnW41PmAoZbnkT1bawjaRvTJ0sjTmUC9chJGETD3B4+vVL1NB2vCuw4VG7cx/gGbZ9NEuz7mMlniA5mFbSzjdMI5BYYf9zcjpAfA2ZRMWx5jasV6ucrJ3PXDztRaaz8oINv5/QZK1wH/dXzq13uBJrXeY4g9mMh5lmiHWZ1vTivxeabap4RO6z8ydMieEL1H/KFZLDMy9fYylksgHIHEmVAJjp/oJULu8DxHIXk6N7ownopOB3a+8Qt/OovAGOQWW/Gb/J6cl/vTeATovEyLMyHhVWLT43lalX7PU0gca3AC5sbXqE3UdaSjUfpCXQ8HwwQSX9yNE1l5skrZwRIpGrwQCSYSCMBgF5/oFh+wnME+5Rw843NQTmsayj41fAGp1bIKvXM/fmsPBxRoiJLMv/s7jsSbxOFj
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(376002)(39860400002)(366004)(346002)(136003)(451199021)(5660300002)(7416002)(8936002)(8676002)(2906002)(76116006)(66946007)(66556008)(64756008)(66476007)(66446008)(110136005)(54906003)(71200400001)(6486002)(4326008)(26005)(6506007)(6512007)(186003)(316002)(41300700001)(921005)(83380400001)(2616005)(478600001)(38070700005)(36756003)(38100700002)(86362001)(85182001)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NkVXYW5IeDUydnNTWlRXKzVzVUVoRzNKcWFaV0pKZ1d1QWhUVE9SU0JEZ1BN?=
 =?utf-8?B?cTAxdEFQSEdiemJCem9sNFNQUjJQbHdpbjdWTFB4YzVpYnNjQ1ZVbnNRd01S?=
 =?utf-8?B?aXVWZDhUdlllWWxnQ3dLZFVYMkdqeHpQNXJ5QW8xZUZwaTE0Y0xNbVZHRncz?=
 =?utf-8?B?RHFwRDEvbGtwMG14ZXA2REhvMytjQWhwUmo0a2pOZnBEVStxeUVHWUk2Skph?=
 =?utf-8?B?bnlmaFR6NCtwSUY5a0owREZhOWlsUkwyUGtEZE9qN3AwQ2Z6UFJEVGd2cHRz?=
 =?utf-8?B?bVZ5Z01QSHdSZUN1dHU3R3BwdHY3cDdsczVFamlaTldwUUZlcTRITi9JaHVC?=
 =?utf-8?B?ZGpkb0FYd3E1QVFSazZ2bjd1ZFVsNExyRitJNk9tUVR4NVNyb1QwWFR6QXVm?=
 =?utf-8?B?T3NGWkpUR0xvVmxuU09rM1lqNERaVU41Y3ZBcEk5MVkvTW1OOXpoQVNOZTRi?=
 =?utf-8?B?WEJZamxTUmpFNmVHVUpScU1yUmJPUmQ4TVI2NE05aVVHbm51YUNabGpmeEhp?=
 =?utf-8?B?NHhIOERjU2FHTHVJbUdVWHg2TU04a3lmcFVGMllYMExjZXVGaFk4VWY5a2dR?=
 =?utf-8?B?YTBuVjFzZUJxQVNkZk5HQWVyYjBDMDJmOERNVWNkSmRkaXJOSkVZOGxvRlZk?=
 =?utf-8?B?dlEwQTJ2SlI3WU8vTURxOFZ6YWVsQjA0YUdKSE1uVTEvVThZaUhQYTFlQklO?=
 =?utf-8?B?allsc1pZTmJJM2tiVDZWOFc5SEVqOHhWUUJVa0VYS0xvNVYzbkdJdnJlODRB?=
 =?utf-8?B?Nm8zN0RtelA1YWdiK0Z0VEZUNlRJNk5uVnQ5Rm5kY0tHU1Vkb3VBS2UzMGZu?=
 =?utf-8?B?U2l3YlVTeTh6MmNFT1hpM2tNcTREdVd0R1lqeFhXODBpTmlqVFpBREg3SWlT?=
 =?utf-8?B?RTF2QVlSWG4wcytpajJlaS9GWGVVblVOSHRBY2Z3OE9xUnRpdTZlQnZxcUdv?=
 =?utf-8?B?Rm1IbkIvbWUwVFNSdFNvRjdQcjVXQUo3U2FUcFJGZlFkeUpkckpBd0krdmlG?=
 =?utf-8?B?OVJYTXVGRmd6eXJ5T3hsZ29TQ3RSeE1wb2hqVFlTeGhFd1NiZnQ3UnVIdXlK?=
 =?utf-8?B?WHRQT21seFJ2NHJjYmRVUWM1cGlLQk0vM1l4ZTZkMHR5LytCelpBaER5L2dP?=
 =?utf-8?B?dFpVdUV0V1JmLy80dzZTMmRpTUR0VXF1VmU0R29TYi9zUmtUTFNkQVdmb0cv?=
 =?utf-8?B?ZWZXT3JwdHl3RmVBWUFIbGxJYTh6ejhHVzlxWit2WU9lcXMzcTl0ZlA5Vm1J?=
 =?utf-8?B?WTg2L29La0d1aDg4TUVtZlNuTkowdER0RkQyN1Bja3dkaWNPSjE4QjZuUEU5?=
 =?utf-8?B?NTFpQkc1T01aaE5NdlhsSUhwMGJ2aUhmaHUvWXVUT1luK2U5TDRkU3lWT3JV?=
 =?utf-8?B?WU8xSjNoTmhwYWpOWEMrVFc5NG90dWRoMDI1QndDdTVFRlJxS2hpTHZPTDE2?=
 =?utf-8?B?RGZpSDJrUFVQaWgveUE3OEJJTHBLVlI2SDlvVldTOUhtbzhZUUVxWkxFdGNt?=
 =?utf-8?B?WlFnUHN5bTBkZ3hCaUR6emlwQVphR201Nks1M3RzMnZ4VlFLTk5QM3ZodTRL?=
 =?utf-8?B?NkhsY2k5Y24za2w3NGtTREZvMExkaFZmRmNjdjlRcVlqSVN1cXdibFB2VGVa?=
 =?utf-8?B?K01kVVFlYmlwaTFtS0dYSmJDbjBidjIyWTZvY3NKeXpzc0NVN3p5U2Z5UHNu?=
 =?utf-8?B?M0lSajYrd3VYV1QzVzFacEY5WDg5ZWQvcGQ2YmVsRmdsQ2xXMHhRTXFjVGtF?=
 =?utf-8?B?blZha2liY2JPQUNiaXJaNmsrZWpMSm1UbWYwUjdISE9DZFVnMXlWTUNCU3o4?=
 =?utf-8?B?bGQ3bGZYUFhsbitJb0tFOFRyczBsT1FnSVJnTVZEL3dJWC9nLzlQRHlGUzJa?=
 =?utf-8?B?cm02QnJuSEVJZ0hScjFZN2RkV1dxQ1Evd0FCaGxqT1lvRURPenBTbWt1aWY0?=
 =?utf-8?B?cmF6V2xnY2E3TUxjaE55Si9GeXFCUGxacEN5K2ZtUU5XSEpaOVVYMGZDQ0pq?=
 =?utf-8?B?cnBUL1p1S3lYODNnazU5bXkzaDhlK2Z1SXRrVTJrR1pGZkQ5TjNHUVdIbjZB?=
 =?utf-8?B?d2RXMmtzMXNuKytSbXRoc3FkZ1VNdXNwb1I5dUpDTzF4YUh4L2paaWQ2L1pF?=
 =?utf-8?Q?ctBtyVt/Ejpwzu9Y3XDTvThib?=
Content-ID: <CC40A24D65BA2E448CA9A041653A3753@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caf3eda4-931b-42bf-decd-08db6bb933f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2023 02:52:18.7504 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9h2dAfueJ5xhld7WHf37qxDR2ozHJA8Qy2dv35VB2eTZgZvGlslPrumnjE9zoBcFdIoDocYkrtfAFS1MRGmjEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7330
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_005_77562585.25444410"
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
 =?utf-8?B?TWFjIFNoZW4gKOayiOS/iik=?= <Mac.Shen@mediatek.com>,
 =?utf-8?B?U3R1YXJ0IExlZSAo5p2O57+wKQ==?= <Stuart.Lee@mediatek.com>,
 "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_005_77562585.25444410
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpLCYjMzI7R3VpbGxhdW1lOg0KDQpPbiYjMzI7TW9uLCYjMzI7MjAyMy0wNS0yOSYj
MzI7YXQmIzMyOzE2OjMxJiMzMjsrMDIwMCwmIzMyO0d1aWxsYXVtZSYjMzI7UmFucXVldCYjMzI7
d3JvdGU6DQomZ3Q7JiMzMjsmIzMyOyYjMzI7DQomZ3Q7JiMzMjtFeHRlcm5hbCYjMzI7ZW1haWwm
IzMyOzomIzMyO1BsZWFzZSYjMzI7ZG8mIzMyO25vdCYjMzI7Y2xpY2smIzMyO2xpbmtzJiMzMjtv
ciYjMzI7b3BlbiYjMzI7YXR0YWNobWVudHMmIzMyO3VudGlsDQomZ3Q7JiMzMjt5b3UmIzMyO2hh
dmUmIzMyO3ZlcmlmaWVkJiMzMjt0aGUmIzMyO3NlbmRlciYjMzI7b3ImIzMyO3RoZSYjMzI7Y29u
dGVudC4NCiZndDsmIzMyOyYjMzI7QWRkcyYjMzI7aGRtaSYjMzI7YW5kJiMzMjtoZG1pLWRkYyYj
MzI7c3VwcG9ydCYjMzI7Zm9yJiMzMjt2MiYjMzI7SVAuDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1Np
Z25lZC1vZmYtYnk6JiMzMjtHdWlsbGF1bWUmIzMyO1JhbnF1ZXQmIzMyOyZsdDtncmFucXVldEBi
YXlsaWJyZS5jb20mZ3Q7DQomZ3Q7JiMzMjstLS0NCiZndDsmIzMyOyYjMzI7DQoNCltzbmlwXQ0K
DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrc3RhdGljJiMzMjt1bnNpZ25lZCYjMzI7Y2hhciYjMzI7
dmRkY19yZWFkKHN0cnVjdCYjMzI7bXRrX2hkbWlfZGRjJiMzMjsqZGRjLCYjMzI7dW5zaWduZWQN
CiZndDsmIzMyO2ludCYjMzI7dTRfY2xrX2RpdiwNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyO3Vuc2lnbmVkJiMzMjtjaGFyJiMzMjt1Y19kZXYsJiMzMjt1bnNp
Z25lZCYjMzI7aW50JiMzMjt1NF9hZGRyLA0KDQpSZW1vdmUmIzMyO3RoZSYjMzI7dHlwZSYjMzI7
c3R5bGUmIzMyO2luJiMzMjtuYW1pbmcsDQoNCnU0X2FkZHImIzMyOz0mZ3Q7JiMzMjthZGRyDQoN
ClJlZ2FyZHMsDQpDSw0KDQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjtlbnVtJiMzMjtzaWZfYml0X3RfaGRtaSYjMzI7dWNfYWRkcl90eXBlLA0KJmd0OyYjMzI7
KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7dW5zaWduZWQmIzMyO2NoYXImIzMy
OypwdWNfdmFsdWUsJiMzMjt1bnNpZ25lZCYjMzI7aW50JiMzMjt1NF9jb3VudCkNCiZndDsmIzMy
Oyt7DQomZ3Q7JiMzMjsrdW5zaWduZWQmIzMyO2ludCYjMzI7dTRfcmVhZF9jb3VudCYjMzI7PSYj
MzI7MDsNCiZndDsmIzMyOyt1bnNpZ25lZCYjMzI7Y2hhciYjMzI7dWNfcmV0dXJuX3ZhbHVlJiMz
Mjs9JiMzMjswOw0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7K2lmJiMzMjsoIXB1Y192YWx1ZSYjMzI7
fHwmIzMyOyF1NF9jb3VudCYjMzI7fHwmIzMyOyF1NF9jbGtfZGl2JiMzMjt8fA0KJmd0OyYjMzI7
KyYjMzI7JiMzMjsmIzMyOyYjMzI7dWNfYWRkcl90eXBlJiMzMjsmZ3Q7JiMzMjtTSUZfMTZfQklU
X0hETUkmIzMyO3x8DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsodWNfYWRkcl90eXBl
JiMzMjs9PSYjMzI7U0lGXzhfQklUX0hETUkmIzMyOyZhbXA7JmFtcDsmIzMyO3U0X2FkZHImIzMy
OyZndDsmIzMyOzI1NSkmIzMyO3x8DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsodWNf
YWRkcl90eXBlJiMzMjs9PSYjMzI7U0lGXzE2X0JJVF9IRE1JJiMzMjsmYW1wOyZhbXA7JiMzMjt1
NF9hZGRyJiMzMjsmZ3Q7JiMzMjs2NTUzNSkpJiMzMjt7DQomZ3Q7JiMzMjsrcmV0dXJuJiMzMjsw
Ow0KJmd0OyYjMzI7K30NCiZndDsmIzMyOysNCiZndDsmIzMyOytpZiYjMzI7KHVjX2FkZHJfdHlw
ZSYjMzI7PT0mIzMyO1NJRl84X0JJVF9IRE1JKQ0KJmd0OyYjMzI7K3U0X3JlYWRfY291bnQmIzMy
Oz0mIzMyOzI1NSYjMzI7LSYjMzI7dTRfYWRkciYjMzI7KyYjMzI7MTsNCiZndDsmIzMyOytlbHNl
JiMzMjtpZiYjMzI7KHVjX2FkZHJfdHlwZSYjMzI7PT0mIzMyO1NJRl8xNl9CSVRfSERNSSkNCiZn
dDsmIzMyOyt1NF9yZWFkX2NvdW50JiMzMjs9JiMzMjs2NTUzNSYjMzI7LSYjMzI7dTRfYWRkciYj
MzI7KyYjMzI7MTsNCiZndDsmIzMyOysNCiZndDsmIzMyOyt1NF9yZWFkX2NvdW50JiMzMjs9JiMz
MjsodTRfcmVhZF9jb3VudCYjMzI7Jmd0OyYjMzI7dTRfY291bnQpJiMzMjsmIzYzOyYjMzI7dTRf
Y291bnQmIzMyOzoNCiZndDsmIzMyO3U0X3JlYWRfY291bnQ7DQomZ3Q7JiMzMjsrdWNfcmV0dXJu
X3ZhbHVlJiMzMjs9JiMzMjtkZGNtX3JlYWRfaGRtaShkZGMsJiMzMjt1NF9jbGtfZGl2LCYjMzI7
dWNfZGV2LCYjMzI7dTRfYWRkciwNCiZndDsmIzMyOysmIzMyO3VjX2FkZHJfdHlwZSwmIzMyO3B1
Y192YWx1ZSwmIzMyO3U0X3JlYWRfY291bnQpOw0KJmd0OyYjMzI7K3JldHVybiYjMzI7dWNfcmV0
dXJuX3ZhbHVlOw0KJmd0OyYjMzI7K30NCiZndDsmIzMyOysNCiZndDsmIzMyOw0KDQo8L3ByZT48
IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlk
ZW50aWFsaXR5IE5vdGljZSAqKioqKioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNv
bnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVu
dHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhl
cndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBp
cyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBp
ZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcs
IHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0
YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0
ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNp
cGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUgDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVk
IHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlh
dGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29w
aWVzIG9mIA0KdGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91
ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWls
IHRvIGFueSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_005_77562585.25444410
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEd1aWxsYXVtZToNCg0KT24gTW9uLCAyMDIzLTA1LTI5IGF0IDE2OjMxICswMjAwLCBHdWls
bGF1bWUgUmFucXVldCB3cm90ZToNCj4gIAkgDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRv
IG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZl
cmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+ICBBZGRzIGhkbWkgYW5kIGhkbWkt
ZGRjIHN1cHBvcnQgZm9yIHYyIElQLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogR3VpbGxhdW1lIFJh
bnF1ZXQgPGdyYW5xdWV0QGJheWxpYnJlLmNvbT4NCj4gLS0tDQo+ICANCg0KW3NuaXBdDQoNCj4g
Kw0KPiArc3RhdGljIHVuc2lnbmVkIGNoYXIgdmRkY19yZWFkKHN0cnVjdCBtdGtfaGRtaV9kZGMg
KmRkYywgdW5zaWduZWQNCj4gaW50IHU0X2Nsa19kaXYsDQo+ICsgICAgICAgdW5zaWduZWQgY2hh
ciB1Y19kZXYsIHVuc2lnbmVkIGludCB1NF9hZGRyLA0KDQpSZW1vdmUgdGhlIHR5cGUgc3R5bGUg
aW4gbmFtaW5nLA0KDQp1NF9hZGRyID0+IGFkZHINCg0KUmVnYXJkcywNCkNLDQoNCj4gKyAgICAg
ICBlbnVtIHNpZl9iaXRfdF9oZG1pIHVjX2FkZHJfdHlwZSwNCj4gKyAgICAgICB1bnNpZ25lZCBj
aGFyICpwdWNfdmFsdWUsIHVuc2lnbmVkIGludCB1NF9jb3VudCkNCj4gK3sNCj4gK3Vuc2lnbmVk
IGludCB1NF9yZWFkX2NvdW50ID0gMDsNCj4gK3Vuc2lnbmVkIGNoYXIgdWNfcmV0dXJuX3ZhbHVl
ID0gMDsNCj4gKw0KPiAraWYgKCFwdWNfdmFsdWUgfHwgIXU0X2NvdW50IHx8ICF1NF9jbGtfZGl2
IHx8DQo+ICsgICAgdWNfYWRkcl90eXBlID4gU0lGXzE2X0JJVF9IRE1JIHx8DQo+ICsgICAgKHVj
X2FkZHJfdHlwZSA9PSBTSUZfOF9CSVRfSERNSSAmJiB1NF9hZGRyID4gMjU1KSB8fA0KPiArICAg
ICh1Y19hZGRyX3R5cGUgPT0gU0lGXzE2X0JJVF9IRE1JICYmIHU0X2FkZHIgPiA2NTUzNSkpIHsN
Cj4gK3JldHVybiAwOw0KPiArfQ0KPiArDQo+ICtpZiAodWNfYWRkcl90eXBlID09IFNJRl84X0JJ
VF9IRE1JKQ0KPiArdTRfcmVhZF9jb3VudCA9IDI1NSAtIHU0X2FkZHIgKyAxOw0KPiArZWxzZSBp
ZiAodWNfYWRkcl90eXBlID09IFNJRl8xNl9CSVRfSERNSSkNCj4gK3U0X3JlYWRfY291bnQgPSA2
NTUzNSAtIHU0X2FkZHIgKyAxOw0KPiArDQo+ICt1NF9yZWFkX2NvdW50ID0gKHU0X3JlYWRfY291
bnQgPiB1NF9jb3VudCkgPyB1NF9jb3VudCA6DQo+IHU0X3JlYWRfY291bnQ7DQo+ICt1Y19yZXR1
cm5fdmFsdWUgPSBkZGNtX3JlYWRfaGRtaShkZGMsIHU0X2Nsa19kaXYsIHVjX2RldiwgdTRfYWRk
ciwNCj4gKyB1Y19hZGRyX3R5cGUsIHB1Y192YWx1ZSwgdTRfcmVhZF9jb3VudCk7DQo+ICtyZXR1
cm4gdWNfcmV0dXJuX3ZhbHVlOw0KPiArfQ0KPiArDQo+IA0K

--__=_Part_Boundary_005_77562585.25444410--

