Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1765976442A
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 05:11:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58EB110E4D1;
	Thu, 27 Jul 2023 03:11:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1479810E4D1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 03:11:29 +0000 (UTC)
X-UUID: 4651346a2c2b11eeb20a276fd37b9834-20230727
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=3bY/ALtYdzm3eeIbdLDnbTTy2VFfT2L/uaBjgDY/AnA=; 
 b=QQpWtiuLMcXDrBvvcmUbz4q6QGr/vHDJZgPjkz22pPV283yThGci7nrt7lFUJISlYWb3SQkryP/b0d9ctPqpsxKikDCxof35JzQlotMDt8WBWlb33V4Zf/21m/mrRbcT6jaXr2FziWg8oqmifyKIt056lOkBpLtvBMZ+QAbP6NU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.29, REQID:b85a4eec-6113-4e54-aed0-8fdca6902ba5, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:45
X-CID-INFO: VERSION:1.1.29, REQID:b85a4eec-6113-4e54-aed0-8fdca6902ba5, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:45
X-CID-META: VersionHash:e7562a7, CLOUDID:a33294a0-0933-4333-8d4f-6c3c53ebd55b,
 B
 ulkID:230727111127D1PUHM2O,BulkQuantity:0,Recheck:0,SF:38|29|28|17|19|48|1
 02,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:nil,QS:nil,BEC:ni
 l,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:PA,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR, TF_CID_SPAM_SDM, TF_CID_SPAM_FAS,
 TF_CID_SPAM_FSD, TF_CID_SPAM_ULN
X-UUID: 4651346a2c2b11eeb20a276fd37b9834-20230727
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1892406568; Thu, 27 Jul 2023 11:11:26 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 27 Jul 2023 11:11:25 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Thu, 27 Jul 2023 11:11:25 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SWJIDH+yu7UPr6nR0ik1aT1P0P57lI5LIV5Emm5Qd8+NnP1/QBYT/EQuVj7V1l0szV6Z/Ugg8nOt9LKq/00mpIXSjsxjcRxi1N5uV/Rl8qbrekWpelTEt0Xc6QY17ORnWp+l8zw32Ah+543jPR/Jy2GWGtkLcOxxWAJxygDLCSVkMUGaGJ9gxz75nkHoToCbh40D36ozAnnWxP5XHQs92hAHn0sEYNQrO0x8Rez3RxQjgzBF9n+g254Kruti2MQVb/wf2y89PQtVgdAV2HHamfVSNb1Yj0wtQSpxeIZHtNFvrShYq6eYI+LSvMIBEOUTcnIyKhBswusJ0Kff0JgFsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+uDrFmPjR1fxWvUKRgkGpJ/lhf8IkxhdNXfpiPQ96CI=;
 b=FzmidMbBx3hkgYnEsTJQMzwBd9WYP8A9+gGONOBR28tMLtmvX5ZQjPiYbkFVdWI+ziP9GfXtz58ZFOylRPm5DRlgFlRhCMMVzEW3BU37QHTmzWINdeK3HTmGVEz7hW7jLf99X6b6X7zZSY6Vw5AyUDihnKC7vTUtvSUFLGFSv2qAO5Vl8gA7VlOteeN6GhMGOOeLIGbylHuZ7ZXxPfkN+F+vNJp6J6NUnSwsZQiyhdUxDqEOded5byWpX7Phpzn2p2kPStLp5W9qAB1q/eOyVZW/fcnCZcGG/ze+EdrQ0c/cAQvjVGF830Pr+TdDp2j6QqBtmlYf+USnuv1KXdTIbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+uDrFmPjR1fxWvUKRgkGpJ/lhf8IkxhdNXfpiPQ96CI=;
 b=Yp+sGinK8XCZoXFrroX1Xc88mo4gRH2iWa51v+WuSsOix+p1bkx+rYUpJEHYXcHYw8AYkMO8HXHrh9kv3bhQaX+xTS0FeoE6htgD05ndEjbPCpUWjDUL4gtgLB76WQGox18v/GeU9p3IVF4m1Sm6Ng6dG3DqRiZWsRZ8wZUuKAg=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SG2PR03MB6454.apcprd03.prod.outlook.com (2603:1096:4:1c2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Thu, 27 Jul
 2023 03:11:23 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::d126:7f34:9e4f:a95]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::d126:7f34:9e4f:a95%4]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 03:11:23 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>
