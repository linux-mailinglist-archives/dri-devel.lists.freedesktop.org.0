Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED464979654
	for <lists+dri-devel@lfdr.de>; Sun, 15 Sep 2024 12:30:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4DBD10E061;
	Sun, 15 Sep 2024 10:30:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="RBbHb11K";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="n14gSQjo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8962E10E021
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Sep 2024 10:30:19 +0000 (UTC)
X-UUID: 7fa410ba734d11ef8b96093e013ec31c-20240915
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=n89RWrpaja5i9X+5KaUpCj1lBgrcNbPIK6udoEJy74I=; 
 b=RBbHb11Ka6pJtOYT5WduwdBdniJbPO9F2Ye6iOqfZ+Bwh8stMgHHnId0FMo0/FVIX8JuFkT5kxnggwEbemKrzmWva987gz8gWW0HJQPuqyTx5YC0JRKFm63DiJV2TVcGD/2udtsvcPbJ9cc8LeBmOWHs2nYellg0lBFtk+fa1Ss=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:215cc2b5-99c0-4091-9250-0b98cbe57947, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6dc6a47, CLOUDID:9f500ab7-8c4d-4743-b649-83c6f3b849d4,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
 l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7fa410ba734d11ef8b96093e013ec31c-20240915
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 339611838; Sun, 15 Sep 2024 18:30:16 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sun, 15 Sep 2024 18:30:15 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Sun, 15 Sep 2024 18:30:14 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pjt7/dug1/DMG/qeOk0gDR++BQnzb+zOqbpPGtRdhtTx0Rw11sJPcHll4gBDWf79ugJQDh9BNbpyVG5nqTcytkzBkcLDp7nNdH9XYlQxY2CGiSsZPUbKiq7kQpUkRHb7sL+tasCSoFdyOt63DoEvbCrkB1srTVDr+hDo9L3OtIHd94lZbOHxrzXxb06Yep3Cne5mnDvQ0gcwa5upRa0FmgEDtEAmoVUB8Bgr2mZyNUhvGojX7jkDC/ct7T2uSF7ACeLHZpHXTQ+6knomtVby+NzaGGAiRwzMBwTsHM4Vi3VA1GfiB0YueqMcsj/dLtanlWh+Rh+E6k9IYSeMqHkwYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s70zvr1i1uV430tlHc4XUzi+C/gGo1WkyNixy2bELLg=;
 b=Wlx5zOr8pUOFNdxRXjK2x82o9QA9AaRwBPfNr6+Y/PVPav/BmFMV4VEXOrTqThp4ONDV51Ai/DMz0R7hU/t6JpXc0eb5BUfD55UPq9bUq1NoRKJyButwqQwBnUAnltIBAso1RMnN7WNvqxZZSyQm0Ch4HjRbjTqnTxh1BHR3hztIvBzjPVBSvXLLuV4NjvPp+lbE3+Fci6r7rfN6KicttAQKMRNW/KNmn1Lh3tJKGDPOlZdA0Jp31J59Ovd7MvTRoB0R6iCCDjXqykyBISCAEVtFxsgWte4Af2eGo9NTzW1EiR/OGCJRtueGTgtM119xaaXcQqHEptZcvlPIk3ugAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s70zvr1i1uV430tlHc4XUzi+C/gGo1WkyNixy2bELLg=;
 b=n14gSQjop8UbcZ+kG52tDnfdm08/DYeugkli+hIxLKL1hQgTM5Ezza9rSMwfSI9X6fmdp1hIwl6WmdxY+yNS9eYdfNlJNEpTN6yeA9gEaM2zeErx/CaqyXyC/jO0v10nhD28qKEokAjY1a946N4zQI2CJLW8z9mmwCNEgXfv2yE=
