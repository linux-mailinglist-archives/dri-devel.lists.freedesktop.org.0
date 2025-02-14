Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 805F7A35550
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 04:31:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1150810E140;
	Fri, 14 Feb 2025 03:31:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Uly80DE+";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="hWMZdIdh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7C4110E140
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 03:31:41 +0000 (UTC)
X-UUID: 321f9d88ea8411efbd192953cf12861f-20250214
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=PfO5nB4hiQVjmJfSuBpg3qV42RQc+rXmQsfEPx6xUME=; 
 b=Uly80DE+pn2zr1PgHE2Z3S3TJQ9hXQ3XcQwomnVrekYXM2X2KMyVnb6k0TZkbTNB5MKzdbaa7PlCcQUAJp8++UdEJoNE6CMGCugNVNFjSaU6Y1GNEjDHZfFO8LzteLMql6YVKjzhiioIfy9gZY84C83R7bqx4PtwiL3YuZcUtNk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46, REQID:0971e6d6-582d-425e-b31c-0a1551c8af83, IP:0,
 U
 RL:0,TC:0,Content:9,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:9
X-CID-META: VersionHash:60aa074, CLOUDID:dd5573a1-97df-4c26-9c83-d31de0c9db26,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:4|50,
 EDM:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
 ,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 321f9d88ea8411efbd192953cf12861f-20250214
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 875923894; Fri, 14 Feb 2025 11:31:36 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 14 Feb 2025 11:31:35 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1258.28 via Frontend Transport; Fri, 14 Feb 2025 11:31:35 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lkAXnE+MKmj5GUygoIB6WAAzcILunUaIX5DxRScGebaXIAN2+AvahmlfUEZC1iCrXnrIs2qlQOpudMwkxJHnoeSlQ7CH7Rhf0XIRhW3nljTi1HTBRJBFKmRl151cFT3UAP2RqzeVHVQFXzW+CrTt1EcGIMeAbXIvtV0/Qcvz0g2bNfQe+I0K05Lqg8gweIENRYpA+ec9SYpXhNBGTkkDdO/o0e7dRdBZWoNrxfMYRoHknKNZsYlJk4t+uh+NtEvk1p1LyHtQPTXFJcFNfMG6GW0Hn3VxnCmFKEIdO8dnLdq4xzIP/DpDGEP7Orrpyquc0MsabefUhUjce2DJTB5Nfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/i3WUZGODOB+vs+GdIbDsftIkn1E4sQCiPYQ+ggToy4=;
 b=fU5uZ2hfH8eRvdt5EKQWVmHqU1ygJtBMRhsf+qil9D9FyB/nvXH9A+KcxBGuSV/diq1ipxVK2GhFnRfLpvfh8NjAPsLAB9ivPL0CjIH4qRBpgcopPaqXH0n1QzLAUFoVxldIavEUflngiPM8w6LJURWKAwX6OVzBUXKzWXG4x+oK/SKa8U9JgdoDFoBC8zgj/aIQt2t1Qdu8xBlB6SfczEIPXyWDE7kdxIJL7Sx1rrIydAxzE2VQ7881XrnKJkWFZcBFcoYor57Ydu78QbVQ4TID0rAW/RKwYnqg1f4f02o1YjApTpCg5xbC/YOlprRIJxKFTRBYZ1/4FePEQI5cfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/i3WUZGODOB+vs+GdIbDsftIkn1E4sQCiPYQ+ggToy4=;
 b=hWMZdIdhEAOpPqdd5QvN3C/WlV5DA4QaN0glIw5/MdnzHAzgaKWAF65ThuiK2CbcSLGy4k8NQCNyA21qGdI5aphOhKjzE5hvIuWFEa/fWptvZDvZ2/yIkR7wUGgCRYaBBGaAK4hKPbigYVJrwCUwC9qd4e9a2DQQZMKxafLTkZA=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB6643.apcprd03.prod.outlook.com (2603:1096:101:7b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Fri, 14 Feb
 2025 03:31:32 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8422.015; Fri, 14 Feb 2025
 03:31:31 +0000
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
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 =?utf-8?B?TGV3aXMgTGlhbyAo5buW5p+P6YieKQ==?= <Lewis.Liao@mediatek.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, =?utf-8?B?VG9tbXlZTCBDaGVuICjpmbPlvaXoia8p?=
 <TommyYL.Chen@mediatek.com>, =?utf-8?B?SXZlcyBDaGVuamggKOmZs+S/iuW8mCk=?=
 <Ives.Chenjh@mediatek.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?=
 <Jason-JH.Lin@mediatek.com>, "junzhi.zhao@mediatek.com"
 <junzhi.zhao@mediatek.com>
Subject: Re: [PATCH v6 09/42] drm/mediatek: mtk_dpi: Explicitly manage TVD
 clock in power on/off
Thread-Topic: [PATCH v6 09/42] drm/mediatek: mtk_dpi: Explicitly manage TVD
 clock in power on/off
Thread-Index: AQHbfHkaiMYyujEbyE64CpDuL6FtRrNGDR4AgAAb0IA=
Date: Fri, 14 Feb 2025 03:31:31 +0000
Message-ID: <8a6031f901df5139f88fa70e7ecae5be4f66a58d.camel@mediatek.com>
References: <20250211113409.1517534-1-angelogioacchino.delregno@collabora.com>
 <20250211113409.1517534-10-angelogioacchino.delregno@collabora.com>
 <5eefa246f471f4b9382d6f20a9ea783136bd80c5.camel@mediatek.com>
In-Reply-To: <5eefa246f471f4b9382d6f20a9ea783136bd80c5.camel@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB6643:EE_
x-ms-office365-filtering-correlation-id: 3ed1cb4a-5820-48b7-ffd4-08dd4ca81354
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?QTB6NDdlQzhYUjVVQjBjYXdoYmYzalNYQmhodHE0TWd4NDdJVWZQRkgvYy9k?=
 =?utf-8?B?cG5tbkRlbmVPMEdESkdyN1F5U2o2RzlYdHVZZmtBa2wxSGxUejYrZUZEWVJW?=
 =?utf-8?B?a0o3Q2dYZkQrQjBaMDluVHRiNm03UDJXU09XWjM0WER5VlFBV1Y0Nk5GMDA4?=
 =?utf-8?B?aG0vZncvYjZtNkp6MEMybnJOQ01ueEl3ZHNBc1JLRUlaUzJtWHRkcVh1WEdx?=
 =?utf-8?B?NldodjBVZXFKYkIxN3VJbEl2elNGQ05XcUQveCt4MmdMZnhYWkdaOGVXbjN1?=
 =?utf-8?B?WkFnYzY0SU1DaW9aNkpTZlFuT1NUby96dTd1SHJqSEs3N2xVQ0FYenZtWGQ0?=
 =?utf-8?B?WlF6eVdMeVp5TFdubjZwTU1CMk9UOEo3bzVQUFZONENPVnFoYzFLbSs5aE9F?=
 =?utf-8?B?dkVRSHBTUXdZQ2ZpdG5JVStUVWNwQWw0cW1xbWJtSHVzV3YrSEIzUGdVem0v?=
 =?utf-8?B?aXNUdGlUV2Fvblo2VVRmQXNQS1Z1TjgwUkczR290TWVrUDNvVUVOQzRLVTZq?=
 =?utf-8?B?a05sYTBtekRDbmI5Z1pNaWNGZGJuR3h0cWU3RDE2VWVhbWVQcjBzZ0x0Mlln?=
 =?utf-8?B?aXFQR0RjcjFVbFUxWEtFSEQwcjlFQmtPTVplUWFkYURVSlMzSzNEWGFZR3Jk?=
 =?utf-8?B?elZaSDk0VzVreDFON25EQmtJNFlTUTZpdGF6cUNMRWNnWVNqYUIyWUxVN1F6?=
 =?utf-8?B?bDVlZEc1alAxbnMrYmFaZCtqdTJJQi90WXQxSlYyaEdYUy9pOEtRS2RWSmF6?=
 =?utf-8?B?ZC9lcFVFYXJLUDJHTldJVnY1QnNyTTVJQnpkTUlCREJ2WEFPRjhZTEEydWV3?=
 =?utf-8?B?QUZDNDFGQkR5dkllbnUraGNXTm9kYkVXT3MwcHRuTnV0S0VkNEh1WTkwMEw2?=
 =?utf-8?B?bG9kc2Q2YnZYRXlGV29LUFBMb0szR3RLODNFZEg2dTNhVHd5TDFpNG9oK3Qr?=
 =?utf-8?B?aENwWWVUVDk2QnhNa0x1Zy8yZ25KLy9ic1h5MllneVk0Z3ZmclRPMHdqNkNW?=
 =?utf-8?B?QmJETjZvMElRQThoVThlVTRxTUZ0NzNmRDVWSDJ5Zmw2ci9OUkpYUTdXc3Bu?=
 =?utf-8?B?cFlZSFd1MWRRblI5VGhQT282MUg3R1ZuWmhvbnovSWQzeUttNkt3RXl5VEhu?=
 =?utf-8?B?cXFHOFEzZlFUYWZRWCtpbU9qUHZod0hFKzV0V2x0b3p4OXJ5QXRsN282NTY2?=
 =?utf-8?B?a1F3ZnR6WXhZSVpIbHlLdDRSNFBkaUpVUTJUNDhMVlhxWmdBZ0NzS21LblJW?=
 =?utf-8?B?bXJzTkZkU3R5WnlldGR5UEVBVWloK1doaGx2VmcyaTF0U0NVaGw1ZHYrejFi?=
 =?utf-8?B?UDJLWVNjbnV5em0zNDBvN0UwS0R0dW1OSTJLTjNNWVZPU3g0V3FNM0UxUGIr?=
 =?utf-8?B?aEpyV0dYbDZYVkpLMytrWWhpNGNTVm5landDdE9XNTdTeVU1OFB4Q0lTMU9j?=
 =?utf-8?B?V0lMd2N3N0NvdEFjUm1UU1orRXZMM2kwRTVpTm1KQjVjdmd0QUsxeE51WStq?=
 =?utf-8?B?YkhML3AvcS80emtyb2FYVzc4Nmg5N2p2MDlYWHBhTnpHeUgxRFowQ0locm1t?=
 =?utf-8?B?dDRRUGhNdlVQVitHbVZsVExiNkk2ODFsYy9ZODRNVDczaStUUmNLZHd5VGRP?=
 =?utf-8?B?M0xYbVVoekpWb1grM1NZbmczWmhQclkyZlIxdExxL0hJeEhoeEJKNUFxYVNz?=
 =?utf-8?B?SkhVcjF4MXBFRzBvVmswSHF5dklobHdtRXoyMFVPOE5ISEpRWE5vT2lhOHZh?=
 =?utf-8?B?MGMrTm53WnVzSkV0ZlVxMkJycko3bFI4aFphQVJrLzgyUHRGWlJiL1ozbUhV?=
 =?utf-8?B?S3lLeURNRmM5dG9OUXA4Q2Mrd0JNN2FVODZWYWVFQWc1UStZNEQ5cC96ZFVS?=
 =?utf-8?B?bFp0aGlWMThvL3o3d1p5UG9oSnRHR1dMcVdmcEhlRW9CbnVUbFdMbmN2akR2?=
 =?utf-8?Q?APP1qyyKTMPvCDf2TS2f+AxlSazSGDEi?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V0dua1Izd1RnaStxRmo3OEFaZjFpU0RSL281eVh3ajI4R0ZadkQvYVJ3b1c5?=
 =?utf-8?B?d0VrakRVRjNXVXF2UU01c1NFRkpwYXdzUGVZK1B5NDdqSDhJOHNycmd6Rm9H?=
 =?utf-8?B?QnA0MUFyMlU2WGJleENCVTFBMHptWGlSZWJrQjY5SXNKWjNzdzBIalNkdEYx?=
 =?utf-8?B?Y3MrRkpMTmZ4LytuV2JqZk5UQVN4WVRYOVF0TGdPaGVZNXU0aEJxNSsrNkRw?=
 =?utf-8?B?WEFBQTZDbHJCMlhUNkxxZEhlUm9qaVJmaG12UzVKaVBwOTZVOEdLUlJRSmpj?=
 =?utf-8?B?UU9PaEdZNmFEaFNJV3ZQOUdDenBVdlovOUpqeWt0MkViQWsrTkFCL0dlWkdK?=
 =?utf-8?B?eDJqTHNHeDZ2N0lid2ZTZ1Y0L0pVRStaVWxIUGo2WG5GNGwweTVLaXU5WlR2?=
 =?utf-8?B?NEs4bExFaWk3UWZBZ3kvV1Z0VjFKT3FRazRPZ3dNQ3pmL2lSTTdSTzY3NXpo?=
 =?utf-8?B?ZjdJRndDUm9QdTBFa0dsU3JXTkExM0F2cHFDcGZIWStYL3ZGRVRnS3VUWm80?=
 =?utf-8?B?cGliN0I1MmZoa3ZRWDFDRTNDS21BalBvK0hwUzFHZmRWVzZDeU9iMysxQ2NP?=
 =?utf-8?B?bVJmcy95NnNLOUd6dGRFZFEvNHd3a1lKV1o0VC9Kb21pcWhaMmI2VHJUMS9O?=
 =?utf-8?B?WHUrb0Rmd0loaS9CNEZweEQ2RVN5U0dHSG5Sd2sybXI1SlFmVnhMT2pQNWs0?=
 =?utf-8?B?WCtTT2dYcTROeTMzT2JsdnBWbmd6YzdmU0tBZ2R4LzdvY1htS3JNYnFobGwy?=
 =?utf-8?B?YXg5N1lIOFd3bzZqZUZXakp3TFVQTGY3RkJxUVhxL25uMU1GQkNZSmNBSU90?=
 =?utf-8?B?cEtCWHpZOHhXUFBoVU4vM2NiUUhEN1F6ekJmRHo3TGNIVUNlNUl2K0tZQmo0?=
 =?utf-8?B?NFlUR0ZpWFdqbXBSaUpQRklMa2ZTNEJPSXp1OWFZVGFZZHpMVHJuMlR6LzNU?=
 =?utf-8?B?WVNJRzh0Rkc0aXF3bktBdVZhN0lzd2hxbnNSTGgzbkNESkg0Vk83SzdPNk9O?=
 =?utf-8?B?R1kvN2IrT21SN04xcitQZXZyc3BLRkthS2xSdVprcmZ1T2FjT3RYb01GWUZF?=
 =?utf-8?B?eUkxeTFkVGJtbWVhdzdvWWNQcmdpbkwzckQrQkZJWVFDK2xuTmlzaU5MU3Iz?=
 =?utf-8?B?OEVXUUhKRlU2TVJzMmhiRmFwWXc1blJEN24wVElFMEJLTmhGc25Nam9ra1JW?=
 =?utf-8?B?Q24rOFpMTXh5cTRhb1Nua1JzWWtsMktUZ1V3VXFwd0JEY250czF5bHRvaHJS?=
 =?utf-8?B?aURCSysya2FBWVA4amNFWlhQMWxQQzlwN3ZQNnNiRGRrTVA3eGptaGVrYmVD?=
 =?utf-8?B?NnhER1R3YWNPRjN2bFhSUWZKZ016LzVOUW0rL2pRQzFTL0ZvWjNWajQvYTJZ?=
 =?utf-8?B?VGlNQXdkeDI3aHQ5WHVFek5WM0JaYUlISjdUUlcwNHVHamxOa3pnU0ZnMGl5?=
 =?utf-8?B?WmVZZCtoWDZiKzgxUnFNT2J0MjNKZnBPM3NMM3BWZzBLZ0UyNXRlY3R3Z0Vu?=
 =?utf-8?B?enh3Tm1wbzZGaGx4VXROTGhRdWcvdHFtYU1qOWlSUlRMV2d3UVhPS01GZ2Qv?=
 =?utf-8?B?YmszeTB0OGVQZTNtWnZJN29OalV3YXdGS0hFNm9FRGlBcmlSWVZTaCtDTUtn?=
 =?utf-8?B?R1BkVFFQc05tQ2Qvdk1zRG5MVyt3NExYQzN3Z2ZpeTN2bUhXT2tjcHR0dFFV?=
 =?utf-8?B?czZYUEZoUFNvRmRWaUdUM25TeXBFWG9TRTA2VlB5Qk9QeUNuMVBYbzQ4eWJr?=
 =?utf-8?B?SjFjRkh1bEs2dWlRNWx4WEp6T1BhcFFYRitkdENaclBpVy83Um4wbHowYXVm?=
 =?utf-8?B?dXgvM09vZi9SeXJBckRmTVhqMHg1WS9aYi9wUk5jVHd4emFET0hWQ2hjWHlV?=
 =?utf-8?B?dGl0K04rRzYyTmNyWStiaHRMNUMrQ2FPM3I3QTJwMjRoSmtSMDRVL01kOTc2?=
 =?utf-8?B?THV1N09ZNE1SSWdZU2ROaDhVNUZIczMrSGxvRUJyS0xYc0hBNjN5QW1nN1Bj?=
 =?utf-8?B?Z2pqcWs5M2x4OWNQeHErMGJnb2d4NFc0dlRzQVhPdWdISkVPSTkyQ3pOaGIv?=
 =?utf-8?B?S1pYUDVuWkdXYUtaVjZ1MElOanZxUVVmOHcyZHRhdWtNL3IwOGQxczcrck5C?=
 =?utf-8?Q?1AVdVvShULg5AvoZSsGnG6d3Z?=
Content-ID: <45AA431953D4E34A9EEA0FD52928D253@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ed1cb4a-5820-48b7-ffd4-08dd4ca81354
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2025 03:31:31.8638 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wGeCkE+D9PphoRBG+P3/yluGriILKeZbfD7Bul5PbY9ubPe8Eoeqd2dJB7r2eyupqCliK68Lb605GJpNEFO0DQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6643
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_007_1075138399.715644104"
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

--__=_Part_Boundary_007_1075138399.715644104
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpLCAyMDI1LTAyLTE0IGF0IDA5OjUxICswODAwLCBDSyBIdSB3cm90ZToNCj4gT24gVHVl
LCAyMDI1LTAyLTExIGF0IDEyOjMzICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyB3
cm90ZToNCj4gPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Ig
b3BlbiBhdHRhY2htZW50cyB1bnRpbCB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiA+IA0KPiA+IA0KPiA+IEluIHByZXBhcmF0aW9uIGZvciBhZGRpbmcgc3Vw
cG9ydCBmb3IgTVQ4MTk1J3MgSERNSSByZXNlcnZlZA0KPiA+IERQSSwgYWRkIGNhbGxzIHRvIGNs
a19wcmVwYXJlX2VuYWJsZSgpIC8gY2xrX2Rpc2FibGVfdW5wcmVwYXJlKCkNCj4gPiBmb3IgdGhl
IFRWRCBjbG9jazogaW4gdGhpcyBwYXJ0aWN1bGFyIGNhc2UsIHRoZSBhZm9yZW1lbnRpb25lZA0K
PiA+IGNsb2NrIGlzIG5vdCAoYW5kIGNhbm5vdCBiZSkgcGFyZW50ZWQgdG8gbmVpdGhlciBwaXhl
bCBvciBlbmdpbmUNCj4gPiBjbG9ja3MgaGVuY2UgaXQgd29uJ3QgZ2V0IGVuYWJsZWQgYXV0b21h
dGljYWxseSBieSB0aGUgY2xvY2sNCj4gPiBmcmFtZXdvcmsuDQo+ID4gDQo+ID4gUGxlYXNlIG5v
dGUgdGhhdCBvbiBhbGwgb2YgdGhlIGN1cnJlbnRseSBzdXBwb3J0ZWQgTWVkaWFUZWsNCj4gPiBw
bGF0Zm9ybXMsIHRoZSBUVkQgY2xvY2sgaXMgYWx3YXlzIGEgcGFyZW50IG9mIGVpdGhlciBwaXhl
bCBvcg0KPiA+IGVuZ2luZSBjbG9ja3MsIGFuZCB0aGlzIG1lYW5zIHRoYXQgdGhlIGNvbW1vbiBj
bG9jayBmcmFtZXdvcmsNCj4gPiBpcyBhbHJlYWR5IGVuYWJsaW5nIHRoaXMgY2xvY2sgYmVmb3Jl
IHRoZSBjaGlsZHJlbi4NCj4gPiBPbiBzdWNoIHBsYXRmb3JtcywgdGhpcyBjb21taXQgd2lsbCBv
bmx5IGluY3JlYXNlIHRoZSByZWZjb3VudA0KPiA+IG9mIHRoZSBUVkQgY2xvY2sgd2l0aG91dCBh
bnkgZnVuY3Rpb25hbCBjaGFuZ2UuDQo+IA0KPiBSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1l
ZGlhdGVrLmNvbT4NCg0KT25lIHF1ZXN0aW9uOg0KTVQ4MTk1IERQSSBjbG9jayBpcyBmcm9tIEhE
TUksIHdoeSBuZWVkIHRvIGNvbnRvbCBUVkQgY2xvY2s/DQpJdCBzZWVtcyB0aGlzIHBhdGNoIGlz
IHJlZHVuZGFudC4NCg0KUmVnYXJkcywNCkNLDQoNCj4gDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1i
eTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9A
Y29sbGFib3JhLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcGkuYyB8IDkgKysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMo
KykNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cGkuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMNCj4gPiBpbmRleCA1YzE1
Yzg5MzU5MTYuLjY3NTA0ZWI4NzRkMiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RwaS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcGkuYw0KPiA+IEBAIC01MDEsNiArNTAxLDcgQEAgc3RhdGljIHZvaWQgbXRrX2RwaV9wb3dl
cl9vZmYoc3RydWN0IG10a19kcGkgKmRwaSkNCj4gPiANCj4gPiAgICAgICAgIG10a19kcGlfZGlz
YWJsZShkcGkpOw0KPiA+ICAgICAgICAgY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGRwaS0+cGl4ZWxf
Y2xrKTsNCj4gPiArICAgICAgIGNsa19kaXNhYmxlX3VucHJlcGFyZShkcGktPnR2ZF9jbGspOw0K
PiA+ICAgICAgICAgY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGRwaS0+ZW5naW5lX2Nsayk7DQo+ID4g
IH0NCj4gPiANCj4gPiBAQCAtNTE3LDYgKzUxOCwxMiBAQCBzdGF0aWMgaW50IG10a19kcGlfcG93
ZXJfb24oc3RydWN0IG10a19kcGkgKmRwaSkNCj4gPiAgICAgICAgICAgICAgICAgZ290byBlcnJf
cmVmY291bnQ7DQo+ID4gICAgICAgICB9DQo+ID4gDQo+ID4gKyAgICAgICByZXQgPSBjbGtfcHJl
cGFyZV9lbmFibGUoZHBpLT50dmRfY2xrKTsNCj4gPiArICAgICAgIGlmIChyZXQpIHsNCj4gPiAr
ICAgICAgICAgICAgICAgZGV2X2VycihkcGktPmRldiwgIkZhaWxlZCB0byBlbmFibGUgdHZkIHBs
bDogJWRcbiIsIHJldCk7DQo+ID4gKyAgICAgICAgICAgICAgIGdvdG8gZXJyX2VuZ2luZTsNCj4g
PiArICAgICAgIH0NCj4gPiArDQo+ID4gICAgICAgICByZXQgPSBjbGtfcHJlcGFyZV9lbmFibGUo
ZHBpLT5waXhlbF9jbGspOw0KPiA+ICAgICAgICAgaWYgKHJldCkgew0KPiA+ICAgICAgICAgICAg
ICAgICBkZXZfZXJyKGRwaS0+ZGV2LCAiRmFpbGVkIHRvIGVuYWJsZSBwaXhlbCBjbG9jazogJWRc
biIsIHJldCk7DQo+ID4gQEAgLTUyNiw2ICs1MzMsOCBAQCBzdGF0aWMgaW50IG10a19kcGlfcG93
ZXJfb24oc3RydWN0IG10a19kcGkgKmRwaSkNCj4gPiAgICAgICAgIHJldHVybiAwOw0KPiA+IA0K
PiA+ICBlcnJfcGl4ZWw6DQo+ID4gKyAgICAgICBjbGtfZGlzYWJsZV91bnByZXBhcmUoZHBpLT50
dmRfY2xrKTsNCj4gPiArZXJyX2VuZ2luZToNCj4gPiAgICAgICAgIGNsa19kaXNhYmxlX3VucHJl
cGFyZShkcGktPmVuZ2luZV9jbGspOw0KPiA+ICBlcnJfcmVmY291bnQ6DQo+ID4gICAgICAgICBk
cGktPnJlZmNvdW50LS07DQo+ID4gLS0NCj4gPiAyLjQ4LjENCj4gPiANCj4gDQoNCg==

--__=_Part_Boundary_007_1075138399.715644104
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO0ZyaSwmIzMyOzIwMjUtMDItMTQmIzMyO2F0
JiMzMjswOTo1MSYjMzI7KzA4MDAsJiMzMjtDSyYjMzI7SHUmIzMyO3dyb3RlOg0KJmd0OyYjMzI7
T24mIzMyO1R1ZSwmIzMyOzIwMjUtMDItMTEmIzMyO2F0JiMzMjsxMjozMyYjMzI7KzAxMDAsJiMz
MjtBbmdlbG9HaW9hY2NoaW5vJiMzMjtEZWwmIzMyO1JlZ25vJiMzMjt3cm90ZToNCiZndDsmIzMy
OyZndDsmIzMyO0V4dGVybmFsJiMzMjtlbWFpbCYjMzI7OiYjMzI7UGxlYXNlJiMzMjtkbyYjMzI7
bm90JiMzMjtjbGljayYjMzI7bGlua3MmIzMyO29yJiMzMjtvcGVuJiMzMjthdHRhY2htZW50cyYj
MzI7dW50aWwmIzMyO3lvdSYjMzI7aGF2ZSYjMzI7dmVyaWZpZWQmIzMyO3RoZSYjMzI7c2VuZGVy
JiMzMjtvciYjMzI7dGhlJiMzMjtjb250ZW50Lg0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMz
MjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyO0luJiMzMjtwcmVwYXJhdGlvbiYjMzI7Zm9y
JiMzMjthZGRpbmcmIzMyO3N1cHBvcnQmIzMyO2ZvciYjMzI7TVQ4MTk1JiMzOTtzJiMzMjtIRE1J
JiMzMjtyZXNlcnZlZA0KJmd0OyYjMzI7Jmd0OyYjMzI7RFBJLCYjMzI7YWRkJiMzMjtjYWxscyYj
MzI7dG8mIzMyO2Nsa19wcmVwYXJlX2VuYWJsZSgpJiMzMjsvJiMzMjtjbGtfZGlzYWJsZV91bnBy
ZXBhcmUoKQ0KJmd0OyYjMzI7Jmd0OyYjMzI7Zm9yJiMzMjt0aGUmIzMyO1RWRCYjMzI7Y2xvY2s6
JiMzMjtpbiYjMzI7dGhpcyYjMzI7cGFydGljdWxhciYjMzI7Y2FzZSwmIzMyO3RoZSYjMzI7YWZv
cmVtZW50aW9uZWQNCiZndDsmIzMyOyZndDsmIzMyO2Nsb2NrJiMzMjtpcyYjMzI7bm90JiMzMjso
YW5kJiMzMjtjYW5ub3QmIzMyO2JlKSYjMzI7cGFyZW50ZWQmIzMyO3RvJiMzMjtuZWl0aGVyJiMz
MjtwaXhlbCYjMzI7b3ImIzMyO2VuZ2luZQ0KJmd0OyYjMzI7Jmd0OyYjMzI7Y2xvY2tzJiMzMjto
ZW5jZSYjMzI7aXQmIzMyO3dvbiYjMzk7dCYjMzI7Z2V0JiMzMjtlbmFibGVkJiMzMjthdXRvbWF0
aWNhbGx5JiMzMjtieSYjMzI7dGhlJiMzMjtjbG9jaw0KJmd0OyYjMzI7Jmd0OyYjMzI7ZnJhbWV3
b3JrLg0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtQbGVhc2UmIzMyO25v
dGUmIzMyO3RoYXQmIzMyO29uJiMzMjthbGwmIzMyO29mJiMzMjt0aGUmIzMyO2N1cnJlbnRseSYj
MzI7c3VwcG9ydGVkJiMzMjtNZWRpYVRlaw0KJmd0OyYjMzI7Jmd0OyYjMzI7cGxhdGZvcm1zLCYj
MzI7dGhlJiMzMjtUVkQmIzMyO2Nsb2NrJiMzMjtpcyYjMzI7YWx3YXlzJiMzMjthJiMzMjtwYXJl
bnQmIzMyO29mJiMzMjtlaXRoZXImIzMyO3BpeGVsJiMzMjtvcg0KJmd0OyYjMzI7Jmd0OyYjMzI7
ZW5naW5lJiMzMjtjbG9ja3MsJiMzMjthbmQmIzMyO3RoaXMmIzMyO21lYW5zJiMzMjt0aGF0JiMz
Mjt0aGUmIzMyO2NvbW1vbiYjMzI7Y2xvY2smIzMyO2ZyYW1ld29yaw0KJmd0OyYjMzI7Jmd0OyYj
MzI7aXMmIzMyO2FscmVhZHkmIzMyO2VuYWJsaW5nJiMzMjt0aGlzJiMzMjtjbG9jayYjMzI7YmVm
b3JlJiMzMjt0aGUmIzMyO2NoaWxkcmVuLg0KJmd0OyYjMzI7Jmd0OyYjMzI7T24mIzMyO3N1Y2gm
IzMyO3BsYXRmb3JtcywmIzMyO3RoaXMmIzMyO2NvbW1pdCYjMzI7d2lsbCYjMzI7b25seSYjMzI7
aW5jcmVhc2UmIzMyO3RoZSYjMzI7cmVmY291bnQNCiZndDsmIzMyOyZndDsmIzMyO29mJiMzMjt0
aGUmIzMyO1RWRCYjMzI7Y2xvY2smIzMyO3dpdGhvdXQmIzMyO2FueSYjMzI7ZnVuY3Rpb25hbCYj
MzI7Y2hhbmdlLg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtSZXZpZXdlZC1ieTomIzMyO0NLJiMzMjtI
dSYjMzI7Jmx0O2NrLmh1QG1lZGlhdGVrLmNvbSZndDsNCg0KT25lJiMzMjtxdWVzdGlvbjoNCk1U
ODE5NSYjMzI7RFBJJiMzMjtjbG9jayYjMzI7aXMmIzMyO2Zyb20mIzMyO0hETUksJiMzMjt3aHkm
IzMyO25lZWQmIzMyO3RvJiMzMjtjb250b2wmIzMyO1RWRCYjMzI7Y2xvY2smIzYzOw0KSXQmIzMy
O3NlZW1zJiMzMjt0aGlzJiMzMjtwYXRjaCYjMzI7aXMmIzMyO3JlZHVuZGFudC4NCg0KUmVnYXJk
cywNCkNLDQoNCiZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMz
MjtTaWduZWQtb2ZmLWJ5OiYjMzI7QW5nZWxvR2lvYWNjaGlubyYjMzI7RGVsJiMzMjtSZWdubyYj
MzI7Jmx0O2FuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbSZndDsNCiZndDsm
IzMyOyZndDsmIzMyOy0tLQ0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjtkcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RwaS5jJiMzMjt8JiMzMjs5JiMzMjsrKysrKysrKysNCiZndDsmIzMyOyZn
dDsmIzMyOyYjMzI7MSYjMzI7ZmlsZSYjMzI7Y2hhbmdlZCwmIzMyOzkmIzMyO2luc2VydGlvbnMo
KykNCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7ZGlmZiYjMzI7LS1naXQm
IzMyO2EvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYyYjMzI7Yi9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtpbmRleCYjMzI7NWMx
NWM4OTM1OTE2Li42NzUwNGViODc0ZDImIzMyOzEwMDY0NA0KJmd0OyYjMzI7Jmd0OyYjMzI7LS0t
JiMzMjthL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMNCiZndDsmIzMyOyZndDsm
IzMyOysrKyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jDQomZ3Q7JiMz
MjsmZ3Q7JiMzMjtAQCYjMzI7LTUwMSw2JiMzMjsrNTAxLDcmIzMyO0BAJiMzMjtzdGF0aWMmIzMy
O3ZvaWQmIzMyO210a19kcGlfcG93ZXJfb2ZmKHN0cnVjdCYjMzI7bXRrX2RwaSYjMzI7KmRwaSkN
CiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyO210a19kcGlfZGlzYWJsZShkcGkpOw0KJmd0OyYjMzI7Jmd0
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO2Nsa19kaXNhYmxl
X3VucHJlcGFyZShkcGktJmd0O3BpeGVsX2Nsayk7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrJiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtjbGtfZGlzYWJsZV91bnByZXBhcmUoZHBpLSZn
dDt0dmRfY2xrKTsNCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjtjbGtfZGlzYWJsZV91bnByZXBhcmUoZHBpLSZndDtlbmdpbmVfY2xrKTsN
CiZndDsmIzMyOyZndDsmIzMyOyYjMzI7fQ0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsm
Z3Q7JiMzMjtAQCYjMzI7LTUxNyw2JiMzMjsrNTE4LDEyJiMzMjtAQCYjMzI7c3RhdGljJiMzMjtp
bnQmIzMyO210a19kcGlfcG93ZXJfb24oc3RydWN0JiMzMjttdGtfZHBpJiMzMjsqZHBpKQ0KJmd0
OyYjMzI7Jmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtnb3RvJiMzMjtlcnJfcmVmY291
bnQ7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7fQ0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrJiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtyZXQmIzMyOz0mIzMyO2Nsa19wcmVwYXJlX2VuYWJs
ZShkcGktJmd0O3R2ZF9jbGspOw0KJmd0OyYjMzI7Jmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7aWYmIzMyOyhyZXQpJiMzMjt7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsr
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7ZGV2X2VycihkcGktJmd0O2RldiwmIzMyOyZxdW90O0ZhaWxlZCYj
MzI7dG8mIzMyO2VuYWJsZSYjMzI7dHZkJiMzMjtwbGw6JiMzMjslZCYjOTI7biZxdW90OywmIzMy
O3JldCk7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7Z290byYjMzI7ZXJy
X2VuZ2luZTsNCiZndDsmIzMyOyZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyO30NCiZndDsmIzMyOyZndDsmIzMyOysNCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtyZXQmIzMyOz0mIzMyO2Nsa19wcmVwYXJl
X2VuYWJsZShkcGktJmd0O3BpeGVsX2Nsayk7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7aWYmIzMyOyhyZXQpJiMzMjt7DQomZ3Q7JiMz
MjsmZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO2Rldl9lcnIoZHBpLSZndDtkZXYsJiMz
MjsmcXVvdDtGYWlsZWQmIzMyO3RvJiMzMjtlbmFibGUmIzMyO3BpeGVsJiMzMjtjbG9jazomIzMy
OyVkJiM5MjtuJnF1b3Q7LCYjMzI7cmV0KTsNCiZndDsmIzMyOyZndDsmIzMyO0BAJiMzMjstNTI2
LDYmIzMyOys1MzMsOCYjMzI7QEAmIzMyO3N0YXRpYyYjMzI7aW50JiMzMjttdGtfZHBpX3Bvd2Vy
X29uKHN0cnVjdCYjMzI7bXRrX2RwaSYjMzI7KmRwaSkNCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtyZXR1cm4mIzMyOzA7DQomZ3Q7JiMz
MjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7ZXJyX3BpeGVsOg0KJmd0OyYjMzI7
Jmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7Y2xrX2Rpc2FibGVf
dW5wcmVwYXJlKGRwaS0mZ3Q7dHZkX2Nsayk7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrZXJyX2VuZ2lu
ZToNCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjtjbGtfZGlzYWJsZV91bnByZXBhcmUoZHBpLSZndDtlbmdpbmVfY2xrKTsNCiZndDsmIzMy
OyZndDsmIzMyOyYjMzI7ZXJyX3JlZmNvdW50Og0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO2RwaS0mZ3Q7cmVmY291bnQtLTsNCiZndDsm
IzMyOyZndDsmIzMyOy0tDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsyLjQ4LjENCiZndDsmIzMyOyZndDsm
IzMyOw0KJmd0OyYjMzI7DQoNCg0KPC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlwZTp0
ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5
IE5vdGljZSAqKioqKioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBp
biB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBi
ZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4
ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRl
ZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBB
bnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmlu
ZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMp
IGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1h
eSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2Yg
dGhpcyBlLW1haWwsIG9yIGJlbGlldmUgDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1t
YWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkg
cmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0K
dGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0s
IGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBv
dGhlciBwZXJzb24uIFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_007_1075138399.715644104--

