Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id xcPTL9Zonmm2VAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 04:13:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C22191217
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 04:13:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA5F110E678;
	Wed, 25 Feb 2026 03:13:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="ZlEkKzv5";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="FhbWD9kW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6285410E678
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 03:13:20 +0000 (UTC)
X-UUID: ebed368011f711f1b7fc4fdb8733b2bc-20260225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=hhe9sKP5TnF8VFX9oWFIuKApdedv04LmaNsqVtNFqFw=; 
 b=ZlEkKzv5wUI0RXKDcrnM45nUc1j8wm5Uxdci/Qb3M1dniFWS6XSqcsHfk2PikFTVHnjxXJFecASZLVvLB0sGVQtPL8yFSCpgiIdoHmbuh5ad46o4FGT0BoiQ/2eWk56tkqsVqeYQrWwixdeGYC11UU96R8Gx4wSvtYmhAQghedc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11, REQID:4b8b5a8e-f235-410e-8c88-9ca9e574b316, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:89c9d04, CLOUDID:01f5935b-a957-4259-bcca-d3af718d7034,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
 TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
 C:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ebed368011f711f1b7fc4fdb8733b2bc-20260225
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2105867874; Wed, 25 Feb 2026 11:13:13 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 25 Feb 2026 11:13:12 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 25 Feb 2026 11:13:12 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MHWk6LJDf1HNwh+mGcK7k5mgB+/fJvlIDU/sypIpEIDUuwHlaZuLworUScKtugLrPPcc6waf9BkTO1nSpf9LygyanCzNk2+0NP/8fyKgnigZbRbkwistLzmeKqiNdBI1FpL0qr7Hw1QrsEFtnThdaQLFq7QDq89Zt88+47Ak86sJUWOlE1p00XK0zgKNdFi67CgfKYpYX2aMYv5H+sH2bMSz3CW8aeGHqQMz3oNU8DlUhKO/y5P/gL1fqOVVr6evfC1n2gtN3fR0OPshHxy5/8I/wlQXJC1j1ivMIAKef/kZzOvh/ovCiU+5cG2DIQyzUcZN3YZUdc/J8lfr2gSIjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kXVhR/yjT0ItPB7qzXAPmwG98wwEqe2SQrB5CBZ7pDc=;
 b=P6qHjDuRA89BCvLuyivknALTbgB9Wh3nBZ5TmYH+iSbKe7skYv5CjKr4T3ISHL4+r4ftYZrKt/h/qyVFpfohruuDA64+W06gZRHRXM7LZI3fUv/2hsInPY4f7BYmvwxtNoKytGD9gNDAtk/ljfHcZY2fOrgiRdop+At6BO5oFcu4HXletlbMUFKqzpxYrN98BeIQrN4DavcLuYrPHQ6Gv0fQWE9eDZUlIaKfEMoBADNsBQ3dNlMSrEwTSnHqLK3vzGC006xvHMffsEV+Ndy/P6pv70dF1FEhzc1MkjgPfBi7yGRacDQKuge4eC/lhwDYx0ZW2rDacqCfdb7WW8pYUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kXVhR/yjT0ItPB7qzXAPmwG98wwEqe2SQrB5CBZ7pDc=;
 b=FhbWD9kWwb40JDToWHMmS0KPNbMai/THG7BfkPy9wzRVFJRCdzVgbmgw5PoKsAB2TBwW/ItAh4Wz9KtCYM9rv4GXGsGimuaWsydh4OwEWOGbal04XfvqEqszw7AJ9C3E2PBzWZbgtScHjbr+tEat5ICNzlP3C0XeRv11tRDd/ss=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYQPR03MB9460.apcprd03.prod.outlook.com (2603:1096:405:2fc::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 03:13:09 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640%5]) with mapi id 15.20.9632.015; Wed, 25 Feb 2026
 03:13:09 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "l.scorcia@gmail.com" <l.scorcia@gmail.com>
CC: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: Remove all conflicting aperture devices
 during probe
Thread-Topic: [PATCH v2] drm/mediatek: Remove all conflicting aperture devices
 during probe
