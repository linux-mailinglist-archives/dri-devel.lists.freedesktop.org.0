Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CB49BDF13
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 08:02:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D43D10E637;
	Wed,  6 Nov 2024 07:02:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Wyci6w3h";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="ibrrma7+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CDCE10E634
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 07:02:05 +0000 (UTC)
X-UUID: 039fe0b49c0d11efbd192953cf12861f-20241106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=YwpcVMf3nQ+q8Js066W+REcZx5LvlIJntvulCPtp3RQ=; 
 b=Wyci6w3hN0D7NvHJNYLZFRsuShxdAMPIaW/EG/X8BiXihHQM53G/NfRYr9DGApThDf+Iq4xMmVMTyaAHutwfzSxsHy6QKRAXoAhc1VYI3xzBF5z/3am6cdaihYRa6TRkjCNlOn4J9T36PhlOxV6yt71ep7eb6fDSV+e5OtRD8xM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42, REQID:96cf2840-7fed-40a2-855a-abe94b0be3bb, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:b0fcdc3, CLOUDID:506ba106-6ce0-4172-9755-bd2287e50583,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 039fe0b49c0d11efbd192953cf12861f-20241106
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1009070032; Wed, 06 Nov 2024 15:01:58 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 6 Nov 2024 15:01:57 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Wed, 6 Nov 2024 15:01:57 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=be4ZmYe8X5oS6DAlG3xQPtf/oiKQrb37QsAl0oZwMYWemsdRCnw09CmxywrQ8kqs1/rUpBA9fiePe2PdknR1BKF7WSQIOzH7oFLMWJt5dDQ7x2sVP9TWbgCiCBGIlEiAt4F82XdQIEmBfleas7pfgT63OLRUp521dfPvWDXgST2jrRpLZXWL1Xuosa/on7TjXZfazn+WZebqqXdUCVE8V5p1Qfs2+ngvt6Ox7lLkvSJ9jjyI4TdSwLuklB+p+yjfFjFAwbLeUB7MTzypxQz9U4bUJLe7KmQQJD1vy1EdJSoi9Ye3Tzn/0Um35iGgVZaq/X+zlhHEmEnKago0LUSbZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CtsKGlliSx/YwMdLrALT4xyR3mLSgoGE0p6d9lEF0J8=;
 b=KoUYVEEGPa9JmNMuCy4gEo3n4NlrSYyoBMT8jqt7UOqVvMoSOgPTWtHUVDJscXIRjS8cspfp6R1ZT4JgHE/FCVQwEuVdPTQHH3WksqeOlS8tTrni3YDGyE3nUvZYNSaVTT2sibNHErx6aItAQjNt0g7aHN2e/Gn3u3d+jM24dk/MKarUFezd2Hv8sM7U90AJ/93At5IfKozbu2KXTdERhVCS9BtXJP94Y8y+u/zDtdiabKJTCEhnRGQfrD4XKii1MEuQOqcVyy2UD1bVbiM+b/NPQpv0rUCvcvfTc4HoPFOkyAitfMswXMUTyq2tiYxUBETFaQ9gBACPXPi1yWdskg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CtsKGlliSx/YwMdLrALT4xyR3mLSgoGE0p6d9lEF0J8=;
 b=ibrrma7+DpLWJRysRsKrscL3u6kxSAXgrOOxW1tM9tTTrF4CegF3ocR9lvtS0whwjU7sMLvKAu8nLM/OQr6+Rxu7doqYtYHGrr9Ht2ssYZK8lzxme69OwwQ+1VULGCKeKoa1lEKlHC0mx2cPUoSs3pSDtmWFChqJOBjwSuXjszA=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEYPR03MB6602.apcprd03.prod.outlook.com (2603:1096:101:86::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Wed, 6 Nov
 2024 07:01:54 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8114.028; Wed, 6 Nov 2024
 07:01:54 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>, "mchehab@kernel.org"
 <mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?utf-8?B?U2h1LWhzaWFuZyBZYW5nICjmpYroiJLnv5Qp?=
 <Shu-hsiang.Yang@mediatek.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "yunkec@chromium.org" <yunkec@chromium.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, =?utf-8?B?WWF5YSBDaGFuZyAo5by16ZuF5riFKQ==?=
 <Yaya.Chang@mediatek.com>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?utf-8?B?VGVkZHkgQ2hlbiAo6Zmz5Lm+5YWDKQ==?= <Teddy.Chen@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "hidenorik@chromium.org"
 <hidenorik@chromium.org>, =?utf-8?B?U2h1bi1ZaSBXYW5nICjnjovpoIblhIQp?=
 <Shun-Yi.Wang@mediatek.com>
Subject: Re: [PATCH v1 06/10] media: platform: mediatek: add isp_7x utility
Thread-Topic: [PATCH v1 06/10] media: platform: mediatek: add isp_7x utility
Thread-Index: AQHbGj2JaAd/ufwz/0W0Edv5eKs5YbKp/wgA
Date: Wed, 6 Nov 2024 07:01:53 +0000
Message-ID: <19de1ea984ca7adb0d25058572779f44f28744a5.camel@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
 <20241009111551.27052-7-Shu-hsiang.Yang@mediatek.com>
In-Reply-To: <20241009111551.27052-7-Shu-hsiang.Yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEYPR03MB6602:EE_
x-ms-office365-filtering-correlation-id: 75060e46-2dc3-490c-0c92-08dcfe30e56d
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?dzlha0svQko4QklNcGFCM0ZDdk02R1R0elRwWEoyb1Z1MDZEU255UDRoSGFR?=
 =?utf-8?B?R3NyTFJ6VzBmTEtNSnZkZ003Z0FScFVRcjROTDhRMWdZQUVXeG41eU9zWi9Z?=
 =?utf-8?B?SGRPcTdJalBJemIrU3lEWUppbENJcjRRaGpEWXBseGZ0U1lPYmlnSlBlaTR1?=
 =?utf-8?B?NkRRdkpkQ1lCb2lIS3ZtQUZHa1JoMVN1Y0VFY1E5UXE0a2JtOU0yTmdYSkUv?=
 =?utf-8?B?dXEzTnBIeTRwNVBxbGRJWHRlY2RxLy9jdmNQNkk3bm1HSXBmMWRSSFFtZHJX?=
 =?utf-8?B?R3g2UHRVbVdMaEFDZkp2N1dRUTdCNktZSXZMcmp3WUhNQkZtSlN1cGNEaFlH?=
 =?utf-8?B?T3VvZU9vMjZkSFQ1elIrd1R5ZTBnRkFQbTRMUW1zQVF0MzN4RDRkY0ZiUUJG?=
 =?utf-8?B?dUNaNTZJWGNkd3BGbEtvUlREQnpxZFJQNG1uYjBwSit1WDFUSGVxYjErcFdQ?=
 =?utf-8?B?NWh6QjJyM3I4QzVWcFdEUUVUUHNtUVFGQ0dQMjB2OUh6eDJlQTF2VDIvMHFT?=
 =?utf-8?B?WC9LWVFFZ002NkdrZmNoaGtMMExxZktVTTYrUnFsYjlXbFZNaU9ReVMxcndM?=
 =?utf-8?B?NFZxZE1XV3l5M09VTngvbnpXYk1LNTdmcGN0TVVVTDFYc3hjLzJ2YXdGbGpv?=
 =?utf-8?B?SFN6NUVjdEtxZ2xpaEo3V1d0UzA0VktqZDgwbUpQenBwUjk3Mms1U3NtRkJB?=
 =?utf-8?B?YW1ncFRFWlVBTWZBcWhwUnkxTStyTk5Nd2FORTVJVTU2YWRaSmN2NkVhQlRp?=
 =?utf-8?B?YkprRjYvYzhJaW0raGZCdmppT1BZREp0UkhzQW5kVjE3bXNUb1AyalVhcW5B?=
 =?utf-8?B?alhJK1dIRWhpTVd4N1NlYVQwa1BPYmRuY2hnQzNURjcxdUVLL3hVVFgzNDVR?=
 =?utf-8?B?NjF1Y05Qc1k5cGlMTVBVYXBXemhMbUtldjVWeTBJaWc5WThCMjQ0NVRWZTBy?=
 =?utf-8?B?dEZNajZrVG1pVEVFN1A3T1RSbUR6aGlDcnhTWjFlTDRpbExOQ0xGeExBNTE1?=
 =?utf-8?B?ZE5IOFJvYTg3ay9GcGc4YkR3emt2S3ZSMkVFdHdpaWtWNjF3RHl6bi9MTFNy?=
 =?utf-8?B?MTVXNEFSYURXeVBzNTJpa0F6U1pRMjZjamJiU2xUeWllS3JaaWlvWG8ycERo?=
 =?utf-8?B?aEdMK25wK3l3NEVPM3crblRFQTdGQjI4TnlsT0tiejFGb1lHRFNncnQ1TFU5?=
 =?utf-8?B?RWZJekV5L1NtV1BrRVFlbzFjVzdYbXhUblZmSDA4WGpGNEV5MWVrRDY2UmtS?=
 =?utf-8?B?Z2kzLy9lWXpmNVZqd0VScHNUeUFWOVNCelNhTVpBWFNzWndiQkkxSGxEc1Rn?=
 =?utf-8?B?ekd5NFp4NEVXRUlhbzlRM1U1bDJvRStsL2JRZmtIVWdOVS9VL1N4MlJjcnMy?=
 =?utf-8?B?TkptY2xyaWJDNk1CWUdtVVVib3ZXRWxUOTUrZGUya2Y0N3RDd0liU3NHUHFQ?=
 =?utf-8?B?MkluSUszSW9la1FoSlc3VlpYaEdaRExUS3JyQkRQcXpsRDh2ZDA3R3d0a0hn?=
 =?utf-8?B?dHNIZWJvMTZhaTBORXV3VnRVdHNhRmR3NUtrRTlFYU5UUjFkMGo5K2dHS2Vx?=
 =?utf-8?B?d0Y4ZWx6RmhEc1lKdGp3V3NsdjJadWZHY1FwOXVkRFZvYzhNYW5LR1YxZnRz?=
 =?utf-8?B?aGpzK01NbHhqSUtleWRzSmozLzhkZ1lTWHo4dXdBUUNvOWcrOTZRaEJTMVJa?=
 =?utf-8?B?Vzh1Y1IrZHFEU2R5Smh2dlRidzRTazA0ZVJRSGV0WHRCUVg5M0JTY1czSThY?=
 =?utf-8?B?M0ZDNmNLWHlnVFd4RnVEOTcwWkRRdzZIWm5FRFE0UUpsN3R4ZXVMdVdScllW?=
 =?utf-8?Q?tOMl03H3Tb0heESO2rOY0YBvuMalADHzqVa18=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MjZQSkhEVmQvbExlUlp5eTRaNWRCYU1IR0U4Skd1L2NhdTZaVWhUeWlWK3hI?=
 =?utf-8?B?Zk1ZRXNLNVhReGl6TXhoR3dtVXZvZCswWnBocXQvL0RwS1NnZnY3ZWk0Yy9v?=
 =?utf-8?B?TkNySFJQYzRxaWhMRDRQMjBVVUFNenIzaXoyeFR4eXIyVitpVWI1clFpU2dP?=
 =?utf-8?B?MjlIZEJXYkRnOW8zL2I4QWxqZGRXRWdoSDRGK3dmODZ6MXZadi93cVpXSVZo?=
 =?utf-8?B?Z2Y5bmVPRTVrM1NUOXlhRnRySTErTUhqUjhnaGJoSjRiK2FZZDNhcTRnRmps?=
 =?utf-8?B?ZzYrR2hyQ2dtbHhmdDNqeGZXZUdMdzFBYUFQdVowMjBOUGxJRUpBc0xNTm4x?=
 =?utf-8?B?d0luRW5ZaVB0bUg0VzRTVXVmOGF1dnVNRzhlL0k2VG1yR1o4UHd1cGMySGMx?=
 =?utf-8?B?UGljaW5Oc0Rhc29zUnpFZkVsclo3MllRTXFvWlk5WjZZSTdqNzBJbkJtMXVo?=
 =?utf-8?B?c2xYSUhGWGVab21VcGxhaERkMmlMVHJyWFlMdU9SOWUxZ0lvNUZTZmpmUVRP?=
 =?utf-8?B?SUxHKzNGNG40eWRhQ2RXTm5lWkZVU2tOQlBFWE10bU14bmdjMDJrWlA2SXZS?=
 =?utf-8?B?MTV2ZlFOTkpoNjhSNTRpUS83T3NJdWVRTlp6QW1qcjBLY3FscUNBVUVhUzN6?=
 =?utf-8?B?ckVoVm5RN0I2QU83QTFCUzdzV0ZsaU9aTUlwc1NBMDJmUzRYTnNweC9UM2ZG?=
 =?utf-8?B?TytIOGkwSXRvVk9tN2F1elU2N2I0MWNoUHFZMUJnOWlMd0U3NGY3MnpRc0g0?=
 =?utf-8?B?R1JqSTBEeXdiWFZCd1I2NDArQjNHWDJRYXJuZW85RGljLzZaL1Z2bXlNdkth?=
 =?utf-8?B?UnFsMEVLSUhVV3d6UXI0RHJrZXF6b1FNNVpzeDZPYkdjeHBlYmkzWXdST1Nt?=
 =?utf-8?B?bzZ2UEJFNnphWW1UVW5iYW0yb1BoYkx1VWpjWHVkSGtvb05CeTl5RzFhaEh4?=
 =?utf-8?B?TUhSR0NNLzgvRUJKMktnS3VQbmxqQ3V2VW55NXd4Y2RHK1kyVmdMK0c4TVJx?=
 =?utf-8?B?TDNCOHFIanBOdlFVOTM4eFFoM1hER2h4MDlOUURsWUhDRmFLR0d1NXgwSHZQ?=
 =?utf-8?B?ZzB1SnkwYU1MVnpUeEF3ZHk2aDQwSFlWc2d2QXF3c2kvS2FwaWoxRHl6bXFj?=
 =?utf-8?B?Y2JEaXhObDVuNUxvS2h5aElyM3FWMWV5bkt0TSttamMzU2JaWi9lRW1XWmNt?=
 =?utf-8?B?UFZ1UEVnMlo0WWoyODNDNmlWMUpFREVmMlY5Y3gramF6ekliUE02TldLSGpP?=
 =?utf-8?B?ZjYvMGY3cXpoN2pUVEo0VERIbXQyRFRHQWo5QTJldDNWSW03QS8wNVdmdmxw?=
 =?utf-8?B?THVKaEpHNVEwZldtODBKM0JGYS9YKy9maXh1SEN4bXZ4MUNockx2WlUvWW51?=
 =?utf-8?B?ZW9uYytXQklWSGRrbk00Mk5pd2ZFY3BjQlhibE1URWtGMS9MdjlZMDh4Ny9F?=
 =?utf-8?B?UmxYR0lTZzJpRFUzelpNZm9IeGt4MG5aNjBUOGc4bWpablNvNDR3dlJLN0tn?=
 =?utf-8?B?RENHR2dtSXdvNkhBQ1d3cEFoV05XRDRpZ2lJaW4xKzBiYVNLdHljblE3NkFY?=
 =?utf-8?B?ZCsyZ2NOcDVXUStSUmsrd2FteWdqeExPQXhsUTFtYi8zSDYxMVJjdllWazUw?=
 =?utf-8?B?OVpVSHFRaHZRcExTRzQ3Uk1qeFErYVA3dWhFTjJzUWprWXBwekZUc0RTTG9N?=
 =?utf-8?B?enkxRWpsQUlNVEhiNTN4eUtsdWEvOWE0djdZL05ZMG5PVDZRSG5Qd0tDNE9Q?=
 =?utf-8?B?QmZXSHRDMC92YXRndElyWFVkbEJPWTFFWUFJOFh5SXUzQlpkZGh5MUN3ZFlJ?=
 =?utf-8?B?VUt0bk1oYmNxY0dtb2xkY3cxWjhRaEk0aEViNHZFcEVkS1ZDNWJsS2RTZ0Fk?=
 =?utf-8?B?M1N4N3IyVlZnVGJhRlVXK0lzaUZOOWZQdTRhY1Y0Kzk5YnJUTHFBWWM5dWNw?=
 =?utf-8?B?UStNNW1uZ1Q2bFhxZG03YWh1QldwTHFEUmtLMlJkV2w3eFhOandVdHZuSnJK?=
 =?utf-8?B?SEZKbHJIaExyZzVzd21tSVRqVEZtUW1sYTJnWWY3RkZ4ZFhYY1d2a09ZM21K?=
 =?utf-8?B?YzFpQzN5RTFrT3VMcHV6UW9rK0tORHNseCt0eG5TYUFuZFZwei9wd2FBUHlM?=
 =?utf-8?Q?QNufYoX/GWf7WvWKqaEwTPEdI?=
Content-ID: <F64CA3ACAE8C1347BEB73A2169CAE9B3@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75060e46-2dc3-490c-0c92-08dcfe30e56d
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2024 07:01:54.0247 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MCi0dbeJZ3lArr4Y8ilvD2n382zR4aKwoPCd7Bx1vm2QaMF1TkWIk82c3GLc0GnBi45DkTQ7sDJnbZUEHbGNQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6602
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_009_352115317.560389924"
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

--__=_Part_Boundary_009_352115317.560389924
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFNodS1oc2lhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMC0wOSBhdCAxOToxNSArMDgwMCwgU2h1
LWhzaWFuZyBZYW5nIHdyb3RlOg0KPiBJbnRyb2R1Y2VzIHV0aWxpdHkgZmlsZXMgZm9yIHRoZSBN
ZWRpYVRlayBJU1A3LnggY2Ftc3lzIGRyaXZlci4gVGhlc2UNCj4gdXRpbGl0aWVzIHByb3ZpZGUg
ZXNzZW50aWFsIHBsYXRmb3JtIGRlZmluaXRpb25zLCBkZWJ1Z2dpbmcgdG9vbHMsIGFuZA0KPiBt
YW5hZ2VtZW50IGZ1bmN0aW9ucyB0byBzdXBwb3J0IElTUCBvcGVyYXRpb25zIGFuZCBTQ1AgY29t
bXVuaWNhdGlvbi4NCj4gS2V5IGZ1bmN0aW9uYWxpdGllcyBpbmNsdWRlOg0KPiAxLkhhcmR3YXJl
IHBpcGVsaW5lIGFuZCByZWdpc3RlciBkZWZpbml0aW9ucyBmb3IgbWFuYWdpbmcgaW1hZ2UNCj4g
cHJvY2Vzc2luZyBtb2R1bGVzLg0KPiAyLkRNQSBkZWJ1Z2dpbmcgdXRpbGl0aWVzIGFuZCBidWZm
ZXIgbWFuYWdlbWVudCBmdW5jdGlvbnMuDQo+IDMuRGVmaW5pdGlvbnMgb2Ygc3VwcG9ydGVkIGlt
YWdlIGZvcm1hdHMgZm9yIHByb3BlciBkYXRhIGhhbmRsaW5nLg0KPiA0LklQSSBhbmQgU0NQIGNv
bW11bmljYXRpb24gc3RydWN0dXJlcyBmb3IgbW9kdWxlIHN0YXRlIG1hbmFnZW1lbnQgYW5kDQo+
IGNvbmZpZ3VyaW5nIElTUC4NCj4gNS5NZXRhZGF0YSBwYXJhbWV0ZXJzIGZvciBjb25maWd1cmlu
ZyBpbWFnZSBwcm9jZXNzaW5nLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogU2h1LWhzaWFuZyBZYW5n
IDxTaHUtaHNpYW5nLllhbmdAbWVkaWF0ZWsuY29tPg0KPiAtLS0NCg0KW3NuaXBdDQoNCj4gKy8q
IENBTSBETUEgZG9uZSBzdGF0dXMgKi8NCj4gKyNkZWZpbmUgSU1HT19ET05FX1NUCQkJCQkJQklU
KDApDQoNCklNR09fRE9ORV9TVCBpcyB1c2VsZXNzLCBzbyBkcm9wIGl0Lg0KDQpSZWdhcmRzLA0K
Q0sNCg0KPiArI2RlZmluZSBBRk9fRE9ORV9TVAkJCQkJCUJJVCg4KQ0KPiArI2RlZmluZSBDUUlf
UjFfRE9ORV9TVAkJCQkJCUJJVCgxNSkNCj4gKw0K

--__=_Part_Boundary_009_352115317.560389924
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtTaHUtaHNpYW5nOg0KDQpPbiYjMzI7V2Vk
LCYjMzI7MjAyNC0xMC0wOSYjMzI7YXQmIzMyOzE5OjE1JiMzMjsrMDgwMCwmIzMyO1NodS1oc2lh
bmcmIzMyO1lhbmcmIzMyO3dyb3RlOg0KJmd0OyYjMzI7SW50cm9kdWNlcyYjMzI7dXRpbGl0eSYj
MzI7ZmlsZXMmIzMyO2ZvciYjMzI7dGhlJiMzMjtNZWRpYVRlayYjMzI7SVNQNy54JiMzMjtjYW1z
eXMmIzMyO2RyaXZlci4mIzMyO1RoZXNlDQomZ3Q7JiMzMjt1dGlsaXRpZXMmIzMyO3Byb3ZpZGUm
IzMyO2Vzc2VudGlhbCYjMzI7cGxhdGZvcm0mIzMyO2RlZmluaXRpb25zLCYjMzI7ZGVidWdnaW5n
JiMzMjt0b29scywmIzMyO2FuZA0KJmd0OyYjMzI7bWFuYWdlbWVudCYjMzI7ZnVuY3Rpb25zJiMz
Mjt0byYjMzI7c3VwcG9ydCYjMzI7SVNQJiMzMjtvcGVyYXRpb25zJiMzMjthbmQmIzMyO1NDUCYj
MzI7Y29tbXVuaWNhdGlvbi4NCiZndDsmIzMyO0tleSYjMzI7ZnVuY3Rpb25hbGl0aWVzJiMzMjtp
bmNsdWRlOg0KJmd0OyYjMzI7MS5IYXJkd2FyZSYjMzI7cGlwZWxpbmUmIzMyO2FuZCYjMzI7cmVn
aXN0ZXImIzMyO2RlZmluaXRpb25zJiMzMjtmb3ImIzMyO21hbmFnaW5nJiMzMjtpbWFnZQ0KJmd0
OyYjMzI7cHJvY2Vzc2luZyYjMzI7bW9kdWxlcy4NCiZndDsmIzMyOzIuRE1BJiMzMjtkZWJ1Z2dp
bmcmIzMyO3V0aWxpdGllcyYjMzI7YW5kJiMzMjtidWZmZXImIzMyO21hbmFnZW1lbnQmIzMyO2Z1
bmN0aW9ucy4NCiZndDsmIzMyOzMuRGVmaW5pdGlvbnMmIzMyO29mJiMzMjtzdXBwb3J0ZWQmIzMy
O2ltYWdlJiMzMjtmb3JtYXRzJiMzMjtmb3ImIzMyO3Byb3BlciYjMzI7ZGF0YSYjMzI7aGFuZGxp
bmcuDQomZ3Q7JiMzMjs0LklQSSYjMzI7YW5kJiMzMjtTQ1AmIzMyO2NvbW11bmljYXRpb24mIzMy
O3N0cnVjdHVyZXMmIzMyO2ZvciYjMzI7bW9kdWxlJiMzMjtzdGF0ZSYjMzI7bWFuYWdlbWVudCYj
MzI7YW5kDQomZ3Q7JiMzMjtjb25maWd1cmluZyYjMzI7SVNQLg0KJmd0OyYjMzI7NS5NZXRhZGF0
YSYjMzI7cGFyYW1ldGVycyYjMzI7Zm9yJiMzMjtjb25maWd1cmluZyYjMzI7aW1hZ2UmIzMyO3By
b2Nlc3NpbmcuDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtTaHUtaHNp
YW5nJiMzMjtZYW5nJiMzMjsmbHQ7U2h1LWhzaWFuZy5ZYW5nQG1lZGlhdGVrLmNvbSZndDsNCiZn
dDsmIzMyOy0tLQ0KDQpbc25pcF0NCg0KJmd0OyYjMzI7Ky8qJiMzMjtDQU0mIzMyO0RNQSYjMzI7
ZG9uZSYjMzI7c3RhdHVzJiMzMjsqLw0KJmd0OyYjMzI7KyNkZWZpbmUmIzMyO0lNR09fRE9ORV9T
VEJJVCgwKQ0KDQpJTUdPX0RPTkVfU1QmIzMyO2lzJiMzMjt1c2VsZXNzLCYjMzI7c28mIzMyO2Ry
b3AmIzMyO2l0Lg0KDQpSZWdhcmRzLA0KQ0sNCg0KJmd0OyYjMzI7KyNkZWZpbmUmIzMyO0FGT19E
T05FX1NUQklUKDgpDQomZ3Q7JiMzMjsrI2RlZmluZSYjMzI7Q1FJX1IxX0RPTkVfU1RCSVQoMTUp
DQomZ3Q7JiMzMjsrDQoNCjwvcHJlPg0KPC9wPjwvYm9keT48L2h0bWw+PCEtLXR5cGU6dGV4dC0t
PjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3Rp
Y2UNCiAqKioqKioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0
aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBj
b25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1w
dCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0
byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkg
dXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBv
ciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5
IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSAN
CmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhp
cyBlLW1haWwsIG9yIGJlbGlldmUNCiANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1h
aWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSBy
ZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0
aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwg
YW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90
aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_009_352115317.560389924--

