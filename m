Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B08F7A45D6
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 11:25:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2691D10E07A;
	Mon, 18 Sep 2023 09:25:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7843C10E243
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 09:25:36 +0000 (UTC)
X-UUID: 4fab43da560511eea33bb35ae8d461a2-20230918
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=+umleEusi6Kb+SYzPBW9wE3kSJ9hMkSMDGULSLII06w=; 
 b=NFAOaIlwjG0FVJYykK2P23hgPW8tvE/MR8E5nJOIKFEobYb5ISWin7fvtYXc9bgr9yN0UW4vxMlmSdBWvOnRu9En9A0sdkQ3FRywk30jCw/TcjAY/1etjQrFe+qW8m5k7b7RBZtcK5TYmD5ZR5yBsgFon9P0OhtH8x9mokNJ57o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31, REQID:162f0a45-ffda-4b1a-8e86-bd5ff007eb4c, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:0ad78a4, CLOUDID:9ed827c3-1e57-4345-9d31-31ad9818b39f,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4fab43da560511eea33bb35ae8d461a2-20230918
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2105696782; Mon, 18 Sep 2023 17:25:30 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 18 Sep 2023 17:25:29 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Mon, 18 Sep 2023 17:25:29 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n9Dy+TBz1cSy5wTZXHTvIjTzMYaVqhd1DJR5CasOuJDp63UkxqGPOoQkipScbDzQp1kp0svqNz/J0jDqaHcGcO78qTfgPyzooOQdgEdJYK6wfrcSQ4mBHzRM54yALHsKxruAWSJmkyn5YeEBeQe7vQYyZAPSafWFFi+UYDiJI34w2iMtPOLvmr/5uVBQwFCIge4+XjBgQDxgZ5WBEQM8G61abVBDMzPv7hqiyN8a0vm8nWxZ99DcqEowz/ZxEjCNFw3de8EY3UAEsz2RAtpo9DU+svwlUV/VBdvctfltZpnb8Hs+6XThEDqqwQVD8yTEnY7/buU+g3xMpwQsiPrHBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pzfZTUanIfnGNAovIEVrKv/gBkq5bPK/7nqMuIgHTz0=;
 b=HeWScu/zw29HGeREZYQ+obf/WvfZAuJZUcc5ESIZu4sAzyr1yu1gxmEaB4wL0rJ8MpNRn3o5dxdGiD1L+qN9CWT1DeagFazJamG7+Bzx4tM5W50RyNZQx/mLof0TIgQYTK7DLwxmr5nO26x8ihbp1t9HfYTTVoTuqzB5R6QvLIR4FVE/pRBAyFtO/q0kFWEsg489FLIHOERtDKK1BUWyiytd/3yr1cuYoaGRdT+qlo8He1vz9TTS4XcfwfZYsrhwNOXxJzGMpkbrHkcZj6d3ZF3XVcM0aCqpXUF/ML1l2rLeyJQq5U3XAb55KMHBpYIaJmrfRjeYxjXyNqzwbz+csg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pzfZTUanIfnGNAovIEVrKv/gBkq5bPK/7nqMuIgHTz0=;
 b=IwsxAQUrXW5tYIPKo972I1v6SUiZYQha6stzyK3MX4RPcYhUl6n0RZ+xoCqgp8VKl+RNvcSqQ96VLTsj+kEjRMOTK/eCDh+g/dD3/Fy66qHLP0KLpQaiLwz/2hARzrB+3jLUtCzVOBxDJzxsxUzbuBSUir8Y5pvWs3i8LSD14VU=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB7915.apcprd03.prod.outlook.com (2603:1096:101:187::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.24; Mon, 18 Sep
 2023 09:25:27 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9c2c:c08a:212f:e984]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9c2c:c08a:212f:e984%6]) with mapi id 15.20.6792.022; Mon, 18 Sep 2023
 09:25:27 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>
Subject: Re: [PATCH v2 06/11] drm/mediatek: Support alpha blending in display
 driver
Thread-Topic: [PATCH v2 06/11] drm/mediatek: Support alpha blending in display
 driver
Thread-Index: AQHZ6gwiF9lkCQP7EEen77wiynwUj7AgUAUA
Date: Mon, 18 Sep 2023 09:25:27 +0000
Message-ID: <a8b238c575564af364c07e31556d5b1f7f9d162f.camel@mediatek.com>
References: <20230918084207.23604-1-shawn.sung@mediatek.com>
 <20230918084207.23604-7-shawn.sung@mediatek.com>
