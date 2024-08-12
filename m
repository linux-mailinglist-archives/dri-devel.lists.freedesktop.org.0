Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DB694E583
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 05:18:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 185A210E08D;
	Mon, 12 Aug 2024 03:18:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="gyMRf2ej";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="gLiZr91g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19E9910E08D
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 03:18:45 +0000 (UTC)
X-UUID: 92549fea585911ef9a4e6796c666300c-20240812
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=3uefW7FtT+jZZuhFkJrh9Yq9T1APOAIEWqmNMcn9lAc=; 
 b=gyMRf2ejuzbVhGxXUMv/HuFpBNAUkcM3Zd3Qw0yEs3pEoq8a4Nth6e7fVHItHmUtwe0ESQuSis0EZHgJgiOQxI7j9tpPFmKNu1vhIpPl0ljaQMiLo7sEvdCYNDjp0U5ttFT66AMvNzssFT9NWGrEjgAjtjx7iwtHSGTmkDjtVAw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:0efd48e9-072d-4811-be92-2a83ba77c245, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6dc6a47, CLOUDID:486272fe-77bb-433c-b174-ffb8012693b0,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 92549fea585911ef9a4e6796c666300c-20240812
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 981265484; Mon, 12 Aug 2024 11:18:40 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 12 Aug 2024 11:18:40 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Mon, 12 Aug 2024 11:18:40 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gfXajGkCXUyKOns6eNS9am/a5gj0V5Ljtlin6yKZrn4/KtdDhHV0/EkFklH2LHjL9QmbA1W1Cpzty98ZS8z+QzqAQbt7Fvce8GBPvFj6GgUYLBGLLDLnvqO7iutEHQWZsy3y18fb2VfYhbqSgqgsWlP9tAqcKJ6E+KsvNMWsNXSnAKXtPZk8hs7jo8NQelnUix8UKlldj4IK7xKZx1rx+XoWYEa109iD+Agzcj0iQ+iNUefq1OjwkpilVlDaqQ8r0b4gjAbXfNI9d6xTaUlM542O5waRv/tMffy+VkBrlabwrkJy8vACQnDaVCKYqWLm3pnSpI2KjIt/qMm8ulBHjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yiXPIXqu909nXo0bAMovEn5Jug/zQbt3zuO8nOdDh5U=;
 b=ozdVeARc3e4BmhhBd3dtUGqPLGqV4HqtYFCHlnrqID76PDI2+qSdW/IUWOKaq7kVPJPwVocWPQJnxS6nbSWc6UOjeGgUvxk82oEjex1O8Lvf2HOtO3t1k9A9eoGxHstaK0uidf/BLdUr9gtPrewhxIWmcpqcJUVFverEHDC5pkhWLyoIZ/9e6WJ5Wtf4VeDwoTfdHOLmrpIfrm0Gh4HyR7cqxvLi0xwZWGXYsZ+81A+plzPFvxK6azCMtFgzpCIjTEdN/4SmyHDdEArl3aFdEkQhdWhl1zei5tPneap8MwsSKcCNQi+qCg9r/Jd7b1rTxFgAIcCk8Yb8Q7JzOe2n7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yiXPIXqu909nXo0bAMovEn5Jug/zQbt3zuO8nOdDh5U=;
 b=gLiZr91gdNGkzL3JmdMhiYI6oGfk+g68utfy8koD2Y7L5d7wbrs4T+6UlRgu8jPlRG0LxsG7wCLIsSLn6O0x1gci1VIdGXODt4D/++e+81Q4b+KCFlUAUQhYobItJhNowz3LWW2gyDXv4okcVUAXhO7BblLuKpMaMs/IrR3oGEI=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYSPR03MB7707.apcprd03.prod.outlook.com (2603:1096:400:410::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Mon, 12 Aug
 2024 03:18:38 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.7849.019; Mon, 12 Aug 2024
 03:18:38 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "javier.carrasco.cruz@gmail.com" <javier.carrasco.cruz@gmail.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/3] drm/mediatek: ovl_adaptor: drop unused mtk_crtc.h
 header
