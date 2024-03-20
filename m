Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E84C18808F4
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 02:18:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18D3D10E582;
	Wed, 20 Mar 2024 01:18:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="FXOLnaDe";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="U6SlitXG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACDCF10E582
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 01:18:25 +0000 (UTC)
X-UUID: bde0d1b6e65711eeb8927bc1f75efef4-20240320
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=rLyYfr7MCIbVnU4UOuXZZajNUeoEjZsflQP5wCYpwEs=; 
 b=FXOLnaDeg23hSIkhPLaqjvWxbtq/7JWhF2n2/JrBvc9ALKkyOhzdU64Ma/CIrTumBJvIe5cnqugbY/gBPKHSnjyj9TKRSIzfw2Vj2SkUmsoY/4zMNvghV1KFlZrq7RwDj1qnHQKkDtQNG2BsMHXTi/8yrzaEYeFLHlhsKIbaOtk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:d0dad3b6-486f-4b3f-9559-21a4538ab2a6, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6f543d0, CLOUDID:71a03285-8d4f-477b-89d2-1e3bdbef96d1,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: bde0d1b6e65711eeb8927bc1f75efef4-20240320
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw01.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 713487978; Wed, 20 Mar 2024 09:18:21 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 20 Mar 2024 09:18:21 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Mar 2024 09:18:21 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SInh3xb3Bt1cJ4UXpcc0T7u5eVaIIAwGvIaqpMmQjPHIAN1Vfs5H2pMLE/vahar3tEfnc7xo4MhE2wDjLNnh2xLM5/wqnX5TQSMwWJB6d7gw3kL0KM71BsoXL14APpiMyFsjNs3ZuWnz9bVeqyxLFAS1QB9IFB2cN7qrHW9l35doMyJiUTdRRQmLtQ2tIvwgHcL9e939CHVEeWOqMhM+5oI/NZcWC9u//Hn7p1R4WPd2UOwGeyicoQ3tNcZRS4BuztT1VBPo1NJOUGtzneBocRvA1lI1MM9RWDku+01Rfq3Rfw4OV/kUGW0YUDaNktqReJx/zdYe1N7ycb6UURMarg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sULEdCIXqWz/DAMFyWS+Vl2hQ1o24jCyaMhXG2Wga1E=;
 b=URQGUpsqOR8focLKt//dXam8jgn6uUGk4qB2tYYwDAXEWvE5r3Yw5tYnmrrSP4nAiPnGke6mWqVYiAAzUJa7CANZwC8ovyshUmPlQRgDVZUj+08ou6zD9W3UhWreUAA8OSnAcvkOIfP6se3TT+Hr6KieLd3VZWiPnnqEFQe2utuODHirm+UrP+FmhT75gNxyblD/rBExsha3vGO/U5I2h0Hpy0utddP+H5oDsjJI7BnI0JHFxOLPPXngRh2i1ZO7N6rwX8wUtc1rwClML2m2eAWapIDgWNIyOJk9393YvvrZ9k8XtEGG0f9MMr3cvOnXdauqGHsXzLa9gQ9JN/ncdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sULEdCIXqWz/DAMFyWS+Vl2hQ1o24jCyaMhXG2Wga1E=;
 b=U6SlitXG93odTQLnbOL9fNIQ0TMxX7zFSF/39251LZjszKDKZWNrjuO/GGZPVuAma9oaKAgDLSQwXsGjbXrUtqTGGd9jyDaf86Jxw9RdOrxadpCSVFesNyqJb9/7DVF4Ajhm78xgvHWUOB42L63/GTmfd/r63wieQ1X9LTUNoAc=
