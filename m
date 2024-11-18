Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E1B9D0ABD
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 09:20:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BC4810E43D;
	Mon, 18 Nov 2024 08:20:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="ZnlIpSD9";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="mwCGmwhU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A690110E43D
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 08:20:21 +0000 (UTC)
X-UUID: f1b97270a58511ef99858b75a2457dd9-20241118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=3rN9QWY0nQM/cEZSPDMRcSgLw7mTb79cJLz/N0ESG8M=; 
 b=ZnlIpSD9Dkq8AmhPUEtynr45xs8VlCcVfYFIrHXo8wfSUCi3K9z7DJPQD7xa3E/OtZwp7HCk51xU0pBSG8leLuVDVP6n9ndrrm9Zf33Yxb6/qroxJRT62c+dxAO+ZsSTqgw0iEsYeDVVLoUl8JwuO1fBa/4c/ZZEZ4gAI3TFAPg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44, REQID:5faecc26-c7a3-4450-9d28-6a5f070eb9ed, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:464815b, CLOUDID:dfb8394f-a2ae-4b53-acd4-c3dc8f449198,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
 :-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
 ,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f1b97270a58511ef99858b75a2457dd9-20241118
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 67347655; Mon, 18 Nov 2024 16:20:17 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 18 Nov 2024 16:20:16 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Mon, 18 Nov 2024 16:20:16 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=meG9f1lkEvLwprFJGkKkC3HAs27ocn5dPhfuOyhXtAJb4tSFFEwxj4fuRKR7xcnKBekBtQOP9HlKRAY7/zLHIZe0CuzUSU/7xaBvTqmC9DPUlE+12CxeuVBroh9B6UAtfn0qlwOFTOT8MoGa8Yl/GPYOs60eNTTvcEMfiRttLqTGPl7YMQqvbQYxaC0fIJAkJQrKxJlD8OA+b+pa3rcGgs+rO/mO9cMg1CXKmA+haT68W74+h2IS4nVWDAde2P8Ehzo0vYvDMNEuG06XN6V0Yu0EAQY0yeW1fTX7oaV2x7cfwuHS8GuA9BcEqLrsDaapDt2YqrwAHxRZA4Mfky/SCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JVVZ2tp0xeGuDrwzdTq5svrCAoUCFbOfp2Wdun884X4=;
 b=pgUqgDwJxk6WH0gsv1DGL4UGkYAkHafTrE0gRymwhj1YL5JLF81t1qZHBO1vHmamgv0alu+fmjRiepTEzf+7bo4y93lkgUnde2iBDnrnXD+zZuVYcLiD1b//1tFkHYtzFBSVDp2D0j3KbF3L5jwEKeXFE8Dwjd+EBXv8XzDwYMqCD+eZ/hAJIe3QDOQ2gbPy87G55ho2K4JgPWMyffwPXW/2civbXMF4kkUGS//u8Ii30RMQrRrNtB1a3lMKdhpJU3T46WBMt+ajPkowZI8RRhvpamIeT2iSM35O/Z4aIlO5zQxz8hkVbfbRvODkBuYMrDOXvvx7/rVM1M0zuYy9Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JVVZ2tp0xeGuDrwzdTq5svrCAoUCFbOfp2Wdun884X4=;
 b=mwCGmwhUcex9viq7Ta4a/sWOjhfjSFPKkj26i3v1n38NOrSAENgL0rWqBdFcpLWe2cYYmF+rQF8Xc55WKSDDG5+lyC7HLN3rDUalk7bbP6Nnv4NAYv0Tp1Vv2uzXlAybX+i6zLdZdZGGtG8JErTcEn84BaVK8KpfBUV0CrXwg+E=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEYPR03MB8328.apcprd03.prod.outlook.com (2603:1096:101:1af::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Mon, 18 Nov
 2024 08:20:13 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8158.017; Mon, 18 Nov 2024
 08:20:13 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, 
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "fshao@chromium.org"
 <fshao@chromium.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] drm/mediatek: Add no pending_planes flag checking for
 mtk_crtc_finish_page_flip()
