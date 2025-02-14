Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 887C6A3561C
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 06:16:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7E2E10E210;
	Fri, 14 Feb 2025 05:16:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="dCSRWIxd";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="AlzJEy5G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 181FA10E210
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 05:16:29 +0000 (UTC)
X-UUID: d63238dcea9211efb8f9918b5fc74e19-20250214
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=bfHzbBXcy8T6ERmn+UKyXcKISxFQuRAxX1J/ooGN5Tc=; 
 b=dCSRWIxdaRq6HCxXv5IpjfAuls0A+ZpLECyz6Zr3KSrK7pVyMuPTYxOfOm53HboWxZkUkfSRUgLnJKWKfjggIh3Fy1nsMDaOzKQeWcl8DPa17451oDYt7wtxL53x7kAFF8Y247Q9ppAfRgk0sTyIpokTqXamHEUxljwp/4PDwlM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46, REQID:abac99e4-f256-4204-b17c-9d228b9378d5, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:60aa074, CLOUDID:71965b8f-637d-4112-88e4-c7792fee6ae2,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
 EDM:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
 ,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: d63238dcea9211efb8f9918b5fc74e19-20250214
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1078065804; Fri, 14 Feb 2025 13:16:25 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 14 Feb 2025 13:16:23 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 14 Feb 2025 13:16:23 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dYTDC46xIL9jpUoULekaz//BXqdbxV6/dmmnJcY89lGuH3a4zQmjF33ns7pQrqGcpperXia/Dl6B+E4kCGGEegaYBFGB7GlpZpEtWdbHNS+CKtSjhGQ5J+pUJN8TgHEI/2OtV75O7gMiBzAFaOEsiPwL4VSQliDt5Xa9NbQrRxCosr5ZFSHdZXRWTLgW1xFqn8zrBdme2LqAdCOpfWFE64RiMoRnSAebzR6PdIxXt+2bQGDrrrD7H8JZBiW9/ZoVVEbbjfVcE+H58HpsxE3uUOkrXDLHjI6LVr7usD45BhF+4e+CbOvC0am+xxzYzZ5pEyU5yG+9Wy84kdreRCXiSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q8LfJkXWTjfPHQnmR9BefMkw0mZNiAm7494xopEYy/I=;
 b=VYTDnTVXCyUeiHM2tNCic+Xji7s33SI3/3BCO8XLO9Ks8NkXMrjzuenYt+ECTbyq2Ju6OKTGEZKhIv7oFIFwmeOF8Ljlr4bl0DZp8ipuecezbQiAtxriRERsityTpwoxfa0P3gUDwxOzl7VX6BFfH/YyAUBd11xve9pyB0qrJZ4NxTPWyN6xhKcKtRNU7wMzr8p3u9S6E3MEtWtDv0rkFhWMYLKVeObzjKVAAY9dmd0fVugd1SPEnrPiFzZM14Sfhptvg/sD1xCbDam6/84c+tXNRzROh8NZDLCM0zHZ7GoalO+BEQ/A2G826Hp36n46LOdpV73Db79BLKTlOW2riw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q8LfJkXWTjfPHQnmR9BefMkw0mZNiAm7494xopEYy/I=;
 b=AlzJEy5GDtmZ4cuehP/cttZdie97qbYEkYu4462f6poEj2OKMC5GZjkKkZ4SulRy3Wid+YfK+glGAdNcL8ud5yO//Yd4cwRO9fDnlspcmC2NSp94b/VAWsqDDnVUNuFPqKX4WTLJnXf0lE8tQVSA5BChIdzgMgAgf1McFrENDf4=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KL1PR03MB7901.apcprd03.prod.outlook.com (2603:1096:820:f2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.16; Fri, 14 Feb
 2025 05:16:20 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8422.015; Fri, 14 Feb 2025
 05:16:20 +0000
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
Subject: Re: [PATCH v6 40/42] drm/mediatek: mtk_hdmi_common: Add var to enable
 interlaced modes
Thread-Topic: [PATCH v6 40/42] drm/mediatek: mtk_hdmi_common: Add var to
 enable interlaced modes
