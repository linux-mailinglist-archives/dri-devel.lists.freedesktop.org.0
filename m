Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C3F762AF0
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 07:45:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6497F10E417;
	Wed, 26 Jul 2023 05:45:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7510A10E417
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 05:45:09 +0000 (UTC)
X-UUID: 9282d5642b7711eeb20a276fd37b9834-20230726
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=TwJRbzcwB3jHX3P+77XSe7BNo8O/kuR+PMFYmWBtRuA=; 
 b=MCfFL2Ax5bCvosp11akfGPOH3g8fJgYOvZ3ioH3xd/wc2qp955tyDA2x2muUsFfuor7Ioc0yW7w9ttiOup/r3KVDxfzji4YXoLezDt/dCKRafPEKAyf2P2hRj+8sXQkx3J+VjIn+sr/fx8qrFf/mcOdv7AM6yK9eFY1Iyb0s5EE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.29, REQID:fc5c5ca5-e715-40a7-8851-7be3c26c5066, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:45
X-CID-INFO: VERSION:1.1.29, REQID:fc5c5ca5-e715-40a7-8851-7be3c26c5066, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:45
X-CID-META: VersionHash:e7562a7, CLOUDID:504f8aa0-0933-4333-8d4f-6c3c53ebd55b,
 B
 ulkID:230726134506G8GZ2RZW,BulkQuantity:0,Recheck:0,SF:28|17|19|48|38|29|1
 02,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:nil,QS:nil,BEC:ni
 l,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:PA,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_FSD, TF_CID_SPAM_ULN, TF_CID_SPAM_SNR,
 TF_CID_SPAM_SDM, TF_CID_SPAM_FAS
X-UUID: 9282d5642b7711eeb20a276fd37b9834-20230726
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1316559514; Wed, 26 Jul 2023 13:45:05 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 26 Jul 2023 13:45:04 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Wed, 26 Jul 2023 13:45:04 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hMbq6bqJYG6nFz5qrsOywiJfbyg9kpZbnFweSt68wUFb2jRusA+KnUIE/dfjpGqCFgNXa61j+z00xp6IEv5BMfr+EqIhRf33/EHSHuNOIpSQDElKgNakQlJpjIsYVNmwmyYHbfhSz35iudHNRdqCFLYAVxMjVPwYA3LC9Sk3ZHOxPyzj+6S5eIXoQOo+ZGz/yXeXVPYZuoujak98bzl7/2iZYfyK6U0KXAZ7kuWXDqa5siauDcz93l7IFeWd5z6ce30jaEi6eA0b6YSsfgNCkoqfldNU817OAsBFISFGFBy6PYJjDeYPP+3WImOdkegKGcS+bYQpcA2xj6wUaNf0GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HAVJm19sX2cGUp57sHWM6md4/U5nyWZXty/F/5D9iM4=;
 b=VM6VsotVnMc89XkQTr9KT6Db1ILY8dCJIIV4Lll7zrvSynB2RbZEGEn598mg0ConBXSR/myrRbLrr/dOohxmYS6nyal70yBcEoKoXf2UaM6H7mkonESbqrX1B0H0PJXkVDkjgMy34AsQCK+W5AwG53xNiaP64/qgWnO7nKiflICfk3yM3CuoYyl+DkqE7AlGK11KVtOkJjGf9cUyc0cay0/BsZNLcJON6nuS2WwHcMPuWcAJwB2FrdNLiKfMmX2OOCVs3FZtbWX6oaRsqrRa5FyHj37F4jWOIcHf0GRITopwwp7kuqHsWObCTnTvIdtPIcDbV01DC3v0cW5cI4atYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HAVJm19sX2cGUp57sHWM6md4/U5nyWZXty/F/5D9iM4=;
 b=GsqS5vuAUKsJrmlmkuCaXiuzagzYtSWhUMLLQeqWPSuneTSCI5JImIU7GZkQUd7e8WyemRgo2wwtcd036KR7+C1Wo/RcpvjhIy9u66HSTKhDch3IS+BEQTzXbYhBRvKVBxOG5CAGNBb9tc3OpR+W7Wos6jKyH0DDt+jYF5jsswI=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYSPR03MB7427.apcprd03.prod.outlook.com (2603:1096:400:40f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Wed, 26 Jul
 2023 05:45:02 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::d126:7f34:9e4f:a95]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::d126:7f34:9e4f:a95%4]) with mapi id 15.20.6609.026; Wed, 26 Jul 2023
 05:45:02 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>
