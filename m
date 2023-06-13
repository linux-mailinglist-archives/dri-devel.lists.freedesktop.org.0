Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DBF72DC56
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 10:24:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B0B810E205;
	Tue, 13 Jun 2023 08:24:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0AC110E205
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 08:24:32 +0000 (UTC)
X-UUID: b4c7ecca09c311eeb20a276fd37b9834-20230613
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=RL55V7cznL9duOAnpdrg40JCTa3odhDYzJaUh/BO+q4=; 
 b=fYeVDtrw1ZcDM7r0pFcKahMcjJw/IU2FTdTIwNsSdCsyrXwWlWSO1RbKmr6Bk9larZMVFEt9iNgOdR9qPoOygByhyTOw+BlZ5Qr5NUErs9LHNte0CIsqdijqe9/KYNn7hTPEaPYDr6CKgcKhw4ttsoJnCqaDh3IgzlwF+BZh+Os=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.26, REQID:3242fe0c-a847-46a8-ba67-0dbf51e8f77b, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:45
X-CID-INFO: VERSION:1.1.26, REQID:3242fe0c-a847-46a8-ba67-0dbf51e8f77b, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:45
X-CID-META: VersionHash:cb9a4e1, CLOUDID:c73a453e-de1e-4348-bc35-c96f92f1dcbb,
 B
 ulkID:230613095251RY68AK8N,BulkQuantity:32,Recheck:0,SF:38|29|28|17|19|48|
 102,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,C
 OL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR, TF_CID_SPAM_SDM, TF_CID_SPAM_FAS,
 TF_CID_SPAM_FSD, TF_CID_SPAM_OBB
