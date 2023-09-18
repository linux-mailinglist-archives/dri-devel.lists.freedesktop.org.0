Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D027A41CA
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 09:10:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48C6310E1AC;
	Mon, 18 Sep 2023 07:10:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E283C10E1AC
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 07:10:11 +0000 (UTC)
X-UUID: 660292d655f211eea33bb35ae8d461a2-20230918
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=uTBMpYk9/h7MEkS2JLEZtn641tzqr2hz0CwdHluexAk=; 
 b=CCoUrnCSFBA6fc/m+p6HqyGn8swk1hzVlDeVONzGZO030Zg0tu/VGv+l4GNkm7qjDVfG1kM9ri5LDZT3laLABzFLuZw7ql2RbUEM9fXnwiKa4You6/Xrkd4fHsOpP54ijqG9QvsUcLI/oOIB0M85IagI7JgGyGbedTZ0r6ySp1w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31, REQID:93fb07fd-de11-4b39-acbb-697f30128b09, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:0ad78a4, CLOUDID:93cfd1ef-9a6e-4c39-b73e-f2bc08ca3dc5,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 660292d655f211eea33bb35ae8d461a2-20230918
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 619868087; Mon, 18 Sep 2023 15:10:07 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 18 Sep 2023 15:10:06 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Mon, 18 Sep 2023 15:10:06 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IedQt5+2JdHr6pvWqOxyBGRYeX34W+XQZJBRrP1+CHrKK2c3N4X2iJh/wlwT7kXBIX/1XGK3qDuJDZEsb337K/ygOJ8pS1sLpNj3sGIWEKxR0YDZpQxlkDhOkZgKPLBTA3RMnQHjyYzBWWVxvZgHn346gpnUVSqSPCgEKGs0TwZeBjiktt6r0bpTE28wBrxttCdT9jx4XwFFiBu9pMprkefLGlQQ/Eo8yiM8BogYRSwDwjcRB/KaaCI3/8I0l9SiiI99O3ugy2UYApDF3bZGGFoKtj9CzHBYa59hFfZ355Gz68xPlikUoaK7exn3hMS0jsYt24CMV8gn7Zn8DRwCWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z9GKyutHwnnk2dAronUIquVAcLgI5mIwwaLLSIeCf/k=;
 b=GX0vVvlFwlUcc4PEaNHyPeKx3FJnjVI0CDVRLV2fNMlvcpTBO7fnUreomNHhJxGzLKXXRDYA2Ol4DWSTZKFZ/6O6Xp0YZtByguUWgzbylGhyw+XECirOTACzX5hs8BAYX6vyiRgRbm8+XYEcb38YdeWe+Q5s+FLSpfu1ZaqYA1g3tK5i1WtClmj0RnqWf6no0u5yv+hSkrMYULjPG2gXvOGYYgS+aRTVqw4UX5BREikfAg7xGkLqqCJujIG2o/hmbO4ER8A16EYm8AynibA0vyhrc5JcIuj7Ftgm5WvkUiIvbsfXxse8SE0q+FK2zcyAadZclWpET64d5v0bJJqcQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z9GKyutHwnnk2dAronUIquVAcLgI5mIwwaLLSIeCf/k=;
 b=OJQutVIB2baEmZ7eQ6fHQyOhSWZtubXbl0pcwUszBvILS8FaL2XzEtzZzCuZhp+lIrzA/F9zEIgOT92ZKn6G4khlAvMVd+EgImmYen6hYYhV3sCTPpu54KsJipXeM/4nhOUcvdRHtAmaAJkgg9X68qQpgibucS4Pys8VXxXYFSE=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYSPR03MB7581.apcprd03.prod.outlook.com (2603:1096:400:40e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.24; Mon, 18 Sep
 2023 07:10:03 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9c2c:c08a:212f:e984]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9c2c:c08a:212f:e984%6]) with mapi id 15.20.6792.022; Mon, 18 Sep 2023
 07:10:03 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, 
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "eugen.hristev@collabora.com"
 <eugen.hristev@collabora.com>
Subject: Re: [PATCH v9 6/7] drm/mediatek: dsi: Support dynamic connector
 selection
Thread-Topic: [PATCH v9 6/7] drm/mediatek: dsi: Support dynamic connector
 selection
