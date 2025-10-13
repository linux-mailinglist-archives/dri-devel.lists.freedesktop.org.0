Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E507BD1970
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 08:10:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C430D10E38A;
	Mon, 13 Oct 2025 06:09:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="tvdNpDM3";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="d2z9HYXh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30A8010E38A
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 06:09:52 +0000 (UTC)
X-UUID: 37fd088ca7fb11f08d9e1119e76e3a28-20251013
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=9Zo9EQzRsNY5q6sVr/fg1g9lFfKUxRPPgSNLxdLMo50=; 
 b=tvdNpDM3EXlDrN5a+pU1jSLAA5S5HlmpbM/Q8lCuAC5uYgO6Kj/PDxPLQxGXAdKJuq5bwj7GHB9gQUlgNQ/wYkywRr8lZXR/zNMjZqPWSdUeqPtFg/71fQMj7MZMzaaQDyaGIHk9i/LLQb30SgcD+fPuwB1LoCE09zezZo4hK1o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6, REQID:8b553857-9c3a-4fa8-b388-bb7271bb944f, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:a9d874c, CLOUDID:5ff2fc50-c509-4cf3-8dc0-fcdaad49a6d3,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
 TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,
 BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 37fd088ca7fb11f08d9e1119e76e3a28-20251013
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 291348498; Mon, 13 Oct 2025 14:09:46 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 13 Oct 2025 14:09:43 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Mon, 13 Oct 2025 14:09:42 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JTGcbd/cI3lJjN92EFBCCm1IUyHVM1PHYdYqJEcz0dOOUVg/3YEU9fCPk3Q9q3+l85hnFBe3bnqJguxnS4fqAe+MZ9BaJcZwNI6pd/uO3qhx1E+0orUAFMbkPIxb7hgMq6xsJls7Be1bkpcauM8ALQKCM2/2crEcGvTCq/F2zVbrI++zk2gr9o4KmK3pF7W5ZNgUf2vEvS0PjcWlJV/jgcB5Z7y/+sMIxIDqwAzAK0+l//IumqRo0yLt5sQXqioSMrssB0zGuQfETQMzKxOOXZxpeJmuTDLaNL5lNwh/FWXEFk1g4xyIoDFdXE5FoWyJo27nfBVPMcFD0+RdASO5lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nlcVEpa2f5iZjf67rWOeQ2A5XcJtbXBr/TRJHaAxHyk=;
 b=v3Z+S8jOCm7cd5v00l9i69lVfzZDnbi4+L7VtiTrOI+HzhuzT7EAcaGsZxFck+p5ok4f+91MdheSMofzsLUtO18D0LIy2RQQtKD77t9mLQxZXTnKiONiGSKGbMM51nJpM/nnzifLj6GXaHywO8ufgKo9Cs8S5NmsbdR7KnU+o8+CPRwbINUtEAn8WklCPhfMS4ZC5XhCwWhjX08UhdGzj4kvOxPHJxxUJubcDWlQt/uBi4M8hZ2htpF6r+AGrBMtf9T7bVbFvRi/W3gUv4Fxjq3A+5nCB7n9t/139AjDowOyq7b6cAHl4ZuK6rVKsAoVRPzx8QTKfKZeSTZCDxeH2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nlcVEpa2f5iZjf67rWOeQ2A5XcJtbXBr/TRJHaAxHyk=;
 b=d2z9HYXhxOhxz+rL2JxURyAuQod5IC47VbaJTIEJgRaaxs3E0mGsmDzoU8S41GtK/Mr2C/sifvjp6813/56+izMOEPhwGGleSD2MF24KTix/zLpcmvOnuOMHLZa90tw02ipdwTGLa5Af+Log795Z7ixqc6GqYu+ClQvRgDTiCe8=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by TY0PR03MB8174.apcprd03.prod.outlook.com (2603:1096:405:1b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.11; Mon, 13 Oct
 2025 06:09:40 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%7]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 06:09:39 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 =?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
 <Xiandong.Wang@mediatek.com>, "nicolas@ndufresne.ca" <nicolas@ndufresne.ca>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
 =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "wenst@chromium.org" <wenst@chromium.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>
Subject: Re: [PATCH v7 02/20] mailbox: mtk-cmdq: Refine DMA address handling
 for the command buffer
Thread-Topic: [PATCH v7 02/20] mailbox: mtk-cmdq: Refine DMA address handling
 for the command buffer
Thread-Index: AQHcOQ+/JGWcHdqExUS4VeCzKFi/arS/ncqA
Date: Mon, 13 Oct 2025 06:09:39 +0000
Message-ID: <9f87c7826731329e3a67cbf3104d02ead83825dd.camel@mediatek.com>
References: <20250827114006.3310175-1-jason-jh.lin@mediatek.com>
 <20250827114006.3310175-3-jason-jh.lin@mediatek.com>
 <3c97025f-289e-48a3-9b58-3d469cba7366@collabora.com>
