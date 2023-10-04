Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC0B7B77D0
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 08:28:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F243010E093;
	Wed,  4 Oct 2023 06:28:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAEA910E093
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Oct 2023 06:28:55 +0000 (UTC)
X-UUID: 4694a4cc627f11eea33bb35ae8d461a2-20231004
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=LlNrPM4pcUoEAFCZpNaS6OH1Ut1xK46ItLWtRwbGIeU=; 
 b=RBNi9XClayIKlj0Y0F83pZhrlcgFTK3sEq/hR/RHWn8H0b5YlwVtEPLM4cawf2ev4MRLJFljaCfIUuC1KlDakX0bEFZqbe6JEhOVA9lAUARNi3X3YK7iSdpVY/H0PNyOZaoYm/4rWaiEEqwBMJxV9MhGL56vnDjBuAW58UlSMlU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:927a8640-c9dd-4fb3-bb38-5819c8bd835f, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5f78ec9, CLOUDID:0fcbc1c3-1e57-4345-9d31-31ad9818b39f,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 4694a4cc627f11eea33bb35ae8d461a2-20231004
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1228649834; Wed, 04 Oct 2023 14:28:47 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 4 Oct 2023 14:28:44 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Wed, 4 Oct 2023 14:28:44 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oRvlZvO2GHnxJth16oQXGOPL4a3ufRJWuY89xgXeLv+jEfJzMrsIHVzkXiCu7loFxWJ0veqocvmIV8r91kBAaoANDasomvahvOl9ARUSXXBI4qL8rGtG67yijcUPOtn7gQMmWmciXq8LnRWnY4OBItHOeO5jdldfxSSRlpEuk3l+8MtQa7DtfZaAmAdh992yUTjGPw/ZZNVj0oEzXnZjBU2/dqYcRLGlNucizSR9VNIT0q2EzoTsc59V0szd0M5MpduRdND5YazSmpIhhH7Ra123R0KTGqZT5Fwm5cGMI/QvgGHO03ONjv19d8bltRr5G/imxW+B+L/IjDK0kPpb3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yNdbkXJ8QV7mDyOZqeNNJuKJ9dU2uY2ia7UoIP1P/Xw=;
 b=QZurY9zH/hXkaVgxb8JQXPgo8KAAcwSxcPAw2jyuJx0xdaM1licTRcQ2/KoURWDYGDLZZh4tlM0swKIBjgJRRZgBMUiKMVYCBLwNE3l2faiSMcg4mYvCvidywhG5Y8EBQTPBhMQZPewWk5++DG1yIgrYZdBD2t71kw1KPSJbm6pPaiQsyGCuBjZj8WWXvLpwVWkh1tlN6yZY1z52VPCaA2RLarXWAqA6n9P8w1DPRiUpTPLhzwgwOZm2XDnNPLsdoOBhbnYaWP16SnVEyyHk/XWXjuqKS2F1XUcHAABGPBafiu9Dirm7LCv8TV+eHX3RbN81pHhsBlgCMh+XvYcgog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yNdbkXJ8QV7mDyOZqeNNJuKJ9dU2uY2ia7UoIP1P/Xw=;
 b=nih1UzhPB8v1rQFLjUoQlqvDZXm3Ow9F+6oscYRQ+x8cYofSPkPjCq38JwqdOqxvKB/Z07XmUoxpFws9uKUBPoZfwwZDAbNzaEvWourum1ncEPuh55/8UoFs4Tr5wCK6iXZhxJdDr0OyPKVZQgA7eGFX1mVUmpB/6WfwXx1K/c4=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB7444.apcprd03.prod.outlook.com (2603:1096:101:129::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.28; Wed, 4 Oct
 2023 06:28:43 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9c2c:c08a:212f:e984]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9c2c:c08a:212f:e984%7]) with mapi id 15.20.6792.026; Wed, 4 Oct 2023
 06:28:43 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>
Subject: Re: [PATCH v10 15/16] drm/mediatek: gamma: Add kerneldoc for struct
 mtk_disp_gamma
Thread-Topic: [PATCH v10 15/16] drm/mediatek: gamma: Add kerneldoc for struct
 mtk_disp_gamma
Thread-Index: AQHZxqV0yQaRTCXQI0KdBYIPnOL2NrA5ir4A
Date: Wed, 4 Oct 2023 06:28:43 +0000
Message-ID: <8a442154abc2e59896e9829e688140d56201a379.camel@mediatek.com>
References: <20230804072850.89365-1-angelogioacchino.delregno@collabora.com>
 <20230804072850.89365-16-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230804072850.89365-16-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB7444:EE_
