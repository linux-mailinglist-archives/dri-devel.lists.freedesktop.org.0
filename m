Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 171998CF8AE
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 07:21:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 009CE10F8A1;
	Mon, 27 May 2024 05:21:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="iiZm6yJX";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="Z/lFLNu+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B120C10F8A1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 05:21:16 +0000 (UTC)
X-UUID: ed81320a1be811ef8c37dd7afa272265-20240527
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=G8uyuxM1cCRzuZR3pM2wBNORCbBwdyvynkq7InslGek=; 
 b=iiZm6yJX8Nm+JY3fPR7e8tcVCuxn6ovblQ5zXR19IWJqe16rcbZWYmXfJcm4QNJooV/cBDlcJXJ9ez3fKT8jCO+Do48BkwuZdnA/ebgmHvvnkzS4lYQgE1Z9GEs2Xncd3v1Fxl/9cX8LH98gYHCJvHOrQDNEXeoCo4BFWSqnRcI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39, REQID:92aaecc5-760c-4d3b-a1e4-d86193616622, IP:0,
 U
 RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:25
X-CID-META: VersionHash:393d96e, CLOUDID:750e5a84-4f93-4875-95e7-8c66ea833d57,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 1,FCT
X-CID-BAS: 1,FCT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: ed81320a1be811ef8c37dd7afa272265-20240527
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 904967918; Mon, 27 May 2024 13:21:10 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 27 May 2024 13:21:05 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Mon, 27 May 2024 13:21:05 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S9Sy9DtoSQjviSl4fmfEfU7s3GgCaTuXCxQPWvy58xAPRPtwPA3/m3xjXungSD9RaSbKMcZn41BOF0IQizCNQQUApRZA6/ldMXwD3r7SVZFz6LLTW/pMd8C/kmuhIUddZBaCdz1f0M6DQhVB3/Td307rOnY/no7DM+Ds0QcmNp1iHelwQLrIKboDhnxO6reje5mk36px+jUZdXH/9Wnxe7xFZgMFyNgY1Wa/bb75wAhM0GwZXSh5aGq0CaLtv5lNyRa216JuCmx7wmryaYHw/1uD69AkKrrdAIr6SdFtlj/hfXMVLjr8tbYq+8YBImqNHSKK8iw/5vxY1rjjzBWIfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4nbXPzm5nqAsAbxSPA8uZVJ1e70eUIgg3QkZU2ncjwo=;
 b=WbBBH8u2pH9kMidvnSo0cY3x2uk+K+I4SeDwZ19riwddxa3X7tQ9WYGGUNKE9mju2/IC7ZRvLYP6NeIVSlnvqUAkxf2ljvVB8HC58uQuz9nCRNB+mXA++qmMq2jIzKQOq9Tr3tsWSTtdnBDgB0NPV23W7Mye7JyaQQOykfIh18yq1+N7pPe3Afbm18QmF8LNQD7u8ws7qZE6jx6tus2ec5GLrxNZLnkdfIX443PJj/bvPuvlpyHSMdME1qSbkhdSe1ASZVj9sWU8glz2oNcop/AEV1fc4h0M2Qf+3Z/eJpzCapdFk8c1jwtkIu3H6KqLCHBrpAJRfy3Hnz0aVO0J1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4nbXPzm5nqAsAbxSPA8uZVJ1e70eUIgg3QkZU2ncjwo=;
 b=Z/lFLNu+ccJA0VS60PYZCc25Jpvj97ORWrPJiUBywl28pUUYVMSJ59/04QIaxOBTA1RZYhkDLOi3OGCFpDsqNgJomqKPlHeHfLF5/S9Q1H+nd5NY08l/snFGVf3QHJYOdwdJWFvTu1hCbe9P6LmWREVrifK9Z/dxVt2ur4WaW0g=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by TY0PR03MB8175.apcprd03.prod.outlook.com (2603:1096:405:18::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.16; Mon, 27 May
 2024 05:21:02 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%7]) with mapi id 15.20.7633.001; Mon, 27 May 2024
 05:21:02 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?=
 <Shawn.Sung@mediatek.com>, =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?=
 <Nancy.Lin@mediatek.com>, =?utf-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?=
 <Jason-ch.Chen@mediatek.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "jassisinghbrar@gmail.com"
 <jassisinghbrar@gmail.com>, "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH RESEND, v6 2/8] dt-bindings: mailbox: Add property for CMDQ
 secure driver
