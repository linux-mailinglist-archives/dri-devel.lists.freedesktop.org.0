Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C387585F22A
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 08:51:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C478610E8A3;
	Thu, 22 Feb 2024 07:51:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="oPKQAr1D";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="h9uqXaid";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DCEA10E8A2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 07:51:44 +0000 (UTC)
X-UUID: 35f2204ed15711eea4ad694c3f9da370-20240222
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=zeIb1zkcMMlu4HL0BDeKS0zBmt77xxoDb2s4plV9SX0=; 
 b=oPKQAr1DH/Lj8zJnyPdqqmMscRRGGF06FkAzANR/H6u+EAW5a8PvKQLij0kuMYnUg79b+ATFuSPMoS3bugwgX56CK7otmrrqqMM/GmJaLZNnA4b5+SJltPx2Mt9KuNKM2tpSqfyUfUytzNukGkWzJVj0LQ5/CD2Ouwc/hzrtSiU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:7ccf2f1b-4008-4fa4-86ec-bb4d351d03bd, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6f543d0, CLOUDID:bbdcae80-4f93-4875-95e7-8c66ea833d57,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 35f2204ed15711eea4ad694c3f9da370-20240222
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1342559538; Thu, 22 Feb 2024 15:51:39 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 22 Feb 2024 15:51:37 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Thu, 22 Feb 2024 15:51:37 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bs123MGnEdSEOHkPLyQI41XlHjCE83erwklmbRHi6xKIXpntLYaOj5hoGP0zHFZYP2Uvvxjvi9tGDQWFj/JguJVMnC7iTkV7wskCyJvnoNTakUr8hso6vYYA0rK8h8FafbiPKJUxPJqVcn6AaeiVAAE/fiSPqviokO8lo1M1whoyrGfIV9VlpnCumq+lDGjN+8adarhabhC7E9uwnt82naO2jWRd2bm4xk1g6w1Y+gpu++WG03KrLbelhm94Xj4kSz7PDayvUc4t+qlwLB6YeVsVoX6us0Jxn+5rW7Ky0thnbQFtWEHxkGUVljrWzcIyVXNjC/OQVehJBvguEeq4aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=65ayD74iJM93uJCxFU7fUMjoa3flv1RsxPeAijZIXgQ=;
 b=haMF1hM2RT8IllKpeeRUjQDUPW0qH1tJqViOhGMDCgYWCt3YRJ024Qo2Xc9cxBNYIX5KuNICJgwr+7A1H59A4tVYFBkrfd/PVGJ3JPSyu10QfSspt9nC0FCjYk8mYQPifPUoZPenW9cZpdBUvUBBcILIbivMwizZ6oAqmwObPvGj8/9LwPHPwlt8Tzq5c6XRoWen6WzfjzuYfyFB0AKMpQzTc3BRGA/gqmX1v3L1g+R81zQ6dw+v7THTc3/sWYboDoEoJmykKSine5H7YzD6SApzWmWEjtxGQyVe2cP8skHieblDrFgHmzwHBUPCVqiMVVKAmIu0umCO+FmSQJw/tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=65ayD74iJM93uJCxFU7fUMjoa3flv1RsxPeAijZIXgQ=;
 b=h9uqXaidUGDXp/+PGkHWY1AGLPJ6tmgxlOKpNwP5MVbvZyrVVy0PssVH2Bm5xI9fOkjtRNh8R8giQV2CUUEoJaZpbIjLjGjTLW+pre1iK54p81hq6BqL8TpnCSNyxkCKpIiMnhxu0A7z19z8Q/ejRKB/LcGfmQep1DnvLQJ4k0I=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KL1PR03MB7767.apcprd03.prod.outlook.com (2603:1096:820:e7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.38; Thu, 22 Feb
 2024 07:51:34 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::b705:ea58:46d:e98d]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::b705:ea58:46d:e98d%4]) with mapi id 15.20.7292.029; Thu, 22 Feb 2024
 07:51:34 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?TWFjIFNoZW4gKOayiOS/iik=?= <Mac.Shen@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?= <jitao.shi@mediatek.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?utf-8?B?U2h1aWppbmcgTGkgKOadjuawtOmdmSk=?= <Shuijing.Li@mediatek.com>
