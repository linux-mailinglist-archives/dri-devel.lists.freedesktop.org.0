Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3520757622
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 10:03:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 144EF10E2F2;
	Tue, 18 Jul 2023 08:02:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C22F10E2E6
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 08:02:52 +0000 (UTC)
X-UUID: 7b44ef0e254111ee9cb5633481061a41-20230718
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=5kAceQ0yqT4MlEA6h4x0Q3MWPzH0gbPWHYbvAwCI88I=; 
 b=gwIJIZtSVhKBa/mdg1QzUxZ2uPYrbbdisKZyDjlHwdxRanSVwfv9Net5ZQKHgMP9krRHdtYq3gMsfibubc82h0MMYqDWjNPeZyH44nCU3mPuGEL5pJnge0LZXB8f9X+kSK/O+4mKBPbEW5y1Zn9m6Wsii2cXDLH/epydFoDAtVU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.28, REQID:b5a875f2-47ec-4865-91d0-dc3f010bdc69, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:45
X-CID-INFO: VERSION:1.1.28, REQID:b5a875f2-47ec-4865-91d0-dc3f010bdc69, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:45
X-CID-META: VersionHash:176cd25, CLOUDID:2c66bf87-44fb-401c-8de7-6a5572f1f5d5,
 B
 ulkID:230718154926SCFOXRXU,BulkQuantity:2,Recheck:0,SF:48|38|29|28|17|19|1
 02,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:41,QS:nil,BEC:nil
 ,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:PA,DKP:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN, TF_CID_SPAM_SNR, TF_CID_SPAM_SDM,
 TF_CID_SPAM_FAS, TF_CID_SPAM_FSD
X-UUID: 7b44ef0e254111ee9cb5633481061a41-20230718
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 895086044; Tue, 18 Jul 2023 16:02:46 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 18 Jul 2023 16:02:45 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Tue, 18 Jul 2023 16:02:45 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WMi4JfQc4/2VqyJ/x8EZMbF72Xd5cE5crsToge0NOMKZdyXLmNW81HVroRPF7G2WbTYqRMTHREBSGzf1eE5RvXPOZWlTMI6s0OdoVkJeewYDiIMKPEN5QM2oTgKVcajSyTyUQkSlrI2mZUDwwBKozKQbp8JR6rbLwhZIUpmqQocLQ9lMct+/s/eZ54yxR2wSt/z2y6aMu7cj8OJ4CN+UCJyFtMk9mZM7qrCScVjqQ+bz2xahBiD62lqq5l6tFHMtsFynlJDwGrmInRNU8xPIYnUoM+R0A22x3hDUHC1RSNbUVZfOkaiPYRvhQfsVz1Q7gLMZkg1Bjd5gcQvCLhrzLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W3zTgqym2+5kPitEA7UbnQYV3izcxtKgBoek7N918d0=;
 b=DyG0rU9wbwFZ5ZNZmfCYmb3LB6i1WeAoW3/6bgRIDg1BlzmdRubfw0POOqUUzPlw2A6a9s17X0Z2SMW/n08upU9ItdS/du97LkkmQ8Pat3EoKGdi5+ibGCzhtZ3Zv31ASZnKHIC8XvPKN0SLAVEHtKe/WWFW8DDX9cAVJ0LeWEDxeqNI+YHpoHUBBfLNnUimy+MjLm/oB9+DMGr+zcKEXgUbtNkHjKmm3LdDIbzIKnvjHdfcY6ZDePouDBrFFrH77ex83lpzYmFmCjnYO44X7shcqYdAnK2LoSUnBGGtnfuNsCMWo6UF9BBs470El2AQoAoUEuQUbTR9r5XuPh77YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W3zTgqym2+5kPitEA7UbnQYV3izcxtKgBoek7N918d0=;
 b=g9w/NjktuKnGAc2ahBw6TGFp6IuZdcVeTKMmo9T4sBNKL+ahnGSJfhWFvUGdNHG0TYyUGHVfojMS9Fat3W3z67mfaLrnmJslviJQjmNMqCymDG8ePq7ADY97lXIf0CGyHr1i9MhGEwRSsqHFNHUyy96SFcO2oOYJsTqQOsI4nt4=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEYPR03MB7397.apcprd03.prod.outlook.com (2603:1096:101:13b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Tue, 18 Jul
 2023 08:02:43 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::d126:7f34:9e4f:a95]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::d126:7f34:9e4f:a95%4]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 08:02:43 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>
