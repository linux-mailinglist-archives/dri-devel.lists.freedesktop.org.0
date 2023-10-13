Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B32A87C7D6E
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 08:06:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63E1B10E5A4;
	Fri, 13 Oct 2023 06:06:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E46CE10E5A4
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 06:06:00 +0000 (UTC)
X-UUID: 90d25c30698e11eea33bb35ae8d461a2-20231013
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=CWIjYogGhgkO2q3LPxvO7hxdupOiDrpGT6jFLb/dxC0=; 
 b=fVvAXX6nq0aO1gqrDHv5V3eN3CQsjRCLY7JqR5S6EeYQCqKqy3IJ/EEzWc2iq4fpKX+lTNzxKinp6z4KN4OKeoUbfl1kWbx/AD+AFXsdzI9W0j8lX8f8YIhMqGlT9DC23KnxIPDX5LIFrvFvosGmcYQvnCx7R89aPHGdnzOTuxM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:69d386d4-5e36-416a-bd3d-01f882f2d564, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5f78ec9, CLOUDID:69f2bef0-9a6e-4c39-b73e-f2bc08ca3dc5,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 90d25c30698e11eea33bb35ae8d461a2-20231013
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <moudy.ho@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1801761714; Fri, 13 Oct 2023 14:05:53 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 13 Oct 2023 14:05:51 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Fri, 13 Oct 2023 14:05:51 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DG/1L8h5kiScGMD51goXimDMGjOp4UBtGAwKA1si/jDhfEZ3RYbMciHO768Loa0do9jRZElMMoFVoAopO2qtKrc5dwQZQ0MhWkKY8WzMQlhFjb+8jf/KRD0Gmii4llne6sMat6ABjM6kYu/STOGO78nPGfg5F7ulQGWXRkxZD+rZl8UavoH3xpa17ee+OdR27/qXW/fAmgbMJCOooMsY5TPhyG7GnN6P4giWxH/ML0rD83Nz8ZybV2LBtW9M6H3NxYlQnDN6lfc0atudHzuhxqCYpxEiVPnUpUWpOXFlBvqIYwoR6ZmvxQbmGjLHOe7M2oV5MaEKac+pf/im2aLT7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CWIjYogGhgkO2q3LPxvO7hxdupOiDrpGT6jFLb/dxC0=;
 b=cdIcchm671F2lfCP10GIOqgxkO+oPCmP1vqfYpsiPGXXfpn4067xfTTerlKPCGkXKw22X+RrY/V5TyhO4KHECDA9xK4+fbsrj3L95TW6/6qX22oNuHxbxyIo9BCdf+4vBOPW8SC6vKHYUrE6m1mdDcppXyKLm5e18V3/srOj5Tm8ppIH6xdrx9P7o4WRnbcMmQ8ib77nf0GmrjxqrTMo660Em5PT4LRzywuSjkLIZpd0SyHo2iMCUxUq0X0rkqwoQEdobutPxTWAnxVfEtaKyu8LXZkpoxDzJVoZhXy/1gk4vfcUwBJ/fqbdSU00k5M+iwM/Ml93TnZes+FovEo/vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CWIjYogGhgkO2q3LPxvO7hxdupOiDrpGT6jFLb/dxC0=;
 b=S4oLpMICpPWBfo3RTAZmgD8RiuJ8uQfYdkv/0aj6duhmF70ledaAIWWjHp++XkwD0YUNcsD1093yldD/Z2oGDGVmWz836FYBw/ysRzVGDgbAdLuV9Fy2HI8d7YuLrIGmh8RVDmnWSypl5B8fSTDFkwCF6qKNSvTqFJKXhNDJBTc=
Received: from TY0PR03MB6356.apcprd03.prod.outlook.com (2603:1096:400:14c::9)
 by PSAPR03MB5445.apcprd03.prod.outlook.com (2603:1096:301:4d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.41; Fri, 13 Oct
 2023 06:05:49 +0000
Received: from TY0PR03MB6356.apcprd03.prod.outlook.com
 ([fe80::3375:b210:ae9a:20af]) by TY0PR03MB6356.apcprd03.prod.outlook.com
 ([fe80::3375:b210:ae9a:20af%6]) with mapi id 15.20.6863.032; Fri, 13 Oct 2023
 06:05:49 +0000
From: =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>, "airlied@gmail.com"
 <airlied@gmail.com>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v7 16/16] dt-bindings: display: mediatek: padding: add
 compatible for MT8195
Thread-Topic: [PATCH v7 16/16] dt-bindings: display: mediatek: padding: add
 compatible for MT8195
