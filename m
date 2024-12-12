Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5FD9EFAD3
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 19:24:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 086AE10E644;
	Thu, 12 Dec 2024 18:24:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="SdlJ8oJE";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="Plk4VTny";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D46B310E644
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 18:24:32 +0000 (UTC)
X-UUID: 530bad70b8b611ef99858b75a2457dd9-20241213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=remgq7rBoLlDsd5hMvm9q7YR6PvCvYvm1Ey6wAr/3gQ=; 
 b=SdlJ8oJEebsJZt8v6ue4zXWRulnZWK2JM4cFwQ+1VVawDboTWW+INVNt9tmEcs4Fx9aFNhGat7vPeXdmrz1fTLjAC2bDJd2J2QE23oLDx3dujITL7xyiUZWatJjow1odn7PY3koExZOF/3Rassy3m3+bMK4dVEngjtyTrc4gAjQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45, REQID:7e004d67-5930-43a0-8e23-bc192093c9c5, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6493067, CLOUDID:545d0a13-8f5d-4ac6-9276-7b9691c7b8d6,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
 :-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
 ,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 530bad70b8b611ef99858b75a2457dd9-20241213
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1589393851; Fri, 13 Dec 2024 02:24:28 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 13 Dec 2024 02:24:27 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 13 Dec 2024 02:24:27 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jQx+PPVIiAMVsuTo7woOb3xAl6OY7KGrc1OgwaPfrVgxD4BIKrFkkD+d2J4wATnVbCtVb6PrZ/qbrUpPK9qnyMzFWYxvsAhBVUjE4NNkAXuhyocD6wLltUhqsffya3PviVJXorqHmhIdpNoVvLjyxd94QTXaCY6BDWNZo2g94dbwJLVOXuIJA+/X1EUPqb5516WT/c2i7AkKmxIJL/mwTg+DqkojA/q3W5jaQOIvNshgG9sqXe5nsPrB98MlMD3nAu04UcYJwbs2qq3TBxYpz9UqxBcPwssgEIHRFQscKVmwZRbIkqZzKRgwf/tcl4u1ZcOy5KPrAnGgG8OSC3syTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fwasu58NkMx9/yoM7lnGSxNKqf85r3rhs2fLt1++nPM=;
 b=yd9snUAlVyaayh+8xC+6UK6cONxXubUDRljXmGwZRLZG9Ypor6a+u5lAYPuIL6CuyIdSJe2dAjY1dBVUpc5dsADnfsq2St7r70XxeV4iqQHVx95O/UiPh9YuYlL8QZzRpyj/X/a3cOWwlHSYPnrxY+mRuRgAySl4g5j7HAK/HWE4fMSdblFww99vWE97Bb4EJhe362w9RyCfUGQD5IPpXmySzIzW1DpPDwlCMXIJ0XRZS4JiSJvxWcfOB8lSlICRmN7zIw/hwNNfap9p3vkcLDo3dJCBmsgkKvC930FxQ3Si/9NnI4w5MuT18odeGnvV4RXvXthvsnngCX/4aoM3rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fwasu58NkMx9/yoM7lnGSxNKqf85r3rhs2fLt1++nPM=;
 b=Plk4VTnybaAGQheQvNUkcRJas1tomiOt/HS9eII/VdOyJ+jmhhLobZK1U2nyPcCLD0dGx3QDJXC497CknPQIHp04FttAWE6wuCviy96LmWrNEJWC9zH1TFV2+CXJGLMNey+/1O3mBUK46RFyB1m2T8I2ASSMWR++r1Yw3fOcg24=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by OSQPR03MB8398.apcprd03.prod.outlook.com (2603:1096:604:277::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Thu, 12 Dec
 2024 18:24:25 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%5]) with mapi id 15.20.8251.008; Thu, 12 Dec 2024
 18:24:25 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "fshao@chromium.org" <fshao@chromium.org>
