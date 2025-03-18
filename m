Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC82A66E57
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 09:34:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6A4110E44D;
	Tue, 18 Mar 2025 08:34:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="P9s+p2Yc";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="pc07AOgZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50E5C10E33C
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 03:14:18 +0000 (UTC)
X-UUID: 114579b603a711f0aae1fd9735fae912-20250318
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=6uX3Md3udvIv96WbT2GqFfPx81o36cES0rnDBg7p/NE=; 
 b=P9s+p2Yc1WlgO8afQMhhl4+98HEonkTi8QXU64x/rtwkmxlvtKPxCc513HBPtHm/iQ/UomIVWa/v7J9CSVijh8X9Yb3Jq6WZ4hu4TG4u3N7etly97EwuMwbVOAZD5lv+ObXS74u2yoIKekLU/T5SeUNkDz58qc8bhiJaj8Xn3wo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1, REQID:fa319f60-d942-4a00-b8ee-ac30e121e600, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:0ef645f, CLOUDID:df483c4a-a527-43d8-8af6-bc8b32d9f5e9,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
 EDM:-3,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
 A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 114579b603a711f0aae1fd9735fae912-20250318
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <sunny.shen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 180071484; Tue, 18 Mar 2025 11:14:13 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 18 Mar 2025 11:14:11 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1258.39 via Frontend Transport; Tue, 18 Mar 2025 11:14:11 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F4Up54lRrbcjOmIHUdvvq2bNBNDVEk+ZVxSBGsOG6gwCWW8uy4KluePUk28n0LNc70dPMMaGRN/dy+RawFDela3kld5GvnklsVcVlB0ioqIRA9IAYMXWfkOqEpeDpZPK42tgX3U0BetUEpJOFH11BbKmpX0J7jr1drAI0aAhuIPdsoKJio67fZLrVV4I3T3v5evLgVM3r2sXfeYxZz/AHFhJbnbwKdlIdwga97WsFfFf8mJyzWZlKmbpdyVwhDD5vy7e9tQpSg5Pt8t0IdyOyZkTr84URDJwekv6O6crD3RhwKG5sAB7RYhDaaHMSt2bwTmMNaMQ6ORFVnd0vWqKRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nNBuzUUHXzud/JZYzCqw2IsKLIwZCpzJYhJ72e13ScU=;
 b=juM8hKMHiFQKeD+yueiUlLeszWlbTAyBDstxgkf+XjGv1LlvacpsVD7KBRF2nRkIqwn7YPIqgIvvgAiyyfkbyUHaI98Y6crWJkN5uqgF7OhDupdAAYTWVm1FPEE6YtDg25W8ACR7OsO9mMRSeE6wRV6mtYo8huLSI1EnYvTMkBo6y8x6pLlEReJQLw7h5zxz0bi5py5i9C42xSjPCywr3TLehQK8saZfUBg+ALucj+MdMJ4FybknDBXyA9E3V74x9Cv0NNz8xyK021+ZgO2I9foQipfKu9Z2w9WKKlORALhEW8mw16htS3U1RRAaoLG2gs8ITVDBKucJVFzx2Y6z/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nNBuzUUHXzud/JZYzCqw2IsKLIwZCpzJYhJ72e13ScU=;
 b=pc07AOgZaOvqZKZtLuu2+JuR8DlZ/V1pGM9uHZNhZ0p0CxGlYFe286nM/Pnl31qXgeaAVNiNNaGJM+cXE65TNPCxMGEUoHf6mOadel0NnSpaUR26AAqc0yAZf8MZYFhQgKVfJT6DNAF7FZn5eLh3s+KcCLvAY9fdT/GRtnf7EL8=
