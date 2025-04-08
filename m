Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8DBA7F82E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 10:44:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1D9A10E61B;
	Tue,  8 Apr 2025 08:44:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="MdcqN1LB";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="pWeVlwVZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C399410E61A
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 08:44:18 +0000 (UTC)
X-UUID: a224da12145511f08eb9c36241bbb6fb-20250408
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=VfEKN7ys/ajfqGwcn04DQVi/E43sDKu5KmLUBmx5knU=; 
 b=MdcqN1LB1x4y/89/9jLbAQiQqvHTgV7UtPkmnrz4GeP7p+UxxEkJP+aphvREVyYxx6rexFsC/AtZYAMKrm6xY+2dqzzFFvAmQU1L+BVG9DrPjNw/StIY21aElGBrBV6jKC1Y4bvxveYFaEP4oJAq5bU3NrXF1XsBfgPFws7rnZU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1, REQID:3e94b0db-45ba-4c5c-8e3d-0a52fbc730c3, IP:0,
 UR
 L:0,TC:0,Content:6,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:6
X-CID-META: VersionHash:0ef645f, CLOUDID:a88150c7-16da-468a-87f7-8ca8d6b3b9f7,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
 nt:4|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
 OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a224da12145511f08eb9c36241bbb6fb-20250408
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 62026129; Tue, 08 Apr 2025 16:44:07 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 8 Apr 2025 16:44:06 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 8 Apr 2025 16:44:05 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=euGNEhs1yJfH01Bpn5j6KV/V1UPA9IEQx583pH8uXIAQ5ILmcDZkeo1kBtWVENp/oE5vfAAxKt8RSclquFpnQtZ34xArnhHSGSP5+h7yN735zhL1QChDGTksd3nIhhPq9pgHumm/8KefLDjkAB4tCSxyjBOIHRlK/N87wN5N6QFBmADS2GXNMLEfkxnI7iIoHhfOBCAjRsMEC97ol2fNo8nmYgh3gTamXQdSeU6R+DHSg3t/h7r2pe5IGT7SMnWRFDw1d/ZXxY2++BKOf4tGmhsIB0EzFohXLAh3YulCN9yz3EFRSGuHVyFtOssmIZ5cuAGUEF0R9wG1+o0/E1YRrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gls3Td6x4+PUYrDbC5GnNIEM1L0wED++lM7xn0DAmfw=;
 b=X8RgMKy9z6kCxrVL6johgiDkAe/LBToySCKOdemW9DKsHTsqEiVRYK51376JthhyTle7+KYEEs2f/w0A+asleswM31G86yItWdACF/gAXx4yyZzU6+rSFRCwLE/+Rt5njC/bS9A7ILEsdEblTRefLk4dcScnvVhT3sb2VnhaxAAiYC3zuwsrD1GD7lfQcpR5ZGdysLMI33aE9xsQah7uWHNzlxTyvOxEf9X2AUBWlaQxfGRwsOc6vgsAOang8cFqXGOUBt5CG/EByqG7Rbf8FmbNfnf90IQw68ItDiRq+v9Rj5lg07aBj30Hg+yKC04sagZ60u/6qlv4oieU9QxMlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gls3Td6x4+PUYrDbC5GnNIEM1L0wED++lM7xn0DAmfw=;
 b=pWeVlwVZ81c0AyRquMRo8QghTK5y+aaeV0HCAc+Bh/9RIm0WlPvlmjDOYajhmXLOEqY85W+Uho1D8yYKyUxHvMGfRUbTeIg2XtS7mGZkdp8d6VkFFbAUsjU7vp5AELLX+H2wu2Eo+J1G1bLrmLwFncZM4mnx/FqviwWAG4mlOBI=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEYPR03MB8744.apcprd03.prod.outlook.com (2603:1096:101:207::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.27; Tue, 8 Apr
 2025 08:44:02 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%6]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 08:44:02 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "kishon@kernel.org"
 <kishon@kernel.org>, =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?=
 <Chunfeng.Yun@mediatek.com>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "mripard@kernel.org"
 <mripard@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,
 =?utf-8?B?QmluY2FpIExpdSAo5YiY5b2s5omNKQ==?= <Bincai.Liu@mediatek.com>,
 =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?= <jitao.shi@mediatek.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, "vkoul@kernel.org" <vkoul@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 4/4] drm/mediatek: dsi: Enable runtime PM
