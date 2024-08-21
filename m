Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F38359592A4
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 04:15:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD48210E534;
	Wed, 21 Aug 2024 02:15:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Fd4q17AE";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="XFKN49DC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1044710E534
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 02:14:59 +0000 (UTC)
X-UUID: 27991f265f6311ef8b96093e013ec31c-20240821
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=/igfZVNI+magbGITYp1s3jWWX9+VtwbphR+sVwGqLSE=; 
 b=Fd4q17AElrcI3E38FGXGfWlv0dHr/44aGMNcEtgHxNFZ6wsaAC3qJZsR9tE8oThlc+RKSdis/tmyEdCNbPmNIYFKdBbT1wBMx31fKMEKkMjiIgBj1q8g3WU00RsN02POHaq0TollmEPkr56UShU7eiw/JBM2f6BmzlcpXk8dhlM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:ae09f4b7-496f-44a1-bf81-bb27044a5ab5, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6dc6a47, CLOUDID:fdb4ebce-7921-4900-88a1-3aef019a55ce,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
 l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 27991f265f6311ef8b96093e013ec31c-20240821
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 713384904; Wed, 21 Aug 2024 10:14:54 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 21 Aug 2024 10:14:53 +0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 21 Aug 2024 10:14:53 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zEzipHtGC9dq5Uw9lYfkGXjKlI7tJSM2PuluLbJUbcPURwRM7irToMNAQ7dxCnWZqNX4OnOYKszdtr277gXh1OSt2nQ+eyfZrQ/lNP7ta4lzmtNC0vnce9Hs+WpjOu+0S3rDXJJ1yUo7xDwGki6ir6lf6EdlRo7TisPl4uhex+GFSR26umzXbpPTnLBmXKzNFsaxbvAPMFH6j6pqC5vPa69t5q4GM6ByL0aQiEtKeaiysUEAEDPUmqSiAoQ6vIMidvq9ZQU5eRNE+ScRfSocMnqsPUK5FGG/squmCe+KZOihEOAK3LjkCg2cY4ynWNBwKxfUTcid1zhNAocmU2r0Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+4K34xbP1saMiRmzgO6F+WCcnMIZ+K3X2xv05HIdNgs=;
 b=fr953JsV475pj3pl0f7xw64P4UuBb3TPnW6GDtPeBBvlY2YOn4fNGNv71YlbXt3liDdNPz3BJ80TjmyFav7P9+LUZd4L7JQtBWcCJpgLPzRFClb9G6oNuXe25v1CGcICGAt58KkJrg4EDeU+vCJEHcyEYgZ2Ktl8v7aShf7l2J2E0Ob3pygUbfrXOjhMHcGLZRj6bOjvx3wMB9SuZMt34dAPolyQH2R/mWrJGhtoxkRQ6qPNRmnULXxH1YnNr11Vr144gl078DQG0UUGNhN/7JZmyLZExCCoTdA1tjZ+Bc5XsXSrwOe/W4bycQ5YUPTwdrVrjrMzn/ejDjehKlmrDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+4K34xbP1saMiRmzgO6F+WCcnMIZ+K3X2xv05HIdNgs=;
 b=XFKN49DCg+FYfGnkA1LRhrWt5WIVuHjrkZUKWRBiNpUuAqnnSflQODgtvqOTOJodgzQNS1s+4HiZfTpwQNdQV3knOzUxpLSlfnVqDAsZsl9+kEx/z7GV3sVFJWywE8rTfeFqdFzNEpsiBjFvA1stYfdwBjD2VZqRpP/4gexFuuA=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TY0PR03MB8299.apcprd03.prod.outlook.com (2603:1096:405:13::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Wed, 21 Aug
 2024 02:14:51 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.7875.023; Wed, 21 Aug 2024
 02:14:51 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "kdipendra88@gmail.com"
 <kdipendra88@gmail.com>, "airlied@linux.ie" <airlied@linux.ie>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: drivers: gpu: drm: mediatek: Fix warning: Using
 plain integer as NULL pointer in mtk_drm_gem.c
Thread-Topic: [PATCH] staging: drivers: gpu: drm: mediatek: Fix warning: Using
 plain integer as NULL pointer in mtk_drm_gem.c
Thread-Index: AQHa6xWlAeU8ccMBQke7Te6UfEbf+LIxCaIA
Date: Wed, 21 Aug 2024 02:14:51 +0000
Message-ID: <952d3e1711e873d95e25ed8f08c330e803b9b5f9.camel@mediatek.com>
References: <20240810110724.174338-1-kdipendra88@gmail.com>
In-Reply-To: <20240810110724.174338-1-kdipendra88@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TY0PR03MB8299:EE_
x-ms-office365-filtering-correlation-id: 682e1d9d-7f07-4df0-74de-08dcc1870a47
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?cEd6cW9QV0lkdTFDNW5xTzExUENCbEg5M21NSGJTM1U4bkorTURHUlloL3NK?=
 =?utf-8?B?a3FiR25sZnltdDlIOEFkcFdZRXhnTTBBditEQjJSVHFKZlVlcjhPMjh1Ym9R?=
 =?utf-8?B?MW9oUVdKNVFRWFFhaHU4YVZvN3E1bklQV3QvNXZxYTJWTU9laXZ2eWt6K0d5?=
 =?utf-8?B?bnE5NlZmTDNHUnVKQStNbU81Z1RUOGU3OEdBU3JhU3hOZ3FPWlpudUhVU2JE?=
 =?utf-8?B?WDBpL2NNUURjMnltZSs1dHhpdWdGaDB0b0daakU5MUl2TTBVQmRySUdiSWhW?=
 =?utf-8?B?djB5VVB2bkdVQUNGaDQ3Y0Nna3d5M0pxemhpWmszSHEwd0NmQWNiUnpoNndv?=
 =?utf-8?B?K2xtNGJYQzZWdWF6QWNOT0ZzQ1p4dkw5aFp4ekRoRWcxVytSWjkrVVNTTzNv?=
 =?utf-8?B?c2RDbDBtYlVQdU1vbjRUOUYxelVPTGpWYWdiZ0Z6b2VhdldVdWw0TEJ2Vnkw?=
 =?utf-8?B?NmJJN0pkRTNaZFRwZE4rT0ZVeFFRb1pOd3VtdXlqcFJmRFZNV2ZXNy8zM3Y3?=
 =?utf-8?B?cFZIM0JwWS9JRFl1c1dsbTZHb2ZPcU9IWVYrR1M0VFdVdDFtckUwN2dvTjhX?=
 =?utf-8?B?TnRRUS85TGJ1WEEybWIyS0s0SFdzYWNNSW5CZFhDZS81VVAzT2VUMnFkZXNr?=
 =?utf-8?B?cGFRT0pJMys5blZJRktyNzY1b1ZTQTZJaW4wZEcrWXdGNE4xMUMrUzNQdTFN?=
 =?utf-8?B?YVZrbzJtai9lS1ZwK3h4VDRTY01ONU9BWFJOY2E5UUJPYzhmZUhqVXp5RWJ5?=
 =?utf-8?B?bFFEWnUzL1BsUEg5ZXNwMTcxa3BLa0IrU2loQW5UdWM3bmtsL0RTT0llN1N4?=
 =?utf-8?B?Q1JHU2Uxb1YvbHdCMnY2dFFzRmpLL29GUHR6R09paC9yNlZyMW5od3BaZ2Zh?=
 =?utf-8?B?L0wzV1Zlc2FMMTZRN3A1TExTR3JHK01oblE3eTN1OU54VzhvcC9PUUdBdHgz?=
 =?utf-8?B?REdqN1pzTlR4YlBTWlVFa1hLT0dlQ2dtZ3Y1c011R2ttTzFMeE13bEl0N1Vk?=
 =?utf-8?B?TEN2TkxpSEFnTCtlM0RSOStobEpnUUtaa29sUnJZVmNRazZNK2VuM2E5c2Ix?=
 =?utf-8?B?a3RuazcxMzl2dEh5VUNsSnlKSTJsYlpzNGQ2WWVWRk1WekNHL1N1SzM0Rng1?=
 =?utf-8?B?RWIyWE02aS80VWlmd2ozR1RmeklEV21CV1pxMERaZFhQdzVWWEJSYmU1aWlT?=
 =?utf-8?B?bG9tbkdrUnZHS1BMUG4vZzRnSURNS044Z0YwaFkwNkIzY2s0UXVhSW56SXJC?=
 =?utf-8?B?U05oWUZDWlNyZnRTMFQxSzJRZGpodDd3OStHdnN0byt1ei9UL2xVM051ZzlP?=
 =?utf-8?B?SGFYR3FvdFY5c0dUV3pYbm4xOFZPeVpBOE5QQ2hGZFNjdmF2UFpxemh1MVgz?=
 =?utf-8?B?b0t4WCt3eFJta2Rsd1BqMlRYSE5rYmREYkpPVFk5S0dZeEdVakFTKzFINm16?=
 =?utf-8?B?WGFTSW1rQ1F0NjVVK0x0NHk5UW5hb1hQakRGai82S3RYQmJWNDIzYWM1RGFu?=
 =?utf-8?B?bTRJWmZrL3lreUtkNlFKZkVIVG9NL0VQcUNoZVFzaTNFZ2J5WXdzUWNNYXlM?=
 =?utf-8?B?d1ZYaVlOTTJRaDNrTWpKRTlGaFpYd3g1SlVxUGNWODNIbE9lZDg4ZlY5dXBV?=
 =?utf-8?B?WldReklDMzN0L3ZFWDdvajd4aDBxSTdkdCtwYVZuREJvcnJPVWsyemhTNXlt?=
 =?utf-8?B?cUQ2eVZ5QjV2TWpVb0E5V0VJK0tya25OM1ZhVW1LMVBwRU8rcDhaaFRNK3I2?=
 =?utf-8?B?KzgyaWpKamF0cldVQm1qUlRCZFNNT3Nldms1bFRRd0E2WFk4ZjhTVWEzYTI5?=
 =?utf-8?B?Z0RnS3ZVTUMxckFZb0Q3U1dTMnRkQUU3bXJYZVRJUEVQZ0pRTVZRRDI1UEhw?=
 =?utf-8?B?b1BZOWd6Q0x0Q3BMMUdycW1zU1lHbGpXNElRbTdpbTRJQWc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UU0zTFRHd01NQUdGYlhML0xTUnR5WDlkeFlxZXdZSzJsU2MwMW5uQzB5MmNO?=
 =?utf-8?B?eUlzdS8rSkxmU1ZRd1FPc1R5b0ZhbmR5TWh1UlowZVVjZnQ0S29JaHNvdU9n?=
 =?utf-8?B?Q0ZScFBUViszWUNLUVVleFJSMjVQUGJmWnhMRnVnNUFaU3RGY2h6RVFMcDU2?=
 =?utf-8?B?SDRCSVQxZHoxbW1EZGpqMTg1eHUyRlIyR3RnZ01Oem1NenZnYlpZUS9jL3R4?=
 =?utf-8?B?RStIbDR1Y1MyMTkxL1dFQW93Wm12L2tNM3JPWnA2VnY2UUFUUGVNMWdOSWt0?=
 =?utf-8?B?Ty9IbHUvTFltdkdMZ0Z3OURpbDJ5NVdtbDdUVzlxQldQQnBYNlB1UXVPbWt3?=
 =?utf-8?B?ZTl4aVlIMVBPL2VhSWhyWmJDcFZBNFRhNHFWM1hLaWNseVJWMVI4QVhoTmpj?=
 =?utf-8?B?aXpEN2h0YTB5bWEyZ1dDNmJ6WCtjd3VDZUZscHUxV3ZEbnEvckFQQ1lWVDVx?=
 =?utf-8?B?d0REOFZIMktyTlpDdFEyWXl5WDdINkNvVk9wTWxzRU1sQ085dGR4b0xqcDBX?=
 =?utf-8?B?cHlRLzJYaHN5RWhMeGxkUjRtazd6a2lLOEFhQ2VFNFpnMEUvVzRIa1plY01Y?=
 =?utf-8?B?a0RFdXhxK3c0QkdJa1NDK3NWM2NJU3lMeHN5OWxURzlzZUg1T2hNSzhxV2Jz?=
 =?utf-8?B?QkVMMFdIc0t6eDdnSkNQWEpsc2Myc1JQSGJwc2ttbFpwNGlpU3R0RW13VFZh?=
 =?utf-8?B?UEtBSDZKaWZtUlhXV2VKVEIzbjRoZTd4OVVXdUNuMGxQUk1JMHZlNFQ1d0xQ?=
 =?utf-8?B?YlJQbC9vOUZVbS94MTlHYnkyQy96c0U3SEFZMUE2VjVZVUZodEdqdktBUFJp?=
 =?utf-8?B?dWIrdnQ2RTVjdmZjcC9aRklMeDBOeU9xRjQwWXFhN1ExUWRybWJVYjBMeFpi?=
 =?utf-8?B?YW9rVEtiUXpyZnUxbHM5ajJuSG9BOWFPbHhPdURFUXkwMGxVTVF3L1p6Mm42?=
 =?utf-8?B?TGY1akVUcUhibnlNNkwvdkFOd0w5eGhQMTVzcUhKSUo4S1ZMeGo2YzJvbTha?=
 =?utf-8?B?ZGxBSm5vUkZWWHQ4KzBKM3V1bzdFQzYrN1NnVXVjN2RGZlVDUlpOWEpFdExU?=
 =?utf-8?B?ZWVqcUI0Mkxha2s3UU4yM1FOT0ZKKytiMjZLRERjSTVaTkU3NjJCN0dmdkdS?=
 =?utf-8?B?bzlVVUtFREJ2N2RZYzdFcENPZ2ovSTZEYm9IZTdQM09hTzhuMUFaVm9PTyth?=
 =?utf-8?B?RmhFY09iUmRxMkxrZ0ZYT3ZsU3Awa3N3czVSeXRzVUl5NlhRSHQ4VDJJcXZ3?=
 =?utf-8?B?aGVJNHJpQkFIMUlkTkovcEVrMkNKbmd1aXBKRzRtZzVMbnFGVnpvMmh3enlP?=
 =?utf-8?B?ZDRyMjR3dzNVcEhXakJpUVMwcDVrSmtHRWpaV3NiclBwdGI0K0NScEN5bllz?=
 =?utf-8?B?Z2U0VjVJYnVrS0J3d0RjaWkwUW1hSmtSZFJNbUpEQTNBSkdBVHUrUmxsVXMw?=
 =?utf-8?B?SzYrQlNmLzZhREFWbHMzSXVFbld3amhiek9vVWlQbEtGOE14Y0dINklyelFV?=
 =?utf-8?B?N3VqMXJ2d0FlZ2RCdUo3QW16NW9LaExmZDlpNW00NC9KSWhEMTBaeFhvSE5o?=
 =?utf-8?B?NHgwL1ZaengxV1dwOVNEQndLYW1hZG9jajduVXhBRHRId2Y5LzZ0MGVzVDlZ?=
 =?utf-8?B?YjkxeDl2SFN6cVpZOExyd2crMVZnWHY5aWFsTU9ucHRVR2Q2MkZ5MXlyUWI4?=
 =?utf-8?B?WGhCbXRuOHQvVGRFL2o4K3JEaHdmUkVqVldud1RaUmlZZS9WMkdMSVpyNzNL?=
 =?utf-8?B?N1hTMFpzdTEweW54MGoxU0NSaUdjUFNPN3FNVURoZGRKWVdyUDdRMnYxOWtx?=
 =?utf-8?B?ekNFY29QaTVPZFp0ZXFWY0FsVlBpcWpHb1ltQmRVdHNaaXZua045ZUhDY1V0?=
 =?utf-8?B?cGJmbkpPcXI1N200R29nRFVZN2tUTDJ0Y1h3cWNyRzI3ZU9vOUVaUlg2bVdk?=
 =?utf-8?B?SGs3RFdtN3ozVnZYUzRoWUhwSmRvTWNxZFNxSVBkVXRiOGJCZUZicnY5M28y?=
 =?utf-8?B?OUZGN2h2cmJIOUZrRTZHS1JVQWx2M0Z5dUhXN0VPZktpa1FlU1k4eHVWWll4?=
 =?utf-8?B?Rnp3U3JrWTZkbVZ6d29LaTdldkU5R1JqaHlyYklvQitBdTlYWWk3QjV2Q3ht?=
 =?utf-8?Q?1QBG+LC/B3VkLBIXrYEi3inVm?=
Content-ID: <923E79C930D28040AE335373494AF705@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 682e1d9d-7f07-4df0-74de-08dcc1870a47
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2024 02:14:51.6643 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oNRUr+kXFzq+ijIQOtJZZAS0jhhfny2gXUjrcs91klVR56dTTf80XK369nqXrQd/C78nyVuCAyeSfAVI8eJb2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB8299
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_008_680076926.216399817"
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

--__=_Part_Boundary_008_680076926.216399817
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIERpcGVuZHJhOg0KDQpPbiBTYXQsIDIwMjQtMDgtMTAgYXQgMTE6MDcgKzAwMDAsIERpcGVu
ZHJhIEtoYWRrYSB3cm90ZToNCj4gIAkgDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5v
dCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsIHlvdSBoYXZlIHZlcmlmaWVk
IHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+ICBzcGFyc2UgcmVwb3J0ZWQgZm9sbG93aW5n
IHdhcmtpbmc6DQo+IA0KPiAnJycNCj4gZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1f
Z2VtLmM6MjkwOjI3OiB3YXJuaW5nOiBVc2luZyBwbGFpbiBpbnRlZ2VyIGFzIE5VTEwgcG9pbnRl
cg0KPiAnJycNCj4gDQo+IFRoaXMgcGF0Y2ggY2hhbmdlcyBpbnRlZ2VyIDAgdG8gTlVMTC4NCg0K
SW4gbGF0ZXN0IGtlcm5lbCBbMV0sIHRoaXMgaGFzIGJlZW4gZml4ZWQuDQoNClsxXSBodHRwczov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5n
aXQvdHJlZS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2dlbS5jP2g9djYuMTEtcmM0I24y
ODYNCg0KQW5kIGl0J3MgZml4ZWQgaW4gbGFzdCB5ZWFyLiBTbyByZW1lbWJlciB0byBzZW5kIHBh
dGNoIGJhc2VkIG9uIGxhdGVzdCBrZXJuZWwuDQoNClJlZ2FyZHMsDQpDSw0KDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBEaXBlbmRyYSBLaGFka2EgPGtkaXBlbmRyYTg4QGdtYWlsLmNvbT4NCj4gLS0t
DQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9nZW0uYyB8IDIgKy0NCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2dlbS5jIGIvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcm1fZ2VtLmMNCj4gaW5kZXggZjhmZDhiOThjMzBlLi44ODVj
ZTZhYzdiYWQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJt
X2dlbS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2dlbS5jDQo+
IEBAIC0yODcsNiArMjg3LDYgQEAgdm9pZCBtdGtfZHJtX2dlbV9wcmltZV92dW5tYXAoc3RydWN0
IGRybV9nZW1fb2JqZWN0ICpvYmosIHZvaWQgKnZhZGRyKQ0KPiAgCQlyZXR1cm47DQo+ICANCj4g
IAl2dW5tYXAodmFkZHIpOw0KPiAtCW10a19nZW0tPmt2YWRkciA9IDA7DQo+ICsJbXRrX2dlbS0+
a3ZhZGRyID0gTlVMTDsNCj4gIAlrZnJlZShtdGtfZ2VtLT5wYWdlcyk7DQo+ICB9DQo+IC0tIA0K
PiAyLjQzLjANCj4gDQo=

--__=_Part_Boundary_008_680076926.216399817
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtEaXBlbmRyYToNCg0KT24mIzMyO1NhdCwm
IzMyOzIwMjQtMDgtMTAmIzMyO2F0JiMzMjsxMTowNyYjMzI7KzAwMDAsJiMzMjtEaXBlbmRyYSYj
MzI7S2hhZGthJiMzMjt3cm90ZToNCiZndDsmIzMyOyYjMzI7JiMzMjsNCiZndDsmIzMyO0V4dGVy
bmFsJiMzMjtlbWFpbCYjMzI7OiYjMzI7UGxlYXNlJiMzMjtkbyYjMzI7bm90JiMzMjtjbGljayYj
MzI7bGlua3MmIzMyO29yJiMzMjtvcGVuJiMzMjthdHRhY2htZW50cyYjMzI7dW50aWwmIzMyO3lv
dSYjMzI7aGF2ZSYjMzI7dmVyaWZpZWQmIzMyO3RoZSYjMzI7c2VuZGVyJiMzMjtvciYjMzI7dGhl
JiMzMjtjb250ZW50Lg0KJmd0OyYjMzI7JiMzMjtzcGFyc2UmIzMyO3JlcG9ydGVkJiMzMjtmb2xs
b3dpbmcmIzMyO3dhcmtpbmc6DQomZ3Q7JiMzMjsNCiZndDsmIzMyOyYjMzk7JiMzOTsmIzM5Ow0K
Jmd0OyYjMzI7ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZ2VtLmM6MjkwOjI3OiYj
MzI7d2FybmluZzomIzMyO1VzaW5nJiMzMjtwbGFpbiYjMzI7aW50ZWdlciYjMzI7YXMmIzMyO05V
TEwmIzMyO3BvaW50ZXINCiZndDsmIzMyOyYjMzk7JiMzOTsmIzM5Ow0KJmd0OyYjMzI7DQomZ3Q7
JiMzMjtUaGlzJiMzMjtwYXRjaCYjMzI7Y2hhbmdlcyYjMzI7aW50ZWdlciYjMzI7MCYjMzI7dG8m
IzMyO05VTEwuDQoNCkluJiMzMjtsYXRlc3QmIzMyO2tlcm5lbCYjMzI7WzFdLCYjMzI7dGhpcyYj
MzI7aGFzJiMzMjtiZWVuJiMzMjtmaXhlZC4NCg0KWzFdJiMzMjtodHRwczovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2dlbS5jJiM2MztoPXY2LjExLXJjNCNuMjg2DQoNCkFu
ZCYjMzI7aXQmIzM5O3MmIzMyO2ZpeGVkJiMzMjtpbiYjMzI7bGFzdCYjMzI7eWVhci4mIzMyO1Nv
JiMzMjtyZW1lbWJlciYjMzI7dG8mIzMyO3NlbmQmIzMyO3BhdGNoJiMzMjtiYXNlZCYjMzI7b24m
IzMyO2xhdGVzdCYjMzI7a2VybmVsLg0KDQpSZWdhcmRzLA0KQ0sNCg0KJmd0OyYjMzI7DQomZ3Q7
JiMzMjtTaWduZWQtb2ZmLWJ5OiYjMzI7RGlwZW5kcmEmIzMyO0toYWRrYSYjMzI7Jmx0O2tkaXBl
bmRyYTg4QGdtYWlsLmNvbSZndDsNCiZndDsmIzMyOy0tLQ0KJmd0OyYjMzI7JiMzMjtkcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9nZW0uYyYjMzI7fCYjMzI7MiYjMzI7Ky0NCiZndDsm
IzMyOyYjMzI7MSYjMzI7ZmlsZSYjMzI7Y2hhbmdlZCwmIzMyOzEmIzMyO2luc2VydGlvbigrKSwm
IzMyOzEmIzMyO2RlbGV0aW9uKC0pDQomZ3Q7JiMzMjsNCiZndDsmIzMyO2RpZmYmIzMyOy0tZ2l0
JiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2dlbS5jJiMzMjtiL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2dlbS5jDQomZ3Q7JiMzMjtpbmRleCYjMzI7Zjhm
ZDhiOThjMzBlLi44ODVjZTZhYzdiYWQmIzMyOzEwMDY0NA0KJmd0OyYjMzI7LS0tJiMzMjthL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2dlbS5jDQomZ3Q7JiMzMjsrKysmIzMyO2Iv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZ2VtLmMNCiZndDsmIzMyO0BAJiMzMjst
Mjg3LDYmIzMyOysyODcsNiYjMzI7QEAmIzMyO3ZvaWQmIzMyO210a19kcm1fZ2VtX3ByaW1lX3Z1
bm1hcChzdHJ1Y3QmIzMyO2RybV9nZW1fb2JqZWN0JiMzMjsqb2JqLCYjMzI7dm9pZCYjMzI7KnZh
ZGRyKQ0KJmd0OyYjMzI7JiMzMjtyZXR1cm47DQomZ3Q7JiMzMjsmIzMyOw0KJmd0OyYjMzI7JiMz
Mjt2dW5tYXAodmFkZHIpOw0KJmd0OyYjMzI7LW10a19nZW0tJmd0O2t2YWRkciYjMzI7PSYjMzI7
MDsNCiZndDsmIzMyOyttdGtfZ2VtLSZndDtrdmFkZHImIzMyOz0mIzMyO05VTEw7DQomZ3Q7JiMz
MjsmIzMyO2tmcmVlKG10a19nZW0tJmd0O3BhZ2VzKTsNCiZndDsmIzMyOyYjMzI7fQ0KJmd0OyYj
MzI7LS0mIzMyOw0KJmd0OyYjMzI7Mi40My4wDQomZ3Q7JiMzMjsNCg0KPC9wcmU+DQo8L3A+PC9i
b2R5PjwvaHRtbD48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiogTUVE
SUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZSAqKioqKioqKioqKioqKioqKioqKg0KVGhlIGlu
Zm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55
IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxl
Z2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJs
ZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2ln
bmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlv
biwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRp
bmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmlj
dGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBp
bnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUgDQp0aGF0IHlvdSBo
YXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5k
ZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55
IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNobWVu
dHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50IG9m
IHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSENCjwvcHJlPjwhLS19
LS0+

--__=_Part_Boundary_008_680076926.216399817--