In-Reply-To: <3c97025f-289e-48a3-9b58-3d469cba7366@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|TY0PR03MB8174:EE_
x-ms-office365-filtering-correlation-id: 1ec77031-7597-4072-6dcd-08de0a1f181d
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?cWdjdnZISVZpN2pSckkrMldVRjU0ODhLWWxzTDh6K0R3L3grRVBOeklLWDBr?=
 =?utf-8?B?d2ZacDZFcWJTZFhKQnlSd3lEMlBFa0prWFljaEFZSnBiZFBBMUJEcGIrbEF5?=
 =?utf-8?B?SGJNTUxlMUdEZVN1bmFCbjY0TDRLd0tkdlM4Mi9mb1J5d1U1QTRodm1qZEVZ?=
 =?utf-8?B?aDZGcXJYRzVqdk53NUJYRDhEc0E5cUlTcUVOSjAzaXVjUWk5VnBCT3NXV1JF?=
 =?utf-8?B?NzB3U1ZycWd0elRlWk4wdi94OU16cVNnZXE4VmQ0bkFvMnFrbjVlb2hYeHht?=
 =?utf-8?B?OVU4MU1ocW5nZHdzYXhYUUpCS01oQ0FEeEtWRG1wanRVVkFxZnBQOXNuVzBH?=
 =?utf-8?B?S1U1S0RGRmJZUFZTa0k2RzFieFJpWjlyNE5XdVZPVnhZZlZOZVdIZ1lsT20r?=
 =?utf-8?B?RlZKU1ZpeUdRQjNQNCtUdWdUNlNLZzZGbk9FNFVxZk54MGV4WC9IRHMyRnlE?=
 =?utf-8?B?eWZhd0N5MVQ3bm9yZlJmalhLWkhXWk1OWlNqQ3V5eVhpSjd4enlseHpCcGZW?=
 =?utf-8?B?Y25MZHBad09TQk5rSVpKenhYLzdPRFFXQmRJdll4UkoxRkZ4RUhEdmV0Nnht?=
 =?utf-8?B?dy8zWVFUYWNQS3FFczQreFdzeGJxUEVQak5BcUk4S3hzdjhwckpMOWI2OXhF?=
 =?utf-8?B?NEpkaXdTdUV1NkFRUjlIcUw5R0Z0MHhYWndVQlM3OG4xdkpOQUNtcTdDY3px?=
 =?utf-8?B?TU9oRXl3UE9TNnhpUlUvek1BVVpBdFZOZi94dkx5Y2NJL1RacWJ6NUFxWGZL?=
 =?utf-8?B?dTFmcXNZNFpwZ0VJZVZRZVVqTVVSUTdCbCtiMDRQaHNKWmVoQnJMYTZrV1V4?=
 =?utf-8?B?dER0c2RBcjZ0d1UzaU1qQVpZUy9xSjFoLzRjMHpjWGlvVFNBSzR5L01QSDRs?=
 =?utf-8?B?bEU5MkZmRlJFcnBZKzdhY09xSXZRTUFlZ1Fac3ZNMllla3dmU3VqOUlibE1t?=
 =?utf-8?B?UkEvUmJyZzc4VExrREJCc0xNdURlVEdGd0VLd3VqbjROYWdFVzE5SDgzcUlm?=
 =?utf-8?B?MkZrQTU3Q2QxQVY4ZzlCby9OempNUHJGLzlkNmVHY1hqSTJaSUNOeXY3b1hV?=
 =?utf-8?B?TmxqSFVrY3M5a1R3UUh3MG4rdTJtRlUxS3BsSG9ISkxESWZuSG4xUUVGa0Fa?=
 =?utf-8?B?N0NzU3R0dlF0b1VTRjlRV1lzUUtKblVYZzR2WUozYUZrdU1aL2FmcTh6SlZv?=
 =?utf-8?B?bXFFODFiWW9UY1JENnY1cjN0V2M2bTFNenhuZXpxRHlTZ0piajdxYWpSbUJ3?=
 =?utf-8?B?Y3loVlFUOUJBNWtKczZUWmFsR2lZM245eDdHOHhPeFhhazB4TS9CY0N4dW5D?=
 =?utf-8?B?T2V1SEQxUm9aS3BiMVhmRE5KS0xlRFRKYkZDeHdoNXJXVEJ4WTJMYmtGOUdY?=
 =?utf-8?B?VEVWMVp0U0xiUzd5aUxJc1BsK1F6VENGODRUdWhYUjhVU01KZTB4MTdRZ1Rk?=
 =?utf-8?B?YnFYTWJrRkovUkNvT0tZZVRRa0E4RmRaWGZoUFJjVUdOMW9uUzZxMUNQT0xQ?=
 =?utf-8?B?NHJBOXd0aEVnVGoyelZuMW1BaWwrbW5mK1hLMUN3RlpZWTdNcFJOZGZsOFlq?=
 =?utf-8?B?dWphZ2NmRjhLSmZWdkFZMnBrUnBDdTZHMU5PQWV0RkplTmpTQVVlNlZJSVJx?=
 =?utf-8?B?c3N1M0FwZC9QM290Z3RpVDBFVitsRUpzRHd3dk0xMWtJQkRObnB3YTlsWGNR?=
 =?utf-8?B?RVJQM2E3dDRjZzQ3aFJFeXR2TDBoQ2hqWExKZXZQYXVDbDhWdXBEc1ZsaHJF?=
 =?utf-8?B?bHkrNFFZSzJzNkFKcUtwVTA2V0Yybm9jUitZYnVDdEJTeXFqZ2poaXVsNnlK?=
 =?utf-8?B?eS8wbXBUQVRlYkhTMm1sR2I2R092cFkxVTBiOVBZQ0MrMTlNbnFSMlBoWHg1?=
 =?utf-8?B?bElodXFqd1J6RUlZbXEvQ0YzMEtwYWlpTE1ZaVJvTXhLWDhpblYrVkIvOEpH?=
 =?utf-8?B?aEpWc3NwKy80SHkvd1Y4dWxBNWpDYUZndlJKWlhMbStTK3VIVTR5VmdzRDhq?=
 =?utf-8?B?VE1OanEzQ0RNZ3dUcE9zQTJidEFGbWpyS1ZQelZHcFptR2lRaU02Y0tveEFV?=
 =?utf-8?Q?kNoXk7?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OGF6V01aNWlzNzJUbkdKM1NOaG9xaWFzTmM2NytJTFVybUQwZ3pzeXlBbjFU?=
 =?utf-8?B?cW9OYU0xN2FsSmZ5cmIzS3BKVEdNcm1zRkcxZWJDOW5qamlBeXR3cEp0SzJ0?=
 =?utf-8?B?amFUK3V2V1pyck1yVWRBTGFlMU1pSmhzdWh1NDVTZGFjdmp1YXd5QWQ4a0l1?=
 =?utf-8?B?Q0dTdjF1Y1IzSWVOemdaS1hiS2pJZE1mOHg5cUwxTy9pTzNqb2pPZEgxaGc0?=
 =?utf-8?B?Z3lCeUYxeDB6VE5qeDV6bDlpMU9JQng2RHZnb2tMYW1XcHcxSUxBd0VPVDNH?=
 =?utf-8?B?RGZKOHovWnlqQ2FOVHNSamtKZzY4dHV0RFFCSmJ5eVlGSk9kSjJpN0c0NG1a?=
 =?utf-8?B?cWF4MlhCMXYzdFhMVjYrVmg4T2VIWXVCNXNoWmpJSFZvQklFTEFabDFDK3Q1?=
 =?utf-8?B?eEhJQkI2dFlpMThSK3hJRXRtWjVnend3Z2NLOEZVamRnQXhTN0p6VFM3aTVJ?=
 =?utf-8?B?bjYvS003b1hXSjJMQ2swOUloVkJmSTdqTVNGYS9wYnpoa2dYcG91R3dxOThX?=
 =?utf-8?B?WFhPNEZYSEtCQ3BDWHU3VWQvWnQ4TUM5emxjb0Fvc2E0UFpIVGFGcEloTGI3?=
 =?utf-8?B?MTQwdE9FczhGcGl1UzRacHNCVldxa0xaUWhhY1RRNUpkdExIbFptZzErbWJ1?=
 =?utf-8?B?aXFDM0FxQy9XOS93dTZrK3NJVXV2Tk41OWx3NVYxdmNDbFFVMzlIY1R5Q1lB?=
 =?utf-8?B?eGQ0RHJtK0NELytoTGgrOU04aW5ETUtiTCtKWUFCKytuTlcvQ0tjZS85dGxE?=
 =?utf-8?B?Ym81K2NRR0hiSTRjSlpwUnNDTnlQQ0Fjd2lPdUsrZGVZckthdnhQRVJqV0hj?=
 =?utf-8?B?djVyL1BkYW5QdjdDYjRidEFqSE5NVElMTzROT1g0OFVRYTJuWllJZWFTQ1A4?=
 =?utf-8?B?cnkzWWZZQXF2NkFoL3EvZWpyMTFuOEUzVVBJYVVnM1RscDdZM1FUVUl4Y09R?=
 =?utf-8?B?cENPOTBQSzJZMVNrSzMwM3NlTEFvWnlwdEg2cmsrVkdYVzVnVGs3Z1Z6OTNs?=
 =?utf-8?B?OW03dk02M05rdXpxcVU4dXFLQm5QblZmV0ZNUngvRkN4ZTlEbzJia3dzZW1D?=
 =?utf-8?B?ZWlFa0QzZVdLeCs0aDZLSnBjYy9YWlRRb2J0bDMzWUpDQnJRb3RITjZxQ05B?=
 =?utf-8?B?RERZc3RKOUhOazg0T21mRDFsUGJPTm9DaWE0S0JadEh4UzRBRWJ1Y0MwbStV?=
 =?utf-8?B?OGlFQ2o3M0R0TGxnRXZVTGZxamw1a1F3anJ6dlZqM2FuM2RRMDk2VkgrNkQy?=
 =?utf-8?B?eU5oZzY1eVdCd2p4QzFFcjVOeEpvN28xUDNoZUVWQjFNOUIrL0hDQ1BSNW5S?=
 =?utf-8?B?V21aWmVMeDRndW80VEZmVlZUSWlwVXlQL3lwK1N4Y3F1OXBPWFB5WGlpUTZ0?=
 =?utf-8?B?RG91UTROcHRlTTJOMFBLcUE5TFVvMk1KWHFGT1NwYXRmc3RtNFh2YkdyNjR0?=
 =?utf-8?B?TVU1Si84VHhIcFl6dXNWM2NlRnFWQ3ZLZVlBWDVQVlBtN1M1SDlES1kvZWFk?=
 =?utf-8?B?YzEyRXdZcUk3RlNGaE9pUlY1dW04Qk9jQ291amsxV0d0QTIzUE55a2dYV3l0?=
 =?utf-8?B?c2o4U1N2ZkRnMnJUTnpkRlh3UFowZ2llQnpSZXM0bHZjditmeG1CNXRONkYz?=
 =?utf-8?B?Nlk5b1ExM1hBbW5NWEhvSDZGWGl6eVZZNE5IU0M4UWRIUmhNYnZSQUZndkc3?=
 =?utf-8?B?bUxRbm5hZzh3K1ppaW42Q1VjWGVVZ2FmUzNzVm9VKzZoQTBCMjB4ZXYrV0NR?=
 =?utf-8?B?S2sxUUtOOUwxdEhjOWRueUErRUdsYUNsY3JRV3lWRm82R3YzWktZOXVud1Vm?=
 =?utf-8?B?bmc2WHRFaXJ0Q0lVZWxKMFoyaHhRR3NqTUVXRndOTk9sUWZlVFNUMUFpVDh1?=
 =?utf-8?B?cDlmcWh3NUNDOHAxSk9SMVNNOTZNMFRlUC9FNnNhMnNzbFJ5R1o1a3RucFhj?=
 =?utf-8?B?RU9UVDRkRVc5ZlVNdzFPZzhHdWI5QXRZOTYvTlhxbnlGUjFpNWRYeWlQYkFG?=
 =?utf-8?B?UE1OdFRDeGVLWG9DTjB6V2QvS29IQ3Nqd1pKbWZLWHA5dVd1Rm5sSlJlL0Q2?=
 =?utf-8?B?azZzbWVNalgrRitsa0VCR01ZVGo4WkU5Q0VrSmE0RW5yc2lmRHlNNnBHY0Qr?=
 =?utf-8?B?UW1BYXNHN3l4Y2dINmovTmZYWDNwYnhtSW9kRytPcUU0UWpCcndVd1lIOTBm?=
 =?utf-8?B?L0E9PQ==?=
