Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DF99EC26E
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 03:47:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD37410E114;
	Wed, 11 Dec 2024 02:46:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="bCq2Sdxg";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="FTrxP6o4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB2FF10E114
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 02:46:57 +0000 (UTC)
X-UUID: 2c458e60b76a11efbd192953cf12861f-20241211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=PZUrYz2Ubo3j3AEBtwK16DtnCGPQ1xcvWvmxlQqZo4M=; 
 b=bCq2SdxgsqpKTX8wzmIl9Uufa4O+QBfmzo3DRV+oc9HIBLdEpI3+ZV8SQ+ujSraeiYOXdectGo5DLA7FWfZ6FvFcZcX616n6Lga9CytxYQqcZVpxOSvM1qsX0I/0t/MNAR/x7uV9PNFKLR5izgq9IUgcLLPBNfySu5AIJyBtLPA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45, REQID:76c579bb-1fb6-4648-954a-1a5acd5c2490, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6493067, CLOUDID:71752cc1-1c82-4420-82d9-d6eb228f5c4a,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
 :-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
 ,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 2c458e60b76a11efbd192953cf12861f-20241211
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1116202103; Wed, 11 Dec 2024 10:46:50 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 11 Dec 2024 10:46:49 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Wed, 11 Dec 2024 10:46:49 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dAej/x72E1G+OZFQKMUEAWwP3FcCIDwY6NqBVZG26okiWVcaetxguYEVh5HnBLhZGiSAylJmwfMDnQccpcVT8a5yjoHhReRacsubAeBcfsDY0op5dj1t+raxf5altwj9+KIV/x+awRsGmcuVGdnhD+VPwp1m+qD60nAmRegE/fhVtL9hWHiIPHbiQcgkrnyawSMOSnki9Z3xjY5ODcCK4PMkzJN6j+9cmbuo8vDOu7Q2CdsKAVHzix5JTgDRWd5M95LmT3YoFm7ucnrKbQhUVnL1g+Ku1VCebqDG9EhJKW3+423jZKCTs4TxRJdoe6DV6XxHF8IzExlLFa7BUNlI2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pbUVGoSD3+IQKF/BVCxmua+9Otpte+5BAJTGO0mcgig=;
 b=eyIj83jqgWcCYBsgLiysGlBzCtpB4ks1tchyXJWV3jNa9oEAZGlbCQ1d1A05475AR45z0/cxj9+mbEeeRju/SnR/xX+T7JUQumTJgBlTrWnu2+FA1Zg0uJ9STIoZDPOYDc4dkUajItp42sAOjBIWzBDxaOZzky/McHi9I0h8Rt1/Y5HSetslY+yeGQwFJ0hsvjYsU7sy4Iinehjrv2+L6Q4cx2+BGrjCIu2ElIIo4w9/W8QLoTbYzvSwHQvn3vq6qxNEEPfyJH1CGRne0m2arKwTqsXZPchbXLof5ryR+6LaoJ/m2xapKyJ0KJoToghFMEjxjoGPMcWW+eYx6Gt3cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pbUVGoSD3+IQKF/BVCxmua+9Otpte+5BAJTGO0mcgig=;
 b=FTrxP6o4VTrHl3zH4UgA53/l75MtR5u7IRkKX9mW8b+JkRqlS85tMAVkferYWcv+YlL0U50sRu1pbQuKKUpP+BYd7TSt1U2kTijiJrMIRq9OiVQ53JEbWlq1aHB2LztlkaWvipdT8NAudTn6CgTsZa07ZcQLyfk3Hx1Buo6mFtY=
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com (2603:1096:101:83::7)
 by OSQPR03MB8481.apcprd03.prod.outlook.com (2603:1096:604:27b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Wed, 11 Dec
 2024 02:46:44 +0000
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::9fa0:ee98:d5ed:beba]) by SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::9fa0:ee98:d5ed:beba%5]) with mapi id 15.20.8230.010; Wed, 11 Dec 2024
 02:46:44 +0000
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
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "junzhi.zhao@mediatek.com"
 <junzhi.zhao@mediatek.com>
