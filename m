Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A178A7E6C
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 10:37:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A15D1132D1;
	Wed, 17 Apr 2024 08:37:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="nGjlUJjE";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="CcIOvKPF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 616761132D0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 08:37:04 +0000 (UTC)
X-UUID: a73beef6fc9511eeb8927bc1f75efef4-20240417
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=PdqLEzFV7svYKPKMWkoonPzO3kLiNkiyQu/kuXwMOR4=; 
 b=nGjlUJjE6cQOFeLpdPm3uaVA5Llr2Ha8b0olaUbl5KLzxDc5u7ZPmFm/H5RWnYk1bxNw3qtG/ILYCMV7C0L/k/LRod1wygx/Gh2CaHBAZM+aKa7og87xpMJThpKzXiX4w6EuaeBr+qIrmK+oRvw/08/4lxRV2yzNz75eXMbKeRM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38, REQID:bbc04720-cdcc-4b0a-a85e-85fe1f5da23d, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:82c5f88, CLOUDID:33c2ae91-e2c0-40b0-a8fe-7c7e47299109,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: a73beef6fc9511eeb8927bc1f75efef4-20240417
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2043938491; Wed, 17 Apr 2024 16:36:58 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 17 Apr 2024 16:36:57 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Wed, 17 Apr 2024 16:36:57 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cNpNfmGyZcAdJR8Lp/bs67txU0x0GcxvfbOGuqCv4u3TrvAJHG3a3buzfdFDcaUnA5b6L+/8DdZmODU9oiC7hgQiZKd1p1rUObWdgAI1uVK7h/YKDBZ+EbY57P4MRE00svmxaRW6KpfdBPsYhsvsQrONCTaHUxzHUKBpOZpPwCdk15HIQfw1io13O7ZbHVEzGB2WfpuwrB5Gg/jDggX2MVjVzGwlEmGBsCELEFc2aSGvh2cLQrBWhH9Im6FIFsMlu0aaQGD+WSmfSidwDqUghIvPXGomcfKsj/HL7G2iwBKzxk0zrTvH33NjpPUSobaZW48kwXhyMczKNeaVbJUbEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KCbqX4QlZ/OcpJaWB0jvClKS/rG7urBif+eHYa3M1fg=;
 b=bbMJvLkwL3mZENJnfU50N0HrjVcv9HsYjchz1KjfQzTljG7Q9t8WOqWdliQhjtWCIXbADwD7/rLPeQ5l278S6vbcEzHkWDBc5OJVVr7cO8e1NzmGW8YVGiaMnFIG8MW032+d5Rqufh2mfSaX7uTOddQkAL23Lq7EgGXCoN+++zm0DlKj8uz+4qlbNLHFwEg9+0PbRw7s7K+xA5fDEsKvA1T5taBesGEPbwsIIFyi/j3GHk97dVHqvwwJVCajgoY7GWYwf+mUnwTtI5kLGxZV0wVcCWjOQtSbulOtb9a4Paz+JiQEhMSlBoqifTZNuZvUdrN7+JL22y6KvIIB6unzsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KCbqX4QlZ/OcpJaWB0jvClKS/rG7urBif+eHYa3M1fg=;
 b=CcIOvKPFIm56KHvdHUA2tEX34qr1SuorYQXgP7Tw2m8rPdNnnQ7BAw8bHLr5T/U4gYc5sThKllEHmnXLMDT7v+JAF/22ihjKe/3WuP4AHA6xvMyal1idUYfxXIYEdaqUezSsiNQ5BFK90cQf1qJixq4X0gJw4ZwDRvP8KCzXsi4=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SI4PR03MB9114.apcprd03.prod.outlook.com (2603:1096:4:26e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Wed, 17 Apr
 2024 08:36:54 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::bc7c:deed:ae:ed4c]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::bc7c:deed:ae:ed4c%4]) with mapi id 15.20.7452.049; Wed, 17 Apr 2024
 08:36:54 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "mripard@kernel.org" <mripard@kernel.org>
CC: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v5 1/9] drm/mediatek/uapi: Add
 DRM_MTK_GEM_CREATE_ENCRYPTED flag
