Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GhBQEgJEgGkE5gIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 07:28:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0DEC8A7C
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 07:28:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93CA410E034;
	Mon,  2 Feb 2026 06:28:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Ygm9gD5z";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="Bxmx0Ajh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B35B610E267
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 06:28:13 +0000 (UTC)
X-UUID: 57866060000011f185319dbc3099e8fb-20260202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=57Dy3MBGAbyuT+9cfGvdcmusIneHGQQNvmKWK0BEIe0=; 
 b=Ygm9gD5zy/sMxT2CMcGa8d9p2TqhGEUm0YnTx8yKmqUttDAHh5qsUZ9w/T75M+QikQbFwFcxB3FG8gIq+9O1zSboyAmBN5kNzHh/TD5njC7NIMSp+DCXDnBgx3/TmxbSFoG9GA2PJNs2o0XSYvQzUxCFfjqM3Sbd2t6xPjyIckk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11, REQID:56712937-f94b-433a-8969-f1b1810a981c, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:89c9d04, CLOUDID:136634e9-ef90-4382-9c6f-55f2a0689a6b,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
 TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:99|80|1,File:130,RT:0,Bulk:nil,QS:
 nil,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC
 :0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 57866060000011f185319dbc3099e8fb-20260202
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1806787447; Mon, 02 Feb 2026 14:28:09 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 2 Feb 2026 14:28:07 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 2 Feb 2026 14:28:07 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GVv81cadB0aCx4jMsuoHXjEsyJKvfkaI/4004Lnxykw4pGlyEcawoWECkWImukksQIseGei/JAAk7uSJ9xmHssSesHeXBfjJlCxnmXS02RwZ1Tvy6NICt5288PMkLo1yz91M0QQVv8/oSJm4b93cin7ik33z7e0DSzF77KVMUzOLG7d8tolZbDRg0Iw32/Jf1VeqRGmWERhS4RbJJ7P83YFxKOZ9sYB8DnWBzhkOvsFJDMJtYrT2m3tLz43i0WTP9eq4IGG/i0hmHM88ZgI7283K8DlMrqwx+dqwnfC+nhVU9j45gT1Z5+HXHqR5f+gGKx4sIeq2RoUjxCahApKzIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z3SlKBMIG89Try07ilabad3tX2iJkKZqBA5/u+/Qi0Y=;
 b=V3Z1qYrebqnhUXKXBfIJRRMnQc15E8o4NwOi2JfWqohN1qL4Rcj4B633KJAGkmGNBsUwNvPApPV2Z6h79sW0qkt3orJMvxKWJkwqGOf0PDo4tbPhHNR6xHpgc5GlHHnbuWKx4Hv9T781qPGMNPEyKTxNvyWV3II0gFrn38N+sNMGisw2Y7LzYPq5QqE/YfFb0V4CZBIVCifJPfTdcNaRVyRwLcK/J6bMBBRmKIht94mBAFcSkTKcZkSQsAWLUpagxPb0N4hc1eDwx9WaCmMgIQOeEoopk0aH3jSpsAVxKqwb5MgxqLRLQ+Ot1aUFyt+KfsM5LQdKbhVexNqy+6B0Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z3SlKBMIG89Try07ilabad3tX2iJkKZqBA5/u+/Qi0Y=;
 b=Bxmx0Ajhwzo0oz7uWeRL9rY5OKmqnVbBHtGhzWEAhjlEXI+54cdrri0QMFvo5n7/77JkUKJsNX4trXFRo68Jn+RJffD0aUOwYeBB04ikfr//xN7J2pNoE8qZ7XCAeRRDmJvKG4s+ovppIvOrPFewBjrPCbNTNyVzTOysaAu9lno=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB8781.apcprd03.prod.outlook.com (2603:1096:405:6b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 06:28:03 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 06:28:03 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "simona@ffwll.ch"
 <simona@ffwll.ch>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "greenjustin@chromium.org" <greenjustin@chromium.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, Nicolas Prado <nfraprado@collabora.com>
CC: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Daniel Stone <daniels@collabora.com>, 
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "kernel@collabora.com" <kernel@collabora.com>
Subject: Re: [PATCH RFC 2/6] drm/mediatek: plane: Correct AFBC alignment
 definition to 128
Thread-Topic: [PATCH RFC 2/6] drm/mediatek: plane: Correct AFBC alignment
 definition to 128
