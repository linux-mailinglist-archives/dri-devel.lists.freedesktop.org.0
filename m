Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92629855BC2
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 08:40:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D7FE10E1DD;
	Thu, 15 Feb 2024 07:40:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="sYNi5BLg";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="E0MIDTJz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E59D010E1DD
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 07:40:19 +0000 (UTC)
X-UUID: 74e8230ccbd511ee9e680517dc993faa-20240215
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=M2FkiD5xWguanBERYZv9LB0BEE1ZVHAsmrkbecDJQPY=; 
 b=sYNi5BLgzogCjVcIiRxGoCAJ41+zFk1ZrxBI0+q3Mu0Cmk2HWG4YhmqjJ58Inouz4bLUmoIyO24cshyxaab38jKlANhD/udvoa80HJt4g/cLhACHsRsGDTpYw5gRRsjPINzECcX3cZ8kBDR3JX19a2Z6qqj8d4J6oVpZJ+IcjHY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:35b88add-f817-416c-8647-5976819a6e49, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6f543d0, CLOUDID:77dbcefe-c16b-4159-a099-3b9d0558e447,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 74e8230ccbd511ee9e680517dc993faa-20240215
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 178615510; Thu, 15 Feb 2024 15:40:14 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 15 Feb 2024 15:40:13 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Thu, 15 Feb 2024 15:40:13 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kDMw+YxIeOcR5Bgu6R7BZ2TGuWXm7CYQLayZig5rW5WWGCX5tSF+4FBRfvNIuiXuoBPtoFjse88Fczyi0lpo3fQl7hA1EnS8I6Va4RE2yn/NCOeboCt7zAmCcIFySWVgaE1MczNSQpwAL9oQB9UvFwnLPftLX0W4aAWItfOZiCBzlIaEwqf2GpNqIIowrrrJm6S/+viojL4knaJqmYo6Dqykzz9ChAz72hXIkVUu4f/3Wb/hCxZfHmVXRrpogqWKA8IlXsSDfZTKTsEAopOM5MAciYu/5rVOCgqVnkB+RMQB2nrLCf6hscVnM3Z1k6MTzoqkWlgCI9lhK5oDjj2Mxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A2l7F/QDFSLduzVrmY2uTQIAAJ3+6muaXF0mmZPSGOg=;
 b=nN17g5ruNpRztViyb1wSehOJ8cOED4CcGgzUMMafXcV3S6ZoXz9xcWt6Fli7grvN1AAYOsKMD5Ogc3SQBL9Bnh8zD9MywaCkrWO2QDbks4YP8R2CqZ9lLsaOJIOjbWmIBzMJKIOn+G06BP8VZFVVh4d7GDZ94L4+kKUj44u5xrnPvspCNh7r806fIkBFVaTafU2XT6i69qZUg9HXTrN1YnUX6MffBB7JSBOudBAlPH0yAI4cT4PBSZcq2SH079zX96Y/ijjvv+++JPoqU699WNCXu60sNGn0SopiJ/BZx2ytZBO3qwHCNWG44j5/cdjt2jzRYxY7pRVhiizxsYkZ2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A2l7F/QDFSLduzVrmY2uTQIAAJ3+6muaXF0mmZPSGOg=;
 b=E0MIDTJzFWRT59FCoAmwCf7EvWzlLzpIIkPkfghbG9uxl8GdKzMPQFi83V27LY282RvtS2o7ltvPvJ7HICKsyxlmj/6wkhnWdpkr4fUf5utxXil9dUhbaQZG7rEno5T4wc3/LsiMbWkqPN+Of15r8/xEFbUVIPHo1hV/Zu/KjZc=
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com (2603:1096:101:83::7)
 by KL1PR0302MB5220.apcprd03.prod.outlook.com (2603:1096:820:45::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Thu, 15 Feb
 2024 07:40:11 +0000
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::afa5:be3f:bc79:48fe]) by SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::afa5:be3f:bc79:48fe%3]) with mapi id 15.20.7270.036; Thu, 15 Feb 2024
 07:40:11 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "kernel@collabora.com" <kernel@collabora.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amergnat@baylibre.com" <amergnat@baylibre.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>