Subject: Re: [PATCH v6 01/11] drm/mediatek: dp: Add missing error checks in
 mtk_dp_parse_capabilities
Thread-Topic: [PATCH v6 01/11] drm/mediatek: dp: Add missing error checks in
 mtk_dp_parse_capabilities
Thread-Index: AQHZuLk9K2/9wwsl8USIlsnthYU+i6+/KwIA
Date: Tue, 18 Jul 2023 08:02:43 +0000
Message-ID: <2e6f9673e92a12a2abecd2b075bb325882490895.camel@mediatek.com>
References: <20230717141438.274419-1-angelogioacchino.delregno@collabora.com>
 <20230717141438.274419-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230717141438.274419-2-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEYPR03MB7397:EE_
x-ms-office365-filtering-correlation-id: 20a67daf-1773-420b-47cf-08db87655d6c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yavWCQUvffNeeWsiz64n250KK3/8Mu/3Y1xgD7ukedkIgVw2wzN19lFI8X4DcS5BPfkc43HFITqVVJqVFsyceH2bdSzb1kSZH0OB/YQ0hqryJ1YzvpvSmtmv7FhQ/29lMqkSm0cUfzt3eSesAClEZxnVTVwswSd8sDxB2EL7KEfyc+nOPb2RyJj1H3MxBH9leTkfnYUrj9GYqzWh3xvC180NdJzIj0+AlCQkHB7n7ZOaQO12Ynhe4Do4aNDxq9QCVWBb8NurlwpygQo5i3hXKbJD58jY22CRDx3HMSoeHzPqC8rl1wGYuHgY3pGrm6AC2cInuN2BKjk/N4qqO9dp9+T6qSV+mx/H010wS+H8w/Nho+G7mhxNF2PvDiQOUiY8VEbvBIZsfLj7mgRXXREYO2P+lOKEeBcagfm6isU6ZOABaYC0O4/0DqLnVHkRPLqVSFBVEicYor+tAYIZ0RU1IfXw+6sBBpPIMgTP0GvMd7//iDxaz098SFNYgyPTlmUNKsV2tKhRItW8BPKnIDs1u8TAuFioaaV8tehZOlyzWlJsKmT2i17dUtyeqDb+85i126pQ3p+na9lXi5tuiKsbuNubzvWMTnmSbg+myD2uvd7OoqVFgik50Ol+HItXdBCFSdLsPuidedfmayiQGmzqAEe3cdJ8mpV2q8p25WwA/OM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(136003)(366004)(39860400002)(396003)(346002)(451199021)(478600001)(6486002)(71200400001)(110136005)(54906003)(83380400001)(38070700005)(85182001)(86362001)(76116006)(2906002)(186003)(36756003)(6506007)(2616005)(6512007)(316002)(66556008)(122000001)(38100700002)(26005)(64756008)(41300700001)(66446008)(66946007)(66476007)(4326008)(8676002)(8936002)(5660300002)(7416002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UTBka3h3dnNsVDhYRUZUb2FJOGVkdHNQMndhNDN3dXc5NDdVQ2dlTitEWEgy?=
 =?utf-8?B?MXZVcnIxbFIzN242Z3VZcGxRNjF5elFxRWoyamQzRkI3ZEQxNlZYQUlITDQ4?=
 =?utf-8?B?TnZBQzRySUNHcFBmSWgzN1Z1MnltSUZRNHlDSWVlZlNlWDhqWlZkUlhvaG8v?=
 =?utf-8?B?d0RudWI3SGx0VmRmQUsyMW13WHIzRmtEWkZSUTdRc01wT1M1RjJUbkVHZlVD?=
 =?utf-8?B?c2pER0hzN3pyK25xNVJkU1VTbkExb0NVVnJlTTZrSUw2YjF5T2J2SnFnTm5F?=
 =?utf-8?B?ZFE3UjJDc1JaS2JKRUVKekUvYVk1MTduU1lpbXpPTHV4eko1QWp2Mm40R3R4?=
 =?utf-8?B?cFh4eW9oUkhDNjFWRzhKM2ZFZW1PN2t0elpZYVMwQ0lqSjY2WWxFYmpQWGFs?=
 =?utf-8?B?S1Z6UGVGUWdzT1ZYR1N0Q3E2cEg5U0RoZzBEN3FIRWJ1SzZXQ0QvUkFqNEdh?=
 =?utf-8?B?cUIrOXhWNTNrM3BYWG9LZ0xpazVyT0VkR2FJUWlIVjcwb29UZUJlWUhMM0ZW?=
 =?utf-8?B?UkxEdnYzcTF0TGhLOTB4VVVsdWp6bzVXWFoyMGVTNkMxU0ovQWYrdXpqaC9V?=
 =?utf-8?B?UVAwdlpCUWpKK0FEUHJuWWw0L2R4cllBVXE5UmJIM0NtRFY1aURuSXR2Wit6?=
 =?utf-8?B?cEZLWHQ2T2Z0SW1oNHJ1TS9MTm53YWhQckE2RytYZ2YwRldLUVdnQnhJT0Fj?=
 =?utf-8?B?bjdXczhKbDE2ZGFOOXF3VE94ZjR1K1FMdlhxclJuVnV3ai9WSkhkUDlPK3ky?=
 =?utf-8?B?VTZxbkt2YXZvaWNqNGZ5QnRFNXFmUkNCYkcrTE5zd1R4TkkzZmo0b2M5cHZo?=
 =?utf-8?B?Ui83ek1WM3o5K1ZxOGVmeHV0VDdqcC92R2dpZVcwNEFHZldGRjNhTHRSOUpL?=
 =?utf-8?B?VWk3YXFNT20yWlZ2cE5ZcU5jbUxTTTJQeXczNEh6bUIwa1RlUjZ5Y1FnbVpH?=
 =?utf-8?B?YzZoWjVRMjM2Y25NbzVQZXBKQXg3Qm5QcE5iejZ6QWM1NkFwSUhrd1Jpd2RK?=
 =?utf-8?B?UzZvRmVtcDhBWk81VE50Z2tybUhTcy9SckRDdjdXYUVhQ1loUFI1M3lNckxO?=
 =?utf-8?B?OGR6elBEaCtnTVpNNmlzSHM0NXN1VWhUaTBhUFRHSmdweUhDR3BFVmlZcmpM?=
 =?utf-8?B?S1VzVmwwUnZjWVlvT0QwczIyVDNjaDBSdXhzK1dpVzc1QUhuazZwU1AzTDNK?=
 =?utf-8?B?c3M2cGNNR2VkM05QNFBkdWRDMWJyK2cvR0VyRlJYUElFSGZZL2VrdkorM1Uw?=
 =?utf-8?B?dU03Z0NZck5iT3BOU2ljQUdmWlFmWW5OSHdGeUVPQmZ2ZEE1RS9vM2lQbHp6?=
 =?utf-8?B?TDRmNXRoSXpDalpCVnVBdlN6akloRW1xWk5JY2x1Y1pKNEdmeHVubzNmZ0Ni?=
 =?utf-8?B?MEMxeWd5TER2U2dxb09FR0dmOTlLV2kwSTc0cXFJTWoyRXd6d1pmN0pHK3l6?=
 =?utf-8?B?bTdkV1BoUHpTREdldjdkOWVrODVub2FpS3lHbDk0cXB0dWs4NFpaQ3E5MHBM?=
 =?utf-8?B?eFdiR0U5T3NGa2wyaU1GQnNicXh6MnRhMVVUVnBmZk16TEJqWlZLcVZIdU1L?=
 =?utf-8?B?a1liS0R2Vm8ycTQwaVE5OWMzUXJJdjZNU1JTeHVpWlNrUS9FM0hTVDAzQkUv?=
 =?utf-8?B?N0xveU1WMkNmOWJUTjA5bUsrTnpXaHlCNWJnOElVSlNqYWY4MG9PRm96dzl3?=
 =?utf-8?B?ZDBYNnY3QStRc2t5c0NJb3ZLak1TallWRjk1V25ZV2RZbmZSaWNEQm42Qi9h?=
 =?utf-8?B?aUpvbStza3hLK2Y0OUNseTVWL3lJM0YvNVRXMkp4TDBnSm1TVkIyOFh1ODRS?=
 =?utf-8?B?QjNiY05qckk1SGpLazBwZ2lYd09kWHVOdy9OblZKaDMxREpiamVXdW55WWpU?=
 =?utf-8?B?Q2pLQzZYTE5pR1czSXFJQnE1WGJLb2lyT0w2OG5rWDlWOHpwSUNPRHZlTmtR?=
 =?utf-8?B?RXNVb2JYQlpLT3J0SWpoenJLc1JqTlVGUTNtOCtTZzE0NkM0TEZsODMrS0x0?=
 =?utf-8?B?eE1ubnltZkZ0TGo2TU1OUUF6Rjg3Q0xCamluOS82M1RzU2p4OHFjeXNjdFgx?=
 =?utf-8?B?Snk5UTZ5UzZpaEVqZlVjOSs0cUtOQWtrQUR2S1RKanRsUDRpalljUnZ3eFBB?=
 =?utf-8?Q?GbD5aSRBxQewc8oOL4vPbcy/c?=