Subject: Re: [PATCH v2 2/3] Subject: [PATCH] drm/mediatek/dp: Add HDCP2.x
 feature for DisplayPort
Thread-Topic: [PATCH v2 2/3] Subject: [PATCH] drm/mediatek/dp: Add HDCP2.x
 feature for DisplayPort
Thread-Index: AQHaV/eVzqRhxdMZlkypH21h174pubEWF/iA
Date: Thu, 22 Feb 2024 07:51:34 +0000
Message-ID: <3d96e1d4f851008d822e6bf978107530ef1e2841.camel@mediatek.com>
References: <20240205055055.25340-1-mac.shen@mediatek.com>
 <20240205055055.25340-3-mac.shen@mediatek.com>
In-Reply-To: <20240205055055.25340-3-mac.shen@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KL1PR03MB7767:EE_
x-ms-office365-filtering-correlation-id: f6fab2ca-376e-4209-3fc4-08dc337b1742
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eZRxkBBig9Pyom4FKLl5BZu3jOtRxwAxs/CvS8ABjdH6m5xgRLFpGWW/rcAPhanGoMcL9KmsAEcttf2ummMzh0IZCHvx0HDAZ7W/7r4ma7ClUS22M8ZG3yume3E1mfkp9/QCgqj+s0NYZ9sHA2OjbH2jTDAkoOSubRercYDtGultDggHWp4RKtNHjmAXoyhCQXG9wSEJwtYRmLBW1Gc5XdXyry0e0Nef+4j5Y98bMRsVryKfv4HNYWm1+ol1CLkp2uZ214YOHhnqEJaG03RwqNwwKSTwgX6vSEfcsKu5r0dPhRwCKV0fqzWjN5L7SC4+IhWFPqgmKWb6Ug4GjC6ebZV1UK7bRvPsuHzUiDhynlRFVfnq20I82dGB/hIkFZBnnhQ53QgPVU8QsjBzUpYmH7ly+kz0GDXJivu7oRZGCfVTBOT3C0QJWe77Y4XtXAj/iZE9FAL/2kD6Hp/OMWbQl64mFH6e9IxuANmG2BDX/JDrz0F/Jaj46/hbf+YuZbSAuQpsEI7N8qBX+BM/L88DktWOaWrqL7vjc6IZkMxqx13SCxOEyi3rhBJAnewUEoioouvK1YZwFa5bhhferpS7EtAU0kgU3qS6Vdy6kdZIeFE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MVQxbGoyN09jU1Vwc3F3ODhmdVkxckVMRklzdmU0NXhlNUZIcVMrVVNkZ2l4?=
 =?utf-8?B?c2MvWE43RFU5UnRkV0hzSmUvYXhMYjZ4SDVXdFozQ25xK21sZkFJZ2NzVnFN?=
 =?utf-8?B?WHVKc0g2ZWRJVTZhWEY1c292cUZRNWVLNElqT1IzN1FmV2xoNlZ3L3pPd0NI?=
 =?utf-8?B?SC9UdkdyNnVNZjNkNHpKUUdkanRkbll3YUxXZXQ3ZjNWM0JxMjJUcmRQZmZK?=
 =?utf-8?B?L0hXVk9ZN3Y5TGFQdHhua3oxa0FyOVVaWWVyL1d5RmhVaThDL2FaZkY1dVVn?=
 =?utf-8?B?anNQWXJHUHNBUEZacjhhTG5GdmFRQlg5UGxGOUhLcGNWWi9TM2lPQ3VrZ2hZ?=
 =?utf-8?B?eWErWlh1NENFL3Z1REErMDhpa2tNSWVkWmhLZnBmcG95NHNSMHkydE14eWlk?=
 =?utf-8?B?VEd3K0NHckJiY1V0cFpGcThkTk9LU0d1YkVweXJ3eGt3Qjh2aWFPN0MxMDNM?=
 =?utf-8?B?dkNFQkFpSHkxODJaakJHOXF5R1VDbzUxbEZBWkdqYUtxOGRBTldvTVI5OHQy?=
 =?utf-8?B?QVN2YkRnNzVjVjVEUnJURnNiSlJtKzRVY2RVVWFlOTNXVXN3U0lSZjBmYm5F?=
 =?utf-8?B?c1VHL2FCSGF5QXdlVklGbnpDUysrUzJDQm80dFhyQ0hkN3JjSEVGRncrSm9h?=
 =?utf-8?B?dGtubHlzYUgyUnpTcDB3OHFHQzNKM3hVQXM1a0tob2w4eEQxYXFMMnJnQ250?=
 =?utf-8?B?NTBILzJMV2hEbktMNnNxRFZkWWtaQlMrN0NNbVZMS3VSTG96UERiS08xcHV6?=
 =?utf-8?B?YlJxQk5obkszOHc1a1hyTjBxWlB5TzUzVE11VFZvaWlaazVKUHJLeGdEWG5K?=
 =?utf-8?B?Smg0MWNvSTRHTXFtSlhkaWhzdDd4dC9wR2dPeURldUVkZ01nSmpLb0xSN3lE?=
 =?utf-8?B?WFlpYmdaeU85WDRleFFkclVUdmRRbXhaOHhCM3BFdVZOY2h2d25yWVFhc1BM?=
 =?utf-8?B?OU9QQzZ0ZGxFcFRldzlkWUhHVlZXZlMxZnBQWXpoT2ZmV0kwTjBERUdHUVZp?=
 =?utf-8?B?cGtiOVRvQVB3M0NOZ3MwNlVCdzBUenBGWFJLUVc2M2Y4UnBBVFpzOFRBVHFF?=
 =?utf-8?B?cDcyRFB5N2ZsZm9SV2pYbitYa0dCRWh0YXpHSDhZdlVHb1pDS3hXMDluM0Z5?=
 =?utf-8?B?alhlbGJ0NE4zRUkxRGcrSjJXUXlKMGJyTndnN01RZkUyaWw1Qk5TYjJFMVkr?=
 =?utf-8?B?aXlCdUhNUDZuZ2NmNkd0S1duaE5GTytUNHB2WUd1OXRhMXlyeHN0STg4eWJp?=
 =?utf-8?B?U2pBczRYWU9XSUlhNDEwZ0ZzZW16L3cyT3RYYm1kWmtDNWhLcTdkODhIclk4?=
 =?utf-8?B?OUlJc0dNekpva3ZqN08vRml3eWxYdVBvS1NUL1lnNEtObjMvYWVQZXJBNnFZ?=
 =?utf-8?B?M0JQKzFqRGdGUjBhM2V4c1ZSL2FXL0QxbGFQYkpENFpZN3BHdkQ4TEJZeTFB?=
 =?utf-8?B?VVUvSkZ3U1hsYk9ibmFYdVBJNzJCNlZLdHpJTzMvNERCeUZtdVlpaXZYWkNE?=
 =?utf-8?B?dlVIMzV6UXpvQTdGMGdBKzJtSkxQY0V3VGxpaGNHVkFJR1NTc040cFBlU3h1?=
 =?utf-8?B?MHltRnZmdGdXbGtyZDVaaGRtSEl2clRDR3V3QnJwMWNhcHUvcW1oMDlCMTRZ?=
 =?utf-8?B?VnR1b09HYmhzS0dRVGpGR3dOMVFUQzlmclFaNDVUcnl1UVVLOW91R3dscEZh?=
 =?utf-8?B?dFE1M2sxVS92dDg4bnRCR25hRk0rRWV6S0VGMDdhVDl6THpSOGNpTFVWeGhn?=
 =?utf-8?B?bG1pa3dNb0lnM2xRcFV4ZGRoKzVGMFJ6azNjVTA0UE9KTUhoeTFXcDUvTFFX?=
 =?utf-8?B?WTRuZm9SL0xJdE1UbU9PN3hYS3ZvL0gyMC8xRDlyQVNmd0ExRWt1TDlSWFdo?=
 =?utf-8?B?Y295RW5lS2wxbXRmNm5PMDErdGNoOSs4cVRpdXJXODZjSWRLZHlEenJQazZB?=
 =?utf-8?B?RHlHc0I2UDUvZndVc1BYRUFxUGR3NmNRVmRjbkpVYzRNelpiK05pTW1YaXhx?=
 =?utf-8?B?VXI0UWkzc1dwQW40enZXOExEMC8xeXo3SmVHSW0vcCtGZEF3dFBuSk9VTTlt?=
 =?utf-8?B?OHJNdk50eUdZTjdzWFBxc2FQcFFWQS9HRytFT0ZSQjhCT0hadTZpK3Y4R04r?=
 =?utf-8?Q?u0RWYKoHIXZwOUOc3WzTLcAjn?=