Subject: Re: [PATCH v2 12/15] drm/mediatek: mtk_hdmi: Split driver and add
 common probe function
Thread-Topic: [PATCH v2 12/15] drm/mediatek: mtk_hdmi: Split driver and add
 common probe function
Thread-Index: AQHbRwuDKzLMLP8gmEqSnf1CFqiN77LgX7oA
Date: Wed, 11 Dec 2024 02:46:43 +0000
Message-ID: <a07fdebcad66bf85c30da1323e655b29df1ee108.camel@mediatek.com>
References: <20241205114518.53527-1-angelogioacchino.delregno@collabora.com>
 <20241205114518.53527-13-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20241205114518.53527-13-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB6626:EE_|OSQPR03MB8481:EE_
x-ms-office365-filtering-correlation-id: 3b06d9d2-c979-4b49-616b-08dd198e0c58
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?UVdra2NRTzF3MkxkVFF0Mk5YcFdHMFZHTjdNSGY0YkRrbC90KytESDBQYlVZ?=
 =?utf-8?B?RW9VSWh1eGkrVTM5MUpGc2MrQk9mSTBSaENFWmtaU2pvVjFMalFEclhJQ0dv?=
 =?utf-8?B?alBkK0tiZ1JuWWt5VGpDS05BaTcrdUJERlpFd3hwMVZDd01GdjMweUo3RDZq?=
 =?utf-8?B?blB2R0pkZjZiaXRhSHVzZTBidTlzUjM4MldjVjRjN3BwL1hCaEFrT3dhbG1I?=
 =?utf-8?B?WmN0b2JoQkFjN3hSNUdBeEMxOU9EY0plQ1pNLzlpMFZmb2RXbVVWSlJ2WEpv?=
 =?utf-8?B?M2NFNmJHNTFYN3NwMFp2dEpnUEg0cDluS1JObnVBQlRCbnlyZXVwVDFFTE9l?=
 =?utf-8?B?dXg4YTlkWkZKNDNHeUxDUnFrY2lndFdWRG1XRTNDS0UyeEJHZ1dxeWFRRndl?=
 =?utf-8?B?cnNGUVE1RGQrVUQ2ejVzbDNza3NtWUtjOTBvczQyTHg0amoxMlByVVFZRzA5?=
 =?utf-8?B?Q1lOY0JWak0yM1VFQ1MvLzBHQlRLTlJtVFBTOTc0cE5NU2sxajJ4c1RDTGJP?=
 =?utf-8?B?SlFBVndKOXVQbFBWdzdvcWMvQXdKc1pxcFMrekJpYllCcGNWeVJmR3IrdlBS?=
 =?utf-8?B?T2lSQldpVE1sS2JxSXRFVC9yeURJN1kzaktMNHNEOHFUdUJyQmdJT0JxOFox?=
 =?utf-8?B?WnZMSU5nbVJTdm5qS0pwamFJYkNhVlNkUjZaM25jNTNsQVcxVHN2OTRvanZR?=
 =?utf-8?B?YmI4T3FFd2pQZEpyRGNwVkw2MFZlcENvd1BvY0RBdUxnL3h4bFlmbHhVMGxo?=
 =?utf-8?B?WjhITFVLckJxdXI1NjBXVUxyQUQrRVpDcXEwakRGRVJzcURTVVZyUytVWEMz?=
 =?utf-8?B?UzRkZDNaNlhaTG1La1ZaZGcyVWI1OGV5NnROekdJK2FBVnpqeGF2bmE2aEQz?=
 =?utf-8?B?UTVEdzBIQzBzeHZaNzFLdnZwLzQzQzVtdC82RHUyWmhIbE9mT1NrMWdYU0RW?=
 =?utf-8?B?eGU5WitaZGZTZ1UzRy9yeVdyaWpJam9sa3J6SURMM2dQU3hHNjdSazRvUVRT?=
 =?utf-8?B?Yis1eG84UFdTQ01seURKZnlFNXU3RWtxR21wd0VqUUFZdWlES1RzaWhLSXFq?=
 =?utf-8?B?Q05nZG1BaGlRZ2pVUVdqRHI4b3FwTDAxRHQ3ZUF0QWNETjl1VHI5YTF2VStD?=
 =?utf-8?B?Zmp2dmMvdXdxMzVsNTJZRjVHWHM1TEcvMTFSeUlyeE1NaTNrL0VTMm5SWW9U?=
 =?utf-8?B?Rm1yOHZJaW5JNzQvTkVvV09FbTNhcmxzUm1qTEtkRzkvRFpMRzRkd2V1RFZH?=
 =?utf-8?B?T1BvN3l3OElxaTVBWkRCREs5bTg5VitPMkR0RFE5ZzlnQ2JXVlNHaCsrRHl0?=
 =?utf-8?B?N1BlUTNaaGFvL2tzWjF5cytaL0FUTldMNFpwL2RjcldhaTRCV1MvSk1US2xo?=
 =?utf-8?B?eGNKYkV1eW5UVlRaUTF4SkVTWEpXMS9jUEw3VEhLY2laR0VNek53bkZQU2JQ?=
 =?utf-8?B?M0NTWEdVcjJaay8rcW1oMjVOWGdKT0VPVXIzK294Q1V6STNGSlVHbFZSOW9O?=
 =?utf-8?B?blZFSXgzclBSTnIzWDY5RmlDODMzZVdoKzZzL2F6M3lZTlJMRDl1Z1U1ejYy?=
 =?utf-8?B?VTcxU2dpdUVUTXlObFMrUzhJc3o0MTltR1pMNWticHJud0VTLzZFdUZPMnBl?=
 =?utf-8?B?eUJQR2VuVk5XVFllaUM0T3JaK0lta1RsMThiOWt2UFJWTTNmYWFTT3JRMzk4?=
 =?utf-8?B?bHl5WHJKOGlkMWdhb2Ruc1BRWTNVMDlMSGMxcTgwVU90SjQ5UHY0WWxIZXpy?=
 =?utf-8?B?dnRuNi9YL01QZGxUMmNjL29FVitQTFk5TXVXTW5NdThTajBic1RjSUhUdUhX?=
 =?utf-8?B?VEhkZElISkFPeDZnQ05KRnhLd0NKajk4RGoweml6bEJ0WVIrU3dhVXQvdEsy?=
 =?utf-8?B?TDQ2OXluMWRxSUpucTZTV1ppczdDRU1QSGoxM1dIL1UrQlE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB6626.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WW5WZ1dNUmc3M3l6UzEzTy8vTzJTQnY0N0poRXdoUzkyRDZlN3U3aVpkRTJ1?=
 =?utf-8?B?Y0JyVDIxT2JQaGJkdEtET0M1UjJYL2dybkg2V256czgzbkprdU94YWVTRTNB?=
 =?utf-8?B?Y3kvTkk4T1ByUEJxQkRCRGR0Ky9QZTBVTys5OWlUTTJoN0pHNzdyam5CdXpt?=
 =?utf-8?B?WW15aDRxeGdzQ1ZhVENnY2J2d0FJNTR4cFdqTElCdzRnSVdiZ0FQWWNhTllR?=
 =?utf-8?B?SncrdGVvOU96Rnl2bkluM2NuVmFveG45L3AzL2p5WVo2RFArSDhNWGdod3g5?=
 =?utf-8?B?UHlvakMyejhkeEpCMmw1ZExZS0dkN3FvVjZqbm15L3pQcFhUdHA4SkphS2Mz?=
 =?utf-8?B?a0N1bm9rNFYvb2oyTWdqMGJYTEJRZFkyVnE1OU1KeGQxck1TQitRdTRNZWxr?=
 =?utf-8?B?VkhPSkpJakhOWnBZWjRLNkJLdG5sYmNUcmJvOW9mM1dsNE82cFlOYTBXckh6?=
 =?utf-8?B?UDNLd1JhZkZsV2I1OHE0TTZQS2V2RGQyRldzWWdydkFpeUMyaGJ0VDFUSGh3?=
 =?utf-8?B?VWFRSnpWTnF5OGhYdFpQeFFZc0t5aHF3NlFLK1pwa1JzMkZmTzVVVXllVUtE?=
 =?utf-8?B?TkxDNlhhY1BxUzhGbmdXUmRHQjBqK042RU9idmZHcTdKRWZ0K01oMThmZkhB?=
 =?utf-8?B?bk1CVFIxUGpBKzJ0dlJlUHMrNmFaRlpPRTBpTWdZNFJFTWFqU29nUi9VcGVY?=
 =?utf-8?B?NkJpV2RiU3lrR3V3ZjQwd1EzS2dPcEx2NDNMdndselZIM3U4czhkTnp6TUV3?=
 =?utf-8?B?ME9kNlFTZ2pVWFR2NXEyN05nZExkR3lHdzB3dnJUVVQ4Y20vaUdiWFNtTFJY?=
 =?utf-8?B?OGJsN1YvNGhZMmhlRzJQd21BM0tMeS9leFQxbG5mdzFUUEF0L2FPcnhqbGdW?=
 =?utf-8?B?ckFNSHBsNEI4N2xuVkNmR0NQOHVBS2dhRVdGY01ZWldZY0JoMlZpa1Byejlw?=
 =?utf-8?B?RkQxeXY1WGxWK0FxditDQ0thaEZmS3dFRENqK1JFdEYvZ1NhTVhvUW5nT2w0?=
 =?utf-8?B?cGhqTC94d1VwNGlldy94eFlZaEU2aTZ4OGNSbks2MmdRTDlUcjlvbUFoZ3B1?=
 =?utf-8?B?OThGWUxMUkRmeENjK1BtUzc3aUZndU1DY0J0aGRDTzU5blllZG55TUV3Y2x5?=
 =?utf-8?B?ZGY5UytSeUhWVkNDSDJUYWhTd3FtemNiZmRmczZCbkg2VnpKOVAza2RTMWFn?=
 =?utf-8?B?QXF3aEdFM0p5dlc4Mk15N3F2UjJjN1JWbUlrb1I4Ny83QU9BY0hWWGhzOGtu?=
 =?utf-8?B?SEtjS0JUSXhORFNrdDJnNHRtN285b0FCNGtXQmZDQjJiWHh2aHoyNmJ5VzJn?=
 =?utf-8?B?b2tiQXU1SmN6QWI0Qyt1Y3RZRThsWGR0anY2R2IxbHJQMWdnSzhjdnhEOXd5?=
 =?utf-8?B?d2ZRTWhzUlhWRjVPbkY4aHl0ZEhXMGYrdWh5NUJRd0NmaGNKUVl3VGZxSXF3?=
 =?utf-8?B?NFhqa2Rwd2Q3cWRENmw4Uyt3ejdKRUJSVTh4RXdWbzlBbXZQY2x2WEZGbDE2?=
 =?utf-8?B?TnVtNDFRdThVZ3ZsSTJkclB0OVdISnkyaFNoSW42ZmUyRzBGdU1qK1pmblRp?=
 =?utf-8?B?TW0xb2s4YzJwU2JnSWV0ZzFCWTZTWHh6WEpPK1p1R1VCQ2xhaHo2NjBiSDRn?=
 =?utf-8?B?bUdGd0dieEpjd3JOMGduRkRTMGhZcW1lNmhEMnV4T2Q0QlBXQlhSMEFNR2pu?=
 =?utf-8?B?eFJVSlU3bzlwOVMxbTJ2dC9iZ2xiWXp2SGRPVm1SWm9RVWVWa0s5dzUvUnJO?=
 =?utf-8?B?by9wRS94WDZrbGd4cURoRUtzbjhaTlBQd2hSNElXWEg5OUZEcW8zMjVscFgw?=
 =?utf-8?B?UHdQQjV4TjRsdkl4MEhQZlpzeEVsNklrTU9aY3QxcjNBMmhaSW5VSzlINVIx?=
 =?utf-8?B?bWUwQVVkUkMwOUpMVS82ME9PQk9rWVFZcDljTnFlU2RzS3R6aVZLdW9mZjd0?=
 =?utf-8?B?M2l5WnY2QnNQRWxSeXRwaTBYdEZKcEhNNlZFOTFnVnk4QU5uWmxlRVZYMTd4?=
 =?utf-8?B?Uitsa1hhWUZyVllZcFBQOWJCWS9EODBObzhPUW0xR3N1eE85MlpTeXBGZ1BD?=
 =?utf-8?B?MXRybklzUkM1S2V5ZjJobEt4cmtRd24vZXh1LyszMUJYekljdFV4ZjFZMkZN?=
 =?utf-8?Q?i3+Te2wXJyXwoX8W5Uj+3/5Dq?=
