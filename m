Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A259F72D72C
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 03:53:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00EE910E309;
	Tue, 13 Jun 2023 01:52:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAC5410E0D9
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 01:52:55 +0000 (UTC)
X-UUID: 00e7db38098d11eeb20a276fd37b9834-20230613
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=x/Yu80Q0OPpj0sVJ0j7BmUNXQu4eSY1FjKzcTtO0904=; 
 b=ghBi/xMpWCfUBxvGK4sdr3SW9AlMkd5pdbUAqg8i5KH05hVQgCadZJKuitSVnTyot9AQ5IH/lUUK+vampXQw6QtfNKjOrcVG+SScAykLPCBVh9lwMZKbetnBecN9iKQWtfZGkMg/c91XnjxVUqODtMDwg9eukl3uNbCghWMd/lc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.26, REQID:b696c88c-6f8f-4520-8bc9-9b2c09257546, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:45
X-CID-INFO: VERSION:1.1.26, REQID:b696c88c-6f8f-4520-8bc9-9b2c09257546, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:45
X-CID-META: VersionHash:cb9a4e1, CLOUDID:98bc683e-7aa7-41f3-a6bd-0433bee822f3,
 B
 ulkID:230613095251RY68AK8N,BulkQuantity:0,Recheck:0,SF:48|38|29|28|17|19|1
 02,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,C
 OL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-UUID: 00e7db38098d11eeb20a276fd37b9834-20230613
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1245548661; Tue, 13 Jun 2023 09:52:50 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 13 Jun 2023 09:52:49 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Tue, 13 Jun 2023 09:52:49 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FDaI20ak/tF0bFsJxgaoAZdVX7Hqf9St5xXcMw2MhBCNjXXQ5i6tZ/GRPVxqhJeYeM2s5OnKAnMSxDBNFxN6i+ClEDIgsSqLW0E3hIZkq5mtSUn1cD1SNyLBhOrhs8qYvMbqO5RyQ/PB0lNh70ygE3j51JqzhS2Ja+tzIExNCILI2yTeZ5YvSVT6dJqndNfepYVEA3Y7TSJmynpN/i9cJUg2vEuuOEZorQQFjSrGUA+zu2S+t6Y6KMcArAyWQ8aJh2b5gKoW3WXzmXbyoESy9vgglGVUZQmhdyBY7+nQj2PG9xzp8ZhTeC2P6gxtKyBuqoQLOIAfd51TwMWr8FjpCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TXKnsgdvgeV6HrfYgo0pcskUC+nJ1KpXCotYPCmZ9io=;
 b=I4xconeTP8Ec1BOUO4+595fc/8eUA4fdxnBCOjKPPXOujtZlJKpKRkITuyWAAC+g0HqpiqHquGvgTV7KPy8VMgK69HXWUu6ENjI46p9cr0NhpdfiojjxaCOiTTFYEvUbv0aKfmqERvemloD+BW4+q3ngDWLOawERpF3+OJ4Tr9T5+HB6yvN27ktUW2GTiBBaDi+ctVDN4pKQct1skT4GK9EWeGeALo5wWSjtYZB1iIX1ryVFAd9OrHqWjtNXbLJTKnm/Q7PY4gto4szAtRlpIdKd+QfTD2o72Z67azq2r1rCYqDKwl+QRwsGI3FBNDnhRXEF7NIJYzJBzNnNUTK3RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TXKnsgdvgeV6HrfYgo0pcskUC+nJ1KpXCotYPCmZ9io=;
 b=Gfo6PtCGFYSVmaDIvu3AvCIRHY+hjLc4l/ylDj7wljUwTSOTH2XaEwL5Few3jp6hi5Nq0b0Svx5ZZaC7y7LcgNoNK05PnnxoWUJO5ERD8TnRoiYIsa0rg98Ah5GxHxtzDVLiH9aN8oP2o8im5ZxN5ikuVbCRAosFSfJJYwPicGg=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEYPR03MB6877.apcprd03.prod.outlook.com (2603:1096:101:b8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Tue, 13 Jun
 2023 01:52:47 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::6fdb:ba2c:bcfc:d5ed]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::6fdb:ba2c:bcfc:d5ed%6]) with mapi id 15.20.6455.037; Tue, 13 Jun 2023
 01:52:47 +0000
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
Thread-Index: AQHZkjsmmHc/VTGOHU6M5MEfnDzs/6+IDwkA
Date: Tue, 13 Jun 2023 01:52:47 +0000
Message-ID: <c5a5a32bd13d709bbea310d218c1f68cb2707a02.camel@mediatek.com>
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
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEYPR03MB6877:EE_
x-ms-office365-filtering-correlation-id: 01a6b91c-ae32-4c25-2b82-08db6bb0e334
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ChwdxQpD33nbI+XPfh/KEHQWHOFtp6MHVJK+Qo8D9ayjfXiqm6P+hyQdZ9fCLMrcsjo2ZZSwMDbVpb5wZQ7SiK/HPgACdy5ppX34YsisUlkps1yfO7GIh4EJeXSW+HIzqX9vAmvNxaquK/2Nc1HsyegMTLmQvHlT7ROtx0GMGa9ACgRxPrxmOg7znpgjSpJr01Cp562OilR4b1R6JrOBTVm+fVdFS+lz1TCi+y5IcWSKYG37tp7sB3BFp5TDAYLa66Xlv9aD6zVYXcsNl1e4ZNXZdjlfb6vaEtUV3WRhlVP8yIztXQMD8bT9EoCMxK1yxKY454icTpP+v7CO4dAukEFKTBdAO/bA5FlHv6QRNN2CoC3peC79NoWdbkdUY65lHFjbfleiLk0p1ky3pl1zmcHPeEZ+mLSY6DueCiBkzglYro2zGv902RjmyBqcR2pVEF8G0mgNPmD+gfpDHPUB5cMU4imUwS0L0WMP7AOJ3PSq8pAjHTrustJBgbCgT9KwSiw188hctP/Vr5druLy68GL3XmwO8N15iWj50N7Pc1MkWBL1YYmc7luuZ5/GFtqs+/x8lzk7EZwX6ePTmY9TomnzxStwpeXplT/3bmOmwWfypwZzdZR9nZOet6MuiAK/
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(376002)(346002)(39860400002)(396003)(366004)(451199021)(66946007)(76116006)(66476007)(66446008)(64756008)(8936002)(8676002)(66556008)(4326008)(316002)(110136005)(54906003)(2906002)(41300700001)(478600001)(5660300002)(7416002)(6486002)(71200400001)(6512007)(26005)(6506007)(83380400001)(186003)(86362001)(36756003)(2616005)(38070700005)(85182001)(38100700002)(921005)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c2N5MlNpVXY3TlpuSUJiNkVDaEFSQ0Frek9LdVdhcDRJYjB6dk01a0dEU2x2?=
 =?utf-8?B?d3BHT1plQWpSQlVhTWp5d3lVcnFpdEZLRkRJS09qSUl5Z1prZGI5b3NsSlJz?=
 =?utf-8?B?NHRtRmFtcDk4SzFObnlXazFJdVNuWk5vdG5ZU29RY0lBaDdKd3ZsQW93UjFq?=
 =?utf-8?B?eTgvc1d2cHNzeGpEaElacm1rcjU1WEZiN1lTU2psalc1aDNLZFQvQXA5ajZY?=
 =?utf-8?B?QlVsRWwySllzc2ZkRG4rSW1jclU3SkpyOVBwL21yMElJYWxKWEpubExoRnJJ?=
 =?utf-8?B?eGFMcU5UREYxRU9WUFNZeGpnVUFoRzlsQU9kd0NTNUwxU2ZIZGdhNTlHNFhL?=
 =?utf-8?B?dDJLV1N5TWxDVWloT1l6VzhhY1FMSllzSTl1RzQ1R1B2cHE5SlVZY2tGNzVu?=
 =?utf-8?B?OHpJSlk2a2VxZ0FqMXlRVHFlMXEyYW5kcUJ3L1RvaitOYXhvUGp5RjlOK1RX?=
 =?utf-8?B?eFJsOStyR3FraUx3ZnkwVTQ4RUVJaEtQMGh1aUtGT3VPRVJqM2QrQ25qV1Vt?=
 =?utf-8?B?aHJPWlYzOHNWdFNsTHlrU0xJWFpoK0JyeTdhRW9wUFd1cWRKeXFrd0JWdG5a?=
 =?utf-8?B?Zk51NzlkWnZYTlZzNTZYU2pzNVFjOEVoamRyU2crUVB5YTdLSEJmLzZNNEJC?=
 =?utf-8?B?d1ZvMTYyRXlMTFowZUtINVRCTTMrVldlVlBWOG05WXNFWGxHTVBFSnNBdEtx?=
 =?utf-8?B?aGdsMGNvd3JqaFAxWEpXaVNSMG9FemY0aGJiellWL2o1ZWRJMXplVDNxR1BB?=
 =?utf-8?B?Ry9TV0o3L3IrU2ZSNlZ6K2Y1ZTN4eldxZGhha2gyZ1JuMzJ1QXRLalpWTXpX?=
 =?utf-8?B?UEVPaTJ4cCt3OFk1M1VhcmFSY1ZIVlZLZFgvalh5S1RGbi9ERTBXNlIybHht?=
 =?utf-8?B?WkI2NHkzSFdtVHkvMkdBRGFrWndpa3EwRHNIQ0lhalRaQS9ESFgyQ2E0Y1la?=
 =?utf-8?B?MWp2L1ozZ0p2NkRDR0llMzhCWVFEc0kxZnJyZ3FlS1oyQ2FEOG5BZGlBVytO?=
 =?utf-8?B?OWI4VThsdGtldFJHeW1vVjI3SXVZdjZqR0FFZkdrTkJYUmp3U2xjQnYxRUpT?=
 =?utf-8?B?bUlzM1RXeWtncTZOOTVvR3l6S1ViUjIwOFdleW5DSXRicDExWVdVRDlWbW85?=
 =?utf-8?B?enR4S3VZUXR4UnIwL2V5UjBmU2lrNnJaODA2WmtrZDRFZ01BUXBOMnhGUkpv?=
 =?utf-8?B?ZHNFdUtOUjI5N05pMXQ3MjZqRmpqUTVjVEdjZk13cVVmVUZlTXdCUUNES2Uy?=
 =?utf-8?B?RzNSa2d6RWh1L01zQ2dlazlYTVNMRyt0b1ZQMElDUENVNG1PWDlCaWFqZ3Fp?=
 =?utf-8?B?VTFUTCtneTBYZkRHYzB4T1JEV1BtV2dvN0hVMzJ5QThKbjl4TThnbFJtRGlW?=
 =?utf-8?B?bVZaU3phOVFIUXR2NHVTK0pzT2QwVEJQZVY0Mmc2enFHSi9odC9GOERleEZB?=
 =?utf-8?B?aXhORks4bzc0L2I2TnEyNzJsMVZjQUg5cng2THIybHBod3RxZlJmbnBpQlpm?=
 =?utf-8?B?NUNFRmVCQ3k2MDlYYURtNlNJTlFTSVlEYWE5OEg1SDZDdjRLT1c0RWJmREN5?=
 =?utf-8?B?U1dhWWRzVHc4N05MV2htWWdFeDN4WDQzS1k5OWsrZUp6Zm1OUWpDVCtSZWEz?=
 =?utf-8?B?cVhYUlhNakI0bHVnMVhBTncvdW5WcFgva1NwakJHaUZsc3N4eUErVHl6N1ZR?=
 =?utf-8?B?dThjQTVTK3JJRE5QNnVqVklOdG40bDdaaWtaR21mTXlycE0yQlFTVGJXV3ZI?=
 =?utf-8?B?VXNuTzMweDVreGlUNmdOdGlNUjlWNk5TNHZQVDlaeEp6OHBHVy91dVpkZVd4?=
 =?utf-8?B?dHdNQU9HUFhkMi82azNWdlRSNXBBNkRZeGtZREJGQ1hxa3FSeStQSFllMWN0?=
 =?utf-8?B?QWdQc05lV3JoQXRXczdnU0FKTXFOaFRrRlBNMExraGhEdzdjVDRLa2gvMDZL?=
 =?utf-8?B?V3B4N0NMS2x3akJ6UUF4dmJ3TE0veWMyWXdHTlNhbExzUVNmcWN4TWFIK0gz?=
 =?utf-8?B?UVR5MmMxbUhuYkdPUDYzZkk1KzhLdXJDS1BobjJ2MjVUVmJiYVhzZ1VBSDh6?=
 =?utf-8?B?S1hyWTh0aGdlNFY2cDR0MVY1b2NiT09NK0F4QTR5UVZHSFJlUEhtTTN1VThy?=
 =?utf-8?Q?i+wYHQpHQ1EED16KAr1UVUG+M?=
