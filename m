Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BFA9D336D
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 07:11:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2774810E149;
	Wed, 20 Nov 2024 06:11:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="BvqnvnvT";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="KsgqYeve";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F96B10E149
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2024 06:11:10 +0000 (UTC)
X-UUID: 39e68beca70611efbd192953cf12861f-20241120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=AEDdgaLbH9Bqsq7LppkyRbUZ+UGW1aFul8TQ90J1PiA=; 
 b=BvqnvnvTre//GkORT/pgT5FNXpTlqG/XkZVeIjukl0ts0bHBda1/1bCyv1c65Ys7jB+GQDwJU+L0W6jFb+JrXu3YG9789fO87CoSklt6g+RBeyJBWgJ9iyDNPSksIS0PGRjwfJhiI0a1Z/2umYNF7Nmd7ADcJleX+mN75CSdZcw=;
X-CID-CACHE: Type:Local,Time:202411201411+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44, REQID:4e291570-179b-462e-b5b1-4fdf9ce0fd88, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:464815b, CLOUDID:cd8d47ce-1d09-4671-8b9c-efcc0e30e122,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
 :-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
 ,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 39e68beca70611efbd192953cf12861f-20241120
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1082602738; Wed, 20 Nov 2024 14:11:05 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 20 Nov 2024 14:11:02 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Nov 2024 14:11:02 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mKig0u9pn3YVBWANZUk+kRZuOHvtil1QyjmjbTT/SD6W3dWEsTkz4RyBcdlsI8ySQiJ4fZd/ysoUozsHPqrtDd4PMxZ0Rdendc1h/h8F5RNbooGZeDlddMeB2ef348jt6J8FLiKGy7Uc8X4cucuhKvXeQvA5ESWxE802vlIFdTLwivLspwAzng4DMS7/2DMePfLgpcCtA3LdhMQpNRl7BhtHSpdSHQIyTTfuaReMsC2OmxC1FGzp5w4l53WjcvIRnqD43dBZRqZI675vIRQUDHXOAoas1OpOOnv7b7vmd1R3wX+l/23kpneApbTgcT5tAnH/sCZ4oV8gv1A6QzWu4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dxVSPqbpGHcUKf6jqF/EGjf+BdbkySKgh8FWhNp75Og=;
 b=VIdBvi3Cmt4af/OO2HU6kzceKXyRpB94Nj1Sutqj1VVNXqemumd+GdoAkB3JMhyEiO2mXOZJKAQ8h5RGBBzAdYNvlVXkGhx7WrvXXjtWGDcQezwIpWMqpyA8WT9Xs5x68CXZK3ZVwMeGjgBK+zjDIkU3C8ukZ4sBOM8f5AecpZrw0+D9VgX7wEA1XVQgWPuutv2MkwZYOOMgcD1YZOhg29oF0vcPpY/Ykpd6DtgGuYAkTTVadyL3S/0Z1plvuWwW+f7+j9LjaOpEVTJmZQ8Nilwwd1ucqYJoaokZdWXzPoS7T+hlI2hbgX277Ufn5fypnSPfAhr8o9gpYDzCHadEQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dxVSPqbpGHcUKf6jqF/EGjf+BdbkySKgh8FWhNp75Og=;
 b=KsgqYevehYnnfXGS7FoyxEfOC1BHjGB3MVgPYynQtrZdpn/zZIWcoTAe5dsJM0Mmo6vLMJqINO0VsoopelkmrEptSCNXNOIEcfTezcDqFKPgnq5eDM3H843W4bAImL1hrBCojxU7GHY2Zl0J9IWDW3yAF8iiugufLT2sYuWl/ZY=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYSPR03MB8396.apcprd03.prod.outlook.com (2603:1096:405:56::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.20; Wed, 20 Nov
 2024 06:10:59 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8158.017; Wed, 20 Nov 2024
 06:10:58 +0000
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
Subject: Re: [PATCH v1 05/10] media: platform: mediatek: add isp_7x camsys unit
Thread-Topic: [PATCH v1 05/10] media: platform: mediatek: add isp_7x camsys
 unit
Thread-Index: AQHbGj3MGEEcsT7oNkOiiJNQG6iUarK/8XGA
Date: Wed, 20 Nov 2024 06:10:58 +0000
Message-ID: <ada9ebdd87ef12fa0d36bd0f15df9946ed650e02.camel@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
 <20241009111551.27052-6-Shu-hsiang.Yang@mediatek.com>
In-Reply-To: <20241009111551.27052-6-Shu-hsiang.Yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYSPR03MB8396:EE_
x-ms-office365-filtering-correlation-id: 14c1e2af-8827-49ab-495c-08dd092a1a09
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?b3pybVlyUGNtS1JseFhnRTBEbjhkMGkwN0s2MGpmUUd6Mk5zMXBFb1FtWEdB?=
 =?utf-8?B?c01pRWNYaEluVWpWVFowNVZMWEw4U29EKyt5NDYrZVRLSTNYcjNva01JdUth?=
 =?utf-8?B?NmhyRU9kVmZoNTVydk9aaXlBQTA4UFF5dmxTbkwydEswRlVRbW8vSkwyVW01?=
 =?utf-8?B?U0lITUY4TjEvbXE3Z3VORzlNOEJLKzZqR1NZR2ZORHhmRzlJZlBGaGhWbHRS?=
 =?utf-8?B?NmN6TVNDN2thTDJkRVJqMUFLWEpvcmdNVjBlS0w5c2hzeGVvNlc0WVlwUUg1?=
 =?utf-8?B?aDZwQmtxTmpDNEFpazJpZmxIa1VDQk5CbDJON2NYMnprWWxsamh3Y25hN3lG?=
 =?utf-8?B?Zys0dFhUZ3Fab1JsYnppQmsvYytWczVmb2lhNzRoODlGbU9Xd1E0eDJSSEt4?=
 =?utf-8?B?emI4dEVib3dsMkcvN3FvMTdYenFpR21SenNFNU42UW5kWEpTS1Q1c3FpZ1BJ?=
 =?utf-8?B?dndURjdjWjJqTzdVYzE0YWhBSTExMUYxaVp5K1RIMWlmT0EvQndDR3pRZUtv?=
 =?utf-8?B?Z21PV2JtZHNaQVdJMWpoZFdTRnI4UkpZNmt2WDBZMDRDbmNaU1hLTzd1anhC?=
 =?utf-8?B?aDVFZytvTUErQlk5dndhL0dXVC9QV2ppUm40Q1VtN3BrZDRFZURyTkU5b1cw?=
 =?utf-8?B?YmtpRXc5UTFMNDdCSlJIZWhZZFVYNExoQlE3U0hiYkRJaC9xRmZScEFiTm1h?=
 =?utf-8?B?Zk5SRFczTTZyb2lRMURrc2hURmQrMk1WbWo5dWYwMUlNT2o2eDNzNHp1bDFX?=
 =?utf-8?B?QXBrcGY4N2c5OE9iM1lqK2xwMmJYNnhzaUF3cjF2QkoyNm5IcDFVRTNVa2Vz?=
 =?utf-8?B?ZnA5Uk9MeFBTblovWUxZSDlpYzZBeGpFS2NWZEFaaDMyTDdaeGQ2STFlZG03?=
 =?utf-8?B?RnB3eXZZZDNiQUFTRitLMWxYdGJoR3ZnRkpXU2lROFh3b1pIbjV0a2VyUUd4?=
 =?utf-8?B?VFRQZGlrYjkxY3dqbXQ3UDYrdVJUdDU3Rno1RXYzV2d0eWkrWk81TitDOVlh?=
 =?utf-8?B?clFWNVdJMm91eUxQLzFhMzRpSHI1UkwvNVZtVkVwcEZmUTVrK2FlNlRNSVpS?=
 =?utf-8?B?bnFTR09lY2pCUCs1MjVuTEY2TVhpWjA1OE5IYmdZWmQza0JmeVpNdzc4Umhm?=
 =?utf-8?B?VkhkcTNHbGJGRHgxZ1dSN1FQRkNKVjFPTm1pMlN3aWM1cTRXQ1gwSWJMODNP?=
 =?utf-8?B?SngvZnp5K0tqWXArTXdCejVaTEJrMnVxZ3NjRmd0QjF0UU9vN2k0QmtLYlY4?=
 =?utf-8?B?a3FKeWVIME1adnNYMC9XT1I5amFleFdPYnFQVU5pMHEvZzArMWwzOEhTaHMr?=
 =?utf-8?B?UTFHYjVsYk5pTTYzK2NTU1RKWExNS1FBdWk5cmkzZlNsNnJSYldWNVJEbE5N?=
 =?utf-8?B?QzBJU3A3MXVGTjN0MGZLUkdoR2s2ZEZIRUczZGxXbUlWcUh2L0JRaW1XQkVh?=
 =?utf-8?B?aUJUUTZqdlRib3FMaE0xQUNLUFFrUzkwcURQOWJuMS9KQnhzRG5pdWJXQkha?=
 =?utf-8?B?dEU0am91Y01NMEZEZ3poaG5IYjJGaE9HK3pOcmI1UW4zM0xUQ1NPOGU4V1ZF?=
 =?utf-8?B?amxpdlhoYlZCRkk2QmRSMStIYnM5RHVUY21ibTVWSzNCakdiT2xvUFZHdnZ1?=
 =?utf-8?B?NUxNdW1BVHhNZTlxY2JranJLM2N1Vm14MFZ3SG53bkpUdit5b1RvbVVoMDdS?=
 =?utf-8?B?RTBjeFdWUnFkMHl2bmdDOW9GcGE4SGozUXVMd3IrR0JxSEZ5bFByTVphU2Na?=
 =?utf-8?B?MGFla0I1YXd6dC9YSStLYTg1SGlXRDVGUWorMnZLR1MzNjUzbVIvUks3RVk5?=
 =?utf-8?Q?JgM5vVWH8AJvPLq1Ypm8DNewG70KM1tjJcFuU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UStUNjlXUGZjMnpwMWRSeVh3eGpyOHZ6OFJGRFR5MU9UMU4wNlZJcnVscUgr?=
 =?utf-8?B?aVpFUVVwUG55OVE4dzFuMWpBeE8vYlFlMXNtTkRWL3FsN3ZmZVFaMUM0a1l6?=
 =?utf-8?B?Rm90NWFZQ2hsalRLa3BJYWIyaStEaWFOTXEvN2tXTGNaUmtRSTN2UitIdTdS?=
 =?utf-8?B?Yjc0amlEbDRQZWhReDBMMGFMaWpTWVIvcUsyZkc1T1Z2bHljSDBzZXNLT01v?=
 =?utf-8?B?NXN6WFVSSFlDZkJiZGcyd2s4bG1mTGR3ZGdtS2ZaNVVhVUQvWjNVNjdnR2k5?=
 =?utf-8?B?NXdhSUI1VERSZ2JOVWVub0pWbG9LTGJVL3M0NkNXZTJ2WFR6dHU3MVYzcHU0?=
 =?utf-8?B?enNSTTVqUzd6emxzdWpwUU1XbkNDNnY5aEw2NFIvUzJNd21GZU1TYmdoeWQ1?=
 =?utf-8?B?L25KRXdMNGRIRjZvRXRqNjBpdDhjRklwWkRzbFBSZDVqMTk1am16Tm9nQWJ5?=
 =?utf-8?B?Sms2bi9YdWNFZlB3eTdYa01mYkFPQmRrYVJoTkhiMUVEQ0J5RDhUbmNhczZQ?=
 =?utf-8?B?bkFhM2RyTXRlOWJDTlVXOGlzTTg5UlBranpZZm1VdStYSHB5YmZpVHdvL1dY?=
 =?utf-8?B?NzNiQnNPaDZMSXA3MVZCRVlNQ1hha2kralNiVUhTQUhjTHFNZXhhNGJLaStW?=
 =?utf-8?B?L1d4TTNVdmtNMnUwcFEzbXZZa1lPT1pXWHBIdy82ZExzVXNwdGlGazg2QzNm?=
 =?utf-8?B?dGJMVC9ZOEE2NU1Za1I2MkljU3J1STVDam4yVVY4ZEVoTnd3VzFZTUZFa0xV?=
 =?utf-8?B?djEzaGFITG4zN3AvRTVZeVF2cGFwTzdJRXUyMUoxQTk0MnpEZjFNNlVpUk9O?=
 =?utf-8?B?OTdtV3QreDlOQWRuOFc3alZ0WmtsWExkT1hKa2c1OXRXYWtDakw4SStQUXBM?=
 =?utf-8?B?eE5JdG5UY0JiK3lFenNjMUdqbVJpRjFBZHliWUZoaUdOSVZESWdsMWtZalgr?=
 =?utf-8?B?VXJndU9wVnFKYjVrSUNpbHVQY2pYTGMwaTJ1R2l0NnhVcVJSQkVveS95Und4?=
 =?utf-8?B?d3NmanJ0eGxNQUJzWHU2UzcySFZnOGpybVpTRkFHbHJBYVhTUTM4T3J6ZXRr?=
 =?utf-8?B?K2RiNE54SW1iUmxzcVJrZ3lMYkF2cmhrSk9MaTRhWWVOYWU4WFFwa3Q0dis0?=
 =?utf-8?B?TkphUlpSOE9tdmxtUFJrWkdFVkVnRS8xMHcrbEJrOG5OYmFkWTNDYnFKT1Z6?=
 =?utf-8?B?MDZvUWR4cFp4YnlZTmdQby9jS1pkUTlyR095MHlyNWw5Ly96NFlkVHZHMUNH?=
 =?utf-8?B?QnFGVlQySDBway9zcG1QNUxTMlRsckhLTG9lOGNLVWdWMzlsYTlLRTlKaHpq?=
 =?utf-8?B?YkRybktScE5iZllaWUYyQ1pra3htSXZiK3JGSGZ5ZHJWcExoT3Q4MWRGUHZY?=
 =?utf-8?B?T1ordmRKbGVZbHlpSUdYbmR3SjdxM2NTd1EvTVhFd0ZsanJ1b3ViaWRLYytz?=
 =?utf-8?B?ZWE4Y2ZValVQeGE3T3NOeERIWS8yVGloQndvOFAxOXc4b3dQeHFhdkVkSlJz?=
 =?utf-8?B?UThNZkh3OTVOM2R3TCs4Rkc5VVc5ZEZrUll2T1BmVDZTL0VCblc3VVd6emZH?=
 =?utf-8?B?RmNQR3NzZmxtNUFTclVsNEZOQi93MlZFUlVGbS9vWGtNbGdrNmNuRG5qZGMx?=
 =?utf-8?B?eHRlNW5ObVF0VnVUUXNWWHhFcjd5am44QTVOY1EwL0poeHFML2RWSTlrQkt5?=
 =?utf-8?B?a1VTR2Y5QnZvSjMxL3Nic3ZSVWxiNEtscE5VU05OTjIyRzI5MGtkUzFIYWM4?=
 =?utf-8?B?dmhNOTF3bGZTNmt5MFBnOHA5ZE5pQXhOWWxEV200TGFrc2dWM2xEc0ZyRHFG?=
 =?utf-8?B?QlZMeXpCZ2JlY1NlOFZpdWlVdDhtU2hGZ09kOFVGa2ZyL2w5OTlMeHFRMFp6?=
 =?utf-8?B?Mm1UK0sxNUo1UG9jMjFpNXhnSXF4L0hJZEV6eU0zUVJhNGRzdmZhQU9hMVlH?=
 =?utf-8?B?d215ZUtBWnVVSTVpZ0ozOEZKa0owVjFZNXZvNWJzRmlKL2RQZnBYWENPRkwv?=
 =?utf-8?B?Yzl6ZlNQRFdqMlhCaUNSVGMxa2YwcmtYaEI1Nnh3djZySldQTVplMWhYNm4w?=
 =?utf-8?B?WnJ4QldjOUVxZnVzVnp3Zzd4UEkxRUd3NUlRRHV3TkR2cTRmTGZNMDdoTnE1?=
 =?utf-8?Q?NV9g8HiB/5nrxRwGqAJUeWDVv?=
Content-ID: <153F0B86A663F74482B776850BDD3D28@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14c1e2af-8827-49ab-495c-08dd092a1a09
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2024 06:10:58.6535 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZIhNDoUwnGVSWSrop8JNly2qAz3CttsbU1jng5MzQtjP3IwHlCyeI0iGaGY3YYAdzszNKKcm4F1M/NIyo5BWZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8396
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--14.409000-8.000000
X-TMASE-MatchedRID: O/y65JfDwwtm6oeM5+OJFCaix8JZpk78jLOy13Cgb4+qvcIF1TcLYHB1
 e9+YlER9xxL5hQ2RIPjz6iVSaWDoXX45uBZmw209z5rIW0RbS5jXAvRa0tfJGgqiCYa6w8tv7vf
 jHqfMw2L20QuaA1ACTtb0cMVDXqkVX45573JlOaCeAiCmPx4NwMFrpUbb72MU1B0Hk1Q1KyLUZx
 EAlFPo846HM5rqDwqtH/Ur7hjyedK7zXtV0iAXShkFr+08pCvsXk/Kno2/3GQrWWgivZcMsQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--14.409000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 345688174BFC6B628DC1060872919099FB83A2E3B3575A0E4FC60CBDD92A46FB2000:8
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_009_2044150321.2076604005"
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

--__=_Part_Boundary_009_2044150321.2076604005
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFNodS1oc2lhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMC0wOSBhdCAxOToxNSArMDgwMCwgU2h1
LWhzaWFuZyBZYW5nIHdyb3RlOg0KPiBJbnRyb2R1Y2VzIHRoZSB0b3AgbWVkaWEgZGV2aWNlIGRy
aXZlciBmb3IgdGhlIE1lZGlhVGVrIElTUDdYIENBTVNZUy4NCj4gVGhlIGRyaXZlciBtYWludGFp
bnMgdGhlIGNhbWVyYSBzeXN0ZW0sIGluY2x1ZGluZyBzdWItZGV2aWNlIG1hbmFnZW1lbnQsDQo+
IERNQSBvcGVyYXRpb25zLCBhbmQgaW50ZWdyYXRpb24gd2l0aCB0aGUgVjRMMiBmcmFtZXdvcmsu
IEl0IGhhbmRsZXMNCj4gcmVxdWVzdCBzdHJlYW0gZGF0YSwgYnVmZmVyIG1hbmFnZW1lbnQsIGFu
ZCBNZWRpYVRlay1zcGVjaWZpYyBmZWF0dXJlcywNCj4gYW5kIHBpcGVsaW5lIG1hbmFnZW1lbnQs
IHN0cmVhbWluZyBjb250cm9sLCBlcnJvciBoYW5kbGluZyBtZWNoYW5pc20uDQo+IEFkZGl0aW9u
YWxseSwgaXQgYWdncmVnYXRlcyBzdWItZHJpdmVycyBmb3IgdGhlIGNhbWVyYSBpbnRlcmZhY2Us
IHJhdw0KPiBhbmQgeXV2IHBpcGVsaW5lcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFNodS1oc2lh
bmcgWWFuZyA8U2h1LWhzaWFuZy5ZYW5nQG1lZGlhdGVrLmNvbT4NCj4gLS0tDQoNCltzbmlwXQ0K
DQo+ICtzdGF0aWMgaW50IGlzcF9jb21wb3Nlcl9pbml0KHN0cnVjdCBtdGtfY2FtX2RldmljZSAq
Y2FtKQ0KPiArew0KPiArCXN0cnVjdCBkZXZpY2UgKmRldiA9IGNhbS0+ZGV2Ow0KPiArCWludCBy
ZXQ7DQo+ICsNCj4gKwlyZXQgPSBycHJvY19ib290KGNhbS0+cnByb2NfaGFuZGxlKTsNCj4gKwlp
ZiAocmV0KSB7DQo+ICsJCWRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIHJwcm9jX2Jvb3RcbiIpOw0K
PiArCQlyZXR1cm4gcmV0Ow0KPiArCX0NCj4gKw0KPiArCXJldCA9IHNjcF9pcGlfcmVnaXN0ZXIo
Y2FtLT5zY3AsIFNDUF9JUElfSVNQX0NNRCwNCj4gKwkJCSAgICAgICBpc3BfY29tcG9zZXJfaGFu
ZGxlciwgY2FtKTsNCj4gKwlpZiAocmV0KSB7DQo+ICsJCWRldl9lcnIoZGV2LCAiZmFpbGVkIHRv
IHJlZ2lzdGVyIElQSSBjbWRcbiIpOw0KPiArCQlyZXR1cm4gcmV0Ow0KPiArCX0NCj4gKw0KPiAr
CXJldCA9IHNjcF9pcGlfcmVnaXN0ZXIoY2FtLT5zY3AsIFNDUF9JUElfSVNQX0ZSQU1FLA0KPiAr
CQkJICAgICAgIGlzcF9jb21wb3Nlcl9oYW5kbGVyLCBjYW0pOw0KDQpTQ1BfSVBJX0lTUF9DTUQg
YW5kIFNDUF9JUElfSVNQX0ZSQU1FIHVzZSBkaWZmZXJlbnQgd2F5IHRvIGhhbmRsZXIgYWNrLg0K
U28gZG8gbm90IHVzZSB0aGUgY29tbW9uIGZ1bmN0aW9uIGlzcF9jb21wb3Nlcl9oYW5kbGVyIHRv
IGhhbmRsZXIgZGlmZmVyZW50IGNvbW1hbmQuDQpVc2UgZGlmZmVyZW50IGhhbmRsZXIgZnVuY3Rp
b24uDQoNClJlZ2FyZHMsDQpDSw0KDQo+ICsJaWYgKHJldCkgew0KPiArCQlkZXZfZXJyKGRldiwg
ImZhaWxlZCB0byByZWdpc3RlciBJUEkgZnJhbWVcbiIpOw0KPiArCQlnb3RvIHVucmVnX2lwaV9j
bWQ7DQo+ICsJfQ0KPiArDQo+ICsJcmV0dXJuIDA7DQo+ICsNCj4gK3VucmVnX2lwaV9jbWQ6DQo+
ICsJc2NwX2lwaV91bnJlZ2lzdGVyKGNhbS0+c2NwLCBTQ1BfSVBJX0lTUF9DTUQpOw0KPiArDQo+
ICsJcmV0dXJuIHJldDsNCj4gK30NCj4gKw0KDQo=

--__=_Part_Boundary_009_2044150321.2076604005
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtTaHUtaHNpYW5nOg0KDQpPbiYjMzI7V2Vk
LCYjMzI7MjAyNC0xMC0wOSYjMzI7YXQmIzMyOzE5OjE1JiMzMjsrMDgwMCwmIzMyO1NodS1oc2lh
bmcmIzMyO1lhbmcmIzMyO3dyb3RlOg0KJmd0OyYjMzI7SW50cm9kdWNlcyYjMzI7dGhlJiMzMjt0
b3AmIzMyO21lZGlhJiMzMjtkZXZpY2UmIzMyO2RyaXZlciYjMzI7Zm9yJiMzMjt0aGUmIzMyO01l
ZGlhVGVrJiMzMjtJU1A3WCYjMzI7Q0FNU1lTLg0KJmd0OyYjMzI7VGhlJiMzMjtkcml2ZXImIzMy
O21haW50YWlucyYjMzI7dGhlJiMzMjtjYW1lcmEmIzMyO3N5c3RlbSwmIzMyO2luY2x1ZGluZyYj
MzI7c3ViLWRldmljZSYjMzI7bWFuYWdlbWVudCwNCiZndDsmIzMyO0RNQSYjMzI7b3BlcmF0aW9u
cywmIzMyO2FuZCYjMzI7aW50ZWdyYXRpb24mIzMyO3dpdGgmIzMyO3RoZSYjMzI7VjRMMiYjMzI7
ZnJhbWV3b3JrLiYjMzI7SXQmIzMyO2hhbmRsZXMNCiZndDsmIzMyO3JlcXVlc3QmIzMyO3N0cmVh
bSYjMzI7ZGF0YSwmIzMyO2J1ZmZlciYjMzI7bWFuYWdlbWVudCwmIzMyO2FuZCYjMzI7TWVkaWFU
ZWstc3BlY2lmaWMmIzMyO2ZlYXR1cmVzLA0KJmd0OyYjMzI7YW5kJiMzMjtwaXBlbGluZSYjMzI7
bWFuYWdlbWVudCwmIzMyO3N0cmVhbWluZyYjMzI7Y29udHJvbCwmIzMyO2Vycm9yJiMzMjtoYW5k
bGluZyYjMzI7bWVjaGFuaXNtLg0KJmd0OyYjMzI7QWRkaXRpb25hbGx5LCYjMzI7aXQmIzMyO2Fn
Z3JlZ2F0ZXMmIzMyO3N1Yi1kcml2ZXJzJiMzMjtmb3ImIzMyO3RoZSYjMzI7Y2FtZXJhJiMzMjtp
bnRlcmZhY2UsJiMzMjtyYXcNCiZndDsmIzMyO2FuZCYjMzI7eXV2JiMzMjtwaXBlbGluZXMuDQom
Z3Q7JiMzMjsNCiZndDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtTaHUtaHNpYW5nJiMzMjtZYW5n
JiMzMjsmbHQ7U2h1LWhzaWFuZy5ZYW5nQG1lZGlhdGVrLmNvbSZndDsNCiZndDsmIzMyOy0tLQ0K
DQpbc25pcF0NCg0KJmd0OyYjMzI7K3N0YXRpYyYjMzI7aW50JiMzMjtpc3BfY29tcG9zZXJfaW5p
dChzdHJ1Y3QmIzMyO210a19jYW1fZGV2aWNlJiMzMjsqY2FtKQ0KJmd0OyYjMzI7K3sNCiZndDsm
IzMyOytzdHJ1Y3QmIzMyO2RldmljZSYjMzI7KmRldiYjMzI7PSYjMzI7Y2FtLSZndDtkZXY7DQom
Z3Q7JiMzMjsraW50JiMzMjtyZXQ7DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrcmV0JiMzMjs9JiMz
MjtycHJvY19ib290KGNhbS0mZ3Q7cnByb2NfaGFuZGxlKTsNCiZndDsmIzMyOytpZiYjMzI7KHJl
dCkmIzMyO3sNCiZndDsmIzMyOytkZXZfZXJyKGRldiwmIzMyOyZxdW90O2ZhaWxlZCYjMzI7dG8m
IzMyO3Jwcm9jX2Jvb3QmIzkyO24mcXVvdDspOw0KJmd0OyYjMzI7K3JldHVybiYjMzI7cmV0Ow0K
Jmd0OyYjMzI7K30NCiZndDsmIzMyOysNCiZndDsmIzMyOytyZXQmIzMyOz0mIzMyO3NjcF9pcGlf
cmVnaXN0ZXIoY2FtLSZndDtzY3AsJiMzMjtTQ1BfSVBJX0lTUF9DTUQsDQomZ3Q7JiMzMjsrJiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtpc3BfY29tcG9zZXJfaGFuZGxlciwmIzMy
O2NhbSk7DQomZ3Q7JiMzMjsraWYmIzMyOyhyZXQpJiMzMjt7DQomZ3Q7JiMzMjsrZGV2X2Vycihk
ZXYsJiMzMjsmcXVvdDtmYWlsZWQmIzMyO3RvJiMzMjtyZWdpc3RlciYjMzI7SVBJJiMzMjtjbWQm
IzkyO24mcXVvdDspOw0KJmd0OyYjMzI7K3JldHVybiYjMzI7cmV0Ow0KJmd0OyYjMzI7K30NCiZn
dDsmIzMyOysNCiZndDsmIzMyOytyZXQmIzMyOz0mIzMyO3NjcF9pcGlfcmVnaXN0ZXIoY2FtLSZn
dDtzY3AsJiMzMjtTQ1BfSVBJX0lTUF9GUkFNRSwNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyO2lzcF9jb21wb3Nlcl9oYW5kbGVyLCYjMzI7Y2FtKTsNCg0KU0NQ
X0lQSV9JU1BfQ01EJiMzMjthbmQmIzMyO1NDUF9JUElfSVNQX0ZSQU1FJiMzMjt1c2UmIzMyO2Rp
ZmZlcmVudCYjMzI7d2F5JiMzMjt0byYjMzI7aGFuZGxlciYjMzI7YWNrLg0KU28mIzMyO2RvJiMz
Mjtub3QmIzMyO3VzZSYjMzI7dGhlJiMzMjtjb21tb24mIzMyO2Z1bmN0aW9uJiMzMjtpc3BfY29t
cG9zZXJfaGFuZGxlciYjMzI7dG8mIzMyO2hhbmRsZXImIzMyO2RpZmZlcmVudCYjMzI7Y29tbWFu
ZC4NClVzZSYjMzI7ZGlmZmVyZW50JiMzMjtoYW5kbGVyJiMzMjtmdW5jdGlvbi4NCg0KUmVnYXJk
cywNCkNLDQoNCiZndDsmIzMyOytpZiYjMzI7KHJldCkmIzMyO3sNCiZndDsmIzMyOytkZXZfZXJy
KGRldiwmIzMyOyZxdW90O2ZhaWxlZCYjMzI7dG8mIzMyO3JlZ2lzdGVyJiMzMjtJUEkmIzMyO2Zy
YW1lJiM5MjtuJnF1b3Q7KTsNCiZndDsmIzMyOytnb3RvJiMzMjt1bnJlZ19pcGlfY21kOw0KJmd0
OyYjMzI7K30NCiZndDsmIzMyOysNCiZndDsmIzMyOytyZXR1cm4mIzMyOzA7DQomZ3Q7JiMzMjsr
DQomZ3Q7JiMzMjsrdW5yZWdfaXBpX2NtZDoNCiZndDsmIzMyOytzY3BfaXBpX3VucmVnaXN0ZXIo
Y2FtLSZndDtzY3AsJiMzMjtTQ1BfSVBJX0lTUF9DTUQpOw0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7
K3JldHVybiYjMzI7cmV0Ow0KJmd0OyYjMzI7K30NCiZndDsmIzMyOysNCg0KDQo8L3ByZT4NCjwv
cD48L2JvZHk+PC9odG1sPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxwcmU+KioqKioqKioqKioq
KiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlICoqKioqKioqKioqKioqKioqKioqDQpU
aGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGlu
ZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHBy
aXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBs
aWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUg
ZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJp
YnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGlu
Y2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMg
c3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90
IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZSANCnRoYXQg
eW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhl
IHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0
ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRh
Y2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRl
bnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+
PCEtLX0tLT4=

--__=_Part_Boundary_009_2044150321.2076604005--

