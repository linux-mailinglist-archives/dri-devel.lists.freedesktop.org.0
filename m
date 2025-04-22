Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0D0A95C93
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 05:30:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1971A10E099;
	Tue, 22 Apr 2025 03:30:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="UyHDQK2y";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="cxvOZj1m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C64E10E099
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 03:30:42 +0000 (UTC)
X-UUID: 277a03201f2a11f0980a8d1746092496-20250422
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=em76YNq2eprNZa1ur2gnP1IyyPCYHV652EE//j4Yix4=; 
 b=UyHDQK2yz7qkdBAhrNDM8Pgg6RXj9XT68zKiXq7ASV8VtSDfVlKrY2Zzds3XKdlzV8WffDkrhoTD0wQ2rjpV486vidw3Bzrx0/qcHJs9bTsEJZxVXnVr86aZymPQ1Ps99wNd9GqTL2p94IKY8kI0DyAJMV9TELxYsLfEJB0+SdU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1, REQID:f77bd5eb-226d-4e6f-8718-90bddc21b469, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:0ef645f, CLOUDID:5522d9c7-16da-468a-87f7-8ca8d6b3b9f7,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
 nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
 OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 277a03201f2a11f0980a8d1746092496-20250422
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 942080740; Tue, 22 Apr 2025 11:30:35 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 22 Apr 2025 11:30:34 +0800
Received: from OS8PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 22 Apr 2025 11:30:34 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Var7vCc4C2AHxt3F5UjqFc8TGiHMiFckg/FuhsGJ5MOZXUik5+IE4FdphL2+ehjTuazgVbXrtdd30ciWVG/XkdneQ4UfsZjLnrZKcPc5GMMh6XqoUXx7u7qJDr8q8Q660HdI0X8gnnLUh2GK6lwpGEXQF3tO00EVZt6Llkd8U8KX9vAnhHFwv3zpqWg6Q9nKiAiP9hvAc7uUyfnOrStwQPVbnP8ujvp0rm8TGG+klQeVeRCWyLXNNtAaY3XIPRZ7SoRZq5c6uO5ZtNSHI/am5byGsPw2XL3DfkjJkc+DPgurCzmVUA5yepLH1M48Z1akXMUPdlWkc987m9Xdkttu7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5hxHH61yE2NaXur1gckO/jPEgQM2ZVzwGp8yyEAJS9I=;
 b=SIwY0FreljTNlxxmkoSaDBSXR0HGnqKN3+dX4g6f5reDOruRNi0GIr2sUKEJt7PFBs+LKgvFOIxFs2hHHNPEjoCU9yeXaWc1Gy78YRreFrQV5hIVY+ZqKqF6Ihli3Qx21Jx9vunYSMS0uKqKZ2O19WP21ZOVaZENPV2qu3UPMTZHKMgfycIM959VSA6KTzk7sWF6E7aXj6o7LhTFQlgHb92f76+SDoSsLshcBsvAJHRmLKiPh+sT/8bPBSr1oC3+6yLfXNa4jPEFxFGQXhfamQQIwTFEhq8i0YII3tgFCVcFbrbpLNJovYjiRUZpyx6mXGjzLtOQMwLLXeLjHEg7cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5hxHH61yE2NaXur1gckO/jPEgQM2ZVzwGp8yyEAJS9I=;
 b=cxvOZj1mYrixHySaNZlIq9Yudah9TYHWkpVsmj9vUxPK4Za+L4DfP7s5bH1rrPxUzwZWPSF7dQZSua02g1kGkfY2+i1b0jTa8oPOtmm1FpPBucbXLn/kZQrRC14OhgCZh7jen5E5bRXY3p92XrDpFwXZHsnRc7wqLjrBwF6qIrM=
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com (2603:1096:101:83::7)
 by TYSPR03MB7619.apcprd03.prod.outlook.com (2603:1096:400:412::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.32; Tue, 22 Apr
 2025 03:30:31 +0000
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::9fa0:ee98:d5ed:beba]) by SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::9fa0:ee98:d5ed:beba%3]) with mapi id 15.20.8632.035; Tue, 22 Apr 2025
 03:30:31 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: =?utf-8?B?TGV3aXMgTGlhbyAo5buW5p+P6YieKQ==?= <Lewis.Liao@mediatek.com>,
 =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 =?utf-8?B?SXZlcyBDaGVuamggKOmZs+S/iuW8mCk=?= <Ives.Chenjh@mediatek.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 =?utf-8?B?VG9tbXlZTCBDaGVuICjpmbPlvaXoia8p?= <TommyYL.Chen@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "kernel@collabora.com" <kernel@collabora.com>
