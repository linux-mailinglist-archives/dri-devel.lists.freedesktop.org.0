Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8067BB3D8
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 11:07:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B04310E030;
	Fri,  6 Oct 2023 09:07:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B45010E030
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 09:07:51 +0000 (UTC)
X-UUID: cf65028e642711ee8051498923ad61e6-20231006
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=jG6N17bw5/tqa2OPYYWIPu+xt1bm7knfscXvtjXbIvY=; 
 b=Nr2MS/lCs1D5zjYQX7NuCdpCvG3AzIU981p5ZNbz2UEaXlxYggfJDfuDv6MKIv4FSV3jiR93uMhjkmMpbtCws8emwunWzN2YUo6SdB6ZIObx2t5FN1xp6KbioEEtRGa6UM54mF9TSW4ah7wxrbjD+BH+UDYBC4JqbObS0nLxhsg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:53e0ebaf-83f0-4eb0-acab-9b8071e0332c, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5f78ec9, CLOUDID:6f7bd8c3-1e57-4345-9d31-31ad9818b39f,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: cf65028e642711ee8051498923ad61e6-20231006
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1526361357; Fri, 06 Oct 2023 17:07:44 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 6 Oct 2023 17:07:40 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Fri, 6 Oct 2023 17:07:40 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FPnu7mGame09V/nmvj9zs0616Ffel13jKyr2GdlymJz/eCLh9chcLXb78TYcrA/MTfPZ3lLsj+tf4Geb4ongaTL1I2Md1pNqdIFFRIwEePYuc2rXmedmjE/ArBENttxgX2ssPFAeGjU6D+gmIAs0Dp9reAucIrBLvCerj+OtMq588WtwdRb/j4FhBjgrIuFpHd69ZvGlGVfgmTRMKMPfWwQzQf6piStkVRvivcaiiUS0L2KoK29mgCG145oN5p7Umwu3Vtjh31SOF4qfoU9OR4zLiPCm9elItgDfifhICSwqvHDgSw2yPaTNVt2JHgRUeDPiv6FDm8VMu4xurGL3JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VM/RcbIqqd2u5sFmiXFELpi+EUJx1lgp3Cc/1//R4kk=;
 b=AG45vSzVZIr8M6ynxJ1OhdLl1AaNNbGw4ZIadRtuvgNLVR+rIzR3HTFNbRv7gLxwC34gsVOEkHL6hTdv5UCcbmpe/ycDpwTlCEkVANKDq/RWG7c7Neu8S7so0ZgBUQ18vG3uwMNUZb4xh1jHeyl/qL8zEqJIyWZbkAYqO4WS90tKWnuwUsR8mav2KlTyI1JQJ2tWsGCPBZrTRwhr0dwZZThE6UcuI9F+tBCQstz3MGGquIAu/hdBcD7rKEBulKs1WfWJd911HH8qGcQWzQJOAKnp87ZyNb6Vdu5smILtPCwUAhkzAS6HJHncNya8fbm+WwsuRp56Y6YAYdmL0emVhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VM/RcbIqqd2u5sFmiXFELpi+EUJx1lgp3Cc/1//R4kk=;
 b=Cr/XJKSzfDWw3yqK61R/MiYcR+QzIux/KPJPfbWTf/vMlkKz7GOr2T/lLmdsLSwLsiibhkqV7kFDJ/y8xQ+uKtzmM6zNDCX6OOdHy2QTpOI76lgDwP4zxx52Ra6ah48EOrkZ8FLLqlMdVHXpu2Tev21lOPqLC4LYWo4zHXmqsSQ=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB7327.apcprd03.prod.outlook.com (2603:1096:101:124::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.25; Fri, 6 Oct
 2023 09:07:36 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9c2c:c08a:212f:e984]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9c2c:c08a:212f:e984%7]) with mapi id 15.20.6792.026; Fri, 6 Oct 2023
 09:07:36 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH v7 19/23] drm/mediatek: Return error if MDP RDMA failed to
 enable the clock
Thread-Topic: [PATCH v7 19/23] drm/mediatek: Return error if MDP RDMA failed
 to enable the clock
Thread-Index: AQHZ+Cgtsm34tK0KwUCvJk0Tgwo1XrA8eMeA
Date: Fri, 6 Oct 2023 09:07:36 +0000
Message-ID: <bb5cf458f77d2bed98958543a1955527f3b8cae3.camel@mediatek.com>
References: <20231006073831.10402-1-shawn.sung@mediatek.com>
 <20231006073831.10402-20-shawn.sung@mediatek.com>