Thread-Topic: [PATCH 1/3] drm/mediatek: ovl_adaptor: drop unused mtk_crtc.h
 header
Thread-Index: AQHaxlXQwolv/QLcJkKP+vIUgV4c+LIjP/iA
Date: Mon, 12 Aug 2024 03:18:38 +0000
Message-ID: <1f2dd567abc8b22336dad3892bd91616d214bc5a.camel@mediatek.com>
References: <20240624-mtk_disp_ovl_adaptor_scoped-v1-0-9fa1e074d881@gmail.com>
 <20240624-mtk_disp_ovl_adaptor_scoped-v1-1-9fa1e074d881@gmail.com>
In-Reply-To: <20240624-mtk_disp_ovl_adaptor_scoped-v1-1-9fa1e074d881@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYSPR03MB7707:EE_
x-ms-office365-filtering-correlation-id: 4e1f418a-0fe4-4f74-380b-08dcba7d7552
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?T1ZIMEJyWGd4ZGNKNXArY1EyQmRrUURrZGRrVU1JT0JUZEtja3V1aDFlaW84?=
 =?utf-8?B?Z25hMEhWZHNmc29ob2dabXhWc1J0MFZqL3Qzc0VCV3BIc1IrVjUrVmxqTlZU?=
 =?utf-8?B?b2JwMGlYYU5waWIzYzRUSUJpWmU2RHZQSTlkRWRkT2wrTW13bDVyajZsWUJw?=
 =?utf-8?B?N1R2WDAxUWh6ajk2Wkg2V0RONWN3MGdiR0lNMkNCWHJMeEZkRno0UXpWaEx2?=
 =?utf-8?B?bzJVbGVoTW01cmR4N2tqWEg4NG5kN2MxRjhKTWVERXdpbVFyMGQ0U0gxWHMy?=
 =?utf-8?B?Ryt5RkdBbFpIZWJneDVRejRGZkVjY251cmlsSWNucWE3cVdZTUpvU0pmR2Zy?=
 =?utf-8?B?QW1wOUNSUFVyQ0pzK2xzWUlzYkRaTytBdVNKVllWSzhtT0ltd1VWZnVSRmtF?=
 =?utf-8?B?UU5qSzFacU5SNThQSUdWTDM3Nnk4aUpPc1EzSHQ2b1NYOGxYMmRoNUNIWlFX?=
 =?utf-8?B?YVA5KzFrd2h5bEhWYm1qMDRPOFdlcStuMUIrbCsvY0VUOHZUVzlIaDVGcUNU?=
 =?utf-8?B?TzBSMHNSby9tenBueGdpUk5GSk5GTTE3MlQrUCtrY3UxckZqamdhdW9SYUxp?=
 =?utf-8?B?LzZlNEZpYk5xQmM0YWNGdHdQamJpRDBEd2UvbzlqblUxaHhjcjJWMXdIREVn?=
 =?utf-8?B?WXBEN1cyazdMSWVRVzd6THhlbkduVXMwaXBqOCtPWjJlL0E0WVh1SXh0THhw?=
 =?utf-8?B?RFpuckFNbTJjRGRaRmsvd1E3VkI0aEJMN09ZaTJiWitrbnhDK1p4UkFNc3pH?=
 =?utf-8?B?T3FHdEdRc3pZbko2K0k3T0Z3MEFEcEROUXYycnBnNXlnVWRDcFQ0eUVTR3Vt?=
 =?utf-8?B?NWpaQzVUK243dlJpakpTUzFlWE5IYzRBZkE4ZXZnQ3h4NmFBY2Q1U1BuOFJL?=
 =?utf-8?B?RFVZdkxBemNlaktGYlByZ2VnUjBjMUZGL1U1aXhMbEF6amlUZHBiVHB0WUlZ?=
 =?utf-8?B?eUVsN3lXOVBWb3p1WjF5VHA0STV6OURHQm8xVC8vSW5Qc2pBTDMxbUNMSTVN?=
 =?utf-8?B?bDhaaXQ5M1cxdWNZMndHOUNyNmJUVzRPRkVlcDdmM0hHanB5YnlYWEw4V1la?=
 =?utf-8?B?aHkrcTMzTlpsMjVZWFozM3FzQUU2dkJ5bnpQK1hNZmpaUmVadW9ZbU5mZS9E?=
 =?utf-8?B?SHE5cjZ0V1FzZHNtMlp4Y1ZIOHhVS1NoUUFva0JjUEtVUEM3R2t2ZGgra1JJ?=
 =?utf-8?B?SllqZWw4OTNwbTdzY2YxU1FEUlN4WDB1a2JwMThNMGlTSnFZWjBDZGlmYWRp?=
 =?utf-8?B?YUM3allaT0hHOEFjNHVGamFIekdmelNVL3d0MittS3I3NG1wcFBhcS9ZVXNS?=
 =?utf-8?B?SzNpRm5kd0lhanZ6N2M3U20wemd6MVJxUDR3aWozZHRlYWw4VDFNNlM1bis1?=
 =?utf-8?B?QWs0cHBrUFJ0MEw0V2pDaUk1b1A0N0tGU3lwbCtZZDVZRmZwZU9tVHhXbmtO?=
 =?utf-8?B?RlZpcTJUSmNJL3RMTSswYVlQbzhvVHN2TWx0MEtiejJPT2o4K1NUN01nbEM4?=
 =?utf-8?B?MGMzWjgxZWlYZnJTRVNhVGFxQzNpQ0tlWnhQTy92d2pUQXRwang1RlpNRjZK?=
 =?utf-8?B?NXJBdExrb201Nk5XbmFGcHQzTnIvMjBtajlqdktxYWF1SVRGTlJaQXdZM0sv?=
 =?utf-8?B?MGI4VEdZRmVOdXpheGFZTGNKbHM1K0tFQ3pYS3J3QkEyUnJ2VElHaWc1bWdr?=
 =?utf-8?B?Z0FFM1dld1cwaE8vTUcvUVZhWHJPZkV4UTRYS3BjSFhZbmFBcXlEcVMrcWhM?=
 =?utf-8?B?TFFOc2tUdjhDZnBCVUVFRU5RbnVtZ3lQNTFvU2lHRGJOb004d2pzeVlDdVFO?=
 =?utf-8?Q?DmEPrQOxZSbD/29NznFjQQu3Lw6HwwevrQ1Qc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aUxmbFhHdjR4bXpXRDBrYVJoVTcwYlpvcEt0RUVuYU5QWE80QWxlMnVrb3hO?=
 =?utf-8?B?YVgwaFVsRHhLVG5tU0MyMDJjVWpHaGNybXMrSDN2TzR2WUxPY0lVblB5ZXJD?=
 =?utf-8?B?bHdXbCtFTDJ1VUFqdEd2SEFDMUZ5RWRUTXRUckkySlhhVXViRlg4R3RFbmZ5?=
 =?utf-8?B?TTZ6WHhJbWx1YTRNZkRLMTVKVmVsQUg3aWgwWG5xRFh5RDBoR2pGWW45MnZK?=
 =?utf-8?B?ckJPREdKUTc0YTJMK1U3L0VMWTZJcnFuNk5DcmFJN1JJSkJkK3o1UE1WV1Ew?=
 =?utf-8?B?SStDMVRSTFVhaUs2by9pZ3FuT1BuN0tXZjJvbWlQT01LUjF5cDRCekdhVi9y?=
 =?utf-8?B?dlJuaE9aTDZEd2VlQ2tic2JSTzliRkw0dm4zWEZmSS9LUExaVktIcU42YkFG?=
 =?utf-8?B?RlE0L2o1L0tia3ZJNFQ2K0NWaEZTaWxDUkh1K0hQcG1UYkVZNUVteUZocVVh?=
 =?utf-8?B?NnF4bTdyRExLN3VNWE5BdjI4dk1hNXpLdWIxeG9BNEZRQ2lUc2w1V2Y0QmFM?=
 =?utf-8?B?OGxGQnc0cXVmdTlIMkdscFl5WUFxMTQ1bDRsMnpjY294cFlxWS93Y0EwSGlS?=
 =?utf-8?B?OG40RHEzOG4rUVJkZFpNN0VUUTJXTm5yUTZLcDVvWE8vS3JZc0pwcksvRVJJ?=
 =?utf-8?B?bDViNW13bGk1ZUtyOWJOcDBVTm03WDBjVFFzTCsrMmRWZTRtYjJmQ0hJZVh5?=
 =?utf-8?B?MXBOMXIxOUVqVUxnNlg2c3R2SFZHQXpmcC9EQTRoMDBzWTRxMng2QnEwY2E4?=
 =?utf-8?B?dXRqS3VObktKeTlSYXBxYW4xR041aCtMWUNndHVxRGovYkxPRkJMdHdkNmNQ?=
 =?utf-8?B?aGhBK0FscVpSVU03emI4OVU5K1JmTEthbytrc1JCSXU2SGRaT0tPdDN5djhP?=
 =?utf-8?B?clB2UElnc2tvNWN5dzNEcko4bW41MHpSZmxxSUdHV2FhQnVuWnlPdUdwbGVh?=
 =?utf-8?B?NXhLRFhWUW9BeDhuUzljbXdBbURGVXIwenFNKzZLdTlOdmVtR2FVNTJoU3J4?=
 =?utf-8?B?cWJqRTZVTEZyS1BzOWtYNlM1QkxMdWhGbk9aZkR0ejd0QkFDTGs4bmwzQStI?=
 =?utf-8?B?aWtpQjBaQWZwZnlsUEwzSkRKL1MwSi9qaVZiWDJPaTVmL1pBNzBteURrTmU2?=
 =?utf-8?B?R2JPU2FESG92N0E1c2k3RGNOdnh5OUtSYkxndEEvbjEvd2pUN3hGajRLc0F2?=
 =?utf-8?B?d0pUUGNCZ2ZnVXNKUVRINTZCU2RvVTI5Y1BaNC9PWkVFTzF1U1k5TXVhSDZ5?=
 =?utf-8?B?QjBpblJBMW1xa0FyTWg3MnVwc2JnZ3hGOWFyRTJiV25MTXM3dEhSVUdnV2l4?=
 =?utf-8?B?UDFNL1V2UUI0d2JyNmRFbWxwZ2tZRFF4K3ZRbUIzRy8rL2V6ZkNrWndXam5B?=
 =?utf-8?B?T3pMcTVySDFZQU45TUtGYU1SWGxqWnltNkplSDZMMklIdXVxc3ZEQmRWZVNm?=
 =?utf-8?B?blVidEZNRjJzd0xHV2Q1S1FaeFY5dllRRnkxMy9ZcWM3dkxaME5sWENxTjlm?=
 =?utf-8?B?Z3NCZHkvbHYvdXZKZ0IxU1oxaERxWmNQYXV4ekJxWGNON1RFcWtHMFlUYVQv?=
 =?utf-8?B?UDQ2aDVDR2h2Njd4emlVbHdtUFhHWEZ1NU1QMHVQZk56QUQ4RC9POGdwc3VB?=
 =?utf-8?B?cXJhOXFiYy9aLzFLdjc4cmhJSkdKeSttWkJub0RvZjFOWC92V0JKdExIekMw?=
 =?utf-8?B?akVGUlhqVGhvQ1hKOVdocEtseURlZXVaUStweDltaU9QaTN3YWxuNVF2NmNE?=
 =?utf-8?B?WnA1amVIK3JrVldrVUFsOU5KNDJsZXozcEFnZjZKYUxaYjg5UDZxM3pPa3BG?=
 =?utf-8?B?Rys0eVFwS1VpdldTOUdOaGxPVVdwSWdWVzNqVllIbllyMW0zb01PMWJTcjVO?=
 =?utf-8?B?RDA5RUVzVWVscm01ZjNYNllDMUV5bnpoZmN4UCtVY0pza29lTXpKeG5CMmhU?=
 =?utf-8?B?Z1FoMkhCTDl0M3FIeXE1TENTNVhrQXk0YnZ5bWVrQ1AyYUpnS24yYlpyTDhO?=
 =?utf-8?B?aG9DV1ZPdGdsalNNR1Y2Vzd5K2h0bitlTVRSQ1BQazFsMkV2eGpxcU1lUFJ4?=
 =?utf-8?B?T0laRS9HaEx4T2t1b2d0NVkraW1YZVlNY3FVb1J3K3ZCenJnMkwxM2RqQ0ty?=
 =?utf-8?Q?qbEIq5R2+csT+d+kXDmxSYxvl?=
