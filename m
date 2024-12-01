Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F17FC9DF692
	for <lists+dri-devel@lfdr.de>; Sun,  1 Dec 2024 18:16:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A720A10E13A;
	Sun,  1 Dec 2024 17:15:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="LRnh+uAW";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="qhz9EU6t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E252310E13A
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Dec 2024 17:15:56 +0000 (UTC)
X-UUID: e9ac9210b00711efbd192953cf12861f-20241202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=LEDP34DgEjewbb6o4dkmVdWC/pMiSv6ovIDtAd9tgXY=; 
 b=LRnh+uAW/8BHVOOdZR9TepM/E0txdY4fcYhWyxpQO2tZ3hxvSZ0OZd5ubnWJUH9R8R7i42rx2PXCZ/cV7YC2pu3/jgMELehEb9BJRuHwuUBbqr0d9DrtUO/2A1mNL0uND3BSm+i6bO9ppEDWAdK5vy4qYG52Jd77KBZiiSHuWQQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44, REQID:d361e244-3c63-4031-85af-82f2c1e7809b, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:464815b, CLOUDID:042ec823-634f-4016-85ba-2d63e55c9400,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
 :-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
 ,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e9ac9210b00711efbd192953cf12861f-20241202
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com (envelope-from <jiaxin.yu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 570013654; Mon, 02 Dec 2024 01:15:50 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 2 Dec 2024 01:15:49 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 2 Dec 2024 01:15:49 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F3ebMUJeiLOiKP/GCnL942HNDr1tScOS1crWezdwZT9hXGmLT31sp+gJsVDl12aspizeCQe4rrMPW4toYNb9C5+uDFz/OwPtZBEwpW4fZbBowvMVmAAD6oPXWK5XpFkjaBmAy3BtISjMSTm+IuNNioUg63TDveTnkbhOZe5pzOnDsAaraodeIhj1fNQkiZVKgPCh7OGZO87dd7Z3Gi9ugiKT/Qj6ZRD4R9pFbODbWjGXjfLOMStLDv71WhhHOJjS8qJj51f8QpC94LAvXTjfxcfYhkSvi460hYgK0JHIVygkbVSNdvrpfvePNsK7XoEGka5pNxpAMHwCBV9ckY0vaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V0/Ythr2XvvJ/o+HarbfsiSU+3nCFIqXQipcvE7EMDM=;
 b=MI2TrDiAGedhzsOzsSuIXI2JDbaR0uFB3LNGe9AvGTRctaNvkyjR9xMKX76n5JQoPLpBvWIn/EHUaZyWxyEBmijxHDp39ZEOiJZWx9r3NBTfAckZ+trXl3miRzvRh450v3+MdYT/cfCuOgCxQg/iYlSfTv0RTMEeCcW3HnD60MBzE5OS1KVCD8ks1WccToO9FJw59D7RSsUHvSu8lOf1o5lEGxh+95u+aejVFiSEjMvtVG4QTZuEGrbLe/j1+kLDS5lwvk5Mab5VywCZp/ONJ0b+vmPUxGlq/hErvETG8xXaBMYUrIsZvMARjbN09kMf/cod7kzWL41DwhEosGxuJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V0/Ythr2XvvJ/o+HarbfsiSU+3nCFIqXQipcvE7EMDM=;
 b=qhz9EU6t6eauaCH5VBPSc9iJVwQYFOIhSrrSz/5WgbFSiPKOKBCETvwCI1Xp6AMk81GyJiyH668A9n1jYySQDKflOEV9/IX1eXFr1FMafllUSXXiqzRQBazxf9DePxdQMBanp/3NVdEmf0LefaibchGMX7SKFHqgPUrJvihgUnM=
Received: from SEYPR03MB6459.apcprd03.prod.outlook.com (2603:1096:101:50::10)
 by SEZPR03MB7946.apcprd03.prod.outlook.com (2603:1096:101:186::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.14; Sun, 1 Dec
 2024 17:15:45 +0000
Received: from SEYPR03MB6459.apcprd03.prod.outlook.com
 ([fe80::a0a8:8edf:b2da:9262]) by SEYPR03MB6459.apcprd03.prod.outlook.com
 ([fe80::a0a8:8edf:b2da:9262%4]) with mapi id 15.20.8207.014; Sun, 1 Dec 2024
 17:15:45 +0000
From: =?utf-8?B?SmlheGluIFl1ICjkv57lrrbpkasp?= <Jiaxin.Yu@mediatek.com>
To: "broonie@kernel.org" <broonie@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "ajye_huang@compal.corp-partner.google.com"
 <ajye_huang@compal.corp-partner.google.com>,
 =?utf-8?B?Q2h1bnh1IExpICjmnY7mmKXml60p?= <Chunxu.Li@mediatek.com>,
 =?utf-8?B?QWxsZW4tS0ggQ2hlbmcgKOeoi+WGoOWLsik=?=
 <Allen-KH.Cheng@mediatek.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "kuninori.morimoto.gx@renesas.com"
 <kuninori.morimoto.gx@renesas.com>, "andrzej.hajda@intel.com"
 <andrzej.hajda@intel.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, "robert.foss@linaro.org"
 <robert.foss@linaro.org>, "Laurent.pinchart@ideasonboard.com"
 <Laurent.pinchart@ideasonboard.com>, "neil.armstrong@linaro.org"
 <neil.armstrong@linaro.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Nicolas Prado
 <nfraprado@collabora.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>
Subject: Re: [PATCH v2 1/3] ASoC: hdmi-codec: Add event handler for hdmi TX
Thread-Topic: [PATCH v2 1/3] ASoC: hdmi-codec: Add event handler for hdmi TX
Thread-Index: AQHZALKPLtjy9JnSM0qA0l4xMT7+Dq5PjsoAgATmBQCAAbf+AIAC/qmAgAAE8QCABeevAIAAKsUAgAy4s4CAACTNAIRqB42A
Date: Sun, 1 Dec 2024 17:15:45 +0000
Message-ID: <a699178dcef540fff5caae6291983a444886bff6.camel@mediatek.com>
References: <20221125094413.4940-1-jiaxin.yu@mediatek.com>
 <20221125094413.4940-2-jiaxin.yu@mediatek.com>
 <Y4Cysgk5Gic5ae9B@sirena.org.uk>
 <18c82f6f723cd97a9d6b9a7ff16c6ed62fd005d6.camel@mediatek.com>
 <Y4Y/vEWe3dw0FPQH@sirena.org.uk>
 <cf9ea98a3263ffb8fc8b542888ad0ad680facfc7.camel@mediatek.com>
 <Y4jHAJgmz/P58Q/C@sirena.org.uk>
 <7023a2c7b471d6888d9079563a6c01f22599201f.camel@mediatek.com>
 <Y43e+EsNCrCpZSIH@sirena.org.uk>
 <dc50d0b21795acbcc44c77e5fd81e7cb92c65c67.camel@mediatek.com>
 <Y5ipwqzHKTK8UdlC@sirena.org.uk>
In-Reply-To: <Y5ipwqzHKTK8UdlC@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB6459:EE_|SEZPR03MB7946:EE_
x-ms-office365-filtering-correlation-id: e1442506-cf62-4f81-b2d4-08dd122bcac3
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|366016|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?dUg4cmZ1aDh6bHNjL0Ntc3NuZlA0WHJvVUFwQlBTWTNOeEJlVStPVkt1VnpI?=
 =?utf-8?B?NW1Qb1hRdVU2bTV0UGE4eDF3QTgrU01jbnFCQW9iSTZXQzZCUGpiODhuT0gv?=
 =?utf-8?B?amNtWExaVDRZMlJEWWR2bjE4SkNzaFNZS284TUU5WGRlWkFSWGNGSkpMRFRn?=
 =?utf-8?B?ODFYd1hvYVpKRzVnWVc5TlhXendWVlJ5MnlhMzMrNXIxbTl0ZG1WNmVoYXZU?=
 =?utf-8?B?MnhwRHJoMzVjeUFhRGx0cnd2VnRBZTlacmFhRERCMU9rbGlReG5td3lyQjVT?=
 =?utf-8?B?UklFVVpUNkFpa2h0SDlDQ0RJTFZybGVhSFFjZGg2U3IvbjFJZGZGRHEwelV1?=
 =?utf-8?B?Yjg1RzkxWUV2amFqbTh0Uy9EU1o3b3Z4cVNvMHlmQUhkVG9veVc3emhjYW5Q?=
 =?utf-8?B?dmZiakdyV1pERjF0c3BXL1NoczZZVlh2ZXpkb3ZUNTMrMjdHd2gzSjNwMFpa?=
 =?utf-8?B?RkVER2Y0d2NZMXFLdU9VbjVmYkJKT3JMQ0kyYlRmZFFYNkh5OFBHbm9JMGhP?=
 =?utf-8?B?YzRZN2xwWi91dXRBKzgrcnJjNGZOTFhkRTh3N0V6WDJHcWV0YzNGWE5vTm5M?=
 =?utf-8?B?MmFJenhzVDNrUGQ1Rk5qTGhhdXEvOGlqMk5xTUIxS05HVkh1N3lBVm1sdVh0?=
 =?utf-8?B?dWxkTXh5TkVlOEllT0lPbm82dk9VZzl4R2NtV1Uva3lvdGRBWWtCTEVVblFO?=
 =?utf-8?B?NzEybFNMeEdtWGY1Y3h6d1NpbWN1N3VCL1RoQzI1VVNuWnBmOC8xTksvdlpw?=
 =?utf-8?B?bWF3N2FTYVZKaTh5Q0lKTWEvWnhGVkgxeHE4NkpBRmd4Zk5kK3JHMVhaQ1Ri?=
 =?utf-8?B?bzV6M0UyUmN0Ui9WUEpEaUE3d3VFYmhBWmgrelc3MVl2MkdzN044UDYyR1Va?=
 =?utf-8?B?MmZCVURnWlhORTZuVE45eVdGYklmU1llYXRjZUhDdlg0K1FqYklNdEY5MEN0?=
 =?utf-8?B?TXFVUktMQ3BJZGFvUjRWQVQwcHVDM0dSWGhKYkRCSkpsaVVyb2hDQzErMzdK?=
 =?utf-8?B?OXF2ZXJaUis2VGhDTGtJSmw2eUNESUtGT2t5ZjlhTHd5NzFvcUJpS0xFa2JS?=
 =?utf-8?B?N3JHdXpQZW5TN2VFVVJmSDhoVnpCekVTZURBMXBaMW54WFpwT1cwZ2RLbFE2?=
 =?utf-8?B?ZEczTllTVXN3RC9mZTN6TjZQeUltYUZwQlNEdUJKWkkvMEsvc0ZIWEdPRHoy?=
 =?utf-8?B?d3N6WXdzeU9Yc0NoYmVkelRVb1YzVVdyTDl1VkRoOWd5Vkl1L0lOajV4QjVL?=
 =?utf-8?B?K1RUMjZtazRtM1RBRDVoSUxSRzdYTnpOR0x1VENVUVZ2Z2pkc0Q3bGlURFc2?=
 =?utf-8?B?cm1STFp6WmJkYzdTRWhXQURGL2NWMFVnaEdPZ0dCbnBOQzNpUTZjcEJYTHUr?=
 =?utf-8?B?ZU5GS0lkeTFaUGRvSXdsVURxR0N3UzhrZ1Uwelovdll4RGhQV3ZSTTRDNlFG?=
 =?utf-8?B?cFJ6TDVaUFUzNHlycnJsZHlMMG5tOGtuL0RiUDQydTVjMlNRTGNwMUNBNldk?=
 =?utf-8?B?MnliMWExLy90TkJ5YnZlaytZQUtxYTJRS056d083M2NmanZ2NFU0RGpXK0Fk?=
 =?utf-8?B?VDVnNHpBeVh0V0E0cjBITjZQVUJTUENsbHhQd3RHcFROMCs4S0pUYW5YQUUv?=
 =?utf-8?B?eTVDbWxHOUlkcitaR2kyai91QXdqNDdLR043ZEUyZkJUeXNjWEE4Ky9lZ09O?=
 =?utf-8?B?VWFlYXd3ZXdlTmlxYTZtN1RLd0FTWHVPNWVGbkxuM0NBZVliTkdrL3Fxem9B?=
 =?utf-8?B?emNnaDUzL0FXbFp1RXQ4YVplVk5xTE5GV0ZZMzd5WG9QdFZpSTRFQlpQcXVQ?=
 =?utf-8?B?NkhNZjVTMm5YKzNxL1IyaE50RzU1ZGRBaUU1SzN4NksxRGdxNWcrWitJNXNI?=
 =?utf-8?B?TGk0d2xRdmRVUWZSVkZoUlFMdVdUMUY3REdueXBUY2FGZ3c9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB6459.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(366016)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SjRySlF6NVl6UmxydlZWeUlzWmNUaW5VNzdNaEhqdlpSaFA0T2xxWFplZURl?=
 =?utf-8?B?VzcxaHJnblIxTXVhSUxQZDF3VEVVaDhiRkZ2TFEzdXpIeWcwd3FzcmZHc1lr?=
 =?utf-8?B?Y1VGaEFGRDdFTElWSVhSS3hCRmFOYkRqVHRTVkhVdHBMeFBzZndCaXdwQm50?=
 =?utf-8?B?M2pFeTFucXd3Zzg4bHVEMFA5U2g5bE5rVDJwT09LOTBGckJ3ZVBVVC9oY2hj?=
 =?utf-8?B?QVBjUStjd2RuREFVWlU1SWJMU2ZNc1BLUit1TmhzKzNzYmpWTmpTTFhjOEJs?=
 =?utf-8?B?ZFB5d2hkeW4vbUFTR0NlQU1aRkUybGtTR3JKS1BEai8wMDEzVHJpTE1BajY2?=
 =?utf-8?B?RmhrbEpaeDFYU1IxUXcwNG5FbzZnb1YzK25vbkdoK082YTZSRlVQaVNaTWZM?=
 =?utf-8?B?R0U1cGNpZUJQS2FkWTN5MTg3Rmw1aXRtVTlMc2JUbTRkTzVlcHkvUWlqZXZD?=
 =?utf-8?B?Ynp3YTREMlBkcThmUGtKVk1OODdMUTQrOVA5VlZvOTRUS3N4YWNVdVo4a3RO?=
 =?utf-8?B?VENvcjk0dUhNS09KR3JCaUFhWVlrVXZGYkNJajJETVFDa0kvNUFsWlMvNlVO?=
 =?utf-8?B?aDNadlRzam9KQmNJTXNwcTErVFVzWXp3ZElkeFgyaFJMOHkwc201d2VwSzFh?=
 =?utf-8?B?TXBpTFQ3MFBSeDBrSG1WT3M4MDNHaDRMUCtCNDFwWjlPbEtMVXNpeHNJTE9k?=
 =?utf-8?B?R0xRTC9rbTNCUkErY2duaU9UaFY1SzVzdHdOUHI3a3hRV2xqLzFkekczWmd5?=
 =?utf-8?B?R1UvcjJMN3VQaHB2clFYSi9WMjB1ODhzejRZZ3h6ZE9mQ3pZUkozSEkxT2Ji?=
 =?utf-8?B?TmQ1WWhxZ294dlA4MEZrdWhWbmUxcHNFampQV3AzRTZzUkdIeHFlZDVOWnB4?=
 =?utf-8?B?UE9nTW5ZdGd3a0tvcW5IZG95Zy8yNXo1VTFmaDhvM0tDNGVjSkg4TDgzTkpz?=
 =?utf-8?B?ZUUzSHJIcWVwUEpLdjFrbXArUmdXVWNoWHA0WTdDV0FneEdLOU1SbFRsbzMr?=
 =?utf-8?B?bVVuZ2VxUkxqVC9UZWJyVXJRWXM5bU9tb0VaUlpNQmtrZ1Z6RVptQTVXL2F0?=
 =?utf-8?B?YnhJanozOUtNYTY0RDRlVmZ3VjVmWGtNNEt3eUZXNVZFVkFuTzQ5eW9kNmRv?=
 =?utf-8?B?Z3A3d3JVeWhDamxsMjVCWFlocFMyejk3dkRxclRBWTJWT3ZjV1hZTlhidmky?=
 =?utf-8?B?NlVhQjhuTTR2dkRtdlZDTklGLzBOMko0bUJYQmFzMW91THZWcEZsTEl3RS80?=
 =?utf-8?B?Vkp3T1RwaHJ3Um5FdG5oTk9xOGl6cnJucC9LZ2JxVy91YzdHK0ZxSHA0cUU1?=
 =?utf-8?B?ekY3YzVJeFFxQjN0SHJvRCt4QW1vSDQxVTNOa2VJN2gySVhuTzdnUmFZUU11?=
 =?utf-8?B?ZlEyUkMvSW94R1AxYVUrbWZxeEtTY0t1endaMTY2ampLYXkrVlJBZy95bjIx?=
 =?utf-8?B?c2RrYXlCS1MwbjJHZHZGQlZTMGk1UThnZzNSeUFYaVE0ZHdxa3EzdlhJcitG?=
 =?utf-8?B?ckRBYjBIQTZzT0N6QTlDK2xwWFlUVmZHRWFpV0x2USszaU9QNkRDR3ltdUJi?=
 =?utf-8?B?WittdEJmNEwwVUhuc21WbUhtcHc4NDdXSnZWcjNUWE9zZXcybjJkQ05CblBh?=
 =?utf-8?B?NDlBd0QreGhNdW5la0ZheENTaXVRckdwaVNUME9PaVJXWHRuMUk0TE5XVzd5?=
 =?utf-8?B?aE1vKytUbVN4SHZBelBock5LUlhvbDJ3NjZKSDlnVzhINm1qUDdPQU5jakJ0?=
 =?utf-8?B?dVVuQzQyMUJET01mT0lYTkUyZWdsZTZPZHNZUDZQUHhhNmRoZ0tKKzd3R2lQ?=
 =?utf-8?B?S0RHelB5TmpTTXRENVYrMGc2MjgyS1VMeGtpL1pqZE4wcmJ0Mm9kNnBmcVhL?=
 =?utf-8?B?ZHdQTlc5bktYYmFUd1ZIZnZUSkxMWDBrSVo1bzVYTkFKdlo2WnU4ZThBaC9v?=
 =?utf-8?B?R01ONWV6M0lwektFRmdiUjVkMExsaEdpZWhUUkVIb2pSVGFxdnJSMUNwVkxh?=
 =?utf-8?B?bXZZZFFvUWVmWEZua1dWeHJJTURxRXArUER4eURQeHJHMDNKVUdTUXJtTTZ1?=
 =?utf-8?B?cXQ3RmtEN3JxbHliQzVhK2ZHOC9VSGRWc0kzYS8rbkJIUk1uUkVjdC9YcC9Q?=
 =?utf-8?Q?v2tzASR69tuCwLnQTQ7wQ4VO3?=
Content-ID: <96AECE968085044192E6BEBD1B69D255@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB6459.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1442506-cf62-4f81-b2d4-08dd122bcac3
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2024 17:15:45.0864 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0kAmHVqGgX60pcCnj613Fm/p4fCq2ZjeqRZVv0sOleWna0V4AwfyMI6KGp1Xrxl94m4Pb6zbufwaYdjcyc1ZJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7946
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--11.346700-8.000000
X-TMASE-MatchedRID: cnNFLnOjrwrUL3YCMmnG4ia1MaKuob8Pt3aeg7g/usCe9toQ6h6LEz5K
 q5tyGyvzLcdfV+CTUsrcCgww7x2eJ4QpiSyKJyYZbc297PAGtWYxmbT6wQT2a2ecrqZc3vab9bI
 AZTQmzWDpzJLLPKby1gf8kXseMWvbHZ3queXVwR9IRA38P/dwbtxWLypmYlZzbzsaR53OnPK4XQ
 ER51G1bV4/htSNgpXfG+MMVDGhq0wdVBXyH4TZjqwOh3D3JSTGaXmdXF2Ym8czbE2yODRSP5zZ+
 l9VpwE3zBaQKIWNzwEhsEYGIqc55aimUd3sgxzUQpxiLlDD9FW2McZY43zJ4zwfB1KoVaspoHUO
 2xhl1raclrsbNHSTSi0pMKfUMDXDuGFoWyRJYOqmQhbcat5/fcBZPOJYZoM8JNtaLihfejujxYy
 RBa/qJRVHsNBZf9aRPcCXjNqUmkXCttcwYNipXxRAJC2k3BZ6eoYJCt1ry6YU6q1SvL7eU5mIJt
 QM2532DG5CZrtH6VM=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--11.346700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 5E9090651AA99FEE2CBA27154E67D548222C2824CCE114B01DDE0AD5B53408852000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_002_558916176.707361832"
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

--__=_Part_Boundary_002_558916176.707361832
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDIyLTEyLTEzIGF0IDE2OjM1ICswMDAwLCBNYXJrIEJyb3duIHdyb3RlOg0KPiBP
biBUdWUsIERlYyAxMywgMjAyMiBhdCAwMjoyMzozMlBNICswMDAwLCBKaWF4aW4gWXUgKOS/nuWu
tumRqykgd3JvdGU6DQo+ID4gT24gTW9uLCAyMDIyLTEyLTA1IGF0IDEyOjA3ICswMDAwLCBNYXJr
IEJyb3duIHdyb3RlOg0KPiA+ID4gT24gTW9uLCBEZWMgMDUsIDIwMjIgYXQgMDk6MzQ6MTdBTSAr
MDAwMCwgSmlheGluIFl1ICjkv57lrrbpkaspIHdyb3RlOg0KPiA+ID4gTm8sIEkgbWVhbiB0aGF0
IGlmIHlvdSB3YW50IHRvIGNvbnRyb2wgdGhlIGVuYWJsZSBhbmQgZGlzYWJsZSBvZg0KPiA+ID4g
dGhlDQo+ID4gPiBvdXRwdXQgcGF0aCB5b3Ugc2hvdWxkIGltcGxlbWVudCBhIERBUE0gd2lkZ2V0
Lg0KPiA+IE1heSBJIGFzayB3aGljaCBkcml2ZXIgZmlsZSB0byBhZGQgYSBuZXcgREFQTSB3aWRn
ZXQ/IElzIGl0IHRoZQ0KPiA+IGJyaWRnZQ0KPiA+IGljIGRyaXZlciBsaWtlIGl0NjUwNS5jPyBP
ciBpcyBpdCBsaW5rZSB0aGUgIlNEQiIgYWRkZWQgaW4gdGhpcw0KPiA+IHBhdGNoPw0KPiANCj4g
SSB3b3VsZCBleHBlY3QgdGhpcyB0byBmb2xsb3cgYSBzaW1pbGFyIHBhdHRlcm4gdG8gZXZlcnl0
aGluZyBlbHNlDQo+IHdpdGgNCj4gaGRtaS1jb2RlYy5jIGFuZCBoYXZlIHRoZSBhY3R1YWwgQVNv
QyBzdHVmZiBpbiB0aGVyZSB3aXRoIGEgY2FsbGJhY2sNCj4gZXhwb3NlZCB0byB0aGUgcmVzdCBv
ZiB0aGUgd29ybGQuDQo+IA0KPiA+IFllcywgSSBzaG91bGQgYWRkIGEgbmV3IHNldCBvZiBldmVu
dHMsIHN1Y2ggYXM6DQo+ID4gZW51bSB7DQo+ID4gICAgIEhETUlfQ09ERUNfVFJJR0dFUl9FVkVO
VF9TVE9QLA0KPiA+ICAgICBIRE1JX0NPREVDX1RSSUdHRVJfRVZFTlRfU1RBUlQsDQo+ID4gICAg
IEhETUlfQ09ERUNfVFJJR0dFUl9FVkVOVF9TVVNQRU5ELA0KPiA+ICAgICBIRE1JX0NPREVDX1RS
SUdHRVJfRVZFTlRfUkVTVU1FLA0KPiA+IH0NCj4gPiBUaGVuIHByb3ZpZGUgaGFuZGxlcyBmb3Ig
dGhlc2UgZXZlbnRzIGluIHRoZSBpdDY1MDUgZHJpdmVyLiBBbSBJDQo+ID4gcmlnaHQ/DQo+IA0K
PiBJJ2QgZXhwZWN0IG1vcmUgbGlrZSBvbi9vZmYgZm9yIGEgREFQTSB3aWRnZXQgKHRoZSBEQVBN
IGNhbGxiYWNrcyBhcmUNCj4gcHJlL3Bvc3Qgb24vb2ZmKSBidXQgeWVzLg0KDQpEZWFyIG1hcmss
DQpJIGFwb2xvZ2l6ZSBmb3IgdGhlIGRlbGF5IGluIHJlc3BvbmRpbmcgdG8gdGhpcyBpc3N1ZSwg
YXMgd2UgaGF2ZQ0KcmVjZW50bHkgZW5jb3VudGVyZWQgdGhlIHNhbWUgcHJvYmxlbSBhZ2Fpbi4g
SSB3b3VsZCBsaWtlIHRvIGhhdmUgeW91cg0KZ3VpZGFuY2Ugb24gdGhpcyBpc3N1ZSBvbmNlIG1v
cmUuIExldCBtZSBkZXNjcmliZSB0aGUgcHJvYmxlbSB3ZQ0KZW5jb3VudGVyZWQgYWdhaW4uDQoN
Cg0KICAgICAgICAgICAgICAgICAgICAgPT0+ICJoZG1pLWF1ZGlvLWNvZGVjIihpdDY1MDUgcGx1
Zy1pbikNCkRMMShGRSkgPT0+IEkyUzEoQkUpIA0KICAgICAgICAgICAgICAgICAgICAgPT0+ICJy
dDEwMTlwIihTcGVha2VyIENvZGVjKQ0KDQpJIHdhbnQgdG8gaW5kZXBlbmRlbnRseSBjb250cm9s
IHRoZSBzd2l0Y2hlcyBmb3IgdGhlIHNwZWFrZXIgYW5kIGhkbWksDQphbmQgcmVhbGl6ZSB0aGF0
IHdoZW4gSERNSSBpcyBwbHVnZ2VkIGluLCBJIGNhbiBzd2l0Y2ggdG8gc3BlYWtlcg0KcGxheWJh
Y2ssIGFuZCBJIGNhbiBhbHNvIHN3aXRjaCBiYWNrIHRvIGhkbWkgcGxheWJhY2sgdG9vLiBPZiBj
b3Vyc2UsDQpJMlMxIGlzIHVzZWQgZm9yIHBsYXliYWNrIGF0IHRoaXMgdGltZS4gDQoNClNvIEkg
d2FudCB0byBhc2sgaWYgSSBjYW4gZG8gaXQgYnkganVzdCBhZGRpbmcNClNPQ19EQVBNX1BJTl9T
V0lUQ0goIlNwZWFrZXJzIikgYW5kIFNPQ19EQVBNX1BJTl9TV0lUQ0goIkhETUkiKT8NCkNvcnJl
c3BvbmRpbmdseSwgZGFwbSB3aWRnZXQgYW5kIHJvdXRlIHBhdGggbmVlZCB0byBiZSBhZGRlZC4g
VGhhdCBpcw0KIlNORF9TT0NfREFQTV9TUEsoIlNwZWFrZXJzIiwgTlVMTCkvIFNORF9TT0NfREFQ
TV9MSU5FKCJIRE1JMSIsIE5VTEwpIg0KYW5kICJ7IlNwZWFrZXJzIiwgTlVMTCwgIlNwZWFrZXIi
fS8geyJIRE1JMSIsIE5VTEwsICJUWCJ9Ii4NCg0KSWYgdGhlIGFib3ZlIGlzIG5vdCBlbm91Z2gs
IHdoYXQgZWxzZSBzaG91bGQgSSBtb2RpZnk/IGhkbWktY29kZWMuYyBvcg0KaXQ2NTA1LmM/IExv
b2tpbmcgZm9yd2FyZCB0byBnZXR0aW5nIHlvdSByZXBseSwgVGhhbmsgeW91Lg0KDQpKaWF4aW4u
WXUNCg0KDQoNCg0K

--__=_Part_Boundary_002_558916176.707361832
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1R1ZSwmIzMyOzIwMjItMTItMTMmIzMyO2F0
JiMzMjsxNjozNSYjMzI7KzAwMDAsJiMzMjtNYXJrJiMzMjtCcm93biYjMzI7d3JvdGU6DQomZ3Q7
JiMzMjtPbiYjMzI7VHVlLCYjMzI7RGVjJiMzMjsxMywmIzMyOzIwMjImIzMyO2F0JiMzMjswMjoy
MzozMlBNJiMzMjsrMDAwMCwmIzMyO0ppYXhpbiYjMzI7WXUmIzMyOygmIzIwNDQ2OyYjMjM0Nzg7
JiMzNzk5NTspJiMzMjt3cm90ZToNCiZndDsmIzMyOyZndDsmIzMyO09uJiMzMjtNb24sJiMzMjsy
MDIyLTEyLTA1JiMzMjthdCYjMzI7MTI6MDcmIzMyOyswMDAwLCYjMzI7TWFyayYjMzI7QnJvd24m
IzMyO3dyb3RlOg0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7T24mIzMyO01vbiwmIzMyO0Rl
YyYjMzI7MDUsJiMzMjsyMDIyJiMzMjthdCYjMzI7MDk6MzQ6MTdBTSYjMzI7KzAwMDAsJiMzMjtK
aWF4aW4mIzMyO1l1JiMzMjsoJiMyMDQ0NjsmIzIzNDc4OyYjMzc5OTU7KSYjMzI7d3JvdGU6DQom
Z3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtObywmIzMyO0kmIzMyO21lYW4mIzMyO3RoYXQmIzMy
O2lmJiMzMjt5b3UmIzMyO3dhbnQmIzMyO3RvJiMzMjtjb250cm9sJiMzMjt0aGUmIzMyO2VuYWJs
ZSYjMzI7YW5kJiMzMjtkaXNhYmxlJiMzMjtvZg0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7
dGhlDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtvdXRwdXQmIzMyO3BhdGgmIzMyO3lvdSYj
MzI7c2hvdWxkJiMzMjtpbXBsZW1lbnQmIzMyO2EmIzMyO0RBUE0mIzMyO3dpZGdldC4NCiZndDsm
IzMyOyZndDsmIzMyO01heSYjMzI7SSYjMzI7YXNrJiMzMjt3aGljaCYjMzI7ZHJpdmVyJiMzMjtm
aWxlJiMzMjt0byYjMzI7YWRkJiMzMjthJiMzMjtuZXcmIzMyO0RBUE0mIzMyO3dpZGdldCYjNjM7
JiMzMjtJcyYjMzI7aXQmIzMyO3RoZQ0KJmd0OyYjMzI7Jmd0OyYjMzI7YnJpZGdlDQomZ3Q7JiMz
MjsmZ3Q7JiMzMjtpYyYjMzI7ZHJpdmVyJiMzMjtsaWtlJiMzMjtpdDY1MDUuYyYjNjM7JiMzMjtP
ciYjMzI7aXMmIzMyO2l0JiMzMjtsaW5rZSYjMzI7dGhlJiMzMjsmcXVvdDtTREImcXVvdDsmIzMy
O2FkZGVkJiMzMjtpbiYjMzI7dGhpcw0KJmd0OyYjMzI7Jmd0OyYjMzI7cGF0Y2gmIzYzOw0KJmd0
OyYjMzI7DQomZ3Q7JiMzMjtJJiMzMjt3b3VsZCYjMzI7ZXhwZWN0JiMzMjt0aGlzJiMzMjt0byYj
MzI7Zm9sbG93JiMzMjthJiMzMjtzaW1pbGFyJiMzMjtwYXR0ZXJuJiMzMjt0byYjMzI7ZXZlcnl0
aGluZyYjMzI7ZWxzZQ0KJmd0OyYjMzI7d2l0aA0KJmd0OyYjMzI7aGRtaS1jb2RlYy5jJiMzMjth
bmQmIzMyO2hhdmUmIzMyO3RoZSYjMzI7YWN0dWFsJiMzMjtBU29DJiMzMjtzdHVmZiYjMzI7aW4m
IzMyO3RoZXJlJiMzMjt3aXRoJiMzMjthJiMzMjtjYWxsYmFjaw0KJmd0OyYjMzI7ZXhwb3NlZCYj
MzI7dG8mIzMyO3RoZSYjMzI7cmVzdCYjMzI7b2YmIzMyO3RoZSYjMzI7d29ybGQuDQomZ3Q7JiMz
MjsNCiZndDsmIzMyOyZndDsmIzMyO1llcywmIzMyO0kmIzMyO3Nob3VsZCYjMzI7YWRkJiMzMjth
JiMzMjtuZXcmIzMyO3NldCYjMzI7b2YmIzMyO2V2ZW50cywmIzMyO3N1Y2gmIzMyO2FzOg0KJmd0
OyYjMzI7Jmd0OyYjMzI7ZW51bSYjMzI7ew0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjtIRE1JX0NPREVDX1RSSUdHRVJfRVZFTlRfU1RPUCwNCiZndDsmIzMyOyZndDsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7SERNSV9DT0RFQ19UUklHR0VSX0VWRU5UX1NUQVJULA0KJmd0
OyYjMzI7Jmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtIRE1JX0NPREVDX1RSSUdHRVJfRVZF
TlRfU1VTUEVORCwNCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7SERNSV9D
T0RFQ19UUklHR0VSX0VWRU5UX1JFU1VNRSwNCiZndDsmIzMyOyZndDsmIzMyO30NCiZndDsmIzMy
OyZndDsmIzMyO1RoZW4mIzMyO3Byb3ZpZGUmIzMyO2hhbmRsZXMmIzMyO2ZvciYjMzI7dGhlc2Um
IzMyO2V2ZW50cyYjMzI7aW4mIzMyO3RoZSYjMzI7aXQ2NTA1JiMzMjtkcml2ZXIuJiMzMjtBbSYj
MzI7SQ0KJmd0OyYjMzI7Jmd0OyYjMzI7cmlnaHQmIzYzOw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtJ
JiMzOTtkJiMzMjtleHBlY3QmIzMyO21vcmUmIzMyO2xpa2UmIzMyO29uL29mZiYjMzI7Zm9yJiMz
MjthJiMzMjtEQVBNJiMzMjt3aWRnZXQmIzMyOyh0aGUmIzMyO0RBUE0mIzMyO2NhbGxiYWNrcyYj
MzI7YXJlDQomZ3Q7JiMzMjtwcmUvcG9zdCYjMzI7b24vb2ZmKSYjMzI7YnV0JiMzMjt5ZXMuDQoN
CkRlYXImIzMyO21hcmssDQpJJiMzMjthcG9sb2dpemUmIzMyO2ZvciYjMzI7dGhlJiMzMjtkZWxh
eSYjMzI7aW4mIzMyO3Jlc3BvbmRpbmcmIzMyO3RvJiMzMjt0aGlzJiMzMjtpc3N1ZSwmIzMyO2Fz
JiMzMjt3ZSYjMzI7aGF2ZQ0KcmVjZW50bHkmIzMyO2VuY291bnRlcmVkJiMzMjt0aGUmIzMyO3Nh
bWUmIzMyO3Byb2JsZW0mIzMyO2FnYWluLiYjMzI7SSYjMzI7d291bGQmIzMyO2xpa2UmIzMyO3Rv
JiMzMjtoYXZlJiMzMjt5b3VyDQpndWlkYW5jZSYjMzI7b24mIzMyO3RoaXMmIzMyO2lzc3VlJiMz
MjtvbmNlJiMzMjttb3JlLiYjMzI7TGV0JiMzMjttZSYjMzI7ZGVzY3JpYmUmIzMyO3RoZSYjMzI7
cHJvYmxlbSYjMzI7d2UNCmVuY291bnRlcmVkJiMzMjthZ2Fpbi4NCg0KDQomIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjs9PSZndDsmIzMyOyZxdW90O2hkbWkt
YXVkaW8tY29kZWMmcXVvdDsoaXQ2NTA1JiMzMjtwbHVnLWluKQ0KREwxKEZFKSYjMzI7PT0mZ3Q7
JiMzMjtJMlMxKEJFKSYjMzI7DQomIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjs9PSZndDsmIzMyOyZxdW90O3J0MTAxOXAmcXVvdDsoU3BlYWtlciYjMzI7Q29k
ZWMpDQoNCkkmIzMyO3dhbnQmIzMyO3RvJiMzMjtpbmRlcGVuZGVudGx5JiMzMjtjb250cm9sJiMz
Mjt0aGUmIzMyO3N3aXRjaGVzJiMzMjtmb3ImIzMyO3RoZSYjMzI7c3BlYWtlciYjMzI7YW5kJiMz
MjtoZG1pLA0KYW5kJiMzMjtyZWFsaXplJiMzMjt0aGF0JiMzMjt3aGVuJiMzMjtIRE1JJiMzMjtp
cyYjMzI7cGx1Z2dlZCYjMzI7aW4sJiMzMjtJJiMzMjtjYW4mIzMyO3N3aXRjaCYjMzI7dG8mIzMy
O3NwZWFrZXINCnBsYXliYWNrLCYjMzI7YW5kJiMzMjtJJiMzMjtjYW4mIzMyO2Fsc28mIzMyO3N3
aXRjaCYjMzI7YmFjayYjMzI7dG8mIzMyO2hkbWkmIzMyO3BsYXliYWNrJiMzMjt0b28uJiMzMjtP
ZiYjMzI7Y291cnNlLA0KSTJTMSYjMzI7aXMmIzMyO3VzZWQmIzMyO2ZvciYjMzI7cGxheWJhY2sm
IzMyO2F0JiMzMjt0aGlzJiMzMjt0aW1lLiYjMzI7DQoNClNvJiMzMjtJJiMzMjt3YW50JiMzMjt0
byYjMzI7YXNrJiMzMjtpZiYjMzI7SSYjMzI7Y2FuJiMzMjtkbyYjMzI7aXQmIzMyO2J5JiMzMjtq
dXN0JiMzMjthZGRpbmcNClNPQ19EQVBNX1BJTl9TV0lUQ0goJnF1b3Q7U3BlYWtlcnMmcXVvdDsp
JiMzMjthbmQmIzMyO1NPQ19EQVBNX1BJTl9TV0lUQ0goJnF1b3Q7SERNSSZxdW90OykmIzYzOw0K
Q29ycmVzcG9uZGluZ2x5LCYjMzI7ZGFwbSYjMzI7d2lkZ2V0JiMzMjthbmQmIzMyO3JvdXRlJiMz
MjtwYXRoJiMzMjtuZWVkJiMzMjt0byYjMzI7YmUmIzMyO2FkZGVkLiYjMzI7VGhhdCYjMzI7aXMN
CiZxdW90O1NORF9TT0NfREFQTV9TUEsoJnF1b3Q7U3BlYWtlcnMmcXVvdDssJiMzMjtOVUxMKS8m
IzMyO1NORF9TT0NfREFQTV9MSU5FKCZxdW90O0hETUkxJnF1b3Q7LCYjMzI7TlVMTCkmcXVvdDsN
CmFuZCYjMzI7JnF1b3Q7eyZxdW90O1NwZWFrZXJzJnF1b3Q7LCYjMzI7TlVMTCwmIzMyOyZxdW90
O1NwZWFrZXImcXVvdDt9LyYjMzI7eyZxdW90O0hETUkxJnF1b3Q7LCYjMzI7TlVMTCwmIzMyOyZx
dW90O1RYJnF1b3Q7fSZxdW90Oy4NCg0KSWYmIzMyO3RoZSYjMzI7YWJvdmUmIzMyO2lzJiMzMjtu
b3QmIzMyO2Vub3VnaCwmIzMyO3doYXQmIzMyO2Vsc2UmIzMyO3Nob3VsZCYjMzI7SSYjMzI7bW9k
aWZ5JiM2MzsmIzMyO2hkbWktY29kZWMuYyYjMzI7b3INCml0NjUwNS5jJiM2MzsmIzMyO0xvb2tp
bmcmIzMyO2ZvcndhcmQmIzMyO3RvJiMzMjtnZXR0aW5nJiMzMjt5b3UmIzMyO3JlcGx5LCYjMzI7
VGhhbmsmIzMyO3lvdS4NCg0KSmlheGluLll1DQoNCg0KDQoNCg0KPC9wcmU+DQo8L3A+PC9ib2R5
PjwvaHRtbD48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiogTUVESUFU
RUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZSAqKioqKioqKioqKioqKioqKioqKg0KVGhlIGluZm9y
bWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0K
YXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2Vk
LCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBs
YXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0
ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwg
cHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcg
aXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5
IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRl
bmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUgDQp0aGF0IHlvdSBoYXZl
IHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIg
DQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFu
ZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMp
IGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRo
aXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_002_558916176.707361832--