Thread-Topic: [PATCH v5 1/9] drm/mediatek/uapi: Add
 DRM_MTK_GEM_CREATE_ENCRYPTED flag
Thread-Index: AQHahbGbJAQJP2BTyUuB60+FvPVWmLFpJFcAgAMVEYA=
Date: Wed, 17 Apr 2024 08:36:54 +0000
Message-ID: <b1d0112d5f988acade7c925405ba1abea5623cb0.camel@mediatek.com>
References: <20240403102701.369-1-shawn.sung@mediatek.com>
 <20240403102701.369-2-shawn.sung@mediatek.com>
 <20240415-ultramarine-oxpecker-of-completion-8a2298@houat>
In-Reply-To: <20240415-ultramarine-oxpecker-of-completion-8a2298@houat>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SI4PR03MB9114:EE_
x-ms-office365-filtering-correlation-id: 8eb39e39-1b08-45a0-844d-08dc5eb9890e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: =?utf-8?B?SXFacnE1WTFMVlo4MFlwSHJESGpXY2RZb3N4MEc4L1lVRXlWak54amNNZ3du?=
 =?utf-8?B?Yld1SVVaVk9JL3k5MmdWamNCWUtOcldVeWxnY2l2clljSDRGaGJZeG5VYmdK?=
 =?utf-8?B?ODN5RGFMZkdUQVdIaDlNSSs2aUZwWTM1N1ovL29Eek1yRk4vTG50SlVJZTJZ?=
 =?utf-8?B?SEpKWktQUk5rd0dEb0lsRW5HL0ZtdnJORmRqdWVKY005NXhnejBIVWMzTmpv?=
 =?utf-8?B?ZGlmZmExdU9JOUprNktGWjQ3VmJPeUUxNUlSanM0dFYxNXArMzhCY3hzUHdl?=
 =?utf-8?B?TnVheTdENVVEMVZyUDdzQUQ4ZEVXbGplTm1Ta2J1S2ZvZ0lKcUdHQ1lZZ25h?=
 =?utf-8?B?Z2VvbElIdEYrVDltZW1XbFJGbnhybWZzTk5VZS9id09pN3pacC9tSDl5M1pn?=
 =?utf-8?B?Z0dvbVBVV0lTbFJmRFpsOG9QUlU1VU93cHp3bGNlZEdmZmJHem1hOGFMWTZT?=
 =?utf-8?B?aHYrSFN4aStlejU0VDZTeFllVnIzVVZXdVJqcGhFRnk3SnROZ1dEcWhUK3lt?=
 =?utf-8?B?NnRrdzBkWTlHakFnYTlqV0R5ZnJFeHpUL3YrS3FhcHdCcThBRHlOZ3dzcXVm?=
 =?utf-8?B?cE43cTg0RUEwQURtUjFwbDY1TFp0T2sxeDJGZWd3ZjR5WmxGWUh3MU9tYzJK?=
 =?utf-8?B?V3QvbktvaEtTWUE3bGxwZnhLZDZVR25RcXJCemZVeTV6RDdsOG9PaU5mU3pJ?=
 =?utf-8?B?Ym9YaGx0THlrWENtOGRzUk51Y3IwZDJXVWZZOUdnMSt4Wi80Vmk3YlVScXdo?=
 =?utf-8?B?N0dtQ3RpdkZoRWsyQlREc0lvRVZ3eVJ3c2N5T1hFQTVacHFaMCtlZXlaNnFM?=
 =?utf-8?B?VlNGbHFsOGkrbVQzSVpGZGQ1NEhwT3VYUUdDMS9kKzJjeFVvWlp5V1Uybkh5?=
 =?utf-8?B?SmVVTUFCV0Ewek1HN3J5ODB0czZzY3ZnWmxkSExXcTlVMW85eDhCbzVsUFFt?=
 =?utf-8?B?dDZKVXJMR0pjT0xaN0R3dzgzSEdHZkhIZTI4cGkwdzZjNWY4OVJKdHQwS1Ux?=
 =?utf-8?B?Sm5ZZktpQ1pBTFlIWTIrRFlBWUhxZU5zWWEwaEx1RDlWZ0haTzFPT2V0NXh1?=
 =?utf-8?B?b0hkNW5IMlY5azJjRGUyYmJHeWxZUU03TkxwWVdCdDVaVWJUaVVpenV2Z2dZ?=
 =?utf-8?B?cVNaVndXN1hvNzZNZ2cwUU5TTHEwYzZ6aGFLYytYbmZXdm9YUmdOZ2ZtWWxB?=
 =?utf-8?B?djNnaUJObXU1ZkhwR2NxM2ZmVXFIY0R6NnhZUDlvUm83WGhjMER2OHg2Rmd6?=
 =?utf-8?B?OFNPUU94aW5ia3Y3UldlZVBGQkxnbTBKNTdHYmRJZnZieWRudmVKWG5uU0hF?=
 =?utf-8?B?Mm93cjdra0IwMDFCMDR0ZWNadWx4UFhKVUUrUWc5OUhjZGd0OCtMYWhmdllE?=
 =?utf-8?B?M1NnSm83WEhidnA1RHFzeWlZTDFJUC9hMWdObStyMmI3Y2ZSakVwa0I1bUV1?=
 =?utf-8?B?dzF0WllBVGtoeExDc3JUYXIrL25PdlJRQ2Z5eXVCWG5DLzRZM2E0RGE5azUz?=
 =?utf-8?B?UXh5VEJLSUJkdlJsY3FKOFZnVlhpcFJKakxXOS9vT0o4N1ZVRkFMeWlmc2wx?=
 =?utf-8?B?QUxLL3VWUUVtMGYvakd4RjlBaGtHVlNvM3NkTXdXNWlNZWgvNkIwMWVHQmVD?=
 =?utf-8?B?Z1U5TnIzcEtadERQYkNXaTBnWEFTQ0dYUmhab2NtV1NORWRoY2swbWtGRDVJ?=
 =?utf-8?B?Y216N1I2b3RhcDJ5bEdqcUFoZGlOSUJXN25oaUNDT2pnLzZ4VXRqdnF6c0NH?=
 =?utf-8?B?M2owMnY2bkNTZjR0SlphcFBiQjk4RmVLZVgySjA3cHFxK0RUOUd3dWFncnhv?=
 =?utf-8?B?NFZFQ21jNFltY012NjBNdz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(7416005)(366007)(38070700009); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NVFiQVpaTC82bzdKUDlYaW9YZll5TTFHemczYm84Z1V2Sm1uUENIVVZtSmFG?=
 =?utf-8?B?TzYzZFZBNjduTTlSbVY5OE0rQkUyaHFoWEE5N01GdTRJZ00wblp1WnpkblM2?=
 =?utf-8?B?dHVBRWYxMGZZWEtRQ1BFZ1M2RjYwejU5Q0VhdHIzUDJmaFhkbVVoUEFaTG1Z?=
 =?utf-8?B?V2pBVzNwY0NUby83YnpKMGxjaDhXeTl6dCtYS0ExY0pQRDRZVU0yT05sMzIy?=
 =?utf-8?B?ejJqZDRETjNzK2hRb0pGS1dxY1hrZWFpN3cwTHdGbEo1U3B1UzNMM1FxeEp4?=
 =?utf-8?B?Q2ZWR1JYdEQzUlc3aXg0S0RZeUtEM213cWNaNk1vMnZtTHpCT3BzQ3NlTG5L?=
 =?utf-8?B?b0haT09BcVJsb1BsMVM2SzhBUVdrSE00YXdpUGpKVVZnNHpsS3o2cHlrcDdM?=
 =?utf-8?B?ODJFYVlZRm8zOUNvUDlMTVM4cGtMU0phVGxBUHZ3Qmp5RGZZTXpDTFgwS1Zm?=
 =?utf-8?B?OE9YL0t4RmJkQVdlNHN0RVRRZURtcTViT2JQUkdYYlZPckFXSUxiNWlPT2M0?=
 =?utf-8?B?NzhYdWV3MXdUKzJNUSs3cGxlQ05nWmUzbnFmNmt0N1JOWTVUR1IzVGJCQWQ3?=
 =?utf-8?B?SUMySWowUjBEV2JOYy91Skt2TW9BdWJYV3djcXJkR2xGZll4Y1llc3EwaHJC?=
 =?utf-8?B?RWk5VFljTzJKVDVJcmgrZk0yRXpkcWVuUEJFeFJXbFpIOTA5SkxpMlJHQXJ3?=
 =?utf-8?B?bS9VakZZdk9VVGhHYTVJaHhYdjFJSllra3Ywb0FWVVhDeXFsTWlaRUV3bXlr?=
 =?utf-8?B?aEtuUzhUSWg2cm1VVlBoTjl1L0p1UXBUa2IyUWg1QWVBY1dYVFF6b3BMYTBO?=
 =?utf-8?B?OHBjTGM1anJyV1BwbFZTMHlPMkdJcjA4K2JWZWdxRVFQbDdDOWZrTm5Mc2N6?=
 =?utf-8?B?MllPQmRRUmcrbVhKUklITHNqT0ZWTTV6eVp6RlBuM2N3cjdqMFljWDJmWjRz?=
 =?utf-8?B?WlN0Z3JUUUgzeUgzaElWTngxQ0lyNU9WQXk1L2xVZVBla0Eyckg5aEhGU3hD?=
 =?utf-8?B?Qkh6SzFqTk15aUFkcHgrNHRqb21NQ096SXNlbldlKzJnYTM3ZG9MZXl6ZjZu?=
 =?utf-8?B?azc3bkZ3VTNGT2FYaGR5REhna1FnWmQ1STEvM0lJUFhVVmp2T2dpOGZFbFp0?=
 =?utf-8?B?eHVQNW41UU41SE9hcUVLR2t6enNlN0J1aEZhak1lcnZTY1dFcXJaQk9PdHNn?=
 =?utf-8?B?UnVCNDlSV24xUzFVbmVXSW8rUWV4K2tjOGFnOGhoMEt6Y0FIWFdPaHg2RlF5?=
 =?utf-8?B?ZkFqWmxOdU0zcWRGQTJUK21YNVBFcEY1My85UmdoTC9wUUZNSDdTZmp1VFUz?=
 =?utf-8?B?K25CaHpuM3JtNkZQZ1VibVJpNk1zQU1sNEhxY0IvbVdDRi9uMmtrekp4Wm1P?=
 =?utf-8?B?ekkzeUZUbFgyRWVUUkZnUGhxemlVOHNiVWVnUzlIeDUwU2oyTVFkVTdYdGRa?=
 =?utf-8?B?cktCcDVtWGlYdi8zdzlnaU1CZXJzKzJ5dXlJOFRVZlpVRGY4QS84RTBFYlhS?=
 =?utf-8?B?bDllOUQvczdjWkJFNENScVo4N2xpMnMwdm1NeEt1T05KWTZkYk9MeGttWHRJ?=
 =?utf-8?B?aW4rYTdiZXhFcFVyZXVXQmtZWGFyUFBwa1Y1WEQ1V21DOUxRRjNIdHFBRmZr?=
 =?utf-8?B?ZmhlVjVxc3JKYmR3Y2ZObmRMSlVxbU8xWnhEY2Z6S0JKSXUwUlh5T2tTMURy?=
 =?utf-8?B?SHNubTBoWUFDQXE4NFdobDF4YVZOanY0ODA0U2EyN1BSdDBhakRtZExhZzQy?=
 =?utf-8?B?ZkpCUjJOeS9lZDNsd3g5bG92SlBBV2t1MUQ5NllGQklTcVZkRVVsVy9Fb2Zx?=
 =?utf-8?B?SXFtZ20zQk15anNWUklNaFFEdFpkRFR0d05Pbk1hVjkvNFY3YXJXRG1jQnp3?=
 =?utf-8?B?UGl0L0hicG4xK0hRSUpjQ00vNjlOdmZhbjFXZVg5U2x3bXhsSUZGMWxiSDI0?=
 =?utf-8?B?T2FveXFqVEhGVXNZaWdKMDZBUW9jWUJVbW1VeWtJbTJsdG1kTWhNNU5yekpN?=
 =?utf-8?B?cE1seXBlNEs5U1Y2R21RNTd3UndZMnNqT1ZURE1BYzkvR3F1WjBDY3RoY1lN?=
 =?utf-8?B?RzUrZ3UwTjBhTGhzYkhMbmt2NEdabVZwZS9IeS9TbEJzbTdKMHl3Slp5RytL?=
 =?utf-8?B?RXdIeE4zcmRYWEhmYjIySk0xUXphTHFZUjdscGxaODMvbnZnekF1cTA4ejFI?=
 =?utf-8?B?blE9PQ==?=