Subject: Re: [PATCH 2/2] dts: arm64: mediatek: mt8188: Update OVL compatible
 from MT8183 to MT8195
Thread-Topic: [PATCH 2/2] dts: arm64: mediatek: mt8188: Update OVL compatible
 from MT8183 to MT8195
Thread-Index: AQHbTKtPbnmu4O4qiEy/9nzOUMyN3bLixgSAgAAmyQA=
Date: Thu, 12 Dec 2024 18:24:25 +0000
Message-ID: <8c30716c526fd3748b6891df864eadd9c2194247.camel@mediatek.com>
References: <20241212153344.27408-1-jason-jh.lin@mediatek.com>
 <20241212153344.27408-3-jason-jh.lin@mediatek.com>
 <6710abd1-128d-48ff-84a1-880053fd9e84@collabora.com>
In-Reply-To: <6710abd1-128d-48ff-84a1-880053fd9e84@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|OSQPR03MB8398:EE_
x-ms-office365-filtering-correlation-id: 151ed949-a84f-43f8-c826-08dd1ada3500
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?a0RIUko3VmR5dXpmYjRMdVNQd2tLbzNIS1U2M1JzMzNUVnliNnNPSVZyZnBG?=
 =?utf-8?B?ZWs1OWJLOTV5VzZEK2tRc1VjcUpFZFNjblU1ZXpXdnlrc3RCb1M5Rjd1RHpK?=
 =?utf-8?B?QUFKT3ZpNlJ1REZtQSszejBzUEhiUndFbzQ5U3ZVdU8vNG1JMzkyUHBDUGVh?=
 =?utf-8?B?N0dCdmlFR3o3MnNNZTJ2TXBmL2ZtM1dBTHZLOFJSNmZqdjZPei9WQU9BTTEw?=
 =?utf-8?B?ZjdRUnNDOW5UU0FFcDVnY2g1MDIrdmIyWFJMMjlGUXNGSTlCMk55ZGM5c1ZM?=
 =?utf-8?B?SVRyUTFVci9BMG05Wk14azQ4dFRTbU1KWlV0MGZqM1prbWtPY2ZMdEthU2hF?=
 =?utf-8?B?cW8yREM3NVdXWm9RQWY4c1FBU2podjhQUUtxWmtLaVJ3VGRGREppdFZ1aHY3?=
 =?utf-8?B?c1RHdEZYcEVGa3FxQitqY2ZUQi9hRWNXVTdlUElVR1o3ZGhEQ2o2bVVOUTBV?=
 =?utf-8?B?THk3Ym1RWnRaVHZVQWozMGZNT1NwZmJIUjdyM2pwUVVOQmUvaGFjWXg5clo5?=
 =?utf-8?B?WWlQNFF1QVBJd05xMzlROGxwQlFiK3dOQlRBdVRwSkM3c3Q1djlKUEwvdnkv?=
 =?utf-8?B?MVgzemppQk1vNDlqRlNMZUhxY2Z6UlFLYXovbnhqak9DaVhON1NlZDV1VTVW?=
 =?utf-8?B?QVkwajcyOTNCY2hhVW9DQk13ZXYxa1VSK1JPVm1VNG45amh6SjNCblY3eFl6?=
 =?utf-8?B?TmwrUmJiSE1oOHhpcmlyT3FVM3FudzkzNU44LzVwblFLSTN1SGh6TzVtRHhh?=
 =?utf-8?B?MG9UWVI3ekJwMDVza2hCU2FIdGxjbDd1aXVNcjhLRzZPVWdvb0pxbGhRWHR0?=
 =?utf-8?B?V2h0c1drSThpTDI1ZVkwZ1llbXpzRWVHNmJ4T2NOejJsSGF6dTdIdmgyN2E1?=
 =?utf-8?B?OEpWMmhXZjlaZERESG9vYnBNeGpmOUxuOXNUanlTVGowS1J2dWpHU0ZkamND?=
 =?utf-8?B?ekErdm5MMDBWb1JnbW9SZlB5YUhvbkVySnlzUzB4Y21vbzhEb3ZXNm85TFdJ?=
 =?utf-8?B?R1hSaUVlQlNGNXc0cnNIZ2QzRlVFNzlLVERiMHY4aHZod2FPNHY0TEEvcU5x?=
 =?utf-8?B?T2N2VkRpbGNCYnJmVnZpSzRGOWl1Q0ZTSDlUclV4MEZxL2plOFM0Y0IrWm9L?=
 =?utf-8?B?eWtaUVc2eUtWZi9UdUdhb2VhS3BOak1icTIyUzMrZld4UGI4MEVjOU42K01n?=
 =?utf-8?B?WldPUkZYamVPbGVyL2NCSzlicG51YU0rSTNFcjh6K2o5MDdDRFZqQ2kzcFJx?=
 =?utf-8?B?VWFmU2tBcDdaOUhMdkNiVGQ0V2thWDFNVFBQempzdVNVMzdFSkFpL0pISlNs?=
 =?utf-8?B?OEtWZEZ4ZXl1WjNoNXo0cHJjM0dBczcwN21ZOGQ2R0NPVjRqU29TNklJSE9N?=
 =?utf-8?B?Zk5yTUVPT0F6c1IvSm1wRExhK0Y3RGNKclAzak9UeW85VndnSUFTVmRMd3k2?=
 =?utf-8?B?a0N6cGcyUXp1ejZyY1dYQ1RKY0NDVkZBTWIzWTRob2oyeDhMbVVUbnlFMjAv?=
 =?utf-8?B?RWVhWHNlLzNjMk5jUDE0M3Y0WXp5QkxFQ0w4b3p1U0p1YU5xWkY2Q0tpTUgw?=
 =?utf-8?B?b21EZmgrOFJwQzVGV1lwUDBxSDhlbmZVRFozalJZSXV1SzZUQUFDY0E4NWNh?=
 =?utf-8?B?OHprcHVuUlRPdlpFc1gvb0o2T213RnVjKzJLMGtFQjVNMGFUMXBEVE41MFpq?=
 =?utf-8?B?L1JuYkhtUjhzRTdXL1V6UENrNE1veDlPdXc5RDdwbXpiM09Dc05nU2gvTDI5?=
 =?utf-8?B?RXplekJYYWdwOTFSTXpYZmw2U290Q1V0U0tiNTl0a205M01uRkd3Zk9sY284?=
 =?utf-8?B?UWh0OWVSNUJuVlFMMEhRek5aaGo1OVFoTlBJL1ZBSDh4SkttZWdHcVJ6dFdq?=
 =?utf-8?B?dDE2Rm5HSUsrTWQ1OVpJWndGdVcvTUdoYU5ueXhvSExaTjlqcGRqa05vRXN0?=
 =?utf-8?Q?BOZxhioVVGG1wB/n/hRlyzPjU8hy43ZJ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TmZaNVFLNitlOThzU0NXcG9iWUpRNXFkenVucFN1UFBTTUwzeStZb1dIenZl?=
 =?utf-8?B?RDFOSm9TeFdUczRJT1B4VXBLQXNZUGVIbFpKRzVrTTc0bHhpdFhXcE9qcUYx?=
 =?utf-8?B?czFjQi9uU3Y3QWQwYThRVlFTeExrRUUrR3R4ejB3di9FVzFPdDlicjlOTG91?=
 =?utf-8?B?a1dVajJlZEh3aVBFTU0veFRCYk9ZaHQxWWZaUng1S3l1TmFsbksrcWJWd1FG?=
 =?utf-8?B?bndsU2l3S3VsbGlWM3RUc0RFZ2F1TWtVUFd4eEVNaDRBQmpqUHVEOTdwWHEz?=
 =?utf-8?B?QkNaamJ3aUtROGhkSXIrSGNOZlcyR05RQXRGYXFFWlpVZ00ySlFoSkVzZzJG?=
 =?utf-8?B?VHdrSG9iNzY5bFJZaHAweFMvL05HUEJCZFlxVHdOMG5meTVId1AyVmVHOCsz?=
 =?utf-8?B?Nmp4WVhxY2tORXBnWldRUzJhMERWcnFpdWJkNmtlVlBUNVAxNmNQQmZRUlQ3?=
 =?utf-8?B?ZmFiZ0lNcFArRTVRN1lUZlN3ek4wZ2pCQkhkT1VFVWloMnM1dGVQTkp6TWRJ?=
 =?utf-8?B?aG5neG9ZNCtDWUpRdTVzaDhKbHpXOWNtdUF0VzRERk83c1VvbFVQamlVKzk4?=
 =?utf-8?B?QjVNaEc2cVNiMlpXdk81ZXBoTDFDc2MyWVB5OGJ5eVV6K3JvamwwKzQ4a21D?=
 =?utf-8?B?d0lCYThyWmtkT1ljdlZXNHV1SHJZUEl6VWQ3MFJSdmJnTkF5WGQ5YS9hUzZF?=
 =?utf-8?B?STNGenhFb2hHYTc4U0NSamE1ZUVLVHNyR3c1bWFCZ3FQMEVueWpUZUUxd0p2?=
 =?utf-8?B?dWtFTTQxZmp2NmhSNGROcS9xcy9zc0o3c1RFNDV1ZGMydHJ5eFd6YXk4aS9o?=
 =?utf-8?B?U3Z0NTZoeE1yWktWWXBOUlpOVHFOMm02bGRsVHBwc3NMbnRqVDRvcWpJZlkz?=
 =?utf-8?B?SUFYcEFzOXk5VlZxcTgzR1FQN3dUbW5mclp5THYzcVdRNFdIbjhDdXZLV1BW?=
 =?utf-8?B?Q1BITWpSeGpsVWZnOTZvWm9PSVpuTFRJR01ybG1jSTdZYmFzV2Z0Yy8vUkto?=
 =?utf-8?B?MElka0RocGhuQS9LNklKVy9zelgvOGdQaEJnZ2tKMTc0UFdRZ1VWWU81bzZu?=
 =?utf-8?B?RUxxVk5PRmJpSmlYd0tVcllNQmt5WXB0SGxzN3FBTFdaL2l2UExBTEZOVHA4?=
 =?utf-8?B?cWZzbkFCeHdmbzZhNzNxcEY5U1hJU2tlYTVvRlB6S2NjMFVPSGFmUHJCYlgw?=
 =?utf-8?B?ODhENjRNMExESkM3dHVBNHRocnFJQ1IweWtrSytnZ1kvQWRVYzc4UFFsTjJX?=
 =?utf-8?B?WTJ0V0FVUHM3Nk1hVzRza2puZDZrdW5SYWJqR1NjSy9rckdhMkRycC9GVFc5?=
 =?utf-8?B?YUMvU3hKdk1sdjYxUENKeWZrVklRaDZBUWV2VTJKVlNwd0ozbjhaeXFKNkJk?=
 =?utf-8?B?a3JKTTRjQWR3ZFcySGRrZGJRbmRteGhwd3VsdkFaZWRGZDVrcnhlcjBKTStY?=
 =?utf-8?B?Sm5xTkZHbmgxNmZ3aW8wVElyQ2tMMER5K2VrSG5NM2c2UFhOWXAyZUtvOE1H?=
 =?utf-8?B?SkJqTFRJaWlBcDE4bU90Sml4MU9oWEprVDVjelFqQ1lyYmttTDd2bEV6ZEVT?=
 =?utf-8?B?bXhNY3RxZnJXOXRMeDRLRkJqaXRVNlM3N3NWSmE1Y0MyU0VYSU9XaWZlelFa?=
 =?utf-8?B?VFgzUVZVVmgxSkRzTkJjRHB2b1hhWTJrclhTdTI5SlRPMG1NRG13eit2YkNt?=
 =?utf-8?B?bFBuenFvbXFHc3o3dFFjYXg3MkRlZUdodW9MUVNJdm50Vjl4a1k2TmV6THd1?=
 =?utf-8?B?UXJ5YzdyaGRKU1R4ai9FajlWRGsrMTVscG5wUTdEendHaDRhMnRzUWZrQnhE?=
 =?utf-8?B?UlEyMnJidS9yQm9wQ0ZVTmYvQXJ2MkNjVjBpN2NnLzV3QkpmWUpTMTdMM1FW?=
 =?utf-8?B?ekZTaFBLRGxqdDB2L2kvK2gwL3pzcTJERmxsN0w1R0pRTkRhUnNFOWFhUVlR?=
 =?utf-8?B?WGFBT09XQ3lzL1dsdDVDaC80b1QrbmlndmlPMjEreml6V2pic2F2cURpSFdk?=
 =?utf-8?B?YnI0dUNxSXJYdENsRnNTdndvT1c5a1FueXc1YmtCNFVMcmNJQ01kckxWVlBz?=
 =?utf-8?B?eWpic21SMDFXMWNoL0tKZjBkcEVybzJFVDlYcklkSmxtd0pqRi9BekJ4TXBR?=
 =?utf-8?B?OTVOUHI1MGlnbHVjeHdTdHJYWVBOcW5veGN2enhhTGZ1WnhXTVArUFZUZUl3?=
 =?utf-8?B?Umc9PQ==?=