Thread-Index: AQHcnFWcA7yfs1WLYk+qZ68OJt1tCrWS0KqA
Date: Wed, 25 Feb 2026 03:13:09 +0000
Message-ID: <b025e8152b99515f3b5a634e84d3a79707bb488b.camel@mediatek.com>
References: <20260212192605.263160-1-l.scorcia@gmail.com>
In-Reply-To: <20260212192605.263160-1-l.scorcia@gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYQPR03MB9460:EE_
x-ms-office365-filtering-correlation-id: 0865eb4a-0f2a-4dd6-3b82-08de741bcdb4
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|42112799006|366016|1800799024|7416014|376014|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?SDRsUmtTSUdDVWZ0d3NOK0pQK2xCMzVMb3c1MVhDT25oZEl6bmpxWmlWTTdZ?=
 =?utf-8?B?bjFOUE0zditYcVNYNkxINXVNK1l6bVFET01WTHdrODR6dS9TN2MvNzYyMDRn?=
 =?utf-8?B?eVVpL3E0OFB2N0RzM0psVE9KZDBFRFpvYmEwcVRFbFRKZmlKbnlseGx1TS9B?=
 =?utf-8?B?V1FQa1pEa1FKVyt6d0QwOFA1aS9YWUs5dkhYclBlNmxoaFh5VWJaNWlLR0xX?=
 =?utf-8?B?cEl5b2ZLZFlEd0g1Y2ZFVXd2dXhxZWJYeHVPeXV5cXdjNXNGTDE4TVllUUxQ?=
 =?utf-8?B?M21yYzk2NWo3TzlGSTd4U3V0ZlJ3TFVidkZhUStoSEE5NDZyWUN0ZUZWZVM3?=
 =?utf-8?B?UExLYThhNVR6bnNvcFBPcWtsWVdGRHhuQzhHcjN6dnFtWEtMc3RpVnRFUzNk?=
 =?utf-8?B?MzdIc3dpdEI1dUIzRzhESldaNTlYbTRUdFZMK2NLeno2OUxuM3kzQm50Vzk5?=
 =?utf-8?B?U29YcVovdE9Tam1TMkkzQ2h5OUErODFVcC9OQXR5ajNxMXhvdnMySC9OVEN0?=
 =?utf-8?B?VXkrWXhsWTNZVUEyelVzVDYxRFpjQlNBdURQdVBiYTc1amU5Rnh5anJqNFV4?=
 =?utf-8?B?K3V2YllwekxSdVlTUWcyc1lNajRvckc0UW9aem1tMWVjbExhV1psU3VBM3l4?=
 =?utf-8?B?RWZQZFpqazBkT1daeFRvRVhsS01TMkZnZ0lBRkZkSm9CbGtmU0I0M2xQYVdy?=
 =?utf-8?B?VlJlMzhadHlneGRibThId2RiY3lJT2lPWkhXMUJLMGVYcFlKbDdJZ3pTaDk1?=
 =?utf-8?B?RU1CSWJSWmIwOEoreVNEN0ZvdVJMR28ydW0rMGl4ZDB6TVFGQTErbG5hblV6?=
 =?utf-8?B?WXJWNFduY0sweHI5Sit3alhyUGRERHVlczd1ck56UDZuT0NJUjcyQWE4V3JF?=
 =?utf-8?B?RTViWTI4MHhaR2xJb25scHBXaFA5a3RManJlRzA2VU5BbzZ0RzI5dGRqTU1Z?=
 =?utf-8?B?RnJkc2I5ZGs4eTdsc3JyQUxlSEZzcWxhZzV4c1JmUFkzM1dRM3BwL2VqZzB1?=
 =?utf-8?B?QzhmZWx2bUxmcGsraFVmV05oK3VLS0NqQTR3dUZLOGRvL1FwUDhONlFlRFBH?=
 =?utf-8?B?ZGhzWUU1b1pJakpOc1dQNHlBcDVTUkoraWhjYy9HdGRJN2srWUNYZXM0Wmhz?=
 =?utf-8?B?R2tjKzcyZFVjMWQ5d01jdTdHWXBJTWVndy9jZU9jZjAyRkd6TENrL3NMc0RH?=
 =?utf-8?B?ZXgwY0N3SzA0QlN6dnI0ZFBnQUgxaW1vS1ZYUG9IeExucjZvZ20ySXE2M25H?=
 =?utf-8?B?dWV1Z0N6MmU4cDM4YjBPMVJhVkhTaG9uR0tKcWRQU2pDVjhWVHZERkJMMDlz?=
 =?utf-8?B?VjZFM3ZoNFBHZXBqaHBwaUd3bTlSVS9aQ1pmVitNVW5VanNmSHR0YzNSODAw?=
 =?utf-8?B?Yk5YazFNOGk2RENtR3l5TnV1UzhUdW9WcHZHWE1jTUkrdTNJOWJNK0Y4dkJJ?=
 =?utf-8?B?em5CR3M2OHR3cUFZVUNMdlVyT0Mzd2lqaVdQZG82MU43bHN5cng4S0JmNFRZ?=
 =?utf-8?B?cFBDbVlSVVIrU2RyWXY4UlBkcjlhdTdrc1VLVktRYlpFSnpDcTBkdEZiTU5H?=
 =?utf-8?B?dHJycmdiUUNzcXJHSGNUVnovS0hQaHNSRHBTbnBOY1ZZMmFKVVcvSGtGTHFC?=
 =?utf-8?B?MWVLOFpLRC9udnpqK25qU2w4MjZwZTdRcElYNlF1TFpiamNicThNSW1jaUVB?=
 =?utf-8?B?Y1ZmeFZuaG1URTBOK3E0N3ZHU0xpa1RSVUJTVkRwVDY4WUlRdmdtVWhEaCtk?=
 =?utf-8?B?bUZUYVI4aWpVYVVqZ1RoWnQrM3RqelczL0RhMkl1Mkc1Kzdmalk4Z01DYUN5?=
 =?utf-8?B?bG9Sb2VHakFwSkg0RkYxbTZtUGxxZ0lCcWZWMkdwTDZ2QTc5d2xpeHJnRmZI?=
 =?utf-8?B?ZFBlR0wzajF6WDRXTmpXMnRUM0ZCZ1FiYUFPcFBzaFhKRjltSnkwTTBoVkdo?=
 =?utf-8?B?ZVVNWmFiYTgrY0hHbUtmcnpBNW9iMW5iajdvS0F0cnBSTWIwYnhEYXk2SnJt?=
 =?utf-8?B?SEVpcTlrczE0M21SbjBDT01DWGxoSjNIaWVmRVdCdE92L0FSQi9NRzYwczIr?=
 =?utf-8?B?VkhtRkhIZ2hWQXd6SXkxclBvT05oQS9EUW1KeHVjTUt1SjBGbkMyTEVacks3?=
 =?utf-8?B?SC83NDE5a1dWVE96cDNZbDJQY2JDQi81NFh5SzczWWZZV09XQnJCS3JGUW1K?=
 =?utf-8?Q?NOfItKOnrXq1dG/DMCYtJnk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(366016)(1800799024)(7416014)(376014)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cE9XclJxd0hFeGZycWIrK2ZsSUp2Z1JpNmsyZThld043MzlEWGlZZFU2Q2RB?=
 =?utf-8?B?MmZ2Z3hUTittcHIvYnU1RGM4Qm1sUFRaL3pnYUk2KzhZWkI3aVhQVys1R1k3?=
 =?utf-8?B?ZnovU0Vka2lmOS85V3VUTzArQ2t5S2t6Vy9McUpReG5QOHlwbG1sQ0ZNMDMx?=
 =?utf-8?B?VDFDUzlRQm8yWW1VMHNKUi9HNHJxbnplT3BWRnJacFpwWWFXUkdhN2lRN2Q0?=
 =?utf-8?B?T3VnNTVuZTdJakcyVjJCSDZielNzNm1iZVB4RmErenNyTE42VmJnY0kwOWY5?=
 =?utf-8?B?dElKYzZ2dXNaY2ZmaHRXNDdZdGpuNlB4eWZvRnpLVmRXOTI1YXB4Vjh2UlMw?=
 =?utf-8?B?RXZOcjhSWXRreXlZTlJyYUVhRUxsZXRDdFJ4ZjNNQmg5eUFHVE1BbW93Q09q?=
 =?utf-8?B?Rlo0ZnpNNWZRSHdpZllMZXdiemcxK3B5c3FEQktna1laZ0VFQkVmK2J2Tllr?=
 =?utf-8?B?NWpReW1TQ1RYbFI2dHlZUVV3VXZoejd5MDNjakY3UEQyeHlValI2R0o5MEs3?=
 =?utf-8?B?M2NIYngxdFU1aUR5UVJpQndXZmxSRmlhRVc0ZWVYYWk2OTRWQW9nV1hNU3dY?=
 =?utf-8?B?RkFHd2JLMXdCODNZblpId2xBdjZGV1NxL2pqRlJ3azQ2TkdZYUZ1NXVvdWJM?=
 =?utf-8?B?NVJ1a2MybFhFOGxIMkdPT2J0VWZFb0pIYzNJSUhJbWZsSTFDOTBWWVppWUdN?=
 =?utf-8?B?aHh0eEtyQWMrVXdwTERpcklHeWpaMXUwck9Wc1RsMnF5bWltZnJhTjd1cWlY?=
 =?utf-8?B?WFNMREZ3T0cwcUlES2M3TkpuZ0JhMWdCUVZ2UTJNRWNBSWlmQktvcTdsU1NN?=
 =?utf-8?B?SDFXd0xCSEFoSnE1Y2x5alBvTEs5MG5MWTVaVXV1bVBSQXFlc24yZmJvc1R6?=
 =?utf-8?B?ZkRtS2xFMUJab1VubUNLclI1NWdMRjFwQzJJUFNRSmw2NjJEL2c1ZTYxMHIw?=
 =?utf-8?B?UFBXdkprWHlMT0hFQWpUOEpjcVJBK2FIUFNETHdEU3BUaG9sOEdOOUJwQ3p1?=
 =?utf-8?B?TW0xdWk0bllieDBERm4zSSthQjhKU2x1blFBQmlta2g4WVQveVNyOUQ0emQy?=
 =?utf-8?B?UnBmUjN0Zm9jYzhTOXVXczd2dWhLOHlCcVBwT0NmVDVmV2RSZURnaEpUTE51?=
 =?utf-8?B?WURGbG5IQjcyVjlVMmVFcGk0ZEJtVVFOMGQvSHpqZlFZNnFBYWFFb2lPSnJh?=
 =?utf-8?B?N2p5Q1FqZm5Md2o1aGRXckFMUmhtSU1ZVXlsTHFpdGpnUWQ0T25lOTNZN1Vw?=
 =?utf-8?B?L2lsYlYwc1ZWZGcxamlsVjhpeEFabjV3cWxyN0Q5VDgvdklXRGkwRE5PV0or?=
 =?utf-8?B?MGF2Mm1DMnFXazhYQ1ErdjE5cTRwM3NMMEZkeG5BMy9sUWdsTURYOU5pRllZ?=
 =?utf-8?B?ZEF0UXVRUlhKNDR0Y3FyL3hhK3pyZ0JKdVlwMjhLb281THdsaGtSRTEvbHcr?=
 =?utf-8?B?LzgraEtBSmxFbmJJVkRZYUlJbEI3T3kwdzRPMUxGMUdjOTFYaHYzOEdJZzdv?=
 =?utf-8?B?QWZMRUNPME5aYWtOZGNPcDEzRDB2UmVKbkNsenNaQTBTNk9oRHl4aU4yaTls?=
 =?utf-8?B?aW1FT1lqUUl3U2tMR2ZhRnd4ZDA0NEFHYWNxNWMwaGlFQ3Jvd2t0VTdMemMz?=
 =?utf-8?B?OEM5WnQydk91Zyt3eVE1M3hXay9DWStaNDNJVVE0Y2p5NHRTejlHNzRwMmtQ?=
 =?utf-8?B?TFFVQ3NyU0tzbGZaUDNremlqQVdkWUFNUjJCcEFLREh6SGZKTWxhbWRrZXFj?=
 =?utf-8?B?M2N2RDNEUW9WMUFpdzlJZmRoWHcyZ0ZxdVhCbkpzdUMvN09raUxMM3F6WUhR?=
 =?utf-8?B?U1R6eWU3Nm1YU05rRTFqLzBJV09RVng0RDdva1FSSlFaSUZNTkR5LzNUUW82?=
 =?utf-8?B?TFY5cGtFRXl3cFpmSHJydnVuNm5NckZqTDhnWGxXMHdISVpsMy9KN1I3YXJF?=
 =?utf-8?B?Y1V2YWJFcGxiQUpFMUlMajBTeFFOd2tiS1B1NzczaS8wcXlPWnJub1FzT3Ru?=
 =?utf-8?B?YjNYZmg2RHdNdDA4Q2dGZCtsRE91ZU5rdHhaNlh3MjRTdDkvOENFQW5QY0Fz?=
 =?utf-8?B?cTFaSXpaZGJnNzNiSis0cTBZRHNscnFZeUEyV3JFV1pUREU0dWVwMDlLODRt?=
 =?utf-8?B?aW0yQmFCUThya2tTWVErL0d6R21panpic2JZYUQ0TUtZUXZIdGxmT09ua21T?=
 =?utf-8?B?Y01CNUU1OFZ0UVFSQ0lSME9rQmk1QUxOUkVMdmNTOEtFS1RzNlJjM1FSUU1z?=
 =?utf-8?B?blNxem1RdDE5YmNtaWVOMXNtakdtZTJiVVhIZk51cFVXa0sxQ3B1Qk0vd2Q2?=
 =?utf-8?B?RXNBdWtBc01KUWJ2czJ3dzlmdFVOaGJmVzhYeS9nQ21UOTFqT2QrQT09?=
