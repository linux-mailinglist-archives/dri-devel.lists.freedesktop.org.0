Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B949823DF9
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 09:56:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6230410E0AD;
	Thu,  4 Jan 2024 08:56:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 833D410E0AD
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 08:56:23 +0000 (UTC)
X-UUID: 1d0fa072aadf11eea2298b7352fd921d-20240104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=arDku+oGC84LKL6y4DPNz6K7stb/VfKFzuAzDwu24sw=; 
 b=ekD+jEMYrh7nL8pelMYtDIRWa6+aE2ur/015TnatJixzud5MCNkwEoq3/Zoq/pvo/lTnXvpj5c8OMaYHNObhVcoNJ7KY/73Xo2FWYf6omwzyn8hqTpaKdZi9FLhiZ1GGAgYXVBUYNi8ENTc4J0B9CT5V2E00klpLCNC9Qln1xMY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35, REQID:28a7de49-50e9-4d7b-8d8b-6063ea35eabb, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5d391d7, CLOUDID:e591fb7e-4f93-4875-95e7-8c66ea833d57,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1d0fa072aadf11eea2298b7352fd921d-20240104
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 485004215; Thu, 04 Jan 2024 16:56:13 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 4 Jan 2024 16:56:12 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Thu, 4 Jan 2024 16:56:12 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BxWjpitPtGj+AHNoKH5qi9oyqSKGIUa2AIQybWooCDHLgYkevFLzhMhGqZVKcrEA5RwasfrD3Ny/g+YWx70T2CKhpWWJuZjMDhej6G4G8BlzDkawHEKfsikfY0bAROaYWNE9jhKu9lycfGPbVoxjrg5set+mqPtEQ2v0CS1Q0N24mY6RS1VpK4EeB2Zr8i0yTiPqYkhxLvkSfHxIADNFCE7I7Nb7p0D+whJ9lmvcTDip6js05/9maoHXHmG7uwGrVIx9GsQCl2qKvXV99V6yIQ30rwNDtAEZzzxImmtkj1E2P+iqlEP18bPtur+Og7XjPLJy4FXNs7Y0j1t1luB2Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AIf/dKH+DRrKHw1psab0PdiA1dS/ZclI6QzeBkyfCn8=;
 b=WivE9mlFcu9YhjgicbVBRQn4k+8wrEXjiNG05VUFz+0iiwVXI7h85QChm71+z++hA12QyPTrh33CM/bIfogd1LqoiD8pXCanPvqHRbah0t6t0QHLd+52cKZaB68hGUHsx57BqCq+hTD9xpQ1Td6vuNDI2ourDyXrRn7rTUUzCBGwIy0HZJ0/GIEc0e+RKMP4fC20hl9DWCusaW9eBcW7f6OWXijscnvoTlg8c3RJtcsVhtViCL3ecwLgzixvjYJFEzmya7i9cD0Eyet+qk3PVZoFSUznpeVQCR2PemLp1DU2tax93KJkxq8x5bDAWdbl5kbE31ion48vO6WoI+j29g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AIf/dKH+DRrKHw1psab0PdiA1dS/ZclI6QzeBkyfCn8=;
 b=CTCOWKfy7FRD5txDlCF18HMFV20EF35cjdhsT9EBZ0YmGFWHEduwaO55BUobuyVEario2o7MIrJBO9qBuECcN5wGDkQgxsHa8E/5o9yuW9jQ05i5Qs2pyC88hYZwtMtU1Db9AWv7hrqrkphMd4GoKSMjACsf+czTepXkuD5vO0I=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KL1PR03MB5973.apcprd03.prod.outlook.com (2603:1096:820:85::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.13; Thu, 4 Jan
 2024 08:56:10 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::eb43:57cb:edfd:3762]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::eb43:57cb:edfd:3762%7]) with mapi id 15.20.7159.013; Thu, 4 Jan 2024
 08:56:10 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?TWFjIFNoZW4gKOayiOS/iik=?= <Mac.Shen@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?= <jitao.shi@mediatek.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] drm/mediatek/dp: Add the HDCP feature for DisplayPort
