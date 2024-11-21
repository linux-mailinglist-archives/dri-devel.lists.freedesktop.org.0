Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8219D4B12
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 11:51:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFAA310E0FB;
	Thu, 21 Nov 2024 10:51:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="I7SoOPPK";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="S0Rqlrf/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35FFD10E0FB
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 10:51:29 +0000 (UTC)
X-UUID: 8d4afee4a7f611ef99858b75a2457dd9-20241121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=YqcljOc5KTUzB9ekm5F1Sv+rsX6NyDb+CztVx2H3swA=; 
 b=I7SoOPPKrvC7SwI7KxTWtnCfy1IX5rgYstOcl9Z3oDpN3UQ7WTcZLP2YF78tQrv9M3nXo1rcW274/qSdQDqMBG0KTcEdTOWbS7jRw7b4WFS5SaE1MybNr6zsz7vuRlFE5MbkmnNgp5+c7R/RPEu2MfQF0RlJ5gEEHnOAUpu23nw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44, REQID:5d0a3529-c097-4952-ab5c-fa6361b3a91d, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:464815b, CLOUDID:c6c394a0-f395-4dfc-8188-ce2682df7fd8,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
 :-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
 A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 8d4afee4a7f611ef99858b75a2457dd9-20241121
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 883562717; Thu, 21 Nov 2024 18:51:24 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 21 Nov 2024 18:51:23 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 21 Nov 2024 18:51:23 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B5PMsWlbGWdC82cHsDb+HxNQ9/TD76osEj5ZNtxpDijuWUid+T5JbYxzB3cWbYLWeX+cweO8eiCpcqLuOvTNuqzzsrQW14QfdpOuaNyoJknTRBqpRbZF/6PP/DI5nNPTMAv5NgJjBJ2s9PFIwUFBJlzu0iYeGJxLFOvSuMe/MB7XgSpx8fBXTu9TDShntXp4ZM0/YyLSbsLLKEY/D3PpXaScTJY7LRq4flst2uHAqzw7NzExATdZb14imP6Ca9ddob/MNWGPG+c/WQhHIHFgjfPu/BPkmegepkIYb+TxegIzBsq3Sw5JmaSG68EKl3ROu8QowGQ89WEnMDSgNy4n4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BH3OefbcRv4Pzg9UBRTH1h99dGJNLVeeswC6yD1i63o=;
 b=k6VnmVf4mTM1mp7ZvL8a78fIo5DVCeKE1eWzkLZLjxKTxhUeszdGfGpd5gFX0P6K71XTB8S6u0wNWY1RGSX4D2V/AReKVS+vpXO4ooVQunftyeojrszF3BsyFYlLKbTehPV9jGMeQCHwIwiEWrvzukOPGlZqbdXgL/ZXJyfK375VlF/bWMH/AZONE46HPdBGrmFnyI+fYCVmNlOaioDtB789cp7LXStLckSNkgmi5lb61bHf7x/ohxBDqlSi19DcR25YALw2m7h0m+4OmDoYOGJ7qGSnUq94QBIus1HIgWpE1TUmRLInpibJdwaiTm1zcsxuFc9ueYtzNOCXUobSAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BH3OefbcRv4Pzg9UBRTH1h99dGJNLVeeswC6yD1i63o=;
 b=S0Rqlrf/4LHtmT6Eyg7zgsRWHtMJn+YPFjJMBHc/yi8AEXWpR0xBtiGwvs+NTRv9klzsUPuLAjq+2dchNXouvs71OxXcT4qhz32pPt1O2JJbLLKbuxK3WgwRHyTiSo0ALZOP6RqCy8LLsxJ7V/Qhi6M6u+7f+E6CCwk+Xl83Aqw=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by TYSPR03MB8632.apcprd03.prod.outlook.com (2603:1096:405:90::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.16; Thu, 21 Nov
 2024 10:51:21 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%4]) with mapi id 15.20.8158.023; Thu, 21 Nov 2024
 10:51:20 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "krzk@kernel.org" <krzk@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "mchehab@kernel.org" <mchehab@kernel.org>,
 =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "robh@kernel.org" <robh@kernel.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "jassisinghbrar@gmail.com"
 <jassisinghbrar@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 1/8] dt-bindings: mailbox: mediatek: Add GCE header file
 for MT8196