Content-ID: <8AFA260D5AC4344B9DFF0BAB81F3CDD2@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0865eb4a-0f2a-4dd6-3b82-08de741bcdb4
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2026 03:13:09.7025 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7Ft+h7Z8daXGb7QeADsrrxsagcwar6tFI9kuF1pzcVVxbdQuCGAGZydLu5NBwxSKbFGg4fiabIGPuUmM5a+jHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYQPR03MB9460
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_001_1283492634.1717876790"
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[mediatek.com:s=dk];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_BASE64_TEXT(0.10)[];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[lists.infradead.org,gmail.com];
	TO_DN_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[ck.hu@mediatek.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-mediatek@lists.infradead.org,m:l.scorcia@gmail.com,m:chunkuang.hu@kernel.org,m:simona@ffwll.ch,m:angelogioacchino.delregno@collabora.com,m:airlied@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:p.zabel@pengutronix.de,m:matthias.bgg@gmail.com,m:lscorcia@gmail.com,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	DMARC_POLICY_ALLOW(0.00)[mediatek.com,quarantine];
	FREEMAIL_CC(0.00)[kernel.org,ffwll.ch,lists.freedesktop.org,collabora.com,gmail.com,vger.kernel.org,lists.infradead.org,pengutronix.de];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.993];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ck.hu@mediatek.com,dri-devel-bounces@lists.freedesktop.org];
	R_DKIM_REJECT(0.00)[mediateko365.onmicrosoft.com:s=selector2-mediateko365-onmicrosoft-com];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[mediatek.com:+,mediateko365.onmicrosoft.com:-];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 13C22191217