In-Reply-To: <20231006073831.10402-20-shawn.sung@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB7327:EE_
x-ms-office365-filtering-correlation-id: 5381bf28-089b-4594-dc78-08dbc64baed2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HpKmqcBfINUUfFKJOvG+tts0Qdh1VA+icYntZGAo8mVf3GMA+tJiBvK0wUt5ls4LmekxNgpK6++E6Z4paQ0Q39tqdT4PPpWPW8o46PD0Htw7ntzUZE4FW+lVlfAOVO/ynRFQ4DIFBBSu2Ri42j2XrOOw+kxh2xCUjWlmVAMGo+LN6FKtkioZvPrzrlsLncmFOaek/cr712Hgu9xEsLY4ZDFcwiuD8rFXxeK84ARfWGFxxz6ebCQR22MRfgJGcaNRY2k0rEFdu6KhRECiKDANzjscjBbbatMIiBW/DtN0x+d1+0dwWZT3Wqijxr3qbG09yOps+ZeL+Ka7iPhCs/jbywbb+dUV0lFP23lHhlmUEcd/YEzPloY2v0WzLpT3YdcWaCgIjFP24Lp7RINHds+8G8zvxs1e1MWO8v8Y+/q9TI328khP6aFYdFVMYVZxqCWzj6wTl495VOhBKNxBetOIA0s3qs88Xup+0KRf1k+n1/PoMyBfTIc5Z5nha2UpUSOApexj9j0sYtjBRuk3qcz6qzRo0h6bHtnZi+Vkss9UKio0xz/ESa+6OOLjuGW90aEOY/kYdV+Npvy5a7tLrjbFSh1ChAHwGfOCrkWUpuaTed/+6kOgXaJI/4TlWl3+eKA3SO//NcgLw2wtrXFfnDNsB7WB5UOGU0xkIvdyyKv2+08=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(136003)(366004)(346002)(396003)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(6486002)(6506007)(6512007)(478600001)(26005)(71200400001)(2616005)(4744005)(83380400001)(66476007)(2906002)(110136005)(5660300002)(64756008)(316002)(8936002)(54906003)(8676002)(66446008)(4326008)(41300700001)(66946007)(36756003)(85182001)(76116006)(66556008)(7416002)(86362001)(122000001)(38100700002)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UHpDbFpHNlRNM1FuOXJTaGtpem41b0ZWRWYxNlZlUUpJeTZTOG5JVVE4SWp5?=
 =?utf-8?B?Yng5M055QkFUb0pGMThaU0ZkSFFTV3d5YXlUQm9lQit1cmNObCtCSXUwUU95?=
 =?utf-8?B?Qlc2ZU5pS2puZ0ZwTlFYSGlmQ0s0MFBtNEZHVk95VDdMUEdZSStSZEpiNUIy?=
 =?utf-8?B?TUx1LzBtNGpYZmxYcHFKMXJCU3UvMEpZOEVyQzJwOGRDMU80WnM3NUlKZVVX?=
 =?utf-8?B?SlZuTkFpQ2pLc2xnTkVTRUZTRUp0WXpkZWdPR0NXZFNoVDBNUUQ2d2xrY3A5?=
 =?utf-8?B?RHI5VXM0RGJGSllqOG9taC9JcUtMYWY2czVJTkdXVDJJbS9RaTBuUzlGODdt?=
 =?utf-8?B?ZWplU3VuektpSDBDaW9tTlRBMGRlUTBpcTJMZDFodDdDWk8zeTd0NmxQU0Z3?=
 =?utf-8?B?NE93ckJ3WlpPMG56K1J5U0NHbEVzclV3eXpzdVNCVFU2eDd3VXRWUVZyM2V5?=
 =?utf-8?B?Um9YMVdxWTlnNkRXNUxjQlViZFhwVWIxdnVUa0xnZlY3Vm9MTkl6NmhIVHJx?=
 =?utf-8?B?ajNhZWJJWVZuV1JmYmdoZDJ6MVlyeTR4SXNHVVBFL1Z2a21SVmxUbXBVVm1W?=
 =?utf-8?B?QUI5M2tVMHE2SEU3cXQ4VXFJWmNOWWNFcVByemlra05tS2w1SXFsaHlzSEk3?=
 =?utf-8?B?NEY5bi9FSFJTV2NMOE02WlByUi8rbURxZDVPUjhCWGwydmFVUDRNTzVoam41?=
 =?utf-8?B?dlN0T25iYmZlcmVXdkE3VlE2RGJaMVI1bm4rUVpyNEZKUW1iWDg0NUx4TXBi?=
 =?utf-8?B?bUViaXRiM1h6U3kzMmt1eWRsN2ZCVXppL3Y5ckZoOHMweVAwSXdxLzV1WXpn?=
 =?utf-8?B?NTJITjRjVXBxMVpHM1psTWRvbVJXa1U1RXBTSG5pamEvdVIxTCtpNUhoUm9Q?=
 =?utf-8?B?Rjl3NStvR2NUTjJGNjN6WE9EN0RxbGg2Zm05NE1MQVZ2Y1BoY0xVYjc4cjh2?=
 =?utf-8?B?ZFJtNyswOERxbExaVVo2a2NmbmM2aVZvejFUMC9JK3ptUlZIYXJrQlFRMTB2?=
 =?utf-8?B?ZDRub3c2RVdZWHR6VHFkU1I2akZ3Y0tGQVJnTXJHQXJoZm9MTWpxejFQTlhP?=
 =?utf-8?B?c3JSeHZNWVZTVm9BYTQrQTVqRzk2VTdvMzUwWSs3bHRaT2xJNjhKcm9BeUQ3?=
 =?utf-8?B?aG4vUlZkRUlSam1PREJUdm5TRG5zNURFRm1ic1pYNlJaS3p6N1hCM2NXdXox?=
 =?utf-8?B?MDZUY0dkKzl0MXYyby9UakloYWl5RHdMV1p5enpURThDUnhKSWh6c1pYckJD?=
 =?utf-8?B?NWFudDc4eU5vUGxqd1E4cDdIZURkcCtnWGxHcVR3WDNtTCtncFhTd05wMWN3?=
 =?utf-8?B?K1RadUYrNkREVlVpcDBESWJBNnRiaWJ2YXdSZUg3ZDkrOVQwcHZpUDh3ZkJH?=
 =?utf-8?B?WUNsN0tQWFJYYW5JejRhelQ0UlhyNzRiQ3Azd2NIWGVmSVJ3M2dXR2Q0Q1F2?=
 =?utf-8?B?MWp1S3gxY0kzMmdYdDFPbGJnT2VJNC9YbGh5VXVob1VhT1hHZU53SVdueGYw?=
 =?utf-8?B?bi9IbFZoQkJlKzJCT28rRUUyZnJDcit4VUtobXI2VlpGQmlTZ1lhdEEyTlNL?=
 =?utf-8?B?Yi9ndkEyMlA1M3Rpb1VVQnl3UkVDaVhoQlVjZThxSXBmaExyYmRYSVVndmwr?=
 =?utf-8?B?MGFGQTJFS2xuQlcwWUlHVC9pZUNrc2dHVDg0MlladWhJOGNEelN1Sjc0U25X?=
 =?utf-8?B?NTU5aVEzVmVqdzBlbmo0RVJrb3p6S0k5TjBMV1pCNWliZHI2eHlQRHI1czZP?=
 =?utf-8?B?d3RISE1ac1NLODdNS2NDOHRER0duVnpKZ09US1NXbXdqTFdzU2EyWVZFUHBK?=
 =?utf-8?B?YkRuT1IyWkJ0TkV1K1NYZ0oyTGVCOFdvSHBWTFhCMDJYekh5dHhFNUJqaUdW?=
 =?utf-8?B?VnUrNzBJbUp0b2UyS2tiR2Y3aVQ2UVVXVlRMMW9SRkVIVi9VTUpVVmxGR0Qv?=
 =?utf-8?B?U252N1d3Rzh0d2pJMCtaQWZ2TDMwbTV1TE1DdGpzVWRuTW1MMlRaeG15V3Fv?=
 =?utf-8?B?SlZKRzBzZ2NRR3M1RzF2Q1dXU3hLUlIwekxmK3E0L2RUd2hNWllRM1RsblBt?=
 =?utf-8?B?T3dNalZ6RXRIcVNvbjF6emlrWmFacHp2eksrMURrNzh5a3lDcGtyMlFra1FD?=
 =?utf-8?Q?NrqhreWIFG/uH8OLS7wsdRXe5?=
