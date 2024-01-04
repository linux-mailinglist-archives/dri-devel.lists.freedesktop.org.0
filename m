Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A20B0823EDA
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 10:43:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6C0910E3FD;
	Thu,  4 Jan 2024 09:43:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB6B110E3FD
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 09:43:28 +0000 (UTC)
X-UUID: b3570786aae511eea2298b7352fd921d-20240104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=4n74I/5Q/sdhYDYDPTpxz8cIDe4mmbWSIDe2ndQwL0s=; 
 b=fXV4lEoYfqQIZ2iL44WmrZAs5vBre2TyRFDBRtBCkCDHBETzAQtom4Swpige9F3ECOCh2djdKm5KU2CwcW71U5lw4LKsHTZYburIDQmDxY4rXvtom5pixUiZjFLprT8X/h3O0Hj/7QJGicZ+Lbk5GNKYVdPpthGN2aGd4kl1B0U=;
X-CID-CACHE: Type:Local,Time:202401041656+08,HitQuantity:2
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35, REQID:37e83bf1-f8ea-433f-ae81-69cceccb3d4c, IP:0,
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
X-UUID: b3570786aae511eea2298b7352fd921d-20240104
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 807698441; Thu, 04 Jan 2024 17:43:22 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 4 Jan 2024 17:43:20 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Thu, 4 Jan 2024 17:43:20 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H8jKEewps5tIbF/lWR/Y4lwqZM7SEv0ICPMfTUC569oWT2aOzxwlzsZ0mFsuokpkfQPRioBiN9zP0f8Wsp1OzQNesKACwgzASydD58nCfGbILVA7FjBXhIe6DsCKkHBdg+ZGKg3Jn/IMCcl2b0XAOb1pSYcTnqqh8DtVOVsz+KnobtPGTosLUGHDzHe3BWwD/PBY1ZFhBHpY2AwQmndGcCCoR0HAoafHt70rmbdz3XDZqoPd4OvLITxRcFjDfMIRHm47ZmonnhrD/Ro2XXYofl3BSJ+ogrntL0O9tcoC/gkxkGVmm6JlHx/LmaUcldPEaJLJls2WymckI0fBYnPmHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wMy7e6OWNLnznO2HGl5Hu9WK3o5B6B0TO/uXJcvhdpQ=;
 b=RPpBXU3AhE51iaGjPS012jiaRC6uvRO2YQkwZTGvgmmodDTdJ/fxiqLDPL48//M0fM9IViJvbE+LzVShReFvfQftTaiDE3nzAFiC2hP9/cWxw+oYzAJZsVN6iZYhvA5l7IuR3fROgZW0Kk7cdIvD1rTSK6d20hJDPZezWR1ScXkvHBz8NckSVL7O7K2ZK/X/M+siJmfjiKR241MwnpvJBe6G2iiR8aDW0aJxQlzo7Cqcfk6ssaxmWd4ihDe09u6wIddSasa/wieyJdppM2oJO3PGLfdwURAZHmyXI/0UKeZUz9vU9ie8vFHlTVaQUHuZRKP2oSkFuiHKDHQECWr1dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wMy7e6OWNLnznO2HGl5Hu9WK3o5B6B0TO/uXJcvhdpQ=;
 b=f/aoQETbGJLV2jbINzUWER0rGoz/FKbKLwN33r/beD2zpTCqsSObrHN/gCUWKvErOeVuqNPoJS1vUrcoHdgVceN5GM3Nr2lMTqljguXi2fqLvEESJQ5ZP4MP9ZRC68snJavM+jwTTGLcQR2D5XU5VsP5B8ytkC0JzpJIHdIr3Rg=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB8472.apcprd03.prod.outlook.com (2603:1096:101:21c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.25; Thu, 4 Jan
 2024 09:43:17 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::eb43:57cb:edfd:3762]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::eb43:57cb:edfd:3762%7]) with mapi id 15.20.7159.013; Thu, 4 Jan 2024
 09:43:17 +0000
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
Thread-Index: AQHaHrPjdunoffcOCEGmErF8vNrJIrDJp3oA
Date: Thu, 4 Jan 2024 09:43:17 +0000
Message-ID: <98a40748e34a5cef3cbb635e1a8da0bc200d016a.camel@mediatek.com>
References: <20231124085346.26602-1-mac.shen@mediatek.com>
In-Reply-To: <20231124085346.26602-1-mac.shen@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB8472:EE_
x-ms-office365-filtering-correlation-id: 3cdcb922-395f-4b7e-7abd-08dc0d09943b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xhngLO+wHSIusCEYFGqBQ0CH9DD5nIZTy+Wnofx2BFGvvxp/5TW/hUz7H0AyLue+l2sxcjk3Oxm/3McW1lCkSHIUXhiulU50AW9idR/2hFmpeAkEGeMMkDXqkmbLseF0Y8wIEtU+0gNWt4kBjf1xTlDTfE72MUa9rxvsDhwowNlLU3448GHagE44qUV7L0H98YhpaUm8/xmvM/Zjol5Ej2zJKPgkUzgyWY8BUWKaEQZ6PRYhkNogWNoVlW1TZa5OL62kGu6w4y6sg0lY3rAGAoLHpGpLVx5rz9xcMw3f44zGu5/3lOHWuEHu/oGS7k73t3okPeP0A9FQA1//VJ3+y/iYGBM/9afBNk8FAM7IBTEGXBBi7rivg7hte/GBt6i1upXedAb14etSEby358ZDm4SQqle5Jpuonl2IZhmVSKP1dwV+PsQFtUr/l3RGJoqbev+JLAtI8U3isHH25NsYLc2/oY4Qx++s+fnh4iBlmQ9LDrkN82HOCNCGSjP/7tuWK/P/gPc/HEJDNOtZLuwDjPR9QD/JrvIfxmNv+bDS1+QWyjpAlgx3VeTXDfjCwVMP+jRMzjRi35eC0lmIbrBFu4g3Di1HRM6aY0oAJ3QK54eV1pNJ5IqOT36HLUc89cRrX2/obLAxqOE5FIHnzP9QOoj87qjwnR+U59l3eLWnvjg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(396003)(39860400002)(346002)(366004)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(36756003)(85182001)(478600001)(66446008)(6506007)(76116006)(66556008)(86362001)(66476007)(6512007)(6486002)(38100700002)(64756008)(38070700009)(66946007)(4744005)(122000001)(7416002)(2616005)(26005)(107886003)(2906002)(71200400001)(5660300002)(41300700001)(4001150100001)(8936002)(110136005)(54906003)(4326008)(316002)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c20rMjByL3hsR2NlMXFPaWpsZ1Iyb2NzM1lqZVRRd3g4WkZqd2ViU2VpNjBS?=
 =?utf-8?B?Uko4NU9lVmFMVExzbUxYWDlDcU1od2NBRjg0UEM4dVhTVWYrN2dRSVp0T3NS?=
 =?utf-8?B?NTVNcjNZUzhQOVRxa2NJcVpQNTF5UTR1QXFaSUNXQnFkZXI2enZVRHJGaWtm?=
 =?utf-8?B?bzNxc1JuR0cwaWtKdFJ4a2xZdzVGRm00aTMxT0lwc0pnZlFZeTcrN2RkejRt?=
 =?utf-8?B?N2ZiU3RBYmtJc3VRRVU4Mmc3ZFRCMUkxbVg0VXo0SEEzS3NnRzJEd01SOWVH?=
 =?utf-8?B?RXFiRThvc2JVdklCMkhXVkpJNXVsREllL1daNWhqZXdBbWRKbUJwYkNBSEtK?=
 =?utf-8?B?Z0dKYkpLOHB1WmduMkVXUUFvVURZc0E2ODRCWHJQRzh4b1dDViszeEtDWGRC?=
 =?utf-8?B?M3k3UGJRekhJeFdIWklNajRaS2ZrSEZSUEY4ZisvQWZNN05UN0JjVUNTQ0kr?=
 =?utf-8?B?eGJwN2tyOW1NQ05tVSs3TVpyRXRvanlzOTBnQUwrSmltaXBpTFdwQVczOXFq?=
 =?utf-8?B?RTYzaEZLSkhCYjVXUDg1eEp6dUN1aWp3TVVTeTZmeWp6QUhHNHZZNmVCdzhF?=
 =?utf-8?B?WHY4MXVSb3EyVGsyTXAzVUZiQk9NTzdTUnZJcWxiVzlRUjhMU1VsZDNHNTIx?=
 =?utf-8?B?WEdyS01pUlpCay8vYzBoS2M1dmhtV1lRSWdmV2JlaTA0TUk1NTd5ay9SODIw?=
 =?utf-8?B?MjU0b2NMdmZQZnNBaWU4eWU1bHVDeUErbXE4d2NDcTk3YTVXbXVucTZzaUdU?=
 =?utf-8?B?c0NReHJXTjdNMXlrdlphN1VVOHl4RjQ2TkZLNkJ1U0ZNdlBWWllVZnViZzdo?=
 =?utf-8?B?UTloeVZCVTZadDVWcE1Vd1hHTUN0am9CVkZ1OWRnUi9NQThiSHBFNDI1ZUFs?=
 =?utf-8?B?R1grbmpPQW8vSldhQk14a2QvbWxNUkJEUU9OTHdyMVMvcDh2UHkyRVVOWkpZ?=
 =?utf-8?B?cU1aT2FBNmp4bTNoSHhmbzZLeXZSU2Q1bWtmYVFXSE5NK0o3bWhpbHFUakI0?=
 =?utf-8?B?NUlhQkR1UVhhUCtFQ1VKRXozUUo4bEluWEJKSXBBL2VZbXJyZVBDWG1WeDhm?=
 =?utf-8?B?eldQeWk3aU03OCszQ1ZZR3dDc0tEdk1pU0pUNFBSS2tIM0Q2YXZldStBckFM?=
 =?utf-8?B?Z1pnSC9IVjlNQ3dIeHVZS0pZWWN5d3lQQ3FJZWIxVWxRZVhzSmpqK1dGY2gz?=
 =?utf-8?B?MGxTci9XYXAyUWFlLzNJZDIzWklBYlpHR1hnRG42L3UvQ0dyZUl5cG5LSU9G?=
 =?utf-8?B?NGo2RG45emp5eml6K2R5MjJpS3BhNFZLandIZFo0Nkp5UG1kZ1BxZzdKMG1J?=
 =?utf-8?B?U09ETkd3KzBDaVRSb2cxYytuNEc2anlZakl5TmRCQ2ZScDUrRGltZDMrK095?=
 =?utf-8?B?NFgySTZSeWNpYlNpMUVObThiWmtOM3BVS2UrL0x4cTRaN1Z2K2pEUEwwY2tE?=
 =?utf-8?B?NzByczlNcy9vakljcWxMV01YZE5GaEhzU1d4ZFBwT2pLYVhqU2g4TUdCRkxM?=
 =?utf-8?B?b1NwU2ZVODNjN2txWi9RRDl4VnNkbUxMYWcvckh3aXV5SGF2RmZqTndOR1Rs?=
 =?utf-8?B?NmQ0SzJheGZaeXhBemg5L3hrTS9LTXRPalFOTldJbjVrWTdzeUQ1TjJzS0gy?=
 =?utf-8?B?dTVQdU1iVUY3aXBZcUtnR3NYd0lhV2hibmFndXA2ZWgrVVhEbklUNFp5SkJu?=
 =?utf-8?B?YXNnS0J0c3hXVXFaUnJISWZkRi9kZ1pUbDBpWDBpaEFoL05HTDVscVFnVExt?=
 =?utf-8?B?eG02NzFPUWk1U1VSeXYyb2hLVVRPbzhuU2ZtWTBsY1ljeithM1VXUitiTjBW?=
 =?utf-8?B?dXVlN2hDeFBvbUJ4YzN4MWxXeTE3ZTlqbXVGTmM2TUlNU0RqZ3h1N0VBRlBi?=
 =?utf-8?B?enJwM2RSZTVNOG1hcm1TOXIxNkU3Q2lRWWNyYVprYXRZOUtWdkhIejVIU1I3?=
 =?utf-8?B?NHRRNnpBYXpYbmFyTFRydVZnQUVrTitIekhhTjlkVGRXdHRoM3haSHRxRWFk?=
 =?utf-8?B?OWhPd2l6NVUwR25UZjBpdU9Ud2RBNVRIZ2xJNGVRL1Bsd3RGRTEwQ3JrZ1ky?=
 =?utf-8?B?NVdFVVJrTXBrWStRb1l0d1hWTGMwRkhaeWtCdmsvc2wxQ3dQNGw3bEhNN3Ja?=
 =?utf-8?Q?wvvl5z8VQ00QC7NcmSgwTPXji?=
