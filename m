Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 438ACA94C08
	for <lists+dri-devel@lfdr.de>; Mon, 21 Apr 2025 07:09:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D4D010E14A;
	Mon, 21 Apr 2025 05:09:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="QbS8t+a8";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="Aa6NBT8/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B09B10E14A
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 05:09:20 +0000 (UTC)
X-UUID: c23b93861e6e11f09b6713c7f6bde12e-20250421
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=LyrvRKkaOtPUNJ6iYOPl+323mWkWqynIpsz346oNxIo=; 
 b=QbS8t+a8H5voikGz/3431qX11K35hP3JVrEcIwm0/iIfOrj+N3IoKaez88d9CUt8234HFR+Yq1vluqToygysvcuAK4tg8y5H9RGSht3lqqb7xrn31R+kvU2qa1/vswX9u51rfOOKeJVyfU8s7jXGGJGuCmh0Lu7dOKKt4Lyb04w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1, REQID:3b6db657-f847-47e2-9e93-9aa5e80a4e3c, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:0ef645f, CLOUDID:fb387b8b-0afe-4897-949e-8174746b1932,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
 nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
 OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: c23b93861e6e11f09b6713c7f6bde12e-20250421
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 847488096; Mon, 21 Apr 2025 13:09:10 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 21 Apr 2025 13:09:08 +0800
Received: from TYPPR03CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 21 Apr 2025 13:09:08 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iL4rwGGqsBlXj9i2ZcEqRM+1gPjMxBSEC8DOz/qhaUDZYX39XTKneSRKrBfiWVX6FqCjWQK+t6TpFH3ASGnj50YaKR1fibdgx3+3q2Z5y26lMpDBQqAqqBHDVvKLfAKKddQ4QrlCeiXSNKEugqxDP6Nj5vSYzMd2DPdh6P2gdLD9eLVfVT2OBjA5T9bXGwZ1UabF2Z5sMN0PdJMLHuwbjCuw93+hhgwk7BWVwXieoDqBYz0lxcrN3B8R2tiBEhK2WaFBPoEEEwrJ23RLgN+m7C7JRqQ+1pR5gTcohLbVhpuiO0+36p5pMez0/XSnDFuY1N+M15slQLj0qCwm/Mr7Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ss8v20EV7m3x8Hx63pPyzpnBUoEzvoM21sC4RyYOBjw=;
 b=yz67DKrTNHO4M4bJTy7xxKoGC3i82BgWXgr/NDLZ5cssNCcogr9ZwRRDa88c+Jpw78U7UdU2ihU3hL1ENYwpZI/YDVMoLycRonlSjEz6Lfv1HY7h4j1Q6bJL34EGzQgbT5y8bC4fymOnqxAh0I1gc/6PKQKyXxKKwqsRxZ1GMFVwAypXyTk8riJO8sn22oy7jLoyMMQ+6VkTJTSum3LPakWlO+xsjCMwMXP0E/xGZBpZo/hD51qyo5s3rWuCh1EbZX7goLpE2+7Pp81EU08Gp52Oll9gk1piTfTOu+l+gJ91iaLbz6lyujP4QgZ2bP1qUefhifeRftvlZjvUyYCETg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ss8v20EV7m3x8Hx63pPyzpnBUoEzvoM21sC4RyYOBjw=;
 b=Aa6NBT8/as4W0lqrq1v4ixJ74Phy4ggXfgNJDIaZpm62EMKFzmWeYJclYN+Ecy6jVpx7Iuczb7jUignGQ3Evom2xcp3PVoceEy4XH9G6q7wYvzaoQg9K5uZbdDv6ucM1ph8bZSVvQfX33T5BsfBJFPbq7OJe5H7rV6CvcEiqp1s=
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com (2603:1096:101:83::7)
 by TYSPR03MB7804.apcprd03.prod.outlook.com (2603:1096:400:475::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.25; Mon, 21 Apr
 2025 05:09:06 +0000
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::9fa0:ee98:d5ed:beba]) by SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::9fa0:ee98:d5ed:beba%3]) with mapi id 15.20.8632.035; Mon, 21 Apr 2025
 05:09:06 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>,
 =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>,
 "kishon@kernel.org" <kishon@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "mripard@kernel.org" <mripard@kernel.org>, AngeloGioacchino Del Regno
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
Subject: Re: [PATCH 1/5] dt-bindings: eDP: mediatek: add eDP yaml for mt8196
Thread-Topic: [PATCH 1/5] dt-bindings: eDP: mediatek: add eDP yaml for mt8196
Thread-Index: AQHbsC6opG5X2Zu/PEOSrO5BeX0HRbOtlqSA
Date: Mon, 21 Apr 2025 05:09:05 +0000
Message-ID: <4901a1404ddf8a84c91b3fdf3a870330fca053ce.camel@mediatek.com>
References: <20250418065313.8972-1-bincai.liu@mediatek.com>
 <20250418065313.8972-2-bincai.liu@mediatek.com>
