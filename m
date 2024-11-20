Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D837C9D335E
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 07:03:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B01110E05A;
	Wed, 20 Nov 2024 06:03:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="ZZT+okdg";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="OfD75UDW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0810210E05A
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2024 06:03:49 +0000 (UTC)
X-UUID: 317d269ca70511efbd192953cf12861f-20241120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=xrjcNOaiGrbx6Qd/HsmRlLC4CtzkYmCWJeILiIlva7E=; 
 b=ZZT+okdgJes3n0fF5Q2EBtzPh7gIonlQ4cumrmR7kx5qJBPdTIpXI/hrXoucjfZElhZR7QAwBB0Yeqk4j7x4wo/J1IVVZnruJo+ziDba4bIoeti4n20Yl6KU8QZn5+QEG3FcCadUr0onia2y+46N541Bv9uSLNOFpqIrPZcacKw=;
X-CID-CACHE: Type:Local,Time:202411201321+08,HitQuantity:2
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44, REQID:165449be-47ed-4285-8295-353216dea3a3, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:464815b, CLOUDID:7ac917b9-596a-4e31-81f2-cae532fa1b81,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
 :-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
 ,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 317d269ca70511efbd192953cf12861f-20241120
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1711567807; Wed, 20 Nov 2024 14:03:41 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 20 Nov 2024 14:03:39 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Nov 2024 14:03:39 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=buEpTwWqBmp5vdYKjtO+3AYT+Un5sb7MxgxGmuEvPCJHEXFGMjpdFLUf5ys1yHoZbxqDhWM9yfrybHl4egfTcPYxSKiU7OmLJQUa8yJZjSmavr33WsBqxKfSoppIPVXxp/b2LL8rYz7Xldw01zBUp4yp2QlecDAD3o5amDQVqdTf+fJKYrPhGLm3tPRRDzpiGx3MDrHoqdqFhZhCK2P1/dI6duKAb2xbsSieOPdk4ZzyRxWXTgLmgIptYnRsy4OtqLqiJdHDs+xjDyR3Fs5GI6hGRhWfaPtvgM2CWJWSUwQb4HuD+kQjafvDyyhUNc1K2xXCU3xl7/Qap+MDIKuB9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jBOQN2DnnHkSDRg5ACtoPwCB5o444S+Gmt2Q3IJVvYw=;
 b=rGvX06vq3XegiV6dVYFMCHKMzmozcbV4yR7IQaBb12EInmD57WI4sml6S9XkcwvJSI6s1ptpJ+vU0MTu2nOJQn4SDDbaEA5aeQH4YWtos1ZTTcwBmRCi9yAvSTozkdbeXEPIKBK088pTMmaYoJbvFPtlbMHg21itBwwEHEd6qBtYN0PALem3S5baSgx+RrvLKmUo1G/ORJsrjleXVAzIYqC9XV18wZ8bIfH34f1o+bG9PZHwd/gWp1H6jXx9O4yij2/UV2ycdn9b7ZyUgfSyV5EyQLa/iPxbc/bXMZLO+nNiFfIk0vU26oQyEpU1JHCK1qdnAbmvU4GoX6mP4Bk5DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jBOQN2DnnHkSDRg5ACtoPwCB5o444S+Gmt2Q3IJVvYw=;
 b=OfD75UDWSqnxs5OUoM+U+bcYxQFb5uRuUifGTnb851oi+cvAXQFiPfLSHN0x3kxxyp06Dhem6uiN5iYiXpyzskJBUiErkPnldCwmWyaNUe4ST2tqpa2TbzD0/ilXkl1lQ9nvPGMCq28cbY617GmILG1cKA+KZWUO3RmuQV3jyeI=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TY0PR03MB6426.apcprd03.prod.outlook.com (2603:1096:400:1ae::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Wed, 20 Nov
 2024 06:03:36 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8158.017; Wed, 20 Nov 2024
 06:03:36 +0000
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
Subject: Re: [PATCH v1 06/10] media: platform: mediatek: add isp_7x utility
Thread-Topic: [PATCH v1 06/10] media: platform: mediatek: add isp_7x utility
Thread-Index: AQHbGj2JaAd/ufwz/0W0Edv5eKs5YbK/sWaAgAA9/YA=
Date: Wed, 20 Nov 2024 06:03:36 +0000
Message-ID: <f8dcac951608baf5b563a0094f8e320ba7ae0243.camel@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
 <20241009111551.27052-7-Shu-hsiang.Yang@mediatek.com>
 <16f46f30852c771ae8f787eb6abaa6c92ea3c5f3.camel@mediatek.com>
In-Reply-To: <16f46f30852c771ae8f787eb6abaa6c92ea3c5f3.camel@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TY0PR03MB6426:EE_
x-ms-office365-filtering-correlation-id: 2df70bec-13b4-4c35-4297-08dd0929129e
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|366016|376014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?NXdKRXRFWGp2bkg1ODNOVnlvSTZ4UkNqbTZUT0NmZnAyWmViMXRBdHlQU3B2?=
 =?utf-8?B?THkwVDlWSDBVMS81NnVMM2Z6U29YMUJOZDdzWmZmR3lwalprRk5pdEVYSzNJ?=
 =?utf-8?B?SndPaGR2WnI2cmZZcjh6Y2Z5Znp0eUpMamhrNlBBOXFCNHFtTkJXcS9FR1di?=
 =?utf-8?B?a2dPVzRYNUtRekhmdWYxVll1V0RYeFBlRm5YWlBvMjNOVVQ0dkkwaUsrUUhR?=
 =?utf-8?B?eFdXNWpHSzlZclltWnpuQ1BRdnBmVDZEU3FESXRTVk5RUGZ1NHlvRDNVVTh1?=
 =?utf-8?B?SUs4YTJDKzdJaHE4YzdVRnNGZTVkdmdybm1MaGl4NjNhSGhFRWVqTFZVR0wy?=
 =?utf-8?B?d1J2blViRmoyeVhXWXBaVzE3ZTVwV0Q1U1FXVzNYT2xQUSt5ZDV0Vm4wd1J1?=
 =?utf-8?B?clRVdmxiWHFnUGIyZUE2V2dCcUJUUTdTS2kyN09xamdsWmF4VUtPL01sd0tx?=
 =?utf-8?B?S0s0MFVzR3doQWR4YXpUN3lVQ2xGOEd2Sjdkc0o3OFJNMFc1R25XWTA1UGdu?=
 =?utf-8?B?RjJMVW5hNzJuSXpJV1dpdGlXdVh5ek40ZTNLc3FrMUlsVVNuT3g2K0tDbndF?=
 =?utf-8?B?alJiUEVkNGZKWFFOM09waGd2UVhFekRmdlRJUUlpZGlhMHB3SWZxZEZXSlF1?=
 =?utf-8?B?RTJyTnBuWHJKb29uc2dnbzJKNUpFRTBOYU8vU2NYMTExWk0zWFdRa01qajRF?=
 =?utf-8?B?blFZdjdpcVhzUHlhUXhJaHpucVVZdWdxMVFqSWFQSDlGazdiRG4yQkE5a2Mv?=
 =?utf-8?B?YzdpUlZDTVAzSDl3dDFySS80T05uYXY1QXhpMHJ0cGRoYlhoVlljYTJJYTJ2?=
 =?utf-8?B?a1g4MW9Da0YraUMrVlZWN3lFU2c2TXdnaG9uamhLN3FQSTBsN1RldURZdEt1?=
 =?utf-8?B?WURicHp1ZE1lN1lkdW5ZdWkxQ1J5N0dtOURHWk9lV2FLVkVoUzVyYnZ0NVUv?=
 =?utf-8?B?OHB6YW1kV0UyZE1sR1BUNXhsdnIyOXJRRzFVSVExM2w3Nzdxa2V4anBJL2hG?=
 =?utf-8?B?c3dpeE9BR0dab2NISWhoc1VNa2lsV2tHTzd0Uk5FVVRubFVjZ1ZRQ2N6bjB1?=
 =?utf-8?B?VjU4ZUZBb085SVYvSkI3UEZJOTJkSkVOYXJ0Z0F1ekpzU2ZidXhBaXZnTnRi?=
 =?utf-8?B?aTFYVTRXSXBLbjV4YXk2b3Y5dVU1WG8zU0NJc1pjNVpKZnhRZ0tST3dOS2Ex?=
 =?utf-8?B?U29QZ3k3Q3BERlFqRjhvWmVkSk05WktmcUdncGM4VnRJU3pkcDAvVGtuZWJt?=
 =?utf-8?B?Mzg2Z2g4dmcrYlRCNmFYREdmTlNsbzV2eCs3c3RHQ3hIQWlxeTdKWktmbDlh?=
 =?utf-8?B?VWhtT2IyN25BUnBEZ0MwRktadkZPekhBL1prUGtWb1JKYWVKai9iMjhRb0U1?=
 =?utf-8?B?dkF5NzJqSG1IcVlXVE1yN1lodXZ5cmJWNWJraEdnS05vZExXOEs1MVd5WnZJ?=
 =?utf-8?B?cjBvWWZOQVVEWkc5VnVQdzNOd0NTdm0vUE9aK29EMW9seTdybExqdGxVTTlL?=
 =?utf-8?B?MVloR1BtSG9rWk1MWlRjV0xuSGtMQWcrK1NGS0JENTQyK2F2U29kQUJqOTZk?=
 =?utf-8?B?ZWZGQjVZeURLOVZBbHFOcU5mV1M0aldXOFVXTlJsNlFsUVpua1VIOHpQRVhD?=
 =?utf-8?B?eWdjOE03cTM4ZHEranVIWnVQOHFHMC9ZWUxEck1jWjBQU2xZenljZGpOZWhX?=
 =?utf-8?B?YW4wQ3VicW1RMG91ekpuTXFiK1dLVlZuczZGQS9obXNsdUNvdE9YQWdMTURU?=
 =?utf-8?B?M21QNXRHbzNHNlNrSFR6RWdXeWNqTE83YTZzZlRZYk54K3NZbHY1Tm5KZEg1?=
 =?utf-8?Q?NGwl/2HZXHKJdXJg9LQfJ893o3Byi0K6Fes1M=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WnZKNnRLdm84a1hUNG1KSnlxMzBzaUthajFZV1hnMURSbXA0cnFIa2JWdEFi?=
 =?utf-8?B?TlRCaEFBeEt5dThTNzh2UzRiWFdPU3IvbkZHelRFUTA4OXlvTWJSL0Nhd2dz?=
 =?utf-8?B?S2xSVDI0TnBVMm02SVBGNEw0b1FlRnYzQnB2eVdlcStFa0RKd1BaMXR5Mm5U?=
 =?utf-8?B?cEJJZDZUcUtDMWd1WXNtK0l6dEJpODJRb1JrWWpLWmFISDMzeUpWdmtLOGtH?=
 =?utf-8?B?VHd6cjVZekhPc045Um0yTFRzTWcrdzdCbDhRa3p5ZkNhajV3RTV6UStJaVkr?=
 =?utf-8?B?ck9heWx3UVFHSUpCaC9DSmlVTUd2N0NrNy9iR0VQSG5rcWdONHJMRTFtS1BB?=
 =?utf-8?B?djlXbHdnOG51NmpTK3B3QzNDMHdrWkVKREdNR3pTY0RmeUUxOUlFUkYvS0Fk?=
 =?utf-8?B?bmYvV2lXUU8vbC9ncjltNG9YWCt6YUxXS3BuR1hUZVZMTUpsa1BQRnBtT3pv?=
 =?utf-8?B?cEZrUVoxWGZKRWFXaTZnZHFDOFAreitmOGhVZzhjSmxqLzJoNjdtaGRXYm1s?=
 =?utf-8?B?MzZKV2hrWEpzZGpReStrMEdVL2JTVEl4SC9Yb3RmTlhIQzdjVjBDUURseW8v?=
 =?utf-8?B?TkJKNU5qdEFFdmFQamQrYXZ5YjlnN0NQN3JUL1ZPODdlb28xc21CRnJMQ2hS?=
 =?utf-8?B?aUh0cS82TXQzWVF2Y2trbWhXTjZOSzYweStPdXVBaml0eUU3OHRwamd4OERS?=
 =?utf-8?B?aG5pVmJOeER2UU5NVU54S2xwN0lpY1M3YlB5NW1FS0N2c2h5aTQyQ1lvWVpx?=
 =?utf-8?B?TjdIWTEvY09LRWVMVUI5SVcrblkyRUh0cVBWREtwRkhHU3dUalV4VHZWcVVV?=
 =?utf-8?B?Qzg5R3JTMk9Wd0RDcTZSblFrdHZDQlZwUm9qOHFvNkFxUVFKQm1sUlhFRGdD?=
 =?utf-8?B?NDBsc1dxWVlFM2p1V3hYN1d0TXhmRG1NQkJjQUE4WHQzVW55WFVXR3pKNUhQ?=
 =?utf-8?B?NU5lcEVUR1Ixd0RNYlJmdlNxTTBIczNWdUlVSDJrcDN1ajJ0TGpxNVRZREpN?=
 =?utf-8?B?L3djamk2cGNKb1ZaZ082d3Y4aG5FY1dqVnVlZWhlK3pudmdyOE50T1lFbWZO?=
 =?utf-8?B?UDlpb0xJblJDdk9KVHhNam8ycmlWT1hQeXo5aHZRMndabXRDc1Bxc1l6aXAz?=
 =?utf-8?B?RVdITjJMVlprdmcrRGtyL1pjZ1RUd0ZXVC9pTlhUWVNnZWk5ZFljUks3WHJr?=
 =?utf-8?B?aHdKbWRiaFk5dXJwdGNwQVhEVWViY0RmQmFvbm8rdzQ5NXNGaUxrRHM0ZFVY?=
 =?utf-8?B?bVNxZUlSR2d2QUY2bDFrUVZuZXRhVWdpSlRscWRQM1orUlY1ZU5FL3Y2ME9j?=
 =?utf-8?B?Ry93SnNRcy9wUDFSRnFxelM4WlQvOXZUMHZZT1FHRGtMODlBNWhXR2FwMFR2?=
 =?utf-8?B?S2JsS3ErdWZoMHJTNGtBdjlzcnA4bk5WbXdhNGhLTVg2K2hjWUhaQzhFUWJN?=
 =?utf-8?B?L2FYMkxtQXRDRlZFVk84OGh1SXFkeTgxZWxmNWx5Z3RUMzVJa0lwbWZ1TE9V?=
 =?utf-8?B?SHVxU2U2TnBHZiswVFo4ZEhrOUI0U3Z0QWtBaVk5ZDBIblBTck1pSXh4ZFNS?=
 =?utf-8?B?d0FJTUk4VEtkdEdaTHh3L0FUaVVkdGdIejNYRktkcGQzU2E1TEx6WmpNM2Jv?=
 =?utf-8?B?Qk0rQ3lBb2VlRmY3SC9kOTU1S0grZ3BDVVdGVmtnZnVvWmxaajNSY3BPdEFE?=
 =?utf-8?B?YjZNVmM3SHZYRGVLM1dhSk54U1MwajJnckp2YUdpaXFNcW9EdUE4bEJReDBz?=
 =?utf-8?B?eWpvMFlBL2FFM0hBN29Kb2ROeUxlV1VOQURud3RGYmZPSlRNd29Nb0R0d0Nm?=
 =?utf-8?B?WTNIS1JvaHIxWHd0RnRRdzliT3pvYkVqNW8vaFZJSmJESWJMenRhb3B3OHpv?=
 =?utf-8?B?ZEVHbG5mVks2V3M3OFNBejBZYzcxbHYvNDNnZG0rM2FpbE9Pb3ducTliWFpQ?=
 =?utf-8?B?WThHM0QwUml2c3dQbTdlRWxtUXd3UkFRSnhHRHpFTHVhNzJhemlRVnl0aEtZ?=
 =?utf-8?B?alYzcHNCOXF0ZCt4ajhyZEczMWpkK0RaVTZXZEtNQUhiVndCUG4xcHNLZHRR?=
 =?utf-8?B?ZlpaSGsvdHIxSFd5WXRtSW5FY3BteXFxVksvd25aeVdCWUpscEpDT1lhaVR2?=
 =?utf-8?Q?U6LOsYVYaLYJp/Avcg8fFiz80?=
Content-ID: <B3105ACCCF0C1143AA79548BA8CEAF0E@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2df70bec-13b4-4c35-4297-08dd0929129e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2024 06:03:36.6777 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aBAAi60iP9OuwpjpOBtvHRpIijr6+mneG1JJvT6jAmFWFcRoCPaH/LI9XMRCFh9VSinmytf9ZbkVB6Km/MoPRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6426
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--21.151500-8.000000
X-TMASE-MatchedRID: oTBA/+sdKaZm6oeM5+OJFCaix8JZpk78jLOy13Cgb4/mNRhvDVinv7mn
 rGB/kwGMu8VKDO6dgUY/k+dw+d1SPMM8uuVxUoODQmUmxs/F14NG/JUd7BvSQkdmDSBYfnJRz/v
 cBk2M7lJWfnNe4UPfE7orMF3FkrbywV5ZD2sQLdVAKD7bjg/G2i6GDroi1vrl/NpLPdn/hpogLg
 8ukvShb0NaCPH88XfMr3A53hgRMlnwA3qiE1QHoZ4CIKY/Hg3AwWulRtvvYxTUHQeTVDUrItRnE
 QCUU+jzjoczmuoPCq2UTGVAhB5EbQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--21.151500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: E1B094E4F12609716D8543449717A2D349B5CA95ADBC4B5FB2CB5B7C37C604422000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_005_1213208745.1587044536"
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

--__=_Part_Boundary_005_1213208745.1587044536
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFNodS1oc2lhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMS0yMCBhdCAxMDoyMSArMDgwMCwgQ0sg
SHUgd3JvdGU6DQo+IEhpLCBTaHUtaHNpYW5nOg0KPiANCj4gT24gV2VkLCAyMDI0LTEwLTA5IGF0
IDE5OjE1ICswODAwLCBTaHUtaHNpYW5nIFlhbmcgd3JvdGU6DQo+ID4gSW50cm9kdWNlcyB1dGls
aXR5IGZpbGVzIGZvciB0aGUgTWVkaWFUZWsgSVNQNy54IGNhbXN5cyBkcml2ZXIuIFRoZXNlDQo+
ID4gdXRpbGl0aWVzIHByb3ZpZGUgZXNzZW50aWFsIHBsYXRmb3JtIGRlZmluaXRpb25zLCBkZWJ1
Z2dpbmcgdG9vbHMsIGFuZA0KPiA+IG1hbmFnZW1lbnQgZnVuY3Rpb25zIHRvIHN1cHBvcnQgSVNQ
IG9wZXJhdGlvbnMgYW5kIFNDUCBjb21tdW5pY2F0aW9uLg0KPiA+IEtleSBmdW5jdGlvbmFsaXRp
ZXMgaW5jbHVkZToNCj4gPiAxLkhhcmR3YXJlIHBpcGVsaW5lIGFuZCByZWdpc3RlciBkZWZpbml0
aW9ucyBmb3IgbWFuYWdpbmcgaW1hZ2UNCj4gPiBwcm9jZXNzaW5nIG1vZHVsZXMuDQo+ID4gMi5E
TUEgZGVidWdnaW5nIHV0aWxpdGllcyBhbmQgYnVmZmVyIG1hbmFnZW1lbnQgZnVuY3Rpb25zLg0K
PiA+IDMuRGVmaW5pdGlvbnMgb2Ygc3VwcG9ydGVkIGltYWdlIGZvcm1hdHMgZm9yIHByb3BlciBk
YXRhIGhhbmRsaW5nLg0KPiA+IDQuSVBJIGFuZCBTQ1AgY29tbXVuaWNhdGlvbiBzdHJ1Y3R1cmVz
IGZvciBtb2R1bGUgc3RhdGUgbWFuYWdlbWVudCBhbmQNCj4gPiBjb25maWd1cmluZyBJU1AuDQo+
ID4gNS5NZXRhZGF0YSBwYXJhbWV0ZXJzIGZvciBjb25maWd1cmluZyBpbWFnZSBwcm9jZXNzaW5n
Lg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFNodS1oc2lhbmcgWWFuZyA8U2h1LWhzaWFuZy5Z
YW5nQG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gDQo+IFtzbmlwXQ0KPiANCj4gPiArDQo+ID4g
K2VudW0gbXRrY2FtX2lwaV9yYXdfdmlkZW9faWQgew0KPiANCj4gSXQncyBiZXR0ZXIgdG8gdXNl
ICdzY3AnIGluc3RlYWQgb2YgJ2lwaScuDQo+IFRoZSBpbnRlcmZhY2UgaXMgcHJvdmlkZWQgYnkg
c2NwLg0KPiBpcGkganVzdCB0cmFuc2ZlciBkYXRhIGJldHdlZW4gbXRrY2FtIGFuZCBzY3AgYW5k
IGlwaSBkb2VzIG5vdCBjYXJlIHRoZSBkYXRhIGNvbnRlbnQuDQoNCkZvcmdldCBteSBwcmV2aW91
cyBjb21tZW50Lg0KSSBmaW5kIHRoZSBzY3AgY29tbWFuZCBpcyBTQ1BfSVBJX0lTUF9DTUQgb3Ig
U0NQX0lQSV9JU1BfRlJBTUUuDQpTbyBtYXliZSB0aGUgcHJlZml4IHNob3VsZCBiZSBzY3BfaXBp
X2lzcCBzbyBzb21lIHNob3J0ZXIgc3ltYm9sIGxpa2UgaXNwLg0KDQpSZWdhcmRzLA0KQ0sNCg0K
PiANCj4gPiArCU1US0NBTV9JUElfUkFXX0lEX1VOS05PV04JPSAwLA0KPiANCj4gRGl0dG8uDQo+
IA0KPiA+ICsJTVRLQ0FNX0lQSV9SQVdfUkFXSV8yLAkJLyogUkFXSV9SMiAqLw0KPiANCj4gRGl0
dG8uDQo+IA0KPiA+ICsJTVRLQ0FNX0lQSV9SQVdfUkFXSV8zLAkJLyogUkFXSV9SMyAqLw0KPiAN
Cj4gRGl0dG8uDQo+IA0KPiA+ICsJTVRLQ0FNX0lQSV9SQVdfUkFXSV81LAkJLyogUkFXSV9SNSAq
Lw0KPiANCj4gRGl0dG8uDQo+IA0KPiA+ICsJTVRLQ0FNX0lQSV9SQVdfUkFXSV82LAkJLyogUkFX
SV9SNiAqLw0KPiA+ICsJTVRLQ0FNX0lQSV9SQVdfSU1HTywJCS8qIElNR09fUjEgKi8NCj4gPiAr
CU1US0NBTV9JUElfUkFXX1VGRU8sCQkvKiBVRkVPX1IxICovDQo+ID4gKwlNVEtDQU1fSVBJX1JB
V19SUlpPLAkJLyogUlJaT19SMSAqLw0KPiA+ICsJTVRLQ0FNX0lQSV9SQVdfVUZHTywJCS8qIFVG
R09fUjEgKi8NCj4gPiArCU1US0NBTV9JUElfUkFXX1lVVk9fMSwJCS8qIFlVVk9fUjEgKi8NCj4g
PiArCU1US0NBTV9JUElfUkFXX1lVVk9fMiwJCS8qIFlVVk9fUjIgKi8NCj4gPiArCU1US0NBTV9J
UElfUkFXX1lVVk9fMywJCS8qIFlVVk9fUjMgKi8NCj4gPiArCU1US0NBTV9JUElfUkFXX1lVVk9f
NCwJCS8qIFlVVk9fUjQgKi8NCj4gPiArCU1US0NBTV9JUElfUkFXX1lVVk9fNSwJCS8qIFlVVk9f
UjUgKi8NCj4gPiArCU1US0NBTV9JUElfUkFXX1JaSDFOMlRPXzIsCS8qIFJaSDFOMlRPX1IyICov
DQo+ID4gKwlNVEtDQU1fSVBJX1JBV19EUlpTNE5PXzEsCS8qIERSWlM0Tk9fUjEgKi8NCj4gPiAr
CU1US0NBTV9JUElfUkFXX0RSWlM0Tk9fMiwJLyogRFJaUzROT19SMiAqLw0KPiA+ICsJTVRLQ0FN
X0lQSV9SQVdfRFJaUzROT18zLAkvKiBEUlpTNE5PX1IzICovDQo+ID4gKwlNVEtDQU1fSVBJX1JB
V19SWkgxTjJUT18zLAkvKiBSWkgxTjJUT19SMyAqLw0KPiA+ICsJTVRLQ0FNX0lQSV9SQVdfUlpI
MU4yVE9fMSwJLyogUlpIMU4yVE9fUjEgKi8NCj4gPiArCU1US0NBTV9JUElfUkFXX01FVEFfU1RB
VFNfQ0ZHLAkvKiBBbGwgc2V0dGluZ3MgKi8NCj4gPiArCU1US0NBTV9JUElfUkFXX01FVEFfU1RB
VFNfMCwJLyogc3RhdGlzdGljcyAqLw0KPiA+ICsNCj4gPiArCS8qDQo+ID4gKwkgKiBNVEtDQU1f
SVBJX1JBV19NRVRBX1NUQVRTXzEgaXMgZm9yIEFGTyBvbmx5LCB0aGUgYnVmZmVyIGNhbiBiZQ0K
PiA+ICsJICogZGVxdWV1ZWQgb25jZSB3ZSBnb3QgdGhlICBkbWEgZG9uZS4NCj4gPiArCSAqLw0K
PiA+ICsJTVRLQ0FNX0lQSV9SQVdfTUVUQV9TVEFUU18xLA0KPiA+ICsNCj4gPiArCS8qIHN0YXRp
c3RpY3MgbWF5IGJlIHBhc3MgdG8gRElQICovDQo+ID4gKwlNVEtDQU1fSVBJX1JBV19NRVRBX1NU
QVRTXzIsDQo+ID4gKwlNVEtDQU1fSVBJX1JBV19JRF9NQVgsDQo+ID4gK307DQo+ID4gKw0KPiA+
ICsvKiBTdXBwb3J0ZWQgYmF5ZXIgcGl4ZWwgb3JkZXIgKi8NCj4gPiArZW51bSBtdGtjYW1faXBp
X2JheWVyX3B4bF9pZCB7DQo+IA0KPiBEaXR0by4NCj4gDQo+IFJlZ2FyZHMsDQo+IENLDQo+IA0K
PiA+ICsJTVRLQ0FNX0lQSV9CQVlFUl9QWExfSURfQgkJPSAwLA0KPiA+ICsJTVRLQ0FNX0lQSV9C
QVlFUl9QWExfSURfR0IJCT0gMSwNCj4gPiArCU1US0NBTV9JUElfQkFZRVJfUFhMX0lEX0dSCQk9
IDIsDQo+ID4gKwlNVEtDQU1fSVBJX0JBWUVSX1BYTF9JRF9SCQk9IDMsDQo+ID4gKwlNVEtDQU1f
SVBJX0JBWUVSX1BYTF9JRF9VTktOT1dOCQk9IDQsDQo+ID4gK307DQo+ID4gKw0KPiANCj4gDQo=

--__=_Part_Boundary_005_1213208745.1587044536
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtTaHUtaHNpYW5nOg0KDQpPbiYjMzI7V2Vk
LCYjMzI7MjAyNC0xMS0yMCYjMzI7YXQmIzMyOzEwOjIxJiMzMjsrMDgwMCwmIzMyO0NLJiMzMjtI
dSYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtIaSwmIzMyO1NodS1oc2lhbmc6DQomZ3Q7JiMzMjsNCiZn
dDsmIzMyO09uJiMzMjtXZWQsJiMzMjsyMDI0LTEwLTA5JiMzMjthdCYjMzI7MTk6MTUmIzMyOysw
ODAwLCYjMzI7U2h1LWhzaWFuZyYjMzI7WWFuZyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjsmZ3Q7JiMz
MjtJbnRyb2R1Y2VzJiMzMjt1dGlsaXR5JiMzMjtmaWxlcyYjMzI7Zm9yJiMzMjt0aGUmIzMyO01l
ZGlhVGVrJiMzMjtJU1A3LngmIzMyO2NhbXN5cyYjMzI7ZHJpdmVyLiYjMzI7VGhlc2UNCiZndDsm
IzMyOyZndDsmIzMyO3V0aWxpdGllcyYjMzI7cHJvdmlkZSYjMzI7ZXNzZW50aWFsJiMzMjtwbGF0
Zm9ybSYjMzI7ZGVmaW5pdGlvbnMsJiMzMjtkZWJ1Z2dpbmcmIzMyO3Rvb2xzLCYjMzI7YW5kDQom
Z3Q7JiMzMjsmZ3Q7JiMzMjttYW5hZ2VtZW50JiMzMjtmdW5jdGlvbnMmIzMyO3RvJiMzMjtzdXBw
b3J0JiMzMjtJU1AmIzMyO29wZXJhdGlvbnMmIzMyO2FuZCYjMzI7U0NQJiMzMjtjb21tdW5pY2F0
aW9uLg0KJmd0OyYjMzI7Jmd0OyYjMzI7S2V5JiMzMjtmdW5jdGlvbmFsaXRpZXMmIzMyO2luY2x1
ZGU6DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsxLkhhcmR3YXJlJiMzMjtwaXBlbGluZSYjMzI7YW5kJiMz
MjtyZWdpc3RlciYjMzI7ZGVmaW5pdGlvbnMmIzMyO2ZvciYjMzI7bWFuYWdpbmcmIzMyO2ltYWdl
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtwcm9jZXNzaW5nJiMzMjttb2R1bGVzLg0KJmd0OyYjMzI7Jmd0
OyYjMzI7Mi5ETUEmIzMyO2RlYnVnZ2luZyYjMzI7dXRpbGl0aWVzJiMzMjthbmQmIzMyO2J1ZmZl
ciYjMzI7bWFuYWdlbWVudCYjMzI7ZnVuY3Rpb25zLg0KJmd0OyYjMzI7Jmd0OyYjMzI7My5EZWZp
bml0aW9ucyYjMzI7b2YmIzMyO3N1cHBvcnRlZCYjMzI7aW1hZ2UmIzMyO2Zvcm1hdHMmIzMyO2Zv
ciYjMzI7cHJvcGVyJiMzMjtkYXRhJiMzMjtoYW5kbGluZy4NCiZndDsmIzMyOyZndDsmIzMyOzQu
SVBJJiMzMjthbmQmIzMyO1NDUCYjMzI7Y29tbXVuaWNhdGlvbiYjMzI7c3RydWN0dXJlcyYjMzI7
Zm9yJiMzMjttb2R1bGUmIzMyO3N0YXRlJiMzMjttYW5hZ2VtZW50JiMzMjthbmQNCiZndDsmIzMy
OyZndDsmIzMyO2NvbmZpZ3VyaW5nJiMzMjtJU1AuDQomZ3Q7JiMzMjsmZ3Q7JiMzMjs1Lk1ldGFk
YXRhJiMzMjtwYXJhbWV0ZXJzJiMzMjtmb3ImIzMyO2NvbmZpZ3VyaW5nJiMzMjtpbWFnZSYjMzI7
cHJvY2Vzc2luZy4NCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7U2lnbmVk
LW9mZi1ieTomIzMyO1NodS1oc2lhbmcmIzMyO1lhbmcmIzMyOyZsdDtTaHUtaHNpYW5nLllhbmdA
bWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYjMzI7Jmd0OyYjMzI7LS0tDQomZ3Q7JiMzMjsNCiZndDsm
IzMyO1tzbmlwXQ0KJmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsmZ3Q7
JiMzMjsrZW51bSYjMzI7bXRrY2FtX2lwaV9yYXdfdmlkZW9faWQmIzMyO3sNCiZndDsmIzMyOw0K
Jmd0OyYjMzI7SXQmIzM5O3MmIzMyO2JldHRlciYjMzI7dG8mIzMyO3VzZSYjMzI7JiMzOTtzY3Am
IzM5OyYjMzI7aW5zdGVhZCYjMzI7b2YmIzMyOyYjMzk7aXBpJiMzOTsuDQomZ3Q7JiMzMjtUaGUm
IzMyO2ludGVyZmFjZSYjMzI7aXMmIzMyO3Byb3ZpZGVkJiMzMjtieSYjMzI7c2NwLg0KJmd0OyYj
MzI7aXBpJiMzMjtqdXN0JiMzMjt0cmFuc2ZlciYjMzI7ZGF0YSYjMzI7YmV0d2VlbiYjMzI7bXRr
Y2FtJiMzMjthbmQmIzMyO3NjcCYjMzI7YW5kJiMzMjtpcGkmIzMyO2RvZXMmIzMyO25vdCYjMzI7
Y2FyZSYjMzI7dGhlJiMzMjtkYXRhJiMzMjtjb250ZW50Lg0KDQpGb3JnZXQmIzMyO215JiMzMjtw
cmV2aW91cyYjMzI7Y29tbWVudC4NCkkmIzMyO2ZpbmQmIzMyO3RoZSYjMzI7c2NwJiMzMjtjb21t
YW5kJiMzMjtpcyYjMzI7U0NQX0lQSV9JU1BfQ01EJiMzMjtvciYjMzI7U0NQX0lQSV9JU1BfRlJB
TUUuDQpTbyYjMzI7bWF5YmUmIzMyO3RoZSYjMzI7cHJlZml4JiMzMjtzaG91bGQmIzMyO2JlJiMz
MjtzY3BfaXBpX2lzcCYjMzI7c28mIzMyO3NvbWUmIzMyO3Nob3J0ZXImIzMyO3N5bWJvbCYjMzI7
bGlrZSYjMzI7aXNwLg0KDQpSZWdhcmRzLA0KQ0sNCg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7
JiMzMjsrTVRLQ0FNX0lQSV9SQVdfSURfVU5LTk9XTj0mIzMyOzAsDQomZ3Q7JiMzMjsNCiZndDsm
IzMyO0RpdHRvLg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrTVRLQ0FNX0lQSV9SQVdf
UkFXSV8yLC8qJiMzMjtSQVdJX1IyJiMzMjsqLw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtEaXR0by4N
CiZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7K01US0NBTV9JUElfUkFXX1JBV0lfMywvKiYj
MzI7UkFXSV9SMyYjMzI7Ki8NCiZndDsmIzMyOw0KJmd0OyYjMzI7RGl0dG8uDQomZ3Q7JiMzMjsN
CiZndDsmIzMyOyZndDsmIzMyOytNVEtDQU1fSVBJX1JBV19SQVdJXzUsLyomIzMyO1JBV0lfUjUm
IzMyOyovDQomZ3Q7JiMzMjsNCiZndDsmIzMyO0RpdHRvLg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjsm
Z3Q7JiMzMjsrTVRLQ0FNX0lQSV9SQVdfUkFXSV82LC8qJiMzMjtSQVdJX1I2JiMzMjsqLw0KJmd0
OyYjMzI7Jmd0OyYjMzI7K01US0NBTV9JUElfUkFXX0lNR08sLyomIzMyO0lNR09fUjEmIzMyOyov
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrTVRLQ0FNX0lQSV9SQVdfVUZFTywvKiYjMzI7VUZFT19SMSYj
MzI7Ki8NCiZndDsmIzMyOyZndDsmIzMyOytNVEtDQU1fSVBJX1JBV19SUlpPLC8qJiMzMjtSUlpP
X1IxJiMzMjsqLw0KJmd0OyYjMzI7Jmd0OyYjMzI7K01US0NBTV9JUElfUkFXX1VGR08sLyomIzMy
O1VGR09fUjEmIzMyOyovDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrTVRLQ0FNX0lQSV9SQVdfWVVWT18x
LC8qJiMzMjtZVVZPX1IxJiMzMjsqLw0KJmd0OyYjMzI7Jmd0OyYjMzI7K01US0NBTV9JUElfUkFX
X1lVVk9fMiwvKiYjMzI7WVVWT19SMiYjMzI7Ki8NCiZndDsmIzMyOyZndDsmIzMyOytNVEtDQU1f
SVBJX1JBV19ZVVZPXzMsLyomIzMyO1lVVk9fUjMmIzMyOyovDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsr
TVRLQ0FNX0lQSV9SQVdfWVVWT180LC8qJiMzMjtZVVZPX1I0JiMzMjsqLw0KJmd0OyYjMzI7Jmd0
OyYjMzI7K01US0NBTV9JUElfUkFXX1lVVk9fNSwvKiYjMzI7WVVWT19SNSYjMzI7Ki8NCiZndDsm
IzMyOyZndDsmIzMyOytNVEtDQU1fSVBJX1JBV19SWkgxTjJUT18yLC8qJiMzMjtSWkgxTjJUT19S
MiYjMzI7Ki8NCiZndDsmIzMyOyZndDsmIzMyOytNVEtDQU1fSVBJX1JBV19EUlpTNE5PXzEsLyom
IzMyO0RSWlM0Tk9fUjEmIzMyOyovDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrTVRLQ0FNX0lQSV9SQVdf
RFJaUzROT18yLC8qJiMzMjtEUlpTNE5PX1IyJiMzMjsqLw0KJmd0OyYjMzI7Jmd0OyYjMzI7K01U
S0NBTV9JUElfUkFXX0RSWlM0Tk9fMywvKiYjMzI7RFJaUzROT19SMyYjMzI7Ki8NCiZndDsmIzMy
OyZndDsmIzMyOytNVEtDQU1fSVBJX1JBV19SWkgxTjJUT18zLC8qJiMzMjtSWkgxTjJUT19SMyYj
MzI7Ki8NCiZndDsmIzMyOyZndDsmIzMyOytNVEtDQU1fSVBJX1JBV19SWkgxTjJUT18xLC8qJiMz
MjtSWkgxTjJUT19SMSYjMzI7Ki8NCiZndDsmIzMyOyZndDsmIzMyOytNVEtDQU1fSVBJX1JBV19N
RVRBX1NUQVRTX0NGRywvKiYjMzI7QWxsJiMzMjtzZXR0aW5ncyYjMzI7Ki8NCiZndDsmIzMyOyZn
dDsmIzMyOytNVEtDQU1fSVBJX1JBV19NRVRBX1NUQVRTXzAsLyomIzMyO3N0YXRpc3RpY3MmIzMy
OyovDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrLyoNCiZndDsmIzMy
OyZndDsmIzMyOysmIzMyOyomIzMyO01US0NBTV9JUElfUkFXX01FVEFfU1RBVFNfMSYjMzI7aXMm
IzMyO2ZvciYjMzI7QUZPJiMzMjtvbmx5LCYjMzI7dGhlJiMzMjtidWZmZXImIzMyO2NhbiYjMzI7
YmUNCiZndDsmIzMyOyZndDsmIzMyOysmIzMyOyomIzMyO2RlcXVldWVkJiMzMjtvbmNlJiMzMjt3
ZSYjMzI7Z290JiMzMjt0aGUmIzMyOyYjMzI7ZG1hJiMzMjtkb25lLg0KJmd0OyYjMzI7Jmd0OyYj
MzI7KyYjMzI7Ki8NCiZndDsmIzMyOyZndDsmIzMyOytNVEtDQU1fSVBJX1JBV19NRVRBX1NUQVRT
XzEsDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrLyomIzMyO3N0YXRp
c3RpY3MmIzMyO21heSYjMzI7YmUmIzMyO3Bhc3MmIzMyO3RvJiMzMjtESVAmIzMyOyovDQomZ3Q7
JiMzMjsmZ3Q7JiMzMjsrTVRLQ0FNX0lQSV9SQVdfTUVUQV9TVEFUU18yLA0KJmd0OyYjMzI7Jmd0
OyYjMzI7K01US0NBTV9JUElfUkFXX0lEX01BWCwNCiZndDsmIzMyOyZndDsmIzMyOyt9Ow0KJmd0
OyYjMzI7Jmd0OyYjMzI7Kw0KJmd0OyYjMzI7Jmd0OyYjMzI7Ky8qJiMzMjtTdXBwb3J0ZWQmIzMy
O2JheWVyJiMzMjtwaXhlbCYjMzI7b3JkZXImIzMyOyovDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrZW51
bSYjMzI7bXRrY2FtX2lwaV9iYXllcl9weGxfaWQmIzMyO3sNCiZndDsmIzMyOw0KJmd0OyYjMzI7
RGl0dG8uDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1JlZ2FyZHMsDQomZ3Q7JiMzMjtDSw0KJmd0OyYj
MzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrTVRLQ0FNX0lQSV9CQVlFUl9QWExfSURfQj0mIzMyOzAs
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrTVRLQ0FNX0lQSV9CQVlFUl9QWExfSURfR0I9JiMzMjsxLA0K
Jmd0OyYjMzI7Jmd0OyYjMzI7K01US0NBTV9JUElfQkFZRVJfUFhMX0lEX0dSPSYjMzI7MiwNCiZn
dDsmIzMyOyZndDsmIzMyOytNVEtDQU1fSVBJX0JBWUVSX1BYTF9JRF9SPSYjMzI7MywNCiZndDsm
IzMyOyZndDsmIzMyOytNVEtDQU1fSVBJX0JBWUVSX1BYTF9JRF9VTktOT1dOPSYjMzI7NCwNCiZn
dDsmIzMyOyZndDsmIzMyOyt9Ow0KJmd0OyYjMzI7Jmd0OyYjMzI7Kw0KJmd0OyYjMzI7DQomZ3Q7
JiMzMjsNCg0KPC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlwZTp0ZXh0LS0+PCEtLXst
LT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZSAqKioq
KioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFp
bCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRp
YWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRp
c2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNv
bnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNz
ZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5n
IG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5k
ZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3
ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWws
IG9yIGJlbGlldmUgDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9y
LCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8g
dGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwg
KGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QN
CmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24u
IFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_005_1213208745.1587044536--

