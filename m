Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F14A19E55
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 07:11:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6779910E35F;
	Thu, 23 Jan 2025 06:11:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="eb4CMUfJ";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="TlStsDmq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EBEE10E35F
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 06:11:42 +0000 (UTC)
X-UUID: e60620bed95011ef99858b75a2457dd9-20250123
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=LdxrOsd+4wF8h3fFDLHsyPx7dSScTzXrDzFfKj5bchE=; 
 b=eb4CMUfJZaoDB3r10AZSYIr2CfV0VI6Vb+bXabRqjp+VMZCF612zT2M5yT3IrXqy8UALXCOtFZxzQeeffMBiFvuRu4xZ52ooxQq109SySqXj5Pa9kuhymTrqJ9pxn025WRDfvkhH2ZFN4Ku6s+EyxLUKaImApnzFAPu5BzRl9q4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46, REQID:d8e77137-9d52-48bf-958e-9d630e3541fa, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:60aa074, CLOUDID:2626987e-427a-4311-9df4-bfaeeacd8532,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
 EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
 A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e60620bed95011ef99858b75a2457dd9-20250123
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by
 mailgw01.mediatek.com (envelope-from <paul-pl.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 448357966; Thu, 23 Jan 2025 14:11:35 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 23 Jan 2025 14:11:33 +0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Thu, 23 Jan 2025 14:11:33 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qaATT6CtvfcJiFofJn9ZiEx42+aWicBYDDM5MSCzpROMIlCE/40SC4ii67GSPtpTysLJ5JJCfffD8e+NDn1cRQaTOlc/Rwnwe5mX9jy435wV2rWNIfPJCvnw9LUXXt9WSY1F0njCh4hY8Pd9mTsuUbxsz5cRh8x/Q8cRDqKL04k6hOFlBbT4wUdbCIwTPheOf+sQ9dNgh5Ri+HxbjkbGhhk8AUcs74W9hy4WOFUHp0xz80lOhFZGDdEjz0hjwgUvckjMdJuhThFtTnj/LYTZj2cwSLBMRD9NqqgksGpk2pfXdtPuIz1qFSSmiJwI89V7xq1e5q7TdGL6DKt5cxNHNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=26tnPl0vkobzw2sdqh91hUjWCxIBcKCcCx9ZSwo+VmU=;
 b=LXRKrbMeDOyKFtKAx3Qbo2MT9/S8v+X6dmjg3MZdqLBPnVQ6VCRAftE4xd5RoH13jjvcU6RucvX6UIWarNsSObJSzW+DDWGTz+q129artQjsQRr5zhpDba+Rt65Bm01zE3ElZ2X60304Rn0OKwfdhMDxZZcOIDGjPg7NXBec8DPTDRCpjoQCmMNkfEcd+F/SU6ssAz+QO6DhWGKFRj1Hn4YY7W+QYPRViltCsMh8nK5hBHLcJeFZO8KDv7NvmyZh+MlIWrR4F1wE9NcQR50bRiINBccx1TfG9gr3eVMPuibkvKO/uViTzpWWCP9KHsjp5CpGCXlMtTu0q8Z/bE09UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=26tnPl0vkobzw2sdqh91hUjWCxIBcKCcCx9ZSwo+VmU=;
 b=TlStsDmq7bc/smGOpzeslu6qOTNtwSgadf8ZKvIscMDhXC8uqNfT2vm9yz12GI5Gavl8F/K1ok++pc4YIQYVwla+nVvuxLNAUIl6Xf+iAuAoj4IbDGPUCZUTQYXMnVDMsc4c4NqF03fP8gy9CkUacH7FvSkVMNxHIfwQwWNoChY=
Received: from SG2PR03MB6636.apcprd03.prod.outlook.com (2603:1096:4:1b8::6) by
 KL1PR03MB8373.apcprd03.prod.outlook.com (2603:1096:820:13b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Thu, 23 Jan
 2025 06:11:31 +0000
Received: from SG2PR03MB6636.apcprd03.prod.outlook.com
 ([fe80::98e8:d61:f404:4052]) by SG2PR03MB6636.apcprd03.prod.outlook.com
 ([fe80::98e8:d61:f404:4052%3]) with mapi id 15.20.8377.009; Thu, 23 Jan 2025
 06:11:31 +0000
From: =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "krzk@kernel.org" <krzk@kernel.org>
CC: =?utf-8?B?U3VubnkgU2hlbiAo5rKI5aeN5aeNKQ==?= <Sunny.Shen@mediatek.com>,
 =?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
 <Xiandong.Wang@mediatek.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "fshao@chromium.org" <fshao@chromium.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "treapking@chromium.org" <treapking@chromium.org>
Subject: Re: [PATCH 03/12] dt-bindings: display: mediatek: add EXDMA yaml for
 MT8196
Thread-Topic: [PATCH 03/12] dt-bindings: display: mediatek: add EXDMA yaml for
 MT8196
Thread-Index: AQHbY1yrDUiFOy83+0KImka1ZzUdabMQB4wAgAXBksCABoVHgIAHpisA
Date: Thu, 23 Jan 2025 06:11:31 +0000
Message-ID: <b9405b09da418eb3c65592b53489d7f0dd4093f2.camel@mediatek.com>
References: <20250110123835.2719824-1-paul-pl.chen@mediatek.com>
 <20250110123835.2719824-5-paul-pl.chen@mediatek.com>
 <173651725269.2671643.2891127782637834272.robh@kernel.org>
 <SG2PR03MB66367B4A9DBCC971F55DB326BC182@SG2PR03MB6636.apcprd03.prod.outlook.com>
 <d116e180-a056-4595-851c-ed1bb6f24cef@kernel.org>
In-Reply-To: <d116e180-a056-4595-851c-ed1bb6f24cef@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR03MB6636:EE_|KL1PR03MB8373:EE_
x-ms-office365-filtering-correlation-id: aa621421-e0ab-4183-7c0c-08dd3b74c7db
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?emRQRGo0REU5U3NUQklJejN6TmRUa2VLVENHNlZRdHpocEwxdzV3eWtxRERO?=
 =?utf-8?B?eHcrdm40bktraDI5ZnhrMWI1Z0hnamJVVXZ0Y1liOThTUzJiZXpkNHpRWHll?=
 =?utf-8?B?b3M2ZW1NS3RWWUYyTmZBOFRLaXZXSVU3emNvOVJzWlhrNVhmVUE0cnArT3V3?=
 =?utf-8?B?NzV2VWZPU3liQUpMQkYrTjdmMGdrQjZLOEZDM25XMVdhWWhSb0MzY2g0cWFQ?=
 =?utf-8?B?Y3p1NFFJV05vN1RnYWZtQ1JxM0dpUENBbHhtNElhOG11UzAvWVpZNXR2Z3c4?=
 =?utf-8?B?KzNpSUlhbWMvcCs5Y3BFN1VxWEhTcFU4WVdzendIaHFpakN1NVptZ1ZRK25L?=
 =?utf-8?B?RE80YWtGN2lOamRKYTh6TWh5TDJkekxVUDVHczRxV0Z5RFowWkRIWUlDZEwr?=
 =?utf-8?B?UGF6TkU5b0krL3BtZzBPSFJVZEdiQWhPeG4vOGJxTkQyaW5pazZwKzNnTjRr?=
 =?utf-8?B?VFVsMDRWMjQxQVBZRDJwOHBvWncxL0hzT3FmT01kYlplVmNZcHlaZHVaaFlR?=
 =?utf-8?B?TFltaVhTazNDbEl1SkFDNFRxd3ZnUHI3emZZa1JQSmtCQ3JSWTZXNWdPWm1u?=
 =?utf-8?B?VHBIRVJwV3o0V2dyNlVBdU0raW5vMEpQd1NzZzI1YU1KNXBad1dlU3huRld5?=
 =?utf-8?B?WU9TWkkvVDB0bktkZXBhZ2prUFBCL1Rpd2ZhN2VWYitNeDJyR211Y2NIclY0?=
 =?utf-8?B?VVZhQ003THpZV2taT3hSVGlRTGQyampjcjVkeHpBTmVnMVQzQ0pUYjN3T2hm?=
 =?utf-8?B?dFJsM2ZQMUs4NFQwQUhTd0ZvWE4xYVg1YW00eHd4bnRPNlAxdWFKSlBpVjFZ?=
 =?utf-8?B?WTIyTlhCbW9UU0E3YVo4czJNVGt5ZkZMdkpBa1ZyK0dadlpONFdDS1FYcXBW?=
 =?utf-8?B?TDZBOUVVMFdtak5rRXpDb2FYa2hIRWR6RUJ1akd2dVZLaDZTMGV0djRaanhT?=
 =?utf-8?B?WnlzRDdpU3h1QjNRSlMrN1M5L0tCaVNhQThKeWs5dEtrcENSaE9jRG4vV3hz?=
 =?utf-8?B?SnJkbTVrdmVxODZqdWY1U1NRNm9tREQyMXZOYzBudGN6d1Z5Zk1ZUkd6dkdh?=
 =?utf-8?B?Ujh5MkFKTSt0c1p1NG5sZ2htenIrSnZqMDh0VEZuZkRoZkRudTFzNG1Pblh1?=
 =?utf-8?B?YkNwOGsyMkdDRVVVMFgreFBWWjIrejdBVDI5RGViUU5md2VuOGdxMHJuOWdi?=
 =?utf-8?B?NGc1cmxYQm1GaXlubi8wVEFMSVZmeng1cy9uQWR2eW5WTDRBOXNQc0NXb09D?=
 =?utf-8?B?RjRjR3lweko4SGtlVE51alVMaWJPVzV4eHUzMUtaYWYzcHJKSWxvSnJLQjNK?=
 =?utf-8?B?VWcyaDlaOFpza0NqdzJHcE02UDFITmd5dUkrRnJINndSWWN3VXVyL0hHK3k2?=
 =?utf-8?B?R3E2OVE2b1JSVmM1UWd1dnl2eE5rRHFjQlhuUkdZUGFGTmwvVElKQ0l3USt6?=
 =?utf-8?B?ZEY5VGxGa3I1UFJ4ZjNvVXlJdXcxMU04Uk5NSU5VRWpUWG11UU9RaFRNbDZV?=
 =?utf-8?B?OHFQNWJVM2VnWnErOE9UeVluVXpTOW5qNkRFTWkyMlJMMnBaK0ZhSy9GOW5G?=
 =?utf-8?B?aHIxZzdtYnJKWTVhUm4wdC9yVU5KeGQ1TUxwdjMwa2Rnd2xzeDI0cjV2VXJ6?=
 =?utf-8?B?TWU4NS9uak9lQ3VybFNmRUxacnV2QWVMSE9kTTV4NVZLa0diZmF2ZjJHK2Zn?=
 =?utf-8?B?Rk8zT3Z4NjJScytTaFUwMkdGNWVZRVhraUtRMWRGWWdPakZUdXZCeTlSamRx?=
 =?utf-8?B?MW5pNEFNa2hrbUhnZzFCSDIyUFdCQVNzbklJSEZCNUV2WUFiYXFvRHpyZXRO?=
 =?utf-8?B?UnBiaHcxdmFZT0NhVTIya0tjMm9QRWw5ZlRxRzFYdi9KbVY2R25wc1VNaXEx?=
 =?utf-8?B?cHJOT2hyOUl5M0tEVWdKS1ovNjNEM0xXcXZScjJIZnZlN295VUpHT2EwSXBM?=
 =?utf-8?Q?unjuqT7NvhGcTpIN0xr/1pajuPTjvp5+?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR03MB6636.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TERQeHVUYTBxOFRBMzdyRUpDL3RybWlBL3d2SmVSNkl3d2IwZTlMemNiZW5M?=
 =?utf-8?B?YjVBMU9Ra3hvUEQxdmlEb3J2SnBuQlVjTE5zcjE2RksvdzA3d2ZTNnVnTUQy?=
 =?utf-8?B?S0VDVmhVa3JxOG1YZWdpRHJBT0JqYSt4bTNyZE5LdlFoeG5CeGo1S3o2bk92?=
 =?utf-8?B?ZUZQVXRVMDJXNGZZZEtUZURKWUVKeVNQQzV0L3dBSXM5TXhpc3hrWW5wNUFi?=
 =?utf-8?B?YTdNcHZzSWNhWE1WdmFtVVRvOHBpZ0hBR0h1eDk5M04vcE03THhTQ0EvSGg2?=
 =?utf-8?B?aHBsTEtFUFBnR2JseWpPcFNYU1JqbUhJS20xbU1lQmpLc1hvS2lSUTNzRG81?=
 =?utf-8?B?bFVuaENzaTVGVjE5QkI2WXduUlhjOFNHb2REL2owa09kME9TQm1maTNVcmYr?=
 =?utf-8?B?SVU3ZU5XWS8wTWdzVEFjQlJmUGpydTZxOFdJOFJPdDRVVnhPQ250b2FGWkMx?=
 =?utf-8?B?bVlUem9aWnNnMGRYT2YxWGxxTUwvVGs4NnhSZDNFNUhWOThZYU0xamswc3VG?=
 =?utf-8?B?TzNicnZuRUdSRHZ5NVl5K2NNZEhzSGVaenVIRW1nUnZkV2ZXNzN5V0F2Tnl0?=
 =?utf-8?B?QzJKeGdsQ2d5cWY0YUZjR3k4N2RTMUhZVTN6SFFiODY5cVBnVmpPUXpSOU9C?=
 =?utf-8?B?WVdQeXJDa3EvRjNBa0dvTzBxRWk2VUJ4QmFmZk1ndFhGMEs4aXNuQzRTeUNH?=
 =?utf-8?B?YTB2eWFuczR5eUZYZmk3bWtxcUNUK1VuRUIreVVrWDV0KzdWN1NrZFNoNWJ0?=
 =?utf-8?B?aEo1endnM2RNRjhwenpXZ3VCZ29pVmRkVEhaRHVnTm10N04xOE5HQXc0cDU0?=
 =?utf-8?B?VjgxNzQxaFp5b21vckh5dDJxNTgybEQ1NCt3SEtxVXpvcnBha1FneVd3a1Fv?=
 =?utf-8?B?SEx6emhyZTlvRHpTb2dDRUZ0Z1VaSTVvR1ZQU3BzY2xoQkdCa1FXVkJqYW10?=
 =?utf-8?B?Q1NpelNGQWhpSkRrMlFsOXVDbkZTak9GMjJIVm9DSWRFU1FZYURuV3hpN1JC?=
 =?utf-8?B?RjJyUkpyU3ByVXB2YStocFBrS2NYRWtKY2VpK1AxQ2hMNHhnOC9tOUoyWXl5?=
 =?utf-8?B?czlUQldzVStlK2xGMlFndFd3aHlLcXhyYzhCeHBxOVBNRlk2R2daNXBqZnRv?=
 =?utf-8?B?RVNSZHZWcVRnbnpVNVFHMjFNV1NLWDJyWVk2cDFackVwMEQycDR4emMvSDJv?=
 =?utf-8?B?T3FIUForV1AzRDFQd0kvbmJNQU41ZWplbE13cTFUbWcxZG1zekQ2WFRUQ1VG?=
 =?utf-8?B?ak1HUVVnU1V3aVdIT1EwS3hSelFma1FVOGhORmd0YVhidUxXNnJsK0ZJMUNJ?=
 =?utf-8?B?c0FleEVSWm90WVAwb0pqTDBmYzk1QjJCT3hnMEY3ZktFdm1hT1Z2QjZvUEFs?=
 =?utf-8?B?Zm9LMERFVVlqcWs2aDN4b2JsRCszME1haGRUYU1sckROc0ZueG53b0ZLK0Fy?=
 =?utf-8?B?czgyYjAzVDBraXBEcDJadzNML000Zk5UM2RDSWZGWGx4dW5JU3pkSUVjK2dh?=
 =?utf-8?B?ZWcwSU1qNkVxY2xIZE5seUdBWld1WmlIeXYxUnFGYWpKMFhocHliUVVHc3gx?=
 =?utf-8?B?emg1S01IakcrYmR6SllvUUpFb0NQdjhpUXp2MkpTNmNSR0VNeWZDU0hXOFZi?=
 =?utf-8?B?bWNPWVNqa3lDK1dLRHpjdkdtbjBPWDhibGxFZFhSb0lFdVJXVS9hck1tcnZz?=
 =?utf-8?B?Ym8raVJadE1mNTZqaWd5NXpJUTNxejg5OHNCUG9FTzlicXJ4ekszcCtPWDg4?=
 =?utf-8?B?M0I0bHVZQzJ0c1Q2aVl1SUFhZkpHUEhiQzBqa1ZjRHN2ekZwekZZUmUyZEwy?=
 =?utf-8?B?R1F4WTNpQk85S1dQUFhQVXV6UldEK2pma3dXa1hkU20zQzNMSHZqcXhZM0RK?=
 =?utf-8?B?UGE4QnlRN2FQVFozcWlmQ0pzL0locXFWTTZPMGJlejYwd0xZWXNCbnc0S2hY?=
 =?utf-8?B?bUFWZE9FbE9YNzQrRXNBR0U0NzAzaE1JekVYaDdBU0pwUE9haytLR3h3THFy?=
 =?utf-8?B?bnhaMEhyNlVLemFEcmxvM3pHSmtBb0VYMWQ5Tm9zMUxZY1VPTnQvaVR3Qm8w?=
 =?utf-8?B?RFJEMTBLU2VKUDJ4NFdWd2tpSHF3UGNRTnlFZ2F4S0VRdnNITVdxZ2ZOSks1?=
 =?utf-8?B?eHhIYzVBakl0UENodDNVMzVuekdveEo5RUFwc2tIU2tNTVdsRzF6eWpmWFlR?=
 =?utf-8?B?L1E9PQ==?=
Content-ID: <4D0B7E95203C4547AA15AED762F527B1@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB6636.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa621421-e0ab-4183-7c0c-08dd3b74c7db
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2025 06:11:31.1709 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rqG5bU8Lo5esLLHWkYPZKniOrl4cxfe+yetZYqdRPgRiSRWRoIYT1mEqEcHIfm74KFqPUtqykvJF+CQs3biu25QzqAa9nbtlciX0hp3Tmik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8373
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_001_1706395790.1011451035"
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

--__=_Part_Boundary_001_1706395790.1011451035
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gU2F0LCAyMDI1LTAxLTE4IGF0IDEwOjIyICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9y
IG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBv
ciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBPbiAxNC8wMS8yMDI1IDA2OjQ5LCBQYXVsLXBsIENo
ZW4gKOmZs+afj+mclikgd3JvdGU6DQo+ID4gSGkgUm9iDQo+ID4gVGhhbmtzIGZvciB0aGUgYWR2
aWNlLg0KPiA+IFRoZSByb290IGNhdXNlIG9mIHRoZSBlcnJvbmVvdXMgbG9nIG1lc3NhZ2UgaXMg
ZHVlIHRvIG1pc3NpbmcNCj4gPiBwb3dlci9jbG9jayBkZXBlbmRlbmNpZXMuDQo+ID4gT25jZSB0
aGUgTVRLIGNsb2NrL3Bvd2VyIGhlYWRlciBmaWxlIGlzIHVwc3RyZWFtZWQsDQo+IFNvIHRoaXMg
Y2Fubm90IGJlIG1lcmdlZC4NCj4gDQo+IERlY291cGxlIGRlcGVuZGVuY2llcyBvciB3YWl0IHdp
dGggeW91ciBzdWJtaXNzaW9uIHRpbGwgZGVwZW5lZG5jeSBpcw0KPiBhcHBsaWVkIHRvICpMSU5V
UyogdHJlZSwgbm90IGV2ZW4gbWFpbnRhaW5lci4gT3RoZXJ3aXNlIHRoaXMgYnJlYWtzDQo+IG1h
aW50YWluZXIncyB0cmVlLiBJIHJlYWxseSBzdWdnZXN0IGRlY291cGxpbmcuDQo+IA0KPiBCZXN0
IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KPiANCg0KSGkgS3J6eXN6dG9mIA0KDQpJIGhvcGUgdGhp
cyBlbWFpbCBmaW5kcyB5b3Ugd2VsbC4gSSBoYXZlIGEgY291cGxlIG9mIHF1ZXN0aW9ucw0KcmVn
YXJkaW5nIHRoZSBFWERNQSBjb21taXQgcGF0Y2ggYW5kIGRlY291cGxpbmc6DQoNCjEuIFdvdWxk
IHJlbW92aW5nIHRoZSBleGFtcGxlIGZyb20gdGhlIEVYRE1BIGNvbW1pdCBwYXRjaCBiZSBzdWZm
aWNpZW50DQp0byBhY2hpZXZlIGRlY291cGxpbmcgZm9yIEVYRE1BIFlBTUwgYW5kIE1USyBjbG9j
ay9wb3dlciBoZWFkZXI/DQoNCjIuIElmIHJlbW92aW5nIHRoZSBleGFtcGxlIGZyb20gdGhlIEVY
RE1BIFlBTUwgaXMgbm90IGFsbG93ZWQsIHdoYXQNCmFsdGVybmF0aXZlIGNoYW5nZXMgY291bGQg
d2UgaW1wbGVtZW50IHRvIGFjaGlldmUgZGVjb3VwbGluZz8NCg0KVGhhbmsgeW91IGZvciB5b3Vy
IHRpbWUgYW5kIGV4cGVydGlzZS4gSSBhcHByZWNpYXRlIGFueSBpbnNpZ2h0cyB5b3UNCmNhbiBw
cm92aWRlLg0KDQpCZXN0IHJlZ2FyZHMsDQoNClBhdWwNCg==

--__=_Part_Boundary_001_1706395790.1011451035
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1NhdCwmIzMyOzIwMjUtMDEtMTgmIzMyO2F0
JiMzMjsxMDoyMiYjMzI7KzAxMDAsJiMzMjtLcnp5c3p0b2YmIzMyO0tvemxvd3NraSYjMzI7d3Jv
dGU6DQomZ3Q7JiMzMjsNCiZndDsmIzMyO0V4dGVybmFsJiMzMjtlbWFpbCYjMzI7OiYjMzI7UGxl
YXNlJiMzMjtkbyYjMzI7bm90JiMzMjtjbGljayYjMzI7bGlua3MmIzMyO29yJiMzMjtvcGVuJiMz
MjthdHRhY2htZW50cyYjMzI7dW50aWwNCiZndDsmIzMyO3lvdSYjMzI7aGF2ZSYjMzI7dmVyaWZp
ZWQmIzMyO3RoZSYjMzI7c2VuZGVyJiMzMjtvciYjMzI7dGhlJiMzMjtjb250ZW50Lg0KJmd0OyYj
MzI7DQomZ3Q7JiMzMjsNCiZndDsmIzMyO09uJiMzMjsxNC8wMS8yMDI1JiMzMjswNjo0OSwmIzMy
O1BhdWwtcGwmIzMyO0NoZW4mIzMyOygmIzM4NTE1OyYjMjY1NzU7JiMzODY3ODspJiMzMjt3cm90
ZToNCiZndDsmIzMyOyZndDsmIzMyO0hpJiMzMjtSb2INCiZndDsmIzMyOyZndDsmIzMyO1RoYW5r
cyYjMzI7Zm9yJiMzMjt0aGUmIzMyO2FkdmljZS4NCiZndDsmIzMyOyZndDsmIzMyO1RoZSYjMzI7
cm9vdCYjMzI7Y2F1c2UmIzMyO29mJiMzMjt0aGUmIzMyO2Vycm9uZW91cyYjMzI7bG9nJiMzMjtt
ZXNzYWdlJiMzMjtpcyYjMzI7ZHVlJiMzMjt0byYjMzI7bWlzc2luZw0KJmd0OyYjMzI7Jmd0OyYj
MzI7cG93ZXIvY2xvY2smIzMyO2RlcGVuZGVuY2llcy4NCiZndDsmIzMyOyZndDsmIzMyO09uY2Um
IzMyO3RoZSYjMzI7TVRLJiMzMjtjbG9jay9wb3dlciYjMzI7aGVhZGVyJiMzMjtmaWxlJiMzMjtp
cyYjMzI7dXBzdHJlYW1lZCwNCiZndDsmIzMyO1NvJiMzMjt0aGlzJiMzMjtjYW5ub3QmIzMyO2Jl
JiMzMjttZXJnZWQuDQomZ3Q7JiMzMjsNCiZndDsmIzMyO0RlY291cGxlJiMzMjtkZXBlbmRlbmNp
ZXMmIzMyO29yJiMzMjt3YWl0JiMzMjt3aXRoJiMzMjt5b3VyJiMzMjtzdWJtaXNzaW9uJiMzMjt0
aWxsJiMzMjtkZXBlbmVkbmN5JiMzMjtpcw0KJmd0OyYjMzI7YXBwbGllZCYjMzI7dG8mIzMyOypM
SU5VUyomIzMyO3RyZWUsJiMzMjtub3QmIzMyO2V2ZW4mIzMyO21haW50YWluZXIuJiMzMjtPdGhl
cndpc2UmIzMyO3RoaXMmIzMyO2JyZWFrcw0KJmd0OyYjMzI7bWFpbnRhaW5lciYjMzk7cyYjMzI7
dHJlZS4mIzMyO0kmIzMyO3JlYWxseSYjMzI7c3VnZ2VzdCYjMzI7ZGVjb3VwbGluZy4NCiZndDsm
IzMyOw0KJmd0OyYjMzI7QmVzdCYjMzI7cmVnYXJkcywNCiZndDsmIzMyO0tyenlzenRvZg0KJmd0
OyYjMzI7DQoNCkhpJiMzMjtLcnp5c3p0b2YmIzMyOw0KDQpJJiMzMjtob3BlJiMzMjt0aGlzJiMz
MjtlbWFpbCYjMzI7ZmluZHMmIzMyO3lvdSYjMzI7d2VsbC4mIzMyO0kmIzMyO2hhdmUmIzMyO2Em
IzMyO2NvdXBsZSYjMzI7b2YmIzMyO3F1ZXN0aW9ucw0KcmVnYXJkaW5nJiMzMjt0aGUmIzMyO0VY
RE1BJiMzMjtjb21taXQmIzMyO3BhdGNoJiMzMjthbmQmIzMyO2RlY291cGxpbmc6DQoNCjEuJiMz
MjtXb3VsZCYjMzI7cmVtb3ZpbmcmIzMyO3RoZSYjMzI7ZXhhbXBsZSYjMzI7ZnJvbSYjMzI7dGhl
JiMzMjtFWERNQSYjMzI7Y29tbWl0JiMzMjtwYXRjaCYjMzI7YmUmIzMyO3N1ZmZpY2llbnQNCnRv
JiMzMjthY2hpZXZlJiMzMjtkZWNvdXBsaW5nJiMzMjtmb3ImIzMyO0VYRE1BJiMzMjtZQU1MJiMz
MjthbmQmIzMyO01USyYjMzI7Y2xvY2svcG93ZXImIzMyO2hlYWRlciYjNjM7DQoNCjIuJiMzMjtJ
ZiYjMzI7cmVtb3ZpbmcmIzMyO3RoZSYjMzI7ZXhhbXBsZSYjMzI7ZnJvbSYjMzI7dGhlJiMzMjtF
WERNQSYjMzI7WUFNTCYjMzI7aXMmIzMyO25vdCYjMzI7YWxsb3dlZCwmIzMyO3doYXQNCmFsdGVy
bmF0aXZlJiMzMjtjaGFuZ2VzJiMzMjtjb3VsZCYjMzI7d2UmIzMyO2ltcGxlbWVudCYjMzI7dG8m
IzMyO2FjaGlldmUmIzMyO2RlY291cGxpbmcmIzYzOw0KDQpUaGFuayYjMzI7eW91JiMzMjtmb3Im
IzMyO3lvdXImIzMyO3RpbWUmIzMyO2FuZCYjMzI7ZXhwZXJ0aXNlLiYjMzI7SSYjMzI7YXBwcmVj
aWF0ZSYjMzI7YW55JiMzMjtpbnNpZ2h0cyYjMzI7eW91DQpjYW4mIzMyO3Byb3ZpZGUuDQoNCkJl
c3QmIzMyO3JlZ2FyZHMsDQoNClBhdWwNCg0KPC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0t
dHlwZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50
aWFsaXR5IE5vdGljZSAqKioqKioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRh
aW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMp
IG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndp
c2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBp
bnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50
KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJl
dGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNo
bWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQg
YW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGll
bnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUgDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRo
aXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVs
eSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVz
IG9mIA0KdGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBz
eXN0ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRv
IGFueSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_001_1706395790.1011451035--

