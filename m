Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2578D9F8EAC
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 10:12:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 304FD10EF3F;
	Fri, 20 Dec 2024 09:12:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="sqFHPhYC";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="v8P6fjgG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EDBE10EF3F
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 09:12:07 +0000 (UTC)
X-UUID: 7938631abeb211ef99858b75a2457dd9-20241220
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=VxTigX8cyT0uwVqlAsGgzgwTyYMA5mAh+B6pda95UTY=; 
 b=sqFHPhYC+bQ73gIrvHZy6nxT6sLiwJAowsmb2hW1YeOSjMz5gVsVx5v3WsUtejYr/ZxptrlzWcw3T/GFaSIkGFiUEPg7fflCmEg2lqPGqvzV9nDbs7HfL1Mp3XtgbqDiUKCqH/jM7yUkMuKeVQuMs6hEZhkM3bUFuU5mA4MbORQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45, REQID:904b9b4c-795e-4efe-8873-f0c3d35cedf7, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6493067, CLOUDID:74dba036-e11c-4c1a-89f7-e7a032832c40,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
 :-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
 A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 7938631abeb211ef99858b75a2457dd9-20241220
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1292024287; Fri, 20 Dec 2024 17:12:01 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 20 Dec 2024 17:12:00 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 20 Dec 2024 17:12:00 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oyPgmY8Zxp2Ze7E7RPkLZ/NoPueZp29U69VRGuSYr0lbyxbcrPhm4R7i0KkKocjfglxVbsng1ArThxGyO6HvY3B1q5QL017OHNfD2WbJfQBKNVDZUzOlnU8zB/yDef1BKmohHvSU/k7vc9OBzPSLU4txXFBfxBo9ly7dmXlzhHAfN50SvMHAUM6G3INsGbUpWCKvL67s4HB6P3pBD3epXM5yJOCCVtc/HoJvwnfCcsgo0vkqK9YlJNUWXkJr4Mtp5xSKOQHGuiytOmllqAjkmLuMvrOIYbOlhwVgqJ8k4jwjs/3vs5x9hpRQebeOtPiTl+cohTXsSFawihpmo8frNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T971+1XADdJDQk5uMqyu48kZsiuAo3kOxtckrsLC+1M=;
 b=EOxdScg3/hnFbcibWiI4R4mE8PDAuCdi4fEzd+Sjfy4Qcybi5SChb4N5kUZ6WXgpr+wn6wwihX4fb4es3iV84kNIlrknwv3VlzF2WVLteRmfXMbP6PP+QWWpTdxmsN3rEJLKLOha5V3bouZs1TXcSq9HGZoLyW5O70mB3/mj/Z15rkNkVjArcyeKcmU5dUJc8Ufnr+98q66P9ndzqkaW69gZVnDv3RFsB9dIIqCFMVv4eIyH8qimMugQkDzf5Hch7PmlkB8X9BsMB0WX77h6/O3jm7fFOsKWUXWS5fGmQS7DGjQUnupQNHQhIsTZlWEPUvdiVc7Yr7L8+J87ScdtRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T971+1XADdJDQk5uMqyu48kZsiuAo3kOxtckrsLC+1M=;
 b=v8P6fjgGbAhTpGYF7awbvdop3/R2T3j6MMtIsPlvWpyY32JTuDx56vonlwsdXDxCGv11n75l3azjYIHKTDaSU9BpM/98MCsOsvzKi0wI3fEFk9JA5qOvDwSeWR2+G6QfUv6A4VZj1oNdYEMbiWcLuQg9cWaTtDojL1DE9TR1YJQ=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KL1PR03MB7197.apcprd03.prod.outlook.com (2603:1096:820:df::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Fri, 20 Dec
 2024 09:11:58 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8251.015; Fri, 20 Dec 2024
 09:11:58 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "jie.qiu@mediatek.com"
 <jie.qiu@mediatek.com>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "mripard@kernel.org"
 <mripard@kernel.org>, =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?=
 <jitao.shi@mediatek.com>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "kernel@collabora.com" <kernel@collabora.com>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "junzhi.zhao@mediatek.com"
 <junzhi.zhao@mediatek.com>
Subject: Re: [PATCH v3 25/33] drm/mediatek: mtk_hdmi: Remove goto in
 mtk_hdmi_clk_enable_audio()
Thread-Topic: [PATCH v3 25/33] drm/mediatek: mtk_hdmi: Remove goto in
 mtk_hdmi_clk_enable_audio()
Thread-Index: AQHbUJqwnMcw6UtEjE2w+j0P3/uN67Lu3TqA
Date: Fri, 20 Dec 2024 09:11:57 +0000
Message-ID: <02ff0113fa1d6c0215b64ec3d353ec61efd34733.camel@mediatek.com>
References: <20241217154345.276919-1-angelogioacchino.delregno@collabora.com>
 <20241217154345.276919-26-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20241217154345.276919-26-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KL1PR03MB7197:EE_
x-ms-office365-filtering-correlation-id: 11e1b413-f76b-478d-e517-08dd20d65b18
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?cFllZjJDSjFWMk5TKzRzdGUrRXgxemtrRk5XV2lhRHFlTnY3VUdHS1FxTlFY?=
 =?utf-8?B?cm1PY2ZXZ2lTQnJ2ZlZqaldpWldxK3EzNTBsYU52OGtKNkJ3RzBUM1ZJd0JU?=
 =?utf-8?B?bXJHcnA5QWUxMzRGOUZtMDRxQVJlbENKV3M0cmtIMUtQRXZnb2NZSkhpNzQz?=
 =?utf-8?B?cHF4NUZPbzdqL2JUK3IwNTBkNi9EMGNvQTZIMDlOd1duQnNUQmhZZDhEMHlW?=
 =?utf-8?B?VSsrWnZKekhyMzlEejk0R0pRSmlzckpUMGhncXdoWjIxVlE4eW9LK3l4dnRZ?=
 =?utf-8?B?SU1INGk0dWx6bG9DR1c1eTBNdDJZdndxdDFjWFdEdExiNzNjQnlBaVRnK0ZO?=
 =?utf-8?B?dXV0b2JDOFVCcnZ3K1llODZlbWVJNzNYY0VUSWlEa1BTM01PTGpJRWNSZFM1?=
 =?utf-8?B?UnlVZDFYaHM4ZEhQMW1zYzNIRlhWZ0QrK1lac3JqOGg4TUgvYk8wR1JQZy9u?=
 =?utf-8?B?M3ZpN0VLenAzRE9rZS9VT05ONDBwc0pqTUFCMmpFeGp3YjJoazZKcGJCS1Nk?=
 =?utf-8?B?anpkRVdFWWVVeXROWWJrVWpPc1pvdk1JaHIyb2NCdituVHBNWnhuTzVsU0w0?=
 =?utf-8?B?cTAyVnVmYU1iSU1sbk9LQjB2UE0vN3FyRlkzYVZIOVpnbVhVTjNrUmE1M253?=
 =?utf-8?B?c0FvRzYzQnBKRDBIWnJURDBoK1dERmxhZ1NSZDJqZUd6OENVUGVpT21jQ0ZM?=
 =?utf-8?B?QjFRM09yelZwY011UlY5M2JEdGFJcENIVmZldllpQUFEcExIeTdPSFNDaXM0?=
 =?utf-8?B?QWFERXUySW9LaWZQKzJIRnRsL09iTEhvSkNWTzY2ZTVveVI3U3BZNENmNWRN?=
 =?utf-8?B?dVdyY01DMlpDU3hFRDBpNXBaeUc3RE9ZQ0lOZ29xZlFYTTBLYk1WN2tNbjJx?=
 =?utf-8?B?YnBLQXFCaHpiSWZHaWxraG1vUjRzcmJUNVk0aFlwb0UvRGdwR05PZDdVSWVr?=
 =?utf-8?B?OGlHVFhsZ201WjVHcU0renBRdmROUUJtZlN0ZTQwbmJDNnFKcEMyYVZrVnNs?=
 =?utf-8?B?UzdDdnlYZ3RLekg3UUFNZDkzTWhuOHpiS2QwU1p1Rm5iOXBxaVhGYldNTHVp?=
 =?utf-8?B?cGllaEVnY2VhMVJsVThIWWRVL29wYzZXWjhxSjFJQ2hoMml0dU5qTUNVWTJF?=
 =?utf-8?B?MVBsczFVVkZGdytleHBzZzExMlVmTW12ZUlrWHdUV1BkbkU0NFA5c2FyVTdv?=
 =?utf-8?B?U2dQNi9NVW1qV1R0Z0UySWdFWHhPSmpEbFlNMUtIakNjUXRFQjU4UE1iUGcw?=
 =?utf-8?B?NW9RZWhJNitlc0xRRWVOc1ZCaGh1dEl4RXB2L1B3SVQvKzEwcmN6SVFCV1pV?=
 =?utf-8?B?QXJPUHdqTnVtbnVjb3RxZjRjbW1Ka0t6MDNMb2ZYUkg2dUxjYWtBK2hPQTFF?=
 =?utf-8?B?Z2N0ejEwTFBuUVBwYUtHRU1YUWFGS3lxVWhHQWNPSktQQUlCeDVpb29XS0oy?=
 =?utf-8?B?aW9pYkx2TitReFF0OUNQQWh5TWpsR3BncjdLSkY2MVorN3BGWFIvMWFpNk9h?=
 =?utf-8?B?YTkrMGVpdjlVR3B3NHU3dG1OM2JzMndZYVE2aEE0SVoybmVZNXNTME9oSitT?=
 =?utf-8?B?SmV3ZFR6ZCtPQ2MwZnFubHRiOHhySHQyb0ovNlR4WldiUUhrZ2dzYW9ndVlq?=
 =?utf-8?B?Mm9xV2t3QWhEYmp1R2RRRy9yUDNBallrMnJrNWplZWxkbzdta3JxQ2RjS2Ew?=
 =?utf-8?B?cUtVaEgxaytrbjR5T0hmR3R6YUFxQW81WmZXRkdycHFiWVNrMllHeEZ5d3VK?=
 =?utf-8?B?dGFnUXZJeWhsMGtQTlBTSTlPTSsyT09JWkFnUVFtS0NqaGxLYzA4eTE4NEpQ?=
 =?utf-8?B?Qy9CQ05pUVRLWDZsamNxSmo4S1BZNnhkTEU2aFVVdlhvVE93bHlGNy9IR1Yv?=
 =?utf-8?B?dXFPWlFUd05ObllmZkNXRDA0T1YrYnE0VlpKYkNqaU1nY2kwMVBnMGdhaTZp?=
 =?utf-8?Q?7s7cLa/EGnQ6+hqbWnT4kJ87k7D569Pu?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MFIyZTR0cFNsWmVSQkJza3lpWFpXZUt5bGJsMlRhcGwyaFJEdE1uRnZVa2ww?=
 =?utf-8?B?QWN5bXZYNTgybi9oa0J2MDlmNXRaMEZLV1JaMXN1dllFTnhDclJYSW5RUUJL?=
 =?utf-8?B?bjlra1djTkxaSmtqR0lpREhpUHNIQThCSXYvaGRCb01vMHAwWUNpS0cybFBL?=
 =?utf-8?B?SW9CVVZTNnpJeEozT01ibHRLV0J1amZZWHF0TFlnVkVtVnpTcjZVWm5RNWFw?=
 =?utf-8?B?NG5EeXJVd2RSQ1g1anNNUW1SYldyT0htdkRBWU9hSjFjSTZ5eWVoak41OVdU?=
 =?utf-8?B?VkU5R3ZocjFPVzhHaVlNZ1F4dzl2TDRhOEtyeEdUZkMxTGJhVTJYZVhzL1NB?=
 =?utf-8?B?QktvSWpMVWhHWFZmK0dqb1R6T2tJK0s3S2FOS2FvSXhURDA3YXRmek5BUy8r?=
 =?utf-8?B?YXN3NXFSMjJjQ2pQdHVIUWdXRlBYNTBrY3BmYmdqdFBTQjVRUWlONVNUQlJw?=
 =?utf-8?B?TkZ3RCtscmRsUEZWVHFselRhSmh0WXNDS1hXemh3RFhGbTZHQmpMK3d6M3Fo?=
 =?utf-8?B?WHVrVktINTc5ckgxbkR3TTE3S1N0MVZWUkwxS0lwc1cwZ0RhcjJZVkhpRHU0?=
 =?utf-8?B?Q2Q3NnovSmNrNUhORUgrUnc2b0dtTHY0NzZnL2dKdDB1QmRUaWw0MTc5S1hp?=
 =?utf-8?B?WWlPM25xd0VUZXRMcWR6aVpjVVQ4VmlIRmpIbHpvbzRaL2p5ODFGU3RxZG4x?=
 =?utf-8?B?NmdNWUlIRDUwVkxCUTc2TVRRd1U3Q2hyb29mNXA2cGZidERaKzRHbDVOa3E0?=
 =?utf-8?B?d2F2RkVZaXAybjFvRis2YnRLMWpUekY3ZmpDeDAyeTc5YlE0N1lVOUZYMTNu?=
 =?utf-8?B?Y2hlWmlLZi9ZVUlNV3VBM3BRSU9mc3Fvb05OM2RkYmZMMWxzZW43NzlOY0hJ?=
 =?utf-8?B?U25VWXpucnNtVjVCa1FCelJXeGpqWThrTUhsTXZSa1hDVkZYcHdwbmszN0l4?=
 =?utf-8?B?aTkwRHVneGQ5dFROdWthWk41UDdQTWhsa2VickFSb3EyZno2UG9ucnAxQVhw?=
 =?utf-8?B?a2NYUWlvS1dJQ2tXMlpRQlc0eUZsTE9Wam15Q3lhNFFMUElRRjQyVWhHYWo3?=
 =?utf-8?B?WUxTWGw3MkRTSFpHQUdvaFZvbTJIZUNXY1pQTTBFdWNvcTlNOFIyVWF2dVFB?=
 =?utf-8?B?QmxiNWdhWXU1WnVpUDJVK0dBcnRqczhIcnNtVkw4czM2WGlxU2hkcUdHKy82?=
 =?utf-8?B?S2dFYTBkbFJHc0YzZG44d0EwS3o3S1NkMlRIcW1wL0xIazFQRGI3NHFiUzhu?=
 =?utf-8?B?TDZ5Z3R1ZW5EOG50a05XWitlbGhCS3JVZ3QzRTBlcGc0VlRUNk9hb0RTSkdk?=
 =?utf-8?B?QS9BbXFaeUw4bEg3cU0ydzdWL3YwVE1hYnBROTdnWWxTOFJIZzdQajZNeTQz?=
 =?utf-8?B?eHBWN2dwZ2xSTEsyU1F6QVMxU0lERmpIaGhFNHhDdE5VVkp2Mk44Ly9PbGZB?=
 =?utf-8?B?RGlGOFY5ekdXRDRQQWlNU1VSRjdGR3JMV1J2ajdwZUpKS1c3eFh0M0ZvWktj?=
 =?utf-8?B?d1NISzZzYWxRcjF4ZUZkZHFhNFd0MFViaVJ4YzVIMGE5U1ZnTkd2MmphSUw2?=
 =?utf-8?B?UCtEaHRDZmlGZ29PZDkrZVl4OVgzUE9QTEd4eDJ6Q0dSdytrVkQrUWMwK0NN?=
 =?utf-8?B?Z29scmE3ZGFzWXlTVldEMFIvQjUwK2pBb1Vxc0V5dEdYamt1Z3pwTVVHSXZV?=
 =?utf-8?B?Q2I1S2NGNXZNc0dhSVg4aTIyaWU0MG1VR0pzRWNRSC9xV3RFM0pkOGJUZFZ0?=
 =?utf-8?B?Ynl1L0lDaG9hM2dWTVh3bStObkpXSWRudzJib1hNbnJMcld0Uk1mZVk3bDJN?=
 =?utf-8?B?M1pqRDBMUDFjcVdaVHc0SmloOXhqcXNRNWp1eDZWczVSbmt3Ums2OEF5MXJz?=
 =?utf-8?B?NDZ5SWlGdzg3WWUzVmVJOVd6UGIrYlc1R0RMK0VvT2dCWTc0RHoxNEM3ZENs?=
 =?utf-8?B?RzhWWmp4Qk1WY1FxM3FjSXk2RjQ5TFRHSTRiZ2FPbnF4NHI3azNzblJ4djRo?=
 =?utf-8?B?T0NTdTJMcE9nNll4R2dKOStna2gycCtEZ1ZFcTJEMUZQKzFtYjRuY2MvVFRX?=
 =?utf-8?B?ZFlkUjBIVEtQZk8zQm9Rc0hsams0d0dNdmU2aXBmb1V1L2NvZXlEaVkzajRq?=
 =?utf-8?Q?gecJW7THmsZYBgQ6Qw9e7jZMW?=
Content-ID: <02D90CFBE6E43142849C9F0AD39C0641@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11e1b413-f76b-478d-e517-08dd20d65b18
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2024 09:11:57.9726 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4kJldYUUw4rhhyuT4gkhS/Y1Lx5+QJdlNFakbNNheTA2z+19H4MIUKtD5xmum9AEaLr5ncN113Br9MFrNOsjQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7197
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_009_192594024.822997817"
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

--__=_Part_Boundary_009_192594024.822997817
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEFuZ2VsbzoNCg0KT24gVHVlLCAyMDI0LTEyLTE3IGF0IDE2OjQzICswMTAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZp
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBJZiB0aGUgY2xrX3ByZXBh
cmVfZW5hYmxlKCkgY2FsbCBmb3IgdGhlIFNQRElGIGNsb2NrIGZhaWxzLCBqdXN0DQo+IGRpc2Fi
bGUgYW5kIHVucHJlcGFyZSB0aGUgY2xvY2sgaW4gdGhlIGVycm9yIGNoZWNrIGJyYW5jaCBhbmQN
Cj4gcmV0dXJuIGltbWVkaWF0ZWx5IGluc3RlYWQgb2YganVtcGluZyB0byB0aGUgZW5kIHdpdGgg
YSBnb3RvLA0KPiBzbGlnaHRseSByZWR1Y2luZyBjb2RlIHNpemUuDQo+IA0KPiBUaGlzIGNvbW1p
dCBicmluZ3Mgbm8gZnVuY3Rpb25hbCBjaGFuZ2VzLg0KDQpSZXZpZXdlZC1ieTogQ0sgSHUgPGNr
Lmh1QG1lZGlhdGVrLmNvbT4NCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5nZWxvR2lvYWNjaGlu
byBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4NCj4g
LS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYyB8IDkgKysrKy0tLS0t
DQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jIGIvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMNCj4gaW5kZXggN2U0NTM2MzkxY2ZiLi5k
YmNiOWZiMDllZGQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
aGRtaS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jDQo+IEBA
IC0xMDk1LDEzICsxMDk1LDEyIEBAIHN0YXRpYyBpbnQgbXRrX2hkbWlfY2xrX2VuYWJsZV9hdWRp
byhzdHJ1Y3QgbXRrX2hkbWkgKmhkbWkpDQo+ICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Ow0K
PiANCj4gICAgICAgICByZXQgPSBjbGtfcHJlcGFyZV9lbmFibGUoaGRtaS0+Y2xrW01US19IRE1J
X0NMS19BVURfU1BESUZdKTsNCj4gLSAgICAgICBpZiAocmV0KQ0KPiAtICAgICAgICAgICAgICAg
Z290byBlcnI7DQo+ICsgICAgICAgaWYgKHJldCkgew0KPiArICAgICAgICAgICAgICAgY2xrX2Rp
c2FibGVfdW5wcmVwYXJlKGhkbWktPmNsa1tNVEtfSERNSV9DTEtfQVVEX0JDTEtdKTsNCj4gKyAg
ICAgICAgICAgICAgIHJldHVybiByZXQ7DQo+ICsgICAgICAgfQ0KPiANCj4gICAgICAgICByZXR1
cm4gMDsNCj4gLWVycjoNCj4gLSAgICAgICBjbGtfZGlzYWJsZV91bnByZXBhcmUoaGRtaS0+Y2xr
W01US19IRE1JX0NMS19BVURfQkNMS10pOw0KPiAtICAgICAgIHJldHVybiByZXQ7DQo+ICB9DQo+
IA0KPiAgc3RhdGljIHZvaWQgbXRrX2hkbWlfY2xrX2Rpc2FibGVfYXVkaW8oc3RydWN0IG10a19o
ZG1pICpoZG1pKQ0KPiAtLQ0KPiAyLjQ3LjANCj4gDQoNCg==

--__=_Part_Boundary_009_192594024.822997817
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtBbmdlbG86DQoNCk9uJiMzMjtUdWUsJiMz
MjsyMDI0LTEyLTE3JiMzMjthdCYjMzI7MTY6NDMmIzMyOyswMTAwLCYjMzI7QW5nZWxvR2lvYWNj
aGlubyYjMzI7RGVsJiMzMjtSZWdubyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtFeHRlcm5hbCYjMzI7
ZW1haWwmIzMyOzomIzMyO1BsZWFzZSYjMzI7ZG8mIzMyO25vdCYjMzI7Y2xpY2smIzMyO2xpbmtz
JiMzMjtvciYjMzI7b3BlbiYjMzI7YXR0YWNobWVudHMmIzMyO3VudGlsJiMzMjt5b3UmIzMyO2hh
dmUmIzMyO3ZlcmlmaWVkJiMzMjt0aGUmIzMyO3NlbmRlciYjMzI7b3ImIzMyO3RoZSYjMzI7Y29u
dGVudC4NCiZndDsmIzMyOw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtJZiYjMzI7dGhlJiMzMjtjbGtf
cHJlcGFyZV9lbmFibGUoKSYjMzI7Y2FsbCYjMzI7Zm9yJiMzMjt0aGUmIzMyO1NQRElGJiMzMjtj
bG9jayYjMzI7ZmFpbHMsJiMzMjtqdXN0DQomZ3Q7JiMzMjtkaXNhYmxlJiMzMjthbmQmIzMyO3Vu
cHJlcGFyZSYjMzI7dGhlJiMzMjtjbG9jayYjMzI7aW4mIzMyO3RoZSYjMzI7ZXJyb3ImIzMyO2No
ZWNrJiMzMjticmFuY2gmIzMyO2FuZA0KJmd0OyYjMzI7cmV0dXJuJiMzMjtpbW1lZGlhdGVseSYj
MzI7aW5zdGVhZCYjMzI7b2YmIzMyO2p1bXBpbmcmIzMyO3RvJiMzMjt0aGUmIzMyO2VuZCYjMzI7
d2l0aCYjMzI7YSYjMzI7Z290bywNCiZndDsmIzMyO3NsaWdodGx5JiMzMjtyZWR1Y2luZyYjMzI7
Y29kZSYjMzI7c2l6ZS4NCiZndDsmIzMyOw0KJmd0OyYjMzI7VGhpcyYjMzI7Y29tbWl0JiMzMjti
cmluZ3MmIzMyO25vJiMzMjtmdW5jdGlvbmFsJiMzMjtjaGFuZ2VzLg0KDQpSZXZpZXdlZC1ieTom
IzMyO0NLJiMzMjtIdSYjMzI7Jmx0O2NrLmh1QG1lZGlhdGVrLmNvbSZndDsNCg0KJmd0OyYjMzI7
DQomZ3Q7JiMzMjtTaWduZWQtb2ZmLWJ5OiYjMzI7QW5nZWxvR2lvYWNjaGlubyYjMzI7RGVsJiMz
MjtSZWdubyYjMzI7Jmx0O2FuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbSZn
dDsNCiZndDsmIzMyOy0tLQ0KJmd0OyYjMzI7JiMzMjtkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2hkbWkuYyYjMzI7fCYjMzI7OSYjMzI7KysrKy0tLS0tDQomZ3Q7JiMzMjsmIzMyOzEmIzMy
O2ZpbGUmIzMyO2NoYW5nZWQsJiMzMjs0JiMzMjtpbnNlcnRpb25zKCspLCYjMzI7NSYjMzI7ZGVs
ZXRpb25zKC0pDQomZ3Q7JiMzMjsNCiZndDsmIzMyO2RpZmYmIzMyOy0tZ2l0JiMzMjthL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jJiMzMjtiL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfaGRtaS5jDQomZ3Q7JiMzMjtpbmRleCYjMzI7N2U0NTM2MzkxY2ZiLi5kYmNiOWZi
MDllZGQmIzMyOzEwMDY0NA0KJmd0OyYjMzI7LS0tJiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfaGRtaS5jDQomZ3Q7JiMzMjsrKysmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19oZG1pLmMNCiZndDsmIzMyO0BAJiMzMjstMTA5NSwxMyYjMzI7KzEwOTUsMTImIzMy
O0BAJiMzMjtzdGF0aWMmIzMyO2ludCYjMzI7bXRrX2hkbWlfY2xrX2VuYWJsZV9hdWRpbyhzdHJ1
Y3QmIzMyO210a19oZG1pJiMzMjsqaGRtaSkNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7cmV0dXJuJiMzMjtyZXQ7DQomZ3Q7JiMzMjsNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtyZXQmIzMyOz0mIzMyO2Nsa19wcmVwYXJlX2VuYWJsZSho
ZG1pLSZndDtjbGtbTVRLX0hETUlfQ0xLX0FVRF9TUERJRl0pOw0KJmd0OyYjMzI7LSYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7aWYmIzMyOyhyZXQpDQomZ3Q7JiMzMjstJiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7Z290byYjMzI7ZXJyOw0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7aWYmIzMyOyhyZXQpJiMzMjt7DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7Y2xrX2Rpc2FibGVfdW5wcmVwYXJlKGhkbWktJmd0O2Nsa1tNVEtfSERNSV9DTEtfQVVE
X0JDTEtdKTsNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtyZXR1cm4mIzMyO3JldDsNCiZn
dDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO30NCiZndDsmIzMyOw0K
Jmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3JldHVybiYj
MzI7MDsNCiZndDsmIzMyOy1lcnI6DQomZ3Q7JiMzMjstJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjtjbGtfZGlzYWJsZV91bnByZXBhcmUoaGRtaS0mZ3Q7Y2xrW01US19IRE1JX0NM
S19BVURfQkNMS10pOw0KJmd0OyYjMzI7LSYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7cmV0dXJuJiMzMjtyZXQ7DQomZ3Q7JiMzMjsmIzMyO30NCiZndDsmIzMyOw0KJmd0OyYjMzI7
JiMzMjtzdGF0aWMmIzMyO3ZvaWQmIzMyO210a19oZG1pX2Nsa19kaXNhYmxlX2F1ZGlvKHN0cnVj
dCYjMzI7bXRrX2hkbWkmIzMyOypoZG1pKQ0KJmd0OyYjMzI7LS0NCiZndDsmIzMyOzIuNDcuMA0K
Jmd0OyYjMzI7DQoNCg0KPC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlwZTp0ZXh0LS0+
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

--__=_Part_Boundary_009_192594024.822997817--

