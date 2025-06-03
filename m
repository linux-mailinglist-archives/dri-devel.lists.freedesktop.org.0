Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DADACC9FF
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 17:18:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03E3510E700;
	Tue,  3 Jun 2025 15:18:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="RKtk33Te";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="N6HqWXTC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01E4310E668
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 15:18:52 +0000 (UTC)
X-UUID: 072f0c5c408e11f0b33aeb1e7f16c2b6-20250603
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=vecINbWNCpNTgdAMEWu7cv+v/tEZW7ltHevzykajVpU=; 
 b=RKtk33TeHbWrzfCJwfKi76n0WS9drUVOC2E5mjmzjo35aVqhgfamiATR6tLGNiPS1Pmciy/Dt/pOxiexvIoNKc9XxJ8UW6fIqhmr6CyLKtUnePUSpi9nhOyCDrmTCvRba/JoBqtMJEMFnKFwh0Crw+PY1E3AKpAMTkc+Dp29xOc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1, REQID:d8ac597f-68e8-4807-aca4-b3e2366060c3, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:0ef645f, CLOUDID:0ec395f1-2ded-45ed-94e2-b3e9fa87100d,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
 nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
 OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 072f0c5c408e11f0b33aeb1e7f16c2b6-20250603
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1131431124; Tue, 03 Jun 2025 23:18:39 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 3 Jun 2025 23:18:38 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 3 Jun 2025 23:18:38 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w8vcw+0CJtxdQkeFDfJpPJGuulUNWEsDgR0HHaZXncHSg8vZrYP8rl3+L3eINWXmC7qi0X0GnsF/IUECnL3cBr7lW2nXdgBOi5sDTf+0Jx7AAC5Ol9bQEfqetVAoZYcylDHmBCLsrYANf6Je+viGIZx2SrVNWgiLwQLCmJuPemmgSznr7SzTynxDGC9lFAT2E2+YQQ5+hAgvjV8th+PWN++SJXsUgmX+pIg6yIe3NxFh1g71le1DqM1tSuyM9jXMLIEiGFaAwww1P8m/nIoszuipfB6Ra1rI81C8hneRIP9D0QHxyXlgByxC5gBLgPFuLKzLCwG2amkmDoWuQyTj7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OIqxWRT6NYCe9Cao3g7AOuoqJg9fI8hBlfSqAgRo1Ic=;
 b=MLusTgXqxEa725mWBLTOqsfaTtK0Y4zfTwvX/n10qBW9wfBGxdAzgGG2WSo938GwvX8cH+lGO5MWJU7LzKbC4wBvlc7B7p9IPPl8+5LN3E4opauLsWy73+PmjOANrBjCyxctLerfhCseMf3t6Kwvp5ileQL99/nbegltty0ORB6ljhJQUZsV0NOPWg6IpgU4qen2Fx882ja2tzBR2US/3pCHz0iaMpVLo/Ex7Jt2fT17wFKdR8p/nFd9anlth1/kA/JOdGzXM6dBRUdZbc9qDMNVnIR0+aiqSK1pIKGTYA9/KG56CfPR1h5w1ZPUF+pzT4S0/ZILXjDL24bT+PBQHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OIqxWRT6NYCe9Cao3g7AOuoqJg9fI8hBlfSqAgRo1Ic=;
 b=N6HqWXTCoGrnJwQhhV54kvGccrXP0PbstK+Uooj2kGymJxnYJF6qzPonibTksFms1xpWIs/HexrqkD19saIIklsydLtBZ3T1MdQHmX+FosF0GvnxDDXcVs3/Cqypd/rKdI528AljOgo4urHqOmrjbTQgw5MkwZNWnuh0AtYXrYQ=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by TYSPR03MB7426.apcprd03.prod.outlook.com (2603:1096:400:417::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 3 Jun
 2025 15:18:35 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%7]) with mapi id 15.20.8769.025; Tue, 3 Jun 2025
 15:18:35 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>, "robh@kernel.org"
 <robh@kernel.org>, "nicolas@ndufresne.ca" <nicolas@ndufresne.ca>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "jassisinghbrar@gmail.com"
 <jassisinghbrar@gmail.com>, "mchehab@kernel.org" <mchehab@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 =?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
 =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
 <Xiandong.Wang@mediatek.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "fshao@chromium.org" <fshao@chromium.org>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "wenst@chromium.org" <wenst@chromium.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, =?utf-8?B?WGF2aWVyIENoYW5nICjlvLXnjbvmlocp?=
 <Xavier.Chang@mediatek.com>
Subject: Re: [PATCH v6 17/20] media: platform: mtk-mdp3: Use
 cmdq_pkt_jump_rel() without shift_pa
Thread-Topic: [PATCH v6 17/20] media: platform: mtk-mdp3: Use
 cmdq_pkt_jump_rel() without shift_pa
Thread-Index: AQHb0xtysL+9Rs49Nky+WpplFUeOM7PwAmgAgAGM6wA=
Date: Tue, 3 Jun 2025 15:18:35 +0000
Message-ID: <cdd084ec95c785bb4cc6e94fbf91c46bee2706d0.camel@mediatek.com>
References: <20250601173355.1731140-1-jason-jh.lin@mediatek.com>
 <20250601173355.1731140-18-jason-jh.lin@mediatek.com>
 <01ee4dbe14917dff1e0d256dde6724f81a23ba4b.camel@ndufresne.ca>
