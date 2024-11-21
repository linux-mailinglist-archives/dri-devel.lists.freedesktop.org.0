Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 598B49D47A2
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 07:38:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93D8C10E191;
	Thu, 21 Nov 2024 06:38:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="U+NDSbtu";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="TWihZnSr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85CD610E3D6
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 06:38:18 +0000 (UTC)
X-UUID: 2dc2e982a7d311efbd192953cf12861f-20241121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=tkSnWImzYbqrNNzIke3cuYjRHl0fSYoz16Y+7gusacs=; 
 b=U+NDSbtuHX0mGWPqxbU3OdN96JubS7YeJr3NR38WwGKVbaQcVvM8aTUgxzlVe2Z9zIScDjTBhl1Ke7FnxEyqM+VcC89mSqoyNjWRgEVbxmUbSPp8ZR4JtAfJA3CPt1QmQAwBbmg1tgSUtAtB+A32K4P4AxsNzMkpzdLWw4Lv0mw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44, REQID:491305bd-3600-4ee7-9c7d-f166f440c151, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:464815b, CLOUDID:e9e428b9-596a-4e31-81f2-cae532fa1b81,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
 :-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
 ,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 2dc2e982a7d311efbd192953cf12861f-20241121
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1944851442; Thu, 21 Nov 2024 14:38:11 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 21 Nov 2024 14:38:10 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Thu, 21 Nov 2024 14:38:10 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZoKbmJG4ubKq/9IUWeaH9rbLvC7q4FOdK5zFXTus4/MpaBhEKRejM4KNg68p7IZ17SiqrSAFABOeLPOYMPro1EHx4cQ5+92LlYawx9BfeExxKBnHZd3q2fIM8cluVPp2yztpujRXY2yNB16e7by8e6HLQ4GGyJDgdGypMoir2GIiSVgGkl/bMR6I60maEwKkAMFnZ8+pNgPeA2NnWPO/FNmK30zglHhEOXfGmS9egoijmEZ/c0sU3J4tSsMwOdtJBNTNxcOM4AItqxd65jXgjIqbAjjyb4cMtF5zpcxQeoDIWEwXlVwOKua1g7if/xy7EDipNNPiZ8R3021vjqabVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HNGyxs7bEroDvK64MKV26uaKTJ1y49DnlJFSsQain5M=;
 b=FGpbBpCU8hGuWLE4jSbk91YAAUi+EL2fUthXT79aQlqcy7qGOII46ldIKLvm24llbk3nMHw+dto7dcBHRavN7f9qSwndRUpiLm3AM8jOT5Ufz+ZGknX0miGtoEBQDy1VIfbw3hKX+G3qv+C5oxwp2gdC6y5FYv+pZ+mO94NwaI1D+ga+kVxhsWaE9jSVZxlQqD9TALloY8u3E7Y2c7MaWDenS/pcFpMrdW5kNjEJzfTuou4N+yLcDW6EZKKi4sRzQtQxK2PUJrkaD1x6CICjyufyFtFMAzupaYqqSa/76reewqeDi8Ue/GMHFUsn4cnOtWDPSI/gdHunsiQeLm378Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HNGyxs7bEroDvK64MKV26uaKTJ1y49DnlJFSsQain5M=;
 b=TWihZnSrjmMS6vLV7KU+sIZIPRiTCkyk/EKLzpRk20X7vQaz7Aq9UvyRPnBCsjNVKMA60Nd0I5RgJdAgHVUKVmnGNNQop4oJCswyRK8ffT+PNietKayk95de7zOQuknRbFhkyhkjBFR7eGkuGG3Yx0XtJcc+Lk3FrBP0kx9NTV0=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by JH0PR03MB7467.apcprd03.prod.outlook.com (2603:1096:990:16::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.16; Thu, 21 Nov
 2024 06:38:07 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8158.017; Thu, 21 Nov 2024
 06:38:07 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, 
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "mchehab@kernel.org"
 <mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "jassisinghbrar@gmail.com"
 <jassisinghbrar@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "simona@ffwll.ch"
 <simona@ffwll.ch>, =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?=
 <Moudy.Ho@mediatek.com>, =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?=
 <Nancy.Lin@mediatek.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 4/8] soc: mediatek: mtk-cmdq: Add unsupported subsys ID
 programing flow
Thread-Topic: [PATCH 4/8] soc: mediatek: mtk-cmdq: Add unsupported subsys ID
 programing flow