Thread-Index: AQHZyu2PCfr/LUydHUCbIUSxcLEeD7AgaG6A
Date: Mon, 18 Sep 2023 07:10:03 +0000
Message-ID: <19a32b7eba540c4ef7dda990bac95f88335f5fe5.camel@mediatek.com>
References: <20230809181525.7561-1-jason-jh.lin@mediatek.com>
 <20230809181525.7561-7-jason-jh.lin@mediatek.com>
In-Reply-To: <20230809181525.7561-7-jason-jh.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYSPR03MB7581:EE_
x-ms-office365-filtering-correlation-id: 63c34d74-872c-46ca-c68d-08dbb81647e5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nbB/DVMP5pFmTvkj0a48dXESynhWVdgvUaSzevtH5SwEAN98UKpA8jdmXeZ2PQqKoMSVwZqwIfueIdmfrqdPm8OSrfEY8Kp8U45nUjwijvPKccngrryYb2uA7axBUFtUexafyRqMTQjgg2/LREIj8lOkw4XSdMdM6kCY61BksW9vJNxOo4Id9BAqfDU5mTrAdTzGkDzbtfAbjmnHsVzoA3SIctbdfx5w0b+2CDnEL6RaWBZcGbzmH17EGKewyUFB/rbKlOajLY+VF2d5VxQoC8lQDiBsXTUzZVw0pOG5DQYFcP1SKrgaBxOeeHdtStlo5Dm7jX78raTVqrbUUWMzpEcHpOpI5bCmont5FL7azXYucwiFNOla0KTno13G7FtSyBzXAqMfik+WKUhP+p/nXGEGWpDp86PzATs6ETpDXqp3EXPx90PViGWMpwAy1FVhFiJJVKOGkcQaE8WfZ6WXazPW/sgdVHgKwgoQzABh8i1NKKgeyDSvSKNt9tl4z88Mn54gNx0wpIHCxGQbr5uBEOXr6Rrob7x3m7C5gWfldY2X4is9KlrmHImWzejfpEwtWXE3rMmPBiK2OKvDBHbE1SSiYL3uUXk1Lgi4LkCU6bh3zVfUfeqIoc2dI0U2HgUYM8N0dmxqVBHop0skuY3mJZoro+m2xOqrPAkWx7rOXKQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(136003)(376002)(346002)(39860400002)(186009)(451199024)(1800799009)(2906002)(5660300002)(26005)(41300700001)(76116006)(316002)(66476007)(54906003)(64756008)(66556008)(66446008)(66946007)(110136005)(478600001)(8936002)(8676002)(4326008)(6506007)(6486002)(71200400001)(6512007)(2616005)(36756003)(38100700002)(85182001)(122000001)(38070700005)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NVhVa3VGdnc3RzZNMUVoTlpiN1ZRNUJlOUdmNzFYcS90ck9RSWpyeXdTYVJP?=
 =?utf-8?B?eE85T1EzWkhpdUs1Yzc2a1hDS2tLWWo2bUU1VHBSNnM4Y29BeC9tSm9US2tO?=
 =?utf-8?B?UTh6NzlsdTFaT0oxUkJ5anVwZHRqK2V4Q2tBM3RrSDZsUUFQRzBsOWk3ZkJV?=
 =?utf-8?B?Q2d2dEcwOU5VVy9RUEtFN2NrdndZNk0zeFNnN1pCYTlidTAxalhwb3NhTjF0?=
 =?utf-8?B?UGM3ckxIMUxTOC9lbDhJNVV6d1NZY0VrSjdySXFZVE1TY0xnd1ZBdG9rNEJG?=
 =?utf-8?B?NnZPaVVHQW1WaXN3dGRra0U0cW9udmVoSnpoN01LaFdnYzZlOEhDejJmNVhk?=
 =?utf-8?B?NVFaS2FycllJVDJxVnlKcVg1OHZVdm5IZmVFOERFeno4S2NDUVhnNXVaZGhp?=
 =?utf-8?B?TlhRL3NmT0NKMjhwWGR2YjVDaDlvdkRaOUZzV1VSS1JHVXdWQmRseEk1QmZJ?=
 =?utf-8?B?S09PR1NoT2p3ZVcvSnY0TGxZMjg5TVEvelFKY1d1Q0FmQStCTEVPNWhvZWtP?=
 =?utf-8?B?Qk5lUGJjbXhFbWNDR3FsTzNmdVFOMksxcEs4STBpZ2pnM3hSRTBuYUs4ZWQ5?=
 =?utf-8?B?ZkxiZWJOUFU5ZTFmVTBwTXNXQU5HbFgrWGY0cExybnRtcFllajZsdzNVMHR0?=
 =?utf-8?B?QVhBSGZTcXZTcHZGT1IrcWVHYlMwL2Y5L2JncklLSWx3QmJqeEZqV3NlQ0pJ?=
 =?utf-8?B?TUhxbEdEZS9leG5tSGVxV0Z2Q3J1bS90M3R6b1VLSnM2UGUrYXZnN3RQd2xz?=
 =?utf-8?B?cldRN0QybEZQNFYxSmxEZTBjQUdYZ2JHYzdJUzAxbmxyTzBJOTNDL2crQnFV?=
 =?utf-8?B?ZmJXOFh1RDhUeWNjVGd1OHNGMmhmKzU1VURLUmFZQkh4enB3clZPR08zOTUx?=
 =?utf-8?B?a2pKRnFIY0k3Tlgrc3VZUE01Tlh2NXZ0dG0yeWk1RVhUbVk2NWpNNHplOWpG?=
 =?utf-8?B?WTRNeW1JVUNDN1RFN1R0eFdxK0hTKzV5ZFh5eWJQdFNlQ3g5YlNwaGlyekJ0?=
 =?utf-8?B?V081eG5sVXlqTnRlaDJzdlUvWHZZdENpNXJiR2U0K0EyZlRKbHpMU0s0OE42?=
 =?utf-8?B?SDE1cXYxR0YxK0VxWVlvaUNIVEVoVEhIUjlnKzFmWm10dGp3dFdCY2QzUEdn?=
 =?utf-8?B?NFJxSUFTSzdhNk9mSVA0alFxa2RxMTB2Rlg5V1JSRzd4QkMxQXhIMng1UVA5?=
 =?utf-8?B?Ukh5NzZWVlNhLzhTb0MvUm1Zc0pNbWpYYzZNK0xaZExvNVFkNTIrbTJMem5I?=
 =?utf-8?B?VGFCR1V3S3ErNEY5K2FlbzMvcVp1eC9BeFZEQlFlZVZhVjVleUdyVXFmdHV0?=
 =?utf-8?B?L2cxTHV0Y1p6Tk4xOTBMU2M5ZG4zVzNWcml5Qmp5WDdueE5tekM5VkIreURS?=
 =?utf-8?B?Y01RdWlOVGtFMW9ZMmJXaktYMUs5QzBkMmJ5ZEQ5V3ZyMlg2RStYN1JoMEdI?=
 =?utf-8?B?R1pqNEcwSDgvMFpnV1dJUU9NbThiSGZQY2EzTjlWamluNHE0OTJ5YW9TMEJp?=
 =?utf-8?B?MVJ5cUVYTGFCVUZqZ2RKY0JMWTNncU9aUG1VcW4rY1B3cXFvaXlZVllsaDJk?=
 =?utf-8?B?Q3QyQWR4YnYyTHhZbXFLRmlZbGpzMzBmNGMxdlJqTU1TV3JUUm5uNnQ1OGQ2?=
 =?utf-8?B?Z1dhRzN5dHlCTFh2ZkM0akRsaG52VE5QSlYxRVhkaEtJU1pJOU12ZGpTcWdR?=
 =?utf-8?B?dVVlWW1XUHRWVU1pL2xCejZiVCtvalRMZ2VNYThTblp1dFU4VVJwaGxiYkZ5?=
 =?utf-8?B?UGkvWVJXYndTSy9MNXpTY3JLRlZ5VlBrNFIzb1NXUXhWektZTk91R1RlTW01?=
 =?utf-8?B?Mis1VjZON0RZbkR3azBaWVcwMUhaL2RIeFllRFA0MnF5MUxrUExDNVZTd2Mw?=
 =?utf-8?B?NmgwYlQ5d3NVMlNoa1BMTWpsTFlPMHl1L0h6aFJwZ0QremhqWXUwaW52Tkxm?=
 =?utf-8?B?eC9WUDYyK1gxN0lvZTF3QUs4UTNabVVPTWowVFlmTllTZE9rYmIwcVlRNlkw?=
 =?utf-8?B?WThPWmRZYUJobzZBdFZMZG4yQnB0M0FEbjA4TUlIMTRqMXBEempLdlNFMitJ?=
 =?utf-8?B?aHlWUWFwL3BNQUg5L00wME14L2VvUzBLSkcra3JmMlZLWlByTFFOUllJajNH?=
 =?utf-8?Q?zOIcVayodGx/wqsraDm9soxWi?=