Subject: Re: [PATCH v2 4/6] drm/mediatek: mtk_dpi: Switch to .remove_new()
 void callback
Thread-Topic: [PATCH v2 4/6] drm/mediatek: mtk_dpi: Switch to .remove_new()
 void callback
Thread-Index: AQHZuhXvQ+MOLIhUqUukVyRCFoQS86/LlHgA
Date: Wed, 26 Jul 2023 05:45:02 +0000
Message-ID: <f2bf0c11449709369bfb9804ac124e7ff66281fc.camel@mediatek.com>
References: <20230719075056.72178-1-angelogioacchino.delregno@collabora.com>
 <20230719075056.72178-5-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230719075056.72178-5-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYSPR03MB7427:EE_
x-ms-office365-filtering-correlation-id: 328d6563-0a52-42c1-a958-08db8d9b74fe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2RgZaJCpfN2yEs/9KEIoSDRQ98VOEFASIUrgt+y+gAuruSyMwTnHMLNjvOOVgsBN9rMF2ms5jaETOUiJRTRSg5+IIe3zZzh4Kp0MHSF9AXnfJOUzC2Vl/ADm74s4RYrM6oEloTl+Kawzb8HEVTXyDwB1aH+9j1RiyrFv7eHgv25ZVNfpNL9YjPI6ve8BBfsf6TSI2u0/OB1o+mblmq0IXyfOZO0KLATQXoYGcKJKJcIgzC1c9ZYaO4YKoxWEVfOaxnXPy/K5Zp06vrQYXoJDJd4JLJ78pcjch3xg2SaCsdQnzcozxPrWkXc9CD8cd8s1becgmYR4wesPRxF9sCBpCm+NE3OMb2/TSynfocGwHPAeirXHb9BbfdoYMbGishlKSQvGTzJMS373Q/G9jb3mt8KlX76VKPzeU4urs4OKxE78Dg1R0we8NJIi69Kb9kf3aSe9JNNK+ucRDrutmAmgdwL82iZaf1Qd5f/A1uviJzHwUx0o9wvlQ6PbsO2v4hwAabi+PbrQSK9hvRtW1k0LKoqAg6161zrpD8mczSEnvKmV8LOODEhSVm3P+jfOilIF7IimK6ToqtcmR9SWm4yy1JzAsaPEC2hlomuqI/BYFIkIw1atsyxVd8TnH36Prw0WOKcxCRET0YO0NERSBfKisWhHC29bJsOWZoxCT/ZOKrklW3RNDlJpmI+lTmG7gyd8
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(346002)(136003)(376002)(396003)(39860400002)(451199021)(2616005)(66946007)(64756008)(66476007)(83380400001)(66446008)(85182001)(38100700002)(36756003)(86362001)(41300700001)(38070700005)(5660300002)(8676002)(8936002)(122000001)(54906003)(6486002)(478600001)(71200400001)(110136005)(66556008)(4326008)(186003)(316002)(6512007)(2906002)(76116006)(6506007)(26005)(142923001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b3lqYXNXc3ZGd0p5clp4Y1IzdW9DQXc5UEVXSlRUdWYxaENRMnhlVHFjTks2?=
 =?utf-8?B?TzRBbjIwcDdra014d2NWNXl2TFhPdXpiR2hkQ2VIT3pjSGNySC9keHpMd2Vv?=
 =?utf-8?B?UlVMeHkwcTZKSUIvTUtRTXp2eks0Q2VaYzExSnZ4T2lMZ0xnaFZrcHZUSENP?=
 =?utf-8?B?OGtGaHNqZGFNTVY5aXNxaGU3bUhjSGFETm80elgyK3l5bXNoQ2Mzb0plcXFw?=
 =?utf-8?B?bFNIeW1XQU1ub1BlUDZ6MU9SbjUyZTBSTktNejd1bDlMMjRueVROSEhaMzBK?=
 =?utf-8?B?QSs4U2FkUlVHSWxwM3M0T1Vja2lSWmYweHV2WGsxNmsrc0UzMVpSd3JLRGxD?=
 =?utf-8?B?cUNzVFV2U1BmYk43SUl6WlVTWjJXRG5xa2VjZnkrRHRvRlNyd253MURJNGFy?=
 =?utf-8?B?Z3I2QzZzVldnaUI1ZmtySzJrS2FNRWk5cDVoY1c1S0FsNG45Q1VaVEtrNEpK?=
 =?utf-8?B?bit2TXljMTF5T1J6UkIvWXZlN1NFeldmeU82bzdkWWJ3cVFVM1ZmcFZrR1Rh?=
 =?utf-8?B?UTBZMFpDYmpwbE9tZndIMXRZa3kyNWw5MkIzeXJpR2xlVzNSbDJQOWkzYmRU?=
 =?utf-8?B?dEJCUExLd1hFK3Q5aUptQWlvK1Vmb0NNY2lTeXRFRDZiM1VUaEx6K1NNdUxR?=
 =?utf-8?B?N0R0aFFoc0k2eU1KUWQ3NVJiZ2RuNnpJdlpHb1orcGxaRlE3dURyNE1MVVRQ?=
 =?utf-8?B?Vk1SOCtVREU2cC9kZFV3NTF5Z0hTYTF6MTJJamhjSDNCQTFuK3h5MlNpMEcz?=
 =?utf-8?B?S29MSnRPVndwQlQxM3dOeUkyVi9DQUFHZmt6Q3JVaUVrTFJaR0ZEN0JIcENR?=
 =?utf-8?B?Y3hrWS9BaFNPa2VGVUdmUnBlRnUwK0JQMFY1SGdaWXFkNVFXaTFLVUgwVGNR?=
 =?utf-8?B?NWRJcVA3ZTFtTVBmTS9rcHRJYmY2c0g5Z0ZqV2M0ZW93STRFOTJlUlFRSXJ4?=
 =?utf-8?B?emFjNGpZT2JESUg0K0JTOVN3RWNsV3V3VThOTlJYU01LNXAxU0p5WmlKbWYz?=
 =?utf-8?B?NENPeFVxaTdyZjNWRnhSMEFKc3hYMHdhZFZ6U01QVEU0bnY0OVR5RUFYOVhM?=
 =?utf-8?B?UWgrZmNEdjA4ZUtmZW16Rjdib3V4ZmhXZEN4VU95R1NCUVNRa0JMaDNRVFZs?=
 =?utf-8?B?aHdoUCttTWdOUTBWWWl2cE1kSnppR2xXUFNpUXorZ2VNbFpIcnZ1a1k0dHJZ?=
 =?utf-8?B?QVpueVNoNElic1pQVkhTdC9GTHlwTzBxVGovRWdqT000S2IxTStwN0xLOTRH?=
 =?utf-8?B?RWRIV2hCZU8vcXZOUWVuYm9EdDZDSmxxRU5IVmhYUnkzbDNUa0J6Z1d0ZVVG?=
 =?utf-8?B?MDcxbHFncXJneWZLWG1XSlRtOEZ5SFNXakJzNHZWYVB0Y01SNlZoUWN2QnM1?=
 =?utf-8?B?NDZFcXFnam1kNER2WjBKc0c2d1Y3UXZlUnJRN09JVWFTcmV2ckZMQ0dvUitH?=
 =?utf-8?B?S0I0SWZxRUVmbHVlcjdqczBMbFdxNDRjWlZ3RDRmZ1h4Y2FLQ0lOQ0JycnJR?=
 =?utf-8?B?bE1VWFNyemdheG9EREJNR2wzbE40OGxvQWtKaXZ2L28xbDY5T2NIVWk2aVRN?=
 =?utf-8?B?WnlCYzBOb2ZaYXpGQXlwS2JKbGhaOVI1aFlGQnczZWxNYnhHdVVBdzAzdkdV?=
 =?utf-8?B?aTE5dUdETzgycEw2d3p3ZXl5YUlhdHd5VEgrS0xEdVhPSXd1YXJadEc5cFRW?=
 =?utf-8?B?ZVFUY1RISmJqWU1KNU40d1IvOHZpenlQWGNKL0pyeWQyakR0dWFZZmhMRzBy?=
 =?utf-8?B?aVlvNXVMY2tOZmtxMEhMNWpIcXZvVDdYNjFBbUs5K240OHZKVGc1YzhKV09r?=
 =?utf-8?B?bWNPUm1GbHNzSStjWHJOczhvSWZXZUdoUTVQRTRNQndTUWtnMWtsN2htSUp5?=
 =?utf-8?B?Zi9BVG9ncnYxNWpCL1RKUEFJRExRbUIzaUU0L2t3eDRRTVM1Q3VjclkxUUNH?=
 =?utf-8?B?ZHhkK1QwOGN2enluNTI4Uk4wdmRtR2ZkRGVmMEVSUi9Hdkx3RXV2UUwvQTlm?=
 =?utf-8?B?STgyclR3REVudHBPR0ZzdUxoNWRvUXZtRjUzM3R4UERZQkc5SythSCsvZnIx?=
 =?utf-8?B?Y1MrcDFrWXV5OUhyWFpxVWc4akNoM0xIS1hUN3cvZDBYQ1FPS1Z0L2tidUJ2?=
 =?utf-8?Q?zTxSBwxn2voLi9TBMy4c501H3?=
Content-ID: <DFBA4032E30F8243A24D3318A86F3558@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 328d6563-0a52-42c1-a958-08db8d9b74fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2023 05:45:02.4873 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +SZ6dJeIiUk11ke7jihxvZ/cJmO4bYkDbSQ6OVN0f9k8kj8ovVgsqanCLMZCsWov54h0udQCEel2tEDptf9i+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7427
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_003_1794805596.1618793120"
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
Cc: "fshao@chromium.org" <fshao@chromium.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_003_1794805596.1618793120
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpLCYjMzI7QW5nZWxvOg0KDQpPbiYjMzI7V2VkLCYjMzI7MjAyMy0wNy0xOSYjMzI7
YXQmIzMyOzA5OjUwJiMzMjsrMDIwMCwmIzMyO0FuZ2Vsb0dpb2FjY2hpbm8mIzMyO0RlbCYjMzI7
UmVnbm8mIzMyO3dyb3RlOg0KJmd0OyYjMzI7VGhlJiMzMjsucmVtb3ZlKCkmIzMyO2NhbGxiYWNr
JiMzMjtjYW5ub3QmIzMyO2ZhaWw6JiMzMjtzd2l0Y2gmIzMyO3RvJiMzMjsucmVtb3ZlX25ldygp
JiMzMjthbmQNCiZndDsmIzMyO2NoYW5nZSYjMzI7bXRrX2RwaV9yZW1vdmUoKSYjMzI7dG8mIzMy
O3ZvaWQuDQoNClJldmlld2VkLWJ5OiYjMzI7Q0smIzMyO0h1JiMzMjsmbHQ7Y2suaHVAbWVkaWF0
ZWsuY29tJmd0Ow0KDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtBbmdl
bG9HaW9hY2NoaW5vJiMzMjtEZWwmIzMyO1JlZ25vJiMzMjsmbHQ7DQomZ3Q7JiMzMjthbmdlbG9n
aW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20mZ3Q7DQomZ3Q7JiMzMjstLS0NCiZndDsm
IzMyOyYjMzI7ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYyYjMzI7fCYjMzI7NiYj
MzI7KystLS0tDQomZ3Q7JiMzMjsmIzMyOzEmIzMyO2ZpbGUmIzMyO2NoYW5nZWQsJiMzMjsyJiMz
MjtpbnNlcnRpb25zKCspLCYjMzI7NCYjMzI7ZGVsZXRpb25zKC0pDQomZ3Q7JiMzMjsNCiZndDsm
IzMyO2RpZmYmIzMyOy0tZ2l0JiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBp
LmMNCiZndDsmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYw0KJmd0OyYj
MzI7aW5kZXgmIzMyO2U5YzVhMGY0NDUzNy4uM2ExNDA0OThjOThhJiMzMjsxMDA2NDQNCiZndDsm
IzMyOy0tLSYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jDQomZ3Q7JiMz
MjsrKysmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYw0KJmd0OyYjMzI7
QEAmIzMyOy0xMDg3LDExJiMzMjsrMTA4Nyw5JiMzMjtAQCYjMzI7c3RhdGljJiMzMjtpbnQmIzMy
O210a19kcGlfcHJvYmUoc3RydWN0DQomZ3Q7JiMzMjtwbGF0Zm9ybV9kZXZpY2UmIzMyOypwZGV2
KQ0KJmd0OyYjMzI7JiMzMjtyZXR1cm4mIzMyOzA7DQomZ3Q7JiMzMjsmIzMyO30NCiZndDsmIzMy
OyYjMzI7DQomZ3Q7JiMzMjstc3RhdGljJiMzMjtpbnQmIzMyO210a19kcGlfcmVtb3ZlKHN0cnVj
dCYjMzI7cGxhdGZvcm1fZGV2aWNlJiMzMjsqcGRldikNCiZndDsmIzMyOytzdGF0aWMmIzMyO3Zv
aWQmIzMyO210a19kcGlfcmVtb3ZlKHN0cnVjdCYjMzI7cGxhdGZvcm1fZGV2aWNlJiMzMjsqcGRl
dikNCiZndDsmIzMyOyYjMzI7ew0KJmd0OyYjMzI7JiMzMjtjb21wb25lbnRfZGVsKCZhbXA7cGRl
di0mZ3Q7ZGV2LCYjMzI7JmFtcDttdGtfZHBpX2NvbXBvbmVudF9vcHMpOw0KJmd0OyYjMzI7LQ0K
Jmd0OyYjMzI7LXJldHVybiYjMzI7MDsNCiZndDsmIzMyOyYjMzI7fQ0KJmd0OyYjMzI7JiMzMjsN
CiZndDsmIzMyOyYjMzI7c3RhdGljJiMzMjtjb25zdCYjMzI7c3RydWN0JiMzMjtvZl9kZXZpY2Vf
aWQmIzMyO210a19kcGlfb2ZfaWRzW10mIzMyOz0mIzMyO3sNCiZndDsmIzMyO0BAJiMzMjstMTEy
Miw3JiMzMjsrMTEyMCw3JiMzMjtAQCYjMzI7TU9EVUxFX0RFVklDRV9UQUJMRShvZiwmIzMyO210
a19kcGlfb2ZfaWRzKTsNCiZndDsmIzMyOyYjMzI7DQomZ3Q7JiMzMjsmIzMyO3N0cnVjdCYjMzI7
cGxhdGZvcm1fZHJpdmVyJiMzMjttdGtfZHBpX2RyaXZlciYjMzI7PSYjMzI7ew0KJmd0OyYjMzI7
JiMzMjsucHJvYmUmIzMyOz0mIzMyO210a19kcGlfcHJvYmUsDQomZ3Q7JiMzMjstLnJlbW92ZSYj
MzI7PSYjMzI7bXRrX2RwaV9yZW1vdmUsDQomZ3Q7JiMzMjsrLnJlbW92ZV9uZXcmIzMyOz0mIzMy
O210a19kcGlfcmVtb3ZlLA0KJmd0OyYjMzI7JiMzMjsuZHJpdmVyJiMzMjs9JiMzMjt7DQomZ3Q7
JiMzMjsmIzMyOy5uYW1lJiMzMjs9JiMzMjsmcXVvdDttZWRpYXRlay1kcGkmcXVvdDssDQomZ3Q7
JiMzMjsmIzMyOy5vZl9tYXRjaF90YWJsZSYjMzI7PSYjMzI7bXRrX2RwaV9vZl9pZHMsDQoNCjwv
cHJlPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxwcmU+KioqKioqKioqKioqKiBNRURJQVRFSyBD
b25maWRlbnRpYWxpdHkgTm90aWNlICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRp
b24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRh
Y2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9y
IG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3Mu
IEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCBy
ZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmlu
dGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMg
DQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJv
aGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVk
IHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZSANCnRoYXQgeW91IGhhdmUgcmVj
ZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmlt
bWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFs
bCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJv
bSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBl
LW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_003_1794805596.1618793120
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEFuZ2VsbzoNCg0KT24gV2VkLCAyMDIzLTA3LTE5IGF0IDA5OjUwICswMjAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gVGhlIC5yZW1vdmUoKSBjYWxsYmFjayBjYW5u
b3QgZmFpbDogc3dpdGNoIHRvIC5yZW1vdmVfbmV3KCkgYW5kDQo+IGNoYW5nZSBtdGtfZHBpX3Jl
bW92ZSgpIHRvIHZvaWQuDQoNClJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29t
Pg0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8DQo+
IGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4NCj4gLS0tDQo+ICBkcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jIHwgNiArKy0tLS0NCj4gIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHBpLmMNCj4gaW5kZXggZTljNWEwZjQ0NTM3Li4zYTE0MDQ5OGM5OGEgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMNCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYw0KPiBAQCAtMTA4NywxMSArMTA4Nyw5
IEBAIHN0YXRpYyBpbnQgbXRrX2RwaV9wcm9iZShzdHJ1Y3QNCj4gcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQ0KPiAgCXJldHVybiAwOw0KPiAgfQ0KPiAgDQo+IC1zdGF0aWMgaW50IG10a19kcGlfcmVt
b3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICtzdGF0aWMgdm9pZCBtdGtfZHBp
X3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgew0KPiAgCWNvbXBvbmVu
dF9kZWwoJnBkZXYtPmRldiwgJm10a19kcGlfY29tcG9uZW50X29wcyk7DQo+IC0NCj4gLQlyZXR1
cm4gMDsNCj4gIH0NCj4gIA0KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgbXRr
X2RwaV9vZl9pZHNbXSA9IHsNCj4gQEAgLTExMjIsNyArMTEyMCw3IEBAIE1PRFVMRV9ERVZJQ0Vf
VEFCTEUob2YsIG10a19kcGlfb2ZfaWRzKTsNCj4gIA0KPiAgc3RydWN0IHBsYXRmb3JtX2RyaXZl
ciBtdGtfZHBpX2RyaXZlciA9IHsNCj4gIAkucHJvYmUgPSBtdGtfZHBpX3Byb2JlLA0KPiAtCS5y
ZW1vdmUgPSBtdGtfZHBpX3JlbW92ZSwNCj4gKwkucmVtb3ZlX25ldyA9IG10a19kcGlfcmVtb3Zl
LA0KPiAgCS5kcml2ZXIgPSB7DQo+ICAJCS5uYW1lID0gIm1lZGlhdGVrLWRwaSIsDQo+ICAJCS5v
Zl9tYXRjaF90YWJsZSA9IG10a19kcGlfb2ZfaWRzLA0K

--__=_Part_Boundary_003_1794805596.1618793120--