Thread-Index: AQHbO83f8Xgq0HinZk+EoubT15Sx27LBSDwA
Date: Thu, 21 Nov 2024 06:38:07 +0000
Message-ID: <f637f72960e84efb88dc6ed8482ea7a0d6bfcd25.camel@mediatek.com>
References: <20241121042602.32730-1-jason-jh.lin@mediatek.com>
 <20241121042602.32730-5-jason-jh.lin@mediatek.com>
In-Reply-To: <20241121042602.32730-5-jason-jh.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|JH0PR03MB7467:EE_
x-ms-office365-filtering-correlation-id: b67e827e-4040-4f13-27bc-08dd09f70f53
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?eDhRT0FoaG5xR2RCRTdDR0dXN1k3UU9zcWR0WlBnMmhzZ1FydUhaMkpSL1Bj?=
 =?utf-8?B?QktxVDFYZnpPQ3RQSkJ1clNyeG5QVzlhRDVBa0lEaWVQTTRrQVNmdTVwT2x2?=
 =?utf-8?B?Z2JJNUJXTDhCUkcwdkl4WFpZYm9Jd05TaVNYMkR3dFVheVJub0tGTXVib3JY?=
 =?utf-8?B?VE5rVnhqVyszUUo1bk1vN0l0aHAwRUNSZkNIUjNnYjB0WWcvdWNlUFVVb3BP?=
 =?utf-8?B?cDRvT3FqWk1haEZQL0Fmd1hVeERqT0l3dkRxejZBQmd5WHRyNUhaRUtGSjdq?=
 =?utf-8?B?dHNtT1YwMUVDVkMxTDAyUGFEb0p5cU9sQmtpbWlTVitmUmkrblZrRTZKb1I4?=
 =?utf-8?B?bWtjNm5SRUdZcGdySmRjdUZRVlRzc0ZuTDc0QmpYQ2lWdmwybTB5WkpTWjdZ?=
 =?utf-8?B?NXJOVEU3VWk1bSt3WVpEQXo3SGNlSllmRGUreWd2YkhPbHU5TWYwNnllUEl5?=
 =?utf-8?B?ZUdZWFlFSlVoNE82SElPU0I5d1lWa3gyQjhVVWMzcEdwMS9ySUpRcUt1VkJv?=
 =?utf-8?B?L0RHZTV6eGE1Qmc0MjVnbmRNUm5McmFkdjFqWVJPVDQ2NlIxTVVGOVVEeVBD?=
 =?utf-8?B?MWxQb2hXZllGaFZUY1lPTjZoU0NXV2xhOUZady8rQ0ZUZ1AvdngxM1JKdVkv?=
 =?utf-8?B?anZ6YXFnWWxwQVFOTXN0RVA4ZXdCRlE2UG1NcWhhdFUrWnAralAxclRCbE9N?=
 =?utf-8?B?TUxmc3psTG1vdmpKd3dsMEJ6Ulk0bFdORUdsa3I0QVJBblZnRERQM2pEUElZ?=
 =?utf-8?B?ckhyUUxRUDNZRHNLaXJma2FHOHRiQng0aEwwU3ptbGl5b1lsWVFtSDV3YU52?=
 =?utf-8?B?TG5JNzhtMUdyQmtENXNuRjFsYll6aEdvWGdqR2Rkb2JiQ1d6Vjd5bkdPQmQ4?=
 =?utf-8?B?TzRqK2VuK2NPelRPallEVDVtRk03djlCdGJkUkRON2FyM0RTMDc4MXdWRUQz?=
 =?utf-8?B?M3ZVZ0g2Q3dKSFZIS1JCczQwZnM2WVJIVDZsaGdNSU1jN01DY1VMOXA4R1Rw?=
 =?utf-8?B?cVRkVVkxY1lQdzdtYndvNmxsdDBQc2VBR0JsNStGOUlyd1hyeGFaMkorcGdG?=
 =?utf-8?B?T0xyMTN6RmRtRHVDMlZDT09RUi9XSElKYUZQUTFCU3N5U0JlUUNFbUJrdXU1?=
 =?utf-8?B?OUwvdjhaL2Rwd21rWDZlUlhMQXZ1SE9EWXFydE02eXBWWk1vajVPU1JoYkVp?=
 =?utf-8?B?aVpraENaSng0QXdTNFhlK1haR2NuNG42OUxVWHZTZitkclYzNWdZODZwcWhS?=
 =?utf-8?B?a2lYVmdtemNLb0RiMnljZ050c0NXTVhQUDNWRUh5b25uc3NFekNQUWVkSjZE?=
 =?utf-8?B?dXNwZW85ZzJoWGhBMTl1Yy9RZW1HaVp6dSszQTBSYVRGV1NyRUdrcEtNWUk5?=
 =?utf-8?B?RUtDdWI4OFRrbEVJZUIxZ0dWTzV3VGVNbUdxRDA1aVBhNC85Z2tWclFKSml0?=
 =?utf-8?B?cDNQR3BIQVpSR2ZXYUFxQk9COSthK3Q4SGtodXpzd3N4Rlg0U0o1UDAwWm5T?=
 =?utf-8?B?d1ZEMTZrOEttZFJqQkEzYnRGc0dOcVRmWEZ6SldqQVVUbEYxOE9yOENqUXF0?=
 =?utf-8?B?VkxLcmtHeVdNQkluZW0xZnhTb3IrMlY2UjUyVHU4SVUrUEpoYXhQL253eDhD?=
 =?utf-8?B?eHUxa0hHWGNGTnlqVUxrN2ZlMkZjYjdlb29QOXdCZTF2MVVRWlhqT3duQWpD?=
 =?utf-8?B?SFNGZ0hTdE5ZU2hQS1Y1L2t6ZktkRGgzRW5GSDRhV1RCTUVPb0x6MUZ5UGg3?=
 =?utf-8?B?RFY1aXF3cVV1UFk1cis0ZWJPRkdkbXRpSXpPWjJUOVl3Nkh6ODU5QzhzWmUr?=
 =?utf-8?Q?HcMcSCHT4KDChF7oLsd1iTlivA9wetdh7nAQ8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QTNjR0NLaUNwZFVNQzd5aEZFN1dxK2tGTlBZaXZtNkhWNU4ydmF1UzBWU2Nm?=
 =?utf-8?B?b1RwMWQ0enh2WkZsYmJNLzd6czZCTGJWTmlrdklNeDFWOXVlNW9rc3VTOE1Z?=
 =?utf-8?B?bmlCcGJEUGxsU1NxYzROUmp2N1N1NS9FWDBxcExMTmtvOTkxLzd4eVdaYzZL?=
 =?utf-8?B?bGhuc2pHRVJmdEZSN0doMFp1YUdDMVFDN1VIYXVnb0tzWW1KbC93K1Vpd2xk?=
 =?utf-8?B?TVcwaTg1S3pTOE9qSG5JRDYxVFNSeU5DTHlITzRYU1lIOTdnMUMwbUdqSnF3?=
 =?utf-8?B?NXZHWjdZN0o0RnlYbGpIeVJCTzFGYnNYekVxTW9vZmozWDgwUWNZbTBob3hF?=
 =?utf-8?B?dStEZkdTYXhFZTIwS2g3TDhRUStDWHNvSHFHYkFIbHY5V3RZa1BLOXhFNkti?=
 =?utf-8?B?aVREajJGY3UwQWUrWXdINjA2TzZta3pxWTRBTTR1MGpQaG40TThVV2FYNVc0?=
 =?utf-8?B?RlRVZmtNbHhaNFUrNTE3TjhRNHQyZ0JxaTVnc2RmNGg0MWZSeVBmdXl4ckdQ?=
 =?utf-8?B?eGhBUkNQRHNmR3NsV3I1Yi9RVHNwQnoxdTBlL1BIL3NRTVZwTlpWdE91a1ZS?=
 =?utf-8?B?UERuOFREY1RKcjF1KzFGS01tNDlBV1BrYldZb053VWNsZFFFd1ZHK0hHTHRk?=
 =?utf-8?B?c2huK3hjN3JRaWJNVkJmamNTMWUrcjAzVUphYUlQK1A3UW9yVngvTVoyeFRD?=
 =?utf-8?B?Y0VhQTNDMWtpeGlLUWEySkY4K3AwOU1wdnVsakFKWDkrVlNwelA2dVhQMmR5?=
 =?utf-8?B?N0s4SnJzTjZCdkNXVm1jVGZ5UG1WV05ha1MrcWdVZndiaEYrckYwWURoR2l5?=
 =?utf-8?B?Wnlpb0FiUkRyZkErL3lJTFpRcDNjKzZoclBpbko5MVhyWkYxekhDblRtSGVU?=
 =?utf-8?B?bER2S3lrOWozQlFqcjRIQmIyS05BQ0g5SmhOY3NJMkVnUXVEaEJOV2R4cFNV?=
 =?utf-8?B?cUpuYWdIa1VSOEV1cXVkTGVsMHBSd3Vxc1U1UjZyd0FRN0k5UTdJRENpclRa?=
 =?utf-8?B?cC9Da1lnUHBOS3VjSkUvNENXa0oyRkwvcXNtd1lJZXFETmo0eXdvZS9zcHpZ?=
 =?utf-8?B?M1RMRjFVNWoyUHd1TTNNQVBsdFd4WHRFV1pGSFhLejkwaFg1ckxncGdtbWFW?=
 =?utf-8?B?VTdxUTZtOVRPVzV4R1ZEYjBWTU5idGdrc0VUSVZtNFNMbWNrWWIxTmwvSjIw?=
 =?utf-8?B?VERsZk5mNXNqZThBamlXN3lCMVV2MXJJaG1vQ2ZZVng2YjNJcXYwWnJoRTJ5?=
 =?utf-8?B?THF3Sy8vTEZrTDZWc0kwR3hiMWZJdnNsMzhDam56V2NvVmE2QUIrSnRNNUlp?=
 =?utf-8?B?UW9xLzFOemxILzN6R21SbnZLaXFzb2pHV3pFZzhselBjOUNWSDhtY2pDVE0v?=
 =?utf-8?B?K3NabXhLSmlrY3Q3Ym1iV0ErM0FQeEFncmpQb2RveExZZUhxVXNoSlFHMUFi?=
 =?utf-8?B?WElaWWYxa2xTR0xtSGhkaEdRUk5Dd0p1Szk2Vm1Ianl1Q3VmV2d6aG41ekZu?=
 =?utf-8?B?ZDFqVk5WcHZJZ0swTkhvbTh1MGdGNTZRL0s2MStkcTR6MXl5WUk1d3krZzlv?=
 =?utf-8?B?cHhVU096T0lYcUFjSU5QM2h6TzV2NmFtd1pxVXdPdDF4RUJqcU9KWHlKRC9O?=
 =?utf-8?B?aFcxeWNHUnp0ekt0bldlMEpLNXJnK1pWYis2Y2ZHVS9mSGVqY0YxNFBuSE1F?=
 =?utf-8?B?amt6MUxIQmtRR1lFOFBOZ0gvZDNPbDZseFROMXFob2FXZ0Q4SVREbkp4OW13?=
 =?utf-8?B?aW9HTWZsVTY3b1dWWjlwODI0N0Z5YkJNYzh5bHdmc1lVcEJ2SWs0K1lUeEVW?=
 =?utf-8?B?MEtmWjFhVDdjeUt0Z2ZPREhwZlgyN1NMQXlKalB6cmlzZEZuU1dwdVNJNWo1?=
 =?utf-8?B?cXdITjZITmVrRUZTV3Vqamk0Y0FOdE1RMllGZGZOMUdxYzJyWmxtTFdabXFU?=
 =?utf-8?B?YnNPdGd6VldIclVKeW9zZ0pCK29obHIzcEQ4OFRkUm9vNzNVdThzKytlNG1G?=
 =?utf-8?B?V0Z1VmdKUTBoSksrMjlQTzdOVlJtNUtYWGVmSWorOG1KK2RaR0FFRGNqaitv?=
 =?utf-8?B?TE02MTJ0ZkpTTFFva1dkd1M0ZW9zNytWS3hKVFUwWXlERVc3ODh2bmpwR0tX?=
 =?utf-8?B?YVVRV3VZUHVvMkphRHBLUzV1emNxazJHM1AySFVtL0V6ZjhFZllvRmUzeEEr?=
 =?utf-8?B?dFE9PQ==?=