Thread-Topic: [PATCH] drm/mediatek: Add no pending_planes flag checking for
 mtk_crtc_finish_page_flip()
Thread-Index: AQHbOWs1wXZ67HqCP0esrO+i6ErkpbK8socA
Date: Mon, 18 Nov 2024 08:20:13 +0000
Message-ID: <96b3576243f5c6880dd16d36020d2083a8508b44.camel@mediatek.com>
References: <20241118033646.31633-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20241118033646.31633-1-jason-jh.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEYPR03MB8328:EE_
x-ms-office365-filtering-correlation-id: d3126f11-c40f-4945-f2f4-08dd07a9d369
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MHBDVVZGUUJma2kvVytxYUdyMjRsajJIVXdKK1hlR0drK3FVd09sektDUmll?=
 =?utf-8?B?dWJtYzhjS1pUV3gyQ1FHUi92YTl0d0VwbDhJbGdnOTcrK0ROU040RW5hek41?=
 =?utf-8?B?UkFraWpCdDJFclkrcHF2eU5hS1JzeFBWQk1QWlpNYitvTnRwenNuckZzbUhl?=
 =?utf-8?B?anZkVXJOZFlaalFYNFRhb212TGdwNExMU09EbGZleFV6d3VuUnVHNWluK3hD?=
 =?utf-8?B?VXd3OVZCOFc4ek9VMW1VT3RmNVlvT1ZjUHB5MDU0RG9nYU51azk4SlZMMWk5?=
 =?utf-8?B?aFd3alZYak42T1VDZytqVGx0VnRiWXhiWjRFVWlkS3U2UStXNUlXY3RwUFRC?=
 =?utf-8?B?N29xUG1jaDR0SDRaNkVadE5TWG1lWnUvQll6OXJIYjh0NFMvTkFsQk1JdGJh?=
 =?utf-8?B?aTU4VFp1M0RtOXpOVTBBMjRWT3VXY0lqNUlYd0lWd2ZmVnF0aWgvdmxIenNE?=
 =?utf-8?B?OE9lMVlBWHpzS0hidzdSRVU3R3ljV1l5amNYRWhvakdVT0JqTnBJdnllS3RC?=
 =?utf-8?B?MEs2cDVZdHVjdnRycUZUZ1Y4NnYxUW5Sa1ljTzV6Yk10TU5rcnB0SWlEdFJF?=
 =?utf-8?B?YVdTcnlzd3hKUkxGQ0dzTTlOVTRUUGFvYVhkR2x4RmsyQzVSeVRWQVI2SDRK?=
 =?utf-8?B?NTlubk1HM1NFODhkUVhEYW5IRCtXYmtxdHkza2J1eHVDdEo3cEZBUmxqeFhp?=
 =?utf-8?B?aGhZeFpyU2p0VDU4djFkNG1HS3Q2MnR2WDNvdWJmMHYwOGNYVjBFaFFYV0l0?=
 =?utf-8?B?SHh3bGx4Yk5QdG1BZU9wWXJXUlJYUW5HZHR2REV5OFNHc29uZk4xc29hK2p3?=
 =?utf-8?B?alJSbVUwR09Tc2lsNTlxQ2xheXc2ZGxuZDZEYTF4UkpFWmpDNXJXWFBlM2NO?=
 =?utf-8?B?UnlCMDMzUnVaWU5MVWIva2phaCtib0NwRXhGTTBBVFhKS214WTZELzJzUmlz?=
 =?utf-8?B?UUVuU05VcnhNN3Bxek1qRkdyN3Zud2RaMTM2czUwL1QvcTI0VzJvMm9iNnJv?=
 =?utf-8?B?OWdXVWZZLzV2dldMa1B5OWVCSjI2dU14YkhLL214OWVmK2RGWFBjR0pqdzJw?=
 =?utf-8?B?MU9pUUc4amZBbFN0T0RYa3lRQ01Nby9ieWRxUVFnMjV2ZVVDU2pWY2NTb3dr?=
 =?utf-8?B?YURUWDJQanY2RkhNZVBYdnhUbDZzNk9ZZlJWNTYxOEVmd2Fab29NbytGRU15?=
 =?utf-8?B?eW03bWJZeW1CclhZbHY1aHVFdW1malEzVVZZb0hGQjM2VFlTdmtXZ2RWeUwr?=
 =?utf-8?B?Um92MGRGQlh2Z2EzcE5hTSt2MkR3cFU3RUN2QVRJSVRxYzFEcnpwajFPeWdG?=
 =?utf-8?B?cHl5Nk5tbnphbEhlanpSVXoyTWNGNm41SW1jV0VTRkRSaUFaOVhwa05NZm5D?=
 =?utf-8?B?TitMTnhzTms5ZzlMSmt4bUNVWU51bEpQODduNFBkRnNrc3JNNXlVZWthdDk1?=
 =?utf-8?B?Z3RmTm1RT3BGOUlhbmNmNDgydWNldU1hejRvdTg0TVlPZWdiOFhGMVp0OHg0?=
 =?utf-8?B?LzM0OEhXdUlGTTV2R2UxZUtsNHZVK2VqN2QxVTZMeDQ0c1ZoeURTTlN0Tjl4?=
 =?utf-8?B?UWc1aUNXRkt3MXNpd25iZkpieXU1ZERLeFk2VVViQzAxUDI5TTBRT2V4aUtI?=
 =?utf-8?B?R09hMWRyY1Z5bUQ1SG1ZNjFRTEFyMG1ZVS9xTGpSNWlxbFdoenkyTzd1bTBx?=
 =?utf-8?B?cVhiZVpQL0I4MnB2UUMzWWVtQUt3Ymdlbk1KN0NqYkxPV3JFTk9kY0J1TWlM?=
 =?utf-8?B?VURwVDdqYm84Q2hkeEZ3NTFSL2UyazJJVk5LWUF3bTMwQTRBWnZTVGw5ODg1?=
 =?utf-8?Q?Ba4lVtn9Eh3GSOggvzzwkPZW1m+VWrBZ83RqU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q1RuaTdxQ2dqZWFFdVExaDc1K2JpVmZ3Zi9IbnlWSG5yOG9mM3BEb2JWRGJk?=
 =?utf-8?B?S3FrNVF3RWhEQ2c3T1ZTNjd5N2tVQm4rRUpyeW1aQkhjMFNZZVBMSTF4Y0pS?=
 =?utf-8?B?eVl2K3BBOFdyUER1VWtrdmRRMnUzUFVrR2d1SjlTYWZjS2RzaDlyQ2hEM1VT?=
 =?utf-8?B?MDdhTTlOdEtGZWdGbUY3WXpGVjg0d0xlRlBHTFpGK1BoRDIza2JrRjEwTmlO?=
 =?utf-8?B?NzNRalpqTFBTRC85QUhZd1dHS1YwcXAxdVRHZ24xcFJzRWEyNmRwU1BmYlJP?=
 =?utf-8?B?Wi9uZnFrZWpEN0VaWlBIUTNHQW11eVk5WVpwQnBKNnUxMXA0ZUZya3ZucHhW?=
 =?utf-8?B?V1YxaURWYVJqY3Z6OWYrcWYya2pabFM0c3hmbGRzYlp2c255aFppQ0tEc29C?=
 =?utf-8?B?WENXZ0s3Umd1TFpvQU5jWlNxNzdpNTlGSS9NYWw3cmtuSWpveUtBU3U0Nklt?=
 =?utf-8?B?dDFQZHRzZU9SalRsNUhuMjZVTmF6Smx1cjBncGQwdEFjNTJoQS9RNTdLV0JL?=
 =?utf-8?B?RzdCRTgwcGFCaVB0NWdTeW8vNFo2MjZkOERXR3B2b0k2eEdLbWZDNE92OU03?=
 =?utf-8?B?TnlGSXB6ejRxRVBaaDlJNWIrNDJGK3poNjlQVEc5R244QXhkcTFteXZFYUtL?=
 =?utf-8?B?aVN4RkNBeFFYZjViSzAxVVZLRDlKcUl5RlIxMDZORjR0alpPUkFVUkxTNU0r?=
 =?utf-8?B?dGFraUtTcWVHZTZ3NGZUTFNhOTE1OXpBN3N1TVp4ZFRvaFRqcHUxNm9kT2Nw?=
 =?utf-8?B?c0F4b1BLYmx4ZUdCSDczbGllcHBpa3dQVlNBTzIyeTRrekRNcXNFNXRiWWVD?=
 =?utf-8?B?QXMzV2RNa2ZBcEErQjl1bmVDZHY5MUFOeHl6cHZlZXFEekZERDE3dWhJUDVa?=
 =?utf-8?B?NzQ0dHJvWHRFOERmSS9UOXBPTnc4WkFyczFTWGJUUXNFR3NUejVMQVhnWldU?=
 =?utf-8?B?M0JVOHNoLzNzaE1hWWxPSXFjUVN6cmdFSGVNcm1LOFNQbnJaZzFVaXVMMDZ1?=
 =?utf-8?B?dVA2RzNPdFFHa21HVk1yakZpZUhDbE53UVNhekZoOFdFbGd3MEtQb21XQ3hJ?=
 =?utf-8?B?Yk5lUVk3alB1MUpZTmFyTnY5THpHRkFUQXZ3dktvWSs3d1RPYmFud3pia2ll?=
 =?utf-8?B?TEEyU3VFUmx4djhhL3Y0SE9yNTlXb2RGSy9wREVwd01OUVdhQkUvWktXbVpK?=
 =?utf-8?B?V0NrcERMSFlYT29RN0FUU2ZtSVEyZHhkYVl2R1ZraXB5RFd2NjFRc0ZtdW01?=
 =?utf-8?B?dXcvekU1TjNBVTB1MWVZQzRsdHppS0xEZzRJODQ5akNIbVpNT0h2aWpjOWlS?=
 =?utf-8?B?VURlYWpLMUE0SG9SQlJ0MUVhV2hXa1VvWmtxQVdVMDJLUjVZaFVrblZEdXFm?=
 =?utf-8?B?M3lnOXR4d0xDZUY4TW5IOWorTFlyRlhpZHdDYzRrV1JxaWMrdjVoTUQrVEV4?=
 =?utf-8?B?QjQyZVc0SkxrZVhlSUtyN09TZlFyYXcwYlRSZzFYNWdjQTF6bUZKcTExR2xK?=
 =?utf-8?B?RW53VVlGaHI1Nmsxb1FPZkp2U3BrM2FBQTNUSk94M0FuNDVDL3lldmtVT3pv?=
 =?utf-8?B?NGFTaXRqMkJJYmlLNjBORlNKVlcvOEZocUdmV0JNYjlYdm5TeUNMRjVmZFc2?=
 =?utf-8?B?cFJLa0hJRXZCVkFtWFU5UlY1OXlKZ29VUDVZSElpcFlzVWNTVHRSSGhzSUUw?=
 =?utf-8?B?cEdyTXF4M2ZzbUVTMngvOEd6YXMzWXRCSE1pRDBXQTBnMnpzYjlEcDgvdHRo?=
 =?utf-8?B?Y0Y3OVZFRERSTGdoSDVzejVQMXh5RjB4SGlSTlFSQWZJTXV2Zjh2YUVrVXdR?=
 =?utf-8?B?dGlDYmpZU1kxU05LeUM2a2pSbStqQ3B6SWpUeFNNRnE2NGJXb3N5dWxZSW9Q?=
 =?utf-8?B?OG9NTTg0dWJ4TkYxMFZmb0pVcTBBd3JZcE80Uk0wRXlFZUgwQUljb09TQzJS?=
 =?utf-8?B?SEN5c0RmWWVaV2RhcUxrT0NOYnpmQXVHSU0va1lBRFBRZHBJQXMyUHVCelhO?=
 =?utf-8?B?VnV0WCthWXVCT1prQm5EVVpmUHBwRC8xcVBDWWVoNEU0cFpFcjZET25PMlla?=
 =?utf-8?B?UGtwM1dsRGl0UmFUdzN6RVB1WkE5eUJ1QmFOVkYyYjVVTjRscE5nSFRCUjRZ?=
 =?utf-8?B?WHJvK1g1UWtFa0hKekthYzlJNWxZbTVHRWp4MWk1YkRhNVN3KzlOMmNWZHFw?=
 =?utf-8?B?ZUE9PQ==?=
