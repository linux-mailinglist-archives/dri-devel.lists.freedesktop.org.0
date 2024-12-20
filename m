Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B619F8BE2
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 06:36:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5041910E0C8;
	Fri, 20 Dec 2024 05:36:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="uVh/L3Fg";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="uXRpMCxX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 623C910E0C8
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 05:36:19 +0000 (UTC)
X-UUID: 542801cabe9411ef99858b75a2457dd9-20241220
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=POWoqZpY0qRm6a8KIb/1CNo1I+rlPagKAhhbTgYcpbY=; 
 b=uVh/L3FgDkhsD0B+MXAM1DdIHV72ZUybRyaZZLYkq8j6eefM+Z3iW/DoRYsi0mQ7xIWrmsN4Weu7tdrg1gprCLTBwux01gI6sgLThvv26JawQd19oeR4cJ/WLLKyb/N10JRQ6BUvn4wp3/0ONBTzIexnJyXDHzvotECuqjye0gc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45, REQID:73dd730a-e593-435e-8a04-a927910d3db2, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6493067, CLOUDID:bfea1194-0286-4820-a24e-6305e82d1261,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
 :-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
 A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 542801cabe9411ef99858b75a2457dd9-20241220
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2095869520; Fri, 20 Dec 2024 13:36:14 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 20 Dec 2024 13:36:13 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Fri, 20 Dec 2024 13:36:13 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OkG1B6KeF4ZrIIIneNR0tXdKclHSBGWe1kYNEV7uVfhcbP3eOV8YJSU2zX62HOqzTupi2pF0MUAS99VEt/WK046b1G84TmIbaoh6u6j0vUWOf4MrREYO0HaljU7pP2KubzwN2+yDcbzuW4EdLUdTJ8vd0jRZWngXbgn7Wqm2FiB1u5AkFQY2egwUciItj449mxwZ1rkBKfDsmYLAmTvOSRzWvVf+T42qtXYtJrKkosbzDDcAIPlhQAwifzL4ZmefPKLnu+eajJV2hb8SPDyCgx2MQH/dwSLz7BP1El94w0nROGODN++z0BVPebiSDRMvHQHNFx4iJPKhHDDBQ+XF3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EK6qD3WjPTRwNU9IYfzR/EuDpeNwYczoFggj8fC73sQ=;
 b=edTUX6FPkymOCoMBcsT7ebHkoc6/TAIDHTWLIrV7821xisb+CSkUJoyGD39cRBQ7+3W9UQ4+nFXeM9gjwOIQq8sZ++RctcNL7JkGThEQpjxUt2zwrGzhkaw2YY9T0TSWHpR/uQvO16HW1fbMxT6icAHelE8ljae2ePjkxQJsP2Bc4kTZeAVw5QCNhnz6ArHplezACdt2djaOxXiB7tmPjfSybXwgitdD5t6pupTI3YQ4P5xqpy83whABqevJ3Q4GC6vXjAxZcwyfzp0SQ8/6gvNjgyPkPQx7Yo2tYyqbYtLlismutrxs9C3deNTpiq+wAv4yjvDdZTTA3zk2pOH7Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EK6qD3WjPTRwNU9IYfzR/EuDpeNwYczoFggj8fC73sQ=;
 b=uXRpMCxXyQi8XkqYB4m7e85Z1+ztN+aU4XZ0X46gGVp3dysf224RLcp+qdJZJxktCSZgGSBBX5eiYCzpKoFbH6vA9G0ccGOJoY/2c1/aIUcK3HUXXnEOD0u8e86DR0vkVcY9cGigu8e2CB47WtNE3hoklht//XMUvckmDTYmNqw=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEYPR03MB8301.apcprd03.prod.outlook.com (2603:1096:101:1ac::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Fri, 20 Dec
 2024 05:36:11 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8251.015; Fri, 20 Dec 2024
 05:36:11 +0000
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
Subject: Re: [PATCH v3 16/33] drm/mediatek: mtk_hdmi: Move
 plugged_cb/codec_dev setting to new function
Thread-Topic: [PATCH v3 16/33] drm/mediatek: mtk_hdmi: Move
 plugged_cb/codec_dev setting to new function
