Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 944D8CDB280
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 03:20:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0C9210E31F;
	Wed, 24 Dec 2025 02:20:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="YatrFVrE";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="r/mtevSs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6214210E31A
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 02:20:29 +0000 (UTC)
X-UUID: 1a5677f8e06f11f0b33aeb1e7f16c2b6-20251224
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=KDowOnjdZnWsG5/yRhOt4TvSL3Q4amJBd9YTugE6SnE=; 
 b=YatrFVrEfw9X6T09olf+5a9v95YM42CSPzdedfiM+6ua+ZqH/VFSlJJc80E8dhAxJewWasout+23q2Xe0SSoq2oLFgiQlRFImb4FXA3/7uIIATxiBZUVqu6vOVBwwsSrVCXN+FNZI9US7nWNcSfeOowL1t4GlqaywrflBKjqgbo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.9, REQID:35d781d2-d349-4d46-971d-0e7a897cb92c, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:5047765, CLOUDID:660b1b03-1fa9-44eb-b231-4afc61466396,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
 TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
 C:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1a5677f8e06f11f0b33aeb1e7f16c2b6-20251224
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <macpaul.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1441523784; Wed, 24 Dec 2025 10:20:23 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 24 Dec 2025 10:20:22 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 24 Dec 2025 10:20:21 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QJaToZKnmnhNFKEVMewqnsXd9ubVipUNeogfEBGbch8kZht9S0NrjubfjHxWAi4JuIidfAJqaGmLnYNey6juUapKqq3g4FlkGK8zqhdCEd47rNS8aWLPk0NRbGwueMEPdkS1Jx8TekkVtoR5pS10ehaynhFUIgNJiLqnP4Yq/ItV8cvvczAKp8sMXwheK7Dfbmlr5kDG31BiUfcQE0yx3DO+G+s5E603wbnm29o9cae90SMnRwWi/o6e7/5yFjGleSMl42p0mELMacM/O8Pttlhu9amGfbSg/BOxQBbSW2m8RDdLlLu4KN4beebLuH64yOIG/UFmNbY7tGInwoAs5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3qtwzFg59I7gZD6ia/CZdyX0vt7aFxDbQdhn8SIUigs=;
 b=tBqP/KtgLtLjQJWI4Yd9g0xltPTrL+s6SE1RukJhq6x6cFclinNFvcNm9eFRIneApuvLGNPWNfazR1NqNXdqBHdeK2dayerhoTh1zGqIbimCEPA/SB+YzbczEzaMSPd2yWdGjvQGcViawWrRVpNT0kX+f+2r2pw5LzEykDRvueDK4kXjCqbCEZA5pSuiv8SNu0hHMKnzrHr7j/gWDApcTOKXzteeHqyozSVlZ2uw7oB5mN2dc+BLydkEmDn0OeUtQL6ccDcJjbcNfFzgeq6RNnIoMdJBh799rTfbAVYkIiGE2+hxks1MLGVDunobAdzXrZg3/6bDW6TeWixq6I0lmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3qtwzFg59I7gZD6ia/CZdyX0vt7aFxDbQdhn8SIUigs=;
 b=r/mtevSsUCkpBPtCbasr5OT7aRHPS6Npx6o25sllhI9x1YdmwdvhsKhwW4kXFFaNjl2gZD/nq572bUarE6i+I9/aWzrQhLaBRfnaqD8K/GRnpm2N29aqBG5lJkCyAoTVIzGdSlRyGiMqk4Xr6V8yNylcK0vobtMgjok8wRF0pSY=