Content-ID: <4987E558C2B9204696E7DA14129844B2@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6fab2ca-376e-4209-3fc4-08dc337b1742
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2024 07:51:34.3815 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UP9zi6usHUHkfpCigP77yRwd1/mTK8zgFn4KYAPp7XbqUFRVqBTcOBuRi0RxTH+jx1qpbg/hjTatCqeNxIGvwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7767
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_003_983941091.2070532422"
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

--__=_Part_Boundary_003_983941091.2070532422
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIE1hYzoNCg0KT24gTW9uLCAyMDI0LTAyLTA1IGF0IDEzOjUwICswODAwLCBtYWMuc2hlbiB3
cm90ZToNCj4gQWRkIEhEQ1AyLnggZmVhdHVyZSBmb3IgRGlzcGxheVBvcnQuDQo+IFdoZW4gdXNl
cnNwYWNlIHJlcXVlc3QgdGhlIGtlcm5lbCBwcm90ZWN0IGZ1dHVyZSBjb250ZW50IGNvbW11bmlj
YXRlZA0KPiBvdmVyIHRoZSBsaW5rIHdpdGggQ29udGVudF9Qcm90ZWN0aW9uIHByb3BlcnR5LCB0
aGUgZmVhdHVyZSB3aWxsIGRvDQo+IEhEQ1AyLnggYXV0aGVudGljYXRpb24gaWYgdGhlIHNpbmsg
c3VwcG9ydCBIRENQMi5YLg0KPiANCj4gQ2hhbmdlcyBpbiB2MjoNCj4gLSByZW1vdmUgc3dpdGNo
IGNhc2UsIGFuZCByZWZpbmUgY29kZSB0byBtYWtlIG1vcmUgY2xlYXINCj4gLSByZW1vdmUgc29t
ZSBkZWZpbml0aW9ucywgYW5kIHVzZSB0aGUgZGVmaW5pdGlvbnMgaW4NCj4gICBpbmNsdWRlL2Ry
bS9kcm1faGRjcC5oDQo+IC0gdXNlIHRoZSBzdHJ1Y3Qgd2hpY2ggZGVmaW5lZCBpbiBpbmNsdWRl
L2RybS9kcm1faGRjcC5oDQo+IC0gZG8gSERDUDIueCBhdXRoZW50aWNhdGlvbiB3aGVuIHVzZXJz
cGFjZSByZXF1ZXN0IHRoZQ0KPiAgIGtlcm5lbCBwcm90ZWN0IGZ1dHVyZSBjb250ZW50IGNvbW11
bmljYXRlZA0KPiBwZXIgc3VnZ2VzdGlvbiBmcm9tIHRoZSBwcmV2aW91cyB0aHJlYWQ6DQo+IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC84ZmZmNTliNTU2NzQ0OWQ4MjAxZGQxMTM4YzhmYQ0K
PiA5MjE4YTU0NWM0Ni5jYW1lbEBtZWRpYXRlay5jb20vDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBt
YWMuc2hlbiA8bWFjLnNoZW5AbWVkaWF0ZWsuY29tPg0KPiAtLS0NCg0KW3NuaXBdDQoNCj4gKw0K
PiArc3RhdGljIHZvaWQgZHBfdHhfaGRjcDJfZXJyX2hhbmRsZShzdHJ1Y3QgbXRrX2hkY3BfaW5m
byAqaGRjcF9pbmZvLA0KPiBpbnQgZXJyX21zZywgaW50IGxpbmUpDQo+ICt7DQo+ICsJcHJfZXJy
KCIyLng6IE1haW5TdGF0ZTolZDsgU3ViU3RhdGU6JWQ7XG4iLCBoZGNwX2luZm8tDQo+ID5oZGNw
Ml9pbmZvLmhkY3BfaGFuZGxlci5tYWluX3N0YXRlLA0KPiArCSAgICAgICBoZGNwX2luZm8tPmhk
Y3AyX2luZm8uaGRjcF9oYW5kbGVyLnN1Yl9zdGF0ZSk7DQo+ICsNCj4gKwlzd2l0Y2ggKGVycl9t
c2cpIHsNCj4gKwljYXNlIEhEQ1BfRVJSX1VOS05PV05fU1RBVEU6DQo+ICsJCXByX2VycigiMi54
OiBVbmtub3duIFN0YXRlLCBsaW5lOiVkXG4iLCBsaW5lKTsNCj4gKwkJZHBfdHhfaGRjcDJfc2V0
X3N0YXRlKGhkY3BfaW5mbywgSERDUDJfTVNfSDFQMSwNCj4gSERDUF8yXzJfQVVUSF9GQUlMKTsN
Cg0KRm9yIGVhY2ggY2FzZSwgeW91IGp1c3QgcHJpbnQgZXJyb3IgbWVzc2FnZSBhbmQgc2V0IHN0
YXRlLiBJdCBzZWVtcyBub3QNCm5lY2Vzc2FyeSB0byBncm91cCB0aGVzZSBjYXNlcy4gV2hlcmUg
ZXJyb3IgaGFwcGVuLCBqdXN0IHByaW50IG1lc3NhZ2UNCnRoZXJlIGFuZCBzZXQgc3RhdGUgdGhl
cmUuIEFuZCBub3QgcHJpbnQgbGluZSwgeW91IHNob3VsZCBwcmludCB3aGF0DQp0aGUgZXJyb3Ig
aXMuDQoNClJlZ2FyZHMsDQpDSw0KDQo+ICsJCWJyZWFrOw0KPiArDQo+ICsJY2FzZSBIRENQX0VS
Ul9TRU5EX01TR19GQUlMOg0KPiArCQlwcl9lcnIoIjIueDogU2VuZCBNc2cgRmFpbCwgbGluZTol
ZFxuIiwgbGluZSk7DQo+ICsJCWRwX3R4X2hkY3AyX3NldF9zdGF0ZShoZGNwX2luZm8sIEhEQ1Ay
X01TX0EwRjAsDQo+IEhEQ1BfMl8yX05VTExfTVNHKTsNCj4gKwkJYnJlYWs7DQo+ICsJY2FzZSBI
RENQX0VSUl9SRVNQT05TRV9USU1FUk9VVDoNCj4gKwkJcHJfZXJyKCIyLng6IFJlc3BvbnNlIFRp
bWVvdXQsIGxpbmU6JWQhXG4iLCBsaW5lKTsNCj4gKwkJZHBfdHhfaGRjcDJfc2V0X3N0YXRlKGhk
Y3BfaW5mbywgSERDUDJfTVNfQTBGMCwNCj4gSERDUF8yXzJfTlVMTF9NU0cpOw0KPiArCQlicmVh
azsNCj4gKw0KPiArCWNhc2UgSERDUF9FUlJfUFJPQ0VTU19GQUlMOg0KPiArCQlwcl9lcnIoIjIu
eDogUHJvY2VzcyBGYWlsLCBsaW5lOiVkIVxuIiwgbGluZSk7DQo+ICsJCWRwX3R4X2hkY3AyX3Nl
dF9zdGF0ZShoZGNwX2luZm8sIEhEQ1AyX01TX0EwRjAsDQo+IEhEQ1BfMl8yX05VTExfTVNHKTsN
Cj4gKwkJYnJlYWs7DQo+ICsNCj4gKwlkZWZhdWx0Og0KPiArCQlwcl9lcnIoIjIueDogTk8gRVJS
T1IhIik7DQo+ICsJCWJyZWFrOw0KPiArCX0NCj4gK30NCg==