Content-ID: <61D37BBE7A27184DA457B00E9E95137F@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB6626.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b06d9d2-c979-4b49-616b-08dd198e0c58
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2024 02:46:43.9049 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: knwCBrIN8LRPUikclqQAFCRlzlUb2i+DmI0aucYo3laXf5aNZeYHeOLZqqDDrRsrYDEBcEa2l3bRg1zNkivFeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR03MB8481
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_002_539888689.282451292"
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

--__=_Part_Boundary_002_539888689.282451292
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEFuZ2VsbzoNCg0KT24gVGh1LCAyMDI0LTEyLTA1IGF0IDEyOjQ1ICswMTAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZp
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBJbiBwcmVwYXJhdGlvbiBm
b3IgYWRkaW5nIGEgbmV3IGRyaXZlciBmb3IgdGhlIEhETUkgVFggdjIgSVAsDQo+IHNwbGl0IG91
dCB0aGUgZnVuY3Rpb25zIHRoYXQgd2lsbCBiZSBjb21tb24gYmV0d2VlbiB0aGUgYWxyZWFkeQ0K
PiBwcmVzZW50IG10a19oZG1pICh2MSkgZHJpdmVyIGFuZCB0aGUgbmV3IG9uZS4NCj4gDQo+IFNp
bmNlIHRoZSBwcm9iZSBmbG93IGZvciBib3RoIGRyaXZlcnMgaXMgOTAlIHNpbWlsYXIsIGFkZCBh
IGNvbW1vbg0KPiBwcm9iZSBmdW5jdGlvbiB0aGF0IHdpbGwgYmUgY2FsbGVkIGZyb20gZWFjaCBk
cml2ZXIncyAucHJvYmUoKQ0KPiBjYWxsYmFjaywgYXZvaWRpbmcgbG90cyBvZiBjb2RlIGR1cGxp
Y2F0aW9uLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8g
PGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4NCj4gLS0tDQoNCltzbmlw
XQ0KDQo+ICtlbnVtIGhkbWlfaHBkX3N0YXRlIHsNCg0KVGhpcyBpcyB1c2VkIG9ubHkgYnkgdjIu
IFNvIG1vdmUgdG8gcGF0Y2ggWzE1LzE1XS4NCg0KUmVnYXJkcywNCkNLDQoNCj4gKyAgICAgICBI
RE1JX1BMVUdfT1VUID0gMCwNCj4gKyAgICAgICBIRE1JX1BMVUdfSU5fQU5EX1NJTktfUE9XRVJf
T04sDQo+ICsgICAgICAgSERNSV9QTFVHX0lOX09OTFksDQo+ICt9Ow0KPiArDQo+IDIuNDcuMA0K
PiANCg0K

