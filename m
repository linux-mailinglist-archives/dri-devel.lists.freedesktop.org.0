Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E622AF8935
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 09:24:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C40010E93D;
	Fri,  4 Jul 2025 07:24:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="FJfAGdrs";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="Gb2ChmdQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DB4D10E93C
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 07:24:53 +0000 (UTC)
X-UUID: f567eab658a711f0b33aeb1e7f16c2b6-20250704
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=Ls32JjEa3K4Ebo1Ep02XIk459tNYpWrEQ4oAqASTyL0=; 
 b=FJfAGdrsu0+gTwqwLNrrrrXJnVS3/YZuuDp4OEX8EWzJbSpjS6rcama26DNmuMmf/xlez545Lest+8Y2fjUISgvsPG7LL426PwDCsU1cTdWWbNMedLHqWrh1B15xpT8tHeNtOlFL9NcDfOsOPCz1JGEWnPcIKp2iCHZbuxI2qck=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2, REQID:4de9aa89-fc36-4243-8912-ceec8a919bf5, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:9eb4ff7, CLOUDID:ffdbf15f-2aa0-4c76-8faa-804d844c7164,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
 nt:0|51,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
 OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f567eab658a711f0b33aeb1e7f16c2b6-20250704
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com (envelope-from <paul-pl.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1000116920; Fri, 04 Jul 2025 15:24:44 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 4 Jul 2025 15:24:42 +0800
Received: from OS8PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 4 Jul 2025 15:24:41 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sVPw+lafKtY/COp0yDeji43cUR5522cfBlwh8VsMpqjbwsyu4k44pldk+K5CTBpAZ1cQML5rmWMbxek5cu4of+8vPV2OD6liDG1zj/xPeIGzSuy1WTNp3xfVVs13LhQDoNyZ6YrDVbFsBccrA4+qVWMaWiwe6maIj/POXfoN58jy8j9+PolzCSAFozIS0Wn5QGlOqvXEYAnWjZw942shYAW48Xkmy/+Mm+UuoDAcE+7ASox1A1qrvhn+jLzew8j/F/EOJJ9Zse4V+arw3TdgB6dlpA1kqrSMx6Z30Kvb35exsu9Qy0Uf/MN3+NnP1KEJIkFPzSZzd+tiZnVZwjuC8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZpusEz1wp+caaoNRcF0dlyqZLginwXIxMBlz6xiQ3cs=;
 b=VOxgzf3tDSl/Xd2kHNxeOSuebWuEU0/besa0u1We076NpoWmX8//bteH+PI8Xyi7dHtbGTdWiBWQ9YQmT0/xbtzEUzS6QBJlXY4A3LqIMjU8OOiyXMD9NHgnMJGuhgXctYb1oINfxEtI/0fZajYUAJJ8uiR5EB/JD/C9WPw2rX+S4zyJZfK+5Ef7JWj+EKQsKzklsLSbl3Pi4rDhcSRxrc5JPH71lDOYAjjEOkSyisL8i8NSIiqTzhYMzleN9BmwMmARR3j14w1OPKPzgTE2JlV7kHVquvEQrGjELLDtZkMD5khXhZzZQFHF8vgnIJaRDI7GMK8NoROh4znM6pA28Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZpusEz1wp+caaoNRcF0dlyqZLginwXIxMBlz6xiQ3cs=;
 b=Gb2ChmdQVZBiLLFwb2q6KtBqZ/1wth6V44xd1XiTQaT7XC/tgY7P4TAPDiEa656TIzHbMIRltTPcZLede1lqjZr3+eW7jO6hgpQVrymTWCALzShyDQuJ/26L6NSX71VhEMpvcUr7kayz6h3MS5/8himlQXEe+/QP69KA0YPqPbQ=
Received: from SG2PR03MB6636.apcprd03.prod.outlook.com (2603:1096:4:1b8::6) by
 PUZPR03MB7115.apcprd03.prod.outlook.com (2603:1096:301:106::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Fri, 4 Jul
 2025 07:24:40 +0000
Received: from SG2PR03MB6636.apcprd03.prod.outlook.com
 ([fe80::98e8:d61:f404:4052]) by SG2PR03MB6636.apcprd03.prod.outlook.com
 ([fe80::98e8:d61:f404:4052%6]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 07:24:40 +0000
From: =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>
To: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>
CC: =?utf-8?B?U3VubnkgU2hlbiAo5rKI5aeN5aeNKQ==?= <Sunny.Shen@mediatek.com>,
 =?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
 <Xiandong.Wang@mediatek.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "fshao@chromium.org" <fshao@chromium.org>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?=
 <Singo.Chang@mediatek.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "treapking@chromium.org" <treapking@chromium.org>
Subject: Re: [PATCH v3 14/17] drm/mediatek: add OUTPROC support for MT8196
Thread-Topic: [PATCH v3 14/17] drm/mediatek: add OUTPROC support for MT8196
Thread-Index: AQHbxXy+BRbfIFMvp0SAKScjiNH8JbQIyZsAgBkU0oA=
Date: Fri, 4 Jul 2025 07:24:40 +0000
Message-ID: <a05242578fab11f76873e39129066b58c2a0a126.camel@mediatek.com>
References: <20250515093454.1729720-1-paul-pl.chen@mediatek.com>
 <20250515093454.1729720-15-paul-pl.chen@mediatek.com>
 <778e9796ed50d8f9aaf11b6f1fa1f19386eb71d6.camel@mediatek.com>
In-Reply-To: <778e9796ed50d8f9aaf11b6f1fa1f19386eb71d6.camel@mediatek.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR03MB6636:EE_|PUZPR03MB7115:EE_
x-ms-office365-filtering-correlation-id: f0c5cf13-4d3c-4b25-402e-08ddbacbd6c6
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?RGlPUUJ3YStMekpsd0hIZ1VtYU1WbC9xbHl0U0FucnQ2VnpTZFY5YWJvQlE3?=
 =?utf-8?B?dDlFdXFvcXUyYkx0a3ErVkN3aHlUVmNzYUNzWFMwL05udEQwUStyTnVJRmpq?=
 =?utf-8?B?OE5oVDhjcGdGZzgyNzZHWmVBMnNYeFMrQWs3SS9ETTZBcU5jZksrVGpPdU1R?=
 =?utf-8?B?Sk1xSUhieXY3b3g4WGxyTTJZNVc1eXRPdWJyNzNkeVdDRkllcktsRFlRcm8w?=
 =?utf-8?B?NG8vTm1NeTFzTHpjRnBWVmxGYmJsWHBQYzh0T252eWFJeXUrdWJrdGc0MU5M?=
 =?utf-8?B?b1p0ZkFZdlBEbHUxS2hneGR1ZUY0M29CMlJEOWc5cGdNWWNrYlhPR3hlUTln?=
 =?utf-8?B?RGQvZFJhSHB4MitlM3FzSkRkWlRuOHNvVGFIYWtPVStPZTBPcVZ0Z1pWK1pH?=
 =?utf-8?B?UjJsNmwweDBxdHEyS09xanpUV0YwTVJuL095aGoyVDlpc01oVDVoRjd6eEtX?=
 =?utf-8?B?VElBM2h6U1FnK2w0bnRjRUxxQzY4eUJmRk5ROXhYVHdidWlhVVlRM1Y0NkJp?=
 =?utf-8?B?R2ZRdDR5MW0xUmM0ZnZzeU04K243NlRXQ2ZSSWdoeEcrSHZMeWlTTllqTDl1?=
 =?utf-8?B?NmI5M1c2Z1haZzM0VEJCUmdVTi9zbWp3QUk1eVZxV2J5d1BXbzJYUmp5M3R5?=
 =?utf-8?B?aVN6YlZFNFErbDFNSVFDY3BmUkQrdlZ3b0ZHSkxUa21OeGhPSDRtbHBPc2VL?=
 =?utf-8?B?VGw0WnBhYlhMdjM1TUpLRmpZR281NEVBdnZyVVdxTXFQOXlFcnRFRlFNT2cr?=
 =?utf-8?B?THBHUHhTVnFiellvQnYxaWpETWkzai9yYlo5elRMVVh3dmJVWWFCajU3Q3FX?=
 =?utf-8?B?QndhSHIrSVNHUnc1aTVWM1NVUkZHNzVHKzBBUnBZaVEyRHBQM0ZRTG1KSzM2?=
 =?utf-8?B?dWZ0MWhTSmpIdnVCa2thUkxzcXd2YmxCVCtUajdnYkxSSHZDdkZJOGRTeE5z?=
 =?utf-8?B?eE5YNGs5OXM4SmFOWlJJMCtjRllVS2dad0NkQ1k0bVRibmJreXVrMzNBbllo?=
 =?utf-8?B?ZGxvUllWWG1pWXFGOHZLcXBDWmZXdmI5QnhzSnBvVGpVejNBWkd2RWprV2V5?=
 =?utf-8?B?R083aTdIRnZyV2x1RXdDRnptb2VLRUJGOW5NYWJLaUlZOWtVdDRWbWFNMDdL?=
 =?utf-8?B?UC9pWEZxZElDeE5BRlNnc084R055N1pNaVM5TlRWVkwzUkNpTjF0Rjd6MGRq?=
 =?utf-8?B?Y1dQekxLUUVDREpzeXc4bnlIZFN5UkxMbjFLL0I4bHhybnBzV1hhMlp6OHg3?=
 =?utf-8?B?aEV6WUdsN0k0Q0Y3dFVyT0ZiQ2hva0ZaNHRwVjBsQk1PV0NzZ0hKRWU1TDds?=
 =?utf-8?B?MFZyRjBSQ1Q1U1pPcmo1aU1uNHF0REU5LzJBWTlHN2loYzF2YndZaGs1Qml3?=
 =?utf-8?B?UlYydW9KTjB4dGNvSU9BV3lyNW91N1JaSUEyd1IxTnEvRFJrVWVkNG4xbmY5?=
 =?utf-8?B?cVRZaG9mVWdKR3ZTQllWS29JTXZKMkJyMHZlRzczVno0aFRndG9rdUIvU1Ez?=
 =?utf-8?B?OUNCWTRUTFRWT2k3Q0JrVFFERGc4TWw0aHkyYmtzZVZaQmVXcmlnMTF5MDBM?=
 =?utf-8?B?SUpkNGhmbUFOK3VENm0wL1FEZjA2YVpacjBrVEdkYkxuV2FwemNFTnFIMHVI?=
 =?utf-8?B?MEhjeGxoRCtBSDkra3JqNTdiMlk2RWpZdDRzNkJ6TXBVTHBSbkwxMXcwcFl3?=
 =?utf-8?B?ZVhiaUo3V1ptejlhNkNUNyt0OGkyQTdvMmhWYkcxR0dqT3RaMUNGbGhkL0Rx?=
 =?utf-8?B?L1Y5OWpJcnNsZWF0c0FzQ21BcS9xQVRNcWpMOHo3TUpOWStlN3lqdHdROWVh?=
 =?utf-8?B?NUl1TW5OMEVPZVZDYnFSNUNJK0FxSzBBeFBSM2x6VGYzQjNJWGhQY1JON3h0?=
 =?utf-8?B?a1k0RGtJVG5tVU9GTk95MVBxejZxZ2FUYUpJT1JlWnh6UWc5V2QreEFCN1Ev?=
 =?utf-8?B?Rlp3SkYzQXJGb3NKQ01iaEN4L0JrMzFGamRyNVJjQXVSUi90Z01sUXY0dDMx?=
 =?utf-8?B?Mjdid0xGNVl3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR03MB6636.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ckU5Si9QelM0bGplN00wYlNtZ1d0MHNLWlRrTTJqZUI1SkdqSWFPWmF3OHNp?=
 =?utf-8?B?RzRDZ0VJUjlkMUFCaHhkRHp1VEwvTHBtRWF0dHcxTHI1Yk9oTWZXdjN1VWtZ?=
 =?utf-8?B?REllYmExL0dpajZQTEQrTFU3Z2xJbWNHWm5idXU4ZXZ3eGpxNU1iTERpK0JR?=
 =?utf-8?B?S0Z0TlVKL2lmWFRBRWl4K2E2SnZkZXFoMUhOZlZJYXgwS0hyZW5hc28vb2Nm?=
 =?utf-8?B?bERwd09reUpjZHhpZUd2eVBHZkNEVEhKRitVL1NZYW1ZQnY2NXNuRThkUVBR?=
 =?utf-8?B?VkRBZkhnYWRQc1hPdm1Qd3VnYWxOSzhVRC9UYy9jT2hSSEtlQjRmUmg4ek41?=
 =?utf-8?B?K2o1ZkVwNWdTdENjQXEwa0FnN0YvSytEVkdrSGwwczFEV3JYbzZsZE5kdEJ3?=
 =?utf-8?B?TjNBSjQvRTZDcmMzcGVvNTQ2bGUzZGlNbWQyNUhCS3BaUlRZUzhMTGxlays4?=
 =?utf-8?B?bVl0cThLZ05hK3lXdnhrTGV0dXB0SXhEMmgzRUdsdFIwY0oxUElCUzdOaExl?=
 =?utf-8?B?aUZnbFdqVWNhRkFsNVRhd0pTTVV4Y1VveHJuL1l6NWF2T2hzKzNZVk9EVXE3?=
 =?utf-8?B?RjRib29TeExJSWRDWDk0bzEyZmRWVitMWWozVUVtUWFHYjdBQ1RLcVNnMklr?=
 =?utf-8?B?d041Q3EvREVpUkNLTVRTd3pRSkgxSWJObjVQbTdVVmdTNURTUklKaXZ6TEht?=
 =?utf-8?B?MzVQOHpIbVJRcTY0MzErdkwxNE5EblBNcURZWGttM2xUTE5VNFZjM0xkckl5?=
 =?utf-8?B?VEdwcGNvMmtTdUFwQUlhVlE1dUdLMU1wc1RZWGcvOXNrRG10d3dHSTB0Q21a?=
 =?utf-8?B?N1J2WmVDVm96ZWx5MnpNSktoSmg2ZlhTNUgwS01aa3IvZ0dzMUk4SkFmQlZL?=
 =?utf-8?B?T1UzODRKbi84dlFXVE90cXUxWmJpUEg5Q0dtbVpqQ0g4SEwrOUJHS1RndzNz?=
 =?utf-8?B?N2pFTktlQ0N3TVZidjdFZlc2bUJXeVN6ejYxUVIvSmdPUGtwdmt3M2MrVlp0?=
 =?utf-8?B?bVlEKzhGck4vaWxzYldGb0E5Z3dxQitqVUVrMVRhVnBmelhzWlg1REFQZmpQ?=
 =?utf-8?B?NFBRV2FEaGUrTm1PY0dkU2xkZlpIWU9ZM2hpR1J0TXBPUEl0cVVwam5LWUd5?=
 =?utf-8?B?bnIzN2Rhd0xmVG1WZGhMZXgvZGttRkg1dnE0ZlRVYW83VFpkSnRTUTN6cE00?=
 =?utf-8?B?dEJKeVRDeHZ0TTJnbkdJS1hJN0JtOHlnMW1mUW5QTWsrZ3VydDRETWQ5Sk94?=
 =?utf-8?B?Uzg1VjZGK1FKejJFSlVRRzM2eExRNk9mN1I4K3E2R0g4N2Q4RlJON0Q0Z2tR?=
 =?utf-8?B?dm9SdHZQQzc5dXJFenJwTEs5ZGc4aEt5cFhHby9rbUZDYW43THZTTWRPclRv?=
 =?utf-8?B?ckYzQStzU1hRemtHOE5xYXZzRFlCZVA1SEkrRitVakR1Tk5VWWJseXpKTHJz?=
 =?utf-8?B?U3VlOGtBMlNQYnVVS2phUldJbWdDbGFyZS9rRVdhcElSM1NiOUVpL3JNU3BU?=
 =?utf-8?B?amF6a21ESzFHbFVtYnVIbWlWK2NLMkloWUpVQUpPMFAyNXlxY1NPdjM5SFNq?=
 =?utf-8?B?R0IzWDhmYUNlSkRtN0xRbFhxYlNRUUJFSkxRZVNMZkRzM3RUVlBmem94L1M3?=
 =?utf-8?B?b1BqVnpkOWNCVlBqWEJuaENiM2NseDd6ZEZHbzBSM3RvQXd2MXhBMDlHeDhj?=
 =?utf-8?B?bWE1dW1vVEpqZ0FFN2lVVnBMaGdCaEEzRDJpWmdISzdUdUlSSG1VVGloclNz?=
 =?utf-8?B?QlgvcHY5VHAxNStIQ1Y5ck9LRm9RQVVYOVhzTHA4MFNzVkxEa3FYSldnSHR1?=
 =?utf-8?B?Y3VxMkljb2toNzYvSUlIV1hjNCtTdk9GWmp5S0RHd0w0NjZuZkh2N3JTN3ky?=
 =?utf-8?B?Z0pQbHZRNFJmaHlEaFozUjFxeWpZRmJrM0VWR3JIS0FGVnBDaEVLUXk5MURL?=
 =?utf-8?B?ZW95RVNsbE1XbWdqRytJVTlGTWJQUnd4UmNJU29WRWxIaHlYZk1XbWEwTXE1?=
 =?utf-8?B?ZXRCMnphclFaVC9IMzRIZU1nQmhibDREdHo4dHFESy9wVENoeC9PVXN1Y0I3?=
 =?utf-8?B?MzFPanljYnBRVTdvUml5dFFxSlFGQVFmVC9hZmYvdklyeS9qckJkQmhtYUdO?=
 =?utf-8?B?NmlsZC9zcjN1UFRIR2lkRFlGcG03ZnFTZEwzS3FuNUhldjVnZXhldnBZR1Zp?=
 =?utf-8?B?RFE9PQ==?=
Content-ID: <1F5B2268BFE9874789949EB04A1515F0@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB6636.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0c5cf13-4d3c-4b25-402e-08ddbacbd6c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2025 07:24:40.0460 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VcVYGBSS6q4y1mU5Bbmu20cbLBIYrwCo6ma2KTmqmuFMZBsMYbCjFH38chFEC9jK3esymyAJIin3STo+MVL3xCJswwbPtjCpD7rcsGExG2E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB7115
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_004_435840767.63428845"
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

--__=_Part_Boundary_004_435840767.63428845
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDI1LTA2LTE4IGF0IDA4OjIzICswMDAwLCBDSyBIdSAo6IOh5L+K5YWJKSB3cm90
ZToNCj4gT24gVGh1LCAyMDI1LTA1LTE1IGF0IDE3OjM0ICswODAwLCBwYXVsLXBsLmNoZW4gd3Jv
dGU6DQo+ID4gRnJvbTogTmFuY3kgTGluIDxuYW5jeS5saW5AbWVkaWF0ZWsuY29tPg0KPiA+IA0K
PiA+IE9VVFBST0MgaGFuZGxlcyB0aGUgcG9zdC1zdGFnZSBvZiBwaXhlbCBwcm9jZXNzaW5nIGlu
DQo+ID4gdGhlIG92ZXJsYXBwaW5nIHByb2NlZHVyZS5PVVRQUk9DIG1hbmFnZXMgcGl4ZWxzIGZv
cg0KPiA+IGdhbW1hIGNvcnJlY3Rpb24gYW5kIGVuc3VyZXMgdGhhdCBwaXhlbCB2YWx1ZXMgYXJl
DQo+ID4gd2l0aGluIHRoZSBjb3JyZWN0IHJhbmdlLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6
IE5hbmN5IExpbiA8bmFuY3kubGluQG1lZGlhdGVrLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQ
YXVsLXBsIENoZW4gPHBhdWwtcGwuY2hlbkBtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+IA0KPiBb
c25pcF0NCj4gDQo+ID4gK3ZvaWQgbXRrX2Rpc3Bfb3V0cHJvY19jb25maWcoc3RydWN0IGRldmlj
ZSAqZGV2LCB1bnNpZ25lZCBpbnQgdywNCj4gPiArCQkJwqDCoMKgwqAgdW5zaWduZWQgaW50IGgs
IHVuc2lnbmVkIGludA0KPiA+IHZyZWZyZXNoLA0KPiA+ICsJCQnCoMKgwqDCoCB1bnNpZ25lZCBp
bnQgYnBjLCBzdHJ1Y3QgY21kcV9wa3QNCj4gPiAqY21kcV9wa3QpDQo+ID4gK3sNCj4gPiArCXN0
cnVjdCBtdGtfZGlzcF9vdXRwcm9jICpwcml2ID0gZGV2X2dldF9kcnZkYXRhKGRldik7DQo+ID4g
Kwl1MzIgdG1wOw0KPiA+ICsNCj4gPiArCWRldl9kYmcoZGV2LCAiJXMtdzolZCwgaDolZFxuIiwg
X19mdW5jX18sIHcsIGgpOw0KPiA+ICsNCj4gPiArCXdyaXRlbCgoaCA8PCAxNikgfCB3LCBwcml2
LT5yZWdzICsNCj4gPiBESVNQX1JFR19PVkxfT1VUUFJPQ19ST0lfU0laRSk7DQo+ID4gKw0KPiA+
ICsJdG1wID0gcmVhZGwocHJpdi0+cmVncyArDQo+ID4gRElTUF9SRUdfT1ZMX09VVFBST0NfREFU
QVBBVEhfQ09OKTsNCj4gPiArCXRtcCA9ICh0bXAgJiB+T1ZMX09VVFBST0NfREFUQVBBVEhfQ09O
X09VVFBVVF9DTEFNUCkgfA0KPiA+ICsJCcKgIChPVkxfT1VUUFJPQ19EQVRBUEFUSF9DT05fT1VU
UFVUX0NMQU1QICYNCj4gPiBPVkxfT1VUUFJPQ19EQVRBUEFUSF9DT05fT1VUUFVUX0NMQU1QKTsN
Cj4gDQo+IFRoaXMgd291bGQgc2ltcGxpZmllZCBhcw0KPiANCj4gdG1wIHw9IE9WTF9PVVRQUk9D
X0RBVEFQQVRIX0NPTl9PVVRQVVRfQ0xBTVA7DQo+IA0KDQpPSywgSSB3aWxsIHJlZmluZSB0aGUg
Y29kZSB0byBzaW1wbGlmeSB0aGlzIHBhcnQuDQoNCj4gPiArCXdyaXRlbCh0bXAsIHByaXYtPnJl
Z3MgKw0KPiA+IERJU1BfUkVHX09WTF9PVVRQUk9DX0RBVEFQQVRIX0NPTik7DQo+ID4gK30NCj4g
PiArDQo+ID4gK3ZvaWQgbXRrX2Rpc3Bfb3V0cHJvY19zdGFydChzdHJ1Y3QgZGV2aWNlICpkZXYp
DQo+ID4gK3sNCj4gPiArCXN0cnVjdCBtdGtfZGlzcF9vdXRwcm9jICpwcml2ID0gZGV2X2dldF9k
cnZkYXRhKGRldik7DQo+ID4gKwl1bnNpZ25lZCBpbnQgdG1wOw0KPiA+ICsNCj4gPiArCXRtcCA9
IHJlYWRsKHByaXYtPnJlZ3MgKw0KPiA+IERJU1BfUkVHX09WTF9PVVRQUk9DX1NIQURPV19DVFJM
KTsNCj4gPiArCXRtcCA9IHRtcCB8IE9WTF9PVVRQUk9DX0JZUEFTU19TSEFET1c7DQo+IA0KPiB0
bXAgfD0gT1ZMX09VVFBST0NfQllQQVNTX1NIQURPVzsNCg0KVW5kZXJzdG9vZCwgSSB3aWxsIHJl
ZmluZSB0aGUgY29kZSB0byBzaW1wbGlmeSB0aGlzIHBhcnQuDQo+IA0KPiA+ICsJd3JpdGVsKHRt
cCwgcHJpdi0+cmVncyArDQo+ID4gRElTUF9SRUdfT1ZMX09VVFBST0NfU0hBRE9XX0NUUkwpOw0K
PiA+ICsNCj4gPiArCXdyaXRlbCgwLCBwcml2LT5yZWdzICsgRElTUF9SRUdfT1ZMX09VVFBST0Nf
SU5UU1RBKTsNCj4gDQo+IFRvIGFsaWduIE9WTCBkcml2ZXIsIGNsZWFyIGludGVycnVwdCBzdGF0
dXMgaW4gZW5hYmxlX3ZibGFuaygpDQo+IGZ1bmN0aW9uLg0KPiANCj4gDQoNClVuZGVyc3Rvb2Qs
IEkgd2lsbCByZWZpbmUgdGhlIGNvZGUgYW5kIG1vdmUgDQoidGhlIGNsZWFyIGludGVycnVwdCBz
dGF0dXMiIHRvIGZ1bmN0aW9uIG9mIGVuYWJsZV92YmxhbmsoKS4NCj4gPiArDQo+ID4gKwl0bXAg
PSByZWFkbChwcml2LT5yZWdzICsgRElTUF9SRUdfT1ZMX09VVFBST0NfRU4pOw0KPiA+ICsJdG1w
ID0gKHRtcCAmIH5PVkxfT1VUUFJPQ19PVkxfRU4pIHwgKE9WTF9PVVRQUk9DX09WTF9FTiAmDQo+
ID4gT1ZMX09VVFBST0NfT1ZMX0VOKTsNCj4gDQo+IFRoaXMgd291bGQgYmUgc2ltcGxpZmllZCBh
cw0KPiANCj4gdG1wIHw9IE9WTF9PVVRQUk9DX09WTF9FTjsNCj4gDQoNClVuZGVyc3Rvb2QsIEkg
d2lsbCBzaW1wbGlmeSB0aGUgY29kZS4gDQoNCj4gT25lIHF1ZXN0aW9uLiBJbiBtdGtfZGlzcF9v
dXRwcm9jX3N0b3AoKSwgeW91IG92ZXJ3cml0ZSB0aGUgd2hvbGUNCj4gcmVnaXN0ZXIgb2bCoCBE
SVNQX1JFR19PVkxfT1VUUFJPQ19FTi4NCj4gV2h5IGhlcmUgbm90IG92ZXJ3cml0ZSB0aGUgd2hv
bGUgcmVnaXN0ZXI/DQo+IA0KPiBSZWdhcmRzLA0KPiBDSw0KPiANCkhpIENrLCBJIHdpbGwgcGVy
Zm9ybSBhbiBleHBlcmltZW50IHRvIHZlcmlmeSB0aGlzIHBhcnQuDQoNCkJlc3QsIFBhdWwgDQo+
ID4gKwl3cml0ZWwodG1wLCBwcml2LT5yZWdzICsgRElTUF9SRUdfT1ZMX09VVFBST0NfRU4pOw0K
PiA+ICt9DQo+ID4gKw0KPiA+ICt2b2lkIG10a19kaXNwX291dHByb2Nfc3RvcChzdHJ1Y3QgZGV2
aWNlICpkZXYpDQo+ID4gK3sNCj4gPiArCXN0cnVjdCBtdGtfZGlzcF9vdXRwcm9jICpwcml2ID0g
ZGV2X2dldF9kcnZkYXRhKGRldik7DQo+ID4gKw0KPiA+ICsJd3JpdGVsKDAsIHByaXYtPnJlZ3Mg
KyBESVNQX1JFR19PVkxfT1VUUFJPQ19FTik7DQo+ID4gKwl3cml0ZWwoT1ZMX09VVFBST0NfUlNU
LCBwcml2LT5yZWdzICsNCj4gPiBESVNQX1JFR19PVkxfT1VUUFJPQ19SU1QpOw0KPiA+ICsJd3Jp
dGVsKDAsIHByaXYtPnJlZ3MgKyBESVNQX1JFR19PVkxfT1VUUFJPQ19SU1QpOw0KPiA+ICt9DQo+
ID4gKw0KPiANCg0K

--__=_Part_Boundary_004_435840767.63428845
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1dlZCwmIzMyOzIwMjUtMDYtMTgmIzMyO2F0
JiMzMjswODoyMyYjMzI7KzAwMDAsJiMzMjtDSyYjMzI7SHUmIzMyOygmIzMyOTkzOyYjMjA0MjY7
JiMyMDgwOTspJiMzMjt3cm90ZToNCiZndDsmIzMyO09uJiMzMjtUaHUsJiMzMjsyMDI1LTA1LTE1
JiMzMjthdCYjMzI7MTc6MzQmIzMyOyswODAwLCYjMzI7cGF1bC1wbC5jaGVuJiMzMjt3cm90ZToN
CiZndDsmIzMyOyZndDsmIzMyO0Zyb206JiMzMjtOYW5jeSYjMzI7TGluJiMzMjsmbHQ7bmFuY3ku
bGluQG1lZGlhdGVrLmNvbSZndDsNCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYj
MzI7T1VUUFJPQyYjMzI7aGFuZGxlcyYjMzI7dGhlJiMzMjtwb3N0LXN0YWdlJiMzMjtvZiYjMzI7
cGl4ZWwmIzMyO3Byb2Nlc3NpbmcmIzMyO2luDQomZ3Q7JiMzMjsmZ3Q7JiMzMjt0aGUmIzMyO292
ZXJsYXBwaW5nJiMzMjtwcm9jZWR1cmUuT1VUUFJPQyYjMzI7bWFuYWdlcyYjMzI7cGl4ZWxzJiMz
Mjtmb3INCiZndDsmIzMyOyZndDsmIzMyO2dhbW1hJiMzMjtjb3JyZWN0aW9uJiMzMjthbmQmIzMy
O2Vuc3VyZXMmIzMyO3RoYXQmIzMyO3BpeGVsJiMzMjt2YWx1ZXMmIzMyO2FyZQ0KJmd0OyYjMzI7
Jmd0OyYjMzI7d2l0aGluJiMzMjt0aGUmIzMyO2NvcnJlY3QmIzMyO3JhbmdlLg0KJmd0OyYjMzI7
Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtTaWduZWQtb2ZmLWJ5OiYjMzI7TmFuY3kmIzMy
O0xpbiYjMzI7Jmx0O25hbmN5LmxpbkBtZWRpYXRlay5jb20mZ3Q7DQomZ3Q7JiMzMjsmZ3Q7JiMz
MjtTaWduZWQtb2ZmLWJ5OiYjMzI7UGF1bC1wbCYjMzI7Q2hlbiYjMzI7Jmx0O3BhdWwtcGwuY2hl
bkBtZWRpYXRlay5jb20mZ3Q7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjstLS0NCiZndDsmIzMyOw0KJmd0
OyYjMzI7W3NuaXBdDQomZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyOyt2b2lkJiMzMjttdGtf
ZGlzcF9vdXRwcm9jX2NvbmZpZyhzdHJ1Y3QmIzMyO2RldmljZSYjMzI7KmRldiwmIzMyO3Vuc2ln
bmVkJiMzMjtpbnQmIzMyO3csDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrJiMxNjA7JiMxNjA7JiMxNjA7
JiMxNjA7JiMzMjt1bnNpZ25lZCYjMzI7aW50JiMzMjtoLCYjMzI7dW5zaWduZWQmIzMyO2ludA0K
Jmd0OyYjMzI7Jmd0OyYjMzI7dnJlZnJlc2gsDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrJiMxNjA7JiMx
NjA7JiMxNjA7JiMxNjA7JiMzMjt1bnNpZ25lZCYjMzI7aW50JiMzMjticGMsJiMzMjtzdHJ1Y3Qm
IzMyO2NtZHFfcGt0DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsqY21kcV9wa3QpDQomZ3Q7JiMzMjsmZ3Q7
JiMzMjsrew0KJmd0OyYjMzI7Jmd0OyYjMzI7K3N0cnVjdCYjMzI7bXRrX2Rpc3Bfb3V0cHJvYyYj
MzI7KnByaXYmIzMyOz0mIzMyO2Rldl9nZXRfZHJ2ZGF0YShkZXYpOw0KJmd0OyYjMzI7Jmd0OyYj
MzI7K3UzMiYjMzI7dG1wOw0KJmd0OyYjMzI7Jmd0OyYjMzI7Kw0KJmd0OyYjMzI7Jmd0OyYjMzI7
K2Rldl9kYmcoZGV2LCYjMzI7JnF1b3Q7JXMtdzolZCwmIzMyO2g6JWQmIzkyO24mcXVvdDssJiMz
MjtfX2Z1bmNfXywmIzMyO3csJiMzMjtoKTsNCiZndDsmIzMyOyZndDsmIzMyOysNCiZndDsmIzMy
OyZndDsmIzMyOyt3cml0ZWwoKGgmIzMyOyZsdDsmbHQ7JiMzMjsxNikmIzMyO3wmIzMyO3csJiMz
Mjtwcml2LSZndDtyZWdzJiMzMjsrDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtESVNQX1JFR19PVkxfT1VU
UFJPQ19ST0lfU0laRSk7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsr
dG1wJiMzMjs9JiMzMjtyZWFkbChwcml2LSZndDtyZWdzJiMzMjsrDQomZ3Q7JiMzMjsmZ3Q7JiMz
MjtESVNQX1JFR19PVkxfT1VUUFJPQ19EQVRBUEFUSF9DT04pOw0KJmd0OyYjMzI7Jmd0OyYjMzI7
K3RtcCYjMzI7PSYjMzI7KHRtcCYjMzI7JmFtcDsmIzMyOyYjMTI2O09WTF9PVVRQUk9DX0RBVEFQ
QVRIX0NPTl9PVVRQVVRfQ0xBTVApJiMzMjt8DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrJiMxNjA7JiMz
MjsoT1ZMX09VVFBST0NfREFUQVBBVEhfQ09OX09VVFBVVF9DTEFNUCYjMzI7JmFtcDsNCiZndDsm
IzMyOyZndDsmIzMyO09WTF9PVVRQUk9DX0RBVEFQQVRIX0NPTl9PVVRQVVRfQ0xBTVApOw0KJmd0
OyYjMzI7DQomZ3Q7JiMzMjtUaGlzJiMzMjt3b3VsZCYjMzI7c2ltcGxpZmllZCYjMzI7YXMNCiZn
dDsmIzMyOw0KJmd0OyYjMzI7dG1wJiMzMjt8PSYjMzI7T1ZMX09VVFBST0NfREFUQVBBVEhfQ09O
X09VVFBVVF9DTEFNUDsNCiZndDsmIzMyOw0KDQpPSywmIzMyO0kmIzMyO3dpbGwmIzMyO3JlZmlu
ZSYjMzI7dGhlJiMzMjtjb2RlJiMzMjt0byYjMzI7c2ltcGxpZnkmIzMyO3RoaXMmIzMyO3BhcnQu
DQoNCiZndDsmIzMyOyZndDsmIzMyOyt3cml0ZWwodG1wLCYjMzI7cHJpdi0mZ3Q7cmVncyYjMzI7
Kw0KJmd0OyYjMzI7Jmd0OyYjMzI7RElTUF9SRUdfT1ZMX09VVFBST0NfREFUQVBBVEhfQ09OKTsN
CiZndDsmIzMyOyZndDsmIzMyOyt9DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsmZ3Q7
JiMzMjsrdm9pZCYjMzI7bXRrX2Rpc3Bfb3V0cHJvY19zdGFydChzdHJ1Y3QmIzMyO2RldmljZSYj
MzI7KmRldikNCiZndDsmIzMyOyZndDsmIzMyOyt7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrc3RydWN0
JiMzMjttdGtfZGlzcF9vdXRwcm9jJiMzMjsqcHJpdiYjMzI7PSYjMzI7ZGV2X2dldF9kcnZkYXRh
KGRldik7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrdW5zaWduZWQmIzMyO2ludCYjMzI7dG1wOw0KJmd0
OyYjMzI7Jmd0OyYjMzI7Kw0KJmd0OyYjMzI7Jmd0OyYjMzI7K3RtcCYjMzI7PSYjMzI7cmVhZGwo
cHJpdi0mZ3Q7cmVncyYjMzI7Kw0KJmd0OyYjMzI7Jmd0OyYjMzI7RElTUF9SRUdfT1ZMX09VVFBS
T0NfU0hBRE9XX0NUUkwpOw0KJmd0OyYjMzI7Jmd0OyYjMzI7K3RtcCYjMzI7PSYjMzI7dG1wJiMz
Mjt8JiMzMjtPVkxfT1VUUFJPQ19CWVBBU1NfU0hBRE9XOw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjt0
bXAmIzMyO3w9JiMzMjtPVkxfT1VUUFJPQ19CWVBBU1NfU0hBRE9XOw0KDQpVbmRlcnN0b29kLCYj
MzI7SSYjMzI7d2lsbCYjMzI7cmVmaW5lJiMzMjt0aGUmIzMyO2NvZGUmIzMyO3RvJiMzMjtzaW1w
bGlmeSYjMzI7dGhpcyYjMzI7cGFydC4NCiZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7K3dy
aXRlbCh0bXAsJiMzMjtwcml2LSZndDtyZWdzJiMzMjsrDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtESVNQ
X1JFR19PVkxfT1VUUFJPQ19TSEFET1dfQ1RSTCk7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrDQomZ3Q7
JiMzMjsmZ3Q7JiMzMjsrd3JpdGVsKDAsJiMzMjtwcml2LSZndDtyZWdzJiMzMjsrJiMzMjtESVNQ
X1JFR19PVkxfT1VUUFJPQ19JTlRTVEEpOw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtUbyYjMzI7YWxp
Z24mIzMyO09WTCYjMzI7ZHJpdmVyLCYjMzI7Y2xlYXImIzMyO2ludGVycnVwdCYjMzI7c3RhdHVz
JiMzMjtpbiYjMzI7ZW5hYmxlX3ZibGFuaygpDQomZ3Q7JiMzMjtmdW5jdGlvbi4NCiZndDsmIzMy
Ow0KJmd0OyYjMzI7DQoNClVuZGVyc3Rvb2QsJiMzMjtJJiMzMjt3aWxsJiMzMjtyZWZpbmUmIzMy
O3RoZSYjMzI7Y29kZSYjMzI7YW5kJiMzMjttb3ZlJiMzMjsNCiZxdW90O3RoZSYjMzI7Y2xlYXIm
IzMyO2ludGVycnVwdCYjMzI7c3RhdHVzJnF1b3Q7JiMzMjt0byYjMzI7ZnVuY3Rpb24mIzMyO29m
JiMzMjtlbmFibGVfdmJsYW5rKCkuDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsmZ3Q7
JiMzMjsrdG1wJiMzMjs9JiMzMjtyZWFkbChwcml2LSZndDtyZWdzJiMzMjsrJiMzMjtESVNQX1JF
R19PVkxfT1VUUFJPQ19FTik7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrdG1wJiMzMjs9JiMzMjsodG1w
JiMzMjsmYW1wOyYjMzI7JiMxMjY7T1ZMX09VVFBST0NfT1ZMX0VOKSYjMzI7fCYjMzI7KE9WTF9P
VVRQUk9DX09WTF9FTiYjMzI7JmFtcDsNCiZndDsmIzMyOyZndDsmIzMyO09WTF9PVVRQUk9DX09W
TF9FTik7DQomZ3Q7JiMzMjsNCiZndDsmIzMyO1RoaXMmIzMyO3dvdWxkJiMzMjtiZSYjMzI7c2lt
cGxpZmllZCYjMzI7YXMNCiZndDsmIzMyOw0KJmd0OyYjMzI7dG1wJiMzMjt8PSYjMzI7T1ZMX09V
VFBST0NfT1ZMX0VOOw0KJmd0OyYjMzI7DQoNClVuZGVyc3Rvb2QsJiMzMjtJJiMzMjt3aWxsJiMz
MjtzaW1wbGlmeSYjMzI7dGhlJiMzMjtjb2RlLiYjMzI7DQoNCiZndDsmIzMyO09uZSYjMzI7cXVl
c3Rpb24uJiMzMjtJbiYjMzI7bXRrX2Rpc3Bfb3V0cHJvY19zdG9wKCksJiMzMjt5b3UmIzMyO292
ZXJ3cml0ZSYjMzI7dGhlJiMzMjt3aG9sZQ0KJmd0OyYjMzI7cmVnaXN0ZXImIzMyO29mJiMxNjA7
JiMzMjtESVNQX1JFR19PVkxfT1VUUFJPQ19FTi4NCiZndDsmIzMyO1doeSYjMzI7aGVyZSYjMzI7
bm90JiMzMjtvdmVyd3JpdGUmIzMyO3RoZSYjMzI7d2hvbGUmIzMyO3JlZ2lzdGVyJiM2MzsNCiZn
dDsmIzMyOw0KJmd0OyYjMzI7UmVnYXJkcywNCiZndDsmIzMyO0NLDQomZ3Q7JiMzMjsNCkhpJiMz
MjtDaywmIzMyO0kmIzMyO3dpbGwmIzMyO3BlcmZvcm0mIzMyO2FuJiMzMjtleHBlcmltZW50JiMz
Mjt0byYjMzI7dmVyaWZ5JiMzMjt0aGlzJiMzMjtwYXJ0Lg0KDQpCZXN0LCYjMzI7UGF1bCYjMzI7
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrd3JpdGVsKHRtcCwmIzMyO3ByaXYtJmd0O3JlZ3MmIzMyOysm
IzMyO0RJU1BfUkVHX09WTF9PVVRQUk9DX0VOKTsNCiZndDsmIzMyOyZndDsmIzMyOyt9DQomZ3Q7
JiMzMjsmZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsrdm9pZCYjMzI7bXRrX2Rpc3Bfb3V0
cHJvY19zdG9wKHN0cnVjdCYjMzI7ZGV2aWNlJiMzMjsqZGV2KQ0KJmd0OyYjMzI7Jmd0OyYjMzI7
K3sNCiZndDsmIzMyOyZndDsmIzMyOytzdHJ1Y3QmIzMyO210a19kaXNwX291dHByb2MmIzMyOypw
cml2JiMzMjs9JiMzMjtkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCiZndDsmIzMyOyZndDsmIzMyOysN
CiZndDsmIzMyOyZndDsmIzMyOyt3cml0ZWwoMCwmIzMyO3ByaXYtJmd0O3JlZ3MmIzMyOysmIzMy
O0RJU1BfUkVHX09WTF9PVVRQUk9DX0VOKTsNCiZndDsmIzMyOyZndDsmIzMyOyt3cml0ZWwoT1ZM
X09VVFBST0NfUlNULCYjMzI7cHJpdi0mZ3Q7cmVncyYjMzI7Kw0KJmd0OyYjMzI7Jmd0OyYjMzI7
RElTUF9SRUdfT1ZMX09VVFBST0NfUlNUKTsNCiZndDsmIzMyOyZndDsmIzMyOyt3cml0ZWwoMCwm
IzMyO3ByaXYtJmd0O3JlZ3MmIzMyOysmIzMyO0RJU1BfUkVHX09WTF9PVVRQUk9DX1JTVCk7DQom
Z3Q7JiMzMjsmZ3Q7JiMzMjsrfQ0KJmd0OyYjMzI7Jmd0OyYjMzI7Kw0KJmd0OyYjMzI7DQoNCg0K
PC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48cHJlPioq
KioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZQ0KICoqKioqKioqKioq
KioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3Nh
Z2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJv
cHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3Vy
ZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQg
b25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRp
b24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhp
cyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNp
cGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElm
IHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVs
aWV2ZQ0KIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxl
YXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMg
ZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNs
dWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNj
bG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFu
ayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_004_435840767.63428845--