Content-ID: <842D63F5B86C624B8A483C9608F99B7B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e1f418a-0fe4-4f74-380b-08dcba7d7552
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2024 03:18:38.1649 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /hklEbQZfuthhf9yOc5bQ3d5FKe8JxGfeaRJXMXsquFdY4K8BGiWeaQxgZJAmvcqOhZW/SZnyUdHgK/HFJyCQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7707
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_001_660916694.320884930"
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

--__=_Part_Boundary_001_660916694.320884930
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEphdmllcjoNCg0KT24gTW9uLCAyMDI0LTA2LTI0IGF0IDE4OjQzICswMjAwLCBKYXZpZXIg
Q2FycmFzY28gd3JvdGU6DQo+ICAJIA0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3Qg
Y2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bnRpbCB5b3UgaGF2ZSB2ZXJpZmllZCB0
aGUgc2VuZGVyIG9yIHRoZSBjb250ZW50Lg0KPiAgTm9uZSBvZiB0aGUgZWxlbWVudHMgZnJvbSB0
aGF0IGhlYWRlciBpcyB1c2VkIGluIHRoaXMgZmlsZS4NCg0KUmV2aWV3ZWQtYnk6IENLIEh1IDxj
ay5odUBtZWRpYXRlay5jb20+DQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEphdmllciBDYXJyYXNj
byA8amF2aWVyLmNhcnJhc2NvLmNydXpAZ21haWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmxfYWRhcHRvci5jIHwgMSAtDQo+ICAxIGZpbGUgY2hh
bmdlZCwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZGlzcF9vdmxfYWRhcHRvci5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kaXNwX292bF9hZGFwdG9yLmMNCj4gaW5kZXggMDJkZDdkY2RmZWRiLi4xNDE4OTkyMzEx
YzQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmxf
YWRhcHRvci5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmxf
YWRhcHRvci5jDQo+IEBAIC0xNyw3ICsxNyw2IEBADQo+ICAjaW5jbHVkZSA8bGludXgvc29jL21l
ZGlhdGVrL210ay1tbXN5cy5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4L3NvYy9tZWRpYXRlay9tdGst
bXV0ZXguaD4NCj4gIA0KPiAtI2luY2x1ZGUgIm10a19jcnRjLmgiDQo+ICAjaW5jbHVkZSAibXRr
X2RkcF9jb21wLmgiDQo+ICAjaW5jbHVkZSAibXRrX2Rpc3BfZHJ2LmgiDQo+ICAjaW5jbHVkZSAi
bXRrX2RybV9kcnYuaCINCj4gDQo+IC0tIA0KPiAyLjQwLjENCj4gDQo=