--__=_Part_Boundary_003_983941091.2070532422
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtNYWM6DQoNCk9uJiMzMjtNb24sJiMzMjsy
MDI0LTAyLTA1JiMzMjthdCYjMzI7MTM6NTAmIzMyOyswODAwLCYjMzI7bWFjLnNoZW4mIzMyO3dy
b3RlOg0KJmd0OyYjMzI7QWRkJiMzMjtIRENQMi54JiMzMjtmZWF0dXJlJiMzMjtmb3ImIzMyO0Rp
c3BsYXlQb3J0Lg0KJmd0OyYjMzI7V2hlbiYjMzI7dXNlcnNwYWNlJiMzMjtyZXF1ZXN0JiMzMjt0
aGUmIzMyO2tlcm5lbCYjMzI7cHJvdGVjdCYjMzI7ZnV0dXJlJiMzMjtjb250ZW50JiMzMjtjb21t
dW5pY2F0ZWQNCiZndDsmIzMyO292ZXImIzMyO3RoZSYjMzI7bGluayYjMzI7d2l0aCYjMzI7Q29u
dGVudF9Qcm90ZWN0aW9uJiMzMjtwcm9wZXJ0eSwmIzMyO3RoZSYjMzI7ZmVhdHVyZSYjMzI7d2ls
bCYjMzI7ZG8NCiZndDsmIzMyO0hEQ1AyLngmIzMyO2F1dGhlbnRpY2F0aW9uJiMzMjtpZiYjMzI7
dGhlJiMzMjtzaW5rJiMzMjtzdXBwb3J0JiMzMjtIRENQMi5YLg0KJmd0OyYjMzI7DQomZ3Q7JiMz
MjtDaGFuZ2VzJiMzMjtpbiYjMzI7djI6DQomZ3Q7JiMzMjstJiMzMjtyZW1vdmUmIzMyO3N3aXRj
aCYjMzI7Y2FzZSwmIzMyO2FuZCYjMzI7cmVmaW5lJiMzMjtjb2RlJiMzMjt0byYjMzI7bWFrZSYj
MzI7bW9yZSYjMzI7Y2xlYXINCiZndDsmIzMyOy0mIzMyO3JlbW92ZSYjMzI7c29tZSYjMzI7ZGVm
aW5pdGlvbnMsJiMzMjthbmQmIzMyO3VzZSYjMzI7dGhlJiMzMjtkZWZpbml0aW9ucyYjMzI7aW4N
CiZndDsmIzMyOyYjMzI7JiMzMjtpbmNsdWRlL2RybS9kcm1faGRjcC5oDQomZ3Q7JiMzMjstJiMz
Mjt1c2UmIzMyO3RoZSYjMzI7c3RydWN0JiMzMjt3aGljaCYjMzI7ZGVmaW5lZCYjMzI7aW4mIzMy
O2luY2x1ZGUvZHJtL2RybV9oZGNwLmgNCiZndDsmIzMyOy0mIzMyO2RvJiMzMjtIRENQMi54JiMz
MjthdXRoZW50aWNhdGlvbiYjMzI7d2hlbiYjMzI7dXNlcnNwYWNlJiMzMjtyZXF1ZXN0JiMzMjt0
aGUNCiZndDsmIzMyOyYjMzI7JiMzMjtrZXJuZWwmIzMyO3Byb3RlY3QmIzMyO2Z1dHVyZSYjMzI7
Y29udGVudCYjMzI7Y29tbXVuaWNhdGVkDQomZ3Q7JiMzMjtwZXImIzMyO3N1Z2dlc3Rpb24mIzMy
O2Zyb20mIzMyO3RoZSYjMzI7cHJldmlvdXMmIzMyO3RocmVhZDoNCiZndDsmIzMyO2h0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2FsbC84ZmZmNTliNTU2NzQ0OWQ4MjAxZGQxMTM4YzhmYQ0KJmd0OyYj
MzI7OTIxOGE1NDVjNDYuY2FtZWxAbWVkaWF0ZWsuY29tLw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtT
aWduZWQtb2ZmLWJ5OiYjMzI7bWFjLnNoZW4mIzMyOyZsdDttYWMuc2hlbkBtZWRpYXRlay5jb20m
Z3Q7DQomZ3Q7JiMzMjstLS0NCg0KW3NuaXBdDQoNCiZndDsmIzMyOysNCiZndDsmIzMyOytzdGF0
aWMmIzMyO3ZvaWQmIzMyO2RwX3R4X2hkY3AyX2Vycl9oYW5kbGUoc3RydWN0JiMzMjttdGtfaGRj
cF9pbmZvJiMzMjsqaGRjcF9pbmZvLA0KJmd0OyYjMzI7aW50JiMzMjtlcnJfbXNnLCYjMzI7aW50
JiMzMjtsaW5lKQ0KJmd0OyYjMzI7K3sNCiZndDsmIzMyOytwcl9lcnIoJnF1b3Q7Mi54OiYjMzI7
TWFpblN0YXRlOiVkOyYjMzI7U3ViU3RhdGU6JWQ7JiM5MjtuJnF1b3Q7LCYjMzI7aGRjcF9pbmZv
LQ0KJmd0OyYjMzI7Jmd0O2hkY3AyX2luZm8uaGRjcF9oYW5kbGVyLm1haW5fc3RhdGUsDQomZ3Q7
JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtoZGNwX2luZm8tJmd0O2hk
Y3AyX2luZm8uaGRjcF9oYW5kbGVyLnN1Yl9zdGF0ZSk7DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsr
c3dpdGNoJiMzMjsoZXJyX21zZykmIzMyO3sNCiZndDsmIzMyOytjYXNlJiMzMjtIRENQX0VSUl9V
TktOT1dOX1NUQVRFOg0KJmd0OyYjMzI7K3ByX2VycigmcXVvdDsyLng6JiMzMjtVbmtub3duJiMz
MjtTdGF0ZSwmIzMyO2xpbmU6JWQmIzkyO24mcXVvdDssJiMzMjtsaW5lKTsNCiZndDsmIzMyOytk
cF90eF9oZGNwMl9zZXRfc3RhdGUoaGRjcF9pbmZvLCYjMzI7SERDUDJfTVNfSDFQMSwNCiZndDsm
IzMyO0hEQ1BfMl8yX0FVVEhfRkFJTCk7DQoNCkZvciYjMzI7ZWFjaCYjMzI7Y2FzZSwmIzMyO3lv
dSYjMzI7anVzdCYjMzI7cHJpbnQmIzMyO2Vycm9yJiMzMjttZXNzYWdlJiMzMjthbmQmIzMyO3Nl
dCYjMzI7c3RhdGUuJiMzMjtJdCYjMzI7c2VlbXMmIzMyO25vdA0KbmVjZXNzYXJ5JiMzMjt0byYj
MzI7Z3JvdXAmIzMyO3RoZXNlJiMzMjtjYXNlcy4mIzMyO1doZXJlJiMzMjtlcnJvciYjMzI7aGFw
cGVuLCYjMzI7anVzdCYjMzI7cHJpbnQmIzMyO21lc3NhZ2UNCnRoZXJlJiMzMjthbmQmIzMyO3Nl
dCYjMzI7c3RhdGUmIzMyO3RoZXJlLiYjMzI7QW5kJiMzMjtub3QmIzMyO3ByaW50JiMzMjtsaW5l
LCYjMzI7eW91JiMzMjtzaG91bGQmIzMyO3ByaW50JiMzMjt3aGF0DQp0aGUmIzMyO2Vycm9yJiMz
Mjtpcy4NCg0KUmVnYXJkcywNCkNLDQoNCiZndDsmIzMyOyticmVhazsNCiZndDsmIzMyOysNCiZn
dDsmIzMyOytjYXNlJiMzMjtIRENQX0VSUl9TRU5EX01TR19GQUlMOg0KJmd0OyYjMzI7K3ByX2Vy
cigmcXVvdDsyLng6JiMzMjtTZW5kJiMzMjtNc2cmIzMyO0ZhaWwsJiMzMjtsaW5lOiVkJiM5Mjtu
JnF1b3Q7LCYjMzI7bGluZSk7DQomZ3Q7JiMzMjsrZHBfdHhfaGRjcDJfc2V0X3N0YXRlKGhkY3Bf
aW5mbywmIzMyO0hEQ1AyX01TX0EwRjAsDQomZ3Q7JiMzMjtIRENQXzJfMl9OVUxMX01TRyk7DQom
Z3Q7JiMzMjsrYnJlYWs7DQomZ3Q7JiMzMjsrY2FzZSYjMzI7SERDUF9FUlJfUkVTUE9OU0VfVElN
RVJPVVQ6DQomZ3Q7JiMzMjsrcHJfZXJyKCZxdW90OzIueDomIzMyO1Jlc3BvbnNlJiMzMjtUaW1l
b3V0LCYjMzI7bGluZTolZCEmIzkyO24mcXVvdDssJiMzMjtsaW5lKTsNCiZndDsmIzMyOytkcF90
eF9oZGNwMl9zZXRfc3RhdGUoaGRjcF9pbmZvLCYjMzI7SERDUDJfTVNfQTBGMCwNCiZndDsmIzMy
O0hEQ1BfMl8yX05VTExfTVNHKTsNCiZndDsmIzMyOyticmVhazsNCiZndDsmIzMyOysNCiZndDsm
IzMyOytjYXNlJiMzMjtIRENQX0VSUl9QUk9DRVNTX0ZBSUw6DQomZ3Q7JiMzMjsrcHJfZXJyKCZx
dW90OzIueDomIzMyO1Byb2Nlc3MmIzMyO0ZhaWwsJiMzMjtsaW5lOiVkISYjOTI7biZxdW90Oywm
IzMyO2xpbmUpOw0KJmd0OyYjMzI7K2RwX3R4X2hkY3AyX3NldF9zdGF0ZShoZGNwX2luZm8sJiMz
MjtIRENQMl9NU19BMEYwLA0KJmd0OyYjMzI7SERDUF8yXzJfTlVMTF9NU0cpOw0KJmd0OyYjMzI7
K2JyZWFrOw0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7K2RlZmF1bHQ6DQomZ3Q7JiMzMjsrcHJfZXJy
KCZxdW90OzIueDomIzMyO05PJiMzMjtFUlJPUiEmcXVvdDspOw0KJmd0OyYjMzI7K2JyZWFrOw0K
Jmd0OyYjMzI7K30NCiZndDsmIzMyOyt9DQoNCjwvcHJlPg0KPC9wPjwvYm9keT48L2h0bWw+PCEt
LXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVu
dGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioqKioqKioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250
YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRz
KSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3
aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMg
aW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVu
dChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHByaW50aW5nLCBy
ZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFj
aG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVk
IGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBp
ZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0
aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRl
bHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGll
cyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIg
c3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0
byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_003_983941091.2070532422--