Subject: Re: [PATCH v5 5/9] drm/mediatek: dsi: Replace open-coded instance of
 HZ_PER_MHZ
Thread-Topic: [PATCH v5 5/9] drm/mediatek: dsi: Replace open-coded instance of
 HZ_PER_MHZ
Thread-Index: AQHaWdV9LkYwdGSwT0a3ZKCGfvNxwrELELwA
Date: Thu, 15 Feb 2024 07:40:11 +0000
Message-ID: <eb882267ee845fac3dc8905f46945e57afc38ffc.camel@mediatek.com>
References: <20240207145307.1626009-1-angelogioacchino.delregno@collabora.com>
 <20240207145307.1626009-6-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240207145307.1626009-6-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB6626:EE_|KL1PR0302MB5220:EE_
x-ms-office365-filtering-correlation-id: afd641f7-f75a-474c-a161-08dc2df95737
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Z6Qre8Ci8heFulO585s0yo8988fHajfbuCUAcvp/1dmLj/b/U1wkBkxRjFfrUGmrLuey9IyoLdZkjFk9FODQxgOhHHLS33fk/UBt8vZSrKNZunIVGrdOqy+sjJjy9b3gTMX4Xp66HGRGbVEkkaAFBQO3KruLxRd+NA0kQilg2heIozXRbyv78sECeS8G2DSyLkbjfCFB2MIatxxmnkvZdxCKjO/5FtKcm/qVS5TEj1Gv9sLbwzi6eLFBWK1qgpaGF6IdtrLq5L75/Liu5uiGqVYbEhy44YTW4+XmQ+YkyPXTUzHShfAtMtBe0xmRUpFrFyRl74883hhK+ZbQW6jYO0DlZtQTWxjm1ebp7LDAUS2VX9Gl+tfwzHSW565O3csFqwV/2j1Zi9OJQ4MiYyyDgGo4ihenO0VL235LRq/jxHAcUuc/LWwkZzfmoag8vsinTGARKau6CrpGq7sZ6pRGE6+FVHjwNd68KPgivfb+3QDT2A0rP5xJVwey8Bse2WtK8YRoam4aKSKF6lhDvanyfsvnHKNy/O6fpx7e89WNnoxhabQkq2W+i8GfQUCzYzQK0WVATUiXczMPArETopXG1D4J+A7Up3gDh3jFspMfdzB9ANqpCCcnh3uONNoG1jHi
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB6626.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(136003)(39860400002)(366004)(346002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(4326008)(8936002)(7416002)(76116006)(2906002)(5660300002)(8676002)(2616005)(83380400001)(38100700002)(38070700009)(36756003)(85182001)(122000001)(66556008)(86362001)(6506007)(54906003)(66946007)(64756008)(26005)(316002)(110136005)(66446008)(66476007)(6512007)(6486002)(478600001)(71200400001)(41300700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bWloTHhRUk9vSTZKaTZPd0hSbGcrS0t1alZNUUdQa0dtZk9kTVBBYm1TbHVQ?=
 =?utf-8?B?dk9oY2VjT3BWWXRpM1paMXArdTFXQUs2emhVdGtNbWdLWHRyMDYvZnBGcGMx?=
 =?utf-8?B?OXVTMUtyc3k0bCthMXJ5YW9IT1cyZzliYVE1MnJHNStXWE16SldCbmZQN085?=
 =?utf-8?B?dk8yUTNXUUxtK0NXR05nRkF0L1oxTnp3bms3Y05nNlJsSXkwOEtGTVpqbXB3?=
 =?utf-8?B?a0RNVDVhQXQyRS9EMkFlZWJ5NDJUQ1ZGV0w4VmQydDE3V0lKNm5sR0VSdHRm?=
 =?utf-8?B?ZTI3QVNBbDJWSVNmZGk4N0lsdDY1dytIakNuR21MVllpSHhNWlRPdnEvZDQr?=
 =?utf-8?B?Ukl5T1htbHVhM2dubG5tTDFFTDM1VG9lUm9lbWtHTmtCTklyM3AzK0p3YUNl?=
 =?utf-8?B?Q0Z5WVExcjJxWkhVOFRzYVU5SjAreXFvZU1YdWFIYk9ZZE5FNGVCMW5PREpj?=
 =?utf-8?B?ckpSRVgzSTk4N3labUdjR2pnMEVtZjJleHljZE5uTFhwWEhIOFFNWHRzRVdh?=
 =?utf-8?B?ZW83aUVva2NEd0VFSGJDczhZMWdFMmVEVi9zM2JrN3hCbitsaVRWM1RBRHpz?=
 =?utf-8?B?a1pjdzQvbkVZUVN4aUpYVDF4ZjRlODJIQ0hjN2s1VWZmQXpjL0M1MVFVRy85?=
 =?utf-8?B?a3lPWTJqTXh4ajBnNk5kcXY2YTFrZ0R5RUcrRGZyaFBWY1NuQmkxMDBuc1M1?=
 =?utf-8?B?YTY2SERaTXlVeGpoSHBuNFVTOXg0MStyRG01cDRDNXVOcjhGN2YvNW5aVlE4?=
 =?utf-8?B?Mi9XT29Zd0wrdDBhR2plVGpzRUllVzlkRnhXZTlmMkRmajJHallMS3ZqRTVv?=
 =?utf-8?B?dER1d21CY3NwVjBsNHpuQlVIMjJnbjhZb0xFVDlUL3hxdm5teFpqYXAxNnBR?=
 =?utf-8?B?ZXVIYkxjenQvbHhKL21OUjF2aXlud1VJamRGcUNYQm9mY1F4QmRidEhabjlv?=
 =?utf-8?B?d25PY2dWYmI5eUZqZmIwcytXUE4ybXdvQTZuNTZTUm5scnVTclhDc3hHRkpj?=
 =?utf-8?B?Q0I4UW0zM0Q5YXUyRTNRQ2ZSR2R0RTRtSHRLVHpvVHI1YzVzbUxFZHFvWXpy?=
 =?utf-8?B?dHZ0V0lsOXFlMTdrLzRvbHJ1cDhFODNKVU9INDRGRU9zZFlETFIycHpvanpJ?=
 =?utf-8?B?Tkp2ekpzd25wd2lnYzgwRWFYTjEybUJzUWRldnBrTlBZUUNhVUdzN0pVZThw?=
 =?utf-8?B?VnBDYlRRSTFoSGdGekF0QXpkNnRFUVBGdVlBcytDSlpxQmNndkl1dTRnZGtC?=
 =?utf-8?B?RUdLNW9iY1BwOC8vR1pjZ2pqaVZXZE5jRG9zVEpvQ0t1aXpLcHltQjd3SFdy?=
 =?utf-8?B?R0xOdDhzSENWYkprSVVvVzJmRk5jdm1sR09DZTl4emdabHdLVWZaT3NBY1dN?=
 =?utf-8?B?Vnh5ZkVENlQvbTlmaXAyUXBoem8wcFQxS1J4cmgzNWREZ05FTDJ5aWpja1RK?=
 =?utf-8?B?eS9oQUJRcTVRckRLMnMrdVR4d2tCV2Q5cFRCdTR2ODJKd2F5Ti9sNDgxR3lv?=
 =?utf-8?B?UVRUblBHUWxlbDFUT1NUaUhCcUZNdENQSmdlMEpYRGVVNXNGQ1hIUHl4bHo0?=
 =?utf-8?B?cWRTdHd3b2xmL1R5OUxqR2txRXZhSXhsL25RdjVIUUR0ZGw4b01xREM3SzBF?=
 =?utf-8?B?T0pydS9MMjlOTmZPMkdiNE9uUWJLL3hMWTdpUVRPMi9QakVXT1hMVmF0L0pL?=
 =?utf-8?B?TnBlbDEyd3lzZjZuRjljblc4QXRDMUZweUpyenc0QkwyUFh6bHR5V3FscE5w?=
 =?utf-8?B?THVQVmhiblFXcUdWY2IxZlZ4bnBxenJ3cEl1OSthL2Q0L3lrb2dTV3lOSzEy?=
 =?utf-8?B?ZzkvZnhPVjZiQzRGQTVENXdkUmNOZVhsSUwrSWpkRExLY2V5TER5bkEwMmtm?=
 =?utf-8?B?ZUh6bEpia1dXM3BuaGM4bmFLRDA3Ym5XSXJyRTRBMWdGenhlYUdkSng1YVZr?=
 =?utf-8?B?VHJCQ3lpTEZxckE0NHgxR1pHT0NkMFBmSDVoM1NpZERuUHNOR2wwQlpaOCts?=
 =?utf-8?B?Q0VvMUZ3QVlUaEYxS05MOFUrTmVlOWhwME1FeEI0bFpHOFpRbm1JcTVNaFh5?=
 =?utf-8?B?SEdHbUpFOFV4d1hNTGY0dWJBVGVqWmdTTk9CQUFuUGl1UldWb1pLZDJtV3Rv?=
 =?utf-8?Q?cCMhHmj1kMGutZrt7JbPcI6kT?=
Content-ID: <268817BAB3B6A9429049E9A1B1B2E15B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB6626.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afd641f7-f75a-474c-a161-08dc2df95737
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2024 07:40:11.2532 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pOPeRnkukgAfTIPIQqYf/VzeYY3ueMXr30DLiWOMdlujdGgZLOBsdxFCTgicJqVvwpjkHoYwM5zqwIN5JqAKGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0302MB5220
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_005_535390178.423705665"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_005_535390178.423705665
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtBbmdlbG86DQoNCk9uJiMzMjtXZWQsJiMz
MjsyMDI0LTAyLTA3JiMzMjthdCYjMzI7MTU6NTMmIzMyOyswMTAwLCYjMzI7QW5nZWxvR2lvYWNj
aGlubyYjMzI7RGVsJiMzMjtSZWdubyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtJbiYjMzI7bXRrX2Rz
aV9waHlfdGltY29uZmlnKCksJiMzMjt3ZSYjMzk7cmUmIzMyO2RpdmlkaW5nJiMzMjt0aGUmIzMy
OyYjOTY7ZGF0YV9yYXRlJiM5NjsmIzMyO3ZhcmlhYmxlLA0KJmd0OyYjMzI7ZXhwcmVzc2VkJiMz
MjtpbiYjMzI7SHomIzMyO3RvJiMzMjtyZXRyaWV2ZSYjMzI7YSYjMzI7dmFsdWUmIzMyO2luJiMz
MjtNSHo6JiMzMjtpbnN0ZWFkJiMzMjtvZiYjMzI7b3Blbi1jb2RpbmcsDQomZ3Q7JiMzMjt1c2Um
IzMyO3RoZSYjMzI7SFpfUEVSX01IWiYjMzI7ZGVmaW5pdGlvbiwmIzMyO2F2YWlsYWJsZSYjMzI7
aW4mIzMyO2xpbnV4L3VuaXRzLmguDQoNClJldmlld2VkLWJ5OiYjMzI7Q0smIzMyO0h1JiMzMjsm
bHQ7Y2suaHVAbWVkaWF0ZWsuY29tJmd0Ow0KDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1Jldmlld2Vk
LWJ5OiYjMzI7QWxleGFuZHJlJiMzMjtNZXJnbmF0JiMzMjsmbHQ7YW1lcmduYXRAYmF5bGlicmUu
Y29tJmd0Ow0KJmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO0FuZ2Vsb0dpb2FjY2hpbm8mIzMy
O0RlbCYjMzI7UmVnbm8mIzMyOyZsdDsNCiZndDsmIzMyO2FuZ2Vsb2dpb2FjY2hpbm8uZGVscmVn
bm9AY29sbGFib3JhLmNvbSZndDsNCiZndDsmIzMyOy0tLQ0KJmd0OyYjMzI7JiMzMjtkcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jJiMzMjt8JiMzMjszJiMzMjsrKy0NCiZndDsmIzMy
OyYjMzI7MSYjMzI7ZmlsZSYjMzI7Y2hhbmdlZCwmIzMyOzImIzMyO2luc2VydGlvbnMoKyksJiMz
MjsxJiMzMjtkZWxldGlvbigtKQ0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtkaWZmJiMzMjstLWdpdCYj
MzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jDQomZ3Q7JiMzMjtiL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMNCiZndDsmIzMyO2luZGV4JiMzMjthMzMwYmI5
NGM0NGEuLjUyNzU4Y2FiMGFiZiYjMzI7MTAwNjQ0DQomZ3Q7JiMzMjstLS0mIzMyO2EvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYw0KJmd0OyYjMzI7KysrJiMzMjtiL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMNCiZndDsmIzMyO0BAJiMzMjstMTMsNiYjMzI7KzEz
LDcmIzMyO0BADQomZ3Q7JiMzMjsmIzMyOyNpbmNsdWRlJiMzMjsmbHQ7bGludXgvcGh5L3BoeS5o
Jmd0Ow0KJmd0OyYjMzI7JiMzMjsjaW5jbHVkZSYjMzI7Jmx0O2xpbnV4L3BsYXRmb3JtX2Rldmlj
ZS5oJmd0Ow0KJmd0OyYjMzI7JiMzMjsjaW5jbHVkZSYjMzI7Jmx0O2xpbnV4L3Jlc2V0LmgmZ3Q7
DQomZ3Q7JiMzMjsrI2luY2x1ZGUmIzMyOyZsdDtsaW51eC91bml0cy5oJmd0Ow0KJmd0OyYjMzI7
JiMzMjsNCiZndDsmIzMyOyYjMzI7I2luY2x1ZGUmIzMyOyZsdDt2aWRlby9taXBpX2Rpc3BsYXku
aCZndDsNCiZndDsmIzMyOyYjMzI7I2luY2x1ZGUmIzMyOyZsdDt2aWRlby92aWRlb21vZGUuaCZn
dDsNCiZndDsmIzMyO0BAJiMzMjstMjM4LDcmIzMyOysyMzksNyYjMzI7QEAmIzMyO3N0YXRpYyYj
MzI7dm9pZCYjMzI7bXRrX2RzaV9tYXNrKHN0cnVjdCYjMzI7bXRrX2RzaSYjMzI7KmRzaSwmIzMy
O3UzMg0KJmd0OyYjMzI7b2Zmc2V0LCYjMzI7dTMyJiMzMjttYXNrLCYjMzI7dTMyJiMzMjtkYXRh
KQ0KJmd0OyYjMzI7JiMzMjtzdGF0aWMmIzMyO3ZvaWQmIzMyO210a19kc2lfcGh5X3RpbWNvbmZp
ZyhzdHJ1Y3QmIzMyO210a19kc2kmIzMyOypkc2kpDQomZ3Q7JiMzMjsmIzMyO3sNCiZndDsmIzMy
OyYjMzI7dTMyJiMzMjt0aW1jb24wLCYjMzI7dGltY29uMSwmIzMyO3RpbWNvbjIsJiMzMjt0aW1j
b24zOw0KJmd0OyYjMzI7LXUzMiYjMzI7ZGF0YV9yYXRlX21oeiYjMzI7PSYjMzI7RElWX1JPVU5E
X1VQKGRzaS0mZ3Q7ZGF0YV9yYXRlLCYjMzI7MTAwMDAwMCk7DQomZ3Q7JiMzMjsrdTMyJiMzMjtk
YXRhX3JhdGVfbWh6JiMzMjs9JiMzMjtESVZfUk9VTkRfVVAoZHNpLSZndDtkYXRhX3JhdGUsJiMz
MjtIWl9QRVJfTUhaKTsNCiZndDsmIzMyOyYjMzI7c3RydWN0JiMzMjttdGtfcGh5X3RpbWluZyYj
MzI7KnRpbWluZyYjMzI7PSYjMzI7JmFtcDtkc2ktJmd0O3BoeV90aW1pbmc7DQomZ3Q7JiMzMjsm
IzMyOw0KJmd0OyYjMzI7JiMzMjt0aW1pbmctJmd0O2xweCYjMzI7PSYjMzI7KDYwJiMzMjsqJiMz
MjtkYXRhX3JhdGVfbWh6JiMzMjsvJiMzMjsoOCYjMzI7KiYjMzI7MTAwMCkpJiMzMjsrJiMzMjsx
Ow0KDQo8L3ByZT4NCjwvcD48L2JvZHk+PC9odG1sPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxw
cmU+KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlDQogKioqKioq
KioqKioqKioqKioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwg
bWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFs
LCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNj
bG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252
ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2Vt
aW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBv
ZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVk
IHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1
bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBv
ciBiZWxpZXZlDQogDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9y
LCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8g
dGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwg
KGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QN
CmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24u
IFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_005_535390178.423705665
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEFuZ2VsbzoNCg0KT24gV2VkLCAyMDI0LTAyLTA3IGF0IDE1OjUzICswMTAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gSW4gbXRrX2RzaV9waHlfdGltY29uZmlnKCks
IHdlJ3JlIGRpdmlkaW5nIHRoZSBgZGF0YV9yYXRlYCB2YXJpYWJsZSwNCj4gZXhwcmVzc2VkIGlu
IEh6IHRvIHJldHJpZXZlIGEgdmFsdWUgaW4gTUh6OiBpbnN0ZWFkIG9mIG9wZW4tY29kaW5nLA0K
PiB1c2UgdGhlIEhaX1BFUl9NSFogZGVmaW5pdGlvbiwgYXZhaWxhYmxlIGluIGxpbnV4L3VuaXRz
LmguDQoNClJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPg0KDQo+IA0KPiBS
ZXZpZXdlZC1ieTogQWxleGFuZHJlIE1lcmduYXQgPGFtZXJnbmF0QGJheWxpYnJlLmNvbT4NCj4g
U2lnbmVkLW9mZi1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPA0KPiBhbmdlbG9naW9h
Y2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kc2kuYyB8IDMgKystDQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kc2kuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNp
LmMNCj4gaW5kZXggYTMzMGJiOTRjNDRhLi41Mjc1OGNhYjBhYmYgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kc2kuYw0KPiBAQCAtMTMsNiArMTMsNyBAQA0KPiAgI2luY2x1ZGUgPGxp
bnV4L3BoeS9waHkuaD4NCj4gICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4NCj4g
ICNpbmNsdWRlIDxsaW51eC9yZXNldC5oPg0KPiArI2luY2x1ZGUgPGxpbnV4L3VuaXRzLmg+DQo+
ICANCj4gICNpbmNsdWRlIDx2aWRlby9taXBpX2Rpc3BsYXkuaD4NCj4gICNpbmNsdWRlIDx2aWRl
by92aWRlb21vZGUuaD4NCj4gQEAgLTIzOCw3ICsyMzksNyBAQCBzdGF0aWMgdm9pZCBtdGtfZHNp
X21hc2soc3RydWN0IG10a19kc2kgKmRzaSwgdTMyDQo+IG9mZnNldCwgdTMyIG1hc2ssIHUzMiBk
YXRhKQ0KPiAgc3RhdGljIHZvaWQgbXRrX2RzaV9waHlfdGltY29uZmlnKHN0cnVjdCBtdGtfZHNp
ICpkc2kpDQo+ICB7DQo+ICAJdTMyIHRpbWNvbjAsIHRpbWNvbjEsIHRpbWNvbjIsIHRpbWNvbjM7
DQo+IC0JdTMyIGRhdGFfcmF0ZV9taHogPSBESVZfUk9VTkRfVVAoZHNpLT5kYXRhX3JhdGUsIDEw
MDAwMDApOw0KPiArCXUzMiBkYXRhX3JhdGVfbWh6ID0gRElWX1JPVU5EX1VQKGRzaS0+ZGF0YV9y
YXRlLCBIWl9QRVJfTUhaKTsNCj4gIAlzdHJ1Y3QgbXRrX3BoeV90aW1pbmcgKnRpbWluZyA9ICZk
c2ktPnBoeV90aW1pbmc7DQo+ICANCj4gIAl0aW1pbmctPmxweCA9ICg2MCAqIGRhdGFfcmF0ZV9t
aHogLyAoOCAqIDEwMDApKSArIDE7DQo=

--__=_Part_Boundary_005_535390178.423705665--