Thread-Topic: [PATCH 4/4] drm/mediatek: dsi: Enable runtime PM
Thread-Index: AQHbp8RpXNhjEKYEm0OUvoYEIXSXqbOZdTeA
Date: Tue, 8 Apr 2025 08:44:01 +0000
Message-ID: <9ce46eebdb6f8078c3b2ab5fbf2cdf2cff210726.camel@mediatek.com>
References: <20250407133138.22449-1-bincai.liu@mediatek.com>
 <20250407133138.22449-5-bincai.liu@mediatek.com>
In-Reply-To: <20250407133138.22449-5-bincai.liu@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEYPR03MB8744:EE_
x-ms-office365-filtering-correlation-id: 831fc5bf-39ec-47a7-572f-08dd76798323
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?Nnc3UWlUN1QrTGQrL2o0aTI5MU8vQ0tVWS9IMHRDelVscy9LMzRtMitYeEp3?=
 =?utf-8?B?b1pCaFdJM3F2TDZkODM3Y1BhOUV6VDJ4S2lNSUxvYk9adVkxZHBQdVlOeWFI?=
 =?utf-8?B?TElMV0tZVHNhMFMrK1RVc2JqMXBUdXBKaURnTWZEeXUvM0lGQi9FMHRyWFkr?=
 =?utf-8?B?WEJ0TnExekVicVhtVERGWXpnWmgzbGh5QlBjRWYyNTJmR1B0VzRXcDBBbTNq?=
 =?utf-8?B?dmdITDlNdk9CQWNqdHZmMy94STlUSEFUOFlCc3NxVG9GM00vQ0o0eFlXZmIy?=
 =?utf-8?B?RjFBc21UYjlYZ2lIMUhRUHpDQ2w4K2Y4TGZTc2tQQnBhNCtJd1VTbmlIbCsy?=
 =?utf-8?B?S1UwQTYvd2lad2w5YzRYTFArNTY3VFhpNmltRWxJSHNOaDMrZ1g4YlhiUElt?=
 =?utf-8?B?cVZlVEM3dGlDbWQ1Tm8vSUovT1hQeVRTb0NHeXVFaW5ZbTc5QnR3MXM0Mkl0?=
 =?utf-8?B?N2lMTFV2bVdXcTR2dmk4ZVlMOEdSNTF1b2RNSWxjKytKYThWbmVaNDBkOGtu?=
 =?utf-8?B?T25LZ1FabmlROXhhMkNKYWJxeThnbVhsTTMyRDNuYUZISXZuQ2llTGpSUHhW?=
 =?utf-8?B?LzNGVzcrWDJhUE9PTjRJaTZDSitQaWNyZzdxYkJ5SUllL3lIdEpsOEpyb2xS?=
 =?utf-8?B?RDZyNzFQTXYrckZPNU1GSzJrSFY3NHlDM1YrZlpvT1JsTFFVWE5wdjZiT1lP?=
 =?utf-8?B?K1ZKeHRTMmsrU2NZVzlMWjB2OXcrSytNa0o5NG1mNVNwUkVqaFZpS3FjYkJh?=
 =?utf-8?B?NzdPQTM4RmlPRVNPalJySjFYMXZoOTN4NnpYdnduKzBMZjhPOEJJUHQ3bGFi?=
 =?utf-8?B?UzJsb1lVNGlDZ2VSV2QvQmxkUmRIdm90NU42c3ZqYnhmUnNDSTMrdHVMeXM1?=
 =?utf-8?B?d1NtT3pPT2dMdzI0cmYxbkQyV00rMm1rU3ZrUXpyQTF2ekhnTjdyU3JLcHBU?=
 =?utf-8?B?ZUk1ZU1DVFNxa2JTSy9oTnkxa0JKTENiMlJGN3NsSGJBZEFNVjczbmVONUpx?=
 =?utf-8?B?QXU2NVMraHdpNU85OWJ4TnNiZ3VnS0l3UHNVcGk0NkQ4V0NzMnkzSjhCRkRN?=
 =?utf-8?B?cXFQelU2V0FlSncvSmpadktDbStKZUxaYy8yaHhJcU92c1V5aldNTXgySVJU?=
 =?utf-8?B?cjFvNHcwdVM0L3p5eG9rdW5LaXJTY2NYQUJrTVh1N3M3MDJ4RHhMeWNOT3JL?=
 =?utf-8?B?TkU0aHBmRjdsb1htZnpzaVhPR3FnVUhFVTRSUUNUNHhHKzlETXRNRFQydFhr?=
 =?utf-8?B?ZDQyLzRKS0JSMklOY0d0OUdqR1hlZlo5c1MwRk9kUEpLSTkyVlhQMTRYZnR3?=
 =?utf-8?B?ZUhsZlM1Q01ZUnZUWEhuTEx1dnhIR3pqeGEvazQ5bnQydTlhMU9MMHkvRWYv?=
 =?utf-8?B?ZXdCci9tcVRJSmNjK1MyWitOWnVRcjVRUitiSm9Ycnd3ditkQmZEWHdVMmQ4?=
 =?utf-8?B?cU1Fb0pyajVHOStISmI4eHBBM1FKU0xtUk9vWFY0VG1mQm1ZSjl3bUFXZFQr?=
 =?utf-8?B?Zmo1dFdsckJSbmRwMUd3RFdscCs1ZTJRa3dhbGlBUkZoaW4vTmFvYmxMa1BX?=
 =?utf-8?B?SnJMcFk2UVoybytLRG1xcjJWSUYzZnlIbE5JV3Y4Z3RHSHp4NW52Q2FTUm8v?=
 =?utf-8?B?ejVLSGRVUGVGRE55QTAzMWJzT1RySzltZkorN2tRWkVFN1ZQUDkybTE0a2xM?=
 =?utf-8?B?akpTWjlMeEttVHQ4TEpkVzFSak1hcEQvVFY4MHRtYUcvSllQc2NraEVTSHcz?=
 =?utf-8?B?UVQ0SGdTd2kyVXZhRlh0YitHYnpwc3NrWlNERVNtZGwzdjh6Qi9ZVmtLdHpT?=
 =?utf-8?B?NUw0ZktoK0ljYk9Va2VyZGgvc2FHVWc1WFR1N1VMOVcwYzhNTXFVL2tRYlYr?=
 =?utf-8?B?dGdwR0FsUjR0TDhUekZWbXRDcnJZQzJMZ1p3OXZIakxDZlZ3NTA4UHRvMUlD?=
 =?utf-8?B?aW1BUHBxU0Z1VFhFM2pPMjhaUE5BdVVnVE1peXZZTEJNZTBjQmlaQWdMOWVG?=
 =?utf-8?Q?QtJ04t61Tq2mhIgaXDFbcccBdZLkgo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WXJWOVNTNE1FcmY0ejRvUWhlRmpJSmlGanZxYWxGY3VyS091ZEU2QnlOSTNM?=
 =?utf-8?B?anFWYzJZNi84NUpHK2N6MUtPMVhpcmx5dHhRRm5RamorSC90M284bVpackN0?=
 =?utf-8?B?SWxVWHRqTSttNDVqUzBZVGlETUhxblJVSElOM2dhZmFITUxodGM2ZzdhU2FY?=
 =?utf-8?B?WFdwMU1WQ1R2Tml0ZUFWUXM1TVlxZ3V4dmNxSzIxMGM0eDFFdk1TQXpwM2dM?=
 =?utf-8?B?alIvbXVoa0lDVWtzQWs0TysxZVVLaDZvVUkzYnFYVkhURlY4cmw5aVpvT2s5?=
 =?utf-8?B?THhTTUtpNWN0UWpONDhZWlozLzRJTlF3c0NacTUwTWRtZ04vRm5Da25Xbjdt?=
 =?utf-8?B?dkxrTkJOSFIyZ1BFYmx6dEl2SDZKRTd6SGpXTTYySWFWV2RJTG5BWGlDMUJN?=
 =?utf-8?B?QndLQnJyT3pVSUtCZURoZC9ZckNWWlNJNmIvaUdqZ2srWTdzVG9jMFowMkpT?=
 =?utf-8?B?Wm9vL3dPNUh3b2V2MDRVd0NBemgvSVRSQmZ5TVpsWXR0NHo5Q3NOb3k3amU0?=
 =?utf-8?B?dyszRVZjcFAyd0JmZ0hxYkhiV0E3VEN6NXI4WXc2RUJuRlRlanFmV3A4UHZX?=
 =?utf-8?B?QlVoMXl1QTUycGcvV1RmQVZYTXA5amVVR0lFVGRmaW95amxLbFFibFIyWmJM?=
 =?utf-8?B?cmRXYkVvYjltczBnOGppd09najVQQXYyVWRpTHNjd1hkWGhIRzB0cmMwRFov?=
 =?utf-8?B?ZkRHYmJEMEFBQlpjbm5IQ005OTkrZUhmd1pYQjlyN01XZnQ0RUNydWhNMU95?=
 =?utf-8?B?by9sQjBzSFBRTlNFcVRjamh2NStxK0N2dzhaT3RSeENpUkEybXIxVDMzZDgx?=
 =?utf-8?B?RVJtdjF2Q1hKTlVaVXB4WE9ib01XRjF4c2V1SVNScGo0U2QyWEREMDdlWWtC?=
 =?utf-8?B?Qks4M2drOUMzbTlhODRrd1NNNlN1bkxZWXlxR0gyTExwSjVmQ2JMWk5weTJ2?=
 =?utf-8?B?d2hqUlVhYk5yZnlXdnV2MnhNWTdSNzVUcWdVNzRPRW15RFNvcXFNRHNvNjVK?=
 =?utf-8?B?dXkwTmZIeFJ4dm56S1lyMmhoQTE5bE1HaVFZTXdaMnEwK2VzeklvVXErRmp0?=
 =?utf-8?B?UkZqbkVUK0s3TnhXSUwrbTZrZ2ZPbXpwZ3duMm0wWTk2dW1EWjBYMEh3SzZl?=
 =?utf-8?B?bzFad3VZb0F4MHk4bUxuSXA4OVdqQk5MOXZrZzZJNnVXVzZSZVVHNzQyenpW?=
 =?utf-8?B?Q0d1c3dSWjJSZkZFTGsvTjhNdWdSdzZNOWx3aER6VTl6S2ROZDRERi9KWTZi?=
 =?utf-8?B?MVdtanZobVRFSkhLRmpqRlZyamZ3TlB1c05TMEZ3cTQ1b0VKRjYrZjFEQ3FM?=
 =?utf-8?B?Zjg2MHE2SFVKR2swc0ppb3hldXl5ZFlLMWlMZzhEWnh6OFJQRVN3NWFvd3o1?=
 =?utf-8?B?R0txOWprdTl1Vll3RHhjSHA0RnFTZ3ppaEYwcXc3ZElaK016VHh0NlhETmV3?=
 =?utf-8?B?eUNJMDJIRXhNNm01S1JaTjJRMEVXbnk2R2lGNURWbWYrRkhCWUpmSS92aDFu?=
 =?utf-8?B?ckVhNHkyR2t4SDFyTzFMV0VxT091djhVb3p0aDRlcmFWOGVxZDhTemwzdjl5?=
 =?utf-8?B?RjlYVllnRXhudUExZjZBeHNCUTQ2dEhRRjllWGRaTlpUMHhjeVZJYmpnbW0w?=
 =?utf-8?B?QzN6bU1kWitVSHZtc25OZmRKNitCaHI2c2ZjUVVIUlZGZEhRS3F1VzRZQmVF?=
 =?utf-8?B?cFlXSE1nWmQ5V3ZmTXdjOC8yU1JMRVBXVm1UM0VPVkZNS2FOQVpidVFDU2Q5?=
 =?utf-8?B?SkZ0bENpQkpKS0J0akwwYTFqaWcreGszUG1tOHp6SDUySDVuTllqcTE1cFhp?=
 =?utf-8?B?WWh2Ui9PRzhxdS9GTXk2bEExeVJHdXAzT09nbWNaaUorbnIySG5yZzErbUNN?=
 =?utf-8?B?UUY4UjlJcThHVEhGWWNhMDNvWFhIU0JnNHJ6WGdpNUhXL2taaHlJKzMxdDd5?=
 =?utf-8?B?WEtEUXowcjJsL21BbGJRcFVCQW14eHBKc21zOXpmYlc2cmZXejhDbk0vNWs2?=
 =?utf-8?B?WGlOb0dUeHdWMmRIUk5jNEplTjI2SDNPQnhyT1o4ZE95bHJVRHBEd3FwT0Iw?=
 =?utf-8?B?MlpKVTBaZVJ6Tllub3M5d0pvUzZ6VDFEaVprZFZIM0huSFhGRGFEaWs3YkRT?=
 =?utf-8?Q?BPD0CTjshY56lT8NstiOZN/FC?=