Received: from TYZPR03MB6623.apcprd03.prod.outlook.com (2603:1096:400:1f5::13)
 by KL1PR03MB7599.apcprd03.prod.outlook.com (2603:1096:820:cc::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.30; Wed, 20 Mar
 2024 01:18:17 +0000
Received: from TYZPR03MB6623.apcprd03.prod.outlook.com
 ([fe80::be:5466:6e74:793f]) by TYZPR03MB6623.apcprd03.prod.outlook.com
 ([fe80::be:5466:6e74:793f%6]) with mapi id 15.20.7386.030; Wed, 20 Mar 2024
 01:18:17 +0000
From: =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>
To: "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>
CC: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>,
 "shawn.sung@mediatek.corp-partner.google.com"
 <shawn.sung@mediatek.corp-partner.google.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>
Subject: Re: [PATCH v2 02/14] drm/mediatek: Rename "mtk_drm_ddp_comp" to
 "mtk_ddp_comp"
Thread-Topic: [PATCH v2 02/14] drm/mediatek: Rename "mtk_drm_ddp_comp" to
 "mtk_ddp_comp"
Thread-Index: AQHaee5Fc/LhYCeT4Ue0X8S7Qbm9BLE/1RsA
Date: Wed, 20 Mar 2024 01:18:17 +0000
Message-ID: <baaea2c0a7e0981906e5a44405d300d89af19c2a.camel@mediatek.com>
References: <20240319070257.6443-1-shawn.sung@mediatek.com>
 <20240319070257.6443-3-shawn.sung@mediatek.com>
 <4c2ffd1c-d059-4448-9b2d-142ea87d6bd8@collabora.com>
In-Reply-To: <4c2ffd1c-d059-4448-9b2d-142ea87d6bd8@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6623:EE_|KL1PR03MB7599:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Zw5WrmemB4ti8CYvqB8Qa+AiqJpiUFGUdxwuGRWUPDClrpaYjwYdIrI7vN8gEKzVfuymaYT2RSaEiUFvwL9iFEc+KK4MBkiKIY+FOOlw2LfKSBNbgSqd8sK556c7+4MBxI7y91XgXd6C8o/ieXyG5jYrfF0rYDyw72j9xPL7rlVyytjUFiP+CHlbio5zgWIM9MKL+2d8uY0m8x1Y8kFMuCFbfWkNzQ0ANepo1izz5BMDgeQ+cC/W65bZEIoZmrPIBDI0MJaY2ryyLBC2M2ZFsb/JYekiS08Ffrc90/rQ8Q/Hgt8fuBMbi9h56v2jq+T769GcGHHauDrLcXBI4FHv0e5zGXBgak+Z1UpU35pE6VRQvobxu9avIWC8PigJYqfQfMOKQ6F/M9a16xt1KEcewuFxtP9m4Z084hDBtDXIYhvT1RDRU2tmwuzIUYeNB90UsWxLugKS3d6ODTZkwniqQ4OpQmpEvHNLuvIBxMU2UtAbC06ZaWHjbqm2N/3XPI4G/I9bejygXHis1LQ16VkJF+UZlrujAndFdTiMTDnEYSLdTqPxI/ZSjoAGC5yi0ollMA9wu7DSpUI8bM81PEw9RoiTvMjhJr311znAjPoak5zFqj5UFrIy6wDkl9SLRdhYUrQatzw1HcKud09TaE9mDjpI5A1dF/ZJGejQRhnZu4U=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6623.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(7416005)(1800799015)(366007); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Wk03eHhiTUtMWkp3N205T2J3WVByNXRheWZ2V0FUdjB5ZWQ0MDJZZmhJMXgz?=
 =?utf-8?B?aUZrSHdUaTlTRy9wK2lJci93cDh6aXpEcG9HQmdDT2ZHSnhFR3ZvY3pQaTlr?=
 =?utf-8?B?Q1FFRjljQjBOUUZPRktLWEI5TVhmN09DWmxhcnJobTN3NWREQWNMZ244dXBT?=
 =?utf-8?B?OGlDRGFCbzM1Nmpnei9uaS8zL1pNNmNINFYwNi8rOWFmUDF2ZXpRNyt2b1Rk?=
 =?utf-8?B?Vy8zNFlUd2FWMm0rdlY1ZGtVejNhY29oZzAzWlBaWm1ZVitVcnZRT1FKcWRN?=
 =?utf-8?B?elBaNzNEcGlscGV5U2huS3dHOXZOTWR0ZVBMbVppZVM1SjZTczFyMjBucWVi?=
 =?utf-8?B?b1h4VUdKUXRIZ3RBM2M3eG41ZmY3QVcwa0hhL3FONnZWVXFOWmNEWlB1K0w0?=
 =?utf-8?B?K2pLNWlObTdqM0xpc1R2QmliZjNkcDh4enVCQnZPVlNWa0VBa2dKOUJ6SmM2?=
 =?utf-8?B?d1psN28zOFZsZ2ZlWG5xeTBXbVpwcitaUHJSaUpJdDNLZTEwVVFuU0I1WVpF?=
 =?utf-8?B?clQ1MzZ5SkNKa2lnaXRObkhOdndCelFYemJhT3E3a2ljcUVwVWhVYmxXNHo1?=
 =?utf-8?B?NHgrSUM4RjJyRzREY3llSFExanR2emlTNWYrVkZEZVlwUzFVZ3hRMEptbnhh?=
 =?utf-8?B?RFRscTRmS0k2VFIwV1Z0dm84dTh4cS82UFZYY3hDRFAwUUFlNkdBM1lkUmF2?=
 =?utf-8?B?aFVHV0NUYU9PR0FnL29GNVlwL0MxZVNIWkhCdG9SUFVNU3JRdTEzQ2JTOXVS?=
 =?utf-8?B?TlFqZ09FTkhveklqbE8rYzBuS1hNZmh2eHlKZjRRbWF4cWZPdFhZa3FURGZ1?=
 =?utf-8?B?V2lodWdxNXVxS0Z6VG9pZTU5ZW5KS2M5WFFQMTNhTmVSa2hXZWNBYjkyVnJX?=
 =?utf-8?B?L01zWFd0cU5xeHFkbGtFK29RZXNxWUxwcVVWYzV6QWFROGpCeHJjYno0SS8z?=
 =?utf-8?B?WFdwQlNXcnBQWldsLytlOTd6N3RrNkloc0lMLzdsSGE4b2FZcTZrSUcxL3N1?=
 =?utf-8?B?ZitJUmxlTy9wWG1KOFAzY2VBQWRna0oyT252WitpWTRxRkNmbjVMNlJTY1VJ?=
 =?utf-8?B?ajRyZmpsck9XSnk1alRtUkVKT1lIemVEOTcrNHhCSEF2aGlWWTFWdjBtSmhi?=
 =?utf-8?B?YTM3bHlPRDM0N2JQZThESXdNT1VTTk9MWUxlYXNUMXNqMlcyOGEzMG16Ymll?=
 =?utf-8?B?L2kwRTZmY1llRmlSaXF6cW5MN2hSM2lKOG10UEtNUnlVdzVya0E1QjNHdkVk?=
 =?utf-8?B?MlNTNENYcCs1WkZzVWxBNUgya1VkcWVmK0JFS3EyalRPM3N3OTNuQjNSd0hK?=
 =?utf-8?B?TXluSEkvM0pabVFFbE5qc1pvdGpqTUFuYnAxamRGblovZ0NrR1JwU0VwZ0Rh?=
 =?utf-8?B?Q0JXb1VGdFQ5WDFFSFhraUE0SmhCcWowOGdxR0N4N0RjbzhUcTRQZWYrMy95?=
 =?utf-8?B?S2tLZ1krRzFoNW9YUEhFT0NSYzhDU3BzUGx5b0ZHU0Qvbk02UzhrNng3ekxY?=
 =?utf-8?B?d3lQOG5Uc2t1UTdKbWt1T0puQVFxeVhJUkQ3NnlPQzVLNkF4YzZlcFllM2N6?=
 =?utf-8?B?a2Fkb0pFdHRVbXRqaGFWd1JTN0xCRm1EdG01cGcyU0dkVmZPcWJDcWVMV0Zk?=
 =?utf-8?B?S0t1SW1qamFrR2w5RFFqU1lHV3kxZSttKzlkZlRSVkpFRktXZEh3SExTdUY1?=
 =?utf-8?B?ZHJzNjJnQlkvamRzVmIxKzUrbHhyZVpyTEpkbTdsRkFkT3pSb04yM1UvMG1O?=
 =?utf-8?B?QVZnYzF4YjU2bVRuWXFpRzRNSjZ4WUlsZFE5MVpYVXlpRTNKQkVwWmluNXpS?=
 =?utf-8?B?MkR2bXFHSXFmdUNLMGZ2M2xvWTJ2WFdyT050dFBFQy9MNmhkRnVITXZ2QnpN?=
 =?utf-8?B?alg0eGRGNTJMYUlwbWlSZ1lCM21JKzB3YVd3ak9kNjFBbXViWUZzTURBMkM5?=
 =?utf-8?B?VEtER0dwN0toaXM2dmJVdVhmOU9wNWNkRjZsWGdFbXgvbGZvOHlhLzlQeFh0?=
 =?utf-8?B?bStyN3RmWXdqdWNQMStWNkl4WHNLMXlvRWJqMkRlNzFzanQ4K2Y3QTVuMGpL?=
 =?utf-8?B?QXlhVDNSV1EwS0l6eGQvV3JBMXNSWVRaNlQxd0w2N2RQTUVLYTE2bmgxZXNi?=
 =?utf-8?B?SEdNa3psaXNsNnlaM2s4SHB2NzU5TUVEYkc4dDFJWUk0enYwMEpZa0pPNlkr?=
 =?utf-8?B?QUE9PQ==?=
Content-ID: <ADA726587A5DE24BA6C2257FC34C41C6@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6623.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b50428f-636c-41d3-54fc-08dc487b9f82
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2024 01:18:17.3755 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HPFyzDg5VzeDyUxoogbrTjGfxEHyoCjOVCTqfMokiyiUiimrb5sw0+0Y/kKRXx4TN4JmEt50si8v8ZAI/mMIxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7599
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_008_184550678.1426250047"
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

--__=_Part_Boundary_008_184550678.1426250047
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQW5nZWxvLA0KDQpPbiBUdWUsIDIwMjQtMDMtMTkgYXQgMTI6MTEgKzAxMDAsIEFuZ2Vsb0dp
b2FjY2hpbm8gRGVsIFJlZ25vIHdyb3RlOg0KPiBJbCAxOS8wMy8yNCAwODowMiwgU2hhd24gU3Vu
ZyBoYSBzY3JpdHRvOg0KPiA+IEZyb206IEhzaWFvIENoaWVuIFN1bmcgPHNoYXduLnN1bmdAbWVk
aWF0ZWsuY29ycC1wYXJ0bmVyLmdvb2dsZS5jb20NCj4gPiA+DQo+ID4gDQo+ID4gUmVuYW1lIGFs
bCAibXRrX2RybV9kZHBfY29tcCIgdG8gIm10a19kZHBfY29tcCI6DQo+ID4gLSBUbyBhbGlnbiB0
aGUgbmFtaW5nIHJ1bGUNCj4gPiAtIFRvIHJlZHVjZSB0aGUgY29kZSBzaXplDQo+ID4gDQo+ID4g
UmV2aWV3ZWQtYnk6IEFuZ2Vsb0dpYW9jY2hpbm8gRGVsIFJlZ25vIDwNCj4gPiBhbmdlbG9naW9h
Y2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+DQo+IA0KPiBTaGF3biwgSSBkb24ndCBrbm93
IGlmIEkgdHlwb2VkIG15IG93biBuYW1lICh3aGljaCBpcyBhY3R1YWxseQ0KPiBwb3NzaWJsZSwg
c2luY2UNCj4gSSB3cml0ZSB0aGUgdGFncyBieSBoYW5kKSwgb3Igd2hhdCBhY3R1YWxseSBoYXBw
ZW5lZCB0byBteSBSZXZpZXdlZC0NCj4gYnkgdGFncyBvbg0KPiB0aGUgZW50aXJlIHNlcmllcy4N
Cj4gDQo+IENhbiB5b3UgcGxlYXNlIGZpeCB0aGUgdHlwbyBpbiB0aGUgdGFnPw0KPiANCj4gUmV2
aWV3ZWQtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDwNCj4gYW5nZWxvZ2lvYWNjaGlu
by5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPg0KPiANCj4gVXNlIHRoaXMgb25lLCBwbGVhc2UuDQo+
IA0KDQpUaGFuayB5b3UgZm9yIHRoZSByZW1pbmRlci4gRGlkbid0IG5vdGljZSB0aGF0IGVpdGhl
ci4NClNpbmNlcyBJIGFsd2F5cyB1c2UgYjQgdG9vbCB0byBkb3dubG9hZCB0aGUgcGF0Y2hlcyB0
byBwcmV2ZW50IGh1bWFuDQplcnJvciwgdGhpcyBjb3VsZCBiZSBhIHR5cG8uIE5vIHByb2JsZW0s
IEkgd2lsbCBmaXggaXQgaW4gdGhlIG5leHQNCnZlcnNpb24uDQoNClRoYW5rcyBhbmQgcmVnYXJk
cywNClNoYXduDQo=

--__=_Part_Boundary_008_184550678.1426250047
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGkmIzMyO0FuZ2VsbywNCg0KT24mIzMyO1R1ZSwmIzMy
OzIwMjQtMDMtMTkmIzMyO2F0JiMzMjsxMjoxMSYjMzI7KzAxMDAsJiMzMjtBbmdlbG9HaW9hY2No
aW5vJiMzMjtEZWwmIzMyO1JlZ25vJiMzMjt3cm90ZToNCiZndDsmIzMyO0lsJiMzMjsxOS8wMy8y
NCYjMzI7MDg6MDIsJiMzMjtTaGF3biYjMzI7U3VuZyYjMzI7aGEmIzMyO3Njcml0dG86DQomZ3Q7
JiMzMjsmZ3Q7JiMzMjtGcm9tOiYjMzI7SHNpYW8mIzMyO0NoaWVuJiMzMjtTdW5nJiMzMjsmbHQ7
c2hhd24uc3VuZ0BtZWRpYXRlay5jb3JwLXBhcnRuZXIuZ29vZ2xlLmNvbQ0KJmd0OyYjMzI7Jmd0
OyYjMzI7Jmd0Ow0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtSZW5hbWUm
IzMyO2FsbCYjMzI7JnF1b3Q7bXRrX2RybV9kZHBfY29tcCZxdW90OyYjMzI7dG8mIzMyOyZxdW90
O210a19kZHBfY29tcCZxdW90OzoNCiZndDsmIzMyOyZndDsmIzMyOy0mIzMyO1RvJiMzMjthbGln
biYjMzI7dGhlJiMzMjtuYW1pbmcmIzMyO3J1bGUNCiZndDsmIzMyOyZndDsmIzMyOy0mIzMyO1Rv
JiMzMjtyZWR1Y2UmIzMyO3RoZSYjMzI7Y29kZSYjMzI7c2l6ZQ0KJmd0OyYjMzI7Jmd0OyYjMzI7
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtSZXZpZXdlZC1ieTomIzMyO0FuZ2Vsb0dpYW9jY2hpbm8mIzMy
O0RlbCYjMzI7UmVnbm8mIzMyOyZsdDsNCiZndDsmIzMyOyZndDsmIzMyO2FuZ2Vsb2dpb2FjY2hp
bm8uZGVscmVnbm9AY29sbGFib3JhLmNvbSZndDsNCiZndDsmIzMyOw0KJmd0OyYjMzI7U2hhd24s
JiMzMjtJJiMzMjtkb24mIzM5O3QmIzMyO2tub3cmIzMyO2lmJiMzMjtJJiMzMjt0eXBvZWQmIzMy
O215JiMzMjtvd24mIzMyO25hbWUmIzMyOyh3aGljaCYjMzI7aXMmIzMyO2FjdHVhbGx5DQomZ3Q7
JiMzMjtwb3NzaWJsZSwmIzMyO3NpbmNlDQomZ3Q7JiMzMjtJJiMzMjt3cml0ZSYjMzI7dGhlJiMz
Mjt0YWdzJiMzMjtieSYjMzI7aGFuZCksJiMzMjtvciYjMzI7d2hhdCYjMzI7YWN0dWFsbHkmIzMy
O2hhcHBlbmVkJiMzMjt0byYjMzI7bXkmIzMyO1Jldmlld2VkLQ0KJmd0OyYjMzI7YnkmIzMyO3Rh
Z3MmIzMyO29uDQomZ3Q7JiMzMjt0aGUmIzMyO2VudGlyZSYjMzI7c2VyaWVzLg0KJmd0OyYjMzI7
DQomZ3Q7JiMzMjtDYW4mIzMyO3lvdSYjMzI7cGxlYXNlJiMzMjtmaXgmIzMyO3RoZSYjMzI7dHlw
byYjMzI7aW4mIzMyO3RoZSYjMzI7dGFnJiM2MzsNCiZndDsmIzMyOw0KJmd0OyYjMzI7UmV2aWV3
ZWQtYnk6JiMzMjtBbmdlbG9HaW9hY2NoaW5vJiMzMjtEZWwmIzMyO1JlZ25vJiMzMjsmbHQ7DQom
Z3Q7JiMzMjthbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20mZ3Q7DQomZ3Q7
JiMzMjsNCiZndDsmIzMyO1VzZSYjMzI7dGhpcyYjMzI7b25lLCYjMzI7cGxlYXNlLg0KJmd0OyYj
MzI7DQoNClRoYW5rJiMzMjt5b3UmIzMyO2ZvciYjMzI7dGhlJiMzMjtyZW1pbmRlci4mIzMyO0Rp
ZG4mIzM5O3QmIzMyO25vdGljZSYjMzI7dGhhdCYjMzI7ZWl0aGVyLg0KU2luY2VzJiMzMjtJJiMz
MjthbHdheXMmIzMyO3VzZSYjMzI7YjQmIzMyO3Rvb2wmIzMyO3RvJiMzMjtkb3dubG9hZCYjMzI7
dGhlJiMzMjtwYXRjaGVzJiMzMjt0byYjMzI7cHJldmVudCYjMzI7aHVtYW4NCmVycm9yLCYjMzI7
dGhpcyYjMzI7Y291bGQmIzMyO2JlJiMzMjthJiMzMjt0eXBvLiYjMzI7Tm8mIzMyO3Byb2JsZW0s
JiMzMjtJJiMzMjt3aWxsJiMzMjtmaXgmIzMyO2l0JiMzMjtpbiYjMzI7dGhlJiMzMjtuZXh0DQp2
ZXJzaW9uLg0KDQpUaGFua3MmIzMyO2FuZCYjMzI7cmVnYXJkcywNClNoYXduDQoNCjwvcHJlPg0K
PC9wPjwvYm9keT48L2h0bWw+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioq
KioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioqKioqKioqKioN
ClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVk
aW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwg
cHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFw
cGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRo
ZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0
cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAo
aW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBp
cyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBu
b3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlIA0KdGhh
dCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0
aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVs
ZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0
dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29u
dGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3By
ZT48IS0tfS0tPg==

--__=_Part_Boundary_008_184550678.1426250047--