In-Reply-To: <20230918084207.23604-7-shawn.sung@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB7915:EE_
x-ms-office365-filtering-correlation-id: 784f50a7-d0b1-4ccc-a0c0-08dbb82931b8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: v968JVVuR5CiOdULNwJkj1Rugg5fSRq4/cdLAhqrRzJ9znkwghX4e4I5rmdY6HHWnzRlDp4FDmquOgUsUM63n8x7TZWQKBxCTYww25r3ewVDnoEm5B9kaW5AIw1sPdORkk3NLlpEymbS6cKpcnh8oBTbc5XsStjLNXhclzzHoTAcDpv0aj/KrS6N8FebOMC04KBZ5hESMEi0iJ/9nIsFHFWPlEylKMHtEjSUSYSrBxsW5Ly9y6v/iXxrgOr1RGv0eh6MbH8fOgU30Los/BgDhULYNHkEQDB272ZMu/qfGbMIEAUvCzZ0tgeTovfBESRBbAsgnzGsl3N3a211YjimFdsMfwo4zqbgzcguGP6deCyzD43Qh3GxeZWUfH0mhjKLtUkX0dOmbnybD9qwPWnqaWxrn0YC3fHqPSxJo6ghEsMnsA+HNtabcDu0ccCGJF3s34OSbRBz7wtSyUGwdqySglP8F+zjkyTOgabq2EOTOCyHoP8pKTnRCZcXugZkbWFMh5Mm6xj7TnPMguaUmO9LiF4LvUZYssQG5nef9q+fC0TUN6MX8UAt7WqEGV2dF7HgbSIhjs9TfHAQkrBMiuYcw4ngzhkHRvW6onWWpcRXfTH92msvS4OsZT6YR/jQnZUa3eCa3JjYTbebicFy9dhpCASXK1RTWpUWkkvkxbr7P6o=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(366004)(136003)(346002)(39860400002)(1800799009)(451199024)(186009)(7416002)(2906002)(8676002)(4326008)(8936002)(5660300002)(41300700001)(66446008)(54906003)(64756008)(66556008)(66476007)(76116006)(316002)(110136005)(66946007)(478600001)(122000001)(36756003)(6486002)(6506007)(6512007)(85182001)(26005)(2616005)(71200400001)(38070700005)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UldjWmJxbUZPVDJ6Um5ocjlqUnRJaG11Q3VhY0hqcFFaYTJtaFdCaWVGajc5?=
 =?utf-8?B?eGU3a0pYbUU1Tm9JOUREZjBOdFp2bVhUckg4Ty9hK1pneUJ2TElWNDgxY1dG?=
 =?utf-8?B?c2NDc1BNeWxueFRsR2w1aThtNnlEZk1iWDJNWkwrK1hDaDlrL0I0TlJQSnht?=
 =?utf-8?B?S0VwQjhVL21HUUFRZzdLUW1Ld1djY293dHVTTDQ1UVk1TjEvbVR2VDRjUENk?=
 =?utf-8?B?UHIxYU05Y1JkelRCeXpZcDRFR09xY093Y0hlNGRxcU1iaks4Q0I1T2ZSWkdh?=
 =?utf-8?B?VXl3bkpKellTNWhyTTJ1c1dLZGVzbi9jWTJNTG1wTlZJTjlGNkVtbllOb3Z2?=
 =?utf-8?B?N01NSDBmZ09EOXV3bkpTQURZUFViaktkWmdGd0I3VHBxZFBiV0hhcDFXV1Na?=
 =?utf-8?B?ZTRMTEd1WXBUckJpa2VMSU5VN2ZGaUxoQjREOTRTSXU2cWVVZHNWSStoUC9P?=
 =?utf-8?B?aExoakY1MUlIeHRhTHlPQkxsMk5OTWFpZVNFV1JuU2w1bGpmMEhaR2hjaVAw?=
 =?utf-8?B?UncxQ2M2eHV5Vzk0aUIzbmNHVVczbWZWcm5UYWJod1RCd1pCQ3VrM3VweVFC?=
 =?utf-8?B?ZGE1by8xMGhmWG5hd1NURzlFR2ZMVHlLR3JwLzdoTE5JWC9HaU9IbmMvelR5?=
 =?utf-8?B?L1RySjloaHZEZFVTRlNkM0V4Mi9XbUNDZGIwM0lGSGNnWUlrZXZtT1F1dzdL?=
 =?utf-8?B?anA4Z1RrcGl3YUFhZVMzb3lCejVNQU1Hd0ZVMnd0dFNNeHJuUjJnVW8zY3pj?=
 =?utf-8?B?N2ZGYVFSTjdKS3lvekQ0cEZtRCs5dlJTVUw0UFpIYXNnNEN6MHpKSExWWXlz?=
 =?utf-8?B?dUZ5eGpwQkhuMXczWVVuSzlWOGk0eldNd2NDcUovWjlIeUdxQnQ3ZWVPZ0xH?=
 =?utf-8?B?QmNqRmdwbjJ5Vml0eFpDS1FSUWhxd0dJK2NsQjVtdGYrazVIcEtLUktIazVh?=
 =?utf-8?B?NlVtSGUrYjN2SW04bEU3K2R0QjBqMTFGVTlwaC9hV3RSYjE5dTRqMTh1ZG9T?=
 =?utf-8?B?VlhSYTBreGl0Sy9UTCtwM3RyaXhCWUhsY21iWnljZ3hONVNuSTdvWmNod1R3?=
 =?utf-8?B?YVg3bk5QdWlOWldVTlBtMlhvWnV3WFdxN3JUVEV2OG1LM2I1Nmp4cmh3RjFD?=
 =?utf-8?B?SVdTT0pBRmtkQ2Y1dFBQTjlhaUVQclFGeDBVbEFIUHdkNjJCbEUxLzd1WmtQ?=
 =?utf-8?B?b0FCeCtFSjhHbWlZU1l3Z1NYQVMxMjBWSnUxc3J5VHpyM1RHeWhmeHVRS0Z4?=
 =?utf-8?B?Nld4dXpQc1RRamZrTTQxSy90Q3hHMzhOZitNOFRRc0JoN3NBM3hBVGxJNTJm?=
 =?utf-8?B?NHpsSlFycldoOWppalVqNUNiUTExK1hsTUdTTHhzNkR4alNENThPZndsOHVv?=
 =?utf-8?B?dENDeFZmZXhoOGJYSmllV0VZOXpOTVY3bmNpZEdsMWFEUkMyU3ZoQWFLZEl3?=
 =?utf-8?B?SDdkVWJjSlIwc0JiMnY1eDVsNXhSclBpZFpUMFdpbStZSHZ0SWdmQmd1Qmts?=
 =?utf-8?B?UEkzd21wWjVLWGlLc3UrZUhOUDFyTE1icVBiblhKckY2T2FaU3ZPaEhXUXB5?=
 =?utf-8?B?bStTTHlZZ0w2czNEdEtpQk5xSk9Id3pkeVJyU0I0bFhjMWZBYVdNcS8xdGFv?=
 =?utf-8?B?ZFJuQjFsVEVVTnk2aENxN2I5RmxHYkpCeWtaLzFlQWFPenRxcTRrQXlMZk03?=
 =?utf-8?B?aDlDMG94N1l3N0d6dW1SczlNakdDbXFTYWhDbmJGTlBETXEvcHVEK3JzS214?=
 =?utf-8?B?SzYwckdFZnJ5dk0zSGxHZXFUdFlGaHVIL2RNbUpSamVaVk5ickFxZ1N5Rzh4?=
 =?utf-8?B?NjBVdjJpdUt3SDBvL0Z0dndpSVV6Q1JQaWU4dlZtT1JNbVdXSTNMUVhCOG0y?=
 =?utf-8?B?T2h6c0pnVmEzdXFWc25Cdk16NE50OFM3aWprWU9FTVBxeFF5R2lRYWRLRm5r?=
 =?utf-8?B?QXR4bDg0UVY3d3JnU2lMK3JvL1VOZFpzbkxKQXdVN3NkU3R4Q0lyYWNhdXRW?=
 =?utf-8?B?R1dTdHJyK01ENldRSnJlRjZVUXhzNEZyTWh4dUd6bHppVWt1ZGsvUFdUVkhD?=
 =?utf-8?B?bWRuYzR6aTVDcWhGZGoxRnNzeXc4Y1dQTENWREl1NjE5dWpHVTFGWjVtMXBh?=
 =?utf-8?B?ZW0vWU81Um5oSEJzaWw1RjBhSTVxVmFTQjFKZ0hqZkYzSWhUUStpZkkreEI2?=
 =?utf-8?B?YVE9PQ==?=