Content-ID: <8EBC76452C4285419E33EFA9E0745FB0@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5381bf28-089b-4594-dc78-08dbc64baed2
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2023 09:07:36.0665 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jO16a+B5r4PdKRYpaW82v6kbo2x+7FlovfozmWIjFWngkGsft3TLs4cSzK+BU58gFl0VbJr9h0HcKWuOv1hc/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7327
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--8.520400-8.000000
X-TMASE-MatchedRID: lORh06tOiKg/XHdICuW5rya1MaKuob8PC/ExpXrHizwOkJQR4QWbsEcv
 yz0XXA/NCnSM7kxo1BASqo3ZUfrHh25/NyTKlG69Dko+EYiDQxF9LQinZ4QefKU8D0b0qFy9suf
 7RWbvUtyrusVRy4an8VgXepbcl7r7Rwv0yl5IHrY8qRGhGMA0b41GcgvNIYqGlJk7OLKupWoOVi
 pOlWvxSFsAwFScpxPl9clfCgRjEgA+hLrkMDDUW31dpg5ttBgy/A2ADMXzXXrE3GUQUNzkZce0w
 E/+NfLZ+HRQzE03arZUYyGHon+Jun7cGd19dSFd
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--8.520400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 3FE426E48D2D846A0860B3ED87D05DEE017165FE462E6F1ED94BBB3825F1669A2000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_007_1372082312.70539490"
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
Cc: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_007_1372082312.70539490
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpLCYjMzI7SHNpYW8tY2hpZW46DQoNCk9uJiMzMjtGcmksJiMzMjsyMDIzLTEwLTA2
JiMzMjthdCYjMzI7MTU6MzgmIzMyOyswODAwLCYjMzI7SHNpYW8mIzMyO0NoaWVuJiMzMjtTdW5n
JiMzMjt3cm90ZToNCiZndDsmIzMyO1JldHVybiYjMzI7dGhlJiMzMjtyZXN1bHQmIzMyO29mJiMz
MjtjbGtfcHJlcGFyZV9lbmFibGUoKSYjMzI7aW5zdGVhZCYjMzI7b2YNCiZndDsmIzMyO2Fsd2F5
cyYjMzI7cmV0dXJucyYjMzI7MC4NCg0KUmV2aWV3ZWQtYnk6JiMzMjtDSyYjMzI7SHUmIzMyOyZs
dDtjay5odUBtZWRpYXRlay5jb20mZ3Q7DQoNCiZndDsmIzMyOw0KJmd0OyYjMzI7Rml4ZXM6JiMz
MjtmODk0NmUyYjZiYjImIzMyOygmcXVvdDtkcm0vbWVkaWF0ZWs6JiMzMjtBZGQmIzMyO2Rpc3Bs
YXkmIzMyO01EUCYjMzI7UkRNQSYjMzI7c3VwcG9ydCYjMzI7Zm9yDQomZ3Q7JiMzMjtNVDgxOTUm
cXVvdDspDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtIc2lhbyYjMzI7
Q2hpZW4mIzMyO1N1bmcmIzMyOyZsdDtzaGF3bi5zdW5nQG1lZGlhdGVrLmNvbSZndDsNCiZndDsm
IzMyOy0tLQ0KJmd0OyYjMzI7JiMzMjtkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX21kcF9y
ZG1hLmMmIzMyO3wmIzMyOzMmIzMyOystLQ0KJmd0OyYjMzI7JiMzMjsxJiMzMjtmaWxlJiMzMjtj
aGFuZ2VkLCYjMzI7MSYjMzI7aW5zZXJ0aW9uKCspLCYjMzI7MiYjMzI7ZGVsZXRpb25zKC0pDQom
Z3Q7JiMzMjsNCiZndDsmIzMyO2RpZmYmIzMyOy0tZ2l0JiMzMjthL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfbWRwX3JkbWEuYw0KJmd0OyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX21kcF9yZG1hLmMNCiZndDsmIzMyO2luZGV4JiMzMjtjM2FkYWVlZmQ1NTEuLmM3MjMz
ZDBhYzIxMCYjMzI7MTAwNjQ0DQomZ3Q7JiMzMjstLS0mIzMyO2EvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19tZHBfcmRtYS5jDQomZ3Q7JiMzMjsrKysmIzMyO2IvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19tZHBfcmRtYS5jDQomZ3Q7JiMzMjtAQCYjMzI7LTI0Niw4JiMzMjsrMjQ2
LDcmIzMyO0BAJiMzMjtpbnQmIzMyO210a19tZHBfcmRtYV9jbGtfZW5hYmxlKHN0cnVjdCYjMzI7
ZGV2aWNlJiMzMjsqZGV2KQ0KJmd0OyYjMzI7JiMzMjt7DQomZ3Q7JiMzMjsmIzMyO3N0cnVjdCYj
MzI7bXRrX21kcF9yZG1hJiMzMjsqcmRtYSYjMzI7PSYjMzI7ZGV2X2dldF9kcnZkYXRhKGRldik7
DQomZ3Q7JiMzMjsmIzMyOw0KJmd0OyYjMzI7LWNsa19wcmVwYXJlX2VuYWJsZShyZG1hLSZndDtj
bGspOw0KJmd0OyYjMzI7LXJldHVybiYjMzI7MDsNCiZndDsmIzMyOytyZXR1cm4mIzMyO2Nsa19w
cmVwYXJlX2VuYWJsZShyZG1hLSZndDtjbGspOw0KJmd0OyYjMzI7JiMzMjt9DQomZ3Q7JiMzMjsm
IzMyOw0KJmd0OyYjMzI7JiMzMjt2b2lkJiMzMjttdGtfbWRwX3JkbWFfY2xrX2Rpc2FibGUoc3Ry
dWN0JiMzMjtkZXZpY2UmIzMyOypkZXYpDQoNCjwvcHJlPjwhLS10eXBlOnRleHQtLT48IS0tey0t
PjxwcmU+KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlICoqKioq
KioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWls
IG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlh
bCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlz
Y2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29u
dmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3Nl
bWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcg
b2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRl
ZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdm
dWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwg
b3IgYmVsaWV2ZSANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3Is
IHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0
aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAo
aW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0K
ZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4g
VGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_007_1372082312.70539490
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEhzaWFvLWNoaWVuOg0KDQpPbiBGcmksIDIwMjMtMTAtMDYgYXQgMTU6MzggKzA4MDAsIEhz
aWFvIENoaWVuIFN1bmcgd3JvdGU6DQo+IFJldHVybiB0aGUgcmVzdWx0IG9mIGNsa19wcmVwYXJl
X2VuYWJsZSgpIGluc3RlYWQgb2YNCj4gYWx3YXlzIHJldHVybnMgMC4NCg0KUmV2aWV3ZWQtYnk6
IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+DQoNCj4gDQo+IEZpeGVzOiBmODk0NmUyYjZiYjIg
KCJkcm0vbWVkaWF0ZWs6IEFkZCBkaXNwbGF5IE1EUCBSRE1BIHN1cHBvcnQgZm9yDQo+IE1UODE5
NSIpDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBIc2lhbyBDaGllbiBTdW5nIDxzaGF3bi5zdW5nQG1l
ZGlhdGVrLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX21kcF9y
ZG1hLmMgfCAzICstLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0
aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
bWRwX3JkbWEuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfbWRwX3JkbWEuYw0K
PiBpbmRleCBjM2FkYWVlZmQ1NTEuLmM3MjMzZDBhYzIxMCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19tZHBfcmRtYS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfbWRwX3JkbWEuYw0KPiBAQCAtMjQ2LDggKzI0Niw3IEBAIGludCBtdGtf
bWRwX3JkbWFfY2xrX2VuYWJsZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ICB7DQo+ICAJc3RydWN0
IG10a19tZHBfcmRtYSAqcmRtYSA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOw0KPiAgDQo+IC0JY2xr
X3ByZXBhcmVfZW5hYmxlKHJkbWEtPmNsayk7DQo+IC0JcmV0dXJuIDA7DQo+ICsJcmV0dXJuIGNs
a19wcmVwYXJlX2VuYWJsZShyZG1hLT5jbGspOw0KPiAgfQ0KPiAgDQo+ICB2b2lkIG10a19tZHBf
cmRtYV9jbGtfZGlzYWJsZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQo=

--__=_Part_Boundary_007_1372082312.70539490--