Received: from SEYPR03MB6627.apcprd03.prod.outlook.com (2603:1096:101:82::5)
 by SEZPR03MB8016.apcprd03.prod.outlook.com (2603:1096:101:181::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Sun, 15 Sep
 2024 10:30:09 +0000
Received: from SEYPR03MB6627.apcprd03.prod.outlook.com
 ([fe80::587b:ac7c:f8aa:9220]) by SEYPR03MB6627.apcprd03.prod.outlook.com
 ([fe80::587b:ac7c:f8aa:9220%7]) with mapi id 15.20.7962.022; Sun, 15 Sep 2024
 10:30:09 +0000
From: =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>
To: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, 
 "alpernebiyasak@gmail.com" <alpernebiyasak@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "wenst@chromium.org" <wenst@chromium.org>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "shawn.sung@mediatek.corp-partner.google.com"
 <shawn.sung@mediatek.corp-partner.google.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>
Subject: Re: [PATCH v4 0/5] Support alpha blending in MTK display driver
Thread-Topic: [PATCH v4 0/5] Support alpha blending in MTK display driver
Thread-Index: AQHbBuPDCSlO4tZ8BUut6vTVhgd0GbJYprEA
Date: Sun, 15 Sep 2024 10:30:09 +0000
Message-ID: <e63ff4bc247f798d03d93979b15786e2246f29ee.camel@mediatek.com>
References: <20240717-alpha-blending-v4-0-4b1c806c0749@mediatek.com>
 <CAAOTY_8ThuusfHk9Gd5pFP8VhJkG2seuJmkFiruK1rPQFZGBzg@mail.gmail.com>
 <6c9b7f85-f92d-44ed-ae9d-00f6d55ea614@gmail.com>
 <a2cf4e9b9c3343a7398521760934f1740505aa13.camel@mediatek.com>
 <13f6dbc5d460e746352f68b001e85f870c89993d.camel@mediatek.com>
 <69776448-0328-4880-9108-54466e40ddd9@gmail.com>
 <01020191ea9dface-81c48f9d-4cf2-4f96-a1cd-59c11fa810ff-000000@eu-west-1.amazonses.com>
 <a34c16613f66b293b54eb6815c8bea80db08d885.camel@mediatek.com>
In-Reply-To: <a34c16613f66b293b54eb6815c8bea80db08d885.camel@mediatek.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB6627:EE_|SEZPR03MB8016:EE_
x-ms-office365-filtering-correlation-id: 42e32878-1e40-49fd-984e-08dcd5715f9b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|7416014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?d2pJSkw1Z3FOYUppY3lPOUEwSG1abGx3ZW1OaUlWampZbzdaRGtBcVQ0eWVk?=
 =?utf-8?B?UnJpWUNiUkl5WHJ2N1MxVUpuSE9Db3lHQ3l2ZGExeU1Tb2VJSGgxTHI2bHdG?=
 =?utf-8?B?Q0NFckNzQ0ZtOFl5M2dZWUlvM0xTVW1UbFhKQnB6MXlwdXgzVG1OTFV0WXor?=
 =?utf-8?B?TGY1ZUdpMUk1eWtvSTNhcVk1aHpPUHJkQ2tSNkVsMEJ4NmJDd1d5a1VGRFhl?=
 =?utf-8?B?Sjk3ZndRaFNOTjVvSEpaeUtqTkFPVlhiUDlUdFVVVjBKdjllZGNlQmtMeGJE?=
 =?utf-8?B?Y2lnendJbWFRcWhwaXdJUnJnVlV4Mm5nTURrYUgvRWN1RmNuUWZhbXFVTXVy?=
 =?utf-8?B?ZHRHT2pHbGcxV2d1R1JwOGpWVWN1SCtXcmsvRDJ4STJkQmZjQ3hocFpML3NI?=
 =?utf-8?B?RWk1bDhud2JrVlRMZEo2Q0NWdVNpM3YzVGtDK3BFaFpHcFBIdEpjVWY0Sklw?=
 =?utf-8?B?Y2JaVUlVMWJ4cVV5RGYxU1hya0U4czNDbGIrQytYc09nNSs1ZXRNbVNSWDV2?=
 =?utf-8?B?TlJxQitOeWZGU3M2SSs5RHRmek5aRytUazBPNzdrSDFSaUFGOVlVdno5WXdI?=
 =?utf-8?B?NG5qemxkWnE1NVc5OCtGMlJKbXNyQjhmNkxpVnlTS1pIQWhRUUxjZWYwcmFL?=
 =?utf-8?B?clpDYjZGOTBtbjJzMjBWbkNDZGowRkY5Tkk4QzhzRWZldEw3dzJSQXdvZWJX?=
 =?utf-8?B?eTN4cml1UW4rV0dYVUV0N2kvM1pjcmsxNVAwYkJJTVFaTnp0NTFNSHE0Z2dI?=
 =?utf-8?B?aENXM1lyaXBsMjlSTkZRZlN0aUVvam5kMzZPVWlCaUFCeElPbUhMbk9GdTll?=
 =?utf-8?B?QTNkdFpzQlpodHdXcnMvb053S2pFQ0xJYjlBME1XQ0xqK21IRkZ5dXBDMFNG?=
 =?utf-8?B?UUhZT0pGVTMzcVVrSEJkWERzcmZNc3RGb0RTcGJWK3ltM0JGQjVwSlBkY3JK?=
 =?utf-8?B?MFp4cytRTUJWSXl0R0tQakxjSmh6YmN6Y295SWtFOGlaUnJWREtTcGo3cDBl?=
 =?utf-8?B?MnNaMTZQRGN6YU5IcXRmSzZZallzbXVwUDlYZXd3c01OaXEyNDhKc1Jzd0Nx?=
 =?utf-8?B?VVJpbVlLQzUwTUtxa1dFQ1Q5ZEZOVldib0Z3d00rM1ZLb1JZbjUwZ1JlK1R0?=
 =?utf-8?B?dVpXN0pObElablp2NjFOL1NEalNoRXhUeTI4YVJyLzZCbVdJNFFmUXBiVFcv?=
 =?utf-8?B?SG9BeVBOK3pSWjdpNURMSEdQVThwaWk3RldUK1ErMTJZNlJDbnRlSC9pZlBk?=
 =?utf-8?B?ekxWRzI3bDBCVUxhZGV4VTFaNVRmRXN6UDF5N1VsL3Urc2ZpbG1YN3ZFeTkw?=
 =?utf-8?B?eDlaR0VaN251U09UTFBiU3NrdEp5U1FFQllnSHNvRGQ2cCtlNHl6K0k4OXkw?=
 =?utf-8?B?c2YwdlpjTTRYRkdVdGt4MXhjNDlQTmkvcDQ2LyttMmUvZFd2Q3ErMjE1UkE1?=
 =?utf-8?B?aFZpVFNwK2N2cXovQ3o4S1NNanRVbWdDaE9tS1J4Z0hvaWZ2ZUJjQzkyQzZi?=
 =?utf-8?B?aVJLNXA5bHhYZk1oejdSeFk0cmwrK2VZZlA3T3UrR21ET3ZaYTZUektEY093?=
 =?utf-8?B?V3VNdVdYd3B0V21sNngxZkJPSWJNZnhYdEVaZitoUkNYLytHNmxYZys4Lzg2?=
 =?utf-8?B?Y1l1TkxsZmlHTzljOXhiY1RUMW9ESHNaTzZyL3dCUjN6eG5CZkRwRXM1UE5s?=
 =?utf-8?B?eEVrWjdwSmNIRkhMRGJBUWJwUkNMOWJtRWxSK2NLaDk4MWpSZnFpSFhUSThS?=
 =?utf-8?B?ZTRhUzN6QU1kaDRCdkFEZVVPQW8zMmVUYnozZlNxYzRHY1QxZHJqdk14UHVz?=
 =?utf-8?B?SFhEREo1cC9KRFR0NXJkZz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB6627.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(7416014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QXlRS0tQYlg1djRwRFNNZXJWb1BRMy9GNDk3eWtSZkZzVVQxUWxvempGRHdl?=
 =?utf-8?B?dERud3RKTG5GSndoT2VTWDFDNjhrbWhXemZwLzJpMHlnVjJ5U1NETm51QXN1?=
 =?utf-8?B?MjRxWi9pUnlPZ0F4akQzY2pOOHNWb0VqNUhMT0s4Uk5ZcksxYk43dzFLaXAr?=
 =?utf-8?B?MkwwZFQ4VnhGWTNXWnltbEIrNE1Sc1RDMER6clBhZjMwcG5pTnBXQWpoMXIz?=
 =?utf-8?B?amxFK2dveWs2a0JMUm8wMkgrTTkrUExVNTZDb3NrblF3eDN4Nm1XaEN5cHlT?=
 =?utf-8?B?VWdadGU2L2VmbDJwanpFUXVNY1FMMFB0V1drdWxrSmg2SlQyWXNFUE5XQUc2?=
 =?utf-8?B?VHNxN0dORjRKeEZRZ3kvamIxa1lIZk1zNjhLcmFRUldMc1ZEQ1BlMXc5TnFv?=
 =?utf-8?B?eHNHekY5WUx4dkFScFV6NU9sNG40QXlDeXZ3UXNpaFIrWnI5M1FkK290aVdp?=
 =?utf-8?B?MWlNd2tLbWZkNm9pZFJ2bXNLcnJQZXcwcGI2cmp1VlV1ZjRsOWxDZFdFV1gy?=
 =?utf-8?B?UTZWbFI0OTliWkVwUkNsb3ppRHNtNlBDQmErZThsUmdmK0lJL1pyTXczRndF?=
 =?utf-8?B?QWdnQUNkOCtFR2hyWjFoRWNGTzBaZjZVL1puYUJYWStIRDRFenByb2NZekor?=
 =?utf-8?B?cEFzSjhWY2lTWjNzbmREemFJSHNWQ0NZM2RNeUlvYm92Z0Y0andGcm41d1dY?=
 =?utf-8?B?SUNYcWNIRmtGR2V6V0NXWW1uR3hjeGljK0pQYUYwWEdjYlFXSWJVNFFET3ox?=
 =?utf-8?B?R2ZFNFZ0SUpVbmRoSExjYVgvd01YQW9Zb3dvRkNEbkdpcUY0SGhpdTc5VkVS?=
 =?utf-8?B?ZkgydWQvRlIwank2a2VhNFBvNGt3RDJZNVp6UzFlSmJWRytTYm1RMmxjUlpF?=
 =?utf-8?B?TjdWWDQxcWxRY3ltNnRiVzU4OXMyeEhwQlhTTDBVRVRGQ2xqdFpuZFhOak05?=
 =?utf-8?B?UWN4cTdNTWhJRTVnY1ZBSzVMSjhZc1V2alorY0o0end2dTRmVGlXbmdyMWhU?=
 =?utf-8?B?RzZmakdMbk1YZEZlQm1pVDdXb2FWQjlkNEJYSGQ0K2tXTlJEKzRrcndtZW9z?=
 =?utf-8?B?SzJxSEhWQkZFZWhMaEprNkRxYVF4emkzMmhLVGc0ejE4b0tuWFdGcW5ld2l1?=
 =?utf-8?B?NFE1bUg2dWlUQ3B1d2R6SHFhYWcvSlZRRVp4Q1R0KzZCL0hxZDliUHRaL0tE?=
 =?utf-8?B?T01vOUxsK3J5anBlemFjRU01Q2ZLS1F6NW1VbGNJanlUNEZNYzJBZENscmhp?=
 =?utf-8?B?dWpkeVlYRlZ3WmdOU0N3S3NraC9oZmY5MnF6dTVMem15UzBQS1R6MFA2T05R?=
 =?utf-8?B?UnhKSVZqZEhFbGVNalN2cjZ2aWVoRXArNTkreE96WDUraS9hemQ5SzI0YTlK?=
 =?utf-8?B?bGJTbGhFS0xTWktwR3NMYmpSNGxMVjhnRFl1cURCSkYzc1NoTCtyQ0dQeW5E?=
 =?utf-8?B?Z3U5Sm9CMHJ3dU1WNnFkV2hFM01KTWUrRHdmS1dzSTdidXljSFpKQW1lcDFq?=
 =?utf-8?B?eC80VHkxaituRk93Mmx6MVhJbnhYMURiL2hJL0NXZGRMZVNLWXRNTjJVWUFm?=
 =?utf-8?B?Lys5eXpmR3ArZHF4SEl2VnBWTDVKV2o0aVdjQWZ4WHpCTEFCWDlEbldzZyt5?=
 =?utf-8?B?bE5CN0RrOWtJajIybFMvN3dNdkVKMmQxaFdJdyszNDhiZnlTcUFZRjlQMUdo?=
 =?utf-8?B?WDBLdXJwZDVzOS8rc0NOdUtpMEdTN3lWL3E0RTZYamVGNG5MckFhWUF5cWhP?=
 =?utf-8?B?VkdSUVNzWU1DVldJZnBXQktkSnRsSXd4RmxyOHRmUE1LTWR0OEx1NDl1Qlcy?=
 =?utf-8?B?dWwvZStlamJNUGdTSWI4ajA5UHJuY3ZKSFozNGhDVzJSM3ZyOGZ6T2RIdmdr?=
 =?utf-8?B?cmRJeVZtRGVYbFdmeHVyZUgzaWpsT0pmeWU4c3RiNDJ0bUs2QmpjcThHWGhZ?=
 =?utf-8?B?Y2NBM1NmRU5jS2ZmM0FDOUZoZGlvN3dVNEp1L3JnU2hOT21nSmFCaXhVM3d4?=
 =?utf-8?B?Ny8xdy8xMHA4TkhQdThjWVVtcWMvSlBzSTZlNXc5Q09ZRmppQWJtUlZzcDJK?=
 =?utf-8?B?STkvbTF6NzBEbnY4b1BTQ1BLam5vdzNFQ1NaYUVRdlJnZ0JUV3JidUhJOExH?=
 =?utf-8?B?cEZRUzlNYXhPaDhYQUlKRGQ1SXc3U1JkQkxCWFdtbDVZTTdiTW1OR3lZY0M3?=
 =?utf-8?B?d3c9PQ==?=
Content-ID: <C391C1FE176F6D4389E8B436D6C65756@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB6627.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42e32878-1e40-49fd-984e-08dcd5715f9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2024 10:30:09.1295 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8DxCJXJW4tX/88ZbMbvzMH5fJtWzSlP0DHJNBIKozrjEnFqnEYcFfFVrK9Werhx6SU5ry6BVedi+bqeCXT+dFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8016
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_002_200186572.180168454"
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

--__=_Part_Boundary_002_200186572.180168454
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGkgSmFzb24sDQoNCk9uIFNhdCwgMjAyNC0wOS0xNCBhdCAyMDoyMiArMDAwMCwgSmFzb24tSkgg
TGluICjmnpfnnb/npaUpIHdyb3RlOg0KPiBPbiBGcmksIDIwMjQtMDktMTMgYXQgMDk6MDEgKzAw
MDAsIEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIHdyb3RlOg0KPiA+IElsIDEzLzA5LzI0IDA3
OjQwLCBBbHBlciBOZWJpIFlhc2FrIGhhIHNjcml0dG86DQo+ID4gPiBIaSwNCj4gPiA+IA0KPiA+
ID4gT24gMjAyNC0wOS0xMyAwNTo1NiArMDM6MDAsIEphc29uLUpIIExpbiAo5p6X552/56WlKSB3
cm90ZToNCj4gPiA+ID4gSGkgQWxwZXIsDQo+ID4gPiA+IA0KPiA+ID4gPiBJIHRoaW5rIHRoYXQn
cyBhIHBsYXRmb3JtIGlzc3VlIGJlY2F1c2UgaXQgd29ya3MgZmluZCBpbiBteQ0KPiA+ID4gPiBN
VDgxODgNCj4gPiA+ID4gcGxhdGZvcm0sIGJ1dCBJIGRvbid0IGhhdmUgYW55IE1UODE3MyBwbGF0
Zm9ybS4NCj4gPiA+ID4gDQo+ID4gPiA+IENhbiB5b3UgaGVscCBtZSB0ZXN0IHRoZSBmaXggcGF0
Y2ggaW4geW91ciBNVDgxNzMgcGxhdGZvcm0/DQo+ID4gPiA+IEknbGwgcHJvdmlkZSBhIGZpeCBw
YXRjaCBpbiAyIHdlZWtzIHZpYSBHb29nbGUgQ2hhdC4NCj4gPiANCj4gPiBKYXNvbiwgVHdvIHdl
ZWtzIGlzIGEgYml0IHRvbyBsYXRlIGFzIENLIGFscmVhZHkgcGlja2VkIHlvdXINCj4gPiBzZXJp
ZXM6DQo+ID4gcmV2ZXJ0aW5nDQo+ID4gYW5kIHJlYXBwbHlpbmcgY3JlYXRlcyBub2lzZSBpbiB0
aGUgY29tbWl0IGxvZywgYW5kIHdoZW4gdGhpcyBjYW4NCj4gPiBiZQ0KPiA+IGF2b2lkZWQgaXQN
Cj4gPiBzaG91bGQgYmUgYXZvaWRlZC4NCj4gPiANCj4gPiBTaW5jZSB1cHN0cmVhbSBpcyBicm9r
ZW4sIHBsZWFzZSB1bmRlcnN0YW5kIHRoYXQgdGhpcyBmaXggc2hvdWxkIGJlDQo+ID4gZGV2ZWxv
cGVkDQo+ID4gd2l0aCAqaGlnaGVzdCogcHJpb3JpdHkgKHNvLCBhcyBpbW1lZGlhdGUgYXMgcG9z
c2libGUpLg0KPiA+IA0KPiANCj4gT0ssIEknbGwgc2VuZCB0aGUgZml4IHBhdGggcmlnaHQgYXdh
eSENCg0KSSBub3RpY2UgdGhhdCBJJ20gdW5hYmxlIHRvIHNlZSByZXBsaWVzIGZyb20gZXh0ZXJu
YWwgc291cmNlcy4gTm90IHN1cmUNCmlmIHRoaXMgaXMgcmVsYXRlZCB0byBCNCByZWxheSwgYnV0
IEkgd2FudGVkIHRvIGJyaW5nIHRoaXMgdG8geW91cg0KYXR0ZW50aW9uIGFzIGZlZWRiYWNrIHdo
aWxlIHlvdSBtYXkgd2FudCB0byBjb25zaWRlciBzZW5kaW5nIHRoZQ0KcGF0Y2hlcyB3aXRoIEI0
IHJlbGF5IGFzIHdlbGwuDQoNClJlZ2FyZHMsDQpTaGF3bg0KDQo=

--__=_Part_Boundary_002_200186572.180168454
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGkmIzMyO0phc29uLA0KDQpPbiYjMzI7U2F0LCYjMzI7
MjAyNC0wOS0xNCYjMzI7YXQmIzMyOzIwOjIyJiMzMjsrMDAwMCwmIzMyO0phc29uLUpIJiMzMjtM
aW4mIzMyOygmIzI2NTE5OyYjMzA1OTE7JiMzMTA3NzspJiMzMjt3cm90ZToNCiZndDsmIzMyO09u
JiMzMjtGcmksJiMzMjsyMDI0LTA5LTEzJiMzMjthdCYjMzI7MDk6MDEmIzMyOyswMDAwLCYjMzI7
QW5nZWxvR2lvYWNjaGlubyYjMzI7RGVsJiMzMjtSZWdubyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjsm
Z3Q7JiMzMjtJbCYjMzI7MTMvMDkvMjQmIzMyOzA3OjQwLCYjMzI7QWxwZXImIzMyO05lYmkmIzMy
O1lhc2FrJiMzMjtoYSYjMzI7c2NyaXR0bzoNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyO0hp
LA0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMz
MjtPbiYjMzI7MjAyNC0wOS0xMyYjMzI7MDU6NTYmIzMyOyswMzowMCwmIzMyO0phc29uLUpIJiMz
MjtMaW4mIzMyOygmIzI2NTE5OyYjMzA1OTE7JiMzMTA3NzspJiMzMjt3cm90ZToNCiZndDsmIzMy
OyZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyO0hpJiMzMjtBbHBlciwNCiZndDsmIzMyOyZndDsm
IzMyOyZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYj
MzI7SSYjMzI7dGhpbmsmIzMyO3RoYXQmIzM5O3MmIzMyO2EmIzMyO3BsYXRmb3JtJiMzMjtpc3N1
ZSYjMzI7YmVjYXVzZSYjMzI7aXQmIzMyO3dvcmtzJiMzMjtmaW5kJiMzMjtpbiYjMzI7bXkNCiZn
dDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyO01UODE4OA0KJmd0OyYjMzI7Jmd0OyYj
MzI7Jmd0OyYjMzI7Jmd0OyYjMzI7cGxhdGZvcm0sJiMzMjtidXQmIzMyO0kmIzMyO2RvbiYjMzk7
dCYjMzI7aGF2ZSYjMzI7YW55JiMzMjtNVDgxNzMmIzMyO3BsYXRmb3JtLg0KJmd0OyYjMzI7Jmd0
OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7
JiMzMjtDYW4mIzMyO3lvdSYjMzI7aGVscCYjMzI7bWUmIzMyO3Rlc3QmIzMyO3RoZSYjMzI7Zml4
JiMzMjtwYXRjaCYjMzI7aW4mIzMyO3lvdXImIzMyO01UODE3MyYjMzI7cGxhdGZvcm0mIzYzOw0K
Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7SSYjMzk7bGwmIzMyO3Byb3ZpZGUm
IzMyO2EmIzMyO2ZpeCYjMzI7cGF0Y2gmIzMyO2luJiMzMjsyJiMzMjt3ZWVrcyYjMzI7dmlhJiMz
MjtHb29nbGUmIzMyO0NoYXQuDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMy
O0phc29uLCYjMzI7VHdvJiMzMjt3ZWVrcyYjMzI7aXMmIzMyO2EmIzMyO2JpdCYjMzI7dG9vJiMz
MjtsYXRlJiMzMjthcyYjMzI7Q0smIzMyO2FscmVhZHkmIzMyO3BpY2tlZCYjMzI7eW91cg0KJmd0
OyYjMzI7Jmd0OyYjMzI7c2VyaWVzOg0KJmd0OyYjMzI7Jmd0OyYjMzI7cmV2ZXJ0aW5nDQomZ3Q7
JiMzMjsmZ3Q7JiMzMjthbmQmIzMyO3JlYXBwbHlpbmcmIzMyO2NyZWF0ZXMmIzMyO25vaXNlJiMz
MjtpbiYjMzI7dGhlJiMzMjtjb21taXQmIzMyO2xvZywmIzMyO2FuZCYjMzI7d2hlbiYjMzI7dGhp
cyYjMzI7Y2FuDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtiZQ0KJmd0OyYjMzI7Jmd0OyYjMzI7YXZvaWRl
ZCYjMzI7aXQNCiZndDsmIzMyOyZndDsmIzMyO3Nob3VsZCYjMzI7YmUmIzMyO2F2b2lkZWQuDQom
Z3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyO1NpbmNlJiMzMjt1cHN0cmVhbSYj
MzI7aXMmIzMyO2Jyb2tlbiwmIzMyO3BsZWFzZSYjMzI7dW5kZXJzdGFuZCYjMzI7dGhhdCYjMzI7
dGhpcyYjMzI7Zml4JiMzMjtzaG91bGQmIzMyO2JlDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtkZXZlbG9w
ZWQNCiZndDsmIzMyOyZndDsmIzMyO3dpdGgmIzMyOypoaWdoZXN0KiYjMzI7cHJpb3JpdHkmIzMy
OyhzbywmIzMyO2FzJiMzMjtpbW1lZGlhdGUmIzMyO2FzJiMzMjtwb3NzaWJsZSkuDQomZ3Q7JiMz
MjsmZ3Q7JiMzMjsNCiZndDsmIzMyOw0KJmd0OyYjMzI7T0ssJiMzMjtJJiMzOTtsbCYjMzI7c2Vu
ZCYjMzI7dGhlJiMzMjtmaXgmIzMyO3BhdGgmIzMyO3JpZ2h0JiMzMjthd2F5IQ0KDQpJJiMzMjtu
b3RpY2UmIzMyO3RoYXQmIzMyO0kmIzM5O20mIzMyO3VuYWJsZSYjMzI7dG8mIzMyO3NlZSYjMzI7
cmVwbGllcyYjMzI7ZnJvbSYjMzI7ZXh0ZXJuYWwmIzMyO3NvdXJjZXMuJiMzMjtOb3QmIzMyO3N1
cmUNCmlmJiMzMjt0aGlzJiMzMjtpcyYjMzI7cmVsYXRlZCYjMzI7dG8mIzMyO0I0JiMzMjtyZWxh
eSwmIzMyO2J1dCYjMzI7SSYjMzI7d2FudGVkJiMzMjt0byYjMzI7YnJpbmcmIzMyO3RoaXMmIzMy
O3RvJiMzMjt5b3VyDQphdHRlbnRpb24mIzMyO2FzJiMzMjtmZWVkYmFjayYjMzI7d2hpbGUmIzMy
O3lvdSYjMzI7bWF5JiMzMjt3YW50JiMzMjt0byYjMzI7Y29uc2lkZXImIzMyO3NlbmRpbmcmIzMy
O3RoZQ0KcGF0Y2hlcyYjMzI7d2l0aCYjMzI7QjQmIzMyO3JlbGF5JiMzMjthcyYjMzI7d2VsbC4N
Cg0KUmVnYXJkcywNClNoYXduDQoNCg0KPC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlw
ZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFs
aXR5IE5vdGljZSAqKioqKioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5l
ZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1h
eSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UN
CmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRl
bmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMp
LiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFp
bmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVu
dHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5k
IG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQg
b2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUgDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMg
ZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAo
YnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9m
IA0KdGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0
ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFu
eSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_002_200186572.180168454--

