Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E55B395C2AA
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 03:08:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A5A210E6D7;
	Fri, 23 Aug 2024 01:08:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="VIoPf+ME";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="IEVvkH7t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3DC710E6D7
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 01:08:07 +0000 (UTC)
X-UUID: 254dbb3e60ec11ef8b96093e013ec31c-20240823
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=cqEAyzcTXJ5fNC9SdTB9ccHvlB1aTQZ/cEKn8qopjzM=; 
 b=VIoPf+MES0FxDjgnWEdusbGIZb6XHLIrFfo1RzEXN6V2sedj61LQqVM0W0HulooXRPdXkPlVGcbtrRrg/6EQRCGmbpokaPMDRy3HmvS61EYAUZUz6oTDQ4BKWZRrgijLmRWAZpsYr642VognKra/++C7A+sSm4wlJ0ge/en0MLI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:cb76be12-a0e5-40af-80f0-cee0f8156dc8, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6dc6a47, CLOUDID:dc7d09cf-7921-4900-88a1-3aef019a55ce,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
 l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 254dbb3e60ec11ef8b96093e013ec31c-20240823
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 773413505; Fri, 23 Aug 2024 09:08:02 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 22 Aug 2024 18:08:02 -0700
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Fri, 23 Aug 2024 09:08:02 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Td1g2u3lZq9V/Sg4Qg5dKB/+/DTvkCIiIv4bD5JAqd7mTPlTwPiCEePWhRaz0KlW1iGjvqUHjpBMnx8MWcCJb0ddaeIX/nkb409Tet6HNjzhW3qdX4KgT7mWS6RYbZSRZsv+VXUFeSrudiBa9UobFZpOZtEoZipjviTZadMwADM4kXt580ZzqjZFCvNpoGzst0ohTnlZ6eTe+MSVwqKKV2ymnUT98Gv6xTr9lKkpA++QaH7sfG6C11Aa7Il+qIC6qevlrE2yoTJNXK5XHHCxpI2wq4WMpeTiDDVaBZaO+8FvIXPy/paEbZXugqmNzRgTnuC3MkUErzvaKj4udj0xCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Np35zcWN+bFflTteX2Vtbv4tlO414bvutYyYuJfuDig=;
 b=PIv7FtgiDeEwVIfV889PaVHuK26wmak9zTEsBCsUzYBuC7HCJ+iyhkk5Ju4nu9coUT+uFmg/FYNHjILHP6EN2NKlGKL+JskpJCYDQpKYGMwra5RHvJ7fzhgDfoPEy16eLHsNb+9htPUsOkAbTxAQeNiN4ItNsLmTLH2yUFAdK/oFpHIuFcdjLMLaB1Py2rBMo/JKMoF4u9JUE5PXvEzI1wnb/0fDLOQbiQLA0oRATgQx0hnjyDV4+PHctraN89O+t+biz+dYdpmncj6wY8/0vArClvz7RZw/smKxGvCvwRc/mjR+UXf1VPkFbnlQkmUAl2lmyM1W20AVyXi+8VcVuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Np35zcWN+bFflTteX2Vtbv4tlO414bvutYyYuJfuDig=;
 b=IEVvkH7tDyJXmtxRFMmam5ryMnHEb0uyH1weXSUTEzSjhu2pwBZb9HL7RVp1YEoVZMSZNRavRc7/DmfVvbgL729eJSNV7mJKA3lZmAr50VeAGRDYpa3wTMm/2JmdnooEWrx4g5KYbeYymV99IiBJlM9D+LY7pjtpmBXyvk0nlA8=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SG2PR03MB6683.apcprd03.prod.outlook.com (2603:1096:4:1d7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Fri, 23 Aug
 2024 01:07:58 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.7875.023; Fri, 23 Aug 2024
 01:07:58 +0000
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
Thread-Index: AQHauZvjSsoBOfJjC0GAI+NtmELueLI0fo+A
Date: Fri, 23 Aug 2024 01:07:58 +0000
Message-ID: <b127b578a28ed6fb358657d352eca2e08001e1a5.camel@mediatek.com>
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
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SG2PR03MB6683:EE_
x-ms-office365-filtering-correlation-id: 0f8b2ab5-7a09-46ab-8098-08dcc31006dc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|1800799024|366016|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?Zm0zMUJWaFlNWXJTcnZUSThuMXVLMDJCRGgwcHNqWEFuZG9Vazl1NGFzdHB3?=
 =?utf-8?B?dkoxd2JWK3dSemZhdEY3Sk1YQVFReDV2K0hDRzEyNGdEc3lZVnhTWTY3R3Zs?=
 =?utf-8?B?ZUczem5nLzRQNGtNS2U5RHNIZEphd3ppT2FUbmM0bk13dEVzK2FGRWxUQUJk?=
 =?utf-8?B?bmNMSkU4RHUxK2V6MVU1NmVSeUt2ayswTjVSbDBUQmUreWhlQzd1Q1ZDOS9i?=
 =?utf-8?B?MTJQdXd5WGRiUWhnUWZBaWliRjJiYWRaWTZVQ1o4TUpvZE84dUdDY0ZDaEYv?=
 =?utf-8?B?Z0JmTW1VL0dnY1BxM3pzKzFka1JRUFd2em4zUk9pZFk0SGRQaStxY2hDN1d3?=
 =?utf-8?B?S0FpWVFRUnBQNWMxRHJobnFhdFVNd0ZtOHM0SnFNVHkrbWpXVE1MbFVzblRW?=
 =?utf-8?B?SEppTnloUTRLaHNmY3MxS1Q1aDQ0RWVJYW9YNk5tUlorcW94MzZMT3BRb0ti?=
 =?utf-8?B?QURmbEQwUXlwN0ZNem9ObWhJbUg4MElLK0dCcmZPTkJUUFVkUDJFakd0UzZW?=
 =?utf-8?B?cWhzaXJtRlJvenU3ZlR1U05ySkZ5VDN5b0dPVmlxbVVRb1R5LzBYb0ZjdUFz?=
 =?utf-8?B?aDhrZjJVVlV1cHlEa0RQNTBKUG80TlVHYmQrU0lQdFJCdTFsWTBjTVJ6MXFB?=
 =?utf-8?B?ZVlkbTEwT2RhbUphNk9pVVhJajUzN0JGWERYOFZuZExtd3RaaW4yWW9oRDZH?=
 =?utf-8?B?MXNaWEtRbzFJYklYSkN3bHpLRGcyWVdyekN4b0FvOGFJRTRCeGRHdWxFblB6?=
 =?utf-8?B?ZW0zak1BWC9udktmU2N2R1k4dHlWQnZTYU9STFNSQVBBVGJwV01YclhYOE96?=
 =?utf-8?B?VmZGMU9kSFdRTmhtR2svb3EzWk10V3J1UDlvYXczcjZwWVlkLzJPZVhySXRi?=
 =?utf-8?B?TjVtaFdCVFRuMGFHUWVjREhqT2t0VGhjamN1cWtKejgyTkt1VGtVN01yUmJq?=
 =?utf-8?B?cVh0ZklqZVh0bytWUUM0VmhWaVgrNlNkRTRXNFVFWkJNMyt3eEVOc0JRb25J?=
 =?utf-8?B?Zk1ONjBmL3N2V00yamRFRElvQWxRZ3lQREtpUWJudTBZSHJKYjVoVk9uSGhE?=
 =?utf-8?B?ait3Z0xUQjdqbktvd2E3TWF2RFo1YmlnclFQVlZZc1FrUnFIUFVwcjArSlJU?=
 =?utf-8?B?Q2ZzNzBSMzllRlByanFvZUZuNzJ5dTQrZ2hWZHdpZ1d6TTVJeFZ3YUlSYUJ3?=
 =?utf-8?B?SmpvREllME41OFd6UEt4OXROTHM5Q1VwRmMxSVprWkh3Q0s4SzlkZm9RS0pU?=
 =?utf-8?B?WWllcFJRYlJYL2xOZ0o0SmEyV1ltdStEbm1IZUdEN1hqbnQzMW5HeUovUndV?=
 =?utf-8?B?TkZCa0d5QWJSc1pDc29hWEFQaUtRYmpPbC85b2JndnRJL3BNb0t4dHBjQUxC?=
 =?utf-8?B?WitjUmt4V0R0UW9CS2F0R29DUXdCUXl4YnJ4MXlYK3BOSUtSN1NQdzZjOG5B?=
 =?utf-8?B?U2lxdm16YzQyNkgxRzhjNUpXVVk1MFhtNUtJSUMzU0hPYUFScTFGZlRFWDlY?=
 =?utf-8?B?TUxrcERRZkl2ZEFMUjZidU1BQkQ4NEs3VzFBZ3FvTGpYOUJ1MjZ0NVF3aEI2?=
 =?utf-8?B?WStKT1laS3ZsZllkUlFwU3VTdm0rU0ltRFVITGUzdGUzSEtjOUloaHBpTG4v?=
 =?utf-8?B?QTBEQWhXOUorN2Y3UTJvVldpVWRSdnhObkI3VzlERC93aC9tY2FaYzluL3lO?=
 =?utf-8?B?NjhaVG5memhNcEJPQXNWZ0lKU3BLR2VqWGNtQlZMSDJjT1lRelNIdWhhbnBM?=
 =?utf-8?B?SWorQWdhQUZFWVBBMmx4M3NxWHZZaVhuQVp1SGZqeHMwZURnOXlnSjN6SXVQ?=
 =?utf-8?Q?ux+jCaNqbxPO5E/iGUIlcBCtzqMCam9hcFExo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RTFwTThKOWN2ZHh3aEkyeFpKNm1DYndUSlBxUW9SMUUxUzE4VmY5WlN3VVVw?=
 =?utf-8?B?Y09GZzFZdEYrY3VlRXBqbjhyaUduUElqVTcvUXRTS0xZbmx1MDNUVHNhVEtJ?=
 =?utf-8?B?M2NsWVcvekFtVytXUVJWQ2ZVNUNXVytFTUJSOGdETFo3Q1BScWw0NTc1d0lS?=
 =?utf-8?B?b3ZyUXF0cWo1RkF0NFNERFdMNXBIYkZKakRHT2s1NjM5RjBPYWtNamYrZ0lp?=
 =?utf-8?B?SmFFY2lPZzVrZDF2QldiZlZGZXhuWmk3S0tLUFJCdDJIcHhOZW81WnpYSXlZ?=
 =?utf-8?B?b3V3VWU2WE80dnNaVmR6ZUYrVXFLU1l0cWQxSElKZXVqbFA1L2xiUDQxTEFG?=
 =?utf-8?B?NTZ2Rm52Nk5RQURQZGNNVWF2T08xUUMxZ1prSGRXbTFtWjYxMUJmdkM2VUxV?=
 =?utf-8?B?WDlFbDhFVlJRalVadDc3VUk3Mk1TOW4xQlpmOWlVMFBhRUpVcHRnOUQ1US9J?=
 =?utf-8?B?djJxS2U5T1hRUDdOUlRtcnN5bHhNaHJFeDFNd3RYZ0xmQkFLT0tJY01zcTcz?=
 =?utf-8?B?ZFNXOURwR3JoQjVGSmpmTkhadU54MnJQZHVnNmVRdWs5UkExcGtOZlJXZmNQ?=
 =?utf-8?B?RVJZdi9QbFk1bFNVUk1pRk5FYUZzQ3BmTEdrc2NwNHVvVEpaS1Bkcm55WkZ4?=
 =?utf-8?B?d3JmUjlZdjBsNzBVTmpaWHFaNi9HUDhQVFc5V25mOXVUKzlkbm4zbG9uaGEv?=
 =?utf-8?B?U3dTam1YWm02UUo0M0djcHBYVmIzMXB6WFZkQ0NISjVsb1l3cm5ONFN1Qitv?=
 =?utf-8?B?YWxlUUNtMUxvbEl4QkhNQURWOHJOTFVPWXJTbjFDWU5ST3BCVnI4VGRLcDdK?=
 =?utf-8?B?cm9BazlpT0lybHcxTjVsRHcrSVd5RGVjL3dmVlRVTFRzMmFJdGNnVTh5Y2xV?=
 =?utf-8?B?Z1FxN2RGN1lsby9PU081V2J1bEV3cXZWNGoxdmdMMDN4bVdvSWFYaUcyakoz?=
 =?utf-8?B?MHFkdDBwNWY1aVY3MCtZR0JRUlBmMXUyNkFORy93TzcwalFvRjFVRW9nWHdK?=
 =?utf-8?B?MG9vUlpyaGh2bjdENk5RUytPMDRUdFcyeTFxQlRpN1NPUnpPR043dUhtbWlO?=
 =?utf-8?B?dmxCeGRMcGJOSG1qbmQ0bnEzMDNkdDJjOGl3YTNoTlZvSFdyUHA1NXdtVUpI?=
 =?utf-8?B?QWp1ME1oMzQrVnV3dFd6emhnV3BPOEJDL1hHWlNmbG9acWsrRWY5Ym16QkpL?=
 =?utf-8?B?VGt5d2VMN3VWbmtrODRLNngyekVYc2h3b2JxbkozUXkxVzlSRWVtUDJZVjlQ?=
 =?utf-8?B?cDloNXdCNlRmUitIa2wwMGEvUURmSEoybzdJNHBHRmtuSnRoNCtDMGR0Q0dS?=
 =?utf-8?B?SHJ3TjkzbjkxY0h0QThFK3VTVVN0d3VxSVBaNm9FbEx4alVFMWZ1aTFRRFE5?=
 =?utf-8?B?ZDJzMmJMdTdUYWRYQW5rMElRZmFpYlJYUk4rWmwxejZjTkNvUWFKZm9sZVE5?=
 =?utf-8?B?VFRDVmRXMnFXSEIzRjFLWFhUWks5U01aUlcxWFBwSEt6Vk85RDd2bldvZmxW?=
 =?utf-8?B?K2xBWkdvekFrQ3liYjB0aW5URGFTUzZBMVZrUlJ4cWZJOFZtWSthZVMwWjk5?=
 =?utf-8?B?N1FUSkxwOFJqRGxvSWY1REZiZUtTUndhTU1EMi9OdWVaOGNnQTUydlZZeDZl?=
 =?utf-8?B?UzlsRVpwV0xId1BsMm1BdkJsNi8yS2lQRWV2QTg0cENxTXV0UXViL0tKK2s4?=
 =?utf-8?B?c3NaVDRYbHYxSjV0YXg1TDE0bHE2dVYyUDQrL2hBQXc1ckxWNTFjUUFkMU1z?=
 =?utf-8?B?SXR6MTR6bnBpVCtyQUNwazdSSTdhQ05pWEtQU1pyN0lkVnAxWVEwYzlCa0xq?=
 =?utf-8?B?bjBxcVpsYkVMUitaQysyUUVQRmpYamFuelVOSEROM3RQSCs3QmRRUHI4YTJz?=
 =?utf-8?B?bkFqZmtvOThnbDI1bVRuL0dIcHdjVVFLTFR2VUxZZS9sSFpuYUtTd0VMd1Rp?=
 =?utf-8?B?MFV1TzNla25MdVNjYkpwejVvSFR4USsrd293M21vMjFmVElMUi81TmFwaFBp?=
 =?utf-8?B?bFkya3hqbURhd3VWeXVwYTJPbU1ZUzdBcEIzRWFVYmtuMzVkbDBjN1dQck05?=
 =?utf-8?B?TElUN2duN2g1U1NkK3RQaGZ0V1o4bTdSdDFiVStlUTEvUFlXcEhrZCszMTk4?=
 =?utf-8?Q?pnUR9augxT5+p02LGPbqakGTs?=
Content-ID: <A39F79BAA2D5D14EBC5BF898247366CB@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f8b2ab5-7a09-46ab-8098-08dcc31006dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2024 01:07:58.1136 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4pSagBF5YI8C/exhmBlnyQR0mOuWNfnFBygVVSTxxnFDu0Ry86KbgkgmXE3QTLzytaTD3c/8vmokAir+vAjyXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB6683
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_001_2074001863.1943891238"
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

--__=_Part_Boundary_001_2074001863.1943891238
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
DQoNCj4gK3N0YXRpYyBpbnQgZHBfdHhfaGRjcDJ4X3dyaXRlX3NrZV9zZW5kX2VrcyhzdHJ1Y3Qg
bXRrX2hkY3BfaW5mbyAqaGRjcF9pbmZvKQ0KPiArew0KPiArCXN0cnVjdCBtdGtfZHAgKm10a19k
cCA9IGNvbnRhaW5lcl9vZihoZGNwX2luZm8sIHN0cnVjdCBtdGtfZHAsIGhkY3BfaW5mbyk7DQo+
ICsJc3NpemVfdCByZXQ7DQo+ICsNCj4gKwlkZXZfZGJnKG10a19kcC0+ZGV2LCAiW0hEQ1AyLlhd
IEhEQ1BfMl8yX1NLRV9TRU5EX0VLU1xuIik7DQo+ICsNCj4gKwlyZXQgPSBkcm1fZHBfZHBjZF93
cml0ZSgmbXRrX2RwLT5hdXgsIERQX0hEQ1BfMl8yX1NLRV9TRU5EX0VLU19PRkZTRVQsDQo+ICsJ
CQkJaGRjcF9pbmZvLT5oZGNwMl9pbmZvLmhkY3BfdHguc2VuZF9la3MuZV9ka2V5X2tzLA0KPiAr
CQlIRENQXzJfMl9FX0RLRVlfS1NfTEVOKTsNCj4gKwlpZiAocmV0IDwgMCkNCj4gKwkJcmV0dXJu
IHJldDsNCj4gKw0KPiArCXJldCA9IGRybV9kcF9kcGNkX3dyaXRlKCZtdGtfZHAtPmF1eCwgRFBf
SERDUF8yXzJfUkVHX1JJVl9PRkZTRVQsDQo+ICsJCQkJaGRjcF9pbmZvLT5oZGNwMl9pbmZvLmhk
Y3BfdHguc2VuZF9la3Mucml2LCBIRENQXzJfMl9SSVZfTEVOKTsNCg0Kcml2IGlzIGNvbnN0YW50
LCBzbyByZW1vdmUgaGRjcF9pbmZvLT5oZGNwMl9pbmZvLmhkY3BfdHguc2VuZF9la3Mucml2IGFu
ZCB1c2UgdF9yaXYgZGlyZWN0bHkuDQoNCj4gKwlpZiAocmV0IDwgMCkNCj4gKwkJcmV0dXJuIHJl
dDsNCj4gKw0KPiArCXJldHVybiAwOw0KPiArfQ0KPiArDQo+ICtzdGF0aWMgaW50IGRwX3R4X2hk
Y3AyeF9zZXNzaW9uX2tleV9leGNoYW5nZShzdHJ1Y3QgbXRrX2hkY3BfaW5mbyAqaGRjcF9pbmZv
KQ0KPiArew0KPiArCWludCByZXQ7DQo+ICsNCj4gKwlyZXQgPSB0ZWVfc2tlX2VuY19rcyhoZGNw
X2luZm8sIGhkY3BfaW5mby0+aGRjcDJfaW5mby5oZGNwX3R4LnNlbmRfZWtzLnJpdiwNCj4gKwkJ
CSAgICAgaGRjcF9pbmZvLT5oZGNwMl9pbmZvLmhkY3BfdHguc2VuZF9la3MuZV9ka2V5X2tzKTsN
Cg0KRGl0dG8uDQoNClJlZ2FyZHMsDQpDSw0KDQo+ICsJaWYgKHJldCkNCj4gKwkJcmV0dXJuIHJl
dDsNCj4gKw0KPiArCXJldCA9IGRwX3R4X2hkY3AyeF93cml0ZV9za2Vfc2VuZF9la3MoaGRjcF9p
bmZvKTsNCj4gKwlpZiAocmV0KQ0KPiArCQlyZXR1cm4gcmV0Ow0KPiArDQo+ICsJcmV0dXJuIDA7
DQo+ICt9DQo+ICsNCg==

--__=_Part_Boundary_001_2074001863.1943891238
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
bmlwXQ0KDQomZ3Q7JiMzMjsrc3RhdGljJiMzMjtpbnQmIzMyO2RwX3R4X2hkY3AyeF93cml0ZV9z
a2Vfc2VuZF9la3Moc3RydWN0JiMzMjttdGtfaGRjcF9pbmZvJiMzMjsqaGRjcF9pbmZvKQ0KJmd0
OyYjMzI7K3sNCiZndDsmIzMyOytzdHJ1Y3QmIzMyO210a19kcCYjMzI7Km10a19kcCYjMzI7PSYj
MzI7Y29udGFpbmVyX29mKGhkY3BfaW5mbywmIzMyO3N0cnVjdCYjMzI7bXRrX2RwLCYjMzI7aGRj
cF9pbmZvKTsNCiZndDsmIzMyOytzc2l6ZV90JiMzMjtyZXQ7DQomZ3Q7JiMzMjsrDQomZ3Q7JiMz
MjsrZGV2X2RiZyhtdGtfZHAtJmd0O2RldiwmIzMyOyZxdW90O1tIRENQMi5YXSYjMzI7SERDUF8y
XzJfU0tFX1NFTkRfRUtTJiM5MjtuJnF1b3Q7KTsNCiZndDsmIzMyOysNCiZndDsmIzMyOytyZXQm
IzMyOz0mIzMyO2RybV9kcF9kcGNkX3dyaXRlKCZhbXA7bXRrX2RwLSZndDthdXgsJiMzMjtEUF9I
RENQXzJfMl9TS0VfU0VORF9FS1NfT0ZGU0VULA0KJmd0OyYjMzI7K2hkY3BfaW5mby0mZ3Q7aGRj
cDJfaW5mby5oZGNwX3R4LnNlbmRfZWtzLmVfZGtleV9rcywNCiZndDsmIzMyOytIRENQXzJfMl9F
X0RLRVlfS1NfTEVOKTsNCiZndDsmIzMyOytpZiYjMzI7KHJldCYjMzI7Jmx0OyYjMzI7MCkNCiZn
dDsmIzMyOytyZXR1cm4mIzMyO3JldDsNCiZndDsmIzMyOysNCiZndDsmIzMyOytyZXQmIzMyOz0m
IzMyO2RybV9kcF9kcGNkX3dyaXRlKCZhbXA7bXRrX2RwLSZndDthdXgsJiMzMjtEUF9IRENQXzJf
Ml9SRUdfUklWX09GRlNFVCwNCiZndDsmIzMyOytoZGNwX2luZm8tJmd0O2hkY3AyX2luZm8uaGRj
cF90eC5zZW5kX2Vrcy5yaXYsJiMzMjtIRENQXzJfMl9SSVZfTEVOKTsNCg0Kcml2JiMzMjtpcyYj
MzI7Y29uc3RhbnQsJiMzMjtzbyYjMzI7cmVtb3ZlJiMzMjtoZGNwX2luZm8tJmd0O2hkY3AyX2lu
Zm8uaGRjcF90eC5zZW5kX2Vrcy5yaXYmIzMyO2FuZCYjMzI7dXNlJiMzMjt0X3JpdiYjMzI7ZGly
ZWN0bHkuDQoNCiZndDsmIzMyOytpZiYjMzI7KHJldCYjMzI7Jmx0OyYjMzI7MCkNCiZndDsmIzMy
OytyZXR1cm4mIzMyO3JldDsNCiZndDsmIzMyOysNCiZndDsmIzMyOytyZXR1cm4mIzMyOzA7DQom
Z3Q7JiMzMjsrfQ0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7K3N0YXRpYyYjMzI7aW50JiMzMjtkcF90
eF9oZGNwMnhfc2Vzc2lvbl9rZXlfZXhjaGFuZ2Uoc3RydWN0JiMzMjttdGtfaGRjcF9pbmZvJiMz
MjsqaGRjcF9pbmZvKQ0KJmd0OyYjMzI7K3sNCiZndDsmIzMyOytpbnQmIzMyO3JldDsNCiZndDsm
IzMyOysNCiZndDsmIzMyOytyZXQmIzMyOz0mIzMyO3RlZV9za2VfZW5jX2tzKGhkY3BfaW5mbywm
IzMyO2hkY3BfaW5mby0mZ3Q7aGRjcDJfaW5mby5oZGNwX3R4LnNlbmRfZWtzLnJpdiwNCiZndDsm
IzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7aGRjcF9pbmZvLSZndDtoZGNwMl9pbmZvLmhk
Y3BfdHguc2VuZF9la3MuZV9ka2V5X2tzKTsNCg0KRGl0dG8uDQoNClJlZ2FyZHMsDQpDSw0KDQom
Z3Q7JiMzMjsraWYmIzMyOyhyZXQpDQomZ3Q7JiMzMjsrcmV0dXJuJiMzMjtyZXQ7DQomZ3Q7JiMz
MjsrDQomZ3Q7JiMzMjsrcmV0JiMzMjs9JiMzMjtkcF90eF9oZGNwMnhfd3JpdGVfc2tlX3NlbmRf
ZWtzKGhkY3BfaW5mbyk7DQomZ3Q7JiMzMjsraWYmIzMyOyhyZXQpDQomZ3Q7JiMzMjsrcmV0dXJu
JiMzMjtyZXQ7DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrcmV0dXJuJiMzMjswOw0KJmd0OyYjMzI7
K30NCiZndDsmIzMyOysNCg0KPC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlwZTp0ZXh0
LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5v
dGljZSAqKioqKioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0
aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBj
b25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1w
dCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0
byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkg
dXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBv
ciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5
IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSAN
CmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhp
cyBlLW1haWwsIG9yIGJlbGlldmUgDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWls
IGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVw
bHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhp
cyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFu
ZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhl
ciBwZXJzb24uIFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_001_2074001863.1943891238--

