Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83682A3394C
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 08:54:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCE7010EA1B;
	Thu, 13 Feb 2025 07:54:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="fz9WzN0d";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="ORm22bSU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD5E410EA19
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 07:54:22 +0000 (UTC)
X-UUID: b71961cce9df11efbd192953cf12861f-20250213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=5lUvBsWmGdVU1PWzaKlTe9CpTAeXCnx5M0LZDiLHMp8=; 
 b=fz9WzN0dZuwca44jQ4navJi1LtZVDKqsaxSDB9IeLOtIwL8x72i35krbQcv/0PtMoLAei2w3xVTSXOQu1X4Hg81+cK8gec+DuJHjPOQ+OewuMK2w1qYNpHDYNOfp5Yuv5zDoVgv2wGDCVzQM8/J9uhYMJh/V4UY4uGax6MWYF74=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46, REQID:77963ad0-a2e0-4bcb-ad92-d496f752f775, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:60aa074, CLOUDID:fccd4e8f-637d-4112-88e4-c7792fee6ae2,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
 EDM:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
 ,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: b71961cce9df11efbd192953cf12861f-20250213
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 167411688; Thu, 13 Feb 2025 15:54:13 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 13 Feb 2025 15:54:11 +0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Thu, 13 Feb 2025 15:54:11 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sYPwHRluXQGiusSHvYgicDrgEZFMNN1pNLJcf6FoSbLQTKu+tfmZuiXePmo7yGr3qyYSGZkHuPFXPixFuGmVwbGHc9xi2cUJyQCB2wYcJuvL/FLtpqseo9y/zPhneEV9EF3q1SMFWJsATPVOfdnQdAS7NrB90GRLjcGsJm3Vqqt4GiZNi744CUgFXD1+kUNhS25Okt35NqFMRY5czJRwBiygtPxOoDTCyz59bp4NGBgLqXRIQVLrVWHkPZ8tbEYlkUbgiZpx0V6BOha0faJIPMotcUF3poKlOAgsZxJaExv75eicGWVDNzez9xOdP6mQ22TNOr1wa4Eds5s0OIkweA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=do5k5Gxlxddb1PG8RYj4NSx8qofZEyJIaQgHlaFbWFQ=;
 b=EdB8z+wDpBPbM/Tmr73kTbX0+t5Sb+S7+4IAfaE5bMKCLPSG+je1y3ZnODBgRgSugvKl+BvQeeuZ5RFOPRx9mjTp0+cNvGG/sld+9ryTRHlrPwJrPO/c1ZBroZoUQDy0L6DxGUcbqBuwp5FqrpPCRZAE+aQusKnO1mWGBsWMtWdoX1N79+CAwG899PTSO+bxclhcisLv35tp23ITJnesbuX8luUAYkXmTjwWzz/j+88NoPlQIx6JnDyN+MPkrr6wMHDoX32G8hrDuKEcd7ve8QwmAgZhjJawui8RD31wH61WOv/ZQDmvH81Pe0DAHRss1hseuNm3wgJ9AsbzKj82QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=do5k5Gxlxddb1PG8RYj4NSx8qofZEyJIaQgHlaFbWFQ=;
 b=ORm22bSU3GU2WuQhTVK4tqTO+MpDAty1vXaONnDN6rH3CxKs//YISbU9qcPGpDJfBbFV39YExYi3bb4rXSOgNLnektjUYmJk+1x9lLvL4pTIoUBV3OdFc41w30DXSkML2mH29h7+cPGYoKMASAg5FoVQOjrh5dqu3j1H0LFm3rQ=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB6979.apcprd03.prod.outlook.com (2603:1096:400:284::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Thu, 13 Feb
 2025 07:54:09 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8422.015; Thu, 13 Feb 2025
 07:54:09 +0000
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
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 =?utf-8?B?TGV3aXMgTGlhbyAo5buW5p+P6YieKQ==?= <Lewis.Liao@mediatek.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, =?utf-8?B?VG9tbXlZTCBDaGVuICjpmbPlvaXoia8p?=
 <TommyYL.Chen@mediatek.com>, =?utf-8?B?SXZlcyBDaGVuamggKOmZs+S/iuW8mCk=?=
 <Ives.Chenjh@mediatek.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?=
 <Jason-JH.Lin@mediatek.com>, "junzhi.zhao@mediatek.com"
 <junzhi.zhao@mediatek.com>