Thread-Topic: [PATCH RESEND,v6 2/8] dt-bindings: mailbox: Add property for
 CMDQ secure driver
Thread-Index: AQHar3tWR1mdbw1vHkCqbT1wS+K7DrGpsF4AgADb/oA=
Date: Mon, 27 May 2024 05:21:02 +0000
Message-ID: <f32827da0946c50f4bcaea8ab04caf1916ad78d8.camel@mediatek.com>
References: <20240526144443.14345-1-jason-jh.lin@mediatek.com>
 <20240526144443.14345-3-jason-jh.lin@mediatek.com>
 <171674001829.1684465.16088341885457355919.robh@kernel.org>
In-Reply-To: <171674001829.1684465.16088341885457355919.robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|TY0PR03MB8175:EE_
x-ms-office365-filtering-correlation-id: db7f12f6-1ce2-403f-e61a-08dc7e0ccce7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|7416005|376005|1800799015|366007|38070700009; 
x-microsoft-antispam-message-info: =?utf-8?B?SmdSV3Vmbjd1cmprS01Eb3JLenBXWk5TaFRsK3QzMmxtelgxVDV5R0plZHBB?=
 =?utf-8?B?ZDBzUEEzMml3SVhFN0RPWG1oSUhGT1o2OUo3ZERiZXhoaTZnMTI2MHJFdUZr?=
 =?utf-8?B?c2ZoQ01Fbk02K09lakVuQ2FLeEk5aHFVSzJlRHlDeUtUZ1Z1VGd0SmhCRTZh?=
 =?utf-8?B?MmFENW1LV1ZlTVp3VXM0SFoyYzJ6REdyemREU0wxSmN1RUlaazJKNXhyR1Fy?=
 =?utf-8?B?TW13a1VHSFdNZktPUmtUTjRQNEdaQXkwSWxac0FoL2ZVVmZMTGpZTVdsMFhW?=
 =?utf-8?B?TktKUldlWWk0aCt0aTloUWhXTDM1UFFCQ3pzTVpkOUJORDVPL1Z4UzBlczNI?=
 =?utf-8?B?VjZZNVVTT1dndk1GODBwY0l3ZkhsMEFQNyttTi9ZS2ZOY1RYUWVGNW82S0tE?=
 =?utf-8?B?NUFiZHc4bFNUSkdhYTZjOTg0OER3MVFyWGEzbGM5MGtJRmZGc20wN2ltOXFQ?=
 =?utf-8?B?N3hqbEp5d3BaMHZRZlF5VkMzelNzN0ZPWThCVkRiVUVHWHVwaDl5N1JLTlp4?=
 =?utf-8?B?ckxpNUYyZFh0cytUU285elZlKzNNUEgwaDNvNXI4NTVvdHZITi80L0greWpI?=
 =?utf-8?B?OHluSGpsc1BnUzFNQkZhVVFSd0xJYVZGRFhSdUQ5SGFSRit2VFppdncrUk05?=
 =?utf-8?B?RHJWbUJ3azR3SWhVK0c0dExMWXNmVk5xZmgxeW02dlAzVklVOWZqd3lNcjEy?=
 =?utf-8?B?VnB0K2E0c3FKUTdyNXNSWjQ1OUhCV0JjaTZBMTZodzF1ZTdLMEx4SXZNdCsr?=
 =?utf-8?B?OUlnV2hybThDcVBYQXJyT29ZRWZBWmNDRTBFWmkzOXZCZDRZYnZndWRzSHFB?=
 =?utf-8?B?eHBKSWVoZ0ZmaExZMEg5Y1l1OWtnbHBaTVZjTnZscEpQSXAweDhkcFd4MUky?=
 =?utf-8?B?SUpzY1lGRzhVeHdXS1EzQ0QxNVhROWk2eEpQY1hvenhZS20wb1JvdDZFeUFP?=
 =?utf-8?B?YndNYzAyNXVOR1BRUE1oeDJXek5obnNRVlRiSHM0OE10TU1ZZm8rcGQ5VTFO?=
 =?utf-8?B?TWllb3N3T2cranovZlE4cmNUS0M3R05GMXlGcklTVWlXd2ZIOExsaUloUlJV?=
 =?utf-8?B?ZHZHMll0RHlwL3JjUGdPRmtkWmZoV09PbTVqYllPbkNOVFFrRmdhUlBUZ0g2?=
 =?utf-8?B?ZUxTbGRsVEJ6MDlkNHNlWktyZmR2ejRkTGFyQmtsNjRMZUhyazJjY1U2ZGhq?=
 =?utf-8?B?b0xXL3NtblI1NnF6NnVQb2w0U084TTk3RGU5U0JRaURybS9YSmlIajJldmdh?=
 =?utf-8?B?MVRIMFhNZnErZmJVN0ZRNER4eUdwWjNVV1lmZzB0cks5RGlNNDNVZGpXeDVG?=
 =?utf-8?B?VUxOL3c0T2J5aE5rcXpWUVdtcmxpankzelhmemNNRGdiZ1Y1a1hYNlk5SHlv?=
 =?utf-8?B?SHg3WFIxbnlvclRoaUhZWmpEWHNUWnRsR21ob3pKNzgzdXp1WUZ2N1luMTY4?=
 =?utf-8?B?WFpmNElLWHB2RmxDdjcxdTFyempOdU84Z09ka1cwcnp0aUZzQlhFWnFqOG5F?=
 =?utf-8?B?ZVhIWHhBZnZ4bGFacTJjK3dqVkZnZGhiUnZnWjZXcVVGM0h4K1NjN25DYnd6?=
 =?utf-8?B?SHFjUUNMQUN6QTQ2K2xwbnp1TkFYTzJ5UDJDSWJsQ3czVFMzdHd1N1JFYUVU?=
 =?utf-8?B?eUY1VEo1Y3VjZmRvSFpaUlFqRk1acVlQMGVUL0ZiOHRGWDgrMGk3Tm5RL2Zo?=
 =?utf-8?B?aStKOWpaRmhhbkZSUFBSdTNjMVVwbVNoR3p3QTRLZW1jcTU4RTVuTDdaRnQ2?=
 =?utf-8?Q?BFDLdIZBFE/d/vVR8c=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(376005)(1800799015)(366007)(38070700009); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d2pCVkt1cVhQZXpEZmZmOVVVeUV6YUZpckt3azBxK2RvTmdoWkdpNnpidVZr?=
 =?utf-8?B?Wm40TlFDTGhXbE1HVEVhWHVXYytTdURoQ3V5RnZIVFlUMnB1TXBtTy9McURh?=
 =?utf-8?B?MDAxbHUyTThoSFVhcWdFLzJsNGRZaTIyNWx3bHByTXcrS2VVZkU4T29zSzBy?=
 =?utf-8?B?RFhNa3o1eXNSWWZTSXRNV0x0SHE5bytkMWk3dUdYOHZ0Q3JWMXRXVEV6YnFt?=
 =?utf-8?B?ajJVR3Bsc0VzMy9ZZVpSZlRZT0ZDa093MnA4dlFGS1lBNFl4bUgwMk1BOTdF?=
 =?utf-8?B?VC93UWxCMHAyN1U2dWdBbjF6M1pvM3ovQUhZcnlPVUtFSnYvWmxzazYwcFlW?=
 =?utf-8?B?ODh2VXJweDJYclFWZFYwbVZ3YVBDZm03MCtCZVBUMXNCNWFaTmNjd1FSUEtK?=
 =?utf-8?B?OVdmdEsydllTY2hnbjZvSVovaitaN0kxaTJOaEk2T0ExSDdRRXg4a0JoOUZv?=
 =?utf-8?B?dGdpYW9IYW5yaGJKN2VoMFlRemFWMFpPODQ0TkJQQ1hqSzJLVU1sMXNUQk03?=
 =?utf-8?B?c3laYU5pV2Foc09EaE9HbUFnWTJrVEI5UkpJc1ZzOWszcGNZZ2FGV2VpSnNp?=
 =?utf-8?B?UnB1dkdla2dObG9tMUpQMlorWEhOU0p3MFhWQythYUVNOXMwS2FQOUZDSm12?=
 =?utf-8?B?b1R4SElYVlBZcCtuVko5clNIZ2twcWFpWGUvbTluMExNREpGVUtSWXdORFVy?=
 =?utf-8?B?NGtLdW16SGpLTTBjaVdMbGNzL2RMUnRsbnFOWmxwSEFQcXpXc1lQbDBDb3pC?=
 =?utf-8?B?eXNOaWkxbG9QMVJKbktmMTZGSzNNUUNZSzhxZW4zK3ZyRjBKbzVyZUFIVzVX?=
 =?utf-8?B?VXc4cDQ1WEV3cHNBRnE4UTByaVFEUit0ZzdTYi9BWndLbGkyNy9teTRvSXUw?=
 =?utf-8?B?WVdJdjU3Wkovd1poY0sxYlE4Nk1IRGoxZkRHT1U2VWNKTmJkM2xVYk5uNnFM?=
 =?utf-8?B?cHM1Y05HZWYxRlRoTE1GZjVpRUZTdWJUSURNREQwbGkwSlNLUnJkcmVmOW4z?=
 =?utf-8?B?QWlkVUxIRTZVY3o2R0lMZ1hsUW1Lb0hsYjYyekQxTnNYUFN0T0xLRU9kUVRj?=
 =?utf-8?B?Z3ZhdHE3QldDMi9zNGF3MUhpWGx4UkVsakxPZkFMbFI2TEFPNVphMVVORXVr?=
 =?utf-8?B?RUxzMjFrWW45RUZBWnRqZHFreGl0S2NPNEE5aG5BRG9jRXhNcEt4VTlrTkE3?=
 =?utf-8?B?bmtyV1lod01Qd2Z5b2NvRldzYTFyMmZYekw2dk05QmVIQ3BwSHNnSHByNk4w?=
 =?utf-8?B?bVYwUUl2MDhuaGtSN1Q2cGFaSTY5c254UW9nY0pud3ZCREhPWXpaMmJrL2NE?=
 =?utf-8?B?QkFSb2s2VS9rcFpkVCt5QnBoYXZaMSs0VGZGK1Z1UHZwdHU5bkV0ZnRxQnZT?=
 =?utf-8?B?U1l6TkxCTTg0dk02bnZiK0ZKSE1Eb3YzL1FqWE02VGpNQTdSekNTZEswSVFN?=
 =?utf-8?B?RHJHSHFhZUdmMU9NSWoxMGxaa213cG1HUGZVRWhZTXFnWUUreFF0SnlqMExk?=
 =?utf-8?B?YTYzOGZnSUFVVlRJaFNvTDBMa3lyNjVHaHYvdmRjeERrcUNtT3UxV245V000?=
 =?utf-8?B?dTBKY2pOb05CZG5lcDAzUVliKytmeXQwZXVOa2JveVBxKzBBejA2bUdWditL?=
 =?utf-8?B?cUVPQ09VQnhBUzNOT2tTV3l0SGtoSnlhZVQvVFhpK0FBL2JzMjlNcytidFN1?=
 =?utf-8?B?MVNSM1l2QVJnekZQdTZCK3lKZzVnTUROcUxheEVxVjMvSHBaR0x4ZnAvbEg5?=
 =?utf-8?B?T1ZrSHFUZmRKQmtadWpLUmdyaElPM0xmYUpRMm9LTXJVWEZYZTEvOVhvL0M0?=
 =?utf-8?B?bXV3WkVRVWpITWc4RjJJaDVXdEtuUmxuQ1hhbUFoTldON3hZdjM5ZnBQdisy?=
 =?utf-8?B?VERIeEU3OE5uVkdiZU5vdDRQK1FGdlQ2OUNjTUhOSTNKdDVZaTl1ZzhvQ0Rx?=
 =?utf-8?B?YXZZV0ExL0cvRXgyMllieXpRNmVkaEFZcFlMVjM0OHVBNXlRRjc0NXYycTQx?=
 =?utf-8?B?M2hZSXV3QUlMSk1jUUx1NjExVGpNZFBEV0JMVU5WQy9VbExVTWJjSmpxRjEz?=
 =?utf-8?B?K1Bsdy8wYWg5U1RpVTQzYldWQ0cxVjBuaG1WUEpMTUV5b0grWnBpa1JNRFIy?=
 =?utf-8?B?cDM3RVhVTVpFNXhGNkF0MG14anBYa2w5dmwyNlVkRGZBMFdndzFiTGJPbWs4?=
 =?utf-8?B?Z0E9PQ==?=