In-Reply-To: <01ee4dbe14917dff1e0d256dde6724f81a23ba4b.camel@ndufresne.ca>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|TYSPR03MB7426:EE_
x-ms-office365-filtering-correlation-id: ce10b768-bf41-4145-a3da-08dda2b1e8c1
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7416014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?dDBldXB1S2JwSDczY200MXRtcDJ1RjBOTzVIN2YveDV3M1VZamRxZTQzUzhF?=
 =?utf-8?B?eUdCUVhrMzRVL2l4enhkQkN2aHBJNXhXUDdIbDdKNlhQVGJJT2toME1sRFE5?=
 =?utf-8?B?S1RPTmdTay9McUFmc2pDeEpJaFYyY1hCY2liWWNZK0pUVStSVFVKendCQjlz?=
 =?utf-8?B?MHo1N09BbStidDUxNVBiZ2dIOWYzNEFyTVpxMVBrZGFnN0lZWFI0T1Z0aFQ5?=
 =?utf-8?B?bHZpZXhubEI4YjJSaFNPd2JYbEI4Y3VlOENFUE9yR2hpaUJkYWozZHM0elMw?=
 =?utf-8?B?bzRzTzNEWU9ReGRqYm1VNFBlcFlZSXNhSVh3WXFmUHZIU1BJUEtQdzF6dytE?=
 =?utf-8?B?QS9seTZlVWJLQXcyZXdIdm9LSk5GcHVCQ3pYRHp1bnNhSzUxSDhyaXJud3dF?=
 =?utf-8?B?MUMveGFiTVpOR0lBSTVoeG91OGVuNDZMUU0xTHllWDFHUmplUmZnbFJVZ0FB?=
 =?utf-8?B?SUdPTFpuZmpyK3pyTGN2MjVGVUZnQ3FTVnFRbW5JY1JmTzNjTUdpdWhaWmY1?=
 =?utf-8?B?ZkZSR2hhalVFNVlWUEZCRnNpWkNUTVJTVkpFNFBmaFNwWkdPMTRFVWF1M1oz?=
 =?utf-8?B?bjl3Y1c1TWtROE9hcWhDNmlMYWRHd2VSekJ1RlJTeDAxcjdDOUlXdTFhNUti?=
 =?utf-8?B?YlZVREgwUi8rb3V3RnFKZFVKUVlTdHpBSm12dW5BK0RuejMzKzJVQ2ZCY2VF?=
 =?utf-8?B?TGg1LzR0QVNlemE3UmtrS3ZIeFhYajZ4eDJnWEdaT3NsbmxVc0tZLzdneWsv?=
 =?utf-8?B?R3pRMTZweEo4a05JeWdjOVR0cHFOL3RqOXR4QjVvNkx0WFhDbnZRdnRYc2xO?=
 =?utf-8?B?aDA2alBHTWhCWTh0WFdiZ3NVQUJ1bjZXSEUrZEg5Uk5nWWp0RGRRazg2ZG5L?=
 =?utf-8?B?NFFoNHV6MjltQ3V6YTZhZWwzMklWRjgvTHdIbklRaW1Fa2QrU29rQmVaSHVO?=
 =?utf-8?B?dnRQMEh2MzRuNzVLRGFreDZWeWtKYkRRYnhWUHI3MjZFUTNVQmczTzNWMmJ5?=
 =?utf-8?B?MU4yUmFnaEJOMXNnV3M1bVRsWGtpU0RydVhaOUJSZVlsT1M3RTRvWWRCWTVh?=
 =?utf-8?B?MmdMZkxwYkszb0dUMiswZGFTbVI3NEMwd1NWR3R0ZE90aVRGWXhFZ1pJM1d5?=
 =?utf-8?B?amdYYUV1OUJoV2VOcms2Qk5WMEZXSUU5QlF5SExGellXbCt3U2JHY2ZKcksx?=
 =?utf-8?B?NVJCYkFMRjJidm9Gcm9sSUNVcWpheWtvWFY2L0FZTjUxZFhDVC9OdTBtYm9I?=
 =?utf-8?B?NEFWVjdERWE5QisxRFlRa053bkJsQmxjaUV6RUJMakE3bDl6YUtjUWliU2J3?=
 =?utf-8?B?U0ZlNEZjaGtISnJUbnlxWEFpNUt4ZkJVZ0F0U1Fic2QzR0h1Wnp6cXFXZFFh?=
 =?utf-8?B?c0ErSFBVbUo2SUdjN3JDdG45eVNRYW05Y0xCak15clM5MHkwNU41cjNtbGV4?=
 =?utf-8?B?VzlibEkvd2tQOFRQMmplNVNQdkszd0NMakovbE1mM0VDa2NYUjFwMUc1OG9i?=
 =?utf-8?B?Ym1ZdmpwVnpuaEx0V2luWDJ5WUxyNG1QTHR3dk0wYzdLelZzSFhybTdTTDhk?=
 =?utf-8?B?WVdvOHJSNTJJWk11QXQ4d055VlJDM0w2QTBGNzRwTVpIV1ZsM0lvclFLSjkz?=
 =?utf-8?B?Qzk4TUpSU2NlRENKeFlXQ0tXbzdYTzFhd0RuTWtPVHo1dHloVy9ub2R6a0lP?=
 =?utf-8?B?S3RPaytCYnIrZkJ0UWl1a21HaEdaOEw4TUM2S29mZlFqUjI3Z21Jd2tQbDMy?=
 =?utf-8?B?amlJOGRpbTJKaGNhQWlEaU1wS0VMK1Y3ZHpQdkdDTys5elNRcXV3YmZVNW5T?=
 =?utf-8?B?cXVtRzBjTjJLdGZtRHg3MHJJRTE5NUhVMkJLcEMrQS9GTjNaMUkrdk1uMzB5?=
 =?utf-8?B?UU9BNGxvV0w1Z3cwcisvUktXemxlb0U5dkM2Y3hmWncyS05uOEs4MmNmUjc0?=
 =?utf-8?B?V0t6bXhPbUd3ZEthMDNTVnk4aXZRTEIzaFZsc1JEd1QrcDBZaFpPU1hlS2Fp?=
 =?utf-8?Q?YtSQCS4aBjJLra7HroeGUTdJwGUN2w=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T0JQSUFmOWRGZHdHQTREcW0zU2Y0VUVCb2JOSVZXOU1QT293MXZLaldRUWsx?=
 =?utf-8?B?MnBISElmVXpvTFBLYUdZNHBjMk40TXgrK3doTXA4NmFnRGFUN241QVlMTS9Y?=
 =?utf-8?B?aklsTUxDZHYwcS9QM3k0Mk5WKy9yaW9yaS9HelJMdFRHOVB0OG81b2Zyam5s?=
 =?utf-8?B?WjFtRDBRRGpsUkFwaXJpSWdDMEdNSnRKSXgvalR5VjZGb1FSMU5oZlNSbmc3?=
 =?utf-8?B?TnZRcDAzeTVVR0FLaEIyTDBwYlFPTUg0R3B2OXVtT281YkpldFZKWmRhRzJF?=
 =?utf-8?B?dm96NzdLMWJHamZHTjJPYjdYZDdZNkJYbTNIK09rS21LdjFSeDd3cG9yMEZF?=
 =?utf-8?B?NzIvTytTVHprVTFJWkJuVXBYczF6STRpWDlKY2t2Rk1aUjFud0Z2UVRqcE9t?=
 =?utf-8?B?Zm9qUzNmU1lZRjg3MTRwc3FBWnFLOXRwQUE3a01Gd25nMFgyUzdmeGgrRDBQ?=
 =?utf-8?B?Z1VsZGF1ZnFFRTVOUmJ1MXJOSU95QlRldWdMaTIvVDEzNm5adER3TEVPNjZJ?=
 =?utf-8?B?UjJjNFU2MEorTDIxL2xsenJUZ1BNVVgzenNkdWZEbzVsZDZHZlREU1NoUUFv?=
 =?utf-8?B?bVpTUTZBdFU1aGJhNGhXR2hmNllGWGRkTWUwc2V4c3JsOVFtdlJ6WHUra0Ux?=
 =?utf-8?B?ME0weTZTKzRENlBUN2lPMmFxS3VrVlphaVlOWVdqQ0VHRGVRWnozd09Wa0VL?=
 =?utf-8?B?cG9tK2J0UnArbHk2Vy9sazJtTGdvQi9jRkdCQVg1UXpCbWNOWUsvN1l4OVUr?=
 =?utf-8?B?R01XV1E5c2gwdkVyeURDTzNKZGNuYXhQbWNlODhVK1lkWDF3VGFLYXNmS3ho?=
 =?utf-8?B?Yml5NUZzVTdLL2QzeFFha1NVQ09lOUxsU2R5M0YxQzYxN1p3RUNSaDNJY0gz?=
 =?utf-8?B?TDQxZUFRbGYxZmJQeHlBVS82Q1dVVFE4ZjA0N215VllGU0lTck1VRzdrWHlN?=
 =?utf-8?B?R09MZk9CcFJsWnMzUEY4L0NIVEh1eG1jZXkzMEk0cG4vNmlBcTBod1NnT0xK?=
 =?utf-8?B?NVlpZE5vcGE0N3BjeG15cnFMelllYWdLV3RnbFJFaDZ0UkliempSL2ppRFlD?=
 =?utf-8?B?ZkUyckxUNGx2dU1lUVZNV1l6RHdtVmNTUFdTRWE0SkdTSEJqUkFCaXV6S2pa?=
 =?utf-8?B?SGhnWlVKLzEvc2NSZllRMTJwMjdZYnRodVNZc2h4cUY2a2tkd2VlQ3d6N0Rw?=
 =?utf-8?B?b2RhWmwydzJiWEtUaWZ6Z2pEdEFNaXFTOU5mQkJnbjhJKzR5NDJFZ0ZwWlVn?=
 =?utf-8?B?a1p3YWMyaHhqeXIwWE1KUGtTU1FiRTY2M0MwbnU2V1FuckxSb3ZjNjlrWXNB?=
 =?utf-8?B?WXRieStmcnovRThrWktOYXFoZmFBSnl2dGw2NGtHYXg4VTIzekpGNzQ5K3lM?=
 =?utf-8?B?eXA0MUNZanhmSGVMbDVQQzVMMFBUeXJxUTh4ZWF6c25rbSszbkFvSXRYM1I5?=
 =?utf-8?B?UENhVHRGeTE2YzJXWGxBUVZiYkloRytVcFFSZFpzdk80dXFOamVFQmxNYmhj?=
 =?utf-8?B?YzcwTmI1dCtndjh0QmpqcCttWVV6Y2xHOU5IejhyOFNsWjAxNU5QanRrYUZ2?=
 =?utf-8?B?dUxSc0ViTElBTFFwclJuelE4eWJVL1Q1UjVVbmJjVC9xWWkzV1VmblVoTWk3?=
 =?utf-8?B?N1R4Z2FGNkxwVnZQcHpRN2RncmtiTWNwQTNzTHlHc3BYRU1lYVdUVkI0NEF3?=
 =?utf-8?B?Yk16MUIwL0NUUEpqdjArTnRxVmVkZjdMRWMzQXdaWk5DYStEMHk5eEZUSWxw?=
 =?utf-8?B?UnhwRy9oOXoxNnlkRTdmWDFhZ2hTZTF1UEN4UmxSejljWDJSM1FoTTlnZkdF?=
 =?utf-8?B?bjk0V0tlS2NGcnllTWppZytneDRkQlVmc0c3ZDRLNFJlOVlUNWNhNER0SmlZ?=
 =?utf-8?B?eFcrcUFrb1JzZDIzRWVZMElhS3VZM09FanA3VU5UVG1BVXUrNWhCeDFMajE0?=
 =?utf-8?B?dEtXUGVWWmYrdzFFOUJ6Z1RvbTdmYldHOHNqak1FS2NhUEd0UHBHNHRlUHBz?=
 =?utf-8?B?TGQrcGFuYWlCWEtCYjJoaEplTXRxVkxpSTZmZjFDR0VIUVBZN2x6UDZLSTJK?=
 =?utf-8?B?YWF2ZGJqS3JMZGxtaEVLdmhIdWtxSGUvQm1kOG03Zk5MRDBPRGk5NUZBWUpU?=
 =?utf-8?B?S0twSUdQak5KYjFPUnIzanc0WTBoMFVkbHMzY01UclhDZjYrNjdpekMvbUZO?=
 =?utf-8?B?bmc9PQ==?=