Subject: Re: [PATCH v3 1/6] drm/mediatek: mtk_dpi: Simplify with
 devm_drm_bridge_add()
Thread-Topic: [PATCH v3 1/6] drm/mediatek: mtk_dpi: Simplify with
 devm_drm_bridge_add()
Thread-Index: AQHZv5qe+EVXb5Vkz0KODrmR+zT/ga/M8NQA
Date: Thu, 27 Jul 2023 03:11:23 +0000
Message-ID: <ed59ff190c9a798d60068c4ac02abb429e9073b1.camel@mediatek.com>
References: <20230726082245.550929-1-angelogioacchino.delregno@collabora.com>
 <20230726082245.550929-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230726082245.550929-2-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SG2PR03MB6454:EE_
x-ms-office365-filtering-correlation-id: f1e6ab42-0adc-4137-5172-08db8e4f282b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ROwJRHKRFvf7UUl5wFYWIQ7+i4lW+SFuiIpB2XOi1Qtym5xPNLaNh+Jz/ozFq5l/OX4226bbyamvq57NIl0b7Vzc/oL/RgMFqlIf5fqEJQ/dv0CLh9wsOtbOP20NuJDKs5/C9JFo7tnf8U5kFyD1Fds2+kZB+pJmT/ldr5W++6gdgzObmlLrsebYY7ty3rW78c3SQOxukn7td9i2NRL7jtJ25odzal9KYRQWrt3FTmbgqAowXtnBKnHfXee4HeNeTYFC3enForqh7B3gkt1Cp3dHJLwH0VPEnlDEMCyGzycCKC01WCDhJ527kzKIMRQiyZhHpLK33vKFFm9cQiSQq2y2xd9+patyYk3FtadLgmEVppVlY0XRGmlIwee6YMfxkRWKbQdAY21EJxlHZ7crZeyqh53kNAb++p/be7Vu8lav32cOAVjgNZo1vjLugUExM9KosabqzJGQgVa6ikrF5ZTlJOndbdsvOoUDtsnhOUEHgEqC1HG5uc3lGmjHtN0gRjEx/vJdpuATGqNqY4yZ4PxXLq3MXHICS4DRXY61jREt/3XmwdV0RsA7yzRPCRt1rq/I0smb9k5j10K3Zml9Li/TiFoVeaHu4U8R5wOWRTzA15GwHp6+H6NJF7pC8j5NjqLqSawybERktqsCPE2TN5e5UNk5GdydYick/ZRHb1I=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(366004)(136003)(376002)(346002)(396003)(451199021)(38070700005)(85182001)(36756003)(2906002)(86362001)(83380400001)(186003)(6506007)(26005)(6512007)(54906003)(478600001)(122000001)(6486002)(110136005)(2616005)(316002)(8936002)(4326008)(66476007)(8676002)(76116006)(38100700002)(66446008)(66946007)(66556008)(71200400001)(64756008)(41300700001)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?elhXcHdWUVI1VEdzMkQwTW50bFN5enB5TitoOHN3a1hvZHdpd0NoTDhGc1cv?=
 =?utf-8?B?QkkvVzJmVVprSnM2TEZXUGM0bkV4N0dRMEdabityb1J1dTZUYUV1bFFaY2JM?=
 =?utf-8?B?eEVjb0ptOFNNL1QzU2FKY3dVRmJDSitQUitYREVsNzZ2Uy9oMU12TWdFVTA2?=
 =?utf-8?B?UnEvUmM3QU93cHVjejVFZDc0VW16aER5MlhsSFZpTU5sQVgxNE5sQWwzK2li?=
 =?utf-8?B?QkxYbk41Ty9qK1lkNmN2cTVtNFNnZlFibHROZU1PSEhFVmd6dWRZS09ycGNr?=
 =?utf-8?B?bkY1N2R2SCt6WExTd0t1QWowcE5CRUtWU0kzMjJyTjRpd0RFREFDcXJmd3di?=
 =?utf-8?B?bm1SMER2d1lUVlpIdFlJYzZEWThaK1VNRHVSNURlU0tYQzNMT2J5SWdiQVRw?=
 =?utf-8?B?eHFMaHF4SFhYODJzbkgxcTZ3U3lMK2dNbklmL0NPT1RXZjF0YnFpZGdTdzFU?=
 =?utf-8?B?WEo1aTdTR0g1YXVmd09RM1JiczZwZ0Z1dGFHYUR2TFQwR1oycDhPdDNEdU9q?=
 =?utf-8?B?R3VuS09odHhaeHdsQVBVcmRHVFZNUE1ZOGNlaTV0S25YUnYvSy85cUpSNzRx?=
 =?utf-8?B?VElmSUhHU0k0YnNsbDk4VDR0WkdzN1llc3BoMithWU5zOVdtdG54bEZsMmw3?=
 =?utf-8?B?clVobzV4K1VFQkF5L3RCRlhYeUcydjZvcEdFU1ViWUIrdk51V3BDUVB0QUZy?=
 =?utf-8?B?Z08vUi8zSmFKWGFNd3V4QWdFaHMxUHZrdVg5WHB4YzE0cnYyL3FQQ0Ewc0du?=
 =?utf-8?B?NUM2RzZvYjZwYjF4S2p0UVkrSEsvaVp5ZUw1NzN5MmZuYVhDOURHS1FvdlVJ?=
 =?utf-8?B?eXYrUm1UcjBYdzV6SFdqcUM2M0R6SXVnU3ZLY0tsT2ZuMHpsTnVySnQ0WlJT?=
 =?utf-8?B?RmFBaDZkR3JZWjY0bUdjUjBXSnJ5aER6OVhlclVOaEhFTVVJd0NiUVBuY0Jq?=
 =?utf-8?B?b1Y0VFEvS3o5cEwwOUppNmF1aEpGS3VOelNzNmsvODd6OUJ0YWdvRGtBaGtv?=
 =?utf-8?B?dm1adm9XV1hLSHFPWjdqUWtHdUN4OUpWTnNTQWtmcFhjN2ViNXNsYVdrSy9W?=
 =?utf-8?B?TEpUVlF3NFJtOEtNVkZ0ME9lRmtjOE80L3RvcjIwNVpHWjZIVU9DQW9PelAz?=
 =?utf-8?B?b2JMYjMrU0ZRRmNXZTBUQ2dNb2FkZ0dUL1NvVFMwU3pRUlpIOGMvRUtOSDA2?=
 =?utf-8?B?RXphN3F0MERNMzNlNFpDM3JsaExpYmkzc3Q5d3Njbm9rai9FTkdJWjA0Mk4r?=
 =?utf-8?B?VGpXMnVGd1RURUc0c0FSaDJpWFZkbmI5cGNhZE5rQjk4ZUlKUkVUck95dmx1?=
 =?utf-8?B?eU8rcXVZeGd6SHkwSUtmSEoyenZIY0ZPSG5acC9LKzN0WGYvWGVTS2NDSzha?=
 =?utf-8?B?NlJBRkYyOXVrZlp1b3V4TnNtZTlrU3U4L0p0SWRSNjdCdmIvNWdVTlZnM0p5?=
 =?utf-8?B?cjhpa1FpU0hrUlRjWVQ4ZE9CT2s2ZFNobE9ZNy9DeFg2ZURJK2JqRnprOUhw?=
 =?utf-8?B?NzJQSHNTbmpTZFpxS3NyNEhHdDJ0Q1VlM3EzTlA4clo0bE1meTJCWFRBS2NU?=
 =?utf-8?B?Rlc1MEU4cElkbGtWL1VpTHNGWGdjcU1JZjlVKzdOZXpiL2Fic3VCcy9lZGl4?=
 =?utf-8?B?RmI2bFFjaWJtRkZKNVIyZHRqSWt0U0U5RWtnSGZidzVKdHQvQmdnYXFzeDU4?=
 =?utf-8?B?V2FneDI4cHFxamVraElOdEVyS2xQU0FmbU82ZDFiZ3VwTTBOZHhEc2hUR3M4?=
 =?utf-8?B?ZmhmYXczKytGMXdDd3JLZXdHclpvYWFRMDRQS3ptK2NaYzdIdFByMkdFai96?=
 =?utf-8?B?c2pCbjF2TU1aclRhdGZtRjhjU09mQlpZaW8zT3pqamNFU2pQYUlnc2o2Y1Jo?=
 =?utf-8?B?MUZBZ3BKRFZNeVZCZWFpU0ZONVR5ZG1GOWhVLzFiN0VJQmZ6RGZRZ2VUa3lY?=
 =?utf-8?B?NFU0VWlVelhuVngzKzNSb2pQeDJ6NUU5VEc1ek0xU3Vrdk5rdm4xSEFMS0Ir?=
 =?utf-8?B?d3ViRmtiS1QrSTJlWVQ5RW9oa1FDSlQ2N3FUdVVwM0J2U1MxcUp6dVVYbUNk?=
 =?utf-8?B?SWt0bGhUbjBvUzFUamFyRElsdVVmRlF3NUd5cmhXVm5Gejc3VS91bDBuVEVu?=
 =?utf-8?Q?N3KqIgz1Lp4o2CbLxBqinQTtd?=