Content-ID: <1C9E640672D1BC4FB599B6575785DEC0@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ec77031-7597-4072-6dcd-08de0a1f181d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2025 06:09:39.7885 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QLkFm5wMTAR5HXUEfD0CRKOjUTME6QrE5lKq54gHtPnLtzoE0v7zhpLpC1sGM+Qr45O+55LWpP8QIqU5Pupsg0qHl0lB+S6lJxe33h7vj+w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB8174
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_007_732704603.327325576"
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

--__=_Part_Boundary_007_732704603.327325576
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDI1LTEwLTA5IGF0IDEzOjI3ICswMjAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBs
aW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBz
ZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+IA0KPiANCj4gSWwgMjcvMDgvMjUgMTM6MzcsIEphc29u
LUpIIExpbiBoYSBzY3JpdHRvOg0KPiA+IEdDRSBjYW4gb25seSBmZXRjaCB0aGUgY29tbWFuZCBi
dWZmZXIgYWRkcmVzcyBmcm9tIGEgMzItYml0DQo+ID4gcmVnaXN0ZXIuDQo+ID4gU29tZSBTb0Nz
IHN1cHBvcnQgYSAzNS1iaXQgY29tbWFuZCBidWZmZXIgYWRkcmVzcyBmb3IgR0NFLCB3aGljaA0K
PiA+IHJlcXVpcmVzIGEgcmlnaHQgc2hpZnQgb2YgMyBiaXRzIGJlZm9yZSBzZXR0aW5nIHRoZSBh
ZGRyZXNzIGludG8NCj4gPiB0aGUgMzItYml0IHJlZ2lzdGVyLiBBIGNvbW1lbnQgaGFzIGJlZW4g
YWRkZWQgdG8gdGhlIGhlYWRlciBvZg0KPiA+IGNtZHFfZ2V0X3NoaWZ0X3BhKCkgdG8gZXhwbGFp
biB0aGlzIHJlcXVpcmVtZW50Lg0KPiA+IA0KPiA+IFRvIHByZXZlbnQgdGhlIEdDRSBjb21tYW5k
IGJ1ZmZlciBhZGRyZXNzIGZyb20gYmVpbmcgRE1BIG1hcHBlZA0KPiA+IGJleW9uZA0KPiA+IGl0
cyBzdXBwb3J0ZWQgYml0IHJhbmdlLCB0aGUgRE1BIGJpdCBtYXNrIGZvciB0aGUgZGV2aWNlIGlz
IHNldA0KPiA+IGR1cmluZw0KPiA+IGluaXRpYWxpemF0aW9uLg0KPiA+IA0KPiA+IEFkZGl0aW9u
YWxseSwgdG8gZW5zdXJlIHRoZSBjb3JyZWN0IHNoaWZ0IGlzIGFwcGxpZWQgd2hlbiBzZXR0aW5n
DQo+ID4gb3INCj4gPiByZWFkaW5nIHRoZSByZWdpc3RlciB0aGF0IHN0b3JlcyB0aGUgR0NFIGNv
bW1hbmQgYnVmZmVyIGFkZHJlc3MsDQo+ID4gbmV3IEFQSXMsIGNtZHFfcmVnX3NoaWZ0X2FkZHIo
KSBhbmQgY21kcV9yZWdfcmV2ZXJ0X2FkZHIoKSwgaGF2ZQ0KPiA+IGJlZW4NCj4gPiBpbnRyb2R1
Y2VkIGZvciBjb25zaXN0ZW50IG9wZXJhdGlvbnMgb24gdGhpcyByZWdpc3Rlci4NCj4gPiANCj4g
PiBUaGUgdmFyaWFibGUgdHlwZSBmb3IgdGhlIGNvbW1hbmQgYnVmZmVyIGFkZHJlc3MgaGFzIGJl
ZW4NCj4gPiBzdGFuZGFyZGl6ZWQNCj4gPiB0byBkbWFfYWRkcl90IHRvIHByZXZlbnQgaGFuZGxp
bmcgaXNzdWVzIGNhdXNlZCBieSB0eXBlIG1pc21hdGNoZXMuDQo+ID4gDQo+ID4gRml4ZXM6IDA4
NThmZGU0OTZmOCAoIm1haWxib3g6IGNtZHE6IHZhcmlhYmxpemUgYWRkcmVzcyBzaGlmdCBpbg0K
PiA+IHBsYXRmb3JtIikNCj4gPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbi1KSCBMaW4gPGphc29uLWpo
LmxpbkBtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gwqAgZHJpdmVycy9tYWlsYm94L210ay1j
bWRxLW1haWxib3guY8KgwqDCoMKgwqDCoCB8IDQzICsrKysrKysrKysrKysrKystLS0NCj4gPiAt
LS0tLQ0KPiA+IMKgIGluY2x1ZGUvbGludXgvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmggfCAx
MCArKysrKysNCj4gPiDCoCAyIGZpbGVzIGNoYW5nZWQsIDM5IGluc2VydGlvbnMoKyksIDE0IGRl
bGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21haWxib3gvbXRrLWNt
ZHEtbWFpbGJveC5jDQo+ID4gYi9kcml2ZXJzL21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5jDQo+
ID4gaW5kZXggNTMyOTI5OTE2ZTk5Li5hNjA0ODZjYmI1MzMgMTAwNjQ0DQo+ID4gLS0tIGEvZHJp
dmVycy9tYWlsYm94L210ay1jbWRxLW1haWxib3guYw0KPiA+ICsrKyBiL2RyaXZlcnMvbWFpbGJv
eC9tdGstY21kcS1tYWlsYm94LmMNCj4gPiBAQCAtOTIsNiArOTIsMTYgQEAgc3RydWN0IGdjZV9w
bGF0IHsNCj4gPiDCoMKgwqDCoMKgIHUzMiBnY2VfbnVtOw0KPiA+IMKgIH07DQo+ID4gDQo+ID4g
K3N0YXRpYyBpbmxpbmUgdTMyIGNtZHFfcmVnX3NoaWZ0X2FkZHIoZG1hX2FkZHJfdCBhZGRyLCBj
b25zdA0KPiA+IHN0cnVjdCBnY2VfcGxhdCAqcGRhdGEpDQo+IA0KPiBjbWRxX2Zvcm1hdF9nY2Vf
YWRkcigpIG9yIGNtZHFfcGFfdG9fZ2NlX2FkZHIoKQ0KPiANCj4gKG9yIGNtZHFfdmFfdG9fZ2Nl
X2FkZHIoKSBpZiB0aGlzIGlzIG5vdCBhIHBoeXNpY2FsIGFkZHJlc3MpDQo+IA0KPiBleHBsYWlu
cyB3aGF0IHlvdSdyZSBkb2luZyBoZXJlIGEgYml0IGJldHRlciBJIHRoaW5rLg0KDQpPSywgSSds
bCBjaGFuZ2UgdGhlIEFQSSBuYW1lIGFuZCBhZGQgY29tbWVudHMgZm9yIGJvdGggQVBJczoNCg0K
c3RhdGljIGlubGluZSB1MzIgY21kcV9jb252ZXJ0X2djZV9hZGRyKCkNCnsNCiAgICAvKiBDb252
ZXJ0IERNQSBhZGRyIChQQSBvciBJT1ZBKSB0byBHQ0UgcmVhZGFibGUgYWRkciAqLw0KfQ0KDQpz
dGF0aWMgaW5saW5lIHUzMiBjbWRxX3JldmVydF9nY2VfYWRkcigpDQp7DQogICAgLyogUmV2ZXJ0
IEdDRSByZWFkYWJsZSBhZGRyIHRvIERNQSBhZGRyIChQQSBvciBJT1ZBKSAqLw0KfQ0KDQo+IA0K
PiA+ICt7DQo+ID4gK8KgwqDCoMKgIHJldHVybiAoYWRkciA+PiBwZGF0YS0+c2hpZnQpOw0KPiAN
Cj4gWW91IGRvbid0IG5lZWQgcGFyZW50aGVzaXM7IGp1c3QgYHJldHVybiBhZGRyID4+IHBkYXRh
LT5zaGlmdDtgIGlzDQo+IGZpbmUNCj4gDQoNCk9LLCBJJ2xsIHJlbW92ZSB0aGlzLg0KDQo+ID4g
K30NCj4gPiArDQo+ID4gK3N0YXRpYyBpbmxpbmUgZG1hX2FkZHJfdCBjbWRxX3JlZ19yZXZlcnRf
YWRkcih1MzIgYWRkciwgY29uc3QNCj4gPiBzdHJ1Y3QgZ2NlX3BsYXQgKnBkYXRhKQ0KPiANCj4g
Y21kcV9nY2VfdG9fcGFfYWRkcigpIG9yIGNtZHFfZ2V0X3BhX2FkZHIoKSBwZXJoYXBzPyA6LSkN
Cj4gDQo+IChzYW1lIGNvbW1lbnRzIGZvciBzL3BhL3ZhL2cgaWYgdGhpcyBpcyBub3QgcGh5c2lj
YWwgYWRkcmVzcykNCj4gDQo+IEV2ZXJ5dGhpbmcgZWxzZSBsb29rcyBvay4NCj4gDQoNClRoYW5r
cyBmb3IgdGhlIHJldmlld3MhDQoNClJlZ2FyZHMsDQpKYXNvbi1KSCBMaW4NCg0KPiBDaGVlcnMs
DQo+IEFuZ2Vsbw0K