Thread-Index: AQHbfHk0osMQ8A2mmkmQ4apvyYRlqbNGRjcA
Date: Fri, 14 Feb 2025 05:16:20 +0000
Message-ID: <591e2ca666dbb382679ecf7c91b2a3d0981af221.camel@mediatek.com>
References: <20250211113409.1517534-1-angelogioacchino.delregno@collabora.com>
 <20250211113409.1517534-41-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250211113409.1517534-41-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KL1PR03MB7901:EE_
x-ms-office365-filtering-correlation-id: dd849a2c-409b-4c28-dc34-08dd4cb6b7b5
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?RW15dWZMWjQ1VXl2OGxOamFiUW50VXFDREVQZ1BEMzJYUGZ2NHJDTjBzcVE2?=
 =?utf-8?B?amxoNStMVTJlUzFaa05wRlJrWWk4NWEzWkRrVjI1WXRLenBETlhjRG1EblBE?=
 =?utf-8?B?ZnR0Ris5NU1EM1hCQkRoVUJXQXFRRThRdFdlRU5oT1BGRXNYV3IyZitCaVpr?=
 =?utf-8?B?WDIrbnZCdUErTk5pVGpQQXZFQWl3VkdpY0RBWVE3TEUzSXcydG5qZCthMnZn?=
 =?utf-8?B?N3cwVkl3MGJjVytRRUhjTkdTcjVGTmVaRS8wYkNqQTRDSEhTTVRZS0VERXVF?=
 =?utf-8?B?MTJBeVAvbHJETlVna0pLbXh4SDAwakpCU25zS3BHWTd6SDV4WVExamNSM3FS?=
 =?utf-8?B?emFmS2o1Z25GZURWb2xRUmw3azFKT0Z3MGJEWUdWSzkyRWlRcFprOUhpbElO?=
 =?utf-8?B?dGlJcG1QK3JIS1N6VHlrVm9XWHc5c1FESzVrM2piOGV2bVkzanlibHFpd1Vk?=
 =?utf-8?B?TjZtM2p6Qkkwck4yZ2k0MFNySTZsMXJ4aCtRRzhqdzc0amUvQ3dVdFZTdGF1?=
 =?utf-8?B?MUorMWdSWnprK1hFb3ovU25UZGlMUndXTVdXUzQyTklDamFyWm9YbXRXWi92?=
 =?utf-8?B?SmdPdElUK3YxTGlVWm43ZDVNVFNXMSt4MTlFZ2E5RVJxYlFEUXAzaCtlV3F5?=
 =?utf-8?B?cHUrZlliMUJpTDlkV2p2N2pYODNQWk1rTkRLNnV6VmcxaFdaQlRVNTB4RXNa?=
 =?utf-8?B?NWtNN1ZPcHpDSkZqTElKRlpUMFFLc0tJS2p0VERqZklNaFdldXloT25jNVVm?=
 =?utf-8?B?WTBBTHhwRzltajdURHo2YzV2c3dxTjdxOXpBTFJPZWpubmRDMXBuTElBcVhw?=
 =?utf-8?B?RDdMRW1BNnBWSmpJYzdIVWo2Nk0wcklGZVNHTXYwQVQwTG1VTWNmQWZyMDVU?=
 =?utf-8?B?bEUrbkg0a0NJYlRYV2h6MHBLbGlPcDJMakhQMUs4bmlKNGpHcDZ3VVNMcjFv?=
 =?utf-8?B?YjF6bEhYdWVzRjlwWGdqWjd4NlM3YTBVTGFHa3NrV2tuZTUxUjZmcndmRzN6?=
 =?utf-8?B?VkRETlNUcVROZW5QTjk4akU1eVBNYklCcU1GZFY1WExucFMwRHEzdWdzL1A4?=
 =?utf-8?B?eERKaCtlNDJJekdnWEpqMUtzUGxta0dwWFQwai84MGJiWEtXTEZSVFBQV0x1?=
 =?utf-8?B?cW1mRWNGWVd4eStaanZGTHgzRmtQNDI5aXFjaVBBZE41T2RhN2YwdSs4aGhB?=
 =?utf-8?B?OUVtTnhvd0VWbWtNeExxbEYyQU13ZHJXYmpVZS9JUEJ2SXpaM1cvMWlxMm1G?=
 =?utf-8?B?QjdqVDFjb0RFM0VQZ3FRb2Y0YndiWTNGdlRqQlMwaExMSVVsUHFzcWMzaWZB?=
 =?utf-8?B?OVVUWVBkVzVUcnZkaDNIM2E0WVVScVk1MHYwZHA0RHUwZWFCemxzeVBCUi9y?=
 =?utf-8?B?L2hzc1JmR0tsZHJqMkhlYkxBQmptWUhsTnlmS2dFQTFXUjZiZTExTHhTcDEz?=
 =?utf-8?B?WFZPU0MvcXJlaFMySTJra3cyMUpKcy9JYnNLOEZvOVl1NWVGeTI3eTRwU3JG?=
 =?utf-8?B?Mk54R0x5dS9tbHJFMDJZcjRCbXJ6bSs0U01qQ0J1TllLUUdDQ1JiV3dyRm40?=
 =?utf-8?B?cVRyVlJJbi9PR2s0R3BFcmpRaTNWQ2J4enVoWDh6ZkFHS2dNQWdJbHpJZk1s?=
 =?utf-8?B?WmVUSkZzOUQ0eTFFaTBsaFBBcUNHQ2kvZ0Zxc1Y0bTFXN3ZZMWxJaVVnbXZU?=
 =?utf-8?B?QkJiN2lJcGlnd1czaTNJV3c0Z0hNQlJsUGMrR0c1VDd0RHF1T1V1aU1ZejNa?=
 =?utf-8?B?YUFmVGl2ODZJdnEwRXB2RS9jb2hXdEtlaktFWXU2ZzhTMWFZSFBSYUVIMHA1?=
 =?utf-8?B?SDBwRHl4RHNzVllGMVM1eHhqZVNCSzBVUVdTd05wcUZpek5aeDRHR2tmRi9k?=
 =?utf-8?B?UlhaK2o0VXMxdlg3a2Q4d1JucnNDTysySXJVYU0zVHVGOFRjTjZhUG9UYXlw?=
 =?utf-8?Q?z0v4cvBapeVj52Z+RzSdrTEknS1QxjvX?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MDF0V1B5ZW5tYmdSY1QrRjRvbWNQbmg5dHlDaGdNZHo0YkJ2bGtSZjdGRjdT?=
 =?utf-8?B?cmdQNXhRTXJqbkFVQ1hidGJtZDh1bUVMR0pWM1VFK2lHUG9iVk13VTlhRFBs?=
 =?utf-8?B?SG9ZbStNbENzYjB1SDNIMGZnaGpNTkVzVnlSL21CQVR0QjBSMUc3N0Rod0Z0?=
 =?utf-8?B?engyMXRFNm5welVuZ25yTFFKRFRuajc5UlVyelNJd28zT3dHMTB1RUVWcW5a?=
 =?utf-8?B?ei9GTGg1N01UTzczM3V2ZlBSbzZHMEdKUEcwTnlJc2R3dnNKK0VsNURpUDZq?=
 =?utf-8?B?emNZVnRFU3FFYW5SOFZ5MEMwVHMwUWIxUXR2MnFwZ3RMMFR4Vnl3UkUyVDEw?=
 =?utf-8?B?c09NeFN6TFJMRGl0aElpWXNaN2F2ODlHZU5GN1dTWVdSUngvUkRZQ3pvdjdR?=
 =?utf-8?B?UUZ4RWVDbXdITHZrMmc3RFlrWERlanM4Q3lYdlB3Z0pRUU5QbXlBWllRaVZv?=
 =?utf-8?B?STNQZldxTERQTE4ycVVqdzE0ZndUSW91TStsL3BmSTRqL1A1NnN1M1NFdDQ2?=
 =?utf-8?B?MUliY1dBdDR0RVNZcGoybEpHTE9YWmpzZ0xLanErQVRhN0kzOXA4OTN0UjRO?=
 =?utf-8?B?bzZGL1haQVhxLytTZzVSR1RvR1hqeG9FV0t3K0MrZkhjQkUwTXV0dEtPNUNm?=
 =?utf-8?B?ck85cE54a1hrN2tqYWtSakIxL3drdVYzOUgydkpUZGpNQmo4OWFPdmlSaWFQ?=
 =?utf-8?B?TjVQV0xUTndvNlFFZWxPdlJOVmVBVTRKVEdrajhrNHBZRmxXWjMrMmE3SnVJ?=
 =?utf-8?B?bXFzUkZ6UWQ2Z0F4b01tZTZzNkN2ckgzcHVNaUVtVVN5Slcwcml5WjY3azY3?=
 =?utf-8?B?eS9tRDBvM0xGSytLaVZGaDk5OXpkRFYwWFJ0MjdqaksxcGhraGFDbEsyUTkv?=
 =?utf-8?B?cjVib3ZESUVIVEdrTDBKbnZvTncyTHU2cHZjRmMxYUp3bk1McWM1ZUd3eTVK?=
 =?utf-8?B?RUxYbVZPMzBUZ1FTNTRhYzI0bi9hTGNOQVNCanN6MXJvaWNyRWZ0VTdzQ3Ev?=
 =?utf-8?B?MjQ1WEMzQjRSTFJDVHF0OHJxblBjYjY0RHg3MTdMamdXS1VRQTNGemJuSFdn?=
 =?utf-8?B?a0o5SVQ2dTlCTjV3UHJIWE5RZE5vSjQzNE04TDZtb25SQ0IwZm1VUE5la3gw?=
 =?utf-8?B?OHBTUGVRWFdEenNycFRqS1FKdDhUU3l5TjQ5Y3NSWnJuZW5HMzllc1RkTit4?=
 =?utf-8?B?M3lUakJSbkpCdnpveFc2MVRNQ2xZa0tjSXk1MkFGNW1HMkhlV3VXSHh0L2Fi?=
 =?utf-8?B?aFd5cW9xOFpLVVFGT1hJUTJnbWI5b0JXS0wrQm5kWXE3cUZRQmJwMVdtUEtW?=
 =?utf-8?B?ZHVkNVBPTERDTTF2cVFwaHo2MzNXSllzc0J4NWhDL0VxdFJGV2ZOQzNVazZv?=
 =?utf-8?B?TUJiU1h4bmZRSlYwc3VCazRuY0xHL3ZjU3dqNGtOTEpad214OHlMYWlJNzQw?=
 =?utf-8?B?ZEo0Wk5aL0JQL21lUE1CaU51NEV5SzU4cjRFZ3VFWGFUMDZGbVU2ZzMxMHRt?=
 =?utf-8?B?MDB2dk9zNWRLMHhJRTBhSkQ2V1lINEhzNjhvYkQrZ09nWHRXVkFnSXhZSWFJ?=
 =?utf-8?B?K2k2VkVmMXJoZnJPdHV5VjF2NjgwRFZIVmx5a0F4eW4zZXZlb0g2SEhiUWRx?=
 =?utf-8?B?SHdmd0syM25RK0lhUHFSbllaSC85akZ3YUVTMnpzcjU1aWROWThiVGZucGlP?=
 =?utf-8?B?cy9nNHF6SlBQbzJKQ0QvVHhuTS9wanFmb2tjY1Yxd2lCNS9WV3FPTFZnZU03?=
 =?utf-8?B?dWJ6bkxXcW1iZGI5NGtTbVNSZlhuS1Rzck8va2R2c2dIYmR1WDBQTmx6Q0F5?=
 =?utf-8?B?VEhFN1E1ZUIvcDNNZm9pR04vOC9nY0psMGtXVmlQTm1sZ21Pc0t5S3dCV1Y1?=
 =?utf-8?B?akw5Y0l4Q1hyMDhhN3dTNHp6dnMxVUpEK05STE5Hdi8rV0R4bktrRmRHb2lz?=
 =?utf-8?B?QnVzUW13dTVGQzBETFNaU25EYUpDYjRzLzVqWFhyYkFISkk0bnp0T1RGMkNQ?=
 =?utf-8?B?ckJ3UlNST0JTYTdKUjhhRHQ0OUpINzUyYXFrd201SFJaZjNjUmhFOTdqMHB5?=
 =?utf-8?B?ck1MdnRqWFY3YVQwSkRzdTFjemNmMjBuOEpVNmF6TE85czFEZWdZOWdvY1JQ?=
 =?utf-8?Q?9yqqZu6+V/iOo6Zol3G12s9Yv?=
