Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 842DC9E8D23
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 09:18:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1280810E4AD;
	Mon,  9 Dec 2024 08:18:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="ZxG0v76S";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="BV8Jb3Qp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C96BF10E4AD
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 08:17:58 +0000 (UTC)
X-UUID: 15ff20eab60611ef99858b75a2457dd9-20241209
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=cb0nTwHe+7BuUxXaHaShFByMnJpDHJ1Ujxl2ly9g0iQ=; 
 b=ZxG0v76S/p0KSlpzsLYAe71EErtyYEHSqT2KKvelzsm8nOkUo3SPXU8FnxpsOCMOB81HzwUyyhmeZmBCFLdQRMCGkptt3xovgUf1vPP5okkT3FBUjL33+1P3JL3ypgIJ8uytlF6lLdYDpXbzSbgN63HIpuuvesosCpL1K2E69oA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45, REQID:992c483e-f708-419c-9146-3fdac9ee11bb, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6493067, CLOUDID:2d206d04-b3ca-4202-ba41-09fe265db19f,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
 :-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
 ,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 15ff20eab60611ef99858b75a2457dd9-20241209
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1030421735; Mon, 09 Dec 2024 16:17:52 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 9 Dec 2024 16:17:51 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 9 Dec 2024 16:17:51 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VfEzeoD4oWTZrHnVBj27VOSuJYfr0kTb1oJDYQQAZuaFOgMe5D0UJT9wfLpvyAtekEErY4WbX3IEM4gUEPKNq0eZtz8guXWmJbHEUFm0o+Y4fR5hf0YUgWSsXLNkcWB4NIMhkRIPQPB0JNenJjVc52BkNuG5GOrxhUvzEQlGll7i1UPQICaiPHUiALahcTpa+ZviejIbOTwSBTOUSxSD68vjMS9YMq9NR+VPQUWr+lZ6om7ok7bAn0pst30elZcLPIoUDrXu/UmFyQ/T/A8LpHBWE+zw7jQB8ixLyUoIDacxcjsemp1MKiuSr7gTpk1HUruPRlqVBlStWaULu1S+sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=areaZb7fq3TMkaqnaGgSCG9/6tWpwotDHa8gP4rQjSs=;
 b=ROXqU4lTxrLGwwFkw1ZgRQ43ByF1mxEAVuH7e0DgVJknShLD4s9wcoboCPHsFRrvVK0YSjKWal0NdHYXUPs36wVhwvzdz2KP17AFP9Oo1IUoYPwE2HfehzXVRwvyMvbKqgu2HIffM4E1mylIIn6Px62eWPAI7t8Cr1hJDuAvGa1JeOaND8QGJPD+cxfRPYEl9jAYTSovq4+gf0zA7348Sc50y8ULYIIq8M43xrpNDGFjszTqOI5EpKKtBh3uHO/O0z/JD9/QuIULtdr5P2VsBuSszvtNIwtHdgnJ7Ge6QPuShBxWW31spg8bxPt7RcU7EZqpuyQ0gEU+0VjMEBc5Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=areaZb7fq3TMkaqnaGgSCG9/6tWpwotDHa8gP4rQjSs=;
 b=BV8Jb3Qp0FJSQddroHnIKue6p1qjr37C0IBHNNqNEPi+utRMEN95jGbU3XAq6CJwhMt8ZQrFVbnX2E0uzzLzouFnXy61H+ueo+hhhtaCaIpiJ/E1WqNhHs20koPa6fUVym2cS1josqGnqw6szA7MQt48Xmdruqe4dZ/M5fgdYMc=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB7345.apcprd03.prod.outlook.com (2603:1096:400:421::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.23; Mon, 9 Dec
 2024 08:17:48 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8207.014; Mon, 9 Dec 2024
 08:17:48 +0000
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
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "junzhi.zhao@mediatek.com"
 <junzhi.zhao@mediatek.com>
Subject: Re: [PATCH v2 13/15] drm/mediatek: mtk_hdmi_common: Assign DDC
 adapter pointer to bridge
Thread-Topic: [PATCH v2 13/15] drm/mediatek: mtk_hdmi_common: Assign DDC
 adapter pointer to bridge
Thread-Index: AQHbRwuBmQ11mvBqP0GoaHTxKcH3kLLdl5GA
Date: Mon, 9 Dec 2024 08:17:48 +0000
Message-ID: <c0e144b3a90881066d0974157e66ac23f09a0fc5.camel@mediatek.com>
References: <20241205114518.53527-1-angelogioacchino.delregno@collabora.com>
 <20241205114518.53527-14-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20241205114518.53527-14-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB7345:EE_
x-ms-office365-filtering-correlation-id: 41e05251-4cf5-45ee-e6cd-08dd1829f792
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7416014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?ZVBNMHlaYzYzVDJuQkNBdENTSmgzWDBRbG9rWGJud2V6ekpmUVQxUGN0UXNl?=
 =?utf-8?B?UEMxenM5TWpTZ3pnQllZMWVkL3Mxb0pLbzFOT1M5d0ovTWFiY1NIaTV0cXhH?=
 =?utf-8?B?T0FvdFcrbzlIZzFuTWNNeGlOMG1DY0ZaRjVUWDhXWGhOSmpFVEYyaG9XVFM0?=
 =?utf-8?B?VUt2SzFQYXU4ajJBRW5qZXdJMFp6K1dheXV1UWFIZ3c4QWJmazFNVVRoVk5E?=
 =?utf-8?B?clNtU2R5S0pGdkR6cWtLRnlVcTZSNllsQ0VFWkhwU0dBWnBwYWpaYWRua0dV?=
 =?utf-8?B?VEUvb2tlRGkyQTZtOE1YMzZuUmF4YXZmNUhwRFo5M0pGc01HTEcyMFNsNEtT?=
 =?utf-8?B?eEtGKzE1Tk9HaS9ZSVZ1MnlUNDN5Tk44bzdMVFZJYkVxQUJZenIzeGZwejdI?=
 =?utf-8?B?bFVDOXg5QmN2TnFEdXU0ZFM4eUw4R2R0N2ZjWlhNRkNsNHhjSGMvSE9wZGx0?=
 =?utf-8?B?OWJWYTd2OXNaNDFEMkFnTUp0bjFPekJpaUhmRm9EWUJuUGNNbFBOK1JPYzhU?=
 =?utf-8?B?N3d2SGE0TGx6SVdZcGQyM3hRTEVuOStlSkFUa2RhbUM3OG1ac2NZRVUxTElh?=
 =?utf-8?B?ODEyTUphTjZON2dCWVlUc3Q0ZWR3LzBYMTNqTDFsLzRTZHR5QlBtRHh1aFA0?=
 =?utf-8?B?VUdreWJtUGR5T21vdTA5eFZYSllzWGI0THRPMU9aWmV2UHNhSmNRYVloVDN5?=
 =?utf-8?B?aHo1STM3bHB1QmtPeTIvYVFueEI1L0pqODcvZ0JsOU1KMkxWNkZyRFVCYU1I?=
 =?utf-8?B?WDcxL0wwWG52N2Z0b29NamlxUktMNUEyQjgxYmxLNWtqV0Z6MDhRL1EyY2xj?=
 =?utf-8?B?cis3UHVMWFltSStLSE5lWEVQb041cTNHNDRYZjNOa240NXQwbFBsd1pLWjFl?=
 =?utf-8?B?K0w4bHZBYlVEQ1puR3lrVlVjbWdBWWRXSkxjZnBvRGNTTGxRa1I4aUw3L2Q0?=
 =?utf-8?B?czIzTlkvWlYzSDh1a2xRRER5ZG1XRnVwVlp3Z0I0eDlrZ0NEcURwNVJOSzJT?=
 =?utf-8?B?dUV1NHZNNGh5UlREQ3dmZUxsSWh5dFcwd1JMczRuR0NUYmM1ZjJhRGJYRHY2?=
 =?utf-8?B?OUtmb1FNbXArUGh0Q1hZUzgrK2RlWk5yS2dTajUvOWpoT1NQVE15ODlETTdM?=
 =?utf-8?B?a0krS3ZMNkxoQllvZm5PZ2pqTTlQKy9YNzI5L3hiRExhcHd6YzIvVThWN25X?=
 =?utf-8?B?V1JOVHFNSi9mdTAyNUtHWEdpVW1QRC9lSW5aaml5ekdod1BxRGl5UlRESWJq?=
 =?utf-8?B?bjMzdzcxR3Rhekx6NUpYb2phbDJ2Z1VXMEhPaTVxVEhVdWZhN3JYYlYzZTg3?=
 =?utf-8?B?QjNiVHpqR1N6Qzc4b0ZmSGY1SU9xQ3lFRjdsUzVLZmt6ZUMxQW04eE0wbld5?=
 =?utf-8?B?ZENsTlE2anFRY2Y0cEdXdEkwVmt1NjQ4Y1JyT1JkY2VXTzdCTmY0Qk1rWWZ5?=
 =?utf-8?B?SC9wUWh0YU9WR0IyZ2kvZDYrMWplc0hWbnM5MFMzQU4zcGEyRnpkSy9mSy9J?=
 =?utf-8?B?L0NVTnBvbkw5em1LeEt3ZmxjeEx5VFdLeWFXVW15WHNXV0lvNHJSNE05bFhw?=
 =?utf-8?B?UjBhdy9iQVhrUVJGSDYvQlJ2anNHRzdRempNakRZd1NqdVJmUTJPMGdzNHkw?=
 =?utf-8?B?TXc5U2o3RDNVbk5TbWhDQkhkaDA3MUsvb203akpuZUg3RjlKZkpkWHM5a2Ir?=
 =?utf-8?B?c1owRTBGeXYzNE82enV5bWlKRVZ6TXFqa1paV09DV1dEcDRDOEc5dmhjMVpm?=
 =?utf-8?B?bXo0VTJBeDJRaDU2KzVOdlBEZTlBUDExT1pTMWJKT1lRYWhwcldWMEwxRTE0?=
 =?utf-8?B?NndHdmJINTVYQnloejlQRHNDWnQrKzN3L2sxdmxYNGVFWjgzc1hBandrR0NR?=
 =?utf-8?B?dCtuYjVIVmxIRllpRk4wVmFneE1tMUxLMHduZjdzSUhPVEE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cHl3M3l4QjRjTmVreGd4aUUwTm9yNlVpVlpaV3MxTFptVHdZOEh6NTAwcXJP?=
 =?utf-8?B?V0d6aC9lS2ZBZW8yU0hSTXg4WEgxYU1wNldpRjJaclhPM2FRVWJuRDVQYmZ4?=
 =?utf-8?B?eUJVVlZtL1lqL2szSG96NmZVY1FCcnlHWC95azFSa1FoVHFnNm9uazkwTHJD?=
 =?utf-8?B?cS9SYS90ZytKSXEyVG0wVk5zR1RtVWlkVWFqZ2x3Ri9YTWV1bXliTi80M21l?=
 =?utf-8?B?L3BWQjEwSDdPSUtjV3MrUXplalo3STFKU0NGeU1sc3ZyMFB6MERJRGpGaWJ6?=
 =?utf-8?B?N0t0dHd0MElYN2VxeFI4SWphaTU5empQWTZyLzFZV21ScEpVQ3I3cU1UV0h2?=
 =?utf-8?B?SlZRUGZCRzV5NGFXZVJuOURyTVE1ZUtJeUtmV2FROThOYS9sYkxlcEY4MVdE?=
 =?utf-8?B?VGlrK2ZMZTg1bFEwVU5GR0x5aWhKa0dTNnFYWEhIcVplUGxncjZGdzl1ejhY?=
 =?utf-8?B?eW9kRmRsTTRYTlJTMEp4dEtHblZHYjJaRTBRdTgyZjlkYU1KUDFrWGdBK1RP?=
 =?utf-8?B?SCtvVFNFaE5qUjhUQTJEZUdMRXRvUkZ6cG93N3RiTC9vdC9CYm90Rk1UWkNS?=
 =?utf-8?B?emVIOXMzNEZsTG1qZFlRRTZFQmlWa2NJd3AzaHBSbnN5UG1Va0hDNHF2MDdn?=
 =?utf-8?B?YzFnMFlKbWZzcnREQ2dwdHNHOEQ1STRTK1lNVDB6RHhkRmEwd2QrQTllbXpN?=
 =?utf-8?B?ZjJKWVM2ck94ZTFBY1ZJWEFRb1ExL3lBY2hwNHNRSlM3YWp2OURCNitmeUND?=
 =?utf-8?B?cmpNNWptVXVzNmlHb1JhRmlqWWVqdkw4NDY0WjI5Y05nUXdrRDZDcUZ3MWZt?=
 =?utf-8?B?UHBZQ3hOV2pmcTdiWVlRUGFCcW1EUHV6MldwNzJwWjBvWlMwQWxpWWJNL3Zz?=
 =?utf-8?B?UVlqT2lERUVyZUNQQ0p5OGZ2WjdEWHRLQWl2WnRseFRKSHdiWWhDNmwyeXJW?=
 =?utf-8?B?S2w0WGp1cjB5L2dRQUpYN2FZWHF0QnNlM21vSlo2OExOeTV4Z1lrTGxuSC9D?=
 =?utf-8?B?Vm5oWXU0VTdIVXZMeGJNazhxZlFEcjg4M21WWDAwcEVoVVpLYjFrc0pkS0tB?=
 =?utf-8?B?aGM3UzlNR1pNVlpnZlk5UUhHNkt1T0ZSSEM5L3kzMmYwWkZvMlNhaGZyL3hQ?=
 =?utf-8?B?K284SnBodm5NRlU3NU9peVJibk5jSDdHWkcycWZMeGhYL3A4S290MVQ5WWw2?=
 =?utf-8?B?YzRiNUk0dGtQTlVwSXNscmpWeDBVN3JkSWVMam4wL1dzQVNoOVhrdU5xQ1U2?=
 =?utf-8?B?eXViR3BtVllKejlRWEtJaHE0V0xDOUJPMzBUZzcyUXhGNTFnWmVpZGRQaHpl?=
 =?utf-8?B?dFl2cU90WWtMazVxU1Q1L0Vvamx2K1ZSUVZXanBzbnFXODQvTHZSVVd0dnVD?=
 =?utf-8?B?Zno3ODkvbGdkSjZ5MVFLc2RYQmROaVppZ1JLYlR4OVpWS0M0RHo5b3pxSnRP?=
 =?utf-8?B?ZjVqK2twak4vZDBJcVk5dWZJUERwMndHU2VvZy8vWHB6Wnk0L0o5NWpRbWZx?=
 =?utf-8?B?RlVFWTk0eGtMcHJsQVhoYmhxQkN4MW56WnZRMEVNMEZCdE5iNzZscW1FR3NX?=
 =?utf-8?B?WXZFR2dBbWN2TWZXZHcvMHozclZleUFMWlBKd0RCRHd4dkcxOXpPaCtUVWw5?=
 =?utf-8?B?RlVobDdpUUE4RGtPRU9ZQmErVDNsWWhFRU5rQzE0S2dZdnRUSlg3NmhyMGw4?=
 =?utf-8?B?NXNBbnJUdllER3pKZnhCUUI5UXJsZVExWXpmNFJTRngrQVR1ckZDWThBRkZJ?=
 =?utf-8?B?WExhQjBNczRZTVpmam5oRTJlVkZsU2N1V0dzYWdkRW5oTEhtRHRuRUxOQ0dL?=
 =?utf-8?B?VzVqK3FDdnk1NEZjOGFzanE3RlpmWm50VkU5Y0N0eks1NEk5dmUzSlFmSUY3?=
 =?utf-8?B?K0Zhb3QwOGNQdHBTNTR6SnNoUEJZRVR2dW9scVJHY3RpUmhyUTZpSzZFaGIw?=
 =?utf-8?B?aysrS0IwRlZ2anQ3VDNsRmtNeGJWNUV6cVZLN0dKYnUzcSsxczRuT1psTFZv?=
 =?utf-8?B?ZGxjald6aFhMRVlDbHFWdEljYWF6QnFGVVZCd3ptT3d6UmFXYkZvL0tFQjZU?=
 =?utf-8?B?emlDdlJ6dUExa016N05CblNwMGsxcFFoemVWS2h3SHpTNkdKMTd0TEtMeHFO?=
 =?utf-8?B?TnlyZGRrVUFLM0UrTnNUZStvblJlL1pSMmh4bjNOTGdZMWRjaHRMeHBoOE52?=
 =?utf-8?B?VWc9PQ==?=
Content-ID: <03F504DC72DBD6439C9FF8A3BBB04C29@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41e05251-4cf5-45ee-e6cd-08dd1829f792
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2024 08:17:48.2782 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RyF5PAV0larYD8w/3fxI11i8EkHd+m3cCZZYwBJdx/pK1Ji9gY3CwE0K3pJ7Fs4af6fJ5KPFaBTouecB2zpyIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7345
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_009_545054544.2006239177"
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

--__=_Part_Boundary_009_545054544.2006239177
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEFuZ2VsbzoNCg0KT24gVGh1LCAyMDI0LTEyLTA1IGF0IDEyOjQ1ICswMTAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZp
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBJbiBwcmVwYXJhdGlvbiBm
b3IgYWRkaW5nIHRoZSBuZXcgSERNSSBUWCB2MiBJUCBkcml2ZXIsIGFzc2lnbiB0aGUNCj4gcG9p
bnRlciB0byB0aGUgRERDIGFkYXB0ZXIgdG8gc3RydWN0IGRybV9icmlkZ2UgZHVyaW5nIHByb2Jl
Lg0KPiANCj4gVGhpcyBjb21taXQgYnJpbmdzIG5vIGZ1bmN0aW9uYWwgY2hhbmdlcy4NCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2No
aW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19oZG1pX2NvbW1vbi5jIHwgMSArDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2hkbWlfY29tbW9uLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWlfY29tbW9u
LmMNCj4gaW5kZXggMWIyM2FiNjk2OWVjLi40ZjcwOGIwNGY1ZTggMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaV9jb21tb24uYw0KPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWlfY29tbW9uLmMNCj4gQEAgLTQxMCw2ICs0MTAsNyBA
QCBzdHJ1Y3QgbXRrX2hkbWkgKm10a19oZG1pX2NvbW1vbl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQ0KPiAgICAgICAgIGhkbWktPmJyaWRnZS5vcHMgPSBEUk1fQlJJREdFX09Q
X0RFVEVDVCB8IERSTV9CUklER0VfT1BfRURJRCB8IERSTV9CUklER0VfT1BfSFBEOw0KPiAgICAg
ICAgIGhkbWktPmJyaWRnZS50eXBlID0gRFJNX01PREVfQ09OTkVDVE9SX0hETUlBOw0KPiAgICAg
ICAgIGhkbWktPmJyaWRnZS5vZl9ub2RlID0gcGRldi0+ZGV2Lm9mX25vZGU7DQo+ICsgICAgICAg
aGRtaS0+YnJpZGdlLmRkYyA9IGhkbWktPmRkY19hZHB0Ow0KDQpJIGRvbid0IGtub3cgd2h5IG9u
bHkgdjIgZHJpdmVyIG5lZWQgdG8gYXNzaWduIHRoaXM/DQpDb3VsZCB5b3UgcG9pbnQgb3V0IHRo
ZSBjb2RlIHdoZXJlIGFjY2VzcyB0aGlzIHZhbHVlPw0KDQpSZWdhcmRzLA0KQ0sNCg0KPiANCj4g
ICAgICAgICByZXQgPSBkZXZtX2RybV9icmlkZ2VfYWRkKGRldiwgJmhkbWktPmJyaWRnZSk7DQo+
ICAgICAgICAgaWYgKHJldCkNCj4gLS0NCj4gMi40Ny4wDQo+IA0KDQo=

--__=_Part_Boundary_009_545054544.2006239177
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtBbmdlbG86DQoNCk9uJiMzMjtUaHUsJiMz
MjsyMDI0LTEyLTA1JiMzMjthdCYjMzI7MTI6NDUmIzMyOyswMTAwLCYjMzI7QW5nZWxvR2lvYWNj
aGlubyYjMzI7RGVsJiMzMjtSZWdubyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtFeHRlcm5hbCYjMzI7
ZW1haWwmIzMyOzomIzMyO1BsZWFzZSYjMzI7ZG8mIzMyO25vdCYjMzI7Y2xpY2smIzMyO2xpbmtz
JiMzMjtvciYjMzI7b3BlbiYjMzI7YXR0YWNobWVudHMmIzMyO3VudGlsJiMzMjt5b3UmIzMyO2hh
dmUmIzMyO3ZlcmlmaWVkJiMzMjt0aGUmIzMyO3NlbmRlciYjMzI7b3ImIzMyO3RoZSYjMzI7Y29u
dGVudC4NCiZndDsmIzMyOw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtJbiYjMzI7cHJlcGFyYXRpb24m
IzMyO2ZvciYjMzI7YWRkaW5nJiMzMjt0aGUmIzMyO25ldyYjMzI7SERNSSYjMzI7VFgmIzMyO3Yy
JiMzMjtJUCYjMzI7ZHJpdmVyLCYjMzI7YXNzaWduJiMzMjt0aGUNCiZndDsmIzMyO3BvaW50ZXIm
IzMyO3RvJiMzMjt0aGUmIzMyO0REQyYjMzI7YWRhcHRlciYjMzI7dG8mIzMyO3N0cnVjdCYjMzI7
ZHJtX2JyaWRnZSYjMzI7ZHVyaW5nJiMzMjtwcm9iZS4NCiZndDsmIzMyOw0KJmd0OyYjMzI7VGhp
cyYjMzI7Y29tbWl0JiMzMjticmluZ3MmIzMyO25vJiMzMjtmdW5jdGlvbmFsJiMzMjtjaGFuZ2Vz
Lg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtTaWduZWQtb2ZmLWJ5OiYjMzI7QW5nZWxvR2lvYWNjaGlu
byYjMzI7RGVsJiMzMjtSZWdubyYjMzI7Jmx0O2FuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29s
bGFib3JhLmNvbSZndDsNCiZndDsmIzMyOy0tLQ0KJmd0OyYjMzI7JiMzMjtkcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2hkbWlfY29tbW9uLmMmIzMyO3wmIzMyOzEmIzMyOysNCiZndDsmIzMy
OyYjMzI7MSYjMzI7ZmlsZSYjMzI7Y2hhbmdlZCwmIzMyOzEmIzMyO2luc2VydGlvbigrKQ0KJmd0
OyYjMzI7DQomZ3Q7JiMzMjtkaWZmJiMzMjstLWdpdCYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2hkbWlfY29tbW9uLmMmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19oZG1pX2NvbW1vbi5jDQomZ3Q7JiMzMjtpbmRleCYjMzI7MWIyM2FiNjk2OWVjLi40ZjcwOGIw
NGY1ZTgmIzMyOzEwMDY0NA0KJmd0OyYjMzI7LS0tJiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfaGRtaV9jb21tb24uYw0KJmd0OyYjMzI7KysrJiMzMjtiL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfaGRtaV9jb21tb24uYw0KJmd0OyYjMzI7QEAmIzMyOy00MTAsNiYjMzI7
KzQxMCw3JiMzMjtAQCYjMzI7c3RydWN0JiMzMjttdGtfaGRtaSYjMzI7Km10a19oZG1pX2NvbW1v
bl9wcm9iZShzdHJ1Y3QmIzMyO3BsYXRmb3JtX2RldmljZSYjMzI7KnBkZXYpDQomZ3Q7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7aGRtaS0mZ3Q7YnJpZGdlLm9w
cyYjMzI7PSYjMzI7RFJNX0JSSURHRV9PUF9ERVRFQ1QmIzMyO3wmIzMyO0RSTV9CUklER0VfT1Bf
RURJRCYjMzI7fCYjMzI7RFJNX0JSSURHRV9PUF9IUEQ7DQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7aGRtaS0mZ3Q7YnJpZGdlLnR5cGUmIzMyOz0mIzMy
O0RSTV9NT0RFX0NPTk5FQ1RPUl9IRE1JQTsNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjtoZG1pLSZndDticmlkZ2Uub2Zfbm9kZSYjMzI7PSYjMzI7cGRl
di0mZ3Q7ZGV2Lm9mX25vZGU7DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjtoZG1pLSZndDticmlkZ2UuZGRjJiMzMjs9JiMzMjtoZG1pLSZndDtkZGNfYWRwdDsN
Cg0KSSYjMzI7ZG9uJiMzOTt0JiMzMjtrbm93JiMzMjt3aHkmIzMyO29ubHkmIzMyO3YyJiMzMjtk
cml2ZXImIzMyO25lZWQmIzMyO3RvJiMzMjthc3NpZ24mIzMyO3RoaXMmIzYzOw0KQ291bGQmIzMy
O3lvdSYjMzI7cG9pbnQmIzMyO291dCYjMzI7dGhlJiMzMjtjb2RlJiMzMjt3aGVyZSYjMzI7YWNj
ZXNzJiMzMjt0aGlzJiMzMjt2YWx1ZSYjNjM7DQoNClJlZ2FyZHMsDQpDSw0KDQomZ3Q7JiMzMjsN
CiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtyZXQmIzMy
Oz0mIzMyO2Rldm1fZHJtX2JyaWRnZV9hZGQoZGV2LCYjMzI7JmFtcDtoZG1pLSZndDticmlkZ2Up
Ow0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO2lmJiMz
MjsocmV0KQ0KJmd0OyYjMzI7LS0NCiZndDsmIzMyOzIuNDcuMA0KJmd0OyYjMzI7DQoNCg0KPC9w
cmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioq
KioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZQ0KICoqKioqKioqKioqKioq
KioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2Ug
KGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJp
ZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1
bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25s
eSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24s
IA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBl
LW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGll
bnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlv
dSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2
ZQ0KIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNl
IG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1t
YWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRp
bmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9z
ZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5
b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_009_545054544.2006239177--

