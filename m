Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E21778BDAEC
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 07:58:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C14910EA53;
	Tue,  7 May 2024 05:58:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="ePTCWT6v";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="rRF3ASU/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B14710EA53
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 05:58:31 +0000 (UTC)
X-UUID: d16102240c3611ef8065b7b53f7091ad-20240507
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=F/fWH4JYAgiCTBXorouOPiyQEEv8HhTnYDy+I577rZA=; 
 b=ePTCWT6vm/AvIItM4POwTXNwtIJjF3Y8C/ba8KmomvziYFhosX3gHc4pTK0KtvcjadB/WrJ2RtVkJjtHrsoAOwscwTmfTvucjryJOhrCwC1wOD/+VllJ8uxaV94RMcsg5gE0vJ2sqUmjboVjt5W8d/bJJXKUDgZgVyFCodJan10=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38, REQID:26ddbf7f-277d-44af-889f-f9f332bf657d, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:82c5f88, CLOUDID:45400a87-8d4f-477b-89d2-1e3bdbef96d1,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: d16102240c3611ef8065b7b53f7091ad-20240507
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 187362386; Tue, 07 May 2024 13:58:25 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 7 May 2024 13:58:24 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Tue, 7 May 2024 13:58:23 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hay1bHFErgqADoz3pjFdZ49TnFlXMbcaAEdw2krQLwoo6VQCD+HmVQKuzSNrS8L7qq0JHTL12c2dzaGZhpQRPt5t02IYDOd4oPHUTlIfr8i+/jitKBuvIU+XNvbsXqDuc4PGeF2O8/IDMqvxFRxfuSi8vWfIWMldQF28rsFydtISWUpTKQsdE25Nd3Grsmth4l/lMaeD7/2L54ixs+Bq5NL7rn+qogUHOThrSilWoKh0fPjrbZRS7OZPBvsyf9TqC7ym6sAiiMXaBPneT+vw4Kby0Wy3LZe72aoBh++PttyQqLAE/kp7aTh2+PTHX3j6B62Z19fUJVW06lNwxtHhFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4pZr6nmnFBBIqQDkvpe/ZHO+ydBrN4fkb9MewcTQ8fo=;
 b=GDa1WKoBSthlU/i3kpZLTn6Ry3SBQMkM0i3JCKy6Ww2vhoF0Obpx17CsNnAF7wry0yQa0zyvbMbsEk1KOer0ZN+GNcS7NDqoFxlf84uqdAOOpV/Bqg+CGYXmxwrx2XWXsQhxeQ+3CBOaLbEaVhnBSVo26urUMA1ykzuFoFK/MszZLkvK66SqME4nz+oZ1VDV6NJoQiUR7sPU15rC/j8tau63QNeY9I9XGn1gBUNLZkVpn7Kgdli4KnJLcFZITr5Q58dZ9qRSQ+dch6wWaiCle5GEcF4CVgVgraJ/ZMS07J//VoBRWOhTy1LaB8jMFDlYOFx0vaCYPDVNQ5MjKpQSBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4pZr6nmnFBBIqQDkvpe/ZHO+ydBrN4fkb9MewcTQ8fo=;
 b=rRF3ASU/P1FCrFLP48/9BfTAGGqNFAugZ+lJsxtw3895bg5R4KxcOMdPy07eQy1LSUGkvX/XrVckPa9fDZS3srjX4J6uWvf4nqEPqpaDQpWISIle5mXf8yeC/VWZ2HR84VjUOeaQWswrtknwxtOynRGFmdi4Y7emObE52KFTD6U=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYSPR03MB8991.apcprd03.prod.outlook.com (2603:1096:405:ca::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Tue, 7 May
 2024 05:58:19 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.7544.041; Tue, 7 May 2024
 05:58:19 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?utf-8?B?QmliYnkgSHNpZWggKOisnea/n+mBoCk=?= <Bibby.Hsieh@mediatek.com>,
 "jason-ch.chen@mediatek.corp-partner.google.com"
 <jason-ch.chen@mediatek.corp-partner.google.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "sean@poorly.run" <sean@poorly.run>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v7 01/18] soc: mediatek: Disable 9-bit alpha in ETHDR