X-UUID: b4c7ecca09c311eeb20a276fd37b9834-20230613
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1709144291; Tue, 13 Jun 2023 16:24:25 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 13 Jun 2023 16:24:23 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Tue, 13 Jun 2023 16:24:23 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=faG58De9QJ3aQvtm+jV8CZAwMxSUZjSFMjdeMzPz9sdxEcZECE4WUjpdCjXlo6wXdBDkMkrwy+Kgj5Oro73BaHvbzz9mwnstj1q8evaOdofN0zGKmWQ1czCQmAUh8WHxHiyHMikvBMSQ3X2bKYRJCZ/j5DgpFWT0KBPDPeY+TxCPgDQQhhMoIVGROPwIYOyJBwo7r1PFTnaegNpwsyorNqUJFhoafUFEtm7VLDKLdWltxa0k2WuybFvxQrlq1bfLhOZNgqOV8gz1P+u1tMgN/IuB8i6umE2kFWU05Y4Os/StnUvY+OncZJfmNQs7HTQw3vG2cUtXIvC6mxZrKv59Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1039UZ48qV4ZJF6F4IsTy7CA2uAXZOG7YTBF6UmQFI0=;
 b=Tb4b0nLKJgt3x3sZh7pD8lQ8knHkY9DF45AXLdbkH7x8n4BhB27bo/KJCrP2CnEDytn+wNaSFj+UXk4X4yiEhSHrDkiHFiqxXUdPl46E0ftwxyP3q4ZprdrLiPqor78SYA0L6WJXGNZWD7ExpzJn7SRJomDohS8EkwVFwTQRIaWOOPyFqEH6ipynfrP0qYaURyujBepQjX5eyQkNOdeTOTKuq2Z/PFKR4cIoXLDGXv67qvaf27hclWddj1NCa9Zf78XXzXN0Pb+5qUEe/0b1XUMDMD1hfRizwHc1exN+CxfuHXvAWO8YC4ED0SmHrpECwqFhkGYjrYMRsIp9TFrImQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1039UZ48qV4ZJF6F4IsTy7CA2uAXZOG7YTBF6UmQFI0=;
 b=f+KLR6wBbCdNlZRcRELnUTLbhT/3FLztKIRWZx8s5udPyrZLWCCquO74VbbaFgwr0O5y/caE8JYBz12NYFB3Ctmc3IRSbtmElIV29XmT2CAD64hOD8hhuc7dHMENxk06ISnv9rVBABH9ODrEsjxvDizXEwuFO4PhAQkeL/tD1DE=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KL1PR03MB7336.apcprd03.prod.outlook.com (2603:1096:820:ed::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.46; Tue, 13 Jun
 2023 08:24:21 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::6fdb:ba2c:bcfc:d5ed]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::6fdb:ba2c:bcfc:d5ed%6]) with mapi id 15.20.6455.037; Tue, 13 Jun 2023
 08:24:21 +0000
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
Thread-Index: AQHZkjsmmHc/VTGOHU6M5MEfnDzs/6+IfG+A
Date: Tue, 13 Jun 2023 08:24:21 +0000
Message-ID: <0e789f2741346be40263bcec038dc66624e4aef6.camel@mediatek.com>
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
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KL1PR03MB7336:EE_
x-ms-office365-filtering-correlation-id: 0005008c-c481-4ddb-3f43-08db6be796a1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +zbbD7kofqAiQA8dh35ZLegxZD1mP5OJAHpL8X0JCIzaIjWJOqoBpn6RwBa3xWafXy4fzlozw+AOEXK2FFwzvaxS7FHFxcanQKFkHRr47KlTZsmhYO4xP0jZO3goEPSJG7PMDT0mgiSeVBFF10Pg7n/eEh05ibx175dJkIZgK8TR9rDFQqtQoCp5W7gZVLH5XDc/AkBEkNrMFcu6I5Cob/C6kGevkFx6sVI+Mjw0IFXnb/13H+FLOVMXJLwECQmGO1neNaBwnAAuIepXztc2lpRPG82gYJJLHjcXrCY6YecOH906YH+TJYZb2MrN/w/BmUnBcHzAtlX1kca/7NusU+ANz2GfXSIeNDN7SNyBQiw+3HddAl9l5meLN+nAU97lC4BGQ8kpticrTmQ+7eBDJxbqai57hBslL1OXp1DaBeL3/EoK/YQnDi4T+pBYYtGhyPdk6Zuo040paCpzWtvwNbA1PqyT5G/nsETpHSzFla1w96e1GxYaX+da0Ea4+yIq+PlWtXUKpkoWxuIKjsrpgWDA4hDhClxxerZOAZRO6R6CgFXzwSUYWUIefTIzJ1/HiOkpKZ5AaUM2TSMNfSqqzPMazT648U1Hdhg+f7v8pci3mrx0kBIIEF/qGJTJJ82s9XGS0R3QwEtsNynjMihpWDFChxM1cKdIDQl0nOKPdn3sc4+apnEuGJQG0nJWrg5P
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(376002)(366004)(346002)(39860400002)(451199021)(71200400001)(6486002)(478600001)(26005)(6512007)(85182001)(6506007)(83380400001)(186003)(36756003)(86362001)(38100700002)(38070700005)(2616005)(921005)(122000001)(4326008)(64756008)(5660300002)(66476007)(66556008)(66946007)(66446008)(76116006)(316002)(8936002)(8676002)(7416002)(41300700001)(2906002)(110136005)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?REpSaGViTnAxbjFyOTZyWWJSQVcwWUJ3NkFNQThjWDZxSkJJN0Y1N1B3dk1v?=
 =?utf-8?B?TS8yRVNsd2hGN1pyL0R3elpGMWJVL3I0cjcxQXRsUGU0SzduSkp1aXJDM3JX?=
 =?utf-8?B?OGlKMnpKL1VBUThDaVRITmpwaTFETnRoeXhld2NzSWROTFZic1UxY1FuWWxB?=
 =?utf-8?B?MndpeEhudXB2RndpbzA5SmNyUnFZVWp3VkZyUXZEY2dnS1pBcEYrQnRBTzRi?=
 =?utf-8?B?VFMxbDZqSGVESnI2WjIvaVhwRDVLZGJIQi9JWXhhL1kvVzNuSTZFcEw4VjEr?=
 =?utf-8?B?WS9mZnVHR0pEOUR4RzZYbFp0ZW9WMWMwTHhWSFhUNHBKSDFpTEYyMldtM0cy?=
 =?utf-8?B?YXJsd2VRU3VXM0pDL2JwZ1FIcGl2cVNTMVk3T003SGxhNnFKNEp5ZGhjTk1H?=
 =?utf-8?B?RzVTSitobGwwUXlDMnJtVmg1SzRxVWFwUXBsMTI4eGRZOFlKSklVMXdWcHJ4?=
 =?utf-8?B?bnhPay9LeEI5M0FwcVIvSVdnMzc1WkRHTkVqd0k4eXJ1VVpFRjRlWlVUUHJF?=
 =?utf-8?B?ekdFMDdBdm9HMXU4MGg2MTBiL1lRdHIxbm9kUGJtWmt0ZUJmY1ZSKzBLeW16?=
 =?utf-8?B?QW5iRTRqZHdNM3k1dEJ0NGVlSmNQL3NpUk56VUREYzgxS1d1RVBkOHVyU0Va?=
 =?utf-8?B?TXNSUTV1TzVxV0lERGcxU2dPZDRUbzlxeDRoM0RXZXpoTnIvbzU2S0ZaNXF1?=
 =?utf-8?B?ZEtYNUxOcm4vVCthZkh6ZXE4ZnJWSGMvZTJUMGxXeXYwblRXZGJPSTdYSFl0?=
 =?utf-8?B?NEY0cnppZ1lPSUx2R1VtNndvQmwvK1NqbUZGbVZpVncxdmhlcndiR1RoaTQ2?=
 =?utf-8?B?Z3MzdXFkK3NIQVREajZSQVlWVThnN3JvMUppMTJVcUV5NFB0Z3g2UVJJRERE?=
 =?utf-8?B?eWtmVjBBb0NjSzRkNHZXb0phazVoRjBmYnI0Snp1VzhGdXpZeHlFamY1Sjl6?=
 =?utf-8?B?YWpvMWZEQUdCWnF4L25MVkpyUERUcXN4ek83TkRYT3hxRW4yZ3ZFQzRjOG9n?=
 =?utf-8?B?WkZWbnB5TmpWU2dxamxGU1JxS2F5RVh2b2FMbXZhNjBJWUVkRjZONG4wd0l3?=
 =?utf-8?B?R084RUp4ZnhYOEJudHAwK1pyTzE4MjdXVmIwOEwxeW9EU1dOWllNNUdhZWI3?=
 =?utf-8?B?OGNPajREVDhIbnZZOTVFeGNWd3N2dkFmbzNJNjF2UEg5UlBRM3o4aXFxOFF2?=
 =?utf-8?B?T2ptdi9CUmZNRDlPbTMvWHJHejRMUStBTDFxUjhnb1B3U0daRTF6aVUzcDh3?=
 =?utf-8?B?OHV1Qlo1dmg5YWdUWG1zVEsyam1mcS9JeVMvcm56aEpET0xtZmJuRytkMXVj?=
 =?utf-8?B?ZU9WSkhuS1RQaVFuY0FQbVphRVpCb2txbUdMNURjMlUySVhKN2k4bVVRWFo3?=
 =?utf-8?B?S2JJdElXR3J3bEdIUzB1OVYzUWJCNytRM1Rhdm9HcWtHbHVROVk3MkRmQWRn?=
 =?utf-8?B?Y0xJMVBlSTMrVStNaENUTllXbk5WUXhmN243VWI2cE5FZ1RtaENmYzhsUWpq?=
 =?utf-8?B?M0Q1NE0rSjdQQURjbGsyZ0VyWXpFczRGaU5HaXd3UnI5SHR1aGk0MWNEY1BZ?=
 =?utf-8?B?d0dpM2h3WGVyTjhYR3o3emxyczdlQUlaTTB2WFQwV3UyZHNsWFc1MUdvWTlk?=
 =?utf-8?B?QlR0eTB6VjlRbjlraU9ZQVFBRkFLc21lOW40enVHN3ZYQ2lHTjRjbmNTeW15?=
 =?utf-8?B?Rk5nWUJxYlRmbXZzNGNQeUNIcEtRY2xWYkRmTXNBOVh0bDVXTFZZMU5ILysx?=
 =?utf-8?B?bWVqR1gyUU0xWmZRT1YyTUJ6Qm4zRWsvdWc4ZUdwOEtZVStLeEUyVHp3cnk5?=
 =?utf-8?B?K2dEZWJtYmV0YTcySDgrSm45QnlaMStLWEl3UUlGSkMrU0RXQlJlayt6eGZQ?=
 =?utf-8?B?dTA5TklwV0l3WnR6bGM4SW5pSTVGRDViL2lpTlgvWXN3TVZlMzNGaUZzQXpi?=
 =?utf-8?B?c3dScTRWclB5ODlYakZ1d1JtRFI2WFQ5ckFpM0k3eUx6NmpWamxOeGFrcXpD?=
 =?utf-8?B?NncvOGQrSTRJUkhCMGQrVjdwRHdOVjE3WTVvYnFhSGg5NHplQ1J3VFVKOXgy?=
 =?utf-8?B?MWwrc1FMMDQvd05JOXFqSTVrbEhyT1hiY3hURWZDeGZxcWVUOUFJWGVFVE82?=
 =?utf-8?Q?dtRncbgA+HH6xNhVcZTgTNHuh?=