Content-ID: <D5464B19FA788A47997FBC60E075B98A@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 831fc5bf-39ec-47a7-572f-08dd76798323
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2025 08:44:01.9356 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nxZPWh+0jBKnocNqEIu4I7nvwg1QuTIQmdFYmtbhfCTg2t8nhnlpQ4PD+lMI98OCC4HLr4t30LoK+jgj13Nr4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8744
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_005_497961073.851984031"
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

--__=_Part_Boundary_005_497961073.851984031
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDI1LTA0LTA3IGF0IDIxOjMxICswODAwLCBCaW5jYWkgTGl1IHdyb3RlOg0KPiBU
aGlzIHBvd2VyIGlzIG5ldyBhZGRlZCBpbiBNVDgxOTYuIFNvIHJ1bnRpbWUgUE0gaXMgZW5hYmxl
DQo+IHRvIHR1cm4gb2ZmIGRzaSBwb3dlciB0byByZWR1Y2UgcG93ZXIgY29uc3VtcHRpb24uDQoN
CkkgdGhpbmsgeW91IHNob3VsZCBkZXNjcmliZSB3aHkgb2xkIFNvQyBpcyBub3QgbmVjZXNzYXJ5
IHRvIGRvIHRoaXMuDQpJIGd1ZXNzIHRoYXQgRFNJIGFuZCBkaXNwbGF5IHBpcGVsaW5lIHNoYXJl
IHRoZSBzYW1lIHBvd2VyIGluIG9sZCBTb0MsDQpzbyBEU0kgY291bGQgbm90IHR1cm4gb2ZmIHRo
ZSBjb21tb24gcG93ZXIgaW4gb2xkIFNvQy4NCg0KUmVnYXJkcywNCkNLDQoNCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IEJpbmNhaSBMaXUgPGJpbmNhaS5saXVAbWVkaWF0ZWsuY29tPg0KPiAtLS0NCj4g
IGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgfCA1ICsrKysrDQo+ICAxIGZpbGUg
Y2hhbmdlZCwgNSBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kc2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNp
LmMNCj4gaW5kZXggYjE0NjdkNmJlZDA2Li4yMWNmYmExZjliODkgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kc2kuYw0KPiBAQCAtMTIsNiArMTIsNyBAQA0KPiAgI2luY2x1ZGUgPGxp
bnV4L29mX3BsYXRmb3JtLmg+DQo+ICAjaW5jbHVkZSA8bGludXgvcGh5L3BoeS5oPg0KPiAgI2lu
Y2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPg0KPiArI2luY2x1ZGUgPGxpbnV4L3BtX3J1
bnRpbWUuaD4NCj4gICNpbmNsdWRlIDxsaW51eC9yZXNldC5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4
L3VuaXRzLmg+DQo+ICANCj4gQEAgLTcxNSw2ICs3MTYsNyBAQCBzdGF0aWMgaW50IG10a19kc2lf
cG93ZXJvbihzdHJ1Y3QgbXRrX2RzaSAqZHNpKQ0KPiAgCWRzaS0+ZGF0YV9yYXRlID0gRElWX1JP
VU5EX1VQX1VMTChkc2ktPnZtLnBpeGVsY2xvY2sgKiBiaXRfcGVyX3BpeGVsLA0KPiAgCQkJCQkg
IGRzaS0+bGFuZXMpOw0KPiAgDQo+ICsJcG1fcnVudGltZV9nZXRfc3luYyhkc2ktPmhvc3QuZGV2
KTsNCj4gIAlyZXQgPSBjbGtfc2V0X3JhdGUoZHNpLT5oc19jbGssIGRzaS0+ZGF0YV9yYXRlKTsN
Cj4gIAlpZiAocmV0IDwgMCkgew0KPiAgCQlkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBzZXQgZGF0
YSByYXRlOiAlZFxuIiwgcmV0KTsNCj4gQEAgLTc4OSw2ICs3OTEsNyBAQCBzdGF0aWMgdm9pZCBt
dGtfZHNpX3Bvd2Vyb2ZmKHN0cnVjdCBtdGtfZHNpICpkc2kpDQo+ICAJY2xrX2Rpc2FibGVfdW5w
cmVwYXJlKGRzaS0+ZGlnaXRhbF9jbGspOw0KPiAgDQo+ICAJcGh5X3Bvd2VyX29mZihkc2ktPnBo
eSk7DQo+ICsJcG1fcnVudGltZV9wdXRfc3luYyhkc2ktPmhvc3QuZGV2KTsNCj4gIA0KPiAgCWRz
aS0+bGFuZXNfcmVhZHkgPSBmYWxzZTsNCj4gIH0NCj4gQEAgLTEyNzIsNiArMTI3NSw3IEBAIHN0
YXRpYyBpbnQgbXRrX2RzaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAg
CWRzaS0+YnJpZGdlLmZ1bmNzID0gJm10a19kc2lfYnJpZGdlX2Z1bmNzOw0KPiAgCWRzaS0+YnJp
ZGdlLm9mX25vZGUgPSBkZXYtPm9mX25vZGU7DQo+ICAJZHNpLT5icmlkZ2UudHlwZSA9IERSTV9N
T0RFX0NPTk5FQ1RPUl9EU0k7DQo+ICsJcG1fcnVudGltZV9lbmFibGUoZGV2KTsNCj4gIA0KPiAg
CXJldHVybiAwOw0KPiAgfQ0KPiBAQCAtMTI4Miw2ICsxMjg2LDcgQEAgc3RhdGljIHZvaWQgbXRr
X2RzaV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIA0KPiAgCW10a19v
dXRwdXRfZHNpX2Rpc2FibGUoZHNpKTsNCj4gIAltaXBpX2RzaV9ob3N0X3VucmVnaXN0ZXIoJmRz
aS0+aG9zdCk7DQo+ICsJcG1fcnVudGltZV9kaXNhYmxlKCZwZGV2LT5kZXYpOw0KPiAgfQ0KPiAg
DQo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG10a19kc2lfZHJpdmVyX2RhdGEgbXQ4MTczX2RzaV9k
cml2ZXJfZGF0YSA9IHsNCg0K

