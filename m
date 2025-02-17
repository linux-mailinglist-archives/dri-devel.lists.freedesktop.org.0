Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE7BA37B23
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 07:02:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A112F10E30B;
	Mon, 17 Feb 2025 06:02:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="DMaeMvcc";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="kHZda9nb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50CD710E247
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 06:02:08 +0000 (UTC)
X-UUID: b45b31a0ecf411ef8eb9c36241bbb6fb-20250217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=y7s2NyxBobAq1L53XALdWTopy6BLWtJ1w9n+MTYt218=; 
 b=DMaeMvccGXmiRqfqXNA5nhwjoyonMbiWYoiVpM6UpwLu4ixcvk5cqMSTQ0uks9SScu3040yQZmxVJ/QW3RtVDl0AWhncUrIC45kdxY88ysrmJXhfNV6g6cmlN6kSvQvmak9H375i8SGqPk8kMpJyrElcgcehbRReoASsLg3mipM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46, REQID:405b214c-25e9-41ec-9fcc-2ebf2dc15370, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:60aa074, CLOUDID:8ca3dd24-96bd-4ac5-8f2e-15aa1ef9defa,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
 EDM:-3,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
 A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: b45b31a0ecf411ef8eb9c36241bbb6fb-20250217
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 910139840; Mon, 17 Feb 2025 14:02:01 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 17 Feb 2025 14:02:00 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1258.28 via Frontend Transport; Mon, 17 Feb 2025 14:01:59 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cx9G8S0P8uFcqiTLWVTseNlyc/pNj/X3bsCC/QDoHa2dCLIjlPYrPH1aOzz0hSUgplWKcuccfl5ktsNRa67aBLNk+PPS4fpYcYezaSSvcshvm7v6aN1FX2zQzY85SIs0u10+u078LUqxAPZHKOFBu3bweXf5UihxNM5dJIz3tnBc3gNmThzzgPTwaxQPXvB42AABVlDwWRD1Bentl07ytLOIwzq9I3boOFqDiRSC+g8eje08nxPMX8bZnBSiixmPkBTkkIj5Uz1o3PuGODy9T2vW0Qq6he9Ea9Yf7eO/ZLvUVksClop+EnkV1D8qnLBj8NzUYA09RdPb5SVC3lYt9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uJtgkd0dTUG8x+Xu3OqGYqdI60aWZY3G4gEDwfJjxCo=;
 b=tMBFRPzLGN1etUl8HaIjKg4nAavzjGDD3IFu3hSKdvoShYHKhKcXIVuK2RQu+rkDrcHMthRNX3cpWypDwOrXfEW2sdVQoh3vBW4hlkI2ca+dzgieLVA/ZX5RVPjCM8zR364oLBB3tCd/Vj5Ms/riOmh6BoPo7uvx7+3U3iRVLNmOsmzKyvzftR5mBK6nArhGjfZLcTXid39b1f7ayWbHEsg2ANw0q/tiM1QpCYprb8wNiEhNzU2Q6gvgypvjlcl7oz4J3LnimTS3R1/25ERGbY/MMgon/E5laNXtFN+YVzVhaWuaBwZ7DtkmF1CbPfKhSoBbeKKZohK/hP+4WJyciQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uJtgkd0dTUG8x+Xu3OqGYqdI60aWZY3G4gEDwfJjxCo=;
 b=kHZda9nbZOnFZJVdQQDtc6LQJCoPJjUWQCQAaxL3lH1V2aWVSItJx6U7sYTvrX19eda4XomFvV70w8f3Pdn6t/ibs98svVH9rQOmSHI8ML9qgss5+UPy+qkI5QMXSEIy7vfXQx9iufdv4cwavPkrw4bXcQag5wllITn3jmBUFe0=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by OSQPR03MB8459.apcprd03.prod.outlook.com (2603:1096:604:271::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 06:01:56 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8445.013; Mon, 17 Feb 2025
 06:01:56 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>,
 =?utf-8?B?U3VubnkgU2hlbiAo5rKI5aeN5aeNKQ==?= <Sunny.Shen@mediatek.com>
CC: =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "treapking@chromium.org" <treapking@chromium.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>
Subject: Re: [PATCH 1/5] dt-bindings: display: mediatek: mdp-rsz: Add rules
 for MT8196
Thread-Topic: [PATCH 1/5] dt-bindings: display: mediatek: mdp-rsz: Add rules
 for MT8196
Thread-Index: AQHbfDA5KwgEI7cZvk6FVj94kpxDTbNLCoSA
Date: Mon, 17 Feb 2025 06:01:56 +0000
Message-ID: <a70c23487f3b3458ad21a61a4b8d16f47b75438b.camel@mediatek.com>
References: <20250211025317.399534-1-sunny.shen@mediatek.com>
 <20250211025317.399534-2-sunny.shen@mediatek.com>
In-Reply-To: <20250211025317.399534-2-sunny.shen@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|OSQPR03MB8459:EE_
x-ms-office365-filtering-correlation-id: 7ed85960-1871-4179-5a49-08dd4f189588
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?RFBlMzg5SC9DUTR0V3RHK2dveTZiSVNMMTZqZ3VZZTZyeVMzamdRZ0o0MHhY?=
 =?utf-8?B?eUc4SXFJVnVWR0czcGkxZmdSblVzQ0tkSC9QZjZOZllzV3BRbHhxODNTc3Rl?=
 =?utf-8?B?Sm1wVHM2bDYwYTlUTEtYcFA5V0JKbWFzeEM2Vjc5VjlzcW1YclRBRzBxWHU4?=
 =?utf-8?B?TDU5cGJkV3V3M3lxbFpLMWRkZnRKQlRGVy9teEtaQ2x5ZjRpNXd5ZkZCQlVF?=
 =?utf-8?B?VnJQRmxsZ1F0bmZwKzd0dGxCZjFjL08wYS9BQ3ZFaWpyZ0NveUxCOGNURDRU?=
 =?utf-8?B?RnhjY29xbGlFT2NtMVFXWitPclJ5NFVnOFNnM0tsV3pYak9iMmdmc0NnS2xL?=
 =?utf-8?B?SGI0cjlGaEMxUjNlQXVhVzFZU1VLMCsxRXFZd2FrRWNnR1VjZFpVTkpDVHdP?=
 =?utf-8?B?SW1vY0QxYVNWTVdtL3llVUEvVmFZVFZISW9BYU5ObTlrcEpsajIyNDQxSXQ0?=
 =?utf-8?B?eStzWDJnbWNpMDZWczhjdm9Gdm1QNEJsRE4weWJCTkVXRllYQ21sK1BEOHps?=
 =?utf-8?B?aU4xdVk1WE1uWjFMVncyS0xQVXVSNWp4bmVXQXkxa3lIQ08xRVA0TlA5cERj?=
 =?utf-8?B?V3F3YW1QbmVVUnQ2cjl1NjU3c0RnRjFsVEt2eGNnalF0Tld4YnUrSnJncDJN?=
 =?utf-8?B?bW1CaVJ0TktaNU5nNnkxam81UzRhUExJVHBjUmwrai9hOXJJclJOZU92SHBw?=
 =?utf-8?B?eVlLQzBGWXVoSmRHL202amRuWkpnaVJGUGZkRE5XZzZoM1U2OHg2QWlIcXND?=
 =?utf-8?B?cm5xeFBibXI1cXFxWHhIeHloYU1EaVJURENrU05aakpFWWVtdlp1aUdkRnFR?=
 =?utf-8?B?UW91VTRzLzNUa1FxQ2RGTmlxOTRnMHpQTUErWkREQUZqQlU5T2VHeUgvbndK?=
 =?utf-8?B?TmFZcWxvSWkvb25CUnhNSGtyYndKcHI2aGlDcUhaUUZFR082ZHdOOWZnRVh4?=
 =?utf-8?B?Q21JOStuREZXY1pjZkp6SllWYWZuN2h0WnhUb3NNWEF5N0IrS3BZSmxuVGN1?=
 =?utf-8?B?d2hsamtxUzFTR2pHaUdrYUh1WnNsV2tGVXVzT0NKeHg1U3RndDNxVEpxWEdJ?=
 =?utf-8?B?NjRIVktkVnhzQTM5ZFI4QkJDYUlRZGZBbG9SRnJHU0dSbnY5Y244c3FkR0Zp?=
 =?utf-8?B?M0FSRnlYbXlURDVHV1hLVHB2WE1uUEh1MDZrVWJCV1ZwaXhHQUZIV2JqTDla?=
 =?utf-8?B?bmhRSjY5R2l5WWc4OG1DZGppQitQYzJGQ0FRVHJKUU9DVUYrQnN2UzRjSVF1?=
 =?utf-8?B?b1hyRDlMVFNkL1VvQ0p4TkhvcU9HVlViMnI2QUN0cnVSQzF5U0JkY3lpODFW?=
 =?utf-8?B?OCt4YnVVdmVsUno0dDRRWTF5OTlWT3ZGWW1WQUE2WUVVb21kNlBlVnVLekJ6?=
 =?utf-8?B?dnlTNlZYR29JeHdLNGNaOFA1QnV1KzFWNWg3NVh4TTVWWFBvOTJnYjBrcjNk?=
 =?utf-8?B?cmYxa0JWaU45dUJoemRzcFpzeVVPTlBORGZQcmlZS3VwV0RVMGhkV2pCeGxw?=
 =?utf-8?B?SVRMNlBYb01XOTRLSjE3QlkwMExGczJLc2F4YlN2OFdqSkU1SWlscWZUSFJh?=
 =?utf-8?B?Y0RGTy95S2tua3ppZ0lXeUlRYmZzckJoeDJIYWt4ZlUrM2dQaVNrN3FBY0pH?=
 =?utf-8?B?d01HNVgyTUh0Z3pZN0hDTE1Uck52eDJpTDJDYUlsVnZmbXg3SXcrbU5KUFNt?=
 =?utf-8?B?WVltZjlnZ1Jlb3dnbGg1emlaT2YxdFlPWDV3MnZucVVhd0JrVDJtS3l0ZmFD?=
 =?utf-8?B?d1FkRytKL3N6ZitocVBDZDBkWWJzcnRtOXJzZEVzYVRxeWwxT2FDV2pnSXZ5?=
 =?utf-8?B?ajdZU1ozYTNvSEdjaiswTldYYkZtN2o5NDRVci9ZU3B4NlBmS3ZwM3pPbnkx?=
 =?utf-8?B?d3U4b3NKUDUzWGpWTUZxMmJIRTFtRHhFV2cxOW5rS2cwdlE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ekhBaEZDVDlSa05GbjBSclJDcndiOGZ4U3VqaEZLdHdmZVkxbis2SUZsRkly?=
 =?utf-8?B?REc4YkM3RXc2RU9BVVZpbytwY3NZYStiQ3Z4RnFsMnRncmlBVzZmeWhkd1pG?=
 =?utf-8?B?OERkUkNNbEhQMUlaQmdKZVROYnF0czNLMWtxcjY5L2lhTWJDMVBIZHpZT2RQ?=
 =?utf-8?B?UEVPQ3IzdlRFd25MNnArYmFVUkE2TWVLLy9kY3NTaHgyUUo3R2h2Z3hkR0ZL?=
 =?utf-8?B?VDlzV1laMVlvN2xYWTQvV1IrZkxSSHJMdjcwQ2k5eVd5V00yU1NFWTJEd1JQ?=
 =?utf-8?B?eXc5MkZpcVNNYjFPYWZnM1ZUMlNDQ2RNUVJPN1NjNExVaTkwZlhUc3RqU09o?=
 =?utf-8?B?dHk5akFMb1VvUEw0UllRMkpndGJGS2Y0QXJTZHkvWlVvM2h2N1RxOVF0eldH?=
 =?utf-8?B?c0ZlQUkwRjc0Z3lNQVBhaUQ2eVRlRkR5Ui9STnpIUE9henlKUU4yKzYzaGpl?=
 =?utf-8?B?bkViWjdWZUVBc1VBdkt5OG5lMlNEeHQ4UzJYd1RDZzBjZ29IM2ZxSlhORmlH?=
 =?utf-8?B?YklUZFlpcWo3eVpvTk53UndFMTNhcEM2UWV4VEl1bGxGNGVQMW9DZVUzMWJW?=
 =?utf-8?B?U092cWU5bk5FUWhQU2xta3hDdnFkNCtnemgxemFleGM1M3JSdjF4d0lQYUZ5?=
 =?utf-8?B?R01nYVZUM3U4UHN6RjUxR1JUQjlOb29NM1J5U1hKRDhKTVhFUzhlNXE2MlBi?=
 =?utf-8?B?cU95YmFnRzk4T3Vtc3pFY2VhSGtKalJheUNYdnNtVFMwaHByejQ4TStMb3ZD?=
 =?utf-8?B?U093L2wwVUlYdHc3UkdMamlWd3pTZVVEZGNKNVV4OTJtdkRDbEovVjhWS0wy?=
 =?utf-8?B?RW1OcjBQUktXNCtoaWtGZXp5VFZ3Wjh5SnFteUVBV2lNbzlSV2tKUHcvNGxD?=
 =?utf-8?B?Y1lEdEJyRUtIZWk3QzRBM0dnNDI5MjdRZkFOT0kxOS9zN25tVlRYd3NHNUlo?=
 =?utf-8?B?dFhrdks5ZjZmR2NKb1RjaVJhZC9Qb3N5Vm5hTmZEWElyUDNta0d0STlmbGhV?=
 =?utf-8?B?MlUxMDV1K3NOOFc2RWhzSkJ3b1hKb3E1RU83TTI1RnhIdnZhRVVXZWphTHJV?=
 =?utf-8?B?cGxrZ0R2eGhDYlVjZ0wrbWd4OTR3UHNGUEZSUGxoOUJ4dGR0KzVaN2x5SlhH?=
 =?utf-8?B?SXNKZ09DT1hkUTM0K1pRMG1VUEtsSFowaCswK3owSGR3SndibURQUll4L29X?=
 =?utf-8?B?Mm9wWDliVXRyeTUrRURBR2I5dXJSOGx4Y1gwVjJTaFZiQ2hyQStCOURNOXZn?=
 =?utf-8?B?QXRXRmwvOTRNM2pteGJKOHAwb0dwamxrcGx5Sys1NExnRUptak5YRFdqWlpX?=
 =?utf-8?B?bzJ3bWJKZmFPbytnaFcrUDg0aHZOeWQxRVZraXFQNjVOeE1vVGp6YlFoWTUy?=
 =?utf-8?B?aFduSkI0bmNIQStUWXIxRi82bVpEeDM5TVIwTEUvMzMrNHpRWXQ2L1J4RlhE?=
 =?utf-8?B?bDBJWWZPKzh0bE9xZnp1NmJTanNCaVhpZjZxSVFyUUNPamtMbExoZkZ6N3ZU?=
 =?utf-8?B?U3pIc3dsWEpFWkpBNFdFQVRWS0lZbjR4RENnWEpsR2lFTlBqUGFROE1EUDFQ?=
 =?utf-8?B?b1hiVUxta2tMZTRFM1J4WnB4RlAzd0NsTmp4ck16akxNbnNXZFFBRWdTL0hT?=
 =?utf-8?B?dXA3MkE2amtxNkR4VmFLMGxYWkc3RWpqejdKcmZYVzZLZjB4Sk8rc3I5d0h0?=
 =?utf-8?B?d2ovUU9ZWnJQemczY1dtY05RMEw2ZTYyak1VNEZiNjZET1M1dkJEcVhHbU5D?=
 =?utf-8?B?QW1iTHBQSGRiKzF3QkRGamYxL3VOYkhCWFlCZWFjL0F0T1FXeFNQKzNsZzA5?=
 =?utf-8?B?SStRZVZPaHNIMnBjdDhraFZtbFp2dFBjVGlXYjNtMFBhZllNcmxaYlBQbkxQ?=
 =?utf-8?B?M1MwSk1vaktmdUhtOEsxVllKdUZhaU5ubi9LcFd4TUJxaHRNQjM0Rm40bENX?=
 =?utf-8?B?dE9HbVRRbDEweVNHQlkxakhTczliTGk5RjBxN3JFdzFJelZRN2ZNMWxyQ3RX?=
 =?utf-8?B?MGw4bEhHbUdqczF3SWJWVjdja1JEaDhTQ0pucm5BU2xGNStTazhPektibE9u?=
 =?utf-8?B?R3k5N2lTR3lhb3h5T1lZSlZXcEplc04vOW9aRmptMEw5ZFNETDNza3lYY0hB?=
 =?utf-8?Q?24Za6uyqpV9lmWByP8L3h3XWc?=
Content-ID: <31C504B5E1AFDA41A90DCF4FCC05C48C@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ed85960-1871-4179-5a49-08dd4f189588
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2025 06:01:56.2537 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TbHSCoSQj4eRHvns/vm1e6Ghy0GjoQlalYns5D60Ubc5WW6HGhie1l8ECdCgZg9a9dfZkvBwrlX3hfJzDETI1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR03MB8459
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_002_1641270940.85823080"
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

--__=_Part_Boundary_002_1641270940.85823080
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDI1LTAyLTExIGF0IDEwOjUyICswODAwLCBTdW5ueSBTaGVuIHdyb3RlOg0KPiBB
ZGQgTURQLVJTWiBoYXJkd2FyZSBkZXNjcmlwdGlvbiBmb3IgTWVkaWFUZWsgTVQ4MTk2IFNvQw0K
PiANCj4gU2lnbmVkLW9mZi1ieTogU3VubnkgU2hlbiA8c3Vubnkuc2hlbkBtZWRpYXRlay5jb20+
DQo+IC0tLQ0KPiAgLi4uL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssbWRwLXJzei55YW1sICAg
IHwgNDYgKysrKysrKysrKysrKysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDQ2IGluc2VydGlv
bnMoKykNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxtZHAtcnN6LnlhbWwNCj4gDQo+IGRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRl
ay9tZWRpYXRlayxtZHAtcnN6LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxtZHAtcnN6LnlhbWwNCj4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMDAwLi42NjQyYjlhYTY1MWENCj4gLS0tIC9kZXYv
bnVsbA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9t
ZWRpYXRlay9tZWRpYXRlayxtZHAtcnN6LnlhbWwNCj4gQEAgLTAsMCArMSw0NiBAQA0KPiArIyBT
UERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpDQo+
ICslWUFNTCAxLjINCj4gKy0tLQ0KPiArJGlkOiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19f
aHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxt
ZHAtcnN6LnlhbWwqX187SXchIUNUUk5LQTl3TWcwQVJidyFqbzktRXpuNUdSOHdmRENNWDcyenJy
cHhsTUVZYi01dzUyVFlpbk5Xc1FsZnBpUGp3NVI5NjdKSVUwLTZXbkk1ZnZJVTctdjBJVmFSQUxC
bFc0YUwkIA0KPiArJHNjaGVtYTogaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHA6Ly9k
ZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sKl9fO0l3ISFDVFJOS0E5d01nMEFS
Yncham85LUV6bjVHUjh3ZkRDTVg3MnpycnB4bE1FWWItNXc1MlRZaW5OV3NRbGZwaVBqdzVSOTY3
SklVMC02V25JNWZ2SVU3LXYwSVZhUkFJSU1XOFRKJCANCj4gKw0KPiArdGl0bGU6IE1lZGlhVGVr
IGRpc3BsYXkgbXVsdGltZWRpYSBkYXRhIHBhdGggcmVzaXplcg0KPiArDQo+ICttYWludGFpbmVy
czoNCj4gKyAgLSBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4NCj4gKyAg
LSBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPg0KPiArDQo+ICtkZXNjcmlw
dGlvbjogfA0KPiArICBNZWRpYVRlayBkaXNwbGF5IG11bHRpbWVkaWEgZGF0YSBwYXRoIHJlc2l6
ZXIsIG5hbWVseSBNRFAtUlNaLA0KPiArICBjYW4gZG8gc2NhbGluZyB1cC9kb3duIHRvIHRoZSBw
aWN0dXJlLg0KPiArDQo+ICtwcm9wZXJ0aWVzOg0KPiArICBjb21wYXRpYmxlOg0KPiArICAgIGNv
bnN0OiBtZWRpYXRlayxtdDgxOTYtZGlzcC1tZHAtcnN6DQoNClJlZmVyZW5jZSB0byBvdGhlciBk
aXNwbGF5IG1kcCBkZXZpY2UgY29tcGF0aWJsZSwgdXNlDQoNCm1lZGlhdGVrLG10ODE5Ni1tZHAt
cnN6DQoNClJlZ2FyZHMsDQpDSw0KDQo+ICsNCj4gKyAgcmVnOg0KPiArICAgIG1heEl0ZW1zOiAx
DQo+ICsNCj4gKyAgY2xvY2tzOg0KPiArICAgIGl0ZW1zOg0KPiArICAgICAgLSBkZXNjcmlwdGlv
bjogTURQLVJTWiBDbG9jaw0KPiArDQo+ICtyZXF1aXJlZDoNCj4gKyAgLSBjb21wYXRpYmxlDQo+
ICsgIC0gcmVnDQo+ICsgIC0gY2xvY2tzDQo+ICsNCj4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBm
YWxzZQ0KPiArDQo+ICtleGFtcGxlczoNCj4gKyAgLSB8DQo+ICsgICAgc29jIHsNCj4gKyAgICAg
ICAgI2FkZHJlc3MtY2VsbHMgPSA8Mj47DQo+ICsgICAgICAgICNzaXplLWNlbGxzID0gPDI+Ow0K
PiArDQo+ICsgICAgICAgIGRpc3BfbWRwX3JzejA6IGRpc3AtbWRwLXJzejBAMzIxYTAwMDAgew0K
PiArICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTYtZGlzcC1tZHAtcnN6
IjsNCj4gKyAgICAgICAgICAgIHJlZyA9IDwwIDB4MzIxYTAwMDAgMCAweDEwMDA+Ow0KPiArICAg
ICAgICAgICAgY2xvY2tzID0gPCZkaXNwc3lzX2NvbmZpZ19jbGsgMTAxPjsNCj4gKyAgICAgICAg
fTsNCj4gKyAgICB9Ow0KDQo=

--__=_Part_Boundary_002_1641270940.85823080
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1R1ZSwmIzMyOzIwMjUtMDItMTEmIzMyO2F0
JiMzMjsxMDo1MiYjMzI7KzA4MDAsJiMzMjtTdW5ueSYjMzI7U2hlbiYjMzI7d3JvdGU6DQomZ3Q7
JiMzMjtBZGQmIzMyO01EUC1SU1omIzMyO2hhcmR3YXJlJiMzMjtkZXNjcmlwdGlvbiYjMzI7Zm9y
JiMzMjtNZWRpYVRlayYjMzI7TVQ4MTk2JiMzMjtTb0MNCiZndDsmIzMyOw0KJmd0OyYjMzI7U2ln
bmVkLW9mZi1ieTomIzMyO1N1bm55JiMzMjtTaGVuJiMzMjsmbHQ7c3Vubnkuc2hlbkBtZWRpYXRl
ay5jb20mZ3Q7DQomZ3Q7JiMzMjstLS0NCiZndDsmIzMyOyYjMzI7Li4uL2Rpc3BsYXkvbWVkaWF0
ZWsvbWVkaWF0ZWssbWRwLXJzei55YW1sJiMzMjsmIzMyOyYjMzI7JiMzMjt8JiMzMjs0NiYjMzI7
KysrKysrKysrKysrKysrKysrKw0KJmd0OyYjMzI7JiMzMjsxJiMzMjtmaWxlJiMzMjtjaGFuZ2Vk
LCYjMzI7NDYmIzMyO2luc2VydGlvbnMoKykNCiZndDsmIzMyOyYjMzI7Y3JlYXRlJiMzMjttb2Rl
JiMzMjsxMDA2NDQmIzMyO0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L21lZGlhdGVrL21lZGlhdGVrLG1kcC1yc3oueWFtbA0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtkaWZm
JiMzMjstLWdpdCYjMzI7YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9tZWRpYXRlay9tZWRpYXRlayxtZHAtcnN6LnlhbWwmIzMyO2IvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssbWRwLXJzei55YW1sDQom
Z3Q7JiMzMjtuZXcmIzMyO2ZpbGUmIzMyO21vZGUmIzMyOzEwMDY0NA0KJmd0OyYjMzI7aW5kZXgm
IzMyOzAwMDAwMDAwMDAwMC4uNjY0MmI5YWE2NTFhDQomZ3Q7JiMzMjstLS0mIzMyOy9kZXYvbnVs
bA0KJmd0OyYjMzI7KysrJiMzMjtiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLG1kcC1yc3oueWFtbA0KJmd0OyYjMzI7QEAmIzMyOy0w
LDAmIzMyOysxLDQ2JiMzMjtAQA0KJmd0OyYjMzI7KyMmIzMyO1NQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiYjMzI7KEdQTC0yLjAtb25seSYjMzI7T1ImIzMyO0JTRC0yLUNsYXVzZSkNCiZndDsmIzMy
OyslWUFNTCYjMzI7MS4yDQomZ3Q7JiMzMjsrLS0tDQomZ3Q7JiMzMjsrJiMzNjtpZDomIzMyO2h0
dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9k
aXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLG1kcC1yc3oueWFtbCpfXztJdyEhQ1RSTktBOXdNZzBB
UmJ3IWpvOS1Fem41R1I4d2ZEQ01YNzJ6cnJweGxNRVliLTV3NTJUWWluTldzUWxmcGlQanc1Ujk2
N0pJVTAtNlduSTVmdklVNy12MElWYVJBTEJsVzRhTCYjMzY7JiMzMjsNCiZndDsmIzMyOysmIzM2
O3NjaGVtYTomIzMyO2h0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwOi8vZGV2aWNldHJl
ZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCpfXztJdyEhQ1RSTktBOXdNZzBBUmJ3IWpvOS1F
em41R1I4d2ZEQ01YNzJ6cnJweGxNRVliLTV3NTJUWWluTldzUWxmcGlQanc1Ujk2N0pJVTAtNldu
STVmdklVNy12MElWYVJBSUlNVzhUSiYjMzY7JiMzMjsNCiZndDsmIzMyOysNCiZndDsmIzMyOyt0
aXRsZTomIzMyO01lZGlhVGVrJiMzMjtkaXNwbGF5JiMzMjttdWx0aW1lZGlhJiMzMjtkYXRhJiMz
MjtwYXRoJiMzMjtyZXNpemVyDQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrbWFpbnRhaW5lcnM6DQom
Z3Q7JiMzMjsrJiMzMjsmIzMyOy0mIzMyO0NodW4tS3VhbmcmIzMyO0h1JiMzMjsmbHQ7Y2h1bmt1
YW5nLmh1QGtlcm5lbC5vcmcmZ3Q7DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOy0mIzMyO1BoaWxpcHAm
IzMyO1phYmVsJiMzMjsmbHQ7cC56YWJlbEBwZW5ndXRyb25peC5kZSZndDsNCiZndDsmIzMyOysN
CiZndDsmIzMyOytkZXNjcmlwdGlvbjomIzMyO3wNCiZndDsmIzMyOysmIzMyOyYjMzI7TWVkaWFU
ZWsmIzMyO2Rpc3BsYXkmIzMyO211bHRpbWVkaWEmIzMyO2RhdGEmIzMyO3BhdGgmIzMyO3Jlc2l6
ZXIsJiMzMjtuYW1lbHkmIzMyO01EUC1SU1osDQomZ3Q7JiMzMjsrJiMzMjsmIzMyO2NhbiYjMzI7
ZG8mIzMyO3NjYWxpbmcmIzMyO3VwL2Rvd24mIzMyO3RvJiMzMjt0aGUmIzMyO3BpY3R1cmUuDQom
Z3Q7JiMzMjsrDQomZ3Q7JiMzMjsrcHJvcGVydGllczoNCiZndDsmIzMyOysmIzMyOyYjMzI7Y29t
cGF0aWJsZToNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyO2NvbnN0OiYjMzI7bWVkaWF0
ZWssbXQ4MTk2LWRpc3AtbWRwLXJzeg0KDQpSZWZlcmVuY2UmIzMyO3RvJiMzMjtvdGhlciYjMzI7
ZGlzcGxheSYjMzI7bWRwJiMzMjtkZXZpY2UmIzMyO2NvbXBhdGlibGUsJiMzMjt1c2UNCg0KbWVk
aWF0ZWssbXQ4MTk2LW1kcC1yc3oNCg0KUmVnYXJkcywNCkNLDQoNCiZndDsmIzMyOysNCiZndDsm
IzMyOysmIzMyOyYjMzI7cmVnOg0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7bWF4SXRl
bXM6JiMzMjsxDQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrJiMzMjsmIzMyO2Nsb2NrczoNCiZndDsm
IzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyO2l0ZW1zOg0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOy0mIzMyO2Rlc2NyaXB0aW9uOiYjMzI7TURQLVJTWiYjMzI7Q2xvY2sN
CiZndDsmIzMyOysNCiZndDsmIzMyOytyZXF1aXJlZDoNCiZndDsmIzMyOysmIzMyOyYjMzI7LSYj
MzI7Y29tcGF0aWJsZQ0KJmd0OyYjMzI7KyYjMzI7JiMzMjstJiMzMjtyZWcNCiZndDsmIzMyOysm
IzMyOyYjMzI7LSYjMzI7Y2xvY2tzDQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrYWRkaXRpb25hbFBy
b3BlcnRpZXM6JiMzMjtmYWxzZQ0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7K2V4YW1wbGVzOg0KJmd0
OyYjMzI7KyYjMzI7JiMzMjstJiMzMjt8DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjtz
b2MmIzMyO3sNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7I2FkZHJlc3MtY2VsbHMmIzMyOz0mIzMyOyZsdDsyJmd0OzsNCiZndDsmIzMyOysmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7I3NpemUtY2VsbHMmIzMyOz0mIzMyOyZs
dDsyJmd0OzsNCiZndDsmIzMyOysNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7ZGlzcF9tZHBfcnN6MDomIzMyO2Rpc3AtbWRwLXJzejBAMzIxYTAwMDAm
IzMyO3sNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjtjb21wYXRpYmxlJiMzMjs9JiMzMjsmcXVvdDttZWRpYXRlayxt
dDgxOTYtZGlzcC1tZHAtcnN6JnF1b3Q7Ow0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3JlZyYjMzI7PSYjMzI7Jmx0
OzAmIzMyOzB4MzIxYTAwMDAmIzMyOzAmIzMyOzB4MTAwMCZndDs7DQomZ3Q7JiMzMjsrJiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7Y2xv
Y2tzJiMzMjs9JiMzMjsmbHQ7JmFtcDtkaXNwc3lzX2NvbmZpZ19jbGsmIzMyOzEwMSZndDs7DQom
Z3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO307DQomZ3Q7
JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjt9Ow0KDQoNCjwvcHJlPg0KPC9wPjwvYm9keT48L2h0
bWw+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVLIENv
bmZpZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioqKioqKioqKioNClRoZSBpbmZvcm1hdGlv
biBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0dGFj
aG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Ig
b3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4g
SXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJl
Y2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHByaW50
aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cyAN
CmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9o
aWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQg
cmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlIA0KdGhhdCB5b3UgaGF2ZSByZWNl
aXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1t
ZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxs
IGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9t
IHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUt
bWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_002_1641270940.85823080--