Content-ID: <DB995FBC68DB4847A20FDE48124C63FC@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce10b768-bf41-4145-a3da-08dda2b1e8c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2025 15:18:35.4086 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b1RiA+tyRH4t5oeuXte/x6qUsuzV/2ftDCoYtxh5O57COkqMyxOwnozyIlLFNebOuqlyIJkI06a72kbh2rx/Xld5EKk9cH4+4nKptbUgLtU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7426
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_001_1831464213.824987067"
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

--__=_Part_Boundary_001_1831464213.824987067
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGkgTmljb2xhcywNCg0KT24gTW9uLCAyMDI1LTA2LTAyIGF0IDExOjM3IC0wNDAwLCBOaWNvbGFz
IER1ZnJlc25lIHdyb3RlOg0KPiANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNs
aWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQg
dGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBIaSwNCj4gDQo+IExlIGx1bmRp
IDAyIGp1aW4gMjAyNSDDoCAwMTozMSArMDgwMCwgSmFzb24tSkggTGluIGEgw6ljcml0IDoNCj4g
PiBXaXRoIHRoZSByZW1vdmFsIG9mIHRoZSBzaGlmdF9wYSBwYXJhbWV0ZXIsDQo+ID4gY21kcV9w
a3RfanVtcF9yZWxfdGVtcCgpDQo+ID4gY2FuIGJlIHJlcGxhY2VkIGJ5IHRoZSBuZXcgY21kcV9w
a3RfanVtcF9yZWwoKSB3aXRob3V0IHNoaWZ0X3BhLg0KPiA+IA0KPiA+IFRoZW4sIHJlbW92ZSB0
aGUgY21kcV9zaGlmdF9wYSB2YXJpYWJsZSBpbiB0aGUgbWRwX2RldiBzdHJ1Y3R1cmUNCj4gPiBm
b3INCj4gPiBlYWNoIG1ib3ggY2xpZW50Lg0KPiA+IA0KPiA+IEZpeGVzOiBhZGUxNzY1MzQxMTIg
KCJzb2M6IG1lZGlhdGVrOiBjbWRxOiBBZGQgcGFyYW1ldGVyIHNoaWZ0X3BhDQo+ID4gdG8gY21k
cV9wa3RfanVtcCgpIikNCj4gPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbi1KSCBMaW4gPGphc29uLWpo
LmxpbkBtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gwqBkcml2ZXJzL21lZGlhL3BsYXRmb3Jt
L21lZGlhdGVrL21kcDMvbXRrLW1kcDMtY21kcS5jIHwgMiArLQ0KPiA+IMKgZHJpdmVycy9tZWRp
YS9wbGF0Zm9ybS9tZWRpYXRlay9tZHAzL210ay1tZHAzLWNvcmUuYyB8IDIgLS0NCj4gPiDCoGRy
aXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvbWRwMy9tdGstbWRwMy1jb3JlLmggfCAxIC0N
Cj4gPiDCoDMgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDQgZGVsZXRpb25zKC0pDQo+
ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvbWRw
My9tdGstbWRwMy1jbWRxLmMNCj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsv
bWRwMy9tdGstbWRwMy0NCj4gPiBjbWRxLmMNCj4gPiBpbmRleCA3NTc1ZWMzNzYzNjcuLmMzNWZl
MGUzYTRkNSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVr
L21kcDMvbXRrLW1kcDMtY21kcS5jDQo+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9t
ZWRpYXRlay9tZHAzL210ay1tZHAzLWNtZHEuYw0KPiA+IEBAIC02MzgsNyArNjM4LDcgQEAgc3Rh
dGljIHN0cnVjdCBtZHBfY21kcV9jbWQNCj4gPiAqbWRwX2NtZHFfcHJlcGFyZShzdHJ1Y3QgbWRw
X2RldiAqbWRwLA0KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gZXJyX2ZyZWVf
cGF0aDsNCj4gPiDCoMKgwqDCoMKgIH0NCj4gPiDCoMKgwqDCoMKgIGNtZHFfcGt0X2VvYygmY21k
LT5wa3QpOw0KPiA+IC3CoMKgwqDCoCBjbWRxX3BrdF9qdW1wX3JlbF90ZW1wKCZjbWQtPnBrdCwg
Q01EUV9JTlNUX1NJWkUsIG1kcC0NCj4gPiA+Y21kcV9zaGlmdF9wYVtwcF9pZHhdKTsNCj4gPiAr
wqDCoMKgwqAgY21kcV9wa3RfanVtcF9yZWwoJmNtZC0+cGt0LCBDTURRX0lOU1RfU0laRSk7DQo+
IA0KPiBEaWQgSSBtaXNzIHNvbWV0aGluZyBvciB0aGlzIHJldmVydHMgdGhlIGNoYW5nZSBtYWRl
IGluIDE1LzIwID8gSSdtDQo+IGFsc28NCj4gdW5zdXJlIGlmIGl0cyBjb3JyZWN0IHRvIGFzayBm
b3IgYmFja3BvcnRzIG9mIHRoaXMgd2l0aCBGaXhlcyB0YWcuDQo+IElzbid0IHRoaXMNCj4gZm9y
IE1UODE5NiwgYSBuZXcgYm9hcmQgPw0KDQpPaCwgeW91IGRpZG4ndCBtaXNzIGFueXRoaW5nLg0K
VGhlIHJlYXNvbiBmb3IgcmV2ZXJ0aW5nIGBzaGlmdF9wYWAgaXMgdGhhdCBNVDgxOTYgaGFzIGFu
IGV4dHJhDQpgbW1pbmZyYV9vZmZzZXRgIChpbiBQQVRDSCA3LzIwKSB3aGljaCBpcyBhbHNvIHVz
ZWQgYXMgZHJpdmVyIGRhdGEgZm9yDQpDTURRIGRyaXZlci4gQ29uc2lkZXJpbmcgdGhhdCB0aGVz
ZSBIVyBzZXR0aW5ncyBhcmUgdXNlZCB0byBnZW5lcmF0ZQ0KR0NFIGluc3RydWN0aW9ucywgYW5k
IHRoZXJlIG1heSBiZSBtb3JlIGFuZCBtb3JlIHN1Y2ggc2V0dGluZ3PCoGluIHRoZQ0KZnV0dXJl
LCBJIHdhbnQgdG8gcHV0IHRoZXNlIHNldHRpbmdzIGluc2lkZSBDTURRIGRyaXZlciBhcyBtdWNo
IGFzDQpwb3NzaWJsZSB0byBtYWtlIENNRFEgY2xpZW50IGRyaXZlcnMgdW5hd2FyZSBvZiB0aGVt
Lg0KDQpUaGVyZWZvcmUsIEkgcHJvcG9zZWQgUEFUQ0ggMy8yMCBhbmQgUEFUQ0ggNC8yMC4NCldp
dGggdGhlc2UgUEFUQ0hzLCBhbGwgQ01EUSBjbGllbnQgZHJpdmVycyBkbyBub3QgbmVlZCB0byBz
dG9yZSBhbmQNCmJyaW5nIGFueSBwYXJhbWV0ZXJzIGxpa2UgYHNoaWZ0X3BhYCBvciBgbW1pbmZy
YV9vZmZzZXRgIHRvIHRoZQ0Kc3BlY2lmaWVkIENNRFEgQVBJcyB0byBnZW5lcmF0ZSBpbnN0cnVj
dGlvbnMuDQoNCkhvd2V2ZXIsIHRoZXNlIHBhdGNoZXMgaGF2ZSBub3QgYmVlbiByZXZpZXdlZCBi
eSBvdGhlciByZXZpZXdlcnMgeWV0LA0Kc28gd2UgbWF5IGhhdmUgdG8gd2FpdCBhIHdoaWxlIHRv
IHNlZSBpZiBldmVyeW9uZSBhZ3JlZXMgd2l0aCB0aGlzDQphcHByb2FjaC4gVGhlbiB3ZSBjYW4g
c2VlIGlmIHdlIG5lZWQgdG8gcmV2ZXJ0IHRoZXNlIGNoYW5nZXMgb2YgTURQDQpkcml2ZXIuDQoN
CkJ5IHRoZSB3YXksIHdoYXQgZG8geW91IHRoaW5rIG9mIHRoaXMgYXBwcm9hY2g/IDotKQ0KDQpS
ZWdhcmRzLA0KSmFzb24tSkggTGluDQoNCj4gDQo+IE5pY29sYXMNCj4gDQo+IA0K