Content-ID: <A572D7B10A732345A86A03FCF02A3B8B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63c34d74-872c-46ca-c68d-08dbb81647e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2023 07:10:03.7993 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zgzqOZmyzMKy1CABDulK9vBcDMfBIlDnVSn6j4JgUqKkcGdtr9JnBNJv1a8kxh5vz2OO834D1OXBXs4BKcjkNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7581
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_003_912827678.424572630"
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
Cc: =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?utf-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?= <Jason-ch.Chen@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 =?utf-8?B?Sm9obnNvbiBXYW5nICjnjovogZbpkasp?= <Johnson.Wang@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_003_912827678.424572630
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpLCYjMzI7SmFzb246DQoNCk9uJiMzMjtUaHUsJiMzMjsyMDIzLTA4LTEwJiMzMjth
dCYjMzI7MDI6MTUmIzMyOyswODAwLCYjMzI7SmFzb24tSkguTGluJiMzMjt3cm90ZToNCiZndDsm
IzMyO0FkZCYjMzI7aW1wbGVtZW50YXRpb24mIzMyO29mJiMzMjttdGtfZHNpX2VuY29kZXJfaW5k
ZXgmIzMyO3RvJiMzMjttdGtfZGRwX2NvbXBfZnVuYw0KJmd0OyYjMzI7dG8mIzMyO21ha2UmIzMy
O210a19kc2kmIzMyO3N1cHBvcnQmIzMyO2R5bmFtaWMmIzMyO2Nvbm5lY3RvciYjMzI7c2VsZWN0
aW9uLg0KDQpSZXZpZXdlZC1ieTomIzMyO0NLJiMzMjtIdSYjMzI7Jmx0O2NrLmh1QG1lZGlhdGVr
LmNvbSZndDsNCg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtTaWduZWQtb2ZmLWJ5OiYjMzI7SmFzb24t
SkguTGluJiMzMjsmbHQ7amFzb24tamgubGluQG1lZGlhdGVrLmNvbSZndDsNCiZndDsmIzMyOy0t
LQ0KJmd0OyYjMzI7JiMzMjtkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfZHJ2Lmgm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7fCYjMzI7MSYjMzI7Kw0KJmd0OyYjMzI7JiMzMjtkcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jJiMzMjt8JiMzMjsxJiMzMjsr
DQomZ3Q7JiMzMjsmIzMyO2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3wmIzMyOzkmIzMyOysr
KysrKysrKw0KJmd0OyYjMzI7JiMzMjszJiMzMjtmaWxlcyYjMzI7Y2hhbmdlZCwmIzMyOzExJiMz
MjtpbnNlcnRpb25zKCspDQomZ3Q7JiMzMjsNCiZndDsmIzMyO2RpZmYmIzMyOy0tZ2l0JiMzMjth
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9kcnYuaA0KJmd0OyYjMzI7Yi9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfZHJ2LmgNCiZndDsmIzMyO2luZGV4JiMzMjs1
ZjA3MDM3NjcwZTkuLmZkYWEyMWI2YTlkYSYjMzI7MTAwNjQ0DQomZ3Q7JiMzMjstLS0mIzMyO2Ev
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX2Rydi5oDQomZ3Q7JiMzMjsrKysmIzMy
O2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX2Rydi5oDQomZ3Q7JiMzMjtAQCYj
MzI7LTQ4LDYmIzMyOys0OCw3JiMzMjtAQCYjMzI7dW5zaWduZWQmIzMyO2ludCYjMzI7bXRrX2Rw
aV9lbmNvZGVyX2luZGV4KHN0cnVjdCYjMzI7ZGV2aWNlDQomZ3Q7JiMzMjsqZGV2KTsNCiZndDsm
IzMyOyYjMzI7DQomZ3Q7JiMzMjsmIzMyO3ZvaWQmIzMyO210a19kc2lfZGRwX3N0YXJ0KHN0cnVj
dCYjMzI7ZGV2aWNlJiMzMjsqZGV2KTsNCiZndDsmIzMyOyYjMzI7dm9pZCYjMzI7bXRrX2RzaV9k
ZHBfc3RvcChzdHJ1Y3QmIzMyO2RldmljZSYjMzI7KmRldik7DQomZ3Q7JiMzMjsrdW5zaWduZWQm
IzMyO2ludCYjMzI7bXRrX2RzaV9lbmNvZGVyX2luZGV4KHN0cnVjdCYjMzI7ZGV2aWNlJiMzMjsq
ZGV2KTsNCiZndDsmIzMyOyYjMzI7DQomZ3Q7JiMzMjsmIzMyO2ludCYjMzI7bXRrX2dhbW1hX2Ns
a19lbmFibGUoc3RydWN0JiMzMjtkZXZpY2UmIzMyOypkZXYpOw0KJmd0OyYjMzI7JiMzMjt2b2lk
JiMzMjttdGtfZ2FtbWFfY2xrX2Rpc2FibGUoc3RydWN0JiMzMjtkZXZpY2UmIzMyOypkZXYpOw0K
Jmd0OyYjMzI7ZGlmZiYjMzI7LS1naXQmIzMyO2EvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcm1fZGRwX2NvbXAuYw0KJmd0OyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RybV9kZHBfY29tcC5jDQomZ3Q7JiMzMjtpbmRleCYjMzI7YzFlYTExMmU2YmU4Li5jOTNiMWJh
ZTAwZGMmIzMyOzEwMDY0NA0KJmd0OyYjMzI7LS0tJiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHJtX2RkcF9jb21wLmMNCiZndDsmIzMyOysrKyYjMzI7Yi9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jDQomZ3Q7JiMzMjtAQCYjMzI7LTMxOCw2JiMz
MjsrMzE4LDcmIzMyO0BAJiMzMjtzdGF0aWMmIzMyO2NvbnN0JiMzMjtzdHJ1Y3QmIzMyO210a19k
ZHBfY29tcF9mdW5jcyYjMzI7ZGRwX2RzYyYjMzI7PQ0KJmd0OyYjMzI7ew0KJmd0OyYjMzI7JiMz
MjtzdGF0aWMmIzMyO2NvbnN0JiMzMjtzdHJ1Y3QmIzMyO210a19kZHBfY29tcF9mdW5jcyYjMzI7
ZGRwX2RzaSYjMzI7PSYjMzI7ew0KJmd0OyYjMzI7JiMzMjsuc3RhcnQmIzMyOz0mIzMyO210a19k
c2lfZGRwX3N0YXJ0LA0KJmd0OyYjMzI7JiMzMjsuc3RvcCYjMzI7PSYjMzI7bXRrX2RzaV9kZHBf
c3RvcCwNCiZndDsmIzMyOysuZW5jb2Rlcl9pbmRleCYjMzI7PSYjMzI7bXRrX2RzaV9lbmNvZGVy
X2luZGV4LA0KJmd0OyYjMzI7JiMzMjt9Ow0KJmd0OyYjMzI7JiMzMjsNCiZndDsmIzMyOyYjMzI7
c3RhdGljJiMzMjtjb25zdCYjMzI7c3RydWN0JiMzMjttdGtfZGRwX2NvbXBfZnVuY3MmIzMyO2Rk
cF9nYW1tYSYjMzI7PSYjMzI7ew0KJmd0OyYjMzI7ZGlmZiYjMzI7LS1naXQmIzMyO2EvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYw0KJmd0OyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RzaS5jDQomZ3Q7JiMzMjtpbmRleCYjMzI7N2Q1MjUwMzUxMTkzLi44YzQ1
ZGMxOWQzOWYmIzMyOzEwMDY0NA0KJmd0OyYjMzI7LS0tJiMzMjthL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHNpLmMNCiZndDsmIzMyOysrKyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RzaS5jDQomZ3Q7JiMzMjtAQCYjMzI7LTg2NSw2JiMzMjsrODY1LDE1JiMzMjtA
QCYjMzI7c3RhdGljJiMzMjtpbnQmIzMyO210a19kc2lfZW5jb2Rlcl9pbml0KHN0cnVjdA0KJmd0
OyYjMzI7ZHJtX2RldmljZSYjMzI7KmRybSwmIzMyO3N0cnVjdCYjMzI7bXRrX2RzaSYjMzI7KmRz
aSkNCiZndDsmIzMyOyYjMzI7cmV0dXJuJiMzMjtyZXQ7DQomZ3Q7JiMzMjsmIzMyO30NCiZndDsm
IzMyOyYjMzI7DQomZ3Q7JiMzMjsrdW5zaWduZWQmIzMyO2ludCYjMzI7bXRrX2RzaV9lbmNvZGVy
X2luZGV4KHN0cnVjdCYjMzI7ZGV2aWNlJiMzMjsqZGV2KQ0KJmd0OyYjMzI7K3sNCiZndDsmIzMy
OytzdHJ1Y3QmIzMyO210a19kc2kmIzMyOypkc2kmIzMyOz0mIzMyO2Rldl9nZXRfZHJ2ZGF0YShk
ZXYpOw0KJmd0OyYjMzI7K3Vuc2lnbmVkJiMzMjtpbnQmIzMyO2VuY29kZXJfaW5kZXgmIzMyOz0m
IzMyO2RybV9lbmNvZGVyX2luZGV4KCZhbXA7ZHNpLSZndDtlbmNvZGVyKTsNCiZndDsmIzMyOysN
CiZndDsmIzMyOytkZXZfZGJnKGRldiwmIzMyOyZxdW90O2VuY29kZXImIzMyO2luZGV4OiVkJiM5
MjtuJnF1b3Q7LCYjMzI7ZW5jb2Rlcl9pbmRleCk7DQomZ3Q7JiMzMjsrcmV0dXJuJiMzMjtlbmNv
ZGVyX2luZGV4Ow0KJmd0OyYjMzI7K30NCiZndDsmIzMyOysNCiZndDsmIzMyOyYjMzI7c3RhdGlj
JiMzMjtpbnQmIzMyO210a19kc2lfYmluZChzdHJ1Y3QmIzMyO2RldmljZSYjMzI7KmRldiwmIzMy
O3N0cnVjdCYjMzI7ZGV2aWNlJiMzMjsqbWFzdGVyLA0KJmd0OyYjMzI7dm9pZCYjMzI7KmRhdGEp
DQomZ3Q7JiMzMjsmIzMyO3sNCiZndDsmIzMyOyYjMzI7aW50JiMzMjtyZXQ7DQoNCjwvcHJlPjwh
LS10eXBlOnRleHQtLT48IS0tey0tPjxwcmU+KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRl
bnRpYWxpdHkgTm90aWNlICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29u
dGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50
cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVy
d2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlz
IGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGll
bnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywg
cmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRh
Y2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRl
ZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lw
aWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZSANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQg
dGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0
ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3Bp
ZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3Vy
IHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwg
dG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_003_912827678.424572630
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEphc29uOg0KDQpPbiBUaHUsIDIwMjMtMDgtMTAgYXQgMDI6MTUgKzA4MDAsIEphc29uLUpI
LkxpbiB3cm90ZToNCj4gQWRkIGltcGxlbWVudGF0aW9uIG9mIG10a19kc2lfZW5jb2Rlcl9pbmRl
eCB0byBtdGtfZGRwX2NvbXBfZnVuYw0KPiB0byBtYWtlIG10a19kc2kgc3VwcG9ydCBkeW5hbWlj
IGNvbm5lY3RvciBzZWxlY3Rpb24uDQoNClJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0
ZWsuY29tPg0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbi1KSC5MaW4gPGphc29uLWpoLmxp
bkBtZWRpYXRlay5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
aXNwX2Rydi5oICAgICB8IDEgKw0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1f
ZGRwX2NvbXAuYyB8IDEgKw0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyAg
ICAgICAgICB8IDkgKysrKysrKysrDQo+ICAzIGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMo
KykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bf
ZHJ2LmgNCj4gYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfZHJ2LmgNCj4gaW5k
ZXggNWYwNzAzNzY3MGU5Li5mZGFhMjFiNmE5ZGEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZGlzcF9kcnYuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2Rpc3BfZHJ2LmgNCj4gQEAgLTQ4LDYgKzQ4LDcgQEAgdW5zaWduZWQgaW50IG10
a19kcGlfZW5jb2Rlcl9pbmRleChzdHJ1Y3QgZGV2aWNlDQo+ICpkZXYpOw0KPiAgDQo+ICB2b2lk
IG10a19kc2lfZGRwX3N0YXJ0KHN0cnVjdCBkZXZpY2UgKmRldik7DQo+ICB2b2lkIG10a19kc2lf
ZGRwX3N0b3Aoc3RydWN0IGRldmljZSAqZGV2KTsNCj4gK3Vuc2lnbmVkIGludCBtdGtfZHNpX2Vu
Y29kZXJfaW5kZXgoc3RydWN0IGRldmljZSAqZGV2KTsNCj4gIA0KPiAgaW50IG10a19nYW1tYV9j
bGtfZW5hYmxlKHN0cnVjdCBkZXZpY2UgKmRldik7DQo+ICB2b2lkIG10a19nYW1tYV9jbGtfZGlz
YWJsZShzdHJ1Y3QgZGV2aWNlICpkZXYpOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHJtX2RkcF9jb21wLmMNCj4gaW5kZXggYzFlYTExMmU2YmU4Li5jOTNiMWJhZTAwZGMg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21w
LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYw0K
PiBAQCAtMzE4LDYgKzMxOCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2RkcF9jb21wX2Z1
bmNzIGRkcF9kc2MgPQ0KPiB7DQo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG10a19kZHBfY29tcF9m
dW5jcyBkZHBfZHNpID0gew0KPiAgCS5zdGFydCA9IG10a19kc2lfZGRwX3N0YXJ0LA0KPiAgCS5z
dG9wID0gbXRrX2RzaV9kZHBfc3RvcCwNCj4gKwkuZW5jb2Rlcl9pbmRleCA9IG10a19kc2lfZW5j
b2Rlcl9pbmRleCwNCj4gIH07DQo+ICANCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2RkcF9j
b21wX2Z1bmNzIGRkcF9nYW1tYSA9IHsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHNpLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5j
DQo+IGluZGV4IDdkNTI1MDM1MTE5My4uOGM0NWRjMTlkMzlmIDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHNpLmMNCj4gQEAgLTg2NSw2ICs4NjUsMTUgQEAgc3RhdGljIGludCBtdGtf
ZHNpX2VuY29kZXJfaW5pdChzdHJ1Y3QNCj4gZHJtX2RldmljZSAqZHJtLCBzdHJ1Y3QgbXRrX2Rz
aSAqZHNpKQ0KPiAgCXJldHVybiByZXQ7DQo+ICB9DQo+ICANCj4gK3Vuc2lnbmVkIGludCBtdGtf
ZHNpX2VuY29kZXJfaW5kZXgoc3RydWN0IGRldmljZSAqZGV2KQ0KPiArew0KPiArCXN0cnVjdCBt
dGtfZHNpICpkc2kgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4gKwl1bnNpZ25lZCBpbnQgZW5j
b2Rlcl9pbmRleCA9IGRybV9lbmNvZGVyX2luZGV4KCZkc2ktPmVuY29kZXIpOw0KPiArDQo+ICsJ
ZGV2X2RiZyhkZXYsICJlbmNvZGVyIGluZGV4OiVkXG4iLCBlbmNvZGVyX2luZGV4KTsNCj4gKwly
ZXR1cm4gZW5jb2Rlcl9pbmRleDsNCj4gK30NCj4gKw0KPiAgc3RhdGljIGludCBtdGtfZHNpX2Jp
bmQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlICptYXN0ZXIsDQo+IHZvaWQgKmRh
dGEpDQo+ICB7DQo+ICAJaW50IHJldDsNCg==

--__=_Part_Boundary_003_912827678.424572630--