Content-ID: <DD294B57DB037D439F1D19DE364FBE9E@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd849a2c-409b-4c28-dc34-08dd4cb6b7b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2025 05:16:20.6183 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YT9T1dpaypQ6hWrfkclbHXhtVePN4P/CLlNxAvBzldWm0dT9OHuuJg4z1L9NUPWNdB0mAKhEB0GlFhB2qciZKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7901
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_001_858058801.515579282"
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

--__=_Part_Boundary_001_858058801.515579282
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDI1LTAyLTExIGF0IDEyOjM0ICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBv
ciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBBZGQgYW4gaW50ZXJsYWNlX2FsbG93ZWQgYm9vbCBt
ZW1iZXIgdG8gc3RydWN0IG10a19oZG1pX3Zlcl9jb25mDQo+IHdoaWNoIHdpbGwgYmUgdXNlZCB0
byBzaWduYWwgd2hldGhlciBpbnRlcmxhY2VkIG1vZGVzIGFyZSBzdXBwb3J0ZWQNCj4gYnkgdGhl
IGJyaWRnZSAoaW4gb3VyIGNhc2UsIHRoZSBIRE1JIElQKSwgYW5kIGVuYWJsZSBpdCBmb3IgSERN
SXYyLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFu
Z2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWlfY29tbW9uLmMgfCAxICsNCj4gIGRyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfaGRtaV9jb21tb24uaCB8IDEgKw0KPiAgZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19oZG1pX3YyLmMgICAgIHwgMSArDQo+ICAzIGZpbGVzIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfaGRtaV9jb21tb24uYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaV9j
b21tb24uYw0KPiBpbmRleCAyZjJlNzdiNjY0YTIuLjc1MGJjYjQ1YzMzZCAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pX2NvbW1vbi5jDQo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaV9jb21tb24uYw0KPiBAQCAtNDI5LDYgKzQy
OSw3IEBAIHN0cnVjdCBtdGtfaGRtaSAqbXRrX2hkbWlfY29tbW9uX3Byb2JlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICAgICAgICAgaGRtaS0+YnJpZGdlLmRkYyA9IGhkbWktPmRk
Y19hZHB0Ow0KPiAgICAgICAgIGhkbWktPmJyaWRnZS52ZW5kb3IgPSAiTWVkaWFUZWsiOw0KPiAg
ICAgICAgIGhkbWktPmJyaWRnZS5wcm9kdWN0ID0gIk9uLUNoaXAgSERNSSI7DQo+ICsgICAgICAg
aGRtaS0+YnJpZGdlLmludGVybGFjZV9hbGxvd2VkID0gdmVyX2NvbmYtPmludGVybGFjZV9hbGxv
d2VkOw0KPiANCj4gICAgICAgICByZXQgPSBkZXZtX2RybV9icmlkZ2VfYWRkKGRldiwgJmhkbWkt
PmJyaWRnZSk7DQo+ICAgICAgICAgaWYgKHJldCkNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfaGRtaV9jb21tb24uaCBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfaGRtaV9jb21tb24uaA0KPiBpbmRleCBlNzRmZTEzNzEzMjQuLmRlNWUwNjQ1ODVmOCAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pX2NvbW1vbi5o
DQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaV9jb21tb24uaA0KPiBA
QCAtMTM3LDYgKzEzNyw3IEBAIHN0cnVjdCBtdGtfaGRtaV92ZXJfY29uZiB7DQo+ICAgICAgICAg
Y29uc3Qgc3RydWN0IGhkbWlfY29kZWNfb3BzICpjb2RlY19vcHM7DQo+ICAgICAgICAgY29uc3Qg
Y2hhciAqIGNvbnN0ICptdGtfaGRtaV9jbG9ja19uYW1lczsNCj4gICAgICAgICBpbnQgbnVtX2Ns
b2NrczsNCj4gKyAgICAgICBib29sIGludGVybGFjZV9hbGxvd2VkOw0KPiAgfTsNCj4gDQo+ICBz
dHJ1Y3QgbXRrX2hkbWlfY29uZiB7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2hkbWlfdjIuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaV92
Mi5jDQo+IGluZGV4IDMzOGE2ZGRhMmZkMi4uMzZiN2Y4ZDhkMjE4IDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWlfdjIuYw0KPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWlfdjIuYw0KPiBAQCAtMTI5Miw2ICsxMjkyLDcgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBtdGtfaGRtaV92ZXJfY29uZiBtdGtfaGRtaV9jb25mX3YyID0gew0K
PiAgICAgICAgIC5jb2RlY19vcHMgPSAmbXRrX2hkbWlfdjJfYXVkaW9fY29kZWNfb3BzLA0KPiAg
ICAgICAgIC5tdGtfaGRtaV9jbG9ja19uYW1lcyA9IG10a19oZG1pX3YyX2Nsa19uYW1lcywNCj4g
ICAgICAgICAubnVtX2Nsb2NrcyA9IE1US19IRE1JX1YyX0NMS19DT1VOVCwNCj4gKyAgICAgICAu
aW50ZXJsYWNlX2FsbG93ZWQgPSB0cnVlLA0KDQpNb3ZlIHRoaXMgcGF0Y2ggYmVmb3JlIEhETUkg
djIgcGF0Y2guDQpBbmQgbGV0IHRoaXMgbGluZSB0byBiZSBpbiBIRE1JIHYyIHBhdGNoLg0KQWZ0
ZXIgdGhpcywNCg0KUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+DQoNCj4g
IH07DQo+IA0KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfaGRtaV9jb25mIG10a19oZG1pX2Nv
bmZfbXQ4MTg4ID0gew0KPiAtLQ0KPiAyLjQ4LjENCj4gDQoNCg==