Subject: Re: [PATCH v1 1/5] drm/mediatek: mtk_dpi: Use switch in
 mtk_dpi_config_color_format()
Thread-Topic: [PATCH v1 1/5] drm/mediatek: mtk_dpi: Use switch in
 mtk_dpi_config_color_format()
Thread-Index: AQHbqVFBIh7pFlGuO0y+VkDPFm8uY7OvGygA
Date: Tue, 22 Apr 2025 03:30:30 +0000
Message-ID: <2b544b7f9ad1a15593a1bcc5655736d540edd92e.camel@mediatek.com>
References: <20250409131306.108635-1-angelogioacchino.delregno@collabora.com>
 <20250409131306.108635-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250409131306.108635-2-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB6626:EE_|TYSPR03MB7619:EE_
x-ms-office365-filtering-correlation-id: 0d15be23-38c8-4f03-49af-08dd814e08b7
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?Z0t2N1NTNkErWXE0OVVXMUlQVkI1Y25NeUc3UEkxNndMMlpPUGJmbkRJTGJr?=
 =?utf-8?B?Y1NXMDcrUG9WYkI1Z2ZIUEFvdU5SUTZIM0YwNlpETG5QUUhtb1UvQy9TdFJB?=
 =?utf-8?B?dWNKU29vaTEyNDNnZ1BOMFl2Wm51clNobC9OYURRYXd3YTE2VXRMejBGQVFz?=
 =?utf-8?B?Q0NYTXhodE9qUU5wajE2Y1JHWWlRcURITHlhV1FidzE5blpDRjI4STNrYlln?=
 =?utf-8?B?VjRTZEtQUkMwS3VPVG1PNW9oQ013cFliVXM2akhMek1aV1B1ak5Sc2doaWor?=
 =?utf-8?B?cEpEaXBZREl5NndaOCtoKzZJdWxVeDZ6WlVBZzIwMExCUTFWUkFTR1pkR016?=
 =?utf-8?B?RHhob1ZrNUZQNDRQSXZvUWxkZFc0QWJMNnQ3S3EreEtMWW9WLzdLRXJPM2dU?=
 =?utf-8?B?enBwZTFpZjlQUk5Wdm1WbHFSdGxrNVNxamg2bE92ZTAweUh3NkZzWE1SSVZR?=
 =?utf-8?B?TEhqNGhnbjNHNjFRSWdFZE9JQ0M3OEJJeGdTS25VcklYejZWUmlqZVBreXp3?=
 =?utf-8?B?L3NpQ1U1WkprU0lhek1CaCtVQXdScXlSbmM1N1dwbUY5K0lEVW1QMkpEd3Nt?=
 =?utf-8?B?NkE2cFJaZGlUSmxjNTNmVDNkQy9WaXY3UTRubXFldWI5NFkrb09rOEIzcU9r?=
 =?utf-8?B?QmEzWlpidmNjTSt3RW9mUGJJRG51d0ZJVkJybWFibmFsUzhtSGo2c2Npc3lY?=
 =?utf-8?B?cTdGR3dGVjFSVW8rSVdqNXJlQzhVUmtkcmJDR2pUSldtaVlSUTZJU29KVzFp?=
 =?utf-8?B?SmdmS2FuWElhOEVEdWVaREVDZXZSRW1UOEU4bUFUdlR6SWZldkRtejhKL2M0?=
 =?utf-8?B?L3p3c3JLOVBLUW5naTVmeEFBYjRhSWFaTk9jWE4wdW9wUlhRTFJ1WXB5SGgv?=
 =?utf-8?B?SmpoUVh0bEJuTm1PTDUyUjd5ZHVpVWdnbEN4UGIvc2VaZUhBcy9HUjJISHRZ?=
 =?utf-8?B?VHV5QUVxRVlWb3gxZEVPbVZUbnhIOGo4UWYzMEJIOFE1cFZ0czhYODRKQXpz?=
 =?utf-8?B?RVBtYldTd0c2WDVVcHVuRDFGM3NiRGI3MHd5RU55SHZ0OXUyZit2ZDFWQ0ht?=
 =?utf-8?B?bUFVSG9peDhZdmkxWXlUNlRrUEdIam9WY3VSNWdmTkJyZzI3UjcycmQ1MStS?=
 =?utf-8?B?b243eEcrbGJmZ0EvbWhhcEFkZjhKTnNFckl1WEs3amtoUFIrMmhyUTdtT2I2?=
 =?utf-8?B?MEw5SDI1Zy9MZzJDd3NSZXo3OFNIOVM0MWxUWkZ1OXdSSlFmR0xRYTlTdmdK?=
 =?utf-8?B?TVlBWndDMTIrUXE4RHRTNFdhL0I2NlFORWlZaWdDUG9tZjB3M3BJdHo4K2Nx?=
 =?utf-8?B?S0Y4VTdhQ2VPZDBmaWNpaE9IdWtGNEkyVStLaHBZRitONUoySlZFSGF0SWpI?=
 =?utf-8?B?T1Jic1hPSkJ4MGFyQ2J2aHFBZElKbjQvNGdMZ0VOOFVGWlpkaEg1aTdMUzdt?=
 =?utf-8?B?Sy9SRFNUZU9vNFlucHNGbThsOTNUc09hZ0NWaFpIdUdXaUdjeE9uTVZBWmNJ?=
 =?utf-8?B?cmhnOWQveE0wdENYY2RYc01rNkM0T1ZkRG9tM1lOTU1wSFdCTWs4NmdHY3dH?=
 =?utf-8?B?NEFtRlQzR2VJZW5JQ1JWQ05FWi9CSkNIWGxLMVNocG9SeXM0Z3hibEJDYjlJ?=
 =?utf-8?B?aWJCRjk4Z20rSUI2bDFwUG1TV1BCR0lzSElkQ29RVnd1QTErTkY3Mlo2eTdS?=
 =?utf-8?B?ZnlEbDRtQW5GeVQzL3lkdzU3ckNDQ1Nyak9pNVUwcktuZWY0aktHUW5ZcGpJ?=
 =?utf-8?B?SGRsY3dCSW9vV0ZMMGlQdlB4WXcvUFgwQVFGbkNvODV5alltUVFxUmZodzBS?=
 =?utf-8?B?U2JuYkt3YXBITlJRNDA0T2ZRNDZuUGR2RzBWVWdCV29oN3E0eE82WnFHMWdV?=
 =?utf-8?B?RnhuWWpYc0tXU1VMUEFYZytKMjZxSEpraDVyRi9SYktnK2xydWQwNDA4YWdz?=
 =?utf-8?B?RWd5bWh1YUlHUEpVVVVVdFlJSDZQRlEyT1Z0cG1PaTVxM1NuZmR5djg0QlZt?=
 =?utf-8?B?dUVCa2NLUVh3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB6626.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U0VMcFQvRHpBR2s3dnlVeTF2c3gyZlFJWSs0aDNya0FpMlBCT3BQcFcrRW1t?=
 =?utf-8?B?VzNpRmRQL2VKZElST1R5M21WalZDS2ZrbmkvVXRkbDBxZ05KY1RaNUw1dmd3?=
 =?utf-8?B?NEg4SlQ4dGFvYWdTYkM4eXVkZkZ1Z0dKVkN4aEl1YVlYaGxYV3lFYUdmNk1m?=
 =?utf-8?B?SjErNmpCRVMyeFFBTTZ4VDk4WEh3VVVHeEw3ZWJub3o5SWdhcGlEZUd0cVNP?=
 =?utf-8?B?RUREVTgvNUdVQzNLelVxYVJXeUxXNTYzZ3pBNkVxcVZWY0ZTRFV5QWsrQTg0?=
 =?utf-8?B?eWQ4VTNDRHpaWFZJK3VPeHc4Z3ZaQXQ3QW05YmdSclR2dHBydDdrMmZKUlg0?=
 =?utf-8?B?Ky80Z3h0WlpPY25HRWxmaE5iQlQ4UGc0akNVb3hCaDN0NjVndGpVenB0a1Vu?=
 =?utf-8?B?VGRaNGdOT0liSDR1N2VTZlF4SWpXR09kSmx6TVNMSjJ6MTRCVnZUekxwNFJN?=
 =?utf-8?B?c3M5NFBuTDlwUnBTRUhzeGEra1dPang1RUxraFVFVjRBUGpaVHFvdGRuNUQv?=
 =?utf-8?B?YkdTWVM1T2VLVWV3ZEJveWlZSU82SkYwR0ZNakZmSzlFN2swZE1hY2tvRW1j?=
 =?utf-8?B?SVhaQ01MdktpdWVudm1DbysxN2IxVGV0TTMxWTB5NWU4ZHB2dC9jZFp6dmg3?=
 =?utf-8?B?cHRjS3RYNzNnQTFHV0VQbmUwektud3hYRjFVemZINzlsWFNkUmhxNEF6eWhP?=
 =?utf-8?B?THJ5RzE3N3Z5aUpmWk8wVEtoVUhxbXlqUjE5djloc0hibGhxYmpYcUwvbS80?=
 =?utf-8?B?SGlVT1pySnlsSm9zQUFlUmRybStXY0h4MmpoaitZNHNQZmE5dHoxZ0ZOMG1J?=
 =?utf-8?B?RGFmZmYvbGdGajI0R0h6enNNQkVMOVZLemx1WlAzT29SdERJaUFkRk5FRks0?=
 =?utf-8?B?eENQZ2szZm9vcG9UeThoQkx1NjU0b3FsUjZHVDcrVU9OWi8vTDZhRElLd1VQ?=
 =?utf-8?B?a1JZSStlejdHem96VlcrRmNIMGN2cTlnV21pR0Y5MWx0U1U1S2xZSUZuckFJ?=
 =?utf-8?B?RG10SjcrbkpKYy9ZMDVjNFAwV2IvWDdZc3NYNkhtVjhCTVlNRWFUSGc3dXg0?=
 =?utf-8?B?ZC9Wc1JEV3VYUU1hcCtGWmExOG9rTjRkWkxJelIwWHpFdnJ5aHloZmFZbkhU?=
 =?utf-8?B?MXFMQ0pWb21DSW1DcUJ0THJrVXZTb010NGtqZkJXZWs3ZXhsQ05ObFAvNG8r?=
 =?utf-8?B?QitKVXFISnJuT0VydDZWZncrSE5NcG1sbjVlVU1qMEkzM0w0T0k1TW02UGNS?=
 =?utf-8?B?bytQUTd2NCtRM1ZoUCtEa05wUmtPZkh0NmpqcFR3Y1czc09HTkwyVEgvaXYx?=
 =?utf-8?B?QXFMWUQvVjhtdHJRcWhFd3I2Q0ptWU8rTEQrbFlHVzI5b1FwS3kwdkowT2M5?=
 =?utf-8?B?ZW5sZkpwamQ4a01WUjluNEtROVV6T3RzcDVhd3F4Qm9Qc2JVdEVvajZwaXdn?=
 =?utf-8?B?VDh3WnJGMy9lNnZvVk4wU1pkN0UvdkE0V0o0bWhkZ0REWEFVMDFrOEkxZVQ0?=
 =?utf-8?B?cm96MnlyeTRwMFA5VmdOdFVqM3NkdWpvU093ZUZqdjhhVEx0SHdTcytrOGw5?=
 =?utf-8?B?aHR5QkhJNktMMy9Pc2h1aUJJZVliMWkzSFFwL3c1b3kwZk5sR2pZejQzaUww?=
 =?utf-8?B?bkhWdmpoUWViZzhOK1pCUFpWUjNLeXIvM3BqeGNxYXB2QUcxVUhlSWNVQlNQ?=
 =?utf-8?B?bS9STUVXTmQ3bHFSc0dwMGpjZDZHaTZPMGZXYWx6SzAvREVBRS9kaDEyS2JV?=
 =?utf-8?B?eWY4bDJQK254UTVuY3Nhcm9HR2xuVnUxVWhGdTlac054UnljVnFsVW9Ucmhr?=
 =?utf-8?B?ZWZwSXFHWmwyUkFlNDUrZjNCZmM0Sy9iLzIwM1pLb2JyVzV0QzV1TTVZbmRp?=
 =?utf-8?B?NjUzb3k2Qk9ZMUZ1by8renArSEp2ZER5UWtjME1rakNCTnczTHdYWUdjNU1r?=
 =?utf-8?B?d2J6eVE2SCtlV2ExZ25GbWI5aGhadXB1TnRFSThHN2YrWXEyTzhzd2VNRHVL?=
 =?utf-8?B?TEhnd0FZU1NBS3BFT0ZvQlMxVnV6N2tsWEdhT2prNk1oVkQzNk9Zc0lzQXFC?=
 =?utf-8?B?TXdCWVNXSXl3MzZZNm45Y2dVM2xVWFFGK0UzZmR3b20yaGpZTUdFTzBSTGZy?=
 =?utf-8?Q?V5MOiu3pbbH0wftbufmNHcFms?=