Content-ID: <1B4ED994C8ACFE408B0280EFFA16D72F@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db7f12f6-1ce2-403f-e61a-08dc7e0ccce7
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2024 05:21:02.1612 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DYZNW69v2HY9mIYzGaTI7UkxtdqP14rLRSrExFZxFkvX2l3phSaJWNzieL8uaQdLSJIHAO3H/tSXjdYaBPn64rXo++1hp+U+jluIwzUAv7M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB8175
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.504900-8.000000
X-TMASE-MatchedRID: zGP2F0O7j/stqx4vLVZ3FvHkpkyUphL9BGvINcfHqhfagsZM0qVv12z0
 pZLT9L+6FkMxSMpxzKZSi65s7OsML2KztShDQzFu71Wx2uUbPLdBaSg4LJjta6+WgCcaviqGBu+
 llRlNm+rM/98aI0xgdTctfMeuvKJ1Wt4MDwm/5vOdVNZaI2n6/7/I3arxTrvitK3FOVf6EnuT+t
 thNdwYZ/JO+niX/IdWkZOl7WKIImrS77Co4bNJXWvfiVSqJzu3+gD2vYtOFhgqtq5d3cxkNU4fy
 Kv2e5cP283dbXC8Z1+HhZdQfrIX7j4rwmbH/YFoWdtnaJf/gM1udDmPrjnXGZMU5c/kOLn99Ry/
 d6Whm9FtCemdyrHS+VGmM9ck6rY9PVxlUTP3GoO7AlsRb/Q7WQoYlPnP/8T/FltYlf3C/iNDDKa
 3G4nrLQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.504900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: ED1A8C51185EB15D588924DC84933EFDDFE85DC37B49A62F3E1AC735675E65272000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_005_2015642566.91352753"
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