Content-ID: <5D922BAEF6CADA4092099544865D70A4@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 151ed949-a84f-43f8-c826-08dd1ada3500
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2024 18:24:25.0332 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w+LDuXKAgQGKTRnxI3V6cvZbgcsNzBE+loVbZGO5D7K5WRR+/VfFhcfAt6Fd46A16IaMswq2LmXTjWLoXL99kTq4L5o2wKqPugF0h3NTZTI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR03MB8398
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_001_561891491.2015585231"
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

--__=_Part_Boundary_001_561891491.2015585231
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDI0LTEyLTEyIGF0IDE3OjA1ICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRl
ciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBJbCAxMi8xMi8yNCAxNjozMywgSmFzb24tSkgu
TGluIGhhIHNjcml0dG86DQo+ID4gVGhlIE9WTCBoYXJkd2FyZSBjYXBhYmlsaXRpZXMgaGF2ZSBj
aGFuZ2VkIHN0YXJ0aW5nIGZyb20gTVQ4MTk1LA0KPiA+IG1ha2luZyB0aGUgTVQ4MTgzIGNvbXBh
dGlibGUgbm8gbG9uZ2VyIGFwcGxpY2FibGUuDQo+ID4gVGhlcmVmb3JlLCBpdCBpcyBuZWNlc3Nh
cnkgdG8gdXBkYXRlIHRoZSBPVkwgY29tcGF0aWJsZSBmcm9tIE1UODE4Mw0KPiA+IHRvDQo+ID4g
TVQ4MTk1Lg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEphc29uLUpILkxpbiA8amFzb24tamgu
bGluQG1lZGlhdGVrLmNvbT4NCj4gDQo+IEphc29uLCBqdXN0IHNvIHlvdSBrbm93IC0gSSBoYXZl
IHBhdGNoZXMgaGVyZSBhZGRpbmcgRFNDIGFuZCBtZXJnZQ0KPiBjb21wb25lbnRzIG9mDQo+IFZE
TzAsIG90aGVyIHRoYW4gYWxsIE1EUDMgY29tcG9uZW50cy4NCj4gDQo+IFRob3NlIGFyZSBhbG1v
c3QgcmVhZHkgdG8gc2VuZCwgSSBvbmx5IG5lZWQgdG8gZmluaXNoIHNvbWUgdGVzdGluZw0KPiBi
ZWZvcmUgOy0pDQo+IA0KPiBGb3IgdGhpcyBvbmUsIGFueXdheToNCj4gDQo+IFJldmlld2VkLWJ5
OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8DQo+IGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVn
bm9AY29sbGFib3JhLmNvbT4NCj4gDQo+IA0KPiA+IC0tLQ0KPiA+ICAgYXJjaC9hcm02NC9ib290
L2R0cy9tZWRpYXRlay9tdDgxODguZHRzaSB8IDIgKy0NCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9hcmNo
L2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE4OC5kdHNpDQo+ID4gYi9hcmNoL2FybTY0L2Jv
b3QvZHRzL21lZGlhdGVrL210ODE4OC5kdHNpDQo+ID4gaW5kZXggZmFjY2M3ZjE2MjU5Li4yM2Vj
M2ZmNmNhZDkgMTAwNjQ0DQo+ID4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9t
dDgxODguZHRzaQ0KPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTg4
LmR0c2kNCj4gPiBAQCAtMjQ4OCw3ICsyNDg4LDcgQEAganBlZ19kZWNvZGVyOiBqcGVnLWRlY29k
ZXJAMWEwNDAwMDAgew0KPiA+ICAgICAgICAgICAgICAgfTsNCj4gPiANCj4gPiAgICAgICAgICAg
ICAgIG92bDA6IG92bEAxYzAwMDAwMCB7DQo+ID4gLSAgICAgICAgICAgICAgICAgICAgIGNvbXBh
dGlibGUgPSAibWVkaWF0ZWssbXQ4MTg4LWRpc3Atb3ZsIiwNCj4gPiAibWVkaWF0ZWssbXQ4MTgz
LWRpc3Atb3ZsIjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJtZWRp
YXRlayxtdDgxODgtZGlzcC1vdmwiLA0KPiA+ICJtZWRpYXRlayxtdDgxOTUtZGlzcC1vdmwiOw0K
PiA+ICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MCAweDFjMDAwMDAwIDAgMHgxMDAwPjsN
Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgY2xvY2tzID0gPCZ2ZG9zeXMwIENMS19WRE8wX0RJ
U1BfT1ZMMD47DQo+ID4gICAgICAgICAgICAgICAgICAgICAgIGludGVycnVwdHMgPSA8R0lDX1NQ
SSA2MzYgSVJRX1RZUEVfTEVWRUxfSElHSA0KPiA+IDA+Ow0KPiANCj4gDQo=

