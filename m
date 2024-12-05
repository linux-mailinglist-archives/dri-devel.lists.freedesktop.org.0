Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B87299E4C91
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 04:16:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21A7E10E0E3;
	Thu,  5 Dec 2024 03:16:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="J2hoGgt5";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="PUtB+azO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F20D10E0E3
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 03:16:37 +0000 (UTC)
X-UUID: 55035100b2b711efbd192953cf12861f-20241205
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=aEPUmbuGp0h1qcvoyDaPbNjAon6t17LEb2wWil61k4Y=; 
 b=J2hoGgt59gYj7rtF4pg3snljDwqH/hPTR5KyXae1T76SqsovFVVZ0upBuUN1+kEVep/3QJkZSCATRN6mBzoatP+15MPXVNXWnwOPbpYdtLrtCRjpkpPOdv+xEBFl45KUyTaumy+UPicRKJqkgjksI+iAttgOgoh3oWFKK4TFErk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45, REQID:279a4a7a-30ac-456f-9451-1d91787ca4ef, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6493067, CLOUDID:4bcef3f5-e524-4511-b681-7d630745cb54,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
 :-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
 ,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 55035100b2b711efbd192953cf12861f-20241205
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1218759384; Thu, 05 Dec 2024 11:16:34 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 5 Dec 2024 11:16:32 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Thu, 5 Dec 2024 11:16:32 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zNRFF0zExpw5ap+pzaqwPMwnFI6CyquAu+iTtSNNl9hgLBmVXJur0q6y5kaQ64VUdECLesoGrIu2bqrFFk/TyML0CyY+Qe9faTOt/ni2PVjKjp5cgEGUQA2SCbT6GSCepwynIZi/N/ecq/D/94lI6nCt+83GD05VEDzhLYn+NGiZMAfUpOWJRevXOmLZgOsOV+KExtqkjy5IbmjsN3XJNa5PHXjQ2qdf+Eqwmjy9OW1HvvAv2ZHwoYiHHLSwGZ5Hi0VM5QjYl4ZqUGtOxD1Zd5C90bsje6MPX/NXy54qE5W7IeffdVWclPGxpoiqhHosSuOhdUHhBJy8j8W1u4TW2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+tRpGmfHpJDORNOvyb0EV2Y/CWYPEJcTRhZSkK6yoqc=;
 b=nQRfOVxh2zCqqj07XdyVYEyR3p5G9IK+QH9sZCEQLxi/4lbENDXIWDTjGp2rcXb/BI/gq+P/lj2LFjTJVWHE1MVNyj3rdHb3h6FPLzOW95VSZTylWNKf7WgcXXFP1O0KEjF/OHzQMP+FsIfxQBYjEspGuSZNirimcxC/2Wy+l2HOVsHAoPKxyVxfwGcU16QniEvbBMlg2y7fXk7ANfX4q22MLM72XhnuiSAcLni3OsciJdM6HFeRVBEgf5vR4wh9KJUhSPs7sw+Ir8Tq+3UMlLQyO3ac6yYDbNXyfpZDiShIIQuUBwewJtjD4vsYC+Bun4Fvmikd6trDbxASfhmK/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+tRpGmfHpJDORNOvyb0EV2Y/CWYPEJcTRhZSkK6yoqc=;
 b=PUtB+azOC4YkNmYRa2ymIhShVDMu9b3IO4Wdrsk63VkLB/6v+h3wHxT9j0PYdtnsmlBktVUgiN2Q19mGozu35jONQzY/ihxLwPo435vttsGMCm4GGPGLmY/xgpF6KsfXiw7x+RIEXFDPlOP5qvECuDMW737QrtaEPqIURFYFMUQ=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB8382.apcprd03.prod.outlook.com (2603:1096:101:21f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.16; Thu, 5 Dec
 2024 03:16:30 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8207.014; Thu, 5 Dec 2024
 03:16:30 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "mripard@kernel.org" <mripard@kernel.org>, "kernel@collabora.com"
 <kernel@collabora.com>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>
Subject: Re: [PATCH v1 6/7] drm/mediatek: mtk_hdmi: Split driver and add
 common probe function
Thread-Topic: [PATCH v1 6/7] drm/mediatek: mtk_hdmi: Split driver and add
 common probe function
Thread-Index: AQHbO0pOdhPnCCfvPUeRqumGFBNh8LLXEZKA
Date: Thu, 5 Dec 2024 03:16:30 +0000
Message-ID: <b032782b60db4c3cf86ab9a50c18e1c0a315f68b.camel@mediatek.com>
References: <20241120124512.134278-1-angelogioacchino.delregno@collabora.com>
 <20241120124512.134278-7-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20241120124512.134278-7-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB8382:EE_
x-ms-office365-filtering-correlation-id: 5c378ea0-585a-489e-b1e5-08dd14db3699
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?ZXJkNDJGVEpBL2MvaW9jcmgvOWx0MTc3U0E0cjFxazgxaDdxSHAzSWQySXlU?=
 =?utf-8?B?YWpqaVZEWkRUR05oR2pqQisxOE5ZalhFQUc2NXVobFRrT2oySy8yTkhEMlZn?=
 =?utf-8?B?bHJqOEI0aVZrY25za1Q0RTJaQUpPMElSNW13eXFXWUN2cEpQcnJ4MVNUWXN5?=
 =?utf-8?B?YzJQMElXSmFzTk5qem8wVTlXWTBuRWNkYWpERDlvVFJSczkxNjRHUDJtSzhr?=
 =?utf-8?B?aTErZUkzd2p5K204bm90YlJ5b1hDdWdJUHBJY0prTTlDV2c5SUdaUnpFSU82?=
 =?utf-8?B?b1dNRXZVeStyYzdjVXNYdTJmRW0xRURFd0l6bU1MdzU3MmRjSjhkSGhrbW1H?=
 =?utf-8?B?bzAyeU11QloyMVB6RFh6dWh4M0xOdlNPazYwYTg2cnZDYWljREhBTzlVWjJU?=
 =?utf-8?B?bkZlK00rdFJzSU1PRnpjSzBEZTk5SjliOXgwaHZORWRsTTd0RDVEVjVnZ3Nx?=
 =?utf-8?B?cWdvOE0xTldrSUNleHk0cE5WaXdyeVJHV2Z1YVVBZnQrckFoN01xbncrL09V?=
 =?utf-8?B?Qk44djlaQXF0T0xYWlEzd1F5N0RKRHgyT2hkZnhXTnhGQ1pDcm5hSk53bkNp?=
 =?utf-8?B?MWRRT2MveVMrZmJ3MTZLOW9OMEFkd0xYajZCQWtMdVJSZDFtWDVNVFJuMlhi?=
 =?utf-8?B?Z0tUU2VaN1ZWU3M1cXY4SEhDV2dZSDdralBHUjRyV1lWNExCTkE1R2RpaW1X?=
 =?utf-8?B?SWlrR0Frb2djcERmbTNHTm5JTEoyTzZBdEtrQ0sxcWpOd2Y0UHNEZm9MeXJj?=
 =?utf-8?B?NytTK29Mck80RnVmV3VkZzJvOFArMFpkMGttVWdsVmVVQ0V6UVNxQlBtdTV5?=
 =?utf-8?B?NnJuWVJhYnpNck1ML0RvUEJWVjByZlVkYUZsN0JibXJ4NjN2VWVrTEIvSnF5?=
 =?utf-8?B?blROeTM1bHZ3bS82TWNRNDAzdS9pdVdzODNSY0c4OUxBTkl4cXpvK0lBczNF?=
 =?utf-8?B?Q0cybDFBSXU1Nm9IZC9wQkorMjd5Q2pvamIzaTdLbGNhL2c2UE80Y0U4ZjJU?=
 =?utf-8?B?VForREtIWXBqYkRUVjYwQTlMb1lyWmRydUxWNzVmSy9HR2ZwdlFmYlBLdkxx?=
 =?utf-8?B?dFFvdTJwbHBwUDdOTDNZTXBDNGdaZFhnZ1pwdkIxK1hNWVl1TVZNQW9ZUVAv?=
 =?utf-8?B?V3BsYTI4QlZiQnZxVzUvd0l0TmxReXBydElhOHdpTkZuWnFqY2Z2d1B0cDd1?=
 =?utf-8?B?NWdMYjlCb3prOWVkYTU2L0daK2t2L0F3WldaZHhjODlsV3FRdGtpV0x3RmZq?=
 =?utf-8?B?bjEvdkJrNDFibDRINXd6NWdUQm0vSmpJUENhLzRJNGxObys3L1dLRk95cDV0?=
 =?utf-8?B?eHE3UUJGOGtpeE1kb1FHTURXaG9zaW1QeUMyZ3BJT0ZaSWNqSFBrMGFoMW94?=
 =?utf-8?B?YXk2Zko1STdFd3pPSXB1cWV1UmlyQVhDMkkydjlDOFEyTURhYXdOU1NvcnJr?=
 =?utf-8?B?ZGxmVXdzS3phWjk2WmdIVXM2eFgxdDNqYkJ5WU42ZG1RcVJFa0tFUWhGeE9I?=
 =?utf-8?B?RElSMXA0TDkrM0c4dlZiVU5TSE5rdXNaMlZ5RGNtaFRNYjJOMmpXbnBUQWtk?=
 =?utf-8?B?cjlnWTFOT1VjZmhpS3lNUGtvQ2ZoRzhtaEVKT3pydE5meWJDRW5WRHNNNllr?=
 =?utf-8?B?VytUZDF2SkFtWWMvTjRyNVJqbzhYUVVZZlY1dUVvZ0hnZnk3a0tTYWkvelBY?=
 =?utf-8?B?ODBRYTJ1by8zbTI3a04xOE9FTG5iLy9lVWI2QnlsbENrQkhEcjg5djBCU1p2?=
 =?utf-8?B?dm1UaG5PekQ4OWxNY0NpTzRwdXMrM1NibHhzdjhDSU5QM3Y5Nkx0d0dGOHZT?=
 =?utf-8?B?WUhnMTFodjJvSlJYSVpSaWVDMjJFVEJ0b0tTRjBvSHU1dkRXRThmWkhuekE5?=
 =?utf-8?B?VW1QYzNtVlRmMGpwUmhHTjd5YUI0WGgvQ0Y0RHdLdXhtRkE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SkVkOFVUOURqTmkrTDR2RGFtc29Ya3duTjJWMll0UWJ3N2J3MUJWN1ZPbDRz?=
 =?utf-8?B?OE5OekZpRzR3a1hZOGx6WG1UelpHRS9sbVF6R3FTbUlWQVcvS2pXOGJ6Smth?=
 =?utf-8?B?NGt6MDZsdklxZWxXNllHU2pIR2NobjBKKzhHWGNzeVJCSVdCVS9zQmJhdDJM?=
 =?utf-8?B?eHNIaWV5UXNxcnJBaVNwdnc0YTJWM0IzSEo2WHF4L0lGbisrVG80Y3ZFNW9E?=
 =?utf-8?B?aStNV3lHajNBTlErZnU5bGo2WFd2R1oxVDFjVFZiRWVMaDZ2S1ZjMEpmL2w5?=
 =?utf-8?B?YnZFeVlVMXVZMlpDTjhIRmhjc2ZGRk5NRTdzQWRkam4wTERhbWxkY1NOY3A2?=
 =?utf-8?B?Nnh6OHJwemxxQmEwbWZ1RmRqWUY0c2FZMzBTdjh3dlMyODY0c1dCZVJjUXhP?=
 =?utf-8?B?bmZXaTdqTUIvZHdJRXRPZXRSWWtUY0hOelBIN1NiUE94VWMzaitxeUJZUEx6?=
 =?utf-8?B?aytyVjlYUGFKMjB4YU5TUFd6MXRaWWh2RXk1TUN4Qllick5wUUNpbTBKVit2?=
 =?utf-8?B?OEhvUWI4am9tR28xWU9HVWxFSUdiaG4zRVNWWGpXVXdDbmVQMzhpT1RBSUZl?=
 =?utf-8?B?c2dtM2k1VWY0VXVadEdEcUhYbGJKQXUzUXZ0Y2o3c2VrQkJrb04rWEZVTWNl?=
 =?utf-8?B?UVo1Q1ZaYzY2b2RleURhcHFBZExZejNIaTdSdVhzTElZS3M0REZJQitwclpT?=
 =?utf-8?B?N3lOWDhLZEpkQmxHNTlyek5nTWZ4TG9RWEhteXU1N3RJWlRXVG9DbVJ4aVVs?=
 =?utf-8?B?b3MyZzlDdFdmQnBZWG93M1EydThlR0EvZVVuaDBWR3k2bDA5OGduakhtVWw0?=
 =?utf-8?B?QXAzcFJOS3FhL0NEU21LYmFGWVdsVjQ1eU9VaC83enhuZnpCUEJoeWVSaUhz?=
 =?utf-8?B?MVNTTjhGSFhCV2lhU3ZHY2QvM0cwOHJIeEU0eERrZjdGTC9EZHBYb1FPWlU2?=
 =?utf-8?B?cG9udWNGMVFmYmlTQnU4Q21kb0E2SDJXRHVOdDlySHh3eC9yWTlPSnRzVC93?=
 =?utf-8?B?RGVtemFoZnNEZDU2WDV2c0hHbnJBaHN0QUY0cGE1b3RkSXlrM1J2YWlsRDI0?=
 =?utf-8?B?VkdIejFpcDlJNkRqTVY0RjQ5YUI3eEVydEVNTGg3UVBuLzZKMVdEWHgxYjlr?=
 =?utf-8?B?ajBHZ0xWeGpYUStZVkNvcXJ2c1lnbllsakQ5Rksvc0doR2dNb2FHemZmNzla?=
 =?utf-8?B?RjI3UUEzOSs4UmJXbCs4UkE2UFRyS09meHhSZzhHcXNPNkJUaDFIVUdLTHNT?=
 =?utf-8?B?NGd5MW1lWlZOTzFOdTVKRk1QaW1HRUdWbFhrNWxkajlhVlpSQXpJbWlWdk1S?=
 =?utf-8?B?N1dLRUZiZ25vZEl4SFVDZ1RqVklSYUg0a2pOTTZ0eWdQY2YrTm1TcjBOVzVJ?=
 =?utf-8?B?NkhGZ2ljMXQzc3IxajMzQlpBRDdEQXJjSWZIbmdsamhGcnhzVEtuNjF3WlhP?=
 =?utf-8?B?RU03cW5Vb0FaZjlqQ1hNNEVCSHBHdE8vS1RiVUszejNId1RtdkE4TWdFMmxt?=
 =?utf-8?B?c0U1RVFCUjVuelUxTUF3b3ZHSFVTeGRMT1kwWTlzRW5XTGEwMDMwc0NEZjkw?=
 =?utf-8?B?MUJjZGtsWkVtK25tWTcyUC8yWFVNQW5KWW5mRkxMdXg5L05BaDlaZmEySnpS?=
 =?utf-8?B?U085ei9penBWQklWT3YrT04wdEd6WDhQaGZjWTYyNnJDMGNRc2tyN0pWTGRF?=
 =?utf-8?B?WVNuRU82WG5BUWprOFp4UGxubmtScXZCU0lOYUcrejJYbElLYjFYVjYzT29R?=
 =?utf-8?B?R2FjQVhhbjdwRDVpTytmYjdWd0ZTdzl4dFlKaWNJb3RuUjVMVGs3TmNvMEZU?=
 =?utf-8?B?aFJ4TWVMcTA5SHhITy9ZdkVmRmZIeWttUEdTZnI0dFZBUGV5cGtRa2ZUZEZ3?=
 =?utf-8?B?MzZnNDhCTm5tVlVwWjZnMjRJUGZKbncvNGtsT1J5QkRSeElhKzFaeU9oekNJ?=
 =?utf-8?B?NVBzTGdkUCtsRzhPbUtERzIxcWJhTWN4b2JiTHhjdWhBdjczWE9BVjVNbzJs?=
 =?utf-8?B?YUhsOVdKNWRLSW5qT01VWFVRUDE5N0VIclFxaFZOWnNjT3hGUmpSRWlvZFpo?=
 =?utf-8?B?OTlNTkd0a3dVaEh4Sk55d2VwblRwYjNMYUZ5cmdJN0pFZitsaGlKTzFjbDEx?=
 =?utf-8?B?TEFXd0krcTRZWko0WEVqOWh6dmtUY041UHVBeDZCVTNUTm5EMXo2SWVhZEt1?=
 =?utf-8?B?WFE9PQ==?=
Content-ID: <7C551FB822FE2F4BB3D2A93FDD26AD6D@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c378ea0-585a-489e-b1e5-08dd14db3699
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2024 03:16:30.2664 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kLxZgs1jERNt2MBHbMijLffOmICRttEwSz6u8RYjKik1xdnfHaUoFpCEyTfMtoEgE2fOA5FgrrpbrTI+k5k9wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8382
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--19.244000-8.000000
X-TMASE-MatchedRID: QW5G6BKkLToNtKv7cnNXnSa1MaKuob8PCJpCCsn6HCHBnyal/eRn3gzR
 CsGHURLuwpcJm2NYlPAF6GY0Fb6yCrfUboIp1QbVuIwLnB3Aqp24vBuE2X0HlVwpnAAvAwazkaC
 qYviih52NKaasnxJAFjDDWg3cV0z4m0qYZR+CUBLil2r2x2PwtQrefVId6fzVLzNBnatH86l8yt
 0Pc0hS+ySNsvbDyWzxhqVQcGwtQOUyVnV3QQcwse7KTDtx8CggbSE5tsEh8ODJrP9MePs1nKPFj
 JEFr+olFUew0Fl/1pH1MHKyrhxIFlZ0V5tYhzdWxEHRux+uk8jpP8tMOyYmaA==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--19.244000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 1B0C56E0259F191025DE8595346E82FCC0F169F2A15390CA71EE8EDB695BD8A32000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_007_1475574252.1342278516"
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

--__=_Part_Boundary_007_1475574252.1342278516
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEFuZ2VsbzoNCg0KT24gV2VkLCAyMDI0LTExLTIwIGF0IDEzOjQ1ICswMTAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZp
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBJbiBwcmVwYXJhdGlvbiBm
b3IgYWRkaW5nIGEgbmV3IGRyaXZlciBmb3IgdGhlIEhETUkgVFggdjIgSVAsDQo+IHNwbGl0IG91
dCB0aGUgZnVuY3Rpb25zIHRoYXQgd2lsbCBiZSBjb21tb24gYmV0d2VlbiB0aGUgYWxyZWFkeQ0K
PiBwcmVzZW50IG10a19oZG1pICh2MSkgZHJpdmVyIGFuZCB0aGUgbmV3IG9uZS4NCj4gDQo+IFNp
bmNlIHRoZSBwcm9iZSBmbG93IGZvciBib3RoIGRyaXZlcnMgaXMgOTAlIHNpbWlsYXIsIGFkZCBh
IGNvbW1vbg0KPiBwcm9iZSBmdW5jdGlvbiB0aGF0IHdpbGwgYmUgY2FsbGVkIGZyb20gZWFjaCBk
cml2ZXIncyAucHJvYmUoKQ0KPiBjYWxsYmFjaywgYXZvaWRpbmcgbG90cyBvZiBjb2RlIGR1cGxp
Y2F0aW9uLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8g
PGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4NCj4gLS0tDQoNCltzbmlw
XQ0KDQo+ICAvKg0KPiAgICogSERNSSBhdWRpbyBjb2RlYyBjYWxsYmFja3MNCj4gICAqLw0KPiBA
QCAtMTUyOCwxNCArMTEwNCwxNCBAQCBzdGF0aWMgaW50IG10a19oZG1pX2F1ZGlvX2h3X3BhcmFt
cyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsDQo+ICAgICAgICAgc3dpdGNoIChkYWlm
bXQtPmZtdCkgew0KPiAgICAgICAgIGNhc2UgSERNSV9JMlM6DQo+ICAgICAgICAgICAgICAgICBo
ZG1pX3BhcmFtcy5hdWRfY29kZWMgPSBIRE1JX0FVRElPX0NPRElOR19UWVBFX1BDTTsNCj4gLSAg
ICAgICAgICAgICAgIGhkbWlfcGFyYW1zLmF1ZF9zYW1wZV9zaXplID0gSERNSV9BVURJT19TQU1Q
TEVfU0laRV8xNjsNCj4gKyAgICAgICAgICAgICAgIGhkbWlfcGFyYW1zLmF1ZF9zYW1wbGVfc2l6
ZSA9IEhETUlfQVVESU9fU0FNUExFX1NJWkVfMTY7DQoNCllvdSBjaGFuZ2UgdGhlIG5hbWUgZnJv
bSBhdWRfc2FtcGVfc2l6ZSB0byBhdWRfc2FtcGxlX3NpemUuDQpTbyB0aGlzIGlzIGEgcmVmaW5l
bWVudC4gU2VwYXJhdGUgdGhpcyB0byBhIHJlZmluZW1lbnQgcGF0Y2guDQoNClJlZ2FyZHMsDQpD
Sw0KDQo+ICAgICAgICAgICAgICAgICBoZG1pX3BhcmFtcy5hdWRfaW5wdXRfdHlwZSA9IEhETUlf
QVVEX0lOUFVUX0kyUzsNCj4gICAgICAgICAgICAgICAgIGhkbWlfcGFyYW1zLmF1ZF9pMnNfZm10
ID0gSERNSV9JMlNfTU9ERV9JMlNfMjRCSVQ7DQo+ICAgICAgICAgICAgICAgICBoZG1pX3BhcmFt
cy5hdWRfbWNsayA9IEhETUlfQVVEX01DTEtfMTI4RlM7DQo+ICAgICAgICAgICAgICAgICBicmVh
azsNCj4gICAgICAgICBjYXNlIEhETUlfU1BESUY6DQo+ICAgICAgICAgICAgICAgICBoZG1pX3Bh
cmFtcy5hdWRfY29kZWMgPSBIRE1JX0FVRElPX0NPRElOR19UWVBFX1BDTTsNCj4gLSAgICAgICAg
ICAgICAgIGhkbWlfcGFyYW1zLmF1ZF9zYW1wZV9zaXplID0gSERNSV9BVURJT19TQU1QTEVfU0la
RV8xNjsNCj4gKyAgICAgICAgICAgICAgIGhkbWlfcGFyYW1zLmF1ZF9zYW1wbGVfc2l6ZSA9IEhE
TUlfQVVESU9fU0FNUExFX1NJWkVfMTY7DQo+ICAgICAgICAgICAgICAgICBoZG1pX3BhcmFtcy5h
dWRfaW5wdXRfdHlwZSA9IEhETUlfQVVEX0lOUFVUX1NQRElGOw0KPiAgICAgICAgICAgICAgICAg
YnJlYWs7DQo+ICAgICAgICAgZGVmYXVsdDoNCj4gQEAgLTE1OTAsNiArMTE2Niw3IEBAIHN0YXRp
YyBpbnQgbXRrX2hkbWlfYXVkaW9fZ2V0X2VsZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQgKmRh
dGEsIHVpbnQ4X3QgKmJ1ZiwNCj4gICAgICAgICAgICAgICAgIG1lbWNweShidWYsIGhkbWktPmN1
cnJfY29ubi0+ZWxkLCBtaW4oc2l6ZW9mKGhkbWktPmN1cnJfY29ubi0+ZWxkKSwgbGVuKSk7DQo+
ICAgICAgICAgZWxzZQ0KPiAgICAgICAgICAgICAgICAgbWVtc2V0KGJ1ZiwgMCwgbGVuKTsNCj4g
Kw0KPiAgICAgICAgIHJldHVybiAwOw0KPiAgfQ0KPiANCg0K

--__=_Part_Boundary_007_1475574252.1342278516
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtBbmdlbG86DQoNCk9uJiMzMjtXZWQsJiMz
MjsyMDI0LTExLTIwJiMzMjthdCYjMzI7MTM6NDUmIzMyOyswMTAwLCYjMzI7QW5nZWxvR2lvYWNj
aGlubyYjMzI7RGVsJiMzMjtSZWdubyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtFeHRlcm5hbCYjMzI7
ZW1haWwmIzMyOzomIzMyO1BsZWFzZSYjMzI7ZG8mIzMyO25vdCYjMzI7Y2xpY2smIzMyO2xpbmtz
JiMzMjtvciYjMzI7b3BlbiYjMzI7YXR0YWNobWVudHMmIzMyO3VudGlsJiMzMjt5b3UmIzMyO2hh
dmUmIzMyO3ZlcmlmaWVkJiMzMjt0aGUmIzMyO3NlbmRlciYjMzI7b3ImIzMyO3RoZSYjMzI7Y29u
dGVudC4NCiZndDsmIzMyOw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtJbiYjMzI7cHJlcGFyYXRpb24m
IzMyO2ZvciYjMzI7YWRkaW5nJiMzMjthJiMzMjtuZXcmIzMyO2RyaXZlciYjMzI7Zm9yJiMzMjt0
aGUmIzMyO0hETUkmIzMyO1RYJiMzMjt2MiYjMzI7SVAsDQomZ3Q7JiMzMjtzcGxpdCYjMzI7b3V0
JiMzMjt0aGUmIzMyO2Z1bmN0aW9ucyYjMzI7dGhhdCYjMzI7d2lsbCYjMzI7YmUmIzMyO2NvbW1v
biYjMzI7YmV0d2VlbiYjMzI7dGhlJiMzMjthbHJlYWR5DQomZ3Q7JiMzMjtwcmVzZW50JiMzMjtt
dGtfaGRtaSYjMzI7KHYxKSYjMzI7ZHJpdmVyJiMzMjthbmQmIzMyO3RoZSYjMzI7bmV3JiMzMjtv
bmUuDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1NpbmNlJiMzMjt0aGUmIzMyO3Byb2JlJiMzMjtmbG93
JiMzMjtmb3ImIzMyO2JvdGgmIzMyO2RyaXZlcnMmIzMyO2lzJiMzMjs5MCUmIzMyO3NpbWlsYXIs
JiMzMjthZGQmIzMyO2EmIzMyO2NvbW1vbg0KJmd0OyYjMzI7cHJvYmUmIzMyO2Z1bmN0aW9uJiMz
Mjt0aGF0JiMzMjt3aWxsJiMzMjtiZSYjMzI7Y2FsbGVkJiMzMjtmcm9tJiMzMjtlYWNoJiMzMjtk
cml2ZXImIzM5O3MmIzMyOy5wcm9iZSgpDQomZ3Q7JiMzMjtjYWxsYmFjaywmIzMyO2F2b2lkaW5n
JiMzMjtsb3RzJiMzMjtvZiYjMzI7Y29kZSYjMzI7ZHVwbGljYXRpb24uDQomZ3Q7JiMzMjsNCiZn
dDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtBbmdlbG9HaW9hY2NoaW5vJiMzMjtEZWwmIzMyO1Jl
Z25vJiMzMjsmbHQ7YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tJmd0Ow0K
Jmd0OyYjMzI7LS0tDQoNCltzbmlwXQ0KDQomZ3Q7JiMzMjsmIzMyOy8qDQomZ3Q7JiMzMjsmIzMy
OyYjMzI7KiYjMzI7SERNSSYjMzI7YXVkaW8mIzMyO2NvZGVjJiMzMjtjYWxsYmFja3MNCiZndDsm
IzMyOyYjMzI7JiMzMjsqLw0KJmd0OyYjMzI7QEAmIzMyOy0xNTI4LDE0JiMzMjsrMTEwNCwxNCYj
MzI7QEAmIzMyO3N0YXRpYyYjMzI7aW50JiMzMjttdGtfaGRtaV9hdWRpb19od19wYXJhbXMoc3Ry
dWN0JiMzMjtkZXZpY2UmIzMyOypkZXYsJiMzMjt2b2lkJiMzMjsqZGF0YSwNCiZndDsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtzd2l0Y2gmIzMyOyhkYWlmbXQt
Jmd0O2ZtdCkmIzMyO3sNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjtjYXNlJiMzMjtIRE1JX0kyUzoNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7aGRtaV9wYXJhbXMuYXVkX2NvZGVjJiMzMjs9JiMzMjtIRE1JX0FVRElPX0NPRElOR19UWVBF
X1BDTTsNCiZndDsmIzMyOy0mIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtoZG1pX3BhcmFtcy5hdWRfc2FtcGVf
c2l6ZSYjMzI7PSYjMzI7SERNSV9BVURJT19TQU1QTEVfU0laRV8xNjsNCiZndDsmIzMyOysmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjtoZG1pX3BhcmFtcy5hdWRfc2FtcGxlX3NpemUmIzMyOz0mIzMyO0hETUlf
QVVESU9fU0FNUExFX1NJWkVfMTY7DQoNCllvdSYjMzI7Y2hhbmdlJiMzMjt0aGUmIzMyO25hbWUm
IzMyO2Zyb20mIzMyO2F1ZF9zYW1wZV9zaXplJiMzMjt0byYjMzI7YXVkX3NhbXBsZV9zaXplLg0K
U28mIzMyO3RoaXMmIzMyO2lzJiMzMjthJiMzMjtyZWZpbmVtZW50LiYjMzI7U2VwYXJhdGUmIzMy
O3RoaXMmIzMyO3RvJiMzMjthJiMzMjtyZWZpbmVtZW50JiMzMjtwYXRjaC4NCg0KUmVnYXJkcywN
CkNLDQoNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7aGRtaV9wYXJhbXMuYXVkX2lu
cHV0X3R5cGUmIzMyOz0mIzMyO0hETUlfQVVEX0lOUFVUX0kyUzsNCiZndDsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7aGRtaV9wYXJhbXMuYXVkX2kyc19mbXQmIzMyOz0mIzMyO0hETUlfSTJT
X01PREVfSTJTXzI0QklUOw0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtoZG1pX3Bh
cmFtcy5hdWRfbWNsayYjMzI7PSYjMzI7SERNSV9BVURfTUNMS18xMjhGUzsNCiZndDsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7YnJlYWs7DQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7Y2FzZSYjMzI7SERNSV9TUERJRjoNCiZndDsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7aGRtaV9wYXJhbXMuYXVkX2NvZGVjJiMzMjs9JiMzMjtIRE1JX0FV
RElPX0NPRElOR19UWVBFX1BDTTsNCiZndDsmIzMyOy0mIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtoZG1pX3Bh
cmFtcy5hdWRfc2FtcGVfc2l6ZSYjMzI7PSYjMzI7SERNSV9BVURJT19TQU1QTEVfU0laRV8xNjsN
CiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtoZG1pX3BhcmFtcy5hdWRfc2FtcGxlX3NpemUm
IzMyOz0mIzMyO0hETUlfQVVESU9fU0FNUExFX1NJWkVfMTY7DQomZ3Q7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyO2hkbWlfcGFyYW1zLmF1ZF9pbnB1dF90eXBlJiMzMjs9JiMzMjtIRE1JX0FV
RF9JTlBVVF9TUERJRjsNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7YnJlYWs7DQom
Z3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7ZGVmYXVsdDoN
CiZndDsmIzMyO0BAJiMzMjstMTU5MCw2JiMzMjsrMTE2Niw3JiMzMjtAQCYjMzI7c3RhdGljJiMz
MjtpbnQmIzMyO210a19oZG1pX2F1ZGlvX2dldF9lbGQoc3RydWN0JiMzMjtkZXZpY2UmIzMyOypk
ZXYsJiMzMjt2b2lkJiMzMjsqZGF0YSwmIzMyO3VpbnQ4X3QmIzMyOypidWYsDQomZ3Q7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyO21lbWNweShidWYsJiMzMjtoZG1pLSZndDtjdXJyX2Nvbm4t
Jmd0O2VsZCwmIzMyO21pbihzaXplb2YoaGRtaS0mZ3Q7Y3Vycl9jb25uLSZndDtlbGQpLCYjMzI7
bGVuKSk7DQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
ZWxzZQ0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjttZW1zZXQoYnVmLCYjMzI7MCwm
IzMyO2xlbik7DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7cmV0dXJuJiMzMjswOw0KJmd0OyYjMzI7JiMzMjt9DQomZ3Q7JiMzMjsN
Cg0KDQo8L3ByZT4NCjwvcD48L2JvZHk+PC9odG1sPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxw
cmU+KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlICoqKioqKioq
KioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1l
c3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwg
cHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xv
c3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5
ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWlu
YXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2Yg
dGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCBy
ZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwu
IElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3Ig
YmVsaWV2ZSANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBs
ZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlz
IGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5j
bHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlz
Y2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhh
bmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_007_1475574252.1342278516--