Content-ID: <C2C8D8505A3D114684883BCA04081C4C@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eb39e39-1b08-45a0-844d-08dc5eb9890e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2024 08:36:54.0923 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bB1m4sOl/IE2JTktjPpRlqvYrH+kWUEwJwoisTMrPB46/Q2308N1AIRoXfzcaH6lK4FWngJ/lwda0RoE7avI/nZrCnMm2fYmpCsPiNpyLdw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI4PR03MB9114
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_004_1183272113.1589183805"
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

--__=_Part_Boundary_004_1183272113.1589183805
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDI0LTA0LTE1IGF0IDExOjMyICswMjAwLCBNYXhpbWUgUmlwYXJkIHdyb3RlOg0K
PiBIaSwNCj4gDQo+IE9uIFdlZCwgQXByIDAzLCAyMDI0IGF0IDA2OjI2OjUzUE0gKzA4MDAsIFNo
YXduIFN1bmcgd3JvdGU6DQo+ID4gRnJvbTogIkphc29uLUpILkxpbiIgPGphc29uLWpoLmxpbkBt
ZWRpYXRlay5jb20+DQo+ID4gDQo+ID4gQWRkIERSTV9NVEtfR0VNX0NSRUFURV9FTkNSWVBURUQg
ZmxhZyB0byBhbGxvdyB1c2VyIHRvIGFsbG9jYXRlDQo+ID4gYSBzZWN1cmUgYnVmZmVyIHRvIHN1
cHBvcnQgc2VjdXJlIHZpZGVvIHBhdGggZmVhdHVyZS4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5
OiBKYXNvbi1KSC5MaW4gPGphc29uLWpoLmxpbkBtZWRpYXRlay5jb20+DQo+ID4gU2lnbmVkLW9m
Zi1ieTogSHNpYW8gQ2hpZW4gU3VuZyA8c2hhd24uc3VuZ0BtZWRpYXRlay5jb20+DQo+ID4gLS0t
DQo+ID4gIGluY2x1ZGUvdWFwaS9kcm0vbWVkaWF0ZWtfZHJtLmggfCAxICsNCj4gPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUv
dWFwaS9kcm0vbWVkaWF0ZWtfZHJtLmgNCj4gPiBiL2luY2x1ZGUvdWFwaS9kcm0vbWVkaWF0ZWtf
ZHJtLmgNCj4gPiBpbmRleCBiMGRlYTAwYmFjYmM0Li5lOTEyNWRlM2EyNGFkIDEwMDY0NA0KPiA+
IC0tLSBhL2luY2x1ZGUvdWFwaS9kcm0vbWVkaWF0ZWtfZHJtLmgNCj4gPiArKysgYi9pbmNsdWRl
L3VhcGkvZHJtL21lZGlhdGVrX2RybS5oDQo+ID4gQEAgLTU0LDYgKzU0LDcgQEAgc3RydWN0IGRy
bV9tdGtfZ2VtX21hcF9vZmYgew0KPiA+ICANCj4gPiAgI2RlZmluZSBEUk1fTVRLX0dFTV9DUkVB
VEUJCTB4MDANCj4gPiAgI2RlZmluZSBEUk1fTVRLX0dFTV9NQVBfT0ZGU0VUCQkweDAxDQo+ID4g
KyNkZWZpbmUgRFJNX01US19HRU1fQ1JFQVRFX0VOQ1JZUFRFRAkweDAyDQo+ID4gIA0KPiA+ICAj
ZGVmaW5lIERSTV9JT0NUTF9NVEtfR0VNX0NSRUFURQlEUk1fSU9XUihEUk1fQ09NTUFORF9CQVNF
ICsgXA0KPiA+ICAJCURSTV9NVEtfR0VNX0NSRUFURSwgc3RydWN0IGRybV9tdGtfZ2VtX2NyZWF0
ZSkNCj4gDQo+IFRoYXQgZmxhZyBkb2Vzbid0IGV4aXN0IGluIGRybS1taXNjLW5leHQsIHdoaWNo
IHRyZWUgaXMgdGhpcyBiYXNlZA0KPiBvbj8NCj4gDQpJIHRoaW5rIHdlIG1pc3NlZCB0aGUgcGF0
Y2ggWzFdIGluIHRoaXMgc2VyaWVzLg0KWzFdIA0KaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9y
Zy9wcm9qZWN0L2xpbnV4LW1lZGlhdGVrL3BhdGNoLzIwMjQwNDAzMTAyNjAyLjMyMTU1LTExLXNo
YXduLnN1bmdAbWVkaWF0ZWsuY29tLw0KDQpJJ2xsIGFkZCBpdCBiYWNrIGF0IHRoZSBuZXh0IHZl
cnNpb24uDQoNClJlZ2FyZHMsDQpKYXNvbi1KSC5MaW4NCg0KPiBNYXhpbWUNCg==