Content-ID: <74D7DDC1507972429FE22F8EB6129C00@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20a67daf-1773-420b-47cf-08db87655d6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2023 08:02:43.1268 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bDvUEKn9D+Tjewetzzq8952i0v8drQpgN2JvGaLVjFPtaHfke/6PFPQPJzn9W1Iftg2XyO25Ct9xT3S9cWyyZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7397
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_003_508658109.855922996"
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
Cc: "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "wenst@chromium.org" <wenst@chromium.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_003_508658109.855922996
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpLCYjMzI7QW5nZWxvOg0KDQpPbiYjMzI7TW9uLCYjMzI7MjAyMy0wNy0xNyYjMzI7
YXQmIzMyOzE2OjE0JiMzMjsrMDIwMCwmIzMyO0FuZ2Vsb0dpb2FjY2hpbm8mIzMyO0RlbCYjMzI7
UmVnbm8mIzMyO3dyb3RlOg0KJmd0OyYjMzI7JiMzMjsmIzMyOw0KJmd0OyYjMzI7RXh0ZXJuYWwm
IzMyO2VtYWlsJiMzMjs6JiMzMjtQbGVhc2UmIzMyO2RvJiMzMjtub3QmIzMyO2NsaWNrJiMzMjts
aW5rcyYjMzI7b3ImIzMyO29wZW4mIzMyO2F0dGFjaG1lbnRzJiMzMjt1bnRpbA0KJmd0OyYjMzI7
eW91JiMzMjtoYXZlJiMzMjt2ZXJpZmllZCYjMzI7dGhlJiMzMjtzZW5kZXImIzMyO29yJiMzMjt0
aGUmIzMyO2NvbnRlbnQuDQomZ3Q7JiMzMjsmIzMyO0lmJiMzMjtyZWFkaW5nJiMzMjt0aGUmIzMy
O1JYJiMzMjtjYXBhYmlsaXRpZXMmIzMyO2ZhaWxzJiMzMjt0aGUmIzMyO3RyYWluaW5nJiMzMjtw
YXR0ZXJuJiMzMjt3aWxsJiMzMjtiZQ0KJmd0OyYjMzI7c2V0DQomZ3Q7JiMzMjt3cm9uZ2x5OiYj
MzI7YWRkJiMzMjtlcnJvciYjMzI7Y2hlY2tpbmcmIzMyO2ZvciYjMzI7ZHJtX2RwX3JlYWRfZHBj
ZF9jYXBzKCkmIzMyO2FuZCYjMzI7cmV0dXJuJiMzMjtpZg0KJmd0OyYjMzI7YW55dGhpbmcmIzMy
O3dlbnQmIzMyO3dyb25nJiMzMjt3aXRoJiMzMjtpdC4NCiZndDsmIzMyOw0KJmd0OyYjMzI7V2hp
bGUmIzMyO2F0JiMzMjtpdCwmIzMyO2Fsc28mIzMyO2FkZCYjMzI7YSYjMzI7bGVzcyYjMzI7Y3Jp
dGljYWwmIzMyO2Vycm9yJiMzMjtjaGVjayYjMzI7d2hlbiYjMzI7d3JpdGluZyYjMzI7dG8NCiZn
dDsmIzMyO2NsZWFyJiMzMjt0aGUmIzMyO0VTSTAmIzMyO0lSUSYjMzI7dmVjdG9yLg0KDQpSZXZp
d2VkLWJ5OiYjMzI7Q0smIzMyO0h1JiMzMjsmbHQ7Y2suaHVAbWVkaWF0ZWsuY29tJmd0Ow0KDQom
Z3Q7JiMzMjsNCiZndDsmIzMyO0ZpeGVzOiYjMzI7ZjcwYWMwOTdhMmNmJiMzMjsoJnF1b3Q7ZHJt
L21lZGlhdGVrOiYjMzI7QWRkJiMzMjtNVDgxOTUmIzMyO0VtYmVkZGVkJiMzMjtEaXNwbGF5UG9y
dA0KJmd0OyYjMzI7ZHJpdmVyJnF1b3Q7KQ0KJmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO0Fu
Z2Vsb0dpb2FjY2hpbm8mIzMyO0RlbCYjMzI7UmVnbm8mIzMyOyZsdDsNCiZndDsmIzMyO2FuZ2Vs
b2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbSZndDsNCiZndDsmIzMyOy0tLQ0KJmd0
OyYjMzI7JiMzMjtkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwLmMmIzMyO3wmIzMyOzE1
JiMzMjsrKysrKysrKysrLS0tLS0NCiZndDsmIzMyOyYjMzI7MSYjMzI7ZmlsZSYjMzI7Y2hhbmdl
ZCwmIzMyOzEwJiMzMjtpbnNlcnRpb25zKCspLCYjMzI7NSYjMzI7ZGVsZXRpb25zKC0pDQomZ3Q7
JiMzMjsNCiZndDsmIzMyO2RpZmYmIzMyOy0tZ2l0JiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHAuYw0KJmd0OyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rw
LmMNCiZndDsmIzMyO2luZGV4JiMzMjs2NGVlZTc3NDUyYzAuLmM1OGI3NzU4NzdhMyYjMzI7MTAw
NjQ0DQomZ3Q7JiMzMjstLS0mIzMyO2EvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcC5j
DQomZ3Q7JiMzMjsrKysmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcC5jDQom
Z3Q7JiMzMjtAQCYjMzI7LTE1ODgsNyYjMzI7KzE1ODgsOSYjMzI7QEAmIzMyO3N0YXRpYyYjMzI7
aW50JiMzMjttdGtfZHBfcGFyc2VfY2FwYWJpbGl0aWVzKHN0cnVjdA0KJmd0OyYjMzI7bXRrX2Rw
JiMzMjsqbXRrX2RwKQ0KJmd0OyYjMzI7JiMzMjt1OCYjMzI7dmFsOw0KJmd0OyYjMzI7JiMzMjtz
c2l6ZV90JiMzMjtyZXQ7DQomZ3Q7JiMzMjsmIzMyOw0KJmd0OyYjMzI7LWRybV9kcF9yZWFkX2Rw
Y2RfY2FwcygmYW1wO210a19kcC0mZ3Q7YXV4LCYjMzI7bXRrX2RwLSZndDtyeF9jYXApOw0KJmd0
OyYjMzI7K3JldCYjMzI7PSYjMzI7ZHJtX2RwX3JlYWRfZHBjZF9jYXBzKCZhbXA7bXRrX2RwLSZn
dDthdXgsJiMzMjttdGtfZHAtJmd0O3J4X2NhcCk7DQomZ3Q7JiMzMjsraWYmIzMyOyhyZXQmIzMy
OyZsdDsmIzMyOzApDQomZ3Q7JiMzMjsrcmV0dXJuJiMzMjtyZXQ7DQomZ3Q7JiMzMjsmIzMyOw0K
Jmd0OyYjMzI7JiMzMjtpZiYjMzI7KGRybV9kcF90cHM0X3N1cHBvcnRlZChtdGtfZHAtJmd0O3J4
X2NhcCkpDQomZ3Q7JiMzMjsmIzMyO210a19kcC0mZ3Q7dHJhaW5faW5mby5jaGFubmVsX2VxX3Bh
dHRlcm4mIzMyOz0NCiZndDsmIzMyO0RQX1RSQUlOSU5HX1BBVFRFUk5fNDsNCiZndDsmIzMyO0BA
JiMzMjstMTYxNSwxMCYjMzI7KzE2MTcsMTMmIzMyO0BAJiMzMjtzdGF0aWMmIzMyO2ludCYjMzI7
bXRrX2RwX3BhcnNlX2NhcGFiaWxpdGllcyhzdHJ1Y3QNCiZndDsmIzMyO210a19kcCYjMzI7Km10
a19kcCkNCiZndDsmIzMyOyYjMzI7cmV0dXJuJiMzMjtyZXQmIzMyOz09JiMzMjswJiMzMjsmIzYz
OyYjMzI7LUVJTyYjMzI7OiYjMzI7cmV0Ow0KJmd0OyYjMzI7JiMzMjt9DQomZ3Q7JiMzMjsmIzMy
Ow0KJmd0OyYjMzI7LWlmJiMzMjsodmFsKQ0KJmd0OyYjMzI7LWRybV9kcF9kcGNkX3dyaXRlYigm
YW1wO210a19kcC0mZ3Q7YXV4LA0KJmd0OyYjMzI7LSYjMzI7JiMzMjsmIzMyO0RQX0RFVklDRV9T
RVJWSUNFX0lSUV9WRUNUT1INCiZndDsmIzMyO19FU0kwLA0KJmd0OyYjMzI7LSYjMzI7JiMzMjsm
IzMyO3ZhbCk7DQomZ3Q7JiMzMjsraWYmIzMyOyh2YWwpJiMzMjt7DQomZ3Q7JiMzMjsrcmV0JiMz
Mjs9JiMzMjtkcm1fZHBfZHBjZF93cml0ZWIoJmFtcDttdGtfZHAtJmd0O2F1eCwNCiZndDsmIzMy
OysmIzMyO0RQX0RFVklDRV9TRVJWSUNFX0lSUV8NCiZndDsmIzMyO1ZFQ1RPUl9FU0kwLA0KJmd0
OyYjMzI7KyYjMzI7dmFsKTsNCiZndDsmIzMyOytpZiYjMzI7KHJldCYjMzI7Jmx0OyYjMzI7MCkN
CiZndDsmIzMyOytyZXR1cm4mIzMyO3JldDsNCiZndDsmIzMyOyt9DQomZ3Q7JiMzMjsmIzMyO30N
CiZndDsmIzMyOyYjMzI7DQomZ3Q7JiMzMjsmIzMyO3JldHVybiYjMzI7MDsNCiZndDsmIzMyOy0t
JiMzMjsNCiZndDsmIzMyOzIuNDAuMQ0KDQo8L3ByZT48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48
cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZSAqKioqKioq
KioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBt
ZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRpYWws
IHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Ns
b3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZl
eWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1p
bmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9m
IHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQg
cmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVs
LiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9y
IGJlbGlldmUgDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBw
bGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhp
cyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwgKGlu
Y2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRp
c2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRo
YW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_003_508658109.855922996
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEFuZ2VsbzoNCg0KT24gTW9uLCAyMDIzLTA3LTE3IGF0IDE2OjE0ICswMjAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gIAkgDQo+IEV4dGVybmFsIGVtYWlsIDogUGxl
YXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBo
YXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+ICBJZiByZWFkaW5nIHRo
ZSBSWCBjYXBhYmlsaXRpZXMgZmFpbHMgdGhlIHRyYWluaW5nIHBhdHRlcm4gd2lsbCBiZQ0KPiBz
ZXQNCj4gd3JvbmdseTogYWRkIGVycm9yIGNoZWNraW5nIGZvciBkcm1fZHBfcmVhZF9kcGNkX2Nh
cHMoKSBhbmQgcmV0dXJuIGlmDQo+IGFueXRoaW5nIHdlbnQgd3Jvbmcgd2l0aCBpdC4NCj4gDQo+
IFdoaWxlIGF0IGl0LCBhbHNvIGFkZCBhIGxlc3MgY3JpdGljYWwgZXJyb3IgY2hlY2sgd2hlbiB3
cml0aW5nIHRvDQo+IGNsZWFyIHRoZSBFU0kwIElSUSB2ZWN0b3IuDQoNClJldml3ZWQtYnk6IENL
IEh1IDxjay5odUBtZWRpYXRlay5jb20+DQoNCj4gDQo+IEZpeGVzOiBmNzBhYzA5N2EyY2YgKCJk
cm0vbWVkaWF0ZWs6IEFkZCBNVDgxOTUgRW1iZWRkZWQgRGlzcGxheVBvcnQNCj4gZHJpdmVyIikN
Cj4gU2lnbmVkLW9mZi1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPA0KPiBhbmdlbG9n
aW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kcC5jIHwgMTUgKysrKysrKysrKy0tLS0tDQo+ICAxIGZpbGUgY2hh
bmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RwLmMNCj4gaW5kZXggNjRlZWU3NzQ1MmMwLi5jNThiNzc1ODc3YTMgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHAuYw0KPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwLmMNCj4gQEAgLTE1ODgsNyArMTU4OCw5IEBA
IHN0YXRpYyBpbnQgbXRrX2RwX3BhcnNlX2NhcGFiaWxpdGllcyhzdHJ1Y3QNCj4gbXRrX2RwICpt
dGtfZHApDQo+ICAJdTggdmFsOw0KPiAgCXNzaXplX3QgcmV0Ow0KPiAgDQo+IC0JZHJtX2RwX3Jl
YWRfZHBjZF9jYXBzKCZtdGtfZHAtPmF1eCwgbXRrX2RwLT5yeF9jYXApOw0KPiArCXJldCA9IGRy
bV9kcF9yZWFkX2RwY2RfY2FwcygmbXRrX2RwLT5hdXgsIG10a19kcC0+cnhfY2FwKTsNCj4gKwlp
ZiAocmV0IDwgMCkNCj4gKwkJcmV0dXJuIHJldDsNCj4gIA0KPiAgCWlmIChkcm1fZHBfdHBzNF9z
dXBwb3J0ZWQobXRrX2RwLT5yeF9jYXApKQ0KPiAgCQltdGtfZHAtPnRyYWluX2luZm8uY2hhbm5l
bF9lcV9wYXR0ZXJuID0NCj4gRFBfVFJBSU5JTkdfUEFUVEVSTl80Ow0KPiBAQCAtMTYxNSwxMCAr
MTYxNywxMyBAQCBzdGF0aWMgaW50IG10a19kcF9wYXJzZV9jYXBhYmlsaXRpZXMoc3RydWN0DQo+
IG10a19kcCAqbXRrX2RwKQ0KPiAgCQkJcmV0dXJuIHJldCA9PSAwID8gLUVJTyA6IHJldDsNCj4g
IAkJfQ0KPiAgDQo+IC0JCWlmICh2YWwpDQo+IC0JCQlkcm1fZHBfZHBjZF93cml0ZWIoJm10a19k
cC0+YXV4LA0KPiAtCQkJCQkgICBEUF9ERVZJQ0VfU0VSVklDRV9JUlFfVkVDVE9SDQo+IF9FU0kw
LA0KPiAtCQkJCQkgICB2YWwpOw0KPiArCQlpZiAodmFsKSB7DQo+ICsJCQlyZXQgPSBkcm1fZHBf
ZHBjZF93cml0ZWIoJm10a19kcC0+YXV4LA0KPiArCQkJCQkJIERQX0RFVklDRV9TRVJWSUNFX0lS
UV8NCj4gVkVDVE9SX0VTSTAsDQo+ICsJCQkJCQkgdmFsKTsNCj4gKwkJCWlmIChyZXQgPCAwKQ0K
PiArCQkJCXJldHVybiByZXQ7DQo+ICsJCX0NCj4gIAl9DQo+ICANCj4gIAlyZXR1cm4gMDsNCj4g
LS0gDQo+IDIuNDAuMQ0K

--__=_Part_Boundary_003_508658109.855922996--

