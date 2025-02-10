Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF22EA2E57B
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 08:33:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45467891D1;
	Mon, 10 Feb 2025 07:33:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="OstB3df6";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="HcxjTOug";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62E50891D1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 07:33:01 +0000 (UTC)
X-UUID: 3d785ba8e78111efbd192953cf12861f-20250210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=GqCISjX3BHH9zzo1EVW/rGtL4M1434heE1z2xRXerHQ=; 
 b=OstB3df6Qd8IPnrLQLN8jmFz/n4xVxCkVCeqNprVYIBq7vboDPuq9UlPFAawVS0A6ngOMVJJOtRzinvg9NrWBR5j71yjGvIjAqC2wX35LA9oEadnvv6cN4TWDM/eUfQWJuzMiHiHo9T2KI7e4F9Z4DdkkgnyX+JOs9Jmr1N8IQ4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46, REQID:42b1be43-694d-46f3-95c2-15a4c85fe36b, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:60aa074, CLOUDID:987d6bff-c190-4cfe-938d-595d7f10e0dc,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
 EDM:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
 ,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 3d785ba8e78111efbd192953cf12861f-20250210
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 290670745; Mon, 10 Feb 2025 15:32:53 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 10 Feb 2025 15:32:52 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Mon, 10 Feb 2025 15:32:52 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jgPueqv41ZoJz7b0iwELNDTewGksLkPrCA9ufr4nB+AtJFe9vBZsi/1bl2CoWNxZnV8JIyvpI2F7BoLW9CHoTMHo5XRTOp0s5AyVxYxN/JVJ56KsH04LShCTWOJXRj5gtH8Vukzo0qBN3HgLRX5tvqvYZz1x5p0ScaoxlX/OyccOqbxVPHa1R0xyCupIx6+TrqhQm9/Dd9zWWGBsIkRSm+ip89nar7tRgQmR4SmePPYwbLDqBtM5iNXtOyMSviZ+lIO/kt4vMg0NgNLnex6kAb9xhpzvwZQI5K+9j2P9tczbsx1ZZbPXAPOIxe7Ya6eMiOc4k33wNl4B1Op6eJ+3Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ZcSaVaj16xGK/LA06vk09gLZjza4D0hDG62fv8NAA4=;
 b=lCUL7PsCmnhDS5q/OeYLxuwgZuI0VP9YHTWiR8Sv1xrX52SmbJbeDiiKI/Gs93BWnBKSUT32kLhh+vzxUeFMKK7WMPoFFkL7R/8ZiJ+BR4nAkfL10lSzukrl8uwIoo5u+0zFgM2jH63A2xO2WjuxaegpLr8eJYONzPOrRs1QNWU64ovkpoG6ChK+MMqyLc8tqSJR+lccNKiAaUF4tOcYkHXvK8KugslruZiFDlguY/G3Nkf2guys923WXdZFxYF3C7WipgmFiBNFPDhAEM4/3KyK+sgbXG2sbThqSxsfSNHZKLrvqzdHlerufNDmyoXYDXFi2Lh4LJZP/r6Ka8CrGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ZcSaVaj16xGK/LA06vk09gLZjza4D0hDG62fv8NAA4=;
 b=HcxjTOugOhEcyIhZsMZWRhkPMUUAObUG2CZpb/LhYAy6z162e6Hg5mLDUyfh6E04F/Fo4/8LFMzrEcjo1nDhNJHHKnsDSeWsgaozPNoK2nEg3DlQfJDvnw1njGAgK9sBcozJcCIj368zSGFUdaeHGnoJUbgzYWdwVIiSuETTeNM=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KL1PR03MB8195.apcprd03.prod.outlook.com (2603:1096:820:111::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.15; Mon, 10 Feb
 2025 07:32:50 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 07:32:49 +0000
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
Subject: Re: [PATCH v5 07/34] dt-bindings: display: mediatek: Add binding for
 HDMIv2 DDC
Thread-Topic: [PATCH v5 07/34] dt-bindings: display: mediatek: Add binding for
 HDMIv2 DDC
Thread-Index: AQHbZcrvQTgXNtzUrkOtKKNLxAYFYrNAUGKA
Date: Mon, 10 Feb 2025 07:32:49 +0000
Message-ID: <d99bd876b0deda66ea12705c7db0b846a2ad214b.camel@mediatek.com>
References: <20250113145232.227674-1-angelogioacchino.delregno@collabora.com>
 <20250113145232.227674-8-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250113145232.227674-8-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KL1PR03MB8195:EE_
x-ms-office365-filtering-correlation-id: 565fb436-89ef-4d34-7bcb-08dd49a51f2e
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?bVA5bXd4R2MzU3M3UVBIVmJVK0xVbExXRk5lb1FURmFmUFE1VlJRS3VFQ2xr?=
 =?utf-8?B?ODk1Z0RkeDZTdlI3UVQ1djZwTk5WM21wYndSM0p4aVpuKzJSSXVNeVJzM1pS?=
 =?utf-8?B?WG9nY002d21rMnVZWnZPZEovNUJVWjJ3Ny9lM3F6VEFIYTk3UDU0bzMrcFlI?=
 =?utf-8?B?aGVLNi9tWnZBRU5kRlZIbWRDZVJ3cUJFdXM2ZW9RK0pXNUI3TEJuSjczL1Qx?=
 =?utf-8?B?cDVMeUlTSzUwVEZxaHFYdWdPVHgvZlg2dURKcWtmeUtrYjRsSjNLV3Zlb2Fq?=
 =?utf-8?B?b2hDQ0hqZHRWTDVBYUNSejNrSVlESFMrMUQ4QUIvRHg5Y2VTTU9OQ1FMbjI1?=
 =?utf-8?B?K3ROdGNzV3JOeTFlOUJ2Rjl6Zm8vRGNVUzV6VlhDM1BQVkVyS3hFTDRjZXpX?=
 =?utf-8?B?YlZPcFV5SFlmUHBYZjcrQmZJUXJZYjZLaGJKanFxSktPcTRxY0FVL0dMRFdT?=
 =?utf-8?B?K1IvS0NvOUY1WVZpMVREY2o3b0F3UmFWUERSWkJMQ0hGSzBYWUhvVzVqSUV4?=
 =?utf-8?B?VnEzWkVQSHpFOHV5RE1hb0JweWZrNXlRQmNGc3pnaFhLUHhucGVIOGJyb1RU?=
 =?utf-8?B?bldvMXpBZ0tEV3VCdlV4d0orZGdLT3JleGZhNjM2RWt6QitPd0o5TVJmWlR3?=
 =?utf-8?B?V0tXNEJiQkZ0ZjJTVmdLNjdnZFNNSUVJcFhlRkhYdjZnQnFjZHpYb3F5cENy?=
 =?utf-8?B?bk5vSHhnV2czdTZrQndBU2R4SFVsbnRFRWZKQ0NsUWJ5KzdFcHNpQTRSN2o4?=
 =?utf-8?B?L004YzdPYXZ5NFhUYUkwRk5USnFIeGRXS1I3TFpyUmdIMzlScTBQQmhndTZH?=
 =?utf-8?B?aGJEUU1vWnBhcjlmbytMYlo3Q0tTTkE3Rmd6Wm8rZjRuMVdCUVk3SERWdUN5?=
 =?utf-8?B?V29CQnJaUkdxMzJ3ZXk3WW1tTHRCVGJGZS9tc212SXlsSFRrdUZQRGt6V0pq?=
 =?utf-8?B?MkxNUG90emZEZ2sxdCtxb29zUnFPNFVURzhjSU5hOXUyRCtzaFArMENIWndj?=
 =?utf-8?B?M1BVd2JXNFNsaWtZL0VPdTlBYjBrOHYxMXpzVnhBVmhKTGFDU0FiRTIrb0tq?=
 =?utf-8?B?MGltK05uWHhHYlU2NE9XTXVaZHAvOWhJbFdpYWFGaTUwOFR2M0RaWmVjb2pI?=
 =?utf-8?B?Q3pXSGJjeG9IZjBIMGVaNHJTY1B0Y3ZZLzVmczdyOXk2Tno3SmppVE5lTGVy?=
 =?utf-8?B?bU5Vc2psTmdEZ21SUFBWcXBZMVZRS3ExWjlBZFEzRWpITUthSC9aU08rWTd0?=
 =?utf-8?B?VTFmR09GZW5sR3BsV3FpN3FUNGhMblBleSs1aXg1OUIrUVJDRjBWbmM1Tnhv?=
 =?utf-8?B?MFlEZzBtOTBwVlRsOVhFTVMzZC9BdHVrM051NXpCek5Ta0ZkTjZQczB2WmYr?=
 =?utf-8?B?YUUzT0ozRk9YSGNNMTduaDZnMDlSNzJFWEkvY3VoUTZrRGwxdzlDQkYvM21Z?=
 =?utf-8?B?aktTRFMyako4UDR3aldoMld2T3loQmtwT3lndzZLaHpOZXVubS9RTituSEpK?=
 =?utf-8?B?N3NTWmVwek9rbERSZDlrR1lYS3hXY0ZLSy9JcEhoaTExYlNoM3VFbGs0R29L?=
 =?utf-8?B?VlVGRG40dFA5bGhKczJzSzQzWDFMZVEwaGNzTXdmTEphSEVqNzM1MEcycVNo?=
 =?utf-8?B?S21Fck1lK2xST3Z0OHB2U0loTklUK0tXT3BXeko0UHd5clBBWnhUcEZIV3A0?=
 =?utf-8?B?MmZ0R3VlTTBoanJ3TU4yem9mQm13REMxVkMzeHJqMXJTcDlFTXRnQ21OSHA3?=
 =?utf-8?B?c1NvT3dOckNrK0kxTVhTbU1ETi9DQVdSdlRzL0QyWXhjSWhFOGJyN0JPSWVu?=
 =?utf-8?B?aDFtcC9lSTVhb200MHkwN251a3VqVkp1OGM3NmFBU29BL0lrckFZQTNDWEZP?=
 =?utf-8?B?djcyV3JVZUxpeW5US09HOEliREtQdWJEa0lTUWNRQU5XMEE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dkdIRU8yakFDczRtTXNyeDlMV0Vvc2NKQmZoMmYwSlI2YlY1S0RmUndQeklK?=
 =?utf-8?B?R3lEa2FxTjRYSmpRK2ZMbG5oZ0VIYjQwR1VjWmYxT1B6ZDhYWVN0dUZyU2c2?=
 =?utf-8?B?VHpGWEpuZnhad0VPUEQrQXpYUkhWUFZja01yYTA2SldRY1F0K2ZJeGNEU1ly?=
 =?utf-8?B?dzJQRVU3emF4WXNjQU55cEJSblpOc0hEWnJ6cTNrM25Xbk00dHBvYk5DaEJH?=
 =?utf-8?B?TDRLQ2UrYkVNUlZMWHlUVEJoNitCeGVFelBtdTZsNzlmd3NvOURacDhoemds?=
 =?utf-8?B?N3VnVUVHdmcyUTBBcVdMdSt6OXV4bjFIWkpkc01aWFQ0NXovd3hIeUJRZW1N?=
 =?utf-8?B?UFRPcS8yRCtOazZHdEpWZVF6bmlNVjVLU1lxRnJlRFR2U0F0UW90RVA2Wk14?=
 =?utf-8?B?a2VQT1V6aloweERpT0hoeFR3c09qNTRLeUZ5QWRWczVJSXdxbXRFRStWajQ3?=
 =?utf-8?B?TUtxZitIVm5veHJtYm9mUkx5Vnd3cW1tRnJyV0VSNDR4YmxZeEtxMVA2aUU2?=
 =?utf-8?B?Rk5vWXFUTURoSkwxQjBvaE95MTZJR2VmQVgzaFVKR1NDckdGdnRYcnh2cEEz?=
 =?utf-8?B?eEtqdmdyS1g4K0RScXoxaGppYWM5K0luNUZ1d0w4Si9CVEdXYitsbS81TGtU?=
 =?utf-8?B?NEZFQzJ3bU9sbnFadEZJYkdtWXNTTVR3S2lYYVNkbGlNRUd1Vmc2dVNNSzVi?=
 =?utf-8?B?aWdXdS9uNk9QcEt4anFRZmkzdGJYTVN1c1VpUWhMR0NPZDJ4U3lHZWRvSndU?=
 =?utf-8?B?U1pCdmJmRWgxU28ra3BvVE56NXVqRWlLQlhaWUdjRjhVYm5MeFU0K1pHa0lP?=
 =?utf-8?B?R2ZpZEd6bjBBcmxtOEFpSURNR20vSlFsYkVNakZWTXZVU010V3F2R0hqTHBN?=
 =?utf-8?B?MGw3Q1FLV2N3V1crRDVQbnFCRHg5WWxnclhZdHROR3NKblpmZnVKNTBiTVFL?=
 =?utf-8?B?SVF0cDJlaGI0UjJZQ1V1YlBHL1ZhRER4RzlZUWxTRTJ1QUVrSk1NU3lyZDk0?=
 =?utf-8?B?QzJuaEZPb282eTJyTUFBaWNMYkNkQUJBNUZlT0lKd2lYeWNoWlc0M0RjR1dq?=
 =?utf-8?B?YXg2ajRBaXFXN1JuRXVJcjdybE0zSno0ZUQ4dW1DTjFsUVNDNnR0TUJKR2tO?=
 =?utf-8?B?dTlTd2JvRys2R0pVTDROYk9DVzRheTZlRzMxS24xWFpwaDFwNFVZTTkweVR3?=
 =?utf-8?B?YWhrcEdxQ0w5ZFBjZnlZNWlxbVExcFF1QTdMY1R4OEtSSWRmaXFTanMrNjlT?=
 =?utf-8?B?MHk4dVo1b3ZvQkNPRk1hdWlIaHk5SmNOZEMxSERyZUp3YlFydnZJWTRRKzNK?=
 =?utf-8?B?NE9CRE9kM1IyQWtFaGpaSEVmbU1nVXhPZzVFS2ZYM3ZYMmwvVHdqK0pMaXZU?=
 =?utf-8?B?bTk0ak96WEZOTzZjbWZoSk53cU1ZWVJiYUxKUlFUTXhrQWdVcVEzc2l1NWE3?=
 =?utf-8?B?eDZLSjBZamgyZUtVTUNwK0pYbUZMNXZRamVKeEZLL1pFcG1SS0l4cHJRK3hR?=
 =?utf-8?B?WDU0bUxnSnZQSDUwZHlVSmJZWklpNjFQTWRWZjUwaHpUTzZ6TmtPem51Mzc4?=
 =?utf-8?B?dHdLOEFuYnhPRDVqOXFWYUJBZ011U2I1MmFXangxbmtQK0h4YlhadDRrOUZX?=
 =?utf-8?B?K0RhQWZxRVZ4dFc4cVZqUzUvSWFlOWp1cVp2Z1BCbm56cEdnZGx4RXhGNCtB?=
 =?utf-8?B?STloajJCNW5FU05CRXo0N2Exay9RM0RkbFVvcDRpNWk4UkswR2d6MGVERmlr?=
 =?utf-8?B?YnI2UXZnRzdhRzlQKzB6VVJCQVV6MWxLSnBpVkt5bVJKYVJ3MDRaQWFCaDVr?=
 =?utf-8?B?ZDhJeFJMY0MvNTlua3lFOGFwYUZZZ050WUlFNVNwT2tCakIrK2dHYXlMekh6?=
 =?utf-8?B?UHl5SmgxRGZOSmtkQS9KWVN6eTZDQ21nU0ZDMDlLdGZ3TVh0M2NsOVNLSTRO?=
 =?utf-8?B?MloxVUwxODRJc29FWVE0QzFLYWw1NSt3YktEa05NQ0JVU2hKRlU5anN5b2xT?=
 =?utf-8?B?VHhnRmRRQmk1RldFdStZQVFvR3lWU0ZJT1dVcjhRaG9sbjZFZ3VCTlVYeTk0?=
 =?utf-8?B?NzMwV3NibUszbGgvT3MrcjZyRytnT1Y3UHloRXRYTXkrQWJtanYxVXBtYk91?=
 =?utf-8?Q?/C2pV0UeXPVYwM1VP0XU0XKqm?=
Content-ID: <E63599832BF95E488D6BE8FBDD83B531@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 565fb436-89ef-4d34-7bcb-08dd49a51f2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 07:32:49.7738 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SHJ4ptG/08d0JCCscikImwW4f83PNOGrJOdgKsLtGuLhinkTz298szGJj4uQK0UH04IjXebtcEP1zIbQJKGyZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8195
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_002_195165900.609124847"
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

--__=_Part_Boundary_002_195165900.609124847
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEFuZ2VsbzoNCg0KT24gTW9uLCAyMDI1LTAxLTEzIGF0IDE1OjUyICswMTAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZp
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBBZGQgYSBiaW5kaW5nIGZv
ciB0aGUgRGlzcGxheSBEYXRhIENoYW5uZWwgKEREQykgSVAgaW4gTWVkaWFUZWsNCj4gU29DcyB3
aXRoIHZlcnNpb24gMiBIRE1JIFRYIElQLg0KPiANCj4gUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5n
IChBcm0pIDxyb2JoQGtlcm5lbC5vcmc+DQo+IFNpZ25lZC1vZmYtYnk6IEFuZ2Vsb0dpb2FjY2hp
bm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+DQo+
IC0tLQ0KPiAgLi4uL21lZGlhdGVrL21lZGlhdGVrLG10ODE5NS1oZG1pLWRkYy55YW1sICAgIHwg
NDEgKysrKysrKysrKysrKysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDQxIGluc2VydGlvbnMo
KykNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxtdDgxOTUtaGRtaS1kZGMueWFtbA0KPiANCj4g
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21l
ZGlhdGVrL21lZGlhdGVrLG10ODE5NS1oZG1pLWRkYy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssbXQ4MTk1LWhkbWktZGRj
LnlhbWwNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMDAwLi5kODVl
OGVkMmZmYTcNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxtdDgxOTUtaGRtaS1kZGMueWFt
bA0KPiBAQCAtMCwwICsxLDQxIEBADQo+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BM
LTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkNCj4gKyVZQU1MIDEuMg0KPiArLS0tDQo+ICskaWQ6
IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1h
cy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLG10ODE5NS1oZG1pLWRkYy55YW1sKl9fO0l3ISFD
VFJOS0E5d01nMEFSYnchbUZDYkp0eUl1TzVzUVNYSWlGRGlBMWxkdlQ0WEVzSDFFZ29wU3NJWVhK
S2tnWTRpX0xHZktJeTZUWldjMmlsdXN4NEFnS2NrWXNpRnFYSjF1UWdlblFac1k5dGkkDQo+ICsk
c2NoZW1hOiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cDovL2RldmljZXRyZWUub3Jn
L21ldGEtc2NoZW1hcy9jb3JlLnlhbWwqX187SXchIUNUUk5LQTl3TWcwQVJidyFtRkNiSnR5SXVP
NXNRU1hJaUZEaUExbGR2VDRYRXNIMUVnb3BTc0lZWEpLa2dZNGlfTEdmS0l5NlRaV2MyaWx1c3g0
QWdLY2tZc2lGcVhKMXVRZ2VuZURNS1R4YyQNCj4gKw0KPiArdGl0bGU6IE1lZGlhVGVrIEhETUkg
RGlzcGxheSBEYXRhIENoYW5uZWwgKEREQykgdjINCg0KdGl0bGU6IE1lZGlhVGVrIEhETUkgTVQ4
MTk1IHNlcmllcyBIRE1JIERpc3BsYXkgRGF0YSBDaGFubmVsIChEREMpDQoNCldpdGggdGhpcyBt
b2RpZmljYXRpb24sDQoNClJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPg0K
DQo+ICsNCj4gK21haW50YWluZXJzOg0KPiArICAtIEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25v
IDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+DQo+ICsgIC0gQ0sgSHUg
PGNrLmh1QG1lZGlhdGVrLmNvbT4NCj4gKw0KPiArcHJvcGVydGllczoNCj4gKyAgY29tcGF0aWJs
ZToNCj4gKyAgICBvbmVPZjoNCj4gKyAgICAgIC0gY29uc3Q6IG1lZGlhdGVrLG10ODE5NS1oZG1p
LWRkYw0KPiArICAgICAgLSBpdGVtczoNCj4gKyAgICAgICAgICAtIGNvbnN0OiBtZWRpYXRlayxt
dDgxODgtaGRtaS1kZGMNCj4gKyAgICAgICAgICAtIGNvbnN0OiBtZWRpYXRlayxtdDgxOTUtaGRt
aS1kZGMNCj4gKw0KPiArICBjbG9ja3M6DQo+ICsgICAgbWF4SXRlbXM6IDENCj4gKw0KPiArICBw
b3dlci1kb21haW5zOg0KPiArICAgIG1heEl0ZW1zOiAxDQo+ICsNCj4gK3JlcXVpcmVkOg0KPiAr
ICAtIGNvbXBhdGlibGUNCj4gKyAgLSBjbG9ja3MNCj4gKw0KPiArYWRkaXRpb25hbFByb3BlcnRp
ZXM6IGZhbHNlDQo+ICsNCj4gK2V4YW1wbGVzOg0KPiArICAtIHwNCj4gKyAgICBoZG1pIHsNCj4g
KyAgICAgICAgaGRtaV9kZGM6IGkyYyB7DQo+ICsgICAgICAgICAgICBjb21wYXRpYmxlID0gIm1l
ZGlhdGVrLG10ODE5NS1oZG1pLWRkYyI7DQo+ICsgICAgICAgICAgICBjbG9ja3MgPSA8JmNsazI2
bT47DQo+ICsgICAgICAgIH07DQo+ICsgICAgfTsNCj4gKy4uLg0KPiAtLQ0KPiAyLjQ3LjANCj4g
DQoNCg==

--__=_Part_Boundary_002_195165900.609124847
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtBbmdlbG86DQoNCk9uJiMzMjtNb24sJiMz
MjsyMDI1LTAxLTEzJiMzMjthdCYjMzI7MTU6NTImIzMyOyswMTAwLCYjMzI7QW5nZWxvR2lvYWNj
aGlubyYjMzI7RGVsJiMzMjtSZWdubyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtFeHRlcm5hbCYjMzI7
ZW1haWwmIzMyOzomIzMyO1BsZWFzZSYjMzI7ZG8mIzMyO25vdCYjMzI7Y2xpY2smIzMyO2xpbmtz
JiMzMjtvciYjMzI7b3BlbiYjMzI7YXR0YWNobWVudHMmIzMyO3VudGlsJiMzMjt5b3UmIzMyO2hh
dmUmIzMyO3ZlcmlmaWVkJiMzMjt0aGUmIzMyO3NlbmRlciYjMzI7b3ImIzMyO3RoZSYjMzI7Y29u
dGVudC4NCiZndDsmIzMyOw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtBZGQmIzMyO2EmIzMyO2JpbmRp
bmcmIzMyO2ZvciYjMzI7dGhlJiMzMjtEaXNwbGF5JiMzMjtEYXRhJiMzMjtDaGFubmVsJiMzMjso
RERDKSYjMzI7SVAmIzMyO2luJiMzMjtNZWRpYVRlaw0KJmd0OyYjMzI7U29DcyYjMzI7d2l0aCYj
MzI7dmVyc2lvbiYjMzI7MiYjMzI7SERNSSYjMzI7VFgmIzMyO0lQLg0KJmd0OyYjMzI7DQomZ3Q7
JiMzMjtSZXZpZXdlZC1ieTomIzMyO1JvYiYjMzI7SGVycmluZyYjMzI7KEFybSkmIzMyOyZsdDty
b2JoQGtlcm5lbC5vcmcmZ3Q7DQomZ3Q7JiMzMjtTaWduZWQtb2ZmLWJ5OiYjMzI7QW5nZWxvR2lv
YWNjaGlubyYjMzI7RGVsJiMzMjtSZWdubyYjMzI7Jmx0O2FuZ2Vsb2dpb2FjY2hpbm8uZGVscmVn
bm9AY29sbGFib3JhLmNvbSZndDsNCiZndDsmIzMyOy0tLQ0KJmd0OyYjMzI7JiMzMjsuLi4vbWVk
aWF0ZWsvbWVkaWF0ZWssbXQ4MTk1LWhkbWktZGRjLnlhbWwmIzMyOyYjMzI7JiMzMjsmIzMyO3wm
IzMyOzQxJiMzMjsrKysrKysrKysrKysrKysrKysrDQomZ3Q7JiMzMjsmIzMyOzEmIzMyO2ZpbGUm
IzMyO2NoYW5nZWQsJiMzMjs0MSYjMzI7aW5zZXJ0aW9ucygrKQ0KJmd0OyYjMzI7JiMzMjtjcmVh
dGUmIzMyO21vZGUmIzMyOzEwMDY0NCYjMzI7RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssbXQ4MTk1LWhkbWktZGRjLnlhbWwNCiZndDsm
IzMyOw0KJmd0OyYjMzI7ZGlmZiYjMzI7LS1naXQmIzMyO2EvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssbXQ4MTk1LWhkbWktZGRjLnlh
bWwmIzMyO2IvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0
ZWsvbWVkaWF0ZWssbXQ4MTk1LWhkbWktZGRjLnlhbWwNCiZndDsmIzMyO25ldyYjMzI7ZmlsZSYj
MzI7bW9kZSYjMzI7MTAwNjQ0DQomZ3Q7JiMzMjtpbmRleCYjMzI7MDAwMDAwMDAwMDAwLi5kODVl
OGVkMmZmYTcNCiZndDsmIzMyOy0tLSYjMzI7L2Rldi9udWxsDQomZ3Q7JiMzMjsrKysmIzMyO2Iv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0
ZWssbXQ4MTk1LWhkbWktZGRjLnlhbWwNCiZndDsmIzMyO0BAJiMzMjstMCwwJiMzMjsrMSw0MSYj
MzI7QEANCiZndDsmIzMyOysjJiMzMjtTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjomIzMyOyhHUEwt
Mi4wLW9ubHkmIzMyO09SJiMzMjtCU0QtMi1DbGF1c2UpDQomZ3Q7JiMzMjsrJVlBTUwmIzMyOzEu
Mg0KJmd0OyYjMzI7Ky0tLQ0KJmd0OyYjMzI7KyYjMzY7aWQ6JiMzMjtodHRwczovL3VybGRlZmVu
c2UuY29tL3YzL19faHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvZGlzcGxheS9tZWRpYXRl
ay9tZWRpYXRlayxtdDgxOTUtaGRtaS1kZGMueWFtbCpfXztJdyEhQ1RSTktBOXdNZzBBUmJ3IW1G
Q2JKdHlJdU81c1FTWElpRkRpQTFsZHZUNFhFc0gxRWdvcFNzSVlYSktrZ1k0aV9MR2ZLSXk2VFpX
YzJpbHVzeDRBZ0tja1lzaUZxWEoxdVFnZW5RWnNZOXRpJiMzNjsNCiZndDsmIzMyOysmIzM2O3Nj
aGVtYTomIzMyO2h0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwOi8vZGV2aWNldHJlZS5v
cmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCpfXztJdyEhQ1RSTktBOXdNZzBBUmJ3IW1GQ2JKdHlJ
dU81c1FTWElpRkRpQTFsZHZUNFhFc0gxRWdvcFNzSVlYSktrZ1k0aV9MR2ZLSXk2VFpXYzJpbHVz
eDRBZ0tja1lzaUZxWEoxdVFnZW5lRE1LVHhjJiMzNjsNCiZndDsmIzMyOysNCiZndDsmIzMyOyt0
aXRsZTomIzMyO01lZGlhVGVrJiMzMjtIRE1JJiMzMjtEaXNwbGF5JiMzMjtEYXRhJiMzMjtDaGFu
bmVsJiMzMjsoRERDKSYjMzI7djINCg0KdGl0bGU6JiMzMjtNZWRpYVRlayYjMzI7SERNSSYjMzI7
TVQ4MTk1JiMzMjtzZXJpZXMmIzMyO0hETUkmIzMyO0Rpc3BsYXkmIzMyO0RhdGEmIzMyO0NoYW5u
ZWwmIzMyOyhEREMpDQoNCldpdGgmIzMyO3RoaXMmIzMyO21vZGlmaWNhdGlvbiwNCg0KUmV2aWV3
ZWQtYnk6JiMzMjtDSyYjMzI7SHUmIzMyOyZsdDtjay5odUBtZWRpYXRlay5jb20mZ3Q7DQoNCiZn
dDsmIzMyOysNCiZndDsmIzMyOyttYWludGFpbmVyczoNCiZndDsmIzMyOysmIzMyOyYjMzI7LSYj
MzI7QW5nZWxvR2lvYWNjaGlubyYjMzI7RGVsJiMzMjtSZWdubyYjMzI7Jmx0O2FuZ2Vsb2dpb2Fj
Y2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbSZndDsNCiZndDsmIzMyOysmIzMyOyYjMzI7LSYj
MzI7Q0smIzMyO0h1JiMzMjsmbHQ7Y2suaHVAbWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYjMzI7Kw0K
Jmd0OyYjMzI7K3Byb3BlcnRpZXM6DQomZ3Q7JiMzMjsrJiMzMjsmIzMyO2NvbXBhdGlibGU6DQom
Z3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjtvbmVPZjoNCiZndDsmIzMyOysmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjstJiMzMjtjb25zdDomIzMyO21lZGlhdGVrLG10ODE5NS1oZG1p
LWRkYw0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOy0mIzMyO2l0ZW1z
Og0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7LSYjMzI7Y29uc3Q6JiMzMjttZWRpYXRlayxtdDgxODgtaGRtaS1kZGMNCiZndDsmIzMy
OysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOy0mIzMy
O2NvbnN0OiYjMzI7bWVkaWF0ZWssbXQ4MTk1LWhkbWktZGRjDQomZ3Q7JiMzMjsrDQomZ3Q7JiMz
MjsrJiMzMjsmIzMyO2Nsb2NrczoNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyO21heEl0
ZW1zOiYjMzI7MQ0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7KyYjMzI7JiMzMjtwb3dlci1kb21haW5z
Og0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7bWF4SXRlbXM6JiMzMjsxDQomZ3Q7JiMz
MjsrDQomZ3Q7JiMzMjsrcmVxdWlyZWQ6DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOy0mIzMyO2NvbXBh
dGlibGUNCiZndDsmIzMyOysmIzMyOyYjMzI7LSYjMzI7Y2xvY2tzDQomZ3Q7JiMzMjsrDQomZ3Q7
JiMzMjsrYWRkaXRpb25hbFByb3BlcnRpZXM6JiMzMjtmYWxzZQ0KJmd0OyYjMzI7Kw0KJmd0OyYj
MzI7K2V4YW1wbGVzOg0KJmd0OyYjMzI7KyYjMzI7JiMzMjstJiMzMjt8DQomZ3Q7JiMzMjsrJiMz
MjsmIzMyOyYjMzI7JiMzMjtoZG1pJiMzMjt7DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyO2hkbWlfZGRjOiYjMzI7aTJjJiMzMjt7DQomZ3Q7JiMzMjsr
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7Y29tcGF0aWJsZSYjMzI7PSYjMzI7JnF1b3Q7bWVkaWF0ZWssbXQ4MTk1LWhkbWktZGRjJnF1
b3Q7Ow0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyO2Nsb2NrcyYjMzI7PSYjMzI7Jmx0OyZhbXA7Y2xrMjZtJmd0OzsN
CiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7fTsNCiZn
dDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyO307DQomZ3Q7JiMzMjsrLi4uDQomZ3Q7JiMzMjst
LQ0KJmd0OyYjMzI7Mi40Ny4wDQomZ3Q7JiMzMjsNCg0KDQo8L3ByZT4NCjwvcD48L2JvZHk+PC9o
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

--__=_Part_Boundary_002_195165900.609124847--

