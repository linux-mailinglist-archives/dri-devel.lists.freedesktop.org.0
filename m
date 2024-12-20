Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEDE9F8BF3
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 06:45:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 724ED10EEBC;
	Fri, 20 Dec 2024 05:45:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="WAuSBfS7";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="k8jCn7kj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2662C10EEBC
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 05:45:08 +0000 (UTC)
X-UUID: 8e98fb56be9511ef99858b75a2457dd9-20241220
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=TQmtTpTQK4W6EA4rpQ/wkCt19Jto5bf60ji6QRSNw6w=; 
 b=WAuSBfS75n71yiWTaF43QWDNYdx2oSPlFx7gl08zNgsy194UEDUHcxo8ZjGNvSNJVxg9WIdOk7VW41yECE3cnS8QiiC12DnWoWFpLvWJsI0E9eUQtLQv0Onse16iORzRxe9zViBmRpfNZ9wg+cBVASlmKhJ6wIrh9M33CtzzL9g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45, REQID:e0fcc5b0-54e6-44ca-9038-43744261aedb, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6493067, CLOUDID:502b937a-6daa-4219-9f98-4ca1647dcd95,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
 :-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
 A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 8e98fb56be9511ef99858b75a2457dd9-20241220
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 952300253; Fri, 20 Dec 2024 13:45:02 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 20 Dec 2024 13:45:01 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 20 Dec 2024 13:45:01 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C56oGc+A8j4GQ4YmfcmpfgmLD6KBS8r4zezzysi/KjBK7GLcJp/W0L8wTAUupqDUID1Ym2B4ecCPc+7VrDLE6NymzdXuI518fyng/ymTeoPsAxqRNiqXTRXO8NXk+4V0q4HAoLMaoC8iH+p5EMFUrgM0ydFOzLoEKAHmB+KQY+dS5b9B2pdSdb/rPLSItmbV5CWNxFXXsXdvEZBpn1GSm0IoRferC/uzKcGCrAFShPv9XT9pvZY09DxQEBbKUOx5DKMNcZ9XVQTyvuveFS2QdIKMrgyrq8xhwCz5NTzHoytAg9I/uQaTgOCt2sKJPXaZM5dwVbtTzEV7nNpuykUWYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9vVf51Q31YYrat4WwEpyxgrJqIHT50rRKH0YJvXR5j8=;
 b=UdwLv6/3dqYgh4wrD6T8k/NpyUaywkfiPP8AYCmsrGE9gPi3qysQaKdasV9kly43l0PmGMfvKOGELRvZdJb1OjWQCl6ADdjQFwZhpktU/WUuOSl7DJ3OuxJeAv1Pxuk9HWfPP4OehD3T1+93ZALqu2+sWAxa1w+iRNehxi+sWN7xPFE7RbKVXCErHC2pvHk633AeVuaBij/CYXv2fOv8mCNmmdwh28QQqIBTyymHXcznATSjABVhEJTnyJXs6Qw0ShelEMgv0HsRlX6xU12D8QZYd5yTv/XlD/WqsHvVBOU0D6E/tltOQKn9MNg7W+hgbZeaI9B6u24C1k4nspigAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9vVf51Q31YYrat4WwEpyxgrJqIHT50rRKH0YJvXR5j8=;
 b=k8jCn7kjHQudSv4YpdaAUDiT1s0hkEfJh2YnlvHPz9dHk+x8I4VnoWSsofs2s65DMsO3nWcuOrNk+AGxtQOwXpoT6RUHLNWlGRdJnsgjiHmgV1HyO2KpE6+8svw3udRblS1eGjc/3ZrHb2bG+5vz35NuGUnHsTttDamfyJzWJC0=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TY0PR03MB6982.apcprd03.prod.outlook.com (2603:1096:400:276::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.20; Fri, 20 Dec
 2024 05:44:58 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8251.015; Fri, 20 Dec 2024
 05:44:58 +0000
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
Subject: Re: [PATCH v3 17/33] drm/mediatek: mtk_hdmi: Move N/CTS setting to
 new function
Thread-Topic: [PATCH v3 17/33] drm/mediatek: mtk_hdmi: Move N/CTS setting to
 new function
Thread-Index: AQHbUJqptdTfkVQA/kqaxQQUQ99orLLuo2YA
Date: Fri, 20 Dec 2024 05:44:58 +0000
Message-ID: <cdbb4c9e1d4c69fad7f716db48f207e454a081ef.camel@mediatek.com>
References: <20241217154345.276919-1-angelogioacchino.delregno@collabora.com>
 <20241217154345.276919-18-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20241217154345.276919-18-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TY0PR03MB6982:EE_
x-ms-office365-filtering-correlation-id: 55ddad1e-2f2a-45a7-1ef9-08dd20b9709d
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?OEgzWCs5ekgyVHJURVZsS2w5cDBob2RPalVYbktaSDQvaGxESndjM3Nsa3JW?=
 =?utf-8?B?RTRTN1F2TEpDNk1wdHZsZTVUdUtlNXBFUDhsekVRczBZMUh2RlE4UGFtSHJz?=
 =?utf-8?B?dytBMjh2dnN6TVh6ajhoa3ZHdFV3RXJHeU5qM2V4dHdPRnh1OHJrUHNzbVhD?=
 =?utf-8?B?ZmhmYllXVXdxRndLcFVrRUlMd01VTmVxUjdiUzNHMm51cldvS2JBUnZkRnFa?=
 =?utf-8?B?dDZUT3hCOE5YUzFxYURTMUR3RHZpUFFEdGZPWkZnN1ZhS1MzQXIyaXNQR29G?=
 =?utf-8?B?bTFtenhaaXNZSUtMVldndWxTSU1hWlpQb20vekY2SkZqdzVzWDlzTnBCeVhS?=
 =?utf-8?B?d2tmbDZWdXVRcmI3K0MybEtiZktub1RIVDg1TE5ZZ0hBUFBwYVVuaGp3UlBO?=
 =?utf-8?B?RkN0UjFLRm5NRFh1Y3F2SnJzTEk5TWlaNmY2TzhPUTNucFB3bVFvcFFjUHVX?=
 =?utf-8?B?VUxrZDJCK0krOFFNclVJRmE1OWxtRVlYQWFOYlliS0E1M1hYL1V0RmlUNlZY?=
 =?utf-8?B?ZGNoNVBVMXNMZ3JOeEdXSWZ0NnV3V2VqcXFLSzB6b3ZpSjlUSENxcnZTd0hJ?=
 =?utf-8?B?bldQOElPYzZVRjVvbWZJYzJBZTNvVHFrODhVc3NpeXFIOEgyNUNITTJJS1No?=
 =?utf-8?B?cS9JbzlaRmQxOXFySWZGNXpJN3M0R0Z5dXNvZUdhOU5PSE80VFZKa1VndVlj?=
 =?utf-8?B?R3lPUEpPNkJxRmJoZnpMUU9wMWtFNkUxQkdWb3hxNGJrRFdJMWxDa0hlYjBq?=
 =?utf-8?B?THptSktadkROOEthMTNDNG1DLzcrR0ttZFRhYnJCRUZsRGliR2JaYXg1cGtr?=
 =?utf-8?B?RkswV3Z0STBENXBiR0MxSW9yZEE4d1dOdC92TTk4ZHQ2YVhETjdIK3ZETm9K?=
 =?utf-8?B?eHUyN3FXMVRCV0pGaDlweTZmUUdGUXVKREFmM0twQVJaeGFHWWZ4Ty8xTFpy?=
 =?utf-8?B?WmM3ZE9sM1krOG80Y3Z4TTNhWGl6YTkwYm9CUm5TcHJtM1JJVnpZam9zY0Fo?=
 =?utf-8?B?RnBKcTdYb2VjYzdRVW5XVkNaVDBhek9ZZTFjTlRYYnJlcE1iZVVmQ1lxYWht?=
 =?utf-8?B?MEh3UXdIM3NwUnVTdW90UGVGTmdnUlY3bExZNGNqWm04azRrNW9sWkpZTlNx?=
 =?utf-8?B?Y3VUaUFSRE1peVFFUFBYNUN3SFQ5Sy9BWDhKL1dBRWpXcEVPVFpxdUQxbDMr?=
 =?utf-8?B?K0lwNFV3a0JQakVLS1dkM0p1a1hLNUQzdWNVK3dTSmFhSUkvT2JES1A4Wmho?=
 =?utf-8?B?K2t6bDUvbVpTTGZVcmRTdWVobWt1SmJkZW82TUJxQStWcnNDeGE4aFJZSnBm?=
 =?utf-8?B?NTMwTkFnaEp4RXB1Uk5BV3VXMHltTE9QTEc4bGx6Y0lnaXpXeXVTajl2QWZZ?=
 =?utf-8?B?SVREMlZ2VU9KQ1hhMmkvazNML1BJd1pGL2FCbnUvMjNRUGozS1Z1cGFxcmk1?=
 =?utf-8?B?RmlNMWpnYTllR3B4S3FHUmVHZERyNnl6TDFwbktzcjQ0cDJVaE9GbjF6RnBo?=
 =?utf-8?B?UlRTYTdxRE45aXkycXRhM3BFTU9iOHpHVmkzRERNbTdrVDJud2FqN2hMa092?=
 =?utf-8?B?Q2JsZUNsaFdydjNkczhLYVdST1hLT080RnZKRHZXWEhvWXI0dndTNEdiS0w5?=
 =?utf-8?B?b01JR3FESnJCOWhLVkx2TmpmVXlxUmFnb3g2cUpGZXJjb2J3RFdWOHlpTFAx?=
 =?utf-8?B?azdUSEVyZkdsOUx6eFh2N1M5blh1Y1lSMWJDOFZIRHlxNWpJUk1sTy9EdEFG?=
 =?utf-8?B?aWtVMm5DOEFHZFFubkdnWjJMREFxeGptbU5ndkViMCtsVVF2Vks5MktQcDZj?=
 =?utf-8?B?UVU2dDBDOGkvOEY3Um5kU1BMVVFFSlVhWWY0M1pSbkpyNFNCTkZDd1kyWmJU?=
 =?utf-8?B?QnViejhHNHQ4MGVHc0hrTVhlMHp2MGRXUjN3OVphVDdKaWZtTTFmd21YRnpL?=
 =?utf-8?Q?rEc6zGBS/wu/KIeJI4nXHeUODUgBVnx2?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L3d1SmZ1MU0yK1JCcGVkd01tUmxQdEM4cjhFeitRK0VHZ2VibERKVmlsYnJj?=
 =?utf-8?B?L3BhMGdzN0I3UmVDZi91YS81VEpHb3EyUTlwcUNUbklvU0trdkJ5SmlNRXNp?=
 =?utf-8?B?Rm8yWTBJdG53anhsT2NFY0dmZUtyUHdPVGg3OVFSK0ZQWkVLZEZXa1dkQnJ2?=
 =?utf-8?B?SktnUktEWDJSZVJnYVdCZC9DM2JmZk4vUG00N0JWUmZhaUs5NHNkOXFqSVU4?=
 =?utf-8?B?My9zNVl1Ykg1NzBCM0lBaE5xZmNteXEzM3c4aEROUk0zTHVNS0FyYkNaTnRz?=
 =?utf-8?B?YnVLajcwYWtqelp3T1AwNG9aaVVEUnBJa3lscTdLS1FFRjZBMHdhREFmcXhF?=
 =?utf-8?B?RXdHbkc4cFBsUEIyWFg3dUMwWkltTG1UK01DR1JBM1pTQ1FCZzhzWEhkeHpL?=
 =?utf-8?B?ODUxYlhwTFVWbk5SYkw0T0FqTld2eGlBK0lkNFNQWGgrMTN4NFAwY3JPRGlw?=
 =?utf-8?B?dzZLTUxXY2JUOXpGYU5sWXhpeXRrenlsNmNqdy9TQnkxS0c3RW1ETkJQaFpi?=
 =?utf-8?B?NlN2SjRodTBhMGR0U0Fka1hNRURXQ2llRGxIbUhKU3FHWmZITmhNTWhxVUpP?=
 =?utf-8?B?UUpmbmV6YWprL0U1SlFsOUxVMnJQMUEwdDBmUjVIQk5UOHRUZnVGRlFEdlE1?=
 =?utf-8?B?TFFhWjVXdTZzay9CaUtRdEpRcUJUOTl0WWlCWDEyOUJDWDFHVGZOVEtOU0hQ?=
 =?utf-8?B?czNxTVR3RzZXOGFsSkhIKzBXVWdWaGNENzJUV3VOK3hpcjY2Vm5sSjYvUk93?=
 =?utf-8?B?elhzSnF2VDF5KzhtUG5LWHI2aWRtNXlQUDdCVWQ4UDRmMmpKUThrdG53NHcx?=
 =?utf-8?B?UzY4d2hIZVdkSTV3VXUvNGMvTFB1bFZCMHplUStrell3cW5RQ2VIaDlCcG5o?=
 =?utf-8?B?Y1VHMGtyUmZaT0FiV0o2M2dndVlham52ajlZWGN2SjFWYVpZRmx0dXorUzFD?=
 =?utf-8?B?OUc1eHhlSjVUR28vR1d4NWYzT3RxZk5ZT21TZ0N6VDN6L2tDZUp2VWxuOXla?=
 =?utf-8?B?WU1TRDlDa01jdjF6NEIzeW9TZUxrVHYzVUVnYVZGUWNLb0lEYkorMWdGd3lq?=
 =?utf-8?B?dnpNa0p1RlpTVlE5K28vc1FoU1F3YXQ2azYwcW8wc1JUL0Nqckl4NTBGT0lD?=
 =?utf-8?B?U2krcWFET25VcEVxanZqeDlXYkp6WGZYTkxCVHNhNFdvZVg3UVpCMzkvdTZM?=
 =?utf-8?B?OVp6YzdRSHBjbWpnYkYxSWNJU1BZTE9oeUxRblZWM1ZEL2ovQ3BIYTNlUFp2?=
 =?utf-8?B?Y0xCYXFna25seDdvQlBac2FGZFJWbTZkT3dKOWRuS01BYnZjNnRtclVCTXJN?=
 =?utf-8?B?NGRJUy9LS2NmTFZSbVNiOElKdzVDa0lRd1NCZjVjOEthaGlXSjdsT2ZkcnVP?=
 =?utf-8?B?VVVCRnJHT2JaNk80dHdvVXhBZWFpMVdyOGdjVmQ0MEVuMzF6dTlmZ1Btb1JC?=
 =?utf-8?B?WVp6U1ZXM3cwNHFUdk82YUM4WEhUNFN5UElLMDNuRnBaeFJ1ZVBGd291M2cz?=
 =?utf-8?B?dk04T3dsUDJaSUVvSVJMSkVNNWR4aWVwQkZNWlZHQkVEbGxycjBkWGlJWk1y?=
 =?utf-8?B?RkZmdm0zLzE0RlY3cnpXcGdMcWF6d2hQQnlsUmRqK1I5clU1dk1kWE9RRE9I?=
 =?utf-8?B?ZGNGNjJEWGEvQndvSXR4cjBJZjBLVytoQmppT1E0MzdBZUIzYUhnck1uM3BK?=
 =?utf-8?B?MDVaVExvL1c5S1B1U0p3czZaY2xiNUh6dGpGcVhEbDdVR25EaC9XQXJSMDhU?=
 =?utf-8?B?MGlndGZYT2s1cG9LVVVwd080QnFRSnkrQkN4Rm0reEtGUFF0SGo3clBxczdX?=
 =?utf-8?B?c25oYTRqblR4em5PMk1VUWswVHNVekhqN0JzbFR3KzRyQWVxS3grbUlFbkF0?=
 =?utf-8?B?MkwxN0lyWjV2aXl1SmlhckZlWEdkMUo1VUpvR0NPaHo2OTl0amVIc0hPSWZ4?=
 =?utf-8?B?TC9KWGRxZVdMZVN2QTBBa1JidTA0Q0NzZTkwTit3MDY0VTRmSWZIWHozR1R0?=
 =?utf-8?B?ME1jZzAzckdyeEFRV2ZMYm90SkN1RnVtOE5xK3RDZ1JSa2VyR1h6YWFndEVH?=
 =?utf-8?B?U2lRS3A0NUZxaGhvMHZhbW03RVAreTJvWDFrMmNkbmFoWmJBNnhnSFowWmZq?=
 =?utf-8?B?aEhBVEMxWTFOVkRoamVZUmRHb0MvckJuS1BNUlVFVUMyN3oySEN2bENmTHI5?=
 =?utf-8?B?Zmc9PQ==?=
Content-ID: <B91AEBB2868BBE469B6B1A1DF968D25B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55ddad1e-2f2a-45a7-1ef9-08dd20b9709d
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2024 05:44:58.6446 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x0l+0360bVbWYxOmyz56r855WwRJqU/ZZ2AUQ52yVkwVCMpbUnVu4N8aYyWr3S5cviLCWGIbqFYU967PHCjgvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6982
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_003_819395324.1991312475"
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

--__=_Part_Boundary_003_819395324.1991312475
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEFuZ2VsbzoNCg0KT24gVHVlLCAyMDI0LTEyLTE3IGF0IDE2OjQzICswMTAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZp
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBJbiBwcmVwYXJhdGlvbiBm
b3Igc3BsaXR0aW5nIGNvbW1vbiBiaXRzIG9mIHRoaXMgZHJpdmVyLCBtb3ZpbmcNCj4gdGhlIGhk
bWlfcmVjX25fdGFibGUgc3RydWN0IGFycmF5LCBhbmQgdGhlIGhkbWlfcmVjb21tZW5kZWRfbigp
LA0KPiBoZG1pX21vZGVfY2xvY2tfdG9faHooKSwgaGRtaV9leHBlY3RlZF9jdHMoKSBmdW5jdGlv
bnMsIGFkZCBvbmUNCj4gZnVuY3Rpb24gY2FsbGVkIG10a19oZG1pX2dldF9uY3RzKCkgdGhhdCBz
ZXRzIGJvdGggTiBhbmQgQ1RTIGluDQo+IGEgc2luZ2xlIGNhbGwuDQoNClJldmlld2VkLWJ5OiBD
SyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPg0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyA8YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEu
Y29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jIHwgMTAg
KysrKysrKystLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hk
bWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jDQo+IGluZGV4IGY2MGM0
ZWZmZTkwNS4uZWY4ZGZjYjc3MzE4IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2hkbWkuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hk
bWkuYw0KPiBAQCAtNjgyLDYgKzY4MiwxMyBAQCBzdGF0aWMgdW5zaWduZWQgaW50IGhkbWlfZXhw
ZWN0ZWRfY3RzKHVuc2lnbmVkIGludCBhdWRpb19zYW1wbGVfcmF0ZSwNCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIDEyOCAqIGF1ZGlvX3NhbXBsZV9yYXRlKTsNCj4gIH0N
Cj4gDQo+ICtzdGF0aWMgdm9pZCBtdGtfaGRtaV9nZXRfbmN0cyh1bnNpZ25lZCBpbnQgc2FtcGxl
X3JhdGUsIHVuc2lnbmVkIGludCBjbG9jaywNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdW5zaWduZWQgaW50ICpuLCB1bnNpZ25lZCBpbnQgKmN0cykNCj4gK3sNCj4gKyAgICAgICAq
biA9IGhkbWlfcmVjb21tZW5kZWRfbihzYW1wbGVfcmF0ZSwgY2xvY2spOw0KPiArICAgICAgICpj
dHMgPSBoZG1pX2V4cGVjdGVkX2N0cyhzYW1wbGVfcmF0ZSwgY2xvY2ssICpuKTsNCj4gK30NCj4g
Kw0KPiAgc3RhdGljIHZvaWQgZG9faGRtaV9od19hdWRfc2V0X25jdHMoc3RydWN0IG10a19oZG1p
ICpoZG1pLCB1bnNpZ25lZCBpbnQgbiwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdW5zaWduZWQgaW50IGN0cykNCj4gIHsNCj4gQEAgLTcxMiw4ICs3MTksNyBAQCBzdGF0
aWMgdm9pZCBtdGtfaGRtaV9od19hdWRfc2V0X25jdHMoc3RydWN0IG10a19oZG1pICpoZG1pLA0K
PiAgew0KPiAgICAgICAgIHVuc2lnbmVkIGludCBuLCBjdHM7DQo+IA0KPiAtICAgICAgIG4gPSBo
ZG1pX3JlY29tbWVuZGVkX24oc2FtcGxlX3JhdGUsIGNsb2NrKTsNCj4gLSAgICAgICBjdHMgPSBo
ZG1pX2V4cGVjdGVkX2N0cyhzYW1wbGVfcmF0ZSwgY2xvY2ssIG4pOw0KPiArICAgICAgIG10a19o
ZG1pX2dldF9uY3RzKHNhbXBsZV9yYXRlLCBjbG9jaywgJm4sICZjdHMpOw0KPiANCj4gICAgICAg
ICBkZXZfZGJnKGhkbWktPmRldiwgIiVzOiBzYW1wbGVfcmF0ZT0ldSwgY2xvY2s9JWQsIGN0cz0l
dSwgbj0ldVxuIiwNCj4gICAgICAgICAgICAgICAgIF9fZnVuY19fLCBzYW1wbGVfcmF0ZSwgY2xv
Y2ssIG4sIGN0cyk7DQo+IC0tDQo+IDIuNDcuMA0KPiANCg0K

--__=_Part_Boundary_003_819395324.1991312475
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
JiMzMjtkcml2ZXIsJiMzMjttb3ZpbmcNCiZndDsmIzMyO3RoZSYjMzI7aGRtaV9yZWNfbl90YWJs
ZSYjMzI7c3RydWN0JiMzMjthcnJheSwmIzMyO2FuZCYjMzI7dGhlJiMzMjtoZG1pX3JlY29tbWVu
ZGVkX24oKSwNCiZndDsmIzMyO2hkbWlfbW9kZV9jbG9ja190b19oeigpLCYjMzI7aGRtaV9leHBl
Y3RlZF9jdHMoKSYjMzI7ZnVuY3Rpb25zLCYjMzI7YWRkJiMzMjtvbmUNCiZndDsmIzMyO2Z1bmN0
aW9uJiMzMjtjYWxsZWQmIzMyO210a19oZG1pX2dldF9uY3RzKCkmIzMyO3RoYXQmIzMyO3NldHMm
IzMyO2JvdGgmIzMyO04mIzMyO2FuZCYjMzI7Q1RTJiMzMjtpbg0KJmd0OyYjMzI7YSYjMzI7c2lu
Z2xlJiMzMjtjYWxsLg0KDQpSZXZpZXdlZC1ieTomIzMyO0NLJiMzMjtIdSYjMzI7Jmx0O2NrLmh1
QG1lZGlhdGVrLmNvbSZndDsNCg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtTaWduZWQtb2ZmLWJ5OiYj
MzI7QW5nZWxvR2lvYWNjaGlubyYjMzI7RGVsJiMzMjtSZWdubyYjMzI7Jmx0O2FuZ2Vsb2dpb2Fj
Y2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbSZndDsNCiZndDsmIzMyOy0tLQ0KJmd0OyYjMzI7
JiMzMjtkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYyYjMzI7fCYjMzI7MTAmIzMy
OysrKysrKysrLS0NCiZndDsmIzMyOyYjMzI7MSYjMzI7ZmlsZSYjMzI7Y2hhbmdlZCwmIzMyOzgm
IzMyO2luc2VydGlvbnMoKyksJiMzMjsyJiMzMjtkZWxldGlvbnMoLSkNCiZndDsmIzMyOw0KJmd0
OyYjMzI7ZGlmZiYjMzI7LS1naXQmIzMyO2EvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19o
ZG1pLmMmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMNCiZndDsmIzMy
O2luZGV4JiMzMjtmNjBjNGVmZmU5MDUuLmVmOGRmY2I3NzMxOCYjMzI7MTAwNjQ0DQomZ3Q7JiMz
MjstLS0mIzMyO2EvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMNCiZndDsmIzMy
OysrKyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYw0KJmd0OyYjMzI7
QEAmIzMyOy02ODIsNiYjMzI7KzY4MiwxMyYjMzI7QEAmIzMyO3N0YXRpYyYjMzI7dW5zaWduZWQm
IzMyO2ludCYjMzI7aGRtaV9leHBlY3RlZF9jdHModW5zaWduZWQmIzMyO2ludCYjMzI7YXVkaW9f
c2FtcGxlX3JhdGUsDQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOzEyOCYjMzI7KiYjMzI7YXVkaW9f
c2FtcGxlX3JhdGUpOw0KJmd0OyYjMzI7JiMzMjt9DQomZ3Q7JiMzMjsNCiZndDsmIzMyOytzdGF0
aWMmIzMyO3ZvaWQmIzMyO210a19oZG1pX2dldF9uY3RzKHVuc2lnbmVkJiMzMjtpbnQmIzMyO3Nh
bXBsZV9yYXRlLCYjMzI7dW5zaWduZWQmIzMyO2ludCYjMzI7Y2xvY2ssDQomZ3Q7JiMzMjsrJiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3Vuc2lnbmVkJiMzMjtpbnQmIzMyOypuLCYjMzI7
dW5zaWduZWQmIzMyO2ludCYjMzI7KmN0cykNCiZndDsmIzMyOyt7DQomZ3Q7JiMzMjsrJiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsqbiYjMzI7PSYjMzI7aGRtaV9yZWNvbW1lbmRl
ZF9uKHNhbXBsZV9yYXRlLCYjMzI7Y2xvY2spOw0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7KmN0cyYjMzI7PSYjMzI7aGRtaV9leHBlY3RlZF9jdHMoc2FtcGxl
X3JhdGUsJiMzMjtjbG9jaywmIzMyOypuKTsNCiZndDsmIzMyOyt9DQomZ3Q7JiMzMjsrDQomZ3Q7
JiMzMjsmIzMyO3N0YXRpYyYjMzI7dm9pZCYjMzI7ZG9faGRtaV9od19hdWRfc2V0X25jdHMoc3Ry
dWN0JiMzMjttdGtfaGRtaSYjMzI7KmhkbWksJiMzMjt1bnNpZ25lZCYjMzI7aW50JiMzMjtuLA0K
Jmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7dW5zaWduZWQmIzMyO2ludCYjMzI7Y3RzKQ0KJmd0OyYjMzI7JiMz
Mjt7DQomZ3Q7JiMzMjtAQCYjMzI7LTcxMiw4JiMzMjsrNzE5LDcmIzMyO0BAJiMzMjtzdGF0aWMm
IzMyO3ZvaWQmIzMyO210a19oZG1pX2h3X2F1ZF9zZXRfbmN0cyhzdHJ1Y3QmIzMyO210a19oZG1p
JiMzMjsqaGRtaSwNCiZndDsmIzMyOyYjMzI7ew0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyO3Vuc2lnbmVkJiMzMjtpbnQmIzMyO24sJiMzMjtjdHM7DQom
Z3Q7JiMzMjsNCiZndDsmIzMyOy0mIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO24m
IzMyOz0mIzMyO2hkbWlfcmVjb21tZW5kZWRfbihzYW1wbGVfcmF0ZSwmIzMyO2Nsb2NrKTsNCiZn
dDsmIzMyOy0mIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO2N0cyYjMzI7PSYjMzI7
aGRtaV9leHBlY3RlZF9jdHMoc2FtcGxlX3JhdGUsJiMzMjtjbG9jaywmIzMyO24pOw0KJmd0OyYj
MzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7bXRrX2hkbWlfZ2V0X25jdHMo
c2FtcGxlX3JhdGUsJiMzMjtjbG9jaywmIzMyOyZhbXA7biwmIzMyOyZhbXA7Y3RzKTsNCiZndDsm
IzMyOw0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO2Rl
dl9kYmcoaGRtaS0mZ3Q7ZGV2LCYjMzI7JnF1b3Q7JXM6JiMzMjtzYW1wbGVfcmF0ZT0ldSwmIzMy
O2Nsb2NrPSVkLCYjMzI7Y3RzPSV1LCYjMzI7bj0ldSYjOTI7biZxdW90OywNCiZndDsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7X19mdW5jX18sJiMzMjtzYW1wbGVfcmF0ZSwmIzMyO2Nsb2Nr
LCYjMzI7biwmIzMyO2N0cyk7DQomZ3Q7JiMzMjstLQ0KJmd0OyYjMzI7Mi40Ny4wDQomZ3Q7JiMz
MjsNCg0KDQo8L3ByZT4NCjwvcD48L2JvZHk+PC9odG1sPjwhLS10eXBlOnRleHQtLT48IS0tey0t
PjxwcmU+KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlICoqKioq
KioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWls
IG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlh
bCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlz
Y2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29u
dmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3Nl
bWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcg
b2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRl
ZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdm
dWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwg
b3IgYmVsaWV2ZSANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3Is
IHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0
aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAo
aW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0K
ZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4g
VGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_003_819395324.1991312475--