--__=_Part_Boundary_007_732704603.327325576
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1RodSwmIzMyOzIwMjUtMTAtMDkmIzMyO2F0
JiMzMjsxMzoyNyYjMzI7KzAyMDAsJiMzMjtBbmdlbG9HaW9hY2NoaW5vJiMzMjtEZWwmIzMyO1Jl
Z25vJiMzMjt3cm90ZToNCiZndDsmIzMyOw0KJmd0OyYjMzI7RXh0ZXJuYWwmIzMyO2VtYWlsJiMz
Mjs6JiMzMjtQbGVhc2UmIzMyO2RvJiMzMjtub3QmIzMyO2NsaWNrJiMzMjtsaW5rcyYjMzI7b3Im
IzMyO29wZW4mIzMyO2F0dGFjaG1lbnRzJiMzMjt1bnRpbA0KJmd0OyYjMzI7eW91JiMzMjtoYXZl
JiMzMjt2ZXJpZmllZCYjMzI7dGhlJiMzMjtzZW5kZXImIzMyO29yJiMzMjt0aGUmIzMyO2NvbnRl
bnQuDQomZ3Q7JiMzMjsNCiZndDsmIzMyOw0KJmd0OyYjMzI7SWwmIzMyOzI3LzA4LzI1JiMzMjsx
MzozNywmIzMyO0phc29uLUpIJiMzMjtMaW4mIzMyO2hhJiMzMjtzY3JpdHRvOg0KJmd0OyYjMzI7
Jmd0OyYjMzI7R0NFJiMzMjtjYW4mIzMyO29ubHkmIzMyO2ZldGNoJiMzMjt0aGUmIzMyO2NvbW1h
bmQmIzMyO2J1ZmZlciYjMzI7YWRkcmVzcyYjMzI7ZnJvbSYjMzI7YSYjMzI7MzItYml0DQomZ3Q7
JiMzMjsmZ3Q7JiMzMjtyZWdpc3Rlci4NCiZndDsmIzMyOyZndDsmIzMyO1NvbWUmIzMyO1NvQ3Mm
IzMyO3N1cHBvcnQmIzMyO2EmIzMyOzM1LWJpdCYjMzI7Y29tbWFuZCYjMzI7YnVmZmVyJiMzMjth
ZGRyZXNzJiMzMjtmb3ImIzMyO0dDRSwmIzMyO3doaWNoDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtyZXF1
aXJlcyYjMzI7YSYjMzI7cmlnaHQmIzMyO3NoaWZ0JiMzMjtvZiYjMzI7MyYjMzI7Yml0cyYjMzI7
YmVmb3JlJiMzMjtzZXR0aW5nJiMzMjt0aGUmIzMyO2FkZHJlc3MmIzMyO2ludG8NCiZndDsmIzMy
OyZndDsmIzMyO3RoZSYjMzI7MzItYml0JiMzMjtyZWdpc3Rlci4mIzMyO0EmIzMyO2NvbW1lbnQm
IzMyO2hhcyYjMzI7YmVlbiYjMzI7YWRkZWQmIzMyO3RvJiMzMjt0aGUmIzMyO2hlYWRlciYjMzI7
b2YNCiZndDsmIzMyOyZndDsmIzMyO2NtZHFfZ2V0X3NoaWZ0X3BhKCkmIzMyO3RvJiMzMjtleHBs
YWluJiMzMjt0aGlzJiMzMjtyZXF1aXJlbWVudC4NCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYj
MzI7Jmd0OyYjMzI7VG8mIzMyO3ByZXZlbnQmIzMyO3RoZSYjMzI7R0NFJiMzMjtjb21tYW5kJiMz
MjtidWZmZXImIzMyO2FkZHJlc3MmIzMyO2Zyb20mIzMyO2JlaW5nJiMzMjtETUEmIzMyO21hcHBl
ZA0KJmd0OyYjMzI7Jmd0OyYjMzI7YmV5b25kDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtpdHMmIzMyO3N1
cHBvcnRlZCYjMzI7Yml0JiMzMjtyYW5nZSwmIzMyO3RoZSYjMzI7RE1BJiMzMjtiaXQmIzMyO21h
c2smIzMyO2ZvciYjMzI7dGhlJiMzMjtkZXZpY2UmIzMyO2lzJiMzMjtzZXQNCiZndDsmIzMyOyZn
dDsmIzMyO2R1cmluZw0KJmd0OyYjMzI7Jmd0OyYjMzI7aW5pdGlhbGl6YXRpb24uDQomZ3Q7JiMz
MjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyO0FkZGl0aW9uYWxseSwmIzMyO3RvJiMzMjtl
bnN1cmUmIzMyO3RoZSYjMzI7Y29ycmVjdCYjMzI7c2hpZnQmIzMyO2lzJiMzMjthcHBsaWVkJiMz
Mjt3aGVuJiMzMjtzZXR0aW5nDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtvcg0KJmd0OyYjMzI7Jmd0OyYj
MzI7cmVhZGluZyYjMzI7dGhlJiMzMjtyZWdpc3RlciYjMzI7dGhhdCYjMzI7c3RvcmVzJiMzMjt0
aGUmIzMyO0dDRSYjMzI7Y29tbWFuZCYjMzI7YnVmZmVyJiMzMjthZGRyZXNzLA0KJmd0OyYjMzI7
Jmd0OyYjMzI7bmV3JiMzMjtBUElzLCYjMzI7Y21kcV9yZWdfc2hpZnRfYWRkcigpJiMzMjthbmQm
IzMyO2NtZHFfcmVnX3JldmVydF9hZGRyKCksJiMzMjtoYXZlDQomZ3Q7JiMzMjsmZ3Q7JiMzMjti
ZWVuDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtpbnRyb2R1Y2VkJiMzMjtmb3ImIzMyO2NvbnNpc3RlbnQm
IzMyO29wZXJhdGlvbnMmIzMyO29uJiMzMjt0aGlzJiMzMjtyZWdpc3Rlci4NCiZndDsmIzMyOyZn
dDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7VGhlJiMzMjt2YXJpYWJsZSYjMzI7dHlwZSYjMzI7
Zm9yJiMzMjt0aGUmIzMyO2NvbW1hbmQmIzMyO2J1ZmZlciYjMzI7YWRkcmVzcyYjMzI7aGFzJiMz
MjtiZWVuDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtzdGFuZGFyZGl6ZWQNCiZndDsmIzMyOyZndDsmIzMy
O3RvJiMzMjtkbWFfYWRkcl90JiMzMjt0byYjMzI7cHJldmVudCYjMzI7aGFuZGxpbmcmIzMyO2lz
c3VlcyYjMzI7Y2F1c2VkJiMzMjtieSYjMzI7dHlwZSYjMzI7bWlzbWF0Y2hlcy4NCiZndDsmIzMy
OyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7Rml4ZXM6JiMzMjswODU4ZmRlNDk2ZjgmIzMy
OygmcXVvdDttYWlsYm94OiYjMzI7Y21kcTomIzMyO3ZhcmlhYmxpemUmIzMyO2FkZHJlc3MmIzMy
O3NoaWZ0JiMzMjtpbg0KJmd0OyYjMzI7Jmd0OyYjMzI7cGxhdGZvcm0mcXVvdDspDQomZ3Q7JiMz
MjsmZ3Q7JiMzMjtTaWduZWQtb2ZmLWJ5OiYjMzI7SmFzb24tSkgmIzMyO0xpbiYjMzI7Jmx0O2ph
c29uLWpoLmxpbkBtZWRpYXRlay5jb20mZ3Q7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjstLS0NCiZndDsm
IzMyOyZndDsmIzMyOyYjMTYwOyYjMzI7ZHJpdmVycy9tYWlsYm94L210ay1jbWRxLW1haWxib3gu
YyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMzI7fCYjMzI7NDMmIzMyOysr
KysrKysrKysrKysrKystLS0NCiZndDsmIzMyOyZndDsmIzMyOy0tLS0tDQomZ3Q7JiMzMjsmZ3Q7
JiMzMjsmIzE2MDsmIzMyO2luY2x1ZGUvbGludXgvbWFpbGJveC9tdGstY21kcS1tYWlsYm94Lmgm
IzMyO3wmIzMyOzEwJiMzMjsrKysrKysNCiZndDsmIzMyOyZndDsmIzMyOyYjMTYwOyYjMzI7MiYj
MzI7ZmlsZXMmIzMyO2NoYW5nZWQsJiMzMjszOSYjMzI7aW5zZXJ0aW9ucygrKSwmIzMyOzE0JiMz
MjtkZWxldGlvbnMoLSkNCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7ZGlm
ZiYjMzI7LS1naXQmIzMyO2EvZHJpdmVycy9tYWlsYm94L210ay1jbWRxLW1haWxib3guYw0KJmd0
OyYjMzI7Jmd0OyYjMzI7Yi9kcml2ZXJzL21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5jDQomZ3Q7
JiMzMjsmZ3Q7JiMzMjtpbmRleCYjMzI7NTMyOTI5OTE2ZTk5Li5hNjA0ODZjYmI1MzMmIzMyOzEw
MDY0NA0KJmd0OyYjMzI7Jmd0OyYjMzI7LS0tJiMzMjthL2RyaXZlcnMvbWFpbGJveC9tdGstY21k
cS1tYWlsYm94LmMNCiZndDsmIzMyOyZndDsmIzMyOysrKyYjMzI7Yi9kcml2ZXJzL21haWxib3gv
bXRrLWNtZHEtbWFpbGJveC5jDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtAQCYjMzI7LTkyLDYmIzMyOys5
MiwxNiYjMzI7QEAmIzMyO3N0cnVjdCYjMzI7Z2NlX3BsYXQmIzMyO3sNCiZndDsmIzMyOyZndDsm
IzMyOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMzI7dTMyJiMzMjtnY2VfbnVtOw0K
Jmd0OyYjMzI7Jmd0OyYjMzI7JiMxNjA7JiMzMjt9Ow0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7
JiMzMjsmZ3Q7JiMzMjsrc3RhdGljJiMzMjtpbmxpbmUmIzMyO3UzMiYjMzI7Y21kcV9yZWdfc2hp
ZnRfYWRkcihkbWFfYWRkcl90JiMzMjthZGRyLCYjMzI7Y29uc3QNCiZndDsmIzMyOyZndDsmIzMy
O3N0cnVjdCYjMzI7Z2NlX3BsYXQmIzMyOypwZGF0YSkNCiZndDsmIzMyOw0KJmd0OyYjMzI7Y21k
cV9mb3JtYXRfZ2NlX2FkZHIoKSYjMzI7b3ImIzMyO2NtZHFfcGFfdG9fZ2NlX2FkZHIoKQ0KJmd0
OyYjMzI7DQomZ3Q7JiMzMjsob3ImIzMyO2NtZHFfdmFfdG9fZ2NlX2FkZHIoKSYjMzI7aWYmIzMy
O3RoaXMmIzMyO2lzJiMzMjtub3QmIzMyO2EmIzMyO3BoeXNpY2FsJiMzMjthZGRyZXNzKQ0KJmd0
OyYjMzI7DQomZ3Q7JiMzMjtleHBsYWlucyYjMzI7d2hhdCYjMzI7eW91JiMzOTtyZSYjMzI7ZG9p
bmcmIzMyO2hlcmUmIzMyO2EmIzMyO2JpdCYjMzI7YmV0dGVyJiMzMjtJJiMzMjt0aGluay4NCg0K
T0ssJiMzMjtJJiMzOTtsbCYjMzI7Y2hhbmdlJiMzMjt0aGUmIzMyO0FQSSYjMzI7bmFtZSYjMzI7
YW5kJiMzMjthZGQmIzMyO2NvbW1lbnRzJiMzMjtmb3ImIzMyO2JvdGgmIzMyO0FQSXM6DQoNCnN0
YXRpYyYjMzI7aW5saW5lJiMzMjt1MzImIzMyO2NtZHFfY29udmVydF9nY2VfYWRkcigpDQp7DQom
IzMyOyYjMzI7JiMzMjsmIzMyOy8qJiMzMjtDb252ZXJ0JiMzMjtETUEmIzMyO2FkZHImIzMyOyhQ
QSYjMzI7b3ImIzMyO0lPVkEpJiMzMjt0byYjMzI7R0NFJiMzMjtyZWFkYWJsZSYjMzI7YWRkciYj
MzI7Ki8NCn0NCg0Kc3RhdGljJiMzMjtpbmxpbmUmIzMyO3UzMiYjMzI7Y21kcV9yZXZlcnRfZ2Nl
X2FkZHIoKQ0Kew0KJiMzMjsmIzMyOyYjMzI7JiMzMjsvKiYjMzI7UmV2ZXJ0JiMzMjtHQ0UmIzMy
O3JlYWRhYmxlJiMzMjthZGRyJiMzMjt0byYjMzI7RE1BJiMzMjthZGRyJiMzMjsoUEEmIzMyO29y
JiMzMjtJT1ZBKSYjMzI7Ki8NCn0NCg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrew0K
Jmd0OyYjMzI7Jmd0OyYjMzI7KyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMzI7cmV0dXJuJiMz
MjsoYWRkciYjMzI7Jmd0OyZndDsmIzMyO3BkYXRhLSZndDtzaGlmdCk7DQomZ3Q7JiMzMjsNCiZn
dDsmIzMyO1lvdSYjMzI7ZG9uJiMzOTt0JiMzMjtuZWVkJiMzMjtwYXJlbnRoZXNpczsmIzMyO2p1
c3QmIzMyOyYjOTY7cmV0dXJuJiMzMjthZGRyJiMzMjsmZ3Q7Jmd0OyYjMzI7cGRhdGEtJmd0O3No
aWZ0OyYjOTY7JiMzMjtpcw0KJmd0OyYjMzI7ZmluZQ0KJmd0OyYjMzI7DQoNCk9LLCYjMzI7SSYj
Mzk7bGwmIzMyO3JlbW92ZSYjMzI7dGhpcy4NCg0KJmd0OyYjMzI7Jmd0OyYjMzI7K30NCiZndDsm
IzMyOyZndDsmIzMyOysNCiZndDsmIzMyOyZndDsmIzMyOytzdGF0aWMmIzMyO2lubGluZSYjMzI7
ZG1hX2FkZHJfdCYjMzI7Y21kcV9yZWdfcmV2ZXJ0X2FkZHIodTMyJiMzMjthZGRyLCYjMzI7Y29u
c3QNCiZndDsmIzMyOyZndDsmIzMyO3N0cnVjdCYjMzI7Z2NlX3BsYXQmIzMyOypwZGF0YSkNCiZn
dDsmIzMyOw0KJmd0OyYjMzI7Y21kcV9nY2VfdG9fcGFfYWRkcigpJiMzMjtvciYjMzI7Y21kcV9n
ZXRfcGFfYWRkcigpJiMzMjtwZXJoYXBzJiM2MzsmIzMyOzotKQ0KJmd0OyYjMzI7DQomZ3Q7JiMz
Mjsoc2FtZSYjMzI7Y29tbWVudHMmIzMyO2ZvciYjMzI7cy9wYS92YS9nJiMzMjtpZiYjMzI7dGhp
cyYjMzI7aXMmIzMyO25vdCYjMzI7cGh5c2ljYWwmIzMyO2FkZHJlc3MpDQomZ3Q7JiMzMjsNCiZn
dDsmIzMyO0V2ZXJ5dGhpbmcmIzMyO2Vsc2UmIzMyO2xvb2tzJiMzMjtvay4NCiZndDsmIzMyOw0K
DQpUaGFua3MmIzMyO2ZvciYjMzI7dGhlJiMzMjtyZXZpZXdzIQ0KDQpSZWdhcmRzLA0KSmFzb24t
SkgmIzMyO0xpbg0KDQomZ3Q7JiMzMjtDaGVlcnMsDQomZ3Q7JiMzMjtBbmdlbG8NCg0KPC9wcmU+
DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioq
KioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZQ0KICoqKioqKioqKioqKioqKioq
KioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGlu
Y2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRh
cnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRl
ciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0
byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0K
ZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1h
aWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQo
cykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBh
cmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZQ0K
IA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5v
dGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWls
KSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcg
YW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0
aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3Uh
DQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_007_732704603.327325576--