--__=_Part_Boundary_005_2015642566.91352753
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUm9iLA0KDQpbc25pcF0NCg0KPiBNeSBib3QgZm91bmQgZXJyb3JzIHJ1bm5pbmcgJ21ha2Ug
ZHRfYmluZGluZ19jaGVjaycgb24geW91ciBwYXRjaDoNCj4gDQo+IHlhbWxsaW50IHdhcm5pbmdz
L2Vycm9yczoNCj4gDQo+IGR0c2NoZW1hL2R0YyB3YXJuaW5ncy9lcnJvcnM6DQo+IC9idWlsZHMv
cm9iaGVycmluZy9kdC1yZXZpZXctDQo+IGNpL2xpbnV4L0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tYWlsYm94L21lZGlhdGVrLGdjZS0NCj4gbWFpbGJveC5leGFtcGxlLmR0Yjog
bWFpbGJveEAxMDIxMjAwMDogRmFsc2Ugc2NoZW1hIGRvZXMgbm90IGFsbG93DQo+IHsnY29tcGF0
aWJsZSc6IFsnbWVkaWF0ZWssbXQ4MTczLWdjZSddLCAncmVnJzogW1swLCAyNzA2MDYzMzYsIDAs
DQo+IDQwOTZdXSwgJ2ludGVycnVwdHMnOiBbWzAsIDEzNSwgOF1dLCAnI21ib3gtY2VsbHMnOiBb
WzJdXSwgJ2Nsb2Nrcyc6DQo+IFtbNDI5NDk2NzI5NSwgNF1dLCAnY2xvY2stbmFtZXMnOiBbJ2dj
ZSddLCAnJG5vZGVuYW1lJzogWw0KPiAnbWFpbGJveEAxMDIxMjAwMCddfQ0KPiBmcm9tIHNjaGVt
YSAkaWQ6IA0KPiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9tYWlsYm94L21lZGlhdGVr
LGdjZS1tYWlsYm94LnlhbWwjDQo+IA0KPiBkb2MgcmVmZXJlbmNlIGVycm9ycyAobWFrZSByZWZj
aGVja2RvY3MpOg0KPiANCg0KSSBoYXZlIHJ1biAnbWFrZSBkdF9iaW5kaW5nX2NoZWNrJyB3aXRo
IHRoaXMgc2VyaWVzIFsxXQ0KIkFkZCBtZWRpYXRlayxnY2UtcHJvcHMueWFtbCBmb3Igb3RoZXIg
YmluZGluZ3MgcmVmZXJlbmNlIg0KLSANCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJv
amVjdC9saW51eC1tZWRpYXRlay9saXN0Lz9zZXJpZXM9ODE5Mjk4DQppbiBteSBlbnZpcm9ubWVu
dCBhbmQgSSBkaWRuJ3Qgc2VlIHRoaXMgZXJyb3IuDQoNCj4gU2VlIA0KPiBodHRwczovL3BhdGNo
d29yay5vemxhYnMub3JnL3Byb2plY3QvZGV2aWNldHJlZS1iaW5kaW5ncy9wYXRjaC8yMDI0MDUy
NjE0NDQ0My4xNDM0NS0zLWphc29uLWpoLmxpbkBtZWRpYXRlay5jb20NCj4gDQo+IFRoZSBiYXNl
IGZvciB0aGUgc2VyaWVzIGlzIGdlbmVyYWxseSB0aGUgbGF0ZXN0IHJjMS4gQSBkaWZmZXJlbnQN
Cj4gZGVwZW5kZW5jeQ0KPiBzaG91bGQgYmUgbm90ZWQgaW4gKnRoaXMqIHBhdGNoLg0KPiANCg0K
RXZlbnQgdGhvdWdoIEkgc2VuZCB0aGUgcGF0Y2ggYmFzZWQgb24gdGhlIHNlcmllc1sxXSwgSSB0
aGluayB0aGUgcm9ib3QNCnN0aWxsIHdvbid0IGtub3cgd2hhdCBwYXRjaGVzIG5lZWQgdG8gYmUg
YmFzZWQuDQoNClNob3VsZCBJIG5lZWQgdG8gYWRkICJzb21lIG5vdGUiIGFuZCByZS1zdWJtaXQg
cGF0Y2ggdG8gbWFrZSB0aGUgcm9ib3QNCndvbid0IGdldCB0aGlzIGVycm9yPw0KDQpSZWdhcmRz
LA0KSmFzb24tSkguTGluDQoNCg==