Content-ID: <FDB59C07985E6145A3E2DCA970D37D94@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01a6b91c-ae32-4c25-2b82-08db6bb0e334
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2023 01:52:47.2880 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kcx4yWrrb2qNEwLj6qvkAkvH48/VtfpuDU9gJ9D4t/OO3IEzjW/47qLCGCn6Os714mchxZwJZ+XERzpKiAVlXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6877
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_009_1426676342.1860562837"
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

--__=_Part_Boundary_009_1426676342.1860562837
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
YXlsaWJyZS5jb20mZ3Q7DQomZ3Q7JiMzMjsNCg0KW3NuaXBdDQoNCiZndDsmIzMyOysNCiZndDsm
IzMyOytzdGF0aWMmIzMyO3Vuc2lnbmVkJiMzMjtjaGFyJiMzMjt2ZGRjX3JlYWQoc3RydWN0JiMz
MjttdGtfaGRtaV9kZGMmIzMyOypkZGMsJiMzMjt1bnNpZ25lZA0KJmd0OyYjMzI7aW50JiMzMjt1
NF9jbGtfZGl2LA0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
dW5zaWduZWQmIzMyO2NoYXImIzMyO3VjX2RldiwmIzMyO3Vuc2lnbmVkJiMzMjtpbnQmIzMyO3U0
X2FkZHIsDQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtlbnVt
JiMzMjtzaWZfYml0X3RfaGRtaSYjMzI7dWNfYWRkcl90eXBlLA0KJmd0OyYjMzI7KyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7dW5zaWduZWQmIzMyO2NoYXImIzMyOypwdWNfdmFs
dWUsJiMzMjt1bnNpZ25lZCYjMzI7aW50JiMzMjt1NF9jb3VudCkNCiZndDsmIzMyOyt7DQomZ3Q7
JiMzMjsrdW5zaWduZWQmIzMyO2ludCYjMzI7dTRfcmVhZF9jb3VudCYjMzI7PSYjMzI7MDsNCiZn
dDsmIzMyOyt1bnNpZ25lZCYjMzI7Y2hhciYjMzI7dWNfcmV0dXJuX3ZhbHVlJiMzMjs9JiMzMjsw
Ow0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7K2lmJiMzMjsoIXB1Y192YWx1ZSYjMzI7fHwmIzMyOyF1
NF9jb3VudCYjMzI7fHwmIzMyOyF1NF9jbGtfZGl2JiMzMjt8fA0KJmd0OyYjMzI7KyYjMzI7JiMz
MjsmIzMyOyYjMzI7dWNfYWRkcl90eXBlJiMzMjsmZ3Q7JiMzMjtTSUZfMTZfQklUX0hETUkmIzMy
O3x8DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsodWNfYWRkcl90eXBlJiMzMjs9PSYj
MzI7U0lGXzhfQklUX0hETUkmIzMyOyZhbXA7JmFtcDsmIzMyO3U0X2FkZHImIzMyOyZndDsmIzMy
OzI1NSkmIzMyO3x8DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsodWNfYWRkcl90eXBl
JiMzMjs9PSYjMzI7U0lGXzE2X0JJVF9IRE1JJiMzMjsmYW1wOyZhbXA7JiMzMjt1NF9hZGRyJiMz
MjsmZ3Q7JiMzMjs2NTUzNSkpJiMzMjt7DQoNCnVjX2FkZHJfdHlwZSYjMzI7d291bGQmIzMyO25l
dmVyJiMzMjtiZSYjMzI7U0lGXzE2X0JJVF9IRE1JLCYjMzI7c28mIzMyO3JlbW92ZSYjMzI7U0lG
XzE2X0JJVF9IRE1JLg0KDQpSZWdhcmRzLA0KQ0sNCg0KJmd0OyYjMzI7K3JldHVybiYjMzI7MDsN
CiZndDsmIzMyOyt9DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsraWYmIzMyOyh1Y19hZGRyX3R5cGUm
IzMyOz09JiMzMjtTSUZfOF9CSVRfSERNSSkNCiZndDsmIzMyOyt1NF9yZWFkX2NvdW50JiMzMjs9
JiMzMjsyNTUmIzMyOy0mIzMyO3U0X2FkZHImIzMyOysmIzMyOzE7DQomZ3Q7JiMzMjsrZWxzZSYj
MzI7aWYmIzMyOyh1Y19hZGRyX3R5cGUmIzMyOz09JiMzMjtTSUZfMTZfQklUX0hETUkpDQomZ3Q7
JiMzMjsrdTRfcmVhZF9jb3VudCYjMzI7PSYjMzI7NjU1MzUmIzMyOy0mIzMyO3U0X2FkZHImIzMy
OysmIzMyOzE7DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrdTRfcmVhZF9jb3VudCYjMzI7PSYjMzI7
KHU0X3JlYWRfY291bnQmIzMyOyZndDsmIzMyO3U0X2NvdW50KSYjMzI7JiM2MzsmIzMyO3U0X2Nv
dW50JiMzMjs6DQomZ3Q7JiMzMjt1NF9yZWFkX2NvdW50Ow0KJmd0OyYjMzI7K3VjX3JldHVybl92
YWx1ZSYjMzI7PSYjMzI7ZGRjbV9yZWFkX2hkbWkoZGRjLCYjMzI7dTRfY2xrX2RpdiwmIzMyO3Vj
X2RldiwmIzMyO3U0X2FkZHIsDQomZ3Q7JiMzMjsrJiMzMjt1Y19hZGRyX3R5cGUsJiMzMjtwdWNf
dmFsdWUsJiMzMjt1NF9yZWFkX2NvdW50KTsNCiZndDsmIzMyOytyZXR1cm4mIzMyO3VjX3JldHVy
bl92YWx1ZTsNCiZndDsmIzMyOyt9DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrc3RhdGljJiMzMjti
b29sJiMzMjtmZ19kZGNfZGF0YV9yZWFkKHN0cnVjdCYjMzI7bXRrX2hkbWlfZGRjJiMzMjsqZGRj
LA0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3Vuc2lnbmVkJiMzMjtj
aGFyJiMzMjtiX2RldiwNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjt1
bnNpZ25lZCYjMzI7Y2hhciYjMzI7Yl9kYXRhX2FkZHIsDQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7dW5zaWduZWQmIzMyO2NoYXImIzMyO2JfZGF0YV9jb3VudCwNCiZn
dDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjt1bnNpZ25lZCYjMzI7Y2hhciYj
MzI7KnByX2RhdGEpDQomZ3Q7JiMzMjsrew0KJmd0OyYjMzI7K2ludCYjMzI7cmV0Ow0KJmd0OyYj
MzI7Kw0KJmd0OyYjMzI7K211dGV4X2xvY2soJmFtcDtkZGMtJmd0O210eCk7DQomZ3Q7JiMzMjsr
DQomZ3Q7JiMzMjsraGRtaV9kZGNfcmVxdWVzdChkZGMpOw0KJmd0OyYjMzI7K3JldCYjMzI7PSYj
MzI7dmRkY19yZWFkKGRkYywmIzMyO0REQzJfQ0xPSywmIzMyO2JfZGV2LCYjMzI7Yl9kYXRhX2Fk
ZHIsJiMzMjtTSUZfOF9CSVRfSERNSSwNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjtwcl9kYXRhLCYjMzI7Yl9kYXRhX2NvdW50KTsNCiZndDsmIzMyOyttdXRleF91bmxv
Y2soJmFtcDtkZGMtJmd0O210eCk7DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrcmV0dXJuJiMzMjty
ZXQmIzMyOz09JiMzMjtiX2RhdGFfY291bnQ7DQomZ3Q7JiMzMjsrfQ0KJmd0OyYjMzI7Kw0KDQom
Z3Q7JiMzMjsNCg0KPC9wcmU+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioq
KioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioqKioqKioqKioN
ClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVk
aW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwg
cHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFw
cGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRo
ZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0
cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAo
aW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBp
cyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBu
b3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlIA0KdGhh
dCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0
aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVs
ZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0
dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29u
dGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3By
ZT48IS0tfS0tPg==