--__=_Part_Boundary_002_539888689.282451292
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtBbmdlbG86DQoNCk9uJiMzMjtUaHUsJiMz
MjsyMDI0LTEyLTA1JiMzMjthdCYjMzI7MTI6NDUmIzMyOyswMTAwLCYjMzI7QW5nZWxvR2lvYWNj
aGlubyYjMzI7RGVsJiMzMjtSZWdubyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtFeHRlcm5hbCYjMzI7
ZW1haWwmIzMyOzomIzMyO1BsZWFzZSYjMzI7ZG8mIzMyO25vdCYjMzI7Y2xpY2smIzMyO2xpbmtz
JiMzMjtvciYjMzI7b3BlbiYjMzI7YXR0YWNobWVudHMmIzMyO3VudGlsJiMzMjt5b3UmIzMyO2hh
dmUmIzMyO3ZlcmlmaWVkJiMzMjt0aGUmIzMyO3NlbmRlciYjMzI7b3ImIzMyO3RoZSYjMzI7Y29u
dGVudC4NCiZndDsmIzMyOw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtJbiYjMzI7cHJlcGFyYXRpb24m
IzMyO2ZvciYjMzI7YWRkaW5nJiMzMjthJiMzMjtuZXcmIzMyO2RyaXZlciYjMzI7Zm9yJiMzMjt0
aGUmIzMyO0hETUkmIzMyO1RYJiMzMjt2MiYjMzI7SVAsDQomZ3Q7JiMzMjtzcGxpdCYjMzI7b3V0
JiMzMjt0aGUmIzMyO2Z1bmN0aW9ucyYjMzI7dGhhdCYjMzI7d2lsbCYjMzI7YmUmIzMyO2NvbW1v
biYjMzI7YmV0d2VlbiYjMzI7dGhlJiMzMjthbHJlYWR5DQomZ3Q7JiMzMjtwcmVzZW50JiMzMjtt
dGtfaGRtaSYjMzI7KHYxKSYjMzI7ZHJpdmVyJiMzMjthbmQmIzMyO3RoZSYjMzI7bmV3JiMzMjtv
bmUuDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1NpbmNlJiMzMjt0aGUmIzMyO3Byb2JlJiMzMjtmbG93
JiMzMjtmb3ImIzMyO2JvdGgmIzMyO2RyaXZlcnMmIzMyO2lzJiMzMjs5MCUmIzMyO3NpbWlsYXIs
JiMzMjthZGQmIzMyO2EmIzMyO2NvbW1vbg0KJmd0OyYjMzI7cHJvYmUmIzMyO2Z1bmN0aW9uJiMz
Mjt0aGF0JiMzMjt3aWxsJiMzMjtiZSYjMzI7Y2FsbGVkJiMzMjtmcm9tJiMzMjtlYWNoJiMzMjtk
cml2ZXImIzM5O3MmIzMyOy5wcm9iZSgpDQomZ3Q7JiMzMjtjYWxsYmFjaywmIzMyO2F2b2lkaW5n
JiMzMjtsb3RzJiMzMjtvZiYjMzI7Y29kZSYjMzI7ZHVwbGljYXRpb24uDQomZ3Q7JiMzMjsNCiZn
dDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtBbmdlbG9HaW9hY2NoaW5vJiMzMjtEZWwmIzMyO1Jl
Z25vJiMzMjsmbHQ7YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tJmd0Ow0K
Jmd0OyYjMzI7LS0tDQoNCltzbmlwXQ0KDQomZ3Q7JiMzMjsrZW51bSYjMzI7aGRtaV9ocGRfc3Rh
dGUmIzMyO3sNCg0KVGhpcyYjMzI7aXMmIzMyO3VzZWQmIzMyO29ubHkmIzMyO2J5JiMzMjt2Mi4m
IzMyO1NvJiMzMjttb3ZlJiMzMjt0byYjMzI7cGF0Y2gmIzMyO1sxNS8xNV0uDQoNClJlZ2FyZHMs
DQpDSw0KDQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtIRE1J
X1BMVUdfT1VUJiMzMjs9JiMzMjswLA0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7SERNSV9QTFVHX0lOX0FORF9TSU5LX1BPV0VSX09OLA0KJmd0OyYjMzI7KyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7SERNSV9QTFVHX0lOX09OTFksDQomZ3Q7
JiMzMjsrfTsNCiZndDsmIzMyOysNCiZndDsmIzMyOzIuNDcuMA0KJmd0OyYjMzI7DQoNCg0KPC9w
cmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioq
KioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZSAqKioqKioqKioqKioqKioq
KioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChp
bmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0
YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5k
ZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkg
dG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCAN
CmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1t
YWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50
KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3Ug
YXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUg
DQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90
aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwp
LCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwgKGluY2x1ZGluZyBh
bnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRo
ZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSEN
CjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_002_539888689.282451292--