Thread-Index: AQHceZUoaj6YPXSdI0mhk2aBEp1JL7VvJwCA
Date: Mon, 2 Feb 2026 06:28:03 +0000
Message-ID: <454a9215a5202c681bca1f38650bb9a8b8ce7393.camel@mediatek.com>
References: <20251230-mtk-afbc-fixes-v1-0-6c0247b66e32@collabora.com>
 <20251230-mtk-afbc-fixes-v1-2-6c0247b66e32@collabora.com>
In-Reply-To: <20251230-mtk-afbc-fixes-v1-2-6c0247b66e32@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB8781:EE_
x-ms-office365-filtering-correlation-id: 13313243-18a6-410f-3915-08de62243847
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|42112799006|376014|1800799024|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?U0NDRkZtUFZ4VTN1Z0Z4L0xTUm54YXN5NGMzc0hDZzFQRGo1TnN1NFloOHNM?=
 =?utf-8?B?Mno4OEp4ZEJ5VDZUWHhsQ0JnaHBrWktsWVpJZUI3cTVMdm81SEJ5blZaeWc1?=
 =?utf-8?B?emRmNS8vaGpzWXZYelU4b1c1bFlLWnN1MUU2WHVUd01ReExPUGZDVEkzd2Z5?=
 =?utf-8?B?QktTckVnWFY0UC9JMjJEekVlTkZjNzFFZjRVLzZtcTB1T1ZYU3N0VCs1cWxM?=
 =?utf-8?B?NmZqWVZKUDUzeVVGUDhUbm5aNEpIczhlekh4cGJPU2lvNVlGQURTZEFZVDM4?=
 =?utf-8?B?VlhzdTlYSFdBYWx2QWpqd3YvVHA4SDUrbkRxeUpnQzcrSGVja0hlRjUwZWdi?=
 =?utf-8?B?WHdHMmJ2dmNaVmllMWRna3RaTTRJUVdSVWNTbWdGL25LOWR5V29SY1VURnpt?=
 =?utf-8?B?dDFhMEhOTXZ2Zy9hTnhETEg2b0tjemJodHM1R3ZVNkRxNXJUc3cwUkcxbnJY?=
 =?utf-8?B?bXIxS0JtWWZPQUVGMmNYeHV2djdQblBOSDJvTTA4dWFOdnBkQnd0emFxNjBs?=
 =?utf-8?B?T0o5aXFUUHBqVlBra3dlL3gyUjFrbWZzZFRYdUluK2pHNGJYTzdzSy9OTW5q?=
 =?utf-8?B?aW9pZHdLa2tiWHh4S3NtdWRVaEFJQ2JLWHJteVZkbDNqNThkNEFtQ2g3bGNQ?=
 =?utf-8?B?OTRib2tPdGpiNXY4Y1BSUitEOEFpMXpLUUxnYk51NlhzZ0MrUzFvNmNQU0Ny?=
 =?utf-8?B?TTNBWDNkZUdpR1pVVktZREVtY1NQRDhQYW1UaDNxcXRBWU1lTEpTNnltSm9W?=
 =?utf-8?B?QWJsY3FMRW5qYUtYMS9YUXNxU0w5MTZRcm1HRkpOeW1lM05oNS9WdHN1RGVM?=
 =?utf-8?B?WG51ZHVNSEpLUURBTG9oMVBOeHdJb0NiTGc5ZVM3UjB4aXBQMUM4ZExEWGJw?=
 =?utf-8?B?Rmk0WDU5YnErZkNOQkVCK2lTQUJhcXhQK2NZSncwYkd6VnM1UmVvdElkMW4r?=
 =?utf-8?B?TDNKcm9FNGo0VkN3UVhsS1Vxci9UTStySCs0dW9hc09XcXdCQ0NNenhFbHhD?=
 =?utf-8?B?cmdTNktZczFESUpTZFJ4ZU5zSC8zTDJpcHBOMXZFWldtWlliWm1va3ZCcWhP?=
 =?utf-8?B?QlFEaVZWTHZuRlJUY2J0Q21SNGI3aUloRlZCWWhLWkRJNWlSMzN5ZGlHd2Fq?=
 =?utf-8?B?blk2UHJ6M2FKc2hIREFRbzZVWWZ5cXF1K1gvYzNuWm1ubzZPaisrcWdxTFg0?=
 =?utf-8?B?b2JZWk8rVzNYbFZIdEpheUsrSmg4VTlTSkRLdTQ1R3RqQXBNVVc1ZHR3YVFI?=
 =?utf-8?B?VzJrQlJvWWVWVkFiOFdvU0E0RVBnVlRoTjErcFNiNFh2V3MxNi9uWCtwUytD?=
 =?utf-8?B?bnZ2b0ZCOHBZNUxZZXpCejMyNS9TWHNPY0Y5em5FUHFlTEpWZVphalRrTUVU?=
 =?utf-8?B?b3NRYnZNT2d6YitsS1B3enllVEhLREdzNDlxcllwd3k1SVpDVXp6MWRHTXVR?=
 =?utf-8?B?dDJrLzA0eDJ0eUVTdVA3bGovTU9jOStZc0EySnpSSFJHVTB5YndqL3IvcG5v?=
 =?utf-8?B?UlZ2dDJYUi9zQ21ISEc5Y1JrU1lRQ3VlL0p1WVVib0VvaTJ5QmFnbzhmZUFi?=
 =?utf-8?B?NDN2SlN3dEFnbWVSZkFzT01LT3pEMStTcExkenVFSU9kT1Vtb2NBTXNSZyt5?=
 =?utf-8?B?TnVmYkEwL2NuUXAwWkZNWTNnTXBaU2lOV0VDeWt2eVNMc0JDSWxLU0xyS3Vp?=
 =?utf-8?B?Sk82WTJJNndzY2J1ZUlRWTdJQ0Y3ZkRkc2ZEUDRXVnRLalF1Q3VmQnAzaXIy?=
 =?utf-8?B?Ri9ZQnk3YkxDUmd1dUZSUTFVN2Q5OXlKeVRRSmd5azJhMkhhQitBdm9hQlBV?=
 =?utf-8?B?MW9sUFhkeVREQWlKRzFRNHc0Qkx0dXlNRmx0ak9WcldxZk9vT2xKQ2E3amI3?=
 =?utf-8?B?cFFPY2loTHhKWEwrWnhwTkZ6QUpOcXpLRUFuUnJ1c2tsVEoxWHJwc2I5RnAv?=
 =?utf-8?B?VWtDT3VPNjhuTnhTMzRXUkJqQUtrNFo4Q0ExRWNUYzcxMmJZbWU0WGJGb2xq?=
 =?utf-8?B?VFVVVUxDeGtMUHB3dktkTy9tQWNPQ1NzZUNpckI2Uzd5ekpDK3BhZnZRVVZP?=
 =?utf-8?B?Y0pBQll5Vmx0d2tlamFaRkNaTy9LWFRPUWtVM28waXZBUmdnZ2FtcUlPTUVJ?=
 =?utf-8?Q?QuCp8aZTV151oKiOEi7E3Izda?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(42112799006)(376014)(1800799024)(366016)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VWE4blNmaDNUM0hNVStxSUhxT05YSkQzOUNndmtRVnZ3VXBmNlJOVll2amRp?=
 =?utf-8?B?TkFBaHBrWk5ZQ0ZLOFY4bFRaYXRTRUsyclh6MkpTZWtXWkZwMFlOMFE1NUsz?=
 =?utf-8?B?aFFCRTEvU2Yxc1hLZGxFdDQ3TldZU1BpLzN4S05uYUpGYjBHbDcvVkYxMWJt?=
 =?utf-8?B?SG0rVERkQkxRZ3VZUTNPempOM1hBMHFHb3NIL0RKZVhmNUp2NzZXNURueTBs?=
 =?utf-8?B?NXNyOGl6akcxLzMxeVJOaE1sbndtQkg4b0dTLytJR3VYQllQRERadTNMV0FW?=
 =?utf-8?B?VHpjUURrSzBGNWlDNXhNd2txSkJwcDRsME1NbnZaZTNyc0pKZTFQcHRRbTdF?=
 =?utf-8?B?cGpRdXM4TDE0clAwYUdhVmFzazkwYldOd2VHeDBaeFltd0Q3dnhrZFVOZVJI?=
 =?utf-8?B?TXZBNzVMZ1R2MTYwemtnVVV6bUlCSHorQ1lud0daczlUaGc0c1l5djY0M2ND?=
 =?utf-8?B?SnBlTEdWMi92UndFR1hvMmNrQ0RFZ0d6b2M5ak9GakgyYnZVdTNvNHc3YUxR?=
 =?utf-8?B?TG1pOWhQbU8vNU1ybEJ3cDdvSHk4REgyU0tkSVdLd29FNTIyWFdRZDFWTFVm?=
 =?utf-8?B?VFNiRkR5bmR5ZDBuVnZUeXZFcnk2TFhLaGkwWHh3SFpwbDViUVViRW5ZdXFM?=
 =?utf-8?B?YVpEYlA4bWpobEFFbFZpQXJVWmtUOXArcjRVb1cvc1J3Wnh0aDVidmw4Rm5L?=
 =?utf-8?B?aTZYOExkK2V1OC9tczBRemEvNXNKSU5oZ3hDU1ZGQUZEVFQvYmZJN0k5NGwv?=
 =?utf-8?B?REc5amd4ZXlFKzRLSU5wWFFEL0IzOTJ2am0veXBkUVRneGJ6NXI5UFB4NGVv?=
 =?utf-8?B?UFJYOTUzcnZlWStJdm82b09vZXZvVWR5NEpsMUdiY3FRNXhUalBYeHRYQ0R3?=
 =?utf-8?B?QTlUZllyMC9KZnNqNDFFenZUTDMydVppVEpjTFlhSGtrMzVjVzljbkw3ZHEz?=
 =?utf-8?B?SU0zRGlKdE9aWVdsWSt5M2sySEdhSzJEOGU0a2FYL1pBL0ZrZHpOL1huTW0v?=
 =?utf-8?B?MEl2czdqVnA0TXQ4SCtnd1lSck8rYzhocTFoVm5HMXd5K2RuQjRyb3p1Mnpw?=
 =?utf-8?B?YmFvanBCRUMyWnR0QjYwU1h3M1EzNG9sNllIUVNUWVErbVUyZkJmRjRWMFVD?=
 =?utf-8?B?ckFaZ2NOS3N0YkNBVFZmRmJMTEU2dGZJWExPZ0FCS3JSOE5aY21WMHRqOVZK?=
 =?utf-8?B?akpCUDJhY1lrclVSWEFJWUU0dkF6ZzgxWFVZMlVpb1lFY2x3VlhOQ0JOa0lu?=
 =?utf-8?B?eHNzVDNkSWU1T0NCWGVaZ090MzNyMTdyQVBPdCtyLzhaeWloSmpBWUhiR3ZZ?=
 =?utf-8?B?QXBWYnRMYnFYVStjamdReWpha0R5V3hMSGRTc2xzU2pLTmxqb0pWYnpDWlNH?=
 =?utf-8?B?WCtDMHgzaW10b3psRkNmeEQzRWIrc2YrUWpNb2xDWEtuNWV2TGdnZjJ1QW1y?=
 =?utf-8?B?b0lXN0h1Y3VKcmxqTlVFOThWS2lWL1EwdnNaNmFoMEQvMGFGR2xTRTF3bHBs?=
 =?utf-8?B?b0dvcUk2cU5TbUg0bFVEcnJmSm1lVS9LMXR0L2FKQWU1NC92Wi9Vci9oRllQ?=
 =?utf-8?B?ZE1kNjQ5NlBEaWFvcWY1cDJ4eWU4YkNqRWV0QVFLRlpFY0liMXJnUGt1RjdN?=
 =?utf-8?B?Vjd3L3lBVGlIbjY2YkNwSmY3QzRZOGxOV2Z4YlF2M3BZbE1aMm1XYkxDNlhP?=
 =?utf-8?B?YXBPdlhvSXhKNEgyT0NaSGlLZEc2MUplUVFKdDIzSHlHTkIvSnV1WDc3M1FF?=
 =?utf-8?B?T1RxRlIwc3FRY0JmbmptSVBpRENpZHhZTTgrY3ZCVmUrMUdtVWMydVVPdUV2?=
 =?utf-8?B?SEEySUYvaVFicUwydkhCSjBPdktEQnF1Vm9FcUZFclJPQU0zY2djcTF3Nkg0?=
 =?utf-8?B?VGxCUXJsSDJsbTFxZUxnc3JlK1IyMGtYM2NhV2RmSUw1aG9pNXFPcWVXZjBN?=
 =?utf-8?B?SVh1ai9VcTNVbHV6cTRTeTZQMkRudmlFd0lNbTdtVnl3QXFVTE5VV01MZ1l2?=
 =?utf-8?B?T2RWeS9idW5sZVIxU2ZxeXRyNFZoNnFyM1VXL3RDeVIrNnpJT3pUSlNUcW43?=
 =?utf-8?B?dlhpaVc4cllUTHd1QW9TdVh6S1JvZDRlZldyOWZSUi9SbHoreXZtcFVXbVNu?=
 =?utf-8?B?RlNuT2dITFRaVUlsR21sYmhvb0Y1MVoveTVHR3hOT1hHWjB3UkNaOXhhaDFN?=
 =?utf-8?B?YVlsdmRzd1R4VXAreWJFM2s1VmJYd3dGMGNIanpUajhLOXFha1N2L1ZLcDky?=
 =?utf-8?B?WXVpWklwcDgvejBDV0R0MTJYTmtkLy9CTHUzZkg2TEtveUFvV0Qrd3hjaEtV?=
 =?utf-8?B?MmtEb1p0MkNFQTF1WmxtcjhKL3ZZNU9Ga3gwbDJwbEo1Z2NxVzJpUT09?=
