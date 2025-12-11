Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03950CB6C52
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 18:37:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6E2A10E871;
	Thu, 11 Dec 2025 17:37:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Pl9PozSO";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="je7nmQv5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D0C410E840
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 17:37:27 +0000 (UTC)
X-UUID: 0bb8ccb6d6b811f0b33aeb1e7f16c2b6-20251212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=KPZhjhT/KnbRELYfEa09D2XdOSzy7636z2rBqinnu30=; 
 b=Pl9PozSO4febEicGgoBkH+2JRmKf08s/nHlgc+cNAtquvzkAav7cSDAugBE7AE11oq9NPqo5Z/tB3ApSc9H7TehSiHeSSQEcoej/IbmM5LrD8K61PhHiY0QtQZkwkrD+K4m0nQ2dc1cW5daFf0XmqFVkmp0OH14G4eFHW1SFN4k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6, REQID:7eac3633-d7de-4579-80b2-110efbeddbe0, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:a9d874c, CLOUDID:d6396b28-e3a2-4f78-a442-8c73c4eb9e9d,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
 TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
 C:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0bb8ccb6d6b811f0b33aeb1e7f16c2b6-20251212
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 394350968; Fri, 12 Dec 2025 01:37:20 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 12 Dec 2025 01:37:19 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Fri, 12 Dec 2025 01:37:19 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EBvOZIykH3oL8/ZvpiZXMvCd9QyrgdmjYg/C8cZ0SYbeTQp4hCRm9k/BuyVncm4aQCNRzHkEppsAqdMhYuB6PfLFcb7ykhgRqoU4FjtnQJyvBIzbmYa3Bi4x1lN+3WzHIqsGQK4JJD+tlaxKqdMa0Q57ct5G0WwVE2PDApkIsyNnDdKimMnnjegoJHnQ99zxwZJF2Mlt8a/jWPUh0C/OBRZ3y4TYZkHX1g1i67tv1DAj3V6a0s/gHApOCa+Ay1Mw6KaiRtVkb92rg0ke3jaUpH5Z1+nlDssrGtIQqro8zJX931QzUBQHVbQ4e1atjqYlphWKk2pt3TsdxbPQJpu6bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ILgVA4J/wpR2Bl7t7cDq1tNNrQfXA1fTB7HfwMD1Smw=;
 b=EEv1vTu14AOGOelElJ92WnNy8RHrbBLS4iqmjbigyJHo6IZZK5vwNWgewlxggo3aIWXr5gBiY7bLxBGvsgV6yVP5PHBmmr0/3tunrtM/Ddlzjx/SQLClCML3c8Mh+2h1HAeBtjjRyWRSM8s5zzRSuKdU8HqigFC5hr+9wLgXx5ZYIaw3Y7crePB2JLdy4CRIsuqHw/DSIUgnR/6dKhkjsy9wU28hJRi3uilniZnhAswFhNadzZwBRko/KHMYN70v2FC0UlJEZ4JNRrxjiq7lKRDRdCjszyly/WVoN3fMRw/VQaaDUStb1MzWGycjlFEJAEtpOlYhp3GpsGqTrUmG1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ILgVA4J/wpR2Bl7t7cDq1tNNrQfXA1fTB7HfwMD1Smw=;
 b=je7nmQv5fslQ8uV3SY1DLeGSu7S78VGyg3r8lyPuGoBwNUoQHZ6grhkBvxqoz9b3mLqvuwfw77TfDUi86EcPdyS44JHUB8gbw/5lnWRo7uPE8zR/iireOP6FTh2ZeSIcvTgp+3CZiBnodaOe+0vsUi0nGgKSpWq4Cs6zCIQLkOI=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SEZPR03MB7122.apcprd03.prod.outlook.com (2603:1096:101:e5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Thu, 11 Dec
 2025 17:37:15 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%7]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 17:37:15 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>, "robh@kernel.org"
 <robh@kernel.org>, "nicolas@ndufresne.ca" <nicolas@ndufresne.ca>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "jassisinghbrar@gmail.com"
 <jassisinghbrar@gmail.com>, "mchehab@kernel.org" <mchehab@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>