--__=_Part_Boundary_005_497961073.851984031
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO01vbiwmIzMyOzIwMjUtMDQtMDcmIzMyO2F0
JiMzMjsyMTozMSYjMzI7KzA4MDAsJiMzMjtCaW5jYWkmIzMyO0xpdSYjMzI7d3JvdGU6DQomZ3Q7
JiMzMjtUaGlzJiMzMjtwb3dlciYjMzI7aXMmIzMyO25ldyYjMzI7YWRkZWQmIzMyO2luJiMzMjtN
VDgxOTYuJiMzMjtTbyYjMzI7cnVudGltZSYjMzI7UE0mIzMyO2lzJiMzMjtlbmFibGUNCiZndDsm
IzMyO3RvJiMzMjt0dXJuJiMzMjtvZmYmIzMyO2RzaSYjMzI7cG93ZXImIzMyO3RvJiMzMjtyZWR1
Y2UmIzMyO3Bvd2VyJiMzMjtjb25zdW1wdGlvbi4NCg0KSSYjMzI7dGhpbmsmIzMyO3lvdSYjMzI7
c2hvdWxkJiMzMjtkZXNjcmliZSYjMzI7d2h5JiMzMjtvbGQmIzMyO1NvQyYjMzI7aXMmIzMyO25v
dCYjMzI7bmVjZXNzYXJ5JiMzMjt0byYjMzI7ZG8mIzMyO3RoaXMuDQpJJiMzMjtndWVzcyYjMzI7
dGhhdCYjMzI7RFNJJiMzMjthbmQmIzMyO2Rpc3BsYXkmIzMyO3BpcGVsaW5lJiMzMjtzaGFyZSYj
MzI7dGhlJiMzMjtzYW1lJiMzMjtwb3dlciYjMzI7aW4mIzMyO29sZCYjMzI7U29DLA0Kc28mIzMy
O0RTSSYjMzI7Y291bGQmIzMyO25vdCYjMzI7dHVybiYjMzI7b2ZmJiMzMjt0aGUmIzMyO2NvbW1v
biYjMzI7cG93ZXImIzMyO2luJiMzMjtvbGQmIzMyO1NvQy4NCg0KUmVnYXJkcywNCkNLDQoNCiZn
dDsmIzMyOw0KJmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO0JpbmNhaSYjMzI7TGl1JiMzMjsm
bHQ7YmluY2FpLmxpdUBtZWRpYXRlay5jb20mZ3Q7DQomZ3Q7JiMzMjstLS0NCiZndDsmIzMyOyYj
MzI7ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyYjMzI7fCYjMzI7NSYjMzI7Kysr
KysNCiZndDsmIzMyOyYjMzI7MSYjMzI7ZmlsZSYjMzI7Y2hhbmdlZCwmIzMyOzUmIzMyO2luc2Vy
dGlvbnMoKykNCiZndDsmIzMyOw0KJmd0OyYjMzI7ZGlmZiYjMzI7LS1naXQmIzMyO2EvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RzaS5jDQomZ3Q7JiMzMjtpbmRleCYjMzI7YjE0NjdkNmJlZDA2Li4yMWNmYmExZjli
ODkmIzMyOzEwMDY0NA0KJmd0OyYjMzI7LS0tJiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHNpLmMNCiZndDsmIzMyOysrKyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RzaS5jDQomZ3Q7JiMzMjtAQCYjMzI7LTEyLDYmIzMyOysxMiw3JiMzMjtAQA0KJmd0OyYj
MzI7JiMzMjsjaW5jbHVkZSYjMzI7Jmx0O2xpbnV4L29mX3BsYXRmb3JtLmgmZ3Q7DQomZ3Q7JiMz
MjsmIzMyOyNpbmNsdWRlJiMzMjsmbHQ7bGludXgvcGh5L3BoeS5oJmd0Ow0KJmd0OyYjMzI7JiMz
MjsjaW5jbHVkZSYjMzI7Jmx0O2xpbnV4L3BsYXRmb3JtX2RldmljZS5oJmd0Ow0KJmd0OyYjMzI7
KyNpbmNsdWRlJiMzMjsmbHQ7bGludXgvcG1fcnVudGltZS5oJmd0Ow0KJmd0OyYjMzI7JiMzMjsj
aW5jbHVkZSYjMzI7Jmx0O2xpbnV4L3Jlc2V0LmgmZ3Q7DQomZ3Q7JiMzMjsmIzMyOyNpbmNsdWRl
JiMzMjsmbHQ7bGludXgvdW5pdHMuaCZndDsNCiZndDsmIzMyOyYjMzI7DQomZ3Q7JiMzMjtAQCYj
MzI7LTcxNSw2JiMzMjsrNzE2LDcmIzMyO0BAJiMzMjtzdGF0aWMmIzMyO2ludCYjMzI7bXRrX2Rz
aV9wb3dlcm9uKHN0cnVjdCYjMzI7bXRrX2RzaSYjMzI7KmRzaSkNCiZndDsmIzMyOyYjMzI7ZHNp
LSZndDtkYXRhX3JhdGUmIzMyOz0mIzMyO0RJVl9ST1VORF9VUF9VTEwoZHNpLSZndDt2bS5waXhl
bGNsb2NrJiMzMjsqJiMzMjtiaXRfcGVyX3BpeGVsLA0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7
ZHNpLSZndDtsYW5lcyk7DQomZ3Q7JiMzMjsmIzMyOw0KJmd0OyYjMzI7K3BtX3J1bnRpbWVfZ2V0
X3N5bmMoZHNpLSZndDtob3N0LmRldik7DQomZ3Q7JiMzMjsmIzMyO3JldCYjMzI7PSYjMzI7Y2xr
X3NldF9yYXRlKGRzaS0mZ3Q7aHNfY2xrLCYjMzI7ZHNpLSZndDtkYXRhX3JhdGUpOw0KJmd0OyYj
MzI7JiMzMjtpZiYjMzI7KHJldCYjMzI7Jmx0OyYjMzI7MCkmIzMyO3sNCiZndDsmIzMyOyYjMzI7
ZGV2X2VycihkZXYsJiMzMjsmcXVvdDtGYWlsZWQmIzMyO3RvJiMzMjtzZXQmIzMyO2RhdGEmIzMy
O3JhdGU6JiMzMjslZCYjOTI7biZxdW90OywmIzMyO3JldCk7DQomZ3Q7JiMzMjtAQCYjMzI7LTc4
OSw2JiMzMjsrNzkxLDcmIzMyO0BAJiMzMjtzdGF0aWMmIzMyO3ZvaWQmIzMyO210a19kc2lfcG93
ZXJvZmYoc3RydWN0JiMzMjttdGtfZHNpJiMzMjsqZHNpKQ0KJmd0OyYjMzI7JiMzMjtjbGtfZGlz
YWJsZV91bnByZXBhcmUoZHNpLSZndDtkaWdpdGFsX2Nsayk7DQomZ3Q7JiMzMjsmIzMyOw0KJmd0
OyYjMzI7JiMzMjtwaHlfcG93ZXJfb2ZmKGRzaS0mZ3Q7cGh5KTsNCiZndDsmIzMyOytwbV9ydW50
aW1lX3B1dF9zeW5jKGRzaS0mZ3Q7aG9zdC5kZXYpOw0KJmd0OyYjMzI7JiMzMjsNCiZndDsmIzMy
OyYjMzI7ZHNpLSZndDtsYW5lc19yZWFkeSYjMzI7PSYjMzI7ZmFsc2U7DQomZ3Q7JiMzMjsmIzMy
O30NCiZndDsmIzMyO0BAJiMzMjstMTI3Miw2JiMzMjsrMTI3NSw3JiMzMjtAQCYjMzI7c3RhdGlj
JiMzMjtpbnQmIzMyO210a19kc2lfcHJvYmUoc3RydWN0JiMzMjtwbGF0Zm9ybV9kZXZpY2UmIzMy
OypwZGV2KQ0KJmd0OyYjMzI7JiMzMjtkc2ktJmd0O2JyaWRnZS5mdW5jcyYjMzI7PSYjMzI7JmFt
cDttdGtfZHNpX2JyaWRnZV9mdW5jczsNCiZndDsmIzMyOyYjMzI7ZHNpLSZndDticmlkZ2Uub2Zf
bm9kZSYjMzI7PSYjMzI7ZGV2LSZndDtvZl9ub2RlOw0KJmd0OyYjMzI7JiMzMjtkc2ktJmd0O2Jy
aWRnZS50eXBlJiMzMjs9JiMzMjtEUk1fTU9ERV9DT05ORUNUT1JfRFNJOw0KJmd0OyYjMzI7K3Bt
X3J1bnRpbWVfZW5hYmxlKGRldik7DQomZ3Q7JiMzMjsmIzMyOw0KJmd0OyYjMzI7JiMzMjtyZXR1
cm4mIzMyOzA7DQomZ3Q7JiMzMjsmIzMyO30NCiZndDsmIzMyO0BAJiMzMjstMTI4Miw2JiMzMjsr
MTI4Niw3JiMzMjtAQCYjMzI7c3RhdGljJiMzMjt2b2lkJiMzMjttdGtfZHNpX3JlbW92ZShzdHJ1
Y3QmIzMyO3BsYXRmb3JtX2RldmljZSYjMzI7KnBkZXYpDQomZ3Q7JiMzMjsmIzMyOw0KJmd0OyYj
MzI7JiMzMjttdGtfb3V0cHV0X2RzaV9kaXNhYmxlKGRzaSk7DQomZ3Q7JiMzMjsmIzMyO21pcGlf
ZHNpX2hvc3RfdW5yZWdpc3RlcigmYW1wO2RzaS0mZ3Q7aG9zdCk7DQomZ3Q7JiMzMjsrcG1fcnVu
dGltZV9kaXNhYmxlKCZhbXA7cGRldi0mZ3Q7ZGV2KTsNCiZndDsmIzMyOyYjMzI7fQ0KJmd0OyYj
MzI7JiMzMjsNCiZndDsmIzMyOyYjMzI7c3RhdGljJiMzMjtjb25zdCYjMzI7c3RydWN0JiMzMjtt
dGtfZHNpX2RyaXZlcl9kYXRhJiMzMjttdDgxNzNfZHNpX2RyaXZlcl9kYXRhJiMzMjs9JiMzMjt7
DQoNCg0KPC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48
cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZQ0KICoqKioq
KioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWls
IG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlh
bCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlz
Y2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29u
dmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3Nl
bWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcg
b2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRl
ZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdm
dWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwg
b3IgYmVsaWV2ZQ0KIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJv
ciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRv
IHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWls
IChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90
DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29u
LiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_005_497961073.851984031--