Thread-Topic: [PATCH] drm/mediatek/dp: Add the HDCP feature for DisplayPort
Thread-Index: AQHaHrPjdunoffcOCEGmErF8vNrJIrDJmk8A
Date: Thu, 4 Jan 2024 08:56:10 +0000
Message-ID: <c224f40ef18f562678cd09d8ae586bc229bb1445.camel@mediatek.com>
References: <20231124085346.26602-1-mac.shen@mediatek.com>
In-Reply-To: <20231124085346.26602-1-mac.shen@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KL1PR03MB5973:EE_
x-ms-office365-filtering-correlation-id: 9ed8b1d3-61a6-4d3d-4c93-08dc0d02ff1a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6iUPp9UNj+7y7Ps5aoE1uz/DkWi/QalX1f7NcFkdzUzEyJqzRZJYeMtB+hXRdc/nVZP65R429NO2LHb1ZkTulBLnJqLsSM6Fd/JET8IO+JjKKTDIjWEVQX5IjckXMkOcZmNBFFtriPHQbgwbUtvHeJRTmn2h3RxZmiGRuP3X6d+5o1WXd9DNQd5xGUxDb/P8YdPdGh8vImgdEWd0MjKeKxKLQe6gQhngfSRhKxArmELRvCKaJfp89gvOhcGSBUgce6AQDGXAe0piIBgKx3qFot/akk3FxjxL97yq0MzrDtRm8taU7ZO1dQi1Y4K0YTPU6beCbuGZ0Qa9YdKXFoeTou+rsZsS/druLxOGjjMaLecBcPMgWRcIIgpQ+gEyThb1beNK46g3FS6jhrnGDwwDQgZkGNp84vWWPjPFlvzHw09WLFYNApgPf2i4z7ynyDd7/ZQu+gxTai8OpWjndrVnbPx0lxBTt63qHwTCgpfePG+JeD5bduxBwLCZ5VLDMWMUTpaedVM3F+gL36L7Fi1v++MmLuK8x/2dJWASElO/H0iInP098xC3ERNZ98KHGXxHHVouRmQpfEs61KjmhxxdWpC/6CNK34Dkg8VNTZGZP5060C5o34Gctc7TQCgVaCrbxOohvNf/MyHiwQ2wO5OsLKc+SRiHP1X9qyW5pez1Eyc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(136003)(39860400002)(396003)(346002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(4001150100001)(2906002)(38100700002)(85182001)(38070700009)(36756003)(86362001)(41300700001)(478600001)(8676002)(71200400001)(83380400001)(8936002)(110136005)(54906003)(316002)(64756008)(66446008)(76116006)(66556008)(66946007)(66476007)(2616005)(7416002)(122000001)(5660300002)(107886003)(26005)(6512007)(6486002)(4326008)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y1JQdTlLMVBSRkZoaWZlakVPTm1NSFNEUmhSWW1mODdvRGxHWlREOU1kNGll?=
 =?utf-8?B?QTlWekx2NjFHdHNvazhSUmJGbjlReHd5M0VPaTc2dnQwQlRKaGs2ZmYrK2li?=
 =?utf-8?B?citLSUY5QndGRCtnMTNhUVZ1Yit2ZVFOam9VRG4zYTh3bmFtQlAzQ1FrdVZD?=
 =?utf-8?B?Z3l4TXhNS2NMVEVYUUJHN1BNY01ScVpaNStRQlpGeHJrSGpOSktkT3p0ZUQ4?=
 =?utf-8?B?K1NXSW9iY0dGeldDWWdkZ0R2TmtqdmVlRHJoQ3JRYVNhMlY0NUNHcS95T1V0?=
 =?utf-8?B?RnU3VERRaXNVNTZJZ1U5S29IVEtMRkhmNjFZNTlBSlk3S1JCckVZc3dLYXRE?=
 =?utf-8?B?NC9iRlM4RmZhSHY0MGRjUktYOE1Hazk5dU0rSWxCa2RRM0t4YmJOaE1ubUNn?=
 =?utf-8?B?Vk92SWdocFl6R2J0RmZ2MXBwNG1QenhTRU5sN3hJaTVXVDBYeFFUNld4TlZ1?=
 =?utf-8?B?bUdZSzRaTDZhM3dod1RDeDE3SlFvTE5mTDAxenBLMFFqSEJyY1ZkM1o3Q3k4?=
 =?utf-8?B?Wm41VC8zS2FaYVd4K2c4WUk3aHN1ZjRKdUUxQWxDditoSXh1ekRPSVIvVzc0?=
 =?utf-8?B?ODlOQktYa25JZ3Y5TXBhNTZhb0FRaU5ReVhJVTY5K1RwSFlXbm5KZGJJcGNY?=
 =?utf-8?B?Y29PMEZ3WmlHc1hDMEZtc2Rxem1FNFI2bzJsY3NnOER0YndXU3IybVFvajNr?=
 =?utf-8?B?WWxlNUhadURPZ2NFLzVJUDYxUE1XMStRWUZkQUtSMkFZVnVIMXZNQVJKOUFK?=
 =?utf-8?B?MDVqZlA2OGpJQjNoWTdmU1JkTFgyWFRUQkJaelJWdnFUaDVZV0RKdTJuMlFi?=
 =?utf-8?B?N254YzA3ZjJKVWt2VnJhRjFvTGxxWVVwYUFOL1FrdHc0Rk5CcmNkOFo1MzFy?=
 =?utf-8?B?TFBvRVlLc0JlNVdOblk4NHYwL0RQUm9yNmN5amtsQ1N4SDRoOStNZGpmRmpZ?=
 =?utf-8?B?TGlBZm5tUXJ3Y0FpSXIzYXlNN3kwT091aGtmRTMwVzhIT09Fb0JQS211SVU2?=
 =?utf-8?B?dlpWUW5sMy9pRUplbENhRVdnc25vS1I1Q0p1Qkt4cS9JbStUSHlwN3FwUWpp?=
 =?utf-8?B?QkUvRUFBSm9QUmIxYjV4d08vVG9DZmJZR2dZbXRvZXZmSWRTK0xRUE5scGRF?=
 =?utf-8?B?cG5POUI0QjIyK291L0xxNkdJZFh5Zy93TDJxcmZ5TzRTK0xYb3l2bUVSeWxv?=
 =?utf-8?B?RHliNnlaTTloNFN1L3dsb1h0VCs4L296YndxaXlST1hLSElLc1dZWGxYb29E?=
 =?utf-8?B?cFR1SjU4T21JNVYvTWQ4dFc1Q0lRUUpyVG9RUU9BMHE0ZDk3MlZmbFRWUXB3?=
 =?utf-8?B?OXE1NDBCN3VxeThuTldZTkZoWjJyVncvM0V4ZlZrZUhIeEoxOGRlTkNVcFAv?=
 =?utf-8?B?ZFhSd2NiWGRucTNKajBoQ0I2c0FJaUpobDdma0VqL1FGMVk0QnJnblo5MFBk?=
 =?utf-8?B?SXBENkh1cGR1am9la0dTOVErZHBFcFhqNnlPVmpkUkZ4ejV0SVpUeldjNzV6?=
 =?utf-8?B?cWZxeTFjZGM0c2VTTUVhZktWaUxhaHA0ZFk5N1llaDBHU3RUYzhDY0VVWTdM?=
 =?utf-8?B?VTV2STVnZEttWk14eUtXRUk2ZDVaT21ITTBNMUJMdEF1OXZwOFhNanc0QkZm?=
 =?utf-8?B?QVhvSG03TVZjZmVIMUMwdncxSGxnMUxXcEtpd3V2WHRROXJZY0pFN3piZ2l5?=
 =?utf-8?B?L1h3SkNnVDlhcVRSRnNHQVVzZVNMRFJ4QS94dWVOUjBIRFhhUEdSbXpCT3dp?=
 =?utf-8?B?WVdvY21KV250WTFPeVdTT25EMFdYOHRvME1ZZTVPVC9xRkd6bWZ5STJ3RDM3?=
 =?utf-8?B?Y01JWDhOelV4RUVBbXdUY0wwa050b0FwY0pmMlQ2NnVMdUJJcDhPemVCdEFU?=
 =?utf-8?B?NHVDREJZczRKWlk1WFJhLyt0T2kwN3N2YkpvczJnT3ZoU3o4SUtjeXRhc3Fl?=
 =?utf-8?B?Y2p0M1BVaVB2MEtqSHZGcExBODg5VDZKKzNNVFNzaVhzRzVqY0pqTHdZY3Y4?=
 =?utf-8?B?dnMyNmgzMGdpWHdzb3NqNEZpWkVwTDcrWlR6S3hTTW9vTEpaWk4zWVJ5QWps?=
 =?utf-8?B?Yk5Zd0k0bTdLcVZhV1hvcHV3OWVIRGI5WU5ySjJ5OVZGZFYvRkc4bDFzUlM5?=
 =?utf-8?Q?hsfSh841w4XmVSiGahVhO+cCp?=
Content-ID: <51A44679FD4C5B47811279A28A76DE79@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ed8b1d3-61a6-4d3d-4c93-08dc0d02ff1a
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2024 08:56:10.0171 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O9SterzpslhI57SeCC0P3jXhsuLnz2b1UD+uk4apl7CjPz33xpdZDz2s27L9tuDda2JdXbvS/fvKOPtbxtJCzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB5973
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_007_1220736685.785479508"
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
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?utf-8?B?U2h1aWppbmcgTGkgKOadjuawtOmdmSk=?= <Shuijing.Li@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_007_1220736685.785479508
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtNYWM6DQoNCk9uJiMzMjtGcmksJiMzMjsy
MDIzLTExLTI0JiMzMjthdCYjMzI7MTY6NTMmIzMyOyswODAwLCYjMzI7bWFjLnNoZW4mIzMyO3dy
b3RlOg0KJmd0OyYjMzI7QWRkJiMzMjt0ZWUmIzMyO2NsaWVudCYjMzI7YXBwbGljYXRpb24sJiMz
MjtIRENQJiMzMjsxLngmIzMyO2FuZCYjMzI7Mi54JiMzMjthdXRoZW50aWNhdGlvbiYjMzI7Zm9y
DQomZ3Q7JiMzMjtEaXNwbGF5UG9ydA0KJmd0OyYjMzI7dG8mIzMyO3N1cHBvcnQmIzMyO3RoZSYj
MzI7SERDUCYjMzI7ZmVhdHVyZS4NCiZndDsmIzMyOw0KJmd0OyYjMzI7U2lnbmVkLW9mZi1ieTom
IzMyO21hYy5zaGVuJiMzMjsmbHQ7bWFjLnNoZW5AbWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYjMzI7
LS0tDQoNCltzbmlwXQ0KDQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrZW51bSYjMzI7RU5VTV9IRENQ
Ml9NU0dfTElTVCYjMzI7ew0KJmd0OyYjMzI7K0hEQ1AyX01TR19aRVJPJiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjs9JiMzMjswLA0KJmd0OyYjMzI7K0hEQ1AyX01TR19BS0VfSU5JVCYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOz0m
IzMyOzEsDQomZ3Q7JiMzMjsrSERDUDJfTVNHX0FLRV9TRU5EX0NFUlQmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOz0mIzMyOzIsDQomZ3Q7JiMzMjsrSERDUDJfTVNHX0FLRV9O
T19TVE9SRURfS00mIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOz0mIzMyOzMsDQomZ3Q7JiMzMjsrSERD
UDJfTVNHX0FLRV9TVE9SRURfS00mIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
Oz0mIzMyOzQsDQomZ3Q7JiMzMjsrSERDUDJfTVNHX0FLRV9TRU5EX0hfUFJJTUUmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOz0mIzMyOzUsDQomZ3Q7JiMzMjsrSERDUDJfTVNHX0FLRV9TRU5EX1BBSVJJ
TkdfSU5GTyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjs9JiMzMjs2LA0KJmd0OyYjMzI7K0hEQ1AyX01TR19MQ19JTklUJiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjs9JiMz
Mjs3LA0KDQpUaGlzJiMzMjtsb29rcyYjMzI7bGlrZSYjMzI7SERDUF8yXzJfTENfSU5JVCYjMzI7
aW4mIzMyO2luY2x1ZGUvZHJtL2RybV9oZGNwLmguJiMzMjtJZiYjMzI7dGhlc2UNCmFyZSYjMzI7
ZGVmaW5lZCYjMzI7aW4mIzMyO0hEQ1AmIzMyO3NwZWNpZmljYXRpb24sJiMzMjttb3ZlJiMzMjt0
aGVzZSYjMzI7ZGVmaW5pdGlvbiYjMzI7dG8NCmluY2x1ZGUvZHJtL2RybV9oZGNwLmgNCg0KUmVn
YXJkcywNCkNLDQoNCiZndDsmIzMyOytIRENQMl9NU0dfTENfU0VORF9MX1BSSU1FJiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOz0mIzMyOzgsDQomZ3Q7JiMzMjsrSERDUDJfTVNHX1NLRV9TRU5E
X0VLUyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjs9JiMzMjs5LA0K
Jmd0OyYjMzI7K0hEQ1AyX01TR19SRVBBVVRIX1NFTkRfUkVDVklEX0xJU1QmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7PSYjMzI7MTAsDQomZ3Q7JiMzMjsrSERDUDJfTVNH
X1JFUEFVVEhfVkVSSUZZX1JFQ1ZJRF9MSVNUJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
PSYjMzI7MTEsDQomZ3Q7JiMzMjsrSERDUDJfTVNHX1JFUEFVVEhfU0VORF9BQ0smIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOz0mIzMyOzEyLA0KJmd0OyYjMzI7K0hEQ1AyX01TR19SRVBBVVRIX1NUUkVB
TV9NQU5BR0UmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7PSYjMzI7MTMsDQomZ3Q7JiMzMjsrSERDUDJfTVNHX1JFUEFVVEhfU1RSRUFNX1JFQURZ
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7PSYjMzI7MTQsDQomZ3Q7JiMzMjsrSERDUDJfTVNHX0FVVEhfRkFJTCYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOz0mIzMyOzE1LA0KJmd0OyYjMzI7K0hEQ1AyX01TR19BVVRIX0RP
TkUmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjs9JiMzMjsxNiwNCiZndDsmIzMyOyt9
Ow0KDQoNCg0KPC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlwZTp0ZXh0LS0+PCEtLXst
LT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZSAqKioq
KioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFp
bCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRp
YWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRp
c2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNv
bnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNz
ZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5n
IG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5k
ZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3
ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWws
IG9yIGJlbGlldmUgDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9y
LCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8g
dGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwg
KGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QN
CmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24u
IFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_007_1220736685.785479508
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIE1hYzoNCg0KT24gRnJpLCAyMDIzLTExLTI0IGF0IDE2OjUzICswODAwLCBtYWMuc2hlbiB3
cm90ZToNCj4gQWRkIHRlZSBjbGllbnQgYXBwbGljYXRpb24sIEhEQ1AgMS54IGFuZCAyLnggYXV0
aGVudGljYXRpb24gZm9yDQo+IERpc3BsYXlQb3J0DQo+IHRvIHN1cHBvcnQgdGhlIEhEQ1AgZmVh
dHVyZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IG1hYy5zaGVuIDxtYWMuc2hlbkBtZWRpYXRlay5j
b20+DQo+IC0tLQ0KDQpbc25pcF0NCg0KPiArDQo+ICtlbnVtIEVOVU1fSERDUDJfTVNHX0xJU1Qg
ew0KPiArCUhEQ1AyX01TR19aRVJPICAgICAgICAgICAgICAgICAgICAgICAgICAgID0gMCwNCj4g
KwlIRENQMl9NU0dfQUtFX0lOSVQgICAgICAgICAgICAgICAgICAgICAgICA9IDEsDQo+ICsJSERD
UDJfTVNHX0FLRV9TRU5EX0NFUlQgICAgICAgICAgICAgICAgICAgPSAyLA0KPiArCUhEQ1AyX01T
R19BS0VfTk9fU1RPUkVEX0tNICAgICAgICAgICAgICAgID0gMywNCj4gKwlIRENQMl9NU0dfQUtF
X1NUT1JFRF9LTSAgICAgICAgICAgICAgICAgICA9IDQsDQo+ICsJSERDUDJfTVNHX0FLRV9TRU5E
X0hfUFJJTUUgICAgICAgICAgICAgICAgPSA1LA0KPiArCUhEQ1AyX01TR19BS0VfU0VORF9QQUlS
SU5HX0lORk8gICAgICAgICAgID0gNiwNCj4gKwlIRENQMl9NU0dfTENfSU5JVCAgICAgICAgICAg
ICAgICAgICAgICAgICA9IDcsDQoNClRoaXMgbG9va3MgbGlrZSBIRENQXzJfMl9MQ19JTklUIGlu
IGluY2x1ZGUvZHJtL2RybV9oZGNwLmguIElmIHRoZXNlDQphcmUgZGVmaW5lZCBpbiBIRENQIHNw
ZWNpZmljYXRpb24sIG1vdmUgdGhlc2UgZGVmaW5pdGlvbiB0bw0KaW5jbHVkZS9kcm0vZHJtX2hk
Y3AuaA0KDQpSZWdhcmRzLA0KQ0sNCg0KPiArCUhEQ1AyX01TR19MQ19TRU5EX0xfUFJJTUUgICAg
ICAgICAgICAgICAgID0gOCwNCj4gKwlIRENQMl9NU0dfU0tFX1NFTkRfRUtTICAgICAgICAgICAg
ICAgICAgICA9IDksDQo+ICsJSERDUDJfTVNHX1JFUEFVVEhfU0VORF9SRUNWSURfTElTVCAgICAg
ICAgPSAxMCwNCj4gKwlIRENQMl9NU0dfUkVQQVVUSF9WRVJJRllfUkVDVklEX0xJU1QgICAgICA9
IDExLA0KPiArCUhEQ1AyX01TR19SRVBBVVRIX1NFTkRfQUNLICAgICAgICAgICAgICAgID0gMTIs
DQo+ICsJSERDUDJfTVNHX1JFUEFVVEhfU1RSRUFNX01BTkFHRSAgICAgICAgICAgPSAxMywNCj4g
KwlIRENQMl9NU0dfUkVQQVVUSF9TVFJFQU1fUkVBRFkgICAgICAgICAgICA9IDE0LA0KPiArCUhE
Q1AyX01TR19BVVRIX0ZBSUwJICAgICAgICAgICAgICAgICAgPSAxNSwNCj4gKwlIRENQMl9NU0df
QVVUSF9ET05FCSAgICAgICAgICAgICAgICAgID0gMTYsDQo+ICt9Ow0KDQoNCg==

--__=_Part_Boundary_007_1220736685.785479508--