Subject: Re: [PATCH v6 31/42] drm/mediatek: mtk_hdmi: Remove driver bound to
 HDMI print
Thread-Topic: [PATCH v6 31/42] drm/mediatek: mtk_hdmi: Remove driver bound to
 HDMI print
Thread-Index: AQHbfHksu0fFf5IRakiK/KAgUIhearNE3/qA
Date: Thu, 13 Feb 2025 07:54:09 +0000
Message-ID: <ac065915d708508cab54cc61d62c8afe254cedb2.camel@mediatek.com>
References: <20250211113409.1517534-1-angelogioacchino.delregno@collabora.com>
 <20250211113409.1517534-32-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250211113409.1517534-32-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB6979:EE_
x-ms-office365-filtering-correlation-id: 57ce6bc5-6e87-4863-245a-08dd4c039958
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?QkZTZnpLWWZxYnlkZDl4S1JONUJENEJia2xmRHNUdjhzNDdPKzhBSWQrUHhj?=
 =?utf-8?B?ajB4SGFDTyt6QldIbGUrS2Q5U2V4SjNIMU5kanM4TThBR25IK2JCUDBLOFM3?=
 =?utf-8?B?cFF2ZHk2Vm1zVlU0bHJ6UlpPVjRUTUVtdmFXRmFWV2diVlpLaVZ5N0lqUVRo?=
 =?utf-8?B?UHVqQ2ZVOSs1VXl2dmhwaXhWZHZjYjNJNFp4QXh5T2hOTjFhb3VuNUlIRmhZ?=
 =?utf-8?B?cGZXb25YbmZ3bkFtZiswU3FTMFhvb2lhVzAvT3VSM1dYUzB5T2hHb2swRE5K?=
 =?utf-8?B?ZzNRSGdpc3hDTmk2SUN3U3JpM1E0dktqSDZCcWlyQlRjd3Y4MjdoZ2wwMlZQ?=
 =?utf-8?B?elJMcnlsSjhhNzZXQTkxOFZVWEg0dUF5MExhdzV5aHJjZlFCaHM5RU55eGdz?=
 =?utf-8?B?NlVvb0pYQkZIeXVwZERrVWpjdTZ5TERac1V3TTd4TVk2K1F1N3oxVFJaTmpM?=
 =?utf-8?B?WFRXVUg5eXBIdlkzRUtsSGVBY2lSQXVNenZPUWNIZWIrcndHRHJBYktIMlFV?=
 =?utf-8?B?WkxqWnRNc2dkR1hXcFRBOFNzMnZobXN3ampqWkdibTVoV3plcVBIS0F6dXZ3?=
 =?utf-8?B?RGh1ZHJEK2NEUHk4NHVneGZncXQyYjV2TmZ6R214UlRyTFpqUVBQV2oyQytY?=
 =?utf-8?B?S3NicXJwWjBTR2NYc2V1aDI3dDg3cHVwbTM3ZTRmT2VrVXBuMXZuc3M2MnJP?=
 =?utf-8?B?eHptdmxJTEdENElOaFZhY0U0dDlEU2pPUm9BUDhJUjBPR0xVZXlVbStMNUM3?=
 =?utf-8?B?Tjh2N3JYRXRLT2cvTEdqZWt2d3VSUk5hZEtjUlZmWHdFbkxtQllKMExPS0Yv?=
 =?utf-8?B?YWFIVDIwK1grdVhRK3BtdG0xUzRwK3RsekduaS96QjN4YndRRTZMTkEvQzd2?=
 =?utf-8?B?NjQ1OWdUdTRBK2ptL3B4QXlaZUpSN3RXdjJieWE4UXNUVkRrSUYzdW8yaXZm?=
 =?utf-8?B?eHVWcUlFejZGY09BSGxDcmtuNUlIV1IwV3V3OXdlSzdCYXVXMDRENHZyT1Jx?=
 =?utf-8?B?Uzg1ejNwZ1pXRnJWbElzS25ZMnFQVzlDUGhZTGo3L29kMTRsWW8rem5QMXpm?=
 =?utf-8?B?TFR5aTFHR0tvQTdSNlY3dllKdkVXSmZTMytQbXZLMzZ6VG0xU2lQSzJhOTZh?=
 =?utf-8?B?NUd1OElsTURtZjVGbGdoU3g4K3ZzeDhSZGM1MXYvZ3U0R1BaWGpkTDNXT2hl?=
 =?utf-8?B?NGhWSkZ3OXdwbE05blRUeWVJdnM1eTdZcnp3ZGlIbVdwZW9uZGFOUHlKVzYy?=
 =?utf-8?B?NlZyRWU3QXZVdmh5SHBOSG1BbjF2U3YvS2prY1NiSXpRcHplcllnb1lSZUpM?=
 =?utf-8?B?VzBQZWtZZ09yNUQ3TnlqaU5QY3VtV29tUWtwaEUxOEYvZWo1RDZnNzVLbGNh?=
 =?utf-8?B?RnNmTkdrelZKQlZZRnNIMEdVcXF2eC9JTUs1MU1iNC9teU5yMUthQUVXdVhH?=
 =?utf-8?B?R20zQWozMFRydGZ0MmE0MmI2QnIybmZtQ2xuNEQ0T3ZSaWtUbkNPZGR5U3Ev?=
 =?utf-8?B?MUFFdDgrbGJWcmlZdHhBeWc3U3JUVEpxNjlaTjB2YW05TDBZdGdqRVBwTTVr?=
 =?utf-8?B?RVBCK1BMUWV6RTJGQ0dlb2ZDS1dLckw2VlZmTEhVWU1JQzdPSVRBeFBkQ2ht?=
 =?utf-8?B?cWFHTytsOC9FZE1VTm4zSzF4a05NZjNkQzJOb1o5OER3VHZkNnBpaGJkUEtk?=
 =?utf-8?B?eHlreHNNVy9vTjMySHlkSEV2aS8reTVGRkMyR0I1ZXVNYmh1YTUza2xGZEJ0?=
 =?utf-8?B?bklvQ2JYZm5hbGp0MnlncUVudUlBbDNicWRyVE51U1BzNklVZnA4L3ljcElO?=
 =?utf-8?B?ajZtSDA5UTF4WXpYWUpKZWI2cWtrSHVKdW9YZ0pjd1dyL3kzcXc4VCt0amt5?=
 =?utf-8?B?cWR2L3FtN3NtazVJNjZaRHZlNm9wYzI1YjJRZ09kT1A4cmV0NnJOMmlrYnNa?=
 =?utf-8?Q?ibVZU8YDdONTfsAPn8/+bdZl5WjLo97Y?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WWRqeVdKOGZFaDVpOHZweEErSG50MnZ4NEdPbGhFR0s1aFBybVM4TVE3SzJs?=
 =?utf-8?B?VmpvVFJtNjlTbkZBYnMxS2sxYVYxcE9TbStYdDhELzVjdU80TG0wcSt0THdm?=
 =?utf-8?B?UHU2R2t4dmVKbEtRckgyUlNEcnBSYlc3N1h3cUMvWmZMeHgzQ1laZXdVOXRn?=
 =?utf-8?B?OExBeVI1SnpFSW5NMTRVVGJZYXFsOTNnSHo3SDFWNG85Q3V5czlwZExaczF0?=
 =?utf-8?B?OFVYdUVFdlJJTE9RRTlzdlE5cVdTRDI3cjJGaFB2R292YTJndUw5M3ZadVlG?=
 =?utf-8?B?a3dRVEtycHg3UExpYnBvaDJCdmQvdEhlcC9ybFlRaDVPNHpwbFZ6OEI4ejVE?=
 =?utf-8?B?NW41S2VGNEJkY0NXMklJK1plSU1EaHdWMUEwT2xoOG41Z0xCYUNvRFZkcXlN?=
 =?utf-8?B?SDI5Y2lYOG1ONUlqNngwRGtZWEV4Q0g2SHRPZXUybDM1eHpQZmNEYmZiYVU1?=
 =?utf-8?B?VEdRTVozWEwzQUx0UmNXczFvb0VKSTEremZQWkFpYVhPM1BDWER5TE10aXhY?=
 =?utf-8?B?MW5JeGxsdk8wM0dudnE3YmJ3cmdYTkp5dmJZU21RaXdtbGphckp1QXZ3VGYy?=
 =?utf-8?B?K3d4WU1FVGtDcTlwVFlkTnRWYzRPbFNWQ0Q2cklTZ2FBZkl6RXJkcXlySVNa?=
 =?utf-8?B?TzJtUWNGN2dKOU5WUi9ZNkNvKzh6VTRnZElCbFZITm5Gdk0wRit2UWNaSnZR?=
 =?utf-8?B?Tk02bU9neVhQTVdKSTdkc21KVytrSVlxYVlCVUZxZXkvbmh0SWxNcENxWmh1?=
 =?utf-8?B?NzVqSVprQmI0cnlDYlk5bVlpdFJCYzlWbzJWMnBXV3BFOEZQVVFsWVh1REp1?=
 =?utf-8?B?NndweTByeHNnZ0tNUkJ4a2p3YjFxcndkb0N0UjJhazFZZSs0dWRTbEpJOHJp?=
 =?utf-8?B?aXNMc2dIaC8weWdzMU4wSkRVQnk5NzdqK1VEdDlrTjE2NldleWpQK1pYaG5u?=
 =?utf-8?B?QTljMWswNXp3dklsTVNaYmFLck9NaktPWnFTQnhpcWdFb2ZjM3U1NlRhTnF0?=
 =?utf-8?B?ZEhDUHJSQlR4T2JJaWt5aDFjL3pTQkl2T0wvU1JjYzllMWxxSWplTVVYdUhs?=
 =?utf-8?B?QndQMmtoZ0pEZlBIWnJybWtqcWZWUHlSM01nd2RoNzRRajRSd3UwUVpwMTJW?=
 =?utf-8?B?Skpjc0k0OUVUbi9WdVB5TWFyb2FXaTdWVTlKekRlY25aS3o5NDZTRDJ2WThr?=
 =?utf-8?B?M2o4UjkvaEN0RU4ybit1bGp3blVTbVUyTW9BekxFVFhpc0xUQ1B1UWxNc0I1?=
 =?utf-8?B?OGNQZDNrQ1FEQkswYndYUmFsb0tIdUlRZVd2djYyNFFnWGpmUDNVSnNyTzFT?=
 =?utf-8?B?SjhJc3JjK2UrR2o4T2VPdUs3a3hvNFg3NjVibEdJWDc5ZXJ0Wm5oVTlxUURC?=
 =?utf-8?B?aGcrOWkrSEVoM3RxSmRkUnVGMkhWbmpnWldCNHIwZFVSRnk2Uk1KSjJtTlIw?=
 =?utf-8?B?ZndSZFhDdWxqZVp6dVJEa0hrWVAwT29YeFU5VG5ielJzZEVHK1VwaG1leEFE?=
 =?utf-8?B?UWRYRjhxWWJQb2MrY3JBSCtQeTI0d3JHMVFlZ0tDem9xWGREMTE1cHFpSDZU?=
 =?utf-8?B?dzhMbnRUV1QrRkwwd0pVLzh0RFVjc0cwa2ErYUl5UUJ5R3FNelpPMVBVckxi?=
 =?utf-8?B?S1IzeTdiejRLYkJaL1NaQ2ZpNUVEQTFMNWdKczJhNkM1RjRqRWhNZkY3bjV3?=
 =?utf-8?B?cnl6T1MwZnRnMW5WcGkrRCsyQldmd08zOGc4R1NlZzNvWXBRY05VS3hOLzRX?=
 =?utf-8?B?N1RCY2QvTmg3dUxsYzg5cTBQK1B6K3dvaE9tYXR4TjJtS0hRNHFwZ1NqMnBh?=
 =?utf-8?B?ckhxSnEwRkIwY2M2aHNFc0F0WkNIaTI0NWIyczlpUUpVMUtmVzRoajFqUGFl?=
 =?utf-8?B?S1NsVWlzbTBpb2JCbzVFSzlwa3hRKzdoOU1Dc0g1dHE3T0NaMGlmd3c0Vy9N?=
 =?utf-8?B?eWVHNTJ6SVN5MFIxZENJVi9BTzFsR3Jtb25UT3BXK3p6cE1Oanhvck14b05q?=
 =?utf-8?B?Z3dxcnFzRlVocURzMHVqRldieW0waGp5M0EvamIrRmVGN1RFY1lyelJRakZS?=
 =?utf-8?B?MFJpNjNPeXpmc1dqTjJkYXhFc2h3cjB5YVRvV3laUmhISloxc3dCZzUrZlNO?=
 =?utf-8?Q?6RdosuXkLbtDIq46p+yUNp0jE?=
