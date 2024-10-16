Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E3E99FE8E
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 03:56:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2189310E12F;
	Wed, 16 Oct 2024 01:56:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="soek2mhk";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="GFSJbDZC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D30910E12F
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 01:56:43 +0000 (UTC)
X-UUID: e216ec288b6111ef8b96093e013ec31c-20241016
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=egPYmv/gvK7rv3MrBs6idtwL2Y5PIMd4JZoQtxtN85E=; 
 b=soek2mhk5o7x66mCnA/6qBLSDeryjTR/EM2JJtTRIowuk1HceS6qjcOuLZ8cbDY3p3htDlGQ1lhCdF1bOqozcH0lMQs1xkuBJ18p9BeeNHx5MjQPuitAxgpjd8WI+9jvBrN1XU5rFQEjBuO5faI7jZSB7v31jRykjtl2yezoH7A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:c7200dc1-99a3-4725-95ee-be09f6fac909, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6dc6a47, CLOUDID:473cd906-3d5c-41f6-8d90-a8be388b5b5b,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
 l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e216ec288b6111ef8b96093e013ec31c-20241016
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 305538163; Wed, 16 Oct 2024 09:56:39 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 15 Oct 2024 18:56:38 -0700
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Wed, 16 Oct 2024 09:56:38 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nrv5QKdhXledTB2FaioK9NYPBESvmcaTuPd6BAnJcePhoGrirMeLDjUtYlb5HjXbFRmkila/fiWSruu71d5a4Knwgt3w1+95q84I/Ms2Y2GhCwI6FxFEmlNbNmTRJyYbHwg6fC0YuF4BUJy8iTZWvvLF3D7AbizXf19ckG3NSH7+pOrdRS7JWbG+XE0MmTkQgW41jHjpEUof/D9zXgfW5Ngb8u0J251YR8YR1zC+sTnPUWZc30T9S+iZbfCG/vtuqHmNGBDk7aRtn5ExYxD1uZRfbn4ncdqEzZSQ4DKH1RIiXC22MFBQklPLOAlZ6ErBRJdZ1meZ8i0LskdgpAldgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0uZVo57ceSR8ZrBx/cx+gn9gaAYBMSmUFDu8TNCmfnw=;
 b=ixONHLhT1GxvFYdigtMLTVGp9Z481xrgOQQDAZkyt/AnOKYsGhuplk5spMI21zP7o6UeuW0UH8T9m1NMYr6n52c4ibDZKb51YzRKuqnh3aCxZte1zQ1HBZccNw77ZH05mKr8Wm7RSqR5bgYSfoa88BiPxQ0+cVEnnM+1O+nyeMaFaktQeO90w2HSQ9DbzOV9902uZggbitz0zofEYYxSCOgvALsciOnq3wS2Uzs46+YC0GwXsi5bF5E/dPXTY7mQatJFH4HDwLuKgj7bQgXNvD+7kyLoJ1NS05Lum5GTk8kR9Ls3+BLLxSHTlpnnO8E2c4LkVyXceOLsLGcDi2MREg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0uZVo57ceSR8ZrBx/cx+gn9gaAYBMSmUFDu8TNCmfnw=;
 b=GFSJbDZCcF39AwGQ3O+bwHJJ4IhkpmmxzjgAczeH3YHKCzGN6Uy0R2vrT4+zuC7JeExCkCXgiMwkOSjOA1Y60VuVXM1TjWiBEEM7AD013Hc/h5gdB5l6F0P41y8+LlQQTM9Sp8NYa2+ZpvF5jnV6MsQWymxgfQNwnxtmwtl9J/A=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KL1PR03MB7798.apcprd03.prod.outlook.com (2603:1096:820:f7::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Wed, 16 Oct
 2024 01:56:33 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8048.020; Wed, 16 Oct 2024
 01:56:33 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>, "mchehab@kernel.org"
 <mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?utf-8?B?U2h1LWhzaWFuZyBZYW5nICjmpYroiJLnv5Qp?=
 <Shu-hsiang.Yang@mediatek.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "yunkec@chromium.org" <yunkec@chromium.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, =?utf-8?B?WWF5YSBDaGFuZyAo5by16ZuF5riFKQ==?=
 <Yaya.Chang@mediatek.com>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?utf-8?B?VGVkZHkgQ2hlbiAo6Zmz5Lm+5YWDKQ==?= <Teddy.Chen@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "hidenorik@chromium.org"
 <hidenorik@chromium.org>, =?utf-8?B?U2h1bi1ZaSBXYW5nICjnjovpoIblhIQp?=
 <Shun-Yi.Wang@mediatek.com>
Subject: Re: [PATCH v1 09/10] media: platform: mediatek: add isp_7x build
 config
Thread-Topic: [PATCH v1 09/10] media: platform: mediatek: add isp_7x build
 config
Thread-Index: AQHbGj11Pq+szvgxyE2NahIV4+UDyLKIqMQA
Date: Wed, 16 Oct 2024 01:56:33 +0000
Message-ID: <dc0915cd396951f770ddda080c6b77c195ac8270.camel@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
 <20241009111551.27052-10-Shu-hsiang.Yang@mediatek.com>
In-Reply-To: <20241009111551.27052-10-Shu-hsiang.Yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KL1PR03MB7798:EE_
x-ms-office365-filtering-correlation-id: 72278907-4666-4b05-df08-08dced85c2ac
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?TDRMd1poVmt5K2VUb0pvcGVrem1zblM3dXhGcVoyYUczMWJhMEl4Z1MxbkFW?=
 =?utf-8?B?RUoydDVPYlo3N1dUUTRFUytXVWlHM0Iva1FWQ1JVSGJHOXhBUmxCdmRqczNH?=
 =?utf-8?B?M2xMV1RxaVB6MTB3R0pKZnRnd09HclJMQXp2b3hBL1lBTHJVNTdLNDVYaXFH?=
 =?utf-8?B?Y2NmOVlvSHZ3MXB5amNmSExjVkVnbTJrMU9GUnd2RkZnbStHaEI3dmRJbHdo?=
 =?utf-8?B?dzBrQ04yMDlzd3E3MEdFNlk3YlZpUzRoZVV5K082SEhqRmFUQmQ2RU5DVUZE?=
 =?utf-8?B?dFBDazNkTjlkYVJWSHFzZlZtMitmOU43Rk9FWWpPOUNvNVV6dUViV2M5NnJQ?=
 =?utf-8?B?dlJTRFREWXFGdmhpOFhHVEF4SnUwK0xhSXlGVldPRlBtcTdhZ21BVHUrRXdx?=
 =?utf-8?B?VzNtZlZYakJpSkgyUm1YYkdYZ2g0TUxkVnh3RklXY05wNmdESUxXdjQ3Mm5F?=
 =?utf-8?B?Qkt2eXg1eVliWnRsQ2FuTkFBazBQVlpMZzZhSmNRMlgxWlhGSXY1bGRTM3ZJ?=
 =?utf-8?B?MzUwTTJVdjF5SDB0VXJlelRpaFBoSzJFT3lpWXZ5ckgrTHcyNTBFRy9NOTdL?=
 =?utf-8?B?R2M2TXFsdktBOVMzd2xXOC9kdE1KL3I1c1VNTkprQWw4SExYUDFLOVVYbnBU?=
 =?utf-8?B?Qk1tc1pRcHJVRlc2WnlsT0VtTnVyNExtcks4V2tyVjVDMnhQdU9iZXc1OWNy?=
 =?utf-8?B?enplN1BPbWlTQThuM1F3NWhoTFNZK29rUlRZV2RvdGlPckVrVVNuL1I5ZkFk?=
 =?utf-8?B?d3JiWEFBeFVJZW9Kam5kVmdOR0l2RThTbUxianNkR0xwc1RBRUcyYWxHcU0z?=
 =?utf-8?B?RGVVWGMyejJMUG5jbzB6YWhSTU05c0lnVlY2MFBDVzcvVHNVRDZnbi9mdW9B?=
 =?utf-8?B?bnQxb1hKUXBaSnRDZ2V2ZEtCTmNPVXNBTGgrVCt5RUZpZFRyMDEvZjJxQjMz?=
 =?utf-8?B?NytJZmErMVJFM3IvaERWU0h5UzhnZ1RHVFFWZlJDejJ4Q0E3bGFtQjB3SlVj?=
 =?utf-8?B?Z1A2ZzlDT1JWSDdFVVloSUNhVUEvYUhEbER2WWpBY0lIVC84YXM4bjgvcnN5?=
 =?utf-8?B?WWk5TzRMMnFpNTVZRUZ6RmNYK2h1dG90eWFEdnltZFRtOG5XZHN3c09KRm5S?=
 =?utf-8?B?eFI5YXJqN0ZiNUEzVzNzTmtzazhlWjBPNE5jS2EweUVaS2hrUi9RWkZ6a1Zx?=
 =?utf-8?B?bVcvT1VnRm44b05NR244TzZMNmJFNU5oOElPWWpoWDlFeVI3WkJSdUJLNFA0?=
 =?utf-8?B?ZXNWMk84RVcxTVZFZy9lR2t3N1hwN2hMVGh3eGR4bW1hMk9QWGt0MTQ5bFVt?=
 =?utf-8?B?d05zSDRneGJJTVNkaDBrVUFBZ0pGZGpLTGVySDRtbWMwT3FaOUZCcWwrOW1o?=
 =?utf-8?B?elNnMDF3dVJZVzhMS0x2S0luY3p2WVNiSHlwSEQ4bUh3VW1BQVZaamI5VXZr?=
 =?utf-8?B?cDdGT05KZGdTZmRNRUZ2UE5weEFENm5EZ3hOWDA1MWZmbW01Wnl0SXFYWUpi?=
 =?utf-8?B?cDhoR3RvaG56azNpYkFEQVcrUjhKNXl5V2ZkMVl6NDlXdlc2dERFQUxaOGc1?=
 =?utf-8?B?RWV1RzNBamY5ZGpraGVvL01xTHp6UmhXWEJ2bjRDOXR3VzdkdVJhTGV4ZEJO?=
 =?utf-8?B?Q1BkUDFxdUVVdlZONm9PK3lmM0JCWmJwS21SWXBDejgvM2ZDdWxEeGR2M1Fx?=
 =?utf-8?B?UFV5WlBLYjhOajRZa1Z6cHdvTUFXMTdCb3pya2lUUkJDVEh5aHUzdk9OaEVR?=
 =?utf-8?B?ZTVBcklVNUU1dHJqeERrTkNwMWowc1JSQWxsNGRWYmdLMTY4S0I4RzZhbmhQ?=
 =?utf-8?B?aEswcDM5c2V2SEFzNjU3UT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZlBpSCtqVTFyMExJTGdXUDN1TjVGdGhVTFZid3NnMnh2SHQ1ZG5HTTQ5cEYz?=
 =?utf-8?B?OU9Hb09GN1BpQmpiSTM3OWtZdElCSzhPRVJVUzNKQ3hwZEVlcHlidk1jb084?=
 =?utf-8?B?d0krTm9zbXVrZGJ5NTVYbG9jRlR2bDdMSlc1Uml0SnQzTlJRVUdXQkptNVAy?=
 =?utf-8?B?eHVrdXMzc3ZpTXptcTRhZW85R3R1eHczdmdWVVgrYjEzajBOYkZzSGcwZm5S?=
 =?utf-8?B?NmFxS1JJZkVEVFF6OC81dDJFb1pNNHI0d21sVTlIOHBJT0tLOEVJNUs1NjFH?=
 =?utf-8?B?NGhGUkFKRnAvYjVKZHhsUE51MEN6ZzR4cHVqMVJHSzdNR244RDJ6TGlHSW9O?=
 =?utf-8?B?djVBOW1SOWppTTZScFhZa2tGZW56eXZEMHp1MWVlWHFDMko3RFRBbVp6QWVx?=
 =?utf-8?B?Y0gxWDdNWVZxQlBIQUlsYWE0RTBxZ3ZTWG15N3B1YXU3Z0xLUzNlZnRhK3Q3?=
 =?utf-8?B?Vy9EcEZyZmV4elBwZGsrdURkeW13UEdhY1lZYWFnQ3EwVEdXbUtIS013ZTJo?=
 =?utf-8?B?T0xWMmVWWG9KSEdncDFJUk0zazgzbEZhZ3JVSlA2aHZtOXViSkp4OE1saG9B?=
 =?utf-8?B?bUNPRTdhTXFKU21IUHZ1eWd5NjVRck01MjZBc2VndmlZSEFtYVB1R3d3ZUtj?=
 =?utf-8?B?NVVOZkJMYURqK2ZuMnBENzJZcWJVaitCQ1NPWTAxc0pqRE1PWGdkTHdOZDBn?=
 =?utf-8?B?dTVFWldhRm0yR05HZ21OKzhpdCtKZXRZWCs3bXFWNnNrRkswV3NLSlhNV3p3?=
 =?utf-8?B?RXB4T3ErdUhXRWx3TVMvcDZwNUZFdEJRczloQ0cySUZZM1krdWNISjdRSURS?=
 =?utf-8?B?Q1lZVVFVcEl0ZmdWQU0ya0RrRXNvR0dBb1FTK0FIeXdSWWtmTEV3UTUzcVFv?=
 =?utf-8?B?R3M3TXpraXhZR3c5RWwwbVd1UVBVL3BSUi8ycHdFZ1JDczR4Q1lTdWMwTEFX?=
 =?utf-8?B?S1lxVERlSHpXYVVvV1Z0VFJocjZyaWZ5Z3Q1a1FYRjNxcEp1aWU1UlFTYUZs?=
 =?utf-8?B?WDk5Ym0wdG9NQTl0TDlKY1BlVUVGUWZLUU0raEhYQ3BXbllGOW9oRFh5YXF0?=
 =?utf-8?B?UjlabE51U0JHNFhJMStZR0NMT0poWjlMNElEdTVjT3l3bGhIRnZoQWp1T3RC?=
 =?utf-8?B?NUpFdjBYV09RWDJRb0gyODBURXpVR2ZhN2JDYmE5ZDEyeWtMZ3J4VnE5c0lm?=
 =?utf-8?B?VGV2UGg1ZVpvOENvT3kwZGVnRU1QYUlZMzJFNnFZbjJScm5DdFBob0VwTGpH?=
 =?utf-8?B?OXI1UnZBTVhRK01FMnNXblc5TjRmSXVsbTUzOHlWamIxbllmVUl1bmxJcFJM?=
 =?utf-8?B?WktobTE0UWJINVBWeEUxQmxpUWZHOUtjSWJhNEdUM0grYTZsYk5OQituMDZy?=
 =?utf-8?B?cTdyeGIvSElzYmRhU1JJcjE3dEMzZGxnQ01ybDRGbEljSnQ3UW1CNlRTSm9G?=
 =?utf-8?B?aXYrQ1JabmovZk1NR2FyaHVPc2VYcFVvbytESndZZ1B2azh0SGxlNGF3R0d5?=
 =?utf-8?B?NXhDRng5NEZpTlVZZlltaURZZUFWSkVxYS8yUUdYZVcrNWw4L1lnUHF3Nkxj?=
 =?utf-8?B?K3d5ZlpJL3krbTN0ZE9ONGFTNE9IS2g0TUM0UXpPZjZsVlg5Nm00QmJ6Ti9F?=
 =?utf-8?B?OTJFVlJQdnduWE1aeS9iaFJRSUEvVEQwd3VBUWxzVUd0UDdKa0pJMGl0M09I?=
 =?utf-8?B?Vk1yek1RZnllTzlwVXpHanhjUFBkV1ZhRjE5cGxtVXYyL3FDd1N3d0J0Ym5L?=
 =?utf-8?B?OWEyRkl0bFBqeHBoT0FUWS9FWnlYUSt4dUhNRE96Z3dwWit3OVZCRnhBRWw5?=
 =?utf-8?B?STJ2Zmd2eE5Fd1A2UGQ5S2p5OE1oZkRuZElSTnp2TmdGN0hvVWo0OE5YUTdi?=
 =?utf-8?B?MGsvbEYxUGRIR3RWZTd6eU1OcnRrVkxGdFA5UTRsakVrZXU5blpyekNwV0Ey?=
 =?utf-8?B?Y1p5OVhVZ1dNdkpVdXJBVm5Iemk0ZkhuZXlhY2hicWFiLzlWL1pUZlA2dVc5?=
 =?utf-8?B?bHV6UWpnRkVWMVkzcGc2bHV1RTRLTkh2VVo0RTVYeVVSVjY2TFpKeEdFa2RQ?=
 =?utf-8?B?QlhvekdDQVhJSVJEajFqOG4rMGNVc3ZodW40RHhMZ0JmT3hhaExHcjBXVkdx?=
 =?utf-8?Q?aaGjRTtCasoRTcm6w1SA/Lb9+?=
Content-ID: <9DD12ED8177B3043964C262E1BB97D4B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72278907-4666-4b05-df08-08dced85c2ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2024 01:56:33.1471 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: djt4CXLkje770T6zSAsuw+wJ1Cr92E1aX7UCtr0qRt3wVJNeleejWTG3v3JhiAf8YDgby+ZwvvOXyWdCy4DPRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7798
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_002_293812901.1613028204"
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

--__=_Part_Boundary_002_293812901.1613028204
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFNodS1oc2lhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMC0wOSBhdCAxOToxNSArMDgwMCwgU2h1
LWhzaWFuZyBZYW5nIHdyb3RlOg0KPiBBZGQgS2NvbmZpZyBhbmQgTWFrZWZpbGUgdG8gaW5jbHVk
ZSBNVEsgSVNQIENBTVNZUywgaW50ZWdyYXRpbmcNCj4gdGhlIGRyaXZlciBpbnRvIHRoZSBrZXJu
ZWwgYnVpbGQgYW5kIGNvbmZpZ3VyYXRpb24gcHJvY2Vzcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IFNodS1oc2lhbmcgWWFuZyA8U2h1LWhzaWFuZy5ZYW5nQG1lZGlhdGVrLmNvbT4NCj4gLS0tDQoN
CltzbmlwXQ0KDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9y
bS9tZWRpYXRlay9pc3AvaXNwXzd4L01ha2VmaWxlDQo+IEBAIC0wLDAgKzEsNyBAQA0KPiArIyBT
UERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KPiArDQo+ICtzdWJkaXItY2NmbGFncy15
ICs9IC1XZXJyb3INCj4gKw0KPiArc3ViZGlyLWNjZmxhZ3MtJChDT05GSUdfVklERU9fTVRLX0lT
UF83MV9DQU1TWVMpICs9IC1ESVNQN18xDQo+ICsNCj4gK29iai0kKENPTkZJR19WSURFT19NVEtf
SVNQXzcxX0NBTVNZUykgKz0gY2Ftc3lzLw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9w
bGF0Zm9ybS9tZWRpYXRlay9pc3AvaXNwXzd4L2NhbXN5cy9NYWtlZmlsZSBiL2RyaXZlcnMvbWVk
aWEvcGxhdGZvcm0vbWVkaWF0ZWsvaXNwL2lzcF83eC9jYW1zeXMvTWFrZWZpbGUNCj4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMDAwLi44ZTc1OGNmNjg3N2YNCj4gLS0t
IC9kZXYvbnVsbA0KPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL2lzcC9p
c3BfN3gvY2Ftc3lzL01ha2VmaWxlDQo+IEBAIC0wLDAgKzEsMTYgQEANCj4gKyMgU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCj4gKyMgQ29weXJpZ2h0IChDKSAyMDIyIE1lZGlhVGVr
IEluYy4NCj4gKw0KPiArbXRrLWNhbS1pc3Atb2JqcyA6PSBtdGtfY2FtLm8gbXRrX2NhbS1yYXcu
byBtdGtfY2FtLXBvb2wubyBcDQo+ICsJCSAgICBtdGtfY2FtLXZpZGVvLm8gbXRrX2NhbS1jdHJs
Lm8gXA0KPiArCQkgICAgbXRrX2NhbS1zZW5pbmYtcm91dGUubyBtdGtfY2FtLXNlbmluZi1kcnYu
byBcDQoNCldoZW4geW91IGFkZCBtdGtfY2FtLXNlbmluZi1yb3V0ZS5jIGFuZCBtdGtfY2FtLXNl
bmluZi1kcnYuYyBpbiBwYXRjaCBbMy8xMF0sDQp5b3Ugc2hvdWxkIGNyZWF0ZSB0aGlzIE1ha2Vm
aWxlIHNvIHRoZXNlIHR3byAuYyBmaWxlIGNvdWxkIGJlIGNvbXBpbGVkLg0KDQpSZWdhcmRzLA0K
Q0sNCg0KPiArCQkgICAgbXRrX2NhbS1kZWJ1Zy5vIFwNCj4gKwkJICAgIG10a19jYW0tcmF3X2Rl
YnVnLm8gXA0KPiArCQkgICAgbXRrX2NhbS1mZWF0dXJlLm8gbXRrX2NhbS10aW1lc3luYy5vDQo+
ICsNCj4gK210ay1jYW0tcGxhdC11dGlsLW9ianMgOj0gIG10a19jYW0tcGxhdC11dGlsLm8NCj4g
Kw0KPiAraW5jbHVkZSAkKHNyYykvbXRrX2NzaV9waHlfMl8wL01ha2VmaWxlDQo+ICsNCj4gK29i
ai0kKENPTkZJR19WSURFT19NVEtfSVNQXzcxX0NBTVNZUykgKz0gbXRrLWNhbS1wbGF0LXV0aWwu
bw0KPiArb2JqLSQoQ09ORklHX1ZJREVPX01US19JU1BfNzFfQ0FNU1lTKSArPSBtdGstY2FtLWlz
cC5vDQo=

--__=_Part_Boundary_002_293812901.1613028204
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtTaHUtaHNpYW5nOg0KDQpPbiYjMzI7V2Vk
LCYjMzI7MjAyNC0xMC0wOSYjMzI7YXQmIzMyOzE5OjE1JiMzMjsrMDgwMCwmIzMyO1NodS1oc2lh
bmcmIzMyO1lhbmcmIzMyO3dyb3RlOg0KJmd0OyYjMzI7QWRkJiMzMjtLY29uZmlnJiMzMjthbmQm
IzMyO01ha2VmaWxlJiMzMjt0byYjMzI7aW5jbHVkZSYjMzI7TVRLJiMzMjtJU1AmIzMyO0NBTVNZ
UywmIzMyO2ludGVncmF0aW5nDQomZ3Q7JiMzMjt0aGUmIzMyO2RyaXZlciYjMzI7aW50byYjMzI7
dGhlJiMzMjtrZXJuZWwmIzMyO2J1aWxkJiMzMjthbmQmIzMyO2NvbmZpZ3VyYXRpb24mIzMyO3By
b2Nlc3MuDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtTaHUtaHNpYW5n
JiMzMjtZYW5nJiMzMjsmbHQ7U2h1LWhzaWFuZy5ZYW5nQG1lZGlhdGVrLmNvbSZndDsNCiZndDsm
IzMyOy0tLQ0KDQpbc25pcF0NCg0KJmd0OyYjMzI7LS0tJiMzMjsvZGV2L251bGwNCiZndDsmIzMy
OysrKyYjMzI7Yi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL2lzcC9pc3BfN3gvTWFr
ZWZpbGUNCiZndDsmIzMyO0BAJiMzMjstMCwwJiMzMjsrMSw3JiMzMjtAQA0KJmd0OyYjMzI7KyMm
IzMyO1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiYjMzI7R1BMLTIuMA0KJmd0OyYjMzI7Kw0KJmd0
OyYjMzI7K3N1YmRpci1jY2ZsYWdzLXkmIzMyOys9JiMzMjstV2Vycm9yDQomZ3Q7JiMzMjsrDQom
Z3Q7JiMzMjsrc3ViZGlyLWNjZmxhZ3MtJiMzNjsoQ09ORklHX1ZJREVPX01US19JU1BfNzFfQ0FN
U1lTKSYjMzI7Kz0mIzMyOy1ESVNQN18xDQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrb2JqLSYjMzY7
KENPTkZJR19WSURFT19NVEtfSVNQXzcxX0NBTVNZUykmIzMyOys9JiMzMjtjYW1zeXMvDQomZ3Q7
JiMzMjtkaWZmJiMzMjstLWdpdCYjMzI7YS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVr
L2lzcC9pc3BfN3gvY2Ftc3lzL01ha2VmaWxlJiMzMjtiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0v
bWVkaWF0ZWsvaXNwL2lzcF83eC9jYW1zeXMvTWFrZWZpbGUNCiZndDsmIzMyO25ldyYjMzI7Zmls
ZSYjMzI7bW9kZSYjMzI7MTAwNjQ0DQomZ3Q7JiMzMjtpbmRleCYjMzI7MDAwMDAwMDAwMDAwLi44
ZTc1OGNmNjg3N2YNCiZndDsmIzMyOy0tLSYjMzI7L2Rldi9udWxsDQomZ3Q7JiMzMjsrKysmIzMy
O2IvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9pc3AvaXNwXzd4L2NhbXN5cy9NYWtl
ZmlsZQ0KJmd0OyYjMzI7QEAmIzMyOy0wLDAmIzMyOysxLDE2JiMzMjtAQA0KJmd0OyYjMzI7KyMm
IzMyO1NQRFgtTGljZW5zZS1JZGVudGlmaWVyOiYjMzI7R1BMLTIuMA0KJmd0OyYjMzI7KyMmIzMy
O0NvcHlyaWdodCYjMzI7KEMpJiMzMjsyMDIyJiMzMjtNZWRpYVRlayYjMzI7SW5jLg0KJmd0OyYj
MzI7Kw0KJmd0OyYjMzI7K210ay1jYW0taXNwLW9ianMmIzMyOzo9JiMzMjttdGtfY2FtLm8mIzMy
O210a19jYW0tcmF3Lm8mIzMyO210a19jYW0tcG9vbC5vJiMzMjsmIzkyOw0KJmd0OyYjMzI7KyYj
MzI7JiMzMjsmIzMyOyYjMzI7bXRrX2NhbS12aWRlby5vJiMzMjttdGtfY2FtLWN0cmwubyYjMzI7
JiM5MjsNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyO210a19jYW0tc2VuaW5mLXJvdXRl
Lm8mIzMyO210a19jYW0tc2VuaW5mLWRydi5vJiMzMjsmIzkyOw0KDQpXaGVuJiMzMjt5b3UmIzMy
O2FkZCYjMzI7bXRrX2NhbS1zZW5pbmYtcm91dGUuYyYjMzI7YW5kJiMzMjttdGtfY2FtLXNlbmlu
Zi1kcnYuYyYjMzI7aW4mIzMyO3BhdGNoJiMzMjtbMy8xMF0sDQp5b3UmIzMyO3Nob3VsZCYjMzI7
Y3JlYXRlJiMzMjt0aGlzJiMzMjtNYWtlZmlsZSYjMzI7c28mIzMyO3RoZXNlJiMzMjt0d28mIzMy
Oy5jJiMzMjtmaWxlJiMzMjtjb3VsZCYjMzI7YmUmIzMyO2NvbXBpbGVkLg0KDQpSZWdhcmRzLA0K
Q0sNCg0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7bXRrX2NhbS1kZWJ1Zy5vJiMzMjsm
IzkyOw0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7bXRrX2NhbS1yYXdfZGVidWcubyYj
MzI7JiM5MjsNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyO210a19jYW0tZmVhdHVyZS5v
JiMzMjttdGtfY2FtLXRpbWVzeW5jLm8NCiZndDsmIzMyOysNCiZndDsmIzMyOyttdGstY2FtLXBs
YXQtdXRpbC1vYmpzJiMzMjs6PSYjMzI7JiMzMjttdGtfY2FtLXBsYXQtdXRpbC5vDQomZ3Q7JiMz
MjsrDQomZ3Q7JiMzMjsraW5jbHVkZSYjMzI7JiMzNjsoc3JjKS9tdGtfY3NpX3BoeV8yXzAvTWFr
ZWZpbGUNCiZndDsmIzMyOysNCiZndDsmIzMyOytvYmotJiMzNjsoQ09ORklHX1ZJREVPX01US19J
U1BfNzFfQ0FNU1lTKSYjMzI7Kz0mIzMyO210ay1jYW0tcGxhdC11dGlsLm8NCiZndDsmIzMyOytv
YmotJiMzNjsoQ09ORklHX1ZJREVPX01US19JU1BfNzFfQ0FNU1lTKSYjMzI7Kz0mIzMyO210ay1j
YW0taXNwLm8NCg0KPC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlwZTp0ZXh0LS0+PCEt
LXstLT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZSAq
KioqKioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUt
bWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRl
bnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9t
IGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSAN
CmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBk
aXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5
aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50
ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVu
bGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1h
aWwsIG9yIGJlbGlldmUgDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVy
cm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcg
dG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1h
aWwgKGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBu
b3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJz
b24uIFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_002_293812901.1613028204--

