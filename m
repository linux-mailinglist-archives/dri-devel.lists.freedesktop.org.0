Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B3C9E8C9E
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 08:51:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3291410E49C;
	Mon,  9 Dec 2024 07:51:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="ovTgRXo8";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="rLJ1X563";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C3210E49C
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 07:51:43 +0000 (UTC)
X-UUID: 6d0b395eb60211efbd192953cf12861f-20241209
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=LrJWzi5wTxRqyDNGTRo+PDVKWoNr/ikEFuK8V4V3g6I=; 
 b=ovTgRXo8sW8ttPjhH9P+V+KVv9oDg/VKOr6FY6TP5k4ZnFSmFXAbYZIAik1c7o2wNzP8FG+847MXiOnKC4hCByBg8GxSCtMY5QUCLsClRqQFKjSMmY/cx1PI+4qnVp0l71Ym+qLWq15SLXFI/DRCgJAp5RM8EaJhZ18GHCZga1I=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45, REQID:e45b3633-117e-473d-b142-2fe318593bd8, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6493067, CLOUDID:5ea76c04-b3ca-4202-ba41-09fe265db19f,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
 :-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
 ,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 6d0b395eb60211efbd192953cf12861f-20241209
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1239398349; Mon, 09 Dec 2024 15:51:40 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 9 Dec 2024 15:51:39 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Mon, 9 Dec 2024 15:51:39 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dt4HSET3hYOpBhtz4cTVJe0DeH2wjKLEbX0D4SkvVRW+f3cgQ2GO6aApjLniqfghv/YexBZXlGEDRcj9skYuMsu388jozgoMPhF9SXnWKW+jMB2Znct77vpEapWqRAbIiMKHFL098ZojuFv8FOFDzpFVlO7D317P9XPsgSQ1DbjgHEKPn/bfah33CXDpC+F/mXmV/D+RmMEoAvzoIhoN9twU4Cl36769v18CFeYT2SACzr7imgmddktjxwLHT7oGgP93ccMqPsiM8QsLGvfTDhrzra6DvtEmGYT3D80Lgrsdd1r+XQYvE/GQ9674gzoAuRfkHh1WOeYcJ30S7dDrXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zl1GwCnXhpVktCV+03l40Zx9sUZprzROGCFyIYd3dvI=;
 b=IfP+WLDyZOdcS/AMUSQJNeYtCt62z3QONpfw186QK7mEIanzMYN/Pb8gHM0d+zms9DwmDJQPJg/z5DRWhYlX+MomI4Kbn+g/dxvcjPU4R0+07fOHefl7ffU7Brq1kouVHg/P8SiBXWHybNQeMUARkDWmUmdYYQ5VOKSQXkNz6xPBdKos+OYAk4gSxs081hZYbIfEG07wJpbyWHQcqJdfxHjlk2NGdRWWVVNk3tuePZ5VEQ0XiL+Qvv2jtvl8gDQWz+XH2GsZRmc7mUknPAoANDAYCND77uvCUdoGiRSb0GvqNX935JZ7SQTklogr77Qr9GXVkw7FWGVVZlBXvALLCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zl1GwCnXhpVktCV+03l40Zx9sUZprzROGCFyIYd3dvI=;
 b=rLJ1X563I9jT4ksqnsOgXVw8gqcfLCQE4dvANsnCaiAH2G2AMQ2VoLazQnSOfcPFAEYN/BVACOFnQWR+9th7bTaZGlBsn+ZF9RPQY+OPJxEE/qlxvcbN7lBxTy7gvSQrMU1uG8fWzSlQrypV5WTddboIIUfB+HahHmVkJS8pjNs=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB8165.apcprd03.prod.outlook.com (2603:1096:400:45e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.10; Mon, 9 Dec
 2024 07:51:31 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8207.014; Mon, 9 Dec 2024
 07:51:31 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "jie.qiu@mediatek.com"
 <jie.qiu@mediatek.com>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "mripard@kernel.org"
 <mripard@kernel.org>, =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?=
 <jitao.shi@mediatek.com>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "kernel@collabora.com" <kernel@collabora.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "junzhi.zhao@mediatek.com"
 <junzhi.zhao@mediatek.com>
Subject: Re: [PATCH v2 12/15] drm/mediatek: mtk_hdmi: Split driver and add
 common probe function
Thread-Topic: [PATCH v2 12/15] drm/mediatek: mtk_hdmi: Split driver and add
 common probe function
Thread-Index: AQHbRwuDKzLMLP8gmEqSnf1CFqiN77LdkDkA
Date: Mon, 9 Dec 2024 07:51:30 +0000
Message-ID: <df3c37dc2ef4ca9ea920ab9b5b759a1e98c420b5.camel@mediatek.com>
References: <20241205114518.53527-1-angelogioacchino.delregno@collabora.com>
 <20241205114518.53527-13-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20241205114518.53527-13-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB8165:EE_
x-ms-office365-filtering-correlation-id: 88f70084-11c6-48ec-8e40-08dd18264b70
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|1800799024|366016|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?OE1OcmZ1Z1R5WTBadEdMNGh5Ui9adkdtL05BdFlRdVlmN0NtaExyZVM4QTl4?=
 =?utf-8?B?M2ZGS2M3UXZLQTBnZWs0VWpzQmNGRkFIRU9rWVEzdTYxMGJRVUcyWjlMS3c1?=
 =?utf-8?B?MFRkMnZGVW9wdEJhTGxCSnFuTGpqNjU2VEd1WjNIcktpYzUvSllNOUJ3R1Vu?=
 =?utf-8?B?Q1E0UWEwazViZTZzTW5YZjl4R0IrbGZHSUdJSjJvRFF3Vmc5ZTZUTGE5UUs5?=
 =?utf-8?B?VDJaMm1uaDlqcVp5S0JNMllSb0tlTGY4bXNGdi8wSkMwajF6WnY5akhadlNx?=
 =?utf-8?B?QlVmUThHdllnaS9yUnRrK2pQMFJpZDNrWEF4MnJqYTM4bXJyOUh3K0ZyaXN1?=
 =?utf-8?B?elFKSyt0VVdmTEtnV1M0bWtXSHhjb0J4UWFXeVdnUjZjaW5nb0NaTG9DREI2?=
 =?utf-8?B?L0NjckRhOHBHYmMzajdUaGJvcms1cDVBNTVSMXg4WVNrQlFxckxJSkI0QVNG?=
 =?utf-8?B?TWRPZ1BCcy9FVmo2ZDg1bjJ1M01nLzMzV1VhT045RTRIUGVGZHB0QXVwS0F4?=
 =?utf-8?B?a1A4SnFvM2pKc3Z6ekRrRy85UU1xcEM3aTkxWDBMcFFCcnJmZFBENFhHY3By?=
 =?utf-8?B?alhYSE4zK0ozVGlmeVJCYi9lUk5iZUJrSWl0QWY5LzhpdWgzMm0zRHVQb0w1?=
 =?utf-8?B?WnRVRzV5MlVmOXJTbWpiSXF0N1JXSS9RZGM2d3M1c09pL1VWeExXK0RnRUpk?=
 =?utf-8?B?aysxRHBuM2tTSHJKeTJvTmtXUVBHemRHMHU5c3QxajZTa1dXZGgwcEVId29O?=
 =?utf-8?B?VzY2elB6WTNrTXl4Q1RTK25OcUFaR0toZzlhTlBhYTF6ZVRGQWtNZ2dJRHpU?=
 =?utf-8?B?SUJ3TzBUa0puNWhrM2xtYXBCWURNWXh3UUxCMWZQM25hRjhFam9RR3ZaNjda?=
 =?utf-8?B?Sy96Q1pOTW9MOHZqZTB1cjhiNTVBY1hnUnpYZFVmdFBlTlhyTWcyS0dyZnFv?=
 =?utf-8?B?Mk8xUXpHaTBaV2N5VkVNQVZNQ0YvcG91RGtWS3ZnZlVpa2JBL3pQM3E1bzJk?=
 =?utf-8?B?OUEveUlkRm40UXUrVkoyOFkyQXJSYkVpNWZ4R0pyTUwzZ3B4V2JvWm1KaDcr?=
 =?utf-8?B?bWtGVzhUU2FMOUtMUjF0SWpRREtkQjZoendSeTVpdXJlTW1PMzU3akxiMGJp?=
 =?utf-8?B?c3htaGNuTmF4OXA3WW9WWCsvNjZtQnQrSzkrdU9JTHh5TGRqZnRDRUgwZmMz?=
 =?utf-8?B?ZGJsNDhHb21WenpDYmlLWkE0c3lGVU9tVVhMNjZZYnBRVm9IQW9NdHo3N3Ry?=
 =?utf-8?B?UTQvTjZXcjQxQUR3TTcxdkNhcFFLSzM3TFlIWC80V2VKbUI4M1FEa3JsZ3E4?=
 =?utf-8?B?M2lEcjJnNVIwMUhWeDAzS2pnSTlHWnNFRlNROUtlV3VxSmhXY1RBaFZtMWRT?=
 =?utf-8?B?NGhQbG5ncG1LRDZRaE1KMUEyYkozNlh4T3F2ZVZLclFlOHlVZCtteGg0U0Za?=
 =?utf-8?B?Vi9QQWZvdFFKUHFhT0NYakN4bjZINXJEY0lkUGhaNytzZWxocUxqcWYxMlJV?=
 =?utf-8?B?azkwNjhIODZ5WG5UZ1dCUUxDdEZWWVJwMldjeFZpaTN1U0tWTzBsOEprT05v?=
 =?utf-8?B?dHdlVUVjUUhseWVJcUVPMUFNMDkyNmxVTTlpcllNZWUwTGZuYmE3YVNjR0pN?=
 =?utf-8?B?U2JkME5NbUwvTm40UjZ6bjhuYUdKNDdRNnVhQkdtUUdpYVpHQnJFdlJEa2ha?=
 =?utf-8?B?VjZJWFVwS3F5aGsycVJsMTA4M0pZRWpJTUVHZi9wZ0crc1dVM0NBOEpaSDJv?=
 =?utf-8?B?S2xuRTlocXEvY3Z3ZGZYdzJFNk5kS3RFUTk4Sm9aY25paytoSGVjbWE4a2pB?=
 =?utf-8?B?ekRvTzBlQnBwdCtub0lPMXJ1d2dOemZUL1lqQm9BV1gxNGsrcC9YV3YwemRq?=
 =?utf-8?B?c3h5OGl5Ukp5Rnl2TGRkK0xVSFE4WnhKK1JCdU9xRC93aUE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d2R5KzFoek1xUTNnSndGK2xUN0hJL0h4UmdvNFlIWlJ2VjhYaDF2bDNqeG9X?=
 =?utf-8?B?ZHVWTUIyTTZub2cyOFFLQnpZOGxSY1VaWm5DZUY2cmV2eS95TlY4dFM3RUR6?=
 =?utf-8?B?dFVxV040RVV3bm90TTRqcXFYcGIxaVY5bzVrbnFiY1BOS3dydk1CTXozeDlQ?=
 =?utf-8?B?UTl3RXNOR1ZUck1ISUhpWlpWOXNhS2Y4QVpPNHczMWNlUi9lZTMyZ3NNSUF1?=
 =?utf-8?B?c1FOemE5MWRwS0NIWGhJTVorRGNrb1pkQ0ozSVZOWnpqZWV5dzFKMmhxS3pU?=
 =?utf-8?B?Ynl3bUlLUWRhbDFLUThHbE9wbVRQQ3U2Wmg1OXBKd1VKWVFaYURyWE9xUGx3?=
 =?utf-8?B?T01hNWdnRUg2Z1ROcWg5dmhqTXZlMFJFQnNPaGhuODgzYXJUeU1EK2FHYUoy?=
 =?utf-8?B?TlY1MDV3aXQ3ZDhYais2SmJHT0xocGpjWDZwUTFQbDg3OU13ck50ZGQzMmxI?=
 =?utf-8?B?Q0NubkQrV2FnNlpmYzFYejhNd2ZxbHRlc1lHRmdXaGQ4SmpKU1JEclIrM05U?=
 =?utf-8?B?OWRmZHU4bm1XQXR5aUdZUHR0Mml6MTZqbk90M1hRdE1xTnhnS1IrRVJtZDlp?=
 =?utf-8?B?Z2ZYcnNzcVMrMUJRYWNUV0ZKdDVvUjZDUVVMYmJ5blF4MmJiQk01WmNZK0NR?=
 =?utf-8?B?V2lYWGxiSW1McHVPMXIxMkI2WnJyaVg0L2tNeStONy9NbDFubm04eUhsQnhX?=
 =?utf-8?B?WFNhZmJhVnVMUjJJY0hNMC9lTUN4RFQ5N0ZFK3FwN2JBUmNpYzVzQ05ad0hQ?=
 =?utf-8?B?QWNEL2txQkx6cUtlcS9TYlM4clA1NktaN2pHWHh3ZUhNOVRlQTh3NGcvU1JN?=
 =?utf-8?B?U3NBTlNkOXpGcXYzUnNrRUdZVWVQblRxZHJoQTYzdDcrOHlaKzQ5dUhBY2d3?=
 =?utf-8?B?RDE4dTBYbFFUTGpER0JCM1dHV1hiMnMyRFFqQ0lVeUJDMi90NHlGbU03cnAy?=
 =?utf-8?B?T1oycGZVZ2VOaDB2d2lwdXYyOG4yczA1VFBMdEhSSkx4TWRSZGtoYjQ3Q3Zv?=
 =?utf-8?B?TkVrT0NyYysyWXNON2w5WFhjZktKajNjWm45RDhaLzJRUUNSQmtWbzNYcEsr?=
 =?utf-8?B?NWpJeHBDOU1hTFpLU3NSY2RobXphenhoSXlDekczcnhxTWpGVUI3MFVqWGFR?=
 =?utf-8?B?eEYzZWowVDhTQ1AzcXJqd3ZsMVY5eVY5cWVHSmxnQ0Rpd0dxNVB4OENYNWFo?=
 =?utf-8?B?cDJwK1Y4NkN6SmJIRDFBZHR4NkJtTGdCWExXTXlIdHhZdyszRU5Fd0JWek8v?=
 =?utf-8?B?WUtoOXFvNWVXM0pOTllGcGpqZlNOOXNreENwNnRHRWI2OUdURzRjYS80WmNq?=
 =?utf-8?B?aVp3Ums3ZWVoVDhQR1NBamxNWWZ2TUpyc28zNWxCa2xyMHlDckdQZnRWODZZ?=
 =?utf-8?B?aGVlK3QwMC8xZ3NoQWFBZE9CeDdiTXdWSXBSblU4TFFDUEJjWXdmOHZQNUMw?=
 =?utf-8?B?VTFicmRKREJ1SDY3aWZJZTBlN3R4QXlwWEpiVmhtdnlMNmY1TVd6My9lMU0z?=
 =?utf-8?B?MUJQQ0puRWVCUE9DNkVvTUs0Qm1Va1BQMGlMenFWQW9CNC8xbUwzMFNYMUUx?=
 =?utf-8?B?TWVHOWZ2U3hVanMvaXpGc1VHTWtPY2hWcWRkRE5XU1AxRXdPSjNnblZoOEt6?=
 =?utf-8?B?MW5QdUhTSlMzcElSMmtUWVlPV2VJVHM2eitSVEVxMlB0bnBXcVFnTHI0bU9t?=
 =?utf-8?B?Wmd2dDY3RUVEU0NjUmtNdk8zeUF5eTBYakEvQUROa291OVZWUytORHpZdzRo?=
 =?utf-8?B?dUVCVGhxL2F4eDVnN1RwUlpLWU5yR0txUi95YTdteWpZWjhIdXlPM2RtUWxh?=
 =?utf-8?B?RHY3TGhLaEhMNXB3NTIrOFdLMmhDaFBKNWIwVFlSUC9TTjdxVnRVZVhhY05D?=
 =?utf-8?B?WENaSGNmNkhWMEVjWi92a1pLTzkxdlo4d0hGQXNvVXpjY2VQMlR2UzJmVFVj?=
 =?utf-8?B?S2Z2ak9mOGhnbm1NY1ZEZERtb3J0bTUxQTdCN2FPdHovRjNaNjVmd0VKelJ0?=
 =?utf-8?B?N205WjNoUUhpSjl4L1lWSE1lRXJwWXgvNXVXZzRqR1A4MFdWZUFmdVZQeWxk?=
 =?utf-8?B?N0JQVnlkQzMxVzlmZXdQV3JaZ1cvQ0FoUzEvQlRJSW1MNjgzQnNrYVI5dldR?=
 =?utf-8?Q?aHsO+IXm6EG5Z0t1TsqXyk6ha?=
Content-ID: <3387E578BDA94044B60E5333EF6ACB7B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88f70084-11c6-48ec-8e40-08dd18264b70
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2024 07:51:30.9762 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tAejAphsaO4AhtCsIbcTQeuE0o80H8t5YO6IFzRqaJMSAi628DLsmIzfAYHNXd6YLJFFnYzwjtMXRtiEZIf4gQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8165
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_005_215929744.6353989"
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

--__=_Part_Boundary_005_215929744.6353989
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEFuZ2VsbzoNCg0KT24gVGh1LCAyMDI0LTEyLTA1IGF0IDEyOjQ1ICswMTAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZp
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBJbiBwcmVwYXJhdGlvbiBm
b3IgYWRkaW5nIGEgbmV3IGRyaXZlciBmb3IgdGhlIEhETUkgVFggdjIgSVAsDQo+IHNwbGl0IG91
dCB0aGUgZnVuY3Rpb25zIHRoYXQgd2lsbCBiZSBjb21tb24gYmV0d2VlbiB0aGUgYWxyZWFkeQ0K
PiBwcmVzZW50IG10a19oZG1pICh2MSkgZHJpdmVyIGFuZCB0aGUgbmV3IG9uZS4NCj4gDQo+IFNp
bmNlIHRoZSBwcm9iZSBmbG93IGZvciBib3RoIGRyaXZlcnMgaXMgOTAlIHNpbWlsYXIsIGFkZCBh
IGNvbW1vbg0KPiBwcm9iZSBmdW5jdGlvbiB0aGF0IHdpbGwgYmUgY2FsbGVkIGZyb20gZWFjaCBk
cml2ZXIncyAucHJvYmUoKQ0KPiBjYWxsYmFjaywgYXZvaWRpbmcgbG90cyBvZiBjb2RlIGR1cGxp
Y2F0aW9uLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8g
PGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4NCj4gLS0tDQoNCltzbmlw
XQ0KDQo+ICtzdHJ1Y3QgbXRrX2hkbWkgKm10a19oZG1pX2NvbW1vbl9wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQ0KPiArew0KPiArICAgICAgIGNvbnN0IHN0cnVjdCBtdGtfaGRt
aV92ZXJfY29uZiAqdmVyX2NvbmY7DQo+ICsgICAgICAgc3RydWN0IGRldmljZSAqZGV2ID0gJnBk
ZXYtPmRldjsNCj4gKyAgICAgICBzdHJ1Y3QgbXRrX2hkbWkgKmhkbWk7DQo+ICsgICAgICAgaW50
IHJldDsNCj4gKw0KPiArICAgICAgIGhkbWkgPSBkZXZtX2t6YWxsb2MoJnBkZXYtPmRldiwgc2l6
ZW9mKCpoZG1pKSwgR0ZQX0tFUk5FTCk7DQo+ICsgICAgICAgaWYgKCFoZG1pKQ0KPiArICAgICAg
ICAgICAgICAgcmV0dXJuIEVSUl9QVFIoLUVOT01FTSk7DQo+ICsNCj4gKyAgICAgICBoZG1pLT5k
ZXYgPSBkZXY7DQo+ICsgICAgICAgaGRtaS0+Y29uZiA9IG9mX2RldmljZV9nZXRfbWF0Y2hfZGF0
YShkZXYpOw0KPiArICAgICAgIHZlcl9jb25mID0gaGRtaS0+Y29uZi0+dmVyX2NvbmY7DQo+ICsN
Cj4gKyAgICAgICBoZG1pLT5jbGsgPSBkZXZtX2tjYWxsb2MoZGV2LCB2ZXJfY29uZi0+bnVtX2Ns
b2Nrcywgc2l6ZW9mKCpoZG1pLT5jbGspLCBHRlBfS0VSTkVMKTsNCj4gKyAgICAgICBpZiAoIWhk
bWktPmNsaykNCj4gKyAgICAgICAgICAgICAgIHJldHVybiBFUlJfUFRSKC1FTk9NRU0pOw0KPiAr
DQo+ICsgICAgICAgaGRtaS0+cGh5ID0gZGV2bV9waHlfZ2V0KGRldiwgImhkbWkiKTsNCj4gKyAg
ICAgICBpZiAoSVNfRVJSKGhkbWktPnBoeSkpDQo+ICsgICAgICAgICAgICAgICByZXR1cm4gZGV2
X2Vycl9jYXN0X3Byb2JlKGRldiwgaGRtaS0+cGh5LCAiRmFpbGVkIHRvIGdldCBIRE1JIFBIWVxu
Iik7DQo+ICsNCj4gKyAgICAgICByZXQgPSBtdGtfaGRtaV9kdF9wYXJzZV9wZGF0YShoZG1pLCBw
ZGV2LCB2ZXJfY29uZi0+bXRrX2hkbWlfY2xvY2tfbmFtZXMsDQo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgdmVyX2NvbmYtPm51bV9jbG9ja3MpOw0KPiArICAgICAgIGlm
IChyZXQpDQo+ICsgICAgICAgICAgICAgICByZXR1cm4gRVJSX1BUUihyZXQpOw0KPiArDQo+ICsg
ICAgICAgcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgaGRtaSk7DQo+ICsNCj4gKyAgICAgICBy
ZXQgPSBtdGtfaGRtaV9yZWdpc3Rlcl9hdWRpb19kcml2ZXIoZGV2KTsNCj4gKyAgICAgICBpZiAo
cmV0KQ0KPiArICAgICAgICAgICAgICAgcmV0dXJuIGRldl9lcnJfcHRyX3Byb2JlKGRldiwgcmV0
LCAiQ2Fubm90IHJlZ2lzdGVyIEhETUkgQXVkaW8gZHJpdmVyXG4iKTsNCj4gKw0KPiArICAgICAg
IGhkbWktPmJyaWRnZS5mdW5jcyA9IHZlcl9jb25mLT5icmlkZ2VfZnVuY3M7DQo+ICsgICAgICAg
aGRtaS0+YnJpZGdlLm9wcyA9IERSTV9CUklER0VfT1BfREVURUNUIHwgRFJNX0JSSURHRV9PUF9F
RElEIHwgRFJNX0JSSURHRV9PUF9IUEQ7DQo+ICsgICAgICAgaGRtaS0+YnJpZGdlLnR5cGUgPSBE
Uk1fTU9ERV9DT05ORUNUT1JfSERNSUE7DQo+ICsgICAgICAgaGRtaS0+YnJpZGdlLm9mX25vZGUg
PSBwZGV2LT5kZXYub2Zfbm9kZTsNCj4gKw0KPiArICAgICAgIHJldCA9IGRldm1fZHJtX2JyaWRn
ZV9hZGQoZGV2LCAmaGRtaS0+YnJpZGdlKTsNCg0KWW91IGNoYW5nZSBkcm1fYnJpZGdlX2FkZCgp
IHRvIGRldm1fZHJtX2JyaWRnZV9hZGQoKS4gSWYgdGhpcyBpcyBuZWNlc3NhcnksIHNlcGFyYXRl
IHRoaXMgdG8gYSByZWZpbmVtZW50IHBhdGNoLg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiArICAgICAg
IGlmIChyZXQpDQo+ICsgICAgICAgICAgICAgICByZXR1cm4gZGV2X2Vycl9wdHJfcHJvYmUoZGV2
LCByZXQsICJGYWlsZWQgdG8gYWRkIGJyaWRnZVxuIik7DQo+ICsNCj4gKyAgICAgICByZXR1cm4g
aGRtaTsNCj4gK30NCj4gKw0KDQo=

--__=_Part_Boundary_005_215929744.6353989
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtBbmdlbG86DQoNCk9uJiMzMjtUaHUsJiMz
MjsyMDI0LTEyLTA1JiMzMjthdCYjMzI7MTI6NDUmIzMyOyswMTAwLCYjMzI7QW5nZWxvR2lvYWNj
aGlubyYjMzI7RGVsJiMzMjtSZWdubyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtFeHRlcm5hbCYjMzI7
ZW1haWwmIzMyOzomIzMyO1BsZWFzZSYjMzI7ZG8mIzMyO25vdCYjMzI7Y2xpY2smIzMyO2xpbmtz
JiMzMjtvciYjMzI7b3BlbiYjMzI7YXR0YWNobWVudHMmIzMyO3VudGlsJiMzMjt5b3UmIzMyO2hh
dmUmIzMyO3ZlcmlmaWVkJiMzMjt0aGUmIzMyO3NlbmRlciYjMzI7b3ImIzMyO3RoZSYjMzI7Y29u
dGVudC4NCiZndDsmIzMyOw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtJbiYjMzI7cHJlcGFyYXRpb24m
IzMyO2ZvciYjMzI7YWRkaW5nJiMzMjthJiMzMjtuZXcmIzMyO2RyaXZlciYjMzI7Zm9yJiMzMjt0
aGUmIzMyO0hETUkmIzMyO1RYJiMzMjt2MiYjMzI7SVAsDQomZ3Q7JiMzMjtzcGxpdCYjMzI7b3V0
JiMzMjt0aGUmIzMyO2Z1bmN0aW9ucyYjMzI7dGhhdCYjMzI7d2lsbCYjMzI7YmUmIzMyO2NvbW1v
biYjMzI7YmV0d2VlbiYjMzI7dGhlJiMzMjthbHJlYWR5DQomZ3Q7JiMzMjtwcmVzZW50JiMzMjtt
dGtfaGRtaSYjMzI7KHYxKSYjMzI7ZHJpdmVyJiMzMjthbmQmIzMyO3RoZSYjMzI7bmV3JiMzMjtv
bmUuDQomZ3Q7JiMzMjsNCiZndDsmIzMyO1NpbmNlJiMzMjt0aGUmIzMyO3Byb2JlJiMzMjtmbG93
JiMzMjtmb3ImIzMyO2JvdGgmIzMyO2RyaXZlcnMmIzMyO2lzJiMzMjs5MCUmIzMyO3NpbWlsYXIs
JiMzMjthZGQmIzMyO2EmIzMyO2NvbW1vbg0KJmd0OyYjMzI7cHJvYmUmIzMyO2Z1bmN0aW9uJiMz
Mjt0aGF0JiMzMjt3aWxsJiMzMjtiZSYjMzI7Y2FsbGVkJiMzMjtmcm9tJiMzMjtlYWNoJiMzMjtk
cml2ZXImIzM5O3MmIzMyOy5wcm9iZSgpDQomZ3Q7JiMzMjtjYWxsYmFjaywmIzMyO2F2b2lkaW5n
JiMzMjtsb3RzJiMzMjtvZiYjMzI7Y29kZSYjMzI7ZHVwbGljYXRpb24uDQomZ3Q7JiMzMjsNCiZn
dDsmIzMyO1NpZ25lZC1vZmYtYnk6JiMzMjtBbmdlbG9HaW9hY2NoaW5vJiMzMjtEZWwmIzMyO1Jl
Z25vJiMzMjsmbHQ7YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tJmd0Ow0K
Jmd0OyYjMzI7LS0tDQoNCltzbmlwXQ0KDQomZ3Q7JiMzMjsrc3RydWN0JiMzMjttdGtfaGRtaSYj
MzI7Km10a19oZG1pX2NvbW1vbl9wcm9iZShzdHJ1Y3QmIzMyO3BsYXRmb3JtX2RldmljZSYjMzI7
KnBkZXYpDQomZ3Q7JiMzMjsrew0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7Y29uc3QmIzMyO3N0cnVjdCYjMzI7bXRrX2hkbWlfdmVyX2NvbmYmIzMyOyp2ZXJf
Y29uZjsNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3N0cnVj
dCYjMzI7ZGV2aWNlJiMzMjsqZGV2JiMzMjs9JiMzMjsmYW1wO3BkZXYtJmd0O2RldjsNCiZndDsm
IzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3N0cnVjdCYjMzI7bXRrX2hk
bWkmIzMyOypoZG1pOw0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7aW50JiMzMjtyZXQ7DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjtoZG1pJiMzMjs9JiMzMjtkZXZtX2t6YWxsb2MoJmFtcDtwZGV2LSZn
dDtkZXYsJiMzMjtzaXplb2YoKmhkbWkpLCYjMzI7R0ZQX0tFUk5FTCk7DQomZ3Q7JiMzMjsrJiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtpZiYjMzI7KCFoZG1pKQ0KJmd0OyYjMzI7
KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyO3JldHVybiYjMzI7RVJSX1BUUigtRU5PTUVNKTsNCiZndDsmIzMy
OysNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO2hkbWktJmd0
O2RldiYjMzI7PSYjMzI7ZGV2Ow0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7aGRtaS0mZ3Q7Y29uZiYjMzI7PSYjMzI7b2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRh
KGRldik7DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjt2ZXJf
Y29uZiYjMzI7PSYjMzI7aGRtaS0mZ3Q7Y29uZi0mZ3Q7dmVyX2NvbmY7DQomZ3Q7JiMzMjsrDQom
Z3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtoZG1pLSZndDtjbGsm
IzMyOz0mIzMyO2Rldm1fa2NhbGxvYyhkZXYsJiMzMjt2ZXJfY29uZi0mZ3Q7bnVtX2Nsb2Nrcywm
IzMyO3NpemVvZigqaGRtaS0mZ3Q7Y2xrKSwmIzMyO0dGUF9LRVJORUwpOw0KJmd0OyYjMzI7KyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7aWYmIzMyOyghaGRtaS0mZ3Q7Y2xrKQ0K
Jmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3JldHVybiYjMzI7RVJSX1BUUigtRU5PTUVNKTsN
CiZndDsmIzMyOysNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
O2hkbWktJmd0O3BoeSYjMzI7PSYjMzI7ZGV2bV9waHlfZ2V0KGRldiwmIzMyOyZxdW90O2hkbWkm
cXVvdDspOw0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7aWYm
IzMyOyhJU19FUlIoaGRtaS0mZ3Q7cGh5KSkNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjty
ZXR1cm4mIzMyO2Rldl9lcnJfY2FzdF9wcm9iZShkZXYsJiMzMjtoZG1pLSZndDtwaHksJiMzMjsm
cXVvdDtGYWlsZWQmIzMyO3RvJiMzMjtnZXQmIzMyO0hETUkmIzMyO1BIWSYjOTI7biZxdW90Oyk7
DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjtyZXQmIzMyOz0mIzMyO210a19oZG1pX2R0X3BhcnNlX3BkYXRhKGhkbWksJiMzMjtwZGV2LCYj
MzI7dmVyX2NvbmYtJmd0O210a19oZG1pX2Nsb2NrX25hbWVzLA0KJmd0OyYjMzI7KyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7dmVyX2NvbmYtJmd0O251bV9jbG9ja3MpOw0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7aWYmIzMyOyhyZXQpDQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7cmV0dXJuJiMzMjtFUlJfUFRSKHJldCk7DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrJiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2
LCYjMzI7aGRtaSk7DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjtyZXQmIzMyOz0mIzMyO210a19oZG1pX3JlZ2lzdGVyX2F1ZGlvX2RyaXZl
cihkZXYpOw0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7aWYm
IzMyOyhyZXQpDQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7cmV0dXJuJiMzMjtkZXZfZXJy
X3B0cl9wcm9iZShkZXYsJiMzMjtyZXQsJiMzMjsmcXVvdDtDYW5ub3QmIzMyO3JlZ2lzdGVyJiMz
MjtIRE1JJiMzMjtBdWRpbyYjMzI7ZHJpdmVyJiM5MjtuJnF1b3Q7KTsNCiZndDsmIzMyOysNCiZn
dDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO2hkbWktJmd0O2JyaWRn
ZS5mdW5jcyYjMzI7PSYjMzI7dmVyX2NvbmYtJmd0O2JyaWRnZV9mdW5jczsNCiZndDsmIzMyOysm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO2hkbWktJmd0O2JyaWRnZS5vcHMmIzMy
Oz0mIzMyO0RSTV9CUklER0VfT1BfREVURUNUJiMzMjt8JiMzMjtEUk1fQlJJREdFX09QX0VESUQm
IzMyO3wmIzMyO0RSTV9CUklER0VfT1BfSFBEOw0KJmd0OyYjMzI7KyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7aGRtaS0mZ3Q7YnJpZGdlLnR5cGUmIzMyOz0mIzMyO0RSTV9NT0RF
X0NPTk5FQ1RPUl9IRE1JQTsNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyO2hkbWktJmd0O2JyaWRnZS5vZl9ub2RlJiMzMjs9JiMzMjtwZGV2LSZndDtkZXYub2Zf
bm9kZTsNCiZndDsmIzMyOysNCiZndDsmIzMyOysmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyO3JldCYjMzI7PSYjMzI7ZGV2bV9kcm1fYnJpZGdlX2FkZChkZXYsJiMzMjsmYW1wO2hk
bWktJmd0O2JyaWRnZSk7DQoNCllvdSYjMzI7Y2hhbmdlJiMzMjtkcm1fYnJpZGdlX2FkZCgpJiMz
Mjt0byYjMzI7ZGV2bV9kcm1fYnJpZGdlX2FkZCgpLiYjMzI7SWYmIzMyO3RoaXMmIzMyO2lzJiMz
MjtuZWNlc3NhcnksJiMzMjtzZXBhcmF0ZSYjMzI7dGhpcyYjMzI7dG8mIzMyO2EmIzMyO3JlZmlu
ZW1lbnQmIzMyO3BhdGNoLg0KDQpSZWdhcmRzLA0KQ0sNCg0KJmd0OyYjMzI7KyYjMzI7JiMzMjsm
IzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7aWYmIzMyOyhyZXQpDQomZ3Q7JiMzMjsrJiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsm
IzMyOyYjMzI7cmV0dXJuJiMzMjtkZXZfZXJyX3B0cl9wcm9iZShkZXYsJiMzMjtyZXQsJiMzMjsm
cXVvdDtGYWlsZWQmIzMyO3RvJiMzMjthZGQmIzMyO2JyaWRnZSYjOTI7biZxdW90Oyk7DQomZ3Q7
JiMzMjsrDQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtyZXR1
cm4mIzMyO2hkbWk7DQomZ3Q7JiMzMjsrfQ0KJmd0OyYjMzI7Kw0KDQoNCjwvcHJlPg0KPC9wPjwv
Ym9keT48L2h0bWw+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1F
RElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UNCiAqKioqKioqKioqKioqKioqKioqKg0KVGhl
IGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcg
YW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2
aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGlj
YWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRl
c2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1
dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNs
dWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0
cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBh
biBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUNCiANCnRoYXQg
eW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhl
IHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0
ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRh
Y2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRl
bnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+
PCEtLX0tLT4=

--__=_Part_Boundary_005_215929744.6353989--