Thread-Topic: [PATCH v7 01/18] soc: mediatek: Disable 9-bit alpha in ETHDR
Thread-Index: AQHanH0GhzqyDqXQBkatrz9vHxyWrLGLTiMA
Date: Tue, 7 May 2024 05:58:19 +0000
Message-ID: <47908b0befd1e61c4024d6f871b97c9c11e4c0be.camel@mediatek.com>
References: <20240502103848.5845-1-shawn.sung@mediatek.com>
 <20240502103848.5845-2-shawn.sung@mediatek.com>
In-Reply-To: <20240502103848.5845-2-shawn.sung@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYSPR03MB8991:EE_
x-ms-office365-filtering-correlation-id: 0c456d26-a9a2-4b88-0d93-08dc6e5ab1fd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|366007|1800799015|7416005|376005|38070700009; 
x-microsoft-antispam-message-info: =?utf-8?B?a3VvdmhFbmFtaS8yYSswL0FmSUx3YStUVy9uMmZRRUNLaGFOaGp0ZHg5R2d2?=
 =?utf-8?B?aGZTZU00Z0NHQVJKTk5xb3dpN0cyb25mdEFDZlVoOGNtT1VSSUJKWUpoUEpV?=
 =?utf-8?B?aEIwazJPdm5JdE13TUxrcWNudjg1RE9UMGREdDBNMjdIbVVMV2VmMUx5Qi9o?=
 =?utf-8?B?VGVuaWtxMUFwWERlK3ZqYzJNTXNxV3VhTzVYbTJWYWp6Y3hkN2VENWhaMHRO?=
 =?utf-8?B?VnpSSFVFcWtQNnAvd1UrS0liamNRMWpsVWYrWkNPOTBCbnl5amwwNG9mcHJz?=
 =?utf-8?B?R01NNkZmM0pNS2N3ZThKSk5nZmc4ZzZaRFdja3BWZzlBeXZpQTZDQXJlNWtC?=
 =?utf-8?B?Q3YrT0N5WnhkVWtNYXBYQjdGUTBhQmk3ZWsvWUZjM0d0TTNMMWF4Z2F4ZnVa?=
 =?utf-8?B?VEJFMkJqR05yTlR6Y0pQTWN0OUlWSml1ZzhFS0RVdHhuQklMaDY2bkdvMGxM?=
 =?utf-8?B?c0VjLzhmYTJaWkdTemRGc0lsOFg3T1pKR1libEltOXZ4ZzZFQWhSWjlUM0Jm?=
 =?utf-8?B?MW16eFZNVGF5dHBHTlNxUldqbGFSVEdkemFVTXJ3RUh6QkZDanRxNVRyWXlT?=
 =?utf-8?B?bUh4Ykdyekp0ZFViY1FEWkQxZitFQjVYVGJxTEdQSGhqY2hyMVdFdnhNVXdx?=
 =?utf-8?B?eVU3RVNFaVBROUV0NEZuUE5UVnlBSC90S1E1OG5YUHg2MG10U1grSEpiM0dP?=
 =?utf-8?B?dEtWOHNxeWFjQ2NhQVZ2S1VNUTd3TE9jcnNYa1hOcW1QZ3JISTMzY2Vpb3RT?=
 =?utf-8?B?REEzTVZmSEZ0azZSZGlBWTlNckE4UlNHZmNjbFArNGNqRDhUTWN1OStUNUgv?=
 =?utf-8?B?RlNVdEFCOXdTNzBvN2JSZDJzdm1iZTJ6WThxaE1zZE80QVdBZ2FUNit1WXMz?=
 =?utf-8?B?ZjdDbFBYcGtSdGZEMFo2WStOM2FFcENnbEhXOHdpM21oLzNuTXNsVlFZVnE5?=
 =?utf-8?B?YThDQWNDTDJyUyswM2MwbkNWR0tUQVZ3RGM3SWhHc3FUeGpYRXlMMkdpZmRT?=
 =?utf-8?B?Vmdab2MyRkZ5OXZ5bnFLOTAzRUNGblNUc3BaeXh5b3k5a09EeUI0RlNkMjI5?=
 =?utf-8?B?eDdGSWkvZ0U2Yk1Ha2NhL0llSkxidWV4aFV1cDczMml4Q1BjYTJ5RnUrcGNa?=
 =?utf-8?B?TzBINktsYmJwdGxzOHZ6ZW5hWk1vdVp2TENjVlRrbmpPU2NGZ2RsdUJCanBB?=
 =?utf-8?B?QlFuS2dDcjJKQ2ZxeWZoQXN3QVYzMldvU25peFBQbHBRdnFKT05TeDlWMzls?=
 =?utf-8?B?RG5nd1Fnc2xrSCsrNjMzakk4NGtrRlphR2NCQTNaT2g4NnZCOTdZWWxTUEQv?=
 =?utf-8?B?RmtmYTZENjZZUUQrbjd5cnc2UDZQcUJ4aVQweDk2Zi82WEIwN3BCcUhOTmJK?=
 =?utf-8?B?SXlobk42elhmQmRXRE5BTmFjb2QyUVNSSlZiT3dneTVseTFMRXJUeklVamdD?=
 =?utf-8?B?TFZuNXpQc0hmKzA1UnJsbFg5eUEzZWVxYitVWEdJMXI1Skx4aTBZOE4xYUN6?=
 =?utf-8?B?aUJ1d2NZenRENUVnTlBQM0JuL3lPOEg4RUZGL2hHbVdDaFo4SFI4M3lEK2E5?=
 =?utf-8?B?RnN3UFpYZ1ZvMUIxYi9iVzM1NGUyaTNwMkxZMnprNGNjVWdlemk0ZHp5WkFC?=
 =?utf-8?B?dmNJYzFNM0I2UklPcnpPczVBakgvQVozWUdYTWdLMzROb1pTb0EydnpYZVpB?=
 =?utf-8?B?WHlUOGlxVWRSbis1WnhwVDZLY293TUI2cWlHTERKK05KcmFjTHd4ZWczbFFn?=
 =?utf-8?B?N1VLaHp3MmcrdlBQVjVMeXZUcGdFNVFQZkRxV2RHY1o1SkVBOXBTNVphT21l?=
 =?utf-8?B?eTNSSGpVc2c4M3hBTUQwZz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(7416005)(376005)(38070700009); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NDRueC9iMHptTFhvOWY2c2x4dkJKNHlraklIM0JyUmNYWkdlVmN0YlBocWcy?=
 =?utf-8?B?K2dwWlpITGlqMjNsamgxS3pPbVhkcnhLMzBHcDVCczRCckhuM2pMb2g2YjBK?=
 =?utf-8?B?dXVGSTJhb0d4TnhrTTlNcldWbzFGaVh0cmpIWGpTekduZ1d3MU96K0h5SXhh?=
 =?utf-8?B?czNRdUNVVmZ2Qi94U1lBRDF5cGhjQ2tVOGtMOWhpOEFrekdhbHhoRVk3elg3?=
 =?utf-8?B?QW1RNXoxY3VhYVV5UWwzb0VWS2FyU2RVdGJhV00ybDUzV0E5OWZGMFBjYlpS?=
 =?utf-8?B?ZlBGM3VRSmw5WGZwaEVhWDVSTFJZNkoreVpaV01VZSttQ29lRW5abWpoUVNa?=
 =?utf-8?B?YU9pMkl3ZWJEd2dxR1lIQVFhdmVPMERqaU4vajMyRW56UkVUWU1RL1VpbGh5?=
 =?utf-8?B?ZHZqTGc3QXlpVThvZG53NlVyTnVqNTJNUzk5U1IvTFFEOVNqSURhZFpJbFpR?=
 =?utf-8?B?RHdqeWVwcnNJVW44ZXp2QTYwWG5CMGtyODNpakhqZTNCKzdUOVlCOGI1RWh3?=
 =?utf-8?B?Vk5tSjdVcXQwL3Z6bHNibEwrbWkrdkVydFVjNkRGL2tNNXdZa3JRcU41OTF6?=
 =?utf-8?B?bGUxT3FGVXRRb0I3UGp5alFqQjhuRVpvWTR2WEMySDUzMHpSUFVQWmsyVDFB?=
 =?utf-8?B?Q2NVZDVLWW1NdC9XWE5iaVNGL1JPQmFraHZoNVdvQWFCR3lJYi9QejNBUXEr?=
 =?utf-8?B?RGtETDh3UlJUMTRRNlRMVjJKK0M0Rmh6cUJ2d1liMW1rdU0yTCtTZDVPV3Ux?=
 =?utf-8?B?MlIzYWRYaWFmRU55ZFJZRlJ2Szk0ZXhOdVZsNXdWMkFhS1pyZ0hEMFp1VGQr?=
 =?utf-8?B?S0Q3YzJCd2lmZjNnNGUrbkNQaVFUQ0toYlo1aGtMYStIcExIZ2VFKzEweE9t?=
 =?utf-8?B?dWV3ejhxQkY5dG54SlkrcVdXbEpHOVh6ZHdWZ3ZZZXppTHVQRG0vWWRSSENt?=
 =?utf-8?B?dkFVdzg1SkdRQVNmYlIyR3MxdThLbWFhNmc1a09JR3Z4VjIxdDhnYjZXOExn?=
 =?utf-8?B?c3VGUUVDMjI4ZTR0Z1BpMGpkVi9WRGoydE96L214b2l0bUdhT3VMUTUwYm81?=
 =?utf-8?B?ZFRpWm9UQk8rS1RCVmg4UEtMcEhxWC8za24yNXZWa0lnd2tZa0VFY3dzK1Jz?=
 =?utf-8?B?cWNKZFVhazkwM2lFaExJcElyazNMcmRFOEJqcktCbEY4d2JCYSswL0pJK3VI?=
 =?utf-8?B?bnFmTTBXZEl1K2FwdkIyaTU1ZmF5dXlLa0RxNW9WTk1IVmlHdjhvRFZuU3Vi?=
 =?utf-8?B?QXpEVU1INTVadFhnaWl4YkFGajdHMGRNMmgwMForMEUzcCsrVXp5TWxqN3FD?=
 =?utf-8?B?MEg4bGlpN0FwNVQ3MnR4S2JsM3UvdGVtbzZMUllTZktYSVFSU3lKdHRVUGVS?=
 =?utf-8?B?RWNiRkZHaTZqeDRnME14VWdRdFd2eCtqbEF6T2NtQmdPdDNsWHJycEdyTXFM?=
 =?utf-8?B?UUhXcU80MnQ0N1VwWGVGSU9JRGVtZmh5bnpLMnNId1hERkZONDZVRG8rQ0VO?=
 =?utf-8?B?WDRDcnlEK3FxSzNpMmk3NUNTa2x4QkRnVXU5Wm9mRmp5RU1HS1EwRUZhWUt4?=
 =?utf-8?B?SU1ITEtUL3JXTnhlbGQxODVvdFFVd1NFTi9FdkJSZ05QMEJ3M3JyMlVUU3Bx?=
 =?utf-8?B?N3hsZmQydVFKOTM2VnM1aFRTNU5icWhnM0sxcTN6WFY5SkN3a2VUTkt1VFlF?=
 =?utf-8?B?RDVMQ1hHNWhmc1dDdklYUmdZM0J1SGlCVmVOTGtuRWdaUkZkcVFDWFhpTU41?=
 =?utf-8?B?VVpmNmZzdGZmUHhqTWg5VXpPMlBJSnZoSmpDOW9kclVJaWNXMWFDVE5UbE4v?=
 =?utf-8?B?aGxWKytMb2NaWmt0TnFwN3hNOTNsMkRCaUxzRzFMZFVNWGFzV3dCTjN4Ky9l?=
 =?utf-8?B?VEhNS2t5UzBKYlhpeE5iUEpWMlNtcXo0MElxYk9MT3B0RGR6QWc5dmdRUEh3?=
 =?utf-8?B?dXQwUlMvTE5OYUNuVFBPdlhSQ1N6NW82WmltTFh1ZCtwSHl3WnlIS0U0eW83?=
 =?utf-8?B?MkRSR2YrM2lLZjNyRzdkbktPbEM4VXdhenBJVG1uU2NBQk0yeTIwU0xucjVW?=
 =?utf-8?B?M1VGZ0F6N1prcm9PZ1dqWlQ4VG5JbitZd2JuZ2NRMnN0V2hTQzgyZkkwKzJi?=
 =?utf-8?Q?fe0BR9n7A74hgmzb9UMQBWENT?=
