Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F937989967
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 05:21:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F24F310E37F;
	Mon, 30 Sep 2024 03:21:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="HVkZM9g6";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="JQYy2cMv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B08D10E03A
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 03:21:06 +0000 (UTC)
X-UUID: 059369307edb11efb66947d174671e26-20240930
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=4pvf5p9F0XvofkuwY8zwDC8lO0q4SyAQAhPOrVU/HE4=; 
 b=HVkZM9g6ccopu4DHSM7vDdPz4SRpvh1DNihcTwl+crmEh+FBTigMQLVPzMWrI+cSVmA+sglUGwlLGidvNooT2tfVZWL4jQUOJWFMXkXlwMvsiBVW0/gE+BK2LeqMPgmRY87RwP5Q1WtZimZaNj46VnK2BQXWQ2vjlz6luqjP/HA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:41e898fa-0471-44fc-b95b-1d06d5fd0172, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6dc6a47, CLOUDID:49967318-b42d-49a6-94d2-a75fa0df01d2,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
 l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 059369307edb11efb66947d174671e26-20240930
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by
 mailgw01.mediatek.com (envelope-from <moudy.ho@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2100895858; Mon, 30 Sep 2024 11:21:02 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 30 Sep 2024 11:21:01 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Mon, 30 Sep 2024 11:21:01 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rgP6Ma9c/6gc4ka3K9zT09Q+Rjl+ZbToFyH70KAT93BMSUBYW1q+vlt0p18DL5RqaP5YpdkOSw66aZHNFrTsRHPW2lDRPW5qlFcE5SzK2HN7KRoQ+MtYVBzO7AP2KjbfoS2hz2D8e2QRLC+gPkOa2AxovAaWBV2juarCbjcdWaVu+ClOIbJalkC7tTCekU4vhzmcvrfy/QLNqFrGEZ5w7NtbB5daRNq91bJq+7PCmS1tmsQx7d182fswy3UQmOa1fiE+xDNcDCFurdkAxUkW+mXWVuYhlxn3or+wKKvJbDSNSDz1q7ilJhrt1glMoREBCtvRdAiOOUYolw81T8jO7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4pvf5p9F0XvofkuwY8zwDC8lO0q4SyAQAhPOrVU/HE4=;
 b=lYOAwV/pcv2Oypq+dLHMjiff1dN0mcZDZwLQtBn1LIIO/HMx6Jv65rApcLaljE/KOf+XOH6cvQRXXkePFB2PVpT4EJo+pU/n4O/C935fZeTAR1ZTyRB+ItwtSnlUWkPwVUYbbvc9+2WSQx3ShQRjyZsSKL8gFRuxyyUDPCCSsd/uDuVMltJq7+S+EfTbIXHqGuT2IWWHT9MDGj8erbegLf7wqO18h8HEHcD2vDzz585moDGi0Y2N9kZSpbHeZK9lDwEcCadooGctk9LJeop4HaaJrm9F0phGw+JfG/sx9iw5Ml/jjMttWMJNDv2r6/RR0jOwOikkb5H4PmmEvicRBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4pvf5p9F0XvofkuwY8zwDC8lO0q4SyAQAhPOrVU/HE4=;
 b=JQYy2cMvsEbCcIvDWPJv1+1pSmVLzbqnbI94qZoXA/MebBoLuPui0sFGDZLG+amK4jcUxYShfDA3+k55pe/sWEEFB6zYqUwNp4jz1ipQxnQKw/kRRLyFz4gdZcUetJS5+nYJCp4Jhuj/cAPIe3sUZrMT2rKGQWY1qHYirhRA4ec=
Received: from TY0PR03MB6356.apcprd03.prod.outlook.com (2603:1096:400:14c::9)
 by OSQPR03MB8772.apcprd03.prod.outlook.com (2603:1096:604:273::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 03:20:58 +0000
Received: from TY0PR03MB6356.apcprd03.prod.outlook.com
 ([fe80::cb39:b94b:1fd9:2f84]) by TY0PR03MB6356.apcprd03.prod.outlook.com
 ([fe80::cb39:b94b:1fd9:2f84%6]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 03:20:58 +0000
From: =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>
To: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, 
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "mripard@kernel.org" <mripard@kernel.org>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?=
 <ck.hu@mediatek.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
 =?utf-8?B?TWFjcGF1bCBMaW4gKOael+aZuuaWjCk=?= <Macpaul.Lin@mediatek.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "moudy.ho@mediatek.corp-partner.google.com"
 <moudy.ho@mediatek.corp-partner.google.com>
Subject: Re: [PATCH v2] dt-bindings: display: mediatek: split: add clocks
 count constraint for MT8195
Thread-Topic: [PATCH v2] dt-bindings: display: mediatek: split: add clocks
 count constraint for MT8195
Thread-Index: AQHbEKFZtJplMt7Gp0Sp496AFj88+LJrVlIAgARX8QA=
Date: Mon, 30 Sep 2024 03:20:58 +0000
Message-ID: <41b226173cfd945aef7be9bd4d9e7e0603b0ebbc.camel@mediatek.com>
References: <20240927055140.19688-1-moudy.ho@mediatek.com>
 <0610bf4f130f238af148334969dfc0373cdb16de.camel@mediatek.com>
In-Reply-To: <0610bf4f130f238af148334969dfc0373cdb16de.camel@mediatek.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY0PR03MB6356:EE_|OSQPR03MB8772:EE_
x-ms-office365-filtering-correlation-id: 26a1aa31-2247-4413-c602-08dce0fee74e
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|921020|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?UDhLSTVoalhMOXQyb1BVWDk1ZTZNS2lsa1FPT1J6emI4WUYwanNzZjlnZWZs?=
 =?utf-8?B?bDRZUnE4UGdvQ3VwamtQOFppOUhycGJNcjhDaFIvWHFkT3hpeURkYWNvMTY4?=
 =?utf-8?B?NWY5UWpXVXJ3ZzhZMi9BeGVYUko0aC9MTy9odlgyMU1LenkxVjkzWjNoQWxu?=
 =?utf-8?B?TC8rWTNqMTFjYTM2RVU3NEYwejBsdmhxbFp4RisvTWtVWGdITVBkTUovb1p2?=
 =?utf-8?B?d2ZrdHlwRGFCQ1E5SXJYczhFSE1iV1QwdVN6cWp5Wmw3bklYM3A3RTFrT1NJ?=
 =?utf-8?B?eElGQkZJM09OTXBCVVdQT0Z4cnRvUzNidXhtZTNvVG9CM09WKzk1TEhBaEZ3?=
 =?utf-8?B?SVBCMVVuVlRVQ1FHUHM2Nng3eE44RWxXVTlzNTdsYkI2b3QzWHU5WS9uYVNh?=
 =?utf-8?B?SHh2dE5udTh1Q01HNkV2cWJWNHFJZG5GSVY0QlA5WGtza1RXT2FYUkx2VEdr?=
 =?utf-8?B?VkJlYXlvU2VIYkZ6NnJHa3o1eDV0Ukx0SEZNVmxLa2Y4UDVzbGt1aG5kRVdJ?=
 =?utf-8?B?OXBkS1lIQ3J2YUg3RVVyYjMwWHlaWENGNVFmaWpRUEdobW9FMVdGWWRvdGJZ?=
 =?utf-8?B?SS8yVXR6SFNlNUVxbDg1T2o2WUQvVUc5OCs3cGVlcFBRSndYZytsRDNoMHVi?=
 =?utf-8?B?SFpndHdoRVFDaVlBR1VBUlNROEhKQXN2YkxIMkcvZzJCa3I2ajFCcXQzVkdO?=
 =?utf-8?B?ZVovMHlLbXorcmdSb0FmVSs5WWhldUsvbW9ZU051b0RyR25RNDhId3FEOXBN?=
 =?utf-8?B?dWw1U2xHZGFWYnBMSWM2ZWpYRlBpU1FlZms0ZXVsR2puSnpTMXBWMytDaWpL?=
 =?utf-8?B?UEFBQ3EybTRwTFhBZ3FtcnBvSWUwL2wxZVRDT3gzb3JQRFNyOEM4QnI2RWto?=
 =?utf-8?B?Ymt0MHB4S05WTmVUZHZ4R1VUVEdzY1dYdzdsNkhRMXR1OTE0aVZOL1FxTWtQ?=
 =?utf-8?B?b1h6Y2ZDVVNYY1RJTmQvK3lOSnczVHh2U1VDNmxkTlJjdDd0OGJzcWwwek5v?=
 =?utf-8?B?blptNzZYdTdtVEhyR2RBMWdOdDhKYjZlNnU0NzI1aU8vVXQwVldqQXJGUWNM?=
 =?utf-8?B?Z1lobURiZG9LcFpBay9MaUtiRjJZNm90bWNiZUltUDIrUmdXVUwxMHlxUTUr?=
 =?utf-8?B?c1YrdzFFT3BRQi9xVWJuZXllVVUxNkFISWUwNUppRW9iOUtFNHcwblRvZzdG?=
 =?utf-8?B?c1VlL3NiUldxQlhMTHZ1NzBHaVFjYmtIN2hKc0hWUHVjMEZhakhueXJiZ2U5?=
 =?utf-8?B?bW96SGlPRzVabDJLVURqbGFPOTl1M1hHNmZGUWxpcEhMaHJZN0pDMVBNd3FM?=
 =?utf-8?B?Ymtxc0YwaFpFZ25sTmVabEZ2VHJ4MHVYZjFDQkVoSkFucVZQK0dOaVpVdzJr?=
 =?utf-8?B?SEtvdWRZVHRIUitkemZyWE1rNjgrTk1LaGVzZ3pGRHpHMWRpem1CYm9JQ1My?=
 =?utf-8?B?WW40dWcvaUx1YTdYNjlPOXFPdEZIaFlFOHNwYnBhK3NEbHJqaVJWZlNvZ1JH?=
 =?utf-8?B?YkVyVEd0VE1qQWZOK1UySXJQY3ZwdnF4N1B0QXBpdkZpQ1poSXB5SWM2Qnlz?=
 =?utf-8?B?amhZdzJGNkZDUEtvYy8vdEFhODNEelFTcy9lT0p4NjdraHBaU3k0M0pRZjVQ?=
 =?utf-8?B?TUZoOG1lQ1FOenRaS3lUNVl0OEhFREdSbVNhZ0E2b1U3cGRLWGlCSE4xZTZw?=
 =?utf-8?B?K3h3dnlkQlU2TzhzRnFUQzA5cXNNZjZUTEppSUJVaUdPR0V6Z2xNcW9GZG9o?=
 =?utf-8?B?ZHVOZVgyaW9OSTJ0S0tnUzVDak5zYTNTU08ydVJPWUoxd3U4UnVUMGNoQzhC?=
 =?utf-8?Q?QRK+XUGngdivaVTOHoRpk1m1dOYuJs2Xr1qK4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY0PR03MB6356.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MXowY2UwUDNKSWtPUGFzdGMxYVQ1VmVVVy9DYkE0WkFzQjZJKzhWTXV0N014?=
 =?utf-8?B?aXVnZENHck9OR1RFdzQva0FaMVdnZWJuRmtFKy9CcHdvSkpHV3lBZzlDdXdk?=
 =?utf-8?B?czFqU1VFVG9WOXk0VC9XMk52S0JUL01Zb1ZxWWtmcnFLK3VmZkdSdmljU1kr?=
 =?utf-8?B?UXl0SUFKWllpQjdKZzVwRGZraXpnN2NWL2hraE10RlREalBJNUs0STRUWnlv?=
 =?utf-8?B?cDB3NE5nMXM3VklEajdhSzlOb096dHFvYzNsVEtRelk4ekkyajN6ZkRkVnA2?=
 =?utf-8?B?eWk2Nk1qZWNYSVdwZ2x0QlVpUGMrY3UwRnpKOUI0WGZUT3EvdHZhT3lGeTRL?=
 =?utf-8?B?T2kvWElrdmdtTC9RV3I3L21NL2ZhTkZ1S2I1bUtXTFJoemV6ejBSYTJCYjNP?=
 =?utf-8?B?cEd2c2JmZFNyMDlIK0NUVUJmTFE5WTJaUG1sa0gySzN4TEF2Mm4zblJIb3VP?=
 =?utf-8?B?bTJXWGdOVW52QTkrclVrczBhVzBuOFpqMDhzWWRZS01PakpTczhwOGZkWnQ2?=
 =?utf-8?B?T2cvT2ZpaTJHWkRsRU9oRXNKVnFaMWxnMmYrQ1BIajliRTN4QmcvbzUrdzlS?=
 =?utf-8?B?VEdpNkxaU1pJS2JIOFRGaWowei9QL2c1emoyQlBGOW1pbjVrd291SWhqb2VH?=
 =?utf-8?B?N1BGbUJ2eFg5cnhrR1BwS3ZYQTFpUDZWTyt1Q1BqL0VycU8yZnI2Qk1Md2c1?=
 =?utf-8?B?TDRnRDRycjFFc0Nlb3ZxL2M0SzFKQnhuYzNBK09NZjhkQ1FJUytuUXJQaE92?=
 =?utf-8?B?YzVOVnVSVEtjY0NSNFQvOEJuMm9JWUVlQ3cxSVpnL3ptSTMxNE5FaDlpd2ZS?=
 =?utf-8?B?OWR2OUx0R2RDR1ptQktRdXpyZWhhY0dzR01jNlJxWG9CeldnV3F1SUJzOHI3?=
 =?utf-8?B?SHQ1ZzhZdWViOHY0TkdtQUowcFc2YUQ0ZTFoYkM2dElUWkV0N1JtTTdqalhG?=
 =?utf-8?B?ZWh3Uk9zRzFpRUZWbU55dVRYL29CVG9HenBLdDRsT3NVTy84bFA3ZzROdEFF?=
 =?utf-8?B?TUlENFl0U0NjdTI4aGd3Mmo1SjUzY2RZZFJGWEpDVkZ3bFQzeFkwN0hUM2Fp?=
 =?utf-8?B?YmQzYnQrSTMzemVQUzcvWjZBK0l6akluYU96aXdKSWFtY1ZVT3J4dStpalRu?=
 =?utf-8?B?YmFEd0wvQktYTzdlenh2dThMeEpaQjNEMlVxUllRQjlNcVM3YzRFRm5Udjl6?=
 =?utf-8?B?LzYwZk01Q3dPMDhIYW1XTnYvVG1rS3NTQ0dwODlEUUR1YjBYYzVtb2sxb1B1?=
 =?utf-8?B?RHhZUGpvSmN2eHVkdjh5MW05QXNBdjlBNG83SmFmNTU2OEM0UDFtQzZMM01C?=
 =?utf-8?B?YkQvUHlvRmNsbk9rN01nZkRNMUZSS3NXbUFYN2tnZHJQQzdsbGFzaVhqRDJz?=
 =?utf-8?B?c0VOb0psNHBpR251QmpxVGlzbTBOLy8xQjh1Lzc5OWdMSWhlaWkzUVJ5bFd3?=
 =?utf-8?B?VWQ5dkpNUlVWU2lBRi9oNS96TnpEK3pWeWxCejVUOHhRaTFmVmJsN29pbkZi?=
 =?utf-8?B?NWROQVNrS0dVWFhtZHUxZVMzcGNiQlljS05uOTk1SHU0T00vRC8rbHBKN3Rv?=
 =?utf-8?B?S1BsRGJHQWJXSlYxSmpMY0x4d1RIR01ybnVWMk1yVXZCSy8yNGl1aC9KMTlP?=
 =?utf-8?B?V1U1emdWNHVpYm9MK1Q4WTRmekxKRE15aEdldGNSMjhKQ2JLaWw0RE1UbGM5?=
 =?utf-8?B?aGRXeWlMSk12WHdlZGMvNnl3elJ4TlN2N2J2MFNEQVg5MERHeU4wS1U3MXVy?=
 =?utf-8?B?Z1FRNEQ4ZTNLcXRjMWY1L24ySTlqUk1pUDQ5eThzQ0w4N1IxVmJlWUptT0Nw?=
 =?utf-8?B?aTV3ck12dlRXUlpvVHVzbnFGWDJjeUZTQTY4V1JNS0crUy92Tk96Ry95NHQ1?=
 =?utf-8?B?bXphS1d6VnBxMVliYjd0d05xc1V1bjMzTVdOTUk3ZFlEZE80aVdqU3cxbWR0?=
 =?utf-8?B?SVlYVXFicGx0RS9xZU9aMlZrQytUQUU1RWdCZWVTanc4c3dFT1luL3o0SVhq?=
 =?utf-8?B?MWRFN0xSRy9OVy9xNzRkaUpNQjJETWZjNm9uTC9lbjhkMmg1ek4yeEU1ZmNC?=
 =?utf-8?B?TFJRM200bzNTZitoeUtJcEF3VDhsMTlvYXUxVE5DcXV6eEErVmN3dW5VWk1i?=
 =?utf-8?B?ejN1clhiajdZUTJOUUZOU2FUakdjM3N5cmplM1ZidmlJWHFERkpJS0k1R3hT?=
 =?utf-8?B?WVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <41AD28909F720E46AB5C90AC3225CE82@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY0PR03MB6356.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26a1aa31-2247-4413-c602-08dce0fee74e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2024 03:20:58.6761 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fSLtPVb7PCZmbGnpg6LX1ccu+iZRuk2lMqbPnv/eC1qJAF6jJA8dJ8gX9kWCdTa00QCvQWmUZ+8oa1yz0vfs/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR03MB8772
X-MTK: N
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

SGkgQ0ssDQoNCk9uIEZyaSwgMjAyNC0wOS0yNyBhdCAwOTowMSArMDAwMCwgQ0sgSHUgKOiDoeS/
iuWFiSkgd3JvdGU6DQo+IEhpLCBNb3VkeToNCj4gDQo+IE9uIEZyaSwgMjAyNC0wOS0yNyBhdCAx
Mzo1MSArMDgwMCwgTW91ZHkgSG8gd3JvdGU6DQo+ID4gRnJvbTogTW91ZHkgSG8gPG1vdWR5Lmhv
QG1lZGlhdGVrLmNvcnAtcGFydG5lci5nb29nbGUuY29tPg0KPiA+IA0KPiA+IFRoZSBkaXNwbGF5
IG5vZGUgaW4gbXQ4MTk1LmR0c2kgd2FzIHRyaWdnZXJpbmcgYSBDSEVDS19EVEJTIGVycm9yDQo+
ID4gZHVlDQo+ID4gdG8gYW4gZXhjZXNzaXZlbHkgbG9uZyAnY2xvY2tzJyBwcm9wZXJ0eToNCj4g
PiAgIGRpc3BsYXlAMTRmMDYwMDA6IGNsb2NrczogW1szMSwgMTRdLCBbMzEsIDQzXSwgWzMxLCA0
NF1dIGlzIHRvbw0KPiA+IGxvbmcNCj4gPiANCj4gPiBUbyByZXNvbHZlIHRoaXMgaXNzdWUsIGFw
cGx5IHRoZSBsaW1pdCBieSBzZXR0aW5nICdtYXhJdGVtczogMycgaW4NCj4gPiBNVDgxOTUNCj4g
PiBhZGRpdGlvbmFsIGNvbmRpdGlvbi4NCj4gDQo+IEkgdGhpbmsgdGhlIG1haW4gcHVycG9zZSBv
ZiB0aGlzIHBhdGNoIGlzIG5vdCB0byBhZGQgbGltaXRhdGlvbi4NCj4gVGhlIG1haW4gcHVycG9z
ZSBpcyB0aGF0IHlvdSBhZGQgSERNSSBSWCBDbG9jayBhbmQgSERNSSBNZXRhZGF0YQ0KPiBDbG9j
ay4NCj4gQ291bGQgeW91IGRlc2NyaWJlIG1vcmUgYWJvdXQgdGhlc2UgdHdvIGNsb2NrPw0KPiBt
dDgxNzMtZGlzcC1zcGxpdCBjb3VsZCB3b3JrIHdpdGhvdXQgdGhlc2UgdHdvIGNsb2Nrcy4gV2h5
IG10ODE5NS0NCj4gbWRwMy1zcGxpdCBuZWVkIHRoZXNlIHR3byBjbG9ja3M/DQo+IA0KDQpUaGFu
a3MgZm9yIHRoZSByZW1pbmRlci4NCkluIGhhcmR3YXJlIGRlc2lnbiwgU1BMSVQgbXVzdCBlbmFi
bGUgYWRkaXRpb25hbCBjbG9ja3MgYmFzZWQgb24gaXRzDQpmcm9udC1lbmQgc2lnbmFsIHNvdXJj
ZSwgYW5kIHRoaXMgYWxzbyBpbXBsaWVzIGl0cyBwb3NpdGlvbiBpbiB0aGUNCmRpc3BsYXkgcGlw
ZWxpbmUuDQpJIHdpbGwgZWxhYm9yYXRlIGZ1cnRoZXIgb24gdGhpcyBwYXJ0IG9mIHRoZSBkZXNj
cmlwdGlvbi4NCg0KPiA+IA0KPiA+IEZpeGVzOiA0ZWQ1NDVlN2QxMDAgKCJkdC1iaW5kaW5nczog
ZGlzcGxheTogbWVkaWF0ZWs6IGRpc3A6IHNwbGl0DQo+ID4gZWFjaCBibG9jayB0byBpbmRpdmlk
dWFsIHlhbWwiKQ0KPiANCj4gVGhlIGZpeGVzIHBhdGNoIHNob3VsZCBiZSA3MzkwNThhOWM1YzMg
KCJkdC1iaW5kaW5nczogZGlzcGxheToNCj4gbWVkaWF0ZWs6IHNwbGl0OiBhZGQgY29tcGF0aWJs
ZSBmb3IgTVQ4MTk1IikNCj4gDQo+IFJlZ2FyZHMsDQo+IENLDQo+IA0KDQpJdCB3aWxsIGJlIGNv
cnJlY3RlZCBpbiB0aGUgbmV4dCB2ZXJzaW9uLg0KDQpTaW5jZXJlbHksDQpNb3VkeSBIbw0KPiA+
IFNpZ25lZC1vZmYtYnk6IE1hY3BhdWwgTGluIDxtYWNwYXVsLmxpbkBtZWRpYXRlay5jb20+DQo+
ID4gU2lnbmVkLW9mZi1ieTogTW91ZHkgSG8gPG1vdWR5LmhvQG1lZGlhdGVrLmNvbT4NCj4gPiAt
LQ0KPiA+IFRoZSBwdXJwb3NlIG9mIHRoaXMgcGF0Y2ggaXMgdG8gc2VwYXJhdGUgdGhlIGNvcnJl
Y3Rpb25zIGZvcg0KPiA+IE1lZGlhVGVrIFNQTElUIENIRUNLX0RUQlMgZXJyb3IgZnJvbSB0aGUg
b3JpZ2luYWwgbWFpbGluZyBsaXN0DQo+ID4gbWVudGlvbmVkIGJlbG93Og0KPiA+IA0KaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQwOTI0MTAzMTU2LjEzMTE5LTItbWFjcGF1bC5saW5A
bWVkaWF0ZWsuY29tLw0KPiA+IA0KPiA+IENoYW5nZXMgc2luY2UgdjE6DQo+ID4gICAtIEFkZGlu
ZyBmdW5jdGlvbmFsIGRlc2NyaXB0aW9ucyBhbmQgcXVhbnRpdHkgcmVzdHJpY3Rpb25zLg0KPiA+
IC0tLQ0KPiA+ICAuLi4vYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxzcGxpdC55
YW1sICAgICAgICAgICB8IDYNCj4gPiArKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5z
ZXJ0aW9ucygrKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQNCj4gPiBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLHNwbGl0DQo+ID4gLnlh
bWwNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlh
dGVrL21lZGlhdGVrLHNwbGl0DQo+ID4gLnlhbWwNCj4gPiBpbmRleCBlNGFmZmM4NTRmM2QuLmJj
ZTFiOGI4NjZjZSAxMDA2NDQNCj4gPiAtLS0NCj4gPiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLHNwbGl0DQo+ID4gLnlhbWwNCj4g
PiArKysNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21l
ZGlhdGVrL21lZGlhdGVrLHNwbGl0DQo+ID4gLnlhbWwNCj4gPiBAQCAtNTcsNiArNTcsOSBAQCBw
cm9wZXJ0aWVzOg0KPiA+ICAgIGNsb2NrczoNCj4gPiAgICAgIGl0ZW1zOg0KPiA+ICAgICAgICAt
IGRlc2NyaXB0aW9uOiBTUExJVCBDbG9jaw0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBIRE1J
IFJYIENsb2NrDQo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IEhETUkgTWV0YWRhdGEgQ2xvY2sN
Cj4gPiArICAgIG1pbkl0ZW1zOiAxDQo+ID4gIA0KPiA+ICByZXF1aXJlZDoNCj4gPiAgICAtIGNv
bXBhdGlibGUNCj4gPiBAQCAtNzIsNiArNzUsOSBAQCBhbGxPZjoNCj4gPiAgICAgICAgICAgICAg
Y29uc3Q6IG1lZGlhdGVrLG10ODE5NS1tZHAzLXNwbGl0DQo+ID4gIA0KPiA+ICAgICAgdGhlbjoN
Cj4gPiArICAgICAgcHJvcGVydGllczoNCj4gPiArICAgICAgICBjbG9ja3M6DQo+ID4gKyAgICAg
ICAgICBtYXhJdGVtczogMw0KPiA+ICAgICAgICByZXF1aXJlZDoNCj4gPiAgICAgICAgICAtIG1l
ZGlhdGVrLGdjZS1jbGllbnQtcmVnDQo+ID4gIA0K