Thread-Index: AQHZ/OfiAe/9YpgaWE6wafjFME9AC7BGF1qAgAEldQA=
Date: Fri, 13 Oct 2023 06:05:49 +0000
Message-ID: <9be9be47a54ef2477aea899adfb8f0305c4e5932.camel@mediatek.com>
References: <20231012084037.19376-1-moudy.ho@mediatek.com>
 <20231012084037.19376-17-moudy.ho@mediatek.com>
 <49a4be76-e389-c6aa-6176-41b351c6446a@collabora.com>
In-Reply-To: <49a4be76-e389-c6aa-6176-41b351c6446a@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY0PR03MB6356:EE_|PSAPR03MB5445:EE_
x-ms-office365-filtering-correlation-id: b374fdb2-9b22-40db-d464-08dbcbb27305
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r7rSVbTKvzckivNRo5HJvVibWo9X6TBpKyWPcZGzAR8/PP5bhIwcfLXmNaOklvouOadK8TUByCp7xKVb+eyBZt759uvwd1eeK7Zy5iFxw9ftoQ3kD6GIy1Ab7Y9XPTXBrbNG+dA7UgnwuZWkKc0PEOmRx43gVu46CLh7/paCgWBI3noVPk2HE57PlwRcUvyzX0KGXMjc/7ainwUhBW4q/JMNIZWkD18kuyqmmo99QeGHi5JKi9V+DnaVqcRr3T6ujGfx4wfenoP3yVG8YFddqaIMsUqFtfILBPRUtKlfWZQw24xPoh91aP/HYF8BH5Qb2ZfynpT5ASysNornDgc1vqyVED2O+OrXtPF9lqD8tNR15b3Z44Pf6bTtb5TjeocFeip6MhNEE7GyJptSjLMmUxS5F6MO0anZb4I2MU+yIs3m2zPdegRO7vwyAEezDbfJLQhQWyKDLbjRz3Vh78bmMKB0E7gfBgCVEdNgkezlV101NtdefxY/ja9qsI0s0fxSb6yMbVjMjokrqmIABzQqXiEdlbIlDNxSKtEWJQOR9ApAFB7fix917PZBYp9zQMDpW71H7n2S+Sm24uIx7vMTJX1t9x2pd4YwJtfUJryh9HZ6c+K3BBxGubqTLpKw0PVJXoY+0EO1Atoz3JIUPq5O1zm+y/2q6hzSgRkm5+QVeiKjJEJCveqcFaHcNZflvxbyQcZY54skyr2Olx0z9x6bnA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY0PR03MB6356.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(136003)(376002)(366004)(346002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(85182001)(86362001)(122000001)(38100700002)(38070700005)(36756003)(71200400001)(2616005)(83380400001)(6486002)(8676002)(8936002)(26005)(7416002)(5660300002)(6512007)(6506007)(2906002)(4326008)(76116006)(316002)(66556008)(41300700001)(4001150100001)(66476007)(54906003)(64756008)(66446008)(110136005)(66946007)(478600001)(921005)(99106002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RGtXc3JWVXJxQUo3WSttcm1lWjFDUTh0ODhEblNpRGlFb29pWDM2SE5yaXBi?=
 =?utf-8?B?QUdrdTF0MFAxOWZDOHh6a2wvUVV0am5CUi9zR3N2eUVaY2xUYUNGL1FPTStD?=
 =?utf-8?B?cEgyZXlPS2FLRnZUSCtFK2xZVWJ1RCsxR2VtU0VuVkZwT0hSTGJranlzY0Fl?=
 =?utf-8?B?K1JYejI3K0drUW1yR21LV0hscnBvNUN5UlJXSndUeWZTU3dRTG9RK1AwdTFh?=
 =?utf-8?B?clROMlZ0d3MvSElRMzdpSGtFVHcrZWJ3NnVFejZtbjM4VGl3ZS9QYVVtSU5p?=
 =?utf-8?B?OFR0OTVSTW43Z2htSlJTT0RMeWFaSnZvUGh3N1liNWhOeFpBMmlscHdVcEkw?=
 =?utf-8?B?Z3JJaGMvd2VuMmU3TFovcUhXWkpZWC9MWWtzeXJvWDkwYTVWSXB4eEUvRk4x?=
 =?utf-8?B?WFc4ZS90NU56OG9CUkxtRWk3Z1MzUjlUSmV5R1diZUwzSDZaZUNCZm0yOFd5?=
 =?utf-8?B?eFNUTkZJcVRJeGZBQXZ2bWo1MjJTWGF3dmFlTW9ZbzhrdXpsVVE2ZnFsMnpt?=
 =?utf-8?B?K0gwZE12YUlFbzlXNE5PSXZPcXU3VDZBbEdvdUNPcXA5b21keS9yRFU4QUFY?=
 =?utf-8?B?WjFCT3BpODdBZ052andsTC9mM3hPemJWN2NJWHhZeitJQ2s3YTF4UzY2bDZ3?=
 =?utf-8?B?dmdvUWNWdXZaTHBOMnpyRVFqaFNweTlZcWVLRlJiaHJUY3ZlZ2I0MkxjV3FU?=
 =?utf-8?B?UTM3K2k0RzRmWk5jRmo0aGRkbEduaDZpVksxZ2s5a3VCd0FGQjI4WXBRV2x1?=
 =?utf-8?B?Q056L3N5dkgyODRPcnVidEY2OHNabnhJMUFqRVJHc2x2Q3pXZHIrRUc0VE5t?=
 =?utf-8?B?MFl2QTZ0Ykh0eXg1M1FmSng4Z2pORTFIT0xITTVlSUo4ZmRBZlNLcVFkMFEy?=
 =?utf-8?B?K1M1Y3JTckp1L0I0U1ZHOGlQN0Qxb1l5Q21nYzMreHd1VWRyUnU0N0RXeEJp?=
 =?utf-8?B?V1loSXB3Q2hTOEtrc3dNSlp3dXYySXlGcjc0Zzg1L201OHozU21oZ0w2dE15?=
 =?utf-8?B?MGI0K0xWeVdBZnNvSDJkL0IwQ282SWVEWDdjeWRoUkxjaHNaOFNKeUQ3YTFk?=
 =?utf-8?B?Z2VFeW1mZUh5eEhyNExidEMwWnVwd0hhczcwcGpDWWhFYmIvbGh2ZEE5eVRF?=
 =?utf-8?B?R3ZicmhqdUNZaVJ2ZEpHM2dXaDBMeXlmSVFURlJZaE5QbWtPV0Zza1pyYTJz?=
 =?utf-8?B?QTIweTlZMnQreDFjd1pudVdqNDlMUkgvMDRNUGdVT1pOeVRlZWZGblBBNFU4?=
 =?utf-8?B?V3RFYkk3MzZteGlIZ2lKOElybVkybVhnSnBHM01CSE9SRXYzc1RQYWlUWWM4?=
 =?utf-8?B?NzdtVUR2MTV4NDJxMGg3UnJaTnhQUC9haTFaN1BDb3FiU01ERHBVNCtPdldD?=
 =?utf-8?B?YTNkN2tSYjhlc0wzbW9wWElQYWJ1Q3plMU9JSE1pOFpBMStNT0JuQ3h2UW1x?=
 =?utf-8?B?RWlBWW9IakhZRW1wNWx5eEROQWQ5R2w1alhLREFhM3FmMS9od0hHcWlJUWRH?=
 =?utf-8?B?eGVDQUtvVDZBTHVtR0dQbHhQMEF3VVk4USs4TVViclJPT3VpR2szKzB1b1l2?=
 =?utf-8?B?SjI5anpSRVB0bjBzWDRnOUhudENXL1ZWVmYyN3BzSjhqd1BNdVdaZnFqWGxZ?=
 =?utf-8?B?SzE4cmF6QWZuc2Q5akdSSVFhZzgyYUEwTzdueEFUS1FqdHhjWDR1Z0t3MUlR?=
 =?utf-8?B?WE5NNVZvSzkxZVQwY2pBYlFhMzhXMDhSZEN0bHlKUlhiaE9sMkxDMEN4NDZk?=
 =?utf-8?B?RzRNWkN3bUQ1ZlBqS3NRaVVVNWlBTitLME1OK3UxQUZMRDMwU01pVXoxWUxZ?=
 =?utf-8?B?My9pbGN0ek1LNjRzMnZYdVNwTDJhVGJMSzdaWFEvUUI2U0s2NmFOaW40Y3g4?=
 =?utf-8?B?R2Q3QVJCMm5va3pUaHlUeVFUQWlIZnpRZXF5M1J5RWJFZWVBT2dkZXhJYlVl?=
 =?utf-8?B?bjFCWGRPcUczaHBrK3V1MU1lT0crZzI0ejB1TC96OXNTNWcxRzZQOEZYQXJs?=
 =?utf-8?B?dmIzMWJZOTJ2MmpWWHVMQzdhM285MUZrWE9vQXRZLys0SkZRQnFuVy9Fb3pU?=
 =?utf-8?B?NUJ5YmZ5VktlQStJSVRzL1dkNGt5b2tEQmZiUXpuc2VUM1lwSjk5TFdBMVhC?=
 =?utf-8?B?THJCT0NvZHgzRWRIcGhvaEtXSmlDSVp1Q2I3KzY1cEFVZkl4OW5Tc3VWbGR6?=
 =?utf-8?B?ckE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <77B816E8F8C4C8488EF097621C96AAC8@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY0PR03MB6356.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b374fdb2-9b22-40db-d464-08dbcbb27305
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2023 06:05:49.7239 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yqhw/IDS0j0NEK0BTiyz6rS92ufXike1sW6sMq+gBv1/NpxjOhMSXAGJZ76qxCrkDKSXDBn49GJdEFmG6pxxTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR03MB5445
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--11.794100-8.000000
X-TMASE-MatchedRID: xSJL/ht5SGDUL3YCMmnG4kD6z8N1m1ALjLOy13Cgb49qSjxROy+AU2yd
 bY7xfgXY9KE7L0nJx0p83uW3CYWyS9UWyxiR09I0A9lly13c/gHDx2NobQWtmwKzHKFHzLsJFmD
 /LBWj5jwjypnGhZoY9cG52Up2X0AaGAdnzrnkM4/SBVVc2BozSnJnzNw42kCxxEHRux+uk8h+IC
 quNi0WJCg/N5j+hkZW7RviakKWTBamTSyq7dJJBrimWt8aVtunftwZ3X11IV0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--11.794100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 564B14B4B79B3000C213CEB2D39AAFED96F6DC5F7D5FE4710508C9D350B40E732000:8
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTEwLTEyIGF0IDE0OjM1ICswMjAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gSWwgMTIvMTAvMjMgMTA6NDAsIE1vdWR5IEhvIGhhIHNjcml0dG86DQo+
ID4gQWRkIGEgY29tcGF0aWJsZSBzdHJpbmcgZm9yIHRoZSBQQUQgYmxvY2sgaW4gTWVkaWFUZWsg
TVQ4MTk1IHRoYXQNCj4gPiBpcyBjb250cm9sbGVkIGJ5IE1EUDMuDQo+ID4gDQo+ID4gU2lnbmVk
LW9mZi1ieTogTW91ZHkgSG8gPG1vdWR5LmhvQG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAg
IC4uLi9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLHBhZGRpbmcueWFtbCAgICAg
ICAgICAgfCA0DQo+ID4gKysrLQ0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQNCj4gPiBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLHBhZGRpDQo+
ID4gbmcueWFtbA0KPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvbWVkaWF0ZWsvbWVkaWF0ZWsscGFkZGkNCj4gPiBuZy55YW1sDQo+ID4gaW5kZXggZGIyNDgw
MWViYzQ4Li42MzZiNjkxMzNhY2MgMTAwNjQ0DQo+ID4gLS0tDQo+ID4gYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxwYWRkaQ0KPiA+
IG5nLnlhbWwNCj4gPiArKysNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLHBhZGRpDQo+ID4gbmcueWFtbA0KPiA+IEBAIC0y
MCw3ICsyMCw5IEBAIGRlc2NyaXB0aW9uOg0KPiA+ICAgDQo+ID4gICBwcm9wZXJ0aWVzOg0KPiA+
ICAgICBjb21wYXRpYmxlOg0KPiA+IC0gICAgY29uc3Q6IG1lZGlhdGVrLG10ODE4OC1wYWRkaW5n
DQo+ID4gKyAgICBlbnVtOg0KPiA+ICsgICAgICAtIG1lZGlhdGVrLG10ODE4OC1wYWRkaW5nDQo+
ID4gKyAgICAgIC0gbWVkaWF0ZWssbXQ4MTk1LW1kcDMtcGFkDQo+IA0KPiBtZWRpYXRlayxtdDgx
OTUtbWRwMy1wYWRkaW5nIHBsZWFzZSENCj4gDQo+IFRoYW5rcywNCj4gQW5nZWxvDQo+IA0KDQpI
aSBBbmdlbG8sDQoNClRoYW5rcyBmb3IgdGhlIHJlbWluZGVyLiBJJ2xsIGNvcnJlY3QgaXQgdG8g
aGF2ZSBjb25zaXN0ZW50IG5hbWluZyBhbmQNCm1ha2UgY29ycmVzcG9uZGluZyBtb2RpZmljYXRp
b25zIGluIHRoZSBEVFNJLg0KDQpTaW5jZXJlbHksDQpNb3VkeQ0KDQo+ID4gICANCj4gPiAgICAg
cmVnOg0KPiA+ICAgICAgIG1heEl0ZW1zOiAxDQo+IA0KPiANCg==