--__=_Part_Boundary_001_1831464213.824987067
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGkmIzMyO05pY29sYXMsDQoNCk9uJiMzMjtNb24sJiMz
MjsyMDI1LTA2LTAyJiMzMjthdCYjMzI7MTE6MzcmIzMyOy0wNDAwLCYjMzI7Tmljb2xhcyYjMzI7
RHVmcmVzbmUmIzMyO3dyb3RlOg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtFeHRlcm5hbCYjMzI7ZW1h
aWwmIzMyOzomIzMyO1BsZWFzZSYjMzI7ZG8mIzMyO25vdCYjMzI7Y2xpY2smIzMyO2xpbmtzJiMz
MjtvciYjMzI7b3BlbiYjMzI7YXR0YWNobWVudHMmIzMyO3VudGlsDQomZ3Q7JiMzMjt5b3UmIzMy
O2hhdmUmIzMyO3ZlcmlmaWVkJiMzMjt0aGUmIzMyO3NlbmRlciYjMzI7b3ImIzMyO3RoZSYjMzI7
Y29udGVudC4NCiZndDsmIzMyOw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtIaSwNCiZndDsmIzMyOw0K
Jmd0OyYjMzI7TGUmIzMyO2x1bmRpJiMzMjswMiYjMzI7anVpbiYjMzI7MjAyNSYjMzI7JiMyMjQ7
JiMzMjswMTozMSYjMzI7KzA4MDAsJiMzMjtKYXNvbi1KSCYjMzI7TGluJiMzMjthJiMzMjsmIzIz
Mztjcml0JiMzMjs6DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtXaXRoJiMzMjt0aGUmIzMyO3JlbW92YWwm
IzMyO29mJiMzMjt0aGUmIzMyO3NoaWZ0X3BhJiMzMjtwYXJhbWV0ZXIsDQomZ3Q7JiMzMjsmZ3Q7
JiMzMjtjbWRxX3BrdF9qdW1wX3JlbF90ZW1wKCkNCiZndDsmIzMyOyZndDsmIzMyO2NhbiYjMzI7
YmUmIzMyO3JlcGxhY2VkJiMzMjtieSYjMzI7dGhlJiMzMjtuZXcmIzMyO2NtZHFfcGt0X2p1bXBf
cmVsKCkmIzMyO3dpdGhvdXQmIzMyO3NoaWZ0X3BhLg0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7
JiMzMjsmZ3Q7JiMzMjtUaGVuLCYjMzI7cmVtb3ZlJiMzMjt0aGUmIzMyO2NtZHFfc2hpZnRfcGEm
IzMyO3ZhcmlhYmxlJiMzMjtpbiYjMzI7dGhlJiMzMjttZHBfZGV2JiMzMjtzdHJ1Y3R1cmUNCiZn
dDsmIzMyOyZndDsmIzMyO2Zvcg0KJmd0OyYjMzI7Jmd0OyYjMzI7ZWFjaCYjMzI7bWJveCYjMzI7
Y2xpZW50Lg0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtGaXhlczomIzMy
O2FkZTE3NjUzNDExMiYjMzI7KCZxdW90O3NvYzomIzMyO21lZGlhdGVrOiYjMzI7Y21kcTomIzMy
O0FkZCYjMzI7cGFyYW1ldGVyJiMzMjtzaGlmdF9wYQ0KJmd0OyYjMzI7Jmd0OyYjMzI7dG8mIzMy
O2NtZHFfcGt0X2p1bXAoKSZxdW90OykNCiZndDsmIzMyOyZndDsmIzMyO1NpZ25lZC1vZmYtYnk6
JiMzMjtKYXNvbi1KSCYjMzI7TGluJiMzMjsmbHQ7amFzb24tamgubGluQG1lZGlhdGVrLmNvbSZn
dDsNCiZndDsmIzMyOyZndDsmIzMyOy0tLQ0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMxNjA7ZHJpdmVy
cy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9tZHAzL210ay1tZHAzLWNtZHEuYyYjMzI7fCYjMzI7
MiYjMzI7Ky0NCiZndDsmIzMyOyZndDsmIzMyOyYjMTYwO2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0v
bWVkaWF0ZWsvbWRwMy9tdGstbWRwMy1jb3JlLmMmIzMyO3wmIzMyOzImIzMyOy0tDQomZ3Q7JiMz
MjsmZ3Q7JiMzMjsmIzE2MDtkcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL21kcDMvbXRr
LW1kcDMtY29yZS5oJiMzMjt8JiMzMjsxJiMzMjstDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzE2MDsz
JiMzMjtmaWxlcyYjMzI7Y2hhbmdlZCwmIzMyOzEmIzMyO2luc2VydGlvbigrKSwmIzMyOzQmIzMy
O2RlbGV0aW9ucygtKQ0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtkaWZm
JiMzMjstLWdpdCYjMzI7YS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL21kcDMvbXRr
LW1kcDMtY21kcS5jDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0v
bWVkaWF0ZWsvbWRwMy9tdGstbWRwMy0NCiZndDsmIzMyOyZndDsmIzMyO2NtZHEuYw0KJmd0OyYj
MzI7Jmd0OyYjMzI7aW5kZXgmIzMyOzc1NzVlYzM3NjM2Ny4uYzM1ZmUwZTNhNGQ1JiMzMjsxMDA2
NDQNCiZndDsmIzMyOyZndDsmIzMyOy0tLSYjMzI7YS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21l
ZGlhdGVrL21kcDMvbXRrLW1kcDMtY21kcS5jDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrKysmIzMyO2Iv
ZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9tZHAzL210ay1tZHAzLWNtZHEuYw0KJmd0
OyYjMzI7Jmd0OyYjMzI7QEAmIzMyOy02MzgsNyYjMzI7KzYzOCw3JiMzMjtAQCYjMzI7c3RhdGlj
JiMzMjtzdHJ1Y3QmIzMyO21kcF9jbWRxX2NtZA0KJmd0OyYjMzI7Jmd0OyYjMzI7Km1kcF9jbWRx
X3ByZXBhcmUoc3RydWN0JiMzMjttZHBfZGV2JiMzMjsqbWRwLA0KJmd0OyYjMzI7Jmd0OyYjMzI7
JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMx
NjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMzMjtnb3RvJiMzMjtlcnJfZnJlZV9wYXRoOw0KJmd0OyYj
MzI7Jmd0OyYjMzI7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMzMjt9DQomZ3Q7JiMz
MjsmZ3Q7JiMzMjsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzMyO2NtZHFfcGt0X2Vv
YygmYW1wO2NtZC0mZ3Q7cGt0KTsNCiZndDsmIzMyOyZndDsmIzMyOy0mIzE2MDsmIzE2MDsmIzE2
MDsmIzE2MDsmIzMyO2NtZHFfcGt0X2p1bXBfcmVsX3RlbXAoJmFtcDtjbWQtJmd0O3BrdCwmIzMy
O0NNRFFfSU5TVF9TSVpFLCYjMzI7bWRwLQ0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0O2NtZHFfc2hp
ZnRfcGFbcHBfaWR4XSk7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrJiMxNjA7JiMxNjA7JiMxNjA7JiMx
NjA7JiMzMjtjbWRxX3BrdF9qdW1wX3JlbCgmYW1wO2NtZC0mZ3Q7cGt0LCYjMzI7Q01EUV9JTlNU
X1NJWkUpOw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtEaWQmIzMyO0kmIzMyO21pc3MmIzMyO3NvbWV0
aGluZyYjMzI7b3ImIzMyO3RoaXMmIzMyO3JldmVydHMmIzMyO3RoZSYjMzI7Y2hhbmdlJiMzMjtt
YWRlJiMzMjtpbiYjMzI7MTUvMjAmIzMyOyYjNjM7JiMzMjtJJiMzOTttDQomZ3Q7JiMzMjthbHNv
DQomZ3Q7JiMzMjt1bnN1cmUmIzMyO2lmJiMzMjtpdHMmIzMyO2NvcnJlY3QmIzMyO3RvJiMzMjth
c2smIzMyO2ZvciYjMzI7YmFja3BvcnRzJiMzMjtvZiYjMzI7dGhpcyYjMzI7d2l0aCYjMzI7Rml4
ZXMmIzMyO3RhZy4NCiZndDsmIzMyO0lzbiYjMzk7dCYjMzI7dGhpcw0KJmd0OyYjMzI7Zm9yJiMz
MjtNVDgxOTYsJiMzMjthJiMzMjtuZXcmIzMyO2JvYXJkJiMzMjsmIzYzOw0KDQpPaCwmIzMyO3lv
dSYjMzI7ZGlkbiYjMzk7dCYjMzI7bWlzcyYjMzI7YW55dGhpbmcuDQpUaGUmIzMyO3JlYXNvbiYj
MzI7Zm9yJiMzMjtyZXZlcnRpbmcmIzMyOyYjOTY7c2hpZnRfcGEmIzk2OyYjMzI7aXMmIzMyO3Ro
YXQmIzMyO01UODE5NiYjMzI7aGFzJiMzMjthbiYjMzI7ZXh0cmENCiYjOTY7bW1pbmZyYV9vZmZz
ZXQmIzk2OyYjMzI7KGluJiMzMjtQQVRDSCYjMzI7Ny8yMCkmIzMyO3doaWNoJiMzMjtpcyYjMzI7
YWxzbyYjMzI7dXNlZCYjMzI7YXMmIzMyO2RyaXZlciYjMzI7ZGF0YSYjMzI7Zm9yDQpDTURRJiMz
Mjtkcml2ZXIuJiMzMjtDb25zaWRlcmluZyYjMzI7dGhhdCYjMzI7dGhlc2UmIzMyO0hXJiMzMjtz
ZXR0aW5ncyYjMzI7YXJlJiMzMjt1c2VkJiMzMjt0byYjMzI7Z2VuZXJhdGUNCkdDRSYjMzI7aW5z
dHJ1Y3Rpb25zLCYjMzI7YW5kJiMzMjt0aGVyZSYjMzI7bWF5JiMzMjtiZSYjMzI7bW9yZSYjMzI7
YW5kJiMzMjttb3JlJiMzMjtzdWNoJiMzMjtzZXR0aW5ncyYjMTYwO2luJiMzMjt0aGUNCmZ1dHVy
ZSwmIzMyO0kmIzMyO3dhbnQmIzMyO3RvJiMzMjtwdXQmIzMyO3RoZXNlJiMzMjtzZXR0aW5ncyYj
MzI7aW5zaWRlJiMzMjtDTURRJiMzMjtkcml2ZXImIzMyO2FzJiMzMjttdWNoJiMzMjthcw0KcG9z
c2libGUmIzMyO3RvJiMzMjttYWtlJiMzMjtDTURRJiMzMjtjbGllbnQmIzMyO2RyaXZlcnMmIzMy
O3VuYXdhcmUmIzMyO29mJiMzMjt0aGVtLg0KDQpUaGVyZWZvcmUsJiMzMjtJJiMzMjtwcm9wb3Nl
ZCYjMzI7UEFUQ0gmIzMyOzMvMjAmIzMyO2FuZCYjMzI7UEFUQ0gmIzMyOzQvMjAuDQpXaXRoJiMz
Mjt0aGVzZSYjMzI7UEFUQ0hzLCYjMzI7YWxsJiMzMjtDTURRJiMzMjtjbGllbnQmIzMyO2RyaXZl
cnMmIzMyO2RvJiMzMjtub3QmIzMyO25lZWQmIzMyO3RvJiMzMjtzdG9yZSYjMzI7YW5kDQpicmlu
ZyYjMzI7YW55JiMzMjtwYXJhbWV0ZXJzJiMzMjtsaWtlJiMzMjsmIzk2O3NoaWZ0X3BhJiM5Njsm
IzMyO29yJiMzMjsmIzk2O21taW5mcmFfb2Zmc2V0JiM5NjsmIzMyO3RvJiMzMjt0aGUNCnNwZWNp
ZmllZCYjMzI7Q01EUSYjMzI7QVBJcyYjMzI7dG8mIzMyO2dlbmVyYXRlJiMzMjtpbnN0cnVjdGlv
bnMuDQoNCkhvd2V2ZXIsJiMzMjt0aGVzZSYjMzI7cGF0Y2hlcyYjMzI7aGF2ZSYjMzI7bm90JiMz
MjtiZWVuJiMzMjtyZXZpZXdlZCYjMzI7YnkmIzMyO290aGVyJiMzMjtyZXZpZXdlcnMmIzMyO3ll
dCwNCnNvJiMzMjt3ZSYjMzI7bWF5JiMzMjtoYXZlJiMzMjt0byYjMzI7d2FpdCYjMzI7YSYjMzI7
d2hpbGUmIzMyO3RvJiMzMjtzZWUmIzMyO2lmJiMzMjtldmVyeW9uZSYjMzI7YWdyZWVzJiMzMjt3
aXRoJiMzMjt0aGlzDQphcHByb2FjaC4mIzMyO1RoZW4mIzMyO3dlJiMzMjtjYW4mIzMyO3NlZSYj
MzI7aWYmIzMyO3dlJiMzMjtuZWVkJiMzMjt0byYjMzI7cmV2ZXJ0JiMzMjt0aGVzZSYjMzI7Y2hh
bmdlcyYjMzI7b2YmIzMyO01EUA0KZHJpdmVyLg0KDQpCeSYjMzI7dGhlJiMzMjt3YXksJiMzMjt3
aGF0JiMzMjtkbyYjMzI7eW91JiMzMjt0aGluayYjMzI7b2YmIzMyO3RoaXMmIzMyO2FwcHJvYWNo
JiM2MzsmIzMyOzotKQ0KDQpSZWdhcmRzLA0KSmFzb24tSkgmIzMyO0xpbg0KDQomZ3Q7JiMzMjsN
CiZndDsmIzMyO05pY29sYXMNCiZndDsmIzMyOw0KJmd0OyYjMzI7DQoNCjwvcHJlPg0KPC9wPjwv
Ym9keT48L2h0bWw+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1F
RElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioqKioqKioqKioNClRoZSBp
bmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFu
eSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmls
ZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2Fi
bGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNp
Z25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRp
b24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVk
aW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJp
Y3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4g
aW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlIA0KdGhhdCB5b3Ug
aGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2Vu
ZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFu
eSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1l
bnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBv
ZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0t
fS0tPg==

--__=_Part_Boundary_001_1831464213.824987067--

