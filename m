Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 958177A5A49
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 09:00:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FA5D10E346;
	Tue, 19 Sep 2023 06:59:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5849610E116
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 06:43:23 +0000 (UTC)
X-UUID: d0819d0856b711ee8051498923ad61e6-20230919
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=Wv6Nv/9Dybjw9i9otCYZr0PU6K97PPSbiy+XNQtJ1Ww=; 
 b=msqWoaWRPRu0QvJYWxCjoIH8x0rfWI9OtjW0D9d8qFYBcXumFutTBBqJEUNkJMC8OPwd4882S3sB4i/bE6/Aajv4iei1uSQDKPP9k5CHMpkstoIboWcm3YoZP7SV5KZAkSbwUDqgtHFYbbu1o0R22BfAZbmDHRwzoLiw39fZYy0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:13ee0706-5aad-4f24-aedd-466837c3bbac, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5f78ec9, CLOUDID:5eca00bf-14cc-44ca-b657-2d2783296e72,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-UUID: d0819d0856b711ee8051498923ad61e6-20230919
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <moudy.ho@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1318247870; Tue, 19 Sep 2023 14:43:17 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 19 Sep 2023 14:43:16 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Tue, 19 Sep 2023 14:43:15 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Miy+yUk5cDRPyQrsE0D+To5Tq5qHnZoIFkahthns18nQoUPpWeaa7Aon4V+lnboxhwDt3iyind3W4Z32hsFj3srXf28Sw7xEF6RUGwzXOc9Txjxph6e9fsTO8VZHapABjomcyAmC4KRJ9NwUYCoe63TtrDQmw8vldoaPpb/Zp+5wdCZbx/X6qA7AdMS8MZ2YCLPmtUYx4Bw9LGfOyzuUSELbDWthvQi2Ix2CzXXAFqD+y79pB7htLXLHVAqWHFbWYaRJXmJEVcL64TXOaNaB4Pf1ZbjWGOTki/Uaq7q6vELYmPYI652Dphio9W8rohkVM4gLTDRt6JYmMou87trVhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wv6Nv/9Dybjw9i9otCYZr0PU6K97PPSbiy+XNQtJ1Ww=;
 b=csnNHr385nH+F7jENLSA99YeV0hYW4/REuB5U99GwoXf+1t4vFwS8stjsNVh//7MaMSGuEugu/ZnVFJZ1qgW48pJeBcYVOgeFnRVoZxud7U+B49oTnqWWlMyOmVKxCLZ7OiqC7Y4cf4kN6Iw5myhps/kPMhCBIQjBA/LyYXuhYUKlXVwhFHlUkKBdJA3jB/NtxNeAnn4BCO9F1+l6AM/amtKhdeYVw+unoopXbesZclQNxUMvzwsKdf2otqyLZCu2C3xw/rvXE2anPQigxc7rNWxdzHp0FB01g4iMGqRWhrgyZKU+JCi30x5+1h6bzwlhaaqi3JfR01w8230BHRX6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wv6Nv/9Dybjw9i9otCYZr0PU6K97PPSbiy+XNQtJ1Ww=;
 b=pvnVIpFtXFwQUO9kHB2VpR8SVnDlPZzzPzU9fez+qa0nevb2suQSjzH8Jvj1FEHwoBkO81cyUbj5mzB00w3/5JkC1Y4xawTj6u9KyxDNi+3XgJV7lI9g/VkipOavJKPmjzRbUwjIvOawbmIK0+etYaTSX5T1Yp1JFWe2lM3+Z2o=