CC: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 =?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "wenst@chromium.org" <wenst@chromium.org>,
 =?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
 <Xiandong.Wang@mediatek.com>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>,
 =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 5/5] media: platform: mtk-mdp3: Change cmdq_pkt_jump_rel()
 to cmdq_pkt_jump_rel_temp()
Thread-Topic: [PATCH 5/5] media: platform: mtk-mdp3: Change
 cmdq_pkt_jump_rel() to cmdq_pkt_jump_rel_temp()
Thread-Index: AQHcSn/vn804ekRaC0qmIrUq+527XbUaBPoAgALvmQA=
Date: Thu, 11 Dec 2025 17:37:15 +0000
Message-ID: <380a7eee3a949a6fb28116820285cc895eb5d65b.camel@mediatek.com>
References: <20251031160309.1654761-1-jason-jh.lin@mediatek.com>
 <20251031160309.1654761-6-jason-jh.lin@mediatek.com>
 <e0144120e0943b94454b1cddd5359c34b5a15412.camel@ndufresne.ca>
In-Reply-To: <e0144120e0943b94454b1cddd5359c34b5a15412.camel@ndufresne.ca>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SEZPR03MB7122:EE_
x-ms-office365-filtering-correlation-id: 4c45f492-26c4-4226-7b4e-08de38dbecc5
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?bE9sSEpxVDBrcVRoZEhaV2VPaURna1RqdVp4cElVblYrTS8yTCtaWlpwanUr?=
 =?utf-8?B?V3h0TUJONlpGN3lKT3hqMlArVVB3RUQwanY2Rk16a3lTRHI4RXZBeEtheng0?=
 =?utf-8?B?V0VwdnFZc0RDZW01cjhXWitPVFBITEljdkdlNUtYYWJ0RlRDdVJtUGZrY0hO?=
 =?utf-8?B?TzBzRXBrUWlMemM4WkU1eFRtWGlua1RRaHhHVHcvdXptSEQ4VmdEMlllQURX?=
 =?utf-8?B?NmRPNHg0aGhKb2VCZkxWT01MRHNTMUFzRzFhWjN2ZDB4M2ExSG5md00yZlVu?=
 =?utf-8?B?b1NGKzNXVTRUQm5EUWwyTUZiSW5BRHVEdmVhVW5LWXJGRjdWc2dEU3JnbnZR?=
 =?utf-8?B?YVB4V3JWOW5nNmxEdkJ2aHB6Q0k4dmRrZCt6NnRPdGhlMzFCRTdUNCtDdW1u?=
 =?utf-8?B?SHhNT3Q5bkNncHBNWmxWUVFnU3Arcml0UWhsNGhaMGc0QWViNXU2K2w3THlZ?=
 =?utf-8?B?cGhyMys2YXV3WkhMQzRlR1JzSm93eXRNeUtZT1p1M2VwSk1nZTI2Mm5yODRJ?=
 =?utf-8?B?c0R4WGRFTjJQNUVWQ3NIc29XaU5iN2lkT0pmOG5tUFpTNGt5b2s0K2dZRFlu?=
 =?utf-8?B?dThjbVVjQ3dCWkhlOG1aUmQ4U1V3eElVVnJ1MDI0dFYvMExXL25qTkZBaTVv?=
 =?utf-8?B?Y0FMS043bDFGbDg2KzY3OGZxdVB4TXhzR3dydVVPdEVGWEcrSFBDSEhqMlFm?=
 =?utf-8?B?MlpuOUZmeHRhS09WUWNwVlBPdncvMVh5REpxUGxrSndZak1Va0JrcE1nSlBw?=
 =?utf-8?B?VnZzTStNNmJXRWV2eTVGMHFpeTNrSmdxOSsvK1Q2WDhQSytIY01zaW81NjdB?=
 =?utf-8?B?RXhnZjVmM1ZGSk52aHBOTFlTYWhuT0FDdGIva21VQkFZbzcwZlhSaGFZeTRF?=
 =?utf-8?B?ekt2QWowTUV0cTh5Y3ZqSm9PTGVYakxFdkc1S3NKakF6OTByTElLWHgzc25i?=
 =?utf-8?B?YndZTGs4TUpKdXZGWDRMOU5rd25nSGlSSXVpanhqUjFqSVZORmZFZWc1bitY?=
 =?utf-8?B?eXVRQUVFN3oySW82MUlFeUJNRTdxSnF0blRETjkwajB4UlVVcElIblFBUDhq?=
 =?utf-8?B?ZFBQNGJQcjhEb1VYTENOS2hIMUlhYk9VN0REa2dGdktDMnBDaC9qMDlTU3gr?=
 =?utf-8?B?NUp2QTdnWkJnbW5VeFFSYXFSUnlTZ0FZaXpSVTVCZk16eWV2NzhPcHNWcGxO?=
 =?utf-8?B?Zm1LOC81TlArc2NnZ1NDeS84T0hXWFBFc0U1LzhVdkNmUU5mTE8vU0lRRnRZ?=
 =?utf-8?B?MkRGZWV0T2R6WEZmcGl5Z3VsYitGQnJmdGJhK2UyYTNmSHlwUzlSNFVSdW82?=
 =?utf-8?B?anJtYW1ieHk4a0UyVDhoUDMrSm1sWldqUmpxMlVUYW85ZGRQMUlRYmk2Q2o2?=
 =?utf-8?B?Wnh4NUJGbjUvcTZKS2Z2WmJRbEtRL24vczdJU2ZMSzdXR0JOYzhDbnhEcHZV?=
 =?utf-8?B?c0hCTHRZeGpDeWlwY2k3ekFzdEoxQnBLc3VOQ210a2ZqRnJCeitIeVZObmxH?=
 =?utf-8?B?WDRlTmY1aW5KQlhSVGk1MUJmd3NKcS8vaDV2U0xPUnRyOU4wS3N1b2krRVpH?=
 =?utf-8?B?MlZCRFJURTNCUjd6WmhiODdYcVpOQmxBRGNLWUtMMnJRN3FTejA2Q2t2TUlt?=
 =?utf-8?B?eTdDd2pZYTJvRlZlK0JhWmdHL3FpWWlQTGRYbmRpeVVTanBhcnd3bWpLdFBh?=
 =?utf-8?B?OTdOeGsrVXRvRUVxNGVqMTNvMFBBL3VxajVKOEUzQ2N0MHBubnJma0xhNThW?=
 =?utf-8?B?ZnJvVGE5ZmFWTFc3RTJ4blV0L2FRTEczU0M3YjQ3b3RTWjV6ODhnWllUeTBi?=
 =?utf-8?B?ekg3MStoTzhLTGRMUit4QmdmT0czczF0a3hyVTV0SU42ZmF3UjRPWWYwZjBu?=
 =?utf-8?B?YlZJeitkS2NCS3RTL0xIdVBGWCtvd3ZWczNaRVc0R0pSUDY1WGJpdmNhOC9D?=
 =?utf-8?B?Wk1pVXdmMElnV1pLdEsyZ0d3RkpUeldEVXkxVUkxZndjb25pbUJTVVM1Qllj?=
 =?utf-8?B?ekd4a0pyeVRXeFFQZ0F1QnkvUzFmeVBEUE80NXVObjJCSWhtRHltSkJ3L09i?=
 =?utf-8?Q?lteE6R?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b2FQTTlqVGh6L2d5M2RoRURrZytneTFUOGpPYVlKdnJnUXJkWXFzMkZyUy9G?=
 =?utf-8?B?SHRVSzRxYW1LZFF5MU1QZUpoNG9MSEViMHo5SXJIa3NCU2F2Rk1nZWtBTFZ3?=
 =?utf-8?B?M1E5WkhsK2dGeWYxNWdBbkdnMW9wS21BcEZYOWtKNDg4aE1KZmZaMU56dGh3?=
 =?utf-8?B?Yld3aVBHZzhReDUyaUwxM1pHNVRGRUpZRXd2Q1VESE92dXNkZm5weG4xTmNE?=
 =?utf-8?B?b3g1bzQ5WjZzc25xZXd0djNlL1pLd0RIbCtqM1BhZEIvbFhSdFdqazdwZnor?=
 =?utf-8?B?MjMvZndJTThVNGFiZVI3VGJPRW9XdHVxZVN5dEIvbmlaL1VaVS9kWmZiUkwx?=
 =?utf-8?B?alNEakkwU1pxVDgxL055SndPcTE2U0NsajY1R0F6UGV4djgrQ3orRVlkcVd2?=
 =?utf-8?B?dkZYZi9QL05jV1Q5U25LejZuaXRNTXFkRmo1WWhPdlM0M2lDTlJ6YW9ieVhM?=
 =?utf-8?B?TGJIdXdiNWt0Q3VBaWovUmIxcktyRUc0ME9QYTUzWjdwT2dSU3BmcEhpVkR5?=
 =?utf-8?B?RndLeGpBbW1IeFhBK1ZFZ2xSams1R0JhQmNva0J3VTFMNUUvbUJhNjFKMUp6?=
 =?utf-8?B?c2t4WGZvZVo0a3BMalBqZXk3Q1NJRzBzblhEWVZyZDRNWFdPb21XdXE0OXJo?=
 =?utf-8?B?Q2FoOWxyNkZBZTF3WUpGQ0JtaGdrM0QwOTRpMXNCVDZnZVFvV0l6a2xIUnVR?=
 =?utf-8?B?YzMvWU9VVFVUamMvenRXQ1JOMnZZa29MazFkMmhoaFFQU1R3Sk5STm9OYU1s?=
 =?utf-8?B?d1E4UVF6OGNQUDhlWlhuWFcybkN1M1M2NE5oTUpiUlZhaHg4TXBkRjkrRkRV?=
 =?utf-8?B?Y0JscC9GcDZBTkk5aGx1ZFUvZFdKUWtYWVhjOUV0bk04RThWcFBoc3A1blZG?=
 =?utf-8?B?aHZQREtibjh2UW1pL2xSTDIybGVOWllDWXhLQVdmc0FKRDhoN0V6a0RWdjBm?=
 =?utf-8?B?aG13QjU0aHBqVUdhMjNUc1o5K0F5TWdjTEE2VVZTWTdPRWlDNEcvRkhyQ0JS?=
 =?utf-8?B?Yk1nbVZkQ0V4UUhFc0o2SnA0Y00wTmJrVjRqUUxzSVg5YXZUaWZ5cytodlZY?=
 =?utf-8?B?dGNMeldWS214M1Jma2hNaDdwMWp0NWhZNDdENGkyd1VsRGxvSGxrTjV1VVU3?=
 =?utf-8?B?cnlkVUltMUFVcTRJOVl0MHBjNXZJU0RHNC8rTUFiYmIyUVhPZ2gzZ3NYczlh?=
 =?utf-8?B?MWdJUENMVG5BanYrWlNiWVVveDhxN3ZKZUNrV2p1MmZ2Nk53RGpqaW5KcWt5?=
 =?utf-8?B?cGwrYkdwb1dybVNYR0pWVmlBUGJnTlRBYmxTZ1krSmIxVWZBeHJsWDRJbHJ4?=
 =?utf-8?B?dWNIZnI2QjNMdXdocjZ5V0pxazhpbXIzS1hSS25TLzdCNWd4V0ZMOTA2YWFw?=
 =?utf-8?B?S2Z1U3JPRHVjSGhwUWsxVmQzaVlDVHNSeXljU0dkMHhXYnFwbmptMjlNRmVq?=
 =?utf-8?B?QXowQnpCMnA0YTU1V2IzVDRHbllwOUNhQjBBSVNDRlVFaU5XSFVJdDNrc3FC?=
 =?utf-8?B?Z2hPRk1JeWhVNWRhcEp2c3FIUURIQ2kwZW02QU1iVno1TGN6Q1lGN0ovYUlI?=
 =?utf-8?B?REJWNnExdUo3djNFM0RDYXVjVmdmUFFLVWs5VWl2LzVma1p2dzZiMnFHMjVO?=
 =?utf-8?B?MXo4ZFR2WDVJNEIwZ01tNDVNVENiOFA5UjI2K3VLVGNoUDJnMXpGZ3FZK0ZG?=
 =?utf-8?B?T3JzN0NwcEpyQi90MjVtdDdxM05DOEs5aGZGVVE3YTJnbzFQeHFadXR1VXpC?=
 =?utf-8?B?OEpaelhINTI2cnJ4R1Irc2UwSWJjOVhja0psRnRpUmlMd2tUZlZDckhRSExn?=
 =?utf-8?B?OGNzWkJ1bkZUTXo3bC9ER3dKYWtMQzMxUERkcVp3ZnRDWHl3U1BRRW8rNHd3?=
 =?utf-8?B?MllkMjQ4bjFON2Z2QWp5N01nOXZFU2h6c0F0eU1WczJsSCtreHZPZDdJamwr?=
 =?utf-8?B?T1RONmdRaFFwUnkzdmNQTlR1bzNvQ1hFakNBalF4NDlTL0xGd2ErWnZ0UXVt?=
 =?utf-8?B?S1hWTEFWTzUrSVArZDBibUNwMUEwQmw5VjZtVjJIdm5vRHFkYXRoeFZQZkVl?=
 =?utf-8?B?VTlDVVhTV282SnU0bU01ZHhSWVJQRU4rdEk5cUNEWFlZYWsvbWpuNzNzc2lv?=
 =?utf-8?B?cmp3RU50ZmNLUkNCL2tqRGt0bUtFRFQ1M21uVmhrZy9Taml0Rm5BRHhCZ1NL?=
 =?utf-8?B?Q3c9PQ==?=