Thread-Index: AQHbUJrB0bTZ38l0TUyEaJmMj+yc87LuoPAA
Date: Fri, 20 Dec 2024 05:36:11 +0000
Message-ID: <4d00d1e771f75e151481bb9a010a22faa5552a0a.camel@mediatek.com>
References: <20241217154345.276919-1-angelogioacchino.delregno@collabora.com>
 <20241217154345.276919-17-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20241217154345.276919-17-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEYPR03MB8301:EE_
x-ms-office365-filtering-correlation-id: 7b6f29f3-d62f-4fa4-ea48-08dd20b83631
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?OTRZbDZwcTB4ak55ZmltK1AxbWZlNmVaTisxelJLOHpRNmtvQnNBalB1bFRW?=
 =?utf-8?B?elorMHI2TUNuUWtvc2J4YUU4eUEyWVhkREQxMm8zdnJmQXpvRmVibm9NNWY2?=
 =?utf-8?B?QVlHUHVpNmkra054RUJPeWZ0ZytDOUU1di9ENElRbXQvWTc2R29uZEdwalBk?=
 =?utf-8?B?S0tsMElCblR1ZVJrSWtoVVNOQmFOa3ZtelcvbzBqOCt4eTg3eXFFc1Y2US9P?=
 =?utf-8?B?RXU5ZlpBeUhHT3VQUzlpeTR5c280cHFsMVNxSVZqazc4TTRYdWJvT2phVjY1?=
 =?utf-8?B?NTBVZVMrMVQrNllGcHF3aWY3K0ZTZ3JQdWU2OWczdSsyUGNGeDVqNjVORlFN?=
 =?utf-8?B?OWRmZ0ZhOHN3Y1I2bnc2RWdiTXRlS0R4QWJtQWpTbytNV2owVk9jbGJWYjc2?=
 =?utf-8?B?TjJVMDd4WlpvcENlYjJldWpZMUI1VDNsVUZQWm1OSlFOckhUS2k5enl1RmhL?=
 =?utf-8?B?ejBWTG9WL0J4THVNM2Z0QkI0ZEl1ZXZvUnZ3cWlhRWVkUUhmdkxWb1JFdlow?=
 =?utf-8?B?VXF2b1hBRFlEdXdYa1lydk5pVSt5di80ejhnV1QxUWs4cUdTUWNrSGFiZFJD?=
 =?utf-8?B?bTNQRW9qMUFpekdzUHRFb0d4c3lKSmNUY2dqMGp3aUtteitmbmhhNUJHZlBL?=
 =?utf-8?B?SEp4S0ROY3JhVWxKWWJDc3BiSVlmZHlOcEV3dkFjU1BDR2pKb0JtcDMvdmFh?=
 =?utf-8?B?OHZHd3NCelRWMlhZNmsxSTBqTTNOK29OTEdBd0xNczZUMnJCUTl1MVo1VUNp?=
 =?utf-8?B?VjdmNWc4c3FwSDVtaFNIUWhQSFN6c291ZCsxTmFIR3o1UEtRTDNYdERIT29O?=
 =?utf-8?B?UnBJbGo5Qlpqd0VDRGpsRkk3V1g0YXJXZWtjeGsyRFpndmhrMFJtL1ErcDAy?=
 =?utf-8?B?ZG51MzJ5eHpSbkZ1dEt0bEhiV21aOXo2VW8vY2RybVVqTGpDZlFSMDhOUnRP?=
 =?utf-8?B?M2NKd2FrY2FOajNhWHR4dFp6ai9WbFY3ZXpQU0o2bC9OU1EyQjhLcGtQUk1G?=
 =?utf-8?B?VGlMSlNxc3AxVFkvZEdGNXc1NFJZWGdVUWxUUXg5WU5Md0xJMHJQclZqY2JO?=
 =?utf-8?B?RTJFaW9qZllVYkQzYnZ5VUhXNFRaL05FTmlCQVljOS9QNWVXamppc2MzYzVP?=
 =?utf-8?B?ckdMc3MyRUppdEJ5S05jeVhiRlVzVzVzbkp2QXB5TTMwTkpqOEJHd1BqbnI5?=
 =?utf-8?B?TUM0OHdtSDVJVWR1MHl2S2h1N2ZmVmhvZ0o4VDd4L1BybGRNT2NUcFJIUTIx?=
 =?utf-8?B?NllmTUM1STdtN2xRZnB1Y3RnQTUvWHR0a0dGNWc0N2VIS0lkUjJ5ZEI0OE8r?=
 =?utf-8?B?bGhRQ1Z4bUtVelZLU0cxNzgzMVFRcTkyM3VkbFhOdXBlL0RqY0ZEd1c4RmEv?=
 =?utf-8?B?clpBRWxDRGVNR2pEM1drbldkMzlFRnJXSG11RWNGSXRFU3ZLRFZQa21aQ0Yz?=
 =?utf-8?B?Q2lQdlBUTUl5RVZrT2pFTmxKUHJqdHBoOVNzRVF4aHBHc3A0TXU2NVdCWmEr?=
 =?utf-8?B?WDMwY0FqVFFmUWx0QVQ2ZE1ta0s4cGk5K1Z6bFNqNVdja295bE5aMUtaQTFR?=
 =?utf-8?B?VEZHQW9aR0JrN1p6Z2dlZnNqSENKbDhMZ3JqM2pBcnk1WFJJR0NzbnY5RG9m?=
 =?utf-8?B?QjVPdEF6OU4yUFJHbFYwRk5CTElZVGxSTGZNZUNYZmlZQzg3WEZ5TnpCa3U1?=
 =?utf-8?B?ZU9panE1QVR5M2hzK0Z5dW5rcnJPT2NuMEd6VEdFaGhOd1NVNzM2QkNaWGFS?=
 =?utf-8?B?YStod3lFaVA0SFJEaDdmMUxJZ2gza044b2xTMU84Z0pJL1JOVXB1Z1NVOVdC?=
 =?utf-8?B?c1cxeEJuclUwc290MEs0aW9XV2FBQktkWWVnbm1FaTNwdDlqMmxDVGlKZExJ?=
 =?utf-8?B?b2JQbWpJcHl0Mk9Mbnl0VUVKUVB4M3RFbXk5ekgzdW5HakwxNThnbXlBY0Mx?=
 =?utf-8?Q?gAeN3g7YfBY3zqB3HNTdWS+0v/EEgYEL?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dGExWjR1V1pWeElWQ2NVSURBS0JYU1FWSzRiNXJ4ODJPa2h3TktBWDFOV2to?=
 =?utf-8?B?aXVHZDlKRG95ODBzRWw1Q1lUUEpGYU1rWmhEczI0VnBTYXdCUTRwYXExQkZS?=
 =?utf-8?B?a25GQ0dlNThtekRtME9iSVhxZWtEVHM3RDlhajJVUUh1enR0WVpJMTc2UUN5?=
 =?utf-8?B?bXRnSjJ4eUk1TG1sME1aVFBMRDR0MHFVTHV0US9xODFnUEh1czNtUklsWTJD?=
 =?utf-8?B?dGdWbVJPM1hKeVJDeDhGelYvSms0MEdDZXJTdXdXdkorOWdDdi9peU5Ib1E5?=
 =?utf-8?B?UXV0OEdMTUYvRkNrZHpEZ3pmQjNFZkZLU2VObzNYVTRpTjliUkdpUlQvRHVv?=
 =?utf-8?B?OW5uZEtXeUxOVTRGaGZYNkgyazEwSE9zWHZEQmNGU2JZU2NUWitFL0NtWEtE?=
 =?utf-8?B?OFRCQmhOV2JvYXpEQXZoN2kwZVRxNmFvZCsvVFpaRUVJRFJEaUZrSlNDRkJu?=
 =?utf-8?B?N2hKN3FRTHVvNkpESFUwVHI2a1daOTBwM05UcEt3bW9SaXA5RmJ2a1BrMTFW?=
 =?utf-8?B?TUV1dTBqMkZ0bFkzWmVic1hBUGJ3SHdTKzZsR2ZuME9JQWQzRWtWQXg3dW5Y?=
 =?utf-8?B?QkxTNjNuOHdIVHZYUVQvT2x4dTBHMDhCMFd5VWZRc0tjRTUxaXZOSVB6a1pY?=
 =?utf-8?B?TzRCWWxXY2F1TlNxS3Z0VGgwTjJzZFNmc3dHUFpBeFVXYnhaOFkxVC9nWndV?=
 =?utf-8?B?L21pTzhjRFJWWkFveCtjcUN4dGVEQjdhcCtPSnl0VkgwbUVObDFTdDU2OTQw?=
 =?utf-8?B?aVkzVVJRS2NiZGhBaTJrWnpDcWp5c1VxQXUrTy93cHlRQ3RSZXREU1JIeGZ5?=
 =?utf-8?B?WEVKQjQ5YUZ3VHpjbWt4d3IwWnUxL0QvbnVJNjJBdlRMUmkyTEFEbVM2N1JG?=
 =?utf-8?B?UTRkVmt4S0hyeXMvcVVmeVF6eHdKWk1tVmtHU25Oa25HTDRnMG5VOEdvWVd6?=
 =?utf-8?B?WVlDV0lFREx2ZVRkeXN1cTA2a3pIeGhkbWFORHZQZm43QXdEMlJUTlRRdk5J?=
 =?utf-8?B?MTBqSmFlY0NaTytCTU1tWHB2Ym9BTUJsSWdUYXAvcURjNFBUZmJLRU1IcFVV?=
 =?utf-8?B?STFHMzhhZlpkc1Z4ak9xVVBpK3pKUEY0U1VjcVJZbWM4bkltd3Vqckk4SVpS?=
 =?utf-8?B?NndtOGxETVh4b3V1TlF0TXRweWtaZUJKWGFpcDZpVDhFQUJVdWNHSFBQTUJV?=
 =?utf-8?B?dGxlcHBtRnI2YU9wYVhxNXpLZEc1aDZSK1hjb3VoNFNRRkRhSitQYXF4NkJ3?=
 =?utf-8?B?RFcvRWpsdGdMT2FTV3cvWDlMbldFWmRURzBnVHpEV242ck9OYmsxS2RrS1ZY?=
 =?utf-8?B?QjRrbUhMVUxuUnJUNzVJUEY3M1Z1dVYvSVJkejdaeGxDalRNL2s4N0Fyb055?=
 =?utf-8?B?ankvUzQwS0ROdFlibk9UejF5WWZiTWJ0QVM4SkRoNlZlL2ozZmE4SFRyV2RQ?=
 =?utf-8?B?NkwwNGZ0RksvdlVDUzdwdkhpNndOMlE3NkRMTUpNZVVsT1ZNaGtCK2xxUHZ4?=
 =?utf-8?B?RGpWZFJnd3FoZ0RhQXlQT2ZMRG05aGJ3cmZwbVRKUW96emlySUNUYnJTdTNQ?=
 =?utf-8?B?cEVacHpHYkh4eGVMQzQrOHR3aTJkc0NUYmREMjNQWHBnR2UrbkxYNUpFL2R2?=
 =?utf-8?B?eXNvTGM1OStsbFZHLy81U2JaUmx4UDExVFVGRHM4QU8yUUQzR3FDSmFNTkcw?=
 =?utf-8?B?ZHB5T1dLNUNON1BIbkkraGFKd2VRTzBPaUV0dGorczFQWXhseFhrWUgvNkIy?=
 =?utf-8?B?dWVnaDVjVFJPOU1VY1d0V2k5aEpVcWJiWHlDMFJmTUhKVUQ5MU10d1BIMTRv?=
 =?utf-8?B?QzNFbjVWdXlKQTAxSlczVElXMWhvOE8vMjJMVk43V1ZHK1kwVXhpNGlUQ3pG?=
 =?utf-8?B?Q3NVZkRlSnNSL0ZhVWMyT0picmEySzJLV2t3MG8veHQ2ZUQ1aDhITTdZL2JD?=
 =?utf-8?B?cGx4RWt1cmF0Q1FVSlMxUUdPSWZvaWdDc0Rzb3g5eDZSVTloK0piM0ZvRFYz?=
 =?utf-8?B?eVRFdmU4b3piSDRwL04vQU5ueW5Vc1BoL1loQ3FleDdmcmt3NE40UEpnaEdQ?=
 =?utf-8?B?alo2TE83cnRqM1JhRUhLeXR5aS9Ic1pmbjVWY3QyZ2lKRXdmeFl1VlBHS2l0?=
 =?utf-8?Q?o7DY4/pR1bKZFllX11yPpfgtp?=