Received: from TY0PR03MB6356.apcprd03.prod.outlook.com (2603:1096:400:14c::9)
 by TYZPR03MB5678.apcprd03.prod.outlook.com (2603:1096:400:66::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Tue, 19 Sep
 2023 06:43:12 +0000
Received: from TY0PR03MB6356.apcprd03.prod.outlook.com
 ([fe80::492f:b5e4:51a:5ecc]) by TY0PR03MB6356.apcprd03.prod.outlook.com
 ([fe80::492f:b5e4:51a:5ecc%6]) with mapi id 15.20.6792.019; Tue, 19 Sep 2023
 06:43:11 +0000
From: =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>, "airlied@gmail.com"
 <airlied@gmail.com>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>
Subject: Re: [PATCH v5 00/14] add support MDP3 on MT8195 platform
Thread-Topic: [PATCH v5 00/14] add support MDP3 on MT8195 platform
Thread-Index: AQHZ5U7flwl4wSMrjUi9IihRGLxDrLAbs7+AgAYKwIA=
Date: Tue, 19 Sep 2023 06:43:11 +0000
Message-ID: <7ef65e888a919816d0c7c906c1ba1449d8fe6fc0.camel@mediatek.com>
References: <20230912075805.11432-1-moudy.ho@mediatek.com>
 <7d882edf-4ae7-4521-a5b2-2781422cff1a@xs4all.nl>
In-Reply-To: <7d882edf-4ae7-4521-a5b2-2781422cff1a@xs4all.nl>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY0PR03MB6356:EE_|TYZPR03MB5678:EE_
x-ms-office365-filtering-correlation-id: 8131e8eb-9c1d-4e5a-0343-08dbb8dbb18a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wfjvYvxO6QbWYBkz8QGq7Q96TTlYuHeKBjPuhTSVM5kUx5WvU1Lj96CrlAqo4klDg9kqUpkvNOucHS3Z1GmE3JH2V2Cku4wEp/7A9FuNr8rLAQkIoKGyhWS8Fy+BPLPtd2CtCOxDwx0AYo6PEwHdzoQ2Nwx9fybu80y+HXmpaHe1zyFs1k6HZEA3s08/pbCwBvhXDJ43A/YfD3/7X/1xq9m2+GKwGcR7sUVKEZLLGWtFzn6jw9/61xt+MOXbJu7fGcGmRq6bDwFRVaJIDW+GyTkKW4NCN5aCsVja3sgj0VfXRcalx5qn5Ozm8v447ggwKsOvvyLYgxerpBFzGFmM70f3chviOggAWdEVPkwEn5thIvTukfXsCETxE2aVirD2mOLPHHQNNVNvulf8OxO175k0touEVSmxL61nnG5ZCNNuLHDnOp5XVlBugUOWM0MXI7olHbOeW5b+uh2lXy9uUudwP9ETXuCsUWkC/s26IBtg6udQP4g0xwiE5yKjjMAl4lcQM/ZCpVyVXnj3dtl57qlcc5qopTi9NQxaeZ3XoBpjacpSQ8+W3HyR6uiMBA9G9MCMookOxmLaTuUMjN5sLOWnudT4vsUMVM3qPflQUHgGwD3RyGtKbPar9OywykoDvsn3AAKyOEWNutYB3csPhGaOpdoE6N2PkR3roRdOlLjP+auKxfE3YxeI6cFNV6OtSC17jm8Gy7cME2xN7k+JRBTyyNKaoAWLVy0eCepG6Ao=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY0PR03MB6356.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(136003)(346002)(39860400002)(396003)(1800799009)(186009)(451199024)(71200400001)(6506007)(5660300002)(6512007)(83380400001)(2616005)(26005)(41300700001)(316002)(54906003)(110136005)(7416002)(91956017)(66476007)(66946007)(76116006)(8936002)(64756008)(4326008)(8676002)(2906002)(66446008)(66556008)(53546011)(478600001)(6486002)(966005)(38100700002)(921005)(86362001)(122000001)(36756003)(85182001)(38070700005)(99106002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Si9nRTB0TGtmRVdKS2JxbHRjYnczbEJoOFgvSndmaTVhRTBodnhVQ0EwOU1N?=
 =?utf-8?B?OEI2R0tOQ1RycitWbGh1UGpIb0p0bVVxWmlUVzdNbVBkc3BsQlQvQTZtU0VZ?=
 =?utf-8?B?MTlmT01paHB2T3BnTU5vekVnS0hnYnROOFhrbkY3dE55SHBiamJ5Y0JQMHVR?=
 =?utf-8?B?MUZueFpBMVVrWmhXOXkwOGIzSXdyd09oV1dSdm43ZEs3TS9yS3NyTWNsR1Vv?=
 =?utf-8?B?S3VUUVRiVmZyemd4UFhSWGFRVEZlMVM1TW9hQkFja1c0YWZYc3JVUTFvT2ox?=
 =?utf-8?B?Sy9vTjN3dDNCWlNmMjllNHh1NmpXd2ZRTS82ZFpqdnR3bXAvNTVjODRZRlhX?=
 =?utf-8?B?L2xNQ0FCRHNMQzlXSkNja1VDM29DTm9KcXJCMGZ3OWtGUEVNUkR6ZStHZmRu?=
 =?utf-8?B?VHVUWEw4d3B4ZjA3cTZOUGhLd21IYkE2UWZtMk1YWlBhQksycUQxVCttZ2VP?=
 =?utf-8?B?ZGFxMEN2eHRuZWJLK2VMZEYrRm9sdGVsYXg3c1p4QmZIZXZYRXEzREZlSURW?=
 =?utf-8?B?TGJpQWVZK0k5Y2VNNzJlSGFGM3Zud2ZwMGFzTEkyVnpIOHlRZXlXVGU1MkFF?=
 =?utf-8?B?a25PdXlJS3o3c29mZHZOUzJNS2V2Zng3V0tmVFgyb0lFTDlJSlowclJYc00x?=
 =?utf-8?B?Q1FhdzA1OEhYczRpeWkyM3RhWmdsL0gxeW5yMnRIaTFlelV4MXRnWjcvTThI?=
 =?utf-8?B?V1lNUlFnQ25jUnFrZ1VNUXIwT2xPcGpWLzdWYk8vV0ZjaStjMmE2bmJQSEgr?=
 =?utf-8?B?cjI3TnBwbGxjNDFOSzNCdEhzeG9sMXdXR09tQXV6dlVteVVKZTliZVNVYThv?=
 =?utf-8?B?TmljTmxvUllOS2ViQ1N3WUg3VndyaWp4Y0JSdlZBN2ZmOEpXN09ZMWQ3cE4y?=
 =?utf-8?B?R2ZZdDRXaHFrdnU2VDIreFdIem1KY3Q0eUdMRTRRU0FJOTh5UVBGQU5YTzFq?=
 =?utf-8?B?dHFPcXJPNUw1MURiQmN5YVduTlg1ZFpiMzM5OWxzUWtHN2VOaDBXazg0eXVi?=
 =?utf-8?B?RE5WQVFXU0tlSkxGMWxLOGNkZWIzL2xoSkJRWGczalJHY3FOZHRPSTcvVHFL?=
 =?utf-8?B?WGdMbnUraC9rWXBSd1Jyai9adWh5U1RZTndpaktVa3R3a2N1YnNNazVYeUtC?=
 =?utf-8?B?c0tpMTRZcC9EcHVSbVlRbHBQaDZlUUtHdVB1ektRN2ZBR01FejRnY0hZOXpT?=
 =?utf-8?B?T1d2YVF0R0tQcUI1YnRyWHYzc3dyLzZHK1h3NGJycDlPVTBOU216OEJ6TFRs?=
 =?utf-8?B?NXhQU1lsekVWV2p3Q3JaNlVycStrdlRtdkpJa3pZRnFIWDNxVUY1RElGRkZW?=
 =?utf-8?B?OUxmNlJXM2pHdnRKTG5zZHQ5eG1ScnA2KzFlUUFKNXJUdTJKeFZnb1NpMmxE?=
 =?utf-8?B?VlVUbDhPOTdMU1BFRFRlYUNMWHRHb0J2cWFOV2xFaHllOGFiNFBQWDdqbHRL?=
 =?utf-8?B?Z3lCRTltc0NYamNJMisvSFFINnpzM2tQYUxmTXhEQTIvZXRBSGF0UFJPaHZC?=
 =?utf-8?B?aFQ3RFppTTJ4NEVDUW5LOExWa2xCcnkxOHRvY1NabGJ5MXlkbzBCMUErL0xY?=
 =?utf-8?B?M3JQM253bHdsenhRMHlFWWNNNEswWUEzUGd3a3F0OFNDN0s2UTFjMVVzeHlO?=
 =?utf-8?B?ejZMTDEzZVhvN2Rzd2lZZ0sweWxsdHBBOUl6UndwUDBLVUpoam82QjdObWU5?=
 =?utf-8?B?WXdhVEtYVy9NK3RqbWZJMS9FTWVTM3RJSWJDZG5YMzNkdEhSdEpSWkZRUHdu?=
 =?utf-8?B?SFRmeStpa1Q5aGlMUE1xVlc0bkRFZi9QRVByemR0MnZzcW9NaEhpV01UbnJX?=
 =?utf-8?B?RHJXMFNTWm81Y1pvSUxJVTF4RUdDWnM4VWt1THhBUWJ4MjNnQUdWMDJ1SzNN?=
 =?utf-8?B?eWpHOTNtUGx4WGdYUW5iRHlVOWRqRnhTRFU5REZUVFVXUG1VazJZTDVLb3cw?=
 =?utf-8?B?bWNiWUkveXZ5ZXNzQVozcW9TaW5NRVBua05pVmoxL2NoU0R1aXN4Qm1VQWtj?=
 =?utf-8?B?V0VEQUNOY0QzeW9nOHU0QXhkWklUU3MxUzF2UVdJQm5MMUFSaW9TUkY3dDBY?=
 =?utf-8?B?TmFVVlEvY2hmcTUxSWFLRzBiakVtUUlZcGdyR3phZnNIOUhLdkZoQ0NaZ0Jm?=
 =?utf-8?B?cEg2N1QzSU9tS3p5cGNtQlIxM0RKUjB2Q1JuMTZTRkJ6QU1ESW9nVFh6OXh1?=
 =?utf-8?B?ZXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7F0C8C0CE5FB5948BE86AC7052B25544@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY0PR03MB6356.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8131e8eb-9c1d-4e5a-0343-08dbb8dbb18a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2023 06:43:11.8874 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rzBO9/iA/nNqJANh8IGyjLd1JjFomBWiPpandHRFR+OWL5yu0pyStdbfFCuuZdoZSxA7ZpQjTZ/tI7ccuw8B6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB5678
X-MTK: N
X-Mailman-Approved-At: Tue, 19 Sep 2023 06:59:32 +0000
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
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIzLTA5LTE1IGF0IDEyOjI3ICswMjAwLCBIYW5zIFZlcmt1aWwgd3JvdGU6DQo+
ICAJIA0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiAgSGkgTW91ZHksDQo+IA0KPiBPbiAxMi8wOS8yMDIzIDA5OjU3LCBNb3Vk
eSBIbyB3cm90ZToNCj4gPiBDaGFuZ2VzIHNpbmNlIHY0Og0KPiA+IC0gUmViYXNlIG9uIHY2LjYt
cmMxDQo+ID4gLSBSZW1vdmUgYW55IHVubmVjZXNzYXJ5IERUUyBzZXR0aW5ncy4NCj4gPiAtIEFk
anVzdCB0aGUgdXNhZ2Ugb2YgTU9EIGFuZCBjbG9jayBpbiBibGVuZGluZyBjb21wb25lbnRzLg0K
PiA+IA0KPiA+IENoYW5nZXMgc2luY2UgdjM6DQo+ID4gLSBEZXBlbmQgb24gOg0KPiA+ICAgWzFd
IA0KPiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtbWVkaWEvbGlz
dC8/c2VyaWVzPTcxOTg0MQ0KPiA+IC0gU3VnZ2VzdGVkIGJ5IEtyenlzenRvZiwgaW50ZWdyYXRp
bmcgYWxsIG5ld2x5IGFkZGVkIGJpbmRpbmdzIGZvcg0KPiA+ICAgdGhlIG10ODE5NSBNRFAzIGlu
dG8gdGhlIGZpbGUgIm1lZGlhdGVrLG10ODE5NS1tZHAzLnlhbWwiLg0KPiA+IC0gUmV2aXNlIE1E
UDMgbm9kZXMgd2l0aCBnZW5lcmljIG5hbWVzLg0KPiA+IA0KPiA+IENoYW5nZXMgc2luY2UgdjI6
DQo+ID4gLSBEZXBlbmQgb24gOg0KPiA+ICAgWzFdIE1NU1lTL01VVEVYOiANCj4gaHR0cHM6Ly9w
YXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhdGVrL2xpc3QvP3Nlcmllcz03
MTE1OTINCj4gPiAgIFsyXSBNRFAzOiANCj4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9w
cm9qZWN0L2xpbnV4LW1lZGlhdGVrL2xpc3QvP3Nlcmllcz03MTE2MTgNCj4gPiAtIFN1Z2dlc3Rl
ZCBieSBSb2IgdG8gcmV2aXNlIE1EUDMgYmluZGluZ3MgdG8gcGFzcyBkdGJzIGNoZWNrDQo+ID4g
LSBBZGQgcGFyYWxsZWwgcGF0aHMgZmVhdHVyZS4NCj4gPiAtIEFkZCBibGVuZGVkIGNvbXBvbmVu
dHMgc2V0dGluZ3MuDQo+ID4gDQo+ID4gQ2hhbmdlcyBzaW5jZSB2MToNCj4gPiAtIERlcGVuZCBv
biA6DQo+ID4gICBbMV0gTURQMyA6IA0KPiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3By
b2plY3QvbGludXgtbWVkaWF0ZWsvbGlzdC8/c2VyaWVzPTY5ODg3Mg0KPiA+ICAgWzJdIE1NU1lT
L01VVEVYOiANCj4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1l
ZGlhdGVrL2xpc3QvP3Nlcmllcz02ODQ5NTkNCj4gPiAtIEZpeCBjb21waWxhdGlvbiBmYWlsdXJl
IGR1ZSB0byB1c2Ugb2YgdW5kZWNsYXJlZCBpZGVudGlmaWVyIGluDQo+IGZpbGUgIm10ay1tZHAz
LWNtZHEuYyINCj4gPiANCj4gPiBIZWxsbywNCj4gPiANCj4gPiBUaGlzIHBhdGNoIGlzIHVzZWQg
dG8gYWRkIHN1cHBvcnQgZm9yIE1EUDMgb24gdGhlIE1UODE5NSBwbGF0Zm9ybQ0KPiB0aGF0DQo+
ID4gY29udGFpbnMgbW9yZSBwaWN0dXJlIHF1YWxpdHkgY29tcG9uZW50cywgYW5kIGNhbiBhcnJh
bmdlIG1vcmUNCj4gcGlwZWxpbmVzDQo+ID4gdGhyb3VnaCB0d28gc2V0cyBvZiBNTVNZUyBhbmQg
TVVURVggcmVzcGVjdGl2ZWx5Lg0KPiANCj4gSSByYW4gdGhpcyBzZXJpZXMgdGhyb3VnaCBvdXIg
YnVpbGQgc3lzdGVtIGFuZCBJIGdvdCB0aGUgZm9sbG93aW5nDQo+IGNvbXBpbGUgd2FybmluZzoN
Cj4gDQo+IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvbWRwMy9tdGstbWRwMy1jbWRx
LmM6IEluIGZ1bmN0aW9uDQo+ICdtZHBfcGF0aF9jb25maWcuaXNyYSc6DQo+IGRyaXZlcnMvbWVk
aWEvcGxhdGZvcm0vbWVkaWF0ZWsvbWRwMy9tdGstbWRwMy1jbWRxLmM6NDQ5OjUxOiB3YXJuaW5n
Og0KPiAnY3R4JyBtYXkgYmUgdXNlZCB1bmluaXRpYWxpemVkIFstV21heWJlLXVuaW5pdGlhbGl6
ZWRdDQo+ICAgNDQ5IHwgICAgICAgICAgICAgICAgICAgICAgICAgb3V0ID0gQ0ZHX0NPTVAoTVQ4
MTk1LCBjdHgtPnBhcmFtLA0KPiBvdXRwdXRzWzBdKTsNCj4gICAgICAgfCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH5+fl5+fn5+fn4NCj4gZHJpdmVycy9t
ZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9tZHAzL210ay1pbWctaXBpLmg6MTM3OjI1OiBub3RlOiBp
bg0KPiBkZWZpbml0aW9uIG9mIG1hY3JvICdDRkdfQ09NUCcNCj4gICAxMzcgfCAgICAgICAgIChJ
U19FUlJfT1JfTlVMTChjb21wKSA/IDAgOiBfQ0ZHX0NPTVAocGxhdCwgY29tcCwNCj4gbWVtKSkN
Cj4gICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICBefn5+DQo+IGRyaXZlcnMvbWVkaWEv
cGxhdGZvcm0vbWVkaWF0ZWsvbWRwMy9tdGstbWRwMy1jbWRxLmM6NDAyOjMwOiBub3RlOg0KPiAn
Y3R4JyB3YXMgZGVjbGFyZWQgaGVyZQ0KPiAgIDQwMiB8ICAgICAgICAgc3RydWN0IG1kcF9jb21w
X2N0eCAqY3R4Ow0KPiAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+DQo+
IA0KPiBBbmQgYWxzbyBhIGZldyBzbWF0Y2ggd2FybmluZ3MvZXJyb3JzOg0KPiANCj4gZHJpdmVy
cy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9tZHAzL210ay1tZHAzLWNvbXAuYzo4NzENCj4gd2Fp
dF93cm90X2V2ZW50KCkgd2FybjogdmFyaWFibGUgZGVyZWZlcmVuY2VkIGJlZm9yZSBjaGVjayAn
bWRwX2NmZycNCj4gKHNlZSBsaW5lIDg2NCkNCj4gZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRp
YXRlay9tZHAzL210ay1tZHAzLWNvbXAuYzoxMDI0DQo+IHJlc2V0X2x1bWFfaGlzdCgpIHdhcm46
IHZhcmlhYmxlIGRlcmVmZXJlbmNlZCBiZWZvcmUgY2hlY2sgJ21kcF9jZmcnDQo+IChzZWUgbGlu
ZSAxMDE1KQ0KPiBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL21kcDMvbXRrLW1kcDMt
Y21kcS5jOjQ0Nw0KPiBtZHBfcGF0aF9jb25maWcoKSBlcnJvcjogcG90ZW50aWFsbHkgZGVyZWZl
cmVuY2luZyB1bmluaXRpYWxpemVkDQo+ICdjdHgnLg0KPiBkcml2ZXJzL21lZGlhL3BsYXRmb3Jt
L21lZGlhdGVrL21kcDMvbXRrLW1kcDMtY21kcS5jOjQ0OQ0KPiBtZHBfcGF0aF9jb25maWcoKSBl
cnJvcjogcG90ZW50aWFsbHkgZGVyZWZlcmVuY2luZyB1bmluaXRpYWxpemVkDQo+ICdjdHgnLg0K
PiANCj4gWW91IGNhbiBydW4gdGhlIHNhbWUgdGVzdHMgeW91cnNlbGYsIHNlZSB0aGlzIGFubm91
bmNlbWVudDoNCj4gDQo+IA0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbWVkaWEvMTg5
ODkwMTYtNjM5Mi1hNzdiLTZjZjctMTIyM2M5MTYxZGVmQHhzNGFsbC5ubC8NCj4gDQo+IFJlZ2Fy
ZHMsDQo+IA0KPiBIYW5zDQo+IA0KDQpIaSBIYW5zLA0KDQpUaGFua3MgZm9yIHRoZSByZW1pbmRl
ci4gSSB3aWxsIHJ1biB0aGUgYnVpbGQgc2NyaXB0IHRvIHRlc3QgdGhpcw0Kc2VyaWVzIGFuZCBy
ZWN0aWZ5IGFueSB3YXJuaW5ncy4NCg0KU2luY2VyZWx5LA0KTW91ZHkNCj4gPiANCj4gPiBNb3Vk
eSBIbyAoMTQpOg0KPiA+ICAgYXJtNjQ6IGR0czogbWVkaWF0ZWs6IG10ODE4MzogY29ycmVjdCBN
RFAzIERNQS1yZWxhdGVkIG5vZGVzDQo+ID4gICBhcm02NDogZHRzOiBtZWRpYXRlazogbXQ4MTk1
OiBhZGQgTURQMyBub2Rlcw0KPiA+ICAgbWVkaWE6IHBsYXRmb3JtOiBtdGstbWRwMzogYWRkIHN1
cHBvcnQgc2Vjb25kIHNldHMgb2YgTU1TWVMNCj4gPiAgIG1lZGlhOiBwbGF0Zm9ybTogbXRrLW1k
cDM6IGFkZCBzdXBwb3J0IHNlY29uZCBzZXRzIG9mIE1VVEVYDQo+ID4gICBtZWRpYTogcGxhdGZv
cm06IG10ay1tZHAzOiBpbnRyb2R1Y2UgbW9yZSBwaXBlbGluZXMgZnJvbSBNVDgxOTUNCj4gPiAg
IG1lZGlhOiBwbGF0Zm9ybTogbXRrLW1kcDM6IGludHJvZHVjZSBtb3JlIE1EUDMgY29tcG9uZW50
cw0KPiA+ICAgbWVkaWE6IHBsYXRmb3JtOiBtdGstbWRwMzogYWRkIGNoZWNrcyBmb3IgZHVtbXkg
Y29tcG9uZW50cw0KPiA+ICAgbWVkaWE6IHBsYXRmb3JtOiBtdGstbWRwMzogYXZvaWQgbXVsdGlw
bGUgZHJpdmVyIHJlZ2lzdHJhdGlvbnMNCj4gPiAgIG1lZGlhOiBwbGF0Zm9ybTogbXRrLW1kcDM6
IGV4dGVuZCBHQ0UgZXZlbnQgd2FpdGluZyBpbiBSRE1BIGFuZA0KPiBXUk9UDQo+ID4gICBtZWRp
YTogcGxhdGZvcm06IG10ay1tZHAzOiBhZGQgc3VwcG9ydCBmb3IgYmxlbmRpbmcgbXVsdGlwbGUN
Cj4gPiAgICAgY29tcG9uZW50cw0KPiA+ICAgbWVkaWE6IHBsYXRmb3JtOiBtdGstbWRwMzogYWRk
IG10ODE5NSBwbGF0Zm9ybSBjb25maWd1cmF0aW9uDQo+ID4gICBtZWRpYTogcGxhdGZvcm06IG10
ay1tZHAzOiBhZGQgbXQ4MTk1IHNoYXJlZCBtZW1vcnkNCj4gY29uZmlndXJhdGlvbnMNCj4gPiAg
IG1lZGlhOiBwbGF0Zm9ybTogbXRrLW1kcDM6IGFkZCBtdDgxOTUgTURQMyBjb21wb25lbnQgc2V0
dGluZ3MNCj4gPiAgIG1lZGlhOiBwbGF0Zm9ybTogbXRrLW1kcDM6IGFkZCBzdXBwb3J0IGZvciBw
YXJhbGxlbCBwaXBlIHRvDQo+IGltcHJvdmUNCj4gPiAgICAgRlBTDQo+ID4gDQo+ID4gIGFyY2gv
YXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTgzLmR0c2kgICAgICB8ICAgNiArLQ0KPiA+ICBh
cmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5NS5kdHNpICAgICAgfCAzNzggKysrKysr
KysNCj4gPiAgLi4uL3BsYXRmb3JtL21lZGlhdGVrL21kcDMvbWRwX2NmZ19kYXRhLmMgICAgIHwg
NzI5DQo+ICsrKysrKysrKysrKysrLQ0KPiA+ICAuLi4vcGxhdGZvcm0vbWVkaWF0ZWsvbWRwMy9t
ZHBfcmVnX2FhbC5oICAgICAgfCAgMjUgKw0KPiA+ICAuLi4vcGxhdGZvcm0vbWVkaWF0ZWsvbWRw
My9tZHBfcmVnX2NvbG9yLmggICAgfCAgMzEgKw0KPiA+ICAuLi4vbWVkaWEvcGxhdGZvcm0vbWVk
aWF0ZWsvbWRwMy9tZHBfcmVnX2ZnLmggfCAgMjMgKw0KPiA+ICAuLi4vcGxhdGZvcm0vbWVkaWF0
ZWsvbWRwMy9tZHBfcmVnX2hkci5oICAgICAgfCAgMzEgKw0KPiA+ICAuLi4vcGxhdGZvcm0vbWVk
aWF0ZWsvbWRwMy9tZHBfcmVnX21lcmdlLmggICAgfCAgMjUgKw0KPiA+ICAuLi4vcGxhdGZvcm0v
bWVkaWF0ZWsvbWRwMy9tZHBfcmVnX292bC5oICAgICAgfCAgMjUgKw0KPiA+ICAuLi4vcGxhdGZv
cm0vbWVkaWF0ZWsvbWRwMy9tZHBfcmVnX3BhZC5oICAgICAgfCAgMjEgKw0KPiA+ICAuLi4vcGxh
dGZvcm0vbWVkaWF0ZWsvbWRwMy9tZHBfcmVnX3JkbWEuaCAgICAgfCAgMjQgKw0KPiA+ICAuLi4v
cGxhdGZvcm0vbWVkaWF0ZWsvbWRwMy9tZHBfcmVnX3Jzei5oICAgICAgfCAgIDIgKw0KPiA+ICAu
Li4vcGxhdGZvcm0vbWVkaWF0ZWsvbWRwMy9tZHBfcmVnX3Rkc2hwLmggICAgfCAgMzQgKw0KPiA+
ICAuLi4vcGxhdGZvcm0vbWVkaWF0ZWsvbWRwMy9tZHBfcmVnX3dyb3QuaCAgICAgfCAgIDggKw0K
PiA+ICAuLi4vcGxhdGZvcm0vbWVkaWF0ZWsvbWRwMy9tZHBfc21fbXQ4MTk1LmggICAgfCAyODMg
KysrKysrDQo+ID4gIC4uLi9wbGF0Zm9ybS9tZWRpYXRlay9tZHAzL210ay1pbWctaXBpLmggICAg
ICB8ICAgNCArDQo+ID4gIC4uLi9wbGF0Zm9ybS9tZWRpYXRlay9tZHAzL210ay1tZHAzLWNmZy5o
ICAgICB8ICAgMiArDQo+ID4gIC4uLi9wbGF0Zm9ybS9tZWRpYXRlay9tZHAzL210ay1tZHAzLWNt
ZHEuYyAgICB8IDQ0NyArKysrKysrLS0NCj4gPiAgLi4uL3BsYXRmb3JtL21lZGlhdGVrL21kcDMv
bXRrLW1kcDMtY21kcS5oICAgIHwgICAxICsNCj4gPiAgLi4uL3BsYXRmb3JtL21lZGlhdGVrL21k
cDMvbXRrLW1kcDMtY29tcC5jICAgIHwgODYwDQo+ICsrKysrKysrKysrKysrKysrLQ0KPiA+ICAu
Li4vcGxhdGZvcm0vbWVkaWF0ZWsvbWRwMy9tdGstbWRwMy1jb21wLmggICAgfCAgOTMgKy0NCj4g
PiAgLi4uL3BsYXRmb3JtL21lZGlhdGVrL21kcDMvbXRrLW1kcDMtY29yZS5jICAgIHwgMTAzICsr
LQ0KPiA+ICAuLi4vcGxhdGZvcm0vbWVkaWF0ZWsvbWRwMy9tdGstbWRwMy1jb3JlLmggICAgfCAg
MzMgKy0NCj4gPiAgLi4uL3BsYXRmb3JtL21lZGlhdGVrL21kcDMvbXRrLW1kcDMtbTJtLmMgICAg
IHwgIDE1ICsNCj4gPiAgLi4uL3BsYXRmb3JtL21lZGlhdGVrL21kcDMvbXRrLW1kcDMtcmVncy5j
ICAgIHwgIDE4ICsNCj4gPiAgLi4uL3BsYXRmb3JtL21lZGlhdGVrL21kcDMvbXRrLW1kcDMtcmVn
cy5oICAgIHwgICAxICsNCj4gPiAgLi4uL3BsYXRmb3JtL21lZGlhdGVrL21kcDMvbXRrLW1kcDMt
dnB1LmMgICAgIHwgICAzICstDQo+ID4gIDI3IGZpbGVzIGNoYW5nZWQsIDMwNTEgaW5zZXJ0aW9u
cygrKSwgMTc0IGRlbGV0aW9ucygtKQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQNCj4gZHJpdmVy
cy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9tZHAzL21kcF9yZWdfYWFsLmgNCj4gPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0DQo+IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvbWRwMy9tZHBf
cmVnX2NvbG9yLmgNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+IGRyaXZlcnMvbWVkaWEvcGxh
dGZvcm0vbWVkaWF0ZWsvbWRwMy9tZHBfcmVnX2ZnLmgNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
DQo+IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvbWRwMy9tZHBfcmVnX2hkci5oDQo+
ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVr
L21kcDMvbWRwX3JlZ19tZXJnZS5oDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiBkcml2ZXJz
L21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL21kcDMvbWRwX3JlZ19vdmwuaA0KPiA+ICBjcmVhdGUg
bW9kZSAxMDA2NDQNCj4gZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9tZHAzL21kcF9y
ZWdfcGFkLmgNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+IGRyaXZlcnMvbWVkaWEvcGxhdGZv
cm0vbWVkaWF0ZWsvbWRwMy9tZHBfcmVnX3Rkc2hwLmgNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
DQo+IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvbWRwMy9tZHBfc21fbXQ4MTk1LmgN
Cj4gPiANCj4gDQo=