Content-ID: <1F454515723EF7418791C43F246C9C3F@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c45f492-26c4-4226-7b4e-08de38dbecc5
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2025 17:37:15.4434 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KApcP75wr0F4Fn6IgtvRMjXd7bFHKWZGaijkIs1yYFF9zYOm60JCovqmHybkXgSoGB7jTCS9RFDpzGoOI7q+Eu8x0Zn6IWv/H2Y987kY5lE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7122
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_008_291655540.1477992647"
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

--__=_Part_Boundary_008_291655540.1477992647
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDI1LTEyLTA5IGF0IDE1OjQ3IC0wNTAwLCBOaWNvbGFzIER1ZnJlc25lIHdyb3Rl
Og0KPiBIaSwNCj4gDQo+IA0KPiBMZSBzYW1lZGkgMDEgbm92ZW1icmUgMjAyNSDDoCAwMDowMiAr
MDgwMCwgSmFzb24tSkggTGluIGEgw6ljcml0wqA6DQo+ID4gVG8gZmFjaWxpdGF0ZSB0aGUgcmVt
b3ZhbCBvZiB0aGUgc2hpZnRfcGEgcGFyYW1ldGVyIGZyb20NCj4gPiBjbWRxX3BrdF9qdW1wX3Jl
bCgpLCBjdXJyZW50IHVzZXJzIG9mIGNtZHFfcGt0X2p1bXBfcmVsKCkgbmVlZCB0bw0KPiA+IHRy
YW5zaXRpb24gdG8gdXNpbmcgY21kcV9wa3RfanVtcF9yZWxfdGVtcCgpIGJlZm9yZSB0aGUgQVBJ
IGNoYW5nZQ0KPiA+IGlzIGltcGxlbWVudGVkLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEph
c29uLUpIIExpbiA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTog
QW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8NCj4gPiA8YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdu
b0Bjb2xsYWJvcmEuY29tPg0KPiA+IC0tLQ0KPiA+IMKgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9t
ZWRpYXRlay9tZHAzL210ay1tZHAzLWNtZHEuYyB8IDIgKy0NCj4gPiDCoDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL21kcDMvbXRrLW1kcDMtY21kcS5jDQo+ID4g
Yi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL21kcDMvbXRrLW1kcDMtY21kcS5jDQo+
ID4gaW5kZXggZDBiMGIwNzJmOTUzLi41ZmM5MjYzY2NiNzggMTAwNjQ0DQo+ID4gLS0tIGEvZHJp
dmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9tZHAzL210ay1tZHAzLWNtZHEuYw0KPiA+ICsr
KyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvbWRwMy9tdGstbWRwMy1jbWRxLmMN
Cj4gPiBAQCAtNjI4LDcgKzYyOCw3IEBAIHN0YXRpYyBzdHJ1Y3QgbWRwX2NtZHFfY21kDQo+ID4g
Km1kcF9jbWRxX3ByZXBhcmUoc3RydWN0IG1kcF9kZXYgKm1kcCwNCj4gPiDCoAkJZ290byBlcnJf
ZnJlZV9wYXRoOw0KPiA+IMKgCX0NCj4gPiDCoAljbWRxX3BrdF9lb2MoJmNtZC0+cGt0KTsNCj4g
PiAtCWNtZHFfcGt0X2p1bXBfcmVsKCZjbWQtPnBrdCwgQ01EUV9JTlNUX1NJWkUsIG1kcC0NCj4g
PiA+Y21kcV9zaGlmdF9wYVtwcF9pZHhdKTsNCj4gPiArCWNtZHFfcGt0X2p1bXBfcmVsX3RlbXAo
JmNtZC0+cGt0LCBDTURRX0lOU1RfU0laRSwgbWRwLQ0KPiA+ID5jbWRxX3NoaWZ0X3BhW3BwX2lk
eF0pOw0KPiANCj4gSSBjYW5ub3QgdGFrZSB0aGF0IHJpZ2h0IG5vdyBpbiB0aGUgbWVkaWEgdHJl
ZSwgYXMgaXQgd29uJ3QgYnVpbGQuDQo+IENhbiB0aGUgU29DDQo+IG1haW50YWluZXIgaGVscCBt
ZSBrbm93IGlmIEkganVzdCBsZWF2ZSB0aGF0IG9uIGhvbGQsIG9yIHBlcmhhcHMNCj4geW91J2Qg
bGlrZSB0bw0KPiB0YWtlIGl0ID8gKG9yIGl0cyBpbiBuZXh0LCBhbmQgSSBqdXN0IGhhdmUgdG8g
d2FpdCBmb3IgbmV4dCB1ZHBhdGU/KQ0KPiANCj4gSSBhbHNvIGRvdWJ0IHBhdGNoIDQvNSBpcyBt
YWtlIG11Y2ggb2YgYSBkaWZmZXJlbmNlIHdpdGhvdXQgdGhlIHNvYw0KPiBjaGFuZ2VzID8NCj4g
DQoNCkhpIEFuZ2VsbywNCg0KQ2FuIHlvdSBoZWxwIHVzPyBUaGFua3MhDQoNClJlZ2FyZHMsDQpK
YXNvbi1KSCBMaW4NCg0KPiByZWdhcmRzLA0KPiBOaWNvbGFzDQo=