Thread-Topic: [PATCH 1/8] dt-bindings: mailbox: mediatek: Add GCE header file
 for MT8196
Thread-Index: AQHbO82lXfQ9WGC6IkSEu7UkQxO3QLLBaw8AgAAj7YA=
Date: Thu, 21 Nov 2024 10:51:20 +0000
Message-ID: <40971559285bb60cbab476135ba81d364505113c.camel@mediatek.com>
References: <20241121042602.32730-1-jason-jh.lin@mediatek.com>
 <20241121042602.32730-2-jason-jh.lin@mediatek.com>
 <57kqls2wa67nh4a5yyr4amthmro3bjvrhnrdbdolrhr2lnmf6u@2h3cbl4jip4y>
In-Reply-To: <57kqls2wa67nh4a5yyr4amthmro3bjvrhnrdbdolrhr2lnmf6u@2h3cbl4jip4y>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|TYSPR03MB8632:EE_
x-ms-office365-filtering-correlation-id: 183d366d-78fb-41bb-91b9-08dd0a1a6f28
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?RnlsS2lObEVuaHVqbFpNL3VkRkxKQlVZWU0zTE9FaWtVT3B4RHJlWnBUL043?=
 =?utf-8?B?SkRIeXRBMmFkcmtObVhFVUFVdXh4ZHZHclNaTkw3SlhSZktDcEZCVDRUeHkz?=
 =?utf-8?B?ekRIa0p1akRKV1kyOWxRRXZZRUtNcjZkQkRYZndDazVmZ3dMMm1PcXBrWEJ3?=
 =?utf-8?B?dUVLb3kxaEw3VS9vYTgrRmVlNWRTOEZSVWh3UEl1QkNDMjJNbXppZVhsVmlZ?=
 =?utf-8?B?RjhvRS9MTTVsa1FFTlF1akxBWUMyZktEakVnaUJZWlNGUjBjU2gwemsxZVlQ?=
 =?utf-8?B?cFprRytrU3JJdnoxd09hSmYxS0Q5L3RlZytKTEdxd0tMWVZLUUs2S2dBakt2?=
 =?utf-8?B?bUhaMjJQeHcxYXpGR0swMnZrOVhZbXVPWDVCT3lLa0VGY21PblZ6L2ZUakRj?=
 =?utf-8?B?QXA0bWZYV3hqTExSRkEvSGVBSEZBbGlCVlpKUkRrRzM5UzV0S1cwLzBHZ2FK?=
 =?utf-8?B?Y2oyTzEwNEVzbkNPTGcxTGVlYWlSNW1vR2dKSWZTQjNvVUt6QnBndGhXSDVN?=
 =?utf-8?B?eUtNR01MTzdFZWYvWmtOTVZJRk9rbnA1QWQvZ3JNbTJjencxdmw5UnFDempK?=
 =?utf-8?B?dmxqbTA5VmYxdXNSZlFhTGN0NnNvVFU4ZVUwanNKbnJ5TXRDcENzQTFZc2Uy?=
 =?utf-8?B?dU9va3VlQVVaTkdVQ3FmOXl3RnZOMEwvN3EvNm85cS9yRm9vcXFsbnNVZ1Q4?=
 =?utf-8?B?SFZXQjdoU1V2bUZocEZhd3doTUdxWFdNRkZCZ0VSMFpodmxkRlNwOThiaHZX?=
 =?utf-8?B?SE1MVW5XUk1LYnUvQWtwZStSYnMxMGNNRmN2RjZ0b09kWVFGL3E4OHNNMUEy?=
 =?utf-8?B?UVFFODRvaHE3aCttTkYzdTFkejZHZEkvMlFTelcrYkxUUk95Mmx5b1ltcWpO?=
 =?utf-8?B?YnBEbXR5QjBmb2pha0lWM21EbGxxRFhxZ3hOSmFOK3ZmZGUwaW5hUjRpZkt5?=
 =?utf-8?B?SGRWejRMMWx2UkxEbjhheDllbzFjamJaUk0vVVMrSXVvdlVvV3daTTgyTnA3?=
 =?utf-8?B?OXBaanFsTmFtMlJZcWFra2E5NkZicEd2Y3ZaSlVQcEZ6QVpadHhDN3Q2bHdu?=
 =?utf-8?B?YVBlR1BJUGJrZ0szNzZnTHQ2ZzNWSndwRjRlOSs2VzZiREJFT1RlaHZZMjBT?=
 =?utf-8?B?ejcxdkJMQjZXMTdkaVN0a09LNTNCa05RR2Z6UGtnenVhRldUdGdCL1BhaFg3?=
 =?utf-8?B?WitER0N0eEROblJLMXFydXhMUXA1SzMzdzM0QWF2MzBiRkNVZTdUeHUvcnIv?=
 =?utf-8?B?ZHJMNTlMdWlRb3lPNDMwbWNVdUd1RmlnY255Zy9kRENPYnA5bDE3VzdtTk5n?=
 =?utf-8?B?YUQyYlVsWm13MDBzb3lUd3lYZDdORkdVbmYrRDY0NVp6MTFZS1NRZjdVNWNI?=
 =?utf-8?B?UFRZVlhrdkhqQXp6Vm03RS9NeGFCaUJkcFB2eVJMNkthS3FWRjBzbmwrVXZZ?=
 =?utf-8?B?S2NGT2crNXZ0NzJtK2Y0bG5yK1locEF0cHkwcy80Z2hOcWxPZDc0ZVJ2YWJG?=
 =?utf-8?B?Q2VTSjFrR1ZuQitmeHJQbnNMTnJxamE2ZlBlalBISW9zbmFqc003eVNVRm9Q?=
 =?utf-8?B?Y0hBNDhLZnQ1OGpMNG1qdG4zTlRQUXlsM0xodEk2d2VBbXFlMk5oRlJoWnp0?=
 =?utf-8?B?UG1sb2E1U01QSGxiZE9sVEsySlI0RTl3NmpTZ1ZuTEIxTFhlSWM4NU5oT21k?=
 =?utf-8?B?QzJaWk1PcGFzRkhvNGpCMnJHL1h3bkFDa1pEQUl4YUNzNDB4MzZTYUNpUHNG?=
 =?utf-8?B?QitVeURmcUJ1enhBS0dyNFZBYkphUHlvemU1NXdYLzErb0tnTGo4THpkMWM5?=
 =?utf-8?Q?H2UyGEfwG1VmhXixW0RLrNdYBcg/asAWn68Gw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UjUyTFZEaTB1dXl2NThwZE1DQ3I3SjFxVmIzbklZcXlIbkhwdHpjTmlCWTJE?=
 =?utf-8?B?aTlOS3FiQzhmRC9pVGJIMFNvMEZXekpQbldWNGs2M1A1WnJINTBmZjR6UGNI?=
 =?utf-8?B?a3pxR2ZvbHI3bk03aWpTYkhxMVJaZFNoU1l2L0QrYTdaZDNtWEh5bXBxalpF?=
 =?utf-8?B?Vy9YTDVXbnkrTjdhS2ZVOW04VmNFV0ljRit2SWVJdHR2UWtJRStvVE1uSWJP?=
 =?utf-8?B?UGgxeFpqRHNvNkZYMk10dFF6UG8wTmdrcHVUNENiaUFzZkdPU0lNdExudXhz?=
 =?utf-8?B?c25Za1hUUnpVRjh0UkNZdXVjT3BNQ3FRdFFHUWFKeVcydzcrbmd4T3ZLN3RX?=
 =?utf-8?B?NUtJM2pmWGYvTDNQQWFmNDE1VldINWFSR2VZRlUzdjk0Y0pKdkVPeXNaWEhG?=
 =?utf-8?B?MGMxWnhuSUpZU0hpc1Q5T2RuUzhtWjNQeWN5WXcwUTd5aWRlYWFrZExZaE1k?=
 =?utf-8?B?OERJclBZSHMvRm8raTdMbSs5Wkx6VjB5b3habEtBSVhHVFdrU2RWNDVyYWFB?=
 =?utf-8?B?Y0g0OU9mSFhVbzBWaUU5S01JOURvT3VSalMyM2pNY0V5Qm0vZWVqSk5mWGlO?=
 =?utf-8?B?RWNKbEJtQnVXRXNFbmZOMGdGcTBvdmVUWmI5VWIrM0FWT1dBNkNKVmRvMXc4?=
 =?utf-8?B?Mk9wZlFDcGg2VUptdy9NMFRwcFBXc3dPVGpGTUpvM2hpUW4zV05oQXF0THpt?=
 =?utf-8?B?SzJxV3k5bURMUzdRbUlVY1lvRE4yS2I0dUE2QklEWVhXTW1KU1h5ampmNUZm?=
 =?utf-8?B?SUJOaXJHb1hkc2lpem92am5aSE5tQzZBbTZvZ2daODV1ZnBCNlY1MTVkKzYy?=
 =?utf-8?B?ZkVYYmJMS0hYbHh6a1JRWTRuRDU1elpJQWc0dkpsYWVFc0N5a3BHMUdEcm1r?=
 =?utf-8?B?VkthZlVsRGZab2JreUF6b2ZuVGVlOWFjZ2lFZllYYjA2emNId2N1N2l1WkJn?=
 =?utf-8?B?alpqNTB4aCtQbmFEKytRNklGNjB5T0MyY3kyRlc5eE81Q0MyNklQL2VhRkdr?=
 =?utf-8?B?MnlrNndpZ1h5VlI1Q0VIVGpub2t0ZjZudUErY3VFR04zQXMyTzB3S0p0bzdN?=
 =?utf-8?B?d1paU2RQd3NSL3JFOUlta1VkQmh1bTZYSzNtNE95M3BEZmNBL0JyOS9jaFNN?=
 =?utf-8?B?MnA0WGxNSXRhVmN5R0czRXRBYXZhTGR4REhqZC91SitpbnV0a2pRUVE4TU55?=
 =?utf-8?B?THdTYkROWHFVbXg4cElwN3hZRkpkTnQ5WTF5dzB2SW1PQVMvRTFGUmpBZ1FR?=
 =?utf-8?B?LzFCVTFGenhJMGMrU1UwUkhPRmd2bmptYk9jUUJJdnN2NGxONzlXSFMxZndw?=
 =?utf-8?B?ZmRwSGltb2hqMkMxSTVPVXRYcDRVR2d6ZGNGM1FSVU5UOW56TmVSNXRDVDRZ?=
 =?utf-8?B?QkUwMVJkcVo0R2tIb0NLancrRmtXaWxaekl1elBabEdmYTJaelFBSHMyL1ky?=
 =?utf-8?B?YXlFUEY0elNnZ3paUjdoZDRKcUNneXpiK1RwdzhQUFdXM292bWdpRjJQZWJu?=
 =?utf-8?B?UmNaTHRLa0U3ZE9oVEVHYk9oYzRwQ2JwN2dtd25hRjV1UWNGb2xxaUZMdldv?=
 =?utf-8?B?ZnZmNTVNNDVUYUU4QXZlVVpaVVkvdGFOeURha1pMRzA3bDZwQnVpYW03Ym1w?=
 =?utf-8?B?ZFBoazd3K0UwVXl3ZEJFcGFyWEF5MnFKdlpmS1MzZnJWUXMxL3Rpd3U0SmFS?=
 =?utf-8?B?WStZY2xwN0xpcXRrdmQ4ZlkxNVhMemZPTTZQcDBROGtZTUxzVjloZUVCRm9i?=
 =?utf-8?B?eklsRTZ5cHFkMWhuNXA0MEFORVowSWxyNytQcXFaUmFodnRVRHNxbUpBaTV3?=
 =?utf-8?B?RWFBMnEvRy9PTkp6bERodUVscFpzVHhNeTRIUEMwTk5GYWh2UFg2YVVYUEdL?=
 =?utf-8?B?Z0YrN3lhdUVEUGlUVnV5eTRLNVZpU3BYUGRYRzIvR3JLOFZBQmdMem56NG54?=
 =?utf-8?B?T0pNVkQ1eFdBVEpPYkhKaU5ZZ0w3dXhvWStKdCtUTUVieTBHYzBLQ2UzRkx4?=
 =?utf-8?B?QXFQTUNNWVVQbHgxQ1RUVC9KNWJVcGRGSXdJajNDMG5xaTZXODcyYXlPMHdY?=
 =?utf-8?B?MEo2VUpuRFBoZXF3SURRL2QxT3VaSVBLTVFXYmwvcmFsdlBFZm1Tc25QeVZT?=
 =?utf-8?B?cW1yMEdCelM1L2hWQlJETEF2R2ZZc1JtUC83VGRqZVJoUldyV05LSVFVZzFL?=
 =?utf-8?B?Y0E9PQ==?=