--__=_Part_Boundary_005_2015642566.91352753
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGkmIzMyO1JvYiwNCg0KW3NuaXBdDQoNCiZndDsmIzMy
O015JiMzMjtib3QmIzMyO2ZvdW5kJiMzMjtlcnJvcnMmIzMyO3J1bm5pbmcmIzMyOyYjMzk7bWFr
ZSYjMzI7ZHRfYmluZGluZ19jaGVjayYjMzk7JiMzMjtvbiYjMzI7eW91ciYjMzI7cGF0Y2g6DQom
Z3Q7JiMzMjsNCiZndDsmIzMyO3lhbWxsaW50JiMzMjt3YXJuaW5ncy9lcnJvcnM6DQomZ3Q7JiMz
MjsNCiZndDsmIzMyO2R0c2NoZW1hL2R0YyYjMzI7d2FybmluZ3MvZXJyb3JzOg0KJmd0OyYjMzI7
L2J1aWxkcy9yb2JoZXJyaW5nL2R0LXJldmlldy0NCiZndDsmIzMyO2NpL2xpbnV4L0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tYWlsYm94L21lZGlhdGVrLGdjZS0NCiZndDsmIzMy
O21haWxib3guZXhhbXBsZS5kdGI6JiMzMjttYWlsYm94QDEwMjEyMDAwOiYjMzI7RmFsc2UmIzMy
O3NjaGVtYSYjMzI7ZG9lcyYjMzI7bm90JiMzMjthbGxvdw0KJmd0OyYjMzI7eyYjMzk7Y29tcGF0
aWJsZSYjMzk7OiYjMzI7WyYjMzk7bWVkaWF0ZWssbXQ4MTczLWdjZSYjMzk7XSwmIzMyOyYjMzk7
cmVnJiMzOTs6JiMzMjtbWzAsJiMzMjsyNzA2MDYzMzYsJiMzMjswLA0KJmd0OyYjMzI7NDA5Nl1d
LCYjMzI7JiMzOTtpbnRlcnJ1cHRzJiMzOTs6JiMzMjtbWzAsJiMzMjsxMzUsJiMzMjs4XV0sJiMz
MjsmIzM5OyNtYm94LWNlbGxzJiMzOTs6JiMzMjtbWzJdXSwmIzMyOyYjMzk7Y2xvY2tzJiMzOTs6
DQomZ3Q7JiMzMjtbWzQyOTQ5NjcyOTUsJiMzMjs0XV0sJiMzMjsmIzM5O2Nsb2NrLW5hbWVzJiMz
OTs6JiMzMjtbJiMzOTtnY2UmIzM5O10sJiMzMjsmIzM5OyYjMzY7bm9kZW5hbWUmIzM5OzomIzMy
O1sNCiZndDsmIzMyOyYjMzk7bWFpbGJveEAxMDIxMjAwMCYjMzk7XX0NCiZndDsmIzMyO2Zyb20m
IzMyO3NjaGVtYSYjMzI7JiMzNjtpZDomIzMyOw0KJmd0OyYjMzI7aHR0cDovL2RldmljZXRyZWUu
b3JnL3NjaGVtYXMvbWFpbGJveC9tZWRpYXRlayxnY2UtbWFpbGJveC55YW1sIw0KJmd0OyYjMzI7
DQomZ3Q7JiMzMjtkb2MmIzMyO3JlZmVyZW5jZSYjMzI7ZXJyb3JzJiMzMjsobWFrZSYjMzI7cmVm
Y2hlY2tkb2NzKToNCiZndDsmIzMyOw0KDQpJJiMzMjtoYXZlJiMzMjtydW4mIzMyOyYjMzk7bWFr
ZSYjMzI7ZHRfYmluZGluZ19jaGVjayYjMzk7JiMzMjt3aXRoJiMzMjt0aGlzJiMzMjtzZXJpZXMm
IzMyO1sxXQ0KJnF1b3Q7QWRkJiMzMjttZWRpYXRlayxnY2UtcHJvcHMueWFtbCYjMzI7Zm9yJiMz
MjtvdGhlciYjMzI7YmluZGluZ3MmIzMyO3JlZmVyZW5jZSZxdW90Ow0KLSYjMzI7DQpodHRwczov
L3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtbWVkaWF0ZWsvbGlzdC8mIzYzO3Nl
cmllcz04MTkyOTgNCmluJiMzMjtteSYjMzI7ZW52aXJvbm1lbnQmIzMyO2FuZCYjMzI7SSYjMzI7
ZGlkbiYjMzk7dCYjMzI7c2VlJiMzMjt0aGlzJiMzMjtlcnJvci4NCg0KJmd0OyYjMzI7U2VlJiMz
MjsNCiZndDsmIzMyO2h0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9kZXZpY2V0
cmVlLWJpbmRpbmdzL3BhdGNoLzIwMjQwNTI2MTQ0NDQzLjE0MzQ1LTMtamFzb24tamgubGluQG1l
ZGlhdGVrLmNvbQ0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtUaGUmIzMyO2Jhc2UmIzMyO2ZvciYjMzI7
dGhlJiMzMjtzZXJpZXMmIzMyO2lzJiMzMjtnZW5lcmFsbHkmIzMyO3RoZSYjMzI7bGF0ZXN0JiMz
MjtyYzEuJiMzMjtBJiMzMjtkaWZmZXJlbnQNCiZndDsmIzMyO2RlcGVuZGVuY3kNCiZndDsmIzMy
O3Nob3VsZCYjMzI7YmUmIzMyO25vdGVkJiMzMjtpbiYjMzI7KnRoaXMqJiMzMjtwYXRjaC4NCiZn
dDsmIzMyOw0KDQpFdmVudCYjMzI7dGhvdWdoJiMzMjtJJiMzMjtzZW5kJiMzMjt0aGUmIzMyO3Bh
dGNoJiMzMjtiYXNlZCYjMzI7b24mIzMyO3RoZSYjMzI7c2VyaWVzWzFdLCYjMzI7SSYjMzI7dGhp
bmsmIzMyO3RoZSYjMzI7cm9ib3QNCnN0aWxsJiMzMjt3b24mIzM5O3QmIzMyO2tub3cmIzMyO3do
YXQmIzMyO3BhdGNoZXMmIzMyO25lZWQmIzMyO3RvJiMzMjtiZSYjMzI7YmFzZWQuDQoNClNob3Vs
ZCYjMzI7SSYjMzI7bmVlZCYjMzI7dG8mIzMyO2FkZCYjMzI7JnF1b3Q7c29tZSYjMzI7bm90ZSZx
dW90OyYjMzI7YW5kJiMzMjtyZS1zdWJtaXQmIzMyO3BhdGNoJiMzMjt0byYjMzI7bWFrZSYjMzI7
dGhlJiMzMjtyb2JvdA0Kd29uJiMzOTt0JiMzMjtnZXQmIzMyO3RoaXMmIzMyO2Vycm9yJiM2MzsN
Cg0KUmVnYXJkcywNCkphc29uLUpILkxpbg0KDQoNCjwvcHJlPg0KPC9wPjwvYm9keT48L2h0bWw+
PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVLIENvbmZp
ZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioqKioqKioqKioNClRoZSBpbmZvcm1hdGlvbiBj
b250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0dGFjaG1l
bnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3Ro
ZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQg
aXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lw
aWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHByaW50aW5n
LCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0
dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJp
dGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVj
aXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZl
ZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRp
YXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNv
cGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlv
dXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFp
bCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_005_2015642566.91352753--