Content-ID: <4AC7F60BFC15AF488C98CC82C622D31F@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b67e827e-4040-4f13-27bc-08dd09f70f53
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2024 06:38:07.4964 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2Fi1BQDJp3UIdAZUZevzHHITzlfbIT8h4UVwvZmsxtm9dESBL4tMnOGfde7uVUwoD5MMHQp7XD0VO8ywUYWZeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7467
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_005_1073759942.688541363"
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

--__=_Part_Boundary_005_1073759942.688541363
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEphc29uOg0KDQpPbiBUaHUsIDIwMjQtMTEtMjEgYXQgMTI6MjUgKzA4MDAsIEphc29uLUpI
LkxpbiB3cm90ZToNCj4gV2hlbiBHQ0UgZXhlY3V0ZXMgaW5zdHJ1Y3Rpb25zLCB0aGUgY29ycmVz
cG9uZGluZyBoYXJkd2FyZSByZWdpc3Rlcg0KPiBjYW4gYmUgZm91bmQgdGhyb3VnaCB0aGUgc3Vi
c3lzIElELg0KPiBGb3IgdW5zdXBwb3J0ZWQgc3Vic3lzIElEIGhhcmR3YXJlLCB0aGUgcGh5c2lj
YWwgYWRkcmVzcyBuZWVkIHRvIGJlIHVzZWQNCj4gdG8gZ2VuZXJhdGUgR0NFIGluc3RydWN0aW9u
cy4NCj4gDQo+IEFkZCB0aGUgcGFfYmFzZSBpbnRlcmZhY2UgdG8gdGhlIGluc3RydWN0aW9uIHBy
b2dyYW1taW5nIGZsb3cgZm9yIHRoZXNlDQo+IHVuc3VwcG9ydGVkIHN1YnN5cyBJRCBoYXJkd2Fy
ZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEphc29uLUpILkxpbiA8amFzb24tamgubGluQG1lZGlh
dGVrLmNvbT4NCj4gLS0tDQoNCltzbmlwXQ0KDQo+IC1pbnQgY21kcV9wa3Rfd3JpdGUoc3RydWN0
IGNtZHFfcGt0ICpwa3QsIHU4IHN1YnN5cywgdTE2IG9mZnNldCwgdTMyIHZhbHVlKQ0KPiAraW50
IGNtZHFfcGt0X3dyaXRlKHN0cnVjdCBjbWRxX3BrdCAqcGt0LCB1OCBzdWJzeXMsIHUzMiBwYV9i
YXNlLCB1MTYgb2Zmc2V0LCB1MzIgdmFsdWUpDQo+ICB7DQo+ICsJc3RydWN0IGNtZHFfY2xpZW50
ICpjbCA9IChzdHJ1Y3QgY21kcV9jbGllbnQgKilwa3QtPmNsOw0KPiAgCXN0cnVjdCBjbWRxX2lu
c3RydWN0aW9uIGluc3QgPSB7DQo+ICAJCS5vcCA9IENNRFFfQ09ERV9XUklURSwNCj4gIAkJLnZh
bHVlID0gdmFsdWUsDQo+ICAJCS5vZmZzZXQgPSBvZmZzZXQsDQo+ICAJCS5zdWJzeXMgPSBzdWJz
eXMNCj4gIAl9Ow0KPiAtCXJldHVybiBjbWRxX3BrdF9hcHBlbmRfY29tbWFuZChwa3QsIGluc3Qp
Ow0KPiArCWludCBlcnI7DQo+ICsNCj4gKwlpZiAoIWNsKSB7DQo+ICsJCXByX2VycigiJXMgJWQ6
IHBrdC0+Y2wgaXMgTlVMTCFcbiIsIF9fZnVuY19fLCBfX0xJTkVfXyk7DQo+ICsJCXJldHVybiAt
RUlOVkFMOw0KPiArCX0NCj4gKw0KPiArCWlmIChjbWRxX3N1YnN5c19pc192YWxpZChjbC0+Y2hh
biwgc3Vic3lzKSkgew0KDQpJIHdvdWxkIGxpa2UgdG8gaGF2ZSBhIG5ldyBBUEkgZm9yIG5vIHN1
YnN5cy4gTWF5YmUgY21kcV9wa3Rfd3JpdGVfcGEoKS4NCklmIHNvbWUgY2xpZW50IGRyaXZlciBh
bHdheXMgaGF2ZSBzdWJzeXMsIGl0IGNvdWxkIHVzZSBjbWRxX3BrdF93cml0ZSgpLg0KSWYgc29t
ZSBjbGllbnQgZHJpdmVyIGhhdmUgbm8gc3Vic3lzLCBpdCBjb3VsZCB1c2UgY21kcV9wa3Rfd3Jp
dGVfcGEoKS4NClRoaXMgd291bGQgcHJldmVudCBmcmVxdWVudGx5IGNvbmRpdGlvbmFsIGp1bXAg
aW4gdGhpcyBmdW5jdGlvbi4NCklmIHNvbWUgY2xpZW50IGRyaXZlciBoYXZlIHN1YnN5cyBpbiBz
b21lIFNvQyBhbmQgaGF2ZSBubyBzdWJzeXMgaW4gb3RoZXIgU29DLA0KbGV0IHRoZSBjb25kaXRp
b25hbCBqdW1wIGhhcHBlbiBpbiB0aGF0IGNsaWVudCBkcml2ZXIuDQooVGhlIGNsaWVudCBkcml2
ZXIgY291bGQgdXNlICdsaWtlbHknIG9yICd1bmxpa2VseScgdG8gdXB0aW1pemUpDQpJbiB0aGUg
dmlldyBwb2ludCB0byBsZXQgY2xpZW50IGRyaXZlciBoYXZlIGZpbmUtZ3JhaW5lZCBjb250cm9s
LA0KbWF5YmUgY2xpZW50IGNvdWxkIHVzZSBjbWRxX3BrdF9hc3NpZ24oKSBhbmQgY21kcV9wa3Rf
d3JpdGVfc192YWx1ZSgpIHRvIGFjaGlldmUgdGhpcyBzbyBpdCdzIG5vdCBuZWNlc3NhcnkgdG8g
aW52ZW50IG5ldyBBUEkuDQoNClJlZ2FyZHMsDQpDSw0KDQo+ICsJCWVyciA9IGNtZHFfcGt0X2Fw
cGVuZF9jb21tYW5kKHBrdCwgaW5zdCk7DQo+ICsJfSBlbHNlIHsNCj4gKwkJZXJyID0gY21kcV9w
a3RfYXNzaWduKHBrdCwgMCwgQ01EUV9BRERSX0hJR0gocGFfYmFzZSkpOw0KPiArCQlpZiAoZXJy
IDwgMCkNCj4gKwkJCXJldHVybiBlcnI7DQo+ICsNCj4gKwkJZXJyID0gY21kcV9wa3Rfd3JpdGVf
c192YWx1ZShwa3QsIDAsIENNRFFfQUREUl9MT1cob2Zmc2V0KSwgdmFsdWUpOw0KPiArCX0NCj4g
Kw0KPiArCXJldHVybiBlcnI7DQo+ICB9DQo+ICBFWFBPUlRfU1lNQk9MKGNtZHFfcGt0X3dyaXRl
KTsNCj4gIA0KDQo=