Content-ID: <3F52AF562285354E89246D73B1D3204C@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b6f29f3-d62f-4fa4-ea48-08dd20b83631
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2024 05:36:11.1714 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JNBHfy8ri70iWo4qpT+BiRQORPHBOCdM0RJLAEi8pWH76RjenvSfY1nuLqWNgSaRZXhpFws0sH7nyxJ+CszhGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8301
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_002_760594321.1779224576"
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

--__=_Part_Boundary_002_760594321.1779224576
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEFuZ2VsbzoNCg0KT24gVHVlLCAyMDI0LTEyLTE3IGF0IDE2OjQzICswMTAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZp
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBJbiBwcmVwYXJhdGlvbiBm
b3Igc3BsaXR0aW5nIGNvbW1vbiBiaXRzIG9mIHRoaXMgZHJpdmVyLCBtb3ZlIHRoZQ0KPiBtdXRl
eC1wcm90ZWN0ZWQgY2FibGUgcGx1Z2dlZCBjYWxsYmFjayBhbmQgY29kZWMgZGV2aWNlIHNldHRp
bmcNCj4gdG8gYSBuZXcgZnVuY3Rpb24gY2FsbGVkIG10a19oZG1pX2F1ZGlvX3NldF9wbHVnZ2Vk
X2NiKCkuDQoNClJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPg0KDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8YW5nZWxvZ2lvYWNj
aGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfaGRtaS5jIHwgMTMgKysrKysrKysrLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQs
IDkgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfaGRtaS5jDQo+IGluZGV4IGE5MjdkOTg4OTgxOC4uZjYwYzRlZmZlOTA1IDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYw0KPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYw0KPiBAQCAtMTU5NywxNyArMTU5NywyMiBA
QCBzdGF0aWMgaW50IG10a19oZG1pX2F1ZGlvX2dldF9lbGQoc3RydWN0IGRldmljZSAqZGV2LCB2
b2lkICpkYXRhLCB1aW50OF90ICpidWYsDQo+ICAgICAgICAgcmV0dXJuIDA7DQo+ICB9DQo+IA0K
PiAtc3RhdGljIGludCBtdGtfaGRtaV9hdWRpb19ob29rX3BsdWdnZWRfY2Ioc3RydWN0IGRldmlj
ZSAqZGV2LCB2b2lkICpkYXRhLA0KPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBoZG1pX2NvZGVjX3BsdWdnZWRfY2IgZm4sDQo+ICtzdGF0aWMgdm9pZCBtdGtfaGRt
aV9hdWRpb19zZXRfcGx1Z2dlZF9jYihzdHJ1Y3QgbXRrX2hkbWkgKmhkbWksIGhkbWlfY29kZWNf
cGx1Z2dlZF9jYiBmbiwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgc3RydWN0IGRldmljZSAqY29kZWNfZGV2KQ0KPiAgew0KPiAtICAgICAgIHN0cnVjdCBtdGtf
aGRtaSAqaGRtaSA9IGRhdGE7DQo+IC0NCj4gICAgICAgICBtdXRleF9sb2NrKCZoZG1pLT51cGRh
dGVfcGx1Z2dlZF9zdGF0dXNfbG9jayk7DQo+ICAgICAgICAgaGRtaS0+cGx1Z2dlZF9jYiA9IGZu
Ow0KPiAgICAgICAgIGhkbWktPmNvZGVjX2RldiA9IGNvZGVjX2RldjsNCj4gICAgICAgICBtdXRl
eF91bmxvY2soJmhkbWktPnVwZGF0ZV9wbHVnZ2VkX3N0YXR1c19sb2NrKTsNCj4gK30NCj4gKw0K
PiArc3RhdGljIGludCBtdGtfaGRtaV9hdWRpb19ob29rX3BsdWdnZWRfY2Ioc3RydWN0IGRldmlj
ZSAqZGV2LCB2b2lkICpkYXRhLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBoZG1pX2NvZGVjX3BsdWdnZWRfY2IgZm4sDQo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkZXZpY2UgKmNvZGVjX2RldikNCj4gK3sNCj4g
KyAgICAgICBzdHJ1Y3QgbXRrX2hkbWkgKmhkbWkgPSBkYXRhOw0KPiANCj4gKyAgICAgICBtdGtf
aGRtaV9hdWRpb19zZXRfcGx1Z2dlZF9jYihoZG1pLCBmbiwgY29kZWNfZGV2KTsNCj4gICAgICAg
ICBtdGtfaGRtaV91cGRhdGVfcGx1Z2dlZF9zdGF0dXMoaGRtaSk7DQo+IA0KPiAgICAgICAgIHJl
dHVybiAwOw0KPiAtLQ0KPiAyLjQ3LjANCj4gDQoNCg==

