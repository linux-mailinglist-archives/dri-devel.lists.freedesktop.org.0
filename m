Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F6594B59A
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 05:46:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2087710E5B9;
	Thu,  8 Aug 2024 03:46:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Rew22plb";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="YyqRzj7a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAABC10E5B9
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 03:45:58 +0000 (UTC)
X-UUID: b4aa0c8e553811ef87684b57767b52b1-20240808
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=6D/B/BSps54kCzj2sGw1eGtlvBzHSj+gn/8WU2x1NhE=; 
 b=Rew22plbJ/Z0RFHa3Mqp5MFaS0ymjSZDowxhhHay1+XOogpUk+eavXg9xaPZ82rQhe4cywN/NT8xcxn7zA2vHGNs9s5y8yYzRX5xYj2IAOFPTfm6bsd8o2gJjA7u5OwNMgsglXj23BTyvYAwfOK2mrtZJ1Ex4wDacarr7zgOx3M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:ab3f2932-fb27-4796-bed3-03fbf7d03ae4, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6dc6a47, CLOUDID:ea53e73d-6aa5-4057-84d5-0e7d47251781,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b4aa0c8e553811ef87684b57767b52b1-20240808
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 847663998; Thu, 08 Aug 2024 11:45:50 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 8 Aug 2024 11:45:48 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Thu, 8 Aug 2024 11:45:48 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tbLidpJrFPfzYMYjxOPe4m8bizp7fTNiKT/u/PHpkbO54B41QMmYBZLsmlYSZTPlgGc4SJjZhKkims3uvGBLqZG/7jdvKJ8qysY7ELEE3Fl4KFbFLRUH1uBj8jTK39vVjp7PBAaizB1OKnXkElAoj6BuBySGBeGpSmHRNti37Ho0Pxuz6ihbA1V/gOQkJIBX7f+MWvrcGnOjbnYQTojksvBpc06X06+7NIsLgZr1EOVUST1+GWGTLBrqm7FBK4idYypuybyabepcdDQXl99p4lTCLiLo5nUFPSypFnCfUtKkK/JPGhTTVjiX0ucHXu2df3uP5jaDK3HTLdDXJN0qeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IE0Iq/gcawy/th+dIlnSyijMFEilAKXqoxjf6ckrO54=;
 b=ZJuxnobaYtjYIM0kZamHJhKwuSnJe7SmBUuYyCnsFNELoesMJNE36HfYpj00qERTScxMkVBbgZAHK91Sc0MKHptp7NxntOgYQ+blA3IQ3xE651coETWx4mjxHTezfR8x9q3LjObLFm0bAf4+lKxKrMrqAAm1rKGgpdnnwmfE19nj7M1hD33FI0PcjAJN5iq3cWksu4CE1j15jPGIOSKwia2ai5DXBVgASlwlI6LkgRr+0T53Wg/c60nErrPM/U6D8v7azV6RLwJw8aa2qEpaOIH0dV4Yhuw2TYAp8u/KABW2taWCrKFG/OmzNPHAVEdVLVmIAjJlUFXs1goVtpMsVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IE0Iq/gcawy/th+dIlnSyijMFEilAKXqoxjf6ckrO54=;
 b=YyqRzj7am0u7H0wrK8A3Ob2OhcYghb9qn7u2ozbSGeFB0BSuRgw5oSglqb5WEDzmlzCa80pmG2t+qdYTUFHJMvUlW36pXAm+iqTRNc6X8mLXg7OreaTlfo8EQFrUSk98tj3NJB2Ps0xd0vzzB5V3paVmf1FI0om9AsPiT2PprPk=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SI6PR03MB8686.apcprd03.prod.outlook.com (2603:1096:4:24b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.13; Thu, 8 Aug
 2024 03:45:46 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.7828.023; Thu, 8 Aug 2024
 03:45:46 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "sui.jingfeng@linux.dev" <sui.jingfeng@linux.dev>, "wenst@chromium.org"
 <wenst@chromium.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?= <jitao.shi@mediatek.com>,
 "michael@walle.cc" <michael@walle.cc>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "robh@kernel.org" <robh@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>, "kernel@collabora.com"
 <kernel@collabora.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 =?utf-8?B?WXUtY2hhbmcgTGVlICjmnY7nprnnkosp?= <Yu-chang.Lee@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "amergnat@baylibre.com"
 <amergnat@baylibre.com>
Subject: Re: [PATCH v8 1/3] dt-bindings: display: mediatek: Add OF graph
 support for board path
Thread-Topic: [PATCH v8 1/3] dt-bindings: display: mediatek: Add OF graph
 support for board path
Thread-Index: AQHawWjULtrUVY6uy0y5VZzyp9Vfs7IdCA+A
Date: Thu, 8 Aug 2024 03:45:46 +0000
Message-ID: <3e58a224e6323e28c370d460fa72e23b958bcf62.camel@mediatek.com>
References: <20240618101726.110416-1-angelogioacchino.delregno@collabora.com>
 <20240618101726.110416-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240618101726.110416-2-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SI6PR03MB8686:EE_
x-ms-office365-filtering-correlation-id: 3bac15a8-b03e-4368-2d81-08dcb75c962c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|366016|376014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?OHNUa09NWGhKZm5GVmJkVnRCdDB4Y2lpdHE1eCtPZityeE5FSVBjTUlrSTFB?=
 =?utf-8?B?SXhoczJWbWR6MkVQenZXOFM0Zk5HMzFHekUxTTJqcTZMUDF1THNIY0h3ZUl5?=
 =?utf-8?B?Tjh1MWhRdTJmZnRpMUJNQWsxVm5FTG0wL2J1bE0vcG5FWnhocXdVeUd4NGpU?=
 =?utf-8?B?Z1NqQ2dUU29COFliMTFxRWVEVjArWUM5Z0h0d243OW1iTjVYZnpsTG5FMUlv?=
 =?utf-8?B?K0UvZ3hpZ3Jrb0VoajcweVlUOTlBMjg4cFBvV0wyZW12cVpCbFM3N3hxS1hl?=
 =?utf-8?B?eG9qUVlFUUJHVFYrajBDU3BScHRQR05oTXdQUS9xTXFiNTB1OGRFajczTGo3?=
 =?utf-8?B?MDFoYVJvQ2g3Mm1kdlJrMktUbi9ScWs5cDB2emtSazNxRWd2WWwzS2pCNFJL?=
 =?utf-8?B?Wk92MmRtRm05eU95WGNlcDc1Y2l6YzdQRE82QXBXb2hrd0M3dDJrUzRUT3hY?=
 =?utf-8?B?U0RMaDBGNm92K1NTUlpESmtGS1l3NE8xV01oVzV2eVZUWlNFdXRiU2pUVlZQ?=
 =?utf-8?B?aFlLaGp1WjJpZXlBL3RtYjlRamFZTitSWXU5T3lkSStUWVZuQUI1S3VuQkE2?=
 =?utf-8?B?azRuQkdPaDNkQjROaHgvZDhiVTgwZXMxQWkzSXNOZFJ2SXp3N3h5cWdwcmZa?=
 =?utf-8?B?MXVvZXNLNE1kWHVZRzAreUg2cThGSjY0YXVxWENrWmsrV2FDVTM5VGhNTnlS?=
 =?utf-8?B?VzlncWtUekdKNzZzSDRQMlgvQXFwTmFQTGJjTTFUVEJsSU1OUVRVQkZmOGUw?=
 =?utf-8?B?QlhTVjlJVTQrOWg0NWhheWxkSURobE1TM283UzJrdkhJSE5oWFViaHJOOG1Y?=
 =?utf-8?B?N05oTnZBNGY3em5DeHdEY3c5TktOdjliZkp3ZUxTZmVJYWVTdmc4N0VSZVJC?=
 =?utf-8?B?YUY4ZlFGb284aGdwMjl4YUowVXQvVGpZSkdteGM5TER4dUllbmNnckR4czE0?=
 =?utf-8?B?ZFpLQVpVRzNTRzVPeHhpSTJpNnJPbWN4cmU0TTl2bnJqb2I0Rk9aMnkvVkY1?=
 =?utf-8?B?RllGT08zUytFQXNEM3U5Y1NiN1AvOEVCSGhVQThOcUN0eFp2cmNKWk9rcDhS?=
 =?utf-8?B?YVd2RWF3LzIzL3hxTS83aUo4VEpCNVNHdWc2SlJFTEVIaTdhOVBGSWlneCtJ?=
 =?utf-8?B?UzdqQlNocXo0WGc5QTk3eHVFc24zNGJXZDhLSnVLamFCSWpWWXdXd2xKeDBG?=
 =?utf-8?B?R05reXpya2FjNGNnZExGdlIwNVlVTGJuQmRWa0N5SEJZenowLyt2MG1DdXhR?=
 =?utf-8?B?cjczaC9oWG9IbXNTZEU1K3ltUktLbEVGMjMyM0ZFcytqK003Wi9aVm94bWV0?=
 =?utf-8?B?UmxMQzNlclc5Njh1RVEyaVc4ZHY1dGp1b3VvdkVqTjdQeFVwWlZ6Y29tT3Rq?=
 =?utf-8?B?bHBxTEh4a3JmQXNQVUNwYldFYXBtUkhIOHg0N1M0M01RVXVjL0cxalY5VW5R?=
 =?utf-8?B?Z3Z5SU9HTkVjVjNrZ0RXUmxBZ0V2WW5XcU5iUU1mZW9UaHVNTGVqNVZYb0tV?=
 =?utf-8?B?UjZoMTlsTldiT2h6MGd2d2NybXVlRnZaNkFrdmhzS1RCbFlzcjJnZ1lIeVVW?=
 =?utf-8?B?UWhBdUhDVkJwbUJtVURqNWlLUUJjdXVIYWNZMnZrZ0JUTkNmWHQ3b2o3MXY4?=
 =?utf-8?B?UFhUTmMxSzhCZ0FpZ2o4Rld1NWl3elQ5c2pWRFNtOTdiWEMyc1ZQbmFHU21R?=
 =?utf-8?B?SDROZ3RrRUlTWVE4eEY1WUNNVTFMeTYrNjcxaEV6SS9yRmZadEZaZkhDdUtL?=
 =?utf-8?B?OWJySUowVVpmdEtENUloc25sZE94WWU0dGg3Q1hoNHNJMjIwUjhKNFZZSFlo?=
 =?utf-8?B?bFRjbkpUa0cvL3ZDUUZFL1p6WXYwc2pVWk5vNnE3T3A5Z2taSjUwT1JTSXMx?=
 =?utf-8?B?cGFFcnRGUVE3RWJna0JObkpaRTNaRjBwbUlXOE9uU1pSaHc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M3ZjTTI0M3M5SGNmNmwxdDFvb00yaGF3WVZ6OW5SUlJjOWpxaTgwMTJaRis0?=
 =?utf-8?B?bzZ5dDN2cnlsa1lONWZaakNLMnNYQ1RvYVpTeGdZMWZyYkFMdEYxTGloQ1JF?=
 =?utf-8?B?VmEzN3dEa2hLSGwybE9hZVluUG1jN2V1b0I3REZ1NVhJVmcwYzhZUFNPcTJx?=
 =?utf-8?B?VUNuUTVCdzk0U0J5TVJFd1ZYUFcyMGdCQURNRHJHSTE3R3JNMm4rUGUyT1hv?=
 =?utf-8?B?a3cwL2wxVzlMdGU2azVQY0h1MDIxaVpUdFlORUplMk5PVzcxeHA2cVVxaDFM?=
 =?utf-8?B?cGthOVhLbVNTc1FEd213WWNKSzliczRSczNNL2dZdU83dDdReUtlTWxvZlVS?=
 =?utf-8?B?TUhtMVl2SjdZdVd1TmF4dG80dEpMaTdaZWZ6T1hZd3JyMHV2cHR5TFJNOG12?=
 =?utf-8?B?ckVGemJyTmt4Q2RDeWdRTHFsc0JVZTBMZzR5NHozMmZzVEM0OFpiR0Ztdmcy?=
 =?utf-8?B?TEQzelFXMUNsUGt2TEpyR0Y1cXBUZ3dMVktqR3BoV0tseWpDUW43enNReGt6?=
 =?utf-8?B?bEpLVmVaYm5jLzU2aVpQK0ZUcGRqVElwWmVUNzVYZFY2SCtYZDBjeTEycVVl?=
 =?utf-8?B?ZGRjaGNmeG1pZ1lxUlVRRW5pcmJCQlExLzNrNW45eGNrcHFOVFprNjA2RDRn?=
 =?utf-8?B?WmRydjJ4NGQ1OXlkZm5QWlV5QkdkTGRFYURpM09HNE1mY1EvZ1gwNW53SWhS?=
 =?utf-8?B?Qnh5STZlcDZ6MTZqQWRzWWRjVWlHRHlLUWZpS3JYdmRWdmZ3RU9JVVpzTXN0?=
 =?utf-8?B?VkRNTkFYUm9oRmk3Wjd1QkprUTdUVUJlU1pFaHcyQ1dqczlaQW9WMGRFdXhn?=
 =?utf-8?B?c1FjZzR1cWFsZkJDMnRJQlR1b3k4VXJsVHkycHJIbUhhNzRLK0pzMG1qME85?=
 =?utf-8?B?TjQybkF1S3dXUW8rdENjdzhEbUpIaXNqakg0Z0lia0c5blcvNk5BWnFCZFA0?=
 =?utf-8?B?TlhCeEpKZCs1aDhUZ0NhWGNwdWgrMCtuVWtRWUZ1SVdnWE1SekY0UnBlN1hy?=
 =?utf-8?B?TEo1TExuV1hOOWQ4NjFJZHd4TE5KN1g3YndJbjJWQVBzcUdpL0ozdHFUcHdw?=
 =?utf-8?B?eXgrV1VCSW5tWHBGZE1vWmtBalhPRStlMjdxUXhoUzJoaVVLbEJvTWwwb2l5?=
 =?utf-8?B?d1o1U0d4eE90cXlBR0R5SXhLNEtYTkcva1RLRzAvcHViTFNhbXp1NHNXcGFL?=
 =?utf-8?B?RlpXOWlSVGZxWW1wdlJMQktvTm5LT3FRa0p5ZktvQ2tDRVJ0SStiSzI1bXZr?=
 =?utf-8?B?L3lVMGNVb1lNRDgwOTVoN3hnam1SRkF6OTRTeVNJVlhNb3czdEpURmlUbEhr?=
 =?utf-8?B?cWhDUktZVEoyRFNMM1FycktadlJEZlp5NmtpL2JENUZ4Smh6T2ZrS2NkcENB?=
 =?utf-8?B?b3p3YlUvbFR6R044bnpXSERLRXJvNUhGNmtQUk0yTzJST2pOeENDVUFGVjZn?=
 =?utf-8?B?WldjUC8reWtPUEp6NjRIajM2dDloVVlEcVZsRndQNlhMZlFIRGU2OGNHd2xD?=
 =?utf-8?B?OVNRSFdvNmJBTzBrRkU0dUY1SGJ1RXAxK3RzQm5Nanp5SmF0VEhVMm1aanNj?=
 =?utf-8?B?eGpzYm91Ymw0ZUIyS1N5YUk4UFphUDd6cWRta1RiS01iQ1lvbGZSNUhXb2d2?=
 =?utf-8?B?ZXFsUCt6WW5RL2thTzZkVHdTalcyOGVmM1dyY1JPTUcyWkxoQzVLTWhMVVRy?=
 =?utf-8?B?dEhsU1kyRVI4b1ZFNTg4SXdLR0FRMjdMcFRHendVMUNyS0l0L2xRK01yRW9s?=
 =?utf-8?B?S2RIb1NxWmRnY3ljZFhha0tpdWQrYkswUk9qbDZNWHpFc1ZFSHNMbTl4ZFk0?=
 =?utf-8?B?NERxWWtvQXBTczVRUzRZL0dTL3JnbUp5SEhRVmpDWDhoQ2twWjRad1Y5Ym44?=
 =?utf-8?B?d1o3Q0VBbFR2Nk1OWXVEenRDOXdBNTRaN1djUkF1QW9qSzd5TFVBUzUzRG9G?=
 =?utf-8?B?Q1pkZUp2bFdTeUgyTitva1VKRHpzRVp2TnB6K01QaW9ZSmNpM0RCdGQ4VVRI?=
 =?utf-8?B?ZXNWRnFvQmpRTVluOENsUzJGejNwNW52MyswaVB3eVBaVFJuYXk3bFNVU21k?=
 =?utf-8?B?SVZaKzYyS3hVWE1vOW5lUG83UVdsZnkvcENUQnZwVlJrYzcvOUhPWkdiWGpQ?=
 =?utf-8?Q?OfFjSj97GY9oNCq1iM5PAlOXv?=
Content-ID: <0E8918FA4156C24E8C306354C616D87F@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bac15a8-b03e-4368-2d81-08dcb75c962c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2024 03:45:46.3875 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3SpGk1PZ29UNUArHN646WXRaKssdKMwvRZi9GvH4DYfXlmfzLJKoPTEzwPGt5PJV3Wjc7S+j7yVqKcoYdaEpRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI6PR03MB8686
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--8.776700-8.000000
X-TMASE-MatchedRID: oTBA/+sdKaYNtKv7cnNXnSa1MaKuob8PC/ExpXrHizyPaLJ/Ca3ST4GT
 VkkPip/KE1tQkshZ9Vl5hD87adIXFTEV1fJb8/5d22QSll0Gqg3UqhJbkmLVezhgoAzehG32SAK
 UIhfaB7BwoX9mlif33h9K6LGpAwss1Lt7MpzUCiRVTfJWlqPdDFsChor7BLiN2viB/Jr4D1S1QY
 NwWHqTDAFrmwEN0Uo0A8Xz/sPdZR6ZdH+xzatcBJ4CIKY/Hg3AwWulRtvvYxTUHQeTVDUrItRnE
 QCUU+jzjoczmuoPCq1og+wraeJpj04G8QsFBOqJhsidtag//D/sc7NMUSK0cF47FWCCEZB4vsu/
 v77ZWuV5dK9rhfAjRWvnpYBsspzBjqo8hT2fvI9zloxQudlFT/XnUyc3kkvb4uuYo4M+pOhghix
 YhrO7v4iiSiO3Fb3zlExlQIQeRG0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--8.776700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 91A64FF191189FDF52898F1D7894B284321551B9EB4A4E6E146C936016CBCA232000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_008_838279401.1940769980"
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

--__=_Part_Boundary_008_838279401.1940769980
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEFuZ2VsbzoNCg0KT24gVHVlLCAyMDI0LTA2LTE4IGF0IDEyOjE3ICswMjAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gVGhlIGRpc3BsYXkgSVBzIGluIE1lZGlhVGVr
IFNvQ3Mgc3VwcG9ydCBiZWluZyBpbnRlcmNvbm5lY3RlZCB3aXRoDQo+IGRpZmZlcmVudCBpbnN0
YW5jZXMgb2YgRERQIElQcyAoZm9yIGV4YW1wbGUsIG1lcmdlMCBvciBtZXJnZTEpIGFuZC9vcg0K
PiB3aXRoIGRpZmZlcmVudCBERFAgSVBzIChmb3IgZXhhbXBsZSwgcmRtYSBjYW4gYmUgY29ubmVj
dGVkIHdpdGggZWl0aGVyDQo+IGNvbG9yLCBkcGksIGRzaSwgbWVyZ2UsIGV0YyksIGZvcm1pbmcg
YSBmdWxsIERpc3BsYXkgRGF0YSBQYXRoIHRoYXQNCj4gZW5kcyB3aXRoIGFuIGFjdHVhbCBkaXNw
bGF5Lg0KPiANCj4gVGhlIGZpbmFsIGRpc3BsYXkgcGlwZWxpbmUgaXMgZWZmZWN0aXZlbHkgYm9h
cmQgc3BlY2lmaWMsIGFzIGl0IGRvZXMNCj4gZGVwZW5kIG9uIHRoZSBkaXNwbGF5IHRoYXQgaXMg
YXR0YWNoZWQgdG8gaXQsIGFuZCBldmVudHVhbGx5IG9uIHRoZQ0KPiBzZW5zb3JzIHN1cHBvcnRl
ZCBieSB0aGUgYm9hcmQgKGZvciBleGFtcGxlLCBBZGFwdGl2ZSBBbWJpZW50IExpZ2h0DQo+IHdv
dWxkIG5lZWQgYW4gQW1iaWVudCBMaWdodCBTZW5zb3IsIG90aGVyd2lzZSBpdCdzIHBvaW50bGVz
cyEpLCBvdGhlcg0KPiB0aGFuIHRoZSBvdXRwdXQgdHlwZS4NCj4gDQo+IEFkZCBzdXBwb3J0IGZv
ciBPRiBncmFwaHMgdG8gbW9zdCBvZiB0aGUgTWVkaWFUZWsgRERQIChkaXNwbGF5KSBiaW5kaW5n
cw0KPiB0byBhZGQgZmxleGliaWxpdHkgdG8gYnVpbGQgY3VzdG9tIGhhcmR3YXJlIHBhdGhzLCBo
ZW5jZSBlbmFibGluZyBib2FyZA0KPiBzcGVjaWZpYyBjb25maWd1cmF0aW9uIG9mIHRoZSBkaXNw
bGF5IHBpcGVsaW5lIGFuZCBhbGxvd2luZyB0byBmaW5hbGx5DQo+IG1pZ3JhdGUgYXdheSBmcm9t
IHVzaW5nIGhhcmRjb2RlZCBwYXRocy4NCj4gDQo+IFJldmlld2VkLWJ5OiBSb2IgSGVycmluZyAo
QXJtKSA8cm9iaEBrZXJuZWwub3JnPg0KPiBSZXZpZXdlZC1ieTogQWxleGFuZHJlIE1lcmduYXQg
PGFtZXJnbmF0QGJheWxpYnJlLmNvbT4NCj4gVGVzdGVkLWJ5OiBBbGV4YW5kcmUgTWVyZ25hdCA8
YW1lcmduYXRAYmF5bGlicmUuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBBbmdlbG9HaW9hY2NoaW5v
IERlbCBSZWdubyA8YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPg0KPiAt
LS0NCg0KW3NuaXBdDQoNCj4gIA0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZXRoZHIueWFtbCBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGV0
aGRyLnlhbWwNCj4gaW5kZXggNjc3ODgyMzQ4ZWRlLi45OGRiNDc4OTRlZWIgMTAwNjQ0DQo+IC0t
LSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21l
ZGlhdGVrLGV0aGRyLnlhbWwNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZXRoZHIueWFtbA0KPiBAQCAtMTEwLDYgKzEx
MCwyOCBAQCBwcm9wZXJ0aWVzOg0KPiAgICAgICAgaW5jbHVkZS9kdC1iaW5kaW5ncy9nY2UvPGNo
aXA+LWdjZS5oLCBtYXBwaW5nIHRvIHRoZSByZWdpc3RlciBvZiBkaXNwbGF5DQo+ICAgICAgICBm
dW5jdGlvbiBibG9jay4NCj4gIA0KPiArICBwb3J0czoNCj4gKyAgICAkcmVmOiAvc2NoZW1hcy9n
cmFwaC55YW1sIy9wcm9wZXJ0aWVzL3BvcnRzDQo+ICsgICAgZGVzY3JpcHRpb246DQo+ICsgICAg
ICBJbnB1dCBhbmQgb3V0cHV0IHBvcnRzIGNhbiBoYXZlIG11bHRpcGxlIGVuZHBvaW50cywgZWFj
aCBvZiB0aG9zZQ0KPiArICAgICAgY29ubmVjdHMgdG8gZWl0aGVyIHRoZSBwcmltYXJ5LCBzZWNv
bmRhcnksIGV0YywgZGlzcGxheSBwaXBlbGluZS4NCj4gKw0KPiArICAgIHByb3BlcnRpZXM6DQo+
ICsgICAgICBwb3J0QDA6DQo+ICsgICAgICAgICRyZWY6IC9zY2hlbWFzL2dyYXBoLnlhbWwjL3By
b3BlcnRpZXMvcG9ydA0KPiArICAgICAgICBkZXNjcmlwdGlvbjogRVRIRFIgaW5wdXQsIHVzdWFs
bHkgZnJvbSBvbmUgb2YgdGhlIE1FUkdFIGJsb2Nrcy4NCg0KU29ycnksIEkgZmluZCBvbmUgcXVl
c3Rpb24gbm93Lg0KSSB0aGluayBFVEhEUiBtYXkgaGF2ZSBtdWx0aXBsZSBpbnB1dCwgYW5kIEVU
SERSIHJlY2VpdmUgZGF0YSBmcm9tIGFsbCBpbnB1dCBhdCB0aGUgc2FtZSB0aW1lLg0KV2h5IGhl
cmUgaGFzIG9ubHkgb25lIGlucHV0IHBvcnQ/DQoNCk1FUkdFIC0tPistLS0tLS0tLS0tLS0tLS0t
LSsNCiAgICAgICAgIHwgICAgICAgICAgICAgICAgIHwNCk1FUkdFIC0tPnwgICAgICAgICAgICAg
ICAgIHwNCiAgICAgICAgIHwgICAgICBFVEhEUiAgICAgIHwNCk1FUkdFIC0tPnwgICAgICAgICAg
ICAgICAgIHwNCiAgICAgICAgIHwgICAgICAgICAgICAgICAgIHwNCk1FUkdFIC0tPistLS0tLS0t
LS0tLS0tLS0tLSsNCg0KUmVnYXJkcywNCkNLDQoNCj4gKw0KPiArICAgICAgcG9ydEAxOg0KPiAr
ICAgICAgICAkcmVmOiAvc2NoZW1hcy9ncmFwaC55YW1sIy9wcm9wZXJ0aWVzL3BvcnQNCj4gKyAg
ICAgICAgZGVzY3JpcHRpb246DQo+ICsgICAgICAgICAgRVRIRFIgb3V0cHV0IHRvIHRoZSBpbnB1
dCBvZiB0aGUgbmV4dCBkZXNpcmVkIGNvbXBvbmVudCBpbiB0aGUNCj4gKyAgICAgICAgICBkaXNw
bGF5IHBpcGVsaW5lLCBmb3IgZXhhbXBsZSBvbmUgb2YgdGhlIGF2YWlsYWJsZSBNRVJHRSBibG9j
a3MsDQo+ICsgICAgICAgICAgb3Igb3RoZXJzLg0KPiArDQo+ICsgICAgcmVxdWlyZWQ6DQo+ICsg
ICAgICAtIHBvcnRAMA0KPiArICAgICAgLSBwb3J0QDENCj4gKw0KPiAgcmVxdWlyZWQ6DQo+ICAg
IC0gY29tcGF0aWJsZQ0KPiAgICAtIHJlZw0KPiANCg==

--__=_Part_Boundary_008_838279401.1940769980
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtBbmdlbG86DQoNCk9uJiMzMjtUdWUsJiMz
MjsyMDI0LTA2LTE4JiMzMjthdCYjMzI7MTI6MTcmIzMyOyswMjAwLCYjMzI7QW5nZWxvR2lvYWNj
aGlubyYjMzI7RGVsJiMzMjtSZWdubyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtUaGUmIzMyO2Rpc3Bs
YXkmIzMyO0lQcyYjMzI7aW4mIzMyO01lZGlhVGVrJiMzMjtTb0NzJiMzMjtzdXBwb3J0JiMzMjti
ZWluZyYjMzI7aW50ZXJjb25uZWN0ZWQmIzMyO3dpdGgNCiZndDsmIzMyO2RpZmZlcmVudCYjMzI7
aW5zdGFuY2VzJiMzMjtvZiYjMzI7RERQJiMzMjtJUHMmIzMyOyhmb3ImIzMyO2V4YW1wbGUsJiMz
MjttZXJnZTAmIzMyO29yJiMzMjttZXJnZTEpJiMzMjthbmQvb3INCiZndDsmIzMyO3dpdGgmIzMy
O2RpZmZlcmVudCYjMzI7RERQJiMzMjtJUHMmIzMyOyhmb3ImIzMyO2V4YW1wbGUsJiMzMjtyZG1h
JiMzMjtjYW4mIzMyO2JlJiMzMjtjb25uZWN0ZWQmIzMyO3dpdGgmIzMyO2VpdGhlcg0KJmd0OyYj
MzI7Y29sb3IsJiMzMjtkcGksJiMzMjtkc2ksJiMzMjttZXJnZSwmIzMyO2V0YyksJiMzMjtmb3Jt
aW5nJiMzMjthJiMzMjtmdWxsJiMzMjtEaXNwbGF5JiMzMjtEYXRhJiMzMjtQYXRoJiMzMjt0aGF0
DQomZ3Q7JiMzMjtlbmRzJiMzMjt3aXRoJiMzMjthbiYjMzI7YWN0dWFsJiMzMjtkaXNwbGF5Lg0K
Jmd0OyYjMzI7DQomZ3Q7JiMzMjtUaGUmIzMyO2ZpbmFsJiMzMjtkaXNwbGF5JiMzMjtwaXBlbGlu
ZSYjMzI7aXMmIzMyO2VmZmVjdGl2ZWx5JiMzMjtib2FyZCYjMzI7c3BlY2lmaWMsJiMzMjthcyYj
MzI7aXQmIzMyO2RvZXMNCiZndDsmIzMyO2RlcGVuZCYjMzI7b24mIzMyO3RoZSYjMzI7ZGlzcGxh
eSYjMzI7dGhhdCYjMzI7aXMmIzMyO2F0dGFjaGVkJiMzMjt0byYjMzI7aXQsJiMzMjthbmQmIzMy
O2V2ZW50dWFsbHkmIzMyO29uJiMzMjt0aGUNCiZndDsmIzMyO3NlbnNvcnMmIzMyO3N1cHBvcnRl
ZCYjMzI7YnkmIzMyO3RoZSYjMzI7Ym9hcmQmIzMyOyhmb3ImIzMyO2V4YW1wbGUsJiMzMjtBZGFw
dGl2ZSYjMzI7QW1iaWVudCYjMzI7TGlnaHQNCiZndDsmIzMyO3dvdWxkJiMzMjtuZWVkJiMzMjth
biYjMzI7QW1iaWVudCYjMzI7TGlnaHQmIzMyO1NlbnNvciwmIzMyO290aGVyd2lzZSYjMzI7aXQm
IzM5O3MmIzMyO3BvaW50bGVzcyEpLCYjMzI7b3RoZXINCiZndDsmIzMyO3RoYW4mIzMyO3RoZSYj
MzI7b3V0cHV0JiMzMjt0eXBlLg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtBZGQmIzMyO3N1cHBvcnQm
IzMyO2ZvciYjMzI7T0YmIzMyO2dyYXBocyYjMzI7dG8mIzMyO21vc3QmIzMyO29mJiMzMjt0aGUm
IzMyO01lZGlhVGVrJiMzMjtERFAmIzMyOyhkaXNwbGF5KSYjMzI7YmluZGluZ3MNCiZndDsmIzMy
O3RvJiMzMjthZGQmIzMyO2ZsZXhpYmlsaXR5JiMzMjt0byYjMzI7YnVpbGQmIzMyO2N1c3RvbSYj
MzI7aGFyZHdhcmUmIzMyO3BhdGhzLCYjMzI7aGVuY2UmIzMyO2VuYWJsaW5nJiMzMjtib2FyZA0K
Jmd0OyYjMzI7c3BlY2lmaWMmIzMyO2NvbmZpZ3VyYXRpb24mIzMyO29mJiMzMjt0aGUmIzMyO2Rp
c3BsYXkmIzMyO3BpcGVsaW5lJiMzMjthbmQmIzMyO2FsbG93aW5nJiMzMjt0byYjMzI7ZmluYWxs
eQ0KJmd0OyYjMzI7bWlncmF0ZSYjMzI7YXdheSYjMzI7ZnJvbSYjMzI7dXNpbmcmIzMyO2hhcmRj
b2RlZCYjMzI7cGF0aHMuDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1Jldmlld2VkLWJ5OiYjMzI7Um9i
JiMzMjtIZXJyaW5nJiMzMjsoQXJtKSYjMzI7Jmx0O3JvYmhAa2VybmVsLm9yZyZndDsNCiZndDsm
IzMyO1Jldmlld2VkLWJ5OiYjMzI7QWxleGFuZHJlJiMzMjtNZXJnbmF0JiMzMjsmbHQ7YW1lcmdu
YXRAYmF5bGlicmUuY29tJmd0Ow0KJmd0OyYjMzI7VGVzdGVkLWJ5OiYjMzI7QWxleGFuZHJlJiMz
MjtNZXJnbmF0JiMzMjsmbHQ7YW1lcmduYXRAYmF5bGlicmUuY29tJmd0Ow0KJmd0OyYjMzI7U2ln
bmVkLW9mZi1ieTomIzMyO0FuZ2Vsb0dpb2FjY2hpbm8mIzMyO0RlbCYjMzI7UmVnbm8mIzMyOyZs
dDthbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20mZ3Q7DQomZ3Q7JiMzMjst
LS0NCg0KW3NuaXBdDQoNCiZndDsmIzMyOyYjMzI7DQomZ3Q7JiMzMjtkaWZmJiMzMjstLWdpdCYj
MzI7YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9t
ZWRpYXRlayxldGhkci55YW1sJiMzMjtiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGV0aGRyLnlhbWwNCiZndDsmIzMyO2luZGV4JiMz
Mjs2Nzc4ODIzNDhlZGUuLjk4ZGI0Nzg5NGVlYiYjMzI7MTAwNjQ0DQomZ3Q7JiMzMjstLS0mIzMy
O2EvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVk
aWF0ZWssZXRoZHIueWFtbA0KJmd0OyYjMzI7KysrJiMzMjtiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGV0aGRyLnlhbWwNCiZndDsm
IzMyO0BAJiMzMjstMTEwLDYmIzMyOysxMTAsMjgmIzMyO0BAJiMzMjtwcm9wZXJ0aWVzOg0KJmd0
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtpbmNsdWRlL2R0LWJpbmRp
bmdzL2djZS8mbHQ7Y2hpcCZndDstZ2NlLmgsJiMzMjttYXBwaW5nJiMzMjt0byYjMzI7dGhlJiMz
MjtyZWdpc3RlciYjMzI7b2YmIzMyO2Rpc3BsYXkNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7ZnVuY3Rpb24mIzMyO2Jsb2NrLg0KJmd0OyYjMzI7JiMzMjsNCiZn
dDsmIzMyOysmIzMyOyYjMzI7cG9ydHM6DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzM2O3JlZjomIzMyOy9zY2hlbWFzL2dyYXBoLnlhbWwjL3Byb3BlcnRpZXMvcG9ydHMNCiZndDsm
IzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyO2Rlc2NyaXB0aW9uOg0KJmd0OyYjMzI7KyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyO0lucHV0JiMzMjthbmQmIzMyO291dHB1dCYjMzI7cG9ydHMm
IzMyO2NhbiYjMzI7aGF2ZSYjMzI7bXVsdGlwbGUmIzMyO2VuZHBvaW50cywmIzMyO2VhY2gmIzMy
O29mJiMzMjt0aG9zZQ0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO2Nv
bm5lY3RzJiMzMjt0byYjMzI7ZWl0aGVyJiMzMjt0aGUmIzMyO3ByaW1hcnksJiMzMjtzZWNvbmRh
cnksJiMzMjtldGMsJiMzMjtkaXNwbGF5JiMzMjtwaXBlbGluZS4NCiZndDsmIzMyOysNCiZndDsm
IzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyO3Byb3BlcnRpZXM6DQomZ3Q7JiMzMjsrJiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7cG9ydEAwOg0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzM2O3JlZjomIzMyOy9zY2hlbWFzL2dyYXBoLnlhbWwj
L3Byb3BlcnRpZXMvcG9ydA0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjtkZXNjcmlwdGlvbjomIzMyO0VUSERSJiMzMjtpbnB1dCwmIzMyO3VzdWFsbHkm
IzMyO2Zyb20mIzMyO29uZSYjMzI7b2YmIzMyO3RoZSYjMzI7TUVSR0UmIzMyO2Jsb2Nrcy4NCg0K
U29ycnksJiMzMjtJJiMzMjtmaW5kJiMzMjtvbmUmIzMyO3F1ZXN0aW9uJiMzMjtub3cuDQpJJiMz
Mjt0aGluayYjMzI7RVRIRFImIzMyO21heSYjMzI7aGF2ZSYjMzI7bXVsdGlwbGUmIzMyO2lucHV0
LCYjMzI7YW5kJiMzMjtFVEhEUiYjMzI7cmVjZWl2ZSYjMzI7ZGF0YSYjMzI7ZnJvbSYjMzI7YWxs
JiMzMjtpbnB1dCYjMzI7YXQmIzMyO3RoZSYjMzI7c2FtZSYjMzI7dGltZS4NCldoeSYjMzI7aGVy
ZSYjMzI7aGFzJiMzMjtvbmx5JiMzMjtvbmUmIzMyO2lucHV0JiMzMjtwb3J0JiM2MzsNCg0KTUVS
R0UmIzMyOy0tJmd0OystLS0tLS0tLS0tLS0tLS0tLSsNCiYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyO3wmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7fA0KTUVS
R0UmIzMyOy0tJmd0O3wmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7fA0KJiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7fCYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyO0VUSERSJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7fA0KTUVSR0UmIzMyOy0t
Jmd0O3wmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7fA0KJiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7fCYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjt8DQpN
RVJHRSYjMzI7LS0mZ3Q7Ky0tLS0tLS0tLS0tLS0tLS0tKw0KDQpSZWdhcmRzLA0KQ0sNCg0KJmd0
OyYjMzI7Kw0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3BvcnRAMToN
CiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzNjty
ZWY6JiMzMjsvc2NoZW1hcy9ncmFwaC55YW1sIy9wcm9wZXJ0aWVzL3BvcnQNCiZndDsmIzMyOysm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7ZGVzY3JpcHRpb246DQomZ3Q7
JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtF
VEhEUiYjMzI7b3V0cHV0JiMzMjt0byYjMzI7dGhlJiMzMjtpbnB1dCYjMzI7b2YmIzMyO3RoZSYj
MzI7bmV4dCYjMzI7ZGVzaXJlZCYjMzI7Y29tcG9uZW50JiMzMjtpbiYjMzI7dGhlDQomZ3Q7JiMz
MjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtkaXNw
bGF5JiMzMjtwaXBlbGluZSwmIzMyO2ZvciYjMzI7ZXhhbXBsZSYjMzI7b25lJiMzMjtvZiYjMzI7
dGhlJiMzMjthdmFpbGFibGUmIzMyO01FUkdFJiMzMjtibG9ja3MsDQomZ3Q7JiMzMjsrJiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtvciYjMzI7b3RoZXJz
Lg0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7cmVxdWlyZWQ6DQom
Z3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7LSYjMzI7cG9ydEAwDQomZ3Q7
JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7LSYjMzI7cG9ydEAxDQomZ3Q7JiMz
MjsrDQomZ3Q7JiMzMjsmIzMyO3JlcXVpcmVkOg0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7LSYj
MzI7Y29tcGF0aWJsZQ0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7LSYjMzI7cmVnDQomZ3Q7JiMz
MjsNCg0KPC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48
cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZSAqKioqKioq
KioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBt
ZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRpYWws
IHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Ns
b3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZl
eWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1p
bmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9m
IHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQg
cmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVs
LiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9y
IGJlbGlldmUgDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBw
bGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhp
cyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwgKGlu
Y2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRp
c2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRo
YW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_008_838279401.1940769980--

