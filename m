Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B43CA999989
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 03:36:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AE3110EA0F;
	Fri, 11 Oct 2024 01:36:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="jMg8lAaR";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="j69A+kIG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B8610EA0F
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 01:36:14 +0000 (UTC)
X-UUID: 318a9772877111ef88ecadb115cee93b-20241011
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=l2tSSnKTg6YnCPdTNCOPR3kaom13utYDuICH+ZD1/E8=; 
 b=jMg8lAaRS7Gh2ivsbfdxo4Nc1c+eW7STSXCbKivKmwSukcgujK/LGsvqjOywiPoCClcnfi01/eu2l76LO1apGOUb8VLF+1Sce4FeyK7KFW9y8W+k+VZFrtToMV65udC1U0KLKuB83FVlrIW7FBvtzNk+96aKasY6Sxd1StBSNaQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:0dd84213-4049-4bb9-be28-0819fd44ed68, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6dc6a47, CLOUDID:575e1065-444a-4b47-a99a-591ade3b04b2,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
 l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 318a9772877111ef88ecadb115cee93b-20241011
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 907609455; Fri, 11 Oct 2024 09:36:10 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 11 Oct 2024 09:36:09 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Fri, 11 Oct 2024 09:36:09 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EDcgUq/c2yWJJSzvvEDy5FYVKGukwNGhltLLzmSqQhZEpDWapwpcxqV5+REhBmHJ6jDU17cMpP3NHKhKxHzlB0ctnHkAKg4gbjXQqBQbw0Y+2LmmK/s4Fxmbr0gDJffZ7dhf2LQDJMLQqlXzgdrZbTazi8Cn3sT75l9Vw4Z0vXU5XBfBb8CJXmp6Tc/2qhDZv0OlzdkDPuVlGkao+dmZ+PHUBXdkMuhduLV5CafE7vEha9/r6YsWIgjL2wgbQtcCBQgZRZNpN0HJtLw1uS/QwJq3bJGGXWKGSwfEuDFWw6SMgkHVBO6PVXv2ctRnQP6Y03yoROPOUwz8B9oibR4koA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UdaGJ2fSUTt8U+p2oRpxIInBv8gsl3jkYG6TZOql1qo=;
 b=Dzo8psg6RHnSs0/aUoi+SkFs5vaZ+bhEJpO4iKs0mdXFQnm4qHH59GKHhto8UVDIKoKqK01NMShQX86n6sUn2RFr1JyQ4Qxp0vJZ/EWqPPbuBYKDVNMTjg3oY0WuHR9HH1lgHPDXT2JUfSWJAOETQ4+Y4CCx6oqqQoWvzGbWjDUAhx7Gq/BdoLS7wvuN9efHDT4/RVVm2itGaYg+PJKxUIKMhYRBEZ/buEGl+vl7XH8lZQ1J0VF8nUK1b71W1eSn7wP109Ume+fg3u8vPdvBSLhAC3ududyA/NAfbD5NXxYTsYIkW7paxHADzZjAzxDaC6tHl826tVVnqrXkjdJLXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UdaGJ2fSUTt8U+p2oRpxIInBv8gsl3jkYG6TZOql1qo=;
 b=j69A+kIGpgNoglEDZ+oKDjALCb+7OTn9lWc37K2p7RwgCcdJTNhGss9l6L5uqDwp3I3wYNqDjOfG+30kWtBMnXxDCka11PPk/vBJsngnCL9ObhuJQZ0kcWq4AtsWPslns0OSLWJ4cVFoZIcEe6QRYxYmCKKm7WxQEX1m7i4Hpjk=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB7470.apcprd03.prod.outlook.com (2603:1096:101:132::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.22; Fri, 11 Oct
 2024 01:36:06 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8048.017; Fri, 11 Oct 2024
 01:36:06 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>, "mchehab@kernel.org"
 <mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?utf-8?B?U2h1LWhzaWFuZyBZYW5nICjmpYroiJLnv5Qp?=
 <Shu-hsiang.Yang@mediatek.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "yunkec@chromium.org" <yunkec@chromium.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, =?utf-8?B?WWF5YSBDaGFuZyAo5by16ZuF5riFKQ==?=
 <Yaya.Chang@mediatek.com>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?utf-8?B?VGVkZHkgQ2hlbiAo6Zmz5Lm+5YWDKQ==?= <Teddy.Chen@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "hidenorik@chromium.org"
 <hidenorik@chromium.org>, =?utf-8?B?U2h1bi1ZaSBXYW5nICjnjovpoIblhIQp?=
 <Shun-Yi.Wang@mediatek.com>
Subject: Re: [PATCH v1 02/10] media: platform: mediatek: add seninf controller
Thread-Topic: [PATCH v1 02/10] media: platform: mediatek: add seninf controller
Thread-Index: AQHbGj2MNHQ5sKpEAUCTiRDvBgOUWrKAx2WA
Date: Fri, 11 Oct 2024 01:36:06 +0000
Message-ID: <2d26eade5c1394594de261d724901a68656c881f.camel@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
 <20241009111551.27052-3-Shu-hsiang.Yang@mediatek.com>
In-Reply-To: <20241009111551.27052-3-Shu-hsiang.Yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB7470:EE_
x-ms-office365-filtering-correlation-id: c120a28f-d88f-4a6c-b15d-08dce9951342
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?RmdXUk1TSUpMVjFIWVVrQXRIeUJibXo3L0krN205WitkNjM5VXBneCszSlpE?=
 =?utf-8?B?ZjNmUmwyaE1MNDhtQnYwR3ZiZzV4Y0Q4VkQ0eE9ZWGg3MWtsbjlXVWdOc0Yr?=
 =?utf-8?B?TWt0YXBBNWN0blpJV3plalBzL3JPckpTS2ttbk9PSHMvVEhXSGdHd0dHTmpS?=
 =?utf-8?B?Mk1aYk91akJueFE0WXBQNnJXNTduTUNnMEE2NlNQNVVTbWkzMlBVUzdPMmZL?=
 =?utf-8?B?aGJINXBpVERpMHJQVUNEY0t3NGtaTlR1SE5Gek85Z0tzQmtSNE1OdE5KZDhU?=
 =?utf-8?B?c3B3cVpoRmR2ZmFKR1BwSnh4cXpPN3ljLzdTM0VLWXMxMURyaENmdFlHeVRh?=
 =?utf-8?B?V2kwdGJTT2VNQWgxaFBhM2pQSnJ2S0V1UmdRL0NmSTR3dURON0RaYWVxZ25G?=
 =?utf-8?B?S0tPVWRoUklxTzRrb1NUd1FKWDdVTTg2ZzlsYVFvb3NGYVBPTXRTbkpqR2xE?=
 =?utf-8?B?NkFwVEgvSFFFd2lWUnZBR3pxaWJxS1VQMnhWY3M2MFE0VXA4aHFGVWd0WEk3?=
 =?utf-8?B?dTQ3VEhoUDJ0WDVkZ3czYk9OUFBoS0FKb1pvcGlWa3dlbUQzck83cHBzSGZN?=
 =?utf-8?B?TjJ1UFNMVzRjb2JKRnNMc0pRcWVLakpod0MvS1NEZlZKMmtDbmJVcFp2MEdT?=
 =?utf-8?B?QlBpbzQ2b3VNUldlQmozVndpOEVXdmtvazhqNm54eXpieHVKVTZZbDIxTk9G?=
 =?utf-8?B?UUM1b0ZYVUpYODd3aEw2VGx3U3poZktreGRFSUVqbG90SXBGWW1sSGRVeTlG?=
 =?utf-8?B?eU81MytWMUhiZHp5R25oN1NDeUdLcXYweko2dUtNZk9Vd2h3a3J6OVl5OGRC?=
 =?utf-8?B?d0ptSE5FQ0pmVlR5QjlKS2ZYRllkRzdsaU9rL2JEdStmenJmS1V1L2czT08y?=
 =?utf-8?B?a0VNSi9ZQjhnS0M5WXM5SDRwWC9yN0ZRVDEzUEw4a1hNVjQwd1pOSjRpZUI4?=
 =?utf-8?B?ZjN4WkpsMENzSmxaMU9WenBVVTJsYVE4bFJpMGpsRndCZGNxOU9uR3pZSEFF?=
 =?utf-8?B?UmtrYXU3elY2N29lT1U0SHpwV3N3OFIwTXRDNTUrb213bUc3RTlieWhzZTdl?=
 =?utf-8?B?N0I3VEUxZWxuUFV4ZXdza2t0ak11WE9BUWNERTAzZnN0T2xZbjZPN0dEVUNl?=
 =?utf-8?B?Z0x1aTB2L1VveWwvVStSTGk3aGRsK0I1NTBpVVVlUDVsT1pKaWc3T2VQREk0?=
 =?utf-8?B?YmpGMVNYVThRWVVPMzhVRGxOY0hDY2FrZG50Sit2T25QWDV4TGw5bmxjMVdD?=
 =?utf-8?B?eTNNNTRSeGZ3cmVNTS9HR09lRzR1V0s1bnVsZnZGNzdZOUN1Mld6b1dNWFFk?=
 =?utf-8?B?UzlZSXp0Y3ZtbWx5T25mTHFkaDdONDhwUXowODVFNGdNOCt1WkwrY3VHaTN5?=
 =?utf-8?B?ZjVyb1hMb2JuUGtveENLaW53YjNva3crSlR1eE8xY3JiM2pSb1JWZ3NQdzkv?=
 =?utf-8?B?K0lnK0V3Z3loWnJ4SGF1ZWM0TjBGaGVpUExVQ3ZDaWNrKzhCMVd0WGdraWFG?=
 =?utf-8?B?MThWd2svZ1Q1R242ODhDZTBUYitJV3NJYmhiMTRDU3JRWFAyN2x3UGFDQTFz?=
 =?utf-8?B?T3NRNGFseGNTOG1NNjZaRzhHeC9WQjJ2R2tMSWtOMTJ4N054NmdtY3JsSWNh?=
 =?utf-8?B?L3VGSVA2eUxNc012SExSVzAweXd0c2NGQVpESitReHF4VWdtMnl6WGNGa2Yw?=
 =?utf-8?B?TUlzcUdadmxUbEthNlp5RHhOa3luRVRST2FwYnBtMjRVbW9XZ3BDRmRYb3hv?=
 =?utf-8?B?Z2FCRlJnZWdKRUQ0TEtYTEgzOXBScDNlM3JPdE5aRktMMlRJdEp3TTdzYmp3?=
 =?utf-8?B?Y3VHTlhTTytXQ1lSM2FUQT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RlJvdTRRWTdCQmFveUQyeXVKU2tEN3l4SVdxYU4xVHg5T0g5ZnhRS21KbTRH?=
 =?utf-8?B?OU1KZzRCQzJMUHMzSXpDQUEvZXl3blBFRTVOTVVDVXVTRXdaeEhJRWwxM1lv?=
 =?utf-8?B?RCtRRHJiOVRTdXIwSVRyQ0xhNEZJS1RWU2pBYlRvZ0J1cTF3T0NEbURNL2Nm?=
 =?utf-8?B?eDJPREdsRzJaanR6ZVE2KzA4YVpZRFZNTzBmbjRWSUhkQmpibG9BeUdnMjVq?=
 =?utf-8?B?eFFhV1FZYWFHSzF0WW9iS0xDN2dNcXNEZGc0MDFyakh1TzZScFFlbE9HTng4?=
 =?utf-8?B?dDJscTlrUVNxMVkrb1FOZVByMjU3U0l1VDd5K3ZiVVBVK0NLSWM4MkxPZ3VN?=
 =?utf-8?B?WDkvSXFuZklPUCtpdm1JM2VNWmc2SmZ2RU8rQ0ZsVGdKSTkxS0pBQW10WW41?=
 =?utf-8?B?azNzYXlpNkJQVXk0NFhGTVhyaGZpeGVMU3J3RFhCbWlyaGNTUFpFVjJxZnp2?=
 =?utf-8?B?NGF6ZUc3ZHdTRTFVN0xtc2ErbElreDRDdnNPSC9wU2QxNnNLSE1haG5nNUhh?=
 =?utf-8?B?bk8rdksrdTRqNitBL0JFOUVPSUpaQkdWblFhUldvWW9BR3AyUmJ6cTZYUHpF?=
 =?utf-8?B?ZDZqOFNrT1ZOWUtYV2xSVmQrY0pzTTIzdW8rcDZwNHlaSTF6TFhVL1BrTURK?=
 =?utf-8?B?TXBlWVZITndIbVg5SDhtckI4TzN6ODNqR3EzWEcrWDI3OFMrWitqNHAvU3Jy?=
 =?utf-8?B?UUwrT0RKdmorcGtHbDVjYklaY3F3N25GSWRLQ0ZUVlNxeG5YNUFCZmRrVnRG?=
 =?utf-8?B?eHV6TUtTVHloQmNTUUlHRUIvSnRhM0ZuUHNhT2luREZaUlhtN3BvM044UlZy?=
 =?utf-8?B?eDI2ckx5SElOS0NIU29nN0ZYeG9ROHk2Q0JpbkgybW40bWhKK1ViTGZXWmJq?=
 =?utf-8?B?eHJGUjVteCtyaWZuTHQrZFBTbXg1d0VkUnZuL1prR1g1RzcyWTdWODJFQ3dp?=
 =?utf-8?B?R0dKaTF2UFpOZE9rUGtCQXE4UFRZM3l2SThrS25aQTZQaEJLYitmMFhKMnE1?=
 =?utf-8?B?Ty9KZVRPMktNRjRKZ25UMTdkblpYZUVDVHJVUDRJWSszcXdndUdKMHpGdElG?=
 =?utf-8?B?dWZlU3h4WjA1bnZGUDhoQUFoUWl5UWR2SDVscGtFbjRhZVljVEhyNEVpVy9S?=
 =?utf-8?B?alNhSGxVVkcxd2tWN0xFQm9BTk9SSnFLcEZpVUxZNmpGaWNxTU1DRUd5cHFv?=
 =?utf-8?B?UUwzRHZHUzREWHR6L1lWNnBielQxNjBhWE9aZjJwNlNsdFg5RzVHaEhwdEtm?=
 =?utf-8?B?VGw3TVFTbVRMbks4cTVESjVhWVoyMldWeXFteStCMm13bjZ3VDc0UVRyTlh5?=
 =?utf-8?B?cFJacnkvSXRnczhCaVoyb2IzN1NXSUMweDdJT3cvd0x5RFFaTnl6cHBSREc5?=
 =?utf-8?B?ajFVY1ByZU5KdTJRUnFyQ3hvSWdDdlE0YkxzUHdlNU4xVFIvUnlLTzJTaXFs?=
 =?utf-8?B?ZHZCazIxMFhuQldGNlp3dnpiRXhUUmdiNFVnUE43L3NtemxPOENUa0duK3Zo?=
 =?utf-8?B?UElBUVppTkMydytUd0FqTlRFeGRHQUV6ZXgzcEtITTM4UEtTaTNOazVPWlVt?=
 =?utf-8?B?REZpWnZ2ZmNDVzF4NG5FalBoS1pjcnFlcXhpVGdtWkpla1dLcjhWVUZ4THlt?=
 =?utf-8?B?TkpScm9Ca3VCeGtJbllsMFAxZnQ0b3UwYkF2YU9naUNicTl5aVRadWxSaUVz?=
 =?utf-8?B?ZnFDSmRYYWhzSHBVMHlpL0FGMVhiZ3V6N3dxOE1BL3VGcmttMW56QjhnU0xm?=
 =?utf-8?B?cUpKZGkrdDVSK3MvVE12Y2RycHcvZTJyL2RwR3hzTWJrd29tMXpoZkdHSVlC?=
 =?utf-8?B?ZmN2QXkvWlZxejd4bytYZC9JeXZnN3hoUG1GSHBIMy9Vd0NTWFJnZ3BUNC8v?=
 =?utf-8?B?MFQ2SE5jOWtwMmhLcWUxaDZGM3JSTzVXYXRKTW1HQyt0dERsaVlqT05GSGhi?=
 =?utf-8?B?eENsR3ZicXdwbElqa2RSOTVqRUFhYzNrckhBbEFlRnFmSURYMG5ybkgwYXFh?=
 =?utf-8?B?dEJSSlhjNzVKWm4vU0RYdFhESHZOZCs2SGRwcHJTVmlDa1pCbGx5Vm9UNGFL?=
 =?utf-8?B?SVpHbUhTM1U2eXMxNkNpUUwwZ2E1OWZxdmNQTGtOdUtBU2JWd3RFaTA2T0NK?=
 =?utf-8?Q?lPrkFwlgQd553EPb6ZWXHwmPK?=
Content-ID: <7EF250472E056744A408DFEEF3E081FA@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c120a28f-d88f-4a6c-b15d-08dce9951342
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2024 01:36:06.1773 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yrqIGcNyRPPOsjQ0pWtljnPnD3yp7o+Hu0KESg/zabz7dIp96gmgVIf+CAh1qvqtxUrNSJy6eQTZ6EgrEg3sbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7470
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_007_109038560.124939564"
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

--__=_Part_Boundary_007_109038560.124939564
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFNodS1oc2lhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMC0wOSBhdCAxOToxNSArMDgwMCwgU2h1
LWhzaWFuZyBZYW5nIHdyb3RlOg0KPiBJbnRyb2R1Y2VzIHN1cHBvcnQgZm9yIHRoZSBzZW5zb3Ig
aW50ZXJmYWNlIGluIHRoZSBNZWRpYVRlayBTb0MsDQo+IHdpdGggdGhlIGZvY3VzIG9uIENTSSBh
bmQgc3RyZWFtIGNvbnRyb2wuIFRoZSBrZXkgZnVuY3Rpb25hbGl0aWVzDQo+IGluY2x1ZGUgcGFy
YW1ldGVyIGNvbnRyb2wsIG1ldGVyaW5nIGFuZCBtYWludGFpbmluZyBzdGF0dXMgaW5mb3JtYXRp
b24sDQo+IGludGVycnVwdCBoYW5kbGluZywgYW5kIGRlYnVnZ2luZy4gVGhlc2UgZmVhdHVyZXMg
ZW5zdXJlIGVmZmVjdGl2ZQ0KPiBtYW5hZ2VtZW50IGFuZCBkZWJ1Z2dpbmcgb2YgdGhlIGNhbWVy
YSBzZW5zb3IgaW50ZXJmYWNlIGhhcmR3YXJlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogU2h1LWhz
aWFuZyBZYW5nIDxTaHUtaHNpYW5nLllhbmdAbWVkaWF0ZWsuY29tPg0KPiAtLS0NCj4gIC4uLi9p
c3BfN3gvY2Ftc3lzL210a19jc2lfcGh5XzJfMC9NYWtlZmlsZSAgICB8ICAgIDUgKw0KPiAgLi4u
L210a19jc2lfcGh5XzJfMC9tdGtfY2FtLXNlbmluZi1jYW1tdXguaCAgIHwgIDkxMSArKysrKysN
Cj4gIC4uLi9tdGtfY2FtLXNlbmluZi1jc2kwLWNwaHkuaCAgICAgICAgICAgICAgICB8ICAgNjkg
Kw0KPiAgLi4uL210a19jYW0tc2VuaW5mLWNzaTAtZHBoeS5oICAgICAgICAgICAgICAgIHwgIDEz
OSArDQo+ICAuLi4vbXRrX2NhbS1zZW5pbmYtaHdfcGh5XzJfMC5jICAgICAgICAgICAgICAgfCAy
ODc5ICsrKysrKysrKysrKysrKysrDQo+ICAuLi4vbXRrX2NhbS1zZW5pbmYtbWlwaS1yeC1hbmEt
Y2RwaHktY3NpMGEuaCAgfCAgMjU3ICsrDQo+ICAuLi4vbXRrX2NhbS1zZW5pbmYtc2VuaW5mMS1j
c2kyLmggICAgICAgICAgICAgfCAgNDE1ICsrKw0KPiAgLi4uL210a19jYW0tc2VuaW5mLXNlbmlu
ZjEtbXV4LmggICAgICAgICAgICAgIHwgIDE0NyArDQo+ICAuLi4vbXRrX2NzaV9waHlfMl8wL210
a19jYW0tc2VuaW5mLXNlbmluZjEuaCAgfCAgIDQ3ICsNCj4gIC4uLi9tdGtfY3NpX3BoeV8yXzAv
bXRrX2NhbS1zZW5pbmYtdGcxLmggICAgICB8ICAgNDkgKw0KPiAgLi4uL210a19jc2lfcGh5XzJf
MC9tdGtfY2FtLXNlbmluZi10b3AtY3RybC5oIHwgICA5OSArDQoNCk1vdmUgdGhlIHBoeSBwYXJ0
IHRvIHBoeS9tZWRpYXRlay8gZm9sZGVyLiBZb3UgY291bGQgcmVmZXIgdG8gcGh5L21lZGlhdGVr
L3BoeS1tdGstbWlwaS1jc2ktMC01LmMNCg0KUmVnYXJkcywNCkNLDQoNCg0K

--__=_Part_Boundary_007_109038560.124939564
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtTaHUtaHNpYW5nOg0KDQpPbiYjMzI7V2Vk
LCYjMzI7MjAyNC0xMC0wOSYjMzI7YXQmIzMyOzE5OjE1JiMzMjsrMDgwMCwmIzMyO1NodS1oc2lh
bmcmIzMyO1lhbmcmIzMyO3dyb3RlOg0KJmd0OyYjMzI7SW50cm9kdWNlcyYjMzI7c3VwcG9ydCYj
MzI7Zm9yJiMzMjt0aGUmIzMyO3NlbnNvciYjMzI7aW50ZXJmYWNlJiMzMjtpbiYjMzI7dGhlJiMz
MjtNZWRpYVRlayYjMzI7U29DLA0KJmd0OyYjMzI7d2l0aCYjMzI7dGhlJiMzMjtmb2N1cyYjMzI7
b24mIzMyO0NTSSYjMzI7YW5kJiMzMjtzdHJlYW0mIzMyO2NvbnRyb2wuJiMzMjtUaGUmIzMyO2tl
eSYjMzI7ZnVuY3Rpb25hbGl0aWVzDQomZ3Q7JiMzMjtpbmNsdWRlJiMzMjtwYXJhbWV0ZXImIzMy
O2NvbnRyb2wsJiMzMjttZXRlcmluZyYjMzI7YW5kJiMzMjttYWludGFpbmluZyYjMzI7c3RhdHVz
JiMzMjtpbmZvcm1hdGlvbiwNCiZndDsmIzMyO2ludGVycnVwdCYjMzI7aGFuZGxpbmcsJiMzMjth
bmQmIzMyO2RlYnVnZ2luZy4mIzMyO1RoZXNlJiMzMjtmZWF0dXJlcyYjMzI7ZW5zdXJlJiMzMjtl
ZmZlY3RpdmUNCiZndDsmIzMyO21hbmFnZW1lbnQmIzMyO2FuZCYjMzI7ZGVidWdnaW5nJiMzMjtv
ZiYjMzI7dGhlJiMzMjtjYW1lcmEmIzMyO3NlbnNvciYjMzI7aW50ZXJmYWNlJiMzMjtoYXJkd2Fy
ZS4NCiZndDsmIzMyOw0KJmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO1NodS1oc2lhbmcmIzMy
O1lhbmcmIzMyOyZsdDtTaHUtaHNpYW5nLllhbmdAbWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYjMzI7
LS0tDQomZ3Q7JiMzMjsmIzMyOy4uLi9pc3BfN3gvY2Ftc3lzL210a19jc2lfcGh5XzJfMC9NYWtl
ZmlsZSYjMzI7JiMzMjsmIzMyOyYjMzI7fCYjMzI7JiMzMjsmIzMyOyYjMzI7NSYjMzI7Kw0KJmd0
OyYjMzI7JiMzMjsuLi4vbXRrX2NzaV9waHlfMl8wL210a19jYW0tc2VuaW5mLWNhbW11eC5oJiMz
MjsmIzMyOyYjMzI7fCYjMzI7JiMzMjs5MTEmIzMyOysrKysrKw0KJmd0OyYjMzI7JiMzMjsuLi4v
bXRrX2NhbS1zZW5pbmYtY3NpMC1jcGh5LmgmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3wmIzMyOyYj
MzI7JiMzMjs2OSYjMzI7Kw0KJmd0OyYjMzI7JiMzMjsuLi4vbXRrX2NhbS1zZW5pbmYtY3NpMC1k
cGh5LmgmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3wmIzMyOyYjMzI7MTM5JiMzMjsrDQomZ3Q7JiMz
MjsmIzMyOy4uLi9tdGtfY2FtLXNlbmluZi1od19waHlfMl8wLmMmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjt8
JiMzMjsyODc5JiMzMjsrKysrKysrKysrKysrKysrKw0KJmd0OyYjMzI7JiMzMjsuLi4vbXRrX2Nh
bS1zZW5pbmYtbWlwaS1yeC1hbmEtY2RwaHktY3NpMGEuaCYjMzI7JiMzMjt8JiMzMjsmIzMyOzI1
NyYjMzI7KysNCiZndDsmIzMyOyYjMzI7Li4uL210a19jYW0tc2VuaW5mLXNlbmluZjEtY3NpMi5o
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjt8JiMzMjsmIzMyOzQxNSYjMzI7KysrDQomZ3Q7JiMzMjsmIzMyOy4uLi9tdGtfY2Ft
LXNlbmluZi1zZW5pbmYxLW11eC5oJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3wmIzMyOyYjMzI7MTQ3JiMzMjsrDQom
Z3Q7JiMzMjsmIzMyOy4uLi9tdGtfY3NpX3BoeV8yXzAvbXRrX2NhbS1zZW5pbmYtc2VuaW5mMS5o
JiMzMjsmIzMyO3wmIzMyOyYjMzI7JiMzMjs0NyYjMzI7Kw0KJmd0OyYjMzI7JiMzMjsuLi4vbXRr
X2NzaV9waHlfMl8wL210a19jYW0tc2VuaW5mLXRnMS5oJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7fCYjMzI7JiMzMjsmIzMyOzQ5JiMzMjsrDQomZ3Q7JiMzMjsmIzMyOy4uLi9tdGtfY3Np
X3BoeV8yXzAvbXRrX2NhbS1zZW5pbmYtdG9wLWN0cmwuaCYjMzI7fCYjMzI7JiMzMjsmIzMyOzk5
JiMzMjsrDQoNCk1vdmUmIzMyO3RoZSYjMzI7cGh5JiMzMjtwYXJ0JiMzMjt0byYjMzI7cGh5L21l
ZGlhdGVrLyYjMzI7Zm9sZGVyLiYjMzI7WW91JiMzMjtjb3VsZCYjMzI7cmVmZXImIzMyO3RvJiMz
MjtwaHkvbWVkaWF0ZWsvcGh5LW10ay1taXBpLWNzaS0wLTUuYw0KDQpSZWdhcmRzLA0KQ0sNCg0K
DQoNCjwvcHJlPg0KPC9wPjwvYm9keT48L2h0bWw+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHBy
ZT4qKioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioq
KioqKioqKioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVz
c2FnZSAoaW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBw
cm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9z
dXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXll
ZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5h
dGlvbiwgDQpkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0
aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJl
Y2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4g
SWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBi
ZWxpZXZlIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxl
YXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMg
ZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNs
dWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNj
bG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFu
ayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_007_109038560.124939564--