Content-ID: <2F83EA1376F2F847B2E8A92ED6AA6187@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB6626.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d15be23-38c8-4f03-49af-08dd814e08b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2025 03:30:30.9686 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NF4gEVDqy/XGco3+8VvbMf9ENwoskEOcRLyVaz0rmHJP2e0AZ2ode2bSpINOl4ZoarIoaKbD9+LSjiBSYCbEjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7619
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_006_815864735.555512203"
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

--__=_Part_Boundary_006_815864735.555512203
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDI1LTA0LTA5IGF0IDE1OjEzICswMjAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBv
ciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBJbiBwcmVwYXJhdGlvbiBmb3IgYWRkaW5nIHN1cHBv
cnQgZm9yIGFuIGFkZGl0aW9uYWwgY29sb3IgZm9ybWF0LA0KPiBjb252ZXJ0IHRoZSBmb3JtYXQg
Y29uZGl0aW9uYWwgaW4gbXRrX2RwaV9jb25maWdfY29sb3JfZm9ybWF0KCkNCj4gdG8gYSBzd2l0
Y2guDQo+IFRoaXMgYWxzbyBtYWtlcyB0aGUgY29uY2VwdCBvZiBSR0IgYmVpbmcgdGhlIGRlZmF1
bHQgY29sb3IgZm9ybWF0DQo+IGEgbGl0dGxlIG1vcmUgaHVtYW4gcmVhZGFibGUuDQo+IA0KPiBU
aGlzIGNvbW1pdCBicmluZ3Mgbm8gZnVuY3Rpb25hbCBkaWZmZXJlbmNlcy4NCg0KUmV2aWV3ZWQt
Ynk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+DQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFu
Z2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxh
Ym9yYS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYyB8
IDggKysrKysrLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cGkuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMNCj4gaW5kZXggMGZkMTNl
NmRkM2YxLi5kNzM1Mzk4ZTk3ZjggMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHBpLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGku
Yw0KPiBAQCAtNDUyLDcgKzQ1Miw4IEBAIHN0YXRpYyB2b2lkIG10a19kcGlfY29uZmlnX2NvbG9y
X2Zvcm1hdChzdHJ1Y3QgbXRrX2RwaSAqZHBpLA0KPiAgew0KPiAgICAgICAgIG10a19kcGlfY29u
ZmlnX2NoYW5uZWxfc3dhcChkcGksIE1US19EUElfT1VUX0NIQU5ORUxfU1dBUF9SR0IpOw0KPiAN
Cj4gLSAgICAgICBpZiAoZm9ybWF0ID09IE1US19EUElfQ09MT1JfRk9STUFUX1lDQkNSXzQyMikg
ew0KPiArICAgICAgIHN3aXRjaCAoZm9ybWF0KSB7DQo+ICsgICAgICAgY2FzZSBNVEtfRFBJX0NP
TE9SX0ZPUk1BVF9ZQ0JDUl80MjI6DQo+ICAgICAgICAgICAgICAgICBtdGtfZHBpX2NvbmZpZ195
dXY0MjJfZW5hYmxlKGRwaSwgdHJ1ZSk7DQo+ICAgICAgICAgICAgICAgICBtdGtfZHBpX2NvbmZp
Z19jc2NfZW5hYmxlKGRwaSwgdHJ1ZSk7DQo+IA0KPiBAQCAtNDYzLDExICs0NjQsMTQgQEAgc3Rh
dGljIHZvaWQgbXRrX2RwaV9jb25maWdfY29sb3JfZm9ybWF0KHN0cnVjdCBtdGtfZHBpICpkcGks
DQo+ICAgICAgICAgICAgICAgICBtdGtfZHBpX21hc2soZHBpLCBEUElfTUFUUklYX1NFVCwgZHBp
LT5tb2RlLmhkaXNwbGF5IDw9IDcyMCA/DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
TUFUUklYX1NFTF9SR0JfVE9fQlQ2MDEgOiBNQVRSSVhfU0VMX1JHQl9UT19KUEVHLA0KPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIElOVF9NQVRSSVhfU0VMX01BU0spOw0KPiAtICAgICAg
IH0gZWxzZSB7DQo+ICsgICAgICAgICAgICAgICBicmVhazsNCj4gKyAgICAgICBkZWZhdWx0Og0K
PiArICAgICAgIGNhc2UgTVRLX0RQSV9DT0xPUl9GT1JNQVRfUkdCOg0KPiAgICAgICAgICAgICAg
ICAgbXRrX2RwaV9jb25maWdfeXV2NDIyX2VuYWJsZShkcGksIGZhbHNlKTsNCj4gICAgICAgICAg
ICAgICAgIG10a19kcGlfY29uZmlnX2NzY19lbmFibGUoZHBpLCBmYWxzZSk7DQo+ICAgICAgICAg
ICAgICAgICBpZiAoZHBpLT5jb25mLT5zd2FwX2lucHV0X3N1cHBvcnQpDQo+ICAgICAgICAgICAg
ICAgICAgICAgICAgIG10a19kcGlfY29uZmlnX3N3YXBfaW5wdXQoZHBpLCBmYWxzZSk7DQo+ICsg
ICAgICAgICAgICAgICBicmVhazsNCj4gICAgICAgICB9DQo+ICB9DQo+IA0KPiAtLQ0KPiAyLjQ5
LjANCj4gDQoNCg==