Content-ID: <8E0D614882E7204292223CAC756D637E@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cdcb922-395f-4b7e-7abd-08dc0d09943b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2024 09:43:17.2306 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wwbRkpAPpoNTrExhsHR+A2LElptalVD7pXd42+o8Z1ZA+G2wGa2bN77H/kJsR8poxuESn3TCAiZChV/RH6z+/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8472
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--7.605700-8.000000
X-TMASE-MatchedRID: O/y65JfDwwvPaPH51LTU5Ca1MaKuob8PC/ExpXrHizxcKZwALwMGs8uj
 Rkt05a7cM2MQQW7DL3i3pOSQRQ7xBfV+NbN27IZWDB+ErBr0bAMu7Xu+fl4ygT4gEjzRKrCraUZ
 tSmZkeOfZoTly3PGW4Hv+mmMQs+2yQv21zJNl0CyDGx/OQ1GV8mdBtX6uC5l8KbcmJlT8h5bkwj
 HXXC/4I66NVEWSRWybi4eICLoHg1Mx+FtN7FnU0m99wpgRyzavD0cDC1N7oqTITvtt5INMseOqM
 HZp/6s+yWfzYCTr/17iwYfE0oH/pDtQzmN7Nt8lWv9VEbHQhHb5Sji9er6qbMiLN4KwjrADQtSa
 PIvcNlKofNwo1tlvaw==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--7.605700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: E9653825C1941A5836FEADB641D0FE504E1B9233D8F636B7C389D0814305F4252000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_007_791894987.49766634"
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