--__=_Part_Boundary_001_561891491.2015585231
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1RodSwmIzMyOzIwMjQtMTItMTImIzMyO2F0
JiMzMjsxNzowNSYjMzI7KzAxMDAsJiMzMjtBbmdlbG9HaW9hY2NoaW5vJiMzMjtEZWwmIzMyO1Jl
Z25vJiMzMjt3cm90ZToNCiZndDsmIzMyO0V4dGVybmFsJiMzMjtlbWFpbCYjMzI7OiYjMzI7UGxl
YXNlJiMzMjtkbyYjMzI7bm90JiMzMjtjbGljayYjMzI7bGlua3MmIzMyO29yJiMzMjtvcGVuJiMz
MjthdHRhY2htZW50cyYjMzI7dW50aWwNCiZndDsmIzMyO3lvdSYjMzI7aGF2ZSYjMzI7dmVyaWZp
ZWQmIzMyO3RoZSYjMzI7c2VuZGVyJiMzMjtvciYjMzI7dGhlJiMzMjtjb250ZW50Lg0KJmd0OyYj
MzI7DQomZ3Q7JiMzMjsNCiZndDsmIzMyO0lsJiMzMjsxMi8xMi8yNCYjMzI7MTY6MzMsJiMzMjtK
YXNvbi1KSC5MaW4mIzMyO2hhJiMzMjtzY3JpdHRvOg0KJmd0OyYjMzI7Jmd0OyYjMzI7VGhlJiMz
MjtPVkwmIzMyO2hhcmR3YXJlJiMzMjtjYXBhYmlsaXRpZXMmIzMyO2hhdmUmIzMyO2NoYW5nZWQm
IzMyO3N0YXJ0aW5nJiMzMjtmcm9tJiMzMjtNVDgxOTUsDQomZ3Q7JiMzMjsmZ3Q7JiMzMjttYWtp
bmcmIzMyO3RoZSYjMzI7TVQ4MTgzJiMzMjtjb21wYXRpYmxlJiMzMjtubyYjMzI7bG9uZ2VyJiMz
MjthcHBsaWNhYmxlLg0KJmd0OyYjMzI7Jmd0OyYjMzI7VGhlcmVmb3JlLCYjMzI7aXQmIzMyO2lz
JiMzMjtuZWNlc3NhcnkmIzMyO3RvJiMzMjt1cGRhdGUmIzMyO3RoZSYjMzI7T1ZMJiMzMjtjb21w
YXRpYmxlJiMzMjtmcm9tJiMzMjtNVDgxODMNCiZndDsmIzMyOyZndDsmIzMyO3RvDQomZ3Q7JiMz
MjsmZ3Q7JiMzMjtNVDgxOTUuDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMy
O1NpZ25lZC1vZmYtYnk6JiMzMjtKYXNvbi1KSC5MaW4mIzMyOyZsdDtqYXNvbi1qaC5saW5AbWVk
aWF0ZWsuY29tJmd0Ow0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtKYXNvbiwmIzMyO2p1c3QmIzMyO3Nv
JiMzMjt5b3UmIzMyO2tub3cmIzMyOy0mIzMyO0kmIzMyO2hhdmUmIzMyO3BhdGNoZXMmIzMyO2hl
cmUmIzMyO2FkZGluZyYjMzI7RFNDJiMzMjthbmQmIzMyO21lcmdlDQomZ3Q7JiMzMjtjb21wb25l
bnRzJiMzMjtvZg0KJmd0OyYjMzI7VkRPMCwmIzMyO290aGVyJiMzMjt0aGFuJiMzMjthbGwmIzMy
O01EUDMmIzMyO2NvbXBvbmVudHMuDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1Rob3NlJiMzMjthcmUm
IzMyO2FsbW9zdCYjMzI7cmVhZHkmIzMyO3RvJiMzMjtzZW5kLCYjMzI7SSYjMzI7b25seSYjMzI7
bmVlZCYjMzI7dG8mIzMyO2ZpbmlzaCYjMzI7c29tZSYjMzI7dGVzdGluZw0KJmd0OyYjMzI7YmVm
b3JlJiMzMjs7LSkNCiZndDsmIzMyOw0KJmd0OyYjMzI7Rm9yJiMzMjt0aGlzJiMzMjtvbmUsJiMz
Mjthbnl3YXk6DQomZ3Q7JiMzMjsNCiZndDsmIzMyO1Jldmlld2VkLWJ5OiYjMzI7QW5nZWxvR2lv
YWNjaGlubyYjMzI7RGVsJiMzMjtSZWdubyYjMzI7Jmx0Ow0KJmd0OyYjMzI7YW5nZWxvZ2lvYWNj
aGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tJmd0Ow0KJmd0OyYjMzI7DQomZ3Q7JiMzMjsNCiZn
dDsmIzMyOyZndDsmIzMyOy0tLQ0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjsmIzMyO2FyY2gvYXJt
NjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTg4LmR0c2kmIzMyO3wmIzMyOzImIzMyOystDQomZ3Q7
JiMzMjsmZ3Q7JiMzMjsmIzMyOyYjMzI7MSYjMzI7ZmlsZSYjMzI7Y2hhbmdlZCwmIzMyOzEmIzMy
O2luc2VydGlvbigrKSwmIzMyOzEmIzMyO2RlbGV0aW9uKC0pDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsN
CiZndDsmIzMyOyZndDsmIzMyO2RpZmYmIzMyOy0tZ2l0JiMzMjthL2FyY2gvYXJtNjQvYm9vdC9k
dHMvbWVkaWF0ZWsvbXQ4MTg4LmR0c2kNCiZndDsmIzMyOyZndDsmIzMyO2IvYXJjaC9hcm02NC9i
b290L2R0cy9tZWRpYXRlay9tdDgxODguZHRzaQ0KJmd0OyYjMzI7Jmd0OyYjMzI7aW5kZXgmIzMy
O2ZhY2NjN2YxNjI1OS4uMjNlYzNmZjZjYWQ5JiMzMjsxMDA2NDQNCiZndDsmIzMyOyZndDsmIzMy
Oy0tLSYjMzI7YS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE4OC5kdHNpDQomZ3Q7
JiMzMjsmZ3Q7JiMzMjsrKysmIzMyO2IvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgx
ODguZHRzaQ0KJmd0OyYjMzI7Jmd0OyYjMzI7QEAmIzMyOy0yNDg4LDcmIzMyOysyNDg4LDcmIzMy
O0BAJiMzMjtqcGVnX2RlY29kZXI6JiMzMjtqcGVnLWRlY29kZXJAMWEwNDAwMDAmIzMyO3sNCiZn
dDsmIzMyOyZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjt9Ow0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7
JiMzMjsmZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7b3ZsMDomIzMyO292bEAxYzAwMDAwMCYjMzI7ew0K
Jmd0OyYjMzI7Jmd0OyYjMzI7LSYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyO2NvbXBhdGlibGUmIzMyOz0mIzMyOyZxdW90O21lZGlhdGVrLG10ODE4OC1kaXNw
LW92bCZxdW90OywNCiZndDsmIzMyOyZndDsmIzMyOyZxdW90O21lZGlhdGVrLG10ODE4My1kaXNw
LW92bCZxdW90OzsNCiZndDsmIzMyOyZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtjb21wYXRpYmxlJiMzMjs9JiMzMjsmcXVvdDttZWRpYXRl
ayxtdDgxODgtZGlzcC1vdmwmcXVvdDssDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmcXVvdDttZWRpYXRl
ayxtdDgxOTUtZGlzcC1vdmwmcXVvdDs7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3JlZyYjMzI7PSYjMzI7Jmx0
OzAmIzMyOzB4MWMwMDAwMDAmIzMyOzAmIzMyOzB4MTAwMCZndDs7DQomZ3Q7JiMzMjsmZ3Q7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO2Ns
b2NrcyYjMzI7PSYjMzI7Jmx0OyZhbXA7dmRvc3lzMCYjMzI7Q0xLX1ZETzBfRElTUF9PVkwwJmd0
OzsNCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7aW50ZXJydXB0cyYjMzI7PSYjMzI7Jmx0O0dJQ19TUEkmIzMyOzYz
NiYjMzI7SVJRX1RZUEVfTEVWRUxfSElHSA0KJmd0OyYjMzI7Jmd0OyYjMzI7MCZndDs7DQomZ3Q7
JiMzMjsNCiZndDsmIzMyOw0KDQo8L3ByZT4NCjwvcD48L2JvZHk+PC9odG1sPjwhLS10eXBlOnRl
eHQtLT48IS0tey0tPjxwcmU+KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkg
Tm90aWNlICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGlu
IHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJl
IGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhl
bXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVk
IHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFu
eSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5n
IG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykg
YnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5
IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0
aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZSANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1h
aWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSBy
ZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0
aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwg
YW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90
aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_001_561891491.2015585231--