X-Rspamd-Action: no action

--__=_Part_Boundary_001_1283492634.1717876790
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDI2LTAyLTEyIGF0IDE5OjIyICswMDAwLCBMdWNhIExlb25hcmRvIFNjb3JjaWEg
d3JvdGU6DQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBv
cGVuIGF0dGFjaG1lbnRzIHVudGlsIHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhl
IGNvbnRlbnQuDQo+IA0KPiANCj4gSWYgYSBkZXZpY2UgaGFzIGEgZnJhbWVidWZmZXIgYXZhaWxh
YmxlIGl0IG1pZ2h0IGJlIGFscmVhZHkgdXNlZCBhcw0KPiBkaXNwbGF5IGJ5IHNpbXBsZS1mcmFt
ZWJ1ZmZlciBvciBzaW1wbGVkcm0gd2hlbiBtZWRpYXRlay1kcm0gaXMgcHJvYmVkLg0KPiBUaGlz
IGlzIGFjdHVhbGx5IGhlbHBmdWwgd2hlbiBwb3J0aW5nIHRvIGEgbmV3IGRldmljZSBhcw0KPiBm
cmFtZWJ1ZmZlcnMgYXJlIHNpbXBsZSB0byBzZXR1cCBpbiBkZXZpY2UgdHJlZXMgYW5kIGZiY29u
IGNhbiBiZQ0KPiB1c2VkIHRvIG1vbml0b3IgdGhlIGtlcm5lbCBib290IHByb2Nlc3MuDQo+IA0K
PiBXaGVuIGRybS1tZWRpYXRlayBsb2FkcyBhIG5ldyBmYiBkZXZpY2UgaXMgaW5pdGlhbGl6ZWQs
IGhvd2V2ZXINCj4gZmJjb24gcmVtYWlucyBhdHRhY2hlZCB0byB0aGUgaW5pdGlhbCBmcmFtZWJ1
ZmZlciB3aGljaCBpcyBubyBsb25nZXINCj4gY29ubmVjdGVkIHRvIHRoZSBhY3R1YWwgZGlzcGxh
eSAtIHRoZSBlYXJseSBmYiBpcyBuZXZlciByZW1vdmVkLg0KPiANCj4gV2UgY2FuIGdyYWNlZnVs
bHkgdHJhbnNpdGlvbiBmcm9tIGZyYW1lYnVmZmVyIGhhbmRsaW5nIHRvIGRybS1tYW5hZ2VkDQo+
IGRpc3BsYXkgYnkgY2FsbGluZyBhcGVydHVyZV9yZW1vdmVfYWxsX2NvbmZsaWN0aW5nX2Rldmlj
ZXMgYmVmb3JlDQo+IHJlZ2lzdGVyaW5nIG1lZGlhdGVrLWRybS4gVGhpcyB0YWtlcyBjYXJlIG9m
IHVubG9hZGluZyBvdGhlciBmYg0KPiBkZXZpY2VzL2RyaXZlcnMgYW5kIGRpc2Nvbm5lY3RzIGZi
Y29uIHdoaWNoIHRoZW4gYXV0b21hdGljYWxseQ0KPiByZWNvbm5lY3RzIHRvIG1lZGlhdGVrZHJt
ZmIgYXMgc29vbiBhcyBpdCdzIGF2YWlsYWJsZS4NCj4gDQo+IFRoZSBmdW5jdGlvbiBpcyBpbnZv
a2VkIGp1c3QgYmVmb3JlIGRybV9kZXZfcmVnaXN0ZXIoKSB0byBraWNrIG91dA0KPiB0aGUgZXhp
c3RpbmcgZnJhbWVidWZmZXIgYXMgbGF0ZSBhcyBwb3NzaWJsZSB0byByZWR1Y2UgdGhlIHRpbWUg
dGhlDQo+IHNjcmVlbiBpcyB1bnJlc3BvbnNpdmUuDQoNClJldmlld2VkLWJ5OiBDSyBIdSA8Y2su
aHVAbWVkaWF0ZWsuY29tPg0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBMdWNhIExlb25hcmRvIFNj
b3JjaWEgPGwuc2NvcmNpYUBnbWFpbC5jb20+DQo+IC0tLQ0KPiB2MjogTW92ZWQgdGhlIGNhbGwg
dG8gYXBlcnR1cmVfcmVtb3ZlX2FsbF9jb25mbGljdGluZ19kZXZpY2VzIHRvDQo+ICAgICByaWdo
dCBiZWZvcmUgZHJtX2Rldl9yZWdpc3RlcigpDQo+IA0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kcm1fZHJ2LmMgfCA1ICsrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRp
b25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cm1fZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYw0KPiBpbmRl
eCBhOTRjNTFhODMyNjEuLjAyZWZmZDlmYzY5OCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kcm1fZHJ2LmMNCj4gQEAgLTQsNiArNCw3IEBADQo+ICAgKiBBdXRob3I6IFlUIFNI
RU4gPHl0LnNoZW5AbWVkaWF0ZWsuY29tPg0KPiAgICovDQo+IA0KPiArI2luY2x1ZGUgPGxpbnV4
L2FwZXJ0dXJlLmg+DQo+ICAjaW5jbHVkZSA8bGludXgvY29tcG9uZW50Lmg+DQo+ICAjaW5jbHVk
ZSA8bGludXgvbW9kdWxlLmg+DQo+ICAjaW5jbHVkZSA8bGludXgvb2YuaD4NCj4gQEAgLTY3MCw2
ICs2NzEsMTAgQEAgc3RhdGljIGludCBtdGtfZHJtX2JpbmQoc3RydWN0IGRldmljZSAqZGV2KQ0K
PiAgICAgICAgIGlmIChyZXQgPCAwKQ0KPiAgICAgICAgICAgICAgICAgZ290byBlcnJfZnJlZTsN
Cj4gDQo+ICsgICAgICAgcmV0ID0gYXBlcnR1cmVfcmVtb3ZlX2FsbF9jb25mbGljdGluZ19kZXZp
Y2VzKERSSVZFUl9OQU1FKTsNCj4gKyAgICAgICBpZiAocmV0IDwgMCkNCj4gKyAgICAgICAgICAg
ICAgIGRldl9lcnIoZGV2LCAiRXJyb3IgJWQgd2hpbGUgcmVtb3ZpbmcgY29uZmxpY3RpbmcgYXBl
cnR1cmUgZGV2aWNlcyIsIHJldCk7DQo+ICsNCj4gICAgICAgICByZXQgPSBkcm1fZGV2X3JlZ2lz
dGVyKGRybSwgMCk7DQo+ICAgICAgICAgaWYgKHJldCA8IDApDQo+ICAgICAgICAgICAgICAgICBn
b3RvIGVycl9kZWluaXQ7DQo+IC0tDQo+IDIuNDMuMA0KPiANCj4gDQoNCg==