--__=_Part_Boundary_002_760594321.1779224576
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtBbmdlbG86DQoNCk9uJiMzMjtUdWUsJiMz
MjsyMDI0LTEyLTE3JiMzMjthdCYjMzI7MTY6NDMmIzMyOyswMTAwLCYjMzI7QW5nZWxvR2lvYWNj
aGlubyYjMzI7RGVsJiMzMjtSZWdubyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtFeHRlcm5hbCYjMzI7
ZW1haWwmIzMyOzomIzMyO1BsZWFzZSYjMzI7ZG8mIzMyO25vdCYjMzI7Y2xpY2smIzMyO2xpbmtz
JiMzMjtvciYjMzI7b3BlbiYjMzI7YXR0YWNobWVudHMmIzMyO3VudGlsJiMzMjt5b3UmIzMyO2hh
dmUmIzMyO3ZlcmlmaWVkJiMzMjt0aGUmIzMyO3NlbmRlciYjMzI7b3ImIzMyO3RoZSYjMzI7Y29u
dGVudC4NCiZndDsmIzMyOw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtJbiYjMzI7cHJlcGFyYXRpb24m
IzMyO2ZvciYjMzI7c3BsaXR0aW5nJiMzMjtjb21tb24mIzMyO2JpdHMmIzMyO29mJiMzMjt0aGlz
JiMzMjtkcml2ZXIsJiMzMjttb3ZlJiMzMjt0aGUNCiZndDsmIzMyO211dGV4LXByb3RlY3RlZCYj
MzI7Y2FibGUmIzMyO3BsdWdnZWQmIzMyO2NhbGxiYWNrJiMzMjthbmQmIzMyO2NvZGVjJiMzMjtk
ZXZpY2UmIzMyO3NldHRpbmcNCiZndDsmIzMyO3RvJiMzMjthJiMzMjtuZXcmIzMyO2Z1bmN0aW9u
JiMzMjtjYWxsZWQmIzMyO210a19oZG1pX2F1ZGlvX3NldF9wbHVnZ2VkX2NiKCkuDQoNClJldmll
d2VkLWJ5OiYjMzI7Q0smIzMyO0h1JiMzMjsmbHQ7Y2suaHVAbWVkaWF0ZWsuY29tJmd0Ow0KDQom
Z3Q7JiMzMjsNCiZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtBbmdlbG9HaW9hY2NoaW5vJiMz
MjtEZWwmIzMyO1JlZ25vJiMzMjsmbHQ7YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJv
cmEuY29tJmd0Ow0KJmd0OyYjMzI7LS0tDQomZ3Q7JiMzMjsmIzMyO2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfaGRtaS5jJiMzMjt8JiMzMjsxMyYjMzI7KysrKysrKysrLS0tLQ0KJmd0OyYj
MzI7JiMzMjsxJiMzMjtmaWxlJiMzMjtjaGFuZ2VkLCYjMzI7OSYjMzI7aW5zZXJ0aW9ucygrKSwm
IzMyOzQmIzMyO2RlbGV0aW9ucygtKQ0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtkaWZmJiMzMjstLWdp
dCYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYyYjMzI7Yi9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYw0KJmd0OyYjMzI7aW5kZXgmIzMyO2E5MjdkOTg4
OTgxOC4uZjYwYzRlZmZlOTA1JiMzMjsxMDA2NDQNCiZndDsmIzMyOy0tLSYjMzI7YS9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYw0KJmd0OyYjMzI7KysrJiMzMjtiL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jDQomZ3Q7JiMzMjtAQCYjMzI7LTE1OTcsMTcmIzMy
OysxNTk3LDIyJiMzMjtAQCYjMzI7c3RhdGljJiMzMjtpbnQmIzMyO210a19oZG1pX2F1ZGlvX2dl
dF9lbGQoc3RydWN0JiMzMjtkZXZpY2UmIzMyOypkZXYsJiMzMjt2b2lkJiMzMjsqZGF0YSwmIzMy
O3VpbnQ4X3QmIzMyOypidWYsDQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7cmV0dXJuJiMzMjswOw0KJmd0OyYjMzI7JiMzMjt9DQomZ3Q7JiMzMjsNCiZn
dDsmIzMyOy1zdGF0aWMmIzMyO2ludCYjMzI7bXRrX2hkbWlfYXVkaW9faG9va19wbHVnZ2VkX2Ni
KHN0cnVjdCYjMzI7ZGV2aWNlJiMzMjsqZGV2LCYjMzI7dm9pZCYjMzI7KmRhdGEsDQomZ3Q7JiMz
MjstJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO2hkbWlfY29kZWNfcGx1Z2dlZF9j
YiYjMzI7Zm4sDQomZ3Q7JiMzMjsrc3RhdGljJiMzMjt2b2lkJiMzMjttdGtfaGRtaV9hdWRpb19z
ZXRfcGx1Z2dlZF9jYihzdHJ1Y3QmIzMyO210a19oZG1pJiMzMjsqaGRtaSwmIzMyO2hkbWlfY29k
ZWNfcGx1Z2dlZF9jYiYjMzI7Zm4sDQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjtzdHJ1Y3QmIzMyO2RldmljZSYjMzI7KmNvZGVjX2RldikNCiZndDsmIzMy
OyYjMzI7ew0KJmd0OyYjMzI7LSYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7c3Ry
dWN0JiMzMjttdGtfaGRtaSYjMzI7KmhkbWkmIzMyOz0mIzMyO2RhdGE7DQomZ3Q7JiMzMjstDQom
Z3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7bXV0ZXhfbG9j
aygmYW1wO2hkbWktJmd0O3VwZGF0ZV9wbHVnZ2VkX3N0YXR1c19sb2NrKTsNCiZndDsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtoZG1pLSZndDtwbHVnZ2VkX2Ni
JiMzMjs9JiMzMjtmbjsNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjtoZG1pLSZndDtjb2RlY19kZXYmIzMyOz0mIzMyO2NvZGVjX2RldjsNCiZndDsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjttdXRleF91bmxvY2soJmFt
cDtoZG1pLSZndDt1cGRhdGVfcGx1Z2dlZF9zdGF0dXNfbG9jayk7DQomZ3Q7JiMzMjsrfQ0KJmd0
OyYjMzI7Kw0KJmd0OyYjMzI7K3N0YXRpYyYjMzI7aW50JiMzMjttdGtfaGRtaV9hdWRpb19ob29r
X3BsdWdnZWRfY2Ioc3RydWN0JiMzMjtkZXZpY2UmIzMyOypkZXYsJiMzMjt2b2lkJiMzMjsqZGF0
YSwNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7aGRtaV9jb2Rl
Y19wbHVnZ2VkX2NiJiMzMjtmbiwNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7c3RydWN0JiMzMjtkZXZpY2UmIzMyOypjb2RlY19kZXYpDQomZ3Q7JiMzMjsrew0K
Jmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7c3RydWN0JiMzMjtt
dGtfaGRtaSYjMzI7KmhkbWkmIzMyOz0mIzMyO2RhdGE7DQomZ3Q7JiMzMjsNCiZndDsmIzMyOysm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO210a19oZG1pX2F1ZGlvX3NldF9wbHVn
Z2VkX2NiKGhkbWksJiMzMjtmbiwmIzMyO2NvZGVjX2Rldik7DQomZ3Q7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7bXRrX2hkbWlfdXBkYXRlX3BsdWdnZWRfc3Rh
dHVzKGhkbWkpOw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7cmV0dXJuJiMzMjswOw0KJmd0OyYjMzI7LS0NCiZndDsmIzMyOzIuNDcu
MA0KJmd0OyYjMzI7DQoNCg0KPC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlwZTp0ZXh0
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

--__=_Part_Boundary_002_760594321.1779224576--

