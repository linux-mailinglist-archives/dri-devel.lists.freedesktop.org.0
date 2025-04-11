Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6091A85659
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 10:19:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB5B310E088;
	Fri, 11 Apr 2025 08:19:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="oIuYYyR6";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="NQFIPB/i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E897D10E049
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 08:19:08 +0000 (UTC)
X-UUID: 9fdbca8616ad11f0aae1fd9735fae912-20250411
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=ojyV285rXEsnJjGhrxROyDqNSo4foMwDe0AfdfpnVaA=; 
 b=oIuYYyR6j4zimyBNYDeOBE9XLcV5mIzLLN1p++iaZ5pT1zztgQa2BwKZRG8HPSjrgtWmrDyN1F6Jl7v2lMmSkLw+Q0l61b6soiPk/hNokKnFB5PAAQpOvrgX03WWHFkNc0u9Yu6mWF21IgB6rEqS4PUpldFK7baQRBZ0SjgpvuE=;
X-CID-CACHE: Type:Local,Time:202504111619+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1, REQID:bd00ad09-3251-489a-bc94-514fdc92c06a, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:0ef645f, CLOUDID:2675f5a5-c619-47e3-a41b-90eedbf5b947,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
 nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
 OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 9fdbca8616ad11f0aae1fd9735fae912-20250411
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1705966579; Fri, 11 Apr 2025 16:19:01 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 11 Apr 2025 16:19:00 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1258.39 via Frontend Transport; Fri, 11 Apr 2025 16:19:00 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D3tEpkCzSqjWsF8fYsaIMc1TzCn7JcZ8GbjkfbWSzDWbGwrwl3xbAxBygSn2zq/lceKixFzx6b6afH5RDWET7j+5IezTkUj1jJa9hqBgFw2IFnS/d1fCKEI2bC8P0cJ1QCVV+S0BowWeGjWPNtKSgHI3E482D0iocQMHBgmB7o+UlCawh01+FQO+lswsERPDInCAU6IfEq2wTOMeZB15vu4s0+BwuTpMpb27/iiB4Hw1LuGsjBybGFijRyD/1JF4ySomAyyNSXgOAP4d/SFFqZNgG9IegJ6/RQ4J9JtIOOaboIC5/Y+HPTGnXLwifIIKKNt8mtwBvi3Hi6TOFG9m0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IHJHfbD2FEl4ZAenKYKKrXb5gQZw5nLYT3+yoH1fXF0=;
 b=DwQdJn6b+m38M6Af68JC/M/L5YaOGp0ee5aMr8725uI0IRhyueJjV191ASzJCFajiRw7CIjqB5+WHsrKg3BSQoXPYNfWct1LZhdODC1j55X75VxDMytAo01zWwA/OGNuv6KZUta6zG1jfUTe6mQ56L+AhBAiOKpXE+kGP8putYCwzYo+CxT01Jmo1MljK7WZSuNJ0xnlj7hvZ8Fj61Vl0bwTG3IFgP5ax1Pn7kGJ2DvmTugEi5ENrkXt/MkwJQh2uZwwupB+ah2mCD/n/WbAr7ABW1VFWxV4sJwzqmGG4yPZuP6pB9TDwJ01rrk1B9tiSGyfnr274ofWzw7ukKk+SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IHJHfbD2FEl4ZAenKYKKrXb5gQZw5nLYT3+yoH1fXF0=;
 b=NQFIPB/i5COebrT0YbeqKZQ78mB+JlsYJ2e4aK9Rcm9moejIzhqp8NcOJRBf1kucXwfM2kutm0W4Fc6CVYJTlWVdZ2M1qYS17POZl7fnPK62kJ96+x0E7ZP2irCWDTTRK4fYXmbwpHFgYp0Tp98KXqvQ1E5E10EGT6DSeb5E2zE=
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com (2603:1096:101:83::7)
 by SEYPR03MB7142.apcprd03.prod.outlook.com (2603:1096:101:d7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.23; Fri, 11 Apr
 2025 08:18:56 +0000
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::9fa0:ee98:d5ed:beba]) by SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::9fa0:ee98:d5ed:beba%3]) with mapi id 15.20.8632.017; Fri, 11 Apr 2025
 08:18:56 +0000
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
Subject: Re: [PATCH v8 16/23] drm/mediatek: mtk_hdmi: Split driver and add
 common probe function
Thread-Topic: [PATCH v8 16/23] drm/mediatek: mtk_hdmi: Split driver and add
 common probe function
Thread-Index: AQHbqVGAOVAUn7or+Ui6ODgXt7tC9bOeIhcA
Date: Fri, 11 Apr 2025 08:18:55 +0000
Message-ID: <b9eafca53149fec817433da3d10bf06a6c96f959.camel@mediatek.com>
References: <20250409131318.108690-1-angelogioacchino.delregno@collabora.com>
 <20250409131318.108690-17-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250409131318.108690-17-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB6626:EE_|SEYPR03MB7142:EE_