--__=_Part_Boundary_006_815864735.555512203
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1dlZCwmIzMyOzIwMjUtMDQtMDkmIzMyO2F0
JiMzMjsxNToxMyYjMzI7KzAyMDAsJiMzMjtBbmdlbG9HaW9hY2NoaW5vJiMzMjtEZWwmIzMyO1Jl
Z25vJiMzMjt3cm90ZToNCiZndDsmIzMyO0V4dGVybmFsJiMzMjtlbWFpbCYjMzI7OiYjMzI7UGxl
YXNlJiMzMjtkbyYjMzI7bm90JiMzMjtjbGljayYjMzI7bGlua3MmIzMyO29yJiMzMjtvcGVuJiMz
MjthdHRhY2htZW50cyYjMzI7dW50aWwmIzMyO3lvdSYjMzI7aGF2ZSYjMzI7dmVyaWZpZWQmIzMy
O3RoZSYjMzI7c2VuZGVyJiMzMjtvciYjMzI7dGhlJiMzMjtjb250ZW50Lg0KJmd0OyYjMzI7DQom
Z3Q7JiMzMjsNCiZndDsmIzMyO0luJiMzMjtwcmVwYXJhdGlvbiYjMzI7Zm9yJiMzMjthZGRpbmcm
IzMyO3N1cHBvcnQmIzMyO2ZvciYjMzI7YW4mIzMyO2FkZGl0aW9uYWwmIzMyO2NvbG9yJiMzMjtm
b3JtYXQsDQomZ3Q7JiMzMjtjb252ZXJ0JiMzMjt0aGUmIzMyO2Zvcm1hdCYjMzI7Y29uZGl0aW9u
YWwmIzMyO2luJiMzMjttdGtfZHBpX2NvbmZpZ19jb2xvcl9mb3JtYXQoKQ0KJmd0OyYjMzI7dG8m
IzMyO2EmIzMyO3N3aXRjaC4NCiZndDsmIzMyO1RoaXMmIzMyO2Fsc28mIzMyO21ha2VzJiMzMjt0
aGUmIzMyO2NvbmNlcHQmIzMyO29mJiMzMjtSR0ImIzMyO2JlaW5nJiMzMjt0aGUmIzMyO2RlZmF1
bHQmIzMyO2NvbG9yJiMzMjtmb3JtYXQNCiZndDsmIzMyO2EmIzMyO2xpdHRsZSYjMzI7bW9yZSYj
MzI7aHVtYW4mIzMyO3JlYWRhYmxlLg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtUaGlzJiMzMjtjb21t
aXQmIzMyO2JyaW5ncyYjMzI7bm8mIzMyO2Z1bmN0aW9uYWwmIzMyO2RpZmZlcmVuY2VzLg0KDQpS
ZXZpZXdlZC1ieTomIzMyO0NLJiMzMjtIdSYjMzI7Jmx0O2NrLmh1QG1lZGlhdGVrLmNvbSZndDsN
Cg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtTaWduZWQtb2ZmLWJ5OiYjMzI7QW5nZWxvR2lvYWNjaGlu
byYjMzI7RGVsJiMzMjtSZWdubyYjMzI7Jmx0O2FuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29s
bGFib3JhLmNvbSZndDsNCiZndDsmIzMyOy0tLQ0KJmd0OyYjMzI7JiMzMjtkcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RwaS5jJiMzMjt8JiMzMjs4JiMzMjsrKysrKystLQ0KJmd0OyYjMzI7
JiMzMjsxJiMzMjtmaWxlJiMzMjtjaGFuZ2VkLCYjMzI7NiYjMzI7aW5zZXJ0aW9ucygrKSwmIzMy
OzImIzMyO2RlbGV0aW9ucygtKQ0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtkaWZmJiMzMjstLWdpdCYj
MzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jJiMzMjtiL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHBpLmMNCiZndDsmIzMyO2luZGV4JiMzMjswZmQxM2U2ZGQzZjEu
LmQ3MzUzOThlOTdmOCYjMzI7MTAwNjQ0DQomZ3Q7JiMzMjstLS0mIzMyO2EvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kcGkuYw0KJmd0OyYjMzI7KysrJiMzMjtiL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHBpLmMNCiZndDsmIzMyO0BAJiMzMjstNDUyLDcmIzMyOys0NTIsOCYj
MzI7QEAmIzMyO3N0YXRpYyYjMzI7dm9pZCYjMzI7bXRrX2RwaV9jb25maWdfY29sb3JfZm9ybWF0
KHN0cnVjdCYjMzI7bXRrX2RwaSYjMzI7KmRwaSwNCiZndDsmIzMyOyYjMzI7ew0KJmd0OyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO210a19kcGlfY29uZmlnX2No
YW5uZWxfc3dhcChkcGksJiMzMjtNVEtfRFBJX09VVF9DSEFOTkVMX1NXQVBfUkdCKTsNCiZndDsm
IzMyOw0KJmd0OyYjMzI7LSYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7aWYmIzMy
Oyhmb3JtYXQmIzMyOz09JiMzMjtNVEtfRFBJX0NPTE9SX0ZPUk1BVF9ZQ0JDUl80MjIpJiMzMjt7
DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtzd2l0Y2gmIzMy
Oyhmb3JtYXQpJiMzMjt7DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjtjYXNlJiMzMjtNVEtfRFBJX0NPTE9SX0ZPUk1BVF9ZQ0JDUl80MjI6DQomZ3Q7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyO210a19kcGlfY29uZmlnX3l1djQyMl9lbmFibGUoZHBpLCYj
MzI7dHJ1ZSk7DQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO210a19kcGlfY29uZmln
X2NzY19lbmFibGUoZHBpLCYjMzI7dHJ1ZSk7DQomZ3Q7JiMzMjsNCiZndDsmIzMyO0BAJiMzMjst
NDYzLDExJiMzMjsrNDY0LDE0JiMzMjtAQCYjMzI7c3RhdGljJiMzMjt2b2lkJiMzMjttdGtfZHBp
X2NvbmZpZ19jb2xvcl9mb3JtYXQoc3RydWN0JiMzMjttdGtfZHBpJiMzMjsqZHBpLA0KJmd0OyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjttdGtfZHBpX21hc2soZHBpLCYjMzI7RFBJX01BVFJJ
WF9TRVQsJiMzMjtkcGktJmd0O21vZGUuaGRpc3BsYXkmIzMyOyZsdDs9JiMzMjs3MjAmIzMyOyYj
NjM7DQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7TUFUUklYX1NFTF9S
R0JfVE9fQlQ2MDEmIzMyOzomIzMyO01BVFJJWF9TRUxfUkdCX1RPX0pQRUcsDQomZ3Q7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7SU5UX01BVFJJWF9TRUxfTUFTSyk7DQomZ3Q7
JiMzMjstJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjt9JiMzMjtlbHNlJiMzMjt7
DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7YnJlYWs7DQomZ3Q7JiMzMjsrJiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtkZWZhdWx0Og0KJmd0OyYjMzI7KyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7Y2FzZSYjMzI7TVRLX0RQSV9DT0xPUl9GT1JNQVRfUkdC
Og0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjttdGtfZHBpX2NvbmZpZ195dXY0MjJf
ZW5hYmxlKGRwaSwmIzMyO2ZhbHNlKTsNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
bXRrX2RwaV9jb25maWdfY3NjX2VuYWJsZShkcGksJiMzMjtmYWxzZSk7DQomZ3Q7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyO2lmJiMzMjsoZHBpLSZndDtjb25mLSZndDtzd2FwX2lucHV0X3N1
cHBvcnQpDQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjttdGtfZHBpX2NvbmZpZ19zd2FwX2lucHV0KGRwaSwmIzMy
O2ZhbHNlKTsNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjticmVhazsNCiZndDsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjt9DQomZ3Q7JiMzMjsmIzMyO30N
CiZndDsmIzMyOw0KJmd0OyYjMzI7LS0NCiZndDsmIzMyOzIuNDkuMA0KJmd0OyYjMzI7DQoNCg0K
PC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48cHJlPioq
KioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZQ0KICoqKioqKioqKioq
KioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3Nh
Z2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJv
cHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3Vy
ZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQg
b25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRp
b24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhp
cyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNp
cGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElm
IHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVs
aWV2ZQ0KIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxl
YXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMg
ZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNs
dWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNj
bG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFu
ayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_006_815864735.555512203--