--__=_Part_Boundary_008_291655540.1477992647
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1R1ZSwmIzMyOzIwMjUtMTItMDkmIzMyO2F0
JiMzMjsxNTo0NyYjMzI7LTA1MDAsJiMzMjtOaWNvbGFzJiMzMjtEdWZyZXNuZSYjMzI7d3JvdGU6
DQomZ3Q7JiMzMjtIaSwNCiZndDsmIzMyOw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtMZSYjMzI7c2Ft
ZWRpJiMzMjswMSYjMzI7bm92ZW1icmUmIzMyOzIwMjUmIzMyOyYjMjI0OyYjMzI7MDA6MDImIzMy
OyswODAwLCYjMzI7SmFzb24tSkgmIzMyO0xpbiYjMzI7YSYjMzI7JiMyMzM7Y3JpdCYjMTYwOzoN
CiZndDsmIzMyOyZndDsmIzMyO1RvJiMzMjtmYWNpbGl0YXRlJiMzMjt0aGUmIzMyO3JlbW92YWwm
IzMyO29mJiMzMjt0aGUmIzMyO3NoaWZ0X3BhJiMzMjtwYXJhbWV0ZXImIzMyO2Zyb20NCiZndDsm
IzMyOyZndDsmIzMyO2NtZHFfcGt0X2p1bXBfcmVsKCksJiMzMjtjdXJyZW50JiMzMjt1c2VycyYj
MzI7b2YmIzMyO2NtZHFfcGt0X2p1bXBfcmVsKCkmIzMyO25lZWQmIzMyO3RvDQomZ3Q7JiMzMjsm
Z3Q7JiMzMjt0cmFuc2l0aW9uJiMzMjt0byYjMzI7dXNpbmcmIzMyO2NtZHFfcGt0X2p1bXBfcmVs
X3RlbXAoKSYjMzI7YmVmb3JlJiMzMjt0aGUmIzMyO0FQSSYjMzI7Y2hhbmdlDQomZ3Q7JiMzMjsm
Z3Q7JiMzMjtpcyYjMzI7aW1wbGVtZW50ZWQuDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMy
OyZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtKYXNvbi1KSCYjMzI7TGluJiMzMjsmbHQ7amFz
b24tamgubGluQG1lZGlhdGVrLmNvbSZndDsNCiZndDsmIzMyOyZndDsmIzMyO1Jldmlld2VkLWJ5
OiYjMzI7QW5nZWxvR2lvYWNjaGlubyYjMzI7RGVsJiMzMjtSZWdubw0KJmd0OyYjMzI7Jmd0OyYj
MzI7Jmx0O2FuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbSZndDsNCiZndDsm
IzMyOyZndDsmIzMyOy0tLQ0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMxNjA7ZHJpdmVycy9tZWRpYS9w
bGF0Zm9ybS9tZWRpYXRlay9tZHAzL210ay1tZHAzLWNtZHEuYyYjMzI7fCYjMzI7MiYjMzI7Ky0N
CiZndDsmIzMyOyZndDsmIzMyOyYjMTYwOzEmIzMyO2ZpbGUmIzMyO2NoYW5nZWQsJiMzMjsxJiMz
MjtpbnNlcnRpb24oKyksJiMzMjsxJiMzMjtkZWxldGlvbigtKQ0KJmd0OyYjMzI7Jmd0OyYjMzI7
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtkaWZmJiMzMjstLWdpdCYjMzI7YS9kcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL21lZGlhdGVrL21kcDMvbXRrLW1kcDMtY21kcS5jDQomZ3Q7JiMzMjsmZ3Q7JiMzMjti
L2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvbWRwMy9tdGstbWRwMy1jbWRxLmMNCiZn
dDsmIzMyOyZndDsmIzMyO2luZGV4JiMzMjtkMGIwYjA3MmY5NTMuLjVmYzkyNjNjY2I3OCYjMzI7
MTAwNjQ0DQomZ3Q7JiMzMjsmZ3Q7JiMzMjstLS0mIzMyO2EvZHJpdmVycy9tZWRpYS9wbGF0Zm9y
bS9tZWRpYXRlay9tZHAzL210ay1tZHAzLWNtZHEuYw0KJmd0OyYjMzI7Jmd0OyYjMzI7KysrJiMz
MjtiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvbWRwMy9tdGstbWRwMy1jbWRxLmMN
CiZndDsmIzMyOyZndDsmIzMyO0BAJiMzMjstNjI4LDcmIzMyOys2MjgsNyYjMzI7QEAmIzMyO3N0
YXRpYyYjMzI7c3RydWN0JiMzMjttZHBfY21kcV9jbWQNCiZndDsmIzMyOyZndDsmIzMyOyptZHBf
Y21kcV9wcmVwYXJlKHN0cnVjdCYjMzI7bWRwX2RldiYjMzI7Km1kcCwNCiZndDsmIzMyOyZndDsm
IzMyOyYjMTYwO2dvdG8mIzMyO2Vycl9mcmVlX3BhdGg7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzE2
MDt9DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzE2MDtjbWRxX3BrdF9lb2MoJmFtcDtjbWQtJmd0O3Br
dCk7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjstY21kcV9wa3RfanVtcF9yZWwoJmFtcDtjbWQtJmd0O3Br
dCwmIzMyO0NNRFFfSU5TVF9TSVpFLCYjMzI7bWRwLQ0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0O2Nt
ZHFfc2hpZnRfcGFbcHBfaWR4XSk7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrY21kcV9wa3RfanVtcF9y
ZWxfdGVtcCgmYW1wO2NtZC0mZ3Q7cGt0LCYjMzI7Q01EUV9JTlNUX1NJWkUsJiMzMjttZHAtDQom
Z3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7Y21kcV9zaGlmdF9wYVtwcF9pZHhdKTsNCiZndDsmIzMyOw0K
Jmd0OyYjMzI7SSYjMzI7Y2Fubm90JiMzMjt0YWtlJiMzMjt0aGF0JiMzMjtyaWdodCYjMzI7bm93
JiMzMjtpbiYjMzI7dGhlJiMzMjttZWRpYSYjMzI7dHJlZSwmIzMyO2FzJiMzMjtpdCYjMzI7d29u
JiMzOTt0JiMzMjtidWlsZC4NCiZndDsmIzMyO0NhbiYjMzI7dGhlJiMzMjtTb0MNCiZndDsmIzMy
O21haW50YWluZXImIzMyO2hlbHAmIzMyO21lJiMzMjtrbm93JiMzMjtpZiYjMzI7SSYjMzI7anVz
dCYjMzI7bGVhdmUmIzMyO3RoYXQmIzMyO29uJiMzMjtob2xkLCYjMzI7b3ImIzMyO3BlcmhhcHMN
CiZndDsmIzMyO3lvdSYjMzk7ZCYjMzI7bGlrZSYjMzI7dG8NCiZndDsmIzMyO3Rha2UmIzMyO2l0
JiMzMjsmIzYzOyYjMzI7KG9yJiMzMjtpdHMmIzMyO2luJiMzMjtuZXh0LCYjMzI7YW5kJiMzMjtJ
JiMzMjtqdXN0JiMzMjtoYXZlJiMzMjt0byYjMzI7d2FpdCYjMzI7Zm9yJiMzMjtuZXh0JiMzMjt1
ZHBhdGUmIzYzOykNCiZndDsmIzMyOw0KJmd0OyYjMzI7SSYjMzI7YWxzbyYjMzI7ZG91YnQmIzMy
O3BhdGNoJiMzMjs0LzUmIzMyO2lzJiMzMjttYWtlJiMzMjttdWNoJiMzMjtvZiYjMzI7YSYjMzI7
ZGlmZmVyZW5jZSYjMzI7d2l0aG91dCYjMzI7dGhlJiMzMjtzb2MNCiZndDsmIzMyO2NoYW5nZXMm
IzMyOyYjNjM7DQomZ3Q7JiMzMjsNCg0KSGkmIzMyO0FuZ2VsbywNCg0KQ2FuJiMzMjt5b3UmIzMy
O2hlbHAmIzMyO3VzJiM2MzsmIzMyO1RoYW5rcyENCg0KUmVnYXJkcywNCkphc29uLUpIJiMzMjtM
aW4NCg0KJmd0OyYjMzI7cmVnYXJkcywNCiZndDsmIzMyO05pY29sYXMNCg0KPC9wcmU+DQo8L3A+
PC9ib2R5PjwvaHRtbD48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiog
TUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZSAqKioqKioqKioqKioqKioqKioqKg0KVGhl
IGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcg
YW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2
aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGlj
YWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRl
c2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1
dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNs
dWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0
cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBh
biBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUgDQp0aGF0IHlv
dSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBz
ZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUg
YW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNo
bWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50
IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSENCjwvcHJlPjwh
LS19LS0+

--__=_Part_Boundary_008_291655540.1477992647--