--__=_Part_Boundary_007_791894987.49766634
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
LS0tDQoNCltzbmlwXQ0KDQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrc3RydWN0JiMzMjtoZGNwMl9p
bmZvX3J4JiMzMjt7DQomZ3Q7JiMzMjsrdTgmIzMyO2NlcnRbSERDUDJfQ0VSVFJYX1NJWkVdOw0K
Jmd0OyYjMzI7K3U4JiMzMjtycnhbSERDUDJfUlJYX1NJWkVdOw0KJmd0OyYjMzI7K3U4JiMzMjty
eF9jYXBzW0hEQ1AyX1JYQ0FQU19TSVpFXTsNCiZndDsmIzMyOyt1OCYjMzI7cnhfaW5mb1tIRENQ
Ml9SWElORk9fU0laRV07DQomZ3Q7JiMzMjsrdTgmIzMyO2VraF9rbVtIRENQMl9FS0hLTV9TSVpF
XTsNCiZndDsmIzMyOyt1OCYjMzI7dl9wcmltZVtIRENQMl9WUFJJTUVfU0laRV07DQomZ3Q7JiMz
MjsrdTgmIzMyO21fcHJpbWVbSERDUDJfUkVQX01QUklNRV9TSVpFXTsNCiZndDsmIzMyOyt1OCYj
MzI7aF9wcmltZVtIRENQMl9IUFJJTUVfU0laRV07DQomZ3Q7JiMzMjsrdTgmIzMyO2xfcHJpbWVb
SERDUDJfTFBSSU1FX1NJWkVdOw0KDQpUaGlzJiMzMjtpcyYjMzI7ZGVmaW5lZCYjMzI7aW4mIzMy
O2luY2x1ZGUvZHJtL2Rpc3BsYXkvZHJtX2hkY3AuaCYjMzI7YXMmIzMyO3N0cnVjdA0KaGRjcDJf
bGNfc2VuZF9scHJpbWV7fSwmIzMyO3NvJiMzMjtJJiMzMjt0aGluayYjMzI7eW91JiMzMjtjb3Vs
ZCYjMzI7cmV1c2UmIzMyO2l0LiYjMzI7RGl0dG8mIzMyO2ZvciYjMzI7YWxsDQpvdGhlcnMmIzMy
O2luJiMzMjtoZGNwMl9pbmZvX3J4e30uDQoNClJlZ2FyZHMsDQpDSw0KDQomZ3Q7JiMzMjsrdTgm
IzMyO3JlY3ZfaWRfbGlzdFtIRENQMl9NQVhfREVWSUNFX0NPVU5UJiMzMjsqJiMzMjtIRENQMl9S
RUNWSURfU0laRV07DQomZ3Q7JiMzMjsrdTgmIzMyO3NlcV9udW1fdltIRENQMl9TRVFfTlVNX1Zf
U0laRV07DQomZ3Q7JiMzMjsrfTsNCiZndDsmIzMyOysNCg0KPC9wcmU+DQo8L3A+PC9ib2R5Pjwv
aHRtbD48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsg
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