Content-ID: <F553659E29B9534E8E4C612C63C410DB@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3126f11-c40f-4945-f2f4-08dd07a9d369
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2024 08:20:13.3856 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: agaQxUGKfVvGB8XeYl69ieQJxe9UHxwPC0hcE6SH1CV9njWU37WrCG/aNZpMdYKzQ55cALlWOm6ZbLO+LWvrFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8328
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_004_833862111.1130190422"
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

--__=_Part_Boundary_004_833862111.1130190422
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEphc29uOg0KDQpPbiBNb24sIDIwMjQtMTEtMTggYXQgMTE6MzYgKzA4MDAsIEphc29uLUpI
LkxpbiB3cm90ZToNCj4gbXRrX2NydGNfZmluaXNoX3BhZ2VfZmxpcCgpIGlzIHVzZWQgdG8gbm90
aWZ5IHRoZSBwYWdlIGZsaXAgdGhhdCBoYXMNCj4gYmVlbiBjb21wbGV0ZWQgdG8gdGhlIHVzZXJz
cGFjZSwgc28gdXNlcnNwYWNlIGNhbiBmcmVlIHRoZSBmcmFtZSBidWZmZXINCj4gb2YgdGhlIGxh
c3QgZnJhbWUgYW5kIGNvbW1pdCB0aGUgbmV4dCBmcmFtZS4NCj4gDQo+IEhvd2V2ZXIsIG10a19j
cnRjX2ZpbmlzaF9wYWdlX2ZsaXAoKSBjYW5ub3QgZ3VhcmFudGVlIHRoZSBHQ0UgaGFzDQo+IGNv
bmZpZ3VyZWQgYWxsIHRoZSBkaXNwbGF5IGhhcmR3YXJlIHNldHRpbmdzIG9mIHRoZSBsYXN0IGZy
YW1lLg0KPiBUaGlzIG1heSBjYXVzZSB0aGUgZGlzcGxheSBoYXJkd2FyZSB0byBzdGlsbCBhY2Nl
c3MgdGhlIGxhc3QgZnJhbWUNCj4gYnVmZmVyIHJlbGVhc2VkIGJ5IHRoZSB1c2Vyc3BhY2UuDQo+
IA0KPiBTbyBhZGQgdGhlIGNoZWNraW5nIGNvbmRpdGlvbiBvZiBubyBwZW5kaW5nX3BsZW5zIGZs
YWdzIHRvIG1ha2Ugc3VyZQ0KPiBHQ0UgaGFzIGV4ZWN1dGVkIGFsbCB0aGUgcGVuZGluZyBwbGFu
ZXMgY29uZmlndXJhdGlvbi4NCg0KV2hhdCdzIHRoZSBwcm9iYWJpbGl0eT8NCklmIGl0J3MgbG93
IHByb2JhYmlsaXR5LCB3ZSBjb3VsZCBkcm9wIGNhbGxpbmcgbXRrX2NydGNfZmluaXNoX3BhZ2Vf
ZmxpcCgpLg0KSWYgaXQncyBub3QgbG93IHByb2JhYmlsaXR5LCBJIHRoaW5rIGRyb3AgY2FsbGlu
ZyBtdGtfY3J0Y19maW5pc2hfcGFnZV9mbGlwKCkgd291bGQgcmVkdWNlIHRoZSBmcHMgYW5kIHdl
IHNob3VsZCBmaW5kIGFub3RoZXIgd2F5Lg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiANCj4gRml4ZXM6
IDdmODJkOWM0Mzg3OSAoImRybS9tZWRpYXRlazogQ2xlYXIgcGVuZGluZyBmbGFnIHdoZW4gY21k
cSBwYWNrZXQgaXMgZG9uZSIpDQo+IFNpZ25lZC1vZmYtYnk6IEphc29uLUpILkxpbiA8amFzb24t
amgubGluQG1lZGlhdGVrLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2NydGMuYyB8IDMgKystDQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2NydGMuYw0KPiBpbmRl
eCBlYjBlMTIzM2FkMDQuLmIwM2I5MTAyZmY5MCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19jcnRjLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19jcnRjLmMNCj4gQEAgLTExMyw3ICsxMTMsOCBAQCBzdGF0aWMgdm9pZCBtdGtfZHJtX2Zp
bmlzaF9wYWdlX2ZsaXAoc3RydWN0IG10a19jcnRjICptdGtfY3J0YykNCj4gIAlkcm1fY3J0Y19o
YW5kbGVfdmJsYW5rKCZtdGtfY3J0Yy0+YmFzZSk7DQo+ICANCj4gIAlzcGluX2xvY2tfaXJxc2F2
ZSgmbXRrX2NydGMtPmNvbmZpZ19sb2NrLCBmbGFncyk7DQo+IC0JaWYgKCFtdGtfY3J0Yy0+Y29u
ZmlnX3VwZGF0aW5nICYmIG10a19jcnRjLT5wZW5kaW5nX25lZWRzX3ZibGFuaykgew0KPiArCWlm
ICghbXRrX2NydGMtPmNvbmZpZ191cGRhdGluZyAmJiBtdGtfY3J0Yy0+cGVuZGluZ19uZWVkc192
YmxhbmsgJiYNCj4gKwkgICAgIW10a19jcnRjLT5wZW5kaW5nX3BsYW5lcykgew0KPiAgCQltdGtf
Y3J0Y19maW5pc2hfcGFnZV9mbGlwKG10a19jcnRjKTsNCj4gIAkJbXRrX2NydGMtPnBlbmRpbmdf
bmVlZHNfdmJsYW5rID0gZmFsc2U7DQo+ICAJfQ0K

