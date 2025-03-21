Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EBBA6B60F
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 09:29:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD88710E10A;
	Fri, 21 Mar 2025 08:29:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="XsmOIfK2";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="CZFxHj7N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63F3A10E29A
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 05:45:54 +0000 (UTC)
X-UUID: b9acb3e0061711f08eb9c36241bbb6fb-20250321
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=OclgmmcaZ8FvSz02Z3ybXAsBpZs+oeX38Jq0QVcESps=; 
 b=XsmOIfK2zjvwvUZzIa5F3IucWheUvwkKNyPqvg82lJ8qp+Ac7f3TdZzLl/lvxjNzrlqeLJX1BgFTZtNyH9tyO7mjsEwhCLh27xoVMZTR1KsnelBhDGosKO91L4hKPMrA32MNnpKVAK1Kqw+498xv0XuwdjssudGhV5MKpwxokQ0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1, REQID:25d4e709-e46c-40a9-b8d0-f4769ec4c63e, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:0ef645f, CLOUDID:0ba79ec6-16da-468a-87f7-8ca8d6b3b9f7,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
 EDM:-3,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
 A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: b9acb3e0061711f08eb9c36241bbb6fb-20250321
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by
 mailgw02.mediatek.com (envelope-from <sunny.shen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1175912300; Fri, 21 Mar 2025 13:45:41 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 21 Mar 2025 13:45:40 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1258.39 via Frontend Transport; Fri, 21 Mar 2025 13:45:40 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CkRvALHoQ/tpguJ7b5HpypvakV96X53ovqvBrtRbjuj4NRlIt/h7/Ap2b9/JLwYQyZ718SHjcauvQWSXiq3RINrqD3PdvbDAvvXYwVY3RcfKgGxPks1WYe3pFO6TIVzhxK0dg6qBN5LOVOgRiTXkR/sbO58hp7GWgNFBnPGDh7GM+bLwcejmo6gIeXBSsrXX/ImAqF0JBaJzIB3Z9a1CGEJBe/ZrI7qGOlC97Ug3LH75LyCZTTAhQECvuyLXIcXleoxaQv5nc8tbXCittHyr14uzVyyybp34OoXi6Xb3HKQdmJUQnYAKyhJJuUXGyWGxzub00ROCJMj8faEGJG5bNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TJGXg05MC443TSUdquSv/xWFbVBqXWREH02sT5sf4PE=;
 b=Rz5Bb0MIpGwl8JeHYRcuD+s2K10mwJViYB2f+IIvrve8CynHfB6STR5015xsv0Dxrk9YcEGE5gThgtxkbBYbaRWjJA4SIykBUyGnW5dS2cl9GzCheRTDOdDCvBQwchQNmxjjMWye2m+1c/bJZrRAeHVdmEe47qEu+IMO8m+CkOWqteWUusuioS486t9nWMVsTG0ekjs4Wvj8AKK2KTjyWTtY2LOpQhHLR38q26uahd89wW5TQnYchlAACwt72+6flxQddJ8eXdcUI+P6F53AhI6oflr4nGpmNfiP4r+fujxeiOes0nhcWKaB9bEaD/oad5PH5c/Pb56sIWV/MBi9Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TJGXg05MC443TSUdquSv/xWFbVBqXWREH02sT5sf4PE=;
 b=CZFxHj7NQVpKeos8mmcaD4Vx7JtxYbFMkNm2EeORNbNHhwWDy9UZnrnsoVn8SfXiasnWnHMQJpw9723smUWJoVEI4RxP5Cca55q56O+ybJS9Pe2KOBFKPZYGyYbbi5ChgiuDQ7+IN5SixDU1RplBgrfILcfYxp4ZXZ3AqjFmTio=
Received: from TY0PR03MB8330.apcprd03.prod.outlook.com (2603:1096:405:1a::6)
 by SEYPR03MB7664.apcprd03.prod.outlook.com (2603:1096:101:141::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.36; Fri, 21 Mar
 2025 05:45:19 +0000
Received: from TY0PR03MB8330.apcprd03.prod.outlook.com
 ([fe80::22a4:76d2:35ad:dadf]) by TY0PR03MB8330.apcprd03.prod.outlook.com
 ([fe80::22a4:76d2:35ad:dadf%4]) with mapi id 15.20.8534.034; Fri, 21 Mar 2025
 05:45:18 +0000
From: =?utf-8?B?U3VubnkgU2hlbiAo5rKI5aeN5aeNKQ==?= <Sunny.Shen@mediatek.com>
To: "conor@kernel.org" <conor@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?=
 <Paul-pl.Chen@mediatek.com>, "fshao@chromium.org" <fshao@chromium.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?=
 <Singo.Chang@mediatek.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "treapking@chromium.org" <treapking@chromium.org>,
 =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
Subject: Re: [PATCH 1/5] dt-bindings: display: mediatek: mdp-rsz: Add rules
 for MT8196
Thread-Topic: [PATCH 1/5] dt-bindings: display: mediatek: mdp-rsz: Add rules
 for MT8196
Thread-Index: AQHbfDA5jLoxTxf3wkWDuIJMLNCq1bNCY5mAgBLaqwCAAaZHAIAhirOAgAKrdYCAAjXFgA==
Date: Fri, 21 Mar 2025 05:45:18 +0000
Message-ID: <d2a680db6d9f4e9547b2ce8e4e0cb502de35149c.camel@mediatek.com>
References: <20250211025317.399534-1-sunny.shen@mediatek.com>
 <20250211025317.399534-2-sunny.shen@mediatek.com>
 <20250211-feed-shed-4b32f146cc54@spud>
 <029f9fd7ab898769a7ae627b160e1dce446ccc9e.camel@mediatek.com>
 <20250224-dreamland-tactile-bdb58daf6060@spud>
 <76a6fc25a09dfddb55fdaf0a9d7dcf9a6129b00f.camel@mediatek.com>
 <20250319-footnote-trusting-230e509bed07@spud>
In-Reply-To: <20250319-footnote-trusting-230e509bed07@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY0PR03MB8330:EE_|SEYPR03MB7664:EE_
x-ms-office365-filtering-correlation-id: 173836ea-04d5-4d71-b59e-08dd683b900c
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?R1M2TzFsT2MwaW5wQTFDTnhlVTZKU1RwQ2V2NTZtdVRUZXF4eDU5ckQrTnho?=
 =?utf-8?B?LzBhZUJvZ0h5dEZBVWVDN204d0VYeTFnQ21McHprTmtwMGVSS0lOcTdPeXg0?=
 =?utf-8?B?Ylp0ZWdlcE5KZDZFWjJQYWxSMzdzK1BLWXZ4ankyenh0SGZFQ2FiNmVTMHdL?=
 =?utf-8?B?ZlErTDBoSEdUMXNNTm5iS3hWa2JQNXdoOTNaU1IySjJvSkxUSTBSTkVRLzRL?=
 =?utf-8?B?UEN4MEJVM0dLd1JYWUZ4VnI3UXoxSm10cllURVIzTU9sSVYrR0tjTWJML3pW?=
 =?utf-8?B?aDExTkpEaGxSMTZhelFaYkovaWVmQkd2c24vdG1QVkJIdENuRkxCVDFBU3Q3?=
 =?utf-8?B?T3p6YkZNZU9VZmVqbXhzQ3Rzc0xydGJsS1N0RUsvaXB2TjBzKytGejF1N0t0?=
 =?utf-8?B?QUljWUNzMTgzUnh1eHNiTzlvaC9yT21JS1RNSlBqWkxUeUU0K2RMMWdjVFdR?=
 =?utf-8?B?ekRJckNiTUNHRCtMeW42Y1U3OGM1WllXK25odmVjYzVIWFpiaXZpYU9oRWRo?=
 =?utf-8?B?Z1U5Z1FydSsyYjhmWS9JYXRFQzJFT1UyOWRpeFJ4eTVwUkVDUmk0WlNybTBT?=
 =?utf-8?B?TjduNDdHalB6V0VJbC9UOGJYYklMbExyNnY5VkFpTWtpRUdhYmRrRElOaVZT?=
 =?utf-8?B?WEhKdlA3eFhzV3lsVm1xNzJJYUFOMTZXYjN2TEllb0YrSmNqMzNab2krbEpB?=
 =?utf-8?B?TUdIbG1uRXhHQWVSeGttb1A2MkxRZVNjQXd4NEVVZi8wdWEzeTBTcUg2cDBD?=
 =?utf-8?B?ZWJXNXVVWkVTVjZoamVKYlF1NG1oVmVQM3Jpc256UHY0ZlVhNnNVWGx1S2xV?=
 =?utf-8?B?Zm90RE9kVUE2dk9oQUJUbHNMNUhvTVU5S2E4cFFiZGtDa3NwemZVTVdsWFFz?=
 =?utf-8?B?M1cvNVlyVUppWklyejZkMjF2RjYrMXA5NlQ2MlZEL1BRRzludEVkOW91TEJa?=
 =?utf-8?B?ZmNrZ2ZVNE9QdE9qSTNuWTZXNFhFVkdoZFBzQVFKM2d6U1VLUHFKdU9ibmFx?=
 =?utf-8?B?cDQ1Ky9Ia0Y2ZGxRRUZhVjFNMk1Ocm5RVm5qT2FXTERxSUtCdGgxWityR1Uy?=
 =?utf-8?B?WVR1RDlya3NyUWpWZ1daVC9NTDRjZXZGa0ZTZGthR0ZlTEpURU92SEphUXMr?=
 =?utf-8?B?Z2hvTENoQWd2Q243Um5Ua3F4cVVVWjZ1R2JraGtUTHNqc1d2NUdMYml4RVhF?=
 =?utf-8?B?QVFZUStPSlFsWVlMQWFtaUdTc05aSDgwOHpiY2R6dG9HSFdoNEZUd01YUWpV?=
 =?utf-8?B?d1N6S0tYbHp2Y1NhQlA3VVNlRFpXRkQwQVo2dWJuOHI0Sy9aTUluTU1BWDNr?=
 =?utf-8?B?QWM5NG9mQmIvdm9neHpsaEQ4OHV1bmNWL013bS9IVUpHVkJYc2NTa01hRm9M?=
 =?utf-8?B?NlVYVTBPaEc2QXdHOGhpcDd2em9aS2lFQ2VyK1hjaHR6TmJiN0JLVlhmUG1h?=
 =?utf-8?B?ZWM0dFJGU0FRTXZjMjY5dm84d2dXNGt2TXlOV1cvNWtpQVc5RWduTkRjVUFK?=
 =?utf-8?B?aHdzRjJQWXNLb0VSWVFFWjRjeG9LQ21VejJ3VmxENEtIZHIxNHE5dkIyeEtC?=
 =?utf-8?B?VEt2Z2hZODNlTVE3a2VZeVAxQkZndXBnSjlENjEwQ1hGeXpHbi9MUGFlVWI3?=
 =?utf-8?B?MktuQlZqNkduR1ROSzIzVFFMVVQvL0F5SEdySE84VHNrU1YrMlZWRE83dHZI?=
 =?utf-8?B?NFNkR0N1Um5SZ1R5aTRkc3BqMGlIaHNVWUlXTmNiaUMyTlY5czByU29mVUJ5?=
 =?utf-8?B?dkFHUmpaL3VYOHZCcUZZcE55Z01nMWcxc2kwN1BLSUtkL0NLcDlETGNpVDls?=
 =?utf-8?B?bGE1b21peU1henlmblZJMmR4YUtweXBpWFZwOEdXcFlUR0I0M2NXeU1LWFJt?=
 =?utf-8?B?WTVIWFp1Y2ZPWTNUOUpVUjBVcFlvaXdrcTRLVWJJUTRqMlpCOEtWWGs4SUlo?=
 =?utf-8?B?Qjh3QnhuTlpCbkMwUjJWYnhnd3BTaUNBL0FiYmhiOVFLOE41RHpWeHVTZ24r?=
 =?utf-8?Q?SgbXJeuBBaunarfXI8M9QnTw2Q35bE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY0PR03MB8330.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cE1BZWVTSjhhU3kwRXFZY3JsU0c0T2lTQ1VqL210MmtQVkNKVDNPNXhpVlo0?=
 =?utf-8?B?Y1ZJU0hiMEpPWjdaZERHTk1RdlVaa3VyTjUvK0dWTEZwZDYvRWkrdVY2eW1V?=
 =?utf-8?B?U2VoVkQ0QVdZbXU2V2RiOUVITDRnQjhON2dWN01qZDE0QVNoY0x1WU9Dem1J?=
 =?utf-8?B?VVFYd0UrbFpkV3Uvbm9iRmFGaTlQMW5vK08xMnZrMXNIRkI0Z0c0ZmR5NkRu?=
 =?utf-8?B?dzVPQVA3cFUwUTJwV24wYWplQ0NJQUdORm9sRGlsR1UrS3pnMENwcndraWZo?=
 =?utf-8?B?T29LOTVlRi92TUgzWC9mNGYxRDV3OEhSTDJLaDc3WFljR2hGYkRXck1aY0Zl?=
 =?utf-8?B?c0xxSWxvbHlyRGVMbDYxaFYrRGNXbW82NDRsRThyc1czZUtLSmh3MHpIN3lM?=
 =?utf-8?B?SEVud1FtZUpnSVkrUGZPOU1iZ1BDdTZCYXVacmd2R0l3YmM5RGkzclA5Qzd2?=
 =?utf-8?B?djdzZk52Q1ppNXgxR1d4MGYvTmNxWGRNZkVWZ201aXNHOGZDZFZlZWpic0gr?=
 =?utf-8?B?ekFta2dSK2RVNXNlbDA2SWNITmk4T0tJQWplSGtIUG1aMWtWTVpFS1Z4RVNw?=
 =?utf-8?B?cGN1UC9kc1ZrdEJkWTNpNHZYZ3hDSHAyWDZxUEFjbzVPdlhpbUxzdDk2elpQ?=
 =?utf-8?B?TUJIL1NjMmprN3JJUGs2SDRXYUlFL3NYNUtqV21pUnJkcTMrOXAxL3ZicXJX?=
 =?utf-8?B?aHRkUGxGN2VxUGJFaHdCVGFQTjZaK0VIakIzWVZxR1NIcC9oWDRVYVRGU0xT?=
 =?utf-8?B?TzVCbS8rQkIrUzE5Y1hDRVVLNzllQWVHdnZIRllVeHN0WW8zWkRBbDBXS25z?=
 =?utf-8?B?ejFnd2x0RjVqbUdKL1pQSkN4VjN2YzBqNDd1S0JHVEpWMklLUXNFc09kbmJR?=
 =?utf-8?B?dzl6RnFGbUdwdHBkWXhscWpXcVg1ZU5BUjhyTjZSc1BxYXNoN3hRcnJ5Tzlp?=
 =?utf-8?B?V09WUWVqNUk4U1Z3bXB0bnRKdms0WllFN21aQzFoa2ZhTmtTVU52dkl1Um5L?=
 =?utf-8?B?RWxKMEFsYXZFckNlT0VqT3pobWNTOFk0YkZQeW9ibXdtczhYdTgxOEYwTHJR?=
 =?utf-8?B?OGVIRzRjeGJnSFFXczFKaGwrbmZ3WmdXREZxVE9qbG00ZEdZUkwzTXpWNlU5?=
 =?utf-8?B?bXRZd3g0ZXVzRGFPbW1IRWVadEkxeVJMRW5SWDlUQ2pWVUlaOWVWM0tUWHJB?=
 =?utf-8?B?d0YxNmtpekNMUFBCMGIxVVFZQW5vaGEyQThXWUQ3MEpQK2plVUI5WjJKT3Vp?=
 =?utf-8?B?WGVGdTQrVXhmVm51VUFjNExRSENnSG5Fdk94cnBCYi82TVpzQ0JEdzAwVTFt?=
 =?utf-8?B?M3JML3VqZ0xBSTZPNHFBS09lUWQ5YmxmVTRkUm5mOWttZEJyYlNCT2JiV1cr?=
 =?utf-8?B?YjdWSURmeVpTNVdUZHhMR0h2L2oxSFlrRHpGTHJ4aUI4a1YyQzJqN0VMK0c2?=
 =?utf-8?B?aTJ0R0pxQlB3cEc1anJwSzJuZy9HVjhrbWlFcmVRK2V2ZGZ4MEhZS3JxOE83?=
 =?utf-8?B?VkZoaUJFWURFUDFxcDRONWMvQWVPQ2RiN1pscmlxdDdPcTl5WG5DYVM2c2U0?=
 =?utf-8?B?UzFXZllocm1YRU8vd0FxVzFrajBNZVVucGJxUCtMTUh3bFlHYW9jOTNtS0ZJ?=
 =?utf-8?B?MWVHWFBsMElueVhlR1kzWUVaa2Q1MHkzdkVaSEYvOEthSmhsc2VndlFOZW5p?=
 =?utf-8?B?YnI3MERCT3ErYzgrTGZ1UnkrUDhIbFF0dTFjcnVNUnltbXh0MGNsT1FGMW8v?=
 =?utf-8?B?VGVpZ0xQR1lSVXJDaEQ1YzBkQS9nbWhUVUVYMkxHWHhicUI3TVlyYy9GR2hS?=
 =?utf-8?B?UVJSdEs1dVFzbTl6b0RUWlNzNlBYdVBNM0lPL2dRYWdrWkJLN0REN0grVFRL?=
 =?utf-8?B?MExZRndJOThoVFdkYWpOVmhDTzkxRjZTaDBrc0tsN005a3gyRDNTcUsxd3Vv?=
 =?utf-8?B?dmRqYStMNTM0dFN6S2ZnbnN1YjVsN0NjODhOYTZyRCtKTjQzRmRWWCtQeWlX?=
 =?utf-8?B?VUc5M01rcEduaTJEbld4ZkVzM2NSRTdiayt1S0czczhzMm5mZjNvSVloYWxG?=
 =?utf-8?B?cjArL2NrWTFWd3F3MWw1bndkK1ZyalkwTFpLdHNCb1QxNURWZmpVcVRPSjJn?=
 =?utf-8?B?Wi9nL21DRmlsQm9qdG90eFdmekszNTROL3FYbko2SUlydjdIWHpUNXFmcEJ3?=
 =?utf-8?B?MUE9PQ==?=
Content-ID: <83D3332E024BD743BC263CCC8F6B070D@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY0PR03MB8330.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 173836ea-04d5-4d71-b59e-08dd683b900c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2025 05:45:18.5153 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jn7gyPwe70oBe5xbqThFPnCrdszPR3hsjm7ANXfTO4t/17RjGqwvMVtC8bRZvIssarD8CmbQyEpEVwDvEF/l1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7664
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_009_1125010887.77186261"
X-Mailman-Approved-At: Fri, 21 Mar 2025 08:29:26 +0000
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

--__=_Part_Boundary_009_1125010887.77186261
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDI1LTAzLTE5IGF0IDIwOjAwICswMDAwLCBDb25vciBEb29sZXkgd3JvdGU6DQo+
IE9uIFR1ZSwgTWFyIDE4LCAyMDI1IGF0IDAzOjE0OjA3QU0gKzAwMDAsIFN1bm55IFNoZW4gKOay
iOWnjeWnjSkgd3JvdGU6DQo+ID4gT24gTW9uLCAyMDI1LTAyLTI0IGF0IDE5OjAxICswMDAwLCBD
b25vciBEb29sZXkgd3JvdGU6DQo+ID4gPiBPbiBTdW4sIEZlYiAyMywgMjAyNSBhdCAwNTo0OTo0
NVBNICswMDAwLCBTdW5ueSBTaGVuICjmsojlp43lp40pIHdyb3RlOg0KPiA+ID4gPiBPbiBUdWUs
IDIwMjUtMDItMTEgYXQgMTc6NTQgKzAwMDAsIENvbm9yIERvb2xleSB3cm90ZToNCj4gPiA+ID4g
PiBPbiBUdWUsIEZlYiAxMSwgMjAyNSBhdCAxMDo1Mjo1MEFNICswODAwLCBTdW5ueSBTaGVuIHdy
b3RlOg0KPiA+ID4gPiA+ID4gQWRkIE1EUC1SU1ogaGFyZHdhcmUgZGVzY3JpcHRpb24gZm9yIE1l
ZGlhVGVrIE1UODE5NiBTb0MNCj4gPiA+IA0KPiA+ID4gPiA+ID4gK2V4YW1wbGVzOg0KPiA+ID4g
PiA+ID4gK8KgIC0gfA0KPiA+ID4gPiA+ID4gK8KgwqDCoCBzb2Mgew0KPiA+ID4gPiA+ID4gK8Kg
wqDCoMKgwqDCoMKgICNhZGRyZXNzLWNlbGxzID0gPDI+Ow0KPiA+ID4gPiA+ID4gK8KgwqDCoMKg
wqDCoMKgICNzaXplLWNlbGxzID0gPDI+Ow0KPiA+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ID4gK8Kg
wqDCoMKgwqDCoMKgIGRpc3BfbWRwX3JzejA6IGRpc3AtbWRwLXJzejBAMzIxYTAwMDAgew0KPiA+
ID4gPiA+IA0KPiA+ID4gPiA+IEFuZCAiZGlzcC1tZHAtcnN6MCIgaXNuJ3QgYW55dGhpbmcgY2xv
c2UgdG8gYSBnZW5lcmljIG5vZGUNCj4gPiA+ID4gPiBuYW1lLg0KPiA+ID4gPiANCj4gPiA+ID4g
V2lsbCBtb2RpZnkgImRpc3AtbWRwLXJzejBAMzIxYTAwMDAiIHRvICJtZHAtcnN6QDMyMWEwMDAw
Ig0KPiA+ID4gDQo+ID4gPiBJIGRvbid0IHRoaW5rIHRoYXQncyBhbiBpbXByb3ZlbWVudC4gSGlu
dDogZnVsbCB3b3JkcyB3b3VsZCBiZSBhDQo+ID4gPiBnb29kDQo+ID4gPiBwbGFjZSB0byBzdGFy
dA0KPiA+IA0KPiA+IMKgDQo+ID4gSGkgQ29ub3IsDQo+ID4gDQo+ID4gQWJvdXQgZnVsbCB3b3Jk
cyzCoA0KPiA+IERvIHlvdSBtZWFuIHdvcmRzIGxpa2UgdGhpcz/CoA0KPiA+IG11bHRpbWVkaWEt
ZGlzcGxheS1wYXRoLXJlc2l6ZXI/DQo+ID4gb3IgbWRwLXJlc2l6ZXI/DQo+IA0KPiBUaGVzZSBh
cmUgYm90aCBpbXByb3ZlbWVudHMgb24gd2hhdCB5b3UndmUgZ290IHJpZ2h0IG5vdy4NCg0KT2th
eX4NCkknbGwgdXNlIG1kcC1yZXNpemVyIGZvciB0aGlzDQoNCg0KPiANCj4gPiBXZSBmb3VuZCB0
aGF0ICJtZHAtcnN6IiB0aGlzIGtpbmQgb2Ygd29yZCBpcyB1c2VkIGF0DQo+ID4gaHR0cHM6Ly9n
aXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2Jsb2IvbWFzdGVyL2FyY2gvYXJtNjQvYm9vdC9kdHMv
bWVkaWF0ZWsvbXQ4MTgzLmR0c2kNCj4gPiANCj4gPiBJJ20gbm90IHN1cmUgd2hhdCB3aWxsIGJl
IGJldHRlci4NCj4gPiBDYW4geW91IHByb3ZpZGUgbW9yZSBkZXRhaWxlZCBzdWdnZXN0aW9uIGFi
b3V0IHRoaXMgbmFtaW5nPw0KDQo=

--__=_Part_Boundary_009_1125010887.77186261
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1dlZCwmIzMyOzIwMjUtMDMtMTkmIzMyO2F0
JiMzMjsyMDowMCYjMzI7KzAwMDAsJiMzMjtDb25vciYjMzI7RG9vbGV5JiMzMjt3cm90ZToNCiZn
dDsmIzMyO09uJiMzMjtUdWUsJiMzMjtNYXImIzMyOzE4LCYjMzI7MjAyNSYjMzI7YXQmIzMyOzAz
OjE0OjA3QU0mIzMyOyswMDAwLCYjMzI7U3VubnkmIzMyO1NoZW4mIzMyOygmIzI3Nzg0OyYjMjI5
ODk7JiMyMjk4OTspJiMzMjt3cm90ZToNCiZndDsmIzMyOyZndDsmIzMyO09uJiMzMjtNb24sJiMz
MjsyMDI1LTAyLTI0JiMzMjthdCYjMzI7MTk6MDEmIzMyOyswMDAwLCYjMzI7Q29ub3ImIzMyO0Rv
b2xleSYjMzI7d3JvdGU6DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtPbiYjMzI7U3VuLCYj
MzI7RmViJiMzMjsyMywmIzMyOzIwMjUmIzMyO2F0JiMzMjswNTo0OTo0NVBNJiMzMjsrMDAwMCwm
IzMyO1N1bm55JiMzMjtTaGVuJiMzMjsoJiMyNzc4NDsmIzIyOTg5OyYjMjI5ODk7KSYjMzI7d3Jv
dGU6DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtPbiYjMzI7VHVlLCYjMzI7
MjAyNS0wMi0xMSYjMzI7YXQmIzMyOzE3OjU0JiMzMjsrMDAwMCwmIzMyO0Nvbm9yJiMzMjtEb29s
ZXkmIzMyO3dyb3RlOg0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYj
MzI7T24mIzMyO1R1ZSwmIzMyO0ZlYiYjMzI7MTEsJiMzMjsyMDI1JiMzMjthdCYjMzI7MTA6NTI6
NTBBTSYjMzI7KzA4MDAsJiMzMjtTdW5ueSYjMzI7U2hlbiYjMzI7d3JvdGU6DQomZ3Q7JiMzMjsm
Z3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtBZGQmIzMyO01EUC1S
U1omIzMyO2hhcmR3YXJlJiMzMjtkZXNjcmlwdGlvbiYjMzI7Zm9yJiMzMjtNZWRpYVRlayYjMzI7
TVQ4MTk2JiMzMjtTb0MNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0
OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7K2V4YW1wbGVzOg0KJmd0
OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7KyYjMTYw
OyYjMzI7LSYjMzI7fA0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYj
MzI7Jmd0OyYjMzI7KyYjMTYwOyYjMTYwOyYjMTYwOyYjMzI7c29jJiMzMjt7DQomZ3Q7JiMzMjsm
Z3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsrJiMxNjA7JiMxNjA7
JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMzMjsjYWRkcmVzcy1jZWxscyYjMzI7PSYj
MzI7Jmx0OzImZ3Q7Ow0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYj
MzI7Jmd0OyYjMzI7KyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYj
MzI7I3NpemUtY2VsbHMmIzMyOz0mIzMyOyZsdDsyJmd0OzsNCiZndDsmIzMyOyZndDsmIzMyOyZn
dDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOysNCiZndDsmIzMyOyZndDsmIzMyOyZn
dDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOysmIzE2MDsmIzE2MDsmIzE2MDsmIzE2
MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzMyO2Rpc3BfbWRwX3JzejA6JiMzMjtkaXNwLW1kcC1yc3ow
QDMyMWEwMDAwJiMzMjt7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7
JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyO0FuZCYj
MzI7JnF1b3Q7ZGlzcC1tZHAtcnN6MCZxdW90OyYjMzI7aXNuJiMzOTt0JiMzMjthbnl0aGluZyYj
MzI7Y2xvc2UmIzMyO3RvJiMzMjthJiMzMjtnZW5lcmljJiMzMjtub2RlDQomZ3Q7JiMzMjsmZ3Q7
JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtuYW1lLg0KJmd0OyYjMzI7Jmd0OyYjMzI7
Jmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtX
aWxsJiMzMjttb2RpZnkmIzMyOyZxdW90O2Rpc3AtbWRwLXJzejBAMzIxYTAwMDAmcXVvdDsmIzMy
O3RvJiMzMjsmcXVvdDttZHAtcnN6QDMyMWEwMDAwJnF1b3Q7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsm
Z3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyO0kmIzMyO2RvbiYjMzk7dCYjMzI7
dGhpbmsmIzMyO3RoYXQmIzM5O3MmIzMyO2FuJiMzMjtpbXByb3ZlbWVudC4mIzMyO0hpbnQ6JiMz
MjtmdWxsJiMzMjt3b3JkcyYjMzI7d291bGQmIzMyO2JlJiMzMjthDQomZ3Q7JiMzMjsmZ3Q7JiMz
MjsmZ3Q7JiMzMjtnb29kDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtwbGFjZSYjMzI7dG8m
IzMyO3N0YXJ0DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyOyYjMTYwOw0K
Jmd0OyYjMzI7Jmd0OyYjMzI7SGkmIzMyO0Nvbm9yLA0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7
JiMzMjsmZ3Q7JiMzMjtBYm91dCYjMzI7ZnVsbCYjMzI7d29yZHMsJiMxNjA7DQomZ3Q7JiMzMjsm
Z3Q7JiMzMjtEbyYjMzI7eW91JiMzMjttZWFuJiMzMjt3b3JkcyYjMzI7bGlrZSYjMzI7dGhpcyYj
NjM7JiMxNjA7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjttdWx0aW1lZGlhLWRpc3BsYXktcGF0aC1yZXNp
emVyJiM2MzsNCiZndDsmIzMyOyZndDsmIzMyO29yJiMzMjttZHAtcmVzaXplciYjNjM7DQomZ3Q7
JiMzMjsNCiZndDsmIzMyO1RoZXNlJiMzMjthcmUmIzMyO2JvdGgmIzMyO2ltcHJvdmVtZW50cyYj
MzI7b24mIzMyO3doYXQmIzMyO3lvdSYjMzk7dmUmIzMyO2dvdCYjMzI7cmlnaHQmIzMyO25vdy4N
Cg0KT2theSYjMTI2Ow0KSSYjMzk7bGwmIzMyO3VzZSYjMzI7bWRwLXJlc2l6ZXImIzMyO2ZvciYj
MzI7dGhpcw0KDQoNCiZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7V2UmIzMyO2ZvdW5kJiMz
Mjt0aGF0JiMzMjsmcXVvdDttZHAtcnN6JnF1b3Q7JiMzMjt0aGlzJiMzMjtraW5kJiMzMjtvZiYj
MzI7d29yZCYjMzI7aXMmIzMyO3VzZWQmIzMyO2F0DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtodHRwczov
L2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvYmxvYi9tYXN0ZXIvYXJjaC9hcm02NC9ib290L2R0
cy9tZWRpYXRlay9tdDgxODMuZHRzaQ0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7
JiMzMjtJJiMzOTttJiMzMjtub3QmIzMyO3N1cmUmIzMyO3doYXQmIzMyO3dpbGwmIzMyO2JlJiMz
MjtiZXR0ZXIuDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtDYW4mIzMyO3lvdSYjMzI7cHJvdmlkZSYjMzI7
bW9yZSYjMzI7ZGV0YWlsZWQmIzMyO3N1Z2dlc3Rpb24mIzMyO2Fib3V0JiMzMjt0aGlzJiMzMjtu
YW1pbmcmIzYzOw0KDQoNCjwvcHJlPg0KPC9wPjwvYm9keT48L2h0bWw+PCEtLXR5cGU6dGV4dC0t
PjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3Rp
Y2UgKioqKioqKioqKioqKioqKioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhp
cyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29u
ZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQg
ZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8g
YmUgDQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVz
ZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3Ig
Y29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1
bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpi
ZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMg
ZS1tYWlsLCBvciBiZWxpZXZlIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBp
biBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5
aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMg
ZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQg
ZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIg
cGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_009_1125010887.77186261--