--__=_Part_Boundary_005_1073759942.688541363
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtKYXNvbjoNCg0KT24mIzMyO1RodSwmIzMy
OzIwMjQtMTEtMjEmIzMyO2F0JiMzMjsxMjoyNSYjMzI7KzA4MDAsJiMzMjtKYXNvbi1KSC5MaW4m
IzMyO3dyb3RlOg0KJmd0OyYjMzI7V2hlbiYjMzI7R0NFJiMzMjtleGVjdXRlcyYjMzI7aW5zdHJ1
Y3Rpb25zLCYjMzI7dGhlJiMzMjtjb3JyZXNwb25kaW5nJiMzMjtoYXJkd2FyZSYjMzI7cmVnaXN0
ZXINCiZndDsmIzMyO2NhbiYjMzI7YmUmIzMyO2ZvdW5kJiMzMjt0aHJvdWdoJiMzMjt0aGUmIzMy
O3N1YnN5cyYjMzI7SUQuDQomZ3Q7JiMzMjtGb3ImIzMyO3Vuc3VwcG9ydGVkJiMzMjtzdWJzeXMm
IzMyO0lEJiMzMjtoYXJkd2FyZSwmIzMyO3RoZSYjMzI7cGh5c2ljYWwmIzMyO2FkZHJlc3MmIzMy
O25lZWQmIzMyO3RvJiMzMjtiZSYjMzI7dXNlZA0KJmd0OyYjMzI7dG8mIzMyO2dlbmVyYXRlJiMz
MjtHQ0UmIzMyO2luc3RydWN0aW9ucy4NCiZndDsmIzMyOw0KJmd0OyYjMzI7QWRkJiMzMjt0aGUm
IzMyO3BhX2Jhc2UmIzMyO2ludGVyZmFjZSYjMzI7dG8mIzMyO3RoZSYjMzI7aW5zdHJ1Y3Rpb24m
IzMyO3Byb2dyYW1taW5nJiMzMjtmbG93JiMzMjtmb3ImIzMyO3RoZXNlDQomZ3Q7JiMzMjt1bnN1
cHBvcnRlZCYjMzI7c3Vic3lzJiMzMjtJRCYjMzI7aGFyZHdhcmUuDQomZ3Q7JiMzMjsNCiZndDsm
IzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtKYXNvbi1KSC5MaW4mIzMyOyZsdDtqYXNvbi1qaC5saW5A
bWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYjMzI7LS0tDQoNCltzbmlwXQ0KDQomZ3Q7JiMzMjstaW50
JiMzMjtjbWRxX3BrdF93cml0ZShzdHJ1Y3QmIzMyO2NtZHFfcGt0JiMzMjsqcGt0LCYjMzI7dTgm
IzMyO3N1YnN5cywmIzMyO3UxNiYjMzI7b2Zmc2V0LCYjMzI7dTMyJiMzMjt2YWx1ZSkNCiZndDsm
IzMyOytpbnQmIzMyO2NtZHFfcGt0X3dyaXRlKHN0cnVjdCYjMzI7Y21kcV9wa3QmIzMyOypwa3Qs
JiMzMjt1OCYjMzI7c3Vic3lzLCYjMzI7dTMyJiMzMjtwYV9iYXNlLCYjMzI7dTE2JiMzMjtvZmZz
ZXQsJiMzMjt1MzImIzMyO3ZhbHVlKQ0KJmd0OyYjMzI7JiMzMjt7DQomZ3Q7JiMzMjsrc3RydWN0
JiMzMjtjbWRxX2NsaWVudCYjMzI7KmNsJiMzMjs9JiMzMjsoc3RydWN0JiMzMjtjbWRxX2NsaWVu
dCYjMzI7Kilwa3QtJmd0O2NsOw0KJmd0OyYjMzI7JiMzMjtzdHJ1Y3QmIzMyO2NtZHFfaW5zdHJ1
Y3Rpb24mIzMyO2luc3QmIzMyOz0mIzMyO3sNCiZndDsmIzMyOyYjMzI7Lm9wJiMzMjs9JiMzMjtD
TURRX0NPREVfV1JJVEUsDQomZ3Q7JiMzMjsmIzMyOy52YWx1ZSYjMzI7PSYjMzI7dmFsdWUsDQom
Z3Q7JiMzMjsmIzMyOy5vZmZzZXQmIzMyOz0mIzMyO29mZnNldCwNCiZndDsmIzMyOyYjMzI7LnN1
YnN5cyYjMzI7PSYjMzI7c3Vic3lzDQomZ3Q7JiMzMjsmIzMyO307DQomZ3Q7JiMzMjstcmV0dXJu
JiMzMjtjbWRxX3BrdF9hcHBlbmRfY29tbWFuZChwa3QsJiMzMjtpbnN0KTsNCiZndDsmIzMyOytp
bnQmIzMyO2VycjsNCiZndDsmIzMyOysNCiZndDsmIzMyOytpZiYjMzI7KCFjbCkmIzMyO3sNCiZn
dDsmIzMyOytwcl9lcnIoJnF1b3Q7JXMmIzMyOyVkOiYjMzI7cGt0LSZndDtjbCYjMzI7aXMmIzMy
O05VTEwhJiM5MjtuJnF1b3Q7LCYjMzI7X19mdW5jX18sJiMzMjtfX0xJTkVfXyk7DQomZ3Q7JiMz
MjsrcmV0dXJuJiMzMjstRUlOVkFMOw0KJmd0OyYjMzI7K30NCiZndDsmIzMyOysNCiZndDsmIzMy
OytpZiYjMzI7KGNtZHFfc3Vic3lzX2lzX3ZhbGlkKGNsLSZndDtjaGFuLCYjMzI7c3Vic3lzKSkm
IzMyO3sNCg0KSSYjMzI7d291bGQmIzMyO2xpa2UmIzMyO3RvJiMzMjtoYXZlJiMzMjthJiMzMjtu
ZXcmIzMyO0FQSSYjMzI7Zm9yJiMzMjtubyYjMzI7c3Vic3lzLiYjMzI7TWF5YmUmIzMyO2NtZHFf
cGt0X3dyaXRlX3BhKCkuDQpJZiYjMzI7c29tZSYjMzI7Y2xpZW50JiMzMjtkcml2ZXImIzMyO2Fs
d2F5cyYjMzI7aGF2ZSYjMzI7c3Vic3lzLCYjMzI7aXQmIzMyO2NvdWxkJiMzMjt1c2UmIzMyO2Nt
ZHFfcGt0X3dyaXRlKCkuDQpJZiYjMzI7c29tZSYjMzI7Y2xpZW50JiMzMjtkcml2ZXImIzMyO2hh
dmUmIzMyO25vJiMzMjtzdWJzeXMsJiMzMjtpdCYjMzI7Y291bGQmIzMyO3VzZSYjMzI7Y21kcV9w
a3Rfd3JpdGVfcGEoKS4NClRoaXMmIzMyO3dvdWxkJiMzMjtwcmV2ZW50JiMzMjtmcmVxdWVudGx5
JiMzMjtjb25kaXRpb25hbCYjMzI7anVtcCYjMzI7aW4mIzMyO3RoaXMmIzMyO2Z1bmN0aW9uLg0K
SWYmIzMyO3NvbWUmIzMyO2NsaWVudCYjMzI7ZHJpdmVyJiMzMjtoYXZlJiMzMjtzdWJzeXMmIzMy
O2luJiMzMjtzb21lJiMzMjtTb0MmIzMyO2FuZCYjMzI7aGF2ZSYjMzI7bm8mIzMyO3N1YnN5cyYj
MzI7aW4mIzMyO290aGVyJiMzMjtTb0MsDQpsZXQmIzMyO3RoZSYjMzI7Y29uZGl0aW9uYWwmIzMy
O2p1bXAmIzMyO2hhcHBlbiYjMzI7aW4mIzMyO3RoYXQmIzMyO2NsaWVudCYjMzI7ZHJpdmVyLg0K
KFRoZSYjMzI7Y2xpZW50JiMzMjtkcml2ZXImIzMyO2NvdWxkJiMzMjt1c2UmIzMyOyYjMzk7bGlr
ZWx5JiMzOTsmIzMyO29yJiMzMjsmIzM5O3VubGlrZWx5JiMzOTsmIzMyO3RvJiMzMjt1cHRpbWl6
ZSkNCkluJiMzMjt0aGUmIzMyO3ZpZXcmIzMyO3BvaW50JiMzMjt0byYjMzI7bGV0JiMzMjtjbGll
bnQmIzMyO2RyaXZlciYjMzI7aGF2ZSYjMzI7ZmluZS1ncmFpbmVkJiMzMjtjb250cm9sLA0KbWF5
YmUmIzMyO2NsaWVudCYjMzI7Y291bGQmIzMyO3VzZSYjMzI7Y21kcV9wa3RfYXNzaWduKCkmIzMy
O2FuZCYjMzI7Y21kcV9wa3Rfd3JpdGVfc192YWx1ZSgpJiMzMjt0byYjMzI7YWNoaWV2ZSYjMzI7
dGhpcyYjMzI7c28mIzMyO2l0JiMzOTtzJiMzMjtub3QmIzMyO25lY2Vzc2FyeSYjMzI7dG8mIzMy
O2ludmVudCYjMzI7bmV3JiMzMjtBUEkuDQoNClJlZ2FyZHMsDQpDSw0KDQomZ3Q7JiMzMjsrZXJy
JiMzMjs9JiMzMjtjbWRxX3BrdF9hcHBlbmRfY29tbWFuZChwa3QsJiMzMjtpbnN0KTsNCiZndDsm
IzMyOyt9JiMzMjtlbHNlJiMzMjt7DQomZ3Q7JiMzMjsrZXJyJiMzMjs9JiMzMjtjbWRxX3BrdF9h
c3NpZ24ocGt0LCYjMzI7MCwmIzMyO0NNRFFfQUREUl9ISUdIKHBhX2Jhc2UpKTsNCiZndDsmIzMy
OytpZiYjMzI7KGVyciYjMzI7Jmx0OyYjMzI7MCkNCiZndDsmIzMyOytyZXR1cm4mIzMyO2VycjsN
CiZndDsmIzMyOysNCiZndDsmIzMyOytlcnImIzMyOz0mIzMyO2NtZHFfcGt0X3dyaXRlX3NfdmFs
dWUocGt0LCYjMzI7MCwmIzMyO0NNRFFfQUREUl9MT1cob2Zmc2V0KSwmIzMyO3ZhbHVlKTsNCiZn
dDsmIzMyOyt9DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrcmV0dXJuJiMzMjtlcnI7DQomZ3Q7JiMz
MjsmIzMyO30NCiZndDsmIzMyOyYjMzI7RVhQT1JUX1NZTUJPTChjbWRxX3BrdF93cml0ZSk7DQom
Z3Q7JiMzMjsmIzMyOw0KDQoNCjwvcHJlPg0KPC9wPjwvYm9keT48L2h0bWw+PCEtLXR5cGU6dGV4
dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBO
b3RpY2UgKioqKioqKioqKioqKioqKioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4g
dGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUg
Y29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVt
cHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQg
dG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55
IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcg
b3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBi
eSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkg
DQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRo
aXMgZS1tYWlsLCBvciBiZWxpZXZlIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFp
bCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJl
cGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRo
aXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBh
bmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3Ro
ZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_005_1073759942.688541363--