Content-ID: <788DE3201DC9ED4C890FE263DBD7D425@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57ce6bc5-6e87-4863-245a-08dd4c039958
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2025 07:54:09.7548 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RMGinyoM+1RG6VfkVWGyTvWYfipBsF6Ju1F1G3zMd8tLsPI6skGzDiwDFaFXfs9RNLu/J4Yfo4/NzJxUXxpiNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6979
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_007_1460341942.2018645970"
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

--__=_Part_Boundary_007_1460341942.2018645970
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDI1LTAyLTExIGF0IDEyOjMzICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBv
ciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBSZW1vdmUgdGhlICJkcml2ZXIgYm91bmQgdG8gSERN
SSIgcHJpbnQgdG8gYXZvaWQgdXNlbGVzcyBzcGFtIGluDQo+IHRoZSBrZXJuZWwgbG9nLCBhcyBy
ZWdpc3RlcmVkIGFuZCBib3VuZCBkcml2ZXJzIGNhbiBiZSBkZWJ1Z2dlZA0KPiB0aHJvdWdoIGRl
YnVnZnMuDQoNClJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPg0KDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8YW5nZWxvZ2lvYWNj
aGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfaGRtaS5jIHwgMSAtDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5j
IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMNCj4gaW5kZXggOWM5MjkwOTJh
OWE5Li41M2MyODczN2FjMmEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfaGRtaS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5j
DQo+IEBAIC0xNjMyLDcgKzE2MzIsNiBAQCBzdGF0aWMgaW50IG10a19oZG1pX3JlZ2lzdGVyX2F1
ZGlvX2RyaXZlcihzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ICAgICAgICAgaWYgKHJldCkNCj4gICAg
ICAgICAgICAgICAgIHJldHVybiByZXQ7DQo+IA0KPiAtICAgICAgIERSTV9JTkZPKCIlcyBkcml2
ZXIgYm91bmQgdG8gSERNSVxuIiwgSERNSV9DT0RFQ19EUlZfTkFNRSk7DQo+ICAgICAgICAgcmV0
dXJuIDA7DQo+ICB9DQo+IA0KPiAtLQ0KPiAyLjQ4LjENCj4gDQoNCg==