x-ms-office365-filtering-correlation-id: 066b1c6d-a24c-4fd3-3d73-08dd78d180ce
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|7416014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?eC9NNG9OU3J2azRTUDJlTzRqNG5QWis1RFNUemZuZWFuN3p2YjVHMy9MTnRy?=
 =?utf-8?B?QjlJWmVQaVRQY2RYQVFXNllBS0grSDVKQjFvRmNQRmlNTko2VkJYQTBUV0N0?=
 =?utf-8?B?Q2w2dHpPUVRQTG4yQU5WMUxyUVcyeUVTNThqVG4zQm9qZ1d0bkU3YVd4UE5C?=
 =?utf-8?B?ZENrWGJWZ1MwcXlSZ0ZXeXdVTXl2WlVHQm5UbGpTeDBSM0U0bWdNZUdjWG9D?=
 =?utf-8?B?Z0hzQ0tRSWtyN2V1WFQzbjZERDRZV2R1ajRQMGJtNjlVOU9OWStBcW1sa0V2?=
 =?utf-8?B?ZFVXOGF1VkZuN0JqbFlac1VFQ2FvL0l4UzVJbk5oeU03VHpBRUVBRGpzeW0x?=
 =?utf-8?B?NXlhbERSbVp0QjVOc2VzNXdEV3Q0TzZMQVFSdTlwaXkxb1R3Qll0YVFCczJX?=
 =?utf-8?B?SXVnZkJPbjMyUHBteUFQTlUvVU9yWVFlOUZOTysxK2JuTmhIU1UxTVFLMmlS?=
 =?utf-8?B?K2tLenN1L3g2VG4zalZYWVBUWTZsenFuSjhoMGFobk96N3RQMGNaUmFtb1Nh?=
 =?utf-8?B?QUtVOTEzVHAxNktsY3A3R0FZLzJTVGVtMC8zc2I0dW5pR1lqTTYrbzBGTUMw?=
 =?utf-8?B?RGF4QWdiMzRmaElPTzBSM0VicE5vWDBhdGM2V1hkbHZjZW9SWDhIWXg5Mlgx?=
 =?utf-8?B?Z3pPZ2hLdHI0ckhTaS8yLzQ2M1kySjJWNCtVeDdtYWYwOFFoUENvK2ZoQ29a?=
 =?utf-8?B?T3R4aHBCLzZJLy84UEtsL2g1RnA4WkJ0VUtobEZTT2ZxMEU5QmxmVmduVTdw?=
 =?utf-8?B?L2h1eXVTVEFWc2FoRHdJTEg2dWJDcTVIRllZNS9lbTZCVEdVb2xXKzNEK3Y4?=
 =?utf-8?B?S3JraGs0MVBHaVgrRzVZZkQvSnNYRE1SakhrL2wyUU5BS2dMZFU3Slp0cWJz?=
 =?utf-8?B?VFVBNFlTeHRvL1NMTjZpUlZZMGlvck8wWkhybkRHWUpqbzhTNjR0a0VmUUxz?=
 =?utf-8?B?amdtRUhSUXNSTnQzcVlNa1IrVnNJaUR2aVlFeEZ3djMxeWxVblYzbURtZ2pj?=
 =?utf-8?B?YXVLQ2tMNUExaTVrRGcyYVo2WHErUDUvZGFNQWc2TC9weFBkSkdnS2RzQWZr?=
 =?utf-8?B?ZEhQOURLM3h0NmVnZU9MQnZsc2ltaDIvQk5qaG9QSUt2MnRoVUM0c25sTEhY?=
 =?utf-8?B?K21uQWRGQTRRSzR1elFjRDJobm5vdVFZRmVoS1QrUzRXOGpBeEx3dHZvTXdP?=
 =?utf-8?B?SGJ3WEhUV1hRK3dIeWR2V04vVENoWi9vdTVjN0I1ME1saEx6V0tBbG5RZFE3?=
 =?utf-8?B?aDdJMlA5bFhKcXZZdW5qc3VPM0F1UUx5U2lJVFB0Q0pSTVl1VHlsUXZHcWVV?=
 =?utf-8?B?a2E1S0xqejBBdTdacTFLMnFualQ4V1JsZGpLT2c2N29YTGdIVHRMeU8rcmpZ?=
 =?utf-8?B?YnppeTNFMUtOZTVMNzBWQ1U4bjJUNVdYdlpzZEJHQjlWUzc5QWZNQlJ2OHlp?=
 =?utf-8?B?Y1AxVEdKNEIxTi83RmZrVWE4VTRBRjVBdTM1ekdwSFFybUN5encyVmpQeCth?=
 =?utf-8?B?R2VML2VIRTFLSGRpaUVvaGdkOE1wcVpmdDBIRmVtREViOTYrTTM4bTBQaHZv?=
 =?utf-8?B?OXBJNk9EeUNvZTdzN3lRNFQxU1BFVGJITkZiUUIvc3U2Ui9lN1BkYTFjMWFD?=
 =?utf-8?B?eXpjTjRpa01IRnJIUzEySEdvMi9lTGNReW5MdkZZc2dnWlN1TnRuUllXcnJu?=
 =?utf-8?B?WWNEd2FoeXNUY3NaTmNLQVlLc01odFQvQ3cxUlJ2b200QTJvcnlwZ1pIbzhw?=
 =?utf-8?B?T2k1dWkzMFAzU2xlOHVKYldLZUFRVGdwb1dJYmJ3RExlMExlN0xXWUZKNWFM?=
 =?utf-8?B?eFlad1BtTHZ6VlRKY0ZIS05hNlZzYkdqYnZISVJNc3RuRVBSNHdVK2t5cTQ5?=
 =?utf-8?B?N25GY3MzWmZteng0NkdQN1ZBWTdqSnJYQzJOeWlJdU93VDFpcENSVFNYaUI0?=
 =?utf-8?B?YnVCcHVIL2wwSUZMVW5pYUlVOS9YczFsU2YxQUFZUUU4SzNVdDlvYitXaG5R?=
 =?utf-8?Q?z3NvQDT/130s4vP/XM62eCPQKqbPuE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB6626.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(7416014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Wm1jREdvZk54M1JJN0UwSEd2WlhjcFRlMGs5MWU0MHBTWVl6OXZrMTNJYTZY?=
 =?utf-8?B?cTVHbGxnQVlGRkVsMmo2Sk1TVk1lVk1uRHBMeWJSanpuTk5wQ3dPTzFBb20r?=
 =?utf-8?B?Z0puUWt2ZkFiaWx2S0tDbFBDRHBJQ2ZpTElSRmN0RDBrWkplTlJ3dkJ5OFRm?=
 =?utf-8?B?OGllQUdORXR2cmpxSnJvYVpub1JKZkxUc25FVVY2Vm5SWUZHYXBwK1Y5Tk53?=
 =?utf-8?B?ZGNvUGt1U3RqaGM5RUhGanI0cVBzTXpGbVNXR2d4QUh3UjBZNzV4LzhBSXhG?=
 =?utf-8?B?RC8xbHV2bU93eTZpQTRJTVVXZzNHeXpHcWQvMEhxczB0WTJLMDFuYUQ5YzRM?=
 =?utf-8?B?RTJ4VnNKYnUzQUQyL2dYSGxhNVViRFRBT3hLSlJMdVR5aWVkeEJXK3h3Vnln?=
 =?utf-8?B?bkVGYkIrMy9QTUhGaEJEaVdqZXdORHFENTd2ZGhmYk9RYVNZYXdNdEl5eDQy?=
 =?utf-8?B?NjRmVzZqUG5LOS9HTVNlcEZpUitIMWJVMHM4RTcvdHdLa1lMZ1ArS0lIZXBM?=
 =?utf-8?B?Z3RoMkMrcWo1VjV1bU9wYlVPOEduOVlmdnIwUEp5VnVzOFFmbDhucGNibHZY?=
 =?utf-8?B?ZERoMXNpRVk4WG1MbGc5MVVDWG5IS2lhWjhEaTczNFBUbXMzaDhyMHY1Vm1s?=
 =?utf-8?B?WTIydXdGVUZObGtOVzJ0SW9rT0NmNDZmMFprZTdSMWtoem5hcW9MWndzdzVF?=
 =?utf-8?B?cC9ZVFYrejNwaVBDVDhiS2I5NmZXemZwalhVUm5DdjM4Y3Q5cHNzQ0N4ZSt6?=
 =?utf-8?B?eTRPbVYrYVJJQmUwcXZSMnVkVWZSVkdZSXVDaVYwWGlvblZiODdGVkMxSEY1?=
 =?utf-8?B?Ui9yVWQwSER2OHhHemhaQkhKWHQxUENWZFMvek5QWDNsSkRHQnlTWWg4cTNh?=
 =?utf-8?B?SHhrNHFMbURFNm8rMHk0Zy9VYUFMRDB6WU9Bc0ZpWUtkREdHeGF3aDlyV1ZJ?=
 =?utf-8?B?amZJa3Fnay9LSG9LWUJ1czJMWElFS29XeFdKZ2xTbmZ3Z3djUytSK1NkRnZk?=
 =?utf-8?B?eUpWTm9mcUNGZ0gxTS9rZ21HME83Q0dLNm9vUHVJTmlXWW5YaDBrWU83amxP?=
 =?utf-8?B?MGI5MjMwSUI1VVE2bG9wa1p0aFhWU2k5MjBYSmZoU3h2VGFoU3RJeUpvTGFI?=
 =?utf-8?B?TzFtNGY1ZU9NVjNWc0pnSWdVWmI4VWVqNWNzNktNVlE5UUl5ZWR6RTg2Yi9x?=
 =?utf-8?B?YXllQ3lBUHJnS2ZTNzZ6SzgvZloxdHRIZUpISmM1YzVXWkxGQXB1dkdHVXRh?=
 =?utf-8?B?VjdaUGQyWGlaeitIWis1TFlVa0NQcGNMSE5qcHUvZFlITHdBS3JaWVpuOUs1?=
 =?utf-8?B?ck56aFVvM3ZXaGh5OUszbDd3Rkt4MGFRdTcvUWExWTVMQ0FqLzhNR2syVEl1?=
 =?utf-8?B?RjhsalBCWFY5OE5xeGtNTURCUkpTWWsyZ1dPVUQzbEJoWURLSlVRcFB4WHo5?=
 =?utf-8?B?cjZXZExNMm5HMXY5TTZBdTNSV2FFRzZwd1J3b0ZNMXVsV0hYOW15OHNmZy9i?=
 =?utf-8?B?M1pMSDlXdDdqTDZVMjE0aTFyQ0pjWnBYbEZncituSEdPTEcrbUdsVFZ1c3BX?=
 =?utf-8?B?SnJucDRRK1cxNXUrSTJjcytSMnJsTUlGb1h4OXR3UmF3ay9RcCt1L3c0b2RT?=
 =?utf-8?B?eS8yY1ovalh1TGNNZVJrTlhxZUJPSTN3SFhyZG93MnhZVFBJaGQ0OFM5aGJS?=
 =?utf-8?B?c0FhemdRSExWeFRNb1VLMC9IaEp1OHBhaW9VWVo4NTVWQzRpK2JsYmpLV0tC?=
 =?utf-8?B?UTBJS1RpWFdFWGJlZ29EYWpNcUN2dk1QQVRFNGRSQy9tR0d6cDhvdzNxblRu?=
 =?utf-8?B?blpxRnVUZkN5Q1N2MHludm9UdTc5dWF0ZHhDK2M3SVJjKzVFUkJkQjJSdTR2?=
 =?utf-8?B?L3RLaTJabHJvekcrUHFUMEhDSGl1NlArOCtUaVl0ck0yREFGYThTcUprbjVq?=
 =?utf-8?B?NzBTMVV2ZExzSVR2YXo3cUNTYjQyazNyakdoaDZtT0Q5Y0cwMkh1cFRLdXdR?=
 =?utf-8?B?TzV1Yjc2T0o0YW5tM2FaWGZ6b3R4YmNRLyt5MGZJYytqbldPM3hlWldFY2Jn?=
 =?utf-8?B?L1duMytzbzJzK2E0SGhFVzYxdXRQbDZVRnZHRXl3VkN6YUJtNVlWNFFNMEVj?=
 =?utf-8?B?TFVoR1o0UXFHbWJDV2wrc3pxRFJNSXFFbkFNNHA4bUIzY1g4bElaWndCRk5v?=
 =?utf-8?B?NGc9PQ==?=
Content-ID: <8CC8138AA91F894299EC5213E323DDBD@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB6626.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 066b1c6d-a24c-4fd3-3d73-08dd78d180ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2025 08:18:56.0526 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i6jH2vlKE4KpcB4Yl+qJNehzy3GiJBsVZSLT+sH+rvS8jC/rox0HxhJ8wP/SQh3LfWYuYC4XjHIiapFUtyuKMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7142
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_008_1241604935.1796557635"
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

--__=_Part_Boundary_008_1241604935.1796557635
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDI1LTA0LTA5IGF0IDE1OjEzICswMjAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBv
ciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBJbiBwcmVwYXJhdGlvbiBmb3IgYWRkaW5nIGEgbmV3
IGRyaXZlciBmb3IgdGhlIEhETUkgVFggdjIgSVAsDQo+IHNwbGl0IG91dCB0aGUgZnVuY3Rpb25z
IHRoYXQgd2lsbCBiZSBjb21tb24gYmV0d2VlbiB0aGUgYWxyZWFkeQ0KPiBwcmVzZW50IG10a19o
ZG1pICh2MSkgZHJpdmVyIGFuZCB0aGUgbmV3IG9uZS4NCj4gDQo+IFNpbmNlIHRoZSBwcm9iZSBm
bG93IGZvciBib3RoIGRyaXZlcnMgaXMgOTAlIHNpbWlsYXIsIGFkZCBhIGNvbW1vbg0KPiBwcm9i
ZSBmdW5jdGlvbiB0aGF0IHdpbGwgYmUgY2FsbGVkIGZyb20gZWFjaCBkcml2ZXIncyAucHJvYmUo
KQ0KPiBjYWxsYmFjaywgYXZvaWRpbmcgbG90cyBvZiBjb2RlIGR1cGxpY2F0aW9uLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hp
bm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvS2NvbmZpZyAgICAgICAgICAgfCAgMTEgKy0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9NYWtlZmlsZSAgICAgICAgICB8ICAgMSArDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2hkbWkuYyAgICAgICAgfCA1NDIgKy0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICBkcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWlfY29tbW9uLmMgfCA0MjYgKysrKysrKysrKysr
KysrKw0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pX2NvbW1vbi5oIHwgMTg4
ICsrKysrKysNCj4gIDUgZmlsZXMgY2hhbmdlZCwgNjMzIGluc2VydGlvbnMoKyksIDUzNSBkZWxl
dGlvbnMoLSkNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2hkbWlfY29tbW9uLmMNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2hkbWlfY29tbW9uLmgNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvS2NvbmZpZyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9LY29uZmln
DQo+IGluZGV4IGU0N2RlYmQ2MDYxOS4uOTk0YjQ4YjgyZDQ0IDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvS2NvbmZpZw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvS2NvbmZpZw0KPiBAQCAtMzAsOSArMzAsMTggQEAgY29uZmlnIERSTV9NRURJQVRFS19E
UA0KPiAgICAgICAgIGhlbHANCj4gICAgICAgICAgIERSTS9LTVMgRGlzcGxheSBQb3J0IGRyaXZl
ciBmb3IgTWVkaWFUZWsgU29Dcy4NCj4gDQo+ICtjb25maWcgRFJNX01FRElBVEVLX0hETUlfQ09N
TU9ODQo+ICsgICAgICAgdHJpc3RhdGUNCj4gKyAgICAgICBkZXBlbmRzIG9uIERSTV9NRURJQVRF
Sw0KPiArICAgICAgIHNlbGVjdCBEUk1fRElTUExBWV9IRE1JX0hFTFBFUg0KPiArICAgICAgIHNl
bGVjdCBEUk1fRElTUExBWV9IRUxQRVINCj4gKyAgICAgICBzZWxlY3QgU05EX1NPQ19IRE1JX0NP
REVDIGlmIFNORF9TT0MNCj4gKyAgICAgICBoZWxwDQo+ICsgICAgICAgICBNZWRpYVRlayBTb0Mg
SERNSSBjb21tb24gbGlicmFyeQ0KPiArDQo+ICBjb25maWcgRFJNX01FRElBVEVLX0hETUkNCj4g
ICAgICAgICB0cmlzdGF0ZSAiRFJNIEhETUkgU3VwcG9ydCBmb3IgTWVkaWF0ZWsgU29DcyINCj4g
ICAgICAgICBkZXBlbmRzIG9uIERSTV9NRURJQVRFSw0KPiAtICAgICAgIHNlbGVjdCBTTkRfU09D
X0hETUlfQ09ERUMgaWYgU05EX1NPQw0KPiArICAgICAgIHNlbGVjdCBEUk1fTUVESUFURUtfSERN
SV9DT01NT04NCj4gICAgICAgICBoZWxwDQo+ICAgICAgICAgICBEUk0vS01TIEhETUkgZHJpdmVy
IGZvciBNZWRpYXRlayBTb0NzDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvTWFrZWZpbGUgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvTWFrZWZpbGUNCj4gaW5kZXgg
NDNhZmQwYTI2ZDE0Li43OGNmMmQ0ZmM4NWYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9NYWtlZmlsZQ0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvTWFr
ZWZpbGUNCj4gQEAgLTIxLDYgKzIxLDcgQEAgbWVkaWF0ZWstZHJtLXkgOj0gbXRrX2NydGMubyBc
DQo+IA0KPiAgb2JqLSQoQ09ORklHX0RSTV9NRURJQVRFSykgKz0gbWVkaWF0ZWstZHJtLm8NCj4g
DQo+ICtvYmotJChDT05GSUdfRFJNX01FRElBVEVLX0hETUlfQ09NTU9OKSArPSBtdGtfaGRtaV9j
b21tb24ubw0KDQpUaGUgd2hvbGUgcGF0Y2ggbG9va3MgZ29vZCB0byBtZS4NCkJ1dCBtYWtlIGNv
bW1vbiBwYXJ0IHRvIGEgbW9kdWxlIGxvb2tzIGEgbGl0dGxlIGJpdCBtb3JlIG1vZHVsYXJpemVk
Lg0KTGV0IHRoaW5ncyB0byBiZSBzaW1wbGUsIEkgd291bGQgbGlrZSB0aGUgd2hvbGUgTWVkaWFU
ZWsgaGRtaSBkcml2ZXIgYmUgYSBzaW5nbGUgbW9kdWxlLg0KRm9yIE1lZGlhVGVrIGRybSBkcml2
ZXIsIGl0IGlzIGFscmVhZHkgYnJva2VuIHRvIG1lZGlhdGVrLWRybSwgaGRtaSwgZHAgbW9kdWxl
cy4NCk1heWJlIHNvbWVkYXkgZHNpIG9yIGRwaSB3b3VsZCBiZSBicm9rZW4gdG8gbW9kdWxlcy4N
ClNvIEkgd291bGQgbGlrZSBoZG1pIHRvIGJlIGEgc2luZ2xlIG1vZHVsZSB3aGljaCBpbmNsdWRl
IHYxLCB2MiBhbmQgY29tbW9uIHBhcnQuDQpJZiBzb21lZGF5IHdlIG5lZWQgdG8gb3B0aW1pemUg
Y29kZSBzaXplLCB0aGVuIHNlbmQgcGF0Y2ggdG8gYnJlYWsgaGRtaSBtb2R1bGUuDQoNClJlZ2Fy
ZHMsDQpDSw0KDQo+ICBvYmotJChDT05GSUdfRFJNX01FRElBVEVLX0hETUkpICs9IG10a19jZWMu
bw0KPiAgb2JqLSQoQ09ORklHX0RSTV9NRURJQVRFS19IRE1JKSArPSBtdGtfaGRtaS5vDQo+ICBv
YmotJChDT05GSUdfRFJNX01FRElBVEVLX0hETUkpICs9IG10a19oZG1pX2RkYy5vDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYyBiL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jDQoNCg==

--__=_Part_Boundary_008_1241604935.1796557635
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1dlZCwmIzMyOzIwMjUtMDQtMDkmIzMyO2F0
JiMzMjsxNToxMyYjMzI7KzAyMDAsJiMzMjtBbmdlbG9HaW9hY2NoaW5vJiMzMjtEZWwmIzMyO1Jl
Z25vJiMzMjt3cm90ZToNCiZndDsmIzMyO0V4dGVybmFsJiMzMjtlbWFpbCYjMzI7OiYjMzI7UGxl
YXNlJiMzMjtkbyYjMzI7bm90JiMzMjtjbGljayYjMzI7bGlua3MmIzMyO29yJiMzMjtvcGVuJiMz
MjthdHRhY2htZW50cyYjMzI7dW50aWwmIzMyO3lvdSYjMzI7aGF2ZSYjMzI7dmVyaWZpZWQmIzMy
O3RoZSYjMzI7c2VuZGVyJiMzMjtvciYjMzI7dGhlJiMzMjtjb250ZW50Lg0KJmd0OyYjMzI7DQom
Z3Q7JiMzMjsNCiZndDsmIzMyO0luJiMzMjtwcmVwYXJhdGlvbiYjMzI7Zm9yJiMzMjthZGRpbmcm
IzMyO2EmIzMyO25ldyYjMzI7ZHJpdmVyJiMzMjtmb3ImIzMyO3RoZSYjMzI7SERNSSYjMzI7VFgm
IzMyO3YyJiMzMjtJUCwNCiZndDsmIzMyO3NwbGl0JiMzMjtvdXQmIzMyO3RoZSYjMzI7ZnVuY3Rp
b25zJiMzMjt0aGF0JiMzMjt3aWxsJiMzMjtiZSYjMzI7Y29tbW9uJiMzMjtiZXR3ZWVuJiMzMjt0
aGUmIzMyO2FscmVhZHkNCiZndDsmIzMyO3ByZXNlbnQmIzMyO210a19oZG1pJiMzMjsodjEpJiMz
Mjtkcml2ZXImIzMyO2FuZCYjMzI7dGhlJiMzMjtuZXcmIzMyO29uZS4NCiZndDsmIzMyOw0KJmd0
OyYjMzI7U2luY2UmIzMyO3RoZSYjMzI7cHJvYmUmIzMyO2Zsb3cmIzMyO2ZvciYjMzI7Ym90aCYj
MzI7ZHJpdmVycyYjMzI7aXMmIzMyOzkwJSYjMzI7c2ltaWxhciwmIzMyO2FkZCYjMzI7YSYjMzI7
Y29tbW9uDQomZ3Q7JiMzMjtwcm9iZSYjMzI7ZnVuY3Rpb24mIzMyO3RoYXQmIzMyO3dpbGwmIzMy
O2JlJiMzMjtjYWxsZWQmIzMyO2Zyb20mIzMyO2VhY2gmIzMyO2RyaXZlciYjMzk7cyYjMzI7LnBy
b2JlKCkNCiZndDsmIzMyO2NhbGxiYWNrLCYjMzI7YXZvaWRpbmcmIzMyO2xvdHMmIzMyO29mJiMz
Mjtjb2RlJiMzMjtkdXBsaWNhdGlvbi4NCiZndDsmIzMyOw0KJmd0OyYjMzI7U2lnbmVkLW9mZi1i
eTomIzMyO0FuZ2Vsb0dpb2FjY2hpbm8mIzMyO0RlbCYjMzI7UmVnbm8mIzMyOyZsdDthbmdlbG9n
aW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20mZ3Q7DQomZ3Q7JiMzMjstLS0NCiZndDsm
IzMyOyYjMzI7ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL0tjb25maWcmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7fCYjMzI7JiMzMjsxMSYjMzI7
Ky0NCiZndDsmIzMyOyYjMzI7ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL01ha2VmaWxlJiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjt8JiMzMjsmIzMyOyYj
MzI7MSYjMzI7Kw0KJmd0OyYjMzI7JiMzMjtkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hk
bWkuYyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjt8JiMzMjs1NDImIzMy
OystLS0tLS0tLS0tLS0tLS0tLS0tLQ0KJmd0OyYjMzI7JiMzMjtkcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2hkbWlfY29tbW9uLmMmIzMyO3wmIzMyOzQyNiYjMzI7KysrKysrKysrKysrKysr
Kw0KJmd0OyYjMzI7JiMzMjtkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWlfY29tbW9u
LmgmIzMyO3wmIzMyOzE4OCYjMzI7KysrKysrKw0KJmd0OyYjMzI7JiMzMjs1JiMzMjtmaWxlcyYj
MzI7Y2hhbmdlZCwmIzMyOzYzMyYjMzI7aW5zZXJ0aW9ucygrKSwmIzMyOzUzNSYjMzI7ZGVsZXRp
b25zKC0pDQomZ3Q7JiMzMjsmIzMyO2NyZWF0ZSYjMzI7bW9kZSYjMzI7MTAwNjQ0JiMzMjtkcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWlfY29tbW9uLmMNCiZndDsmIzMyOyYjMzI7Y3Jl
YXRlJiMzMjttb2RlJiMzMjsxMDA2NDQmIzMyO2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
aGRtaV9jb21tb24uaA0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtkaWZmJiMzMjstLWdpdCYjMzI7YS9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvS2NvbmZpZyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvS2NvbmZpZw0KJmd0OyYjMzI7aW5kZXgmIzMyO2U0N2RlYmQ2MDYxOS4uOTk0YjQ4Yjgy
ZDQ0JiMzMjsxMDA2NDQNCiZndDsmIzMyOy0tLSYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvS2NvbmZpZw0KJmd0OyYjMzI7KysrJiMzMjtiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9L
Y29uZmlnDQomZ3Q7JiMzMjtAQCYjMzI7LTMwLDkmIzMyOyszMCwxOCYjMzI7QEAmIzMyO2NvbmZp
ZyYjMzI7RFJNX01FRElBVEVLX0RQDQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7aGVscA0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtEUk0vS01TJiMzMjtEaXNwbGF5JiMzMjtQb3J0JiMzMjtk
cml2ZXImIzMyO2ZvciYjMzI7TWVkaWFUZWsmIzMyO1NvQ3MuDQomZ3Q7JiMzMjsNCiZndDsmIzMy
Oytjb25maWcmIzMyO0RSTV9NRURJQVRFS19IRE1JX0NPTU1PTg0KJmd0OyYjMzI7KyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7dHJpc3RhdGUNCiZndDsmIzMyOysmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO2RlcGVuZHMmIzMyO29uJiMzMjtEUk1fTUVESUFURUsN
CiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3NlbGVjdCYjMzI7
RFJNX0RJU1BMQVlfSERNSV9IRUxQRVINCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyO3NlbGVjdCYjMzI7RFJNX0RJU1BMQVlfSEVMUEVSDQomZ3Q7JiMzMjsrJiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtzZWxlY3QmIzMyO1NORF9TT0NfSERNSV9D
T0RFQyYjMzI7aWYmIzMyO1NORF9TT0MNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyO2hlbHANCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjtNZWRpYVRlayYjMzI7U29DJiMzMjtIRE1JJiMzMjtjb21tb24mIzMy
O2xpYnJhcnkNCiZndDsmIzMyOysNCiZndDsmIzMyOyYjMzI7Y29uZmlnJiMzMjtEUk1fTUVESUFU
RUtfSERNSQ0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
O3RyaXN0YXRlJiMzMjsmcXVvdDtEUk0mIzMyO0hETUkmIzMyO1N1cHBvcnQmIzMyO2ZvciYjMzI7
TWVkaWF0ZWsmIzMyO1NvQ3MmcXVvdDsNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjtkZXBlbmRzJiMzMjtvbiYjMzI7RFJNX01FRElBVEVLDQomZ3Q7JiMz
MjstJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtzZWxlY3QmIzMyO1NORF9TT0Nf
SERNSV9DT0RFQyYjMzI7aWYmIzMyO1NORF9TT0MNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyO3NlbGVjdCYjMzI7RFJNX01FRElBVEVLX0hETUlfQ09NTU9ODQom
Z3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7aGVscA0KJmd0
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtE
Uk0vS01TJiMzMjtIRE1JJiMzMjtkcml2ZXImIzMyO2ZvciYjMzI7TWVkaWF0ZWsmIzMyO1NvQ3MN
CiZndDsmIzMyO2RpZmYmIzMyOy0tZ2l0JiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9N
YWtlZmlsZSYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvTWFrZWZpbGUNCiZndDsmIzMy
O2luZGV4JiMzMjs0M2FmZDBhMjZkMTQuLjc4Y2YyZDRmYzg1ZiYjMzI7MTAwNjQ0DQomZ3Q7JiMz
MjstLS0mIzMyO2EvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL01ha2VmaWxlDQomZ3Q7JiMzMjsr
KysmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL01ha2VmaWxlDQomZ3Q7JiMzMjtAQCYj
MzI7LTIxLDYmIzMyOysyMSw3JiMzMjtAQCYjMzI7bWVkaWF0ZWstZHJtLXkmIzMyOzo9JiMzMjtt
dGtfY3J0Yy5vJiMzMjsmIzkyOw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjsmIzMyO29iai0mIzM2OyhD
T05GSUdfRFJNX01FRElBVEVLKSYjMzI7Kz0mIzMyO21lZGlhdGVrLWRybS5vDQomZ3Q7JiMzMjsN
CiZndDsmIzMyOytvYmotJiMzNjsoQ09ORklHX0RSTV9NRURJQVRFS19IRE1JX0NPTU1PTikmIzMy
Oys9JiMzMjttdGtfaGRtaV9jb21tb24ubw0KDQpUaGUmIzMyO3dob2xlJiMzMjtwYXRjaCYjMzI7
bG9va3MmIzMyO2dvb2QmIzMyO3RvJiMzMjttZS4NCkJ1dCYjMzI7bWFrZSYjMzI7Y29tbW9uJiMz
MjtwYXJ0JiMzMjt0byYjMzI7YSYjMzI7bW9kdWxlJiMzMjtsb29rcyYjMzI7YSYjMzI7bGl0dGxl
JiMzMjtiaXQmIzMyO21vcmUmIzMyO21vZHVsYXJpemVkLg0KTGV0JiMzMjt0aGluZ3MmIzMyO3Rv
JiMzMjtiZSYjMzI7c2ltcGxlLCYjMzI7SSYjMzI7d291bGQmIzMyO2xpa2UmIzMyO3RoZSYjMzI7
d2hvbGUmIzMyO01lZGlhVGVrJiMzMjtoZG1pJiMzMjtkcml2ZXImIzMyO2JlJiMzMjthJiMzMjtz
aW5nbGUmIzMyO21vZHVsZS4NCkZvciYjMzI7TWVkaWFUZWsmIzMyO2RybSYjMzI7ZHJpdmVyLCYj
MzI7aXQmIzMyO2lzJiMzMjthbHJlYWR5JiMzMjticm9rZW4mIzMyO3RvJiMzMjttZWRpYXRlay1k
cm0sJiMzMjtoZG1pLCYjMzI7ZHAmIzMyO21vZHVsZXMuDQpNYXliZSYjMzI7c29tZWRheSYjMzI7
ZHNpJiMzMjtvciYjMzI7ZHBpJiMzMjt3b3VsZCYjMzI7YmUmIzMyO2Jyb2tlbiYjMzI7dG8mIzMy
O21vZHVsZXMuDQpTbyYjMzI7SSYjMzI7d291bGQmIzMyO2xpa2UmIzMyO2hkbWkmIzMyO3RvJiMz
MjtiZSYjMzI7YSYjMzI7c2luZ2xlJiMzMjttb2R1bGUmIzMyO3doaWNoJiMzMjtpbmNsdWRlJiMz
Mjt2MSwmIzMyO3YyJiMzMjthbmQmIzMyO2NvbW1vbiYjMzI7cGFydC4NCklmJiMzMjtzb21lZGF5
JiMzMjt3ZSYjMzI7bmVlZCYjMzI7dG8mIzMyO29wdGltaXplJiMzMjtjb2RlJiMzMjtzaXplLCYj
MzI7dGhlbiYjMzI7c2VuZCYjMzI7cGF0Y2gmIzMyO3RvJiMzMjticmVhayYjMzI7aGRtaSYjMzI7
bW9kdWxlLg0KDQpSZWdhcmRzLA0KQ0sNCg0KJmd0OyYjMzI7JiMzMjtvYmotJiMzNjsoQ09ORklH
X0RSTV9NRURJQVRFS19IRE1JKSYjMzI7Kz0mIzMyO210a19jZWMubw0KJmd0OyYjMzI7JiMzMjtv
YmotJiMzNjsoQ09ORklHX0RSTV9NRURJQVRFS19IRE1JKSYjMzI7Kz0mIzMyO210a19oZG1pLm8N
CiZndDsmIzMyOyYjMzI7b2JqLSYjMzY7KENPTkZJR19EUk1fTUVESUFURUtfSERNSSkmIzMyOys9
JiMzMjttdGtfaGRtaV9kZGMubw0KJmd0OyYjMzI7ZGlmZiYjMzI7LS1naXQmIzMyO2EvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19oZG1pLmMNCg0KDQo8L3ByZT4NCjwvcD48L2JvZHk+PC9odG1sPjwhLS10eXBlOnRl
eHQtLT48IS0tey0tPjxwcmU+KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkg
Tm90aWNlICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGlu
IHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJl
IGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhl
bXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVk
IHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFu
eSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5n
IG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykg
YnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5
IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0
aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZSANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1h
aWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSBy
ZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0
aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwg
YW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90
aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_008_1241604935.1796557635--

