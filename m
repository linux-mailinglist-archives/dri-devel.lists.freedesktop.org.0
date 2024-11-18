Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B01A9D0BAC
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 10:28:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB57110E46D;
	Mon, 18 Nov 2024 09:28:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="k8NR4qF1";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="WTHDlfkX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C3D510E46D
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 09:28:45 +0000 (UTC)
X-UUID: 7f8906f2a58f11ef99858b75a2457dd9-20241118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=qJSmqCgZ8Mzvxvt00SC3uUvpMmJI7SYw6sOzOfwUblw=; 
 b=k8NR4qF1llOO1l875Rvs4xoi1873A438dKz713XRFEu/Eiaz8pPT0dF5/IU0b3T2eKoLs1AY2xw/K0xSXR/Qc7qzgaOjym3k4x4yjg5GdTBU/wFTnTyDFeGlM3uyT0bqavP395xZaD5lNOaxsCiUC3iHqGrMeDGFqQdn4igscdQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44, REQID:3e1d0274-bb8d-453e-9591-df3143b47dd8, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:464815b, CLOUDID:93c4d05c-f18b-4d56-b49c-93279ee09144,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
 :-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
 ,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7f8906f2a58f11ef99858b75a2457dd9-20241118
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 829214092; Mon, 18 Nov 2024 17:28:41 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 18 Nov 2024 17:28:38 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Mon, 18 Nov 2024 17:28:38 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n2RvJZYz4lvgvdAwq5XjwhkWFA3HhsCT4ITgsuIgweiAN/Hlp3jvS8GAYWWop/vEpOPJeowReTBmnbFMpihZ14dBOxoYOp9VAcW6eCxiWxka1gu3zOpJ9XDoe7Cpv+F7GMUmV0JBiLJolc5QeD4J6M3gPf2Kd6LDICZeMQTVbEnGHWE7Vkz11SHV5BDjTZ+FU63Avu7zgu6DepepzrAuhWZSfriAf1iyzPLoy4BPO8ZUDkf0RE8qKZoE/z4uehQpWB6cNWkRw/0eSmdfIZ2qHLaTPnl8wEUWgy5WIgeTY0wZrCl0hZVbWOzu51J/jIsveodFoPbkK4UZRKd6c6f4bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tDyXH2CRLLNkj1Pd01DnYvdOFJS/+3T8lPUxqQOsfTk=;
 b=omGVTzo0vn0UCD49jBU9IZ6ElFtFwT03KPfsSYnXX2abCkTsp2LApKkuSOmabn74yRCXROzNk+FvcDN4iBmUF/dvbnpXp5xoC3WUc1NYiOXj5naC5LfFu26ie3Zfn5COFkL/UVfHottJZN2kG+HjU1xvsMtEEtcHY1k6mHuQsO1G6X8SbErm3JylRFpAZyGAJhjbeLC47Snw+Jwm8wgsKWQ2Es+ECGChj0DiXjYKKauPRk68+sm4MpQyuJQOZsNrhRusvIW++nufqhj2S+6EbpwR9iJakSEbmxOGTRPGrgV9hRMFJ02ZCSdlX5EsN5w53xSjiP3dbNGw5VTpon/kcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDyXH2CRLLNkj1Pd01DnYvdOFJS/+3T8lPUxqQOsfTk=;
 b=WTHDlfkX1L30Qz0bJehk8z/Oydxe2aqkHjlKZhF4zZZLSqe1IitTdPX1HAthAGAL8/5GC33HN+zNyEFYsA6J6iZteCZxmWdCN0UzsrxCEpFiDELBSaerv8SoEBW7Drzu52iTfYN6povDicBL1P3kLHWE0/PKplGC4Yx5+fBUhEo=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB8382.apcprd03.prod.outlook.com (2603:1096:101:21f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Mon, 18 Nov
 2024 09:28:34 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8158.017; Mon, 18 Nov 2024
 09:28:33 +0000
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
Subject: Re: [PATCH v1 03/10] media: platform: mediatek: add isp_7x seninf unit
Thread-Topic: [PATCH v1 03/10] media: platform: mediatek: add isp_7x seninf
 unit
Thread-Index: AQHbGj1K7oS5BpZAxk+Yfu5zQIUxBLK9A/6A
Date: Mon, 18 Nov 2024 09:28:33 +0000
Message-ID: <623643f37544eb3f9ba43e935e6aa946285c64cc.camel@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
 <20241009111551.27052-4-Shu-hsiang.Yang@mediatek.com>
In-Reply-To: <20241009111551.27052-4-Shu-hsiang.Yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB8382:EE_
x-ms-office365-filtering-correlation-id: dd4ea6c1-9b76-4085-11d5-08dd07b35f7a
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?SXlJK2NiT21FWlRLL1o0bkQ4NllkaUp4bXRvRGtkWkxFRjAyenlYdTViMEpa?=
 =?utf-8?B?cFNYb2Q4MDN2bjB2UDUwWmVTQnZxbjVOakdGa3FDVFdEOU00VXNpV2V4eXFT?=
 =?utf-8?B?dGlMQ25FckhpcU4wWEdwTzd5QU1jei9hYmpRSGpjMGJDVG1DSEZ2dlVkWGN0?=
 =?utf-8?B?a1Z3STBTSVZTNldMSm5lcnJCNDMzVGo4ZmY0VE1Ic2hKZFljUk11RTVGaUxU?=
 =?utf-8?B?SkpPV3ZZQjFDU294dm1lWm55T3ltbDdaR3YwUUZSZnQ5VHVGRVFPenRYS2JG?=
 =?utf-8?B?dUNuaW1MdUdLdTVLV3FLdjFIZjIxczhTQ3lnUUxWZ0I5Ym9qV0xRek9GT0NN?=
 =?utf-8?B?dlZCM2FWK3hLaEEyQlA3Z3dHRU9jYWh4NkRLU3dWK3pEeWJEeStwVS8zaEhs?=
 =?utf-8?B?dEQ1MFpBWHF0ZWtrK0QwZVhwNFdkRDB5QURqa0UvaUxVaEJxbzJkMk85RVBB?=
 =?utf-8?B?Q1dRYTR2TUlGV1N4RVJTcVlaTExUYXdlR1J3WEV4YlRKc1NmeXBtWW1OYkVL?=
 =?utf-8?B?N2tlbGkyOTg0Zm92OEw5VVZzRGNRa0NKbm5kVzBoSUQ3QnZOZy9kSHNxclMv?=
 =?utf-8?B?eGpzMGh6ZXBQS1J2OFQybjQrOFA1WUk0TW9Xb200MlJjN2NIb3RVUnBLSlVk?=
 =?utf-8?B?UHh0bFYzWURrRnV1OW5sSTFyUUcwVGNZS3VxOHlOS2FtbE5TZnRhelBwUExB?=
 =?utf-8?B?MmQvVUxnbWJ4eVRVcS9GMlJtSEtsbDVKbkh5MEVzdnM0cmdJbWpjNXVJVGV6?=
 =?utf-8?B?cnFhOWM2cVVDSHpzcjZXS21CTFcvZ2pZdk5hWDVpMGJFdmg1NTBZYVU1VEsy?=
 =?utf-8?B?VVplRnVyMXVpMHpHa2NPZXAvMzE2TWszcnZ1QjdsL3kvUHJURzYzSndmN0NG?=
 =?utf-8?B?MzhGb1l0Z0oyOEhZNkpScDVubktjanpDYTl0Y1R4d24raXBhVDRlLzMxUFE2?=
 =?utf-8?B?L3BjZUxEL1psdU0rOTJidUhBazU3amxnTU91SllKVC9Lb2V5TkhFN1Rtc3dS?=
 =?utf-8?B?aWpsZUcrVEtiU2xTbS8yTzRsWXhhNGNnL25pRVRma2pWNHJBbEtUWEZ5VmJi?=
 =?utf-8?B?MVc0OWtlVk1lSkRQMEVoOXpyQVFwODdhMkI4MGVvcXl6ZkRYeHFMN3UyVHZp?=
 =?utf-8?B?OFduMzh5L3MvWkVoVTdjdlJ0OXhqekkvdFpzWTZLNkcwK2JTUkpTaGpVNkJl?=
 =?utf-8?B?Z0lhdllVMzEvRm1rNitsMHR5VHlTdElwUDVGbDdMU2x5M0YxQVRMY1J4a01x?=
 =?utf-8?B?NU9RYllGWUlydkhZQVhrbjJ5c3NxYTJBVHJnWi95TDN0WmNKdEQrMVRJOUJZ?=
 =?utf-8?B?enpTT200L09XK2tPSDhmS3VKL1hyc25XUDJYTEJRMGo5eEI3elJzU3dlam85?=
 =?utf-8?B?K08vR1ZSUDBBRXU4V2xXTHF3M1didUsyRzFrK0FpMWxDa3Z5dlhUTlA2cmtH?=
 =?utf-8?B?UHN0eFpPcXVzd1AyVUI5R1BOdTFTTGFEUTFtNTU2ZFdVaDRROU5UbDhqQzQv?=
 =?utf-8?B?VkUvT3BJWTJJenBTNk9TS3ByNzY4UFlwZ25peDBrNGxEV2hiQnZyT1dBOEVj?=
 =?utf-8?B?cjl5MjR1SkRmTk1oWXZCekU0dkZ6eG9WcUNIMmlkcjMxdFFWdGYwOW5DWXNW?=
 =?utf-8?B?TmY1cllLN2Rwczk2YXVhUVU4V25FQ1FnOTdxSDl2blRSVDF6S2xiRTkyRklZ?=
 =?utf-8?B?dU9zRXk4M0E4Y1dyN2QxOXZpMTFmUmczZjFnOHAydkxkWFVoNXBvWTM0RnRk?=
 =?utf-8?B?Ti9hR3hEUzdhZVhrakRqMGErd2RKZm1EVWxDczkrVXc1ZWhMRFZ2cjZ1WTlM?=
 =?utf-8?Q?e2DAQSc6kTlm6rAD40+dhkHCmoSZeDHEcPVjA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QWg0RkloVmNxUVVnTFIxWEEyZVlYZk81N0ZENlZkTWVpYUs1YmMrbkFINm9F?=
 =?utf-8?B?Y2NaN1hHTmk2VHJOczhSZGd4YnlFRFlQUTY2Nmp6cHQxNFoxbTlha0J0akRs?=
 =?utf-8?B?akR1S1dBQXVOZ2xlc05HQkVyVzNZcTh0NVBUUXU3ZkFzU2FYcnVPOURjNHRK?=
 =?utf-8?B?MjUvTDBITnhQWXVMd3l4Y1Q4QUlGVmZGdEhLTDRySTJSSmFjalM4VHdnbXVB?=
 =?utf-8?B?QUM4UEZ6L2Q4cFdIckdxeGJsaGg5NEVYRTljRXM2c2lkZVloMkNDQXZNbzBp?=
 =?utf-8?B?cDRRd05GY2RYMCs1OTJobitLRy9ZWUQwZVpQSDcxOE5BVFFmc25MMXAvS0pp?=
 =?utf-8?B?VzdmeU5YMFo3ajFoNzRJTDRBOGV2MkhVa3BkdkNCTjAxN2tjYldab0l2T3FD?=
 =?utf-8?B?Q2N5cDFpaVRWYTRYaHpIbll6SVlwNzdGZW9SdndYc0hHZ015S04ya094MWJi?=
 =?utf-8?B?cFRadndiNlNybVZsY3RaMzAzTXZNcU5rMFVDQkc2aU92QmE5aDlpbEpydFVw?=
 =?utf-8?B?TGExTkpQWldKS1RwUktvMVVJUWVlYWx2U2Y5RTFSTGJ4UmZsOGVScHcrTUhS?=
 =?utf-8?B?cGltZUFFMi90clJDQWhnZDE5bGRJY2J2THI3VURoVTQ4UExnVVRNMDh3ZlhQ?=
 =?utf-8?B?b3Y1UGE0bmlVejdmVlYrY0JibGFOMTR4WS9BbXRWd0FUZFFoTWlUOFVDWk5Z?=
 =?utf-8?B?ZWtXdjhSbjZxNlM2elN2SmEwWGp2UWRkVC9IcTR5WHUrTzRJblBhSVhPazJD?=
 =?utf-8?B?N290aTRCUi9iWXZNSEgvc21zbEZHV28vZERsWm9weWp3VWhNSWUrUTljN0tW?=
 =?utf-8?B?RUI2N01QUnhGK2FXNFBBNUUyM1lpaEQ4VWtDM0N4WWlQc1oyTHdoS29YdHBo?=
 =?utf-8?B?cDRhOEpzS1VoWlB3bjJqMkZES2M2eExOc016RDJ5bVphTGNsVHJ6L1ZPTkJk?=
 =?utf-8?B?d3IxTDkwZ3ZXTDhXNTlxNU5CTy9kcXZ4VlB0d1hEa256MVh0MUQvc1JqZkl3?=
 =?utf-8?B?bzl2R1NuWWJZbjZVek9ETUtGckVHVDlyQzBvcHF3ck1PVlp4emI4T2hYMk1Y?=
 =?utf-8?B?WkRzYXRhR015Y2FDcGxVcC9SSXk0RFBGeEYwTE10Nm9MdHBiVjF6M2Y0d2ta?=
 =?utf-8?B?ckpvUUFqVnBGTEZuN05JQ2JBdjd5R0NjSUtHaURxRStDRnRYWUR1cXArTzRM?=
 =?utf-8?B?T1c3U3BTVlBEZHRvRXdMR04wZzR2RmZTKzNXWXVzMlVFWWYwRVArRVczajB3?=
 =?utf-8?B?NU00dEtGWTR5cFNHUmkwZDVKZHhmSklGc3JkUy9IRVFmd0V1WXBqNWNDa3FM?=
 =?utf-8?B?ZnArQWE5ZnhmeEQwL0JPMDJMaWhKbDNMdjFrQlg1TWhpaW9hejBiOWJ6aXh4?=
 =?utf-8?B?a1J2WEdQcFM3ZWEyRzVTZTdtSG9oL3ptS2hrajFYUzdOMEdOeFg2ZlNJYzg3?=
 =?utf-8?B?RGZNU2lnRFUvRitCaXlzeUFiWnBXQ2NtVnMyTUtVQUh6ei9nVlBpdDlkVXFB?=
 =?utf-8?B?eEk2MVVEZlc3d1F4VDhNOEJHeFFGRSthbzl0MVdEK2oxNFdObVNSb3JjM0k4?=
 =?utf-8?B?SSsxQklIL1lOa00yTVZ4VmgwT2lEYjRrSGtTTXIyKzBkcGpsYnA5UDNaczFM?=
 =?utf-8?B?aWF3OFlYamNnMVpkcUFlTXRMaWE3ZUs2Y05MbEdVc2dILzBuOWtHeGxqRjNP?=
 =?utf-8?B?T0p0YmtWVGs0ckNobW53SGs2WmhqaHRTbmlPVXh5aVZhZERqTlRGRnVTcGl4?=
 =?utf-8?B?Q0UxYm5kejEvczFmSVBvdHN4cWdqc0hRcGlLUzhGSnUreWd5QUhpZ3RuRTVS?=
 =?utf-8?B?ZGdYbzJBU0liNkVZZHMvVy96TWFnUVd0aWF2blhtcy92Z09QRytKTnRuOGVs?=
 =?utf-8?B?cnljVFlZQmY4eWViSVJuSGU1M1dqL2hSOWNhZklPRkhIZytuSHpMZXBtRVRn?=
 =?utf-8?B?SXFhTjVmMVpNbitoYTBKNG1nUXdVRTQ2U0kwbENmam9uTjRLSkYxSG8xQ3BG?=
 =?utf-8?B?MFNZYXN3QXBsQjRvbmwzbW5qNVErbzYyMDc5YnZmNitWdC9lalJTUEwxZ29L?=
 =?utf-8?B?VVQ5bzdmMkpyTGZ3L0ljaFBTVEcxV1dPN3JXRktKWWZmR2VkMnpQUm9KY0Zk?=
 =?utf-8?Q?WEOBBt3u1WIywr8O8/hMgjga7?=
Content-ID: <11E8FEEFE76F54499BBC0C3D8BB04BEB@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd4ea6c1-9b76-4085-11d5-08dd07b35f7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2024 09:28:33.8485 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RxusiAuOc5Bw/czYdfQrBZBlscybuKSQnrZoQKCuCPzctVFL8vU0lmQOW6UZkK4vnF5Y8Wrsu+URrGGwjzJ1PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8382
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--10.820900-8.000000
X-TMASE-MatchedRID: 9zTThWtzImtm6oeM5+OJFCaix8JZpk78jLOy13Cgb4+qvcIF1TcLYPuA
 5hg2vazcZc34la8q513oOFZKBrFWj0ILcl5xUj1W+Fq9Vk/m1NrXAvRa0tfJGmHaXGR9wawUxtl
 EqRFL54NWUNB+8ndC5q2enj5fM9b3eYojpvrZ9+eHZXNSWjgdU30tCKdnhB58pTwPRvSoXL0ir3
 kOMJmHTBOYqJip7cUI0C1sQRfQzEHEQdG7H66TyH4gKq42LRYkirGXN+Kn0dW8fZyVyrYBCC1tE
 su91LfPhZDeovNpG21+3BndfXUhXQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--10.820900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: BB11258BCACF113B8CA0335E0201DCB7F7F39A0C759452139585616A8994387E2000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_006_1324823673.1715092401"
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

--__=_Part_Boundary_006_1324823673.1715092401
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFNodS1oc2lhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMC0wOSBhdCAxOToxNSArMDgwMCwgU2h1
LWhzaWFuZyBZYW5nIHdyb3RlOg0KPiBJbnRyb2R1Y2VzIHRoZSBkcml2ZXIgb2YgdGhlIE1lZGlh
VGVrIFNlbnNvciBJbnRlcmZhY2UsDQo+IGZvY3VzaW5nIG9uIGludGVncmF0aW9uIHdpdGggdGhl
IE1lZGlhVGVrIElTUCBDQU1TWVMuIFRoZQ0KPiBzZW5pbmYgZGV2aWNlIGJyaWRnZXMgY2FtZXJh
IHNlbnNvcnMgYW5kIHRoZSBJU1Agc3lzdGVtLA0KPiBwcm92aWRpbmcgbWFuYWdlbWVudCBmb3Ig
c2Vuc29yIGRhdGEgcm91dGluZyBhbmQgcHJvY2Vzc2luZy4NCj4gS2V5IGZlYXR1cmVzIGluY2x1
ZGUgVjRMMiBmcmFtZXdvcmsgY29udHJvbCwgYW5kIGR5bmFtaWMNCj4gaGFuZGxpbmcgb2Ygc3Ry
ZWFtIGNvbmZpZ3VyYXRpb25zIGFuZCB2aXJ0dWFsIGNoYW5uZWxzLg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogU2h1LWhzaWFuZyBZYW5nIDxTaHUtaHNpYW5nLllhbmdAbWVkaWF0ZWsuY29tPg0KPiAt
LS0NCg0KW3NuaXBdDQoNCj4gK3N0cnVjdCBzZW5pbmZfdmMgew0KPiArCXU4IHZjOw0KDQp2YyBp
cyBhbHdheXMgemVybywgc28gZHJvcCBpdC4NCg0KUmVnYXJkcywNCkNLDQoNCj4gKwl1OCBkdDsN
Cj4gKwl1OCBmZWF0dXJlOw0KPiArCXU4IG91dF9wYWQ7DQo+ICsJdTggcGl4ZWxfbW9kZTsNCj4g
Kwl1OCBncm91cDsNCj4gKwl1OCBtdXg7IC8qIGFsbG9jYXRlZCBwZXIgZ3JvdXAgKi8NCj4gKwl1
OCBjYW07IC8qIGFzc2lnbmVkIGJ5IGNhbSBkcml2ZXIgKi8NCj4gKwl1OCBlbmFibGU7DQo+ICsJ
dTE2IGV4cF9oc2l6ZTsNCj4gKwl1MTYgZXhwX3ZzaXplOw0KPiArfTsNCj4gKw0KDQo=

--__=_Part_Boundary_006_1324823673.1715092401
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtTaHUtaHNpYW5nOg0KDQpPbiYjMzI7V2Vk
LCYjMzI7MjAyNC0xMC0wOSYjMzI7YXQmIzMyOzE5OjE1JiMzMjsrMDgwMCwmIzMyO1NodS1oc2lh
bmcmIzMyO1lhbmcmIzMyO3dyb3RlOg0KJmd0OyYjMzI7SW50cm9kdWNlcyYjMzI7dGhlJiMzMjtk
cml2ZXImIzMyO29mJiMzMjt0aGUmIzMyO01lZGlhVGVrJiMzMjtTZW5zb3ImIzMyO0ludGVyZmFj
ZSwNCiZndDsmIzMyO2ZvY3VzaW5nJiMzMjtvbiYjMzI7aW50ZWdyYXRpb24mIzMyO3dpdGgmIzMy
O3RoZSYjMzI7TWVkaWFUZWsmIzMyO0lTUCYjMzI7Q0FNU1lTLiYjMzI7VGhlDQomZ3Q7JiMzMjtz
ZW5pbmYmIzMyO2RldmljZSYjMzI7YnJpZGdlcyYjMzI7Y2FtZXJhJiMzMjtzZW5zb3JzJiMzMjth
bmQmIzMyO3RoZSYjMzI7SVNQJiMzMjtzeXN0ZW0sDQomZ3Q7JiMzMjtwcm92aWRpbmcmIzMyO21h
bmFnZW1lbnQmIzMyO2ZvciYjMzI7c2Vuc29yJiMzMjtkYXRhJiMzMjtyb3V0aW5nJiMzMjthbmQm
IzMyO3Byb2Nlc3NpbmcuDQomZ3Q7JiMzMjtLZXkmIzMyO2ZlYXR1cmVzJiMzMjtpbmNsdWRlJiMz
MjtWNEwyJiMzMjtmcmFtZXdvcmsmIzMyO2NvbnRyb2wsJiMzMjthbmQmIzMyO2R5bmFtaWMNCiZn
dDsmIzMyO2hhbmRsaW5nJiMzMjtvZiYjMzI7c3RyZWFtJiMzMjtjb25maWd1cmF0aW9ucyYjMzI7
YW5kJiMzMjt2aXJ0dWFsJiMzMjtjaGFubmVscy4NCiZndDsmIzMyOw0KJmd0OyYjMzI7U2lnbmVk
LW9mZi1ieTomIzMyO1NodS1oc2lhbmcmIzMyO1lhbmcmIzMyOyZsdDtTaHUtaHNpYW5nLllhbmdA
bWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYjMzI7LS0tDQoNCltzbmlwXQ0KDQomZ3Q7JiMzMjsrc3Ry
dWN0JiMzMjtzZW5pbmZfdmMmIzMyO3sNCiZndDsmIzMyOyt1OCYjMzI7dmM7DQoNCnZjJiMzMjtp
cyYjMzI7YWx3YXlzJiMzMjt6ZXJvLCYjMzI7c28mIzMyO2Ryb3AmIzMyO2l0Lg0KDQpSZWdhcmRz
LA0KQ0sNCg0KJmd0OyYjMzI7K3U4JiMzMjtkdDsNCiZndDsmIzMyOyt1OCYjMzI7ZmVhdHVyZTsN
CiZndDsmIzMyOyt1OCYjMzI7b3V0X3BhZDsNCiZndDsmIzMyOyt1OCYjMzI7cGl4ZWxfbW9kZTsN
CiZndDsmIzMyOyt1OCYjMzI7Z3JvdXA7DQomZ3Q7JiMzMjsrdTgmIzMyO211eDsmIzMyOy8qJiMz
MjthbGxvY2F0ZWQmIzMyO3BlciYjMzI7Z3JvdXAmIzMyOyovDQomZ3Q7JiMzMjsrdTgmIzMyO2Nh
bTsmIzMyOy8qJiMzMjthc3NpZ25lZCYjMzI7YnkmIzMyO2NhbSYjMzI7ZHJpdmVyJiMzMjsqLw0K
Jmd0OyYjMzI7K3U4JiMzMjtlbmFibGU7DQomZ3Q7JiMzMjsrdTE2JiMzMjtleHBfaHNpemU7DQom
Z3Q7JiMzMjsrdTE2JiMzMjtleHBfdnNpemU7DQomZ3Q7JiMzMjsrfTsNCiZndDsmIzMyOysNCg0K
DQo8L3ByZT4NCjwvcD48L2JvZHk+PC9odG1sPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxwcmU+
KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlICoqKioqKioqKioq
KioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3Nh
Z2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJv
cHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3Vy
ZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQg
b25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRp
b24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhp
cyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNp
cGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElm
IHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVs
aWV2ZSANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFz
ZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUt
bWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVk
aW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xv
c2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsg
eW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_006_1324823673.1715092401--