Content-ID: <184969E7CF780A43905EE63A907617D0@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 183d366d-78fb-41bb-91b9-08dd0a1a6f28
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2024 10:51:20.6757 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 83YOyjNi9apQXs0YUUsti4HwbCpE2/51EPdAbgwpcAqdWh0ZShFHipbFXwhjZtFAx7eJRe3vCq5EF0S2CYfWYdAVKXRlS1sW6mmSCe8Kgas=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8632
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_003_1197268364.1256500804"
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

--__=_Part_Boundary_003_1197268364.1256500804
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGkgS3J6eXN6dG9mLA0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXdzLg0KDQpPbiBUaHUsIDIwMjQt
MTEtMjEgYXQgMDk6NDIgKzAxMDAsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+IEV4dGVy
bmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRz
IHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+
IA0KPiANCj4gT24gVGh1LCBOb3YgMjEsIDIwMjQgYXQgMTI6MjU6NTVQTSArMDgwMCwgSmFzb24t
SkguTGluIHdyb3RlOg0KPiA+IEFkZCB0aGUgR2xvYmFsIENvbW1hbmQgRW5naW5lIChHQ0UpIGhl
YWRlciBmaWxlIHRvIGRlZmluZSB0aGUgR0NFDQo+ID4gdGhyZWFkIHByaW9yaXR5LCBHQ0Ugc3Vi
c3lzIElELCBHQ0UgZXZlbnRzLCBhbmQgdmFyaW91cyBjb25zdGFudHMNCj4gPiBmb3IgTVQ4MTk2
Lg0KPiANCj4gTkFLLCB2YXJpb3VzIGNvbnN0YW50cyBhcmUgbm90IGJpbmRpbmdzLg0KPiANCg0K
T0ssIEknbGwgZHJvcCB0aGUgY29uc3RhbnRzLg0KDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTog
SmFzb24tSkguTGluIDxqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+ICAu
Li4vZHQtYmluZGluZ3MvbWFpbGJveC9tZWRpYXRlayxtdDgxOTYtZ2NlLmggfCAxNDQ5DQo+ID4g
KysrKysrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDE0NDkgaW5zZXJ0aW9ucygr
KQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA3NTUgaW5jbHVkZS9kdC1iaW5kaW5ncy9tYWlsYm94L21l
ZGlhdGVrLG10ODE5Ni0NCj4gPiBnY2UuaA0KPiANCj4gUGxlYXNlIHJ1biBzY3JpcHRzL2NoZWNr
cGF0Y2gucGwgYW5kIGZpeCByZXBvcnRlZCB3YXJuaW5ncy4gVGhlbg0KPiBwbGVhc2UNCj4gcnVu
ICdzY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1zdHJpY3QnIGFuZCAocHJvYmFibHkpIGZpeCBtb3Jl
DQo+IHdhcm5pbmdzLg0KPiBTb21lIHdhcm5pbmdzIGNhbiBiZSBpZ25vcmVkLCBlc3BlY2lhbGx5
IGZyb20gLS1zdHJpY3QgcnVuLCBidXQgdGhlDQo+IGNvZGUNCj4gaGVyZSBsb29rcyBsaWtlIGl0
IG5lZWRzIGEgZml4LiBGZWVsIGZyZWUgdG8gZ2V0IGluIHRvdWNoIGlmIHRoZQ0KPiB3YXJuaW5n
DQo+IGlzIG5vdCBjbGVhci4NCj4gDQo+IFRoaXMgZ29lcyB3aXRoIHRoZSBiaW5kaW5nLg0KPiAN
Cg0KSSB0aG91Z2h0IEkgaGF2ZSBkb25lIHRoYXQsIGJ1dCBJIGZvdW5kIGEgd2hpdGVzcGFjZSB3
YXJuaW5nIGF0ICMxMzI4DQpub3cuIEknbGwgZml4IHRoYXQgYXQgdGhlIG5leHQgdmVyc2lvbi4N
ClRoYW5rcyBmb3IgdGhlIHJlbWluZGVyLg0KDQpSZWdhcmRzLA0KSmFzb24tSkguTGluDQoNCg0K
PiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KPiANCg==