Content-ID: <036491F738FCED499AE240920DF1D935@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13313243-18a6-410f-3915-08de62243847
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2026 06:28:03.5025 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0lt3ICpLChQFNXBPaAxv5oXH/Rxd0Zc1lHFYixNUyHfWe4/TOokL9SQ9TxwS5Ta0xuqfB2kS4vDqDe40mJ/gJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8781
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_005_330366303.682866621"
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[mediatek.com:s=dk];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mediatek.com:email,mediatek.com:dkim,mediatek.com:mid,collabora.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,urldefense.com:url];
	FREEMAIL_TO(0.00)[kernel.org,ffwll.ch,collabora.com,gmail.com,chromium.org,pengutronix.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:chunkuang.hu@kernel.org,m:simona@ffwll.ch,m:angelogioacchino.delregno@collabora.com,m:airlied@gmail.com,m:greenjustin@chromium.org,m:p.zabel@pengutronix.de,m:matthias.bgg@gmail.com,m:nfraprado@collabora.com,m:ariel.dalessandro@collabora.com,m:Nancy.Lin@mediatek.com,m:linux-kernel@vger.kernel.org,m:Jason-JH.Lin@mediatek.com,m:linux-arm-kernel@lists.infradead.org,m:daniels@collabora.com,m:linux-mediatek@lists.infradead.org,m:kernel@collabora.com,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[ck.hu@mediatek.com,dri-devel-bounces@lists.freedesktop.org];
	R_DKIM_REJECT(0.00)[mediateko365.onmicrosoft.com:s=selector2-mediateko365-onmicrosoft-com];
	DKIM_TRACE(0.00)[mediatek.com:+,mediateko365.onmicrosoft.com:-];
	DMARC_POLICY_ALLOW(0.00)[mediatek.com,quarantine];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ck.hu@mediatek.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_MIXED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REDIRECTOR_URL(0.00)[urldefense.com];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9A0DEC8A7C
X-Rspamd-Action: no action

--__=_Part_Boundary_005_330366303.682866621
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIE5pY29sYXM6DQoNCk9uIFR1ZSwgMjAyNS0xMi0zMCBhdCAxMTowMyAtMDMwMCwgTsOtY29s
YXMgRi4gUi4gQS4gUHJhZG8gd3JvdGU6DQo+IFRoZSBtaW5pbXVtIGFsaWdubWVudCBmb3IgYm90
aCB0aGUgaGVhZGVyIGFuZCBkYXRhIGJ1ZmZlcnMgaW4gdGhlIEFGQkMNCj4gZm9ybWF0IGZvciBN
YWxpIEdQVXMgd2l0aCBhcmNoaWN0dXJlIHZlcnNpb24gNiBhbmQgaGlnaGVyICh3aGljaA0KPiBp
bmNsdWRlcyBNVDgxOTUncyBHNTcgKHY5KSkgaXMgMTI4LCBub3QgMTAyNCBhcyB0aGUgTWVkaWFU
ZWsgRFJNIGRyaXZlcg0KPiBjdXJyZW50bHkgZGVmaW5lcy4NCj4gDQo+IFNpbmNlIE1lc2EgZGVm
aW5lcyBpdCBhcyB0aGUgY29ycmVjdCB2YWx1ZSBvZiAxMjggWzFdLCB3aGVuIGRpc3BsYXlpbmcN
Cj4gQUZCQyBidWZmZXJzLCBzb21lIHJlc29sdXRpb25zIHdpbGwgY2F1c2UgdGhlIE9WTCBjb21w
b25lbnQgdG8gYmUNCj4gY29uZmlndXJlZCBieSB0aGUgZHJpdmVyIHdpdGggYSBkYXRhIGFkZHJl
c3MgdGhhdCBpcyBkaWZmZXJlbnQgZnJvbSB0aGUNCj4gYWRkcmVzcyB0aGF0IGFjdHVhbGx5IGNv
bnRhaW5zIHRoZSBkYXRhIGFzIHNldCBieSBNZXNhLCByZXN1bHRpbmcgaW4NCj4gY29ycnVwdGVk
IG91dHB1dCBvbiBkaXNwbGF5Lg0KDQpSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVr
LmNvbT4NCg0KPiANCj4gRml4IHRoZSBBRkJDIGFsaWdubWVudCBkZWZpbml0aW9uIGZvciB0aGUg
TWVkaWFUZWsgRFJNIGRyaXZlci4NCj4gDQo+IFsxXSBodHRwczovL3VybGRlZmVuc2UuY29tL3Yz
L19faHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2EvbWVzYS8tL2Jsb2IvMzg0OGEw
ODA1MzRhMTdjYTA3NWU5ZTk1ZGQzYTE0YWJiODAxMzlhYS9zcmMvcGFuZnJvc3QvbGliL3Bhbl9h
ZmJjLmgqTDM2NF9fO0l3ISFDVFJOS0E5d01nMEFSYnchaHg2Vkk2cGJJTmNVT1JkbFYxaVRpNy10
aUFYVXlRUFJQREF2TmpxNWVhQktsU2M4SlNlLXpRZTdXZG5XTy1HU2dMWl9fOUt4YjZWSGhBTDFG
eGckIA0KPiANCj4gRml4ZXM6IGM0MTBmYTliMDdjMyAoImRybS9tZWRpYXRlazogQWRkIEFGQkMg
c3VwcG9ydCB0byBNZWRpYXRlayBEUk0gZHJpdmVyIikNCj4gU2lnbmVkLW9mZi1ieTogTsOtY29s
YXMgRi4gUi4gQS4gUHJhZG8gPG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tPg0KPiAtLS0NCj4gIGRy
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfcGxhbmUuaCB8IDIgKy0NCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfcGxhbmUuaCBiL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfcGxhbmUuaA0KPiBpbmRleCA5NWM1ZmE1Mjk1ZDguLjQ2YmU0NDU0YmM5MiAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19wbGFuZS5oDQo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfcGxhbmUuaA0KPiBAQCAtMTMsNyArMTMsNyBA
QA0KPiAgI2RlZmluZSBBRkJDX0RBVEFfQkxPQ0tfV0lEVEggMzINCj4gICNkZWZpbmUgQUZCQ19E
QVRBX0JMT0NLX0hFSUdIVCA4DQo+ICAjZGVmaW5lIEFGQkNfSEVBREVSX0JMT0NLX1NJWkUgMTYN
Cj4gLSNkZWZpbmUgQUZCQ19IRUFERVJfQUxJR05NRU5UIDEwMjQNCj4gKyNkZWZpbmUgQUZCQ19I
RUFERVJfQUxJR05NRU5UIDEyOA0KPiAgDQo+ICBzdHJ1Y3QgbXRrX3BsYW5lX3BlbmRpbmdfc3Rh
dGUgew0KPiAgCWJvb2wJCQkJY29uZmlnOw0KPiANCg0K

--__=_Part_Boundary_005_330366303.682866621
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtOaWNvbGFzOg0KDQpPbiYjMzI7VHVlLCYj
MzI7MjAyNS0xMi0zMCYjMzI7YXQmIzMyOzExOjAzJiMzMjstMDMwMCwmIzMyO04mIzIzNztjb2xh
cyYjMzI7Ri4mIzMyO1IuJiMzMjtBLiYjMzI7UHJhZG8mIzMyO3dyb3RlOg0KJmd0OyYjMzI7VGhl
JiMzMjttaW5pbXVtJiMzMjthbGlnbm1lbnQmIzMyO2ZvciYjMzI7Ym90aCYjMzI7dGhlJiMzMjto
ZWFkZXImIzMyO2FuZCYjMzI7ZGF0YSYjMzI7YnVmZmVycyYjMzI7aW4mIzMyO3RoZSYjMzI7QUZC
Qw0KJmd0OyYjMzI7Zm9ybWF0JiMzMjtmb3ImIzMyO01hbGkmIzMyO0dQVXMmIzMyO3dpdGgmIzMy
O2FyY2hpY3R1cmUmIzMyO3ZlcnNpb24mIzMyOzYmIzMyO2FuZCYjMzI7aGlnaGVyJiMzMjsod2hp
Y2gNCiZndDsmIzMyO2luY2x1ZGVzJiMzMjtNVDgxOTUmIzM5O3MmIzMyO0c1NyYjMzI7KHY5KSkm
IzMyO2lzJiMzMjsxMjgsJiMzMjtub3QmIzMyOzEwMjQmIzMyO2FzJiMzMjt0aGUmIzMyO01lZGlh
VGVrJiMzMjtEUk0mIzMyO2RyaXZlcg0KJmd0OyYjMzI7Y3VycmVudGx5JiMzMjtkZWZpbmVzLg0K
Jmd0OyYjMzI7DQomZ3Q7JiMzMjtTaW5jZSYjMzI7TWVzYSYjMzI7ZGVmaW5lcyYjMzI7aXQmIzMy
O2FzJiMzMjt0aGUmIzMyO2NvcnJlY3QmIzMyO3ZhbHVlJiMzMjtvZiYjMzI7MTI4JiMzMjtbMV0s
JiMzMjt3aGVuJiMzMjtkaXNwbGF5aW5nDQomZ3Q7JiMzMjtBRkJDJiMzMjtidWZmZXJzLCYjMzI7
c29tZSYjMzI7cmVzb2x1dGlvbnMmIzMyO3dpbGwmIzMyO2NhdXNlJiMzMjt0aGUmIzMyO09WTCYj
MzI7Y29tcG9uZW50JiMzMjt0byYjMzI7YmUNCiZndDsmIzMyO2NvbmZpZ3VyZWQmIzMyO2J5JiMz
Mjt0aGUmIzMyO2RyaXZlciYjMzI7d2l0aCYjMzI7YSYjMzI7ZGF0YSYjMzI7YWRkcmVzcyYjMzI7
dGhhdCYjMzI7aXMmIzMyO2RpZmZlcmVudCYjMzI7ZnJvbSYjMzI7dGhlDQomZ3Q7JiMzMjthZGRy
ZXNzJiMzMjt0aGF0JiMzMjthY3R1YWxseSYjMzI7Y29udGFpbnMmIzMyO3RoZSYjMzI7ZGF0YSYj
MzI7YXMmIzMyO3NldCYjMzI7YnkmIzMyO01lc2EsJiMzMjtyZXN1bHRpbmcmIzMyO2luDQomZ3Q7
JiMzMjtjb3JydXB0ZWQmIzMyO291dHB1dCYjMzI7b24mIzMyO2Rpc3BsYXkuDQoNClJldmlld2Vk
LWJ5OiYjMzI7Q0smIzMyO0h1JiMzMjsmbHQ7Y2suaHVAbWVkaWF0ZWsuY29tJmd0Ow0KDQomZ3Q7
JiMzMjsNCiZndDsmIzMyO0ZpeCYjMzI7dGhlJiMzMjtBRkJDJiMzMjthbGlnbm1lbnQmIzMyO2Rl
ZmluaXRpb24mIzMyO2ZvciYjMzI7dGhlJiMzMjtNZWRpYVRlayYjMzI7RFJNJiMzMjtkcml2ZXIu
DQomZ3Q7JiMzMjsNCiZndDsmIzMyO1sxXSYjMzI7aHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9f
X2h0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9tZXNhL21lc2EvLS9ibG9iLzM4NDhhMDgw
NTM0YTE3Y2EwNzVlOWU5NWRkM2ExNGFiYjgwMTM5YWEvc3JjL3BhbmZyb3N0L2xpYi9wYW5fYWZi
Yy5oKkwzNjRfXztJdyEhQ1RSTktBOXdNZzBBUmJ3IWh4NlZJNnBiSU5jVU9SZGxWMWlUaTctdGlB
WFV5UVBSUERBdk5qcTVlYUJLbFNjOEpTZS16UWU3V2RuV08tR1NnTFpfXzlLeGI2VkhoQUwxRnhn
JiMzNjsmIzMyOw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtGaXhlczomIzMyO2M0MTBmYTliMDdjMyYj
MzI7KCZxdW90O2RybS9tZWRpYXRlazomIzMyO0FkZCYjMzI7QUZCQyYjMzI7c3VwcG9ydCYjMzI7
dG8mIzMyO01lZGlhdGVrJiMzMjtEUk0mIzMyO2RyaXZlciZxdW90OykNCiZndDsmIzMyO1NpZ25l
ZC1vZmYtYnk6JiMzMjtOJiMyMzc7Y29sYXMmIzMyO0YuJiMzMjtSLiYjMzI7QS4mIzMyO1ByYWRv
JiMzMjsmbHQ7bmZyYXByYWRvQGNvbGxhYm9yYS5jb20mZ3Q7DQomZ3Q7JiMzMjstLS0NCiZndDsm
IzMyOyYjMzI7ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19wbGFuZS5oJiMzMjt8JiMzMjsy
JiMzMjsrLQ0KJmd0OyYjMzI7JiMzMjsxJiMzMjtmaWxlJiMzMjtjaGFuZ2VkLCYjMzI7MSYjMzI7
aW5zZXJ0aW9uKCspLCYjMzI7MSYjMzI7ZGVsZXRpb24oLSkNCiZndDsmIzMyOw0KJmd0OyYjMzI7
ZGlmZiYjMzI7LS1naXQmIzMyO2EvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19wbGFuZS5o
JiMzMjtiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfcGxhbmUuaA0KJmd0OyYjMzI7aW5k
ZXgmIzMyOzk1YzVmYTUyOTVkOC4uNDZiZTQ0NTRiYzkyJiMzMjsxMDA2NDQNCiZndDsmIzMyOy0t
LSYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX3BsYW5lLmgNCiZndDsmIzMyOysr
KyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX3BsYW5lLmgNCiZndDsmIzMyO0BA
JiMzMjstMTMsNyYjMzI7KzEzLDcmIzMyO0BADQomZ3Q7JiMzMjsmIzMyOyNkZWZpbmUmIzMyO0FG
QkNfREFUQV9CTE9DS19XSURUSCYjMzI7MzINCiZndDsmIzMyOyYjMzI7I2RlZmluZSYjMzI7QUZC
Q19EQVRBX0JMT0NLX0hFSUdIVCYjMzI7OA0KJmd0OyYjMzI7JiMzMjsjZGVmaW5lJiMzMjtBRkJD
X0hFQURFUl9CTE9DS19TSVpFJiMzMjsxNg0KJmd0OyYjMzI7LSNkZWZpbmUmIzMyO0FGQkNfSEVB
REVSX0FMSUdOTUVOVCYjMzI7MTAyNA0KJmd0OyYjMzI7KyNkZWZpbmUmIzMyO0FGQkNfSEVBREVS
X0FMSUdOTUVOVCYjMzI7MTI4DQomZ3Q7JiMzMjsmIzMyOw0KJmd0OyYjMzI7JiMzMjtzdHJ1Y3Qm
IzMyO210a19wbGFuZV9wZW5kaW5nX3N0YXRlJiMzMjt7DQomZ3Q7JiMzMjsmIzMyO2Jvb2xjb25m
aWc7DQomZ3Q7JiMzMjsNCg0KDQo8L3ByZT4NCjwvcD48L2JvZHk+PC9odG1sPjwhLS10eXBlOnRl
eHQtLT48IS0tey0tPjxwcmU+KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkg
Tm90aWNlDQogKioqKioqKioqKioqKioqKioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQg
aW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkg
YmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpl
eGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5k
ZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4g
QW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5p
bmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRz
KSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBt
YXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9m
IHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlDQogDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMg
ZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAo
YnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9m
IA0KdGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0
ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFu
eSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_005_330366303.682866621--