--__=_Part_Boundary_007_1460341942.2018645970
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1R1ZSwmIzMyOzIwMjUtMDItMTEmIzMyO2F0
JiMzMjsxMjozMyYjMzI7KzAxMDAsJiMzMjtBbmdlbG9HaW9hY2NoaW5vJiMzMjtEZWwmIzMyO1Jl
Z25vJiMzMjt3cm90ZToNCiZndDsmIzMyO0V4dGVybmFsJiMzMjtlbWFpbCYjMzI7OiYjMzI7UGxl
YXNlJiMzMjtkbyYjMzI7bm90JiMzMjtjbGljayYjMzI7bGlua3MmIzMyO29yJiMzMjtvcGVuJiMz
MjthdHRhY2htZW50cyYjMzI7dW50aWwmIzMyO3lvdSYjMzI7aGF2ZSYjMzI7dmVyaWZpZWQmIzMy
O3RoZSYjMzI7c2VuZGVyJiMzMjtvciYjMzI7dGhlJiMzMjtjb250ZW50Lg0KJmd0OyYjMzI7DQom
Z3Q7JiMzMjsNCiZndDsmIzMyO1JlbW92ZSYjMzI7dGhlJiMzMjsmcXVvdDtkcml2ZXImIzMyO2Jv
dW5kJiMzMjt0byYjMzI7SERNSSZxdW90OyYjMzI7cHJpbnQmIzMyO3RvJiMzMjthdm9pZCYjMzI7
dXNlbGVzcyYjMzI7c3BhbSYjMzI7aW4NCiZndDsmIzMyO3RoZSYjMzI7a2VybmVsJiMzMjtsb2cs
JiMzMjthcyYjMzI7cmVnaXN0ZXJlZCYjMzI7YW5kJiMzMjtib3VuZCYjMzI7ZHJpdmVycyYjMzI7
Y2FuJiMzMjtiZSYjMzI7ZGVidWdnZWQNCiZndDsmIzMyO3Rocm91Z2gmIzMyO2RlYnVnZnMuDQoN
ClJldmlld2VkLWJ5OiYjMzI7Q0smIzMyO0h1JiMzMjsmbHQ7Y2suaHVAbWVkaWF0ZWsuY29tJmd0
Ow0KDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtBbmdlbG9HaW9hY2No
aW5vJiMzMjtEZWwmIzMyO1JlZ25vJiMzMjsmbHQ7YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bj
b2xsYWJvcmEuY29tJmd0Ow0KJmd0OyYjMzI7LS0tDQomZ3Q7JiMzMjsmIzMyO2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jJiMzMjt8JiMzMjsxJiMzMjstDQomZ3Q7JiMzMjsmIzMy
OzEmIzMyO2ZpbGUmIzMyO2NoYW5nZWQsJiMzMjsxJiMzMjtkZWxldGlvbigtKQ0KJmd0OyYjMzI7
DQomZ3Q7JiMzMjtkaWZmJiMzMjstLWdpdCYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2hkbWkuYyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYw0KJmd0
OyYjMzI7aW5kZXgmIzMyOzljOTI5MDkyYTlhOS4uNTNjMjg3MzdhYzJhJiMzMjsxMDA2NDQNCiZn
dDsmIzMyOy0tLSYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYw0KJmd0
OyYjMzI7KysrJiMzMjtiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jDQomZ3Q7
JiMzMjtAQCYjMzI7LTE2MzIsNyYjMzI7KzE2MzIsNiYjMzI7QEAmIzMyO3N0YXRpYyYjMzI7aW50
JiMzMjttdGtfaGRtaV9yZWdpc3Rlcl9hdWRpb19kcml2ZXIoc3RydWN0JiMzMjtkZXZpY2UmIzMy
OypkZXYpDQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
aWYmIzMyOyhyZXQpDQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3JldHVybiYjMzI7
cmV0Ow0KJmd0OyYjMzI7DQomZ3Q7JiMzMjstJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjtEUk1fSU5GTygmcXVvdDslcyYjMzI7ZHJpdmVyJiMzMjtib3VuZCYjMzI7dG8mIzMyO0hE
TUkmIzkyO24mcXVvdDssJiMzMjtIRE1JX0NPREVDX0RSVl9OQU1FKTsNCiZndDsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtyZXR1cm4mIzMyOzA7DQomZ3Q7JiMz
MjsmIzMyO30NCiZndDsmIzMyOw0KJmd0OyYjMzI7LS0NCiZndDsmIzMyOzIuNDguMQ0KJmd0OyYj
MzI7DQoNCg0KPC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlwZTp0ZXh0LS0+PCEtLXst
LT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZSAqKioq
KioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFp
bCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRp
YWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRp
c2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNv
bnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNz
ZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5n
IG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5k
ZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3
ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWws
IG9yIGJlbGlldmUgDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9y
LCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8g
dGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwg
KGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QN
CmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24u
IFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_007_1460341942.2018645970--