In-Reply-To: <20250418065313.8972-2-bincai.liu@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB6626:EE_|TYSPR03MB7804:EE_
x-ms-office365-filtering-correlation-id: 0a36c8b4-ce26-4248-d7a2-08dd8092a3dd
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700018|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?RTdhakQ1ZW45c2JRYlhNc0M2SWdIQnoyYUJ0N1VqUFljai8xMlBQdERTb045?=
 =?utf-8?B?eGVZbitLd2V3Y2hqTnExS0ZwNlAvWjlBa0xGNzVWNWZGYXNSdm92MGphUEhl?=
 =?utf-8?B?NFJIanVreFgrUTR4SjRMWGJNeXpZcXZETENMOGZFNFV0QUxFdzBRcWVZdUdN?=
 =?utf-8?B?VU8xNG5EaW15NkZ5QVZCUGIrdUF0dGNuWndqWXZWVTcrSmtzc1pTbWVKUUZm?=
 =?utf-8?B?Vkh6SW5sMzlrZDFZT0ZhMWxsUk50aGRJc1AxY0xQSVNtd2s0SHdILzFUQWJX?=
 =?utf-8?B?UW9ia2QreDljQno3NVhJbXNiSGhvK2NtOU5kTFllQk5qa00rY2hGMUdiOXNE?=
 =?utf-8?B?M3RBVjVlL2k0ZHNNWlowb0QzZnVTRUpJVWJ2c0hYMnNwSC8wQUxPOHIyVjdZ?=
 =?utf-8?B?RkdBS21FZ3BxbXRTdk1nb0IzRXFucHRFUHRFSnlsd2Z6Vk0rWitPbXdiV08w?=
 =?utf-8?B?RUEvNU5TR3BqM1ZCNjFUU2RxVnVSNHQzQXJpRUN4UXBEVnNLUjA1MStrTnNP?=
 =?utf-8?B?cGpOYU1NVjJwVWtldkxxcFFwdG5WV2JCelFQZnNlaFJXSDZMM3lpV1lrTlIr?=
 =?utf-8?B?US9rN3llV3VjSlNBU1RUdGRKTkJvQnZVdVhyWVRxVUQwN1dhQXZLVHB6KzZZ?=
 =?utf-8?B?YXFSd2FPeGZuSHMvblUwVFBlSS9QTU9jWmdLNVVqRm5uWXQzQWRVVGlCRzN1?=
 =?utf-8?B?RUptQ1g2S2NlZDNwd0tOUk1DU2d1UXdQRlJwL2tjU3c3WlhiNFpQaURId2E0?=
 =?utf-8?B?WmM3ZU9iZXdhOFlrRFVLU3FzQTZnbFpnWmlScTQvTDI2UERmaWRLWHJwb3NM?=
 =?utf-8?B?NzQ0cGhERys3SzkzS0VrZFdNbWE0ZDFyS0toUlpYRGhnWk1WVFlBZEVHYzZI?=
 =?utf-8?B?Y2dJRUNaejVrQmZ2OUlMZThaUzFVVmVtYXNEWFg0YmxWZmFpVUE2ek1tSXVm?=
 =?utf-8?B?bDZuWUJsNHBVWmIvQ0dkcUcrdFhydWtoNW9jaVRHa0lLckxlK3VSZnVVbkg5?=
 =?utf-8?B?M0VpRHpScEFIL0tMeTJuOTFPQ3c2ek83RWNtcDNNRW0yWEp2WFhpaUYxV0Nk?=
 =?utf-8?B?M3AzbVg0UkgxY0t4MUIrS1pZN0dPT0U4RjJUVWx6Z2gyaTlXQVNwYW01Yjhl?=
 =?utf-8?B?bjI2YkNYRjZGcDRDNjlPalpibmtnSm0rUS9ia1VpU3ZvSjBzcEd0a2dYekxo?=
 =?utf-8?B?QVdDeXIyb3ZqTDZuWnhTSFN1RERlWXJDMlkwU1JlSi9XWGNGV1gwVVpMYmZ6?=
 =?utf-8?B?RUs1YU83dUh5SERtVG1KY3ZkSkxyaGhlV2YxMmJqRGdDbFErcmRzYlJlTk45?=
 =?utf-8?B?VVY5L2wrc2ZDb1ltYlZSRzZneFY1NnVNajIvQm9hQlkydFZFV3BKd2ZGY3hY?=
 =?utf-8?B?Y3pVRWMwZHhwalNUcWdYOGZneTd5Q09iQkRiWTB5KzF3SGNISTlVc0p4dFhk?=
 =?utf-8?B?bW5POTBqclBSMk16MmVjNmJRVW03TDN3dDRWVUxSUmMwTG9pNmNtd2tPMGFj?=
 =?utf-8?B?NlZUbWltVTlicnFvNUJsKzRWUmpIV01ORzliNTRRNWxMd3h1SWF6cEhVNG0y?=
 =?utf-8?B?ZHpBTDhCdVMzN09qTUY4LzVucWJnSnB4bDZPK3d1b1hCby9OcHRnUnJicm43?=
 =?utf-8?B?VXJPM1YxL2plSnNjRlhaUEVhbjhKcEF2dGo4czFVQU10WTMzcWtxTTMvN3gv?=
 =?utf-8?B?cjhhTi9DOTYyV0dONU4yRkUyUDdMRW96cG5VVXV2Z0ordTFQaHozdTV6TDNw?=
 =?utf-8?B?RkUrZFM3cHlsMkloTCtyeEkwTm9CdzJzaDBWMkpIaExGNG1VREhrbk00QnFZ?=
 =?utf-8?B?ZitWVWhEM29IdHNQUDVPbThmSHUzN1JNdDB0cVJiZHJkUHE0OFlITHZaQVBT?=
 =?utf-8?B?Y29ta2ZjUmpjMTJTUmhEajhIY1VOb09LK3Rxc0ZlQzE3M3ArcThTQTZTU2tp?=
 =?utf-8?B?ZTlsV1VrY0tUWU5Pc1BRek1OdzFEY2ZCbTBsUkF4NHN2YVdrekFjV2VmbVRE?=
 =?utf-8?Q?89JvuQ+35V0OTAKPqav4WzkO7UNMRY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB6626.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MDNUYWwzVzR4Q09QL2lha3paRzFYNHpxbDc2b1VkVGFpUFIwUFZaem8yZWVN?=
 =?utf-8?B?WWREbmp3dXhZMmtncUlHQzhKQTJkTnlBdzNDREpVVnhORlU1cEtZYWg3R24x?=
 =?utf-8?B?cU9KaVlpNnlpZTVKQVlEc1dMY0JNdnhjbU5ia2J0RFl0eXp2VjhGbnVSdnpM?=
 =?utf-8?B?a3lYRDU0R2JRY05SMWY0WmlYWk9HYS9BOEp1dG1uNCtlU3RpUG16aFhKRUFL?=
 =?utf-8?B?QXhtczZvRDMxT3RkNm8yOW1Idm14QldLQUFuRy85L3NMV0dGVDBuMnZmendS?=
 =?utf-8?B?S0M1Y0tMdHVtYURHN3ZGT0VIQ0NVODJmUEZhbDZrbitva1pDYXZLbDlRVWp1?=
 =?utf-8?B?dlMzbTVwUS9QWWNneVZjTi9JNmlVb0lZNmh5MVA1N2REdFRidllLOUJCQUNa?=
 =?utf-8?B?Qlc3SjRPN0VvbWk5bHdtT0RvaEpMeTR3UXBLMng2TnArQXNsbDI1dlo1dGRQ?=
 =?utf-8?B?YjNKcTY4ODdJeGF4YU9GOFVMRWJHSWpkN25WNnhaUUtqeHZYUTl6ZW4xQXh2?=
 =?utf-8?B?TkZFck92Vi9tckRLNm1YOG9DY0J3ZnpwTCtENDVlQXdRTzE1SmFXcnhrNGZ0?=
 =?utf-8?B?eXIvRXNLRko0MnpCTDdwWkVNdmJGcUN6YUJxZ0hxd01rN2p4Tzl6bWxSMDBM?=
 =?utf-8?B?VGtIL2MybmpYbWpWcVdiY2RPU1QvVk1GOFp4ckNYMmN4Q3ZyUFBrR1FyTWJN?=
 =?utf-8?B?cFZvUzlvOTNaS1NJdm05bitjQmxPRUY3UnQxWWdEdzZ3OEpJd2c3V0Q5M29J?=
 =?utf-8?B?T0U2alNnbi9zU3UwUDJZOEdLUTJoU0tLNVEydEw5dHpObFB1V0c5SERDNGhv?=
 =?utf-8?B?cnpCVGpyU3ozQjUwQmpZWkJCMFc2Y0tCSUd4VXY5ZjRZSUFVdXNrL3hkNzdn?=
 =?utf-8?B?SnBwOGdtRXp3eW5xV0MvaW9FeXpHUjkwVGIwcW5pZmtOMFRJTno5L1RudDNU?=
 =?utf-8?B?czNOK3VlSmpjSDg4ZVU4Wm9uUHNBTzBQUkR2V04vOFNmVjY5bkVtQkVJTTNr?=
 =?utf-8?B?TzhsRWlWQjRFMlg0Tm9XSUc5Q0RSbUcrTlRXRVl1LzdxSUc3eEsyUzZZdDdC?=
 =?utf-8?B?RnpBZDV0MVZGdnYzME45V3k2a2dFcVFQMUlpOEV1Y25yQVllVG51K2JNanJC?=
 =?utf-8?B?UTUwRkhxYk9Mb25qcjhWMC9FS2VHSGtBVndyVDFrbThGNU5yYVhUQ2RDVGhD?=
 =?utf-8?B?WXZZVjVpUU9Mb1RVak9JejJ6aE5OcTYxVmk1SFJra203VFJ2YUU5NjR2bUkv?=
 =?utf-8?B?OEhZbDNONFJ0TnRnSTcxeTV2MWx1Q3phWkZxVk0wVUppSHEzY2JkZXRNTlpy?=
 =?utf-8?B?MzN2WDdMa1BqdEh0ZHp0a3crdjJGdk16YlNUM1R6M0JmKzE4MWtJRkhmWnVG?=
 =?utf-8?B?WWZzcWVXV214cXdWVWZHL0NDYXhJMmZhV1dzYnhSenRNb1JUSkFvTlYyU01v?=
 =?utf-8?B?ZHR6UXBkL3FZdldzUXdMVnJPNWNiNVZrZWE3MmxVSlAyT0hlNWEySDdPakNP?=
 =?utf-8?B?ZEx3NjVka1dGMkNIcSthNmpBYnpVZkNJNFcvUlNXMituM1owR2V3MTRQb2pq?=
 =?utf-8?B?UzZuTGNwa1k0c09nZWx4WkJPSHRIa1BnZ204QjRpeTlFbXFkcUM3eHJBWXZX?=
 =?utf-8?B?SVlNbzA3TVN0SVMrbXRHRDF3Z1JnTFFaYmUzTzI2Wms4Sm5aYVo1T251K2g4?=
 =?utf-8?B?QS9DQ0lBY2NuMm41eThhcDZUR2tVaElFa1pIUmY4ck4wS25sS2RJdUFXOXgx?=
 =?utf-8?B?TlBXc1dqU2lsbmpBNVF5b3UrTXE5VnRsWE9ZZUFOdmlzVGxLVDlFSXJXT0h1?=
 =?utf-8?B?aWQvR1A4REd6N2VsUUdoM0RKTGM3MnBybTkyZk5MTzlNQlRLVVZZNzZONk9y?=
 =?utf-8?B?MWRhTGNZTG96V2RwUVlHYVN6M3hEOTdIZVU1ZW5neGZncnM2ZGt2ZE5vUjNv?=
 =?utf-8?B?QVNTM295UGdUZk80RG4wSWY4eGxnRW16L2hZSmJ5ckpxZFlMRUhJUUZNNnps?=
 =?utf-8?B?L2MvRmJaVTBkNzZ0bGw0Zk5ENmhrS0Nsa2l2TGhVSmVjczZIK3ZGajVxQXM2?=
 =?utf-8?B?am54Yi9GTHY3Y3pqTi9pamNwZTZpNVQvV1FTbGNxcEM1UkU1Rm9YNHFLcC90?=
 =?utf-8?Q?jp6t1vXhI1PvIeMTkp4XrLAVq?=