Content-ID: <98A9D00EB0BC9B4AA212EE3A1923C928@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1e6ab42-0adc-4137-5172-08db8e4f282b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2023 03:11:23.0522 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cEx8b4Ti5/6gA3wGADIBu3Da/24UayOmBBlaJk2N/tlsiLiUh3kQrNB/ZUrSunLGDV4pzIYyGrDnMY2eka/ysg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB6454
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_003_726079789.1693989268"
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

--__=_Part_Boundary_003_726079789.1693989268
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpLCYjMzI7QW5nZWxvOg0KDQpPbiYjMzI7V2VkLCYjMzI7MjAyMy0wNy0yNiYjMzI7
YXQmIzMyOzEwOjIyJiMzMjsrMDIwMCwmIzMyO0FuZ2Vsb0dpb2FjY2hpbm8mIzMyO0RlbCYjMzI7
UmVnbm8mIzMyO3dyb3RlOg0KJmd0OyYjMzI7Q2hhbmdlJiMzMjtkcm1fYnJpZGdlX2FkZCgpJiMz
Mjt0byYjMzI7aXRzJiMzMjtkZXZtJiMzMjt2YXJpYW50JiMzMjt0byYjMzI7c2xpZ2h0bHkmIzMy
O3NpbXBsaWZ5JiMzMjt0aGUNCiZndDsmIzMyO3Byb2JlJiMzMjtmdW5jdGlvbi4NCg0KUmV2aWV3
ZWQtYnk6JiMzMjtDSyYjMzI7SHUmIzMyOyZsdDtjay5odUBtZWRpYXRlay5jb20mZ3Q7DQoNCiZn
dDsmIzMyOw0KJmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO0FuZ2Vsb0dpb2FjY2hpbm8mIzMy
O0RlbCYjMzI7UmVnbm8mIzMyOyZsdDsNCiZndDsmIzMyO2FuZ2Vsb2dpb2FjY2hpbm8uZGVscmVn
bm9AY29sbGFib3JhLmNvbSZndDsNCiZndDsmIzMyO1Jldmlld2VkLWJ5OiYjMzI7RmVpJiMzMjtT
aGFvJiMzMjsmbHQ7ZnNoYW9AY2hyb21pdW0ub3JnJmd0Ow0KJmd0OyYjMzI7LS0tDQomZ3Q7JiMz
MjsmIzMyO2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMmIzMyO3wmIzMyOzgmIzMy
OysrKy0tLS0tDQomZ3Q7JiMzMjsmIzMyOzEmIzMyO2ZpbGUmIzMyO2NoYW5nZWQsJiMzMjszJiMz
MjtpbnNlcnRpb25zKCspLCYjMzI7NSYjMzI7ZGVsZXRpb25zKC0pDQomZ3Q7JiMzMjsNCiZndDsm
IzMyO2RpZmYmIzMyOy0tZ2l0JiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBp
LmMNCiZndDsmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYw0KJmd0OyYj
MzI7aW5kZXgmIzMyOzI4YmRiMWY0MjdmZi4uZTRlZTBkMDI4OTNhJiMzMjsxMDA2NDQNCiZndDsm
IzMyOy0tLSYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jDQomZ3Q7JiMz
MjsrKysmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYw0KJmd0OyYjMzI7
QEAmIzMyOy0xMDg5LDExJiMzMjsrMTA4OSwxMiYjMzI7QEAmIzMyO3N0YXRpYyYjMzI7aW50JiMz
MjttdGtfZHBpX3Byb2JlKHN0cnVjdA0KJmd0OyYjMzI7cGxhdGZvcm1fZGV2aWNlJiMzMjsqcGRl
dikNCiZndDsmIzMyOyYjMzI7ZHBpLSZndDticmlkZ2Uub2Zfbm9kZSYjMzI7PSYjMzI7ZGV2LSZn
dDtvZl9ub2RlOw0KJmd0OyYjMzI7JiMzMjtkcGktJmd0O2JyaWRnZS50eXBlJiMzMjs9JiMzMjtE
Uk1fTU9ERV9DT05ORUNUT1JfRFBJOw0KJmd0OyYjMzI7JiMzMjsNCiZndDsmIzMyOy1kcm1fYnJp
ZGdlX2FkZCgmYW1wO2RwaS0mZ3Q7YnJpZGdlKTsNCiZndDsmIzMyOytyZXQmIzMyOz0mIzMyO2Rl
dm1fZHJtX2JyaWRnZV9hZGQoZGV2LCYjMzI7JmFtcDtkcGktJmd0O2JyaWRnZSk7DQomZ3Q7JiMz
MjsraWYmIzMyOyhyZXQpDQomZ3Q7JiMzMjsrcmV0dXJuJiMzMjtyZXQ7DQomZ3Q7JiMzMjsmIzMy
Ow0KJmd0OyYjMzI7JiMzMjtyZXQmIzMyOz0mIzMyO2NvbXBvbmVudF9hZGQoZGV2LCYjMzI7JmFt
cDttdGtfZHBpX2NvbXBvbmVudF9vcHMpOw0KJmd0OyYjMzI7JiMzMjtpZiYjMzI7KHJldCkmIzMy
O3sNCiZndDsmIzMyOy1kcm1fYnJpZGdlX3JlbW92ZSgmYW1wO2RwaS0mZ3Q7YnJpZGdlKTsNCiZn
dDsmIzMyOyYjMzI7ZGV2X2VycihkZXYsJiMzMjsmcXVvdDtGYWlsZWQmIzMyO3RvJiMzMjthZGQm
IzMyO2NvbXBvbmVudDomIzMyOyVkJiM5MjtuJnF1b3Q7LCYjMzI7cmV0KTsNCiZndDsmIzMyOyYj
MzI7cmV0dXJuJiMzMjtyZXQ7DQomZ3Q7JiMzMjsmIzMyO30NCiZndDsmIzMyO0BAJiMzMjstMTEw
MywxMCYjMzI7KzExMDQsNyYjMzI7QEAmIzMyO3N0YXRpYyYjMzI7aW50JiMzMjttdGtfZHBpX3By
b2JlKHN0cnVjdA0KJmd0OyYjMzI7cGxhdGZvcm1fZGV2aWNlJiMzMjsqcGRldikNCiZndDsmIzMy
OyYjMzI7DQomZ3Q7JiMzMjsmIzMyO3N0YXRpYyYjMzI7aW50JiMzMjttdGtfZHBpX3JlbW92ZShz
dHJ1Y3QmIzMyO3BsYXRmb3JtX2RldmljZSYjMzI7KnBkZXYpDQomZ3Q7JiMzMjsmIzMyO3sNCiZn
dDsmIzMyOy1zdHJ1Y3QmIzMyO210a19kcGkmIzMyOypkcGkmIzMyOz0mIzMyO3BsYXRmb3JtX2dl
dF9kcnZkYXRhKHBkZXYpOw0KJmd0OyYjMzI7LQ0KJmd0OyYjMzI7JiMzMjtjb21wb25lbnRfZGVs
KCZhbXA7cGRldi0mZ3Q7ZGV2LCYjMzI7JmFtcDttdGtfZHBpX2NvbXBvbmVudF9vcHMpOw0KJmd0
OyYjMzI7LWRybV9icmlkZ2VfcmVtb3ZlKCZhbXA7ZHBpLSZndDticmlkZ2UpOw0KJmd0OyYjMzI7
JiMzMjsNCiZndDsmIzMyOyYjMzI7cmV0dXJuJiMzMjswOw0KJmd0OyYjMzI7JiMzMjt9DQoNCjwv
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