--__=_Part_Boundary_007_791894987.49766634
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIE1hYzoNCg0KT24gRnJpLCAyMDIzLTExLTI0IGF0IDE2OjUzICswODAwLCBtYWMuc2hlbiB3
cm90ZToNCj4gQWRkIHRlZSBjbGllbnQgYXBwbGljYXRpb24sIEhEQ1AgMS54IGFuZCAyLnggYXV0
aGVudGljYXRpb24gZm9yDQo+IERpc3BsYXlQb3J0DQo+IHRvIHN1cHBvcnQgdGhlIEhEQ1AgZmVh
dHVyZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IG1hYy5zaGVuIDxtYWMuc2hlbkBtZWRpYXRlay5j
b20+DQo+IC0tLQ0KDQpbc25pcF0NCg0KPiArDQo+ICtzdHJ1Y3QgaGRjcDJfaW5mb19yeCB7DQo+
ICsJdTggY2VydFtIRENQMl9DRVJUUlhfU0laRV07DQo+ICsJdTggcnJ4W0hEQ1AyX1JSWF9TSVpF
XTsNCj4gKwl1OCByeF9jYXBzW0hEQ1AyX1JYQ0FQU19TSVpFXTsNCj4gKwl1OCByeF9pbmZvW0hE
Q1AyX1JYSU5GT19TSVpFXTsNCj4gKwl1OCBla2hfa21bSERDUDJfRUtIS01fU0laRV07DQo+ICsJ
dTggdl9wcmltZVtIRENQMl9WUFJJTUVfU0laRV07DQo+ICsJdTggbV9wcmltZVtIRENQMl9SRVBf
TVBSSU1FX1NJWkVdOw0KPiArCXU4IGhfcHJpbWVbSERDUDJfSFBSSU1FX1NJWkVdOw0KPiArCXU4
IGxfcHJpbWVbSERDUDJfTFBSSU1FX1NJWkVdOw0KDQpUaGlzIGlzIGRlZmluZWQgaW4gaW5jbHVk
ZS9kcm0vZGlzcGxheS9kcm1faGRjcC5oIGFzIHN0cnVjdA0KaGRjcDJfbGNfc2VuZF9scHJpbWV7
fSwgc28gSSB0aGluayB5b3UgY291bGQgcmV1c2UgaXQuIERpdHRvIGZvciBhbGwNCm90aGVycyBp
biBoZGNwMl9pbmZvX3J4e30uDQoNClJlZ2FyZHMsDQpDSw0KDQo+ICsJdTggcmVjdl9pZF9saXN0
W0hEQ1AyX01BWF9ERVZJQ0VfQ09VTlQgKiBIRENQMl9SRUNWSURfU0laRV07DQo+ICsJdTggc2Vx
X251bV92W0hEQ1AyX1NFUV9OVU1fVl9TSVpFXTsNCj4gK307DQo+ICsNCg==

--__=_Part_Boundary_007_791894987.49766634--