Received: from TY0PR03MB8330.apcprd03.prod.outlook.com (2603:1096:405:1a::6)
 by KL1PR03MB7222.apcprd03.prod.outlook.com (2603:1096:820:d5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 03:14:07 +0000
Received: from TY0PR03MB8330.apcprd03.prod.outlook.com
 ([fe80::22a4:76d2:35ad:dadf]) by TY0PR03MB8330.apcprd03.prod.outlook.com
 ([fe80::22a4:76d2:35ad:dadf%5]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 03:14:07 +0000
From: =?utf-8?B?U3VubnkgU2hlbiAo5rKI5aeN5aeNKQ==?= <Sunny.Shen@mediatek.com>
To: "conor@kernel.org" <conor@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "fshao@chromium.org" <fshao@chromium.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "treapking@chromium.org" <treapking@chromium.org>
Subject: Re: [PATCH 1/5] dt-bindings: display: mediatek: mdp-rsz: Add rules
 for MT8196
Thread-Topic: [PATCH 1/5] dt-bindings: display: mediatek: mdp-rsz: Add rules
 for MT8196
Thread-Index: AQHbfDA5jLoxTxf3wkWDuIJMLNCq1bNCY5mAgBLaqwCAAaZHAIAhirOA
Date: Tue, 18 Mar 2025 03:14:07 +0000
Message-ID: <76a6fc25a09dfddb55fdaf0a9d7dcf9a6129b00f.camel@mediatek.com>
References: <20250211025317.399534-1-sunny.shen@mediatek.com>
 <20250211025317.399534-2-sunny.shen@mediatek.com>
 <20250211-feed-shed-4b32f146cc54@spud>
 <029f9fd7ab898769a7ae627b160e1dce446ccc9e.camel@mediatek.com>
 <20250224-dreamland-tactile-bdb58daf6060@spud>
In-Reply-To: <20250224-dreamland-tactile-bdb58daf6060@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY0PR03MB8330:EE_|KL1PR03MB7222:EE_
x-ms-office365-filtering-correlation-id: d3b84957-0d90-489b-bdba-08dd65caf224
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?cVVtRkZtaFNDalc2clA0VnpoVWh1aXZDY0hZb1NST0VNNHVwemJLNll5S1Jj?=
 =?utf-8?B?ZlVnWmJaT2R1bUE3VDRXVllNWGVXQldEbTNheEtFZkt1YXdQRmZQdjZwUEVB?=
 =?utf-8?B?emxTQWVpbWEwQjFqamxSeUlPV3ljMWVYQmJ2Y1hVcHN3cmpVRHRvY0dHcjgr?=
 =?utf-8?B?WjU3bGx5cHcvQkpQTExlZkZHb2M0LzZJbUZLdExza3BtOUErSHRwS1QwS0R1?=
 =?utf-8?B?cHZsS2JSWHhSRmNMK2ZJVGlmY21Ec09zcHkzTFkxTEtXMzNsMjYzUUN0Unpz?=
 =?utf-8?B?MVNRZ2FaUWRTWEVXaWJnQXN0Y0p1bmpZeFpjcEJRYmJxSzNjUUZOMTBjcU5I?=
 =?utf-8?B?eUtYM29sR2hoZEo4M1kwNHpGbW5CVjF6cENXbXo1VzB5M0xsbG5Fa0hDenU4?=
 =?utf-8?B?cVVuMit1NGpySVRDNWo3aEppajdwbXZqQ0ZUYXUzY2pWZHd2VTZNTElYRzNo?=
 =?utf-8?B?dzdzNVlmR2NTbCtvVVp2azRGREJBd0crSnBkTmd6RHphNER1MlZRY3lzdWp4?=
 =?utf-8?B?TndvdE42WHBTYWptaWtKcUFITTM2S0VGcVpLQnpLM1MyWUs5ejgvdnZEZ2hh?=
 =?utf-8?B?alJOOU5sVGk1VzNzUkNPQ0M0VnowY1B3S1hrY0kyVWR5b25VY1hsSmRtY0g1?=
 =?utf-8?B?amZ2bXkxVk5DOHA1b0o0RTBUZzZjMjFJUnlJVC81UVFZamQ3Z1BaNnRWQmVz?=
 =?utf-8?B?TVJZVk8wdEdjYnc0K1oya21HeUFub1BiTEc4Q3diaTRXQjN4dGJ2NWJGOXVG?=
 =?utf-8?B?V0dVWktnTG5OUVNCa2VmRUo1NVhWbndqdHkrdEVjUDJSdEFmZXNIbmRyM2VC?=
 =?utf-8?B?R1h0c1NpVTlDdzkxOHNHMDcvVzZ2Tmg1bjkxM2NGZ2dlTWVtc0RGRG5VNlh2?=
 =?utf-8?B?ZDNFaXhIWU9PYlEwRXh4dUh1RGRjcks5WkdSQnUwU2pmem01SDRLNHBzaFEy?=
 =?utf-8?B?anhjRithOEc1NEFpV01yZ2kvM0I0QjZJTUxPR3V0Nm8wTGRYaDNJcFFvUU5Z?=
 =?utf-8?B?czNCTHo5Vk52QU0yWnRvWFU3NWIrZDVCb0wwbC9valk1cDFneGYyZTdpVkoy?=
 =?utf-8?B?dDlZY2hBTHZjcmtIalBsSDMvaGhhMFd4QlBoT3ZJRE03bDY3ME82R0thdjBI?=
 =?utf-8?B?Q3NXT1ZsTjJjMCsyYjJMTFIySkhwTXBRaHRncEU1ODVRdW9YZysxRXVBNitx?=
 =?utf-8?B?bWp3aGtzRDUrRmgxbGdaOVhmc01SeVB4bGNpVGRTVlIvR3BhejE4ayt1cUxU?=
 =?utf-8?B?ZFR0VGFBaXJtTEx4dDNuNVFPNGo2eEl0SVdyRWVSRXlZVzBDZ0o2OHVZWHJr?=
 =?utf-8?B?SHNOcWlaTFR3V1pTRXVaSFNHNFBsWXNDZ3h6TnFCVzNYbnEyUGNkV1QrTWlN?=
 =?utf-8?B?enVjczEzZGh4LzhHZmtPSWUzcE8wWTg1Mms0U2R6WWVDa3d0OUoxZ1J4TUU1?=
 =?utf-8?B?d1lscmt5Tlk4YVVueENPNmtiMEw4ZkVUNWsrMU52Mk12djhHQjVoTGtrYkU1?=
 =?utf-8?B?SjUrcnZZdHl6QTlRa1kyOXg4VHMxQ3luTDVvSXB1OWVVVlJoOWJBeTRWZGFj?=
 =?utf-8?B?VDV0SnI0WUhEcWh4U21yc0hzZEFmbWpkTitIQW02bExsSldBMGhzT0ZWT3pI?=
 =?utf-8?B?SzZsb3dQakkzcFI4R2FRQmxLbStXeElKcDBCWWlWVTBGRjNQcDE3TFVubmQ0?=
 =?utf-8?B?aFZUTWFQbnFPT2F4bXVrbmlCTHhMV2Rna2t3clB4eTVNQlN5OC9SbHBQTW9n?=
 =?utf-8?B?RWI0TENYd05kaFR2R3dmTEIxNzgxdVhJOFFiRmJZMEFjbTF6UGg3TUgzWGpV?=
 =?utf-8?B?SHhuNUtreS9od2gxZlRGczMxdWN6VHI3dmYrWFoxNkJVZE1ocncwdU9WZVV4?=
 =?utf-8?B?RUlmeVJOQ2laU3ZjZzd2ZVF2cnJBVlRQbnNEVXJUUjNFeG9MSU94Nm4xdFNB?=
 =?utf-8?Q?mBASSUBsaqWMg78zTZpV7yVWBuPEAlUV?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY0PR03MB8330.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MzUxMmQ2Zzd2M29kSEprRmhCTHgwSnVlbGk3WmxSMFdiRGIvc01CMGNVNElL?=
 =?utf-8?B?WGJqRklFcU1ybU1Ua2VhdlNnM1NCN2JiSXJVY2daWWlyZUpFZlQvWFJtSEx2?=
 =?utf-8?B?N3VCaWtQYklHMXNSOFhxWlJTcjNDU0c0WVNGZm5GeUJ4bGZWSm10MG82YURu?=
 =?utf-8?B?V1pQb2hkK1QybVNVRTFkM2FET3YyeWFTeUF0Q09iRFRHQVFqVUpOeDRPMVBh?=
 =?utf-8?B?Yk1xL0lxOHU5N2NmbVhYUFM0bnA5dmdDc2IxL0NDOGpUc0tPYmYzb1JzVE52?=
 =?utf-8?B?cVJHKzl6Q3VRVU10OU9VWlltSWN3b29Ld2hMaUhnRkkzaDZQL1NZUmFteGRV?=
 =?utf-8?B?N3BpbFFjNjREZ1dzZTQ1SmtZTzdDNElOczhMZnE5UmhZbVZvOVVxVy9wOWRr?=
 =?utf-8?B?YUxOa3ZTNTBrRmJJZG1qdTZtRXpkU3FKVVhoZVFleG5vVFFrczJhdTdKTzI3?=
 =?utf-8?B?UGYra0pOaDVyWXFXK3BZUENQYVcrekNOZEowNzBsd1lPYk5FVnJpYzN4WUNq?=
 =?utf-8?B?SGxITjdheTRNWDcwYzNnOVA3ekNwZldOdFh2ZEhaMU1FZWFkbjFUNXRjZ0p0?=
 =?utf-8?B?UklVNFZraTVVb1ZocFVzZnlXaGxiNllsaktwU1JXck1FVGpBZkVFNEVRUjZH?=
 =?utf-8?B?TE45L3JSTWJkU0cyY1dDUHArYVRYR2h1KzZ3RHdHUzN0cmFBdHVpTksvL2Iv?=
 =?utf-8?B?QUdvejN0a2xMcU1jek1XcnEreFJrU1FQN3NXdFA2a0RHdUlIWDlpakkrZWVR?=
 =?utf-8?B?M3RCaWZFem85YW5GN0dKQjRDOVhGbGdDUzJnQ2dLTnRRSHExN2hmQ2lFQ3Vm?=
 =?utf-8?B?QWMxMk5MUXM4T0ZWY1MvNHVKVk94UnluaGxVMm4zcmtGTEJRa1dFVTJKbkxn?=
 =?utf-8?B?Q3d6eHJkOEFwZ0F5cGhWYjA3MEVuOGVkRE5BZUpHRytpOHp5aDdFTkkzR0Vl?=
 =?utf-8?B?SFZYREsydElXSGlXZERGblZtV2lzeWdCQkZjM3JpbDlSVzAwODVoSmZITXg2?=
 =?utf-8?B?RFE0c3FQZ1hqQ2ZRLzRzM0RwRUFaVkRDUGlISVp2QUZ5alBrbUs1b2xWVzJv?=
 =?utf-8?B?NnFaNjh4amF6Qjg3Z0R0RTVQQ2xoTXdDRTFSdzBCNkhFckdpMzZNUDU2TXRi?=
 =?utf-8?B?VlhLUnhYTWRPZ0s3WDRtY1Nzc2FydFJkYnJNR2hlNFh5Y0loblh1QUp4MWcr?=
 =?utf-8?B?dnNycVNPVW9XOFJ5MW5vaVlTWTdGQm4rN0hLSEtZRnhzMVgySE4vSUZGbFh5?=
 =?utf-8?B?TlJxN21EdWtSTWxoakwxMWlTQUtESTJkYW1KUjg2QkxQSm1jRFpFbVMzYVJ0?=
 =?utf-8?B?MnNPS3U0NUpWSVJuM1ovcHo4UTlRVzB1RmhndHh4UjAyWVExUUNCbWE2Y3ky?=
 =?utf-8?B?anJLOWsvVG5aOHhOUXZCUi9qUVduWkJOa2x3eW1QVXQ0NkxYTnhGeUcrWUFv?=
 =?utf-8?B?bi9wcmJyS3laL3JGMG9FNWV2L3RzcVoyNGFsS1d5Q2FHcUs4dXl6VWlubGpj?=
 =?utf-8?B?K0ZjN1g5cEJ1bUFYU0xCSmhoL214aTBJRFhQdWJxZ3VCNmd0ODFCK2JLek0v?=
 =?utf-8?B?UUdqWG0wdm4veGEvMDFmdmh1UUJUTHFsYjZZSmdFOEg3YzRaaEllNkxBRHBI?=
 =?utf-8?B?MC9CVUNiZkdsT0FaT0d5VFh6S0sxTzFIdnp2VEJSYW45bHp5MGZ4ZEczRjBi?=
 =?utf-8?B?dFdnSFVleWtoZDFiK05lRlJqSmhCVC8xOEhtSGQrYXBuV210c282WlI0QTBp?=
 =?utf-8?B?TGpXaGtkOVpNMnBWTkowQm1CaWtqaGdRYS8xVzdWNnVwV1M0SHZMdFNIdUVD?=
 =?utf-8?B?TDd6MnI0TjFIME5WNkYxMGovbFhQaytrRnBIWDgvV3Q5Z29FdXZqMWRTeEQ0?=
 =?utf-8?B?cDBNZUhXY0RWRG1neGs5ZzNGQSswQjRLdWR6dkdZb09XKzRINDhVc0lJQTZP?=
 =?utf-8?B?ZlNFVnhyWnF0R1NleU1DMXJadms5SHRUMldVZFNDcmpBU0NwRDRhODcxMWM4?=
 =?utf-8?B?RnhCOTNHWlZ2Q3prR2RmZVVyN05UV3pSclZHelpGSnhJM0VaaGJlZFdjdnBj?=
 =?utf-8?B?Qnp5dGt0bUJISWNKOWErdWZUc1JuRUtiaDU0ZUlxZlpzUUFNam5JVnNiYWsr?=
 =?utf-8?B?OTQxci8ycCtxeGJMMTdXcnNNdUZPdWliUWhVamlxNUx5Y0tBU0ZzYTVhSU9p?=
 =?utf-8?B?THc9PQ==?=
Content-ID: <6C9F7EED1B9F2449B5F70984370F77DF@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY0PR03MB8330.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3b84957-0d90-489b-bdba-08dd65caf224
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2025 03:14:07.6676 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fS5eq0uX0pETbRjRDlW/kf5pzdEl6AwtKwiNmuSTGpjwfkX8HUAIV8Y7vwtBPOXkCVUWlI2gzBBt5geIlCz2eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7222
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_007_1437790065.1579859777"
X-Mailman-Approved-At: Tue, 18 Mar 2025 08:34:05 +0000
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

--__=_Part_Boundary_007_1437790065.1579859777
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDI1LTAyLTI0IGF0IDE5OjAxICswMDAwLCBDb25vciBEb29sZXkgd3JvdGU6DQo+
IE9uIFN1biwgRmViIDIzLCAyMDI1IGF0IDA1OjQ5OjQ1UE0gKzAwMDAsIFN1bm55IFNoZW4gKOay
iOWnjeWnjSkgd3JvdGU6DQo+ID4gT24gVHVlLCAyMDI1LTAyLTExIGF0IDE3OjU0ICswMDAwLCBD
b25vciBEb29sZXkgd3JvdGU6DQo+ID4gPiBPbiBUdWUsIEZlYiAxMSwgMjAyNSBhdCAxMDo1Mjo1
MEFNICswODAwLCBTdW5ueSBTaGVuIHdyb3RlOg0KPiA+ID4gPiBBZGQgTURQLVJTWiBoYXJkd2Fy
ZSBkZXNjcmlwdGlvbiBmb3IgTWVkaWFUZWsgTVQ4MTk2IFNvQw0KPiANCj4gPiA+ID4gK2V4YW1w
bGVzOg0KPiA+ID4gPiArwqAgLSB8DQo+ID4gPiA+ICvCoMKgwqAgc29jIHsNCj4gPiA+ID4gK8Kg
wqDCoMKgwqDCoMKgICNhZGRyZXNzLWNlbGxzID0gPDI+Ow0KPiA+ID4gPiArwqDCoMKgwqDCoMKg
wqAgI3NpemUtY2VsbHMgPSA8Mj47DQo+ID4gPiA+ICsNCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKg
IGRpc3BfbWRwX3JzejA6IGRpc3AtbWRwLXJzejBAMzIxYTAwMDAgew0KPiA+ID4gDQo+ID4gPiBB
bmQgImRpc3AtbWRwLXJzejAiIGlzbid0IGFueXRoaW5nIGNsb3NlIHRvIGEgZ2VuZXJpYyBub2Rl
IG5hbWUuDQo+ID4gDQo+ID4gV2lsbCBtb2RpZnkgImRpc3AtbWRwLXJzejBAMzIxYTAwMDAiIHRv
ICJtZHAtcnN6QDMyMWEwMDAwIg0KPiANCj4gSSBkb24ndCB0aGluayB0aGF0J3MgYW4gaW1wcm92
ZW1lbnQuIEhpbnQ6IGZ1bGwgd29yZHMgd291bGQgYmUgYSBnb29kDQo+IHBsYWNlIHRvIHN0YXJ0
DQoNCsKgDQpIaSBDb25vciwNCg0KQWJvdXQgZnVsbCB3b3JkcyzCoA0KRG8geW91IG1lYW4gd29y
ZHMgbGlrZSB0aGlzP8KgDQptdWx0aW1lZGlhLWRpc3BsYXktcGF0aC1yZXNpemVyPw0Kb3IgbWRw
LXJlc2l6ZXI/DQoNCldlIGZvdW5kIHRoYXQgIm1kcC1yc3oiIHRoaXMga2luZCBvZiB3b3JkIGlz
IHVzZWQgYXQNCmh0dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxkcy9saW51eC9ibG9iL21hc3Rlci9h
cmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE4My5kdHNpDQoNCkknbSBub3Qgc3VyZSB3
aGF0IHdpbGwgYmUgYmV0dGVyLg0KQ2FuIHlvdSBwcm92aWRlIG1vcmUgZGV0YWlsZWQgc3VnZ2Vz
dGlvbiBhYm91dCB0aGlzIG5hbWluZz8NCg0KVGhhbmsgeW91DQoNCg0KQlIsDQpTdW5ueSBTaGVu
DQoNCg==

--__=_Part_Boundary_007_1437790065.1579859777
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO01vbiwmIzMyOzIwMjUtMDItMjQmIzMyO2F0
JiMzMjsxOTowMSYjMzI7KzAwMDAsJiMzMjtDb25vciYjMzI7RG9vbGV5JiMzMjt3cm90ZToNCiZn
dDsmIzMyO09uJiMzMjtTdW4sJiMzMjtGZWImIzMyOzIzLCYjMzI7MjAyNSYjMzI7YXQmIzMyOzA1
OjQ5OjQ1UE0mIzMyOyswMDAwLCYjMzI7U3VubnkmIzMyO1NoZW4mIzMyOygmIzI3Nzg0OyYjMjI5
ODk7JiMyMjk4OTspJiMzMjt3cm90ZToNCiZndDsmIzMyOyZndDsmIzMyO09uJiMzMjtUdWUsJiMz
MjsyMDI1LTAyLTExJiMzMjthdCYjMzI7MTc6NTQmIzMyOyswMDAwLCYjMzI7Q29ub3ImIzMyO0Rv
b2xleSYjMzI7d3JvdGU6DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtPbiYjMzI7VHVlLCYj
MzI7RmViJiMzMjsxMSwmIzMyOzIwMjUmIzMyO2F0JiMzMjsxMDo1Mjo1MEFNJiMzMjsrMDgwMCwm
IzMyO1N1bm55JiMzMjtTaGVuJiMzMjt3cm90ZToNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMy
OyZndDsmIzMyO0FkZCYjMzI7TURQLVJTWiYjMzI7aGFyZHdhcmUmIzMyO2Rlc2NyaXB0aW9uJiMz
Mjtmb3ImIzMyO01lZGlhVGVrJiMzMjtNVDgxOTYmIzMyO1NvQw0KJmd0OyYjMzI7DQomZ3Q7JiMz
MjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsrZXhhbXBsZXM6DQomZ3Q7JiMzMjsmZ3Q7JiMz
MjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsrJiMxNjA7JiMzMjstJiMzMjt8DQomZ3Q7JiMzMjsmZ3Q7JiMz
MjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsrJiMxNjA7JiMxNjA7JiMxNjA7JiMzMjtzb2MmIzMyO3sNCiZn
dDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOysmIzE2MDsmIzE2MDsmIzE2MDsmIzE2
MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzMyOyNhZGRyZXNzLWNlbGxzJiMzMjs9JiMzMjsmbHQ7MiZn
dDs7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsrJiMxNjA7JiMxNjA7JiMx
NjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMzMjsjc2l6ZS1jZWxscyYjMzI7PSYjMzI7Jmx0
OzImZ3Q7Ow0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Kw0KJmd0OyYjMzI7
Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7KyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYw
OyYjMTYwOyYjMTYwOyYjMzI7ZGlzcF9tZHBfcnN6MDomIzMyO2Rpc3AtbWRwLXJzejBAMzIxYTAw
MDAmIzMyO3sNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7
Jmd0OyYjMzI7QW5kJiMzMjsmcXVvdDtkaXNwLW1kcC1yc3owJnF1b3Q7JiMzMjtpc24mIzM5O3Qm
IzMyO2FueXRoaW5nJiMzMjtjbG9zZSYjMzI7dG8mIzMyO2EmIzMyO2dlbmVyaWMmIzMyO25vZGUm
IzMyO25hbWUuDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyO1dpbGwmIzMy
O21vZGlmeSYjMzI7JnF1b3Q7ZGlzcC1tZHAtcnN6MEAzMjFhMDAwMCZxdW90OyYjMzI7dG8mIzMy
OyZxdW90O21kcC1yc3pAMzIxYTAwMDAmcXVvdDsNCiZndDsmIzMyOw0KJmd0OyYjMzI7SSYjMzI7
ZG9uJiMzOTt0JiMzMjt0aGluayYjMzI7dGhhdCYjMzk7cyYjMzI7YW4mIzMyO2ltcHJvdmVtZW50
LiYjMzI7SGludDomIzMyO2Z1bGwmIzMyO3dvcmRzJiMzMjt3b3VsZCYjMzI7YmUmIzMyO2EmIzMy
O2dvb2QNCiZndDsmIzMyO3BsYWNlJiMzMjt0byYjMzI7c3RhcnQNCg0KJiMxNjA7DQpIaSYjMzI7
Q29ub3IsDQoNCkFib3V0JiMzMjtmdWxsJiMzMjt3b3JkcywmIzE2MDsNCkRvJiMzMjt5b3UmIzMy
O21lYW4mIzMyO3dvcmRzJiMzMjtsaWtlJiMzMjt0aGlzJiM2MzsmIzE2MDsNCm11bHRpbWVkaWEt
ZGlzcGxheS1wYXRoLXJlc2l6ZXImIzYzOw0Kb3ImIzMyO21kcC1yZXNpemVyJiM2MzsNCg0KV2Um
IzMyO2ZvdW5kJiMzMjt0aGF0JiMzMjsmcXVvdDttZHAtcnN6JnF1b3Q7JiMzMjt0aGlzJiMzMjtr
aW5kJiMzMjtvZiYjMzI7d29yZCYjMzI7aXMmIzMyO3VzZWQmIzMyO2F0DQpodHRwczovL2dpdGh1
Yi5jb20vdG9ydmFsZHMvbGludXgvYmxvYi9tYXN0ZXIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRp
YXRlay9tdDgxODMuZHRzaQ0KDQpJJiMzOTttJiMzMjtub3QmIzMyO3N1cmUmIzMyO3doYXQmIzMy
O3dpbGwmIzMyO2JlJiMzMjtiZXR0ZXIuDQpDYW4mIzMyO3lvdSYjMzI7cHJvdmlkZSYjMzI7bW9y
ZSYjMzI7ZGV0YWlsZWQmIzMyO3N1Z2dlc3Rpb24mIzMyO2Fib3V0JiMzMjt0aGlzJiMzMjtuYW1p
bmcmIzYzOw0KDQpUaGFuayYjMzI7eW91DQoNCg0KQlIsDQpTdW5ueSYjMzI7U2hlbg0KDQoNCjwv
cHJlPg0KPC9wPjwvYm9keT48L2h0bWw+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioq
KioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UNCiAqKioqKioqKioqKioq
KioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdl
IChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHByb3By
aWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUg
dW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9u
bHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9u
LCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMg
ZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBp
ZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5
b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGll
dmUNCiANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFz
ZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUt
bWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVk
aW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xv
c2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsg
eW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_007_1437790065.1579859777--