Content-ID: <02965D5ECC638C4C9A9616499DEFB8CC@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c456d26-a9a2-4b88-0d93-08dc6e5ab1fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2024 05:58:19.1986 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F093V/ITrFZE/6WRkyU74565Tf87cd744MCWquJvckCBzfYO/8d8nPQ4jKeBTy+rSz6Tjz2/FSsmcV0Jivswag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8991
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_006_1861409609.1483635465"
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

--__=_Part_Boundary_006_1861409609.1483635465
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFNoYXduOg0KDQpPbiBUaHUsIDIwMjQtMDUtMDIgYXQgMTg6MzggKzA4MDAsIFNoYXduIFN1
bmcgd3JvdGU6DQo+IEZyb206IEhzaWFvIENoaWVuIFN1bmcgPHNoYXduLnN1bmdAbWVkaWF0ZWsu
Y29tPg0KPiANCj4gRVRIRFIgOS1iaXQgYWxwaGEgc2hvdWxkIGJlIGRpc2FibGVkIGJ5IGRlZmF1
bHQsDQo+IG90aGVyd2lzZSBhbHBoYSBibGVuZGluZyB3aWxsIG5vdCB3b3JrLg0KDQpQbGVhc2Ug
ZXhwbGFpbiB3aGF0IGlzIDktYml0IGFscGhhLiBJcyBBUkdCODg4OCA4LWJpdCBhbHBoYT8gSSBk
b24ndA0Ka25vdyB0aGVyZSBhcmUgOS1iaXQgYWxwaGEuIEkgd291bGQgbGlrZSB0byBrbm93IHdo
aWNoIGZ1bmN0aW9uIHdvdWxkDQpiZSBkaXNhYmxlZCB3aGVuIHlvdSBkaXNhYmxlIDktYml0IGFs
cGhhLg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiANCj4gUmV2aWV3ZWQtYnk6IEFuZ2Vsb0dpb2FjY2hp
bm8gRGVsIFJlZ25vIDwNCj4gYW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29t
Pg0KPiBTaWduZWQtb2ZmLWJ5OiBIc2lhbyBDaGllbiBTdW5nIDxzaGF3bi5zdW5nQG1lZGlhdGVr
LmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstbW1zeXMuYyB8IDEgKw0K
PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmMNCj4gYi9kcml2ZXJzL3NvYy9tZWRpYXRlay9t
dGstbW1zeXMuYw0KPiBpbmRleCBmMzcwZjRlYzRiODg4Li45MzgyNDA3MTRlNTRjIDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstbW1zeXMuYw0KPiArKysgYi9kcml2ZXJz
L3NvYy9tZWRpYXRlay9tdGstbW1zeXMuYw0KPiBAQCAtMjM2LDYgKzIzNiw3IEBAIHZvaWQgbXRr
X21tc3lzX21peGVyX2luX2NvbmZpZyhzdHJ1Y3QgZGV2aWNlDQo+ICpkZXYsIGludCBpZHgsIGJv
b2wgYWxwaGFfc2VsLCB1MTYNCj4gIA0KPiAgCW10a19tbXN5c191cGRhdGVfYml0cyhtbXN5cywg
TVQ4MTk1X1ZETzFfTUlYRVJfSU4xX0FMUEhBICsgKGlkeA0KPiAtIDEpICogNCwgfjAsDQo+ICAJ
CQkgICAgICBhbHBoYSA8PCAxNiB8IGFscGhhLCBjbWRxX3BrdCk7DQo+ICsJbXRrX21tc3lzX3Vw
ZGF0ZV9iaXRzKG1tc3lzLCBNVDgxOTVfVkRPMV9IRFJfVE9QX0NGRywgQklUKDE1ICsNCj4gaWR4
KSwgMCwgY21kcV9wa3QpOw0KPiAgCW10a19tbXN5c191cGRhdGVfYml0cyhtbXN5cywgTVQ4MTk1
X1ZETzFfSERSX1RPUF9DRkcsIEJJVCgxOSArDQo+IGlkeCksDQo+ICAJCQkgICAgICBhbHBoYV9z
ZWwgPDwgKDE5ICsgaWR4KSwgY21kcV9wa3QpOw0KPiAgCW10a19tbXN5c191cGRhdGVfYml0cyht
bXN5cywgTVQ4MTk1X1ZETzFfTUlYRVJfSU4xX1BBRCArIChpZHggLQ0KPiAxKSAqIDQsDQo=