Received: from SEZPR03MB7810.apcprd03.prod.outlook.com (2603:1096:101:184::13)
 by KL1PR03MB6899.apcprd03.prod.outlook.com (2603:1096:820:9e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Wed, 24 Dec
 2025 02:20:19 +0000
Received: from SEZPR03MB7810.apcprd03.prod.outlook.com
 ([fe80::2557:de4d:a3c7:41e8]) by SEZPR03MB7810.apcprd03.prod.outlook.com
 ([fe80::2557:de4d:a3c7:41e8%4]) with mapi id 15.20.9456.008; Wed, 24 Dec 2025
 02:20:19 +0000
From: =?utf-8?B?TWFjcGF1bCBMaW4gKOael+aZuuaWjCk=?= <Macpaul.Lin@mediatek.com>
To: "tzimmermann@suse.de" <tzimmermann@suse.de>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, "simona@ffwll.ch" <simona@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, Nicolas Prado <nfraprado@collabora.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
CC: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 =?utf-8?B?QmVhciBXYW5nICjokKnljp/mg5/lvrcp?= <bear.wang@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?utf-8?B?UGFibG8gU3VuICjlravmr5Pnv5Qp?= <pablo.sun@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, Daniel Stone <daniels@collabora.com>,
 "kernel@collabora.com" <kernel@collabora.com>
Subject: Re: [PATCH 06/11] drm/mediatek: Add plane_colorops_init() DDP hook
 for OVL
Thread-Topic: [PATCH 06/11] drm/mediatek: Add plane_colorops_init() DDP hook
 for OVL
Thread-Index: AQHcdETz8gxuVbMf9kSn3uHshcXMAbUwDycA
Date: Wed, 24 Dec 2025 02:20:19 +0000
Message-ID: <5bc77576fc6e77f9f87cef27b42b67e2c2c2c9ac.camel@mediatek.com>
References: <20251223-mtk-ovl-pre-blend-colorops-v1-0-0cb99bd0ab33@collabora.com>
 <20251223-mtk-ovl-pre-blend-colorops-v1-6-0cb99bd0ab33@collabora.com>
In-Reply-To: <20251223-mtk-ovl-pre-blend-colorops-v1-6-0cb99bd0ab33@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR03MB7810:EE_|KL1PR03MB6899:EE_
x-ms-office365-filtering-correlation-id: 17e573e9-7962-4bf6-0441-08de4292fbf4
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?dVFibGxYYnFKNGc4bGc5cmo3cVZQTWFMSWlxZTZISlNKcExzSjRWdGQ3YmlJ?=
 =?utf-8?B?cHg0WDVCdWpZVWE3bUdnVG1yRFppME9qTTlHbzJ1L3AyTmZYcTVDU0pvUFc5?=
 =?utf-8?B?MEhQcVdreWNLU3E3WWM3cDVXTDkwSm9WRG84N3hXdFZzbHllN29GeHhlalNX?=
 =?utf-8?B?TjlIQ0pBMVNUQkUzT1B0dGJkekZRRmpMMUo5dEVERUg0ZWFBc2Y3TThrSnJZ?=
 =?utf-8?B?UloxVWRBVnNLYU9obG5oYktIaVl1QjFHTC96WllvOUVGaXJUS1RIREJVTlJK?=
 =?utf-8?B?YnZBdEh3VlgrOFlNckF1Kzk1YkVIS2tEdnU5OFdWT0MvWkhkZVQ3cjhobGd5?=
 =?utf-8?B?TVFXV25xcW44YzdSMzVBSXh4RjRyUUtFdGVFcUtWUmlFS2JYS2hTTGRRaVRh?=
 =?utf-8?B?aXpKeUJnUTV5TDE3REVFdi9zV0YzaWdHazU0dmZHVlhOd3QzRHN4QW5OYklU?=
 =?utf-8?B?UHZZM0ZZaFpZSU5oZ3hpVTc1L3g2aTNTY0tqWGwvdHQwaVZlTkZpRzlHdVpB?=
 =?utf-8?B?d01Vb3JuSU9abW9YVzRrcW95Y2JDcVRHUTg3Y2w5TUZYRXB4M3VFMGlaWkZ4?=
 =?utf-8?B?RTRYWkhTbnh2UWZwc09DSTRYdkNML0FCTlpBRG9wUG9uRGxscENEU3c4bHJi?=
 =?utf-8?B?RE5tVk5vNFhlRmtEdTFVOHFGYWdZQTNxcUljamZkQ0NwOVc4SW5IRFlMRkoz?=
 =?utf-8?B?VVorUnVSdUFiQ1R5L2NVSWV5aGFzTm1VS21HK3BnY2pDamgxYXNZY2dzSHQy?=
 =?utf-8?B?UXl3QnArQmxuWjd6NDBKdWYzU1B2blV2RkZ4WlBveWY3TEsrSGx4SUQ2TmxP?=
 =?utf-8?B?amhTSzIvV1dOVVU0Q3pXNm1RWUlQQTN6UitRNlQ4T3BRWFk4b2JpUmlJTE8r?=
 =?utf-8?B?MDQ0cHUxdWozVnBsUXc2Z3JKbmR3Z0c5b0JOTDhjcDlRUU5qaGNTTnZraHRE?=
 =?utf-8?B?K2hVQ21HVlZZUmlWQVNteXduVlgrcHZuVC9iZjZURUxaZnFVd2d5SVRLeTUv?=
 =?utf-8?B?Q2pVTmJkZ3NvOEVHelVGMGt6djY4eEpCT1VoU2JwZGxJTDludWVNOExTK2Jo?=
 =?utf-8?B?TmRLcDh3Ty9JSTNUT1IvV28yVktFRUxiK3RQYno4WHhaOUtCbWRSdjdRWEVS?=
 =?utf-8?B?L2g4WDNGdTh4bmlDZkVuK2s1SVFRYThMQSt2dWpxeE9ucmtnam5xbHY0WnVt?=
 =?utf-8?B?SWF2bGZVVzJKVVBiMlZCUWhhOWFUdFZ0cU1SbXFvNEZEcGFJUGIvbzBkMDZG?=
 =?utf-8?B?dVNKcXlCRzFFb3Q4bGdvbzFKOGh3Y2lOWXJmRFRlSUVsdU1yL3lEK0owaFJ0?=
 =?utf-8?B?OWNMSDJKdXFtbXg3bEFvMGhqQVRjNElkL1dZVkpEL1NrNGoyWStiYUI0WllJ?=
 =?utf-8?B?cDMrL3ZnNFNVRW5UaUxYQ3RmRFpSbHFUMm4rRFVYZjV0YnNXbzNnNFdBdGo1?=
 =?utf-8?B?SnhmTkZuZ0EyNHQ2U3ZPeTQ5b2NRTklVL20ra1pXV2dYb29oeHBpQ3Evb2pL?=
 =?utf-8?B?TzBFOHNyemI4Ync5TkVLek01dy9SU1pyZjBydVF2TVpFUVdmeWd0NnZ5b3lQ?=
 =?utf-8?B?cEx4dmpRTG5VZ2Q0MWlTU3h5cDF0eFpNSytZMVF1Q1M0enc3YUt6SGlsTnM1?=
 =?utf-8?B?cnVGOXdFeVFsV2NwdDNtNmpQQVQ0U3JQOUt2OUtvMnFuQXpjN2dzRDFhUkR2?=
 =?utf-8?B?VjNHZUhQdWNwMmRHSkRYakFZY3drOHJYNEhNTGxnd2RmYzVDZ29oTEhuSGU4?=
 =?utf-8?B?S2NmUWdGWWtGejFRMGdUdU9SbUJGa25NVjJCZ2h0ckFJdmhTV1JvczlXaUxX?=
 =?utf-8?B?ZTZ1N3VpZkVXNklPQUEwUVlNTTlSMlJGdS9zSkJuZEdRcXJVT0FwdTVnNFVF?=
 =?utf-8?B?clFEWFJ4bjBEWXpQdjc5VFRMV1cwVkpHaVB2ZC9wSm5qc2hESUtnTnQwSVph?=
 =?utf-8?B?NTlIeElST1d6Y2F2QU0xOEFMN0pGMit3Y0xUazdZVUoyT3JCQ0FMelFnT213?=
 =?utf-8?B?enEvNEJ0MTArQzJsNE1GTEVaeERFbk1ENGlDL0ljaFdxaC9rVVhwMWtNTmIy?=
 =?utf-8?B?K3c0ZGtqdksybTZxUkh3YTNwb29OMWdKc0tadz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR03MB7810.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cThMMC90eXRzcmdKUStsbjZ1Uk1BQXQrUEdFSzI5eXJJdUljQmFVSERDbmJM?=
 =?utf-8?B?V2tWb1hISHYyYlY5OWo1cDZLVjVVblhldEkwVjJMOVZmNnJSZmtIY2FwUXYx?=
 =?utf-8?B?QTVuMUFGd1hUYlhKa1EveEhxOXNYVVlrbW55M1ZXd255R2E2eU5uaytWdUZu?=
 =?utf-8?B?N3JMamNQdmk1WXdnYmdiVDRiN0VGU1p0TzdjU3dEZklScENQQWRydUo5blZT?=
 =?utf-8?B?TGRFWGkzSkdKMkhtSTBpbU4zUDZSaXpZUGhrZEw1RHpaemcxWnV0aUh3K1Zn?=
 =?utf-8?B?RUFrWDJrL1M1ZStPbmpaT2wxdEdhRVdtcjlNL1BaOElJUVIvMXk2RUVzaVJZ?=
 =?utf-8?B?QWhacWhQNlZNYUVkcGxqQVlneUpXd2dNWGtLNkpFank2NmZQN2ViWjF1eGR0?=
 =?utf-8?B?bWRmYjJTWGQyZTZDUTF2d1p1bEVNZFZUVlFXNFcyVmlZUVMwZ21FWVE5Vkc3?=
 =?utf-8?B?cStZMnZBV25Md1V1VWlFWEVOTisxTGVWTXEva0ZDTGFLK2dNai9GUVB4VHRV?=
 =?utf-8?B?Um5EYndVYUFoSG5YRXptcnBxRHpFNTE2UEY4czRuS1R1OHltMlJYUFJlazQr?=
 =?utf-8?B?TzV0bEtuYVJxeVZzTzZiZ09kd3FSa20zcHUwQnlQWGhIeVA5NHllSFVDK21V?=
 =?utf-8?B?ZnF6NmZwVENIeDdwcmdYUjl1WllyTFZqNXF4dDlmbXVBT0NtQVJUOUllWEx0?=
 =?utf-8?B?SFJieXlRcnRTNXdWLzdRZDErcjFBVnppYWl2M3hpYlV4WHhuZnhiY1Rhc3d4?=
 =?utf-8?B?cEQ4RmlWakdTWUQ1S1h1d2U0cE1mU0gzQ1l1cFhFaU4rRnNhS0o5UndJZGd3?=
 =?utf-8?B?bXo5ejdGaCthMkRTcm13NjJveS96TmhpbS9sZDE3aU5GYS81YmRRb1U0d05U?=
 =?utf-8?B?SVhSUnl2UVdBaUttZzFZb00wWDFveGtucGpwUmNsVU14cndHYnZrK3pTS24z?=
 =?utf-8?B?NUJGSlovWHBRWFlQVjh6YXFnN1l5K0RnS3J2VkJBMC9wWnl1M3VLL1Q1S0VU?=
 =?utf-8?B?TXdSSkM2Uk1qd1Nnc3pzNExQMURsTDhwd0o1cXp0VkVobDBjZjMzald2Wkdj?=
 =?utf-8?B?Tm14aEsxYTFIN3B4Wm1xaktpM1VQWkZZaW9DaXlyaTJsRFF6TzVONVFsQ09C?=
 =?utf-8?B?Um4xR1AxTTducThyTjhFTFVnaHRMUWhDa1lwd3FJSlRzclV1WmMrd2F4ZndK?=
 =?utf-8?B?UzE4Rm9waUh5NldiUi9DNUhJUVk4aVNPSTNZNHk0RmxONjBrVjB3MUJYS0NQ?=
 =?utf-8?B?ZWpoM0p3R1RqR2x3d0VIYnZrNEh2c2RQeU9vRGlKUzdVUkJKSG4zTXlERkZW?=
 =?utf-8?B?RmUzdnl0ZEw2RkMxb3pnWGhqR2s5aURjRTZXeFJ3MWFHVXhNMjhIbUIzbito?=
 =?utf-8?B?TUliVXR3dmN6MEdVUDRBNjhGWDJwcklYWDJ3U0tnS1YyVkkzUXpZZW5Pckhh?=
 =?utf-8?B?b2h0YTJ0M01jTDhhOEVzcVNOTE9vYjFSa2praHVESUhZbHBPeFloUjVsNHNS?=
 =?utf-8?B?V3pMa1ppMFg1ZnlvRFltTUNmTmJDU091SmtxWS9nMko0Q3dNRGVqcDhaSEt5?=
 =?utf-8?B?WVp5czNrRTFJQlRCNVNDUW5TbnhBOGNxMjZUTklqem1tbkJjTnJUdjVJWmVD?=
 =?utf-8?B?R0FZUHNKVEdxeEtVVWF1Qk41ZjVSQjNuak9PK2ZyTlgvdkVodnN6UHB5WHJo?=
 =?utf-8?B?Q0VNZHB0NUQ0MG5XNFR6NUtTUmZaaTl1QkxibnBaZnAzUjRoc2J0ZU4ybUpo?=
 =?utf-8?B?Y1pJQ3loUEowQzdxYkFRRGFuMTNndVMwTE5LUkxzalhhZkc2L2xwQ2tOeDhZ?=
 =?utf-8?B?a2pVMlFiblNBWnpUR01uTitsTmhzR0UzdEduTnJZVjJNWFkxUzlDQkNlSlp4?=
 =?utf-8?B?R1J0QXljS25SWlY1Y0Rid3pXOGl2MEh5bDNmY1ZOOU5BSmFyV0Qyb2dFcmxn?=
 =?utf-8?B?dWw3RDhNWDZkRWVFR1BMM2tURkZneE1DYXRqWWtxYksrODNJS3JlRzBlS0Nq?=
 =?utf-8?B?TTJRWTJGb3pheit6dFk2cXRjak80WkFhcFU0R0pFNXNZL0lWczBCTXRuK09U?=
 =?utf-8?B?bzMwZitGYnJCd291WmdzcDFjVnBzdmhiaVF2d2Eyc1I4c0Q2TnVRN01jVkdP?=
 =?utf-8?B?SjJKZTF6eG01dmpLa0xrRVdnT2JGTFRnMzNPOUdlc2g4L09xS0RJenNOWXVQ?=
 =?utf-8?B?ckVEWFRQVUwrMEFsNXFOV08rWUR6bWVISGlBY2dDZ3UwZDg4VlEyQ3BIdjNC?=
 =?utf-8?B?dnVmbWxNRktxWVBDNDZ6SEtzWmtYS1JXRnFNK1d3VklodUg1RWc5WjRZRE5G?=
 =?utf-8?B?THJtSzNrWU13ZEVERWdFdVZJa09WbUxIQjdYUkE0TjU0aVBpWjlFTXd4cC9W?=
 =?utf-8?Q?FcYMkpjWRD8S2e34=3D?=
Content-ID: <BD46C029ED48A340BC8D6A2108A9E738@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR03MB7810.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17e573e9-7962-4bf6-0441-08de4292fbf4
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Dec 2025 02:20:19.2539 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1hVP71h4GGhkLzz/gOimzopqTB4w/yAqBvqV0VbSr3RA1EZ+YJlVOuE+OHtDFJ6+LuBXAjCUjuXtjFhrRvsYdSWb9jLmfimCEMc5QdYSuDQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB6899
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_007_684159628.885175683"
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

--__=_Part_Boundary_007_684159628.885175683
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDI1LTEyLTIzIGF0IDE2OjQ0IC0wMzAwLCBOw61jb2xhcyBGLiBSLiBBLiBQcmFk
byB3cm90ZToNCj4gSG9vayBPVkwncyBwbGFuZSBjb2xvcm9wcyBpbml0aWFsaXphdGlvbiBmdW5j
dGlvbiBpbiBERFAgdG8gYWxsb3cgaXRzDQo+IHVzYWdlIGJ5IHRoZSBNZWRpYVRlayBLTVMgZHJp
dmVyLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gPG5mcmFw
cmFkb0Bjb2xsYWJvcmEuY29tPg0KPiAtLS0NCj4gwqBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RkcF9jb21wLmMgfCAxICsNCj4gwqAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykN
Cj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RkcF9jb21w
LmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RkcF9jb21wLmMNCj4gaW5kZXgg
OTRiMzU2ZGE2ZGU3Li5lZjkwNmIyYWZmNzQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZGRwX2NvbXAuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RkcF9jb21wLmMNCj4gQEAgLTMzMSw2ICszMzEsNyBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IG10a19kZHBfY29tcF9mdW5jcyBkZHBfb3ZsID0NCj4gew0KPiDCoMKgwqDCoMKgwqDCoCAu
Z2V0X2Zvcm1hdHMgPSBtdGtfb3ZsX2dldF9mb3JtYXRzLA0KPiDCoMKgwqDCoMKgwqDCoCAuZ2V0
X251bV9mb3JtYXRzID0gbXRrX292bF9nZXRfbnVtX2Zvcm1hdHMsDQo+IMKgwqDCoMKgwqDCoMKg
IC5pc19hZmJjX3N1cHBvcnRlZCA9IG10a19vdmxfaXNfYWZiY19zdXBwb3J0ZWQsDQo+ICvCoMKg
wqDCoMKgwqAgLnBsYW5lX2NvbG9yb3BzX2luaXQgPSBtdGtfb3ZsX3BsYW5lX2NvbG9yb3BzX2lu
aXQsDQo+IMKgfTsNCj4gDQo+IMKgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZGRwX2NvbXBfZnVu
Y3MgZGRwX3Bvc3RtYXNrID0gew0KPiANCj4gLS0NCj4gMi41MS4wDQo+IA0KPiANCg0KUmV2aWV3
ZWQtYnk6IE1hY3BhdWwgTGluIDxtYWNwYXVsLmxpbkBtZWRpYXRlay5jb20+DQoNCkJlc3QgcmVn
YXJkcywNCk1hY3BhdWwgTGluDQo=

--__=_Part_Boundary_007_684159628.885175683
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1R1ZSwmIzMyOzIwMjUtMTItMjMmIzMyO2F0
JiMzMjsxNjo0NCYjMzI7LTAzMDAsJiMzMjtOJiMyMzc7Y29sYXMmIzMyO0YuJiMzMjtSLiYjMzI7
QS4mIzMyO1ByYWRvJiMzMjt3cm90ZToNCiZndDsmIzMyO0hvb2smIzMyO09WTCYjMzk7cyYjMzI7
cGxhbmUmIzMyO2NvbG9yb3BzJiMzMjtpbml0aWFsaXphdGlvbiYjMzI7ZnVuY3Rpb24mIzMyO2lu
JiMzMjtERFAmIzMyO3RvJiMzMjthbGxvdyYjMzI7aXRzDQomZ3Q7JiMzMjt1c2FnZSYjMzI7Ynkm
IzMyO3RoZSYjMzI7TWVkaWFUZWsmIzMyO0tNUyYjMzI7ZHJpdmVyLg0KJmd0OyYjMzI7DQomZ3Q7
JiMzMjtTaWduZWQtb2ZmLWJ5OiYjMzI7TiYjMjM3O2NvbGFzJiMzMjtGLiYjMzI7Ui4mIzMyO0Eu
JiMzMjtQcmFkbyYjMzI7Jmx0O25mcmFwcmFkb0Bjb2xsYWJvcmEuY29tJmd0Ow0KJmd0OyYjMzI7
LS0tDQomZ3Q7JiMzMjsmIzE2MDtkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RkcF9jb21w
LmMmIzMyO3wmIzMyOzEmIzMyOysNCiZndDsmIzMyOyYjMTYwOzEmIzMyO2ZpbGUmIzMyO2NoYW5n
ZWQsJiMzMjsxJiMzMjtpbnNlcnRpb24oKykNCiZndDsmIzMyOw0KJmd0OyYjMzI7ZGlmZiYjMzI7
LS1naXQmIzMyO2EvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kZHBfY29tcC5jDQomZ3Q7
JiMzMjtiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGRwX2NvbXAuYw0KJmd0OyYjMzI7
aW5kZXgmIzMyOzk0YjM1NmRhNmRlNy4uZWY5MDZiMmFmZjc0JiMzMjsxMDA2NDQNCiZndDsmIzMy
Oy0tLSYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RkcF9jb21wLmMNCiZndDsm
IzMyOysrKyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RkcF9jb21wLmMNCiZn
dDsmIzMyO0BAJiMzMjstMzMxLDYmIzMyOyszMzEsNyYjMzI7QEAmIzMyO3N0YXRpYyYjMzI7Y29u
c3QmIzMyO3N0cnVjdCYjMzI7bXRrX2RkcF9jb21wX2Z1bmNzJiMzMjtkZHBfb3ZsJiMzMjs9DQom
Z3Q7JiMzMjt7DQomZ3Q7JiMzMjsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsm
IzE2MDsmIzMyOy5nZXRfZm9ybWF0cyYjMzI7PSYjMzI7bXRrX292bF9nZXRfZm9ybWF0cywNCiZn
dDsmIzMyOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMzI7Lmdl
dF9udW1fZm9ybWF0cyYjMzI7PSYjMzI7bXRrX292bF9nZXRfbnVtX2Zvcm1hdHMsDQomZ3Q7JiMz
MjsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzMyOy5pc19hZmJj
X3N1cHBvcnRlZCYjMzI7PSYjMzI7bXRrX292bF9pc19hZmJjX3N1cHBvcnRlZCwNCiZndDsmIzMy
OysmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzMyOy5wbGFuZV9jb2xvcm9w
c19pbml0JiMzMjs9JiMzMjttdGtfb3ZsX3BsYW5lX2NvbG9yb3BzX2luaXQsDQomZ3Q7JiMzMjsm
IzE2MDt9Ow0KJmd0OyYjMzI7DQomZ3Q7JiMzMjsmIzE2MDtzdGF0aWMmIzMyO2NvbnN0JiMzMjtz
dHJ1Y3QmIzMyO210a19kZHBfY29tcF9mdW5jcyYjMzI7ZGRwX3Bvc3RtYXNrJiMzMjs9JiMzMjt7
DQomZ3Q7JiMzMjsNCiZndDsmIzMyOy0tDQomZ3Q7JiMzMjsyLjUxLjANCiZndDsmIzMyOw0KJmd0
OyYjMzI7DQoNClJldmlld2VkLWJ5OiYjMzI7TWFjcGF1bCYjMzI7TGluJiMzMjsmbHQ7bWFjcGF1
bC5saW5AbWVkaWF0ZWsuY29tJmd0Ow0KDQpCZXN0JiMzMjtyZWdhcmRzLA0KTWFjcGF1bCYjMzI7
TGluDQoNCjwvcHJlPg0KPC9wPjwvYm9keT48L2h0bWw+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+
PHByZT4qKioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UNCiAqKioq
KioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFp
bCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRp
YWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRp
c2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNv
bnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNz
ZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5n
IG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5k
ZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3
ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWws
IG9yIGJlbGlldmUNCiANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJy
b3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0
byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFp
bCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5v
dA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNv
bi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_007_684159628.885175683--