--__=_Part_Boundary_001_1283492634.1717876790
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1RodSwmIzMyOzIwMjYtMDItMTImIzMyO2F0
JiMzMjsxOToyMiYjMzI7KzAwMDAsJiMzMjtMdWNhJiMzMjtMZW9uYXJkbyYjMzI7U2NvcmNpYSYj
MzI7d3JvdGU6DQomZ3Q7JiMzMjtFeHRlcm5hbCYjMzI7ZW1haWwmIzMyOzomIzMyO1BsZWFzZSYj
MzI7ZG8mIzMyO25vdCYjMzI7Y2xpY2smIzMyO2xpbmtzJiMzMjtvciYjMzI7b3BlbiYjMzI7YXR0
YWNobWVudHMmIzMyO3VudGlsJiMzMjt5b3UmIzMyO2hhdmUmIzMyO3ZlcmlmaWVkJiMzMjt0aGUm
IzMyO3NlbmRlciYjMzI7b3ImIzMyO3RoZSYjMzI7Y29udGVudC4NCiZndDsmIzMyOw0KJmd0OyYj
MzI7DQomZ3Q7JiMzMjtJZiYjMzI7YSYjMzI7ZGV2aWNlJiMzMjtoYXMmIzMyO2EmIzMyO2ZyYW1l
YnVmZmVyJiMzMjthdmFpbGFibGUmIzMyO2l0JiMzMjttaWdodCYjMzI7YmUmIzMyO2FscmVhZHkm
IzMyO3VzZWQmIzMyO2FzDQomZ3Q7JiMzMjtkaXNwbGF5JiMzMjtieSYjMzI7c2ltcGxlLWZyYW1l
YnVmZmVyJiMzMjtvciYjMzI7c2ltcGxlZHJtJiMzMjt3aGVuJiMzMjttZWRpYXRlay1kcm0mIzMy
O2lzJiMzMjtwcm9iZWQuDQomZ3Q7JiMzMjtUaGlzJiMzMjtpcyYjMzI7YWN0dWFsbHkmIzMyO2hl
bHBmdWwmIzMyO3doZW4mIzMyO3BvcnRpbmcmIzMyO3RvJiMzMjthJiMzMjtuZXcmIzMyO2Rldmlj
ZSYjMzI7YXMNCiZndDsmIzMyO2ZyYW1lYnVmZmVycyYjMzI7YXJlJiMzMjtzaW1wbGUmIzMyO3Rv
JiMzMjtzZXR1cCYjMzI7aW4mIzMyO2RldmljZSYjMzI7dHJlZXMmIzMyO2FuZCYjMzI7ZmJjb24m
IzMyO2NhbiYjMzI7YmUNCiZndDsmIzMyO3VzZWQmIzMyO3RvJiMzMjttb25pdG9yJiMzMjt0aGUm
IzMyO2tlcm5lbCYjMzI7Ym9vdCYjMzI7cHJvY2Vzcy4NCiZndDsmIzMyOw0KJmd0OyYjMzI7V2hl
biYjMzI7ZHJtLW1lZGlhdGVrJiMzMjtsb2FkcyYjMzI7YSYjMzI7bmV3JiMzMjtmYiYjMzI7ZGV2
aWNlJiMzMjtpcyYjMzI7aW5pdGlhbGl6ZWQsJiMzMjtob3dldmVyDQomZ3Q7JiMzMjtmYmNvbiYj
MzI7cmVtYWlucyYjMzI7YXR0YWNoZWQmIzMyO3RvJiMzMjt0aGUmIzMyO2luaXRpYWwmIzMyO2Zy
YW1lYnVmZmVyJiMzMjt3aGljaCYjMzI7aXMmIzMyO25vJiMzMjtsb25nZXINCiZndDsmIzMyO2Nv
bm5lY3RlZCYjMzI7dG8mIzMyO3RoZSYjMzI7YWN0dWFsJiMzMjtkaXNwbGF5JiMzMjstJiMzMjt0
aGUmIzMyO2Vhcmx5JiMzMjtmYiYjMzI7aXMmIzMyO25ldmVyJiMzMjtyZW1vdmVkLg0KJmd0OyYj
MzI7DQomZ3Q7JiMzMjtXZSYjMzI7Y2FuJiMzMjtncmFjZWZ1bGx5JiMzMjt0cmFuc2l0aW9uJiMz
Mjtmcm9tJiMzMjtmcmFtZWJ1ZmZlciYjMzI7aGFuZGxpbmcmIzMyO3RvJiMzMjtkcm0tbWFuYWdl
ZA0KJmd0OyYjMzI7ZGlzcGxheSYjMzI7YnkmIzMyO2NhbGxpbmcmIzMyO2FwZXJ0dXJlX3JlbW92
ZV9hbGxfY29uZmxpY3RpbmdfZGV2aWNlcyYjMzI7YmVmb3JlDQomZ3Q7JiMzMjtyZWdpc3Rlcmlu
ZyYjMzI7bWVkaWF0ZWstZHJtLiYjMzI7VGhpcyYjMzI7dGFrZXMmIzMyO2NhcmUmIzMyO29mJiMz
Mjt1bmxvYWRpbmcmIzMyO290aGVyJiMzMjtmYg0KJmd0OyYjMzI7ZGV2aWNlcy9kcml2ZXJzJiMz
MjthbmQmIzMyO2Rpc2Nvbm5lY3RzJiMzMjtmYmNvbiYjMzI7d2hpY2gmIzMyO3RoZW4mIzMyO2F1
dG9tYXRpY2FsbHkNCiZndDsmIzMyO3JlY29ubmVjdHMmIzMyO3RvJiMzMjttZWRpYXRla2RybWZi
JiMzMjthcyYjMzI7c29vbiYjMzI7YXMmIzMyO2l0JiMzOTtzJiMzMjthdmFpbGFibGUuDQomZ3Q7
JiMzMjsNCiZndDsmIzMyO1RoZSYjMzI7ZnVuY3Rpb24mIzMyO2lzJiMzMjtpbnZva2VkJiMzMjtq
dXN0JiMzMjtiZWZvcmUmIzMyO2RybV9kZXZfcmVnaXN0ZXIoKSYjMzI7dG8mIzMyO2tpY2smIzMy
O291dA0KJmd0OyYjMzI7dGhlJiMzMjtleGlzdGluZyYjMzI7ZnJhbWVidWZmZXImIzMyO2FzJiMz
MjtsYXRlJiMzMjthcyYjMzI7cG9zc2libGUmIzMyO3RvJiMzMjtyZWR1Y2UmIzMyO3RoZSYjMzI7
dGltZSYjMzI7dGhlDQomZ3Q7JiMzMjtzY3JlZW4mIzMyO2lzJiMzMjt1bnJlc3BvbnNpdmUuDQoN
ClJldmlld2VkLWJ5OiYjMzI7Q0smIzMyO0h1JiMzMjsmbHQ7Y2suaHVAbWVkaWF0ZWsuY29tJmd0
Ow0KDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtMdWNhJiMzMjtMZW9u
YXJkbyYjMzI7U2NvcmNpYSYjMzI7Jmx0O2wuc2NvcmNpYUBnbWFpbC5jb20mZ3Q7DQomZ3Q7JiMz
MjstLS0NCiZndDsmIzMyO3YyOiYjMzI7TW92ZWQmIzMyO3RoZSYjMzI7Y2FsbCYjMzI7dG8mIzMy
O2FwZXJ0dXJlX3JlbW92ZV9hbGxfY29uZmxpY3RpbmdfZGV2aWNlcyYjMzI7dG8NCiZndDsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7cmlnaHQmIzMyO2JlZm9yZSYjMzI7ZHJtX2Rldl9yZWdpc3Rl
cigpDQomZ3Q7JiMzMjsNCiZndDsmIzMyOyYjMzI7ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcm1fZHJ2LmMmIzMyO3wmIzMyOzUmIzMyOysrKysrDQomZ3Q7JiMzMjsmIzMyOzEmIzMyO2Zp
bGUmIzMyO2NoYW5nZWQsJiMzMjs1JiMzMjtpbnNlcnRpb25zKCspDQomZ3Q7JiMzMjsNCiZndDsm
IzMyO2RpZmYmIzMyOy0tZ2l0JiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJt
X2Rydi5jJiMzMjtiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jDQomZ3Q7
JiMzMjtpbmRleCYjMzI7YTk0YzUxYTgzMjYxLi4wMmVmZmQ5ZmM2OTgmIzMyOzEwMDY0NA0KJmd0
OyYjMzI7LS0tJiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jDQom
Z3Q7JiMzMjsrKysmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMN
CiZndDsmIzMyO0BAJiMzMjstNCw2JiMzMjsrNCw3JiMzMjtAQA0KJmd0OyYjMzI7JiMzMjsmIzMy
OyomIzMyO0F1dGhvcjomIzMyO1lUJiMzMjtTSEVOJiMzMjsmbHQ7eXQuc2hlbkBtZWRpYXRlay5j
b20mZ3Q7DQomZ3Q7JiMzMjsmIzMyOyYjMzI7Ki8NCiZndDsmIzMyOw0KJmd0OyYjMzI7KyNpbmNs
dWRlJiMzMjsmbHQ7bGludXgvYXBlcnR1cmUuaCZndDsNCiZndDsmIzMyOyYjMzI7I2luY2x1ZGUm
IzMyOyZsdDtsaW51eC9jb21wb25lbnQuaCZndDsNCiZndDsmIzMyOyYjMzI7I2luY2x1ZGUmIzMy
OyZsdDtsaW51eC9tb2R1bGUuaCZndDsNCiZndDsmIzMyOyYjMzI7I2luY2x1ZGUmIzMyOyZsdDts
aW51eC9vZi5oJmd0Ow0KJmd0OyYjMzI7QEAmIzMyOy02NzAsNiYjMzI7KzY3MSwxMCYjMzI7QEAm
IzMyO3N0YXRpYyYjMzI7aW50JiMzMjttdGtfZHJtX2JpbmQoc3RydWN0JiMzMjtkZXZpY2UmIzMy
OypkZXYpDQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
aWYmIzMyOyhyZXQmIzMyOyZsdDsmIzMyOzApDQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyO2dvdG8mIzMyO2Vycl9mcmVlOw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtyZXQmIzMyOz0mIzMyO2FwZXJ0dXJlX3JlbW92ZV9hbGxf
Y29uZmxpY3RpbmdfZGV2aWNlcyhEUklWRVJfTkFNRSk7DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtpZiYjMzI7KHJldCYjMzI7Jmx0OyYjMzI7MCkNCiZndDsm
IzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtkZXZfZXJyKGRldiwmIzMyOyZxdW90O0Vycm9yJiMzMjsl
ZCYjMzI7d2hpbGUmIzMyO3JlbW92aW5nJiMzMjtjb25mbGljdGluZyYjMzI7YXBlcnR1cmUmIzMy
O2RldmljZXMmcXVvdDssJiMzMjtyZXQpOw0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3JldCYjMzI7PSYjMzI7ZHJtX2Rldl9yZWdp
c3Rlcihkcm0sJiMzMjswKTsNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjtpZiYjMzI7KHJldCYjMzI7Jmx0OyYjMzI7MCkNCiZndDsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7Z290byYjMzI7ZXJyX2RlaW5pdDsNCiZndDsmIzMyOy0tDQomZ3Q7JiMz
MjsyLjQzLjANCiZndDsmIzMyOw0KJmd0OyYjMzI7DQoNCg0KPC9wcmU+DQo8L3A+PC9ib2R5Pjwv
aHRtbD48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsg
Q29uZmlkZW50aWFsaXR5IE5vdGljZQ0KICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3Jt
YXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQph
dHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQs
IG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxh
d3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRl
ZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBw
cmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBp
dHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkg
cHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVu
ZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZQ0KIA0KdGhhdCB5b3UgaGF2
ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVy
IA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBh
bmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRz
KSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0
aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0t
Pg==

--__=_Part_Boundary_001_1283492634.1717876790--

