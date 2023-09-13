Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 371CE7A41EA
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 09:16:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC2D010E1B8;
	Mon, 18 Sep 2023 07:16:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2F5D10E48E
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 09:19:17 +0000 (UTC)
X-UUID: 99996dde521611eea33bb35ae8d461a2-20230913
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=GAbS1knFkhtTTH+U9yohkHGElNtig5FOv41QoN4q+dQ=; 
 b=QH9oDvFTEVhgGz9EMrmDT9+iLnXFOtw70HzXcwO/d9SUXhT6ITdToka8pQCJZxyFHgnQsd+DEQ1XjFCFI4WuHXSAS7JeF/2qI91jO6qOorc6okQfHNhUNvW/+feySIEC92pbno+XAWy2gZOujk2lcC8OaEJ/uVHMrv4Q6+3a2D4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31, REQID:79428208-acab-446d-b568-9ed334d948e9, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:0ad78a4, CLOUDID:bfaee313-4929-4845-9571-38c601e9c3c9,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 99996dde521611eea33bb35ae8d461a2-20230913
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw01.mediatek.com (envelope-from <moudy.ho@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1293847464; Wed, 13 Sep 2023 17:19:11 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 13 Sep 2023 17:19:10 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Wed, 13 Sep 2023 17:19:09 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g3xY0YicZL1lQiGupR7UQ1AnbE4RLv0zdbzF3i0AbhoM3fcHkNBXBEIdtSp8UmFnMcy2MiYS05I8pqWWvOgmJR+Q4cB6JZCJZCR1X9R0DPNiXCk/9GhOEgKphhiuxqWmfEa2XjdpZsV/NrrV8Y0ASp7OGZ2lttHLBWtC1hDCaYpMdfJB0OvRfusTYhJTa92QLIwQ4kkVL6NgdeLM4G2nwZpl0jQimH+h47Bf52mpVeF4bC39ZX6kW5aDNVgH/zhUE2lQAJae8JaMxtlwOgfZ33/YTw7ssiw21Uwjy89I2HB4aU6CoIjlYYrBztougSFy25/8pKOcohxV0oVQMB/3Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GAbS1knFkhtTTH+U9yohkHGElNtig5FOv41QoN4q+dQ=;
 b=e+h7q6qqGfQJzxXHVFwZPwY7/WL1msPc+E3huMvB92bdN8Caujb3Zg8TVLWvpISgdpG5pQ9e51lZZFNt1JU89R3/T/ITtnaI1vdnQZaF9rXWq8pT9KiHJMthZfMHxtO0BULRl0GssHX8vVnHDPcr9OeLyt+tq5BSmgDeYuu5cjkZ0JGq8pDknQMljuwH3FpbdgJPXWDky2mKFNG2/t+t4XsTSJx+rV3Ww/Iu1pV0m7/YCviJaV09P6u2O8SCZTrGN8MtycJRUEWRUdAtL18EGcDlSXHLMV13KPTpDc19cKmx/ke9hfMGeq/wg5tDgOwxokToqQaSue+RuxEoHSYN9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GAbS1knFkhtTTH+U9yohkHGElNtig5FOv41QoN4q+dQ=;
 b=ExWLrg1WG6rzlPzgvQC3kMC7T+Ay3MLGSfwldUeRpy4gSMMGvaWUvirpG/ne67EukBiY9c3pwuvT+D6jfpicfe+aLBeZ9Qqdh4bJJYI9r/hS8f+fAAMmgnonvIV4Rr8bxVp7LPIopdu8ga3RZUyX2Tq/nuZ0/Zu7LyF2FfnWcWQ=
Received: from TY0PR03MB6356.apcprd03.prod.outlook.com (2603:1096:400:14c::9)
 by SEYPR03MB8364.apcprd03.prod.outlook.com (2603:1096:101:1af::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Wed, 13 Sep
 2023 09:19:05 +0000
Received: from TY0PR03MB6356.apcprd03.prod.outlook.com
 ([fe80::492f:b5e4:51a:5ecc]) by TY0PR03MB6356.apcprd03.prod.outlook.com
 ([fe80::492f:b5e4:51a:5ecc%6]) with mapi id 15.20.6792.019; Wed, 13 Sep 2023
 09:19:05 +0000
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
Subject: Re: [PATCH v5 03/14] media: platform: mtk-mdp3: add support second
 sets of MMSYS
Thread-Topic: [PATCH v5 03/14] media: platform: mtk-mdp3: add support second
 sets of MMSYS
Thread-Index: AQHZ5U7fWoTD/qQRkEaax/EZeY2dEbAW6ZIAgAGSfgA=
Date: Wed, 13 Sep 2023 09:19:05 +0000
Message-ID: <4c8a21f32c37e6cb2360763c6306ba5951e99282.camel@mediatek.com>
References: <20230912075805.11432-1-moudy.ho@mediatek.com>
 <20230912075805.11432-4-moudy.ho@mediatek.com>
 <28285acc-4236-36d6-2784-eac0d9220a5b@collabora.com>
In-Reply-To: <28285acc-4236-36d6-2784-eac0d9220a5b@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY0PR03MB6356:EE_|SEYPR03MB8364:EE_
x-ms-office365-filtering-correlation-id: 0ac1d793-80ce-40ea-72ac-08dbb43a7a35
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zZxhi4slRs+9ltnNMPNlYYecK/JcQOws/DkaeQ4I/YgsdH4lfn8UPRjdt9WG/O+ryguwvdb2qZd1xfOXYfdCB8EKvZ1K6/pNJh+DT/+Esi25dJ1MXdc/LGWVRp+D7xHTdWuI1LJLVs0oKn7wYL55aQPxqF8J7Y8AzfULQXo6LdpcoVbWgo/R+xvKLaLkOrqUx0g8OpeGPs6KLBsfQV9XQLshCs9oXrrG3DyH7EKldlssfjh8oX0w7Z3oTC3ICVfB9PXGJsfRwpDzVnF3I5XX8YiA41svJ5uMc2hkDurt7PzKye0+IplRFbc5sN1m3KjYQMfvxcwhAUgWg/q4ErBf2scx1cgzlxwKdlQ6hPn1WIgzActpKtK3aMwVgyt7TJBFRKsI8DHXhw1vW5qWVUWk/o4GK6Zy8reeyxpthARv5xIJE95YihtMJ0NVkyNN3iwOcm7mq5wyVBLhec2QoTV85rc3WT2Id7lVublS0bsTIN55O3OxGuWNdllWF04hviZZaWu/gwXfmrXpDPAT5HMhlC8qnu7Z6kGIXmHuAcSs8ucgSvsBMuk6xHZIlDB1+5g2Un+gEQ5ooq3FANuE5iz9XoSTWsY6WnfCqxTWdafieyZN4Y0mFW6HRUtwX3fsi5LYqnr9yLKcZ/7RC4IEYWdC7nQX/vBrk9lNlhU9Ga1TRGsOLLlDuDMJ5aBJMghtSp9VPATBc7mecLno/AVXfyvKNA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY0PR03MB6356.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(366004)(376002)(346002)(39860400002)(186009)(451199024)(1800799009)(2616005)(83380400001)(38100700002)(8936002)(54906003)(110136005)(66556008)(66476007)(36756003)(6506007)(26005)(85182001)(6512007)(6486002)(8676002)(71200400001)(38070700005)(4326008)(66446008)(122000001)(5660300002)(66946007)(76116006)(2906002)(316002)(478600001)(64756008)(41300700001)(86362001)(921005)(7416002)(99106002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a2IxY3g4bzhqTFV4TjlNTk0yTENvY0tSY2hyZmJSUTZXRjdEY1g1YnVZbVk3?=
 =?utf-8?B?NktCNVdORjNva1dMOExVaUZ6Sy9TVFc2NCtFQnpiNVZ5ODRVdWhkeVY5Ykxk?=
 =?utf-8?B?TEdCdEJHUzZyRGZXcVJHMlJIOCtsdzRSQ0dsZzJsbWR3QVh3ZlRRem5EMnZk?=
 =?utf-8?B?bW50TXVKVjFjZ2pOMEtDdG90eUVIeExWU0p1ZXhpRFExdWNMWHhCeWR3dmJt?=
 =?utf-8?B?bDdrTStJOWFWTEttNzh5b0NDTXAzdHlVUnNaSXp0MVRjRjhuN0czQWZMbHVw?=
 =?utf-8?B?MHlmY1luTkVVNHNDbGpsLzBPRTkvQ1ovNU55NW80bXJEdmZhV3I4SHJTdkZm?=
 =?utf-8?B?bXVZM2I1YU44Mm1qVGdCdW1FcmJDc0lIeTMrc20rL2xoMDBMZzM2QllaRFF2?=
 =?utf-8?B?MzF5K0xaTEhuSS9ZdjJEWmV3emdESHowSTJSOHhvbXVaazg5aGVncnR6a20z?=
 =?utf-8?B?c3BDMTgvVmdYSmdDY0x2eWk0S1hBQ0YwQ0M3SzA0OHA3ZCtzMG44VVRYSnh2?=
 =?utf-8?B?VnEzUkVWeUhsdGYzQTV5ZGxHSnI1ZnAzWi8vQXlvL2N6Q1poTmcxSC9SeDZa?=
 =?utf-8?B?bXJXaTZVbVdieUduVndTU3FpRVU3RWVMRXNUSCtHNml4eDdFeG80T0ZwM1lO?=
 =?utf-8?B?dUo5bmdSbWZqS3U1N0RMOUVWdzc5Qjlidkh1d0FnZlBBaHRqT010cGJpbGx3?=
 =?utf-8?B?Qk9KOGg5ZmNFclZVaURXeVRjM0xOQlNYV05Nc2dTNEVYT2c2ZGgzamxudlRs?=
 =?utf-8?B?TGFjQTRDdFNvTFpETzNPM2hGZ0UwdU5MaWcyYTcyaXplRTFReGVOMktvK1hP?=
 =?utf-8?B?dC8yRnpCdVQvbmZBTjVXQzU2b2xISGR6M1VuRDNqak53NExPU0dWc05oRmov?=
 =?utf-8?B?OUV1TTA4Y21NcHZHTzY4enU0RFpNYnJXOXo1QWlVRGtCazdKc3N5My9aMWt3?=
 =?utf-8?B?dC85RG41UWk0blFUUDBMRGNWWEh0NG44eFBrZVZqY3d2NnRuaWo0Q0lvaXZP?=
 =?utf-8?B?bTJOSVQwZWVpelpKcDV3MlJGT2Zid1B1NDZ5YWVhUWxnZjBMT1lPQ0FWS2VY?=
 =?utf-8?B?MjVvR2dVVVJKUnd1MnRBa2VXMTgzTktzcTVnMXJMaFExcUt4T0x3SHNvZnN2?=
 =?utf-8?B?L0lNTlFYNXhqSk5JUlBrdjJxTjRkYUZSb1lVNDAzOXJCSG1ic0pXR2tRSlZ1?=
 =?utf-8?B?L05JeFhuWlJ5VWhJR3p1ckM5dFRQdVFEMmtXMVcvSGkvVnRYeHdsL0ZQaWo5?=
 =?utf-8?B?VVAyQTF6Zm9Ba1FqcnMxSFNBckU5cGRHck9paENGU0U2V1Rxc3RWNWxNWmUy?=
 =?utf-8?B?eXNIaTdWdjk2VU1McXhJUDUxZFN6KzdtRjdPcFFoc2dVVkN0ZDJQbEkrK2ZD?=
 =?utf-8?B?WHJJcmtIZkV2U2dhRC9FY0wvUmROUmJRZkJsU2doWEs4RElKRXRLRS9MdGRw?=
 =?utf-8?B?Q0k2Y0FrS054RjJ2Y0YvQlRiV0o2aGdhNHVnTzljSVlaZkwrZlZoT2w4UEhE?=
 =?utf-8?B?UlA0ejFxc1gzS1hpcUpQMEkrSkZuTGIrWmtmL1BGWXB6V1ZUTnAyc1JkZmVN?=
 =?utf-8?B?N25mYTEzS3pTc0h3T3JVUFdiZTNSVVh6dXNTcXlJbGJhREVnSndTdENSMUFh?=
 =?utf-8?B?dUNXTnZSaDBWa0dxKzNFbUVnRm9KeE8yekpEMWJ6L3FrU1VhZWpJNDhkWGJy?=
 =?utf-8?B?Z3BIcDNzaFc0cHZXWFcyeE9mcmxMMzNacFE1cVdEbFpXV3NBNVY1MHUxb0Zo?=
 =?utf-8?B?VDRLeWtKM2JwYkEvSjVXNWlreUphL2hKcSsyV2lGR1N6c3JuQXl0YTBYVEhl?=
 =?utf-8?B?M2x4OFVNclA1TXlPRVJJNHkyOU1Qa3hVNWFmYWJFaXpuY2dZZ0pJby9EKy82?=
 =?utf-8?B?UFh6b2oxaHc5ell6bVVUYnF1eUtmazh5TTQ3cTNkV0hscjlwak0zcE9hS0FP?=
 =?utf-8?B?SGJvZ3hDVSt0WFFpbkpxajNSVCtydHJLd0NnMVhZUGp4a092aHVCTE5VN3Nu?=
 =?utf-8?B?eGNVUXhpcitNT2ZESmU4THYySUxUWWRXM1lrT3NnNkl4T0tkOUZoejUra0pZ?=
 =?utf-8?B?VVJnYlFabG12YngyNFVOTk5lNUg0RmtiMVhoUVFuTGJxaWNEajZnWHZUaHJF?=
 =?utf-8?B?Z0hwNzlRd3VjdUtOUXpwM1JXQTQ4dzUrUDhuTHpOTDAzWVRMVytpY05UcnlL?=
 =?utf-8?B?ZEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <24621D296F6E1F4BBADD7EE9E2551FE0@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY0PR03MB6356.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ac1d793-80ce-40ea-72ac-08dbb43a7a35
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2023 09:19:05.4213 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BBiyYAmsSHFRNPiKrW9CE497ZWWDiSyxZ0TtMDOjKr6NIBVp1/U4CIG6XGkQgcdMq2jIiWbOxIQs9Lwx1G/Jeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8364
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--20.644900-8.000000
X-TMASE-MatchedRID: c/HXCguHooHUL3YCMmnG4kD6z8N1m1ALjLOy13Cgb49qSjxROy+AU2yd
 bY7xfgXYECw8p/maK/z04yiGX/wMF294Ipa1otxoH5YQyOg71Zb4uJ1REX4MHQqiCYa6w8tvVSd
 AA6mVeIYUp5xe5/mWoR2a9WLoHBuravi5Lq9+Ha2jFYHTfcPkwhLXa2P1m93zNEJplIoT86yF2x
 YNveuZzS6igz7+K+iZK+OWhFmxeSBHU2fChZKMzVz+axQLnAVB0X0X5dpeBd7zYcyIF7RSVedFU
 1Vx1p6ZlHQ5WrruXIGwZHMQdNbacUL9tcyTZdAsgxsfzkNRlfKx5amWK2anSPoLR4+zsDTtAqYB
 E3k9Mpw=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--20.644900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 58175B11BEE0317E64AE8F3B0F60B7A1598F6B9D08897FC0EE8AA0947213F6B32000:8
X-MTK: N
X-Mailman-Approved-At: Mon, 18 Sep 2023 07:16:21 +0000
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

SGkgQW5nZWxvLA0KDQpPbiBUdWUsIDIwMjMtMDktMTIgYXQgMTE6MTggKzAyMDAsIEFuZ2Vsb0dp
b2FjY2hpbm8gRGVsIFJlZ25vIHdyb3RlOg0KPiBJbCAxMi8wOS8yMyAwOTo1NywgTW91ZHkgSG8g
aGEgc2NyaXR0bzoNCj4gPiBNVDgxOTUgaGFzIHR3byBNTVNZUyBzZXRzLCBWUFBTWVMwIGFuZCBW
UFBTWVMxLg0KPiA+IFRoZXNlIHNldHMgY29vcmRpbmF0ZSBhbmQgY29udHJvbCB0aGUgY2xvY2ss
IHBvd2VyLCBhbmQNCj4gPiByZWdpc3RlciBzZXR0aW5ncyBuZWVkZWQgZm9yIHRoZSBjb21wb25l
bnRzIG9mIE1EUDMuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogTW91ZHkgSG8gPG1vdWR5Lmhv
QG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgIC4uLi9wbGF0Zm9ybS9tZWRpYXRlay9tZHAz
L21kcF9jZmdfZGF0YS5jICAgICB8IDQ0ICsrKysrKysrKy0tLS0tDQo+ID4gLS0tLS0NCj4gPiAg
IC4uLi9wbGF0Zm9ybS9tZWRpYXRlay9tZHAzL210ay1tZHAzLWNvbXAuaCAgICB8ICAxICsNCj4g
PiAgIC4uLi9wbGF0Zm9ybS9tZWRpYXRlay9tZHAzL210ay1tZHAzLWNvcmUuYyAgICB8IDQwICsr
KysrKysrKysrLS0tDQo+ID4gLS0tDQo+ID4gICAuLi4vcGxhdGZvcm0vbWVkaWF0ZWsvbWRwMy9t
dGstbWRwMy1jb3JlLmggICAgfCAgMyArKw0KPiA+ICAgNCBmaWxlcyBjaGFuZ2VkLCA1MyBpbnNl
cnRpb25zKCspLCAzNSBkZWxldGlvbnMoLSkNCg0KKHNuaXApDQoNCj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9tZHAzL210ay1tZHAzLWNvcmUuYw0KPiA+
IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9tZHAzL210ay1tZHAzLWNvcmUuYw0K
PiA+IGluZGV4IGNjNDRiZTEwZmRiNy4uOWMzM2QzYWFmOWNkIDEwMDY0NA0KPiA+IC0tLSBhL2Ry
aXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvbWRwMy9tdGstbWRwMy1jb3JlLmMNCj4gPiAr
KysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL21kcDMvbXRrLW1kcDMtY29yZS5j
DQo+ID4gQEAgLTI2LDM5ICsyNiw0NSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9p
ZCBtZHBfb2ZfaWRzW10gPQ0KPiA+IHsNCj4gPiAgIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIG1k
cF9vZl9pZHMpOw0KPiA+ICAgDQo+ID4gICBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
X19nZXRfcGRldl9ieV9pZChzdHJ1Y3QNCj4gPiBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYsDQo+ID4g
KwkJCQkJCXN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UNCj4gPiAqZnJvbSwNCj4gPiAgIAkJCQkJCWVu
dW0gbWRwX2luZnJhX2lkIGlkKQ0KPiA+ICAgew0KPiA+IC0Jc3RydWN0IGRldmljZV9ub2RlICpu
b2RlOw0KPiA+ICsJc3RydWN0IGRldmljZV9ub2RlICpub2RlLCAqZiA9IE5VTEw7DQo+ID4gICAJ
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqbWRwX3BkZXYgPSBOVUxMOw0KPiA+ICAgCWNvbnN0IHN0
cnVjdCBtdGtfbWRwX2RyaXZlcl9kYXRhICptZHBfZGF0YTsNCj4gPiAgIAljb25zdCBjaGFyICpj
b21wYXQ7DQo+ID4gICANCj4gPiAgIAlpZiAoIXBkZXYpDQo+ID4gLQkJcmV0dXJuIE5VTEw7DQo+
ID4gKwkJcmV0dXJuIEVSUl9QVFIoLUVOT0RFVik7DQo+ID4gICANCj4gDQo+IEZpeGluZyB0aGUg
ZXJyb3IgaGFuZGxpbmcgc2hhbGwgYmUgZG9uZSBpbiBhIGRpZmZlcmVudCBjb21taXQsIHdoaWNo
DQo+IHNoYWxsIGFsc28NCj4gaGF2ZSBhIEZpeGVzIHRhZzogdGhpcyBpcyBib3RoIGZvciBiYWNr
cG9ydGluZyBwdXJwb3NlcyBhbmQgYmVjYXVzZQ0KPiB0aG9zZSBmaXhlcw0KPiBhcmUgbm90IHJl
bGV2YW50IHRvIGFkZGluZyBzdXBwb3J0IGZvciBzZWNvbmRhcnkgc2V0cyBvZiBNTVNZUyAoc28s
DQo+IHRob3NlIGFyZQ0KPiBub3QgcmVsZXZhbnQgZm9yIHRoaXMgc3BlY2lmaWMgY29tbWl0KS4N
Cj4gDQpUaGFua3MgZm9ycmVtaW5kaW5nIG1lLiBJIHdpbGwgYWRkcmVzcyB0aGlzIGVycm9yIGhh
bmRpbmcgc2VwYXJhdGVseSBpbg0KYSBkZWRpY2F0ZWQgZml4IHBhdGNoLg0KDQo+ID4gICAJaWYg
KGlkIDwgTURQX0lORlJBX01NU1lTIHx8IGlkID49IE1EUF9JTkZSQV9NQVgpIHsNCj4gPiAgIAkJ
ZGV2X2VycigmcGRldi0+ZGV2LCAiSWxsZWdhbCBpbmZyYSBpZCAlZFxuIiwgaWQpOw0KPiA+IC0J
CXJldHVybiBOVUxMOw0KPiA+ICsJCXJldHVybiBFUlJfUFRSKC1FTk9ERVYpOw0KPiA+ICAgCX0N
Cj4gPiAgIA0KPiA+ICAgCW1kcF9kYXRhID0gb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRhKCZwZGV2
LT5kZXYpOw0KPiA+ICAgCWlmICghbWRwX2RhdGEpIHsNCj4gPiAgIAkJZGV2X2VycigmcGRldi0+
ZGV2LCAiaGF2ZSBubyBkcml2ZXIgZGF0YSB0byBmaW5kDQo+ID4gbm9kZVxuIik7DQo+ID4gLQkJ
cmV0dXJuIE5VTEw7DQo+ID4gKwkJcmV0dXJuIEVSUl9QVFIoLUVOT0RFVik7DQo+ID4gICAJfQ0K
PiA+ICsNCj4gPiAgIAljb21wYXQgPSBtZHBfZGF0YS0+bWRwX3Byb2JlX2luZnJhW2lkXS5jb21w
YXRpYmxlOw0KPiA+ICsJaWYgKHN0cmxlbihjb21wYXQpID09IDApDQo+ID4gKwkJcmV0dXJuIE5V
TEw7DQo+ID4gICANCj4gPiAtCW5vZGUgPSBvZl9maW5kX2NvbXBhdGlibGVfbm9kZShOVUxMLCBO
VUxMLCBjb21wYXQpOw0KPiA+ICsJaWYgKGZyb20pDQo+ID4gKwkJZiA9IGZyb20tPmRldi5vZl9u
b2RlOw0KPiA+ICsJbm9kZSA9IG9mX2ZpbmRfY29tcGF0aWJsZV9ub2RlKGYsIE5VTEwsIGNvbXBh
dCk7DQo+ID4gICAJaWYgKFdBUk5fT04oIW5vZGUpKSB7DQo+ID4gICAJCWRldl9lcnIoJnBkZXYt
PmRldiwgImZpbmQgbm9kZSBmcm9tIGlkICVkIGZhaWxlZFxuIiwNCj4gPiBpZCk7DQo+ID4gLQkJ
cmV0dXJuIE5VTEw7DQo+ID4gKwkJcmV0dXJuIEVSUl9QVFIoLUVOT0RFVik7DQo+ID4gICAJfQ0K
PiA+ICAgDQo+ID4gICAJbWRwX3BkZXYgPSBvZl9maW5kX2RldmljZV9ieV9ub2RlKG5vZGUpOw0K
PiA+ICAgCW9mX25vZGVfcHV0KG5vZGUpOw0KPiA+ICAgCWlmIChXQVJOX09OKCFtZHBfcGRldikp
IHsNCj4gPiAgIAkJZGV2X2VycigmcGRldi0+ZGV2LCAiZmluZCBwZGV2IGZyb20gaWQgJWQgZmFp
bGVkXG4iLA0KPiA+IGlkKTsNCj4gPiAtCQlyZXR1cm4gTlVMTDsNCj4gPiArCQlyZXR1cm4gRVJS
X1BUUigtRU5PREVWKTsNCj4gPiAgIAl9DQo+ID4gICANCj4gPiAgIAlyZXR1cm4gbWRwX3BkZXY7
DQo+ID4gQEAgLTE1Miw3ICsxNTgsNyBAQCBzdGF0aWMgaW50IG1kcF9wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlDQo+ID4gKnBkZXYpDQo+ID4gICB7DQo+ID4gICAJc3RydWN0IGRldmljZSAq
ZGV2ID0gJnBkZXYtPmRldjsNCj4gPiAgIAlzdHJ1Y3QgbWRwX2RldiAqbWRwOw0KPiA+IC0Jc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqbW1fcGRldjsNCj4gPiArCXN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKm1tX3BkZXYsICptbTJfcGRldjsNCj4gPiAgIAlpbnQgcmV0LCBpLCBtdXRleF9pZDsNCj4g
PiAgIA0KPiA+ICAgCW1kcCA9IGt6YWxsb2Moc2l6ZW9mKCptZHApLCBHRlBfS0VSTkVMKTsNCj4g
PiBAQCAtMTY0LDE1ICsxNzAsMjMgQEAgc3RhdGljIGludCBtZHBfcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZQ0KPiA+ICpwZGV2KQ0KPiA+ICAgCW1kcC0+cGRldiA9IHBkZXY7DQo+ID4gICAJ
bWRwLT5tZHBfZGF0YSA9IG9mX2RldmljZV9nZXRfbWF0Y2hfZGF0YSgmcGRldi0+ZGV2KTsNCj4g
PiAgIA0KPiA+IC0JbW1fcGRldiA9IF9fZ2V0X3BkZXZfYnlfaWQocGRldiwgTURQX0lORlJBX01N
U1lTKTsNCj4gPiAtCWlmICghbW1fcGRldikgew0KPiA+ICsJbW1fcGRldiA9IF9fZ2V0X3BkZXZf
YnlfaWQocGRldiwgTlVMTCwgTURQX0lORlJBX01NU1lTKTsNCj4gPiArCWlmIChJU19FUlJfT1Jf
TlVMTChtbV9wZGV2KSkgew0KPiA+ICAgCQlyZXQgPSAtRU5PREVWOw0KPiA+ICAgCQlnb3RvIGVy
cl9kZXN0cm95X2RldmljZTsNCj4gPiAgIAl9DQo+ID4gICAJbWRwLT5tZHBfbW1zeXMgPSAmbW1f
cGRldi0+ZGV2Ow0KPiA+ICAgDQo+ID4gLQltbV9wZGV2ID0gX19nZXRfcGRldl9ieV9pZChwZGV2
LCBNRFBfSU5GUkFfTVVURVgpOw0KPiA+IC0JaWYgKFdBUk5fT04oIW1tX3BkZXYpKSB7DQo+ID4g
KwkvKiBNTVNZUzIgaXMgbm90IGF2YWlsYWJsZSBvbiBhbGwgY2hpcHMsIHNvIHRoZSBjb25maWcg
bWF5IGJlDQo+ID4gbnVsbC4gKi8NCj4gPiArCW1tMl9wZGV2ID0gX19nZXRfcGRldl9ieV9pZChw
ZGV2LCBtbV9wZGV2LCBNRFBfSU5GUkFfTU1TWVMyKTsNCj4gPiArCWlmIChJU19FUlIobW0yX3Bk
ZXYpKSB7DQo+ID4gKwkJcmV0ID0gUFRSX0VSUihtbTJfcGRldik7DQo+ID4gKwkJZ290byBlcnJf
ZGVzdHJveV9kZXZpY2U7DQo+ID4gKwl9DQo+ID4gKwltZHAtPm1kcF9tbXN5czIgPSAmbW0yX3Bk
ZXYtPmRldjsNCj4gPiArDQo+ID4gKwltbV9wZGV2ID0gX19nZXRfcGRldl9ieV9pZChwZGV2LCBO
VUxMLCBNRFBfSU5GUkFfTVVURVgpOw0KPiA+ICsJaWYgKElTX0VSUl9PUl9OVUxMKG1tX3BkZXYp
KSB7DQo+ID4gICAJCXJldCA9IC1FTk9ERVY7DQo+ID4gICAJCWdvdG8gZXJyX2Rlc3Ryb3lfZGV2
aWNlOw0KPiA+ICAgCX0NCj4gPiBAQCAtMjA4LDcgKzIyMiw3IEBAIHN0YXRpYyBpbnQgbWRwX3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UNCj4gPiAqcGRldikNCj4gPiAgIAkJZ290byBlcnJf
ZGVzdHJveV9qb2Jfd3E7DQo+ID4gICAJfQ0KPiA+ICAgDQo+ID4gLQltbV9wZGV2ID0gX19nZXRf
cGRldl9ieV9pZChwZGV2LCBNRFBfSU5GUkFfU0NQKTsNCj4gPiArCW1tX3BkZXYgPSBfX2dldF9w
ZGV2X2J5X2lkKHBkZXYsIE5VTEwsIE1EUF9JTkZSQV9TQ1ApOw0KPiA+ICAgCWlmIChXQVJOX09O
KCFtbV9wZGV2KSkgew0KPiA+ICAgCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJDb3VsZCBub3QgZ2V0
IHNjcCBkZXZpY2VcbiIpOw0KPiA+ICAgCQlyZXQgPSAtRU5PREVWOw0KPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL21kcDMvbXRrLW1kcDMtY29yZS5oDQo+
ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL21kcDMvbXRrLW1kcDMtY29yZS5o
DQo+ID4gaW5kZXggN2UyMWQyMjZjZWI4Li4wNDM0YjcwZTFmYzkgMTAwNjQ0DQo+ID4gLS0tIGEv
ZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9tZHAzL210ay1tZHAzLWNvcmUuaA0KPiA+
ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvbWRwMy9tdGstbWRwMy1jb3Jl
LmgNCj4gPiBAQCAtMjAsNiArMjAsNyBAQA0KPiA+ICAgDQo+ID4gICBlbnVtIG1kcF9pbmZyYV9p
ZCB7DQo+ID4gICAJTURQX0lORlJBX01NU1lTLA0KPiA+ICsJTURQX0lORlJBX01NU1lTMiwNCj4g
PiAgIAlNRFBfSU5GUkFfTVVURVgsDQo+ID4gICAJTURQX0lORlJBX1NDUCwNCj4gPiAgIAlNRFBf
SU5GUkFfTUFYDQo+ID4gQEAgLTY4LDYgKzY5LDcgQEAgc3RydWN0IG10a19tZHBfZHJpdmVyX2Rh
dGEgew0KPiA+ICAgc3RydWN0IG1kcF9kZXYgew0KPiA+ICAgCXN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UJCQkqcGRldjsNCj4gPiAgIAlzdHJ1Y3QgZGV2aWNlCQkJCSptZHBfbW1zeXM7DQo+ID4gKwlz
dHJ1Y3QgZGV2aWNlCQkJCSptZHBfbW1zeXMyOw0KPiANCj4gSSdtIHdvbmRlcmluZyBpZiB0aGlz
IHdvdWxkIGJlY29tZSBtb3JlIHJlYWRhYmxlIGJ5IGRvaW5nIGl0IGxpa2Ugc286DQo+IA0KPiAJ
c3RydWN0IG1kcF9kZXZfaW5mcmEgew0KPiAJCXN0cnVjdCBkZXZpY2UgKm1tc3lzOw0KPiAJCXN0
cnVjdCBtdGtfbXV0ZXggKm10a19tdXRleFtNRFBfUElQRV9NQVhdOw0KPiAJfQ0KPiANCj4gCXN0
cnVjdCBtZHBfZGV2IHsNCj4gCQlzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2Ow0KPiAJCXN0
cnVjdCBtZHBfZGV2X2luZnJhIG1kcF9pbmZyYTsNCj4gCQkuLi4uLg0KPiAJfQ0KPiANCj4gc28g
dGhhdCB5b3UgY2FuIGFkZCB0aGUgc2Vjb25kYXJ5IE1NU1lTICh0aGF0IGdvZXMgYWxvbmcgd2l0
aCB0aGUNCj4gc2Vjb25kYXJ5DQo+IE1VVEVYIGFueXdheSkgYnkgdGhlbiBjaGFuZ2luZyBtZHBf
aW5mcmEgdG8NCj4gDQo+IAkJc3RydWN0IG10a19kZXZfaW5mcmEgbWRwX2luZnJhW05VTV9NTVNZ
U107DQo+IA0KPiBhbmQgdGhlbiByZWZlcmVuY2luZyB0aGF0IGxpa2UNCj4gDQo+IG1kcC0+bWRw
X2luZnJhW01EUF9JTkZSQV9NTVNZUzBdLT5tbXN5cw0KPiBtZHAtPm1kcF9pbmZyYVtNRFBfSU5G
UkFfTU1TWVMwXS0+bXRrX211dGV4DQo+IG1kcC0+bWRwX2luZnJhW01EUF9JTkZSQV9NTVNZUzFd
LT5tbXN5cw0KPiBtZHAtPm1kcF9pbmZyYVtNRFBfSU5GUkFfTU1TWVMxXS0+bXRrX211dGV4DQo+
IA0KPiBXaGF0IGRvIHlvdSB0aGluaz8NCj4gDQo+IFJlZ2FyZHMsDQo+IEFuZ2Vsbw0KPiANCg0K
VGhhbmtzIGZvciB0aGUgYWR2aWNlLiBJIHdpbGwgZm9sbG93IHlvdXIgc3VnZ2VzdGlvbiB0byBz
aW1wbGlmeSB0aGUNCnNldHRpbmdzLg0KDQpTaW5jZXJlbHksDQpNb3VkeQ0KDQo+ID4gICAJc3Ry
dWN0IG10a19tdXRleAkJCSptZHBfbXV0ZXhbTURQX1BJUEVfTUFYXTsNCj4gPiAgIAlzdHJ1Y3Qg
bWRwX2NvbXAJCQkJKmNvbXBbTURQX01BWF9DT01QXw0KPiA+IENPVU5UXTsNCj4gPiAgIAljb25z
dCBzdHJ1Y3QgbXRrX21kcF9kcml2ZXJfZGF0YQkqbWRwX2RhdGE7DQo+ID4gQEAgLTk2LDYgKzk4
LDcgQEAgc3RydWN0IG1kcF9kZXYgew0KPiA+ICAgDQo+ID4gICBzdHJ1Y3QgbWRwX3BpcGVfaW5m
byB7DQo+ID4gICAJZW51bSBtZHBfcGlwZV9pZCBwaXBlX2lkOw0KPiA+ICsJdTMyIG1tc3lzX2lk
Ow0KPiA+ICAgCXUzMiBtdXRleF9pZDsNCj4gPiAgIH07DQo+ID4gICANCj4gDQo+IA0K