--__=_Part_Boundary_004_1183272113.1589183805
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO01vbiwmIzMyOzIwMjQtMDQtMTUmIzMyO2F0
JiMzMjsxMTozMiYjMzI7KzAyMDAsJiMzMjtNYXhpbWUmIzMyO1JpcGFyZCYjMzI7d3JvdGU6DQom
Z3Q7JiMzMjtIaSwNCiZndDsmIzMyOw0KJmd0OyYjMzI7T24mIzMyO1dlZCwmIzMyO0FwciYjMzI7
MDMsJiMzMjsyMDI0JiMzMjthdCYjMzI7MDY6MjY6NTNQTSYjMzI7KzA4MDAsJiMzMjtTaGF3biYj
MzI7U3VuZyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtGcm9tOiYjMzI7JnF1b3Q7SmFz
b24tSkguTGluJnF1b3Q7JiMzMjsmbHQ7amFzb24tamgubGluQG1lZGlhdGVrLmNvbSZndDsNCiZn
dDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7QWRkJiMzMjtEUk1fTVRLX0dFTV9D
UkVBVEVfRU5DUllQVEVEJiMzMjtmbGFnJiMzMjt0byYjMzI7YWxsb3cmIzMyO3VzZXImIzMyO3Rv
JiMzMjthbGxvY2F0ZQ0KJmd0OyYjMzI7Jmd0OyYjMzI7YSYjMzI7c2VjdXJlJiMzMjtidWZmZXIm
IzMyO3RvJiMzMjtzdXBwb3J0JiMzMjtzZWN1cmUmIzMyO3ZpZGVvJiMzMjtwYXRoJiMzMjtmZWF0
dXJlLg0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtTaWduZWQtb2ZmLWJ5
OiYjMzI7SmFzb24tSkguTGluJiMzMjsmbHQ7amFzb24tamgubGluQG1lZGlhdGVrLmNvbSZndDsN
CiZndDsmIzMyOyZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtIc2lhbyYjMzI7Q2hpZW4mIzMy
O1N1bmcmIzMyOyZsdDtzaGF3bi5zdW5nQG1lZGlhdGVrLmNvbSZndDsNCiZndDsmIzMyOyZndDsm
IzMyOy0tLQ0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjtpbmNsdWRlL3VhcGkvZHJtL21lZGlhdGVr
X2RybS5oJiMzMjt8JiMzMjsxJiMzMjsrDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyOzEmIzMyO2Zp
bGUmIzMyO2NoYW5nZWQsJiMzMjsxJiMzMjtpbnNlcnRpb24oKykNCiZndDsmIzMyOyZndDsmIzMy
Ow0KJmd0OyYjMzI7Jmd0OyYjMzI7ZGlmZiYjMzI7LS1naXQmIzMyO2EvaW5jbHVkZS91YXBpL2Ry
bS9tZWRpYXRla19kcm0uaA0KJmd0OyYjMzI7Jmd0OyYjMzI7Yi9pbmNsdWRlL3VhcGkvZHJtL21l
ZGlhdGVrX2RybS5oDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtpbmRleCYjMzI7YjBkZWEwMGJhY2JjNC4u
ZTkxMjVkZTNhMjRhZCYjMzI7MTAwNjQ0DQomZ3Q7JiMzMjsmZ3Q7JiMzMjstLS0mIzMyO2EvaW5j
bHVkZS91YXBpL2RybS9tZWRpYXRla19kcm0uaA0KJmd0OyYjMzI7Jmd0OyYjMzI7KysrJiMzMjti
L2luY2x1ZGUvdWFwaS9kcm0vbWVkaWF0ZWtfZHJtLmgNCiZndDsmIzMyOyZndDsmIzMyO0BAJiMz
MjstNTQsNiYjMzI7KzU0LDcmIzMyO0BAJiMzMjtzdHJ1Y3QmIzMyO2RybV9tdGtfZ2VtX21hcF9v
ZmYmIzMyO3sNCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMy
OyNkZWZpbmUmIzMyO0RSTV9NVEtfR0VNX0NSRUFURTB4MDANCiZndDsmIzMyOyZndDsmIzMyOyYj
MzI7I2RlZmluZSYjMzI7RFJNX01US19HRU1fTUFQX09GRlNFVDB4MDENCiZndDsmIzMyOyZndDsm
IzMyOysjZGVmaW5lJiMzMjtEUk1fTVRLX0dFTV9DUkVBVEVfRU5DUllQVEVEMHgwMg0KJmd0OyYj
MzI7Jmd0OyYjMzI7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7I2RlZmluZSYjMzI7RFJN
X0lPQ1RMX01US19HRU1fQ1JFQVRFRFJNX0lPV1IoRFJNX0NPTU1BTkRfQkFTRSYjMzI7KyYjMzI7
JiM5MjsNCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7RFJNX01US19HRU1fQ1JFQVRFLCYjMzI7c3Ry
dWN0JiMzMjtkcm1fbXRrX2dlbV9jcmVhdGUpDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1RoYXQmIzMy
O2ZsYWcmIzMyO2RvZXNuJiMzOTt0JiMzMjtleGlzdCYjMzI7aW4mIzMyO2RybS1taXNjLW5leHQs
JiMzMjt3aGljaCYjMzI7dHJlZSYjMzI7aXMmIzMyO3RoaXMmIzMyO2Jhc2VkDQomZ3Q7JiMzMjtv
biYjNjM7DQomZ3Q7JiMzMjsNCkkmIzMyO3RoaW5rJiMzMjt3ZSYjMzI7bWlzc2VkJiMzMjt0aGUm
IzMyO3BhdGNoJiMzMjtbMV0mIzMyO2luJiMzMjt0aGlzJiMzMjtzZXJpZXMuDQpbMV0mIzMyOw0K
aHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhdGVrL3BhdGNo
LzIwMjQwNDAzMTAyNjAyLjMyMTU1LTExLXNoYXduLnN1bmdAbWVkaWF0ZWsuY29tLw0KDQpJJiMz
OTtsbCYjMzI7YWRkJiMzMjtpdCYjMzI7YmFjayYjMzI7YXQmIzMyO3RoZSYjMzI7bmV4dCYjMzI7
dmVyc2lvbi4NCg0KUmVnYXJkcywNCkphc29uLUpILkxpbg0KDQomZ3Q7JiMzMjtNYXhpbWUNCg0K
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

--__=_Part_Boundary_004_1183272113.1589183805--

