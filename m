Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E9D63F351
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 16:06:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01A4C10E0F1;
	Thu,  1 Dec 2022 15:06:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E3EA10E0F1
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 15:06:23 +0000 (UTC)
X-UUID: 8c71f7104b174439b7ecb799bc77122c-20221201
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=H1zw+pNWsbufok/tiADq3S/tQw9nopftRRAnQ3SSGIc=; 
 b=UgipTsF9/nxJzCRUALYkILmNTSGbUbJFED/ibznP2ZDQn+dorD/Py0cIn4uPVbVPRP/E3CZdSZfzQvCyGWF8rqQYoQLjqzd+GyV9kegF4zG0MSIGhnJ0zybBqU0YrsOqBKZQTn6aBLKvLr3juvtfCF3PxcLi6tEWEDo6goKtmXo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14, REQID:0905283a-c126-47d0-ab85-721f9e28eb6c, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-INFO: VERSION:1.1.14, REQID:0905283a-c126-47d0-ab85-721f9e28eb6c, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:-5
X-CID-META: VersionHash:dcaaed0, CLOUDID:9839496c-41fe-47b6-8eb4-ec192dedaf7d,
 B
 ulkID:2212012306081BH7HKS4,BulkQuantity:0,Recheck:0,SF:17|19|102,TC:nil,Co
 ntent:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 8c71f7104b174439b7ecb799bc77122c-20221201
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 300069479; Thu, 01 Dec 2022 23:06:07 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 1 Dec 2022 23:06:06 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n1.mediatek.com (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.792.15 via Frontend Transport; Thu, 1 Dec 2022 23:06:06 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nbAue+Wyv56gau8wtLapUZ2pRN7k4qNwJqe60OhFmU+TzZ0ZemlAahWL7tWbuDZesk9pga/W6rzhLe4KVb/6PfjWSlZMuCcysWq2v7Y3gbKFBxjFLE3dAy69TKWkxqsq4Ey/6Lg4fAzFUJuMniVPbKHpb7+Ng26Qr7Kh4VsLKLHuQ/XRDTpY9XQ6xpbLdsVkOhq61/oO9fuXFBd0QVEIkmHW/N93dWTyxdniIDY5sI98WbGRvAqE4hm+FDV9kUIfsVB8JRMc12I4nvEeaoUQbvNswzj6jGoEPA09LYf87bDmLMrXadV1jZ8bODMh372SSlJmCCWSS0gTDO7WJxiL3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iSr8vUQt9odo2676/SKdw2IGKJMww5VWWIit8HjUads=;
 b=kd1UgrwKOYR5OMHXJG3VHeFgnjryQUwOfSMxHMjA10tdpMgX2LRgWTVR+IZK6afzkFhX8JHp6hQxGNhiTz4tyVH095/QiNhjF0zGkAkf54+5gj4JDbCY+ndUZ6lQQZj+lWKzDyICajGrU/6KCHKlrnBb1EAd6Wpc5qW3qTBIrvHwJ7KfiOz3R4QMaVQDtv4pvojZy4Im1JZfawVjDtqrQXbm/O1iFGfvNnI34y/GUd9giodxFcTURCRhtniJAyE01Z8MFwooZRGRXJyeWU43kIVKesHaOJzSBdAXtkbdD+lCo4LEa/0dXhbtPwfyT/NVqHloNjdsqDSfMnZAJWlabw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iSr8vUQt9odo2676/SKdw2IGKJMww5VWWIit8HjUads=;
 b=Xrs3dED5h3HxoCfY4OpnZTjQTzU5ouM6Wwui1/JLLGAXbIXRSh9ywPurlSqwjREjXRF1JmLvu5J/rfRcXOw4KDd/lKaRt1OzWGHb12haBte5Vw/gbW87eFktcuzFzu2YxpfhVMLoUJfUTmBMBOX/dwmlyXM/oWV23Ey/sDslPIA=
Received: from PS1PR03MB3384.apcprd03.prod.outlook.com (2603:1096:803:49::13)
 by TY0PR03MB6473.apcprd03.prod.outlook.com (2603:1096:400:1bf::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Thu, 1 Dec
 2022 15:06:04 +0000
Received: from PS1PR03MB3384.apcprd03.prod.outlook.com
 ([fe80::2e82:cce2:3b26:ab6f]) by PS1PR03MB3384.apcprd03.prod.outlook.com
 ([fe80::2e82:cce2:3b26:ab6f%7]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 15:06:04 +0000
From: =?utf-8?B?SmlheGluIFl1ICjkv57lrrbpkasp?= <Jiaxin.Yu@mediatek.com>
To: "broonie@kernel.org" <broonie@kernel.org>
Subject: Re: [PATCH v2 1/3] ASoC: hdmi-codec: Add event handler for hdmi TX
Thread-Topic: [PATCH v2 1/3] ASoC: hdmi-codec: Add event handler for hdmi TX
Thread-Index: AQHZALKPLtjy9JnSM0qA0l4xMT7+Dq5PjsoAgATmBQCAAbf+AIAC/qmA
Date: Thu, 1 Dec 2022 15:06:04 +0000
Message-ID: <cf9ea98a3263ffb8fc8b542888ad0ad680facfc7.camel@mediatek.com>
References: <20221125094413.4940-1-jiaxin.yu@mediatek.com>
 <20221125094413.4940-2-jiaxin.yu@mediatek.com>
 <Y4Cysgk5Gic5ae9B@sirena.org.uk>
 <18c82f6f723cd97a9d6b9a7ff16c6ed62fd005d6.camel@mediatek.com>
 <Y4Y/vEWe3dw0FPQH@sirena.org.uk>
In-Reply-To: <Y4Y/vEWe3dw0FPQH@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PS1PR03MB3384:EE_|TY0PR03MB6473:EE_
x-ms-office365-filtering-correlation-id: f5859384-579a-4eac-045b-08dad3ad9119
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gxoGTxIKhJuSTkEUuBXlG6CFuj3s/Rsed5dI2m/RIBlmq+7COVBPJtJ8zlFVU2aVBFa0zfQqtP9xXIspPl4U2EWOVey2nOHroq1fr3XI5ZNESv6Bqsz7SjdbIzA1obRe11B0hciDWAW9aSrJBQkHQf68lHBJbT8wPvORr2iW3+6X/BSbThjjrJOj7nLFF6Zxw7g86C0cpQf9QBHrYcrxsH/F08fsnr7vwqvGPtmyAHM81MZwuk8vsjvPKqFNGpm0CvZwKdCGcykoLr8YM0jG9eAyO2nEbBzS7/mpsRkj0VgvQEawwfx4Hyu5dFjkbVC3LuJ8vehlVskzmX0Ycp4E5KMSFHIPZFZYeatkoUDUQkcKpY55mCacTL9cRzqqnq+wLVaVtC0scD9GvoqpxmLi40vonkyre0WOT/pJroD27y9D7/pz2esGQyr42Rl4Qt/1XNgEXor1i5E5oL6RiE9mCoxxVOg+fVCnTb6qml0pr5376A4a3wAQIylahEPTEZrvAngKCRRb/LLKxaUWEyd3JmaW5sY5c1uBL1Sk+HRR/UcYXIfhf+D2v4M1Ih5BWCnxJotAQffvoFRbtGYgB/yjwtEm8QlMz2GwzTnR9PqOaUlDTYI72lpzazVZXZ5XXKQc+uwRd67mu/mTNeMAyQlMAG1orCm+AVO1Yj1W0lzWA1sWl6a/om4yS6sYtQqzdvUIvvNqV1nRT3jN6fIhzuLaykPOwphaQEF6e9odtsNOihUhaCXrzupwSQtWcP/s+nFp
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PS1PR03MB3384.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(346002)(376002)(39860400002)(136003)(451199015)(316002)(66946007)(64756008)(36756003)(85182001)(186003)(6486002)(6916009)(4326008)(2616005)(66556008)(2906002)(122000001)(66446008)(8936002)(4001150100001)(86362001)(91956017)(38100700002)(41300700001)(66476007)(8676002)(54906003)(7416002)(5660300002)(6506007)(6512007)(71200400001)(76116006)(38070700005)(26005)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RTg2bTBxNGc1OENTN25sVkdXZEVXUFBnR3U5M0l2RktjWWhGMjl5RGlGUWRI?=
 =?utf-8?B?bWJLQWxVWkNkeUhsa0pXWVNOM1ZYUXUxNElRdjF5VFpQb2k0OWo4Y3dDRnpx?=
 =?utf-8?B?QzlPOWVYeFVhcWp6RXdWcklSbnI5TzZtZXhZVmNSWmtqeEVMd1FEeHhNamVW?=
 =?utf-8?B?WmlsWmNtTHVycjViZ2gwTThTK0F4UExsSTBIbXU0VmdIU1FFNEx2S2hSeHFQ?=
 =?utf-8?B?QXBOaS95RzVVaS9uTm55Qi9hM21pK2RpNVlRSWtheG01cFE5NHMzS0ZFNU55?=
 =?utf-8?B?clM0Y3R4THp6UlJJZnBqa0owcWt1cUUwR1RqUXkva29LbHRYcUdpbkhpSWM3?=
 =?utf-8?B?Z1pTdUdvOW9pVEhRbm5VZzFublJSc0ZuMHZEblBpL0x3MXdIQVRhT2s0RE14?=
 =?utf-8?B?Z1ZJa3F4dnZpL3piQ29OSlVsQk1pL00wMkJ5bjRDK2I3MlRFOVVHY3Rlamtm?=
 =?utf-8?B?TFRPdXBUaTBCQ2lCN2tRdWw0a2c3QkNUeTluL3RUenRxRVVSZGxDSnlIcS8v?=
 =?utf-8?B?KzdmN1FobXBoM1l4c0QrRmk4Y1J0MEVVeEhMMHpyYTdnaWVpQmlMTWRVb2Nj?=
 =?utf-8?B?ak1Walk1dzFKSThteXZOaWxJd2pScHhqQWlhREJ0NUdPL3F4Y0g2eDY4MFhn?=
 =?utf-8?B?WE82c0wwQURYelNtK2gxeW15cGR3L1N1ejlTd1pBRFUxM1lUNE1CNHFvK1Rq?=
 =?utf-8?B?ZHExQ0tTODR6TEpFWE80VUs5WVZjV0w0dUt1cmp2MDVuQmJPMVJuVDcxOWQy?=
 =?utf-8?B?RWxFZm1VRmlRY1hWYzVraWhJb2t3enlHeUx6ckxaemZpSjlxWXRFd3V4bjFO?=
 =?utf-8?B?a3BoQ1JPZG5IdXpYVithN1FTMUVnZXpocHFmcm9NZ01KSExaTzhWbURwcFg2?=
 =?utf-8?B?WmlYZUhxWllTVXZNRDZaTk4wek5TYlh3MWprSDRMZ1Vnb2VRTUNzblljK2F3?=
 =?utf-8?B?RnA5TjVTOHkvR2s4dkhPMjNyeEk2RURFcEZkdzV5RkgrKzZvVFdCWWRURnR5?=
 =?utf-8?B?YzdoRGlGR2h2ZlQ0cWFWM2dzRENVRHhtditUM0paVjNVMDhoempjdE5GaHdU?=
 =?utf-8?B?eVJOWExSSlNpb3ZSOUNEZU4yOTlxQThRR3IxeTJnS2hXNWhyd216cFFZRG94?=
 =?utf-8?B?Ui9ibW55TkFlSDhIb1hBcXFhQUlHNk5pVXhML2VHRlFJL2VkczdaSjZ3VDIr?=
 =?utf-8?B?Nk42L1pyWmdMSVJHb01QZkpVaHlxK0VhMm1DbUltRllXVWJjRWhlQ2FXNzhB?=
 =?utf-8?B?N28xL0lOaHZONCs5ci8yY1ZVdDg0RC9VWUQ3WlNJTkpwNXdZNnNWdi9kY0h4?=
 =?utf-8?B?RzNZMFdEMlFBMG1sOGxPL0U3a29wZjRkdG5UQWJ2di9tWWwxT3ltL2pLcXV0?=
 =?utf-8?B?Q0MzanJzdlpWNFlDc3NVVjZFR2UySVduTnVlVWJsRGt5OFVwSVViWWhwOWND?=
 =?utf-8?B?UGZpS1ZTZkpBRlZSZjhpTUM2WUJkV3ZPQzlDYlNQUUk3SUFNL1krR2M5aWI4?=
 =?utf-8?B?L3RSUXgwUytSZGFRazVWeS9FN0VXRE5TK2dVK3V1M3VDUThMdEk2U054WjAw?=
 =?utf-8?B?M2w1dXdwNDVWanN1UG55L2dVTDR6Kys1UElJTW1LRDMvSFhpWXQ0SUt2ZjBU?=
 =?utf-8?B?RUJXc2g1ZTZqWHlHbVh0UmpSNDlmNVdTSzZhZ0ZPS3psbXlRdFNrTDk3V2lp?=
 =?utf-8?B?S1NPU1RXL08zdm10YWdQK3FZR3ZMQUpWaWNiMGxTYytlTERRSHRlRlVrbWV2?=
 =?utf-8?B?Nnc2elF3UlV0cnVLa2xiMzhCeWVXVnZmVTBCMHdmcDlzcW9NcU14R0RKSGlX?=
 =?utf-8?B?ZTA3ZjJpRUlFU01lYys2Z09pNXMwSE9reDFSRUwwZkxYQTlZYjg1TGJiQ3Jx?=
 =?utf-8?B?WS93TmtSay9kSFgybjF5SkdxdERnOE05MzRYd3Jwb1Ixd09vaWJSUjJnWDJj?=
 =?utf-8?B?MnVoWUZma1RHdE1JSFlnbzRvR29qK2FGN2ZwUkpyMzFFUCtKTE1GN1Q1YjE0?=
 =?utf-8?B?OG1jeE81QmQ5MEFJWkVZWktIR21JU2hMMVc1ZUFLSHNhR2FNY243OTJ1MWd1?=
 =?utf-8?B?K2JxMVFGTFhYZ2laTndvbloxUXJpODAyUk9PalRyTm02MkJOeFNJVExJWUFR?=
 =?utf-8?B?dkpCbXY0MjhxS211OGRhN2RhT29xU1JRYVRUQ1JxTUQ1UFVTVVNyS2JZTVUw?=
 =?utf-8?B?cGc9PQ==?=
Content-ID: <23CBC476A39C8F4EB180859135AA44EC@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PS1PR03MB3384.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5859384-579a-4eac-045b-08dad3ad9119
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2022 15:06:04.3016 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SYv382bDx72uuFwmLTuECKB34wuqjrRjoLRhwDhDUsw1dUmRcPg7th1cFl4DBRrF7ZD4JE96StD7E3aIoQicMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6473
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_006_1019321776.94632443"
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 =?utf-8?B?Q2h1bnh1IExpICjmnY7mmKXml60p?= <Chunxu.Li@mediatek.com>,
 =?utf-8?B?QWxsZW4tS0ggQ2hlbmcgKOeoi+WGoOWLsyk=?= <Allen-KH.Cheng@mediatek.com>,
 "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "robert.foss@linaro.org" <robert.foss@linaro.org>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "ajye_huang@compal.corp-partner.google.com"
 <ajye_huang@compal.corp-partner.google.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_006_1019321776.94632443
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCk9uJiMzMjtUdWUsJiMzMjsyMDIyLTExLTI5JiMzMjthdCYjMzI7MTc6MjImIzMyOysw
MDAwLCYjMzI7TWFyayYjMzI7QnJvd24mIzMyO3dyb3RlOg0KJmd0OyYjMzI7T24mIzMyO01vbiwm
IzMyO05vdiYjMzI7MjgsJiMzMjsyMDIyJiMzMjthdCYjMzI7MDM6MDc6MjJQTSYjMzI7KzAwMDAs
JiMzMjtKaWF4aW4mIzMyO1l1JiMzMjsoJiMyMDQ0NjsmIzIzNDc4OyYjMzc5OTU7KSYjMzI7d3Jv
dGU6DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtPbiYjMzI7RnJpLCYjMzI7MjAyMi0xMS0yNSYjMzI7YXQm
IzMyOzEyOjE4JiMzMjsrMDAwMCwmIzMyO01hcmsmIzMyO0Jyb3duJiMzMjt3cm90ZToNCiZndDsm
IzMyOyZndDsmIzMyOyZndDsmIzMyO09uJiMzMjtGcmksJiMzMjtOb3YmIzMyOzI1LCYjMzI7MjAy
MiYjMzI7YXQmIzMyOzA1OjQ0OjExUE0mIzMyOyswODAwLCYjMzI7SmlheGluJiMzMjtZdSYjMzI7
d3JvdGU6DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtJJiMzOTttJiMzMjthJiMzMjtsaXR0
bGUmIzMyO3VuY2xlYXImIzMyO3doeSYjMzI7dGhpcyYjMzI7aXMmIzMyO2JlaW5nJiMzMjtpbXBs
ZW1lbnRlZCYjMzI7YXMmIzMyO2EmIzMyO0RBUE0NCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMy
O29wZXJhdGlvbg0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7cmF0aGVyJiMzMjt0aGFuJiMz
MjtoYXZpbmcmIzMyO3RoZSYjMzI7ZHJpdmVyJiMzMjtmb3J3YXJkJiMzMjt0aGUmIzMyO1BDTSYj
MzI7dHJpZ2dlciYjMzI7b3AmIzMyO2lmJiMzMjtpdCYjMzk7cw0KJmd0OyYjMzI7Jmd0OyYjMzI7
Jmd0OyYjMzI7bmVlZGVkJiM2MzsNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyO09yJiMzMjth
bHRlcm5hdGl2ZWx5JiMzMjtpZiYjMzI7YSYjMzI7REFQTSYjMzI7Y2FsbGJhY2smIzMyO2lzJiMz
MjtuZWVkZWQmIzMyO3doeSYjMzI7bm90JiMzMjtwcm92aWRlJiMzMjtvbmUNCiZndDsmIzMyOyZn
dDsmIzMyOyZndDsmIzMyO2RpcmVjdGx5JiMzMjtyYXRoZXImIzMyO3RoYW4mIzMyO2hvb2tpbmcm
IzMyO2ludG8mIzMyO3RoZSYjMzI7dHJpZ2dlciYjMzI7ZnVuY3Rpb24mIzMyOy0mIzMyO3RoYXQm
IzM5O3MNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyO2dvaW5nDQomZ3Q7JiMzMjsmZ3Q7JiMz
MjsmZ3Q7JiMzMjt0bw0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7YmUmIzMyO2NhbGxlZCYj
MzI7b3V0JiMzMjtvZiYjMzI7c2VxdWVuY2UmIzMyO3dpdGgmIzMyO3RoZSYjMzI7cmVzdCYjMzI7
b2YmIzMyO0RBUE0mIzMyO2FuZCYjMzI7YmUNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyO3Bv
dGVudGlhbGx5DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtjb25mdXNpbmcmIzMyO2dpdmVu
JiMzMjt0aGUmIzMyO3ZlcnkmIzMyO2RpZmZlcmVudCYjMzI7ZW52aXJvbm1lbnRzJiMzMjt0aGF0
JiMzMjt0cmlnZ2VyJiMzMjthbmQNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyO0RBUE0NCiZn
dDsmIzMyOyZndDsmIzMyOyZndDsmIzMyO29wZXJhdGlvbnMmIzMyO3J1biYjMzI7aW4uJiMzMjsm
IzMyO0EmIzMyO3F1aWNrJiMzMjtnbGFuY2UmIzMyO2F0JiMzMjt0aGUmIzMyO2l0NjUwNSYjMzI7
ZHJpdmVyJiMzMjtzdWdnZXN0cw0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7aXQmIzM5O2QN
CiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyO2JlDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMz
MjtoYXBwaWVyJiMzMjt3aXRoJiMzMjthJiMzMjtEQVBNJiMzMjtjYWxsYmFjay4NCiZndDsmIzMy
OyZndDsmIzMyO0xldCYjMzI7bWUmIzMyO2Rlc2NyaWJlJiMzMjt0aGUmIzMyO2hhcmR3YXJlJiMz
Mjtjb25uZWN0aW9uJiMzMjthYm91dCYjMzI7bXQ4MTg2JiMzMjt3aXRoDQomZ3Q7JiMzMjsmZ3Q7
JiMzMjtpdDY1MDUoaGRtaSkNCiZndDsmIzMyOyZndDsmIzMyO2FuZCYjMzI7cnQxMDE1cChzcGVh
a2VycykuDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7PT0mZ3Q7aXQ2NTA1JiMzMjsNCiZndDsmIzMyOyZn
dDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOz0m
IzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7REwxKEZFKSYjMzI7PT0mZ3Q7STJTMyhCRSkmIzMyOz0N
CiZndDsmIzMyOyZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOz0NCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjs9PSZndDtydDEwMTVwDQomZ3Q7JiMzMjsm
Z3Q7JiMzMjtUaGV5JiMzMjtzaGFyZWQmIzMyO3RoZSYjMzI7c2FtZSYjMzI7b25lJiMzMjtpMnMm
IzMyO3BvcnQsJiMzMjtidXQmIzMyO3dlJiMzOTtkJiMzMjtsaWtlJiMzMjt0byYjMzI7Y29udHJv
bCYjMzI7dGhlbQ0KJmd0OyYjMzI7Jmd0OyYjMzI7c2VwYXJhdGVseS4mIzMyO1NvJiMzMjtpZiYj
MzI7aGRtaS1jb2RlYyYjMzI7dXNlJiMzMjt0aGUmIzMyO1BDTSYjMzI7dHJpZ2dlciYjMzI7b3As
JiMzMjt3aG5lJiMzMjt3ZSYjMzI7dHVybg0KJmd0OyYjMzI7Jmd0OyYjMzI7b24NCiZndDsmIzMy
OyZndDsmIzMyO3RoZSYjMzI7c3BlYWtlciwmIzMyO2hkbWktY29kZWMmIzM5O3MmIzMyO1BDTSYj
MzI7dHJpZ2dlciYjMzI7b3AmIzMyO2lzJiMzMjthbHNvJiMzMjtleGVjdXRlZCwNCiZndDsmIzMy
OyZndDsmIzMyO3Jlc3VsdGluZyYjMzI7aW4NCiZndDsmIzMyOyZndDsmIzMyO3NvdW5kJiMzMjtv
biYjMzI7Ym90aCYjMzI7ZGV2aWNlcy4NCiZndDsmIzMyOyZndDsmIzMyO0lzJiMzMjt0aGVyZSYj
MzI7YW5vdGhlciYjMzI7d2F5JiMzMjt0byYjMzI7Y29udHJvbCYjMzI7dGhlbSYjMzI7c2VwYXJh
dGVseSYjNjM7JiMzMjtUaGFuayYjMzI7eW91Lg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtJZiYjMzI7
eW91JiMzMjtqdXN0JiMzMjtuZWVkJiMzMjtwb3dlciYjMzI7Y29udHJvbCYjMzI7Zm9yJiMzMjtv
bmUmIzMyO29yJiMzMjtib3RoJiMzMjtkZXZpY2VzJiMzMjt0aGVuJiMzMjt0aGUNCiZndDsmIzMy
O21hY2hpbmUNCiZndDsmIzMyO2RyaXZlciYjMzI7Y2FuJiMzMjthZGQmIzMyO2EmIzMyO19QSU5f
U1dJVENIKCkmIzMyO29uJiMzMjt0aGUmIzMyO291dHB1dCYjMzI7b2YmIzMyO3RoZSYjMzI7ZGV2
aWNlLCYjMzI7dGhhdCYjMzk7bGwNCiZndDsmIzMyO2NhdXNlJiMzMjtEQVBNJiMzMjt0byYjMzI7
a2VlcCYjMzI7dGhlJiMzMjtkZXZpY2UmIzMyO3Bvd2VyZWQmIzMyO2Rvd24mIzMyO3doZW4mIzMy
O25vdCYjMzI7aW4mIzMyO3VzZS4mIzMyOyYjMzI7VGhhdA0KJmd0OyYjMzI7c2hvdWxkDQomZ3Q7
JiMzMjt3b3JrJiMzMjt3ZWxsJiMzMjt3aXRoJiMzMjt0aGUmIzMyO3N1Z2dlc3Rpb24mIzMyO3Rv
JiMzMjtwcm92aWRlJiMzMjthJiMzMjtEQVBNJiMzMjtjYWxsYmFjayYjMzI7aW5zdGVhZCYjMzI7
b2YmIzMyO2ENCiZndDsmIzMyO2ENCiZndDsmIzMyO3RyaWdnZXImIzMyO29wZXJhdGlvbi4NCg0K
WWVzLCYjMzI7d2UmIzMyO2RvJiMzMjt1c2UmIzMyO2EmIzMyO19QSU5fU1dJVENIKCkmIzMyO29u
JiMzMjt0aGUmIzMyO291dG91dCYjMzI7b2YmIzMyO3RoZSYjMzI7ZGV2aWNlOg0KDQomZ3Q7JiMz
MjsmIzMyO3N0YXRpYyYjMzI7Y29uc3QmIzMyO3N0cnVjdCYjMzI7c25kX2tjb250cm9sX25ldw0K
Jmd0OyYjMzI7JiMzMjttdDgxODZfbXQ2MzY2X3J0MTAxOV9ydDU2ODJzX2NvbnRyb2xzW10mIzMy
Oz0mIzMyO3sNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyO1NPQ19EQVBNX1BJTl9TV0lUQ0goJnF1b3Q7U3BlYWtlcnMmcXVvdDspLA0KJmd0OyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7U09DX0RBUE1f
UElOX1NXSVRDSCgmcXVvdDtIZWFkcGhvbmUmcXVvdDspLA0KJmd0OyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7U09DX0RBUE1fUElOX1NXSVRDSCgmcXVv
dDtIZWFkc2V0JiMzMjtNaWMmcXVvdDspLA0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7U09DX0RBUE1fUElOX1NXSVRDSCgmcXVvdDtIRE1JMSZx
dW90OyksDQomZ3Q7JiMzMjsmIzMyO307DQoNCldoaWNoJiMzMjtvcGVyYXRpb24mIzMyO3Nob3Vs
ZCYjMzI7SSYjMzI7dXNlJiMzMjt0byYjMzI7aW5mb3JtJiMzMjticmlkZ2UmIzMyO2RyaXZlciYj
MzI7dG8mIzMyO2NvbnRyb2wmIzMyO2F1ZGlvDQpvbiYjMzI7b3ImIzMyO29mZiYjNjM7JiMzMjtJ
JiMzOTttJiMzMjtjdXJpb3VzJiMzMjt3aHkmIzMyO0kmIzMyO2RvbiYjMzk7dCYjMzI7c2VlJiMz
MjsudHJpZ2dlciYjMzI7aW4mIzMyO3RoZSYjMzI7c3RydWN0dXJlDQpoZG1pX2NvZGVjX29wcyYj
MzI7Y29tcGFyZWQmIzMyO3RvJiMzMjt0aGUmIzMyO3N0cnVjdHVyZSYjMzI7c25kX3NvY19kYWlf
b3BzJiM2MzsNCg0KDQoNCg0KDQoNCjwvcHJlPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxwcmU+
KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlDQogKioqKioqKioq
KioqKioqKioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVz
c2FnZSAoaW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBw
cm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9z
dXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXll
ZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5h
dGlvbiwgDQpkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0
aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJl
Y2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4g
SWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBi
ZWxpZXZlDQogDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBw
bGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhp
cyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwgKGlu
Y2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRp
c2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRo
YW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_006_1019321776.94632443
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDIyLTExLTI5IGF0IDE3OjIyICswMDAwLCBNYXJrIEJyb3duIHdyb3RlOg0KPiBP
biBNb24sIE5vdiAyOCwgMjAyMiBhdCAwMzowNzoyMlBNICswMDAwLCBKaWF4aW4gWXUgKOS/nuWu
tumRqykgd3JvdGU6DQo+ID4gT24gRnJpLCAyMDIyLTExLTI1IGF0IDEyOjE4ICswMDAwLCBNYXJr
IEJyb3duIHdyb3RlOg0KPiA+ID4gT24gRnJpLCBOb3YgMjUsIDIwMjIgYXQgMDU6NDQ6MTFQTSAr
MDgwMCwgSmlheGluIFl1IHdyb3RlOg0KPiA+ID4gSSdtIGEgbGl0dGxlIHVuY2xlYXIgd2h5IHRo
aXMgaXMgYmVpbmcgaW1wbGVtZW50ZWQgYXMgYSBEQVBNDQo+ID4gPiBvcGVyYXRpb24NCj4gPiA+
IHJhdGhlciB0aGFuIGhhdmluZyB0aGUgZHJpdmVyIGZvcndhcmQgdGhlIFBDTSB0cmlnZ2VyIG9w
IGlmIGl0J3MNCj4gPiA+IG5lZWRlZD8NCj4gPiA+IE9yIGFsdGVybmF0aXZlbHkgaWYgYSBEQVBN
IGNhbGxiYWNrIGlzIG5lZWRlZCB3aHkgbm90IHByb3ZpZGUgb25lDQo+ID4gPiBkaXJlY3RseSBy
YXRoZXIgdGhhbiBob29raW5nIGludG8gdGhlIHRyaWdnZXIgZnVuY3Rpb24gLSB0aGF0J3MNCj4g
PiA+IGdvaW5nDQo+ID4gPiB0bw0KPiA+ID4gYmUgY2FsbGVkIG91dCBvZiBzZXF1ZW5jZSB3aXRo
IHRoZSByZXN0IG9mIERBUE0gYW5kIGJlDQo+ID4gPiBwb3RlbnRpYWxseQ0KPiA+ID4gY29uZnVz
aW5nIGdpdmVuIHRoZSB2ZXJ5IGRpZmZlcmVudCBlbnZpcm9ubWVudHMgdGhhdCB0cmlnZ2VyIGFu
ZA0KPiA+ID4gREFQTQ0KPiA+ID4gb3BlcmF0aW9ucyBydW4gaW4uICBBIHF1aWNrIGdsYW5jZSBh
dCB0aGUgaXQ2NTA1IGRyaXZlciBzdWdnZXN0cw0KPiA+ID4gaXQnZA0KPiA+ID4gYmUNCj4gPiA+
IGhhcHBpZXIgd2l0aCBhIERBUE0gY2FsbGJhY2suDQo+ID4gTGV0IG1lIGRlc2NyaWJlIHRoZSBo
YXJkd2FyZSBjb25uZWN0aW9uIGFib3V0IG10ODE4NiB3aXRoDQo+ID4gaXQ2NTA1KGhkbWkpDQo+
ID4gYW5kIHJ0MTAxNXAoc3BlYWtlcnMpLg0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgPT0+
aXQ2NTA1IA0KPiA+ICAgICAgICAgICAgICAgICAgICAgID0gDQo+ID4gREwxKEZFKSA9PT5JMlMz
KEJFKSA9DQo+ID4gICAgICAgICAgICAgICAgICAgICAgPQ0KPiA+ICAgICAgICAgICAgICAgICAg
ICAgICAgPT0+cnQxMDE1cA0KPiA+IFRoZXkgc2hhcmVkIHRoZSBzYW1lIG9uZSBpMnMgcG9ydCwg
YnV0IHdlJ2QgbGlrZSB0byBjb250cm9sIHRoZW0NCj4gPiBzZXBhcmF0ZWx5LiBTbyBpZiBoZG1p
LWNvZGVjIHVzZSB0aGUgUENNIHRyaWdnZXIgb3AsIHdobmUgd2UgdHVybg0KPiA+IG9uDQo+ID4g
dGhlIHNwZWFrZXIsIGhkbWktY29kZWMncyBQQ00gdHJpZ2dlciBvcCBpcyBhbHNvIGV4ZWN1dGVk
LA0KPiA+IHJlc3VsdGluZyBpbg0KPiA+IHNvdW5kIG9uIGJvdGggZGV2aWNlcy4NCj4gPiBJcyB0
aGVyZSBhbm90aGVyIHdheSB0byBjb250cm9sIHRoZW0gc2VwYXJhdGVseT8gVGhhbmsgeW91Lg0K
PiANCj4gSWYgeW91IGp1c3QgbmVlZCBwb3dlciBjb250cm9sIGZvciBvbmUgb3IgYm90aCBkZXZp
Y2VzIHRoZW4gdGhlDQo+IG1hY2hpbmUNCj4gZHJpdmVyIGNhbiBhZGQgYSBfUElOX1NXSVRDSCgp
IG9uIHRoZSBvdXRwdXQgb2YgdGhlIGRldmljZSwgdGhhdCdsbA0KPiBjYXVzZSBEQVBNIHRvIGtl
ZXAgdGhlIGRldmljZSBwb3dlcmVkIGRvd24gd2hlbiBub3QgaW4gdXNlLiAgVGhhdA0KPiBzaG91
bGQNCj4gd29yayB3ZWxsIHdpdGggdGhlIHN1Z2dlc3Rpb24gdG8gcHJvdmlkZSBhIERBUE0gY2Fs
bGJhY2sgaW5zdGVhZCBvZiBhDQo+IGENCj4gdHJpZ2dlciBvcGVyYXRpb24uDQoNClllcywgd2Ug
ZG8gdXNlIGEgX1BJTl9TV0lUQ0goKSBvbiB0aGUgb3V0b3V0IG9mIHRoZSBkZXZpY2U6DQoNCj4g
IHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc25kX2tjb250cm9sX25ldw0KPiAgbXQ4MTg2X210NjM2Nl9y
dDEwMTlfcnQ1Njgyc19jb250cm9sc1tdID0gew0KPiAgICAgICAgICBTT0NfREFQTV9QSU5fU1dJ
VENIKCJTcGVha2VycyIpLA0KPiAgICAgICAgICBTT0NfREFQTV9QSU5fU1dJVENIKCJIZWFkcGhv
bmUiKSwNCj4gICAgICAgICAgU09DX0RBUE1fUElOX1NXSVRDSCgiSGVhZHNldCBNaWMiKSwNCj4g
ICAgICAgICAgU09DX0RBUE1fUElOX1NXSVRDSCgiSERNSTEiKSwNCj4gIH07DQoNCldoaWNoIG9w
ZXJhdGlvbiBzaG91bGQgSSB1c2UgdG8gaW5mb3JtIGJyaWRnZSBkcml2ZXIgdG8gY29udHJvbCBh
dWRpbw0Kb24gb3Igb2ZmPyBJJ20gY3VyaW91cyB3aHkgSSBkb24ndCBzZWUgLnRyaWdnZXIgaW4g
dGhlIHN0cnVjdHVyZQ0KaGRtaV9jb2RlY19vcHMgY29tcGFyZWQgdG8gdGhlIHN0cnVjdHVyZSBz
bmRfc29jX2RhaV9vcHM/DQoNCg0KDQoNCg0K

--__=_Part_Boundary_006_1019321776.94632443--