Content-ID: <0AD14ED4BA12FB46B096F2B11392840B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 784f50a7-d0b1-4ccc-a0c0-08dbb82931b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2023 09:25:27.0332 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /bBv4YTLBmjkhuwB7zPEDebfoBAVZdDoL7WryFRnuf/Uh33mgTZ324mOnigI+JqreXtKgYeoLoVk4qcpImhVyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7915
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_002_270781355.1947044098"
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "wenst@chromium.org" <wenst@chromium.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_002_270781355.1947044098
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpLCYjMzI7SHNpYW8tY2hpZW46DQoNCk9uJiMzMjtNb24sJiMzMjsyMDIzLTA5LTE4
JiMzMjthdCYjMzI7MTY6NDImIzMyOyswODAwLCYjMzI7SHNpYW8mIzMyO0NoaWVuJiMzMjtTdW5n
JiMzMjt3cm90ZToNCiZndDsmIzMyO1N1cHBvcnQmIzMyO2FscGhhJiMzMjtibGVuZGluZyYjMzI7
YnkmIzMyO2FkZGluZyYjMzI7Y29ycmVjdCYjMzI7YmxlbmQmIzMyO21vZGUmIzMyO2FuZA0KJmd0
OyYjMzI7YWxwaGEmIzMyO3Byb3BlcnR5JiMzMjtpbiYjMzI7cGxhbmUmIzMyO2luaXRpYWxpemF0
aW9uLg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtSZXZpZXdlZC1ieTomIzMyO0FuZ2Vsb0dpb2FjY2hp
bm8mIzMyO0RlbCYjMzI7UmVnbm8mIzMyOyZsdDsNCiZndDsmIzMyO2FuZ2Vsb2dpb2FjY2hpbm8u
ZGVscmVnbm9AY29sbGFib3JhLmNvbSZndDsNCiZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtI
c2lhbyYjMzI7Q2hpZW4mIzMyO1N1bmcmIzMyOyZsdDtzaGF3bi5zdW5nQG1lZGlhdGVrLmNvbSZn
dDsNCiZndDsmIzMyOy0tLQ0KJmd0OyYjMzI7JiMzMjtkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RybV9wbGFuZS5jJiMzMjt8JiMzMjsxMSYjMzI7KysrKysrKysrKysNCiZndDsmIzMyOyYj
MzI7MSYjMzI7ZmlsZSYjMzI7Y2hhbmdlZCwmIzMyOzExJiMzMjtpbnNlcnRpb25zKCspDQomZ3Q7
JiMzMjsNCiZndDsmIzMyO2RpZmYmIzMyOy0tZ2l0JiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHJtX3BsYW5lLmMNCiZndDsmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kcm1fcGxhbmUuYw0KJmd0OyYjMzI7aW5kZXgmIzMyO2RiMmY3MGFlMDYwZC4uZjg3Y2Y1
NmZiODQ2JiMzMjsxMDA2NDQNCiZndDsmIzMyOy0tLSYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RybV9wbGFuZS5jDQomZ3Q7JiMzMjsrKysmIzMyO2IvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kcm1fcGxhbmUuYw0KJmd0OyYjMzI7QEAmIzMyOy0zMDEsNiYjMzI7KzMw
MSw5JiMzMjtAQCYjMzI7aW50JiMzMjttdGtfcGxhbmVfaW5pdChzdHJ1Y3QmIzMyO2RybV9kZXZp
Y2UmIzMyOypkZXYsJiMzMjtzdHJ1Y3QNCiZndDsmIzMyO2RybV9wbGFuZSYjMzI7KnBsYW5lLA0K
Jmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtzaXplX3QmIzMyO251bV9mb3JtYXRzKQ0KJmd0
OyYjMzI7JiMzMjt7DQomZ3Q7JiMzMjsmIzMyO2ludCYjMzI7ZXJyOw0KJmd0OyYjMzI7K3UzMiYj
MzI7YmxlbmRfbW9kZSYjMzI7PSYjMzI7QklUKERSTV9NT0RFX0JMRU5EX1BJWEVMX05PTkUpJiMz
Mjt8DQomZ3Q7JiMzMjsrJiMzMjtCSVQoRFJNX01PREVfQkxFTkRfUFJFTVVMVEkpJiMzMjsmIzMy
OyYjMzI7fA0KJmd0OyYjMzI7KyYjMzI7QklUKERSTV9NT0RFX0JMRU5EX0NPVkVSQUdFKTsNCiZn
dDsmIzMyOyYjMzI7DQomZ3Q7JiMzMjsmIzMyO2lmJiMzMjsoIWZvcm1hdHMmIzMyO3x8JiMzMjsh
bnVtX2Zvcm1hdHMpJiMzMjt7DQomZ3Q7JiMzMjsmIzMyO0RSTV9FUlJPUigmcXVvdDtubyYjMzI7
Zm9ybWF0cyYjMzI7Zm9yJiMzMjtwbGFuZSYjOTI7biZxdW90Oyk7DQomZ3Q7JiMzMjtAQCYjMzI7
LTMyMyw2JiMzMjsrMzI2LDE0JiMzMjtAQCYjMzI7aW50JiMzMjttdGtfcGxhbmVfaW5pdChzdHJ1
Y3QmIzMyO2RybV9kZXZpY2UmIzMyOypkZXYsDQomZ3Q7JiMzMjtzdHJ1Y3QmIzMyO2RybV9wbGFu
ZSYjMzI7KnBsYW5lLA0KJmd0OyYjMzI7JiMzMjtEUk1fSU5GTygmcXVvdDtDcmVhdGUmIzMyO3Jv
dGF0aW9uJiMzMjtwcm9wZXJ0eSYjMzI7ZmFpbGVkJiM5MjtuJnF1b3Q7KTsNCiZndDsmIzMyOyYj
MzI7fQ0KJmd0OyYjMzI7JiMzMjsNCiZndDsmIzMyOytlcnImIzMyOz0mIzMyO2RybV9wbGFuZV9j
cmVhdGVfYWxwaGFfcHJvcGVydHkocGxhbmUpOw0KJmd0OyYjMzI7K2lmJiMzMjsoZXJyKQ0KJmd0
OyYjMzI7K0RSTV9FUlJPUigmcXVvdDtmYWlsZWQmIzMyO3RvJiMzMjtjcmVhdGUmIzMyO3Byb3Bl
cnR5OiYjMzI7YWxwaGEmIzkyO24mcXVvdDspOw0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7K2VyciYj
MzI7PSYjMzI7ZHJtX3BsYW5lX2NyZWF0ZV9ibGVuZF9tb2RlX3Byb3BlcnR5KHBsYW5lLCYjMzI7
YmxlbmRfbW9kZSk7DQomZ3Q7JiMzMjsraWYmIzMyOyhlcnIpDQomZ3Q7JiMzMjsrRFJNX0VSUk9S
KCZxdW90O2ZhaWxlZCYjMzI7dG8mIzMyO2NyZWF0ZSYjMzI7cHJvcGVydHk6JiMzMjtibGVuZF9t
b2RlJiM5MjtuJnF1b3Q7KTsNCg0KRG8mIzMyO25vdCYjMzI7YWx3YXlzJiMzMjtlbmFibGUmIzMy
O2FscGhhJiMzMjtmdW5jdGlvbi4mIzMyO0VuYWJsZSYjMzI7aXQmIzMyO2RlcGVuZCYjMzI7b24m
IzMyO2hhcmR3YXJlDQpjYXBhYmlsaXR5Lg0KDQpSZWdhcmRzLA0KQ0sNCg0KJmd0OyYjMzI7Kw0K
Jmd0OyYjMzI7JiMzMjtkcm1fcGxhbmVfaGVscGVyX2FkZChwbGFuZSwmIzMyOyZhbXA7bXRrX3Bs
YW5lX2hlbHBlcl9mdW5jcyk7DQomZ3Q7JiMzMjsmIzMyOw0KJmd0OyYjMzI7JiMzMjtyZXR1cm4m
IzMyOzA7DQoNCjwvcHJlPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxwcmU+KioqKioqKioqKioq
KiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlICoqKioqKioqKioqKioqKioqKioqDQpU
aGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGlu
ZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHBy
aXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBs
aWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUg
ZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJp
YnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGlu
Y2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMg
c3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90
IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZSANCnRoYXQg
eW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhl
IHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0
ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRh
Y2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRl
bnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+
PCEtLX0tLT4=

