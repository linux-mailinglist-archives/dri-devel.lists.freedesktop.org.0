Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7796D9372EA
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2024 06:05:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 222A110E0E7;
	Fri, 19 Jul 2024 04:05:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="T0h5LbxQ";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="dG3GLE4b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A5B310E0E7
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 04:05:24 +0000 (UTC)
X-UUID: 1b23e3e6458411efb5b96b43b535fdb4-20240719
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=ITN2D1EwzQukU46UEOTJ/57jqTxGPq9A3bSgMWP+kbI=; 
 b=T0h5LbxQLIhEaCoxV+jDqul0akjKJup5H++XvusJapBw9zQwntr30zgP0RqVUJYlJGSv1dt3OTMjWRcZ+TVcaF/dBY7Iy6F5vdZvw5B27LC1kaJ3mARC5uUMkoE/HrDEpW6JlGtPwTZkRIQnvjRQYujmHuhlE9jjE674uzxS8fQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40, REQID:d3813562-d73c-4c7d-8b4b-6e1cee07e5c2, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:ba885a6, CLOUDID:02ea7a45-a117-4f46-a956-71ffeac67bfa,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 1b23e3e6458411efb5b96b43b535fdb4-20240719
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1805231827; Fri, 19 Jul 2024 12:05:16 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 19 Jul 2024 12:05:15 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Fri, 19 Jul 2024 12:05:15 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ybaqbJ/R3pQdCm62YzhNJFO4p88c3wfASSKLPsbI6aDjRcjLhkRgpiirMqshdr59Nyx6KWEIy3rjOyGiEVipvjazI9J8lLBnygAa3rgujH97qQcYHd1ZBTddsHTX2Gt7QL6HhVnkgxuhGH0QaDZdHjjAto5j5OCqLiM+ecaXdP5Kjji4CGfs0CBF+CuuEaio+3wUWwAWmbDVRuMGHmuWtk5yTsYZYisGzSr2jL19vHQP2SJMx2ut3DGfS5qoZRf4mJZgjj6PcaEE5oHeA+OHW3UpCkluFSfD315maTDxmb8eeeJeosk2zo7v7OL+85KAxLsvn6Dpft0UGlz2rxHJXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sqn0co/ocn3u3+gXGJVT0tf1arly/vtadFECwRXV7ws=;
 b=eZS4uIaRozjQe63xNvJxk9xGDAxnnAtZ+7KU0tDSXMYRBfFiON9G6aTaC5m/otI16ikO0FjEclc27QAbY2g6CMJ12Wsw61aXpd77AyezGtNnrx9IDCyRNQRLUeeivssIcKZiPrj/DdsDxg+Q0WbIjJdRSIL8pXX6pwJHC1k3IMvOglXDZ7g0ZMm5PmrLYSVLnHoK5l0C/yKhEGe+d5ByXlfkYGdNmx+zTU8GFhhO4aL5NZywza/LxQPlfgR/X1o1nFEsuRb3ZTcpyzY3P0wCiJEa/0kHTpXEiZt0WEzTKZXrVfHOzEhjCi1S0GINrWHJ8W0IVtzcPbEtr3giyD3z0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sqn0co/ocn3u3+gXGJVT0tf1arly/vtadFECwRXV7ws=;
 b=dG3GLE4bnyjtzMtrkku0uXE9habnQKqottaQBzzsGbWFk979yCxhWlAwD7Tf4gyh5yr88mZ7fyW70udfzoaQtP+gK6spAP6Lc3SNH1oh503KBucXfSWqPixIL8oOVoAsL3ib32lfcjQDJTkoXw2jnxhSsojFccdw1r6P7CaX0jU=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KL1PR03MB8800.apcprd03.prod.outlook.com (2603:1096:820:142::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Fri, 19 Jul
 2024 04:05:13 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.7762.027; Fri, 19 Jul 2024
 04:05:13 +0000
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
Subject: Re: [PATCH v3 2/3] Subject: [PATCH] drm/mediatek/dp: Add HDCP2.x
 feature for DisplayPort
Thread-Topic: [PATCH v3 2/3] Subject: [PATCH] drm/mediatek/dp: Add HDCP2.x
 feature for DisplayPort
Thread-Index: AQHauZvjSsoBOfJjC0GAI+NtmELueLH9rnwA
Date: Fri, 19 Jul 2024 04:05:13 +0000
Message-ID: <c72c1114514452450c8248f894bc332ce2778477.camel@mediatek.com>
References: <20240608120219.21817-1-mac.shen@mediatek.com>
 <20240608120219.21817-3-mac.shen@mediatek.com>
In-Reply-To: <20240608120219.21817-3-mac.shen@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KL1PR03MB8800:EE_
x-ms-office365-filtering-correlation-id: ab447829-4606-48ce-5744-08dca7a7fd68
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?eGhKSUZHMDZMSkpjZWgxcS9yMW43M1NvUVM3UloxV3FkT1RHbndwT051b3Qw?=
 =?utf-8?B?S2F5enNkUXhWczY0UlIxQmtRV3FQenNhdUdyQS9SZk5VbitiSHlRR05JZCtF?=
 =?utf-8?B?TFpBOFA3aG9ncWtLd0F2WnFFTUMxcngwM3Z4NmZUZFVvYlZUUWhUTGE1SThG?=
 =?utf-8?B?M3Qwb0FuRHE5RkNvWTBCTTZadzJmNFJZdG02RmhVS0JNUTltSmRGczVYK1NP?=
 =?utf-8?B?d3Q1TmhxS3dLbnJvNkdWaUhGYW1TVStja2IyVWlUQWJ0bHhGNFVrVU9MZGRK?=
 =?utf-8?B?UDdpY25vSXJhcmk3ZHZkNGNibjV2dUVKajJ3ZFZaSVNhT1lOL1BoZnUvckND?=
 =?utf-8?B?dlBPeWVZbFhYV29Qdnd1U2M5L095empidFNUUThNaGFiQVZiWE5NZjgySDNV?=
 =?utf-8?B?bytrSmRQcG81amlmR1FWc1p2T2FldDQ2OXdnbTVJSFlUa0Z4TUdXeDFtazR2?=
 =?utf-8?B?Wi9mSmVzdi91UHhNMlpGa3VmUnZiTE9Rd1NIYWhpbG1pVG9SOUkrVFd6Nncx?=
 =?utf-8?B?Qk9tNEprTUxmc2JWanRhSFNLNU9DTFYyNDZYWUtyTzRGQ1dYOTdCWGV4YkRo?=
 =?utf-8?B?bWc0Y3BYWkdCdDZWTUlhSDZVblIzNmJMOU5od1R3YmQ5ZDc3SmwyRjBoaVhv?=
 =?utf-8?B?Ym82VW5wcE1jTll2YXd3cFV5YWJuOXpjY0d0bjU1Z3hGd3lOMlhaTVFuTm1l?=
 =?utf-8?B?VCtLMlF5MEx5OUtvMGF3dEREV3NHbS9HZG15N2F4N3RRV0NJcXZoRmx3eTVk?=
 =?utf-8?B?bitzRjJNeXVGd2NtOUUwQmJHdHdmd1NHeTZYd2svUndvQTRDQWlvbkhRaDlR?=
 =?utf-8?B?TmlvanZ0Uno1Tkk5U1VSWDVJZDRRbDM4V1ZkUTk1VkpvTGdLVGZHM2tYSThq?=
 =?utf-8?B?aDFDL205aFRFNisrM1h1WTh2OEhBZHJsSWpoZjAyWHB2ZGdiY2tDYkE5akhJ?=
 =?utf-8?B?d2d3elU5aDQ5OGxqUkxaVG1mTmtBQThlYmtnWTNKK2doUXB1aFNpQmtBS3p0?=
 =?utf-8?B?RXRxWDdqWG1YMGE4YjhUUVNGMEVRTTY3TG5sWWNsZGtNRWVHRGVzeU9ZYWhQ?=
 =?utf-8?B?WWtSSG1IS3pPOUdRSHRVUWpXYS9waGo5aklJSGJCdkdKcDJkZ0JXK3NBdXhT?=
 =?utf-8?B?TkZKYlgyc2M1WWxUSlMyS0kyVENCNHgwYWRKNGsvdi9iRndGVHhXejB1U1Jy?=
 =?utf-8?B?dHZwRjdwL3dURkVuNG91RkJPcW9hQnk2dDFQMUpLbE9CNnI5aHVFSDVGWmsw?=
 =?utf-8?B?YkVPWXM3MkNiUVNZb3FVcFFCNUxMZzdlMDJYUGFmSVdYdi9EMXNpc3pYTnhp?=
 =?utf-8?B?UExNclIvSW9RbEJKVVZTSG1xd2ZaZ1htallGS0dHWFpyU0p4RVYzSHV6MmhE?=
 =?utf-8?B?M0xDaG1rYmR5SHNWODUxNGliM3EwNXpJUDF3K2dTS1ZUQ2d6Q2dYcWxaVTk2?=
 =?utf-8?B?Z2Q2ZkZ1S21BbndGK3dKSUZpRjNtM0ZvWkErRVlYb1lVdFh1T0VhS0ZwWmo4?=
 =?utf-8?B?VjVGVWVrMHFjSVYwcXlJbUt5YWVaMWRpdGt0ZERZVG5YQWg3MUk2clNFcmkx?=
 =?utf-8?B?UjBLdU80d0pyVTRTNGdVQnV3bXNvZDB6dWRmWEdaM3FrSTc5eGlCSFRFN3di?=
 =?utf-8?B?TWdkTXp3WVZBR3JVRGc4Vk9mRWs3WjUvdDVYS2xPK1c4cG1UbzJkNCtOUlZG?=
 =?utf-8?B?VkNQSzlqZkYyUG8xZXBpWUNtYTBOMXNXeFVDMHJYMVJscEZlYzRPNFMvK3p0?=
 =?utf-8?B?L3VzcFRPRUhQc0l2RzU5ekh6YzdOaFR3eHQra3ROeWxMYTk0NHdHSDEzaE5R?=
 =?utf-8?Q?Si9AhMroMsQOO5xZxKU/JQR+zb6ccrMdUaEno=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L2xmTUJZd0ZXT3JMQzZ4bHBQM21uUTljbmlhWnVwdTZUZlpPZTAzR05hZFkz?=
 =?utf-8?B?YmNncEY4QXFtY2wrY1RPeGtEVmZGYlk4eWY3TVNmazdwd0xFc2NFaUpBVlgx?=
 =?utf-8?B?YnNNUUhOdFQ5cEFUQVduTmVZTkdLemRPdlJmOTM0NTNmOURySm9hQWZmKytK?=
 =?utf-8?B?WHRTcVJITG9WOEoxbFppMVpyU1pTemkxMUN1cFI2UGIyUGFvV3BEVmVzRFd1?=
 =?utf-8?B?dGNGSFFFTy83SThzQ1JVdHY4WDkwTXhiOW1ySjlicmdlZVB0aXQzSFczZ3F3?=
 =?utf-8?B?OERuRTZGMHo5NDdtN0lKZXNQQVpwdzVNb0M3cHVuUW8vYVd6UXQ1SHBPZS9y?=
 =?utf-8?B?bGdrQWJiU29rYVZoV2sxWHRoS3RJNHd6eFRpYW54dDZYUTRMZ2JRVXpKOFM1?=
 =?utf-8?B?SjI1NjJDOUJXZUg5VHAyNXRWckNrcDFCdHRyaUwvekhFLzlsL2E2ZEJHZjA2?=
 =?utf-8?B?N2FjVHc1TkhFTkcwZEZqQVpFeng3cGNYS1VvN2xPelJ6MCtLeFNRb0lUTXJE?=
 =?utf-8?B?Y1ljeHlndEdETUFkdVhOVnRWcXBBU2ZFUnZ1bEFxRkt1cytQWjVqajZOMnM4?=
 =?utf-8?B?RjhDK0ZxRlk4NUlKSnZ5cE5KRTRiQzRGaWduck1JM1VYckc3YmF5ZXljOUx6?=
 =?utf-8?B?clVrL0pxMENDcjhxbXNuLzdXOHJVNXBHb3FseXoraEpBQnd2V21yNWtGOXdO?=
 =?utf-8?B?MXhBSTI5SmQyYnU2d2I0Q1o5MHY3MERiVVBpTHd5K0Rpd0dFK1ZHcjA5aDFp?=
 =?utf-8?B?dlNJbkI4VjdzOHZudmFiQTA5MFVqWmNBbGx6Tzh1V0tnRU9uNEdVN0c0amtY?=
 =?utf-8?B?cUFpVUgxamFHcG51cFNMcGF6emx3SDlpUTNVUHlleUErYXIzc01MSDFsVEVp?=
 =?utf-8?B?L3Nsbmp2ejY0UnBiZmNJY2xoR1Z0MWx5WktJWDUrSUphdFhablFvRGF6MU9a?=
 =?utf-8?B?dyswRjBhUjJCM2RrU1ROV1U5QW01OHVjYWhQWVBhTFRVWWM5T2lVRERBVnhH?=
 =?utf-8?B?a2ZYWUFYSmk2YUxjSnVqUVVLZHZOOGtXczM2eEN2aS9HcUJsVGJpUTNWMEJX?=
 =?utf-8?B?dDdHVDRSblpROGo4UW8xWWFzanJTYytQQ2Z0eVkySXVzOXhTVm10NitIMDRt?=
 =?utf-8?B?RGZvWnZCM2htS2NGa0ZCcE0xZXlvVlgxVmNsbklNcVhLNTRhTDhndVpJV2JK?=
 =?utf-8?B?VjFBSmV1V1dMbWhyMFRLbTVsNVA4SCtaeG0zQTBnakZQUkJsb2srVTBtaTlU?=
 =?utf-8?B?SytrdXVYVnpNMzNVbE1wNnhNeDVhRzVuUG9DUjh3QjlvU1VEYzJsQUtLcU1K?=
 =?utf-8?B?WThIUExOcGZJdEJacitDc1pFZVJ0dmlhMGlWODc5SGZLVUFBVEJxSkcvMVht?=
 =?utf-8?B?ZSt0MjQ0aG1qSytRTjRKdTJtaUJUOVdRODBLUThuSWg4YVBKZXdtelJqRGV5?=
 =?utf-8?B?dWNDQjU4cVlwcC9MYXJGRXc3bWJ1VTF1bjhVYVVDZ0lkeXR6RGpEL3JSd3Vx?=
 =?utf-8?B?YTh3VUZSeUI5MXRFV0N6R0ZhaERvRFVGMEovOVpTOGNoRWYvWmEyWnBSTE1M?=
 =?utf-8?B?Mi9KNktYZjNrblpmbVhxZGx6YXVVdUZSVldKOGxKMVgwZEI5RlBMaGllL0Jp?=
 =?utf-8?B?Z2tjUElqZjVYVURxaVBXVGl0SFY2c0pMU2lQSTVjYVhtOFZ2SkhZTXZGQ0di?=
 =?utf-8?B?S0l2SW53d1ZqNHd4cFY0ei9EeHFXK09UQjV0NEVjTzJSR0FrZ3p5Vml6VG9Z?=
 =?utf-8?B?bDRoVkNVK0xhR2J2VW5ISVV2V1FGSmVqb0tkTVhHbFdlcXhyUEI2N3lyY0dH?=
 =?utf-8?B?bDFYSEd0TjdsTUI3bk9vRVQ2MFU1bVIzYjd3UW1ZNEo1Z1hTTUZvZjlJWnhh?=
 =?utf-8?B?SVhSS0JZakR6VHBwV2N1TC9Yc3hxcmFya2JSc2I2MmdMT0tyaDhqTVFtcUVD?=
 =?utf-8?B?TmxzMExzQmdRZm1xZndSQkJlVjdGMkI5Yi9BRkY1c1BCTjIvKytWMG9rcU9M?=
 =?utf-8?B?Qy9vT3ZzcEVTMVlIVEh0emZBbEkzRlNlRzRGcUUvNkRkaXhpbmdFK2tmb3p2?=
 =?utf-8?B?RUdsa0F0NVJremZyeTcyMUVnVjRMRmorR2FMQ0hRWG5oalhWdWdSOXZJWFVT?=
 =?utf-8?Q?0HoDzYHV/BE5C78sTHMcT0Vzs?=
Content-ID: <3E945682DBB412468B4993CD3C9E52CC@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab447829-4606-48ce-5744-08dca7a7fd68
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2024 04:05:13.2155 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cKbYbI6c37gM4jFCg4Kd6oxPxhUzb/0vvTkaDFoqNoDMUtQfTuSxgPbrtJjncD6JvJZQ8U5PF4pj3Zg71+7Fiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8800
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_004_1241841978.163672775"
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

--__=_Part_Boundary_004_1241841978.163672775
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIE1hYzoNCg0KT24gU2F0LCAyMDI0LTA2LTA4IGF0IDIwOjAxICswODAwLCBtYWMuc2hlbiB3
cm90ZToNCj4gQ2hhbmdlcyBpbiB2MzoNCj4gLSByZWZpbmUgdGhlIGZ1bmN0aW9uIHRvIGdldCBz
eXN0ZW0gdGltZQ0KPiAtIHJlZmluZSB0aGUgZmxvdyB0byBkbyBIRENQIHdpdGggY29udGVudCB0
eXBlIGFuZA0KPiAgIHByb3RlY3Rpb24gdmFsdWUgd2hpY2ggc2V0IGJ5IHVzZXIgc3BhY2UNCj4g
LSByZWZpbmUgdGhlIGZsb3cgdG8gdXBkYXRlIGNvbnRlbnQgcHJvdGVjdGlvbg0KPiAtIHJlZmlu
ZSB0aGUgZmxvdyB0byBkbyBIRENQMi54IGF1dGhlbnRpY2F0aW9uDQo+IHBlciBzdWdnZXN0aW9u
IGZyb20gdGhlIHByZXZpb3VzIHRocmVhZDoNCj4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9f
X2h0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRla19fOyEh
Q1RSTktBOXdNZzBBUmJ3IW1kNnhVaVlOODhEMlltRVRzOEZRZ2FFeE0yekg4UzFTbUFFVTlHUmNo
d3BOc1hPeURGdWwzemlWS2hScENKYWo4UmNuLWd2TS04MDFydW5qd0EkIA0KPiAvcGF0Y2gvMjAy
NDAyMDUwNTUwNTUuMjUzNDAtMy1tYWMuc2hlbkBtZWRpYXRlay5jb20vDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBtYWMuc2hlbiA8bWFjLnNoZW5AbWVkaWF0ZWsuY29tPg0KPiAtLS0NCg0KW3NuaXBd
DQoNCj4gK3N0YXRpYyBpbnQgZHBfdHhfaGRjcDJ4X2VuYWJsZV9hdXRoKHN0cnVjdCBtdGtfaGRj
cF9pbmZvICpoZGNwX2luZm8sIGJvb2wgZW5hYmxlKQ0KPiArew0KPiArCXN0cnVjdCBtdGtfZHAg
Km10a19kcCA9IGNvbnRhaW5lcl9vZihoZGNwX2luZm8sIHN0cnVjdCBtdGtfZHAsIGhkY3BfaW5m
byk7DQo+ICsJdTMyIHZlcnNpb247DQo+ICsJaW50IHJldDsNCj4gKw0KPiArCWRwX3R4X2hkY3Ay
eF9zZXRfYXV0aF9wYXNzKGhkY3BfaW5mbywgZW5hYmxlKTsNCj4gKwlpZiAoIWVuYWJsZSkgew0K
PiArCQlyZXQgPSB0ZWVfaGRjcF9lbmFibGVfZW5jcnlwdChoZGNwX2luZm8sIGVuYWJsZSwgSERD
UF9OT05FKTsNCj4gKwkJaWYgKHJldCkNCj4gKwkJCXJldHVybiByZXQ7DQo+ICsJCW10a19kcF91
cGRhdGVfYml0cyhtdGtfZHAsIE1US19EUF9FTkMwX1AwXzMwMDAsIDAsIEhEQ1BfRlJBTUVfRU5f
RFBfRU5DMF9QMCk7DQo+ICsNCj4gKwkJcmV0dXJuIDA7DQo+ICsJfQ0KPiArDQo+ICsJaWYgKEhE
Q1BfMl8yX0hEQ1AxX0RFVklDRV9DT05ORUNURUQoaGRjcF9pbmZvLT5oZGNwMl9pbmZvLmhkY3Bf
cngucmVjdmlkX2xpc3QucnhfaW5mb1sxXSkpDQo+ICsJCXZlcnNpb24gPSBIRENQX1YxOw0KDQpk
cF90eF9oZGNwMnhfZW5hYmxlX2F1dGgoKSBpcyBjYWxsZWQgb25seSB3aGVuIEhEQ1AgMi54LCBi
dXQgaGVyZSBkZXRlY3QgdGhhdCB2ZXJzaW9uIGlzIDEuDQpJIGRvbid0IGtub3cgdGhlIHNwZWNp
ZmljYXRpb24gb2YgSERDUCwgaXMgdGhpcyBpcyBhbiBlcnJvciBjYXNlPw0KT3IgaWYgdGhpcyBp
cyBhIG5vcm1hbCBjYXNlLCBwbGVhc2UgYWRkIHNvbWUgY29tbWVudCBoZXJlIHRvIGV4cGxhaW4g
Zm9yIHNvbWVvbmUgd2hvIGRvbid0IGtub3cgSERDUCBzcGVjaWZpY2F0aW9uLg0KDQpSZWdhcmRz
LA0KQ0sNCg0KPiArCWVsc2UgaWYgKEhEQ1BfMl8yX0hEQ1BfMl8wX1JFUF9DT05ORUNURUQNCj4g
KwkJKGhkY3BfaW5mby0+aGRjcDJfaW5mby5oZGNwX3J4LnJlY3ZpZF9saXN0LnJ4X2luZm9bMV0p
KQ0KPiArCQl2ZXJzaW9uID0gSERDUF9WMjsNCj4gKwllbHNlDQo+ICsJCXZlcnNpb24gPSBIRENQ
X1YyXzM7DQo+ICsNCj4gKwlyZXQgPSB0ZWVfaGRjcF9lbmFibGVfZW5jcnlwdChoZGNwX2luZm8s
IGVuYWJsZSwgdmVyc2lvbik7DQo+ICsJaWYgKHJldCkNCj4gKwkJcmV0dXJuIHJldDsNCj4gKwlt
dGtfZHBfdXBkYXRlX2JpdHMobXRrX2RwLCBNVEtfRFBfRU5DMF9QMF8zMDAwLA0KPiArCQkJICAg
SERDUF9GUkFNRV9FTl9EUF9FTkMwX1AwLCBIRENQX0ZSQU1FX0VOX0RQX0VOQzBfUDApOw0KPiAr
DQo+ICsJcmV0dXJuIDA7DQo+ICt9DQo+ICsNCg==

--__=_Part_Boundary_004_1241841978.163672775
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtNYWM6DQoNCk9uJiMzMjtTYXQsJiMzMjsy
MDI0LTA2LTA4JiMzMjthdCYjMzI7MjA6MDEmIzMyOyswODAwLCYjMzI7bWFjLnNoZW4mIzMyO3dy
b3RlOg0KJmd0OyYjMzI7Q2hhbmdlcyYjMzI7aW4mIzMyO3YzOg0KJmd0OyYjMzI7LSYjMzI7cmVm
aW5lJiMzMjt0aGUmIzMyO2Z1bmN0aW9uJiMzMjt0byYjMzI7Z2V0JiMzMjtzeXN0ZW0mIzMyO3Rp
bWUNCiZndDsmIzMyOy0mIzMyO3JlZmluZSYjMzI7dGhlJiMzMjtmbG93JiMzMjt0byYjMzI7ZG8m
IzMyO0hEQ1AmIzMyO3dpdGgmIzMyO2NvbnRlbnQmIzMyO3R5cGUmIzMyO2FuZA0KJmd0OyYjMzI7
JiMzMjsmIzMyO3Byb3RlY3Rpb24mIzMyO3ZhbHVlJiMzMjt3aGljaCYjMzI7c2V0JiMzMjtieSYj
MzI7dXNlciYjMzI7c3BhY2UNCiZndDsmIzMyOy0mIzMyO3JlZmluZSYjMzI7dGhlJiMzMjtmbG93
JiMzMjt0byYjMzI7dXBkYXRlJiMzMjtjb250ZW50JiMzMjtwcm90ZWN0aW9uDQomZ3Q7JiMzMjst
JiMzMjtyZWZpbmUmIzMyO3RoZSYjMzI7ZmxvdyYjMzI7dG8mIzMyO2RvJiMzMjtIRENQMi54JiMz
MjthdXRoZW50aWNhdGlvbg0KJmd0OyYjMzI7cGVyJiMzMjtzdWdnZXN0aW9uJiMzMjtmcm9tJiMz
Mjt0aGUmIzMyO3ByZXZpb3VzJiMzMjt0aHJlYWQ6DQomZ3Q7JiMzMjtodHRwczovL3VybGRlZmVu
c2UuY29tL3YzL19faHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1l
ZGlhdGVrX187ISFDVFJOS0E5d01nMEFSYnchbWQ2eFVpWU44OEQyWW1FVHM4RlFnYUV4TTJ6SDhT
MVNtQUVVOUdSY2h3cE5zWE95REZ1bDN6aVZLaFJwQ0phajhSY24tZ3ZNLTgwMXJ1bmp3QSYjMzY7
JiMzMjsNCiZndDsmIzMyOy9wYXRjaC8yMDI0MDIwNTA1NTA1NS4yNTM0MC0zLW1hYy5zaGVuQG1l
ZGlhdGVrLmNvbS8NCiZndDsmIzMyOw0KJmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO21hYy5z
aGVuJiMzMjsmbHQ7bWFjLnNoZW5AbWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYjMzI7LS0tDQoNCltz
bmlwXQ0KDQomZ3Q7JiMzMjsrc3RhdGljJiMzMjtpbnQmIzMyO2RwX3R4X2hkY3AyeF9lbmFibGVf
YXV0aChzdHJ1Y3QmIzMyO210a19oZGNwX2luZm8mIzMyOypoZGNwX2luZm8sJiMzMjtib29sJiMz
MjtlbmFibGUpDQomZ3Q7JiMzMjsrew0KJmd0OyYjMzI7K3N0cnVjdCYjMzI7bXRrX2RwJiMzMjsq
bXRrX2RwJiMzMjs9JiMzMjtjb250YWluZXJfb2YoaGRjcF9pbmZvLCYjMzI7c3RydWN0JiMzMjtt
dGtfZHAsJiMzMjtoZGNwX2luZm8pOw0KJmd0OyYjMzI7K3UzMiYjMzI7dmVyc2lvbjsNCiZndDsm
IzMyOytpbnQmIzMyO3JldDsNCiZndDsmIzMyOysNCiZndDsmIzMyOytkcF90eF9oZGNwMnhfc2V0
X2F1dGhfcGFzcyhoZGNwX2luZm8sJiMzMjtlbmFibGUpOw0KJmd0OyYjMzI7K2lmJiMzMjsoIWVu
YWJsZSkmIzMyO3sNCiZndDsmIzMyOytyZXQmIzMyOz0mIzMyO3RlZV9oZGNwX2VuYWJsZV9lbmNy
eXB0KGhkY3BfaW5mbywmIzMyO2VuYWJsZSwmIzMyO0hEQ1BfTk9ORSk7DQomZ3Q7JiMzMjsraWYm
IzMyOyhyZXQpDQomZ3Q7JiMzMjsrcmV0dXJuJiMzMjtyZXQ7DQomZ3Q7JiMzMjsrbXRrX2RwX3Vw
ZGF0ZV9iaXRzKG10a19kcCwmIzMyO01US19EUF9FTkMwX1AwXzMwMDAsJiMzMjswLCYjMzI7SERD
UF9GUkFNRV9FTl9EUF9FTkMwX1AwKTsNCiZndDsmIzMyOysNCiZndDsmIzMyOytyZXR1cm4mIzMy
OzA7DQomZ3Q7JiMzMjsrfQ0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7K2lmJiMzMjsoSERDUF8yXzJf
SERDUDFfREVWSUNFX0NPTk5FQ1RFRChoZGNwX2luZm8tJmd0O2hkY3AyX2luZm8uaGRjcF9yeC5y
ZWN2aWRfbGlzdC5yeF9pbmZvWzFdKSkNCiZndDsmIzMyOyt2ZXJzaW9uJiMzMjs9JiMzMjtIRENQ
X1YxOw0KDQpkcF90eF9oZGNwMnhfZW5hYmxlX2F1dGgoKSYjMzI7aXMmIzMyO2NhbGxlZCYjMzI7
b25seSYjMzI7d2hlbiYjMzI7SERDUCYjMzI7Mi54LCYjMzI7YnV0JiMzMjtoZXJlJiMzMjtkZXRl
Y3QmIzMyO3RoYXQmIzMyO3ZlcnNpb24mIzMyO2lzJiMzMjsxLg0KSSYjMzI7ZG9uJiMzOTt0JiMz
Mjtrbm93JiMzMjt0aGUmIzMyO3NwZWNpZmljYXRpb24mIzMyO29mJiMzMjtIRENQLCYjMzI7aXMm
IzMyO3RoaXMmIzMyO2lzJiMzMjthbiYjMzI7ZXJyb3ImIzMyO2Nhc2UmIzYzOw0KT3ImIzMyO2lm
JiMzMjt0aGlzJiMzMjtpcyYjMzI7YSYjMzI7bm9ybWFsJiMzMjtjYXNlLCYjMzI7cGxlYXNlJiMz
MjthZGQmIzMyO3NvbWUmIzMyO2NvbW1lbnQmIzMyO2hlcmUmIzMyO3RvJiMzMjtleHBsYWluJiMz
Mjtmb3ImIzMyO3NvbWVvbmUmIzMyO3dobyYjMzI7ZG9uJiMzOTt0JiMzMjtrbm93JiMzMjtIRENQ
JiMzMjtzcGVjaWZpY2F0aW9uLg0KDQpSZWdhcmRzLA0KQ0sNCg0KJmd0OyYjMzI7K2Vsc2UmIzMy
O2lmJiMzMjsoSERDUF8yXzJfSERDUF8yXzBfUkVQX0NPTk5FQ1RFRA0KJmd0OyYjMzI7KyhoZGNw
X2luZm8tJmd0O2hkY3AyX2luZm8uaGRjcF9yeC5yZWN2aWRfbGlzdC5yeF9pbmZvWzFdKSkNCiZn
dDsmIzMyOyt2ZXJzaW9uJiMzMjs9JiMzMjtIRENQX1YyOw0KJmd0OyYjMzI7K2Vsc2UNCiZndDsm
IzMyOyt2ZXJzaW9uJiMzMjs9JiMzMjtIRENQX1YyXzM7DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsr
cmV0JiMzMjs9JiMzMjt0ZWVfaGRjcF9lbmFibGVfZW5jcnlwdChoZGNwX2luZm8sJiMzMjtlbmFi
bGUsJiMzMjt2ZXJzaW9uKTsNCiZndDsmIzMyOytpZiYjMzI7KHJldCkNCiZndDsmIzMyOytyZXR1
cm4mIzMyO3JldDsNCiZndDsmIzMyOyttdGtfZHBfdXBkYXRlX2JpdHMobXRrX2RwLCYjMzI7TVRL
X0RQX0VOQzBfUDBfMzAwMCwNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjtIRENQX0ZSQU1FX0VO
X0RQX0VOQzBfUDAsJiMzMjtIRENQX0ZSQU1FX0VOX0RQX0VOQzBfUDApOw0KJmd0OyYjMzI7Kw0K
Jmd0OyYjMzI7K3JldHVybiYjMzI7MDsNCiZndDsmIzMyOyt9DQomZ3Q7JiMzMjsrDQoNCjwvcHJl
Pg0KPC9wPjwvYm9keT48L2h0bWw+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioq
KioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioqKioqKioq
KioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5j
bHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFy
eSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVy
IGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRv
IHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpk
aXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFp
bCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVudChz
KSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFy
ZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlIA0K
dGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlm
eSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwg
ZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55
IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUg
Y29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8
L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_004_1241841978.163672775--

