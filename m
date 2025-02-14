Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC12A354B2
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 03:27:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89AED10E1D5;
	Fri, 14 Feb 2025 02:27:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="WLL6FMCV";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="qTUL31C5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21DDE10E1CA
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 02:27:01 +0000 (UTC)
X-UUID: 281b4908ea7b11efbd192953cf12861f-20250214
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=MA2ymFwPgU2yOIwibROWsBHqLq3dRIihDCPiRtrPhnE=; 
 b=WLL6FMCVWFaTyL0t24exfggfwD3jMsc110IN7U+RESn2C78egCuXOjIZ5Z0wY8o1E09Catm+6vQPD85/5blitoFsTCOJA/MTJrVomBtKbVP8cIVQgneLKdZdH2v487Kul/6G/e/Zt5rjgWOVvTXNNbvL3MtoVdpHJQV3F9M67ss=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46, REQID:74b75884-23a0-4723-ac60-1692704deab2, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:60aa074, CLOUDID:643b72a1-97df-4c26-9c83-d31de0c9db26,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
 EDM:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
 ,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 281b4908ea7b11efbd192953cf12861f-20250214
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 255102163; Fri, 14 Feb 2025 10:26:54 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 14 Feb 2025 10:26:53 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1258.28 via Frontend Transport; Fri, 14 Feb 2025 10:26:53 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QCRmk08FxNUqGVMM2zqpF8TNRAdgmyFCBIQb9251dIiJsAVtY4lNG+AqFo/Zhdgfp4hsvxS8y4jwY0eLLN0NUnACCEob9ql7NjmSvpXVxshJh+c3nuNk9jSNnAXtZRBlwBWdK8xa5BSxY6OHSHwAwXcoW0J4WaoChZa6oehwmZ9sBjsti/INUw9JLHm0l8fHS1/Z6d0T9ITyafuHNs/HkP4tBaa6TLZMzXtqT+qlpUfAPqan4/GVQpdHJCGMC0GX+NVQTae+8DyVB7a2d27nhv7VPun8UXX1duhFJkA+4d3OWRpZyWN7RLzIyyolKOiO5J5CBcS6okr9GYjFMyyVZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=434LfhtDU+aVsD1vQKEW5djxZXC95jTw1/pjNd0SjsM=;
 b=wlF7Ex4E+9x48Ygr06wQ+EIiA3uEXs8ZtbhB1A6RmykV/eVeCAZbh+0OBZfbfG8h5eAarhVpRfeAfSAdtR0VQSAnD9RwgyrVMDbISRvB0KBTrfnSYrIDJH6pMksCaHzeoeTA7A5Ib28uZkRMfCaLHxhQiNRFjNKQRE+aC7KJd5UptPtBukibk7LGjPJYin2inxkGejBHm4sEHgLuVwPPbtEoe2f9z3QArvWlZumNRr2nj6neqaGNDIOP/xbSwFn6ihTTLfy4GbpfKP9ocWXYMdcubvy5PbYGW3RN9/j+NusanM+5ynSG+AVGWH2y7vzKz0fPLAVp6IEOtSWOxGEIjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=434LfhtDU+aVsD1vQKEW5djxZXC95jTw1/pjNd0SjsM=;
 b=qTUL31C5QEvx/9dNsETlVrEqQxfzo1JSF0V3+T59grHf+ybaMC/GVT+pO9XgTpkJWt5BDzSvbNzPWRTgQluVHqXyhWYd+733WrfUpX1dcYix8MFKHbB45fzP3+kmNlL0ceZDvpMiYaaulsv3peZNfV06sauDcEdaa43YAxlSl9w=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by PUZPR03MB7253.apcprd03.prod.outlook.com (2603:1096:301:103::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.17; Fri, 14 Feb
 2025 02:26:51 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8422.015; Fri, 14 Feb 2025
 02:26:51 +0000
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
Subject: Re: [PATCH v6 08/42] drm/mediatek: mtk_dpi: Support AFIFO 1T1P output
 and conversion
Thread-Topic: [PATCH v6 08/42] drm/mediatek: mtk_dpi: Support AFIFO 1T1P
 output and conversion
Thread-Index: AQHbfHmR5GzS1BofdEu5Kb5oNpdoT7NGFtsA
Date: Fri, 14 Feb 2025 02:26:51 +0000
Message-ID: <78f911a4ae5bc29e120ea2ecd393f7f69597862f.camel@mediatek.com>
References: <20250211113409.1517534-1-angelogioacchino.delregno@collabora.com>
 <20250211113409.1517534-9-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250211113409.1517534-9-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|PUZPR03MB7253:EE_
x-ms-office365-filtering-correlation-id: 7e873a45-0306-42c6-3631-08dd4c9f0a3e
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?aVpNM2NzaDAxTFFtNUxxeGJIN3VKajBLZG9oRnJkK29FUlc0QWlZVW9NZXhS?=
 =?utf-8?B?aHh4dnVxdDFXU05zT1lER3lNTjVkekZ0YmFGdjRrdXdpVkFsUEwya1N3WU9m?=
 =?utf-8?B?Z09PWEowQmNtU3ViajNWRFRDL1F3U1NLUjVQVVByK1NDRlRFTENHVU12TW9h?=
 =?utf-8?B?RDcrbElFNnZQVlF0ckltMjZLRkxCYVY1WlNudW9SOFppZ0tOeTRQSm9mUnd4?=
 =?utf-8?B?b3dQTmNVZTh4bnhDaDFHckZ6bXUwUTI2a3FnbHVHS3p0dnhsSHdHbFZxSzdV?=
 =?utf-8?B?V3k2Q09sNlV4OWMzSTdxQ2NKNmdGeW1pQkRZdGVRaFN5dTkwVVd4OG9WbDFF?=
 =?utf-8?B?WWFaNzdRTWZTdlp0UTVBN2hBS0FKM3gyUGx6clA5NUQ2SUVybnpUN2h2cXRz?=
 =?utf-8?B?Mmx2RmhDajc0SjNKdzRsd1BNYTArNVI1L1dzdTVlNmdTUGRxSEwzZkQzTHlD?=
 =?utf-8?B?eUtpdGtlTjZNWWFvK084TlY2QkFNYVQzMEE0TDVKT1had09WZ2dZdThkT05n?=
 =?utf-8?B?cno5QlA2cUxOWGdSVXRiS0toNE9wSWJvQjhzejJVaXpmUnNGQURzU3J5YVow?=
 =?utf-8?B?SEdkQ2hGKzJ6TGRSRkdQYUFiMitQSmhwOUtSWmNUdVFEK0N3VlV1UTNkcG4w?=
 =?utf-8?B?RG5jU213eXJwaU9pQnhEYVgrU0RCenlKUk9JRG9oazZTN2ZxMlFSNU16cTRY?=
 =?utf-8?B?Z3dGQ202c2ZIYk9VMzZJUml1aDlFNmsyU000VWhaYkRIRDg0bzhZRkhGNWRt?=
 =?utf-8?B?WFlNZXh0QXZhcWc4aUhVOGlqajFhZ2UySlE0UENyYVdIYUdiVTJCOHdkcDB3?=
 =?utf-8?B?M2RxcXJZMzRMc2Q4N2ZQWVB6TW9aN3VYSW1GQWlBMll1aWJyQjNxdHNxaDVV?=
 =?utf-8?B?L0FQSktvUnBybHlLcURYaEFHYnVnTDFhVnIwZHkvSlc2YjNFKzl3UmgzYm5v?=
 =?utf-8?B?NmNiaGN1WUpIZzU0S0tncDA2Q1U2WnMvTnBDQXlXbWtVWlh6VEVkblNRaFhy?=
 =?utf-8?B?K1JkeUh6bjR2WFpjMDd5eFdvaUxnNlpubjc0WENYWlFMcFVRNzAzVklibllC?=
 =?utf-8?B?VHhlVWhubGJWTmdoVHoxTU1GYkxrRDVtU0NVVHhHcUlObVIrYnVaQUlLd3lS?=
 =?utf-8?B?aUx2RmdwcHBMTjQwTHhXK2p4dmNoQWhLdUlUcGZGOVJPY1F4aXRCdWRyUHh1?=
 =?utf-8?B?V2R3MExKRmR2OUF3d0ROUlJ5blJhSG1FN2x3MHd3ZHhWVnkzWjR6UVNyRmdC?=
 =?utf-8?B?VTFJZTBWOHpKVzF6WWE3VFZnbnB6T09icU9sWkZacllSUFJJK3RIeWtpWFkx?=
 =?utf-8?B?ZGxtR3AvMitIYU93N1VEdjZCcEFNSWpMek4zcDRVdWZ0ODBaY1gvMzFwQTli?=
 =?utf-8?B?NGxFK0VHMFhkSmMvVERmRlRyUFlxZ0tpODNCZnR5d2UxN0grb2t4YWl2NUdu?=
 =?utf-8?B?T3NNSUZ0b3RTL0J3eU5yMnF3MkRndlF6eEV4KzFZb1JqUjZuU0RUWjhkZ0k4?=
 =?utf-8?B?SStXenJra0tibktaU2p0NDF3UENNNW54RU1ienhBYnlOa2x5a05TWXMvRkdF?=
 =?utf-8?B?QXJmbWJhWHBRczBPK3FHRFdJNGdvQnJNakdZV2lRMmppRmtrSGt3S1k3TitK?=
 =?utf-8?B?QXBHNm5LL3dWblgrNWN2VHE4SU1YWVlGSlJ5VVhKVFNBS09ZSm55OFNFeXNM?=
 =?utf-8?B?SDUrMng0NTlWZ0t5SnpjYm5OSDZFWENIU0Zwb2VFdENSb29GeFFoNTRkOTBD?=
 =?utf-8?B?WDdPRWlhdXU0TmNIVlVFRG1GR2t2eG55amppOUEwcDhldjRFU09LL292N2JZ?=
 =?utf-8?B?bEZYRHBpbXVIUWR1Sk13T3A3Z0F5c1JXQ3ZnUHFUQUx0Tmpxam51K2RuVG9w?=
 =?utf-8?B?KzdubVc5aXVvRUdBd0o2eUlCeS9SVWpZd3JIOVk2TzZJUFhSQURTRktSK3hw?=
 =?utf-8?Q?p5vZCZ7L3uZnJ3msDdumthlMNdIqYUg9?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NE9Qd0FrMGdobzJyaUlGRWFqalVvN2xyTEJScFJqeHg1OVdGWk01a0llUnlt?=
 =?utf-8?B?SnAvREhtRTJFQ245UTlXcFliZU1laDR5MUo0cFFCY3ZHVDRGY1lCSVJ5Ti9S?=
 =?utf-8?B?d2g0TTNxMlBQNVFVN1Z4T2RETUkvb2UwaTZPL3JvSTJqYTkrUFRTWnkvN25v?=
 =?utf-8?B?VklwSmNQdm1KNUVTM2JkdnNhbFVsNitOQWxXRHZJNUptZ05nNWJWMnZNR0VP?=
 =?utf-8?B?UXd0MXZpWnMwUjBCeWFqV3lOL25JNm1hdktubDhoVFM1bFhTMEV2Rk5mNUNs?=
 =?utf-8?B?SVJ5M0xIdzFoUXgvMTNLRTA3QVp6WW9ZNEJ2M004d2tFZ09laWV0M0VESk5w?=
 =?utf-8?B?K1lqU2VDQjBZN0E0R0JhWnpkZFZQRzUwell6QTBzUEphQ3NSREVCZkgxYnF1?=
 =?utf-8?B?NlRaUHVEREp2VTRZNFd4NVQ3cThpUmt2MGljOVZIWUdVZFJVUDNGQzYveFRw?=
 =?utf-8?B?dXJEeU16SEl4MXlDd1RPY0M5V21zbGZBU2pZdVorR3RrZ1hQQTR3WUZnNENw?=
 =?utf-8?B?aitkME5vNExnNzcwc3dDYWgvL2FycE1PcW5uT2lBQ2t3SzlSdDB2WnAyL09G?=
 =?utf-8?B?YzlKWldHand6Y1FWYTU4ZzNVV21HdDlDbHFncXIyYy92K3NMRVA4Um5Wc3NG?=
 =?utf-8?B?QW10RjBhMDl4ZzJHQ3IrbW5oUDg4T0hlczF0ZXMvWnhuSlkzK1V4bjFtTE1Q?=
 =?utf-8?B?MmFZTHpmTkQwUlhGVXdjS0lPSXRnejBxbGV4SmM3NDVBVWRURXE3QVNER1Vr?=
 =?utf-8?B?dk5lNTYrTXlTdjJpZVIxbjZRYisvby83bmtmMzRsVGxRQ2YrVTIxekI5aHJw?=
 =?utf-8?B?YVhnY3FUdmdUQ04zQUVBZWo1UGtla0RVVXFkUFVudU94MEZBM3liVmttaE9U?=
 =?utf-8?B?Y05HaVY2ODd4WDZEUm5mLzFLa2ltdjErZFcwZzJ6TjZnMjV0aEdPN0lTbkFt?=
 =?utf-8?B?VVMxa1B3amNXMnMzclA3N1lJV29ZZkZ3OTlTNU9VR3RxcERtMEhNdVhxdXda?=
 =?utf-8?B?QWJlYWN2WWdwcmFjbXAvaU9IcWUvN1pUajlOL2tPSnhsL1h0ZzBGektFT1d6?=
 =?utf-8?B?NEh0elFmYUllKzMreXFBRVlwU3BXUmdnWnRVZi9WaWlERGRoTkhCMmw3U3BM?=
 =?utf-8?B?bG5nQ3hhZWNwdWNITStnSWpwUEFzc3c4bXNDeVU5Uyttcng0VmVsSUVpSlgv?=
 =?utf-8?B?bHM2TzNxK1phc01kR1dmcTVGUkk4TkFKbXdYQjJvcHM0bzI3bVdybjBuSWFL?=
 =?utf-8?B?Q1V1bHF6MGVzWEVqS0pBWE1NaWNhMm51a2RyZlN2eWpKYUx0RjdNUytIZWw2?=
 =?utf-8?B?aFdMTVorYkNpS0xYWWJ6bEJLSXM0WHlrWmx6ZTJHT0ZqM1ZJNlFjRHlvK1lB?=
 =?utf-8?B?Z1VWSWoyWmQydzJZQ2g4WDZJbnBZa2xqTnZ5dElmOGcyYkZPN25VVHpDZldp?=
 =?utf-8?B?ZmNBY2laQ21BNHcrNTFRZ1R5MkZzQXh6M3B1TlpYM1F3TzVmYXdtM0JEMnBk?=
 =?utf-8?B?Z2k3WEk4YkY2eVJUZVl0YTF3TCtMcVl5dERBd0Zoa2dxY1EwY3I0MTR0N2oz?=
 =?utf-8?B?MC83QnpOMnlRczE0Qzc5V1JRRFdOSGZZSThoVkRrU0xWQmVtb2VNRC90RWJV?=
 =?utf-8?B?N1JiVkdneG9uTmdXMGt1QmwzVTUxOW9lQ3NNQXNxU2NJdmk5SGlBQzJpN2Vj?=
 =?utf-8?B?dnVVMHZ1aDdLa3ZrZEljV1VUdlQyQ24xakNVcGJrY1pYZFZqbSs4dzRwS0dO?=
 =?utf-8?B?eGxpUk04OEhpRERtWE53SHBnckIvdGVoRFR0OGlJL2lrNnRNZXVxLzFXMjBa?=
 =?utf-8?B?eUNXYVd4OVhCQys1QWNyYndiNU5hZzlLZ0hqWndXSGJYVy9FWmd0S3ZRZ3pk?=
 =?utf-8?B?ZEh6eTZQUjMwRlZDMzBxTmU4QWtPaitJMlJRekdhMzFSaUNGOUpxR3BxUlpR?=
 =?utf-8?B?YWdCeG54OTNGT1hOcWpVTnVxV0NqbWc1bzZZUzJBWmVoSGhUSHpiM1cvOFgw?=
 =?utf-8?B?T1BPaG9DZEkwd2xPNGxRdVVJM21vcHlGSXpDUnQ2aW1UUXVWRUpRSVA1bCtX?=
 =?utf-8?B?cUhFRDk1RklSZlZpUnA1Ly9EWDA4dGJJTEFnc0FPWEo0dXppclltUnRCMlFr?=
 =?utf-8?Q?nQyBz9xldCKVjuxa8lGe6yuYK?=
Content-ID: <21B2AC1A6D7A0B4A867CBE3545FDD90D@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e873a45-0306-42c6-3631-08dd4c9f0a3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2025 02:26:51.1422 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E+zEMPedaVtEQOye1Yru+IAA/WbZfpAuToef59ousXBzICKVfjIOCN38inci3r0DEo4xqToWGkO45PwqAodxBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB7253
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_005_375785083.1917062918"
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

--__=_Part_Boundary_005_375785083.1917062918
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDI1LTAyLTExIGF0IDEyOjMzICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBv
ciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBPbiBzb21lIFNvQ3MsIGxpa2UgTVQ4MTk1IGFuZCBN
VDgxODgsIHRoZSBEUEkncyBGSUZPIGNvbnRyb2xsZXINCj4gKGFmaWZvKSBzdXBwb3J0cyBvdXRw
dXR0aW5nIGVpdGhlciBvbmUgb3IgdHdvIHBpeGVscyBwZXIgcm91bmQNCj4gcmVnYXJkbGVzcyBv
ZiB0aGUgaW5wdXQgYmVpbmcgMVQxUCBvciAxVDJQLg0KPiANCj4gQWRkIGEgYG91dHB1dF8xcGl4
ZWxgIG1lbWJlciB0byBzdHJ1Y3QgbXRrX2RwaV9jb25mIHdoaWNoLCBpZg0KPiBzZXQsIHdpbGwg
ZW5hYmxlIG91dHB1dHRpbmcgb25lIHBpeGVsIHBlciBjbG9jay4NCj4gDQo+IEluIGNhc2UgdGhl
IGlucHV0IGlzIHR3byBwaXhlbCBwZXIgY2xvY2sgKDFUMlApLCB0aGUgQUZJRk8gSFcNCj4gd2ls
bCBhdXRvbWF0aWNhbGx5IChhbmQgaW50ZXJuYWxseSkgY29udmVydCBpdCB0byAxVDFQLg0KDQpS
ZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4NCg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVn
bm9AY29sbGFib3JhLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RwaS5jIHwgMTEgKysrKysrKysrKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kcGkuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMNCj4g
aW5kZXggNjQ5M2M3ZTJmYWU0Li41YzE1Yzg5MzU5MTYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kcGkuYw0KPiBAQCAtMTQ4LDYgKzE0OCw4IEBAIHN0cnVjdCBtdGtfZHBpX2ZhY3Rv
ciB7DQo+ICAgKiBAZWRnZV9jZmdfaW5fbW1zeXM6IElmIHRoZSBlZGdlIGNvbmZpZ3VyYXRpb24g
Zm9yIERQSSdzIG91dHB1dCBuZWVkcyB0byBiZSBzZXQgaW4gTU1TWVMuDQo+ICAgKiBAY2xvY2tl
ZF9ieV9oZG1pOiBIRE1JIElQIG91dHB1dHMgY2xvY2sgdG8gZHBpX3BpeGVsX2NsayBpbnB1dCBj
bG9jaywgbmVlZGVkDQo+ICAgKiAgICAgICAgICAgICAgICAgIGZvciBEUEkgcmVnaXN0ZXJzIGFj
Y2Vzcy4NCj4gKyAqIEBvdXRwdXRfMXBpeGVsOiBFbmFibGUgb3V0cHV0dGluZyBvbmUgcGl4ZWwg
cGVyIHJvdW5kOyBpZiB0aGUgaW5wdXQgaXMgdHdvIHBpeGVsIHBlcg0KPiArICogICAgICAgICAg
ICAgICAgIHJvdW5kLCB0aGUgRFBJIGhhcmR3YXJlIHdpbGwgaW50ZXJuYWxseSB0cmFuc2Zvcm0g
aXQgdG8gMVQxUC4NCj4gICAqLw0KPiAgc3RydWN0IG10a19kcGlfY29uZiB7DQo+ICAgICAgICAg
Y29uc3Qgc3RydWN0IG10a19kcGlfZmFjdG9yICpkcGlfZmFjdG9yOw0KPiBAQCAtMTcwLDYgKzE3
Miw3IEBAIHN0cnVjdCBtdGtfZHBpX2NvbmYgew0KPiAgICAgICAgIHUzMiBwaXhlbHNfcGVyX2l0
ZXI7DQo+ICAgICAgICAgYm9vbCBlZGdlX2NmZ19pbl9tbXN5czsNCj4gICAgICAgICBib29sIGNs
b2NrZWRfYnlfaGRtaTsNCj4gKyAgICAgICBib29sIG91dHB1dF8xcGl4ZWw7DQo+ICB9Ow0KPiAN
Cj4gIHN0YXRpYyB2b2lkIG10a19kcGlfbWFzayhzdHJ1Y3QgbXRrX2RwaSAqZHBpLCB1MzIgb2Zm
c2V0LCB1MzIgdmFsLCB1MzIgbWFzaykNCj4gQEAgLTY1NSw3ICs2NTgsMTMgQEAgc3RhdGljIGlu
dCBtdGtfZHBpX3NldF9kaXNwbGF5X21vZGUoc3RydWN0IG10a19kcGkgKmRwaSwNCj4gICAgICAg
ICBpZiAoZHBpLT5jb25mLT5zdXBwb3J0X2RpcmVjdF9waW4pIHsNCj4gICAgICAgICAgICAgICAg
IG10a19kcGlfY29uZmlnX3ljX21hcChkcGksIGRwaS0+eWNfbWFwKTsNCj4gICAgICAgICAgICAg
ICAgIG10a19kcGlfY29uZmlnXzJuX2hfZnJlKGRwaSk7DQo+IC0gICAgICAgICAgICAgICBtdGtf
ZHBpX2R1YWxfZWRnZShkcGkpOw0KPiArDQo+ICsgICAgICAgICAgICAgICAvKiBEUEkgY2FuIGNv
bm5lY3QgdG8gZWl0aGVyIGFuIGV4dGVybmFsIGJyaWRnZSBvciB0aGUgaW50ZXJuYWwgSERNSSBl
bmNvZGVyICovDQo+ICsgICAgICAgICAgICAgICBpZiAoZHBpLT5jb25mLT5vdXRwdXRfMXBpeGVs
KQ0KPiArICAgICAgICAgICAgICAgICAgICAgICBtdGtfZHBpX21hc2soZHBpLCBEUElfQ09OLCBE
UElfT1VUUFVUXzFUMVBfRU4sIERQSV9PVVRQVVRfMVQxUF9FTik7DQo+ICsgICAgICAgICAgICAg
ICBlbHNlDQo+ICsgICAgICAgICAgICAgICAgICAgICAgIG10a19kcGlfZHVhbF9lZGdlKGRwaSk7
DQo+ICsNCj4gICAgICAgICAgICAgICAgIG10a19kcGlfY29uZmlnX2Rpc2FibGVfZWRnZShkcGkp
Ow0KPiAgICAgICAgIH0NCj4gICAgICAgICBpZiAoZHBpLT5jb25mLT5pbnB1dF8ycF9lbl9iaXQg
JiYgZHBpLT5jb25mLT5pbnB1dF8ycGl4ZWwpIHsNCj4gLS0NCj4gMi40OC4xDQo+IA0KDQo=

--__=_Part_Boundary_005_375785083.1917062918
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1R1ZSwmIzMyOzIwMjUtMDItMTEmIzMyO2F0
JiMzMjsxMjozMyYjMzI7KzAxMDAsJiMzMjtBbmdlbG9HaW9hY2NoaW5vJiMzMjtEZWwmIzMyO1Jl
Z25vJiMzMjt3cm90ZToNCiZndDsmIzMyO0V4dGVybmFsJiMzMjtlbWFpbCYjMzI7OiYjMzI7UGxl
YXNlJiMzMjtkbyYjMzI7bm90JiMzMjtjbGljayYjMzI7bGlua3MmIzMyO29yJiMzMjtvcGVuJiMz
MjthdHRhY2htZW50cyYjMzI7dW50aWwmIzMyO3lvdSYjMzI7aGF2ZSYjMzI7dmVyaWZpZWQmIzMy
O3RoZSYjMzI7c2VuZGVyJiMzMjtvciYjMzI7dGhlJiMzMjtjb250ZW50Lg0KJmd0OyYjMzI7DQom
Z3Q7JiMzMjsNCiZndDsmIzMyO09uJiMzMjtzb21lJiMzMjtTb0NzLCYjMzI7bGlrZSYjMzI7TVQ4
MTk1JiMzMjthbmQmIzMyO01UODE4OCwmIzMyO3RoZSYjMzI7RFBJJiMzOTtzJiMzMjtGSUZPJiMz
Mjtjb250cm9sbGVyDQomZ3Q7JiMzMjsoYWZpZm8pJiMzMjtzdXBwb3J0cyYjMzI7b3V0cHV0dGlu
ZyYjMzI7ZWl0aGVyJiMzMjtvbmUmIzMyO29yJiMzMjt0d28mIzMyO3BpeGVscyYjMzI7cGVyJiMz
Mjtyb3VuZA0KJmd0OyYjMzI7cmVnYXJkbGVzcyYjMzI7b2YmIzMyO3RoZSYjMzI7aW5wdXQmIzMy
O2JlaW5nJiMzMjsxVDFQJiMzMjtvciYjMzI7MVQyUC4NCiZndDsmIzMyOw0KJmd0OyYjMzI7QWRk
JiMzMjthJiMzMjsmIzk2O291dHB1dF8xcGl4ZWwmIzk2OyYjMzI7bWVtYmVyJiMzMjt0byYjMzI7
c3RydWN0JiMzMjttdGtfZHBpX2NvbmYmIzMyO3doaWNoLCYjMzI7aWYNCiZndDsmIzMyO3NldCwm
IzMyO3dpbGwmIzMyO2VuYWJsZSYjMzI7b3V0cHV0dGluZyYjMzI7b25lJiMzMjtwaXhlbCYjMzI7
cGVyJiMzMjtjbG9jay4NCiZndDsmIzMyOw0KJmd0OyYjMzI7SW4mIzMyO2Nhc2UmIzMyO3RoZSYj
MzI7aW5wdXQmIzMyO2lzJiMzMjt0d28mIzMyO3BpeGVsJiMzMjtwZXImIzMyO2Nsb2NrJiMzMjso
MVQyUCksJiMzMjt0aGUmIzMyO0FGSUZPJiMzMjtIVw0KJmd0OyYjMzI7d2lsbCYjMzI7YXV0b21h
dGljYWxseSYjMzI7KGFuZCYjMzI7aW50ZXJuYWxseSkmIzMyO2NvbnZlcnQmIzMyO2l0JiMzMjt0
byYjMzI7MVQxUC4NCg0KUmV2aWV3ZWQtYnk6JiMzMjtDSyYjMzI7SHUmIzMyOyZsdDtjay5odUBt
ZWRpYXRlay5jb20mZ3Q7DQoNCiZndDsmIzMyOw0KJmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMy
O0FuZ2Vsb0dpb2FjY2hpbm8mIzMyO0RlbCYjMzI7UmVnbm8mIzMyOyZsdDthbmdlbG9naW9hY2No
aW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20mZ3Q7DQomZ3Q7JiMzMjstLS0NCiZndDsmIzMyOyYj
MzI7ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYyYjMzI7fCYjMzI7MTEmIzMyOysr
KysrKysrKystDQomZ3Q7JiMzMjsmIzMyOzEmIzMyO2ZpbGUmIzMyO2NoYW5nZWQsJiMzMjsxMCYj
MzI7aW5zZXJ0aW9ucygrKSwmIzMyOzEmIzMyO2RlbGV0aW9uKC0pDQomZ3Q7JiMzMjsNCiZndDsm
IzMyO2RpZmYmIzMyOy0tZ2l0JiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBp
LmMmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYw0KJmd0OyYjMzI7aW5k
ZXgmIzMyOzY0OTNjN2UyZmFlNC4uNWMxNWM4OTM1OTE2JiMzMjsxMDA2NDQNCiZndDsmIzMyOy0t
LSYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jDQomZ3Q7JiMzMjsrKysm
IzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYw0KJmd0OyYjMzI7QEAmIzMy
Oy0xNDgsNiYjMzI7KzE0OCw4JiMzMjtAQCYjMzI7c3RydWN0JiMzMjttdGtfZHBpX2ZhY3RvciYj
MzI7ew0KJmd0OyYjMzI7JiMzMjsmIzMyOyomIzMyO0BlZGdlX2NmZ19pbl9tbXN5czomIzMyO0lm
JiMzMjt0aGUmIzMyO2VkZ2UmIzMyO2NvbmZpZ3VyYXRpb24mIzMyO2ZvciYjMzI7RFBJJiMzOTtz
JiMzMjtvdXRwdXQmIzMyO25lZWRzJiMzMjt0byYjMzI7YmUmIzMyO3NldCYjMzI7aW4mIzMyO01N
U1lTLg0KJmd0OyYjMzI7JiMzMjsmIzMyOyomIzMyO0BjbG9ja2VkX2J5X2hkbWk6JiMzMjtIRE1J
JiMzMjtJUCYjMzI7b3V0cHV0cyYjMzI7Y2xvY2smIzMyO3RvJiMzMjtkcGlfcGl4ZWxfY2xrJiMz
MjtpbnB1dCYjMzI7Y2xvY2ssJiMzMjtuZWVkZWQNCiZndDsmIzMyOyYjMzI7JiMzMjsqJiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7Zm9yJiMzMjtEUEkmIzMyO3JlZ2lzdGVycyYjMzI7
YWNjZXNzLg0KJmd0OyYjMzI7KyYjMzI7KiYjMzI7QG91dHB1dF8xcGl4ZWw6JiMzMjtFbmFibGUm
IzMyO291dHB1dHRpbmcmIzMyO29uZSYjMzI7cGl4ZWwmIzMyO3BlciYjMzI7cm91bmQ7JiMzMjtp
ZiYjMzI7dGhlJiMzMjtpbnB1dCYjMzI7aXMmIzMyO3R3byYjMzI7cGl4ZWwmIzMyO3Blcg0KJmd0
OyYjMzI7KyYjMzI7KiYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtyb3VuZCwmIzMyO3RoZSYj
MzI7RFBJJiMzMjtoYXJkd2FyZSYjMzI7d2lsbCYjMzI7aW50ZXJuYWxseSYjMzI7dHJhbnNmb3Jt
JiMzMjtpdCYjMzI7dG8mIzMyOzFUMVAuDQomZ3Q7JiMzMjsmIzMyOyYjMzI7Ki8NCiZndDsmIzMy
OyYjMzI7c3RydWN0JiMzMjttdGtfZHBpX2NvbmYmIzMyO3sNCiZndDsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtjb25zdCYjMzI7c3RydWN0JiMzMjttdGtfZHBp
X2ZhY3RvciYjMzI7KmRwaV9mYWN0b3I7DQomZ3Q7JiMzMjtAQCYjMzI7LTE3MCw2JiMzMjsrMTcy
LDcmIzMyO0BAJiMzMjtzdHJ1Y3QmIzMyO210a19kcGlfY29uZiYjMzI7ew0KJmd0OyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3UzMiYjMzI7cGl4ZWxzX3Blcl9p
dGVyOw0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO2Jv
b2wmIzMyO2VkZ2VfY2ZnX2luX21tc3lzOw0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyO2Jvb2wmIzMyO2Nsb2NrZWRfYnlfaGRtaTsNCiZndDsmIzMyOysm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO2Jvb2wmIzMyO291dHB1dF8xcGl4ZWw7
DQomZ3Q7JiMzMjsmIzMyO307DQomZ3Q7JiMzMjsNCiZndDsmIzMyOyYjMzI7c3RhdGljJiMzMjt2
b2lkJiMzMjttdGtfZHBpX21hc2soc3RydWN0JiMzMjttdGtfZHBpJiMzMjsqZHBpLCYjMzI7dTMy
JiMzMjtvZmZzZXQsJiMzMjt1MzImIzMyO3ZhbCwmIzMyO3UzMiYjMzI7bWFzaykNCiZndDsmIzMy
O0BAJiMzMjstNjU1LDcmIzMyOys2NTgsMTMmIzMyO0BAJiMzMjtzdGF0aWMmIzMyO2ludCYjMzI7
bXRrX2RwaV9zZXRfZGlzcGxheV9tb2RlKHN0cnVjdCYjMzI7bXRrX2RwaSYjMzI7KmRwaSwNCiZn
dDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtpZiYjMzI7KGRw
aS0mZ3Q7Y29uZi0mZ3Q7c3VwcG9ydF9kaXJlY3RfcGluKSYjMzI7ew0KJmd0OyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjttdGtfZHBpX2NvbmZpZ195Y19tYXAoZHBpLCYjMzI7ZHBpLSZndDt5
Y19tYXApOw0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjttdGtfZHBpX2NvbmZpZ18y
bl9oX2ZyZShkcGkpOw0KJmd0OyYjMzI7LSYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO210a19kcGlfZHVhbF9l
ZGdlKGRwaSk7DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7LyomIzMy
O0RQSSYjMzI7Y2FuJiMzMjtjb25uZWN0JiMzMjt0byYjMzI7ZWl0aGVyJiMzMjthbiYjMzI7ZXh0
ZXJuYWwmIzMyO2JyaWRnZSYjMzI7b3ImIzMyO3RoZSYjMzI7aW50ZXJuYWwmIzMyO0hETUkmIzMy
O2VuY29kZXImIzMyOyovDQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7aWYmIzMyOyhkcGkt
Jmd0O2NvbmYtJmd0O291dHB1dF8xcGl4ZWwpDQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO210a19kcGlfbWFzayhkcGks
JiMzMjtEUElfQ09OLCYjMzI7RFBJX09VVFBVVF8xVDFQX0VOLCYjMzI7RFBJX09VVFBVVF8xVDFQ
X0VOKTsNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtlbHNlDQomZ3Q7JiMzMjsrJiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO210a19k
cGlfZHVhbF9lZGdlKGRwaSk7DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyO210a19kcGlfY29uZmlnX2Rpc2FibGVfZWRnZShkcGkpOw0KJmd0OyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO30NCiZndDsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtpZiYjMzI7KGRwaS0mZ3Q7Y29uZi0mZ3Q7aW5w
dXRfMnBfZW5fYml0JiMzMjsmYW1wOyZhbXA7JiMzMjtkcGktJmd0O2NvbmYtJmd0O2lucHV0XzJw
aXhlbCkmIzMyO3sNCiZndDsmIzMyOy0tDQomZ3Q7JiMzMjsyLjQ4LjENCiZndDsmIzMyOw0KDQoN
CjwvcHJlPg0KPC9wPjwvYm9keT48L2h0bWw+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4q
KioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioq
KioqKioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2Fn
ZSAoaW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9w
cmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJl
IHVuZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBv
bmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlv
biwgDQpkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlz
IGUtbWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lw
aWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYg
eW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxp
ZXZlIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNl
IG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1t
YWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRp
bmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9z
ZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5
b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_005_375785083.1917062918--