--__=_Part_Boundary_002_270781355.1947044098
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEhzaWFvLWNoaWVuOg0KDQpPbiBNb24sIDIwMjMtMDktMTggYXQgMTY6NDIgKzA4MDAsIEhz
aWFvIENoaWVuIFN1bmcgd3JvdGU6DQo+IFN1cHBvcnQgYWxwaGEgYmxlbmRpbmcgYnkgYWRkaW5n
IGNvcnJlY3QgYmxlbmQgbW9kZSBhbmQNCj4gYWxwaGEgcHJvcGVydHkgaW4gcGxhbmUgaW5pdGlh
bGl6YXRpb24uDQo+IA0KPiBSZXZpZXdlZC1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8g
PA0KPiBhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+DQo+IFNpZ25lZC1v
ZmYtYnk6IEhzaWFvIENoaWVuIFN1bmcgPHNoYXduLnN1bmdAbWVkaWF0ZWsuY29tPg0KPiAtLS0N
Cj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX3BsYW5lLmMgfCAxMSArKysrKysr
KysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9wbGFuZS5jDQo+IGIvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fcGxhbmUuYw0KPiBpbmRleCBkYjJmNzBhZTA2MGQu
LmY4N2NmNTZmYjg0NiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcm1fcGxhbmUuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9w
bGFuZS5jDQo+IEBAIC0zMDEsNiArMzAxLDkgQEAgaW50IG10a19wbGFuZV9pbml0KHN0cnVjdCBk
cm1fZGV2aWNlICpkZXYsIHN0cnVjdA0KPiBkcm1fcGxhbmUgKnBsYW5lLA0KPiAgCQkgICBzaXpl
X3QgbnVtX2Zvcm1hdHMpDQo+ICB7DQo+ICAJaW50IGVycjsNCj4gKwl1MzIgYmxlbmRfbW9kZSA9
IEJJVChEUk1fTU9ERV9CTEVORF9QSVhFTF9OT05FKSB8DQo+ICsJCQkgQklUKERSTV9NT0RFX0JM
RU5EX1BSRU1VTFRJKSAgIHwNCj4gKwkJCSBCSVQoRFJNX01PREVfQkxFTkRfQ09WRVJBR0UpOw0K
PiAgDQo+ICAJaWYgKCFmb3JtYXRzIHx8ICFudW1fZm9ybWF0cykgew0KPiAgCQlEUk1fRVJST1Io
Im5vIGZvcm1hdHMgZm9yIHBsYW5lXG4iKTsNCj4gQEAgLTMyMyw2ICszMjYsMTQgQEAgaW50IG10
a19wbGFuZV9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsDQo+IHN0cnVjdCBkcm1fcGxhbmUg
KnBsYW5lLA0KPiAgCQkJRFJNX0lORk8oIkNyZWF0ZSByb3RhdGlvbiBwcm9wZXJ0eSBmYWlsZWRc
biIpOw0KPiAgCX0NCj4gIA0KPiArCWVyciA9IGRybV9wbGFuZV9jcmVhdGVfYWxwaGFfcHJvcGVy
dHkocGxhbmUpOw0KPiArCWlmIChlcnIpDQo+ICsJCURSTV9FUlJPUigiZmFpbGVkIHRvIGNyZWF0
ZSBwcm9wZXJ0eTogYWxwaGFcbiIpOw0KPiArDQo+ICsJZXJyID0gZHJtX3BsYW5lX2NyZWF0ZV9i
bGVuZF9tb2RlX3Byb3BlcnR5KHBsYW5lLCBibGVuZF9tb2RlKTsNCj4gKwlpZiAoZXJyKQ0KPiAr
CQlEUk1fRVJST1IoImZhaWxlZCB0byBjcmVhdGUgcHJvcGVydHk6IGJsZW5kX21vZGVcbiIpOw0K
DQpEbyBub3QgYWx3YXlzIGVuYWJsZSBhbHBoYSBmdW5jdGlvbi4gRW5hYmxlIGl0IGRlcGVuZCBv
biBoYXJkd2FyZQ0KY2FwYWJpbGl0eS4NCg0KUmVnYXJkcywNCkNLDQoNCj4gKw0KPiAgCWRybV9w
bGFuZV9oZWxwZXJfYWRkKHBsYW5lLCAmbXRrX3BsYW5lX2hlbHBlcl9mdW5jcyk7DQo+ICANCj4g
IAlyZXR1cm4gMDsNCg==

--__=_Part_Boundary_002_270781355.1947044098--