Content-ID: <3A6EACA6341C3940971F19189D0F1FA8@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB6626.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a36c8b4-ce26-4248-d7a2-08dd8092a3dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2025 05:09:05.8846 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 17MdpEwWYE6w2oZgrTH9bSuXOEJVhlV5gJC3m6WgMMYGc674LjLu2Pt8HusfaUlcM+GiOuWM8uo8IYc4tFUtdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7804
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_004_510640969.1557473070"
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

--__=_Part_Boundary_004_510640969.1557473070
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpLCAyMDI1LTA0LTE4IGF0IDE0OjUyICswODAwLCBCaW5jYWkgTGl1IHdyb3RlOg0KPiBB
ZGQgY29tcGF0aWJsZSBzdHJpbmcgdG8gc3VwcG9ydCBlRFAgZm9yIE1UODE5Ni4NCg0KU2F5IHNv
bWV0aGluZyBhYm91dCBtdDgxOTYtZWRwLXR4Lg0KV2hhdCdzIHRoZSBtdDgxOTYtZWRwLXR4IHBy
aW1hcnkgbmV3IGZ1bmN0aW9uPw0KDQpSZWdhcmRzLA0KQ0sNCg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogQmluY2FpIExpdSA8YmluY2FpLmxpdUBtZWRpYXRlay5jb20+DQo+IC0tLQ0KPiAgLi4uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkcC55YW1sICAgICAg
IHwgMiArKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVr
L21lZGlhdGVrLGRwLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9tZWRpYXRlay9tZWRpYXRlayxkcC55YW1sDQo+IGluZGV4IDc1Y2U5MmY0YTVmZC4uMjY5
OTdmZWJhNjZiIDEwMDY0NA0KPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkcC55YW1sDQo+ICsrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRwLnlhbWwN
Cj4gQEAgLTI1LDYgKzI1LDcgQEAgcHJvcGVydGllczoNCj4gICAgICAgIC0gbWVkaWF0ZWssbXQ4
MTg4LWVkcC10eA0KPiAgICAgICAgLSBtZWRpYXRlayxtdDgxOTUtZHAtdHgNCj4gICAgICAgIC0g
bWVkaWF0ZWssbXQ4MTk1LWVkcC10eA0KPiArICAgICAgLSBtZWRpYXRlayxtdDgxOTYtZWRwLXR4
DQo+ICANCj4gICAgcmVnOg0KPiAgICAgIG1heEl0ZW1zOiAxDQo+IEBAIC05OCw2ICs5OSw3IEBA
IGFsbE9mOg0KPiAgICAgICAgICAgICAgICBlbnVtOg0KPiAgICAgICAgICAgICAgICAgIC0gbWVk
aWF0ZWssbXQ4MTg4LWRwLXR4DQo+ICAgICAgICAgICAgICAgICAgLSBtZWRpYXRlayxtdDgxOTUt
ZHAtdHgNCj4gKyAgICAgICAgICAgICAgICAtIG1lZGlhdGVrLG10ODE5Ni1lZHAtdHgNCj4gICAg
ICB0aGVuOg0KPiAgICAgICAgcHJvcGVydGllczoNCj4gICAgICAgICAgJyNzb3VuZC1kYWktY2Vs
bHMnOiBmYWxzZQ0KDQo=