--__=_Part_Boundary_009_1426676342.1860562837
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEd1aWxsYXVtZToNCg0KT24gTW9uLCAyMDIzLTA1LTI5IGF0IDE2OjMxICswMjAwLCBHdWls
bGF1bWUgUmFucXVldCB3cm90ZToNCj4gIAkgDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRv
IG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZl
cmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+ICBBZGRzIGhkbWkgYW5kIGhkbWkt
ZGRjIHN1cHBvcnQgZm9yIHYyIElQLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogR3VpbGxhdW1lIFJh
bnF1ZXQgPGdyYW5xdWV0QGJheWxpYnJlLmNvbT4NCj4gDQoNCltzbmlwXQ0KDQo+ICsNCj4gK3N0
YXRpYyB1bnNpZ25lZCBjaGFyIHZkZGNfcmVhZChzdHJ1Y3QgbXRrX2hkbWlfZGRjICpkZGMsIHVu
c2lnbmVkDQo+IGludCB1NF9jbGtfZGl2LA0KPiArICAgICAgIHVuc2lnbmVkIGNoYXIgdWNfZGV2
LCB1bnNpZ25lZCBpbnQgdTRfYWRkciwNCj4gKyAgICAgICBlbnVtIHNpZl9iaXRfdF9oZG1pIHVj
X2FkZHJfdHlwZSwNCj4gKyAgICAgICB1bnNpZ25lZCBjaGFyICpwdWNfdmFsdWUsIHVuc2lnbmVk
IGludCB1NF9jb3VudCkNCj4gK3sNCj4gK3Vuc2lnbmVkIGludCB1NF9yZWFkX2NvdW50ID0gMDsN
Cj4gK3Vuc2lnbmVkIGNoYXIgdWNfcmV0dXJuX3ZhbHVlID0gMDsNCj4gKw0KPiAraWYgKCFwdWNf
dmFsdWUgfHwgIXU0X2NvdW50IHx8ICF1NF9jbGtfZGl2IHx8DQo+ICsgICAgdWNfYWRkcl90eXBl
ID4gU0lGXzE2X0JJVF9IRE1JIHx8DQo+ICsgICAgKHVjX2FkZHJfdHlwZSA9PSBTSUZfOF9CSVRf
SERNSSAmJiB1NF9hZGRyID4gMjU1KSB8fA0KPiArICAgICh1Y19hZGRyX3R5cGUgPT0gU0lGXzE2
X0JJVF9IRE1JICYmIHU0X2FkZHIgPiA2NTUzNSkpIHsNCg0KdWNfYWRkcl90eXBlIHdvdWxkIG5l
dmVyIGJlIFNJRl8xNl9CSVRfSERNSSwgc28gcmVtb3ZlIFNJRl8xNl9CSVRfSERNSS4NCg0KUmVn
YXJkcywNCkNLDQoNCj4gK3JldHVybiAwOw0KPiArfQ0KPiArDQo+ICtpZiAodWNfYWRkcl90eXBl
ID09IFNJRl84X0JJVF9IRE1JKQ0KPiArdTRfcmVhZF9jb3VudCA9IDI1NSAtIHU0X2FkZHIgKyAx
Ow0KPiArZWxzZSBpZiAodWNfYWRkcl90eXBlID09IFNJRl8xNl9CSVRfSERNSSkNCj4gK3U0X3Jl
YWRfY291bnQgPSA2NTUzNSAtIHU0X2FkZHIgKyAxOw0KPiArDQo+ICt1NF9yZWFkX2NvdW50ID0g
KHU0X3JlYWRfY291bnQgPiB1NF9jb3VudCkgPyB1NF9jb3VudCA6DQo+IHU0X3JlYWRfY291bnQ7
DQo+ICt1Y19yZXR1cm5fdmFsdWUgPSBkZGNtX3JlYWRfaGRtaShkZGMsIHU0X2Nsa19kaXYsIHVj
X2RldiwgdTRfYWRkciwNCj4gKyB1Y19hZGRyX3R5cGUsIHB1Y192YWx1ZSwgdTRfcmVhZF9jb3Vu
dCk7DQo+ICtyZXR1cm4gdWNfcmV0dXJuX3ZhbHVlOw0KPiArfQ0KPiArDQo+ICtzdGF0aWMgYm9v
bCBmZ19kZGNfZGF0YV9yZWFkKHN0cnVjdCBtdGtfaGRtaV9kZGMgKmRkYywNCj4gKyAgICAgIHVu
c2lnbmVkIGNoYXIgYl9kZXYsDQo+ICsgICAgICB1bnNpZ25lZCBjaGFyIGJfZGF0YV9hZGRyLA0K
PiArICAgICAgdW5zaWduZWQgY2hhciBiX2RhdGFfY291bnQsDQo+ICsgICAgICB1bnNpZ25lZCBj
aGFyICpwcl9kYXRhKQ0KPiArew0KPiAraW50IHJldDsNCj4gKw0KPiArbXV0ZXhfbG9jaygmZGRj
LT5tdHgpOw0KPiArDQo+ICtoZG1pX2RkY19yZXF1ZXN0KGRkYyk7DQo+ICtyZXQgPSB2ZGRjX3Jl
YWQoZGRjLCBEREMyX0NMT0ssIGJfZGV2LCBiX2RhdGFfYWRkciwgU0lGXzhfQklUX0hETUksDQo+
ICsgICAgICBwcl9kYXRhLCBiX2RhdGFfY291bnQpOw0KPiArbXV0ZXhfdW5sb2NrKCZkZGMtPm10
eCk7DQo+ICsNCj4gK3JldHVybiByZXQgPT0gYl9kYXRhX2NvdW50Ow0KPiArfQ0KPiArDQoNCj4g
DQo=

--__=_Part_Boundary_009_1426676342.1860562837--