--__=_Part_Boundary_003_1197268364.1256500804
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGkmIzMyO0tyenlzenRvZiwNCg0KVGhhbmtzJiMzMjtm
b3ImIzMyO3RoZSYjMzI7cmV2aWV3cy4NCg0KT24mIzMyO1RodSwmIzMyOzIwMjQtMTEtMjEmIzMy
O2F0JiMzMjswOTo0MiYjMzI7KzAxMDAsJiMzMjtLcnp5c3p0b2YmIzMyO0tvemxvd3NraSYjMzI7
d3JvdGU6DQomZ3Q7JiMzMjtFeHRlcm5hbCYjMzI7ZW1haWwmIzMyOzomIzMyO1BsZWFzZSYjMzI7
ZG8mIzMyO25vdCYjMzI7Y2xpY2smIzMyO2xpbmtzJiMzMjtvciYjMzI7b3BlbiYjMzI7YXR0YWNo
bWVudHMmIzMyO3VudGlsDQomZ3Q7JiMzMjt5b3UmIzMyO2hhdmUmIzMyO3ZlcmlmaWVkJiMzMjt0
aGUmIzMyO3NlbmRlciYjMzI7b3ImIzMyO3RoZSYjMzI7Y29udGVudC4NCiZndDsmIzMyOw0KJmd0
OyYjMzI7DQomZ3Q7JiMzMjtPbiYjMzI7VGh1LCYjMzI7Tm92JiMzMjsyMSwmIzMyOzIwMjQmIzMy
O2F0JiMzMjsxMjoyNTo1NVBNJiMzMjsrMDgwMCwmIzMyO0phc29uLUpILkxpbiYjMzI7d3JvdGU6
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtBZGQmIzMyO3RoZSYjMzI7R2xvYmFsJiMzMjtDb21tYW5kJiMz
MjtFbmdpbmUmIzMyOyhHQ0UpJiMzMjtoZWFkZXImIzMyO2ZpbGUmIzMyO3RvJiMzMjtkZWZpbmUm
IzMyO3RoZSYjMzI7R0NFDQomZ3Q7JiMzMjsmZ3Q7JiMzMjt0aHJlYWQmIzMyO3ByaW9yaXR5LCYj
MzI7R0NFJiMzMjtzdWJzeXMmIzMyO0lELCYjMzI7R0NFJiMzMjtldmVudHMsJiMzMjthbmQmIzMy
O3ZhcmlvdXMmIzMyO2NvbnN0YW50cw0KJmd0OyYjMzI7Jmd0OyYjMzI7Zm9yJiMzMjtNVDgxOTYu
DQomZ3Q7JiMzMjsNCiZndDsmIzMyO05BSywmIzMyO3ZhcmlvdXMmIzMyO2NvbnN0YW50cyYjMzI7
YXJlJiMzMjtub3QmIzMyO2JpbmRpbmdzLg0KJmd0OyYjMzI7DQoNCk9LLCYjMzI7SSYjMzk7bGwm
IzMyO2Ryb3AmIzMyO3RoZSYjMzI7Y29uc3RhbnRzLg0KDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZn
dDsmIzMyOyZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtKYXNvbi1KSC5MaW4mIzMyOyZsdDtq
YXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYjMzI7Jmd0OyYjMzI7LS0tDQomZ3Q7
JiMzMjsmZ3Q7JiMzMjsmIzMyOy4uLi9kdC1iaW5kaW5ncy9tYWlsYm94L21lZGlhdGVrLG10ODE5
Ni1nY2UuaCYjMzI7fCYjMzI7MTQ0OQ0KJmd0OyYjMzI7Jmd0OyYjMzI7KysrKysrKysrKysrKysr
KysNCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7MSYjMzI7ZmlsZSYjMzI7Y2hhbmdlZCwmIzMyOzE0
NDkmIzMyO2luc2VydGlvbnMoKykNCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7Y3JlYXRlJiMzMjtt
b2RlJiMzMjsxMDA3NTUmIzMyO2luY2x1ZGUvZHQtYmluZGluZ3MvbWFpbGJveC9tZWRpYXRlayxt
dDgxOTYtDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtnY2UuaA0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtQbGVh
c2UmIzMyO3J1biYjMzI7c2NyaXB0cy9jaGVja3BhdGNoLnBsJiMzMjthbmQmIzMyO2ZpeCYjMzI7
cmVwb3J0ZWQmIzMyO3dhcm5pbmdzLiYjMzI7VGhlbg0KJmd0OyYjMzI7cGxlYXNlDQomZ3Q7JiMz
MjtydW4mIzMyOyYjMzk7c2NyaXB0cy9jaGVja3BhdGNoLnBsJiMzMjstLXN0cmljdCYjMzk7JiMz
MjthbmQmIzMyOyhwcm9iYWJseSkmIzMyO2ZpeCYjMzI7bW9yZQ0KJmd0OyYjMzI7d2FybmluZ3Mu
DQomZ3Q7JiMzMjtTb21lJiMzMjt3YXJuaW5ncyYjMzI7Y2FuJiMzMjtiZSYjMzI7aWdub3JlZCwm
IzMyO2VzcGVjaWFsbHkmIzMyO2Zyb20mIzMyOy0tc3RyaWN0JiMzMjtydW4sJiMzMjtidXQmIzMy
O3RoZQ0KJmd0OyYjMzI7Y29kZQ0KJmd0OyYjMzI7aGVyZSYjMzI7bG9va3MmIzMyO2xpa2UmIzMy
O2l0JiMzMjtuZWVkcyYjMzI7YSYjMzI7Zml4LiYjMzI7RmVlbCYjMzI7ZnJlZSYjMzI7dG8mIzMy
O2dldCYjMzI7aW4mIzMyO3RvdWNoJiMzMjtpZiYjMzI7dGhlDQomZ3Q7JiMzMjt3YXJuaW5nDQom
Z3Q7JiMzMjtpcyYjMzI7bm90JiMzMjtjbGVhci4NCiZndDsmIzMyOw0KJmd0OyYjMzI7VGhpcyYj
MzI7Z29lcyYjMzI7d2l0aCYjMzI7dGhlJiMzMjtiaW5kaW5nLg0KJmd0OyYjMzI7DQoNCkkmIzMy
O3Rob3VnaHQmIzMyO0kmIzMyO2hhdmUmIzMyO2RvbmUmIzMyO3RoYXQsJiMzMjtidXQmIzMyO0km
IzMyO2ZvdW5kJiMzMjthJiMzMjt3aGl0ZXNwYWNlJiMzMjt3YXJuaW5nJiMzMjthdCYjMzI7IzEz
MjgNCm5vdy4mIzMyO0kmIzM5O2xsJiMzMjtmaXgmIzMyO3RoYXQmIzMyO2F0JiMzMjt0aGUmIzMy
O25leHQmIzMyO3ZlcnNpb24uDQpUaGFua3MmIzMyO2ZvciYjMzI7dGhlJiMzMjtyZW1pbmRlci4N
Cg0KUmVnYXJkcywNCkphc29uLUpILkxpbg0KDQoNCiZndDsmIzMyO0Jlc3QmIzMyO3JlZ2FyZHMs
DQomZ3Q7JiMzMjtLcnp5c3p0b2YNCiZndDsmIzMyOw0KDQo8L3ByZT4NCjwvcD48L2JvZHk+PC9o
dG1sPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxwcmU+KioqKioqKioqKioqKiBNRURJQVRFSyBD
b25maWRlbnRpYWxpdHkgTm90aWNlDQogKioqKioqKioqKioqKioqKioqKioNClRoZSBpbmZvcm1h
dGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0
dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwg
b3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3
cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVk
IHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHBy
aW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0
cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBw
cm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5k
ZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlDQogDQp0aGF0IHlvdSBoYXZl
IHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIg
DQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFu
ZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMp
IGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRo
aXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_003_1197268364.1256500804--