x-ms-office365-filtering-correlation-id: 5bf047c9-21cb-4d90-be0c-08dbc4a327eb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NHBuWtCpTYkeYM6DPVxPufKzt/rnC/DKkol6JESt6tzkVLaIqnk6YL2jQBMtCg98FiFJZmaIPIIro7KjoAbJM50RSzxFmxUwdhAoXb5Wko1MAO4N+GhSGbbuuZeDghHQSuEo3jLMK5M5RaGMOW+iQTawnno8RkEF2bc0MJDFk2Pp2iiDB0VGAGt0LbV7eYgySMJ0NUEyBm2Bot9fldQdCpwa/j+bNgX3sELg0SLV7OoCSXSo33OfkqyVk6biMTVA7vLgYKKi5O/maNMMUShBukzp3L7NPGLEiSARM27qO4fxNq7K/LFjVGiGaksyqRZvauBe/iS4ka28OjycCaDH6lK+By+aLucZ1UWWA66cwDCsAFJ99hk8csskjPKh6rmoP04cKLe+2DULAJKDunzlR2nQbBiH/izV28D+sHCYdRfV8SBeEUFyuCewcR7xmQoGTSSKyYV2fBcBE4GulZiMQDcSx5AyQb4PrFdilzDFB0aNjPj+yYkceky7mfIR9a3kSAgPLIwmI7RzI43tbaUP0wWi/SjyAubK0Ddq+OVaQ7g6pj/apvBRkI6uiZnrzbfaZMqiPV0V3akhmOWE3N0ua/dzI9feYpxQd3fzGg6Z60tg/eV8dM5a2o7Hvo3QOK2DPfj6ETWMBNZEl1O8tUwSljbTtWXqIqyeCSVa2DZS6UQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(346002)(366004)(396003)(376002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(6512007)(66476007)(36756003)(26005)(41300700001)(2616005)(66946007)(66556008)(76116006)(85182001)(64756008)(54906003)(110136005)(38100700002)(38070700005)(71200400001)(6486002)(66446008)(478600001)(6506007)(122000001)(316002)(7416002)(2906002)(86362001)(83380400001)(8676002)(4326008)(8936002)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WTUwbFgvanZmRHlBU1NZUFdVTjRhSkJyK2xTOG9qQjJtYmlHdU5qMkdWMXdY?=
 =?utf-8?B?YzZDYUs4TkFoRDVWdUZCdVdTekV2SFg5T0lMeXcwRjRTcDJaQnBud1FxczZR?=
 =?utf-8?B?RVFZN05HUEp3TVZEU2ZzeFQzVEpLazlTUnkrUGNWczFQZTJCZmJRVUFGWTV6?=
 =?utf-8?B?Yi9EU2Y1S2NuMDY4MWxMYS95R0RGZStBYy9USkV2S3cyWkhuYzlEYUVlQ3g2?=
 =?utf-8?B?RXdPNndOWFpnS2JGMkFsVTZTWHR1QVJUeWpzWjJoZm44RDY1R016RENZS1ds?=
 =?utf-8?B?VVl6TEZKNUxrQ0YrKzNtZ0VGZ3UvUGxmVlNwZmZSMTltaVZDS2pxcnFLdVht?=
 =?utf-8?B?dW00WVJ2RmhiU1YzdGNENldxQSt6NTR2RkJob1FHdTgrZUFMZUU5Y3BxcVAy?=
 =?utf-8?B?ZXNFVlozbUV4ZGlwalJGZDB5S243YTRlRXB6YTRTZ1VONVUvOW90WndOZEEy?=
 =?utf-8?B?S1ZpSjBjSHdjUHBWbEd1RzVITmNOZzBlOGZXSzJ4S0c1VURPMFkxck5OWllT?=
 =?utf-8?B?NWkzWVlwZ3JSN2p0MGpEOG9pY2dVeW8rcnZaV0s1clpaYUdNNEI0VzBwLzl5?=
 =?utf-8?B?cVFENkRRSk9aSlpOWWhUSWtWQnZFU3UwT2hUZ01FZlJKbzd1cFVQYzMyWng4?=
 =?utf-8?B?QlU1TkF2WXZCQWhubkczM2tKSFJ5QmJ1SXQ0Y3N5eC9mbC9mNnZzcWg1NzJT?=
 =?utf-8?B?ZDFUZjFXZXVodjU4TDB4c0JUY3pUbWRpQmNJdmZnelJEbEtXcm5BeWtSNXFU?=
 =?utf-8?B?RFBxVGx4dVY2YkhmMlNGL1ZFU2h0T3p3bmdzYzZsYmFxZmFVVDFwQ1FISmpH?=
 =?utf-8?B?TndJWG9xWVV4QjM5MUh6RVNMSDhuR0prays4QmRmMGpRZ3luTkw0Sy9ITzRU?=
 =?utf-8?B?YVBlUFJDZG1qYjExd1FWQlZqMVM5N2JUcE5wbEhicjFpUEh0UTd1Y2E5ekNV?=
 =?utf-8?B?WmxCa3ZBT0hlMHZhVlM5VStoeTlGZnZYNTV3a1dJV3VVL01NTWZEZVZSejF6?=
 =?utf-8?B?WXJ1d0xrYTdBVkVvTXZiUDRXZjFxLy85MDBuYzlPVFVkbENqQmp1Mmt4dTkz?=
 =?utf-8?B?WXIrZFJyblNQSEp4dXg3cnJabUcwTXYwbys2UGtGR1d6bDVwMmpQOC9sRE9T?=
 =?utf-8?B?SzdDVnA2QmxESXNyUTI2aE91WUgydHFLOHFCMTVhdFo1R0tKTG92a1BsVlhK?=
 =?utf-8?B?djM3UlpaMzhiN0REUTBXR0hnNTNIK3dzTGpIdVlSS1VRZmNpYlFOb3VPUnls?=
 =?utf-8?B?NFQxakJMWFUxVm55ZzFGRFpKUXA0czlMNlBWT0hKb1pIcHVSdUR5ay9VZkJM?=
 =?utf-8?B?bkxSMi9tQmtqMDU5Wk5zSW5relJTNDY2UlowNWZIMjJPYkViZmZhWUZ2MHlu?=
 =?utf-8?B?SXZaN3EzdmhEd3duZlUvYzI2bElJWmpuVEVHNjJ2UnBGd2M5RkNvdWxkN2lS?=
 =?utf-8?B?cUFHazdjNzhDQVg1a1Z6VENidm52dlZUR05rUm05MEcwOVkwWXRwMXVHL1JD?=
 =?utf-8?B?cVdkSmQ1REtoN3k5bGZtOUl6Vk9UbFdhTWxLQUVMZ1dSNEMvV0ZudDJoWENp?=
 =?utf-8?B?WG5ZM1FvdEJhMzVib01HaVFCcU9hSXAwSmdyTU5sbE00Q0g4T0tIR0JjSmlX?=
 =?utf-8?B?SmxCZmlGVk5iQ3BOaVNoYURyUVNMc1BHcm52N2U2clBTYjFWVjM0Qitia3I3?=
 =?utf-8?B?N2pzU1JmV0N4TFJkdlo4WUViUVZINWlWVTJ6dUg2TDd6Vnl4RU95M0dwRFQz?=
 =?utf-8?B?aXI3MU10ajAzQ2F5RnJlNHgvOGRJcTVmMCs0S3p1Ykt1L1ZMc3RZYVM5dTg5?=
 =?utf-8?B?MEZUL2lVS0s0Q2hGYXJKTEFVY1JzTE8ycURudTNWVkRmbit0cjN0Q2svaGsz?=
 =?utf-8?B?bDJoTDBoUlk1YitsRG83SXkxRWIrQXpUL2U3SmZiVnZwTWtFVUpVY3lpUGZU?=
 =?utf-8?B?M1RLU2hkVnV1Nmx0UlN3anVVdmlnQUVJcXpXa2F4bzJQOVhxWTgvY3ZtS3dD?=
 =?utf-8?B?ejMzTngrVkM0MHlrdjF0MWNEKzRjaDdhaDB3bzRHbCtqOTF5by81dDlBelFD?=
 =?utf-8?B?WkJGMStGRmNWZFhUeGFlU0xiNHRmdzhFTm9EY3l3MHVCa1kvd1FUM1VZMSt4?=
 =?utf-8?Q?fk27rP1FQZV8CXMFKV+MUVSsO?=
Content-ID: <B4F363669235DE4C8FCFA0A3912EFA96@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bf047c9-21cb-4d90-be0c-08dbc4a327eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2023 06:28:43.1110 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DPfrX+BOaVrexbEcAiK8sWk8PL6SnOb5YUQEKhR4GlN6W8JI2dL6lFcmB1KpWP6iQVnKUNcE8SVliYRt6OuCEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7444
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--11.699800-8.000000
X-TMASE-MatchedRID: fgYTp5XatxYNtKv7cnNXnSa1MaKuob8PC/ExpXrHizxcKZwALwMGs3LM
 RSx26gTiE/inge20YcFxec6bnKstogDNPxu11HXjbc297PAGtWY9mZudjaoMiZsoi2XrUn/J+ZL
 5o+vRV7yhMIDkR/KfwI2j49Ftap9EOwBXM346/+w7YX4KEf9blR63Iwd9mv1FCugoBWj5UHzwo3
 7Eq1yEfM2nZUPF6j64
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--11.699800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: F271091694363EE810DFDFB72DAA0B2A2E6B794BBC15C8B2B1D15A6CA8E208892000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_005_13832418.796806127"
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ehristev@collabora.com" <ehristev@collabora.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "wenst@chromium.org" <wenst@chromium.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_005_13832418.796806127
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpLCYjMzI7QW5nZWxvOg0KDQpPbiYjMzI7RnJpLCYjMzI7MjAyMy0wOC0wNCYjMzI7
YXQmIzMyOzA5OjI4JiMzMjsrMDIwMCwmIzMyO0FuZ2Vsb0dpb2FjY2hpbm8mIzMyO0RlbCYjMzI7
UmVnbm8mIzMyO3dyb3RlOg0KJmd0OyYjMzI7VGhlJiMzMjttdGtfZGlzcF9nYW1tYSYjMzI7c3Ry
dWN0dXJlJiMzMjt3YXMmIzMyO2NvbXBsZXRlbHkmIzMyO3VuZG9jdW1lbnRlZDomIzMyO2FkZCYj
MzI7c29tZQ0KJmd0OyYjMzI7a2VybmVsZG9jJiMzMjtkb2N1bWVudGF0aW9uJiMzMjt0byYjMzI7
aXQuDQoNClJldmlld2VkLWJ5OiYjMzI7Q0smIzMyO0h1JiMzMjsmbHQ7Y2suaHVAbWVkaWF0ZWsu
Y29tJmd0Ow0KDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtBbmdlbG9H
aW9hY2NoaW5vJiMzMjtEZWwmIzMyO1JlZ25vJiMzMjsmbHQ7DQomZ3Q7JiMzMjthbmdlbG9naW9h
Y2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20mZ3Q7DQomZ3Q7JiMzMjstLS0NCiZndDsmIzMy
OyYjMzI7ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX2dhbW1hLmMmIzMyO3wmIzMy
OzgmIzMyOysrKysrKy0tDQomZ3Q7JiMzMjsmIzMyOzEmIzMyO2ZpbGUmIzMyO2NoYW5nZWQsJiMz
Mjs2JiMzMjtpbnNlcnRpb25zKCspLCYjMzI7MiYjMzI7ZGVsZXRpb25zKC0pDQomZ3Q7JiMzMjsN
CiZndDsmIzMyO2RpZmYmIzMyOy0tZ2l0JiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZGlzcF9nYW1tYS5jDQomZ3Q7JiMzMjtiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZGlzcF9nYW1tYS5jDQomZ3Q7JiMzMjtpbmRleCYjMzI7ZDlhNzAyMzhkNTI0Li44Njc0NDVhMmFm
OWUmIzMyOzEwMDY0NA0KJmd0OyYjMzI7LS0tJiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZGlzcF9nYW1tYS5jDQomZ3Q7JiMzMjsrKysmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kaXNwX2dhbW1hLmMNCiZndDsmIzMyO0BAJiMzMjstNTQsOCYjMzI7KzU0LDEy
JiMzMjtAQCYjMzI7c3RydWN0JiMzMjttdGtfZGlzcF9nYW1tYV9kYXRhJiMzMjt7DQomZ3Q7JiMz
MjsmIzMyO3U4JiMzMjtsdXRfYml0czsNCiZndDsmIzMyOyYjMzI7fTsNCiZndDsmIzMyOyYjMzI7
DQomZ3Q7JiMzMjstLyoNCiZndDsmIzMyOy0mIzMyOyomIzMyO3N0cnVjdCYjMzI7bXRrX2Rpc3Bf
Z2FtbWEmIzMyOy0mIzMyO0RJU1BfR0FNTUEmIzMyO2RyaXZlciYjMzI7c3RydWN0dXJlDQomZ3Q7
JiMzMjsrLyoqDQomZ3Q7JiMzMjsrJiMzMjsqJiMzMjtzdHJ1Y3QmIzMyO210a19kaXNwX2dhbW1h
JiMzMjstJiMzMjtEaXNwbGF5JiMzMjtHYW1tYSYjMzI7ZHJpdmVyJiMzMjtzdHJ1Y3R1cmUNCiZn
dDsmIzMyOysmIzMyOyomIzMyO0BjbGs6JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7Y2xv
Y2smIzMyO2ZvciYjMzI7RElTUF9HQU1NQSYjMzI7YmxvY2sNCiZndDsmIzMyOysmIzMyOyomIzMy
O0ByZWdzOiYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtNTUlPJiMzMjtyZWdpc3RlcnMmIzMyO2Jh
c2UNCiZndDsmIzMyOysmIzMyOyomIzMyO0BjbWRxX3JlZzomIzMyO0NNRFEmIzMyO0NsaWVudCYj
MzI7cmVnaXN0ZXINCiZndDsmIzMyOysmIzMyOyomIzMyO0BkYXRhOiYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjtwbGF0Zm9ybSYjMzI7ZGF0YSYjMzI7Zm9yJiMzMjtESVNQX0dBTU1BDQomZ3Q7JiMz
MjsmIzMyOyYjMzI7Ki8NCiZndDsmIzMyOyYjMzI7c3RydWN0JiMzMjttdGtfZGlzcF9nYW1tYSYj
MzI7ew0KJmd0OyYjMzI7JiMzMjtzdHJ1Y3QmIzMyO2NsayYjMzI7KmNsazsNCg0KPC9wcmU+PCEt
LXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVu
dGlhbGl0eSBOb3RpY2UNCiAqKioqKioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNv
bnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVu
dHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhl
cndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBp
cyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBp
ZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcs
IHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0
YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0
ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNp
cGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUNCiANCnRoYXQgeW91IGhhdmUgcmVjZWl2
ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVk
aWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBj
b3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5
b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1h
aWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_005_13832418.796806127
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEFuZ2VsbzoNCg0KT24gRnJpLCAyMDIzLTA4LTA0IGF0IDA5OjI4ICswMjAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gVGhlIG10a19kaXNwX2dhbW1hIHN0cnVjdHVy
ZSB3YXMgY29tcGxldGVseSB1bmRvY3VtZW50ZWQ6IGFkZCBzb21lDQo+IGtlcm5lbGRvYyBkb2N1
bWVudGF0aW9uIHRvIGl0Lg0KDQpSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNv
bT4NCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPA0K
PiBhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+DQo+IC0tLQ0KPiAgZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX2dhbW1hLmMgfCA4ICsrKysrKy0tDQo+ICAx
IGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9nYW1tYS5jDQo+IGIv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX2dhbW1hLmMNCj4gaW5kZXggZDlhNzAy
MzhkNTI0Li44Njc0NDVhMmFmOWUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZGlzcF9nYW1tYS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZGlzcF9nYW1tYS5jDQo+IEBAIC01NCw4ICs1NCwxMiBAQCBzdHJ1Y3QgbXRrX2Rpc3BfZ2Ft
bWFfZGF0YSB7DQo+ICAJdTggbHV0X2JpdHM7DQo+ICB9Ow0KPiAgDQo+IC0vKg0KPiAtICogc3Ry
dWN0IG10a19kaXNwX2dhbW1hIC0gRElTUF9HQU1NQSBkcml2ZXIgc3RydWN0dXJlDQo+ICsvKioN
Cj4gKyAqIHN0cnVjdCBtdGtfZGlzcF9nYW1tYSAtIERpc3BsYXkgR2FtbWEgZHJpdmVyIHN0cnVj
dHVyZQ0KPiArICogQGNsazogICAgICBjbG9jayBmb3IgRElTUF9HQU1NQSBibG9jaw0KPiArICog
QHJlZ3M6ICAgICBNTUlPIHJlZ2lzdGVycyBiYXNlDQo+ICsgKiBAY21kcV9yZWc6IENNRFEgQ2xp
ZW50IHJlZ2lzdGVyDQo+ICsgKiBAZGF0YTogICAgIHBsYXRmb3JtIGRhdGEgZm9yIERJU1BfR0FN
TUENCj4gICAqLw0KPiAgc3RydWN0IG10a19kaXNwX2dhbW1hIHsNCj4gIAlzdHJ1Y3QgY2xrICpj
bGs7DQo=

--__=_Part_Boundary_005_13832418.796806127--