--__=_Part_Boundary_004_510640969.1557473070
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO0ZyaSwmIzMyOzIwMjUtMDQtMTgmIzMyO2F0
JiMzMjsxNDo1MiYjMzI7KzA4MDAsJiMzMjtCaW5jYWkmIzMyO0xpdSYjMzI7d3JvdGU6DQomZ3Q7
JiMzMjtBZGQmIzMyO2NvbXBhdGlibGUmIzMyO3N0cmluZyYjMzI7dG8mIzMyO3N1cHBvcnQmIzMy
O2VEUCYjMzI7Zm9yJiMzMjtNVDgxOTYuDQoNClNheSYjMzI7c29tZXRoaW5nJiMzMjthYm91dCYj
MzI7bXQ4MTk2LWVkcC10eC4NCldoYXQmIzM5O3MmIzMyO3RoZSYjMzI7bXQ4MTk2LWVkcC10eCYj
MzI7cHJpbWFyeSYjMzI7bmV3JiMzMjtmdW5jdGlvbiYjNjM7DQoNClJlZ2FyZHMsDQpDSw0KDQom
Z3Q7JiMzMjsNCiZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtCaW5jYWkmIzMyO0xpdSYjMzI7
Jmx0O2JpbmNhaS5saXVAbWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYjMzI7LS0tDQomZ3Q7JiMzMjsm
IzMyOy4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZHAu
eWFtbCYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7fCYjMzI7MiYjMzI7KysNCiZn
dDsmIzMyOyYjMzI7MSYjMzI7ZmlsZSYjMzI7Y2hhbmdlZCwmIzMyOzImIzMyO2luc2VydGlvbnMo
KykNCiZndDsmIzMyOw0KJmd0OyYjMzI7ZGlmZiYjMzI7LS1naXQmIzMyO2EvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZHAueWFtbCYj
MzI7Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9t
ZWRpYXRlayxkcC55YW1sDQomZ3Q7JiMzMjtpbmRleCYjMzI7NzVjZTkyZjRhNWZkLi4yNjk5N2Zl
YmE2NmImIzMyOzEwMDY0NA0KJmd0OyYjMzI7LS0tJiMzMjthL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRwLnlhbWwNCiZndDsmIzMy
OysrKyYjMzI7Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRp
YXRlay9tZWRpYXRlayxkcC55YW1sDQomZ3Q7JiMzMjtAQCYjMzI7LTI1LDYmIzMyOysyNSw3JiMz
MjtAQCYjMzI7cHJvcGVydGllczoNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7LSYjMzI7bWVkaWF0ZWssbXQ4MTg4LWVkcC10eA0KJmd0OyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjstJiMzMjttZWRpYXRlayxtdDgxOTUtZHAtdHgNCiZn
dDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7LSYjMzI7bWVkaWF0ZWss
bXQ4MTk1LWVkcC10eA0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOy0m
IzMyO21lZGlhdGVrLG10ODE5Ni1lZHAtdHgNCiZndDsmIzMyOyYjMzI7DQomZ3Q7JiMzMjsmIzMy
OyYjMzI7JiMzMjtyZWc6DQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7bWF4SXRl
bXM6JiMzMjsxDQomZ3Q7JiMzMjtAQCYjMzI7LTk4LDYmIzMyOys5OSw3JiMzMjtAQCYjMzI7YWxs
T2Y6DQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtlbnVtOg0KJmd0OyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOy0mIzMyO21lZGlhdGVrLG10ODE4OC1kcC10eA0KJmd0OyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOy0mIzMyO21lZGlhdGVrLG10ODE5NS1kcC10eA0K
Jmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7LSYjMzI7bWVkaWF0ZWssbXQ4MTk2LWVk
cC10eA0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3RoZW46DQomZ3Q7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3Byb3BlcnRpZXM6DQomZ3Q7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzM5OyNzb3VuZC1k
YWktY2VsbHMmIzM5OzomIzMyO2ZhbHNlDQoNCg0KPC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48
IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlk
ZW50aWFsaXR5IE5vdGljZSAqKioqKioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNv
bnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVu
dHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhl
cndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBp
cyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBp
ZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcs
IHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0
YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0
ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNp
cGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUgDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVk
IHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlh
dGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29w
aWVzIG9mIA0KdGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91
ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWls
IHRvIGFueSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_004_510640969.1557473070--

