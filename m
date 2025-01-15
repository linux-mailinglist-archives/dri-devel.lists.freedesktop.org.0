Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99674A11D42
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 10:19:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F336B10E22E;
	Wed, 15 Jan 2025 09:19:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="gmQPhN9d";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="bdI6bD+c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1AF310E22E
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 09:19:05 +0000 (UTC)
X-UUID: c07a1e0cd32111ef99858b75a2457dd9-20250115
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=WPKbJnnJ8J2XOrLPsXShKQN2Fjz3OCC5UJI++nuRV0s=; 
 b=gmQPhN9dn5mFw2yyYaGfCUnpQFdWMfhNIGN8yKACxGGNg6i+CtlNbn6P+K25c+xbAUReV45zuuBakydclAaspK87FF6XglFPWE4tW7T0tfeXtKGYOJeIMUYb+5UfcGb+v9VRllzgvjZM7bGHrUsq78cbh/w+8HdqifokoUOa5EY=;
X-CID-CACHE: Type:Local,Time:202501151718+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46, REQID:f267ec46-4fab-42f9-8447-76761fe1e458, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:60aa074, CLOUDID:2970eb37-e11c-4c1a-89f7-e7a032832c40,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
 EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
 A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: c07a1e0cd32111ef99858b75a2457dd9-20250115
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by
 mailgw01.mediatek.com (envelope-from <paul-pl.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1058782723; Wed, 15 Jan 2025 17:18:58 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Wed, 15 Jan 2025 17:18:50 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1258.28 via Frontend Transport; Wed, 15 Jan 2025 17:18:50 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iAE/QQb1iNqkYMqSGp7S4Ky3gNSaKrJu2HhXCgz6sLbLqEvuSkQHiAl5YAdoiuOasN858cW6TPniz+zIZT78rj/I5+SQy4qFM/iWhXWyGxzvW1iiYMJdjBlcyIexzjpoBkkrZhklCrmdfkTzmBpLKU1C7sUcHrinTldrU+ALSbKEWIqozzjOOhKVwgP3iSj14PUtzlM9tc23cWVfhdl471Ty6aiucUgOpGEcThzcc3DdNGGInFg1Jcjhzo4fS2xxDSXigLnhiVgsYGNflnkkpk0fAxmotE+Po6W+fGRFea8orsvvlMKWxXM4Lo8zBq7+z2DxNfZFxSCAwFERkAd4/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FpzvO4xHxoRvi0PLroprK4TOTtKILg4w5ddITxxr8XQ=;
 b=kt2ALyD2emZGh5n6MxzMvth7X12b5vSxH2eHpa2rXUnYw9iJuPSZb1jDHzQGM0VYbDwf4Luuyv21AAeq2DY4EmgL/1WUbNjpxnZbnXbjZygp5fsieTrUxadGv0hNSX0PXYhLDlTYw/FBACn9x/5IREj4HVOrnnAZ6B0TPGKVGEsSaAdibjHPez0FbtDyvDA6x4+C1ttvzk972vU8dcCRziPd1dFvwGBbk6Ug6zCdGk/Apa5cMu2e63rQkD1hwIt+4GP9VLm4Eji4oJmZV8rPN6zAcIhK+K1W0aLcjUFQLL6JtrTq425QBldW/ioPcONNBZhDOj6GFQDt9baxJTlDUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FpzvO4xHxoRvi0PLroprK4TOTtKILg4w5ddITxxr8XQ=;
 b=bdI6bD+cANpIusVMO046HP26tT3gzlS+XVLVzXja6SEo/KeSlC5eAKcEgJUnNK/jS2kSFcDd5hRwn18eFVltTM5XYJIeZeAKvApAoR/rD/UFLVTSpACfvqtxJUCzunYtir3sa1c+fdY6DyQbYdHhkS8xum56NauEd+jyY0gLxLs=
Received: from SG2PR03MB6636.apcprd03.prod.outlook.com (2603:1096:4:1b8::6) by
 SEZPR03MB7566.apcprd03.prod.outlook.com (2603:1096:101:128::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Wed, 15 Jan
 2025 09:18:48 +0000
Received: from SG2PR03MB6636.apcprd03.prod.outlook.com
 ([fe80::98e8:d61:f404:4052]) by SG2PR03MB6636.apcprd03.prod.outlook.com
 ([fe80::98e8:d61:f404:4052%3]) with mapi id 15.20.8335.017; Wed, 15 Jan 2025
 09:18:48 +0000
From: =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>, "krzk@kernel.org"
 <krzk@kernel.org>
CC: =?utf-8?B?U3VubnkgU2hlbiAo5rKI5aeN5aeNKQ==?= <Sunny.Shen@mediatek.com>,
 =?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
 <Xiandong.Wang@mediatek.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "fshao@chromium.org" <fshao@chromium.org>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?=
 <Singo.Chang@mediatek.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "treapking@chromium.org" <treapking@chromium.org>
Subject: Re: [PATCH 01/12] dt-bindings: arm: mediatek: mmsys: add compatible
 for MT8196
Thread-Topic: [PATCH 01/12] dt-bindings: arm: mediatek: mmsys: add compatible
 for MT8196
Thread-Index: AQHbY1ypDak9hJtP/kaQh8F1QgfJxbMP9+cAgAeeVYA=
Date: Wed, 15 Jan 2025 09:18:48 +0000
Message-ID: <ba4b88facb1e87e42adf3876a1ba403a4025056b.camel@mediatek.com>
References: <20250110123835.2719824-1-paul-pl.chen@mediatek.com>
 <20250110123835.2719824-2-paul-pl.chen@mediatek.com>
 <0499ee04-0fcc-42e1-aab8-3cb8daa88c88@kernel.org>
In-Reply-To: <0499ee04-0fcc-42e1-aab8-3cb8daa88c88@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR03MB6636:EE_|SEZPR03MB7566:EE_
x-ms-office365-filtering-correlation-id: 08c8e174-b780-4ee7-89f9-08dd35459e68
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?OXZMd2d4RFY2Tk9CMHE2TkFveTVTNlNxbzVzVllFcThoaDdURm1KakljOU9E?=
 =?utf-8?B?d1dxYXZ6NGlzVEJJb044NnFaRXFKdEpFSEhSVFNLRG01TEFzSEwvR0RvL0JN?=
 =?utf-8?B?eHF4N3Y0dVFrY0QvUW51cklCeStZNUJTZmkvVCs5azNGUHZyZzcwcUtYRGJn?=
 =?utf-8?B?UGwxSkZLdlBnak84QzVMQVJKeXU3R1NtRWNJUjQ2ZC9CSFlXcFVOQmtrRDVu?=
 =?utf-8?B?VW84aEphQ0ZjdjdEbTdnaENqUE56MUx6RVh1TlRUZTZwcTdLSnJuQzMzbzcy?=
 =?utf-8?B?RG05S29qVTBldXhLaGlNQVpZTjE3VXh0OFJDME5VTEJldnJYclhuS2w2aEVG?=
 =?utf-8?B?aUpyZzkrenBYdEhVb1NyU3c4NXg5aS84TDVlR2VGcWVEZnJCOWtnZmpCNjIr?=
 =?utf-8?B?WWQ5eUFGNjFPRkVmSjVQM05IejNwRzRDSFkxdUtKa2RuSFlranhSTGNBVitq?=
 =?utf-8?B?UStFM0MzZ1UyR3dDUzFMamxEbFRyMGNBRUE5eGtMeVJvdHRmNWNqeCszTy92?=
 =?utf-8?B?VWJmb3FjWkk4YlpkVkkxQlFlaUxHWDMwV25ERjQ2d2JIZWlaMzVmK1R6NENl?=
 =?utf-8?B?emszalM4Um4xMXhCN29rbWdYbjVXWSsrTjR2UklsMDBsRk40UzFCdnFnYjB6?=
 =?utf-8?B?dGc3dkk1bHhldS9EdjZKdG1Fc1VwbDZ6eU9CNTZ4azlSSXpyQzhreXRBVHlV?=
 =?utf-8?B?bklBaUZucjdZSGZ5OE16emVEbXZxUjExUXA4clJPWHFJNTF4Vms1b3pHWkR4?=
 =?utf-8?B?bkRWUGhXUXNYYTFJRVg4a01yNENSNnZ2VkE5SjhCb0tjSEJ0YzhOL2d0ZmU0?=
 =?utf-8?B?cmhTejJiREJrRVlVekZzcm1OQmlwTUtSMUZzbnNpRlg2eVZNRVgrZjF5R3hR?=
 =?utf-8?B?NmswRE5ZVHVHTDRmZzkrVU9kVE5OUTJobEdiQW1UWGt6eFcrN0dhdU5lZDNr?=
 =?utf-8?B?QkViRFV1OFVjcDJrbjFjSnFJOEVLcElrM3puT05YdExPUHRJZGYvNlcreHNi?=
 =?utf-8?B?WDBrOFB1a1FTWHRxOVFVYitwNE5HdFZHekVIOUREcjB3VlRaOHRtSEw3RGxv?=
 =?utf-8?B?QmpyLzZjN25ydjlNRm55QTJSY2YyWnBTTTJmc0p0UHRTTm9vSkIra3h0YThl?=
 =?utf-8?B?dkdlU3B0d2VhNUZyQ3g3VkJ5MDdidDZ3STFNRVZxQlNsVERVVnlVZUpkbitN?=
 =?utf-8?B?VDRPbnljaUQvMlFTSG1vTnd4VnZ5UFJBOVBDTEZEbXBGT1dBT3gxU0lVeExo?=
 =?utf-8?B?b0JYTlZYL1VCVTNsbml5aUNraWdiZjNNanBQMzNManhNMlZvTDVtZ25rblMw?=
 =?utf-8?B?K015VnJMb2ZPdllNT00xVWZBUytacGl3WVRGSVh3OEZZR3NNREFSYkNUTFFH?=
 =?utf-8?B?a1RzTEc5UHNVcFRxcEJlNHo5SXB2SU03cU9EQjBrY0xKZmRjd2NrcjYwY2hR?=
 =?utf-8?B?RXhhMlZMWHV4YnBxYmg0SnFhVGh4WnZKRG05ZVgwRDVUTW5BMGVZL3lQWGZO?=
 =?utf-8?B?aUlWU2h4TmdGVWRaNUFzb2NPeVNTVUlJSUdDVWJtSi9HU09OckRyaGtuUWtU?=
 =?utf-8?B?aFh3QnRndHFWYUdFUWFnYmNxZ0V1RGNEWDFYb1lTdHFSOXo0dHNQUFd3cEFL?=
 =?utf-8?B?dEpVS2lGMHFScUY2RTRKSWVDZ1NucG9mTVJQOEtPaHIrTFpBMHBzYVpYcTRa?=
 =?utf-8?B?YlJxdlRWaDNSVmdvSjhWWFZBbERaQ0hpL00vQ1lkSEprdXo1WTBUV2RYYjNN?=
 =?utf-8?B?MHFiZXRTQTZOMzlqS2VyVGtiditHM250Y1g4dGluVXBLbHFGUnNOM3czb0g3?=
 =?utf-8?B?UFhlSE1MelU3MTQ2THdiSjRjWkNZRjd2S09BTTVjNVVEVnBkeU50b01QNEN4?=
 =?utf-8?B?aVlvcFpxSHJrWHdjZlp0QkJsWXlsa2lvQ3kzb3BlSXZhS3J3WUJRaDFqaDlB?=
 =?utf-8?Q?CLDMRA0Ma1+5mCdtSAYisW0340a6x1X8?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR03MB6636.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cGxyK3J1dGdwTmpHSktNanpjSjMrV3cyWXNPcC91RTlPQ1BPK1ZQTHFBaEJX?=
 =?utf-8?B?Tm1sTXZMUU5vQ2lMV3hDb0c1M25KZmNjRDA1Nkk5Ly9HeWR0M2RKTnUyZU5O?=
 =?utf-8?B?SXE0bWYxdkxQVVMwZFYrQm1KUjNzWThMRFFxcERzNGNuWXBES2VOODFiNUtF?=
 =?utf-8?B?TENFMVRwWHFVNzRTNHRKNDV6anU2OTVjS2E2TGg0dTFtS1VQblRMUjl0eUFa?=
 =?utf-8?B?ZzNmL3NDRzZKT05GV2lrRGNVVlVWbXFJc1J2QWNuYUdMeCt1LzI2Y012Q0tZ?=
 =?utf-8?B?RTh4eWpvRlgyZzRRcER5eThiZ0hFYndqTDRxYWJYWlhEQlZ4OHZTZnBWTVR0?=
 =?utf-8?B?YkJSM2lBL2xkdkFEVEVtUlcwaFIyeFhlbmZ3S04rV2xZaUh4bHJFKzA0dFM1?=
 =?utf-8?B?TVROSUQySVdncnVrZXBzQW5pV3VDb2FpMWR1QzlLM2kxU2cwd0dPZ1l4Rzg1?=
 =?utf-8?B?VVkxb2ptTGxtSGpId1VlSGJwTnVNOEdFUzVscWx1QUZxb2Y2WlFjbXdzdTRF?=
 =?utf-8?B?V3I4cjZ3c01NZjNseWJRZUFmcnpxMlByTmIrTnA2QmdqY2NTbkFDOExFMzJB?=
 =?utf-8?B?U3cvVUpzcVVKQ1AvREZoWmRGNG5WVlF3OGk5bHZ6T0dueXdUT2JzRHJ0S21w?=
 =?utf-8?B?T1Q4Rkx5d1ZGVXZNN0loek8wTzhzMFBMK3I1aUM5MUlRRzVwRnRRSFF3TGFt?=
 =?utf-8?B?RW5DSnFkSWVKWmhXZjZ0Z2dJVkQ1TkVjSlVZU2F5ODNRQWEvWFoyT3F4ZnJZ?=
 =?utf-8?B?K3l6eXYyTkY1NUM0SDFPeVhEZFFyK25oMzRNampwTGpLdTNGcnVnVGtCcW5y?=
 =?utf-8?B?VDlBMmpGV1FOY1VVd1ZEU0ZUbXBPbmpVbzk3djhoKzM0ZEFoTm1zcHBsVU5Q?=
 =?utf-8?B?NDdlWTYxRjk5UVVHemJXNkRHT2xOZEp4L1F0M1lrendhcERzenowR1h5dXdS?=
 =?utf-8?B?RVpFeDdVWTc3YUJFZWdSQURMb3VGRDhVSldoSm9tZzcrcGdwRnFSSE1NaW9Z?=
 =?utf-8?B?bnJkeWoxS2VhUkpyYmE4elY0aHNieGppejErdnZJYmhTM2RGZ2lqZ0ZsQXZt?=
 =?utf-8?B?N0pWL0Vqb2FvS01aRjY5cHozRzlVeVVmUDRSdXNwWFllbUk1RjhFU215dzgw?=
 =?utf-8?B?UEF3NVpaRzlSbk4xR2JyVG5rYm5IK1h6TkNTLzdpaVZ5N3lEamtsaVlXbHUr?=
 =?utf-8?B?RGZza1Q5dHdaN0FtVWNoN3I1MVBIMFJMdGQ2bURSaS91MHoxa3pIeHRqSU92?=
 =?utf-8?B?UWJiZ09iVlVpdGJtOE9JdGdDR21GVGV2YVNvOGkwbXg1dUFUYmhwbmdWa0Nt?=
 =?utf-8?B?WjNpOGxzL1NTUXF6dVA1amVSWk9FOFY1NU53S0tpaWFNZ3IwcXhmcis5eFFy?=
 =?utf-8?B?WjNUZ2pySFlrY1JSR0JLQ1E3YzVsbmNOOEQ1eEFvSytKSVI5M3phYmkwdytu?=
 =?utf-8?B?ZXJ1aGZGc2NDNzAzUWZ2UEJKK01FTEdrT0R1TW5jWjJ0ZW1ZMEVlMGF6N2FG?=
 =?utf-8?B?RFVyc2pGa05JTmVlRi9mYWJSb3R4OCtOOXdpSTQ3ajRDUCsvbUs1TjlGMWFs?=
 =?utf-8?B?cEJ6L2JXMnlYQW5xMHNrNzI5MFFvbVhIVm9CdHpIR1pMTzBnYkpaa0Q5cFNS?=
 =?utf-8?B?b2Z6ay9iK1FmdVN6MEhOVExld1Vncjc1bjJzWlJsQnE5aktjdjlDQ3h0aE9K?=
 =?utf-8?B?bEFVbnQyektwajRCbDRIWmVQRVh5RVl4d2p5TmdZMFduNVB4OVhvT01sL2Fa?=
 =?utf-8?B?TmNRRWlGbU15bHVlNDJuWmhaOCt1aE1lVWxpayt2SVVYK2toMndIdmJvdit1?=
 =?utf-8?B?M1k1V0NSYkxxUTQyQXN6cElzK3lGaXpxbVlxSWNjK2tqRmlsQ2RFbFlNUFc1?=
 =?utf-8?B?VXVlT2FlK0lKU2JDUE9VUkc2V1lmM2h0L213VGNyRVZET3JaZlFBdFBhRXJx?=
 =?utf-8?B?SXRyS2RqK0VLYlBVVFlKb1ZQeUVzVndnVnlGV0g2Q1AzbmZBa2Vrb2U4anBs?=
 =?utf-8?B?aWpSMlo4UGI5bG1kQkMwQ0lJRkZ5Z3RBYTlWTS9IUEl3NEJ6OGRSVkp5KzI0?=
 =?utf-8?B?NEhQU203UzFGTlhEU0VHZXl3TDI2MDlrWjJ6NW40bmdXVk92SDhjb3M4bnhj?=
 =?utf-8?B?eTJLRVpPYW5kc09tSTFUODFDT29GOFdnTkFlTWtFenlJUmZBNEJ3cmVmY3Yz?=
 =?utf-8?B?NkE9PQ==?=
Content-ID: <A0CF21C748DC3D469ED7DB59DB14F8CE@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB6636.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08c8e174-b780-4ee7-89f9-08dd35459e68
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2025 09:18:48.2778 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xtKljDlgelBQAURIgxTq9szsoj8LRNFxCLFONXaWaB5hSsTQo87YD5Yu7O5e4fcabXFWwBIHDkr4l06ezf1+/VhxmXayeVqjyEOtyhoaQ2U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7566
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_007_936984928.671041540"
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

--__=_Part_Boundary_007_936984928.671041540
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpLCAyMDI1LTAxLTEwIGF0IDEzOjU4ICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9y
IG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBv
ciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBPbiAxMC8wMS8yMDI1IDEzOjMzLCBwYXVsLXBsLmNo
ZW4gd3JvdGU6DQo+ID4gRnJvbTogIlBhdWwtcGwuQ2hlbiIgPHBhdWwtcGwuY2hlbkBtZWRpYXRl
ay5jb20+DQo+ID4gDQo+ID4gQWRkIGNvbXBhdGlibGUgZm9yIG1tc3lzIHlhbWwgb2YgTVQ4MTk2
DQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogUGF1bC1wbC5DaGVuIDxwYXVsLXBsLmNoZW5AbWVk
aWF0ZWsuY29tPg0KPiANCj4gDQo+IFRoaXMgaXMgYSB3aWRlIHBhdHRlcm4gbm93IGluIE1lZGlh
dGVrOiBsb2dpbiBuYW1lIGlzIHVzZWQgYXMgZmFtaWx5DQo+IG5hbWUuIFJlcGVhdGluZyB0aGUg
c2FtZSBjb21tZW50IHRvIGV2ZXJ5IE1lZGlhdGVrIGVtcGxveWVlIGlzIGEgYml0DQo+IHRlZGlv
dXMsIHNvIG1heWJlIHlvdSBjb3VsZCBmaXggaXQgaW50ZXJuYWxseT8NCj4gDQo+IENyZWF0ZSBz
b21lIGd1aWRlbGluZSBmb3IgeW91ciBjb2xsZWFndWVzIHNvIHlvdSB3b24ndCByZXBlYXQgdGhl
DQo+IHNhbWUNCj4gdGhpbmdzIG92ZXIgYW5kIG92ZXI/DQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+
IEtyenlzenRvZg0KDQpIaSwgS3J6eXN6dG9mDQoNClRoYW5rIHlvdSBmb3IgYnJpbmdpbmcgdGhp
cyB0byBvdXIgYXR0ZW50aW9uLiBXZSBoYXZlIGFscmVhZHkgYWRkcmVzc2VkDQp0aGlzIGlzc3Vl
IGludGVybmFsbHkgYW5kIGhhdmUgbWFkZSB0aGUgbmVjZXNzYXJ5IGNvcnJlY3Rpb25zLg0KTWVk
aWF0ZWsgaGFzIGFsc28gY29uZHVjdGVkIHNwZWNpYWwgaW50ZXJuYWwgYXdhcmVuZXNzIGNhbXBh
aWducw0KcmVnYXJkaW5nIHRoaXMgbWF0dGVyLg0KV2UgYXJlIGdvaW5nIHRvIGVzdGFibGlzaCBn
dWlkZWxpbmVzIHRvIGVuc3VyZSB0aGF0IG91ciBjb2xsZWFndWVzIGRvDQpub3QgcmVwZWF0IHRo
ZSBzYW1lIG1pc3Rha2VzLg0KIA0KVGhhbmsgeW91IGZvciB5b3VyIHVuZGVyc3RhbmRpbmcgYW5k
IGNvb3BlcmF0aW9uLg0KDQpCZXN0IHJlZ2FyZHMsDQpQYXVsDQo=

--__=_Part_Boundary_007_936984928.671041540
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO0ZyaSwmIzMyOzIwMjUtMDEtMTAmIzMyO2F0
JiMzMjsxMzo1OCYjMzI7KzAxMDAsJiMzMjtLcnp5c3p0b2YmIzMyO0tvemxvd3NraSYjMzI7d3Jv
dGU6DQomZ3Q7JiMzMjsNCiZndDsmIzMyO0V4dGVybmFsJiMzMjtlbWFpbCYjMzI7OiYjMzI7UGxl
YXNlJiMzMjtkbyYjMzI7bm90JiMzMjtjbGljayYjMzI7bGlua3MmIzMyO29yJiMzMjtvcGVuJiMz
MjthdHRhY2htZW50cyYjMzI7dW50aWwNCiZndDsmIzMyO3lvdSYjMzI7aGF2ZSYjMzI7dmVyaWZp
ZWQmIzMyO3RoZSYjMzI7c2VuZGVyJiMzMjtvciYjMzI7dGhlJiMzMjtjb250ZW50Lg0KJmd0OyYj
MzI7DQomZ3Q7JiMzMjsNCiZndDsmIzMyO09uJiMzMjsxMC8wMS8yMDI1JiMzMjsxMzozMywmIzMy
O3BhdWwtcGwuY2hlbiYjMzI7d3JvdGU6DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtGcm9tOiYjMzI7JnF1
b3Q7UGF1bC1wbC5DaGVuJnF1b3Q7JiMzMjsmbHQ7cGF1bC1wbC5jaGVuQG1lZGlhdGVrLmNvbSZn
dDsNCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7QWRkJiMzMjtjb21wYXRp
YmxlJiMzMjtmb3ImIzMyO21tc3lzJiMzMjt5YW1sJiMzMjtvZiYjMzI7TVQ4MTk2DQomZ3Q7JiMz
MjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtQYXVsLXBs
LkNoZW4mIzMyOyZsdDtwYXVsLXBsLmNoZW5AbWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYjMzI7DQom
Z3Q7JiMzMjsNCiZndDsmIzMyO1RoaXMmIzMyO2lzJiMzMjthJiMzMjt3aWRlJiMzMjtwYXR0ZXJu
JiMzMjtub3cmIzMyO2luJiMzMjtNZWRpYXRlazomIzMyO2xvZ2luJiMzMjtuYW1lJiMzMjtpcyYj
MzI7dXNlZCYjMzI7YXMmIzMyO2ZhbWlseQ0KJmd0OyYjMzI7bmFtZS4mIzMyO1JlcGVhdGluZyYj
MzI7dGhlJiMzMjtzYW1lJiMzMjtjb21tZW50JiMzMjt0byYjMzI7ZXZlcnkmIzMyO01lZGlhdGVr
JiMzMjtlbXBsb3llZSYjMzI7aXMmIzMyO2EmIzMyO2JpdA0KJmd0OyYjMzI7dGVkaW91cywmIzMy
O3NvJiMzMjttYXliZSYjMzI7eW91JiMzMjtjb3VsZCYjMzI7Zml4JiMzMjtpdCYjMzI7aW50ZXJu
YWxseSYjNjM7DQomZ3Q7JiMzMjsNCiZndDsmIzMyO0NyZWF0ZSYjMzI7c29tZSYjMzI7Z3VpZGVs
aW5lJiMzMjtmb3ImIzMyO3lvdXImIzMyO2NvbGxlYWd1ZXMmIzMyO3NvJiMzMjt5b3UmIzMyO3dv
biYjMzk7dCYjMzI7cmVwZWF0JiMzMjt0aGUNCiZndDsmIzMyO3NhbWUNCiZndDsmIzMyO3RoaW5n
cyYjMzI7b3ZlciYjMzI7YW5kJiMzMjtvdmVyJiM2MzsNCiZndDsmIzMyOw0KJmd0OyYjMzI7QmVz
dCYjMzI7cmVnYXJkcywNCiZndDsmIzMyO0tyenlzenRvZg0KDQpIaSwmIzMyO0tyenlzenRvZg0K
DQpUaGFuayYjMzI7eW91JiMzMjtmb3ImIzMyO2JyaW5naW5nJiMzMjt0aGlzJiMzMjt0byYjMzI7
b3VyJiMzMjthdHRlbnRpb24uJiMzMjtXZSYjMzI7aGF2ZSYjMzI7YWxyZWFkeSYjMzI7YWRkcmVz
c2VkDQp0aGlzJiMzMjtpc3N1ZSYjMzI7aW50ZXJuYWxseSYjMzI7YW5kJiMzMjtoYXZlJiMzMjtt
YWRlJiMzMjt0aGUmIzMyO25lY2Vzc2FyeSYjMzI7Y29ycmVjdGlvbnMuDQpNZWRpYXRlayYjMzI7
aGFzJiMzMjthbHNvJiMzMjtjb25kdWN0ZWQmIzMyO3NwZWNpYWwmIzMyO2ludGVybmFsJiMzMjth
d2FyZW5lc3MmIzMyO2NhbXBhaWducw0KcmVnYXJkaW5nJiMzMjt0aGlzJiMzMjttYXR0ZXIuDQpX
ZSYjMzI7YXJlJiMzMjtnb2luZyYjMzI7dG8mIzMyO2VzdGFibGlzaCYjMzI7Z3VpZGVsaW5lcyYj
MzI7dG8mIzMyO2Vuc3VyZSYjMzI7dGhhdCYjMzI7b3VyJiMzMjtjb2xsZWFndWVzJiMzMjtkbw0K
bm90JiMzMjtyZXBlYXQmIzMyO3RoZSYjMzI7c2FtZSYjMzI7bWlzdGFrZXMuDQomIzMyOw0KVGhh
bmsmIzMyO3lvdSYjMzI7Zm9yJiMzMjt5b3VyJiMzMjt1bmRlcnN0YW5kaW5nJiMzMjthbmQmIzMy
O2Nvb3BlcmF0aW9uLg0KDQpCZXN0JiMzMjtyZWdhcmRzLA0KUGF1bA0KDQo8L3ByZT4NCjwvcD48
L2JvZHk+PC9odG1sPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxwcmU+KioqKioqKioqKioqKiBN
RURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlDQogKioqKioqKioqKioqKioqKioqKioNClRo
ZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5n
IGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJp
dmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxp
Y2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRoZSBk
ZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmli
dXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5j
bHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBz
dHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3Qg
YW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlDQogDQp0aGF0
IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRo
ZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxl
dGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0
YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBjb250
ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSENCjwvcHJl
PjwhLS19LS0+

--__=_Part_Boundary_007_936984928.671041540--