--__=_Part_Boundary_003_726079789.1693989268
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEFuZ2VsbzoNCg0KT24gV2VkLCAyMDIzLTA3LTI2IGF0IDEwOjIyICswMjAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gQ2hhbmdlIGRybV9icmlkZ2VfYWRkKCkgdG8g
aXRzIGRldm0gdmFyaWFudCB0byBzbGlnaHRseSBzaW1wbGlmeSB0aGUNCj4gcHJvYmUgZnVuY3Rp
b24uDQoNClJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPg0KDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8DQo+IGFuZ2Vsb2dpb2Fj
Y2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4NCj4gUmV2aWV3ZWQtYnk6IEZlaSBTaGFvIDxm
c2hhb0BjaHJvbWl1bS5vcmc+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcGkuYyB8IDggKysrLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyks
IDUgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kcGkuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMNCj4g
aW5kZXggMjhiZGIxZjQyN2ZmLi5lNGVlMGQwMjg5M2EgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kcGkuYw0KPiBAQCAtMTA4OSwxMSArMTA4OSwxMiBAQCBzdGF0aWMgaW50IG10a19k
cGlfcHJvYmUoc3RydWN0DQo+IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIAlkcGktPmJyaWRn
ZS5vZl9ub2RlID0gZGV2LT5vZl9ub2RlOw0KPiAgCWRwaS0+YnJpZGdlLnR5cGUgPSBEUk1fTU9E
RV9DT05ORUNUT1JfRFBJOw0KPiAgDQo+IC0JZHJtX2JyaWRnZV9hZGQoJmRwaS0+YnJpZGdlKTsN
Cj4gKwlyZXQgPSBkZXZtX2RybV9icmlkZ2VfYWRkKGRldiwgJmRwaS0+YnJpZGdlKTsNCj4gKwlp
ZiAocmV0KQ0KPiArCQlyZXR1cm4gcmV0Ow0KPiAgDQo+ICAJcmV0ID0gY29tcG9uZW50X2FkZChk
ZXYsICZtdGtfZHBpX2NvbXBvbmVudF9vcHMpOw0KPiAgCWlmIChyZXQpIHsNCj4gLQkJZHJtX2Jy
aWRnZV9yZW1vdmUoJmRwaS0+YnJpZGdlKTsNCj4gIAkJZGV2X2VycihkZXYsICJGYWlsZWQgdG8g
YWRkIGNvbXBvbmVudDogJWRcbiIsIHJldCk7DQo+ICAJCXJldHVybiByZXQ7DQo+ICAJfQ0KPiBA
QCAtMTEwMywxMCArMTEwNCw3IEBAIHN0YXRpYyBpbnQgbXRrX2RwaV9wcm9iZShzdHJ1Y3QNCj4g
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgDQo+ICBzdGF0aWMgaW50IG10a19kcGlfcmVtb3Zl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICB7DQo+IC0Jc3RydWN0IG10a19kcGkg
KmRwaSA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOw0KPiAtDQo+ICAJY29tcG9uZW50X2Rl
bCgmcGRldi0+ZGV2LCAmbXRrX2RwaV9jb21wb25lbnRfb3BzKTsNCj4gLQlkcm1fYnJpZGdlX3Jl
bW92ZSgmZHBpLT5icmlkZ2UpOw0KPiAgDQo+ICAJcmV0dXJuIDA7DQo+ICB9DQo=

--__=_Part_Boundary_003_726079789.1693989268--