--__=_Part_Boundary_001_660916694.320884930
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtKYXZpZXI6DQoNCk9uJiMzMjtNb24sJiMz
MjsyMDI0LTA2LTI0JiMzMjthdCYjMzI7MTg6NDMmIzMyOyswMjAwLCYjMzI7SmF2aWVyJiMzMjtD
YXJyYXNjbyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjsmIzMyOyYjMzI7DQomZ3Q7JiMzMjtFeHRlcm5h
bCYjMzI7ZW1haWwmIzMyOzomIzMyO1BsZWFzZSYjMzI7ZG8mIzMyO25vdCYjMzI7Y2xpY2smIzMy
O2xpbmtzJiMzMjtvciYjMzI7b3BlbiYjMzI7YXR0YWNobWVudHMmIzMyO3VudGlsJiMzMjt5b3Um
IzMyO2hhdmUmIzMyO3ZlcmlmaWVkJiMzMjt0aGUmIzMyO3NlbmRlciYjMzI7b3ImIzMyO3RoZSYj
MzI7Y29udGVudC4NCiZndDsmIzMyOyYjMzI7Tm9uZSYjMzI7b2YmIzMyO3RoZSYjMzI7ZWxlbWVu
dHMmIzMyO2Zyb20mIzMyO3RoYXQmIzMyO2hlYWRlciYjMzI7aXMmIzMyO3VzZWQmIzMyO2luJiMz
Mjt0aGlzJiMzMjtmaWxlLg0KDQpSZXZpZXdlZC1ieTomIzMyO0NLJiMzMjtIdSYjMzI7Jmx0O2Nr
Lmh1QG1lZGlhdGVrLmNvbSZndDsNCg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtTaWduZWQtb2ZmLWJ5
OiYjMzI7SmF2aWVyJiMzMjtDYXJyYXNjbyYjMzI7Jmx0O2phdmllci5jYXJyYXNjby5jcnV6QGdt
YWlsLmNvbSZndDsNCiZndDsmIzMyOy0tLQ0KJmd0OyYjMzI7JiMzMjtkcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsX2FkYXB0b3IuYyYjMzI7fCYjMzI7MSYjMzI7LQ0KJmd0OyYj
MzI7JiMzMjsxJiMzMjtmaWxlJiMzMjtjaGFuZ2VkLCYjMzI7MSYjMzI7ZGVsZXRpb24oLSkNCiZn
dDsmIzMyOw0KJmd0OyYjMzI7ZGlmZiYjMzI7LS1naXQmIzMyO2EvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kaXNwX292bF9hZGFwdG9yLmMmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kaXNwX292bF9hZGFwdG9yLmMNCiZndDsmIzMyO2luZGV4JiMzMjswMmRkN2RjZGZl
ZGIuLjE0MTg5OTIzMTFjNCYjMzI7MTAwNjQ0DQomZ3Q7JiMzMjstLS0mIzMyO2EvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bF9hZGFwdG9yLmMNCiZndDsmIzMyOysrKyYjMzI7
Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsX2FkYXB0b3IuYw0KJmd0OyYj
MzI7QEAmIzMyOy0xNyw3JiMzMjsrMTcsNiYjMzI7QEANCiZndDsmIzMyOyYjMzI7I2luY2x1ZGUm
IzMyOyZsdDtsaW51eC9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmgmZ3Q7DQomZ3Q7JiMzMjsmIzMy
OyNpbmNsdWRlJiMzMjsmbHQ7bGludXgvc29jL21lZGlhdGVrL210ay1tdXRleC5oJmd0Ow0KJmd0
OyYjMzI7JiMzMjsNCiZndDsmIzMyOy0jaW5jbHVkZSYjMzI7JnF1b3Q7bXRrX2NydGMuaCZxdW90
Ow0KJmd0OyYjMzI7JiMzMjsjaW5jbHVkZSYjMzI7JnF1b3Q7bXRrX2RkcF9jb21wLmgmcXVvdDsN
CiZndDsmIzMyOyYjMzI7I2luY2x1ZGUmIzMyOyZxdW90O210a19kaXNwX2Rydi5oJnF1b3Q7DQom
Z3Q7JiMzMjsmIzMyOyNpbmNsdWRlJiMzMjsmcXVvdDttdGtfZHJtX2Rydi5oJnF1b3Q7DQomZ3Q7
JiMzMjsNCiZndDsmIzMyOy0tJiMzMjsNCiZndDsmIzMyOzIuNDAuMQ0KJmd0OyYjMzI7DQoNCjwv
cHJlPg0KPC9wPjwvYm9keT48L2h0bWw+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioq
KioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioqKioq
KioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAo
aW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmll
dGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVu
ZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5
IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwg
DQpkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUt
bWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVu
dChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91
IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZl
IA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5v
dGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWls
KSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcg
YW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0
aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3Uh
DQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_001_660916694.320884930--