Content-ID: <16490EC25AF83847BDBC9B2279ABCAF4@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0005008c-c481-4ddb-3f43-08db6be796a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2023 08:24:21.1745 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HqjPH1aqRKMPOKOZ2rWaW1JS4mgU/bYREOUWTHjdyaOZ4nCY75q9SYGZDGUZ3HEOkTVytUSVcGV1avTZAx8W+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7336
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_006_1230884401.980277733"
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

--__=_Part_Boundary_006_1230884401.980277733
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
YXlsaWJyZS5jb20mZ3Q7DQomZ3Q7JiMzMjstLS0NCg0KW3NuaXBdDQoNCiZndDsmIzMyOysNCiZn
dDsmIzMyOytzdGF0aWMmIzMyO3ZvaWQmIzMyO210a19oZG1pX2JyaWRnZV9kaXNhYmxlKHN0cnVj
dCYjMzI7ZHJtX2JyaWRnZSYjMzI7KmJyaWRnZSwNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsm
IzMyO3N0cnVjdCYjMzI7ZHJtX2JyaWRnZV9zdGF0ZSYjMzI7Km9sZF9icmlkZ2Vfc3RhdGUpDQom
Z3Q7JiMzMjsrew0KJmd0OyYjMzI7K3N0cnVjdCYjMzI7bXRrX2hkbWkmIzMyOypoZG1pJiMzMjs9
JiMzMjtoZG1pX2N0eF9mcm9tX2JyaWRnZShicmlkZ2UpOw0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7
K2lmJiMzMjsoIWhkbWktJmd0O2VuYWJsZWQpDQomZ3Q7JiMzMjsrcmV0dXJuOw0KJmd0OyYjMzI7
Kw0KJmd0OyYjMzI7K210a19oZG1pX2h3X3NlbmRfYXZfbXV0ZShoZG1pKTsNCiZndDsmIzMyOyt1
c2xlZXBfcmFuZ2UoNTAwMDAsJiMzMjs1MDA1MCk7DQomZ3Q7JiMzMjsrbXRrX2hkbWlfaHdfdmlk
X2JsYWNrKGhkbWksJiMzMjt0cnVlKTsNCiZndDsmIzMyOyttdGtfaGRtaV9kaXNhYmxlX2hkY3Bf
ZW5jcnlwdChoZG1pKTsNCiZndDsmIzMyOyt1c2xlZXBfcmFuZ2UoNTAwMDAsJiMzMjs1MDA1MCk7
DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrcGh5X3Bvd2VyX29mZihoZG1pLSZndDtwaHkpOw0KJmd0
OyYjMzI7Kw0KJmd0OyYjMzI7K2hkbWktJmd0O2VuYWJsZWQmIzMyOz0mIzMyO2ZhbHNlOw0KJmd0
OyYjMzI7K30NCiZndDsmIzMyOysNCiZndDsmIzMyOytzdGF0aWMmIzMyO3ZvaWQmIzMyO210a19o
ZG1pX2JyaWRnZV9wb3N0X2Rpc2FibGUoc3RydWN0JiMzMjtkcm1fYnJpZGdlJiMzMjsqYnJpZGdl
LA0KJmd0OyYjMzI7KyYjMzI7c3RydWN0JiMzMjtkcm1fYnJpZGdlX3N0YXRlJiMzMjsqb2xkX3N0
YXRlKQ0KJmd0OyYjMzI7K3sNCiZndDsmIzMyOytzdHJ1Y3QmIzMyO210a19oZG1pJiMzMjsqaGRt
aSYjMzI7PSYjMzI7aGRtaV9jdHhfZnJvbV9icmlkZ2UoYnJpZGdlKTsNCiZndDsmIzMyOysNCiZn
dDsmIzMyOytpZiYjMzI7KCFoZG1pLSZndDtwb3dlcmVkKQ0KJmd0OyYjMzI7K3JldHVybjsNCiZn
dDsmIzMyOysNCiZndDsmIzMyOytwaHlfcG93ZXJfb2ZmKGhkbWktJmd0O3BoeSk7DQomZ3Q7JiMz
MjsrDQomZ3Q7JiMzMjsraGRtaS0mZ3Q7cG93ZXJlZCYjMzI7PSYjMzI7ZmFsc2U7DQomZ3Q7JiMz
MjsrfQ0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7K3N0YXRpYyYjMzI7dm9pZCYjMzI7bXRrX2hkbWlf
YnJpZGdlX3ByZV9lbmFibGUoc3RydWN0JiMzMjtkcm1fYnJpZGdlJiMzMjsqYnJpZGdlLA0KJmd0
OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7c3RydWN0JiMzMjtkcm1f
YnJpZGdlX3N0YXRlJiMzMjsqb2xkX3N0YXRlKQ0KJmd0OyYjMzI7K3sNCiZndDsmIzMyOytzdHJ1
Y3QmIzMyO210a19oZG1pJiMzMjsqaGRtaSYjMzI7PSYjMzI7aGRtaV9jdHhfZnJvbV9icmlkZ2Uo
YnJpZGdlKTsNCiZndDsmIzMyOytzdHJ1Y3QmIzMyO2RybV9hdG9taWNfc3RhdGUmIzMyOypzdGF0
ZSYjMzI7PSYjMzI7b2xkX3N0YXRlLSZndDtiYXNlLnN0YXRlOw0KJmd0OyYjMzI7K3VuaW9uJiMz
MjtwaHlfY29uZmlndXJlX29wdHMmIzMyO29wdHMmIzMyOz0mIzMyO3sNCiZndDsmIzMyOysuZHAm
IzMyOz0mIzMyO3smIzMyOy5saW5rX3JhdGUmIzMyOz0mIzMyO2hkbWktJmd0O21vZGUuY2xvY2sm
IzMyOyomIzMyO0tJTE99DQomZ3Q7JiMzMjsrfTsNCiZndDsmIzMyOysNCiZndDsmIzMyOysvKiYj
MzI7UmV0cmlldmUmIzMyO3RoZSYjMzI7Y29ubmVjdG9yJiMzMjt0aHJvdWdoJiMzMjt0aGUmIzMy
O2F0b21pYyYjMzI7c3RhdGUuJiMzMjsqLw0KJmd0OyYjMzI7K2hkbWktJmd0O2N1cnJfY29ubiYj
MzI7PSYjMzI7ZHJtX2F0b21pY19nZXRfbmV3X2Nvbm5lY3Rvcl9mb3JfZW5jb2RlcihzdGF0ZSwN
CiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjticmlkZ2UtJmd0O2VuY29kZXIpOw0KJmd0OyYjMzI7
Kw0KJmd0OyYjMzI7K210a19oZG1pX291dHB1dF9zZXRfZGlzcGxheV9tb2RlKGhkbWksJiMzMjsm
YW1wO2hkbWktJmd0O21vZGUpOw0KJmd0OyYjMzI7Ky8qJiMzMjtjb25maWd1cmluZyYjMzI7cGh5
JiMzMjtjbG9jayYjMzI7bGluayYjMzI7d2l0aCYjMzI7YXBwcm9wcmlhdGUmIzMyO3JhdGUmIzMy
OyovDQomZ3Q7JiMzMjsrcGh5X2NvbmZpZ3VyZShoZG1pLSZndDtwaHksJiMzMjsmYW1wO29wdHMp
Ow0KJmd0OyYjMzI7K3BoeV9wb3dlcl9vbihoZG1pLSZndDtwaHkpOw0KJmd0OyYjMzI7K2hkbWkt
Jmd0O3Bvd2VyZWQmIzMyOz0mIzMyO3RydWU7DQomZ3Q7JiMzMjsrfQ0KDQpJbiYjMzI7bXQ4MTcz
JiMzMjtoZG1pJiMzMjtkcml2ZXIsJiMzMjtvbmx5JiMzMjticmlkZ2VfZW5hYmxlJiMzMjtzdGFn
ZSwmIzMyO25vJiMzMjticmlkZ2VfcHJlX2VuYWJsZQ0Kc3RhZ2UsJiMzMjt3aHkmIzMyO210ODE5
NSYjMzI7bmVlZCYjMzI7dG8mIzMyO3NlcGFyYXRlJiMzMjtpdCYjNjM7DQoNClJlZ2FyZHMsDQpD
Sw0KDQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrc3RhdGljJiMzMjt2b2lkJiMzMjttdGtfaGRtaV9i
cmlkZ2VfZW5hYmxlKHN0cnVjdCYjMzI7ZHJtX2JyaWRnZSYjMzI7KmJyaWRnZSwNCiZndDsmIzMy
OysmIzMyOyYjMzI7JiMzMjtzdHJ1Y3QmIzMyO2RybV9icmlkZ2Vfc3RhdGUmIzMyOypvbGRfc3Rh
dGUpDQomZ3Q7JiMzMjsrew0KJmd0OyYjMzI7K3N0cnVjdCYjMzI7bXRrX2hkbWkmIzMyOypoZG1p
JiMzMjs9JiMzMjtoZG1pX2N0eF9mcm9tX2JyaWRnZShicmlkZ2UpOw0KJmd0OyYjMzI7K3U4JiMz
MjtidWZmZXJfc3BkW0hETUlfSU5GT0ZSQU1FX1NJWkUoU1BEKV07DQomZ3Q7JiMzMjsrdTgmIzMy
O2J1ZmZlcl9hdmlbSERNSV9JTkZPRlJBTUVfU0laRShBVkkpXTsNCiZndDsmIzMyOysNCiZndDsm
IzMyOytwaHlfcG93ZXJfb24oaGRtaS0mZ3Q7cGh5KTsNCiZndDsmIzMyOyttdGtfaGRtaV9zZW5k
X2luZm9mcmFtZShoZG1pLCYjMzI7YnVmZmVyX3NwZCwmIzMyO3NpemVvZihidWZmZXJfc3BkKSwN
CiZndDsmIzMyOytidWZmZXJfYXZpLCYjMzI7c2l6ZW9mKGJ1ZmZlcl9hdmkpLCYjMzI7JmFtcDto
ZG1pLSZndDttb2RlKTsNCiZndDsmIzMyOyttdGtfaGRtaV9od19zcGRfaW5mb2ZyYW1lKGhkbWks
JiMzMjtidWZmZXJfc3BkLCYjMzI7c2l6ZW9mKGJ1ZmZlcl9zcGQpKTsNCiZndDsmIzMyOyttdGtf
aGRtaV9od19hdmlfaW5mb2ZyYW1lKGhkbWksJiMzMjtidWZmZXJfYXZpLCYjMzI7c2l6ZW9mKGJ1
ZmZlcl9hdmkpKTsNCiZndDsmIzMyOysNCiZndDsmIzMyOyttdGtfaGRtaV9od192aWRfYmxhY2so
aGRtaSwmIzMyO2ZhbHNlKTsNCiZndDsmIzMyOysNCiZndDsmIzMyOytoZG1pLSZndDtlbmFibGVk
JiMzMjs9JiMzMjt0cnVlOw0KJmd0OyYjMzI7K30NCiZndDsmIzMyOysNCiZndDsmIzMyOw0KDQo8
L3ByZT48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsg
Q29uZmlkZW50aWFsaXR5IE5vdGljZSAqKioqKioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0
aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0
YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBv
ciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdz
LiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQg
cmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJp
bnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRz
IA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHBy
b2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRl
ZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUgDQp0aGF0IHlvdSBoYXZlIHJl
Y2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQpp
bW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBh
bGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZy
b20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMg
ZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_006_1230884401.980277733
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEd1aWxsYXVtZToNCg0KT24gTW9uLCAyMDIzLTA1LTI5IGF0IDE2OjMxICswMjAwLCBHdWls
bGF1bWUgUmFucXVldCB3cm90ZToNCj4gIAkgDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRv
IG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZl
cmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+ICBBZGRzIGhkbWkgYW5kIGhkbWkt
ZGRjIHN1cHBvcnQgZm9yIHYyIElQLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogR3VpbGxhdW1lIFJh
bnF1ZXQgPGdyYW5xdWV0QGJheWxpYnJlLmNvbT4NCj4gLS0tDQoNCltzbmlwXQ0KDQo+ICsNCj4g
K3N0YXRpYyB2b2lkIG10a19oZG1pX2JyaWRnZV9kaXNhYmxlKHN0cnVjdCBkcm1fYnJpZGdlICpi
cmlkZ2UsDQo+ICsgICAgc3RydWN0IGRybV9icmlkZ2Vfc3RhdGUgKm9sZF9icmlkZ2Vfc3RhdGUp
DQo+ICt7DQo+ICtzdHJ1Y3QgbXRrX2hkbWkgKmhkbWkgPSBoZG1pX2N0eF9mcm9tX2JyaWRnZShi
cmlkZ2UpOw0KPiArDQo+ICtpZiAoIWhkbWktPmVuYWJsZWQpDQo+ICtyZXR1cm47DQo+ICsNCj4g
K210a19oZG1pX2h3X3NlbmRfYXZfbXV0ZShoZG1pKTsNCj4gK3VzbGVlcF9yYW5nZSg1MDAwMCwg
NTAwNTApOw0KPiArbXRrX2hkbWlfaHdfdmlkX2JsYWNrKGhkbWksIHRydWUpOw0KPiArbXRrX2hk
bWlfZGlzYWJsZV9oZGNwX2VuY3J5cHQoaGRtaSk7DQo+ICt1c2xlZXBfcmFuZ2UoNTAwMDAsIDUw
MDUwKTsNCj4gKw0KPiArcGh5X3Bvd2VyX29mZihoZG1pLT5waHkpOw0KPiArDQo+ICtoZG1pLT5l
bmFibGVkID0gZmFsc2U7DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyB2b2lkIG10a19oZG1pX2JyaWRn
ZV9wb3N0X2Rpc2FibGUoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwNCj4gKyBzdHJ1Y3QgZHJt
X2JyaWRnZV9zdGF0ZSAqb2xkX3N0YXRlKQ0KPiArew0KPiArc3RydWN0IG10a19oZG1pICpoZG1p
ID0gaGRtaV9jdHhfZnJvbV9icmlkZ2UoYnJpZGdlKTsNCj4gKw0KPiAraWYgKCFoZG1pLT5wb3dl
cmVkKQ0KPiArcmV0dXJuOw0KPiArDQo+ICtwaHlfcG93ZXJfb2ZmKGhkbWktPnBoeSk7DQo+ICsN
Cj4gK2hkbWktPnBvd2VyZWQgPSBmYWxzZTsNCj4gK30NCj4gKw0KPiArc3RhdGljIHZvaWQgbXRr
X2hkbWlfYnJpZGdlX3ByZV9lbmFibGUoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwNCj4gKyAg
ICAgICBzdHJ1Y3QgZHJtX2JyaWRnZV9zdGF0ZSAqb2xkX3N0YXRlKQ0KPiArew0KPiArc3RydWN0
IG10a19oZG1pICpoZG1pID0gaGRtaV9jdHhfZnJvbV9icmlkZ2UoYnJpZGdlKTsNCj4gK3N0cnVj
dCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSA9IG9sZF9zdGF0ZS0+YmFzZS5zdGF0ZTsNCj4gK3Vu
aW9uIHBoeV9jb25maWd1cmVfb3B0cyBvcHRzID0gew0KPiArLmRwID0geyAubGlua19yYXRlID0g
aGRtaS0+bW9kZS5jbG9jayAqIEtJTE99DQo+ICt9Ow0KPiArDQo+ICsvKiBSZXRyaWV2ZSB0aGUg
Y29ubmVjdG9yIHRocm91Z2ggdGhlIGF0b21pYyBzdGF0ZS4gKi8NCj4gK2hkbWktPmN1cnJfY29u
biA9IGRybV9hdG9taWNfZ2V0X25ld19jb25uZWN0b3JfZm9yX2VuY29kZXIoc3RhdGUsDQo+ICsg
ICBicmlkZ2UtPmVuY29kZXIpOw0KPiArDQo+ICttdGtfaGRtaV9vdXRwdXRfc2V0X2Rpc3BsYXlf
bW9kZShoZG1pLCAmaGRtaS0+bW9kZSk7DQo+ICsvKiBjb25maWd1cmluZyBwaHkgY2xvY2sgbGlu
ayB3aXRoIGFwcHJvcHJpYXRlIHJhdGUgKi8NCj4gK3BoeV9jb25maWd1cmUoaGRtaS0+cGh5LCAm
b3B0cyk7DQo+ICtwaHlfcG93ZXJfb24oaGRtaS0+cGh5KTsNCj4gK2hkbWktPnBvd2VyZWQgPSB0
cnVlOw0KPiArfQ0KDQpJbiBtdDgxNzMgaGRtaSBkcml2ZXIsIG9ubHkgYnJpZGdlX2VuYWJsZSBz
dGFnZSwgbm8gYnJpZGdlX3ByZV9lbmFibGUNCnN0YWdlLCB3aHkgbXQ4MTk1IG5lZWQgdG8gc2Vw
YXJhdGUgaXQ/DQoNClJlZ2FyZHMsDQpDSw0KDQo+ICsNCj4gK3N0YXRpYyB2b2lkIG10a19oZG1p
X2JyaWRnZV9lbmFibGUoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwNCj4gKyAgIHN0cnVjdCBk
cm1fYnJpZGdlX3N0YXRlICpvbGRfc3RhdGUpDQo+ICt7DQo+ICtzdHJ1Y3QgbXRrX2hkbWkgKmhk
bWkgPSBoZG1pX2N0eF9mcm9tX2JyaWRnZShicmlkZ2UpOw0KPiArdTggYnVmZmVyX3NwZFtIRE1J
X0lORk9GUkFNRV9TSVpFKFNQRCldOw0KPiArdTggYnVmZmVyX2F2aVtIRE1JX0lORk9GUkFNRV9T
SVpFKEFWSSldOw0KPiArDQo+ICtwaHlfcG93ZXJfb24oaGRtaS0+cGh5KTsNCj4gK210a19oZG1p
X3NlbmRfaW5mb2ZyYW1lKGhkbWksIGJ1ZmZlcl9zcGQsIHNpemVvZihidWZmZXJfc3BkKSwNCj4g
K2J1ZmZlcl9hdmksIHNpemVvZihidWZmZXJfYXZpKSwgJmhkbWktPm1vZGUpOw0KPiArbXRrX2hk
bWlfaHdfc3BkX2luZm9mcmFtZShoZG1pLCBidWZmZXJfc3BkLCBzaXplb2YoYnVmZmVyX3NwZCkp
Ow0KPiArbXRrX2hkbWlfaHdfYXZpX2luZm9mcmFtZShoZG1pLCBidWZmZXJfYXZpLCBzaXplb2Yo
YnVmZmVyX2F2aSkpOw0KPiArDQo+ICttdGtfaGRtaV9od192aWRfYmxhY2soaGRtaSwgZmFsc2Up
Ow0KPiArDQo+ICtoZG1pLT5lbmFibGVkID0gdHJ1ZTsNCj4gK30NCj4gKw0KPiANCg==

--__=_Part_Boundary_006_1230884401.980277733--