--__=_Part_Boundary_001_858058801.515579282
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1R1ZSwmIzMyOzIwMjUtMDItMTEmIzMyO2F0
JiMzMjsxMjozNCYjMzI7KzAxMDAsJiMzMjtBbmdlbG9HaW9hY2NoaW5vJiMzMjtEZWwmIzMyO1Jl
Z25vJiMzMjt3cm90ZToNCiZndDsmIzMyO0V4dGVybmFsJiMzMjtlbWFpbCYjMzI7OiYjMzI7UGxl
YXNlJiMzMjtkbyYjMzI7bm90JiMzMjtjbGljayYjMzI7bGlua3MmIzMyO29yJiMzMjtvcGVuJiMz
MjthdHRhY2htZW50cyYjMzI7dW50aWwmIzMyO3lvdSYjMzI7aGF2ZSYjMzI7dmVyaWZpZWQmIzMy
O3RoZSYjMzI7c2VuZGVyJiMzMjtvciYjMzI7dGhlJiMzMjtjb250ZW50Lg0KJmd0OyYjMzI7DQom
Z3Q7JiMzMjsNCiZndDsmIzMyO0FkZCYjMzI7YW4mIzMyO2ludGVybGFjZV9hbGxvd2VkJiMzMjti
b29sJiMzMjttZW1iZXImIzMyO3RvJiMzMjtzdHJ1Y3QmIzMyO210a19oZG1pX3Zlcl9jb25mDQom
Z3Q7JiMzMjt3aGljaCYjMzI7d2lsbCYjMzI7YmUmIzMyO3VzZWQmIzMyO3RvJiMzMjtzaWduYWwm
IzMyO3doZXRoZXImIzMyO2ludGVybGFjZWQmIzMyO21vZGVzJiMzMjthcmUmIzMyO3N1cHBvcnRl
ZA0KJmd0OyYjMzI7YnkmIzMyO3RoZSYjMzI7YnJpZGdlJiMzMjsoaW4mIzMyO291ciYjMzI7Y2Fz
ZSwmIzMyO3RoZSYjMzI7SERNSSYjMzI7SVApLCYjMzI7YW5kJiMzMjtlbmFibGUmIzMyO2l0JiMz
Mjtmb3ImIzMyO0hETUl2Mi4NCiZndDsmIzMyOw0KJmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMy
O0FuZ2Vsb0dpb2FjY2hpbm8mIzMyO0RlbCYjMzI7UmVnbm8mIzMyOyZsdDthbmdlbG9naW9hY2No
aW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20mZ3Q7DQomZ3Q7JiMzMjstLS0NCiZndDsmIzMyOyYj
MzI7ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pX2NvbW1vbi5jJiMzMjt8JiMzMjsx
JiMzMjsrDQomZ3Q7JiMzMjsmIzMyO2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaV9j
b21tb24uaCYjMzI7fCYjMzI7MSYjMzI7Kw0KJmd0OyYjMzI7JiMzMjtkcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2hkbWlfdjIuYyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjt8JiMzMjsxJiMz
MjsrDQomZ3Q7JiMzMjsmIzMyOzMmIzMyO2ZpbGVzJiMzMjtjaGFuZ2VkLCYjMzI7MyYjMzI7aW5z
ZXJ0aW9ucygrKQ0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtkaWZmJiMzMjstLWdpdCYjMzI7YS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWlfY29tbW9uLmMmIzMyO2IvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19oZG1pX2NvbW1vbi5jDQomZ3Q7JiMzMjtpbmRleCYjMzI7MmYyZTc3
YjY2NGEyLi43NTBiY2I0NWMzM2QmIzMyOzEwMDY0NA0KJmd0OyYjMzI7LS0tJiMzMjthL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaV9jb21tb24uYw0KJmd0OyYjMzI7KysrJiMzMjti
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaV9jb21tb24uYw0KJmd0OyYjMzI7QEAm
IzMyOy00MjksNiYjMzI7KzQyOSw3JiMzMjtAQCYjMzI7c3RydWN0JiMzMjttdGtfaGRtaSYjMzI7
Km10a19oZG1pX2NvbW1vbl9wcm9iZShzdHJ1Y3QmIzMyO3BsYXRmb3JtX2RldmljZSYjMzI7KnBk
ZXYpDQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7aGRt
aS0mZ3Q7YnJpZGdlLmRkYyYjMzI7PSYjMzI7aGRtaS0mZ3Q7ZGRjX2FkcHQ7DQomZ3Q7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7aGRtaS0mZ3Q7YnJpZGdlLnZl
bmRvciYjMzI7PSYjMzI7JnF1b3Q7TWVkaWFUZWsmcXVvdDs7DQomZ3Q7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7aGRtaS0mZ3Q7YnJpZGdlLnByb2R1Y3QmIzMy
Oz0mIzMyOyZxdW90O09uLUNoaXAmIzMyO0hETUkmcXVvdDs7DQomZ3Q7JiMzMjsrJiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtoZG1pLSZndDticmlkZ2UuaW50ZXJsYWNlX2FsbG93
ZWQmIzMyOz0mIzMyO3Zlcl9jb25mLSZndDtpbnRlcmxhY2VfYWxsb3dlZDsNCiZndDsmIzMyOw0K
Jmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3JldCYjMzI7
PSYjMzI7ZGV2bV9kcm1fYnJpZGdlX2FkZChkZXYsJiMzMjsmYW1wO2hkbWktJmd0O2JyaWRnZSk7
DQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7aWYmIzMy
OyhyZXQpDQomZ3Q7JiMzMjtkaWZmJiMzMjstLWdpdCYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2hkbWlfY29tbW9uLmgmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19oZG1pX2NvbW1vbi5oDQomZ3Q7JiMzMjtpbmRleCYjMzI7ZTc0ZmUxMzcxMzI0Li5kZTVlMDY0
NTg1ZjgmIzMyOzEwMDY0NA0KJmd0OyYjMzI7LS0tJiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfaGRtaV9jb21tb24uaA0KJmd0OyYjMzI7KysrJiMzMjtiL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfaGRtaV9jb21tb24uaA0KJmd0OyYjMzI7QEAmIzMyOy0xMzcsNiYjMzI7
KzEzNyw3JiMzMjtAQCYjMzI7c3RydWN0JiMzMjttdGtfaGRtaV92ZXJfY29uZiYjMzI7ew0KJmd0
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO2NvbnN0JiMzMjtz
dHJ1Y3QmIzMyO2hkbWlfY29kZWNfb3BzJiMzMjsqY29kZWNfb3BzOw0KJmd0OyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO2NvbnN0JiMzMjtjaGFyJiMzMjsqJiMz
Mjtjb25zdCYjMzI7Km10a19oZG1pX2Nsb2NrX25hbWVzOw0KJmd0OyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO2ludCYjMzI7bnVtX2Nsb2NrczsNCiZndDsmIzMy
OysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO2Jvb2wmIzMyO2ludGVybGFjZV9h
bGxvd2VkOw0KJmd0OyYjMzI7JiMzMjt9Ow0KJmd0OyYjMzI7DQomZ3Q7JiMzMjsmIzMyO3N0cnVj
dCYjMzI7bXRrX2hkbWlfY29uZiYjMzI7ew0KJmd0OyYjMzI7ZGlmZiYjMzI7LS1naXQmIzMyO2Ev
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pX3YyLmMmIzMyO2IvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19oZG1pX3YyLmMNCiZndDsmIzMyO2luZGV4JiMzMjszMzhhNmRkYTJm
ZDIuLjM2YjdmOGQ4ZDIxOCYjMzI7MTAwNjQ0DQomZ3Q7JiMzMjstLS0mIzMyO2EvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19oZG1pX3YyLmMNCiZndDsmIzMyOysrKyYjMzI7Yi9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWlfdjIuYw0KJmd0OyYjMzI7QEAmIzMyOy0xMjkyLDYm
IzMyOysxMjkyLDcmIzMyO0BAJiMzMjtzdGF0aWMmIzMyO2NvbnN0JiMzMjtzdHJ1Y3QmIzMyO210
a19oZG1pX3Zlcl9jb25mJiMzMjttdGtfaGRtaV9jb25mX3YyJiMzMjs9JiMzMjt7DQomZ3Q7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7LmNvZGVjX29wcyYjMzI7
PSYjMzI7JmFtcDttdGtfaGRtaV92Ml9hdWRpb19jb2RlY19vcHMsDQomZ3Q7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7Lm10a19oZG1pX2Nsb2NrX25hbWVzJiMz
Mjs9JiMzMjttdGtfaGRtaV92Ml9jbGtfbmFtZXMsDQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7Lm51bV9jbG9ja3MmIzMyOz0mIzMyO01US19IRE1JX1Yy
X0NMS19DT1VOVCwNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
Oy5pbnRlcmxhY2VfYWxsb3dlZCYjMzI7PSYjMzI7dHJ1ZSwNCg0KTW92ZSYjMzI7dGhpcyYjMzI7
cGF0Y2gmIzMyO2JlZm9yZSYjMzI7SERNSSYjMzI7djImIzMyO3BhdGNoLg0KQW5kJiMzMjtsZXQm
IzMyO3RoaXMmIzMyO2xpbmUmIzMyO3RvJiMzMjtiZSYjMzI7aW4mIzMyO0hETUkmIzMyO3YyJiMz
MjtwYXRjaC4NCkFmdGVyJiMzMjt0aGlzLA0KDQpSZXZpZXdlZC1ieTomIzMyO0NLJiMzMjtIdSYj
MzI7Jmx0O2NrLmh1QG1lZGlhdGVrLmNvbSZndDsNCg0KJmd0OyYjMzI7JiMzMjt9Ow0KJmd0OyYj
MzI7DQomZ3Q7JiMzMjsmIzMyO3N0YXRpYyYjMzI7Y29uc3QmIzMyO3N0cnVjdCYjMzI7bXRrX2hk
bWlfY29uZiYjMzI7bXRrX2hkbWlfY29uZl9tdDgxODgmIzMyOz0mIzMyO3sNCiZndDsmIzMyOy0t
DQomZ3Q7JiMzMjsyLjQ4LjENCiZndDsmIzMyOw0KDQoNCjwvcHJlPg0KPC9wPjwvYm9keT48L2h0
bWw+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVLIENv
bmZpZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioqKioqKioqKioNClRoZSBpbmZvcm1hdGlv
biBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0dGFj
aG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Ig
b3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4g
SXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJl
Y2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHByaW50
aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cyAN
CmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9o
aWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQg
cmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlIA0KdGhhdCB5b3UgaGF2ZSByZWNl
aXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1t
ZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxs
IGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9t
IHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUt
bWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_001_858058801.515579282--