--__=_Part_Boundary_006_1861409609.1483635465
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtTaGF3bjoNCg0KT24mIzMyO1RodSwmIzMy
OzIwMjQtMDUtMDImIzMyO2F0JiMzMjsxODozOCYjMzI7KzA4MDAsJiMzMjtTaGF3biYjMzI7U3Vu
ZyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtGcm9tOiYjMzI7SHNpYW8mIzMyO0NoaWVuJiMzMjtTdW5n
JiMzMjsmbHQ7c2hhd24uc3VuZ0BtZWRpYXRlay5jb20mZ3Q7DQomZ3Q7JiMzMjsNCiZndDsmIzMy
O0VUSERSJiMzMjs5LWJpdCYjMzI7YWxwaGEmIzMyO3Nob3VsZCYjMzI7YmUmIzMyO2Rpc2FibGVk
JiMzMjtieSYjMzI7ZGVmYXVsdCwNCiZndDsmIzMyO290aGVyd2lzZSYjMzI7YWxwaGEmIzMyO2Js
ZW5kaW5nJiMzMjt3aWxsJiMzMjtub3QmIzMyO3dvcmsuDQoNClBsZWFzZSYjMzI7ZXhwbGFpbiYj
MzI7d2hhdCYjMzI7aXMmIzMyOzktYml0JiMzMjthbHBoYS4mIzMyO0lzJiMzMjtBUkdCODg4OCYj
MzI7OC1iaXQmIzMyO2FscGhhJiM2MzsmIzMyO0kmIzMyO2RvbiYjMzk7dA0Ka25vdyYjMzI7dGhl
cmUmIzMyO2FyZSYjMzI7OS1iaXQmIzMyO2FscGhhLiYjMzI7SSYjMzI7d291bGQmIzMyO2xpa2Um
IzMyO3RvJiMzMjtrbm93JiMzMjt3aGljaCYjMzI7ZnVuY3Rpb24mIzMyO3dvdWxkDQpiZSYjMzI7
ZGlzYWJsZWQmIzMyO3doZW4mIzMyO3lvdSYjMzI7ZGlzYWJsZSYjMzI7OS1iaXQmIzMyO2FscGhh
Lg0KDQpSZWdhcmRzLA0KQ0sNCg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtSZXZpZXdlZC1ieTomIzMy
O0FuZ2Vsb0dpb2FjY2hpbm8mIzMyO0RlbCYjMzI7UmVnbm8mIzMyOyZsdDsNCiZndDsmIzMyO2Fu
Z2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbSZndDsNCiZndDsmIzMyO1NpZ25l
ZC1vZmYtYnk6JiMzMjtIc2lhbyYjMzI7Q2hpZW4mIzMyO1N1bmcmIzMyOyZsdDtzaGF3bi5zdW5n
QG1lZGlhdGVrLmNvbSZndDsNCiZndDsmIzMyOy0tLQ0KJmd0OyYjMzI7JiMzMjtkcml2ZXJzL3Nv
Yy9tZWRpYXRlay9tdGstbW1zeXMuYyYjMzI7fCYjMzI7MSYjMzI7Kw0KJmd0OyYjMzI7JiMzMjsx
JiMzMjtmaWxlJiMzMjtjaGFuZ2VkLCYjMzI7MSYjMzI7aW5zZXJ0aW9uKCspDQomZ3Q7JiMzMjsN
CiZndDsmIzMyO2RpZmYmIzMyOy0tZ2l0JiMzMjthL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1t
bXN5cy5jDQomZ3Q7JiMzMjtiL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1tbXN5cy5jDQomZ3Q7
JiMzMjtpbmRleCYjMzI7ZjM3MGY0ZWM0Yjg4OC4uOTM4MjQwNzE0ZTU0YyYjMzI7MTAwNjQ0DQom
Z3Q7JiMzMjstLS0mIzMyO2EvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmMNCiZndDsm
IzMyOysrKyYjMzI7Yi9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstbW1zeXMuYw0KJmd0OyYjMzI7
QEAmIzMyOy0yMzYsNiYjMzI7KzIzNiw3JiMzMjtAQCYjMzI7dm9pZCYjMzI7bXRrX21tc3lzX21p
eGVyX2luX2NvbmZpZyhzdHJ1Y3QmIzMyO2RldmljZQ0KJmd0OyYjMzI7KmRldiwmIzMyO2ludCYj
MzI7aWR4LCYjMzI7Ym9vbCYjMzI7YWxwaGFfc2VsLCYjMzI7dTE2DQomZ3Q7JiMzMjsmIzMyOw0K
Jmd0OyYjMzI7JiMzMjttdGtfbW1zeXNfdXBkYXRlX2JpdHMobW1zeXMsJiMzMjtNVDgxOTVfVkRP
MV9NSVhFUl9JTjFfQUxQSEEmIzMyOysmIzMyOyhpZHgNCiZndDsmIzMyOy0mIzMyOzEpJiMzMjsq
JiMzMjs0LCYjMzI7JiMxMjY7MCwNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7YWxwaGEmIzMyOyZsdDsmbHQ7JiMzMjsxNiYjMzI7fCYjMzI7YWxwaGEsJiMzMjtj
bWRxX3BrdCk7DQomZ3Q7JiMzMjsrbXRrX21tc3lzX3VwZGF0ZV9iaXRzKG1tc3lzLCYjMzI7TVQ4
MTk1X1ZETzFfSERSX1RPUF9DRkcsJiMzMjtCSVQoMTUmIzMyOysNCiZndDsmIzMyO2lkeCksJiMz
MjswLCYjMzI7Y21kcV9wa3QpOw0KJmd0OyYjMzI7JiMzMjttdGtfbW1zeXNfdXBkYXRlX2JpdHMo
bW1zeXMsJiMzMjtNVDgxOTVfVkRPMV9IRFJfVE9QX0NGRywmIzMyO0JJVCgxOSYjMzI7Kw0KJmd0
OyYjMzI7aWR4KSwNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
YWxwaGFfc2VsJiMzMjsmbHQ7Jmx0OyYjMzI7KDE5JiMzMjsrJiMzMjtpZHgpLCYjMzI7Y21kcV9w
a3QpOw0KJmd0OyYjMzI7JiMzMjttdGtfbW1zeXNfdXBkYXRlX2JpdHMobW1zeXMsJiMzMjtNVDgx
OTVfVkRPMV9NSVhFUl9JTjFfUEFEJiMzMjsrJiMzMjsoaWR4JiMzMjstDQomZ3Q7JiMzMjsxKSYj
MzI7KiYjMzI7NCwNCg0KPC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlwZTp0ZXh0LS0+
PCEtLXstLT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGlj
ZSAqKioqKioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlz
IGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25m
aWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBm
cm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBi
ZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNl
LCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBj
b3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVu
aW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJl
IHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBl
LW1haWwsIG9yIGJlbGlldmUgDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGlu
IGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlp
bmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBl
LW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBk
byBub3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBw
ZXJzb24uIFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_006_1861409609.1483635465--