--__=_Part_Boundary_004_833862111.1130190422
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtKYXNvbjoNCg0KT24mIzMyO01vbiwmIzMy
OzIwMjQtMTEtMTgmIzMyO2F0JiMzMjsxMTozNiYjMzI7KzA4MDAsJiMzMjtKYXNvbi1KSC5MaW4m
IzMyO3dyb3RlOg0KJmd0OyYjMzI7bXRrX2NydGNfZmluaXNoX3BhZ2VfZmxpcCgpJiMzMjtpcyYj
MzI7dXNlZCYjMzI7dG8mIzMyO25vdGlmeSYjMzI7dGhlJiMzMjtwYWdlJiMzMjtmbGlwJiMzMjt0
aGF0JiMzMjtoYXMNCiZndDsmIzMyO2JlZW4mIzMyO2NvbXBsZXRlZCYjMzI7dG8mIzMyO3RoZSYj
MzI7dXNlcnNwYWNlLCYjMzI7c28mIzMyO3VzZXJzcGFjZSYjMzI7Y2FuJiMzMjtmcmVlJiMzMjt0
aGUmIzMyO2ZyYW1lJiMzMjtidWZmZXINCiZndDsmIzMyO29mJiMzMjt0aGUmIzMyO2xhc3QmIzMy
O2ZyYW1lJiMzMjthbmQmIzMyO2NvbW1pdCYjMzI7dGhlJiMzMjtuZXh0JiMzMjtmcmFtZS4NCiZn
dDsmIzMyOw0KJmd0OyYjMzI7SG93ZXZlciwmIzMyO210a19jcnRjX2ZpbmlzaF9wYWdlX2ZsaXAo
KSYjMzI7Y2Fubm90JiMzMjtndWFyYW50ZWUmIzMyO3RoZSYjMzI7R0NFJiMzMjtoYXMNCiZndDsm
IzMyO2NvbmZpZ3VyZWQmIzMyO2FsbCYjMzI7dGhlJiMzMjtkaXNwbGF5JiMzMjtoYXJkd2FyZSYj
MzI7c2V0dGluZ3MmIzMyO29mJiMzMjt0aGUmIzMyO2xhc3QmIzMyO2ZyYW1lLg0KJmd0OyYjMzI7
VGhpcyYjMzI7bWF5JiMzMjtjYXVzZSYjMzI7dGhlJiMzMjtkaXNwbGF5JiMzMjtoYXJkd2FyZSYj
MzI7dG8mIzMyO3N0aWxsJiMzMjthY2Nlc3MmIzMyO3RoZSYjMzI7bGFzdCYjMzI7ZnJhbWUNCiZn
dDsmIzMyO2J1ZmZlciYjMzI7cmVsZWFzZWQmIzMyO2J5JiMzMjt0aGUmIzMyO3VzZXJzcGFjZS4N
CiZndDsmIzMyOw0KJmd0OyYjMzI7U28mIzMyO2FkZCYjMzI7dGhlJiMzMjtjaGVja2luZyYjMzI7
Y29uZGl0aW9uJiMzMjtvZiYjMzI7bm8mIzMyO3BlbmRpbmdfcGxlbnMmIzMyO2ZsYWdzJiMzMjt0
byYjMzI7bWFrZSYjMzI7c3VyZQ0KJmd0OyYjMzI7R0NFJiMzMjtoYXMmIzMyO2V4ZWN1dGVkJiMz
MjthbGwmIzMyO3RoZSYjMzI7cGVuZGluZyYjMzI7cGxhbmVzJiMzMjtjb25maWd1cmF0aW9uLg0K
DQpXaGF0JiMzOTtzJiMzMjt0aGUmIzMyO3Byb2JhYmlsaXR5JiM2MzsNCklmJiMzMjtpdCYjMzk7
cyYjMzI7bG93JiMzMjtwcm9iYWJpbGl0eSwmIzMyO3dlJiMzMjtjb3VsZCYjMzI7ZHJvcCYjMzI7
Y2FsbGluZyYjMzI7bXRrX2NydGNfZmluaXNoX3BhZ2VfZmxpcCgpLg0KSWYmIzMyO2l0JiMzOTtz
JiMzMjtub3QmIzMyO2xvdyYjMzI7cHJvYmFiaWxpdHksJiMzMjtJJiMzMjt0aGluayYjMzI7ZHJv
cCYjMzI7Y2FsbGluZyYjMzI7bXRrX2NydGNfZmluaXNoX3BhZ2VfZmxpcCgpJiMzMjt3b3VsZCYj
MzI7cmVkdWNlJiMzMjt0aGUmIzMyO2ZwcyYjMzI7YW5kJiMzMjt3ZSYjMzI7c2hvdWxkJiMzMjtm
aW5kJiMzMjthbm90aGVyJiMzMjt3YXkuDQoNClJlZ2FyZHMsDQpDSw0KDQomZ3Q7JiMzMjsNCiZn
dDsmIzMyO0ZpeGVzOiYjMzI7N2Y4MmQ5YzQzODc5JiMzMjsoJnF1b3Q7ZHJtL21lZGlhdGVrOiYj
MzI7Q2xlYXImIzMyO3BlbmRpbmcmIzMyO2ZsYWcmIzMyO3doZW4mIzMyO2NtZHEmIzMyO3BhY2tl
dCYjMzI7aXMmIzMyO2RvbmUmcXVvdDspDQomZ3Q7JiMzMjtTaWduZWQtb2ZmLWJ5OiYjMzI7SmFz
b24tSkguTGluJiMzMjsmbHQ7amFzb24tamgubGluQG1lZGlhdGVrLmNvbSZndDsNCiZndDsmIzMy
Oy0tLQ0KJmd0OyYjMzI7JiMzMjtkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2NydGMuYyYj
MzI7fCYjMzI7MyYjMzI7KystDQomZ3Q7JiMzMjsmIzMyOzEmIzMyO2ZpbGUmIzMyO2NoYW5nZWQs
JiMzMjsyJiMzMjtpbnNlcnRpb25zKCspLCYjMzI7MSYjMzI7ZGVsZXRpb24oLSkNCiZndDsmIzMy
Ow0KJmd0OyYjMzI7ZGlmZiYjMzI7LS1naXQmIzMyO2EvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19jcnRjLmMmIzMyO2IvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19jcnRjLmMNCiZn
dDsmIzMyO2luZGV4JiMzMjtlYjBlMTIzM2FkMDQuLmIwM2I5MTAyZmY5MCYjMzI7MTAwNjQ0DQom
Z3Q7JiMzMjstLS0mIzMyO2EvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19jcnRjLmMNCiZn
dDsmIzMyOysrKyYjMzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2NydGMuYw0KJmd0
OyYjMzI7QEAmIzMyOy0xMTMsNyYjMzI7KzExMyw4JiMzMjtAQCYjMzI7c3RhdGljJiMzMjt2b2lk
JiMzMjttdGtfZHJtX2ZpbmlzaF9wYWdlX2ZsaXAoc3RydWN0JiMzMjttdGtfY3J0YyYjMzI7Km10
a19jcnRjKQ0KJmd0OyYjMzI7JiMzMjtkcm1fY3J0Y19oYW5kbGVfdmJsYW5rKCZhbXA7bXRrX2Ny
dGMtJmd0O2Jhc2UpOw0KJmd0OyYjMzI7JiMzMjsNCiZndDsmIzMyOyYjMzI7c3Bpbl9sb2NrX2ly
cXNhdmUoJmFtcDttdGtfY3J0Yy0mZ3Q7Y29uZmlnX2xvY2ssJiMzMjtmbGFncyk7DQomZ3Q7JiMz
MjstaWYmIzMyOyghbXRrX2NydGMtJmd0O2NvbmZpZ191cGRhdGluZyYjMzI7JmFtcDsmYW1wOyYj
MzI7bXRrX2NydGMtJmd0O3BlbmRpbmdfbmVlZHNfdmJsYW5rKSYjMzI7ew0KJmd0OyYjMzI7K2lm
JiMzMjsoIW10a19jcnRjLSZndDtjb25maWdfdXBkYXRpbmcmIzMyOyZhbXA7JmFtcDsmIzMyO210
a19jcnRjLSZndDtwZW5kaW5nX25lZWRzX3ZibGFuayYjMzI7JmFtcDsmYW1wOw0KJmd0OyYjMzI7
KyYjMzI7JiMzMjsmIzMyOyYjMzI7IW10a19jcnRjLSZndDtwZW5kaW5nX3BsYW5lcykmIzMyO3sN
CiZndDsmIzMyOyYjMzI7bXRrX2NydGNfZmluaXNoX3BhZ2VfZmxpcChtdGtfY3J0Yyk7DQomZ3Q7
JiMzMjsmIzMyO210a19jcnRjLSZndDtwZW5kaW5nX25lZWRzX3ZibGFuayYjMzI7PSYjMzI7ZmFs
c2U7DQomZ3Q7JiMzMjsmIzMyO30NCg0KPC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlw
ZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFs
aXR5IE5vdGljZSAqKioqKioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5l
ZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1h
eSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UN
CmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRl
bmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMp
LiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFp
bmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVu
dHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5k
IG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQg
b2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUgDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMg
ZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAo
YnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9m
IA0KdGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0
ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFu
eSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_004_833862111.1130190422--

