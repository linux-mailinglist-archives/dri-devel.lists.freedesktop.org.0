Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B458F9FAA7C
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 07:35:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8154310E17D;
	Mon, 23 Dec 2024 06:35:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Bsn7wgzs";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="GVOmdxHt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24F6F10E17D
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 06:35:47 +0000 (UTC)
X-UUID: 21df6e22c0f811ef99858b75a2457dd9-20241223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=bDew0izqorUE2mEJ8/gx5d1s79OMUowRx3aG04UbwqU=; 
 b=Bsn7wgzs9WFwn63ynethiSO1E6Yo9tZoE8doE2gL5ThiKqbxFwxfQLKNVsUUmOgEtErSPm7YDzax1gTKQtZhlBhnS7zBBe55fzr0nGU23XOa6eBCg3g1x5bw7s4wxubl0N1rlbxUHOte/O/PJ7kq/3flgSK0GwXy0XKh744RS3Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45, REQID:acdba885-00a6-4716-8bc1-2960b48cd182, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6493067, CLOUDID:bd68be36-e11c-4c1a-89f7-e7a032832c40,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
 :-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
 ,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 21df6e22c0f811ef99858b75a2457dd9-20241223
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1408597630; Mon, 23 Dec 2024 14:35:42 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 23 Dec 2024 14:35:41 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 23 Dec 2024 14:35:41 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cjnlTV0R+N7q2KnhhSXWyh7qOnbrlC70kNoExol7hSKhHCu4KQrG2J9qIvDFWlw/hdBv3xgpxMjsF1pmYSKvZ/bgBgyd/Uk4mmas+sU8Aw+Lnj7rnf4qJr9Ir0KfE+FVUQnVEm3H1xZsbicSWrSAl5kKhedqb1sNQ1HRQEAYfRLq4S4YBRtGjSGi0MGfIxCPSvnNG2tMtzj2bRxDeZkoJasdZ+Y7Iy5x+rTLmFqEHcCBheS2CyHIMT4TklwI+TsP3SVe7qNFFctXTin7Kdg9U6LnPK61KjEfjIBz2WzWRV0HajzNih+ZzaDfhrRSKYOZqf0fqbKYFWLfomp0MPlTew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fSfowaWVG7iInasZ70vIXQCQC7apkbSPvcK4+JB1f4I=;
 b=gt6j/mh3akSKm7DO/0WMEShR2PiHdz8welgu4f40EV1VZKG/3gugUhOt8xqJKalgt7/4F6ldE2XvQ2lfN7NRrBXtUASDZOsObIXapBJUhke5swZ66IZ34NryuYTFy5QUhKbvv9EfZxfPS3ba0bA5FSLnAzv3sEXvgOH58ePCRCYtuXSoAVMsRjU6eHJ7UPBcz9Ao7zoPPPQD8QaWN3BevpCOJZvu2rrhmeGE2OMmFeNDfbDMqdfMhLsXU3HMmF+XQayF2GayteHYhDlRKu3pP9OO/UHvUOe1kz4nBlccLiktU8L8ToR5zvv1UpOhibG4pOtjjkDyyfkw/Kyxk94BCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fSfowaWVG7iInasZ70vIXQCQC7apkbSPvcK4+JB1f4I=;
 b=GVOmdxHtH8mWSdzvGgqx0fQCZxQaaBZsYxX7rTEkeRvYPykhA/OtV2OG0kXhmPUFvcUQR9oOIa+oYpp+AyNlPD+wQ3cXgYZ6BfQ8RipZTptU/xlHnZ4vD8HfaLXtFuxlZcKVgC2tRXxm4TxvoNmaTSybZNbVcoBMcWphYyWQpqI=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB8293.apcprd03.prod.outlook.com (2603:1096:405:1e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.17; Mon, 23 Dec
 2024 06:35:39 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8251.015; Mon, 23 Dec 2024
 06:35:36 +0000
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
Subject: Re: [PATCH v3 24/33] drm/mediatek: mtk_hdmi: Remove ifdef for
 CONFIG_PM_SLEEP
Thread-Topic: [PATCH v3 24/33] drm/mediatek: mtk_hdmi: Remove ifdef for
 CONFIG_PM_SLEEP
Thread-Index: AQHbUJrOC1atj6gps0WBxXK1RgdIDbLzaIiA
Date: Mon, 23 Dec 2024 06:35:36 +0000
Message-ID: <498667e57b24c754d87742854bfbedfc821931cf.camel@mediatek.com>
References: <20241217154345.276919-1-angelogioacchino.delregno@collabora.com>
 <20241217154345.276919-25-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20241217154345.276919-25-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB8293:EE_
x-ms-office365-filtering-correlation-id: 367f6d92-00ef-4c4f-9d65-08dd231c02c6
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?MzJXWUEzRnR3RDFwNUpHUDFuUjJ5Qk9iWmdya1ZzMFU5MlRsNmdHZU5kR0sz?=
 =?utf-8?B?OWU4WlpvNmJnekdzL3c0YjYrRWpXRTJiVDIwSlJsV05EOVJjeE5xVHNSOGVP?=
 =?utf-8?B?RWowN2FpK0h4eGorSmZrRjlBVzBBUTEzMWw0d200ZnU5Q3pGVXozZXN2dmxJ?=
 =?utf-8?B?R1BJYWRwN1doTENTdDJCaXVhNWJ1US9qbW5pdlh0OHNocXhqSzRkOHRmSTBU?=
 =?utf-8?B?Ykh1aDk3S0o1aGluMlBTS3VtNnVkRnk0dyt3M2haSjFmMVl1bGM4NTFUUmdk?=
 =?utf-8?B?WFVKWkJkRklUTnRYcXRVUC8xNHNvU1cvU1pkU2lRbHBqdVhRRFFwUkYwRmhQ?=
 =?utf-8?B?NWhwaFZNdGNGZ09paFB6anVEWkE5azdHY1QzT3EyMVZReE9tMHkveUpyQmgz?=
 =?utf-8?B?V05rWmQ3eDA2aXpDSk0zNEJqSTRMdUpFeTBWTHZPTjhwd1NlS0x0aFo5bG9L?=
 =?utf-8?B?TjlmYUpMVWJzeFdlUFkyMEhUbXR1a0R6MU1rYVIwdjhncFFnWnZkSk02NzhU?=
 =?utf-8?B?R0x1WDR2ZU8vRGtvSTlDS3BOT0JzSGFjanlIdWJYYTE5NjR2YUNhZytSVnFP?=
 =?utf-8?B?bkJXS09wY3FTR0J4czljUGdxWWRWOE05YWRJM3ZBTTVMSkQ0V3dYd3lJKzNY?=
 =?utf-8?B?aFJwa1ZyZ3dIUEJBUVNZVVRGVURiTk9EZUppMVJ0dk14YVNzNUVPSnYyZm9S?=
 =?utf-8?B?ckpVS0p2TUtJQ1hFSVZDNGJqMmw0NWtOeEMwN1hFamZkaExmemc0Smo1RW1X?=
 =?utf-8?B?MlcreTVOT3JNeG91clNIa1JTc1U3cTBRdHNSdXZqQkVqL3R2OVZZaGhGRmZF?=
 =?utf-8?B?RDl6b1dYSGw3TDJyMHRmYnpGcFBxbFpMWWNvZVR2OWxlNWprenVuRU9WM2J4?=
 =?utf-8?B?SWw4ZThXVCtvcWRsOTJpL053NC9NUTgwRkxIUEphenR2QlVTK1lRSVFObkxN?=
 =?utf-8?B?OC9TZ1ZwaWwydFJDejgveFZ4S0lmL253czg2dFdpQUdFb0V5RW0yeFR6Y3c0?=
 =?utf-8?B?YW9RNkJKdUc3eFE5VDZxYmJIdEFFakFEemVFbU9YL2Z4Sk4zYUNyb3pQR1Zo?=
 =?utf-8?B?N2trQWI3OTQvOVUvVjY5SUE4RTRkeWtoNnNXOVkzbkkvT0lVV3JLNnBTQkty?=
 =?utf-8?B?NlpRT2o0QksyVnEwTENjUEVWOE8yL3NrOStPdjY5elpFdWp4Y0c0Y0tYM283?=
 =?utf-8?B?TzdqUlVEWVlVYnJJUjZYUEIvUEcvTE5PaFJTd1BxMHZqczl4K2pCaGMzRnE1?=
 =?utf-8?B?bklneFBlTXhTZkZDMHV1RitKd0EwN2hFeG83MCtSaUNaOUUvU25ycjJzdVBt?=
 =?utf-8?B?YjRmRmIwOWNvYVc1UlRGeXVrejMvN0V1ZFcyTDhXTWJ3ZWUvQ2h3cll1YWE0?=
 =?utf-8?B?T0k3Wkx6bWtPMERhNnpkVHkxRGNjb2xrdlpTM0hEdTRiUzUwVlYvUUtEdlR5?=
 =?utf-8?B?T3dPLzZKQVhQTERFUUNuQSttdE5FbnZud2Y0YVBiS2VnUG4wV1phOVY4aFpr?=
 =?utf-8?B?RWc2akpBcUFUL1YxdFRUenpFblZodkR4NktQYzVrRzdYcTNLQjN4Vk1vT3VT?=
 =?utf-8?B?a1ErdTBEQ2FRK3FHelhYV3djUmpyOXRFU1ZiZ044ZjlGeG9jclAwU0tXQmRR?=
 =?utf-8?B?RnBFSTYrSXNRdncveFJVWmNMenI5UU5lbGk1Z0VxNzhGY0w0NHlRSEJHOTlZ?=
 =?utf-8?B?Qk8yMWd0R2U0SDdtYnZzTHh4ZTdZS3Z2UWpTSUJRYk9yb0Z3YnhQbUJGd3Ft?=
 =?utf-8?B?T3UzT3JsTElJTSt2dnRjaHl5NjEyVkQrODEzMTBzOVBDT0VlTjBTZUE5bDkx?=
 =?utf-8?B?ZElHOHlFajI1OTVXL0gxWTVrSFl6b2hubW5jenVUczFUWktMZHhTQTduRXlx?=
 =?utf-8?B?U2FFQS9YZjE1UmYxL1ZHbWdZQ29VSEhXaW5SZ20yN2oxWHVuQzNEakJkTmpP?=
 =?utf-8?Q?Ef5dTDZSHDiwMpK3si75L7Z9yoeM6nhH?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M3RDL1JmNytKS24vbW1KWFcybWhMbk44QnVYR1RVelhuMGhkVXo2QkdQVDl1?=
 =?utf-8?B?Z3pmTDNkVmkySkdqb2pjRWpWUE51ajdQQzA5Vi91cHpQQWg1SFZFWVprL0g0?=
 =?utf-8?B?SytpeHlNaXFYUWo1YUEwUFZsODFNdkFGd0gxcGpFMklnQmZ0QmxtZkVVQ2k5?=
 =?utf-8?B?YWZ0NUk2SkpFR28yMDBSaDZRcnNtRzB0ME11M25MbGU4cmF3WDB6SCtKdGh0?=
 =?utf-8?B?bGx3aElTRVk2cGJreTFJeXJ3Nk5HdHlsMEdMS2Z0M1lmWjk4cHRyc1ZtMWtG?=
 =?utf-8?B?SGxPZU1KMU8xUldoemJyeU5Ra1ZDdzZQNCszVmdsczcrVElFRmdmd2xjNFp2?=
 =?utf-8?B?OEx5NFVkT0pkYlBHY3ZyYnlacTJXNG5UQ2hJTEJFMytWNms4NUs0dC9IL1Js?=
 =?utf-8?B?QzRWN3VDMy9qemxHZWRNQUdiRXJpekYyNlFhRWdjblNnN1lyenBwVzNkUHI2?=
 =?utf-8?B?QUpqaFh3MktXQnRIR0RnUEJvYTMwNHdZS2ZwaGtDbnViZEh4clkxREM2NFNz?=
 =?utf-8?B?N0hsc0hrbHkrM0Q4SXA2NlpqTGxaNkxyeTl6VjU0OTUzYU5nbkRKNUtsUkl0?=
 =?utf-8?B?QnlFUkY2cHJKakNvdzJEU2RFQzJabVhGUzJpa2JCVXNRTkVoZmtEdjUxVmRu?=
 =?utf-8?B?MnR5L3J3MnZGYjlyR0pMQjZJVExRVnhKang4T2xUY3M5TUxzTWZuVXFJdzB4?=
 =?utf-8?B?YVY2SUQyQWtwbTA3K1dkWk1OL3hYVDUrajR0d1NveWZRS2d5UmFVZERObzJM?=
 =?utf-8?B?OS9wVkZ0MjZCc3pqQjMxSmE4bmxlYzRSY012MkRpRkhEaHdnSXluNS9USmNX?=
 =?utf-8?B?S1NXRVdINFBqUSs5eXRObVFNbVkycWVrWlhaSFdQenlsSGdONy91d01CR2tY?=
 =?utf-8?B?dHVUbWhrVkptaERpZW1HVXBuNC95UmoxVHhybUFMZE1CZ3pnM3hZM3lvYWpO?=
 =?utf-8?B?a1RLb0tzaTVpaHhSQnVLbGlGRmlYUm1vUURTKzRxVlIzNEYvVnoxRHhja0d3?=
 =?utf-8?B?Rjh5ZS9nTkZrSnBpMGZzNzQ4Ujd1eWNSWWhOQTgyYU9WUW1kek5yOFpNK0kw?=
 =?utf-8?B?WFZraU90TVo0ZEtpTmVwdUZUSklKOFFOeDFnSjREaUtFWGFKekVEdDJMZDZC?=
 =?utf-8?B?VDJ5cGNFQk1CZE1HVWpLZlpseUo5SStlMENLRnE4V25oQ3J0KzZGWWJLNDQ3?=
 =?utf-8?B?WVhEQ0lzOGZBeWlTNmx2bTROMVZibHY2WDNCNmMxVTEzb0MvZm5mS0QyWTR4?=
 =?utf-8?B?bVlyUVFXUGNKRU5XWDl4R055SVphMjRCUDJnWXFrc0VJd2hGelBjZk5lUllR?=
 =?utf-8?B?eHEwTHd2RWRpdEJPS1ViNzdTUWdjRG1JK3JnRDFLcUUrQ1EweGlyMk16djJr?=
 =?utf-8?B?bE9WTlpaV290STNtZW1IMlVBQnR5WkFucFkrN2hXZThVK25IWWtUT0Q0bnpw?=
 =?utf-8?B?L0pWOEk3Rjgva2R4bm9YOXFyaXVGM0xzSHIreERCdm9TMlZOWEQ5Rnc4YmdZ?=
 =?utf-8?B?N0pBem5MR0RrSjNjdzF4a2dIWjJ3bGNIZ1p4endpcXc0OExNRERxK01USXJu?=
 =?utf-8?B?K0NlQVJuaG1ST3hUUWJHdTBmYkhyMElJY1JVU25oSzJ6cXBjV2xCNFlsS2c5?=
 =?utf-8?B?R2xtKzZWTXl2NVY1NDV4YTJVQXkwY1p5ZXd1RVVkdXNCWWE1TDEwc3FIVlVD?=
 =?utf-8?B?T1pJNVdPM1o4UzNEdE04SkxHdllOQ3RTRUcxRFkzZGFhZTY2NmNwbHRwSHRr?=
 =?utf-8?B?eEFFRXZYZ3RIbkJFbzJHWFNpVEtaR1lrUWpvcllraEFZYkpDOUF2ZjBqa3Ix?=
 =?utf-8?B?cEVUNC9mTG5KT3RiSnJvTVI0aXRRTXFOczhvY0MyTVpYZ2g0MGp3aGxyaUoy?=
 =?utf-8?B?bTBEbzVTenJ2dEgzZnRoMUlMbWhablI3MGxSR0xTN0JXSDJqcklMWG9IU3Jv?=
 =?utf-8?B?cHRvcHFCSEZwSVlOa2hScUc4WlBYbXZZVzhpZVdQS2UyQW8xY0FkUUowN3cz?=
 =?utf-8?B?UTJjQ0VqUzdRbysrSWRiL2VoQjJJOVBWSzVWK0d4M2I3NElMR1BHT3NyWEEz?=
 =?utf-8?B?UFU3dytqUXlBR0V3R3FqTUUvS1NDS3FHUG9EWGN2Y3doaThIdmhrU1lmZ1JZ?=
 =?utf-8?Q?SOyClHu/iAbyAt9Z+YmxDRC5S?=
Content-ID: <A3868F81F17B5E4D9ED5EF8258C75E43@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 367f6d92-00ef-4c4f-9d65-08dd231c02c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2024 06:35:36.8928 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JboUTYDUFoc07FBzPXQ08Q6DMTJvBo5/CPfDjlZHZ+gC7kFThQySHWCDvPEhkOmYKe/Lbr/VrIRDOZtanEtzsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8293
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_005_1066604587.1426798342"
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

--__=_Part_Boundary_005_1066604587.1426798342
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEFuZ2VsbzoNCg0KT24gVHVlLCAyMDI0LTEyLTE3IGF0IDE2OjQzICswMTAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZp
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBTaW5jZSB0aGUgU0lNUExF
X0RFVl9QTV9PUFMgbWFjcm8gYW5kIHRoZSBwbSBwb2ludGVyIGFyZSBhbnl3YXkNCj4gZGVmaW5l
ZCB3aGVuIENPTkZJR19QTV9TTEVFUCBpcyBub3Qgc2V0LCByZW1vdmUgdGhlIGlmZGVmIGZvciBp
dA0KPiBhbmQgaW5kaWNhdGUgdGhhdCB0aGUgbXRrX2hkbWlfe3JlbW92ZSxzdXNwZW5kfSBmdW5j
dGlvbnMgbWF5IGJlDQo+IHVudXNlZCAoYXMgdGhleSBhcmUsIGluIGNhc2UgUE0gc3VwcG9ydCBp
cyBub3QgYnVpbHQtaW4pLg0KDQpJIHNlZSBtYW55IGRyaXZlciB1c2UgQ09ORklHX1BNX1NMRUVQ
LA0KYW5kIFNJTVBMRV9ERVZfUE1fT1BTKCkgaXMgZGVmaW5lZCB0byBzdXBwb3J0IHN1c3BlbmQv
cmVzdW1lIGZ1bmN0aW9uIGlzIG5vdCBleGlzdCB3aGVuIENPTkZJR19QTV9TTEVFUCBpcyBub3Qg
ZGVmaW5lZCwNCnNvIHRoZXJlIGlzIG5vIHN0cm9uZyBwdXJwb3NlIHRvIGFwcGx5IHRoaXMgcGF0
Y2guDQoNCj4gDQo+IFdoaWxlIGF0IGl0LCB0byBpbXByb3ZlIHJlYWRhYmlsaXR5LCBhbHNvIGNv
bXByZXNzIHRoZQ0KPiBTSU1QTEVfREVWX1BNX09QUyBkZWNsYXJhdGlvbiBhcyBpdCBldmVuIGZp
dHMgaW4gbGVzcw0KPiB0aGFuIDgwIGNvbHVtbnMuDQoNCllvdSBoYXZlIG1hbnkgdHlwZXNldHRp
bmcgaW4gc29tZSBwYXRjaGVzLg0KQnV0IEkgdGhpbmsgdHlwZXNldHRpbmcgaXMgbm90IHJlbGF0
ZWQgdG8gdGhlIG1haW4gcHVycG9zZSBvZiB0aGF0IHBhdGNoLg0KSSB3b3VsZCBsaWtlIHlvdSB0
byBnYXRoZXIgdGhlc2UgdHlwZXNldHRpbmcgbW9kaWZpY2F0aW9uIHRvIGEgcmVhZGFiaWxpdHkg
cGF0Y2guDQoNClJlZ2FyZHMsDQpDSw0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbmdlbG9HaW9h
Y2NoaW5vIERlbCBSZWdubyA8YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29t
Pg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jIHwgMTAgKysr
Ky0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMo
LSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWku
YyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jDQo+IGluZGV4IDVkNDZkNDg2
YzY4Zi4uN2U0NTM2MzkxY2ZiIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2hkbWkuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWku
Yw0KPiBAQCAtMTY5NCw4ICsxNjk0LDcgQEAgc3RhdGljIHZvaWQgbXRrX2hkbWlfcmVtb3ZlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICAgICAgICAgbXRrX2hkbWlfY2xrX2Rpc2Fi
bGVfYXVkaW8oaGRtaSk7DQo+ICB9DQo+IA0KPiAtI2lmZGVmIENPTkZJR19QTV9TTEVFUA0KPiAt
c3RhdGljIGludCBtdGtfaGRtaV9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gK3N0YXRp
YyBfX21heWJlX3VudXNlZCBpbnQgbXRrX2hkbWlfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYp
DQo+ICB7DQo+ICAgICAgICAgc3RydWN0IG10a19oZG1pICpoZG1pID0gZGV2X2dldF9kcnZkYXRh
KGRldik7DQo+IA0KPiBAQCAtMTcwNCw3ICsxNzAzLDcgQEAgc3RhdGljIGludCBtdGtfaGRtaV9z
dXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gICAgICAgICByZXR1cm4gMDsNCj4gIH0NCj4g
DQo+IC1zdGF0aWMgaW50IG10a19oZG1pX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ICtz
dGF0aWMgX19tYXliZV91bnVzZWQgaW50IG10a19oZG1pX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpk
ZXYpDQo+ICB7DQo+ICAgICAgICAgc3RydWN0IG10a19oZG1pICpoZG1pID0gZGV2X2dldF9kcnZk
YXRhKGRldik7DQo+ICAgICAgICAgaW50IHJldCA9IDA7DQo+IEBAIC0xNzE3LDkgKzE3MTYsOCBA
QCBzdGF0aWMgaW50IG10a19oZG1pX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+IA0KPiAg
ICAgICAgIHJldHVybiAwOw0KPiAgfQ0KPiAtI2VuZGlmDQo+IC1zdGF0aWMgU0lNUExFX0RFVl9Q
TV9PUFMobXRrX2hkbWlfcG1fb3BzLA0KPiAtICAgICAgICAgICAgICAgICAgICAgICAgbXRrX2hk
bWlfc3VzcGVuZCwgbXRrX2hkbWlfcmVzdW1lKTsNCj4gKw0KPiArc3RhdGljIFNJTVBMRV9ERVZf
UE1fT1BTKG10a19oZG1pX3BtX29wcywgbXRrX2hkbWlfc3VzcGVuZCwgbXRrX2hkbWlfcmVzdW1l
KTsNCj4gDQo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG10a19oZG1pX2NvbmYgbXRrX2hkbWlfY29u
Zl9tdDI3MDEgPSB7DQo+ICAgICAgICAgLnR6X2Rpc2FibGVkID0gdHJ1ZSwNCj4gLS0NCj4gMi40
Ny4wDQo+IA0KDQo=

--__=_Part_Boundary_005_1066604587.1426798342
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtBbmdlbG86DQoNCk9uJiMzMjtUdWUsJiMz
MjsyMDI0LTEyLTE3JiMzMjthdCYjMzI7MTY6NDMmIzMyOyswMTAwLCYjMzI7QW5nZWxvR2lvYWNj
aGlubyYjMzI7RGVsJiMzMjtSZWdubyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtFeHRlcm5hbCYjMzI7
ZW1haWwmIzMyOzomIzMyO1BsZWFzZSYjMzI7ZG8mIzMyO25vdCYjMzI7Y2xpY2smIzMyO2xpbmtz
JiMzMjtvciYjMzI7b3BlbiYjMzI7YXR0YWNobWVudHMmIzMyO3VudGlsJiMzMjt5b3UmIzMyO2hh
dmUmIzMyO3ZlcmlmaWVkJiMzMjt0aGUmIzMyO3NlbmRlciYjMzI7b3ImIzMyO3RoZSYjMzI7Y29u
dGVudC4NCiZndDsmIzMyOw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtTaW5jZSYjMzI7dGhlJiMzMjtT
SU1QTEVfREVWX1BNX09QUyYjMzI7bWFjcm8mIzMyO2FuZCYjMzI7dGhlJiMzMjtwbSYjMzI7cG9p
bnRlciYjMzI7YXJlJiMzMjthbnl3YXkNCiZndDsmIzMyO2RlZmluZWQmIzMyO3doZW4mIzMyO0NP
TkZJR19QTV9TTEVFUCYjMzI7aXMmIzMyO25vdCYjMzI7c2V0LCYjMzI7cmVtb3ZlJiMzMjt0aGUm
IzMyO2lmZGVmJiMzMjtmb3ImIzMyO2l0DQomZ3Q7JiMzMjthbmQmIzMyO2luZGljYXRlJiMzMjt0
aGF0JiMzMjt0aGUmIzMyO210a19oZG1pX3tyZW1vdmUsc3VzcGVuZH0mIzMyO2Z1bmN0aW9ucyYj
MzI7bWF5JiMzMjtiZQ0KJmd0OyYjMzI7dW51c2VkJiMzMjsoYXMmIzMyO3RoZXkmIzMyO2FyZSwm
IzMyO2luJiMzMjtjYXNlJiMzMjtQTSYjMzI7c3VwcG9ydCYjMzI7aXMmIzMyO25vdCYjMzI7YnVp
bHQtaW4pLg0KDQpJJiMzMjtzZWUmIzMyO21hbnkmIzMyO2RyaXZlciYjMzI7dXNlJiMzMjtDT05G
SUdfUE1fU0xFRVAsDQphbmQmIzMyO1NJTVBMRV9ERVZfUE1fT1BTKCkmIzMyO2lzJiMzMjtkZWZp
bmVkJiMzMjt0byYjMzI7c3VwcG9ydCYjMzI7c3VzcGVuZC9yZXN1bWUmIzMyO2Z1bmN0aW9uJiMz
MjtpcyYjMzI7bm90JiMzMjtleGlzdCYjMzI7d2hlbiYjMzI7Q09ORklHX1BNX1NMRUVQJiMzMjtp
cyYjMzI7bm90JiMzMjtkZWZpbmVkLA0Kc28mIzMyO3RoZXJlJiMzMjtpcyYjMzI7bm8mIzMyO3N0
cm9uZyYjMzI7cHVycG9zZSYjMzI7dG8mIzMyO2FwcGx5JiMzMjt0aGlzJiMzMjtwYXRjaC4NCg0K
Jmd0OyYjMzI7DQomZ3Q7JiMzMjtXaGlsZSYjMzI7YXQmIzMyO2l0LCYjMzI7dG8mIzMyO2ltcHJv
dmUmIzMyO3JlYWRhYmlsaXR5LCYjMzI7YWxzbyYjMzI7Y29tcHJlc3MmIzMyO3RoZQ0KJmd0OyYj
MzI7U0lNUExFX0RFVl9QTV9PUFMmIzMyO2RlY2xhcmF0aW9uJiMzMjthcyYjMzI7aXQmIzMyO2V2
ZW4mIzMyO2ZpdHMmIzMyO2luJiMzMjtsZXNzDQomZ3Q7JiMzMjt0aGFuJiMzMjs4MCYjMzI7Y29s
dW1ucy4NCg0KWW91JiMzMjtoYXZlJiMzMjttYW55JiMzMjt0eXBlc2V0dGluZyYjMzI7aW4mIzMy
O3NvbWUmIzMyO3BhdGNoZXMuDQpCdXQmIzMyO0kmIzMyO3RoaW5rJiMzMjt0eXBlc2V0dGluZyYj
MzI7aXMmIzMyO25vdCYjMzI7cmVsYXRlZCYjMzI7dG8mIzMyO3RoZSYjMzI7bWFpbiYjMzI7cHVy
cG9zZSYjMzI7b2YmIzMyO3RoYXQmIzMyO3BhdGNoLg0KSSYjMzI7d291bGQmIzMyO2xpa2UmIzMy
O3lvdSYjMzI7dG8mIzMyO2dhdGhlciYjMzI7dGhlc2UmIzMyO3R5cGVzZXR0aW5nJiMzMjttb2Rp
ZmljYXRpb24mIzMyO3RvJiMzMjthJiMzMjtyZWFkYWJpbGl0eSYjMzI7cGF0Y2guDQoNClJlZ2Fy
ZHMsDQpDSw0KDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtBbmdlbG9H
aW9hY2NoaW5vJiMzMjtEZWwmIzMyO1JlZ25vJiMzMjsmbHQ7YW5nZWxvZ2lvYWNjaGluby5kZWxy
ZWdub0Bjb2xsYWJvcmEuY29tJmd0Ow0KJmd0OyYjMzI7LS0tDQomZ3Q7JiMzMjsmIzMyO2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jJiMzMjt8JiMzMjsxMCYjMzI7KysrKy0tLS0t
LQ0KJmd0OyYjMzI7JiMzMjsxJiMzMjtmaWxlJiMzMjtjaGFuZ2VkLCYjMzI7NCYjMzI7aW5zZXJ0
aW9ucygrKSwmIzMyOzYmIzMyO2RlbGV0aW9ucygtKQ0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtkaWZm
JiMzMjstLWdpdCYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYyYjMzI7
Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYw0KJmd0OyYjMzI7aW5kZXgmIzMy
OzVkNDZkNDg2YzY4Zi4uN2U0NTM2MzkxY2ZiJiMzMjsxMDA2NDQNCiZndDsmIzMyOy0tLSYjMzI7
YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYw0KJmd0OyYjMzI7KysrJiMzMjti
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jDQomZ3Q7JiMzMjtAQCYjMzI7LTE2
OTQsOCYjMzI7KzE2OTQsNyYjMzI7QEAmIzMyO3N0YXRpYyYjMzI7dm9pZCYjMzI7bXRrX2hkbWlf
cmVtb3ZlKHN0cnVjdCYjMzI7cGxhdGZvcm1fZGV2aWNlJiMzMjsqcGRldikNCiZndDsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjttdGtfaGRtaV9jbGtfZGlzYWJs
ZV9hdWRpbyhoZG1pKTsNCiZndDsmIzMyOyYjMzI7fQ0KJmd0OyYjMzI7DQomZ3Q7JiMzMjstI2lm
ZGVmJiMzMjtDT05GSUdfUE1fU0xFRVANCiZndDsmIzMyOy1zdGF0aWMmIzMyO2ludCYjMzI7bXRr
X2hkbWlfc3VzcGVuZChzdHJ1Y3QmIzMyO2RldmljZSYjMzI7KmRldikNCiZndDsmIzMyOytzdGF0
aWMmIzMyO19fbWF5YmVfdW51c2VkJiMzMjtpbnQmIzMyO210a19oZG1pX3N1c3BlbmQoc3RydWN0
JiMzMjtkZXZpY2UmIzMyOypkZXYpDQomZ3Q7JiMzMjsmIzMyO3sNCiZndDsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtzdHJ1Y3QmIzMyO210a19oZG1pJiMzMjsq
aGRtaSYjMzI7PSYjMzI7ZGV2X2dldF9kcnZkYXRhKGRldik7DQomZ3Q7JiMzMjsNCiZndDsmIzMy
O0BAJiMzMjstMTcwNCw3JiMzMjsrMTcwMyw3JiMzMjtAQCYjMzI7c3RhdGljJiMzMjtpbnQmIzMy
O210a19oZG1pX3N1c3BlbmQoc3RydWN0JiMzMjtkZXZpY2UmIzMyOypkZXYpDQomZ3Q7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7cmV0dXJuJiMzMjswOw0KJmd0
OyYjMzI7JiMzMjt9DQomZ3Q7JiMzMjsNCiZndDsmIzMyOy1zdGF0aWMmIzMyO2ludCYjMzI7bXRr
X2hkbWlfcmVzdW1lKHN0cnVjdCYjMzI7ZGV2aWNlJiMzMjsqZGV2KQ0KJmd0OyYjMzI7K3N0YXRp
YyYjMzI7X19tYXliZV91bnVzZWQmIzMyO2ludCYjMzI7bXRrX2hkbWlfcmVzdW1lKHN0cnVjdCYj
MzI7ZGV2aWNlJiMzMjsqZGV2KQ0KJmd0OyYjMzI7JiMzMjt7DQomZ3Q7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7c3RydWN0JiMzMjttdGtfaGRtaSYjMzI7Kmhk
bWkmIzMyOz0mIzMyO2Rldl9nZXRfZHJ2ZGF0YShkZXYpOw0KJmd0OyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO2ludCYjMzI7cmV0JiMzMjs9JiMzMjswOw0KJmd0
OyYjMzI7QEAmIzMyOy0xNzE3LDkmIzMyOysxNzE2LDgmIzMyO0BAJiMzMjtzdGF0aWMmIzMyO2lu
dCYjMzI7bXRrX2hkbWlfcmVzdW1lKHN0cnVjdCYjMzI7ZGV2aWNlJiMzMjsqZGV2KQ0KJmd0OyYj
MzI7DQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7cmV0
dXJuJiMzMjswOw0KJmd0OyYjMzI7JiMzMjt9DQomZ3Q7JiMzMjstI2VuZGlmDQomZ3Q7JiMzMjst
c3RhdGljJiMzMjtTSU1QTEVfREVWX1BNX09QUyhtdGtfaGRtaV9wbV9vcHMsDQomZ3Q7JiMzMjst
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7bXRrX2hkbWlfc3VzcGVuZCwmIzMyO210a19oZG1pX3Jlc3VtZSk7DQomZ3Q7JiMzMjsr
DQomZ3Q7JiMzMjsrc3RhdGljJiMzMjtTSU1QTEVfREVWX1BNX09QUyhtdGtfaGRtaV9wbV9vcHMs
JiMzMjttdGtfaGRtaV9zdXNwZW5kLCYjMzI7bXRrX2hkbWlfcmVzdW1lKTsNCiZndDsmIzMyOw0K
Jmd0OyYjMzI7JiMzMjtzdGF0aWMmIzMyO2NvbnN0JiMzMjtzdHJ1Y3QmIzMyO210a19oZG1pX2Nv
bmYmIzMyO210a19oZG1pX2NvbmZfbXQyNzAxJiMzMjs9JiMzMjt7DQomZ3Q7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7LnR6X2Rpc2FibGVkJiMzMjs9JiMzMjt0
cnVlLA0KJmd0OyYjMzI7LS0NCiZndDsmIzMyOzIuNDcuMA0KJmd0OyYjMzI7DQoNCg0KPC9wcmU+
DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioq
KioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZSAqKioqKioqKioqKioqKioqKioq
Kg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNs
dWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5
LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIg
YXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8g
dGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRp
c3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWls
IChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMp
IGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJl
IG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUgDQp0
aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5
IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBk
ZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkg
YXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBj
b250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSENCjwv
cHJlPjwhLS19LS0+

--__=_Part_Boundary_005_1066604587.1426798342--

