Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 729C2A30154
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 03:14:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DF1010E2CD;
	Tue, 11 Feb 2025 02:14:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="QPx0pHaS";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="R5lqCMCf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16FB510E2CD
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 02:14:09 +0000 (UTC)
X-UUID: dcec68f4e81d11efb8f9918b5fc74e19-20250211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=x7WjIFR1uHAdnfj3hyidcSdf0IllGz/uoop1I6CnSPw=; 
 b=QPx0pHaScGunsM9Vh+vyPG1623zJ7llcDmf3wHxRvMnj76STx+uFowtWAR2LRFL5knD3i0pKQmmkMSCAoQtFbClElTIAgfkb9QhClT5xZap/zWjOYxUk4He9MP1njKKhuzvnYXVTpa3a0u7oeMm0dQrD9h87kYuThxoaMuPbmUw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46, REQID:9e114ffd-4253-4041-b828-59ac788ae80a, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:60aa074, CLOUDID:5bad249c-f55b-41e7-a712-ffbe7a973280,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
 EDM:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
 ,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: dcec68f4e81d11efb8f9918b5fc74e19-20250211
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1823778901; Tue, 11 Feb 2025 10:14:02 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 11 Feb 2025 10:14:01 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1258.28 via Frontend Transport; Tue, 11 Feb 2025 10:14:01 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ACQwb+RIRPiaYkFFUoMUX2AzycMyLX3gUs6m55XZclH2nvJJO1NxnmvsWYp2n40ZI6CAdxfXvbDBzqBST+JChlUeeR7n1ssNF3r0PL3nL+rJTpyfbPdY3d0VZ+clBEdLOpJNbs7H4D1NB8xHvqPjZPlgnw+Vr6RTJQ7I/yLPvDyYzgYDg/OefyC1uW11vAiXm1Id0HvGiWkMHELNm0OMbJieh0dddgIGSOHW2beugLqIzUyCd5DkvJMBdujgRcq4F+apTxXvQb3+6pVq72H3Kk8YjbQs1jtHtaDevEb9b7Ml87hCwg2mKfRdotogpDJvc5JThrk9wCEToIMr0K/iHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z9VXCU4sZs61E8Zy862z2TW6GLZ/wlQqxKNSM5gAYzc=;
 b=R8ElnnG2/FzX1ZXcIcNZyvbhmW5rqz/KRP8HumytUQo530AxjzphGvZIeL1crqxzSfmZ6Qd0YSaq/cdIKMXrlGWPbTL7/8aS7VX+D3GevfV4+e3r0pLvJ7/Yc2ZMTk2ztGoVxmjpHc/JnL0IFFCI8wsYOlPBI2SLKaW1KlqcMxb8uONCZhcKlyhXnMcIEU2svPGymZRn2io0t5e8Qux9v7ZkTp1BRJKXksFHEZ2PmEd/teBtPiCbkMpyLn06IOsMn/fYmjLV7Bx45V68OnRdsgdgaciQ4xqfopumISuTIt7Ax3ttGSo8J8Y2pTL3LErUuykowjfUBZ/T2Qmm9ke2qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z9VXCU4sZs61E8Zy862z2TW6GLZ/wlQqxKNSM5gAYzc=;
 b=R5lqCMCftRtBvg3RhR/UmJ2HkIyaexblXLuQbfZ2VbyDTzGRdpEO+RV3Wl/aa90l0pXgrrm+zr3BDZO4ioDadSCHcBVIKJ9CprtvjPyWgj6thYv4eb75jcXDgBWZ/Uui9i8/VTdrTuUDNpQpZjHFM1WShdMyBi+bfk2J9TzsjDY=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB6493.apcprd03.prod.outlook.com (2603:1096:400:1ca::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.16; Tue, 11 Feb
 2025 02:13:59 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 02:13:58 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "jie.qiu@mediatek.com"
 <jie.qiu@mediatek.com>, "kernel@collabora.com" <kernel@collabora.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "mripard@kernel.org"
 <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 =?utf-8?B?TGV3aXMgTGlhbyAo5buW5p+P6YieKQ==?= <Lewis.Liao@mediatek.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?=
 <jitao.shi@mediatek.com>, =?utf-8?B?VG9tbXlZTCBDaGVuICjpmbPlvaXoia8p?=
 <TommyYL.Chen@mediatek.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "airlied@gmail.com" <airlied@gmail.com>,
 =?utf-8?B?SXZlcyBDaGVuamggKOmZs+S/iuW8mCk=?= <Ives.Chenjh@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "junzhi.zhao@mediatek.com"
 <junzhi.zhao@mediatek.com>
Subject: Re: [PATCH v5 27/34] drm/mediatek: mtk_hdmi: Cleanup function
 mtk_hdmi_resume()
Thread-Topic: [PATCH v5 27/34] drm/mediatek: mtk_hdmi: Cleanup function
 mtk_hdmi_resume()
Thread-Index: AQHbZcr/gWWM2bti4UK/M/2kkSGki7M7gJoAgAUQHQCAAPjpgA==
Date: Tue, 11 Feb 2025 02:13:58 +0000
Message-ID: <3f9e69a72a98edfe4b764bb568a0fc5d571770f1.camel@mediatek.com>
References: <20250113145232.227674-1-angelogioacchino.delregno@collabora.com>
 <20250113145232.227674-28-angelogioacchino.delregno@collabora.com>
 <f25eaced46e18a54896f20ae1c42ed6894da5e18.camel@mediatek.com>
 <2fd97b1e-6546-4f43-bc60-15a812e66467@collabora.com>
In-Reply-To: <2fd97b1e-6546-4f43-bc60-15a812e66467@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB6493:EE_
x-ms-office365-filtering-correlation-id: 9394d23b-eb05-4cb0-5e79-08dd4a41be2d
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?YXhSSjBqc2lpVmVMVFJYZkhSejBJOVV5ckt1b0w3UGJoSHBBeUJiQjc0VVhV?=
 =?utf-8?B?TnhtajR3V04xVDArZlNUTVpvQUY0UzdvRXo0ZzJyQ00yNTI0Y0U4bC92RUtl?=
 =?utf-8?B?Q2VuWFpxSk1pK0ZGOGlOL0NVOVZKbHYwVEdNbXNENjFKU1FaUHBPSGxtS21W?=
 =?utf-8?B?UFpvK3ozai9OYzlseWJIUTg3WCtSM3FCSEthenZxcWI0UjNrbFliNTVXUklI?=
 =?utf-8?B?TzdJcWtPaTdrWjNaU0dPNmRvZGlGSDBPT1R5TjVaVTZOam0yZnVWa0Z2TWVn?=
 =?utf-8?B?N3dwRWF2a3FzUk9vNjNDWTdZR2RieU5GZnpNazNKRDMzOWE5TXpPKzBkYmlh?=
 =?utf-8?B?eHFVVFF5ZFVHdHlvcHVzdVE1cVF6Q3JwcVJyVjV5UUNrVUcrYnYzZ3lXT1RX?=
 =?utf-8?B?a3FNRFpsczN6dHp3WnZPckp2ZjJkeDRaNlJnbk4rZ1FpUUlESXFGMFB4UEdC?=
 =?utf-8?B?MVpidWI1YUY5MmhTVnZQVlJBOW1BNzFBa0M2c0FNQkxkWUh0bUo4NnZCUDZ1?=
 =?utf-8?B?REpITHlMdDRtVE9LdzlNOE9HN09MT20yUDd1UC84WW5Yc0t4RUJQSzU0dVU2?=
 =?utf-8?B?UVRLQnE3eU83K1l4N2ZLVTFtYnhGcEpWQWVLS0taaTJQb2V2d1l1M2RIbGxR?=
 =?utf-8?B?cjJEWC9xU2p2dnpTeThHcE9NN3Nxd2EzZUVUeDhwemYzUzh3THUxczZQQmdQ?=
 =?utf-8?B?WXhxaHk3NFpsZ3NIZFA3VXlNRHcyaDN5TmRIaC9tc3FCN1h1MWFIVmNpUSt0?=
 =?utf-8?B?aVc1c1lLd2J0Y3hFRGxWaks1d1lRSWQ1WmFNaFFSRFJEdmh1ZXhhcUEydWxp?=
 =?utf-8?B?Z3V5dXp5SlN1MFBmeWZ6c04wUVZCUzB3UzJaQmZwT2VKU3dNUEVZckEvdUJE?=
 =?utf-8?B?a2QyNkJoUnEvRGV4UXAxNVo4U2NtVTNzOC9YZlVDSWVSZXB2YVNGVHRxNm9y?=
 =?utf-8?B?YTNlNUExWTJBb3lFMHJxNTdiWTA0cDJzVzhHVzFtTGZsOVYzSnpxbTJIOGpS?=
 =?utf-8?B?cmxiM3JaYWdtNHIzNmpDTWExRmRjZDJ5WlphdjFTQyszOHFSY0c3bEdOam5z?=
 =?utf-8?B?T280cThCMGxDSjFaeVZZWWRmUHJLMldQcm9STzFTSkE5S3V2cFJwNzdmaHNy?=
 =?utf-8?B?MysyQVExVEJMQkQyd0tUWDJReW82L0dMQ0d2ZE9QOHA1MUpYc0o0a1hSSmNr?=
 =?utf-8?B?QUl4MGtDbUZRbExmTjRyNzcvSG9uNE1hUnpRVFdxZXREdGV3SVIxYVRlZkRz?=
 =?utf-8?B?YVpFSlA3ZVZYTHZmZVpQSktRWEZjMWNyWHA0WStUc3MvOStxM2kxcGNRdG9G?=
 =?utf-8?B?THlOSkNoMjF3dUcybnZDZ3lIYWQ2TGhGVDFPTmxSbExmUVJxd3lSYkJMb1Yw?=
 =?utf-8?B?dE5scFk4Zkt5cXprRlpXRHgwdFdRRUZoUGpzTmtVL1daY1VMLy9nc09FbkQw?=
 =?utf-8?B?WnFxaVVWMFIxRUxXczd5MVZ2V2xDb1NweXc5Mm8zbEJkaWRYSFJIMDdGcHVt?=
 =?utf-8?B?Mzl2MmFLNnE5eXJZelc4elJSZ0cvcWpGTUF5U0grckUxQWRsWG1KOTNPMjl0?=
 =?utf-8?B?THduUHNoZUpNVmc3TENFKzM3QzBYb2oxc0N4L0JscUpHengyVWgxVytubk5V?=
 =?utf-8?B?b0d6Z0txcW4yS0FITENCQ0FZdThtR2N4MEFDQ1lNZURNdlBvNk5QdHljRUxP?=
 =?utf-8?B?VTlmM2NaaTh0T1pERFplM005L0xOVjl3TjlJK2g1LzMyN3UwbHk4NVZzeVFS?=
 =?utf-8?B?UldBNEJlVjhJNDBQUWN5TkpWUFFuQ0tjODRTQnpWTU04UGFxTnVMcDVyMDFL?=
 =?utf-8?B?dEVXcDVkeDVyM1VYcXlyL2YwUnRlRmw1N202R0crMlRoNzJLN2FnVXNzZDAv?=
 =?utf-8?B?T0ZlODlmZHVZQzFaQ05ad0M0QW1VQ0FDUEVhcWxZTTU3eHBPNWZmYUFjTEYx?=
 =?utf-8?Q?1EShwWXWBTQbenlPwXXQfAaMCAGE47gx?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eXg2dDJSSm05aTJEOWJZYUd4cXB5a2J3ZGxHQnJaaTV6USs0ZDJ6Ny9Sc1NV?=
 =?utf-8?B?VFNnZWVaQXVuYlc3eTl3RVpHeUJ0b1FmS3pocWJZZTNYNEtOQTNrRVptaHUw?=
 =?utf-8?B?a0hKNngxZnU1SmY1RjZrZTYzeVIybGlEOG1mSzBUUDhDVGtlU29BZDh2QWNk?=
 =?utf-8?B?SlR1NHF5R2xlUzVFcHBGa052S1NUTnVqQmZzSXU3Mk9zNWxSU0s3dTVpTDdJ?=
 =?utf-8?B?UUZIWmFkTnY0UXdwY3J5Slk4S2pPcEFmKzNvMHJTMVNqVlc5Rm51K0NMZDVT?=
 =?utf-8?B?T3ZSdUx1VVBGRUNGV0dTMXVlR2xEUG95ei9hcWtqeVh6Z1VrL2o2U0krMGdG?=
 =?utf-8?B?YjBpK0ZZSGpCaHdrWFphYk9vaGxVV3ppSkRlRWtCa2hKSzVBWVI3am81WWE1?=
 =?utf-8?B?a3h0Q2Q1UVRHNXZuaXlIbTlKNmVXNFZZZzlpY2x3SDVoSmhPUHl4N1B2Q2dl?=
 =?utf-8?B?Tjlmc25rZVkybUZlTjRzb0JDbEhSNUlXdTF3THZOT2hqU2YwUm5SekI2bzBM?=
 =?utf-8?B?Q2RDY3BGejYyUUcycnQ3aS9NN3lCalkxbmpOck5ZckZhamxOZzFGWTRLeHo0?=
 =?utf-8?B?bjBTbDc0SW5ZaDZjZC92Qk1ta01tVlZDb0pHWWZLVHBXR2FFb1pTTlRZa0Ey?=
 =?utf-8?B?eXZHcWhHOElUeVBkK3NDd0JGdkNZazd0ZmlDTUFVUG4wZ1F2aDlvR3V3cDdG?=
 =?utf-8?B?cVErdG9DU1lQdjZlMmNHS2JFUm1hRHpidGNvVE1oS1c5NTlDYWJkSHpvcmtr?=
 =?utf-8?B?K1Z3VjVvT29ZTVNsejhrYXgvV3NINTVHMWc3VTNHVnlHb3o3bWExMDJzL0ts?=
 =?utf-8?B?WkVmb05peDg5d3VwdEJ6YkRlb0V1S0t3WlJUUXZZVTJIWitKaFkxL3BOWUVJ?=
 =?utf-8?B?TEltK2twRU5GM3VzZ0ZlQTZGQ2FmeGFOczlBdFVzOTBoT2VJMGhQUUx6SnJ3?=
 =?utf-8?B?WWpTemJid2NWZmZuL1k0UHpDV1lUT1JRV0NIQWlJNEQwNW9lZzVZd1Z1dDEz?=
 =?utf-8?B?RDFqeVluTVFmQWJLanNPSzJWQnV0S3c0VG9NekovK29ZOEVLWEhuZ2wrQ2ND?=
 =?utf-8?B?ZXl5Wmd3akhPUGlNQmh5NFpVTkIwZkltV2VHM0FFbCtYN1FzUXEzc3prSTZL?=
 =?utf-8?B?bFp1V1MwdEFCWSs2WGJTZ1VKdEJxUHNGaXMydzFsL21lNVc3NHZleFZjVUhC?=
 =?utf-8?B?RlJ5cndNamRnVE1yRGhjRUVIOWE5SmpZM2Y5bzJDL3JSZHFwR1R1UXg1b1Rx?=
 =?utf-8?B?WlM2MW5tcm41cVVGSVJGUDNrcGtnYmkyYVQrbGN5NkE0dFZUMGlLSUt1QlpR?=
 =?utf-8?B?d2JZSFZSMEUvbGU5RnZyekY2b3dxQytCUWhYZmowaFNIMkZEYmNUK3VwZkFp?=
 =?utf-8?B?aDNaakExc05nWHpQUFdQWE5RYVNOZk1WRkVNZlh4aFpTQ1MrdFVia3VxY1dF?=
 =?utf-8?B?bGUwbmFEZWtGOUF5S2JXZHNBT1dWcDk0RWRUZzNvMkpyUmZhaGc4bm02VS9T?=
 =?utf-8?B?VVkzYVo3dmRhTk50R3ZpKzN4Yk11dzJKeXk1V0ZyRFRFU3ZEQS9iM29YVUJD?=
 =?utf-8?B?TjJFNnVYZUVMMUhqSGk4WGtja3hFNWNQQ3ZXdVZTbktaajc5Q09KZi9HVVM2?=
 =?utf-8?B?MXkvZ1Q1bTlVY0FwSG81d1VPVk9IR0gyKzJMRzhMQ0FETFRjNnlUMHI0NTd2?=
 =?utf-8?B?RHZuT3BQd0MwTWFBa0taS09GWjJKNVFRcVhwUkp4VFdyTmF3NDMvSldTZ1ZS?=
 =?utf-8?B?QXhlL2FUc2dIU2pXa2VMUnIzL29DWHhORDJUZVNtQmtKTzJkamR2dC9SYlFX?=
 =?utf-8?B?WWVLZjJFZWxPSVBvaFc5YnVmRzRxMktKOWVZWmxaekE2U0lGZzFIMXB5ZHZq?=
 =?utf-8?B?OE9vWGhRbWRTVTVYOFgwT1g0TkVlMlZSWEtPamVnSVkwVlh6ell1U1lTY1V3?=
 =?utf-8?B?NjRVcERLRVFzSDVpTU5nRnpoV2M3S1haWmVVNk00aDdaSmc0UkFOMEJqMDFK?=
 =?utf-8?B?aHpMdUtEV3VmNTM4YWJKekE2NlIrVm9lbUxTN1JYNytlaGdNQ3c3NEZNQWxP?=
 =?utf-8?B?NTYxcm5YWWw0M0J4SFVMM3dQUXBwbkM4T0EzOUpMWGZJYlR0M1luM3VweC8r?=
 =?utf-8?Q?Ia2UQMLuKsudFxQitEENG9M96?=
Content-ID: <5254B02D0AE70D4BA40B8145DCC2E750@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9394d23b-eb05-4cb0-5e79-08dd4a41be2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2025 02:13:58.0323 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H1q0YmYpL2xdxBKgbaeWUExBgPZWSAQiolXxZG2L1+OtzpBNLgbozSoQMBhFoUFFgmj7HZSJ8c4p5HhSDcbieQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6493
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_005_1222007744.1042950334"
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

--__=_Part_Boundary_005_1222007744.1042950334
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDI1LTAyLTEwIGF0IDEyOjIzICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBv
ciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBJbCAwNy8wMi8yNSAwNzowNCwgQ0sgSHUgKOiDoeS/
iuWFiSkgaGEgc2NyaXR0bzoNCj4gPiBIaSwgQW5nZWxvOg0KPiA+IA0KPiA+IE9uIE1vbiwgMjAy
NS0wMS0xMyBhdCAxNTo1MiArMDEwMCwgQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gd3JvdGU6
DQo+ID4gPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbCB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBj
b250ZW50Lg0KPiA+ID4gDQo+ID4gPiANCj4gPiA+IFJlbW92ZSB0aGUgZXJyb3IgcHJpbnQgaW4g
Y2FzZSBvZiBtdGtfaGRtaV9jbGtfZW5hYmxlX2F1ZGlvKCkNCj4gPiA+IGZhaWx1cmVzOiBzaW5j
ZSB0aGUgQVBJcyB3aWxsIGFscmVhZHkgcHJpbnQgb24gdGhlaXIgb3duLCBoYXZpbmcNCj4gPiA+
IG9uZSBpbiB0aGVyZSBpcyByZWR1bmRhbnQuDQo+ID4gPiANCj4gPiA+IFNpZ25lZC1vZmYtYnk6
IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNv
bGxhYm9yYS5jb20+DQo+ID4gPiAtLS0NCj4gPiA+ICAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19oZG1pLmMgfCA5ICstLS0tLS0tLQ0KPiA+ID4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDggZGVsZXRpb25zKC0pDQo+ID4gPiANCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfaGRtaS5jDQo+ID4gPiBpbmRleCA0MGVlYTVjMTI1ZDIuLmM1NDMxZjE2MGZlNCAxMDA2
NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jDQo+ID4g
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYw0KPiA+ID4gQEAgLTE3
MDMsMTUgKzE3MDMsOCBAQCBzdGF0aWMgX19tYXliZV91bnVzZWQgaW50IG10a19oZG1pX3N1c3Bl
bmQoc3RydWN0IGRldmljZSAqZGV2KQ0KPiA+ID4gICBzdGF0aWMgX19tYXliZV91bnVzZWQgaW50
IG10a19oZG1pX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ID4gPiAgIHsNCj4gPiA+ICAg
ICAgICAgIHN0cnVjdCBtdGtfaGRtaSAqaGRtaSA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOw0KPiA+
ID4gLSAgICAgICBpbnQgcmV0ID0gMDsNCj4gPiA+IA0KPiA+ID4gLSAgICAgICByZXQgPSBtdGtf
aGRtaV9jbGtfZW5hYmxlX2F1ZGlvKGhkbWkpOw0KPiA+IA0KPiA+IEkgZG8gbm90IGZpbmQgd2hl
cmUgdG8gcHJpbnQgdGhlIGVycm9yIG1lc3NhZ2UsIGNvdWxkIHlvdSBwcm92aWRlIHdoZXJlIHdv
dWxkIHByaW50IHRoZSBlcnJvciBtZXNzYWdlPw0KPiA+IA0KPiANCj4gSXQncyBoYW5kbGVkIGlu
IGRyaXZlcnMvYmFzZS9wb3dlci9tYWluLmMgLSB1cG9uIGZhaWx1cmUsIGEgcG1fZGV2X2Vycigp
IHdpbGwgYmUNCj4gZXhlY3V0ZWQsIHByaW50aW5nIGFuIGVycm9yIG1lc3NhZ2Ugc3RhdGluZyB0
aGF0IHRoaXMgKG9yIGFueSBvdGhlcikgZHJpdmVyIGhhcw0KPiBmYWlsZWQgcmVzdW1pbmcuDQoN
ClJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPg0KDQo+IA0KPiBDaGVlcnMs
DQo+IEFuZ2Vsbw0KPiANCj4gPiBSZWdhcmRzLA0KPiA+IENLDQo+ID4gDQo+ID4gPiAtICAgICAg
IGlmIChyZXQpIHsNCj4gPiA+IC0gICAgICAgICAgICAgICBkZXZfZXJyKGRldiwgImhkbWkgcmVz
dW1lIGZhaWxlZCFcbiIpOw0KPiA+ID4gLSAgICAgICAgICAgICAgIHJldHVybiByZXQ7DQo+ID4g
PiAtICAgICAgIH0NCj4gPiA+IC0NCj4gPiA+IC0gICAgICAgcmV0dXJuIDA7DQo+ID4gPiArICAg
ICAgIHJldHVybiBtdGtfaGRtaV9jbGtfZW5hYmxlX2F1ZGlvKGhkbWkpOw0KPiA+ID4gICB9DQo+
ID4gPiANCj4gPiA+ICAgc3RhdGljIFNJTVBMRV9ERVZfUE1fT1BTKG10a19oZG1pX3BtX29wcywg
bXRrX2hkbWlfc3VzcGVuZCwgbXRrX2hkbWlfcmVzdW1lKTsNCj4gPiA+IC0tDQo+ID4gPiAyLjQ3
LjANCj4gPiA+IA0KPiA+IA0KPiANCg0K

--__=_Part_Boundary_005_1222007744.1042950334
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO01vbiwmIzMyOzIwMjUtMDItMTAmIzMyO2F0
JiMzMjsxMjoyMyYjMzI7KzAxMDAsJiMzMjtBbmdlbG9HaW9hY2NoaW5vJiMzMjtEZWwmIzMyO1Jl
Z25vJiMzMjt3cm90ZToNCiZndDsmIzMyO0V4dGVybmFsJiMzMjtlbWFpbCYjMzI7OiYjMzI7UGxl
YXNlJiMzMjtkbyYjMzI7bm90JiMzMjtjbGljayYjMzI7bGlua3MmIzMyO29yJiMzMjtvcGVuJiMz
MjthdHRhY2htZW50cyYjMzI7dW50aWwmIzMyO3lvdSYjMzI7aGF2ZSYjMzI7dmVyaWZpZWQmIzMy
O3RoZSYjMzI7c2VuZGVyJiMzMjtvciYjMzI7dGhlJiMzMjtjb250ZW50Lg0KJmd0OyYjMzI7DQom
Z3Q7JiMzMjsNCiZndDsmIzMyO0lsJiMzMjswNy8wMi8yNSYjMzI7MDc6MDQsJiMzMjtDSyYjMzI7
SHUmIzMyOygmIzMyOTkzOyYjMjA0MjY7JiMyMDgwOTspJiMzMjtoYSYjMzI7c2NyaXR0bzoNCiZn
dDsmIzMyOyZndDsmIzMyO0hpLCYjMzI7QW5nZWxvOg0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7
JiMzMjsmZ3Q7JiMzMjtPbiYjMzI7TW9uLCYjMzI7MjAyNS0wMS0xMyYjMzI7YXQmIzMyOzE1OjUy
JiMzMjsrMDEwMCwmIzMyO0FuZ2Vsb0dpb2FjY2hpbm8mIzMyO0RlbCYjMzI7UmVnbm8mIzMyO3dy
b3RlOg0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7RXh0ZXJuYWwmIzMyO2VtYWlsJiMzMjs6
JiMzMjtQbGVhc2UmIzMyO2RvJiMzMjtub3QmIzMyO2NsaWNrJiMzMjtsaW5rcyYjMzI7b3ImIzMy
O29wZW4mIzMyO2F0dGFjaG1lbnRzJiMzMjt1bnRpbCYjMzI7eW91JiMzMjtoYXZlJiMzMjt2ZXJp
ZmllZCYjMzI7dGhlJiMzMjtzZW5kZXImIzMyO29yJiMzMjt0aGUmIzMyO2NvbnRlbnQuDQomZ3Q7
JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOw0KJmd0
OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7UmVtb3ZlJiMzMjt0aGUmIzMyO2Vycm9yJiMzMjtwcmlu
dCYjMzI7aW4mIzMyO2Nhc2UmIzMyO29mJiMzMjttdGtfaGRtaV9jbGtfZW5hYmxlX2F1ZGlvKCkN
CiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyO2ZhaWx1cmVzOiYjMzI7c2luY2UmIzMyO3RoZSYj
MzI7QVBJcyYjMzI7d2lsbCYjMzI7YWxyZWFkeSYjMzI7cHJpbnQmIzMyO29uJiMzMjt0aGVpciYj
MzI7b3duLCYjMzI7aGF2aW5nDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtvbmUmIzMyO2lu
JiMzMjt0aGVyZSYjMzI7aXMmIzMyO3JlZHVuZGFudC4NCiZndDsmIzMyOyZndDsmIzMyOyZndDsm
IzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO0FuZ2Vs
b0dpb2FjY2hpbm8mIzMyO0RlbCYjMzI7UmVnbm8mIzMyOyZsdDthbmdlbG9naW9hY2NoaW5vLmRl
bHJlZ25vQGNvbGxhYm9yYS5jb20mZ3Q7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjstLS0N
CiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOyYjMzI7JiMzMjtkcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2hkbWkuYyYjMzI7fCYjMzI7OSYjMzI7Ky0tLS0tLS0tDQomZ3Q7JiMzMjsmZ3Q7
JiMzMjsmZ3Q7JiMzMjsmIzMyOyYjMzI7MSYjMzI7ZmlsZSYjMzI7Y2hhbmdlZCwmIzMyOzEmIzMy
O2luc2VydGlvbigrKSwmIzMyOzgmIzMyO2RlbGV0aW9ucygtKQ0KJmd0OyYjMzI7Jmd0OyYjMzI7
Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtkaWZmJiMzMjstLWdpdCYjMzI7
YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYyYjMzI7Yi9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2hkbWkuYw0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7aW5kZXgm
IzMyOzQwZWVhNWMxMjVkMi4uYzU0MzFmMTYwZmU0JiMzMjsxMDA2NDQNCiZndDsmIzMyOyZndDsm
IzMyOyZndDsmIzMyOy0tLSYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWku
Yw0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7KysrJiMzMjtiL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfaGRtaS5jDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtAQCYjMzI7LTE3
MDMsMTUmIzMyOysxNzAzLDgmIzMyO0BAJiMzMjtzdGF0aWMmIzMyO19fbWF5YmVfdW51c2VkJiMz
MjtpbnQmIzMyO210a19oZG1pX3N1c3BlbmQoc3RydWN0JiMzMjtkZXZpY2UmIzMyOypkZXYpDQom
Z3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyOyYjMzI7c3RhdGljJiMzMjtfX21heWJlX3Vu
dXNlZCYjMzI7aW50JiMzMjttdGtfaGRtaV9yZXN1bWUoc3RydWN0JiMzMjtkZXZpY2UmIzMyOypk
ZXYpDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyOyYjMzI7ew0KJmd0OyYjMzI7Jmd0
OyYjMzI7Jmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7c3RydWN0JiMzMjttdGtfaGRtaSYjMzI7KmhkbWkmIzMyOz0mIzMyO2Rldl9nZXRfZHJ2ZGF0
YShkZXYpOw0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7LSYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7aW50JiMzMjtyZXQmIzMyOz0mIzMyOzA7DQomZ3Q7JiMzMjsmZ3Q7JiMz
MjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOy0mIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyO3JldCYjMzI7PSYjMzI7bXRrX2hkbWlfY2xrX2VuYWJsZV9hdWRp
byhoZG1pKTsNCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7SSYjMzI7ZG8m
IzMyO25vdCYjMzI7ZmluZCYjMzI7d2hlcmUmIzMyO3RvJiMzMjtwcmludCYjMzI7dGhlJiMzMjtl
cnJvciYjMzI7bWVzc2FnZSwmIzMyO2NvdWxkJiMzMjt5b3UmIzMyO3Byb3ZpZGUmIzMyO3doZXJl
JiMzMjt3b3VsZCYjMzI7cHJpbnQmIzMyO3RoZSYjMzI7ZXJyb3ImIzMyO21lc3NhZ2UmIzYzOw0K
Jmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsNCiZndDsmIzMyO0l0JiMzOTtzJiMzMjtoYW5k
bGVkJiMzMjtpbiYjMzI7ZHJpdmVycy9iYXNlL3Bvd2VyL21haW4uYyYjMzI7LSYjMzI7dXBvbiYj
MzI7ZmFpbHVyZSwmIzMyO2EmIzMyO3BtX2Rldl9lcnIoKSYjMzI7d2lsbCYjMzI7YmUNCiZndDsm
IzMyO2V4ZWN1dGVkLCYjMzI7cHJpbnRpbmcmIzMyO2FuJiMzMjtlcnJvciYjMzI7bWVzc2FnZSYj
MzI7c3RhdGluZyYjMzI7dGhhdCYjMzI7dGhpcyYjMzI7KG9yJiMzMjthbnkmIzMyO290aGVyKSYj
MzI7ZHJpdmVyJiMzMjtoYXMNCiZndDsmIzMyO2ZhaWxlZCYjMzI7cmVzdW1pbmcuDQoNClJldmll
d2VkLWJ5OiYjMzI7Q0smIzMyO0h1JiMzMjsmbHQ7Y2suaHVAbWVkaWF0ZWsuY29tJmd0Ow0KDQom
Z3Q7JiMzMjsNCiZndDsmIzMyO0NoZWVycywNCiZndDsmIzMyO0FuZ2Vsbw0KJmd0OyYjMzI7DQom
Z3Q7JiMzMjsmZ3Q7JiMzMjtSZWdhcmRzLA0KJmd0OyYjMzI7Jmd0OyYjMzI7Q0sNCiZndDsmIzMy
OyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7LSYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7aWYmIzMyOyhyZXQpJiMzMjt7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsm
Z3Q7JiMzMjstJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7ZGV2X2VycihkZXYsJiMzMjsmcXVvdDtoZG1pJiMz
MjtyZXN1bWUmIzMyO2ZhaWxlZCEmIzkyO24mcXVvdDspOw0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0
OyYjMzI7LSYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3JldHVybiYjMzI7cmV0Ow0KJmd0OyYjMzI7Jmd0OyYj
MzI7Jmd0OyYjMzI7LSYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7fQ0KJmd0OyYj
MzI7Jmd0OyYjMzI7Jmd0OyYjMzI7LQ0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7LSYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7cmV0dXJuJiMzMjswOw0KJmd0OyYjMzI7Jmd0
OyYjMzI7Jmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7cmV0dXJu
JiMzMjttdGtfaGRtaV9jbGtfZW5hYmxlX2F1ZGlvKGhkbWkpOw0KJmd0OyYjMzI7Jmd0OyYjMzI7
Jmd0OyYjMzI7JiMzMjsmIzMyO30NCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYj
MzI7Jmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjsmIzMyO3N0YXRpYyYjMzI7U0lNUExFX0RFVl9QTV9P
UFMobXRrX2hkbWlfcG1fb3BzLCYjMzI7bXRrX2hkbWlfc3VzcGVuZCwmIzMyO210a19oZG1pX3Jl
c3VtZSk7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjstLQ0KJmd0OyYjMzI7Jmd0OyYjMzI7
Jmd0OyYjMzI7Mi40Ny4wDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZn
dDsmIzMyOw0KJmd0OyYjMzI7DQoNCg0KPC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlw
ZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFs
aXR5IE5vdGljZSAqKioqKioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5l
ZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1h
eSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UN
CmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRl
bmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMp
LiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFp
bmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVu
dHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5k
IG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQg
b2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUgDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMg
ZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAo
YnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9m
IA0KdGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0
ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFu
eSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_005_1222007744.1042950334--

